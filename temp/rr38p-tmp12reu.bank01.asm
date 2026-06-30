// Disassembly for rr38p-tmp12reu.bin bank 1
// Bank file offset: $2000-$3FFF
// Cartridge window: $8000-$9FFF
// Vectors: coldstart=$8009, warmstart=$800C, signature=c3 c2 cd 38 30
// Reachable instructions: 1597 bytes decoded as code: 3305
// Entry points: $8009, $800C, $8021, $805B, $80B9, $82B3, $82D2, $831D, $8341, $83D0, $899A, $9964, $9966, $9BE3
// Jump table from cold start:
//   $8009 -> $805B
//   $800C -> $80B9
//   $800F -> $83D0
//   $8012 -> $9BE3
//   $8015 -> $82D2
//   $8018 -> $82B3
//   $801B -> $831D
//   $801E -> $899A
//   $8021 -> $8021
//   $8024 -> $8341
//   $8027 -> $9964
//   $802A -> $9966
// External branch/jsr/jmp targets: $0073, $0079, $0100, $0210, $2033, $6800, $A571, $A66F, $A96B, $AACA, $AD8A, $B1B8, $B79E, $BC49, $BDCD, $BDDD, $DE26, $DE97, $DE9D, $DEA9, $DED3, $DEDE, $DEE7, $E0F9, $E3BF, $E422, $E453, $E5B4, $E602, $E63A, $E716, $EA13, $EA24, $F250, $F30F, $F31F, $F6BC, $F6ED, $F707, $F713, $F9A0, $FDA3, $FE72, $FF5B, $FF93, $FF96, $FFA5, $FFA8, $FFAB, $FFAE, $FFB1, $FFB4, $FFBA, $FFBD, $FFC0, $FFC3, $FFC6, $FFCC, $FFCF, $FFD2, $FFE7, $FFF0

// Symbol table (auto-generated)
//   $8009 bank01_cold_start
//   $800C bank01_warm_start
//   $8021 bank01_api_08
//   $802D bank01_sub_802D
//   $805A bank01_sub_805A
//   $805B bank01_api_00
//   $8088 bank01_sub_8088
//   $80A9 bank01_sub_80A9
//   $80B3 bank01_sub_80B3
//   $80B9 bank01_api_01
//   $80C7 bank01_sub_80C7
//   $80C9 bank01_sub_80C9
//   $8115 bank01_sub_8115
//   $8147 bank01_sub_8147
//   $814E bank01_sub_814E
//   $8162 bank01_sub_8162
//   $81EB bank01_sub_81EB
//   $81F3 bank01_sub_81F3
//   $821C bank01_sub_821C
//   $82B3 bank01_api_05
//   $82B6 bank01_sub_82B6
//   $82C4 bank01_sub_82C4
//   $82D2 bank01_api_04
//   $82DD bank01_sub_82DD
//   $831D bank01_api_06
//   $8341 bank01_api_09
//   $8352 bank01_sub_8352
//   $8361 bank01_sub_8361
//   $8364 bank01_sub_8364
//   $836F bank01_sub_836F
//   $8382 bank01_sub_8382
//   $8385 bank01_sub_8385
//   $839A bank01_sub_839A
//   $83A4 bank01_sub_83A4
//   $83A6 bank01_sub_83A6
//   $83AB bank01_sub_83AB
//   $83B7 bank01_sub_83B7
//   $83C5 bank01_sub_83C5
//   $83CA bank01_sub_83CA
//   $83D0 bank01_api_02
//   $83D8 bank01_sub_83D8
//   $83E9 bank01_sub_83E9
//   $8407 bank01_sub_8407
//   $841C bank01_sub_841C
//   $8439 bank01_sub_8439
//   $843D bank01_sub_843D
//   $8444 bank01_sub_8444
//   $844A bank01_sub_844A
//   $8450 bank01_sub_8450
//   $8457 bank01_sub_8457
//   $8459 bank01_sub_8459
//   $845D bank01_sub_845D
//   $846C bank01_sub_846C
//   $8476 bank01_sub_8476
//   $847E bank01_sub_847E
//   $8485 bank01_sub_8485
//   $848D bank01_sub_848D
//   $86F8 bank01_sub_86F8
//   $870D bank01_sub_870D
//   $872C bank01_sub_872C
//   $873F bank01_sub_873F
//   $8742 bank01_sub_8742
//   $8744 bank01_sub_8744
//   $8764 bank01_sub_8764
//   $877B bank01_sub_877B
//   $8781 bank01_sub_8781
//   $8799 bank01_sub_8799
//   $879C bank01_sub_879C
//   $87A9 bank01_sub_87A9
//   $87AD bank01_sub_87AD
//   $87AF bank01_sub_87AF
//   $87BF bank01_sub_87BF
//   $87C2 bank01_sub_87C2
//   $87C7 bank01_sub_87C7
//   $87CE bank01_sub_87CE
//   $87D0 bank01_sub_87D0
//   $87D9 bank01_sub_87D9
//   $87E5 bank01_sub_87E5
//   $87E7 bank01_sub_87E7
//   $87EA bank01_sub_87EA
//   $87F8 bank01_sub_87F8
//   $8805 bank01_sub_8805
//   $8811 bank01_sub_8811
//   $8813 bank01_sub_8813
//   $881F bank01_sub_881F
//   $8827 bank01_sub_8827
//   $882B bank01_sub_882B
//   $8833 bank01_sub_8833
//   $8836 bank01_sub_8836
//   $8838 bank01_sub_8838
//   $883C bank01_sub_883C
//   $884B bank01_sub_884B
//   $884F bank01_sub_884F
//   $8862 bank01_sub_8862
//   $8872 bank01_sub_8872
//   $8877 bank01_sub_8877
//   $8886 bank01_sub_8886
//   $8893 bank01_sub_8893
//   $88A5 bank01_sub_88A5
//   $899A bank01_api_07
//   $899F bank01_sub_899F
//   $89C7 bank01_sub_89C7
//   $89D4 bank01_sub_89D4
//   $89F2 bank01_sub_89F2
//   $8A15 bank01_sub_8A15
//   $8A18 bank01_sub_8A18
//   $8A23 bank01_sub_8A23
//   $8AB7 bank01_sub_8AB7
//   $8AD5 bank01_sub_8AD5
//   $8AF2 bank01_sub_8AF2
//   $8AF4 bank01_sub_8AF4
//   $8AFF bank01_sub_8AFF
//   $8B04 bank01_sub_8B04
//   $8B16 bank01_sub_8B16
//   $8B18 bank01_sub_8B18
//   $8B22 bank01_sub_8B22
//   $8B27 bank01_sub_8B27
//   $8B32 bank01_sub_8B32
//   $8B38 bank01_sub_8B38
//   $8B3D bank01_sub_8B3D
//   $8B40 bank01_sub_8B40
//   $8B9E bank01_sub_8B9E
//   $8BA9 bank01_sub_8BA9
//   $8BCC bank01_sub_8BCC
//   $8BE9 bank01_sub_8BE9
//   $8BEB bank01_sub_8BEB
//   $8BEF bank01_sub_8BEF
//   $8BFA bank01_sub_8BFA
//   $8BFB bank01_sub_8BFB
//   $8C06 bank01_sub_8C06
//   $8E08 bank01_sub_8E08
//   $8E1C bank01_sub_8E1C
//   $8E2E bank01_sub_8E2E
//   $8E3D bank01_sub_8E3D
//   $8E50 bank01_sub_8E50
//   $8E58 bank01_sub_8E58
//   $8E64 bank01_sub_8E64
//   $8E67 bank01_sub_8E67
//   $8E7A bank01_sub_8E7A
//   $8E83 bank01_sub_8E83
//   $8E8D bank01_sub_8E8D
//   $8EA3 bank01_sub_8EA3
//   $8EAE bank01_sub_8EAE
//   $8ED6 bank01_sub_8ED6
//   $8EDD bank01_sub_8EDD
//   $8F02 bank01_sub_8F02
//   $8F07 bank01_sub_8F07
//   $8F12 bank01_sub_8F12
//   $8F15 bank01_sub_8F15
//   $8F16 bank01_sub_8F16
//   $8F1E bank01_sub_8F1E
//   $8F7C bank01_sub_8F7C
//   $8F7F bank01_sub_8F7F
//   $8F88 bank01_sub_8F88
//   $8F95 bank01_sub_8F95
//   $8FA7 bank01_sub_8FA7
//   $8FB2 bank01_sub_8FB2
//   $8FB3 bank01_sub_8FB3
//   $8FD3 bank01_sub_8FD3
//   $8FD6 bank01_sub_8FD6
//   $8FEA bank01_sub_8FEA
//   $8FF6 bank01_sub_8FF6
//   $8FFB bank01_sub_8FFB
//   $9001 bank01_sub_9001
//   $9004 bank01_sub_9004
//   $90DC bank01_sub_90DC
//   $90E6 bank01_sub_90E6
//   $90F2 bank01_sub_90F2
//   $90FD bank01_sub_90FD
//   $927A bank01_sub_927A
//   $9286 bank01_sub_9286
//   $9295 bank01_sub_9295
//   $92A8 bank01_sub_92A8
//   $92BB bank01_sub_92BB
//   $92BD bank01_sub_92BD
//   $92BE bank01_sub_92BE
//   $92CD bank01_sub_92CD
//   $92DD bank01_sub_92DD
//   $92EF bank01_sub_92EF
//   $92FE bank01_sub_92FE
//   $9304 bank01_sub_9304
//   $9317 bank01_sub_9317
//   $931F bank01_sub_931F
//   $9330 bank01_sub_9330
//   $9342 bank01_sub_9342
//   $9345 bank01_sub_9345
//   $934B bank01_sub_934B
//   $9353 bank01_sub_9353
//   $9359 bank01_sub_9359
//   $935F bank01_sub_935F
//   $9365 bank01_sub_9365
//   $9371 bank01_sub_9371
//   $937C bank01_sub_937C
//   $9380 bank01_sub_9380
//   $9393 bank01_sub_9393
//   $93A2 bank01_sub_93A2
//   $93AD bank01_sub_93AD
//   $93B2 bank01_sub_93B2
//   $93B7 bank01_sub_93B7
//   $93CD bank01_sub_93CD
//   $93D1 bank01_sub_93D1
//   $93D8 bank01_sub_93D8
//   $94BB bank01_sub_94BB
//   $94BE bank01_sub_94BE
//   $94C8 bank01_sub_94C8
//   $94D0 bank01_sub_94D0
//   $955E bank01_sub_955E
//   $956A bank01_sub_956A
//   $9705 bank01_sub_9705
//   $970C bank01_sub_970C
//   $9712 bank01_sub_9712
//   $9714 bank01_sub_9714
//   $971D bank01_sub_971D
//   $9728 bank01_sub_9728
//   $9732 bank01_sub_9732
//   $9759 bank01_sub_9759
//   $9768 bank01_sub_9768
//   $9775 bank01_sub_9775
//   $9798 bank01_sub_9798
//   $97B0 bank01_sub_97B0
//   $97C5 bank01_sub_97C5
//   $97C7 bank01_sub_97C7
//   $97D0 bank01_sub_97D0
//   $9838 bank01_sub_9838
//   $983D bank01_sub_983D
//   $9844 bank01_sub_9844
//   $984D bank01_sub_984D
//   $9858 bank01_sub_9858
//   $985B bank01_sub_985B
//   $9862 bank01_sub_9862
//   $9871 bank01_sub_9871
//   $9873 bank01_sub_9873
//   $989A bank01_sub_989A
//   $98B1 bank01_sub_98B1
//   $98C1 bank01_sub_98C1
//   $98F5 bank01_sub_98F5
//   $9900 bank01_sub_9900
//   $9908 bank01_sub_9908
//   $9912 bank01_sub_9912
//   $9934 bank01_sub_9934
//   $9935 bank01_sub_9935
//   $995E bank01_sub_995E
//   $9964 bank01_api_10
//   $9966 bank01_api_11
//   $996F bank01_sub_996F
//   $9970 bank01_sub_9970
//   $9981 bank01_sub_9981
//   $9985 bank01_sub_9985
//   $998F bank01_sub_998F
//   $9995 bank01_sub_9995
//   $999E bank01_sub_999E
//   $9A72 bank01_sub_9A72
//   $9A95 bank01_sub_9A95
//   $9AA1 bank01_sub_9AA1
//   $9AB2 bank01_sub_9AB2
//   $9AB6 bank01_sub_9AB6
//   $9AB8 bank01_sub_9AB8
//   $9AC6 bank01_sub_9AC6
//   $9ACB bank01_sub_9ACB
//   $9AEE bank01_sub_9AEE
//   $9AF0 bank01_sub_9AF0
//   $9B0B bank01_sub_9B0B
//   $9B88 bank01_sub_9B88
//   $9B9C bank01_sub_9B9C
//   $9BB7 bank01_sub_9BB7
//   $9BD3 bank01_sub_9BD3
//   $9BE2 bank01_sub_9BE2
//   $9BE3 bank01_api_03
//   $9BF0 bank01_sub_9BF0
//   $9BF7 bank01_sub_9BF7
//   $9BFC bank01_sub_9BFC
//   $9C1C bank01_sub_9C1C
//   $9F4E bank01_sub_9F4E
//   $9F50 bank01_sub_9F50
//   $9F51 bank01_sub_9F51
//   $9F76 bank01_sub_9F76

.pc = $8000

    .byte $09, $80, $0C, $80, $C3, $C2, $CD, $38, $30    // data $8000
bank01_cold_start:
    JMP bank01_api_00              // 4C 5B 80
bank01_warm_start:
    JMP bank01_api_01              // 4C B9 80
    .byte $4C, $D0, $83, $4C, $E3, $9B, $4C, $D2, $82, $4C, $B3, $82, $4C, $1D, $83, $4C    // data $800F
    .byte $9A, $89    // data $801F
bank01_api_08:
    JMP bank01_api_08              // 4C 21 80
    .byte $4C, $41, $83, $4C, $64, $99, $4C, $66, $99    // data $8024
bank01_sub_802D:
    LDA $0303              // AD 03 03
    CMP #$de               // C9 DE
    BNE bank01_sub_805A              // D0 26
    LDX #$01               // A2 01
    LDA $0302              // AD 02 03
    CMP #$8f               // C9 8F
    BEQ bank01_sub_805A              // F0 1D
    LDA #$80               // A9 80
    PHA                    // 48
    LDA #$0e               // A9 0E
    PHA                    // 48
    LDA $deee,X            // BD EE DE
    JMP $dee7              // 4C E7 DE
    .byte $20, $DC, $90, $A0, $1F, $B1, $BB, $99, $30, $02, $88, $10, $F8, $A9, $30, $85    // data $8049
    .byte $BB    // data $8059
bank01_sub_805A:
    RTS                    // 60
bank01_api_00:
    SEI                    // 78
    LDX #$fb               // A2 FB
    CLD                    // D8
    TXS                    // 9A
    JSR $fda3              // 20 A3 FD
    JSR bank01_sub_9F51              // 20 51 9F
    ORA #$80               // 09 80
    JSR $ff5b              // 20 5B FF
    JSR $e453              // 20 53 E4
    JSR bank01_api_06              // 20 1D 83
    JSR $e3bf              // 20 BF E3
    JSR $e422              // 20 22 E4
    JSR bank01_sub_83CA              // 20 CA 83
    JSR bank01_sub_9F51              // 20 51 9F
    PHA                    // 48
    .byte $80    // undocumented opcode
    LDA #$e3               // A9 E3
    PHA                    // 48
    LDA #$85               // A9 85
    STA $0313              // 8D 13 03
    PHA                    // 48
bank01_sub_8088:
    BIT $c5                // 24 C5
    BVC bank01_sub_8088              // 50 FC
    LDX #$9f               // A2 9F
    LDY #$80               // A0 80
    LDA #$00               // A9 00
    STA $030f              // 8D 0F 03
    STA $c6                // 85 C6
    JSR $dea9              // 20 A9 DE
    LDX #$95               // A2 95
    LDY #$99               // A0 99
    JSR $de9d              // 20 9D DE
    CMP #$01               // C9 01
    BEQ bank01_sub_80B3              // F0 0E
    LDX #$03               // A2 03
    LDY #$03               // A0 03
bank01_sub_80A9:
    LDA $8309,X            // BD 09 83
    STA $0330,Y            // 99 30 03
    DEX                    // CA
    DEY                    // 88
    BPL bank01_sub_80A9              // 10 F6
