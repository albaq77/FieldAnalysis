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
    "int": 4,
    "unsigned int": 4,
    "uint": 4,
    "char": 1,
    "unsigned char": 1,
    "short": 2,
    "unsigned short": 2,
    "long": 8,
    "unsigned long": 8,
    "long long": 8,
    "unsigned long long": 8,
    "bool": 1,
    "_Bool": 1,
    "any pointer": 8,
    "void *": 8,
    "size_t": 8,
    "ssize_t": 8,
}


def _compute_array_size(type_str: str) -> int:
    import re
    m = re.match(r'\[\s*(\d+)\s*x\s*([^\]]+)\s*\]', type_str.strip())
    if not m:
        return 0
    count = int(m.group(1))
    elem_type = m.group(2).strip()
    elem_size = SCALAR_SIZES.get(elem_type, 0)
    if elem_size == 0:
        elem_size = _compute_array_size(elem_type)
    return count * elem_size


def _get_scalar_size(type_name: str) -> int:
    type_name = type_name.strip()
    if type_name in SCALAR_SIZES:
        return SCALAR_SIZES[type_name]
    if type_name.startswith("[") and "x" in type_name:
        return _compute_array_size(type_name)
    return 0


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
    access_path: list = None

    def as_tuple(self) -> Tuple[str, int, int]:
        return (self.struct_name, self.field_idx, self.byte_offset)


