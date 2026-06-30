// Disassembly for rr38p-tmp12reu.bin bank 0
// Bank file offset: $0000-$1FFF
// Cartridge window: $8000-$9FFF
// Vectors: coldstart=$8009, warmstart=$800C, signature=c3 c2 cd 38 30
// Reachable instructions: 945 bytes decoded as code: 2023
// Entry points: $8009, $800C, $806E, $817F, $8187, $818A, $8760, $8AA5, $8AEB, $8B2A, $8B54, $8FBE, $9C5F, $9DB3
// Jump table from cold start:
//   $8009 -> $817F
//   $800C -> $8187
//   $800F -> $818A
//   $8012 -> $DE3F
//   $8015 -> $DE41
//   $8018 -> $8FBE
//   $801B -> $9C5F
//   $801E -> $8B2A
//   $8021 -> $9DB3
//   $8024 -> $8760
//   $8027 -> $8AEB
//   $802A -> $806E
//   $802D -> $8B54
//   $8030 -> $8AA5
// External branch/jsr/jmp targets: $0060, $0100, $0400, $0500, $454D, $4552, $455A, $4620, $DE3F, $DE41, $DE8D, $DE9D, $DEBA, $DEDE, $E3BF, $E453, $E716, $FDD0, $FF5B, $FFE4, $FFF0

// Symbol table (auto-generated)
//   $8009 bank00_cold_start
//   $800C bank00_warm_start
//   $800F bank00_sub_800F
//   $8012 bank00_sub_8012
//   $8015 bank00_sub_8015
//   $8033 bank00_sub_8033
//   $8042 bank00_sub_8042
//   $804E bank00_sub_804E
//   $8060 bank00_sub_8060
//   $806E bank00_api_11
//   $817F bank00_api_00
//   $8187 bank00_api_01
//   $818A bank00_api_02
//   $81E9 bank00_sub_81E9
//   $81EC bank00_sub_81EC
//   $8214 bank00_sub_8214
//   $821A bank00_sub_821A
//   $8250 bank00_sub_8250
//   $8289 bank00_sub_8289
//   $8293 bank00_sub_8293
//   $8298 bank00_sub_8298
//   $829B bank00_sub_829B
//   $82C1 bank00_sub_82C1
//   $82CB bank00_sub_82CB
//   $82CF bank00_sub_82CF
//   $82DA bank00_sub_82DA
//   $84EC bank00_sub_84EC
//   $84ED bank00_sub_84ED
//   $84FE bank00_sub_84FE
//   $851E bank00_sub_851E
//   $852D bank00_sub_852D
//   $8541 bank00_sub_8541
//   $854B bank00_sub_854B
//   $857B bank00_sub_857B
//   $85EB bank00_sub_85EB
//   $85F5 bank00_sub_85F5
//   $85FA bank00_sub_85FA
//   $8625 bank00_sub_8625
//   $8632 bank00_sub_8632
//   $864D bank00_sub_864D
//   $866B bank00_sub_866B
//   $8671 bank00_sub_8671
//   $868E bank00_sub_868E
//   $8691 bank00_sub_8691
//   $869F bank00_sub_869F
//   $86A0 bank00_sub_86A0
//   $86A3 bank00_sub_86A3
//   $86C8 bank00_sub_86C8
//   $8722 bank00_sub_8722
//   $8724 bank00_sub_8724
//   $8760 bank00_api_09
//   $8763 bank00_sub_8763
//   $8773 bank00_sub_8773
//   $8780 bank00_sub_8780
//   $8788 bank00_sub_8788
//   $8796 bank00_sub_8796
//   $879B bank00_sub_879B
//   $87AD bank00_sub_87AD
//   $87B2 bank00_sub_87B2
//   $87E6 bank00_sub_87E6
//   $87EA bank00_sub_87EA
//   $87F5 bank00_sub_87F5
//   $87F9 bank00_sub_87F9
//   $8811 bank00_sub_8811
//   $8816 bank00_sub_8816
//   $881B bank00_sub_881B
//   $8820 bank00_sub_8820
//   $8AA5 bank00_api_13
//   $8AAA bank00_sub_8AAA
//   $8AB6 bank00_sub_8AB6
//   $8AB9 bank00_sub_8AB9
//   $8ADF bank00_sub_8ADF
//   $8AE9 bank00_sub_8AE9
//   $8AEB bank00_api_10
//   $8AF1 bank00_sub_8AF1
//   $8AF5 bank00_sub_8AF5
//   $8B08 bank00_sub_8B08
//   $8B2A bank00_api_07
//   $8B33 bank00_sub_8B33
//   $8B3D bank00_sub_8B3D
//   $8B3F bank00_sub_8B3F
//   $8B4C bank00_sub_8B4C
//   $8B54 bank00_api_12
//   $8B9D bank00_sub_8B9D
//   $8FBE bank00_api_05
//   $8FDC bank00_sub_8FDC
//   $8FE8 bank00_sub_8FE8
//   $8FF5 bank00_sub_8FF5
//   $9007 bank00_sub_9007
//   $9018 bank00_sub_9018
//   $901E bank00_sub_901E
//   $9037 bank00_sub_9037
//   $9045 bank00_sub_9045
//   $907C bank00_sub_907C
//   $9095 bank00_sub_9095
//   $90A7 bank00_sub_90A7
//   $90B2 bank00_sub_90B2
//   $90C4 bank00_sub_90C4
//   $90D6 bank00_sub_90D6
//   $90F3 bank00_sub_90F3
//   $90F9 bank00_sub_90F9
//   $9107 bank00_sub_9107
//   $911C bank00_sub_911C
//   $9155 bank00_sub_9155
//   $9159 bank00_sub_9159
//   $927A bank00_sub_927A
//   $928B bank00_sub_928B
//   $9295 bank00_sub_9295
//   $9298 bank00_sub_9298
//   $9898 bank00_sub_9898
//   $9941 bank00_sub_9941
//   $995B bank00_sub_995B
//   $995F bank00_sub_995F
//   $9974 bank00_sub_9974
//   $9976 bank00_sub_9976
//   $99ED bank00_sub_99ED
//   $9A05 bank00_sub_9A05
//   $9A0F bank00_sub_9A0F
//   $9A15 bank00_sub_9A15
//   $9A19 bank00_sub_9A19
//   $9A1E bank00_sub_9A1E
//   $9C5F bank00_api_06
//   $9D91 bank00_sub_9D91
//   $9D93 bank00_sub_9D93
//   $9DB3 bank00_api_08
//   $9DBC bank00_sub_9DBC
//   $9DCD bank00_sub_9DCD
//   $9EA9 bank00_sub_9EA9
//   $9F01 bank00_sub_9F01
//   $9F03 bank00_sub_9F03
//   $9F26 bank00_sub_9F26
//   $DE3F bank00_api_03
//   $DE41 bank00_api_04

// External symbol equates
.const bank00_api_03 = $DE3F
.const bank00_api_04 = $DE41

.pc = $8000

    .byte $09, $80, $0C, $80, $C3, $C2, $CD, $38, $30    // data $8000
bank00_cold_start:
    JMP bank00_api_00              // 4C 7F 81
bank00_warm_start:
    JMP bank00_api_01              // 4C 87 81
bank00_sub_800F:
    JMP bank00_api_02              // 4C 8A 81
bank00_sub_8012:
    JMP bank00_api_03              // 4C 3F DE
bank00_sub_8015:
    JMP bank00_api_04              // 4C 41 DE
    .byte $4C, $BE, $8F, $4C, $5F, $9C, $4C, $2A, $8B, $4C, $B3, $9D, $4C, $60, $87, $4C    // data $8018
    .byte $EB, $8A, $4C, $6E, $80, $4C, $54, $8B, $4C, $A5, $8A    // data $8028
bank00_sub_8033:
    JSR bank00_sub_8B3D              // 20 3D 8B
    JMP bank00_api_12              // 4C 54 8B
    .byte $20, $54, $8B, $4C, $2A, $8B, $4C, $9E, $8A    // data $8039
bank00_sub_8042:
    JMP bank00_sub_8AF5              // 4C F5 8A
    .byte $4C, $E0, $8A, $4C, $86, $8B, $4C, $E9, $8A    // data $8045
bank00_sub_804E:
    JMP bank00_sub_8AF1              // 4C F1 8A
    .byte $4C, $1A, $8B, $4C, $23, $8B, $4C, $52, $9F, $4C, $62, $9F, $4C, $66, $9F    // data $8051
bank00_sub_8060:
    LDY #$20               // A0 20
    BIT $28a0              // 2C A0 28
    BIT $30a0              // 2C A0 30
    BIT $38a0              // 2C A0 38
    JMP bank00_sub_9D91              // 4C 91 9D
bank00_api_11:
    BCS bank00_warm_start              // B0 9C
    SEI                    // 78
    LDX #$fb               // A2 FB
    TXS                    // 9A
    JMP bank00_sub_84EC              // 4C EC 84
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $52, $52, $33, $38, $50, $2D, $43    // data $8077
    .byte $4F, $55, $4E, $54, $20, $5A, $45, $52, $4F, $2F, $43, $50, $58, $2D, $BD, $00    // data $8087
    .byte $42, $30, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8097
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80A7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80B7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80C7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80D7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80E7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $54, $41, $00, $00, $00, $00, $00    // data $80F7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8107
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8117
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8127
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8137
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8147
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8157
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8167
    .byte $00, $00, $00, $00, $00, $00, $00, $00    // data $8177
bank00_api_00:
    LDA #$40               // A9 40
    STA $de01              // 8D 01 DE
    LDA #$00               // A9 00
    BIT $02a9              // 2C A9 02
    BIT $01a9              // 2C A9 01
    STA $0200              // 8D 00 02
    SEI                    // 78
    LDX #$ff               // A2 FF
    TXS                    // 9A
    CLD                    // D8
    LDA #$7f               // A9 7F
    STA $dc0d              // 8D 0D DC
    STA $dd0d              // 8D 0D DD
    STA $dc00              // 8D 00 DC
    LDA #$08               // A9 08
    STA $dc0e              // 8D 0E DC
    STA $dd0e              // 8D 0E DD
    STA $dc0f              // 8D 0F DC
    STA $dd0f              // 8D 0F DD
    LDX #$00               // A2 00
    STX $dc03              // 8E 03 DC
    STX $dd03              // 8E 03 DD
    STX $d418              // 8E 18 D4
    DEX                    // CA
    STX $dc02              // 8E 02 DC
    LDX $0200              // AE 00 02
    BEQ $81c9              // F0 08
    LDA $08d0              // AD D0 08
    AND #$fc               // 29 FC
    ORA #$07               // 09 07
    BIT $07a9              // 2C A9 07
    STA $dd00              // 8D 00 DD
    JSR $fdd0              // 20 D0 FD
    LDA $0200              // AD 00 02
    BNE bank00_sub_81EC              // D0 16
    LDX #$00               // A2 00
    LDA $dc01              // AD 01 DC
    AND #$04               // 29 04
    BEQ bank00_sub_81E9              // F0 0A
    LDA $dc01              // AD 01 DC
    AND #$80               // 29 80
    BNE bank00_sub_81EC              // D0 06
    JMP bank00_sub_8289              // 4C 89 82
bank00_sub_81E9:
    JMP bank00_sub_82CF              // 4C CF 82
bank00_sub_81EC:
    JSR bank00_sub_8298              // 20 98 82
    JSR $ff5b              // 20 5B FF
    CLI                    // 58
    JSR $e453              // 20 53 E4
    JSR $e3bf              // 20 BF E3
    JSR bank00_sub_87B2              // 20 B2 87
    LDA #$37               // A9 37
    STA $01                // 85 01
    STA $c0                // 85 C0
    LDX $0200              // AE 00 02
    BEQ $823a              // F0 33
    JSR bank00_sub_99ED              // 20 ED 99
    DEC $0200              // CE 00 02
    BNE bank00_sub_8214              // D0 05
    LDA $0882              // AD 82 08
    BNE bank00_sub_821A              // D0 06
bank00_sub_8214:
    JSR bank00_sub_87F9              // 20 F9 87
    JMP bank00_api_01              // 4C 87 81
bank00_sub_821A:
    JSR bank00_sub_8763              // 20 63 87
    ORA $2e0d              // 0D 0D 2E
    CLI                    // 58
    JSR $4620              // 20 20 46
    .byte $4F    // undocumented opcode
    .byte $52    // undocumented opcode
    JSR $454d              // 20 4D 45
    LSR $0d55              // 4E 55 0D
    ORA $000d              // 0D 0D 00
    LDX $0878              // AE 78 08
    STX $0882              // 8E 82 08
    JSR bank00_sub_9F01              // 20 01 9F
    ASL $e880,X            // 1E 80 E8
    JSR bank00_sub_8722              // 20 22 87
    JSR bank00_api_08              // 20 B3 9D
    JSR bank00_sub_87B2              // 20 B2 87
    JSR bank00_sub_9F03              // 20 03 9F
    .byte $54    // undocumented opcode
    .byte $80    // undocumented opcode
    LDA #$50               // A9 50
    LDY #$82               // A0 82
    JSR bank00_sub_9898              // 20 98 98