bank01_sub_80B3:
    JSR $de97              // 20 97 DE
    JMP $de26              // 4C 26 DE
bank01_api_01:
    JSR bank01_sub_802D              // 20 2D 80
    JSR $f6bc              // 20 BC F6
    JSR $f6ed              // 20 ED F6
    BEQ bank01_sub_80C7              // F0 03
    JMP $fe72              // 4C 72 FE
bank01_sub_80C7:
    LDX #$00               // A2 00
bank01_sub_80C9:
    DEX                    // CA
    NOP                    // EA
    BNE bank01_sub_80C9              // D0 FC
    STX $dd0c              // 8E 0C DD
    JSR bank01_sub_9F51              // 20 51 9F
    ASL $2080,X            // 1E 80 20
    ORA $2083,X            // 1D 83 20
    .byte $A3    // undocumented opcode
    SBC $1820,X            // FD 20 18
    SBC $6c                // E5 6C
    .byte $02    // undocumented opcode
    LDY #$20               // A0 20
    EOR ($9f),Y            // 51 9F
    .byte $3C    // undocumented opcode
    .byte $80    // undocumented opcode
    RTS                    // 60
    .byte $20, $55, $9F, $0F, $80, $4C, $00, $04, $20, $51, $9F, $87, $80, $68, $AA, $68    // data $80E7
    .byte $A8, $A9, $CD, $48, $A9, $FF, $48, $98, $48, $8A, $48, $4C, $26, $DE, $20, $55    // data $80F7
    .byte $9F, $12, $80, $4C, $00, $04, $20, $51, $9F, $69, $80, $4C, $26, $DE    // data $8107
bank01_sub_8115:
    PHA                    // 48
    LDA #$7f               // A9 7F
    STA $dc00              // 8D 00 DC
    LDA $dc01              // AD 01 DC
    CMP #$df               // C9 DF
    BNE bank01_sub_8162              // D0 40
    LDA #$bd               // A9 BD
    STA $dc00              // 8D 00 DC
    LDA $dc01              // AD 01 DC
    CMP #$ff               // C9 FF
    BNE bank01_sub_8162              // D0 34
    LDA #$fe               // A9 FE
    STA $dc00              // 8D 00 DC
    LDA $dc01              // AD 01 DC
    CMP #$ef               // C9 EF
    BEQ bank01_sub_8147              // F0 0D
    CMP #$df               // C9 DF
    BNE bank01_sub_8162              // D0 24
    JSR bank01_sub_9F4E              // 20 4E 9F
    .byte $63    // undocumented opcode
    .byte $80    // undocumented opcode
    LDA #$9a               // A9 9A
    BNE bank01_sub_814E              // D0 07
bank01_sub_8147:
    JSR bank01_sub_9F4E              // 20 4E 9F
    RTS                    // 60
    .byte $80, $A9, $9A    // data $814B
bank01_sub_814E:
    LDY #$04               // A0 04
    LDX #$04               // A2 04
    JSR bank01_sub_9F4E              // 20 4E 9F
    .byte $12    // undocumented opcode
    .byte $80    // undocumented opcode
    JSR bank01_sub_9F4E              // 20 4E 9F
    RTS                    // 60
    .byte $80, $68, $68, $68, $4C, $3F, $87    // data $815B
bank01_sub_8162:
    PLA                    // 68
    RTS                    // 60
    .byte $20, $EB, $B7, $86, $02, $A5, $14, $85, $FD, $A5, $15, $85, $FE, $20, $51, $9F    // data $8164
    .byte $39, $80, $60, $20, $DD, $81, $20, $FD, $AE, $20, $F8, $81, $86, $5F, $84, $60    // data $8174
    .byte $A9, $61, $85, $B9, $A5, $BA, $C9, $08, $B0, $03, $4C, $13, $F7, $A5, $B7, $D0    // data $8184
    .byte $03, $4C, $10, $F7, $20, $14, $89, $90, $03, $4C, $F9, $E0, $20, $53, $9F, $D5    // data $8194
    .byte $F3, $A5, $BA, $20, $B1, $FF, $A5, $B9, $20, $93, $FF, $A6, $C1, $A4, $C2, $20    // data $81A4
    .byte $BD, $FF, $A6, $2B, $A4, $2C, $20, $27, $82, $A0, $00, $20, $59, $DE, $20, $A8    // data $81B4
    .byte $FF, $E6, $BB, $D0, $02, $E6, $BC, $A5, $BB, $C5, $5F, $A5, $BC, $E5, $60, $90    // data $81C4
    .byte $EA, $A2, $00, $20, $27, $82, $4C, $42, $F6, $20, $DC, $90, $F0, $09, $20, $FD    // data $81D4
    .byte $AE, $20, $9E, $B7, $86, $BA, $60    // data $81E4
bank01_sub_81EB:
    LDX $ba                // A6 BA
    CPX #$08               // E0 08
    BCS bank01_sub_81F3              // B0 02
    LDX #$08               // A2 08
bank01_sub_81F3:
    STX $ba                // 86 BA
    JMP $0079              // 4C 79 00
    .byte $20, $51, $9F, $60, $80, $60, $20, $51, $9F, $5D, $80, $A9, $11, $8D, $02, $03    // data $81F8
    .byte $A9, $82, $8D, $03, $03, $38, $4C, $A9, $A4, $20, $51, $9F, $63, $80, $20, $6F    // data $8208
    .byte $A6, $4C, $7B, $E3    // data $8218
bank01_sub_821C:
    INC $0302              // EE 02 03
    JSR bank01_sub_9F51              // 20 51 9F
    ROR $80                // 66 80
    JMP $a66f              // 4C 6F A6
    .byte $8A, $20, $A8, $FF, $98, $4C, $A8, $FF, $20, $DD, $81, $20, $A6, $83, $A5, $2D    // data $8227
    .byte $38, $E9, $02, $AA, $A5, $2E, $E9, $00, $A8, $A9, $00, $85, $B9, $85, $0A, $4C    // data $8237
    .byte $75, $E1, $20, $54, $82, $20, $49, $80, $20, $CE, $84, $10, $2F, $A2, $04, $86    // data $8247
    .byte $C6, $BD, $BD, $88, $9D, $76, $02, $CA, $D0, $F7, $60, $20, $A6, $83, $20, $54    // data $8257
    .byte $82, $86, $0A, $86, $B9, $20, $49, $80, $20, $53, $9F, $6F, $E1, $A9, $00, $2C    // data $8267
    .byte $A9, $01, $A2, $01, $48, $20, $49, $80, $68, $20, $D2, $84, $D0, $0C, $A5, $0A    // data $8277
    .byte $F0, $03, $4C, $7A, $E1, $20, $53, $9F, $7A, $E1, $A9, $00, $85, $C6, $4C, $8D    // data $8287
    .byte $E1, $20, $49, $80, $4C, $59, $E1, $B0, $06, $20, $B6, $82, $20, $79, $00, $F0    // data $8297
    .byte $37, $C9, $50, $D0, $03, $4C, $1C, $9D, $C9, $23, $D0, $2C    // data $82A7
bank01_api_05:
    JSR $0073              // 20 73 00
bank01_sub_82B6:
    JSR $b79e              // 20 9E B7
    CPX #$08               // E0 08
    BCC bank01_sub_82C4              // 90 07
    CPX #$1f               // E0 1F
    BCS bank01_sub_82C4              // B0 03
    STX $ba                // 86 BA
    RTS                    // 60
bank01_sub_82C4:
    JSR $f713              // 20 13 F7
    JMP $e0f9              // 4C F9 E0
    .byte $20, $51, $9F, $36, $80, $4C, $F0, $82    // data $82CA
bank01_api_04:
    BCS bank01_sub_82DD              // B0 09
    JSR bank01_sub_82B6              // 20 B6 82
    LDA #$24               // A9 24
    STA ($7a),Y            // 91 7A
    INC $7a                // E6 7A
bank01_sub_82DD:
    DEC $7a                // C6 7A
    JSR bank01_sub_90DC              // 20 DC 90
    JSR bank01_sub_81EB              // 20 EB 81
    JSR bank01_sub_9F50              // 20 50 9F
    .byte $1B    // undocumented opcode
    .byte $80    // undocumented opcode
    RTS                    // 60
    .byte $20, $51, $9F, $12, $80, $90, $F8, $4C, $F9, $E0, $A2, $03, $2C, $A2, $07, $A0    // data $82EB
    .byte $03, $BD, $09, $83, $99, $30, $03, $CA, $88, $10, $F6, $4C, $8D, $E1, $67, $DE    // data $82FB
    .byte $6A, $DE, $6D, $DE, $6F, $DE, $A9, $ED, $A2, $F6, $78, $8D, $28, $03, $8E, $29    // data $830B
    .byte $03, $60    // data $831B
bank01_api_06:
    JSR $e453              // 20 53 E4
    LDY #$de               // A0 DE
    LDX #$8f               // A2 8F
    STX $0302              // 8E 02 03
    STY $0303              // 8C 03 03
    LDX #$ac               // A2 AC
    STX $030a              // 8E 0A 03
    STY $030b              // 8C 0B 03
    LDA $0317              // AD 17 03
    CMP #$fe               // C9 FE
    BNE bank01_api_09              // D0 08
    LDX #$cd               // A2 CD
    STX $0316              // 8E 16 03
    STY $0317              // 8C 17 03
bank01_api_09:
    LDY #$de               // A0 DE
    LDA $0331              // AD 31 03
    CMP #$f4               // C9 F4
    BNE bank01_sub_8352              // D0 08
    LDX #$6d               // A2 6D
    STX $0330              // 8E 30 03
    STY $0331              // 8C 31 03
bank01_sub_8352:
    LDA $0333              // AD 33 03
    CMP #$f5               // C9 F5
    BNE bank01_sub_8361              // D0 08
    LDX #$6f               // A2 6F
    STX $0332              // 8E 32 03
    STY $0333              // 8C 33 03
bank01_sub_8361:
    JMP $de97              // 4C 97 DE
bank01_sub_8364:
    LDA #$89               // A9 89
    STA $0320              // 8D 20 03
    LDA #$de               // A9 DE
    STA $0321              // 8D 21 03
    RTS                    // 60
bank01_sub_836F:
    PHP                    // 08
    PHA                    // 48
    LDA $0321              // AD 21 03
    CMP #$de               // C9 DE
    BNE bank01_sub_8382              // D0 0A
    LDA #$78               // A9 78
    STA $0326              // 8D 26 03
    LDA #$de               // A9 DE
    STA $0327              // 8D 27 03
bank01_sub_8382:
    PLA                    // 68
    PLP                    // 28
    RTS                    // 60
bank01_sub_8385:
    PHA                    // 48
    LDA #$50               // A9 50
    STA $0320              // 8D 20 03
    LDA #$f2               // A9 F2
    STA $0321              // 8D 21 03
    BNE bank01_sub_839A              // D0 08
    PHA                    // 48
    LDA $0321              // AD 21 03
    CMP #$de               // C9 DE
    BNE bank01_sub_83A4              // D0 0A
bank01_sub_839A:
    LDA #$ca               // A9 CA
    STA $0326              // 8D 26 03
    LDA #$f1               // A9 F1
    STA $0327              // 8D 27 03
bank01_sub_83A4:
    PLA                    // 68
    RTS                    // 60
bank01_sub_83A6:
    LDA #$0a               // A9 0A
    BIT $08a9              // 2C A9 08
bank01_sub_83AB:
    BIT $d011              // 2C 11 D0
    BPL bank01_sub_83AB              // 10 FB
    LDX #$de               // A2 DE
    LDY #$32               // A0 32
    JMP $dea9              // 4C A9 DE
bank01_sub_83B7:
    LDA #$04               // A9 04
    LDY #$ff               // A0 FF
    JSR $ffba              // 20 BA FF
    CPX #$04               // E0 04
    BNE bank01_sub_83C5              // D0 03
    JSR bank01_sub_8364              // 20 64 83
bank01_sub_83C5:
    LDA #$00               // A9 00
    JMP bank01_sub_995E              // 4C 5E 99
bank01_sub_83CA:
    JSR bank01_sub_9F51              // 20 51 9F
    ROL A                  // 2A
    .byte $80    // undocumented opcode
    RTS                    // 60
bank01_api_02:
    LDA $0302              // AD 02 03
    BNE bank01_sub_83D8              // D0 03
    JMP bank01_sub_821C              // 4C 1C 82
bank01_sub_83D8:
    JSR bank01_sub_802D              // 20 2D 80
    JSR bank01_api_06              // 20 1D 83
    JSR bank01_sub_83CA              // 20 CA 83
    LDA $0313              // AD 13 03
    BNE bank01_sub_83E9              // D0 03
    JMP bank01_sub_8E58              // 4C 58 8E
bank01_sub_83E9:
    JSR bank01_sub_83A6              // 20 A6 83
    JSR bank01_sub_8385              // 20 85 83
    CLI                    // 58
    LDA #$01               // A9 01
    STA $dc0e              // 8D 0E DC
    JSR bank01_sub_8886              // 20 86 88
    STX $7a                // 86 7A
    STY $7b                // 84 7B
    JSR $0073              // 20 73 00
    TAX                    // AA
    BNE bank01_sub_8407              // D0 05
    STX $0258              // 8E 58 02
    BEQ bank01_api_02              // F0 C9
bank01_sub_8407:
    LDX #$ff               // A2 FF
    STX $3a                // 86 3A
    BCS bank01_sub_8457              // B0 4A
    LDX $0258              // AE 58 02
    BNE bank01_sub_841C              // D0 0A
    TAX                    // AA
    LDA #$a4               // A9 A4
    PHA                    // 48
    LDA #$9b               // A9 9B
    PHA                    // 48
    JMP bank01_sub_8450              // 4C 50 84
bank01_sub_841C:
    JSR $a96b              // 20 6B A9
    BEQ bank01_sub_843D              // F0 1C
    LDY $14                // A4 14
    CPY $0255              // CC 55 02
    LDA $15                // A5 15
    TAX                    // AA
    SBC $0256              // ED 56 02
    BCC bank01_sub_8444              // 90 16
    TYA                    // 98
    CLC                    // 18
    ADC $0257              // 6D 57 02
    STA $0255              // 8D 55 02
    BCC bank01_sub_8439              // 90 01
    INX                    // E8
bank01_sub_8439:
    CPX #$fa               // E0 FA
    BCC bank01_sub_8444              // 90 07
bank01_sub_843D:
    LDA #$00               // A9 00
    STA $0258              // 8D 58 02
    BEQ bank01_sub_844A              // F0 06
bank01_sub_8444:
    STX $0256              // 8E 56 02
    JSR bank01_sub_86F8              // 20 F8 86
bank01_sub_844A:
    LDA #$a4               // A9 A4
    PHA                    // 48
    LDA #$9e               // A9 9E
    PHA                    // 48
bank01_sub_8450:
    JSR bank01_sub_8364              // 20 64 83
    TXA                    // 8A
    JMP $de26              // 4C 26 DE
bank01_sub_8457:
    STX $96                // 86 96
bank01_sub_8459:
    INC $96                // E6 96
    LDY #$ff               // A0 FF
bank01_sub_845D:
    INY                    // C8
    INX                    // E8
    LDA $8507,X            // BD 07 85
    BNE bank01_sub_846C              // D0 08
    LDA #$a4               // A9 A4
    PHA                    // 48
    LDA #$95               // A9 95
    PHA                    // 48
    BNE bank01_sub_8450              // D0 E4
bank01_sub_846C:
    PHP                    // 08
    AND #$7f               // 29 7F
    CMP ($7a),Y            // D1 7A
    BEQ bank01_sub_847E              // F0 0B
    PLP                    // 28
    BMI bank01_sub_8459              // 30 E3
bank01_sub_8476:
    INX                    // E8
    LDA $8507,X            // BD 07 85
    BPL bank01_sub_8476              // 10 FA
    BMI bank01_sub_8459              // 30 DB
bank01_sub_847E:
    PLP                    // 28
    BMI bank01_sub_848D              // 30 0C
    CPY #$02               // C0 02
    BNE bank01_sub_845D              // D0 D8
bank01_sub_8485:
    INY                    // C8
    LDA ($7a),Y            // B1 7A
    CMP #$41               // C9 41
    BCS bank01_sub_8485              // B0 F9
    DEY                    // 88
