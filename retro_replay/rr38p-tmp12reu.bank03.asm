// Disassembly for rr38p-tmp12reu.bin bank 3
// Bank file offset: $6000-$7FFF
// Cartridge window: $8000-$9FFF
// Vectors: coldstart=$8009, warmstart=$800C, signature=c3 c2 cd 38 30
// Reachable instructions: 1396 bytes decoded as code: 2719
// Entry points: $8009, $800C, $8042, $8265, $82AF, $82B5, $842F, $8435, $845D, $857F, $8644, $864C, $8944, $8E7F, $8EB3, $8EE2, $8FDC, $905F, $90C8, $90F6, $9102, $9159, $9219, $9418, $942F, $9451, $9473, $94C5, $94EB, $9502, $9658, $971C, $9F58, $9F8E, $9FC8
// Jump table from cold start:
//   $8009 -> $90C8
//   $800C -> $82B5
//   $800F -> $845D
//   $8012 -> $8944
//   $8015 -> $8644
//   $8018 -> $864C
//   $801B -> $94EB
//   $801E -> $90F6
//   $8021 -> $8435
//   $8024 -> $842F
//   $8027 -> $9102
//   $802A -> $9F8E
//   $802D -> $82AF
//   $8030 -> $8E7F
//   $8033 -> $8EB3
//   $8036 -> $8EE2
//   $8039 -> $9219
//   $803C -> $9159
//   $803F -> $857F
//   $8042 -> $8042
//   $8045 -> $905F
//   $8048 -> $9FC8
//   $804B -> $94C5
//   $804E -> $9F58
//   $8051 -> $8FDC
//   $8054 -> $9502
//   $8057 -> $9658
//   $805A -> $971C
//   $805D -> $942F
//   $8060 -> $9473
//   $8063 -> $9451
//   $8066 -> $9418
//   $8069 -> $8265
// External branch/jsr/jmp targets: $002D, $0073, $0079, $0210, $202D, $2041, $2045, $2059, $2D20, $2D42, $2E2E, $3146, $3436, $3531, $4153, $4353, $4424, $4552, $4620, $4843, $494C, $4957, $4E49, $4F4D, $4F53, $5053, $5244, $5245, $524F, $5349, $542A, $5453, $5543, $5941, $5943, $A02B, $A02F, $A200, $A3BF, $A533, $A57C, $A613, $A660, $A687, $A68E, $A81D, $A8FB, $A90B, $A96B, $AF08, $BC49, $BDCD, $BDDF, $DE9D, $DEDE, $E3BF, $E453, $E544, $E716, $F6BC, $F6ED, $FD8D, $FDA3, $FE72, $FF5B, $FF9F, $FFD2, $FFE4, $FFF0

// Symbol table (auto-generated)
//   $8009 bank03_cold_start
//   $800C bank03_warm_start
//   $8042 bank03_api_19
//   $8265 bank03_api_32
//   $82AF bank03_api_12
//   $82B5 bank03_api_01
//   $82C0 bank03_sub_82C0
//   $835F bank03_sub_835F
//   $8362 bank03_sub_8362
//   $836A bank03_sub_836A
//   $8372 bank03_sub_8372
//   $8384 bank03_sub_8384
//   $838C bank03_sub_838C
//   $8394 bank03_sub_8394
//   $83A2 bank03_sub_83A2
//   $83A7 bank03_sub_83A7
//   $83B0 bank03_sub_83B0
//   $83CF bank03_sub_83CF
//   $842F bank03_api_09
//   $8435 bank03_api_08
//   $8439 bank03_sub_8439
//   $844E bank03_sub_844E
//   $8450 bank03_sub_8450
//   $845D bank03_api_02
//   $845E bank03_sub_845E
//   $8576 bank03_sub_8576
//   $857F bank03_api_18
//   $8594 bank03_sub_8594
//   $85A1 bank03_sub_85A1
//   $8644 bank03_api_04
//   $864C bank03_api_05
//   $86E5 bank03_sub_86E5
//   $86F3 bank03_sub_86F3
//   $8944 bank03_api_03
//   $8985 bank03_sub_8985
//   $8C60 bank03_sub_8C60
//   $8CA6 bank03_sub_8CA6
//   $8CBB bank03_sub_8CBB
//   $8CCA bank03_sub_8CCA
//   $8CD6 bank03_sub_8CD6
//   $8CD9 bank03_sub_8CD9
//   $8CE4 bank03_sub_8CE4
//   $8CE7 bank03_sub_8CE7
//   $8CED bank03_sub_8CED
//   $8CFD bank03_sub_8CFD
//   $8D09 bank03_sub_8D09
//   $8D18 bank03_sub_8D18
//   $8D1D bank03_sub_8D1D
//   $8D2E bank03_sub_8D2E
//   $8D4B bank03_sub_8D4B
//   $8D70 bank03_sub_8D70
//   $8D79 bank03_sub_8D79
//   $8D8A bank03_sub_8D8A
//   $8DA1 bank03_sub_8DA1
//   $8E6E bank03_sub_8E6E
//   $8E7F bank03_api_13
//   $8E81 bank03_sub_8E81
//   $8EAA bank03_sub_8EAA
//   $8EB3 bank03_api_14
//   $8EC6 bank03_sub_8EC6
//   $8ED3 bank03_sub_8ED3
//   $8EDC bank03_sub_8EDC
//   $8EDD bank03_sub_8EDD
//   $8EE2 bank03_api_15
//   $8EF1 bank03_sub_8EF1
//   $8F12 bank03_sub_8F12
//   $8F15 bank03_sub_8F15
//   $8F2B bank03_sub_8F2B
//   $8F46 bank03_sub_8F46
//   $8F4C bank03_sub_8F4C
//   $8F56 bank03_sub_8F56
//   $8F9F bank03_sub_8F9F
//   $8FBD bank03_sub_8FBD
//   $8FD8 bank03_sub_8FD8
//   $8FDB bank03_sub_8FDB
//   $8FDC bank03_api_24
//   $904A bank03_sub_904A
//   $905F bank03_api_20
//   $90B8 bank03_sub_90B8
//   $90C8 bank03_api_00
//   $90CC bank03_sub_90CC
//   $90D6 bank03_sub_90D6
//   $90F6 bank03_api_07
//   $90F8 bank03_sub_90F8
//   $9102 bank03_api_10
//   $910B bank03_sub_910B
//   $9111 bank03_sub_9111
//   $9124 bank03_sub_9124
//   $9159 bank03_api_17
//   $9172 bank03_sub_9172
//   $9183 bank03_sub_9183
//   $919B bank03_sub_919B
//   $91A9 bank03_sub_91A9
//   $91BC bank03_sub_91BC
//   $91C8 bank03_sub_91C8
//   $91E5 bank03_sub_91E5
//   $91EF bank03_sub_91EF
//   $91F5 bank03_sub_91F5
//   $91FD bank03_sub_91FD
//   $91FF bank03_sub_91FF
//   $920A bank03_sub_920A
//   $920B bank03_sub_920B
//   $9211 bank03_sub_9211
//   $9212 bank03_sub_9212
//   $9218 bank03_sub_9218
//   $9219 bank03_api_16
//   $922B bank03_sub_922B
//   $9231 bank03_sub_9231
//   $923A bank03_sub_923A
//   $923F bank03_sub_923F
//   $9242 bank03_sub_9242
//   $9261 bank03_sub_9261
//   $9266 bank03_sub_9266
//   $926C bank03_sub_926C
//   $9273 bank03_sub_9273
//   $9276 bank03_sub_9276
//   $9295 bank03_sub_9295
//   $9298 bank03_sub_9298
//   $92AA bank03_sub_92AA
//   $92AC bank03_sub_92AC
//   $92B4 bank03_sub_92B4
//   $92C0 bank03_sub_92C0
//   $92CC bank03_sub_92CC
//   $92CD bank03_sub_92CD
//   $92E0 bank03_sub_92E0
//   $92F5 bank03_sub_92F5
//   $931D bank03_sub_931D
//   $932B bank03_sub_932B
//   $932F bank03_sub_932F
//   $9337 bank03_sub_9337
//   $9341 bank03_sub_9341
//   $9372 bank03_sub_9372
//   $9375 bank03_sub_9375
//   $938E bank03_sub_938E
//   $9391 bank03_sub_9391
//   $9397 bank03_sub_9397
//   $93B6 bank03_sub_93B6
//   $93C2 bank03_sub_93C2
//   $93C4 bank03_sub_93C4
//   $93D6 bank03_sub_93D6
//   $93E2 bank03_sub_93E2
//   $93F5 bank03_sub_93F5
//   $9406 bank03_sub_9406
//   $9410 bank03_sub_9410
//   $9411 bank03_sub_9411
//   $9418 bank03_api_31
//   $942A bank03_sub_942A
//   $942F bank03_api_28
//   $9451 bank03_api_30
//   $946E bank03_sub_946E
//   $9473 bank03_api_29
//   $94A0 bank03_sub_94A0
//   $94B7 bank03_sub_94B7
//   $94C2 bank03_sub_94C2
//   $94C5 bank03_api_22
//   $94C8 bank03_sub_94C8
//   $94EB bank03_api_06
//   $9502 bank03_api_25
//   $9658 bank03_api_26
//   $96DE bank03_sub_96DE
//   $96F4 bank03_sub_96F4
//   $971C bank03_api_27
//   $972B bank03_sub_972B
//   $9744 bank03_sub_9744
//   $9772 bank03_sub_9772
//   $9777 bank03_sub_9777
//   $9789 bank03_sub_9789
//   $978F bank03_sub_978F
//   $9790 bank03_sub_9790
//   $97A1 bank03_sub_97A1
//   $9F01 bank03_sub_9F01
//   $9F02 bank03_sub_9F02
//   $9F05 bank03_sub_9F05
//   $9F2B bank03_sub_9F2B
//   $9F58 bank03_api_23
//   $9F61 bank03_sub_9F61
//   $9F69 bank03_sub_9F69
//   $9F86 bank03_sub_9F86
//   $9F87 bank03_sub_9F87
//   $9F8E bank03_api_11
//   $9F9A bank03_sub_9F9A
//   $9FC8 bank03_api_21

.pc = $8000

bank03_data_8000:
.errorif (* != $8000), "bank03_data_8000 shifted"
    .byte $09, $80, $0C, $80, $C3, $C2, $CD, $38, $30    // data $8000
bank03_cold_start:
    jmp bank03_api_00              // 4C C8 90
bank03_warm_start:
    jmp bank03_api_01              // 4C B5 82
bank03_data_800F:
.errorif (* != $800F), "bank03_data_800F shifted"
    jmp $845d              // 4C 5D 84
    jmp $8944              // 4C 44 89
    jmp $8644              // 4C 44 86
    jmp $864c              // 4C 4C 86
    jmp $94eb              // 4C EB 94
    jmp $90f6              // 4C F6 90
    jmp $8435              // 4C 35 84
    jmp $842f              // 4C 2F 84
    jmp $9102              // 4C 02 91
    jmp $9f8e              // 4C 8E 9F
    jmp $82af              // 4C AF 82
    jmp $8e7f              // 4C 7F 8E
    jmp $8eb3              // 4C B3 8E
    jmp $8ee2              // 4C E2 8E
    jmp $9219              // 4C 19 92
    jmp $9159              // 4C 59 91
    jmp $857f              // 4C 7F 85
bank03_api_19:
    jmp bank03_api_19              // 4C 42 80
bank03_data_8045:
.errorif (* != $8045), "bank03_data_8045 shifted"
    jmp $905f              // 4C 5F 90
    jmp $9fc8              // 4C C8 9F
    jmp $94c5              // 4C C5 94
    jmp $9f58              // 4C 58 9F
    jmp $8fdc              // 4C DC 8F
    jmp $9502              // 4C 02 95
    jmp $9658              // 4C 58 96
    jmp $971c              // 4C 1C 97
    jmp $942f              // 4C 2F 94
    jmp $9473              // 4C 73 94
    jmp $9451              // 4C 51 94
    jmp $9418              // 4C 18 94
    jmp $8265              // 4C 65 82
bank03_data_806C:
.errorif (* != $806C), "bank03_data_806C shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $806C
    .byte $00, $00, $00, $00, $00    // data $807C
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    jmp b03_808D           // 4C 8D 80
    jmp b03_8241           // 4C 41 82
b03_808D:
    ldx #$00               // A2 00
b03_808F:
    lda $80cf,x            // BD CF 80
    sta $ce00,x            // 9D 00 CE
    lda $81cf,x            // BD CF 81
    sta $cf00,x            // 9D 00 CF
    inc $d020              // EE 20 D0   VIC border color
    inx                    // E8
    bne b03_808F           // D0 EE
    jsr $8362              // 20 62 83
    .byte $0D, $0D, $53, $54, $41, $52, $54, $45, $44, $20, $44, $45, $42, $55, $47, $53    // data $80A4  text: "..STARTED DEBUGS"
    .byte $54, $55, $42, $20, $4F, $4E, $20, $53, $53, $20, $2D, $20, $4B, $49, $43, $4B    // data $80B4  text: "TUB ON SS - KICK"
    .byte $20, $49, $4E, $20, $59, $45, $52, $20, $50, $43, $00    // data $80C4  text: " IN YER PC."
    jmp $ce06              // 4C 06 CE
    jmp $ce11              // 4C 11 CE
    lda #$04               // A9 04
    jsr $ceff              // 20 FF CE
    jsr $ce11              // 20 11 CE
    jmp $ce0b              // 4C 0B CE
    sei                    // 78
    jsr $cf45              // 20 45 CF
    bcs b03_8109           // B0 23
    cmp #$41               // C9 41
    bne b03_8109           // D0 1F
    jsr $cf5c              // 20 5C CF
    cmp #$42               // C9 42
    bne b03_80F4           // D0 03
    jmp $ce3c              // 4C 3C CE
b03_80F4:
    cmp #$43               // C9 43
    bne b03_80FB           // D0 03
    jmp $ce87              // 4C 87 CE
b03_80FB:
    cmp #$44               // C9 44
    bne b03_8102           // D0 03
    jmp $cece              // 4C CE CE
b03_8102:
    cmp #$4b               // C9 4B
    bne b03_8109           // D0 03
    jmp $cedb              // 4C DB CE
b03_8109:
    cli                    // 58
    rts                    // 60
    lda $a0                // A5 A0
    pha                    // 48
    lda $a1                // A5 A1
    pha                    // 48
    lda $a2                // A5 A2
    pha                    // 48
    lda $a3                // A5 A3
    pha                    // 48
    jsr $cf5c              // 20 5C CF
    sta $a2                // 85 A2
    jsr $cf5c              // 20 5C CF
    sta $a3                // 85 A3
    jsr $cf5c              // 20 5C CF
    sta $a0                // 85 A0
    jsr $cf5c              // 20 5C CF
    sta $a1                // 85 A1
    ldy #$00               // A0 00
b03_812D:
    jsr $cf5c              // 20 5C CF
    sta ($a0),y            // 91 A0
    inc $a0                // E6 A0
    bne b03_8138           // D0 02
    inc $a1                // E6 A1
b03_8138:
    lda $a1                // A5 A1
    cmp $a3                // C5 A3
    bne b03_812D           // D0 EF
    lda $a0                // A5 A0
    cmp $a2                // C5 A2
    bne b03_812D           // D0 E9
    pla                    // 68
    sta.abs $00a3          // 8D A3 00
    pla                    // 68
    sta.abs $00a2          // 8D A2 00
    pla                    // 68
    sta.abs $00a1          // 8D A1 00
    pla                    // 68
    sta.abs $00a0          // 8D A0 00
    cli                    // 58
    rts                    // 60
    lda $a0                // A5 A0
    pha                    // 48
    lda $a1                // A5 A1
    pha                    // 48
    lda $a2                // A5 A2
    pha                    // 48
    lda $a3                // A5 A3
    pha                    // 48
    jsr $cf5c              // 20 5C CF
    sta $a2                // 85 A2
    jsr $cf5c              // 20 5C CF
    sta $a3                // 85 A3
    jsr $cf5c              // 20 5C CF
    sta $a0                // 85 A0
    jsr $cf5c              // 20 5C CF
    sta $a1                // 85 A1
    ldy #$00               // A0 00
b03_8178:
    lda ($a0),y            // B1 A0
    jsr $cf62              // 20 62 CF
    inc $a0                // E6 A0
    bne b03_8183           // D0 02
    inc $a1                // E6 A1
