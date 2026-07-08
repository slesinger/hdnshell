// disassembly for rr38p-tmp12reu.bin bank 5
// bank file offset: $a000-$bfff
// cartridge window: $8000-$9fff
// vectors: coldstart=$8009, warmstart=$800c, signature=c3 c2 cd 38 30
// reachable instructions: 69 bytes decoded as code: 113
// entry points: $8009, $800c, $800f
// jump table from cold start:
//   $8009 -> $fcef
//   $800c -> $800f
// external branch/jsr/jmp targets: $dede, $f6bc, $f6ed, $fcef, $fe72

// symbol table (auto-generated)
//   $8009 bank05_cold_start
//   $800c bank05_warm_start
//   $800f bank05_api_01
//   $801a bank05_sub_801a
//   $9f01 bank05_sub_9f01
//   $9f2b bank05_sub_9f2b
//   $fcef bank05_api_00

// external symbol equates
.const bank05_api_00 = $fcef

.pc = $8000

    .byte $09, $80, $0c, $80, $c3, $c2, $cd, $38, $30    // data $8000
bank05_cold_start:
    jmp bank05_api_00              // 4c ef fc
bank05_warm_start:
    jmp bank05_api_01              // 4c 0f 80
bank05_api_01:
    jsr $f6bc              // 20 bc f6
    jsr $f6ed              // 20 ed f6
    beq bank05_sub_801a              // f0 03
    jmp $fe72              // 4c 72 fe
bank05_sub_801a:
    ldx #$fb               // a2 fb
    txs                    // 9a
    jsr bank05_sub_9f01              // 20 01 9f
    .byte $0c    // undocumented opcode
    .byte $80    // undocumented opcode
    brk                    // 00

// prints the low nibble of A as one hex digit (diagnostic use, see
// hondani_shell_entry's error-code print). Relocated here from the $9e00
// pocket, which didn't have room left after net_read_and_print grew.
diag_hexdigit:
    and #$0f
    cmp #$0a
    bcc !digit+
    clc
    adc #$37                 // 10-15 -> 'A'-'F'
    jmp $ffd2
!digit:
    clc
    adc #$30                 // 0-9 -> '0'-'9'
    jmp $ffd2