bank01_sub_848D:
    TYA                    // 98
    CLC                    // 18
    ADC $7a                // 65 7A
    STA $7a                // 85 7A
    JSR $83a9              // 20 A9 83
    LDY #$00               // A0 00
    STY $b9                // 84 B9
    LDA $96                // A5 96
    ASL A                  // 0A
    TAX                    // AA
    LDA #$e3               // A9 E3
    PHA                    // 48
    LDA #$7a               // A9 7A
    PHA                    // 48
    LDA $8573,X            // BD 73 85
    PHA                    // 48
    LDA $8572,X            // BD 72 85
    PHA                    // 48
    JMP $0073              // 4C 73 00
    .byte $20, $DD, $81, $20, $CE, $84, $D0, $03, $4C, $7A, $E1, $A5, $C4, $48, $A5, $C3    // data $84AF
    .byte $48, $08, $48, $AD, $F3, $DE, $4C, $DE, $DE, $20, $51, $9F, $27, $80, $60, $A2    // data $84BF
    .byte $01, $A9, $00, $86, $B9, $85, $0A, $A6, $2B, $A4, $2C, $20, $4F, $9F, $D5, $FF    // data $84CF
    .byte $90, $03, $4C, $F9, $E0, $A5, $90, $29, $BF, $F0, $03, $4C, $7A, $E1, $AD, $30    // data $84DF
    .byte $03, $C9, $67, $F0, $12, $A5, $C3, $C5, $2B, $D0, $06, $A5, $C4, $C5, $2C, $F0    // data $84EF
    .byte $06, $A9, $00, $85, $C6, $A9, $01, $60, $AF, $A4, $A5, $DE, $DC, $C0, $A6, $4F    // data $84FF
    .byte $4C, $C4, $44, $45, $4C, $45, $54, $C5, $4C, $49, $4E, $45, $53, $41, $56, $C5    // data $850F
    .byte $4D, $45, $52, $47, $C5, $41, $55, $54, $CF, $4D, $4F, $4E, $49, $54, $4F, $D2    // data $851F
    .byte $41, $50, $50, $45, $4E, $C4, $43, $4F, $50, $D9, $42, $4F, $4F, $D4, $5A, $41    // data $852F
    .byte $D0, $42, $41, $43, $4B, $55, $D0, $50, $4C, $49, $53, $54, $A2, $53, $4C, $49    // data $853F
    .byte $53, $54, $A2, $4F, $CE, $4F, $46, $C6, $46, $49, $4E, $C4, $52, $45, $4E, $55    // data $854F
    .byte $CD, $49, $4E, $46, $CF, $54, $41, $53, $D3, $53, $53, $47, $45, $D4, $54, $4F    // data $855F
    .byte $4F, $CC, $00, $73, $82, $D1, $82, $48, $82, $61, $82, $1C, $9D, $9D, $82, $76    // data $856F
    .byte $82, $1E, $82, $FD, $81, $76, $81, $17, $86, $D4, $86, $97, $89, $2E, $82, $EA    // data $857F
    .byte $82, $AE, $84, $C7, $84, $C9, $82, $AC, $85, $A9, $85, $F7, $82, $F4, $82, $E0    // data $858F
    .byte $80, $63, $81, $0C, $81, $E6, $80, $EE, $80, $04, $81, $A9, $03, $2C, $A9, $04    // data $859F
    .byte $85, $BD, $20, $DD, $81, $20, $DD, $88, $20, $CC, $FF, $A6, $BD, $20, $B7, $83    // data $85AF
    .byte $A9, $C9, $A0, $85, $8D, $00, $03, $8C, $01, $03, $AD, $01, $DC, $10, $27, $29    // data $85BF
    .byte $10, $F0, $F7, $20, $9A, $86, $B0, $1E, $20, $CC, $FF, $A2, $04, $20, $EA, $9B    // data $85CF
    .byte $A0, $FF, $84, $14, $84, $15, $C8, $8C, $FD, $01, $C8, $84, $0F, $84, $60, $A9    // data $85DF
    .byte $FC, $85, $5F, $4C, $D4, $A6, $A2, $04, $20, $EA, $9B, $20, $A3, $8E, $A9, $04    // data $85EF
    .byte $20, $C3, $FF, $20, $1D, $83, $A9, $03, $20, $C3, $FF, $A2, $01, $8E, $FC, $01    // data $85FF
    .byte $8E, $FD, $01, $CA, $86, $C6, $4C, $CC, $FF, $20, $DD, $81, $20, $79, $00, $AA    // data $860F
    .byte $F0, $06, $20, $FD, $AE, $20, $EB, $B7, $86, $96, $20, $DD, $88, $A5, $14, $85    // data $861F
    .byte $C3, $A5, $15, $85, $C4, $20, $CC, $FF, $20, $85, $99, $4D, $45, $52, $47, $49    // data $862F
    .byte $4E, $47, $00, $A2, $05, $BD, $CF, $86, $9D, $50, $01, $CA, $10, $F7, $A9, $50    // data $863F
    .byte $A0, $01, $8D, $02, $03, $8C, $03, $03, $8D, $00, $03, $8C, $01, $03, $2C, $01    // data $864F
    .byte $DC, $10, $32, $E6, $98, $20, $9A, $86, $B0, $2B, $AD, $FD, $01, $F0, $26, $AD    // data $865F
    .byte $FE, $01, $AE, $FF, $01, $A4, $96, $F0, $0F, $A5, $C3, $A8, $A6, $C4, $18, $65    // data $866F
    .byte $96, $85, $C3, $90, $02, $E6, $C4, $98, $85, $14, $86, $15, $8D, $FE, $01, $8E    // data $867F
    .byte $FF, $01, $20, $A4, $A4, $20, $02, $86, $4C, $7B, $E3, $20, $CC, $FF, $A2, $03    // data $868F
    .byte $20, $C6, $FF, $A0, $00, $20, $CF, $FF, $99, $FC, $01, $A6, $90, $D0, $1C, $C0    // data $869F
    .byte $04, $90, $11, $18, $AA, $F0, $15, $C9, $12, $F0, $09, $C9, $20, $B0, $05, $A9    // data $86AF
    .byte $20, $99, $FC, $01, $C0, $5C, $B0, $DD, $C8, $D0, $DA, $38, $C8, $84, $0B, $60    // data $86BF
    .byte $20, $97, $DE, $4C, $5D, $86, $F0, $16, $20, $EB, $B7, $8A, $D0, $03, $4C, $08    // data $86CF
    .byte $AF, $A5, $14, $8D, $55, $02, $A5, $15, $8D, $56, $02, $8E, $57, $02, $8E, $58    // data $86DF
    .byte $02, $20, $F8, $86, $68, $68, $4C, $80, $A4    // data $86EF
bank01_sub_86F8:
    LDA $0256              // AD 56 02
    STA $62                // 85 62
    LDA $0255              // AD 55 02
    STA $63                // 85 63
    LDX #$90               // A2 90
    SEC                    // 38
    JSR $bc49              // 20 49 BC
    JSR $bddd              // 20 DD BD
    LDY #$ff               // A0 FF
bank01_sub_870D:
    INY                    // C8
    LDA $0101,Y            // B9 01 01
    STA $0277,Y            // 99 77 02
    BNE bank01_sub_870D              // D0 F7
    INY                    // C8
    STA $0277,Y            // 99 77 02
    STY $c6                // 84 C6
    RTS                    // 60
    .byte $A9, $0A, $8D, $00, $DE, $58, $A5, $C6, $85, $CC, $F0, $FA, $4C, $97, $DE    // data $871D
bank01_sub_872C:
    LDA #$00               // A9 00
    STA $ca                // 85 CA
    LDA $d6                // A5 D6
    STA $c9                // 85 C9
    TYA                    // 98
    PHA                    // 48
    TXA                    // 8A
    PHA                    // 48
    LDA $d0                // A5 D0
    BEQ bank01_sub_8742              // F0 06
    JMP $e63a              // 4C 3A E6
bank01_sub_873F:
    JSR $e716              // 20 16 E7
bank01_sub_8742:
    LDX #$0f               // A2 0F
bank01_sub_8744:
    LDA $871d,X            // BD 1D 87
    STA $0210,X            // 9D 10 02
    DEX                    // CA
    BPL bank01_sub_8744              // 10 F7
    JSR $0210              // 20 10 02
    STA $0292              // 8D 92 02
    SEI                    // 78
    LDA $cf                // A5 CF
    BEQ bank01_sub_8764              // F0 0C
    LDA $ce                // A5 CE
    LDX $0287              // AE 87 02
    LDY #$00               // A0 00
    STY $cf                // 84 CF
    JSR $ea13              // 20 13 EA
bank01_sub_8764:
    JSR $e5b4              // 20 B4 E5
    JSR bank01_sub_8115              // 20 15 81
    CMP #$8a               // C9 8A
    BNE bank01_sub_879C              // D0 2E
    LDA $f9a0              // AD A0 F9
    CMP #$e6               // C9 E6
    BNE bank01_sub_8781              // D0 0C
    JSR bank01_sub_877B              // 20 7B 87
    JMP bank01_sub_8742              // 4C 42 87
bank01_sub_877B:
    LDA #$00               // A9 00
    PHA                    // 48
    JMP $f9a0              // 4C A0 F9
bank01_sub_8781:
    JSR bank01_sub_9F50              // 20 50 9F
    .byte $33    // undocumented opcode
    .byte $80    // undocumented opcode
    BMI bank01_sub_8799              // 30 11
    LDA #$40               // A9 40
    JSR $e716              // 20 16 E7
    LDA #$23               // A9 23
    JSR $e716              // 20 16 E7
    LDA #$00               // A9 00
    LDX $ba                // A6 BA
    JSR $bdcd              // 20 CD BD
bank01_sub_8799:
    JMP bank01_sub_87C7              // 4C C7 87
bank01_sub_879C:
    CMP #$8b               // C9 8B
    BNE bank01_sub_87A9              // D0 09
    LDA #$e3               // A9 E3
    PHA                    // 48
    LDA #$7a               // A9 7A
    PHA                    // 48
    JMP $ded3              // 4C D3 DE
bank01_sub_87A9:
    BIT $22                // 24 22
    BPL bank01_sub_8813              // 10 66
bank01_sub_87AD:
    LDX #$07               // A2 07
bank01_sub_87AF:
    CMP $88a7,X            // DD A7 88
    BEQ bank01_sub_87EA              // F0 36
    DEX                    // CA
    BNE bank01_sub_87AF              // D0 F8
    CMP #$0d               // C9 0D
    BEQ bank01_sub_87C7              // F0 0C
    CMP #$8d               // C9 8D
    BEQ bank01_sub_87C2              // F0 03
bank01_sub_87BF:
    JMP bank01_sub_873F              // 4C 3F 87
bank01_sub_87C2:
    BIT $028d              // 2C 8D 02
    BNE bank01_sub_87BF              // D0 F8
bank01_sub_87C7:
    LDA $d3                // A5 D3
    STA $8e                // 85 8E
    JMP $e602              // 4C 02 E6
bank01_sub_87CE:
    LDY #$ff               // A0 FF
bank01_sub_87D0:
    INY                    // C8
    LDA $88af,Y            // B9 AF 88
    BNE bank01_sub_87D0              // D0 FA
    DEX                    // CA
    BNE bank01_sub_87D0              // D0 F7
bank01_sub_87D9:
    INX                    // E8
    INY                    // C8
    LDA $88af,Y            // B9 AF 88
    BEQ bank01_sub_87E5              // F0 05
    STA $0276,X            // 9D 76 02
    BNE bank01_sub_87D9              // D0 F4
bank01_sub_87E5:
    STX $c6                // 86 C6
bank01_sub_87E7:
    JMP bank01_sub_8742              // 4C 42 87
bank01_sub_87EA:
    CPX #$03               // E0 03
    BCS bank01_sub_87CE              // B0 E0
    LDY #$05               // A0 05
    LDA ($d1),Y            // B1 D1
    CMP #$22               // C9 22
    BNE bank01_sub_87CE              // D0 D8
    LDA #$20               // A9 20
bank01_sub_87F8:
    DEY                    // 88
    STA ($d1),Y            // 91 D1
    BNE bank01_sub_87F8              // D0 FB
    LDA #$25               // A9 25
    CPX #$01               // E0 01
    BEQ bank01_sub_8805              // F0 02
    LDA #$2f               // A9 2F
bank01_sub_8805:
    STA ($d1),Y            // 91 D1
    STA $ce                // 85 CE
    STY $d3                // 84 D3
    JSR bank01_sub_8877              // 20 77 88
    JMP bank01_sub_8836              // 4C 36 88
bank01_sub_8811:
    BNE bank01_sub_87AD              // D0 9A
bank01_sub_8813:
    LDX $d6                // A6 D6
    BNE bank01_sub_881F              // D0 08
    CMP #$91               // C9 91
    BEQ bank01_sub_8827              // F0 0C
    CMP #$13               // C9 13
    BEQ bank01_sub_8827              // F0 08
bank01_sub_881F:
    CPX #$18               // E0 18
    BNE bank01_sub_882B              // D0 08
    CMP #$11               // C9 11
    BNE bank01_sub_882B              // D0 04
bank01_sub_8827:
    STX $8f                // 86 8F
    BEQ bank01_sub_8833              // F0 08
bank01_sub_882B:
    CMP #$87               // C9 87
    BEQ bank01_sub_883C              // F0 0D
    CMP #$88               // C9 88
    BNE bank01_sub_8811              // D0 DE
bank01_sub_8833:
    JSR bank01_sub_884B              // 20 4B 88
bank01_sub_8836:
    LDX #$01               // A2 01
bank01_sub_8838:
    STX $c6                // 86 C6
    BNE bank01_sub_87E7              // D0 AB
bank01_sub_883C:
    JSR bank01_sub_884B              // 20 4B 88
    LDA #$87               // A9 87
    STA $0278              // 8D 78 02
    STA $0279              // 8D 79 02
    LDX #$03               // A2 03
    BNE bank01_sub_8838              // D0 ED
bank01_sub_884B:
    LDY #$01               // A0 01
    LDX #$02               // A2 02
bank01_sub_884F:
    LDA $887d,X            // BD 7D 88
    CMP ($d1),Y            // D1 D1
    BEQ bank01_sub_8862              // F0 0C
    DEX                    // CA
    BPL bank01_sub_884F              // 10 F6
    LDX $0166              // AE 66 01
    CPX #$02               // E0 02
    BCC bank01_sub_8862              // 90 02
    LDX #$02               // A2 02
bank01_sub_8862:
    LDA $8f                // A5 8F
    BMI bank01_sub_8872              // 30 0C
    LDA $8883,X            // BD 83 88
    STA $a8                // 85 A8
    LDA $887d,X            // BD 7D 88
    STA $aa                // 85 AA
    BNE bank01_sub_8877              // D0 05
bank01_sub_8872:
    LDA $8880,X            // BD 80 88
    STA ($d1),Y            // 91 D1
bank01_sub_8877:
    LDA #$0d               // A9 0D
    STA $0277              // 8D 77 02
    RTS                    // 60
    .byte $2C, $3A, $3E, $09, $0D, $04, $20, $08, $00    // data $887D
bank01_sub_8886:
    TSX                    // BA
    LDA #$8a               // A9 8A
    CMP $0102,X            // DD 02 01
    ROR $22                // 66 22
    LDX #$ff               // A2 FF
    STX $8f                // 86 8F
    INX                    // E8
bank01_sub_8893:
    JSR bank01_sub_872C              // 20 2C 87
    CMP #$0d               // C9 0D
    BEQ bank01_sub_88A5              // F0 0B
    STA $0200,X            // 9D 00 02
    INX                    // E8
    CPX #$54               // E0 54
    BCC bank01_sub_8893              // 90 F1
    JMP $a571              // 4C 71 A5
