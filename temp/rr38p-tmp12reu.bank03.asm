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

    .byte $09, $80, $0C, $80, $C3, $C2, $CD, $38, $30    // data $8000
bank03_cold_start:
    JMP bank03_api_00              // 4C C8 90
bank03_warm_start:
    JMP bank03_api_01              // 4C B5 82
    .byte $4C, $5D, $84, $4C, $44, $89, $4C, $44, $86, $4C, $4C, $86, $4C, $EB, $94, $4C    // data $800F
    .byte $F6, $90, $4C, $35, $84, $4C, $2F, $84, $4C, $02, $91, $4C, $8E, $9F, $4C, $AF    // data $801F
    .byte $82, $4C, $7F, $8E, $4C, $B3, $8E, $4C, $E2, $8E, $4C, $19, $92, $4C, $59, $91    // data $802F
    .byte $4C, $7F, $85    // data $803F
bank03_api_19:
    JMP bank03_api_19              // 4C 42 80
    .byte $4C, $5F, $90, $4C, $C8, $9F, $4C, $C5, $94, $4C, $58, $9F, $4C, $DC, $8F, $4C    // data $8045
    .byte $02, $95, $4C, $58, $96, $4C, $1C, $97, $4C, $2F, $94, $4C, $73, $94, $4C, $51    // data $8055
    .byte $94, $4C, $18, $94, $4C, $65, $82, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8065
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $EA, $EA, $EA, $EA    // data $8075
    .byte $EA, $EA, $4C, $8D, $80, $4C, $41, $82, $A2, $00, $BD, $CF, $80, $9D, $00, $CE    // data $8085
    .byte $BD, $CF, $81, $9D, $00, $CF, $EE, $20, $D0, $E8, $D0, $EE, $20, $62, $83, $0D    // data $8095
    .byte $0D, $53, $54, $41, $52, $54, $45, $44, $20, $44, $45, $42, $55, $47, $53, $54    // data $80A5
    .byte $55, $42, $20, $4F, $4E, $20, $53, $53, $20, $2D, $20, $4B, $49, $43, $4B, $20    // data $80B5
    .byte $49, $4E, $20, $59, $45, $52, $20, $50, $43, $00, $4C, $06, $CE, $4C, $11, $CE    // data $80C5
    .byte $A9, $04, $20, $FF, $CE, $20, $11, $CE, $4C, $0B, $CE, $78, $20, $45, $CF, $B0    // data $80D5
    .byte $23, $C9, $41, $D0, $1F, $20, $5C, $CF, $C9, $42, $D0, $03, $4C, $3C, $CE, $C9    // data $80E5
    .byte $43, $D0, $03, $4C, $87, $CE, $C9, $44, $D0, $03, $4C, $CE, $CE, $C9, $4B, $D0    // data $80F5
    .byte $03, $4C, $DB, $CE, $58, $60, $A5, $A0, $48, $A5, $A1, $48, $A5, $A2, $48, $A5    // data $8105
    .byte $A3, $48, $20, $5C, $CF, $85, $A2, $20, $5C, $CF, $85, $A3, $20, $5C, $CF, $85    // data $8115
    .byte $A0, $20, $5C, $CF, $85, $A1, $A0, $00, $20, $5C, $CF, $91, $A0, $E6, $A0, $D0    // data $8125
    .byte $02, $E6, $A1, $A5, $A1, $C5, $A3, $D0, $EF, $A5, $A0, $C5, $A2, $D0, $E9, $68    // data $8135
    .byte $8D, $A3, $00, $68, $8D, $A2, $00, $68, $8D, $A1, $00, $68, $8D, $A0, $00, $58    // data $8145
    .byte $60, $A5, $A0, $48, $A5, $A1, $48, $A5, $A2, $48, $A5, $A3, $48, $20, $5C, $CF    // data $8155
    .byte $85, $A2, $20, $5C, $CF, $85, $A3, $20, $5C, $CF, $85, $A0, $20, $5C, $CF, $85    // data $8165
    .byte $A1, $A0, $00, $B1, $A0, $20, $62, $CF, $E6, $A0, $D0, $02, $E6, $A1, $A5, $A1    // data $8175
    .byte $C5, $A3, $D0, $EF, $A5, $A0, $C5, $A2, $D0, $E9, $68, $85, $A3, $68, $85, $A2    // data $8185
    .byte $68, $85, $A1, $68, $85, $A0, $58, $60, $20, $5C, $CF, $85, $A0, $20, $5C, $CF    // data $8195
    .byte $85, $A1, $6C, $A0, $00, $A9, $37, $85, $01, $58, $20, $59, $A6, $4C, $AE, $A7    // data $81A5
    .byte $AD, $01, $DE, $09, $01, $8D, $01, $DE, $A2, $00, $8E, $0F, $DE, $EC, $0F, $DE    // data $81B5
    .byte $D0, $05, $E8, $D0, $F5, $18, $60, $38, $60, $AA, $AD, $01, $DE, $09, $01, $8D    // data $81C5
    .byte $01, $DE, $A9, $87, $8D, $0A, $DE, $A9, $83, $8D, $0B, $DE, $8E, $08, $DE, $A9    // data $81D5
    .byte $00, $8D, $09, $DE, $A9, $03, $8D, $0B, $DE, $A9, $00, $8D, $09, $DE, $4C, $3F    // data $81E5
    .byte $CF, $AD, $0D, $DE, $29, $01, $60, $AD, $0D, $DE, $29, $20, $60, $AD, $0E, $DE    // data $81F5
    .byte $29, $10, $60, $A9, $03, $8D, $0C, $DE, $60, $A9, $01, $8D, $0C, $DE, $60, $20    // data $8205
    .byte $27, $CF, $D0, $03, $20, $39, $CF, $20, $3F, $CF, $20, $27, $CF, $D0, $02, $38    // data $8215
    .byte $60, $AD, $08, $DE, $18, $60, $20, $45, $CF, $B0, $FB, $60, $48, $20, $33, $CF    // data $8225
    .byte $F0, $FB, $20, $2D, $CF, $F0, $FB, $68, $8D, $08, $DE, $60, $20, $62, $83, $0D    // data $8235
    .byte $20, $20, $41, $44, $44, $52, $20, $41, $52, $20, $58, $52, $20, $59, $52, $20    // data $8245
    .byte $53, $50, $20, $30, $31, $20, $4E, $56, $2D, $42, $44, $49, $5A, $43, $00, $60    // data $8255
bank03_api_32:
    JSR bank03_sub_8362              // 20 62 83
    .byte $52    // undocumented opcode
    .byte $52    // undocumented opcode
    JSR $4552              // 20 52 45
    LSR $3a,X              // 56 3A
    JSR $a200              // 20 00 A2
    STA $a0,X              // 95 A0
    .byte $82    // undocumented opcode
    JSR $de9d              // 20 9D DE
    JSR $e716              // 20 16 E7
    LDA #$2e               // A9 2E
    JSR $e716              // 20 16 E7
    INY                    // C8
    JSR $de9d              // 20 9D DE
    JSR $e716              // 20 16 E7
    INY                    // C8
    JSR $de9d              // 20 9D DE
    JSR $e716              // 20 16 E7
    JSR bank03_sub_8362              // 20 62 83
    ORA $4f0d              // 0D 0D 4F
    .byte $57    // undocumented opcode
    LSR $5245              // 4E 45 52
    .byte $3A    // undocumented opcode
    JSR $a200              // 20 00 A2
    STA $a0,X              // 95 A0
    STA $20                // 85 20
    STA $20de,X            // 9D DE 20
    ASL $e7,X              // 16 E7
    INY                    // C8
    CPY #$95               // C0 95
    BNE $829f              // D0 F5
    LDA #$0d               // A9 0D
    JMP $e716              // 4C 16 E7
bank03_api_12:
    JSR bank03_sub_9F02              // 20 02 9F
    CLC                    // 18
    .byte $80    // undocumented opcode
    RTS                    // 60
bank03_api_01:
    JSR $f6bc              // 20 BC F6
    JSR $f6ed              // 20 ED F6
    BEQ bank03_sub_82C0              // F0 03
    JMP $fe72              // 4C 72 FE
bank03_sub_82C0:
    LDX #$fb               // A2 FB
    TXS                    // 9A
    JSR bank03_sub_9F01              // 20 01 9F
    .byte $0C    // undocumented opcode
    .byte $80    // undocumented opcode
    JSR bank03_sub_9F02              // 20 02 9F
    .byte $12    // undocumented opcode
    .byte $80    // undocumented opcode
    RTS                    // 60
    .byte $A9, $4E, $8D, $3C, $03, $A9, $3A, $8D, $3D, $03, $20, $62, $83, $44, $49, $53    // data $82CE
    .byte $4B, $20, $4E, $41, $4D, $45, $3A, $20, $00, $A2, $0B, $A0, $1A, $20, $00, $9F    // data $82DE
    .byte $5D, $80, $D0, $03, $4C, $5D, $84, $85, $FB, $A8, $88, $B1, $BB, $99, $3E, $03    // data $82EE
    .byte $88, $10, $F8, $20, $62, $83, $49, $44, $20, $4E, $55, $4D, $42, $45, $52, $3A    // data $82FE
    .byte $20, $00, $A9, $A0, $A4, $FB, $A2, $05, $99, $3E, $03, $C8, $CA, $10, $F9, $A2    // data $830E
    .byte $0B, $A0, $0C, $20, $00, $9F, $5D, $80, $A6, $FB, $A8, $F0, $13, $A9, $2C, $9D    // data $831E
    .byte $3E, $03, $E8, $A0, $00, $B1, $BB, $9D, $3E, $03, $E8, $C8, $C0, $05, $D0, $F5    // data $832E
    .byte $E8, $E8, $8A, $A2, $3C, $A0, $03, $20, $BD, $FF, $A9, $00, $85, $9D, $20, $02    // data $833E
    .byte $9F, $1B, $80, $20, $AE, $FF, $4C, $7F, $85, $A9, $00, $85, $B7, $F0, $EF, $A2    // data $834E
    .byte $03    // data $835E
bank03_sub_835F:
    JSR bank03_sub_8576              // 20 76 85
bank03_sub_8362:
    PLA                    // 68
    STA $3d                // 85 3D
    PLA                    // 68
    STA $3e                // 85 3E
    STX $8d                // 86 8D
bank03_sub_836A:
    LDY #$00               // A0 00
    INC $3d                // E6 3D
    BNE bank03_sub_8372              // D0 02
    INC $3e                // E6 3E
bank03_sub_8372:
    LDA ($3d),Y            // B1 3D
    BEQ bank03_sub_83A7              // F0 31
    CMP #$01               // C9 01
    BNE bank03_sub_8384              // D0 0A
    LDX $d6                // A6 D6
    INX                    // E8
    LDY #$0a               // A0 0A
    JSR bank03_sub_8576              // 20 76 85
    BNE bank03_sub_836A              // D0 E6
bank03_sub_8384:
    CMP #$02               // C9 02
    BNE bank03_sub_8394              // D0 0C
    INY                    // C8
    LDA ($3d),Y            // B1 3D
    TAX                    // AA
bank03_sub_838C:
    JSR bank03_sub_83B0              // 20 B0 83
    DEX                    // CA
    BNE bank03_sub_838C              // D0 FA
    BEQ bank03_sub_836A              // F0 D6
bank03_sub_8394:
    CMP #$2a               // C9 2A
    BNE bank03_sub_83A2              // D0 0A
    JSR bank03_sub_83B0              // 20 B0 83
    LDA #$2d               // A9 2D
    JSR $e716              // 20 16 E7
    LDA #$20               // A9 20
bank03_sub_83A2:
    JSR $e716              // 20 16 E7
    BCC bank03_sub_836A              // 90 C3
bank03_sub_83A7:
    LDA $3e                // A5 3E
    PHA                    // 48
    LDA $3d                // A5 3D
    PHA                    // 48
    LDX $8d                // A6 8D
    RTS                    // 60
bank03_sub_83B0:
    LDA #$20               // A9 20
    JMP $e716              // 4C 16 E7
    .byte $AD, $36, $03, $85, $AE, $AD, $37, $03, $85, $AF, $A2, $01, $86, $C1, $A0, $08    // data $83B5
    .byte $84, $C2, $AD, $38, $03, $85, $BD, $4C, $8E, $FB    // data $83C5
