#!/usr/bin/env python3
"""
build_address_map.py - Build runtime address -> struct.field mapping

Reads access_trace.*.txt and gep_field_map.json from a dfg/ directory,
produces address_map.json mapping each unique runtime address to its
struct type, field index, offset, type, size, region, and access count.

Handles address reuse (heap free/realloc, stack frame reuse) by
tracking field_id changes over time and splitting into time segments.

Usage:
    python3 build_address_map.py <dfg_dir>
"""

import json
import os
import re
import sys
from collections import defaultdict


def load_gep_field_map(path):
    with open(path, "r") as f:
        raw = json.load(f)
    id_to_info = {}
    for key, entry in raw.items():
        fid = entry.get("id")
        if fid is not None:
            id_to_info[int(fid)] = {
                "struct": entry.get("struct", "unknown"),
                "field": entry.get("field", 0),
                "offset": entry.get("offset", 0),
                "field_type": entry.get("field_type", "?"),
                "field_size": entry.get("field_size", 0),
            }
    return id_to_info


def collect_all_trace_lines(dfg_dir):
    trace_pattern = re.compile(
        r"\[(\d+)\]\s+(\d+)\s+([RWM])\s+0x([0-9a-fA-F]+)\s+([GHS])"
    )
    lines = []

    for fname in sorted(os.listdir(dfg_dir)):
        if not fname.startswith("access_trace.") or not fname.endswith(".txt"):
            continue
        fpath = os.path.join(dfg_dir, fname)
        with open(fpath, "r") as f:
            for line in f:
                m = trace_pattern.match(line.strip())
                if not m:
                    continue
                ts = int(m.group(1))
                fid = int(m.group(2))
                rw = m.group(3)
                addr = "0x" + m.group(4)
                region = m.group(5)
                lines.append((ts, fid, rw, addr, region))

    lines.sort(key=lambda x: x[0])
    return lines


def build_segmented_map(sorted_lines, id_to_info):
    addr_state = {}

    for ts, fid, rw, addr, region in sorted_lines:
        info = id_to_info.get(fid, {
            "struct": "unknown",
            "field": 0,
            "offset": 0,
            "field_type": "?",
            "field_size": 0,
        })

        if addr not in addr_state:
            addr_state[addr] = {
                "region": region,
                "current_fid": fid,
                "current_info": info,
                "segments": [{
                    "struct": info["struct"],
                    "field": info["field"],
                    "offset": info["offset"],
                    "field_type": info["field_type"],
                    "field_size": info["field_size"],
                    "ts_first": ts,
                    "ts_last": ts,
                    "access_count": 1,
                }],
            }
        else:
            state = addr_state[addr]
            if state["region"] != region:
                state["region"] = region

            if fid != state["current_fid"]:
                state["current_fid"] = fid
                state["current_info"] = info
                state["segments"].append({
                    "struct": info["struct"],
                    "field": info["field"],
                    "offset": info["offset"],
                    "field_type": info["field_type"],
                    "field_size": info["field_size"],
                    "ts_first": ts,
                    "ts_last": ts,
                    "access_count": 1,
                })
            else:
                seg = state["segments"][-1]
                seg["ts_last"] = ts
                seg["access_count"] += 1

    result = {}
    for addr, state in addr_state.items():
        del state["current_fid"]
        del state["current_info"]
        total = sum(s["access_count"] for s in state["segments"])
        state["has_conflict"] = len(state["segments"]) > 1
        state["total_accesses"] = total
        result[addr] = state

    return result


def main():
    if len(sys.argv) < 2:
        print("Usage: python3 build_address_map.py <dfg_dir>", file=sys.stderr)
        return 1

    dfg_dir = sys.argv[1]
    gep_map_path = os.path.join(dfg_dir, "gep_field_map.json")
    if not os.path.isfile(gep_map_path):
        print(f"ERROR: gep_field_map.json not found in {dfg_dir}", file=sys.stderr)
        return 1

    id_to_info = load_gep_field_map(gep_map_path)
    sorted_lines = collect_all_trace_lines(dfg_dir)

    if not sorted_lines:
        print("WARNING: No trace lines found in access_trace.*.txt", file=sys.stderr)
        return 1

    addr_map = build_segmented_map(sorted_lines, id_to_info)

    out_path = os.path.join(dfg_dir, "address_map.json")
    with open(out_path, "w") as f:
        json.dump(addr_map, f, indent=2)

    conflict_addrs = sum(1 for v in addr_map.values() if v["has_conflict"])
    total_segments = sum(len(v["segments"]) for v in addr_map.values())
    total_accesses = sum(v["total_accesses"] for v in addr_map.values())

    print(f"Address map written to {out_path}")
    print(f"  Unique addresses: {len(addr_map)}")
    print(f"  Total segments:   {total_segments}")
    print(f"  Conflict addrs:   {conflict_addrs}")
    print(f"  Total accesses:   {total_accesses}")

    if conflict_addrs > 0:
        print(f"\n  Address reuse detected at {conflict_addrs} address(es):")
        for addr, state in addr_map.items():
            if state["has_conflict"]:
                segs = state["segments"]
                changes = []
                for s in segs:
                    changes.append(
                        f"    [{s['ts_first']}-{s['ts_last']}] "
                        f"{s['struct']}.field{s['field']} "
                        f"({s['field_type']}, {s['field_size']}B, "
                        f"{s['access_count']} accesses)"
                    )
                print(f"  {addr} ({state['region']}):")
                print("\n".join(changes))

    return 0


if __name__ == "__main__":
    sys.exit(main())