diag_hexdigit_end:

    .fill $8100 - diag_hexdigit_end, $00    // remaining confirmed-free bytes, unused so far
    .byte $4c, $b7, $80    // data $8100 (unchanged original code resumes here)
    .byte $4c, $ea, $81, $01, $00, $54, $4d, $50, $20, $31, $2e, $32, $20, $20, $20, $52    // data $8103
    .byte $45, $55, $20, $4c, $2f, $a2, $40, $01, $00, $00, $01, $0c, $0f, $07, $0b, $09    // data $8113
    .byte $09, $ff, $ff, $2d, $2d, $2d, $2d, $02, $5f, $91, $20, $20, $20, $20, $20, $20    // data $8123
    .byte $20, $20, $20, $20, $20, $20, $20, $02, $5f, $33, $20, $20, $20, $20, $20, $20    // data $8133
    .byte $20, $20, $20, $20, $20, $20, $20, $02, $5f, $11, $20, $20, $20, $20, $20, $20    // data $8143
    .byte $20, $20, $20, $20, $20, $20, $20, $02, $5f, $d2, $20, $20, $20, $20, $20, $20    // data $8153
    .byte $20, $20, $20, $20, $20, $20, $20, $54, $55, $52, $42, $4f, $30, $00, $08, $00    // data $8163
    .byte $ff, $0a, $18, $02, $00, $00, $eb, $17, $0f, $00, $00, $00, $00, $f8, $14, $00    // data $8173
    .byte $00, $00, $ac, $8b, $02, $c0, $03, $90, $03, $ce, $8b, $02, $20, $9f, $ff, $4c    // data $8183
    .byte $7e, $ea, $78, $a0, $31, $a2, $ea, $8c, $14, $03, $8e, $15, $03, $58, $60, $20    // data $8193
    .byte $b8, $8c, $a2, $03, $20, $8b, $8e, $a9, $12, $20, $81, $92, $c9, $59, $f0, $01    // data $81a3
    .byte $60, $8d, $ec, $7f, $78, $a9, $37, $85, $01, $20, $81, $ff, $20, $84, $ff, $a0    // data $81b3
    .byte $85, $a2, $80, $8c, $14, $03, $8e, $15, $03, $a9, $36, $85, $01, $a9, $00, $8d    // data $81c3
    .byte $03, $dd, $8d, $80, $84, $20, $bf, $e3, $ad, $01, $dc, $29, $20, $f0, $0d, $a0    // data $81d3
    .byte $05, $88, $30, $0b, $b9, $6a, $80, $d9, $ec, $7f, $f0, $f5, $20, $68, $81, $78    // data $81e3
    .byte $20, $a0, $a4, $a9, $80, $8d, $8a, $02, $20, $44, $e5, $a9, $0e, $20, $d2, $ff    // data $81f3
    .byte $a2, $02, $20, $9c, $8e, $20, $70, $a1, $a2, $23, $20, $31, $8b, $20, $8e, $8e    // data $8203
    .byte $20, $70, $a1, $e0, $02, $b0, $04, $a9, $00, $f0, $0a, $e0, $04, $b0, $04, $a9    // data $8213
    .byte $03, $d0, $02, $a9, $07, $8d, $70, $80, $18, $69, $30, $8d, $a2, $91, $8d, $c6    // data $8223
    .byte $91, $a5, $ba, $c9, $08, $b0, $04, $a9, $07, $85, $ba, $20, $84, $88, $90, $03    // data $8233
    .byte $20, $3f, $88, $20, $02, $8e, $ad, $1b, $80, $8d, $20, $d0, $ad, $1c, $80, $8d    // data $8243
    .byte $21, $d0, $a9, $00, $8d, $7e, $80, $8d, $11, $cb, $85, $c6, $20, $3a, $a1, $20    // data $8253
    .byte $ba, $82, $4c, $45, $84, $a0, $04, $b9, $6a, $80, $99, $ec, $7f, $88, $10, $f7    // data $8263
    .byte $c8, $8c, $04, $cb, $8c, $05, $cb, $8c, $0c, $cb, $8c, $0d, $cb, $8c, $06, $cb    // data $8273
    .byte $8c, $07, $cb, $8c, $0a, $cb, $8c, $0b, $cb, $8c, $13, $cb, $ad, $24, $80, $8d    // data $8283
    .byte $0f, $cb, $ad, $25, $80, $8d, $10, $cb, $ad, $22, $80, $8d, $00, $cb, $ad, $23    // data $8293
    .byte $80, $8d, $0e, $cb, $a9, $60, $8d, $00, $ec, $a9, $ec, $8d, $30, $ec, $a9, $60    // data $82a3
    .byte $8d, $19, $cb, $a9, $ec, $8d, $1a, $cb, $a9, $eb, $8d, $01, $cb, $a9, $7f, $8d    // data $82b3
    .byte $02, $cb, $a0, $16, $8c, $12, $cb, $c8, $a9, $7f, $99, $28, $cb, $88, $10, $fa    // data $82c3
    .byte $a0, $18, $a9, $00, $99, $00, $cc, $88, $10, $fa, $a0, $bf, $a9, $20, $99, $40    // data $82d3
    .byte $cb, $88, $10, $fa, $4c, $c7, $97, $a5, $01, $48, $78, $a0, $00, $84, $01, $38    // data $82e3
    .byte $ad, $06, $cb, $ed, $08, $cb, $48, $ad, $07, $cb, $ed, $09, $cb, $8d, $72, $80    // data $82f3
    .byte $68, $aa, $b0, $16, $20, $2c, $82, $e8, $d0, $fa, $ee, $72, $80, $d0, $f5, $20    // data $8303
    .byte $65, $82, $8d, $03, $cb, $68, $85, $01, $58, $60, $e8, $ca, $d0, $05, $ce, $72    // data $8313
    .byte $80, $30, $ec, $20, $48, $82, $4c, $1e, $82, $ee, $06, $cb, $d0, $03, $ee, $07    // data $8323
    .byte $cb, $20, $65, $82, $29, $3f, $18, $ed, $01, $cb, $49, $ff, $8d, $01, $cb, $90    // data $8333
    .byte $03, $ce, $02, $cb, $60, $20, $65, $82, $29, $3f, $18, $6d, $01, $cb, $8d, $01    // data $8343
    .byte $cb, $90, $03, $ee, $02, $cb, $ad, $06, $cb, $d0, $03, $ce, $07, $cb, $ce, $06    // data $8353
    .byte $cb, $60, $18, $ad, $06, $cb, $85, $39, $ad, $07, $cb, $69, $cc, $85, $3a, $b1    // data $8363
    .byte $39, $60, $20, $b8, $8c, $18, $ad, $0a, $cb, $6d, $0d, $cb, $aa, $ad, $0b, $cb    // data $8373
    .byte $69, $00, $a8, $60, $20, $f0, $e9, $20, $24, $ea, $a0, $27, $b1, $3b, $c9, $20    // data $8383
    .byte $f0, $12, $aa, $29, $1f, $8d, $a6, $82, $8a, $4a, $4a, $4a, $4a, $4a, $aa, $bd    // data $8393
    .byte $b2, $82, $09, $00, $91, $d1, $ad, $7b, $80, $91, $f3, $88, $10, $de, $60, $80    // data $83a3
    .byte $20, $00, $40, $c0, $60, $40, $60, $a9, $00, $8d, $7a, $80, $20, $cd, $82, $ee    // data $83b3
    .byte $7a, $80, $ad, $7a, $80, $c9, $17, $90, $f3, $60, $48, $20, $de, $82, $68, $aa    // data $83c3
    .byte $a9, $00, $a0, $02, $85, $3b, $84, $3c, $4c, $87, $82, $18, $6d, $0a, $cb, $8d    // data $83d3
    .byte $08, $cb, $ad, $0b, $cb, $69, $00, $8d, $09, $cb, $20, $ea, $81, $20, $93, $a4    // data $83e3
    .byte $b0, $33, $ad, $06, $cb, $cd, $3c, $cb, $ad, $07, $cb, $ed, $3d, $cb, $90, $1e    // data $83f3
    .byte $ad, $13, $cb, $cd, $3f, $cb, $90, $16, $ad, $3e, $cb, $cd, $06, $cb, $ad, $3f    // data $8403
    .byte $cb, $ed, $07, $cb, $90, $08, $18, $ad, $21, $80, $8d, $7b, $80, $60, $ad, $1f    // data $8413
    .byte $80, $8d, $7b, $80, $60, $ad, $20, $80, $8d, $7b, $80, $60, $ad, $84, $80, $49    // data $8423
    .byte $80, $8d, $84, $80, $60, $2c, $84, $80, $30, $60, $a9, $e6, $a0, $83, $85, $39    // data $8433
    .byte $84, $3a, $20, $a4, $8e, $2c, $0f, $cb, $30, $05, $a9, $20, $8d, $1a, $01, $2c    // data $8443
    .byte $10, $cb, $30, $05, $a9, $20, $8d, $18, $01, $a0, $00, $ad, $0c, $cb, $a2, $02    // data $8453
    .byte $20, $31, $8b, $20, $36, $84, $8a, $a2, $07, $20, $31, $8b, $a2, $0f, $ad, $15    // data $8463
    .byte $cb, $20, $0a, $8b, $ad, $14, $cb, $20, $0a, $8b, $a5, $ba, $a0, $00, $a2, $1d    // data $8473
    .byte $20, $31, $8b, $ad, $07, $80, $a0, $00, $a2, $25, $20, $31, $8b, $ad, $06, $80    // data $8483
    .byte $a0, $00, $a2, $27, $20, $31, $8b, $4c, $cf, $83, $a9, $0e, $a0, $84, $85, $39    // data $8493
    .byte $84, $3a, $20, $a4, $8e, $ac, $05, $cb, $ad, $04, $cb, $a2, $04, $20, $31, $8b    // data $84a3
    .byte $a2, $0a, $ad, $1a, $cb, $20, $0a, $8b, $ad, $19, $cb, $20, $0a, $8b, $a2, $24    // data $84b3
    .byte $ad, $15, $cb, $20, $0a, $8b, $ad, $14, $cb, $20, $0a, $8b, $ad, $7b, $80, $48    // data $84c3
    .byte $ad, $1e, $80, $8d, $7b, $80, $20, $24, $a1, $a2, $18, $20, $87, $82, $68, $8d    // data $84d3
    .byte $7b, $80, $60, $58, $3a, $20, $20, $20, $4c, $3a, $20, $20, $20, $20, $20, $42    // data $84e3
    .byte $3a, $24, $20, $20, $20, $20, $20, $49, $4e, $3a, $43, $2f, $4c, $20, $23, $3a    // data $84f3
    .byte $20, $20, $20, $42, $41, $4e, $4b, $3a, $20, $2f, $a0, $4c, $42, $4c, $3a, $20    // data $8503
    .byte $20, $20, $20, $2f, $24, $20, $20, $20, $20, $2d, $24, $46, $44, $33, $30, $20    // data $8513
    .byte $20, $20, $20, $20, $53, $52, $43, $3a, $24, $30, $38, $30, $30, $2d, $24, $20    // data $8523
    .byte $20, $20, $a0, $18, $ad, $0a, $cb, $6d, $0d, $cb, $aa, $ad, $0b, $cb, $69, $00    // data $8533
    .byte $a8, $60, $a2, $fa, $9a, $a9, $06, $85, $01, $58, $20, $38, $83, $2c, $7e, $80    // data $8543
    .byte $10, $06, $ae, $0d, $cb, $20, $d3, $82, $ae, $0d, $cb, $20, $7f, $84, $8d, $7c    // data $8553
    .byte $80, $2c, $11, $cb, $30, $0c, $20, $ce, $84, $20, $23, $85, $20, $e8, $85, $4c    // data $8563
    .byte $45, $84, $c9, $5f, $d0, $f6, $8d, $11, $cb, $4c, $45, $84, $a9, $00, $f0, $03    // data $8573
    .byte $4c, $2a, $8a, $a9, $28, $8d, $05, $dc, $20, $f0, $e9, $a9, $00, $8d, $7c, $80    // data $8583
    .byte $20, $bc, $84, $a9, $46, $2c, $11, $cb, $10, $01, $4a, $aa, $88, $d0, $03, $ca    // data $8593
    .byte $f0, $ee, $a5, $c6, $f0, $f6, $20, $e4, $ff, $aa, $ad, $7c, $80, $f0, $03, $20    // data $85a3
    .byte $bc, $84, $8a, $a2, $40, $8e, $05, $dc, $60, $ac, $0c, $cb, $b1, $d1, $49, $80    // data $85b3
    .byte $91, $d1, $ad, $7c, $80, $49, $ff, $8d, $7c, $80, $60, $a2, $13, $ca, $30, $16    // data $85c3
    .byte $dd, $ea, $84, $d0, $f8, $20, $de, $84, $4c, $45, $84, $8a, $0a, $aa, $bd, $fe    // data $85d3
    .byte $84, $48, $bd, $fd, $84, $48, $60, $91, $11, $1d, $9d, $8d, $0d, $14, $94, $85    // data $85e3
    .byte $88, $89, $8c, $86, $8a, $87, $8b, $13, $03, $93, $3b, $86, $85, $86, $d5, $86    // data $85f3
    .byte $c6, $86, $05, $87, $eb, $86, $15, $87, $ed, $8b, $5d, $87, $88, $87, $7a, $87    // data $8603
    .byte $b1, $87, $33, $87, $36, $87, $39, $87, $3c, $87, $0e, $87, $2e, $83, $e1, $94    // data $8613
    .byte $c9, $5f, $d0, $21, $58, $20, $e4, $ff, $f0, $fb, $a2, $35, $ca, $30, $08, $dd    // data $8623
    .byte $49, $85, $d0, $f8, $20, $3d, $85, $4c, $45, $84, $8a, $0a, $aa, $bd, $7f, $85    // data $8633
    .byte $48, $bd, $7e, $85, $48, $60, $94, $41, $5f, $31, $20, $5a, $14, $43, $45, $57    // data $8643
    .byte $33, $34, $35, $4d, $47, $46, $48, $4b, $42, $53, $4c, $2a, $40, $4e, $51, $9d    // data $8653
    .byte $1d, $37, $38, $91, $11, $52, $54, $59, $3a, $3b, $0d, $5e, $5c, $3d, $2f, $55    // data $8663
    .byte $d5, $cb, $49, $32, $2b, $2d, $36, $44, $21, $d2, $23, $e4, $8b, $f6, $8b, $08    // data $8673
    .byte $8c, $34, $97, $10, $8c, $2f, $86, $1e, $8c, $a1, $80, $d7, $93, $5b, $94, $fc    // data $8683
    .byte $8b, $9a, $8b, $0e, $97, $07, $95, $49, $95, $57, $96, $51, $96, $d2, $97, $54    // data $8693
    .byte $98, $a2, $9a, $61, $9b, $9e, $88, $78, $9c, $ba, $9c, $54, $87, $54, $87, $57    // data $86a3
    .byte $87, $83, $8b, $8a, $8b, $60, $87, $8b, $87, $85, $9d, $38, $9e, $35, $9e, $c6    // data $86b3
    .byte $95, $ed, $94, $f3, $9e, $c4, $9e, $d3, $9e, $0e, $9f, $e2, $9e, $1a, $9f, $1d    // data $86c3
    .byte $9f, $c1, $97, $5b, $a0, $6e, $89, $91, $89, $89, $89, $f3, $89, $3e, $88, $26    // data $86d3
    .byte $89, $5b, $a2, $02, $8c, $20, $2b, $86, $2c, $10, $cb, $10, $17, $ad, $27, $02    // data $86e3
    .byte $c9, $20, $d0, $44, $a2, $27, $bd, $ff, $01, $9d, $00, $02, $ca, $f0, $05, $ec    // data $86f3
    .byte $0c, $cb, $b0, $f2, $ad, $7c, $80, $ae, $0c, $cb, $9d, $00, $02, $4c, $e1, $86    // data $8703
    .byte $a6, $c6, $f0, $13, $a9, $00, $85, $c6, $bd, $76, $02, $c9, $03, $d0, $08, $20    // data $8713
    .byte $8b, $95, $a2, $05, $4c, $60, $8e, $60, $ad, $7e, $80, $d0, $0b, $ad, $0d, $cb    // data $8723
    .byte $20, $de, $82, $a9, $ff, $8d, $7e, $80, $60, $20, $b8, $8c, $ad, $0d, $cb, $c9    // data $8733
    .byte $05, $b0, $26, $ac, $0a, $cb, $98, $0d, $0b, $cb, $f0, $18, $ce, $0a, $cb, $98    // data $8743
    .byte $d0, $03, $ce, $0b, $cb, $a9, $04, $20, $70, $86, $a9, $d8, $20, $70, $86, $a9    // data $8753
    .byte $00, $4c, $cd, $82, $ad, $0d, $cb, $f0, $03, $ce, $0d, $cb, $60, $a2, $00, $86    // data $8763
    .byte $3d, $85, $3e, $a2, $70, $8e, $75, $80, $18, $69, $03, $8d, $76, $80, $a9, $28    // data $8773
    .byte $4c, $36, $92, $20, $b8, $8c, $ad, $0d, $cb, $c9, $12, $90, $1d, $a9, $01, $20    // data $8783
    .byte $3a, $a1, $b0, $0f, $a9, $04, $20, $b1, $86, $a9, $d8, $20, $b1, $86, $a9, $16    // data $8793
    .byte $4c, $cd, $82, $ad, $0d, $cb, $c9, $16, $b0, $03, $ee, $0d, $cb, $60, $a2, $28    // data $87a3
    .byte $86, $3d, $85, $3e, $a2, $98, $8e, $75, $80, $18, $69, $03, $8d, $76, $80, $a9    // data $87b3
    .byte $28, $4c, $d8, $91, $ce, $0c, $cb, $10, $09, $20, $b8, $8c, $20, $58, $87, $4c    // data $87c3
    .byte $3c, $86, $60, $ad, $0c, $cb, $c9, $27, $a9, $00, $90, $09, $b0, $28, $ad, $0c    // data $87d3
    .byte $cb, $c9, $27, $b0, $1e, $ee, $0c, $cb, $60, $ad, $0e, $cb, $2c, $0f, $cb, $10    // data $87e3
    .byte $15, $8d, $0c, $cb, $20, $2b, $86, $20, $b8, $8c, $20, $c0, $87, $9a, $92, $ca    // data $87f3
    .byte $c9, $d3, $bf, $ee, $ee, $4a, $86, $ae, $8a, $d2, $bd, $8c, $d2, $8d, $8b, $01    // data $8803
    .byte $e4, $b5, $92, $8f, $2d, $33, $ae, $96, $72, $2e, $73, $af, $97, $59, $85, $fb    // data $8813
    .byte $58, $6b, $0c, $e1, $21, $00, $ca, $07, $01, $86, $2b, $f7, $7d, $85, $2c, $76    // data $8823
    .byte $33, $a5, $2b, $a9, $bc, $71, $a8, $4c, $ae, $a7, $df, $03, $6a, $08, $b4, $3e    // data $8833
    .byte $80, $88, $90, $98, $00, $ff, $10, $d0, $6a, $af, $3b, $10, $b6, $e2, $8e, $16    // data $8843
    .byte $62, $85, $ad, $11, $14, $05, $92, $e4, $af, $97, $43, $31, $8e, $ed, $99, $36    // data $8853
    .byte $8e, $30, $69, $05, $f2, $10, $69, $04, $45, $e5, $e6, $e4, $62, $91, $80, $91    // data $8863
    .byte $9a, $15, $46, $05, $90, $f0, $1c, $cd, $9f, $43, $40, $89, $ff, $45, $55, $0e    // data $8873
    .byte $85, $55, $c0, $38, $2c, $fb, $2d, $8e, $b2, $66, $14, $1a, $c4, $b8, $16, $f0    // data $8883
    .byte $ba, $32, $2c, $4b, $b2, $75, $4c, $c1, $41, $cc, $69, $ac, $90, $0e, $b9, $96    // data $8893
    .byte $4e, $11, $a6, $80, $8e, $c0, $37, $81, $1b, $c1, $8d, $c6, $82, $e3, $c2, $71    // data $88a3
    .byte $83, $b8, $c3, $bd, $db, $b3, $9d, $00, $c4, $dd, $1a, $71, $df, $a8, $1f, $05    // data $88b3
    .byte $8d, $d4, $16, $4d, $ea, $31, $51, $17, $cb, $32, $97, $4d, $f3, $54, $f1, $c9    // data $88c3
    .byte $58, $e7, $ed, $ed, $08, $9b, $cc, $da, $d3, $3f, $e1, $d1, $c9, $bb, $ae, $9a    // data $88d3
    .byte $22, $d0, $ce, $bf, $f3, $8c, $7d, $23, $4e, $dc, $4b, $f7, $65, $bc, $31, $32    // data $88e3
    .byte $e4, $50, $99, $00, $c0, $f0, $cf, $f8, $61, $9e, $ee, $a1, $ad, $32, $b3, $37    // data $88f3
    .byte $c5, $ee, $65, $a9, $15, $ed, $a6, $d0, $ee, $67, $64, $a6, $97, $ba, $32, $69    // data $8903
    .byte $4f, $2b, $8c, $02, $d9, $4c, $8d, $ef, $d3, $9a, $2a, $17, $53, $12, $d2, $a8    // data $8913
    .byte $cc, $4d, $17, $9d, $9d, $2e, $76, $26, $99, $c8, $41, $da, $f6, $e0, $07, $9f    // data $8923
    .byte $6e, $24, $83, $77, $f0, $4a, $0b, $9d, $8a, $c9, $6c, $69, $31, $6e, $fa, $2a    // data $8933
    .byte $bd, $be, $c5, $6f, $e8, $dd, $c8, $c0, $1d, $e0, $77, $a5, $a2, $86, $28, $5d    // data $8943
    .byte $8b, $b8, $02, $56, $3e, $e0, $90, $d0, $d1, $ef, $71, $0e, $4b, $89, $17, $3e    // data $8953
    .byte $a9, $17, $d4, $19, $fb, $97, $85, $2a, $6b, $b2, $86, $20, $e5, $87, $cb, $25    // data $8963
    .byte $96, $91, $ec, $5d, $b9, $44, $72, $56, $58, $e5, $cb, $d0, $7d, $f0, $43, $ef    // data $8973
    .byte $f9, $04, $1b, $25, $4f, $44, $21, $d0, $63, $50, $95, $95, $a2, $ee, $50, $ad    // data $8983
    .byte $51, $d8, $3d, $e2, $31, $4c, $19, $ef, $38, $d8, $ba, $d6, $a9, $67, $f0, $5e    // data $8993
    .byte $1f, $28, $a0, $03, $71, $40, $53, $e3, $a2, $27, $bd, $78, $04, $9d, $3f, $52    // data $89a3
    .byte $c1, $ca, $ee, $f7, $bd, $ad, $bb, $37, $a9, $47, $07, $ca, $f5, $2d, $38, $1a    // data $89b3
    .byte $51, $3d, $4c, $ef, $3b, $5f, $84, $c9, $09, $9d, $35, $d8, $17, $c6, $f2, $c2    // data $89c3
    .byte $a8, $a3, $98, $56, $4c, $ad, $a6, $9f, $bd, $b6, $1f, $8d, $d8, $f9, $e0, $43    // data $89d3
    .byte $cc, $fd, $75, $16, $22, $c4, $ef, $04, $75, $16, $83, $6e, $18, $a9, $a6, $6d    // data $89e3
    .byte $a3, $ed, $19, $34, $82, $2e, $40, $b0, $1a, $1c, $22, $15, $a9, $a3, $ea, $fe    // data $89f3
    .byte $86, $02, $dc, $36, $0c, $17, $06, $3d, $04, $34, $1b, $fa, $04, $ba, $37, $30    // data $8a03
    .byte $fd, $ee, $ca, $c3, $be, $16, $b5, $f1, $bc, $0c, $fa, $c7, $bd, $84, $b7, $4c    // data $8a13
    .byte $d8, $38, $ae, $bf, $62, $ac, $15, $76, $fc, $dd, $27, $c9, $ff, $ef, $14, $b8    // data $8a23
    .byte $a4, $b7, $dc, $b4, $94, $6a, $da, $f8, $f7, $e0, $2e, $bb, $53, $76, $bc, $ca    // data $8a33
    .byte $91, $de, $09, $eb, $40, $8c, $92, $1d, $47, $87, $58, $07, $15, $8d, $00, $de    // data $8a43
    .byte $c7, $07, $92, $fe, $17, $0d, $32, $71, $51, $22, $d1, $18, $57, $4a, $10, $71    // data $8a53
    .byte $aa, $d9, $4e, $30, $8a, $4b, $26, $99, $87, $0b, $28, $78, $30, $2b, $90, $0d    // data $8a63
    .byte $fd, $b2, $03, $36, $f4, $b2, $1a, $30, $41, $45, $ea, $55, $84, $c9, $42, $d0    // data $8a73
    .byte $e3, $fa, $08, $56, $a1, $09, $91, $02, $14, $10, $b3, $5d, $18, $22, $98, $38    // data $8a83
    .byte $a9, $16, $35, $53, $7a, $4c, $c6, $ed, $9b, $8d, $b6, $03, $4c, $e5, $39, $b9    // data $8a93
    .byte $85, $bb, $99, $9e, $9e, $a0, $f3, $fd, $cc, $90, $f3, $ae, $49, $23, $a0, $6f    // data $8aa3
    .byte $53, $ba, $44, $c0, $48, $a2, $ae, $c6, $2d, $ff, $58, $e8, $20, $b9, $1d, $1e    // data $8ab3
    .byte $8d, $9b, $68, $8b, $f0, $11, $df, $15, $90, $00, $c6, $02, $0e, $22, $a1, $0a    // data $8ac3
    .byte $d9, $29, $3d, $f6, $96, $00, $87, $f6, $94, $86, $04, $01, $4d, $34, $55, $bd    // data $8ad3
    .byte $87, $c0, $fe, $08, $d0, $2d, $b9, $b2, $3d, $65, $35, $4e, $f0, $23, $21, $bb    // data $8ae3
    .byte $f5, $19, $01, $62, $f5, $c9, $28, $7c, $84, $a9, $91, $c8, $a9, $a9, $37, $ae    // data $8af3
    .byte $4c, $e1, $3a, $a7, $fe, $4f, $4e, $93, $17, $ad, $bb, $16, $16, $dc, $a9, $84    // data $8b03
    .byte $8d, $c5, $c0, $44, $a0, $88, $36, $03, $f7, $dd, $82, $de, $48, $22, $93, $38    // data $8b13
    .byte $68, $9d, $ac, $c0, $f5, $6e, $49, $3e, $d0, $14, $43, $f0, $07, $c9, $53, $7d    // data $8b23
    .byte $f9, $78, $2c, $a9, $58, $3c, $d1, $1a, $8d, $83, $11, $3e, $a9, $82, $e3, $cc    // data $8b33
    .byte $ad, $01, $34, $a5, $00, $71, $cc, $da, $68, $79, $9d, $7a, $c1, $3f, $aa, $96    // data $8b43
    .byte $3e, $79, $d0, $a9, $0d, $e5, $b9, $40, $3b, $03, $c8, $c8, $c4, $b7, $d0, $f5    // data $8b53
    .byte $9f, $0d, $15, $20, $91, $89, $16, $ae, $a7, $27, $a8, $1e, $a0, $02, $cb, $2e    // data $8b63
    .byte $5d, $48, $ef, $6e, $03, $ec, $60, $a9, $20, $37, $9d, $68, $a8, $b1, $d1, $8f    // data $8b73
    .byte $53, $67, $68, $8b, $a0, $10, $76, $0b, $76, $2a, $00, $4a, $18, $6d, $47, $e2    // data $8b83
    .byte $aa, $bd, $8e, $aa, $dc, $22, $bf, $3e, $58, $ce, $9e, $f3, $34, $06, $91, $8f    // data $8b93
    .byte $95, $30, $4c, $68, $e6, $4e, $13, $ee, $85, $c9, $bc, $97, $91, $76, $2c, $7c    // data $8ba3
    .byte $80, $18, $a8, $0a, $ee, $19, $60, $88, $38, $ea, $70, $78, $66, $71, $e9, $39    // data $8bb3
    .byte $4f, $69, $95, $14, $55, $c9, $62, $b0, $10, $ad, $15, $f1, $22, $7b, $18, $86    // data $8bc3
    .byte $24, $67, $b2, $6c, $18, $cf, $a1, $81, $20, $0a, $23, $9c, $55, $a3, $f0, $18    // data $8bd3
    .byte $da, $84, $03, $52, $19, $ce, $a8, $61, $0e, $54, $68, $ad, $0f, $bd, $47, $0a    // data $8be3
    .byte $aa, $ec, $aa, $24, $90, $50, $ba, $e4, $9a, $68, $67, $f0, $22, $cb, $25, $2b    // data $8bf3
    .byte $38, $41, $3b, $a3, $ed, $c4, $1a, $2d, $3d, $b8, $7d, $8b, $14, $c9, $01, $f0    // data $8c03
    .byte $fc, $57, $ed, $0e, $ad, $ec, $6b, $65, $18, $27, $91, $a2, $a9, $be, $5b, $59    // data $8c13
    .byte $ae, $a2, $ca, $ed, $f0, $8a, $54, $29, $b6, $ee, $e7, $fe, $5c, $1e, $1d, $ba    // data $8c23
    .byte $be, $e9, $e7, $f0, $69, $b1, $3e, $d1, $9a, $f9, $6d, $e6, $2d, $48, $20, $42    // data $8c33
    .byte $f1, $5d, $59, $55, $67, $45, $3c, $c9, $4e, $4f, $d0, $f2, $e1, $ce, $25, $f5    // data $8c43
    .byte $a0, $d5, $3b, $ff, $91, $fe, $88, $10, $be, $d2, $fc, $3c, $ee, $ab, $49, $64    // data $8c53
    .byte $da, $cb, $30, $20, $ab, $2d, $e1, $cc, $64, $bc, $46, $77, $2e, $78, $20, $d8    // data $8c63
    .byte $5f, $2d, $a1, $dc, $0f, $fd, $77, $46, $28, $32, $f0, $3e, $78, $3f, $4b, $1c    // data $8c73
    .byte $fa, $a9, $a5, $ad, $21, $33, $29, $fe, $bb, $8d, $c9, $9d, $43, $fb, $69, $04    // data $8c83
    .byte $aa, $42, $0d, $8a, $a8, $20, $a7, $b5, $2e, $cd, $5d, $e9, $5d, $ac, $b2, $a9    // data $8c93
    .byte $10, $85, $ae, $a2, $1f, $80, $b1, $fa, $d1, $8a, $f0, $0a, $ca, $ff, $f7, $c6    // data $8ca3
    .byte $cb, $ae, $aa, $f3, $4c, $03, $3d, $fc, $8a, $b4, $8b, $27, $fa, $d0, $02, $e6    // data $8cb3
    .byte $2f, $a9, $d5, $03, $b2, $58, $69, $07, $64, $cd, $b8, $ee, $32, $a5, $6d, $f4    // data $8cc3
    .byte $19, $ab, $a5, $f5, $8a, $20, $1a, $8b, $a9, $01, $8d, $7e, $47, $60, $00, $79    // data $8cd3
    .byte $a5, $2b, $58, $78, $94, $e6, $ad, $e5, $02, $3d, $c8, $fb, $22, $42, $a5, $fa    // data $8ce3
    .byte $62, $b6, $0d, $a9, $08, $bf, $5e, $e4, $e7, $ff, $36, $13, $24, $97, $38, $23    // data $8cf3
    .byte $2b, $c6, $42, $4d, $ee, $28, $6b, $0a, $49, $aa, $9a, $88, $18, $d7, $01, $57    // data $8d03
    .byte $98, $57, $ad, $19, $57, $69, $6a, $9d, $99, $2b, $75, $6d, $8d, $10, $3f, $be    // data $8d13
    .byte $42, $37, $ad, $85, $af, $c0, $d0, $03, $e4, $88, $6a, $1a, $ad, $ee, $d0, $0b    // data $8d23
    .byte $3b, $51, $f4, $3e, $37, $1b, $23, $b2, $20, $a9, $69, $0d, $c4, $17, $f9, $00    // data $8d33
    .byte $58, $fc, $b9, $fe, $75, $40, $75, $fd, $78, $ae, $78, $0e, $a9, $80, $85, $ff    // data $8d43
    .byte $bd, $06, $22, $8d, $ff, $01, $de, $a0, $00, $b1, $fe, $91, $fc, $ff, $c8, $da    // data $8d53
    .byte $f9, $c5, $e6, $94, $d2, $ff, $aa, $a0, $aa, $ef, $e8, $a5, $fd, $af, $c9, $80    // data $8d63
    .byte $d0, $dc, $a2, $fc, $58, $c0, $dc, $40, $6e, $c1, $37, $41, $1b, $c2, $8d, $c6    // data $8d73
    .byte $42, $e3, $c3, $71, $43, $bd, $b4, $c4, $b4, $ae, $44, $e8, $d0, $df, $8e, $11    // data $8d83
    .byte $fd, $58, $ad, $a5, $57, $0f, $8d, $12, $3f, $f7, $8e, $3c, $4c, $e8, $f1, $40    // data $8d93
    .byte $69, $69, $4e, $07, $8a, $1e, $90, $cb, $cc, $cf, $d6, $c4, $2d, $c1, $97, $d9    // data $8da3
    .byte $20, $a6, $d8, $e8, $38, $af, $4f, $a9, $46, $54, $c5, $0d, $9d, $35, $76, $5e    // data $8db3
    .byte $4d, $a2, $da, $36, $b9, $d4, $58, $55, $43, $55, $5b, $42, $cd, $46, $46, $b5    // data $8dc3
    .byte $49, $4c, $dd, $5c, $2d, $4f, $2c, $b9, $53, $50, $62, $19, $58, $d0, $ea, $c7    // data $8dd3
    .byte $8a, $57, $49, $c2, $39, $18, $8c, $e2, $d9, $2f, $3d, $67, $44, $21, $b2, $54    // data $8de3
    .byte $ce, $90, $c6, $24, $d0, $46, $13, $3d, $16, $63, $d5, $ce, $29, $be, $a9, $d3    // data $8df3
    .byte $c5, $0c, $4c, $71, $d9, $1a, $cc, $c9, $e2, $3f, $e3, $d3, $2f, $c3, $b7, $29    // data $8e03
    .byte $a2, $47, $30, $31, $5a, $d6, $41, $4c, $55, $af, $45, $f0, $33, $37, $a6, $9d    // data $8e13
    .byte $16, $e4, $41, $88, $9b, $db, $48, $52, $4d, $15, $32, $55, $76, $3d, $50, $54    // data $8e23
    .byte $49, $bc, $f2, $28, $31, $36, $79, $0e, $cd, $c1, $c2, $f5, $02, $52, $53, $29    // data $8e33
    .byte $47, $89, $52, $cc, $75, $2c, $ca, $88, $54, $83, $b7, $a2, $41, $44, $3f, $4e    // data $8e43
    .byte $53, $3a, $db, $24, $f5, $94, $d7, $95, $52, $4b, $49, $5d, $59, $28, $6c, $c6    // data $8e53
    .byte $4c, $6b, $41, $53, $48, $d2, $cf, $cd, $fc, $d0, $1b, $96, $0d, $ce, $0b, $75    // data $8e63
    .byte $43, $48, $ab, $41, $aa, $47, $ca, $53, $ca, $44, $4f, $4e, $e2, $20, $d3, $50    // data $8e73
    .byte $41, $6f, $43, $45, $2e, $f0, $98, $fa, $45, $01, $ff, $39, $45, $4e, $44, $2b    // data $8e83
    .byte $78, $07, $c0, $00, $35, $82, $52, $33, $38, $50, $2d, $fb, $ad, $55, $4e, $54    // data $8e93
    .byte $20, $5a, $5f, $45, $52, $4f, $2f, $43, $50, $58, $2d, $ff, $bd, $42, $e5, $30    // data $8ea3
    .byte $01, $c0, $4f, $00, $00, $54, $34, $48, $89, $11, $ee, $66, $aa, $28, $cc, $48    // data $8eb3
    .byte $43, $3d, $99, $e1, $ee, $ea, $aa, $2c, $ca, $e6, $02, $46, $24, $c4, $48, $80    // data $8ec3
    .byte $18, $01, $41, $e8, $a9, $00, $85, $fc, $85, $fb, $e0, $01, $90, $28, $a5, $fd    // data $8ed3
    .byte $4a, $d0, $18, $ad, $23, $01, $d0, $0a, $c6, $01, $8e, $e7, $db, $e6, $01, $ce    // data $8ee3
    .byte $24, $01, $ce, $23, $01, $ad, $d4, $28, $90, $1b, $6a, $26, $fc, $26, $fb, $ca    // data $8ef3
    .byte $d0, $de, $85, $fd, $a5, $fc, $60, $c6, $01, $58, $4c, $10, $08, $ca, $c6, $ff    // data $8f03
    .byte $c6, $af, $88, $b1, $ae, $91, $fe, $98, $d0, $f8, $8a, $d0, $f0, $20, $00, $01    // data $8f13
    .byte $f0, $0a, $a5, $fe, $d0, $02, $c6, $ff, $c6, $fe, $90, $b7, $c8, $20, $00, $01    // data $8f23
    .byte $f0, $fa, $c0, $11, $b0, $d1, $be, $33, $03, $20, $01, $01, $79, $67, $03, $85    // data $8f33
    .byte $a7, $a5, $fb, $79, $9b, $03, $48, $d0, $06, $a4, $a7, $c0, $04, $90, $02, $a0    // data $8f43
    .byte $03, $be, $b3, $01, $20, $01, $01, $79, $b6, $01, $a8, $38, $a5, $fe, $e5, $a7    // data $8f53
    .byte $85, $fe, $b0, $02, $c6, $ff, $be, $34, $03, $20, $01, $01, $79, $68, $03, $90    // data $8f63
    .byte $03, $e6, $fb, $18, $65, $fe, $85, $ae, $a5, $fb, $79, $9c, $03, $65, $ff, $85    // data $8f73
    .byte $af, $a4, $a7, $68, $aa, $90, $90, $02, $04, $04, $30, $20, $10, $e8, $98, $29    // data $8f83
    .byte $0f, $f0, $13, $8a, $4a, $a6, $fc, $2a, $26, $fb, $ca, $10, $fa, $79, $67, $03    // data $8f93
    .byte $aa, $a5, $fb, $79, $9b, $03, $99, $9c, $03, $8a, $99, $68, $03, $a2, $04, $20    // data $8fa3
    .byte $01, $01, $99, $34, $03, $c8, $c0, $34, $d0, $d3, $a0, $36, $b9, $cb, $29, $99    // data $8fb3
    .byte $e6, $07, $88, $d0, $f7, $4c, $4a, $01, $80, $00, $a0, $2c, $ba, $d8, $5b, $d8    // data $8fc3
    .byte $a9, $3d, $8d, $57, $19, $03, $d2, $21, $a1, $ae, $ee, $15, $ca, $88, $8c, $6b    // data $8fd3
    .byte $26, $ce, $1b, $ae, $11, $d0, $b5, $dd, $78, $11, $af, $16, $34, $c6, $d7, $a2    // data $8fe3
    .byte $18, $46, $1a, $1e, $d4, $88, $bf, $fa, $f6, $78, $3c, $81, $24, $5c, $00, $aa    // data $8ff3
    .byte $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa    // data $9003 (unchanged filler, ends $9011)

