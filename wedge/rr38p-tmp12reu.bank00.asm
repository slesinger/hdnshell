// disassembly for rr38p-tmp12reu.bin bank 0
// bank file offset: $0000-$1fff
// cartridge window: $8000-$9fff
// vectors: coldstart=$8009, warmstart=$800c, signature=c3 c2 cd 38 30
// reachable instructions: 945 bytes decoded as code: 2023
// entry points: $8009, $800c, $806e, $817f, $8187, $818a, $8760, $8aa5, $8aeb, $8b2a, $8b54, $8fbe, $9c5f, $9db3
// jump table from cold start:
//   $8009 -> $817f
//   $800c -> $8187
//   $800f -> $818a
//   $8012 -> $de3f
//   $8015 -> $de41
//   $8018 -> $8fbe
//   $801b -> $9c5f
//   $801e -> $8b2a
//   $8021 -> $9db3
//   $8024 -> $8760
//   $8027 -> $8aeb
//   $802a -> $806e
//   $802d -> $8b54
//   $8030 -> $8aa5
// external branch/jsr/jmp targets: $0060, $0100, $0400, $0500, $454d, $4552, $455a, $4620, $de3f, $de41, $de8d, $de9d, $deba, $dede, $e3bf, $e453, $e716, $fdd0, $ff5b, $ffe4, $fff0

// symbol table (auto-generated)
//   $8009 bank00_cold_start
//   $800c bank00_warm_start
//   $800f bank00_sub_800f
//   $8012 bank00_sub_8012
//   $8015 bank00_sub_8015
//   $8033 bank00_sub_8033
//   $8042 bank00_sub_8042
//   $804e bank00_sub_804e
//   $8060 bank00_sub_8060
//   $806e bank00_api_11
//   $817f bank00_api_00
//   $8187 bank00_api_01
//   $818a bank00_api_02
//   $81e9 bank00_sub_81e9
//   $81ec bank00_sub_81ec
//   $8214 bank00_sub_8214
//   $821a bank00_sub_821a
//   $8250 bank00_sub_8250
//   $8289 bank00_sub_8289
//   $8293 bank00_sub_8293
//   $8298 bank00_sub_8298
//   $829b bank00_sub_829b
//   $82c1 bank00_sub_82c1
//   $82cb bank00_sub_82cb
//   $82cf bank00_sub_82cf
//   $82da bank00_sub_82da
//   $84ec bank00_sub_84ec
//   $84ed bank00_sub_84ed
//   $84fe bank00_sub_84fe
//   $851e bank00_sub_851e
//   $852d bank00_sub_852d
//   $8541 bank00_sub_8541
//   $854b bank00_sub_854b
//   $857b bank00_sub_857b
//   $85eb bank00_sub_85eb
//   $85f5 bank00_sub_85f5
//   $85fa bank00_sub_85fa
//   $8625 bank00_sub_8625
//   $8632 bank00_sub_8632
//   $864d bank00_sub_864d
//   $866b bank00_sub_866b
//   $8671 bank00_sub_8671
//   $868e bank00_sub_868e
//   $8691 bank00_sub_8691
//   $869f bank00_sub_869f
//   $86a0 bank00_sub_86a0
//   $86a3 bank00_sub_86a3
//   $86c8 bank00_sub_86c8
//   $8722 bank00_sub_8722
//   $8724 bank00_sub_8724
//   $8760 bank00_api_09
//   $8763 bank00_sub_8763
//   $8773 bank00_sub_8773
//   $8780 bank00_sub_8780
//   $8788 bank00_sub_8788
//   $8796 bank00_sub_8796
//   $879b bank00_sub_879b
//   $87ad bank00_sub_87ad
//   $87b2 bank00_sub_87b2
//   $87e6 bank00_sub_87e6
//   $87ea bank00_sub_87ea
//   $87f5 bank00_sub_87f5
//   $87f9 bank00_sub_87f9
//   $8811 bank00_sub_8811
//   $8816 bank00_sub_8816
//   $881b bank00_sub_881b
//   $8820 bank00_sub_8820
//   $8aa5 bank00_api_13
//   $8aaa bank00_sub_8aaa
//   $8ab6 bank00_sub_8ab6
//   $8ab9 bank00_sub_8ab9
//   $8adf bank00_sub_8adf
//   $8ae9 bank00_sub_8ae9
//   $8aeb bank00_api_10
//   $8af1 bank00_sub_8af1
//   $8af5 bank00_sub_8af5
//   $8b08 bank00_sub_8b08
//   $8b2a bank00_api_07
//   $8b33 bank00_sub_8b33
//   $8b3d bank00_sub_8b3d
//   $8b3f bank00_sub_8b3f
//   $8b4c bank00_sub_8b4c
//   $8b54 bank00_api_12
//   $8b9d bank00_sub_8b9d
//   $8fbe bank00_api_05
//   $8fdc bank00_sub_8fdc
//   $8fe8 bank00_sub_8fe8
//   $8ff5 bank00_sub_8ff5
//   $9007 bank00_sub_9007
//   $9018 bank00_sub_9018
//   $901e bank00_sub_901e
//   $9037 bank00_sub_9037
//   $9045 bank00_sub_9045
//   $907c bank00_sub_907c
//   $9095 bank00_sub_9095
//   $90a7 bank00_sub_90a7
//   $90b2 bank00_sub_90b2
//   $90c4 bank00_sub_90c4
//   $90d6 bank00_sub_90d6
//   $90f3 bank00_sub_90f3
//   $90f9 bank00_sub_90f9
//   $9107 bank00_sub_9107
//   $911c bank00_sub_911c
//   $9155 bank00_sub_9155
//   $9159 bank00_sub_9159
//   $927a bank00_sub_927a
//   $928b bank00_sub_928b
//   $9295 bank00_sub_9295
//   $9298 bank00_sub_9298
//   $9898 bank00_sub_9898
//   $9941 bank00_sub_9941
//   $995b bank00_sub_995b
//   $995f bank00_sub_995f
//   $9974 bank00_sub_9974
//   $9976 bank00_sub_9976
//   $99ed bank00_sub_99ed
//   $9a05 bank00_sub_9a05
//   $9a0f bank00_sub_9a0f
//   $9a15 bank00_sub_9a15
//   $9a19 bank00_sub_9a19
//   $9a1e bank00_sub_9a1e
//   $9c5f bank00_api_06
//   $9d91 bank00_sub_9d91
//   $9d93 bank00_sub_9d93
//   $9db3 bank00_api_08
//   $9dbc bank00_sub_9dbc
//   $9dcd bank00_sub_9dcd
//   $9ea9 bank00_sub_9ea9
//   $9f01 bank00_sub_9f01
//   $9f03 bank00_sub_9f03
//   $9f26 bank00_sub_9f26
//   $de3f bank00_api_03
//   $de41 bank00_api_04

// external symbol equates
.const bank00_api_03 = $de3f
.const bank00_api_04 = $de41

.const bank00_api_01 = $8187
.const bank00_api_02 = $818a
.pc = $8000

    .byte $09, $80, $0c, $80, $c3, $c2, $cd, $38, $30    // data $8000
bank00_cold_start:
    jmp bank00_api_00              // 4c 7f 81
bank00_warm_start:
    jmp bank00_api_01              // 4c 87 81
bank00_sub_800f:
    jmp bank00_api_02              // 4c 8a 81
bank00_sub_8012:
    jmp bank00_api_03              // 4c 3f de
bank00_sub_8015:
    jmp bank00_api_04              // 4c 41 de
    .byte $4c, $be, $8f, $4c, $5f, $9c, $4c, $2a, $8b, $4c, $b3, $9d, $4c, $60, $87, $4c    // data $8018
    .byte $eb, $8a, $4c, $6e, $80, $4c, $54, $8b, $4c, $a5, $8a    // data $8028
bank00_sub_8033:
    jsr bank00_sub_8b3d              // 20 3d 8b
    jmp bank00_api_12              // 4c 54 8b
    .byte $20, $54, $8b, $4c, $2a, $8b, $4c, $9e, $8a    // data $8039
bank00_sub_8042:
    jmp bank00_sub_8af5              // 4c f5 8a
    .byte $4c, $e0, $8a, $4c, $86, $8b, $4c, $e9, $8a    // data $8045
bank00_sub_804e:
    jmp bank00_sub_8af1              // 4c f1 8a
    .byte $4c, $1a, $8b, $4c, $23, $8b, $4c, $52, $9f, $4c, $62, $9f, $4c, $66, $9f    // data $8051
bank00_sub_8060:
    ldy #$20               // a0 20
    bit $28a0              // 2c a0 28
    bit $30a0              // 2c a0 30
    bit $38a0              // 2c a0 38
    jmp bank00_sub_9d91              // 4c 91 9d
bank00_api_11:
    bcs bank00_warm_start              // b0 9c
    sei                    // 78
    ldx #$fb               // a2 fb
    txs                    // 9a
    jmp bank00_sub_84ec              // 4c ec 84
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $52, $52, $33, $38, $50, $2d, $43    // data $8077
    .byte $4f, $55, $4e, $54, $20, $5a, $45, $52, $4f, $2f, $43, $50, $58, $2d, $bd, $00    // data $8087
    .byte $42, $30, $01, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $8097
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80a7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80b7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80c7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80d7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $80e7
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $54, $41    // data $80f7-$8101 (unchanged original data)

// ---------------------------------------------------------------------------
// b00_title -- extended freeze-menu title banner ("BY COUNT ZERO + HDN").
// The stock title lives as an inline string right after the second jsr inside
// bank00_sub_87b2 (see there); inline strings can't grow in place without
// shifting everything after them, so that jsr is replaced with a same-size
// `jmp b00_title`, and this block re-prints the title from its own, longer
// inline copy, then jumps back to $87e5 -- the exact address where
// bank00_sub_8763's return-address fixup would have resumed after the stock
// string. The stock string bytes at $87b8-$87e4 stay in place as dead data.
// Placed in the confirmed-free zero pocket $8102-$817e (raw byte-scan of the
// stock .bin; bank00_api_00 at $817f must stay put, hence the .fill guard).
// String escapes (see bank00_sub_8763): $01 <n> = print n spaces; string is
// null-terminated. Line 2 is 19 chars, so 11 leading spaces ((40-19)/2
// rounded up, same rounding the stock 13-char/14-space line used).
// ---------------------------------------------------------------------------
b00_title:
    jsr bank00_sub_8763
    .byte $93                                                                        // clear screen
    .byte $01, $09                                                                   // 9 spaces
    .byte $43, $59, $42, $45, $52, $50, $55, $4e, $58, $20                           // "CYBERPUNX "
    .byte $52, $45, $54, $52, $4f, $20                                               // "RETRO "
    .byte $52, $45, $50, $4c, $41, $59                                               // "REPLAY"
    .byte $0d
    .byte $01, $0b                                                                   // 11 spaces
    .byte $42, $59, $20, $43, $4f, $55, $4e, $54, $20, $5a, $45, $52, $4f            // "BY COUNT ZERO"
    .byte $20, $2b, $20, $48, $44, $4e                                               // " + HDN"
    .byte $0d, $0d, $0d, $00
    jmp $87e5              // resume exactly where the stock inline string ended
b00_title_end:

    .fill $817f - b00_title_end, $00    // remaining confirmed-free bytes in this pocket
bank00_api_00:
    lda #$40               // a9 40
    sta $de01              // 8d 01 de
    lda #$00               // a9 00
    bit $02a9              // 2c a9 02
    bit $01a9              // 2c a9 01
    sta $0200              // 8d 00 02
    sei                    // 78
    ldx #$ff               // a2 ff
    txs                    // 9a
    cld                    // d8
    lda #$7f               // a9 7f
    sta $dc0d              // 8d 0d dc
    sta $dd0d              // 8d 0d dd
    sta $dc00              // 8d 00 dc
    lda #$08               // a9 08
    sta $dc0e              // 8d 0e dc
    sta $dd0e              // 8d 0e dd
    sta $dc0f              // 8d 0f dc
    sta $dd0f              // 8d 0f dd
    ldx #$00               // a2 00
    stx $dc03              // 8e 03 dc
    stx $dd03              // 8e 03 dd
    stx $d418              // 8e 18 d4
    dex                    // ca
    stx $dc02              // 8e 02 dc
    ldx $0200              // ae 00 02
    beq $81c9              // f0 08
    lda $08d0              // ad d0 08
    and #$fc               // 29 fc
    ora #$07               // 09 07
    bit $07a9              // 2c a9 07
    sta $dd00              // 8d 00 dd
    jsr $fdd0              // 20 d0 fd
    lda $0200              // ad 00 02
    bne bank00_sub_81ec              // d0 16
    ldx #$00               // a2 00
    lda $dc01              // ad 01 dc
    and #$04               // 29 04
    beq bank00_sub_81e9              // f0 0a
    lda $dc01              // ad 01 dc
    and #$80               // 29 80
    bne bank00_sub_81ec              // d0 06
    jmp bank00_sub_8289              // 4c 89 82
bank00_sub_81e9:
    jmp bank00_sub_82cf              // 4c cf 82
bank00_sub_81ec:
    jsr bank00_sub_8298              // 20 98 82
    jsr $ff5b              // 20 5b ff
    cli                    // 58
    jsr $e453              // 20 53 e4
    jsr $e3bf              // 20 bf e3
    jsr bank00_sub_87b2              // 20 b2 87
    lda #$37               // a9 37
    sta $01                // 85 01
    sta $c0                // 85 c0
    ldx $0200              // ae 00 02
    beq $823a              // f0 33
    jsr bank00_sub_99ed              // 20 ed 99
    dec $0200              // ce 00 02
    bne bank00_sub_8214              // d0 05
    lda $0882              // ad 82 08
    bne bank00_sub_821a              // d0 06