bank03_sub_83CF:
    SEI                    // 78
    JSR $fda3              // 20 A3 FD
    JSR bank03_api_00              // 20 C8 90
    JSR $ff5b              // 20 5B FF
    JSR $e453              // 20 53 E4
    JSR $e3bf              // 20 BF E3
    LDA #$03               // A9 03
    STA $2d                // 85 2D
    LDA #$08               // A9 08
    STA $2e                // 85 2E
    LDA #$80               // A9 80
    STA $9d                // 85 9D
    LDA #$37               // A9 37
    STA $01                // 85 01
    STA $c0                // 85 C0
    LDA #$06               // A9 06
    STA $d020              // 8D 20 D0
    STA $d021              // 8D 21 D0
    LDX #$01               // A2 01
    LDY #$0b               // A0 0B
    JSR bank03_sub_835F              // 20 5F 83
    ORA $20                // 05 20
    .byte $43    // undocumented opcode
    EOR $4542,Y            // 59 42 45
    .byte $52    // undocumented opcode
    BVC bank03_sub_845E              // 50 55
    LSR $2058              // 4E 58 20
    .byte $52    // undocumented opcode
    EOR $50                // 45 50
    JMP $5941              // 4C 41 59
    .byte $00, $A2, $02, $A0, $0C, $20, $76, $85, $A2, $0F, $A9, $A3, $20, $16, $E7, $CA    // data $8412
    .byte $10, $FA, $A2, $8F, $A0, $DE, $8E, $02, $03, $8C, $03, $03, $60    // data $8422
bank03_api_09:
    LDX #$90               // A2 90
    LDY #$84               // A0 84
    BNE bank03_sub_8439              // D0 04
bank03_api_08:
    LDX #$72               // A2 72
    LDY #$84               // A0 84
bank03_sub_8439:
    STX $033a              // 8E 3A 03
    STY $033b              // 8C 3B 03
    SEI                    // 78
    LDX #$fb               // A2 FB
    TXS                    // 9A
    CLD                    // D8
    LDX $ba                // A6 BA
    CPX #$11               // E0 11
    BCS bank03_sub_844E              // B0 04
    CPX #$08               // E0 08
    BCS bank03_sub_8450              // B0 02
bank03_sub_844E:
    LDX #$08               // A2 08
bank03_sub_8450:
    STX $0339              // 8E 39 03
    LDA $ae                // A5 AE
    STA $0336              // 8D 36 03
    LDA $af                // A5 AF
    STA $0337              // 8D 37 03
bank03_api_02:
    SEI                    // 78
bank03_sub_845E:
    LDX #$fb               // A2 FB
    TXS                    // 9A
    CLD                    // D8
    STX $cc                // 86 CC
    JSR bank03_sub_83CF              // 20 CF 83
    JSR $a660              // 20 60 A6
    LDA $0339              // AD 39 03
    STA $ba                // 85 BA
    JMP ($033a)            // 6C 3A 03
    .byte $A0, $0D, $20, $5D, $83, $12, $55, $54, $49, $4C, $49, $54, $49, $45, $53, $20    // data $8472
    .byte $4D, $45, $4E, $55, $0D, $00, $A2, $F8, $A0, $85, $A9, $10, $D0, $20, $20, $B5    // data $8482
    .byte $83, $A0, $0E, $20, $5D, $83, $12, $42, $41, $43, $4B, $55, $50, $20, $20, $4D    // data $8492
    .byte $45, $4E, $55, $0D, $00, $20, $04, $87, $A2, $A2, $A0, $85, $A9, $06, $20, $B6    // data $84A2
    .byte $84, $4C, $5D, $84, $86, $AE, $84, $AF, $85, $AD, $20, $A6, $9F, $A2, $05, $A0    // data $84B2
    .byte $0A, $20, $5F, $83, $46, $31, $20, $2D, $20, $44, $49, $53, $4B, $20, $44, $45    // data $84C2
    .byte $56, $49, $43, $45, $3A, $01, $46, $33, $20, $2D, $20, $44, $49, $52, $45, $43    // data $84D2
    .byte $54, $4F, $52, $59, $01, $46, $35, $20, $2D, $20, $46, $4F, $52, $4D, $41, $54    // data $84E2
    .byte $01, $46, $37, $20, $2D, $20, $44, $4F, $53, $20, $43, $4F, $4D, $4D, $41, $4E    // data $84F2
    .byte $44, $0D, $01, $00, $A9, $41, $85, $AB, $A0, $00, $84, $FB, $A6, $D6, $E8, $C9    // data $8502
    .byte $20, $D0, $01, $E8, $A0, $06, $20, $76, $85, $A5, $AB, $E6, $AB, $20, $16, $E7    // data $8512
    .byte $20, $62, $83, $2A, $00, $A4, $FB, $B1, $AE, $F0, $0C, $08, $29, $7F, $20, $16    // data $8522
    .byte $E7, $C8, $28, $10, $F2, $D0, $D3, $20, $90, $85, $C9, $85, $D0, $05, $20, $9E    // data $8532
    .byte $9F, $90, $F4, $A2, $00, $C9, $86, $F0, $1C, $A2, $02, $C9, $87, $F0, $16, $A2    // data $8542
    .byte $04, $C9, $88, $F0, $10, $C9, $41, $90, $DE, $C5, $AB, $B0, $DA, $38, $E9, $41    // data $8552
    .byte $0A, $18, $65, $AD, $AA, $BD, $26, $86, $48, $BD, $25, $86, $48, $20, $B5, $83    // data $8562
    .byte $A2, $16, $A0, $00    // data $8572
bank03_sub_8576:
    CLC                    // 18
    JMP $fff0              // 4C F0 FF
    .byte $20, $02, $9F, $21, $80    // data $857A
bank03_api_18:
    JSR bank03_sub_8362              // 20 62 83
    ORA $5250              // 0D 50 52
    EOR $53                // 45 53
    .byte $53    // undocumented opcode
    JSR $2041              // 20 41 20
    .byte $4B    // undocumented opcode
    EOR $59                // 45 59
    ORA $a900              // 0D 00 A9
    BRK                    // 00
    STA $c6                // 85 C6
bank03_sub_8594:
    JSR $ff9f              // 20 9F FF
    JSR $ffe4              // 20 E4 FF
    BEQ bank03_sub_8594              // F0 F8
    CMP #$03               // C9 03
    BEQ bank03_sub_85A1              // F0 01
    CLC                    // 18
bank03_sub_85A1:
    RTS                    // 60
    .byte $44, $49, $53, $4B, $20, $53, $41, $56, $45, $20, $2D, $20, $54, $55, $52, $42    // data $85A2
    .byte $CF, $44, $49, $53, $4B, $20, $53, $41, $56, $45, $20, $2D, $20, $53, $54, $41    // data $85B2
    .byte $4E, $44, $41, $52, $C4, $52, $45, $53, $54, $41, $52, $54, $20, $50, $52, $4F    // data $85C2
    .byte $47, $52, $41, $CD, $45, $58, $49, $54, $20, $54, $4F, $20, $55, $54, $49, $4C    // data $85D2
    .byte $49, $54, $49, $45, $D3, $45, $58, $49, $54, $20, $54, $4F, $20, $46, $41, $53    // data $85E2
    .byte $54, $4C, $4F, $41, $44, $00, $44, $49, $53, $4B, $20, $46, $49, $4C, $45, $43    // data $85F2
    .byte $4F, $50, $D9, $57, $48, $4F, $4C, $45, $20, $44, $49, $53, $4B, $20, $43, $4F    // data $8602
    .byte $50, $D9, $45, $58, $49, $54, $20, $54, $4F, $20, $46, $41, $53, $54, $4C, $4F    // data $8612
    .byte $41, $44, $00, $79, $85, $CD, $82, $B8, $86, $90, $86, $3F, $87, $0C, $08, $20    // data $8622
    .byte $80, $F7, $86, $3A, $86, $35, $80, $F7, $86, $20, $12, $80, $20, $C3, $9F, $4C    // data $8632
    .byte $57, $83    // data $8642
bank03_api_04:
    LDA $c1                // A5 C1
    STA $c3                // 85 C3
    LDA $c2                // A5 C2
    STA $c4                // 85 C4
bank03_api_05:
    JSR bank03_sub_9F05              // 20 05 9F
    .byte $8F    // undocumented opcode
    INC $20,X              // F6 20
    STX $a9fb              // 8E FB A9
    ADC ($85,X)            // 61 85
    LDA $a020,Y            // B9 20 A0
    DEC $0190,X            // DE 90 01
    RTS                    // 60
    .byte $A5, $BA, $20, $B1, $FF, $A5, $B9, $20, $93, $FF, $A5, $C3, $20, $A8, $FF, $A5    // data $865E
    .byte $C4, $20, $A8, $FF, $20, $D1, $FC, $B0, $17, $78, $A0, $07, $B9, $FC, $86, $99    // data $866E
    .byte $A4, $00, $88, $D0, $F7, $20, $A5, $00, $20, $A8, $FF, $20, $DB, $FC, $D0, $E4    // data $867E
    .byte $4C, $3F, $F6, $A9, $80, $2C, $A9, $00, $8D, $38, $03, $85, $BD, $20, $B9, $9F    // data $868E
    .byte $A5, $BD, $D0, $0E, $A4, $B7, $A9, $2C, $91, $BB, $C8, $A9, $57, $91, $BB, $C8    // data $869E
    .byte $84, $B7, $20, $C8, $82, $20, $C3, $9F, $4C, $57, $83, $20, $62, $83, $45, $4E    // data $86AE
    .byte $54, $45, $52, $20, $43, $4F, $4D, $4D, $41, $4E, $44, $3A, $3E, $20, $00, $A2    // data $86BE
    .byte $10, $A0, $38, $20, $00, $9F, $5D, $80, $08, $20, $02, $9F, $1B, $80, $28, $F0    // data $86CE
    .byte $03, $4C, $57, $83, $4C, $7F, $85    // data $86DE
bank03_sub_86E5:
    LDA #$12               // A9 12
    JSR $e716              // 20 16 E7
    CPX #$0a               // E0 0A
    BCS bank03_sub_86F3              // B0 05
    LDA #$30               // A9 30
    JSR $e716              // 20 16 E7
