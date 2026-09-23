#!/usr/bin/env python3
"""Project complete v3 scalar events onto explicitly specified candidate object layouts."""
import argparse
import json
import sys

from trace_io import check_complete, read_trace


def project(rows, candidate):
    if not rows or any(row["schema_version"] != 3 for row in rows):
        raise ValueError("layout projection requires resolved v3 events")
    if len({(row["pid"], row["run_id"]) for row in rows}) != 1:
        raise ValueError("project one run at a time")
    objects = candidate.get("objects")
    if not isinstance(objects, dict) or set(objects) != {str(row["object_id"]) for row in rows}:
        raise ValueError("candidate must describe exactly the observed object IDs")
    intervals = []
    for oid, spec in objects.items():
        try:
            base = int(spec["base"], 0) if isinstance(spec["base"], str) else spec["base"]
            extent = spec["extent"]
            strides = spec["strides"]
            fields = spec["fields"]
        except (KeyError, TypeError) as error:
            raise ValueError(f"object {oid} lacks base/extent/strides/fields") from error
        if (not isinstance(base, int) or isinstance(base, bool) or base < 0 or
                not isinstance(extent, int) or isinstance(extent, bool) or extent <= 0 or
                base + extent > 2**64):
            raise ValueError("invalid projected object interval")
        if (not isinstance(strides, list) or not strides or
                any(not isinstance(n, int) or isinstance(n, bool) or n <= 0 for n in strides) or
                not isinstance(fields, dict)):
            raise ValueError("invalid projected strides/fields")
        intervals.append((base, base + extent))
    intervals.sort()
    if any(a[1] > b[0] for a, b in zip(intervals, intervals[1:])):
        raise ValueError("candidate object intervals overlap")
    projected = []
    nodes = {}
    for row in rows:
        if row["field_path"] in ("range", "partial"):
            raise ValueError("partial/range events require normalization before projection")
        spec = objects[str(row["object_id"])]
        index, strides = row["logical_index"], spec["strides"]
        if len(index) != len(strides) or any(not isinstance(n, int) or n < 0 for n in index):
            raise ValueError("index rank does not match candidate strides")
        field = spec["fields"].get(row["field_path"])
        if not isinstance(field, int) or isinstance(field, bool) or field < 0:
            raise ValueError("missing or invalid projected field offset")
        offset = sum(i * step for i, step in zip(index, strides)) + field
        if offset + row["access_size"] > spec["extent"]:
            raise ValueError("projected access exceeds candidate extent")
        key = (row["object_id"], tuple(index), row["field_path"])
        interval = (offset, offset + row["access_size"])
        if key in nodes and nodes[key] != interval:
            raise ValueError("one logical node has inconsistent projected widths")
        nodes[key] = interval
        base = int(spec["base"], 0) if isinstance(spec["base"], str) else spec["base"]
        projected.append({"pid": row["pid"], "run_id": row["run_id"],
                          "thread_instance": row["thread_instance"], "thread_seq": row["thread_seq"],
                          "timestamp_ns": row["timestamp_ns"], "cpu_id": row["cpu_id"],
                          "mode": row["mode"], "access_size": row["access_size"],
                          "object_id": row["object_id"], "logical_index": index,
                          "field_path": row["field_path"], "source_address": hex(row["address"]),
                          "projected_address": hex(base + offset)})
    by_object = {}
    for (oid, index, field), (start, end) in nodes.items():
        by_object.setdefault(oid, []).append((start, end, index, field))
    for accesses in by_object.values():
        accesses.sort()
        for left, right in zip(accesses, accesses[1:]):
            if left[1] > right[0]:
                raise ValueError("distinct logical nodes overlap in candidate layout")
    return projected


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path", help="complete v3 trace directory")
    parser.add_argument("--candidate", required=True, help="JSON object_id -> base/extent/strides/fields")
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    try:
        rows = read_trace(args.path)
        check_complete(args.path, rows)
        with open(args.candidate) as f:
            candidate = json.load(f)
        result = project(rows, candidate)
        with open(args.output, "w") as f:
            json.dump(result, f, indent=2)
            f.write("\n")
        print(f"Projected {len(result)} accesses")
    except (ValueError, OSError, KeyError) as error:
        parser.exit(1, f"Projection error: {error}\n")


if __name__ == "__main__":
    main()
