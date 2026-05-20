import struct
import json
import sys
import os
import re
import glob
import argparse
from collections import defaultdict

RECORD_SIZE = 32


def collect_trace_files(path):
    if os.path.isfile(path):
        return [path]
    pattern = os.path.join(path, "trace.*.bin")
    files = glob.glob(pattern)
    if not files:
        print("No trace files found", file=sys.stderr)
        sys.exit(1)

    def extract_index(f):
        m = re.search(r"trace\.(\d+)\.bin", os.path.basename(f))
        return int(m.group(1)) if m else -1

    files.sort(key=extract_index)
    return files


def parse_trace_files(files):
    records = []
    for f in files:
        fsize = os.path.getsize(f)
        fname = os.path.basename(f)
        if fsize == 0:
            print(f"Warning: {fname} is empty, skipping", file=sys.stderr)
            continue
        if fsize % RECORD_SIZE != 0:
            remaining = fsize % RECORD_SIZE
            print(f"Warning: {fname}: last {remaining} bytes truncated (not a complete record)", file=sys.stderr)
            fsize -= remaining
        with open(f, "rb") as fh:
            data = fh.read(fsize)
        for i in range(0, fsize, RECORD_SIZE):
            chunk = data[i:i + RECORD_SIZE]
            ts, fid, addr, is_write, region_byte = struct.unpack("<QIxxxxQib3x", chunk)
            region = chr(region_byte)
            records.append({
                'ts': ts,
                'fid': fid,
                'addr': addr,
                'is_write': is_write,
                'region': region,
            })
    return records


def load_field_map():
    layout_path = "struct_layout.json"
    if not os.path.isfile(layout_path):
        print("Warning: struct_layout.json not found, using raw field IDs", file=sys.stderr)
        return {}
    field_map = {}
    with open(layout_path, "r") as f:
        data = json.load(f)
        for key, val in data.items():
            fid = val.get("id")
            struct_name = val.get("struct", "")
            field_name = val.get("field", "")
            if fid is not None:
                field_map[str(fid)] = f"{struct_name}.{field_name}"
    return field_map


def build_dfg_edges(records, window_size=10):
    edges = defaultdict(int)
    window = []
    for rec in records:
        fid = rec['fid']
        for other_fid in window:
            a, b = (fid, other_fid) if fid < other_fid else (other_fid, fid)
            edges[(a, b)] += 1
        window.append(fid)
        if len(window) > window_size:
            window.pop(0)
    return edges


def generate_dot(edges, fids, field_map, title="DFG", color_by_region=False, records=None):
    lines = [f"// {title}", "strict digraph {", f'  label="{title}";', "  node [shape=record, style=filled];"]

    region_colors = {"G": "lightblue", "H": "lightcoral", "S": "lightgreen"}

    fid_region = {}
    if records and color_by_region:
        for rec in records:
            fid_region[rec['fid']] = rec['region']

    nodes = set(fids)
    for fid in sorted(nodes):
        label = field_map.get(str(fid), f"f{fid}")
        if color_by_region:
            color = region_colors.get(fid_region.get(fid, "G"), "white")
        else:
            color = "lightblue"
        lines.append(f'  {fid} [label="{fid}: {label}", fillcolor="{color}"];')

    for (a, b), w in sorted(edges.items(), key=lambda x: -x[1]):
        lines.append(f'  {a} -> {b} [label="weight={w}", weight="{w}"];')

    lines.append("}")
    return "\n".join(lines)


def generate_four_dfgs(records, field_map, output_dir="."):
    region_records = {"G": [], "H": [], "S": []}
    for rec in records:
        region = rec['region']
        if region in region_records:
            region_records[region].append(rec)

    for region, recs in region_records.items():
        name = {"G": "global", "H": "heap", "S": "stack"}[region]
        region_edges = build_dfg_edges(recs)
        fids = set()
        for a, b in region_edges:
            fids.add(a)
            fids.add(b)
        dot = generate_dot(region_edges, fids, field_map, title=f"DFG-{name}")
        with open(os.path.join(output_dir, f"dfg_{name}.dot"), "w") as f:
            f.write(dot)

    unified_edges = build_dfg_edges(records)
    all_fids = set()
    for a, b in unified_edges:
        all_fids.add(a)
        all_fids.add(b)
    dot = generate_dot(unified_edges, all_fids, field_map, title="DFG-unified", color_by_region=True, records=records)
    with open(os.path.join(output_dir, "dfg_unified.dot"), "w") as f:
        f.write(dot)


def main():
    parser = argparse.ArgumentParser(description="Build DFG from trace files")
    parser.add_argument("path", nargs="?", default=".", help="Directory or file path (default: .)")
    parser.add_argument("--start", type=int, default=0, help="Skip first N records")
    parser.add_argument("--end", type=int, default=None, help="Stop after record N")
    args = parser.parse_args()

    files = collect_trace_files(args.path)
    records = parse_trace_files(files)

    total = len(records)
    if args.start >= total:
        print(f"start exceeds total records ({total}), nothing to process")
        sys.exit(0)

    records = records[args.start:args.end]

    field_map = load_field_map()
    generate_four_dfgs(records, field_map)

    print(f"Generated 4 DFG DOT files in ./")


if __name__ == "__main__":
    main()