// ---------------------------------------------------------------------------
// hondani_shell_entry -- minimal end-to-end cloud connectivity test.
// Reached via bank01's xb_stub (jsr $9012) while bank01 is switched out and
// this bank is paged in. Talks directly to the C64U/Ultimate command
// interface at $DF1C-$DF1F (documented "Ultimate cartridge registers",
// unrelated to this cart's own $DE00/$DE01 -- see wedge-analysis.md).
// Purpose right now: prove $DF1C is reachable from within an actively
// bank-switched RR-style cart context, which had NOT been confirmed before
// this. Does a full connect/write/read/close round trip against the cloud
// server with a fixed "PING" text-input message and streams whatever comes
// back straight to the screen via CHROUT -- even a "processing error" reply
// proves the wire works. Border flashes green on a clean protocol round
// trip, red if any step fails at the protocol level (connect/write/read
// erroring out, not the LLM's own reply content).
// Uses no zero page at all -- all scratch state lives in RAM at $cf20+,
// right after bank01's $cf00 xb_stub, both safely outside any bank-switched
// window (see wedge-analysis.md §6a for why that matters).
// ---------------------------------------------------------------------------
.const UII_CONTROL = $df1c
.const UII_STATUS  = $df1c
.const UII_CMD     = $df1d
.const UII_RESP    = $df1e
.const UII_STATDAT = $df1f
.const UII_ST_BUSY  = $01
.const UII_ST_ERROR = $08
.const UII_ST_STATE = $30
.const UII_ST_STATAV = $40
.const UII_ST_DATAAV = $80
.const UII_CTL_PUSH = $01
.const UII_CTL_ACC  = $02
.const NET_TARGET       = $03
.const NET_TCP_CONNECT  = $07
.const NET_SOCKET_CLOSE = $09
.const NET_SOCKET_READ  = $10
.const NET_SOCKET_WRITE = $11
.const cf_socket_id    = $cf20
.const cf_status0      = $cf21
.const cf_status1      = $cf22
.const cf_state        = $cf23   // net_read_and_print's framing state, see below
.const cf_got_data     = $cf24   // scratch: did net_read_and_print see any byte at all this call? (0=no -> caller should spin)
.const cf_spin_idx     = $cf25   // spinner animation frame index (0/1)
.const cf_retries_lo   = $cf26   // 16-bit "give up waiting" counter, counts down each empty poll
.const cf_retries_hi   = $cf27
.const cf_msglen_lo    = $cf28   // 16-bit remaining-content-bytes countdown
.const cf_msglen_hi    = $cf29
// These three mirror bank01.asm's constants of the same name/address --
// separate assembly units, same physical RAM, no shared symbol table.
.const cf_shadow       = $cf32   // shadow copy of the raw typed line (set by bank01's line_tap)
.const ie_orig_vec     = $cf80   // +$cf81: original IERROR vector (bank01-owned, unused here)
.const ie_errcode      = $cf82   // BASIC error-table index that triggered this call (diagnostic)
// Response framing -- CONFIRMED against a real hex dump of the wire data
// (2026-07-03, screenshot from hardware), after four earlier rounds of
// guessing from visual descriptions all landed on the wrong shape (the
// $13/$5e marker/filler theory below was wrong). The real framing is:
//   [N x $ff idle/filler bytes, N varies with network timing]
//   [2-byte little-endian content length, e.g. 47 00 = 0x0047 = 71]
//   [exactly that many content bytes -- verified byte-count-exact against
//    a real reply: "Hello Honza!\r\rHow can I help you with your C64 and
//    Hondani Shell today?", capital letters as PETSCII $c1-$da, lowercase
//    as $41-$5a, both printable via CHROUT with no further translation]
// cf_state: 0 = discarding $ff filler, first non-$ff byte is length lo
//           1 = that byte was length lo, this one is length hi
//           2 = printing content, counting cf_msglen_lo/hi down to zero
//           3 = content fully printed, discard anything else this response

