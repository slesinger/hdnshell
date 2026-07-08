// disassembly for rr38p-tmp12reu.bin bank 3
// bank file offset: $6000-$7fff
// cartridge window: $8000-$9fff
// vectors: coldstart=$8009, warmstart=$800c, signature=c3 c2 cd 38 30
// reachable instructions: 1396 bytes decoded as code: 2719
// entry points: $8009, $800c, $8042, $8265, $82af, $82b5, $842f, $8435, $845d, $857f, $8644, $864c, $8944, $8e7f, $8eb3, $8ee2, $8fdc, $905f, $90c8, $90f6, $9102, $9159, $9219, $9418, $942f, $9451, $9473, $94c5, $94eb, $9502, $9658, $971c, $9f58, $9f8e, $9fc8
// jump table from cold start:
//   $8009 -> $90c8
//   $800c -> $82b5
//   $800f -> $845d
//   $8012 -> $8944
//   $8015 -> $8644
//   $8018 -> $864c
//   $801b -> $94eb
//   $801e -> $90f6
//   $8021 -> $8435
//   $8024 -> $842f
//   $8027 -> $9102
//   $802a -> $9f8e
//   $802d -> $82af
//   $8030 -> $8e7f
//   $8033 -> $8eb3
//   $8036 -> $8ee2
//   $8039 -> $9219
//   $803c -> $9159
//   $803f -> $857f
//   $8042 -> $8042
//   $8045 -> $905f
//   $8048 -> $9fc8
//   $804b -> $94c5
//   $804e -> $9f58
//   $8051 -> $8fdc
//   $8054 -> $9502
//   $8057 -> $9658
//   $805a -> $971c
//   $805d -> $942f
//   $8060 -> $9473
//   $8063 -> $9451
//   $8066 -> $9418
//   $8069 -> $8265
// external branch/jsr/jmp targets: $002d, $0073, $0079, $0210, $202d, $2041, $2045, $2059, $2d20, $2d42, $2e2e, $3146, $3436, $3531, $4153, $4353, $4424, $4552, $4620, $4843, $494c, $4957, $4e49, $4f4d, $4f53, $5053, $5244, $5245, $524f, $5349, $542a, $5453, $5543, $5941, $5943, $a02b, $a02f, $a200, $a3bf, $a533, $a57c, $a613, $a660, $a687, $a68e, $a81d, $a8fb, $a90b, $a96b, $af08, $bc49, $bdcd, $bddf, $de9d, $dede, $e3bf, $e453, $e544, $e716, $f6bc, $f6ed, $fd8d, $fda3, $fe72, $ff5b, $ff9f, $ffd2, $ffe4, $fff0

// symbol table (auto-generated)
//   $8009 bank03_cold_start
//   $800c bank03_warm_start
//   $8042 bank03_api_19
//   $8265 bank03_api_32
//   $82af bank03_api_12
//   $82b5 bank03_api_01
//   $82c0 bank03_sub_82c0
//   $835f bank03_sub_835f
//   $8362 bank03_sub_8362
//   $836a bank03_sub_836a
//   $8372 bank03_sub_8372
//   $8384 bank03_sub_8384
//   $838c bank03_sub_838c
//   $8394 bank03_sub_8394
//   $83a2 bank03_sub_83a2
//   $83a7 bank03_sub_83a7
//   $83b0 bank03_sub_83b0
//   $83cf bank03_sub_83cf
//   $842f bank03_api_09
//   $8435 bank03_api_08
//   $8439 bank03_sub_8439
//   $844e bank03_sub_844e
//   $8450 bank03_sub_8450
//   $845d bank03_api_02
//   $845e bank03_sub_845e
//   $8576 bank03_sub_8576
//   $857f bank03_api_18
//   $8594 bank03_sub_8594
//   $85a1 bank03_sub_85a1
//   $8644 bank03_api_04
//   $864c bank03_api_05
//   $86e5 bank03_sub_86e5
//   $86f3 bank03_sub_86f3
//   $8944 bank03_api_03
//   $8985 bank03_sub_8985
//   $8c60 bank03_sub_8c60
//   $8ca6 bank03_sub_8ca6
//   $8cbb bank03_sub_8cbb
//   $8cca bank03_sub_8cca
//   $8cd6 bank03_sub_8cd6
//   $8cd9 bank03_sub_8cd9
//   $8ce4 bank03_sub_8ce4
//   $8ce7 bank03_sub_8ce7
//   $8ced bank03_sub_8ced
//   $8cfd bank03_sub_8cfd
//   $8d09 bank03_sub_8d09
//   $8d18 bank03_sub_8d18
//   $8d1d bank03_sub_8d1d
//   $8d2e bank03_sub_8d2e
//   $8d4b bank03_sub_8d4b
//   $8d70 bank03_sub_8d70
//   $8d79 bank03_sub_8d79
//   $8d8a bank03_sub_8d8a
//   $8da1 bank03_sub_8da1
//   $8e6e bank03_sub_8e6e
//   $8e7f bank03_api_13
//   $8e81 bank03_sub_8e81
//   $8eaa bank03_sub_8eaa
//   $8eb3 bank03_api_14
//   $8ec6 bank03_sub_8ec6
//   $8ed3 bank03_sub_8ed3
//   $8edc bank03_sub_8edc
//   $8edd bank03_sub_8edd
//   $8ee2 bank03_api_15
//   $8ef1 bank03_sub_8ef1
//   $8f12 bank03_sub_8f12
//   $8f15 bank03_sub_8f15
//   $8f2b bank03_sub_8f2b
//   $8f46 bank03_sub_8f46
//   $8f4c bank03_sub_8f4c
//   $8f56 bank03_sub_8f56
//   $8f9f bank03_sub_8f9f
//   $8fbd bank03_sub_8fbd
//   $8fd8 bank03_sub_8fd8
//   $8fdb bank03_sub_8fdb
//   $8fdc bank03_api_24
//   $904a bank03_sub_904a
//   $905f bank03_api_20
//   $90b8 bank03_sub_90b8
//   $90c8 bank03_api_00
//   $90cc bank03_sub_90cc
//   $90d6 bank03_sub_90d6
//   $90f6 bank03_api_07
//   $90f8 bank03_sub_90f8
//   $9102 bank03_api_10
//   $910b bank03_sub_910b
//   $9111 bank03_sub_9111
//   $9124 bank03_sub_9124
//   $9159 bank03_api_17
//   $9172 bank03_sub_9172
//   $9183 bank03_sub_9183
//   $919b bank03_sub_919b
//   $91a9 bank03_sub_91a9
//   $91bc bank03_sub_91bc
//   $91c8 bank03_sub_91c8
//   $91e5 bank03_sub_91e5
//   $91ef bank03_sub_91ef
//   $91f5 bank03_sub_91f5
//   $91fd bank03_sub_91fd
//   $91ff bank03_sub_91ff
//   $920a bank03_sub_920a
//   $920b bank03_sub_920b
//   $9211 bank03_sub_9211
//   $9212 bank03_sub_9212
//   $9218 bank03_sub_9218
//   $9219 bank03_api_16
//   $922b bank03_sub_922b
//   $9231 bank03_sub_9231
//   $923a bank03_sub_923a
//   $923f bank03_sub_923f
//   $9242 bank03_sub_9242
//   $9261 bank03_sub_9261
//   $9266 bank03_sub_9266
//   $926c bank03_sub_926c
//   $9273 bank03_sub_9273
//   $9276 bank03_sub_9276
//   $9295 bank03_sub_9295
//   $9298 bank03_sub_9298
//   $92aa bank03_sub_92aa
//   $92ac bank03_sub_92ac
//   $92b4 bank03_sub_92b4
//   $92c0 bank03_sub_92c0
//   $92cc bank03_sub_92cc
//   $92cd bank03_sub_92cd
//   $92e0 bank03_sub_92e0
//   $92f5 bank03_sub_92f5
//   $931d bank03_sub_931d
//   $932b bank03_sub_932b
//   $932f bank03_sub_932f
//   $9337 bank03_sub_9337
//   $9341 bank03_sub_9341
//   $9372 bank03_sub_9372
//   $9375 bank03_sub_9375
//   $938e bank03_sub_938e
//   $9391 bank03_sub_9391
//   $9397 bank03_sub_9397
//   $93b6 bank03_sub_93b6
//   $93c2 bank03_sub_93c2
//   $93c4 bank03_sub_93c4
//   $93d6 bank03_sub_93d6
//   $93e2 bank03_sub_93e2
//   $93f5 bank03_sub_93f5
//   $9406 bank03_sub_9406
//   $9410 bank03_sub_9410
//   $9411 bank03_sub_9411
//   $9418 bank03_api_31
//   $942a bank03_sub_942a
//   $942f bank03_api_28
//   $9451 bank03_api_30
//   $946e bank03_sub_946e
//   $9473 bank03_api_29
//   $94a0 bank03_sub_94a0
//   $94b7 bank03_sub_94b7
//   $94c2 bank03_sub_94c2
//   $94c5 bank03_api_22
//   $94c8 bank03_sub_94c8
//   $94eb bank03_api_06
//   $9502 bank03_api_25
//   $9658 bank03_api_26
//   $96de bank03_sub_96de
//   $96f4 bank03_sub_96f4
//   $971c bank03_api_27
//   $972b bank03_sub_972b
//   $9744 bank03_sub_9744
//   $9772 bank03_sub_9772
//   $9777 bank03_sub_9777
//   $9789 bank03_sub_9789
//   $978f bank03_sub_978f
//   $9790 bank03_sub_9790
//   $97a1 bank03_sub_97a1
//   $9f01 bank03_sub_9f01
//   $9f02 bank03_sub_9f02
//   $9f05 bank03_sub_9f05
//   $9f2b bank03_sub_9f2b
//   $9f58 bank03_api_23
//   $9f61 bank03_sub_9f61
//   $9f69 bank03_sub_9f69
//   $9f86 bank03_sub_9f86
//   $9f87 bank03_sub_9f87
//   $9f8e bank03_api_11
//   $9f9a bank03_sub_9f9a
//   $9fc8 bank03_api_21

.pc = $8000

    .byte $09, $80, $0c, $80, $c3, $c2, $cd, $38, $30    // data $8000
bank03_cold_start:
    jmp bank03_api_00              // 4c c8 90
bank03_warm_start:
    jmp bank03_api_01              // 4c b5 82
    .byte $4c, $5d, $84, $4c, $44, $89, $4c, $44, $86, $4c, $4c, $86, $4c, $eb, $94, $4c    // data $800f
    .byte $f6, $90, $4c, $35, $84, $4c, $2f, $84, $4c, $02, $91, $4c, $8e, $9f, $4c, $af    // data $801f
    .byte $82, $4c, $7f, $8e, $4c, $b3, $8e, $4c, $e2, $8e, $4c, $19, $92, $4c, $59, $91    // data $802f
    .byte $4c, $7f, $85    // data $803f
