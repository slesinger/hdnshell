#!/usr/bin/env python3
"""
c64_dma.py — DMA loader for Ultimate II+/II+L over TCP (port 64).

Works correctly with custom BASIC ROMs, since execution uses a direct
JMP rather than BASIC RUN or LOAD commands.

Commands:
  load     <host> <file.prg>
      DMA load a PRG into C64 memory. No execution.
      file.prg format: [load_addr lo][load_addr hi][data...]

  run-prg  <host> <file.prg>
      DMA load a PRG and jump to its own load address.
      Equivalent to: jump <host> <file.prg> <load_addr_from_prg>

  jump     <host> <file.prg|bin> <jump_addr>
      DMA load a PRG (with its own load address header) and JMP
      to <jump_addr>. Use when jump target differs from load address.
      <jump_addr>: decimal or 0x-prefixed hex, e.g. 0x1800 or 6144

  jump-raw <host> <file.bin> <load_addr> <jump_addr>
      DMA load a raw binary (no PRG header) at <load_addr> and JMP
      to <jump_addr>.

Options:
  --password <pw>   Authenticate before sending (if device has a password set)

Examples:
  python3 c64_dma.py load        192.168.1.50 myprog.prg
  python3 c64_dma.py run-prg     192.168.1.50 myprog.prg
  python3 c64_dma.py jump        192.168.1.50 myprog.prg 0x0801
  python3 c64_dma.py jump-raw    192.168.1.50 payload.bin 0x1000 0x1000
  python3 c64_dma.py run-prg     192.168.1.50 myprog.prg --password secret
"""

import sys
import socket
import argparse
from struct import pack

PORT = 64
MAX_SIZE = 200_000  # matches firmware SOCKET_BUFFER_SIZE

# Command codes (software/network/socket_dma.cc)
CMD_DMA          = 0xFF01  # DMA load PRG into memory, no execution
CMD_DMAJUMP      = 0xFF09  # DMA load + JMP to address (bypasses BASIC)
CMD_AUTHENTICATE = 0xFF1F  # Password authentication


def send_all(sock: socket.socket, data: bytes) -> None:
    total = 0
    while total < len(data):
        sent = sock.send(data[total:])
        if sent == 0:
            raise RuntimeError("Socket connection broken")
        total += sent


def recv_all(sock: socket.socket, length: int) -> bytes:
    buf = b""
    while len(buf) < length:
        chunk = sock.recv(length - len(buf))
        if not chunk:
            raise RuntimeError("Socket closed before all data received")
        buf += chunk
    return buf


def send_command(sock: socket.socket, cmd: int, payload: bytes) -> None:
    """
    Wire format: [cmd: 2 bytes LE][len: 2 bytes LE][payload: len bytes]
    """
    if len(payload) > MAX_SIZE:
        raise ValueError(
            f"Payload size {len(payload)} exceeds firmware limit {MAX_SIZE}"
        )
    frame = pack("<HH", cmd, len(payload)) + payload
    send_all(sock, frame)


def authenticate(sock: socket.socket, password: str) -> None:
    print("  Authenticating...")
    send_command(sock, CMD_AUTHENTICATE, password.encode("utf-8"))
    response = recv_all(sock, 1)
    if response[0] != 1:
        raise RuntimeError("Authentication failed (wrong password)")
    print("  Authenticated OK.")


def open_connection(host: str, password: str | None) -> socket.socket:
    sock = socket.create_connection((host, PORT))
    if password is not None:
        authenticate(sock, password)
    return sock


# ---------------------------------------------------------------------------
# Command implementations
# ---------------------------------------------------------------------------

def cmd_load(host: str, prg_path: str, password: str | None) -> None:
    """0xFF01 — DMA load a PRG into C64 memory. No execution."""
    with open(prg_path, "rb") as f:
        prg = f.read(MAX_SIZE)

    load_addr = prg[0] | (prg[1] << 8)
    print(f"[0xFF01  DMA LOAD]  {prg_path}")
    print(f"  load_addr = 0x{load_addr:04X}, size = {len(prg)} bytes")

    with open_connection(host, password) as sock:
        print(f"  Connecting to {host}:{PORT} ...")
        send_command(sock, CMD_DMA, prg)

    print("  Done. Data is in C64 memory. No execution.")


def cmd_run_prg(host: str, prg_path: str, password: str | None) -> None:
    """
    0xFF09 — DMA load a PRG and jump to its own load address.

    Payload layout (firmware expectation for CMD_DMAJUMP):
      [jump_addr lo][jump_addr hi]   <- 2 bytes: jump target, consumed by firmware
      [load_addr lo][load_addr hi]   <- these are the first 2 bytes of the PRG
      [code data...]                 <- rest of the PRG

    So payload = pack("<H", jump_addr) + full_prg_bytes
    Since jump_addr == prg load_addr here, the first 4 bytes will be the same
    address twice, which is exactly what the firmware expects.
    """
    with open(prg_path, "rb") as f:
        prg = f.read(MAX_SIZE)

    load_addr = prg[0] | (prg[1] << 8)
    print(f"[0xFF09  DMA JUMP]  {prg_path}")
    print(f"  load_addr = 0x{load_addr:04X}, jump_addr = 0x{load_addr:04X}, "
          f"size = {len(prg)} bytes")

    # Prepend the jump address; the rest is the PRG (which carries its own load
    # address header that load_buffer_dma will consume).
    payload = pack("<H", load_addr) + prg

    with open_connection(host, password) as sock:
        print(f"  Connecting to {host}:{PORT} ...")
        send_command(sock, CMD_DMAJUMP, payload)

    print(f"  Done. C64 is jumping to 0x{load_addr:04X}.")


