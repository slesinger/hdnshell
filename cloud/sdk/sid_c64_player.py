"""
In-C64 SID player for the SID Browser console (GH issue #28).

Why this exists
---------------
The Ultimate's own `sidplay` runner takes the machine over: the wedge stops
running, no keys reach the HDN console, and the only way out is a reset --
which loses the console state (and lands on the cartridge screen, needing F7
to get back to BASIC). This module instead installs a tiny player *under* the
running console, so music plays while the console stays fully interactive and
stopping restores everything in place.

How it works
------------
The console's key loop (`cs_modal`, wedge bank 2) runs with IRQs masked --
it re-asserts `sei` every iteration so a timer IRQ can't flip cartridge banks
mid-session. So an IRQ-driven player cannot work here.

But that loop is frame-paced (`cs_vsync` spins until `$D012 == $FA`) and calls
`jsr $ffe4` (GETIN) every frame, which dispatches through the KERNAL RAM
vector **IGETIN at $032A**. The wedge hooks $0320/$0326/$0328 but never
$032A, so it is free. Pointing $032A at a small stub gives a per-frame music
tick with **no cartridge changes at all**.

The stub gates itself on CIA2 Timer A (one `play` call per tune frame),
because GETIN is also called in a tight loop at the BASIC prompt, where an
ungated player would run the music hundreds of times too fast. It calls the
tune's `init` once on its first invocation, so installing needs no DMA-jump
and no reset -- just three memory writes.

Optionally it brackets the `play` call with `inc $d020` / `dec $d020`, so the
coloured band in the border shows exactly how much raster time the tune eats
(useful when picking music for a demo).

Stopping restores the saved $032A vector, zeroes the SID master volume
($D418), and pushes back the RAM that was overwritten (captured before the
install), leaving the machine as it was.
"""

import logging
from dataclasses import dataclass, field
from typing import List, Optional, Tuple

logger = logging.getLogger(__name__)

# KERNAL RAM vector IGETIN -- GETIN ($FFE4) dispatches through here.
IGETIN = 0x032A
DEFAULT_GETIN = 0xF13E  # KERNAL's own GETIN implementation

SID_VOLUME_REG = 0xD418
CIA2_CRA = 0xDD0E  # CIA2 Timer A control register
BORDER_REG = 0xD020

# Fixed stub offsets. `chain` sits at a constant offset whether or not the
# raster-time border markers are compiled in, so `install()` can always find a
# live stub's saved-GETIN operand at the same place.
OFF_TICK = 0x1C
OFF_PLAY = 0x22
OFF_CHAIN = 0x2B
OFF_CHAIN_OPERAND = OFF_CHAIN + 1
OFF_INIT_DONE = 0x2F

# Where the player stub is placed. $C000-$CFFF is the classic 4K free RAM
# block: not used by BASIC, the KERNAL, or the wedge. Tunes that load into it
# are rejected (see `check_tune_compatibility`) rather than fought over.
DEFAULT_STUB_ADDR = 0xC000
STUB_MAX_LEN = 0x40  # generous ceiling; the real stub is 0x30 bytes

# CIA2 Timer A period for one frame, in phi2 cycles. The stub programs this
# once and then polls the underflow latch, so it is the tune's tempo.
#   PAL:  985248 Hz / 50 Hz
#   NTSC: 1022727 Hz / 60 Hz
PAL_PERIOD = 19705
NTSC_PERIOD = 17045


def period_for_clock(clock: Optional[str]) -> int:
    """Pick the frame period from the header's clock field ('PAL'/'NTSC').

    Unknown or dual-clock tunes get PAL, which is what the overwhelming
    majority of HVSC tunes were written for.
    """
    return NTSC_PERIOD if clock == "NTSC" else PAL_PERIOD


# Regions the tune must not overlap. Overwriting any of these breaks the
# console itself, so a tune landing here is refused rather than played.
_FORBIDDEN = [
    (0x0000, 0x03FF, "zero page / stack / system vectors"),
    (0x0400, 0x07FF, "screen memory (the console display)"),
    (0x8000, 0x9FFF, "cartridge window"),
    (0xA000, 0xBFFF, "BASIC ROM"),
    (0xD000, 0xDFFF, "I/O registers"),
    (0xE000, 0xFFFF, "KERNAL ROM"),
]


class SidPlayerError(Exception):
    """Raised when a tune cannot be played by the in-C64 RAM player."""


@dataclass
class InstalledPlayer:
    """What was written to the C64, so `stop()` can put it all back."""

    stub_addr: int
    saved_getin: int
    # [(address, original_bytes), ...] captured before each write
    backups: List[Tuple[int, bytes]] = field(default_factory=list)


