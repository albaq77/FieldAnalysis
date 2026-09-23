"""Candidate layout projection preserves logical identities and rejects aliasing."""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "tools"))
from project_layout import project


class ProjectTest(unittest.TestCase):
    def setUp(self):
        self.rows = [dict(schema_version=3, pid=1, run_id=2, thread_instance=1,
                          thread_seq=n + 1, timestamp_ns=10 + n, cpu_id=0,
                          object_id=1, logical_index=index, field_path="value",
                          access_size=4, address=0x1000 + n * 4, mode="R")
                     for n, index in enumerate(([0, 0], [1, 0], [0, 1]))]
        self.layout = {"objects": {"1": {"base": "0x2000", "extent": 48,
                                        "strides": [24, 8], "fields": {"value": 0}}}}

    def test_project_stride_and_identity(self):
        result = project(self.rows, self.layout)
        self.assertEqual([r["projected_address"] for r in result],
                         ["0x2000", "0x2018", "0x2008"])
        self.assertEqual([r["logical_index"] for r in result],
                         [r["logical_index"] for r in self.rows])

    def test_missing_object_rejected(self):
        with self.assertRaises(ValueError):
            project(self.rows, {"objects": {}})

    def test_overlap_rejected(self):
        self.layout["objects"]["1"]["strides"] = [2, 2]
        with self.assertRaisesRegex(ValueError, "overlap"):
            project(self.rows, self.layout)

    def test_out_of_bounds_and_partial_rejected(self):
        self.layout["objects"]["1"]["extent"] = 24
        with self.assertRaisesRegex(ValueError, "extent"):
            project(self.rows, self.layout)
        self.rows[0]["field_path"] = "partial"
        with self.assertRaisesRegex(ValueError, "partial"):
            project(self.rows, {"objects": {"1": {"base": "0x2000", "extent": 48,
                                                   "strides": [24, 8], "fields": {"value": 0}}}})


if __name__ == "__main__":
    unittest.main()