bank01_sub_88A5:
    JMP $aaca              // 4C CA AA
    .byte $85, $89, $87, $88, $86, $8C, $83, $00, $25, $30, $3A, $2A, $00, $2F, $30, $3A    // data $88A8
    .byte $2A, $00, $4C, $C9, $0D, $00, $52, $D5, $3A, $0D, $00, $24, $3A, $2A, $0D, $00    // data $88B8
    .byte $4D, $4F, $4E, $0D, $00, $25, $30, $3A, $2A, $0D, $00, $A5, $BA, $20, $B4, $FF    // data $88C8
    .byte $A5, $B9, $4C, $96, $FF, $A9, $08, $A4, $B7, $F0, $28, $20, $EB, $81, $A9, $03    // data $88D8
    .byte $A0, $60, $20, $BA, $FF, $20, $E7, $FF, $20, $14, $89, $B0, $16, $20, $53, $9F    // data $88E8
    .byte $C0, $FF, $20, $D3, $88, $20, $A5, $FF, $85, $AE, $A5, $90, $4A, $4A, $90, $06    // data $88F8
    .byte $20, $04, $F7, $4C, $F9, $E0, $20, $A5, $FF, $85, $AF, $60, $20, $B0, $97, $A9    // data $8908
    .byte $49, $20, $A8, $FF, $20, $AE, $FF, $A5, $90, $10, $F0, $4C, $07, $F7, $08, $A2    // data $8918
    .byte $9F, $A0, $80, $20, $9D, $DE, $C9, $AA, $D0, $1A, $C8, $20, $9D, $DE, $C9, $55    // data $8928
    .byte $D0, $12, $A0, $83, $20, $9D, $DE, $C9, $08, $90, $05, $C9, $1E, $90, $01, $2C    // data $8938
    .byte $A9, $08, $85, $BA, $A5, $BA, $C9, $08, $B0, $07, $20, $11, $83, $28, $4C, $60    // data $8948
    .byte $DE, $20, $92, $83, $28, $A5, $93, $90, $2F, $20, $50, $9F, $0F, $80, $08, $A5    // data $8958
    .byte $90, $C9, $FF, $F0, $09, $28, $20, $6F, $83, $A5, $9E, $4C, $26, $DE, $28, $A0    // data $8968
    .byte $00, $B1, $BB, $C9, $24, $D0, $03, $4C, $15, $80, $20, $AB, $FF, $20, $42, $F6    // data $8978
    .byte $A9, $F4, $48, $A9, $A6, $48, $D0, $DE, $20, $50, $9F, $12, $80, $4C, $6E, $89    // data $8988
    .byte $A2, $00    // data $8998
bank01_api_07:
    CPX #$00               // E0 00
    BEQ bank01_sub_899F              // F0 01
    CLC                    // 18
bank01_sub_899F:
    ROR $0168              // 6E 68 01
    STX $0163              // 8E 63 01
    STX $0167              // 8E 67 01
    JSR bank01_sub_89F2              // 20 F2 89
    TXA                    // 8A
    BNE bank01_sub_89C7              // D0 19
    STX $015a              // 8E 5A 01
    LDA #$e3               // A9 E3
    STA $0158              // 8D 58 01
    LDA #$7b               // A9 7B
    STA $0159              // 8D 59 01
    LDA #$fb               // A9 FB
    STA $015e              // 8D 5E 01
    LDA #$37               // A9 37
    STA $015f              // 8D 5F 01
    BNE bank01_sub_89D4              // D0 0D
bank01_sub_89C7:
    JSR bank01_api_06              // 20 1D 83
    JSR bank01_sub_9712              // 20 12 97
    CLC                    // 18
    JSR bank01_sub_8A15              // 20 15 8A
    JSR bank01_sub_9A72              // 20 72 9A
bank01_sub_89D4:
    JMP bank01_sub_8E50              // 4C 50 8E
    .byte $38, $08, $A9, $4C, $85, $54, $8D, $13, $03, $2C, $68, $01, $30, $0A, $38, $20    // data $89D7
    .byte $15, $8A, $28, $20, $4E, $9F, $2A, $80, $4C, $7B, $E3    // data $89E7
bank01_sub_89F2:
    LDA #$34               // A9 34
    STA $0160              // 8D 60 01
    LDA #$2e               // A9 2E
    STA $0165              // 8D 65 01
    LDA #$80               // A9 80
    STA $0161              // 8D 61 01
    STA $0162              // 8D 62 01
    STA $9d                // 85 9D
    ASL A                  // 0A
    STA $0313              // 8D 13 03
    LDA #$cd               // A9 CD
    LDY #$de               // A0 DE
    STA $0316              // 8D 16 03
    STY $0317              // 8C 17 03
    RTS                    // 60
bank01_sub_8A15:
    SEI                    // 78
    LDX #$07               // A2 07
bank01_sub_8A18:
    LDA $08e0,X            // BD E0 08
    BCC bank01_sub_8A23              // 90 06
    LDA $0158,X            // BD 58 01
    STA $08e0,X            // 9D E0 08
bank01_sub_8A23:
    STA $0158,X            // 9D 58 01
    DEX                    // CA
    BPL bank01_sub_8A18              // 10 EF
    STA $ad                // 85 AD
    LDA $0159              // AD 59 01
    STA $ac                // 85 AC
    RTS                    // 60
    .byte $A9, $08, $2C, $A9, $20, $20, $5D, $8A, $AD, $8D, $02, $F0, $F2, $20, $A3, $8E    // data $8A31
    .byte $20, $BB, $94, $20, $B7, $8A, $A0, $07, $A9, $1E, $C5, $A8, $90, $06, $C5, $8E    // data $8A41
    .byte $B0, $02, $A0, $1F, $A6, $D6, $20, $EB, $8B, $4C, $6C, $8E, $85, $A8, $20, $1E    // data $8A51
    .byte $8F, $A0, $01, $B1, $D1, $85, $97, $10, $15, $20, $EF, $8B, $A0, $26, $B1, $D1    // data $8A61
    .byte $20, $68, $97, $88, $C0, $06, $D0, $F6, $20, $FB, $8B, $4C, $B7, $8A, $A6, $C8    // data $8A71
    .byte $E0, $27, $B0, $0D, $86, $D3, $A9, $27, $85, $C8, $85, $D0, $85, $13, $20, $93    // data $8A81
    .byte $88, $A0, $00, $A5, $AA, $C9, $2C, $F0, $0E, $A5, $8E, $C9, $20, $B9, $1F, $02    // data $8A91
    .byte $B0, $08, $20, $16, $8F, $90, $07, $B9, $07, $02, $C9, $2E, $F0, $03, $20, $68    // data $8AA1
    .byte $97, $C8, $C4, $A8, $90, $DD    // data $8AB1
bank01_sub_8AB7:
    LDX $d6                // A6 D6
    JSR bank01_sub_8BE9              // 20 E9 8B
    LDY $aa                // A4 AA
    JSR bank01_sub_8F7F              // 20 7F 8F
    LDY #$ad               // A0 AD
    JSR bank01_sub_8B40              // 20 40 8B
    LDA $aa                // A5 AA
    CMP #$2c               // C9 2C
    BNE bank01_sub_8AF2              // D0 26
    LDA $97                // A5 97
    BPL bank01_sub_8AFF              // 10 2F
    JSR bank01_sub_8BEF              // 20 EF 8B
    LDY #$26               // A0 26
bank01_sub_8AD5:
    JSR bank01_sub_9728              // 20 28 97
    STA ($d1),Y            // 91 D1
    JSR $ea24              // 20 24 EA
    LDA $0286              // AD 86 02
    STA ($f3),Y            // 91 F3
    DEY                    // 88
    CPY #$06               // C0 06
    BNE bank01_sub_8AD5              // D0 EE
    JSR bank01_sub_8BFB              // 20 FB 8B
    LDY #$01               // A0 01
    LDA #$ac               // A9 AC
    STA ($d1),Y            // 91 D1
    DEY                    // 88
    RTS                    // 60
bank01_sub_8AF2:
    LDY #$00               // A0 00
bank01_sub_8AF4:
    JSR bank01_sub_9728              // 20 28 97
    JSR bank01_sub_8B22              // 20 22 8B
    INY                    // C8
    CPY $a8                // C4 A8
    BNE bank01_sub_8AF4              // D0 F5
bank01_sub_8AFF:
    JSR $8ea9              // 20 A9 8E
    LDY #$00               // A0 00
bank01_sub_8B04:
    JSR bank01_sub_9728              // 20 28 97
    CMP #$de               // C9 DE
    BEQ bank01_sub_8B16              // F0 0B
    TAX                    // AA
    AND #$7f               // 29 7F
    CMP #$60               // C9 60
    BCS bank01_sub_8B16              // B0 04
    CMP #$20               // C9 20
    BCS bank01_sub_8B18              // B0 02
bank01_sub_8B16:
    LDX #$2e               // A2 2E
bank01_sub_8B18:
    TXA                    // 8A
    JSR $ffd2              // 20 D2 FF
    INY                    // C8
    CPY $a8                // C4 A8
    BNE bank01_sub_8B04              // D0 E3
    RTS                    // 60
bank01_sub_8B22:
    PHA                    // 48
    JSR $8ea9              // 20 A9 8E
    PLA                    // 68
bank01_sub_8B27:
    PHA                    // 48
    LSR A                  // 4A
    LSR A                  // 4A
    LSR A                  // 4A
    LSR A                  // 4A
    JSR bank01_sub_8B32              // 20 32 8B
    PLA                    // 68
    AND #$0f               // 29 0F
bank01_sub_8B32:
    CMP #$0a               // C9 0A
    BCC bank01_sub_8B38              // 90 02
    ADC #$06               // 69 06
bank01_sub_8B38:
    ADC #$30               // 69 30
    JMP $ffd2              // 4C D2 FF
bank01_sub_8B3D:
    JSR $8ea9              // 20 A9 8E
bank01_sub_8B40:
    LDA $0000,Y            // B9 00 00
    JSR bank01_sub_8B27              // 20 27 8B
    DEY                    // 88
    LDA $0000,Y            // B9 00 00
    JMP bank01_sub_8B27              // 4C 27 8B
    .byte $C9, $4F, $D0, $03, $4C, $FC, $99, $A2, $FF, $C9, $2A, $D0, $03, $20, $73, $00    // data $8B4D
    .byte $86, $97, $A2, $00, $A0, $2C, $D0, $04, $A2, $01, $A0, $3A, $8E, $66, $01, $84    // data $8B5D
    .byte $AA, $A6, $9A, $A9, $08, $E0, $04, $90, $01, $0A, $C0, $3A, $F0, $02, $0A, $0A    // data $8B6D
    .byte $85, $A8, $20, $3B, $8F, $84, $8D, $20, $A3, $8E, $A6, $D6, $86, $8F, $20, $B7    // data $8B7D
    .byte $8A, $20, $41, $91, $F0, $05, $20, $9E, $8B, $F0, $F6, $20, $BB, $94, $90, $E7    // data $8B8D
    .byte $60    // data $8B9D
bank01_sub_8B9E:
    LDA $ac                // A5 AC
    SEC                    // 38
    SBC $a8                // E5 A8
    STA $ac                // 85 AC
    BCS bank01_sub_8BA9              // B0 02
    DEC $ad                // C6 AD
bank01_sub_8BA9:
    LDY #$01               // A0 01
    LDA ($d1),Y            // B1 D1
    STA $97                // 85 97
    JSR bank01_sub_8BCC              // 20 CC 8B
    JMP bank01_sub_8AB7              // 4C B7 8A
    .byte $AD, $65, $01, $A0, $00, $91, $D1, $A2, $19, $CA, $20, $E9, $8B, $B1, $D1, $CD    // data $8BB5
    .byte $65, $01, $D0, $F5, $4C, $58, $8E    // data $8BC5
bank01_sub_8BCC:
    LDA $a5                // A5 A5
    PHA                    // 48
    LDA $a6                // A5 A6
    PHA                    // 48
    LDA $a7                // A5 A7
    PHA                    // 48
    LDA $a8                // A5 A8
    PHA                    // 48
    JSR bank01_sub_9F50              // 20 50 9F
    ASL $6880,X            // 1E 80 68
    STA $a8                // 85 A8
    PLA                    // 68
    STA $a7                // 85 A7
    PLA                    // 68
    STA $a6                // 85 A6
    PLA                    // 68
    STA $a5                // 85 A5
bank01_sub_8BE9:
    LDY #$00               // A0 00
bank01_sub_8BEB:
    CLC                    // 18
    JMP $fff0              // 4C F0 FF
bank01_sub_8BEF:
    LDA $ac                // A5 AC
    SEC                    // 38
    SBC #$07               // E9 07
    STA $ac                // 85 AC
    BCS bank01_sub_8BFA              // B0 02
    DEC $ad                // C6 AD
bank01_sub_8BFA:
    RTS                    // 60
bank01_sub_8BFB:
    LDA $ac                // A5 AC
    CLC                    // 18
    ADC #$07               // 69 07
    STA $ac                // 85 AC
    BCC bank01_sub_8C06              // 90 02
    INC $ad                // E6 AD
bank01_sub_8C06:
    RTS                    // 60
    .byte $20, $16, $8F, $8D, $58, $01, $20, $16, $8F, $8D, $59, $01, $A2, $00, $20, $16    // data $8C07
    .byte $8F, $9D, $5B, $01, $E8, $E0, $05, $90, $F5, $A0, $00, $B1, $7A, $C9, $31, $2E    // data $8C17
    .byte $5A, $01, $C8, $C0, $08, $D0, $F4, $60, $20, $A3, $8E, $A9, $A4, $48, $A9, $8C    // data $8C27
    .byte $48, $A9, $4C, $85, $54, $20, $A6, $83, $20, $79, $00, $4C, $26, $DE, $20, $C2    // data $8C37
    .byte $90, $98, $F0, $17, $A9, $60, $91, $BB, $A0, $00, $A2, $00, $20, $28, $97, $18    // data $8C47
    .byte $20, $63, $8C, $20, $68, $97, $20, $73, $8F, $90, $F1, $60, $6C, $BB, $00, $20    // data $8C57
    .byte $C2, $90, $A4, $B7, $F0, $17, $A2, $00, $8A, $A8, $B1, $BB, $A0, $00, $20, $68    // data $8C67
    .byte $97, $E8, $E4, $B7, $D0, $02, $A2, $00, $20, $73, $8F, $90, $EB, $60, $20, $3B    // data $8C77
    .byte $8F, $20, $24, $8F, $20, $A3, $8E, $A0, $00, $20, $23, $97, $85, $C3, $A9, $C1    // data $8C87
    .byte $20, $25, $97, $C5, $C3, $F0, $3C, $AA, $A9, $05, $20, $16, $E7, $A0, $AD, $20    // data $8C97
    .byte $3D, $8B, $A9, $9B, $20, $D2, $FF, $A0, $C2, $20, $3D, $8B, $A0, $00, $A9, $05    // data $8CA7
    .byte $20, $16, $E7, $A5, $C3, $20, $22, $8B, $A9, $9B, $20, $16, $E7, $8A, $20, $22    // data $8CB7
    .byte $8B, $A9, $05, $20, $16, $E7, $A2, $03, $A9, $20, $20, $16, $E7, $CA, $10, $FA    // data $8CC7
    .byte $20, $2B, $91, $20, $6D, $8F, $90, $AF, $60, $20, $3B, $8F, $20, $07, $90, $A4    // data $8CD7
    .byte $B7, $F0, $20, $20, $A3, $8E, $A0, $00, $2C, $01, $DC, $10, $16, $20, $28, $97    // data $8CE7
    .byte $D1, $BB, $D0, $0A, $C8, $C4, $B7, $D0, $F4, $A0, $AD, $20, $3D, $8B, $20, $73    // data $8CF7
    .byte $8F, $90, $E3, $60, $20, $1E, $8F, $20, $21, $8F, $20, $65, $8F, $20, $24, $8F    // data $8D07
    .byte $38, $A5, $B0, $E5, $AC, $85, $C4, $A5, $B1, $E5, $AD, $AA, $A5, $AC, $C5, $C1    // data $8D17
    .byte $A5, $AD, $E5, $C2, $90, $18, $E8, $C4, $C4, $D0, $03, $CA, $F0, $32, $20, $23    // data $8D27
    .byte $97, $20, $61, $97, $C8, $D0, $F0, $E6, $AD, $E6, $C2, $4C, $2E, $8D, $A4, $C4    // data $8D37
    .byte $8A, $65, $AD, $85, $AD, $8A, $18, $65, $C2, $85, $C2, $E8, $98, $F0, $0A, $88    // data $8D47
    .byte $20, $23, $97, $20, $61, $97, $4C, $53, $8D, $C6, $AD, $C6, $C2, $CA, $D0, $EF    // data $8D57
    .byte $60, $2C, $68, $01, $30, $2E, $20, $A3, $8E, $A2, $04, $BD, $40, $08, $1D, $45    // data $8D67
    .byte $08, $F0, $21, $BD, $40, $08, $85, $AC, $BD, $45, $08, $85, $AD, $A9, $EC, $DD    // data $8D77
    .byte $4A, $08, $F0, $03, $A9, $98, $2C, $A9, $05, $20, $D2, $FF, $A0, $AD, $20, $3D    // data $8D87
    .byte $8B, $CA, $10, $D7, $60, $20, $79, $00, $F0, $0D, $20, $1E, $8F, $A6, $AC, $A4    // data $8D97
    .byte $AD, $8E, $59, $01, $8C, $58, $01, $2C, $68, $01, $30, $04, $18, $4C, $D8, $89    // data $8DA7
    .byte $A2, $16, $BD, $F2, $8D, $9D, $20, $01, $CA, $10, $F7, $20, $A6, $83, $20, $64    // data $8DB7
    .byte $83, $AE, $5E, $01, $9A, $AD, $58, $01, $8D, $35, $01, $AD, $59, $01, $8D, $34    // data $8DC7
    .byte $01, $AE, $F3, $DE, $AD, $5A, $01, $4C, $A0, $DE, $8D, $5B, $01, $8E, $5C, $01    // data $8DD7
    .byte $8C, $5D, $01, $08, $68, $8D, $5A, $01, $4C, $3E, $8E, $8E, $00, $DE, $48, $AE    // data $8DE7
    .byte $5C, $01, $AC, $5D, $01, $AD, $5F, $01, $85, $01, $AD, $5B, $01, $28, $4C, $E2    // data $8DF7
    .byte $FC    // data $8E07
