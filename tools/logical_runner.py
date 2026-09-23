#!/usr/bin/env python3
"""Link source modules, instrument selected logical objects and compare with a baseline."""
import argparse
from collections import Counter
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[1]
from trace_io import check_complete, read_trace


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--logical-config", required=True, type=Path)
    parser.add_argument("--source", required=True, type=Path, action="append",
                        help="source module; repeat to link all sources before instrumentation")
    parser.add_argument("--clang", default=os.environ.get("CLANG", "clang"))
    parser.add_argument("--run-arg", action="append", default=[])
    parser.add_argument("--input", type=Path, action="append", default=[],
                        help="copy input file into execution directories using its basename")
    parser.add_argument("--compile-flag", action="append", default=[])
    parser.add_argument("--link-flag", action="append", default=[])
    parser.add_argument("--compare-stdout", action="store_true")
    parser.add_argument("--llvm-build", type=Path, default=ROOT.parents[1] / "build")
    parser.add_argument("--build-dir", type=Path, default=Path("/tmp/fieldanalysis-v2-build"))
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args(argv)
    sources = [source.resolve(strict=True) for source in args.source]
    config = args.logical_config.resolve(strict=True)
    selection = json.loads(config.read_text())
    if not isinstance(selection, dict) or not isinstance(selection.get("objects"), list) or not selection["objects"]:
        parser.error("logical config needs a nonempty objects array")
    functions = selection.get("functions", [])
    if not isinstance(functions, list) or any(not isinstance(n, str) or not n for n in functions):
        parser.error("functions must be an array of nonempty IR names; omit or use [] for all")
    out = (args.output_dir or Path(tempfile.mkdtemp(prefix="fieldanalysis-run-"))).resolve()
    if out.exists() and any(out.iterdir()):
        parser.error("output directory must be empty")
    out.mkdir(parents=True, exist_ok=True)
    traced, baseline = out / "traced", out / "baseline"
    traced.mkdir()
    baseline.mkdir()
    llvm, build = args.llvm_build.resolve(), args.build_dir.resolve()
    clang = shutil.which(args.clang)
    if not clang:
        parser.error("clang is required")
    inputs = [item.resolve(strict=True) for item in args.input]
    if len({item.name for item in inputs}) != len(inputs):
        parser.error("input basenames must be unique")
    for item in inputs:
        if not item.is_file():
            parser.error("inputs must be regular files")
        for destination in (traced, baseline):
            shutil.copyfile(item, destination / item.name)

    def run(command, cwd=out, env=None):
        command = [str(value) for value in command]
        try:
            done = subprocess.run(command, cwd=cwd, env=env, capture_output=True,
                                  text=True, timeout=120)
        except subprocess.TimeoutExpired as error:
            raise RuntimeError(f"command timed out: {command}") from error
        with (out / "commands.log").open("a") as f:
            f.write("$ " + " ".join(command) + "\n" + done.stdout + done.stderr + "\n")
        if done.returncode:
            raise RuntimeError(f"exit {done.returncode}: {command}\n{done.stderr[-3000:]}")
        return done.stdout

    run(["cmake", "-S", ROOT, "-B", build, "-DLLVM_DIR=" + str(llvm / "lib/cmake/llvm")])
    run(["cmake", "--build", build, "-j2"])
    modules = []
    for i, source in enumerate(sources):
        ir = out / f"source.{i}.ll"
        run([clang, "-O1", "-Xclang", "-disable-llvm-passes", "-fno-discard-value-names",
             "-g", *args.compile_flag, "-S", "-emit-llvm", source, "-o", ir])
        modules.append(ir)
    combined = out / "combined.ll"
    run([llvm / "bin/llvm-link", *modules, "-S", "-o", combined])
    rewritten = out / "instrumented.ll"
    run([llvm / "bin/opt", "-load-pass-plugin=" + str(build / "FieldAnalysis.so"),
         "-passes=logical-trace", "-fa-logical-config=" + str(config),
         "-verify-each", "-S", combined, "-o", rewritten], cwd=traced)
    for ir, name in ((combined, "baseline"), (rewritten, "traced")):
        run([llvm / "bin/llc", "-filetype=obj", "-relocation-model=pic", ir, "-o", out / f"{name}.o"])
    cpp_flags = ["-lstdc++"] if any(s.suffix in (".cpp", ".cc", ".cxx", ".C") for s in sources) else []
    run(["cc", out / "baseline.o", *args.link_flag, *cpp_flags, "-pthread", "-o", baseline / "app"])
    run(["cc", out / "traced.o", build / "runtime/libaffinity.a", *args.link_flag, *cpp_flags,
         "-pthread", "-o", traced / "app"])
    reference = run([baseline / "app", *args.run_arg], cwd=baseline)
    env = dict(os.environ, FA_TRACE_DIR=str(traced), TRACE_SAMPLE_RATE="1")
    env.pop("TRACE_RUNTIME_SECONDS", None)
    observed = run([traced / "app", *args.run_arg], cwd=traced, env=env)
    if args.compare_stdout and reference != observed:
        raise AssertionError("instrumented stdout differs from uninstrumented baseline")
    rows = read_trace(traced)
    check_complete(traced, rows)
    run([sys.executable, ROOT / "tools/export_trace.py", traced, "--require-complete",
         "--output", out / "events.csv"])
    counts = Counter(row["object_name"] for row in rows)
    result = {"source": [str(item) for item in sources], "logical_config": str(config),
              "events": len(rows), "objects": dict(counts), "complete": True,
              "traced": str(traced), "baseline_stdout": reference,
              "traced_stdout": observed, "compared_stdout": args.compare_stdout,
              "instrumented_sources": [str(source) for source in sources],
              "functions": functions}
    (out / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    print(f"PASS complete logical trace: {len(rows)} events; output: {out}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