# =====================================================================
#  Compatibility check
# =====================================================================


def check_tune_compatibility(header, data_len: int, stub_addr: int = DEFAULT_STUB_ADDR):
    """Raise `SidPlayerError` if this tune can't be driven by the RAM player.

    `header` is a `sdk.sid_header.SidHeader`. Everything checked here is
    knowable before touching the C64, so the console can refuse cleanly
    instead of half-installing and wedging the machine.
    """
    if header.play_address == 0:
        raise SidPlayerError(
            "Tune installs its own IRQ player (play address 0) - "
            "cannot be driven from the console loop"
        )

    load = header.load_address
    # data_len covers the whole file; the payload is what lands in RAM.
    payload_len = max(0, data_len - header.data_offset - 2)
    end = load + payload_len - 1

    if end > 0xFFFF:
        raise SidPlayerError("Tune would run past the top of memory")

    for lo, hi, what in _FORBIDDEN:
        if load <= hi and end >= lo:
            raise SidPlayerError(
                f"Tune at ${load:04X}-${end:04X} would overwrite {what}"
            )

    stub_end = stub_addr + STUB_MAX_LEN - 1
    if load <= stub_end and end >= stub_addr:
        raise SidPlayerError(
            f"Tune at ${load:04X}-${end:04X} collides with the player stub "
            f"at ${stub_addr:04X}"
        )


# =====================================================================
#  Stub assembly
# =====================================================================