bank03_api_19:
    jmp bank03_api_19              // 4c 42 80
    .byte $4c, $5f, $90, $4c, $c8, $9f, $4c, $c5, $94, $4c, $58, $9f, $4c, $dc, $8f, $4c    // data $8045
    .byte $02, $95, $4c, $58, $96, $4c, $1c, $97, $4c, $2f, $94, $4c, $73, $94, $4c, $51    // data $8055
    .byte $94, $4c, $18, $94, $4c, $65, $82, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8065
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ea, $ea, $ea, $ea    // data $8075
    .byte $ea, $ea, $4c, $8d, $80, $4c, $41, $82, $a2, $00, $bd, $cf, $80, $9d, $00, $ce    // data $8085
    .byte $bd, $cf, $81, $9d, $00, $cf, $ee, $20, $d0, $e8, $d0, $ee, $20, $62, $83, $0d    // data $8095
    .byte $0d, $53, $54, $41, $52, $54, $45, $44, $20, $44, $45, $42, $55, $47, $53, $54    // data $80a5
    .byte $55, $42, $20, $4f, $4e, $20, $53, $53, $20, $2d, $20, $4b, $49, $43, $4b, $20    // data $80b5
    .byte $49, $4e, $20, $59, $45, $52, $20, $50, $43, $00, $4c, $06, $ce, $4c, $11, $ce    // data $80c5
    .byte $a9, $04, $20, $ff, $ce, $20, $11, $ce, $4c, $0b, $ce, $78, $20, $45, $cf, $b0    // data $80d5
    .byte $23, $c9, $41, $d0, $1f, $20, $5c, $cf, $c9, $42, $d0, $03, $4c, $3c, $ce, $c9    // data $80e5
    .byte $43, $d0, $03, $4c, $87, $ce, $c9, $44, $d0, $03, $4c, $ce, $ce, $c9, $4b, $d0    // data $80f5
    .byte $03, $4c, $db, $ce, $58, $60, $a5, $a0, $48, $a5, $a1, $48, $a5, $a2, $48, $a5    // data $8105
    .byte $a3, $48, $20, $5c, $cf, $85, $a2, $20, $5c, $cf, $85, $a3, $20, $5c, $cf, $85    // data $8115
    .byte $a0, $20, $5c, $cf, $85, $a1, $a0, $00, $20, $5c, $cf, $91, $a0, $e6, $a0, $d0    // data $8125
    .byte $02, $e6, $a1, $a5, $a1, $c5, $a3, $d0, $ef, $a5, $a0, $c5, $a2, $d0, $e9, $68    // data $8135
    .byte $8d, $a3, $00, $68, $8d, $a2, $00, $68, $8d, $a1, $00, $68, $8d, $a0, $00, $58    // data $8145
    .byte $60, $a5, $a0, $48, $a5, $a1, $48, $a5, $a2, $48, $a5, $a3, $48, $20, $5c, $cf    // data $8155
    .byte $85, $a2, $20, $5c, $cf, $85, $a3, $20, $5c, $cf, $85, $a0, $20, $5c, $cf, $85    // data $8165
    .byte $a1, $a0, $00, $b1, $a0, $20, $62, $cf, $e6, $a0, $d0, $02, $e6, $a1, $a5, $a1    // data $8175
    .byte $c5, $a3, $d0, $ef, $a5, $a0, $c5, $a2, $d0, $e9, $68, $85, $a3, $68, $85, $a2    // data $8185
    .byte $68, $85, $a1, $68, $85, $a0, $58, $60, $20, $5c, $cf, $85, $a0, $20, $5c, $cf    // data $8195
    .byte $85, $a1, $6c, $a0, $00, $a9, $37, $85, $01, $58, $20, $59, $a6, $4c, $ae, $a7    // data $81a5
    .byte $ad, $01, $de, $09, $01, $8d, $01, $de, $a2, $00, $8e, $0f, $de, $ec, $0f, $de    // data $81b5
    .byte $d0, $05, $e8, $d0, $f5, $18, $60, $38, $60, $aa, $ad, $01, $de, $09, $01, $8d    // data $81c5
    .byte $01, $de, $a9, $87, $8d, $0a, $de, $a9, $83, $8d, $0b, $de, $8e, $08, $de, $a9    // data $81d5
    .byte $00, $8d, $09, $de, $a9, $03, $8d, $0b, $de, $a9, $00, $8d, $09, $de, $4c, $3f    // data $81e5
    .byte $cf, $ad, $0d, $de, $29, $01, $60, $ad, $0d, $de, $29, $20, $60, $ad, $0e, $de    // data $81f5
    .byte $29, $10, $60, $a9, $03, $8d, $0c, $de, $60, $a9, $01, $8d, $0c, $de, $60, $20    // data $8205
    .byte $27, $cf, $d0, $03, $20, $39, $cf, $20, $3f, $cf, $20, $27, $cf, $d0, $02, $38    // data $8215
    .byte $60, $ad, $08, $de, $18, $60, $20, $45, $cf, $b0, $fb, $60, $48, $20, $33, $cf    // data $8225
    .byte $f0, $fb, $20, $2d, $cf, $f0, $fb, $68, $8d, $08, $de, $60, $20, $62, $83, $0d    // data $8235
    .byte $20, $20, $41, $44, $44, $52, $20, $41, $52, $20, $58, $52, $20, $59, $52, $20    // data $8245
    .byte $53, $50, $20, $30, $31, $20, $4e, $56, $2d, $42, $44, $49, $5a, $43, $00, $60    // data $8255
bank03_api_32:
    jsr bank03_sub_8362              // 20 62 83
    .byte $52    // undocumented opcode
    .byte $52    // undocumented opcode
    jsr $4552              // 20 52 45
    lsr $3a,x              // 56 3a
    jsr $a200              // 20 00 a2
    sta $a0,x              // 95 a0
    .byte $82    // undocumented opcode
    jsr $de9d              // 20 9d de
    jsr $e716              // 20 16 e7
    lda #$2e               // a9 2e
    jsr $e716              // 20 16 e7
    iny                    // c8
    jsr $de9d              // 20 9d de
    jsr $e716              // 20 16 e7
    iny                    // c8
    jsr $de9d              // 20 9d de
    jsr $e716              // 20 16 e7
    jsr bank03_sub_8362              // 20 62 83
    ora $4f0d              // 0d 0d 4f
    .byte $57    // undocumented opcode
    lsr $5245              // 4e 45 52
    .byte $3a    // undocumented opcode
    jsr $a200              // 20 00 a2
    sta $a0,x              // 95 a0
    sta $20                // 85 20
    sta $20de,x            // 9d de 20
    asl $e7,x              // 16 e7
    iny                    // c8
    cpy #$95               // c0 95
    bne $829f              // d0 f5
    lda #$0d               // a9 0d
    jmp $e716              // 4c 16 e7
bank03_api_12:
    jsr bank03_sub_9f02              // 20 02 9f
    clc                    // 18
    .byte $80    // undocumented opcode
    rts                    // 60
bank03_api_01:
    jsr $f6bc              // 20 bc f6
    jsr $f6ed              // 20 ed f6
    beq bank03_sub_82c0              // f0 03
    jmp $fe72              // 4c 72 fe
bank03_sub_82c0:
    ldx #$fb               // a2 fb
    txs                    // 9a
    jsr bank03_sub_9f01              // 20 01 9f
    .byte $0c    // undocumented opcode
    .byte $80    // undocumented opcode
    jsr bank03_sub_9f02              // 20 02 9f
    .byte $12    // undocumented opcode
    .byte $80    // undocumented opcode
    rts                    // 60
    .byte $a9, $4e, $8d, $3c, $03, $a9, $3a, $8d, $3d, $03, $20, $62, $83, $44, $49, $53    // data $82ce
    .byte $4b, $20, $4e, $41, $4d, $45, $3a, $20, $00, $a2, $0b, $a0, $1a, $20, $00, $9f    // data $82de
    .byte $5d, $80, $d0, $03, $4c, $5d, $84, $85, $fb, $a8, $88, $b1, $bb, $99, $3e, $03    // data $82ee
    .byte $88, $10, $f8, $20, $62, $83, $49, $44, $20, $4e, $55, $4d, $42, $45, $52, $3a    // data $82fe
    .byte $20, $00, $a9, $a0, $a4, $fb, $a2, $05, $99, $3e, $03, $c8, $ca, $10, $f9, $a2    // data $830e
    .byte $0b, $a0, $0c, $20, $00, $9f, $5d, $80, $a6, $fb, $a8, $f0, $13, $a9, $2c, $9d    // data $831e
    .byte $3e, $03, $e8, $a0, $00, $b1, $bb, $9d, $3e, $03, $e8, $c8, $c0, $05, $d0, $f5    // data $832e
    .byte $e8, $e8, $8a, $a2, $3c, $a0, $03, $20, $bd, $ff, $a9, $00, $85, $9d, $20, $02    // data $833e
    .byte $9f, $1b, $80, $20, $ae, $ff, $4c, $7f, $85, $a9, $00, $85, $b7, $f0, $ef, $a2    // data $834e
    .byte $03    // data $835e
bank03_sub_835f:
    jsr bank03_sub_8576              // 20 76 85
bank03_sub_8362:
    pla                    // 68
    sta $3d                // 85 3d
    pla                    // 68
    sta $3e                // 85 3e
    stx $8d                // 86 8d
bank03_sub_836a:
    ldy #$00               // a0 00
    inc $3d                // e6 3d
    bne bank03_sub_8372              // d0 02
    inc $3e                // e6 3e
bank03_sub_8372:
    lda ($3d),y            // b1 3d
    beq bank03_sub_83a7              // f0 31
    cmp #$01               // c9 01
    bne bank03_sub_8384              // d0 0a
    ldx $d6                // a6 d6
    inx                    // e8
    ldy #$0a               // a0 0a
    jsr bank03_sub_8576              // 20 76 85
    bne bank03_sub_836a              // d0 e6
bank03_sub_8384:
    cmp #$02               // c9 02
    bne bank03_sub_8394              // d0 0c
    iny                    // c8
    lda ($3d),y            // b1 3d
    tax                    // aa
bank03_sub_838c:
    jsr bank03_sub_83b0              // 20 b0 83
    dex                    // ca
    bne bank03_sub_838c              // d0 fa
    beq bank03_sub_836a              // f0 d6
bank03_sub_8394:
    cmp #$2a               // c9 2a
    bne bank03_sub_83a2              // d0 0a
    jsr bank03_sub_83b0              // 20 b0 83
    lda #$2d               // a9 2d
    jsr $e716              // 20 16 e7
    lda #$20               // a9 20
bank03_sub_83a2:
    jsr $e716              // 20 16 e7
    bcc bank03_sub_836a              // 90 c3
bank03_sub_83a7:
    lda $3e                // a5 3e
    pha                    // 48
    lda $3d                // a5 3d
    pha                    // 48
    ldx $8d                // a6 8d
    rts                    // 60
bank03_sub_83b0:
    lda #$20               // a9 20
    jmp $e716              // 4c 16 e7
    .byte $ad, $36, $03, $85, $ae, $ad, $37, $03, $85, $af, $a2, $01, $86, $c1, $a0, $08    // data $83b5
    .byte $84, $c2, $ad, $38, $03, $85, $bd, $4c, $8e, $fb    // data $83c5
bank03_sub_83cf:
    sei                    // 78
    jsr $fda3              // 20 a3 fd
    jsr bank03_api_00              // 20 c8 90
    jsr $ff5b              // 20 5b ff
    jsr $e453              // 20 53 e4
    jsr $e3bf              // 20 bf e3
    lda #$03               // a9 03
    sta $2d                // 85 2d
    lda #$08               // a9 08
    sta $2e                // 85 2e
    lda #$80               // a9 80
    sta $9d                // 85 9d
    lda #$37               // a9 37
    sta $01                // 85 01
    sta $c0                // 85 c0
    lda #$06               // a9 06
    sta $d020              // 8d 20 d0
    sta $d021              // 8d 21 d0
    ldx #$01               // a2 01
    ldy #$0b               // a0 0b
    jsr bank03_sub_835f              // 20 5f 83
    ora $20                // 05 20
    .byte $43    // undocumented opcode
    eor $4542,y            // 59 42 45
    .byte $52    // undocumented opcode
    bvc bank03_sub_845e              // 50 55
    lsr $2058              // 4e 58 20
    .byte $52    // undocumented opcode
    eor $50                // 45 50
    jmp $5941              // 4c 41 59
    .byte $00, $a2, $02, $a0, $0c, $20, $76, $85, $a2, $0f, $a9, $a3, $20, $16, $e7, $ca    // data $8412
    .byte $10, $fa, $a2, $8f, $a0, $de, $8e, $02, $03, $8c, $03, $03, $60    // data $8422
bank03_api_09:
    ldx #$90               // a2 90
    ldy #$84               // a0 84
    bne bank03_sub_8439              // d0 04
bank03_api_08:
    ldx #$72               // a2 72
    ldy #$84               // a0 84
bank03_sub_8439:
    stx $033a              // 8e 3a 03
    sty $033b              // 8c 3b 03
    sei                    // 78
    ldx #$fb               // a2 fb
    txs                    // 9a
    cld                    // d8
    ldx $ba                // a6 ba
    cpx #$11               // e0 11
    bcs bank03_sub_844e              // b0 04
    cpx #$08               // e0 08
    bcs bank03_sub_8450              // b0 02
bank03_sub_844e:
    ldx #$08               // a2 08
bank03_sub_8450:
    stx $0339              // 8e 39 03
    lda $ae                // a5 ae
    sta $0336              // 8d 36 03
    lda $af                // a5 af
    sta $0337              // 8d 37 03
bank03_api_02:
    sei                    // 78
bank03_sub_845e:
    ldx #$fb               // a2 fb
    txs                    // 9a
    cld                    // d8
    stx $cc                // 86 cc
    jsr bank03_sub_83cf              // 20 cf 83
    jsr $a660              // 20 60 a6
    lda $0339              // ad 39 03
    sta $ba                // 85 ba
    jmp ($033a)            // 6c 3a 03
    .byte $a0, $0d, $20, $5d, $83, $12, $55, $54, $49, $4c, $49, $54, $49, $45, $53, $20    // data $8472
    .byte $4d, $45, $4e, $55, $0d, $00, $a2, $f8, $a0, $85, $a9, $10, $d0, $20, $20, $b5    // data $8482
    .byte $83, $a0, $0e, $20, $5d, $83, $12, $42, $41, $43, $4b, $55, $50, $20, $20, $4d    // data $8492
    .byte $45, $4e, $55, $0d, $00, $20, $04, $87, $a2, $a2, $a0, $85, $a9, $06, $20, $b6    // data $84a2
    .byte $84, $4c, $5d, $84, $86, $ae, $84, $af, $85, $ad, $20, $a6, $9f, $a2, $05, $a0    // data $84b2
    .byte $0a, $20, $5f, $83, $46, $31, $20, $2d, $20, $44, $49, $53, $4b, $20, $44, $45    // data $84c2
    .byte $56, $49, $43, $45, $3a, $01, $46, $33, $20, $2d, $20, $44, $49, $52, $45, $43    // data $84d2
    .byte $54, $4f, $52, $59, $01, $46, $35, $20, $2d, $20, $46, $4f, $52, $4d, $41, $54    // data $84e2
    .byte $01, $46, $37, $20, $2d, $20, $44, $4f, $53, $20, $43, $4f, $4d, $4d, $41, $4e    // data $84f2
    .byte $44, $0d, $01, $00, $a9, $41, $85, $ab, $a0, $00, $84, $fb, $a6, $d6, $e8, $c9    // data $8502
    .byte $20, $d0, $01, $e8, $a0, $06, $20, $76, $85, $a5, $ab, $e6, $ab, $20, $16, $e7    // data $8512
    .byte $20, $62, $83, $2a, $00, $a4, $fb, $b1, $ae, $f0, $0c, $08, $29, $7f, $20, $16    // data $8522
    .byte $e7, $c8, $28, $10, $f2, $d0, $d3, $20, $90, $85, $c9, $85, $d0, $05, $20, $9e    // data $8532
    .byte $9f, $90, $f4, $a2, $00, $c9, $86, $f0, $1c, $a2, $02, $c9, $87, $f0, $16, $a2    // data $8542
    .byte $04, $c9, $88, $f0, $10, $c9, $41, $90, $de, $c5, $ab, $b0, $da, $38, $e9, $41    // data $8552
    .byte $0a, $18, $65, $ad, $aa, $bd, $26, $86, $48, $bd, $25, $86, $48, $20, $b5, $83    // data $8562
    .byte $a2, $16, $a0, $00    // data $8572
