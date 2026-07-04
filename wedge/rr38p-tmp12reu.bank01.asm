// disassembly for rr38p-tmp12reu.bin bank 1
// bank file offset: $2000-$3fff
// cartridge window: $8000-$9fff
// vectors: coldstart=$8009, warmstart=$800c, signature=c3 c2 cd 38 30
// reachable instructions: 1597 bytes decoded as code: 3305
// entry points: $8009, $800c, $8021, $805b, $80b9, $82b3, $82d2, $831d, $8341, $83d0, $899a, $9964, $9966, $9be3
// jump table from cold start:
//   $8009 -> $805b
//   $800c -> $80b9
//   $800f -> $83d0
//   $8012 -> $9be3
//   $8015 -> $82d2
//   $8018 -> $82b3
//   $801b -> $831d
//   $801e -> $899a
//   $8021 -> $8021
//   $8024 -> $8341
//   $8027 -> $9964
//   $802a -> $9966
// external branch/jsr/jmp targets: $0073, $0079, $0100, $0210, $2033, $6800, $a571, $a66f, $a96b, $aaca, $ad8a, $b1b8, $b79e, $bc49, $bdcd, $bddd, $de26, $de97, $de9d, $dea9, $ded3, $dede, $dee7, $e0f9, $e3bf, $e422, $e453, $e5b4, $e602, $e63a, $e716, $ea13, $ea24, $f250, $f30f, $f31f, $f6bc, $f6ed, $f707, $f713, $f9a0, $fda3, $fe72, $ff5b, $ff93, $ff96, $ffa5, $ffa8, $ffab, $ffae, $ffb1, $ffb4, $ffba, $ffbd, $ffc0, $ffc3, $ffc6, $ffcc, $ffcf, $ffd2, $ffe7, $fff0

// symbol table (auto-generated)
//   $8009 bank01_cold_start
//   $800c bank01_warm_start
//   $8021 bank01_api_08
//   $802d bank01_sub_802d
//   $805a bank01_sub_805a
//   $805b bank01_api_00
//   $8088 bank01_sub_8088
//   $80a9 bank01_sub_80a9
//   $80b3 bank01_sub_80b3
//   $80b9 bank01_api_01
//   $80c7 bank01_sub_80c7
//   $80c9 bank01_sub_80c9
//   $8115 bank01_sub_8115
//   $8147 bank01_sub_8147
//   $814e bank01_sub_814e
//   $8162 bank01_sub_8162
//   $81eb bank01_sub_81eb
//   $81f3 bank01_sub_81f3
//   $821c bank01_sub_821c
//   $82b3 bank01_api_05
//   $82b6 bank01_sub_82b6
//   $82c4 bank01_sub_82c4
//   $82d2 bank01_api_04
//   $82dd bank01_sub_82dd
//   $831d bank01_api_06
//   $8341 bank01_api_09
//   $8352 bank01_sub_8352
//   $8361 bank01_sub_8361
//   $8364 bank01_sub_8364
//   $836f bank01_sub_836f
//   $8382 bank01_sub_8382
//   $8385 bank01_sub_8385
//   $839a bank01_sub_839a
//   $83a4 bank01_sub_83a4
//   $83a6 bank01_sub_83a6
//   $83ab bank01_sub_83ab
//   $83b7 bank01_sub_83b7
//   $83c5 bank01_sub_83c5
//   $83ca bank01_sub_83ca
//   $83d0 bank01_api_02
//   $83d8 bank01_sub_83d8
//   $83e9 bank01_sub_83e9
//   $8407 bank01_sub_8407
//   $841c bank01_sub_841c
//   $8439 bank01_sub_8439
//   $843d bank01_sub_843d
//   $8444 bank01_sub_8444
//   $844a bank01_sub_844a
//   $8450 bank01_sub_8450
//   $8457 bank01_sub_8457
//   $8459 bank01_sub_8459
//   $845d bank01_sub_845d
//   $846c bank01_sub_846c
//   $8476 bank01_sub_8476
//   $847e bank01_sub_847e
//   $8485 bank01_sub_8485
//   $848d bank01_sub_848d
//   $86f8 bank01_sub_86f8
//   $870d bank01_sub_870d
//   $872c bank01_sub_872c
//   $873f bank01_sub_873f
//   $8742 bank01_sub_8742
//   $8744 bank01_sub_8744
//   $8764 bank01_sub_8764
//   $877b bank01_sub_877b
//   $8781 bank01_sub_8781
//   $8799 bank01_sub_8799
//   $879c bank01_sub_879c
//   $87a9 bank01_sub_87a9
//   $87ad bank01_sub_87ad
//   $87af bank01_sub_87af
//   $87bf bank01_sub_87bf
//   $87c2 bank01_sub_87c2
//   $87c7 bank01_sub_87c7
//   $87ce bank01_sub_87ce
//   $87d0 bank01_sub_87d0
//   $87d9 bank01_sub_87d9
//   $87e5 bank01_sub_87e5
//   $87e7 bank01_sub_87e7
//   $87ea bank01_sub_87ea
//   $87f8 bank01_sub_87f8
//   $8805 bank01_sub_8805
//   $8811 bank01_sub_8811
//   $8813 bank01_sub_8813
//   $881f bank01_sub_881f
//   $8827 bank01_sub_8827
//   $882b bank01_sub_882b
//   $8833 bank01_sub_8833
//   $8836 bank01_sub_8836
//   $8838 bank01_sub_8838
//   $883c bank01_sub_883c
//   $884b bank01_sub_884b
//   $884f bank01_sub_884f
//   $8862 bank01_sub_8862
//   $8872 bank01_sub_8872
//   $8877 bank01_sub_8877
//   $8886 bank01_sub_8886
//   $8893 bank01_sub_8893
//   $88a5 bank01_sub_88a5
//   $899a bank01_api_07
//   $899f bank01_sub_899f
//   $89c7 bank01_sub_89c7
//   $89d4 bank01_sub_89d4
//   $89f2 bank01_sub_89f2
//   $8a15 bank01_sub_8a15
//   $8a18 bank01_sub_8a18
//   $8a23 bank01_sub_8a23
//   $8ab7 bank01_sub_8ab7
//   $8ad5 bank01_sub_8ad5
//   $8af2 bank01_sub_8af2
//   $8af4 bank01_sub_8af4
//   $8aff bank01_sub_8aff
//   $8b04 bank01_sub_8b04
//   $8b16 bank01_sub_8b16
//   $8b18 bank01_sub_8b18
//   $8b22 bank01_sub_8b22
//   $8b27 bank01_sub_8b27
//   $8b32 bank01_sub_8b32
//   $8b38 bank01_sub_8b38
//   $8b3d bank01_sub_8b3d
//   $8b40 bank01_sub_8b40
//   $8b9e bank01_sub_8b9e
//   $8ba9 bank01_sub_8ba9
//   $8bcc bank01_sub_8bcc
//   $8be9 bank01_sub_8be9
//   $8beb bank01_sub_8beb
//   $8bef bank01_sub_8bef
//   $8bfa bank01_sub_8bfa
//   $8bfb bank01_sub_8bfb
//   $8c06 bank01_sub_8c06
//   $8e08 bank01_sub_8e08
//   $8e1c bank01_sub_8e1c
//   $8e2e bank01_sub_8e2e
//   $8e3d bank01_sub_8e3d
//   $8e50 bank01_sub_8e50
//   $8e58 bank01_sub_8e58
//   $8e64 bank01_sub_8e64
//   $8e67 bank01_sub_8e67
//   $8e7a bank01_sub_8e7a
//   $8e83 bank01_sub_8e83
//   $8e8d bank01_sub_8e8d
//   $8ea3 bank01_sub_8ea3
//   $8eae bank01_sub_8eae
//   $8ed6 bank01_sub_8ed6
//   $8edd bank01_sub_8edd
//   $8f02 bank01_sub_8f02
//   $8f07 bank01_sub_8f07
//   $8f12 bank01_sub_8f12
//   $8f15 bank01_sub_8f15
//   $8f16 bank01_sub_8f16
//   $8f1e bank01_sub_8f1e
//   $8f7c bank01_sub_8f7c
//   $8f7f bank01_sub_8f7f
//   $8f88 bank01_sub_8f88
//   $8f95 bank01_sub_8f95
//   $8fa7 bank01_sub_8fa7
//   $8fb2 bank01_sub_8fb2
//   $8fb3 bank01_sub_8fb3
//   $8fd3 bank01_sub_8fd3
//   $8fd6 bank01_sub_8fd6
//   $8fea bank01_sub_8fea
//   $8ff6 bank01_sub_8ff6
//   $8ffb bank01_sub_8ffb
//   $9001 bank01_sub_9001
//   $9004 bank01_sub_9004
//   $90dc bank01_sub_90dc
//   $90e6 bank01_sub_90e6
//   $90f2 bank01_sub_90f2
//   $90fd bank01_sub_90fd
//   $927a bank01_sub_927a
//   $9286 bank01_sub_9286
//   $9295 bank01_sub_9295
//   $92a8 bank01_sub_92a8
//   $92bb bank01_sub_92bb
//   $92bd bank01_sub_92bd
//   $92be bank01_sub_92be
//   $92cd bank01_sub_92cd
//   $92dd bank01_sub_92dd
//   $92ef bank01_sub_92ef
//   $92fe bank01_sub_92fe
//   $9304 bank01_sub_9304
//   $9317 bank01_sub_9317
//   $931f bank01_sub_931f
//   $9330 bank01_sub_9330
//   $9342 bank01_sub_9342
//   $9345 bank01_sub_9345
//   $934b bank01_sub_934b
//   $9353 bank01_sub_9353
//   $9359 bank01_sub_9359
//   $935f bank01_sub_935f
//   $9365 bank01_sub_9365
//   $9371 bank01_sub_9371
//   $937c bank01_sub_937c
//   $9380 bank01_sub_9380
//   $9393 bank01_sub_9393
//   $93a2 bank01_sub_93a2
//   $93ad bank01_sub_93ad
//   $93b2 bank01_sub_93b2
//   $93b7 bank01_sub_93b7
//   $93cd bank01_sub_93cd
//   $93d1 bank01_sub_93d1
//   $93d8 bank01_sub_93d8
//   $94bb bank01_sub_94bb
//   $94be bank01_sub_94be
//   $94c8 bank01_sub_94c8
//   $94d0 bank01_sub_94d0
//   $955e bank01_sub_955e
//   $956a bank01_sub_956a
//   $9705 bank01_sub_9705
//   $970c bank01_sub_970c
//   $9712 bank01_sub_9712
//   $9714 bank01_sub_9714
//   $971d bank01_sub_971d
//   $9728 bank01_sub_9728
//   $9732 bank01_sub_9732
//   $9759 bank01_sub_9759
//   $9768 bank01_sub_9768
//   $9775 bank01_sub_9775
//   $9798 bank01_sub_9798
//   $97b0 bank01_sub_97b0
//   $97c5 bank01_sub_97c5
//   $97c7 bank01_sub_97c7
//   $97d0 bank01_sub_97d0
//   $9838 bank01_sub_9838
//   $983d bank01_sub_983d
//   $9844 bank01_sub_9844
//   $984d bank01_sub_984d
//   $9858 bank01_sub_9858
//   $985b bank01_sub_985b
//   $9862 bank01_sub_9862
//   $9871 bank01_sub_9871
//   $9873 bank01_sub_9873
//   $989a bank01_sub_989a
//   $98b1 bank01_sub_98b1
//   $98c1 bank01_sub_98c1
//   $98f5 bank01_sub_98f5
//   $9900 bank01_sub_9900
//   $9908 bank01_sub_9908
//   $9912 bank01_sub_9912
//   $9934 bank01_sub_9934
//   $9935 bank01_sub_9935
//   $995e bank01_sub_995e
//   $9964 bank01_api_10
//   $9966 bank01_api_11
//   $996f bank01_sub_996f
//   $9970 bank01_sub_9970
//   $9981 bank01_sub_9981
//   $9985 bank01_sub_9985
//   $998f bank01_sub_998f
//   $9995 bank01_sub_9995
//   $999e bank01_sub_999e
//   $9a72 bank01_sub_9a72
//   $9a95 bank01_sub_9a95
//   $9aa1 bank01_sub_9aa1
//   $9ab2 bank01_sub_9ab2
//   $9ab6 bank01_sub_9ab6
//   $9ab8 bank01_sub_9ab8
//   $9ac6 bank01_sub_9ac6
//   $9acb bank01_sub_9acb
//   $9aee bank01_sub_9aee
//   $9af0 bank01_sub_9af0
//   $9b0b bank01_sub_9b0b
//   $9b88 bank01_sub_9b88
//   $9b9c bank01_sub_9b9c
//   $9bb7 bank01_sub_9bb7
//   $9bd3 bank01_sub_9bd3
//   $9be2 bank01_sub_9be2
//   $9be3 bank01_api_03
//   $9bf0 bank01_sub_9bf0
//   $9bf7 bank01_sub_9bf7
//   $9bfc bank01_sub_9bfc
//   $9c1c bank01_sub_9c1c
//   $9f4e bank01_sub_9f4e
//   $9f50 bank01_sub_9f50
//   $9f51 bank01_sub_9f51
//   $9f76 bank01_sub_9f76

.pc = $8000

    .byte $09, $80, $0c, $80, $c3, $c2, $cd, $38, $30    // data $8000
bank01_cold_start:
    jmp bank01_api_00              // 4c 5b 80
bank01_warm_start:
    jmp bank01_api_01              // 4c b9 80
    .byte $4c, $d0, $83, $4c, $e3, $9b, $4c, $d2, $82, $4c, $b3, $82, $4c, $1d, $83, $4c    // data $800f
    .byte $9a, $89    // data $801f
bank01_api_08:
    jmp bank01_api_08              // 4c 21 80
    .byte $4c, $41, $83, $4c, $64, $99, $4c, $66, $99    // data $8024
bank01_sub_802d:
    lda $0303              // ad 03 03
    cmp #$de               // c9 de
    bne bank01_sub_805a              // d0 26
    ldx #$01               // a2 01
    lda $0302              // ad 02 03
    cmp #$8f               // c9 8f
    beq bank01_sub_805a              // f0 1d
    lda #$80               // a9 80
    pha                    // 48
    lda #$0e               // a9 0e
    pha                    // 48
    lda $deee,x            // bd ee de
    jmp $dee7              // 4c e7 de
    .byte $20, $dc, $90, $a0, $1f, $b1, $bb, $99, $30, $02, $88, $10, $f8, $a9, $30, $85    // data $8049
    .byte $bb    // data $8059
bank01_sub_805a:
    rts                    // 60
bank01_api_00:
    sei                    // 78
    ldx #$fb               // a2 fb
    cld                    // d8
    txs                    // 9a
    jsr $fda3              // 20 a3 fd
    jsr bank01_sub_9f51              // 20 51 9f
    ora #$80               // 09 80
    jsr $ff5b              // 20 5b ff
    jsr $e453              // 20 53 e4
    jsr bank01_api_06              // 20 1d 83
    jsr $e3bf              // 20 bf e3
    jsr $e422              // 20 22 e4
    jsr bank01_sub_83ca              // 20 ca 83
    jsr bank01_sub_9f51              // 20 51 9f
    pha                    // 48
    .byte $80    // undocumented opcode
    lda #$e3               // a9 e3
    pha                    // 48
    lda #$85               // a9 85
    sta $0313              // 8d 13 03
    pha                    // 48
bank01_sub_8088:
    bit $c5                // 24 c5
    bvc bank01_sub_8088              // 50 fc
    ldx #$9f               // a2 9f
    ldy #$80               // a0 80
    lda #$00               // a9 00
    sta $030f              // 8d 0f 03
    sta $c6                // 85 c6
    jsr $dea9              // 20 a9 de
    ldx #$95               // a2 95
    ldy #$99               // a0 99
    jsr $de9d              // 20 9d de
    cmp #$01               // c9 01
    beq bank01_sub_80b3              // f0 0e
    ldx #$03               // a2 03
    ldy #$03               // a0 03
bank01_sub_80a9:
    lda $8309,x            // bd 09 83
    sta $0330,y            // 99 30 03
    dex                    // ca
    dey                    // 88
    bpl bank01_sub_80a9              // 10 f6
bank01_sub_80b3:
    jsr $de97              // 20 97 de
    jmp $de26              // 4c 26 de
bank01_api_01:
    jsr bank01_sub_802d              // 20 2d 80
    jsr $f6bc              // 20 bc f6
    jsr $f6ed              // 20 ed f6
    beq bank01_sub_80c7              // f0 03
    jmp $fe72              // 4c 72 fe
bank01_sub_80c7:
    ldx #$00               // a2 00
