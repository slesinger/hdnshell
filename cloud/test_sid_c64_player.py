"""
Unit tests for sdk.sid_c64_player (GH #28) -- fully offline.

The stub is hand-assembled 6502, so byte-level assertions alone would only
prove it matches what was written, not that it *behaves*. These tests also
run the stub on a minimal 6502 interpreter (below) covering just the dozen
opcodes the stub uses, and assert the observable behaviour: init runs exactly
once, the tune plays at the CIA2 timer rate no matter how often GETIN is
called, and every path ends by chaining to the saved GETIN vector.
"""

import pytest

from sdk.sid_c64_player import (
    BORDER_REG,
    CIA2_CRA,
    OFF_CHAIN,
    OFF_CHAIN_OPERAND,
    OFF_PLAY,
    DEFAULT_GETIN,
    DEFAULT_STUB_ADDR,
    IGETIN,
    NTSC_PERIOD,
    PAL_PERIOD,
    SidPlayerError,
    build_stub,
    check_tune_compatibility,
    period_for_clock,
    sid_payload,
)
from sdk.sid_header import parse_sid_header


# ======================================================================
#  Minimal 6502 interpreter (only the opcodes the stub uses)
# ======================================================================

CIA2_ICR = 0xDD0D
CIA2_TA_LO = 0xDD04
CIA2_TA_HI = 0xDD05


class Tiny6502:
    """Executes the handful of opcodes in the player stub.

    `calls` records every JSR/JMP-to-routine target so tests can assert how
    often the tune's init/play routines ran. Execution stops when PC reaches
    a `stop_at` address (standing in for "chained away").

    $DD0D (CIA2 interrupt control) is modelled with its real read-clears
    behaviour, which is what makes the stub's tempo gate self-arming.
    """

    def __init__(self, memory: dict, stop_at):
        self.mem = dict(memory)
        self.stop_at = set(stop_at)
        self.a = self.x = 0
        self.carry = False
        self.zero = True
        self.calls = []

    def read(self, addr):
        value = self.mem.get(addr, 0)
        if addr == CIA2_ICR:
            self.mem[addr] = 0  # reading the ICR clears its latched flags
        return value

    def write(self, addr, value):
        self.mem[addr] = value & 0xFF

    def raise_timer_flag(self):
        """Simulate one CIA2 Timer A underflow (one frame elapsing)."""
        self.mem[CIA2_ICR] = self.mem.get(CIA2_ICR, 0) | 0x01

    def _word(self, pc):
        return self.read(pc) | (self.read(pc + 1) << 8)

    def _set_nz(self, value):
        self.zero = (value & 0xFF) == 0

    def run(self, pc, max_steps=200):
        for _ in range(max_steps):
            if pc in self.stop_at:
                return pc
            op = self.read(pc)

            if op == 0xAE:  # LDX abs
                self.x = self.read(self._word(pc + 1))
                self._set_nz(self.x)
                pc += 3
            elif op == 0xAD:  # LDA abs
                self.a = self.read(self._word(pc + 1))
                self._set_nz(self.a)
                pc += 3
            elif op == 0xA9:  # LDA imm
                self.a = self.read(pc + 1)
                self._set_nz(self.a)
                pc += 2
            elif op == 0x8D:  # STA abs
                self.write(self._word(pc + 1), self.a)
                pc += 3
            elif op == 0xEE:  # INC abs
                addr = self._word(pc + 1)
                self.write(addr, (self.read(addr) + 1) & 0xFF)
                pc += 3
            elif op == 0xCE:  # DEC abs
                addr = self._word(pc + 1)
                self.write(addr, (self.read(addr) - 1) & 0xFF)
                pc += 3
            elif op == 0xEA:  # NOP
                pc += 1
            elif op == 0xC9:  # CMP imm
                value = self.read(pc + 1)
                self.carry = self.a >= value
                self.zero = self.a == value
                pc += 2
            elif op == 0xD0:  # BNE rel
                offset = self.read(pc + 1)
                pc += 2
                if not self.zero:
                    pc += offset - 256 if offset > 127 else offset
            elif op == 0x90:  # BCC rel
                offset = self.read(pc + 1)
                pc += 2
                if not self.carry:
                    pc += offset - 256 if offset > 127 else offset
            elif op == 0x4A:  # LSR A
                self.carry = bool(self.a & 0x01)
                self.a >>= 1
                self._set_nz(self.a)
                pc += 1
            elif op == 0x20:  # JSR abs
                self.calls.append(self._word(pc + 1))
                pc += 3  # routine assumed to RTS straight back
            elif op == 0x4C:  # JMP abs
                target = self._word(pc + 1)
                if target in (INIT_ADDR, PLAY_ADDR):
                    # Tail-call into the tune: record it and treat the
                    # routine's RTS as returning to GETIN's caller.
                    self.calls.append(target)
                    return DEFAULT_GETIN
                pc = target
            else:
                raise AssertionError(f"unhandled opcode ${op:02X} at ${pc:04X}")
        raise AssertionError("stub did not terminate (infinite loop?)")