hondani_shell_entry:
    // DIAGNOSTIC (temporary): print the BASIC error-table index that
    // triggered this call, so the real SYNTAX error code can be confirmed
    // from hardware before narrowing ierror_stub_rom's trigger condition
    // in bank01 -- see wedge-analysis.md. ie_errcode = $cf82.
    lda #$45                // 'E'
    jsr $ffd2
    lda #$52                // 'R'
    jsr $ffd2
    lda #$52                // 'R'
    jsr $ffd2
    lda #$3d                // '='
    jsr $ffd2
    lda #$24                // '$'
    jsr $ffd2
    lda $cf82                // ie_errcode
    pha
    lsr
    lsr
    lsr
    lsr
    jsr diag_hexdigit
    pla
    and #$0f
    jsr diag_hexdigit
    lda #$20                 // space
    jsr $ffd2

    // --- TCP connect ---
    jsr net_wait_idle
    lda #NET_TARGET
    sta UII_CMD
    lda #NET_TCP_CONNECT
    sta UII_CMD
    lda #<6464
    sta UII_CMD
    lda #>6464
    sta UII_CMD
    ldx #$00
!send_ip:
    lda net_test_host,x
    sta UII_CMD
    inx
    cmp #$00
    bne !send_ip-
    jsr net_push_and_check
    bcc !pushok1+
    jmp net_fail