bank00_sub_8250:
    CLI                    // 58
    JSR bank00_api_13              // 20 A5 8A
    LDX #$02               // A2 02
    STX $05ff              // 8E FF 05
    CMP #$85               // C9 85
    BEQ bank00_sub_82CB              // F0 6E
    DEX                    // CA
    CMP #$89               // C9 89
    BEQ bank00_sub_82CB              // F0 69
    DEX                    // CA
    CMP #$86               // C9 86
    BEQ bank00_sub_82CB              // F0 64
    CMP #$87               // C9 87
    BEQ bank00_sub_8293              // F0 28
    LDY #$00               // A0 00
    STY $05ff              // 8C FF 05
    LDX #$01               // A2 01
    CMP #$8b               // C9 8B
    BEQ bank00_sub_82CB              // F0 55
    CMP $8098              // CD 98 80
    BEQ bank00_sub_82CB              // F0 50
    INX                    // E8
    CMP #$8c               // C9 8C
    BEQ bank00_sub_82CB              // F0 4B
    CMP $8097              // CD 97 80
    BEQ bank00_sub_82CB              // F0 46
    CMP #$88               // C9 88
    BNE bank00_sub_8250              // D0 C7
bank00_sub_8289:
    LDX #$01               // A2 01
    JSR bank00_sub_8722              // 20 22 87
    JSR bank00_sub_9F01              // 20 01 9F
    ORA #$80               // 09 80
bank00_sub_8293:
    JSR bank00_sub_9F03              // 20 03 9F
    AND ($80,X)            // 21 80
bank00_sub_8298:
    LDA #$00               // A9 00
    TAY                    // A8
bank00_sub_829B:
    STA $0002,Y            // 99 02 00
    STA $0201,Y            // 99 01 02
    STA $0300,Y            // 99 00 03
    INY                    // C8
    BNE bank00_sub_829B              // D0 F4
    LDX #$3c               // A2 3C
    LDY #$03               // A0 03
    STX $b2                // 86 B2
    STY $b3                // 84 B3
    LDA #$a0               // A9 A0
    STA $0284              // 8D 84 02
    STA $c2                // 85 C2
    LDA #$08               // A9 08
    STA $0282              // 8D 82 02
    LSR A                  // 4A
    STA $0288              // 8D 88 02
    LDY #$1f               // A0 1F
bank00_sub_82C1:
    LDA $fd30,Y            // B9 30 FD
    STA $0314,Y            // 99 14 03
    DEY                    // 88
    BPL bank00_sub_82C1              // 10 F7
    RTS                    // 60
bank00_sub_82CB:
    BIT $c5                // 24 C5
    BVC bank00_sub_82CB              // 50 FC
bank00_sub_82CF:
    STX $02                // 86 02
    LDX #$ff               // A2 FF
    JSR bank00_sub_8722              // 20 22 87
    LDX $02                // A6 02
    LDY #$51               // A0 51
bank00_sub_82DA:
    LDA $82f6,Y            // B9 F6 82
    STA $04ff,Y            // 99 FF 04
    DEY                    // 88
    BNE bank00_sub_82DA              // D0 F7
    LDA $8095              // AD 95 80
    STA $050d              // 8D 0D 05
    LDA $8096              // AD 96 80
    STA $0510              // 8D 10 05
    LDA #$0b               // A9 0B
    STA $d011              // 8D 11 D0
    JMP $0500              // 4C 00 05
    .byte $78, $E6, $01, $84, $02, $8A, $F0, $19, $C9, $02, $D0, $03, $A9, $BD, $2C, $A9    // data $82F7
    .byte $00, $86, $03, $91, $02, $C8, $D0, $FB, $E8, $F0, $06, $E0, $05, $D0, $F2, $F0    // data $8307
    .byte $F7, $C6, $01, $A9, $55, $8D, $00, $A0, $8E, $16, $D0, $20, $A3, $FD, $20, $98    // data $8317
    .byte $82, $20, $15, $FD, $AD, $FF, $05, $F0, $08, $A9, $06, $8D, $00, $DE, $4C, $FB    // data $8327
    .byte $FC, $A9, $00, $8D, $00, $DE, $A2, $01, $20, $22, $87, $20, $01, $9F, $09, $80    // data $8337
    .byte $E6, $01, $A9, $01, $85, $FC, $A0, $FF, $84, $FB, $C8, $84, $FD, $AD, $00, $D0    // data $8347
    .byte $48, $AD, $FF, $CF, $49, $FF, $8D, $00, $D0, $A9, $3D, $85, $FA, $38, $98, $65    // data $8357
    .byte $FB, $85, $FB, $A6, $FC, $90, $14, $E8, $F0, $66, $E4, $F8, $D0, $05, $E8, $A9    // data $8367
    .byte $60, $85, $FB, $E0, $D0, $D0, $02, $A2, $E0, $86, $FC, $A0, $1F, $B1, $FB, $88    // data $8377
    .byte $30, $06, $D1, $FB, $D0, $D7, $F0, $F7, $A4, $FA, $F0, $27, $D1, $FB, $D0, $23    // data $8387
    .byte $88, $C0, $1F, $D0, $F7, $A4, $FA, $C0, $38, $F0, $0C, $85, $3D, $86, $2C, $A5    // data $8397
    .byte $FB, $85, $2B, $A9, $38, $D0, $B4, $85, $3E, $86, $3C, $A5, $FB, $85, $3B, $A9    // data $83A7
    .byte $00, $F0, $A8, $A6, $FD, $E0, $05, $F0, $13, $95, $0C, $E6, $FD, $8A, $0A, $AA    // data $83B7
    .byte $A5, $FB, $95, $02, $A5, $FC, $95, $03, $A0, $1F, $D0, $91, $A5, $FA, $D0, $8D    // data $83C7
    .byte $68, $8D, $00, $D0, $C6, $01, $60, $20, $BA, $9E, $A0, $1F, $CE, $09, $01, $AD    // data $83D7
    .byte $00, $80, $E6, $01, $91, $0A, $C6, $01, $88, $10, $F1, $CE, $0E, $01, $CE, $0E    // data $83E7
    .byte $01, $D0, $E7, $A0, $38, $B9, $02, $80, $E6, $01, $91, $3B, $C6, $01, $C0, $1A    // data $83F7
    .byte $B0, $06, $B9, $52, $01, $99, $11, $00, $88, $10, $EA, $20, $B2, $9E, $E6, $01    // data $8407
    .byte $A0, $3D, $B9, $6C, $01, $C9, $BB, $D0, $08, $CE, $46, $01, $AE, $B8, $01, $B5    // data $8417
    .byte $00, $91, $2B, $88, $10, $EC, $C6, $01, $60, $A0, $1F, $86, $18, $86, $20, $B1    // data $8427
    .byte $0A, $C6, $1C, $85, $00, $A5, $10, $91, $0A, $88, $10, $F3, $C6, $1E, $CA, $CA    // data $8437
    .byte $D0, $E7, $4C, $A2, $38, $BD, $BB, $BB, $95, $02, $A9, $BB, $9D, $BB, $BB, $CA    // data $8447
    .byte $10, $F3, $E6, $01, $A9, $BB, $2C, $11, $D0, $BB, $FB, $CD, $12, $D0, $D0, $F6    // data $8457
    .byte $A9, $BB, $A2, $BB, $8D, $0E, $DD, $8E, $0F, $DD, $A0, $3D, $48, $68, $A5, $00    // data $8467
    .byte $A9, $BB, $A2, $BB, $8D, $0E, $DC, $8E, $0F, $DC, $A9, $BB, $A2, $BB, $4C, $BB    // data $8477
    .byte $01, $3B, $3C, $3E, $3B, $3C, $F0, $F1, $2E, $2F, $31, $32, $3D, $E7, $E9, $A5    // data $8487
    .byte $2B, $8D, $3F, $01, $A5, $2C, $8D, $40, $01, $A5, $E4, $8D, $4B, $01, $A5, $E5    // data $8497
    .byte $8D, $4D, $01, $A5, $E8, $C9, $2F, $F0, $10, $8D, $45, $01, $A9, $A9, $8D, $44    // data $84A7
    .byte $01, $A9, $85, $8D, $46, $01, $8C, $47, $01, $20, $8A, $9E, $A9, $81, $85, $EA    // data $84B7
    .byte $A0, $11, $B9, $3E, $01, $91, $E9, $88, $10, $F8, $4C, $B2, $9E, $99, $BB, $BB    // data $84C7
    .byte $88, $10, $FA, $8C, $19, $D0, $EA, $86, $01, $A2, $BB, $A0, $BB, $68, $40, $20    // data $84D7
    .byte $EB, $85, $38, $B0, $0F    // data $84E7
bank00_sub_84EC:
    CLI                    // 58
bank00_sub_84ED:
    BIT $c5                // 24 C5
    BVC bank00_sub_84ED              // 50 FC
    JSR bank00_sub_8AE9              // 20 E9 8A
    JSR bank00_sub_85EB              // 20 EB 85
    JSR bank00_sub_86A0              // 20 A0 86
    CLC                    // 18
    SEI                    // 78
    LDX #$1f               // A2 1F
bank00_sub_84FE:
    LDA $08e0,X            // BD E0 08
    STA $e0,X              // 95 E0
    DEX                    // CA
    BPL bank00_sub_84FE              // 10 F8
    ROR $f3                // 66 F3
    LDA $083e              // AD 3E 08
    STA $f0                // 85 F0
    LDA $083f              // AD 3F 08
    STA $f1                // 85 F1
    LDA $086c              // AD 6C 08
    STA $ed                // 85 ED
    SEC                    // 38
    SBC #$13               // E9 13
    BCS bank00_sub_851E              // B0 02
    LDA #$eb               // A9 EB
bank00_sub_851E:
    STA $e9                // 85 E9
    LDY $0872              // AC 72 08
    CPY #$d0               // C0 D0
    BCC bank00_sub_852D              // 90 06
    CPY #$e0               // C0 E0
    BCS bank00_sub_852D              // B0 02
    LDY #$fd               // A0 FD
bank00_sub_852D:
    STY $f8                // 84 F8
    LDX #$00               // A2 00
    LDA #$40               // A9 40
    STA $2b                // 85 2B
    STY $2c                // 84 2C
    SEC                    // 38
    ADC #$3d               // 69 3D
    STA $3b                // 85 3B
    STY $3c                // 84 3C
    SEC                    // 38
    ADC #$38               // 69 38
bank00_sub_8541:
    STA $02,X              // 95 02
    STY $03,X              // 94 03
    CLC                    // 18
    ADC #$20               // 69 20
    BCC bank00_sub_854B              // 90 01
    INY                    // C8
bank00_sub_854B:
    INX                    // E8
    INX                    // E8
    CPX #$0e               // E0 0E
    BNE bank00_sub_8541              // D0 F0
    LDA #$20               // A9 20
    STA $0c                // 85 0C
    STA $0d                // 85 0D
    STA $0e                // 85 0E
    STA $0f                // 85 0F
    STA $10                // 85 10
    STA $3d                // 85 3D
    STA $3e                // 85 3E
    JSR bank00_sub_8033              // 20 33 80
    LDA #$47               // A9 47
    LDY #$83               // A0 83
    JSR bank00_sub_8AF5              // 20 F5 8A
    LDA #$de               // A9 DE
    LDY #$83               // A0 83
    JSR bank00_sub_8AF5              // 20 F5 8A
    LDA #$96               // A9 96
    LDY #$84               // A0 84
    JSR bank00_sub_8AF5              // 20 F5 8A
    LDX #$70               // A2 70
bank00_sub_857B:
    LDA $8586,X            // BD 86 85
    STA $60,X              // 95 60
    DEX                    // CA
    BPL bank00_sub_857B              // 10 F8
    JMP $0060              // 4C 60 00
    .byte $20, $8A, $9E, $A2, $25, $BD, $3A, $80, $95, $3A, $CA, $D0, $F8, $BD, $00, $81    // data $8586
    .byte $9D, $00, $01, $CA, $D0, $F7, $A6, $ED, $9A, $68, $68, $68, $68, $A2, $00, $B5    // data $8596
    .byte $E0, $48, $E8, $E0, $04, $D0, $F8, $24, $F3, $30, $26, $AD, $08, $DC, $06, $EC    // data $85A6
    .byte $30, $03, $8D, $08, $DC, $AD, $08, $DD, $06, $EC, $30, $03, $8D, $08, $DD, $A5    // data $85B6
    .byte $E8, $85, $00, $A5, $EB, $8D, $00, $DE, $A9, $34, $85, $01, $A2, $0A, $4C, $11    // data $85C6
    .byte $00, $A2, $00, $BD, $00, $01, $9D, $00, $81, $E8, $D0, $F7, $20, $B2, $9E, $A2    // data $85D6
    .byte $FB, $9A, $4C, $0C, $8C    // data $85E6
bank00_sub_85EB:
    LDX #$00               // A2 00
    LDA $08eb              // AD EB 08
    CMP #$06               // C9 06
    BEQ bank00_sub_85F5              // F0 01
    INX                    // E8
bank00_sub_85F5:
    JSR bank00_sub_8722              // 20 22 87
    LDX #$03               // A2 03
bank00_sub_85FA:
    LDY $0837,X            // BC 37 08
    LDA $08c4,X            // BD C4 08
    STA $0837,X            // 9D 37 08
    TYA                    // 98
    STA $08c4,X            // 9D C4 08
    LDY $0833,X            // BC 33 08
    LDA $08d4,X            // BD D4 08
    STA $0833,X            // 9D 33 08
    TYA                    // 98
    STA $08d4,X            // 9D D4 08
    CPX #$03               // E0 03
    BCS bank00_sub_8632              // B0 1A
    LDA $082d,X            // BD 2D 08
    CMP #$ff               // C9 FF
    BNE bank00_sub_8625              // D0 06
    LDA $08dd,X            // BD DD 08
    STA $082d,X            // 9D 2D 08