def build_stub(
    init_addr: int,
    play_addr: int,
    song: int,
    saved_getin: int = DEFAULT_GETIN,
    stub_addr: int = DEFAULT_STUB_ADDR,
    timer_period: int = PAL_PERIOD,
    raster_border: bool = False,
) -> bytes:
    """Hand-assemble the player stub that IGETIN will point at.

    Tempo source: **CIA2 Timer A**, not the raster.

    A raster-position gate looks tempting but is wrong here. `cs_modal` calls
    GETIN exactly once per frame at a *fixed* raster position, so a
    "play once while raster is in band, re-arm while it's outside" flag would
    never see the outside and would fire exactly once, then go silent. Timing
    has to come from something that advances on its own.

    CIA2 Timer A is free (the KERNAL uses CIA1 Timer A for its 60 Hz IRQ;
    CIA2's timers are left stopped) and keeps counting with interrupts masked,
    which is exactly the situation inside `cs_modal`. The stub programs it to
    the tune's frame period once, then each call just tests the underflow
    latch in $DD0D -- reading that register clears it, so the gate re-arms
    itself. Called once per frame it plays once per frame; called in a tight
    loop at the BASIC prompt it still plays only at the timer rate.

    Layout (offsets from `stub_addr`), explicit so the tests can check every
    instruction and branch target:

        +$00  AE 2F c0   entry:  ldx init_done   ; first-call flag
        +$03  D0 17              bne tick        ; -> +$1C
        +$05  EE 2F c0           inc init_done
        +$08  A9 ll              lda #<period
        +$0A  8D 04 DD           sta $dd04       ; CIA2 TA low
        +$0D  A9 hh              lda #>period
        +$0F  8D 05 DD           sta $dd05       ; CIA2 TA high
        +$12  A9 11              lda #$11        ; force-load latch + start,
        +$14  8D 0E DD           sta $dd0e       ;   continuous, count phi2
        +$17  A9 ss              lda #song       ; subtune index (0-based)
        +$19  4C ii ii           jmp init_addr   ; tail-call: init RTSes to
                                                 ;   GETIN's caller for us
        +$1C  AD 0D DD   tick:   lda $dd0d       ; read clears the latch
        +$1F  4A                 lsr             ; bit0 (TA underflow) -> carry
        +$20  90 09              bcc chain       ; -> +$2B, no tick yet
        +$22  EE 20 D0           inc $d020       ; raster marker (optional)
        +$25  20 pp pp           jsr play_addr
        +$28  CE 20 D0           dec $d020       ; raster marker (optional)
        +$2B  4C gg gg   chain:  jmp saved_getin
        +$2E             (pad)
        +$2F             init_done .byte 0

    With `raster_border` off, the two marker instructions are replaced by six
    NOPs so that `chain` -- and therefore the saved-GETIN operand that
    `install()` reads back from a live stub -- stays at a fixed offset.

    The raster markers are the standard demo-coder trick: `inc $d020` before
    the play call and `dec $d020` after it leaves the border its normal colour
    except for the scanlines the player is actually executing on, so the width
    of the coloured band *is* the tune's raster time. It costs 12 cycles a
    frame and is exact (not sampled), because the player runs at a fixed
    point in the frame. `inc`/`dec` rather than load/store so no saved colour
    is needed and the console's own border colour is preserved.

    The chain must NOT go through $032A -- that vector now points at this
    stub, so it would loop forever. It jumps to the *saved* GETIN address
    instead, which sets A and RTSes straight back to GETIN's caller.

    On the init call the stub tail-calls `init` with `jmp` rather than
    `jsr`+`jmp chain`: init ends in RTS, which then returns directly to
    GETIN's caller. That frame returns A undefined (no GETIN ran), which the
    console tolerates -- it treats a garbage first read as a keypress at
    worst, and `cs_modal` flushes the buffer on the next pass.
    """
    if not (0 <= song <= 255):
        raise SidPlayerError(f"song index {song} out of range")
    if not (1 <= timer_period <= 0xFFFF):
        raise SidPlayerError(f"timer period {timer_period} out of range")

    init_done = stub_addr + OFF_INIT_DONE

    def lo(a):
        return a & 0xFF

    def hi(a):
        return (a >> 8) & 0xFF

    def rel(branch_at: int, target: int) -> int:
        """Relative branch operand: target - (address after the branch)."""
        offset = target - (branch_at + 2)
        if not (-128 <= offset <= 127):
            raise SidPlayerError("branch out of range (stub layout broken)")
        return offset & 0xFF

    code = bytearray()
    code += bytes([0xAE, lo(init_done), hi(init_done)])      # +$00 ldx init_done
    code += bytes([0xD0, rel(0x03, OFF_TICK)])               # +$03 bne tick
    code += bytes([0xEE, lo(init_done), hi(init_done)])      # +$05 inc init_done
    code += bytes([0xA9, lo(timer_period)])                  # +$08 lda #<period
    code += bytes([0x8D, 0x04, 0xDD])                        # +$0A sta $dd04
    code += bytes([0xA9, hi(timer_period)])                  # +$0D lda #>period
    code += bytes([0x8D, 0x05, 0xDD])                        # +$0F sta $dd05
    code += bytes([0xA9, 0x11])                              # +$12 lda #$11
    code += bytes([0x8D, 0x0E, 0xDD])                        # +$14 sta $dd0e
    code += bytes([0xA9, song])                              # +$17 lda #song
    code += bytes([0x4C, lo(init_addr), hi(init_addr)])      # +$19 jmp init

    assert len(code) == OFF_TICK, f"init block ends at {len(code):#x}"

    code += bytes([0xAD, 0x0D, 0xDD])                        # +$1C lda $dd0d
    code += bytes([0x4A])                                    # +$1F lsr
    code += bytes([0x90, rel(0x20, OFF_CHAIN)])              # +$20 bcc chain

    assert len(code) == OFF_PLAY, f"gate block ends at {len(code):#x}"

    if raster_border:
        code += bytes([0xEE, lo(BORDER_REG), hi(BORDER_REG)])  # +$22 inc $d020
        code += bytes([0x20, lo(play_addr), hi(play_addr)])    # +$25 jsr play
        code += bytes([0xCE, lo(BORDER_REG), hi(BORDER_REG)])  # +$28 dec $d020
    else:
        code += bytes([0x20, lo(play_addr), hi(play_addr)])    # +$22 jsr play
        # NOPs so `chain` lands at OFF_CHAIN either way.
        code += bytes([0xEA] * (OFF_CHAIN - len(code)))

    assert len(code) == OFF_CHAIN, f"tick block ends at {len(code):#x}"

    # chain: jump to the ORIGINAL GETIN implementation.
    code += bytes([0x4C, lo(saved_getin), hi(saved_getin)])  # +$2B jmp saved

    code += bytes([0x00] * (OFF_INIT_DONE - len(code)))      # padding
    code += bytes([0x00])                                    # +$2F init_done

    if len(code) > STUB_MAX_LEN:
        raise SidPlayerError(
            f"stub is {len(code)} bytes, over the {STUB_MAX_LEN}-byte budget"
        )
    return bytes(code)


def sid_payload(data: bytes, header) -> bytes:
    """Return the tune's RAM image: the bytes that land at `load_address`.

    A .sid file is [header][optional 2-byte little-endian load address][data].
    When `header.load_address` came from those embedded two bytes they are
    part of the address, not the payload, so they are skipped here either way
    -- `parse_sid_header` has already resolved the real load address.
    """
    start = header.data_offset
    # The two-byte embedded load address is present exactly when the header
    # field was zero; parse_sid_header consumed it to compute load_address.
    raw = data[start:]
    if len(raw) >= 2:
        # Detect the embedded-address case by re-reading the header field.
        header_load = int.from_bytes(data[0x08:0x0A], "big")
        if header_load == 0:
            return raw[2:]
    return raw


