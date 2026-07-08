#!/usr/bin/env python3
"""Fix mis-decoded inline arguments after print-inline-string and
cross-bank-call jsr sites in an existing bank .asm.

Usage: fix_inline.py <asmfile> <print_targets_csv> <word_targets_csv>

For every `jsr` to a print target not already followed by a .byte text line,
re-groups the following bytes (up to the $00 terminator) into .byte text
lines, then re-disassembles until the decode re-aligns with an existing
line boundary. Same for 2-byte inline words after cross-bank stubs.
"""
import re, sys, pathlib
sys.path.insert(0, str(pathlib.Path(__file__).parent))
from dis import disassemble, fmt

BYTES = re.compile(r"// ([0-9A-F]{2}(?: [0-9A-F]{2})*)(\s{2,}.*)?$")


def line_size(line):
    if not line.startswith("    "):
        return 0
    if line.lstrip().startswith(".byte"):
        return len(line.split("//")[0].split(","))
    m = BYTES.search(line)
    return len(m.group(1).split()) if m else 0


def main(path, prints, words):
    bankno = int(re.search(r"bank0(\d)", path).group(1))
    data = pathlib.Path(pathlib.Path(path).parent / "rr38p-tmp12reu.bin").read_bytes()[bankno*8192:(bankno+1)*8192]
    lines = open(path).read().split("\n")
    # compute address of each line by walking from anchors
    addrs = [None]*len(lines)
    addr = None
    for i, l in enumerate(lines):
        m = re.search(r"// data \$([0-9A-F]{4})", l)
        if m:
            addr = int(m.group(1), 16)
        if l.startswith(".pc"):
            addr = int(re.search(r"\$([0-9a-fA-F]{4})", l).group(1), 16)
            continue
        addrs[i] = addr
        if addr is not None:
            addr += line_size(l)
    boundary = {addrs[i]: i for i in range(len(lines)) if addrs[i] is not None}

    targets = {int(x, 16) for x in prints}
    wtargets = {int(x, 16) for x in words}
    out, i, fixed = [], 0, 0
    while i < len(lines):
        l = lines[i]
        m = re.match(r"^    jsr .*// 20 ([0-9A-F]{2}) ([0-9A-F]{2})", l)
        tgt = int(m.group(2) + m.group(1), 16) if m else None
        if tgt in targets or tgt in wtargets:
            a = addrs[i] + 3          # first byte after the jsr
            if tgt in wtargets:
                stop = a + 2
            else:
                stop = a
                while data[stop-0x8000] != 0:
                    stop += 1
                stop += 1              # include terminator
            # if the very next emitting line already covers exactly [a,stop): ok
            j = i + 1
            while j < len(lines) and line_size(lines[j]) == 0:
                j += 1
            if addrs[j] == a and ("inline arg" in lines[j] or "text" in lines[j]):
                out.append(l); i += 1; continue
            # find re-alignment point: walk a fresh instruction-wise decode
            # from stop until it lands exactly on an existing line boundary
            from dis import OPCODES, SIZES
            sync = stop
            while sync not in boundary:
                b = data[sync - 0x8000]
                sync += SIZES[OPCODES[b][1]] if b in OPCODES else 1
                if sync > stop + 192:
                    raise RuntimeError("no sync after $%04X in %s" % (a, path))
            out.append(l)
            if tgt in wtargets:
                out.append("    .byte $%02X, $%02X         // inline arg: cross-bank call target $%04X"
                           % (data[a-0x8000], data[a-0x8000+1],
                              data[a-0x8000] | data[a-0x8000+1] << 8))
            else:
                for p in range(a, stop, 16):
                    chunk = data[p-0x8000:min(p+16, stop)-0x8000]
                    txt = "".join(chr(x) if 32 <= x <= 95 else "." for x in chunk)
                    out.append("    .byte %s    // data $%04X  text: \"%s\"" %
                               (", ".join("$%02X" % x for x in chunk), p, txt))
            if sync > stop:
                insns, tg = disassemble(data, stop, sync, 0x8000, targets, wtargets)
                out.append(fmt(insns, tg, bankno))
            fixed += 1
            # skip original lines covering [a, sync)
            i += 1
            covered = a
            while covered < sync:
                covered_step = line_size(lines[i])
                # keep zero-size lines (labels/comments) unless they are
                # stale garbage labels; keep labels to be safe
                if covered_step == 0:
                    if lines[i].strip().endswith(":"):
                        out.append(lines[i])
                    i += 1
                    continue
                covered += covered_step
                i += 1
            continue
        out.append(l); i += 1
    open(path, "w").write("\n".join(out))
    print("fixed %d inline sites in %s" % (fixed, path))


if __name__ == "__main__":
    main(sys.argv[1],
         sys.argv[2].split(",") if sys.argv[2] != "-" else [],
         sys.argv[3].split(",") if len(sys.argv) > 3 and sys.argv[3] != "-" else [])
