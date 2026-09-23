#!/usr/bin/env python3
"""Compile and execute a real v3 trace through opt, runtime and reader."""
import argparse
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
FIXTURE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "tools"))
from trace_io import check_complete, collect_files, read_binary, read_files, read_trace


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--llvm-build", type=Path, default=ROOT.parents[1] / "build")
    parser.add_argument("--build-dir", type=Path, default=Path("/tmp/fieldanalysis-v2-build"))
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args()
    out = args.output_dir or Path(tempfile.mkdtemp(prefix="fieldanalysis-logical-"))
    out = out.resolve()
    if out.exists() and any(out.iterdir()):
        raise ValueError("output directory must be empty")
    out.mkdir(parents=True, exist_ok=True)
    llvm, build = args.llvm_build.resolve(), args.build_dir.resolve()
    commands = out / "commands.log"
    checks = []

    def run(*cmd, cwd=out, env=None):
        result = subprocess.run([str(x) for x in cmd], cwd=cwd, env=env,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
        with commands.open("a") as log:
            log.write("$ " + " ".join(map(str, cmd)) + "\n" + result.stdout + "\n")
        if result.returncode:
            raise AssertionError(f"command failed ({result.returncode}): {cmd}\n{result.stdout}")
        return result.stdout

    def check(name, ok):
        assert ok, name
        checks.append(name)
        print("PASS", name, flush=True)

    clang = shutil.which("clang")
    if not clang:
        raise RuntimeError("clang is required")
    run("cmake", "-S", ROOT, "-B", build, "-DLLVM_DIR=" + str(llvm / "lib/cmake/llvm"))
    run("cmake", "--build", build, "-j2")
    run(clang, "-O1", "-Xclang", "-disable-llvm-passes", "-fno-discard-value-names",
        "-g", "-S", "-emit-llvm", FIXTURE / "objects.c", "-o", out / "objects.ll")
    run(llvm / "bin/opt", "-load-pass-plugin=" + str(build / "FieldAnalysis.so"),
        "-passes=logical-trace", "-fa-logical-config=" + str(FIXTURE / "objects.json"),
        "-verify-each", "-S", out / "objects.ll", "-o", out / "instrumented.ll")
    run(llvm / "bin/llc", "-filetype=obj", "-relocation-model=pic",
        out / "instrumented.ll", "-o", out / "objects.o")
    run("cc", out / "objects.o", build / "runtime/libaffinity.a", "-pthread", "-o", out / "objects")
    env = dict(os.environ, FA_TRACE_DIR=str(out), TRACE_SAMPLE_RATE="1", TRACE_FLUSH_THRESHOLD="2")
    env.pop("TRACE_RUNTIME_SECONDS", None)
    run(out / "objects", env=env)
    rows = read_trace(out)
    check("binary/text v3 equivalence", rows == read_files(collect_files(out, text=True)))
    check("complete lifecycle and status", check_complete(out, rows))
    check("schema and scalar indexing", all(r["schema_version"] == 3 and
          r["field_path"] == "value" and len(r["logical_index"]) == 2 for r in rows))
    mapped = [r for r in rows if r["object_name"] == "mapped"]
    check("reused virtual address has different object IDs", len({r["object_id"] for r in mapped}) == 2 and
          len({r["address"] for r in mapped if r["logical_index"] == [0, 0]}) == 1)
    check("2D coordinates recovered", {tuple(r["logical_index"]) for r in mapped} == {(0, 0), (1, 1)})
    binary = Path(collect_files(out)[0])
    corrupt = out / "corrupt.bin"
    corrupt.write_bytes(binary.read_bytes()[:-1])
    try:
        read_binary(corrupt)
    except ValueError:
        check("truncated v3 rejected", True)
    else:
        raise AssertionError("truncated v3 accepted")
    run(sys.executable, ROOT / "tools/logical_runner.py",
        "--logical-config", FIXTURE / "objects.json", "--source", FIXTURE / "objects.c",
        "--llvm-build", llvm, "--build-dir", build,
        "--output-dir", out / "runner", "--compare-stdout")
    summary = json.loads((out / "runner/results.json").read_text())
    check("generic runner builds and exports complete v3 trace",
          summary["complete"] and summary["events"] == len(rows) and
          (out / "runner/events.csv").exists())
    for functions in (None, [], ["helper"]):
        case = out / ("default_functions" if functions is None else "empty_functions" if not functions else "selected_function")
        case.mkdir()
        config = {"objects": [{"kind": "global", "symbol": "value", "name": "value"}]}
        if functions is not None:
            config["functions"] = functions
        (case / "objects.json").write_text(json.dumps(config))
        run(llvm / "bin/opt", "-load-pass-plugin=" + str(build / "FieldAnalysis.so"),
            "-passes=logical-trace", "-fa-logical-config=" + str(case / "objects.json"),
            "-verify-each", "-S", ROOT / "test/trace_v2/functions.ll", "-o", case / "instrumented.ll", cwd=case)
        report = json.loads(next(case.glob("access_sites.*.json")).read_text())
        check(case.name + " selects expected functions",
              {site["function"] for site in report["sites"]} == ({"helper"} if functions else {"helper", "main", "fa_worker"}))
        rewritten = (case / "instrumented.ll").read_text()
        check(case.name + " relaxes parameter and call attributes",
              "captures(none)" not in rewritten and "nocapture" not in rewritten and " readonly" not in rewritten)
    for invalid in (None, "main", ["missing"], [1]):
        invalid_config = out / "invalid.json"
        invalid_config.write_text(json.dumps({"functions": invalid,
            "objects": [{"kind": "global", "symbol": "value", "name": "value"}]}))
        done = subprocess.run([str(llvm / "bin/opt"), "-load-pass-plugin=" + str(build / "FieldAnalysis.so"),
            "-passes=logical-trace", "-fa-logical-config=" + str(invalid_config),
            "-disable-output", str(ROOT / "test/trace_v2/functions.ll")], cwd=out,
            capture_output=True, text=True)
        check("invalid functions rejected: " + repr(invalid), done.returncode != 0 and "logical-trace:" in done.stderr)
    run(sys.executable, ROOT / "tools/logical_runner.py",
        "--logical-config", FIXTURE / "multifile.json",
        "--source", FIXTURE / "multifile_main.c", "--source", FIXTURE / "multifile_worker.c",
        "--llvm-build", llvm, "--build-dir", build,
        "--output-dir", out / "multifile", "--compare-stdout")
    summary = json.loads((out / "multifile/results.json").read_text())
    check("all source modules instrumented by default", summary["complete"] and
          summary["events"] == 2 and len(summary["instrumented_sources"]) == 2)
    result = {"passed": len(checks), "checks": checks, "events": len(rows), "output_dir": str(out)}
    (out / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
