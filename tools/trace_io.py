"""Versioned trace reader. Missing v1 fields remain None; malformed input fails."""
import csv
import json
import re
import struct
from pathlib import Path

MAGIC = b"FATRCV2\0"
MAGIC_V3 = b"FATRCV3\0"
HEADER = struct.Struct("<8sIIQQ")
RECORD = struct.Struct("<7Q2Ii3I")
RECORD_V3 = struct.Struct("<7Q2Ii3I2Q")
LEGACY = struct.Struct("<QIxxxxQib3x")
FIELDS = ("timestamp_ns", "address", "access_size", "thread_instance", "thread_seq",
          "module_id", "os_tid", "site_id", "fid", "cpu_id", "mode", "flags")
MODES = {0: "R", 1: "W", 2: "RMW"}


def numeric_key(path):
    return tuple(int(n) for n in re.findall(r"\d+", Path(path).name))


def collect_files(path, text=False):
    p = Path(path)
    if p.is_file():
        return [str(p)]
    files = list(p.glob("access_trace.*.txt" if text else "trace.*.bin"))
    if not files and not text:
        files = list(p.glob("access_trace.*.txt"))
    return [str(f) for f in sorted(files, key=numeric_key)]


def _v2(values, pid, run_id):
    row = dict(zip(FIELDS, values))
    if row["mode"] not in MODES or row["access_size"] <= 0:
        raise ValueError("invalid v2 mode or access_size")
    if row["thread_seq"] <= 0 or row["thread_instance"] <= 0 or row["os_tid"] <= 0:
        raise ValueError("invalid v2 event identity")
    if row["timestamp_ns"] == 0 and not row["flags"] & 16:
        raise ValueError("zero timestamp without observation-error flag")
    if row["cpu_id"] < 0 and not row["flags"] & 16:
        raise ValueError("missing CPU without observation-error flag")
    row.update(schema_version=2, pid=pid, run_id=run_id,
               ts=row["timestamp_ns"], addr=row["address"],
               is_write=row["mode"], region="U")
    row["mode"] = MODES[row["mode"]]
    return row


def _v3(values, pid, run_id):
    row = _v2(values[:-2], pid, run_id)
    row.update(schema_version=3, object_id=values[-2], object_offset=values[-1])
    if not row["object_id"]:
        raise ValueError("v3 event has no object identity")
    return row


def _v1(ts, fid, addr, rw, region):
    if rw not in (0, 1, 2) or region not in "GHS":
        raise ValueError("invalid legacy record")
    row = {key: None for key in FIELDS}
    row.update(schema_version=1, ts=ts, event_index=ts, fid=fid, addr=addr,
               address=addr, is_write=rw, mode={0: "R", 1: "W", 2: "M"}[rw],
               region=region, pid=None, run_id=None)
    return row


def read_binary(path):
    data = Path(path).read_bytes()
    if not data:
        return []
    if data.startswith(b"FATRC"):
        if len(data) < HEADER.size:
            raise ValueError(f"truncated v2 header: {path}")
        magic, version, size, pid, run_id = HEADER.unpack_from(data)
        if (magic, version, size) not in ((MAGIC, 2, RECORD.size),
                                          (MAGIC_V3, 3, RECORD_V3.size)):
            raise ValueError(f"unsupported trace header: {path}")
        payload = data[HEADER.size:]
        if len(payload) % size:
            raise ValueError(f"truncated trace record: {path}")
        rows = []
        for values in (RECORD_V3 if version == 3 else RECORD).iter_unpack(payload):
            if values[12] != 0:
                raise ValueError("nonzero reserved field")
            rows.append(_v3(values[:12] + values[13:], pid, run_id) if version == 3
                        else _v2(values[:-1], pid, run_id))
        return rows
    if len(data) % LEGACY.size:
        raise ValueError(f"truncated legacy record: {path}")
    return [_v1(ts, fid, addr, rw, chr(region))
            for ts, fid, addr, rw, region in LEGACY.iter_unpack(data)]


def read_text(path):
    with open(path) as f:
        first = f.readline()
        if first.startswith("#FA_TRACE"):
            m = re.fullmatch(r"#FA_TRACE_V([23]) pid=(\d+) run_id=(\d+)\n?", first)
            if not m:
                raise ValueError("invalid text trace header")
            version, pid, run_id = map(int, m.groups())
            reader = csv.DictReader(f)
            columns = (*FIELDS, *(("object_id", "object_offset") if version == 3 else ()))
            if reader.fieldnames != list(columns):
                raise ValueError("unexpected text trace columns")
            rows = []
            for row in reader:
                if None in row or any(v is None for v in row.values()):
                    raise ValueError("truncated text record")
                if row["mode"] not in MODES.values():
                    raise ValueError("invalid text access mode")
                values = [list(MODES.values()).index(row[k]) if k == "mode"
                          else int(row[k], 16) if k == "address" else int(row[k])
                          for k in columns]
                rows.append(_v3(values, pid, run_id) if version == 3 else _v2(values, pid, run_id))
            return rows
        f.seek(0)
        rows = []
        for line in f:
            if not line.strip():
                continue
            m = re.fullmatch(r"\[?(\d+)\]?\s+(\d+)\s+([RWM])\s+0x([\da-fA-F]+)\s+([GHS])\s*", line)
            if not m:
                raise ValueError(f"invalid legacy text record in {path}")
            ts, fid, rw, addr, region = m.groups()
            rows.append(_v1(int(ts), int(fid), int(addr, 16), {"R": 0, "W": 1, "M": 2}[rw], region))
        return rows