bank00_sub_8625:
    LDA $0830,X            // BD 30 08
    CMP #$ff               // C9 FF
    BNE bank00_sub_8632              // D0 06
    LDA $08cd,X            // BD CD 08
    STA $0830,X            // 9D 30 08
bank00_sub_8632:
    DEX                    // CA
    BPL bank00_sub_85FA              // 10 C5
    LDA #$7f               // A9 7F
    STA $08cd              // 8D CD 08
    STA $08dd              // 8D DD 08
    LDA #$10               // A9 10
    STA $08ce              // 8D CE 08
    STA $08cf              // 8D CF 08
    STA $08de              // 8D DE 08
    STA $08df              // 8D DF 08
    LDX #$0e               // A2 0E
bank00_sub_864D:
    LDA $082d,X            // BD 2D 08
    STA $2d,X              // 95 2D
    DEX                    // CA
    BPL bank00_sub_864D              // 10 F8
    LDA $082e              // AD 2E 08
    STA $0833              // 8D 33 08
    LDA $082f              // AD 2F 08
    STA $0834              // 8D 34 08
    LDY #$31               // A0 31
    LDX #$c4               // A2 C4
    JSR bank00_sub_866B              // 20 6B 86
    INY                    // C8
    LDX #$d4               // A2 D4
bank00_sub_866B:
    JSR bank00_sub_8671              // 20 71 86
    INY                    // C8
    INX                    // E8
    INX                    // E8
bank00_sub_8671:
    LDA $0800,Y            // B9 00 08
    AND #$41               // 29 41
    LSR A                  // 4A
    BNE bank00_sub_8691              // D0 18
    BCC bank00_sub_8691              // 90 16
    LDA $0800,X            // BD 00 08
    ADC $083c              // 6D 3C 08
    STA $0800,X            // 9D 00 08
    LDA $0801,X            // BD 01 08
    ADC $083d              // 6D 3D 08
    BCC bank00_sub_868E              // 90 02
    LDA #$ff               // A9 FF
bank00_sub_868E:
    STA $0801,X            // 9D 01 08
bank00_sub_8691:
    LDA $0800,X            // BD 00 08
    CLC                    // 18
    ADC #$08               // 69 08
    STA $0800,X            // 9D 00 08
    BCC bank00_sub_869F              // 90 03
    INC $0801,X            // FE 01 08
bank00_sub_869F:
    RTS                    // 60
bank00_sub_86A0:
    SEI                    // 78
    LDX #$00               // A2 00
bank00_sub_86A3:
    LDA $08c0,X            // BD C0 08
    STA $dc00,X            // 9D 00 DC
    LDA $08d0,X            // BD D0 08
    STA $dd00,X            // 9D 00 DD
    INX                    // E8
    CPX #$10               // E0 10
    BNE bank00_sub_86A3              // D0 EF
    LDA #$1f               // A9 1F
    STA $d418              // 8D 18 D4
    JSR bank00_sub_8AB6              // 20 B6 8A
    LDA $08aa              // AD AA 08
    STA $d01a              // 8D 1A D0
    LDA $08a1              // AD A1 08
    STA $d011              // 8D 11 D0
bank00_sub_86C8:
    BIT $d011              // 2C 11 D0
    BPL bank00_sub_86C8              // 10 FB
    LDX #$00               // A2 00
    LDY #$01               // A0 01
    LDA $33                // A5 33
    STA $dd04              // 8D 04 DD
    LDA $34                // A5 34
    STY $dd0e              // 8C 0E DD
    STA $dd05              // 8D 05 DD
    STX $dd0e              // 8E 0E DD
    LDA $35                // A5 35
    STA $dd06              // 8D 06 DD
    LDA $36                // A5 36
    STY $dd0f              // 8C 0F DD
    STA $dd07              // 8D 07 DD
    STX $dd0f              // 8E 0F DD
    LDA $37                // A5 37
    STA $dc04              // 8D 04 DC
    LDA $38                // A5 38
    STY $dc0e              // 8C 0E DC
    STA $dc05              // 8D 05 DC
    STX $dc0e              // 8E 0E DC
    LDA $39                // A5 39
    STA $dc06              // 8D 06 DC
    LDA $3a                // A5 3A
    STY $dc0f              // 8C 0F DC
    STA $dc07              // 8D 07 DC
    STX $dc0f              // 8E 0F DC
    LDA $dc0d              // AD 0D DC
    LDA $dd0d              // AD 0D DD
    LDA $2d                // A5 2D
    STA $dd0d              // 8D 0D DD
    LDA $30                // A5 30
    STA $dc0d              // 8D 0D DC
    RTS                    // 60
bank00_sub_8722:
    LDY #$2e               // A0 2E
bank00_sub_8724:
    LDA $8731,Y            // B9 31 87
    STA $03ff,Y            // 99 FF 03
    DEY                    // 88
    BNE bank00_sub_8724              // D0 F7
    LDY #$14               // A0 14
    JMP $0400              // 4C 00 04
    .byte $A9, $23, $8D, $00, $DE, $B9, $00, $FE, $99, $00, $9E, $C8, $C0, $F8, $D0, $F5    // data $8732
    .byte $A0, $14, $8A, $99, $00, $9E, $88, $10, $FA, $A0, $07, $8A, $30, $07, $F0, $08    // data $8742
    .byte $A0, $00, $AD, $14, $FE, $99, $F8, $9E, $88, $10, $FA, $4C, $B2, $9E    // data $8752
bank00_api_09:
    JSR bank00_sub_9941              // 20 41 99
bank00_sub_8763:
    STY $24                // 84 24
    PLA                    // 68
    STA $22                // 85 22
    PLA                    // 68
    STA $23                // 85 23
    STX $8d                // 86 8D
    LDA $d6                // A5 D6
    STA $25                // 85 25
    LDY #$00               // A0 00
bank00_sub_8773:
    INY                    // C8
    LDA ($22),Y            // B1 22
    BEQ bank00_sub_879B              // F0 23
    CMP #$01               // C9 01
    BNE bank00_sub_8788              // D0 0C
    INY                    // C8
    LDA ($22),Y            // B1 22
    TAX                    // AA
bank00_sub_8780:
    JSR bank00_sub_87AD              // 20 AD 87
    DEX                    // CA
    BNE bank00_sub_8780              // D0 FA
    BEQ bank00_sub_8773              // F0 EB
bank00_sub_8788:
    CMP #$2a               // C9 2A
    BNE bank00_sub_8796              // D0 0A
    JSR bank00_sub_87AD              // 20 AD 87
    LDA #$2d               // A9 2D
    JSR $e716              // 20 16 E7
    LDA #$20               // A9 20
bank00_sub_8796:
    JSR $e716              // 20 16 E7
    BCC bank00_sub_8773              // 90 D8
bank00_sub_879B:
    TYA                    // 98
    CLC                    // 18
    ADC $22                // 65 22
    TAY                    // A8
    LDA $23                // A5 23
    ADC #$00               // 69 00
    PHA                    // 48
    TYA                    // 98
    PHA                    // 48
    LDY $24                // A4 24
    LDX $8d                // A6 8D
    CLC                    // 18
    RTS                    // 60
bank00_sub_87AD:
    LDA #$20               // A9 20
    JMP $e716              // 4C 16 E7
bank00_sub_87B2:
    JSR bank00_sub_8B9D              // 20 9D 8B
    JSR bank00_sub_8763              // 20 63 87
    .byte $93    // undocumented opcode
    ORA ($09,X)            // 01 09
    .byte $43    // undocumented opcode
    EOR $4542,Y            // 59 42 45
    .byte $52    // undocumented opcode
    BVC $8817              // 50 55
    LSR $2058              // 4E 58 20
    .byte $52    // undocumented opcode
    EOR $54                // 45 54
    .byte $52    // undocumented opcode
    .byte $4F    // undocumented opcode
    JSR $4552              // 20 52 45
    BVC bank00_sub_881B              // 50 4C
    EOR ($59,X)            // 41 59
    ORA $0e01              // 0D 01 0E
    .byte $42    // undocumented opcode
    EOR $4320,Y            // 59 20 43
    .byte $4F    // undocumented opcode
    EOR $4e,X              // 55 4E
    .byte $54    // undocumented opcode
    JSR $455a              // 20 5A 45
    .byte $52    // undocumented opcode
    .byte $4F    // undocumented opcode
    ORA $0d0d              // 0D 0D 0D
    BRK                    // 00
    .byte $18    // data $87E5
bank00_sub_87E6:
    LDX #$25               // A2 25
    LDA #$63               // A9 63
bank00_sub_87EA:
    STA $0479,X            // 9D 79 04
    BCC bank00_sub_87F5              // 90 06
    STA $04f1,X            // 9D F1 04
    STA $0631,X            // 9D 31 06
bank00_sub_87F5:
    DEX                    // CA
    BPL bank00_sub_87EA              // 10 F2
    RTS                    // 60
bank00_sub_87F9:
    LDA #$87               // A9 87
    LDY #$81               // A0 81
    JSR bank00_sub_9898              // 20 98 98
    JSR bank00_sub_9F03              // 20 03 9F
    .byte $57    // undocumented opcode
    .byte $80    // undocumented opcode
    SEC                    // 38
    JSR bank00_sub_87E6              // 20 E6 87
    LDA #$00               // A9 00
    STA $0882              // 8D 82 08
    JSR bank00_sub_927A              // 20 7A 92
bank00_sub_8811:
    JSR bank00_api_13              // 20 A5 8A
    LDX #$0f               // A2 0F
bank00_sub_8816:
    CMP $8835,X            // DD 35 88
    BEQ bank00_sub_8820              // F0 05
bank00_sub_881B:
    DEX                    // CA
    BPL bank00_sub_8816              // 10 F8
    BMI bank00_sub_8811              // 30 F1
bank00_sub_8820:
    STX $3f                // 86 3F
    TXA                    // 8A
    ASL A                  // 0A
    TAX                    // AA
    LDA $8846,X            // BD 46 88
    PHA                    // 48
    LDA $8845,X            // BD 45 88
    PHA                    // 48
    PHP                    // 08
    JSR $de9d              // 20 9D DE
    JSR bank00_sub_9974              // 20 74 99
    RTI                    // 40
    .byte $85, $86, $88, $4D, $45, $44, $54, $50, $56, $53, $4B, $4C, $58, $43, $5A, $00    // data $8835
    .byte $E6, $84, $EC, $84, $65, $8B, $2F, $82, $69, $97, $90, $8A, $27, $9A, $A9, $92    // data $8845
    .byte $63, $88, $FF, $92, $CB, $91, $79, $91, $AE, $88, $71, $88, $99, $92, $AD, $F1    // data $8855
    .byte $DE, $8D, $F2, $02, $20, $03, $9F, $4B, $80, $4C, $0C, $80, $20, $63, $87, $45    // data $8865
    .byte $44, $49, $54, $20, $4D, $4F, $44, $45, $3A, $0D, $0D, $20, $20, $41, $2A, $31    // data $8875
    .byte $58, $31, $0D, $20, $20, $42, $2A, $31, $58, $32, $0D, $20, $20, $43, $2A, $32    // data $8885
    .byte $58, $31, $0D, $20, $20, $44, $2A, $32, $58, $32, $0D, $00, $A2, $44, $20, $47    // data $8895
    .byte $99, $20, $03, $9F, $1B, $80, $4C, $0C, $80, $20, $A5, $89, $A2, $00, $86, $F9    // data $88A5
    .byte $86, $F8, $AD, $00, $09, $C9, $AA, $D0, $03, $4C, $AE, $89, $20, $63, $87, $0D    // data $88B5
    .byte $48, $4F, $57, $20, $4D, $41, $4E, $59, $20, $4C, $49, $56, $45, $53, $20, $4E    // data $88C5
    .byte $4F, $57, $20, $3F, $20, $00, $58, $A2, $15, $A0, $19, $20, $5D, $80, $20, $79    // data $88D5
    .byte $00, $F0, $07, $20, $9E, $B7, $E0, $00, $D0, $01, $60, $86, $C4, $A2, $02, $86    // data $88E5
    .byte $FC, $A9, $A6, $85, $FB, $A0, $00, $A9, $FB, $8D, $B7, $02, $E6, $FB, $D0, $04    // data $88F5
    .byte $E6, $FC, $F0, $4E, $20, $B3, $02, $10, $F3, $C9, $CE, $F0, $0D, $C9, $DE, $F0    // data $8905
    .byte $09, $C9, $C6, $F0, $04, $C9, $D6, $D0, $E3, $18, $08, $C8, $20, $B3, $02, $85    // data $8915
    .byte $FD, $C8, $20, $B3, $02, $A0, $00, $28, $B0, $01, $98, $85, $FE, $A9, $FD, $8D    // data $8925
    .byte $B7, $02, $20, $B3, $02, $85, $FF, $C5, $C4, $F0, $0E, $38, $E9, $01, $C5, $C4    // data $8935
    .byte $F0, $07, $38, $E9, $2F, $C5, $C4, $D0, $AE, $20, $69, $8A, $20, $2A, $8A, $4C    // data $8945
    .byte $FC, $88, $98, $F0, $77, $20, $63, $87, $0D, $41, $42, $4F, $52, $54, $45, $44    // data $8955
    .byte $00, $A9, $00, $F0, $2E, $20, $63, $87, $0D, $4C, $4F, $53, $45, $20, $41, $20    // data $8965
    .byte $4C, $49, $46, $45, $20, $41, $4E, $44, $20, $52, $45, $46, $52, $45, $45, $5A    // data $8975
    .byte $45, $0D, $3C, $52, $2F, $53, $3E, $20, $54, $4F, $20, $41, $42, $4F, $52, $54    // data $8985
    .byte $00, $A9, $AA, $8D, $00, $09, $20, $03, $9F, $3F, $80, $90, $03, $8D, $00, $09    // data $8995
    .byte $A2, $01, $A9, $99, $A0, $09, $4C, $12, $80, $84, $FA, $A6, $F8, $20, $7F, $8A    // data $89A5
    .byte $86, $F8, $F0, $18, $C6, $FF, $A9, $FD, $8D, $B7, $02, $20, $B3, $02, $C5, $FF    // data $89B5
    .byte $D0, $E9, $20, $69, $8A, $20, $2A, $8A, $E6, $FA, $D0, $DF, $A6, $F9, $F0, $85    // data $89C5
    .byte $9D, $02, $09, $9D, $03, $09, $CA, $CA, $CA, $BD, $02, $09, $85, $FD, $BD, $03    // data $89D5
    .byte $09, $85, $FE, $8A, $38, $E9, $05, $AA, $90, $11, $A5, $FE, $DD, $03, $09, $D0    // data $89E5
    .byte $07, $A5, $FD, $DD, $02, $09, $F0, $EB, $4C, $6A, $89, $A2, $00, $20, $7F, $8A    // data $89F5
    .byte $F0, $12, $A9, $FB, $8D, $B7, $02, $8D, $AE, $02, $20, $B3, $02, $49, $63, $20    // data $8A05
    .byte $A7, $02, $D0, $E9, $20, $63, $87, $0D, $41, $43, $54, $49, $56, $41, $54, $45    // data $8A15
    .byte $44, $00, $4C, $66, $89, $20, $63, $87, $0D, $50, $4F, $4B, $45, $20, $00, $A5    // data $8A25
    .byte $FC, $A6, $FB, $20, $CD, $BD, $A9, $2C, $20, $D2, $FF, $A0, $00, $A9, $FB, $8D    // data $8A35
    .byte $B7, $02, $20, $B3, $02, $49, $63, $AA, $48, $A9, $00, $20, $CD, $BD, $E6, $D3    // data $8A45
    .byte $E6, $D3, $A5, $FC, $20, $92, $9C, $A5, $FB, $20, $92, $9C, $E6, $D3, $68, $A0    // data $8A55
    .byte $00, $4C, $92, $9C, $A6, $F9, $A0, $FB, $B9, $00, $00, $9D, $02, $09, $E8, $D0    // data $8A65
    .byte $03, $EE, $20, $D0, $C8, $D0, $F1, $86, $F9, $60, $A0, $FB, $BD, $02, $09, $99    // data $8A75
    .byte $00, $00, $E8, $C8, $D0, $F6, $A5, $FB, $05, $FC, $60, $A9, $08, $CD, $77, $08    // data $8A85
    .byte $90, $02, $85, $BA, $20, $02, $9F, $21, $80, $20, $03, $9F, $3F, $80, $D0, $0A    // data $8A95
