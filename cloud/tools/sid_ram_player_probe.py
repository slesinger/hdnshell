#!/usr/bin/env python3
"""
Hardware probe for the in-C64 RAM SID player (GH #28).

The Ultimate's own `sidplay` runner was tried first and rejected -- it takes
the machine over and the only way out is a reset. Here the tune is instead
DMA'd into C64 RAM together with a 48-byte player stub hooked onto IGETIN
($032A) -- the KERNAL vector the HDN console's key loop already calls once per
frame. The console keeps running, keeps the screen, and keeps the keyboard.

What `play` does, in order:
  1. fetch the .sid from an HVSC mirror and parse its header
  2. refuse the tune if it would overwrite the screen, zero page, the
     cartridge window or the stub itself (nothing is written in that case)
  3. read back and save the RAM it is about to overwrite, plus the current
     $032A vector, into a state file so `stop` can put it all back
  4. write tune, stub, then the vector (in that order)

`stop` restores the vector, halts CIA2 Timer A, zeroes $D418 and pushes the
saved RAM back. It never resets the machine.

Prerequisite: the C64 must be sitting in an HDN **server console** (any of
them -- the console key loop is what ticks the player). At the wedge BASIC
prompt GETIN is also called, so it plays there too, just at the timer rate.

Usage
-----
  # play Commando under whatever console is on screen
  python3 tools/sid_ram_player_probe.py play --host 192.168.1.65

  # show the raster time the tune costs as a coloured border band
  python3 tools/sid_ram_player_probe.py play --host 192.168.1.65 --border

  # a specific tune / subtune
  python3 tools/sid_ram_player_probe.py play --host 192.168.1.65 \
      --path /MUSICIANS/H/Hubbard_Rob/Delta.sid --songnr 2

  # what does the header say, without touching the C64?
  python3 tools/sid_ram_player_probe.py header --path /MUSICIANS/H/Hubbard_Rob/Delta.sid

  # disassemble the exact bytes that would be written, without touching the C64
  python3 tools/sid_ram_player_probe.py stub --path /MUSICIANS/H/Hubbard_Rob/Delta.sid

  # stop and restore
  python3 tools/sid_ram_player_probe.py stop --host 192.168.1.65
"""

import argparse
import json
import os
import sys
import tempfile

sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))

from sdk import hvsc_index as hvsc  # noqa: E402
from sdk import sid_c64_player as player  # noqa: E402
from sdk.sid_header import parse_sid_header  # noqa: E402

DEFAULT_MIRROR = hvsc.MIRRORS[0]
DEFAULT_PATH = "/MUSICIANS/H/Hubbard_Rob/Commando.sid"

# `play` and `stop` are separate process runs, so what was overwritten has to
# outlive the process that overwrote it.
STATE_FILE = os.path.join(tempfile.gettempdir(), "hdn_sid_ram_player.json")


def _save_state(installed: player.InstalledPlayer) -> None:
    with open(STATE_FILE, "w", encoding="utf-8") as f:
        json.dump(
            {
                "stub_addr": installed.stub_addr,
                "saved_getin": installed.saved_getin,
                "backups": [
                    [addr, data.hex()] for addr, data in installed.backups
                ],
            },
            f,
        )


def _load_state():
    if not os.path.exists(STATE_FILE):
        return None
    with open(STATE_FILE, "r", encoding="utf-8") as f:
        raw = json.load(f)
    return player.InstalledPlayer(
        stub_addr=raw["stub_addr"],
        saved_getin=raw["saved_getin"],
        backups=[(addr, bytes.fromhex(hexdata)) for addr, hexdata in raw["backups"]],
    )


def _fetch(args) -> bytes:
    print(f"Fetching {args.path} from {args.mirror}")
    data = hvsc.fetch_sid_bytes(args.mirror, args.path)
    print(f"  got {len(data)} bytes, magic={data[:4]!r}")
    return data


def _describe(header, data: bytes) -> None:
    payload_len = len(player.sid_payload(data, header))
    print(f"  format      {header.magic} v{header.version}")
    print(f"  title       {header.name}")
    print(f"  author      {header.author}")
    print(f"  load        ${header.load_address:04X}")
    print(f"  init        ${header.init_address:04X}")
    print(f"  play        ${header.play_address:04X}"
          + ("   <-- 0 means the tune installs its own IRQ" if not header.play_address else ""))
    print(f"  subtunes    {header.songs} (default {header.start_song})")
    print(f"  clock       {header.clock}   sid model {header.sid_model}")
    print(f"  payload     {payload_len} bytes -> ${header.load_address:04X}-${header.load_address + payload_len - 1:04X}")


