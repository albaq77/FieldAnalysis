import struct
import json
import sys
import os
import re
import glob
import argparse
from collections import defaultdict

from field_analysis_utils import FieldMetadataLoader

from trace_io import collect_files, read_files

def collect_trace_files(path):
    return collect_files(path)

def parse_binary_trace(files):
    return read_files([f for f in files if str(f).endswith('.bin')])

def parse_text_trace(files):
    return read_files([f for f in files if str(f).endswith('.txt')])

def require_single_module(records):
    if any(r.get("schema_version") == 3 for r in records):
        raise ValueError("v3 logical objects require build_access_graph.py")
    keys = {(r.get('pid'), r.get('run_id'), r.get('module_id')) for r in records}
    if len(keys) > 1:
        raise ValueError('Legacy field graph requires one run/module; use export_trace.py for all events')

def build_dfg_edges(records, window_size=10, dedup=True):
    require_single_module(records)
    edges = defaultdict(int)
    window = []
    window_keys = set()
    for rec in records:
        fid = rec['fid']
        addr = rec.get('addr', 0)
        key = (fid, addr) if dedup else fid
        if dedup and key in window_keys:
            continue
        for item in window:
            other_fid = item[0]
            a, b = (fid, other_fid) if fid < other_fid else (other_fid, fid)
            edges[(a, b)] += 1
        window.append((fid, key))
        window_keys.add(key)
        if len(window) > window_size:
            old = window.pop(0)
            window_keys.discard(old[1])
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
        fname, ftype, fsize, fcat = loader.resolve_field_full(fid, gep_map, struct_layout)
        size_str = f"{fsize}" if fsize > 0 else "0"
        if color_by_region:
            region = fid_region.get(fid, "G")
            color = region_colors.get(region, "white")
        else:
            color = "lightblue"
        lines.append(f'  {fid} [label="{fname}", type="{ftype}", size="{size_str}", cat="{fcat}", fillcolor="{color}"];')

    for (a, b), w in sorted(edges.items(), key=lambda x: -x[1]):
        penwidth = max(1.0, min(6.0, 1.0 + w * 0.3))
        lines.append(f'  {a} -> {b} [label="{w}", weight="{w}", penwidth="{penwidth:.1f}"];')

    lines.append("}")
    return "\n".join(lines)


def generate_four_dfgs(records, gep_map, struct_layout, loader, output_dir=".", window_size=10, dedup=True):
    region_records = {"G": [], "H": [], "S": []}
    for rec in records:
        region = rec['region']
        if region in region_records:
            region_records[region].append(rec)

    for region, recs in region_records.items():
        name = {"G": "global", "H": "heap", "S": "stack"}[region]
        region_edges = build_dfg_edges(recs, window_size=window_size, dedup=dedup)
        fids = set()
        for a, b in region_edges:
            fids.add(a)
            fids.add(b)
        dot = generate_dot(region_edges, fids, gep_map, struct_layout, loader, title=f"DFG-{name}")
        with open(os.path.join(output_dir, f"dfg_{name}.dot"), "w") as f:
            f.write(dot)

    unified_edges = build_dfg_edges(records, window_size=window_size, dedup=dedup)
    all_fids = set()
    for a, b in unified_edges:
        all_fids.add(a)
        all_fids.add(b)
    dot = generate_dot(unified_edges, all_fids, gep_map, struct_layout, loader, title="DFG-unified", color_by_region=True, records=records)
    with open(os.path.join(output_dir, "dfg_unified.dot"), "w") as f:
        f.write(dot)


def decode_trace(records, gep_map, struct_layout, loader, output_path):
    import csv
    columns = ['timestamp_ns', 'event_index', 'address', 'access_size', 'mode',
               'cpu_id', 'os_tid', 'thread_instance', 'thread_seq', 'module_id',
               'site_id', 'fid', 'field_name', 'declared_field_size', 'region']
    with open(output_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=columns)
        writer.writeheader()
        for rec in records:
            name, _, field_size = loader.resolve_field_name(rec['fid'], gep_map, struct_layout)
            row = {key: rec.get(key) for key in columns}
            row.update(address=hex(rec['addr']), field_name=name,
                       declared_field_size=field_size)
            writer.writerow(row)


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
    parser.add_argument("--window-size", type=int, default=10, help="Sliding window size for edge co-occurrence (default: 10)")
    parser.add_argument("--no-dedup", action="store_true", help="Disable deduplication of same (fid,addr) within window")
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

    require_single_module(records)
    if records[0].get('schema_version') == 2:
        print('Note: legacy field co-occurrence graph; not the fixed-window FS graph. Region is unknown (U).', file=sys.stderr)
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
        generate_four_dfgs(records, gep_map, struct_layout, loader,
                           window_size=args.window_size, dedup=not args.no_dedup)
        print("Generated 4 DFG DOT files in ./")


if __name__ == "__main__":
    main()
