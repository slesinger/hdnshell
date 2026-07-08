# Retro Replay Image Analysis: rr38p-tmp12reu.bin

## Input

- File: `temp/rr38p-tmp12reu.bin`
- Size: `65536 bytes`
- Layout: `8 banks x 8192 bytes` (raw, non-CRT)

## Symbolization

| Bank | Symbols | ASM | Report |
|---:|---:|---|---|
| 00 | 133 | `rr38p-tmp12reu.bank00.asm` | `rr38p-tmp12reu.bank00.md` |
| 01 | 276 | `rr38p-tmp12reu.bank01.asm` | `rr38p-tmp12reu.bank01.md` |
| 02 | 4 | `rr38p-tmp12reu.bank02.asm` | `rr38p-tmp12reu.bank02.md` |
| 03 | 182 | `rr38p-tmp12reu.bank03.asm` | `rr38p-tmp12reu.bank03.md` |
| 04 | 11 | `rr38p-tmp12reu.bank04.asm` | `rr38p-tmp12reu.bank04.md` |
| 05 | 7 | `rr38p-tmp12reu.bank05.asm` | `rr38p-tmp12reu.bank05.md` |
| 06 | 7 | `rr38p-tmp12reu.bank06.asm` | `rr38p-tmp12reu.bank06.md` |
| 07 | 7 | `rr38p-tmp12reu.bank07.asm` | `rr38p-tmp12reu.bank07.md` |

Naming scheme used:
- `bankNN_cold_start` and `bankNN_warm_start` from vectors at `$8000` and `$8002`
- `bankNN_api_XX` from jump-table targets near cold-start
- `bankNN_sub_XXXX` for other reachable labeled routines

## Bank Table

| Bank | File Offset | CPU Window | Cold | Warm | Reachable Instructions | Reachable Code Bytes | Jump Table Entries |
|---:|---:|---:|---:|---:|---:|---:|---:|
| 00 | 0x0000-0x1FFF | $8000-$9FFF | $8009 | $800C | 945 | 2023 | 14 |
| 01 | 0x2000-0x3FFF | $8000-$9FFF | $8009 | $800C | 1597 | 3305 | 12 |
| 02 | 0x4000-0x5FFF | $8000-$9FFF | $8036 | $8039 | 14 | 33 | 1 |
| 03 | 0x6000-0x7FFF | $8000-$9FFF | $8009 | $800C | 1396 | 2719 | 33 |
| 04 | 0x8000-0x9FFF | $8000-$9FFF | $8009 | $800C | 84 | 146 | 4 |
| 05 | 0xA000-0xBFFF | $8000-$9FFF | $8009 | $800C | 69 | 113 | 2 |
| 06 | 0xC000-0xDFFF | $8000-$9FFF | $8009 | $800C | 69 | 113 | 2 |
| 07 | 0xE000-0xFFFF | $8000-$9FFF | $8009 | $800C | 69 | 113 | 2 |

## Bank Highlights

### Bank 00

- Files: `rr38p-tmp12reu.bank00.asm`, `rr38p-tmp12reu.bank00.md`
- Internal entry points: `$8009, $800C, $806E, $817F, $8187, $818A, $8760, $8AA5, $8AEB, $8B2A, $8B54, $8FBE, $9C5F, $9DB3`
- External references: `$0060, $0100, $0400, $0500, $454D, $4552, $455A, $4620, $DE3F, $DE41, $DE8D, $DE9D, $DEBA, $DEDE, $E3BF, $E453, $E716, $FDD0, $FF5B, $FFE4, $FFF0`
- `+0x096E`: "LOSE A LIFE AND REFREEZE"
- `+0x07BB`: "CYBERPUNX RETRO REPLAY"
- `+0x0080`: "RR38P-COUNT ZERO/CPX-"
- `+0x08C5`: "HOW MANY LIVES NOW ?"

### Bank 01

- Files: `rr38p-tmp12reu.bank01.asm`, `rr38p-tmp12reu.bank01.md`
- Internal entry points: `$8009, $800C, $8021, $805B, $80B9, $82B3, $82D2, $831D, $8341, $83D0, $899A, $9964, $9966, $9BE3`
- External references: `$0073, $0079, $0100, $0210, $2033, $6800, $A571, $A66F, $A96B, $AACA, $AD8A, $B1B8, $B79E, $BC49, $BDCD, $BDDD, $DE26, $DE97, $DE9D, $DEA9, $DED3, $DEDE, $DEE7, $E0F9`
- `+0x19A4`: ""H'XMRLFCHTWGD:;PSVNA>I,B*$@-JU"
- `+0x0B26`: "hHJJJJ 2"
- `+0x0517`: "LINESAV"
- `+0x063A`: "MERGING"