bank00_api_13:
    LDA #$00               // A9 00
    STA $c6                // 85 C6
    CLI                    // 58
bank00_sub_8AAA:
    JSR $ffe4              // 20 E4 FF
    BEQ bank00_sub_8AAA              // F0 FB
    CMP #$03               // C9 03
    BNE bank00_sub_8ADF              // D0 2C
    JMP ($0334)            // 6C 34 03
bank00_sub_8AB6:
    SEI                    // 78
    LDX #$2e               // A2 2E
bank00_sub_8AB9:
    LDA $0890,X            // BD 90 08
    STA $d000,X            // 9D 00 D0
    DEX                    // CA
    BPL bank00_sub_8AB9              // 10 F7
    LDA $dd00              // AD 00 DD
    AND #$fc               // 29 FC
    ORA $08d0              // 0D D0 08
    STA $dd00              // 8D 00 DD
    LDA $08a1              // AD A1 08
    ORA #$10               // 09 10
    STA $d011              // 8D 11 D0
    LDA #$f0               // A9 F0
    STA $d01a              // 8D 1A D0
    LDA #$0f               // A9 0F
    STA $d019              // 8D 19 D0
bank00_sub_8ADF:
    RTS                    // 60
    .byte $20, $B6, $8A, $20, $3D, $8B, $20, $5D, $8B    // data $8AE0
bank00_sub_8AE9:
    LDX #$d8               // A2 D8
bank00_api_10:
    LDA #$af               // A9 AF
    LDY #$8b               // A0 8B
    BNE bank00_sub_8AF5              // D0 04
bank00_sub_8AF1:
    LDA #$df               // A9 DF
    LDY #$8b               // A0 8B
bank00_sub_8AF5:
    STA $0100              // 8D 00 01
    LDA $a9                // A5 A9
    PHA                    // 48
    LDA $aa                // A5 AA
    PHA                    // 48
    LDA $0100              // AD 00 01
    STA $a9                // 85 A9
    STY $aa                // 84 AA
    SEI                    // 78
    LDY #$d2               // A0 D2
bank00_sub_8B08:
    DEY                    // 88
    LDA ($a9),Y            // B1 A9
    STA $0100,Y            // 99 00 01
    TYA                    // 98
    BNE bank00_sub_8B08              // D0 F7
    PLA                    // 68
    STA $aa                // 85 AA
    PLA                    // 68
    STA $a9                // 85 A9
    JMP $0100              // 4C 00 01
    .byte $20, $3D, $8B, $A9, $88, $A0, $08, $D0, $2C, $A9, $08, $A0, $88, $20, $4F, $8B    // data $8B1A
bank00_api_07:
    LDA #$9f               // A9 9F
    LDY #$08               // A0 08
    JSR bank00_sub_8B4C              // 20 4C 8B
    LDX #$0e               // A2 0E
bank00_sub_8B33:
    LDA $08f0,X            // BD F0 08
    STA $082d,X            // 9D 2D 08
    DEX                    // CA
    BPL bank00_sub_8B33              // 10 F7
    RTS                    // 60
bank00_sub_8B3D:
    LDX #$0e               // A2 0E
bank00_sub_8B3F:
    LDA $082d,X            // BD 2D 08
    STA $08f0,X            // 9D F0 08
    DEX                    // CA
    BPL bank00_sub_8B3F              // 10 F7
    LDA #$08               // A9 08
    LDY #$9f               // A0 9F
bank00_sub_8B4C:
    LDX #$01               // A2 01
    BIT $02a2              // 2C A2 02
    JMP bank00_sub_8015              // 4C 15 80
bank00_api_12:
    LDA #$02               // A9 02
    LDY #$82               // A0 82
    LDX #$08               // A2 08
    JMP bank00_sub_8012              // 4C 12 80
    .byte $A9, $04, $A0, $84, $A2, $06, $D0, $F5, $20, $E0, $8A, $58, $20, $E4, $FF, $F0    // data $8B5D
    .byte $FB, $A2, $00, $C9, $86, $F0, $05, $E8, $C9, $87, $D0, $05, $FE, $20, $D0, $B0    // data $8B6D
    .byte $EB, $C9, $20, $F0, $04, $C9, $03, $D0, $E3, $20, $5D, $8B, $20, $2A, $8B, $A2    // data $8B7D
    .byte $0E, $BD, $20, $D0, $9D, $B0, $08, $CA, $10, $F7, $20, $A3, $FD, $20, $A0, $E5    // data $8B8D
bank00_sub_8B9D:
    JSR bank00_sub_9F03              // 20 03 9F
    ROL A                  // 2A
    .byte $80    // undocumented opcode
    LDX #$06               // A2 06
    LDY #$06               // A0 06
    STX $d020              // 8E 20 D0
    STY $d021              // 8C 21 D0
    JMP bank00_sub_995B              // 4C 5B 99
    .byte $20, $BA, $9E, $8E, $15, $01, $E8, $E8, $8E, $1D, $01, $A2, $02, $B9, $00, $97    // data $8BAF
    .byte $48, $29, $0F, $99, $00, $D8, $68, $4A, $4A, $4A, $4A, $99, $00, $DA, $C8, $D0    // data $8BBF
    .byte $EC, $EE, $15, $01, $EE, $1D, $01, $EE, $0F, $01, $CA, $D0, $E0, $4C, $B2, $9E    // data $8BCF
    .byte $20, $8A, $9E, $A0, $00, $A2, $02, $B9, $00, $DA, $0A, $0A, $0A, $0A, $8D, $17    // data $8BDF
    .byte $01, $B9, $00, $D8, $29, $0F, $09, $FF, $99, $00, $97, $C8, $D0, $E9, $EE, $09    // data $8BEF
    .byte $01, $EE, $13, $01, $EE, $1A, $01, $CA, $D0, $DD, $4C, $B2, $9E, $A2, $FE, $86    // data $8BFF
    .byte $92, $A9, $71, $A0, $8D, $20, $F5, $8A, $A2, $00, $BD, $A9, $9C, $9D, $00, $08    // data $8C0F
    .byte $B5, $00, $9D, $00, $09, $E0, $5A, $B0, $06, $BD, $C8, $86, $9D, $50, $0D, $E8    // data $8C1F
    .byte $D0, $E8, $A2, $15, $BD, $80, $80, $9D, $E9, $08, $CA, $10, $F7, $A9, $97, $A0    // data $8C2F
    .byte $0B, $20, $4F, $8B, $A9, $81, $A0, $0A, $20, $4C, $8B, $A2, $7A, $BD, $00, $8D    // data $8C3F
    .byte $9D, $60, $09, $CA, $10, $F7, $A5, $90, $8D, $61, $09, $A5, $91, $8D, $62, $09    // data $8C4F
    .byte $A9, $73, $A0, $8C, $20, $F5, $8A, $A6, $8E, $A4, $8F, $86, $AE, $84, $AF, $20    // data $8C5F
    .byte $03, $9F, $24, $80, $E6, $01, $A9, $AA, $85, $8E, $A9, $0D, $85, $8F, $B1, $90    // data $8C6F
    .byte $91, $8E, $E6, $8E, $D0, $02, $E6, $8F, $E6, $90, $D0, $F2, $E6, $91, $D0, $EE    // data $8C7F
    .byte $A5, $8E, $38, $E9, $AB, $8D, $1A, $08, $49, $FF, $8D, $1F, $08, $A5, $8F, $E9    // data $8C8F
    .byte $00, $8D, $1D, $08, $C6, $01, $20, $8A, $9E, $A2, $4F, $BD, $90, $9F, $9D, $00    // data $8C9F
    .byte $0D, $CA, $10, $F7, $AD, $EC, $9F, $0A, $6E, $81, $08, $AD, $6C, $9F, $8D, $34    // data $8CAF
    .byte $08, $A9, $35, $8D, $01, $09, $AD, $EE, $9F, $AA, $AD, $EF, $9F, $A8, $0D, $EE    // data $8CBF
    .byte $9F, $F0, $1A, $8E, $C5, $09, $8C, $C6, $09, $E8, $D0, $01, $C8, $8E, $CA, $09    // data $8CCF
    .byte $8C, $CB, $09, $A2, $08, $A9, $EA, $9D, $D8, $08, $CA, $10, $FA, $AD, $EC, $9F    // data $8CDF
    .byte $A2, $8D, $0A, $30, $03, $8E, $B2, $09, $0A, $30, $03, $8E, $B8, $09, $4C, $B2    // data $8CEF
    .byte $9E, $AD, $FF, $FF, $E6, $61, $D0, $02, $E6, $62, $60, $20, $60, $00, $AA, $20    // data $8CFF
    .byte $60, $00, $91, $DC, $C8, $F0, $2C, $CA, $D0, $F8, $F0, $05, $20, $60, $00, $85    // data $8D0F
    .byte $84, $20, $60, $00, $C9, $FF, $F0, $E3, $91, $DC, $C8, $D0, $F4, $F0, $14, $06    // data $8D1F
    .byte $DF, $90, $04, $26, $DF, $C6, $97, $46, $FF, $90, $E1, $20, $60, $00, $91, $DC    // data $8D2F
    .byte $C8, $D0, $F8, $E6, $DD, $D0, $E8, $E6, $01, $AD, $12, $D0, $C9, $80, $D0, $F9    // data $8D3F
    .byte $AD, $08, $DC, $AD, $08, $DC, $AD, $08, $DD, $AD, $08, $DD, $EA, $EA, $EA, $EA    // data $8D4F
    .byte $EA, $C6, $01, $A9, $FF, $8D, $60, $00, $A9, $FF, $8D, $60, $00, $A2, $0A, $4C    // data $8D5F
    .byte $11, $00, $A9, $7B, $8D, $11, $D0, $E6, $01, $84, $90, $84, $91, $84, $DC, $84    // data $8D6F
    .byte $DD, $A9, $80, $85, $DF, $C6, $DD, $A9, $00, $18, $69, $01, $F0, $55, $C6, $01    // data $8D7F
    .byte $EE, $20, $D0, $E6, $01, $A0, $00, $D1, $DC, $F0, $EE, $C8, $D0, $F9, $85, $94    // data $8D8F
    .byte $84, $93, $88, $20, $8D, $01, $E8, $88, $C0, $FF, $F0, $04, $D1, $DC, $F0, $F6    // data $8D9F
    .byte $E0, $01, $F0, $1F, $E0, $00, $F0, $10, $E0, $04, $B0, $0C, $86, $95, $C6, $95    // data $8DAF
    .byte $F0, $11, $20, $8F, $01, $18, $90, $F6, $66, $93, $8A, $20, $8F, $01, $A5, $94    // data $8DBF
    .byte $20, $8F, $01, $C0, $FF, $D0, $CC, $A5, $93, $F0, $12, $A5, $94, $20, $8F, $01    // data $8DCF
    .byte $18, $90, $0A, $A0, $FF, $20, $8D, $01, $88, $C0, $FF, $D0, $F8, $26, $E0, $46    // data $8DDF
    .byte $DF, $90, $05, $66, $DF, $EE, $7C, $01, $C6, $92, $D0, $89, $C6, $01, $60, $B1    // data $8DEF
    .byte $DC, $A2, $00, $E4, $90, $D0, $02, $C6, $91, $C6, $90, $81, $90, $60, $BD, $05    // data $8DFF
    .byte $01, $38, $E9, $02, $9D, $05, $01, $B0, $03, $DE, $06, $01, $68, $A8, $68, $AA    // data $8E0F
    .byte $4C, $3B, $EE, $8A, $BA, $FE, $03, $01, $D0, $03, $FE, $04, $01, $AA, $4C, $3B    // data $8E1F
    .byte $EE, $78, $48, $A9, $7F, $8D, $0D, $DD, $D0, $02, $78, $48, $AD, $0E, $DD, $48    // data $8E2F
    .byte $AD, $0F, $DD, $48, $A9, $7C, $8D, $0D, $DD, $A9, $00, $8D, $0E, $DD, $8D, $0F    // data $8E3F
    .byte $DD, $AD, $0E, $DC, $48, $AD, $0F, $DC, $48, $A9, $00, $8D, $0E, $DC, $8D, $0F    // data $8E4F
    .byte $DC, $AD, $12, $D0, $48, $D8, $8A, $48, $98, $48, $A5, $00, $48, $A9, $2F, $85    // data $8E5F
    .byte $00, $AD, $11, $D0, $29, $80, $05, $01, $48, $A9, $37, $85, $01, $A5, $5F, $48    // data $8E6F
    .byte $A0, $00, $84, $5F, $AD, $08, $DC, $48, $AD, $08, $DD, $A2, $60, $88, $D0, $FD    // data $8E7F
    .byte $CA, $D0, $FA, $CD, $08, $DD, $F0, $01, $18, $66, $5F, $68, $CD, $08, $DC, $F0    // data $8E8F
    .byte $01, $18, $66, $5F, $AD, $0B, $DC, $AD, $0B, $DD, $4C, $BB, $EE, $00, $00, $00    // data $8E9F
    .byte $00, $00, $A2, $00, $8D, $00, $DE, $CA, $D0, $FD, $AA, $60, $AE, $1B, $D4, $C8    // data $8EAF
    .byte $EC, $1B, $D4, $38, $D0, $04, $98, $D0, $F6, $18, $66, $5F, $A6, $5F, $68, $85    // data $8EBF
    .byte $5F, $8A, $48, $A2, $00, $8E, $18, $D4, $88, $D0, $FD, $CA, $D0, $FA, $A9, $EE    // data $8ECF
    .byte $48, $A9, $E9, $48, $AD, $F6, $FE, $4C, $B1, $EE, $EA, $A9, $EE, $48, $A9, $F6    // data $8EDF
    .byte $48, $AD, $F4, $FE, $4C, $B1, $EE, $EA, $AD, $14, $9E, $CD, $14, $FE, $D0, $12    // data $8EEF
    .byte $EE, $20, $D0, $EA, $EA, $EA, $A9, $80, $48, $A9, $0B, $48, $AD, $ED, $FE, $4C    // data $8EFF
    .byte $B1, $EE, $A2, $00, $B5, $00, $9D, $00, $80, $BD, $00, $01, $9D, $00, $81, $E0    // data $8F0F
    .byte $F7, $B0, $12, $E0, $13, $90, $06, $BD, $00, $FE, $9D, $00, $9E, $E0, $02, $90    // data $8F1F
    .byte $04, $A9, $00, $95, $00, $E8, $D0, $DC, $68, $85, $EC, $68, $85, $5F, $29, $7F    // data $8F2F
    .byte $85, $E7, $68, $85, $E8, $68, $85, $E5, $68, $85, $E4, $68, $85, $5E, $68, $85    // data $8F3F
    .byte $CF, $68, $85, $CE, $68, $85, $DF, $68, $85, $DE, $BA, $86, $6C, $68, $85, $E3    // data $8F4F
    .byte $68, $85, $E2, $68, $85, $E1, $68, $85, $E0, $BA, $86, $E6, $A2, $FB, $9A, $AC    // data $8F5F
    .byte $F5, $FE, $A2, $00, $AD, $F8, $9E, $CD, $14, $FE, $D0, $02, $A0, $0A, $84, $EB    // data $8F6F
    .byte $A0, $00, $A2, $0F, $BD, $80, $9F, $95, $80, $98, $9D, $80, $9F, $CA, $10, $F4    // data $8F7F
    .byte $A2, $AA, $A9, $55, $E4, $80, $86, $80, $8E, $80, $9F, $D0, $E5, $C5, $81, $85    // data $8F8F
    .byte $81, $8D, $81, $9F, $D0, $DC, $A2, $1D, $BD, $40, $9F, $95, $40, $CA, $10, $F8    // data $8F9F
    .byte $A9, $80, $48, $A9, $17, $48, $A9, $02, $A0, $82, $A2, $08, $4C, $41, $9E    // data $8FAF