bank03_sub_8576:
    clc                    // 18
    jmp $fff0              // 4c f0 ff
    .byte $20, $02, $9f, $21, $80    // data $857a
bank03_api_18:
    jsr bank03_sub_8362              // 20 62 83
    ora $5250              // 0d 50 52
    eor $53                // 45 53
    .byte $53    // undocumented opcode
    jsr $2041              // 20 41 20
    .byte $4b    // undocumented opcode
    eor $59                // 45 59
    ora $a900              // 0d 00 a9
    brk                    // 00
    sta $c6                // 85 c6
bank03_sub_8594:
    jsr $ff9f              // 20 9f ff
    jsr $ffe4              // 20 e4 ff
    beq bank03_sub_8594              // f0 f8
    cmp #$03               // c9 03
    beq bank03_sub_85a1              // f0 01
    clc                    // 18
bank03_sub_85a1:
    rts                    // 60
    .byte $44, $49, $53, $4b, $20, $53, $41, $56, $45, $20, $2d, $20, $54, $55, $52, $42    // data $85a2
    .byte $cf, $44, $49, $53, $4b, $20, $53, $41, $56, $45, $20, $2d, $20, $53, $54, $41    // data $85b2
    .byte $4e, $44, $41, $52, $c4, $52, $45, $53, $54, $41, $52, $54, $20, $50, $52, $4f    // data $85c2
    .byte $47, $52, $41, $cd, $45, $58, $49, $54, $20, $54, $4f, $20, $55, $54, $49, $4c    // data $85d2
    .byte $49, $54, $49, $45, $d3, $45, $58, $49, $54, $20, $54, $4f, $20, $46, $41, $53    // data $85e2
    .byte $54, $4c, $4f, $41, $44, $00, $44, $49, $53, $4b, $20, $46, $49, $4c, $45, $43    // data $85f2
    .byte $4f, $50, $d9, $57, $48, $4f, $4c, $45, $20, $44, $49, $53, $4b, $20, $43, $4f    // data $8602
    .byte $50, $d9, $45, $58, $49, $54, $20, $54, $4f, $20, $46, $41, $53, $54, $4c, $4f    // data $8612
    .byte $41, $44, $00, $79, $85, $cd, $82, $b8, $86, $90, $86, $3f, $87, $0c, $08, $20    // data $8622
    .byte $80, $f7, $86, $3a, $86, $35, $80, $f7, $86, $20, $12, $80, $20, $c3, $9f, $4c    // data $8632
    .byte $57, $83    // data $8642
bank03_api_04:
    lda $c1                // a5 c1
    sta $c3                // 85 c3
    lda $c2                // a5 c2
    sta $c4                // 85 c4
bank03_api_05:
    jsr bank03_sub_9f05              // 20 05 9f
    .byte $8f    // undocumented opcode
    inc $20,x              // f6 20
    stx $a9fb              // 8e fb a9
    adc ($85,x)            // 61 85
    lda $a020,y            // b9 20 a0
    dec $0190,x            // de 90 01
    rts                    // 60
    .byte $a5, $ba, $20, $b1, $ff, $a5, $b9, $20, $93, $ff, $a5, $c3, $20, $a8, $ff, $a5    // data $865e
    .byte $c4, $20, $a8, $ff, $20, $d1, $fc, $b0, $17, $78, $a0, $07, $b9, $fc, $86, $99    // data $866e
    .byte $a4, $00, $88, $d0, $f7, $20, $a5, $00, $20, $a8, $ff, $20, $db, $fc, $d0, $e4    // data $867e
    .byte $4c, $3f, $f6, $a9, $80, $2c, $a9, $00, $8d, $38, $03, $85, $bd, $20, $b9, $9f    // data $868e
    .byte $a5, $bd, $d0, $0e, $a4, $b7, $a9, $2c, $91, $bb, $c8, $a9, $57, $91, $bb, $c8    // data $869e
    .byte $84, $b7, $20, $c8, $82, $20, $c3, $9f, $4c, $57, $83, $20, $62, $83, $45, $4e    // data $86ae
    .byte $54, $45, $52, $20, $43, $4f, $4d, $4d, $41, $4e, $44, $3a, $3e, $20, $00, $a2    // data $86be
    .byte $10, $a0, $38, $20, $00, $9f, $5d, $80, $08, $20, $02, $9f, $1b, $80, $28, $f0    // data $86ce
    .byte $03, $4c, $57, $83, $4c, $7f, $85    // data $86de
bank03_sub_86e5:
    lda #$12               // a9 12
    jsr $e716              // 20 16 e7
    cpx #$0a               // e0 0a
    bcs bank03_sub_86f3              // b0 05
    lda #$30               // a9 30
    jsr $e716              // 20 16 e7
bank03_sub_86f3:
    lda #$00               // a9 00
    jmp $bdcd              // 4c cd bd
    .byte $20, $01, $9f, $09, $80, $e6, $01, $b1, $ac, $c6, $01, $60, $a2, $09, $a0, $1e    // data $86f8
    .byte $20, $5f, $83, $42, $4c, $4f, $43, $4b, $53, $00, $a0, $00, $a9, $fe, $a2, $0b    // data $8708
    .byte $20, $2b, $87, $a2, $0c, $a0, $20, $20, $76, $85, $a6, $bf, $e0, $cb, $90, $13    // data $8718
    .byte $e8, $d0, $10, $a0, $20, $85, $bf, $20, $76, $85, $a6, $bf, $20, $02, $9f, $27    // data $8728
    .byte $80, $86, $bf, $a9, $00, $4c, $cd, $bd, $20, $b9, $9f, $a0, $b9, $b9, $56, $87    // data $8738
    .byte $99, $46, $03, $88, $d0, $f7, $20, $47, $03, $20, $c3, $9f, $4c, $57, $83, $a5    // data $8748
    .byte $af, $38, $e9, $d0, $90, $24, $aa, $86, $fd, $e8, $8e, $ca, $03, $20, $88, $03    // data $8758
    .byte $a5, $ae, $18, $69, $50, $85, $ae, $a5, $fd, $69, $08, $85, $af, $20, $72, $03    // data $8768
    .byte $20, $88, $03, $20, $f1, $03, $a0, $d0, $d0, $04, $a6, $ae, $a4, $af, $a9, $01    // data $8778
    .byte $85, $ac, $a9, $08, $85, $ad, $a9, $ac, $c6, $01, $20, $d8, $ff, $e6, $01, $60    // data $8788
    .byte $a0, $3a, $b9, $0c, $08, $48, $b9, $c5, $03, $99, $0c, $08, $68, $99, $c5, $03    // data $8798
    .byte $88, $d0, $ef, $a9, $47, $85, $22, $a9, $08, $85, $23, $a9, $d0, $85, $25, $84    // data $87a8
    .byte $24, $78, $a6, $fd, $e8, $e6, $01, $b1, $22, $48, $b1, $24, $91, $22, $68, $91    // data $87b8
    .byte $24, $c8, $d0, $f3, $e6, $23, $e6, $25, $ca, $d0, $ec, $c6, $01, $60, $78, $e6    // data $87c8
    .byte $01, $a2, $20, $a0, $00, $b9, $47, $08, $99, $00, $d0, $c8, $d0, $f7, $ee, $16    // data $87d8
    .byte $08, $ee, $19, $08, $ca, $d0, $ee, $c6, $01, $20, $38, $08, $c8, $84, $b9, $a9    // data $87e8
    .byte $08, $48, $a9, $0c, $48, $8a, $4c, $d5, $ff, $a5, $bb, $d0, $02, $c6, $bc, $c6    // data $87f8
    .byte $bb, $e6, $b7, $a9, $31, $91, $bb, $60, $09, $20, $48, $24, $94, $10, $0a, $38    // data $8808
    .byte $66, $a3, $20, $41, $88, $46, $94, $46, $a3, $68, $85, $95, $78, $c9, $24, $d0    // data $8818
    .byte $03, $4c, $db, $88, $20, $9d, $88, $ad, $00, $dd, $09, $08, $8d, $00, $dd, $78    // data $8828
    .byte $20, $8e, $ee, $20, $97, $ee, $20, $b3, $ee, $78, $2c, $0c, $dd, $30, $06, $20    // data $8838
    .byte $97, $ee, $4c, $44, $ed, $a5, $95, $20, $7e, $88, $24, $a3, $10, $03, $20, $9d    // data $8848
    .byte $88, $58, $18, $60, $24, $94, $30, $05, $38, $66, $94, $d0, $05, $48, $20, $41    // data $8858
    .byte $88, $68, $85, $95, $18, $60, $a9, $3f, $20, $12, $88, $4c, $03, $ee, $85, $95    // data $8868
    .byte $20, $b8, $88, $4c, $be, $ed, $20, $89, $88, $a9, $10, $2c, $0d, $dd, $f0, $fb    // data $8878
    .byte $60, $8d, $01, $dd, $ad, $0d, $dd, $ad, $00, $dd, $29, $fb, $8d, $00, $dd, $09    // data $8888
    .byte $04, $8d, $00, $dd, $60, $ad, $0c, $dd, $29, $7f, $8d, $0c, $dd, $a9, $3f, $8d    // data $8898
    .byte $02, $dd, $ad, $00, $dd, $09, $04, $8d, $00, $dd, $a9, $00, $8d, $03, $dd, $60    // data $88a8
    .byte $78, $2c, $0c, $dd, $30, $09, $20, $8e, $ee, $20, $9a, $ee, $4c, $44, $ed, $29    // data $88b8
    .byte $f0, $c9, $e0, $d0, $0b, $a9, $00, $8d, $0c, $dd, $20, $89, $88, $20, $9d, $88    // data $88c8
    .byte $58, $18, $60, $20, $ea, $88, $90, $03, $4c, $2e, $ed, $a9, $c0, $8d, $0c, $dd    // data $88d8
    .byte $58, $60, $20, $9d, $88, $ce, $03, $dd, $2c, $0c, $dd, $70, $e4, $20, $89, $88    // data $88e8
    .byte $a9, $ff, $8d, $07, $dc, $a9, $19, $8d, $0f, $dc, $ad, $0d, $dc, $ad, $0d, $dd    // data $88f8
    .byte $29, $10, $d0, $cd, $ad, $0d, $dc, $29, $02, $f0, $f2, $38, $60, $48, $a9, $00    // data $8908
    .byte $85, $90, $a9, $04, $20, $10, $88, $68, $4c, $76, $88, $48, $a9, $00, $85, $90    // data $8918
    .byte $a9, $04, $20, $b1, $ff, $68, $4c, $93, $ff, $a9, $0a, $2c, $a9, $0d, $4c, $5c    // data $8928
    .byte $88, $20, $34, $89, $a5, $93, $29, $20, $d0, $ef, $60, $24    // data $8938
bank03_api_03:
    jmp bank03_sub_94c8              // 4c c8 94
    .byte $a9, $00, $20, $a6, $8c, $b0, $35, $20, $aa, $8e, $a9, $01, $a2, $43, $a0, $89    // data $8947
    .byte $20, $bd, $ff, $a0, $00, $a6, $f9, $20, $ba, $ff, $a9, $60, $85, $b9, $20, $d5    // data $8957
    .byte $f3, $a5, $ba, $20, $b4, $ff, $a5, $b9, $20, $96, $ff, $20, $a5, $ff, $a5, $90    // data $8967
    .byte $4a, $4a, $90, $15, $20, $60, $8c, $20, $7c, $8c, $f0, $cb, $18, $24    // data $8977
