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