bank01_sub_8E08:
    CLD                    // D8
    LDY #$3b               // A0 3B
    JSR bank01_sub_8F7C              // 20 7C 8F
    LDA $0158              // AD 58 01
    JSR bank01_sub_8B27              // 20 27 8B
    LDA $0159              // AD 59 01
    JSR bank01_sub_8B27              // 20 27 8B
    LDX #$00               // A2 00
bank01_sub_8E1C:
    LDA $015b,X            // BD 5B 01
    JSR bank01_sub_8B22              // 20 22 8B
    INX                    // E8
    CPX #$05               // E0 05
    BNE bank01_sub_8E1C              // D0 F5
    JSR $8ea9              // 20 A9 8E
    LDA $015a              // AD 5A 01
    SEC                    // 38
bank01_sub_8E2E:
    ROL A                  // 2A
    BEQ bank01_sub_8E3D              // F0 0C
    PHA                    // 48
    LDA #$30               // A9 30
    ADC #$00               // 69 00
    JSR $ffd2              // 20 D2 FF
    PLA                    // 68
    CLC                    // 18
    BCC bank01_sub_8E2E              // 90 F1
bank01_sub_8E3D:
    RTS                    // 60
    .byte $BA, $8E, $5E, $01, $AD, $11, $D0, $09, $10, $8D, $11, $D0, $20, $F2, $89, $20    // data $8E3E
    .byte $A9, $83    // data $8E4E
bank01_sub_8E50:
    JSR bank01_sub_9F51              // 20 51 9F
    TXA                    // 8A
    .byte $80    // undocumented opcode
    JSR bank01_sub_8E08              // 20 08 8E
bank01_sub_8E58:
    JSR $83a9              // 20 A9 83
    LDA $9a                // A5 9A
    CMP #$04               // C9 04
    BCC bank01_sub_8E64              // 90 03
    JSR bank01_sub_8EA3              // 20 A3 8E
bank01_sub_8E64:
    JSR $ffe7              // 20 E7 FF
bank01_sub_8E67:
    LDY #$00               // A0 00
    JSR bank01_sub_8F7C              // 20 7C 8F
    LDX #$d0               // A2 D0
    TXS                    // 9A
    CLD                    // D8
    JSR bank01_sub_8F95              // 20 95 8F
    TAX                    // AA
    BEQ bank01_sub_8E67              // F0 F1
    STA $aa                // 85 AA
    LDX #$ff               // A2 FF
bank01_sub_8E7A:
    INX                    // E8
    LDA $99a7,X            // BD A7 99
    BNE bank01_sub_8E83              // D0 03
    JMP bank01_sub_956A              // 4C 6A 95
bank01_sub_8E83:
    CMP $aa                // C5 AA
    BNE bank01_sub_8E7A              // D0 F3
    JSR bank01_sub_8E8D              // 20 8D 8E
    JMP bank01_sub_8E58              // 4C 58 8E
bank01_sub_8E8D:
    TXA                    // 8A
    ASL A                  // 0A
    TAX                    // AA
    LDA $99c5,X            // BD C5 99
    PHA                    // 48
    LDA $99c4,X            // BD C4 99
    PHA                    // 48
    JSR bank01_sub_9712              // 20 12 97
    JSR bank01_sub_81EB              // 20 EB 81
    LDY #$00               // A0 00
    JMP $0073              // 4C 73 00
bank01_sub_8EA3:
    LDA #$0d               // A9 0D
    BIT $24a9              // 2C A9 24
    BIT $20a9              // 2C A9 20
    JMP $ffd2              // 4C D2 FF
bank01_sub_8EAE:
    JSR $0079              // 20 79 00
    CMP #$2b               // C9 2B
    BNE bank01_sub_8EDD              // D0 28
    STX $02                // 86 02
    STY $03                // 84 03
    JSR $0073              // 20 73 00
    JSR bank01_sub_955E              // 20 5E 95
    BCS bank01_sub_8EDD              // B0 1C
    JSR $ad8a              // 20 8A AD
    JSR $b1b8              // 20 B8 B1
    LDA $65                // A5 65
    PHA                    // 48
    JSR $0079              // 20 79 00
    BEQ bank01_sub_8ED6              // F0 07
    CMP #$2c               // C9 2C
    BNE bank01_sub_8ED6              // D0 03
    JSR $0073              // 20 73 00
bank01_sub_8ED6:
    LDX $02                // A6 02
    LDY $03                // A4 03
    PLA                    // 68
    CLC                    // 18
    RTS                    // 60
bank01_sub_8EDD:
    JSR $0079              // 20 79 00
    JSR bank01_sub_8F02              // 20 02 8F
    ASL A                  // 0A
    ASL A                  // 0A
    ASL A                  // 0A
    ASL A                  // 0A
    STA $9f                // 85 9F
    JSR $0073              // 20 73 00
    JSR bank01_sub_8F02              // 20 02 8F
    PHA                    // 48
    JSR $0073              // 20 73 00
    PLA                    // 68
    ORA $9f                // 05 9F
    CLC                    // 18
    RTS                    // 60
    .byte $20, $79, $00, $C9, $2C, $D0, $1C, $4C, $73, $00    // data $8EF8
bank01_sub_8F02:
    BCS bank01_sub_8F07              // B0 03
    ADC #$d0               // 69 D0
    RTS                    // 60
bank01_sub_8F07:
    CMP #$41               // C9 41
    BCC bank01_sub_8F12              // 90 07
    CMP #$47               // C9 47
    BCS bank01_sub_8F12              // B0 03
    ADC #$c9               // 69 C9
    RTS                    // 60
bank01_sub_8F12:
    PLA                    // 68
    PLA                    // 68
    SEC                    // 38
bank01_sub_8F15:
    RTS                    // 60
bank01_sub_8F16:
    JSR bank01_sub_8EAE              // 20 AE 8E
    BCC bank01_sub_8F15              // 90 FA
    JMP bank01_sub_956A              // 4C 6A 95
bank01_sub_8F1E:
    LDY #$ad               // A0 AD
    BIT $b1a0              // 2C A0 B1
    BIT $c2a0              // 2C A0 C2
    BIT $c4a0              // 2C A0 C4
    JSR bank01_sub_8F16              // 20 16 8F
    STA $0000,Y            // 99 00 00
    JSR bank01_sub_8F16              // 20 16 8F
    DEY                    // 88
    STA $0000,Y            // 99 00 00
    LDY #$00               // A0 00
    JMP $0079              // 4C 79 00
    .byte $A9, $FF, $85, $B0, $85, $B1, $20, $79, $00, $F0, $0D, $20, $1E, $8F, $D0, $0B    // data $8F3B
    .byte $A5, $AC, $85, $B0, $A5, $AD, $85, $B1, $A0, $00, $60, $C9, $2D, $F0, $F9, $A0    // data $8F4B
    .byte $02, $B1, $7A, $C9, $20, $F0, $F1, $20, $21, $8F, $20, $C8, $94, $90, $E9, $4C    // data $8F5B
    .byte $1B, $8F, $E6, $C1, $D0, $02, $E6, $C2, $E6, $AC, $D0, $02, $E6, $AD, $4C, $C8    // data $8F6B
    .byte $94    // data $8F7B
bank01_sub_8F7C:
    JSR bank01_sub_8EA3              // 20 A3 8E
bank01_sub_8F7F:
    LDA $0165              // AD 65 01
    BPL bank01_sub_8F88              // 10 04
    STA $c7                // 85 C7
    AND #$7f               // 29 7F
bank01_sub_8F88:
    JSR $ffd2              // 20 D2 FF
    LDA #$00               // A9 00
    STA $c7                // 85 C7
    TYA                    // 98
    BEQ bank01_sub_8FB2              // F0 20
    JMP $ffd2              // 4C D2 FF
bank01_sub_8F95:
    CLI                    // 58
    LDY #$00               // A0 00
    STY $d4                // 84 D4
    INY                    // C8
    STY $13                // 84 13
    JSR bank01_sub_8886              // 20 86 88
    STX $7a                // 86 7A
    STY $7b                // 84 7B
    INX                    // E8
    STX $13                // 86 13
bank01_sub_8FA7:
    JSR $0073              // 20 73 00
    CMP #$2e               // C9 2E
    BEQ bank01_sub_8FA7              // F0 F9
    LDX $8f                // A6 8F
    BPL bank01_sub_8FB3              // 10 01
bank01_sub_8FB2:
    RTS                    // 60
bank01_sub_8FB3:
    TAY                    // A8
    JSR bank01_sub_9712              // 20 12 97
    TYA                    // 98
    BEQ bank01_sub_8FD6              // F0 1C
    JSR $0073              // 20 73 00
    JSR bank01_sub_8F1E              // 20 1E 8F
    LDX $8f                // A6 8F
    BEQ bank01_sub_8FD6              // F0 12
    JSR bank01_sub_8EA3              // 20 A3 8E
    LDY $a8                // A4 A8
    BNE bank01_sub_8FD3              // D0 08
    JSR bank01_sub_9728              // 20 28 97
    JSR bank01_sub_9393              // 20 93 93
    INC $a8                // E6 A8
bank01_sub_8FD3:
    JSR bank01_sub_94BB              // 20 BB 94
bank01_sub_8FD6:
    LDX $8f                // A6 8F
    JSR bank01_sub_8FEA              // 20 EA 8F
    SEI                    // 78
    LDX $d6                // A6 D6
    LDY $8e                // A4 8E
    JSR bank01_sub_8BEB              // 20 EB 8B
    LDA ($d1),Y            // B1 D1
    STA $ce                // 85 CE
    JMP bank01_sub_8F95              // 4C 95 8F
bank01_sub_8FEA:
    LDA $a8                // A5 A8
    CMP #$08               // C9 08
    BCC bank01_sub_8FFB              // 90 0B
    TXA                    // 8A
    BNE bank01_sub_8FF6              // D0 03
    JMP bank01_sub_8B9E              // 4C 9E 8B
bank01_sub_8FF6:
    JSR bank01_sub_8AB7              // 20 B7 8A
    BEQ bank01_sub_9004              // F0 09
bank01_sub_8FFB:
    TXA                    // 8A
    BNE bank01_sub_9001              // D0 03
    JMP bank01_sub_927A              // 4C 7A 92
bank01_sub_9001:
    JSR bank01_sub_92CD              // 20 CD 92
bank01_sub_9004:
    JMP bank01_sub_94BB              // 4C BB 94
    .byte $20, $FD, $90, $A0, $00, $B1, $7A, $D0, $05, $A0, $00, $4C, $C8, $90, $C9, $22    // data $9007
    .byte $D0, $03, $4C, $AD, $90, $C9, $3F, $F0, $07, $C8, $C0, $80, $D0, $E7, $F0, $E9    // data $9017
    .byte $A0, $00, $A2, $00, $B1, $7A, $F0, $38, $C9, $20, $F0, $2F, $C9, $3F, $D0, $07    // data $9027
    .byte $A9, $30, $91, $7A, $A9, $0F, $2C, $A9, $FF, $9D, $70, $01, $C8, $B1, $7A, $F0    // data $9037
    .byte $5D, $C9, $20, $F0, $F7, $C9, $3F, $D0, $11, $A9, $30, $91, $7A, $BD, $70, $01    // data $9047
    .byte $10, $03, $A9, $F0, $2C, $A9, $00, $9D, $70, $01, $E8, $C8, $C0, $50, $90, $C4    // data $9057
    .byte $A0, $00, $20, $79, $00, $F0, $0A, $20, $16, $8F, $91, $BB, $E6, $B7, $C8, $D0    // data $9067
    .byte $F1, $20, $A3, $8E, $A0, $00, $2C, $01, $DC, $10, $20, $20, $28, $97, $AA, $B9    // data $9077
    .byte $70, $01, $F0, $08, $8A, $39, $70, $01, $D1, $BB, $D0, $0A, $C8, $C4, $B7, $D0    // data $9087
    .byte $EA, $A0, $AD, $20, $3D, $8B, $20, $73, $8F, $90, $D9, $68, $68, $60, $A9, $3F    // data $9097
    .byte $20, $16, $E7, $68, $68, $60, $C0, $00, $F0, $17, $98, $18, $65, $7A, $85, $7A    // data $90A7
    .byte $A5, $7B, $69, $00, $85, $7B, $A0, $00, $4C, $C8, $90, $20, $3B, $8F, $20, $FD    // data $90B7
    .byte $90, $20, $79, $00, $F0, $0E, $C9, $22, $F0, $0B, $20, $16, $8F, $91, $BB, $E6    // data $90C7
    .byte $B7, $C8, $D0, $ED, $60    // data $90D7
bank01_sub_90DC:
    LDY #$00               // A0 00
    LDA ($7a),Y            // B1 7A
    CMP #$22               // C9 22
    BNE bank01_sub_90E6              // D0 02
    INC $7a                // E6 7A
bank01_sub_90E6:
    LDA ($7a),Y            // B1 7A
    CLC                    // 18
    BEQ bank01_sub_90F2              // F0 07
    CMP #$22               // C9 22
    BEQ bank01_sub_90F2              // F0 03
    INY                    // C8
    BNE bank01_sub_90E6              // D0 F4
bank01_sub_90F2:
    JSR bank01_sub_90FD              // 20 FD 90
    TYA                    // 98
    ADC $7a                // 65 7A
    STA $7a                // 85 7A
    JMP $0079              // 4C 79 00
bank01_sub_90FD:
    LDA $7a                // A5 7A
    STA $bb                // 85 BB
    LDA $7b                // A5 7B
    STA $bc                // 85 BC
    STY $b7                // 84 B7
    RTS                    // 60
    .byte $20, $79, $00, $F0, $2A, $C9, $22, $D0, $26, $20, $DC, $90, $F0, $12, $20, $F8    // data $9108
    .byte $8E, $20, $9E, $B7, $86, $BA, $F0, $08, $20, $F8, $8E, $20, $27, $8F, $A9, $01    // data $9118
    .byte $C9, $00, $60, $58, $20, $E4, $FF, $C9, $03, $F0, $04, $C9, $11, $D0, $F1, $20    // data $9128
    .byte $BB, $94, $24, $C5, $50, $FC, $4C, $B5, $8B, $20, $2B, $91, $F0, $12, $20, $2B    // data $9138
    .byte $91, $F0, $FB, $C9, $87, $F0, $07, $C9, $88, $18, $D0, $04, $A9, $00, $85, $8D    // data $9148
    .byte $A5, $8D, $60, $C9, $49, $D0, $08, $A0, $01, $B1, $7A, $C9, $2A, $F0, $03, $20    // data $9158
    .byte $E3, $9B, $20, $79, $00, $4C, $76, $8E, $A9, $00, $2C, $A9, $01, $85, $0A, $85    // data $9168
    .byte $93, $20, $08, $91, $49, $01, $85, $B9, $E0, $01, $D0, $08, $A9, $09, $A0, $00    // data $9178
    .byte $48, $4C, $1F, $F7, $A5, $93, $A6, $C3, $A4, $C4, $20, $D5, $FF, $B0, $0F, $A5    // data $9188
    .byte $0A, $D0, $0B, $A5, $90, $29, $BF, $D0, $05, $A6, $AE, $A4, $AF, $60, $4C, $78    // data $9198
    .byte $E1, $20, $08, $91, $F0, $2C, $A5, $BA, $C9, $08, $90, $3D, $A5, $C3, $85, $C1    // data $91A8
    .byte $A5, $C4, $85, $C2, $20, $79, $00, $F0, $19, $20, $F8, $8E, $20, $21, $8F, $20    // data $91B8
    .byte $79, $00, $D0, $11, $A6, $B0, $A4, $B1, $A9, $C1, $20, $D8, $FF, $90, $7B, $4C    // data $91C8
    .byte $F9, $E0, $4C, $6A, $95, $20, $F8, $8E, $20, $27, $8F, $A5, $BA, $C9, $01, $F0    // data $91D8
    .byte $08, $20, $50, $9F, $18, $80, $4C, $D5, $91, $A9, $09, $A0, $00, $48, $4C, $1F    // data $91E8
    .byte $F7, $A5, $7A, $48, $84, $7A, $A0, $02, $84, $7B, $20, $79, $A5, $E6, $7B, $68    // data $91F8
    .byte $85, $7A, $20, $9E, $AD, $20, $F7, $B7, $20, $A3, $8E, $20, $A6, $8E, $A0, $15    // data $9208
    .byte $20, $40, $8B, $20, $A9, $8E, $A9, $25, $20, $D2, $FF, $A5, $15, $F0, $03, $20    // data $9218
    .byte $2D, $8E, $A5, $14, $20, $2D, $8E, $20, $A9, $8E, $A6, $14, $A5, $15, $20, $CD    // data $9228
    .byte $BD, $A5, $15, $D0, $15, $A5, $14, $AA, $29, $7F, $C9, $20, $90, $0C, $20, $A9    // data $9238
    .byte $8E, $A9, $27, $20, $D2, $FF, $8A, $20, $D2, $FF, $60, $A9, $02, $8D, $66, $01    // data $9248
    .byte $20, $3B, $8F, $84, $8D, $20, $A3, $8E, $A6, $D6, $86, $8F, $20, $CD, $92, $20    // data $9258
    .byte $41, $91, $F0, $06, $20, $7A, $92, $4C, $67, $92, $20, $BB, $94, $90, $E6, $4C    // data $9268
    .byte $58, $8E    // data $9278
