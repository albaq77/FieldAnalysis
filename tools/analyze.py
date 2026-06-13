import json
import struct
import sys
import os
import argparse

from field_analysis_utils import FieldMetadataLoader


def load_affinity_bin(path):
    if not os.path.isfile(path):
        print(f"Warning: Affinity binary file not found: {path}", file=sys.stderr)
        return []
    records = []
    record_size = 12
    with open(path, "rb") as f:
        while True:
            chunk = f.read(record_size)
            if len(chunk) < record_size:
                break
            a, b, count = struct.unpack("<III", chunk)
            if count > 0:
                records.append((a, b, count))
    return records


def build_graph(records):
    try:
        import networkx as nx

        G = nx.Graph()
        for a, b, w in records:
            G.add_edge(a, b, weight=w)
        return G, True
    except ImportError:
        pass

    G = {}
    edge_weights = {}
    for a, b, w in records:
        if a not in G:
            G[a] = set()
        if b not in G:
            G[b] = set()
        G[a].add(b)
        G[b].add(a)
        key = (min(a, b), max(a, b))
        edge_weights[key] = edge_weights.get(key, 0) + w
    return (G, edge_weights), False


def get_sorted_edges(graph_obj, uses_nx):
    if uses_nx:
        return sorted(graph_obj.edges(data=True), key=lambda e: e[2]["weight"], reverse=True)
    _, edge_weights = graph_obj
    return sorted(edge_weights.items(), key=lambda x: x[1], reverse=True)


def get_struct_fields(graph_obj, uses_nx, gep_map):
    if uses_nx:
        all_nodes = set(graph_obj.nodes())
    else:
        G, _ = graph_obj
        all_nodes = set(G.keys())

    by_struct = {}
    for fid in all_nodes:
        if fid in gep_map:
            sname = gep_map[fid].struct_name
            if sname not in by_struct:
                by_struct[sname] = set()
            by_struct[sname].add(fid)

    for fid, meta in gep_map.items():
        if fid not in all_nodes:
            sname = meta.struct_name
            if sname not in by_struct:
                by_struct[sname] = set()
            by_struct[sname].add(fid)

    return by_struct


def bin_pack_struct(struct_name, field_ids, graph_obj, uses_nx, gep_map, cacheline_size, struct_layout, loader):
    sorted_edges = get_sorted_edges(graph_obj, uses_nx)

    struct_field_set = set(field_ids)
    relevant_edges = []
    for edge in sorted_edges:
        if uses_nx:
            a, b, data = edge
            w = data["weight"]
        else:
            (a, b), w = edge
        if a in struct_field_set and b in struct_field_set:
            relevant_edges.append((a, b, w))

    relevant_edges.sort(key=lambda e: e[2], reverse=True)

    placed = set()
    bins = []
    current_bin = []
    current_bin_bytes = 0

    for a, b, w in relevant_edges:
        for fid in (a, b):
            if fid in placed:
                continue
            fsz = loader.get_field_size(fid, gep_map, struct_layout, default=8)
            if current_bin_bytes + fsz > cacheline_size:
                if current_bin:
                    bins.append(current_bin)
                current_bin = []
                current_bin_bytes = 0
            current_bin.append(fid)
            current_bin_bytes += fsz
            placed.add(fid)

    remaining = struct_field_set - placed
    sorted_remaining = sorted(
        remaining,
        key=lambda fid: gep_map[fid].byte_offset if fid in gep_map else 0
    )
    for fid in sorted_remaining:
        fsz = loader.get_field_size(fid, gep_map, struct_layout, default=8)
        if current_bin_bytes + fsz > cacheline_size:
            if current_bin:
                bins.append(current_bin)
            current_bin = []
            current_bin_bytes = 0
        current_bin.append(fid)
        current_bin_bytes += fsz
        placed.add(fid)

    if current_bin:
        bins.append(current_bin)

    result_bins = []
    for b in bins:
        result_bins.append([
            (gep_map[fid].field_idx, loader.get_field_size(fid, gep_map, struct_layout, default=8))
            for fid in b
        ])

    return result_bins