bank00_sub_8214:
    jsr bank00_sub_87f9              // 20 f9 87
    jmp bank00_api_01              // 4c 87 81
bank00_sub_821a:
    jsr bank00_sub_8763              // 20 63 87
    ora $2e0d              // 0d 0d 2e
    cli                    // 58
    jsr $4620              // 20 20 46
    .byte $4f    // undocumented opcode
    .byte $52    // undocumented opcode
    jsr $454d              // 20 4d 45
    lsr $0d55              // 4e 55 0d
    ora.a $000d              // 0d 0d 00
    ldx $0878              // ae 78 08
    stx $0882              // 8e 82 08
    jsr bank00_sub_9f01              // 20 01 9f
    asl $e880,x            // 1e 80 e8
    jsr bank00_sub_8722              // 20 22 87
    jsr bank00_api_08              // 20 b3 9d
    jsr bank00_sub_87b2              // 20 b2 87
    jsr bank00_sub_9f03              // 20 03 9f
    .byte $54    // undocumented opcode
    .byte $80    // undocumented opcode
    lda #$50               // a9 50
    ldy #$82               // a0 82
    jsr bank00_sub_9898              // 20 98 98
bank00_sub_8250:
    cli                    // 58
    jsr bank00_api_13              // 20 a5 8a
    ldx #$02               // a2 02
    stx $05ff              // 8e ff 05
    cmp #$85               // c9 85
    beq bank00_sub_82cb              // f0 6e
    dex                    // ca
    cmp #$89               // c9 89
    beq bank00_sub_82cb              // f0 69
    dex                    // ca
    cmp #$86               // c9 86
    beq bank00_sub_82cb              // f0 64
    cmp #$87               // c9 87
    beq bank00_sub_8293              // f0 28
    ldy #$00               // a0 00
    sty $05ff              // 8c ff 05
    ldx #$01               // a2 01
    cmp #$8b               // c9 8b
    beq bank00_sub_82cb              // f0 55
    cmp $8098              // cd 98 80
    beq bank00_sub_82cb              // f0 50
    inx                    // e8
    cmp #$8c               // c9 8c
    beq bank00_sub_82cb              // f0 4b
    cmp $8097              // cd 97 80
    beq bank00_sub_82cb              // f0 46
    cmp #$88               // c9 88
    bne bank00_sub_8250              // d0 c7
bank00_sub_8289:
    ldx #$01               // a2 01
    jsr bank00_sub_8722              // 20 22 87
    jsr bank00_sub_9f01              // 20 01 9f
    ora #$80               // 09 80
bank00_sub_8293:
    jsr bank00_sub_9f03              // 20 03 9f
    and ($80,x)            // 21 80
bank00_sub_8298:
    lda #$00               // a9 00
    tay                    // a8
bank00_sub_829b:
    sta.a $0002,y            // 99 02 00
    sta $0201,y            // 99 01 02
    sta $0300,y            // 99 00 03
    iny                    // c8
    bne bank00_sub_829b              // d0 f4
    ldx #$3c               // a2 3c
    ldy #$03               // a0 03
    stx $b2                // 86 b2
    sty $b3                // 84 b3
    lda #$a0               // a9 a0
    sta $0284              // 8d 84 02
    sta $c2                // 85 c2
    lda #$08               // a9 08
    sta $0282              // 8d 82 02
    lsr                  // 4a
    sta $0288              // 8d 88 02
    ldy #$1f               // a0 1f
bank00_sub_82c1:
    lda $fd30,y            // b9 30 fd
    sta $0314,y            // 99 14 03
    dey                    // 88
    bpl bank00_sub_82c1              // 10 f7
    rts                    // 60
bank00_sub_82cb:
    bit $c5                // 24 c5
    bvc bank00_sub_82cb              // 50 fc
bank00_sub_82cf:
    stx $02                // 86 02
    ldx #$ff               // a2 ff
    jsr bank00_sub_8722              // 20 22 87
    ldx $02                // a6 02
    ldy #$51               // a0 51
bank00_sub_82da:
    lda $82f6,y            // b9 f6 82
    sta $04ff,y            // 99 ff 04
    dey                    // 88
    bne bank00_sub_82da              // d0 f7
    lda $8095              // ad 95 80
    sta $050d              // 8d 0d 05
    lda $8096              // ad 96 80
    sta $0510              // 8d 10 05
    lda #$0b               // a9 0b
    sta $d011              // 8d 11 d0
    jmp $0500              // 4c 00 05
    .byte $78, $e6, $01, $84, $02, $8a, $f0, $19, $c9, $02, $d0, $03, $a9, $bd, $2c, $a9    // data $82f7
    .byte $00, $86, $03, $91, $02, $c8, $d0, $fb, $e8, $f0, $06, $e0, $05, $d0, $f2, $f0    // data $8307
    .byte $f7, $c6, $01, $a9, $55, $8d, $00, $a0, $8e, $16, $d0, $20, $a3, $fd, $20, $98    // data $8317
    .byte $82, $20, $15, $fd, $ad, $ff, $05, $f0, $08, $a9, $06, $8d, $00, $de, $4c, $fb    // data $8327
    .byte $fc, $a9, $00, $8d, $00, $de, $a2, $01, $20, $22, $87, $20, $01, $9f, $09, $80    // data $8337
    .byte $e6, $01, $a9, $01, $85, $fc, $a0, $ff, $84, $fb, $c8, $84, $fd, $ad, $00, $d0    // data $8347
    .byte $48, $ad, $ff, $cf, $49, $ff, $8d, $00, $d0, $a9, $3d, $85, $fa, $38, $98, $65    // data $8357
    .byte $fb, $85, $fb, $a6, $fc, $90, $14, $e8, $f0, $66, $e4, $f8, $d0, $05, $e8, $a9    // data $8367
    .byte $60, $85, $fb, $e0, $d0, $d0, $02, $a2, $e0, $86, $fc, $a0, $1f, $b1, $fb, $88    // data $8377
    .byte $30, $06, $d1, $fb, $d0, $d7, $f0, $f7, $a4, $fa, $f0, $27, $d1, $fb, $d0, $23    // data $8387
    .byte $88, $c0, $1f, $d0, $f7, $a4, $fa, $c0, $38, $f0, $0c, $85, $3d, $86, $2c, $a5    // data $8397
    .byte $fb, $85, $2b, $a9, $38, $d0, $b4, $85, $3e, $86, $3c, $a5, $fb, $85, $3b, $a9    // data $83a7
    .byte $00, $f0, $a8, $a6, $fd, $e0, $05, $f0, $13, $95, $0c, $e6, $fd, $8a, $0a, $aa    // data $83b7
    .byte $a5, $fb, $95, $02, $a5, $fc, $95, $03, $a0, $1f, $d0, $91, $a5, $fa, $d0, $8d    // data $83c7
    .byte $68, $8d, $00, $d0, $c6, $01, $60, $20, $ba, $9e, $a0, $1f, $ce, $09, $01, $ad    // data $83d7
    .byte $00, $80, $e6, $01, $91, $0a, $c6, $01, $88, $10, $f1, $ce, $0e, $01, $ce, $0e    // data $83e7
    .byte $01, $d0, $e7, $a0, $38, $b9, $02, $80, $e6, $01, $91, $3b, $c6, $01, $c0, $1a    // data $83f7
    .byte $b0, $06, $b9, $52, $01, $99, $11, $00, $88, $10, $ea, $20, $b2, $9e, $e6, $01    // data $8407
    .byte $a0, $3d, $b9, $6c, $01, $c9, $bb, $d0, $08, $ce, $46, $01, $ae, $b8, $01, $b5    // data $8417
    .byte $00, $91, $2b, $88, $10, $ec, $c6, $01, $60, $a0, $1f, $86, $18, $86, $20, $b1    // data $8427
    .byte $0a, $c6, $1c, $85, $00, $a5, $10, $91, $0a, $88, $10, $f3, $c6, $1e, $ca, $ca    // data $8437
    .byte $d0, $e7, $4c, $a2, $38, $bd, $bb, $bb, $95, $02, $a9, $bb, $9d, $bb, $bb, $ca    // data $8447
    .byte $10, $f3, $e6, $01, $a9, $bb, $2c, $11, $d0, $bb, $fb, $cd, $12, $d0, $d0, $f6    // data $8457
    .byte $a9, $bb, $a2, $bb, $8d, $0e, $dd, $8e, $0f, $dd, $a0, $3d, $48, $68, $a5, $00    // data $8467
    .byte $a9, $bb, $a2, $bb, $8d, $0e, $dc, $8e, $0f, $dc, $a9, $bb, $a2, $bb, $4c, $bb    // data $8477
    .byte $01, $3b, $3c, $3e, $3b, $3c, $f0, $f1, $2e, $2f, $31, $32, $3d, $e7, $e9, $a5    // data $8487
    .byte $2b, $8d, $3f, $01, $a5, $2c, $8d, $40, $01, $a5, $e4, $8d, $4b, $01, $a5, $e5    // data $8497
    .byte $8d, $4d, $01, $a5, $e8, $c9, $2f, $f0, $10, $8d, $45, $01, $a9, $a9, $8d, $44    // data $84a7
    .byte $01, $a9, $85, $8d, $46, $01, $8c, $47, $01, $20, $8a, $9e, $a9, $81, $85, $ea    // data $84b7
    .byte $a0, $11, $b9, $3e, $01, $91, $e9, $88, $10, $f8, $4c, $b2, $9e, $99, $bb, $bb    // data $84c7
    .byte $88, $10, $fa, $8c, $19, $d0, $ea, $86, $01, $a2, $bb, $a0, $bb, $68, $40, $20    // data $84d7
    .byte $eb, $85, $38, $b0, $0f    // data $84e7
bank00_sub_84ec:
    cli                    // 58
bank00_sub_84ed:
    bit $c5                // 24 c5
    bvc bank00_sub_84ed              // 50 fc
    jsr bank00_sub_8ae9              // 20 e9 8a
    jsr bank00_sub_85eb              // 20 eb 85
    jsr bank00_sub_86a0              // 20 a0 86
    clc                    // 18
    sei                    // 78
    ldx #$1f               // a2 1f
bank00_sub_84fe:
    lda $08e0,x            // bd e0 08
    sta $e0,x              // 95 e0
    dex                    // ca
    bpl bank00_sub_84fe              // 10 f8
    ror $f3                // 66 f3
    lda $083e              // ad 3e 08
    sta $f0                // 85 f0
    lda $083f              // ad 3f 08
    sta $f1                // 85 f1
    lda $086c              // ad 6c 08
    sta $ed                // 85 ed
    sec                    // 38
    sbc #$13               // e9 13
    bcs bank00_sub_851e              // b0 02
    lda #$eb               // a9 eb
bank00_sub_851e:
    sta $e9                // 85 e9
    ldy $0872              // ac 72 08
    cpy #$d0               // c0 d0
    bcc bank00_sub_852d              // 90 06
    cpy #$e0               // c0 e0
    bcs bank00_sub_852d              // b0 02
    ldy #$fd               // a0 fd
bank00_sub_852d:
    sty $f8                // 84 f8
    ldx #$00               // a2 00
    lda #$40               // a9 40
    sta $2b                // 85 2b
    sty $2c                // 84 2c
    sec                    // 38
    adc #$3d               // 69 3d
    sta $3b                // 85 3b
    sty $3c                // 84 3c
    sec                    // 38
    adc #$38               // 69 38
bank00_sub_8541:
    sta $02,x              // 95 02
    sty $03,x              // 94 03
    clc                    // 18
    adc #$20               // 69 20
    bcc bank00_sub_854b              // 90 01
    iny                    // c8
bank00_sub_854b:
    inx                    // e8
    inx                    // e8
    cpx #$0e               // e0 0e
    bne bank00_sub_8541              // d0 f0
    lda #$20               // a9 20
    sta $0c                // 85 0c
    sta $0d                // 85 0d
    sta $0e                // 85 0e
    sta $0f                // 85 0f
    sta $10                // 85 10
    sta $3d                // 85 3d
    sta $3e                // 85 3e
    jsr bank00_sub_8033              // 20 33 80
    lda #$47               // a9 47
    ldy #$83               // a0 83
    jsr bank00_sub_8af5              // 20 f5 8a
    lda #$de               // a9 de
    ldy #$83               // a0 83
    jsr bank00_sub_8af5              // 20 f5 8a
    lda #$96               // a9 96
    ldy #$84               // a0 84
    jsr bank00_sub_8af5              // 20 f5 8a
    ldx #$70               // a2 70
bank00_sub_857b:
    lda $8586,x            // bd 86 85
    sta $60,x              // 95 60
    dex                    // ca
    bpl bank00_sub_857b              // 10 f8
    jmp $0060              // 4c 60 00
    .byte $20, $8a, $9e, $a2, $25, $bd, $3a, $80, $95, $3a, $ca, $d0, $f8, $bd, $00, $81    // data $8586
    .byte $9d, $00, $01, $ca, $d0, $f7, $a6, $ed, $9a, $68, $68, $68, $68, $a2, $00, $b5    // data $8596
    .byte $e0, $48, $e8, $e0, $04, $d0, $f8, $24, $f3, $30, $26, $ad, $08, $dc, $06, $ec    // data $85a6
    .byte $30, $03, $8d, $08, $dc, $ad, $08, $dd, $06, $ec, $30, $03, $8d, $08, $dd, $a5    // data $85b6
    .byte $e8, $85, $00, $a5, $eb, $8d, $00, $de, $a9, $34, $85, $01, $a2, $0a, $4c, $11    // data $85c6
    .byte $00, $a2, $00, $bd, $00, $01, $9d, $00, $81, $e8, $d0, $f7, $20, $b2, $9e, $a2    // data $85d6
    .byte $fb, $9a, $4c, $0c, $8c    // data $85e6