bank01_sub_80c9:
    dex                    // ca
    nop                    // ea
    bne bank01_sub_80c9              // d0 fc
    stx $dd0c              // 8e 0c dd
    jsr bank01_sub_9f51              // 20 51 9f
    asl $2080,x            // 1e 80 20
    ora $2083,x            // 1d 83 20
    .byte $a3    // undocumented opcode
    sbc $1820,x            // fd 20 18
    sbc $6c                // e5 6c
    .byte $02    // undocumented opcode
    ldy #$20               // a0 20
    eor ($9f),y            // 51 9f
    .byte $3c    // undocumented opcode
    .byte $80    // undocumented opcode
    rts                    // 60
    .byte $20, $55, $9f, $0f, $80, $4c, $00, $04, $20, $51, $9f, $87, $80, $68, $aa, $68    // data $80e7
    .byte $a8, $a9, $cd, $48, $a9, $ff, $48, $98, $48, $8a, $48, $4c, $26, $de, $20, $55    // data $80f7
    .byte $9f, $12, $80, $4c, $00, $04, $20, $51, $9f, $69, $80, $4c, $26, $de    // data $8107
bank01_sub_8115:
    pha                    // 48
    lda #$7f               // a9 7f
    sta $dc00              // 8d 00 dc
    lda $dc01              // ad 01 dc
    cmp #$df               // c9 df
    bne bank01_sub_8162              // d0 40
    lda #$bd               // a9 bd
    sta $dc00              // 8d 00 dc
    lda $dc01              // ad 01 dc
    cmp #$ff               // c9 ff
    bne bank01_sub_8162              // d0 34
    lda #$fe               // a9 fe
    sta $dc00              // 8d 00 dc
    lda $dc01              // ad 01 dc
    cmp #$ef               // c9 ef
    beq bank01_sub_8147              // f0 0d
    cmp #$df               // c9 df
    bne bank01_sub_8162              // d0 24
    jsr bank01_sub_9f4e              // 20 4e 9f
    .byte $63    // undocumented opcode
    .byte $80    // undocumented opcode
    lda #$9a               // a9 9a
    bne bank01_sub_814e              // d0 07
bank01_sub_8147:
    jsr bank01_sub_9f4e              // 20 4e 9f
    rts                    // 60
    .byte $80, $a9, $9a    // data $814b
bank01_sub_814e:
    ldy #$04               // a0 04
    ldx #$04               // a2 04
    jsr bank01_sub_9f4e              // 20 4e 9f
    .byte $12    // undocumented opcode
    .byte $80    // undocumented opcode
    jsr bank01_sub_9f4e              // 20 4e 9f
    rts                    // 60
    .byte $80, $68, $68, $68, $4c, $3f, $87    // data $815b
bank01_sub_8162:
    pla                    // 68
    rts                    // 60
    .byte $20, $eb, $b7, $86, $02, $a5, $14, $85, $fd, $a5, $15, $85, $fe, $20, $51, $9f    // data $8164
    .byte $39, $80, $60, $20, $dd, $81, $20, $fd, $ae, $20, $f8, $81, $86, $5f, $84, $60    // data $8174
    .byte $a9, $61, $85, $b9, $a5, $ba, $c9, $08, $b0, $03, $4c, $13, $f7, $a5, $b7, $d0    // data $8184
    .byte $03, $4c, $10, $f7, $20, $14, $89, $90, $03, $4c, $f9, $e0, $20, $53, $9f, $d5    // data $8194
    .byte $f3, $a5, $ba, $20, $b1, $ff, $a5, $b9, $20, $93, $ff, $a6, $c1, $a4, $c2, $20    // data $81a4
    .byte $bd, $ff, $a6, $2b, $a4, $2c, $20, $27, $82, $a0, $00, $20, $59, $de, $20, $a8    // data $81b4
    .byte $ff, $e6, $bb, $d0, $02, $e6, $bc, $a5, $bb, $c5, $5f, $a5, $bc, $e5, $60, $90    // data $81c4
    .byte $ea, $a2, $00, $20, $27, $82, $4c, $42, $f6, $20, $dc, $90, $f0, $09, $20, $fd    // data $81d4
    .byte $ae, $20, $9e, $b7, $86, $ba, $60    // data $81e4
bank01_sub_81eb:
    ldx $ba                // a6 ba
    cpx #$08               // e0 08
    bcs bank01_sub_81f3              // b0 02
    ldx #$08               // a2 08
bank01_sub_81f3:
    stx $ba                // 86 ba
    jmp $0079              // 4c 79 00
    .byte $20, $51, $9f, $60, $80, $60, $20, $51, $9f, $5d, $80, $a9, $11, $8d, $02, $03    // data $81f8
    .byte $a9, $82, $8d, $03, $03, $38, $4c, $a9, $a4, $20, $51, $9f, $63, $80, $20, $6f    // data $8208
    .byte $a6, $4c, $7b, $e3    // data $8218
bank01_sub_821c:
    inc $0302              // ee 02 03
    jsr bank01_sub_9f51              // 20 51 9f
    ror $80                // 66 80
    jmp $a66f              // 4c 6f a6
    .byte $8a, $20, $a8, $ff, $98, $4c, $a8, $ff, $20, $dd, $81, $20, $a6, $83, $a5, $2d    // data $8227
    .byte $38, $e9, $02, $aa, $a5, $2e, $e9, $00, $a8, $a9, $00, $85, $b9, $85, $0a, $4c    // data $8237
    .byte $75, $e1, $20, $54, $82, $20, $49, $80, $20, $ce, $84, $10, $2f, $a2, $04, $86    // data $8247
    .byte $c6, $bd, $bd, $88, $9d, $76, $02, $ca, $d0, $f7, $60, $20, $a6, $83, $20, $54    // data $8257
    .byte $82, $86, $0a, $86, $b9, $20, $49, $80, $20, $53, $9f, $6f, $e1, $a9, $00, $2c    // data $8267
    .byte $a9, $01, $a2, $01, $48, $20, $49, $80, $68, $20, $d2, $84, $d0, $0c, $a5, $0a    // data $8277
    .byte $f0, $03, $4c, $7a, $e1, $20, $53, $9f, $7a, $e1, $a9, $00, $85, $c6, $4c, $8d    // data $8287
    .byte $e1, $20, $49, $80, $4c, $59, $e1, $b0, $06, $20, $b6, $82, $20, $79, $00, $f0    // data $8297
    .byte $37, $c9, $50, $d0, $03, $4c, $1c, $9d, $c9, $23, $d0, $2c    // data $82a7
bank01_api_05:
    jsr $0073              // 20 73 00
bank01_sub_82b6:
    jsr $b79e              // 20 9e b7
    cpx #$08               // e0 08
    bcc bank01_sub_82c4              // 90 07
    cpx #$1f               // e0 1f
    bcs bank01_sub_82c4              // b0 03
    stx $ba                // 86 ba
    rts                    // 60
bank01_sub_82c4:
    jsr $f713              // 20 13 f7
    jmp $e0f9              // 4c f9 e0
    .byte $20, $51, $9f, $36, $80, $4c, $f0, $82    // data $82ca
bank01_api_04:
    bcs bank01_sub_82dd              // b0 09
    jsr bank01_sub_82b6              // 20 b6 82
    lda #$24               // a9 24
    sta ($7a),y            // 91 7a
    inc $7a                // e6 7a
bank01_sub_82dd:
    dec $7a                // c6 7a
    jsr bank01_sub_90dc              // 20 dc 90
    jsr bank01_sub_81eb              // 20 eb 81
    jsr bank01_sub_9f50              // 20 50 9f
    .byte $1b    // undocumented opcode
    .byte $80    // undocumented opcode
    rts                    // 60
    .byte $20, $51, $9f, $12, $80, $90, $f8, $4c, $f9, $e0, $a2, $03, $2c, $a2, $07, $a0    // data $82eb
    .byte $03, $bd, $09, $83, $99, $30, $03, $ca, $88, $10, $f6, $4c, $8d, $e1, $67, $de    // data $82fb
    .byte $6a, $de, $6d, $de, $6f, $de, $a9, $ed, $a2, $f6, $78, $8d, $28, $03, $8e, $29    // data $830b
    .byte $03, $60    // data $831b
bank01_api_06:
    jsr $e453              // 20 53 e4
    ldy #$de               // a0 de
    ldx #$8f               // a2 8f
    stx $0302              // 8e 02 03
    sty $0303              // 8c 03 03
    ldx #$ac               // a2 ac
    stx $030a              // 8e 0a 03
    sty $030b              // 8c 0b 03
    lda $0317              // ad 17 03
    cmp #$fe               // c9 fe
    bne bank01_api_09              // d0 08
    ldx #$cd               // a2 cd
    stx $0316              // 8e 16 03
    sty $0317              // 8c 17 03
bank01_api_09:
    ldy #$de               // a0 de
    lda $0331              // ad 31 03
    cmp #$f4               // c9 f4
    bne bank01_sub_8352              // d0 08
    ldx #$6d               // a2 6d
    stx $0330              // 8e 30 03
    sty $0331              // 8c 31 03
bank01_sub_8352:
    lda $0333              // ad 33 03
    cmp #$f5               // c9 f5
    bne bank01_sub_8361              // d0 08
    ldx #$6f               // a2 6f
    stx $0332              // 8e 32 03
    sty $0333              // 8c 33 03
bank01_sub_8361:
    jmp $de97              // 4c 97 de
bank01_sub_8364:
    lda #$89               // a9 89
    sta $0320              // 8d 20 03
    lda #$de               // a9 de
    sta $0321              // 8d 21 03
    rts                    // 60
bank01_sub_836f:
    php                    // 08
    pha                    // 48
    lda $0321              // ad 21 03
    cmp #$de               // c9 de
    bne bank01_sub_8382              // d0 0a
    lda #$78               // a9 78
    sta $0326              // 8d 26 03
    lda #$de               // a9 de
    sta $0327              // 8d 27 03
bank01_sub_8382:
    pla                    // 68
    plp                    // 28
    rts                    // 60
bank01_sub_8385:
    pha                    // 48
    lda #$50               // a9 50
    sta $0320              // 8d 20 03
    lda #$f2               // a9 f2
    sta $0321              // 8d 21 03
    bne bank01_sub_839a              // d0 08
    pha                    // 48
    lda $0321              // ad 21 03
    cmp #$de               // c9 de
    bne bank01_sub_83a4              // d0 0a
bank01_sub_839a:
    lda #$ca               // a9 ca
    sta $0326              // 8d 26 03
    lda #$f1               // a9 f1
    sta $0327              // 8d 27 03
bank01_sub_83a4:
    pla                    // 68
    rts                    // 60
bank01_sub_83a6:
    lda #$0a               // a9 0a
    bit $08a9              // 2c a9 08
bank01_sub_83ab:
    bit $d011              // 2c 11 d0
    bpl bank01_sub_83ab              // 10 fb
    ldx #$de               // a2 de
    ldy #$32               // a0 32
    jmp $dea9              // 4c a9 de
bank01_sub_83b7:
    lda #$04               // a9 04
    ldy #$ff               // a0 ff
    jsr $ffba              // 20 ba ff
    cpx #$04               // e0 04
    bne bank01_sub_83c5              // d0 03
    jsr bank01_sub_8364              // 20 64 83
bank01_sub_83c5:
    lda #$00               // a9 00
    jmp bank01_sub_995e              // 4c 5e 99
bank01_sub_83ca:
    jsr bank01_sub_9f51              // 20 51 9f
    rol                  // 2a
    .byte $80    // undocumented opcode
    rts                    // 60
bank01_api_02:
    lda $0302              // ad 02 03
    bne bank01_sub_83d8              // d0 03
    jmp bank01_sub_821c              // 4c 1c 82
bank01_sub_83d8:
    jsr bank01_sub_802d              // 20 2d 80
    jsr bank01_api_06              // 20 1d 83
    jsr bank01_sub_83ca              // 20 ca 83
    lda $0313              // ad 13 03
    bne bank01_sub_83e9              // d0 03
    jmp bank01_sub_8e58              // 4c 58 8e
bank01_sub_83e9:
    jsr bank01_sub_83a6              // 20 a6 83
    jsr bank01_sub_8385              // 20 85 83
    cli                    // 58
    lda #$01               // a9 01
    sta $dc0e              // 8d 0e dc
    jsr bank01_sub_8886              // 20 86 88
    stx $7a                // 86 7a
    sty $7b                // 84 7b
    jsr $0073              // 20 73 00
    jmp line_tap           // wedge: tap every line + install the IERROR fallback hook
    stx $0258              // 8e 58 02
    beq bank01_api_02              // f0 c9
bank01_sub_8407:
    ldx #$ff               // a2 ff
    stx $3a                // 86 3a
    bcs bank01_sub_8457              // b0 4a
    ldx $0258              // ae 58 02
    bne bank01_sub_841c              // d0 0a
    tax                    // aa
    lda #$a4               // a9 a4
    pha                    // 48
    lda #$9b               // a9 9b
    pha                    // 48
    jmp bank01_sub_8450              // 4c 50 84
bank01_sub_841c:
    jsr $a96b              // 20 6b a9
    beq bank01_sub_843d              // f0 1c
    ldy $14                // a4 14
    cpy $0255              // cc 55 02
    lda $15                // a5 15
    tax                    // aa
    sbc $0256              // ed 56 02
    bcc bank01_sub_8444              // 90 16
    tya                    // 98
    clc                    // 18
    adc $0257              // 6d 57 02
    sta $0255              // 8d 55 02
    bcc bank01_sub_8439              // 90 01
    inx                    // e8
bank01_sub_8439:
    cpx #$fa               // e0 fa
    bcc bank01_sub_8444              // 90 07
bank01_sub_843d:
    lda #$00               // a9 00
    sta $0258              // 8d 58 02
    beq bank01_sub_844a              // f0 06
bank01_sub_8444:
    stx $0256              // 8e 56 02
    jsr bank01_sub_86f8              // 20 f8 86
bank01_sub_844a:
    lda #$a4               // a9 a4
    pha                    // 48
    lda #$9e               // a9 9e
    pha                    // 48
bank01_sub_8450:
    jsr bank01_sub_8364              // 20 64 83
    txa                    // 8a
    jmp $de26              // 4c 26 de
bank01_sub_8457:
    stx $96                // 86 96
bank01_sub_8459:
    inc $96                // e6 96
    ldy #$ff               // a0 ff
bank01_sub_845d:
    iny                    // c8
    inx                    // e8
    lda $8507,x            // bd 07 85
    bne bank01_sub_846c              // d0 08
    lda #$a4               // a9 a4
    pha                    // 48
    lda #$95               // a9 95
    pha                    // 48
    bne bank01_sub_8450              // d0 e4
bank01_sub_846c:
    php                    // 08
    and #$7f               // 29 7f
    cmp ($7a),y            // d1 7a
    beq bank01_sub_847e              // f0 0b
    plp                    // 28
    bmi bank01_sub_8459              // 30 e3
bank01_sub_8476:
    inx                    // e8
    lda $8507,x            // bd 07 85
    bpl bank01_sub_8476              // 10 fa
    bmi bank01_sub_8459              // 30 db
bank01_sub_847e:
    plp                    // 28
    bmi bank01_sub_848d              // 30 0c
    cpy #$02               // c0 02
    bne bank01_sub_845d              // d0 d8
bank01_sub_8485:
    iny                    // c8
    lda ($7a),y            // b1 7a
    cmp #$41               // c9 41
    bcs bank01_sub_8485              // b0 f9
    dey                    // 88
