"""Configuration and runner regressions independent of the LLVM toolchain."""
import argparse
import contextlib
import io
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tools"))
from fa_runner import FieldAnalysisRunner, TestConfig, TEMPLATE_PATH, create_template


class RunnerTest(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.base = Path(self.temp.name)
        self.data = json.loads(TEMPLATE_PATH.read_text())
        self.config = self.base / "fa.json"

    def load(self):
        self.config.write_text(json.dumps(self.data))
        return TestConfig(self.config)

    def runner(self, **options):
        args = dict(fa_dir=str(ROOT), variant=None, clang=None, opt=None, llvm_link=None,
                    build_mode=None, opt_level=None, dry_run=True, simple_access=False,
                    analysis_only=False, steps=None, nthreads=None, trace_seconds=None,
                    trace_flush=None, trace_sample=None, fa_build_dir=None, llvm_dir=None)
        args.update(options)
        return FieldAnalysisRunner(self.load(), argparse.Namespace(**args))

    def test_template_is_single_source_and_does_not_overwrite(self):
        create_template(self.config)
        self.assertEqual(self.config.read_bytes(), TEMPLATE_PATH.read_bytes())
        with self.assertRaises(ValueError):
            create_template(self.config)

    def test_function_defaults_and_selection(self):
        for functions in (None, [], ["main", "worker"]):
            if functions is None:
                self.data.pop("functions", None)
            else:
                self.data["functions"] = functions
            self.assertEqual(self.runner()._pass_extra_flags(),
                             [f"-fa-function={name}" for name in (functions or [])])
        for invalid in (None, "main", [""], [1]):
            self.data["functions"] = invalid
            with self.assertRaises(ValueError):
                self.load()

    def test_default_variant_and_invalid_options(self):
        self.data["variants"]["worker"] = self.data["variants"].pop("serial")
        self.data.pop("default_variant")
        self.assertEqual(self.load().default_variant, "worker")
        self.data["trace"]["sample_rate"] = 0
        with self.assertRaises(ValueError):
            self.load()
        self.data["trace"]["sample_rate"] = 1
        with self.assertRaises(ValueError):
            self.runner(steps="0-0.5")

    def test_lto_analysis_never_instruments_links_or_runs(self):
        self.data["variants"]["serial"]["sources"] = ["a/main.c", "b/main.c"]
        runner = self.runner(analysis_only=True)
        commands = []
        with patch("fa_runner.run_cmd", side_effect=lambda cmd, **kw: commands.append(cmd)), contextlib.redirect_stdout(io.StringIO()):
            runner.run()
        passes = [cmd for cmd in commands if "-passes=field-analysis" in cmd]
        self.assertEqual(len(passes), 1)
        self.assertIn("--field-analysis-only", passes[0])
        self.assertFalse(any(str(arg).endswith("libaffinity.a") and cmd[0] == runner.clang
                             for cmd in commands for arg in cmd))
        outputs = [cmd[cmd.index("-o") + 1] for cmd in commands if "-flto=thin" in cmd]
        self.assertEqual(len(set(outputs)), 2)
        self.assertFalse(runner.output_dir.exists())

    def test_program_failure_is_not_a_pass(self):
        runner = self.runner(dry_run=False)
        runner.output_dir.mkdir()
        (runner.output_dir / runner.config.name).symlink_to("/bin/false")
        with self.assertRaises(RuntimeError):
            runner.step5_run_program()

    def test_old_capture_is_not_overwritten(self):
        runner = self.runner(dry_run=False)
        runner.output_dir.mkdir()
        (runner.output_dir / "trace.1.1.1.0.bin").write_bytes(b"partial")
        with self.assertRaisesRegex(RuntimeError, "previous capture"):
            runner.run()

    def test_dry_run_works_without_built_plugin(self):
        self.load()
        done = subprocess.run([sys.executable, str(ROOT / "tools/fa_runner.py"),
                               "--config", str(self.config), "--fa-dir", str(ROOT),
                               "--fa-build-dir", str(self.base / "absent-build"), "--dry-run"],
                              capture_output=True, text=True)
        self.assertEqual(done.returncode, 0, done.stdout + done.stderr)
        self.assertFalse((self.base / "dfg").exists())

    def test_logical_mode_does_not_silently_ignore_dry_run(self):
        done = subprocess.run([sys.executable, str(ROOT / "tools/fa_runner.py"),
                               "--logical-config", "unused.json", "--source", "unused.c", "--dry-run"],
                              capture_output=True, text=True)
        self.assertNotEqual(done.returncode, 0)
        self.assertIn("do not apply to logical mode", done.stderr)


if __name__ == "__main__":
    unittest.main()
