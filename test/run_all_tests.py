#!/usr/bin/env python3
"""FieldAnalysis Unified Test Suite Runner

一键执行 test 目录下所有测试用例（排除 mine-tools-test），
也支持单独执行某个测试。

Usage:
    # 一键执行所有测试
    python3 test/run_all_tests.py

    # 一键执行所有测试（dry-run 模式，仅打印命令）
    python3 test/run_all_tests.py --dry-run

    # 指定构建模式
    python3 test/run_all_tests.py --build-mode plugin
    python3 test/run_all_tests.py --build-mode in-tree

    # 只执行某个套件
    python3 test/run_all_tests.py --suite phoenix
    python3 test/run_all_tests.py --suite Huron
    python3 test/run_all_tests.py --suite spring_2020_tutorial
    python3 test/run_all_tests.py --suite cache-effects
    python3 test/run_all_tests.py --suite locked
    python3 test/run_all_tests.py --suite False_Sharing
    python3 test/run_all_tests.py --suite dwarves

    # 只执行某个具体测试（按名称匹配）
    python3 test/run_all_tests.py --test histogram
    python3 test/run_all_tests.py --test blackscholes

    # 列出所有可用的测试
    python3 test/run_all_tests.py --list

    # 只执行分析步骤（跳过编译和运行）
    python3 test/run_all_tests.py --analysis-only
"""

import argparse
import json
import os
import subprocess
import sys
import time
from pathlib import Path
from typing import List, Dict, Optional, Tuple


class Colors:
    RESET = "\033[0m"
    BOLD = "\033[1m"
    RED = "\033[31m"
    GREEN = "\033[32m"
    YELLOW = "\033[33m"
    BLUE = "\033[34m"
    CYAN = "\033[36m"
    MAGENTA = "\033[35m"

    @staticmethod
    def supports_color():
        return hasattr(sys.stdout, "isatty") and sys.stdout.isatty()


def color(text: str, code: str) -> str:
    if Colors.supports_color():
        return f"{code}{text}{Colors.RESET}"
    return text


def print_header(title: str):
    width = 72
    if Colors.supports_color():
        print(f"\n{Colors.BOLD}{Colors.CYAN}{'=' * width}{Colors.RESET}")
        print(f"{Colors.BOLD}{Colors.CYAN}  {title}{Colors.RESET}")
        print(f"{Colors.BOLD}{Colors.CYAN}{'=' * width}{Colors.RESET}")
    else:
        print(f"\n{'=' * width}")
        print(f"  {title}")
        print(f"{'=' * width}")


def print_suite(title: str):
    if Colors.supports_color():
        print(f"\n{Colors.BOLD}{Colors.MAGENTA}--- {title} ---{Colors.RESET}")
    else:
        print(f"\n--- {title} ---")


def print_result(name: str, variant: str, passed: bool, elapsed: float):
    status = color("PASS", Colors.GREEN) if passed else color("FAIL", Colors.RED)
    print(f"  [{status}] {name:30s} ({variant:15s}) {elapsed:.1f}s")


class TestCase:
    def __init__(self, config_path: Path, suite_name: str):
        self.config_path = config_path
        self.suite_name = suite_name
        with open(config_path, "r", encoding="utf-8") as f:
            self.data = json.load(f)
        self.name = self.data["name"]
        self.variants = list(self.data["variants"].keys())
        self.default_variant = self.data.get("default_variant", self.variants[0])
        self.description = self.data.get("description", "")

    def __repr__(self):
        return f"TestCase({self.name}, suite={self.suite_name}, variants={self.variants})"


def discover_tests(test_dir: Path, exclude_suites: Optional[List[str]] = None) -> List[TestCase]:
    if exclude_suites is None:
        exclude_suites = ["mine-tools-test"]

    tests = []
    for config_path in sorted(test_dir.rglob("fa_test.json")):
        rel = config_path.relative_to(test_dir)
        parts = rel.parts
        suite_name = parts[0] if len(parts) > 1 else "root"

        if suite_name in exclude_suites:
            continue

        try:
            tc = TestCase(config_path, suite_name)
            tests.append(tc)
        except Exception as e:
            print(f"  [SKIP] Invalid config: {config_path} ({e})")

    return tests