bank01_sub_848d:
    tya                    // 98
    clc                    // 18
    adc $7a                // 65 7a
    sta $7a                // 85 7a
    jsr $83a9              // 20 a9 83
    ldy #$00               // a0 00
    sty $b9                // 84 b9
    lda $96                // a5 96
    asl                  // 0a
    tax                    // aa
    lda #$e3               // a9 e3
    pha                    // 48
    lda #$7a               // a9 7a
    pha                    // 48
    lda $8573,x            // bd 73 85
    pha                    // 48
    lda $8572,x            // bd 72 85
    pha                    // 48
    jmp $0073              // 4c 73 00
    .byte $20, $dd, $81, $20, $ce, $84, $d0, $03, $4c, $7a, $e1, $a5, $c4, $48, $a5, $c3    // data $84af
    .byte $48, $08, $48, $ad, $f3, $de, $4c, $de, $de, $20, $51, $9f, $27, $80, $60, $a2    // data $84bf
    .byte $01, $a9, $00, $86, $b9, $85, $0a, $a6, $2b, $a4, $2c, $20, $4f, $9f, $d5, $ff    // data $84cf
    .byte $90, $03, $4c, $f9, $e0, $a5, $90, $29, $bf, $f0, $03, $4c, $7a, $e1, $ad, $30    // data $84df
    .byte $03, $c9, $67, $f0, $12, $a5, $c3, $c5, $2b, $d0, $06, $a5, $c4, $c5, $2c, $f0    // data $84ef
    .byte $06, $a9, $00, $85, $c6, $a9, $01, $60, $af, $a4, $a5, $de, $dc, $c0, $a6, $4f    // data $84ff
    .byte $4c, $c4, $44, $45, $4c, $45, $54, $c5, $4c, $49, $4e, $45, $53, $41, $56, $c5    // data $850f
    .byte $4d, $45, $52, $47, $c5, $41, $55, $54, $cf, $4d, $4f, $4e, $49, $54, $4f, $d2    // data $851f
    .byte $41, $50, $50, $45, $4e, $c4, $43, $4f, $50, $d9, $42, $4f, $4f, $d4, $5a, $41    // data $852f
    .byte $d0, $42, $41, $43, $4b, $55, $d0, $50, $4c, $49, $53, $54, $a2, $53, $4c, $49    // data $853f
    .byte $53, $54, $a2, $4f, $ce, $4f, $46, $c6, $46, $49, $4e, $c4, $52, $45, $4e, $55    // data $854f
    .byte $cd, $49, $4e, $46, $cf, $54, $41, $53, $d3, $53, $53, $47, $45, $d4, $54, $4f    // data $855f
    .byte $4f, $cc, $00, $73, $82, $d1, $82, $48, $82, $61, $82, $1c, $9d, $9d, $82, $76    // data $856f
    .byte $82, $1e, $82, $fd, $81, $76, $81, $17, $86, $d4, $86, $97, $89, $2e, $82, $ea    // data $857f
    .byte $82, $ae, $84, $c7, $84, $c9, $82, $ac, $85, $a9, $85, $f7, $82, $f4, $82, $e0    // data $858f
    .byte $80, $63, $81, $0c, $81, $e6, $80, $ee, $80, $04, $81, $a9, $03, $2c, $a9, $04    // data $859f
    .byte $85, $bd, $20, $dd, $81, $20, $dd, $88, $20, $cc, $ff, $a6, $bd, $20, $b7, $83    // data $85af
    .byte $a9, $c9, $a0, $85, $8d, $00, $03, $8c, $01, $03, $ad, $01, $dc, $10, $27, $29    // data $85bf
    .byte $10, $f0, $f7, $20, $9a, $86, $b0, $1e, $20, $cc, $ff, $a2, $04, $20, $ea, $9b    // data $85cf
    .byte $a0, $ff, $84, $14, $84, $15, $c8, $8c, $fd, $01, $c8, $84, $0f, $84, $60, $a9    // data $85df
    .byte $fc, $85, $5f, $4c, $d4, $a6, $a2, $04, $20, $ea, $9b, $20, $a3, $8e, $a9, $04    // data $85ef
    .byte $20, $c3, $ff, $20, $1d, $83, $a9, $03, $20, $c3, $ff, $a2, $01, $8e, $fc, $01    // data $85ff
    .byte $8e, $fd, $01, $ca, $86, $c6, $4c, $cc, $ff, $20, $dd, $81, $20, $79, $00, $aa    // data $860f
    .byte $f0, $06, $20, $fd, $ae, $20, $eb, $b7, $86, $96, $20, $dd, $88, $a5, $14, $85    // data $861f
    .byte $c3, $a5, $15, $85, $c4, $20, $cc, $ff, $20, $85, $99, $4d, $45, $52, $47, $49    // data $862f
    .byte $4e, $47, $00, $a2, $05, $bd, $cf, $86, $9d, $50, $01, $ca, $10, $f7, $a9, $50    // data $863f
    .byte $a0, $01, $8d, $02, $03, $8c, $03, $03, $8d, $00, $03, $8c, $01, $03, $2c, $01    // data $864f
    .byte $dc, $10, $32, $e6, $98, $20, $9a, $86, $b0, $2b, $ad, $fd, $01, $f0, $26, $ad    // data $865f
    .byte $fe, $01, $ae, $ff, $01, $a4, $96, $f0, $0f, $a5, $c3, $a8, $a6, $c4, $18, $65    // data $866f
    .byte $96, $85, $c3, $90, $02, $e6, $c4, $98, $85, $14, $86, $15, $8d, $fe, $01, $8e    // data $867f
    .byte $ff, $01, $20, $a4, $a4, $20, $02, $86, $4c, $7b, $e3, $20, $cc, $ff, $a2, $03    // data $868f
    .byte $20, $c6, $ff, $a0, $00, $20, $cf, $ff, $99, $fc, $01, $a6, $90, $d0, $1c, $c0    // data $869f
    .byte $04, $90, $11, $18, $aa, $f0, $15, $c9, $12, $f0, $09, $c9, $20, $b0, $05, $a9    // data $86af
    .byte $20, $99, $fc, $01, $c0, $5c, $b0, $dd, $c8, $d0, $da, $38, $c8, $84, $0b, $60    // data $86bf
    .byte $20, $97, $de, $4c, $5d, $86, $f0, $16, $20, $eb, $b7, $8a, $d0, $03, $4c, $08    // data $86cf
    .byte $af, $a5, $14, $8d, $55, $02, $a5, $15, $8d, $56, $02, $8e, $57, $02, $8e, $58    // data $86df
    .byte $02, $20, $f8, $86, $68, $68, $4c, $80, $a4    // data $86ef
bank01_sub_86f8:
    lda $0256              // ad 56 02
    sta $62                // 85 62
    lda $0255              // ad 55 02
    sta $63                // 85 63
    ldx #$90               // a2 90
    sec                    // 38
    jsr $bc49              // 20 49 bc
    jsr $bddd              // 20 dd bd
    ldy #$ff               // a0 ff
bank01_sub_870d:
    iny                    // c8
    lda $0101,y            // b9 01 01
    sta $0277,y            // 99 77 02
    bne bank01_sub_870d              // d0 f7
    iny                    // c8
    sta $0277,y            // 99 77 02
    sty $c6                // 84 c6
    rts                    // 60
    .byte $a9, $0a, $8d, $00, $de, $58, $a5, $c6, $85, $cc, $f0, $fa, $4c, $97, $de    // data $871d
bank01_sub_872c:
    lda #$00               // a9 00
    sta $ca                // 85 ca
    lda $d6                // a5 d6
    sta $c9                // 85 c9
    tya                    // 98
    pha                    // 48
    txa                    // 8a
    pha                    // 48
    lda $d0                // a5 d0
    beq bank01_sub_8742              // f0 06
    jmp $e63a              // 4c 3a e6
bank01_sub_873f:
    jsr $e716              // 20 16 e7
bank01_sub_8742:
    ldx #$0f               // a2 0f
bank01_sub_8744:
    lda $871d,x            // bd 1d 87
    sta $0210,x            // 9d 10 02
    dex                    // ca
    bpl bank01_sub_8744              // 10 f7
    jsr $0210              // 20 10 02
    sta $0292              // 8d 92 02
    sei                    // 78
    lda $cf                // a5 cf
    beq bank01_sub_8764              // f0 0c
    lda $ce                // a5 ce
    ldx $0287              // ae 87 02
    ldy #$00               // a0 00
    sty $cf                // 84 cf
    jsr $ea13              // 20 13 ea
bank01_sub_8764:
    jsr $e5b4              // 20 b4 e5
    jsr bank01_sub_8115              // 20 15 81
    cmp #$8a               // c9 8a
    bne bank01_sub_879c              // d0 2e
    lda $f9a0              // ad a0 f9
    cmp #$e6               // c9 e6
    bne bank01_sub_8781              // d0 0c
    jsr bank01_sub_877b              // 20 7b 87
    jmp bank01_sub_8742              // 4c 42 87
bank01_sub_877b:
    lda #$00               // a9 00
    pha                    // 48
    jmp $f9a0              // 4c a0 f9
bank01_sub_8781:
    jsr bank01_sub_9f50              // 20 50 9f
    .byte $33    // undocumented opcode
    .byte $80    // undocumented opcode
    bmi bank01_sub_8799              // 30 11
    lda #$40               // a9 40
    jsr $e716              // 20 16 e7
    lda #$23               // a9 23
    jsr $e716              // 20 16 e7
    lda #$00               // a9 00
    ldx $ba                // a6 ba
    jsr $bdcd              // 20 cd bd
bank01_sub_8799:
    jmp bank01_sub_87c7              // 4c c7 87
bank01_sub_879c:
    cmp #$8b               // c9 8b
    bne bank01_sub_87a9              // d0 09
    lda #$e3               // a9 e3
    pha                    // 48
    lda #$7a               // a9 7a
    pha                    // 48
    jmp $ded3              // 4c d3 de
bank01_sub_87a9:
    bit $22                // 24 22
    bpl bank01_sub_8813              // 10 66
bank01_sub_87ad:
    ldx #$07               // a2 07
bank01_sub_87af:
    cmp $88a7,x            // dd a7 88
    beq bank01_sub_87ea              // f0 36
    dex                    // ca
    bne bank01_sub_87af              // d0 f8
    cmp #$0d               // c9 0d
    beq bank01_sub_87c7              // f0 0c
    cmp #$8d               // c9 8d
    beq bank01_sub_87c2              // f0 03
bank01_sub_87bf:
    jmp bank01_sub_873f              // 4c 3f 87
bank01_sub_87c2:
    bit $028d              // 2c 8d 02
    bne bank01_sub_87bf              // d0 f8
bank01_sub_87c7:
    lda $d3                // a5 d3
    sta $8e                // 85 8e
    jmp $e602              // 4c 02 e6
bank01_sub_87ce:
    ldy #$ff               // a0 ff
bank01_sub_87d0:
    iny                    // c8
    lda $88af,y            // b9 af 88
    bne bank01_sub_87d0              // d0 fa
    dex                    // ca
    bne bank01_sub_87d0              // d0 f7
bank01_sub_87d9:
    inx                    // e8
    iny                    // c8
    lda $88af,y            // b9 af 88
    beq bank01_sub_87e5              // f0 05
    sta $0276,x            // 9d 76 02
    bne bank01_sub_87d9              // d0 f4
bank01_sub_87e5:
    stx $c6                // 86 c6
bank01_sub_87e7:
    jmp bank01_sub_8742              // 4c 42 87
bank01_sub_87ea:
    cpx #$03               // e0 03
    bcs bank01_sub_87ce              // b0 e0
    ldy #$05               // a0 05
    lda ($d1),y            // b1 d1
    cmp #$22               // c9 22
    bne bank01_sub_87ce              // d0 d8
    lda #$20               // a9 20
bank01_sub_87f8:
    dey                    // 88
    sta ($d1),y            // 91 d1
    bne bank01_sub_87f8              // d0 fb
    lda #$25               // a9 25
    cpx #$01               // e0 01
    beq bank01_sub_8805              // f0 02
    lda #$2f               // a9 2f
bank01_sub_8805:
    sta ($d1),y            // 91 d1
    sta $ce                // 85 ce
    sty $d3                // 84 d3
    jsr bank01_sub_8877              // 20 77 88
    jmp bank01_sub_8836              // 4c 36 88
bank01_sub_8811:
    bne bank01_sub_87ad              // d0 9a
bank01_sub_8813:
    ldx $d6                // a6 d6
    bne bank01_sub_881f              // d0 08
    cmp #$91               // c9 91
    beq bank01_sub_8827              // f0 0c
    cmp #$13               // c9 13
    beq bank01_sub_8827              // f0 08
bank01_sub_881f:
    cpx #$18               // e0 18
    bne bank01_sub_882b              // d0 08
    cmp #$11               // c9 11
    bne bank01_sub_882b              // d0 04
bank01_sub_8827:
    stx $8f                // 86 8f
    beq bank01_sub_8833              // f0 08
bank01_sub_882b:
    cmp #$87               // c9 87
    beq bank01_sub_883c              // f0 0d
    cmp #$88               // c9 88
    bne bank01_sub_8811              // d0 de
bank01_sub_8833:
    jsr bank01_sub_884b              // 20 4b 88
bank01_sub_8836:
    ldx #$01               // a2 01
bank01_sub_8838:
    stx $c6                // 86 c6
    bne bank01_sub_87e7              // d0 ab
bank01_sub_883c:
    jsr bank01_sub_884b              // 20 4b 88
    lda #$87               // a9 87
    sta $0278              // 8d 78 02
    sta $0279              // 8d 79 02
    ldx #$03               // a2 03
    bne bank01_sub_8838              // d0 ed
bank01_sub_884b:
    ldy #$01               // a0 01
    ldx #$02               // a2 02
bank01_sub_884f:
    lda $887d,x            // bd 7d 88
    cmp ($d1),y            // d1 d1
    beq bank01_sub_8862              // f0 0c
    dex                    // ca
    bpl bank01_sub_884f              // 10 f6
    ldx $0166              // ae 66 01
    cpx #$02               // e0 02
    bcc bank01_sub_8862              // 90 02
    ldx #$02               // a2 02
bank01_sub_8862:
    lda $8f                // a5 8f
    bmi bank01_sub_8872              // 30 0c
    lda $8883,x            // bd 83 88
    sta $a8                // 85 a8
    lda $887d,x            // bd 7d 88
    sta $aa                // 85 aa
    bne bank01_sub_8877              // d0 05
bank01_sub_8872:
    lda $8880,x            // bd 80 88
    sta ($d1),y            // 91 d1
bank01_sub_8877:
    lda #$0d               // a9 0d
    sta $0277              // 8d 77 02
    rts                    // 60
    .byte $2c, $3a, $3e, $09, $0d, $04, $20, $08, $00    // data $887d
bank01_sub_8886:
    tsx                    // ba
    lda #$8a               // a9 8a
    cmp $0102,x            // dd 02 01
    ror $22                // 66 22
    ldx #$ff               // a2 ff
    stx $8f                // 86 8f
    inx                    // e8
bank01_sub_8893:
    jsr bank01_sub_872c              // 20 2c 87
    cmp #$0d               // c9 0d
    beq bank01_sub_88a5              // f0 0b
    sta $0200,x            // 9d 00 02
    inx                    // e8
    cpx #$54               // e0 54
    bcc bank01_sub_8893              // 90 f1
    jmp $a571              // 4c 71 a5
bank01_sub_88a5:
    jmp $aaca              // 4c ca aa
    .byte $85, $89, $87, $88, $86, $8c, $83, $00, $25, $30, $3a, $2a, $00, $2f, $30, $3a    // data $88a8
    .byte $2a, $00, $4c, $c9, $0d, $00, $52, $d5, $3a, $0d, $00, $24, $3a, $2a, $0d, $00    // data $88b8
    .byte $4d, $4f, $4e, $0d, $00, $25, $30, $3a, $2a, $0d, $00, $a5, $ba, $20, $b4, $ff    // data $88c8
    .byte $a5, $b9, $4c, $96, $ff, $a9, $08, $a4, $b7, $f0, $28, $20, $eb, $81, $a9, $03    // data $88d8
    .byte $a0, $60, $20, $ba, $ff, $20, $e7, $ff, $20, $14, $89, $b0, $16, $20, $53, $9f    // data $88e8
    .byte $c0, $ff, $20, $d3, $88, $20, $a5, $ff, $85, $ae, $a5, $90, $4a, $4a, $90, $06    // data $88f8
    .byte $20, $04, $f7, $4c, $f9, $e0, $20, $a5, $ff, $85, $af, $60, $20, $b0, $97, $a9    // data $8908
    .byte $49, $20, $a8, $ff, $20, $ae, $ff, $a5, $90, $10, $f0, $4c, $07, $f7, $08, $a2    // data $8918
    .byte $9f, $a0, $80, $20, $9d, $de, $c9, $aa, $d0, $1a, $c8, $20, $9d, $de, $c9, $55    // data $8928
    .byte $d0, $12, $a0, $83, $20, $9d, $de, $c9, $08, $90, $05, $c9, $1e, $90, $01, $2c    // data $8938
    .byte $a9, $08, $85, $ba, $a5, $ba, $c9, $08, $b0, $07, $20, $11, $83, $28, $4c, $60    // data $8948
    .byte $de, $20, $92, $83, $28, $a5, $93, $90, $2f, $20, $50, $9f, $0f, $80, $08, $a5    // data $8958
    .byte $90, $c9, $ff, $f0, $09, $28, $20, $6f, $83, $a5, $9e, $4c, $26, $de, $28, $a0    // data $8968
    .byte $00, $b1, $bb, $c9, $24, $d0, $03, $4c, $15, $80, $20, $ab, $ff, $20, $42, $f6    // data $8978
    .byte $a9, $f4, $48, $a9, $a6, $48, $d0, $de, $20, $50, $9f, $12, $80, $4c, $6e, $89    // data $8988
    .byte $a2, $00    // data $8998
bank01_api_07:
    cpx #$00               // e0 00
    beq bank01_sub_899f              // f0 01
    clc                    // 18
bank01_sub_899f:
    ror $0168              // 6e 68 01
    stx $0163              // 8e 63 01
    stx $0167              // 8e 67 01
    jsr bank01_sub_89f2              // 20 f2 89
    txa                    // 8a
    bne bank01_sub_89c7              // d0 19
    stx $015a              // 8e 5a 01
    lda #$e3               // a9 e3
    sta $0158              // 8d 58 01
    lda #$7b               // a9 7b
    sta $0159              // 8d 59 01
    lda #$fb               // a9 fb
    sta $015e              // 8d 5e 01
    lda #$37               // a9 37
    sta $015f              // 8d 5f 01
    bne bank01_sub_89d4              // d0 0d
bank01_sub_89c7:
    jsr bank01_api_06              // 20 1d 83
    jsr bank01_sub_9712              // 20 12 97
    clc                    // 18
    jsr bank01_sub_8a15              // 20 15 8a
    jsr bank01_sub_9a72              // 20 72 9a
