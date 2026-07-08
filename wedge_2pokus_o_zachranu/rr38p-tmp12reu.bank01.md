# Retro Replay Bank 01

## Address Mapping

- File offset: `0x2000-0x3FFF`
- C64 cartridge window when bank selected: `$8000-$9FFF`
- Cold start vector at `$8000`: `$8009`
- Warm start vector at `$8002`: `$800C`
- CBM signature bytes at `$8004-$8008`: `c3 c2 cd 38 30`

## Disassembly Coverage

- Reachable instruction starts: `1597`
- Reachable code bytes: `3305` of `8192`
- Jump-table entries from cold start: `12`
- Internal entry points used: `$8009, $800C, $8021, $805B, $80B9, $82B3, $82D2, $831D, $8341, $83D0, $899A, $9964, $9966, $9BE3`
- External targets referenced: `$0073, $0079, $0100, $0210, $2033, $6800, $A571, $A66F, $A96B, $AACA, $AD8A, $B1B8, $B79E, $BC49, $BDCD, $BDDD, $DE26, $DE97, $DE9D, $DEA9, $DED3, $DEDE, $DEE7, $E0F9, $E3BF, $E422, $E453, $E5B4, $E602, $E63A, $E716, $EA13, $EA24, $F250, $F30F, $F31F, $F6BC, $F6ED, $F707, $F713, $F9A0, $FDA3, $FE72, $FF5B, $FF93, $FF96, $FFA5, $FFA8, $FFAB, $FFAE, $FFB1, $FFB4, $FFBA, $FFBD, $FFC0, $FFC3, $FFC6, $FFCC, $FFCF, $FFD2, $FFE7, $FFF0`

## Likely Contents