INIT_ADDR = 0x1000
PLAY_ADDR = 0x1003


def _machine(stub_addr=DEFAULT_STUB_ADDR, song=0, period=PAL_PERIOD, border=False):
    stub = build_stub(
        INIT_ADDR, PLAY_ADDR, song, DEFAULT_GETIN, stub_addr, period, border
    )
    mem = {stub_addr + i: b for i, b in enumerate(stub)}
    return Tiny6502(mem, stop_at=[DEFAULT_GETIN]), stub_addr


# ======================================================================
#  Behaviour
# ======================================================================


def test_first_call_inits_and_does_not_play():
    cpu, base = _machine()
    end = cpu.run(base)
    assert end == DEFAULT_GETIN, "must chain away after init"
    assert cpu.calls == [INIT_ADDR], "first call inits only, no play"


def test_first_call_programs_cia2_timer():
    cpu, base = _machine(period=PAL_PERIOD)
    cpu.run(base)
    assert cpu.mem[CIA2_TA_LO] == PAL_PERIOD & 0xFF
    assert cpu.mem[CIA2_TA_HI] == PAL_PERIOD >> 8
    # $11 = force-load latch + start, continuous, count phi2.
    assert cpu.mem[CIA2_CRA] == 0x11


def test_init_runs_only_once():
    cpu, base = _machine()
    for _ in range(5):
        cpu.raise_timer_flag()
        cpu.run(base)
    assert cpu.calls.count(INIT_ADDR) == 1, "init must run exactly once"


def test_init_passes_zero_based_song_index():
    # UI subtune 3 -> install() passes song=2 -> init called with A=2.
    cpu, base = _machine(song=2)
    cpu.run(base)
    assert cpu.a == 2


def test_no_play_until_the_timer_underflows():
    cpu, base = _machine()
    cpu.run(base)  # init
    for _ in range(10):  # ten GETIN calls, no timer tick yet
        cpu.run(base)
    assert cpu.calls.count(PLAY_ADDR) == 0, "must not play without a timer tick"


def test_one_play_per_timer_tick_however_often_getin_is_called():
    cpu, base = _machine()
    cpu.run(base)  # init

    cpu.raise_timer_flag()
    for _ in range(10):  # a tight GETIN loop inside one frame
        cpu.run(base)
    assert cpu.calls.count(PLAY_ADDR) == 1, "read-clears gate must fire once"

    cpu.raise_timer_flag()  # next frame
    for _ in range(10):
        cpu.run(base)
    assert cpu.calls.count(PLAY_ADDR) == 2


def test_plays_once_per_call_when_called_once_per_frame():
    # This is the cs_modal case: exactly one GETIN per frame, and a timer
    # underflow between each. The old raster gate failed precisely here.
    cpu, base = _machine()
    cpu.run(base)  # init
    for _ in range(30):
        cpu.raise_timer_flag()
        cpu.run(base)
    assert cpu.calls.count(PLAY_ADDR) == 30


def test_every_path_chains_to_saved_getin():
    cpu, base = _machine()
    cpu.run(base)  # init path
    assert cpu.run(base) == DEFAULT_GETIN  # no-tick path
    cpu.raise_timer_flag()
    assert cpu.run(base) == DEFAULT_GETIN  # play path


def test_chain_target_is_the_saved_vector_not_igetin():
    # Chaining through $032A would re-enter the stub forever.
    for border in (False, True):
        stub = build_stub(
            INIT_ADDR, PLAY_ADDR, 0, 0xF13E, DEFAULT_STUB_ADDR, PAL_PERIOD, border
        )
        # install() reads a live stub's saved GETIN from this fixed offset, so
        # it must not move when the border markers are compiled in.
        chain_operand = stub[OFF_CHAIN_OPERAND] | (stub[OFF_CHAIN_OPERAND + 1] << 8)
        assert stub[OFF_CHAIN] == 0x4C, "chain must be a JMP at a fixed offset"
        assert chain_operand == 0xF13E
        assert chain_operand != IGETIN


def test_border_markers_bracket_the_play_call_only():
    cpu, base = _machine(border=True)
    cpu.mem[BORDER_REG] = 6  # the console's own border colour
    cpu.run(base)  # init
    assert cpu.mem[BORDER_REG] == 6, "init path must not touch the border"

    cpu.run(base)  # no timer tick -> no play, no border change
    assert cpu.mem[BORDER_REG] == 6

    cpu.raise_timer_flag()
    cpu.run(base)  # play path: inc then dec, so it nets out
    assert cpu.mem[BORDER_REG] == 6, "border must be restored after play"


def test_border_markers_are_absent_by_default():
    cpu, base = _machine(border=False)
    cpu.mem[BORDER_REG] = 6
    cpu.run(base)
    cpu.raise_timer_flag()
    cpu.run(base)
    assert cpu.calls.count(PLAY_ADDR) == 1
    stub = build_stub(INIT_ADDR, PLAY_ADDR, 0)
    assert 0xEE not in stub[OFF_PLAY:OFF_CHAIN], "no INC $d020 when disabled"