bank03_sub_8985:
    sec                    // 38
    ldx #$01               // a2 01
    stx $dc0e              // 8e 0e dc
    dex                    // ca
    stx $0800              // 8e 00 08
    rts                    // 60
    .byte $20, $a5, $ff, $20, $00, $9f, $63, $80, $a9, $08, $a0, $80, $a2, $1e, $20, $00    // data $8990
    .byte $9f, $15, $80, $a9, $00, $85, $fd, $a0, $26, $85, $fb, $84, $fc, $a2, $1e, $a8    // data $89a0
    .byte $c6, $fc, $91, $fb, $c8, $d0, $fb, $ca, $d0, $f6, $20, $44, $e5, $20, $62, $83    // data $89b0
    .byte $44, $49, $53, $4b, $3a, $20, $00, $20, $e3, $8b, $20, $c3, $9f, $20, $62, $83    // data $89c0
    .byte $52, $45, $41, $44, $49, $4e, $47, $20, $44, $49, $52, $2e, $2e, $2e, $0d, $00    // data $89d0
    .byte $a2, $00, $86, $fb, $a2, $27, $bd, $00, $04, $9d, $20, $08, $a9, $a3, $20, $16    // data $89e0
    .byte $e7, $ca, $10, $f2, $20, $62, $83, $9d, $0d, $00, $4c, $0d, $8a, $20, $62, $83    // data $89f0
    .byte $4e, $2f, $41, $0d, $00, $4c, $0d, $8a, $a9, $91, $20, $16, $e7, $20, $e3, $8b    // data $8a00
    .byte $a5, $90, $f0, $03, $4c, $9f, $8a, $a0, $05, $b1, $d1, $c9, $22, $f0, $03, $4c    // data $8a10
    .byte $96, $8a, $a5, $f8, $c9, $50, $f0, $0b, $c9, $53, $f0, $07, $c9, $55, $f0, $03    // data $8a20
    .byte $4c, $fd, $89, $a5, $c3, $e4, $c3, $90, $c4, $05, $c4, $f0, $c0, $a5, $c4, $d0    // data $8a30
    .byte $bc, $a9, $0d, $20, $16, $e7, $ae, $00, $1e, $a5, $bd, $9d, $01, $1e, $a5, $f7    // data $8a40
    .byte $38, $65, $fb, $85, $fb, $aa, $90, $02, $e6, $fc, $a5, $fc, $c9, $1d, $90, $03    // data $8a50
    .byte $8a, $c9, $eb, $e6, $fd, $b0, $0c, $a5, $fd, $c9, $fe, $b0, $06, $ee, $00, $1e    // data $8a60
    .byte $4c, $08, $8a, $20, $62, $83, $0d, $0d, $2e, $2e, $2e, $20, $4d, $4f, $52, $45    // data $8a70
    .byte $20, $46, $49, $4c, $45, $53, $20, $2e, $2e, $2e, $0d, $0d, $00, $4c, $96, $8a    // data $8a80
    .byte $20, $33, $f6, $4c, $85, $89, $20, $42, $f6, $ee, $20, $d0, $4c, $99, $8a, $a2    // data $8a90
    .byte $00, $a0, $80, $20, $bd, $ff, $a9, $00, $8d, $ef, $03, $85, $02, $a5, $bb, $85    // data $8aa0
    .byte $fb, $a5, $bc, $85, $fc, $a9, $00, $85, $8b, $8d, $b0, $09, $85, $ae, $a9, $0a    // data $8ab0
    .byte $8d, $b1, $09, $85, $af, $ae, $ef, $03, $ee, $ef, $03, $bd, $f0, $03, $d0, $03    // data $8ac0
    .byte $4c, $7e, $89, $85, $fd, $85, $fe, $a5, $02, $f0, $03, $20, $70, $8e, $a9, $01    // data $8ad0
    .byte $85, $02, $20, $d6, $8b, $a6, $f9, $a0, $00, $20, $ba, $ff, $a6, $ae, $a4, $af    // data $8ae0
    .byte $86, $c3, $84, $c4, $a9, $80, $85, $9d, $0a, $85, $93, $20, $d2, $f5, $a9, $20    // data $8af0
    .byte $20, $16, $e7, $20, $c1, $f5, $06, $9d, $c6, $b7, $c6, $b7, $a9, $00, $20, $6b    // data $8b00
    .byte $8c, $e6, $b7, $e6, $b7, $90, $05, $a9, $20, $20, $62, $8c, $a6, $8b, $a5, $c3    // data $8b10
    .byte $9d, $a7, $02, $a5, $c4, $9d, $a8, $02, $a5, $ae, $9d, $b2, $09, $a5, $af, $9d    // data $8b20
    .byte $b3, $09, $e8, $e8, $86, $8b, $20, $cb, $8b, $c6, $fd, $d0, $a8, $20, $6e, $8e    // data $8b30
    .byte $a5, $fe, $85, $fd, $a6, $fb, $a4, $fc, $86, $bb, $84, $bc, $a9, $00, $85, $8b    // data $8b40
    .byte $85, $ae, $a9, $0a, $85, $af, $20, $d6, $8b, $a5, $ae, $85, $c1, $a5, $af, $85    // data $8b50
    .byte $c2, $a6, $8b, $bd, $b2, $09, $85, $ae, $bd, $a7, $02, $85, $c3, $bd, $b3, $09    // data $8b60
    .byte $85, $af, $bd, $a8, $02, $85, $c4, $e8, $e8, $86, $8b, $a5, $fa, $85, $ba, $a9    // data $8b70
    .byte $80, $85, $9d, $20, $02, $9f, $18, $80, $a5, $90, $f0, $03, $20, $60, $8c, $20    // data $8b80
    .byte $cb, $8b, $c6, $fd, $d0, $c3, $24, $8c, $30, $26, $20, $62, $83, $0d, $0d, $41    // data $8b90
    .byte $4e, $4f, $54, $48, $45, $52, $20, $4f, $55, $54, $50, $55, $54, $3f, $20, $28    // data $8ba0
    .byte $59, $2f, $4e, $29, $00, $20, $95, $8c, $d0, $06, $20, $b3, $8e, $4c, $40, $8b    // data $8bb0
    .byte $a5, $bb, $d0, $02, $c6, $bc, $c6, $bb, $4c, $ad, $8a, $a5, $b7, $18, $65, $bb    // data $8bc0
    .byte $85, $bb, $90, $02, $e6, $bc, $a0, $00, $b1, $bb, $85, $b7, $e6, $bb, $d0, $02    // data $8bd0
    .byte $e6, $bc, $60, $a0, $02, $84, $8b, $a0, $00, $84, $f8, $84, $90, $20, $a5, $ff    // data $8be0
    .byte $85, $c3, $20, $a5, $ff, $85, $c4, $a6, $90, $f0, $03, $4c, $42, $f6, $c6, $8b    // data $8bf0
    .byte $d0, $eb, $a6, $c3, $a4, $c4, $20, $cd, $bd, $a0, $01, $a9, $20, $20, $16, $e7    // data $8c00
    .byte $20, $a5, $ff, $c9, $22, $d0, $0a, $a5, $f8, $49, $ff, $85, $f8, $a9, $22, $d0    // data $8c10
    .byte $07, $a6, $f8, $f0, $03, $91, $fb, $c8, $a6, $90, $d0, $cf, $aa, $d0, $de, $a9    // data $8c20
    .byte $2c, $91, $fb, $c8, $84, $f7, $a0, $18, $b1, $d1, $09, $40, $85, $f8, $a4, $f7    // data $8c30
    .byte $91, $fb, $98, $a0, $00, $91, $fb, $a2, $fe, $86, $bf, $98, $a4, $c3, $f0, $0d    // data $8c40
    .byte $a2, $01, $18, $65, $bf, $90, $01, $e8, $88, $d0, $f7, $86, $bd, $a2, $f6, $60    // data $8c50
bank03_sub_8c60:
    lda #$0d               // a9 0d
    jsr $e716              // 20 16 e7
    jsr bank03_sub_9f02              // 20 02 9f
    bit $80                // 24 80
    rts                    // 60
    .byte $2c, $3c, $03, $30, $06, $20, $02, $9f, $15, $80, $60, $20, $02, $9f, $0f, $80    // data $8c6b
    .byte $60, $20, $62, $83, $0d, $0d, $41, $4e, $4f, $54, $48, $45, $52, $20, $44, $49    // data $8c7b
    .byte $53, $4b, $3f, $20, $28, $59, $2f, $4e, $29, $00, $20, $90, $85, $c9, $4e, $f0    // data $8c8b
    .byte $04, $c9, $59, $d0, $f5, $20, $16, $e7, $c9, $59, $60    // data $8c9b
bank03_sub_8ca6:
    pha                    // 48
    ldx #$08               // a2 08
    stx $f9                // 86 f9
    inx                    // e8
    stx $fa                // 86 fa
    stx $ba                // 86 ba
    jsr bank03_sub_9f02              // 20 02 9f
    .byte $0c    // undocumented opcode
    .byte $80    // undocumented opcode
    bne bank03_sub_8cbb              // d0 04
    dec $fa                // c6 fa
    dec $ba                // c6 ba
bank03_sub_8cbb:
    ldy #$01               // a0 01
    sty $fb                // 84 fb
    sty $fc                // 84 fc
    dey                    // 88
    pla                    // 68
    tax                    // aa
    beq bank03_sub_8cca              // f0 04
    sty $fc                // 84 fc
    sty $fb                // 84 fb
bank03_sub_8cca:
    lda $8db5,y            // b9 b5 8d
    beq bank03_sub_8ce4              // f0 15
    cmp #$ff               // c9 ff
    beq bank03_sub_8cd9              // f0 06
    jsr $e716              // 20 16 e7
bank03_sub_8cd6:
    iny                    // c8
    bne bank03_sub_8cca              // d0 f1
bank03_sub_8cd9:
    inx                    // e8
    lda $8e2b,x            // bd 2b 8e
    beq bank03_sub_8cd6              // f0 f7
    jsr $e716              // 20 16 e7
    bcc bank03_sub_8cd9              // 90 f5
bank03_sub_8ce4:
    jmp bank03_sub_8d4b              // 4c 4b 8d
bank03_sub_8ce7:
    lda #$54               // a9 54
    ldy #$05               // a0 05
    ldx #$04               // a2 04
bank03_sub_8ced:
    sta $22                // 85 22
    sty $23                // 84 23
    lda $f8,x              // b5 f8
    and #$01               // 29 01
    lsr                  // 4a
    ror                  // 6a
    eor #$80               // 49 80
    sta $24                // 85 24
    ldy #$05               // a0 05
bank03_sub_8cfd:
    lda ($22),y            // b1 22
    and #$7f               // 29 7f
    eor $24                // 45 24
    cpy #$03               // c0 03
    bcc bank03_sub_8d09              // 90 02
    eor #$80               // 49 80
bank03_sub_8d09:
    sta ($22),y            // 91 22
    dey                    // 88
    bpl bank03_sub_8cfd              // 10 ef
    ldy $23                // a4 23
    lda $22                // a5 22
    sec                    // 38
    sbc #$50               // e9 50
    bcs bank03_sub_8d18              // b0 01
    dey                    // 88
bank03_sub_8d18:
    dex                    // ca
    cpx #$02               // e0 02
    bne bank03_sub_8ced              // d0 d0
bank03_sub_8d1d:
    jsr $8590              // 20 90 85
    cmp #$20               // c9 20
    beq bank03_sub_8d79              // f0 55
    cmp #$03               // c9 03
    bne bank03_sub_8d2e              // d0 06
    pla                    // 68
    pla                    // 68
    lda #$00               // a9 00
    clc                    // 18
    rts                    // 60
bank03_sub_8d2e:
    sec                    // 38
    sbc #$85               // e9 85
    cmp #$04               // c9 04
    bcs bank03_sub_8d1d              // b0 e8
    tax                    // aa
    cpx #$02               // e0 02
    bcs bank03_sub_8d70              // b0 36
    lda $f9,x              // b5 f9
    sta $ba                // 85 ba
    txa                    // 8a
    pha                    // 48
    jsr bank03_sub_9f02              // 20 02 9f
    .byte $33    // undocumented opcode
    .byte $80    // undocumented opcode
    pla                    // 68
    tax                    // aa
    lda $ba                // a5 ba
    sta $f9,x              // 95 f9
bank03_sub_8d4b:
    ldy #$15               // a0 15
    ldx #$02               // a2 02
    clc                    // 18
    jsr $fff0              // 20 f0 ff
    ldx $f9                // a6 f9
    jsr bank03_sub_86e5              // 20 e5 86
    ldy #$15               // a0 15
    ldx #$04               // a2 04
    clc                    // 18
    jsr $fff0              // 20 f0 ff
    ldx $fa                // a6 fa
    jsr bank03_sub_86e5              // 20 e5 86
    ldy #$15               // a0 15
    ldx #$0b               // a2 0b
    clc                    // 18
    jsr $fff0              // 20 f0 ff
    jmp bank03_sub_8ce7              // 4c e7 8c
bank03_sub_8d70:
    lda #$01               // a9 01
    eor $f9,x              // 55 f9
    sta $f9,x              // 95 f9
    jmp bank03_sub_8ce7              // 4c e7 8c
bank03_sub_8d79:
    lda #$00               // a9 00
    lsr $fc                // 46 fc
    ror                  // 6a
    lsr $fb                // 46 fb
    ror                  // 6a
    sta $8c                // 85 8c
    ldx #$00               // a2 00
    stx $ba                // 86 ba
    stx $fd                // 86 fd
    inx                    // e8
bank03_sub_8d8a:
    stx $24                // 86 24
    lda $f9,x              // b5 f9
    cmp $ba                // c5 ba
    sta $ba                // 85 ba
    beq bank03_sub_8da1              // f0 0d
    jsr bank03_sub_9f02              // 20 02 9f
    .byte $0c    // undocumented opcode
    .byte $80    // undocumented opcode
    bne bank03_sub_8da1              // d0 06
    pla                    // 68
    pla                    // 68
    lda #$05               // a9 05
    sec                    // 38
    rts                    // 60