!pushok1:
    jsr net_wait_not_busy
    lda UII_RESP           // response data queue: socket_id
    sta cf_socket_id
    jsr net_drain_data
    jsr net_read_status
    jsr net_accept
    bcc !connect_ok+
    jmp net_fail
!connect_ok:

    // --- send "I:" + the shadow-copied line (TEXT_INPUT cmd, console 0) ---
    // cf_shadow ($cf32, bank01) holds the raw typed line, null-terminated;
    // "I:" is ChatHandler's routing prefix (confirmed against cloud/handlers/
    // chat_handler.py -- see wedge-analysis.md). The terminating null is
    // sent too, matching the wire convention request_dispatcher.py expects
    // (it rstrips trailing nulls on receipt).
    jsr net_wait_idle
    lda #NET_TARGET
    sta UII_CMD
    lda #NET_SOCKET_WRITE
    sta UII_CMD
    lda cf_socket_id
    sta UII_CMD
    lda #$fe                // packet magic byte
    sta UII_CMD
    lda #$02                // CommandID.TEXT_INPUT | console_id(0)
    sta UII_CMD
    lda #$49                // 'I'
    sta UII_CMD
    lda #$3a                // ':'
    sta UII_CMD
    ldy #$00
!send_msg:
    lda cf_shadow,y
    sta UII_CMD
    iny
    cmp #$00
    bne !send_msg-
    jsr net_push_and_check
    bcc !pushok2+
    jmp net_fail
!pushok2:
    jsr net_wait_not_busy
    jsr net_drain_data
    jsr net_read_status
    jsr net_accept
    bcc !write_ok+
    jmp net_fail
!write_ok:
    lda #$00
    sta cf_state            // fresh response cycle: start by discarding $ff filler
    sta cf_spin_idx
    lda #<8000              // ~8000-iteration "give up waiting" budget -- generous
    sta cf_retries_lo       // on purpose, since LLM replies can take several
    lda #>8000               // seconds; each iteration is a fast register poll
    sta cf_retries_hi        // except when it genuinely has to wait on the network

    // --- read the reply and print it straight to the screen ---
    // A single SOCKET_READ only drains whatever's queued *right now* -- the
    // original src/hdncloud.asm's send_cmd_to_hdn_cloud loops
    // (!repeat_until_00data) reissuing SOCKET_READ until the status comes
    // back "00" (done).
!read_loop:
    jsr net_wait_idle
    lda #NET_TARGET
    sta UII_CMD
    lda #NET_SOCKET_READ
    sta UII_CMD
    lda cf_socket_id
    sta UII_CMD
    lda #$e8                // read block length lo
    sta UII_CMD
    lda #$00                // read block length hi
    sta UII_CMD
    jsr net_push_and_check
    bcc !pushok3+
    jmp net_fail
!pushok3:
    jsr net_wait_not_busy_spin  // animates while the Ultimate is busy -- this
                                 // is where a slow LLM's latency actually shows up
    jsr net_read_and_print  // strip framing, stream real content to CHROUT;
    bcs !had_data+          // carry set = at least one byte was seen this poll
    jsr net_spin            // nothing new yet -- animate the "still waiting" indicator
!had_data:
    jsr net_read_status
    jsr net_accept
    bcc !read_done+         // carry clear = status was "00" = fully drained
    lda cf_state            // also stop early once the full content length has
    cmp #$03                // been printed, regardless of what status says --
    beq !read_done+         // no point retrying further once the message is done
    lda cf_retries_lo       // count down the 16-bit retry budget; give up
    bne !dec_lo+            // (fall through to close) once it hits zero
    dec cf_retries_hi
!dec_lo:
    dec cf_retries_lo
    lda cf_retries_lo
    ora cf_retries_hi
    bne !read_loop-
!read_done:

    // --- close the socket ---
    jsr net_wait_idle
    lda #NET_TARGET
    sta UII_CMD
    lda #NET_SOCKET_CLOSE
    sta UII_CMD
    lda cf_socket_id
    sta UII_CMD
    jsr net_push_and_check
    bcc !pushok4+
    jmp net_fail
!pushok4:
    jsr net_wait_not_busy
    jsr net_drain_data
    jsr net_read_status
    jsr net_accept

    lda #$05                // green: full protocol round trip completed
    sta $d020
    rts

net_fail:
    lda #$02                // red: a protocol step failed (connect/write/read/push)
    sta $d020
    rts

// pushes the command just written to UII_CMD, then checks the ERROR status
// bit. Output: carry clear = ok, carry set = error (command rejected)
net_push_and_check:
    lda UII_CONTROL
    ora #UII_CTL_PUSH
    sta UII_CONTROL
    lda UII_STATUS
    and #UII_ST_ERROR
    beq !ok+
    sec
    rts
!ok:
    clc
    rts

net_wait_idle:
!loop:
    lda UII_STATUS
    and #UII_ST_STATE
    bne !loop-
    rts

