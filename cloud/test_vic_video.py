import struct
import zlib

from sdk.vic_video import PALETTE, HEADER_SIZE, decode_vic_packet, encode_png


def _make_packet(start_line, pkt_width, num_lines, bpp, payload, last=True):
    line_word = (start_line & 0x7FFF) | (0x8000 if last else 0)
    header = struct.pack("<4xHHBB2x", line_word, pkt_width, num_lines, bpp)
    return header + payload


def test_decode_vic_packet_writes_expected_pixels():
    # 4 pixels wide, 2 rows. Row0 colors [0,1,14,15], row1 colors [2,3,4,5].
    row0 = bytes([0x10, 0xFE])  # (1<<4|0), (15<<4|14)
    row1 = bytes([0x32, 0x54])  # (3<<4|2), (5<<4|4)
    packet = _make_packet(0, 4, 2, 4, row0 + row1, last=True)

    width, height = 4, 2
    frame = bytearray(width * height * 3)
    is_last = decode_vic_packet(packet, frame, width=width, height=height)

    assert is_last is True
    expected_colors = [0, 1, 14, 15, 2, 3, 4, 5]
    for i, color_idx in enumerate(expected_colors):
        px = frame[i * 3 : i * 3 + 3]
        assert tuple(px) == PALETTE[color_idx], f"pixel {i}"


def test_decode_vic_packet_respects_start_line_offset():
    row = bytes([0x21])  # colors [1, 2]
    packet = _make_packet(1, 2, 1, 4, row, last=False)

    width, height = 2, 3
    frame = bytearray(width * height * 3)
    is_last = decode_vic_packet(packet, frame, width=width, height=height)

    assert is_last is False
    # Row 0 untouched (still zeroed/black-equivalent bytes).
    assert bytes(frame[0:6]) == bytes(6)
    # Row 1 has the decoded pixels.
    assert tuple(frame[6:9]) == PALETTE[1]
    assert tuple(frame[9:12]) == PALETTE[2]
    # Row 2 untouched.
    assert bytes(frame[12:18]) == bytes(6)


def test_decode_vic_packet_too_short_header_returns_false():
    frame = bytearray(12)
    assert decode_vic_packet(b"\x00" * (HEADER_SIZE - 1), frame, width=2, height=2) is False


def test_decode_vic_packet_wrong_bpp_returns_last_flag_without_crashing():
    packet = _make_packet(0, 4, 2, 8, b"", last=True)
    frame = bytearray(4 * 2 * 3)
    assert decode_vic_packet(packet, frame, width=4, height=2) is True


def test_decode_vic_packet_truncated_payload_does_not_crash():
    # Declares 4 lines but only provides payload for 1.
    packet = _make_packet(0, 4, 4, 4, bytes([0x00, 0x00]), last=True)
    frame = bytearray(4 * 4 * 3)
    # Should not raise, and should still report the last-flag.
    assert decode_vic_packet(packet, frame, width=4, height=4) is True


def test_decode_vic_packet_lines_beyond_height_are_skipped():
    row0 = bytes([0x00])
    row1 = bytes([0x00])
    packet = _make_packet(1, 2, 2, 4, row0 + row1, last=True)
    width, height = 2, 2
    frame = bytearray(width * height * 3)
    # start_line=1, num_lines=2 -> line 1 valid, line 2 out of bounds (skipped).
    decode_vic_packet(packet, frame, width=width, height=height)  # should not raise


def _read_png(data: bytes):
    assert data.startswith(b"\x89PNG\r\n\x1a\n")
    pos = 8
    chunks = {}
    while pos < len(data):
        (length,) = struct.unpack_from(">I", data, pos)
        tag = data[pos + 4 : pos + 8]
        payload = data[pos + 8 : pos + 8 + length]
        chunks[tag] = payload
        pos += 8 + length + 4  # length + tag + data + crc
    return chunks


def test_encode_png_roundtrips_pixel_data():
    width, height = 3, 2
    rgb = bytes(
        [
            255, 0, 0,  0, 255, 0,  0, 0, 255,
            10, 20, 30,  40, 50, 60,  70, 80, 90,
        ]
    )
    png = encode_png(rgb, width, height)
    chunks = _read_png(png)

    assert b"IHDR" in chunks and b"IDAT" in chunks and b"IEND" in chunks
    w, h, depth, color_type = struct.unpack(">IIBB", chunks[b"IHDR"][:10])
    assert (w, h, depth, color_type) == (width, height, 8, 2)

    raw = zlib.decompress(chunks[b"IDAT"])
    stride = width * 3
    reconstructed = bytearray()
    for y in range(height):
        row_start = y * (stride + 1)
        filter_type = raw[row_start]
        assert filter_type == 0
        reconstructed.extend(raw[row_start + 1 : row_start + 1 + stride])

    assert bytes(reconstructed) == rgb
