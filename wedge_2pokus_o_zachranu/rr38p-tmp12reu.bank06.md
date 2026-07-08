# Retro Replay Bank 06

## Address Mapping

- File offset: `0xC000-0xDFFF`
- C64 cartridge window when bank selected: `$8000-$9FFF`
- Cold start vector at `$8000`: `$8009`
- Warm start vector at `$8002`: `$800C`
- CBM signature bytes at `$8004-$8008`: `c3 c2 cd 38 30`

## Disassembly Coverage

- Reachable instruction starts: `69`
- Reachable code bytes: `113` of `8192`
- Jump-table entries from cold start: `2`
- Internal entry points used: `$8009, $800C, $800F`
- External targets referenced: `$DEDE, $F6BC, $F6ED, $FCEF, $FE72`

## Likely Contents

- `+0x09A8` (`$89A8`): "TURBO MACRO PRO+REU V1.2          (   K"
- `+0x0B32` (`$8B32`): "DATA FROM $0000 TO $000"
- `+0x0B63` (`$8B63`): "LOAD TO: $0000   $000"
- `+0x0963` (`$8963`): "ILLEGAL ADDRESS MOD"
- `+0x09FE` (`$89FE`): "SET MARK (0-9,S,E)"
- `+0x0AE4` (`$8AE4`): "LABELNAME OVERFLOW"
- `+0x0AF7` (`$8AF7`): "DEVICE NOT PRESEN"
- `+0x0B51` (`$8B51`): "RAM (L/D/B/O/S/J)"
- `+0x0B93` (`$8B93`): "SOURCE BANK(2.. )"
- `+0x0BA5` (`$8BA5`): "CANNOT CHANGE BAN"
- `+0x0BB7` (`$8BB7`): "OBJECT BANK(1.. )"
- `+0x08FC` (`$88FC`): "ILLEGAL PSEUDO-O"

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8009` | `bank06_cold_start` | cold vector |
| `$800C` | `bank06_warm_start` | warm vector |
| `$800F` | `bank06_api_01` | jump table #01 |
| `$801A` | `bank06_sub_801A` | reachable label |
| `$9F01` | `bank06_sub_9F01` | reachable label |
| `$9F2B` | `bank06_sub_9F2B` | reachable label |
| `$FCEF` | `bank06_api_00` | jump table #00 |

## Files

- Disassembly: `rr38p-tmp12reu.bank06.asm`
- Source image: `rr38p-tmp12reu.bin`
