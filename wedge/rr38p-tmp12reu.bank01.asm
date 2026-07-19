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

bank01_data_8000:
.errorif (* != $8000), "bank01_data_8000 shifted"
    .byte $09, $80, $0C, $80, $C3, $C2, $CD, $38, $30    // data $8000
bank01_cold_start:
    jmp bank01_api_00              // 4C 5B 80
bank01_warm_start:
    jmp bank01_api_01              // 4C B9 80
bank01_data_800F:
.errorif (* != $800F), "bank01_data_800F shifted"
    .byte $4C, $D0, $83, $4C, $E3, $9B, $4C, $D2, $82, $4C, $B3, $82, $4C, $1D, $83, $4C    // data $800F
    .byte $9A, $89    // data $801F
bank01_api_08:
    jmp bank01_api_08              // 4C 21 80
bank01_data_8024:
.errorif (* != $8024), "bank01_data_8024 shifted"
    .byte $4C, $41, $83, $4C, $64, $99, $4C, $66, $99    // data $8024
bank01_sub_802D:
    lda $0303              // AD 03 03
    cmp #$de               // C9 DE
    bne bank01_sub_805A              // D0 26
    ldx #$01               // A2 01
    lda $0302              // AD 02 03   IMAIN vector (BASIC idle loop)
    cmp #$8f               // C9 8F
    beq bank01_sub_805A              // F0 1D
    lda #$80               // A9 80
    pha                    // 48
    lda #$0e               // A9 0E
    pha                    // 48
    lda $deee,x            // BD EE DE
    jmp $dee7              // 4C E7 DE
bank01_data_8049:
.errorif (* != $8049), "bank01_data_8049 shifted"
    .byte $20, $DC, $90, $A0, $1F, $B1, $BB, $99, $30, $02, $88, $10, $F8, $A9, $30, $85    // data $8049
    .byte $BB    // data $8059
bank01_sub_805A:
    rts                    // 60
bank01_api_00:
    sei                    // 78
    ldx #$fb               // A2 FB
    cld                    // D8
    txs                    // 9A
    jsr $fda3              // 20 A3 FD   KERNAL IOINIT guts
    jsr bank01_sub_9F51              // 20 51 9F
    .byte $09, $80         // inline arg: cross-bank call target $8009
    jsr $ff5b              // 20 5B FF   KERNAL CINT guts (video init)
    jsr $e453              // 20 53 E4   BASIC copy vectors to $0300
    jsr bank01_api_06              // 20 1D 83
    jsr $e3bf              // 20 BF E3   BASIC init RAM/CHRGET
    jsr $e422              // 20 22 E4
    jsr bank01_sub_83CA              // 20 CA 83
    jsr bank01_sub_9F51              // 20 51 9F
    .byte $48, $80         // inline arg: cross-bank call target $8048 (bank03 version-line print)
    lda #$e3               // A9 E3
    pha                    // 48
    lda #$85               // A9 85
    sta $0313              // 8D 13 03
    pha                    // 48
bank01_sub_8088:
    bit $c5                // 24 C5   last key
    bvc bank01_sub_8088              // 50 FC
    ldx #$9f               // A2 9F
    ldy #$80               // A0 80
    lda #$00               // A9 00
    sta $030f              // 8D 0F 03
    sta $c6                // 85 C6   keyboard buffer count
    jsr $dea9              // 20 A9 DE
    ldx #$95               // A2 95
    ldy #$99               // A0 99
    jsr $de9d              // 20 9D DE
    cmp #$01               // C9 01
    beq bank01_sub_80B3              // F0 0E
    ldx #$03               // A2 03
    ldy #$03               // A0 03
bank01_sub_80A9:
    lda $8309,x            // BD 09 83
    sta $0330,y            // 99 30 03   ILOAD vector
    dex                    // CA
    dey                    // 88
    bpl bank01_sub_80A9              // 10 F6
bank01_sub_80B3:
    jsr $de97              // 20 97 DE
    jmp $de26              // 4C 26 DE
bank01_api_01:
    jsr bank01_sub_802D              // 20 2D 80
    jsr $f6bc              // 20 BC F6
    jsr $f6ed              // 20 ED F6
    beq bank01_sub_80C7              // F0 03
    jmp $fe72              // 4C 72 FE
bank01_sub_80C7:
    ldx #$00               // A2 00
bank01_sub_80C9:
    dex                    // CA
    nop                    // EA
    bne bank01_sub_80C9              // D0 FC
    stx $dd0c              // 8E 0C DD
    jsr bank01_sub_9F51              // 20 51 9F
    .byte $1E, $80         // inline arg: cross-bank call target $801E
    jsr bank01_api_06              // 20 1D 83   ($831D)
    jsr $fda3              // 20 A3 FD   KERNAL IOINIT guts
    jsr $e518              // 20 18 E5   KERNAL screen init
    jmp ($a002)            // 6C 02 A0   BASIC warm start vector
// --- $80E4: small cross-bank thunks
    jsr bank01_sub_9F51              // 20 51 9F
    .byte $3C, $80         // inline arg: cross-bank call target $803C
    rts                    // 60
bank01_data_80E7:
.errorif (* != $80E7), "bank01_data_80E7 shifted"
    jsr $9f55              // 20 55 9F   cross-bank stub, bank 7
    .byte $0F, $80         // inline arg: cross-bank call target $800F
    jmp $0400              // 4C 00 04   screen RAM
    jsr $9f51              // 20 51 9F   cross-bank stub
    .byte $87, $80         // inline arg: cross-bank call target $8087
    pla                    // 68
    tax                    // AA
    pla                    // 68
    tay                    // A8
    lda #$cd               // A9 CD
    pha                    // 48
    lda #$ff               // A9 FF
    pha                    // 48
    tya                    // 98
    pha                    // 48
    txa                    // 8A
    pha                    // 48
    jmp $de26              // 4C 26 DE   trampoline in mirrored $9E26 page
    jsr $9f55              // 20 55 9F   cross-bank stub, bank 7
    .byte $12, $80         // inline arg: cross-bank call target $8012
    jmp $0400              // 4C 00 04   screen RAM
    jsr $9f51              // 20 51 9F   cross-bank stub
    .byte $69, $80         // inline arg: cross-bank call target $8069
    jmp $de26              // 4C 26 DE   trampoline in mirrored $9E26 page
bank01_sub_8115:
    pha                    // 48
    lda #$7f               // A9 7F
    sta $dc00              // 8D 00 DC   CIA1 port A (keyboard cols / joy2)
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    cmp #$df               // C9 DF
    bne bank01_sub_8162              // D0 40
    lda #$bd               // A9 BD
    sta $dc00              // 8D 00 DC   CIA1 port A (keyboard cols / joy2)
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    cmp #$ff               // C9 FF
    bne bank01_sub_8162              // D0 34
    lda #$fe               // A9 FE
    sta $dc00              // 8D 00 DC   CIA1 port A (keyboard cols / joy2)
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    cmp #$ef               // C9 EF
    beq bank01_sub_8147              // F0 0D
    cmp #$df               // C9 DF
    bne bank01_sub_8162              // D0 24
    jsr bank01_sub_9F4E              // 20 4E 9F
    .byte $63, $80         // inline arg: cross-bank call target $8063
    lda #$9a               // A9 9A
    bne bank01_sub_814E              // D0 07
bank01_sub_8147:
    jsr bank01_sub_9F4E              // 20 4E 9F
    .byte $60, $80         // inline arg: cross-bank call target $8060
    lda #$9a               // A9 9A
bank01_data_814B:
bank01_sub_814E:
    ldy #$04               // A0 04
    ldx #$04               // A2 04
    jsr bank01_sub_9F4E              // 20 4E 9F
    .byte $12, $80         // inline arg: cross-bank call target $8012
    jsr bank01_sub_9F4E              // 20 4E 9F
    .byte $60, $80         // inline arg: cross-bank call target $8060
    pla                    // 68
    pla                    // 68
    pla                    // 68
    jmp $873f              // 4C 3F 87
bank01_data_815B:
bank01_sub_8162:
    pla                    // 68
    rts                    // 60
bank01_data_8164:
.errorif (* != $8164), "bank01_data_8164 shifted"
    jsr $b7eb              // 20 EB B7
    stx $02                // 86 02
    lda $14                // A5 14
    sta $fd                // 85 FD
    lda $15                // A5 15
    sta $fe                // 85 FE
    jsr $9f51              // 20 51 9F
    .byte $39, $80         // inline arg: cross-bank call target $8039
    rts                    // 60
    jsr b01_81DD           // 20 DD 81
    jsr $aefd              // 20 FD AE
    jsr $81f8              // 20 F8 81
    stx $5f                // 86 5F
    sty $60                // 84 60
    lda #$61               // A9 61
    sta $b9                // 85 B9   secondary addr
    lda $ba                // A5 BA   current device
    cmp #$08               // C9 08
    bcs b01_8191           // B0 03
    jmp $f713              // 4C 13 F7
b01_8191:
    lda $b7                // A5 B7   filename length
    bne b01_8198           // D0 03
    jmp $f710              // 4C 10 F7
b01_8198:
    jsr $8914              // 20 14 89
    bcc b01_81A0           // 90 03
    jmp $e0f9              // 4C F9 E0
b01_81A0:
    jsr $9f53              // 20 53 9F
    .byte $D5, $F3         // inline arg: cross-bank call target $F3D5
    lda $ba                // A5 BA   current device
    jsr $ffb1              // 20 B1 FF   KERNAL LISTEN
    lda $b9                // A5 B9   secondary addr
    jsr $ff93              // 20 93 FF   KERNAL SECOND
    ldx $c1                // A6 C1   I/O start addr lo
    ldy $c2                // A4 C2   I/O start addr hi
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    ldx $2b                // A6 2B   BASIC prog start lo
    ldy $2c                // A4 2C   BASIC prog start hi
    jsr $8227              // 20 27 82
    ldy #$00               // A0 00
b01_81BF:
    jsr $de59              // 20 59 DE
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    inc $bb                // E6 BB   filename ptr lo
    bne b01_81CB           // D0 02
    inc $bc                // E6 BC   filename ptr hi
b01_81CB:
    lda $bb                // A5 BB   filename ptr lo
    cmp $5f                // C5 5F
    lda $bc                // A5 BC   filename ptr hi
    sbc $60                // E5 60
    bcc b01_81BF           // 90 EA
    ldx #$00               // A2 00
    jsr $8227              // 20 27 82
    jmp $f642              // 4C 42 F6
b01_81DD:
    jsr $90dc              // 20 DC 90
    beq $81eb              // F0 09
    jsr $aefd              // 20 FD AE
    jsr $b79e              // 20 9E B7
    stx $ba                // 86 BA   current device
    rts                    // 60
bank01_sub_81EB:
    ldx $ba                // A6 BA   current device
    cpx #$08               // E0 08
    bcs bank01_sub_81F3              // B0 02
    ldx #$08               // A2 08
bank01_sub_81F3:
    stx $ba                // 86 BA   current device
    jmp $0079              // 4C 79 00
bank01_data_81F8:
.errorif (* != $81F8), "bank01_data_81F8 shifted"
    .byte $20, $51, $9F, $60, $80, $60, $20, $51, $9F, $5D, $80, $A9, $11, $8D, $02, $03    // data $81F8
    .byte $A9, $82, $8D, $03, $03, $38, $4C, $A9, $A4, $20, $51, $9F, $63, $80, $20, $6F    // data $8208
    .byte $A6, $4C, $7B, $E3    // data $8218
bank01_sub_821C:
    inc $0302              // EE 02 03   IMAIN vector (BASIC idle loop)
    jsr bank01_sub_9F51              // 20 51 9F
    .byte $66, $80         // inline arg: cross-bank call target $8066
    jmp $a66f              // 4C 6F A6
bank01_data_8227:
.errorif (* != $8227), "bank01_data_8227 shifted"
    txa                    // 8A
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    tya                    // 98
    jmp $ffa8              // 4C A8 FF   KERNAL CIOUT: serial byte out
    jsr $81dd              // 20 DD 81
    jsr $83a6              // 20 A6 83
    lda $2d                // A5 2D   BASIC vars start lo
    sec                    // 38
    sbc #$02               // E9 02
    tax                    // AA
    lda $2e                // A5 2E   BASIC vars start hi
    sbc #$00               // E9 00
    tay                    // A8
    lda #$00               // A9 00
    sta $b9                // 85 B9   secondary addr
    sta $0a                // 85 0A
    jmp $e175              // 4C 75 E1
    jsr b01_8254           // 20 54 82
    jsr $8049              // 20 49 80
    jsr $84ce              // 20 CE 84
    bpl b01_8283           // 10 2F
b01_8254:
    ldx #$04               // A2 04
    stx $c6                // 86 C6   keyboard buffer count
b01_8258:
    lda $88bd,x            // BD BD 88
    sta $0276,x            // 9D 76 02
    dex                    // CA
    bne b01_8258           // D0 F7
    rts                    // 60
    jsr $83a6              // 20 A6 83
    jsr b01_8254           // 20 54 82
    stx $0a                // 86 0A
    stx $b9                // 86 B9   secondary addr
    jsr $8049              // 20 49 80
    jsr $9f53              // 20 53 9F
    .byte $6F, $E1         // inline arg: cross-bank call target $E16F
    lda #$00               // A9 00
    bit $01a9              // 2C A9 01
    ldx #$01               // A2 01
    pha                    // 48
    jsr $8049              // 20 49 80
    pla                    // 68
    jsr $84d2              // 20 D2 84
b01_8283:
    bne b01_8291           // D0 0C
    lda $0a                // A5 0A
    beq b01_828C           // F0 03
    jmp $e17a              // 4C 7A E1
b01_828C:
    jsr $9f53              // 20 53 9F
    .byte $7A, $E1         // inline arg: cross-bank call target $E17A
b01_8291:
    lda #$00               // A9 00
    sta $c6                // 85 C6   keyboard buffer count
    jmp $e18d              // 4C 8D E1
    jsr $8049              // 20 49 80
    jmp $e159              // 4C 59 E1
    bcs b01_82A6           // B0 06
    jsr $82b6              // 20 B6 82
    jsr $0079              // 20 79 00
b01_82A6:
    beq $82df              // F0 37
    cmp #$50               // C9 50
    bne b01_82AF           // D0 03
    jmp $9d1c              // 4C 1C 9D
b01_82AF:
    cmp #$23               // C9 23
    bne $82df              // D0 2C
bank01_api_05:
    jsr $0073              // 20 73 00
bank01_sub_82B6:
    jsr $b79e              // 20 9E B7
    cpx #$08               // E0 08
    bcc bank01_sub_82C4              // 90 07
    cpx #$1f               // E0 1F
    bcs bank01_sub_82C4              // B0 03
    stx $ba                // 86 BA   current device
    rts                    // 60
bank01_sub_82C4:
    jsr $f713              // 20 13 F7
    jmp $e0f9              // 4C F9 E0
bank01_data_82CA:
.errorif (* != $82CA), "bank01_data_82CA shifted"
    .byte $20, $51, $9F, $36, $80, $4C, $F0, $82    // data $82CA
bank01_api_04:
    bcs bank01_sub_82DD              // B0 09
    jsr bank01_sub_82B6              // 20 B6 82
    lda #$24               // A9 24
    sta ($7a),y            // 91 7A
    inc $7a                // E6 7A   TXTPTR lo
bank01_sub_82DD:
    dec $7a                // C6 7A   TXTPTR lo
    jsr bank01_sub_90DC              // 20 DC 90
    jsr bank01_sub_81EB              // 20 EB 81
    jsr bank01_sub_9F50              // 20 50 9F
    .byte $1B, $80         // inline arg: cross-bank call target $801B
    rts                    // 60
bank01_data_82EB:
.errorif (* != $82EB), "bank01_data_82EB shifted"
    jsr $9f51              // 20 51 9F
    .byte $12, $80         // inline arg: cross-bank call target $8012
    bcc $82ea              // 90 F8
    jmp $e0f9              // 4C F9 E0
    ldx #$03               // A2 03
    bit $07a2              // 2C A2 07
    ldy #$03               // A0 03
b01_82FC:
    lda $8309,x            // BD 09 83
    sta $0330,y            // 99 30 03   ILOAD vector
    dex                    // CA
    dey                    // 88
    bpl b01_82FC           // 10 F6
    jmp $e18d              // 4C 8D E1
    .byte $67    // 67  undocumented/illegal at $8309
    dec $de6a,x            // DE 6A DE
    adc $6fde              // 6D DE 6F
    dec $eda9,x            // DE A9 ED
    ldx #$f6               // A2 F6
    sei                    // 78
    sta $0328              // 8D 28 03   ISTOP vector
    stx $0329              // 8E 29 03
    rts                    // 60
bank01_api_06:
    jsr $e453              // 20 53 E4   BASIC copy vectors to $0300
    ldy #$de               // A0 DE
    ldx #$8f               // A2 8F
    stx $0302              // 8E 02 03   IMAIN vector (BASIC idle loop)
    sty $0303              // 8C 03 03
    ldx #$ac               // A2 AC
    stx $030a              // 8E 0A 03
    sty $030b              // 8C 0B 03
    lda $0317              // AD 17 03
    cmp #$fe               // C9 FE
    bne bank01_api_09              // D0 08
    ldx #$cd               // A2 CD
    stx $0316              // 8E 16 03   CBINV BRK vector
    sty $0317              // 8C 17 03
bank01_api_09:
    ldy #$de               // A0 DE
    lda $0331              // AD 31 03
    cmp #$f4               // C9 F4
    bne bank01_sub_8352              // D0 08
    ldx #$6d               // A2 6D
    stx $0330              // 8E 30 03   ILOAD vector
    sty $0331              // 8C 31 03
bank01_sub_8352:
    lda $0333              // AD 33 03
    cmp #$f5               // C9 F5
    bne bank01_sub_8361              // D0 08
    ldx #$6f               // A2 6F
    stx $0332              // 8E 32 03   ISAVE vector
    sty $0333              // 8C 33 03
bank01_sub_8361:
    jmp $de97              // 4C 97 DE
bank01_sub_8364:
    lda #$89               // A9 89
    sta $0320              // 8D 20 03
    lda #$de               // A9 DE
    sta $0321              // 8D 21 03
    rts                    // 60
bank01_sub_836F:
    php                    // 08
    pha                    // 48
    lda $0321              // AD 21 03
    cmp #$de               // C9 DE
    bne bank01_sub_8382              // D0 0A
    lda #$78               // A9 78
    sta $0326              // 8D 26 03
    lda #$de               // A9 DE
    sta $0327              // 8D 27 03
bank01_sub_8382:
    pla                    // 68
    plp                    // 28
    rts                    // 60
bank01_sub_8385:
    pha                    // 48
    lda #$50               // A9 50
    sta $0320              // 8D 20 03
    lda #$f2               // A9 F2
    sta $0321              // 8D 21 03
    bne bank01_sub_839A              // D0 08
    pha                    // 48
    lda $0321              // AD 21 03
    cmp #$de               // C9 DE
    bne bank01_sub_83A4              // D0 0A
bank01_sub_839A:
    lda #$ca               // A9 CA
    sta $0326              // 8D 26 03
    lda #$f1               // A9 F1
    sta $0327              // 8D 27 03
bank01_sub_83A4:
    pla                    // 68
    rts                    // 60
bank01_sub_83A6:
    lda #$0a               // A9 0A
    bit $08a9              // 2C A9 08
bank01_sub_83AB:
    bit $d011              // 2C 11 D0   VIC control 1 (screen on/off, YSCROLL)
    bpl bank01_sub_83AB              // 10 FB
    ldx #$de               // A2 DE
    ldy #$32               // A0 32
    jmp $dea9              // 4C A9 DE
bank01_sub_83B7:
    lda #$04               // A9 04
    ldy #$ff               // A0 FF
    jsr $ffba              // 20 BA FF   KERNAL SETLFS: set file/dev/sec
    cpx #$04               // E0 04
    bne bank01_sub_83C5              // D0 03
    jsr bank01_sub_8364              // 20 64 83
bank01_sub_83C5:
    lda #$00               // A9 00
    jmp bank01_sub_995E              // 4C 5E 99
bank01_sub_83CA:
    jsr bank01_sub_9F51              // 20 51 9F
    .byte $2A, $80         // inline arg: cross-bank call target $802A
    rts                    // 60
bank01_api_02:
    lda $0302              // AD 02 03   IMAIN vector (BASIC idle loop)
    bne bank01_sub_83D8              // D0 03
    jmp bank01_sub_821C              // 4C 1C 82
bank01_sub_83D8:
    jsr bank01_sub_802D              // 20 2D 80
    jsr bank01_api_06              // 20 1D 83
    jsr bank01_sub_83CA              // 20 CA 83
    lda $0313              // AD 13 03
    bne bank01_sub_83E9              // D0 03
    jmp bank01_sub_8E58              // 4C 58 8E