def main():
    parser = argparse.ArgumentParser(description="Offline GEP field affinity analysis for cacheline-aware struct reordering")
    parser.add_argument("--gep-map", default="gep_field_map.json", help="Path to gep_field_map.json (default: gep_field_map.json)")
    parser.add_argument("--layout", default="struct_layout.json", help="Path to struct_layout.json (default: struct_layout.json)")
    parser.add_argument("--affinity", default="affinity.bin", help="Path to affinity.bin (default: affinity.bin)")
    parser.add_argument("--output", default="reorder.json", help="Path to output reorder.json (default: reorder.json)")
    parser.add_argument("--cacheline", type=int, default=64, help="Cacheline size in bytes (default: 64)")
    parser.add_argument("--strict", action="store_true", help="Raise exceptions on missing files instead of warnings")
    args = parser.parse_args()

    loader = FieldMetadataLoader(strict=args.strict)

    gep_map = loader.load_gep_field_map(args.gep_map)
    if not gep_map:
        print("No field map data available. Exiting.")
        sys.exit(1)

    struct_layout = loader.load_struct_layout(args.layout)
    loader.enrich_field_sizes(gep_map, struct_layout)

    records = load_affinity_bin(args.affinity)
    if not records:
        print("No affinity data available. Outputting original field order only.")
        by_struct = {}
        for fid, meta in gep_map.items():
            sname = meta.struct_name
            if sname not in by_struct:
                by_struct[sname] = []
            by_struct[sname].append((meta.byte_offset, meta.field_idx))
        reorder = {}
        for sname, fields in by_struct.items():
            fields.sort()
            reorder[sname] = [[
                (fidx, loader.get_field_size(fid, gep_map, struct_layout, default=8))
                for _, fidx in fields
            ]]
        with open(args.output, "w") as f:
            json.dump(reorder, f, indent=2)
        print(f"Wrote {args.output} with original ordering (no affinity data).")
        return

    graph_obj, uses_nx = build_graph(records)
    if uses_nx:
        print("Using networkx for graph operations.")
    else:
        print("networkx not available, using simple dict-based graph.")

    by_struct = get_struct_fields(graph_obj, uses_nx, gep_map)
    if not by_struct:
        print("No struct fields found. Exiting.")
        sys.exit(1)

    reorder = {}
    total_structs = 0
    total_bins = 0
    total_fields = 0

    for sname, field_ids in sorted(by_struct.items()):
        bins = bin_pack_struct(sname, field_ids, graph_obj, uses_nx, gep_map, args.cacheline, struct_layout, loader)
        reorder[sname] = bins
        total_structs += 1
        total_bins += len(bins)
        total_fields += sum(len(b) for b in bins)

    with open(args.output, "w") as f:
        json.dump(reorder, f, indent=2)

    print(f"\nReordering Summary")
    print(f"==================")
    print(f"Structs analyzed:   {total_structs}")
    print(f"Total cacheline bins: {total_bins}")
    print(f"Total fields placed: {total_fields}")
    print(f"Cacheline size:      {args.cacheline} bytes")
    print(f"Field sizes:         from struct_layout.json")
    print(f"Output written to:   {args.output}")
    print()

    for sname in sorted(reorder.keys()):
        bins = reorder[sname]
        fields_in_struct = sum(len(b) for b in bins)
        print(f"  {sname}: {fields_in_struct} fields -> {len(bins)} cacheline(s)")
        for i, b in enumerate(bins):
            items = [f"f{fidx}({fsz}B)" for fidx, fsz in b]
            bin_bytes = sum(fsz for _, fsz in b)
            print(f"    cacheline {i}: [{bin_bytes}B] {', '.join(items)}")


if __name__ == "__main__":
    main()
