#!/usr/bin/env python3
"""Disassemble a byte range of rr38p-tmp12reu.bin into KickAssembler source
lines matching the style of the rr38p-tmp12reu.bankNN.asm files.

Usage: dis.py <bank 0-7> <start_addr_hex> <end_addr_hex> [base_addr_hex]

start/end are CPU addresses assuming the bank is mapped at base (default $8000,
i.e. the normal RR 8K-game window). end is exclusive. Emits labels `bNN_XXXX`
for branch/jump targets that fall inside the range.

Any absolute-mode instruction with an operand < $0100 is emitted with the
`.abs` mnemonic suffix so KickAssembler does not shrink it to zero page
(which would change the byte count and shift the whole bank).
"""
import sys

# (mnemonic, mode). Modes: imp acc imm zp zpx zpy izx izy abs abx aby ind rel
OPCODES = {}
def op(code, mn, mode): OPCODES[code] = (mn, mode)

for code, mn, mode in [
    (0x00,"brk","imp"),(0x01,"ora","izx"),(0x05,"ora","zp"),(0x06,"asl","zp"),
    (0x08,"php","imp"),(0x09,"ora","imm"),(0x0A,"asl","acc"),(0x0D,"ora","abs"),
    (0x0E,"asl","abs"),(0x10,"bpl","rel"),(0x11,"ora","izy"),(0x15,"ora","zpx"),
    (0x16,"asl","zpx"),(0x18,"clc","imp"),(0x19,"ora","aby"),(0x1D,"ora","abx"),
    (0x1E,"asl","abx"),(0x20,"jsr","abs"),(0x21,"and","izx"),(0x24,"bit","zp"),
    (0x25,"and","zp"),(0x26,"rol","zp"),(0x28,"plp","imp"),(0x29,"and","imm"),
    (0x2A,"rol","acc"),(0x2C,"bit","abs"),(0x2D,"and","abs"),(0x2E,"rol","abs"),
    (0x30,"bmi","rel"),(0x31,"and","izy"),(0x35,"and","zpx"),(0x36,"rol","zpx"),
    (0x38,"sec","imp"),(0x39,"and","aby"),(0x3D,"and","abx"),(0x3E,"rol","abx"),
    (0x40,"rti","imp"),(0x41,"eor","izx"),(0x45,"eor","zp"),(0x46,"lsr","zp"),
    (0x48,"pha","imp"),(0x49,"eor","imm"),(0x4A,"lsr","acc"),(0x4C,"jmp","abs"),
    (0x4D,"eor","abs"),(0x4E,"lsr","abs"),(0x50,"bvc","rel"),(0x51,"eor","izy"),
    (0x55,"eor","zpx"),(0x56,"lsr","zpx"),(0x58,"cli","imp"),(0x59,"eor","aby"),
    (0x5D,"eor","abx"),(0x5E,"lsr","abx"),(0x60,"rts","imp"),(0x61,"adc","izx"),
    (0x65,"adc","zp"),(0x66,"ror","zp"),(0x68,"pla","imp"),(0x69,"adc","imm"),
    (0x6A,"ror","acc"),(0x6C,"jmp","ind"),(0x6D,"adc","abs"),(0x6E,"ror","abs"),
    (0x70,"bvs","rel"),(0x71,"adc","izy"),(0x75,"adc","zpx"),(0x76,"ror","zpx"),
    (0x78,"sei","imp"),(0x79,"adc","aby"),(0x7D,"adc","abx"),(0x7E,"ror","abx"),
    (0x81,"sta","izx"),(0x84,"sty","zp"),(0x85,"sta","zp"),(0x86,"stx","zp"),
    (0x88,"dey","imp"),(0x8A,"txa","imp"),(0x8C,"sty","abs"),(0x8D,"sta","abs"),
    (0x8E,"stx","abs"),(0x90,"bcc","rel"),(0x91,"sta","izy"),(0x94,"sty","zpx"),
    (0x95,"sta","zpx"),(0x96,"stx","zpy"),(0x98,"tya","imp"),(0x99,"sta","aby"),
    (0x9A,"txs","imp"),(0x9D,"sta","abx"),(0xA0,"ldy","imm"),(0xA1,"lda","izx"),
    (0xA2,"ldx","imm"),(0xA4,"ldy","zp"),(0xA5,"lda","zp"),(0xA6,"ldx","zp"),
    (0xA8,"tay","imp"),(0xA9,"lda","imm"),(0xAA,"tax","imp"),(0xAC,"ldy","abs"),
    (0xAD,"lda","abs"),(0xAE,"ldx","abs"),(0xB0,"bcs","rel"),(0xB1,"lda","izy"),
    (0xB4,"ldy","zpx"),(0xB5,"lda","zpx"),(0xB6,"ldx","zpy"),(0xB8,"clv","imp"),
    (0xB9,"lda","aby"),(0xBA,"tsx","imp"),(0xBC,"ldy","abx"),(0xBD,"lda","abx"),
    (0xBE,"ldx","aby"),(0xC0,"cpy","imm"),(0xC1,"cmp","izx"),(0xC4,"cpy","zp"),
    (0xC5,"cmp","zp"),(0xC6,"dec","zp"),(0xC8,"iny","imp"),(0xC9,"cmp","imm"),
    (0xCA,"dex","imp"),(0xCC,"cpy","abs"),(0xCD,"cmp","abs"),(0xCE,"dec","abs"),
    (0xD0,"bne","rel"),(0xD1,"cmp","izy"),(0xD5,"cmp","zpx"),(0xD6,"dec","zpx"),
    (0xD8,"cld","imp"),(0xD9,"cmp","aby"),(0xDD,"cmp","abx"),(0xDE,"dec","abx"),
    (0xE0,"cpx","imm"),(0xE1,"sbc","izx"),(0xE4,"cpx","zp"),(0xE5,"sbc","zp"),
    (0xE6,"inc","zp"),(0xE8,"inx","imp"),(0xE9,"sbc","imm"),(0xEA,"nop","imp"),
    (0xEC,"cpx","abs"),(0xED,"sbc","abs"),(0xEE,"inc","abs"),(0xF0,"beq","rel"),
    (0xF1,"sbc","izy"),(0xF5,"sbc","zpx"),(0xF6,"inc","zpx"),(0xF8,"sed","imp"),
    (0xF9,"sbc","aby"),(0xFD,"sbc","abx"),(0xFE,"inc","abx"),
]: op(code, mn, mode)