bank01_sub_83E9:
    jsr bank01_sub_83A6              // 20 A6 83
    jsr bank01_sub_8385              // 20 85 83
    cli                    // 58
    lda #$01               // A9 01
    sta $dc0e              // 8D 0E DC   CIA1 CRA
    jsr bank01_sub_8886              // 20 86 88
    stx $7a                // 86 7A   TXTPTR lo
    sty $7b                // 84 7B   TXTPTR hi
    jsr $0073              // 20 73 00
// --- HONDANI hook (wedge step 2): same-size swap of "tax / bne $8407" ------
    jmp hondani_check      // 4C 74 9D  (was: AA D0 05)
hondani_return_zero:
.errorif (* != $8402), "hondani hook site shifted"
    stx $0258              // 8E 58 02
    beq bank01_api_02              // F0 C9
bank01_sub_8407:
    ldx #$ff               // A2 FF
    stx $3a                // 86 3A
    bcs bank01_sub_8457              // B0 4A
    ldx $0258              // AE 58 02
    bne bank01_sub_841C              // D0 0A
    tax                    // AA
    lda #$a4               // A9 A4
    pha                    // 48
    lda #$9b               // A9 9B
    pha                    // 48
    jmp bank01_sub_8450              // 4C 50 84
bank01_sub_841C:
    jsr $a96b              // 20 6B A9
    beq bank01_sub_843D              // F0 1C
    ldy $14                // A4 14
    cpy $0255              // CC 55 02
    lda $15                // A5 15
    tax                    // AA
    sbc $0256              // ED 56 02
    bcc bank01_sub_8444              // 90 16
    tya                    // 98
    clc                    // 18
    adc $0257              // 6D 57 02
    sta $0255              // 8D 55 02
    bcc bank01_sub_8439              // 90 01
    inx                    // E8
bank01_sub_8439:
    cpx #$fa               // E0 FA
    bcc bank01_sub_8444              // 90 07
bank01_sub_843D:
    lda #$00               // A9 00
    sta $0258              // 8D 58 02
    beq bank01_sub_844A              // F0 06
bank01_sub_8444:
    stx $0256              // 8E 56 02
    jsr bank01_sub_86F8              // 20 F8 86
bank01_sub_844A:
    lda #$a4               // A9 A4
    pha                    // 48
    lda #$9e               // A9 9E
    pha                    // 48
bank01_sub_8450:
    jsr bank01_sub_8364              // 20 64 83
    txa                    // 8A
    jmp $de26              // 4C 26 DE
bank01_sub_8457:
    stx $96                // 86 96
bank01_sub_8459:
    inc $96                // E6 96
    ldy #$ff               // A0 FF
bank01_sub_845D:
    iny                    // C8
    inx                    // E8
    lda $8507,x            // BD 07 85
    bne bank01_sub_846C              // D0 08
    lda #$a4               // A9 A4
    pha                    // 48
    lda #$95               // A9 95
    pha                    // 48
    bne bank01_sub_8450              // D0 E4
bank01_sub_846C:
    php                    // 08
    and #$7f               // 29 7F
    cmp ($7a),y            // D1 7A
    beq bank01_sub_847E              // F0 0B
    plp                    // 28
    bmi bank01_sub_8459              // 30 E3
bank01_sub_8476:
    inx                    // E8
    lda $8507,x            // BD 07 85
    bpl bank01_sub_8476              // 10 FA
    bmi bank01_sub_8459              // 30 DB
bank01_sub_847E:
    plp                    // 28
    bmi bank01_sub_848D              // 30 0C
    cpy #$02               // C0 02
    bne bank01_sub_845D              // D0 D8
bank01_sub_8485:
    iny                    // C8
    lda ($7a),y            // B1 7A
    cmp #$41               // C9 41
    bcs bank01_sub_8485              // B0 F9
    dey                    // 88
bank01_sub_848D:
    tya                    // 98
    clc                    // 18
    adc $7a                // 65 7A   TXTPTR lo
    sta $7a                // 85 7A   TXTPTR lo
    jsr $83a9              // 20 A9 83
    ldy #$00               // A0 00
    sty $b9                // 84 B9   secondary addr
    lda $96                // A5 96
    asl                  // 0A
    tax                    // AA
    lda #$e3               // A9 E3
    pha                    // 48
    lda #$7a               // A9 7A
    pha                    // 48
    lda $8573,x            // BD 73 85
    pha                    // 48
    lda $8572,x            // BD 72 85
    pha                    // 48
    jmp $0073              // 4C 73 00
bank01_data_84AF:
.errorif (* != $84AF), "bank01_data_84AF shifted"
    jsr $81dd              // 20 DD 81
    jsr b01_84CE           // 20 CE 84
    bne b01_84BA           // D0 03
    jmp $e17a              // 4C 7A E1
b01_84BA:
    lda $c4                // A5 C4
    pha                    // 48
    lda $c3                // A5 C3
    pha                    // 48
    php                    // 08
    pha                    // 48
    lda $def3              // AD F3 DE
    jmp $dede              // 4C DE DE
    jsr $9f51              // 20 51 9F
    .byte $27, $80         // inline arg: cross-bank call target $8027
    rts                    // 60
b01_84CE:
    ldx #$01               // A2 01
    lda #$00               // A9 00
    stx $b9                // 86 B9   secondary addr
    sta $0a                // 85 0A
    ldx $2b                // A6 2B   BASIC prog start lo
    ldy $2c                // A4 2C   BASIC prog start hi
    jsr $9f4f              // 20 4F 9F
    .byte $D5, $FF         // inline arg: cross-bank call target $FFD5
    bcc b01_84E4           // 90 03
    jmp $e0f9              // 4C F9 E0
b01_84E4:
    lda $90                // A5 90   KERNAL I/O status
    and #$bf               // 29 BF
    beq b01_84ED           // F0 03
    jmp $e17a              // 4C 7A E1
b01_84ED:
    lda $0330              // AD 30 03   ILOAD vector
    cmp #$67               // C9 67
    beq b01_8506           // F0 12
    lda $c3                // A5 C3
    cmp $2b                // C5 2B   BASIC prog start lo
    bne b01_8500           // D0 06
    lda $c4                // A5 C4
    cmp $2c                // C5 2C   BASIC prog start hi
    beq b01_8506           // F0 06
b01_8500:
    lda #$00               // A9 00
    sta $c6                // 85 C6   keyboard buffer count
    lda #$01               // A9 01
b01_8506:
    rts                    // 60
// --- $850E-$85A9: BASIC extension command table ---------------------------
// Keywords with the last character OR'd with $80 as terminator:
//   OLD DELETE LINESAVE MERGE AUTO MONITOR APPEND COPY BOOT ZAP BACKUP
//   PLIST SLIST ON OFF FIND RENUM INFO TASS SSGET TOOL
// ($00 end marker at $8572, then one handler address lo/hi per keyword
// from $8573: OLD=$8273 DELETE=$82D1 LINESAVE=$8248 MERGE=$8261 AUTO=$9D1C
//  MONITOR=$829D APPEND=$8276 COPY=$821E BOOT=$81FD ZAP=$8176 BACKUP=$8617
//  PLIST=$86D4 SLIST=$8997 ON=$822E OFF=$82EA FIND=$84AE RENUM=$84C7
//  INFO=$82C9 TASS=$85AC SSGET=$85A9 TOOL=$82F7; the remaining pairs
//  ($82F4,$80E0,$8163,$810C,$80E6,$80EE,$8104) serve the single-char
//  commands like % / $ etc.)
// The $8507 bytes just before are shifted-letter first-chars used by the
// tokenizer's quick match.
bank01_data_8507:
.errorif (* != $8507), "bank01_data_8507 shifted"
    .byte $AF, $A4, $A5, $DE, $DC, $C0, $A6, $4F    // data $8507
    .byte $4C, $C4, $44, $45, $4C, $45, $54, $C5, $4C, $49, $4E, $45, $53, $41, $56, $C5    // data $850F
    .byte $4D, $45, $52, $47, $C5, $41, $55, $54, $CF, $4D, $4F, $4E, $49, $54, $4F, $D2    // data $851F
    .byte $41, $50, $50, $45, $4E, $C4, $43, $4F, $50, $D9, $42, $4F, $4F, $D4, $5A, $41    // data $852F
    .byte $D0, $42, $41, $43, $4B, $55, $D0, $50, $4C, $49, $53, $54, $A2, $53, $4C, $49    // data $853F
    .byte $53, $54, $A2, $4F, $CE, $4F, $46, $C6, $46, $49, $4E, $C4, $52, $45, $4E, $55    // data $854F
    .byte $CD, $49, $4E, $46, $CF, $54, $41, $53, $D3, $53, $53, $47, $45, $D4, $54, $4F    // data $855F
    .byte $4F, $CC, $00, $73, $82, $D1, $82, $48, $82, $61, $82, $1C, $9D, $9D, $82, $76    // data $856F
    .byte $82, $1E, $82, $FD, $81, $76, $81, $17, $86, $D4, $86, $97, $89, $2E, $82, $EA    // data $857F
    .byte $82, $AE, $84, $C7, $84, $C9, $82, $AC, $85, $A9, $85, $F7, $82, $F4, $82, $E0    // data $858F
    .byte $80, $63, $81, $0C, $81, $E6, $80    // data $859F ($859F-$85A5)
    // SS-launch single-char command retargeted $80EE -> $80E5 (dispatch rts-trick target
    // +1 => the $80E6 rts no-op). Silversurfer (RS232) removed -- dead on C64U. Was $EE.
    // See conversion_log3 step 3a + space_map.md §5.1. Same-size 1-byte data patch.
    .byte $E5                                  // $85A6 (SS-launch -> $80E6 rts no-op)
    .byte $80, $04, $81                        // $85A7-$85A9 (unchanged: hi=$80; $8104)
    lda #$03               // A9 03
    bit $04a9              // 2C A9 04
    sta $bd                // 85 BD
    jsr $81dd              // 20 DD 81
    jsr $88dd              // 20 DD 88
    jsr $ffcc              // 20 CC FF   KERNAL CLRCHN
    ldx $bd                // A6 BD
    jsr $83b7              // 20 B7 83
    lda #$c9               // A9 C9
    ldy #$85               // A0 85
    sta $0300              // 8D 00 03   IERROR vector
    sty $0301              // 8C 01 03
b01_85C9:
    lda $dc01              // AD 01 DC   CIA1 port B (keyboard rows / joy1)
    bpl b01_85F5           // 10 27
    and #$10               // 29 10
    beq b01_85C9           // F0 F7
    jsr b01_869A           // 20 9A 86
    bcs b01_85F5           // B0 1E
    jsr $ffcc              // 20 CC FF   KERNAL CLRCHN
    ldx #$04               // A2 04
    jsr $9bea              // 20 EA 9B
    ldy #$ff               // A0 FF
    sty $14                // 84 14
    sty $15                // 84 15
    iny                    // C8
    sty $01fd              // 8C FD 01
    iny                    // C8
    sty $0f                // 84 0F
    sty $60                // 84 60
    lda #$fc               // A9 FC
    sta $5f                // 85 5F
    jmp $a6d4              // 4C D4 A6
b01_85F5:
    ldx #$04               // A2 04
    jsr $9bea              // 20 EA 9B
    jsr $8ea3              // 20 A3 8E
    lda #$04               // A9 04
    jsr $ffc3              // 20 C3 FF   KERNAL CLOSE
b01_8602:
    jsr $831d              // 20 1D 83
    lda #$03               // A9 03
    jsr $ffc3              // 20 C3 FF   KERNAL CLOSE
    ldx #$01               // A2 01
    stx $01fc              // 8E FC 01
    stx $01fd              // 8E FD 01
    dex                    // CA
    stx $c6                // 86 C6   keyboard buffer count
    jmp $ffcc              // 4C CC FF   KERNAL CLRCHN
    jsr $81dd              // 20 DD 81
    jsr $0079              // 20 79 00
    tax                    // AA
    beq b01_8627           // F0 06
    jsr $aefd              // 20 FD AE
    jsr $b7eb              // 20 EB B7
b01_8627:
    stx $96                // 86 96
    jsr $88dd              // 20 DD 88
    lda $14                // A5 14
    sta $c3                // 85 C3
    lda $15                // A5 15
    sta $c4                // 85 C4
    jsr $ffcc              // 20 CC FF   KERNAL CLRCHN
    jsr $9985              // 20 85 99
    .byte $4D, $45, $52, $47, $49, $4E, $47, $00    // data $863A  text: "MERGING."
    ldx #$05               // A2 05
b01_8644:
    lda $86cf,x            // BD CF 86
    sta $0150,x            // 9D 50 01
    dex                    // CA
    bpl b01_8644           // 10 F7
    lda #$50               // A9 50
    ldy #$01               // A0 01
    sta $0302              // 8D 02 03   IMAIN vector (BASIC idle loop)
    sty $0303              // 8C 03 03
    sta $0300              // 8D 00 03   IERROR vector
    sty $0301              // 8C 01 03
b01_865D:
    bit $dc01              // 2C 01 DC   CIA1 port B (keyboard rows / joy1)
    bpl b01_8694           // 10 32
    inc $98                // E6 98
    jsr b01_869A           // 20 9A 86
    bcs b01_8694           // B0 2B
    lda $01fd              // AD FD 01
    beq b01_8694           // F0 26
    lda $01fe              // AD FE 01
    ldx $01ff              // AE FF 01
    ldy $96                // A4 96
    beq b01_8687           // F0 0F
    lda $c3                // A5 C3
    tay                    // A8
    ldx $c4                // A6 C4
    clc                    // 18
    adc $96                // 65 96
    sta $c3                // 85 C3
    bcc b01_8686           // 90 02
    inc $c4                // E6 C4
b01_8686:
    tya                    // 98
b01_8687:
    sta $14                // 85 14
    stx $15                // 86 15
    sta $01fe              // 8D FE 01
    stx $01ff              // 8E FF 01
    jsr $a4a4              // 20 A4 A4
b01_8694:
    jsr b01_8602           // 20 02 86
    jmp $e37b              // 4C 7B E3
b01_869A:
    jsr $ffcc              // 20 CC FF   KERNAL CLRCHN
    ldx #$03               // A2 03
    jsr $ffc6              // 20 C6 FF   KERNAL CHKIN
    ldy #$00               // A0 00
b01_86A4:
    jsr $ffcf              // 20 CF FF   KERNAL CHRIN
    sta $01fc,y            // 99 FC 01
    ldx $90                // A6 90   KERNAL I/O status
    bne b01_86CA           // D0 1C
    cpy #$04               // C0 04
    bcc b01_86C3           // 90 11
    clc                    // 18
    tax                    // AA
    beq b01_86CB           // F0 15
    cmp #$12               // C9 12
    beq b01_86C3           // F0 09
    cmp #$20               // C9 20
    bcs b01_86C3           // B0 05
    lda #$20               // A9 20
    sta $01fc,y            // 99 FC 01
b01_86C3:
    cpy #$5c               // C0 5C
    bcs b01_86A4           // B0 DD
    iny                    // C8
    bne b01_86A4           // D0 DA
b01_86CA:
    sec                    // 38
b01_86CB:
    iny                    // C8
    sty $0b                // 84 0B
    rts                    // 60
    jsr $de97              // 20 97 DE
    jmp b01_865D           // 4C 5D 86
    beq b01_86ED           // F0 16
    jsr $b7eb              // 20 EB B7
    txa                    // 8A
    bne b01_86E0           // D0 03
    jmp $af08              // 4C 08 AF
b01_86E0:
    lda $14                // A5 14
    sta $0255              // 8D 55 02
    lda $15                // A5 15
    sta $0256              // 8D 56 02
    stx $0257              // 8E 57 02
b01_86ED:
    stx $0258              // 8E 58 02
    jsr $86f8              // 20 F8 86
    pla                    // 68
    pla                    // 68
    jmp $a480              // 4C 80 A4
bank01_sub_86F8:
    lda $0256              // AD 56 02
    sta $62                // 85 62
    lda $0255              // AD 55 02
    sta $63                // 85 63
    ldx #$90               // A2 90
    sec                    // 38
    jsr $bc49              // 20 49 BC
    jsr $bddd              // 20 DD BD
    ldy #$ff               // A0 FF
bank01_sub_870D:
    iny                    // C8
    lda $0101,y            // B9 01 01
    sta $0277,y            // 99 77 02   keyboard buffer
    bne bank01_sub_870D              // D0 F7
    iny                    // C8
    sta $0277,y            // 99 77 02   keyboard buffer
    sty $c6                // 84 C6   keyboard buffer count
    rts                    // 60
bank01_data_871D:
.errorif (* != $871D), "bank01_data_871D shifted"
    .byte $A9, $0A, $8D, $00, $DE, $58, $A5, $C6, $85, $CC, $F0, $FA, $4C, $97, $DE    // data $871D
bank01_sub_872C:
    lda #$00               // A9 00
    sta $ca                // 85 CA
    lda $d6                // A5 D6
    sta $c9                // 85 C9
    tya                    // 98
    pha                    // 48
    txa                    // 8A
    pha                    // 48
    lda $d0                // A5 D0
    beq bank01_sub_8742              // F0 06
    jmp $e63a              // 4C 3A E6
bank01_sub_873F:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
bank01_sub_8742:
    ldx #$0f               // A2 0F
bank01_sub_8744:
    lda $871d,x            // BD 1D 87
    sta $0210,x            // 9D 10 02
    dex                    // CA
    bpl bank01_sub_8744              // 10 F7
    jsr $0210              // 20 10 02
    sta $0292              // 8D 92 02
    sei                    // 78
    lda $cf                // A5 CF
    beq bank01_sub_8764              // F0 0C
    lda $ce                // A5 CE
    ldx $0287              // AE 87 02
    ldy #$00               // A0 00
    sty $cf                // 84 CF
    jsr $ea13              // 20 13 EA
bank01_sub_8764:
    jsr $e5b4              // 20 B4 E5
    jsr bank01_sub_8115              // 20 15 81
    cmp #$8a               // C9 8A
    bne bank01_sub_879C              // D0 2E
    lda $f9a0              // AD A0 F9
    cmp #$e6               // C9 E6
    bne bank01_sub_8781              // D0 0C
    jsr bank01_sub_877B              // 20 7B 87
    jmp bank01_sub_8742              // 4C 42 87
bank01_sub_877B:
    lda #$00               // A9 00
    pha                    // 48
    jmp $f9a0              // 4C A0 F9
bank01_sub_8781:
    jsr bank01_sub_9F50              // 20 50 9F
    .byte $33, $80         // inline arg: cross-bank call target $8033
    bmi bank01_sub_8799              // 30 11
    lda #$40               // A9 40
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda #$23               // A9 23
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda #$00               // A9 00
    ldx $ba                // A6 BA   current device
    jsr $bdcd              // 20 CD BD
bank01_sub_8799:
    jmp bank01_sub_87C7              // 4C C7 87
bank01_sub_879C:
    cmp #$8b               // C9 8B
    bne bank01_sub_87A9              // D0 09
    lda #$e3               // A9 E3
    pha                    // 48
    lda #$7a               // A9 7A
    pha                    // 48
    jmp $ded3              // 4C D3 DE
bank01_sub_87A9:
    bit $22                // 24 22
    bpl bank01_sub_8813              // 10 66
bank01_sub_87AD:
    // was ldx #$07: scanned 7 entries incl. RUN/STOP ($83, table slot x=7 at
    // $88AE). Dropped to 6 so RUN/STOP is never compared/matched here -- its
    // macro ("%0:*") is disabled. The $83 byte stays put in bank01_data_88A8
    // (untouched, table size/layout unchanged), just permanently unreachable.
    // A RUN/STOP press now falls through to the same handling as any other
    // non-macro key (cmp #$0d / #$8d below, then bank01_sub_873F).
    ldx #$06               // A2 06
bank01_sub_87AF:
    cmp $88a7,x            // DD A7 88
    beq bank01_sub_87EA              // F0 36
    dex                    // CA
    bne bank01_sub_87AF              // D0 F8
    cmp #$0d               // C9 0D
    beq bank01_sub_87C7              // F0 0C
    cmp #$8d               // C9 8D
    beq bank01_sub_87C2              // F0 03
bank01_sub_87BF:
    jmp bank01_sub_873F              // 4C 3F 87
bank01_sub_87C2:
    bit $028d              // 2C 8D 02
    bne bank01_sub_87BF              // D0 F8
bank01_sub_87C7:
    lda $d3                // A5 D3
    sta $8e                // 85 8E
    jmp $e602              // 4C 02 E6
bank01_sub_87CE:
    ldy #$ff               // A0 FF
bank01_sub_87D0:
    iny                    // C8
    lda $88af,y            // B9 AF 88
    bne bank01_sub_87D0              // D0 FA
    dex                    // CA
    bne bank01_sub_87D0              // D0 F7
