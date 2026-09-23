"""Golden full-pair window graph and boundary/channel regression tests."""
import sys
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parents[2] / "tools"))
from build_access_graph import build_graph


def event(name, timestamp, cpu=0, thread=1, mode="W", phase=0):
    return {"schema_version": 3, "pid": 1, "run_id": 2, "object_id": 1,
            "logical_index": [name], "field_path": "value",
            "timestamp_ns": timestamp, "cpu_id": cpu, "thread_instance": thread,
            "mode": mode, "access_size": 4, "phase_id": phase}


class GraphTest(unittest.TestCase):
    def test_eight_event_example(self):
        rows = [event(name, n, 0 if name in (1, 2) else 1,
                      1 if name in (1, 2) else 2)
                for n, name in enumerate((1, 3, 2, 4, 1, 3, 2, 4))]
        graph = build_graph(rows, 8, 0)
        self.assertEqual(graph["events"], 8)
        self.assertEqual(graph["windows"], 1)
        self.assertEqual(graph["pairs"], 28)
        self.assertEqual(sum(graph["self_pairs"].values()), 4)
        self.assertEqual(len(graph["edges"]), 6)
        self.assertEqual([edge["weight"] for edge in graph["edges"]], [4] * 6)
        self.assertEqual(sum(edge["channels"].get("a", 0) for edge in graph["edges"]), 8)
        self.assertEqual(sum(edge["channels"].get("f", 0) for edge in graph["edges"]), 16)

    def test_half_open_window_and_phases(self):
        rows = [event(0, 100), event(1, 109), event(2, 110),
                event(3, 109, phase=1)]
        graph = build_graph(rows, 10, 100)
        self.assertEqual(graph["pairs"], 1)
        self.assertEqual(graph["windows"], 3)

    def test_four_channels_and_partial_rejection(self):
        rows = [event(0, 10), event(1, 11), event(2, 12, 1, 1),
                event(3, 13, 1, 2, "R"), event(4, 14, 2, 3, "R")]
        graph = build_graph(rows, 10)
        channels = {k for edge in graph["edges"] for k in edge["channels"]}
        self.assertEqual(channels, {"a", "r", "f", "m"})
        rows[0]["field_path"] = "partial"
        with self.assertRaises(ValueError):
            build_graph(rows, 10)


if __name__ == "__main__":
    unittest.main()