SIZES = {"imp":1,"acc":1,"imm":2,"zp":2,"zpx":2,"zpy":2,"izx":2,"izy":2,
         "abs":3,"abx":3,"aby":3,"ind":3,"rel":2}
# instructions that have a zero-page variant KickAss could shrink into
HAS_ZP = {"ora":{"abs","abx"},"asl":{"abs","abx"},"and":{"abs","abx"},
          "bit":{"abs"},"rol":{"abs","abx"},"eor":{"abs","abx"},
          "lsr":{"abs","abx"},"adc":{"abs","abx"},"ror":{"abs","abx"},
          "sta":{"abs","abx"},"sty":{"abs"},"stx":{"abs"},
          "ldy":{"abs","abx"},"lda":{"abs","abx"},"ldx":{"abs","aby"},
          "cpy":{"abs"},"cmp":{"abs","abx"},"dec":{"abs","abx"},
          "cpx":{"abs"},"sbc":{"abs","abx"},"inc":{"abs","abx"}}

def is_text(b): return 0x20 <= b <= 0x5F or b == 0x0D

def disassemble(data, start, end, base, inline_after=(), inline_words=()):
    """Yield (addr, size, text, bytes) tuples; also compute in-range targets.

    inline_after: set of jsr targets that consume a $00-terminated inline
    string following the jsr (print-inline-text routines).
    inline_words: set of jsr targets that consume a 2-byte inline argument
    (cross-bank call stubs: the word is the target address in the other bank).
    Runs of >=6 printable bytes and runs of >=8 zero bytes are emitted as
    data, not decoded as instructions.
    """
    insns = []
    pc = start
    while pc < end:
        off = pc - base
        b = data[off]
        # zero-padding run
        if b == 0 and pc + 8 <= end and all(x == 0 for x in data[off:off+8]):
            n = 0
            while pc + n < end and data[off+n] == 0: n += 1
            insns.append((pc, n, ("pad",), data[off:off+n])); pc += n; continue
        # text run
        if is_text(b) and pc + 6 <= end and all(is_text(x) for x in data[off:off+6]):
            n = 0
            while pc + n < end and is_text(data[off+n]): n += 1
            if pc + n < end and data[off+n] == 0: n += 1   # include terminator
            insns.append((pc, n, ("text",), data[off:off+n])); pc += n; continue
        if b in OPCODES:
            mn, mode = OPCODES[b]
            size = SIZES[mode]
            if pc + size > end:
                insns.append((pc, 1, None, data[off:off+1])); pc += 1; continue
            raw = data[off:off+size]
            insns.append((pc, size, (mn, mode, raw), raw))
            pc += size
            if mn == "jsr" and mode == "abs" and (raw[1] | raw[2] << 8) in inline_words \
                    and pc + 2 <= end:
                w = data[pc-base] | data[pc-base+1] << 8
                insns.append((pc, 2, ("word", w), data[pc-base:pc-base+2]))
                pc += 2
            # print-inline-text routines: string follows the jsr, ends at $00
            elif mn == "jsr" and mode == "abs" and (raw[1] | raw[2] << 8) in inline_after:
                n = 0
                while pc + n < end and data[pc - base + n] != 0: n += 1
                if pc + n < end: n += 1  # the $00 terminator
                if n:
                    insns.append((pc, n, ("text",), data[pc-base:pc-base+n]))
                    pc += n
        else:
            insns.append((pc, 1, None, data[off:off+1]))
            pc += 1
    # collect branch/jump targets inside range
    targets = set()
    for pc, size, dec, raw in insns:
        if not dec or len(dec) != 3: continue
        mn, mode, raw = dec
        if mode == "rel":
            t = pc + 2 + (raw[1] - 256 if raw[1] >= 128 else raw[1])
            if start <= t < end: targets.add(t)
        elif mn in ("jmp", "jsr") and mode == "abs":
            t = raw[1] | raw[2] << 8
            if start <= t < end: targets.add(t)
    starts = {i[0] for i in insns}
    return insns, targets & starts