bank01_sub_87D9:
    inx                    // E8
    iny                    // C8
    lda $88af,y            // B9 AF 88
    beq bank01_sub_87E5              // F0 05
    sta $0276,x            // 9D 76 02
    bne bank01_sub_87D9              // D0 F4
bank01_sub_87E5:
    stx $c6                // 86 C6   keyboard buffer count
bank01_sub_87E7:
    jmp bank01_sub_8742              // 4C 42 87
bank01_sub_87EA:
    cpx #$03               // E0 03
    bcs bank01_sub_87CE              // B0 E0
    ldy #$05               // A0 05
    lda ($d1),y            // B1 D1
    cmp #$22               // C9 22
    bne bank01_sub_87CE              // D0 D8
    lda #$20               // A9 20
bank01_sub_87F8:
    dey                    // 88
    sta ($d1),y            // 91 D1
    bne bank01_sub_87F8              // D0 FB
    // was lda #$25 ('%'): F1's quote-context fallback (cursor right after an
    // unclosed quote) now types '/' too, matching the F1 -> "/0:*" change
    // below. F2 (x==2) still falls through to the lda #$2f right after.
    lda #$2f               // A9 2F
    cpx #$01               // E0 01
    beq bank01_sub_8805              // F0 02
    lda #$2f               // A9 2F
bank01_sub_8805:
    sta ($d1),y            // 91 D1
    sta $ce                // 85 CE
    sty $d3                // 84 D3
    jsr bank01_sub_8877              // 20 77 88
    jmp bank01_sub_8836              // 4C 36 88
bank01_sub_8811:
    bne bank01_sub_87AD              // D0 9A
bank01_sub_8813:
    ldx $d6                // A6 D6
    bne bank01_sub_881F              // D0 08
    cmp #$91               // C9 91
    beq bank01_sub_8827              // F0 0C
    cmp #$13               // C9 13
    beq bank01_sub_8827              // F0 08
bank01_sub_881F:
    cpx #$18               // E0 18
    bne bank01_sub_882B              // D0 08
    cmp #$11               // C9 11
    bne bank01_sub_882B              // D0 04
bank01_sub_8827:
    stx $8f                // 86 8F
    beq bank01_sub_8833              // F0 08
bank01_sub_882B:
    cmp #$87               // C9 87
    beq bank01_sub_883C              // F0 0D
    cmp #$88               // C9 88
    bne bank01_sub_8811              // D0 DE
bank01_sub_8833:
    jsr bank01_sub_884B              // 20 4B 88
bank01_sub_8836:
    ldx #$01               // A2 01
bank01_sub_8838:
    stx $c6                // 86 C6   keyboard buffer count
    bne bank01_sub_87E7              // D0 AB
bank01_sub_883C:
    jsr bank01_sub_884B              // 20 4B 88
    lda #$87               // A9 87
    sta $0278              // 8D 78 02
    sta $0279              // 8D 79 02
    ldx #$03               // A2 03
    bne bank01_sub_8838              // D0 ED
bank01_sub_884B:
    ldy #$01               // A0 01
    ldx #$02               // A2 02
bank01_sub_884F:
    lda $887d,x            // BD 7D 88
    cmp ($d1),y            // D1 D1
    beq bank01_sub_8862              // F0 0C
    dex                    // CA
    bpl bank01_sub_884F              // 10 F6
    ldx $0166              // AE 66 01
    cpx #$02               // E0 02
    bcc bank01_sub_8862              // 90 02
    ldx #$02               // A2 02
bank01_sub_8862:
    lda $8f                // A5 8F
    bmi bank01_sub_8872              // 30 0C
    lda $8883,x            // BD 83 88
    sta $a8                // 85 A8
    lda $887d,x            // BD 7D 88
    sta $aa                // 85 AA
    bne bank01_sub_8877              // D0 05
bank01_sub_8872:
    lda $8880,x            // BD 80 88
    sta ($d1),y            // 91 D1
bank01_sub_8877:
    lda #$0d               // A9 0D
    sta $0277              // 8D 77 02   keyboard buffer
    rts                    // 60
bank01_data_887D:
.errorif (* != $887D), "bank01_data_887D shifted"
    .byte $2C, $3A, $3E, $09, $0D, $04, $20, $08, $00    // data $887D
bank01_sub_8886:
    tsx                    // BA
    lda #$8a               // A9 8A
    cmp $0102,x            // DD 02 01
    ror $22                // 66 22
    ldx #$ff               // A2 FF
    stx $8f                // 86 8F
    inx                    // E8
bank01_sub_8893:
    jsr bank01_sub_872C              // 20 2C 87
    cmp #$0d               // C9 0D
    beq bank01_sub_88A5              // F0 0B
    sta $0200,x            // 9D 00 02   BASIC input buffer
    inx                    // E8
    cpx #$54               // E0 54
    bcc bank01_sub_8893              // 90 F1
    jmp $a571              // 4C 71 A5
bank01_sub_88A5:
    jmp $aaca              // 4C CA AA
// --- $88A8: function-key macro table --------------------------------------
// Key codes F1,F2,F5,F7,F3,F8,RUN/STOP ($83) followed by the $00-terminated
// strings typed into the keyboard buffer for each key:
//   "/0:*"  "/0:*"  "L{shift-I}"  "R{shift-U}:"  "$:*"  "MON"  "%0:*"
// (%/= fastload commands, $ = directory, MON = machine code monitor)
// F1 changed from "%0:*" to "/0:*" (now identical to F2's string). The
// RUN/STOP entry ($83) and its "%0:*" string are unchanged but dead: the
// scan loop at bank01_sub_87AD no longer checks x=7 (RUN/STOP), see there.
bank01_data_88A8:
.errorif (* != $88A8), "bank01_data_88A8 shifted"
    .byte $85, $89, $87, $88, $86, $8C, $83, $00, $2F, $30, $3A, $2A, $00, $2F, $30, $3A    // data $88A8  "......../0:*./0:"
    .byte $2A, $00, $4C, $C9, $0D, $00, $52, $D5, $3A, $0D, $00, $24, $3A, $2A, $0D, $00    // data $88B8  "*.L...R.:..$:*.."
    .byte $4D, $4F, $4E, $0D, $00, $25, $30, $3A, $2A, $0D, $00    // data $88C8  "MON..%0:*.."
// --- $88D3: code resumes
    lda $ba                // A5 BA   current device
    jsr $ffb4              // 20 B4 FF   KERNAL TALK
    lda $b9                // A5 B9   secondary addr
    jmp $ff96              // 4C 96 FF   KERNAL TKSA
    lda #$08               // A9 08
    ldy $b7                // A4 B7   filename length
    beq b01_890B           // F0 28
    jsr $81eb              // 20 EB 81
    lda #$03               // A9 03
    ldy #$60               // A0 60
    jsr $ffba              // 20 BA FF   KERNAL SETLFS: set file/dev/sec
    jsr $ffe7              // 20 E7 FF   KERNAL CLALL
    jsr b01_8914           // 20 14 89
    bcs b01_890B           // B0 16
    jsr $9f53              // 20 53 9F
    .byte $C0, $FF         // inline arg: cross-bank call target $FFC0
    jsr $88d3              // 20 D3 88
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $ae                // 85 AE   load end addr lo
    lda $90                // A5 90   KERNAL I/O status
    lsr                    // 4A
    lsr                    // 4A
    bcc b01_890E           // 90 06
    jsr $f704              // 20 04 F7
b01_890B:
    jmp $e0f9              // 4C F9 E0
b01_890E:
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $af                // 85 AF   load end addr hi
b01_8913:
    rts                    // 60
b01_8914:
    jsr $97b0              // 20 B0 97
    lda #$49               // A9 49
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    lda $90                // A5 90   KERNAL I/O status
    bpl b01_8913           // 10 F0
    jmp $f707              // 4C 07 F7
    php                    // 08
    ldx #$9f               // A2 9F
    ldy #$80               // A0 80
    jsr $de9d              // 20 9D DE
    cmp #$aa               // C9 AA
    bne b01_894C           // D0 1A
    iny                    // C8
    jsr $de9d              // 20 9D DE
    cmp #$55               // C9 55
    bne b01_894C           // D0 12
    ldy #$83               // A0 83
    jsr $de9d              // 20 9D DE
    cmp #$08               // C9 08
    bcc $8948              // 90 05
    cmp #$1e               // C9 1E
    bcc $8948              // 90 01
    bit $08a9              // 2C A9 08
    sta $ba                // 85 BA   current device
b01_894C:
    lda $ba                // A5 BA   current device
    cmp #$08               // C9 08
    bcs b01_8959           // B0 07
    jsr $8311              // 20 11 83
    plp                    // 28
    jmp $de60              // 4C 60 DE
b01_8959:
    jsr $8392              // 20 92 83
    plp                    // 28
    lda $93                // A5 93
    bcc b01_8990           // 90 2F
    jsr $9f50              // 20 50 9F
    .byte $0F, $80         // inline arg: cross-bank call target $800F
    php                    // 08
    lda $90                // A5 90   KERNAL I/O status
    cmp #$ff               // C9 FF
    beq b01_8976           // F0 09
    plp                    // 28
b01_896E:
    jsr $836f              // 20 6F 83
    lda $9e                // A5 9E
    jmp $de26              // 4C 26 DE
b01_8976:
    plp                    // 28
    ldy #$00               // A0 00
    lda ($bb),y            // B1 BB
    cmp #$24               // C9 24
    bne b01_8982           // D0 03
    jmp $8015              // 4C 15 80
b01_8982:
    jsr $ffab              // 20 AB FF   KERNAL UNTLK
    jsr $f642              // 20 42 F6
    lda #$f4               // A9 F4
    pha                    // 48
    lda #$a6               // A9 A6
    pha                    // 48
    bne b01_896E           // D0 DE
b01_8990:
    jsr $9f50              // 20 50 9F
    .byte $12, $80         // inline arg: cross-bank call target $8012
    jmp b01_896E           // 4C 6E 89
    ldx #$00               // A2 00
bank01_api_07:
    cpx #$00               // E0 00
    beq bank01_sub_899F              // F0 01
    clc                    // 18
bank01_sub_899F:
    ror $0168              // 6E 68 01
    stx $0163              // 8E 63 01
    stx $0167              // 8E 67 01
    jsr bank01_sub_89F2              // 20 F2 89
    txa                    // 8A
    bne bank01_sub_89C7              // D0 19
    stx $015a              // 8E 5A 01
    lda #$e3               // A9 E3
    sta $0158              // 8D 58 01
    lda #$7b               // A9 7B
    sta $0159              // 8D 59 01
    lda #$fb               // A9 FB
    sta $015e              // 8D 5E 01
    lda #$37               // A9 37
    sta $015f              // 8D 5F 01
    bne bank01_sub_89D4              // D0 0D
bank01_sub_89C7:
    jsr bank01_api_06              // 20 1D 83
    jsr bank01_sub_9712              // 20 12 97
    clc                    // 18
    jsr bank01_sub_8A15              // 20 15 8A
    jsr bank01_sub_9A72              // 20 72 9A
bank01_sub_89D4:
    jmp bank01_sub_8E50              // 4C 50 8E
bank01_data_89D7:
.errorif (* != $89D7), "bank01_data_89D7 shifted"
    .byte $38, $08, $A9, $4C, $85, $54, $8D, $13, $03, $2C, $68, $01, $30, $0A, $38, $20    // data $89D7
    .byte $15, $8A, $28, $20, $4E, $9F, $2A, $80, $4C, $7B, $E3    // data $89E7
bank01_sub_89F2:
    lda #$34               // A9 34
    sta $0160              // 8D 60 01
    lda #$2e               // A9 2E
    sta $0165              // 8D 65 01
    lda #$80               // A9 80
    sta $0161              // 8D 61 01
    sta $0162              // 8D 62 01
    sta $9d                // 85 9D   KERNAL msg mode
    asl                  // 0A
    sta $0313              // 8D 13 03
    lda #$cd               // A9 CD
    ldy #$de               // A0 DE
    sta $0316              // 8D 16 03   CBINV BRK vector
    sty $0317              // 8C 17 03
    rts                    // 60
bank01_sub_8A15:
    sei                    // 78
    ldx #$07               // A2 07
bank01_sub_8A18:
    lda $08e0,x            // BD E0 08
    bcc bank01_sub_8A23              // 90 06
    lda $0158,x            // BD 58 01
    sta $08e0,x            // 9D E0 08
bank01_sub_8A23:
    sta $0158,x            // 9D 58 01
    dex                    // CA
    bpl bank01_sub_8A18              // 10 EF
    sta $ad                // 85 AD
    lda $0159              // AD 59 01
    sta $ac                // 85 AC
    rts                    // 60
bank01_data_8A31:
.errorif (* != $8A31), "bank01_data_8A31 shifted"
    lda #$08               // A9 08
    bit $20a9              // 2C A9 20
    jsr b01_8A5D           // 20 5D 8A
    lda $028d              // AD 8D 02
    beq $8a30              // F0 F2
    jsr $8ea3              // 20 A3 8E
    jsr $94bb              // 20 BB 94
    jsr $8ab7              // 20 B7 8A
    ldy #$07               // A0 07
    lda #$1e               // A9 1E
    cmp $a8                // C5 A8
    bcc b01_8A55           // 90 06
    cmp $8e                // C5 8E
    bcs b01_8A55           // B0 02
    ldy #$1f               // A0 1F
b01_8A55:
    ldx $d6                // A6 D6
    jsr $8beb              // 20 EB 8B
    jmp $8e6c              // 4C 6C 8E
b01_8A5D:
    sta $a8                // 85 A8
    jsr $8f1e              // 20 1E 8F
    ldy #$01               // A0 01
    lda ($d1),y            // B1 D1
    sta $97                // 85 97
    bpl b01_8A7F           // 10 15
    jsr $8bef              // 20 EF 8B
    ldy #$26               // A0 26
b01_8A6F:
    lda ($d1),y            // B1 D1
    jsr $9768              // 20 68 97
    dey                    // 88
    cpy #$06               // C0 06
    bne b01_8A6F           // D0 F6
    jsr $8bfb              // 20 FB 8B
    jmp $8ab7              // 4C B7 8A
b01_8A7F:
    ldx $c8                // A6 C8
    cpx #$27               // E0 27
    bcs b01_8A92           // B0 0D
    stx $d3                // 86 D3
    lda #$27               // A9 27
    sta $c8                // 85 C8
    sta $d0                // 85 D0
    sta $13                // 85 13
    jsr $8893              // 20 93 88
b01_8A92:
    ldy #$00               // A0 00
b01_8A94:
    lda $aa                // A5 AA
    cmp #$2c               // C9 2C
    beq b01_8AA8           // F0 0E
    lda $8e                // A5 8E
    cmp #$20               // C9 20
    lda $021f,y            // B9 1F 02
    bcs b01_8AAB           // B0 08
    jsr $8f16              // 20 16 8F
    bcc b01_8AAF           // 90 07
b01_8AA8:
    lda $0207,y            // B9 07 02
b01_8AAB:
    cmp #$2e               // C9 2E
    beq b01_8AB2           // F0 03
b01_8AAF:
    jsr $9768              // 20 68 97
b01_8AB2:
    iny                    // C8
    cpy $a8                // C4 A8
    bcc b01_8A94           // 90 DD
bank01_sub_8AB7:
    ldx $d6                // A6 D6
    jsr bank01_sub_8BE9              // 20 E9 8B
    ldy $aa                // A4 AA
    jsr bank01_sub_8F7F              // 20 7F 8F
    ldy #$ad               // A0 AD
    jsr bank01_sub_8B40              // 20 40 8B
    lda $aa                // A5 AA
    cmp #$2c               // C9 2C
    bne bank01_sub_8AF2              // D0 26
    lda $97                // A5 97
    bpl bank01_sub_8AFF              // 10 2F
    jsr bank01_sub_8BEF              // 20 EF 8B
    ldy #$26               // A0 26
bank01_sub_8AD5:
    jsr bank01_sub_9728              // 20 28 97
    sta ($d1),y            // 91 D1
    jsr $ea24              // 20 24 EA
    lda $0286              // AD 86 02   current text color
    sta ($f3),y            // 91 F3
    dey                    // 88
    cpy #$06               // C0 06
    bne bank01_sub_8AD5              // D0 EE
    jsr bank01_sub_8BFB              // 20 FB 8B
    ldy #$01               // A0 01
    lda #$ac               // A9 AC
    sta ($d1),y            // 91 D1
    dey                    // 88
    rts                    // 60
bank01_sub_8AF2:
    ldy #$00               // A0 00
bank01_sub_8AF4:
    jsr bank01_sub_9728              // 20 28 97
    jsr bank01_sub_8B22              // 20 22 8B
    iny                    // C8
    cpy $a8                // C4 A8
    bne bank01_sub_8AF4              // D0 F5
bank01_sub_8AFF:
    jsr $8ea9              // 20 A9 8E
    ldy #$00               // A0 00
bank01_sub_8B04:
    jsr bank01_sub_9728              // 20 28 97
    cmp #$de               // C9 DE
    beq bank01_sub_8B16              // F0 0B
    tax                    // AA
    and #$7f               // 29 7F
    cmp #$60               // C9 60
    bcs bank01_sub_8B16              // B0 04
    cmp #$20               // C9 20
    bcs bank01_sub_8B18              // B0 02
bank01_sub_8B16:
    ldx #$2e               // A2 2E
bank01_sub_8B18:
    txa                    // 8A
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    iny                    // C8
    cpy $a8                // C4 A8
    bne bank01_sub_8B04              // D0 E3
    rts                    // 60
bank01_sub_8B22:
    pha                    // 48
    jsr $8ea9              // 20 A9 8E
    pla                    // 68
bank01_sub_8B27:
    pha                    // 48
    lsr                  // 4A
    lsr                  // 4A
    lsr                  // 4A
    lsr                  // 4A
    jsr bank01_sub_8B32              // 20 32 8B
    pla                    // 68
    and #$0f               // 29 0F
bank01_sub_8B32:
    cmp #$0a               // C9 0A
    bcc bank01_sub_8B38              // 90 02
    adc #$06               // 69 06
bank01_sub_8B38:
    adc #$30               // 69 30
    jmp $ffd2              // 4C D2 FF   KERNAL CHROUT: print char
bank01_sub_8B3D:
    jsr $8ea9              // 20 A9 8E
bank01_sub_8B40:
    lda $0000,y            // B9 00 00
    jsr bank01_sub_8B27              // 20 27 8B
    dey                    // 88
    lda $0000,y            // B9 00 00
    jmp bank01_sub_8B27              // 4C 27 8B
bank01_data_8B4D:
.errorif (* != $8B4D), "bank01_data_8B4D shifted"
    cmp #$4f               // C9 4F
    bne b01_8B54           // D0 03
    jmp $99fc              // 4C FC 99
b01_8B54:
    ldx #$ff               // A2 FF
    cmp #$2a               // C9 2A
    bne b01_8B5D           // D0 03
    jsr $0073              // 20 73 00
b01_8B5D:
    stx $97                // 86 97
    ldx #$00               // A2 00
    ldy #$2c               // A0 2C
    bne b01_8B69           // D0 04
    ldx #$01               // A2 01
    ldy #$3a               // A0 3A
b01_8B69:
    stx $0166              // 8E 66 01
    sty $aa                // 84 AA
    ldx $9a                // A6 9A
    lda #$08               // A9 08
    cpx #$04               // E0 04
    bcc b01_8B77           // 90 01
    asl                    // 0A
b01_8B77:
    cpy #$3a               // C0 3A
    beq b01_8B7D           // F0 02
    asl                    // 0A
    asl                    // 0A
b01_8B7D:
    sta $a8                // 85 A8
    jsr $8f3b              // 20 3B 8F
    sty $8d                // 84 8D
b01_8B84:
    jsr $8ea3              // 20 A3 8E
    ldx $d6                // A6 D6
    stx $8f                // 86 8F
    jsr $8ab7              // 20 B7 8A
b01_8B8E:
    jsr $9141              // 20 41 91
    beq b01_8B98           // F0 05
    jsr $8b9e              // 20 9E 8B
    beq b01_8B8E           // F0 F6
b01_8B98:
    jsr $94bb              // 20 BB 94
    bcc b01_8B84           // 90 E7
    rts                    // 60
bank01_sub_8B9E:
    lda $ac                // A5 AC
    sec                    // 38
    sbc $a8                // E5 A8
    sta $ac                // 85 AC
    bcs bank01_sub_8BA9              // B0 02
    dec $ad                // C6 AD
bank01_sub_8BA9:
    ldy #$01               // A0 01
    lda ($d1),y            // B1 D1
    sta $97                // 85 97
    jsr bank01_sub_8BCC              // 20 CC 8B
    jmp bank01_sub_8AB7              // 4C B7 8A