b03_8183:
    lda $a1                // A5 A1
    cmp $a3                // C5 A3
    bne b03_8178           // D0 EF
    lda $a0                // A5 A0
    cmp $a2                // C5 A2
    bne b03_8178           // D0 E9
    pla                    // 68
    sta $a3                // 85 A3
    pla                    // 68
    sta $a2                // 85 A2
    pla                    // 68
    sta $a1                // 85 A1
    pla                    // 68
    sta $a0                // 85 A0
    cli                    // 58
    rts                    // 60
    jsr $cf5c              // 20 5C CF
    sta $a0                // 85 A0
    jsr $cf5c              // 20 5C CF
    sta $a1                // 85 A1
    jmp ($00a0)            // 6C A0 00
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    cli                    // 58
    jsr $a659              // 20 59 A6
    jmp $a7ae              // 4C AE A7
    lda $de01              // AD 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    ora #$01               // 09 01
    sta $de01              // 8D 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    ldx #$00               // A2 00
b03_81BF:
    stx $de0f              // 8E 0F DE
    cpx $de0f              // EC 0F DE
    bne b03_81CC           // D0 05
    inx                    // E8
    bne b03_81BF           // D0 F5
    clc                    // 18
    rts                    // 60
b03_81CC:
    sec                    // 38
    rts                    // 60
    tax                    // AA
    lda $de01              // AD 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    ora #$01               // 09 01
    sta $de01              // 8D 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    lda #$87               // A9 87
    sta $de0a              // 8D 0A DE
    lda #$83               // A9 83
    sta $de0b              // 8D 0B DE
    stx $de08              // 8E 08 DE
    lda #$00               // A9 00
    sta $de09              // 8D 09 DE
    lda #$03               // A9 03
    sta $de0b              // 8D 0B DE
    lda #$00               // A9 00
    sta $de09              // 8D 09 DE
    jmp $cf3f              // 4C 3F CF
    lda $de0d              // AD 0D DE
    and #$01               // 29 01
    rts                    // 60
    lda $de0d              // AD 0D DE
    and #$20               // 29 20
    rts                    // 60
    lda $de0e              // AD 0E DE
    and #$10               // 29 10
    rts                    // 60
    lda #$03               // A9 03
    sta $de0c              // 8D 0C DE
    rts                    // 60
    lda #$01               // A9 01
    sta $de0c              // 8D 0C DE
    rts                    // 60
    jsr $cf27              // 20 27 CF
    bne b03_821C           // D0 03
    jsr $cf39              // 20 39 CF
b03_821C:
    jsr $cf3f              // 20 3F CF
    jsr $cf27              // 20 27 CF
    bne b03_8226           // D0 02
    sec                    // 38
    rts                    // 60
b03_8226:
    lda $de08              // AD 08 DE
    clc                    // 18
    rts                    // 60
b03_822B:
    jsr $cf45              // 20 45 CF
    bcs b03_822B           // B0 FB
    rts                    // 60
    pha                    // 48
b03_8232:
    jsr $cf33              // 20 33 CF
    beq b03_8232           // F0 FB
b03_8237:
    jsr $cf2d              // 20 2D CF
    beq b03_8237           // F0 FB
    pla                    // 68
    sta $de08              // 8D 08 DE
    rts                    // 60
b03_8241:
    jsr $8362              // 20 62 83
    .byte $0D, $20, $20, $41, $44, $44, $52, $20, $41, $52, $20, $58, $52, $20, $59, $52    // data $8244  text: ".  ADDR AR XR YR"
    .byte $20, $53, $50, $20, $30, $31, $20, $4E, $56, $2D, $42, $44, $49, $5A, $43, $00    // data $8254  text: " SP 01 NV-BDIZC."
    rts                    // 60
bank03_api_32:
    jsr bank03_sub_8362              // 20 62 83
    .byte $52, $52, $20, $52, $45, $56, $3A, $20, $00    // data $8268  text: "RR REV: ."
    ldx #$95               // A2 95
    ldy #$82               // A0 82
    jsr $de9d              // 20 9D DE
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda #$2e               // A9 2E
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    iny                    // C8
    jsr $de9d              // 20 9D DE
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    iny                    // C8
    jsr $de9d              // 20 9D DE
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $0D, $4F, $57, $4E, $45, $52, $3A, $20, $00    // data $8291  text: "..OWNER: ."
    ldx #$95               // A2 95
    ldy #$85               // A0 85
    jsr $de9d              // 20 9D DE
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    iny                    // C8
    cpy #$95               // C0 95
    bne $829f              // D0 F5
    lda #$0d               // A9 0D
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
bank03_api_12:
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $18, $80         // inline arg: cross-bank call target $8018
    rts                    // 60
bank03_api_01:
    jsr $f6bc              // 20 BC F6
    jsr $f6ed              // 20 ED F6
    beq bank03_sub_82C0              // F0 03
    jmp $fe72              // 4C 72 FE
bank03_sub_82C0:
    ldx #$fb               // A2 FB
    txs                    // 9A
    jsr bank03_sub_9F01              // 20 01 9F
    .byte $0C, $80         // inline arg: cross-bank call target $800C
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $12, $80         // inline arg: cross-bank call target $8012
    rts                    // 60
bank03_data_82CE:
.errorif (* != $82CE), "bank03_data_82CE shifted"
    lda #$4e               // A9 4E
    sta $033c              // 8D 3C 03
    lda #$3a               // A9 3A
    sta $033d              // 8D 3D 03
    jsr $8362              // 20 62 83
    .byte $44, $49, $53, $4B, $20, $4E, $41, $4D, $45, $3A, $20, $00    // data $82DB  text: "DISK NAME: ."
    ldx #$0b               // A2 0B
    ldy #$1a               // A0 1A
    jsr $9f00              // 20 00 9F
    .byte $5D, $80         // inline arg: cross-bank call target $805D
    bne b03_82F5           // D0 03
    jmp $845d              // 4C 5D 84
b03_82F5:
    sta $fb                // 85 FB
    tay                    // A8
    dey                    // 88
b03_82F9:
    lda ($bb),y            // B1 BB
    sta $033e,y            // 99 3E 03
    dey                    // 88
    bpl b03_82F9           // 10 F8
    jsr $8362              // 20 62 83
    .byte $49, $44, $20, $4E, $55, $4D, $42, $45, $52, $3A, $20, $00    // data $8304  text: "ID NUMBER: ."
    lda #$a0               // A9 A0
    ldy $fb                // A4 FB
    ldx #$05               // A2 05
b03_8316:
    sta $033e,y            // 99 3E 03
    iny                    // C8
    dex                    // CA
    bpl b03_8316           // 10 F9
    ldx #$0b               // A2 0B
    ldy #$0c               // A0 0C
    jsr $9f00              // 20 00 9F
    .byte $5D, $80         // inline arg: cross-bank call target $805D
    ldx $fb                // A6 FB
    tay                    // A8
    beq b03_833E           // F0 13
    lda #$2c               // A9 2C
    sta $033e,x            // 9D 3E 03
    inx                    // E8
    ldy #$00               // A0 00
b03_8333:
    lda ($bb),y            // B1 BB
    sta $033e,x            // 9D 3E 03
    inx                    // E8
    iny                    // C8
    cpy #$05               // C0 05
    bne b03_8333           // D0 F5
b03_833E:
    inx                    // E8
    inx                    // E8
    txa                    // 8A
    ldx #$3c               // A2 3C
    ldy #$03               // A0 03
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    lda #$00               // A9 00
    sta $9d                // 85 9D   KERNAL msg mode
b03_834C:
    jsr $9f02              // 20 02 9F
    .byte $1B, $80         // inline arg: cross-bank call target $801B
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    jmp $857f              // 4C 7F 85
    lda #$00               // A9 00
    sta $b7                // 85 B7   filename length
    beq b03_834C           // F0 EF
    ldx #$03               // A2 03
bank03_sub_835F:
    jsr bank03_sub_8576              // 20 76 85
// --- $8362: print inline string (pull return addr, print $00-terminated
// PETSCII text following the jsr, resume after it). $835F is a second
// entry a few bytes earlier (control-code prefix variant).
bank03_sub_8362:
    pla                    // 68
    sta $3d                // 85 3D
    pla                    // 68
    sta $3e                // 85 3E
    stx $8d                // 86 8D
bank03_sub_836A:
    ldy #$00               // A0 00
    inc $3d                // E6 3D
    bne bank03_sub_8372              // D0 02
    inc $3e                // E6 3E
bank03_sub_8372:
    lda ($3d),y            // B1 3D
    beq bank03_sub_83A7              // F0 31
    cmp #$01               // C9 01
    bne bank03_sub_8384              // D0 0A
    ldx $d6                // A6 D6
    inx                    // E8
    ldy #$0a               // A0 0A
    jsr bank03_sub_8576              // 20 76 85
    bne bank03_sub_836A              // D0 E6
bank03_sub_8384:
    cmp #$02               // C9 02
    bne bank03_sub_8394              // D0 0C
    iny                    // C8
    lda ($3d),y            // B1 3D
    tax                    // AA
bank03_sub_838C:
    jsr bank03_sub_83B0              // 20 B0 83
    dex                    // CA
    bne bank03_sub_838C              // D0 FA
    beq bank03_sub_836A              // F0 D6
bank03_sub_8394:
    cmp #$2a               // C9 2A
    bne bank03_sub_83A2              // D0 0A
    jsr bank03_sub_83B0              // 20 B0 83
    lda #$2d               // A9 2D
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda #$20               // A9 20
bank03_sub_83A2:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    bcc bank03_sub_836A              // 90 C3
bank03_sub_83A7:
    lda $3e                // A5 3E
    pha                    // 48
    lda $3d                // A5 3D
    pha                    // 48
    ldx $8d                // A6 8D
    rts                    // 60
bank03_sub_83B0:
    lda #$20               // A9 20
    jmp $e716              // 4C 16 E7   KERNAL screen CHROUT
bank03_data_83B5:
.errorif (* != $83B5), "bank03_data_83B5 shifted"
    .byte $AD, $36, $03, $85, $AE, $AD, $37, $03, $85, $AF, $A2, $01, $86, $C1, $A0, $08    // data $83B5
    .byte $84, $C2, $AD, $38, $03, $85, $BD, $4C, $8E, $FB    // data $83C5
bank03_sub_83CF:
    sei                    // 78
    jsr $fda3              // 20 A3 FD   KERNAL IOINIT guts
    jsr bank03_api_00              // 20 C8 90
    jsr $ff5b              // 20 5B FF   KERNAL CINT guts (video init)
    jsr $e453              // 20 53 E4   BASIC copy vectors to $0300
    jsr $e3bf              // 20 BF E3   BASIC init RAM/CHRGET
    lda #$03               // A9 03
    sta $2d                // 85 2D   BASIC vars start lo
    lda #$08               // A9 08
    sta $2e                // 85 2E   BASIC vars start hi
    lda #$80               // A9 80
    sta $9d                // 85 9D   KERNAL msg mode
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    sta $c0                // 85 C0
    lda #$06               // A9 06
    sta $d020              // 8D 20 D0   VIC border color
    sta $d021              // 8D 21 D0   VIC background color
    ldx #$01               // A2 01
    ldy #$0b               // A0 0B
    jsr bank03_sub_835F              // 20 5F 83
    .byte $05, $20, $43, $59, $42, $45, $52, $50, $55, $4E, $58, $20, $52, $45, $50, $4C    // data $8400  text: ". CYBERPUNX REPL"
    .byte $41, $59, $00    // data $8410  text: "AY."
    ldx #$02               // A2 02
    ldy #$0c               // A0 0C
    jsr $8576              // 20 76 85
    ldx #$0f               // A2 0F
    lda #$a3               // A9 A3
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    dex                    // CA
bank03_data_8412:
bank03_data_8422:
.errorif (* != $8422), "bank03_data_8422 shifted"
    .byte $10, $FA, $A2, $8F, $A0, $DE, $8E, $02, $03, $8C, $03, $03, $60    // data $8422
bank03_api_09:
    ldx #$90               // A2 90
    ldy #$84               // A0 84
    bne bank03_sub_8439              // D0 04
bank03_api_08:
    ldx #$72               // A2 72
    ldy #$84               // A0 84
bank03_sub_8439:
    stx $033a              // 8E 3A 03
    sty $033b              // 8C 3B 03
    sei                    // 78
    ldx #$fb               // A2 FB
    txs                    // 9A
    cld                    // D8
    ldx $ba                // A6 BA   current device
    cpx #$11               // E0 11
    bcs bank03_sub_844E              // B0 04
    cpx #$08               // E0 08
    bcs bank03_sub_8450              // B0 02
bank03_sub_844E:
    ldx #$08               // A2 08
bank03_sub_8450:
    stx $0339              // 8E 39 03
    lda $ae                // A5 AE   load end addr lo
    sta $0336              // 8D 36 03
    lda $af                // A5 AF   load end addr hi
    sta $0337              // 8D 37 03
bank03_api_02:
    sei                    // 78
bank03_sub_845E:
    ldx #$fb               // A2 FB
    txs                    // 9A
    cld                    // D8
    stx $cc                // 86 CC
    jsr bank03_sub_83CF              // 20 CF 83
    jsr $a660              // 20 60 A6
    lda $0339              // AD 39 03
    sta $ba                // 85 BA   current device
    jmp ($033a)            // 6C 3A 03
bank03_data_8472:
.errorif (* != $8472), "bank03_data_8472 shifted"
    ldy #$0d               // A0 0D
    jsr $835d              // 20 5D 83
    .byte $12    // 12  undocumented/illegal at $8477
    .byte $55, $54, $49, $4C, $49, $54, $49, $45, $53, $20, $4D, $45, $4E, $55, $0D, $00    // data $8478  text: "UTILITIES MENU.."
    ldx #$f8               // A2 F8
    ldy #$85               // A0 85
    lda #$10               // A9 10
    bne b03_84B0           // D0 20
    jsr $83b5              // 20 B5 83
    ldy #$0e               // A0 0E
    jsr $835d              // 20 5D 83
    .byte $12    // 12  undocumented/illegal at $8498
    .byte $42, $41, $43, $4B, $55, $50, $20, $20, $4D, $45, $4E, $55, $0D, $00    // data $8499  text: "BACKUP  MENU.."
    jsr $8704              // 20 04 87
    ldx #$a2               // A2 A2
    ldy #$85               // A0 85
    lda #$06               // A9 06
b03_84B0:
    jsr b03_84B6           // 20 B6 84
    jmp $845d              // 4C 5D 84
b03_84B6:
    stx $ae                // 86 AE   load end addr lo
    sty $af                // 84 AF   load end addr hi
    sta $ad                // 85 AD
    jsr $9fa6              // 20 A6 9F
    ldx #$05               // A2 05
    ldy #$0a               // A0 0A
    jsr $835f              // 20 5F 83
    .byte $46, $31, $20, $2D, $20, $44, $49, $53, $4B, $20, $44, $45, $56, $49, $43, $45    // data $84C6  text: "F1 - DISK DEVICE"
    .byte $3A    // data $84D6  text: ":"
    ora ($46,x)            // 01 46
    .byte $33, $20, $2D, $20, $44, $49, $52, $45, $43, $54, $4F, $52, $59    // data $84D9  text: "3 - DIRECTORY"
    ora ($46,x)            // 01 46
    .byte $35, $20, $2D, $20, $46, $4F, $52, $4D, $41, $54    // data $84E8  text: "5 - FORMAT"
    ora ($46,x)            // 01 46
    .byte $37, $20, $2D, $20, $44, $4F, $53, $20, $43, $4F, $4D, $4D, $41, $4E, $44, $0D    // data $84F4  text: "7 - DOS COMMAND."
    ora ($00,x)            // 01 00
    lda #$41               // A9 41
    sta $ab                // 85 AB
    ldy #$00               // A0 00
b03_850C:
    sty $fb                // 84 FB
    ldx $d6                // A6 D6
    inx                    // E8
    cmp #$20               // C9 20
    bne b03_8516           // D0 01
    inx                    // E8
b03_8516:
    ldy #$06               // A0 06
    jsr $8576              // 20 76 85
    lda $ab                // A5 AB
    inc $ab                // E6 AB
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr $8362              // 20 62 83
    .byte $2A, $00    // data $8525  text: "*."
    ldy $fb                // A4 FB
b03_8529:
    lda ($ae),y            // B1 AE
    beq b03_8539           // F0 0C
    php                    // 08
    and #$7f               // 29 7F
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    iny                    // C8
    plp                    // 28
    bpl b03_8529           // 10 F2
    bne b03_850C           // D0 D3