bank00_sub_85eb:
    ldx #$00               // a2 00
    lda $08eb              // ad eb 08
    cmp #$06               // c9 06
    beq bank00_sub_85f5              // f0 01
    inx                    // e8
bank00_sub_85f5:
    jsr bank00_sub_8722              // 20 22 87
    ldx #$03               // a2 03
bank00_sub_85fa:
    ldy $0837,x            // bc 37 08
    lda $08c4,x            // bd c4 08
    sta $0837,x            // 9d 37 08
    tya                    // 98
    sta $08c4,x            // 9d c4 08
    ldy $0833,x            // bc 33 08
    lda $08d4,x            // bd d4 08
    sta $0833,x            // 9d 33 08
    tya                    // 98
    sta $08d4,x            // 9d d4 08
    cpx #$03               // e0 03
    bcs bank00_sub_8632              // b0 1a
    lda $082d,x            // bd 2d 08
    cmp #$ff               // c9 ff
    bne bank00_sub_8625              // d0 06
    lda $08dd,x            // bd dd 08
    sta $082d,x            // 9d 2d 08
bank00_sub_8625:
    lda $0830,x            // bd 30 08
    cmp #$ff               // c9 ff
    bne bank00_sub_8632              // d0 06
    lda $08cd,x            // bd cd 08
    sta $0830,x            // 9d 30 08
bank00_sub_8632:
    dex                    // ca
    bpl bank00_sub_85fa              // 10 c5
    lda #$7f               // a9 7f
    sta $08cd              // 8d cd 08
    sta $08dd              // 8d dd 08
    lda #$10               // a9 10
    sta $08ce              // 8d ce 08
    sta $08cf              // 8d cf 08
    sta $08de              // 8d de 08
    sta $08df              // 8d df 08
    ldx #$0e               // a2 0e
bank00_sub_864d:
    lda $082d,x            // bd 2d 08
    sta $2d,x              // 95 2d
    dex                    // ca
    bpl bank00_sub_864d              // 10 f8
    lda $082e              // ad 2e 08
    sta $0833              // 8d 33 08
    lda $082f              // ad 2f 08
    sta $0834              // 8d 34 08
    ldy #$31               // a0 31
    ldx #$c4               // a2 c4
    jsr bank00_sub_866b              // 20 6b 86
    iny                    // c8
    ldx #$d4               // a2 d4
bank00_sub_866b:
    jsr bank00_sub_8671              // 20 71 86
    iny                    // c8
    inx                    // e8
    inx                    // e8
bank00_sub_8671:
    lda $0800,y            // b9 00 08
    and #$41               // 29 41
    lsr                  // 4a
    bne bank00_sub_8691              // d0 18
    bcc bank00_sub_8691              // 90 16
    lda $0800,x            // bd 00 08
    adc $083c              // 6d 3c 08
    sta $0800,x            // 9d 00 08
    lda $0801,x            // bd 01 08
    adc $083d              // 6d 3d 08
    bcc bank00_sub_868e              // 90 02
    lda #$ff               // a9 ff
bank00_sub_868e:
    sta $0801,x            // 9d 01 08
bank00_sub_8691:
    lda $0800,x            // bd 00 08
    clc                    // 18
    adc #$08               // 69 08
    sta $0800,x            // 9d 00 08
    bcc bank00_sub_869f              // 90 03
    inc $0801,x            // fe 01 08
bank00_sub_869f:
    rts                    // 60
bank00_sub_86a0:
    sei                    // 78
    ldx #$00               // a2 00
bank00_sub_86a3:
    lda $08c0,x            // bd c0 08
    sta $dc00,x            // 9d 00 dc
    lda $08d0,x            // bd d0 08
    sta $dd00,x            // 9d 00 dd
    inx                    // e8
    cpx #$10               // e0 10
    bne bank00_sub_86a3              // d0 ef
    lda #$1f               // a9 1f
    sta $d418              // 8d 18 d4
    jsr bank00_sub_8ab6              // 20 b6 8a
    lda $08aa              // ad aa 08
    sta $d01a              // 8d 1a d0
    lda $08a1              // ad a1 08
    sta $d011              // 8d 11 d0
bank00_sub_86c8:
    bit $d011              // 2c 11 d0
    bpl bank00_sub_86c8              // 10 fb
    ldx #$00               // a2 00
    ldy #$01               // a0 01
    lda $33                // a5 33
    sta $dd04              // 8d 04 dd
    lda $34                // a5 34
    sty $dd0e              // 8c 0e dd
    sta $dd05              // 8d 05 dd
    stx $dd0e              // 8e 0e dd
    lda $35                // a5 35
    sta $dd06              // 8d 06 dd
    lda $36                // a5 36
    sty $dd0f              // 8c 0f dd
    sta $dd07              // 8d 07 dd
    stx $dd0f              // 8e 0f dd
    lda $37                // a5 37
    sta $dc04              // 8d 04 dc
    lda $38                // a5 38
    sty $dc0e              // 8c 0e dc
    sta $dc05              // 8d 05 dc
    stx $dc0e              // 8e 0e dc
    lda $39                // a5 39
    sta $dc06              // 8d 06 dc
    lda $3a                // a5 3a
    sty $dc0f              // 8c 0f dc
    sta $dc07              // 8d 07 dc
    stx $dc0f              // 8e 0f dc
    lda $dc0d              // ad 0d dc
    lda $dd0d              // ad 0d dd
    lda $2d                // a5 2d
    sta $dd0d              // 8d 0d dd
    lda $30                // a5 30
    sta $dc0d              // 8d 0d dc
    rts                    // 60
bank00_sub_8722:
    ldy #$2e               // a0 2e
bank00_sub_8724:
    lda $8731,y            // b9 31 87
    sta $03ff,y            // 99 ff 03
    dey                    // 88
    bne bank00_sub_8724              // d0 f7
    ldy #$14               // a0 14
    jmp $0400              // 4c 00 04
    .byte $a9, $23, $8d, $00, $de, $b9, $00, $fe, $99, $00, $9e, $c8, $c0, $f8, $d0, $f5    // data $8732
    .byte $a0, $14, $8a, $99, $00, $9e, $88, $10, $fa, $a0, $07, $8a, $30, $07, $f0, $08    // data $8742
    .byte $a0, $00, $ad, $14, $fe, $99, $f8, $9e, $88, $10, $fa, $4c, $b2, $9e    // data $8752
bank00_api_09:
    jsr bank00_sub_9941              // 20 41 99
bank00_sub_8763:
    sty $24                // 84 24
    pla                    // 68
    sta $22                // 85 22
    pla                    // 68
    sta $23                // 85 23
    stx $8d                // 86 8d
    lda $d6                // a5 d6
    sta $25                // 85 25
    ldy #$00               // a0 00
bank00_sub_8773:
    iny                    // c8
    lda ($22),y            // b1 22
    beq bank00_sub_879b              // f0 23
    cmp #$01               // c9 01
    bne bank00_sub_8788              // d0 0c
    iny                    // c8
    lda ($22),y            // b1 22
    tax                    // aa
bank00_sub_8780:
    jsr bank00_sub_87ad              // 20 ad 87
    dex                    // ca
    bne bank00_sub_8780              // d0 fa
    beq bank00_sub_8773              // f0 eb
bank00_sub_8788:
    cmp #$2a               // c9 2a
    bne bank00_sub_8796              // d0 0a
    jsr bank00_sub_87ad              // 20 ad 87
    lda #$2d               // a9 2d
    jsr $e716              // 20 16 e7
    lda #$20               // a9 20
bank00_sub_8796:
    jsr $e716              // 20 16 e7
    bcc bank00_sub_8773              // 90 d8
bank00_sub_879b:
    tya                    // 98
    clc                    // 18
    adc $22                // 65 22
    tay                    // a8
    lda $23                // a5 23
    adc #$00               // 69 00
    pha                    // 48
    tya                    // 98
    pha                    // 48
    ldy $24                // a4 24
    ldx $8d                // a6 8d
    clc                    // 18
    rts                    // 60
bank00_sub_87ad:
    lda #$20               // a9 20
    jmp $e716              // 4c 16 e7
bank00_sub_87b2:
    jsr bank00_sub_8b9d              // 20 9d 8b
    jmp b00_title          // was: jsr bank00_sub_8763 (20 63 87) printing the
                           // stock inline title below -- rerouted to b00_title
                           // (same 3 bytes), which prints the extended
                           // "BY COUNT ZERO + HDN" version and jumps back to
                           // $87e5. The inline string below is now dead data.
    .byte $93    // undocumented opcode
    ora ($09,x)            // 01 09
    .byte $43    // undocumented opcode
    eor $4542,y            // 59 42 45
    .byte $52    // undocumented opcode
    bvc $8817              // 50 55
    lsr $2058              // 4e 58 20
    .byte $52    // undocumented opcode
    eor $54                // 45 54
    .byte $52    // undocumented opcode
    .byte $4f    // undocumented opcode
    jsr $4552              // 20 52 45
    bvc bank00_sub_881b              // 50 4c
    eor ($59,x)            // 41 59
    ora $0e01              // 0d 01 0e
    .byte $42    // undocumented opcode
    eor $4320,y            // 59 20 43
    .byte $4f    // undocumented opcode
    eor $4e,x              // 55 4e
    .byte $54    // undocumented opcode
    jsr $455a              // 20 5a 45
    .byte $52    // undocumented opcode
    .byte $4f    // undocumented opcode
    ora $0d0d              // 0d 0d 0d
    brk                    // 00
    .byte $18    // data $87e5
bank00_sub_87e6:
    ldx #$25               // a2 25
    lda #$63               // a9 63
bank00_sub_87ea:
    sta $0479,x            // 9d 79 04
    bcc bank00_sub_87f5              // 90 06
    sta $04f1,x            // 9d f1 04
    sta $0631,x            // 9d 31 06
bank00_sub_87f5:
    dex                    // ca
    bpl bank00_sub_87ea              // 10 f2
    rts                    // 60
bank00_sub_87f9:
    lda #$87               // a9 87
    ldy #$81               // a0 81
    jsr bank00_sub_9898              // 20 98 98
    jsr bank00_sub_9f03              // 20 03 9f
    .byte $57    // undocumented opcode
    .byte $80    // undocumented opcode
    sec                    // 38
    jsr bank00_sub_87e6              // 20 e6 87
    lda #$00               // a9 00
    sta $0882              // 8d 82 08
    jsr bank00_sub_927a              // 20 7a 92
bank00_sub_8811:
    jsr bank00_api_13              // 20 a5 8a
    ldx #$0f               // a2 0f
bank00_sub_8816:
    cmp $8835,x            // dd 35 88
    beq bank00_sub_8820              // f0 05
bank00_sub_881b:
    dex                    // ca
    bpl bank00_sub_8816              // 10 f8
    bmi bank00_sub_8811              // 30 f1
