# Retro Replay Bank 05

## Address Mapping

- File offset: `0xA000-0xBFFF`
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

- `+0x04E5` (`$84E5`): "'X:   L:     B:$     IN:C/L #:   BANK: /"
- `+0x050E` (`$850E`): "LBL:    /$    -$FD30     SRC:$0800-$"
- `+0x12B0` (`$92B0`): "FLASH UTIL V3.8PFLASH UTIL V3.8P"
- `+0x0650` (`$8650`): "CEW345MGFHKBSL*@NQ"
- `+0x0108` (`$8108`): "TMP 1.2   REU L/"
- `+0x0EA0` (`$8EA0`): "UNT Z_ERO/CPX-"
- `+0x0675` (`$8675`): "I2+-6D!"
- `+0x0E2D` (`$8E2D`): "2Uv=PTI"
- `+0x0E5B` (`$8E5B`): "RKI]Y(l"
- `+0x015D` (`$815D`): "TURBO0"

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8009` | `bank05_cold_start` | cold vector |
| `$800C` | `bank05_warm_start` | warm vector |
| `$800F` | `bank05_api_01` | jump table #01 |
| `$801A` | `bank05_sub_801A` | reachable label |
| `$9F01` | `bank05_sub_9F01` | reachable label |
| `$9F2B` | `bank05_sub_9F2B` | reachable label |
| `$FCEF` | `bank05_api_00` | jump table #00 |

## Files

- Disassembly: `rr38p-tmp12reu.bank05.asm`
- Source image: `rr38p-tmp12reu.bin`