net_wait_not_busy:
!loop:
    lda UII_STATUS
    and #UII_ST_STATE
    cmp #$10
    beq !loop-
    rts

// net_wait_not_busy_spin lives further down in this file, relocated into
// the same $9e00 free pocket as net_spin (see the comment there) -- it
// didn't fit here alongside everything else in the smaller $9012 pocket.

// drains the response-data queue without printing (used after
// connect/write/close, whose response payload we don't care about here)
net_drain_data:
!loop:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq !done+
    lda UII_RESP
    jmp !loop-
!done:
    rts

// net_read_and_print lives further down in this file, relocated into the
// same $9e00 free pocket as net_spin -- didn't fit here alongside
// everything else in the smaller $9012 pocket.

// net_spin lives further down in this file, relocated into a separate free
// pocket at $9e00 -- see the comment there. (Kept as a plain jsr target;
// Kick Assembler doesn't care about source-file ordering vs. final address.)

// drains the status queue, keeping only the first two bytes (the "00"/error
// code convention used by uii_success in the original src/c64u_common.asm)
net_read_status:
    lda #$00
    sta cf_status0
    sta cf_status1
    ldx #$00
!loop:
    lda UII_STATUS
    and #UII_ST_STATAV
    beq !done+
    lda UII_STATDAT
    cpx #$00
    bne !not0+
    sta cf_status0
    jmp !next+
!not0:
    cpx #$01
    bne !next+
    sta cf_status1
!next:
    inx
    jmp !loop-
!done:
    rts

// Output: carry clear if last read_status was "00" (success), set otherwise
net_accept:
    lda UII_CONTROL
    ora #UII_CTL_ACC
    sta UII_CONTROL
!wait:
    lda UII_STATUS
    and #UII_CTL_ACC
    bne !wait-
    lda cf_status0
    cmp #$30
    bne !fail+
    lda cf_status1
    cmp #$30
    bne !fail+
    clc
    rts
!fail:
    sec
    rts

net_test_host:
    .byte $31, $39, $32, $2e, $31, $36, $38, $2e, $31, $2e, $32, $00    // "192.168.1.2\0" -- FIXME hardcoded test address, confirm this matches your cloud_server.py host