bank00_sub_8820:
    stx $3f                // 86 3f
    txa                    // 8a
    asl                  // 0a
    tax                    // aa
    lda $8846,x            // bd 46 88
    pha                    // 48
    lda $8845,x            // bd 45 88
    pha                    // 48
    php                    // 08
    jsr $de9d              // 20 9d de
    jsr bank00_sub_9974              // 20 74 99
    rti                    // 40
    .byte $85, $86, $88, $4d, $45, $44, $54, $50, $56, $53, $4b, $4c, $58, $43, $5a, $00    // data $8835
    .byte $e6, $84, $ec, $84, $65, $8b, $2f, $82, $69, $97, $90, $8a, $27, $9a, $a9, $92    // data $8845
    .byte $63, $88, $ff, $92, $cb, $91, $79, $91, $ae, $88, $71, $88, $99, $92, $ad, $f1    // data $8855
    .byte $de, $8d, $f2, $02, $20, $03, $9f, $4b, $80, $4c, $0c, $80, $20, $63, $87, $45    // data $8865
    .byte $44, $49, $54, $20, $4d, $4f, $44, $45, $3a, $0d, $0d, $20, $20, $41, $2a, $31    // data $8875
    .byte $58, $31, $0d, $20, $20, $42, $2a, $31, $58, $32, $0d, $20, $20, $43, $2a, $32    // data $8885
    .byte $58, $31, $0d, $20, $20, $44, $2a, $32, $58, $32, $0d, $00, $a2, $44, $20, $47    // data $8895
    .byte $99, $20, $03, $9f, $1b, $80, $4c, $0c, $80, $20, $a5, $89, $a2, $00, $86, $f9    // data $88a5
    .byte $86, $f8, $ad, $00, $09, $c9, $aa, $d0, $03, $4c, $ae, $89, $20, $63, $87, $0d    // data $88b5
    .byte $48, $4f, $57, $20, $4d, $41, $4e, $59, $20, $4c, $49, $56, $45, $53, $20, $4e    // data $88c5
    .byte $4f, $57, $20, $3f, $20, $00, $58, $a2, $15, $a0, $19, $20, $5d, $80, $20, $79    // data $88d5
    .byte $00, $f0, $07, $20, $9e, $b7, $e0, $00, $d0, $01, $60, $86, $c4, $a2, $02, $86    // data $88e5
    .byte $fc, $a9, $a6, $85, $fb, $a0, $00, $a9, $fb, $8d, $b7, $02, $e6, $fb, $d0, $04    // data $88f5
    .byte $e6, $fc, $f0, $4e, $20, $b3, $02, $10, $f3, $c9, $ce, $f0, $0d, $c9, $de, $f0    // data $8905
    .byte $09, $c9, $c6, $f0, $04, $c9, $d6, $d0, $e3, $18, $08, $c8, $20, $b3, $02, $85    // data $8915
    .byte $fd, $c8, $20, $b3, $02, $a0, $00, $28, $b0, $01, $98, $85, $fe, $a9, $fd, $8d    // data $8925
    .byte $b7, $02, $20, $b3, $02, $85, $ff, $c5, $c4, $f0, $0e, $38, $e9, $01, $c5, $c4    // data $8935
    .byte $f0, $07, $38, $e9, $2f, $c5, $c4, $d0, $ae, $20, $69, $8a, $20, $2a, $8a, $4c    // data $8945
    .byte $fc, $88, $98, $f0, $77, $20, $63, $87, $0d, $41, $42, $4f, $52, $54, $45, $44    // data $8955
    .byte $00, $a9, $00, $f0, $2e, $20, $63, $87, $0d, $4c, $4f, $53, $45, $20, $41, $20    // data $8965
    .byte $4c, $49, $46, $45, $20, $41, $4e, $44, $20, $52, $45, $46, $52, $45, $45, $5a    // data $8975
    .byte $45, $0d, $3c, $52, $2f, $53, $3e, $20, $54, $4f, $20, $41, $42, $4f, $52, $54    // data $8985
    .byte $00, $a9, $aa, $8d, $00, $09, $20, $03, $9f, $3f, $80, $90, $03, $8d, $00, $09    // data $8995
    .byte $a2, $01, $a9, $99, $a0, $09, $4c, $12, $80, $84, $fa, $a6, $f8, $20, $7f, $8a    // data $89a5
    .byte $86, $f8, $f0, $18, $c6, $ff, $a9, $fd, $8d, $b7, $02, $20, $b3, $02, $c5, $ff    // data $89b5
    .byte $d0, $e9, $20, $69, $8a, $20, $2a, $8a, $e6, $fa, $d0, $df, $a6, $f9, $f0, $85    // data $89c5
    .byte $9d, $02, $09, $9d, $03, $09, $ca, $ca, $ca, $bd, $02, $09, $85, $fd, $bd, $03    // data $89d5
    .byte $09, $85, $fe, $8a, $38, $e9, $05, $aa, $90, $11, $a5, $fe, $dd, $03, $09, $d0    // data $89e5
    .byte $07, $a5, $fd, $dd, $02, $09, $f0, $eb, $4c, $6a, $89, $a2, $00, $20, $7f, $8a    // data $89f5
    .byte $f0, $12, $a9, $fb, $8d, $b7, $02, $8d, $ae, $02, $20, $b3, $02, $49, $63, $20    // data $8a05
    .byte $a7, $02, $d0, $e9, $20, $63, $87, $0d, $41, $43, $54, $49, $56, $41, $54, $45    // data $8a15
    .byte $44, $00, $4c, $66, $89, $20, $63, $87, $0d, $50, $4f, $4b, $45, $20, $00, $a5    // data $8a25
    .byte $fc, $a6, $fb, $20, $cd, $bd, $a9, $2c, $20, $d2, $ff, $a0, $00, $a9, $fb, $8d    // data $8a35
    .byte $b7, $02, $20, $b3, $02, $49, $63, $aa, $48, $a9, $00, $20, $cd, $bd, $e6, $d3    // data $8a45
    .byte $e6, $d3, $a5, $fc, $20, $92, $9c, $a5, $fb, $20, $92, $9c, $e6, $d3, $68, $a0    // data $8a55
    .byte $00, $4c, $92, $9c, $a6, $f9, $a0, $fb, $b9, $00, $00, $9d, $02, $09, $e8, $d0    // data $8a65
    .byte $03, $ee, $20, $d0, $c8, $d0, $f1, $86, $f9, $60, $a0, $fb, $bd, $02, $09, $99    // data $8a75
    .byte $00, $00, $e8, $c8, $d0, $f6, $a5, $fb, $05, $fc, $60, $a9, $08, $cd, $77, $08    // data $8a85
    .byte $90, $02, $85, $ba, $20, $02, $9f, $21, $80, $20, $03, $9f, $3f, $80, $d0, $0a    // data $8a95
bank00_api_13:
    lda #$00               // a9 00
    sta $c6                // 85 c6
    cli                    // 58
bank00_sub_8aaa:
    jsr $ffe4              // 20 e4 ff
    beq bank00_sub_8aaa              // f0 fb
    cmp #$03               // c9 03
    bne bank00_sub_8adf              // d0 2c
    jmp ($0334)            // 6c 34 03
bank00_sub_8ab6:
    sei                    // 78
    ldx #$2e               // a2 2e
bank00_sub_8ab9:
    lda $0890,x            // bd 90 08
    sta $d000,x            // 9d 00 d0
    dex                    // ca
    bpl bank00_sub_8ab9              // 10 f7
    lda $dd00              // ad 00 dd
    and #$fc               // 29 fc
    ora $08d0              // 0d d0 08
    sta $dd00              // 8d 00 dd
    lda $08a1              // ad a1 08
    ora #$10               // 09 10
    sta $d011              // 8d 11 d0
    lda #$f0               // a9 f0
    sta $d01a              // 8d 1a d0
    lda #$0f               // a9 0f
    sta $d019              // 8d 19 d0
bank00_sub_8adf:
    rts                    // 60
    .byte $20, $b6, $8a, $20, $3d, $8b, $20, $5d, $8b    // data $8ae0
bank00_sub_8ae9:
    ldx #$d8               // a2 d8
bank00_api_10:
    lda #$af               // a9 af
    ldy #$8b               // a0 8b
    bne bank00_sub_8af5              // d0 04
bank00_sub_8af1:
    lda #$df               // a9 df
    ldy #$8b               // a0 8b
bank00_sub_8af5:
    sta $0100              // 8d 00 01
    lda $a9                // a5 a9
    pha                    // 48
    lda $aa                // a5 aa
    pha                    // 48
    lda $0100              // ad 00 01
    sta $a9                // 85 a9
    sty $aa                // 84 aa
    sei                    // 78
    ldy #$d2               // a0 d2
bank00_sub_8b08:
    dey                    // 88
    lda ($a9),y            // b1 a9
    sta $0100,y            // 99 00 01
    tya                    // 98
    bne bank00_sub_8b08              // d0 f7
    pla                    // 68
    sta $aa                // 85 aa
    pla                    // 68
    sta $a9                // 85 a9
    jmp $0100              // 4c 00 01
    .byte $20, $3d, $8b, $a9, $88, $a0, $08, $d0, $2c, $a9, $08, $a0, $88, $20, $4f, $8b    // data $8b1a
bank00_api_07:
    lda #$9f               // a9 9f
    ldy #$08               // a0 08
    jsr bank00_sub_8b4c              // 20 4c 8b
    ldx #$0e               // a2 0e
bank00_sub_8b33:
    lda $08f0,x            // bd f0 08
    sta $082d,x            // 9d 2d 08
    dex                    // ca
    bpl bank00_sub_8b33              // 10 f7
    rts                    // 60
bank00_sub_8b3d:
    ldx #$0e               // a2 0e
bank00_sub_8b3f:
    lda $082d,x            // bd 2d 08
    sta $08f0,x            // 9d f0 08
    dex                    // ca
    bpl bank00_sub_8b3f              // 10 f7
    lda #$08               // a9 08
    ldy #$9f               // a0 9f
bank00_sub_8b4c:
    ldx #$01               // a2 01
    bit $02a2              // 2c a2 02
    jmp bank00_sub_8015              // 4c 15 80
bank00_api_12:
    lda #$02               // a9 02
    ldy #$82               // a0 82
    ldx #$08               // a2 08
    jmp bank00_sub_8012              // 4c 12 80
    .byte $a9, $04, $a0, $84, $a2, $06, $d0, $f5, $20, $e0, $8a, $58, $20, $e4, $ff, $f0    // data $8b5d
    .byte $fb, $a2, $00, $c9, $86, $f0, $05, $e8, $c9, $87, $d0, $05, $fe, $20, $d0, $b0    // data $8b6d
    .byte $eb, $c9, $20, $f0, $04, $c9, $03, $d0, $e3, $20, $5d, $8b, $20, $2a, $8b, $a2    // data $8b7d
    .byte $0e, $bd, $20, $d0, $9d, $b0, $08, $ca, $10, $f7, $20, $a3, $fd, $20, $a0, $e5    // data $8b8d