b03_8539:
    jsr $8590              // 20 90 85
    cmp #$85               // C9 85
    bne b03_8545           // D0 05
    jsr $9f9e              // 20 9E 9F
    bcc b03_8539           // 90 F4
b03_8545:
    ldx #$00               // A2 00
    cmp #$86               // C9 86
    beq b03_8567           // F0 1C
    ldx #$02               // A2 02
    cmp #$87               // C9 87
    beq b03_8567           // F0 16
    ldx #$04               // A2 04
    cmp #$88               // C9 88
    beq b03_8567           // F0 10
    cmp #$41               // C9 41
    bcc b03_8539           // 90 DE
    cmp $ab                // C5 AB
    bcs b03_8539           // B0 DA
    sec                    // 38
    sbc #$41               // E9 41
    asl                    // 0A
    clc                    // 18
    adc $ad                // 65 AD
    tax                    // AA
b03_8567:
    lda $8626,x            // BD 26 86
    pha                    // 48
    lda $8625,x            // BD 25 86
    pha                    // 48
    jsr $83b5              // 20 B5 83
    ldx #$16               // A2 16
    ldy #$00               // A0 00
bank03_sub_8576:
    clc                    // 18
    jmp $fff0              // 4C F0 FF   KERNAL PLOT: set/get cursor
bank03_data_857A:
.errorif (* != $857A), "bank03_data_857A shifted"
    .byte $20, $02, $9F, $21, $80    // data $857A
bank03_api_18:
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $50, $52, $45, $53, $53, $20, $41, $20, $4B, $45, $59, $0D, $00    // data $8582  text: ".PRESS A KEY.."
    lda #$00               // A9 00
    sta $c6                // 85 C6   keyboard buffer count
bank03_sub_8594:
    jsr $ff9f              // 20 9F FF   KERNAL SCNKEY: scan keyboard
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    beq bank03_sub_8594              // F0 F8
    cmp #$03               // C9 03
    beq bank03_sub_85A1              // F0 01
    clc                    // 18
bank03_sub_85A1:
    rts                    // 60
bank03_data_85A2:
.errorif (* != $85A2), "bank03_data_85A2 shifted"
    .byte $44, $49, $53, $4B, $20, $53, $41, $56, $45, $20, $2D, $20, $54, $55, $52, $42    // data $85A2  text: "DISK SAVE - TURB"
    .byte $CF    // CF  undocumented/illegal at $85B2
    .byte $44, $49, $53, $4B, $20, $53, $41, $56, $45, $20, $2D, $20, $53, $54, $41, $4E    // data $85B3  text: "DISK SAVE - STAN"
    .byte $44, $41, $52    // data $85C3  text: "DAR"
    cpy $52                // C4 52
    .byte $45, $53, $54, $41, $52, $54, $20, $50, $52, $4F, $47, $52, $41    // data $85C8  text: "ESTART PROGRA"
    cmp $5845              // CD 45 58
    .byte $49, $54, $20, $54, $4F, $20, $55, $54, $49, $4C, $49, $54, $49, $45    // data $85D8  text: "IT TO UTILITIE"
    .byte $D3    // D3  undocumented/illegal at $85E6
    .byte $45, $58, $49, $54, $20, $54, $4F, $20, $46, $41, $53, $54, $4C, $4F, $41, $44    // data $85E7  text: "EXIT TO FASTLOAD"
    .byte $00    // data $85F7  text: "."
// --- $85F8-$863D: file/disk-copy menu strings (last char OR $80 as
// terminator) followed by a lo/hi handler-address table at $8625. Not code.
    .byte $44, $49, $53, $4B, $20, $46, $49, $4C, $45, $43, $4F, $50, $D9, $57, $48, $4F    // data $85F8  "DISK FILECOP.WHO"
    .byte $4C, $45, $20, $44, $49, $53, $4B, $20, $43, $4F, $50, $D9, $45, $58, $49, $54    // data $8608  "LE DISK COP.EXIT"
    .byte $20, $54, $4F, $20, $46, $41, $53, $54, $4C, $4F, $41, $44, $00, $79, $85, $CD    // data $8618  " TO FASTLOAD...."
    .byte $82, $B8, $86, $90, $86, $3F, $87, $0C, $08, $20, $80, $F7, $86, $3A, $86, $35    // data $8628  ".....?... ...:.5"
    .byte $80, $F7, $86, $20, $12, $80    // data $8638  "... .."
    jsr $9fc3              // 20 C3 9F
    jmp $8357              // 4C 57 83
bank03_api_04:
    lda $c1                // A5 C1   I/O start addr lo
    sta $c3                // 85 C3
    lda $c2                // A5 C2   I/O start addr hi
    sta $c4                // 85 C4
bank03_api_05:
    jsr bank03_sub_9F05              // 20 05 9F
    .byte $8F, $F6         // inline arg: cross-bank call target $F68F
    jsr $fb8e              // 20 8E FB
    lda #$61               // A9 61
    sta $b9                // 85 B9   secondary addr
    jsr $dea0              // 20 A0 DE
    bcc $865e              // 90 01
    rts                    // 60
bank03_data_865E:
.errorif (* != $865E), "bank03_data_865E shifted"
    lda $ba                // A5 BA   current device
    jsr $ffb1              // 20 B1 FF   KERNAL LISTEN
    lda $b9                // A5 B9   secondary addr
    jsr $ff93              // 20 93 FF   KERNAL SECOND
    lda $c3                // A5 C3
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    lda $c4                // A5 C4
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
b03_8672:
    jsr $fcd1              // 20 D1 FC
    bcs b03_868E           // B0 17
    sei                    // 78
    ldy #$07               // A0 07
b03_867A:
    lda $86fc,y            // B9 FC 86
    sta $00a4,y            // 99 A4 00
    dey                    // 88
    bne b03_867A           // D0 F7
    jsr $00a5              // 20 A5 00
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    jsr $fcdb              // 20 DB FC
    bne b03_8672           // D0 E4
b03_868E:
    jmp $f63f              // 4C 3F F6
    lda #$80               // A9 80
    bit.abs $00a9          // 2C A9 00
    sta $0338              // 8D 38 03
    sta $bd                // 85 BD
    jsr $9fb9              // 20 B9 9F
    lda $bd                // A5 BD
    bne b03_86B0           // D0 0E
    ldy $b7                // A4 B7   filename length
    lda #$2c               // A9 2C
    sta ($bb),y            // 91 BB
    iny                    // C8
    lda #$57               // A9 57
    sta ($bb),y            // 91 BB
    iny                    // C8
    sty $b7                // 84 B7   filename length
b03_86B0:
    jsr $82c8              // 20 C8 82
    jsr $9fc3              // 20 C3 9F
    jmp $8357              // 4C 57 83
    jsr $8362              // 20 62 83
    .byte $45, $4E, $54, $45, $52, $20, $43, $4F, $4D, $4D, $41, $4E, $44, $3A, $3E, $20    // data $86BC  text: "ENTER COMMAND:> "
    .byte $00    // data $86CC  text: "."
    ldx #$10               // A2 10
    ldy #$38               // A0 38
    jsr $9f00              // 20 00 9F
    .byte $5D, $80         // inline arg: cross-bank call target $805D
    php                    // 08
    jsr $9f02              // 20 02 9F
    .byte $1B, $80         // inline arg: cross-bank call target $801B
    plp                    // 28
    beq b03_86E2           // F0 03
    jmp $8357              // 4C 57 83
b03_86E2:
    jmp $857f              // 4C 7F 85
bank03_sub_86E5:
    lda #$12               // A9 12
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    cpx #$0a               // E0 0A
    bcs bank03_sub_86F3              // B0 05
    lda #$30               // A9 30
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
bank03_sub_86F3:
    lda #$00               // A9 00
    jmp $bdcd              // 4C CD BD
bank03_data_86F8:
.errorif (* != $86F8), "bank03_data_86F8 shifted"
    jsr $9f01              // 20 01 9F
    .byte $09, $80         // inline arg: cross-bank call target $8009
    inc $01                // E6 01   CPU port: mem banking
    lda ($ac),y            // B1 AC
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
    ldx #$09               // A2 09
    ldy #$1e               // A0 1E
    jsr $835f              // 20 5F 83
    .byte $42, $4C, $4F, $43, $4B, $53, $00    // data $870B  text: "BLOCKS."
    ldy #$00               // A0 00
    lda #$fe               // A9 FE
    ldx #$0b               // A2 0B
    jsr b03_872B           // 20 2B 87
    ldx #$0c               // A2 0C
    ldy #$20               // A0 20
    jsr $8576              // 20 76 85
    ldx $bf                // A6 BF
    cpx #$cb               // E0 CB
    bcc b03_873B           // 90 13
    inx                    // E8
    bne b03_873B           // D0 10
b03_872B:
    ldy #$20               // A0 20
    sta $bf                // 85 BF
    jsr $8576              // 20 76 85
    ldx $bf                // A6 BF
    jsr $9f02              // 20 02 9F
    .byte $27, $80         // inline arg: cross-bank call target $8027
    stx $bf                // 86 BF
b03_873B:
    lda #$00               // A9 00
    jmp $bdcd              // 4C CD BD
    jsr $9fb9              // 20 B9 9F
    ldy #$b9               // A0 B9
b03_8745:
    lda $8756,y            // B9 56 87
    sta $0346,y            // 99 46 03
    dey                    // 88
    bne b03_8745           // D0 F7
    jsr $0347              // 20 47 03
    jsr $9fc3              // 20 C3 9F
    jmp $8357              // 4C 57 83
    lda $af                // A5 AF   load end addr hi
    sec                    // 38
    sbc #$d0               // E9 D0
    bcc b03_8782           // 90 24
    tax                    // AA
    stx $fd                // 86 FD
    inx                    // E8
    stx $03ca              // 8E CA 03
    jsr $0388              // 20 88 03
    lda $ae                // A5 AE   load end addr lo
    clc                    // 18
    adc #$50               // 69 50
    sta $ae                // 85 AE   load end addr lo
    lda $fd                // A5 FD
    adc #$08               // 69 08
    sta $af                // 85 AF   load end addr hi
    jsr $0372              // 20 72 03
    jsr $0388              // 20 88 03
    jsr $03f1              // 20 F1 03
    ldy #$d0               // A0 D0
    bne b03_8786           // D0 04
b03_8782:
    ldx $ae                // A6 AE   load end addr lo
    ldy $af                // A4 AF   load end addr hi
b03_8786:
    lda #$01               // A9 01
    sta $ac                // 85 AC
    lda #$08               // A9 08
    sta $ad                // 85 AD
    lda #$ac               // A9 AC
    dec $01                // C6 01   CPU port: mem banking
    jsr $ffd8              // 20 D8 FF   KERNAL SAVE
    inc $01                // E6 01   CPU port: mem banking
    rts                    // 60
    ldy #$3a               // A0 3A
b03_879A:
    lda $080c,y            // B9 0C 08
    pha                    // 48
    lda $03c5,y            // B9 C5 03
    sta $080c,y            // 99 0C 08
    pla                    // 68
    sta $03c5,y            // 99 C5 03
    dey                    // 88
    bne b03_879A           // D0 EF
    lda #$47               // A9 47
    sta $22                // 85 22
    lda #$08               // A9 08
    sta $23                // 85 23
    lda #$d0               // A9 D0
    sta $25                // 85 25
    sty $24                // 84 24
    sei                    // 78
    ldx $fd                // A6 FD
    inx                    // E8
    inc $01                // E6 01   CPU port: mem banking
b03_87BF:
    lda ($22),y            // B1 22
    pha                    // 48
    lda ($24),y            // B1 24
    sta ($22),y            // 91 22
    pla                    // 68
    sta ($24),y            // 91 24
    iny                    // C8
    bne b03_87BF           // D0 F3
    inc $23                // E6 23
    inc $25                // E6 25
    dex                    // CA
    bne b03_87BF           // D0 EC
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
    sei                    // 78
    inc $01                // E6 01   CPU port: mem banking
    ldx #$20               // A2 20
    ldy #$00               // A0 00
b03_87DD:
    lda $0847,y            // B9 47 08
    sta $d000,y            // 99 00 D0
    iny                    // C8
    bne b03_87DD           // D0 F7
    inc $0816              // EE 16 08
    inc $0819              // EE 19 08
    dex                    // CA
    bne b03_87DD           // D0 EE
    dec $01                // C6 01   CPU port: mem banking
    jsr $0838              // 20 38 08
    iny                    // C8
    sty $b9                // 84 B9   secondary addr
    lda #$08               // A9 08
    pha                    // 48
    lda #$0c               // A9 0C
    pha                    // 48
    txa                    // 8A
    jmp $ffd5              // 4C D5 FF   KERNAL LOAD
    lda $bb                // A5 BB   filename ptr lo
    bne b03_8807           // D0 02
    dec $bc                // C6 BC   filename ptr hi
b03_8807:
    dec $bb                // C6 BB   filename ptr lo
    inc $b7                // E6 B7   filename length
    lda #$31               // A9 31
    sta ($bb),y            // 91 BB
    rts                    // 60
b03_8810:
    ora #$20               // 09 20
b03_8812:
    pha                    // 48
    bit $94                // 24 94
    bpl b03_8821           // 10 0A
    sec                    // 38
    ror $a3                // 66 A3
    jsr b03_8841           // 20 41 88
    lsr $94                // 46 94
    lsr $a3                // 46 A3
b03_8821:
    pla                    // 68
    sta $95                // 85 95
    sei                    // 78
    cmp #$24               // C9 24
    bne b03_882C           // D0 03
    jmp b03_88DB           // 4C DB 88
b03_882C:
    jsr b03_889D           // 20 9D 88
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    ora #$08               // 09 08
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    sei                    // 78
    jsr $ee8e              // 20 8E EE
    jsr $ee97              // 20 97 EE
    jsr $eeb3              // 20 B3 EE
b03_8841:
    sei                    // 78
    bit $dd0c              // 2C 0C DD
    bmi b03_884D           // 30 06
    jsr $ee97              // 20 97 EE
    jmp $ed44              // 4C 44 ED
b03_884D:
    lda $95                // A5 95
    jsr b03_887E           // 20 7E 88
    bit $a3                // 24 A3
    bpl b03_8859           // 10 03
    jsr b03_889D           // 20 9D 88
b03_8859:
    cli                    // 58
    clc                    // 18
    rts                    // 60
b03_885C:
    bit $94                // 24 94
    bmi b03_8865           // 30 05
    sec                    // 38
    ror $94                // 66 94
    bne b03_886A           // D0 05
b03_8865:
    pha                    // 48
    jsr b03_8841           // 20 41 88
    pla                    // 68
b03_886A:
    sta $95                // 85 95
    clc                    // 18
    rts                    // 60
    lda #$3f               // A9 3F
    jsr b03_8812           // 20 12 88
    jmp $ee03              // 4C 03 EE
b03_8876:
    sta $95                // 85 95
    jsr b03_88B8           // 20 B8 88
    jmp $edbe              // 4C BE ED
b03_887E:
    jsr b03_8889           // 20 89 88
    lda #$10               // A9 10
b03_8883:
    bit $dd0d              // 2C 0D DD   CIA2 ICR (NMI control/ack)
    beq b03_8883           // F0 FB
    rts                    // 60
b03_8889:
    sta $dd01              // 8D 01 DD   CIA2 port B (user port)
    lda $dd0d              // AD 0D DD   CIA2 ICR (NMI control/ack)
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    and #$fb               // 29 FB
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    ora #$04               // 09 04
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    rts                    // 60
b03_889D:
    lda $dd0c              // AD 0C DD
    and #$7f               // 29 7F
    sta $dd0c              // 8D 0C DD
    lda #$3f               // A9 3F
    sta $dd02              // 8D 02 DD   CIA2 DDR A
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    ora #$04               // 09 04
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    lda #$00               // A9 00
    sta $dd03              // 8D 03 DD   CIA2 DDR B
    rts                    // 60
b03_88B8:
    sei                    // 78
    bit $dd0c              // 2C 0C DD
    bmi b03_88C7           // 30 09
    jsr $ee8e              // 20 8E EE
    jsr $ee9a              // 20 9A EE
    jmp $ed44              // 4C 44 ED
b03_88C7:
    and #$f0               // 29 F0
    cmp #$e0               // C9 E0
    bne b03_88D8           // D0 0B
    lda #$00               // A9 00
    sta $dd0c              // 8D 0C DD
    jsr b03_8889           // 20 89 88
    jsr b03_889D           // 20 9D 88
b03_88D8:
    cli                    // 58