bank01_sub_89d4:
    jmp bank01_sub_8e50              // 4c 50 8e
    .byte $38, $08, $a9, $4c, $85, $54, $8d, $13, $03, $2c, $68, $01, $30, $0a, $38, $20    // data $89d7
    .byte $15, $8a, $28, $20, $4e, $9f, $2a, $80, $4c, $7b, $e3    // data $89e7
bank01_sub_89f2:
    lda #$34               // a9 34
    sta $0160              // 8d 60 01
    lda #$2e               // a9 2e
    sta $0165              // 8d 65 01
    lda #$80               // a9 80
    sta $0161              // 8d 61 01
    sta $0162              // 8d 62 01
    sta $9d                // 85 9d
    asl                  // 0a
    sta $0313              // 8d 13 03
    lda #$cd               // a9 cd
    ldy #$de               // a0 de
    sta $0316              // 8d 16 03
    sty $0317              // 8c 17 03
    rts                    // 60
bank01_sub_8a15:
    sei                    // 78
    ldx #$07               // a2 07
bank01_sub_8a18:
    lda $08e0,x            // bd e0 08
    bcc bank01_sub_8a23              // 90 06
    lda $0158,x            // bd 58 01
    sta $08e0,x            // 9d e0 08
bank01_sub_8a23:
    sta $0158,x            // 9d 58 01
    dex                    // ca
    bpl bank01_sub_8a18              // 10 ef
    sta $ad                // 85 ad
    lda $0159              // ad 59 01
    sta $ac                // 85 ac
    rts                    // 60
    .byte $a9, $08, $2c, $a9, $20, $20, $5d, $8a, $ad, $8d, $02, $f0, $f2, $20, $a3, $8e    // data $8a31
    .byte $20, $bb, $94, $20, $b7, $8a, $a0, $07, $a9, $1e, $c5, $a8, $90, $06, $c5, $8e    // data $8a41
    .byte $b0, $02, $a0, $1f, $a6, $d6, $20, $eb, $8b, $4c, $6c, $8e, $85, $a8, $20, $1e    // data $8a51
    .byte $8f, $a0, $01, $b1, $d1, $85, $97, $10, $15, $20, $ef, $8b, $a0, $26, $b1, $d1    // data $8a61
    .byte $20, $68, $97, $88, $c0, $06, $d0, $f6, $20, $fb, $8b, $4c, $b7, $8a, $a6, $c8    // data $8a71
    .byte $e0, $27, $b0, $0d, $86, $d3, $a9, $27, $85, $c8, $85, $d0, $85, $13, $20, $93    // data $8a81
    .byte $88, $a0, $00, $a5, $aa, $c9, $2c, $f0, $0e, $a5, $8e, $c9, $20, $b9, $1f, $02    // data $8a91
    .byte $b0, $08, $20, $16, $8f, $90, $07, $b9, $07, $02, $c9, $2e, $f0, $03, $20, $68    // data $8aa1
    .byte $97, $c8, $c4, $a8, $90, $dd    // data $8ab1
bank01_sub_8ab7:
    ldx $d6                // a6 d6
    jsr bank01_sub_8be9              // 20 e9 8b
    ldy $aa                // a4 aa
    jsr bank01_sub_8f7f              // 20 7f 8f
    ldy #$ad               // a0 ad
    jsr bank01_sub_8b40              // 20 40 8b
    lda $aa                // a5 aa
    cmp #$2c               // c9 2c
    bne bank01_sub_8af2              // d0 26
    lda $97                // a5 97
    bpl bank01_sub_8aff              // 10 2f
    jsr bank01_sub_8bef              // 20 ef 8b
    ldy #$26               // a0 26
bank01_sub_8ad5:
    jsr bank01_sub_9728              // 20 28 97
    sta ($d1),y            // 91 d1
    jsr $ea24              // 20 24 ea
    lda $0286              // ad 86 02
    sta ($f3),y            // 91 f3
    dey                    // 88
    cpy #$06               // c0 06
    bne bank01_sub_8ad5              // d0 ee
    jsr bank01_sub_8bfb              // 20 fb 8b
    ldy #$01               // a0 01
    lda #$ac               // a9 ac
    sta ($d1),y            // 91 d1
    dey                    // 88
    rts                    // 60
bank01_sub_8af2:
    ldy #$00               // a0 00
bank01_sub_8af4:
    jsr bank01_sub_9728              // 20 28 97
    jsr bank01_sub_8b22              // 20 22 8b
    iny                    // c8
    cpy $a8                // c4 a8
    bne bank01_sub_8af4              // d0 f5
bank01_sub_8aff:
    jsr $8ea9              // 20 a9 8e
    ldy #$00               // a0 00
bank01_sub_8b04:
    jsr bank01_sub_9728              // 20 28 97
    cmp #$de               // c9 de
    beq bank01_sub_8b16              // f0 0b
    tax                    // aa
    and #$7f               // 29 7f
    cmp #$60               // c9 60
    bcs bank01_sub_8b16              // b0 04
    cmp #$20               // c9 20
    bcs bank01_sub_8b18              // b0 02
bank01_sub_8b16:
    ldx #$2e               // a2 2e
bank01_sub_8b18:
    txa                    // 8a
    jsr $ffd2              // 20 d2 ff
    iny                    // c8
    cpy $a8                // c4 a8
    bne bank01_sub_8b04              // d0 e3
    rts                    // 60
bank01_sub_8b22:
    pha                    // 48
    jsr $8ea9              // 20 a9 8e
    pla                    // 68
bank01_sub_8b27:
    pha                    // 48
    lsr                  // 4a
    lsr                  // 4a
    lsr                  // 4a
    lsr                  // 4a
    jsr bank01_sub_8b32              // 20 32 8b
    pla                    // 68
    and #$0f               // 29 0f
bank01_sub_8b32:
    cmp #$0a               // c9 0a
    bcc bank01_sub_8b38              // 90 02
    adc #$06               // 69 06
bank01_sub_8b38:
    adc #$30               // 69 30
    jmp $ffd2              // 4c d2 ff
bank01_sub_8b3d:
    jsr $8ea9              // 20 a9 8e
bank01_sub_8b40:
    lda.a $0000,y            // b9 00 00
    jsr bank01_sub_8b27              // 20 27 8b
    dey                    // 88
    lda.a $0000,y            // b9 00 00
    jmp bank01_sub_8b27              // 4c 27 8b
    .byte $c9, $4f, $d0, $03, $4c, $fc, $99, $a2, $ff, $c9, $2a, $d0, $03, $20, $73, $00    // data $8b4d
    .byte $86, $97, $a2, $00, $a0, $2c, $d0, $04, $a2, $01, $a0, $3a, $8e, $66, $01, $84    // data $8b5d
    .byte $aa, $a6, $9a, $a9, $08, $e0, $04, $90, $01, $0a, $c0, $3a, $f0, $02, $0a, $0a    // data $8b6d
    .byte $85, $a8, $20, $3b, $8f, $84, $8d, $20, $a3, $8e, $a6, $d6, $86, $8f, $20, $b7    // data $8b7d
    .byte $8a, $20, $41, $91, $f0, $05, $20, $9e, $8b, $f0, $f6, $20, $bb, $94, $90, $e7    // data $8b8d
    .byte $60    // data $8b9d
bank01_sub_8b9e:
    lda $ac                // a5 ac
    sec                    // 38
    sbc $a8                // e5 a8
    sta $ac                // 85 ac
    bcs bank01_sub_8ba9              // b0 02
    dec $ad                // c6 ad
bank01_sub_8ba9:
    ldy #$01               // a0 01
    lda ($d1),y            // b1 d1
    sta $97                // 85 97
    jsr bank01_sub_8bcc              // 20 cc 8b
    jmp bank01_sub_8ab7              // 4c b7 8a
    .byte $ad, $65, $01, $a0, $00, $91, $d1, $a2, $19, $ca, $20, $e9, $8b, $b1, $d1, $cd    // data $8bb5
    .byte $65, $01, $d0, $f5, $4c, $58, $8e    // data $8bc5
bank01_sub_8bcc:
    lda $a5                // a5 a5
    pha                    // 48
    lda $a6                // a5 a6
    pha                    // 48
    lda $a7                // a5 a7
    pha                    // 48
    lda $a8                // a5 a8
    pha                    // 48
    jsr bank01_sub_9f50              // 20 50 9f
    asl $6880,x            // 1e 80 68
    sta $a8                // 85 a8
    pla                    // 68
    sta $a7                // 85 a7
    pla                    // 68
    sta $a6                // 85 a6
    pla                    // 68
    sta $a5                // 85 a5
bank01_sub_8be9:
    ldy #$00               // a0 00
bank01_sub_8beb:
    clc                    // 18
    jmp $fff0              // 4c f0 ff
bank01_sub_8bef:
    lda $ac                // a5 ac
    sec                    // 38
    sbc #$07               // e9 07
    sta $ac                // 85 ac
    bcs bank01_sub_8bfa              // b0 02
    dec $ad                // c6 ad
bank01_sub_8bfa:
    rts                    // 60
bank01_sub_8bfb:
    lda $ac                // a5 ac
    clc                    // 18
    adc #$07               // 69 07
    sta $ac                // 85 ac
    bcc bank01_sub_8c06              // 90 02
    inc $ad                // e6 ad
bank01_sub_8c06:
    rts                    // 60
    .byte $20, $16, $8f, $8d, $58, $01, $20, $16, $8f, $8d, $59, $01, $a2, $00, $20, $16    // data $8c07
    .byte $8f, $9d, $5b, $01, $e8, $e0, $05, $90, $f5, $a0, $00, $b1, $7a, $c9, $31, $2e    // data $8c17
    .byte $5a, $01, $c8, $c0, $08, $d0, $f4, $60, $20, $a3, $8e, $a9, $a4, $48, $a9, $8c    // data $8c27
    .byte $48, $a9, $4c, $85, $54, $20, $a6, $83, $20, $79, $00, $4c, $26, $de, $20, $c2    // data $8c37
    .byte $90, $98, $f0, $17, $a9, $60, $91, $bb, $a0, $00, $a2, $00, $20, $28, $97, $18    // data $8c47
    .byte $20, $63, $8c, $20, $68, $97, $20, $73, $8f, $90, $f1, $60, $6c, $bb, $00, $20    // data $8c57
    .byte $c2, $90, $a4, $b7, $f0, $17, $a2, $00, $8a, $a8, $b1, $bb, $a0, $00, $20, $68    // data $8c67
    .byte $97, $e8, $e4, $b7, $d0, $02, $a2, $00, $20, $73, $8f, $90, $eb, $60, $20, $3b    // data $8c77
    .byte $8f, $20, $24, $8f, $20, $a3, $8e, $a0, $00, $20, $23, $97, $85, $c3, $a9, $c1    // data $8c87
    .byte $20, $25, $97, $c5, $c3, $f0, $3c, $aa, $a9, $05, $20, $16, $e7, $a0, $ad, $20    // data $8c97
    .byte $3d, $8b, $a9, $9b, $20, $d2, $ff, $a0, $c2, $20, $3d, $8b, $a0, $00, $a9, $05    // data $8ca7
    .byte $20, $16, $e7, $a5, $c3, $20, $22, $8b, $a9, $9b, $20, $16, $e7, $8a, $20, $22    // data $8cb7
    .byte $8b, $a9, $05, $20, $16, $e7, $a2, $03, $a9, $20, $20, $16, $e7, $ca, $10, $fa    // data $8cc7
    .byte $20, $2b, $91, $20, $6d, $8f, $90, $af, $60, $20, $3b, $8f, $20, $07, $90, $a4    // data $8cd7
    .byte $b7, $f0, $20, $20, $a3, $8e, $a0, $00, $2c, $01, $dc, $10, $16, $20, $28, $97    // data $8ce7
    .byte $d1, $bb, $d0, $0a, $c8, $c4, $b7, $d0, $f4, $a0, $ad, $20, $3d, $8b, $20, $73    // data $8cf7
    .byte $8f, $90, $e3, $60, $20, $1e, $8f, $20, $21, $8f, $20, $65, $8f, $20, $24, $8f    // data $8d07
    .byte $38, $a5, $b0, $e5, $ac, $85, $c4, $a5, $b1, $e5, $ad, $aa, $a5, $ac, $c5, $c1    // data $8d17
    .byte $a5, $ad, $e5, $c2, $90, $18, $e8, $c4, $c4, $d0, $03, $ca, $f0, $32, $20, $23    // data $8d27
    .byte $97, $20, $61, $97, $c8, $d0, $f0, $e6, $ad, $e6, $c2, $4c, $2e, $8d, $a4, $c4    // data $8d37
    .byte $8a, $65, $ad, $85, $ad, $8a, $18, $65, $c2, $85, $c2, $e8, $98, $f0, $0a, $88    // data $8d47
    .byte $20, $23, $97, $20, $61, $97, $4c, $53, $8d, $c6, $ad, $c6, $c2, $ca, $d0, $ef    // data $8d57
    .byte $60, $2c, $68, $01, $30, $2e, $20, $a3, $8e, $a2, $04, $bd, $40, $08, $1d, $45    // data $8d67
    .byte $08, $f0, $21, $bd, $40, $08, $85, $ac, $bd, $45, $08, $85, $ad, $a9, $ec, $dd    // data $8d77
    .byte $4a, $08, $f0, $03, $a9, $98, $2c, $a9, $05, $20, $d2, $ff, $a0, $ad, $20, $3d    // data $8d87
    .byte $8b, $ca, $10, $d7, $60, $20, $79, $00, $f0, $0d, $20, $1e, $8f, $a6, $ac, $a4    // data $8d97
    .byte $ad, $8e, $59, $01, $8c, $58, $01, $2c, $68, $01, $30, $04, $18, $4c, $d8, $89    // data $8da7
    .byte $a2, $16, $bd, $f2, $8d, $9d, $20, $01, $ca, $10, $f7, $20, $a6, $83, $20, $64    // data $8db7
    .byte $83, $ae, $5e, $01, $9a, $ad, $58, $01, $8d, $35, $01, $ad, $59, $01, $8d, $34    // data $8dc7
    .byte $01, $ae, $f3, $de, $ad, $5a, $01, $4c, $a0, $de, $8d, $5b, $01, $8e, $5c, $01    // data $8dd7
    .byte $8c, $5d, $01, $08, $68, $8d, $5a, $01, $4c, $3e, $8e, $8e, $00, $de, $48, $ae    // data $8de7
    .byte $5c, $01, $ac, $5d, $01, $ad, $5f, $01, $85, $01, $ad, $5b, $01, $28, $4c, $e2    // data $8df7
    .byte $fc    // data $8e07
bank01_sub_8e08:
    cld                    // d8
    ldy #$3b               // a0 3b
    jsr bank01_sub_8f7c              // 20 7c 8f
    lda $0158              // ad 58 01
    jsr bank01_sub_8b27              // 20 27 8b
    lda $0159              // ad 59 01
    jsr bank01_sub_8b27              // 20 27 8b
    ldx #$00               // a2 00
bank01_sub_8e1c:
    lda $015b,x            // bd 5b 01
    jsr bank01_sub_8b22              // 20 22 8b
    inx                    // e8
    cpx #$05               // e0 05
    bne bank01_sub_8e1c              // d0 f5
    jsr $8ea9              // 20 a9 8e
    lda $015a              // ad 5a 01
    sec                    // 38
bank01_sub_8e2e:
    rol                  // 2a
    beq bank01_sub_8e3d              // f0 0c
    pha                    // 48
    lda #$30               // a9 30
    adc #$00               // 69 00
    jsr $ffd2              // 20 d2 ff
    pla                    // 68
    clc                    // 18
    bcc bank01_sub_8e2e              // 90 f1
bank01_sub_8e3d:
    rts                    // 60
    .byte $ba, $8e, $5e, $01, $ad, $11, $d0, $09, $10, $8d, $11, $d0, $20, $f2, $89, $20    // data $8e3e
    .byte $a9, $83    // data $8e4e
bank01_sub_8e50:
    jsr bank01_sub_9f51              // 20 51 9f
    txa                    // 8a
    .byte $80    // undocumented opcode
    jsr bank01_sub_8e08              // 20 08 8e
bank01_sub_8e58:
    jsr $83a9              // 20 a9 83
    lda $9a                // a5 9a
    cmp #$04               // c9 04
    bcc bank01_sub_8e64              // 90 03
    jsr bank01_sub_8ea3              // 20 a3 8e
bank01_sub_8e64:
    jsr $ffe7              // 20 e7 ff
bank01_sub_8e67:
    ldy #$00               // a0 00
    jsr bank01_sub_8f7c              // 20 7c 8f
    ldx #$d0               // a2 d0
    txs                    // 9a
    cld                    // d8
    jsr bank01_sub_8f95              // 20 95 8f
    tax                    // aa
    beq bank01_sub_8e67              // f0 f1
    sta $aa                // 85 aa
    ldx #$ff               // a2 ff
bank01_sub_8e7a:
    inx                    // e8
    lda $99a7,x            // bd a7 99
    bne bank01_sub_8e83              // d0 03
    jmp bank01_sub_956a              // 4c 6a 95