def fmt(insns, targets, bankno):
    out = []
    lbl = lambda a: "b%02d_%04X" % (bankno, a)
    for pc, size, dec, raw in insns:
        if pc in targets:
            out.append(lbl(pc) + ":")
        if dec and dec[0] == "pad":
            a = pc
            for i in range(0, len(raw), 16):
                chunk = raw[i:i+16]
                out.append("    .byte %s    // data $%04X" %
                           (", ".join("$%02X" % x for x in chunk), a))
                a += len(chunk)
            continue
        if dec and dec[0] == "word":
            out.append("    .byte $%02X, $%02X         // inline arg: cross-bank call target $%04X"
                       % (raw[0], raw[1], dec[1]))
            continue
        if dec and dec[0] == "text":
            a = pc
            for i in range(0, len(raw), 16):
                chunk = raw[i:i+16]
                txt = "".join(chr(x) if 32 <= x <= 95 else "." for x in chunk)
                out.append("    .byte %s    // data $%04X  text: \"%s\"" %
                           (", ".join("$%02X" % x for x in chunk), a, txt))
                a += len(chunk)
            continue
        hexs = " ".join("%02X" % x for x in raw)
        if dec is None:
            out.append("    .byte $%02X    // %s  undocumented/illegal at $%04X"
                       % (raw[0], hexs, pc))
            continue
        mn, mode, raw = dec
        w = raw[1] | (raw[2] << 8) if size == 3 else (raw[1] if size == 2 else 0)
        if mode in ("imp",): a = mn
        elif mode == "acc": a = mn
        elif mode == "imm": a = "%s #$%02x" % (mn, raw[1])
        elif mode == "zp":  a = "%s $%02x" % (mn, raw[1])
        elif mode == "zpx": a = "%s $%02x,x" % (mn, raw[1])
        elif mode == "zpy": a = "%s $%02x,y" % (mn, raw[1])
        elif mode == "izx": a = "%s ($%02x,x)" % (mn, raw[1])
        elif mode == "izy": a = "%s ($%02x),y" % (mn, raw[1])
        elif mode == "ind": a = "%s ($%04x)" % (mn, w)
        elif mode == "rel":
            t = pc + 2 + (raw[1] - 256 if raw[1] >= 128 else raw[1])
            a = "%s %s" % (mn, lbl(t) if t in targets else "$%04x" % t)
        else:  # abs abx aby
            suffix = ""
            if w < 0x100 and mode in HAS_ZP.get(mn, ()): suffix = ".abs"
            tgt = lbl(w) if (mn in ("jmp","jsr") and w in targets) else "$%04x" % w
            idx = {"abs":"","abx":",x","aby":",y"}[mode]
            a = "%s%s %s%s" % (mn, suffix, tgt, idx)
        out.append("    %-22s // %s" % (a, hexs))
    return "\n".join(out)

if __name__ == "__main__":
    bank = int(sys.argv[1])
    start = int(sys.argv[2], 16); end = int(sys.argv[3], 16)
    base = int(sys.argv[4], 16) if len(sys.argv) > 4 else 0x8000
    inline = set(int(x, 16) for x in sys.argv[5].split(",")) if len(sys.argv) > 5 and sys.argv[5] != "-" else set()
    inlinew = set(int(x, 16) for x in sys.argv[6].split(",")) if len(sys.argv) > 6 else set()
    import pathlib
    binpath = pathlib.Path(__file__).parent.parent / "rr38p-tmp12reu.bin"
    data = bytes(pathlib.Path(binpath).read_bytes())[bank*8192:(bank+1)*8192]
    # data is indexed by (addr - base); only valid for addr >= base
    insns, targets = disassemble(data, start, end, base, inline, inlinew)
    print(fmt(insns, targets, bank))