bank01_data_8BB5:
.errorif (* != $8BB5), "bank01_data_8BB5 shifted"
    .byte $AD, $65, $01, $A0, $00, $91, $D1, $A2, $19, $CA, $20, $E9, $8B, $B1, $D1, $CD    // data $8BB5
    .byte $65, $01, $D0, $F5, $4C, $58, $8E    // data $8BC5
bank01_sub_8BCC:
    lda $a5                // A5 A5
    pha                    // 48
    lda $a6                // A5 A6
    pha                    // 48
    lda $a7                // A5 A7
    pha                    // 48
    lda $a8                // A5 A8
    pha                    // 48
    jsr bank01_sub_9F50              // 20 50 9F
    .byte $1E, $80         // inline arg: cross-bank call target $801E
    pla                    // 68
    sta $a8                // 85 A8
    pla                    // 68
    sta $a7                // 85 A7
    pla                    // 68
    sta $a6                // 85 A6
    pla                    // 68
    sta $a5                // 85 A5
bank01_sub_8BE9:
    ldy #$00               // A0 00
bank01_sub_8BEB:
    clc                    // 18
    jmp $fff0              // 4C F0 FF   KERNAL PLOT: set/get cursor
bank01_sub_8BEF:
    lda $ac                // A5 AC
    sec                    // 38
    sbc #$07               // E9 07
    sta $ac                // 85 AC
    bcs bank01_sub_8BFA              // B0 02
    dec $ad                // C6 AD
bank01_sub_8BFA:
    rts                    // 60
bank01_sub_8BFB:
    lda $ac                // A5 AC
    clc                    // 18
    adc #$07               // 69 07
    sta $ac                // 85 AC
    bcc bank01_sub_8C06              // 90 02
    inc $ad                // E6 AD
bank01_sub_8C06:
    rts                    // 60
bank01_data_8C07:
.errorif (* != $8C07), "bank01_data_8C07 shifted"
    jsr $8f16              // 20 16 8F
    sta $0158              // 8D 58 01
    jsr $8f16              // 20 16 8F
    sta $0159              // 8D 59 01
    ldx #$00               // A2 00
b01_8C15:
    jsr $8f16              // 20 16 8F
    sta $015b,x            // 9D 5B 01
    inx                    // E8
    cpx #$05               // E0 05
    bcc b01_8C15           // 90 F5
    ldy #$00               // A0 00
b01_8C22:
    lda ($7a),y            // B1 7A
    cmp #$31               // C9 31
    rol $015a              // 2E 5A 01
    iny                    // C8
    cpy #$08               // C0 08
    bne b01_8C22           // D0 F4
    rts                    // 60
    jsr $8ea3              // 20 A3 8E
    lda #$a4               // A9 A4
    pha                    // 48
    lda #$8c               // A9 8C
    pha                    // 48
    lda #$4c               // A9 4C
    sta $54                // 85 54
    jsr $83a6              // 20 A6 83
    jsr $0079              // 20 79 00
    jmp $de26              // 4C 26 DE
    jsr $90c2              // 20 C2 90
    tya                    // 98
    beq b01_8C62           // F0 17
    lda #$60               // A9 60
    sta ($bb),y            // 91 BB
    ldy #$00               // A0 00
    ldx #$00               // A2 00
b01_8C53:
    jsr $9728              // 20 28 97
    clc                    // 18
    jsr b01_8C63           // 20 63 8C
    jsr $9768              // 20 68 97
    jsr $8f73              // 20 73 8F
    bcc b01_8C53           // 90 F1
b01_8C62:
    rts                    // 60
b01_8C63:
    jmp ($00bb)            // 6C BB 00
    jsr $90c2              // 20 C2 90
    ldy $b7                // A4 B7   filename length
    beq b01_8C84           // F0 17
    ldx #$00               // A2 00
b01_8C6F:
    txa                    // 8A
    tay                    // A8
    lda ($bb),y            // B1 BB
    ldy #$00               // A0 00
    jsr $9768              // 20 68 97
    inx                    // E8
    cpx $b7                // E4 B7   filename length
    bne b01_8C7F           // D0 02
    ldx #$00               // A2 00
b01_8C7F:
    jsr $8f73              // 20 73 8F
    bcc b01_8C6F           // 90 EB
b01_8C84:
    rts                    // 60
    jsr $8f3b              // 20 3B 8F
    jsr $8f24              // 20 24 8F
    jsr $8ea3              // 20 A3 8E
b01_8C8E:
    ldy #$00               // A0 00
    jsr $9723              // 20 23 97
    sta $c3                // 85 C3
    lda #$c1               // A9 C1
    jsr $9725              // 20 25 97
    cmp $c3                // C5 C3
    beq b01_8CDA           // F0 3C
    tax                    // AA
    lda #$05               // A9 05
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    ldy #$ad               // A0 AD
    jsr $8b3d              // 20 3D 8B
    lda #$9b               // A9 9B
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    ldy #$c2               // A0 C2
    jsr $8b3d              // 20 3D 8B
    ldy #$00               // A0 00
    lda #$05               // A9 05
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda $c3                // A5 C3
    jsr $8b22              // 20 22 8B
    lda #$9b               // A9 9B
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    txa                    // 8A
    jsr $8b22              // 20 22 8B
    lda #$05               // A9 05
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    ldx #$03               // A2 03
    lda #$20               // A9 20
b01_8CD1:
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    dex                    // CA
    bpl b01_8CD1           // 10 FA
    jsr $912b              // 20 2B 91
b01_8CDA:
    jsr $8f6d              // 20 6D 8F
    bcc b01_8C8E           // 90 AF
    rts                    // 60
    jsr $8f3b              // 20 3B 8F
    jsr $9007              // 20 07 90
    ldy $b7                // A4 B7   filename length
    beq b01_8D0A           // F0 20
    jsr $8ea3              // 20 A3 8E
b01_8CED:
    ldy #$00               // A0 00
    bit $dc01              // 2C 01 DC   CIA1 port B (keyboard rows / joy1)
    bpl b01_8D0A           // 10 16
b01_8CF4:
    jsr $9728              // 20 28 97
    cmp ($bb),y            // D1 BB
    bne b01_8D05           // D0 0A
    iny                    // C8
    cpy $b7                // C4 B7   filename length
    bne b01_8CF4           // D0 F4
    ldy #$ad               // A0 AD
    jsr $8b3d              // 20 3D 8B
b01_8D05:
    jsr $8f73              // 20 73 8F
    bcc b01_8CED           // 90 E3
b01_8D0A:
    rts                    // 60
    jsr $8f1e              // 20 1E 8F
    jsr $8f21              // 20 21 8F
    jsr $8f65              // 20 65 8F
    jsr $8f24              // 20 24 8F
    sec                    // 38
    lda $b0                // A5 B0
    sbc $ac                // E5 AC
    sta $c4                // 85 C4
    lda $b1                // A5 B1
    sbc $ad                // E5 AD
    tax                    // AA
    lda $ac                // A5 AC
    cmp $c1                // C5 C1   I/O start addr lo
    lda $ad                // A5 AD
    sbc $c2                // E5 C2   I/O start addr hi
    bcc b01_8D45           // 90 18
    inx                    // E8
b01_8D2E:
    cpy $c4                // C4 C4
    bne b01_8D35           // D0 03
    dex                    // CA
    beq b01_8D67           // F0 32
b01_8D35:
    jsr $9723              // 20 23 97
    jsr $9761              // 20 61 97
    iny                    // C8
    bne b01_8D2E           // D0 F0
    inc $ad                // E6 AD
    inc $c2                // E6 C2   I/O start addr hi
    jmp b01_8D2E           // 4C 2E 8D
b01_8D45:
    ldy $c4                // A4 C4
    txa                    // 8A
    adc $ad                // 65 AD
    sta $ad                // 85 AD
    txa                    // 8A
    clc                    // 18
    adc $c2                // 65 C2   I/O start addr hi
    sta $c2                // 85 C2   I/O start addr hi
    inx                    // E8
b01_8D53:
    tya                    // 98
    beq b01_8D60           // F0 0A
b01_8D56:
    dey                    // 88
    jsr $9723              // 20 23 97
    jsr $9761              // 20 61 97
    jmp b01_8D53           // 4C 53 8D
b01_8D60:
    dec $ad                // C6 AD
    dec $c2                // C6 C2   I/O start addr hi
    dex                    // CA
    bne b01_8D56           // D0 EF
b01_8D67:
    rts                    // 60
    bit $0168              // 2C 68 01
    bmi b01_8D9B           // 30 2E
    jsr $8ea3              // 20 A3 8E
    ldx #$04               // A2 04
b01_8D72:
    lda $0840,x            // BD 40 08
    ora $0845,x            // 1D 45 08
    beq b01_8D9B           // F0 21
    lda $0840,x            // BD 40 08
    sta $ac                // 85 AC
    lda $0845,x            // BD 45 08
    sta $ad                // 85 AD
    lda #$ec               // A9 EC
    cmp $084a,x            // DD 4A 08
    beq $8d8e              // F0 03
    lda #$98               // A9 98
    bit $05a9              // 2C A9 05
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    ldy #$ad               // A0 AD
    jsr $8b3d              // 20 3D 8B
    dex                    // CA
    bpl b01_8D72           // 10 D7
b01_8D9B:
    rts                    // 60
    jsr $0079              // 20 79 00
    beq b01_8DAE           // F0 0D
    jsr $8f1e              // 20 1E 8F
    ldx $ac                // A6 AC
    ldy $ad                // A4 AD
    stx $0159              // 8E 59 01
    sty $0158              // 8C 58 01
b01_8DAE:
    bit $0168              // 2C 68 01
    bmi b01_8DB7           // 30 04
    clc                    // 18
    jmp $89d8              // 4C D8 89
b01_8DB7:
    ldx #$16               // A2 16
b01_8DB9:
    lda $8df2,x            // BD F2 8D
    sta $0120,x            // 9D 20 01
    dex                    // CA
    bpl b01_8DB9           // 10 F7
    jsr $83a6              // 20 A6 83
    jsr $8364              // 20 64 83
    ldx $015e              // AE 5E 01
    txs                    // 9A
    lda $0158              // AD 58 01
    sta $0135              // 8D 35 01
    lda $0159              // AD 59 01
    sta $0134              // 8D 34 01
    ldx $def3              // AE F3 DE
    lda $015a              // AD 5A 01
    jmp $dea0              // 4C A0 DE
    sta $015b              // 8D 5B 01
    stx $015c              // 8E 5C 01
    sty $015d              // 8C 5D 01
    php                    // 08
    pla                    // 68
    sta $015a              // 8D 5A 01
    jmp $8e3e              // 4C 3E 8E
    stx $de00              // 8E 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pha                    // 48
    ldx $015c              // AE 5C 01
    ldy $015d              // AC 5D 01
    lda $015f              // AD 5F 01
    sta $01                // 85 01   CPU port: mem banking
    lda $015b              // AD 5B 01
    plp                    // 28
    jmp $fce2              // 4C E2 FC   KERNAL RESET entry
bank01_sub_8E08:
    cld                    // D8
    ldy #$3b               // A0 3B
    jsr bank01_sub_8F7C              // 20 7C 8F
    lda $0158              // AD 58 01
    jsr bank01_sub_8B27              // 20 27 8B
    lda $0159              // AD 59 01
    jsr bank01_sub_8B27              // 20 27 8B
    ldx #$00               // A2 00
bank01_sub_8E1C:
    lda $015b,x            // BD 5B 01
    jsr bank01_sub_8B22              // 20 22 8B
    inx                    // E8
    cpx #$05               // E0 05
    bne bank01_sub_8E1C              // D0 F5
    jsr $8ea9              // 20 A9 8E
    lda $015a              // AD 5A 01
    sec                    // 38
bank01_sub_8E2E:
    rol                  // 2A
    beq bank01_sub_8E3D              // F0 0C
    pha                    // 48
    lda #$30               // A9 30
    adc #$00               // 69 00
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    pla                    // 68
    clc                    // 18
    bcc bank01_sub_8E2E              // 90 F1
bank01_sub_8E3D:
    rts                    // 60
bank01_data_8E3E:
.errorif (* != $8E3E), "bank01_data_8E3E shifted"
    .byte $BA, $8E, $5E, $01, $AD, $11, $D0, $09, $10, $8D, $11, $D0, $20, $F2, $89, $20    // data $8E3E
    .byte $A9, $83    // data $8E4E
bank01_sub_8E50:
    jsr bank01_sub_9F51              // 20 51 9F
    .byte $8A, $80         // inline arg: cross-bank call target $808A
    jsr bank01_sub_8E08              // 20 08 8E
bank01_sub_8E58:
    jsr $83a9              // 20 A9 83
    lda $9a                // A5 9A
    cmp #$04               // C9 04
    bcc bank01_sub_8E64              // 90 03
    jsr bank01_sub_8EA3              // 20 A3 8E
bank01_sub_8E64:
    jsr $ffe7              // 20 E7 FF   KERNAL CLALL
bank01_sub_8E67:
    ldy #$00               // A0 00
    jsr bank01_sub_8F7C              // 20 7C 8F
    ldx #$d0               // A2 D0
    txs                    // 9A
    cld                    // D8
    jsr bank01_sub_8F95              // 20 95 8F
    tax                    // AA
    beq bank01_sub_8E67              // F0 F1
    sta $aa                // 85 AA
    ldx #$ff               // A2 FF
bank01_sub_8E7A:
    inx                    // E8
    lda $99a7,x            // BD A7 99
    bne bank01_sub_8E83              // D0 03
    jmp bank01_sub_956A              // 4C 6A 95
bank01_sub_8E83:
    cmp $aa                // C5 AA
    bne bank01_sub_8E7A              // D0 F3
    jsr bank01_sub_8E8D              // 20 8D 8E
    jmp bank01_sub_8E58              // 4C 58 8E
bank01_sub_8E8D:
    txa                    // 8A
    asl                  // 0A
    tax                    // AA
    lda $99c5,x            // BD C5 99
    pha                    // 48
    lda $99c4,x            // BD C4 99
    pha                    // 48
    jsr bank01_sub_9712              // 20 12 97
    jsr bank01_sub_81EB              // 20 EB 81
    ldy #$00               // A0 00
    jmp $0073              // 4C 73 00
bank01_sub_8EA3:
    lda #$0d               // A9 0D
    bit $24a9              // 2C A9 24
    bit $20a9              // 2C A9 20
    jmp $ffd2              // 4C D2 FF   KERNAL CHROUT: print char
bank01_sub_8EAE:
    jsr $0079              // 20 79 00
    cmp #$2b               // C9 2B
    bne bank01_sub_8EDD              // D0 28
    stx $02                // 86 02
    sty $03                // 84 03
    jsr $0073              // 20 73 00
    jsr bank01_sub_955E              // 20 5E 95
    bcs bank01_sub_8EDD              // B0 1C
    jsr $ad8a              // 20 8A AD
    jsr $b1b8              // 20 B8 B1
    lda $65                // A5 65
    pha                    // 48
    jsr $0079              // 20 79 00
    beq bank01_sub_8ED6              // F0 07
    cmp #$2c               // C9 2C
    bne bank01_sub_8ED6              // D0 03
    jsr $0073              // 20 73 00
bank01_sub_8ED6:
    ldx $02                // A6 02
    ldy $03                // A4 03
    pla                    // 68
    clc                    // 18
    rts                    // 60
bank01_sub_8EDD:
    jsr $0079              // 20 79 00
    jsr bank01_sub_8F02              // 20 02 8F
    asl                  // 0A
    asl                  // 0A
    asl                  // 0A
    asl                  // 0A
    sta $9f                // 85 9F
    jsr $0073              // 20 73 00
    jsr bank01_sub_8F02              // 20 02 8F
    pha                    // 48
    jsr $0073              // 20 73 00
    pla                    // 68
    ora $9f                // 05 9F
    clc                    // 18
    rts                    // 60
bank01_data_8EF8:
.errorif (* != $8EF8), "bank01_data_8EF8 shifted"
    .byte $20, $79, $00, $C9, $2C, $D0, $1C, $4C, $73, $00    // data $8EF8
bank01_sub_8F02:
    bcs bank01_sub_8F07              // B0 03
    adc #$d0               // 69 D0
    rts                    // 60
bank01_sub_8F07:
    cmp #$41               // C9 41
    bcc bank01_sub_8F12              // 90 07
    cmp #$47               // C9 47
    bcs bank01_sub_8F12              // B0 03
    adc #$c9               // 69 C9
    rts                    // 60
bank01_sub_8F12:
    pla                    // 68
    pla                    // 68
    sec                    // 38
bank01_sub_8F15:
    rts                    // 60
bank01_sub_8F16:
    jsr bank01_sub_8EAE              // 20 AE 8E
    bcc bank01_sub_8F15              // 90 FA
    jmp bank01_sub_956A              // 4C 6A 95
bank01_sub_8F1E:
    ldy #$ad               // A0 AD
    bit $b1a0              // 2C A0 B1
    bit $c2a0              // 2C A0 C2
    bit $c4a0              // 2C A0 C4
    jsr bank01_sub_8F16              // 20 16 8F
    sta $0000,y            // 99 00 00
    jsr bank01_sub_8F16              // 20 16 8F
    dey                    // 88
    sta $0000,y            // 99 00 00
    ldy #$00               // A0 00
    jmp $0079              // 4C 79 00
bank01_data_8F3B:
.errorif (* != $8F3B), "bank01_data_8F3B shifted"
    lda #$ff               // A9 FF
    sta $b0                // 85 B0
    sta $b1                // 85 B1
    jsr $0079              // 20 79 00
    beq b01_8F53           // F0 0D
    jsr $8f1e              // 20 1E 8F
    bne b01_8F56           // D0 0B
    lda $ac                // A5 AC
    sta $b0                // 85 B0
    lda $ad                // A5 AD
    sta $b1                // 85 B1
b01_8F53:
    ldy #$00               // A0 00
    rts                    // 60
b01_8F56:
    cmp #$2d               // C9 2D
    beq b01_8F53           // F0 F9
    ldy #$02               // A0 02
    lda ($7a),y            // B1 7A
    cmp #$20               // C9 20
    beq b01_8F53           // F0 F1
    jsr $8f21              // 20 21 8F
    jsr $94c8              // 20 C8 94
    bcc b01_8F53           // 90 E9
    jmp $8f1b              // 4C 1B 8F
    inc $c1                // E6 C1   I/O start addr lo
    bne b01_8F73           // D0 02
    inc $c2                // E6 C2   I/O start addr hi
b01_8F73:
    inc $ac                // E6 AC
    bne b01_8F79           // D0 02
    inc $ad                // E6 AD
b01_8F79:
    jmp $94c8              // 4C C8 94
bank01_sub_8F7C:
    jsr bank01_sub_8EA3              // 20 A3 8E
bank01_sub_8F7F:
    lda $0165              // AD 65 01
    bpl bank01_sub_8F88              // 10 04
    sta $c7                // 85 C7
    and #$7f               // 29 7F
bank01_sub_8F88:
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    lda #$00               // A9 00
    sta $c7                // 85 C7
    tya                    // 98
    beq bank01_sub_8FB2              // F0 20
    jmp $ffd2              // 4C D2 FF   KERNAL CHROUT: print char
bank01_sub_8F95:
    cli                    // 58
    ldy #$00               // A0 00
    sty $d4                // 84 D4
    iny                    // C8
    sty $13                // 84 13
    jsr bank01_sub_8886              // 20 86 88
    stx $7a                // 86 7A   TXTPTR lo
    sty $7b                // 84 7B   TXTPTR hi
    inx                    // E8
    stx $13                // 86 13
bank01_sub_8FA7:
    jsr $0073              // 20 73 00
    cmp #$2e               // C9 2E
    beq bank01_sub_8FA7              // F0 F9
    ldx $8f                // A6 8F
    bpl bank01_sub_8FB3              // 10 01
bank01_sub_8FB2:
    rts                    // 60
bank01_sub_8FB3:
    tay                    // A8
    jsr bank01_sub_9712              // 20 12 97
    tya                    // 98
    beq bank01_sub_8FD6              // F0 1C
    jsr $0073              // 20 73 00
    jsr bank01_sub_8F1E              // 20 1E 8F
    ldx $8f                // A6 8F
    beq bank01_sub_8FD6              // F0 12
    jsr bank01_sub_8EA3              // 20 A3 8E
    ldy $a8                // A4 A8
    bne bank01_sub_8FD3              // D0 08
    jsr bank01_sub_9728              // 20 28 97
    jsr bank01_sub_9393              // 20 93 93
    inc $a8                // E6 A8
bank01_sub_8FD3:
    jsr bank01_sub_94BB              // 20 BB 94
bank01_sub_8FD6:
    ldx $8f                // A6 8F
    jsr bank01_sub_8FEA              // 20 EA 8F
    sei                    // 78
    ldx $d6                // A6 D6
    ldy $8e                // A4 8E
    jsr bank01_sub_8BEB              // 20 EB 8B
    lda ($d1),y            // B1 D1
    sta $ce                // 85 CE
    jmp bank01_sub_8F95              // 4C 95 8F
