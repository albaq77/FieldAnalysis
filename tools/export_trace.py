#!/usr/bin/env python3
"""Export versioned events without discarding logical identity."""
import argparse
import csv
import json
import sys
from trace_io import FIELDS, check_complete, read_trace


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("path")
    parser.add_argument("--output", required=True)
    parser.add_argument("--require-complete", action="store_true")
    args = parser.parse_args()
    try:
        rows = read_trace(args.path)
        if args.require_complete:
            check_complete(args.path, rows)
        if rows and rows[0]["schema_version"] == 3:
            if not args.require_complete:
                check_complete(args.path, rows)
            columns = ["object_id", "object_offset", "object_name", "logical_index", "field_path"]
        else:
            columns = []
        with open(args.output, "w", newline="") as f:
            writer = csv.DictWriter(f, fieldnames=["schema_version", "pid", "run_id", *FIELDS, *columns])
            writer.writeheader()
            for row in rows:
                out = {k: row[k] for k in writer.fieldnames}
                out["address"] = hex(row["address"])
                if "logical_index" in out:
                    out["logical_index"] = json.dumps(out["logical_index"], separators=(",", ":"))
                writer.writerow(out)
        print(f"Exported {len(rows)} events to {args.output}")
        return 0
    except (ValueError, OSError, KeyError) as exc:
        print(f"Trace error: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