net_test_msg_end:                // kept as a label for the .fill boundary below; the fixed test message itself is gone now that we send cf_shadow instead

    .fill $9200 - net_test_msg_end, $00    // remaining confirmed-free bytes, unused so far
    .byte $a9, $00, $8d    // data $91f3 (unchanged original code resumes here)
    .byte $20, $d0, $8d, $21, $d0, $a9, $0f, $8d, $86, $02, $a2, $00, $9d, $00, $d8, $9d    // data $9203
    .byte $00, $d9, $9d, $00, $da, $9d, $00, $db, $e8, $d0, $f1, $bd, $00, $69, $9d, $00    // data $9213
    .byte $04, $bd, $00, $6a, $9d, $00, $05, $bd, $00, $6b, $9d, $00, $06, $bd, $00, $6c    // data $9223
    .byte $9d, $00, $07, $e8, $d0, $e5, $20, $e4, $ff, $c9, $20, $d0, $f9, $a2, $08, $a0    // data $9233
    .byte $01, $20, $ba, $ff, $a9, $10, $a2, $c0, $a0, $68, $20, $bd, $ff, $a9, $01, $85    // data $9243
    .byte $fb, $a9, $08, $85, $fc, $a9, $fb, $a2, $00, $a0, $2c, $20, $d8, $ff, $a2, $00    // data $9253
    .byte $4c, $9a, $68, $9d, $01, $08, $e8, $d0, $f7, $ee, $65, $68, $ee, $68, $68, $ad    // data $9263
    .byte $65, $68, $c9, $68, $d0, $ea, $a2, $08, $a0, $01, $20, $ba, $ff, $a9, $10, $a2    // data $9273
    .byte $b0, $a0, $68, $20, $bd, $ff, $a9, $01, $85, $fb, $a9, $08, $85, $fc, $a9, $fb    // data $9283
    .byte $a2, $00, $a0, $26, $20, $d8, $ff, $ee, $20, $d0, $ce, $20, $d0, $4c, $9a, $68    // data $9293
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $46, $4c, $41    // data $92a3
    .byte $53, $48, $20, $55, $54, $49, $4c, $20, $56, $33, $2e, $38, $50, $46, $4c, $41    // data $92b3
    .byte $53, $48, $20, $55, $54, $49, $4c, $20, $56, $33, $2e, $38, $50, $00, $00, $00    // data $92c3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $92d3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $92e3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $10, $0c, $05    // data $92f3
    .byte $01, $13, $05, $20, $0e, $0f, $14, $05, $20, $20, $20, $20, $20, $20, $20, $20    // data $9303
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9313
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9323
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9333
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $14, $08, $09    // data $9343
    .byte $13, $20, $10, $12, $0f, $07, $12, $01, $0d, $20, $0a, $15, $13, $14, $20, $13    // data $9353
    .byte $01, $16, $05, $13, $20, $0f, $0e, $05, $20, $14, $09, $0e, $19, $20, $06, $09    // data $9363
    .byte $0c, $05, $20, $20, $20, $14, $0f, $20, $14, $08, $05, $20, $04, $09, $13, $0b    // data $9373
    .byte $20, $09, $0e, $20, $04, $12, $09, $16, $05, $20, $38, $2e, $20, $20, $20, $20    // data $9383
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $10, $0c, $05    // data $9393
    .byte $01, $13, $05, $20, $13, $01, $16, $05, $20, $14, $08, $09, $13, $20, $10, $12    // data $93a3
    .byte $0f, $07, $12, $01, $0d, $20, $01, $14, $0c, $05, $01, $13, $14, $20, $14, $17    // data $93b3
    .byte $0f, $20, $20, $20, $20, $0f, $12, $20, $14, $08, $12, $05, $05, $20, $14, $09    // data $93c3
    .byte $0d, $05, $13, $20, $06, $0f, $12, $20, $06, $15, $14, $15, $12, $05, $20, $15    // data $93d3
    .byte $13, $01, $07, $05, $20, $01, $0e, $04, $20, $14, $0f, $20, $20, $02, $05, $20    // data $93e3
    .byte $13, $15, $12, $05, $20, $14, $0f, $20, $08, $01, $16, $05, $20, $09, $14, $20    // data $93f3
    .byte $08, $01, $0e, $04, $19, $2e, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9403
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9413
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9423
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $01, $02, $0f    // data $9433
    .byte $15, $14, $20, $33, $36, $20, $02, $0c, $0f, $03, $0b, $13, $20, $17, $09, $0c    // data $9443
    .byte $0c, $20, $02, $05, $20, $0e, $05, $05, $04, $05, $04, $20, $20, $2e, $2e, $2e    // data $9453
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9463
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9473
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9483
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9493
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $94a3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $94b3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $94c3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $14, $08    // data $94d3
    .byte $01, $0e, $0b, $13, $20, $06, $0f, $12, $20, $19, $0f, $15, $12, $20, $01, $14    // data $94e3
    .byte $14, $05, $0e, $14, $09, $0f, $0e, $20, $2e, $2e, $2e, $20, $20, $20, $20, $20    // data $94f3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9503
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9513
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9523
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9533
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9543
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9553
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9563
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9573
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9583
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9593
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95a3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95b3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95c3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95d3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95e3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95f3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9603
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9613
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9623
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9633
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9643
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9653
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9663
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9673
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9683
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9693
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96a3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96b3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96c3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96d3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96e3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $b3, $60, $a9    // data $96f3
    .byte $ff, $8d, $19, $b3, $60, $20, $37, $c1, $ad, $33, $b3, $10, $21, $60, $20, $37    // data $9703
    .byte $c1, $ad, $33, $b3, $30, $18, $60, $20, $37, $c1, $ad, $32, $b3, $0d, $33, $b3    // data $9713
    .byte $d0, $0c, $60, $20, $37, $c1, $ad, $32, $b3, $0d, $33, $b3, $d0, $05, $a9, $01    // data $9723
    .byte $8d, $0a, $b3, $60, $20, $c3, $c2, $2c, $1f, $b3, $10, $05, $a2, $02, $4c, $f9    // data $9733
    .byte $be, $60, $ad, $06, $b3, $8d, $08, $b3, $60, $a9, $00, $8d, $08, $b3, $60, $2c    // data $9743
    .byte $53, $2c, $52, $ad, $ff, $b2, $f0, $05, $a2, $07, $4c, $f9, $be, $20, $f5, $b8    // data $9753
    .byte $ce, $ff, $b2, $20, $c0, $b8, $18, $6d, $29, $b3, $aa, $a0, $00, $b9, $52, $c1    // data $9763
    .byte $9d, $d2, $b2, $e8, $c8, $c0, $04, $d0, $f4, $a9, $06, $a8, $a6, $ba, $20, $ba    // data $9773
    .byte $ff, $18, $a2, $d4, $a0, $b2, $ad, $2a, $b3, $69, $04, $20, $bd, $ff, $20, $c0    // data $9783
    .byte $ff, $20, $68, $bc, $ad, $01, $cb, $8d, $04, $b3, $ad, $02, $cb, $8d, $05, $b3    // data $9793
    .byte $a9, $29, $8d, $01, $cb, $a9, $02, $8d, $02, $cb, $ce, $fd, $b2, $60, $ad, $ff    // data $97a3
    .byte $b2, $f0, $05, $a2, $07, $4c, $f9, $be, $ce, $fe, $b2, $60, $20, $ad, $c2, $ad    // data $97b3
    .byte $32, $b3, $8d, $fa, $b2, $ad, $33, $b3, $8d, $fb, $b2, $60, $20, $c0, $b8, $aa    // data $97c3
    .byte $20, $c0, $b8, $20, $b6, $b8, $ca, $d0, $f7, $60, $20, $c0, $b8, $aa, $20, $c0    // data $97d3
    .byte $b8, $20, $b6, $b8, $ca, $d0, $f7, $a9, $00, $4c, $b6, $b8, $20, $c0, $b8, $aa    // data $97e3
    .byte $ca, $f0, $09, $20, $c0, $b8, $20, $b6, $b8, $ca, $d0, $f7, $20, $c0, $b8, $09    // data $97f3
    .byte $80, $20, $b6, $b8, $60, $20, $ad, $c2, $ad, $33, $b3, $d0, $0c, $ad, $32, $b3    // data $9803
    .byte $20, $b6, $b8, $20, $db, $b8, $4c, $08, $c2, $2c, $1f, $b3, $30, $f2, $a2, $03    // data $9813
    .byte $4c, $fc, $be, $20, $ad, $c2, $ad, $32, $b3, $20, $b6, $b8, $ad, $33, $b3, $20    // data $9823
    .byte $b6, $b8, $20, $db, $b8, $4c, $26, $c2, $20, $ad, $c2, $38, $ad, $32, $b3, $e9    // data $9833
    .byte $01, $08, $20, $b6, $b8, $28, $ad, $33, $b3, $e9, $00, $20, $b6, $b8, $20, $db    // data $9843
    .byte $b8, $4c, $3b, $c2, $ad, $39, $b3, $f0, $0c, $20, $37, $c1, $ad, $32, $b3, $ae    // data $9853
    .byte $33, $b3, $4c, $a2, $be, $60, $20, $99, $be, $20, $c3, $c2, $ad, $39, $b3, $d0    // data $9863
    .byte $29, $ad, $07, $b3, $f0, $24, $a5, $4d, $cd, $32, $b3, $d0, $07, $a5, $4e, $cd    // data $9873
    .byte $33, $b3, $f0, $20, $a2, $01, $20, $c9, $ff, $a9, $00, $20, $d2, $ff, $20, $cc    // data $9883
    .byte $ff, $e6, $4d, $d0, $e1, $e6, $4e, $4c, $79, $c2, $ad, $32, $b3, $85, $4d, $ad    // data $9893
    .byte $33, $b3, $85, $4e, $60, $a2, $02, $4c, $fc, $be, $20, $c3, $c2, $2c, $1f, $b3    // data $98a3
    .byte $30, $01, $60, $a9, $44, $8d, $33, $b3, $2c, $39, $b3, $30, $f5, $4c, $a8, $c2    // data $98b3
    .byte $a9, $00, $8d, $31, $b3, $8d, $1f, $b3, $20, $c0, $b8, $c9, $44, $f0, $04, $c9    // data $98c3
    .byte $45, $d0, $06, $8d, $31, $b3, $4c, $e3, $c2, $c9, $46, $d0, $06, $ce, $31, $b3    // data $98d3
    .byte $ee, $29, $b3, $ce, $29, $b3, $20, $1a, $c3, $ad, $31, $b3, $f0, $18, $30, $16    // data $98e3
    .byte $c9, $45, $d0, $07, $a9, $00, $8d, $33, $b3, $f0, $0b, $ad, $33, $b3, $8d, $32    // data $98f3
    .byte $b3, $a9, $00, $8d, $33, $b3, $60, $ce, $2c, $b3, $ad, $32, $b3, $8d, $34, $b3    // data $9903
    .byte $ad, $33, $b3, $8d, $35, $b3, $60, $20, $c5, $c4, $ad, $34, $b3, $8d, $32, $b3    // data $9913
    .byte $ad, $35, $b3, $8d, $33, $b3, $ad, $2c, $b3, $d0, $db, $20, $c0, $b8, $c9, $4b    // data $9923
    .byte $f0, $d8, $c9, $5b, $f0, $d1, $8d, $38, $b3, $20, $c5, $c4, $20, $4a, $c3, $ad    // data $9933
    .byte $2c, $b3, $d0, $c2, $4c, $2e, $c3, $ad, $38, $b3, $29, $0f, $aa, $d0, $14, $18    // data $9943
    .byte $ad, $32, $b3, $6d, $34, $b3, $8d, $32, $b3, $ad, $33, $b3, $6d, $35, $b3, $8d    // data $9953
    .byte $33, $b3, $60, $ca, $d0, $14, $38, $ad, $32, $b3, $ed, $34, $b3, $8d, $32, $b3    // data $9963
    .byte $ad, $33, $b3, $ed, $35, $b3, $8d, $33, $b3, $60, $ca, $d0, $40, $ad, $32, $b3    // data $9973
    .byte $8d, $36, $b3, $ad, $33, $b3, $8d, $37, $b3, $a9, $00, $8d, $32, $b3, $8d, $33    // data $9983
    .byte $b3, $a2, $10, $4e, $35, $b3, $6e, $34, $b3, $90, $18, $18, $ad, $36, $b3, $6d    // data $9993
    .byte $32, $b3, $8d, $32, $b3, $ad, $37, $b3, $6d, $33, $b3, $8d, $33, $b3, $90, $03    // data $99a3
    .byte $4c, $21, $c2, $0e, $36, $b3, $2e, $37, $b3, $ca, $d0, $d7, $60, $ca, $d0, $32    // data $99b3
    .byte $a9, $00, $8d, $36, $b3, $8d, $37, $b3, $a2, $10, $18, $2e, $32, $b3, $2e, $33    // data $99c3
    .byte $b3, $ca, $30, $e8, $2e, $36, $b3, $2e, $37, $b3, $38, $ad, $36, $b3, $ed, $34    // data $99d3
    .byte $b3, $a8, $ad, $37, $b3, $ed, $35, $b3, $90, $e1, $8d, $37, $b3, $8c, $36, $b3    // data $99e3
    .byte $b0, $d9, $ca, $ca, $ca, $ca, $d0, $13, $ad, $32, $b3, $2d, $34, $b3, $8d, $32    // data $99f3
    .byte $b3, $ad, $33, $b3, $2d, $35, $b3, $8d, $33, $b3, $60, $ca, $d0, $13, $ad, $32    // data $9a03
    .byte $b3, $0d, $34, $b3, $8d, $32, $b3, $ad, $33, $b3, $0d, $35, $b3, $8d, $33, $b3    // data $9a13
    .byte $60, $ad, $32, $b3, $4d, $34, $b3, $8d, $32, $b3, $ad, $33, $b3, $4d, $35, $b3    // data $9a23
    .byte $8d, $33, $b3, $60, $8a, $29, $07, $8d, $21, $b3, $20, $c0, $b8, $8d, $20, $b3    // data $9a33
    .byte $ad, $1b, $b3, $f0, $09, $20, $12, $c7, $ad, $22, $b3, $f0, $01, $60, $ad, $21    // data $9a43
    .byte $b3, $29, $07, $0a, $69, $e0, $85, $3a, $ad, $20, $b3, $0a, $85, $39, $90, $02    // data $9a53
    .byte $e6, $3a, $a5, $01, $48, $78, $a9, $05, $85, $01, $a0, $00, $b1, $39, $8d, $34    // data $9a63
    .byte $b3, $c8, $b1, $39, $8d, $35, $b3, $68, $85, $01, $58, $ad, $34, $b3, $2d, $35    // data $9a73
    .byte $b3, $c9, $ff, $d0, $0d, $20, $12, $c7, $ad, $22, $b3, $c9, $ff, $f0, $03, $ce    // data $9a83
    .byte $1f, $b3, $60, $a5, $4d, $8d, $34, $b3, $a5, $4e, $8d, $35, $b3, $60, $20, $c0    // data $9a93
    .byte $b8, $38, $e9, $30, $cd, $17, $b3, $f0, $07, $90, $05, $a2, $0a, $4c, $fc, $be    // data $9aa3
    .byte $0a, $18, $6d, $14, $b3, $a8, $b1, $43, $8d, $35, $b3, $c8, $b1, $43, $8d, $34    // data $9ab3
    .byte $b3, $60, $20, $c0, $b8, $c9, $4a, $f0, $30, $aa, $29, $08, $8d, $2c, $b3, $8a    // data $9ac3
    .byte $29, $10, $f0, $03, $4c, $37, $c4, $8a, $29, $07, $c9, $05, $f0, $b5, $c9, $07    // data $9ad3
    .byte $f0, $bc, $a9, $00, $8d, $35, $b3, $20, $c0, $b8, $8d, $34, $b3, $8a, $29, $01    // data $9ae3
    .byte $f0, $06, $20, $c0, $b8, $8d, $35, $b3, $60, $ad, $38, $b3, $48, $ad, $32, $b3    // data $9af3
    .byte $48, $ad, $33, $b3, $48, $20, $1a, $c3, $68, $8d, $33, $b3, $68, $8d, $32, $b3    // data $9b03
    .byte $68, $8d, $38, $b3, $60, $8d, $3e, $b3, $8c, $3f, $b3, $a9, $ff, $8d, $41, $b3    // data $9b13
    .byte $a2, $08, $a0, $30, $38, $ad, $3e, $b3, $fd, $63, $c5, $8d, $40, $b3, $ad, $3f    // data $9b23
    .byte $b3, $fd, $64, $c5, $90, $0c, $8d, $3f, $b3, $ad, $40, $b3, $8d, $3e, $b3, $c8    // data $9b33
    .byte $d0, $e2, $98, $c9, $30, $d0, $05, $2c, $41, $b3, $30, $06, $20, $d2, $ff, $8d    // data $9b43
    .byte $41, $b3, $ca, $ca, $10, $cc, $2c, $41, $b3, $10, $04, $98, $4c, $d2, $ff, $60    // data $9b53
    .byte $01, $00, $0a, $00, $64, $00, $e8, $03, $10, $27, $a9, $c0, $2c, $a9, $80, $8d    // data $9b63
    .byte $1a, $b3, $ad, $1b, $b3, $f0, $05, $a2, $0e, $4c, $f9, $be, $ad, $11, $b3, $f0    // data $9b73
    .byte $05, $a2, $0f, $4c, $f9, $be, $a5, $4f, $a6, $50, $20, $a2, $be, $ce, $0d, $b3    // data $9b83
    .byte $60, $8d, $0f, $b3, $38, $a5, $4f, $ed, $0f, $b3, $85, $4f, $a5, $50, $e9, $00    // data $9b93
    .byte $85, $50, $a0, $00, $ad, $0f, $b3, $0d, $1a, $b3, $91, $4f, $c8, $8c, $10, $b3    // data $9ba3
    .byte $60, $ac, $10, $b3, $ee, $10, $b3, $91, $4f, $60, $20, $99, $be, $a9, $ff, $8d    // data $9bb3
    .byte $27, $b3, $ad, $12, $b3, $8d, $13, $b3, $ee, $11, $b3, $ad, $16, $b3, $20, $4a    // data $9bc3
    .byte $c6, $ad, $15, $b3, $20, $4a, $c6, $20, $37, $c1, $ad, $33, $b3, $8d, $16, $b3    // data $9bd3
    .byte $ad, $32, $b3, $8d, $15, $b3, $a9, $00, $8d, $18, $b3, $ac, $29, $b3, $cc, $0e    // data $9be3
    .byte $b3, $f0, $48, $b9, $d2, $b2, $30, $43, $c9, $4f, $d0, $2a, $20, $c0, $b8, $20    // data $9bf3
    .byte $c0, $b8, $a0, $80, $8c, $1a, $b3, $18, $48, $69, $01, $20, $94, $c5, $68, $aa    // data $9c03
    .byte $20, $c0, $b8, $20, $b4, $c5, $ca, $d0, $f7, $a5, $50, $20, $4a, $c6, $a5, $4f    // data $9c13
    .byte $20, $4a, $c6, $4c, $38, $c6, $20, $ad, $c2, $ad, $33, $b3, $20, $4a, $c6, $ad    // data $9c23
    .byte $32, $b3, $20, $4a, $c6, $ee, $18, $b3, $4c, $ee, $c5, $ad, $13, $b3, $8d, $14    // data $9c33
    .byte $b3, $ad, $18, $b3, $8d, $17, $b3, $ac, $12, $b3, $91, $43, $ee, $12, $b3, $d0    // data $9c43
    .byte $05, $a2, $09, $4c, $f9, $be, $60, $ad, $11, $b3, $d0, $05, $a2, $0b, $4c, $f9    // data $9c53
    .byte $be, $20, $99, $be, $ce, $11, $b3, $d0, $14, $a9, $00, $8d, $12, $b3, $8d, $13    // data $9c63
    .byte $b3, $8d, $17, $b3, $2c, $28, $b3, $70, $03, $4c, $cc, $c6, $60, $ac, $13, $b3    // data $9c73
    .byte $8c, $12, $b3, $b1, $43, $8d, $16, $b3, $c8, $b1, $43, $8d, $15, $b3, $ac, $12    // data $9c83
    .byte $b3, $88, $b1, $43, $8d, $17, $b3, $0a, $49, $ff, $18, $6d, $12, $b3, $69, $fd    // data $9c93
    .byte $8d, $13, $b3, $8d, $14, $b3, $4c, $77, $c6, $ac, $1c, $b3, $ee, $1c, $b3, $d0    // data $9ca3
    .byte $05, $a2, $0c, $4c, $f9, $be, $ad, $1c, $b3, $8d, $1d, $b3, $ee, $1b, $b3, $ad    // data $9cb3
    .byte $1b, $b3, $91, $47, $a9, $ff, $91, $45, $60, $ad, $1b, $b3, $d0, $05, $a2, $0d    // data $9cc3
    .byte $4c, $f9, $be, $20, $99, $be, $ce, $1b, $b3, $f0, $2e, $ad, $1b, $b3, $8d, $1e    // data $9cd3
    .byte $b3, $20, $7f, $ba, $a9, $00, $8d, $1d, $b3, $ac, $1c, $b3, $88, $b1, $47, $cd    // data $9ce3
    .byte $1e, $b3, $d0, $11, $cc, $1d, $b3, $90, $05, $c8, $8c, $1d, $b3, $88, $a9, $ff    // data $9cf3
    .byte $91, $45, $ce, $1e, $b3, $98, $d0, $e4, $60, $4c, $7f, $ba, $a9, $ff, $2c, $a9    // data $9d03
    .byte $00, $8d, $42, $b3, $a9, $00, $8d, $22, $b3, $a5, $50, $85, $4c, $a5, $4f, $85    // data $9d13
    .byte $4b, $a0, $00, $b1, $4b, $c9, $06, $d0, $4e, $a0, $02, $b1, $4b, $cd, $20, $b3    // data $9d23
    .byte $d0, $45, $c8, $b1, $4b, $cd, $21, $b3, $d0, $3d, $a0, $01, $b1, $4b, $c9, $ff    // data $9d33
    .byte $f0, $1d, $2c, $42, $b3, $10, $05, $a2, $10, $4c, $fc, $be, $a8, $88, $b1, $45    // data $9d43
    .byte $f0, $25, $b1, $47, $cd, $22, $b3, $90, $1e, $8d, $22, $b3, $4c, $65, $c7, $8d    // data $9d53
    .byte $22, $b3, $a0, $04, $b1, $4b, $8d, $34, $b3, $c8, $b1, $4b, $8d, $35, $b3, $ad    // data $9d63
    .byte $22, $b3, $cd, $1b, $b3, $b0, $08, $20, $83, $c7, $b0, $03, $4c, $24, $c7, $60    // data $9d73
    .byte $a0, $00, $b1, $4b, $29, $3f, $18, $65, $4b, $85, $4b, $90, $02, $e6, $4c, $c5    // data $9d83
    .byte $47, $a5, $4c, $e5, $48, $60, $ad, $23, $b3, $8d, $20, $b3, $ad, $24, $b3, $8d    // data $9d93
    .byte $21, $b3, $20, $12, $c7, $ad, $22, $b3, $cd, $1b, $b3, $d0, $05, $a2, $01, $4c    // data $9da3
    .byte $fc, $be, $a9, $00, $8d, $1a, $b3, $a9, $06, $20, $94, $c5, $ad, $1d, $b3, $20    // data $9db3
    .byte $b4, $c5, $ad, $23, $b3, $20, $b4, $c5, $ad, $24, $b3, $20, $b4, $c5, $ad, $25    // data $9dc3
    .byte $b3, $20, $b4, $c5, $ad, $26, $b3, $4c, $b4, $c5, $20, $37, $c1, $a9, $00, $8d    // data $9dd3
    .byte $09, $b3, $8d, $22, $b3, $ad, $23, $b3, $8d, $20, $b3, $ad, $24, $b3, $8d, $21    // data $9de3
    .byte $b3, $20, $51, $c4, $ad, $1f, $b3, $d0, $1a, $ad, $22, $b3, $c9    // data $9df3 (unchanged, ends $9dff)

