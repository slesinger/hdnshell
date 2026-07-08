#!/usr/bin/env python3
"""Enrich a rr38p-tmp12reu.bankNN.asm file (idempotent):

1. Anchor every .byte data run with an address label + .errorif shift guard,
   so inserting/removing bytes anywhere above fails the build loudly instead
   of silently shifting the rest of the bank.
2. Append human-readable comments for known C64 / Retro Replay / REU hardware
   addresses, KERNAL entry points and RAM vectors on instruction lines.

Neither pass changes emitted bytes; build.sh verifies against the .bin anyway.
"""
import re, sys

KERNAL = {
    0xFF81:"KERNAL CINT: init screen", 0xFF84:"KERNAL IOINIT: init CIAs/IRQ",
    0xFF87:"KERNAL RAMTAS", 0xFF8A:"KERNAL RESTOR: default vectors",
    0xFF8D:"KERNAL VECTOR", 0xFF90:"KERNAL SETMSG", 0xFF93:"KERNAL SECOND",
    0xFF96:"KERNAL TKSA", 0xFF99:"KERNAL MEMTOP", 0xFF9C:"KERNAL MEMBOT",
    0xFF9F:"KERNAL SCNKEY: scan keyboard", 0xFFA2:"KERNAL SETTMO",
    0xFFA5:"KERNAL ACPTR: serial byte in", 0xFFA8:"KERNAL CIOUT: serial byte out",
    0xFFAB:"KERNAL UNTLK", 0xFFAE:"KERNAL UNLSN", 0xFFB1:"KERNAL LISTEN",
    0xFFB4:"KERNAL TALK", 0xFFB7:"KERNAL READST: read I/O status",
    0xFFBA:"KERNAL SETLFS: set file/dev/sec", 0xFFBD:"KERNAL SETNAM: set filename",
    0xFFC0:"KERNAL OPEN", 0xFFC3:"KERNAL CLOSE", 0xFFC6:"KERNAL CHKIN",
    0xFFC9:"KERNAL CHKOUT", 0xFFCC:"KERNAL CLRCHN", 0xFFCF:"KERNAL CHRIN",
    0xFFD2:"KERNAL CHROUT: print char", 0xFFD5:"KERNAL LOAD", 0xFFD8:"KERNAL SAVE",
    0xFFDB:"KERNAL SETTIM", 0xFFDE:"KERNAL RDTIM", 0xFFE1:"KERNAL STOP: check STOP key",
    0xFFE4:"KERNAL GETIN: get key", 0xFFE7:"KERNAL CLALL", 0xFFEA:"KERNAL UDTIM",
    0xFFED:"KERNAL SCREEN", 0xFFF0:"KERNAL PLOT: set/get cursor", 0xFFF3:"KERNAL IOBASE",
}
HW = {
    0xD011:"VIC control 1 (screen on/off, YSCROLL)", 0xD012:"VIC raster",
    0xD015:"VIC sprite enable", 0xD016:"VIC control 2 (XSCROLL, 38/40col)",
    0xD018:"VIC memory setup (screen/charset base)", 0xD019:"VIC IRQ flags",
    0xD01A:"VIC IRQ enable", 0xD020:"VIC border color", 0xD021:"VIC background color",
    0xD418:"SID volume/filter mode",
    0xDC00:"CIA1 port A (keyboard cols / joy2)", 0xDC01:"CIA1 port B (keyboard rows / joy1)",
    0xDC02:"CIA1 DDR A", 0xDC03:"CIA1 DDR B",
    0xDC04:"CIA1 timer A lo", 0xDC05:"CIA1 timer A hi",
    0xDC0D:"CIA1 ICR (IRQ control/ack)", 0xDC0E:"CIA1 CRA", 0xDC0F:"CIA1 CRB",
    0xDD00:"CIA2 port A (VIC bank, IEC lines)", 0xDD01:"CIA2 port B (user port)",
    0xDD02:"CIA2 DDR A", 0xDD03:"CIA2 DDR B",
    0xDD0D:"CIA2 ICR (NMI control/ack)", 0xDD0E:"CIA2 CRA", 0xDD0F:"CIA2 CRB",
    0xDE00:"RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze",
    0xDE01:"RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map",
    0xDF00:"REU status", 0xDF01:"REU command (b7=execute)",
    0xDF02:"REU C64 base lo", 0xDF03:"REU C64 base hi",
    0xDF04:"REU addr lo", 0xDF05:"REU addr hi", 0xDF06:"REU bank",
    0xDF07:"REU length lo", 0xDF08:"REU length hi",
    0xDF09:"REU IRQ mask", 0xDF0A:"REU address control",
    0x0200:"BASIC input buffer",  0x0277:"keyboard buffer",
    0x0286:"current text color", 0x0288:"screen memory page",
    0x028A:"key repeat flag", 0x0291:"shift/charset switch enable",
    0x0300:"IERROR vector", 0x0302:"IMAIN vector (BASIC idle loop)",
    0x0304:"ICRNCH vector", 0x0308:"IGONE vector (execute stmt)",
    0x0314:"CINV IRQ vector", 0x0316:"CBINV BRK vector", 0x0318:"NMINV NMI vector",
    0x0328:"ISTOP vector", 0x032A:"IGETIN vector",
    0x0330:"ILOAD vector", 0x0332:"ISAVE vector",
    0x0400:"screen RAM", 0x07F8:"sprite pointers",
    0xA000:"BASIC cold start vec", 0xA483:"BASIC main loop",
    0xE386:"BASIC warm start (READY)", 0xE3BF:"BASIC init RAM/CHRGET",
    0xE453:"BASIC copy vectors to $0300", 0xE518:"KERNAL screen init",
    0xE544:"KERNAL clear screen", 0xE716:"KERNAL screen CHROUT",
    0xEA31:"KERNAL std IRQ handler", 0xEA81:"KERNAL IRQ exit",
    0xFCE2:"KERNAL RESET entry", 0xFD15:"KERNAL set vectors",
    0xFDA3:"KERNAL IOINIT guts", 0xFF5B:"KERNAL CINT guts (video init)",
}
ZP = {
    0x01:"CPU port: mem banking", 0x73:"CHRGET", 0x7A:"TXTPTR lo", 0x7B:"TXTPTR hi",
    0x90:"KERNAL I/O status", 0x9D:"KERNAL msg mode", 0xB7:"filename length",
    0xB8:"logical file#", 0xB9:"secondary addr", 0xBA:"current device",
    0xBB:"filename ptr lo", 0xBC:"filename ptr hi", 0xC1:"I/O start addr lo",
    0xC2:"I/O start addr hi", 0xC6:"keyboard buffer count", 0xCB:"current key index",
    0xAE:"load end addr lo", 0xAF:"load end addr hi", 0xC5:"last key",
    0x2B:"BASIC prog start lo", 0x2C:"BASIC prog start hi",
    0x2D:"BASIC vars start lo", 0x2E:"BASIC vars start hi",
    0x37:"BASIC mem top lo", 0x38:"BASIC mem top hi",
}