def merge_records(rows):
    versions = {r["schema_version"] for r in rows}
    if len(versions) > 1:
        raise ValueError("cannot merge different trace schemas")
    if versions in ({2}, {3}):
        rows.sort(key=lambda r: (r["run_id"], r["pid"], r["timestamp_ns"], r["thread_instance"], r["thread_seq"]))
        seen = set()
        last_seq = {}
        for r in rows:
            thread = (r["run_id"], r["pid"], r["thread_instance"])
            key = thread + (r["thread_seq"],)
            if key in seen or r["thread_seq"] <= last_seq.get(thread, 0):
                raise ValueError("duplicate event or timestamp/thread sequence inconsistency")
            seen.add(key)
            last_seq[thread] = r["thread_seq"]
    else:
        rows.sort(key=lambda r: r["ts"])
    return rows


def read_files(files):
    rows = []
    for path in files:
        rows.extend(read_binary(path) if str(path).endswith(".bin") else read_text(path))
    return merge_records(rows)


def read_trace(path):
    return read_files(collect_files(path))


def check_complete(path, rows):
    """Check observed stream integrity AND available static coverage reports."""
    base = Path(path)
    if not rows or any(r["schema_version"] != rows[0]["schema_version"] for r in rows):
        raise ValueError("empty or mixed trace cannot certify completeness")
    schema = rows[0]["schema_version"]
    if schema == 1:
        raise ValueError("v1 cannot certify six-field completeness")
    runs = {(r["pid"], r["run_id"]) for r in rows}
    if not runs:
        raise ValueError("no observed v2 run")
    for pid, run_id in runs:
        runpath = base/f"trace_run.{pid}.{run_id}.0.0.json"
        if not runpath.exists():
            raise ValueError("missing normal process-exit status")
        run = json.loads(runpath.read_text())
        if not run["normal_exit"] or run["active_threads_at_exit"]:
            raise ValueError("run exited with active/unflushed threads")
        statuses = list(base.glob(f"trace_status.{pid}.{run_id}.*.0.json"))
        if len(statuses) != run["threads"]:
            raise ValueError("missing thread status")
        status_threads = set()
        for path in statuses:
            status = json.loads(path.read_text())
            thread = status["thread_instance"]
            if thread in status_threads or status["pid"] != pid or int(status["run_id"]) != run_id:
                raise ValueError("duplicate or mismatched thread status identity")
            status_threads.add(thread)
            if status["schema_version"] != schema or not status["complete"] or not status["finished"]:
                raise ValueError("sampled, lost, limited or incomplete trace")
            if (status["sample_rate"] != 1 or status["sampled_out"] or status["lost"] or
                    status["io_errors"] or status["capture_limited"]):
                raise ValueError("thread counters contradict complete capture")
            tr = [r for r in rows if (r["pid"], r["run_id"], r["thread_instance"]) ==
                  (pid, run_id, status["thread_instance"])]
            if len(tr) != status["emitted"] or status["observed"] != status["emitted"]:
                raise ValueError("record count disagrees with thread status")
            if [r["thread_seq"] for r in tr] != list(range(1, len(tr)+1)):
                raise ValueError("thread sequence has gaps")
            if any(r["flags"] & 16 for r in tr):
                raise ValueError("time/CPU observation failed")
        event_threads = {r["thread_instance"] for r in rows if (r["pid"], r["run_id"]) == (pid, run_id)}
        if not event_threads <= status_threads:
            raise ValueError("events have no matching thread status")
        if schema == 3:
            from logical_objects import validate
            validate(base, pid, run_id, [r for r in rows if (r["pid"], r["run_id"]) == (pid, run_id)])
    reports = {int(report["module_id"]): report for file in base.glob("access_sites.*.json")
               for report in [json.loads(file.read_text())]}
    if not {r["module_id"] for r in rows} <= reports.keys():
        raise ValueError("missing static coverage report")
    for report in reports.values():
        if report["unsupported_instructions"]:
            raise ValueError("module has unsupported memory operations")
    return True
