"""
PSID/RSID (.sid) file header parsing + save-to-workspace helper.

Pure, testable module: no UI/network code. Used by the SID Browser console
(GH issue #28) to show load/init/play addresses and SID-model/clock/memory
info for a tune, and to write a fetched .sid file (plus a companion
license/credit note) into a demo's workspace folder.

Format reference: HVSC's SID_file_format.txt (PSID v1/v2NG/v3/v4, RSID).
All multi-byte header fields are big-endian, except the embedded load
address fallback (see `load_address` below), which is little-endian --
the normal C64 PRG convention.
"""

import os
import struct
from dataclasses import dataclass
from datetime import datetime, timezone
from typing import Optional, Tuple


class SidHeaderError(ValueError):
    """Raised when `data` is too short or not a PSID/RSID file."""


class HvscFetchError(Exception):
    """Raised when fetching HVSC metadata or a .sid file body fails."""


_CLOCK_NAMES = {0: "unknown", 1: "PAL", 2: "NTSC", 3: "PAL/NTSC"}
_MODEL_NAMES = {0: "unknown", 1: "6581", 2: "8580", 3: "6581/8580"}

_HEADER_MIN_LEN = 0x76  # v1 header size (up to and including `released`)
_V2_HEADER_LEN = 0x7C  # v2NG+ adds flags/startPage/pageLength (+relocation)


@dataclass
class SidHeader:
    magic: str
    version: int
    data_offset: int
    load_address: int
    init_address: int
    play_address: int
    songs: int
    start_song: int
    speed: int
    name: str
    author: str
    released: str
    # v2NG+ only (None when the file is v1 or too short to carry them)
    sid_model: Optional[str] = None
    clock: Optional[str] = None
    is_basic: Optional[bool] = None
    free_pages: Optional[Tuple[int, int]] = None  # (start_page, page_length)
    second_sid_address: Optional[int] = None
    third_sid_address: Optional[int] = None

    # -- display helpers -------------------------------------------------

    def load_address_display(self) -> str:
        return f"${self.load_address:04X}"

    def init_address_display(self) -> str:
        if self.init_address == 0:
            return "= load address"
        return f"${self.init_address:04X}"

    def play_address_display(self) -> str:
        if self.play_address == 0:
            return "init installs its own IRQ handler"
        return f"${self.play_address:04X}"

    def free_pages_display(self) -> str:
        if not self.free_pages or self.free_pages == (0, 0):
            return "no relocation info"
        start_page, page_length = self.free_pages
        start = start_page * 0x100
        end = start + page_length * 0x100 - 1
        return f"Uses ${start:04X}-${end:04X}"

    def is_multi_sid(self) -> bool:
        return bool(self.second_sid_address or self.third_sid_address)


def _decode_c_string(raw: bytes) -> str:
    """Decode a fixed-width, NUL-padded Windows-1252 header string field."""
    raw = raw.split(b"\x00", 1)[0]
    try:
        return raw.decode("cp1252", errors="replace").strip()
    except Exception:
        return raw.decode("ascii", errors="replace").strip()