bank03_sub_86F3:
    LDA #$00               // A9 00
    JMP $bdcd              // 4C CD BD
    .byte $20, $01, $9F, $09, $80, $E6, $01, $B1, $AC, $C6, $01, $60, $A2, $09, $A0, $1E    // data $86F8
    .byte $20, $5F, $83, $42, $4C, $4F, $43, $4B, $53, $00, $A0, $00, $A9, $FE, $A2, $0B    // data $8708
    .byte $20, $2B, $87, $A2, $0C, $A0, $20, $20, $76, $85, $A6, $BF, $E0, $CB, $90, $13    // data $8718
    .byte $E8, $D0, $10, $A0, $20, $85, $BF, $20, $76, $85, $A6, $BF, $20, $02, $9F, $27    // data $8728
    .byte $80, $86, $BF, $A9, $00, $4C, $CD, $BD, $20, $B9, $9F, $A0, $B9, $B9, $56, $87    // data $8738
    .byte $99, $46, $03, $88, $D0, $F7, $20, $47, $03, $20, $C3, $9F, $4C, $57, $83, $A5    // data $8748
    .byte $AF, $38, $E9, $D0, $90, $24, $AA, $86, $FD, $E8, $8E, $CA, $03, $20, $88, $03    // data $8758
    .byte $A5, $AE, $18, $69, $50, $85, $AE, $A5, $FD, $69, $08, $85, $AF, $20, $72, $03    // data $8768
    .byte $20, $88, $03, $20, $F1, $03, $A0, $D0, $D0, $04, $A6, $AE, $A4, $AF, $A9, $01    // data $8778
    .byte $85, $AC, $A9, $08, $85, $AD, $A9, $AC, $C6, $01, $20, $D8, $FF, $E6, $01, $60    // data $8788
    .byte $A0, $3A, $B9, $0C, $08, $48, $B9, $C5, $03, $99, $0C, $08, $68, $99, $C5, $03    // data $8798
    .byte $88, $D0, $EF, $A9, $47, $85, $22, $A9, $08, $85, $23, $A9, $D0, $85, $25, $84    // data $87A8
    .byte $24, $78, $A6, $FD, $E8, $E6, $01, $B1, $22, $48, $B1, $24, $91, $22, $68, $91    // data $87B8
    .byte $24, $C8, $D0, $F3, $E6, $23, $E6, $25, $CA, $D0, $EC, $C6, $01, $60, $78, $E6    // data $87C8
    .byte $01, $A2, $20, $A0, $00, $B9, $47, $08, $99, $00, $D0, $C8, $D0, $F7, $EE, $16    // data $87D8
    .byte $08, $EE, $19, $08, $CA, $D0, $EE, $C6, $01, $20, $38, $08, $C8, $84, $B9, $A9    // data $87E8
    .byte $08, $48, $A9, $0C, $48, $8A, $4C, $D5, $FF, $A5, $BB, $D0, $02, $C6, $BC, $C6    // data $87F8
    .byte $BB, $E6, $B7, $A9, $31, $91, $BB, $60, $09, $20, $48, $24, $94, $10, $0A, $38    // data $8808
    .byte $66, $A3, $20, $41, $88, $46, $94, $46, $A3, $68, $85, $95, $78, $C9, $24, $D0    // data $8818
    .byte $03, $4C, $DB, $88, $20, $9D, $88, $AD, $00, $DD, $09, $08, $8D, $00, $DD, $78    // data $8828
    .byte $20, $8E, $EE, $20, $97, $EE, $20, $B3, $EE, $78, $2C, $0C, $DD, $30, $06, $20    // data $8838
    .byte $97, $EE, $4C, $44, $ED, $A5, $95, $20, $7E, $88, $24, $A3, $10, $03, $20, $9D    // data $8848
    .byte $88, $58, $18, $60, $24, $94, $30, $05, $38, $66, $94, $D0, $05, $48, $20, $41    // data $8858
    .byte $88, $68, $85, $95, $18, $60, $A9, $3F, $20, $12, $88, $4C, $03, $EE, $85, $95    // data $8868
    .byte $20, $B8, $88, $4C, $BE, $ED, $20, $89, $88, $A9, $10, $2C, $0D, $DD, $F0, $FB    // data $8878
    .byte $60, $8D, $01, $DD, $AD, $0D, $DD, $AD, $00, $DD, $29, $FB, $8D, $00, $DD, $09    // data $8888
    .byte $04, $8D, $00, $DD, $60, $AD, $0C, $DD, $29, $7F, $8D, $0C, $DD, $A9, $3F, $8D    // data $8898
    .byte $02, $DD, $AD, $00, $DD, $09, $04, $8D, $00, $DD, $A9, $00, $8D, $03, $DD, $60    // data $88A8
    .byte $78, $2C, $0C, $DD, $30, $09, $20, $8E, $EE, $20, $9A, $EE, $4C, $44, $ED, $29    // data $88B8
    .byte $F0, $C9, $E0, $D0, $0B, $A9, $00, $8D, $0C, $DD, $20, $89, $88, $20, $9D, $88    // data $88C8
    .byte $58, $18, $60, $20, $EA, $88, $90, $03, $4C, $2E, $ED, $A9, $C0, $8D, $0C, $DD    // data $88D8
    .byte $58, $60, $20, $9D, $88, $CE, $03, $DD, $2C, $0C, $DD, $70, $E4, $20, $89, $88    // data $88E8
    .byte $A9, $FF, $8D, $07, $DC, $A9, $19, $8D, $0F, $DC, $AD, $0D, $DC, $AD, $0D, $DD    // data $88F8
    .byte $29, $10, $D0, $CD, $AD, $0D, $DC, $29, $02, $F0, $F2, $38, $60, $48, $A9, $00    // data $8908
    .byte $85, $90, $A9, $04, $20, $10, $88, $68, $4C, $76, $88, $48, $A9, $00, $85, $90    // data $8918
    .byte $A9, $04, $20, $B1, $FF, $68, $4C, $93, $FF, $A9, $0A, $2C, $A9, $0D, $4C, $5C    // data $8928
    .byte $88, $20, $34, $89, $A5, $93, $29, $20, $D0, $EF, $60, $24    // data $8938
bank03_api_03:
    JMP bank03_sub_94C8              // 4C C8 94
    .byte $A9, $00, $20, $A6, $8C, $B0, $35, $20, $AA, $8E, $A9, $01, $A2, $43, $A0, $89    // data $8947
    .byte $20, $BD, $FF, $A0, $00, $A6, $F9, $20, $BA, $FF, $A9, $60, $85, $B9, $20, $D5    // data $8957
    .byte $F3, $A5, $BA, $20, $B4, $FF, $A5, $B9, $20, $96, $FF, $20, $A5, $FF, $A5, $90    // data $8967
    .byte $4A, $4A, $90, $15, $20, $60, $8C, $20, $7C, $8C, $F0, $CB, $18, $24    // data $8977
bank03_sub_8985:
    SEC                    // 38
    LDX #$01               // A2 01
    STX $dc0e              // 8E 0E DC
    DEX                    // CA
    STX $0800              // 8E 00 08
    RTS                    // 60
    .byte $20, $A5, $FF, $20, $00, $9F, $63, $80, $A9, $08, $A0, $80, $A2, $1E, $20, $00    // data $8990
    .byte $9F, $15, $80, $A9, $00, $85, $FD, $A0, $26, $85, $FB, $84, $FC, $A2, $1E, $A8    // data $89A0
    .byte $C6, $FC, $91, $FB, $C8, $D0, $FB, $CA, $D0, $F6, $20, $44, $E5, $20, $62, $83    // data $89B0
    .byte $44, $49, $53, $4B, $3A, $20, $00, $20, $E3, $8B, $20, $C3, $9F, $20, $62, $83    // data $89C0
    .byte $52, $45, $41, $44, $49, $4E, $47, $20, $44, $49, $52, $2E, $2E, $2E, $0D, $00    // data $89D0
    .byte $A2, $00, $86, $FB, $A2, $27, $BD, $00, $04, $9D, $20, $08, $A9, $A3, $20, $16    // data $89E0
    .byte $E7, $CA, $10, $F2, $20, $62, $83, $9D, $0D, $00, $4C, $0D, $8A, $20, $62, $83    // data $89F0
    .byte $4E, $2F, $41, $0D, $00, $4C, $0D, $8A, $A9, $91, $20, $16, $E7, $20, $E3, $8B    // data $8A00
    .byte $A5, $90, $F0, $03, $4C, $9F, $8A, $A0, $05, $B1, $D1, $C9, $22, $F0, $03, $4C    // data $8A10
    .byte $96, $8A, $A5, $F8, $C9, $50, $F0, $0B, $C9, $53, $F0, $07, $C9, $55, $F0, $03    // data $8A20
    .byte $4C, $FD, $89, $A5, $C3, $E4, $C3, $90, $C4, $05, $C4, $F0, $C0, $A5, $C4, $D0    // data $8A30
    .byte $BC, $A9, $0D, $20, $16, $E7, $AE, $00, $1E, $A5, $BD, $9D, $01, $1E, $A5, $F7    // data $8A40
    .byte $38, $65, $FB, $85, $FB, $AA, $90, $02, $E6, $FC, $A5, $FC, $C9, $1D, $90, $03    // data $8A50
    .byte $8A, $C9, $EB, $E6, $FD, $B0, $0C, $A5, $FD, $C9, $FE, $B0, $06, $EE, $00, $1E    // data $8A60
    .byte $4C, $08, $8A, $20, $62, $83, $0D, $0D, $2E, $2E, $2E, $20, $4D, $4F, $52, $45    // data $8A70
    .byte $20, $46, $49, $4C, $45, $53, $20, $2E, $2E, $2E, $0D, $0D, $00, $4C, $96, $8A    // data $8A80
    .byte $20, $33, $F6, $4C, $85, $89, $20, $42, $F6, $EE, $20, $D0, $4C, $99, $8A, $A2    // data $8A90
    .byte $00, $A0, $80, $20, $BD, $FF, $A9, $00, $8D, $EF, $03, $85, $02, $A5, $BB, $85    // data $8AA0
    .byte $FB, $A5, $BC, $85, $FC, $A9, $00, $85, $8B, $8D, $B0, $09, $85, $AE, $A9, $0A    // data $8AB0
    .byte $8D, $B1, $09, $85, $AF, $AE, $EF, $03, $EE, $EF, $03, $BD, $F0, $03, $D0, $03    // data $8AC0
    .byte $4C, $7E, $89, $85, $FD, $85, $FE, $A5, $02, $F0, $03, $20, $70, $8E, $A9, $01    // data $8AD0
    .byte $85, $02, $20, $D6, $8B, $A6, $F9, $A0, $00, $20, $BA, $FF, $A6, $AE, $A4, $AF    // data $8AE0
    .byte $86, $C3, $84, $C4, $A9, $80, $85, $9D, $0A, $85, $93, $20, $D2, $F5, $A9, $20    // data $8AF0
    .byte $20, $16, $E7, $20, $C1, $F5, $06, $9D, $C6, $B7, $C6, $B7, $A9, $00, $20, $6B    // data $8B00
    .byte $8C, $E6, $B7, $E6, $B7, $90, $05, $A9, $20, $20, $62, $8C, $A6, $8B, $A5, $C3    // data $8B10
    .byte $9D, $A7, $02, $A5, $C4, $9D, $A8, $02, $A5, $AE, $9D, $B2, $09, $A5, $AF, $9D    // data $8B20
    .byte $B3, $09, $E8, $E8, $86, $8B, $20, $CB, $8B, $C6, $FD, $D0, $A8, $20, $6E, $8E    // data $8B30
    .byte $A5, $FE, $85, $FD, $A6, $FB, $A4, $FC, $86, $BB, $84, $BC, $A9, $00, $85, $8B    // data $8B40
    .byte $85, $AE, $A9, $0A, $85, $AF, $20, $D6, $8B, $A5, $AE, $85, $C1, $A5, $AF, $85    // data $8B50
    .byte $C2, $A6, $8B, $BD, $B2, $09, $85, $AE, $BD, $A7, $02, $85, $C3, $BD, $B3, $09    // data $8B60
    .byte $85, $AF, $BD, $A8, $02, $85, $C4, $E8, $E8, $86, $8B, $A5, $FA, $85, $BA, $A9    // data $8B70
    .byte $80, $85, $9D, $20, $02, $9F, $18, $80, $A5, $90, $F0, $03, $20, $60, $8C, $20    // data $8B80
    .byte $CB, $8B, $C6, $FD, $D0, $C3, $24, $8C, $30, $26, $20, $62, $83, $0D, $0D, $41    // data $8B90
    .byte $4E, $4F, $54, $48, $45, $52, $20, $4F, $55, $54, $50, $55, $54, $3F, $20, $28    // data $8BA0
    .byte $59, $2F, $4E, $29, $00, $20, $95, $8C, $D0, $06, $20, $B3, $8E, $4C, $40, $8B    // data $8BB0
    .byte $A5, $BB, $D0, $02, $C6, $BC, $C6, $BB, $4C, $AD, $8A, $A5, $B7, $18, $65, $BB    // data $8BC0
    .byte $85, $BB, $90, $02, $E6, $BC, $A0, $00, $B1, $BB, $85, $B7, $E6, $BB, $D0, $02    // data $8BD0
    .byte $E6, $BC, $60, $A0, $02, $84, $8B, $A0, $00, $84, $F8, $84, $90, $20, $A5, $FF    // data $8BE0
    .byte $85, $C3, $20, $A5, $FF, $85, $C4, $A6, $90, $F0, $03, $4C, $42, $F6, $C6, $8B    // data $8BF0
    .byte $D0, $EB, $A6, $C3, $A4, $C4, $20, $CD, $BD, $A0, $01, $A9, $20, $20, $16, $E7    // data $8C00
    .byte $20, $A5, $FF, $C9, $22, $D0, $0A, $A5, $F8, $49, $FF, $85, $F8, $A9, $22, $D0    // data $8C10
    .byte $07, $A6, $F8, $F0, $03, $91, $FB, $C8, $A6, $90, $D0, $CF, $AA, $D0, $DE, $A9    // data $8C20
    .byte $2C, $91, $FB, $C8, $84, $F7, $A0, $18, $B1, $D1, $09, $40, $85, $F8, $A4, $F7    // data $8C30
    .byte $91, $FB, $98, $A0, $00, $91, $FB, $A2, $FE, $86, $BF, $98, $A4, $C3, $F0, $0D    // data $8C40
    .byte $A2, $01, $18, $65, $BF, $90, $01, $E8, $88, $D0, $F7, $86, $BD, $A2, $F6, $60    // data $8C50
bank03_sub_8C60:
    LDA #$0d               // A9 0D
    JSR $e716              // 20 16 E7
    JSR bank03_sub_9F02              // 20 02 9F
    BIT $80                // 24 80
    RTS                    // 60
    .byte $2C, $3C, $03, $30, $06, $20, $02, $9F, $15, $80, $60, $20, $02, $9F, $0F, $80    // data $8C6B
    .byte $60, $20, $62, $83, $0D, $0D, $41, $4E, $4F, $54, $48, $45, $52, $20, $44, $49    // data $8C7B
    .byte $53, $4B, $3F, $20, $28, $59, $2F, $4E, $29, $00, $20, $90, $85, $C9, $4E, $F0    // data $8C8B
    .byte $04, $C9, $59, $D0, $F5, $20, $16, $E7, $C9, $59, $60    // data $8C9B