b03_88D9:
    clc                    // 18
    rts                    // 60
b03_88DB:
    jsr b03_88EA           // 20 EA 88
    bcc b03_88E3           // 90 03
    jmp $ed2e              // 4C 2E ED
b03_88E3:
    lda #$c0               // A9 C0
    sta $dd0c              // 8D 0C DD
    cli                    // 58
    rts                    // 60
b03_88EA:
    jsr b03_889D           // 20 9D 88
    dec $dd03              // CE 03 DD   CIA2 DDR B
    bit $dd0c              // 2C 0C DD
    bvs b03_88D9           // 70 E4
    jsr b03_8889           // 20 89 88
    lda #$ff               // A9 FF
    sta $dc07              // 8D 07 DC
    lda #$19               // A9 19
    sta $dc0f              // 8D 0F DC   CIA1 CRB
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
b03_8905:
    lda $dd0d              // AD 0D DD   CIA2 ICR (NMI control/ack)
    and #$10               // 29 10
    bne b03_88D9           // D0 CD
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
    and #$02               // 29 02
    beq b03_8905           // F0 F2
    sec                    // 38
    rts                    // 60
    pha                    // 48
    lda #$00               // A9 00
    sta $90                // 85 90   KERNAL I/O status
    lda #$04               // A9 04
    jsr b03_8810           // 20 10 88
    pla                    // 68
    jmp b03_8876           // 4C 76 88
    pha                    // 48
    lda #$00               // A9 00
    sta $90                // 85 90   KERNAL I/O status
    lda #$04               // A9 04
    jsr $ffb1              // 20 B1 FF   KERNAL LISTEN
    pla                    // 68
    jmp $ff93              // 4C 93 FF   KERNAL SECOND
b03_8931:
    lda #$0a               // A9 0A
    bit $0da9              // 2C A9 0D
    jmp b03_885C           // 4C 5C 88
    jsr $8934              // 20 34 89
    lda $93                // A5 93
    and #$20               // 29 20
    bne b03_8931           // D0 EF
    rts                    // 60
    .byte $24    // 24  undocumented/illegal at $8943
bank03_api_03:
    jmp bank03_sub_94C8              // 4C C8 94
bank03_data_8947:
.errorif (* != $8947), "bank03_data_8947 shifted"
    lda #$00               // A9 00
    jsr $8ca6              // 20 A6 8C
    bcs b03_8983           // B0 35
b03_894E:
    jsr $8eaa              // 20 AA 8E
    lda #$01               // A9 01
    ldx #$43               // A2 43
    ldy #$89               // A0 89
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    ldy #$00               // A0 00
    ldx $f9                // A6 F9
    jsr $ffba              // 20 BA FF   KERNAL SETLFS: set file/dev/sec
    lda #$60               // A9 60
    sta $b9                // 85 B9   secondary addr
    jsr $f3d5              // 20 D5 F3
    lda $ba                // A5 BA   current device
    jsr $ffb4              // 20 B4 FF   KERNAL TALK
    lda $b9                // A5 B9   secondary addr
    jsr $ff96              // 20 96 FF   KERNAL TKSA
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    lda $90                // A5 90   KERNAL I/O status
    lsr                    // 4A
    lsr                    // 4A
    bcc $8990              // 90 15
    jsr $8c60              // 20 60 8C
    jsr $8c7c              // 20 7C 8C
    beq b03_894E           // F0 CB
b03_8983:
    clc                    // 18
    .byte $24    // 24  undocumented/illegal at $8984
bank03_sub_8985:
    sec                    // 38
    ldx #$01               // A2 01
    stx $dc0e              // 8E 0E DC   CIA1 CRA
    dex                    // CA
    stx $0800              // 8E 00 08
    rts                    // 60
bank03_data_8990:
.errorif (* != $8990), "bank03_data_8990 shifted"
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    jsr $9f00              // 20 00 9F
    .byte $63, $80         // inline arg: cross-bank call target $8063
    lda #$08               // A9 08
    ldy #$80               // A0 80
    ldx #$1e               // A2 1E
    jsr $9f00              // 20 00 9F
    .byte $15, $80         // inline arg: cross-bank call target $8015
    lda #$00               // A9 00
    sta $fd                // 85 FD
    ldy #$26               // A0 26
    sta $fb                // 85 FB
    sty $fc                // 84 FC
    ldx #$1e               // A2 1E
    tay                    // A8
b03_89B0:
    dec $fc                // C6 FC
b03_89B2:
    sta ($fb),y            // 91 FB
    iny                    // C8
    bne b03_89B2           // D0 FB
    dex                    // CA
    bne b03_89B0           // D0 F6
    jsr $e544              // 20 44 E5   KERNAL clear screen
    jsr $8362              // 20 62 83
    .byte $44, $49, $53, $4B, $3A, $20, $00    // data $89C0  text: "DISK: ."
    jsr b03_8BE3           // 20 E3 8B
    jsr $9fc3              // 20 C3 9F
    jsr $8362              // 20 62 83
    .byte $52, $45, $41, $44, $49, $4E, $47, $20, $44, $49, $52, $2E, $2E, $2E, $0D, $00    // data $89D0  text: "READING DIR....."
    ldx #$00               // A2 00
    stx $fb                // 86 FB
    ldx #$27               // A2 27
b03_89E6:
    lda $0400,x            // BD 00 04   screen RAM
    sta $0820,x            // 9D 20 08
    lda #$a3               // A9 A3
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    dex                    // CA
    bpl b03_89E6           // 10 F2
    jsr $8362              // 20 62 83
    .byte $9D, $0D, $00    // data $89F7  text: "..."
    jmp b03_8A0D           // 4C 0D 8A
b03_89FD:
    jsr $8362              // 20 62 83
    .byte $4E, $2F, $41, $0D, $00    // data $8A00  text: "N/A.."
    jmp b03_8A0D           // 4C 0D 8A
b03_8A08:
    lda #$91               // A9 91
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
b03_8A0D:
    jsr b03_8BE3           // 20 E3 8B
    lda $90                // A5 90   KERNAL I/O status
    beq b03_8A17           // F0 03
    jmp b03_8A9F           // 4C 9F 8A
b03_8A17:
    ldy #$05               // A0 05
    lda ($d1),y            // B1 D1
    cmp #$22               // C9 22
    beq b03_8A22           // F0 03
    jmp b03_8A96           // 4C 96 8A
b03_8A22:
    lda $f8                // A5 F8
    cmp #$50               // C9 50
    beq b03_8A33           // F0 0B
    cmp #$53               // C9 53
    beq b03_8A33           // F0 07
    cmp #$55               // C9 55
    beq b03_8A33           // F0 03
    jmp b03_89FD           // 4C FD 89
b03_8A33:
    lda $c3                // A5 C3
    cpx $c3                // E4 C3
    bcc b03_89FD           // 90 C4
    ora $c4                // 05 C4
    beq b03_89FD           // F0 C0
    lda $c4                // A5 C4
    bne b03_89FD           // D0 BC
    lda #$0d               // A9 0D
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    ldx $1e00              // AE 00 1E
    lda $bd                // A5 BD
    sta $1e01,x            // 9D 01 1E
    lda $f7                // A5 F7
    sec                    // 38
    adc $fb                // 65 FB
    sta $fb                // 85 FB
    tax                    // AA
    bcc b03_8A5A           // 90 02
    inc $fc                // E6 FC
b03_8A5A:
    lda $fc                // A5 FC
    cmp #$1d               // C9 1D
    bcc b03_8A63           // 90 03
    txa                    // 8A
    cmp #$eb               // C9 EB
b03_8A63:
    inc $fd                // E6 FD
    bcs b03_8A73           // B0 0C
    lda $fd                // A5 FD
    cmp #$fe               // C9 FE
    bcs b03_8A73           // B0 06
    inc $1e00              // EE 00 1E
    jmp b03_8A08           // 4C 08 8A
b03_8A73:
    jsr $8362              // 20 62 83
    .byte $0D, $0D, $2E, $2E, $2E, $20, $4D, $4F, $52, $45, $20, $46, $49, $4C, $45, $53    // data $8A76  text: "..... MORE FILES"
    .byte $20, $2E, $2E, $2E, $0D, $0D, $00    // data $8A86  text: " ......"
    jmp b03_8A96           // 4C 96 8A
    jsr $f633              // 20 33 F6
    jmp $8985              // 4C 85 89
b03_8A96:
    jsr $f642              // 20 42 F6
b03_8A99:
    inc $d020              // EE 20 D0   VIC border color
    jmp b03_8A99           // 4C 99 8A
b03_8A9F:
    ldx #$00               // A2 00
    ldy #$80               // A0 80
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    lda #$00               // A9 00
    sta $03ef              // 8D EF 03
    sta $02                // 85 02
b03_8AAD:
    lda $bb                // A5 BB   filename ptr lo
    sta $fb                // 85 FB
    lda $bc                // A5 BC   filename ptr hi
    sta $fc                // 85 FC
    lda #$00               // A9 00
    sta $8b                // 85 8B
    sta $09b0              // 8D B0 09
    sta $ae                // 85 AE   load end addr lo
    lda #$0a               // A9 0A
    sta $09b1              // 8D B1 09
    sta $af                // 85 AF   load end addr hi
    ldx $03ef              // AE EF 03
    inc $03ef              // EE EF 03
    lda $03f0,x            // BD F0 03
    bne b03_8AD3           // D0 03
    jmp $897e              // 4C 7E 89
b03_8AD3:
    sta $fd                // 85 FD
    sta $fe                // 85 FE
    lda $02                // A5 02
    beq b03_8ADE           // F0 03
    jsr $8e70              // 20 70 8E
b03_8ADE:
    lda #$01               // A9 01
    sta $02                // 85 02
    jsr b03_8BD6           // 20 D6 8B
b03_8AE5:
    ldx $f9                // A6 F9
    ldy #$00               // A0 00
    jsr $ffba              // 20 BA FF   KERNAL SETLFS: set file/dev/sec
    ldx $ae                // A6 AE   load end addr lo
    ldy $af                // A4 AF   load end addr hi
    stx $c3                // 86 C3
    sty $c4                // 84 C4
    lda #$80               // A9 80
    sta $9d                // 85 9D   KERNAL msg mode
    asl                    // 0A
    sta $93                // 85 93
    jsr $f5d2              // 20 D2 F5
    lda #$20               // A9 20
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr $f5c1              // 20 C1 F5
    asl $9d                // 06 9D   KERNAL msg mode
    dec $b7                // C6 B7   filename length
    dec $b7                // C6 B7   filename length
    lda #$00               // A9 00
    jsr $8c6b              // 20 6B 8C
    inc $b7                // E6 B7   filename length
    inc $b7                // E6 B7   filename length
    bcc b03_8B1C           // 90 05
    lda #$20               // A9 20
    jsr $8c62              // 20 62 8C
b03_8B1C:
    ldx $8b                // A6 8B
    lda $c3                // A5 C3
    sta $02a7,x            // 9D A7 02
    lda $c4                // A5 C4
    sta $02a8,x            // 9D A8 02
    lda $ae                // A5 AE   load end addr lo
    sta $09b2,x            // 9D B2 09
    lda $af                // A5 AF   load end addr hi
    sta $09b3,x            // 9D B3 09
    inx                    // E8
    inx                    // E8
    stx $8b                // 86 8B
    jsr b03_8BCB           // 20 CB 8B
    dec $fd                // C6 FD
    bne b03_8AE5           // D0 A8
    jsr $8e6e              // 20 6E 8E
b03_8B40:
    lda $fe                // A5 FE
    sta $fd                // 85 FD
    ldx $fb                // A6 FB
    ldy $fc                // A4 FC
    stx $bb                // 86 BB   filename ptr lo
    sty $bc                // 84 BC   filename ptr hi
    lda #$00               // A9 00
    sta $8b                // 85 8B
    sta $ae                // 85 AE   load end addr lo
    lda #$0a               // A9 0A
    sta $af                // 85 AF   load end addr hi
    jsr b03_8BD6           // 20 D6 8B
b03_8B59:
    lda $ae                // A5 AE   load end addr lo
    sta $c1                // 85 C1   I/O start addr lo
    lda $af                // A5 AF   load end addr hi
    sta $c2                // 85 C2   I/O start addr hi
    ldx $8b                // A6 8B
    lda $09b2,x            // BD B2 09
    sta $ae                // 85 AE   load end addr lo
    lda $02a7,x            // BD A7 02
    sta $c3                // 85 C3
    lda $09b3,x            // BD B3 09
    sta $af                // 85 AF   load end addr hi
    lda $02a8,x            // BD A8 02
    sta $c4                // 85 C4
    inx                    // E8
    inx                    // E8
    stx $8b                // 86 8B
    lda $fa                // A5 FA
    sta $ba                // 85 BA   current device
    lda #$80               // A9 80
    sta $9d                // 85 9D   KERNAL msg mode
    jsr $9f02              // 20 02 9F
    .byte $18, $80         // inline arg: cross-bank call target $8018
    lda $90                // A5 90   KERNAL I/O status
    beq b03_8B8F           // F0 03
    jsr $8c60              // 20 60 8C
b03_8B8F:
    jsr b03_8BCB           // 20 CB 8B
    dec $fd                // C6 FD
    bne b03_8B59           // D0 C3
    bit $8c                // 24 8C
    bmi b03_8BC0           // 30 26
    jsr $8362              // 20 62 83
    .byte $0D, $0D, $41, $4E, $4F, $54, $48, $45, $52, $20, $4F, $55, $54, $50, $55, $54    // data $8B9D  text: "..ANOTHER OUTPUT"
    .byte $3F, $20, $28, $59, $2F, $4E, $29, $00    // data $8BAD  text: "? (Y/N)."
    jsr $8c95              // 20 95 8C
    bne b03_8BC0           // D0 06
    jsr $8eb3              // 20 B3 8E
    jmp b03_8B40           // 4C 40 8B
b03_8BC0:
    lda $bb                // A5 BB   filename ptr lo
    bne b03_8BC6           // D0 02
    dec $bc                // C6 BC   filename ptr hi
b03_8BC6:
    dec $bb                // C6 BB   filename ptr lo
    jmp b03_8AAD           // 4C AD 8A
b03_8BCB:
    lda $b7                // A5 B7   filename length
    clc                    // 18
    adc $bb                // 65 BB   filename ptr lo
    sta $bb                // 85 BB   filename ptr lo
    bcc b03_8BD6           // 90 02
    inc $bc                // E6 BC   filename ptr hi
b03_8BD6:
    ldy #$00               // A0 00
    lda ($bb),y            // B1 BB
    sta $b7                // 85 B7   filename length
    inc $bb                // E6 BB   filename ptr lo
    bne b03_8BE2           // D0 02
    inc $bc                // E6 BC   filename ptr hi
b03_8BE2:
    rts                    // 60
b03_8BE3:
    ldy #$02               // A0 02
    sty $8b                // 84 8B
    ldy #$00               // A0 00
    sty $f8                // 84 F8
    sty $90                // 84 90   KERNAL I/O status
b03_8BED:
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $c3                // 85 C3
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $c4                // 85 C4
    ldx $90                // A6 90   KERNAL I/O status
    beq b03_8BFE           // F0 03
b03_8BFB:
    jmp $f642              // 4C 42 F6
b03_8BFE:
    dec $8b                // C6 8B
    bne b03_8BED           // D0 EB
    ldx $c3                // A6 C3
    ldy $c4                // A4 C4
    jsr $bdcd              // 20 CD BD
    ldy #$01               // A0 01
    lda #$20               // A9 20
b03_8C0D:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    cmp #$22               // C9 22
    bne b03_8C21           // D0 0A
    lda $f8                // A5 F8
    eor #$ff               // 49 FF
    sta $f8                // 85 F8
    lda #$22               // A9 22
    bne b03_8C28           // D0 07
b03_8C21:
    ldx $f8                // A6 F8
    beq b03_8C28           // F0 03
    sta ($fb),y            // 91 FB
    iny                    // C8
b03_8C28:
    ldx $90                // A6 90   KERNAL I/O status
    bne b03_8BFB           // D0 CF
    tax                    // AA
    bne b03_8C0D           // D0 DE
    lda #$2c               // A9 2C
    sta ($fb),y            // 91 FB
    iny                    // C8
    sty $f7                // 84 F7
    ldy #$18               // A0 18
    lda ($d1),y            // B1 D1
    ora #$40               // 09 40
    sta $f8                // 85 F8
    ldy $f7                // A4 F7
    sta ($fb),y            // 91 FB
    tya                    // 98
    ldy #$00               // A0 00
    sta ($fb),y            // 91 FB
    ldx #$fe               // A2 FE
    stx $bf                // 86 BF
    tya                    // 98
    ldy $c3                // A4 C3
    beq b03_8C5D           // F0 0D
    ldx #$01               // A2 01