bank03_sub_8da1:
    lda $1f                // a5 1f
    eor $fd                // 45 fd
    sta $fd                // 85 fd
    ldx $24                // a6 24
    dex                    // ca
    bpl bank03_sub_8d8a              // 10 de
    clc                    // 18
    lda $1f                // a5 1f
    sta $033c              // 8d 3c 03
    lda $fd                // a5 fd
    rts                    // 60
    .byte $93, $20, $ff, $20, $43, $4f, $50, $59, $0d, $0d, $20, $46, $31, $2e, $20, $53    // data $8db5
    .byte $4f, $55, $52, $43, $45, $20, $44, $45, $56, $49, $43, $45, $3a, $20, $12, $20    // data $8dc5
    .byte $30, $38, $20, $0d, $0d, $20, $46, $33, $2e, $20, $54, $41, $52, $47, $45, $54    // data $8dd5
    .byte $20, $44, $45, $56, $49, $43, $45, $3a, $20, $12, $20, $30, $38, $20, $0d, $0d    // data $8de5
    .byte $20, $46, $35, $2e, $20, $ff, $3a, $20, $59, $45, $53, $20, $4e, $4f, $0d, $0d    // data $8df5
    .byte $20, $46, $37, $2e, $20, $ff, $3a, $20, $59, $45, $53, $20, $4e, $4f, $0d, $0d    // data $8e05
    .byte $20, $50, $52, $45, $53, $53, $20, $53, $50, $41, $43, $45, $20, $54, $4f, $20    // data $8e15
    .byte $53, $54, $41, $52, $54, $0d, $00, $46, $49, $4c, $45, $00, $4d, $55, $4c, $54    // data $8e25
    .byte $49, $20, $4f, $55, $54, $50, $55, $54, $20, $00, $52, $45, $50, $4c, $41, $43    // data $8e35
    .byte $45, $20, $46, $49, $4c, $45, $53, $00, $44, $49, $53, $4b, $00, $49, $47, $4e    // data $8e45
    .byte $4f, $52, $45, $20, $45, $52, $52, $4f, $52, $53, $00, $42, $41, $4d, $20, $43    // data $8e55
    .byte $4f, $50, $59, $20, $20, $20, $20, $20, $00    // data $8e65
bank03_sub_8e6e:
    sec                    // 38
    bit $18                // 24 18
    lda $f9                // a5 f9
    eor $fa                // 45 fa
    bne bank03_sub_8edc              // d0 65
    bcs bank03_api_14              // b0 3a
    jsr bank03_api_13              // 20 7f 8e
    jmp bank03_sub_8ec6              // 4c c6 8e
bank03_api_13:
    lda $f9                // a5 f9
bank03_sub_8e81:
    pha                    // 48
    jsr bank03_sub_8362              // 20 62 83
    ora $4e49              // 0d 49 4e
    .byte $53    // undocumented opcode
    eor $52                // 45 52
    .byte $54    // undocumented opcode
    jsr $4f53              // 20 53 4f
    eor $52,x              // 55 52
    .byte $43    // undocumented opcode
    eor $20                // 45 20
    .byte $44    // undocumented opcode
    eor #$53               // 49 53
    .byte $4b    // undocumented opcode
    jsr $4e49              // 20 49 4e
    jsr $5244              // 20 44 52
    eor #$56               // 49 56
    eor $20                // 45 20
    brk                    // 00
    .byte $68, $aa, $a9, $00, $4c, $cd, $bd    // data $8ea3
bank03_sub_8eaa:
    jsr bank03_api_13              // 20 7f 8e
    lda $fa                // a5 fa
    cmp $f9                // c5 f9
    beq bank03_sub_8ec6              // f0 13
bank03_api_14:
    lda $fa                // a5 fa
    jsr bank03_sub_8e81              // 20 81 8e
    lda #$07               // a9 07
    sta $d3                // 85 d3
    jsr bank03_sub_8362              // 20 62 83
    .byte $54    // undocumented opcode
    eor ($52,x)            // 41 52
    .byte $47    // undocumented opcode
    eor $54                // 45 54
    brk                    // 00
bank03_sub_8ec6:
    jsr bank03_sub_8362              // 20 62 83
    ora $523c              // 0d 3c 52
    eor $54                // 45 54
    eor $52,x              // 55 52
    lsr.a $003e              // 4e 3e 00
bank03_sub_8ed3:
    jsr $8590              // 20 90 85
    bcs bank03_sub_8edd              // b0 05
    cmp #$0d               // c9 0d
    bne bank03_sub_8ed3              // d0 f7
bank03_sub_8edc:
    rts                    // 60
bank03_sub_8edd:
    pla                    // 68
    pla                    // 68
    jmp bank03_sub_8985              // 4c 85 89
bank03_api_15:
    lda #$21               // a9 21
    jsr bank03_sub_8ca6              // 20 a6 8c
    bne bank03_sub_8ef1              // d0 08
    lda $1f                // a5 1f
    beq bank03_sub_8f12              // f0 25
    and #$20               // 29 20
    bne bank03_sub_8f15              // d0 24
bank03_sub_8ef1:
    jsr bank03_sub_8362              // 20 62 83
    ora $4944              // 0d 44 49
    .byte $53    // undocumented opcode
    .byte $4b    // undocumented opcode
    .byte $43    // undocumented opcode
    .byte $4f    // undocumented opcode
    bvc bank03_sub_8f56              // 50 59
    jsr $5349              // 20 49 53
    jsr $3531              // 20 31 35
    .byte $34    // undocumented opcode
    and ($20),y            // 31 20
    .byte $4f    // undocumented opcode
    lsr $594c              // 4e 4c 59
    rol $2e2e              // 2e 2e 2e
    ora $4c00              // 0d 00 4c
    .byte $83    // undocumented opcode
    .byte $89    // undocumented opcode
bank03_sub_8f12:
    jmp bank03_sub_8c60              // 4c 60 8c
bank03_sub_8f15:
    jsr bank03_sub_8eaa              // 20 aa 8e
    lda $f9                // a5 f9
    sta $ba                // 85 ba
    lda #$00               // a9 00
    sta $fd                // 85 fd
    lda #$0e               // a9 0e
    sta $fe                // 85 fe
    jsr bank03_sub_8fbd              // 20 bd 8f
    ldy #$00               // a0 00
    ldx #$01               // a2 01
bank03_sub_8f2b:
    stx $10                // 86 10
    bit $8c                // 24 8c
    bvs bank03_sub_8f46              // 70 15
    sty $24                // 84 24
    jsr bank03_sub_9f02              // 20 02 9f
    ora #$80               // 09 80
    lda $10                // a5 10
    asl                  // 0a
    asl                  // 0a
    tay                    // a8
    lda $0e00,y            // b9 00 0e
    ldy $24                // a4 24
    cmp $13                // c5 13
    beq bank03_sub_8f4c              // f0 06
bank03_sub_8f46:
    iny                    // c8
    lda $10                // a5 10
    sta $0352,y            // 99 52 03
bank03_sub_8f4c:
    ldx $10                // a6 10
    inx                    // e8
    cpx $f8                // e4 f8
    bne bank03_sub_8f2b              // d0 d8
    iny                    // c8
    lda #$ff               // a9 ff
bank03_sub_8f56:
    sta $0352,y            // 99 52 03
    lda #$00               // a9 00
    sta $51                // 85 51
    sta $0352              // 8d 52 03
    inc $51                // e6 51
    jsr bank03_sub_9f02              // 20 02 9f
    rol                  // 2a
    .byte $80    // undocumented opcode
    clc                    // 18
    lda $f9                // a5 f9
    jsr bank03_sub_8f9f              // 20 9f 8f
    jsr bank03_sub_8e6e              // 20 6e 8e
    jsr bank03_sub_9f02              // 20 02 9f
    brk                    // 00
    .byte $08, $a5, $50, $48, $24, $8c, $10, $06, $38, $a5, $fa, $20, $9f, $8f, $68, $aa    // data $8f74
    .byte $bd, $52, $03, $30, $08, $86, $51, $20, $70, $8e, $4c, $67, $8f, $20, $ae, $ff    // data $8f84
    .byte $20, $7c, $8c, $d0, $03, $4c, $15, $8f, $4c, $83, $89    // data $8f94
bank03_sub_8f9f:
    sta $ba                // 85 ba
    jsr bank03_sub_9f02              // 20 02 9f
    sta $2408,x            // 9d 08 24
    sty $3110              // 8c 10 31
    jsr bank03_sub_8362              // 20 62 83
    ora $5245              // 0d 45 52
    .byte $52    // undocumented opcode
    .byte $4f    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $53    // undocumented opcode
    .byte $3a    // undocumented opcode
    brk                    // 00
    .byte $a6, $fe, $a9, $00, $4c, $cd, $bd    // data $8fb6
bank03_sub_8fbd:
    jsr bank03_sub_9f02              // 20 02 9f
    .byte $0c    // undocumented opcode
    .byte $80    // undocumented opcode
    beq bank03_sub_8fd8              // f0 14
    lda #$24               // a9 24
    sta $f8                // 85 f8
    ldx #$0e               // a2 0e
    lda #$12               // a9 12
    ldy #$00               // a0 00
    jsr bank03_sub_9f01              // 20 01 9f
    .byte $27    // undocumented opcode
    .byte $80    // undocumented opcode
    jsr bank03_sub_8c60              // 20 60 8c
    bcc bank03_sub_8fdb              // 90 03
bank03_sub_8fd8:
    jmp bank03_sub_8edd              // 4c dd 8e
bank03_sub_8fdb:
    rts                    // 60
bank03_api_24:
    jsr bank03_sub_8362              // 20 62 83
    ora $2f52              // 0d 52 2f
    .byte $53    // undocumented opcode
    jsr $202d              // 20 2d 20
    eor ($42,x)            // 41 42
    .byte $4f    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $54    // undocumented opcode
    ora $5f20              // 0d 20 5f
    jsr $2d20              // 20 20 2d
    jsr $4153              // 20 53 41
    lsr $45,x              // 56 45
    jsr $5543              // 20 43 55
    .byte $52    // undocumented opcode
    .byte $52    // undocumented opcode
    eor $4e                // 45 4e
    .byte $54    // undocumented opcode
    jsr $4f4d              // 20 4d 4f
    .byte $44    // undocumented opcode
    eor $0d                // 45 0d
    .byte $53    // undocumented opcode
    bvc bank03_sub_904a              // 50 43
    jsr $202d              // 20 2d 20
    .byte $54    // undocumented opcode
    .byte $4f    // undocumented opcode
    .byte $47    // undocumented opcode
    .byte $47    // undocumented opcode
    jmp $2045              // 4c 45 20
    .byte $4d, $4f, $44, $45, $53, $0d, $43, $42, $4d, $20, $2d, $20, $54, $4f, $47, $47    // data $9011
    .byte $4c, $45, $20, $49, $4e, $54, $45, $52, $4c, $41, $43, $45, $0d, $20, $31, $20    // data $9021
    .byte $20, $2d, $20, $43, $48, $41, $4e, $47, $45, $20, $42, $47, $20, $43, $4f, $4c    // data $9031
    .byte $4f, $52, $0d, $0d, $2d, $20, $50, $52, $45    // data $9041
bank03_sub_904a:
    .byte $53    // undocumented opcode
    .byte $53    // undocumented opcode
    jsr $5053              // 20 53 50
    eor ($43,x)            // 41 43
    eor $20                // 45 20
    .byte $54    // undocumented opcode
    .byte $4f    // undocumented opcode
    jsr $5453              // 20 53 54
    eor ($52,x)            // 41 52
    .byte $54    // undocumented opcode
    jsr $002d              // 20 2d 00
    rts                    // 60
bank03_api_20:
    jsr bank03_sub_8362              // 20 62 83
    ora $200d              // 0d 0d 20
    eor ($2d,x)            // 41 2d
    .byte $4b    // undocumented opcode
    .byte $4f    // undocumented opcode
    eor ($4c,x)            // 41 4c
    eor ($20,x)            // 41 20
    bvc bank03_sub_90b8              // 50 49
    .byte $43    // undocumented opcode
    .byte $54    // undocumented opcode
    eor $52,x              // 55 52
    eor $0d                // 45 0d
    jsr $2d42              // 20 42 2d
    .byte $42    // undocumented opcode
    eor #$54               // 49 54
    eor $5041              // 4d 41 50
    ora $4320              // 0d 20 43
    and $4843              // 2d 43 48
    eor ($52,x)            // 41 52
    .byte $53    // undocumented opcode
    eor $54                // 45 54
    ora $4420              // 0d 20 44
    and $4353              // 2d 53 43
    .byte $52    // undocumented opcode
    eor $45                // 45 45
    lsr $4152              // 4e 52 41
    eor $200d              // 4d 0d 20
    eor $2d                // 45 2d
    .byte $43    // undocumented opcode
    .byte $4f    // undocumented opcode
    jmp $524f              // 4c 4f 52
    .byte $52, $41, $4d, $0d, $20, $46, $2d, $46, $4c, $49, $2f, $49, $46, $4c, $49, $20    // data $909f
    .byte $50, $49, $43, $54, $55, $52, $45, $0d, $20    // data $90af
bank03_sub_90b8:
    .byte $47    // undocumented opcode
    and $454d              // 2d 4d 45
    eor $524f              // 4d 4f 52
    eor $4120,y            // 59 20 41
    .byte $52    // undocumented opcode
    eor $41                // 45 41
    ora $6000              // 0d 00 60
bank03_api_00:
    jsr bank03_api_07              // 20 f6 90
    tya                    // 98
bank03_sub_90cc:
    sta $0255,y            // 99 55 02
    iny                    // c8
    cpy #$52               // c0 52
    bne bank03_sub_90cc              // d0 f8
    ldx #$02               // a2 02
bank03_sub_90d6:
    sta $00,x              // 95 00
    inx                    // e8
    bne bank03_sub_90d6              // d0 fb
    lda #$64               // a9 64
    sta $0255              // 8d 55 02
    lda #$0a               // a9 0a
    sta $0257              // 8d 57 02
    lda #$3c               // a9 3c
    sta $b2                // 85 b2
    lda #$03               // a9 03
    sta $b3                // 85 b3
    ldy #$a0               // a0 a0
    jsr $fd8d              // 20 8d fd
    asl                  // 0a
    sta $ba                // 85 ba
    rts                    // 60