bank00_api_05:
    NOP                    // EA
    LDA $5f                // A5 5F
    STA $3f                // 85 3F
    LDA $5e                // A5 5E
    STA $3e                // 85 3E
    LDA #$0e               // A9 0E
    STA $3b                // 85 3B
    LDX #$3a               // A2 3A
    LDY #$03               // A0 03
    LDA $3e                // A5 3E
    CMP #$33               // C9 33
    BCS bank00_sub_8FDC              // B0 07
    DEC $3b                // C6 3B
    DEC $3b                // C6 3B
    DEY                    // 88
    LDX #$e4               // A2 E4
bank00_sub_8FDC:
    STX $3c                // 86 3C
    STY $3d                // 84 3D
    LDY #$10               // A0 10
    BIT $3f                // 24 3F
    BMI bank00_sub_8FE8              // 30 02
    LDY #$30               // A0 30
bank00_sub_8FE8:
    LDA $3e                // A5 3E
    SEC                    // 38
    SBC $3b                // E5 3B
    BCS bank00_sub_8FF5              // B0 06
    CPY #$30               // C0 30
    BNE bank00_sub_8FF5              // D0 02
    LDA #$00               // A9 00
bank00_sub_8FF5:
    LDY #$30               // A0 30
    STA $3e                // 85 3E
    STY $3f                // 84 3F
    LDX #$65               // A2 65
    LDY #$91               // A0 91
    STX $0318              // 8E 18 03
    STY $0319              // 8C 19 03
    LDX #$2f               // A2 2F
bank00_sub_9007:
    LDA $cfff,X            // BD FF CF
    STA $8f,X              // 95 8F
    DEX                    // CA
    BNE bank00_sub_9007              // D0 F8
    LDA $aa                // A5 AA
    STX $d01a              // 8E 1A D0
    STX $a1                // 86 A1
    STX $a2                // 86 A2
bank00_sub_9018:
    LDY #$ff               // A0 FF
    STY $d019              // 8C 19 D0
    INY                    // C8
bank00_sub_901E:
    LDA $d019              // AD 19 D0
    LSR A                  // 4A
    BCS bank00_sub_9037              // B0 13
    DEX                    // CA
    BNE bank00_sub_901E              // D0 F7
    DEY                    // 88
    BNE bank00_sub_901E              // D0 F4
    LDA $d011              // AD 11 D0
    AND #$7f               // 29 7F
    STA $d011              // 8D 11 D0
    SEC                    // 38
    ROR $a1                // 66 A1
    BNE bank00_sub_9018              // D0 E1
bank00_sub_9037:
    LDX $d012              // AE 12 D0
    LDA $d011              // AD 11 D0
    ORA $a1                // 05 A1
    STA $a1                // 85 A1
    STX $a2                // 86 A2
    LDX #$0c               // A2 0C
bank00_sub_9045:
    LDA $dc00,X            // BD 00 DC
    STA $c0,X              // 95 C0
    LDA $dd00,X            // BD 00 DD
    STA $d0,X              // 95 D0
    DEX                    // CA
    BPL bank00_sub_9045              // 10 F3
    LDA $dc0b              // AD 0B DC
    LDA $dd0b              // AD 0B DD
    STX $dc03              // 8E 03 DC
    LDA $dc01              // AD 01 DC
    STA $c1                // 85 C1
    STX $dd03              // 8E 03 DD
    LDA $dd01              // AD 01 DD
    STA $d1                // 85 D1
    JSR bank00_sub_911C              // 20 1C 91
    SEI                    // 78
    LDA #$10               // A9 10
    STA $dc0e              // 8D 0E DC
    STA $dc0f              // 8D 0F DC
    STA $dd0e              // 8D 0E DD
    STA $dd0f              // 8D 0F DD
    LDX #$03               // A2 03
bank00_sub_907C:
    LDA $c4,X              // B5 C4
    STA $37,X              // 95 37
    LDA $dc04,X            // BD 04 DC
    STA $c4,X              // 95 C4
    LDA $d4,X              // B5 D4
    STA $33,X              // 95 33
    LDA $dd04,X            // BD 04 DD
    STA $d4,X              // 95 D4
    DEX                    // CA
    BPL bank00_sub_907C              // 10 EB
    LDX #$02               // A2 02
    LDY #$01               // A0 01
bank00_sub_9095:
    LDA #$80               // A9 80
    STA $dc04,X            // 9D 04 DC
    LDA #$00               // A9 00
    STA $dc05,X            // 9D 05 DC
    LDA $dc0d              // AD 0D DC
    LDA #$19               // A9 19
    STA $dc0e,Y            // 99 0E DC
bank00_sub_90A7:
    LDA $dc0d              // AD 0D DC
    BPL bank00_sub_90B2              // 10 06
    AND #$83               // 29 83
    ORA $cd                // 05 CD
    STA $cd                // 85 CD
bank00_sub_90B2:
    DEC $ff                // C6 FF
    BNE bank00_sub_90A7              // D0 F1
    LDA #$08               // A9 08
    STA $dc0e,Y            // 99 0E DC
    DEX                    // CA
    DEX                    // CA
    DEY                    // 88
    BPL bank00_sub_9095              // 10 D5
    LDX #$02               // A2 02
    LDY #$01               // A0 01
bank00_sub_90C4:
    LDA #$80               // A9 80
    STA $dd04,X            // 9D 04 DD
    LDA #$00               // A9 00
    STA $dd05,X            // 9D 05 DD
    LDA $dd0d              // AD 0D DD
    LDA #$19               // A9 19
    STA $dd0e,Y            // 99 0E DD
bank00_sub_90D6:
    DEC $ff                // C6 FF
    NOP                    // EA
    BNE bank00_sub_90D6              // D0 FB
    LDA #$08               // A9 08
    STA $dd0e,Y            // 99 0E DD
    DEX                    // CA
    DEX                    // CA
    DEY                    // 88
    BPL bank00_sub_90C4              // 10 DF
    LDX #$7f               // A2 7F
    STX $dd0d              // 8E 0D DD
    STX $dc0d              // 8E 0D DC
    LDA $cd                // A5 CD
    BMI bank00_sub_90F3              // 30 02
    STX $cd                // 86 CD
bank00_sub_90F3:
    LDA $dd                // A5 DD
    BMI bank00_sub_90F9              // 30 02
    STX $dd                // 86 DD
bank00_sub_90F9:
    LDA #$0c               // A9 0C
    STA $7e                // 85 7E
    LDA #$80               // A9 80
    STA $7f                // 85 7F
    LDA #$0a               // A9 0A
    STA $78                // 85 78
    LDX #$06               // A2 06
bank00_sub_9107:
    DEC $2c,X              // D6 2C
    DEX                    // CA
    BNE bank00_sub_9107              // D0 FB
    TXA                    // 8A
    INX                    // E8
    LDY #$08               // A0 08
    JSR bank00_sub_8015              // 20 15 80
    JSR bank00_sub_804E              // 20 4E 80
    JSR bank00_sub_8B3D              // 20 3D 8B
    JMP bank00_sub_800F              // 4C 0F 80
bank00_sub_911C:
    LDA $d0                // A5 D0
    AND #$03               // 29 03
    STA $70                // 85 70
    TAX                    // AA
    LDA $9161,X            // BD 61 91
    STA $71                // 85 71
    LDA $a8                // A5 A8
    TAY                    // A8
    AND #$0e               // 29 0E
    ASL A                  // 0A
    ASL A                  // 0A
    ORA $71                // 05 71
    STA $74                // 85 74
    TYA                    // 98
    AND #$f0               // 29 F0
    LSR A                  // 4A
    LSR A                  // 4A
    ORA $71                // 05 71
    STA $72                // 85 72
    TYA                    // 98
    AND #$08               // 29 08
    ASL A                  // 0A
    ASL A                  // 0A
    ORA $71                // 05 71
    STA $73                // 85 73
    LDA $a6                // A5 A6
    AND #$10               // 29 10
    PHP                    // 08
    LDX #$00               // A2 00
    LDA $a1                // A5 A1
    TAY                    // A8
    AND #$20               // 29 20
    BEQ bank00_sub_9155              // F0 02
    LDX #$02               // A2 02
bank00_sub_9155:
    PLP                    // 28
    BEQ bank00_sub_9159              // F0 01
    INX                    // E8
