#!/usr/bin/env python3
"""Revert a mis-decoded region of a bank .asm back to .byte data lines.

Usage: todata.py <asmfile> <start_hex> <end_hex> [base_hex]

Finds the source lines whose emitted bytes cover [start,end) — using the
`// data $XXXX` comments and instruction byte comments to track the current
address — and replaces them with 16-wide .byte lines (with ASCII preview).
Boundaries must coincide with line boundaries.
"""
import re, sys, pathlib

DATA = re.compile(r"^    \.byte (.*?)\s*// data \$([0-9A-F]{4})")
INSN = re.compile(r"^    \S.*// ([0-9A-F]{2}(?: [0-9A-F]{2})*)(\s|$)")


def emitted_size(line):
    m = DATA.match(line)
    if m:
        return len(m.group(1).split(","))
    m = INSN.match(line)
    if m:
        return len(m.group(1).split(" "))
    if re.match(r"^    \.byte \$[0-9A-F]{2}(, \$[0-9A-F]{2})*\s*//", line):
        return len(line.split("//")[0].split(","))
    return 0


def main(path, start, end, base):
    bankno = int(re.search(r"bank0(\d)", path).group(1))
    data = pathlib.Path(pathlib.Path(path).parent / "rr38p-tmp12reu.bin").read_bytes()[bankno*8192:(bankno+1)*8192]
    lines = open(path).read().split("\n")
    # find the line index where address == start, walking addresses via anchors
    out, i, addr = [], 0, None
    while i < len(lines):
        l = lines[i]
        m = DATA.match(l)
        if m: addr = int(m.group(2), 16)
        if addr is None or addr < start or addr >= end:
            n = emitted_size(l)
            if addr is not None and n: addr += n
            out.append(l); i += 1; continue
        # addr == start here; consume lines until we've covered end
        assert addr == start, "region start $%04X falls mid-line at $%04X" % (start, addr)
        while addr < end:
            n = emitted_size(lines[i])
            if n == 0:
                # label/comment/anchor line inside region: keep it
                out.append(lines[i]); i += 1; continue
            addr += n; i += 1
        assert addr == end, "region end $%04X falls mid-line ($%04X)" % (end, addr)
        for a in range(start, end, 16):
            chunk = data[a-base:min(a+16, end)-base]
            txt = "".join(chr(x) if 32 <= x <= 95 else "." for x in chunk)
            out.append("    .byte %s    // data $%04X  \"%s\"" %
                       (", ".join("$%02X" % b for b in chunk), a, txt))
    open(path, "w").write("\n".join(out))
    print("reverted $%04X-$%04X to data in %s" % (start, end, path))


if __name__ == "__main__":
    base = int(sys.argv[4], 16) if len(sys.argv) > 4 else 0x8000
    main(sys.argv[1], int(sys.argv[2], 16), int(sys.argv[3], 16), base)