bank03_api_07:
    ldy #$20               // a0 20
bank03_sub_90f8:
    lda $fd2f,y            // b9 2f fd
    sta $0313,y            // 99 13 03
    dey                    // 88
    bne bank03_sub_90f8              // d0 f7
    rts                    // 60
bank03_api_10:
    sei                    // 78
    cld                    // d8
    lda #$00               // a9 00
    sta $d016              // 8d 16 d0
    ldx #$a7               // a2 a7
bank03_sub_910b:
    sta $0200,x            // 9d 00 02
    inx                    // e8
    bne bank03_sub_910b              // d0 fa
bank03_sub_9111:
    sta $0300,x            // 9d 00 03
    inx                    // e8
    bne bank03_sub_9111              // d0 fa
    jsr bank03_api_00              // 20 c8 90
    jsr $fda3              // 20 a3 fd
    jsr $ff5b              // 20 5b ff
    inc $c5                // e6 c5
    ldx #$29               // a2 29
bank03_sub_9124:
    lda $9130,x            // bd 30 91
    sta $0210,x            // 9d 10 02
    dex                    // ca
    bpl bank03_sub_9124              // 10 f7
    jmp $0210              // 4c 10 02
    .byte $a9, $0e, $8d, $00, $de, $58, $20, $53, $e4, $a2, $03, $bd, $00, $08, $9d, $0a    // data $9130
    .byte $02, $ca, $10, $f7, $20, $bf, $e3, $20, $22, $e4, $a2, $03, $bd, $0a, $02, $9d    // data $9140
    .byte $00, $08, $ca, $10, $f7, $68, $4c, $86, $e3    // data $9150
bank03_api_17:
    jsr $a57c              // 20 7c a5
    jsr bank03_sub_920b              // 20 0b 92
    lda #$ff               // a9 ff
    sta $52                // 85 52
    sta $53                // 85 53
    ldy #$00               // a0 00
    lda $2b                // a5 2b
    sta $20                // 85 20
    lda $2c                // a5 2c
    sta $21                // 85 21
    jmp bank03_sub_919b              // 4c 9b 91
bank03_sub_9172:
    lda ($7a),y            // b1 7a
    beq bank03_sub_91bc              // f0 46
    lda ($20),y            // b1 20
    beq bank03_sub_9183              // f0 09
    lda ($7a),y            // b1 7a
    cmp ($20),y            // d1 20
    bne bank03_sub_9183              // d0 03
    iny                    // c8
    bne bank03_sub_9172              // d0 ef
bank03_sub_9183:
    jsr bank03_sub_9212              // 20 12 92
    ldy #$00               // a0 00
    lda ($20),y            // b1 20
    bne bank03_sub_9172              // d0 e6
    jsr bank03_sub_9212              // 20 12 92
    ldy #$00               // a0 00
    sty $ae                // 84 ae
    lda ($20),y            // b1 20
    bne bank03_sub_919b              // d0 04
    lda #$01               // a9 01
    sta $ae                // 85 ae
bank03_sub_919b:
    jsr bank03_sub_9212              // 20 12 92
    lda ($20),y            // b1 20
    bne bank03_sub_91a9              // d0 07
    lda $ae                // a5 ae
    cmp #$01               // c9 01
    bne bank03_sub_91a9              // d0 01
    rts                    // 60
bank03_sub_91a9:
    jsr bank03_sub_9212              // 20 12 92
    lda ($20),y            // b1 20
    sta $50                // 85 50
    jsr bank03_sub_9212              // 20 12 92
    lda ($20),y            // b1 20
    sta $51                // 85 51
    jsr bank03_sub_9212              // 20 12 92
    bne bank03_sub_9172              // d0 b6
bank03_sub_91bc:
    lda $50                // a5 50
    cmp $52                // c5 52
    bne bank03_sub_91c8              // d0 06
    lda $51                // a5 51
    cmp $53                // c5 53
    beq bank03_sub_9183              // f0 bb
bank03_sub_91c8:
    lda $50                // a5 50
    sta $52                // 85 52
    sta $63                // 85 63
    lda $51                // a5 51
    sta $62                // 85 62
    sta $53                // 85 53
    ldx #$90               // a2 90
    sec                    // 38
    jsr $bc49              // 20 49 bc
    jsr $bddf              // 20 df bd
    jsr bank03_sub_91fd              // 20 fd 91
    sec                    // 38
    jsr $fff0              // 20 f0 ff
    tya                    // 98
bank03_sub_91e5:
    sbc #$0a               // e9 0a
    bcs bank03_sub_91e5              // b0 fc
    eor #$ff               // 49 ff
    adc #$01               // 69 01
    tax                    // aa
    inx                    // e8
bank03_sub_91ef:
    dex                    // ca
    bne bank03_sub_91f5              // d0 03
    jmp bank03_sub_9183              // 4c 83 91
bank03_sub_91f5:
    lda #$20               // a9 20
    jsr $ffd2              // 20 d2 ff
    jmp bank03_sub_91ef              // 4c ef 91
bank03_sub_91fd:
    ldx #$00               // a2 00
bank03_sub_91ff:
    lda $0100,x            // bd 00 01
    beq bank03_sub_920a              // f0 06
    jsr $ffd2              // 20 d2 ff
    inx                    // e8
    bne bank03_sub_91ff              // d0 f5
bank03_sub_920a:
    rts                    // 60
bank03_sub_920b:
    inc $7a                // e6 7a
    bne bank03_sub_9211              // d0 02
    inc $7b                // e6 7b
bank03_sub_9211:
    rts                    // 60
bank03_sub_9212:
    inc $20                // e6 20
    bne bank03_sub_9218              // d0 02
    inc $21                // e6 21
bank03_sub_9218:
    rts                    // 60
bank03_api_16:
    lda #$00               // a9 00
    sta $51                // 85 51
    sta $52                // 85 52
    lda #$ff               // a9 ff
    sta $3d                // 85 3d
    bne bank03_sub_922b              // d0 06
    lda $14                // a5 14
    sta $3d                // 85 3d
    lda $15                // a5 15
bank03_sub_922b:
    sta $3e                // 85 3e
    sei                    // 78
    jsr $a68e              // 20 8e a6
bank03_sub_9231:
    ldy #$02               // a0 02
    lda ($7a),y            // b1 7a
    bne bank03_sub_923a              // d0 03
    jmp bank03_sub_938e              // 4c 8e 93
bank03_sub_923a:
    ldy #$04               // a0 04
    jsr $a8fb              // 20 fb a8
bank03_sub_923f:
    jsr $0073              // 20 73 00
bank03_sub_9242:
    jsr bank03_sub_93f5              // 20 f5 93
    cmp #$00               // c9 00
    beq bank03_sub_9231              // f0 e8
    cmp #$cb               // c9 cb
    beq bank03_sub_926c              // f0 1f
    cmp #$89               // c9 89
    beq bank03_sub_9273              // f0 22
    cmp #$8d               // c9 8d
    beq bank03_sub_9273              // f0 1e
    cmp #$a7               // c9 a7
    beq bank03_sub_9261              // f0 08
    cmp #$8a               // c9 8a
    beq bank03_sub_9261              // f0 04
    cmp #$9b               // c9 9b
    bne bank03_sub_923f              // d0 de
bank03_sub_9261:
    jsr $0073              // 20 73 00
    bcc bank03_sub_9276              // 90 10
bank03_sub_9266:
    cmp #$ab               // c9 ab
    beq bank03_sub_9273              // f0 09
    bne bank03_sub_9242              // d0 d6
bank03_sub_926c:
    jsr $0073              // 20 73 00
    cmp #$a4               // c9 a4
    bne bank03_sub_923f              // d0 cc
bank03_sub_9273:
    jsr $0073              // 20 73 00
bank03_sub_9276:
    ldx $7a                // a6 7a
    stx $8d                // 86 8d
    ldx $7b                // a6 7b
    stx $8e                // 86 8e
    jsr $a96b              // 20 6b a9
    lda $14                // a5 14
    sta $fb                // 85 fb
    lda $15                // a5 15
    sta $fc                // 85 fc
    jsr bank03_sub_9295              // 20 95 92
    jsr $0079              // 20 79 00
    cmp #$2c               // c9 2c
    beq bank03_sub_9273              // f0 e0
    bne bank03_sub_9266              // d0 d1
bank03_sub_9295:
    jsr bank03_sub_93e2              // 20 e2 93
bank03_sub_9298:
    ldy #$01               // a0 01
    lda ($5f),y            // b1 5f
    beq bank03_sub_92cc              // f0 2e
    iny                    // c8
    jsr bank03_sub_9411              // 20 11 94
    cmp $3e                // c5 3e
    bne bank03_sub_92aa              // d0 04
    cpx $3d                // e4 3d
    beq bank03_sub_92ac              // f0 02
bank03_sub_92aa:
    bcs bank03_sub_92cc              // b0 20
bank03_sub_92ac:
    cmp $fc                // c5 fc
    bne bank03_sub_92b4              // d0 04
    cpx $fb                // e4 fb
    beq bank03_sub_92cd              // f0 19
bank03_sub_92b4:
    bcs bank03_sub_92cc              // b0 16
    lda $02                // a5 02
    adc $8b                // 65 8b
    sta $8b                // 85 8b
    bcc bank03_sub_92c0              // 90 02
    inc $8c                // e6 8c
bank03_sub_92c0:
    ldy #$00               // a0 00
    jsr bank03_sub_9411              // 20 11 94
    stx $5f                // 86 5f
    sta $60                // 85 60
    jmp bank03_sub_9298              // 4c 98 92
bank03_sub_92cc:
    rts                    // 60
bank03_sub_92cd:
    lda $8b                // a5 8b
    sta $63                // 85 63
    lda $8c                // a5 8c
    sta $62                // 85 62
    ldx #$90               // a2 90
    sec                    // 38
    jsr $bc49              // 20 49 bc
    jsr $bddf              // 20 df bd
    ldy #$ff               // a0 ff
bank03_sub_92e0:
    iny                    // c8
    lda $0100,y            // b9 00 01
    bne bank03_sub_92e0              // d0 fa
    sty $8f                // 84 8f
    lda $7a                // a5 7a
    sec                    // 38
    sbc $8d                // e5 8d
    sec                    // 38
    sbc $8f                // e5 8f
    bne bank03_sub_92f5              // d0 03
    jmp bank03_sub_9372              // 4c 72 93
bank03_sub_92f5:
    bcc bank03_sub_9341              // 90 4a
    sta $ab                // 85 ab
    lda $7a                // a5 7a
    sta $3b                // 85 3b
    sbc $ab                // e5 ab
    sta $39                // 85 39
    lda $7b                // a5 7b
    sta $3c                // 85 3c
    sbc #$00               // e9 00
    sta $3a                // 85 3a
    pha                    // 48
    sec                    // 38
    lda $2d                // a5 2d
    sbc $7a                // e5 7a
    sta $a9                // 85 a9
    lda $2e                // a5 2e
    sbc $7b                // e5 7b
    sta $aa                // 85 aa
    ldy #$00               // a0 00
    ldx $aa                // a6 aa
    beq bank03_sub_932b              // f0 0e
bank03_sub_931d:
    lda ($3b),y            // b1 3b
    sta ($39),y            // 91 39
    iny                    // c8
    bne bank03_sub_931d              // d0 f9
    inc $3c                // e6 3c
    inc $3a                // e6 3a
    dex                    // ca
    bne bank03_sub_931d              // d0 f2
bank03_sub_932b:
    ldx $a9                // a6 a9
    beq bank03_sub_9337              // f0 08
bank03_sub_932f:
    lda ($3b),y            // b1 3b
    sta ($39),y            // 91 39
    iny                    // c8
    dex                    // ca
    bne bank03_sub_932f              // d0 f8
bank03_sub_9337:
    lda $39                // a5 39
    sta $7a                // 85 7a
    pla                    // 68
    sta $7b                // 85 7b
    jmp bank03_sub_9372              // 4c 72 93
bank03_sub_9341:
    sec                    // 38
    sta $ab                // 85 ab
    lda #$00               // a9 00
    sbc $ab                // e5 ab
    sta $ab                // 85 ab
    adc $2d                // 65 2d
    sta $58                // 85 58
    lda $2e                // a5 2e
    sta $5b                // 85 5b
    adc #$00               // 69 00
    sta $59                // 85 59
    lda $2d                // a5 2d
    sta $5a                // 85 5a
    lda $7a                // a5 7a
    sta $5f                // 85 5f
    clc                    // 18
    adc $ab                // 65 ab
    pha                    // 48
    lda $7b                // a5 7b
    sta $60                // 85 60
    adc #$00               // 69 00
    pha                    // 48
    jsr $a3bf              // 20 bf a3
    pla                    // 68
    sta $7b                // 85 7b
    pla                    // 68
    sta $7a                // 85 7a
bank03_sub_9372:
    ldy $8f                // a4 8f
    dey                    // 88
bank03_sub_9375:
    lda $0100,y            // b9 00 01
    sta ($8d),y            // 91 8d
    dey                    // 88
    bpl bank03_sub_9375              // 10 f8
    jsr $a533              // 20 33 a5
    lda $22                // a5 22
    clc                    // 18
    adc #$02               // 69 02
    sta $2d                // 85 2d
    lda $23                // a5 23
    adc #$00               // 69 00
    sta $2e                // 85 2e
    rts                    // 60
