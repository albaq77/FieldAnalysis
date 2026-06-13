"""Shared utilities for FieldAnalysis Python tools.

Provides unified data loading and field metadata computation
used by analyze.py, build_dfg.py, and resolve_trace.py.
"""

import json
import os
import sys
from dataclasses import dataclass
from typing import Dict, Optional, Tuple

SCALAR_SIZES = {
    "float": 4,
    "double": 8,
    "i8": 1,
    "i16": 2,
    "i32": 4,
    "i64": 8,
    "ptr": 8,
    "unknown": 0,
}


@dataclass
class FieldMetadata:
    struct_name: str
    field_idx: int
    byte_offset: int
    field_id: int
    field_type: str = "?"
    field_size: int = 0
    source_file: str = ""
    source_line: int = 0

    def as_tuple(self) -> Tuple[str, int, int]:
        return (self.struct_name, self.field_idx, self.byte_offset)


class FieldMetadataLoader:
    def __init__(self, strict: bool = False):
        self.strict = strict

    def _warn(self, msg: str) -> None:
        print(f"Warning: {msg}", file=sys.stderr)

    def _handle_missing(self, path: str, description: str) -> None:
        msg = f"{description} not found: {path}"
        if self.strict:
            raise FileNotFoundError(msg)
        self._warn(msg)

    def load_gep_field_map(self, path: str) -> Dict[int, FieldMetadata]:
        if not os.path.isfile(path):
            self._handle_missing(path, "GEP field map file")
            return {}

        with open(path, "r") as f:
            data = json.load(f)

        result = {}
        for key, entry in data.items():
            fid = entry.get("id")
            if fid is None:
                continue
            fid_int = int(fid)
            result[fid_int] = FieldMetadata(
                struct_name=entry.get("struct", "unknown"),
                field_idx=entry.get("field", 0),
                byte_offset=entry.get("offset", 0),
                field_id=fid_int,
                source_file=entry.get("source", {}).get("file", ""),
                source_line=entry.get("source", {}).get("line", 0),
            )
        return result

    def load_struct_layout(self, path: str) -> Dict:
        if not os.path.isfile(path):
            self._handle_missing(path, "Struct layout file")
            return {"structs": {}}

        with open(path, "r") as f:
            return json.load(f)

    def enrich_field_sizes(
        self, gep_map: Dict[int, FieldMetadata], struct_layout: Dict
    ) -> None:
        structs = struct_layout.get("structs", {})
        for fid, meta in gep_map.items():
            sname = meta.struct_name
            if sname.startswith("scalar."):
                remainder = sname[len("scalar."):]
                type_name = remainder.split(".")[0] if "." in remainder else remainder
                meta.field_type = type_name
                meta.field_size = SCALAR_SIZES.get(type_name, 0)
            elif sname in structs:
                fields = structs[sname].get("fields", [])
                if meta.field_idx < len(fields):
                    finfo = fields[meta.field_idx]
                    meta.field_type = finfo.get("type", "?")
                    meta.field_size = finfo.get("size", 0)

    def get_field_size(
        self, fid: int, gep_map: Dict[int, FieldMetadata],
        struct_layout: Dict, default: int = 0
    ) -> int:
        if fid not in gep_map:
            return default
        meta = gep_map[fid]
        if meta.field_size > 0:
            return meta.field_size

        sname = meta.struct_name
        if sname.startswith("scalar."):
            remainder = sname[len("scalar."):]
            type_name = remainder.split(".")[0] if "." in remainder else remainder
            return SCALAR_SIZES.get(type_name, 0)

        structs = struct_layout.get("structs", {})
        st = structs.get(sname)
        if st:
            fields = st.get("fields", [])
            if meta.field_idx < len(fields):
                return fields[meta.field_idx].get("size", 0)
        return default

    def get_field_name(
        self, fid: int, gep_map: Dict[int, FieldMetadata], struct_layout: Dict
    ) -> str:
        if fid not in gep_map:
            return f"unknown_{fid}"

        meta = gep_map[fid]
        sname = meta.struct_name
        fidx = meta.field_idx

        if sname.startswith("scalar."):
            remainder = sname[len("scalar."):]
            if "." in remainder:
                return remainder.split(".", 1)[1]
            return remainder

        raw_name = sname
        if raw_name.startswith("struct."):
            raw_name = raw_name[7:]
        elif raw_name.startswith("class."):
            raw_name = raw_name[6:]

        structs = struct_layout.get("structs", {})
        st = structs.get(sname)
        if st:
            fields = st.get("fields", [])
            if fidx < len(fields):
                field_name = fields[fidx].get("name", f"field_{fidx}")
                return f"{raw_name}.{field_name}"

        return f"{raw_name}.field{fidx}"

    def resolve_field_name(
        self, fid: int, gep_map: Dict[int, FieldMetadata], struct_layout: Dict
    ) -> Tuple[str, str, int]:
        if fid not in gep_map:
            return f"f{fid}", "?", 0
        meta = gep_map[fid]
        name = self.get_field_name(fid, gep_map, struct_layout)
        return name, meta.field_type, meta.field_size