bank00_sub_8b9d:
    jsr bank00_sub_9f03              // 20 03 9f
    rol                  // 2a
    .byte $80    // undocumented opcode
    ldx #$06               // a2 06
    ldy #$06               // a0 06
    stx $d020              // 8e 20 d0
    sty $d021              // 8c 21 d0
    jmp bank00_sub_995b              // 4c 5b 99
    .byte $20, $ba, $9e, $8e, $15, $01, $e8, $e8, $8e, $1d, $01, $a2, $02, $b9, $00, $97    // data $8baf
    .byte $48, $29, $0f, $99, $00, $d8, $68, $4a, $4a, $4a, $4a, $99, $00, $da, $c8, $d0    // data $8bbf
    .byte $ec, $ee, $15, $01, $ee, $1d, $01, $ee, $0f, $01, $ca, $d0, $e0, $4c, $b2, $9e    // data $8bcf
    .byte $20, $8a, $9e, $a0, $00, $a2, $02, $b9, $00, $da, $0a, $0a, $0a, $0a, $8d, $17    // data $8bdf
    .byte $01, $b9, $00, $d8, $29, $0f, $09, $ff, $99, $00, $97, $c8, $d0, $e9, $ee, $09    // data $8bef
    .byte $01, $ee, $13, $01, $ee, $1a, $01, $ca, $d0, $dd, $4c, $b2, $9e, $a2, $fe, $86    // data $8bff
    .byte $92, $a9, $71, $a0, $8d, $20, $f5, $8a, $a2, $00, $bd, $a9, $9c, $9d, $00, $08    // data $8c0f
    .byte $b5, $00, $9d, $00, $09, $e0, $5a, $b0, $06, $bd, $c8, $86, $9d, $50, $0d, $e8    // data $8c1f
    .byte $d0, $e8, $a2, $15, $bd, $80, $80, $9d, $e9, $08, $ca, $10, $f7, $a9, $97, $a0    // data $8c2f
    .byte $0b, $20, $4f, $8b, $a9, $81, $a0, $0a, $20, $4c, $8b, $a2, $7a, $bd, $00, $8d    // data $8c3f
    .byte $9d, $60, $09, $ca, $10, $f7, $a5, $90, $8d, $61, $09, $a5, $91, $8d, $62, $09    // data $8c4f
    .byte $a9, $73, $a0, $8c, $20, $f5, $8a, $a6, $8e, $a4, $8f, $86, $ae, $84, $af, $20    // data $8c5f
    .byte $03, $9f, $24, $80, $e6, $01, $a9, $aa, $85, $8e, $a9, $0d, $85, $8f, $b1, $90    // data $8c6f
    .byte $91, $8e, $e6, $8e, $d0, $02, $e6, $8f, $e6, $90, $d0, $f2, $e6, $91, $d0, $ee    // data $8c7f
    .byte $a5, $8e, $38, $e9, $ab, $8d, $1a, $08, $49, $ff, $8d, $1f, $08, $a5, $8f, $e9    // data $8c8f
    .byte $00, $8d, $1d, $08, $c6, $01, $20, $8a, $9e, $a2, $4f, $bd, $90, $9f, $9d, $00    // data $8c9f
    .byte $0d, $ca, $10, $f7, $ad, $ec, $9f, $0a, $6e, $81, $08, $ad, $6c, $9f, $8d, $34    // data $8caf
    .byte $08, $a9, $35, $8d, $01, $09, $ad, $ee, $9f, $aa, $ad, $ef, $9f, $a8, $0d, $ee    // data $8cbf
    .byte $9f, $f0, $1a, $8e, $c5, $09, $8c, $c6, $09, $e8, $d0, $01, $c8, $8e, $ca, $09    // data $8ccf
    .byte $8c, $cb, $09, $a2, $08, $a9, $ea, $9d, $d8, $08, $ca, $10, $fa, $ad, $ec, $9f    // data $8cdf
    .byte $a2, $8d, $0a, $30, $03, $8e, $b2, $09, $0a, $30, $03, $8e, $b8, $09, $4c, $b2    // data $8cef
    .byte $9e, $ad, $ff, $ff, $e6, $61, $d0, $02, $e6, $62, $60, $20, $60, $00, $aa, $20    // data $8cff
    .byte $60, $00, $91, $dc, $c8, $f0, $2c, $ca, $d0, $f8, $f0, $05, $20, $60, $00, $85    // data $8d0f
    .byte $84, $20, $60, $00, $c9, $ff, $f0, $e3, $91, $dc, $c8, $d0, $f4, $f0, $14, $06    // data $8d1f
    .byte $df, $90, $04, $26, $df, $c6, $97, $46, $ff, $90, $e1, $20, $60, $00, $91, $dc    // data $8d2f
    .byte $c8, $d0, $f8, $e6, $dd, $d0, $e8, $e6, $01, $ad, $12, $d0, $c9, $80, $d0, $f9    // data $8d3f
    .byte $ad, $08, $dc, $ad, $08, $dc, $ad, $08, $dd, $ad, $08, $dd, $ea, $ea, $ea, $ea    // data $8d4f
    .byte $ea, $c6, $01, $a9, $ff, $8d, $60, $00, $a9, $ff, $8d, $60, $00, $a2, $0a, $4c    // data $8d5f
    .byte $11, $00, $a9, $7b, $8d, $11, $d0, $e6, $01, $84, $90, $84, $91, $84, $dc, $84    // data $8d6f
    .byte $dd, $a9, $80, $85, $df, $c6, $dd, $a9, $00, $18, $69, $01, $f0, $55, $c6, $01    // data $8d7f
    .byte $ee, $20, $d0, $e6, $01, $a0, $00, $d1, $dc, $f0, $ee, $c8, $d0, $f9, $85, $94    // data $8d8f
    .byte $84, $93, $88, $20, $8d, $01, $e8, $88, $c0, $ff, $f0, $04, $d1, $dc, $f0, $f6    // data $8d9f
    .byte $e0, $01, $f0, $1f, $e0, $00, $f0, $10, $e0, $04, $b0, $0c, $86, $95, $c6, $95    // data $8daf
    .byte $f0, $11, $20, $8f, $01, $18, $90, $f6, $66, $93, $8a, $20, $8f, $01, $a5, $94    // data $8dbf
    .byte $20, $8f, $01, $c0, $ff, $d0, $cc, $a5, $93, $f0, $12, $a5, $94, $20, $8f, $01    // data $8dcf
    .byte $18, $90, $0a, $a0, $ff, $20, $8d, $01, $88, $c0, $ff, $d0, $f8, $26, $e0, $46    // data $8ddf
    .byte $df, $90, $05, $66, $df, $ee, $7c, $01, $c6, $92, $d0, $89, $c6, $01, $60, $b1    // data $8def
    .byte $dc, $a2, $00, $e4, $90, $d0, $02, $c6, $91, $c6, $90, $81, $90, $60, $bd, $05    // data $8dff
    .byte $01, $38, $e9, $02, $9d, $05, $01, $b0, $03, $de, $06, $01, $68, $a8, $68, $aa    // data $8e0f
    .byte $4c, $3b, $ee, $8a, $ba, $fe, $03, $01, $d0, $03, $fe, $04, $01, $aa, $4c, $3b    // data $8e1f
    .byte $ee, $78, $48, $a9, $7f, $8d, $0d, $dd, $d0, $02, $78, $48, $ad, $0e, $dd, $48    // data $8e2f
    .byte $ad, $0f, $dd, $48, $a9, $7c, $8d, $0d, $dd, $a9, $00, $8d, $0e, $dd, $8d, $0f    // data $8e3f
    .byte $dd, $ad, $0e, $dc, $48, $ad, $0f, $dc, $48, $a9, $00, $8d, $0e, $dc, $8d, $0f    // data $8e4f
    .byte $dc, $ad, $12, $d0, $48, $d8, $8a, $48, $98, $48, $a5, $00, $48, $a9, $2f, $85    // data $8e5f
    .byte $00, $ad, $11, $d0, $29, $80, $05, $01, $48, $a9, $37, $85, $01, $a5, $5f, $48    // data $8e6f
    .byte $a0, $00, $84, $5f, $ad, $08, $dc, $48, $ad, $08, $dd, $a2, $60, $88, $d0, $fd    // data $8e7f
    .byte $ca, $d0, $fa, $cd, $08, $dd, $f0, $01, $18, $66, $5f, $68, $cd, $08, $dc, $f0    // data $8e8f
    .byte $01, $18, $66, $5f, $ad, $0b, $dc, $ad, $0b, $dd, $4c, $bb, $ee, $00, $00, $00    // data $8e9f
    .byte $00, $00, $a2, $00, $8d, $00, $de, $ca, $d0, $fd, $aa, $60, $ae, $1b, $d4, $c8    // data $8eaf
    .byte $ec, $1b, $d4, $38, $d0, $04, $98, $d0, $f6, $18, $66, $5f, $a6, $5f, $68, $85    // data $8ebf
    .byte $5f, $8a, $48, $a2, $00, $8e, $18, $d4, $88, $d0, $fd, $ca, $d0, $fa, $a9, $ee    // data $8ecf
    .byte $48, $a9, $e9, $48, $ad, $f6, $fe, $4c, $b1, $ee, $ea, $a9, $ee, $48, $a9, $f6    // data $8edf
    .byte $48, $ad, $f4, $fe, $4c, $b1, $ee, $ea, $ad, $14, $9e, $cd, $14, $fe, $d0, $12    // data $8eef
    .byte $ee, $20, $d0, $ea, $ea, $ea, $a9, $80, $48, $a9, $0b, $48, $ad, $ed, $fe, $4c    // data $8eff
    .byte $b1, $ee, $a2, $00, $b5, $00, $9d, $00, $80, $bd, $00, $01, $9d, $00, $81, $e0    // data $8f0f
    .byte $f7, $b0, $12, $e0, $13, $90, $06, $bd, $00, $fe, $9d, $00, $9e, $e0, $02, $90    // data $8f1f
    .byte $04, $a9, $00, $95, $00, $e8, $d0, $dc, $68, $85, $ec, $68, $85, $5f, $29, $7f    // data $8f2f
    .byte $85, $e7, $68, $85, $e8, $68, $85, $e5, $68, $85, $e4, $68, $85, $5e, $68, $85    // data $8f3f
    .byte $cf, $68, $85, $ce, $68, $85, $df, $68, $85, $de, $ba, $86, $6c, $68, $85, $e3    // data $8f4f
    .byte $68, $85, $e2, $68, $85, $e1, $68, $85, $e0, $ba, $86, $e6, $a2, $fb, $9a, $ac    // data $8f5f
    .byte $f5, $fe, $a2, $00, $ad, $f8, $9e, $cd, $14, $fe, $d0, $02, $a0, $0a, $84, $eb    // data $8f6f
    .byte $a0, $00, $a2, $0f, $bd, $80, $9f, $95, $80, $98, $9d, $80, $9f, $ca, $10, $f4    // data $8f7f
    .byte $a2, $aa, $a9, $55, $e4, $80, $86, $80, $8e, $80, $9f, $d0, $e5, $c5, $81, $85    // data $8f8f
    .byte $81, $8d, $81, $9f, $d0, $dc, $a2, $1d, $bd, $40, $9f, $95, $40, $ca, $10, $f8    // data $8f9f
    .byte $a9, $80, $48, $a9, $17, $48, $a9, $02, $a0, $82, $a2, $08, $4c, $41, $9e    // data $8faf
bank00_api_05:
    nop                    // ea
    lda $5f                // a5 5f
    sta $3f                // 85 3f
    lda $5e                // a5 5e
    sta $3e                // 85 3e
    lda #$0e               // a9 0e
    sta $3b                // 85 3b
    ldx #$3a               // a2 3a
    ldy #$03               // a0 03
    lda $3e                // a5 3e
    cmp #$33               // c9 33
    bcs bank00_sub_8fdc              // b0 07
    dec $3b                // c6 3b
    dec $3b                // c6 3b
    dey                    // 88
    ldx #$e4               // a2 e4
bank00_sub_8fdc:
    stx $3c                // 86 3c
    sty $3d                // 84 3d
    ldy #$10               // a0 10
    bit $3f                // 24 3f
    bmi bank00_sub_8fe8              // 30 02
    ldy #$30               // a0 30
bank00_sub_8fe8:
    lda $3e                // a5 3e
    sec                    // 38
    sbc $3b                // e5 3b
    bcs bank00_sub_8ff5              // b0 06
    cpy #$30               // c0 30
    bne bank00_sub_8ff5              // d0 02
    lda #$00               // a9 00
bank00_sub_8ff5:
    ldy #$30               // a0 30
    sta $3e                // 85 3e
    sty $3f                // 84 3f
    ldx #$65               // a2 65
    ldy #$91               // a0 91
    stx $0318              // 8e 18 03
    sty $0319              // 8c 19 03
    ldx #$2f               // a2 2f
bank00_sub_9007:
    lda $cfff,x            // bd ff cf
    sta $8f,x              // 95 8f
    dex                    // ca
    bne bank00_sub_9007              // d0 f8
    lda $aa                // a5 aa
    stx $d01a              // 8e 1a d0
    stx $a1                // 86 a1
    stx $a2                // 86 a2
bank00_sub_9018:
    ldy #$ff               // a0 ff
    sty $d019              // 8c 19 d0
    iny                    // c8
bank00_sub_901e:
    lda $d019              // ad 19 d0
    lsr                  // 4a
    bcs bank00_sub_9037              // b0 13
    dex                    // ca
    bne bank00_sub_901e              // d0 f7
    dey                    // 88
    bne bank00_sub_901e              // d0 f4
    lda $d011              // ad 11 d0
    and #$7f               // 29 7f
    sta $d011              // 8d 11 d0
    sec                    // 38
    ror $a1                // 66 a1
    bne bank00_sub_9018              // d0 e1
bank00_sub_9037:
    ldx $d012              // ae 12 d0
    lda $d011              // ad 11 d0
    ora $a1                // 05 a1
    sta $a1                // 85 a1
    stx $a2                // 86 a2
    ldx #$0c               // a2 0c
bank00_sub_9045:
    lda $dc00,x            // bd 00 dc
    sta $c0,x              // 95 c0
    lda $dd00,x            // bd 00 dd
    sta $d0,x              // 95 d0
    dex                    // ca
    bpl bank00_sub_9045              // 10 f3
    lda $dc0b              // ad 0b dc
    lda $dd0b              // ad 0b dd
    stx $dc03              // 8e 03 dc
    lda $dc01              // ad 01 dc
    sta $c1                // 85 c1
    stx $dd03              // 8e 03 dd
    lda $dd01              // ad 01 dd
    sta $d1                // 85 d1
    jsr bank00_sub_911c              // 20 1c 91
    sei                    // 78
    lda #$10               // a9 10
    sta $dc0e              // 8d 0e dc
    sta $dc0f              // 8d 0f dc
    sta $dd0e              // 8d 0e dd
    sta $dd0f              // 8d 0f dd
    ldx #$03               // a2 03
bank00_sub_907c:
    lda $c4,x              // b5 c4
    sta $37,x              // 95 37
    lda $dc04,x            // bd 04 dc
    sta $c4,x              // 95 c4
    lda $d4,x              // b5 d4
    sta $33,x              // 95 33
    lda $dd04,x            // bd 04 dd
    sta $d4,x              // 95 d4
    dex                    // ca
    bpl bank00_sub_907c              // 10 eb
    ldx #$02               // a2 02
    ldy #$01               // a0 01
bank00_sub_9095:
    lda #$80               // a9 80
    sta $dc04,x            // 9d 04 dc
    lda #$00               // a9 00
    sta $dc05,x            // 9d 05 dc
    lda $dc0d              // ad 0d dc
    lda #$19               // a9 19
    sta $dc0e,y            // 99 0e dc
bank00_sub_90a7:
    lda $dc0d              // ad 0d dc
    bpl bank00_sub_90b2              // 10 06
    and #$83               // 29 83
    ora $cd                // 05 cd
    sta $cd                // 85 cd
bank00_sub_90b2:
    dec $ff                // c6 ff
    bne bank00_sub_90a7              // d0 f1
    lda #$08               // a9 08
    sta $dc0e,y            // 99 0e dc
    dex                    // ca
    dex                    // ca
    dey                    // 88
    bpl bank00_sub_9095              // 10 d5
    ldx #$02               // a2 02
    ldy #$01               // a0 01
bank00_sub_90c4:
    lda #$80               // a9 80
    sta $dd04,x            // 9d 04 dd
    lda #$00               // a9 00
    sta $dd05,x            // 9d 05 dd
    lda $dd0d              // ad 0d dd
    lda #$19               // a9 19
    sta $dd0e,y            // 99 0e dd
bank00_sub_90d6:
    dec $ff                // c6 ff
    nop                    // ea
    bne bank00_sub_90d6              // d0 fb
    lda #$08               // a9 08
    sta $dd0e,y            // 99 0e dd
    dex                    // ca
    dex                    // ca
    dey                    // 88
    bpl bank00_sub_90c4              // 10 df
    ldx #$7f               // a2 7f
    stx $dd0d              // 8e 0d dd
    stx $dc0d              // 8e 0d dc
    lda $cd                // a5 cd
    bmi bank00_sub_90f3              // 30 02
    stx $cd                // 86 cd
bank00_sub_90f3:
    lda $dd                // a5 dd
    bmi bank00_sub_90f9              // 30 02
    stx $dd                // 86 dd
bank00_sub_90f9:
    lda #$0c               // a9 0c
    sta $7e                // 85 7e
    lda #$80               // a9 80
    sta $7f                // 85 7f
    lda #$0a               // a9 0a
    sta $78                // 85 78
    ldx #$06               // a2 06
bank00_sub_9107:
    dec $2c,x              // d6 2c
    dex                    // ca
    bne bank00_sub_9107              // d0 fb
    txa                    // 8a
    inx                    // e8
    ldy #$08               // a0 08
    jsr bank00_sub_8015              // 20 15 80
    jsr bank00_sub_804e              // 20 4e 80
    jsr bank00_sub_8b3d              // 20 3d 8b
    jmp bank00_sub_800f              // 4c 0f 80
