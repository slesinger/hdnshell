"""
Shared rendering for the `file` command's output.

`file` works on more than one device -- the Ultimate's own filesystem (stat'd
over FTP MLSD by handlers/ultimate_handler.py) and the server-local workspace
behind the #n network drive (stat'd with os.stat by handlers/netdrive_handler.py)
-- and both must print an identical block. The device-specific half is only
"how do I stat this thing"; everything downstream of that is here, keyed off a
small facts dict shaped exactly like ftplib's mlsd() facts:

    {"type": "file"|"dir", "size": "12345", "modify": "20260704155418"}

so the FTP path can pass MLSD's dict straight through and the local path just
builds the same shape (see facts_from_stat).
"""

import posixpath

# The Ultimate reports this as a placeholder for entries that carry no real
# timestamp -- hardware-verified on the filesystem root's pseudo-dirs (SD, Flash,
# Temp, USB0), while real files do report a true mtime. Rendering it as a
# believable "1980-01-01" would be a lie, so it is labelled instead.
_NO_TIMESTAMP_PREFIX = "19800101"


def facts_from_stat(st, is_dir: bool) -> dict:
    """Build mlsd()-shaped facts from an os.stat_result."""
    import time

    return {
        "type": "dir" if is_dir else "file",
        "size": str(st.st_size),
        "modify": time.strftime("%Y%m%d%H%M%S", time.localtime(st.st_mtime)),
    }


def type_of(name: str) -> str:
    """PRG / D64 / ... from the extension; FILE when there is none."""
    ext = posixpath.splitext(name)[1].lstrip(".").upper()
    return ext or "FILE"


def format_modify(modify) -> str:
    """MLSD 'modify' is YYYYMMDDHHMMSS (RFC 3659). Render it readably."""
    if not modify:
        return "?"
    s = str(modify)
    if len(s) < 14 or not s.isdigit():
        return s
    if s.startswith(_NO_TIMESTAMP_PREFIX):
        return "(not set)"
    return f"{s[0:4]}-{s[4:6]}-{s[6:8]} {s[8:10]}:{s[10:12]}:{s[12:14]}"


def format_file_info(name: str, facts: dict) -> str:
    """Render one entry as a 40-column-friendly block."""
    is_dir = facts.get("type") == "dir"

    lines = [f"NAME     {name}"]
    lines.append(f"TYPE     {'DIR' if is_dir else type_of(name)}")

    if not is_dir:
        size = facts.get("size")
        lines.append(f"SIZE     {size} BYTES" if size is not None else "SIZE     ?")

    lines.append(f"MODIFIED {format_modify(facts.get('modify'))}")
    return "\n".join(lines)