# =====================================================================
#  Install / stop
# =====================================================================

_READ_CHUNK = 256  # REST readmem returns 256 bytes when length is omitted


def _read_ram(host: str, address: int, length: int) -> bytes:
    from .network_helper import dma_read_memory

    out = bytearray()
    remaining = length
    addr = address
    while remaining > 0:
        n = min(_READ_CHUNK, remaining)
        out += dma_read_memory(host, addr, n)
        addr += n
        remaining -= n
    return bytes(out)


def _write_ram(host: str, address: int, data: bytes) -> None:
    """DMA-write `data` at `address` (SOCKET_CMD_DMAWRITE takes the load
    address as the first two payload bytes, PRG-style)."""
    from .network_helper import send_dmawrite

    send_dmawrite(host, address.to_bytes(2, "little") + data)


def install(
    host: str,
    data: bytes,
    header,
    song: int = 1,
    stub_addr: int = DEFAULT_STUB_ADDR,
    backup: bool = True,
    raster_border: bool = False,
) -> InstalledPlayer:
    """Install and start the tune on the C64, under the running console.

    `song` is 1-based (as shown in the UI); the tune's init routine is called
    with the 0-based index, which is what PSID expects.

    Returns an `InstalledPlayer` holding everything needed to undo this.
    """
    check_tune_compatibility(header, len(data), stub_addr)

    payload = sid_payload(data, header)
    if not payload:
        raise SidPlayerError("Tune has no data to load")

    load = header.load_address
    init_addr = header.init_address or load
    play_addr = header.play_address

    # Read back the current IGETIN vector so the stub can chain to it and
    # stop() can put it back. If the vector already points into our stub a
    # previous install is still live -- reuse its saved value instead of
    # chaining to ourselves.
    vec = _read_ram(host, IGETIN, 2)
    saved_getin = int.from_bytes(vec[:2], "little")
    if stub_addr <= saved_getin <= stub_addr + STUB_MAX_LEN:
        logger.info("player already installed; reusing its saved GETIN vector")
        # The live stub's `chain` jmp operand holds the real saved GETIN.
        saved_getin = int.from_bytes(
            _read_ram(host, stub_addr + OFF_CHAIN_OPERAND, 2)[:2], "little"
        )
    if not saved_getin:
        saved_getin = DEFAULT_GETIN

    stub = build_stub(
        init_addr,
        play_addr,
        song - 1,
        saved_getin,
        stub_addr,
        period_for_clock(getattr(header, "clock", None)),
        raster_border,
    )

    backups: List[Tuple[int, bytes]] = []
    if backup:
        # Capture what we are about to overwrite, so stop() can restore it.
        backups.append((load, _read_ram(host, load, len(payload))))
        backups.append((stub_addr, _read_ram(host, stub_addr, len(stub))))
        backups.append((IGETIN, bytes(vec[:2])))

    # Order matters: tune and stub must both be in place before the vector
    # is repointed, or a GETIN between the writes would run a half-built stub.
    _write_ram(host, load, payload)
    _write_ram(host, stub_addr, stub)
    _write_ram(host, IGETIN, stub_addr.to_bytes(2, "little"))

    return InstalledPlayer(
        stub_addr=stub_addr, saved_getin=saved_getin, backups=backups
    )


def stop(host: str, installed: Optional[InstalledPlayer]) -> None:
    """Stop playback and restore the machine. Never resets the C64.

    Unhooks first (so no further `play` call can run), then silences the SID,
    then restores the overwritten RAM.
    """
    from .network_helper import dma_write_memory_rest

    saved = installed.saved_getin if installed else DEFAULT_GETIN
    _write_ram(host, IGETIN, saved.to_bytes(2, "little"))

    # Stop CIA2 Timer A (the stub started it) so it isn't left free-running
    # and latching underflows for whatever hooks $032A next.
    dma_write_memory_rest(host, CIA2_CRA, b"\x00")

    # Silence: master volume to 0. Safe now that nothing calls play anymore.
    dma_write_memory_rest(host, SID_VOLUME_REG, b"\x00")

    if installed:
        for address, original in installed.backups:
            if address == IGETIN:
                continue  # already restored above, with the correct value
            _write_ram(host, address, original)