// relocated here from the $9012 pocket (which overflowed by 8 bytes once
// the retry-budget/spin additions were added) -- this pocket is otherwise
// completely free (confirmed-zero $9e00-$9e9c), plenty of room to spare.
net_spin:
    ldx cf_spin_idx
    lda spin_chars,x
    jsr $ffd2
    lda #$9d
    jsr $ffd2
    inx
    cpx #spin_chars_end-spin_chars
    bne !nowrap+
    ldx #$00
!nowrap:
    stx cf_spin_idx
    rts
spin_chars:
    .byte $2e, $3a    // '.' ':'
spin_chars_end:

// Same as net_wait_not_busy, but advances the "still waiting" spinner every
// 256 poll iterations. Used only for the SOCKET_READ step: that's where an
// LLM's real latency actually shows up (the Ultimate command interface
// stays "busy" until the reply data is ready), whereas the plain
// net_wait_not_busy is normally near-instant for connect/write/close. Y is
// free to use as the pacing counter here -- nothing in this loop or
// net_spin needs it preserved.
net_wait_not_busy_spin:
    ldy #$00
!loop:
    lda UII_STATUS
    and #UII_ST_STATE
    cmp #$10
    bne !done+
    iny
    bne !loop-               // only spin once per 256 poll iterations
    jsr net_spin
    jmp !loop-
!done:
    rts
net_wait_not_busy_spin_end:

// Drains whatever's currently queued, discarding the leading $ff filler and
// the 2-byte little-endian length field, then printing exactly that many
// content bytes via CHROUT (see cf_state's definition near hondani_shell_entry
// for the exact framing -- confirmed against a real hardware hex dump,
// 2026-07-03). cf_state/cf_msglen_lo/cf_msglen_hi persist across calls
// (reset once per response cycle by the caller, right after the write step)
// since the filler run or even the content itself can span more than one
// SOCKET_READ call.
// Output: carry set if at least one byte was seen this call (filler,
// length, or content -- either way, something happened), carry clear if
// this poll found nothing queued at all (caller should animate the wait).
net_read_and_print:
    lda #$00
    sta cf_got_data
!loop:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq !done+
    inc cf_got_data
    lda UII_RESP
    ldx cf_state
    cpx #$03
    beq !loop-                // already printed the full message -- discard the rest
    cpx #$02
    beq !content+
    cpx #$01
    beq !lenhi+
    // state 0: discard $ff filler; first non-$ff byte is the length lo byte
    cmp #$ff
    beq !loop-
    sta cf_msglen_lo
    ldx #$01
    stx cf_state
    jmp !loop-
!lenhi:
    sta cf_msglen_hi
    ldx #$02
    stx cf_state
    jmp !loop-
!content:
    jsr $ffd2                 // CHROUT
    lda cf_msglen_lo          // 16-bit countdown of remaining content bytes
    bne !declo+
    dec cf_msglen_hi
!declo:
    dec cf_msglen_lo
    lda cf_msglen_lo
    ora cf_msglen_hi
    bne !loop-                 // more content still expected
    ldx #$03
    stx cf_state               // fully printed -- ignore anything else this response
    jmp !loop-
!done:
    lda cf_got_data
    bne !gotdata+
    clc
    rts
!gotdata:
    sec
    rts
net_read_and_print_end:
// diag_hexdigit is relocated to the $8022 pocket now (see there) -- didn't
// fit here alongside everything else in this pocket.

    .fill $9e9d - net_read_and_print_end, $00    // remaining confirmed-free bytes, unused so far
    .byte $20, $ba, $de, $ea, $ea, $ea    // data $9e9d (unchanged original code resumes here)
    .byte $ea, $ea, $ea, $ea, $ea, $ea, $20, $ba, $de, $ea, $ea, $ea, $ea, $ea, $ea, $ea    // data $9ea3
    .byte $ea, $ea, $8d, $00, $de, $68, $60, $48, $78, $a9, $88, $48, $a9, $20, $8d, $00    // data $9eb3
    .byte $de, $00, $00, $00, $00, $00, $2c, $80, $80, $2c, $80, $80, $48, $ad, $f2, $de    // data $9ec3
    .byte $8d, $00, $de, $68, $8d, $f7, $de, $8d, $00, $de, $60, $8d, $00, $de, $68, $40    // data $9ed3
    .byte $ea, $85, $9e, $68, $8d, $00, $de, $a5, $9e, $60, $88, $00, $08, $10, $18, $20    // data $9ee3
    .byte $1a, $80, $88, $90, $98, $00, $00, $00, $00, $00, $00, $00, $00, $ea    // data $9ef3
bank05_sub_9f01:
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
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
    bne bank05_sub_9f2b              // d0 02
    dec $9f                // c6 9f
bank05_sub_9f2b:
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
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f58
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f68
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f78
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f88
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f98
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fa8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fb8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fc8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fd8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fe8
    .byte $00, $00, $00, $00, $00, $00, $00, $00    // data $9ff8