bank03_sub_8CA6:
    PHA                    // 48
    LDX #$08               // A2 08
    STX $f9                // 86 F9
    INX                    // E8
    STX $fa                // 86 FA
    STX $ba                // 86 BA
    JSR bank03_sub_9F02              // 20 02 9F
    .byte $0C    // undocumented opcode
    .byte $80    // undocumented opcode
    BNE bank03_sub_8CBB              // D0 04
    DEC $fa                // C6 FA
    DEC $ba                // C6 BA
bank03_sub_8CBB:
    LDY #$01               // A0 01
    STY $fb                // 84 FB
    STY $fc                // 84 FC
    DEY                    // 88
    PLA                    // 68
    TAX                    // AA
    BEQ bank03_sub_8CCA              // F0 04
    STY $fc                // 84 FC
    STY $fb                // 84 FB
bank03_sub_8CCA:
    LDA $8db5,Y            // B9 B5 8D
    BEQ bank03_sub_8CE4              // F0 15
    CMP #$ff               // C9 FF
    BEQ bank03_sub_8CD9              // F0 06
    JSR $e716              // 20 16 E7
bank03_sub_8CD6:
    INY                    // C8
    BNE bank03_sub_8CCA              // D0 F1
bank03_sub_8CD9:
    INX                    // E8
    LDA $8e2b,X            // BD 2B 8E
    BEQ bank03_sub_8CD6              // F0 F7
    JSR $e716              // 20 16 E7
    BCC bank03_sub_8CD9              // 90 F5
bank03_sub_8CE4:
    JMP bank03_sub_8D4B              // 4C 4B 8D
bank03_sub_8CE7:
    LDA #$54               // A9 54
    LDY #$05               // A0 05
    LDX #$04               // A2 04
bank03_sub_8CED:
    STA $22                // 85 22
    STY $23                // 84 23
    LDA $f8,X              // B5 F8
    AND #$01               // 29 01
    LSR A                  // 4A
    ROR A                  // 6A
    EOR #$80               // 49 80
    STA $24                // 85 24
    LDY #$05               // A0 05
bank03_sub_8CFD:
    LDA ($22),Y            // B1 22
    AND #$7f               // 29 7F
    EOR $24                // 45 24
    CPY #$03               // C0 03
    BCC bank03_sub_8D09              // 90 02
    EOR #$80               // 49 80
bank03_sub_8D09:
    STA ($22),Y            // 91 22
    DEY                    // 88
    BPL bank03_sub_8CFD              // 10 EF
    LDY $23                // A4 23
    LDA $22                // A5 22
    SEC                    // 38
    SBC #$50               // E9 50
    BCS bank03_sub_8D18              // B0 01
    DEY                    // 88
bank03_sub_8D18:
    DEX                    // CA
    CPX #$02               // E0 02
    BNE bank03_sub_8CED              // D0 D0
bank03_sub_8D1D:
    JSR $8590              // 20 90 85
    CMP #$20               // C9 20
    BEQ bank03_sub_8D79              // F0 55
    CMP #$03               // C9 03
    BNE bank03_sub_8D2E              // D0 06
    PLA                    // 68
    PLA                    // 68
    LDA #$00               // A9 00
    CLC                    // 18
    RTS                    // 60
bank03_sub_8D2E:
    SEC                    // 38
    SBC #$85               // E9 85
    CMP #$04               // C9 04
    BCS bank03_sub_8D1D              // B0 E8
    TAX                    // AA
    CPX #$02               // E0 02
    BCS bank03_sub_8D70              // B0 36
    LDA $f9,X              // B5 F9
    STA $ba                // 85 BA
    TXA                    // 8A
    PHA                    // 48
    JSR bank03_sub_9F02              // 20 02 9F
    .byte $33    // undocumented opcode
    .byte $80    // undocumented opcode
    PLA                    // 68
    TAX                    // AA
    LDA $ba                // A5 BA
    STA $f9,X              // 95 F9
bank03_sub_8D4B:
    LDY #$15               // A0 15
    LDX #$02               // A2 02
    CLC                    // 18
    JSR $fff0              // 20 F0 FF
    LDX $f9                // A6 F9
    JSR bank03_sub_86E5              // 20 E5 86
    LDY #$15               // A0 15
    LDX #$04               // A2 04
    CLC                    // 18
    JSR $fff0              // 20 F0 FF
    LDX $fa                // A6 FA
    JSR bank03_sub_86E5              // 20 E5 86
    LDY #$15               // A0 15
    LDX #$0b               // A2 0B
    CLC                    // 18
    JSR $fff0              // 20 F0 FF
    JMP bank03_sub_8CE7              // 4C E7 8C
bank03_sub_8D70:
    LDA #$01               // A9 01
    EOR $f9,X              // 55 F9
    STA $f9,X              // 95 F9
    JMP bank03_sub_8CE7              // 4C E7 8C
bank03_sub_8D79:
    LDA #$00               // A9 00
    LSR $fc                // 46 FC
    ROR A                  // 6A
    LSR $fb                // 46 FB
    ROR A                  // 6A
    STA $8c                // 85 8C
    LDX #$00               // A2 00
    STX $ba                // 86 BA
    STX $fd                // 86 FD
    INX                    // E8
bank03_sub_8D8A:
    STX $24                // 86 24
    LDA $f9,X              // B5 F9
    CMP $ba                // C5 BA
    STA $ba                // 85 BA
    BEQ bank03_sub_8DA1              // F0 0D
    JSR bank03_sub_9F02              // 20 02 9F
    .byte $0C    // undocumented opcode
    .byte $80    // undocumented opcode
    BNE bank03_sub_8DA1              // D0 06
    PLA                    // 68
    PLA                    // 68
    LDA #$05               // A9 05
    SEC                    // 38
    RTS                    // 60
bank03_sub_8DA1:
    LDA $1f                // A5 1F
    EOR $fd                // 45 FD
    STA $fd                // 85 FD
    LDX $24                // A6 24
    DEX                    // CA
    BPL bank03_sub_8D8A              // 10 DE
    CLC                    // 18
    LDA $1f                // A5 1F
    STA $033c              // 8D 3C 03
    LDA $fd                // A5 FD
    RTS                    // 60
    .byte $93, $20, $FF, $20, $43, $4F, $50, $59, $0D, $0D, $20, $46, $31, $2E, $20, $53    // data $8DB5
    .byte $4F, $55, $52, $43, $45, $20, $44, $45, $56, $49, $43, $45, $3A, $20, $12, $20    // data $8DC5
    .byte $30, $38, $20, $0D, $0D, $20, $46, $33, $2E, $20, $54, $41, $52, $47, $45, $54    // data $8DD5
    .byte $20, $44, $45, $56, $49, $43, $45, $3A, $20, $12, $20, $30, $38, $20, $0D, $0D    // data $8DE5
    .byte $20, $46, $35, $2E, $20, $FF, $3A, $20, $59, $45, $53, $20, $4E, $4F, $0D, $0D    // data $8DF5
    .byte $20, $46, $37, $2E, $20, $FF, $3A, $20, $59, $45, $53, $20, $4E, $4F, $0D, $0D    // data $8E05
    .byte $20, $50, $52, $45, $53, $53, $20, $53, $50, $41, $43, $45, $20, $54, $4F, $20    // data $8E15
    .byte $53, $54, $41, $52, $54, $0D, $00, $46, $49, $4C, $45, $00, $4D, $55, $4C, $54    // data $8E25
    .byte $49, $20, $4F, $55, $54, $50, $55, $54, $20, $00, $52, $45, $50, $4C, $41, $43    // data $8E35
    .byte $45, $20, $46, $49, $4C, $45, $53, $00, $44, $49, $53, $4B, $00, $49, $47, $4E    // data $8E45
    .byte $4F, $52, $45, $20, $45, $52, $52, $4F, $52, $53, $00, $42, $41, $4D, $20, $43    // data $8E55
    .byte $4F, $50, $59, $20, $20, $20, $20, $20, $00    // data $8E65
bank03_sub_8E6E:
    SEC                    // 38
    BIT $18                // 24 18
    LDA $f9                // A5 F9
    EOR $fa                // 45 FA
    BNE bank03_sub_8EDC              // D0 65
    BCS bank03_api_14              // B0 3A
    JSR bank03_api_13              // 20 7F 8E
    JMP bank03_sub_8EC6              // 4C C6 8E
bank03_api_13:
    LDA $f9                // A5 F9
bank03_sub_8E81:
    PHA                    // 48
    JSR bank03_sub_8362              // 20 62 83
    ORA $4e49              // 0D 49 4E
    .byte $53    // undocumented opcode
    EOR $52                // 45 52
    .byte $54    // undocumented opcode
    JSR $4f53              // 20 53 4F
    EOR $52,X              // 55 52
    .byte $43    // undocumented opcode
    EOR $20                // 45 20
    .byte $44    // undocumented opcode
    EOR #$53               // 49 53
    .byte $4B    // undocumented opcode
    JSR $4e49              // 20 49 4E
    JSR $5244              // 20 44 52
    EOR #$56               // 49 56
    EOR $20                // 45 20
    BRK                    // 00
    .byte $68, $AA, $A9, $00, $4C, $CD, $BD    // data $8EA3
bank03_sub_8EAA:
    JSR bank03_api_13              // 20 7F 8E
    LDA $fa                // A5 FA
    CMP $f9                // C5 F9
    BEQ bank03_sub_8EC6              // F0 13
bank03_api_14:
    LDA $fa                // A5 FA
    JSR bank03_sub_8E81              // 20 81 8E
    LDA #$07               // A9 07
    STA $d3                // 85 D3
    JSR bank03_sub_8362              // 20 62 83
    .byte $54    // undocumented opcode
    EOR ($52,X)            // 41 52
    .byte $47    // undocumented opcode
    EOR $54                // 45 54
    BRK                    // 00
bank03_sub_8EC6:
    JSR bank03_sub_8362              // 20 62 83
    ORA $523c              // 0D 3C 52
    EOR $54                // 45 54
    EOR $52,X              // 55 52
    LSR $003e              // 4E 3E 00
bank03_sub_8ED3:
    JSR $8590              // 20 90 85
    BCS bank03_sub_8EDD              // B0 05
    CMP #$0d               // C9 0D
    BNE bank03_sub_8ED3              // D0 F7
bank03_sub_8EDC:
    RTS                    // 60
bank03_sub_8EDD:
    PLA                    // 68
    PLA                    // 68
    JMP bank03_sub_8985              // 4C 85 89
bank03_api_15:
    LDA #$21               // A9 21
    JSR bank03_sub_8CA6              // 20 A6 8C
    BNE bank03_sub_8EF1              // D0 08
    LDA $1f                // A5 1F
    BEQ bank03_sub_8F12              // F0 25
    AND #$20               // 29 20
    BNE bank03_sub_8F15              // D0 24
bank03_sub_8EF1:
    JSR bank03_sub_8362              // 20 62 83
    ORA $4944              // 0D 44 49
    .byte $53    // undocumented opcode
    .byte $4B    // undocumented opcode
    .byte $43    // undocumented opcode
    .byte $4F    // undocumented opcode
    BVC bank03_sub_8F56              // 50 59
    JSR $5349              // 20 49 53
    JSR $3531              // 20 31 35
    .byte $34    // undocumented opcode
    AND ($20),Y            // 31 20
    .byte $4F    // undocumented opcode
    LSR $594c              // 4E 4C 59
    ROL $2e2e              // 2E 2E 2E
    ORA $4c00              // 0D 00 4C
    .byte $83    // undocumented opcode
    .byte $89    // undocumented opcode
bank03_sub_8F12:
    JMP bank03_sub_8C60              // 4C 60 8C
bank03_sub_8F15:
    JSR bank03_sub_8EAA              // 20 AA 8E
    LDA $f9                // A5 F9
    STA $ba                // 85 BA
    LDA #$00               // A9 00
    STA $fd                // 85 FD
    LDA #$0e               // A9 0E
    STA $fe                // 85 FE
    JSR bank03_sub_8FBD              // 20 BD 8F
    LDY #$00               // A0 00
    LDX #$01               // A2 01