bank01_sub_927A:
    JSR bank01_sub_8BCC              // 20 CC 8B
    LDA #$c1               // A9 C1
    STA $0107              // 8D 07 01
    LDA #$15               // A9 15
    STA $25                // 85 25
bank01_sub_9286:
    LDA $ac                // A5 AC
    SEC                    // 38
    SBC $25                // E5 25
    STA $c1                // 85 C1
    LDA $ad                // A5 AD
    SBC #$00               // E9 00
    STA $c2                // 85 C2
    LDY #$01               // A0 01
bank01_sub_9295:
    STY $24                // 84 24
    JSR bank01_sub_9728              // 20 28 97
    JSR bank01_sub_9393              // 20 93 93
    LDY $24                // A4 24
    BCC bank01_sub_92A8              // 90 07
    INY                    // C8
    CPY $25                // C4 25
    BCC bank01_sub_9295              // 90 EF
    BCS bank01_sub_92BB              // B0 13
bank01_sub_92A8:
    TYA                    // 98
    SEC                    // 38
    ADC $a8                // 65 A8
    CMP $25                // C5 25
    BEQ bank01_sub_92BE              // F0 0E
    TAY                    // A8
    BCC bank01_sub_9295              // 90 E2
    DEC $25                // C6 25
    BNE bank01_sub_9286              // D0 CF
    LDY #$01               // A0 01
    BNE bank01_sub_92BD              // D0 02
bank01_sub_92BB:
    LDY $25                // A4 25
bank01_sub_92BD:
    DEY                    // 88
bank01_sub_92BE:
    TYA                    // 98
    CLC                    // 18
    ADC $c1                // 65 C1
    STA $ac                // 85 AC
    LDA $c2                // A5 C2
    ADC #$00               // 69 00
    STA $ad                // 85 AD
    JSR bank01_sub_971D              // 20 1D 97
bank01_sub_92CD:
    LDY #$00               // A0 00
    STY $d3                // 84 D3
    LDY #$3e               // A0 3E
    JSR bank01_sub_8F7F              // 20 7F 8F
    LDY #$ad               // A0 AD
    JSR bank01_sub_8B3D              // 20 3D 8B
    LDY #$02               // A0 02
bank01_sub_92DD:
    JSR bank01_sub_9728              // 20 28 97
    STA $00a9,Y            // 99 A9 00
    DEY                    // 88
    BPL bank01_sub_92DD              // 10 F7
    LDA $a9                // A5 A9
    JSR bank01_sub_9393              // 20 93 93
    PHA                    // 48
    LDX $a8                // A6 A8
    INX                    // E8
bank01_sub_92EF:
    DEX                    // CA
    BPL bank01_sub_92FE              // 10 0C
    JSR $8ea9              // 20 A9 8E
    JSR $8ea9              // 20 A9 8E
    JSR $8ea9              // 20 A9 8E
    JMP bank01_sub_9304              // 4C 04 93
bank01_sub_92FE:
    LDA $00a9,Y            // B9 A9 00
    JSR bank01_sub_8B22              // 20 22 8B
bank01_sub_9304:
    INY                    // C8
    CPY #$03               // C0 03
    BCC bank01_sub_92EF              // 90 E6
    JSR $8ea9              // 20 A9 8E
    JSR $8ea9              // 20 A9 8E
    PLA                    // 68
    LDX #$03               // A2 03
    JSR bank01_sub_9371              // 20 71 93
    LDX #$06               // A2 06
bank01_sub_9317:
    CPX #$03               // E0 03
    BNE bank01_sub_9330              // D0 15
    LDY $a8                // A4 A8
    BEQ bank01_sub_9330              // F0 11
bank01_sub_931F:
    LDA $a7                // A5 A7
    CMP #$e8               // C9 E8
    PHP                    // 08
    LDA $00a9,Y            // B9 A9 00
    PLP                    // 28
    BCS bank01_sub_9353              // B0 29
    JSR bank01_sub_8B27              // 20 27 8B
    DEY                    // 88
    BNE bank01_sub_931F              // D0 EF
bank01_sub_9330:
    ASL $a7                // 06 A7
    BCC bank01_sub_9342              // 90 0E
    LDA $94ae,X            // BD AE 94
    JSR $ffd2              // 20 D2 FF
    LDA $94b4,X            // BD B4 94
    BEQ bank01_sub_9342              // F0 03
    JSR $ffd2              // 20 D2 FF
bank01_sub_9342:
    DEX                    // CA
    BNE bank01_sub_9317              // D0 D2
bank01_sub_9345:
    INC $a8                // E6 A8
    LDA #$20               // A9 20
    LDY $d3                // A4 D3
bank01_sub_934B:
    STA ($d1),Y            // 91 D1
    INY                    // C8
    CPY #$28               // C0 28
    BCC bank01_sub_934B              // 90 F9
    RTS                    // 60
bank01_sub_9353:
    LDX $ad                // A6 AD
    TAY                    // A8
    BPL bank01_sub_9359              // 10 01
    DEX                    // CA
bank01_sub_9359:
    SEC                    // 38
    ADC $ac                // 65 AC
    BCC bank01_sub_935F              // 90 01
    INX                    // E8
bank01_sub_935F:
    CLC                    // 18
    ADC #$01               // 69 01
    BNE bank01_sub_9365              // D0 01
    INX                    // E8
bank01_sub_9365:
    PHA                    // 48
    TXA                    // 8A
    JSR bank01_sub_8B27              // 20 27 8B
    PLA                    // 68
    JSR bank01_sub_8B27              // 20 27 8B
    JMP bank01_sub_9345              // 4C 45 93
bank01_sub_9371:
    TAY                    // A8
    LDA $93dd,Y            // B9 DD 93
    STA $22                // 85 22
    LDA $941d,Y            // B9 1D 94
    STA $23                // 85 23
bank01_sub_937C:
    LDA #$00               // A9 00
    LDY #$05               // A0 05
bank01_sub_9380:
    ASL $23                // 06 23
    ROL $22                // 26 22
    ROL A                  // 2A
    DEY                    // 88
    BNE bank01_sub_9380              // D0 F8
    ADC #$3f               // 69 3F
    JSR $ffd2              // 20 D2 FF
    DEX                    // CA
    BNE bank01_sub_937C              // D0 EC
    JMP $8ea9              // 4C A9 8E
bank01_sub_9393:
    TAY                    // A8
    LSR A                  // 4A
    BCC bank01_sub_93A2              // 90 0B
    LSR A                  // 4A
    BCS bank01_sub_93B2              // B0 18
    CMP #$22               // C9 22
    BEQ bank01_sub_93B2              // F0 14
    AND #$07               // 29 07
    ORA #$80               // 09 80
bank01_sub_93A2:
    LSR A                  // 4A
    TAX                    // AA
    LDA $945d,X            // BD 5D 94
    BCS bank01_sub_93AD              // B0 04
    LSR A                  // 4A
    LSR A                  // 4A
    LSR A                  // 4A
    LSR A                  // 4A
bank01_sub_93AD:
    AND #$0f               // 29 0F
    CLC                    // 18
    BNE bank01_sub_93B7              // D0 05
bank01_sub_93B2:
    SEC                    // 38
    LDY #$80               // A0 80
    LDA #$00               // A9 00
bank01_sub_93B7:
    TAX                    // AA
    PHP                    // 08
    LDA $94a1,X            // BD A1 94
    STA $a7                // 85 A7
    AND #$03               // 29 03
    STA $a8                // 85 A8
    TYA                    // 98
    AND #$8f               // 29 8F
    TAX                    // AA
    TYA                    // 98
    LDY #$03               // A0 03
    CPX #$8a               // E0 8A
    BEQ bank01_sub_93D8              // F0 0B
bank01_sub_93CD:
    LSR A                  // 4A
    BCC bank01_sub_93D8              // 90 08
    LSR A                  // 4A
bank01_sub_93D1:
    LSR A                  // 4A
    ORA #$20               // 09 20
    DEY                    // 88
    BNE bank01_sub_93D1              // D0 FA
    INY                    // C8
bank01_sub_93D8:
    DEY                    // 88
    BNE bank01_sub_93CD              // D0 F2
    PLP                    // 28
    RTS                    // 60
    .byte $1C, $8A, $1C, $23, $5D, $8B, $1B, $A1, $9D, $8A, $1D, $23, $9D, $8B, $1D, $A1    // data $93DD
    .byte $00, $29, $19, $AE, $69, $A8, $19, $23, $24, $53, $1B, $23, $24, $53, $19, $A1    // data $93ED
    .byte $00, $1A, $5B, $5B, $A5, $69, $24, $24, $AE, $AE, $A8, $AD, $29, $00, $7C, $00    // data $93FD
    .byte $15, $9C, $6D, $9C, $A5, $69, $29, $53, $84, $13, $34, $11, $A5, $69, $23, $A0    // data $940D
    .byte $D8, $62, $5A, $48, $26, $62, $94, $88, $54, $44, $C8, $54, $68, $44, $E8, $94    // data $941D
    .byte $00, $B4, $08, $84, $74, $B4, $28, $6E, $74, $F4, $CC, $4A, $72, $F2, $A4, $8A    // data $942D
    .byte $00, $AA, $A2, $A2, $74, $74, $74, $72, $44, $68, $B2, $32, $B2, $00, $22, $00    // data $943D
    .byte $1A, $1A, $26, $26, $72, $72, $88, $C8, $C4, $CA, $26, $48, $44, $44, $A2, $C8    // data $944D
    .byte $40, $02, $45, $03, $D0, $08, $40, $09, $30, $22, $45, $33, $D0, $08, $40, $09    // data $945D
    .byte $40, $02, $45, $33, $D0, $08, $40, $09, $40, $02, $45, $B3, $D0, $08, $40, $09    // data $946D
    .byte $00, $22, $44, $33, $D0, $8C, $44, $00, $11, $22, $44, $33, $D0, $8C, $44, $9A    // data $947D
    .byte $10, $22, $44, $33, $D0, $08, $40, $09, $10, $22, $44, $33, $D0, $08, $40, $09    // data $948D
    .byte $62, $13, $78, $A9, $00, $21, $81, $82, $00, $00, $59, $4D, $91, $92, $86, $4A    // data $949D
    .byte $85, $9D, $2C, $29, $2C, $23, $28, $24, $59, $00, $58, $24, $24, $00    // data $94AD
bank01_sub_94BB:
    CLC                    // 18
    LDA $a8                // A5 A8
bank01_sub_94BE:
    ADC $ac                // 65 AC
    STA $ac                // 85 AC
    BCC bank01_sub_94C8              // 90 04
    INC $ad                // E6 AD
    BEQ bank01_sub_94D0              // F0 08
bank01_sub_94C8:
    LDA $ac                // A5 AC
    CMP $b0                // C5 B0
    LDA $ad                // A5 AD
    SBC $b1                // E5 B1
bank01_sub_94D0:
    RTS                    // 60
    .byte $A9, $02, $8D, $66, $01, $20, $1E, $8F, $D0, $03, $4C, $58, $8E, $C8, $2C, $68    // data $94D1
    .byte $01, $30, $27, $C9, $53, $F0, $04, $C9, $52, $D0, $1F, $85, $A7, $B1, $7A, $C9    // data $94E1
    .byte $5A, $F0, $04, $C9, $46, $D0, $13, $E9, $5A, $48, $20, $B6, $9A, $68, $A6, $A7    // data $94F1
    .byte $E0, $53, $D0, $03, $20, $18, $9B, $4C, $67, $96, $C8, $B1, $7A, $C9, $20, $D0    // data $9501
    .byte $20, $A5, $8E, $C9, $12, $B0, $1A, $A0, $FF, $C8, $20, $16, $8F, $48, $A5, $7A    // data $9511
    .byte $C9, $12, $B0, $04, $C0, $02, $90, $F1, $68, $20, $68, $97, $88, $10, $F9, $30    // data $9521
    .byte $D6, $C6, $7A, $E6, $7A, $A0, $00, $84, $51, $A0, $03, $88, $30, $37, $B1, $7A    // data $9531
    .byte $F0, $27, $C9, $20, $F0, $ED, $38, $E9, $3F, $A2, $05, $4A, $66, $51, $66, $50    // data $9541
    .byte $CA, $D0, $F8, $F0, $E6, $C9, $47, $B0, $0E, $C9, $41, $B0, $08    // data $9551
bank01_sub_955E:
    CMP #$3a               // C9 3A
    BCS $9568              // B0 06
    CMP #$30               // C9 30
    BCC $9568              // 90 02
    CLC                    // 18
    BIT $38                // 24 38
    RTS                    // 60