- `+0x19A4` (`$99A4`): ""H'XMRLFCHTWGD:;PSVNA>I,B*$@-JU"
- `+0x0B26` (`$8B26`): "hHJJJJ 2"
- `+0x0517` (`$8517`): "LINESAV"
- `+0x063A` (`$863A`): "MERGING"
- `+0x14AF` (`$94AF`): ",),#($Y"

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8009` | `bank01_cold_start` | cold vector |
| `$800C` | `bank01_warm_start` | warm vector |
| `$8021` | `bank01_api_08` | jump table #08 |
| `$802D` | `bank01_sub_802D` | reachable label |
| `$805A` | `bank01_sub_805A` | reachable label |
| `$805B` | `bank01_api_00` | jump table #00 |
| `$8088` | `bank01_sub_8088` | reachable label |
| `$80A9` | `bank01_sub_80A9` | reachable label |
| `$80B3` | `bank01_sub_80B3` | reachable label |
| `$80B9` | `bank01_api_01` | jump table #01 |
| `$80C7` | `bank01_sub_80C7` | reachable label |
| `$80C9` | `bank01_sub_80C9` | reachable label |
| `$8115` | `bank01_sub_8115` | reachable label |
| `$8147` | `bank01_sub_8147` | reachable label |
| `$814E` | `bank01_sub_814E` | reachable label |
| `$8162` | `bank01_sub_8162` | reachable label |
| `$81EB` | `bank01_sub_81EB` | reachable label |
| `$81F3` | `bank01_sub_81F3` | reachable label |
| `$821C` | `bank01_sub_821C` | reachable label |
| `$82B3` | `bank01_api_05` | jump table #05 |
| `$82B6` | `bank01_sub_82B6` | reachable label |
| `$82C4` | `bank01_sub_82C4` | reachable label |
| `$82D2` | `bank01_api_04` | jump table #04 |
| `$82DD` | `bank01_sub_82DD` | reachable label |
| `$831D` | `bank01_api_06` | jump table #06 |
| `$8341` | `bank01_api_09` | jump table #09 |
| `$8352` | `bank01_sub_8352` | reachable label |
| `$8361` | `bank01_sub_8361` | reachable label |
| `$8364` | `bank01_sub_8364` | reachable label |
| `$836F` | `bank01_sub_836F` | reachable label |
| `$8382` | `bank01_sub_8382` | reachable label |
| `$8385` | `bank01_sub_8385` | reachable label |
| `$839A` | `bank01_sub_839A` | reachable label |
| `$83A4` | `bank01_sub_83A4` | reachable label |
| `$83A6` | `bank01_sub_83A6` | reachable label |
| `$83AB` | `bank01_sub_83AB` | reachable label |
| `$83B7` | `bank01_sub_83B7` | reachable label |
| `$83C5` | `bank01_sub_83C5` | reachable label |
| `$83CA` | `bank01_sub_83CA` | reachable label |
| `$83D0` | `bank01_api_02` | jump table #02 |
| `$83D8` | `bank01_sub_83D8` | reachable label |
| `$83E9` | `bank01_sub_83E9` | reachable label |
| `$8407` | `bank01_sub_8407` | reachable label |
| `$841C` | `bank01_sub_841C` | reachable label |
| `$8439` | `bank01_sub_8439` | reachable label |
| `$843D` | `bank01_sub_843D` | reachable label |
| `$8444` | `bank01_sub_8444` | reachable label |
| `$844A` | `bank01_sub_844A` | reachable label |
| `$8450` | `bank01_sub_8450` | reachable label |
| `$8457` | `bank01_sub_8457` | reachable label |
| `$8459` | `bank01_sub_8459` | reachable label |
| `$845D` | `bank01_sub_845D` | reachable label |
| `$846C` | `bank01_sub_846C` | reachable label |
| `$8476` | `bank01_sub_8476` | reachable label |
| `$847E` | `bank01_sub_847E` | reachable label |
| `$8485` | `bank01_sub_8485` | reachable label |
| `$848D` | `bank01_sub_848D` | reachable label |
| `$86F8` | `bank01_sub_86F8` | reachable label |
| `$870D` | `bank01_sub_870D` | reachable label |
| `$872C` | `bank01_sub_872C` | reachable label |
| `$873F` | `bank01_sub_873F` | reachable label |
| `$8742` | `bank01_sub_8742` | reachable label |
| `$8744` | `bank01_sub_8744` | reachable label |
| `$8764` | `bank01_sub_8764` | reachable label |
| `$877B` | `bank01_sub_877B` | reachable label |
| `$8781` | `bank01_sub_8781` | reachable label |
| `$8799` | `bank01_sub_8799` | reachable label |
| `$879C` | `bank01_sub_879C` | reachable label |
| `$87A9` | `bank01_sub_87A9` | reachable label |
| `$87AD` | `bank01_sub_87AD` | reachable label |
| `$87AF` | `bank01_sub_87AF` | reachable label |
| `$87BF` | `bank01_sub_87BF` | reachable label |
| `$87C2` | `bank01_sub_87C2` | reachable label |
| `$87C7` | `bank01_sub_87C7` | reachable label |
| `$87CE` | `bank01_sub_87CE` | reachable label |
| `$87D0` | `bank01_sub_87D0` | reachable label |
| `$87D9` | `bank01_sub_87D9` | reachable label |
| `$87E5` | `bank01_sub_87E5` | reachable label |
| `$87E7` | `bank01_sub_87E7` | reachable label |
| `$87EA` | `bank01_sub_87EA` | reachable label |
| `$87F8` | `bank01_sub_87F8` | reachable label |
| `$8805` | `bank01_sub_8805` | reachable label |
| `$8811` | `bank01_sub_8811` | reachable label |
| `$8813` | `bank01_sub_8813` | reachable label |
| `$881F` | `bank01_sub_881F` | reachable label |
| `$8827` | `bank01_sub_8827` | reachable label |
| `$882B` | `bank01_sub_882B` | reachable label |
| `$8833` | `bank01_sub_8833` | reachable label |
| `$8836` | `bank01_sub_8836` | reachable label |
| `$8838` | `bank01_sub_8838` | reachable label |
| `$883C` | `bank01_sub_883C` | reachable label |
| `$884B` | `bank01_sub_884B` | reachable label |
| `$884F` | `bank01_sub_884F` | reachable label |
| `$8862` | `bank01_sub_8862` | reachable label |
| `$8872` | `bank01_sub_8872` | reachable label |
| `$8877` | `bank01_sub_8877` | reachable label |
| `$8886` | `bank01_sub_8886` | reachable label |
| `$8893` | `bank01_sub_8893` | reachable label |
| `$88A5` | `bank01_sub_88A5` | reachable label |
| `$899A` | `bank01_api_07` | jump table #07 |
| `$899F` | `bank01_sub_899F` | reachable label |
| `$89C7` | `bank01_sub_89C7` | reachable label |
| `$89D4` | `bank01_sub_89D4` | reachable label |
| `$89F2` | `bank01_sub_89F2` | reachable label |
| `$8A15` | `bank01_sub_8A15` | reachable label |
| `$8A18` | `bank01_sub_8A18` | reachable label |
| `$8A23` | `bank01_sub_8A23` | reachable label |
| `$8AB7` | `bank01_sub_8AB7` | reachable label |
| `$8AD5` | `bank01_sub_8AD5` | reachable label |
| `$8AF2` | `bank01_sub_8AF2` | reachable label |
| `$8AF4` | `bank01_sub_8AF4` | reachable label |
| `$8AFF` | `bank01_sub_8AFF` | reachable label |
| `$8B04` | `bank01_sub_8B04` | reachable label |
| `$8B16` | `bank01_sub_8B16` | reachable label |
| `$8B18` | `bank01_sub_8B18` | reachable label |
| `$8B22` | `bank01_sub_8B22` | reachable label |
| `$8B27` | `bank01_sub_8B27` | reachable label |
| `$8B32` | `bank01_sub_8B32` | reachable label |
| `$8B38` | `bank01_sub_8B38` | reachable label |
| `$8B3D` | `bank01_sub_8B3D` | reachable label |
| `$8B40` | `bank01_sub_8B40` | reachable label |
| `$8B9E` | `bank01_sub_8B9E` | reachable label |
| `$8BA9` | `bank01_sub_8BA9` | reachable label |
| `$8BCC` | `bank01_sub_8BCC` | reachable label |
| `$8BE9` | `bank01_sub_8BE9` | reachable label |
| `$8BEB` | `bank01_sub_8BEB` | reachable label |
| `$8BEF` | `bank01_sub_8BEF` | reachable label |
| `$8BFA` | `bank01_sub_8BFA` | reachable label |
| `$8BFB` | `bank01_sub_8BFB` | reachable label |
| `$8C06` | `bank01_sub_8C06` | reachable label |
| `$8E08` | `bank01_sub_8E08` | reachable label |
| `$8E1C` | `bank01_sub_8E1C` | reachable label |
| `$8E2E` | `bank01_sub_8E2E` | reachable label |
| `$8E3D` | `bank01_sub_8E3D` | reachable label |
| `$8E50` | `bank01_sub_8E50` | reachable label |
| `$8E58` | `bank01_sub_8E58` | reachable label |
| `$8E64` | `bank01_sub_8E64` | reachable label |
| `$8E67` | `bank01_sub_8E67` | reachable label |
| `$8E7A` | `bank01_sub_8E7A` | reachable label |
| `$8E83` | `bank01_sub_8E83` | reachable label |
| `$8E8D` | `bank01_sub_8E8D` | reachable label |
| `$8EA3` | `bank01_sub_8EA3` | reachable label |
| `$8EAE` | `bank01_sub_8EAE` | reachable label |
| `$8ED6` | `bank01_sub_8ED6` | reachable label |
| `$8EDD` | `bank01_sub_8EDD` | reachable label |
| `$8F02` | `bank01_sub_8F02` | reachable label |
| `$8F07` | `bank01_sub_8F07` | reachable label |
| `$8F12` | `bank01_sub_8F12` | reachable label |
| `$8F15` | `bank01_sub_8F15` | reachable label |
| `$8F16` | `bank01_sub_8F16` | reachable label |
| `$8F1E` | `bank01_sub_8F1E` | reachable label |
| `$8F7C` | `bank01_sub_8F7C` | reachable label |
| `$8F7F` | `bank01_sub_8F7F` | reachable label |
| `$8F88` | `bank01_sub_8F88` | reachable label |
| `$8F95` | `bank01_sub_8F95` | reachable label |
| `$8FA7` | `bank01_sub_8FA7` | reachable label |
| `$8FB2` | `bank01_sub_8FB2` | reachable label |
| `$8FB3` | `bank01_sub_8FB3` | reachable label |
| `$8FD3` | `bank01_sub_8FD3` | reachable label |
| `$8FD6` | `bank01_sub_8FD6` | reachable label |
| `$8FEA` | `bank01_sub_8FEA` | reachable label |
| `$8FF6` | `bank01_sub_8FF6` | reachable label |
| `$8FFB` | `bank01_sub_8FFB` | reachable label |
| `$9001` | `bank01_sub_9001` | reachable label |
| `$9004` | `bank01_sub_9004` | reachable label |
| `$90DC` | `bank01_sub_90DC` | reachable label |
| `$90E6` | `bank01_sub_90E6` | reachable label |
| `$90F2` | `bank01_sub_90F2` | reachable label |
| `$90FD` | `bank01_sub_90FD` | reachable label |
| `$927A` | `bank01_sub_927A` | reachable label |
| `$9286` | `bank01_sub_9286` | reachable label |
| `$9295` | `bank01_sub_9295` | reachable label |
| `$92A8` | `bank01_sub_92A8` | reachable label |
| `$92BB` | `bank01_sub_92BB` | reachable label |
| `$92BD` | `bank01_sub_92BD` | reachable label |
| `$92BE` | `bank01_sub_92BE` | reachable label |
| `$92CD` | `bank01_sub_92CD` | reachable label |
| `$92DD` | `bank01_sub_92DD` | reachable label |
| `$92EF` | `bank01_sub_92EF` | reachable label |
| `$92FE` | `bank01_sub_92FE` | reachable label |
| `$9304` | `bank01_sub_9304` | reachable label |
| `$9317` | `bank01_sub_9317` | reachable label |
| `$931F` | `bank01_sub_931F` | reachable label |
| `$9330` | `bank01_sub_9330` | reachable label |
| `$9342` | `bank01_sub_9342` | reachable label |
| `$9345` | `bank01_sub_9345` | reachable label |
| `$934B` | `bank01_sub_934B` | reachable label |
| `$9353` | `bank01_sub_9353` | reachable label |
| `$9359` | `bank01_sub_9359` | reachable label |
| `$935F` | `bank01_sub_935F` | reachable label |
| `$9365` | `bank01_sub_9365` | reachable label |
| `$9371` | `bank01_sub_9371` | reachable label |
| `$937C` | `bank01_sub_937C` | reachable label |
| `$9380` | `bank01_sub_9380` | reachable label |
| `$9393` | `bank01_sub_9393` | reachable label |
| `$93A2` | `bank01_sub_93A2` | reachable label |
| `$93AD` | `bank01_sub_93AD` | reachable label |
| `$93B2` | `bank01_sub_93B2` | reachable label |
| `$93B7` | `bank01_sub_93B7` | reachable label |
| `$93CD` | `bank01_sub_93CD` | reachable label |
| `$93D1` | `bank01_sub_93D1` | reachable label |
| `$93D8` | `bank01_sub_93D8` | reachable label |
| `$94BB` | `bank01_sub_94BB` | reachable label |
| `$94BE` | `bank01_sub_94BE` | reachable label |
| `$94C8` | `bank01_sub_94C8` | reachable label |
| `$94D0` | `bank01_sub_94D0` | reachable label |
| `$955E` | `bank01_sub_955E` | reachable label |
| `$956A` | `bank01_sub_956A` | reachable label |
| `$9705` | `bank01_sub_9705` | reachable label |
| `$970C` | `bank01_sub_970C` | reachable label |
| `$9712` | `bank01_sub_9712` | reachable label |
| `$9714` | `bank01_sub_9714` | reachable label |
| `$971D` | `bank01_sub_971D` | reachable label |
| `$9728` | `bank01_sub_9728` | reachable label |
| `$9732` | `bank01_sub_9732` | reachable label |
| `$9759` | `bank01_sub_9759` | reachable label |
| `$9768` | `bank01_sub_9768` | reachable label |
| `$9775` | `bank01_sub_9775` | reachable label |
| `$9798` | `bank01_sub_9798` | reachable label |
| `$97B0` | `bank01_sub_97B0` | reachable label |
| `$97C5` | `bank01_sub_97C5` | reachable label |
| `$97C7` | `bank01_sub_97C7` | reachable label |
| `$97D0` | `bank01_sub_97D0` | reachable label |
| `$9838` | `bank01_sub_9838` | reachable label |
| `$983D` | `bank01_sub_983D` | reachable label |
| `$9844` | `bank01_sub_9844` | reachable label |
| `$984D` | `bank01_sub_984D` | reachable label |
| `$9858` | `bank01_sub_9858` | reachable label |
| `$985B` | `bank01_sub_985B` | reachable label |
| `$9862` | `bank01_sub_9862` | reachable label |
| `$9871` | `bank01_sub_9871` | reachable label |
| `$9873` | `bank01_sub_9873` | reachable label |
| `$989A` | `bank01_sub_989A` | reachable label |
| `$98B1` | `bank01_sub_98B1` | reachable label |
| `$98C1` | `bank01_sub_98C1` | reachable label |
| `$98F5` | `bank01_sub_98F5` | reachable label |
| `$9900` | `bank01_sub_9900` | reachable label |
| `$9908` | `bank01_sub_9908` | reachable label |
| `$9912` | `bank01_sub_9912` | reachable label |
| `$9934` | `bank01_sub_9934` | reachable label |
| `$9935` | `bank01_sub_9935` | reachable label |
| `$995E` | `bank01_sub_995E` | reachable label |
| `$9964` | `bank01_api_10` | jump table #10 |
| `$9966` | `bank01_api_11` | jump table #11 |
| `$996F` | `bank01_sub_996F` | reachable label |
| `$9970` | `bank01_sub_9970` | reachable label |
| `$9981` | `bank01_sub_9981` | reachable label |
| `$9985` | `bank01_sub_9985` | reachable label |
| `$998F` | `bank01_sub_998F` | reachable label |
| `$9995` | `bank01_sub_9995` | reachable label |
| `$999E` | `bank01_sub_999E` | reachable label |
| `$9A72` | `bank01_sub_9A72` | reachable label |
| `$9A95` | `bank01_sub_9A95` | reachable label |
| `$9AA1` | `bank01_sub_9AA1` | reachable label |
| `$9AB2` | `bank01_sub_9AB2` | reachable label |
| `$9AB6` | `bank01_sub_9AB6` | reachable label |
| `$9AB8` | `bank01_sub_9AB8` | reachable label |
| `$9AC6` | `bank01_sub_9AC6` | reachable label |
| `$9ACB` | `bank01_sub_9ACB` | reachable label |
| `$9AEE` | `bank01_sub_9AEE` | reachable label |
| `$9AF0` | `bank01_sub_9AF0` | reachable label |
| `$9B0B` | `bank01_sub_9B0B` | reachable label |
| `$9B88` | `bank01_sub_9B88` | reachable label |
| `$9B9C` | `bank01_sub_9B9C` | reachable label |
| `$9BB7` | `bank01_sub_9BB7` | reachable label |
| `$9BD3` | `bank01_sub_9BD3` | reachable label |
| `$9BE2` | `bank01_sub_9BE2` | reachable label |
| `$9BE3` | `bank01_api_03` | jump table #03 |
| `$9BF0` | `bank01_sub_9BF0` | reachable label |
| `$9BF7` | `bank01_sub_9BF7` | reachable label |
| `$9BFC` | `bank01_sub_9BFC` | reachable label |
| `$9C1C` | `bank01_sub_9C1C` | reachable label |
| `$9F4E` | `bank01_sub_9F4E` | reachable label |
| `$9F50` | `bank01_sub_9F50` | reachable label |
| `$9F51` | `bank01_sub_9F51` | reachable label |
| `$9F76` | `bank01_sub_9F76` | reachable label |

## Files

- Disassembly: `rr38p-tmp12reu.bank01.asm`
- Source image: `rr38p-tmp12reu.bin`
