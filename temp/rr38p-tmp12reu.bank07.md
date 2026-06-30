# Retro Replay Bank 07

## Address Mapping

- File offset: `0xE000-0xFFFF`
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

- `+0x0A43` (`$8A43`): "'BCCBCSBEQBMIBNEBPLBVCBVSBRKCLCCLDCLICLVDEXDEYINXINYNOPPHAPHPPLAPLPRTIRTSTAXTAYTSXTXATXSTYASECSEDALRANCARRAXSLASSHXSHYTASXAABRASACSIRCLNRTDEORSTASBCROLORALSRLDYLDXLDACMPASLANDADCJMPSTYSTXRORINCDECCPXCPYBITJSRSEIDCPISCLAXRLARRASAXSLOSREAHX"
- `+0x1CDE` (`$9CDE`): "ILLEGAL DURING INCLUD"
- `+0x1D11` (`$9D11`): "ILLEGAL PARAMETER CAL"
- `+0x1D64` (`$9D64`): "ILLEGAL WHILE CALLIN"
- `+0x1C8E` (`$9C8E`): "UNDEFINED STATEMEN"
- `+0x1CB1` (`$9CB1`): "BRANCH OUT OF RANG"
- `+0x1CCC` (`$9CCC`): "DEVICE NOT PRESEN"
- `+0x1D27` (`$9D27`): "ENDM WITHOUT MACR"
- `+0x1D48` (`$9D48`): "BEND WITHOUT BLOC"
- `+0x1D9A` (`$9D9A`): "CONDITION UNSOLVE"
- `+0x1CA1` (`$9CA1`): "ILLEGAL QUANTIT"
- `+0x1D01` (`$9D01`): "MACRO STACK FUL"

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8009` | `bank07_cold_start` | cold vector |
| `$800C` | `bank07_warm_start` | warm vector |
| `$800F` | `bank07_api_01` | jump table #01 |
| `$801A` | `bank07_sub_801A` | reachable label |
| `$9F01` | `bank07_sub_9F01` | reachable label |
| `$9F2B` | `bank07_sub_9F2B` | reachable label |
| `$FCEF` | `bank07_api_00` | jump table #00 |

## Files

- Disassembly: `rr38p-tmp12reu.bank07.asm`
- Source image: `rr38p-tmp12reu.bin`
