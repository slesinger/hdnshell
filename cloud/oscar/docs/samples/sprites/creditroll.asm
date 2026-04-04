; Compiled with 1.32.268
--------------------------------------------------------------------
startup: ; startup
0801 : 0b __ __ INV
0802 : 08 __ __ PHP
0803 : 0a __ __ ASL
0804 : 00 __ __ BRK
0805 : 9e __ __ INV
0806 : 32 __ __ INV
0807 : 30 36 __ BMI $083f ; (startup + 62)
0809 : 31 00 __ AND ($00),y 
080b : 00 __ __ BRK
080c : 00 __ __ BRK
080d : ba __ __ TSX
080e : 8e a3 12 STX $12a3 ; (spentry + 0)
0811 : a2 2c __ LDX #$2c
0813 : a0 00 __ LDY #$00
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 2c __ CPX #$2c
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 88 __ CPY #$88
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 d3 __ LDA #$d3
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 0a JSR $0a00 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 133, "/home/honza/projects/c64/projects/oscar64/samples/sprites/creditroll.c"
.s1:
0a00 : a5 53 __ LDA T14 + 0 
0a02 : 8d d5 9f STA $9fd5 ; (main@stack + 0)
.s4:
0a05 : 20 e1 0c JSR $0ce1 ; (rirq_init_kernal.s4 + 0)
0a08 : a9 00 __ LDA #$00
0a0a : 85 4d __ STA T8 + 0 
0a0c : 85 4e __ STA T9 + 0 
0a0e : 85 50 __ STA T10 + 1 
0a10 : 85 52 __ STA T13 + 0 
0a12 : a9 f8 __ LDA #$f8
0a14 : 8d 55 2c STA $2c55 ; (vspriteScreen + 0)
0a17 : a9 07 __ LDA #$07
0a19 : 8d 56 2c STA $2c56 ; (vspriteScreen + 1)
0a1c : a9 30 __ LDA #$30
0a1e : 85 4f __ STA T10 + 0 
0a20 : a9 81 __ LDA #$81
0a22 : 85 51 __ STA T11 + 0 
0a24 : a9 80 __ LDA #$80
0a26 : 85 53 __ STA T14 + 0 
0a28 : a9 0c __ LDA #$0c
0a2a : 85 10 __ STA P3 
.l5:
0a2c : 20 7d 0d JSR $0d7d ; (rirq_alloc.s4 + 0)
0a2f : a5 4d __ LDA T8 + 0 
0a31 : 0a __ __ ASL
0a32 : aa __ __ TAX
0a33 : a5 1b __ LDA ACCU + 0 
0a35 : 9d 57 2c STA $2c57,x ; (spmux[0] + 0)
0a38 : 18 __ __ CLC
0a39 : 69 01 __ ADC #$01
0a3b : 85 1b __ STA ACCU + 0 
0a3d : a5 1c __ LDA ACCU + 1 
0a3f : 9d 58 2c STA $2c58,x ; (spmux[0] + 1)
0a42 : 69 00 __ ADC #$00
0a44 : 85 1c __ STA ACCU + 1 
0a46 : a9 00 __ LDA #$00
0a48 : 85 1d __ STA ACCU + 2 
0a4a : 85 43 __ STA T1 + 0 
0a4c : a9 01 __ LDA #$01
0a4e : 85 45 __ STA T2 + 0 
0a50 : 85 47 __ STA T3 + 0 
0a52 : a9 d0 __ LDA #$d0
0a54 : 85 48 __ STA T3 + 1 
0a56 : 18 __ __ CLC
.l54:
0a57 : a5 47 __ LDA T3 + 0 
0a59 : a6 43 __ LDX T1 + 0 
0a5b : bc a4 12 LDY $12a4,x ; (irqai[0] + 0)
0a5e : 91 1b __ STA (ACCU + 0),y 
0a60 : a5 48 __ LDA T3 + 1 
0a62 : c8 __ __ INY
0a63 : 91 1b __ STA (ACCU + 0),y 
0a65 : a5 4f __ LDA T10 + 0 
0a67 : bc be 12 LDY $12be,x ; (irqdi[0] + 0)
0a6a : 91 1b __ STA (ACCU + 0),y 
0a6c : a5 1d __ LDA ACCU + 2 
0a6e : 69 f8 __ ADC #$f8
0a70 : a8 __ __ TAY
0a71 : a9 07 __ LDA #$07
0a73 : 69 00 __ ADC #$00
0a75 : 85 4c __ STA T6 + 1 
0a77 : a5 1b __ LDA ACCU + 0 
0a79 : a6 45 __ LDX T2 + 0 
0a7b : e8 __ __ INX
0a7c : e8 __ __ INX
0a7d : 86 45 __ STX T2 + 0 
0a7f : 7d a2 12 ADC $12a2,x ; (__multab48L + 4)
0a82 : 85 49 __ STA T5 + 0 
0a84 : a5 1c __ LDA ACCU + 1 
0a86 : 69 00 __ ADC #$00
0a88 : 85 4a __ STA T5 + 1 
0a8a : 98 __ __ TYA
0a8b : a0 00 __ LDY #$00
0a8d : 91 49 __ STA (T5 + 0),y 
0a8f : a5 4c __ LDA T6 + 1 
0a91 : c8 __ __ INY
0a92 : 91 49 __ STA (T5 + 0),y 
0a94 : a5 51 __ LDA T11 + 0 
0a96 : bc bc 12 LDY $12bc,x ; (irqai[0] + 24)
0a99 : 91 1b __ STA (ACCU + 0),y 
0a9b : e6 43 __ INC T1 + 0 
0a9d : e6 43 __ INC T1 + 0 
0a9f : 18 __ __ CLC
0aa0 : a5 47 __ LDA T3 + 0 
0aa2 : 69 02 __ ADC #$02
0aa4 : 85 47 __ STA T3 + 0 
0aa6 : 90 02 __ BCC $0aaa ; (main.s56 + 0)
.s55:
0aa8 : e6 48 __ INC T3 + 1 
.s56:
0aaa : e6 1d __ INC ACCU + 2 
0aac : a5 1d __ LDA ACCU + 2 
0aae : c9 06 __ CMP #$06
0ab0 : 90 a5 __ BCC $0a57 ; (main.l54 + 0)
.s6:
0ab2 : a5 1b __ LDA ACCU + 0 
0ab4 : a6 4d __ LDX T8 + 0 
0ab6 : 9d 34 2c STA $2c34,x ; (rasterIRQLow[0] + 0)
0ab9 : a5 1c __ LDA ACCU + 1 
0abb : 9d 44 2c STA $2c44,x ; (rasterIRQHigh[0] + 0)
0abe : a5 4e __ LDA T9 + 0 
0ac0 : 69 2d __ ADC #$2d
0ac2 : 9d 00 2c STA $2c00,x ; (rasterIRQRows[0] + 0)
0ac5 : 18 __ __ CLC
0ac6 : 69 02 __ ADC #$02
0ac8 : 85 4e __ STA T9 + 0 
0aca : e6 51 __ INC T11 + 0 
0acc : e6 4d __ INC T8 + 0 
0ace : 18 __ __ CLC
0acf : a5 4f __ LDA T10 + 0 
0ad1 : 69 30 __ ADC #$30
0ad3 : 85 4f __ STA T10 + 0 
0ad5 : a5 50 __ LDA T10 + 1 
0ad7 : 69 00 __ ADC #$00
0ad9 : 85 50 __ STA T10 + 1 
0adb : c9 01 __ CMP #$01
0add : f0 03 __ BEQ $0ae2 ; (main.s50 + 0)
0adf : 4c 2c 0a JMP $0a2c ; (main.l5 + 0)
.s50:
0ae2 : a5 4f __ LDA T10 + 0 
0ae4 : c9 20 __ CMP #$20
0ae6 : d0 f7 __ BNE $0adf ; (main.s6 + 45)
.s7:
0ae8 : a9 00 __ LDA #$00
0aea : 85 0f __ STA P2 
0aec : a9 2c __ LDA #$2c
0aee : 85 0e __ STA P1 
0af0 : a9 63 __ LDA #$63
0af2 : 85 0d __ STA P0 
0af4 : 20 b3 0d JSR $0db3 ; (rirq_build.s4 + 0)
0af7 : a9 00 __ LDA #$00
0af9 : 85 44 __ STA T1 + 1 
0afb : 85 11 __ STA P4 
0afd : 85 12 __ STA P5 
0aff : 85 15 __ STA P8 
0b01 : a9 fa __ LDA #$fa
0b03 : 8d 05 2c STA $2c05 ; (rasterIRQRows[0] + 5)
0b06 : a9 64 __ LDA #$64
0b08 : 8d 39 2c STA $2c39 ; (rasterIRQLow[0] + 5)
0b0b : a9 2c __ LDA #$2c
0b0d : 8d 49 2c STA $2c49 ; (rasterIRQHigh[0] + 5)
0b10 : a9 01 __ LDA #$01
0b12 : 85 0e __ STA P1 
0b14 : 85 14 __ STA P7 
0b16 : 85 16 __ STA P9 
0b18 : 85 17 __ STA P10 
0b1a : a9 80 __ LDA #$80
0b1c : 85 13 __ STA P6 
0b1e : a9 28 __ LDA #$28
0b20 : 85 0f __ STA P2 
0b22 : a9 00 __ LDA #$00
.l52:
0b24 : 85 0d __ STA P0 
0b26 : a5 44 __ LDA T1 + 1 
0b28 : 85 10 __ STA P3 
0b2a : 20 57 0e JSR $0e57 ; (spr_set.s4 + 0)
0b2d : 18 __ __ CLC
0b2e : a5 0f __ LDA P2 
0b30 : 69 30 __ ADC #$30
0b32 : 85 0f __ STA P2 
0b34 : 90 03 __ BCC $0b39 ; (main.s58 + 0)
.s57:
0b36 : e6 44 __ INC T1 + 1 
0b38 : 18 __ __ CLC
.s58:
0b39 : a5 0d __ LDA P0 
0b3b : 69 01 __ ADC #$01
0b3d : c9 06 __ CMP #$06
0b3f : 90 e3 __ BCC $0b24 ; (main.l52 + 0)
.s51:
0b41 : a9 00 __ LDA #$00
0b43 : 20 e1 0e JSR $0ee1 ; (rirq_sort.s4 + 0)
0b46 : 20 70 0f JSR $0f70 ; (rirq_start.s4 + 0)
.l8:
0b49 : a9 00 __ LDA #$00
0b4b : 85 4d __ STA T8 + 0 
.l9:
0b4d : 20 82 0f JSR $0f82 ; (rirq_wait.l4 + 0)
0b50 : a5 52 __ LDA T13 + 0 
0b52 : c6 52 __ DEC T13 + 0 
0b54 : 10 14 __ BPL $0b6a ; (main.s10 + 0)
.s48:
0b56 : 18 __ __ CLC
0b57 : 69 2f __ ADC #$2f
0b59 : 85 52 __ STA T13 + 0 
0b5b : 18 __ __ CLC
0b5c : a5 53 __ LDA T14 + 0 
0b5e : 69 06 __ ADC #$06
0b60 : 85 53 __ STA T14 + 0 
0b62 : c9 a4 __ CMP #$a4
0b64 : d0 04 __ BNE $0b6a ; (main.s10 + 0)
.s49:
0b66 : a9 80 __ LDA #$80
0b68 : 85 53 __ STA T14 + 0 
.s10:
0b6a : a5 52 __ LDA T13 + 0 
0b6c : 29 80 __ AND #$80
0b6e : 10 02 __ BPL $0b72 ; (main.s10 + 8)
0b70 : a9 ff __ LDA #$ff
0b72 : 85 4c __ STA T6 + 1 
0b74 : a2 00 __ LDX #$00
.l53:
0b76 : bd 9e 12 LDA $129e,x ; (__multab48L + 0)
0b79 : 18 __ __ CLC
0b7a : 69 2d __ ADC #$2d
0b7c : 18 __ __ CLC
0b7d : 65 52 __ ADC T13 + 0 
0b7f : a8 __ __ TAY
0b80 : a5 4c __ LDA T6 + 1 
0b82 : 69 00 __ ADC #$00
0b84 : 30 0a __ BMI $0b90 ; (main.s45 + 0)
.s47:
0b86 : d0 04 __ BNE $0b8c ; (main.s11 + 0)
.s46:
0b88 : c0 fa __ CPY #$fa
0b8a : 90 04 __ BCC $0b90 ; (main.s45 + 0)
.s11:
0b8c : a9 ff __ LDA #$ff
0b8e : d0 01 __ BNE $0b91 ; (main.s12 + 0)
.s45:
0b90 : 98 __ __ TYA
.s12:
0b91 : 9d 00 2c STA $2c00,x ; (rasterIRQRows[0] + 0)
0b94 : e8 __ __ INX
0b95 : e0 05 __ CPX #$05
0b97 : 90 dd __ BCC $0b76 ; (main.l53 + 0)
.s13:
0b99 : a9 00 __ LDA #$00
0b9b : 20 e1 0e JSR $0ee1 ; (rirq_sort.s4 + 0)
0b9e : a5 53 __ LDA T14 + 0 
0ba0 : 85 1d __ STA ACCU + 2 
0ba2 : a9 00 __ LDA #$00
0ba4 : 85 1b __ STA ACCU + 0 
0ba6 : 85 44 __ STA T1 + 1 
0ba8 : a0 28 __ LDY #$28
.l14:
0baa : a5 1b __ LDA ACCU + 0 
0bac : 0a __ __ ASL
0bad : aa __ __ TAX
0bae : a5 52 __ LDA T13 + 0 
0bb0 : 9d 01 d0 STA $d001,x 
0bb3 : 98 __ __ TYA
0bb4 : 9d 00 d0 STA $d000,x 
0bb7 : a6 1b __ LDX ACCU + 0 
0bb9 : a5 44 __ LDA T1 + 1 
0bbb : d0 0b __ BNE $0bc8 ; (main.s44 + 0)
.s15:
0bbd : bd 3e 13 LDA $133e,x ; (bitshift[0] + 8)
0bc0 : 49 ff __ EOR #$ff
0bc2 : 2d 10 d0 AND $d010 
0bc5 : 4c ce 0b JMP $0bce ; (main.s16 + 0)
.s44:
0bc8 : ad 10 d0 LDA $d010 
0bcb : 1d 3e 13 ORA $133e,x ; (bitshift[0] + 8)
.s16:
0bce : 8d 10 d0 STA $d010 
0bd1 : a5 1d __ LDA ACCU + 2 
0bd3 : 9d f8 07 STA $07f8,x 
0bd6 : e6 1b __ INC ACCU + 0 
0bd8 : e6 1d __ INC ACCU + 2 
0bda : 98 __ __ TYA
0bdb : 18 __ __ CLC
0bdc : 69 30 __ ADC #$30
0bde : a8 __ __ TAY
0bdf : a5 44 __ LDA T1 + 1 
0be1 : 69 00 __ ADC #$00
0be3 : 85 44 __ STA T1 + 1 
0be5 : c9 01 __ CMP #$01
0be7 : d0 c1 __ BNE $0baa ; (main.l14 + 0)
.s43:
0be9 : c0 48 __ CPY #$48
0beb : d0 bd __ BNE $0baa ; (main.l14 + 0)
.s17:
0bed : a9 00 __ LDA #$00
0bef : 85 1b __ STA ACCU + 0 
.l18:
0bf1 : a5 1d __ LDA ACCU + 2 
0bf3 : c9 a4 __ CMP #$a4
0bf5 : d0 04 __ BNE $0bfb ; (main.s19 + 0)
.s42:
0bf7 : a9 80 __ LDA #$80
0bf9 : 85 1d __ STA ACCU + 2 
.s19:
0bfb : a6 1b __ LDX ACCU + 0 
0bfd : bd 9e 12 LDA $129e,x ; (__multab48L + 0)
0c00 : 18 __ __ CLC
0c01 : 69 30 __ ADC #$30
0c03 : 18 __ __ CLC
0c04 : 65 52 __ ADC T13 + 0 
0c06 : 85 43 __ STA T1 + 0 
0c08 : 8a __ __ TXA
0c09 : 0a __ __ ASL
0c0a : aa __ __ TAX
0c0b : bd 57 2c LDA $2c57,x ; (spmux[0] + 0)
0c0e : 18 __ __ CLC
0c0f : 69 01 __ ADC #$01
0c11 : 85 45 __ STA T2 + 0 
0c13 : bd 58 2c LDA $2c58,x ; (spmux[0] + 1)
0c16 : 69 00 __ ADC #$00
0c18 : 85 46 __ STA T2 + 1 
0c1a : a9 01 __ LDA #$01
0c1c : 85 1c __ STA ACCU + 1 
0c1e : a2 00 __ LDX #$00
0c20 : 86 47 __ STX T3 + 0 
.l20:
0c22 : a5 43 __ LDA T1 + 0 
0c24 : bc be 12 LDY $12be,x ; (irqdi[0] + 0)
0c27 : 91 45 __ STA (T2 + 0),y 
0c29 : a6 1c __ LDX ACCU + 1 
0c2b : e8 __ __ INX
0c2c : e8 __ __ INX
0c2d : 86 1c __ STX ACCU + 1 
0c2f : a5 1d __ LDA ACCU + 2 
0c31 : bc bc 12 LDY $12bc,x ; (irqai[0] + 24)
0c34 : 91 45 __ STA (T2 + 0),y 
0c36 : e6 1d __ INC ACCU + 2 
0c38 : 18 __ __ CLC
0c39 : a5 47 __ LDA T3 + 0 
0c3b : 69 02 __ ADC #$02
0c3d : 85 47 __ STA T3 + 0 
0c3f : aa __ __ TAX
0c40 : c9 0c __ CMP #$0c
0c42 : d0 de __ BNE $0c22 ; (main.l20 + 0)
.s21:
0c44 : e6 1b __ INC ACCU + 0 
0c46 : a5 1b __ LDA ACCU + 0 
0c48 : c9 05 __ CMP #$05
0c4a : d0 a5 __ BNE $0bf1 ; (main.l18 + 0)
.s22:
0c4c : a5 52 __ LDA T13 + 0 
0c4e : c9 2b __ CMP #$2b
0c50 : d0 19 __ BNE $0c6b ; (main.s23 + 0)
.s41:
0c52 : a2 00 __ LDX #$00
.s39:
0c54 : 86 10 __ STX P3 
0c56 : a9 ec __ LDA #$ec
0c58 : 85 0d __ STA P0 
0c5a : a9 9f __ LDA #$9f
0c5c : 85 0e __ STA P1 
0c5e : 38 __ __ SEC
0c5f : a5 1d __ LDA ACCU + 2 
0c61 : e9 82 __ SBC #$82
.s30:
0c63 : 85 0f __ STA P2 
0c65 : 20 34 11 JSR $1134 ; (expandline.s4 + 0)
0c68 : 4c 4d 0b JMP $0b4d ; (main.l9 + 0)
.s23:
0c6b : 49 80 __ EOR #$80
0c6d : c9 ab __ CMP #$ab
0c6f : a5 52 __ LDA T13 + 0 
0c71 : 90 4e __ BCC $0cc1 ; (main.s33 + 0)
.s24:
0c73 : c9 2d __ CMP #$2d
0c75 : d0 04 __ BNE $0c7b ; (main.s25 + 0)
.s31:
0c77 : a2 00 __ LDX #$00
0c79 : f0 34 __ BEQ $0caf ; (main.s32 + 0)
.s25:
0c7b : 90 1e __ BCC $0c9b ; (main.s28 + 0)
.s26:
0c7d : c9 2e __ CMP #$2e
0c7f : d0 e7 __ BNE $0c68 ; (main.s30 + 5)
.s27:
0c81 : a5 4d __ LDA T8 + 0 
0c83 : 85 0f __ STA P2 
0c85 : a9 e0 __ LDA #$e0
0c87 : 85 0d __ STA P0 
0c89 : a9 9f __ LDA #$9f
0c8b : 85 0e __ STA P1 
0c8d : 20 8e 0f JSR $0f8e ; (readline.s4 + 0)
0c90 : e6 4d __ INC T8 + 0 
0c92 : a5 4d __ LDA T8 + 0 
0c94 : c9 1b __ CMP #$1b
0c96 : d0 d0 __ BNE $0c68 ; (main.s30 + 5)
0c98 : 4c 49 0b JMP $0b49 ; (main.l8 + 0)
.s28:
0c9b : a9 00 __ LDA #$00
0c9d : 85 10 __ STA P3 
.s29:
0c9f : a9 e6 __ LDA #$e6
0ca1 : 85 0d __ STA P0 
0ca3 : a9 9f __ LDA #$9f
0ca5 : 85 0e __ STA P1 
0ca7 : 38 __ __ SEC
0ca8 : a5 1d __ LDA ACCU + 2 
0caa : e9 84 __ SBC #$84
0cac : 4c 63 0c JMP $0c63 ; (main.s30 + 0)
.s32:
0caf : 86 10 __ STX P3 
0cb1 : a9 e0 __ LDA #$e0
0cb3 : 85 0d __ STA P0 
0cb5 : a9 9f __ LDA #$9f
0cb7 : 85 0e __ STA P1 
0cb9 : 38 __ __ SEC
0cba : a5 1d __ LDA ACCU + 2 
0cbc : e9 86 __ SBC #$86
0cbe : 4c 63 0c JMP $0c63 ; (main.s30 + 0)
.s33:
0cc1 : c9 29 __ CMP #$29
0cc3 : d0 04 __ BNE $0cc9 ; (main.s34 + 0)
.s40:
0cc5 : a2 0c __ LDX #$0c
0cc7 : d0 e6 __ BNE $0caf ; (main.s32 + 0)
.s34:
0cc9 : b0 b6 __ BCS $0c81 ; (main.s27 + 0)
.s35:
0ccb : c9 27 __ CMP #$27
0ccd : d0 04 __ BNE $0cd3 ; (main.s36 + 0)
.s38:
0ccf : a2 0c __ LDX #$0c
0cd1 : d0 81 __ BNE $0c54 ; (main.s39 + 0)
.s36:
0cd3 : c9 28 __ CMP #$28
0cd5 : d0 91 __ BNE $0c68 ; (main.s30 + 5)
.s37:
0cd7 : a9 0c __ LDA #$0c
0cd9 : 85 10 __ STA P3 
0cdb : a9 28 __ LDA #$28
0cdd : 85 52 __ STA T13 + 0 
0cdf : d0 be __ BNE $0c9f ; (main.s29 + 0)
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0ce1 : 20 02 0d JSR $0d02 ; (rirq_init_tables.s4 + 0)
0ce4 : 78 __ __ SEI
0ce5 : a9 01 __ LDA #$01
0ce7 : 8d 1a d0 STA $d01a 
0cea : a9 20 __ LDA #$20
0cec : 8d 14 03 STA $0314 
0cef : a9 0d __ LDA #$0d
0cf1 : 8d 15 03 STA $0315 
0cf4 : ad 11 d0 LDA $d011 
0cf7 : 29 7f __ AND #$7f
0cf9 : 8d 11 d0 STA $d011 
0cfc : a9 ff __ LDA #$ff
0cfe : 8d 12 d0 STA $d012 
.s3:
0d01 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0d02 : a2 00 __ LDX #$00
.l5:
0d04 : a9 ff __ LDA #$ff
0d06 : 9d 00 2c STA $2c00,x ; (rasterIRQRows[0] + 0)
0d09 : 8a __ __ TXA
0d0a : 9d 12 2c STA $2c12,x ; (rasterIRQIndex[0] + 1)
0d0d : e8 __ __ INX
0d0e : e0 10 __ CPX #$10
0d10 : d0 f2 __ BNE $0d04 ; (rirq_init_tables.l5 + 0)
.s6:
0d12 : 8e 11 2c STX $2c11 ; (rasterIRQIndex[0] + 0)
0d15 : a9 ff __ LDA #$ff
0d17 : 8d 32 2c STA $2c32 ; (rasterIRQNext[0] + 16)
0d1a : a9 00 __ LDA #$00
0d1c : 8d 10 2c STA $2c10 ; (rasterIRQRows[0] + 16)
.s3:
0d1f : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0d20 : ad 19 d0 LDA $d019 
0d23 : 10 51 __ BPL $0d76 ; (rirq_isr_kernal_io + 86)
0d25 : ae 33 2c LDX $2c33 ; (nextIRQ + 0)
0d28 : 30 33 __ BMI $0d5d ; (rirq_isr_kernal_io + 61)
0d2a : bd 22 2c LDA $2c22,x ; (rasterIRQNext[0] + 0)
0d2d : bc 12 2c LDY $2c12,x ; (rasterIRQIndex[0] + 1)
0d30 : be 34 2c LDX $2c34,y ; (rasterIRQLow[0] + 0)
0d33 : 8e 3d 0d STX $0d3d ; (rirq_isr_kernal_io + 29)
0d36 : be 44 2c LDX $2c44,y ; (rasterIRQHigh[0] + 0)
0d39 : 8e 3e 0d STX $0d3e ; (rirq_isr_kernal_io + 30)
0d3c : 20 00 00 JSR $0000 
0d3f : ee 33 2c INC $2c33 ; (nextIRQ + 0)
0d42 : ae 33 2c LDX $2c33 ; (nextIRQ + 0)
0d45 : bc 22 2c LDY $2c22,x ; (rasterIRQNext[0] + 0)
0d48 : 0e 19 d0 ASL $d019 
0d4b : c0 ff __ CPY #$ff
0d4d : f0 14 __ BEQ $0d63 ; (rirq_isr_kernal_io + 67)
0d4f : 88 __ __ DEY
0d50 : 88 __ __ DEY
0d51 : 8c 12 d0 STY $d012 
0d54 : 88 __ __ DEY
0d55 : cc 12 d0 CPY $d012 
0d58 : 90 d0 __ BCC $0d2a ; (rirq_isr_kernal_io + 10)
0d5a : 4c 81 ea JMP $ea81 
0d5d : 0e 19 d0 ASL $d019 
0d60 : 4c 81 ea JMP $ea81 
0d63 : ee 54 2c INC $2c54 ; (rirq_count + 0)
0d66 : ac 22 2c LDY $2c22 ; (rasterIRQNext[0] + 0)
0d69 : 88 __ __ DEY
0d6a : 88 __ __ DEY
0d6b : 8c 12 d0 STY $d012 
0d6e : a2 00 __ LDX #$00
0d70 : 8e 33 2c STX $2c33 ; (nextIRQ + 0)
0d73 : 4c 81 ea JMP $ea81 
0d76 : ad 0d dc LDA $dc0d 
0d79 : 58 __ __ CLI
0d7a : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_alloc: ; rirq_alloc(u8)->struct RIRQCode*
; 123, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0d7d : a5 10 __ LDA P3 ; (size + 0)
0d7f : 85 0f __ STA P2 
0d81 : 0a __ __ ASL
0d82 : 85 1b __ STA ACCU + 0 
0d84 : a9 00 __ LDA #$00
0d86 : 2a __ __ ROL
0d87 : 06 1b __ ASL ACCU + 0 
0d89 : 2a __ __ ROL
0d8a : a8 __ __ TAY
0d8b : a5 1b __ LDA ACCU + 0 
0d8d : 65 10 __ ADC P3 ; (size + 0)
0d8f : 90 02 __ BCC $0d93 ; (rirq_alloc.s6 + 0)
.s5:
0d91 : c8 __ __ INY
0d92 : 18 __ __ CLC
.s6:
0d93 : 69 20 __ ADC #$20
0d95 : 85 1b __ STA ACCU + 0 
0d97 : 90 01 __ BCC $0d9a ; (rirq_alloc.s8 + 0)
.s7:
0d99 : c8 __ __ INY
.s8:
0d9a : 84 1c __ STY ACCU + 1 
0d9c : 20 d0 11 JSR $11d0 ; (crt_malloc + 0)
0d9f : a5 1b __ LDA ACCU + 0 
0da1 : 85 0d __ STA P0 
0da3 : a5 1c __ LDA ACCU + 1 
0da5 : 85 0e __ STA P1 
0da7 : 20 b3 0d JSR $0db3 ; (rirq_build.s4 + 0)
0daa : a5 0d __ LDA P0 
0dac : 85 1b __ STA ACCU + 0 
0dae : a5 0e __ LDA P1 
0db0 : 85 1c __ STA ACCU + 1 
.s3:
0db2 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0db3 : a5 0d __ LDA P0 ; (ic + 0)
0db5 : 85 1b __ STA ACCU + 0 
0db7 : a5 0e __ LDA P1 ; (ic + 1)
0db9 : 85 1c __ STA ACCU + 1 
0dbb : a9 a0 __ LDA #$a0
0dbd : a0 01 __ LDY #$01
0dbf : 91 0d __ STA (P0),y ; (ic + 0)
0dc1 : a9 00 __ LDA #$00
0dc3 : c8 __ __ INY
0dc4 : 91 0d __ STA (P0),y ; (ic + 0)
0dc6 : a9 a2 __ LDA #$a2
0dc8 : c8 __ __ INY
0dc9 : 91 0d __ STA (P0),y ; (ic + 0)
0dcb : a9 00 __ LDA #$00
0dcd : c8 __ __ INY
0dce : 91 0d __ STA (P0),y ; (ic + 0)
0dd0 : a9 cd __ LDA #$cd
0dd2 : c8 __ __ INY
0dd3 : 91 0d __ STA (P0),y ; (ic + 0)
0dd5 : a9 12 __ LDA #$12
0dd7 : c8 __ __ INY
0dd8 : 91 0d __ STA (P0),y ; (ic + 0)
0dda : a9 d0 __ LDA #$d0
0ddc : c8 __ __ INY
0ddd : 91 0d __ STA (P0),y ; (ic + 0)
0ddf : a9 b0 __ LDA #$b0
0de1 : c8 __ __ INY
0de2 : 91 0d __ STA (P0),y ; (ic + 0)
0de4 : a9 fb __ LDA #$fb
0de6 : c8 __ __ INY
0de7 : 91 0d __ STA (P0),y ; (ic + 0)
0de9 : a9 8c __ LDA #$8c
0deb : c8 __ __ INY
0dec : 91 0d __ STA (P0),y ; (ic + 0)
0dee : a9 00 __ LDA #$00
0df0 : c8 __ __ INY
0df1 : 91 0d __ STA (P0),y ; (ic + 0)
0df3 : c8 __ __ INY
0df4 : 91 0d __ STA (P0),y ; (ic + 0)
0df6 : a8 __ __ TAY
0df7 : a5 0f __ LDA P2 ; (size + 0)
0df9 : 91 0d __ STA (P0),y ; (ic + 0)
0dfb : f0 53 __ BEQ $0e50 ; (rirq_build.s5 + 0)
.s6:
0dfd : a0 0d __ LDY #$0d
0dff : c9 01 __ CMP #$01
0e01 : d0 05 __ BNE $0e08 ; (rirq_build.s7 + 0)
.s10:
0e03 : a9 60 __ LDA #$60
0e05 : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0e07 : 60 __ __ RTS
.s7:
0e08 : a9 8e __ LDA #$8e
0e0a : 91 0d __ STA (P0),y ; (ic + 0)
0e0c : a9 00 __ LDA #$00
0e0e : c8 __ __ INY
0e0f : 91 0d __ STA (P0),y ; (ic + 0)
0e11 : c8 __ __ INY
0e12 : 91 0d __ STA (P0),y ; (ic + 0)
0e14 : a5 0f __ LDA P2 ; (size + 0)
0e16 : c9 03 __ CMP #$03
0e18 : 90 2a __ BCC $0e44 ; (rirq_build.s8 + 0)
.s9:
0e1a : e9 02 __ SBC #$02
0e1c : aa __ __ TAX
0e1d : 18 __ __ CLC
0e1e : a5 0d __ LDA P0 ; (ic + 0)
0e20 : 69 01 __ ADC #$01
0e22 : 85 1b __ STA ACCU + 0 
0e24 : a5 0e __ LDA P1 ; (ic + 1)
0e26 : 69 00 __ ADC #$00
0e28 : 85 1c __ STA ACCU + 1 
.l11:
0e2a : a9 a9 __ LDA #$a9
0e2c : 91 1b __ STA (ACCU + 0),y 
0e2e : a9 00 __ LDA #$00
0e30 : c8 __ __ INY
0e31 : 91 1b __ STA (ACCU + 0),y 
0e33 : a9 8d __ LDA #$8d
0e35 : c8 __ __ INY
0e36 : 91 1b __ STA (ACCU + 0),y 
0e38 : a9 00 __ LDA #$00
0e3a : c8 __ __ INY
0e3b : 91 1b __ STA (ACCU + 0),y 
0e3d : c8 __ __ INY
0e3e : 91 1b __ STA (ACCU + 0),y 
0e40 : c8 __ __ INY
0e41 : ca __ __ DEX
0e42 : d0 e6 __ BNE $0e2a ; (rirq_build.l11 + 0)
.s8:
0e44 : 98 __ __ TYA
0e45 : 18 __ __ CLC
0e46 : 65 0d __ ADC P0 ; (ic + 0)
0e48 : 85 1b __ STA ACCU + 0 
0e4a : a5 0e __ LDA P1 ; (ic + 1)
0e4c : 69 00 __ ADC #$00
0e4e : 85 1c __ STA ACCU + 1 
.s5:
0e50 : a9 60 __ LDA #$60
0e52 : a0 01 __ LDY #$01
0e54 : 91 1b __ STA (ACCU + 0),y 
0e56 : 60 __ __ RTS
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0e57 : a6 0d __ LDX P0 ; (sp + 0)
0e59 : bc 3e 13 LDY $133e,x ; (bitshift[0] + 8)
0e5c : a5 0e __ LDA P1 ; (show + 0)
0e5e : d0 09 __ BNE $0e69 ; (spr_set.s19 + 0)
.s5:
0e60 : 98 __ __ TYA
0e61 : 49 ff __ EOR #$ff
0e63 : 2d 15 d0 AND $d015 
0e66 : 4c 6d 0e JMP $0e6d ; (spr_set.s6 + 0)
.s19:
0e69 : 98 __ __ TYA
0e6a : 0d 15 d0 ORA $d015 
.s6:
0e6d : 8d 15 d0 STA $d015 
0e70 : a5 15 __ LDA P8 ; (multi + 0)
0e72 : d0 09 __ BNE $0e7d ; (spr_set.s18 + 0)
.s7:
0e74 : 98 __ __ TYA
0e75 : 49 ff __ EOR #$ff
0e77 : 2d 1c d0 AND $d01c 
0e7a : 4c 81 0e JMP $0e81 ; (spr_set.s8 + 0)
.s18:
0e7d : 98 __ __ TYA
0e7e : 0d 1c d0 ORA $d01c 
.s8:
0e81 : 8d 1c d0 STA $d01c 
0e84 : a5 16 __ LDA P9 ; (xexpand + 0)
0e86 : d0 09 __ BNE $0e91 ; (spr_set.s17 + 0)
.s9:
0e88 : 98 __ __ TYA
0e89 : 49 ff __ EOR #$ff
0e8b : 2d 1d d0 AND $d01d 
0e8e : 4c 95 0e JMP $0e95 ; (spr_set.s10 + 0)
.s17:
0e91 : 98 __ __ TYA
0e92 : 0d 1d d0 ORA $d01d 
.s10:
0e95 : 8d 1d d0 STA $d01d 
0e98 : a5 17 __ LDA P10 ; (yexpand + 0)
0e9a : d0 09 __ BNE $0ea5 ; (spr_set.s16 + 0)
.s11:
0e9c : 98 __ __ TYA
0e9d : 49 ff __ EOR #$ff
0e9f : 2d 17 d0 AND $d017 
0ea2 : 4c a9 0e JMP $0ea9 ; (spr_set.s12 + 0)
.s16:
0ea5 : 98 __ __ TYA
0ea6 : 0d 17 d0 ORA $d017 
.s12:
0ea9 : 8d 17 d0 STA $d017 
0eac : 8a __ __ TXA
0ead : 0a __ __ ASL
0eae : aa __ __ TAX
0eaf : a5 11 __ LDA P4 ; (ypos + 0)
0eb1 : 9d 01 d0 STA $d001,x 
0eb4 : a5 0f __ LDA P2 ; (xpos + 0)
0eb6 : 9d 00 d0 STA $d000,x 
0eb9 : 46 10 __ LSR P3 ; (xpos + 1)
0ebb : 98 __ __ TYA
0ebc : 90 05 __ BCC $0ec3 ; (spr_set.s13 + 0)
.s15:
0ebe : 0d 10 d0 ORA $d010 
0ec1 : b0 05 __ BCS $0ec8 ; (spr_set.s14 + 0)
.s13:
0ec3 : 49 ff __ EOR #$ff
0ec5 : 2d 10 d0 AND $d010 
.s14:
0ec8 : 8d 10 d0 STA $d010 
0ecb : ad 55 2c LDA $2c55 ; (vspriteScreen + 0)
0ece : 85 1b __ STA ACCU + 0 
0ed0 : ad 56 2c LDA $2c56 ; (vspriteScreen + 1)
0ed3 : 85 1c __ STA ACCU + 1 
0ed5 : a5 13 __ LDA P6 ; (image + 0)
0ed7 : a4 0d __ LDY P0 ; (sp + 0)
0ed9 : 91 1b __ STA (ACCU + 0),y 
0edb : a5 14 __ LDA P7 ; (color + 0)
0edd : 99 27 d0 STA $d027,y 
.s3:
0ee0 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0ee1 : 85 0d __ STA P0 ; (inirq + 0)
0ee3 : a9 ff __ LDA #$ff
0ee5 : 8d 33 2c STA $2c33 ; (nextIRQ + 0)
0ee8 : ae 12 2c LDX $2c12 ; (rasterIRQIndex[0] + 1)
0eeb : bd 00 2c LDA $2c00,x ; (rasterIRQRows[0] + 0)
0eee : 85 1c __ STA ACCU + 1 
0ef0 : a2 02 __ LDX #$02
.l5:
0ef2 : bc 11 2c LDY $2c11,x ; (rasterIRQIndex[0] + 0)
0ef5 : b9 00 2c LDA $2c00,y ; (rasterIRQRows[0] + 0)
0ef8 : c5 1c __ CMP ACCU + 1 
0efa : 90 04 __ BCC $0f00 ; (rirq_sort.s12 + 0)
.s6:
0efc : 85 1c __ STA ACCU + 1 
0efe : b0 24 __ BCS $0f24 ; (rirq_sort.s7 + 0)
.s12:
0f00 : 86 1d __ STX ACCU + 2 
0f02 : 84 1e __ STY ACCU + 3 
0f04 : 85 1b __ STA ACCU + 0 
0f06 : bd 10 2c LDA $2c10,x ; (rasterIRQRows[0] + 16)
0f09 : 9d 11 2c STA $2c11,x ; (rasterIRQIndex[0] + 0)
0f0c : 90 05 __ BCC $0f13 ; (rirq_sort.l13 + 0)
.s15:
0f0e : 98 __ __ TYA
0f0f : 9d 10 2c STA $2c10,x ; (rasterIRQRows[0] + 16)
0f12 : ca __ __ DEX
.l13:
0f13 : a5 1b __ LDA ACCU + 0 
0f15 : bc 0f 2c LDY $2c0f,x ; (rasterIRQRows[0] + 15)
0f18 : d9 00 2c CMP $2c00,y ; (rasterIRQRows[0] + 0)
0f1b : 90 f1 __ BCC $0f0e ; (rirq_sort.s15 + 0)
.s14:
0f1d : a5 1e __ LDA ACCU + 3 
0f1f : 9d 10 2c STA $2c10,x ; (rasterIRQRows[0] + 16)
0f22 : a6 1d __ LDX ACCU + 2 
.s7:
0f24 : e8 __ __ INX
0f25 : e0 11 __ CPX #$11
0f27 : 90 c9 __ BCC $0ef2 ; (rirq_sort.l5 + 0)
.s8:
0f29 : a2 03 __ LDX #$03
.l17:
0f2b : bc 12 2c LDY $2c12,x ; (rasterIRQIndex[0] + 1)
0f2e : b9 00 2c LDA $2c00,y ; (rasterIRQRows[0] + 0)
0f31 : 9d 22 2c STA $2c22,x ; (rasterIRQNext[0] + 0)
0f34 : bc 16 2c LDY $2c16,x ; (rasterIRQIndex[0] + 5)
0f37 : b9 00 2c LDA $2c00,y ; (rasterIRQRows[0] + 0)
0f3a : 9d 26 2c STA $2c26,x ; (rasterIRQNext[0] + 4)
0f3d : bc 1a 2c LDY $2c1a,x ; (rasterIRQIndex[0] + 9)
0f40 : b9 00 2c LDA $2c00,y ; (rasterIRQRows[0] + 0)
0f43 : 9d 2a 2c STA $2c2a,x ; (rasterIRQNext[0] + 8)
0f46 : bc 1e 2c LDY $2c1e,x ; (rasterIRQIndex[0] + 13)
0f49 : b9 00 2c LDA $2c00,y ; (rasterIRQRows[0] + 0)
0f4c : 9d 2e 2c STA $2c2e,x ; (rasterIRQNext[0] + 12)
0f4f : ca __ __ DEX
0f50 : 10 d9 __ BPL $0f2b ; (rirq_sort.l17 + 0)
.s18:
0f52 : ad 54 2c LDA $2c54 ; (rirq_count + 0)
0f55 : 8d 83 2c STA $2c83 ; (rirq_pcount + 0)
0f58 : a5 0d __ LDA P0 ; (inirq + 0)
0f5a : f0 06 __ BEQ $0f62 ; (rirq_sort.s9 + 0)
.s11:
0f5c : a9 0f __ LDA #$0f
.s16:
0f5e : 8d 33 2c STA $2c33 ; (nextIRQ + 0)
.s3:
0f61 : 60 __ __ RTS
.s9:
0f62 : ac 22 2c LDY $2c22 ; (rasterIRQNext[0] + 0)
0f65 : c0 ff __ CPY #$ff
0f67 : f0 f8 __ BEQ $0f61 ; (rirq_sort.s3 + 0)
.s10:
0f69 : 88 __ __ DEY
0f6a : 8c 12 d0 STY $d012 
0f6d : 4c 5e 0f JMP $0f5e ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0f70 : ad 11 d0 LDA $d011 
0f73 : 29 7f __ AND #$7f
0f75 : 8d 11 d0 STA $d011 
0f78 : a9 64 __ LDA #$64
0f7a : 8d 12 d0 STA $d012 
0f7d : 0e 19 d0 ASL $d019 
0f80 : 58 __ __ CLI
.s3:
0f81 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_wait: ; rirq_wait()->void
; 198, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.l4:
0f82 : ad 54 2c LDA $2c54 ; (rirq_count + 0)
0f85 : cd 83 2c CMP $2c83 ; (rirq_pcount + 0)
0f88 : f0 f8 __ BEQ $0f82 ; (rirq_wait.l4 + 0)
.s5:
0f8a : 8d 83 2c STA $2c83 ; (rirq_pcount + 0)
.s3:
0f8d : 60 __ __ RTS
--------------------------------------------------------------------
readline: ; readline(u8*,u8)->void
;  75, "/home/honza/projects/c64/projects/oscar64/samples/sprites/creditroll.c"
.s4:
0f8e : a5 0f __ LDA P2 ; (n + 0)
0f90 : 0a __ __ ASL
0f91 : aa __ __ TAX
0f92 : bd 00 13 LDA $1300,x ; (scrolltext[0] + 0)
0f95 : 85 1b __ STA ACCU + 0 
0f97 : bd 01 13 LDA $1301,x ; (scrolltext[0] + 1)
0f9a : 85 1c __ STA ACCU + 1 
0f9c : a0 00 __ LDY #$00
0f9e : b1 1b __ LDA (ACCU + 0),y 
0fa0 : f0 05 __ BEQ $0fa7 ; (readline.s5 + 0)
.l12:
0fa2 : c8 __ __ INY
0fa3 : b1 1b __ LDA (ACCU + 0),y 
0fa5 : d0 fb __ BNE $0fa2 ; (readline.l12 + 0)
.s5:
0fa7 : 84 1d __ STY ACCU + 2 
0fa9 : 85 1e __ STA ACCU + 3 
0fab : 38 __ __ SEC
0fac : a9 12 __ LDA #$12
0fae : e5 1d __ SBC ACCU + 2 
0fb0 : 6a __ __ ROR
0fb1 : 49 80 __ EOR #$80
0fb3 : f0 0f __ BEQ $0fc4 ; (readline.s6 + 0)
.s11:
0fb5 : 85 1d __ STA ACCU + 2 
0fb7 : a9 20 __ LDA #$20
0fb9 : a0 00 __ LDY #$00
.l13:
0fbb : 91 0d __ STA (P0),y ; (dp + 0)
0fbd : c8 __ __ INY
0fbe : c4 1d __ CPY ACCU + 2 
0fc0 : 90 f9 __ BCC $0fbb ; (readline.l13 + 0)
.s14:
0fc2 : 84 1e __ STY ACCU + 3 
.s6:
0fc4 : a9 00 __ LDA #$00
0fc6 : 85 1d __ STA ACCU + 2 
0fc8 : f0 08 __ BEQ $0fd2 ; (readline.l7 + 0)
.s10:
0fca : a4 1e __ LDY ACCU + 3 
0fcc : 91 0d __ STA (P0),y ; (dp + 0)
0fce : e6 1e __ INC ACCU + 3 
0fd0 : e6 1d __ INC ACCU + 2 
.l7:
0fd2 : a4 1d __ LDY ACCU + 2 
0fd4 : b1 1b __ LDA (ACCU + 0),y 
0fd6 : d0 f2 __ BNE $0fca ; (readline.s10 + 0)
.s8:
0fd8 : a4 1e __ LDY ACCU + 3 
0fda : c0 12 __ CPY #$12
0fdc : b0 09 __ BCS $0fe7 ; (readline.s3 + 0)
.s9:
0fde : a9 20 __ LDA #$20
.l15:
0fe0 : 91 0d __ STA (P0),y ; (dp + 0)
0fe2 : c8 __ __ INY
0fe3 : c0 12 __ CPY #$12
0fe5 : 90 f9 __ BCC $0fe0 ; (readline.l15 + 0)
.s3:
0fe7 : 60 __ __ RTS
--------------------------------------------------------------------
0fe8 : __ __ __ BYT 54 68 69 73 20 73 61 6d 70 6c 65 20 75 73 65 73 : This sample uses
0ff8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
0ff9 : __ __ __ BYT 73 69 78 20 73 70 72 69 74 65 73 00             : six sprites.
--------------------------------------------------------------------
1005 : __ __ __ BYT 6d 75 6c 74 69 70 6c 65 78 65 64 20 73 69 78 00 : multiplexed six.
--------------------------------------------------------------------
1015 : __ __ __ BYT 74 69 6d 65 73 20 74 6f 20 70 72 6f 76 69 64 65 : times to provide
1025 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1026 : __ __ __ BYT 74 77 65 6c 76 65 20 6c 69 6e 65 73 20 6f 66 00 : twelve lines of.
--------------------------------------------------------------------
1036 : __ __ __ BYT 74 65 78 74 20 77 69 74 68 20 65 69 67 68 74 65 : text with eighte
1046 : __ __ __ BYT 65 6e 00                                        : en.
--------------------------------------------------------------------
1049 : __ __ __ BYT 63 68 61 72 61 63 74 65 72 73 20 65 61 63 68 00 : characters each.
--------------------------------------------------------------------
1059 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
105a : __ __ __ BYT 65 61 63 68 20 63 68 61 72 61 63 74 65 72 20 69 : each character i
106a : __ __ __ BYT 73 00                                           : s.
--------------------------------------------------------------------
106c : __ __ __ BYT 65 78 74 72 61 63 74 65 64 20 66 72 6f 6d 20 61 : extracted from a
107c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
107d : __ __ __ BYT 63 75 73 74 6f 6d 20 66 6f 6e 74 20 69 6e 74 6f : custom font into
108d : __ __ __ BYT 20 61 00                                        :  a.
--------------------------------------------------------------------
1090 : __ __ __ BYT 6e 65 77 20 73 70 72 69 74 65 20 61 6e 64 20 74 : new sprite and t
10a0 : __ __ __ BYT 68 65 00                                        : he.
--------------------------------------------------------------------
10a3 : __ __ __ BYT 73 70 72 69 74 65 73 20 61 72 65 20 74 68 65 6e : sprites are then
10b3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
10b4 : __ __ __ BYT 6d 6f 76 65 64 20 75 70 20 74 68 65 00          : moved up the.
--------------------------------------------------------------------
10c1 : __ __ __ BYT 73 63 72 65 65 6e 00                            : screen.
--------------------------------------------------------------------
10c8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
10c9 : __ __ __ BYT 69 6e 74 65 72 72 75 70 74 73 20 61 72 65 00    : interrupts are.
--------------------------------------------------------------------
10d8 : __ __ __ BYT 75 73 65 64 20 74 6f 20 73 77 69 74 63 68 20 74 : used to switch t
10e8 : __ __ __ BYT 68 65 00                                        : he.
--------------------------------------------------------------------
10eb : __ __ __ BYT 73 70 72 69 74 65 20 76 65 72 74 69 63 61 6c 00 : sprite vertical.
--------------------------------------------------------------------
10fb : __ __ __ BYT 70 6f 73 69 74 69 6f 6e 20 61 6e 64 00          : position and.
--------------------------------------------------------------------
1108 : __ __ __ BYT 67 72 61 70 68 69 63 73 00                      : graphics.
--------------------------------------------------------------------
1111 : __ __ __ BYT 64 61 74 61 20 65 76 65 72 79 20 74 77 6f 00    : data every two.
--------------------------------------------------------------------
1120 : __ __ __ BYT 63 68 61 72 61 63 74 65 72 20 6c 69 6e 65 73 00 : character lines.
--------------------------------------------------------------------
1130 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1131 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1132 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1133 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
expandline: ; expandline(const u8*,u8,u8)->void
; 104, "/home/honza/projects/c64/projects/oscar64/samples/sprites/creditroll.c"
.s4:
1134 : a5 10 __ LDA P3 ; (ty + 0)
1136 : 0a __ __ ASL
1137 : a2 00 __ LDX #$00
1139 : 90 02 __ BCC $113d ; (expandline.s10 + 0)
.s9:
113b : e8 __ __ INX
113c : 18 __ __ CLC
.s10:
113d : 65 10 __ ADC P3 ; (ty + 0)
113f : 85 1b __ STA ACCU + 0 
1141 : 90 01 __ BCC $1144 ; (expandline.s12 + 0)
.s11:
1143 : e8 __ __ INX
.s12:
1144 : 86 1c __ STX ACCU + 1 
1146 : a5 0f __ LDA P2 ; (sppos + 0)
1148 : 4a __ __ LSR
1149 : 6a __ __ ROR
114a : aa __ __ TAX
114b : 29 80 __ AND #$80
114d : 6a __ __ ROR
114e : 65 1b __ ADC ACCU + 0 
1150 : a8 __ __ TAY
1151 : 8a __ __ TXA
1152 : 29 3f __ AND #$3f
1154 : 65 1c __ ADC ACCU + 1 
1156 : aa __ __ TAX
1157 : 98 __ __ TYA
1158 : 18 __ __ CLC
1159 : 69 00 __ ADC #$00
115b : 85 1b __ STA ACCU + 0 
115d : 8a __ __ TXA
115e : 69 20 __ ADC #$20
1160 : 85 1c __ STA ACCU + 1 
1162 : a9 00 __ LDA #$00
1164 : 85 1d __ STA ACCU + 2 
1166 : 85 1e __ STA ACCU + 3 
1168 : a8 __ __ TAY
.l5:
1169 : b1 0d __ LDA (P0),y ; (line + 0)
116b : 29 1f __ AND #$1f
116d : 0a __ __ ASL
116e : 0a __ __ ASL
116f : 0a __ __ ASL
1170 : aa __ __ TAX
1171 : bd 00 14 LDA $1400,x ; (charset[0] + 0)
1174 : a0 00 __ LDY #$00
1176 : 91 1b __ STA (ACCU + 0),y 
1178 : bd 01 14 LDA $1401,x ; (charset[0] + 1)
117b : a0 03 __ LDY #$03
117d : 91 1b __ STA (ACCU + 0),y 
117f : bd 02 14 LDA $1402,x ; (charset[0] + 2)
1182 : a0 06 __ LDY #$06
1184 : 91 1b __ STA (ACCU + 0),y 
1186 : bd 03 14 LDA $1403,x ; (charset[0] + 3)
1189 : a0 09 __ LDY #$09
118b : 91 1b __ STA (ACCU + 0),y 
118d : bd 04 14 LDA $1404,x ; (charset[0] + 4)
1190 : a0 0c __ LDY #$0c
1192 : 91 1b __ STA (ACCU + 0),y 
1194 : bd 05 14 LDA $1405,x ; (charset[0] + 5)
1197 : a0 0f __ LDY #$0f
1199 : 91 1b __ STA (ACCU + 0),y 
119b : bd 06 14 LDA $1406,x ; (charset[0] + 6)
119e : a0 12 __ LDY #$12
11a0 : 91 1b __ STA (ACCU + 0),y 
11a2 : bd 07 14 LDA $1407,x ; (charset[0] + 7)
11a5 : a0 15 __ LDY #$15
11a7 : 91 1b __ STA (ACCU + 0),y 
11a9 : e6 1d __ INC ACCU + 2 
11ab : a5 1d __ LDA ACCU + 2 
11ad : c9 03 __ CMP #$03
11af : f0 0f __ BEQ $11c0 ; (expandline.s8 + 0)
.s6:
11b1 : e6 1b __ INC ACCU + 0 
11b3 : d0 02 __ BNE $11b7 ; (expandline.s7 + 0)
.s15:
11b5 : e6 1c __ INC ACCU + 1 
.s7:
11b7 : e6 1e __ INC ACCU + 3 
11b9 : a4 1e __ LDY ACCU + 3 
11bb : c0 06 __ CPY #$06
11bd : 90 aa __ BCC $1169 ; (expandline.l5 + 0)
.s3:
11bf : 60 __ __ RTS
.s8:
11c0 : a5 1b __ LDA ACCU + 0 
11c2 : 69 3d __ ADC #$3d
11c4 : 85 1b __ STA ACCU + 0 
11c6 : 90 02 __ BCC $11ca ; (expandline.s14 + 0)
.s13:
11c8 : e6 1c __ INC ACCU + 1 
.s14:
11ca : a9 00 __ LDA #$00
11cc : 85 1d __ STA ACCU + 2 
11ce : f0 e7 __ BEQ $11b7 ; (expandline.s7 + 0)
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
11d0 : 18 __ __ CLC
11d1 : a5 1b __ LDA ACCU + 0 
11d3 : 69 05 __ ADC #$05
11d5 : 29 fc __ AND #$fc
11d7 : 85 03 __ STA WORK + 0 
11d9 : a5 1c __ LDA ACCU + 1 
11db : 69 00 __ ADC #$00
11dd : 85 04 __ STA WORK + 1 
11df : ad 86 2c LDA $2c86 ; (HeapNode.end + 0)
11e2 : d0 26 __ BNE $120a ; (crt_malloc + 58)
11e4 : a9 00 __ LDA #$00
11e6 : 8d 8a 2c STA $2c8a 
11e9 : 8d 8b 2c STA $2c8b 
11ec : ee 86 2c INC $2c86 ; (HeapNode.end + 0)
11ef : a9 88 __ LDA #$88
11f1 : 09 02 __ ORA #$02
11f3 : 8d 84 2c STA $2c84 ; (HeapNode.next + 0)
11f6 : a9 2c __ LDA #$2c
11f8 : 8d 85 2c STA $2c85 ; (HeapNode.next + 1)
11fb : 38 __ __ SEC
11fc : a9 00 __ LDA #$00
11fe : e9 02 __ SBC #$02
1200 : 8d 8c 2c STA $2c8c 
1203 : a9 90 __ LDA #$90
1205 : e9 00 __ SBC #$00
1207 : 8d 8d 2c STA $2c8d 
120a : a9 84 __ LDA #$84
120c : a2 2c __ LDX #$2c
120e : 85 1d __ STA ACCU + 2 
1210 : 86 1e __ STX ACCU + 3 
1212 : 18 __ __ CLC
1213 : a0 00 __ LDY #$00
1215 : b1 1d __ LDA (ACCU + 2),y 
1217 : 85 1b __ STA ACCU + 0 
1219 : 65 03 __ ADC WORK + 0 
121b : 85 05 __ STA WORK + 2 
121d : c8 __ __ INY
121e : b1 1d __ LDA (ACCU + 2),y 
1220 : 85 1c __ STA ACCU + 1 
1222 : f0 20 __ BEQ $1244 ; (crt_malloc + 116)
1224 : 65 04 __ ADC WORK + 1 
1226 : 85 06 __ STA WORK + 3 
1228 : b0 14 __ BCS $123e ; (crt_malloc + 110)
122a : a0 02 __ LDY #$02
122c : b1 1b __ LDA (ACCU + 0),y 
122e : c5 05 __ CMP WORK + 2 
1230 : c8 __ __ INY
1231 : b1 1b __ LDA (ACCU + 0),y 
1233 : e5 06 __ SBC WORK + 3 
1235 : b0 0e __ BCS $1245 ; (crt_malloc + 117)
1237 : a5 1b __ LDA ACCU + 0 
1239 : a6 1c __ LDX ACCU + 1 
123b : 4c 0e 12 JMP $120e ; (crt_malloc + 62)
123e : a9 00 __ LDA #$00
1240 : 85 1b __ STA ACCU + 0 
1242 : 85 1c __ STA ACCU + 1 
1244 : 60 __ __ RTS
1245 : a5 05 __ LDA WORK + 2 
1247 : 85 07 __ STA WORK + 4 
1249 : a5 06 __ LDA WORK + 3 
124b : 85 08 __ STA WORK + 5 
124d : a0 02 __ LDY #$02
124f : a5 07 __ LDA WORK + 4 
1251 : d1 1b __ CMP (ACCU + 0),y 
1253 : d0 15 __ BNE $126a ; (crt_malloc + 154)
1255 : c8 __ __ INY
1256 : a5 08 __ LDA WORK + 5 
1258 : d1 1b __ CMP (ACCU + 0),y 
125a : d0 0e __ BNE $126a ; (crt_malloc + 154)
125c : a0 00 __ LDY #$00
125e : b1 1b __ LDA (ACCU + 0),y 
1260 : 91 1d __ STA (ACCU + 2),y 
1262 : c8 __ __ INY
1263 : b1 1b __ LDA (ACCU + 0),y 
1265 : 91 1d __ STA (ACCU + 2),y 
1267 : 4c 87 12 JMP $1287 ; (crt_malloc + 183)
126a : a0 00 __ LDY #$00
126c : b1 1b __ LDA (ACCU + 0),y 
126e : 91 07 __ STA (WORK + 4),y 
1270 : a5 07 __ LDA WORK + 4 
1272 : 91 1d __ STA (ACCU + 2),y 
1274 : c8 __ __ INY
1275 : b1 1b __ LDA (ACCU + 0),y 
1277 : 91 07 __ STA (WORK + 4),y 
1279 : a5 08 __ LDA WORK + 5 
127b : 91 1d __ STA (ACCU + 2),y 
127d : c8 __ __ INY
127e : b1 1b __ LDA (ACCU + 0),y 
1280 : 91 07 __ STA (WORK + 4),y 
1282 : c8 __ __ INY
1283 : b1 1b __ LDA (ACCU + 0),y 
1285 : 91 07 __ STA (WORK + 4),y 
1287 : a0 00 __ LDY #$00
1289 : a5 05 __ LDA WORK + 2 
128b : 91 1b __ STA (ACCU + 0),y 
128d : c8 __ __ INY
128e : a5 06 __ LDA WORK + 3 
1290 : 91 1b __ STA (ACCU + 0),y 
1292 : 18 __ __ CLC
1293 : a5 1b __ LDA ACCU + 0 
1295 : 69 02 __ ADC #$02
1297 : 85 1b __ STA ACCU + 0 
1299 : 90 02 __ BCC $129d ; (crt_malloc + 205)
129b : e6 1c __ INC ACCU + 1 
129d : 60 __ __ RTS
--------------------------------------------------------------------
__multab48L:
129e : __ __ __ BYT 00 30 60 90 c0                                  : .0`..
--------------------------------------------------------------------
spentry:
12a3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
irqai:
12a4 : __ __ __ BYT 0a 0d 12 17 1c 21 26 2b 30 35 3a 3f 44 49 4e 53 : .....!&+05:?DINS
12b4 : __ __ __ BYT 58 5d 62 67 6c 71 76 7b 80 85                   : X]bglqv{..
--------------------------------------------------------------------
irqdi:
12be : __ __ __ BYT 01 03 10 15 1a 1f 24 29 2e 33 38 3d 42 47 4c 51 : ......$).38=BGLQ
12ce : __ __ __ BYT 56 5b 60 65 6a 6f 74 79 7e 83                   : V[`ejoty~.
--------------------------------------------------------------------
scrolltext:
1300 : __ __ __ BYT e8 0f f9 0f 05 10 15 10 26 10 36 10 49 10 59 10 : ........&.6.I.Y.
1310 : __ __ __ BYT 5a 10 6c 10 7d 10 90 10 a3 10 b4 10 c1 10 c8 10 : Z.l.}...........
1320 : __ __ __ BYT c9 10 d8 10 eb 10 fb 10 08 11 11 11 20 11 30 11 : ............ .0.
1330 : __ __ __ BYT 31 11 32 11 33 11                               : 1.2.3.
--------------------------------------------------------------------
bitshift:
1336 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
1346 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1356 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
1366 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
charset:
1400 : __ __ __ BYT 00 00 00 00 00 00 00 00 38 60 c6 80 fc c0 c6 c6 : ........8`......
1410 : __ __ __ BYT f8 c0 c6 dc c0 c6 c6 fc 7c c0 c6 c0 c0 c0 06 7c : ........|......|
1420 : __ __ __ BYT f8 cc c0 c6 c6 c0 cc f8 fe c0 00 f8 00 c0 c0 fe : ................
1430 : __ __ __ BYT fe c0 00 fc 00 c0 c0 c0 7c e0 c0 de c6 06 e0 78 : ........|......x
1440 : __ __ __ BYT c6 c6 00 fe 00 c6 c6 c6 78 00 30 30 30 30 00 78 : ........x.0000.x
1450 : __ __ __ BYT fe 00 06 06 06 c0 cc 78 c6 cc 18 f0 18 cc c6 c6 : .......x........
1460 : __ __ __ BYT c0 c0 c0 c0 c0 c6 00 fe 82 c6 fe 54 92 c6 c6 c6 : ...........T....
1470 : __ __ __ BYT 86 c6 66 b6 da cc c6 c2 7c c6 00 c6 c6 00 c6 7c : ..f.....|......|
1480 : __ __ __ BYT fc c6 c6 c6 1c c0 c0 c0 7c c6 06 c2 d8 0c c6 7a : ........|......z
1490 : __ __ __ BYT fc c0 c6 fc 00 cc c6 c6 7c 06 c0 7c 06 06 c0 7c : ........|..|...|
14a0 : __ __ __ BYT fe 00 30 30 00 30 30 30 c6 c6 c6 c6 c6 00 c6 7c : ..00.000.......|
14b0 : __ __ __ BYT c6 c6 c6 c6 00 6c 38 10 c6 c6 c6 d6 ba 6c c6 82 : .....l8......l..
14c0 : __ __ __ BYT c6 c6 54 10 54 c6 c6 c6 c6 c6 44 10 38 18 18 18 : ..T.T.....D.8...
14d0 : __ __ __ BYT fe 00 0c 18 30 60 00 fe 00 00 00 00 00 00 00 00 : ....0`..........
14e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
spriteset:
2000 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2010 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2020 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2030 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2040 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2050 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2060 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2070 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2080 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2090 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2100 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2110 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2120 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2130 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2140 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2150 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2160 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2170 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2180 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2190 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2200 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2210 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2220 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2230 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2240 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2250 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2260 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2270 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2280 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2290 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2330 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2350 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2370 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2390 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2420 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2430 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2440 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2450 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2460 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2470 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2480 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2490 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2500 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2510 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2520 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2530 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2540 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2550 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2560 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2570 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2580 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2590 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2600 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2620 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2630 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2640 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2650 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2660 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2670 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2680 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2690 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2700 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2720 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2730 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2740 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2750 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2760 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2770 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2780 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2790 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2800 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2810 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2820 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2830 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2840 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2850 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2860 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2870 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2880 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2890 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2900 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2910 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2920 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2930 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2940 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2950 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2960 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2970 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2980 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2990 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a70 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2aa0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2ab0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2ac0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2ad0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2ae0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2af0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b20 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b30 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b50 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b60 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b70 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b80 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b90 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2ba0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bb0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bc0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bd0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2be0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bf0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
rasterIRQRows:
2c00 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
2c11 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
2c22 : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
2c33 : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQLow:
2c34 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
2c44 : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_count:
2c54 : __ __ __ BSS	1
--------------------------------------------------------------------
vspriteScreen:
2c55 : __ __ __ BSS	2
--------------------------------------------------------------------
spmux:
2c57 : __ __ __ BSS	12
--------------------------------------------------------------------
final:
2c63 : __ __ __ BSS	32
--------------------------------------------------------------------
rirq_pcount:
2c83 : __ __ __ BSS	1
--------------------------------------------------------------------
HeapNode:
2c84 : __ __ __ BSS	4