def parse_sid_header(data: bytes) -> SidHeader:
    """Parse a PSID/RSID header from the raw bytes of a .sid file.

    Raises `SidHeaderError` if `data` is too short or the magic bytes don't
    match "PSID"/"RSID".
    """
    if len(data) < _HEADER_MIN_LEN:
        raise SidHeaderError(f"file too short for a SID header ({len(data)} bytes)")

    magic = data[0:4].decode("ascii", errors="replace")
    if magic not in ("PSID", "RSID"):
        raise SidHeaderError(f"unrecognised magic {magic!r}, expected PSID or RSID")

    (
        version,
        data_offset,
        load_address,
        init_address,
        play_address,
        songs,
        start_song,
    ) = struct.unpack(">HHHHHHH", data[4:0x12])
    speed = struct.unpack(">L", data[0x12:0x16])[0]
    name = _decode_c_string(data[0x16:0x36])
    author = _decode_c_string(data[0x36:0x56])
    released = _decode_c_string(data[0x56:0x76])

    # loadAddress == 0 means the real load address is embedded as a
    # little-endian word at the start of the data segment (the ordinary
    # C64 PRG load-address convention), rather than the header field.
    if load_address == 0:
        if len(data) >= data_offset + 2:
            load_address = struct.unpack("<H", data[data_offset : data_offset + 2])[0]

    header = SidHeader(
        magic=magic,
        version=version,
        data_offset=data_offset,
        load_address=load_address,
        init_address=init_address,
        play_address=play_address,
        songs=songs,
        start_song=start_song,
        speed=speed,
        name=name,
        author=author,
        released=released,
    )

    if version >= 2 and data_offset >= _V2_HEADER_LEN and len(data) >= _V2_HEADER_LEN:
        flags = struct.unpack(">H", data[0x76:0x78])[0]
        header.is_basic = bool(flags & 0x02)
        header.clock = _CLOCK_NAMES.get((flags >> 2) & 0x03, "unknown")
        header.sid_model = _MODEL_NAMES.get((flags >> 4) & 0x03, "unknown")
        start_page = data[0x78]
        page_length = data[0x79]
        header.free_pages = (start_page, page_length)
        if version >= 3 and len(data) >= 0x7C:
            second = data[0x7A]
            third = data[0x7B] if version >= 4 and len(data) >= 0x7C else 0
            if second:
                header.second_sid_address = 0xD000 | (second << 4)
            if third:
                header.third_sid_address = 0xD000 | (third << 4)

    return header


# =====================================================================
#  Save to workspace (with companion license/credit note)
# =====================================================================

_LICENSE_NOTE = (
    "HVSC tunes carry no machine-readable license; many are game-company "
    "copyrighted. Verify usage rights with the composer/publisher before "
    "distributing this demo."
)


def save_sid_to_workspace(
    data: bytes,
    hvsc_path: str,
    dest_dir: str,
    mirror: str = "",
    stil_raw_block: Optional[str] = None,
) -> Tuple[str, str]:
    """Write `data` (a raw .sid file) plus a companion `.sid.txt` note into
    `dest_dir`. Creates `dest_dir` if needed.

    Returns (sid_path, txt_path).
    """
    os.makedirs(dest_dir, exist_ok=True)

    basename = os.path.basename(hvsc_path.rstrip("/")) or "tune.sid"
    if not basename.lower().endswith(".sid"):
        basename += ".sid"

    sid_path = os.path.join(dest_dir, basename)
    with open(sid_path, "wb") as f:
        f.write(data)

    lines = [
        f"HVSC path: {hvsc_path}",
        f"Source mirror: {mirror}" if mirror else "Source mirror: (unknown)",
        f"Retrieved: {datetime.now(timezone.utc).strftime('%Y-%m-%d %H:%M UTC')}",
        "",
    ]
    try:
        header = parse_sid_header(data)
        lines.append(f"Title: {header.name}")
        lines.append(f"Author: {header.author}")
        lines.append(f"Released: {header.released}")
        lines.append(f"Load address: {header.load_address_display()}")
        lines.append(f"Init address: {header.init_address_display()}")
        lines.append(f"Play address: {header.play_address_display()}")
        if header.sid_model:
            lines.append(f"SID model: {header.sid_model}")
        if header.clock:
            lines.append(f"Clock: {header.clock}")
        if header.free_pages:
            lines.append(f"Free memory: {header.free_pages_display()}")
        if header.is_multi_sid():
            lines.append("WARNING: multi-SID tune, will not play correctly on a single-SID setup")
        lines.append("")
    except SidHeaderError as e:
        lines.append(f"(Could not parse SID header: {e})")
        lines.append("")

    if stil_raw_block:
        lines.append("STIL info:")
        lines.append(stil_raw_block.rstrip())
        lines.append("")

    lines.append(_LICENSE_NOTE)

    txt_path = sid_path + ".txt"
    with open(txt_path, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

    return sid_path, txt_path