bank01_sub_956A:
    LDA $7a                // A5 7A
    STA $d3                // 85 D3
    LDA #$3f               // A9 3F
    JSR $ffd2              // 20 D2 FF
    JMP bank01_sub_8E58              // 4C 58 8E
    .byte $E6, $7A, $E6, $7A, $86, $A6, $A2, $02, $20, $73, $00, $20, $79, $00, $F0, $39    // data $9576
    .byte $C9, $24, $F0, $10, $20, $56, $95, $B0, $2B, $A9, $24, $20, $DE, $97, $20, $79    // data $9586
    .byte $00, $4C, $A0, $95, $20, $DE, $97, $20, $73, $00, $20, $AE, $8E, $B0, $DC, $E6    // data $9596
    .byte $A6, $A4, $A6, $C0, $03, $F0, $BD, $99, $A9, $00, $A9, $30, $20, $DE, $97, $20    // data $95A6
    .byte $DE, $97, $D0, $E6, $20, $DE, $97, $90, $BF, $86, $A5, $C0, $02, $D0, $08, $A5    // data $95B6
    .byte $AB, $A4, $AA, $84, $AB, $85, $AA, $A2, $00, $86, $A9, $A2, $00, $86, $9F, $A5    // data $95C6
    .byte $A9, $20, $93, $93, $A6, $A7, $86, $64, $AA, $BD, $1D, $94, $20, $80, $96, $BD    // data $95D6
    .byte $DD, $93, $20, $80, $96, $A2, $06, $E0, $03, $D0, $12, $A4, $A8, $F0, $0E, $A5    // data $95E6
    .byte $A7, $C9, $E8, $A9, $30, $B0, $1D, $20, $7D, $96, $88, $D0, $F2, $06, $A7, $90    // data $95F6
    .byte $0E, $BD, $AE, $94, $20, $80, $96, $BD, $B4, $94, $F0, $03, $20, $80, $96, $CA    // data $9606
    .byte $D0, $D5, $F0, $06, $20, $7D, $96, $20, $7D, $96, $A5, $A5, $C5, $9F, $F0, $03    // data $9616
    .byte $4C, $8A, $96, $A4, $A8, $F0, $31, $A5, $64, $C9, $9D, $D0, $22, $A5, $AA, $E5    // data $9626
    .byte $AC, $AA, $A5, $AB, $E5, $AD, $90, $08, $D0, $56, $E0, $82, $B0, $52, $90, $08    // data $9636
    .byte $A8, $C8, $D0, $4C, $E0, $82, $90, $48, $CA, $CA, $8A, $A4, $A8, $D0, $03, $B9    // data $9646
    .byte $A9, $00, $20, $68, $97, $88, $D0, $F7, $A5, $A9, $C9, $02, $F0, $03, $20, $68    // data $9656
    .byte $97, $20, $CD, $92, $20, $BB, $94, $A0, $41, $20, $7C, $8F, $A0, $AD, $20, $3D    // data $9666
    .byte $8B, $20, $A9, $8E, $4C, $6C, $8E, $20, $80, $96, $86, $A4, $A6, $9F, $D5, $50    // data $9676
    .byte $F0, $09, $68, $68, $E6, $A9, $F0, $08, $4C, $D1, $95, $E6, $9F, $A6, $A4, $60    // data $9686
    .byte $4C, $6A, $95, $F0, $08, $B0, $1B, $20, $B6, $82, $AA, $D0, $15, $A9, $2D, $20    // data $9696
    .byte $16, $E7, $A9, $3E, $20, $16, $E7, $A9, $20, $20, $16, $E7, $20, $50, $9F, $24    // data $96A6
    .byte $80, $60, $C9, $23, $D0, $03, $4C, $B3, $82, $C9, $2D, $D0, $1F, $A6, $D6, $A0    // data $96B6
    .byte $00, $20, $0C, $E5, $A0, $00, $B1, $D1, $C9, $2D, $F0, $05, $C8, $C0, $4F, $D0    // data $96C6
    .byte $F5, $A9, $1D, $20, $16, $E7, $88, $10, $F8, $4C, $A8, $96, $C9, $2A, $F0, $03    // data $96D6
    .byte $4C, $E9, $97, $20, $0C, $97, $20, $73, $00, $F0, $1A, $29, $0F, $D0, $02, $A9    // data $96E6
    .byte $80, $AA, $A8, $20, $73, $00, $F0, $07, $29, $0F, $D0, $02, $A9, $80, $A8    // data $96F6
bank01_sub_9705:
    STX $0161              // 8E 61 01
    STY $0162              // 8C 62 01
    RTS                    // 60
bank01_sub_970C:
    LDX #$80               // A2 80
    LDY #$80               // A0 80
    BNE bank01_sub_9705              // D0 F3
bank01_sub_9712:
    LDX #$58               // A2 58
bank01_sub_9714:
    LDA $9f05,X            // BD 05 9F
    STA $00ff,X            // 9D FF 00
    DEX                    // CA
    BNE bank01_sub_9714              // D0 F7
bank01_sub_971D:
    LDA #$ac               // A9 AC
    STA $0107              // 8D 07 01
    RTS                    // 60
    .byte $A9, $AC, $8D, $07, $01    // data $9723
bank01_sub_9728:
    BIT $0161              // 2C 61 01
    BPL bank01_sub_9732              // 10 05
    LDA #$ad               // A9 AD
    JMP $0100              // 4C 00 01
bank01_sub_9732:
    STX $14                // 86 14
    LDX $0107              // AE 07 01
    LDA $ba                // A5 BA
    PHA                    // 48
    LDA $0161              // AD 61 01
    STA $ba                // 85 BA
    LDA #$52               // A9 52
    JSR bank01_sub_9798              // 20 98 97
    JSR $ffae              // 20 AE FF
    LDA $ba                // A5 BA
    JSR $ffb4              // 20 B4 FF
    LDA #$6f               // A9 6F
    JSR $ff96              // 20 96 FF
    JSR $ffa5              // 20 A5 FF
    STA $15                // 85 15
    JSR $ffab              // 20 AB FF
bank01_sub_9759:
    LDX $14                // A6 14
    PLA                    // 68
    STA $ba                // 85 BA
    LDA $15                // A5 15
    RTS                    // 60
    .byte $48, $A9, $C1, $8D, $07, $01, $68    // data $9761
bank01_sub_9768:
    STA $0136              // 8D 36 01
    BIT $0162              // 2C 62 01
    BPL bank01_sub_9775              // 10 05
    LDA #$8d               // A9 8D
    JMP $0100              // 4C 00 01
bank01_sub_9775:
    LDA $ba                // A5 BA
    PHA                    // 48
    LDA $0162              // AD 62 01
    STA $ba                // 85 BA
    STX $14                // 86 14
    LDX $0107              // AE 07 01
    LDA #$57               // A9 57
    JSR bank01_sub_9798              // 20 98 97
    LDA $0136              // AD 36 01
    JSR $ffa8              // 20 A8 FF
    LDA #$0d               // A9 0D
    JSR $ffa8              // 20 A8 FF
    JSR $ffae              // 20 AE FF
    JMP bank01_sub_9759              // 4C 59 97
bank01_sub_9798:
    JSR bank01_sub_97C7              // 20 C7 97
    TYA                    // 98
    CLC                    // 18
    ADC $00,X              // 75 00
    PHP                    // 08
    JSR $ffa8              // 20 A8 FF
    PLP                    // 28
    LDA $01,X              // B5 01
    ADC #$00               // 69 00
    JSR $ffa8              // 20 A8 FF
    LDA #$01               // A9 01
    JMP $ffa8              // 4C A8 FF
bank01_sub_97B0:
    LDA #$00               // A9 00
    STA $90                // 85 90
    LDA $ba                // A5 BA
    JSR $ffb1              // 20 B1 FF
    LDA #$6f               // A9 6F
    JSR $ff93              // 20 93 FF
    LDA $90                // A5 90
    BPL bank01_sub_97C5              // 10 03
    JMP $f707              // 4C 07 F7
bank01_sub_97C5:
    CLC                    // 18
    RTS                    // 60
bank01_sub_97C7:
    PHA                    // 48
    JSR bank01_sub_97B0              // 20 B0 97
    BCC bank01_sub_97D0              // 90 03
    JMP $e0f9              // 4C F9 E0
bank01_sub_97D0:
    LDA #$4d               // A9 4D
    JSR $ffa8              // 20 A8 FF
    LDA #$2d               // A9 2D
    JSR $ffa8              // 20 A8 FF
    PLA                    // 68
    JMP $ffa8              // 4C A8 FF
    .byte $95, $50, $E8, $E0, $0A, $90, $03, $4C, $6A, $95, $60, $C9, $42, $D0, $0D, $20    // data $97DE
    .byte $73, $00, $C9, $52, $F0, $39, $C9, $57, $F0, $38, $D0, $23, $C9, $4D, $D0, $1F    // data $97EE
    .byte $20, $73, $00, $C9, $45, $D0, $18, $20, $73, $00, $20, $1E, $8F, $A9, $45, $20    // data $97FE
    .byte $C7, $97, $A5, $AC, $20, $A8, $FF, $A5, $AD, $20, $A8, $FF, $4C, $AE, $FF, $C9    // data $980E
    .byte $50, $D0, $03, $4C, $1C, $9D, $20, $DC, $90, $20, $50, $9F, $1B, $80, $60, $4C    // data $981E
    .byte $33, $98, $4C, $53, $98, $20, $1E, $99, $B0, $15    // data $982E
bank01_sub_9838:
    LDA #$31               // A9 31
    JSR bank01_sub_9873              // 20 73 98
bank01_sub_983D:
    JSR bank01_sub_9900              // 20 00 99
    BCS bank01_sub_983D              // B0 FB
    LDY #$00               // A0 00
bank01_sub_9844:
    JSR $ffcf              // 20 CF FF
    JSR bank01_sub_9768              // 20 68 97
    INY                    // C8
    BNE bank01_sub_9844              // D0 F7
bank01_sub_984D:
    JSR $ffcc              // 20 CC FF
    JMP bank01_sub_9908              // 4C 08 99
    .byte $20, $1E, $99, $B0, $F5    // data $9853
bank01_sub_9858:
    JSR bank01_sub_989A              // 20 9A 98
bank01_sub_985B:
    JSR $98f8              // 20 F8 98
    BCS bank01_sub_985B              // B0 FB
    LDY #$00               // A0 00
bank01_sub_9862:
    JSR bank01_sub_9728              // 20 28 97
    JSR $ffd2              // 20 D2 FF
    INY                    // C8
    BNE bank01_sub_9862              // D0 F7
    JSR bank01_sub_9871              // 20 71 98
    JMP bank01_sub_984D              // 4C 4D 98
bank01_sub_9871:
    LDA #$32               // A9 32
bank01_sub_9873:
    PHA                    // 48
    JSR bank01_sub_98F5              // 20 F5 98
    LDA #$55               // A9 55
    JSR $ffd2              // 20 D2 FF
    PLA                    // 68
    JSR $ffd2              // 20 D2 FF
    JSR bank01_sub_9985              // 20 85 99
    .byte $3A    // undocumented opcode
    JSR $2033              // 20 33 20
    BMI $98a9              // 30 20
    BRK                    // 00
    .byte $A5, $25, $20, $B1, $98, $20, $A9, $8E, $A5, $26, $20, $B1, $98, $4C, $CC, $FF    // data $988A
bank01_sub_989A:
    LDA #$00               // A9 00
    PHA                    // 48
    JSR bank01_sub_98F5              // 20 F5 98
    JSR bank01_sub_9985              // 20 85 99
    .byte $42    // undocumented opcode
    AND $2050              // 2D 50 20
    .byte $33    // undocumented opcode
    JSR $6800              // 20 00 68
    JSR bank01_sub_98B1              // 20 B1 98
    JMP $ffcc              // 4C CC FF
bank01_sub_98B1:
    LDY #$00               // A0 00
    STA $5f                // 85 5F
    STY $60                // 84 60
    LDX #$10               // A2 10
    LDA #$00               // A9 00
    TAY                    // A8
    STA $5d                // 85 5D
    STY $5e                // 84 5E
    SED                    // F8
bank01_sub_98C1:
    ASL $5f                // 06 5F
    ROL $60                // 26 60
    ADC $5d                // 65 5D
    STA $5d                // 85 5D
    PHA                    // 48
    TYA                    // 98
    ADC $5e                // 65 5E
    STA $5e                // 85 5E
    TAY                    // A8
    PLA                    // 68
    DEX                    // CA
    BNE bank01_sub_98C1              // D0 ED
    CLD                    // D8
    TYA                    // 98
    ORA #$30               // 09 30
    TAY                    // A8
    LDA $5d                // A5 5D
    LSR A                  // 4A
    LSR A                  // 4A
    LSR A                  // 4A
    LSR A                  // 4A
    ORA #$30               // 09 30
    TAX                    // AA
    LDA $5d                // A5 5D
    AND #$0f               // 29 0F
    ORA #$30               // 09 30
    PHA                    // 48
    TYA                    // 98
    JSR $ffd2              // 20 D2 FF
    TXA                    // 8A
    JSR $ffd2              // 20 D2 FF
    PLA                    // 68
    JMP $ffd2              // 4C D2 FF
bank01_sub_98F5:
    LDX #$0f               // A2 0F
    BIT $03a2              // 2C A2 03
    JMP $f250              // 4C 50 F2
    .byte $A2, $0F, $2C    // data $98FD
bank01_sub_9900:
    LDX #$03               // A2 03
    JMP $ffc6              // 4C C6 FF
    .byte $A9, $0F, $2C    // data $9905
bank01_sub_9908:
    LDA #$03               // A9 03
    JSR $ffc3              // 20 C3 FF
    JSR $ffcc              // 20 CC FF
    CLC                    // 18
    RTS                    // 60
bank01_sub_9912:
    LDX $ba                // A6 BA
    LDA #$0f               // A9 0F
    TAY                    // A8
    JSR $ffba              // 20 BA FF
    LDA #$00               // A9 00
    BEQ bank01_sub_995E              // F0 40
    JSR $0073              // 20 73 00
    JSR bank01_sub_8F16              // 20 16 8F
    PHA                    // 48
    JSR bank01_sub_8F16              // 20 16 8F
    TAY                    // A8
    LDX #$cf               // A2 CF
    JSR $0079              // 20 79 00
    BEQ bank01_sub_9934              // F0 04
    JSR bank01_sub_8F16              // 20 16 8F
    TAX                    // AA
bank01_sub_9934:
    PLA                    // 68
bank01_sub_9935:
    STA $25                // 85 25
    STY $26                // 84 26
    STX $ad                // 86 AD
    LDA #$00               // A9 00
    STA $ac                // 85 AC
    JSR bank01_sub_970C              // 20 0C 97
    JSR bank01_sub_97B0              // 20 B0 97
    BCS bank01_sub_996F              // B0 28
    JSR $ffae              // 20 AE FF
    JSR $ffe7              // 20 E7 FF
    JSR bank01_sub_9912              // 20 12 99
    LDX $ba                // A6 BA
    LDA #$03               // A9 03
    TAY                    // A8
    JSR $ffba              // 20 BA FF
    LDA #$01               // A9 01
    LDX #$84               // A2 84
    LDY #$99               // A0 99
bank01_sub_995E:
    JSR $ffbd              // 20 BD FF
    JMP $ffc0              // 4C C0 FF
bank01_api_10:
    SEC                    // 38
    BIT $18                // 24 18
    PHP                    // 08
    JSR bank01_sub_9935              // 20 35 99
    BCC bank01_sub_9970              // 90 03
    PLP                    // 28
    SEC                    // 38
bank01_sub_996F:
    RTS                    // 60
bank01_sub_9970:
    JSR bank01_sub_9712              // 20 12 97
    STX $0163              // 8E 63 01
    LDA #$34               // A9 34
    STA $0160              // 8D 60 01
    PLP                    // 28
    BCC bank01_sub_9981              // 90 03
    JMP bank01_sub_9838              // 4C 38 98
bank01_sub_9981:
    JMP bank01_sub_9858              // 4C 58 98
    .byte $23    // data $9984
bank01_sub_9985:
    PLA                    // 68
    STA $22                // 85 22
    PLA                    // 68
    STA $23                // 85 23
    STY $24                // 84 24
    LDY #$00               // A0 00
bank01_sub_998F:
    INC $22                // E6 22
    BNE bank01_sub_9995              // D0 02
    INC $23                // E6 23
bank01_sub_9995:
    LDA ($22),Y            // B1 22
    BEQ bank01_sub_999E              // F0 05
    JSR $ffd2              // 20 D2 FF
    BCC bank01_sub_998F              // 90 F1
bank01_sub_999E:
    LDY $24                // A4 24
    LDA $23                // A5 23
    PHA                    // 48
    LDA $22                // A5 22
    PHA                    // 48
    RTS                    // 60
    .byte $58, $4D, $52, $4C, $46, $43, $48, $54, $57, $47, $44, $3A, $3B, $50, $53, $56    // data $99A7
    .byte $4E, $41, $3E, $49, $2C, $42, $2A, $24, $40, $2D, $4A, $55, $00, $D6, $89, $64    // data $99B7
    .byte $8B, $4F, $8E, $6F, $91, $65, $8C, $84, $8C, $DF, $8C, $0A, $8D, $67, $8D, $9B    // data $99C7
    .byte $8D, $52, $92, $30, $8A, $06, $8C, $5A, $91, $A8, $91, $72, $91, $F8, $91, $D0    // data $99D7
    .byte $94, $D0, $94, $4C, $8B, $33, $8A, $2E, $8C, $FF, $9E, $14, $80, $98, $96, $3F    // data $99E7
    .byte $9A, $5C, $8B, $44, $8C, $2C, $68, $01, $30, $39, $20, $44, $E5, $A2, $90, $A0    // data $99F7
    .byte $D0, $A9, $00, $85, $C1, $84, $C2, $20, $A3, $8E, $A0, $2D, $20, $7C, $8F, $A0    // data $9A07
    .byte $C2, $20, $40, $8B, $A0, $08, $BD, $00, $08, $20, $22, $8B, $E6, $C1, $E8, $88    // data $9A17
    .byte $D0, $F4, $E0, $E0, $F0, $0D, $A0, $DC, $E0, $C0, $F0, $D5, $C8, $E0, $D0, $F0    // data $9A27
    .byte $D0, $D0, $D7, $20, $A3, $8E, $4C, $50, $8E, $20, $24, $8F, $A2, $90, $A5, $C2    // data $9A37
    .byte $C9, $D0, $F0, $0C, $A2, $C0, $C9, $DC, $F0, $06, $A2, $D0, $C9, $DD, $D0, $18    // data $9A47
    .byte $8A, $18, $65, $C1, $B0, $12, $C9, $D9, $B0, $0E, $A8, $A2, $08, $20, $16, $8F    // data $9A57
    .byte $99, $00, $08, $C8, $CA, $D0, $F6, $60, $4C, $6A, $95    // data $9A67
