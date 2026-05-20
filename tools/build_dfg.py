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
        fname = os.path.basename(f)
        if fsize == 0:
            continue
        if fsize % RECORD_SIZE != 0:
            remaining = fsize % RECORD_SIZE
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


def load_field_info(gep_map_path, layout_path):
    fid_info = {}

    if os.path.isfile(gep_map_path):
        with open(gep_map_path, "r") as f:
            gep_data = json.load(f)
        for value in gep_data.values():
            fid = value["id"]
            sname = value["struct"]
            fidx = value["field"]
            boff = value["offset"]
            src_file = value.get("source", {}).get("file", "")
            src_line = value.get("source", {}).get("line", 0)
            fid_info[fid] = {
                "struct": sname,
                "field_idx": fidx,
                "byte_offset": boff,
                "source_file": src_file,
                "source_line": src_line,
            }

    struct_fields = {}
    if os.path.isfile(layout_path):
        with open(layout_path, "r") as f:
            layout_data = json.load(f)
        structs = layout_data.get("structs", {})
        for sname, sdata in structs.items():
            fields = sdata.get("fields", [])
            field_map = {}
            for fld in fields:
                field_map[fld["idx"]] = {
                    "type": fld.get("type", "?"),
                    "offset": fld.get("offset", 0),
                    "size": fld.get("size", 0),
                }
            struct_fields[sname] = field_map

    for fid, info in fid_info.items():
        sname = info["struct"]
        fidx = info["field_idx"]
        if sname in struct_fields and fidx in struct_fields[sname]:
            finfo = struct_fields[sname][fidx]
            info["field_type"] = finfo["type"]
            info["field_size"] = finfo["size"]
            info["field_offset_in_struct"] = finfo["offset"]
        else:
            info["field_type"] = "?"
            info["field_size"] = 0
            info["field_offset_in_struct"] = 0

    return fid_info


def resolve_field_name(fid, fid_info):
    if fid not in fid_info:
        return f"f{fid}", "?", 0
    info = fid_info[fid]
    sname = info["struct"]
    fidx = info["field_idx"]
    raw_name = sname
    if raw_name.startswith("struct."):
        raw_name = raw_name[7:]
    elif raw_name.startswith("class."):
        raw_name = raw_name[6:]
    return f"{raw_name}.field{fidx}", info.get("field_type", "?"), info.get("field_size", 0)


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


def generate_dot(edges, fids, fid_info, title="DFG", color_by_region=False, records=None):
    lines = [f"// {title}", "strict digraph {", f'  label="{title}";', "  node [shape=record, style=filled];"]

    region_colors = {"G": "lightblue", "H": "lightcoral", "S": "lightgreen"}

    fid_region = {}
    if records and color_by_region:
        for rec in records:
            fid_region[rec['fid']] = rec['region']

    nodes = set(fids)
    for fid in sorted(nodes):
        fname, ftype, fsize = resolve_field_name(fid, fid_info)
        label = f"{fid}: {fname}\\n{ftype} ({fsize}B)"
        if color_by_region:
            color = region_colors.get(fid_region.get(fid, "G"), "white")
        else:
            color = "lightblue"
        lines.append(f'  {fid} [label="{label}", fillcolor="{color}"];')

    for (a, b), w in sorted(edges.items(), key=lambda x: -x[1]):
        lines.append(f'  {a} -> {b} [label="weight={w}", weight="{w}"];')

    lines.append("}")
    return "\n".join(lines)


def generate_four_dfgs(records, fid_info, output_dir="."):
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
        dot = generate_dot(region_edges, fids, fid_info, title=f"DFG-{name}")
        with open(os.path.join(output_dir, f"dfg_{name}.dot"), "w") as f:
            f.write(dot)

    unified_edges = build_dfg_edges(records)
    all_fids = set()
    for a, b in unified_edges:
        all_fids.add(a)
        all_fids.add(b)
    dot = generate_dot(unified_edges, all_fids, fid_info, title="DFG-unified", color_by_region=True, records=records)
    with open(os.path.join(output_dir, "dfg_unified.dot"), "w") as f:
        f.write(dot)


def decode_trace(records, fid_info, output_path):
    with open(output_path, "w") as f:
        f.write("# ts | field_name | type | size | addr | r/w | region\n")
        for rec in records:
            fname, ftype, fsize = resolve_field_name(rec['fid'], fid_info)
            rw = 'W' if rec['is_write'] == 1 else 'M' if rec['is_write'] == 2 else 'R'
            f.write(f"[{rec['ts']}] {fname} {ftype} {fsize}B 0x{rec['addr']:x} {rw} {rec['region']}\n")


def print_summary(records, fid_info):
    fid_stats = defaultdict(lambda: {"count": 0, "reads": 0, "writes": 0, "regions": defaultdict(int)})
    for rec in records:
        fid = rec['fid']
        fid_stats[fid]["count"] += 1
        if rec['is_write'] == 1:
            fid_stats[fid]["writes"] += 1
        else:
            fid_stats[fid]["reads"] += 1
        fid_stats[fid]["regions"][rec['region']] += 1

    print(f"\n{'Field':<30} {'Type':<12} {'Size':>4} {'Total':>8} {'Reads':>8} {'Writes':>8} {'Region'}")
    print("-" * 100)
    for fid in sorted(fid_stats.keys(), key=lambda x: fid_stats[x]["count"], reverse=True):
        fname, ftype, fsize = resolve_field_name(fid, fid_info)
        st = fid_stats[fid]
        regions = "/".join(f"{k}:{v}" for k, v in sorted(st["regions"].items()))
        print(f"{fname:<30} {ftype:<12} {fsize:>4} {st['count']:>8} {st['reads']:>8} {st['writes']:>8} {regions}")


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

    fid_info = load_field_info(args.gep_map, args.layout)

    if args.summary:
        print_summary(records, fid_info)

    if args.decode:
        decode_trace(records, fid_info, args.decode)
        print(f"Decoded trace written to {args.decode}")

    if not args.no_dfg:
        generate_four_dfgs(records, fid_info)
        print("Generated 4 DFG DOT files in ./")


if __name__ == "__main__":
    main()
