# Retro Replay Bank 03

## Address Mapping

- File offset: `0x6000-0x7FFF`
- C64 cartridge window when bank selected: `$8000-$9FFF`
- Cold start vector at `$8000`: `$8009`
- Warm start vector at `$8002`: `$800C`
- CBM signature bytes at `$8004-$8008`: `c3 c2 cd 38 30`

## Disassembly Coverage

- Reachable instruction starts: `1396`
- Reachable code bytes: `2719` of `8192`
- Jump-table entries from cold start: `33`
- Internal entry points used: `$8009, $800C, $8042, $8265, $82AF, $82B5, $842F, $8435, $845D, $857F, $8644, $864C, $8944, $8E7F, $8EB3, $8EE2, $8FDC, $905F, $90C8, $90F6, $9102, $9159, $9219, $9418, $942F, $9451, $9473, $94C5, $94EB, $9502, $9658, $971C, $9F58, $9F8E, $9FC8`
- External targets referenced: `$002D, $0073, $0079, $0210, $202D, $2041, $2045, $2059, $2D20, $2D42, $2E2E, $3146, $3436, $3531, $4153, $4353, $4424, $4552, $4620, $4843, $494C, $4957, $4E49, $4F4D, $4F53, $5053, $5244, $5245, $524F, $5349, $542A, $5453, $5543, $5941, $5943, $A02B, $A02F, $A200, $A3BF, $A533, $A57C, $A613, $A660, $A687, $A68E, $A81D, $A8FB, $A90B, $A96B, $AF08, $BC49, $BDCD, $BDDF, $DE9D, $DEDE, $E3BF, $E453, $E544, $E716, $F6BC, $F6ED, $FD8D, $FDA3, $FE72, $FF5B, $FF9F, $FFD2, $FFE4, $FFF0`

## Likely Contents

- `+0x00A6` (`$80A6`): "STARTED DEBUGSTUB ON SS - KICK IN YER PC"
- `+0x1FCC` (`$9FCC`): "CYBERPUNX RETRO REPLAY 64KB - 3.8P"
- `+0x165B` (`$965B`): "F1*BACKUP  F3*RESTART  F7*SCREEN"
- `+0x0245` (`$8245`): "ADDR AR XR YR SP 01 NV-BDIZC"
- `+0x0E86` (`$8E86`): "INSERT SOURCE DISK IN DRIVE"
- `+0x14CB` (`$94CB`): "CURRENTLY OUT OF ORDER..."
- `+0x155D` (`$955D`): "REU COMPATIBILITY ENABLED"
- `+0x0EF5` (`$8EF5`): "DISKCOPY IS 1541 ONLY..."
- `+0x1045` (`$9045`): "- PRESS SPACE TO START -"
- `+0x0FEC` (`$8FEC`): "_  - SAVE CURRENT MODE"
- `+0x1017` (`$9017`): "CBM - TOGGLE INTERLACE"
- `+0x0B9F` (`$8B9F`): "ANOTHER OUTPUT? (Y/N)"

## Symbol Table