bank01_sub_9A72:
    LDA $0159              // AD 59 01
    SEC                    // 38
    SBC #$03               // E9 03
    STA $ac                // 85 AC
    LDA $0158              // AD 58 01
    SBC #$00               // E9 00
    STA $ad                // 85 AD
    JSR bank01_sub_9AB6              // 20 B6 9A
    BCC bank01_sub_9A95              // 90 0F
    LDA #$01               // A9 01
    JSR bank01_sub_94BE              // 20 BE 94
    JSR bank01_sub_9AB6              // 20 B6 9A
    BCC bank01_sub_9A95              // 90 05
    LDA #$00               // A9 00
    JSR bank01_sub_94BE              // 20 BE 94
bank01_sub_9A95:
    LDA $ac                // A5 AC
    STA $0159              // 8D 59 01
    LDA $ad                // A5 AD
    STA $0158              // 8D 58 01
    LDX #$04               // A2 04
bank01_sub_9AA1:
    LDA $0840,X            // BD 40 08
    STA $ac                // 85 AC
    LDA $0845,X            // BD 45 08
    STA $ad                // 85 AD
    ORA $ac                // 05 AC
    BEQ bank01_sub_9AB2              // F0 03
    JSR bank01_sub_9ACB              // 20 CB 9A
bank01_sub_9AB2:
    DEX                    // CA
    BPL bank01_sub_9AA1              // 10 EC
    RTS                    // 60
bank01_sub_9AB6:
    LDX #$04               // A2 04
bank01_sub_9AB8:
    LDA $0840,X            // BD 40 08
    CMP $ac                // C5 AC
    BNE bank01_sub_9AC6              // D0 07
    LDA $0845,X            // BD 45 08
    CMP $ad                // C5 AD
    BEQ bank01_sub_9ACB              // F0 05
bank01_sub_9AC6:
    DEX                    // CA
    BPL bank01_sub_9AB8              // 10 EF
    SEC                    // 38
    RTS                    // 60
bank01_sub_9ACB:
    LDA #$00               // A9 00
    STA $0840,X            // 9D 40 08
    STA $0845,X            // 9D 45 08
    LDY $084a,X            // BC 4A 08
    BNE bank01_sub_9AEE              // D0 16
    JSR bank01_sub_9728              // 20 28 97
    BNE $9b13              // D0 36
    LDA $0854,X            // BD 54 08
    CMP #$aa               // C9 AA
    BNE $9b13              // D0 2F
    EOR $0859,X            // 5D 59 08
    BNE $9b13              // D0 2A
    STA $0859,X            // 9D 59 08
    BEQ bank01_sub_9B0B              // F0 1D
bank01_sub_9AEE:
    LDY #$02               // A0 02
bank01_sub_9AF0:
    JSR bank01_sub_9728              // 20 28 97
    CMP $9b15,Y            // D9 15 9B
    BNE $9b13              // D0 1B
    DEY                    // 88
    BPL bank01_sub_9AF0              // 10 F5
    LDY #$02               // A0 02
    LDA $0859,X            // BD 59 08
    JSR bank01_sub_9768              // 20 68 97
    DEY                    // 88
    LDA $0854,X            // BD 54 08
    JSR bank01_sub_9768              // 20 68 97
    DEY                    // 88
bank01_sub_9B0B:
    LDA $084f,X            // BD 4F 08
    JSR bank01_sub_9768              // 20 68 97
    CLC                    // 18
    BIT $38                // 24 38
    RTS                    // 60
    .byte $20, $D3, $DE, $A8, $A2, $04, $BD, $40, $08, $1D, $45, $08, $F0, $04, $CA, $10    // data $9B15
    .byte $F5, $60, $A5, $AC, $9D, $40, $08, $A5, $AD, $9D, $45, $08, $A9, $AA, $9D, $54    // data $9B25
    .byte $08, $9D, $59, $08, $98, $48, $9D, $4A, $08, $A0, $00, $20, $28, $97, $9D, $4F    // data $9B35
    .byte $08, $68, $F0, $11, $C8, $20, $28, $97, $9D, $54, $08, $C8, $20, $28, $97, $9D    // data $9B45
    .byte $59, $08, $B9, $15, $9B, $20, $68, $97, $88, $10, $F7, $A9, $0A, $8D, $EB, $08    // data $9B55
    .byte $60, $C9, $0D, $D0, $13, $A2, $9F, $A0, $85, $20, $9D, $DE, $C9, $AA, $D0, $06    // data $9B65
    .byte $20, $7B, $9B, $A9, $0A, $2C, $A9, $0D, $20, $88, $9B, $A9, $10, $2C, $0D, $DD    // data $9B75
    .byte $F0, $FB, $60    // data $9B85
bank01_sub_9B88:
    STA $dd01              // 8D 01 DD
    LDA $dd0d              // AD 0D DD
    LDA $dd00              // AD 00 DD
    AND #$fb               // 29 FB
    STA $dd00              // 8D 00 DD
    ORA #$04               // 09 04
    STA $dd00              // 8D 00 DD
    RTS                    // 60
bank01_sub_9B9C:
    LDA $dd0c              // AD 0C DD
    AND #$7f               // 29 7F
    STA $dd0c              // 8D 0C DD
    LDA #$3f               // A9 3F
    STA $dd02              // 8D 02 DD
    LDA $dd00              // AD 00 DD
    ORA #$04               // 09 04
    STA $dd00              // 8D 00 DD
    LDA #$00               // A9 00
    STA $dd03              // 8D 03 DD
    RTS                    // 60
bank01_sub_9BB7:
    JSR bank01_sub_9B9C              // 20 9C 9B
    DEC $dd03              // CE 03 DD
    CLC                    // 18
    BIT $dd0c              // 2C 0C DD
    BVS bank01_sub_9BE2              // 70 1F
    JSR bank01_sub_9B88              // 20 88 9B
    LDA #$ff               // A9 FF
    STA $dc07              // 8D 07 DC
    LDA #$19               // A9 19
    STA $dc0f              // 8D 0F DC
    LDA $dc0d              // AD 0D DC
bank01_sub_9BD3:
    LDA $dd0d              // AD 0D DD
    AND #$10               // 29 10
    BNE bank01_sub_9BE2              // D0 08
    LDA $dc0d              // AD 0D DC
    AND #$02               // 29 02
    BEQ bank01_sub_9BD3              // F0 F2
    SEC                    // 38
bank01_sub_9BE2:
    RTS                    // 60
bank01_api_03:
    LDX #$04               // A2 04
    JSR bank01_sub_83B7              // 20 B7 83
    LDX #$04               // A2 04
    JSR bank01_sub_9BF0              // 20 F0 9B
    JMP $de26              // 4C 26 DE
bank01_sub_9BF0:
    TXA                    // 8A
    PHA                    // 48
    JSR $f30f              // 20 0F F3
    BEQ bank01_sub_9BFC              // F0 05
bank01_sub_9BF7:
    PLA                    // 68
    TAX                    // AA
    JMP $f250              // 4C 50 F2
bank01_sub_9BFC:
    JSR $f31f              // 20 1F F3
    LDA $ba                // A5 BA
    CMP #$04               // C9 04
    BNE bank01_sub_9BF7              // D0 F2
    SEI                    // 78
    JSR bank01_sub_9BB7              // 20 B7 9B
    BCS bank01_sub_9BF7              // B0 EC
    LDA #$04               // A9 04
    STA $9a                // 85 9A
    JSR bank01_sub_836F              // 20 6F 83
    LDA $b9                // A5 B9
    AND #$0f               // 29 0F
    CMP #$09               // C9 09
    BEQ bank01_sub_9C1C              // F0 02
    LDA #$00               // A9 00
bank01_sub_9C1C:
    ORA #$c0               // 09 C0
    STA $dd0c              // 8D 0C DD
    PLA                    // 68
    CLC                    // 18
    RTS                    // 60
    .byte $4C, $CA, $F1, $2C, $0C, $DD, $10, $F8, $78, $85, $95, $48, $98, $48, $8A, $48    // data $9C24
    .byte $A9, $FF, $8D, $03, $DD, $20, $48, $9C, $20, $B1, $9B, $68, $AA, $68, $A8, $68    // data $9C34
    .byte $18, $4C, $26, $DE, $A5, $95, $AC, $0C, $DD, $C0, $C9, $F0, $12, $A5, $95, $C9    // data $9C44
    .byte $20, $B0, $13, $C9, $1B, $F0, $08, $C9, $0D, $F0, $04, $C9, $0A, $D0, $03, $4C    // data $9C54
    .byte $66, $9B, $09, $80, $D0, $1F, $A8, $30, $0C, $C9, $60, $90, $04, $29, $DF, $D0    // data $9C64
    .byte $14, $29, $3F, $10, $10, $C9, $FF, $D0, $04, $A9, $5E, $D0, $08, $C9, $A0, $90    // data $9C74
    .byte $02, $49, $C0, $09, $40, $85, $95, $C9, $20, $B0, $04, $C9, $1B, $B0, $1C, $AD    // data $9C84
    .byte $18, $D0, $4A, $4A, $A9, $40, $90, $02, $A9, $60, $85, $A4, $A5, $95, $C5, $A4    // data $9C94
    .byte $B0, $09, $C9, $20, $B0, $02, $05, $A4, $4C, $7D, $9B, $85, $95, $A9, $1B, $20    // data $9CA4
    .byte $7D, $9B, $A9, $4B, $20, $7D, $9B, $A9, $08, $20, $7D, $9B, $A9, $00, $20, $7D    // data $9CB4
    .byte $9B, $A5, $97, $48, $A5, $96, $48, $AD, $18, $D0, $4A, $29, $01, $09, $1A, $85    // data $9CC4
    .byte $97, $A5, $95, $A0, $03, $0A, $26, $97, $88, $D0, $FA, $85, $96, $A9, $80, $85    // data $9CD4
    .byte $A4, $A9, $00, $85, $95, $A5, $01, $AA, $29, $FB, $85, $01, $A0, $07, $B1, $96    // data $9CE4
    .byte $25, $A4, $F0, $07, $A5, $95, $19, $14, $9D, $85, $95, $88, $10, $F0, $86, $01    // data $9CF4
    .byte $A5, $95, $20, $7D, $9B, $46, $A4, $90, $D8, $68, $85, $96, $68, $85, $97, $60    // data $9D04
    .byte $80, $40, $20, $10, $08, $04, $02, $01, $60, $A9, $01, $48, $A9, $6F, $48, $A2    // data $9D14
    .byte $50, $BD, $2F, $9D, $9D, $70, $01, $CA, $10, $F7, $60, $78, $A9, $37, $85, $01    // data $9D24
    .byte $A9, $0A, $8D, $00, $DE, $20, $8A, $FF, $20, $81, $FF, $20, $84, $FF, $A9, $00    // data $9D34
    .byte $8D, $06, $DF, $8D, $02, $DF, $8D, $04, $DF, $8D, $07, $DF, $A9, $08, $8D, $03    // data $9D44
    .byte $DF, $8D, $05, $DF, $A9, $F8, $8D, $08, $DF, $A9, $ED, $8D, $01, $DF, $A9, $34    // data $9D54
    .byte $85, $01, $AD, $00, $FF, $8D, $00, $FF, $A9, $37, $85, $01, $58, $4C, $00, $80    // data $9D64
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D74
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D84
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9D94
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DA4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DB4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DC4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DD4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DE4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9DF4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $A9, $20, $8D, $00    // data $9E04
    .byte $DE, $A5, $01, $8D, $2E, $DE, $09, $03, $85, $01, $A9, $08, $8D, $00, $DE, $68    // data $9E14
    .byte $28, $60, $08, $48, $A9, $20, $8D, $00, $DE, $A9, $37, $85, $01, $A9, $0A, $8D    // data $9E24
    .byte $00, $DE, $68, $28, $58, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E34
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9E44
    .byte $00, $00, $00, $00, $00, $C6, $01, $B1, $BB, $E6, $01, $60, $20, $26, $DE, $A5    // data $9E54
    .byte $93, $90, $03, $4C, $A5, $F4, $4C, $ED, $F5, $38, $24, $18, $85, $93, $20, $97    // data $9E64
    .byte $DE, $4C, $26, $89, $48, $A5, $9A, $C9, $04, $D0, $07, $68, $20, $97, $DE, $4C    // data $9E74
    .byte $27, $9C, $4C, $CD, $F1, $20, $97, $DE, $4C, $EA, $9B, $EA, $EA, $20, $97, $DE    // data $9E84
    .byte $4C, $0F, $80, $78, $08, $48, $4C, $10, $DE, $20, $BA, $DE, $20, $20, $01, $20    // data $9E94
    .byte $97, $DE, $4C, $E1, $8D, $20, $BA, $DE, $20, $97, $DE, $4C, $A2, $9F, $EA, $EA    // data $9EA4
    .byte $EA, $8D, $00, $DE, $68, $60, $48, $78, $A9, $08, $48, $A9, $20, $8D, $00, $DE    // data $9EB4
    .byte $00, $00, $00, $00, $00, $2C, $80, $80, $EA, $A9, $23, $8D, $00, $DE, $00, $08    // data $9EC4
    .byte $78, $48, $A9, $23, $8D, $00, $DE, $2C, $80, $80, $8D, $00, $DE, $68, $40, $EA    // data $9ED4
    .byte $85, $9E, $68, $8D, $00, $DE, $A5, $9E, $60, $08, $00, $08, $10, $18, $20, $0A    // data $9EE4
    .byte $23, $80, $24, $00, $00, $00, $00, $00, $00, $00, $30, $EE, $20, $50, $9F, $30    // data $9EF4
    .byte $80, $60, $8D, $37, $01, $8E, $44, $01, $A2, $AC, $78, $98, $18, $75, $00, $8D    // data $9F04
    .byte $38, $01, $B5, $01, $69, $00, $CD, $63, $01, $B0, $02, $69, $80, $8D, $39, $01    // data $9F14
    .byte $AE, $60, $01, $A9, $08, $B0, $0B, $AD, $12, $D0, $E9, $30, $B0, $F9, $A2, $37    // data $9F24
    .byte $A9, $23, $8D, $00, $DE, $86, $01, $A9, $FF, $8D, $FF, $FF, $A2, $37, $86, $01    // data $9F34
    .byte $A2, $08, $8E, $00, $DE, $A2, $FF, $29, $FF, $60    // data $9F44
bank01_sub_9F4E:
    NOP                    // EA
    NOP                    // EA
bank01_sub_9F50:
    NOP                    // EA
bank01_sub_9F51:
    NOP                    // EA
    NOP                    // EA
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
    BNE bank01_sub_9F76              // D0 02
    DEC $9f                // C6 9F
bank01_sub_9F76:
    DEC $9e                // C6 9E
    LDY #$00               // A0 00
    LDA ($9e),Y            // B1 9E
    SEC                    // 38
    SBC #$4e               // E9 4E
    TAX                    // AA
    LDA #$08               // A9 08
    PHA                    // 48
    LDA #$de               // A9 DE
    PHA                    // 48
    LDA #$e2               // A9 E2
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
    .byte $A9, $00, $85, $0D, $20, $73, $00, $C9, $24, $90, $04, $C9, $27, $90, $0C, $A9    // data $9FA2
    .byte $AE, $48, $A9, $8C, $48, $20, $79, $00, $4C, $26, $DE, $85, $9E, $A9, $00, $A2    // data $9FB2
    .byte $0A, $95, $5D, $CA, $10, $FB, $20, $73, $00, $A4, $9E, $90, $06, $C9, $41, $90    // data $9FC2
    .byte $1F, $E9, $08, $E9, $2F, $D9, $D2, $9F, $B0, $16, $48, $A5, $61, $F0, $0A, $79    // data $9FD2
    .byte $D6, $9F, $90, $03, $4C, $7E, $B9, $85, $61, $68, $20, $7E, $BD, $4C, $C8, $9F    // data $9FE2
    .byte $18, $4C, $26, $DE, $10, $02, $08, $00, $04, $01, $03, $00, $00, $00    // data $9FF2