def cmd_jump(host: str, prg_path: str, jump_addr: int, password: str | None) -> None:
    """
    0xFF09 — DMA load a PRG and jump to an explicit (possibly different) address.

    Payload = pack("<H", jump_addr) + full_prg_bytes
    """
    with open(prg_path, "rb") as f:
        prg = f.read(MAX_SIZE)

    load_addr = prg[0] | (prg[1] << 8)
    print(f"[0xFF09  DMA JUMP]  {prg_path}")
    print(f"  load_addr = 0x{load_addr:04X}, jump_addr = 0x{jump_addr:04X}, "
          f"size = {len(prg)} bytes")

    payload = pack("<H", jump_addr) + prg

    with open_connection(host, password) as sock:
        print(f"  Connecting to {host}:{PORT} ...")
        send_command(sock, CMD_DMAJUMP, payload)

    print(f"  Done. C64 is jumping to 0x{jump_addr:04X}.")


def cmd_jump_raw(
    host: str,
    bin_path: str,
    load_addr: int,
    jump_addr: int,
    password: str | None,
) -> None:
    """
    0xFF09 — DMA load a raw binary (no PRG header) at load_addr, JMP to jump_addr.

    Payload layout:
      [jump_addr lo][jump_addr hi]   <- consumed by firmware as jump target
      [load_addr lo][load_addr hi]   <- PRG-style header that load_buffer_dma reads
      [raw data...]
    """
    with open(bin_path, "rb") as f:
        data = f.read(MAX_SIZE)

    print(f"[0xFF09  DMA JUMP (raw)]  {bin_path}")
    print(f"  load_addr = 0x{load_addr:04X}, jump_addr = 0x{jump_addr:04X}, "
          f"size = {len(data)} bytes")

    payload = pack("<HH", jump_addr, load_addr) + data

    with open_connection(host, password) as sock:
        print(f"  Connecting to {host}:{PORT} ...")
        send_command(sock, CMD_DMAJUMP, payload)

    print(f"  Done. C64 is jumping to 0x{jump_addr:04X}.")


# ---------------------------------------------------------------------------
# CLI
# ---------------------------------------------------------------------------

def parse_addr(s: str, name: str, parser: argparse.ArgumentParser) -> int:
    try:
        addr = int(s, 0)
    except ValueError:
        parser.error(f"Invalid {name} '{s}': use decimal or 0x-prefixed hex")
    if not (0x0000 <= addr <= 0xFFFF):
        parser.error(f"{name} 0x{addr:X} is outside the C64 16-bit address space")
    return addr


def main() -> None:
    parser = argparse.ArgumentParser(
        description="DMA loader for Ultimate II+/II+L — bypasses BASIC via direct JMP",
        formatter_class=argparse.RawDescriptionHelpFormatter,
        epilog=__doc__,
    )
    parser.add_argument("--password", metavar="PW", default=None,
                        help="Device password (leave out if none is configured)")

    sub = parser.add_subparsers(dest="command", required=True)

    p = sub.add_parser("load", help="DMA load PRG into memory (no execution)")
    p.add_argument("host", help="IP or hostname of the Ultimate device")
    p.add_argument("file", help=".prg file to load")

    p = sub.add_parser("run-prg", help="DMA load PRG and JMP to its load address")
    p.add_argument("host")
    p.add_argument("file", help=".prg file to load and execute")

    p = sub.add_parser("jump",
                       help="DMA load PRG and JMP to an explicit address")
    p.add_argument("host")
    p.add_argument("file", help=".prg file to load")
    p.add_argument("jump_addr", help="Jump target address (dec or 0x hex)")

    p = sub.add_parser("jump-raw",
                       help="DMA load a raw binary at load_addr and JMP to jump_addr")
    p.add_argument("host")
    p.add_argument("file", help="Raw binary file (no PRG header)")
    p.add_argument("load_addr", help="C64 address to load data at")
    p.add_argument("jump_addr", help="C64 address to jump to after loading")

    args = parser.parse_args()

    try:
        if args.command == "load":
            cmd_load(args.host, args.file, args.password)
        elif args.command == "run-prg":
            cmd_run_prg(args.host, args.file, args.password)
        elif args.command == "jump":
            jump_addr = parse_addr(args.jump_addr, "jump_addr", parser)
            cmd_jump(args.host, args.file, jump_addr, args.password)
        elif args.command == "jump-raw":
            load_addr = parse_addr(args.load_addr, "load_addr", parser)
            jump_addr = parse_addr(args.jump_addr, "jump_addr", parser)
            cmd_jump_raw(args.host, args.file, load_addr, jump_addr, args.password)
    except FileNotFoundError as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
    except (RuntimeError, OSError, ValueError) as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == "__main__":
    main()