bank01_sub_8FEA:
    lda $a8                // A5 A8
    cmp #$08               // C9 08
    bcc bank01_sub_8FFB              // 90 0B
    txa                    // 8A
    bne bank01_sub_8FF6              // D0 03
    jmp bank01_sub_8B9E              // 4C 9E 8B
bank01_sub_8FF6:
    jsr bank01_sub_8AB7              // 20 B7 8A
    beq bank01_sub_9004              // F0 09
bank01_sub_8FFB:
    txa                    // 8A
    bne bank01_sub_9001              // D0 03
    jmp bank01_sub_927A              // 4C 7A 92
bank01_sub_9001:
    jsr bank01_sub_92CD              // 20 CD 92
bank01_sub_9004:
    jmp bank01_sub_94BB              // 4C BB 94
bank01_data_9007:
.errorif (* != $9007), "bank01_data_9007 shifted"
    jsr $90fd              // 20 FD 90
    ldy #$00               // A0 00
b01_900C:
    lda ($7a),y            // B1 7A
    bne b01_9015           // D0 05
b01_9010:
    ldy #$00               // A0 00
    jmp b01_90C8           // 4C C8 90
b01_9015:
    cmp #$22               // C9 22
    bne b01_901C           // D0 03
    jmp b01_90AD           // 4C AD 90
b01_901C:
    cmp #$3f               // C9 3F
    beq b01_9027           // F0 07
    iny                    // C8
    cpy #$80               // C0 80
    bne b01_900C           // D0 E7
    beq b01_9010           // F0 E9
b01_9027:
    ldy #$00               // A0 00
    ldx #$00               // A2 00
b01_902B:
    lda ($7a),y            // B1 7A
    beq b01_9067           // F0 38
    cmp #$20               // C9 20
    beq b01_9062           // F0 2F
    cmp #$3f               // C9 3F
    bne $903e              // D0 07
    lda #$30               // A9 30
    sta ($7a),y            // 91 7A
    lda #$0f               // A9 0F
    bit $ffa9              // 2C A9 FF
    sta $0170,x            // 9D 70 01
b01_9043:
    iny                    // C8
    lda ($7a),y            // B1 7A
    beq b01_90A5           // F0 5D
    cmp #$20               // C9 20
    beq b01_9043           // F0 F7
    cmp #$3f               // C9 3F
    bne b01_9061           // D0 11
    lda #$30               // A9 30
    sta ($7a),y            // 91 7A
    lda $0170,x            // BD 70 01
    bpl $905c              // 10 03
    lda #$f0               // A9 F0
    bit.abs $00a9          // 2C A9 00
    sta $0170,x            // 9D 70 01
b01_9061:
    inx                    // E8
b01_9062:
    iny                    // C8
    cpy #$50               // C0 50
    bcc b01_902B           // 90 C4
b01_9067:
    ldy #$00               // A0 00
b01_9069:
    jsr $0079              // 20 79 00
    beq b01_9078           // F0 0A
    jsr $8f16              // 20 16 8F
    sta ($bb),y            // 91 BB
    inc $b7                // E6 B7   filename length
    iny                    // C8
    bne b01_9069           // D0 F1
b01_9078:
    jsr $8ea3              // 20 A3 8E
b01_907B:
    ldy #$00               // A0 00
    bit $dc01              // 2C 01 DC   CIA1 port B (keyboard rows / joy1)
    bpl b01_90A2           // 10 20
b01_9082:
    jsr $9728              // 20 28 97
    tax                    // AA
    lda $0170,y            // B9 70 01
    beq b01_9093           // F0 08
    txa                    // 8A
    and $0170,y            // 39 70 01
    cmp ($bb),y            // D1 BB
    bne b01_909D           // D0 0A
b01_9093:
    iny                    // C8
    cpy $b7                // C4 B7   filename length
    bne b01_9082           // D0 EA
    ldy #$ad               // A0 AD
    jsr $8b3d              // 20 3D 8B
b01_909D:
    jsr $8f73              // 20 73 8F
    bcc b01_907B           // 90 D9
b01_90A2:
    pla                    // 68
    pla                    // 68
    rts                    // 60
b01_90A5:
    lda #$3f               // A9 3F
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    pla                    // 68
    pla                    // 68
    rts                    // 60
b01_90AD:
    cpy #$00               // C0 00
    beq b01_90C8           // F0 17
    tya                    // 98
    clc                    // 18
    adc $7a                // 65 7A   TXTPTR lo
    sta $7a                // 85 7A   TXTPTR lo
    lda $7b                // A5 7B   TXTPTR hi
    adc #$00               // 69 00
    sta $7b                // 85 7B   TXTPTR hi
    ldy #$00               // A0 00
    jmp b01_90C8           // 4C C8 90
    jsr $8f3b              // 20 3B 8F
    jsr $90fd              // 20 FD 90
b01_90C8:
    jsr $0079              // 20 79 00
    beq b01_90DB           // F0 0E
    cmp #$22               // C9 22
    beq $90dc              // F0 0B
    jsr $8f16              // 20 16 8F
    sta ($bb),y            // 91 BB
    inc $b7                // E6 B7   filename length
    iny                    // C8
    bne b01_90C8           // D0 ED
b01_90DB:
    rts                    // 60
bank01_sub_90DC:
    ldy #$00               // A0 00
    lda ($7a),y            // B1 7A
    cmp #$22               // C9 22
    bne bank01_sub_90E6              // D0 02
    inc $7a                // E6 7A   TXTPTR lo
bank01_sub_90E6:
    lda ($7a),y            // B1 7A
    clc                    // 18
    beq bank01_sub_90F2              // F0 07
    cmp #$22               // C9 22
    beq bank01_sub_90F2              // F0 03
    iny                    // C8
    bne bank01_sub_90E6              // D0 F4
bank01_sub_90F2:
    jsr bank01_sub_90FD              // 20 FD 90
    tya                    // 98
    adc $7a                // 65 7A   TXTPTR lo
    sta $7a                // 85 7A   TXTPTR lo
    jmp $0079              // 4C 79 00
bank01_sub_90FD:
    lda $7a                // A5 7A   TXTPTR lo
    sta $bb                // 85 BB   filename ptr lo
    lda $7b                // A5 7B   TXTPTR hi
    sta $bc                // 85 BC   filename ptr hi
    sty $b7                // 84 B7   filename length
    rts                    // 60
bank01_data_9108:
.errorif (* != $9108), "bank01_data_9108 shifted"
b01_9108:
    jsr $0079              // 20 79 00
    beq b01_9137           // F0 2A
    cmp #$22               // C9 22
    bne b01_9137           // D0 26
    jsr $90dc              // 20 DC 90
    beq b01_9128           // F0 12
    jsr $8ef8              // 20 F8 8E
    jsr $b79e              // 20 9E B7
    stx $ba                // 86 BA   current device
    beq b01_9128           // F0 08
    jsr $8ef8              // 20 F8 8E
    jsr $8f27              // 20 27 8F
    lda #$01               // A9 01
b01_9128:
    cmp #$00               // C9 00
    rts                    // 60
b01_912B:
    cli                    // 58
    jsr $ffe4              // 20 E4 FF   KERNAL GETIN: get key
    cmp #$03               // C9 03
    beq b01_9137           // F0 04
    cmp #$11               // C9 11
    bne b01_9128           // D0 F1
b01_9137:
    jsr $94bb              // 20 BB 94
b01_913A:
    bit $c5                // 24 C5   last key
    bvc b01_913A           // 50 FC
    jmp $8bb5              // 4C B5 8B
b01_9141:
    jsr b01_912B           // 20 2B 91
    beq b01_9158           // F0 12
b01_9146:
    jsr b01_912B           // 20 2B 91
    beq b01_9146           // F0 FB
    cmp #$87               // C9 87
    beq b01_9156           // F0 07
    cmp #$88               // C9 88
    clc                    // 18
    bne b01_9158           // D0 04
    lda #$00               // A9 00
b01_9156:
    sta $8d                // 85 8D
b01_9158:
    lda $8d                // A5 8D
    rts                    // 60
    cmp #$49               // C9 49
    bne b01_9167           // D0 08
    ldy #$01               // A0 01
    lda ($7a),y            // B1 7A
    cmp #$2a               // C9 2A
    beq b01_916A           // F0 03
b01_9167:
    jsr $9be3              // 20 E3 9B
b01_916A:
    jsr $0079              // 20 79 00
    jmp $8e76              // 4C 76 8E
    lda #$00               // A9 00
    bit $01a9              // 2C A9 01
    sta $0a                // 85 0A
    sta $93                // 85 93
    jsr b01_9108           // 20 08 91
    eor #$01               // 49 01
    sta $b9                // 85 B9   secondary addr
    cpx #$01               // E0 01
    bne b01_918C           // D0 08
    lda #$09               // A9 09
    ldy #$00               // A0 00
    pha                    // 48
    jmp $f71f              // 4C 1F F7
b01_918C:
    lda $93                // A5 93
    ldx $c3                // A6 C3
    ldy $c4                // A4 C4
    jsr $ffd5              // 20 D5 FF   KERNAL LOAD
    bcs b01_91A6           // B0 0F
    lda $0a                // A5 0A
    bne b01_91A6           // D0 0B
    lda $90                // A5 90   KERNAL I/O status
    and #$bf               // 29 BF
    bne b01_91A6           // D0 05
    ldx $ae                // A6 AE   load end addr lo
    ldy $af                // A4 AF   load end addr hi
    rts                    // 60
b01_91A6:
    jmp $e178              // 4C 78 E1
    jsr b01_9108           // 20 08 91
    beq b01_91DA           // F0 2C
    lda $ba                // A5 BA   current device
    cmp #$08               // C9 08
    bcc b01_91F1           // 90 3D
    lda $c3                // A5 C3
    sta $c1                // 85 C1   I/O start addr lo
    lda $c4                // A5 C4
    sta $c2                // 85 C2   I/O start addr hi
    jsr $0079              // 20 79 00
    beq b01_91DA           // F0 19
    jsr $8ef8              // 20 F8 8E
    jsr $8f21              // 20 21 8F
    jsr $0079              // 20 79 00
    bne b01_91DD           // D0 11
    ldx $b0                // A6 B0
    ldy $b1                // A4 B1
    lda #$c1               // A9 C1
    jsr $ffd8              // 20 D8 FF   KERNAL SAVE
b01_91D5:
    bcc b01_9252           // 90 7B
    jmp $e0f9              // 4C F9 E0
b01_91DA:
    jmp $956a              // 4C 6A 95
b01_91DD:
    jsr $8ef8              // 20 F8 8E
    jsr $8f27              // 20 27 8F
    lda $ba                // A5 BA   current device
    cmp #$01               // C9 01
    beq b01_91F1           // F0 08
    jsr $9f50              // 20 50 9F
    .byte $18, $80         // inline arg: cross-bank call target $8018
    jmp b01_91D5           // 4C D5 91
b01_91F1:
    lda #$09               // A9 09
    ldy #$00               // A0 00
    pha                    // 48
    jmp $f71f              // 4C 1F F7
    lda $7a                // A5 7A   TXTPTR lo
    pha                    // 48
    sty $7a                // 84 7A   TXTPTR lo
    ldy #$02               // A0 02
    sty $7b                // 84 7B   TXTPTR hi
    jsr $a579              // 20 79 A5
    inc $7b                // E6 7B   TXTPTR hi
    pla                    // 68
    sta $7a                // 85 7A   TXTPTR lo
    jsr $ad9e              // 20 9E AD
    jsr $b7f7              // 20 F7 B7
    jsr $8ea3              // 20 A3 8E
    jsr $8ea6              // 20 A6 8E
    ldy #$15               // A0 15
    jsr $8b40              // 20 40 8B
    jsr $8ea9              // 20 A9 8E
    lda #$25               // A9 25
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    lda $15                // A5 15
    beq b01_922A           // F0 03
    jsr $8e2d              // 20 2D 8E
b01_922A:
    lda $14                // A5 14
    jsr $8e2d              // 20 2D 8E
    jsr $8ea9              // 20 A9 8E
    ldx $14                // A6 14
    lda $15                // A5 15
    jsr $bdcd              // 20 CD BD
    lda $15                // A5 15
    bne b01_9252           // D0 15
    lda $14                // A5 14
    tax                    // AA
    and #$7f               // 29 7F
    cmp #$20               // C9 20
    bcc b01_9252           // 90 0C
    jsr $8ea9              // 20 A9 8E
    lda #$27               // A9 27
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    txa                    // 8A
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
b01_9252:
    rts                    // 60
    lda #$02               // A9 02
    sta $0166              // 8D 66 01
    jsr $8f3b              // 20 3B 8F
    sty $8d                // 84 8D
b01_925D:
    jsr $8ea3              // 20 A3 8E
    ldx $d6                // A6 D6
    stx $8f                // 86 8F
    jsr $92cd              // 20 CD 92
b01_9267:
    jsr b01_9141           // 20 41 91
    beq b01_9272           // F0 06
    jsr $927a              // 20 7A 92
    jmp b01_9267           // 4C 67 92
b01_9272:
    jsr $94bb              // 20 BB 94
    bcc b01_925D           // 90 E6
    jmp $8e58              // 4C 58 8E
bank01_sub_927A:
    jsr bank01_sub_8BCC              // 20 CC 8B
    lda #$c1               // A9 C1
    sta $0107              // 8D 07 01
    lda #$15               // A9 15
    sta $25                // 85 25
bank01_sub_9286:
    lda $ac                // A5 AC
    sec                    // 38
    sbc $25                // E5 25
    sta $c1                // 85 C1   I/O start addr lo
    lda $ad                // A5 AD
    sbc #$00               // E9 00
    sta $c2                // 85 C2   I/O start addr hi
    ldy #$01               // A0 01
bank01_sub_9295:
    sty $24                // 84 24
    jsr bank01_sub_9728              // 20 28 97
    jsr bank01_sub_9393              // 20 93 93
    ldy $24                // A4 24
    bcc bank01_sub_92A8              // 90 07
    iny                    // C8
    cpy $25                // C4 25
    bcc bank01_sub_9295              // 90 EF
    bcs bank01_sub_92BB              // B0 13
bank01_sub_92A8:
    tya                    // 98
    sec                    // 38
    adc $a8                // 65 A8
    cmp $25                // C5 25
    beq bank01_sub_92BE              // F0 0E
    tay                    // A8
    bcc bank01_sub_9295              // 90 E2
    dec $25                // C6 25
    bne bank01_sub_9286              // D0 CF
    ldy #$01               // A0 01
    bne bank01_sub_92BD              // D0 02
bank01_sub_92BB:
    ldy $25                // A4 25
bank01_sub_92BD:
    dey                    // 88
bank01_sub_92BE:
    tya                    // 98
    clc                    // 18
    adc $c1                // 65 C1   I/O start addr lo
    sta $ac                // 85 AC
    lda $c2                // A5 C2   I/O start addr hi
    adc #$00               // 69 00
    sta $ad                // 85 AD
    jsr bank01_sub_971D              // 20 1D 97
bank01_sub_92CD:
    ldy #$00               // A0 00
    sty $d3                // 84 D3
    ldy #$3e               // A0 3E
    jsr bank01_sub_8F7F              // 20 7F 8F
    ldy #$ad               // A0 AD
    jsr bank01_sub_8B3D              // 20 3D 8B
    ldy #$02               // A0 02
bank01_sub_92DD:
    jsr bank01_sub_9728              // 20 28 97
    sta $00a9,y            // 99 A9 00
    dey                    // 88
    bpl bank01_sub_92DD              // 10 F7
    lda $a9                // A5 A9
    jsr bank01_sub_9393              // 20 93 93
    pha                    // 48
    ldx $a8                // A6 A8
    inx                    // E8
bank01_sub_92EF:
    dex                    // CA
    bpl bank01_sub_92FE              // 10 0C
    jsr $8ea9              // 20 A9 8E
    jsr $8ea9              // 20 A9 8E
    jsr $8ea9              // 20 A9 8E
    jmp bank01_sub_9304              // 4C 04 93
bank01_sub_92FE:
    lda $00a9,y            // B9 A9 00
    jsr bank01_sub_8B22              // 20 22 8B
bank01_sub_9304:
    iny                    // C8
    cpy #$03               // C0 03
    bcc bank01_sub_92EF              // 90 E6
    jsr $8ea9              // 20 A9 8E
    jsr $8ea9              // 20 A9 8E
    pla                    // 68
    ldx #$03               // A2 03
    jsr bank01_sub_9371              // 20 71 93
    ldx #$06               // A2 06
bank01_sub_9317:
    cpx #$03               // E0 03
    bne bank01_sub_9330              // D0 15
    ldy $a8                // A4 A8
    beq bank01_sub_9330              // F0 11
bank01_sub_931F:
    lda $a7                // A5 A7
    cmp #$e8               // C9 E8
    php                    // 08
    lda $00a9,y            // B9 A9 00
    plp                    // 28
    bcs bank01_sub_9353              // B0 29
    jsr bank01_sub_8B27              // 20 27 8B
    dey                    // 88
    bne bank01_sub_931F              // D0 EF
bank01_sub_9330:
    asl $a7                // 06 A7
    bcc bank01_sub_9342              // 90 0E
    lda $94ae,x            // BD AE 94
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    lda $94b4,x            // BD B4 94
    beq bank01_sub_9342              // F0 03
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
bank01_sub_9342:
    dex                    // CA
    bne bank01_sub_9317              // D0 D2
bank01_sub_9345:
    inc $a8                // E6 A8
    lda #$20               // A9 20
    ldy $d3                // A4 D3
bank01_sub_934B:
    sta ($d1),y            // 91 D1
    iny                    // C8
    cpy #$28               // C0 28
    bcc bank01_sub_934B              // 90 F9
    rts                    // 60
bank01_sub_9353:
    ldx $ad                // A6 AD
    tay                    // A8
    bpl bank01_sub_9359              // 10 01
    dex                    // CA
bank01_sub_9359:
    sec                    // 38
    adc $ac                // 65 AC
    bcc bank01_sub_935F              // 90 01
    inx                    // E8
bank01_sub_935F:
    clc                    // 18
    adc #$01               // 69 01
    bne bank01_sub_9365              // D0 01
    inx                    // E8
bank01_sub_9365:
    pha                    // 48
    txa                    // 8A
    jsr bank01_sub_8B27              // 20 27 8B
    pla                    // 68
    jsr bank01_sub_8B27              // 20 27 8B
    jmp bank01_sub_9345              // 4C 45 93
bank01_sub_9371:
    tay                    // A8
    lda $93dd,y            // B9 DD 93
    sta $22                // 85 22
    lda $941d,y            // B9 1D 94
    sta $23                // 85 23
bank01_sub_937C:
    lda #$00               // A9 00
    ldy #$05               // A0 05
bank01_sub_9380:
    asl $23                // 06 23
    rol $22                // 26 22
    rol                  // 2A
    dey                    // 88
    bne bank01_sub_9380              // D0 F8
    adc #$3f               // 69 3F
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    dex                    // CA
    bne bank01_sub_937C              // D0 EC
    jmp $8ea9              // 4C A9 8E
bank01_sub_9393:
    tay                    // A8
    lsr                  // 4A
    bcc bank01_sub_93A2              // 90 0B
    lsr                  // 4A
    bcs bank01_sub_93B2              // B0 18
    cmp #$22               // C9 22
    beq bank01_sub_93B2              // F0 14
    and #$07               // 29 07
    ora #$80               // 09 80
bank01_sub_93A2:
    lsr                  // 4A
    tax                    // AA
    lda $945d,x            // BD 5D 94
    bcs bank01_sub_93AD              // B0 04
    lsr                  // 4A
    lsr                  // 4A
    lsr                  // 4A
    lsr                  // 4A
bank01_sub_93AD:
    and #$0f               // 29 0F
    clc                    // 18
    bne bank01_sub_93B7              // D0 05
bank01_sub_93B2:
    sec                    // 38
    ldy #$80               // A0 80
    lda #$00               // A9 00
bank01_sub_93B7:
    tax                    // AA
    php                    // 08
    lda $94a1,x            // BD A1 94
    sta $a7                // 85 A7
    and #$03               // 29 03
    sta $a8                // 85 A8
    tya                    // 98
    and #$8f               // 29 8F
    tax                    // AA
    tya                    // 98
    ldy #$03               // A0 03
    cpx #$8a               // E0 8A
    beq bank01_sub_93D8              // F0 0B
bank01_sub_93CD:
    lsr                  // 4A
    bcc bank01_sub_93D8              // 90 08
    lsr                  // 4A
bank01_sub_93D1:
    lsr                  // 4A
    ora #$20               // 09 20
    dey                    // 88
    bne bank01_sub_93D1              // D0 FA
    iny                    // C8
bank01_sub_93D8:
    dey                    // 88
    bne bank01_sub_93CD              // D0 F2
    plp                    // 28
    rts                    // 60
