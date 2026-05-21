#!/usr/bin/env python3
"""FieldAnalysis Generic Test Runner

A unified runner that separates the fixed FieldAnalysis pipeline
from test-case-specific variables. Users define test cases via
JSON config files; this script handles the full pipeline.

Usage:
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --variant pthreads
    python3 tools/fa_runner.py --discover
    python3 tools/fa_runner.py --template test/my_project/fa_test.json

    # 1. 串行版（默认）
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json
    
    # 2. 多线程版（4 线程）
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --variant pthreads --nthreads 4
    
    # 3. SIMD 向量化版
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --variant simd
    
    # 4. 查看所有可用变体
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --list
    
    # 5. 自动发现所有测试
    python3 tools/fa_runner.py --discover
    
    # 6. 先试运行看命令（不实际执行）
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --dry-run
    
    # 7. 带运行时控制
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --trace-seconds 30 --trace-sample 100
    
    # 8. 只运行分析步骤（跳过编译）
    python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --steps 5-9
"""

import argparse
import json
import os
import shutil
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, List, Optional


class Colors:
    RESET = "\033[0m"
    BOLD = "\033[1m"
    RED = "\033[31m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    BLUE = "\033[34m"
    CYAN = "\033[36m"

    @staticmethod
    def supports_color():
        return hasattr(sys.stdout, "isatty") and sys.stdout.isatty()


class Log:
    @staticmethod
    def step(msg):
        c = Colors
        if Colors.supports_color():
            print(f"\n{c.BOLD}{c.CYAN}=== {msg} ==={c.RESET}")
        else:
            print(f"\n=== {msg} ===")

    @staticmethod
    def info(msg):
        c = Colors
        if Colors.supports_color():
            print(f"  {c.BLUE}[INFO]{c.RESET} {msg}")
        else:
            print(f"  [INFO] {msg}")

    @staticmethod
    def ok(msg):
        c = Colors
        if Colors.supports_color():
            print(f"  {c.GREEN}[OK]{c.RESET} {msg}")
        else:
            print(f"  [OK] {msg}")

    @staticmethod
    def warn(msg):
        c = Colors
        if Colors.supports_color():
            print(f"  {c.YELLOW}[WARN]{c.RESET} {msg}", file=sys.stderr)
        else:
            print(f"  [WARN] {msg}", file=sys.stderr)

    @staticmethod
    def error(msg):
        c = Colors
        if Colors.supports_color():
            print(f"  {c.RED}[ERROR]{c.RESET} {msg}", file=sys.stderr)
        else:
            print(f"  [ERROR] {msg}", file=sys.stderr)

    @staticmethod
    def banner(lines):
        c = Colors
        sep = "=" * 60
        if Colors.supports_color():
            print(f"\n{c.BOLD}{sep}{c.RESET}")
            for line in lines:
                print(f"  {line}")
            print(f"{c.BOLD}{sep}{c.RESET}")
        else:
            print(f"\n{sep}")
            for line in lines:
                print(f"  {line}")
            print(sep)


def run_cmd(cmd, cwd=None, env_extra=None, check=True, dry_run=False):
    if isinstance(cmd, str):
        cmd_str = cmd
    else:
        cmd_str = " ".join(str(c) for c in cmd)

    Log.info(f"$ {cmd_str}")

    if dry_run:
        Log.info("(dry-run, skipped)")
        return 0, ""

    env = os.environ.copy()
    if env_extra:
        env.update(env_extra)

    try:
        result = subprocess.run(
            cmd if isinstance(cmd, list) else cmd_str,
            shell=isinstance(cmd, str),
            cwd=cwd,
            env=env,
            capture_output=True,
            text=True,
        )
        if result.stdout and result.stdout.strip():
            for line in result.stdout.strip().split("\n"):
                print(f"    {line}")
        if result.returncode != 0 and check:
            if result.stderr:
                for line in result.stderr.strip().split("\n"):
                    Log.error(line)
            raise RuntimeError(f"Command failed (exit {result.returncode}): {cmd_str}")
        return result.returncode, result.stdout
    except FileNotFoundError as e:
        Log.error(f"Command not found: {e}")
        raise


class TestConfig:
    REQUIRED_FIELDS = ["name", "source_dir", "variants"]
    REQUIRED_VARIANT_FIELDS = ["sources", "compile_flags", "link_flags", "run_args"]

    def __init__(self, config_path: Path):
        self.config_path = config_path.resolve()
        self.test_dir = self.config_path.parent
        self._raw = self._load_and_validate()
        self.name: str = self._raw["name"]
        self.description: str = self._raw.get("description", "")
        self.source_dir: str = self._raw["source_dir"]
        self.output_dir: str = self._raw.get("output_dir", "dfg")
        self.default_variant: str = self._raw.get("default_variant", "serial")
        self.variants: Dict[str, Dict] = self._raw["variants"]
        self.lto: bool = self._raw.get("lto", False)
        self.input_files: Dict[str, str] = self._raw.get("input_files", {})
        self.output_files: Dict[str, str] = self._raw.get("output_files", {})
        self.trace: Dict[str, Any] = self._raw.get("trace", {})
        self.pre_compile: Optional[str] = self._raw.get("pre_compile", None)
        self.multithread: bool = self._raw.get("multithread", False)

    def _load_and_validate(self) -> dict:
        with open(self.config_path, "r", encoding="utf-8") as f:
            data = json.load(f)

        for field in self.REQUIRED_FIELDS:
            if field not in data:
                raise ValueError(f"Missing required field: '{field}' in {self.config_path}")

        for vname, vdata in data["variants"].items():
            for field in self.REQUIRED_VARIANT_FIELDS:
                if field not in vdata:
                    raise ValueError(
                        f"Variant '{vname}' missing required field: '{field}'"
                    )

        return data

    def get_variant(self, name: Optional[str] = None) -> Dict:
        name = name or self.default_variant
        if name not in self.variants:
            available = ", ".join(self.variants.keys())
            raise ValueError(f"Variant '{name}' not found. Available: {available}")
        return self.variants[name]

    def resolve_path(self, p: str) -> Path:
        if os.path.isabs(p):
            return Path(p)
        return (self.test_dir / p).resolve()

    def summary(self):
        variants = ", ".join(self.variants.keys())
        return [
            f"Test:         {self.name}",
            f"Description:  {self.description or '(none)'}",
            f"Source Dir:   {self.source_dir}",
            f"Output Dir:   {self.output_dir}",
            f"Variants:     {variants}",
            f"Default:      {self.default_variant}",
            f"LTO:          {self.lto}",
            f"Multithread:  {self.multithread}",
        ]


TEMPLATE_CONFIG = {
    "name": "my_test",
    "description": "Description of the test program",
    "source_dir": "src",
    "output_dir": "dfg",
    "default_variant": "serial",
    "lto": False,
    "multithread": False,
    "simple_access": False,
    "pre_compile": None,
    "input_files": {
        "input": "src/input.txt"
    },
    "output_files": {
        "output": "output.txt"
    },
    "trace": {
        "runtime_seconds": None,
        "flush_threshold": None,
        "sample_rate": None
    },
    "variants": {
        "serial": {
            "sources": ["main.c"],
            "opt_level": "O2",
            "compile_flags": [],
            "link_flags": ["-lm"],
            "run_args": [],
            "multithread": False,
            "pre_compile": None
        },
        "pthreads": {
            "sources": ["main_pthreads.c"],
            "compile_flags": ["-O0", "-DENABLE_THREADS"],
            "link_flags": ["-lm", "-lpthread"],
            "run_args": ["{nthreads}", "{input}", "{output}"],
            "multithread": True,
            "pre_compile": None
        }
    }
}


class FieldAnalysisRunner:
    def __init__(self, config: TestConfig, args: argparse.Namespace):
        self.config = config
        self.args = args

        self.fa_dir = self._find_fa_dir()
        self.runtime_src_dir = self.fa_dir / "runtime"
        self.tools_dir = self.fa_dir / "tools"

        self.clang = args.clang or os.environ.get("CLANG", "clang")
        self.opt = args.opt or os.environ.get("OPT", "opt")
        self.llvm_link = args.llvm_link or os.environ.get("LLVM_LINK", "llvm-link")
        self.build_mode = args.build_mode or os.environ.get("BUILD_MODE", "plugin")

        self.variant_name = args.variant or config.default_variant
        self.variant = config.get_variant(self.variant_name)

        self.opt_level = args.opt_level or self.variant.get("opt_level", "O2")

        self.dry_run = args.dry_run
        self.simple_access = args.simple_access or config._raw.get("simple_access", False)
        self.analysis_only = args.analysis_only
        self.steps = self._parse_steps(args.steps)

        self.output_dir = config.resolve_path(config.output_dir)
        self.src_dir = config.resolve_path(config.source_dir)

        self.multithread = self.variant.get("multithread", config.multithread)
        self.nthreads = args.nthreads or 1
        self.use_lto = self.variant.get("_lto", config.lto)

        self.trace_env = {}
        trace_cfg = config.trace
        if args.trace_seconds is not None:
            self.trace_env["TRACE_RUNTIME_SECONDS"] = str(args.trace_seconds)
        elif trace_cfg.get("runtime_seconds") is not None:
            self.trace_env["TRACE_RUNTIME_SECONDS"] = str(trace_cfg["runtime_seconds"])

        if args.trace_flush is not None:
            self.trace_env["TRACE_FLUSH_THRESHOLD"] = str(args.trace_flush)
        elif trace_cfg.get("flush_threshold") is not None:
            self.trace_env["TRACE_FLUSH_THRESHOLD"] = str(trace_cfg["flush_threshold"])

        if args.trace_sample is not None:
            self.trace_env["TRACE_SAMPLE_RATE"] = str(args.trace_sample)
        elif trace_cfg.get("sample_rate") is not None:
            self.trace_env["TRACE_SAMPLE_RATE"] = str(trace_cfg["sample_rate"])

    def _find_fa_dir(self) -> Path:
        if self.args.fa_dir:
            return Path(self.args.fa_dir).resolve()

        p = self.config.test_dir
        for _ in range(5):
            candidate = p / "runtime" / "libaffinity.c"
            if candidate.exists():
                return p
            p = p.parent

        raise FileNotFoundError(
            "Cannot find FieldAnalysis root (looking for runtime/libaffinity.c). "
            "Use --fa-dir to specify explicitly."
        )

    def _parse_steps(self, steps_str: Optional[str]) -> range:
        if steps_str is None:
            return range(0, 10)
        parts = steps_str.split("-")
        if len(parts) == 1:
            s = int(parts[0])
            return range(s, s + 1)
        return range(int(parts[0]), int(parts[1]) + 1)

    def _resolve_run_args(self) -> List[str]:
        placeholders = {
            "{nthreads}": str(self.nthreads),
        }
        for key, rel_path in self.config.input_files.items():
            placeholders[f"{{{key}}}"] = str(self.config.resolve_path(rel_path))
        for key, rel_path in self.config.output_files.items():
            placeholders[f"{{{key}}}"] = str(self.output_dir / rel_path)

        resolved = []
        for arg in self.variant["run_args"]:
            for ph, val in placeholders.items():
                arg = arg.replace(ph, val)
            resolved.append(arg)
        return resolved

    def _runtime_lib_path(self) -> Path:
        return self.runtime_src_dir / "libaffinity.a"

    @staticmethod
    def _plugin_ext() -> str:
        ext = os.environ.get("PLUGIN_EXT", "")
        if ext:
            return ext
        if sys.platform == "win32":
            return ".dll"
        elif sys.platform == "darwin":
            return ".dylib"
        return ".so"

    def _plugin_path(self) -> Path:
        fa_build_dir = self.args.fa_build_dir or os.environ.get(
            "FA_BUILD_DIR", str(self.fa_dir / "build")
        )
        return Path(fa_build_dir) / f"FieldAnalysis{self._plugin_ext()}"

    def _pass_extra_flags(self) -> List[str]:
        flags = []
        if self.simple_access:
            flags.append("--simple-access-record")
        return flags

    def _run_pre_compile(self):
        pre = self.variant.get("pre_compile") or self.config.pre_compile
        if not pre:
            return
        pre = pre.replace("{source_dir}", str(self.src_dir))
        pre = pre.replace("{test_dir}", str(self.config.test_dir))
        Log.step("Pre-compile step")
        run_cmd(pre, cwd=self.config.test_dir, dry_run=self.dry_run)

    def step0_build_runtime(self):
        Log.step("Step 0: Build runtime library (libaffinity.a)")
        cflags = ["-DFIELDANALYSIS_MULTITHREAD"] if self.multithread else []
        cmd = [
            os.environ.get("RUNTIME_CC", "cc"),
            "-c",
            str(self.runtime_src_dir / "libaffinity.c"),
            "-o",
            str(self.runtime_src_dir / "libaffinity.o"),
        ] + cflags
        run_cmd(cmd, cwd=str(self.runtime_src_dir), dry_run=self.dry_run)

        cmd = [
            "ar", "rcs",
            str(self._runtime_lib_path()),
            str(self.runtime_src_dir / "libaffinity.o"),
        ]
        run_cmd(cmd, cwd=str(self.runtime_src_dir), dry_run=self.dry_run)
        Log.ok(f"Runtime lib: {self._runtime_lib_path()}")

    def step05_build_plugin(self):
        if self.build_mode != "plugin":
            return
        plugin = self._plugin_path()
        if plugin.exists():
            Log.info(f"Plugin already exists: {plugin}")
            return

        Log.step("Step 0.5: Build FieldAnalysis plugin")
        llvm_dir = self.args.llvm_dir or os.environ.get("LLVM_DIR", "")
        if not llvm_dir:
            clang_bin = shutil.which(self.clang) or self.clang
            llvm_dir = str(Path(clang_bin).parent.parent / "lib" / "cmake" / "llvm")

        fa_build = plugin.parent
        generator = os.environ.get("CMAKE_GENERATOR", "Ninja")
        run_cmd(
            ["cmake", "-G", generator, "-S", str(self.fa_dir),
             "-B", str(fa_build), f"-DLLVM_DIR={llvm_dir}"],
            dry_run=self.dry_run,
        )
        run_cmd(["cmake", "--build", str(fa_build)], dry_run=self.dry_run)

        if not self.dry_run and not plugin.exists():
            Log.error(f"Plugin build failed! Expected: {plugin}")
            Log.error("Check:")
            Log.error("  1. LLVM 19 installed with RTTI enabled (LLVM_ENABLE_RTTI=ON)")
            Log.error("  2. cmake -G Ninja -DLLVM_DIR=<path> configured correctly")
            Log.error("  3. Or use --build-mode in-tree and rebuild opt with FieldAnalysis")
            Log.error("  Install LLVM: https://releases.llvm.org/")
            raise RuntimeError(f"Plugin not found after build: {plugin}")

        Log.ok(f"Plugin: {plugin}")

    def _verify_plugin_exists(self):
        plugin = self._plugin_path()
        if not plugin.exists():
            Log.error(f"FieldAnalysis plugin not found: {plugin}")
            Log.error("Build it first:")
            Log.error(f"  1. Set LLVM_DIR to your LLVM cmake directory")
            Log.error(f"  2. Run: python3 tools/fa_runner.py --config ... --steps 0-0.5")
            Log.error(f"  3. Or use --build-mode in-tree")
            raise RuntimeError("Plugin not built — instrumentation cannot be applied")
        from datetime import datetime
        mtime = datetime.fromtimestamp(plugin.stat().st_mtime)
        Log.ok(f"Plugin: {plugin}")
        Log.ok(f"  Modified: {mtime.strftime('%Y-%m-%d %H:%M:%S')}")
        Log.ok(f"  Size: {plugin.stat().st_size:,} bytes")

    def _verify_instrumentation(self, ir_file: Path):
        if self.dry_run:
            return
        with open(ir_file, "r", encoding="utf-8", errors="replace") as f:
            content = f.read()
        if "__record_field_access" not in content:
            Log.warn("INSTRUMENTATION CHECK FAILED: no __record_field_access calls in IR!")
            Log.warn("The pass may not have run. Possible causes:")
            Log.warn("  1. Plugin failed to load silently")
            Log.warn("  2. The IR has no identifiable struct field accesses")
            Log.warn("  3. --field-analysis-only was set (use steps 2-4 for in-tree)")
        else:
            count = content.count("__record_field_access")
            Log.ok(f"Instrumentation verified: {count} x __record_field_access calls")

    def _verify_json_output(self):
        json_files = ["gep_field_map.json", "struct_layout.json"]
        missing = []
        for name in json_files:
            p = self.output_dir / name
            if p.exists():
                Log.ok(f"Found: {p}")
            else:
                missing.append(name)
        if missing:
            Log.warn(f"JSON files not in output_dir ({self.output_dir}): {missing}")
            found_elsewhere = []
            for name in missing:
                for candidate in [
                    Path.cwd() / name,
                    self.config.test_dir / name,
                    self.fa_dir / name,
                ]:
                    if candidate.exists():
                        found_elsewhere.append((name, candidate))
                        break
            if found_elsewhere:
                for name, src in found_elsewhere:
                    dst = self.output_dir / name
                    shutil.copy2(str(src), str(dst))
                    Log.ok(f"Copied {src} -> {dst}")
            else:
                Log.warn("JSON files not found anywhere. Check if the pass actually ran.")
                Log.warn("Try running manually:")
                Log.warn(f"  cd {self.output_dir}")
                Log.warn(f"  {self.opt} -load-pass-plugin={self._plugin_path()} -passes=field-analysis --field-analysis-only -S blackscholes.ll -o /dev/null")
                Log.warn(f"  ls -la gep_field_map.json struct_layout.json")

    def _run_opt_in_output_dir(self, cmd_list):
        old_cwd = os.getcwd()
        try:
            os.chdir(str(self.output_dir))
            return run_cmd(cmd_list, dry_run=self.dry_run)
        finally:
            os.chdir(old_cwd)

    # ---- Plugin mode: generate IR, run pass via opt, compile ----

    def step1_generate_ir_plugin(self):
        Log.step("Step 1: Generate LLVM IR (plugin mode)")
        sources = [str(self.src_dir / s) for s in self.variant["sources"]]
        cflags = self.variant["compile_flags"]

        ir_path = self.output_dir / f"{self.config.name}.ll"
        cmd = (
            [self.clang, "-g", f"-{self.opt_level}",
             "-S", "-emit-llvm"]
            + cflags
            + sources
            + ["-o", str(ir_path)]
        )
        run_cmd(cmd, cwd=str(self.config.test_dir), dry_run=self.dry_run)
        Log.ok(f"IR: {ir_path}")

    def step2_analysis_only_plugin(self):
        Log.step("Step 2: Run field-analysis pass (analysis only, plugin)")
        self._verify_plugin_exists()
        plugin = self._plugin_path()
        ir_path = self.output_dir / f"{self.config.name}.ll"
        analyzed_path = self.output_dir / f"{self.config.name}_analyzed.ll"
        cmd = [
            self.opt, f"-load-pass-plugin={plugin}",
            "-passes=field-analysis", "--field-analysis-only",
            "-S", str(ir_path), "-o", str(analyzed_path),
        ]
        self._run_opt_in_output_dir(cmd)
        self._verify_json_output()

    def step3_instrument_plugin(self):
        Log.step("Step 3: Run field-analysis pass (instrument, plugin)")
        self._verify_plugin_exists()
        plugin = self._plugin_path()
        ir_path = self.output_dir / f"{self.config.name}.ll"
        inst_path = self.output_dir / f"{self.config.name}_instrumented.ll"
        pass_flags = self._pass_extra_flags()
        cmd = [
            self.opt, f"-load-pass-plugin={plugin}",
            "-passes=field-analysis",
            "-S", str(ir_path), "-o", str(inst_path),
        ] + pass_flags
        self._run_opt_in_output_dir(cmd)
        Log.ok(f"Instrumented IR: {inst_path}")
        self._verify_instrumentation(inst_path)

    def step4_compile_plugin(self):
        Log.step("Step 4: Compile instrumented IR (plugin mode)")
        inst_path = self.output_dir / f"{self.config.name}_instrumented.ll"
        exe_path = self.output_dir / self.config.name
        ldflags = self.variant["link_flags"]
        extra_ld = ["-lpthread"] if self.multithread else []
        cmd = (
            [self.clang, str(inst_path), "-o", str(exe_path),
             str(self._runtime_lib_path())]
            + ldflags + extra_ld
        )
        run_cmd(cmd, cwd=str(self.config.test_dir), dry_run=self.dry_run)
        Log.ok(f"Executable: {exe_path}")

    # ---- In-tree mode: IR → opt(built-in) → compile ----

    def step1_generate_ir_intree(self):
        Log.step("Step 1: Generate LLVM IR (in-tree mode)")
        sources = [str(self.src_dir / s) for s in self.variant["sources"]]
        cflags = self.variant["compile_flags"]

        ir_path = self.output_dir / f"{self.config.name}.ll"
        cmd = (
            [self.clang, "-g", f"-{self.opt_level}",
             "-S", "-emit-llvm"]
            + cflags
            + sources
            + ["-o", str(ir_path)]
        )
        run_cmd(cmd, cwd=str(self.config.test_dir), dry_run=self.dry_run)
        Log.ok(f"IR: {ir_path}")

    def step2_analysis_only_intree(self):
        Log.step("Step 2: Run field-analysis pass (analysis only)")
        ir_path = self.output_dir / f"{self.config.name}.ll"
        analyzed_path = self.output_dir / f"{self.config.name}_analyzed.ll"
        cmd = [
            self.opt, "-passes=field-analysis", "--field-analysis-only",
            "-S", str(ir_path), "-o", str(analyzed_path),
        ]
        self._run_opt_in_output_dir(cmd)
        self._verify_json_output()

    def step3_instrument_intree(self):
        Log.step("Step 3: Run field-analysis pass (analysis + instrumentation)")
        ir_path = self.output_dir / f"{self.config.name}.ll"
        inst_path = self.output_dir / f"{self.config.name}_instrumented.ll"
        pass_flags = self._pass_extra_flags()
        cmd = [
            self.opt, "-passes=field-analysis",
            "-S", str(ir_path), "-o", str(inst_path),
        ] + pass_flags
        self._run_opt_in_output_dir(cmd)
        Log.ok(f"Instrumented IR: {inst_path}")
        self._verify_instrumentation(inst_path)

    def step4_compile_ir_intree(self):
        Log.step("Step 4: Compile instrumented IR")
        inst_path = self.output_dir / f"{self.config.name}_instrumented.ll"
        exe_path = self.output_dir / self.config.name
        ldflags = self.variant["link_flags"]
        extra_ld = ["-lpthread"] if self.multithread else []
        cmd = (
            [self.clang, str(inst_path), "-o", str(exe_path),
             str(self._runtime_lib_path())]
            + ldflags + extra_ld
        )
        run_cmd(cmd, cwd=str(self.config.test_dir), dry_run=self.dry_run)
        Log.ok(f"Executable: {exe_path}")

    def step_lto_workflow(self):
        Log.step("LTO Multi-File Workflow")

        sources = [str(self.src_dir / s) for s in self.variant["sources"]]
        cflags = self.variant["compile_flags"]
        ldflags = self.variant["link_flags"]
        extra_ld = ["-lpthread"] if self.multithread else []

        obj_dir = self.output_dir / "obj"
        if not self.dry_run:
            obj_dir.mkdir(parents=True, exist_ok=True)

        obj_files = []
        for src in sources:
            src_name = Path(src).stem
            obj_path = obj_dir / f"{src_name}.o"
            Log.info(f"  {src} -> {obj_path}")
            cmd = (
                [self.clang, "-g", f"-{self.opt_level}", "-flto=thin", "-c"]
                + cflags + [src, "-o", str(obj_path)]
            )
            run_cmd(cmd, cwd=str(self.config.test_dir), dry_run=self.dry_run)
            obj_files.append(str(obj_path))

        combined_ll = self.output_dir / f"{self.config.name}_combined.ll"
        Log.info(f"  Merging {len(obj_files)} bitcode files")
        cmd = [self.llvm_link] + obj_files + ["-S", "-o", str(combined_ll)]
        run_cmd(cmd, dry_run=self.dry_run)
        Log.ok(f"Combined IR: {combined_ll}")

        inst_ll = self.output_dir / f"{self.config.name}_instrumented.ll"
        pass_flags = self._pass_extra_flags()

        if self.build_mode == "plugin":
            plugin = self._plugin_path()
            cmd = [
                self.opt, f"-load-pass-plugin={plugin}",
                "-passes=field-analysis",
                "-S", str(combined_ll), "-o", str(inst_ll),
            ] + pass_flags
        else:
            cmd = [
                self.opt, "-passes=field-analysis",
                "-S", str(combined_ll), "-o", str(inst_ll),
            ] + pass_flags
        self._run_opt_in_output_dir(cmd)
        self._verify_instrumentation(inst_ll)

        exe_path = self.output_dir / self.config.name
        cmd = (
            [self.clang, str(inst_ll), "-o", str(exe_path),
             str(self._runtime_lib_path())]
            + ldflags + extra_ld
        )
        run_cmd(cmd, cwd=str(self.config.test_dir), dry_run=self.dry_run)
        Log.ok(f"Executable: {exe_path}")

    def step5_run_program(self):
        Log.step("Step 5: Run instrumented program")
        exe_path = self.output_dir / self.config.name
        run_args = self._resolve_run_args()
        cmd = [str(exe_path)] + run_args
        Log.info(f"  Args: {run_args}")
        if self.trace_env:
            Log.info(f"  Trace env: {self.trace_env}")
        run_cmd(cmd, cwd=str(self.output_dir), env_extra=self.trace_env,
                check=False, dry_run=self.dry_run)

    def step55_resolve_trace(self):
        Log.step("Step 5.5: Resolve variable trace (resolve_trace.py)")
        resolve_py = self.tools_dir / "resolve_trace.py"
        if not (self.output_dir / "gep_field_map.json").exists():
            Log.warn("gep_field_map.json not found, skipping resolve_trace")
            return
        trace_files = list(self.output_dir.glob("access_trace.*.txt"))
        if not trace_files:
            Log.warn("No access_trace.*.txt found, skipping resolve_trace")
            return
        run_cmd(["python3", str(resolve_py), str(self.output_dir)],
                cwd=str(self.output_dir), dry_run=self.dry_run)
        vfiles = list(self.output_dir.glob("variable_trace.*.txt"))
        if vfiles:
            Log.ok(f"Generated: {', '.join(f.name for f in vfiles)}")
        else:
            Log.warn("variable_trace files not generated")

    def step6_analyze(self):
        Log.step("Step 6: Run affinity analysis (analyze.py)")
        analyze_py = self.tools_dir / "analyze.py"
        if not (self.output_dir / "gep_field_map.json").exists():
            Log.warn("gep_field_map.json not found, skipping analysis")
            return
        run_cmd(["python3", str(analyze_py)], cwd=str(self.output_dir),
                dry_run=self.dry_run)
        Log.ok("Generated: reorder.json")

    def step7_build_dfg(self):
        Log.step("Step 7: Build data flow graph (build_dfg.py)")
        if not (self.output_dir / "gep_field_map.json").exists():
            Log.warn("gep_field_map.json not found, skipping DFG")
            return
        build_dfg_py = self.tools_dir / "build_dfg.py"
        run_cmd(["python3", str(build_dfg_py), str(self.output_dir)],
                cwd=str(self.output_dir), dry_run=self.dry_run)
        Log.ok("Generated: dfg_*.dot")

    def step8_render_dfg(self):
        Log.step("Step 8: Render DFG (optional)")
        if not shutil.which("dot"):
            Log.info("Graphviz not installed, skipping PNG rendering")
            return
        for dotfile in sorted(self.output_dir.glob("dfg_*.dot")):
            pngfile = dotfile.with_suffix(".png")
            run_cmd(["dot", "-Tpng", str(dotfile), "-o", str(pngfile)],
                    dry_run=self.dry_run)
            Log.ok(f"Rendered: {pngfile}")

    def step9_display_results(self):
        Log.step("Step 9: Display results")
        interesting = [
            "gep_field_map.json", "struct_layout.json", "reorder.json",
        ]
        for name in interesting:
            p = self.output_dir / name
            if p.exists():
                print(f"\n--- {name} ---")
                with open(p, "r", encoding="utf-8") as f:
                    print(f.read())

        trace_txt = sorted(self.output_dir.glob("access_trace.*.txt"))
        if trace_txt:
            print(f"\n--- {trace_txt[0].name} (first 20 lines) ---")
            with open(trace_txt[0], "r", encoding="utf-8") as f:
                for i, line in enumerate(f):
                    if i >= 20:
                        break
                    print(line, end="")

        print("\n--- Output files ---")
        for p in sorted(self.output_dir.iterdir()):
            size = p.stat().st_size if p.is_file() else 0
            print(f"  {p.name:40s} {size:>10,} bytes")

    def run(self):
        Log.banner([
            f"FieldAnalysis Test Runner",
            f"Test:    {self.config.name}",
            f"Variant: {self.variant_name}",
            f"Build:   {self.build_mode}",
            f"Opt:     -{self.opt_level}",
            f"Output:  {self.output_dir}",
        ])

        if not self.dry_run:
            self.output_dir.mkdir(parents=True, exist_ok=True)

        self._run_pre_compile()

        steps = {
            0: self.step0_build_runtime,
            "0.5": self.step05_build_plugin,
        }

        if self.use_lto:
            steps[1] = self.step_lto_workflow
        elif self.build_mode == "plugin":
            steps[1] = self.step1_generate_ir_plugin
            steps[2] = self.step2_analysis_only_plugin
            if not self.analysis_only:
                steps[3] = self.step3_instrument_plugin
                steps[4] = self.step4_compile_plugin
        else:
            steps[1] = self.step1_generate_ir_intree
            steps[2] = self.step2_analysis_only_intree
            if not self.analysis_only:
                steps[3] = self.step3_instrument_intree
                steps[4] = self.step4_compile_ir_intree

        if not self.analysis_only:
            steps[5] = self.step5_run_program
        steps["5.5"] = self.step55_resolve_trace
        steps[6] = self.step6_analyze
        steps[7] = self.step7_build_dfg
        # steps[8] = self.step8_render_dfg
        # steps[9] = self.step9_display_results

        step_order = [0, "0.5", 1, 2, 3, 4, 5, "5.5", 6, 7, 8, 9]

        for step_id in step_order:
            if step_id not in steps:
                continue
            step_num = step_id if isinstance(step_id, int) else int(float(str(step_id)))
            if step_num not in self.steps:
                continue
            try:
                steps[step_id]()
            except KeyboardInterrupt:
                Log.warn("Interrupted by user (Ctrl+C)")
                Log.info("Program trace data saved by runtime signal handler")
                Log.info("Continuing to analysis steps...")
                Log.info("")
            except RuntimeError as e:
                Log.error(f"Step {step_id} failed: {e}")
                sys.exit(1)

        Log.banner([
            f"Test Complete: {self.config.name} ({self.variant_name})",
            f"Output directory: {self.output_dir}",
        ])


def discover_tests(search_dir: Path) -> List[Path]:
    configs = []
    for p in sorted(search_dir.rglob("fa_test.json")):
        configs.append(p)
    return configs


def list_variants(config_path: Path):
    with open(config_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    print(f"Test: {data['name']}")
    print(f"Description: {data.get('description', '')}")
    print(f"\nVariants:")
    for vname, vdata in data.get("variants", {}).items():
        src = ", ".join(vdata.get("sources", []))
        flags = " ".join(vdata.get("compile_flags", []))
        mt = " [multithread]" if vdata.get("multithread", False) else ""
        print(f"  {vname:15s} sources=[{src}]  flags=[{flags}]{mt}")


def create_template(output_path: Path):
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w", encoding="utf-8") as f:
        json.dump(TEMPLATE_CONFIG, f, indent=2, ensure_ascii=False)
    print(f"Template config created: {output_path}")
    print("Edit this file to match your test program, then run:")
    print(f"  python3 fa_runner.py --config {output_path}")


def main():
    parser = argparse.ArgumentParser(
        description="FieldAnalysis Generic Test Runner",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples (run from FieldAnalysis root directory):
  # Run blackscholes with default variant
  python3 tools/fa_runner.py --config test/blackscholes/fa_test.json

  # Run pthreads variant
  python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --variant pthreads

  # In-tree build mode
  python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --build-mode in-tree

  # Discover all test cases
  python3 tools/fa_runner.py --discover

  # Create a template config for a new test
  python3 tools/fa_runner.py --template test/my_project/fa_test.json

  # Dry run (print commands without executing)
  python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --dry-run

  # Run only steps 5-7 (run + analyze + DFG)
  python3 tools/fa_runner.py --config test/blackscholes/fa_test.json --steps 5-7

Step numbers (same structure for plugin & in-tree):
  0   Build runtime library (libaffinity.a)
  0.5 Build FieldAnalysis plugin (plugin mode only)
  1   Generate LLVM IR from source (clang -S -emit-llvm)
  2   Analysis-only pass (opt -passes=field-analysis --field-analysis-only)
  3   Instrumentation pass (opt -passes=field-analysis)
  4   Compile instrumented IR + link runtime
  5   Run instrumented program
  6   Run analyze.py
  7   Run build_dfg.py
  8   Render DFG to PNG (optional, requires Graphviz)
  9   Display results
        """,
    )

    parser.add_argument("--config", "-c", type=str, help="Path to fa_test.json config file")
    parser.add_argument("--variant", "-V", type=str, help="Variant to run (default: from config)")
    parser.add_argument("--build-mode", "-b", type=str, choices=["plugin", "in-tree"],
                        help="Build mode (default: plugin)")
    parser.add_argument("--opt-level", "-O", type=str, help="Optimization level (default: O2)")
    parser.add_argument("--clang", type=str, help="Path to clang")
    parser.add_argument("--opt", type=str, help="Path to opt (in-tree mode)")
    parser.add_argument("--llvm-link", type=str, help="Path to llvm-link (LTO mode)")
    parser.add_argument("--fa-dir", type=str, help="FieldAnalysis root directory")
    parser.add_argument("--fa-build-dir", type=str, help="FieldAnalysis plugin build directory")
    parser.add_argument("--llvm-dir", type=str, help="LLVM cmake directory (for plugin build)")
    parser.add_argument("--nthreads", "-n", type=int, help="Number of threads")
    parser.add_argument("--steps", "-s", type=str, help="Step range (e.g., '0-9', '5-7', '6')")
    parser.add_argument("--simple-access", action="store_true",
                        help="Use --simple-access-record mode")
    parser.add_argument("--analysis-only", action="store_true",
                        help="Only run analysis, don't instrument")
    parser.add_argument("--trace-seconds", type=int, help="TRACE_RUNTIME_SECONDS")
    parser.add_argument("--trace-flush", type=int, help="TRACE_FLUSH_THRESHOLD")
    parser.add_argument("--trace-sample", type=int, help="TRACE_SAMPLE_RATE")
    parser.add_argument("--dry-run", action="store_true", help="Print commands without executing")
    parser.add_argument("--discover", "-d", action="store_true",
                        help="Discover all fa_test.json in test/ directory")
    parser.add_argument("--list", "-l", action="store_true",
                        help="List variants in the config file")
    parser.add_argument("--template", "-t", type=str,
                        help="Create a template config file at the given path")

    args = parser.parse_args()

    if args.template:
        create_template(Path(args.template))
        return

    if args.discover:
        tools_dir = Path(__file__).parent
        fa_root = tools_dir.parent
        search_dir = fa_root / "test"
        if not search_dir.exists():
            search_dir = fa_root
        configs = discover_tests(search_dir)
        if not configs:
            print("No fa_test.json files found.")
            return
        print(f"Discovered {len(configs)} test case(s):\n")
        for cfg_path in configs:
            try:
                cfg = TestConfig(cfg_path)
                default = cfg.default_variant
                variants = ", ".join(cfg.variants.keys())
                print(f"  {cfg.name:20s} {cfg.description}")
                print(f"  {'':20s} variants=[{variants}] default={default}")
                print(f"  {'':20s} config={cfg_path}")
                print()
            except Exception as e:
                print(f"  [INVALID] {cfg_path}: {e}")
                print()
        return

    if not args.config:
        parser.error("--config is required (unless using --discover or --template)")

    config_path = Path(args.config)
    if not config_path.exists():
        parser.error(f"Config file not found: {config_path}")

    if args.list:
        list_variants(config_path)
        return

    config = TestConfig(config_path)
    runner = FieldAnalysisRunner(config, args)
    runner.run()


if __name__ == "__main__":
    main()
