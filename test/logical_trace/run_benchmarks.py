#!/usr/bin/env python3
"""Run original Phoenix/Huron sources through frontend IR, logical pass and runtime."""
import argparse
from collections import Counter
import json
import os
from pathlib import Path
import shutil
import struct
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "tools"))
from trace_io import check_complete, read_trace


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--llvm-build", type=Path, default=ROOT.parents[1] / "build")
    parser.add_argument("--build-dir", type=Path, default=Path("/tmp/fieldanalysis-v2-build"))
    parser.add_argument("--output-dir", type=Path)
    args = parser.parse_args()
    out = (args.output_dir or Path(tempfile.mkdtemp(prefix="fieldanalysis-bench-"))).resolve()
    if out.exists() and any(out.iterdir()):
        parser.error("output directory must be empty")
    out.mkdir(parents=True, exist_ok=True)
    llvm, build = args.llvm_build.resolve(), args.build_dir.resolve()
    log = out / "commands.log"

    def run(cmd, cwd=out, env=None):
        cmd = [str(item) for item in cmd]
        try:
            done = subprocess.run(cmd, cwd=cwd, env=env, text=True,
                                  capture_output=True, timeout=120)
        except subprocess.TimeoutExpired as error:
            raise RuntimeError(f"command timed out: {cmd}") from error
        with log.open("a") as f:
            f.write("$ " + " ".join(cmd) + "\n" + done.stdout + done.stderr + "\n")
        if done.returncode:
            raise RuntimeError(f"exit {done.returncode}: {cmd}\n{done.stderr[-3000:]}")
        return done.stdout

    clang = shutil.which("clang")
    if not clang:
        parser.error("clang is required")
    run(["cmake", "-S", ROOT, "-B", build, "-DLLVM_DIR=" + str(llvm / "lib/cmake/llvm")])
    run(["cmake", "--build", build, "-j2"])
    cases = [
        ("phoenix", ROOT / "test/phoenix/matrix_multiply/matrix_mult_serial.c",
         ["-D_LINUX_"], ["2"],
         {"functions": ["matrix_mult"], "objects": [
             {"kind": "heap", "function": "main", "callee": "mmap", "ordinal": i,
              "name": name, "type": "i32", "shape": [2, 2]}
             for i, name in enumerate(("A", "B", "C"))]}),
        ("huron", ROOT / "test/Huron/linear_regression/linear_regression_pthread.c",
         ["-DTHREADS=4"], ["points.bin"],
         {"functions": ["linear_regression_pthread"], "objects": [
             {"kind": "heap", "function": "main", "callee": "mmap", "ordinal": 0,
              "name": "points", "type": "struct.POINT_T", "shape": [8],
              "field_names": ["x", "y"]},
             {"kind": "heap", "function": "main", "callee": "malloc", "ordinal": 0,
              "name": "args", "type": "struct.lreg_args", "shape": [4],
              "field_names": ["tid", "points", "num_elems", "SX", "SY", "SXX", "SYY", "SXY"]}]})]
    results = {}
    for name, source, flags, argv, config in cases:
        folder = out / name
        folder.mkdir()
        traced = folder / "traced"
        baseline = folder / "baseline"
        traced.mkdir()
        baseline.mkdir()
        if name == "phoenix":
            for target in (traced, baseline):
                (target / "matrix_file_A.txt").write_bytes(struct.pack("<4i", 1, 2, 3, 4))
                (target / "matrix_file_B.txt").write_bytes(struct.pack("<4i", 5, 6, 7, 8))
        else:
            points = bytes(v for xy in zip(range(1, 9), (2, 7, 4, 12, 9, 15, 13, 20)) for v in xy)
            for target in (traced, baseline):
                (target / "points.bin").write_bytes(points)
        (folder / "config.json").write_text(json.dumps(config, indent=2) + "\n")
        ir = folder / "source.ll"
        run([clang, "-O1", "-Xclang", "-disable-llvm-passes", "-fno-discard-value-names",
             "-g", *flags, "-S", "-emit-llvm", source, "-o", ir])
        run([llvm / "bin/llc", "-filetype=obj", "-relocation-model=pic", ir,
             "-o", folder / "baseline.o"])
        run(["cc", folder / "baseline.o", "-pthread", "-lm", "-o", baseline / "app"])
        run([llvm / "bin/opt", "-load-pass-plugin=" + str(build / "FieldAnalysis.so"),
             "-passes=logical-trace", "-fa-logical-config=" + str(folder / "config.json"),
             "-verify-each", "-S", ir, "-o", folder / "traced.ll"], cwd=traced)
        run([llvm / "bin/llc", "-filetype=obj", "-relocation-model=pic",
             folder / "traced.ll", "-o", folder / "traced.o"])
        run(["cc", folder / "traced.o", build / "runtime/libaffinity.a", "-pthread",
             "-lm", "-o", traced / "app"])
        reference = run([baseline / "app", *argv], cwd=baseline)
        env = dict(os.environ, FA_TRACE_DIR=str(traced), TRACE_SAMPLE_RATE="1")
        env.pop("TRACE_RUNTIME_SECONDS", None)
        observed = run([traced / "app", *argv], cwd=traced, env=env)
        if observed != reference:
            raise AssertionError(f"{name}: baseline and traced stdout differ")
        rows = read_trace(traced)
        check_complete(traced, rows)
        counts = Counter((r["object_name"], r["field_path"]) for r in rows)
        identities = {r["object_name"]: set() for r in rows}
        for row in rows:
            identities[row["object_name"]].add(tuple(row["logical_index"]))
        if name == "phoenix":
            if counts != {("A", "value"): 8, ("B", "value"): 8, ("C", "value"): 16}:
                raise AssertionError(f"unexpected Phoenix access counts: {counts}")
            if any(len(indexes) != 4 for indexes in identities.values()):
                raise AssertionError("Phoenix did not cover all four matrix coordinates")
        else:
            if counts[("points", "x")] != 3200 or counts[("points", "y")] != 3200:
                raise AssertionError(f"unexpected Huron point access counts: {counts}")
            if len(identities["points"]) != 8 or len(identities["args"]) != 4:
                raise AssertionError("Huron did not recover all array indices")
            threads = {row["thread_instance"] for row in rows}
            if len(threads) != 4 or not all(("args", field) in counts for field in
                                            ("SX", "SY", "SXX", "SYY", "SXY")):
                raise AssertionError("Huron threads or reduction fields missing")
        result = {"events": len(rows), "counts": {f"{obj}.{field}": count for (obj, field), count in counts.items()},
                  "indices": {obj: len(values) for obj, values in identities.items()},
                  "trace": str(traced), "baseline_stdout": reference}
        results[name] = result
        print(f"PASS {name}: {len(rows)} events, complete, output matches baseline", flush=True)
    (out / "results.json").write_text(json.dumps(results, indent=2) + "\n")
    print("results:", out / "results.json")


if __name__ == "__main__":
    main()