bank00_sub_911c:
    lda $d0                // a5 d0
    and #$03               // 29 03
    sta $70                // 85 70
    tax                    // aa
    lda $9161,x            // bd 61 91
    sta $71                // 85 71
    lda $a8                // a5 a8
    tay                    // a8
    and #$0e               // 29 0e
    asl                  // 0a
    asl                  // 0a
    ora $71                // 05 71
    sta $74                // 85 74
    tya                    // 98
    and #$f0               // 29 f0
    lsr                  // 4a
    lsr                  // 4a
    ora $71                // 05 71
    sta $72                // 85 72
    tya                    // 98
    and #$08               // 29 08
    asl                  // 0a
    asl                  // 0a
    ora $71                // 05 71
    sta $73                // 85 73
    lda $a6                // a5 a6
    and #$10               // 29 10
    php                    // 08
    ldx #$00               // a2 00
    lda $a1                // a5 a1
    tay                    // a8
    and #$20               // 29 20
    beq bank00_sub_9155              // f0 02
    ldx #$02               // a2 02
bank00_sub_9155:
    plp                    // 28
    beq bank00_sub_9159              // f0 01
    inx                    // e8
bank00_sub_9159:
    stx $75                // 86 75
    tya                    // 98
    and #$40               // 29 40
    sta $76                // 85 76
    rts                    // 60
    .byte $c0, $80, $40, $00, $48, $ad, $0d, $dd, $10, $06, $29, $83, $05, $dd, $85, $dd    // data $9161
    .byte $68, $40, $20, $33, $99, $4c, $63, $87, $20, $b9, $98, $30, $3a, $8d, $83, $08    // data $9171
    .byte $48, $20, $bb, $91, $68, $85, $ba, $a2, $f4, $8e, $31, $03, $e8, $8e, $33, $03    // data $9181
    .byte $20, $01, $9f, $24, $80, $a9, $0a, $8d, $eb, $08, $20, $bb, $91, $20, $63, $87    // data $9191
    .byte $0d, $0d, $0d, $20, $54, $55, $52, $42, $4f, $4c, $49, $4e, $4b, $45, $52, $20    // data $91a1
    .byte $4f, $4b, $0d, $00, $20, $9e, $8a, $6c, $34, $03, $a9, $83, $a0, $03, $a2, $01    // data $91b1
    .byte $4c, $12, $80, $e6, $8e, $d0, $02, $e6, $8f, $60, $20, $03, $9f, $5a, $80, $a2    // data $91c1
    .byte $43, $20, $47, $99, $a0, $1e, $84, $a0, $84, $a1, $c9, $00, $f0, $0c, $c9, $01    // data $91d1
    .byte $f0, $04, $c9, $02, $f0, $02, $e6, $a0, $e6, $a1, $a2, $06, $bd, $73, $92, $95    // data $91e1
    .byte $4f, $ca, $d0, $f8, $86, $8d, $86, $8e, $a9, $04, $85, $8f, $20, $e0, $8a, $a9    // data $91f1
    .byte $2d, $a0, $92, $20, $f5, $8a, $20, $86, $8b, $a5, $8d, $48, $20, $63, $87, $0d    // data $9201
    .byte $0d, $4f, $43, $43, $55, $52, $52, $45, $4e, $43, $45, $53, $3a, $20, $00, $68    // data $9211
    .byte $aa, $a9, $00, $20, $cd, $bd, $20, $b4, $98, $4c, $9e, $8a, $a5, $01, $48, $a9    // data $9221
    .byte $37, $85, $01, $a0, $01, $e6, $8e, $d0, $04, $e6, $8f, $f0, $32, $b1, $8e, $c5    // data $9231
    .byte $a0, $f0, $04, $c5, $a1, $d0, $ee, $c8, $b1, $8e, $c9, $d0, $d0, $e5, $a0, $00    // data $9241
    .byte $b1, $8e, $a2, $02, $d5, $50, $f0, $05, $ca, $10, $f9, $30, $d6, $e6, $8d, $b5    // data $9251
    .byte $53, $91, $8e, $c8, $a9, $00, $91, $8e, $c8, $a9, $ea, $91, $8e, $d0, $c4, $68    // data $9261
    .byte $85, $01, $60, $ad, $ae, $ac, $a9, $a2, $a0    // data $9271
bank00_sub_927a:
    lda $0886              // ad 86 08
    beq bank00_sub_9298              // f0 19
    lda #$1a               // a9 1a
    sta $05f7              // 8d f7 05
    lda #$2d               // a9 2d
    sta $05f9              // 8d f9 05
    ldy #$09               // a0 09
bank00_sub_928b:
    lda $0886,y            // b9 86 08
    and #$3f               // 29 3f
    beq bank00_sub_9295              // f0 03
    sta $05fb,y            // 99 fb 05
bank00_sub_9295:
    dey                    // 88
    bpl bank00_sub_928b              // 10 f3
bank00_sub_9298:
    rts                    // 60
    .byte $ad, $86, $08, $f0, $fa, $20, $da, $99, $20, $01, $9f, $1b, $80, $4c, $f6, $92    // data $9299
    .byte $20, $63, $87, $46, $49, $4c, $45, $4e, $41, $4d, $45, $20, $3a, $20, $00, $20    // data $92a9
    .byte $62, $9f, $f0, $3c, $a9, $08, $85, $ba, $a0, $01, $b1, $bb, $c9, $2e, $d0, $30    // data $92b9
    .byte $88, $b1, $bb, $c9, $45, $d0, $29, $20, $da, $99, $20, $01, $9f, $1b, $80, $a9    // data $92c9
    .byte $00, $85, $b9, $aa, $a0, $0a, $20, $01, $9f, $d5, $ff, $b0, $16, $a0, $02, $b1    // data $92d9
    .byte $bb, $99, $84, $08, $c8, $c0, $0b, $f0, $04, $c4, $b7, $d0, $f2, $20, $00, $0a    // data $92e9
    .byte $6c, $34, $03, $4c, $46, $94, $20, $63, $87, $43, $55, $52, $52, $45, $4e, $54    // data $92f9
    .byte $20, $53, $43, $52, $45, $45, $4e, $3a, $20, $00, $ad, $a1, $08, $29, $20, $f0    // data $9309
    .byte $2e, $ad, $a6, $08, $29, $10, $f0, $16, $20, $63, $87, $4d, $55, $4c, $54, $49    // data $9319
    .byte $43, $4f, $4c, $4f, $52, $20, $50, $49, $43, $00, $a2, $00, $f0, $44, $20, $63    // data $9329
    .byte $87, $48, $49, $52, $45, $53, $20, $50, $49, $43, $00, $a2, $01, $d0, $33, $ad    // data $9339
    .byte $a6, $08, $29, $10, $f0, $19, $20, $63, $87, $4d, $55, $4c, $54, $49, $43, $4f    // data $9349
    .byte $4c, $4f, $52, $20, $53, $43, $52, $45, $45, $4e, $00, $a2, $02, $d0, $13, $20    // data $9359
    .byte $63, $87, $4e, $4f, $52, $4d, $41, $4c, $20, $53, $43, $52, $45, $45, $4e, $00    // data $9369
    .byte $a2, $03, $86, $02, $20, $03, $9f, $45, $80, $a2, $47, $20, $47, $99, $85, $3e    // data $9379
    .byte $0a, $aa, $bd, $58, $97, $85, $c3, $bd, $59, $97, $85, $c4, $bd, $4a, $97, $85    // data $9389
    .byte $a9, $bd, $4b, $97, $85, $aa, $a0, $10, $b1, $a9, $99, $4c, $00, $88, $10, $f8    // data $9399
    .byte $ad, $d0, $08, $29, $03, $49, $03, $0a, $0a, $0a, $0a, $0a, $0a, $85, $42, $85    // data $93a9
    .byte $44, $a9, $00, $85, $41, $85, $43, $6c, $c3, $00, $a6, $02, $e0, $02, $90, $b9    // data $93b9
    .byte $ad, $a8, $08, $29, $0e, $0a, $0a, $18, $65, $42, $85, $44, $4c, $8a, $95, $a6    // data $93c9
    .byte $02, $e0, $01, $f0, $a4, $ad, $a8, $08, $aa, $29, $f0, $4a, $4a, $18, $65, $44    // data $93d9
    .byte $85, $44, $4c, $8a, $95, $a9, $00, $85, $43, $a9, $d8, $85, $44, $4c, $8a, $95    // data $93e9
    .byte $a5, $02, $c9, $02, $b0, $83, $ad, $a8, $08, $29, $08, $f0, $07, $18, $a5, $44    // data $93f9
    .byte $69, $20, $85, $44, $4c, $8a, $95, $a5, $02, $f0, $03, $4c, $82, $93, $20, $9f    // data $9409
    .byte $98, $c9, $ff, $f0, $2b, $a0, $1c, $b9, $c2, $96, $99, $40, $00, $88, $10, $f7    // data $9419
    .byte $20, $82, $96, $a6, $4f, $a4, $50, $20, $6a, $98, $b0, $11, $20, $8f, $f6, $a9    // data $9429
    .byte $0b, $8d, $11, $d0, $20, $e9, $8a, $20, $43, $96, $20, $e7, $94, $20, $8f, $98    // data $9439
    .byte $4c, $b5, $91, $20, $33, $99, $20, $02, $9f, $2d, $80, $ad, $b0, $03, $c9, $ff    // data $9449
    .byte $d0, $03, $4c, $b8, $91, $20, $9f, $98, $c9, $ff, $f0, $e4, $a2, $00, $86, $ff    // data $9459
    .byte $a9, $03, $8d, $ca, $02, $a0, $12, $ad, $b0, $03, $f0, $16, $b9, $30, $97, $99    // data $9469
    .byte $4c, $00, $88, $10, $f7, $a2, $0f, $bd, $85, $80, $9d, $e9, $03, $ca, $10, $f7    // data $9479
    .byte $30, $09, $b9, $1f, $97, $99, $4c, $00, $88, $10, $f7, $20, $82, $96, $a6, $4f    // data $9489
    .byte $a4, $50, $20, $6a, $98, $b0, $44, $20, $8f, $f6, $a9, $0b, $8d, $11, $d0, $20    // data $9499
    .byte $e9, $8a, $a0, $00, $a6, $ff, $bd, $b0, $03, $99, $8c, $00, $e6, $ff, $c8, $c0    // data $94a9
    .byte $04, $d0, $f1, $a5, $8c, $c9, $ff, $f0, $16, $a5, $8f, $c9, $d8, $d0, $03, $a9    // data $94b9
    .byte $37, $2c, $a9, $34, $85, $4c, $8d, $d3, $02, $20, $26, $96, $4c, $ad, $94, $20    // data $94c9
    .byte $5b, $99, $20, $3f, $f6, $ad, $78, $08, $8d, $ca, $02, $4c, $46, $94, $a9, $40    // data $94d9
    .byte $cd, $71, $08, $90, $01, $4a, $85, $c2, $85, $af, $a2, $00, $86, $c1, $86, $ae    // data $94e9
    .byte $8a, $0a, $a8, $a9, $00, $85, $8e, $b5, $40, $20, $68, $96, $85, $8f, $b9, $45    // data $94f9
    .byte $00, $85, $8c, $b9, $46, $00, $85, $8d, $20, $26, $96, $e8, $e0, $03, $d0, $e0    // data $9509
    .byte $20, $5b, $99, $4c, $3f, $f6, $20, $33, $99, $20, $63, $87, $53, $41, $56, $45    // data $9519
    .byte $20, $4d, $45, $4d, $4f, $52, $59, $0d, $0d, $46, $52, $4f, $4d, $20, $24, $30    // data $9529
    .byte $30, $30, $30, $9d, $9d, $9d, $9d, $00, $a2, $05, $a0, $0a, $20, $66, $9f, $a0    // data $9539
    .byte $4f, $20, $cc, $95, $90, $03, $4c, $0c, $80, $20, $63, $87, $20, $20, $54, $4f    // data $9549
    .byte $20, $24, $30, $30, $30, $30, $9d, $9d, $9d, $9d, $00, $a2, $05, $a0, $0a, $20    // data $9559
    .byte $66, $9f, $a0, $4d, $20, $cc, $95, $90, $03, $4c, $0c, $80, $a5, $4e, $38, $e5    // data $9569
    .byte $50, $85, $4e, $a5, $4d, $e5, $4f, $85, $4d, $a5, $4f, $85, $43, $a5, $50, $85    // data $9579
    .byte $44, $a5, $4c, $8d, $d3, $02, $20, $9f, $98, $c9, $ff, $f0, $33, $20, $82, $96    // data $9589
    .byte $a6, $4f, $a4, $50, $20, $6a, $98, $b0, $24, $20, $8f, $f6, $a9, $0b, $8d, $11    // data $9599
    .byte $d0, $20, $e9, $8a, $a5, $4d, $85, $8c, $a5, $4e, $85, $8d, $a5, $43, $85, $8e    // data $95a9
    .byte $a5, $44, $85, $8f, $20, $26, $96, $20, $5b, $99, $20, $3f, $f6, $20, $8f, $98    // data $95b9
    .byte $4c, $b5, $91, $20, $79, $00, $c9, $24, $d0, $51, $c8, $20, $e1, $95, $b0, $4b    // data $95c9
    .byte $88, $20, $e1, $95, $b0, $45, $18, $60, $20, $73, $00, $20, $12, $96, $b0, $3b    // data $95d9
    .byte $aa, $20, $73, $00, $20, $12, $96, $b0, $32, $20, $08, $96, $99, $00, $00, $8a    // data $95e9
    .byte $20, $08, $96, $0a, $0a, $0a, $0a, $19, $00, $00, $99, $00, $00, $18, $60, $c9    // data $95f9
    .byte $41, $38, $30, $02, $e9, $07, $e9, $30, $60, $c9, $47, $b0, $0e, $c9, $41, $b0    // data $9609
    .byte $08, $c9, $3a, $b0, $06, $c9, $30, $90, $02, $18, $24, $38, $60, $a0, $00, $20    // data $9619
    .byte $b3, $02, $20, $a8, $ff, $20, $c4, $91, $c4, $8c, $d0, $05, $c6, $8d, $ee, $20    // data $9629
    .byte $d0, $c6, $8c, $a5, $8d, $05, $8c, $d0, $e4, $60, $a2, $00, $86, $8e, $e8, $8a    // data $9639
    .byte $0a, $a8, $a9, $37, $8d, $d3, $02, $a9, $d8, $18, $79, $4c, $00, $b0, $0c, $85    // data $9649
    .byte $8f, $b9, $4b, $00, $a8, $bd, $b0, $08, $20, $a7, $02, $ca, $10, $e1, $60, $c9    // data $9659
    .byte $02, $d0, $08, $a9, $37, $8d, $d3, $02, $a9, $d8, $60, $86, $02, $aa, $a9, $34    // data $9669
    .byte $8d, $d3, $02, $bd, $72, $08, $a6, $02, $60, $20, $52, $9f, $a5, $b7, $d0, $03    // data $9679
    .byte $4c, $0c, $80, $a6, $52, $f0, $13, $a5, $b7, $c9, $10, $b0, $02, $e6, $b7, $c6    // data $9689
    .byte $bb, $a0, $00, $b5, $52, $91, $bb, $ca, $d0, $ed, $a4, $b7, $c4, $51, $90, $04    // data $9699
    .byte $a4, $51, $84, $b7, $a5, $58, $f0, $10, $a4, $b7, $a2, $00, $b5, $59, $91, $bb    // data $96a9
    .byte $c8, $e6, $b7, $e8, $e4, $58, $d0, $f4, $60, $01, $00, $02, $02, $02, $40, $1f    // data $96b9
    .byte $e8, $03, $e9, $03, $ff, $ff, $e8, $03, $00, $60, $0f, $05, $81, $50, $49, $43    // data $96c9
    .byte $20, $00, $34, $e8, $03, $00, $10, $0c, $00, $00, $00, $00, $00, $00, $04, $2e    // data $96d9
    .byte $53, $43, $52, $37, $e8, $03, $00, $10, $0c, $00, $00, $00, $00, $00, $00, $04    // data $96e9
    .byte $2e, $43, $4f, $4c, $34, $40, $1f, $00, $20, $0c, $00, $00, $00, $00, $00, $00    // data $96f9
    .byte $04, $2e, $42, $4d, $50, $34, $00, $08, $00, $20, $0c, $00, $00, $00, $00, $00    // data $9709
    .byte $00, $04, $2e, $43, $48, $52, $34, $00, $08, $00, $3c, $0c, $00, $00, $00, $00    // data $9719
    .byte $00, $00, $04, $2e, $46, $4c, $49, $34, $00, $08, $f0, $3f, $0f, $02, $5e, $5e    // data $9729
    .byte $00, $00, $00, $00, $34, $00, $08, $00, $20, $10, $00, $00, $00, $00, $00, $00    // data $9739
    .byte $00, $db, $96, $fd, $96, $0e, $97, $db, $96, $ec, $96, $1f, $97, $3d, $97, $10    // data $9749
    .byte $94, $f9, $93, $c3, $93, $d8, $93, $ee, $93, $4c, $94, $1f, $95, $6c, $34, $03    // data $9759
    .byte $a9, $72, $a0, $97, $20, $2c, $99, $d0, $06, $20, $4d, $98, $a2, $fb, $9a, $20    // data $9769
    .byte $63, $87, $50, $4f, $4b, $45, $20, $00, $a2, $05, $86, $8d, $a0, $10, $20, $66    // data $9779
    .byte $9f, $20, $79, $00, $f0, $d7, $a0, $00, $b1, $7a, $f0, $dd, $c9, $2c, $f0, $03    // data $9789
    .byte $c8, $d0, $f5, $c0, $00, $f0, $d2, $84, $02, $a0, $00, $b1, $7a, $d0, $03, $4c    // data $9799
    .byte $39, $98, $c9, $24, $f0, $03, $c8, $d0, $f2, $20, $79, $00, $c9, $24, $d0, $37    // data $97a9
    .byte $a4, $02, $88, $b1, $7a, $20, $59, $98, $85, $14, $88, $f0, $30, $b1, $7a, $20    // data $97b9
    .byte $59, $98, $0a, $0a, $0a, $0a, $05, $14, $85, $14, $88, $f0, $20, $b1, $7a, $20    // data $97c9
    .byte $59, $98, $85, $15, $88, $f0, $16, $b1, $7a, $20, $59, $98, $0a, $0a, $0a, $0a    // data $97d9
    .byte $05, $15, $85, $15, $88, $f0, $06, $20, $8a, $ad, $20, $f7, $b7, $20, $79, $00    // data $97e9
    .byte $c9, $2c, $f0, $07, $20, $73, $00, $c9, $2c, $d0, $f9, $20, $73, $00, $c9, $24    // data $97f9
    .byte $d0, $28, $a0, $01, $b1, $7a, $f0, $08, $c8, $c0, $04, $d0, $f7, $4c, $72, $97    // data $9809
    .byte $88, $b1, $7a, $20, $59, $98, $85, $02, $88, $f0, $0b, $b1, $7a, $20, $59, $98    // data $9819
    .byte $0a, $0a, $0a, $0a, $05, $02, $aa, $4c, $3c, $98, $20, $9e, $b7, $4c, $3c, $98    // data $9829
    .byte $20, $eb, $b7, $8a, $a4, $14, $a2, $00, $86, $8e, $a6, $15, $86, $8f, $20, $a7    // data $9839
    .byte $02, $4c, $78, $97, $20, $63, $87, $45, $52, $52, $4f, $52, $21, $0d, $00, $60    // data $9849
    .byte $c9, $47, $90, $03, $4c, $72, $97, $c9, $41, $38, $30, $02, $e9, $07, $e9, $30    // data $9859
    .byte $60, $86, $c3, $84, $c4, $a9, $61, $85, $b9, $20, $89, $98, $a5, $ba, $20, $b1    // data $9869
    .byte $ff, $a5, $b9, $20, $93, $ff, $a5, $c3, $20, $a8, $ff, $a5, $c4, $4c, $a8, $ff    // data $9879
    .byte $20, $d5, $f3, $b0, $01, $60, $20, $b4, $98, $20, $02, $9f, $24, $80, $60    // data $9889