bank03_sub_8F2B:
    STX $10                // 86 10
    BIT $8c                // 24 8C
    BVS bank03_sub_8F46              // 70 15
    STY $24                // 84 24
    JSR bank03_sub_9F02              // 20 02 9F
    ORA #$80               // 09 80
    LDA $10                // A5 10
    ASL A                  // 0A
    ASL A                  // 0A
    TAY                    // A8
    LDA $0e00,Y            // B9 00 0E
    LDY $24                // A4 24
    CMP $13                // C5 13
    BEQ bank03_sub_8F4C              // F0 06
bank03_sub_8F46:
    INY                    // C8
    LDA $10                // A5 10
    STA $0352,Y            // 99 52 03
bank03_sub_8F4C:
    LDX $10                // A6 10
    INX                    // E8
    CPX $f8                // E4 F8
    BNE bank03_sub_8F2B              // D0 D8
    INY                    // C8
    LDA #$ff               // A9 FF
bank03_sub_8F56:
    STA $0352,Y            // 99 52 03
    LDA #$00               // A9 00
    STA $51                // 85 51
    STA $0352              // 8D 52 03
    INC $51                // E6 51
    JSR bank03_sub_9F02              // 20 02 9F
    ROL A                  // 2A
    .byte $80    // undocumented opcode
    CLC                    // 18
    LDA $f9                // A5 F9
    JSR bank03_sub_8F9F              // 20 9F 8F
    JSR bank03_sub_8E6E              // 20 6E 8E
    JSR bank03_sub_9F02              // 20 02 9F
    BRK                    // 00
    .byte $08, $A5, $50, $48, $24, $8C, $10, $06, $38, $A5, $FA, $20, $9F, $8F, $68, $AA    // data $8F74
    .byte $BD, $52, $03, $30, $08, $86, $51, $20, $70, $8E, $4C, $67, $8F, $20, $AE, $FF    // data $8F84
    .byte $20, $7C, $8C, $D0, $03, $4C, $15, $8F, $4C, $83, $89    // data $8F94
bank03_sub_8F9F:
    STA $ba                // 85 BA
    JSR bank03_sub_9F02              // 20 02 9F
    STA $2408,X            // 9D 08 24
    STY $3110              // 8C 10 31
    JSR bank03_sub_8362              // 20 62 83
    ORA $5245              // 0D 45 52
    .byte $52    // undocumented opcode
    .byte $4F    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $53    // undocumented opcode
    .byte $3A    // undocumented opcode
    BRK                    // 00
    .byte $A6, $FE, $A9, $00, $4C, $CD, $BD    // data $8FB6
bank03_sub_8FBD:
    JSR bank03_sub_9F02              // 20 02 9F
    .byte $0C    // undocumented opcode
    .byte $80    // undocumented opcode
    BEQ bank03_sub_8FD8              // F0 14
    LDA #$24               // A9 24
    STA $f8                // 85 F8
    LDX #$0e               // A2 0E
    LDA #$12               // A9 12
    LDY #$00               // A0 00
    JSR bank03_sub_9F01              // 20 01 9F
    .byte $27    // undocumented opcode
    .byte $80    // undocumented opcode
    JSR bank03_sub_8C60              // 20 60 8C
    BCC bank03_sub_8FDB              // 90 03
bank03_sub_8FD8:
    JMP bank03_sub_8EDD              // 4C DD 8E
bank03_sub_8FDB:
    RTS                    // 60
bank03_api_24:
    JSR bank03_sub_8362              // 20 62 83
    ORA $2f52              // 0D 52 2F
    .byte $53    // undocumented opcode
    JSR $202d              // 20 2D 20
    EOR ($42,X)            // 41 42
    .byte $4F    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $54    // undocumented opcode
    ORA $5f20              // 0D 20 5F
    JSR $2d20              // 20 20 2D
    JSR $4153              // 20 53 41
    LSR $45,X              // 56 45
    JSR $5543              // 20 43 55
    .byte $52    // undocumented opcode
    .byte $52    // undocumented opcode
    EOR $4e                // 45 4E
    .byte $54    // undocumented opcode
    JSR $4f4d              // 20 4D 4F
    .byte $44    // undocumented opcode
    EOR $0d                // 45 0D
    .byte $53    // undocumented opcode
    BVC bank03_sub_904A              // 50 43
    JSR $202d              // 20 2D 20
    .byte $54    // undocumented opcode
    .byte $4F    // undocumented opcode
    .byte $47    // undocumented opcode
    .byte $47    // undocumented opcode
    JMP $2045              // 4C 45 20
    .byte $4D, $4F, $44, $45, $53, $0D, $43, $42, $4D, $20, $2D, $20, $54, $4F, $47, $47    // data $9011
    .byte $4C, $45, $20, $49, $4E, $54, $45, $52, $4C, $41, $43, $45, $0D, $20, $31, $20    // data $9021
    .byte $20, $2D, $20, $43, $48, $41, $4E, $47, $45, $20, $42, $47, $20, $43, $4F, $4C    // data $9031
    .byte $4F, $52, $0D, $0D, $2D, $20, $50, $52, $45    // data $9041
bank03_sub_904A:
    .byte $53    // undocumented opcode
    .byte $53    // undocumented opcode
    JSR $5053              // 20 53 50
    EOR ($43,X)            // 41 43
    EOR $20                // 45 20
    .byte $54    // undocumented opcode
    .byte $4F    // undocumented opcode
    JSR $5453              // 20 53 54
    EOR ($52,X)            // 41 52
    .byte $54    // undocumented opcode
    JSR $002d              // 20 2D 00
    RTS                    // 60
bank03_api_20:
    JSR bank03_sub_8362              // 20 62 83
    ORA $200d              // 0D 0D 20
    EOR ($2d,X)            // 41 2D
    .byte $4B    // undocumented opcode
    .byte $4F    // undocumented opcode
    EOR ($4c,X)            // 41 4C
    EOR ($20,X)            // 41 20
    BVC bank03_sub_90B8              // 50 49
    .byte $43    // undocumented opcode
    .byte $54    // undocumented opcode
    EOR $52,X              // 55 52
    EOR $0d                // 45 0D
    JSR $2d42              // 20 42 2D
    .byte $42    // undocumented opcode
    EOR #$54               // 49 54
    EOR $5041              // 4D 41 50
    ORA $4320              // 0D 20 43
    AND $4843              // 2D 43 48
    EOR ($52,X)            // 41 52
    .byte $53    // undocumented opcode
    EOR $54                // 45 54
    ORA $4420              // 0D 20 44
    AND $4353              // 2D 53 43
    .byte $52    // undocumented opcode
    EOR $45                // 45 45
    LSR $4152              // 4E 52 41
    EOR $200d              // 4D 0D 20
    EOR $2d                // 45 2D
    .byte $43    // undocumented opcode
    .byte $4F    // undocumented opcode
    JMP $524f              // 4C 4F 52
    .byte $52, $41, $4D, $0D, $20, $46, $2D, $46, $4C, $49, $2F, $49, $46, $4C, $49, $20    // data $909F
    .byte $50, $49, $43, $54, $55, $52, $45, $0D, $20    // data $90AF
bank03_sub_90B8:
    .byte $47    // undocumented opcode
    AND $454d              // 2D 4D 45
    EOR $524f              // 4D 4F 52
    EOR $4120,Y            // 59 20 41
    .byte $52    // undocumented opcode
    EOR $41                // 45 41
    ORA $6000              // 0D 00 60
bank03_api_00:
    JSR bank03_api_07              // 20 F6 90
    TYA                    // 98
bank03_sub_90CC:
    STA $0255,Y            // 99 55 02
    INY                    // C8
    CPY #$52               // C0 52
    BNE bank03_sub_90CC              // D0 F8
    LDX #$02               // A2 02
bank03_sub_90D6:
    STA $00,X              // 95 00
    INX                    // E8
    BNE bank03_sub_90D6              // D0 FB
    LDA #$64               // A9 64
    STA $0255              // 8D 55 02
    LDA #$0a               // A9 0A
    STA $0257              // 8D 57 02
    LDA #$3c               // A9 3C
    STA $b2                // 85 B2
    LDA #$03               // A9 03
    STA $b3                // 85 B3
    LDY #$a0               // A0 A0
    JSR $fd8d              // 20 8D FD
    ASL A                  // 0A
    STA $ba                // 85 BA
    RTS                    // 60
bank03_api_07:
    LDY #$20               // A0 20
bank03_sub_90F8:
    LDA $fd2f,Y            // B9 2F FD
    STA $0313,Y            // 99 13 03
    DEY                    // 88
    BNE bank03_sub_90F8              // D0 F7
    RTS                    // 60
bank03_api_10:
    SEI                    // 78
    CLD                    // D8
    LDA #$00               // A9 00
    STA $d016              // 8D 16 D0
    LDX #$a7               // A2 A7
bank03_sub_910B:
    STA $0200,X            // 9D 00 02
    INX                    // E8
    BNE bank03_sub_910B              // D0 FA
bank03_sub_9111:
    STA $0300,X            // 9D 00 03
    INX                    // E8
    BNE bank03_sub_9111              // D0 FA
    JSR bank03_api_00              // 20 C8 90
    JSR $fda3              // 20 A3 FD
    JSR $ff5b              // 20 5B FF
    INC $c5                // E6 C5
    LDX #$29               // A2 29
bank03_sub_9124:
    LDA $9130,X            // BD 30 91
    STA $0210,X            // 9D 10 02
    DEX                    // CA
    BPL bank03_sub_9124              // 10 F7
    JMP $0210              // 4C 10 02
    .byte $A9, $0E, $8D, $00, $DE, $58, $20, $53, $E4, $A2, $03, $BD, $00, $08, $9D, $0A    // data $9130
    .byte $02, $CA, $10, $F7, $20, $BF, $E3, $20, $22, $E4, $A2, $03, $BD, $0A, $02, $9D    // data $9140
    .byte $00, $08, $CA, $10, $F7, $68, $4C, $86, $E3    // data $9150
bank03_api_17:
    JSR $a57c              // 20 7C A5
    JSR bank03_sub_920B              // 20 0B 92
    LDA #$ff               // A9 FF
    STA $52                // 85 52
    STA $53                // 85 53
    LDY #$00               // A0 00
    LDA $2b                // A5 2B
    STA $20                // 85 20
    LDA $2c                // A5 2C
    STA $21                // 85 21
    JMP bank03_sub_919B              // 4C 9B 91
bank03_sub_9172:
    LDA ($7a),Y            // B1 7A
    BEQ bank03_sub_91BC              // F0 46
    LDA ($20),Y            // B1 20
    BEQ bank03_sub_9183              // F0 09
    LDA ($7a),Y            // B1 7A
    CMP ($20),Y            // D1 20
    BNE bank03_sub_9183              // D0 03
    INY                    // C8
    BNE bank03_sub_9172              // D0 EF
bank03_sub_9183:
    JSR bank03_sub_9212              // 20 12 92
    LDY #$00               // A0 00
    LDA ($20),Y            // B1 20
    BNE bank03_sub_9172              // D0 E6
    JSR bank03_sub_9212              // 20 12 92
    LDY #$00               // A0 00
    STY $ae                // 84 AE
    LDA ($20),Y            // B1 20
    BNE bank03_sub_919B              // D0 04
    LDA #$01               // A9 01
    STA $ae                // 85 AE
bank03_sub_919B:
    JSR bank03_sub_9212              // 20 12 92
    LDA ($20),Y            // B1 20
    BNE bank03_sub_91A9              // D0 07
    LDA $ae                // A5 AE
    CMP #$01               // C9 01
    BNE bank03_sub_91A9              // D0 01
    RTS                    // 60
bank03_sub_91A9:
    JSR bank03_sub_9212              // 20 12 92
    LDA ($20),Y            // B1 20
    STA $50                // 85 50
    JSR bank03_sub_9212              // 20 12 92
    LDA ($20),Y            // B1 20
    STA $51                // 85 51
    JSR bank03_sub_9212              // 20 12 92
    BNE bank03_sub_9172              // D0 B6
bank03_sub_91BC:
    LDA $50                // A5 50
    CMP $52                // C5 52
    BNE bank03_sub_91C8              // D0 06
    LDA $51                // A5 51
    CMP $53                // C5 53
    BEQ bank03_sub_9183              // F0 BB
bank03_sub_91C8:
    LDA $50                // A5 50
    STA $52                // 85 52
    STA $63                // 85 63
    LDA $51                // A5 51
    STA $62                // 85 62
    STA $53                // 85 53
    LDX #$90               // A2 90
    SEC                    // 38
    JSR $bc49              // 20 49 BC
    JSR $bddf              // 20 DF BD
    JSR bank03_sub_91FD              // 20 FD 91
    SEC                    // 38
    JSR $fff0              // 20 F0 FF
    TYA                    // 98