bank00_sub_9159:
    STX $75                // 86 75
    TYA                    // 98
    AND #$40               // 29 40
    STA $76                // 85 76
    RTS                    // 60
    .byte $C0, $80, $40, $00, $48, $AD, $0D, $DD, $10, $06, $29, $83, $05, $DD, $85, $DD    // data $9161
    .byte $68, $40, $20, $33, $99, $4C, $63, $87, $20, $B9, $98, $30, $3A, $8D, $83, $08    // data $9171
    .byte $48, $20, $BB, $91, $68, $85, $BA, $A2, $F4, $8E, $31, $03, $E8, $8E, $33, $03    // data $9181
    .byte $20, $01, $9F, $24, $80, $A9, $0A, $8D, $EB, $08, $20, $BB, $91, $20, $63, $87    // data $9191
    .byte $0D, $0D, $0D, $20, $54, $55, $52, $42, $4F, $4C, $49, $4E, $4B, $45, $52, $20    // data $91A1
    .byte $4F, $4B, $0D, $00, $20, $9E, $8A, $6C, $34, $03, $A9, $83, $A0, $03, $A2, $01    // data $91B1
    .byte $4C, $12, $80, $E6, $8E, $D0, $02, $E6, $8F, $60, $20, $03, $9F, $5A, $80, $A2    // data $91C1
    .byte $43, $20, $47, $99, $A0, $1E, $84, $A0, $84, $A1, $C9, $00, $F0, $0C, $C9, $01    // data $91D1
    .byte $F0, $04, $C9, $02, $F0, $02, $E6, $A0, $E6, $A1, $A2, $06, $BD, $73, $92, $95    // data $91E1
    .byte $4F, $CA, $D0, $F8, $86, $8D, $86, $8E, $A9, $04, $85, $8F, $20, $E0, $8A, $A9    // data $91F1
    .byte $2D, $A0, $92, $20, $F5, $8A, $20, $86, $8B, $A5, $8D, $48, $20, $63, $87, $0D    // data $9201
    .byte $0D, $4F, $43, $43, $55, $52, $52, $45, $4E, $43, $45, $53, $3A, $20, $00, $68    // data $9211
    .byte $AA, $A9, $00, $20, $CD, $BD, $20, $B4, $98, $4C, $9E, $8A, $A5, $01, $48, $A9    // data $9221
    .byte $37, $85, $01, $A0, $01, $E6, $8E, $D0, $04, $E6, $8F, $F0, $32, $B1, $8E, $C5    // data $9231
    .byte $A0, $F0, $04, $C5, $A1, $D0, $EE, $C8, $B1, $8E, $C9, $D0, $D0, $E5, $A0, $00    // data $9241
    .byte $B1, $8E, $A2, $02, $D5, $50, $F0, $05, $CA, $10, $F9, $30, $D6, $E6, $8D, $B5    // data $9251
    .byte $53, $91, $8E, $C8, $A9, $00, $91, $8E, $C8, $A9, $EA, $91, $8E, $D0, $C4, $68    // data $9261
    .byte $85, $01, $60, $AD, $AE, $AC, $A9, $A2, $A0    // data $9271
bank00_sub_927A:
    LDA $0886              // AD 86 08
    BEQ bank00_sub_9298              // F0 19
    LDA #$1a               // A9 1A
    STA $05f7              // 8D F7 05
    LDA #$2d               // A9 2D
    STA $05f9              // 8D F9 05
    LDY #$09               // A0 09
bank00_sub_928B:
    LDA $0886,Y            // B9 86 08
    AND #$3f               // 29 3F
    BEQ bank00_sub_9295              // F0 03
    STA $05fb,Y            // 99 FB 05
bank00_sub_9295:
    DEY                    // 88
    BPL bank00_sub_928B              // 10 F3
bank00_sub_9298:
    RTS                    // 60
    .byte $AD, $86, $08, $F0, $FA, $20, $DA, $99, $20, $01, $9F, $1B, $80, $4C, $F6, $92    // data $9299
    .byte $20, $63, $87, $46, $49, $4C, $45, $4E, $41, $4D, $45, $20, $3A, $20, $00, $20    // data $92A9
    .byte $62, $9F, $F0, $3C, $A9, $08, $85, $BA, $A0, $01, $B1, $BB, $C9, $2E, $D0, $30    // data $92B9
    .byte $88, $B1, $BB, $C9, $45, $D0, $29, $20, $DA, $99, $20, $01, $9F, $1B, $80, $A9    // data $92C9
    .byte $00, $85, $B9, $AA, $A0, $0A, $20, $01, $9F, $D5, $FF, $B0, $16, $A0, $02, $B1    // data $92D9
    .byte $BB, $99, $84, $08, $C8, $C0, $0B, $F0, $04, $C4, $B7, $D0, $F2, $20, $00, $0A    // data $92E9
    .byte $6C, $34, $03, $4C, $46, $94, $20, $63, $87, $43, $55, $52, $52, $45, $4E, $54    // data $92F9
    .byte $20, $53, $43, $52, $45, $45, $4E, $3A, $20, $00, $AD, $A1, $08, $29, $20, $F0    // data $9309
    .byte $2E, $AD, $A6, $08, $29, $10, $F0, $16, $20, $63, $87, $4D, $55, $4C, $54, $49    // data $9319
    .byte $43, $4F, $4C, $4F, $52, $20, $50, $49, $43, $00, $A2, $00, $F0, $44, $20, $63    // data $9329
    .byte $87, $48, $49, $52, $45, $53, $20, $50, $49, $43, $00, $A2, $01, $D0, $33, $AD    // data $9339
    .byte $A6, $08, $29, $10, $F0, $19, $20, $63, $87, $4D, $55, $4C, $54, $49, $43, $4F    // data $9349
    .byte $4C, $4F, $52, $20, $53, $43, $52, $45, $45, $4E, $00, $A2, $02, $D0, $13, $20    // data $9359
    .byte $63, $87, $4E, $4F, $52, $4D, $41, $4C, $20, $53, $43, $52, $45, $45, $4E, $00    // data $9369
    .byte $A2, $03, $86, $02, $20, $03, $9F, $45, $80, $A2, $47, $20, $47, $99, $85, $3E    // data $9379
    .byte $0A, $AA, $BD, $58, $97, $85, $C3, $BD, $59, $97, $85, $C4, $BD, $4A, $97, $85    // data $9389
    .byte $A9, $BD, $4B, $97, $85, $AA, $A0, $10, $B1, $A9, $99, $4C, $00, $88, $10, $F8    // data $9399
    .byte $AD, $D0, $08, $29, $03, $49, $03, $0A, $0A, $0A, $0A, $0A, $0A, $85, $42, $85    // data $93A9
    .byte $44, $A9, $00, $85, $41, $85, $43, $6C, $C3, $00, $A6, $02, $E0, $02, $90, $B9    // data $93B9
    .byte $AD, $A8, $08, $29, $0E, $0A, $0A, $18, $65, $42, $85, $44, $4C, $8A, $95, $A6    // data $93C9
    .byte $02, $E0, $01, $F0, $A4, $AD, $A8, $08, $AA, $29, $F0, $4A, $4A, $18, $65, $44    // data $93D9
    .byte $85, $44, $4C, $8A, $95, $A9, $00, $85, $43, $A9, $D8, $85, $44, $4C, $8A, $95    // data $93E9
    .byte $A5, $02, $C9, $02, $B0, $83, $AD, $A8, $08, $29, $08, $F0, $07, $18, $A5, $44    // data $93F9
    .byte $69, $20, $85, $44, $4C, $8A, $95, $A5, $02, $F0, $03, $4C, $82, $93, $20, $9F    // data $9409
    .byte $98, $C9, $FF, $F0, $2B, $A0, $1C, $B9, $C2, $96, $99, $40, $00, $88, $10, $F7    // data $9419
    .byte $20, $82, $96, $A6, $4F, $A4, $50, $20, $6A, $98, $B0, $11, $20, $8F, $F6, $A9    // data $9429
    .byte $0B, $8D, $11, $D0, $20, $E9, $8A, $20, $43, $96, $20, $E7, $94, $20, $8F, $98    // data $9439
    .byte $4C, $B5, $91, $20, $33, $99, $20, $02, $9F, $2D, $80, $AD, $B0, $03, $C9, $FF    // data $9449
    .byte $D0, $03, $4C, $B8, $91, $20, $9F, $98, $C9, $FF, $F0, $E4, $A2, $00, $86, $FF    // data $9459
    .byte $A9, $03, $8D, $CA, $02, $A0, $12, $AD, $B0, $03, $F0, $16, $B9, $30, $97, $99    // data $9469
    .byte $4C, $00, $88, $10, $F7, $A2, $0F, $BD, $85, $80, $9D, $E9, $03, $CA, $10, $F7    // data $9479
    .byte $30, $09, $B9, $1F, $97, $99, $4C, $00, $88, $10, $F7, $20, $82, $96, $A6, $4F    // data $9489
    .byte $A4, $50, $20, $6A, $98, $B0, $44, $20, $8F, $F6, $A9, $0B, $8D, $11, $D0, $20    // data $9499
    .byte $E9, $8A, $A0, $00, $A6, $FF, $BD, $B0, $03, $99, $8C, $00, $E6, $FF, $C8, $C0    // data $94A9
    .byte $04, $D0, $F1, $A5, $8C, $C9, $FF, $F0, $16, $A5, $8F, $C9, $D8, $D0, $03, $A9    // data $94B9
    .byte $37, $2C, $A9, $34, $85, $4C, $8D, $D3, $02, $20, $26, $96, $4C, $AD, $94, $20    // data $94C9
    .byte $5B, $99, $20, $3F, $F6, $AD, $78, $08, $8D, $CA, $02, $4C, $46, $94, $A9, $40    // data $94D9
    .byte $CD, $71, $08, $90, $01, $4A, $85, $C2, $85, $AF, $A2, $00, $86, $C1, $86, $AE    // data $94E9
    .byte $8A, $0A, $A8, $A9, $00, $85, $8E, $B5, $40, $20, $68, $96, $85, $8F, $B9, $45    // data $94F9
    .byte $00, $85, $8C, $B9, $46, $00, $85, $8D, $20, $26, $96, $E8, $E0, $03, $D0, $E0    // data $9509
    .byte $20, $5B, $99, $4C, $3F, $F6, $20, $33, $99, $20, $63, $87, $53, $41, $56, $45    // data $9519
    .byte $20, $4D, $45, $4D, $4F, $52, $59, $0D, $0D, $46, $52, $4F, $4D, $20, $24, $30    // data $9529
    .byte $30, $30, $30, $9D, $9D, $9D, $9D, $00, $A2, $05, $A0, $0A, $20, $66, $9F, $A0    // data $9539
    .byte $4F, $20, $CC, $95, $90, $03, $4C, $0C, $80, $20, $63, $87, $20, $20, $54, $4F    // data $9549
    .byte $20, $24, $30, $30, $30, $30, $9D, $9D, $9D, $9D, $00, $A2, $05, $A0, $0A, $20    // data $9559
    .byte $66, $9F, $A0, $4D, $20, $CC, $95, $90, $03, $4C, $0C, $80, $A5, $4E, $38, $E5    // data $9569
    .byte $50, $85, $4E, $A5, $4D, $E5, $4F, $85, $4D, $A5, $4F, $85, $43, $A5, $50, $85    // data $9579
    .byte $44, $A5, $4C, $8D, $D3, $02, $20, $9F, $98, $C9, $FF, $F0, $33, $20, $82, $96    // data $9589
    .byte $A6, $4F, $A4, $50, $20, $6A, $98, $B0, $24, $20, $8F, $F6, $A9, $0B, $8D, $11    // data $9599
    .byte $D0, $20, $E9, $8A, $A5, $4D, $85, $8C, $A5, $4E, $85, $8D, $A5, $43, $85, $8E    // data $95A9
    .byte $A5, $44, $85, $8F, $20, $26, $96, $20, $5B, $99, $20, $3F, $F6, $20, $8F, $98    // data $95B9
    .byte $4C, $B5, $91, $20, $79, $00, $C9, $24, $D0, $51, $C8, $20, $E1, $95, $B0, $4B    // data $95C9
    .byte $88, $20, $E1, $95, $B0, $45, $18, $60, $20, $73, $00, $20, $12, $96, $B0, $3B    // data $95D9
    .byte $AA, $20, $73, $00, $20, $12, $96, $B0, $32, $20, $08, $96, $99, $00, $00, $8A    // data $95E9
    .byte $20, $08, $96, $0A, $0A, $0A, $0A, $19, $00, $00, $99, $00, $00, $18, $60, $C9    // data $95F9
    .byte $41, $38, $30, $02, $E9, $07, $E9, $30, $60, $C9, $47, $B0, $0E, $C9, $41, $B0    // data $9609
    .byte $08, $C9, $3A, $B0, $06, $C9, $30, $90, $02, $18, $24, $38, $60, $A0, $00, $20    // data $9619
    .byte $B3, $02, $20, $A8, $FF, $20, $C4, $91, $C4, $8C, $D0, $05, $C6, $8D, $EE, $20    // data $9629
    .byte $D0, $C6, $8C, $A5, $8D, $05, $8C, $D0, $E4, $60, $A2, $00, $86, $8E, $E8, $8A    // data $9639
    .byte $0A, $A8, $A9, $37, $8D, $D3, $02, $A9, $D8, $18, $79, $4C, $00, $B0, $0C, $85    // data $9649
    .byte $8F, $B9, $4B, $00, $A8, $BD, $B0, $08, $20, $A7, $02, $CA, $10, $E1, $60, $C9    // data $9659
    .byte $02, $D0, $08, $A9, $37, $8D, $D3, $02, $A9, $D8, $60, $86, $02, $AA, $A9, $34    // data $9669
    .byte $8D, $D3, $02, $BD, $72, $08, $A6, $02, $60, $20, $52, $9F, $A5, $B7, $D0, $03    // data $9679
    .byte $4C, $0C, $80, $A6, $52, $F0, $13, $A5, $B7, $C9, $10, $B0, $02, $E6, $B7, $C6    // data $9689
    .byte $BB, $A0, $00, $B5, $52, $91, $BB, $CA, $D0, $ED, $A4, $B7, $C4, $51, $90, $04    // data $9699
    .byte $A4, $51, $84, $B7, $A5, $58, $F0, $10, $A4, $B7, $A2, $00, $B5, $59, $91, $BB    // data $96A9
    .byte $C8, $E6, $B7, $E8, $E4, $58, $D0, $F4, $60, $01, $00, $02, $02, $02, $40, $1F    // data $96B9
    .byte $E8, $03, $E9, $03, $FF, $FF, $E8, $03, $00, $60, $0F, $05, $81, $50, $49, $43    // data $96C9
    .byte $20, $00, $34, $E8, $03, $00, $10, $0C, $00, $00, $00, $00, $00, $00, $04, $2E    // data $96D9
    .byte $53, $43, $52, $37, $E8, $03, $00, $10, $0C, $00, $00, $00, $00, $00, $00, $04    // data $96E9
    .byte $2E, $43, $4F, $4C, $34, $40, $1F, $00, $20, $0C, $00, $00, $00, $00, $00, $00    // data $96F9
    .byte $04, $2E, $42, $4D, $50, $34, $00, $08, $00, $20, $0C, $00, $00, $00, $00, $00    // data $9709
    .byte $00, $04, $2E, $43, $48, $52, $34, $00, $08, $00, $3C, $0C, $00, $00, $00, $00    // data $9719
    .byte $00, $00, $04, $2E, $46, $4C, $49, $34, $00, $08, $F0, $3F, $0F, $02, $5E, $5E    // data $9729
    .byte $00, $00, $00, $00, $34, $00, $08, $00, $20, $10, $00, $00, $00, $00, $00, $00    // data $9739
    .byte $00, $DB, $96, $FD, $96, $0E, $97, $DB, $96, $EC, $96, $1F, $97, $3D, $97, $10    // data $9749
    .byte $94, $F9, $93, $C3, $93, $D8, $93, $EE, $93, $4C, $94, $1F, $95, $6C, $34, $03    // data $9759
    .byte $A9, $72, $A0, $97, $20, $2C, $99, $D0, $06, $20, $4D, $98, $A2, $FB, $9A, $20    // data $9769
    .byte $63, $87, $50, $4F, $4B, $45, $20, $00, $A2, $05, $86, $8D, $A0, $10, $20, $66    // data $9779
    .byte $9F, $20, $79, $00, $F0, $D7, $A0, $00, $B1, $7A, $F0, $DD, $C9, $2C, $F0, $03    // data $9789
    .byte $C8, $D0, $F5, $C0, $00, $F0, $D2, $84, $02, $A0, $00, $B1, $7A, $D0, $03, $4C    // data $9799
    .byte $39, $98, $C9, $24, $F0, $03, $C8, $D0, $F2, $20, $79, $00, $C9, $24, $D0, $37    // data $97A9
    .byte $A4, $02, $88, $B1, $7A, $20, $59, $98, $85, $14, $88, $F0, $30, $B1, $7A, $20    // data $97B9
    .byte $59, $98, $0A, $0A, $0A, $0A, $05, $14, $85, $14, $88, $F0, $20, $B1, $7A, $20    // data $97C9
    .byte $59, $98, $85, $15, $88, $F0, $16, $B1, $7A, $20, $59, $98, $0A, $0A, $0A, $0A    // data $97D9
    .byte $05, $15, $85, $15, $88, $F0, $06, $20, $8A, $AD, $20, $F7, $B7, $20, $79, $00    // data $97E9
    .byte $C9, $2C, $F0, $07, $20, $73, $00, $C9, $2C, $D0, $F9, $20, $73, $00, $C9, $24    // data $97F9
    .byte $D0, $28, $A0, $01, $B1, $7A, $F0, $08, $C8, $C0, $04, $D0, $F7, $4C, $72, $97    // data $9809
    .byte $88, $B1, $7A, $20, $59, $98, $85, $02, $88, $F0, $0B, $B1, $7A, $20, $59, $98    // data $9819
    .byte $0A, $0A, $0A, $0A, $05, $02, $AA, $4C, $3C, $98, $20, $9E, $B7, $4C, $3C, $98    // data $9829
    .byte $20, $EB, $B7, $8A, $A4, $14, $A2, $00, $86, $8E, $A6, $15, $86, $8F, $20, $A7    // data $9839
    .byte $02, $4C, $78, $97, $20, $63, $87, $45, $52, $52, $4F, $52, $21, $0D, $00, $60    // data $9849
    .byte $C9, $47, $90, $03, $4C, $72, $97, $C9, $41, $38, $30, $02, $E9, $07, $E9, $30    // data $9859
    .byte $60, $86, $C3, $84, $C4, $A9, $61, $85, $B9, $20, $89, $98, $A5, $BA, $20, $B1    // data $9869
    .byte $FF, $A5, $B9, $20, $93, $FF, $A5, $C3, $20, $A8, $FF, $A5, $C4, $4C, $A8, $FF    // data $9879
    .byte $20, $D5, $F3, $B0, $01, $60, $20, $B4, $98, $20, $02, $9F, $24, $80, $60    // data $9889