b03_8C52:
    clc                    // 18
    adc $bf                // 65 BF
    bcc b03_8C58           // 90 01
    inx                    // E8
b03_8C58:
    dey                    // 88
    bne b03_8C52           // D0 F7
    stx $bd                // 86 BD
b03_8C5D:
    ldx #$f6               // A2 F6
    rts                    // 60
bank03_sub_8C60:
    lda #$0d               // A9 0D
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $24, $80         // inline arg: cross-bank call target $8024
    rts                    // 60
bank03_data_8C6B:
.errorif (* != $8C6B), "bank03_data_8C6B shifted"
    bit $033c              // 2C 3C 03
    bmi b03_8C76           // 30 06
    jsr $9f02              // 20 02 9F
    .byte $15, $80         // inline arg: cross-bank call target $8015
    rts                    // 60
b03_8C76:
    jsr $9f02              // 20 02 9F
    .byte $0F, $80         // inline arg: cross-bank call target $800F
    rts                    // 60
    jsr $8362              // 20 62 83
    .byte $0D, $0D, $41, $4E, $4F, $54, $48, $45, $52, $20, $44, $49, $53, $4B, $3F, $20    // data $8C7F  text: "..ANOTHER DISK? "
    .byte $28, $59, $2F, $4E, $29, $00    // data $8C8F  text: "(Y/N)."
b03_8C95:
    jsr $8590              // 20 90 85
    cmp #$4e               // C9 4E
    beq b03_8CA0           // F0 04
    cmp #$59               // C9 59
    bne b03_8C95           // D0 F5
b03_8CA0:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    cmp #$59               // C9 59
    rts                    // 60
bank03_sub_8CA6:
    pha                    // 48
    ldx #$08               // A2 08
    stx $f9                // 86 F9
    inx                    // E8
    stx $fa                // 86 FA
    stx $ba                // 86 BA   current device
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $0C, $80         // inline arg: cross-bank call target $800C
    bne bank03_sub_8CBB              // D0 04
    dec $fa                // C6 FA
    dec $ba                // C6 BA   current device
bank03_sub_8CBB:
    ldy #$01               // A0 01
    sty $fb                // 84 FB
    sty $fc                // 84 FC
    dey                    // 88
    pla                    // 68
    tax                    // AA
    beq bank03_sub_8CCA              // F0 04
    sty $fc                // 84 FC
    sty $fb                // 84 FB
bank03_sub_8CCA:
    lda $8db5,y            // B9 B5 8D
    beq bank03_sub_8CE4              // F0 15
    cmp #$ff               // C9 FF
    beq bank03_sub_8CD9              // F0 06
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
bank03_sub_8CD6:
    iny                    // C8
    bne bank03_sub_8CCA              // D0 F1
bank03_sub_8CD9:
    inx                    // E8
    lda $8e2b,x            // BD 2B 8E
    beq bank03_sub_8CD6              // F0 F7
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    bcc bank03_sub_8CD9              // 90 F5
bank03_sub_8CE4:
    jmp bank03_sub_8D4B              // 4C 4B 8D
bank03_sub_8CE7:
    lda #$54               // A9 54
    ldy #$05               // A0 05
    ldx #$04               // A2 04
bank03_sub_8CED:
    sta $22                // 85 22
    sty $23                // 84 23
    lda $f8,x              // B5 F8
    and #$01               // 29 01
    lsr                  // 4A
    ror                  // 6A
    eor #$80               // 49 80
    sta $24                // 85 24
    ldy #$05               // A0 05
bank03_sub_8CFD:
    lda ($22),y            // B1 22
    and #$7f               // 29 7F
    eor $24                // 45 24
    cpy #$03               // C0 03
    bcc bank03_sub_8D09              // 90 02
    eor #$80               // 49 80
bank03_sub_8D09:
    sta ($22),y            // 91 22
    dey                    // 88
    bpl bank03_sub_8CFD              // 10 EF
    ldy $23                // A4 23
    lda $22                // A5 22
    sec                    // 38
    sbc #$50               // E9 50
    bcs bank03_sub_8D18              // B0 01
    dey                    // 88
bank03_sub_8D18:
    dex                    // CA
    cpx #$02               // E0 02
    bne bank03_sub_8CED              // D0 D0
bank03_sub_8D1D:
    jsr $8590              // 20 90 85
    cmp #$20               // C9 20
    beq bank03_sub_8D79              // F0 55
    cmp #$03               // C9 03
    bne bank03_sub_8D2E              // D0 06
    pla                    // 68
    pla                    // 68
    lda #$00               // A9 00
    clc                    // 18
    rts                    // 60
bank03_sub_8D2E:
    sec                    // 38
    sbc #$85               // E9 85
    cmp #$04               // C9 04
    bcs bank03_sub_8D1D              // B0 E8
    tax                    // AA
    cpx #$02               // E0 02
    bcs bank03_sub_8D70              // B0 36
    lda $f9,x              // B5 F9
    sta $ba                // 85 BA   current device
    txa                    // 8A
    pha                    // 48
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $33, $80         // inline arg: cross-bank call target $8033
    pla                    // 68
    tax                    // AA
    lda $ba                // A5 BA   current device
    sta $f9,x              // 95 F9
bank03_sub_8D4B:
    ldy #$15               // A0 15
    ldx #$02               // A2 02
    clc                    // 18
    jsr $fff0              // 20 F0 FF   KERNAL PLOT: set/get cursor
    ldx $f9                // A6 F9
    jsr bank03_sub_86E5              // 20 E5 86
    ldy #$15               // A0 15
    ldx #$04               // A2 04
    clc                    // 18
    jsr $fff0              // 20 F0 FF   KERNAL PLOT: set/get cursor
    ldx $fa                // A6 FA
    jsr bank03_sub_86E5              // 20 E5 86
    ldy #$15               // A0 15
    ldx #$0b               // A2 0B
    clc                    // 18
    jsr $fff0              // 20 F0 FF   KERNAL PLOT: set/get cursor
    jmp bank03_sub_8CE7              // 4C E7 8C
bank03_sub_8D70:
    lda #$01               // A9 01
    eor $f9,x              // 55 F9
    sta $f9,x              // 95 F9
    jmp bank03_sub_8CE7              // 4C E7 8C
bank03_sub_8D79:
    lda #$00               // A9 00
    lsr $fc                // 46 FC
    ror                  // 6A
    lsr $fb                // 46 FB
    ror                  // 6A
    sta $8c                // 85 8C
    ldx #$00               // A2 00
    stx $ba                // 86 BA   current device
    stx $fd                // 86 FD
    inx                    // E8
bank03_sub_8D8A:
    stx $24                // 86 24
    lda $f9,x              // B5 F9
    cmp $ba                // C5 BA   current device
    sta $ba                // 85 BA   current device
    beq bank03_sub_8DA1              // F0 0D
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $0C, $80         // inline arg: cross-bank call target $800C
    bne bank03_sub_8DA1              // D0 06
    pla                    // 68
    pla                    // 68
    lda #$05               // A9 05
    sec                    // 38
    rts                    // 60
bank03_sub_8DA1:
    lda $1f                // A5 1F
    eor $fd                // 45 FD
    sta $fd                // 85 FD
    ldx $24                // A6 24
    dex                    // CA
    bpl bank03_sub_8D8A              // 10 DE
    clc                    // 18
    lda $1f                // A5 1F
    sta $033c              // 8D 3C 03
    lda $fd                // A5 FD
    rts                    // 60
bank03_data_8DB5:
.errorif (* != $8DB5), "bank03_data_8DB5 shifted"
// --- $8DB5-$8E6D: disk-copy dialog text ($93=CLR, $12=RVS on, $FF=field
// placeholder): "COPY / F1. SOURCE DEVICE / F3. TARGET DEVICE / F5/F7:
// YES NO / PRESS SPACE TO START" + option strings. Not code.
    .byte $93, $20, $FF, $20, $43, $4F, $50, $59, $0D, $0D, $20, $46, $31, $2E, $20, $53    // data $8DB5  ". . COPY.. F1. S"
    .byte $4F, $55, $52, $43, $45, $20, $44, $45, $56, $49, $43, $45, $3A, $20, $12, $20    // data $8DC5  "OURCE DEVICE: . "
    .byte $30, $38, $20, $0D, $0D, $20, $46, $33, $2E, $20, $54, $41, $52, $47, $45, $54    // data $8DD5  "08 .. F3. TARGET"
    .byte $20, $44, $45, $56, $49, $43, $45, $3A, $20, $12, $20, $30, $38, $20, $0D, $0D    // data $8DE5  " DEVICE: . 08 .."
    .byte $20, $46, $35, $2E, $20, $FF, $3A, $20, $59, $45, $53, $20, $4E, $4F, $0D, $0D    // data $8DF5  " F5. .: YES NO.."
    .byte $20, $46, $37, $2E, $20, $FF, $3A, $20, $59, $45, $53, $20, $4E, $4F, $0D, $0D    // data $8E05  " F7. .: YES NO.."
    .byte $20, $50, $52, $45, $53, $53, $20, $53, $50, $41, $43, $45, $20, $54, $4F, $20    // data $8E15  " PRESS SPACE TO "
    .byte $53, $54, $41, $52, $54, $0D, $00, $46, $49, $4C, $45, $00, $4D, $55, $4C, $54    // data $8E25  "START..FILE.MULT"
    .byte $49, $20, $4F, $55, $54, $50, $55, $54, $20, $00, $52, $45, $50, $4C, $41, $43    // data $8E35  "I OUTPUT .REPLAC"
    .byte $45, $20, $46, $49, $4C, $45, $53, $00, $44, $49, $53, $4B, $00, $49, $47, $4E    // data $8E45  "E FILES.DISK.IGN"
    .byte $4F, $52, $45, $20, $45, $52, $52, $4F, $52, $53, $00, $42, $41, $4D, $20, $43    // data $8E55  "ORE ERRORS.BAM C"
    .byte $4F, $50, $59, $20, $20, $20, $20, $20, $00    // data $8E65  "OPY     ."
bank03_sub_8E6E:
    sec                    // 38
    bit $18                // 24 18
    lda $f9                // A5 F9
    eor $fa                // 45 FA
    bne bank03_sub_8EDC              // D0 65
    bcs bank03_api_14              // B0 3A
    jsr bank03_api_13              // 20 7F 8E
    jmp bank03_sub_8EC6              // 4C C6 8E
bank03_api_13:
    lda $f9                // A5 F9
bank03_sub_8E81:
    pha                    // 48
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $49, $4E, $53, $45, $52, $54, $20, $53, $4F, $55, $52, $43, $45, $20, $44    // data $8E85  text: ".INSERT SOURCE D"
    .byte $49, $53, $4B, $20, $49, $4E, $20, $44, $52, $49, $56, $45, $20, $00    // data $8E95  text: "ISK IN DRIVE ."
bank03_data_8EA3:
.errorif (* != $8EA3), "bank03_data_8EA3 shifted"
    .byte $68, $AA, $A9, $00, $4C, $CD, $BD    // data $8EA3
bank03_sub_8EAA:
    jsr bank03_api_13              // 20 7F 8E
    lda $fa                // A5 FA
    cmp $f9                // C5 F9
    beq bank03_sub_8EC6              // F0 13
bank03_api_14:
    lda $fa                // A5 FA
    jsr bank03_sub_8E81              // 20 81 8E
    lda #$07               // A9 07
    sta $d3                // 85 D3
    jsr bank03_sub_8362              // 20 62 83
    .byte $54, $41, $52, $47, $45, $54, $00    // data $8EBF  text: "TARGET."
bank03_sub_8EC6:
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $3C, $52, $45, $54, $55, $52, $4E, $3E, $00    // data $8EC9  text: ".<RETURN>."
bank03_sub_8ED3:
    jsr $8590              // 20 90 85
    bcs bank03_sub_8EDD              // B0 05
    cmp #$0d               // C9 0D
    bne bank03_sub_8ED3              // D0 F7
bank03_sub_8EDC:
    rts                    // 60
bank03_sub_8EDD:
    pla                    // 68
    pla                    // 68
    jmp bank03_sub_8985              // 4C 85 89
bank03_api_15:
    lda #$21               // A9 21
    jsr bank03_sub_8CA6              // 20 A6 8C
    bne bank03_sub_8EF1              // D0 08
    lda $1f                // A5 1F
    beq bank03_sub_8F12              // F0 25
    and #$20               // 29 20
    bne bank03_sub_8F15              // D0 24
bank03_sub_8EF1:
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $44, $49, $53, $4B, $43, $4F, $50, $59, $20, $49, $53, $20, $31, $35, $34    // data $8EF4  text: ".DISKCOPY IS 154"
    .byte $31, $20, $4F, $4E, $4C, $59, $2E, $2E, $2E, $0D, $00    // data $8F04  text: "1 ONLY....."
    jmp $8983              // 4C 83 89
bank03_sub_8F12:
    jmp bank03_sub_8C60              // 4C 60 8C
bank03_sub_8F15:
    jsr bank03_sub_8EAA              // 20 AA 8E
    lda $f9                // A5 F9
    sta $ba                // 85 BA   current device
    lda #$00               // A9 00
    sta $fd                // 85 FD
    lda #$0e               // A9 0E
    sta $fe                // 85 FE
    jsr bank03_sub_8FBD              // 20 BD 8F
    ldy #$00               // A0 00
    ldx #$01               // A2 01
bank03_sub_8F2B:
    stx $10                // 86 10
    bit $8c                // 24 8C
    bvs bank03_sub_8F46              // 70 15
    sty $24                // 84 24
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $09, $80         // inline arg: cross-bank call target $8009
    lda $10                // A5 10
    asl                  // 0A
    asl                  // 0A
    tay                    // A8
    lda $0e00,y            // B9 00 0E
    ldy $24                // A4 24
    cmp $13                // C5 13
    beq bank03_sub_8F4C              // F0 06
bank03_sub_8F46:
    iny                    // C8
    lda $10                // A5 10
    sta $0352,y            // 99 52 03
bank03_sub_8F4C:
    ldx $10                // A6 10
    inx                    // E8
    cpx $f8                // E4 F8
    bne bank03_sub_8F2B              // D0 D8
    iny                    // C8
    lda #$ff               // A9 FF
bank03_sub_8F56:
    sta $0352,y            // 99 52 03
    lda #$00               // A9 00
    sta $51                // 85 51
    sta $0352              // 8D 52 03
    inc $51                // E6 51
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $2A, $80         // inline arg: cross-bank call target $802A
    clc                    // 18
    lda $f9                // A5 F9
    jsr bank03_sub_8F9F              // 20 9F 8F
    jsr bank03_sub_8E6E              // 20 6E 8E
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $00, $08         // inline arg: cross-bank call target $0800
    lda $50                // A5 50
    pha                    // 48
    bit $8c                // 24 8C
    bpl b03_8F82           // 10 06
    sec                    // 38
    lda $fa                // A5 FA
    jsr $8f9f              // 20 9F 8F
b03_8F82:
    pla                    // 68
    tax                    // AA
bank03_data_8F74:
bank03_data_8F84:
.errorif (* != $8F84), "bank03_data_8F84 shifted"
    .byte $BD, $52, $03, $30, $08, $86, $51, $20, $70, $8E, $4C, $67, $8F, $20, $AE, $FF    // data $8F84
    .byte $20, $7C, $8C, $D0, $03, $4C, $15, $8F, $4C, $83, $89    // data $8F94
bank03_sub_8F9F:
    sta $ba                // 85 BA   current device
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $9D, $08         // inline arg: cross-bank call target $089D
    bit $8c                // 24 8C
    bpl $8fdb              // 10 31
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $45, $52, $52, $4F, $52, $53, $3A, $00    // data $8FAD  text: ".ERRORS:."
bank03_data_8FB6:
.errorif (* != $8FB6), "bank03_data_8FB6 shifted"
    .byte $A6, $FE, $A9, $00, $4C, $CD, $BD    // data $8FB6
bank03_sub_8FBD:
    jsr bank03_sub_9F02              // 20 02 9F
    .byte $0C, $80         // inline arg: cross-bank call target $800C
    beq bank03_sub_8FD8              // F0 14
    lda #$24               // A9 24
    sta $f8                // 85 F8
    ldx #$0e               // A2 0E
    lda #$12               // A9 12
    ldy #$00               // A0 00
    jsr bank03_sub_9F01              // 20 01 9F
    .byte $27, $80         // inline arg: cross-bank call target $8027
    jsr bank03_sub_8C60              // 20 60 8C
    bcc bank03_sub_8FDB              // 90 03
