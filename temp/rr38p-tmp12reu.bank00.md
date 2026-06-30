# Retro Replay Bank 00

## Address Mapping

- File offset: `0x0000-0x1FFF`
- C64 cartridge window when bank selected: `$8000-$9FFF`
- Cold start vector at `$8000`: `$8009`
- Warm start vector at `$8002`: `$800C`
- CBM signature bytes at `$8004-$8008`: `c3 c2 cd 38 30`

## Disassembly Coverage

- Reachable instruction starts: `945`
- Reachable code bytes: `2023` of `8192`
- Jump-table entries from cold start: `14`
- Internal entry points used: `$8009, $800C, $806E, $817F, $8187, $818A, $8760, $8AA5, $8AEB, $8B2A, $8B54, $8FBE, $9C5F, $9DB3`
- External targets referenced: `$0060, $0100, $0400, $0500, $454D, $4552, $455A, $4620, $DE3F, $DE41, $DE8D, $DE9D, $DEBA, $DEDE, $E3BF, $E453, $E716, $FDD0, $FF5B, $FFE4, $FFF0`

## Likely Contents

- `+0x096E` (`$896E`): "LOSE A LIFE AND REFREEZE"
- `+0x07BB` (`$87BB`): "CYBERPUNX RETRO REPLAY"
- `+0x0080` (`$8080`): "RR38P-COUNT ZERO/CPX-"
- `+0x08C5` (`$88C5`): "HOW MANY LIVES NOW ?"
- `+0x1352` (`$9352`): "MULTICOLOR SCREEN"
- `+0x1302` (`$9302`): "CURRENT SCREEN:"
- `+0x18E8` (`$98E8`): "RETURN*CONTINUE"
- `+0x0987` (`$8987`): "<R/S> TO ABORT"
- `+0x11A4` (`$91A4`): "TURBOLINKER OK"
- `+0x1324` (`$9324`): "MULTICOLOR PIC"
- `+0x07D4` (`$87D4`): "BY COUNT ZERO"
- `+0x136B` (`$936B`): "NORMAL SCREEN"

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8009` | `bank00_cold_start` | cold vector |
| `$800C` | `bank00_warm_start` | warm vector |
| `$800F` | `bank00_sub_800F` | reachable label |
| `$8012` | `bank00_sub_8012` | reachable label |
| `$8015` | `bank00_sub_8015` | reachable label |
| `$8033` | `bank00_sub_8033` | reachable label |
| `$8042` | `bank00_sub_8042` | reachable label |
| `$804E` | `bank00_sub_804E` | reachable label |
| `$8060` | `bank00_sub_8060` | reachable label |
| `$806E` | `bank00_api_11` | jump table #11 |
| `$817F` | `bank00_api_00` | jump table #00 |
| `$8187` | `bank00_api_01` | jump table #01 |
| `$818A` | `bank00_api_02` | jump table #02 |
| `$81E9` | `bank00_sub_81E9` | reachable label |
| `$81EC` | `bank00_sub_81EC` | reachable label |
| `$8214` | `bank00_sub_8214` | reachable label |
| `$821A` | `bank00_sub_821A` | reachable label |
| `$8250` | `bank00_sub_8250` | reachable label |
| `$8289` | `bank00_sub_8289` | reachable label |
| `$8293` | `bank00_sub_8293` | reachable label |
| `$8298` | `bank00_sub_8298` | reachable label |
| `$829B` | `bank00_sub_829B` | reachable label |
| `$82C1` | `bank00_sub_82C1` | reachable label |
| `$82CB` | `bank00_sub_82CB` | reachable label |
| `$82CF` | `bank00_sub_82CF` | reachable label |
| `$82DA` | `bank00_sub_82DA` | reachable label |
| `$84EC` | `bank00_sub_84EC` | reachable label |
| `$84ED` | `bank00_sub_84ED` | reachable label |
| `$84FE` | `bank00_sub_84FE` | reachable label |
| `$851E` | `bank00_sub_851E` | reachable label |
| `$852D` | `bank00_sub_852D` | reachable label |
| `$8541` | `bank00_sub_8541` | reachable label |
| `$854B` | `bank00_sub_854B` | reachable label |
| `$857B` | `bank00_sub_857B` | reachable label |
| `$85EB` | `bank00_sub_85EB` | reachable label |
| `$85F5` | `bank00_sub_85F5` | reachable label |
| `$85FA` | `bank00_sub_85FA` | reachable label |
| `$8625` | `bank00_sub_8625` | reachable label |
| `$8632` | `bank00_sub_8632` | reachable label |
| `$864D` | `bank00_sub_864D` | reachable label |
| `$866B` | `bank00_sub_866B` | reachable label |
| `$8671` | `bank00_sub_8671` | reachable label |
| `$868E` | `bank00_sub_868E` | reachable label |
| `$8691` | `bank00_sub_8691` | reachable label |
| `$869F` | `bank00_sub_869F` | reachable label |
| `$86A0` | `bank00_sub_86A0` | reachable label |
| `$86A3` | `bank00_sub_86A3` | reachable label |
| `$86C8` | `bank00_sub_86C8` | reachable label |
| `$8722` | `bank00_sub_8722` | reachable label |
| `$8724` | `bank00_sub_8724` | reachable label |
| `$8760` | `bank00_api_09` | jump table #09 |
| `$8763` | `bank00_sub_8763` | reachable label |
| `$8773` | `bank00_sub_8773` | reachable label |
| `$8780` | `bank00_sub_8780` | reachable label |
| `$8788` | `bank00_sub_8788` | reachable label |
| `$8796` | `bank00_sub_8796` | reachable label |
| `$879B` | `bank00_sub_879B` | reachable label |
| `$87AD` | `bank00_sub_87AD` | reachable label |
| `$87B2` | `bank00_sub_87B2` | reachable label |
| `$87E6` | `bank00_sub_87E6` | reachable label |
| `$87EA` | `bank00_sub_87EA` | reachable label |
| `$87F5` | `bank00_sub_87F5` | reachable label |
| `$87F9` | `bank00_sub_87F9` | reachable label |
| `$8811` | `bank00_sub_8811` | reachable label |
| `$8816` | `bank00_sub_8816` | reachable label |
| `$881B` | `bank00_sub_881B` | reachable label |
| `$8820` | `bank00_sub_8820` | reachable label |
| `$8AA5` | `bank00_api_13` | jump table #13 |
| `$8AAA` | `bank00_sub_8AAA` | reachable label |
| `$8AB6` | `bank00_sub_8AB6` | reachable label |
| `$8AB9` | `bank00_sub_8AB9` | reachable label |
| `$8ADF` | `bank00_sub_8ADF` | reachable label |
| `$8AE9` | `bank00_sub_8AE9` | reachable label |
| `$8AEB` | `bank00_api_10` | jump table #10 |
| `$8AF1` | `bank00_sub_8AF1` | reachable label |
| `$8AF5` | `bank00_sub_8AF5` | reachable label |
| `$8B08` | `bank00_sub_8B08` | reachable label |
| `$8B2A` | `bank00_api_07` | jump table #07 |
| `$8B33` | `bank00_sub_8B33` | reachable label |
| `$8B3D` | `bank00_sub_8B3D` | reachable label |
| `$8B3F` | `bank00_sub_8B3F` | reachable label |
| `$8B4C` | `bank00_sub_8B4C` | reachable label |
| `$8B54` | `bank00_api_12` | jump table #12 |
| `$8B9D` | `bank00_sub_8B9D` | reachable label |
| `$8FBE` | `bank00_api_05` | jump table #05 |
| `$8FDC` | `bank00_sub_8FDC` | reachable label |
| `$8FE8` | `bank00_sub_8FE8` | reachable label |
| `$8FF5` | `bank00_sub_8FF5` | reachable label |
| `$9007` | `bank00_sub_9007` | reachable label |
| `$9018` | `bank00_sub_9018` | reachable label |
| `$901E` | `bank00_sub_901E` | reachable label |
| `$9037` | `bank00_sub_9037` | reachable label |
| `$9045` | `bank00_sub_9045` | reachable label |
| `$907C` | `bank00_sub_907C` | reachable label |
| `$9095` | `bank00_sub_9095` | reachable label |
| `$90A7` | `bank00_sub_90A7` | reachable label |
| `$90B2` | `bank00_sub_90B2` | reachable label |
| `$90C4` | `bank00_sub_90C4` | reachable label |
| `$90D6` | `bank00_sub_90D6` | reachable label |
| `$90F3` | `bank00_sub_90F3` | reachable label |
| `$90F9` | `bank00_sub_90F9` | reachable label |
| `$9107` | `bank00_sub_9107` | reachable label |
| `$911C` | `bank00_sub_911C` | reachable label |
| `$9155` | `bank00_sub_9155` | reachable label |
| `$9159` | `bank00_sub_9159` | reachable label |
| `$927A` | `bank00_sub_927A` | reachable label |
| `$928B` | `bank00_sub_928B` | reachable label |
| `$9295` | `bank00_sub_9295` | reachable label |
| `$9298` | `bank00_sub_9298` | reachable label |
| `$9898` | `bank00_sub_9898` | reachable label |
| `$9941` | `bank00_sub_9941` | reachable label |
| `$995B` | `bank00_sub_995B` | reachable label |
| `$995F` | `bank00_sub_995F` | reachable label |
| `$9974` | `bank00_sub_9974` | reachable label |
| `$9976` | `bank00_sub_9976` | reachable label |
| `$99ED` | `bank00_sub_99ED` | reachable label |
| `$9A05` | `bank00_sub_9A05` | reachable label |
| `$9A0F` | `bank00_sub_9A0F` | reachable label |
| `$9A15` | `bank00_sub_9A15` | reachable label |
| `$9A19` | `bank00_sub_9A19` | reachable label |
| `$9A1E` | `bank00_sub_9A1E` | reachable label |
| `$9C5F` | `bank00_api_06` | jump table #06 |
| `$9D91` | `bank00_sub_9D91` | reachable label |
| `$9D93` | `bank00_sub_9D93` | reachable label |
| `$9DB3` | `bank00_api_08` | jump table #08 |
| `$9DBC` | `bank00_sub_9DBC` | reachable label |
| `$9DCD` | `bank00_sub_9DCD` | reachable label |
| `$9EA9` | `bank00_sub_9EA9` | reachable label |
| `$9F01` | `bank00_sub_9F01` | reachable label |
| `$9F03` | `bank00_sub_9F03` | reachable label |
| `$9F26` | `bank00_sub_9F26` | reachable label |
| `$DE3F` | `bank00_api_03` | jump table #03 |
| `$DE41` | `bank00_api_04` | jump table #04 |

## Files

- Disassembly: `rr38p-tmp12reu.bank00.asm`
- Source image: `rr38p-tmp12reu.bin`