| Address | Symbol | Source |
|---:|---|---|
| `$8009` | `bank03_cold_start` | cold vector |
| `$800C` | `bank03_warm_start` | warm vector |
| `$8042` | `bank03_api_19` | jump table #19 |
| `$8265` | `bank03_api_32` | jump table #32 |
| `$82AF` | `bank03_api_12` | jump table #12 |
| `$82B5` | `bank03_api_01` | jump table #01 |
| `$82C0` | `bank03_sub_82C0` | reachable label |
| `$835F` | `bank03_sub_835F` | reachable label |
| `$8362` | `bank03_sub_8362` | reachable label |
| `$836A` | `bank03_sub_836A` | reachable label |
| `$8372` | `bank03_sub_8372` | reachable label |
| `$8384` | `bank03_sub_8384` | reachable label |
| `$838C` | `bank03_sub_838C` | reachable label |
| `$8394` | `bank03_sub_8394` | reachable label |
| `$83A2` | `bank03_sub_83A2` | reachable label |
| `$83A7` | `bank03_sub_83A7` | reachable label |
| `$83B0` | `bank03_sub_83B0` | reachable label |
| `$83CF` | `bank03_sub_83CF` | reachable label |
| `$842F` | `bank03_api_09` | jump table #09 |
| `$8435` | `bank03_api_08` | jump table #08 |
| `$8439` | `bank03_sub_8439` | reachable label |
| `$844E` | `bank03_sub_844E` | reachable label |
| `$8450` | `bank03_sub_8450` | reachable label |
| `$845D` | `bank03_api_02` | jump table #02 |
| `$845E` | `bank03_sub_845E` | reachable label |
| `$8576` | `bank03_sub_8576` | reachable label |
| `$857F` | `bank03_api_18` | jump table #18 |
| `$8594` | `bank03_sub_8594` | reachable label |
| `$85A1` | `bank03_sub_85A1` | reachable label |
| `$8644` | `bank03_api_04` | jump table #04 |
| `$864C` | `bank03_api_05` | jump table #05 |
| `$86E5` | `bank03_sub_86E5` | reachable label |
| `$86F3` | `bank03_sub_86F3` | reachable label |
| `$8944` | `bank03_api_03` | jump table #03 |
| `$8985` | `bank03_sub_8985` | reachable label |
| `$8C60` | `bank03_sub_8C60` | reachable label |
| `$8CA6` | `bank03_sub_8CA6` | reachable label |
| `$8CBB` | `bank03_sub_8CBB` | reachable label |
| `$8CCA` | `bank03_sub_8CCA` | reachable label |
| `$8CD6` | `bank03_sub_8CD6` | reachable label |
| `$8CD9` | `bank03_sub_8CD9` | reachable label |
| `$8CE4` | `bank03_sub_8CE4` | reachable label |
| `$8CE7` | `bank03_sub_8CE7` | reachable label |
| `$8CED` | `bank03_sub_8CED` | reachable label |
| `$8CFD` | `bank03_sub_8CFD` | reachable label |
| `$8D09` | `bank03_sub_8D09` | reachable label |
| `$8D18` | `bank03_sub_8D18` | reachable label |
| `$8D1D` | `bank03_sub_8D1D` | reachable label |
| `$8D2E` | `bank03_sub_8D2E` | reachable label |
| `$8D4B` | `bank03_sub_8D4B` | reachable label |
| `$8D70` | `bank03_sub_8D70` | reachable label |
| `$8D79` | `bank03_sub_8D79` | reachable label |
| `$8D8A` | `bank03_sub_8D8A` | reachable label |
| `$8DA1` | `bank03_sub_8DA1` | reachable label |
| `$8E6E` | `bank03_sub_8E6E` | reachable label |
| `$8E7F` | `bank03_api_13` | jump table #13 |
| `$8E81` | `bank03_sub_8E81` | reachable label |
| `$8EAA` | `bank03_sub_8EAA` | reachable label |
| `$8EB3` | `bank03_api_14` | jump table #14 |
| `$8EC6` | `bank03_sub_8EC6` | reachable label |
| `$8ED3` | `bank03_sub_8ED3` | reachable label |
| `$8EDC` | `bank03_sub_8EDC` | reachable label |
| `$8EDD` | `bank03_sub_8EDD` | reachable label |
| `$8EE2` | `bank03_api_15` | jump table #15 |
| `$8EF1` | `bank03_sub_8EF1` | reachable label |
| `$8F12` | `bank03_sub_8F12` | reachable label |
| `$8F15` | `bank03_sub_8F15` | reachable label |
| `$8F2B` | `bank03_sub_8F2B` | reachable label |
| `$8F46` | `bank03_sub_8F46` | reachable label |
| `$8F4C` | `bank03_sub_8F4C` | reachable label |
| `$8F56` | `bank03_sub_8F56` | reachable label |
| `$8F9F` | `bank03_sub_8F9F` | reachable label |
| `$8FBD` | `bank03_sub_8FBD` | reachable label |
| `$8FD8` | `bank03_sub_8FD8` | reachable label |
| `$8FDB` | `bank03_sub_8FDB` | reachable label |
| `$8FDC` | `bank03_api_24` | jump table #24 |
| `$904A` | `bank03_sub_904A` | reachable label |
| `$905F` | `bank03_api_20` | jump table #20 |
| `$90B8` | `bank03_sub_90B8` | reachable label |
| `$90C8` | `bank03_api_00` | jump table #00 |
| `$90CC` | `bank03_sub_90CC` | reachable label |
| `$90D6` | `bank03_sub_90D6` | reachable label |
| `$90F6` | `bank03_api_07` | jump table #07 |
| `$90F8` | `bank03_sub_90F8` | reachable label |
| `$9102` | `bank03_api_10` | jump table #10 |
| `$910B` | `bank03_sub_910B` | reachable label |
| `$9111` | `bank03_sub_9111` | reachable label |
| `$9124` | `bank03_sub_9124` | reachable label |
| `$9159` | `bank03_api_17` | jump table #17 |
| `$9172` | `bank03_sub_9172` | reachable label |
| `$9183` | `bank03_sub_9183` | reachable label |
| `$919B` | `bank03_sub_919B` | reachable label |
| `$91A9` | `bank03_sub_91A9` | reachable label |
| `$91BC` | `bank03_sub_91BC` | reachable label |
| `$91C8` | `bank03_sub_91C8` | reachable label |
| `$91E5` | `bank03_sub_91E5` | reachable label |
| `$91EF` | `bank03_sub_91EF` | reachable label |
| `$91F5` | `bank03_sub_91F5` | reachable label |
| `$91FD` | `bank03_sub_91FD` | reachable label |
| `$91FF` | `bank03_sub_91FF` | reachable label |
| `$920A` | `bank03_sub_920A` | reachable label |
| `$920B` | `bank03_sub_920B` | reachable label |
| `$9211` | `bank03_sub_9211` | reachable label |
| `$9212` | `bank03_sub_9212` | reachable label |
| `$9218` | `bank03_sub_9218` | reachable label |
| `$9219` | `bank03_api_16` | jump table #16 |
| `$922B` | `bank03_sub_922B` | reachable label |
| `$9231` | `bank03_sub_9231` | reachable label |
| `$923A` | `bank03_sub_923A` | reachable label |
| `$923F` | `bank03_sub_923F` | reachable label |
| `$9242` | `bank03_sub_9242` | reachable label |
| `$9261` | `bank03_sub_9261` | reachable label |
| `$9266` | `bank03_sub_9266` | reachable label |
| `$926C` | `bank03_sub_926C` | reachable label |
| `$9273` | `bank03_sub_9273` | reachable label |
| `$9276` | `bank03_sub_9276` | reachable label |
| `$9295` | `bank03_sub_9295` | reachable label |
| `$9298` | `bank03_sub_9298` | reachable label |
| `$92AA` | `bank03_sub_92AA` | reachable label |
| `$92AC` | `bank03_sub_92AC` | reachable label |
| `$92B4` | `bank03_sub_92B4` | reachable label |
| `$92C0` | `bank03_sub_92C0` | reachable label |
| `$92CC` | `bank03_sub_92CC` | reachable label |
| `$92CD` | `bank03_sub_92CD` | reachable label |
| `$92E0` | `bank03_sub_92E0` | reachable label |
| `$92F5` | `bank03_sub_92F5` | reachable label |
| `$931D` | `bank03_sub_931D` | reachable label |
| `$932B` | `bank03_sub_932B` | reachable label |
| `$932F` | `bank03_sub_932F` | reachable label |
| `$9337` | `bank03_sub_9337` | reachable label |
| `$9341` | `bank03_sub_9341` | reachable label |
| `$9372` | `bank03_sub_9372` | reachable label |
| `$9375` | `bank03_sub_9375` | reachable label |
| `$938E` | `bank03_sub_938E` | reachable label |
| `$9391` | `bank03_sub_9391` | reachable label |
| `$9397` | `bank03_sub_9397` | reachable label |
| `$93B6` | `bank03_sub_93B6` | reachable label |
| `$93C2` | `bank03_sub_93C2` | reachable label |
| `$93C4` | `bank03_sub_93C4` | reachable label |
| `$93D6` | `bank03_sub_93D6` | reachable label |
| `$93E2` | `bank03_sub_93E2` | reachable label |
| `$93F5` | `bank03_sub_93F5` | reachable label |
| `$9406` | `bank03_sub_9406` | reachable label |
| `$9410` | `bank03_sub_9410` | reachable label |
| `$9411` | `bank03_sub_9411` | reachable label |
| `$9418` | `bank03_api_31` | jump table #31 |
| `$942A` | `bank03_sub_942A` | reachable label |
| `$942F` | `bank03_api_28` | jump table #28 |
| `$9451` | `bank03_api_30` | jump table #30 |
| `$946E` | `bank03_sub_946E` | reachable label |
| `$9473` | `bank03_api_29` | jump table #29 |
| `$94A0` | `bank03_sub_94A0` | reachable label |
| `$94B7` | `bank03_sub_94B7` | reachable label |
| `$94C2` | `bank03_sub_94C2` | reachable label |
| `$94C5` | `bank03_api_22` | jump table #22 |
| `$94C8` | `bank03_sub_94C8` | reachable label |
| `$94EB` | `bank03_api_06` | jump table #06 |
| `$9502` | `bank03_api_25` | jump table #25 |
| `$9658` | `bank03_api_26` | jump table #26 |
| `$96DE` | `bank03_sub_96DE` | reachable label |
| `$96F4` | `bank03_sub_96F4` | reachable label |
| `$971C` | `bank03_api_27` | jump table #27 |
| `$972B` | `bank03_sub_972B` | reachable label |
| `$9744` | `bank03_sub_9744` | reachable label |
| `$9772` | `bank03_sub_9772` | reachable label |
| `$9777` | `bank03_sub_9777` | reachable label |
| `$9789` | `bank03_sub_9789` | reachable label |
| `$978F` | `bank03_sub_978F` | reachable label |
| `$9790` | `bank03_sub_9790` | reachable label |
| `$97A1` | `bank03_sub_97A1` | reachable label |
| `$9F01` | `bank03_sub_9F01` | reachable label |
| `$9F02` | `bank03_sub_9F02` | reachable label |
| `$9F05` | `bank03_sub_9F05` | reachable label |
| `$9F2B` | `bank03_sub_9F2B` | reachable label |
| `$9F58` | `bank03_api_23` | jump table #23 |
| `$9F61` | `bank03_sub_9F61` | reachable label |
| `$9F69` | `bank03_sub_9F69` | reachable label |
| `$9F86` | `bank03_sub_9F86` | reachable label |
| `$9F87` | `bank03_sub_9F87` | reachable label |
| `$9F8E` | `bank03_api_11` | jump table #11 |
| `$9F9A` | `bank03_sub_9F9A` | reachable label |
| `$9FC8` | `bank03_api_21` | jump table #21 |

## Files

- Disassembly: `rr38p-tmp12reu.bank03.asm`
- Source image: `rr38p-tmp12reu.bin`