bank03_sub_938e:
    jsr bank03_sub_93e2              // 20 e2 93
bank03_sub_9391:
    ldy #$01               // a0 01
    lda ($5f),y            // b1 5f
    bne bank03_sub_93b6              // d0 1f
bank03_sub_9397:
    lda $37                // a5 37
    ldy $38                // a4 38
    sta $33                // 85 33
    sty $34                // 84 34
    lda $2d                // a5 2d
    ldy $2e                // a4 2e
    sta $2f                // 85 2f
    sty $30                // 84 30
    sta $31                // 85 31
    sty $32                // 84 32
    jsr $a81d              // 20 1d a8
    ldx #$19               // a2 19
    stx $16                // 86 16
    jmp $a687              // 4c 87 a6
    .byte $60    // data $93b5
bank03_sub_93b6:
    iny                    // c8
    jsr bank03_sub_9411              // 20 11 94
    cmp $3e                // c5 3e
    bne bank03_sub_93c2              // d0 04
    cpx $3d                // e4 3d
    beq bank03_sub_93c4              // f0 02
bank03_sub_93c2:
    bcs bank03_sub_9397              // b0 d3
bank03_sub_93c4:
    lda $8c                // a5 8c
    sta ($5f),y            // 91 5f
    dey                    // 88
    lda $8b                // a5 8b
    sta ($5f),y            // 91 5f
    clc                    // 18
    adc $02                // 65 02
    sta $8b                // 85 8b
    bcc bank03_sub_93d6              // 90 02
    inc $8c                // e6 8c
bank03_sub_93d6:
    ldy #$00               // a0 00
    jsr bank03_sub_9411              // 20 11 94
    stx $5f                // 86 5f
    sta $60                // 85 60
    jmp bank03_sub_9391              // 4c 91 93
bank03_sub_93e2:
    lda $fd                // a5 fd
    sta $8b                // 85 8b
    lda $fe                // a5 fe
    sta $8c                // 85 8c
    lda $51                // a5 51
    sta $14                // 85 14
    lda $52                // a5 52
    sta $15                // 85 15
    jmp $a613              // 4c 13 a6
bank03_sub_93f5:
    cmp #$8f               // c9 8f
    beq $9404              // f0 0b
    cmp #$22               // c9 22
    beq bank03_sub_9406              // f0 09
    cmp #$83               // c9 83
    bne bank03_sub_9410              // d0 0f
    lda #$3a               // a9 3a
    bit.a $00a9              // 2c a9 00
bank03_sub_9406:
    tax                    // aa
    jsr $a90b              // 20 0b a9
    jsr $a8fb              // 20 fb a8
    jsr $0079              // 20 79 00
bank03_sub_9410:
    rts                    // 60
bank03_sub_9411:
    lda ($5f),y            // b1 5f
    tax                    // aa
    iny                    // c8
    lda ($5f),y            // b1 5f
    rts                    // 60
bank03_api_31:
    ldy #$01               // a0 01
    tya                    // 98
    sta ($2b),y            // 91 2b
    jsr bank03_api_23              // 20 58 9f
    lda $22                // a5 22
    ldy $23                // a4 23
    clc                    // 18
    adc #$02               // 69 02
    bcc bank03_sub_942a              // 90 01
    iny                    // c8
bank03_sub_942a:
    sta $2d                // 85 2d
    sty $2e                // 84 2e
    rts                    // 60
bank03_api_28:
    jsr bank03_api_29              // 20 73 94
    tya                    // 98
    ldy #$01               // a0 01
    sta ($c1),y            // 91 c1
    txa                    // 8a
    dey                    // 88
    sta ($c1),y            // 91 c1
    sty $0200              // 8c 00 02
    lda $c1                // a5 c1
    sta $5f                // 85 5f
    lda $c2                // a5 c2
    sta $60                // 85 60
    lda $0302              // ad 02 03
    sta $c1                // 85 c1
    lda $0303              // ad 03 03
    sta $c2                // 85 c2
    rts                    // 60
bank03_api_30:
    lda $c2                // a5 c2
    sta $0303              // 8d 03 03
    lda $c1                // a5 c1
    sta $0302              // 8d 02 03
    lda #$08               // a9 08
    ldy #$01               // a0 01
    sta ($2b),y            // 91 2b
    jsr bank03_api_23              // 20 58 9f
    lda $22                // a5 22
    ldy $23                // a4 23
    clc                    // 18
    adc #$02               // 69 02
    bcc bank03_sub_946e              // 90 01
    iny                    // c8
bank03_sub_946e:
    sta $2d                // 85 2d
    sty $2e                // 84 2e
    rts                    // 60
bank03_api_29:
    bcs bank03_sub_94c2              // b0 4d
    jsr $a96b              // 20 6b a9
    jsr $a613              // 20 13 a6
    ldx $5f                // a6 5f
    ldy $60                // a4 60
    stx $c1                // 86 c1
    sty $c2                // 84 c2
    jsr $0079              // 20 79 00
    cmp #$2d               // c9 2d
    bne bank03_sub_94c2              // d0 38
    jsr $0073              // 20 73 00
    bne bank03_sub_94a0              // d0 11
    lda $2d                // a5 2d
    sec                    // 38
    sbc #$02               // e9 02
    tax                    // aa
    sta $5f                // 85 5f
    lda $2e                // a5 2e
    sbc #$00               // e9 00
    tay                    // a8
    sta $60                // 85 60
    bne bank03_sub_94b7              // d0 17
bank03_sub_94a0:
    jsr $a96b              // 20 6b a9
    bne bank03_sub_94c2              // d0 1d
    jsr $a613              // 20 13 a6
    ldx $5f                // a6 5f
    ldy $60                // a4 60
    bcc bank03_sub_94b7              // 90 09
    ldy #$00               // a0 00
    lda ($5f),y            // b1 5f
    tax                    // aa
    iny                    // c8
    lda ($5f),y            // b1 5f
    tay                    // a8
bank03_sub_94b7:
    lda $c1                // a5 c1
    cmp $5f                // c5 5f
    lda $c2                // a5 c2
    sbc $60                // e5 60
    bcs bank03_sub_94c2              // b0 01
    rts                    // 60
bank03_sub_94c2:
    jmp $af08              // 4c 08 af
bank03_api_22:
    jsr $e544              // 20 44 e5
bank03_sub_94c8:
    jsr bank03_sub_8362              // 20 62 83
    .byte $43    // undocumented opcode
    eor $52,x              // 55 52
    .byte $52    // undocumented opcode
    eor $4e                // 45 4e
    .byte $54    // undocumented opcode
    jmp $2059              // 4c 59 20
    .byte $4f, $55, $54, $20, $4f, $46, $20, $4f, $52, $44, $45, $52, $2e, $2e, $2e, $0d    // data $94d5
    .byte $0d, $0d, $00, $4c, $7f, $85    // data $94e5
bank03_api_06:
    jsr $e544              // 20 44 e5
    jsr bank03_sub_8362              // 20 62 83
    eor $554f,y            // 59 4f 55
    jsr $4957              // 20 57 49
    .byte $53    // undocumented opcode
    pha                    // 48
    jsr $2e2e              // 20 2e 2e
    rol.a $000d              // 2e 0d 00
    jmp bank03_api_18              // 4c 7f 85
bank03_api_25:
    jsr bank03_sub_8362              // 20 62 83
    ora $0d0d              // 0d 0d 0d
    ora ($46,x)            // 01 46
    and ($2a),y            // 31 2a
    .byte $43    // undocumented opcode
    .byte $4f    // undocumented opcode
    lsr $4946              // 4e 46 49
    .byte $47    // undocumented opcode
    eor $52,x              // 55 52
    eor $20                // 45 20
    eor $4d45              // 4d 45 4d
    .byte $4f    // undocumented opcode
    .byte $52    // undocumented opcode
    eor $010d,y            // 59 0d 01
    lsr $33                // 46 33
    rol                  // 2a
    lsr $524f              // 4e 4f 52
    eor $4c41              // 4d 41 4c
    jsr $4552              // 20 52 45
    .byte $53    // undocumented opcode
    eor $54                // 45 54
    ora $4601              // 0d 01 46
    and $2a,x              // 35 2a
    eor $54,x              // 55 54
    eor #$4c               // 49 4c
    eor #$54               // 49 54
    eor #$45               // 49 45
    .byte $53    // undocumented opcode
    ora $4601              // 0d 01 46
    .byte $37    // undocumented opcode
    rol                  // 2a
    eor #$4e               // 49 4e
    .byte $53    // undocumented opcode
    .byte $54    // undocumented opcode
    eor ($4c,x)            // 41 4c
    jmp $4620              // 4c 20 46
    .byte $41, $53, $54, $4c, $4f, $41, $44, $00, $2c, $01, $de, $50, $28, $20, $62, $83    // data $9549
    .byte $0d, $0d, $0d, $0d, $20, $20, $20, $20, $20, $20, $20, $52, $45, $55, $20, $43    // data $9559
    .byte $4f, $4d, $50, $41, $54, $49, $42, $49, $4c, $49, $54, $59, $20, $45, $4e, $41    // data $9569
    .byte $42, $4c, $45, $44, $00, $20, $62, $83, $0d, $0d, $20, $20, $20, $20, $53, $49    // data $9579
    .byte $4c, $56, $45, $52, $53, $55, $52, $46, $45, $52, $20, $00, $ad, $01, $de, $09    // data $9589
    .byte $01, $8d, $01, $de, $a9, $ff, $8d, $0f, $de, $ad, $0f, $de, $c9, $ff, $d0, $16    // data $9599
    .byte $20, $62, $83, $46, $4f, $55, $4e, $44, $20, $2d, $20, $45, $4e, $41, $42, $4c    // data $95a9
    .byte $45, $44, $00, $4c, $d7, $95, $20, $62, $83, $4e, $4f, $54, $20, $46, $4f, $55    // data $95b9
    .byte $4e, $44, $20, $2d, $20, $44, $49, $53, $41, $42, $4c, $45, $44, $00, $ad, $01    // data $95c9
    .byte $de, $29, $fe, $8d, $01, $de, $a2, $18, $a0, $00, $20, $76, $85, $ad, $a6, $02    // data $95d9
    .byte $f0, $0b, $20, $62, $83, $50, $41, $4c, $20, $00, $4c, $ff, $95, $20, $62, $83    // data $95e9
    .byte $4e, $54, $53, $43, $20, $00, $a9, $37, $85, $01, $a5, $01, $c9, $77, $f0, $0a    // data $95f9
    .byte $20, $62, $83, $43, $36, $34, $00, $4c, $1b, $96, $20, $62, $83, $43, $31, $32    // data $9609
    .byte $38, $00, $a2, $18, $a0, $1b, $20, $76, $85, $20, $62, $83, $20, $50, $41, $4c    // data $9619
    .byte $20, $36, $34, $4b, $42, $20, $52, $4f, $00, $ad, $a6, $02, $d0, $16, $a2, $18    // data $9629
    .byte $a0, $10, $20, $76, $85, $20, $62, $83, $96, $3c, $57, $41, $52, $4e, $49, $4e    // data $9639
    .byte $47, $21, $3e, $00, $a9, $0d, $8d, $e7, $07, $a9, $06, $8d, $ff, $d9, $60    // data $9649
bank03_api_26:
    jsr bank03_sub_8362              // 20 62 83
    jsr $3146              // 20 46 31
    rol                  // 2a
    .byte $42    // undocumented opcode
    eor ($43,x)            // 41 43
    .byte $4b    // undocumented opcode
    eor $50,x              // 55 50
    jsr $4620              // 20 20 46
    .byte $33    // undocumented opcode
    rol                  // 2a
    .byte $52    // undocumented opcode
    eor $53                // 45 53
    .byte $54    // undocumented opcode
    eor ($52,x)            // 41 52
    .byte $54    // undocumented opcode
    jsr $4620              // 20 20 46
    .byte $37    // undocumented opcode
    rol                  // 2a
    .byte $53    // undocumented opcode
    .byte $43    // undocumented opcode
    .byte $52    // undocumented opcode
    eor $45                // 45 45
    lsr $0d0d              // 4e 0d 0d
    ora $4d20              // 0d 20 4d
    rol                  // 2a
    eor $4e4f              // 4d 4f 4e
    eor #$54               // 49 54
    .byte $4f    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $02    // undocumented opcode
    .byte $0b    // undocumented opcode
    eor $2a                // 45 2a
    bvc bank03_sub_96de              // 50 4f
    .byte $4b    // undocumented opcode
    eor $53                // 45 53
    ora $4420              // 0d 20 44
    rol                  // 2a
    .byte $44    // undocumented opcode
    eor #$52               // 49 52
    eor $43                // 45 43
    .byte $54    // undocumented opcode
    .byte $4f    // undocumented opcode
    .byte $52    // undocumented opcode
    eor $0902,y            // 59 02 09
    cli                    // 58
    rol                  // 2a
    bvc bank03_sub_96f4              // 50 4f
    .byte $4b    // undocumented opcode
    eor $46                // 45 46
    eor #$4e               // 49 4e
    .byte $44    // undocumented opcode
    eor $52                // 45 52
    ora $5420              // 0d 20 54
    rol                  // 2a
    eor $44                // 45 44
    eor #$54               // 49 54
    jsr $4353              // 20 53 43
    .byte $52    // undocumented opcode
    eor $45                // 45 45
    lsr $0702              // 4e 02 07
    .byte $4b    // undocumented opcode
    rol                  // 2a
    .byte $53    // undocumented opcode
    bvc $9715              // 50 52
    eor #$54               // 49 54
    eor $4b                // 45 4b
    eor #$4c               // 49 4c
    jmp $5245              // 4c 45 52
    .byte $0d, $20, $56, $2a, $45, $44, $49, $54, $20, $53, $50, $52, $49, $54, $45, $53    // data $96cc
    .byte $02, $06    // data $96dc
