#!/usr/bin/env python3
"""Build the actual plugin/runtime and assert static + dynamic trace semantics."""
import argparse
import csv
import json
import os
from pathlib import Path
import re
import shutil
import struct
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
FIXTURES = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "tools"))
from trace_io import (HEADER, RECORD, check_complete, collect_files, read_binary,
                      read_files, read_trace)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--llvm-build", default=str(ROOT.parents[1]/"build"))
    parser.add_argument("--build-dir", default="/tmp/fieldanalysis-v2-build")
    parser.add_argument("--output-dir")
    args = parser.parse_args()
    llvm = Path(args.llvm_build).resolve()
    build = Path(args.build_dir).resolve()
    out = Path(args.output_dir or tempfile.mkdtemp(prefix="fieldanalysis-v2-tests-"))
    if out.exists() and any(out.iterdir()):
        raise ValueError('Test output directory must be empty; omit --output-dir for a fresh run')
    out.mkdir(parents=True, exist_ok=True)
    log = open(out/"commands.log", "w")
    checks = []

    def run(cmd, cwd=out, env=None, expect=0):
        p = subprocess.run([str(x) for x in cmd], cwd=cwd, env=env,
                           text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        log.write("$ " + " ".join(str(x) for x in cmd) + "\n" + p.stdout + "\n")
        log.flush()
        if p.returncode != expect:
            print(p.stdout)
            raise AssertionError(f"exit {p.returncode}, expected {expect}: {cmd}")
        return p.stdout

    def check(name, condition):
        assert condition, name
        checks.append(name)
        print("PASS", name, flush=True)

    run(["cmake", "-S", ROOT, "-B", build, "-DLLVM_DIR="+str(llvm/"lib/cmake/llvm"), "-DCMAKE_BUILD_TYPE=Release"])
    run(["cmake", "--build", build, "-j2"])
    plugin, runtime = build/"FieldAnalysis.so", build/"runtime/libaffinity.a"
    opt = llvm/"bin/opt"
    lab = FIXTURES

    def instrument(name, source, pipeline="field-analysis", extra=()):
        case = out/name
        case.mkdir(exist_ok=True)
        dest = case/"instrumented.ll"
        output = run([opt, "-load-pass-plugin="+str(plugin), "-passes="+pipeline,
                      "-debug-pass-manager", "-verify-each", *extra, "-S", source, "-o", dest], cwd=case)
        return case, dest, output

    def count(ir):
        return len(re.findall(r"call void @__fa_record_access_v2\(", ir.read_text()))

    def execute(case, ir, driver=None, rate=1, threshold=2):
        run([llvm/"bin/llc", "-filetype=obj", "-relocation-model=pic", ir, "-o", case/"main.o"])
        cmd = ["cc", case/"main.o", runtime, "-pthread", "-o", case/"main"]
        if driver: cmd.insert(1, driver)
        run(cmd)
        env = dict(os.environ, TRACE_SAMPLE_RATE=str(rate), TRACE_FLUSH_THRESHOLD=str(threshold), FA_TRACE_DIR=str(case))
        env.pop("TRACE_RUNTIME_SECONDS", None)
        stdout = run([case/"main"], cwd=case, env=env)
        binary = read_trace(case)
        text = read_files(collect_files(case, text=True))
        check(case.name+": binary/text equivalence", binary == text)
        if rate == 1: check(case.name+": complete manifests and coverage", check_complete(case, binary))
        return binary, stdout

    case, ir, debug = instrument("multi", lab/"multi.ll")
    check("New PM executes module pass", "GEPFieldAnalysisPass" in debug)
    check("shared GEP gets three callbacks", count(ir) == 3)
    _, all_functions, _ = instrument("all_functions", FIXTURES/"functions.ll")
    check("omitted selection instruments main, helper and user fa_worker", count(all_functions) == 3)
    _, selected, _ = instrument("selected_function", FIXTURES/"functions.ll", extra=("-fa-function=helper",))
    check("explicit function selection limits callbacks", count(selected) == 1 and
          '"function":"helper"' in ''.join(p.read_text().replace(' ', '') for p in (out/'selected_function').glob('access_sites.*.json')))
    rows, _ = execute(case, ir)
    check("R/W/R at one address, each four bytes", [r["mode"] for r in rows] == ["R","W","R"] and
          {r["access_size"] for r in rows} == {4} and len({r["address"] for r in rows}) == 1)
    check("real clock, logical CPU and OS thread", all(r["timestamp_ns"] > 0 and r["cpu_id"] >= 0 and r["os_tid"] > 0 for r in rows))
    export = case/"events.csv"
    run([sys.executable, ROOT/"tools/export_trace.py", case, "--output", export, "--require-complete"])
    check("six-field CSV exported", len(list(csv.DictReader(export.open()))) == 3)
    _, empty, _ = instrument("geponly", lab/"geponly.ll")
    check("GEP-only gets no callback", count(empty) == 0)
    c, scalar, _ = instrument("scalar", lab/"scalar.ll")
    check("scalar without struct is instrumented", count(scalar) == 2)
    rr, _ = execute(c, scalar)
    check("scalar dynamic W/R", [r["mode"] for r in rr] == ["W","R"])
    _, twice, _ = instrument("twice", lab/"multi.ll", "field-analysis,field-analysis")
    check("no duplicate instrumentation", count(twice) == 3)
    _, analyzed, _ = instrument("analysis", lab/"multi.ll", extra=("-field-analysis-only",))
    check("analysis only does not mark or mutate IR", "fieldanalysis.v2" not in analyzed.read_text() and count(analyzed) == 0)
    _, after, _ = instrument("after_analysis", analyzed)
    check("analysis output remains instrumentable", count(after) == 3)
    _, automatic, debug = instrument("default", lab/"multi.ll", "default<O1>")
    check("default optimizer extension point runs", count(automatic) == 3 and "GEPFieldAnalysisPass" in debug)
    c, memory, _ = instrument("memory", FIXTURES/"memory.ll")
    rr, _ = execute(c, memory)
    check("atomic and memory-intrinsic modes", [r["mode"] for r in rr] ==
          ["W","R","W","R","RMW","RMW","R","W","R","R","W","R","W","W"])
    check("actual instruction/range byte widths", [r["access_size"] for r in rr] ==
          [1,1,8,8,8,8,8,16,16,7,7,5,5,3])
    check("cmpxchg success/failure observed after instruction", all(rr[i]["flags"] & 4 for i in (5,6)))
    c, worker, _ = instrument("threads", FIXTURES/"worker.ll")
    rr, stdout = execute(c, worker, FIXTURES/"threads.c")
    check("loop-external GEP preserves all 100 dynamic accesses", len(rr) == 100)
    check("two OS threads and thread instances", len({r["os_tid"] for r in rr}) == len({r["thread_instance"] for r in rr}) == 2)
    cpus = {int(x) for x in re.search(r"bound_cpus=(\d+,\d+)", stdout).group(1).split(",")}
    check("observed CPUs match affinity", {r["cpu_id"] for r in rr} == cpus)
    check("numeric ordering beyond chunk 10", len(collect_files(c)) == 50)
    for thread in {r["thread_instance"] for r in rr}:
        events = [r for r in rr if r["thread_instance"] == thread]
        check(f"thread {thread} order and width", [r["thread_seq"] for r in events] == list(range(1,51)) and
              [r["mode"] for r in events] == ["W","R"]*25 and {r["access_size"] for r in events} == {4})
    c, sampled, _ = instrument("sampled", lab/"multi.ll")
    rr, _ = execute(c, sampled, rate=2)
    check("sampling explicitly counted", len(rr) == 2)
    try: check_complete(c, rr)
    except ValueError: check("sampling cannot claim completeness", True)
    else: raise AssertionError("sampled trace accepted")
    corrupt = out/"corrupt.bin"
    corrupt.write_bytes(Path(collect_files(out/"multi")[0]).read_bytes()[:-1])
    try: read_binary(corrupt)
    except ValueError: check("truncated v2 rejected", True)
    else: raise AssertionError("truncated trace accepted")
    legacy = out/"legacy.bin"
    legacy.write_bytes(struct.pack("<QIxxxxQib3x", 1, 0, 4096, 1, ord("G")))
    old = read_binary(legacy)[0]
    check("legacy fields not fabricated", old["timestamp_ns"] is None and old["access_size"] is None and old["cpu_id"] is None)
    # All legacy consumers must read v2 without dropping access fields.
    case = out/'multi'
    run([sys.executable, ROOT/'tools/resolve_trace.py', case, '--strict'], cwd=case)
    resolved = []
    for path in case.glob('variable_trace.*.txt'):
        with path.open() as f: resolved.extend(csv.DictReader(f))
    check('resolved labels preserve six fields', len(resolved) == 3 and
          all(r['access_size'] == '4' and r['cpu_id'] and r['os_tid'] and r['timestamp_ns'] for r in resolved))
    run([sys.executable, ROOT/'tools/build_address_map.py', case], cwd=case)
    run([sys.executable, ROOT/'tools/build_dfg.py', case, '--decode', 'decoded.csv'], cwd=case)
    check('legacy graph decoder uses actual access width',
          all(r['access_size'] == '4' for r in csv.DictReader((case/'decoded.csv').open())))
    run([sys.executable, ROOT/'tools/analyze.py'], cwd=case)
    check('legacy affinity analysis accepts v2', (case/'reorder.json').exists())
    check('default pipeline drops obsolete memory/function attributes',
          ' nofree ' not in automatic.read_text() and 'argmem: none' not in automatic.read_text())
    # Disallow incomplete/unsupported operations instead of silently claiming coverage.
    c, unsupported, _ = instrument('unsupported', FIXTURES/'unsupported.ll')
    reports = [json.loads(p.read_text()) for p in c.glob('access_sites.*.json')]
    check('unsupported scalable/address-space accesses reported',
          sum(r['unsupported_instructions'] for r in reports) == 3 and count(unsupported) == 0)
    # Dynamic intrinsic lengths, including a runtime zero, use the SSA length.
    c, dynamic, _ = instrument('dynamic', FIXTURES/'dynamic.ll')
    rr, _ = execute(c, dynamic)
    check('dynamic length and zero-size suppression', len(rr) == 2 and
          [r['access_size'] for r in rr] == [6,6] and [r['mode'] for r in rr] == ['R','W'])
    # Runtime source also compiles warning-free independently of CMake defaults.
    run(['cc', '-std=c11', '-Wall', '-Wextra', '-Werror', '-pthread', '-c',
         ROOT/'runtime/libaffinity.c', '-o', out/'runtime-warnings.o'])
    check('runtime compiles with strict warnings', True)
    # Corrupt versions and duplicated chunks cannot enter an apparently valid stream.
    payload = bytearray(Path(collect_files(out/'multi')[0]).read_bytes())
    payload[8:12] = struct.pack('<I', 99)
    corrupt.write_bytes(payload)
    try: read_binary(corrupt)
    except ValueError: check('unknown schema rejected', True)
    else: raise AssertionError('unknown schema accepted')
    one = collect_files(out/'multi')[0]
    try: read_files([one,one])
    except ValueError: check('duplicate events rejected', True)
    else: raise AssertionError('duplicate events accepted')
    rows = read_trace(out/'multi')
    orphan = dict(rows[0], thread_instance=999)
    try: check_complete(out/'multi', rows + [orphan])
    except ValueError: check('event without a thread manifest rejected', True)
    else: raise AssertionError('unregistered thread event accepted')
    run([sys.executable, '-m', 'py_compile', *[str(p) for p in (ROOT/'tools').glob('*.py')]])
    check('all Python tools compile', True)
    # Source-level exercise: this machine has clang19; consume its simple
    # textual IR using opt22, never load a 22 plugin into clang19.
    clang = shutil.which('clang')
    if clang:
        run([clang, '-O1', '-g', '-S', '-emit-llvm', FIXTURES/'source.c', '-o', out/'source.ll'])
        c, ir, _ = instrument('source', out/'source.ll')
        rr, _ = execute(c, ir)
        check('C source -> IR -> opt22 -> llc22 -> runtime',
              len(rr) == 3 and [r['mode'] for r in rr] == ['R','W','R'])
        run([clang, '-O1', '-S', '-emit-llvm', '-pthread', ROOT/'runtime/libaffinity.c',
             '-o', out/'runtime.ll'])
        _, ir, _ = instrument('runtime_exclusion', out/'runtime.ll')
        check('runtime functions excluded from self-instrumentation', count(ir) == 0)
    missing = out/'nonexistent-output-directory'
    env = dict(os.environ, FA_TRACE_DIR=str(missing), TRACE_FLUSH_THRESHOLD='2', TRACE_SAMPLE_RATE='1')
    env.pop('TRACE_RUNTIME_SECONDS', None)
    msg = run([out/'multi/main'], env=env)
    check('IO failure is explicit', 'failed writing' in msg and 'cannot write' in msg)
    try: check_complete(missing, [])
    except ValueError: check('IO failure cannot certify complete capture', True)
    else: raise AssertionError('missing capture accepted')
    # Per-instruction marking supports a later pass on partly instrumented IR.
    partial = out/'partial.ll'
    original = (out/'multi/instrumented.ll').read_text()
    original += '\ndefine i32 @late_load() {\n  %x = load volatile i32, ptr @pair\n  ret i32 %x\n}\n'
    partial.write_text(original)
    c, ir, _ = instrument('partial', partial)
    check('partially instrumented module gains only new access', count(ir) == 4)
    modules = re.findall(r'call void @__fa_record_access_v2\(i64 (-?\d+)', ir.read_text())
    check('new instrumentation round has separate site namespace', len(set(modules)) == 2)
    result = {"passed": len(checks), "checks": checks, "output_dir": str(out),
              "llvm": run([opt,"--version"]), "plugin": str(plugin)}
    (out/"results.json").write_text(json.dumps(result, indent=2)+"\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