bank03_sub_8FD8:
    jmp bank03_sub_8EDD              // 4C DD 8E
bank03_sub_8FDB:
    rts                    // 60
bank03_api_24:
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $52, $2F, $53, $20, $2D, $20, $41, $42, $4F, $52, $54, $0D, $20, $5F, $20    // data $8FDF  text: ".R/S - ABORT. _ "
    .byte $20, $2D, $20, $53, $41, $56, $45, $20, $43, $55, $52, $52, $45, $4E, $54, $20    // data $8FEF  text: " - SAVE CURRENT "
    .byte $4D, $4F, $44, $45, $0D, $53, $50, $43, $20, $2D, $20, $54, $4F, $47, $47, $4C    // data $8FFF  text: "MODE.SPC - TOGGL"
    .byte $45, $20, $4D, $4F, $44, $45, $53, $0D, $43, $42, $4D, $20, $2D, $20, $54, $4F    // data $900F  text: "E MODES.CBM - TO"
    .byte $47, $47, $4C, $45, $20, $49, $4E, $54, $45, $52, $4C, $41, $43, $45, $0D, $20    // data $901F  text: "GGLE INTERLACE. "
    .byte $31, $20, $20, $2D, $20, $43, $48, $41, $4E, $47, $45, $20, $42, $47, $20, $43    // data $902F  text: "1  - CHANGE BG C"
    .byte $4F, $4C, $4F, $52, $0D, $0D, $2D, $20, $50, $52, $45, $53, $53, $20, $53, $50    // data $903F  text: "OLOR..- PRESS SP"
    .byte $41, $43, $45, $20, $54, $4F, $20, $53, $54, $41, $52, $54, $20, $2D, $00    // data $904F  text: "ACE TO START -."
bank03_data_9011:
bank03_sub_904A:
    rts                    // 60
bank03_api_20:
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $0D, $20, $41, $2D, $4B, $4F, $41, $4C, $41, $20, $50, $49, $43, $54, $55    // data $9062  text: ".. A-KOALA PICTU"
    .byte $52, $45, $0D, $20, $42, $2D, $42, $49, $54, $4D, $41, $50, $0D, $20, $43, $2D    // data $9072  text: "RE. B-BITMAP. C-"
    .byte $43, $48, $41, $52, $53, $45, $54, $0D, $20, $44, $2D, $53, $43, $52, $45, $45    // data $9082  text: "CHARSET. D-SCREE"
    .byte $4E, $52, $41, $4D, $0D, $20, $45, $2D, $43, $4F, $4C, $4F, $52, $52, $41, $4D    // data $9092  text: "NRAM. E-COLORRAM"
    .byte $0D, $20, $46, $2D, $46, $4C, $49, $2F, $49, $46, $4C, $49, $20, $50, $49, $43    // data $90A2  text: ". F-FLI/IFLI PIC"
    .byte $54, $55, $52, $45, $0D, $20, $47, $2D, $4D, $45, $4D, $4F, $52, $59, $20, $41    // data $90B2  text: "TURE. G-MEMORY A"
    .byte $52, $45, $41, $0D, $00    // data $90C2  text: "REA.."
    rts                    // 60
bank03_data_909F:
bank03_sub_90B8:
bank03_api_00:
    jsr bank03_api_07              // 20 F6 90
    tya                    // 98
bank03_sub_90CC:
    sta $0255,y            // 99 55 02
    iny                    // C8
    cpy #$52               // C0 52
    bne bank03_sub_90CC              // D0 F8
    ldx #$02               // A2 02
bank03_sub_90D6:
    sta $00,x              // 95 00
    inx                    // E8
    bne bank03_sub_90D6              // D0 FB
    lda #$64               // A9 64
    sta $0255              // 8D 55 02
    lda #$0a               // A9 0A
    sta $0257              // 8D 57 02
    lda #$3c               // A9 3C
    sta $b2                // 85 B2
    lda #$03               // A9 03
    sta $b3                // 85 B3
    ldy #$a0               // A0 A0
    jsr $fd8d              // 20 8D FD
    asl                  // 0A
    sta $ba                // 85 BA   current device
    rts                    // 60
bank03_api_07:
    ldy #$20               // A0 20
bank03_sub_90F8:
    lda $fd2f,y            // B9 2F FD
    sta $0313,y            // 99 13 03
    dey                    // 88
    bne bank03_sub_90F8              // D0 F7
    rts                    // 60
bank03_api_10:
    sei                    // 78
    cld                    // D8
    lda #$00               // A9 00
    sta $d016              // 8D 16 D0   VIC control 2 (XSCROLL, 38/40col)
    ldx #$a7               // A2 A7
bank03_sub_910B:
    sta $0200,x            // 9D 00 02   BASIC input buffer
    inx                    // E8
    bne bank03_sub_910B              // D0 FA
bank03_sub_9111:
    sta $0300,x            // 9D 00 03   IERROR vector
    inx                    // E8
    bne bank03_sub_9111              // D0 FA
    jsr bank03_api_00              // 20 C8 90
    jsr $fda3              // 20 A3 FD   KERNAL IOINIT guts
    jsr $ff5b              // 20 5B FF   KERNAL CINT guts (video init)
    inc $c5                // E6 C5   last key
    ldx #$29               // A2 29
bank03_sub_9124:
    lda $9130,x            // BD 30 91
    sta $0210,x            // 9D 10 02
    dex                    // CA
    bpl bank03_sub_9124              // 10 F7
    jmp $0210              // 4C 10 02
bank03_data_9130:
.errorif (* != $9130), "bank03_data_9130 shifted"
    .byte $A9, $0E, $8D, $00, $DE, $58, $20, $53, $E4, $A2, $03, $BD, $00, $08, $9D, $0A    // data $9130
    .byte $02, $CA, $10, $F7, $20, $BF, $E3, $20, $22, $E4, $A2, $03, $BD, $0A, $02, $9D    // data $9140
    .byte $00, $08, $CA, $10, $F7, $68, $4C, $86, $E3    // data $9150
bank03_api_17:
    jsr $a57c              // 20 7C A5
    jsr bank03_sub_920B              // 20 0B 92
    lda #$ff               // A9 FF
    sta $52                // 85 52
    sta $53                // 85 53
    ldy #$00               // A0 00
    lda $2b                // A5 2B   BASIC prog start lo
    sta $20                // 85 20
    lda $2c                // A5 2C   BASIC prog start hi
    sta $21                // 85 21
    jmp bank03_sub_919B              // 4C 9B 91
bank03_sub_9172:
    lda ($7a),y            // B1 7A
    beq bank03_sub_91BC              // F0 46
    lda ($20),y            // B1 20
    beq bank03_sub_9183              // F0 09
    lda ($7a),y            // B1 7A
    cmp ($20),y            // D1 20
    bne bank03_sub_9183              // D0 03
    iny                    // C8
    bne bank03_sub_9172              // D0 EF
bank03_sub_9183:
    jsr bank03_sub_9212              // 20 12 92
    ldy #$00               // A0 00
    lda ($20),y            // B1 20
    bne bank03_sub_9172              // D0 E6
    jsr bank03_sub_9212              // 20 12 92
    ldy #$00               // A0 00
    sty $ae                // 84 AE   load end addr lo
    lda ($20),y            // B1 20
    bne bank03_sub_919B              // D0 04
    lda #$01               // A9 01
    sta $ae                // 85 AE   load end addr lo
bank03_sub_919B:
    jsr bank03_sub_9212              // 20 12 92
    lda ($20),y            // B1 20
    bne bank03_sub_91A9              // D0 07
    lda $ae                // A5 AE   load end addr lo
    cmp #$01               // C9 01
    bne bank03_sub_91A9              // D0 01
    rts                    // 60
bank03_sub_91A9:
    jsr bank03_sub_9212              // 20 12 92
    lda ($20),y            // B1 20
    sta $50                // 85 50
    jsr bank03_sub_9212              // 20 12 92
    lda ($20),y            // B1 20
    sta $51                // 85 51
    jsr bank03_sub_9212              // 20 12 92
    bne bank03_sub_9172              // D0 B6
bank03_sub_91BC:
    lda $50                // A5 50
    cmp $52                // C5 52
    bne bank03_sub_91C8              // D0 06
    lda $51                // A5 51
    cmp $53                // C5 53
    beq bank03_sub_9183              // F0 BB
bank03_sub_91C8:
    lda $50                // A5 50
    sta $52                // 85 52
    sta $63                // 85 63
    lda $51                // A5 51
    sta $62                // 85 62
    sta $53                // 85 53
    ldx #$90               // A2 90
    sec                    // 38
    jsr $bc49              // 20 49 BC
    jsr $bddf              // 20 DF BD
    jsr bank03_sub_91FD              // 20 FD 91
    sec                    // 38
    jsr $fff0              // 20 F0 FF   KERNAL PLOT: set/get cursor
    tya                    // 98
bank03_sub_91E5:
    sbc #$0a               // E9 0A
    bcs bank03_sub_91E5              // B0 FC
    eor #$ff               // 49 FF
    adc #$01               // 69 01
    tax                    // AA
    inx                    // E8
bank03_sub_91EF:
    dex                    // CA
    bne bank03_sub_91F5              // D0 03
    jmp bank03_sub_9183              // 4C 83 91
bank03_sub_91F5:
    lda #$20               // A9 20
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    jmp bank03_sub_91EF              // 4C EF 91
bank03_sub_91FD:
    ldx #$00               // A2 00
bank03_sub_91FF:
    lda $0100,x            // BD 00 01
    beq bank03_sub_920A              // F0 06
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    inx                    // E8
    bne bank03_sub_91FF              // D0 F5
bank03_sub_920A:
    rts                    // 60
bank03_sub_920B:
    inc $7a                // E6 7A   TXTPTR lo
    bne bank03_sub_9211              // D0 02
    inc $7b                // E6 7B   TXTPTR hi
bank03_sub_9211:
    rts                    // 60
bank03_sub_9212:
    inc $20                // E6 20
    bne bank03_sub_9218              // D0 02
    inc $21                // E6 21
bank03_sub_9218:
    rts                    // 60
bank03_api_16:
    lda #$00               // A9 00
    sta $51                // 85 51
    sta $52                // 85 52
    lda #$ff               // A9 FF
    sta $3d                // 85 3D
    bne bank03_sub_922B              // D0 06
    lda $14                // A5 14
    sta $3d                // 85 3D
    lda $15                // A5 15
bank03_sub_922B:
    sta $3e                // 85 3E
    sei                    // 78
    jsr $a68e              // 20 8E A6
bank03_sub_9231:
    ldy #$02               // A0 02
    lda ($7a),y            // B1 7A
    bne bank03_sub_923A              // D0 03
    jmp bank03_sub_938E              // 4C 8E 93
bank03_sub_923A:
    ldy #$04               // A0 04
    jsr $a8fb              // 20 FB A8
bank03_sub_923F:
    jsr $0073              // 20 73 00
bank03_sub_9242:
    jsr bank03_sub_93F5              // 20 F5 93
    cmp #$00               // C9 00
    beq bank03_sub_9231              // F0 E8
    cmp #$cb               // C9 CB
    beq bank03_sub_926C              // F0 1F
    cmp #$89               // C9 89
    beq bank03_sub_9273              // F0 22
    cmp #$8d               // C9 8D
    beq bank03_sub_9273              // F0 1E
    cmp #$a7               // C9 A7
    beq bank03_sub_9261              // F0 08
    cmp #$8a               // C9 8A
    beq bank03_sub_9261              // F0 04
    cmp #$9b               // C9 9B
    bne bank03_sub_923F              // D0 DE
bank03_sub_9261:
    jsr $0073              // 20 73 00
    bcc bank03_sub_9276              // 90 10
bank03_sub_9266:
    cmp #$ab               // C9 AB
    beq bank03_sub_9273              // F0 09
    bne bank03_sub_9242              // D0 D6
bank03_sub_926C:
    jsr $0073              // 20 73 00
    cmp #$a4               // C9 A4
    bne bank03_sub_923F              // D0 CC
bank03_sub_9273:
    jsr $0073              // 20 73 00
bank03_sub_9276:
    ldx $7a                // A6 7A   TXTPTR lo
    stx $8d                // 86 8D
    ldx $7b                // A6 7B   TXTPTR hi
    stx $8e                // 86 8E
    jsr $a96b              // 20 6B A9
    lda $14                // A5 14
    sta $fb                // 85 FB
    lda $15                // A5 15
    sta $fc                // 85 FC
    jsr bank03_sub_9295              // 20 95 92
    jsr $0079              // 20 79 00
    cmp #$2c               // C9 2C
    beq bank03_sub_9273              // F0 E0
    bne bank03_sub_9266              // D0 D1
bank03_sub_9295:
    jsr bank03_sub_93E2              // 20 E2 93
bank03_sub_9298:
    ldy #$01               // A0 01
    lda ($5f),y            // B1 5F
    beq bank03_sub_92CC              // F0 2E
    iny                    // C8
    jsr bank03_sub_9411              // 20 11 94
    cmp $3e                // C5 3E
    bne bank03_sub_92AA              // D0 04
    cpx $3d                // E4 3D
    beq bank03_sub_92AC              // F0 02
bank03_sub_92AA:
    bcs bank03_sub_92CC              // B0 20
bank03_sub_92AC:
    cmp $fc                // C5 FC
    bne bank03_sub_92B4              // D0 04
    cpx $fb                // E4 FB
    beq bank03_sub_92CD              // F0 19
bank03_sub_92B4:
    bcs bank03_sub_92CC              // B0 16
    lda $02                // A5 02
    adc $8b                // 65 8B
    sta $8b                // 85 8B
    bcc bank03_sub_92C0              // 90 02
    inc $8c                // E6 8C
bank03_sub_92C0:
    ldy #$00               // A0 00
    jsr bank03_sub_9411              // 20 11 94
    stx $5f                // 86 5F
    sta $60                // 85 60
    jmp bank03_sub_9298              // 4C 98 92
bank03_sub_92CC:
    rts                    // 60
bank03_sub_92CD:
    lda $8b                // A5 8B
    sta $63                // 85 63
    lda $8c                // A5 8C
    sta $62                // 85 62
    ldx #$90               // A2 90
    sec                    // 38
    jsr $bc49              // 20 49 BC
    jsr $bddf              // 20 DF BD
    ldy #$ff               // A0 FF
bank03_sub_92E0:
    iny                    // C8
    lda $0100,y            // B9 00 01
    bne bank03_sub_92E0              // D0 FA
    sty $8f                // 84 8F
    lda $7a                // A5 7A   TXTPTR lo
    sec                    // 38
    sbc $8d                // E5 8D
    sec                    // 38
    sbc $8f                // E5 8F
    bne bank03_sub_92F5              // D0 03
    jmp bank03_sub_9372              // 4C 72 93
bank03_sub_92F5:
    bcc bank03_sub_9341              // 90 4A
    sta $ab                // 85 AB
    lda $7a                // A5 7A   TXTPTR lo
    sta $3b                // 85 3B
    sbc $ab                // E5 AB
    sta $39                // 85 39
    lda $7b                // A5 7B   TXTPTR hi
    sta $3c                // 85 3C
    sbc #$00               // E9 00
    sta $3a                // 85 3A
    pha                    // 48
    sec                    // 38
    lda $2d                // A5 2D   BASIC vars start lo
    sbc $7a                // E5 7A   TXTPTR lo
    sta $a9                // 85 A9
    lda $2e                // A5 2E   BASIC vars start hi
    sbc $7b                // E5 7B   TXTPTR hi
    sta $aa                // 85 AA
    ldy #$00               // A0 00
    ldx $aa                // A6 AA
    beq bank03_sub_932B              // F0 0E
bank03_sub_931D:
    lda ($3b),y            // B1 3B
    sta ($39),y            // 91 39
    iny                    // C8
    bne bank03_sub_931D              // D0 F9
    inc $3c                // E6 3C
    inc $3a                // E6 3A
    dex                    // CA
    bne bank03_sub_931D              // D0 F2
bank03_sub_932B:
    ldx $a9                // A6 A9
    beq bank03_sub_9337              // F0 08
bank03_sub_932F:
    lda ($3b),y            // B1 3B
    sta ($39),y            // 91 39
    iny                    // C8
    dex                    // CA
    bne bank03_sub_932F              // D0 F8