bank00_sub_9898:
    STA $0334              // 8D 34 03
    STY $0335              // 8C 35 03
    RTS                    // 60
    .byte $AD, $77, $08, $85, $BA, $20, $B9, $98, $C9, $FF, $D0, $01, $60, $8D, $77, $08    // data $989F
    .byte $85, $BA, $20, $33, $99, $A9, $0D, $4C, $16, $E7, $20, $33, $99, $20, $63, $87    // data $98AF
    .byte $20, $53, $50, $41, $43, $45, $2A, $44, $45, $56, $49, $43, $45, $3A, $20, $00    // data $98BF
    .byte $A9, $00, $A6, $BA, $E0, $08, $90, $05, $E0, $1F, $B0, $01, $2C, $A2, $08, $86    // data $98CF
    .byte $BA, $20, $CD, $BD, $20, $63, $87, $20, $0D, $52, $45, $54, $55, $52, $4E, $2A    // data $98DF
    .byte $43, $4F, $4E, $54, $49, $4E, $55, $45, $0D, $91, $91, $00, $20, $E4, $FF, $C9    // data $98EF
    .byte $20, $F0, $0B, $C9, $0D, $F0, $23, $C9, $03, $D0, $F1, $A9, $FF, $60, $A5, $BA    // data $98FF
    .byte $C9, $1E, $D0, $04, $A9, $07, $85, $BA, $E6, $BA, $20, $02, $9F, $0C, $80, $F0    // data $990F
    .byte $ED, $20, $9D, $9C, $20, $3D, $99, $4C, $BC, $98, $A5, $BA, $60, $8D, $00, $03    // data $991F
    .byte $8C, $01, $03, $60, $A2, $0F, $20, $FF, $E9, $E8, $E0, $19, $D0, $F8, $A2, $0F    // data $992F
    .byte $A0, $00    // data $993F
bank00_sub_9941:
    CLC                    // 18
    JMP $fff0              // 4C F0 FF
    .byte $A2, $42, $E8, $86, $3F, $20, $A5, $8A, $C9, $41, $90, $F9, $C5, $3F, $B0, $F5    // data $9945
    .byte $E9, $40, $AA, $86, $3F, $60    // data $9955
bank00_sub_995B:
    LDA #$01               // A9 01
    LDY #$00               // A0 00
bank00_sub_995F:
    STA $d800,Y            // 99 00 D8
    STA $d900,Y            // 99 00 D9
    STA $da00,Y            // 99 00 DA
    STA $dae8,Y            // 99 E8 DA
    INY                    // C8
    BNE bank00_sub_995F              // D0 F1
    LDA #$1b               // A9 1B
    STA $d011              // 8D 11 D0
    RTS                    // 60
bank00_sub_9974:
    LDX #$53               // A2 53
bank00_sub_9976:
    LDA $9986,X            // BD 86 99
    STA $02a7,X            // 9D A7 02
    DEX                    // CA
    BPL bank00_sub_9976              // 10 F7
    LDA $0878              // AD 78 08
    STA $02ca              // 8D CA 02
    RTS                    // 60
    .byte $8D, $E9, $02, $8E, $F7, $02, $A2, $8E, $A9, $8D, $D0, $07, $8E, $F7, $02, $A2    // data $9986
    .byte $8E, $A9, $AD, $8D, $EA, $02, $78, $98, $18, $75, $00, $8D, $EB, $02, $B5, $01    // data $9996
    .byte $69, $00, $C9, $0A, $B0, $02, $69, $80, $8D, $EC, $02, $A2, $34, $A9, $00, $B0    // data $99A6
    .byte $0B, $AD, $12, $D0, $E9, $30, $B0, $F9, $A2, $37, $A9, $23, $8D, $00, $DE, $86    // data $99B6
    .byte $01, $A9, $FF, $8D, $FF, $FF, $A2, $37, $86, $01, $A2, $00, $8E, $00, $DE, $A2    // data $99C6
    .byte $FF, $29, $FF, $60, $AD, $78, $08, $C9, $0A, $D0, $13, $20, $0F, $9A, $20, $1E    // data $99D6
    .byte $9A, $20, $15, $9A, $4C, $FD, $99    // data $99E6
bank00_sub_99ED:
    LDA #$0a               // A9 0A
    CMP $0878              // CD 78 08
    BEQ bank00_sub_9A05              // F0 11
    JSR bank00_sub_9A15              // 20 15 9A
    JSR bank00_sub_9A1E              // 20 1E 9A
    JSR bank00_sub_9A0F              // 20 0F 9A
    LDA $0878              // AD 78 08
    EOR #$1f               // 49 1F
    STA $0878              // 8D 78 08
bank00_sub_9A05:
    JSR bank00_sub_9974              // 20 74 99
    LDY #$f7               // A0 F7
    LDX #$9e               // A2 9E
    JMP bank00_sub_9EA9              // 4C A9 9E
bank00_sub_9A0F:
    LDX #$06               // A2 06
    LDA #$8a               // A9 8A
    BNE bank00_sub_9A19              // D0 04
bank00_sub_9A15:
    LDX #$05               // A2 05
    LDA #$90               // A9 90
bank00_sub_9A19:
    LDY #$0a               // A0 0A
    JMP bank00_sub_8012              // 4C 12 80