class FieldMetadataLoader:
    def __init__(self, strict: bool = False):
        self.strict = strict
        self._var_lookup = {}

    def _warn(self, msg: str) -> None:
        print(f"Warning: {msg}", file=sys.stderr)

    def _handle_missing(self, path: str, description: str) -> None:
        msg = f"{description} not found: {path}"
        if self.strict:
            raise FileNotFoundError(msg)
        self._warn(msg)

    def _build_var_lookup(self, struct_layout: Dict) -> None:
        self._var_lookup = {}
        variables = struct_layout.get("variables", {})
        for region in ("global", "heap_sites", "stack_vars"):
            for entry in variables.get(region, []):
                vtype = entry.get("type", "")
                vname = entry.get("name", "")
                func = entry.get("function", "")
                if not vname and func:
                    vname = func
                if not vname:
                    continue
                key = self._strip_struct_prefix(vtype)
                if key not in self._var_lookup:
                    self._var_lookup[key] = []
                self._var_lookup[key].append({
                    "name": vname,
                    "region": region,
                    "func": func,
                    "line": entry.get("line", 0),
                    "file": entry.get("file", ""),
                })

    def _find_var_name(self, struct_type: str, source_func: str = "") -> str:
        key = self._strip_struct_prefix(struct_type)
        candidates = self._var_lookup.get(key, [])
        if not candidates:
            return ""
        if source_func:
            for c in candidates:
                if c["func"] == source_func:
                    return c["name"]
        return candidates[0]["name"]

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
                access_path=entry.get("access_path", None),
            )
        return result

    def load_struct_layout(self, path: str) -> Dict:
        if not os.path.isfile(path):
            self._handle_missing(path, "Struct layout file")
            return {"structs": {}}

        with open(path, "r") as f:
            data = json.load(f)
        self._build_var_lookup(data)
        return data

    def enrich_field_sizes(
        self, gep_map: Dict[int, FieldMetadata], struct_layout: Dict
    ) -> None:
        structs = struct_layout.get("structs", {})
        for fid, meta in gep_map.items():
            sname = meta.struct_name
            if sname.startswith("scalar."):
                remainder = sname[len("scalar."):]
                if " = type " in remainder:
                    remainder = remainder.split(" = type ")[0]
                    for prefix in ("%struct.", "%union.", "%class.", "struct.", "union.", "class."):
                        if remainder.startswith(prefix):
                            remainder = remainder[len(prefix):]
                            break
                type_name = remainder.split(".")[0] if "." in remainder else remainder
                meta.field_type = type_name
                meta.field_size = _get_scalar_size(type_name)
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

    def _classify_type(self, type_str: str) -> str:
        if not type_str:
            return "unknown"
        t = type_str.strip()
        if t.startswith("[") or "x " in t:
            return "array"
        for prefix in ("struct.", "class.", "union.", "%struct.", "%class.", "%union."):
            if t.startswith(prefix):
                return "struct"
        if " = type " in t:
            return "struct"
        if t in SCALAR_SIZES:
            return "scalar"
        return "scalar"

    def _short_type(self, type_str: str) -> str:
        if not type_str:
            return "?"
        t = self._strip_struct_prefix(type_str)
        if " = type " in t:
            t = t.split(" = type ")[0].strip()
        if len(t) > 40:
            t = t[:37] + "..."
        return t

    def get_field_info(
        self, fid: int, gep_map: Dict[int, FieldMetadata], struct_layout: Dict
    ) -> Tuple[str, str, int, str]:
        if fid not in gep_map:
            return f"unknown_{fid}", "?", 0, "unknown"

        meta = gep_map[fid]
        sname = meta.struct_name
        fidx = meta.field_idx
        ftype = meta.field_type if meta.field_type != "?" else "?"
        fsize = meta.field_size
        source_func = ""
        if meta.source_file:
            source_func = meta.source_file

        if sname.startswith("scalar."):
            remainder = sname[len("scalar."):]
            if " = type " in remainder:
                type_def_part = remainder.split(" = type ")[0]
                after_type = remainder.split(" = type ", 1)[1] if " = type " in remainder else ""
                after_type = after_type.split("}", 1)[1] if "}" in after_type else after_type
                after_type = after_type.lstrip(".")
                clean_type = type_def_part
                for prefix in ("%struct.", "%union.", "%class.", "struct.", "union.", "class."):
                    if clean_type.startswith(prefix):
                        clean_type = clean_type[len(prefix):]
                        break
                if after_type:
                    var_name = after_type
                    type_name = clean_type
                else:
                    var_name = clean_type
                    type_name = clean_type
                if fsize == 0:
                    fsize = _get_scalar_size(type_name)
                if ftype == "?":
                    ftype = type_name
                return var_name, ftype, fsize, "scalar"
            if "." in remainder:
                parts = remainder.split(".", 1)
                type_name = parts[0]
                var_name = parts[1] if len(parts) > 1 else ""
                if not var_name:
                    var_name = type_name
                if fsize == 0:
                    fsize = _get_scalar_size(type_name)
                if ftype == "?":
                    ftype = type_name
                return var_name, ftype, fsize, "scalar"
            if fsize == 0:
                fsize = _get_scalar_size(remainder)
            if ftype == "?":
                ftype = remainder
            return remainder, ftype, fsize, "scalar"

        raw_name = self._strip_struct_prefix(sname)
        var_name = self._find_var_name(sname, source_func)
        base_name = var_name if var_name else raw_name

        structs = struct_layout.get("structs", {})
        st = structs.get(sname)
        field_type_str = ""
        if st:
            fields = st.get("fields", [])
            if fidx < len(fields):
                finfo = fields[fidx]
                field_type_str = finfo.get("type", "")
                if fsize == 0:
                    fsize = finfo.get("size", 0)
                if ftype == "?":
                    ftype = self._short_type(field_type_str)

        access_path = getattr(meta, 'access_path', None)
        if access_path and len(access_path) > 1:
            first_struct = access_path[0].get("struct", "")
            first_var = self._find_var_name(first_struct, source_func)
            first_base = first_var if first_var else self._strip_struct_prefix(first_struct)
            parts = [f"{first_base}.f{access_path[0].get('field', 0)}"]
            for i, step in enumerate(access_path[1:], 1):
                parts.append(f"f{step.get('field', 0)}")
            path_str = ".".join(parts)
            cat = self._classify_type(field_type_str) if field_type_str else "struct"
            return path_str, ftype, fsize, cat

        if field_type_str:
            cat = self._classify_type(field_type_str)
            return f"{base_name}.f{fidx}", ftype, fsize, cat

        return f"{base_name}.f{fidx}", ftype, fsize, "struct"

    def _strip_struct_prefix(self, type_str: str) -> str:
        if not type_str:
            return ""
        t = type_str.strip()
        for prefix in ("struct.", "class.", "union.", "%struct.", "%class.", "%union."):
            if t.startswith(prefix):
                return t[len(prefix):]
        if " = type " in t:
            t = t.split(" = type ")[0].strip()
            for prefix in ("struct.", "class.", "union.", "%struct.", "%class.", "%union."):
                if t.startswith(prefix):
                    return t[len(prefix):]
            return t
        return t

    def get_nested_field_name(
        self, fid: int, gep_map: Dict[int, FieldMetadata], struct_layout: Dict,
        raw_entry: Optional[Dict] = None
    ) -> str:
        name, _, _, _ = self.get_field_info(fid, gep_map, struct_layout)
        return name

    def resolve_field_name(
        self, fid: int, gep_map: Dict[int, FieldMetadata], struct_layout: Dict,
        raw_entry: Optional[Dict] = None
    ) -> Tuple[str, str, int]:
        name, ftype, fsize, _ = self.get_field_info(fid, gep_map, struct_layout)
        return name, ftype, fsize

    def resolve_field_full(
        self, fid: int, gep_map: Dict[int, FieldMetadata], struct_layout: Dict
    ) -> Tuple[str, str, int, str]:
        return self.get_field_info(fid, gep_map, struct_layout)