bank01_sub_8e83:
    cmp $aa                // c5 aa
    bne bank01_sub_8e7a              // d0 f3
    jsr bank01_sub_8e8d              // 20 8d 8e
    jmp bank01_sub_8e58              // 4c 58 8e
bank01_sub_8e8d:
    txa                    // 8a
    asl                  // 0a
    tax                    // aa
    lda $99c5,x            // bd c5 99
    pha                    // 48
    lda $99c4,x            // bd c4 99
    pha                    // 48
    jsr bank01_sub_9712              // 20 12 97
    jsr bank01_sub_81eb              // 20 eb 81
    ldy #$00               // a0 00
    jmp $0073              // 4c 73 00
bank01_sub_8ea3:
    lda #$0d               // a9 0d
    bit $24a9              // 2c a9 24
    bit $20a9              // 2c a9 20
    jmp $ffd2              // 4c d2 ff
bank01_sub_8eae:
    jsr $0079              // 20 79 00
    cmp #$2b               // c9 2b
    bne bank01_sub_8edd              // d0 28
    stx $02                // 86 02
    sty $03                // 84 03
    jsr $0073              // 20 73 00
    jsr bank01_sub_955e              // 20 5e 95
    bcs bank01_sub_8edd              // b0 1c
    jsr $ad8a              // 20 8a ad
    jsr $b1b8              // 20 b8 b1
    lda $65                // a5 65
    pha                    // 48
    jsr $0079              // 20 79 00
    beq bank01_sub_8ed6              // f0 07
    cmp #$2c               // c9 2c
    bne bank01_sub_8ed6              // d0 03
    jsr $0073              // 20 73 00
bank01_sub_8ed6:
    ldx $02                // a6 02
    ldy $03                // a4 03
    pla                    // 68
    clc                    // 18
    rts                    // 60
bank01_sub_8edd:
    jsr $0079              // 20 79 00
    jsr bank01_sub_8f02              // 20 02 8f
    asl                  // 0a
    asl                  // 0a
    asl                  // 0a
    asl                  // 0a
    sta $9f                // 85 9f
    jsr $0073              // 20 73 00
    jsr bank01_sub_8f02              // 20 02 8f
    pha                    // 48
    jsr $0073              // 20 73 00
    pla                    // 68
    ora $9f                // 05 9f
    clc                    // 18
    rts                    // 60
    .byte $20, $79, $00, $c9, $2c, $d0, $1c, $4c, $73, $00    // data $8ef8
bank01_sub_8f02:
    bcs bank01_sub_8f07              // b0 03
    adc #$d0               // 69 d0
    rts                    // 60
bank01_sub_8f07:
    cmp #$41               // c9 41
    bcc bank01_sub_8f12              // 90 07
    cmp #$47               // c9 47
    bcs bank01_sub_8f12              // b0 03
    adc #$c9               // 69 c9
    rts                    // 60
bank01_sub_8f12:
    pla                    // 68
    pla                    // 68
    sec                    // 38
bank01_sub_8f15:
    rts                    // 60
bank01_sub_8f16:
    jsr bank01_sub_8eae              // 20 ae 8e
    bcc bank01_sub_8f15              // 90 fa
    jmp bank01_sub_956a              // 4c 6a 95
bank01_sub_8f1e:
    ldy #$ad               // a0 ad
    bit $b1a0              // 2c a0 b1
    bit $c2a0              // 2c a0 c2
    bit $c4a0              // 2c a0 c4
    jsr bank01_sub_8f16              // 20 16 8f
    sta.a $0000,y            // 99 00 00
    jsr bank01_sub_8f16              // 20 16 8f
    dey                    // 88
    sta.a $0000,y            // 99 00 00
    ldy #$00               // a0 00
    jmp $0079              // 4c 79 00
    .byte $a9, $ff, $85, $b0, $85, $b1, $20, $79, $00, $f0, $0d, $20, $1e, $8f, $d0, $0b    // data $8f3b
    .byte $a5, $ac, $85, $b0, $a5, $ad, $85, $b1, $a0, $00, $60, $c9, $2d, $f0, $f9, $a0    // data $8f4b
    .byte $02, $b1, $7a, $c9, $20, $f0, $f1, $20, $21, $8f, $20, $c8, $94, $90, $e9, $4c    // data $8f5b
    .byte $1b, $8f, $e6, $c1, $d0, $02, $e6, $c2, $e6, $ac, $d0, $02, $e6, $ad, $4c, $c8    // data $8f6b
    .byte $94    // data $8f7b
bank01_sub_8f7c:
    jsr bank01_sub_8ea3              // 20 a3 8e
bank01_sub_8f7f:
    lda $0165              // ad 65 01
    bpl bank01_sub_8f88              // 10 04
    sta $c7                // 85 c7
    and #$7f               // 29 7f
bank01_sub_8f88:
    jsr $ffd2              // 20 d2 ff
    lda #$00               // a9 00
    sta $c7                // 85 c7
    tya                    // 98
    beq bank01_sub_8fb2              // f0 20
    jmp $ffd2              // 4c d2 ff
bank01_sub_8f95:
    cli                    // 58
    ldy #$00               // a0 00
    sty $d4                // 84 d4
    iny                    // c8
    sty $13                // 84 13
    jsr bank01_sub_8886              // 20 86 88
    stx $7a                // 86 7a
    sty $7b                // 84 7b
    inx                    // e8
    stx $13                // 86 13
bank01_sub_8fa7:
    jsr $0073              // 20 73 00
    cmp #$2e               // c9 2e
    beq bank01_sub_8fa7              // f0 f9
    ldx $8f                // a6 8f
    bpl bank01_sub_8fb3              // 10 01
bank01_sub_8fb2:
    rts                    // 60
bank01_sub_8fb3:
    tay                    // a8
    jsr bank01_sub_9712              // 20 12 97
    tya                    // 98
    beq bank01_sub_8fd6              // f0 1c
    jsr $0073              // 20 73 00
    jsr bank01_sub_8f1e              // 20 1e 8f
    ldx $8f                // a6 8f
    beq bank01_sub_8fd6              // f0 12
    jsr bank01_sub_8ea3              // 20 a3 8e
    ldy $a8                // a4 a8
    bne bank01_sub_8fd3              // d0 08
    jsr bank01_sub_9728              // 20 28 97
    jsr bank01_sub_9393              // 20 93 93
    inc $a8                // e6 a8
bank01_sub_8fd3:
    jsr bank01_sub_94bb              // 20 bb 94
bank01_sub_8fd6:
    ldx $8f                // a6 8f
    jsr bank01_sub_8fea              // 20 ea 8f
    sei                    // 78
    ldx $d6                // a6 d6
    ldy $8e                // a4 8e
    jsr bank01_sub_8beb              // 20 eb 8b
    lda ($d1),y            // b1 d1
    sta $ce                // 85 ce
    jmp bank01_sub_8f95              // 4c 95 8f
bank01_sub_8fea:
    lda $a8                // a5 a8
    cmp #$08               // c9 08
    bcc bank01_sub_8ffb              // 90 0b
    txa                    // 8a
    bne bank01_sub_8ff6              // d0 03
    jmp bank01_sub_8b9e              // 4c 9e 8b
bank01_sub_8ff6:
    jsr bank01_sub_8ab7              // 20 b7 8a
    beq bank01_sub_9004              // f0 09
bank01_sub_8ffb:
    txa                    // 8a
    bne bank01_sub_9001              // d0 03
    jmp bank01_sub_927a              // 4c 7a 92
bank01_sub_9001:
    jsr bank01_sub_92cd              // 20 cd 92
bank01_sub_9004:
    jmp bank01_sub_94bb              // 4c bb 94
    .byte $20, $fd, $90, $a0, $00, $b1, $7a, $d0, $05, $a0, $00, $4c, $c8, $90, $c9, $22    // data $9007
    .byte $d0, $03, $4c, $ad, $90, $c9, $3f, $f0, $07, $c8, $c0, $80, $d0, $e7, $f0, $e9    // data $9017
    .byte $a0, $00, $a2, $00, $b1, $7a, $f0, $38, $c9, $20, $f0, $2f, $c9, $3f, $d0, $07    // data $9027
    .byte $a9, $30, $91, $7a, $a9, $0f, $2c, $a9, $ff, $9d, $70, $01, $c8, $b1, $7a, $f0    // data $9037
    .byte $5d, $c9, $20, $f0, $f7, $c9, $3f, $d0, $11, $a9, $30, $91, $7a, $bd, $70, $01    // data $9047
    .byte $10, $03, $a9, $f0, $2c, $a9, $00, $9d, $70, $01, $e8, $c8, $c0, $50, $90, $c4    // data $9057
    .byte $a0, $00, $20, $79, $00, $f0, $0a, $20, $16, $8f, $91, $bb, $e6, $b7, $c8, $d0    // data $9067
    .byte $f1, $20, $a3, $8e, $a0, $00, $2c, $01, $dc, $10, $20, $20, $28, $97, $aa, $b9    // data $9077
    .byte $70, $01, $f0, $08, $8a, $39, $70, $01, $d1, $bb, $d0, $0a, $c8, $c4, $b7, $d0    // data $9087
    .byte $ea, $a0, $ad, $20, $3d, $8b, $20, $73, $8f, $90, $d9, $68, $68, $60, $a9, $3f    // data $9097
    .byte $20, $16, $e7, $68, $68, $60, $c0, $00, $f0, $17, $98, $18, $65, $7a, $85, $7a    // data $90a7
    .byte $a5, $7b, $69, $00, $85, $7b, $a0, $00, $4c, $c8, $90, $20, $3b, $8f, $20, $fd    // data $90b7
    .byte $90, $20, $79, $00, $f0, $0e, $c9, $22, $f0, $0b, $20, $16, $8f, $91, $bb, $e6    // data $90c7
    .byte $b7, $c8, $d0, $ed, $60    // data $90d7
bank01_sub_90dc:
    ldy #$00               // a0 00
    lda ($7a),y            // b1 7a
    cmp #$22               // c9 22
    bne bank01_sub_90e6              // d0 02
    inc $7a                // e6 7a
bank01_sub_90e6:
    lda ($7a),y            // b1 7a
    clc                    // 18
    beq bank01_sub_90f2              // f0 07
    cmp #$22               // c9 22
    beq bank01_sub_90f2              // f0 03
    iny                    // c8
    bne bank01_sub_90e6              // d0 f4
bank01_sub_90f2:
    jsr bank01_sub_90fd              // 20 fd 90
    tya                    // 98
    adc $7a                // 65 7a
    sta $7a                // 85 7a
    jmp $0079              // 4c 79 00
bank01_sub_90fd:
    lda $7a                // a5 7a
    sta $bb                // 85 bb
    lda $7b                // a5 7b
    sta $bc                // 85 bc
    sty $b7                // 84 b7
    rts                    // 60
    .byte $20, $79, $00, $f0, $2a, $c9, $22, $d0, $26, $20, $dc, $90, $f0, $12, $20, $f8    // data $9108
    .byte $8e, $20, $9e, $b7, $86, $ba, $f0, $08, $20, $f8, $8e, $20, $27, $8f, $a9, $01    // data $9118
    .byte $c9, $00, $60, $58, $20, $e4, $ff, $c9, $03, $f0, $04, $c9, $11, $d0, $f1, $20    // data $9128
    .byte $bb, $94, $24, $c5, $50, $fc, $4c, $b5, $8b, $20, $2b, $91, $f0, $12, $20, $2b    // data $9138
    .byte $91, $f0, $fb, $c9, $87, $f0, $07, $c9, $88, $18, $d0, $04, $a9, $00, $85, $8d    // data $9148
    .byte $a5, $8d, $60, $c9, $49, $d0, $08, $a0, $01, $b1, $7a, $c9, $2a, $f0, $03, $20    // data $9158
    .byte $e3, $9b, $20, $79, $00, $4c, $76, $8e, $a9, $00, $2c, $a9, $01, $85, $0a, $85    // data $9168
    .byte $93, $20, $08, $91, $49, $01, $85, $b9, $e0, $01, $d0, $08, $a9, $09, $a0, $00    // data $9178
    .byte $48, $4c, $1f, $f7, $a5, $93, $a6, $c3, $a4, $c4, $20, $d5, $ff, $b0, $0f, $a5    // data $9188
    .byte $0a, $d0, $0b, $a5, $90, $29, $bf, $d0, $05, $a6, $ae, $a4, $af, $60, $4c, $78    // data $9198
    .byte $e1, $20, $08, $91, $f0, $2c, $a5, $ba, $c9, $08, $90, $3d, $a5, $c3, $85, $c1    // data $91a8
    .byte $a5, $c4, $85, $c2, $20, $79, $00, $f0, $19, $20, $f8, $8e, $20, $21, $8f, $20    // data $91b8
    .byte $79, $00, $d0, $11, $a6, $b0, $a4, $b1, $a9, $c1, $20, $d8, $ff, $90, $7b, $4c    // data $91c8
    .byte $f9, $e0, $4c, $6a, $95, $20, $f8, $8e, $20, $27, $8f, $a5, $ba, $c9, $01, $f0    // data $91d8
    .byte $08, $20, $50, $9f, $18, $80, $4c, $d5, $91, $a9, $09, $a0, $00, $48, $4c, $1f    // data $91e8
    .byte $f7, $a5, $7a, $48, $84, $7a, $a0, $02, $84, $7b, $20, $79, $a5, $e6, $7b, $68    // data $91f8
    .byte $85, $7a, $20, $9e, $ad, $20, $f7, $b7, $20, $a3, $8e, $20, $a6, $8e, $a0, $15    // data $9208
    .byte $20, $40, $8b, $20, $a9, $8e, $a9, $25, $20, $d2, $ff, $a5, $15, $f0, $03, $20    // data $9218
    .byte $2d, $8e, $a5, $14, $20, $2d, $8e, $20, $a9, $8e, $a6, $14, $a5, $15, $20, $cd    // data $9228
    .byte $bd, $a5, $15, $d0, $15, $a5, $14, $aa, $29, $7f, $c9, $20, $90, $0c, $20, $a9    // data $9238
    .byte $8e, $a9, $27, $20, $d2, $ff, $8a, $20, $d2, $ff, $60, $a9, $02, $8d, $66, $01    // data $9248
    .byte $20, $3b, $8f, $84, $8d, $20, $a3, $8e, $a6, $d6, $86, $8f, $20, $cd, $92, $20    // data $9258
    .byte $41, $91, $f0, $06, $20, $7a, $92, $4c, $67, $92, $20, $bb, $94, $90, $e6, $4c    // data $9268
    .byte $58, $8e    // data $9278
bank01_sub_927a:
    jsr bank01_sub_8bcc              // 20 cc 8b
    lda #$c1               // a9 c1
    sta $0107              // 8d 07 01
    lda #$15               // a9 15
    sta $25                // 85 25
bank01_sub_9286:
    lda $ac                // a5 ac
    sec                    // 38
    sbc $25                // e5 25
    sta $c1                // 85 c1
    lda $ad                // a5 ad
    sbc #$00               // e9 00
    sta $c2                // 85 c2
    ldy #$01               // a0 01
bank01_sub_9295:
    sty $24                // 84 24
    jsr bank01_sub_9728              // 20 28 97
    jsr bank01_sub_9393              // 20 93 93
    ldy $24                // a4 24
    bcc bank01_sub_92a8              // 90 07
    iny                    // c8
    cpy $25                // c4 25
    bcc bank01_sub_9295              // 90 ef
    bcs bank01_sub_92bb              // b0 13
bank01_sub_92a8:
    tya                    // 98
    sec                    // 38
    adc $a8                // 65 a8
    cmp $25                // c5 25
    beq bank01_sub_92be              // f0 0e
    tay                    // a8
    bcc bank01_sub_9295              // 90 e2
    dec $25                // c6 25
    bne bank01_sub_9286              // d0 cf
    ldy #$01               // a0 01
    bne bank01_sub_92bd              // d0 02
bank01_sub_92bb:
    ldy $25                // a4 25
bank01_sub_92bd:
    dey                    // 88
bank01_sub_92be:
    tya                    // 98
    clc                    // 18
    adc $c1                // 65 c1
    sta $ac                // 85 ac
    lda $c2                // a5 c2
    adc #$00               // 69 00
    sta $ad                // 85 ad
    jsr bank01_sub_971d              // 20 1d 97
bank01_sub_92cd:
    ldy #$00               // a0 00
    sty $d3                // 84 d3
    ldy #$3e               // a0 3e
    jsr bank01_sub_8f7f              // 20 7f 8f
    ldy #$ad               // a0 ad
    jsr bank01_sub_8b3d              // 20 3d 8b
    ldy #$02               // a0 02
bank01_sub_92dd:
    jsr bank01_sub_9728              // 20 28 97
    sta.a $00a9,y            // 99 a9 00
    dey                    // 88
    bpl bank01_sub_92dd              // 10 f7
    lda $a9                // a5 a9
    jsr bank01_sub_9393              // 20 93 93
    pha                    // 48
    ldx $a8                // a6 a8
    inx                    // e8