bank00_sub_9A1E:
    LDA #$0a               // A9 0A
    LDY #$10               // A0 10
    LDX #$05               // A2 05
    JMP bank00_api_06              // 4C 5F 9C
    .byte $AD, $71, $08, $85, $8C, $A5, $F7, $48, $AD, $8A, $02, $48, $A9, $80, $8D, $8A    // data $9A27
    .byte $02, $A9, $00, $85, $F7, $AD, $72, $08, $8D, $88, $02, $85, $8D, $20, $45, $80    // data $9A37
    .byte $20, $43, $9C, $84, $A9, $20, $76, $9A, $84, $AB, $A9, $27, $85, $AA, $20, $6B    // data $9A47
    .byte $9A, $20, $43, $9C, $20, $4E, $80, $68, $85, $F7, $68, $8D, $8A, $02, $4C, $48    // data $9A57
    .byte $80, $20, $A3, $9A, $20, $23, $9C, $F0, $F8, $C9, $03, $D0, $F4, $38, $24, $18    // data $9A67
    .byte $AC, $88, $02, $C8, $C8, $C8, $84, $F4, $A9, $C0, $85, $F3, $A0, $0B, $90, $0D    // data $9A77
    .byte $B9, $3C, $03, $91, $F3, $B9, $48, $03, $99, $C0, $DB, $B0, $0B, $B1, $F3, $99    // data $9A87
    .byte $3C, $03, $B9, $C0, $DB, $99, $48, $03, $88, $10, $E3, $60, $20, $CB, $E8, $10    // data $9A97
    .byte $FA, $20, $04, $9B, $E0, $18, $90, $06, $A4, $9F, $C0, $0C, $90, $ED, $A5, $F7    // data $9AA7
    .byte $D0, $E9, $AD, $86, $02, $48, $AD, $21, $D0, $49, $05, $8D, $86, $02, $98, $18    // data $9AB7
    .byte $65, $D1, $48, $A5, $D2, $69, $00, $29, $03, $05, $8D, $48, $A2, $18, $A0, $00    // data $9AC7
    .byte $20, $0C, $E5, $20, $F3, $9A, $68, $A8, $68, $AA, $98, $20, $87, $9C, $20, $FF    // data $9AD7
    .byte $9A, $68, $8D, $86, $02, $A6, $9E, $A4, $9F, $4C, $0C, $E5, $A6, $9E, $20, $FA    // data $9AE7
    .byte $9A, $A6, $9F, $A9, $00, $20, $CD, $BD, $A9, $20, $4C, $D2, $FF, $A6, $D6, $E0    // data $9AF7
    .byte $18, $F0, $0C, $C9, $93, $F0, $08, $C9, $04, $F0, $04, $C9, $09, $D0, $09, $20    // data $9B07
    .byte $74, $9A, $20, $1F, $9B, $4C, $76, $9A, $20, $2D, $9B, $A6, $D6, $A4, $D3, $86    // data $9B17
    .byte $9E, $84, $9F, $4C, $0C, $E5, $A5, $D7, $C9, $94, $F0, $04, $C9, $14, $D0, $1A    // data $9B27
    .byte $48, $8A, $48, $98, $48, $A5, $AA, $85, $D5, $A5, $D7, $30, $0A, $A4, $D3, $C4    // data $9B37
    .byte $A9, $D0, $01, $C8, $4C, $5C, $E7, $4C, $05, $E8, $A4, $D3, $C9, $1D, $D0, $07    // data $9B47
    .byte $C4, $AA, $F0, $02, $E6, $D3, $60, $C9, $9D, $D0, $07, $C4, $A9, $F0, $02, $C6    // data $9B57
    .byte $D3, $60, $24, $AB, $30, $0B, $C9, $20, $90, $F7, $C9, $60, $B0, $F3, $4C, $FB    // data $9B67
    .byte $9B, $A6, $D6, $C9, $11, $D0, $07, $E0, $18, $F0, $02, $E6, $D6, $60, $C9, $0D    // data $9B77
    .byte $D0, $0B, $E0, $18, $F0, $02, $E6, $D6, $A0, $00, $84, $D3, $60, $C9, $8D, $F0    // data $9B87
    .byte $F1, $C9, $91, $D0, $06, $8A, $F0, $02, $C6, $D6, $60, $A6, $D6, $C9, $04, $D0    // data $9B97
    .byte $08, $CA, $48, $48, $48, $48, $4C, $F8, $E8, $C9, $09, $D0, $0F, $20, $6C, $E9    // data $9BA7
    .byte $A2, $19, $B5, $D9, $09, $80, $95, $D9, $CA, $10, $F7, $60, $C9, $86, $D0, $04    // data $9BB7
    .byte $EE, $20, $D0, $60, $C9, $8A, $D0, $04, $CE, $20, $D0, $60, $C9, $87, $D0, $04    // data $9BC7
    .byte $EE, $21, $D0, $60, $C9, $8B, $D0, $04, $CE, $21, $D0, $60, $C9, $88, $D0, $09    // data $9BD7
    .byte $A5, $F7, $49, $01, $85, $F7, $4C, $74, $9A, $C9, $20, $B0, $07, $A0, $00, $84    // data $9BE7
    .byte $D4, $4C, $16, $E7, $A8, $30, $1B, $C9, $60, $90, $04, $29, $DF, $D0, $08, $29    // data $9BF7
    .byte $3F, $A6, $C7, $F0, $02, $09, $80, $AE, $86, $02, $20, $13, $EA, $A4, $D3, $4C    // data $9C07
    .byte $57, $9B, $C9, $A0, $90, $D7, $29, $7F, $09, $40, $D0, $E5, $58, $20, $E4, $FF    // data $9C17
    .byte $85, $CC, $F0, $F9, $78, $48, $A5, $CF, $F0, $0C, $A5, $CE, $AE, $87, $02, $A0    // data $9C27
    .byte $00, $84, $CF, $20, $13, $EA, $68, $85, $D7, $C9, $0D, $60, $A4, $8C, $10, $FB    // data $9C37
    .byte $AD, $D0, $08, $29, $FC, $09, $06, $8D, $00, $DD, $A5, $8D, $29, $3F, $09, $40    // data $9C47
    .byte $8D, $88, $02, $98, $A0, $40, $A2, $40    // data $9C57
bank00_api_06:
    STA $23                // 85 23
    STY $25                // 84 25
    LDA #$6a               // A9 6A
    LDY #$9c               // A0 9C
    JMP bank00_sub_8042              // 4C 42 80
    .byte $84, $22, $84, $24, $E6, $01, $B1, $22, $48, $B1, $24, $91, $22, $68, $91, $24    // data $9C6A
    .byte $C8, $D0, $F3, $E6, $23, $E6, $25, $CA, $D0, $EC, $C6, $01, $60, $48, $A9, $24    // data $9C7A
    .byte $20, $16, $E7, $68, $20, $92, $9C, $8A, $48, $4A, $4A, $4A, $4A, $20, $9D, $9C    // data $9C8A
    .byte $68, $29, $0F, $18, $69, $30, $C9, $3A, $90, $02, $69, $06, $4C, $16, $E7, $00    // data $9C9A
    .byte $0B, $08, $0A, $00, $9E, $32, $30, $36, $31, $00, $00, $00, $78, $A9, $7F, $8D    // data $9CAA
    .byte $0D, $DD, $A9, $34, $85, $01, $A2, $0C, $A0, $AA, $B9, $AA, $AA, $99, $AA, $FF    // data $9CBA
    .byte $88, $C0, $FF, $D0, $F5, $CE, $20, $08, $CE, $1D, $08, $EC, $1D, $08, $D0, $EA    // data $9CCA
    .byte $E6, $01, $A2, $E0, $9A, $C8, $B9, $00, $0A, $99, $00, $01, $B9, $00, $0B, $99    // data $9CDA
    .byte $00, $D8, $4A, $4A, $4A, $4A, $99, $00, $DA, $C8, $D0, $EA, $EE, $3F, $08, $EE    // data $9CEA
    .byte $42, $08, $EE, $49, $08, $CE, $39, $08, $CE, $3C, $08, $10, $D9, $A2, $0E, $A9    // data $9CFA
    .byte $80, $9D, $02, $D4, $9D, $03, $D4, $A9, $21, $9D, $04, $D4, $A9, $08, $9D, $05    // data $9D0A
    .byte $D4, $A9, $80, $9D, $06, $D4, $8A, $38, $E9, $07, $AA, $10, $E2, $A0, $0F, $A9    // data $9D1A
    .byte $00, $0A, $90, $17, $A2, $FF, $8E, $0E, $D4, $8E, $0F, $D4, $8D, $13, $D4, $A2    // data $9D2A
    .byte $F0, $8E, $14, $D4, $A2, $81, $8E, $12, $D4, $A0, $1F, $8C, $18, $D4, $A0, $02    // data $9D3A
    .byte $A9, $FF, $99, $01, $DC, $99, $01, $DD, $88, $D0, $F7, $C0, $10, $B0, $0C, $B9    // data $9D4A
    .byte $30, $0D, $99, $00, $DC, $B9, $40, $0D, $99, $00, $DD, $B9, $00, $0D, $99, $00    // data $9D5A
    .byte $D0, $C8, $C0, $2F, $D0, $E5, $20, $50, $0D, $AD, $30, $03, $85, $C3, $AD, $31    // data $9D6A
    .byte $03, $85, $C8, $A9, $20, $A2, $06, $8D, $00, $DE, $8D, $FE, $DE, $8E, $00, $DE    // data $9D7A
    .byte $C6, $01, $A0, $00, $4C, $8E, $00    // data $9D8A
bank00_sub_9D91:
    LDX #$14               // A2 14
bank00_sub_9D93:
    LDA $9d9f,X            // BD 9F 9D
    STA $0100,X            // 9D 00 01
    DEX                    // CA
    BPL bank00_sub_9D93              // 10 F7
    JMP $0100              // 4C 00 01
    .byte $A9, $23, $8D, $00, $DE, $98, $8D, $C5, $9E, $09, $03, $8D, $94, $9E, $A9, $00    // data $9D9F
    .byte $8D, $00, $DE, $60    // data $9DAF
bank00_api_08:
    LDY #$80               // A0 80
    STY $b0                // 84 B0
    STY $b1                // 84 B1
    JSR bank00_sub_8060              // 20 60 80
bank00_sub_9DBC:
    LDY #$00               // A0 00
    LDA ($b0),Y            // B1 B0
    LDX #$95               // A2 95
    LDY $b0                // A4 B0
    JSR bank00_sub_9EA9              // 20 A9 9E
    INC $b0                // E6 B0
    BNE bank00_sub_9DCD              // D0 02
    INC $b1                // E6 B1
bank00_sub_9DCD:
    LDA $b0                // A5 B0
    CMP #$80               // C9 80
    BNE bank00_sub_9DBC              // D0 E9
    RTS                    // 60
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DD4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DE4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DF4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E04
    .byte $30, $A5, $01, $8D, $2E, $DE, $09, $03, $85, $01, $A9, $08, $8D, $00, $DE, $2C    // data $9E14
    .byte $80, $80, $2C, $80, $80, $2C, $80, $80, $EA, $A9, $37, $85, $01, $A9, $0A, $8D    // data $9E24
    .byte $00, $DE, $00, $00, $00, $00, $00, $00, $00, $00, $00, $38, $24, $18, $20, $7F    // data $9E34
    .byte $DE, $8D, $58, $DE, $8D, $61, $DE, $8C, $5E, $DE, $8C, $65, $DE, $8E, $A5, $DE    // data $9E44
    .byte $A0, $00, $B9, $00, $00, $AA, $90, $07, $B9, $00, $00, $99, $00, $00, $8A, $99    // data $9E54
    .byte $00, $00, $C8, $D0, $ED, $CE, $A5, $DE, $F0, $44, $EA, $EA, $EA, $EE, $58, $DE    // data $9E64
    .byte $EE, $61, $DE, $EE, $5E, $DE, $EE, $65, $DE, $D0, $D7, $08, $48, $A9, $FB, $CD    // data $9E74
    .byte $12, $D0, $D0, $FB, $68, $28, $20, $BA, $DE, $48, $A9, $23, $8D, $00, $DE, $A9    // data $9E84
    .byte $23, $8D, $00, $DE, $68, $8E, $B1, $DE, $60, $20, $BA, $DE, $8E, $A5, $DE, $B9    // data $9E94
    .byte $00, $00, $4C, $B2, $DE    // data $9EA4
bank00_sub_9EA9:
    JSR $deba              // 20 BA DE
    JSR $de8d              // 20 8D DE
    STA $0000,Y            // 99 00 00
    PHA                    // 48
    LDA #$00               // A9 00
    STA $de00              // 8D 00 DE
    PLA                    // 68
    RTS                    // 60
    .byte $48, $78, $A9, $00, $48, $A9, $20, $8D, $00, $DE, $A9, $20, $8D, $00, $DE, $68    // data $9EBA
    .byte $8D, $B4, $DE, $68, $60, $EA, $EA, $EA, $6C, $FC, $FF, $EA, $EA, $EA, $EA, $EA    // data $9ECA
    .byte $EA, $6C, $F8, $FF, $8D, $00, $DE, $68, $40, $EA, $85, $9E, $68, $8D, $00, $DE    // data $9EDA
    .byte $A5, $9E, $60, $00, $00, $08, $10, $18, $20, $02, $23, $06, $43, $00, $00, $00    // data $9EEA
    .byte $00, $00, $00, $00, $00, $00, $EA    // data $9EFA
bank00_sub_9F01:
    NOP                    // EA
    NOP                    // EA
bank00_sub_9F03:
    NOP                    // EA
    NOP                    // EA
    NOP                    // EA
    CLD                    // D8
    STA $a5                // 85 A5
    STX $a6                // 86 A6
    STY $a7                // 84 A7
    PHP                    // 08
    PLA                    // 68
    STA $a8                // 85 A8
    PLA                    // 68
    STA $a9                // 85 A9
    CLC                    // 18
    ADC #$02               // 69 02
    TAX                    // AA
    PLA                    // 68
    STA $aa                // 85 AA
    ADC #$00               // 69 00
    PHA                    // 48
    TXA                    // 8A
    PHA                    // 48
    LDA $a9                // A5 A9
    BNE bank00_sub_9F26              // D0 02
    DEC $aa                // C6 AA
bank00_sub_9F26:
    DEC $a9                // C6 A9
    LDY #$00               // A0 00
    LDA ($a9),Y            // B1 A9
    SEC                    // 38
    SBC #$00               // E9 00
    TAX                    // AA
    LDA #$00               // A9 00
    PHA                    // 48
    LDA #$de               // A9 DE
    PHA                    // 48
    LDA #$e2               // A9 E2
    PHA                    // 48
    LDY #$03               // A0 03
    LDA ($a9),Y            // B1 A9
    PHA                    // 48
    DEY                    // 88
    LDA ($a9),Y            // B1 A9
    PHA                    // 48
    LDA $a8                // A5 A8
    PHA                    // 48
    LDA $a5                // A5 A5
    PHA                    // 48
    LDA $deee,X            // BD EE DE
    LDX $a6                // A6 A6
    LDY $a7                // A4 A7
    JMP $dede              // 4C DE DE
    .byte $20, $63, $87, $0D, $46, $49, $4C, $45, $4E, $41, $4D, $45, $20, $3A, $20, $00    // data $9F52
    .byte $A2, $0B, $A0, $19, $86, $A9, $84, $AA, $84, $AB, $A2, $08, $A0, $02, $20, $BD    // data $9F62
    .byte $FF, $86, $7A, $84, $7B, $20, $23, $9C, $F0, $05, $20, $1F, $9B, $10, $F6, $A2    // data $9F72
    .byte $00, $A4, $A9, $88, $C8, $B1, $D1, $29, $3F, $F0, $08, $85, $02, $06, $02, $24    // data $9F82
    .byte $02, $70, $02, $09, $40, $9D, $08, $02, $E8, $C4, $AA, $D0, $E7, $BD, $07, $02    // data $9F92
    .byte $C9, $20, $D0, $03, $CA, $D0, $F6, $86, $B7, $A9, $00, $9D, $08, $02, $20, $B4    // data $9FA2
    .byte $98, $8A, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FB2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FC2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FD2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9FE2
    .byte $00, $00, $00, $00, $00, $00, $22, $EE, $39, $EE, $0D, $EE, $30, $EE    // data $9FF2