bank01_data_93DD:
.errorif (* != $93DD), "bank01_data_93DD shifted"
b01_940F:
b01_9417:
b01_946B:
b01_9473:
b01_947B:
b01_9483:
// --- $93DD-$94BA: table data (not 6502 code) ------------------------------
// Used by the monitor's disassembler: packed mnemonic/addressing-mode
// tables (compact 3x5-bit letter encoding plus mode/length nibbles).
b01_949B:
    .byte $1C, $8A, $1C, $23, $5D, $8B, $1B, $A1, $9D, $8A, $1D, $23, $9D, $8B, $1D, $A1    // data $93DD  "...#]......#...."
    .byte $00, $29, $19, $AE, $69, $A8, $19, $23, $24, $53, $1B, $23, $24, $53, $19, $A1    // data $93ED  ".).....#$S.#$S.."
    .byte $00, $1A, $5B, $5B, $A5, $69, $24, $24, $AE, $AE, $A8, $AD, $29, $00, $7C, $00    // data $93FD  "..[[..$$....)..."
    .byte $15, $9C, $6D, $9C, $A5, $69, $29, $53, $84, $13, $34, $11, $A5, $69, $23, $A0    // data $940D  "......)S..4...#."
    .byte $D8, $62, $5A, $48, $26, $62, $94, $88, $54, $44, $C8, $54, $68, $44, $E8, $94    // data $941D  "..ZH&...TD.T.D.."
    .byte $00, $B4, $08, $84, $74, $B4, $28, $6E, $74, $F4, $CC, $4A, $72, $F2, $A4, $8A    // data $942D  "......(....J...."
    .byte $00, $AA, $A2, $A2, $74, $74, $74, $72, $44, $68, $B2, $32, $B2, $00, $22, $00    // data $943D  "........D..2.."."
    .byte $1A, $1A, $26, $26, $72, $72, $88, $C8, $C4, $CA, $26, $48, $44, $44, $A2, $C8    // data $944D  "..&&......&HDD.."
    .byte $40, $02, $45, $03, $D0, $08, $40, $09, $30, $22, $45, $33, $D0, $08, $40, $09    // data $945D  "@.E...@.0"E3..@."
    .byte $40, $02, $45, $33, $D0, $08, $40, $09, $40, $02, $45, $B3, $D0, $08, $40, $09    // data $946D  "@.E3..@.@.E...@."
    .byte $00, $22, $44, $33, $D0, $8C, $44, $00, $11, $22, $44, $33, $D0, $8C, $44, $9A    // data $947D  "."D3..D.."D3..D."
    .byte $10, $22, $44, $33, $D0, $08, $40, $09, $10, $22, $44, $33, $D0, $08, $40, $09    // data $948D  "."D3..@.."D3..@."
    .byte $62, $13, $78, $A9, $00, $21, $81, $82, $00, $00, $59, $4D, $91, $92, $86, $4A    // data $949D  ".....!....YM...J"
    .byte $85, $9D, $2C, $29, $2C, $23, $28, $24, $59, $00, $58, $24, $24, $00    // data $94AD  "..,),#($Y.X$$."
bank01_sub_94BB:
    clc                    // 18
    lda $a8                // A5 A8
bank01_sub_94BE:
    adc $ac                // 65 AC
    sta $ac                // 85 AC
    bcc bank01_sub_94C8              // 90 04
    inc $ad                // E6 AD
    beq bank01_sub_94D0              // F0 08
bank01_sub_94C8:
    lda $ac                // A5 AC
    cmp $b0                // C5 B0
    lda $ad                // A5 AD
    sbc $b1                // E5 B1
bank01_sub_94D0:
    rts                    // 60
bank01_data_94D1:
.errorif (* != $94D1), "bank01_data_94D1 shifted"
    lda #$02               // A9 02
    sta $0166              // 8D 66 01
    jsr $8f1e              // 20 1E 8F
    bne b01_94DE           // D0 03
    jmp $8e58              // 4C 58 8E
b01_94DE:
    iny                    // C8
    bit $0168              // 2C 68 01
    bmi b01_950B           // 30 27
    cmp #$53               // C9 53
    beq b01_94EC           // F0 04
    cmp #$52               // C9 52
    bne b01_950B           // D0 1F
b01_94EC:
    sta $a7                // 85 A7
    lda ($7a),y            // B1 7A
    cmp #$5a               // C9 5A
    beq b01_94F8           // F0 04
    cmp #$46               // C9 46
    bne b01_950B           // D0 13
b01_94F8:
    sbc #$5a               // E9 5A
    pha                    // 48
    jsr $9ab6              // 20 B6 9A
    pla                    // 68
    ldx $a7                // A6 A7
    cpx #$53               // E0 53
    bne b01_9508           // D0 03
    jsr $9b18              // 20 18 9B
b01_9508:
    jmp $9667              // 4C 67 96
b01_950B:
    iny                    // C8
    lda ($7a),y            // B1 7A
    cmp #$20               // C9 20
    bne b01_9532           // D0 20
    lda $8e                // A5 8E
    cmp #$12               // C9 12
    bcs b01_9532           // B0 1A
    ldy #$ff               // A0 FF
b01_951A:
    iny                    // C8
    jsr $8f16              // 20 16 8F
    pha                    // 48
    lda $7a                // A5 7A   TXTPTR lo
    cmp #$12               // C9 12
    bcs b01_9529           // B0 04
    cpy #$02               // C0 02
    bcc b01_951A           // 90 F1
b01_9529:
    pla                    // 68
    jsr $9768              // 20 68 97
    dey                    // 88
    bpl b01_9529           // 10 F9
    bmi b01_9508           // 30 D6
b01_9532:
    dec $7a                // C6 7A   TXTPTR lo
b01_9534:
    inc $7a                // E6 7A   TXTPTR lo
    ldy #$00               // A0 00
    sty $51                // 84 51
    ldy #$03               // A0 03
b01_953C:
    dey                    // 88
    bmi $9576              // 30 37
    lda ($7a),y            // B1 7A
    beq $956a              // F0 27
    cmp #$20               // C9 20
    beq b01_9534           // F0 ED
    sec                    // 38
    sbc #$3f               // E9 3F
    ldx #$05               // A2 05
b01_954C:
    lsr                    // 4A
    ror $51                // 66 51
    ror $50                // 66 50
    dex                    // CA
    bne b01_954C           // D0 F8
    beq b01_953C           // F0 E6
    cmp #$47               // C9 47
    bcs $9568              // B0 0E
    cmp #$41               // C9 41
    bcs $9566              // B0 08
bank01_sub_955E:
    cmp #$3a               // C9 3A
    bcs $9568              // B0 06
    cmp #$30               // C9 30
    bcc $9568              // 90 02
    clc                    // 18
    bit $38                // 24 38   BASIC mem top hi
    rts                    // 60
bank01_sub_956A:
    lda $7a                // A5 7A   TXTPTR lo
    sta $d3                // 85 D3
    lda #$3f               // A9 3F
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    jmp bank01_sub_8E58              // 4C 58 8E
bank01_data_9576:
.errorif (* != $9576), "bank01_data_9576 shifted"
    inc $7a                // E6 7A   TXTPTR lo
    inc $7a                // E6 7A   TXTPTR lo
    stx $a6                // 86 A6
    ldx #$02               // A2 02
b01_957E:
    jsr $0073              // 20 73 00
b01_9581:
    jsr $0079              // 20 79 00
    beq b01_95BF           // F0 39
    cmp #$24               // C9 24
    beq b01_959A           // F0 10
    jsr $9556              // 20 56 95
    bcs b01_95BA           // B0 2B
    lda #$24               // A9 24
    jsr $97de              // 20 DE 97
    jsr $0079              // 20 79 00
    jmp b01_95A0           // 4C A0 95
b01_959A:
    jsr $97de              // 20 DE 97
    jsr $0073              // 20 73 00
b01_95A0:
    jsr $8eae              // 20 AE 8E
    bcs b01_9581           // B0 DC
    inc $a6                // E6 A6
    ldy $a6                // A4 A6
    cpy #$03               // C0 03
    beq $956a              // F0 BD
    sta $00a9,y            // 99 A9 00
    lda #$30               // A9 30
    jsr $97de              // 20 DE 97
    jsr $97de              // 20 DE 97
    bne b01_95A0           // D0 E6
b01_95BA:
    jsr $97de              // 20 DE 97
    bcc b01_957E           // 90 BF
b01_95BF:
    stx $a5                // 86 A5
    cpy #$02               // C0 02
    bne b01_95CD           // D0 08
    lda $ab                // A5 AB
    ldy $aa                // A4 AA
    sty $ab                // 84 AB
    sta $aa                // 85 AA
b01_95CD:
    ldx #$00               // A2 00
    stx $a9                // 86 A9
b01_95D1:
    ldx #$00               // A2 00
    stx $9f                // 86 9F
    lda $a9                // A5 A9
    jsr $9393              // 20 93 93
    ldx $a7                // A6 A7
    stx $64                // 86 64
    tax                    // AA
    lda $941d,x            // BD 1D 94
    jsr b01_9680           // 20 80 96
    lda $93dd,x            // BD DD 93
    jsr b01_9680           // 20 80 96
    ldx #$06               // A2 06
b01_95ED:
    cpx #$03               // E0 03
    bne b01_9603           // D0 12
    ldy $a8                // A4 A8
    beq b01_9603           // F0 0E
b01_95F5:
    lda $a7                // A5 A7
    cmp #$e8               // C9 E8
    lda #$30               // A9 30
    bcs b01_961A           // B0 1D
    jsr b01_967D           // 20 7D 96
    dey                    // 88
    bne b01_95F5           // D0 F2
b01_9603:
    asl $a7                // 06 A7
    bcc b01_9615           // 90 0E
    lda $94ae,x            // BD AE 94
    jsr b01_9680           // 20 80 96
    lda $94b4,x            // BD B4 94
    beq b01_9615           // F0 03
    jsr b01_9680           // 20 80 96
b01_9615:
    dex                    // CA
    bne b01_95ED           // D0 D5
    beq b01_9620           // F0 06
b01_961A:
    jsr b01_967D           // 20 7D 96
    jsr b01_967D           // 20 7D 96
b01_9620:
    lda $a5                // A5 A5
    cmp $9f                // C5 9F
    beq b01_9629           // F0 03
    jmp b01_968A           // 4C 8A 96
b01_9629:
    ldy $a8                // A4 A8
    beq b01_965E           // F0 31
    lda $64                // A5 64
    cmp #$9d               // C9 9D
    bne b01_9655           // D0 22
    lda $aa                // A5 AA
    sbc $ac                // E5 AC
    tax                    // AA
    lda $ab                // A5 AB
    sbc $ad                // E5 AD
    bcc b01_9646           // 90 08
    bne b01_9696           // D0 56
    cpx #$82               // E0 82
    bcs b01_9696           // B0 52
    bcc b01_964E           // 90 08
b01_9646:
    tay                    // A8
    iny                    // C8
    bne b01_9696           // D0 4C
    cpx #$82               // E0 82
    bcc b01_9696           // 90 48
b01_964E:
    dex                    // CA
    dex                    // CA
    txa                    // 8A
    ldy $a8                // A4 A8
    bne b01_9658           // D0 03
b01_9655:
    lda $00a9,y            // B9 A9 00
b01_9658:
    jsr $9768              // 20 68 97
    dey                    // 88
    bne b01_9655           // D0 F7
b01_965E:
    lda $a9                // A5 A9
    cmp #$02               // C9 02
    beq b01_9667           // F0 03
    jsr $9768              // 20 68 97
b01_9667:
    jsr $92cd              // 20 CD 92
    jsr $94bb              // 20 BB 94
    ldy #$41               // A0 41
    jsr $8f7c              // 20 7C 8F
    ldy #$ad               // A0 AD
    jsr $8b3d              // 20 3D 8B
    jsr $8ea9              // 20 A9 8E
    jmp $8e6c              // 4C 6C 8E
b01_967D:
    jsr b01_9680           // 20 80 96
b01_9680:
    stx $a4                // 86 A4
    ldx $9f                // A6 9F
    cmp $50,x              // D5 50
    beq b01_9691           // F0 09
    pla                    // 68
    pla                    // 68
b01_968A:
    inc $a9                // E6 A9
    beq b01_9696           // F0 08
    jmp b01_95D1           // 4C D1 95
b01_9691:
    inc $9f                // E6 9F
    ldx $a4                // A6 A4
    rts                    // 60
b01_9696:
    jmp $956a              // 4C 6A 95
    beq b01_96A3           // F0 08
    bcs b01_96B8           // B0 1B
    jsr $82b6              // 20 B6 82
    tax                    // AA
    bne b01_96B8           // D0 15
b01_96A3:
    lda #$2d               // A9 2D
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
b01_96A8:
    lda #$3e               // A9 3E
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    lda #$20               // A9 20
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    jsr $9f50              // 20 50 9F
    .byte $24, $80         // inline arg: cross-bank call target $8024
    rts                    // 60
b01_96B8:
    cmp #$23               // C9 23
    bne b01_96BF           // D0 03
    jmp $82b3              // 4C B3 82
b01_96BF:
    cmp #$2d               // C9 2D
    bne b01_96E2           // D0 1F
    ldx $d6                // A6 D6
    ldy #$00               // A0 00
    jsr $e50c              // 20 0C E5
    ldy #$00               // A0 00
b01_96CC:
    lda ($d1),y            // B1 D1
    cmp #$2d               // C9 2D
    beq b01_96D7           // F0 05
    iny                    // C8
    cpy #$4f               // C0 4F
    bne b01_96CC           // D0 F5
b01_96D7:
    lda #$1d               // A9 1D
    jsr $e716              // 20 16 E7   KERNAL screen CHROUT
    dey                    // 88
    bpl b01_96D7           // 10 F8
    jmp b01_96A8           // 4C A8 96
b01_96E2:
    cmp #$2a               // C9 2A
    beq b01_96E9           // F0 03
    jmp $97e9              // 4C E9 97
b01_96E9:
    jsr $970c              // 20 0C 97
    jsr $0073              // 20 73 00
    beq $970b              // F0 1A
    and #$0f               // 29 0F
    bne b01_96F7           // D0 02
    lda #$80               // A9 80
b01_96F7:
    tax                    // AA
    tay                    // A8
    jsr $0073              // 20 73 00
    beq $9705              // F0 07
    and #$0f               // 29 0F
    bne b01_9704           // D0 02
    lda #$80               // A9 80
b01_9704:
    tay                    // A8
bank01_sub_9705:
    stx $0161              // 8E 61 01
    sty $0162              // 8C 62 01
    rts                    // 60
bank01_sub_970C:
    ldx #$80               // A2 80
    ldy #$80               // A0 80
    bne bank01_sub_9705              // D0 F3
bank01_sub_9712:
    ldx #$58               // A2 58
bank01_sub_9714:
    lda $9f05,x            // BD 05 9F
    sta.abs $00ff,x            // 9D FF 00
    dex                    // CA
    bne bank01_sub_9714              // D0 F7
bank01_sub_971D:
    lda #$ac               // A9 AC
    sta $0107              // 8D 07 01
    rts                    // 60
bank01_data_9723:
.errorif (* != $9723), "bank01_data_9723 shifted"
    .byte $A9, $AC, $8D, $07, $01    // data $9723
bank01_sub_9728:
    bit $0161              // 2C 61 01
    bpl bank01_sub_9732              // 10 05
    lda #$ad               // A9 AD
    jmp $0100              // 4C 00 01
bank01_sub_9732:
    stx $14                // 86 14
    ldx $0107              // AE 07 01
    lda $ba                // A5 BA   current device
    pha                    // 48
    lda $0161              // AD 61 01
    sta $ba                // 85 BA   current device
    lda #$52               // A9 52
    jsr bank01_sub_9798              // 20 98 97
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    lda $ba                // A5 BA   current device
    jsr $ffb4              // 20 B4 FF   KERNAL TALK
    lda #$6f               // A9 6F
    jsr $ff96              // 20 96 FF   KERNAL TKSA
    jsr $ffa5              // 20 A5 FF   KERNAL ACPTR: serial byte in
    sta $15                // 85 15
    jsr $ffab              // 20 AB FF   KERNAL UNTLK
bank01_sub_9759:
    ldx $14                // A6 14
    pla                    // 68
    sta $ba                // 85 BA   current device
    lda $15                // A5 15
    rts                    // 60
bank01_data_9761:
.errorif (* != $9761), "bank01_data_9761 shifted"
    .byte $48, $A9, $C1, $8D, $07, $01, $68    // data $9761
bank01_sub_9768:
    sta $0136              // 8D 36 01
    bit $0162              // 2C 62 01
    bpl bank01_sub_9775              // 10 05
    lda #$8d               // A9 8D
    jmp $0100              // 4C 00 01
bank01_sub_9775:
    lda $ba                // A5 BA   current device
    pha                    // 48
    lda $0162              // AD 62 01
    sta $ba                // 85 BA   current device
    stx $14                // 86 14
    ldx $0107              // AE 07 01
    lda #$57               // A9 57
    jsr bank01_sub_9798              // 20 98 97
    lda $0136              // AD 36 01
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    lda #$0d               // A9 0D
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    jmp bank01_sub_9759              // 4C 59 97
bank01_sub_9798:
    jsr bank01_sub_97C7              // 20 C7 97
    tya                    // 98
    clc                    // 18
    adc $00,x              // 75 00
    php                    // 08
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    plp                    // 28
    lda $01,x              // B5 01   CPU port: mem banking
    adc #$00               // 69 00
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    lda #$01               // A9 01
    jmp $ffa8              // 4C A8 FF   KERNAL CIOUT: serial byte out
bank01_sub_97B0:
    lda #$00               // A9 00
    sta $90                // 85 90   KERNAL I/O status
    lda $ba                // A5 BA   current device
    jsr $ffb1              // 20 B1 FF   KERNAL LISTEN
    lda #$6f               // A9 6F
    jsr $ff93              // 20 93 FF   KERNAL SECOND
    lda $90                // A5 90   KERNAL I/O status
    bpl bank01_sub_97C5              // 10 03
    jmp $f707              // 4C 07 F7
bank01_sub_97C5:
    clc                    // 18
    rts                    // 60
bank01_sub_97C7:
    pha                    // 48
    jsr bank01_sub_97B0              // 20 B0 97
    bcc bank01_sub_97D0              // 90 03
    jmp $e0f9              // 4C F9 E0
bank01_sub_97D0:
    lda #$4d               // A9 4D
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    lda #$2d               // A9 2D
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    pla                    // 68
    jmp $ffa8              // 4C A8 FF   KERNAL CIOUT: serial byte out
bank01_data_97DE:
.errorif (* != $97DE), "bank01_data_97DE shifted"
    sta $50,x              // 95 50
    inx                    // E8
    cpx #$0a               // E0 0A
    bcc b01_97E8           // 90 03
    jmp $956a              // 4C 6A 95
b01_97E8:
    rts                    // 60
    cmp #$42               // C9 42
    bne b01_97FA           // D0 0D
    jsr $0073              // 20 73 00
    cmp #$52               // C9 52
    beq b01_982D           // F0 39
    cmp #$57               // C9 57
    beq b01_9830           // F0 38
    bne b01_981D           // D0 23
b01_97FA:
    cmp #$4d               // C9 4D
    bne b01_981D           // D0 1F
    jsr $0073              // 20 73 00
    cmp #$45               // C9 45
    bne b01_981D           // D0 18
    jsr $0073              // 20 73 00
    jsr $8f1e              // 20 1E 8F
    lda #$45               // A9 45
    jsr $97c7              // 20 C7 97
    lda $ac                // A5 AC
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    lda $ad                // A5 AD
    jsr $ffa8              // 20 A8 FF   KERNAL CIOUT: serial byte out
    jmp $ffae              // 4C AE FF   KERNAL UNLSN
b01_981D:
    cmp #$50               // C9 50
    bne b01_9824           // D0 03
    jmp $9d1c              // 4C 1C 9D
b01_9824:
    jsr $90dc              // 20 DC 90
    jsr $9f50              // 20 50 9F
    .byte $1B, $80         // inline arg: cross-bank call target $801B
    rts                    // 60
b01_982D:
    jmp b01_9833           // 4C 33 98
b01_9830:
    jmp $9853              // 4C 53 98
b01_9833:
    jsr $991e              // 20 1E 99
    bcs $984d              // B0 15
bank01_sub_9838:
    lda #$31               // A9 31
    jsr bank01_sub_9873              // 20 73 98
bank01_sub_983D:
    jsr bank01_sub_9900              // 20 00 99
    bcs bank01_sub_983D              // B0 FB
    ldy #$00               // A0 00
bank01_sub_9844:
    jsr $ffcf              // 20 CF FF   KERNAL CHRIN
    jsr bank01_sub_9768              // 20 68 97
    iny                    // C8
    bne bank01_sub_9844              // D0 F7