### Bank 02

- Files: `rr38p-tmp12reu.bank02.asm`, `rr38p-tmp12reu.bank02.md`
- Internal entry points: `$8036, $8039`
- External references: `$DEE4, $E518, $F6BC, $F6ED, $FCEF, $FDA3, $FE72`
- `+0x0B01`: "FULL: <A> TRY AGAIN  <B> QUIT"
- `+0x021F`: "DEVICE NOT PRESENT"
- `+0x188A`: "FUNPAINT (MT)"

### Bank 03

- Files: `rr38p-tmp12reu.bank03.asm`, `rr38p-tmp12reu.bank03.md`
- Internal entry points: `$8009, $800C, $8042, $8265, $82AF, $82B5, $842F, $8435, $845D, $857F, $8644, $864C, $8944, $8E7F, $8EB3, $8EE2, $8FDC, $905F, $90C8, $90F6, $9102, $9159, $9219, $9418, $942F, $9451, $9473, $94C5, $94EB, $9502, $9658, $971C, $9F58, $9F8E, $9FC8`
- External references: `$002D, $0073, $0079, $0210, $202D, $2041, $2045, $2059, $2D20, $2D42, $2E2E, $3146, $3436, $3531, $4153, $4353, $4424, $4552, $4620, $4843, $494C, $4957, $4E49, $4F4D`
- `+0x00A6`: "STARTED DEBUGSTUB ON SS - KICK IN YER PC"
- `+0x1FCC`: "CYBERPUNX RETRO REPLAY 64KB - 3.8P"
- `+0x165B`: "F1*BACKUP  F3*RESTART  F7*SCREEN"
- `+0x0245`: "ADDR AR XR YR SP 01 NV-BDIZC"

### Bank 04

- Files: `rr38p-tmp12reu.bank04.asm`, `rr38p-tmp12reu.bank04.md`
- Internal entry points: `$8009, $800C, $8015, $8028, $80A3`
- External references: `$DEDE, $F6BC, $F6ED, $FCEF, $FE72`
- `+0x087A`: ":aj/P1W_k"
- `+0x0A0F`: "'S@b.I.G"
- `+0x101A`: "ANK=2:/%"
- `+0x03D6`: "tWLe7o9"

### Bank 05

- Files: `rr38p-tmp12reu.bank05.asm`, `rr38p-tmp12reu.bank05.md`
- Internal entry points: `$8009, $800C, $800F`
- External references: `$DEDE, $F6BC, $F6ED, $FCEF, $FE72`
- `+0x04E5`: "'X:   L:     B:$     IN:C/L #:   BANK: /"
- `+0x050E`: "LBL:    /$    -$FD30     SRC:$0800-$"
- `+0x12B0`: "FLASH UTIL V3.8PFLASH UTIL V3.8P"
- `+0x0650`: "CEW345MGFHKBSL*@NQ"

### Bank 06

- Files: `rr38p-tmp12reu.bank06.asm`, `rr38p-tmp12reu.bank06.md`
- Internal entry points: `$8009, $800C, $800F`
- External references: `$DEDE, $F6BC, $F6ED, $FCEF, $FE72`
- `+0x09A8`: "TURBO MACRO PRO+REU V1.2          (   K"
- `+0x0B32`: "DATA FROM $0000 TO $000"
- `+0x0B63`: "LOAD TO: $0000   $000"
- `+0x0963`: "ILLEGAL ADDRESS MOD"

### Bank 07