bank03_sub_91E5:
    SBC #$0a               // E9 0A
    BCS bank03_sub_91E5              // B0 FC
    EOR #$ff               // 49 FF
    ADC #$01               // 69 01
    TAX                    // AA
    INX                    // E8
bank03_sub_91EF:
    DEX                    // CA
    BNE bank03_sub_91F5              // D0 03
    JMP bank03_sub_9183              // 4C 83 91
bank03_sub_91F5:
    LDA #$20               // A9 20
    JSR $ffd2              // 20 D2 FF
    JMP bank03_sub_91EF              // 4C EF 91
bank03_sub_91FD:
    LDX #$00               // A2 00
bank03_sub_91FF:
    LDA $0100,X            // BD 00 01
    BEQ bank03_sub_920A              // F0 06
    JSR $ffd2              // 20 D2 FF
    INX                    // E8
    BNE bank03_sub_91FF              // D0 F5
bank03_sub_920A:
    RTS                    // 60
bank03_sub_920B:
    INC $7a                // E6 7A
    BNE bank03_sub_9211              // D0 02
    INC $7b                // E6 7B
bank03_sub_9211:
    RTS                    // 60
bank03_sub_9212:
    INC $20                // E6 20
    BNE bank03_sub_9218              // D0 02
    INC $21                // E6 21
bank03_sub_9218:
    RTS                    // 60
bank03_api_16:
    LDA #$00               // A9 00
    STA $51                // 85 51
    STA $52                // 85 52
    LDA #$ff               // A9 FF
    STA $3d                // 85 3D
    BNE bank03_sub_922B              // D0 06
    LDA $14                // A5 14
    STA $3d                // 85 3D
    LDA $15                // A5 15
bank03_sub_922B:
    STA $3e                // 85 3E
    SEI                    // 78
    JSR $a68e              // 20 8E A6
bank03_sub_9231:
    LDY #$02               // A0 02
    LDA ($7a),Y            // B1 7A
    BNE bank03_sub_923A              // D0 03
    JMP bank03_sub_938E              // 4C 8E 93
bank03_sub_923A:
    LDY #$04               // A0 04
    JSR $a8fb              // 20 FB A8
bank03_sub_923F:
    JSR $0073              // 20 73 00
bank03_sub_9242:
    JSR bank03_sub_93F5              // 20 F5 93
    CMP #$00               // C9 00
    BEQ bank03_sub_9231              // F0 E8
    CMP #$cb               // C9 CB
    BEQ bank03_sub_926C              // F0 1F
    CMP #$89               // C9 89
    BEQ bank03_sub_9273              // F0 22
    CMP #$8d               // C9 8D
    BEQ bank03_sub_9273              // F0 1E
    CMP #$a7               // C9 A7
    BEQ bank03_sub_9261              // F0 08
    CMP #$8a               // C9 8A
    BEQ bank03_sub_9261              // F0 04
    CMP #$9b               // C9 9B
    BNE bank03_sub_923F              // D0 DE
bank03_sub_9261:
    JSR $0073              // 20 73 00
    BCC bank03_sub_9276              // 90 10
bank03_sub_9266:
    CMP #$ab               // C9 AB
    BEQ bank03_sub_9273              // F0 09
    BNE bank03_sub_9242              // D0 D6
bank03_sub_926C:
    JSR $0073              // 20 73 00
    CMP #$a4               // C9 A4
    BNE bank03_sub_923F              // D0 CC
bank03_sub_9273:
    JSR $0073              // 20 73 00
bank03_sub_9276:
    LDX $7a                // A6 7A
    STX $8d                // 86 8D
    LDX $7b                // A6 7B
    STX $8e                // 86 8E
    JSR $a96b              // 20 6B A9
    LDA $14                // A5 14
    STA $fb                // 85 FB
    LDA $15                // A5 15
    STA $fc                // 85 FC
    JSR bank03_sub_9295              // 20 95 92
    JSR $0079              // 20 79 00
    CMP #$2c               // C9 2C
    BEQ bank03_sub_9273              // F0 E0
    BNE bank03_sub_9266              // D0 D1
bank03_sub_9295:
    JSR bank03_sub_93E2              // 20 E2 93
bank03_sub_9298:
    LDY #$01               // A0 01
    LDA ($5f),Y            // B1 5F
    BEQ bank03_sub_92CC              // F0 2E
    INY                    // C8
    JSR bank03_sub_9411              // 20 11 94
    CMP $3e                // C5 3E
    BNE bank03_sub_92AA              // D0 04
    CPX $3d                // E4 3D
    BEQ bank03_sub_92AC              // F0 02
bank03_sub_92AA:
    BCS bank03_sub_92CC              // B0 20
bank03_sub_92AC:
    CMP $fc                // C5 FC
    BNE bank03_sub_92B4              // D0 04
    CPX $fb                // E4 FB
    BEQ bank03_sub_92CD              // F0 19
bank03_sub_92B4:
    BCS bank03_sub_92CC              // B0 16
    LDA $02                // A5 02
    ADC $8b                // 65 8B
    STA $8b                // 85 8B
    BCC bank03_sub_92C0              // 90 02
    INC $8c                // E6 8C
bank03_sub_92C0:
    LDY #$00               // A0 00
    JSR bank03_sub_9411              // 20 11 94
    STX $5f                // 86 5F
    STA $60                // 85 60
    JMP bank03_sub_9298              // 4C 98 92
bank03_sub_92CC:
    RTS                    // 60
bank03_sub_92CD:
    LDA $8b                // A5 8B
    STA $63                // 85 63
    LDA $8c                // A5 8C
    STA $62                // 85 62
    LDX #$90               // A2 90
    SEC                    // 38
    JSR $bc49              // 20 49 BC
    JSR $bddf              // 20 DF BD
    LDY #$ff               // A0 FF
bank03_sub_92E0:
    INY                    // C8
    LDA $0100,Y            // B9 00 01
    BNE bank03_sub_92E0              // D0 FA
    STY $8f                // 84 8F
    LDA $7a                // A5 7A
    SEC                    // 38
    SBC $8d                // E5 8D
    SEC                    // 38
    SBC $8f                // E5 8F
    BNE bank03_sub_92F5              // D0 03
    JMP bank03_sub_9372              // 4C 72 93
bank03_sub_92F5:
    BCC bank03_sub_9341              // 90 4A
    STA $ab                // 85 AB
    LDA $7a                // A5 7A
    STA $3b                // 85 3B
    SBC $ab                // E5 AB
    STA $39                // 85 39
    LDA $7b                // A5 7B
    STA $3c                // 85 3C
    SBC #$00               // E9 00
    STA $3a                // 85 3A
    PHA                    // 48
    SEC                    // 38
    LDA $2d                // A5 2D
    SBC $7a                // E5 7A
    STA $a9                // 85 A9
    LDA $2e                // A5 2E
    SBC $7b                // E5 7B
    STA $aa                // 85 AA
    LDY #$00               // A0 00
    LDX $aa                // A6 AA
    BEQ bank03_sub_932B              // F0 0E
bank03_sub_931D:
    LDA ($3b),Y            // B1 3B
    STA ($39),Y            // 91 39
    INY                    // C8
    BNE bank03_sub_931D              // D0 F9
    INC $3c                // E6 3C
    INC $3a                // E6 3A
    DEX                    // CA
    BNE bank03_sub_931D              // D0 F2
bank03_sub_932B:
    LDX $a9                // A6 A9
    BEQ bank03_sub_9337              // F0 08
bank03_sub_932F:
    LDA ($3b),Y            // B1 3B
    STA ($39),Y            // 91 39
    INY                    // C8
    DEX                    // CA
    BNE bank03_sub_932F              // D0 F8
bank03_sub_9337:
    LDA $39                // A5 39
    STA $7a                // 85 7A
    PLA                    // 68
    STA $7b                // 85 7B
    JMP bank03_sub_9372              // 4C 72 93
bank03_sub_9341:
    SEC                    // 38
    STA $ab                // 85 AB
    LDA #$00               // A9 00
    SBC $ab                // E5 AB
    STA $ab                // 85 AB
    ADC $2d                // 65 2D
    STA $58                // 85 58
    LDA $2e                // A5 2E
    STA $5b                // 85 5B
    ADC #$00               // 69 00
    STA $59                // 85 59
    LDA $2d                // A5 2D
    STA $5a                // 85 5A
    LDA $7a                // A5 7A
    STA $5f                // 85 5F
    CLC                    // 18
    ADC $ab                // 65 AB
    PHA                    // 48
    LDA $7b                // A5 7B
    STA $60                // 85 60
    ADC #$00               // 69 00
    PHA                    // 48
    JSR $a3bf              // 20 BF A3
    PLA                    // 68
    STA $7b                // 85 7B
    PLA                    // 68
    STA $7a                // 85 7A
bank03_sub_9372:
    LDY $8f                // A4 8F
    DEY                    // 88
bank03_sub_9375:
    LDA $0100,Y            // B9 00 01
    STA ($8d),Y            // 91 8D
    DEY                    // 88
    BPL bank03_sub_9375              // 10 F8
    JSR $a533              // 20 33 A5
    LDA $22                // A5 22
    CLC                    // 18
    ADC #$02               // 69 02
    STA $2d                // 85 2D
    LDA $23                // A5 23
    ADC #$00               // 69 00
    STA $2e                // 85 2E
    RTS                    // 60
bank03_sub_938E:
    JSR bank03_sub_93E2              // 20 E2 93
bank03_sub_9391:
    LDY #$01               // A0 01
    LDA ($5f),Y            // B1 5F
    BNE bank03_sub_93B6              // D0 1F
bank03_sub_9397:
    LDA $37                // A5 37
    LDY $38                // A4 38
    STA $33                // 85 33
    STY $34                // 84 34
    LDA $2d                // A5 2D
    LDY $2e                // A4 2E
    STA $2f                // 85 2F
    STY $30                // 84 30
    STA $31                // 85 31
    STY $32                // 84 32
    JSR $a81d              // 20 1D A8
    LDX #$19               // A2 19
    STX $16                // 86 16
    JMP $a687              // 4C 87 A6
    .byte $60    // data $93B5
bank03_sub_93B6:
    INY                    // C8
    JSR bank03_sub_9411              // 20 11 94
    CMP $3e                // C5 3E
    BNE bank03_sub_93C2              // D0 04
    CPX $3d                // E4 3D
    BEQ bank03_sub_93C4              // F0 02
bank03_sub_93C2:
    BCS bank03_sub_9397              // B0 D3
bank03_sub_93C4:
    LDA $8c                // A5 8C
    STA ($5f),Y            // 91 5F
    DEY                    // 88
    LDA $8b                // A5 8B
    STA ($5f),Y            // 91 5F
    CLC                    // 18
    ADC $02                // 65 02
    STA $8b                // 85 8B
    BCC bank03_sub_93D6              // 90 02
    INC $8c                // E6 8C
bank03_sub_93D6:
    LDY #$00               // A0 00
    JSR bank03_sub_9411              // 20 11 94
    STX $5f                // 86 5F
    STA $60                // 85 60
    JMP bank03_sub_9391              // 4C 91 93
bank03_sub_93E2:
    LDA $fd                // A5 FD
    STA $8b                // 85 8B
    LDA $fe                // A5 FE
    STA $8c                // 85 8C
    LDA $51                // A5 51
    STA $14                // 85 14
    LDA $52                // A5 52
    STA $15                // 85 15
    JMP $a613              // 4C 13 A6
bank03_sub_93F5:
    CMP #$8f               // C9 8F
    BEQ $9404              // F0 0B
    CMP #$22               // C9 22
    BEQ bank03_sub_9406              // F0 09
    CMP #$83               // C9 83
    BNE bank03_sub_9410              // D0 0F
    LDA #$3a               // A9 3A
    BIT $00a9              // 2C A9 00
bank03_sub_9406:
    TAX                    // AA
    JSR $a90b              // 20 0B A9
    JSR $a8fb              // 20 FB A8
    JSR $0079              // 20 79 00
bank03_sub_9410:
    RTS                    // 60
bank03_sub_9411:
    LDA ($5f),Y            // B1 5F
    TAX                    // AA
    INY                    // C8
    LDA ($5f),Y            // B1 5F
    RTS                    // 60
bank03_api_31:
    LDY #$01               // A0 01
    TYA                    // 98
    STA ($2b),Y            // 91 2B
    JSR bank03_api_23              // 20 58 9F
    LDA $22                // A5 22
    LDY $23                // A4 23
    CLC                    // 18
    ADC #$02               // 69 02
    BCC bank03_sub_942A              // 90 01
    INY                    // C8
