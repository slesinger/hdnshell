from pathlib import Path

from agent_tools import (
    c64_memory_access,
    c64_machine_control,
    c64_memory_analyze,
    c64_memory_peek,
)


def test_c64_memory_peek(monkeypatch):
    calls = []
    monkeypatch.setattr("agent_tools._read_last_c64_ip", lambda: "192.168.1.9")
    monkeypatch.setattr(
        "sdk.network_helper.dma_read_memory",
        lambda host, address, length: calls.append((host, address, length))
        or bytes([0x41] * length),
    )

    result = c64_memory_peek(address="0x1000", length=16)

    assert "Read 16 bytes" in result
    assert "$1000" in result
    assert calls == [("192.168.1.9", 0x1000, 16)]


def test_c64_memory_peek_no_ip(monkeypatch):
    monkeypatch.setattr("agent_tools._read_last_c64_ip", lambda: "")
    assert "No C64 IP configured" in c64_memory_peek(address="0x1000", length=16)


def test_c64_memory_access_read(monkeypatch):
    monkeypatch.setattr("agent_tools._read_last_c64_ip", lambda: "192.168.1.9")
    monkeypatch.setattr(
        "sdk.network_helper.dma_read_memory",
        lambda host, address, length: bytes([0x41] * length),
    )

    result = c64_memory_access(operation="read", address="0x0400", length=32)
    assert "Read 32 bytes" in result
    assert "$0400" in result


def test_c64_memory_access_write_and_execute(monkeypatch):
    calls = {"write": [], "jump": []}

    monkeypatch.setattr("agent_tools._read_last_c64_ip", lambda: "192.168.1.9")
    monkeypatch.setattr(
        "sdk.network_helper.dma_write_memory_rest",
        lambda host, address, data: calls["write"].append((host, address, bytes(data))),
    )
    monkeypatch.setattr(
        "sdk.network_helper.dma_jump",
        lambda host, address: calls["jump"].append((host, address)),
    )

    result = c64_memory_access(
        operation="write",
        address="0x1000",
        data_hex="A9 00 8D 20 D0",
        execute_after_write=True,
    )

    assert "Wrote 5 bytes" in result
    assert calls["write"] == [("192.168.1.9", 0x1000, bytes.fromhex("A9008D20D0"))]
    assert calls["jump"] == [("192.168.1.9", 0x1000)]


def test_c64_memory_access_write_file_prg(monkeypatch, tmp_path: Path):
    calls = {"write": [], "jump": []}
    prg = tmp_path / "demo.prg"
    prg.write_bytes(bytes([0x01, 0x08, 0xA9, 0x00, 0x60]))

    monkeypatch.setattr("agent_tools._read_last_c64_ip", lambda: "192.168.1.9")
    monkeypatch.setattr(
        "sdk.network_helper.dma_write_memory_rest",
        lambda host, address, data: calls["write"].append((host, address, bytes(data))),
    )
    monkeypatch.setattr(
        "sdk.network_helper.dma_jump",
        lambda host, address: calls["jump"].append((host, address)),
    )

    result = c64_memory_access(
        operation="write_file",
        file_path=str(prg),
        execute_after_write=True,
    )

    assert "Loaded 3 bytes" in result
    assert calls["write"] == [("192.168.1.9", 0x0801, bytes([0xA9, 0x00, 0x60]))]
    assert calls["jump"] == [("192.168.1.9", 0x0801)]


def test_c64_machine_control_actions(monkeypatch):
    calls = []
    monkeypatch.setattr("agent_tools._read_last_c64_ip", lambda: "192.168.1.9")
    monkeypatch.setattr(
        "sdk.network_helper.send_reset", lambda host: calls.append(("reset", host))
    )
    monkeypatch.setattr(
        "sdk.network_helper.send_poweroff", lambda host: calls.append(("poweroff", host))
    )
    monkeypatch.setattr(
        "sdk.network_helper.rest_menu_button", lambda host: calls.append(("menu", host))
    )
    monkeypatch.setattr(
        "sdk.network_helper.rest_reboot", lambda host: calls.append(("reboot", host))
    )

    assert "Reset command sent" in c64_machine_control("reset")
    assert "Power-off command sent" in c64_machine_control("poweroff")
    assert "Menu button triggered" in c64_machine_control("menu_button")
    assert "Reboot triggered" in c64_machine_control("reboot")
    assert calls == [
        ("reset", "192.168.1.9"),
        ("poweroff", "192.168.1.9"),
        ("menu", "192.168.1.9"),
        ("reboot", "192.168.1.9"),
    ]


def test_c64_memory_analyze_sid_and_sprites(monkeypatch, tmp_path: Path):
    monkeypatch.setattr("agent_tools._read_last_c64_ip", lambda: "192.168.1.9")

    data = bytearray([0x00] * 4096)
    # PSID header at offset 0x100
    sid_pos = 0x100
    data[sid_pos : sid_pos + 4] = b"PSID"
    data[sid_pos + 4 : sid_pos + 6] = bytes([0x00, 0x02])
    data[sid_pos + 6 : sid_pos + 8] = bytes([0x00, 0x7C])
    data[sid_pos + 8 : sid_pos + 10] = bytes([0x10, 0x00])
    data[sid_pos + 10 : sid_pos + 12] = bytes([0x10, 0x03])
    data[sid_pos + 12 : sid_pos + 14] = bytes([0x10, 0x06])
    data[sid_pos + 14 : sid_pos + 16] = bytes([0x00, 0x01])
    data[sid_pos + 16 : sid_pos + 18] = bytes([0x00, 0x01])

    # A plausible sprite block at aligned 64-byte boundary
    sprite_pos = 0x200
    for i in range(63):
        data[sprite_pos + i] = (i * 7) & 0xFF

    monkeypatch.setattr(
        "sdk.network_helper.dma_read_memory",
        lambda host, address, length: bytes(data[address : address + length]),
    )

    out_dir = tmp_path / "sprites"
    result = c64_memory_analyze(
        task="find sid and sprites",
        address="0x0000",
        length=4096,
        save_sprites=True,
        max_sprites=8,
        output_dir=str(out_dir),
    )

    assert "SID signatures: 1" in result
    assert "Probable sprite blocks" in result
    assert "Saved" in result
    assert list(out_dir.glob("sprite_*.bin"))
    assert list(out_dir.glob("sprite_*.txt"))
