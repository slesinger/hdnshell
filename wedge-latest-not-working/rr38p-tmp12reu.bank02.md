# Retro Replay Bank 02

## Address Mapping

- File offset: `0x4000-0x5FFF`
- C64 cartridge window when bank selected: `$8000-$9FFF`
- Cold start vector at `$8000`: `$8036`
- Warm start vector at `$8002`: `$8039`
- CBM signature bytes at `$8004-$8008`: `c3 c2 cd 38 30`

## Disassembly Coverage

- Reachable instruction starts: `14`
- Reachable code bytes: `33` of `8192`
- Jump-table entries from cold start: `1`
- Internal entry points used: `$8036, $8039`
- External targets referenced: `$DEE4, $E518, $F6BC, $F6ED, $FCEF, $FDA3, $FE72`

## Likely Contents

- `+0x0B01` (`$8B01`): "FULL: <A> TRY AGAIN  <B> QUIT"
- `+0x021F` (`$821F`): "DEVICE NOT PRESENT"
- `+0x188A` (`$988A`): "FUNPAINT (MT)"

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8036` | `bank02_cold_start` | cold vector |
| `$8039` | `bank02_warm_start` | warm vector |
| `$8044` | `bank02_sub_8044` | reachable label |
| `$FCEF` | `bank02_api_00` | jump table #00 |

## Files

- Disassembly: `rr38p-tmp12reu.bank02.asm`
- Source image: `rr38p-tmp12reu.bin`