bank01_sub_984D:
    jsr $ffcc              // 20 CC FF   KERNAL CLRCHN
    jmp bank01_sub_9908              // 4C 08 99
bank01_data_9853:
.errorif (* != $9853), "bank01_data_9853 shifted"
    .byte $20, $1E, $99, $B0, $F5    // data $9853
bank01_sub_9858:
    jsr bank01_sub_989A              // 20 9A 98
bank01_sub_985B:
    jsr $98f8              // 20 F8 98
    bcs bank01_sub_985B              // B0 FB
    ldy #$00               // A0 00
bank01_sub_9862:
    jsr bank01_sub_9728              // 20 28 97
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    iny                    // C8
    bne bank01_sub_9862              // D0 F7
    jsr bank01_sub_9871              // 20 71 98
    jmp bank01_sub_984D              // 4C 4D 98
bank01_sub_9871:
    lda #$32               // A9 32
bank01_sub_9873:
    pha                    // 48
    jsr bank01_sub_98F5              // 20 F5 98
    lda #$55               // A9 55
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    pla                    // 68
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    jsr bank01_sub_9985              // 20 85 99   print inline string
    .byte $3A, $20, $33, $20, $30, $20, $00    // text: ": 3 0 " + terminator
bank01_data_988A:
.errorif (* != $988A), "bank01_data_988A shifted"
    .byte $A5, $25, $20, $B1, $98, $20, $A9, $8E, $A5, $26, $20, $B1, $98, $4C, $CC, $FF    // data $988A
bank01_sub_989A:
    lda #$00               // A9 00
    pha                    // 48
    jsr bank01_sub_98F5              // 20 F5 98
    jsr bank01_sub_9985              // 20 85 99
    .byte $42, $2D, $50, $20, $33, $20, $00    // data $98A3  text: "B-P 3 ."
    pla                    // 68
    jsr bank01_sub_98B1              // 20 B1 98
    jmp $ffcc              // 4C CC FF   KERNAL CLRCHN
bank01_sub_98B1:
    ldy #$00               // A0 00
    sta $5f                // 85 5F
    sty $60                // 84 60
    ldx #$10               // A2 10
    lda #$00               // A9 00
    tay                    // A8
    sta $5d                // 85 5D
    sty $5e                // 84 5E
    sed                    // F8
bank01_sub_98C1:
    asl $5f                // 06 5F
    rol $60                // 26 60
    adc $5d                // 65 5D
    sta $5d                // 85 5D
    pha                    // 48
    tya                    // 98
    adc $5e                // 65 5E
    sta $5e                // 85 5E
    tay                    // A8
    pla                    // 68
    dex                    // CA
    bne bank01_sub_98C1              // D0 ED
    cld                    // D8
    tya                    // 98
    ora #$30               // 09 30
    tay                    // A8
    lda $5d                // A5 5D
    lsr                  // 4A
    lsr                  // 4A
    lsr                  // 4A
    lsr                  // 4A
    ora #$30               // 09 30
    tax                    // AA
    lda $5d                // A5 5D
    and #$0f               // 29 0F
    ora #$30               // 09 30
    pha                    // 48
    tya                    // 98
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    txa                    // 8A
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    pla                    // 68
    jmp $ffd2              // 4C D2 FF   KERNAL CHROUT: print char
bank01_sub_98F5:
    ldx #$0f               // A2 0F
    bit $03a2              // 2C A2 03
    jmp $f250              // 4C 50 F2
bank01_data_98FD:
.errorif (* != $98FD), "bank01_data_98FD shifted"
    .byte $A2, $0F, $2C    // data $98FD
bank01_sub_9900:
    ldx #$03               // A2 03
    jmp $ffc6              // 4C C6 FF   KERNAL CHKIN
bank01_data_9905:
.errorif (* != $9905), "bank01_data_9905 shifted"
    .byte $A9, $0F, $2C    // data $9905
bank01_sub_9908:
    lda #$03               // A9 03
    jsr $ffc3              // 20 C3 FF   KERNAL CLOSE
    jsr $ffcc              // 20 CC FF   KERNAL CLRCHN
    clc                    // 18
    rts                    // 60
bank01_sub_9912:
    ldx $ba                // A6 BA   current device
    lda #$0f               // A9 0F
    tay                    // A8
    jsr $ffba              // 20 BA FF   KERNAL SETLFS: set file/dev/sec
    lda #$00               // A9 00
    beq bank01_sub_995E              // F0 40
    jsr $0073              // 20 73 00
    jsr bank01_sub_8F16              // 20 16 8F
    pha                    // 48
    jsr bank01_sub_8F16              // 20 16 8F
    tay                    // A8
    ldx #$cf               // A2 CF
    jsr $0079              // 20 79 00
    beq bank01_sub_9934              // F0 04
    jsr bank01_sub_8F16              // 20 16 8F
    tax                    // AA
bank01_sub_9934:
    pla                    // 68
bank01_sub_9935:
    sta $25                // 85 25
    sty $26                // 84 26
    stx $ad                // 86 AD
    lda #$00               // A9 00
    sta $ac                // 85 AC
    jsr bank01_sub_970C              // 20 0C 97
    jsr bank01_sub_97B0              // 20 B0 97
    bcs bank01_sub_996F              // B0 28
    jsr $ffae              // 20 AE FF   KERNAL UNLSN
    jsr $ffe7              // 20 E7 FF   KERNAL CLALL
    jsr bank01_sub_9912              // 20 12 99
    ldx $ba                // A6 BA   current device
    lda #$03               // A9 03
    tay                    // A8
    jsr $ffba              // 20 BA FF   KERNAL SETLFS: set file/dev/sec
    lda #$01               // A9 01
    ldx #$84               // A2 84
    ldy #$99               // A0 99
bank01_sub_995E:
    jsr $ffbd              // 20 BD FF   KERNAL SETNAM: set filename
    jmp $ffc0              // 4C C0 FF   KERNAL OPEN
bank01_api_10:
    sec                    // 38
    bit $18                // 24 18
    php                    // 08
    jsr bank01_sub_9935              // 20 35 99
    bcc bank01_sub_9970              // 90 03
    plp                    // 28
    sec                    // 38
bank01_sub_996F:
    rts                    // 60
bank01_sub_9970:
    jsr bank01_sub_9712              // 20 12 97
    stx $0163              // 8E 63 01
    lda #$34               // A9 34
    sta $0160              // 8D 60 01
    plp                    // 28
    bcc bank01_sub_9981              // 90 03
    jmp bank01_sub_9838              // 4C 38 98
bank01_sub_9981:
    jmp bank01_sub_9858              // 4C 58 98
bank01_data_9984:
.errorif (* != $9984), "bank01_data_9984 shifted"
    .byte $23    // data $9984
// --- $9985: print inline string. Pulls the return address, prints the
// $00-terminated PETSCII text that follows the jsr, resumes after it.
bank01_sub_9985:
    pla                    // 68
    sta $22                // 85 22
    pla                    // 68
    sta $23                // 85 23
    sty $24                // 84 24
    ldy #$00               // A0 00
bank01_sub_998F:
    inc $22                // E6 22
    bne bank01_sub_9995              // D0 02
    inc $23                // E6 23
bank01_sub_9995:
    lda ($22),y            // B1 22
    beq bank01_sub_999E              // F0 05
    jsr $ffd2              // 20 D2 FF   KERNAL CHROUT: print char
    bcc bank01_sub_998F              // 90 F1
bank01_sub_999E:
    ldy $24                // A4 24
    lda $23                // A5 23
    pha                    // 48
    lda $22                // A5 22
    pha                    // 48
    rts                    // 60
// --- $99A4-$9A00: machine-code monitor command table ----------------------
// Command characters ("H'XMRLFCHTWGD:;PSVNA>I,B*$@-JU", the "H'" is just
// before this block) followed by one handler address (lo/hi pair) per
// character at $99C4: H=$89D6 '=$8B64 X=$8E4F M=$916F R=$8C65 L=$8C84
// F=$8CDF C=$8D0A H=$8D67 T=$8D9B W=$9252 G=$8A30 D=$8C06 :=$915A
// ;=$91A8 P=$9172 S=$91F8 V=$94D0 N=$94D0 A=$8B4C >=$8A33 I=$8C2E ...
// ($ = directory -> $9A3F etc.; tail entries partially overlap other data)
bank01_data_99A7:
.errorif (* != $99A7), "bank01_data_99A7 shifted"
b01_99A7:
    .byte $58, $4D, $52, $4C, $46, $43, $48, $54, $57, $47, $44, $3A, $3B, $50, $53, $56    // data $99A7  text: "XMRLFCHTWGD:;PSV"
    .byte $4E, $41, $3E, $49, $2C, $42, $2A, $24, $40, $2D, $4A, $55, $00    // data $99B7  text: "NA>I,B*$@-JU."
    .byte $D6, $89, $64, $8B, $4F, $8E, $6F, $91, $65, $8C, $84, $8C, $DF, $8C, $0A, $8D    // data $99C4  handler addresses
    .byte $67, $8D, $9B, $8D, $52, $92, $30, $8A, $06, $8C, $5A, $91, $A8, $91, $72, $91    // data $99D4
    .byte $F8, $91, $D0, $94, $D0, $94, $4C, $8B, $33, $8A, $2E, $8C, $FF, $9E, $14, $80    // data $99E4
    .byte $98, $96, $3F, $9A, $5C, $8B, $44, $8C, $2C, $68, $01, $30, $39    // data $99F4
// --- $9A01: '$' directory command code
    jsr $e544              // 20 44 E5   KERNAL clear screen
    ldx #$90               // A2 90
    ldy #$d0               // A0 D0
    lda #$00               // A9 00
    sta $c1                // 85 C1   I/O start addr lo
    sty $c2                // 84 C2   I/O start addr hi
    jsr $8ea3              // 20 A3 8E
b01_9A11:
    ldy #$2d               // A0 2D
    jsr $8f7c              // 20 7C 8F
    ldy #$c2               // A0 C2
    jsr $8b40              // 20 40 8B
    ldy #$08               // A0 08
b01_9A1D:
    lda $0800,x            // BD 00 08
    jsr $8b22              // 20 22 8B
    inc $c1                // E6 C1   I/O start addr lo
    inx                    // E8
    dey                    // 88
    bne b01_9A1D           // D0 F4
    cpx #$e0               // E0 E0
    beq b01_9A3A           // F0 0D
    ldy #$dc               // A0 DC
    cpx #$c0               // E0 C0
    beq $9a08              // F0 D5
    iny                    // C8
    cpx #$d0               // E0 D0
    beq $9a08              // F0 D0
    bne b01_9A11           // D0 D7
b01_9A3A:
    jsr $8ea3              // 20 A3 8E
    jmp $8e50              // 4C 50 8E
    jsr $8f24              // 20 24 8F
    ldx #$90               // A2 90
    lda $c2                // A5 C2   I/O start addr hi
    cmp #$d0               // C9 D0
    beq b01_9A57           // F0 0C
    ldx #$c0               // A2 C0
    cmp #$dc               // C9 DC
    beq b01_9A57           // F0 06
    ldx #$d0               // A2 D0
    cmp #$dd               // C9 DD
    bne b01_9A6F           // D0 18
b01_9A57:
    txa                    // 8A
    clc                    // 18
    adc $c1                // 65 C1   I/O start addr lo
    bcs b01_9A6F           // B0 12
    cmp #$d9               // C9 D9
    bcs b01_9A6F           // B0 0E
    tay                    // A8
    ldx #$08               // A2 08
b01_9A64:
    jsr $8f16              // 20 16 8F
    sta $0800,y            // 99 00 08
    iny                    // C8
    dex                    // CA
    bne b01_9A64           // D0 F6
    rts                    // 60
b01_9A6F:
    jmp $956a              // 4C 6A 95
bank01_sub_9A72:
    lda $0159              // AD 59 01
    sec                    // 38
    sbc #$03               // E9 03
    sta $ac                // 85 AC
    lda $0158              // AD 58 01
    sbc #$00               // E9 00
    sta $ad                // 85 AD
    jsr bank01_sub_9AB6              // 20 B6 9A
    bcc bank01_sub_9A95              // 90 0F
    lda #$01               // A9 01
    jsr bank01_sub_94BE              // 20 BE 94
    jsr bank01_sub_9AB6              // 20 B6 9A
    bcc bank01_sub_9A95              // 90 05
    lda #$00               // A9 00
    jsr bank01_sub_94BE              // 20 BE 94
bank01_sub_9A95:
    lda $ac                // A5 AC
    sta $0159              // 8D 59 01
    lda $ad                // A5 AD
    sta $0158              // 8D 58 01
    ldx #$04               // A2 04
bank01_sub_9AA1:
    lda $0840,x            // BD 40 08
    sta $ac                // 85 AC
    lda $0845,x            // BD 45 08
    sta $ad                // 85 AD
    ora $ac                // 05 AC
    beq bank01_sub_9AB2              // F0 03
    jsr bank01_sub_9ACB              // 20 CB 9A
bank01_sub_9AB2:
    dex                    // CA
    bpl bank01_sub_9AA1              // 10 EC
    rts                    // 60
bank01_sub_9AB6:
    ldx #$04               // A2 04
bank01_sub_9AB8:
    lda $0840,x            // BD 40 08
    cmp $ac                // C5 AC
    bne bank01_sub_9AC6              // D0 07
    lda $0845,x            // BD 45 08
    cmp $ad                // C5 AD
    beq bank01_sub_9ACB              // F0 05
bank01_sub_9AC6:
    dex                    // CA
    bpl bank01_sub_9AB8              // 10 EF
    sec                    // 38
    rts                    // 60
bank01_sub_9ACB:
    lda #$00               // A9 00
    sta $0840,x            // 9D 40 08
    sta $0845,x            // 9D 45 08
    ldy $084a,x            // BC 4A 08
    bne bank01_sub_9AEE              // D0 16
    jsr bank01_sub_9728              // 20 28 97
    bne $9b13              // D0 36
    lda $0854,x            // BD 54 08
    cmp #$aa               // C9 AA
    bne $9b13              // D0 2F
    eor $0859,x            // 5D 59 08
    bne $9b13              // D0 2A
    sta $0859,x            // 9D 59 08
    beq bank01_sub_9B0B              // F0 1D
bank01_sub_9AEE:
    ldy #$02               // A0 02
bank01_sub_9AF0:
    jsr bank01_sub_9728              // 20 28 97
    cmp $9b15,y            // D9 15 9B
    bne $9b13              // D0 1B
    dey                    // 88
    bpl bank01_sub_9AF0              // 10 F5
    ldy #$02               // A0 02
    lda $0859,x            // BD 59 08
    jsr bank01_sub_9768              // 20 68 97
    dey                    // 88
    lda $0854,x            // BD 54 08
    jsr bank01_sub_9768              // 20 68 97
    dey                    // 88
bank01_sub_9B0B:
    lda $084f,x            // BD 4F 08
    jsr bank01_sub_9768              // 20 68 97
    clc                    // 18
    bit $38                // 24 38   BASIC mem top hi
    rts                    // 60
bank01_data_9B15:
.errorif (* != $9B15), "bank01_data_9B15 shifted"
    jsr $ded3              // 20 D3 DE
    tay                    // A8
    ldx #$04               // A2 04
b01_9B1B:
    lda $0840,x            // BD 40 08
    ora $0845,x            // 1D 45 08
    beq b01_9B27           // F0 04
    dex                    // CA
    bpl b01_9B1B           // 10 F5
    rts                    // 60
b01_9B27:
    lda $ac                // A5 AC
    sta $0840,x            // 9D 40 08
    lda $ad                // A5 AD
    sta $0845,x            // 9D 45 08
    lda #$aa               // A9 AA
    sta $0854,x            // 9D 54 08
    sta $0859,x            // 9D 59 08
    tya                    // 98
    pha                    // 48
    sta $084a,x            // 9D 4A 08
    ldy #$00               // A0 00
    jsr $9728              // 20 28 97
    sta $084f,x            // 9D 4F 08
    pla                    // 68
    beq b01_9B5A           // F0 11
    iny                    // C8
    jsr $9728              // 20 28 97
    sta $0854,x            // 9D 54 08
    iny                    // C8
    jsr $9728              // 20 28 97
    sta $0859,x            // 9D 59 08
b01_9B57:
    lda $9b15,y            // B9 15 9B
b01_9B5A:
    jsr $9768              // 20 68 97
    dey                    // 88
    bpl b01_9B57           // 10 F7
    lda #$0a               // A9 0A
    sta $08eb              // 8D EB 08
    rts                    // 60
    cmp #$0d               // C9 0D
    bne b01_9B7D           // D0 13
    ldx #$9f               // A2 9F
    ldy #$85               // A0 85
    jsr $de9d              // 20 9D DE
    cmp #$aa               // C9 AA
    bne $9b7b              // D0 06
    jsr $9b7b              // 20 7B 9B
    lda #$0a               // A9 0A
    bit $0da9              // 2C A9 0D
b01_9B7D:
    jsr $9b88              // 20 88 9B
    lda #$10               // A9 10
b01_9B82:
    bit $dd0d              // 2C 0D DD   CIA2 ICR (NMI control/ack)
    beq b01_9B82           // F0 FB
    rts                    // 60
bank01_sub_9B88:
    sta $dd01              // 8D 01 DD   CIA2 port B (user port)
    lda $dd0d              // AD 0D DD   CIA2 ICR (NMI control/ack)
    lda $dd00              // AD 00 DD   CIA2 port A (VIC bank, IEC lines)
    and #$fb               // 29 FB
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    ora #$04               // 09 04
    sta $dd00              // 8D 00 DD   CIA2 port A (VIC bank, IEC lines)
    rts                    // 60
bank01_sub_9B9C:
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
bank01_sub_9BB7:
    jsr bank01_sub_9B9C              // 20 9C 9B
    dec $dd03              // CE 03 DD   CIA2 DDR B
    clc                    // 18
    bit $dd0c              // 2C 0C DD
    bvs bank01_sub_9BE2              // 70 1F
    jsr bank01_sub_9B88              // 20 88 9B
    lda #$ff               // A9 FF
    sta $dc07              // 8D 07 DC
    lda #$19               // A9 19
    sta $dc0f              // 8D 0F DC   CIA1 CRB
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
bank01_sub_9BD3:
    lda $dd0d              // AD 0D DD   CIA2 ICR (NMI control/ack)
    and #$10               // 29 10
    bne bank01_sub_9BE2              // D0 08
    lda $dc0d              // AD 0D DC   CIA1 ICR (IRQ control/ack)
    and #$02               // 29 02
    beq bank01_sub_9BD3              // F0 F2
    sec                    // 38
bank01_sub_9BE2:
    rts                    // 60
bank01_api_03:
    ldx #$04               // A2 04
    jsr bank01_sub_83B7              // 20 B7 83
    ldx #$04               // A2 04
    jsr bank01_sub_9BF0              // 20 F0 9B
    jmp $de26              // 4C 26 DE
bank01_sub_9BF0:
    txa                    // 8A
    pha                    // 48
    jsr $f30f              // 20 0F F3
    beq bank01_sub_9BFC              // F0 05
bank01_sub_9BF7:
    pla                    // 68
    tax                    // AA
    jmp $f250              // 4C 50 F2
bank01_sub_9BFC:
    jsr $f31f              // 20 1F F3
    lda $ba                // A5 BA   current device
    cmp #$04               // C9 04
    bne bank01_sub_9BF7              // D0 F2
    sei                    // 78
    jsr bank01_sub_9BB7              // 20 B7 9B
    bcs bank01_sub_9BF7              // B0 EC
    lda #$04               // A9 04
    sta $9a                // 85 9A
    jsr bank01_sub_836F              // 20 6F 83
    lda $b9                // A5 B9   secondary addr
    and #$0f               // 29 0F
    cmp #$09               // C9 09
    beq bank01_sub_9C1C              // F0 02
    lda #$00               // A9 00
bank01_sub_9C1C:
    ora #$c0               // 09 C0
    sta $dd0c              // 8D 0C DD
    pla                    // 68
    clc                    // 18
    rts                    // 60
bank01_data_9C24:
.errorif (* != $9C24), "bank01_data_9C24 shifted"
b01_9C24:
    jmp $f1ca              // 4C CA F1
b01_9C27:
    bit $dd0c              // 2C 0C DD
    bpl b01_9C24           // 10 F8
    sei                    // 78
    sta $95                // 85 95
    pha                    // 48
    tya                    // 98
    pha                    // 48
    txa                    // 8A
    pha                    // 48
    lda #$ff               // A9 FF
    sta $dd03              // 8D 03 DD   CIA2 DDR B
    jsr b01_9C48           // 20 48 9C
    jsr $9bb1              // 20 B1 9B
    pla                    // 68
    tax                    // AA
    pla                    // 68
    tay                    // A8
    pla                    // 68
    clc                    // 18
    jmp $de26              // 4C 26 DE