def cmd_header(args) -> int:
    data = _fetch(args)
    header = parse_sid_header(data)
    _describe(header, data)
    try:
        player.check_tune_compatibility(header, len(data))
        print("  RAM player: OK")
    except player.SidPlayerError as e:
        print(f"  RAM player: REFUSED - {e}")
        return 1
    return 0


def cmd_stub(args) -> int:
    """Print the stub bytes that would be written -- no C64 needed."""
    data = _fetch(args)
    header = parse_sid_header(data)
    player.check_tune_compatibility(header, len(data))
    stub = player.build_stub(
        header.init_address or header.load_address,
        header.play_address,
        (args.songnr or 1) - 1,
        player.DEFAULT_GETIN,
        player.DEFAULT_STUB_ADDR,
        player.period_for_clock(header.clock),
        args.border,
    )
    base = player.DEFAULT_STUB_ADDR
    print(f"stub at ${base:04X}, {len(stub)} bytes"
          + (", with raster-time border markers" if args.border else ""))
    for offset in range(0, len(stub), 8):
        chunk = stub[offset:offset + 8]
        print(f"  ${base + offset:04X}  " + " ".join(f"{b:02X}" for b in chunk))
    return 0


def cmd_play(args) -> int:
    data = _fetch(args)
    header = parse_sid_header(data)
    _describe(header, data)

    try:
        player.check_tune_compatibility(header, len(data))
    except player.SidPlayerError as e:
        print(f"\nREFUSED (nothing written to the C64): {e}")
        return 1

    # Any previous install must be undone first, or its backups would be lost
    # and this install would capture the *previous* tune as "original" RAM.
    previous = _load_state()
    if previous is not None:
        print("Restoring a previous install first...")
        player.stop(args.host, previous)
        os.remove(STATE_FILE)

    print(f"\nInstalling under the running console on {args.host}...")
    installed = player.install(
        args.host,
        data,
        header,
        song=args.songnr or 1,
        raster_border=args.border,
    )
    _save_state(installed)

    saved = sum(len(b) for _, b in installed.backups)
    print(f"  stub at ${installed.stub_addr:04X}, "
          f"chaining GETIN to ${installed.saved_getin:04X}")
    print(f"  {saved} bytes of C64 RAM backed up to {STATE_FILE}")
    print()
    print("--> LOOK AT THE C64 and check:")
    print("      1. Is the tune playing?")
    print("      2. Is the HDN console still on screen and still taking keys?")
    print("      3. Does the tempo sound right (not double/half speed)?")
    if args.border:
        print("      4. Is there a coloured band in the border? Its height is")
        print("         the raster time the tune costs.")
    print()
    print("    Then:  sid_ram_player_probe.py stop --host %s" % args.host)
    return 0


def cmd_stop(args) -> int:
    installed = _load_state()
    if installed is None:
        print(f"No saved install ({STATE_FILE} missing).")
        print("Unhooking $032A and silencing the SID anyway; RAM is NOT restored.")
    player.stop(args.host, installed)
    if installed is not None:
        os.remove(STATE_FILE)
        print("Unhooked, SID silenced, C64 RAM restored. No reset was issued.")
    print()
    print("--> Did the sound stop, and is the console still usable?")
    return 0


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Probe the in-C64 RAM SID player (GH #28)."
    )
    host_arg = argparse.ArgumentParser(add_help=False)
    host_arg.add_argument("--host", required=True, help="Ultimate64/C64U IP address")

    tune_arg = argparse.ArgumentParser(add_help=False)
    tune_arg.add_argument("--path", default=DEFAULT_PATH, help="HVSC .sid path")
    tune_arg.add_argument("--mirror", default=DEFAULT_MIRROR, help="HVSC mirror URL")
    tune_arg.add_argument("--songnr", type=int, default=None, help="subtune (1-based)")
    tune_arg.add_argument(
        "--border",
        action="store_true",
        help="bracket the play call with inc/dec $D020 to show raster time",
    )

    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("header", parents=[tune_arg], help="parse a tune, no C64 needed")
    p.set_defaults(func=cmd_header)

    p = sub.add_parser("stub", parents=[tune_arg], help="dump the stub bytes")
    p.set_defaults(func=cmd_stub)

    p = sub.add_parser("play", parents=[host_arg, tune_arg], help="install and play")
    p.set_defaults(func=cmd_play)

    p = sub.add_parser("stop", parents=[host_arg], help="unhook and restore RAM")
    p.set_defaults(func=cmd_stop)

    args = parser.parse_args()
    return args.func(args)


if __name__ == "__main__":
    sys.exit(main())