def run_test(
    tc: TestCase,
    variant: str,
    fa_runner: Path,
    build_mode: str,
    dry_run: bool,
    analysis_only: bool,
    skip_run: bool,
    timeout: Optional[int],
    extra_args: List[str],
) -> Tuple[bool, float]:
    cmd = [
        sys.executable, str(fa_runner),
        "--config", str(tc.config_path),
        "--variant", variant,
        "--build-mode", build_mode,
    ] + extra_args

    if dry_run:
        cmd.append("--dry-run")
    if analysis_only:
        cmd.append("--analysis-only")
    if skip_run:
        cmd.append("--steps")
        cmd.append("0-4")

    cmd_str = " ".join(cmd)
    print(f"    $ {cmd_str}")

    if dry_run:
        return True, 0.0

    start = time.time()
    try:
        result = subprocess.run(
            cmd,
            cwd=str(tc.config_path.parent),
            timeout=timeout,
        )
        elapsed = time.time() - start

        if result.returncode != 0:
            print(f"      {color('[FAIL]', Colors.RED)} exit code: {result.returncode}")
            return False, elapsed

        return True, elapsed
    except subprocess.TimeoutExpired:
        elapsed = time.time() - start
        print(f"      {color('[TIMEOUT]', Colors.YELLOW)} exceeded {timeout}s limit")
        return False, elapsed
    except KeyboardInterrupt:
        elapsed = time.time() - start
        print(f"      {color('[INTERRUPTED]', Colors.YELLOW)} User pressed Ctrl+C")
        return False, elapsed
    except Exception as e:
        elapsed = time.time() - start
        print(f"      {color('[ERROR]', Colors.RED)} {e}")
        return False, elapsed