bank03_sub_96de:
    jmp $542a              // 4c 2a 54
    .byte $55, $52, $42, $4f, $20, $4c, $49, $4e, $4b, $45, $52, $0d, $20, $43, $2a, $45    // data $96e1
    .byte $44, $49, $54    // data $96f1
bank03_sub_96f4:
    jsr $4843              // 20 43 48
    eor ($52,x)            // 41 52
    .byte $53    // undocumented opcode
    eor $54                // 45 54
    .byte $02    // undocumented opcode
    ora $20                // 05 20
    bvc bank03_sub_972b              // 50 2a
    bvc bank03_sub_9744              // 50 41
    .byte $52    // undocumented opcode
    eor ($4d,x)            // 41 4d
    eor $54                // 45 54
    eor $52                // 45 52
    .byte $53    // undocumented opcode
    ora $5320              // 0d 20 53
    rol                  // 2a
    .byte $53    // undocumented opcode
    eor ($56,x)            // 41 56
    eor $4c                // 45 4c
    eor ($4e,x)            // 41 4e
    .byte $44    // undocumented opcode
    ora $0d0d              // 0d 0d 0d
    brk                    // 00
    rts                    // 60
bank03_api_27:
    jsr bank03_sub_8362              // 20 62 83
    .byte $43    // undocumented opcode
    .byte $4f    // undocumented opcode
    jmp $494c              // 4c 4c 49
    .byte $53, $49, $4f, $4e, $20, $54, $59    // data $9724
bank03_sub_972b:
    bvc bank03_sub_9772              // 50 45
    .byte $3a    // undocumented opcode
    ora $020d              // 0d 0d 02
    .byte $0c    // undocumented opcode
    eor ($2a,x)            // 41 2a
    .byte $53    // undocumented opcode
    bvc bank03_sub_9789              // 50 52
    eor #$54               // 49 54
    eor $2f                // 45 2f
    .byte $53    // undocumented opcode
    bvc bank03_sub_9790              // 50 52
    eor #$54               // 49 54
    eor $20                // 45 20
    bit $44                // 24 44
bank03_sub_9744:
    bmi bank03_sub_9777              // 30 31
    eor $0d                // 45 0d
    .byte $02    // undocumented opcode
    .byte $0c    // undocumented opcode
    .byte $42    // undocumented opcode
    rol                  // 2a
    .byte $53    // undocumented opcode
    bvc bank03_sub_97a1              // 50 52
    eor #$54               // 49 54
    eor $2f                // 45 2f
    .byte $42    // undocumented opcode
    .byte $43    // undocumented opcode
    .byte $4b    // undocumented opcode
    .byte $47    // undocumented opcode
    .byte $52    // undocumented opcode
    .byte $44    // undocumented opcode
    jsr $4424              // 20 24 44
    bmi bank03_sub_978f              // 30 31
    lsr $0d                // 46 0d
    .byte $02    // undocumented opcode
    .byte $0c    // undocumented opcode
    .byte $43    // undocumented opcode
    rol                  // 2a
    .byte $42    // undocumented opcode
    .byte $4f    // undocumented opcode
    .byte $54    // undocumented opcode
    pha                    // 48
    brk                    // 00
    .byte $60, $00, $00, $00, $00, $00, $00, $00, $00    // data $9769
bank03_sub_9772:
    brk                    // 00
    .byte $00, $00, $00, $00    // data $9773
bank03_sub_9777:
    brk                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9778
    .byte $00    // data $9788
bank03_sub_9789:
    brk                    // 00
    .byte $00, $00, $00, $00, $00    // data $978a
bank03_sub_978f:
    brk                    // 00
bank03_sub_9790:
    brk                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9791
bank03_sub_97a1:
    brk                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97a2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97b2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97c2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97d2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $97e2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $ff, $f0    // data $97f2
    .byte $05, $a2, $10, $4c, $f9, $be, $a0, $04, $ad, $32, $b3, $91, $4b, $c8, $ad, $33    // data $9802
    .byte $b3, $91, $4b, $60, $a9, $00, $8d, $1a, $b3, $a9, $06, $20, $94, $c5, $a9, $ff    // data $9812
    .byte $20, $b4, $c5, $ad, $23, $b3, $20, $b4, $c5, $ad, $24, $b3, $20, $b4, $c5, $ad    // data $9822
    .byte $32, $b3, $20, $b4, $c5, $ad, $33, $b3, $4c, $b4, $c5, $ad, $11, $b3, $f0, $05    // data $9832
    .byte $a2, $0f, $4c, $f9, $be, $ad, $ff, $b2, $f0, $05, $a2, $07, $4c, $fc, $be, $ad    // data $9842
    .byte $39, $b3, $f0, $09, $ad, $06, $cb, $ae, $07, $cb, $4c, $a2, $be, $60, $20, $37    // data $9852
    .byte $c1, $ad, $33, $b3, $8d, $09, $cb, $ad, $32, $b3, $8d, $08, $cb, $cd, $06, $cb    // data $9862
    .byte $ad, $33, $b3, $ed, $07, $cb, $90, $05, $a2, $12, $4c, $f9, $be, $4c, $03, $80    // data $9872
    .byte $2c, $39, $b3, $30, $13, $20, $ad, $c2, $ad, $33, $b3, $f0, $05, $a2, $03, $20    // data $9882
    .byte $fc, $be, $ad, $32, $b3, $8d, $47, $b3, $60, $a9, $01, $8d, $e1, $b6, $a9, $2c    // data $9892
    .byte $8d, $0c, $c9, $a9, $ea, $8d, $0f, $c9, $d0, $3b, $a2, $00, $8e, $e1, $b6, $a9    // data $98a2
    .byte $ea, $8d, $0c, $c9, $a9, $2c, $8d, $0f, $c9, $a9, $00, $8d, $02, $df, $8d, $04    // data $98b2
    .byte $df, $8d, $07, $df, $a9, $ca, $8d, $03, $df, $a9, $01, $8d, $08, $df, $8e, $05    // data $98c2
    .byte $df, $ad, $06, $80, $8d, $06, $df, $20, $27, $c9, $a9, $00, $8d, $06, $df, $20    // data $98d2
    .byte $2a, $c9, $e8, $d0, $d4, $a9, $00, $8d, $23, $cb, $a9, $00, $8d, $24, $cb, $4c    // data $98e2
    .byte $cf, $b2, $a9, $c0, $8d, $02, $df, $a9, $02, $8d, $03, $df, $a5, $3b, $8d, $04    // data $98f2
    .byte $df, $a5, $3c, $8d, $05, $df, $c8, $8c, $07, $df, $ea, $a0, $00, $ea, $ac, $06    // data $9902
    .byte $80, $8c, $06, $df, $8c, $08, $df, $a9, $00, $8d, $30, $d0, $20, $2a, $c9, $a9    // data $9912
    .byte $fd, $8d, $30, $d0, $60, $a9, $ed, $2c, $a9, $ec, $8d, $01, $df, $78, $e6, $01    // data $9922
    .byte $ad, $00, $ff, $8d, $00, $ff, $c6, $01, $60, $78, $a9, $37, $85, $01, $a2, $31    // data $9932
    .byte $a0, $ea, $8e, $14, $03, $8c, $15, $03, $20, $81, $ff, $20, $84, $ff, $a9, $00    // data $9942
    .byte $8d, $06, $df, $8d, $02, $df, $8d, $04, $df, $8d, $07, $df, $a9, $08, $8d, $03    // data $9952
    .byte $df, $8d, $05, $df, $a9, $f8, $8d, $08, $df, $a9, $ed, $8d, $01, $df, $a9, $34    // data $9962
    .byte $85, $01, $ad, $00, $ff, $8d, $00, $ff, $a9, $37, $85, $01, $58, $4c, $00, $80    // data $9972
    .byte $bb, $bb, $00, $18, $65, $39, $85, $39, $60, $00, $00, $00, $00, $00, $00, $00    // data $9982
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9992
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99a2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99b2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99c2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99d2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99e2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $99f2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9a92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9aa2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ab2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ac2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ad2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ae2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9af2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9b92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ba2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9bb2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9bc2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9bd2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9be2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9bf2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9c92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ca2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9cb2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9cc2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9cd2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ce2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9cf2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9d92
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9da2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9db2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9dc2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9dd2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9de2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9df2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e02
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e12
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e22
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e32
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e42
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e52
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e62
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e72
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e82
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $20, $ba, $de, $c6, $01    // data $9e92
    .byte $20, $d5, $f3, $e6, $01, $60, $ea, $20, $ba, $de, $ea, $ea, $ea, $ea, $ea, $ea    // data $9ea2
    .byte $ea, $ea, $ea, $8d, $00, $de, $68, $60, $48, $78, $a9, $18, $48, $a9, $20, $8d    // data $9eb2
    .byte $00, $de, $00, $00, $00, $00, $00, $2c, $80, $80, $2c, $80, $80, $48, $ad, $f2    // data $9ec2
    .byte $de, $8d, $00, $de, $68, $8d, $f7, $de, $8d, $00, $de, $60, $8d, $00, $de, $68    // data $9ed2
    .byte $40, $ea, $85, $9e, $68, $8d, $00, $de, $a5, $9e, $60, $18, $00, $08, $10, $18    // data $9ee2
    .byte $20, $1a, $80, $88, $90, $98, $00, $00, $00, $00, $00, $00, $00, $00, $ea    // data $9ef2
bank03_sub_9f01:
    nop                    // ea
bank03_sub_9f02:
    nop                    // ea
    nop                    // ea
    nop                    // ea
bank03_sub_9f05:
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    sei                    // 78
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
    bne bank03_sub_9f2b              // d0 02
    dec $9f                // c6 9f
bank03_sub_9f2b:
    dec $9e                // c6 9e
    ldy #$00               // a0 00
    lda ($9e),y            // b1 9e
    sec                    // 38
    sbc #$00               // e9 00
    tax                    // aa
    lda $deed              // ad ed de
    pha                    // 48
    lda #$de               // a9 de
    pha                    // 48
    lda #$e3               // a9 e3
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
bank03_api_23:
    lda $2b                // a5 2b
    ldy $2c                // a4 2c
    sta $22                // 85 22
    sty $23                // 84 23
    clc                    // 18
bank03_sub_9f61:
    ldy #$01               // a0 01
    lda ($22),y            // b1 22
    beq bank03_sub_9f86              // f0 1f
    ldy #$04               // a0 04
bank03_sub_9f69:
    iny                    // c8
    beq bank03_sub_9f87              // f0 1b
    lda ($22),y            // b1 22
    bne bank03_sub_9f69              // d0 f9
    iny                    // c8
    tya                    // 98
    adc $22                // 65 22
    tax                    // aa
    ldy #$00               // a0 00
    sta ($22),y            // 91 22
    lda $23                // a5 23
    adc #$00               // 69 00
    iny                    // c8
    sta ($22),y            // 91 22
    stx $22                // 86 22
    sta $23                // 85 23
    bcc bank03_sub_9f61              // 90 db
bank03_sub_9f86:
    rts                    // 60
bank03_sub_9f87:
    lda #$00               // a9 00
    ldy #$01               // a0 01
    sta ($22),y            // 91 22
    rts                    // 60
bank03_api_11:
    lda $d021              // ad 21 d0
    and #$0f               // 29 0f
    ldx #$01               // a2 01
    cmp #$01               // c9 01
    bne bank03_sub_9f9a              // d0 01
    dex                    // ca
bank03_sub_9f9a:
    stx $0286              // 8e 86 02
    rts                    // 60
    .byte $20, $02, $9f, $33, $80, $8e, $39, $03, $a2, $05, $a0, $1d, $20, $76, $85, $a6    // data $9f9e
    .byte $ba, $a9, $00, $20, $cd, $bd, $a9, $20, $4c, $16, $e7, $20, $00, $9f, $57, $80    // data $9fae
    .byte $d0, $03, $4c, $5d, $84, $a9, $0d, $4c, $16, $e7    // data $9fbe
bank03_api_21:
    jsr bank03_sub_8362              // 20 62 83
    ora $2020              // 0d 20 20
    jsr $5943              // 20 43 59
    .byte $42    // undocumented opcode
    eor $52                // 45 52
    bvc $a02b              // 50 55
    lsr $2058              // 4e 58 20
    .byte $52    // undocumented opcode
    eor $54                // 45 54
    .byte $52    // undocumented opcode
    .byte $4f    // undocumented opcode
    jsr $4552              // 20 52 45
    bvc $a02f              // 50 4c
    eor ($59,x)            // 41 59
    jsr $3436              // 20 36 34
    .byte $4b    // undocumented opcode
    .byte $42    // undocumented opcode
    jsr $202d              // 20 2d 20
    .byte $33    // undocumented opcode
    rol $5038              // 2e 38 50
    ora $6000              // 0d 00 60
    brk                    // 00
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9ff5