INSN = re.compile(r"^    ([a-z]{3}(?:\.abs)?) ([^/]*?)\s*// ([0-9A-F]{2}(?: [0-9A-F]{2})*)$")
DATA = re.compile(r"^    \.byte .*// data \$([0-9A-F]{4})$")

def annotate_line(line, kernal_ok):
    m = INSN.match(line)
    if not m: return line
    mn, operand, hexs = m.groups()
    operand = operand.strip()
    note = None
    am = re.match(r"^\(?\$([0-9a-f]{4})\)?(,[xy])?\)?$", operand)
    zm = re.match(r"^\$([0-9a-f]{2})(,[xy])?$", operand)
    if am:
        addr = int(am.group(1), 16)
        if addr in HW: note = HW[addr]
        elif addr in KERNAL and kernal_ok: note = KERNAL[addr]
    elif zm and not operand.startswith("#"):
        addr = int(zm.group(1), 16)
        if addr in ZP: note = ZP[addr]
    if note:
        return "%s   %s" % (line.rstrip(), note)
    return line

def main(path, bankno):
    lines = open(path).read().split("\n")
    out = []
    prev_data = True  # suppress anchor for the very first line of file
    existing = set(l.split(":")[0] for l in lines if re.match(r"^bank\d\d_", l))
    for i, l in enumerate(lines):
        m = DATA.match(l)
        if m:
            addr = m.group(1)
            name = "bank%02d_data_%s" % (bankno, addr)
            if not prev_data and name not in existing:
                out.append(name + ":")
                out.append('.errorif (* != $%s), "%s shifted"' % (addr, name))
            prev_data = True
        else:
            if l.strip() and not l.startswith("//"):
                prev_data = False
            out.append(annotate_line(l, bankno <= 3))
            continue
        out.append(l)
    open(path, "w").write("\n".join(out))

if __name__ == "__main__":
    path = sys.argv[1]
    bankno = int(re.search(r"bank0(\d)", path).group(1))
    main(path, bankno)
