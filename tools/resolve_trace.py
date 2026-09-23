#!/usr/bin/env python3
"""Resolve field labels without dropping the six raw access fields (v1/v2)."""
import argparse
import csv
from pathlib import Path
from field_analysis_utils import FieldMetadataLoader
from trace_io import FIELDS, collect_files, read_files


def resolve_trace_file(trace_path, gep_map, struct_layout, loader, output_path,
                       keep_timestamps=False, base=None):
    cache = {}
    records = read_files([trace_path])
    if any(rec["schema_version"] == 3 for rec in records):
        raise ValueError("v3 logical objects require export_trace.py")
    columns = ['schema_version', 'pid', 'run_id', *FIELDS, 'event_index',
               'field_name', 'declared_field_size', 'region']
    with open(output_path, 'w', newline='') as fout:
        writer = csv.DictWriter(fout, fieldnames=columns)
        writer.writeheader()
        for rec in records:
            fields, layout = gep_map, struct_layout
            module_id = rec.get('module_id')
            if base is not None and module_id is not None:
                if module_id not in cache:
                    mp = base/f'gep_field_map.{module_id}.json'
                    lp = base/f'struct_layout.{module_id}.json'
                    cache[module_id] = (loader.load_gep_field_map(str(mp)),
                                        loader.load_struct_layout(str(lp)))
                fields, layout = cache[module_id]
            row = {key: rec.get(key) for key in columns}
            row['address'] = hex(rec['address'])
            row['field_name'] = loader.get_nested_field_name(rec['fid'], fields, layout)
            row['declared_field_size'] = loader.get_field_size(rec['fid'], fields, layout)
            writer.writerow(row)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('path', nargs='?', default='.')
    parser.add_argument('--gep-map', default='gep_field_map.json')
    parser.add_argument('--layout', default='struct_layout.json')
    parser.add_argument('--output-dir')
    parser.add_argument('--keep-timestamps', action='store_true',
                        help='Compatibility option: timestamps are always retained in v2 output')
    parser.add_argument('--strict', action='store_true')
    args = parser.parse_args()
    base = Path(args.path)
    loader = FieldMetadataLoader(strict=args.strict)
    fields = loader.load_gep_field_map(str(base/args.gep_map))
    layout = loader.load_struct_layout(str(base/args.layout))
    files = collect_files(base, text=True)
    if not files:
        raise ValueError('No access_trace files found')
    target = Path(args.output_dir) if args.output_dir else base
    target.mkdir(parents=True, exist_ok=True)
    for f in files:
        name = Path(f).name.replace('access_trace.', 'variable_trace.', 1)
        resolve_trace_file(f, fields, layout, loader, target/name,
                           args.keep_timestamps, base)
        print(f'Resolved {f} -> {target/name}')
    return 0


if __name__ == '__main__':
    raise SystemExit(main())