bank03_sub_9337:
    lda $39                // A5 39
    sta $7a                // 85 7A   TXTPTR lo
    pla                    // 68
    sta $7b                // 85 7B   TXTPTR hi
    jmp bank03_sub_9372              // 4C 72 93
bank03_sub_9341:
    sec                    // 38
    sta $ab                // 85 AB
    lda #$00               // A9 00
    sbc $ab                // E5 AB
    sta $ab                // 85 AB
    adc $2d                // 65 2D   BASIC vars start lo
    sta $58                // 85 58
    lda $2e                // A5 2E   BASIC vars start hi
    sta $5b                // 85 5B
    adc #$00               // 69 00
    sta $59                // 85 59
    lda $2d                // A5 2D   BASIC vars start lo
    sta $5a                // 85 5A
    lda $7a                // A5 7A   TXTPTR lo
    sta $5f                // 85 5F
    clc                    // 18
    adc $ab                // 65 AB
    pha                    // 48
    lda $7b                // A5 7B   TXTPTR hi
    sta $60                // 85 60
    adc #$00               // 69 00
    pha                    // 48
    jsr $a3bf              // 20 BF A3
    pla                    // 68
    sta $7b                // 85 7B   TXTPTR hi
    pla                    // 68
    sta $7a                // 85 7A   TXTPTR lo
bank03_sub_9372:
    ldy $8f                // A4 8F
    dey                    // 88
bank03_sub_9375:
    lda $0100,y            // B9 00 01
    sta ($8d),y            // 91 8D
    dey                    // 88
    bpl bank03_sub_9375              // 10 F8
    jsr $a533              // 20 33 A5
    lda $22                // A5 22
    clc                    // 18
    adc #$02               // 69 02
    sta $2d                // 85 2D   BASIC vars start lo
    lda $23                // A5 23
    adc #$00               // 69 00
    sta $2e                // 85 2E   BASIC vars start hi
    rts                    // 60
bank03_sub_938E:
    jsr bank03_sub_93E2              // 20 E2 93
bank03_sub_9391:
    ldy #$01               // A0 01
    lda ($5f),y            // B1 5F
    bne bank03_sub_93B6              // D0 1F
bank03_sub_9397:
    lda $37                // A5 37   BASIC mem top lo
    ldy $38                // A4 38   BASIC mem top hi
    sta $33                // 85 33
    sty $34                // 84 34
    lda $2d                // A5 2D   BASIC vars start lo
    ldy $2e                // A4 2E   BASIC vars start hi
    sta $2f                // 85 2F
    sty $30                // 84 30
    sta $31                // 85 31
    sty $32                // 84 32
    jsr $a81d              // 20 1D A8
    ldx #$19               // A2 19
    stx $16                // 86 16
    jmp $a687              // 4C 87 A6
bank03_data_93B5:
.errorif (* != $93B5), "bank03_data_93B5 shifted"
    .byte $60    // data $93B5
bank03_sub_93B6:
    iny                    // C8
    jsr bank03_sub_9411              // 20 11 94
    cmp $3e                // C5 3E
    bne bank03_sub_93C2              // D0 04
    cpx $3d                // E4 3D
    beq bank03_sub_93C4              // F0 02
bank03_sub_93C2:
    bcs bank03_sub_9397              // B0 D3
bank03_sub_93C4:
    lda $8c                // A5 8C
    sta ($5f),y            // 91 5F
    dey                    // 88
    lda $8b                // A5 8B
    sta ($5f),y            // 91 5F
    clc                    // 18
    adc $02                // 65 02
    sta $8b                // 85 8B
    bcc bank03_sub_93D6              // 90 02
    inc $8c                // E6 8C
bank03_sub_93D6:
    ldy #$00               // A0 00
    jsr bank03_sub_9411              // 20 11 94
    stx $5f                // 86 5F
    sta $60                // 85 60
    jmp bank03_sub_9391              // 4C 91 93
bank03_sub_93E2:
    lda $fd                // A5 FD
    sta $8b                // 85 8B
    lda $fe                // A5 FE
    sta $8c                // 85 8C
    lda $51                // A5 51
    sta $14                // 85 14
    lda $52                // A5 52
    sta $15                // 85 15
    jmp $a613              // 4C 13 A6
bank03_sub_93F5:
    cmp #$8f               // C9 8F
    beq $9404              // F0 0B
    cmp #$22               // C9 22
    beq bank03_sub_9406              // F0 09
    cmp #$83               // C9 83
    bne bank03_sub_9410              // D0 0F
    lda #$3a               // A9 3A
    bit.abs $00a9              // 2C A9 00
bank03_sub_9406:
    tax                    // AA
    jsr $a90b              // 20 0B A9
    jsr $a8fb              // 20 FB A8
    jsr $0079              // 20 79 00
bank03_sub_9410:
    rts                    // 60
bank03_sub_9411:
    lda ($5f),y            // B1 5F
    tax                    // AA
    iny                    // C8
    lda ($5f),y            // B1 5F
    rts                    // 60
bank03_api_31:
    ldy #$01               // A0 01
    tya                    // 98
    sta ($2b),y            // 91 2B
    jsr bank03_api_23              // 20 58 9F
    lda $22                // A5 22
    ldy $23                // A4 23
    clc                    // 18
    adc #$02               // 69 02
    bcc bank03_sub_942A              // 90 01
    iny                    // C8
bank03_sub_942A:
    sta $2d                // 85 2D   BASIC vars start lo
    sty $2e                // 84 2E   BASIC vars start hi
    rts                    // 60
bank03_api_28:
    jsr bank03_api_29              // 20 73 94
    tya                    // 98
    ldy #$01               // A0 01
    sta ($c1),y            // 91 C1
    txa                    // 8A
    dey                    // 88
    sta ($c1),y            // 91 C1
    sty $0200              // 8C 00 02   BASIC input buffer
    lda $c1                // A5 C1   I/O start addr lo
    sta $5f                // 85 5F
    lda $c2                // A5 C2   I/O start addr hi
    sta $60                // 85 60
    lda $0302              // AD 02 03   IMAIN vector (BASIC idle loop)
    sta $c1                // 85 C1   I/O start addr lo
    lda $0303              // AD 03 03
    sta $c2                // 85 C2   I/O start addr hi
    rts                    // 60
bank03_api_30:
    lda $c2                // A5 C2   I/O start addr hi
    sta $0303              // 8D 03 03
    lda $c1                // A5 C1   I/O start addr lo
    sta $0302              // 8D 02 03   IMAIN vector (BASIC idle loop)
    lda #$08               // A9 08
    ldy #$01               // A0 01
    sta ($2b),y            // 91 2B
    jsr bank03_api_23              // 20 58 9F
    lda $22                // A5 22
    ldy $23                // A4 23
    clc                    // 18
    adc #$02               // 69 02
    bcc bank03_sub_946E              // 90 01
    iny                    // C8
bank03_sub_946E:
    sta $2d                // 85 2D   BASIC vars start lo
    sty $2e                // 84 2E   BASIC vars start hi
    rts                    // 60
bank03_api_29:
    bcs bank03_sub_94C2              // B0 4D
    jsr $a96b              // 20 6B A9
    jsr $a613              // 20 13 A6
    ldx $5f                // A6 5F
    ldy $60                // A4 60
    stx $c1                // 86 C1   I/O start addr lo
    sty $c2                // 84 C2   I/O start addr hi
    jsr $0079              // 20 79 00
    cmp #$2d               // C9 2D
    bne bank03_sub_94C2              // D0 38
    jsr $0073              // 20 73 00
    bne bank03_sub_94A0              // D0 11
    lda $2d                // A5 2D   BASIC vars start lo
    sec                    // 38
    sbc #$02               // E9 02
    tax                    // AA
    sta $5f                // 85 5F
    lda $2e                // A5 2E   BASIC vars start hi
    sbc #$00               // E9 00
    tay                    // A8
    sta $60                // 85 60
    bne bank03_sub_94B7              // D0 17
bank03_sub_94A0:
    jsr $a96b              // 20 6B A9
    bne bank03_sub_94C2              // D0 1D
    jsr $a613              // 20 13 A6
    ldx $5f                // A6 5F
    ldy $60                // A4 60
    bcc bank03_sub_94B7              // 90 09
    ldy #$00               // A0 00
    lda ($5f),y            // B1 5F
    tax                    // AA
    iny                    // C8
    lda ($5f),y            // B1 5F
    tay                    // A8
bank03_sub_94B7:
    lda $c1                // A5 C1   I/O start addr lo
    cmp $5f                // C5 5F
    lda $c2                // A5 C2   I/O start addr hi
    sbc $60                // E5 60
    bcs bank03_sub_94C2              // B0 01
    rts                    // 60
bank03_sub_94C2:
    jmp $af08              // 4C 08 AF
bank03_api_22:
    jsr $e544              // 20 44 E5   KERNAL clear screen
bank03_sub_94C8:
    jsr bank03_sub_8362              // 20 62 83
    .byte $43, $55, $52, $52, $45, $4E, $54, $4C, $59, $20, $4F, $55, $54, $20, $4F, $46    // data $94CB  text: "CURRENTLY OUT OF"
    .byte $20, $4F, $52, $44, $45, $52, $2E, $2E, $2E, $0D, $0D, $0D, $00    // data $94DB  text: " ORDER......."
    jmp $857f              // 4C 7F 85
bank03_data_94D5:
bank03_api_06:
    jsr $e544              // 20 44 E5   KERNAL clear screen
    jsr bank03_sub_8362              // 20 62 83
    .byte $59, $4F, $55, $20, $57, $49, $53, $48, $20, $2E, $2E, $2E, $0D, $00    // data $94F1  text: "YOU WISH ....."
    jmp bank03_api_18              // 4C 7F 85
bank03_api_25:
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $0D, $0D, $01, $46, $31, $2A, $43, $4F, $4E, $46, $49, $47, $55, $52, $45    // data $9505  text: "....F1*CONFIGURE"
    .byte $20, $4D, $45, $4D, $4F, $52, $59, $0D, $01, $46, $33, $2A, $4E, $4F, $52, $4D    // data $9515  text: " MEMORY..F3*NORM"
    .byte $41, $4C, $20, $52, $45, $53, $45, $54, $0D, $01, $46, $35, $2A, $55, $54, $49    // data $9525  text: "AL RESET..F5*UTI"
    .byte $4C, $49, $54, $49, $45, $53, $0D, $01, $46, $37, $2A, $49, $4E, $53, $54, $41    // data $9535  text: "LITIES..F7*INSTA"
    .byte $4C, $4C, $20, $46, $41, $53, $54, $4C, $4F, $41, $44, $00    // data $9545  text: "LL FASTLOAD."
bank03_data_9549:
    bit $de01              // 2C 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    bvc b03_957E           // 50 28
    jsr $8362              // 20 62 83
    .byte $0D, $0D, $0D, $0D, $20, $20, $20, $20, $20, $20, $20, $52, $45, $55, $20, $43    // data $9559  text: "....       REU C"
    .byte $4F, $4D, $50, $41, $54, $49, $42, $49, $4C, $49, $54, $59, $20, $45, $4E, $41    // data $9569  text: "OMPATIBILITY ENA"
    .byte $42, $4C, $45, $44, $00    // data $9579  text: "BLED."
b03_957E:
    jsr $8362              // 20 62 83
    .byte $0D, $0D, $20, $20, $20, $20, $53, $49, $4C, $56, $45, $52, $53, $55, $52, $46    // data $9581  text: "..    SILVERSURF"
    .byte $45, $52, $20, $00    // data $9591  text: "ER ."
    lda $de01              // AD 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    ora #$01               // 09 01
    sta $de01              // 8D 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    lda #$ff               // A9 FF
    sta $de0f              // 8D 0F DE
    lda $de0f              // AD 0F DE
    cmp #$ff               // C9 FF
    bne b03_95BF           // D0 16
    jsr $8362              // 20 62 83
    .byte $46, $4F, $55, $4E, $44, $20, $2D, $20, $45, $4E, $41, $42, $4C, $45, $44, $00    // data $95AC  text: "FOUND - ENABLED."
    jmp b03_95D7           // 4C D7 95
b03_95BF:
    jsr $8362              // 20 62 83
    .byte $4E, $4F, $54, $20, $46, $4F, $55, $4E, $44, $20, $2D, $20, $44, $49, $53, $41    // data $95C2  text: "NOT FOUND - DISA"
    .byte $42, $4C, $45, $44, $00    // data $95D2  text: "BLED."
b03_95D7:
    lda $de01              // AD 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    and #$fe               // 29 FE
    sta $de01              // 8D 01 DE   RR ext control: b1 AllowBank,b2 NoFreeze,b6 REU-compat map
    ldx #$18               // A2 18
    ldy #$00               // A0 00
    jsr $8576              // 20 76 85
    lda $02a6              // AD A6 02
    beq b03_95F6           // F0 0B
    jsr $8362              // 20 62 83
    .byte $50, $41, $4C, $20, $00    // data $95EE  text: "PAL ."
    jmp b03_95FF           // 4C FF 95
b03_95F6:
    jsr $8362              // 20 62 83
    .byte $4E, $54, $53, $43, $20, $00    // data $95F9  text: "NTSC ."
b03_95FF:
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    lda $01                // A5 01   CPU port: mem banking
    cmp #$77               // C9 77
    beq b03_9613           // F0 0A
    jsr $8362              // 20 62 83
    .byte $43, $36, $34, $00    // data $960C  text: "C64."
    jmp b03_961B           // 4C 1B 96
b03_9613:
    jsr $8362              // 20 62 83
    .byte $43, $31, $32, $38, $00    // data $9616  text: "C128."
b03_961B:
    ldx #$18               // A2 18
    ldy #$1b               // A0 1B
    jsr $8576              // 20 76 85
    jsr $8362              // 20 62 83
    .byte $20, $50, $41, $4C, $20, $36, $34, $4B, $42, $20, $52, $4F, $00    // data $9625  text: " PAL 64KB RO."
    lda $02a6              // AD A6 02
    bne b03_964D           // D0 16
    ldx #$18               // A2 18
    ldy #$10               // A0 10
    jsr $8576              // 20 76 85
    jsr $8362              // 20 62 83
    .byte $96, $3C, $57, $41, $52, $4E, $49, $4E, $47, $21, $3E, $00    // data $9641  text: ".<WARNING!>."
b03_964D:
    lda #$0d               // A9 0D
    sta $07e7              // 8D E7 07
    lda #$06               // A9 06
    sta $d9ff              // 8D FF D9
    rts                    // 60
bank03_api_26:
    jsr bank03_sub_8362              // 20 62 83
    .byte $20, $46, $31, $2A, $42, $41, $43, $4B, $55, $50, $20, $20, $46, $33, $2A, $52    // data $965B  text: " F1*BACKUP  F3*R"
    .byte $45, $53, $54, $41, $52, $54, $20, $20, $46, $37, $2A, $53, $43, $52, $45, $45    // data $966B  text: "ESTART  F7*SCREE"
    .byte $4E, $0D, $0D, $0D, $20, $4D, $2A, $4D, $4F, $4E, $49, $54, $4F, $52, $02, $0B    // data $967B  text: "N... M*MONITOR.."
    .byte $45, $2A, $50, $4F, $4B, $45, $53, $0D, $20, $44, $2A, $44, $49, $52, $45, $43    // data $968B  text: "E*POKES. D*DIREC"
    .byte $54, $4F, $52, $59, $02, $09, $58, $2A, $50, $4F, $4B, $45, $46, $49, $4E, $44    // data $969B  text: "TORY..X*POKEFIND"
    .byte $45, $52, $0D, $20, $54, $2A, $45, $44, $49, $54, $20, $53, $43, $52, $45, $45    // data $96AB  text: "ER. T*EDIT SCREE"
    .byte $4E, $02, $07, $4B, $2A, $53, $50, $52, $49, $54, $45, $4B, $49, $4C, $4C, $45    // data $96BB  text: "N..K*SPRITEKILLE"
    .byte $52, $0D, $20, $56, $2A, $45, $44, $49, $54, $20, $53, $50, $52, $49, $54, $45    // data $96CB  text: "R. V*EDIT SPRITE"
    .byte $53, $02, $06, $4C, $2A, $54, $55, $52, $42, $4F, $20, $4C, $49, $4E, $4B, $45    // data $96DB  text: "S..L*TURBO LINKE"
    .byte $52, $0D, $20, $43, $2A, $45, $44, $49, $54, $20, $43, $48, $41, $52, $53, $45    // data $96EB  text: "R. C*EDIT CHARSE"
    .byte $54, $02, $05, $20, $50, $2A, $50, $41, $52, $41, $4D, $45, $54, $45, $52, $53    // data $96FB  text: "T.. P*PARAMETERS"
    .byte $0D, $20, $53, $2A, $53, $41, $56, $45, $4C, $41, $4E, $44, $0D, $0D, $0D, $00    // data $970B  text: ". S*SAVELAND...."
