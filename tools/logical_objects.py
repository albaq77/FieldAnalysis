"""Validate v3 object lifetimes and resolve scalar logical coordinates."""
import json
from pathlib import Path


def location(row, descriptor, extent):
    size = descriptor["element_size"]
    if not isinstance(size, int) or size <= 0:
        raise ValueError("invalid element size")
    shape = descriptor.get("shape") or [extent // size]
    if not shape or any(not isinstance(dim, int) or dim <= 0 for dim in shape):
        raise ValueError("invalid object shape")
    strides = descriptor.get("strides")
    if strides is None:
        strides = []
        step = size
        for dim in reversed(shape):
            strides.insert(0, step)
            step *= dim
    if len(strides) != len(shape) or any(not isinstance(s, int) or s <= 0 for s in strides):
        raise ValueError("invalid object strides")
    offset = row["object_offset"]
    indices = []
    for dim, step in zip(shape, strides):
        index, offset = divmod(offset, step)
        if index >= dim:
            raise ValueError("event outside configured shape")
        indices.append(index)
    fields = descriptor.get("fields") or [{"name": "value", "offset": 0, "size": size}]
    for field in fields:
        if offset == field["offset"] and row["access_size"] == field["size"]:
            return indices, field["name"]
    return indices, "partial" if row["access_size"] <= size else "range"


def validate(path, pid, run_id, rows):
    base = Path(path)
    lifecycle = base / f"objects.{pid}.{run_id}.jsonl"
    status_path = base / f"logical_status.{pid}.{run_id}.json"
    if not lifecycle.is_file() or not status_path.is_file():
        raise ValueError("missing logical object log or status")
    status = json.loads(status_path.read_text())
    if (status["schema_version"] != 3 or status["object_errors"] or
            status["selected"] != len(rows) or
            status["candidates"] != status["filtered"] + status["selected"]):
        raise ValueError("logical event counts do not match status")
    objects = {}
    for line in lifecycle.read_text().splitlines():
        entry = json.loads(line)
        oid = entry["object_id"]
        if entry["event"] == "alloc":
            if oid in objects:
                raise ValueError("duplicate object id")
            objects[oid] = entry
        elif entry["event"] == "free":
            if oid not in objects or objects[oid].get("retired"):
                raise ValueError("invalid object retirement")
            objects[oid]["retired"] = True
        else:
            raise ValueError("unknown object event")
    if status["objects"] != len(objects):
        raise ValueError("object count differs from lifecycle log")
    for row in rows:
        obj = objects.get(row["object_id"])
        if obj is None:
            raise ValueError("event references unregistered object")
        base_address = int(obj["base"], 16)
        if (row["address"] != base_address + row["object_offset"] or
                row["object_offset"] + row["access_size"] > obj["extent"]):
            raise ValueError("event address or size differs from object")
        row["object_name"] = obj["descriptor"]["name"]
        row["logical_index"], row["field_path"] = location(row, obj["descriptor"], obj["extent"])
        if row["field_path"] == "range":
            raise ValueError("range access cannot be mapped as scalar")