def main():
    parser = argparse.ArgumentParser(
        description="FieldAnalysis Unified Test Suite Runner",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog="""
Examples:
  # Run all tests
  python3 test/run_all_tests.py

  # Run all tests with dry-run
  python3 test/run_all_tests.py --dry-run

  # Run only Phoenix suite
  python3 test/run_all_tests.py --suite phoenix

  # Run only a specific test by name
  python3 test/run_all_tests.py --test histogram

  # List all available tests
  python3 test/run_all_tests.py --list

  # Use in-tree build mode
  python3 test/run_all_tests.py --build-mode in-tree

  # Analysis only (skip compile & run)
  python3 test/run_all_tests.py --analysis-only

  # Skip runtime execution (steps 0-4 only, no tracing)
  python3 test/run_all_tests.py --skip-run

  # Set timeout per test variant (e.g. 120s)
  python3 test/run_all_tests.py --timeout 120
        """,
    )

    parser.add_argument("--suite", "-s", type=str,
                        help="Only run tests in a specific suite directory")
    parser.add_argument("--test", "-t", type=str,
                        help="Only run tests whose name contains this string")
    parser.add_argument("--build-mode", "-b", type=str,
                        choices=["plugin", "in-tree"], default="plugin",
                        help="Build mode (default: plugin)")
    parser.add_argument("--dry-run", action="store_true",
                        help="Print commands without executing")
    parser.add_argument("--analysis-only", action="store_true",
                        help="Only run analysis steps (skip compile & run)")
    parser.add_argument("--skip-run", action="store_true",
                        help="Skip runtime execution (steps 0-4 only, no tracing)")
    parser.add_argument("--timeout", type=int, default=None,
                        help="Timeout in seconds per test variant (default: no limit)")
    parser.add_argument("--list", "-l", action="store_true",
                        help="List all available test cases")
    parser.add_argument("--fa-dir", type=str,
                        help="FieldAnalysis root directory")
    parser.add_argument("--clang", type=str, help="Path to clang")
    parser.add_argument("--opt", type=str, help="Path to opt")
    parser.add_argument("--llvm-link", type=str, help="Path to llvm-link")
    parser.add_argument("--llvm-dir", type=str, help="LLVM cmake directory")
    parser.add_argument("--fa-build-dir", type=str,
                        help="FieldAnalysis plugin build directory")

    args = parser.parse_args()

    script_dir = Path(__file__).parent.resolve()
    fa_dir = Path(args.fa_dir) if args.fa_dir else script_dir.parent
    fa_runner = fa_dir / "tools" / "fa_runner.py"

    if not fa_runner.exists():
        print(f"ERROR: fa_runner.py not found at {fa_runner}")
        print(f"  FA_DIR: {fa_dir}")
        sys.exit(1)

    tests = discover_tests(script_dir)

    if args.suite:
        tests = [t for t in tests if t.suite_name.lower() == args.suite.lower()]
        if not tests:
            print(f"No tests found in suite: {args.suite}")
            sys.exit(1)

    if args.test:
        tests = [t for t in tests if args.test.lower() in t.name.lower()]
        if not tests:
            print(f"No tests found matching: {args.test}")
            sys.exit(1)

    if args.list:
        print_header("Available Test Cases")
        suites: Dict[str, List[TestCase]] = {}
        for t in tests:
            suites.setdefault(t.suite_name, []).append(t)

        for suite_name in sorted(suites.keys()):
            print_suite(suite_name)
            for t in suites[suite_name]:
                variants_str = ", ".join(t.variants)
                print(f"  {t.name:30s} variants=[{variants_str}]")
                print(f"  {'':30s} {t.description[:80]}")
        return

    if not tests:
        print("No tests to run.")
        return

    extra_args = []
    if args.clang:
        extra_args.extend(["--clang", args.clang])
    if args.opt:
        extra_args.extend(["--opt", args.opt])
    if args.llvm_link:
        extra_args.extend(["--llvm-link", args.llvm_link])
    if args.llvm_dir:
        extra_args.extend(["--llvm-dir", args.llvm_dir])
    if args.fa_build_dir:
        extra_args.extend(["--fa-build-dir", args.fa_build_dir])
    if args.fa_dir:
        extra_args.extend(["--fa-dir", args.fa_dir])

    print_header("FieldAnalysis Unified Test Suite Runner")
    print(f"  FA_DIR:      {fa_dir}")
    print(f"  Build Mode:  {args.build_mode}")
    print(f"  Dry Run:     {args.dry_run}")
    print(f"  Analysis:    {'only' if args.analysis_only else 'full pipeline'}")
    print(f"  Skip Run:    {args.skip_run}")
    print(f"  Timeout:     {f'{args.timeout}s' if args.timeout else 'none'}")
    print(f"  Test Count:  {len(tests)}")

    total_variants = 0
    passed_variants = 0
    failed_variants = 0
    suite_results: Dict[str, Dict] = {}

    for tc in tests:
        suite_name = tc.suite_name
        if suite_name not in suite_results:
            suite_results[suite_name] = {"total": 0, "passed": 0, "failed": 0}

        print_suite(f"{tc.name} ({tc.suite_name})")
        print(f"  Config: {tc.config_path}")
        print(f"  Description: {tc.description[:100]}")

        for variant in tc.variants:
            total_variants += 1
            suite_results[suite_name]["total"] += 1

            passed, elapsed = run_test(
                tc, variant, fa_runner, args.build_mode,
                args.dry_run, args.analysis_only, args.skip_run,
                args.timeout, extra_args,
            )

            print_result(tc.name, variant, passed, elapsed)

            if passed:
                passed_variants += 1
                suite_results[suite_name]["passed"] += 1
            else:
                failed_variants += 1
                suite_results[suite_name]["failed"] += 1

    print_header("Test Suite Results Summary")
    for suite_name, results in sorted(suite_results.items()):
        p = results["passed"]
        t = results["total"]
        f = results["failed"]
        status = color("OK", Colors.GREEN) if f == 0 else color(f"{f} FAILED", Colors.RED)
        print(f"  {suite_name:30s} {p}/{t} passed  [{status}]")

    print(f"\n  {color('TOTAL', Colors.BOLD)}: {passed_variants}/{total_variants} variants passed")
    if failed_variants > 0:
        print(f"  {color(f'{failed_variants} variant(s) FAILED', Colors.RED)}")
    else:
        print(f"  {color('All tests passed!', Colors.GREEN)}")

    return 0 if failed_variants == 0 else 1


if __name__ == "__main__":
    sys.exit(main())