bank03_data_96CC:
bank03_sub_96DE:
bank03_data_96E1:
bank03_sub_96F4:
    rts                    // 60
bank03_api_27:
    jsr bank03_sub_8362              // 20 62 83
    .byte $43, $4F, $4C, $4C, $49, $53, $49, $4F, $4E, $20, $54, $59, $50, $45, $3A, $0D    // data $971F  text: "COLLISION TYPE:."
    .byte $0D, $02, $0C, $41, $2A, $53, $50, $52, $49, $54, $45, $2F, $53, $50, $52, $49    // data $972F  text: "...A*SPRITE/SPRI"
    .byte $54, $45, $20, $24, $44, $30, $31, $45, $0D, $02, $0C, $42, $2A, $53, $50, $52    // data $973F  text: "TE $D01E...B*SPR"
    .byte $49, $54, $45, $2F, $42, $43, $4B, $47, $52, $44, $20, $24, $44, $30, $31, $46    // data $974F  text: "ITE/BCKGRD $D01F"
    .byte $0D, $02, $0C, $43, $2A, $42, $4F, $54, $48, $00    // data $975F  text: "...C*BOTH."
bank03_data_9724:
bank03_sub_972B:
bank03_sub_9744:
bank03_data_9769:
.errorif (* != $9769), "bank03_data_9769 shifted"
    .byte $60, $00, $00, $00, $00, $00, $00, $00, $00    // data $9769
bank03_sub_9772:
    brk                    // 00
bank03_data_9773:
.errorif (* != $9773), "bank03_data_9773 shifted"
    .byte $00, $00, $00, $00    // data $9773
bank03_sub_9777:
    brk                    // 00
bank03_data_9778:
.errorif (* != $9778), "bank03_data_9778 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9778
    .byte $00    // data $9788
bank03_sub_9789:
    brk                    // 00
bank03_data_978A:
.errorif (* != $978A), "bank03_data_978A shifted"
    .byte $00, $00, $00, $00, $00    // data $978A
bank03_sub_978F:
    brk                    // 00
bank03_sub_9790:
    brk                    // 00
bank03_data_9791:
.errorif (* != $9791), "bank03_data_9791 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9791
bank03_sub_97A1:
    brk                    // 00
bank03_data_97A2:
.errorif (* != $97A2), "bank03_data_97A2 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97A2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97B2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97C2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97D2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97E2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97F2
    .byte $FF    // FF  undocumented/illegal at $9800
    beq b03_9808           // F0 05
    ldx #$10               // A2 10
    jmp $bef9              // 4C F9 BE
b03_9808:
    ldy #$04               // A0 04
    lda $b332              // AD 32 B3
    sta ($4b),y            // 91 4B
    iny                    // C8
    lda $b333              // AD 33 B3
    sta ($4b),y            // 91 4B
    rts                    // 60
    lda #$00               // A9 00
    sta $b31a              // 8D 1A B3
    lda #$06               // A9 06
    jsr $c594              // 20 94 C5
    lda #$ff               // A9 FF
    jsr $c5b4              // 20 B4 C5
    lda $b323              // AD 23 B3
    jsr $c5b4              // 20 B4 C5
    lda $b324              // AD 24 B3
    jsr $c5b4              // 20 B4 C5
    lda $b332              // AD 32 B3
    jsr $c5b4              // 20 B4 C5
    lda $b333              // AD 33 B3
    jmp $c5b4              // 4C B4 C5
    lda $b311              // AD 11 B3
    beq b03_9847           // F0 05
    ldx #$0f               // A2 0F
    jmp $bef9              // 4C F9 BE
b03_9847:
    lda $b2ff              // AD FF B2
    beq b03_9851           // F0 05
    ldx #$07               // A2 07
    jmp $befc              // 4C FC BE
b03_9851:
    lda $b339              // AD 39 B3
    beq b03_985F           // F0 09
    lda $cb06              // AD 06 CB
    ldx $cb07              // AE 07 CB
    jmp $bea2              // 4C A2 BE
b03_985F:
    rts                    // 60
    jsr $c137              // 20 37 C1
    lda $b333              // AD 33 B3
    sta $cb09              // 8D 09 CB
    lda $b332              // AD 32 B3
    sta $cb08              // 8D 08 CB
    cmp $cb06              // CD 06 CB
    lda $b333              // AD 33 B3
    sbc $cb07              // ED 07 CB
    bcc b03_987F           // 90 05
    ldx #$12               // A2 12
    jmp $bef9              // 4C F9 BE
b03_987F:
    jmp $8003              // 4C 03 80
    bit $b339              // 2C 39 B3
    bmi b03_989A           // 30 13
    jsr $c2ad              // 20 AD C2
    lda $b333              // AD 33 B3
    beq b03_9894           // F0 05
    ldx #$03               // A2 03
    jsr $befc              // 20 FC BE
b03_9894:
    lda $b332              // AD 32 B3
    sta $b347              // 8D 47 B3
b03_989A:
    rts                    // 60
    lda #$01               // A9 01
    sta $b6e1              // 8D E1 B6
    lda #$2c               // A9 2C
    sta $c90c              // 8D 0C C9
    lda #$ea               // A9 EA
    sta $c90f              // 8D 0F C9
    bne b03_98E7           // D0 3B
    ldx #$00               // A2 00
    stx $b6e1              // 8E E1 B6
    lda #$ea               // A9 EA
    sta $c90c              // 8D 0C C9
    lda #$2c               // A9 2C
    sta $c90f              // 8D 0F C9
b03_98BB:
    lda #$00               // A9 00
    sta $df02              // 8D 02 DF   REU C64 base lo
    sta $df04              // 8D 04 DF   REU addr lo
    sta $df07              // 8D 07 DF   REU length lo
    lda #$ca               // A9 CA
    sta $df03              // 8D 03 DF   REU C64 base hi
    lda #$01               // A9 01
    sta $df08              // 8D 08 DF   REU length hi
    stx $df05              // 8E 05 DF   REU addr hi
    lda $8006              // AD 06 80
    sta $df06              // 8D 06 DF   REU bank
    jsr $c927              // 20 27 C9
    lda #$00               // A9 00
    sta $df06              // 8D 06 DF   REU bank
    jsr $c92a              // 20 2A C9
    inx                    // E8
    bne b03_98BB           // D0 D4
b03_98E7:
    lda #$00               // A9 00
    sta $cb23              // 8D 23 CB
    lda #$00               // A9 00
    sta $cb24              // 8D 24 CB
    jmp $b2cf              // 4C CF B2
    lda #$c0               // A9 C0
    sta $df02              // 8D 02 DF   REU C64 base lo
    lda #$02               // A9 02
    sta $df03              // 8D 03 DF   REU C64 base hi
    lda $3b                // A5 3B
    sta $df04              // 8D 04 DF   REU addr lo
    lda $3c                // A5 3C
    sta $df05              // 8D 05 DF   REU addr hi
    iny                    // C8
    sty $df07              // 8C 07 DF   REU length lo
    nop                    // EA
    ldy #$00               // A0 00
    nop                    // EA
    ldy $8006              // AC 06 80
    sty $df06              // 8C 06 DF   REU bank
    sty $df08              // 8C 08 DF   REU length hi
    lda #$00               // A9 00
    sta $d030              // 8D 30 D0
    jsr $c92a              // 20 2A C9
    lda #$fd               // A9 FD
    sta $d030              // 8D 30 D0
    rts                    // 60
    lda #$ed               // A9 ED
    bit $eca9              // 2C A9 EC
    sta $df01              // 8D 01 DF   REU command (b7=execute)
    sei                    // 78
    inc $01                // E6 01   CPU port: mem banking
    lda $ff00              // AD 00 FF
    sta $ff00              // 8D 00 FF
    dec $01                // C6 01   CPU port: mem banking
    rts                    // 60
    sei                    // 78
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    ldx #$31               // A2 31
    ldy #$ea               // A0 EA
    stx $0314              // 8E 14 03   CINV IRQ vector
    sty $0315              // 8C 15 03
    jsr $ff81              // 20 81 FF   KERNAL CINT: init screen
    jsr $ff84              // 20 84 FF   KERNAL IOINIT: init CIAs/IRQ
    lda #$00               // A9 00
    sta $df06              // 8D 06 DF   REU bank
    sta $df02              // 8D 02 DF   REU C64 base lo
    sta $df04              // 8D 04 DF   REU addr lo
    sta $df07              // 8D 07 DF   REU length lo
    lda #$08               // A9 08
    sta $df03              // 8D 03 DF   REU C64 base hi
    sta $df05              // 8D 05 DF   REU addr hi
    lda #$f8               // A9 F8
    sta $df08              // 8D 08 DF   REU length hi
    lda #$ed               // A9 ED
    sta $df01              // 8D 01 DF   REU command (b7=execute)
    lda #$34               // A9 34
    sta $01                // 85 01   CPU port: mem banking
    lda $ff00              // AD 00 FF
    sta $ff00              // 8D 00 FF
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    cli                    // 58
    jmp $8000              // 4C 00 80
    .byte $BB    // BB  undocumented/illegal at $9982
    .byte $BB    // BB  undocumented/illegal at $9983
    brk                    // 00
    clc                    // 18
    adc $39                // 65 39
    sta $39                // 85 39
    rts                    // 60
bank03_data_998B:
.errorif (* != $998B), "bank03_data_998B shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $998B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $999B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99AB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99BB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99CB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99DB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99EB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99FB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A0B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A1B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A2B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A3B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A4B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A5B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A6B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A7B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A8B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A9B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AAB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ABB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ACB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ADB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AEB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AFB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B0B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B1B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B2B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B3B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B4B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B5B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B6B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B7B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B8B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B9B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BAB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BBB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BCB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BDB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BEB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BFB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C0B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C1B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C2B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C3B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C4B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C5B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C6B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C7B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C8B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C9B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CAB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CBB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CCB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CDB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CEB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CFB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D0B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D1B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D2B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D3B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D4B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D5B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D6B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D7B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D8B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D9B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DAB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DBB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DCB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DDB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DEB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DFB
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E0B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E1B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E2B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E3B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E4B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E5B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E6B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E7B
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E8B
    .byte $00, $00    // data $9E9B
    jsr $deba              // 20 BA DE
    dec $01                // C6 01   CPU port: mem banking
    jsr $f3d5              // 20 D5 F3
    inc $01                // E6 01   CPU port: mem banking
    rts                    // 60
    nop                    // EA
    jsr $deba              // 20 BA DE
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    rts                    // 60
    pha                    // 48
    sei                    // 78
    lda #$18               // A9 18
    pha                    // 48
    lda #$20               // A9 20
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    bit $8080              // 2C 80 80
    bit $8080              // 2C 80 80
    pha                    // 48
    lda $def2              // AD F2 DE
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    sta $def7              // 8D F7 DE
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    rts                    // 60
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    rti                    // 40
    nop                    // EA
    sta $9e                // 85 9E
    pla                    // 68
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda $9e                // A5 9E
    rts                    // 60
    clc                    // 18
    brk                    // 00
    php                    // 08
    bpl $9f0a              // 10 18
    jsr $801a              // 20 1A 80
    dey                    // 88
    bcc $9e90              // 90 98
bank03_data_9EF8:
.errorif (* != $9EF8), "bank03_data_9EF8 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00    // data $9EF8
    nop                    // EA
// --- $9F0A: cross-bank call stub (bank03's copy; NOP sled $9F00-$9F09 so
// jsr $9F00/$9F02/... entry offsets select the destination bank via the
// $DEED table). 2-byte inline arg after the jsr = target address.
// Ends with jmp $DEDE (sta $de00 / pla / rti). See bank00 $9F01.
bank03_sub_9F01:
    nop                    // EA
bank03_sub_9F02:
    nop                    // EA
    nop                    // EA
    nop                    // EA
bank03_sub_9F05:
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    sei                    // 78
    cld                    // D8
    sta $a5                // 85 A5
    stx $a6                // 86 A6
    sty $a7                // 84 A7
    php                    // 08
    pla                    // 68
    sta $a8                // 85 A8
    pla                    // 68
    sta $9e                // 85 9E
    clc                    // 18
    adc #$02               // 69 02
    tax                    // AA
    pla                    // 68
    sta $9f                // 85 9F
    adc #$00               // 69 00
    pha                    // 48
    txa                    // 8A
    pha                    // 48
    lda $9e                // A5 9E
    bne bank03_sub_9F2B              // D0 02
    dec $9f                // C6 9F
bank03_sub_9F2B:
    dec $9e                // C6 9E
    ldy #$00               // A0 00
    lda ($9e),y            // B1 9E
    sec                    // 38
    sbc #$00               // E9 00
    tax                    // AA
    lda $deed              // AD ED DE
    pha                    // 48
    lda #$de               // A9 DE
    pha                    // 48
    lda #$e3               // A9 E3
    pha                    // 48
    ldy #$03               // A0 03
    lda ($9e),y            // B1 9E
    pha                    // 48
    dey                    // 88
    lda ($9e),y            // B1 9E
    pha                    // 48
    lda $a8                // A5 A8
    pha                    // 48
    lda $a5                // A5 A5
    pha                    // 48
    lda $deee,x            // BD EE DE
    ldx $a6                // A6 A6
    ldy $a7                // A4 A7
    jmp $dede              // 4C DE DE
bank03_api_23:
    lda $2b                // A5 2B   BASIC prog start lo
    ldy $2c                // A4 2C   BASIC prog start hi
    sta $22                // 85 22
    sty $23                // 84 23
    clc                    // 18
bank03_sub_9F61:
    ldy #$01               // A0 01
    lda ($22),y            // B1 22
    beq bank03_sub_9F86              // F0 1F
    ldy #$04               // A0 04
bank03_sub_9F69:
    iny                    // C8
    beq bank03_sub_9F87              // F0 1B
    lda ($22),y            // B1 22
    bne bank03_sub_9F69              // D0 F9
    iny                    // C8
    tya                    // 98
    adc $22                // 65 22
    tax                    // AA
    ldy #$00               // A0 00
    sta ($22),y            // 91 22
    lda $23                // A5 23
    adc #$00               // 69 00
    iny                    // C8
    sta ($22),y            // 91 22
    stx $22                // 86 22
    sta $23                // 85 23
    bcc bank03_sub_9F61              // 90 DB
bank03_sub_9F86:
    rts                    // 60
bank03_sub_9F87:
    lda #$00               // A9 00
    ldy #$01               // A0 01
    sta ($22),y            // 91 22
    rts                    // 60
bank03_api_11:
    lda $d021              // AD 21 D0   VIC background color
    and #$0f               // 29 0F
    ldx #$01               // A2 01
    cmp #$01               // C9 01
    bne bank03_sub_9F9A              // D0 01
    dex                    // CA
bank03_sub_9F9A:
    stx $0286              // 8E 86 02   current text color
    rts                    // 60
bank03_data_9F9E:
.errorif (* != $9F9E), "bank03_data_9F9E shifted"
    .byte $20, $02, $9F, $33, $80, $8E, $39, $03, $A2, $05, $A0, $1D, $20, $76, $85, $A6    // data $9F9E
    .byte $BA, $A9, $00, $20, $CD, $BD, $A9, $20, $4C, $16, $E7, $20, $00, $9F, $57, $80    // data $9FAE
    .byte $D0, $03, $4C, $5D, $84, $A9, $0D, $4C, $16, $E7    // data $9FBE
bank03_api_21:
    jsr bank03_sub_8362              // 20 62 83
    .byte $0D, $20, $20, $20, $43, $59, $42, $45, $52, $50, $55, $4E, $58, $20, $52, $45    // data $9FCB  text: ".   CYBERPUNX RE"
    .byte $54, $52, $4F, $20, $52, $45, $50, $4C, $41, $59, $20, $36, $34, $4B, $42, $20    // data $9FDB  text: "TRO REPLAY 64KB "
    .byte $2D, $20, $33, $2E, $38, $50, $0D, $00    // data $9FEB  text: "- 3.8P.."
    rts                    // 60
    brk                    // 00
bank03_data_9FF5:
.errorif (* != $9FF5), "bank03_data_9FF5 shifted"
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FF5
