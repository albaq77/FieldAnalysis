import struct
import json
import sys
import os
import re
import glob
import argparse
from collections import defaultdict

from field_analysis_utils import FieldMetadataLoader

RECORD_SIZE = 32


def collect_trace_files(path):
    if os.path.isfile(path):
        return [path]
    pattern = os.path.join(path, "trace.*.bin")
    files = glob.glob(pattern)
    if not files:
        pattern = os.path.join(path, "access_trace.*.txt")
        files = glob.glob(pattern)
        if files:
            return sorted(files)
        print("No trace files found", file=sys.stderr)
        sys.exit(1)

    def extract_index(f):
        m = re.search(r"(?:trace|access_trace)\.(\d+)\.(?:bin|txt)", os.path.basename(f))
        return int(m.group(1)) if m else -1

    files.sort(key=extract_index)
    return files


def parse_binary_trace(files):
    records = []
    for f in files:
        if not f.endswith(".bin"):
            continue
        fsize = os.path.getsize(f)
        if fsize == 0:
            continue
        if fsize % RECORD_SIZE != 0:
            fsize -= fsize % RECORD_SIZE
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


def parse_text_trace(files):
    records = []
    for f in files:
        if not f.endswith(".txt"):
            continue
        with open(f, "r") as fh:
            for line in fh:
                line = line.strip()
                if not line:
                    continue
                m = re.match(r'\[(\d+)\]\s+(\d+)\s+([RWM])\s+0x([0-9a-fA-F]+)\s+([GHS])', line)
                if not m:
                    continue
                ts = int(m.group(1))
                fid = int(m.group(2))
                rw_char = m.group(3)
                addr = int(m.group(4), 16)
                region = m.group(5)
                is_write = 1 if rw_char == 'W' else 2 if rw_char == 'M' else 0
                records.append({
                    'ts': ts,
                    'fid': fid,
                    'addr': addr,
                    'is_write': is_write,
                    'region': region,
                })
    return records


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


def generate_dot(edges, fids, gep_map, struct_layout, loader, title="DFG", color_by_region=False, records=None):
    region_colors = {"G": "lightblue", "H": "lightcoral", "S": "lightgreen"}

    fid_region = {}
    if records and color_by_region:
        for rec in records:
            fid_region[rec['fid']] = rec['region']

    lines = [
        f"// {title}",
        "digraph {",
        f'  label="{title}";',
        "  node [shape=record, style=filled];",
    ]

    for fid in sorted(fids):
        fname, ftype, fsize = loader.resolve_field_name(fid, gep_map, struct_layout)
        size_str = f"{fsize}" if fsize > 0 else "0"
        if color_by_region:
            region = fid_region.get(fid, "G")
            color = region_colors.get(region, "white")
        else:
            color = "lightblue"
        lines.append(f'  {fid} [label="{fname}", type="{ftype}", size="{size_str}", fillcolor="{color}"];')

    for (a, b), w in sorted(edges.items(), key=lambda x: -x[1]):
        penwidth = max(1.0, min(6.0, 1.0 + w * 0.3))
        lines.append(f'  {a} -> {b} [label="{w}", weight="{w}", penwidth="{penwidth:.1f}"];')

    lines.append("}")
    return "\n".join(lines)


def generate_four_dfgs(records, gep_map, struct_layout, loader, output_dir="."):
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
        dot = generate_dot(region_edges, fids, gep_map, struct_layout, loader, title=f"DFG-{name}")
        with open(os.path.join(output_dir, f"dfg_{name}.dot"), "w") as f:
            f.write(dot)

    unified_edges = build_dfg_edges(records)
    all_fids = set()
    for a, b in unified_edges:
        all_fids.add(a)
        all_fids.add(b)
    dot = generate_dot(unified_edges, all_fids, gep_map, struct_layout, loader, title="DFG-unified", color_by_region=True, records=records)
    with open(os.path.join(output_dir, "dfg_unified.dot"), "w") as f:
        f.write(dot)


def decode_trace(records, gep_map, struct_layout, loader, output_path):
    with open(output_path, "w") as f:
        f.write("# ts | field_name | type | size | addr | r/w | region\n")
        for rec in records:
            fname, ftype, fsize = loader.resolve_field_name(rec['fid'], gep_map, struct_layout)
            rw = 'W' if rec['is_write'] == 1 else 'M' if rec['is_write'] == 2 else 'R'
            f.write(f"[{rec['ts']}] {fname} {ftype} {fsize}B 0x{rec['addr']:x} {rw} {rec['region']}\n")


def print_summary(records, gep_map, struct_layout, loader):
    fid_stats = defaultdict(lambda: {"count": 0, "reads": 0, "writes": 0, "regions": defaultdict(int)})
    for rec in records:
        fid = rec['fid']
        fid_stats[fid]["count"] += 1
        if rec['is_write'] == 1:
            fid_stats[fid]["writes"] += 1
        else:
            fid_stats[fid]["reads"] += 1
        fid_stats[fid]["regions"][rec['region']] += 1

    for fid in sorted(fid_stats.keys(), key=lambda x: fid_stats[x]["count"], reverse=True):
        fname, ftype, fsize = loader.resolve_field_name(fid, gep_map, struct_layout)
        st = fid_stats[fid]
        regions = "/".join(f"{k}:{v}" for k, v in sorted(st["regions"].items()))


def main():
    parser = argparse.ArgumentParser(description="Build DFG from trace files and decode field access trace")
    parser.add_argument("path", nargs="?", default=".", help="Directory or file path (default: .)")
    parser.add_argument("--start", type=int, default=0, help="Skip first N records")
    parser.add_argument("--end", type=int, default=None, help="Stop after record N")
    parser.add_argument("--gep-map", default="gep_field_map.json", help="Path to gep_field_map.json")
    parser.add_argument("--layout", default="struct_layout.json", help="Path to struct_layout.json")
    parser.add_argument("--decode", default=None, help="Output decoded trace to this file")
    parser.add_argument("--summary", action="store_true", help="Print field access summary")
    parser.add_argument("--no-dfg", action="store_true", help="Skip DFG generation")
    parser.add_argument("--strict", action="store_true", help="Raise exceptions on missing files instead of warnings")
    args = parser.parse_args()

    files = collect_trace_files(args.path)

    has_bin = any(f.endswith(".bin") for f in files)
    has_txt = any(f.endswith(".txt") for f in files)

    records = []
    if has_bin:
        records = parse_binary_trace(files)
    if has_txt and not records:
        records = parse_text_trace(files)

    if not records:
        print("No trace records found.", file=sys.stderr)
        sys.exit(1)

    total = len(records)
    if args.start >= total:
        print(f"start exceeds total records ({total}), nothing to process")
        sys.exit(0)

    records = records[args.start:args.end]

    loader = FieldMetadataLoader(strict=args.strict)
    gep_map = loader.load_gep_field_map(args.gep_map)
    struct_layout = loader.load_struct_layout(args.layout)
    loader.enrich_field_sizes(gep_map, struct_layout)

    if args.summary:
        print_summary(records, gep_map, struct_layout, loader)

    if args.decode:
        decode_trace(records, gep_map, struct_layout, loader, args.decode)
        print(f"Decoded trace written to {args.decode}")

    if not args.no_dfg:
        generate_four_dfgs(records, gep_map, struct_layout, loader)
        print("Generated 4 DFG DOT files in ./")


if __name__ == "__main__":
    main()