bank00_sub_9898:
    sta $0334              // 8d 34 03
    sty $0335              // 8c 35 03
    rts                    // 60
    .byte $ad, $77, $08, $85, $ba, $20, $b9, $98, $c9, $ff, $d0, $01, $60, $8d, $77, $08    // data $989f
    .byte $85, $ba, $20, $33, $99, $a9, $0d, $4c, $16, $e7, $20, $33, $99, $20, $63, $87    // data $98af
    .byte $20, $53, $50, $41, $43, $45, $2a, $44, $45, $56, $49, $43, $45, $3a, $20, $00    // data $98bf
    .byte $a9, $00, $a6, $ba, $e0, $08, $90, $05, $e0, $1f, $b0, $01, $2c, $a2, $08, $86    // data $98cf
    .byte $ba, $20, $cd, $bd, $20, $63, $87, $20, $0d, $52, $45, $54, $55, $52, $4e, $2a    // data $98df
    .byte $43, $4f, $4e, $54, $49, $4e, $55, $45, $0d, $91, $91, $00, $20, $e4, $ff, $c9    // data $98ef
    .byte $20, $f0, $0b, $c9, $0d, $f0, $23, $c9, $03, $d0, $f1, $a9, $ff, $60, $a5, $ba    // data $98ff
    .byte $c9, $1e, $d0, $04, $a9, $07, $85, $ba, $e6, $ba, $20, $02, $9f, $0c, $80, $f0    // data $990f
    .byte $ed, $20, $9d, $9c, $20, $3d, $99, $4c, $bc, $98, $a5, $ba, $60, $8d, $00, $03    // data $991f
    .byte $8c, $01, $03, $60, $a2, $0f, $20, $ff, $e9, $e8, $e0, $19, $d0, $f8, $a2, $0f    // data $992f
    .byte $a0, $00    // data $993f
bank00_sub_9941:
    clc                    // 18
    jmp $fff0              // 4c f0 ff
    .byte $a2, $42, $e8, $86, $3f, $20, $a5, $8a, $c9, $41, $90, $f9, $c5, $3f, $b0, $f5    // data $9945
    .byte $e9, $40, $aa, $86, $3f, $60    // data $9955
bank00_sub_995b:
    lda #$01               // a9 01
    ldy #$00               // a0 00
bank00_sub_995f:
    sta $d800,y            // 99 00 d8
    sta $d900,y            // 99 00 d9
    sta $da00,y            // 99 00 da
    sta $dae8,y            // 99 e8 da
    iny                    // c8
    bne bank00_sub_995f              // d0 f1
    lda #$1b               // a9 1b
    sta $d011              // 8d 11 d0
    rts                    // 60
bank00_sub_9974:
    ldx #$53               // a2 53
bank00_sub_9976:
    lda $9986,x            // bd 86 99
    sta $02a7,x            // 9d a7 02
    dex                    // ca
    bpl bank00_sub_9976              // 10 f7
    lda $0878              // ad 78 08
    sta $02ca              // 8d ca 02
    rts                    // 60
    .byte $8d, $e9, $02, $8e, $f7, $02, $a2, $8e, $a9, $8d, $d0, $07, $8e, $f7, $02, $a2    // data $9986
    .byte $8e, $a9, $ad, $8d, $ea, $02, $78, $98, $18, $75, $00, $8d, $eb, $02, $b5, $01    // data $9996
    .byte $69, $00, $c9, $0a, $b0, $02, $69, $80, $8d, $ec, $02, $a2, $34, $a9, $00, $b0    // data $99a6
    .byte $0b, $ad, $12, $d0, $e9, $30, $b0, $f9, $a2, $37, $a9, $23, $8d, $00, $de, $86    // data $99b6
    .byte $01, $a9, $ff, $8d, $ff, $ff, $a2, $37, $86, $01, $a2, $00, $8e, $00, $de, $a2    // data $99c6
    .byte $ff, $29, $ff, $60, $ad, $78, $08, $c9, $0a, $d0, $13, $20, $0f, $9a, $20, $1e    // data $99d6
    .byte $9a, $20, $15, $9a, $4c, $fd, $99    // data $99e6
bank00_sub_99ed:
    lda #$0a               // a9 0a
    cmp $0878              // cd 78 08
    beq bank00_sub_9a05              // f0 11
    jsr bank00_sub_9a15              // 20 15 9a
    jsr bank00_sub_9a1e              // 20 1e 9a
    jsr bank00_sub_9a0f              // 20 0f 9a
    lda $0878              // ad 78 08
    eor #$1f               // 49 1f
    sta $0878              // 8d 78 08
bank00_sub_9a05:
    jsr bank00_sub_9974              // 20 74 99
    ldy #$f7               // a0 f7
    ldx #$9e               // a2 9e
    jmp bank00_sub_9ea9              // 4c a9 9e
bank00_sub_9a0f:
    ldx #$06               // a2 06
    lda #$8a               // a9 8a
    bne bank00_sub_9a19              // d0 04
bank00_sub_9a15:
    ldx #$05               // a2 05
    lda #$90               // a9 90
bank00_sub_9a19:
    ldy #$0a               // a0 0a
    jmp bank00_sub_8012              // 4c 12 80
