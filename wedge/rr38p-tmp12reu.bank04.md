# Retro Replay Bank 04

## Address Mapping

- File offset: `0x8000-0x9FFF`
- C64 cartridge window when bank selected: `$8000-$9FFF`
- Cold start vector at `$8000`: `$8009`
- Warm start vector at `$8002`: `$800C`
- CBM signature bytes at `$8004-$8008`: `c3 c2 cd 38 30`

## Disassembly Coverage

- Reachable instruction starts: `84`
- Reachable code bytes: `146` of `8192`
- Jump-table entries from cold start: `4`
- Internal entry points used: `$8009, $800C, $8015, $8028, $80A3`
- External targets referenced: `$DEDE, $F6BC, $F6ED, $FCEF, $FE72`

## Likely Contents

- `+0x087A` (`$887A`): ":aj/P1W_k"
- `+0x0A0F` (`$8A0F`): "'S@b.I.G"
- `+0x101A` (`$901A`): "ANK=2:/%"
- `+0x03D6` (`$83D6`): "tWLe7o9"
- `+0x0967` (`$8967`): "HtTP:./"
- `+0x0D9A` (`$8D9A`): "WKuFl8H"
- `+0x11CA` (`$91CA`): "bN-{/6("

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8009` | `bank04_cold_start` | cold vector |
| `$800C` | `bank04_warm_start` | warm vector |
| `$8015` | `bank04_api_01` | jump table #01 |
| `$8020` | `bank04_sub_8020` | reachable label |
| `$8028` | `bank04_api_02` | jump table #02 |
| `$802F` | `bank04_sub_802F` | reachable label |
| `$80A3` | `bank04_api_03` | jump table #03 |
| `$80AA` | `bank04_sub_80AA` | reachable label |
| `$9F01` | `bank04_sub_9F01` | reachable label |
| `$9F2B` | `bank04_sub_9F2B` | reachable label |
| `$FCEF` | `bank04_api_00` | jump table #00 |

## Files

- Disassembly: `rr38p-tmp12reu.bank04.asm`
- Source image: `rr38p-tmp12reu.bin`