bank01_sub_92ef:
    dex                    // ca
    bpl bank01_sub_92fe              // 10 0c
    jsr $8ea9              // 20 a9 8e
    jsr $8ea9              // 20 a9 8e
    jsr $8ea9              // 20 a9 8e
    jmp bank01_sub_9304              // 4c 04 93
bank01_sub_92fe:
    lda.a $00a9,y            // b9 a9 00
    jsr bank01_sub_8b22              // 20 22 8b
bank01_sub_9304:
    iny                    // c8
    cpy #$03               // c0 03
    bcc bank01_sub_92ef              // 90 e6
    jsr $8ea9              // 20 a9 8e
    jsr $8ea9              // 20 a9 8e
    pla                    // 68
    ldx #$03               // a2 03
    jsr bank01_sub_9371              // 20 71 93
    ldx #$06               // a2 06
bank01_sub_9317:
    cpx #$03               // e0 03
    bne bank01_sub_9330              // d0 15
    ldy $a8                // a4 a8
    beq bank01_sub_9330              // f0 11
bank01_sub_931f:
    lda $a7                // a5 a7
    cmp #$e8               // c9 e8
    php                    // 08
    lda.a $00a9,y            // b9 a9 00
    plp                    // 28
    bcs bank01_sub_9353              // b0 29
    jsr bank01_sub_8b27              // 20 27 8b
    dey                    // 88
    bne bank01_sub_931f              // d0 ef
bank01_sub_9330:
    asl $a7                // 06 a7
    bcc bank01_sub_9342              // 90 0e
    lda $94ae,x            // bd ae 94
    jsr $ffd2              // 20 d2 ff
    lda $94b4,x            // bd b4 94
    beq bank01_sub_9342              // f0 03
    jsr $ffd2              // 20 d2 ff
bank01_sub_9342:
    dex                    // ca
    bne bank01_sub_9317              // d0 d2
bank01_sub_9345:
    inc $a8                // e6 a8
    lda #$20               // a9 20
    ldy $d3                // a4 d3
bank01_sub_934b:
    sta ($d1),y            // 91 d1
    iny                    // c8
    cpy #$28               // c0 28
    bcc bank01_sub_934b              // 90 f9
    rts                    // 60
bank01_sub_9353:
    ldx $ad                // a6 ad
    tay                    // a8
    bpl bank01_sub_9359              // 10 01
    dex                    // ca
bank01_sub_9359:
    sec                    // 38
    adc $ac                // 65 ac
    bcc bank01_sub_935f              // 90 01
    inx                    // e8
bank01_sub_935f:
    clc                    // 18
    adc #$01               // 69 01
    bne bank01_sub_9365              // d0 01
    inx                    // e8
bank01_sub_9365:
    pha                    // 48
    txa                    // 8a
    jsr bank01_sub_8b27              // 20 27 8b
    pla                    // 68
    jsr bank01_sub_8b27              // 20 27 8b
    jmp bank01_sub_9345              // 4c 45 93
bank01_sub_9371:
    tay                    // a8
    lda $93dd,y            // b9 dd 93
    sta $22                // 85 22
    lda $941d,y            // b9 1d 94
    sta $23                // 85 23
bank01_sub_937c:
    lda #$00               // a9 00
    ldy #$05               // a0 05
bank01_sub_9380:
    asl $23                // 06 23
    rol $22                // 26 22
    rol                  // 2a
    dey                    // 88
    bne bank01_sub_9380              // d0 f8
    adc #$3f               // 69 3f
    jsr $ffd2              // 20 d2 ff
    dex                    // ca
    bne bank01_sub_937c              // d0 ec
    jmp $8ea9              // 4c a9 8e
bank01_sub_9393:
    tay                    // a8
    lsr                  // 4a
    bcc bank01_sub_93a2              // 90 0b
    lsr                  // 4a
    bcs bank01_sub_93b2              // b0 18
    cmp #$22               // c9 22
    beq bank01_sub_93b2              // f0 14
    and #$07               // 29 07
    ora #$80               // 09 80
bank01_sub_93a2:
    lsr                  // 4a
    tax                    // aa
    lda $945d,x            // bd 5d 94
    bcs bank01_sub_93ad              // b0 04
    lsr                  // 4a
    lsr                  // 4a
    lsr                  // 4a
    lsr                  // 4a
bank01_sub_93ad:
    and #$0f               // 29 0f
    clc                    // 18
    bne bank01_sub_93b7              // d0 05
bank01_sub_93b2:
    sec                    // 38
    ldy #$80               // a0 80
    lda #$00               // a9 00
bank01_sub_93b7:
    tax                    // aa
    php                    // 08
    lda $94a1,x            // bd a1 94
    sta $a7                // 85 a7
    and #$03               // 29 03
    sta $a8                // 85 a8
    tya                    // 98
    and #$8f               // 29 8f
    tax                    // aa
    tya                    // 98
    ldy #$03               // a0 03
    cpx #$8a               // e0 8a
    beq bank01_sub_93d8              // f0 0b
bank01_sub_93cd:
    lsr                  // 4a
    bcc bank01_sub_93d8              // 90 08
    lsr                  // 4a
bank01_sub_93d1:
    lsr                  // 4a
    ora #$20               // 09 20
    dey                    // 88
    bne bank01_sub_93d1              // d0 fa
    iny                    // c8
bank01_sub_93d8:
    dey                    // 88
    bne bank01_sub_93cd              // d0 f2
    plp                    // 28
    rts                    // 60
    .byte $1c, $8a, $1c, $23, $5d, $8b, $1b, $a1, $9d, $8a, $1d, $23, $9d, $8b, $1d, $a1    // data $93dd
    .byte $00, $29, $19, $ae, $69, $a8, $19, $23, $24, $53, $1b, $23, $24, $53, $19, $a1    // data $93ed
    .byte $00, $1a, $5b, $5b, $a5, $69, $24, $24, $ae, $ae, $a8, $ad, $29, $00, $7c, $00    // data $93fd
    .byte $15, $9c, $6d, $9c, $a5, $69, $29, $53, $84, $13, $34, $11, $a5, $69, $23, $a0    // data $940d
    .byte $d8, $62, $5a, $48, $26, $62, $94, $88, $54, $44, $c8, $54, $68, $44, $e8, $94    // data $941d
    .byte $00, $b4, $08, $84, $74, $b4, $28, $6e, $74, $f4, $cc, $4a, $72, $f2, $a4, $8a    // data $942d
    .byte $00, $aa, $a2, $a2, $74, $74, $74, $72, $44, $68, $b2, $32, $b2, $00, $22, $00    // data $943d
    .byte $1a, $1a, $26, $26, $72, $72, $88, $c8, $c4, $ca, $26, $48, $44, $44, $a2, $c8    // data $944d
    .byte $40, $02, $45, $03, $d0, $08, $40, $09, $30, $22, $45, $33, $d0, $08, $40, $09    // data $945d
    .byte $40, $02, $45, $33, $d0, $08, $40, $09, $40, $02, $45, $b3, $d0, $08, $40, $09    // data $946d
    .byte $00, $22, $44, $33, $d0, $8c, $44, $00, $11, $22, $44, $33, $d0, $8c, $44, $9a    // data $947d
    .byte $10, $22, $44, $33, $d0, $08, $40, $09, $10, $22, $44, $33, $d0, $08, $40, $09    // data $948d
    .byte $62, $13, $78, $a9, $00, $21, $81, $82, $00, $00, $59, $4d, $91, $92, $86, $4a    // data $949d
    .byte $85, $9d, $2c, $29, $2c, $23, $28, $24, $59, $00, $58, $24, $24, $00    // data $94ad
bank01_sub_94bb:
    clc                    // 18
    lda $a8                // a5 a8
bank01_sub_94be:
    adc $ac                // 65 ac
    sta $ac                // 85 ac
    bcc bank01_sub_94c8              // 90 04
    inc $ad                // e6 ad
    beq bank01_sub_94d0              // f0 08
bank01_sub_94c8:
    lda $ac                // a5 ac
    cmp $b0                // c5 b0
    lda $ad                // a5 ad
    sbc $b1                // e5 b1
bank01_sub_94d0:
    rts                    // 60
    .byte $a9, $02, $8d, $66, $01, $20, $1e, $8f, $d0, $03, $4c, $58, $8e, $c8, $2c, $68    // data $94d1
    .byte $01, $30, $27, $c9, $53, $f0, $04, $c9, $52, $d0, $1f, $85, $a7, $b1, $7a, $c9    // data $94e1
    .byte $5a, $f0, $04, $c9, $46, $d0, $13, $e9, $5a, $48, $20, $b6, $9a, $68, $a6, $a7    // data $94f1
    .byte $e0, $53, $d0, $03, $20, $18, $9b, $4c, $67, $96, $c8, $b1, $7a, $c9, $20, $d0    // data $9501
    .byte $20, $a5, $8e, $c9, $12, $b0, $1a, $a0, $ff, $c8, $20, $16, $8f, $48, $a5, $7a    // data $9511
    .byte $c9, $12, $b0, $04, $c0, $02, $90, $f1, $68, $20, $68, $97, $88, $10, $f9, $30    // data $9521
    .byte $d6, $c6, $7a, $e6, $7a, $a0, $00, $84, $51, $a0, $03, $88, $30, $37, $b1, $7a    // data $9531
    .byte $f0, $27, $c9, $20, $f0, $ed, $38, $e9, $3f, $a2, $05, $4a, $66, $51, $66, $50    // data $9541
    .byte $ca, $d0, $f8, $f0, $e6, $c9, $47, $b0, $0e, $c9, $41, $b0, $08    // data $9551
bank01_sub_955e:
    cmp #$3a               // c9 3a
    bcs $9568              // b0 06
    cmp #$30               // c9 30
    bcc $9568              // 90 02
    clc                    // 18
    bit $38                // 24 38
    rts                    // 60
bank01_sub_956a:
    lda $7a                // a5 7a
    sta $d3                // 85 d3
    lda #$3f               // a9 3f
    jsr $ffd2              // 20 d2 ff
    jmp bank01_sub_8e58              // 4c 58 8e
    .byte $e6, $7a, $e6, $7a, $86, $a6, $a2, $02, $20, $73, $00, $20, $79, $00, $f0, $39    // data $9576
    .byte $c9, $24, $f0, $10, $20, $56, $95, $b0, $2b, $a9, $24, $20, $de, $97, $20, $79    // data $9586
    .byte $00, $4c, $a0, $95, $20, $de, $97, $20, $73, $00, $20, $ae, $8e, $b0, $dc, $e6    // data $9596
    .byte $a6, $a4, $a6, $c0, $03, $f0, $bd, $99, $a9, $00, $a9, $30, $20, $de, $97, $20    // data $95a6
    .byte $de, $97, $d0, $e6, $20, $de, $97, $90, $bf, $86, $a5, $c0, $02, $d0, $08, $a5    // data $95b6
    .byte $ab, $a4, $aa, $84, $ab, $85, $aa, $a2, $00, $86, $a9, $a2, $00, $86, $9f, $a5    // data $95c6
    .byte $a9, $20, $93, $93, $a6, $a7, $86, $64, $aa, $bd, $1d, $94, $20, $80, $96, $bd    // data $95d6
    .byte $dd, $93, $20, $80, $96, $a2, $06, $e0, $03, $d0, $12, $a4, $a8, $f0, $0e, $a5    // data $95e6
    .byte $a7, $c9, $e8, $a9, $30, $b0, $1d, $20, $7d, $96, $88, $d0, $f2, $06, $a7, $90    // data $95f6
    .byte $0e, $bd, $ae, $94, $20, $80, $96, $bd, $b4, $94, $f0, $03, $20, $80, $96, $ca    // data $9606
    .byte $d0, $d5, $f0, $06, $20, $7d, $96, $20, $7d, $96, $a5, $a5, $c5, $9f, $f0, $03    // data $9616
    .byte $4c, $8a, $96, $a4, $a8, $f0, $31, $a5, $64, $c9, $9d, $d0, $22, $a5, $aa, $e5    // data $9626
    .byte $ac, $aa, $a5, $ab, $e5, $ad, $90, $08, $d0, $56, $e0, $82, $b0, $52, $90, $08    // data $9636
    .byte $a8, $c8, $d0, $4c, $e0, $82, $90, $48, $ca, $ca, $8a, $a4, $a8, $d0, $03, $b9    // data $9646
    .byte $a9, $00, $20, $68, $97, $88, $d0, $f7, $a5, $a9, $c9, $02, $f0, $03, $20, $68    // data $9656
    .byte $97, $20, $cd, $92, $20, $bb, $94, $a0, $41, $20, $7c, $8f, $a0, $ad, $20, $3d    // data $9666
    .byte $8b, $20, $a9, $8e, $4c, $6c, $8e, $20, $80, $96, $86, $a4, $a6, $9f, $d5, $50    // data $9676
    .byte $f0, $09, $68, $68, $e6, $a9, $f0, $08, $4c, $d1, $95, $e6, $9f, $a6, $a4, $60    // data $9686
    .byte $4c, $6a, $95, $f0, $08, $b0, $1b, $20, $b6, $82, $aa, $d0, $15, $a9, $2d, $20    // data $9696
    .byte $16, $e7, $a9, $3e, $20, $16, $e7, $a9, $20, $20, $16, $e7, $20, $50, $9f, $24    // data $96a6
    .byte $80, $60, $c9, $23, $d0, $03, $4c, $b3, $82, $c9, $2d, $d0, $1f, $a6, $d6, $a0    // data $96b6
    .byte $00, $20, $0c, $e5, $a0, $00, $b1, $d1, $c9, $2d, $f0, $05, $c8, $c0, $4f, $d0    // data $96c6
    .byte $f5, $a9, $1d, $20, $16, $e7, $88, $10, $f8, $4c, $a8, $96, $c9, $2a, $f0, $03    // data $96d6
    .byte $4c, $e9, $97, $20, $0c, $97, $20, $73, $00, $f0, $1a, $29, $0f, $d0, $02, $a9    // data $96e6
    .byte $80, $aa, $a8, $20, $73, $00, $f0, $07, $29, $0f, $d0, $02, $a9, $80, $a8    // data $96f6
bank01_sub_9705:
    stx $0161              // 8e 61 01
    sty $0162              // 8c 62 01
    rts                    // 60
bank01_sub_970c:
    ldx #$80               // a2 80
    ldy #$80               // a0 80
    bne bank01_sub_9705              // d0 f3
bank01_sub_9712:
    ldx #$58               // a2 58
bank01_sub_9714:
    lda $9f05,x            // bd 05 9f
    sta.a $00ff,x            // 9d ff 00
    dex                    // ca
    bne bank01_sub_9714              // d0 f7
bank01_sub_971d:
    lda #$ac               // a9 ac
    sta $0107              // 8d 07 01
    rts                    // 60
    .byte $a9, $ac, $8d, $07, $01    // data $9723
bank01_sub_9728:
    bit $0161              // 2c 61 01
    bpl bank01_sub_9732              // 10 05
    lda #$ad               // a9 ad
    jmp $0100              // 4c 00 01
bank01_sub_9732:
    stx $14                // 86 14
    ldx $0107              // ae 07 01
    lda $ba                // a5 ba
    pha                    // 48
    lda $0161              // ad 61 01
    sta $ba                // 85 ba
    lda #$52               // a9 52
    jsr bank01_sub_9798              // 20 98 97
    jsr $ffae              // 20 ae ff
    lda $ba                // a5 ba
    jsr $ffb4              // 20 b4 ff
    lda #$6f               // a9 6f
    jsr $ff96              // 20 96 ff
    jsr $ffa5              // 20 a5 ff
    sta $15                // 85 15
    jsr $ffab              // 20 ab ff
bank01_sub_9759:
    ldx $14                // a6 14
    pla                    // 68
    sta $ba                // 85 ba
    lda $15                // a5 15
    rts                    // 60
    .byte $48, $a9, $c1, $8d, $07, $01, $68    // data $9761
bank01_sub_9768:
    sta $0136              // 8d 36 01
    bit $0162              // 2c 62 01
    bpl bank01_sub_9775              // 10 05
    lda #$8d               // a9 8d
    jmp $0100              // 4c 00 01
bank01_sub_9775:
    lda $ba                // a5 ba
    pha                    // 48
    lda $0162              // ad 62 01
    sta $ba                // 85 ba
    stx $14                // 86 14
    ldx $0107              // ae 07 01
    lda #$57               // a9 57
    jsr bank01_sub_9798              // 20 98 97
    lda $0136              // ad 36 01
    jsr $ffa8              // 20 a8 ff
    lda #$0d               // a9 0d
    jsr $ffa8              // 20 a8 ff
    jsr $ffae              // 20 ae ff
    jmp bank01_sub_9759              // 4c 59 97
bank01_sub_9798:
    jsr bank01_sub_97c7              // 20 c7 97
    tya                    // 98
    clc                    // 18
    adc $00,x              // 75 00
    php                    // 08
    jsr $ffa8              // 20 a8 ff
    plp                    // 28
    lda $01,x              // b5 01
    adc #$00               // 69 00
    jsr $ffa8              // 20 a8 ff
    lda #$01               // a9 01
    jmp $ffa8              // 4c a8 ff