def test_border_variant_is_the_same_length_and_still_plays():
    plain = build_stub(INIT_ADDR, PLAY_ADDR, 0)
    marked = build_stub(
        INIT_ADDR, PLAY_ADDR, 0, DEFAULT_GETIN, DEFAULT_STUB_ADDR, PAL_PERIOD, True
    )
    assert len(plain) == len(marked)

    cpu, base = _machine(border=True)
    cpu.run(base)
    for _ in range(10):
        cpu.raise_timer_flag()
        cpu.run(base)
    assert cpu.calls.count(PLAY_ADDR) == 10


def test_stub_relocates_cleanly():
    for base in (0xC000, 0xC800, 0x9000):
        stub = build_stub(INIT_ADDR, PLAY_ADDR, 0, DEFAULT_GETIN, base)
        # The init_done reference must follow the base address.
        assert stub[1] | (stub[2] << 8) == base + 0x2F


def test_stub_fits_budget():
    stub = build_stub(INIT_ADDR, PLAY_ADDR, 0)
    assert len(stub) == 0x30, f"stub grew to {len(stub)} bytes"


def test_period_follows_the_header_clock():
    assert period_for_clock("NTSC") == NTSC_PERIOD
    assert period_for_clock("PAL") == PAL_PERIOD
    assert period_for_clock(None) == PAL_PERIOD, "unknown clock defaults to PAL"
    assert period_for_clock("PAL/NTSC") == PAL_PERIOD


def test_timer_period_range_is_validated():
    with pytest.raises(SidPlayerError):
        build_stub(INIT_ADDR, PLAY_ADDR, 0, DEFAULT_GETIN, DEFAULT_STUB_ADDR, 0)
    with pytest.raises(SidPlayerError):
        build_stub(INIT_ADDR, PLAY_ADDR, 0, DEFAULT_GETIN, DEFAULT_STUB_ADDR, 0x10000)


def test_song_index_range_is_validated():
    with pytest.raises(SidPlayerError):
        build_stub(INIT_ADDR, PLAY_ADDR, 300)


# ======================================================================
#  Compatibility gate
# ======================================================================


def _header(load=0x1000, init=0x1000, play=0x1003, version=2, data_offset=0x7C):
    """Build a synthetic .sid file and parse it, so tests use the real parser."""
    data = bytearray(b"PSID")
    data += version.to_bytes(2, "big")
    data += data_offset.to_bytes(2, "big")
    data += load.to_bytes(2, "big")
    data += init.to_bytes(2, "big")
    data += play.to_bytes(2, "big")
    data += (1).to_bytes(2, "big")  # songs
    data += (1).to_bytes(2, "big")  # start song
    data += (0).to_bytes(4, "big")  # speed
    data += b"\x00" * 32 * 3  # name/author/released
    data += b"\x00" * (data_offset - len(data))
    return parse_sid_header(bytes(data)), bytes(data)


def test_rejects_tune_with_no_play_address():
    header, data = _header(play=0x0000)
    with pytest.raises(SidPlayerError, match="own IRQ"):
        check_tune_compatibility(header, len(data) + 200)


def test_rejects_tune_overwriting_screen():
    header, data = _header(load=0x0400)
    with pytest.raises(SidPlayerError, match="screen memory"):
        check_tune_compatibility(header, len(data) + 200)


def test_rejects_tune_overwriting_zero_page():
    header, data = _header(load=0x0100)
    with pytest.raises(SidPlayerError, match="zero page"):
        check_tune_compatibility(header, len(data) + 200)


def test_rejects_tune_in_cartridge_window():
    header, data = _header(load=0x8000)
    with pytest.raises(SidPlayerError, match="cartridge"):
        check_tune_compatibility(header, len(data) + 200)


def test_rejects_tune_colliding_with_the_stub():
    header, data = _header(load=0xBFF0)
    # $BFF0 + payload runs into BASIC ROM first; use a load inside the stub.
    header2, data2 = _header(load=DEFAULT_STUB_ADDR)
    with pytest.raises(SidPlayerError):
        check_tune_compatibility(header2, len(data2) + 200)


def test_accepts_ordinary_tune():
    header, data = _header(load=0x1000)
    check_tune_compatibility(header, len(data) + 2000)  # must not raise


def test_payload_skips_embedded_load_address():
    # loadAddress == 0 -> the real address is the first two data bytes, which
    # are part of the address, not the payload.
    header, data = _header(load=0x0000)
    body = bytes([0x00, 0x20]) + b"\xAB\xCD\xEF"  # $2000 + three payload bytes
    full = data + body
    header = parse_sid_header(full)
    assert header.load_address == 0x2000
    assert sid_payload(full, header) == b"\xAB\xCD\xEF"


def test_payload_keeps_all_data_when_load_address_in_header():
    header, data = _header(load=0x1000)
    full = data + b"\x11\x22\x33"
    header = parse_sid_header(full)
    assert sid_payload(full, header) == b"\x11\x22\x33"