bank03_sub_942A:
    STA $2d                // 85 2D
    STY $2e                // 84 2E
    RTS                    // 60
bank03_api_28:
    JSR bank03_api_29              // 20 73 94
    TYA                    // 98
    LDY #$01               // A0 01
    STA ($c1),Y            // 91 C1
    TXA                    // 8A
    DEY                    // 88
    STA ($c1),Y            // 91 C1
    STY $0200              // 8C 00 02
    LDA $c1                // A5 C1
    STA $5f                // 85 5F
    LDA $c2                // A5 C2
    STA $60                // 85 60
    LDA $0302              // AD 02 03
    STA $c1                // 85 C1
    LDA $0303              // AD 03 03
    STA $c2                // 85 C2
    RTS                    // 60
bank03_api_30:
    LDA $c2                // A5 C2
    STA $0303              // 8D 03 03
    LDA $c1                // A5 C1
    STA $0302              // 8D 02 03
    LDA #$08               // A9 08
    LDY #$01               // A0 01
    STA ($2b),Y            // 91 2B
    JSR bank03_api_23              // 20 58 9F
    LDA $22                // A5 22
    LDY $23                // A4 23
    CLC                    // 18
    ADC #$02               // 69 02
    BCC bank03_sub_946E              // 90 01
    INY                    // C8
bank03_sub_946E:
    STA $2d                // 85 2D
    STY $2e                // 84 2E
    RTS                    // 60
bank03_api_29:
    BCS bank03_sub_94C2              // B0 4D
    JSR $a96b              // 20 6B A9
    JSR $a613              // 20 13 A6
    LDX $5f                // A6 5F
    LDY $60                // A4 60
    STX $c1                // 86 C1
    STY $c2                // 84 C2
    JSR $0079              // 20 79 00
    CMP #$2d               // C9 2D
    BNE bank03_sub_94C2              // D0 38
    JSR $0073              // 20 73 00
    BNE bank03_sub_94A0              // D0 11
    LDA $2d                // A5 2D
    SEC                    // 38
    SBC #$02               // E9 02
    TAX                    // AA
    STA $5f                // 85 5F
    LDA $2e                // A5 2E
    SBC #$00               // E9 00
    TAY                    // A8
    STA $60                // 85 60
    BNE bank03_sub_94B7              // D0 17
bank03_sub_94A0:
    JSR $a96b              // 20 6B A9
    BNE bank03_sub_94C2              // D0 1D
    JSR $a613              // 20 13 A6
    LDX $5f                // A6 5F
    LDY $60                // A4 60
    BCC bank03_sub_94B7              // 90 09
    LDY #$00               // A0 00
    LDA ($5f),Y            // B1 5F
    TAX                    // AA
    INY                    // C8
    LDA ($5f),Y            // B1 5F
    TAY                    // A8
bank03_sub_94B7:
    LDA $c1                // A5 C1
    CMP $5f                // C5 5F
    LDA $c2                // A5 C2
    SBC $60                // E5 60
    BCS bank03_sub_94C2              // B0 01
    RTS                    // 60
bank03_sub_94C2:
    JMP $af08              // 4C 08 AF
bank03_api_22:
    JSR $e544              // 20 44 E5
bank03_sub_94C8:
    JSR bank03_sub_8362              // 20 62 83
    .byte $43    // undocumented opcode
    EOR $52,X              // 55 52
    .byte $52    // undocumented opcode
    EOR $4e                // 45 4E
    .byte $54    // undocumented opcode
    JMP $2059              // 4C 59 20
    .byte $4F, $55, $54, $20, $4F, $46, $20, $4F, $52, $44, $45, $52, $2E, $2E, $2E, $0D    // data $94D5
    .byte $0D, $0D, $00, $4C, $7F, $85    // data $94E5
bank03_api_06:
    JSR $e544              // 20 44 E5
    JSR bank03_sub_8362              // 20 62 83
    EOR $554f,Y            // 59 4F 55
    JSR $4957              // 20 57 49
    .byte $53    // undocumented opcode
    PHA                    // 48
    JSR $2e2e              // 20 2E 2E
    ROL $000d              // 2E 0D 00
    JMP bank03_api_18              // 4C 7F 85
bank03_api_25:
    JSR bank03_sub_8362              // 20 62 83
    ORA $0d0d              // 0D 0D 0D
    ORA ($46,X)            // 01 46
    AND ($2a),Y            // 31 2A
    .byte $43    // undocumented opcode
    .byte $4F    // undocumented opcode
    LSR $4946              // 4E 46 49
    .byte $47    // undocumented opcode
    EOR $52,X              // 55 52
    EOR $20                // 45 20
    EOR $4d45              // 4D 45 4D
    .byte $4F    // undocumented opcode
    .byte $52    // undocumented opcode
    EOR $010d,Y            // 59 0D 01
    LSR $33                // 46 33
    ROL A                  // 2A
    LSR $524f              // 4E 4F 52
    EOR $4c41              // 4D 41 4C
    JSR $4552              // 20 52 45
    .byte $53    // undocumented opcode
    EOR $54                // 45 54
    ORA $4601              // 0D 01 46
    AND $2a,X              // 35 2A
    EOR $54,X              // 55 54
    EOR #$4c               // 49 4C
    EOR #$54               // 49 54
    EOR #$45               // 49 45
    .byte $53    // undocumented opcode
    ORA $4601              // 0D 01 46
    .byte $37    // undocumented opcode
    ROL A                  // 2A
    EOR #$4e               // 49 4E
    .byte $53    // undocumented opcode
    .byte $54    // undocumented opcode
    EOR ($4c,X)            // 41 4C
    JMP $4620              // 4C 20 46
    .byte $41, $53, $54, $4C, $4F, $41, $44, $00, $2C, $01, $DE, $50, $28, $20, $62, $83    // data $9549
    .byte $0D, $0D, $0D, $0D, $20, $20, $20, $20, $20, $20, $20, $52, $45, $55, $20, $43    // data $9559
    .byte $4F, $4D, $50, $41, $54, $49, $42, $49, $4C, $49, $54, $59, $20, $45, $4E, $41    // data $9569
    .byte $42, $4C, $45, $44, $00, $20, $62, $83, $0D, $0D, $20, $20, $20, $20, $53, $49    // data $9579
    .byte $4C, $56, $45, $52, $53, $55, $52, $46, $45, $52, $20, $00, $AD, $01, $DE, $09    // data $9589
    .byte $01, $8D, $01, $DE, $A9, $FF, $8D, $0F, $DE, $AD, $0F, $DE, $C9, $FF, $D0, $16    // data $9599
    .byte $20, $62, $83, $46, $4F, $55, $4E, $44, $20, $2D, $20, $45, $4E, $41, $42, $4C    // data $95A9
    .byte $45, $44, $00, $4C, $D7, $95, $20, $62, $83, $4E, $4F, $54, $20, $46, $4F, $55    // data $95B9
    .byte $4E, $44, $20, $2D, $20, $44, $49, $53, $41, $42, $4C, $45, $44, $00, $AD, $01    // data $95C9
    .byte $DE, $29, $FE, $8D, $01, $DE, $A2, $18, $A0, $00, $20, $76, $85, $AD, $A6, $02    // data $95D9
    .byte $F0, $0B, $20, $62, $83, $50, $41, $4C, $20, $00, $4C, $FF, $95, $20, $62, $83    // data $95E9
    .byte $4E, $54, $53, $43, $20, $00, $A9, $37, $85, $01, $A5, $01, $C9, $77, $F0, $0A    // data $95F9
    .byte $20, $62, $83, $43, $36, $34, $00, $4C, $1B, $96, $20, $62, $83, $43, $31, $32    // data $9609
    .byte $38, $00, $A2, $18, $A0, $1B, $20, $76, $85, $20, $62, $83, $20, $50, $41, $4C    // data $9619
    .byte $20, $36, $34, $4B, $42, $20, $52, $4F, $00, $AD, $A6, $02, $D0, $16, $A2, $18    // data $9629
    .byte $A0, $10, $20, $76, $85, $20, $62, $83, $96, $3C, $57, $41, $52, $4E, $49, $4E    // data $9639
    .byte $47, $21, $3E, $00, $A9, $0D, $8D, $E7, $07, $A9, $06, $8D, $FF, $D9, $60    // data $9649
bank03_api_26:
    JSR bank03_sub_8362              // 20 62 83
    JSR $3146              // 20 46 31
    ROL A                  // 2A
    .byte $42    // undocumented opcode
    EOR ($43,X)            // 41 43
    .byte $4B    // undocumented opcode
    EOR $50,X              // 55 50
    JSR $4620              // 20 20 46
    .byte $33    // undocumented opcode
    ROL A                  // 2A
    .byte $52    // undocumented opcode
    EOR $53                // 45 53
    .byte $54    // undocumented opcode
    EOR ($52,X)            // 41 52
    .byte $54    // undocumented opcode
    JSR $4620              // 20 20 46
    .byte $37    // undocumented opcode
    ROL A                  // 2A
    .byte $53    // undocumented opcode
    .byte $43    // undocumented opcode
    .byte $52    // undocumented opcode
    EOR $45                // 45 45
    LSR $0d0d              // 4E 0D 0D
    ORA $4d20              // 0D 20 4D
    ROL A                  // 2A
    EOR $4e4f              // 4D 4F 4E
    EOR #$54               // 49 54
    .byte $4F    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $02    // undocumented opcode
    .byte $0B    // undocumented opcode
    EOR $2a                // 45 2A
    BVC bank03_sub_96DE              // 50 4F
    .byte $4B    // undocumented opcode
    EOR $53                // 45 53
    ORA $4420              // 0D 20 44
    ROL A                  // 2A
    .byte $44    // undocumented opcode
    EOR #$52               // 49 52
    EOR $43                // 45 43
    .byte $54    // undocumented opcode
    .byte $4F    // undocumented opcode
    .byte $52    // undocumented opcode
    EOR $0902,Y            // 59 02 09
    CLI                    // 58
    ROL A                  // 2A
    BVC bank03_sub_96F4              // 50 4F
    .byte $4B    // undocumented opcode
    EOR $46                // 45 46
    EOR #$4e               // 49 4E
    .byte $44    // undocumented opcode
    EOR $52                // 45 52
    ORA $5420              // 0D 20 54
    ROL A                  // 2A
    EOR $44                // 45 44
    EOR #$54               // 49 54
    JSR $4353              // 20 53 43
    .byte $52    // undocumented opcode
    EOR $45                // 45 45
    LSR $0702              // 4E 02 07
    .byte $4B    // undocumented opcode
    ROL A                  // 2A
    .byte $53    // undocumented opcode
    BVC $9715              // 50 52
    EOR #$54               // 49 54
    EOR $4b                // 45 4B
    EOR #$4c               // 49 4C
    JMP $5245              // 4C 45 52
    .byte $0D, $20, $56, $2A, $45, $44, $49, $54, $20, $53, $50, $52, $49, $54, $45, $53    // data $96CC
    .byte $02, $06    // data $96DC
bank03_sub_96DE:
    JMP $542a              // 4C 2A 54
    .byte $55, $52, $42, $4F, $20, $4C, $49, $4E, $4B, $45, $52, $0D, $20, $43, $2A, $45    // data $96E1
    .byte $44, $49, $54    // data $96F1
bank03_sub_96F4:
    JSR $4843              // 20 43 48
    EOR ($52,X)            // 41 52
    .byte $53    // undocumented opcode
    EOR $54                // 45 54
    .byte $02    // undocumented opcode
    ORA $20                // 05 20
    BVC bank03_sub_972B              // 50 2A
    BVC bank03_sub_9744              // 50 41
    .byte $52    // undocumented opcode
    EOR ($4d,X)            // 41 4D
    EOR $54                // 45 54
    EOR $52                // 45 52
    .byte $53    // undocumented opcode
    ORA $5320              // 0D 20 53
    ROL A                  // 2A
    .byte $53    // undocumented opcode
    EOR ($56,X)            // 41 56
    EOR $4c                // 45 4C
    EOR ($4e,X)            // 41 4E
    .byte $44    // undocumented opcode
    ORA $0d0d              // 0D 0D 0D
    BRK                    // 00
    RTS                    // 60
bank03_api_27:
    JSR bank03_sub_8362              // 20 62 83
    .byte $43    // undocumented opcode
    .byte $4F    // undocumented opcode
    JMP $494c              // 4C 4C 49
    .byte $53, $49, $4F, $4E, $20, $54, $59    // data $9724