bank01_sub_97b0:
    lda #$00               // a9 00
    sta $90                // 85 90
    lda $ba                // a5 ba
    jsr $ffb1              // 20 b1 ff
    lda #$6f               // a9 6f
    jsr $ff93              // 20 93 ff
    lda $90                // a5 90
    bpl bank01_sub_97c5              // 10 03
    jmp $f707              // 4c 07 f7
bank01_sub_97c5:
    clc                    // 18
    rts                    // 60
bank01_sub_97c7:
    pha                    // 48
    jsr bank01_sub_97b0              // 20 b0 97
    bcc bank01_sub_97d0              // 90 03
    jmp $e0f9              // 4c f9 e0
bank01_sub_97d0:
    lda #$4d               // a9 4d
    jsr $ffa8              // 20 a8 ff
    lda #$2d               // a9 2d
    jsr $ffa8              // 20 a8 ff
    pla                    // 68
    jmp $ffa8              // 4c a8 ff
    .byte $95, $50, $e8, $e0, $0a, $90, $03, $4c, $6a, $95, $60, $c9, $42, $d0, $0d, $20    // data $97de
    .byte $73, $00, $c9, $52, $f0, $39, $c9, $57, $f0, $38, $d0, $23, $c9, $4d, $d0, $1f    // data $97ee
    .byte $20, $73, $00, $c9, $45, $d0, $18, $20, $73, $00, $20, $1e, $8f, $a9, $45, $20    // data $97fe
    .byte $c7, $97, $a5, $ac, $20, $a8, $ff, $a5, $ad, $20, $a8, $ff, $4c, $ae, $ff, $c9    // data $980e
    .byte $50, $d0, $03, $4c, $1c, $9d, $20, $dc, $90, $20, $50, $9f, $1b, $80, $60, $4c    // data $981e
    .byte $33, $98, $4c, $53, $98, $20, $1e, $99, $b0, $15    // data $982e
bank01_sub_9838:
    lda #$31               // a9 31
    jsr bank01_sub_9873              // 20 73 98
bank01_sub_983d:
    jsr bank01_sub_9900              // 20 00 99
    bcs bank01_sub_983d              // b0 fb
    ldy #$00               // a0 00
bank01_sub_9844:
    jsr $ffcf              // 20 cf ff
    jsr bank01_sub_9768              // 20 68 97
    iny                    // c8
    bne bank01_sub_9844              // d0 f7
bank01_sub_984d:
    jsr $ffcc              // 20 cc ff
    jmp bank01_sub_9908              // 4c 08 99
    .byte $20, $1e, $99, $b0, $f5    // data $9853
bank01_sub_9858:
    jsr bank01_sub_989a              // 20 9a 98
bank01_sub_985b:
    jsr $98f8              // 20 f8 98
    bcs bank01_sub_985b              // b0 fb
    ldy #$00               // a0 00
bank01_sub_9862:
    jsr bank01_sub_9728              // 20 28 97
    jsr $ffd2              // 20 d2 ff
    iny                    // c8
    bne bank01_sub_9862              // d0 f7
    jsr bank01_sub_9871              // 20 71 98
    jmp bank01_sub_984d              // 4c 4d 98
bank01_sub_9871:
    lda #$32               // a9 32
bank01_sub_9873:
    pha                    // 48
    jsr bank01_sub_98f5              // 20 f5 98
    lda #$55               // a9 55
    jsr $ffd2              // 20 d2 ff
    pla                    // 68
    jsr $ffd2              // 20 d2 ff
    jsr bank01_sub_9985              // 20 85 99
    .byte $3a    // undocumented opcode
    jsr $2033              // 20 33 20
    bmi $98a9              // 30 20
    brk                    // 00
    .byte $a5, $25, $20, $b1, $98, $20, $a9, $8e, $a5, $26, $20, $b1, $98, $4c, $cc, $ff    // data $988a
bank01_sub_989a:
    lda #$00               // a9 00
    pha                    // 48
    jsr bank01_sub_98f5              // 20 f5 98
    jsr bank01_sub_9985              // 20 85 99
    .byte $42    // undocumented opcode
    and $2050              // 2d 50 20
    .byte $33    // undocumented opcode
    jsr $6800              // 20 00 68
    jsr bank01_sub_98b1              // 20 b1 98
    jmp $ffcc              // 4c cc ff
bank01_sub_98b1:
    ldy #$00               // a0 00
    sta $5f                // 85 5f
    sty $60                // 84 60
    ldx #$10               // a2 10
    lda #$00               // a9 00
    tay                    // a8
    sta $5d                // 85 5d
    sty $5e                // 84 5e
    sed                    // f8
bank01_sub_98c1:
    asl $5f                // 06 5f
    rol $60                // 26 60
    adc $5d                // 65 5d
    sta $5d                // 85 5d
    pha                    // 48
    tya                    // 98
    adc $5e                // 65 5e
    sta $5e                // 85 5e
    tay                    // a8
    pla                    // 68
    dex                    // ca
    bne bank01_sub_98c1              // d0 ed
    cld                    // d8
    tya                    // 98
    ora #$30               // 09 30
    tay                    // a8
    lda $5d                // a5 5d
    lsr                  // 4a
    lsr                  // 4a
    lsr                  // 4a
    lsr                  // 4a
    ora #$30               // 09 30
    tax                    // aa
    lda $5d                // a5 5d
    and #$0f               // 29 0f
    ora #$30               // 09 30
    pha                    // 48
    tya                    // 98
    jsr $ffd2              // 20 d2 ff
    txa                    // 8a
    jsr $ffd2              // 20 d2 ff
    pla                    // 68
    jmp $ffd2              // 4c d2 ff
bank01_sub_98f5:
    ldx #$0f               // a2 0f
    bit $03a2              // 2c a2 03
    jmp $f250              // 4c 50 f2
    .byte $a2, $0f, $2c    // data $98fd
bank01_sub_9900:
    ldx #$03               // a2 03
    jmp $ffc6              // 4c c6 ff
    .byte $a9, $0f, $2c    // data $9905
bank01_sub_9908:
    lda #$03               // a9 03
    jsr $ffc3              // 20 c3 ff
    jsr $ffcc              // 20 cc ff
    clc                    // 18
    rts                    // 60
bank01_sub_9912:
    ldx $ba                // a6 ba
    lda #$0f               // a9 0f
    tay                    // a8
    jsr $ffba              // 20 ba ff
    lda #$00               // a9 00
    beq bank01_sub_995e              // f0 40
    jsr $0073              // 20 73 00
    jsr bank01_sub_8f16              // 20 16 8f
    pha                    // 48
    jsr bank01_sub_8f16              // 20 16 8f
    tay                    // a8
    ldx #$cf               // a2 cf
    jsr $0079              // 20 79 00
    beq bank01_sub_9934              // f0 04
    jsr bank01_sub_8f16              // 20 16 8f
    tax                    // aa
bank01_sub_9934:
    pla                    // 68
bank01_sub_9935:
    sta $25                // 85 25
    sty $26                // 84 26
    stx $ad                // 86 ad
    lda #$00               // a9 00
    sta $ac                // 85 ac
    jsr bank01_sub_970c              // 20 0c 97
    jsr bank01_sub_97b0              // 20 b0 97
    bcs bank01_sub_996f              // b0 28
    jsr $ffae              // 20 ae ff
    jsr $ffe7              // 20 e7 ff
    jsr bank01_sub_9912              // 20 12 99
    ldx $ba                // a6 ba
    lda #$03               // a9 03
    tay                    // a8
    jsr $ffba              // 20 ba ff
    lda #$01               // a9 01
    ldx #$84               // a2 84
    ldy #$99               // a0 99
bank01_sub_995e:
    jsr $ffbd              // 20 bd ff
    jmp $ffc0              // 4c c0 ff
bank01_api_10:
    sec                    // 38
    bit $18                // 24 18
    php                    // 08
    jsr bank01_sub_9935              // 20 35 99
    bcc bank01_sub_9970              // 90 03
    plp                    // 28
    sec                    // 38
bank01_sub_996f:
    rts                    // 60
bank01_sub_9970:
    jsr bank01_sub_9712              // 20 12 97
    stx $0163              // 8e 63 01
    lda #$34               // a9 34
    sta $0160              // 8d 60 01
    plp                    // 28
    bcc bank01_sub_9981              // 90 03
    jmp bank01_sub_9838              // 4c 38 98
bank01_sub_9981:
    jmp bank01_sub_9858              // 4c 58 98
    .byte $23    // data $9984
bank01_sub_9985:
    pla                    // 68
    sta $22                // 85 22
    pla                    // 68
    sta $23                // 85 23
    sty $24                // 84 24
    ldy #$00               // a0 00
bank01_sub_998f:
    inc $22                // e6 22
    bne bank01_sub_9995              // d0 02
    inc $23                // e6 23
bank01_sub_9995:
    lda ($22),y            // b1 22
    beq bank01_sub_999e              // f0 05
    jsr $ffd2              // 20 d2 ff
    bcc bank01_sub_998f              // 90 f1
bank01_sub_999e:
    ldy $24                // a4 24
    lda $23                // a5 23
    pha                    // 48
    lda $22                // a5 22
    pha                    // 48
    rts                    // 60
    .byte $58, $4d, $52, $4c, $46, $43, $48, $54, $57, $47, $44, $3a, $3b, $50, $53, $56    // data $99a7
    .byte $4e, $41, $3e, $49, $2c, $42, $2a, $24, $40, $2d, $4a, $55, $00, $d6, $89, $64    // data $99b7
    .byte $8b, $4f, $8e, $6f, $91, $65, $8c, $84, $8c, $df, $8c, $0a, $8d, $67, $8d, $9b    // data $99c7
    .byte $8d, $52, $92, $30, $8a, $06, $8c, $5a, $91, $a8, $91, $72, $91, $f8, $91, $d0    // data $99d7
    .byte $94, $d0, $94, $4c, $8b, $33, $8a, $2e, $8c, $ff, $9e, $14, $80, $98, $96, $3f    // data $99e7
    .byte $9a, $5c, $8b, $44, $8c, $2c, $68, $01, $30, $39, $20, $44, $e5, $a2, $90, $a0    // data $99f7
    .byte $d0, $a9, $00, $85, $c1, $84, $c2, $20, $a3, $8e, $a0, $2d, $20, $7c, $8f, $a0    // data $9a07
    .byte $c2, $20, $40, $8b, $a0, $08, $bd, $00, $08, $20, $22, $8b, $e6, $c1, $e8, $88    // data $9a17
    .byte $d0, $f4, $e0, $e0, $f0, $0d, $a0, $dc, $e0, $c0, $f0, $d5, $c8, $e0, $d0, $f0    // data $9a27
    .byte $d0, $d0, $d7, $20, $a3, $8e, $4c, $50, $8e, $20, $24, $8f, $a2, $90, $a5, $c2    // data $9a37
    .byte $c9, $d0, $f0, $0c, $a2, $c0, $c9, $dc, $f0, $06, $a2, $d0, $c9, $dd, $d0, $18    // data $9a47
    .byte $8a, $18, $65, $c1, $b0, $12, $c9, $d9, $b0, $0e, $a8, $a2, $08, $20, $16, $8f    // data $9a57
    .byte $99, $00, $08, $c8, $ca, $d0, $f6, $60, $4c, $6a, $95    // data $9a67
bank01_sub_9a72:
    lda $0159              // ad 59 01
    sec                    // 38
    sbc #$03               // e9 03
    sta $ac                // 85 ac
    lda $0158              // ad 58 01
    sbc #$00               // e9 00
    sta $ad                // 85 ad
    jsr bank01_sub_9ab6              // 20 b6 9a
    bcc bank01_sub_9a95              // 90 0f
    lda #$01               // a9 01
    jsr bank01_sub_94be              // 20 be 94
    jsr bank01_sub_9ab6              // 20 b6 9a
    bcc bank01_sub_9a95              // 90 05
    lda #$00               // a9 00
    jsr bank01_sub_94be              // 20 be 94
bank01_sub_9a95:
    lda $ac                // a5 ac
    sta $0159              // 8d 59 01
    lda $ad                // a5 ad
    sta $0158              // 8d 58 01
    ldx #$04               // a2 04
bank01_sub_9aa1:
    lda $0840,x            // bd 40 08
    sta $ac                // 85 ac
    lda $0845,x            // bd 45 08
    sta $ad                // 85 ad
    ora $ac                // 05 ac
    beq bank01_sub_9ab2              // f0 03
    jsr bank01_sub_9acb              // 20 cb 9a
bank01_sub_9ab2:
    dex                    // ca
    bpl bank01_sub_9aa1              // 10 ec
    rts                    // 60
bank01_sub_9ab6:
    ldx #$04               // a2 04
bank01_sub_9ab8:
    lda $0840,x            // bd 40 08
    cmp $ac                // c5 ac
    bne bank01_sub_9ac6              // d0 07
    lda $0845,x            // bd 45 08
    cmp $ad                // c5 ad
    beq bank01_sub_9acb              // f0 05
bank01_sub_9ac6:
    dex                    // ca
    bpl bank01_sub_9ab8              // 10 ef
    sec                    // 38
    rts                    // 60
bank01_sub_9acb:
    lda #$00               // a9 00
    sta $0840,x            // 9d 40 08
    sta $0845,x            // 9d 45 08
    ldy $084a,x            // bc 4a 08
    bne bank01_sub_9aee              // d0 16
    jsr bank01_sub_9728              // 20 28 97
    bne $9b13              // d0 36
    lda $0854,x            // bd 54 08
    cmp #$aa               // c9 aa
    bne $9b13              // d0 2f
    eor $0859,x            // 5d 59 08
    bne $9b13              // d0 2a
    sta $0859,x            // 9d 59 08
    beq bank01_sub_9b0b              // f0 1d
bank01_sub_9aee:
    ldy #$02               // a0 02
bank01_sub_9af0:
    jsr bank01_sub_9728              // 20 28 97
    cmp $9b15,y            // d9 15 9b
    bne $9b13              // d0 1b
    dey                    // 88
    bpl bank01_sub_9af0              // 10 f5
    ldy #$02               // a0 02
    lda $0859,x            // bd 59 08
    jsr bank01_sub_9768              // 20 68 97
    dey                    // 88
    lda $0854,x            // bd 54 08
    jsr bank01_sub_9768              // 20 68 97
    dey                    // 88
bank01_sub_9b0b:
    lda $084f,x            // bd 4f 08
    jsr bank01_sub_9768              // 20 68 97
    clc                    // 18
    bit $38                // 24 38
    rts                    // 60
    .byte $20, $d3, $de, $a8, $a2, $04, $bd, $40, $08, $1d, $45, $08, $f0, $04, $ca, $10    // data $9b15
    .byte $f5, $60, $a5, $ac, $9d, $40, $08, $a5, $ad, $9d, $45, $08, $a9, $aa, $9d, $54    // data $9b25
    .byte $08, $9d, $59, $08, $98, $48, $9d, $4a, $08, $a0, $00, $20, $28, $97, $9d, $4f    // data $9b35
    .byte $08, $68, $f0, $11, $c8, $20, $28, $97, $9d, $54, $08, $c8, $20, $28, $97, $9d    // data $9b45
    .byte $59, $08, $b9, $15, $9b, $20, $68, $97, $88, $10, $f7, $a9, $0a, $8d, $eb, $08    // data $9b55
    .byte $60, $c9, $0d, $d0, $13, $a2, $9f, $a0, $85, $20, $9d, $de, $c9, $aa, $d0, $06    // data $9b65
    .byte $20, $7b, $9b, $a9, $0a, $2c, $a9, $0d, $20, $88, $9b, $a9, $10, $2c, $0d, $dd    // data $9b75
    .byte $f0, $fb, $60    // data $9b85
bank01_sub_9b88:
    sta $dd01              // 8d 01 dd
    lda $dd0d              // ad 0d dd
    lda $dd00              // ad 00 dd
    and #$fb               // 29 fb
    sta $dd00              // 8d 00 dd
    ora #$04               // 09 04
    sta $dd00              // 8d 00 dd
    rts                    // 60
bank01_sub_9b9c:
    lda $dd0c              // ad 0c dd
    and #$7f               // 29 7f
    sta $dd0c              // 8d 0c dd
    lda #$3f               // a9 3f
    sta $dd02              // 8d 02 dd
    lda $dd00              // ad 00 dd
    ora #$04               // 09 04
    sta $dd00              // 8d 00 dd
    lda #$00               // a9 00
    sta $dd03              // 8d 03 dd
    rts                    // 60
bank01_sub_9bb7:
    jsr bank01_sub_9b9c              // 20 9c 9b
    dec $dd03              // ce 03 dd
    clc                    // 18
    bit $dd0c              // 2c 0c dd
    bvs bank01_sub_9be2              // 70 1f
    jsr bank01_sub_9b88              // 20 88 9b
    lda #$ff               // a9 ff
    sta $dc07              // 8d 07 dc
    lda #$19               // a9 19
    sta $dc0f              // 8d 0f dc
    lda $dc0d              // ad 0d dc
