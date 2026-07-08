#!/usr/bin/env python3
"""Replace .byte data lines covering [start,end) in a bank .asm file with a
disassembly of the same bytes (from rr38p-tmp12reu.bin, the point of truth).

Usage: splice.py <asmfile> <start_hex> <end_hex> [base_hex]

Boundaries may fall mid-.byte-line; the remainder is re-emitted as .byte.
build.sh must still produce a byte-identical image afterwards.
"""
import re, sys, pathlib
sys.path.insert(0, str(pathlib.Path(__file__).parent))
from dis import disassemble, fmt

DATA = re.compile(r"^    \.byte (.*?)\s*// data \$([0-9A-F]{4})")

def byte_line(addr, bs):
    return "    .byte %s    // data $%04X" % (", ".join("$%02X" % b for b in bs), addr)

def main(path, start, end, base, inline=(), inlinew=()):
    bankno = int(re.search(r"bank0(\d)", path).group(1))
    data = pathlib.Path(pathlib.Path(path).parent / "rr38p-tmp12reu.bin").read_bytes()[bankno*8192:(bankno+1)*8192]
    lines = open(path).read().split("\n")
    out, replaced = [], False
    i = 0
    while i < len(lines):
        m = DATA.match(lines[i])
        if not m:
            out.append(lines[i]); i += 1; continue
        addr = int(m.group(2), 16)
        n = len(m.group(1).split(","))
        if addr + n <= start or addr >= end:
            out.append(lines[i]); i += 1; continue
        # this data line overlaps the region
        if addr < start:
            out.append(byte_line(addr, data[addr-base:start-base]))
        if not replaced:
            insns, targets = disassemble(data, start, end, base, inline, inlinew)
            out.append(fmt(insns, targets, bankno))
            replaced = True
        if addr + n > end:
            out.append(byte_line(end, data[end-base:addr+n-base]))
        i += 1
    open(path, "w").write("\n".join(out))
    print("spliced $%04X-$%04X into %s" % (start, end, path))

if __name__ == "__main__":
    base = int(sys.argv[4], 16) if len(sys.argv) > 4 else 0x8000
    inline = set(int(x, 16) for x in sys.argv[5].split(",")) if len(sys.argv) > 5 and sys.argv[5] != "-" else set()
    inlinew = set(int(x, 16) for x in sys.argv[6].split(",")) if len(sys.argv) > 6 else set()
    main(sys.argv[1], int(sys.argv[2], 16), int(sys.argv[3], 16), base, inline, inlinew)