- Files: `rr38p-tmp12reu.bank07.asm`, `rr38p-tmp12reu.bank07.md`
- Internal entry points: `$8009, $800C, $800F`
- External references: `$DEDE, $F6BC, $F6ED, $FCEF, $FE72`
- `+0x0A43`: "'BCCBCSBEQBMIBNEBPLBVCBVSBRKCLCCLDCLICLVDEXDEYINXINYNOPPHAPHPPLAPLPRTIRTSTAXTAYTSXTXATXSTYASECSEDALRANCARRAXSLASSHXSHYTASXAABRASACSIRCLNRTDEORSTASBCROLORALSRLDYLDXLDACMPASLANDADCJMPSTYSTXRORINCDECCPXCPYBITJSRSEIDCPISCLAXRLARRASAXSLOSREAHX"
- `+0x1CDE`: "ILLEGAL DURING INCLUD"
- `+0x1D11`: "ILLEGAL PARAMETER CAL"
- `+0x1D64`: "ILLEGAL WHILE CALLIN"

---

# Deep-disassembly pass (2026-07-08, KickAssembler conversion)

## Build system — point-of-truth verification

`./build.sh` assembles all 8 `rr38p-tmp12reu.bankNN.asm` files with
KickAssembler (`$KICKASS`, default `/home/honza/projects/c64/pc-tools/kickass/KickAss.jar`),
concatenates the 8x8192-byte `-binfile` outputs and byte-compares against
`rr38p-tmp12reu.bin`. **Any change must keep this green.** Current state:
`OK: built image is byte-identical to rr38p-tmp12reu.bin`.

Two safety nets against accidental byte insertion/removal:

1. `.errorif (* != $XXXX), "... shifted"` guards at every data-block anchor
   (`bankNN_data_XXXX` labels) — an inserted byte fails the assembly with a
   named location instead of silently shifting the bank.
2. The final `cmp` against the original binary in build.sh.

### KickAssembler conversion gotchas (cost a byte each until fixed)

- Mnemonics must be lowercase (`JMP` parses as a pseudocommand).
- Accumulator mode is written without operand (`lsr`, not `LSR A`).
- KickAss silently shrinks absolute operands < $0100 to zero-page,
  changing 3-byte encodings to 2. Use the `.abs` mnemonic suffix
  (`ora.abs $000d`) wherever the original encoding is absolute. The
  disassembler tooling emits this automatically.

## Tooling (`tools/`)

- `dis.py <bank> <start> <end> [base] [inline_print_csv] [inline_word_csv]`
  — disassembles a range of the truth binary into the file's KickAss style.
  Knows about print-inline-string routines (consumes text after the `jsr`
  up to `$00`), cross-bank stubs (consumes the 2-byte inline target), text
  runs and zero padding.
- `splice.py` — replaces `.byte` data lines covering a range with a fresh
  disassembly of the same bytes.
- `todata.py` — the inverse: reverts a mis-decoded range back to 16-wide
  `.byte` lines with ASCII previews.
- `fix_inline.py` — sweeps existing instruction lines for
  `jsr <print-stub>` / `jsr <cross-bank-stub>` sites whose inline argument
  was mis-decoded as instructions, and re-groups them.
- `enrich.py` — inserts the `.errorif` shift guards and appends comments
  for known hardware/KERNAL addresses ($DExx RR registers, $DFxx REU,
  VIC/CIA/SID, KERNAL API, RAM vectors, common zero-page).

## The cross-bank call mechanism (used everywhere)

The RR hardware mirrors each bank's `$9E00-$9EFF` page into I/O2 space at
`$DE00-$DEFF`, and **every bank carries byte-identical trampoline code at
the shared offsets** ($9EBA-$9F00). Because a write to `$DE00` instantly
repages the `$8000-$9FFF` window the code executes from, all bank switching
funnels through this mirrored page:

- `$DEDE`: `sta $de00 / pla / rti` — the call gate. RTI jumps to the target
  address that the caller's stub pushed (RTI uses the address exactly, no
  +1 like RTS).
- `$DEE3`: `sta $9e / pla / sta $de00 / lda $9e / rts` — restore the
  caller's bank and return.
- `$DED0` / `$DEDA`: `jmp ($fffc)` / `jmp ($fff8)` — reset / ultimax-NMI.
- `$DEED`: bank-select value table (`$00,$08,$10,$18,$20` = banks 0-4;
  bank bits of $DE00 are 3, 4 and 7).

Each bank has a *cross-bank call stub* with a NOP sled so that several
`jsr` entry addresses share one body; the entry offset picks the
destination bank from the `$DEED` table:

| Bank | Stub | Notes |
|---|---|---|
| 00 | `$9F01/$9F03/$9F05` | |
| 01 | `$9F4E/$9F50/$9F51..$9F55` | `$9F51`..`$9F55` select banks 3..7 |
| 02 | `$9F00/$9F02/$9F04` | |
| 03 | `$9F00..$9F09` (sled) body `$9F0A` | |
| 04-07 | `$9F01...` | same body, only used during install |

Calling convention: `jsr <stub>` followed by a **2-byte inline argument** =
target address in the destination bank. The stub pulls the return address,
re-pushes it +2 (skipping the word), pushes a return path through `$DEE3`,
pushes the inline target, and jumps through the `$DEDE` gate. In the
sources these sites now read:

```
    jsr bank01_sub_9F51            // 20 51 9F
    .byte $48, $80                 // inline arg: cross-bank call target $8048
```

## Print-inline-string routines

Each core bank has a "print the text that follows the jsr" routine
(pulls return address, prints PETSCII until `$00`, resumes after it):
bank00 `$8763`, bank01 `$9985`, bank03 `$8362` (+variant `$835F`).
All such strings are now `.byte` lines with `text:` previews.

## Per-bank functional map

| Bank | Role |
|---|---|
| 00 | Freeze-mode core: freezer UI ("CYBERPUNX RETRO REPLAY" menu), key dispatch table at `$8835` (F1/F3/F7 + MEDTPVSKLXCZ -> handlers), sprite/screen viewer & editor, screen-save descriptors at `$96C2` (".SCR7/.COL4/.BMP4/.CHR4/.FLI4"), TURBOLINKER, poke-finder |
| 01 | BASIC-mode core: BASIC extension (keyword table `$850E`: OLD..TOOL, handlers at `$8573`), fastload (ILOAD/ISAVE wedges), F-key macro table `$88A8`, machine-code monitor (command table `$99A4`, packed mnemonic tables `$93DD`), TASS/TMP launcher `$9D1D` (REU DMA $0800-$FFFF then jmp $8000) |
| 02 | Freezer tools bank: backup/save engine, picture format export ("FUNPAINT (MT)" etc. at `$9850`-`$98A7`), drive/tape I/O helpers, own stub at `$9F00` |
| 03 | Second freezer bank: debugger/monitor from freeze ("STARTED DEBUGSTUB ON SS", register display "ADDR AR XR YR SP 01 NV-BDIZC"), freeze main menu text "F1*BACKUP F3*RESTART F7*SCREEN" at `$965B`, disk copy / file copy dialogs (`$85F8`, `$8DB5`), version banner "CYBERPUNX RETRO REPLAY 64KB - 3.8P" printed by `bank03_api_21` (`$9FC8`-area) |
| 04 | TMP installer: `$8039/$80B4` relocatable installer (runs at `$0400`), boot screen at `$8121`, payload beyond |
| 05 | TMP image part 1 (`$8100-$85FF` -> RAM `$9000-$94FF`) + FLASH UTIL V3.8P module |
| 06 | TMP image part 2 (`$8100-$9DFF` -> RAM `$9500-$B1FF`), editor |
| 07 | TMP image part 3 (`$8100-$9DFF` -> RAM `$B200-$CEFF`), assembler (mnemonic table at `$8A43`) |

TMP install sequence (bank04, run from `$0400`): select bank 5 (`$DE00=$88`),
copy window `$8100+` into RAM at `$9000`, then bank 6 (`$90`) and bank 7
(`$98`) chunks, cart off (`$DE00=$0A`), `jmp $9000`.

Banks 4-7 cold-start vectors (`jmp $FCEF`) are boilerplate — reset always
enters bank 0; these banks are only ever read through the window.

## Decode coverage after this pass

| Bank | Instructions decoded | Remaining .byte lines | Illegal-fallback bytes |
|---:|---:|---:|---:|
| 00 | 3234 | 134 | 9 |
| 01 | 3369 | 112 | 3 |
| 02 | 3115 | 140 | 7 |
| 03 | 2328 | 270 | 9 |
| 04-07 | 103-133 each | ~500 each (payload, documented) | 0 |

Remaining `.byte` blocks in banks 0-3 are identified data (menu text,
dispatch/pointer tables, GCR/mnemonic tables, zero padding), each with an
explanatory comment. The handful of remaining single illegal bytes sit in
odd corners (skip-byte tricks, table tails) and are byte-exact either way.