bank01_sub_9bd3:
    lda $dd0d              // ad 0d dd
    and #$10               // 29 10
    bne bank01_sub_9be2              // d0 08
    lda $dc0d              // ad 0d dc
    and #$02               // 29 02
    beq bank01_sub_9bd3              // f0 f2
    sec                    // 38
bank01_sub_9be2:
    rts                    // 60
bank01_api_03:
    ldx #$04               // a2 04
    jsr bank01_sub_83b7              // 20 b7 83
    ldx #$04               // a2 04
    jsr bank01_sub_9bf0              // 20 f0 9b
    jmp $de26              // 4c 26 de
bank01_sub_9bf0:
    txa                    // 8a
    pha                    // 48
    jsr $f30f              // 20 0f f3
    beq bank01_sub_9bfc              // f0 05
bank01_sub_9bf7:
    pla                    // 68
    tax                    // aa
    jmp $f250              // 4c 50 f2
bank01_sub_9bfc:
    jsr $f31f              // 20 1f f3
    lda $ba                // a5 ba
    cmp #$04               // c9 04
    bne bank01_sub_9bf7              // d0 f2
    sei                    // 78
    jsr bank01_sub_9bb7              // 20 b7 9b
    bcs bank01_sub_9bf7              // b0 ec
    lda #$04               // a9 04
    sta $9a                // 85 9a
    jsr bank01_sub_836f              // 20 6f 83
    lda $b9                // a5 b9
    and #$0f               // 29 0f
    cmp #$09               // c9 09
    beq bank01_sub_9c1c              // f0 02
    lda #$00               // a9 00
bank01_sub_9c1c:
    ora #$c0               // 09 c0
    sta $dd0c              // 8d 0c dd
    pla                    // 68
    clc                    // 18
    rts                    // 60
    .byte $4c, $ca, $f1, $2c, $0c, $dd, $10, $f8, $78, $85, $95, $48, $98, $48, $8a, $48    // data $9c24
    .byte $a9, $ff, $8d, $03, $dd, $20, $48, $9c, $20, $b1, $9b, $68, $aa, $68, $a8, $68    // data $9c34
    .byte $18, $4c, $26, $de, $a5, $95, $ac, $0c, $dd, $c0, $c9, $f0, $12, $a5, $95, $c9    // data $9c44
    .byte $20, $b0, $13, $c9, $1b, $f0, $08, $c9, $0d, $f0, $04, $c9, $0a, $d0, $03, $4c    // data $9c54
    .byte $66, $9b, $09, $80, $d0, $1f, $a8, $30, $0c, $c9, $60, $90, $04, $29, $df, $d0    // data $9c64
    .byte $14, $29, $3f, $10, $10, $c9, $ff, $d0, $04, $a9, $5e, $d0, $08, $c9, $a0, $90    // data $9c74
    .byte $02, $49, $c0, $09, $40, $85, $95, $c9, $20, $b0, $04, $c9, $1b, $b0, $1c, $ad    // data $9c84
    .byte $18, $d0, $4a, $4a, $a9, $40, $90, $02, $a9, $60, $85, $a4, $a5, $95, $c5, $a4    // data $9c94
    .byte $b0, $09, $c9, $20, $b0, $02, $05, $a4, $4c, $7d, $9b, $85, $95, $a9, $1b, $20    // data $9ca4
    .byte $7d, $9b, $a9, $4b, $20, $7d, $9b, $a9, $08, $20, $7d, $9b, $a9, $00, $20, $7d    // data $9cb4
    .byte $9b, $a5, $97, $48, $a5, $96, $48, $ad, $18, $d0, $4a, $29, $01, $09, $1a, $85    // data $9cc4
    .byte $97, $a5, $95, $a0, $03, $0a, $26, $97, $88, $d0, $fa, $85, $96, $a9, $80, $85    // data $9cd4
    .byte $a4, $a9, $00, $85, $95, $a5, $01, $aa, $29, $fb, $85, $01, $a0, $07, $b1, $96    // data $9ce4
    .byte $25, $a4, $f0, $07, $a5, $95, $19, $14, $9d, $85, $95, $88, $10, $f0, $86, $01    // data $9cf4
    .byte $a5, $95, $20, $7d, $9b, $46, $a4, $90, $d8, $68, $85, $96, $68, $85, $97, $60    // data $9d04
    .byte $80, $40, $20, $10, $08, $04, $02, $01, $60, $a9, $01, $48, $a9, $6f, $48, $a2    // data $9d14
    .byte $50, $bd, $2f, $9d, $9d, $70, $01, $ca, $10, $f7, $60, $78, $a9, $37, $85, $01    // data $9d24
    .byte $a9, $0a, $8d, $00, $de, $20, $8a, $ff, $20, $81, $ff, $20, $84, $ff, $a9, $00    // data $9d34
    .byte $8d, $06, $df, $8d, $02, $df, $8d, $04, $df, $8d, $07, $df, $a9, $08, $8d, $03    // data $9d44
    .byte $df, $8d, $05, $df, $a9, $f8, $8d, $08, $df, $a9, $ed, $8d, $01, $df, $a9, $34    // data $9d54
    .byte $85, $01, $ad, $00, $ff, $8d, $00, $ff, $a9, $37, $85, $01, $58, $4c, $00, $80    // data $9d64
// ---------------------------------------------------------------------------
// line_tap (formerly hondani_check) -- HONDANI itself is retired. This now
// runs on every non-empty line typed at the BASIC prompt, purely as a tap:
// it shadow-copies the raw (pre-crunch) line text to real RAM, idempotently
// installs an IERROR ($0300/$0301) hook, then unconditionally falls through
// to the cart's own scanner exactly as if we were never here. The actual
// "unrecognized command -> ask the cloud" behavior lives in the IERROR
// hook (ierror_stub_rom below), which only fires when BASIC itself decides
// a direct-mode line couldn't be parsed -- a true fallback, not a keyword.
// ---------------------------------------------------------------------------
.const cf_shadow = $cf32          // shadow copy of the raw typed line (up to 77 chars + null)
.const cf_shadow_max = 77
.const ie_ram = $cf00             // ierror_stub_rom is relocated here (reuses the old xb_stub slot)
.const ie_orig_vec = $cf80        // +$cf81: original $0300/$0301 value, saved on first install
.const ie_errcode = $cf82         // stashed BASIC error-table index (X), diagnostic use for now

line_tap:
    tax                    // replicate the original TAX (X=char, sets Z; carry from CHRGET untouched)
    php                    // save flags so bank01_sub_8407 sees the same carry it always would
    bne lt_notempty
    stx $0258              // empty line: replicate the original fall-through exactly
    plp
    jmp bank01_api_02
lt_notempty:
    // NOTE: flags stay pushed (not PLP'd here) -- bank01_sub_8407 branches on
    // the CHRGET-derived carry (BCS = non-digit first char -> keyword scan,
    // BCC = digit first char -> program-line entry) immediately on entry, but
    // every CPY/CMP below (shadow-copy loop, IERROR-install checks) clobbers
    // carry before we get there. PLP is deferred to just before the final jmp
    // so bank01_sub_8407 sees the original flags, not leftover comparison
    // residue. Root-caused 2026-07-04 hardware report: the very first typed
    // line after a fresh boot silently vanished (no output, no READY) because
    // lt_install's one-time vector-comparison chain left carry clear (an
    // incidental byproduct of comparing the stock IERROR vector against
    // ie_ram), sending "?10" down the digit/program-line path instead of the
    // keyword-scan path; lt_installed's steady-state fast path happened to
    // always leave carry set instead, which is why retyping the same line
    // worked. Restoring flags right before the jump fixes both the first-line
    // case and the latent bug (actual program-line entry, e.g. typing "10
    // PRINT") that the always-set steady-state carry would otherwise break.

    // --- shadow-copy the raw typed line into RAM (before BASIC crunches it) ---
    ldy #$00
lt_copyloop:
    cpy #cf_shadow_max
    beq lt_copyterm
    lda ($7a),y
    beq lt_copyterm
    sta cf_shadow,y
    iny
    jmp lt_copyloop
lt_copyterm:
    lda #$00
    sta cf_shadow,y

    // --- idempotently install the IERROR hook (skip if already installed) ---
    lda $0301
    cmp #>ie_ram
    bne lt_install
    lda $0300
    cmp #<ie_ram
    beq lt_installed
lt_install:
    lda $0300               // save the original vector so the hook can fall
    sta ie_orig_vec          // through to it for non-direct-mode / uninteresting errors
    lda $0301
    sta ie_orig_vec+1
    ldx #ierror_stub_rom_end-ierror_stub_rom-1
lt_ierrcopy:
    lda ierror_stub_rom,x
    sta ie_ram,x
    dex
    bpl lt_ierrcopy
    lda #<ie_ram
    sta $0300
    lda #>ie_ram
    sta $0301
lt_installed:
    jsr ie_ram + (xb2_rom - ierror_stub_rom)   // every line: (re)install the CINV console-switch hook via bank05
    plp                      // restore the original CHRGET-derived flags now, right before bank01_sub_8407 needs them
    jmp bank01_sub_8407      // always fall through -- we never intercept here anymore

// Relocated verbatim to ie_ram ($cf00) on first install and left resident --
// unlike xb_stub (copied fresh every call), this must persist between calls
// since it's reached via JMP ($0300) from anywhere, at unpredictable times,
// not via our own jsr. Runs from RAM so it works regardless of which
// cartridge bank happens to be paged in when an error fires (see
// wedge-analysis.md's cross-bank-calling section for why that matters).
// X = BASIC's error-table index at entry (must be preserved untouched on
// the fall-through path -- the original handler depends on it).
ierror_stub_rom:
    lda $3a                 // CURLIN high byte: $ff means direct/immediate mode
    cmp #$ff
    beq ie_direct
    jmp (ie_orig_vec)        // program-mode error -- not ours, fall through untouched
ie_direct:
    // DIAGNOSTIC ROUND: fires for every direct-mode error (not narrowed to
    // SYNTAX yet -- the exact error-table index needs hardware confirmation
    // first, see wedge-analysis.md). Stash X so bank05 can print it.
    stx ie_errcode
    sei
    lda #$88                 // bank05 select value for $de00 (bit7+bit3 = bank 5)
    sta $de00
    jsr $9012                 // bank05's chat-forward entry point
    lda #$08                 // bank01 select value -- restore this bank
    sta $de00
    cli
    jmp ($0302)               // re-enter BASIC's main loop cleanly (same convention
                               // the old hondani_check used) -- never falls through
                               // to the stock error message for this case

// xb2 -- second entry in the same relocated RAM block ($cf00+): a fixed
// trampoline that pages in bank05, calls its wedge_install entry ($9015 in
// bank05's jump table: installs/refreshes the CINV keyboard-watch stub for
// C=+digit console switching), and pages bank01 back in. It must run from
// RAM because the $de00 write repages the very ROM window this template
// lives in (same reasoning as the retired xb_stub, see wedge-analysis.md).
// Called via jsr from lt_installed on every non-empty line, so the $0314
// hook survives anything that resets the vector (RUN/STOP+RESTORE etc.).
xb2_rom:
    sei
    lda #$88                 // bank05 select value
    sta $de00
    jsr $9015                // bank05 wedge_install (fixed jump-table entry)
    lda #$08                 // bank01 select value -- restore
    sta $de00
    cli
    rts
ierror_stub_rom_end:
    .fill $9e10 - ierror_stub_rom_end, $00    // remaining confirmed-free bytes, unused so far
    .byte $a9, $20, $8d, $00    // data $9e10 (unchanged original code resumes here)
    .byte $de, $a5, $01, $8d, $2e, $de, $09, $03, $85, $01, $a9, $08, $8d, $00, $de, $68    // data $9e14
    .byte $28, $60, $08, $48, $a9, $20, $8d, $00, $de, $a9, $37, $85, $01, $a9, $0a, $8d    // data $9e24
    .byte $00, $de, $68, $28, $58, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e34
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e44
    .byte $00, $00, $00, $00, $00, $c6, $01, $b1, $bb, $e6, $01, $60, $20, $26, $de, $a5    // data $9e54
    .byte $93, $90, $03, $4c, $a5, $f4, $4c, $ed, $f5, $38, $24, $18, $85, $93, $20, $97    // data $9e64
    .byte $de, $4c, $26, $89, $48, $a5, $9a, $c9, $04, $d0, $07, $68, $20, $97, $de, $4c    // data $9e74
    .byte $27, $9c, $4c, $cd, $f1, $20, $97, $de, $4c, $ea, $9b, $ea, $ea, $20, $97, $de    // data $9e84
    .byte $4c, $0f, $80, $78, $08, $48, $4c, $10, $de, $20, $ba, $de, $20, $20, $01, $20    // data $9e94
    .byte $97, $de, $4c, $e1, $8d, $20, $ba, $de, $20, $97, $de, $4c, $a2, $9f, $ea, $ea    // data $9ea4
    .byte $ea, $8d, $00, $de, $68, $60, $48, $78, $a9, $08, $48, $a9, $20, $8d, $00, $de    // data $9eb4
    .byte $00, $00, $00, $00, $00, $2c, $80, $80, $ea, $a9, $23, $8d, $00, $de, $00, $08    // data $9ec4
    .byte $78, $48, $a9, $23, $8d, $00, $de, $2c, $80, $80, $8d, $00, $de, $68, $40, $ea    // data $9ed4
    .byte $85, $9e, $68, $8d, $00, $de, $a5, $9e, $60, $08, $00, $08, $10, $18, $20, $0a    // data $9ee4
    .byte $23, $80, $24, $00, $00, $00, $00, $00, $00, $00, $30, $ee, $20, $50, $9f, $30    // data $9ef4
    .byte $80, $60, $8d, $37, $01, $8e, $44, $01, $a2, $ac, $78, $98, $18, $75, $00, $8d    // data $9f04
    .byte $38, $01, $b5, $01, $69, $00, $cd, $63, $01, $b0, $02, $69, $80, $8d, $39, $01    // data $9f14
    .byte $ae, $60, $01, $a9, $08, $b0, $0b, $ad, $12, $d0, $e9, $30, $b0, $f9, $a2, $37    // data $9f24
    .byte $a9, $23, $8d, $00, $de, $86, $01, $a9, $ff, $8d, $ff, $ff, $a2, $37, $86, $01    // data $9f34
    .byte $a2, $08, $8e, $00, $de, $a2, $ff, $29, $ff, $60    // data $9f44
bank01_sub_9f4e:
    nop                    // ea
    nop                    // ea
bank01_sub_9f50:
    nop                    // ea
bank01_sub_9f51:
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    cld                    // d8
    sta $a5                // 85 a5
    stx $a6                // 86 a6
    sty $a7                // 84 a7
    php                    // 08
    pla                    // 68
    sta $a8                // 85 a8
    pla                    // 68
    sta $9e                // 85 9e
    clc                    // 18
    adc #$02               // 69 02
    tax                    // aa
    pla                    // 68
    sta $9f                // 85 9f
    adc #$00               // 69 00
    pha                    // 48
    txa                    // 8a
    pha                    // 48
    lda $9e                // a5 9e
    bne bank01_sub_9f76              // d0 02
    dec $9f                // c6 9f
bank01_sub_9f76:
    dec $9e                // c6 9e
    ldy #$00               // a0 00
    lda ($9e),y            // b1 9e
    sec                    // 38
    sbc #$4e               // e9 4e
    tax                    // aa
    lda #$08               // a9 08
    pha                    // 48
    lda #$de               // a9 de
    pha                    // 48
    lda #$e2               // a9 e2
    pha                    // 48
    ldy #$03               // a0 03
    lda ($9e),y            // b1 9e
    pha                    // 48
    dey                    // 88
    lda ($9e),y            // b1 9e
    pha                    // 48
    lda $a8                // a5 a8
    pha                    // 48
    lda $a5                // a5 a5
    pha                    // 48
    lda $deee,x            // bd ee de
    ldx $a6                // a6 a6
    ldy $a7                // a4 a7
    jmp $dede              // 4c de de
    .byte $a9, $00, $85, $0d, $20, $73, $00, $c9, $24, $90, $04, $c9, $27, $90, $0c, $a9    // data $9fa2
    .byte $ae, $48, $a9, $8c, $48, $20, $79, $00, $4c, $26, $de, $85, $9e, $a9, $00, $a2    // data $9fb2
    .byte $0a, $95, $5d, $ca, $10, $fb, $20, $73, $00, $a4, $9e, $90, $06, $c9, $41, $90    // data $9fc2
    .byte $1f, $e9, $08, $e9, $2f, $d9, $d2, $9f, $b0, $16, $48, $a5, $61, $f0, $0a, $79    // data $9fd2
    .byte $d6, $9f, $90, $03, $4c, $7e, $b9, $85, $61, $68, $20, $7e, $bd, $4c, $c8, $9f    // data $9fe2
    .byte $18, $4c, $26, $de, $10, $02, $08, $00, $04, $01, $03, $00, $00, $00    // data $9ff2