b01_9C48:
    lda $95                // A5 95
    ldy $dd0c              // AC 0C DD
    cpy #$c9               // C0 C9
    beq b01_9C63           // F0 12
    lda $95                // A5 95
    cmp #$20               // C9 20
    bcs b01_9C6A           // B0 13
    cmp #$1b               // C9 1B
    beq b01_9C63           // F0 08
    cmp #$0d               // C9 0D
    beq b01_9C63           // F0 04
    cmp #$0a               // C9 0A
    bne b01_9C66           // D0 03
b01_9C63:
    jmp $9b66              // 4C 66 9B
b01_9C66:
    ora #$80               // 09 80
    bne b01_9C89           // D0 1F
b01_9C6A:
    tay                    // A8
    bmi b01_9C79           // 30 0C
    cmp #$60               // C9 60
    bcc b01_9C75           // 90 04
    and #$df               // 29 DF
    bne b01_9C89           // D0 14
b01_9C75:
    and #$3f               // 29 3F
    bpl b01_9C89           // 10 10
b01_9C79:
    cmp #$ff               // C9 FF
    bne b01_9C81           // D0 04
    lda #$5e               // A9 5E
    bne b01_9C89           // D0 08
b01_9C81:
    cmp #$a0               // C9 A0
    bcc b01_9C87           // 90 02
    eor #$c0               // 49 C0
b01_9C87:
    ora #$40               // 09 40
b01_9C89:
    sta $95                // 85 95
    cmp #$20               // C9 20
    bcs b01_9C93           // B0 04
    cmp #$1b               // C9 1B
    bcs b01_9CAF           // B0 1C
b01_9C93:
    lda $d018              // AD 18 D0   VIC memory setup (screen/charset base)
    lsr                    // 4A
    lsr                    // 4A
    lda #$40               // A9 40
    bcc b01_9C9E           // 90 02
    lda #$60               // A9 60
b01_9C9E:
    sta $a4                // 85 A4
    lda $95                // A5 95
    cmp $a4                // C5 A4
    bcs b01_9CAF           // B0 09
    cmp #$20               // C9 20
    bcs b01_9CAC           // B0 02
    ora $a4                // 05 A4
b01_9CAC:
    jmp $9b7d              // 4C 7D 9B
b01_9CAF:
    sta $95                // 85 95
    lda #$1b               // A9 1B
    jsr $9b7d              // 20 7D 9B
    lda #$4b               // A9 4B
    jsr $9b7d              // 20 7D 9B
    lda #$08               // A9 08
    jsr $9b7d              // 20 7D 9B
    lda #$00               // A9 00
    jsr $9b7d              // 20 7D 9B
    lda $97                // A5 97
    pha                    // 48
    lda $96                // A5 96
    pha                    // 48
    lda $d018              // AD 18 D0   VIC memory setup (screen/charset base)
    lsr                    // 4A
    and #$01               // 29 01
    ora #$1a               // 09 1A
    sta $97                // 85 97
    lda $95                // A5 95
    ldy #$03               // A0 03
b01_9CD9:
    asl                    // 0A
    rol $97                // 26 97
    dey                    // 88
    bne b01_9CD9           // D0 FA
    sta $96                // 85 96
    lda #$80               // A9 80
    sta $a4                // 85 A4
b01_9CE5:
    lda #$00               // A9 00
    sta $95                // 85 95
    lda $01                // A5 01   CPU port: mem banking
    tax                    // AA
    and #$fb               // 29 FB
    sta $01                // 85 01   CPU port: mem banking
    ldy #$07               // A0 07
b01_9CF2:
    lda ($96),y            // B1 96
    and $a4                // 25 A4
    beq b01_9CFF           // F0 07
    lda $95                // A5 95
    ora $9d14,y            // 19 14 9D
    sta $95                // 85 95
b01_9CFF:
    dey                    // 88
    bpl b01_9CF2           // 10 F0
    stx $01                // 86 01   CPU port: mem banking
    lda $95                // A5 95
    jsr $9b7d              // 20 7D 9B
    lsr $a4                // 46 A4
    bcc b01_9CE5           // 90 D8
    pla                    // 68
    sta $96                // 85 96
    pla                    // 68
    sta $97                // 85 97
    rts                    // 60
    .byte $80, $40, $20, $10, $08, $04, $02, $01    // data $9D14  bit-mask table (bit 7..0)
    .byte $60    // data $9D1C  rts (stub routine)
// --- $9D1D: TASS/TMP launcher. Copied to RAM ($0170) and run from there:
// SEI, cart off via $DE00, RESTOR/CINT/IOINIT, programs REU $DF02-$DF08,
// DMAs REU $000800-$00FFFF over C64 RAM $0800-$FFFF, then jmp $8000.
    lda #$01               // A9 01
    pha                    // 48
    lda #$6f               // A9 6F
    pha                    // 48
    ldx #$50               // A2 50
b01_9D25:
    lda $9d2f,x            // BD 2F 9D
    sta $0170,x            // 9D 70 01
    dex                    // CA
    bpl b01_9D25           // 10 F7
    rts                    // 60
    sei                    // 78
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    lda #$0a               // A9 0A
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    jsr $ff8a              // 20 8A FF   KERNAL RESTOR: default vectors
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
bank01_data_9D74:
.errorif (* != $9D74), "bank01_data_9D74 shifted"
// --- HONDANI keyword check (wedge step 2) ----------------------------------
// Reached from the same-size hook at $83FF (was: tax / bne $8407).
// Runs after CHRGET ($0073): A = first non-space char, C = clear iff digit,
// Y = TXTPTR hi (as stored at $83FA), ($7A),y=0 addresses the current char.
// Must hand the stock scanner *exactly* the state it always saw:
// A = X = char, CHRGET carry intact, Y untouched.
hondani_check:
    tax                    // stock behavior: X = char, flags from A
    bne hondani_scan
    jmp hondani_return_zero    // A=0: empty line, Z still set for the beq
hondani_scan:
    php                    // save CHRGET carry ($8407 does bcs on it)
    tya
    pha                    // save Y
    ldy #$00
hondani_loop:
    lda hondani_word,y
    beq hondani_matched    // hit terminator: all 7 chars matched
    cmp ($7a),y
    bne hondani_nomatch
    iny
    bne hondani_loop       // always taken
hondani_nomatch:
// --- step 8: inert line tap (every non-empty, non-HONDANI typed line) -------
// Runs with CHRGET flags + Y safely on the stack (pushed above) and X = the
// current char (must survive -- only A/Y are used here). Three jobs, all
// behavior-neutral:
//  1. (Re)copy the 3-byte IERROR pass-through stub to $0340 (tape buffer;
//     freezer only touches $0334-$033B). Re-copied every line so nothing
//     that scribbles the buffer can leave a dangling vector.
//  2. Idempotently point IERROR ($0300/$0301) at the stub, saving the
//     previous vector to $03E7/$03E8 first. Stock RR rewrites $0300 in a
//     few flows (e.g. MERGE's $0150 trampoline, a $85C9 command hook) and
//     re-runs $E453 after -- the per-line reinstall absorbs all of that,
//     and because the stub is a pure jmp ($03E7) pass-through, ANY
//     interleaving behaves exactly stock.
//  3. Shadow-copy the raw pre-crunch line from ($7A) to $02A7 (unused
//     page-2 area; freezer resume scribbles $02A7-$02CA -- harmless,
//     rewritten every line). By IERROR time BASIC has tokenized $0200
//     ("STORY" would arrive as "ST<OR>Y"), hence this early copy. Bound:
//     store index <= $58, so the terminator lands at $02FF at worst --
//     never touches $0300.
// Step 9 will replace the stub with the real direct-mode-syntax-error ->
// cloud dispatch; this step proves the install/copy mechanics alone.
    ldy #hd_stub_end - hd_stub - 1
hd_stubcopy:
    lda hd_stub,y
    sta $0340,y
    dey
    bpl hd_stubcopy
    lda $0300              // already ours?
    cmp #$40
    bne hd_install
    lda $0301
    cmp #$03
    beq hd_installed
hd_install:
    lda $0300              // save whatever was live so the stub can
    sta $03e7              // fall through to it
    lda $0301
    sta $03e8
    lda #$40               // point IERROR at the RAM stub
    sta $0300
    lda #$03
    sta $0301
hd_installed:
    ldy #$00
hd_shadow:
    lda ($7a),y
    sta $02a7,y            // copies the $00 terminator too, then exits
    beq hd_done
    iny
    cpy #$59               // safety bound (BASIC always null-terminates)
    bcc hd_shadow
hd_done:
    pla
    tay                    // restore Y
    plp                    // restore CHRGET carry
    txa                    // restore A = current char
    jmp bank01_sub_8407    // stock scanner continues, state identical
hondani_matched:
    lda ($7a),y            // Y=7: char after the word
    cmp #$41               // alphabetic? (same >= 'A' test stock uses)
    bcs hondani_nomatch    // e.g. HONDANIX: not ours, stock errors as usual
    pla                    // discard saved Y
    plp
// From here mimic the stock match path at $848D byte-for-byte in effect:
    dey                    // Y=6: index of last matched char
    tya
    clc
    adc $7a
    sta $7a                // TXTPTR onto last char (stock quirk: no hi carry)
    jsr $83a9              // stock pre-handler housekeeping (lda #$08 entry)
    ldy #$00
    sty $b9                // clear secondary address, like stock match path
    lda #$e3
    pha
    lda #$7a
    pha                    // handler's rts continues at $E37B, like stock
    jsr $0073              // CHRGET past the word (stock: jmp $0073 + rts trick)
// --- HONDANI action (step 5a: cross-bank call to bank2 $991E) --------------
// Hand-rolled copy of the frame the stock $9F4E stub builds (same frame the
// stock `jsr $9F50` bank2 calls produce, just built inline). Gate ($9EDE)
// and restore ($9EE3) bytes are verified identical across banks, so the
// mirror-page flips mid-routine are seamless. After hondani_net's rts,
// $DEE3 restores bank01 and its final rts lands on the $E3/$7A continuation
// pushed above -> $E37B READY.
    lda #$08               // $DEE3 restore value: bank01
    pha
    lda #$de
    pha
    lda #$e2               // hondani_net's rts -> $DEE3 (restore bank01)
    pha
    lda #$99
    pha
    lda #$1e               // rti target: hondani_net = bank2 $991E
    pha
    php                    // flags for the gate's rti
    pha                    // A for the gate's pla (value irrelevant)
    lda #$10               // $DE00 bank2 value (bit 4), same as stock $DEEE table
    jmp $dede              // gate: sta $de00 / pla / rti
hondani_word:
    // Renamed HONDANI -> HDN (auto-arming step 1). The match loop above is
    // length-agnostic (it scans to this $00 terminator and derives the TXTPTR
    // advance from Y), so only the data changes; the 4-byte shrink is absorbed
    // by the pad below -> all downstream bank1 stays byte-identical.
    .byte $48, $44, $4E, $00    // "HDN",0 (PETSCII)
// Step 9a: the IERROR stub template moved out of this (full) pocket to the
// survey-clean $9E3A run so it can grow from 3 to 23 bytes (see hd_stub there).
    .fill $9E10 - *, $00   // pad pocket back to original size
.errorif (* != $9E10), "hondani pocket overflow"
    lda #$20               // A9 20
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda $01                // A5 01   CPU port: mem banking
    sta $de2e              // 8D 2E DE
    ora #$03               // 09 03
    sta $01                // 85 01   CPU port: mem banking
    lda #$08               // A9 08
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    plp                    // 28
    rts                    // 60
    php                    // 08
    pha                    // 48
    lda #$20               // A9 20
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda #$37               // A9 37
    sta $01                // 85 01   CPU port: mem banking
    lda #$0a               // A9 0A
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    plp                    // 28
    cli                    // 58
    rts                    // 60
bank01_data_9E3A:
.errorif (* != $9E3A), "bank01_data_9E3A shifted"
// --- step 9a: armed IERROR stub template ------------------------------------
// Was 31 zero bytes ($9E3A-$9E58), survey-clean: no operand anywhere in any
// bank references this run. Copied to RAM $0340 by hd_stubcopy every typed
// line and RUN THERE. Entered via jmp ($0300) with X = BASIC error index.
// Banks in bank2, calls hondani_err ($9B2E), banks back to bank1. C=0 => the
// line was handled -> re-enter BASIC's main loop (IMAIN, skips the stock
// error); C=1 => fall through to the saved stock IERROR vector ($03E7).
// Position-independence: every absolute operand is a fixed address ($de00,
// $9b2e, ($0302), ($03e7)); the only self-relative op is `bcs hd_pass`, whose
// displacement stays correct when the copy runs at $0340. X is left untouched
// on every C=1 path so the stock handler still sees the original error index.
hd_stub:
    sei                    // 78
    lda #$10               // A9 10   RR control: select bank2
    sta $de00              // 8D 00 DE
    jsr $9b2e              // 20 2E 9B   hondani_err (bank2, pinned address)
    lda #$08               // A9 08   RR control: restore bank1
    sta $de00              // 8D 00 DE
    cli                    // 58
    bcs hd_pass            // B0 03   C=1 -> stock IERROR
    jmp $e37b              // 4C 7B E3   handled -> BASIC warm start: prints
                           //            READY. + re-enters the wedge main loop
                           //            (same continuation every wedge command
                           //            rts's to; IMAIN $0302 alone skips READY)
hd_pass:
    jmp ($03e7)            // 6C E7 03   saved stock IERROR vector
hd_stub_end:
    .fill $9E59 - *, $00   // remaining zero fill to $9E59 (was all zeros)
.errorif (* != $9E59), "bank01 9E3A stub overflow"
    dec $01                // C6 01   CPU port: mem banking
    lda ($bb),y            // B1 BB
    inc $01                // E6 01   CPU port: mem banking
    rts                    // 60
    jsr $de26              // 20 26 DE
    lda $93                // A5 93
    bcc b01_9E6A           // 90 03
    jmp $f4a5              // 4C A5 F4
b01_9E6A:
    jmp $f5ed              // 4C ED F5
    sec                    // 38
    bit $18                // 24 18
    sta $93                // 85 93
    jsr $de97              // 20 97 DE
    jmp $8926              // 4C 26 89
    pha                    // 48
    lda $9a                // A5 9A
    cmp #$04               // C9 04
    bne b01_9E86           // D0 07
    pla                    // 68
    jsr $de97              // 20 97 DE
    jmp b01_9C27           // 4C 27 9C
b01_9E86:
    jmp $f1cd              // 4C CD F1
    jsr $de97              // 20 97 DE
    jmp $9bea              // 4C EA 9B
    nop                    // EA
    nop                    // EA
    jsr $de97              // 20 97 DE
    jmp $800f              // 4C 0F 80
    sei                    // 78
    php                    // 08
    pha                    // 48
    jmp $de10              // 4C 10 DE
    jsr $deba              // 20 BA DE
    jsr $0120              // 20 20 01
    jsr $de97              // 20 97 DE
    jmp $8de1              // 4C E1 8D
    jsr $deba              // 20 BA DE
    jsr $de97              // 20 97 DE
    jmp $9fa2              // 4C A2 9F
    nop                    // EA
    nop                    // EA
    nop                    // EA
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    rts                    // 60
    pha                    // 48
    sei                    // 78
    lda #$08               // A9 08
    pha                    // 48
    lda #$20               // A9 20
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    bit $8080              // 2C 80 80
    nop                    // EA
    lda #$23               // A9 23
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    brk                    // 00
    php                    // 08
    sei                    // 78
    pha                    // 48
    lda #$23               // A9 23
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    bit $8080              // 2C 80 80
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    pla                    // 68
    rti                    // 40
    nop                    // EA
    sta $9e                // 85 9E
    pla                    // 68
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    lda $9e                // A5 9E
    rts                    // 60
    php                    // 08
b01_9EEE:
    brk                    // 00
    php                    // 08
    bpl $9f0a              // 10 18
    jsr $230a              // 20 0A 23
    .byte $80    // 80  undocumented/illegal at $9EF5
    bit $00                // 24 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    brk                    // 00
    bmi b01_9EEE           // 30 EE
    jsr $9f50              // 20 50 9F
    .byte $30, $80         // inline arg: cross-bank call target $8030
    rts                    // 60
    sta $0137              // 8D 37 01
    stx $0144              // 8E 44 01
    ldx #$ac               // A2 AC
    sei                    // 78
    tya                    // 98
    clc                    // 18
    adc $00,x              // 75 00
    sta $0138              // 8D 38 01
    lda $01,x              // B5 01   CPU port: mem banking
    adc #$00               // 69 00
    cmp $0163              // CD 63 01
    bcs b01_9F21           // B0 02
    adc #$80               // 69 80
b01_9F21:
    sta $0139              // 8D 39 01
    ldx $0160              // AE 60 01
    lda #$08               // A9 08
    bcs b01_9F36           // B0 0B
b01_9F2B:
    lda $d012              // AD 12 D0   VIC raster
    sbc #$30               // E9 30
    bcs b01_9F2B           // B0 F9
    ldx #$37               // A2 37
    lda #$23               // A9 23
b01_9F36:
    sta $de00              // 8D 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    stx $01                // 86 01   CPU port: mem banking
    lda #$ff               // A9 FF
    sta $ffff              // 8D FF FF
    ldx #$37               // A2 37
    stx $01                // 86 01   CPU port: mem banking
    ldx #$08               // A2 08
    stx $de00              // 8E 00 DE   RR control: b0 GAME,b1 EXROM,b2 cart off,b3/b4/b7 bank,b5 RAM,b6 unfreeze
    ldx #$ff               // A2 FF
    and #$ff               // 29 FF
    rts                    // 60
// --- $9F4E: cross-bank call stub (bank01's copy of the mechanism) ---------
// `jsr $9F4E/$9F50/$9F51..$9F55` + 2-byte inline target address. Entry
// offset picks the destination bank from the $DEED table ($9F51->bank 3,
// each +1 -> next bank; $9F4E/$9F50 select banks 0/2). Fixes the return
// address past the inline word, pushes a return path through the $DEE3
// mirror (restore bank01), pushes the target, ends with `jmp $DEDE`
// (sta $de00 / pla / rti). See bank00 $9F01 for the same pattern.
bank01_sub_9F4E:
    nop                    // EA
    nop                    // EA
bank01_sub_9F50:
    nop                    // EA
bank01_sub_9F51:
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
    nop                    // EA
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
    bne bank01_sub_9F76              // D0 02
    dec $9f                // C6 9F
bank01_sub_9F76:
    dec $9e                // C6 9E
    ldy #$00               // A0 00
    lda ($9e),y            // B1 9E
    sec                    // 38
    sbc #$4e               // E9 4E
    tax                    // AA
    lda #$08               // A9 08
    pha                    // 48
    lda #$de               // A9 DE
    pha                    // 48
    lda #$e2               // A9 E2
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
bank01_data_9FA2:
.errorif (* != $9FA2), "bank01_data_9FA2 shifted"
    lda #$00               // A9 00
    sta $0d                // 85 0D
    jsr $0073              // 20 73 00
    cmp #$24               // C9 24
    bcc b01_9FB1           // 90 04
    cmp #$27               // C9 27
    bcc b01_9FBD           // 90 0C
b01_9FB1:
    lda #$ae               // A9 AE
    pha                    // 48
    lda #$8c               // A9 8C
    pha                    // 48
    jsr $0079              // 20 79 00
    jmp $de26              // 4C 26 DE
b01_9FBD:
    sta $9e                // 85 9E
    lda #$00               // A9 00
    ldx #$0a               // A2 0A
b01_9FC3:
    sta $5d,x              // 95 5D
    dex                    // CA
    bpl b01_9FC3           // 10 FB
b01_9FC8:
    jsr $0073              // 20 73 00
    ldy $9e                // A4 9E
    bcc b01_9FD5           // 90 06
    cmp #$41               // C9 41
    bcc b01_9FF2           // 90 1F
    sbc #$08               // E9 08
b01_9FD5:
    sbc #$2f               // E9 2F
    cmp $9fd2,y            // D9 D2 9F
    bcs b01_9FF2           // B0 16
    pha                    // 48
    lda $61                // A5 61
    beq b01_9FEB           // F0 0A
    adc $9fd6,y            // 79 D6 9F
    bcc b01_9FE9           // 90 03
    jmp $b97e              // 4C 7E B9
b01_9FE9:
    sta $61                // 85 61
b01_9FEB:
    pla                    // 68
    jsr $bd7e              // 20 7E BD
    jmp b01_9FC8           // 4C C8 9F
b01_9FF2:
    clc                    // 18
    jmp $de26              // 4C 26 DE
    bpl b01_9FFA           // 10 02
    php                    // 08
    brk                    // 00
b01_9FFA:
    .byte $04    // 04  undocumented/illegal at $9FFA
    ora ($03,x)            // 01 03
    brk                    // 00
    brk                    // 00
    brk                    // 00