bank00_sub_9a1e:
    lda #$0a               // a9 0a
    ldy #$10               // a0 10
    ldx #$05               // a2 05
    jmp bank00_api_06              // 4c 5f 9c
    .byte $ad, $71, $08, $85, $8c, $a5, $f7, $48, $ad, $8a, $02, $48, $a9, $80, $8d, $8a    // data $9a27
    .byte $02, $a9, $00, $85, $f7, $ad, $72, $08, $8d, $88, $02, $85, $8d, $20, $45, $80    // data $9a37
    .byte $20, $43, $9c, $84, $a9, $20, $76, $9a, $84, $ab, $a9, $27, $85, $aa, $20, $6b    // data $9a47
    .byte $9a, $20, $43, $9c, $20, $4e, $80, $68, $85, $f7, $68, $8d, $8a, $02, $4c, $48    // data $9a57
    .byte $80, $20, $a3, $9a, $20, $23, $9c, $f0, $f8, $c9, $03, $d0, $f4, $38, $24, $18    // data $9a67
    .byte $ac, $88, $02, $c8, $c8, $c8, $84, $f4, $a9, $c0, $85, $f3, $a0, $0b, $90, $0d    // data $9a77
    .byte $b9, $3c, $03, $91, $f3, $b9, $48, $03, $99, $c0, $db, $b0, $0b, $b1, $f3, $99    // data $9a87
    .byte $3c, $03, $b9, $c0, $db, $99, $48, $03, $88, $10, $e3, $60, $20, $cb, $e8, $10    // data $9a97
    .byte $fa, $20, $04, $9b, $e0, $18, $90, $06, $a4, $9f, $c0, $0c, $90, $ed, $a5, $f7    // data $9aa7
    .byte $d0, $e9, $ad, $86, $02, $48, $ad, $21, $d0, $49, $05, $8d, $86, $02, $98, $18    // data $9ab7
    .byte $65, $d1, $48, $a5, $d2, $69, $00, $29, $03, $05, $8d, $48, $a2, $18, $a0, $00    // data $9ac7
    .byte $20, $0c, $e5, $20, $f3, $9a, $68, $a8, $68, $aa, $98, $20, $87, $9c, $20, $ff    // data $9ad7
    .byte $9a, $68, $8d, $86, $02, $a6, $9e, $a4, $9f, $4c, $0c, $e5, $a6, $9e, $20, $fa    // data $9ae7
    .byte $9a, $a6, $9f, $a9, $00, $20, $cd, $bd, $a9, $20, $4c, $d2, $ff, $a6, $d6, $e0    // data $9af7
    .byte $18, $f0, $0c, $c9, $93, $f0, $08, $c9, $04, $f0, $04, $c9, $09, $d0, $09, $20    // data $9b07
    .byte $74, $9a, $20, $1f, $9b, $4c, $76, $9a, $20, $2d, $9b, $a6, $d6, $a4, $d3, $86    // data $9b17
    .byte $9e, $84, $9f, $4c, $0c, $e5, $a5, $d7, $c9, $94, $f0, $04, $c9, $14, $d0, $1a    // data $9b27
    .byte $48, $8a, $48, $98, $48, $a5, $aa, $85, $d5, $a5, $d7, $30, $0a, $a4, $d3, $c4    // data $9b37
    .byte $a9, $d0, $01, $c8, $4c, $5c, $e7, $4c, $05, $e8, $a4, $d3, $c9, $1d, $d0, $07    // data $9b47
    .byte $c4, $aa, $f0, $02, $e6, $d3, $60, $c9, $9d, $d0, $07, $c4, $a9, $f0, $02, $c6    // data $9b57
    .byte $d3, $60, $24, $ab, $30, $0b, $c9, $20, $90, $f7, $c9, $60, $b0, $f3, $4c, $fb    // data $9b67
    .byte $9b, $a6, $d6, $c9, $11, $d0, $07, $e0, $18, $f0, $02, $e6, $d6, $60, $c9, $0d    // data $9b77
    .byte $d0, $0b, $e0, $18, $f0, $02, $e6, $d6, $a0, $00, $84, $d3, $60, $c9, $8d, $f0    // data $9b87
    .byte $f1, $c9, $91, $d0, $06, $8a, $f0, $02, $c6, $d6, $60, $a6, $d6, $c9, $04, $d0    // data $9b97
    .byte $08, $ca, $48, $48, $48, $48, $4c, $f8, $e8, $c9, $09, $d0, $0f, $20, $6c, $e9    // data $9ba7
    .byte $a2, $19, $b5, $d9, $09, $80, $95, $d9, $ca, $10, $f7, $60, $c9, $86, $d0, $04    // data $9bb7
    .byte $ee, $20, $d0, $60, $c9, $8a, $d0, $04, $ce, $20, $d0, $60, $c9, $87, $d0, $04    // data $9bc7
    .byte $ee, $21, $d0, $60, $c9, $8b, $d0, $04, $ce, $21, $d0, $60, $c9, $88, $d0, $09    // data $9bd7
    .byte $a5, $f7, $49, $01, $85, $f7, $4c, $74, $9a, $c9, $20, $b0, $07, $a0, $00, $84    // data $9be7
    .byte $d4, $4c, $16, $e7, $a8, $30, $1b, $c9, $60, $90, $04, $29, $df, $d0, $08, $29    // data $9bf7
    .byte $3f, $a6, $c7, $f0, $02, $09, $80, $ae, $86, $02, $20, $13, $ea, $a4, $d3, $4c    // data $9c07
    .byte $57, $9b, $c9, $a0, $90, $d7, $29, $7f, $09, $40, $d0, $e5, $58, $20, $e4, $ff    // data $9c17
    .byte $85, $cc, $f0, $f9, $78, $48, $a5, $cf, $f0, $0c, $a5, $ce, $ae, $87, $02, $a0    // data $9c27
    .byte $00, $84, $cf, $20, $13, $ea, $68, $85, $d7, $c9, $0d, $60, $a4, $8c, $10, $fb    // data $9c37
    .byte $ad, $d0, $08, $29, $fc, $09, $06, $8d, $00, $dd, $a5, $8d, $29, $3f, $09, $40    // data $9c47
    .byte $8d, $88, $02, $98, $a0, $40, $a2, $40    // data $9c57
bank00_api_06:
    sta $23                // 85 23
    sty $25                // 84 25
    lda #$6a               // a9 6a
    ldy #$9c               // a0 9c
    jmp bank00_sub_8042              // 4c 42 80
    .byte $84, $22, $84, $24, $e6, $01, $b1, $22, $48, $b1, $24, $91, $22, $68, $91, $24    // data $9c6a
    .byte $c8, $d0, $f3, $e6, $23, $e6, $25, $ca, $d0, $ec, $c6, $01, $60, $48, $a9, $24    // data $9c7a
    .byte $20, $16, $e7, $68, $20, $92, $9c, $8a, $48, $4a, $4a, $4a, $4a, $20, $9d, $9c    // data $9c8a
    .byte $68, $29, $0f, $18, $69, $30, $c9, $3a, $90, $02, $69, $06, $4c, $16, $e7, $00    // data $9c9a
    .byte $0b, $08, $0a, $00, $9e, $32, $30, $36, $31, $00, $00, $00, $78, $a9, $7f, $8d    // data $9caa
    .byte $0d, $dd, $a9, $34, $85, $01, $a2, $0c, $a0, $aa, $b9, $aa, $aa, $99, $aa, $ff    // data $9cba
    .byte $88, $c0, $ff, $d0, $f5, $ce, $20, $08, $ce, $1d, $08, $ec, $1d, $08, $d0, $ea    // data $9cca
    .byte $e6, $01, $a2, $e0, $9a, $c8, $b9, $00, $0a, $99, $00, $01, $b9, $00, $0b, $99    // data $9cda
    .byte $00, $d8, $4a, $4a, $4a, $4a, $99, $00, $da, $c8, $d0, $ea, $ee, $3f, $08, $ee    // data $9cea
    .byte $42, $08, $ee, $49, $08, $ce, $39, $08, $ce, $3c, $08, $10, $d9, $a2, $0e, $a9    // data $9cfa
    .byte $80, $9d, $02, $d4, $9d, $03, $d4, $a9, $21, $9d, $04, $d4, $a9, $08, $9d, $05    // data $9d0a
    .byte $d4, $a9, $80, $9d, $06, $d4, $8a, $38, $e9, $07, $aa, $10, $e2, $a0, $0f, $a9    // data $9d1a
    .byte $00, $0a, $90, $17, $a2, $ff, $8e, $0e, $d4, $8e, $0f, $d4, $8d, $13, $d4, $a2    // data $9d2a
    .byte $f0, $8e, $14, $d4, $a2, $81, $8e, $12, $d4, $a0, $1f, $8c, $18, $d4, $a0, $02    // data $9d3a
    .byte $a9, $ff, $99, $01, $dc, $99, $01, $dd, $88, $d0, $f7, $c0, $10, $b0, $0c, $b9    // data $9d4a
    .byte $30, $0d, $99, $00, $dc, $b9, $40, $0d, $99, $00, $dd, $b9, $00, $0d, $99, $00    // data $9d5a
    .byte $d0, $c8, $c0, $2f, $d0, $e5, $20, $50, $0d, $ad, $30, $03, $85, $c3, $ad, $31    // data $9d6a
    .byte $03, $85, $c8, $a9, $20, $a2, $06, $8d, $00, $de, $8d, $fe, $de, $8e, $00, $de    // data $9d7a
    .byte $c6, $01, $a0, $00, $4c, $8e, $00    // data $9d8a
bank00_sub_9d91:
    ldx #$14               // a2 14
bank00_sub_9d93:
    lda $9d9f,x            // bd 9f 9d
    sta $0100,x            // 9d 00 01
    dex                    // ca
    bpl bank00_sub_9d93              // 10 f7
    jmp $0100              // 4c 00 01
    .byte $a9, $23, $8d, $00, $de, $98, $8d, $c5, $9e, $09, $03, $8d, $94, $9e, $a9, $00    // data $9d9f
    .byte $8d, $00, $de, $60    // data $9daf
bank00_api_08:
    ldy #$80               // a0 80
    sty $b0                // 84 b0
    sty $b1                // 84 b1
    jsr bank00_sub_8060              // 20 60 80
bank00_sub_9dbc:
    ldy #$00               // a0 00
    lda ($b0),y            // b1 b0
    ldx #$95               // a2 95
    ldy $b0                // a4 b0
    jsr bank00_sub_9ea9              // 20 a9 9e
    inc $b0                // e6 b0
    bne bank00_sub_9dcd              // d0 02
    inc $b1                // e6 b1
bank00_sub_9dcd:
    lda $b0                // a5 b0
    cmp #$80               // c9 80
    bne bank00_sub_9dbc              // d0 e9
    rts                    // 60
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9dd4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9de4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9df4
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9e04
    .byte $30, $a5, $01, $8d, $2e, $de, $09, $03, $85, $01, $a9, $08, $8d, $00, $de, $2c    // data $9e14
    .byte $80, $80, $2c, $80, $80, $2c, $80, $80, $ea, $a9, $37, $85, $01, $a9, $0a, $8d    // data $9e24
    .byte $00, $de, $00, $00, $00, $00, $00, $00, $00, $00, $00, $38, $24, $18, $20, $7f    // data $9e34
    .byte $de, $8d, $58, $de, $8d, $61, $de, $8c, $5e, $de, $8c, $65, $de, $8e, $a5, $de    // data $9e44
    .byte $a0, $00, $b9, $00, $00, $aa, $90, $07, $b9, $00, $00, $99, $00, $00, $8a, $99    // data $9e54
    .byte $00, $00, $c8, $d0, $ed, $ce, $a5, $de, $f0, $44, $ea, $ea, $ea, $ee, $58, $de    // data $9e64
    .byte $ee, $61, $de, $ee, $5e, $de, $ee, $65, $de, $d0, $d7, $08, $48, $a9, $fb, $cd    // data $9e74
    .byte $12, $d0, $d0, $fb, $68, $28, $20, $ba, $de, $48, $a9, $23, $8d, $00, $de, $a9    // data $9e84
    .byte $23, $8d, $00, $de, $68, $8e, $b1, $de, $60, $20, $ba, $de, $8e, $a5, $de, $b9    // data $9e94
    .byte $00, $00, $4c, $b2, $de    // data $9ea4
bank00_sub_9ea9:
    jsr $deba              // 20 ba de
    jsr $de8d              // 20 8d de
    sta.a $0000,y            // 99 00 00
    pha                    // 48
    lda #$00               // a9 00
    sta $de00              // 8d 00 de
    pla                    // 68
    rts                    // 60
    .byte $48, $78, $a9, $00, $48, $a9, $20, $8d, $00, $de, $a9, $20, $8d, $00, $de, $68    // data $9eba
    .byte $8d, $b4, $de, $68, $60, $ea, $ea, $ea, $6c, $fc, $ff, $ea, $ea, $ea, $ea, $ea    // data $9eca
    .byte $ea, $6c, $f8, $ff, $8d, $00, $de, $68, $40, $ea, $85, $9e, $68, $8d, $00, $de    // data $9eda
    .byte $a5, $9e, $60, $00, $00, $08, $10, $18, $20, $02, $23, $06, $43, $00, $00, $00    // data $9eea
    .byte $00, $00, $00, $00, $00, $00, $ea    // data $9efa
bank00_sub_9f01:
    nop                    // ea
    nop                    // ea
bank00_sub_9f03:
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
    sta $a9                // 85 a9
    clc                    // 18
    adc #$02               // 69 02
    tax                    // aa
    pla                    // 68
    sta $aa                // 85 aa
    adc #$00               // 69 00
    pha                    // 48
    txa                    // 8a
    pha                    // 48
    lda $a9                // a5 a9
    bne bank00_sub_9f26              // d0 02
    dec $aa                // c6 aa
bank00_sub_9f26:
    dec $a9                // c6 a9
    ldy #$00               // a0 00
    lda ($a9),y            // b1 a9
    sec                    // 38
    sbc #$00               // e9 00
    tax                    // aa
    lda #$00               // a9 00
    pha                    // 48
    lda #$de               // a9 de
    pha                    // 48
    lda #$e2               // a9 e2
    pha                    // 48
    ldy #$03               // a0 03
    lda ($a9),y            // b1 a9
    pha                    // 48
    dey                    // 88
    lda ($a9),y            // b1 a9
    pha                    // 48
    lda $a8                // a5 a8
    pha                    // 48
    lda $a5                // a5 a5
    pha                    // 48
    lda $deee,x            // bd ee de
    ldx $a6                // a6 a6
    ldy $a7                // a4 a7
    jmp $dede              // 4c de de
    .byte $20, $63, $87, $0d, $46, $49, $4c, $45, $4e, $41, $4d, $45, $20, $3a, $20, $00    // data $9f52
    .byte $a2, $0b, $a0, $19, $86, $a9, $84, $aa, $84, $ab, $a2, $08, $a0, $02, $20, $bd    // data $9f62
    .byte $ff, $86, $7a, $84, $7b, $20, $23, $9c, $f0, $05, $20, $1f, $9b, $10, $f6, $a2    // data $9f72
    .byte $00, $a4, $a9, $88, $c8, $b1, $d1, $29, $3f, $f0, $08, $85, $02, $06, $02, $24    // data $9f82
    .byte $02, $70, $02, $09, $40, $9d, $08, $02, $e8, $c4, $aa, $d0, $e7, $bd, $07, $02    // data $9f92
    .byte $c9, $20, $d0, $03, $ca, $d0, $f6, $86, $b7, $a9, $00, $9d, $08, $02, $20, $b4    // data $9fa2
    .byte $98, $8a, $60, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fb2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fc2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fd2
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fe2
    .byte $00, $00, $00, $00, $00, $00, $22, $ee, $39, $ee, $0d, $ee, $30, $ee    // data $9ff2