bank03_sub_972B:
    BVC bank03_sub_9772              // 50 45
    .byte $3A    // undocumented opcode
    ORA $020d              // 0D 0D 02
    .byte $0C    // undocumented opcode
    EOR ($2a,X)            // 41 2A
    .byte $53    // undocumented opcode
    BVC bank03_sub_9789              // 50 52
    EOR #$54               // 49 54
    EOR $2f                // 45 2F
    .byte $53    // undocumented opcode
    BVC bank03_sub_9790              // 50 52
    EOR #$54               // 49 54
    EOR $20                // 45 20
    BIT $44                // 24 44
bank03_sub_9744:
    BMI bank03_sub_9777              // 30 31
    EOR $0d                // 45 0D
    .byte $02    // undocumented opcode
    .byte $0C    // undocumented opcode
    .byte $42    // undocumented opcode
    ROL A                  // 2A
    .byte $53    // undocumented opcode
    BVC bank03_sub_97A1              // 50 52
    EOR #$54               // 49 54
    EOR $2f                // 45 2F
    .byte $42    // undocumented opcode
    .byte $43    // undocumented opcode
    .byte $4B    // undocumented opcode
    .byte $47    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $44    // undocumented opcode
    JSR $4424              // 20 24 44
    BMI bank03_sub_978F              // 30 31
    LSR $0d                // 46 0D
    .byte $02    // undocumented opcode
    .byte $0C    // undocumented opcode
    .byte $43    // undocumented opcode
    ROL A                  // 2A
    .byte $42    // undocumented opcode
    .byte $4F    // undocumented opcode
    .byte $54    // undocumented opcode
    PHA                    // 48
    BRK                    // 00
    .byte $60, $00, $00, $00, $00, $00, $00, $00, $00    // data $9769
bank03_sub_9772:
    BRK                    // 00
    .byte $00, $00, $00, $00    // data $9773
bank03_sub_9777:
    BRK                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9778
    .byte $00    // data $9788
bank03_sub_9789:
    BRK                    // 00
    .byte $00, $00, $00, $00, $00    // data $978A
bank03_sub_978F:
    BRK                    // 00
bank03_sub_9790:
    BRK                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9791
bank03_sub_97A1:
    BRK                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97A2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97B2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97C2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97D2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97E2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FF, $F0    // data $97F2
    .byte $05, $A2, $10, $4C, $F9, $BE, $A0, $04, $AD, $32, $B3, $91, $4B, $C8, $AD, $33    // data $9802
    .byte $B3, $91, $4B, $60, $A9, $00, $8D, $1A, $B3, $A9, $06, $20, $94, $C5, $A9, $FF    // data $9812
    .byte $20, $B4, $C5, $AD, $23, $B3, $20, $B4, $C5, $AD, $24, $B3, $20, $B4, $C5, $AD    // data $9822
    .byte $32, $B3, $20, $B4, $C5, $AD, $33, $B3, $4C, $B4, $C5, $AD, $11, $B3, $F0, $05    // data $9832
    .byte $A2, $0F, $4C, $F9, $BE, $AD, $FF, $B2, $F0, $05, $A2, $07, $4C, $FC, $BE, $AD    // data $9842
    .byte $39, $B3, $F0, $09, $AD, $06, $CB, $AE, $07, $CB, $4C, $A2, $BE, $60, $20, $37    // data $9852
    .byte $C1, $AD, $33, $B3, $8D, $09, $CB, $AD, $32, $B3, $8D, $08, $CB, $CD, $06, $CB    // data $9862
    .byte $AD, $33, $B3, $ED, $07, $CB, $90, $05, $A2, $12, $4C, $F9, $BE, $4C, $03, $80    // data $9872
    .byte $2C, $39, $B3, $30, $13, $20, $AD, $C2, $AD, $33, $B3, $F0, $05, $A2, $03, $20    // data $9882
    .byte $FC, $BE, $AD, $32, $B3, $8D, $47, $B3, $60, $A9, $01, $8D, $E1, $B6, $A9, $2C    // data $9892
    .byte $8D, $0C, $C9, $A9, $EA, $8D, $0F, $C9, $D0, $3B, $A2, $00, $8E, $E1, $B6, $A9    // data $98A2
    .byte $EA, $8D, $0C, $C9, $A9, $2C, $8D, $0F, $C9, $A9, $00, $8D, $02, $DF, $8D, $04    // data $98B2
    .byte $DF, $8D, $07, $DF, $A9, $CA, $8D, $03, $DF, $A9, $01, $8D, $08, $DF, $8E, $05    // data $98C2
    .byte $DF, $AD, $06, $80, $8D, $06, $DF, $20, $27, $C9, $A9, $00, $8D, $06, $DF, $20    // data $98D2
    .byte $2A, $C9, $E8, $D0, $D4, $A9, $00, $8D, $23, $CB, $A9, $00, $8D, $24, $CB, $4C    // data $98E2
    .byte $CF, $B2, $A9, $C0, $8D, $02, $DF, $A9, $02, $8D, $03, $DF, $A5, $3B, $8D, $04    // data $98F2
    .byte $DF, $A5, $3C, $8D, $05, $DF, $C8, $8C, $07, $DF, $EA, $A0, $00, $EA, $AC, $06    // data $9902
    .byte $80, $8C, $06, $DF, $8C, $08, $DF, $A9, $00, $8D, $30, $D0, $20, $2A, $C9, $A9    // data $9912
    .byte $FD, $8D, $30, $D0, $60, $A9, $ED, $2C, $A9, $EC, $8D, $01, $DF, $78, $E6, $01    // data $9922
    .byte $AD, $00, $FF, $8D, $00, $FF, $C6, $01, $60, $78, $A9, $37, $85, $01, $A2, $31    // data $9932
    .byte $A0, $EA, $8E, $14, $03, $8C, $15, $03, $20, $81, $FF, $20, $84, $FF, $A9, $00    // data $9942
    .byte $8D, $06, $DF, $8D, $02, $DF, $8D, $04, $DF, $8D, $07, $DF, $A9, $08, $8D, $03    // data $9952
    .byte $DF, $8D, $05, $DF, $A9, $F8, $8D, $08, $DF, $A9, $ED, $8D, $01, $DF, $A9, $34    // data $9962
    .byte $85, $01, $AD, $00, $FF, $8D, $00, $FF, $A9, $37, $85, $01, $58, $4C, $00, $80    // data $9972
    .byte $BB, $BB, $00, $18, $65, $39, $85, $39, $60, $00, $00, $00, $00, $00, $00, $00    // data $9982
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9992
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99A2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99B2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99C2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99D2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99E2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99F2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9A92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AA2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AB2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AC2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AD2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AE2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9AF2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9B92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BA2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BB2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BC2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BD2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BE2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9BF2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9C92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CA2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CB2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CC2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CD2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CE2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9CF2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DA2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DB2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DC2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DD2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DE2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DF2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $BA, $DE, $C6, $01    // data $9E92
    .byte $20, $D5, $F3, $E6, $01, $60, $EA, $20, $BA, $DE, $EA, $EA, $EA, $EA, $EA, $EA    // data $9EA2
    .byte $EA, $EA, $EA, $8D, $00, $DE, $68, $60, $48, $78, $A9, $18, $48, $A9, $20, $8D    // data $9EB2
    .byte $00, $DE, $00, $00, $00, $00, $00, $2C, $80, $80, $2C, $80, $80, $48, $AD, $F2    // data $9EC2
    .byte $DE, $8D, $00, $DE, $68, $8D, $F7, $DE, $8D, $00, $DE, $60, $8D, $00, $DE, $68    // data $9ED2
    .byte $40, $EA, $85, $9E, $68, $8D, $00, $DE, $A5, $9E, $60, $18, $00, $08, $10, $18    // data $9EE2
    .byte $20, $1A, $80, $88, $90, $98, $00, $00, $00, $00, $00, $00, $00, $00, $EA    // data $9EF2
bank03_sub_9F01:
    NOP                    // EA
bank03_sub_9F02:
    NOP                    // EA
    NOP                    // EA
    NOP                    // EA
bank03_sub_9F05:
    NOP                    // EA
    NOP                    // EA
    NOP                    // EA
    NOP                    // EA
    NOP                    // EA
    SEI                    // 78
    CLD                    // D8
    STA $a5                // 85 A5
    STX $a6                // 86 A6
    STY $a7                // 84 A7
    PHP                    // 08
    PLA                    // 68
    STA $a8                // 85 A8
    PLA                    // 68
    STA $9e                // 85 9E
    CLC                    // 18
    ADC #$02               // 69 02
    TAX                    // AA
    PLA                    // 68
    STA $9f                // 85 9F
    ADC #$00               // 69 00
    PHA                    // 48
    TXA                    // 8A
    PHA                    // 48
    LDA $9e                // A5 9E
    BNE bank03_sub_9F2B              // D0 02
    DEC $9f                // C6 9F
bank03_sub_9F2B:
    DEC $9e                // C6 9E
    LDY #$00               // A0 00
    LDA ($9e),Y            // B1 9E
    SEC                    // 38
    SBC #$00               // E9 00
    TAX                    // AA
    LDA $deed              // AD ED DE
    PHA                    // 48
    LDA #$de               // A9 DE
    PHA                    // 48
    LDA #$e3               // A9 E3
    PHA                    // 48
    LDY #$03               // A0 03
    LDA ($9e),Y            // B1 9E
    PHA                    // 48
    DEY                    // 88
    LDA ($9e),Y            // B1 9E
    PHA                    // 48
    LDA $a8                // A5 A8
    PHA                    // 48
    LDA $a5                // A5 A5
    PHA                    // 48
    LDA $deee,X            // BD EE DE
    LDX $a6                // A6 A6
    LDY $a7                // A4 A7
    JMP $dede              // 4C DE DE
bank03_api_23:
    LDA $2b                // A5 2B
    LDY $2c                // A4 2C
    STA $22                // 85 22
    STY $23                // 84 23
    CLC                    // 18
bank03_sub_9F61:
    LDY #$01               // A0 01
    LDA ($22),Y            // B1 22
    BEQ bank03_sub_9F86              // F0 1F
    LDY #$04               // A0 04
bank03_sub_9F69:
    INY                    // C8
    BEQ bank03_sub_9F87              // F0 1B
    LDA ($22),Y            // B1 22
    BNE bank03_sub_9F69              // D0 F9
    INY                    // C8
    TYA                    // 98
    ADC $22                // 65 22
    TAX                    // AA
    LDY #$00               // A0 00
    STA ($22),Y            // 91 22
    LDA $23                // A5 23
    ADC #$00               // 69 00
    INY                    // C8
    STA ($22),Y            // 91 22
    STX $22                // 86 22
    STA $23                // 85 23
    BCC bank03_sub_9F61              // 90 DB
bank03_sub_9F86:
    RTS                    // 60
bank03_sub_9F87:
    LDA #$00               // A9 00
    LDY #$01               // A0 01
    STA ($22),Y            // 91 22
    RTS                    // 60
bank03_api_11:
    LDA $d021              // AD 21 D0
    AND #$0f               // 29 0F
    LDX #$01               // A2 01
    CMP #$01               // C9 01
    BNE bank03_sub_9F9A              // D0 01
    DEX                    // CA
bank03_sub_9F9A:
    STX $0286              // 8E 86 02
    RTS                    // 60
    .byte $20, $02, $9F, $33, $80, $8E, $39, $03, $A2, $05, $A0, $1D, $20, $76, $85, $A6    // data $9F9E
    .byte $BA, $A9, $00, $20, $CD, $BD, $A9, $20, $4C, $16, $E7, $20, $00, $9F, $57, $80    // data $9FAE
    .byte $D0, $03, $4C, $5D, $84, $A9, $0D, $4C, $16, $E7    // data $9FBE
bank03_api_21:
    JSR bank03_sub_8362              // 20 62 83
    ORA $2020              // 0D 20 20
    JSR $5943              // 20 43 59
    .byte $42    // undocumented opcode
    EOR $52                // 45 52
    BVC $a02b              // 50 55
    LSR $2058              // 4E 58 20
    .byte $52    // undocumented opcode
    EOR $54                // 45 54
    .byte $52    // undocumented opcode
    .byte $4F    // undocumented opcode
    JSR $4552              // 20 52 45
    BVC $a02f              // 50 4C
    EOR ($59,X)            // 41 59
    JSR $3436              // 20 36 34
    .byte $4B    // undocumented opcode
    .byte $42    // undocumented opcode
    JSR $202d              // 20 2D 20
    .byte $33    // undocumented opcode
    ROL $5038              // 2E 38 50
    ORA $6000              // 0D 00 60
    BRK                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FF5
