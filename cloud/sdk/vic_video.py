"""
Decoder for the Ultimate64/U64 VIC video stream (UDP, started via
PUT /v1/streams/video:start) and a minimal dependency-free PNG encoder.

The wire format isn't in rest_api_calls.md; it was reverse-engineered from
the bundled web UI's own decoder (cloud/static/assets/index-uXGufily.js,
functions referred to there as oC/lC/wa/Qf/fs/vl).
"""

import struct
import zlib

# Frame dimensions used by the Ultimate's own video-preview web UI.
FRAME_WIDTH = 384
FRAME_HEIGHT = 272

# Packet header size in bytes (before the pixel payload).
HEADER_SIZE = 12

# C64/VIC-II 16-color palette as (R, G, B), index = color code 0-15.
PALETTE = [
    (0, 0, 0),
    (239, 239, 239),
    (141, 47, 52),
    (106, 212, 205),
    (152, 53, 164),
    (76, 180, 66),
    (44, 41, 177),
    (239, 239, 93),
    (152, 78, 32),
    (91, 56, 0),
    (209, 103, 109),
    (74, 74, 74),
    (123, 123, 123),
    (159, 239, 147),
    (109, 106, 239),
    (178, 178, 178),
]

_HEADER_STRUCT = struct.Struct("<4xHHBB2x")


def decode_vic_packet(
    packet: bytes,
    frame: bytearray,
    width: int = FRAME_WIDTH,
    height: int = FRAME_HEIGHT,
) -> bool:
    """
    Decode one UDP packet of the Ultimate's VIC video stream into *frame*
    (a flat RGB bytearray of width*height*3 bytes), in place.

    Packet layout (little-endian):
      bytes 0-3:   unused
      bytes 4-5:   uint16; bit15 = "last packet of this frame" flag,
                   bits0-14 = index of the first scanline in this packet
      bytes 6-7:   uint16 width in pixels for this packet's rows
      byte 8:      number of scanlines included in this packet
      byte 9:      bits per pixel (must be 4 -- packed nibble-per-pixel,
                   2 pixels per payload byte, low nibble = left pixel)
      bytes 10-11: reserved
      bytes 12+:   payload, num_lines * (pkt_width * 4 / 8) bytes

    Returns the "last packet of frame" flag regardless of whether the
    payload was decoded (mirrors the reference web-UI JS decoder, which
    uses it purely as a frame-boundary marker).
    """
    if len(packet) < HEADER_SIZE:
        return False

    line_word, pkt_width, num_lines, bpp = _HEADER_STRUCT.unpack_from(packet, 0)
    is_last = bool(line_word & 0x8000)
    start_line = line_word & 0x7FFF

    if bpp != 4 or pkt_width == 0 or num_lines == 0:
        return is_last

    bytes_per_line = pkt_width * bpp // 8
    payload = packet[HEADER_SIZE:]

    # Defend against a truncated/malformed packet instead of raising.
    max_lines_available = len(payload) // bytes_per_line if bytes_per_line else 0
    num_lines = min(num_lines, max_lines_available)

    for row in range(num_lines):
        line = start_line + row
        if line >= height:
            break
        frame_offset = line * width * 3
        payload_offset = row * bytes_per_line
        for col_byte in range(bytes_per_line):
            b = payload[payload_offset + col_byte]
            left = PALETTE[b & 0x0F]
            right = PALETTE[(b >> 4) & 0x0F]
            px = frame_offset + col_byte * 6
            frame[px : px + 3] = left
            frame[px + 3 : px + 6] = right

    return is_last


def encode_png(rgb: bytes, width: int, height: int) -> bytes:
    """Encode a flat RGB (3 bytes/pixel) buffer as an 8-bit truecolor PNG."""

    def chunk(tag: bytes, data: bytes) -> bytes:
        return (
            struct.pack(">I", len(data))
            + tag
            + data
            + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)
        )

    signature = b"\x89PNG\r\n\x1a\n"
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)

    stride = width * 3
    raw = bytearray()
    for y in range(height):
        raw.append(0)  # filter type 0: None
        raw.extend(rgb[y * stride : (y + 1) * stride])
    idat = zlib.compress(bytes(raw), 6)

    return signature + chunk(b"IHDR", ihdr) + chunk(b"IDAT", idat) + chunk(b"IEND", b"")
