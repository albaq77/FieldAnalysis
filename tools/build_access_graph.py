#!/usr/bin/env python3
"""Full-pair logical access graph in fixed half-open time windows (not cache replay)."""
import argparse
from collections import Counter, defaultdict
import json
import sys

from trace_io import check_complete, read_trace


def node_key(event):
    if event["field_path"] in ("partial", "range"):
        raise ValueError("partial/range access needs normalization before scalar graphing")
    return (event["pid"], event["run_id"], event["object_id"],
            tuple(event["logical_index"]), event["field_path"])


def pair_channel(a, b):
    if a["cpu_id"] == b["cpu_id"]:
        return "a"  # same logical CPU
    if a["thread_instance"] == b["thread_instance"]:
        return "m"  # same thread migrated between CPUs
    return "r" if a["mode"] == b["mode"] == "R" else "f"


def build_graph(events, window_ns, origin_ns=None):
    if window_ns <= 0:
        raise ValueError("window_ns must be positive")
    if not events or any(row["schema_version"] != 3 for row in events):
        raise ValueError("graph requires nonempty, resolved v3 events")
    origin_ns = min(e["timestamp_ns"] for e in events) if origin_ns is None else origin_ns
    windows = defaultdict(list)
    nodes = defaultdict(lambda: {"n": 0, "bytes": 0, "modes": Counter(),
                                 "cpus": Counter(), "threads": Counter()})
    for event in events:
        key = node_key(event)
        if event["timestamp_ns"] < origin_ns:
            raise ValueError("event precedes fixed window origin")
        bucket = (event["pid"], event["run_id"], event.get("phase_id", 0),
                  (event["timestamp_ns"] - origin_ns) // window_ns)
        windows[bucket].append((key, event))
        item = nodes[key]
        item["n"] += 1
        item["bytes"] += event["access_size"]
        item["modes"][event["mode"]] += 1
        item["cpus"][event["cpu_id"]] += 1
        item["threads"][event["thread_instance"]] += 1
    edges = defaultdict(Counter)
    self_pairs = Counter()
    pairs = 0
    for accesses in windows.values():
        for i, (left, a) in enumerate(accesses):
            for right, b in accesses[i + 1:]:
                pairs += 1
                channel = pair_channel(a, b)
                if left == right:
                    self_pairs[channel] += 1
                else:
                    edges[tuple(sorted((left, right)))][channel] += 1
    if pairs != sum(sum(counts.values()) for counts in edges.values()) + sum(self_pairs.values()):
        raise AssertionError("event-pair conservation failed")
    def label(key):
        pid, run_id, oid, index, field = key
        return {"pid": pid, "run_id": run_id, "object_id": oid,
                "logical_index": list(index), "field_path": field}
    return {"schema": "logical-access-graph-v1", "window_ns": window_ns,
            "origin_ns": origin_ns, "events": len(events), "windows": len(windows),
            "pairs": pairs, "self_pairs": dict(self_pairs),
            "nodes": [{"key": label(key), "n": value["n"], "bytes": value["bytes"],
                       "modes": dict(value["modes"]), "cpus": dict(value["cpus"]),
                       "threads": dict(value["threads"])} for key, value in sorted(nodes.items())],
            "edges": [{"u": label(u), "v": label(v), "channels": dict(counts),
                       "weight": sum(counts.values())}
                      for (u, v), counts in sorted(edges.items())]}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", help="complete v3 trace directory")
    parser.add_argument("--window-ns", type=int, required=True)
    parser.add_argument("--origin-ns", type=int)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    try:
        rows = read_trace(args.path)
        check_complete(args.path, rows)
        result = build_graph(rows, args.window_ns, args.origin_ns)
        with open(args.output, "w") as f:
            json.dump(result, f, indent=2)
            f.write("\n")
        print(f"{result['events']} events, {result['pairs']} pairs, {len(result['edges'])} edges")
    except (ValueError, OSError, KeyError) as error:
        parser.exit(1, f"Graph error: {error}\n")


if __name__ == "__main__":
    main()
