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
080e : 8e 32 54 STX $5432 ; (spentry + 0)
0811 : a2 57 __ LDX #$57
0813 : a0 38 __ LDY #$38
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 ba __ CPX #$ba
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 a0 __ CPY #$a0
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 2f __ LDA #$2f
083d : 85 23 __ STA SP + 0 
083f : a9 c7 __ LDA #$c7
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
; 103, "/home/honza/projects/c64/projects/oscar64/samples/hires/func3d.c"
.s1:
0a00 : a2 22 __ LDX #$22
0a02 : b5 53 __ LDA T0 + 0,x 
0a04 : 9d 31 c7 STA $c731,x ; (main@stack + 0)
0a07 : ca __ __ DEX
0a08 : 10 f8 __ BPL $0a02 ; (main.s1 + 2)
0a0a : 38 __ __ SEC
0a0b : a5 23 __ LDA SP + 0 
0a0d : e9 06 __ SBC #$06
0a0f : 85 23 __ STA SP + 0 
0a11 : b0 02 __ BCS $0a15 ; (main.s4 + 0)
0a13 : c6 24 __ DEC SP + 1 
.s4:
0a15 : 20 0e 15 JSR $150e ; (init.s4 + 0)
0a18 : a9 1e __ LDA #$1e
0a1a : 85 0d __ STA P0 
0a1c : a9 16 __ LDA #$16
0a1e : 85 0e __ STA P1 
0a20 : 20 be 24 JSR $24be ; (strlen.s4 + 0)
0a23 : a9 00 __ LDA #$00
0a25 : 8d e7 c7 STA $c7e7 ; (sstack + 41)
0a28 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
0a2b : 8d e9 c7 STA $c7e9 ; (sstack + 43)
0a2e : 8d ea c7 STA $c7ea ; (sstack + 44)
0a31 : a9 1e __ LDA #$1e
0a33 : 8d eb c7 STA $c7eb ; (sstack + 45)
0a36 : a9 16 __ LDA #$16
0a38 : 8d ec c7 STA $c7ec ; (sstack + 46)
0a3b : a5 1b __ LDA ACCU + 0 
0a3d : 8d ed c7 STA $c7ed ; (sstack + 47)
0a40 : a9 08 __ LDA #$08
0a42 : 8d ee c7 STA $c7ee ; (sstack + 48)
0a45 : a9 33 __ LDA #$33
0a47 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
0a4a : a9 54 __ LDA #$54
0a4c : 8d e4 c7 STA $c7e4 ; (sstack + 38)
0a4f : a9 3b __ LDA #$3b
0a51 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
0a54 : a9 54 __ LDA #$54
0a56 : 8d e6 c7 STA $c7e6 ; (sstack + 40)
0a59 : 20 31 16 JSR $1631 ; (bm_put_chars.s1 + 0)
0a5c : a9 78 __ LDA #$78
0a5e : 85 0d __ STA P0 
0a60 : a9 58 __ LDA #$58
0a62 : 85 0e __ STA P1 
0a64 : 20 da 24 JSR $24da ; (mat4_ident.s4 + 0)
0a67 : a9 3f __ LDA #$3f
0a69 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
0a6c : 8d c7 c7 STA $c7c7 ; (sstack + 9)
0a6f : a9 db __ LDA #$db
0a71 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
0a74 : a9 0f __ LDA #$0f
0a76 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
0a79 : a9 c9 __ LDA #$c9
0a7b : 8d c2 c7 STA $c7c2 ; (sstack + 4)
0a7e : a9 00 __ LDA #$00
0a80 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
0a83 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
0a86 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
0a89 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
0a8c : 8d ca c7 STA $c7ca ; (sstack + 12)
0a8f : 8d cb c7 STA $c7cb ; (sstack + 13)
0a92 : 8d cc c7 STA $c7cc ; (sstack + 14)
0a95 : 8d cd c7 STA $c7cd ; (sstack + 15)
0a98 : a9 80 __ LDA #$80
0a9a : 8d c6 c7 STA $c7c6 ; (sstack + 8)
0a9d : a9 48 __ LDA #$48
0a9f : 8d ce c7 STA $c7ce ; (sstack + 16)
0aa2 : a9 43 __ LDA #$43
0aa4 : 8d cf c7 STA $c7cf ; (sstack + 17)
0aa7 : a9 b8 __ LDA #$b8
0aa9 : 8d be c7 STA $c7be ; (sstack + 0)
0aac : a9 58 __ LDA #$58
0aae : 8d bf c7 STA $c7bf ; (sstack + 1)
0ab1 : 20 25 25 JSR $2525 ; (mat4_make_perspective.s1 + 0)
0ab4 : a9 00 __ LDA #$00
0ab6 : 85 6d __ STA T7 + 0 
0ab8 : 85 6e __ STA T7 + 1 
0aba : a9 f1 __ LDA #$f1
0abc : 85 6b __ STA T6 + 0 
0abe : a9 ff __ LDA #$ff
0ac0 : 85 6c __ STA T6 + 1 
.l5:
0ac2 : a5 6b __ LDA T6 + 0 
0ac4 : 85 1b __ STA ACCU + 0 
0ac6 : a5 6c __ LDA T6 + 1 
0ac8 : 85 1c __ STA ACCU + 1 
0aca : 20 0b 52 JSR $520b ; (sint16_to_float + 0)
0acd : a9 88 __ LDA #$88
0acf : 85 04 __ STA WORK + 1 
0ad1 : 85 05 __ STA WORK + 2 
0ad3 : a9 89 __ LDA #$89
0ad5 : 85 03 __ STA WORK + 0 
0ad7 : a9 3d __ LDA #$3d
0ad9 : 85 06 __ STA WORK + 3 
0adb : 20 31 4e JSR $4e31 ; (freg + 20)
0ade : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0ae1 : a5 1b __ LDA ACCU + 0 
0ae3 : 85 5b __ STA T2 + 0 
0ae5 : a5 1c __ LDA ACCU + 1 
0ae7 : 85 5c __ STA T2 + 1 
0ae9 : a5 1d __ LDA ACCU + 2 
0aeb : 85 5d __ STA T2 + 2 
0aed : a5 1e __ LDA ACCU + 3 
0aef : 85 5e __ STA T2 + 3 
0af1 : a2 1b __ LDX #$1b
0af3 : 20 21 4e JSR $4e21 ; (freg + 4)
0af6 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0af9 : a5 1b __ LDA ACCU + 0 
0afb : 85 5f __ STA T3 + 0 
0afd : a5 1c __ LDA ACCU + 1 
0aff : 85 60 __ STA T3 + 1 
0b01 : a5 1d __ LDA ACCU + 2 
0b03 : 85 61 __ STA T3 + 2 
0b05 : a5 1e __ LDA ACCU + 3 
0b07 : 85 62 __ STA T3 + 3 
0b09 : a9 0f __ LDA #$0f
0b0b : 85 6f __ STA T8 + 0 
0b0d : a9 00 __ LDA #$00
0b0f : 85 70 __ STA T8 + 1 
0b11 : a9 e0 __ LDA #$e0
0b13 : 85 71 __ STA T9 + 0 
0b15 : a9 59 __ LDA #$59
0b17 : 85 72 __ STA T9 + 1 
.l6:
0b19 : a5 6f __ LDA T8 + 0 
0b1b : 85 1b __ STA ACCU + 0 
0b1d : a5 70 __ LDA T8 + 1 
0b1f : 85 1c __ STA ACCU + 1 
0b21 : 20 0b 52 JSR $520b ; (sint16_to_float + 0)
0b24 : a9 88 __ LDA #$88
0b26 : 85 04 __ STA WORK + 1 
0b28 : 85 05 __ STA WORK + 2 
0b2a : a9 89 __ LDA #$89
0b2c : 85 03 __ STA WORK + 0 
0b2e : a9 3d __ LDA #$3d
0b30 : 85 06 __ STA WORK + 3 
0b32 : 20 31 4e JSR $4e31 ; (freg + 20)
0b35 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0b38 : a5 1b __ LDA ACCU + 0 
0b3a : 85 57 __ STA T1 + 0 
0b3c : a5 1c __ LDA ACCU + 1 
0b3e : 85 58 __ STA T1 + 1 
0b40 : a5 1d __ LDA ACCU + 2 
0b42 : 85 59 __ STA T1 + 2 
0b44 : a5 1e __ LDA ACCU + 3 
0b46 : 85 5a __ STA T1 + 3 
0b48 : a2 1b __ LDX #$1b
0b4a : 20 21 4e JSR $4e21 ; (freg + 4)
0b4d : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0b50 : a2 5f __ LDX #$5f
0b52 : 20 21 4e JSR $4e21 ; (freg + 4)
0b55 : 20 68 4e JSR $4e68 ; (faddsub + 6)
0b58 : a5 1b __ LDA ACCU + 0 
0b5a : 85 0d __ STA P0 
0b5c : a5 1c __ LDA ACCU + 1 
0b5e : 85 0e __ STA P1 
0b60 : a5 1d __ LDA ACCU + 2 
0b62 : 85 0f __ STA P2 
0b64 : a5 1e __ LDA ACCU + 3 
0b66 : 85 10 __ STA P3 
0b68 : 20 98 29 JSR $2998 ; (sqrt.s4 + 0)
0b6b : a5 1b __ LDA ACCU + 0 
0b6d : 85 63 __ STA T4 + 0 
0b6f : a5 1c __ LDA ACCU + 1 
0b71 : 85 64 __ STA T4 + 1 
0b73 : a5 1d __ LDA ACCU + 2 
0b75 : 85 65 __ STA T4 + 2 
0b77 : a5 1e __ LDA ACCU + 3 
0b79 : 85 66 __ STA T4 + 3 
0b7b : a9 00 __ LDA #$00
0b7d : 85 03 __ STA WORK + 0 
0b7f : 85 04 __ STA WORK + 1 
0b81 : a9 80 __ LDA #$80
0b83 : 85 05 __ STA WORK + 2 
0b85 : a9 41 __ LDA #$41
0b87 : 85 06 __ STA WORK + 3 
0b89 : 20 31 4e JSR $4e31 ; (freg + 20)
0b8c : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0b8f : a9 db __ LDA #$db
0b91 : 85 03 __ STA WORK + 0 
0b93 : a9 3f __ LDA #$3f
0b95 : 85 06 __ STA WORK + 3 
0b97 : a9 0f __ LDA #$0f
0b99 : 85 04 __ STA WORK + 1 
0b9b : a9 c9 __ LDA #$c9
0b9d : 85 05 __ STA WORK + 2 
0b9f : 20 31 4e JSR $4e31 ; (freg + 20)
0ba2 : 20 68 4e JSR $4e68 ; (faddsub + 6)
0ba5 : a5 1b __ LDA ACCU + 0 
0ba7 : 85 0d __ STA P0 
0ba9 : a5 1c __ LDA ACCU + 1 
0bab : 85 0e __ STA P1 
0bad : a5 1d __ LDA ACCU + 2 
0baf : 85 0f __ STA P2 
0bb1 : a5 1e __ LDA ACCU + 3 
0bb3 : 85 10 __ STA P3 
0bb5 : 20 01 28 JSR $2801 ; (sin.s4 + 0)
0bb8 : a5 1b __ LDA ACCU + 0 
0bba : 85 67 __ STA T5 + 0 
0bbc : a5 1c __ LDA ACCU + 1 
0bbe : 85 68 __ STA T5 + 1 
0bc0 : a5 1d __ LDA ACCU + 2 
0bc2 : 85 69 __ STA T5 + 2 
0bc4 : a5 1e __ LDA ACCU + 3 
0bc6 : 85 6a __ STA T5 + 3 
0bc8 : a9 00 __ LDA #$00
0bca : 85 1b __ STA ACCU + 0 
0bcc : 85 1c __ STA ACCU + 1 
0bce : 85 1d __ STA ACCU + 2 
0bd0 : a9 c0 __ LDA #$c0
0bd2 : 85 1e __ STA ACCU + 3 
0bd4 : a2 63 __ LDX #$63
0bd6 : 20 21 4e JSR $4e21 ; (freg + 4)
0bd9 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0bdc : a5 1b __ LDA ACCU + 0 
0bde : 85 0d __ STA P0 
0be0 : a5 1c __ LDA ACCU + 1 
0be2 : 85 0e __ STA P1 
0be4 : a5 1d __ LDA ACCU + 2 
0be6 : 85 0f __ STA P2 
0be8 : a5 1e __ LDA ACCU + 3 
0bea : 85 10 __ STA P3 
0bec : 20 fc 2a JSR $2afc ; (exp.s4 + 0)
0bef : 18 __ __ CLC
0bf0 : a5 71 __ LDA T9 + 0 
0bf2 : 65 6d __ ADC T7 + 0 
0bf4 : 85 63 __ STA T4 + 0 
0bf6 : a5 72 __ LDA T9 + 1 
0bf8 : 65 6e __ ADC T7 + 1 
0bfa : 85 64 __ STA T4 + 1 
0bfc : a5 5b __ LDA T2 + 0 
0bfe : a0 00 __ LDY #$00
0c00 : 91 63 __ STA (T4 + 0),y 
0c02 : a5 5c __ LDA T2 + 1 
0c04 : c8 __ __ INY
0c05 : 91 63 __ STA (T4 + 0),y 
0c07 : a5 5d __ LDA T2 + 2 
0c09 : c8 __ __ INY
0c0a : 91 63 __ STA (T4 + 0),y 
0c0c : a5 5e __ LDA T2 + 3 
0c0e : c8 __ __ INY
0c0f : 91 63 __ STA (T4 + 0),y 
0c11 : a5 57 __ LDA T1 + 0 
0c13 : a0 08 __ LDY #$08
0c15 : 91 63 __ STA (T4 + 0),y 
0c17 : a5 58 __ LDA T1 + 1 
0c19 : c8 __ __ INY
0c1a : 91 63 __ STA (T4 + 0),y 
0c1c : a5 59 __ LDA T1 + 2 
0c1e : c8 __ __ INY
0c1f : 91 63 __ STA (T4 + 0),y 
0c21 : a5 5a __ LDA T1 + 3 
0c23 : c8 __ __ INY
0c24 : 91 63 __ STA (T4 + 0),y 
0c26 : a5 67 __ LDA T5 + 0 
0c28 : 85 57 __ STA T1 + 0 
0c2a : a5 68 __ LDA T5 + 1 
0c2c : 85 58 __ STA T1 + 1 
0c2e : a5 69 __ LDA T5 + 2 
0c30 : 85 59 __ STA T1 + 2 
0c32 : a5 6a __ LDA T5 + 3 
0c34 : 49 80 __ EOR #$80
0c36 : 85 5a __ STA T1 + 3 
0c38 : a2 57 __ LDX #$57
0c3a : 20 21 4e JSR $4e21 ; (freg + 4)
0c3d : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0c40 : a9 00 __ LDA #$00
0c42 : 85 03 __ STA WORK + 0 
0c44 : 85 04 __ STA WORK + 1 
0c46 : 85 05 __ STA WORK + 2 
0c48 : a9 3f __ LDA #$3f
0c4a : 85 06 __ STA WORK + 3 
0c4c : 20 31 4e JSR $4e31 ; (freg + 20)
0c4f : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0c52 : a5 1b __ LDA ACCU + 0 
0c54 : a0 04 __ LDY #$04
0c56 : 91 63 __ STA (T4 + 0),y 
0c58 : a5 1c __ LDA ACCU + 1 
0c5a : c8 __ __ INY
0c5b : 91 63 __ STA (T4 + 0),y 
0c5d : a5 1d __ LDA ACCU + 2 
0c5f : c8 __ __ INY
0c60 : 91 63 __ STA (T4 + 0),y 
0c62 : a5 1e __ LDA ACCU + 3 
0c64 : c8 __ __ INY
0c65 : 91 63 __ STA (T4 + 0),y 
0c67 : 18 __ __ CLC
0c68 : a5 71 __ LDA T9 + 0 
0c6a : 69 74 __ ADC #$74
0c6c : 85 71 __ STA T9 + 0 
0c6e : a5 72 __ LDA T9 + 1 
0c70 : 69 01 __ ADC #$01
0c72 : 85 72 __ STA T9 + 1 
0c74 : 38 __ __ SEC
0c75 : a5 6f __ LDA T8 + 0 
0c77 : e9 01 __ SBC #$01
0c79 : 85 6f __ STA T8 + 0 
0c7b : a5 70 __ LDA T8 + 1 
0c7d : e9 00 __ SBC #$00
0c7f : 85 70 __ STA T8 + 1 
0c81 : c9 ff __ CMP #$ff
0c83 : f0 03 __ BEQ $0c88 ; (main.s28 + 0)
0c85 : 4c 19 0b JMP $0b19 ; (main.l6 + 0)
.s28:
0c88 : a5 6f __ LDA T8 + 0 
0c8a : c9 f0 __ CMP #$f0
0c8c : d0 f7 __ BNE $0c85 ; (main.l6 + 364)
.s7:
0c8e : a5 6d __ LDA T7 + 0 
0c90 : 69 0b __ ADC #$0b
0c92 : 85 6d __ STA T7 + 0 
0c94 : 90 03 __ BCC $0c99 ; (main.s32 + 0)
.s31:
0c96 : e6 6e __ INC T7 + 1 
0c98 : 18 __ __ CLC
.s32:
0c99 : a5 6b __ LDA T6 + 0 
0c9b : 69 01 __ ADC #$01
0c9d : 85 6b __ STA T6 + 0 
0c9f : a5 6c __ LDA T6 + 1 
0ca1 : 69 00 __ ADC #$00
0ca3 : 85 6c __ STA T6 + 1 
0ca5 : f0 03 __ BEQ $0caa ; (main.s27 + 0)
0ca7 : 4c c2 0a JMP $0ac2 ; (main.l5 + 0)
.s27:
0caa : a5 6b __ LDA T6 + 0 
0cac : c9 10 __ CMP #$10
0cae : d0 f7 __ BNE $0ca7 ; (main.s32 + 14)
.s8:
0cb0 : a9 4d __ LDA #$4d
0cb2 : 85 0d __ STA P0 
0cb4 : a9 2c __ LDA #$2c
0cb6 : 85 0e __ STA P1 
0cb8 : 20 be 24 JSR $24be ; (strlen.s4 + 0)
0cbb : a9 00 __ LDA #$00
0cbd : 8d e7 c7 STA $c7e7 ; (sstack + 41)
0cc0 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
0cc3 : 8d ea c7 STA $c7ea ; (sstack + 44)
0cc6 : a9 4d __ LDA #$4d
0cc8 : 8d eb c7 STA $c7eb ; (sstack + 45)
0ccb : a9 2c __ LDA #$2c
0ccd : 8d ec c7 STA $c7ec ; (sstack + 46)
0cd0 : a5 1b __ LDA ACCU + 0 
0cd2 : 8d ed c7 STA $c7ed ; (sstack + 47)
0cd5 : a9 08 __ LDA #$08
0cd7 : 8d e9 c7 STA $c7e9 ; (sstack + 43)
0cda : 8d ee c7 STA $c7ee ; (sstack + 48)
0cdd : a9 33 __ LDA #$33
0cdf : 8d e3 c7 STA $c7e3 ; (sstack + 37)
0ce2 : a9 54 __ LDA #$54
0ce4 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
0ce7 : a9 3b __ LDA #$3b
0ce9 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
0cec : a9 54 __ LDA #$54
0cee : 8d e6 c7 STA $c7e6 ; (sstack + 40)
0cf1 : 20 31 16 JSR $1631 ; (bm_put_chars.s1 + 0)
0cf4 : a9 00 __ LDA #$00
0cf6 : 8d e3 56 STA $56e3 ; (vlight.v[0] + 0)
0cf9 : 8d e4 56 STA $56e4 ; (vlight.v[0] + 1)
0cfc : 8d e5 56 STA $56e5 ; (vlight.v[0] + 2)
0cff : 8d e7 56 STA $56e7 ; (vlight.v[0] + 4)
0d02 : 8d e8 56 STA $56e8 ; (vlight.v[0] + 5)
0d05 : 8d e9 56 STA $56e9 ; (vlight.v[0] + 6)
0d08 : 8d eb 56 STA $56eb ; (vlight.v[0] + 8)
0d0b : 8d ec 56 STA $56ec ; (vlight.v[0] + 9)
0d0e : a9 40 __ LDA #$40
0d10 : 8d e6 56 STA $56e6 ; (vlight.v[0] + 3)
0d13 : a9 c0 __ LDA #$c0
0d15 : 8d ea 56 STA $56ea ; (vlight.v[0] + 7)
0d18 : a9 80 __ LDA #$80
0d1a : 8d ed 56 STA $56ed ; (vlight.v[0] + 10)
0d1d : a9 bf __ LDA #$bf
0d1f : 8d ee 56 STA $56ee ; (vlight.v[0] + 11)
0d22 : a9 e3 __ LDA #$e3
0d24 : 85 15 __ STA P8 
0d26 : a9 56 __ LDA #$56
0d28 : 85 16 __ STA P9 
0d2a : 20 61 2c JSR $2c61 ; (vec3_norm.s4 + 0)
0d2d : a9 00 __ LDA #$00
0d2f : 85 0f __ STA P2 
0d31 : 85 10 __ STA P3 
0d33 : a9 90 __ LDA #$90
0d35 : 85 11 __ STA P4 
0d37 : a9 58 __ LDA #$58
0d39 : 85 0e __ STA P1 
0d3b : a9 41 __ LDA #$41
0d3d : 85 12 __ STA P5 
0d3f : a9 78 __ LDA #$78
0d41 : 85 0d __ STA P0 
0d43 : 20 db 2d JSR $2ddb ; (mat4_scale.s4 + 0)
0d46 : a9 48 __ LDA #$48
0d48 : 8d be c7 STA $c7be ; (sstack + 0)
0d4b : a9 e1 __ LDA #$e1
0d4d : 8d bf c7 STA $c7bf ; (sstack + 1)
0d50 : a9 7a __ LDA #$7a
0d52 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
0d55 : a9 bf __ LDA #$bf
0d57 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
0d5a : a9 00 __ LDA #$00
0d5c : 85 15 __ STA P8 
0d5e : a9 87 __ LDA #$87
0d60 : 85 16 __ STA P9 
0d62 : 20 25 2e JSR $2e25 ; (mat4_set_rotate_x.s4 + 0)
0d65 : a9 99 __ LDA #$99
0d67 : 8d bf c7 STA $c7bf ; (sstack + 1)
0d6a : 8d c0 c7 STA $c7c0 ; (sstack + 2)
0d6d : a9 9a __ LDA #$9a
0d6f : 8d be c7 STA $c7be ; (sstack + 0)
0d72 : a9 3e __ LDA #$3e
0d74 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
0d77 : a9 40 __ LDA #$40
0d79 : 85 15 __ STA P8 
0d7b : a9 87 __ LDA #$87
0d7d : 85 16 __ STA P9 
0d7f : 20 7c 2f JSR $2f7c ; (mat4_set_rotate_y.s4 + 0)
0d82 : a9 00 __ LDA #$00
0d84 : 85 0d __ STA P0 
0d86 : a9 87 __ LDA #$87
0d88 : 85 10 __ STA P3 
0d8a : a9 87 __ LDA #$87
0d8c : 85 0e __ STA P1 
0d8e : a9 40 __ LDA #$40
0d90 : 85 0f __ STA P2 
0d92 : 20 d6 30 JSR $30d6 ; (mat4_rmmul.s1 + 0)
0d95 : a9 78 __ LDA #$78
0d97 : 85 0f __ STA P2 
0d99 : a9 58 __ LDA #$58
0d9b : 85 10 __ STA P3 
0d9d : 20 d6 30 JSR $30d6 ; (mat4_rmmul.s1 + 0)
0da0 : ad 38 87 LDA $8738 ; (rmat.m[0] + 56)
0da3 : 85 1b __ STA ACCU + 0 
0da5 : a9 40 __ LDA #$40
0da7 : 85 0d __ STA P0 
0da9 : a9 87 __ LDA #$87
0dab : 85 0e __ STA P1 
0dad : a9 00 __ LDA #$00
0daf : 85 0f __ STA P2 
0db1 : a9 87 __ LDA #$87
0db3 : 85 10 __ STA P3 
0db5 : ad 39 87 LDA $8739 ; (rmat.m[0] + 57)
0db8 : 85 1c __ STA ACCU + 1 
0dba : ad 3a 87 LDA $873a ; (rmat.m[0] + 58)
0dbd : 85 1d __ STA ACCU + 2 
0dbf : ad 3b 87 LDA $873b ; (rmat.m[0] + 59)
0dc2 : 85 1e __ STA ACCU + 3 
0dc4 : a9 00 __ LDA #$00
0dc6 : 85 03 __ STA WORK + 0 
0dc8 : 85 04 __ STA WORK + 1 
0dca : a9 a0 __ LDA #$a0
0dcc : 85 05 __ STA WORK + 2 
0dce : a9 41 __ LDA #$41
0dd0 : 85 06 __ STA WORK + 3 
0dd2 : 20 31 4e JSR $4e31 ; (freg + 20)
0dd5 : 20 68 4e JSR $4e68 ; (faddsub + 6)
0dd8 : a5 1b __ LDA ACCU + 0 
0dda : 8d 38 87 STA $8738 ; (rmat.m[0] + 56)
0ddd : a5 1c __ LDA ACCU + 1 
0ddf : 8d 39 87 STA $8739 ; (rmat.m[0] + 57)
0de2 : a5 1d __ LDA ACCU + 2 
0de4 : 8d 3a 87 STA $873a ; (rmat.m[0] + 58)
0de7 : a5 1e __ LDA ACCU + 3 
0de9 : 8d 3b 87 STA $873b ; (rmat.m[0] + 59)
0dec : a2 3f __ LDX #$3f
.l9:
0dee : bd b8 58 LDA $58b8,x ; (pmat.m[0] + 0)
0df1 : 9d 40 87 STA $8740,x ; (tmat.m[0] + 0)
0df4 : ca __ __ DEX
0df5 : 10 f7 __ BPL $0dee ; (main.l9 + 0)
.s10:
0df7 : 20 85 32 JSR $3285 ; (mat4_mmul.s1 + 0)
0dfa : a9 c7 __ LDA #$c7
0dfc : 85 14 __ STA P7 
0dfe : a9 7c __ LDA #$7c
0e00 : 85 13 __ STA P6 
0e02 : a9 00 __ LDA #$00
0e04 : 85 5b __ STA T2 + 0 
0e06 : 85 5f __ STA T3 + 0 
0e08 : 85 60 __ STA T3 + 1 
.l11:
0e0a : 0a __ __ ASL
0e0b : 0a __ __ ASL
0e0c : 85 6b __ STA T6 + 0 
0e0e : a9 84 __ LDA #$84
0e10 : 85 6d __ STA T7 + 0 
0e12 : a9 96 __ LDA #$96
0e14 : 85 6e __ STA T7 + 1 
0e16 : a9 80 __ LDA #$80
0e18 : 85 6f __ STA T8 + 0 
0e1a : a9 87 __ LDA #$87
0e1c : 85 70 __ STA T8 + 1 
0e1e : a9 e0 __ LDA #$e0
0e20 : 85 71 __ STA T9 + 0 
0e22 : a9 59 __ LDA #$59
0e24 : 85 72 __ STA T9 + 1 
.l29:
0e26 : 18 __ __ CLC
0e27 : a5 71 __ LDA T9 + 0 
0e29 : 65 5f __ ADC T3 + 0 
0e2b : 85 17 __ STA P10 
0e2d : a5 72 __ LDA T9 + 1 
0e2f : 65 60 __ ADC T3 + 1 
0e31 : 85 18 __ STA P11 
0e33 : 20 30 34 JSR $3430 ; (vec3_project.s4 + 0)
0e36 : ad 7c c7 LDA $c77c ; (vp.v[0] + 0)
0e39 : 85 1b __ STA ACCU + 0 
0e3b : ad 7d c7 LDA $c77d ; (vp.v[0] + 1)
0e3e : 85 1c __ STA ACCU + 1 
0e40 : ad 7e c7 LDA $c77e ; (vp.v[0] + 2)
0e43 : 85 1d __ STA ACCU + 2 
0e45 : ad 7f c7 LDA $c77f ; (vp.v[0] + 3)
0e48 : 85 1e __ STA ACCU + 3 
0e4a : a9 00 __ LDA #$00
0e4c : 85 03 __ STA WORK + 0 
0e4e : 85 04 __ STA WORK + 1 
0e50 : a9 0c __ LDA #$0c
0e52 : 85 05 __ STA WORK + 2 
0e54 : a9 43 __ LDA #$43
0e56 : 85 06 __ STA WORK + 3 
0e58 : 20 31 4e JSR $4e31 ; (freg + 20)
0e5b : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0e5e : a9 00 __ LDA #$00
0e60 : 85 03 __ STA WORK + 0 
0e62 : 85 04 __ STA WORK + 1 
0e64 : a9 20 __ LDA #$20
0e66 : 85 05 __ STA WORK + 2 
0e68 : a9 43 __ LDA #$43
0e6a : 85 06 __ STA WORK + 3 
0e6c : 20 31 4e JSR $4e31 ; (freg + 20)
0e6f : 20 68 4e JSR $4e68 ; (faddsub + 6)
0e72 : 20 bf 51 JSR $51bf ; (f32_to_i16 + 0)
0e75 : a5 1b __ LDA ACCU + 0 
0e77 : a4 6b __ LDY T6 + 0 
0e79 : 91 6f __ STA (T8 + 0),y 
0e7b : a5 1c __ LDA ACCU + 1 
0e7d : c8 __ __ INY
0e7e : 91 6f __ STA (T8 + 0),y 
0e80 : ad 80 c7 LDA $c780 ; (vp.v[0] + 4)
0e83 : 85 1b __ STA ACCU + 0 
0e85 : ad 81 c7 LDA $c781 ; (vp.v[0] + 5)
0e88 : 85 1c __ STA ACCU + 1 
0e8a : ad 82 c7 LDA $c782 ; (vp.v[0] + 6)
0e8d : 85 1d __ STA ACCU + 2 
0e8f : ad 83 c7 LDA $c783 ; (vp.v[0] + 7)
0e92 : 85 1e __ STA ACCU + 3 
0e94 : a9 00 __ LDA #$00
0e96 : 85 03 __ STA WORK + 0 
0e98 : 85 04 __ STA WORK + 1 
0e9a : a9 0c __ LDA #$0c
0e9c : 85 05 __ STA WORK + 2 
0e9e : a9 43 __ LDA #$43
0ea0 : 85 06 __ STA WORK + 3 
0ea2 : 20 31 4e JSR $4e31 ; (freg + 20)
0ea5 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
0ea8 : a9 00 __ LDA #$00
0eaa : 85 03 __ STA WORK + 0 
0eac : 85 04 __ STA WORK + 1 
0eae : a9 a0 __ LDA #$a0
0eb0 : 85 05 __ STA WORK + 2 
0eb2 : a9 42 __ LDA #$42
0eb4 : 85 06 __ STA WORK + 3 
0eb6 : 20 31 4e JSR $4e31 ; (freg + 20)
0eb9 : 20 68 4e JSR $4e68 ; (faddsub + 6)
0ebc : 20 bf 51 JSR $51bf ; (f32_to_i16 + 0)
0ebf : a5 1b __ LDA ACCU + 0 
0ec1 : a4 6b __ LDY T6 + 0 
0ec3 : c8 __ __ INY
0ec4 : c8 __ __ INY
0ec5 : 91 6f __ STA (T8 + 0),y 
0ec7 : a5 1c __ LDA ACCU + 1 
0ec9 : c8 __ __ INY
0eca : 91 6f __ STA (T8 + 0),y 
0ecc : ad 86 c7 LDA $c786 ; (vp.v[0] + 10)
0ecf : 85 55 __ STA T0 + 2 
0ed1 : ad 87 c7 LDA $c787 ; (vp.v[0] + 11)
0ed4 : 85 56 __ STA T0 + 3 
0ed6 : ad 84 c7 LDA $c784 ; (vp.v[0] + 8)
0ed9 : 88 __ __ DEY
0eda : 88 __ __ DEY
0edb : ae 85 c7 LDX $c785 ; (vp.v[0] + 9)
0ede : 88 __ __ DEY
0edf : 91 6d __ STA (T7 + 0),y 
0ee1 : 8a __ __ TXA
0ee2 : c8 __ __ INY
0ee3 : 91 6d __ STA (T7 + 0),y 
0ee5 : a5 55 __ LDA T0 + 2 
0ee7 : c8 __ __ INY
0ee8 : 91 6d __ STA (T7 + 0),y 
0eea : a5 56 __ LDA T0 + 3 
0eec : c8 __ __ INY
0eed : 91 6d __ STA (T7 + 0),y 
0eef : 18 __ __ CLC
0ef0 : a5 6f __ LDA T8 + 0 
0ef2 : 69 7c __ ADC #$7c
0ef4 : 85 6f __ STA T8 + 0 
0ef6 : 90 03 __ BCC $0efb ; (main.s34 + 0)
.s33:
0ef8 : e6 70 __ INC T8 + 1 
0efa : 18 __ __ CLC
.s34:
0efb : a5 71 __ LDA T9 + 0 
0efd : 69 74 __ ADC #$74
0eff : 85 71 __ STA T9 + 0 
0f01 : a5 72 __ LDA T9 + 1 
0f03 : 69 01 __ ADC #$01
0f05 : 85 72 __ STA T9 + 1 
0f07 : 18 __ __ CLC
0f08 : a5 6d __ LDA T7 + 0 
0f0a : 69 7c __ ADC #$7c
0f0c : 85 6d __ STA T7 + 0 
0f0e : 90 02 __ BCC $0f12 ; (main.s36 + 0)
.s35:
0f10 : e6 6e __ INC T7 + 1 
.s36:
0f12 : a2 88 __ LDX #$88
0f14 : 86 1b __ STX ACCU + 0 
0f16 : a2 a5 __ LDX #$a5
0f18 : 86 1c __ STX ACCU + 1 
0f1a : c9 88 __ CMP #$88
0f1c : f0 03 __ BEQ $0f21 ; (main.s26 + 0)
0f1e : 4c 26 0e JMP $0e26 ; (main.l29 + 0)
.s26:
0f21 : a5 6e __ LDA T7 + 1 
0f23 : c9 a5 __ CMP #$a5
0f25 : d0 f7 __ BNE $0f1e ; (main.s36 + 12)
.s12:
0f27 : a5 5f __ LDA T3 + 0 
0f29 : 69 0b __ ADC #$0b
0f2b : 85 5f __ STA T3 + 0 
0f2d : 90 02 __ BCC $0f31 ; (main.s38 + 0)
.s37:
0f2f : e6 60 __ INC T3 + 1 
.s38:
0f31 : e6 5b __ INC T2 + 0 
0f33 : a5 5b __ LDA T2 + 0 
0f35 : c9 1f __ CMP #$1f
0f37 : b0 03 __ BCS $0f3c ; (main.s13 + 0)
0f39 : 4c 0a 0e JMP $0e0a ; (main.l11 + 0)
.s13:
0f3c : a9 da __ LDA #$da
0f3e : 85 0d __ STA P0 
0f40 : a9 35 __ LDA #$35
0f42 : 85 0e __ STA P1 
0f44 : 20 be 24 JSR $24be ; (strlen.s4 + 0)
0f47 : a9 00 __ LDA #$00
0f49 : 8d e7 c7 STA $c7e7 ; (sstack + 41)
0f4c : 8d e8 c7 STA $c7e8 ; (sstack + 42)
0f4f : 8d ea c7 STA $c7ea ; (sstack + 44)
0f52 : a9 10 __ LDA #$10
0f54 : 8d e9 c7 STA $c7e9 ; (sstack + 43)
0f57 : a9 da __ LDA #$da
0f59 : 8d eb c7 STA $c7eb ; (sstack + 45)
0f5c : a9 35 __ LDA #$35
0f5e : 8d ec c7 STA $c7ec ; (sstack + 46)
0f61 : a5 1b __ LDA ACCU + 0 
0f63 : 8d ed c7 STA $c7ed ; (sstack + 47)
0f66 : a9 08 __ LDA #$08
0f68 : 8d ee c7 STA $c7ee ; (sstack + 48)
0f6b : a9 33 __ LDA #$33
0f6d : 8d e3 c7 STA $c7e3 ; (sstack + 37)
0f70 : a9 54 __ LDA #$54
0f72 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
0f75 : a9 3b __ LDA #$3b
0f77 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
0f7a : a9 54 __ LDA #$54
0f7c : 8d e6 c7 STA $c7e6 ; (sstack + 40)
0f7f : 20 31 16 JSR $1631 ; (bm_put_chars.s1 + 0)
0f82 : a9 00 __ LDA #$00
.l14:
0f84 : 85 5b __ STA T2 + 0 
0f86 : 85 1b __ STA ACCU + 0 
0f88 : 18 __ __ CLC
0f89 : 69 01 __ ADC #$01
0f8b : 85 63 __ STA T4 + 0 
0f8d : a9 00 __ LDA #$00
0f8f : 85 1c __ STA ACCU + 1 
0f91 : a9 1e __ LDA #$1e
0f93 : 20 af 4d JSR $4daf ; (mul16by8 + 0)
0f96 : a4 1b __ LDY ACCU + 0 
0f98 : 06 1b __ ASL ACCU + 0 
0f9a : a6 1c __ LDX ACCU + 1 
0f9c : 26 1c __ ROL ACCU + 1 
0f9e : 98 __ __ TYA
0f9f : 18 __ __ CLC
0fa0 : 65 1b __ ADC ACCU + 0 
0fa2 : 85 53 __ STA T0 + 0 
0fa4 : 8a __ __ TXA
0fa5 : 65 1c __ ADC ACCU + 1 
0fa7 : 06 53 __ ASL T0 + 0 
0fa9 : 2a __ __ ROL
0faa : aa __ __ TAX
0fab : 18 __ __ CLC
0fac : a9 88 __ LDA #$88
0fae : 65 53 __ ADC T0 + 0 
0fb0 : 85 67 __ STA T5 + 0 
0fb2 : 8a __ __ TXA
0fb3 : 69 a5 __ ADC #$a5
0fb5 : 85 68 __ STA T5 + 1 
0fb7 : a5 5b __ LDA T2 + 0 
0fb9 : 85 1b __ STA ACCU + 0 
0fbb : a9 00 __ LDA #$00
0fbd : 85 1c __ STA ACCU + 1 
0fbf : a9 7c __ LDA #$7c
0fc1 : 20 af 4d JSR $4daf ; (mul16by8 + 0)
0fc4 : 18 __ __ CLC
0fc5 : a9 84 __ LDA #$84
0fc7 : 65 1b __ ADC ACCU + 0 
0fc9 : 85 6b __ STA T6 + 0 
0fcb : a9 96 __ LDA #$96
0fcd : 65 1c __ ADC ACCU + 1 
0fcf : 85 6c __ STA T6 + 1 
0fd1 : 18 __ __ CLC
0fd2 : a5 1b __ LDA ACCU + 0 
0fd4 : 69 00 __ ADC #$00
0fd6 : 85 6d __ STA T7 + 0 
0fd8 : a5 1c __ LDA ACCU + 1 
0fda : 69 97 __ ADC #$97
0fdc : 85 6e __ STA T7 + 1 
0fde : a9 00 __ LDA #$00
0fe0 : 85 6f __ STA T8 + 0 
.l30:
0fe2 : a0 04 __ LDY #$04
0fe4 : 91 67 __ STA (T5 + 0),y 
0fe6 : a5 5b __ LDA T2 + 0 
0fe8 : c8 __ __ INY
0fe9 : 91 67 __ STA (T5 + 0),y 
0feb : 88 __ __ DEY
0fec : b1 6b __ LDA (T6 + 0),y 
0fee : 85 1b __ STA ACCU + 0 
0ff0 : c8 __ __ INY
0ff1 : b1 6b __ LDA (T6 + 0),y 
0ff3 : 85 1c __ STA ACCU + 1 
0ff5 : c8 __ __ INY
0ff6 : b1 6b __ LDA (T6 + 0),y 
0ff8 : 85 1d __ STA ACCU + 2 
0ffa : c8 __ __ INY
0ffb : b1 6b __ LDA (T6 + 0),y 
0ffd : 85 1e __ STA ACCU + 3 
0fff : a0 00 __ LDY #$00
1001 : b1 6b __ LDA (T6 + 0),y 
1003 : 85 03 __ STA WORK + 0 
1005 : c8 __ __ INY
1006 : b1 6b __ LDA (T6 + 0),y 
1008 : 85 04 __ STA WORK + 1 
100a : c8 __ __ INY
100b : b1 6b __ LDA (T6 + 0),y 
100d : 85 05 __ STA WORK + 2 
100f : c8 __ __ INY
1010 : b1 6b __ LDA (T6 + 0),y 
1012 : 85 06 __ STA WORK + 3 
1014 : 20 31 4e JSR $4e31 ; (freg + 20)
1017 : 20 68 4e JSR $4e68 ; (faddsub + 6)
101a : a0 00 __ LDY #$00
101c : b1 6d __ LDA (T7 + 0),y 
101e : 85 03 __ STA WORK + 0 
1020 : c8 __ __ INY
1021 : b1 6d __ LDA (T7 + 0),y 
1023 : 85 04 __ STA WORK + 1 
1025 : c8 __ __ INY
1026 : b1 6d __ LDA (T7 + 0),y 
1028 : 85 05 __ STA WORK + 2 
102a : c8 __ __ INY
102b : b1 6d __ LDA (T7 + 0),y 
102d : 85 06 __ STA WORK + 3 
102f : 20 31 4e JSR $4e31 ; (freg + 20)
1032 : 20 68 4e JSR $4e68 ; (faddsub + 6)
1035 : a0 04 __ LDY #$04
1037 : b1 6d __ LDA (T7 + 0),y 
1039 : 85 03 __ STA WORK + 0 
103b : c8 __ __ INY
103c : b1 6d __ LDA (T7 + 0),y 
103e : 85 04 __ STA WORK + 1 
1040 : c8 __ __ INY
1041 : b1 6d __ LDA (T7 + 0),y 
1043 : 85 05 __ STA WORK + 2 
1045 : c8 __ __ INY
1046 : b1 6d __ LDA (T7 + 0),y 
1048 : 85 06 __ STA WORK + 3 
104a : 20 31 4e JSR $4e31 ; (freg + 20)
104d : 20 68 4e JSR $4e68 ; (faddsub + 6)
1050 : a5 1b __ LDA ACCU + 0 
1052 : a0 00 __ LDY #$00
1054 : 91 67 __ STA (T5 + 0),y 
1056 : a5 1c __ LDA ACCU + 1 
1058 : c8 __ __ INY
1059 : 91 67 __ STA (T5 + 0),y 
105b : a5 1d __ LDA ACCU + 2 
105d : c8 __ __ INY
105e : 91 67 __ STA (T5 + 0),y 
1060 : a5 1e __ LDA ACCU + 3 
1062 : c8 __ __ INY
1063 : 91 67 __ STA (T5 + 0),y 
1065 : 18 __ __ CLC
1066 : a5 6b __ LDA T6 + 0 
1068 : 69 04 __ ADC #$04
106a : 85 6b __ STA T6 + 0 
106c : 90 03 __ BCC $1071 ; (main.s40 + 0)
.s39:
106e : e6 6c __ INC T6 + 1 
1070 : 18 __ __ CLC
.s40:
1071 : a5 6d __ LDA T7 + 0 
1073 : 69 04 __ ADC #$04
1075 : 85 6d __ STA T7 + 0 
1077 : 90 03 __ BCC $107c ; (main.s42 + 0)
.s41:
1079 : e6 6e __ INC T7 + 1 
107b : 18 __ __ CLC
.s42:
107c : a5 67 __ LDA T5 + 0 
107e : 69 06 __ ADC #$06
1080 : 85 67 __ STA T5 + 0 
1082 : 90 02 __ BCC $1086 ; (main.s44 + 0)
.s43:
1084 : e6 68 __ INC T5 + 1 
.s44:
1086 : e6 6f __ INC T8 + 0 
1088 : a5 6f __ LDA T8 + 0 
108a : c9 1e __ CMP #$1e
108c : b0 03 __ BCS $1091 ; (main.s15 + 0)
108e : 4c e2 0f JMP $0fe2 ; (main.l30 + 0)
.s15:
1091 : a5 63 __ LDA T4 + 0 
1093 : c9 1e __ CMP #$1e
1095 : b0 03 __ BCS $109a ; (main.s16 + 0)
1097 : 4c 84 0f JMP $0f84 ; (main.l14 + 0)
.s16:
109a : a9 88 __ LDA #$88
109c : a0 02 __ LDY #$02
109e : 91 23 __ STA (SP + 0),y 
10a0 : a9 a5 __ LDA #$a5
10a2 : c8 __ __ INY
10a3 : 91 23 __ STA (SP + 0),y 
10a5 : a9 84 __ LDA #$84
10a7 : c8 __ __ INY
10a8 : 91 23 __ STA (SP + 0),y 
10aa : a9 03 __ LDA #$03
10ac : c8 __ __ INY
10ad : 91 23 __ STA (SP + 0),y 
10af : 20 eb 35 JSR $35eb ; (qsort.s1 + 0)
10b2 : a9 8e __ LDA #$8e
10b4 : 85 0d __ STA P0 
10b6 : a9 37 __ LDA #$37
10b8 : 85 0e __ STA P1 
10ba : 20 be 24 JSR $24be ; (strlen.s4 + 0)
10bd : a9 00 __ LDA #$00
10bf : 8d e7 c7 STA $c7e7 ; (sstack + 41)
10c2 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
10c5 : 8d ea c7 STA $c7ea ; (sstack + 44)
10c8 : a9 18 __ LDA #$18
10ca : 8d e9 c7 STA $c7e9 ; (sstack + 43)
10cd : a9 8e __ LDA #$8e
10cf : 8d eb c7 STA $c7eb ; (sstack + 45)
10d2 : a9 37 __ LDA #$37
10d4 : 8d ec c7 STA $c7ec ; (sstack + 46)
10d7 : a5 1b __ LDA ACCU + 0 
10d9 : 8d ed c7 STA $c7ed ; (sstack + 47)
10dc : a9 08 __ LDA #$08
10de : 8d ee c7 STA $c7ee ; (sstack + 48)
10e1 : a9 33 __ LDA #$33
10e3 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
10e6 : a9 54 __ LDA #$54
10e8 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
10eb : a9 3b __ LDA #$3b
10ed : 8d e5 c7 STA $c7e5 ; (sstack + 39)
10f0 : a9 54 __ LDA #$54
10f2 : 8d e6 c7 STA $c7e6 ; (sstack + 40)
10f5 : 20 31 16 JSR $1631 ; (bm_put_chars.s1 + 0)
10f8 : a9 88 __ LDA #$88
10fa : 85 6d __ STA T7 + 0 
10fc : a9 a5 __ LDA #$a5
10fe : 85 6e __ STA T7 + 1 
.l17:
1100 : a9 70 __ LDA #$70
1102 : 85 0d __ STA P0 
1104 : a9 c7 __ LDA #$c7
1106 : 85 0e __ STA P1 
1108 : a0 04 __ LDY #$04
110a : b1 6d __ LDA (T7 + 0),y 
110c : 85 5f __ STA T3 + 0 
110e : 0a __ __ ASL
110f : a2 00 __ LDX #$00
1111 : 90 02 __ BCC $1115 ; (main.s46 + 0)
.s45:
1113 : e8 __ __ INX
1114 : 18 __ __ CLC
.s46:
1115 : 71 6d __ ADC (T7 + 0),y 
1117 : 85 53 __ STA T0 + 0 
1119 : 8a __ __ TXA
111a : 69 00 __ ADC #$00
111c : 06 53 __ ASL T0 + 0 
111e : 2a __ __ ROL
111f : 06 53 __ ASL T0 + 0 
1121 : 2a __ __ ROL
1122 : 85 54 __ STA T0 + 1 
1124 : a0 05 __ LDY #$05
1126 : b1 6d __ LDA (T7 + 0),y 
1128 : 85 63 __ STA T4 + 0 
112a : a2 74 __ LDX #$74
112c : 86 1b __ STX ACCU + 0 
112e : a2 01 __ LDX #$01
1130 : 86 1c __ STX ACCU + 1 
1132 : 20 af 4d JSR $4daf ; (mul16by8 + 0)
1135 : 18 __ __ CLC
1136 : a9 e0 __ LDA #$e0
1138 : 65 1b __ ADC ACCU + 0 
113a : a8 __ __ TAY
113b : a9 59 __ LDA #$59
113d : 65 1c __ ADC ACCU + 1 
113f : aa __ __ TAX
1140 : 98 __ __ TYA
1141 : 18 __ __ CLC
1142 : 65 53 __ ADC T0 + 0 
1144 : 85 5b __ STA T2 + 0 
1146 : 85 0f __ STA P2 
1148 : 8a __ __ TXA
1149 : 65 54 __ ADC T0 + 1 
114b : 85 5c __ STA T2 + 1 
114d : 85 10 __ STA P3 
114f : 18 __ __ CLC
1150 : a9 54 __ LDA #$54
1152 : 65 1b __ ADC ACCU + 0 
1154 : a8 __ __ TAY
1155 : a9 5b __ LDA #$5b
1157 : 65 1c __ ADC ACCU + 1 
1159 : aa __ __ TAX
115a : 98 __ __ TYA
115b : 18 __ __ CLC
115c : 65 53 __ ADC T0 + 0 
115e : 85 57 __ STA T1 + 0 
1160 : 8a __ __ TXA
1161 : 65 54 __ ADC T0 + 1 
1163 : 85 58 __ STA T1 + 1 
1165 : 18 __ __ CLC
1166 : a5 57 __ LDA T1 + 0 
1168 : 69 0c __ ADC #$0c
116a : 85 11 __ STA P4 
116c : a5 58 __ LDA T1 + 1 
116e : 69 00 __ ADC #$00
1170 : 85 12 __ STA P5 
1172 : 20 9f 37 JSR $379f ; (vec3_diff.s4 + 0)
1175 : a5 57 __ LDA T1 + 0 
1177 : 85 0f __ STA P2 
1179 : a9 64 __ LDA #$64
117b : 85 0d __ STA P0 
117d : a9 c7 __ LDA #$c7
117f : 85 0e __ STA P1 
1181 : a5 58 __ LDA T1 + 1 
1183 : 85 10 __ STA P3 
1185 : 18 __ __ CLC
1186 : a5 5b __ LDA T2 + 0 
1188 : 69 0c __ ADC #$0c
118a : 85 11 __ STA P4 
118c : a5 5c __ LDA T2 + 1 
118e : 69 00 __ ADC #$00
1190 : 85 12 __ STA P5 
1192 : 20 9f 37 JSR $379f ; (vec3_diff.s4 + 0)
1195 : a9 58 __ LDA #$58
1197 : 85 0d __ STA P0 
1199 : a9 c7 __ LDA #$c7
119b : 85 12 __ STA P5 
119d : a9 c7 __ LDA #$c7
119f : 85 0e __ STA P1 
11a1 : a9 70 __ LDA #$70
11a3 : 85 0f __ STA P2 
11a5 : a9 c7 __ LDA #$c7
11a7 : 85 10 __ STA P3 
11a9 : a9 64 __ LDA #$64
11ab : 85 11 __ STA P4 
11ad : 20 ef 37 JSR $37ef ; (vec3_xmul.s1 + 0)
11b0 : a9 58 __ LDA #$58
11b2 : 85 15 __ STA P8 
11b4 : a9 c7 __ LDA #$c7
11b6 : 85 16 __ STA P9 
11b8 : 20 61 2c JSR $2c61 ; (vec3_norm.s4 + 0)
11bb : a9 e3 __ LDA #$e3
11bd : 85 0d __ STA P0 
11bf : a9 c7 __ LDA #$c7
11c1 : 85 10 __ STA P3 
11c3 : a9 56 __ LDA #$56
11c5 : 85 0e __ STA P1 
11c7 : a9 58 __ LDA #$58
11c9 : 85 0f __ STA P2 
11cb : 20 19 2d JSR $2d19 ; (vec3_vmul.s4 + 0)
11ce : a9 08 __ LDA #$08
11d0 : 85 57 __ STA T1 + 0 
11d2 : a9 aa __ LDA #$aa
11d4 : 85 75 __ STA T13 + 0 
11d6 : a5 1e __ LDA ACCU + 3 
11d8 : 29 7f __ AND #$7f
11da : 05 1d __ ORA ACCU + 2 
11dc : 05 1c __ ORA ACCU + 1 
11de : 05 1b __ ORA ACCU + 0 
11e0 : f0 46 __ BEQ $1228 ; (main.s18 + 0)
.s25:
11e2 : 24 1e __ BIT ACCU + 3 
11e4 : 30 42 __ BMI $1228 ; (main.s18 + 0)
.s21:
11e6 : a5 1b __ LDA ACCU + 0 
11e8 : 85 53 __ STA T0 + 0 
11ea : a5 1c __ LDA ACCU + 1 
11ec : 85 54 __ STA T0 + 1 
11ee : a5 1d __ LDA ACCU + 2 
11f0 : 85 55 __ STA T0 + 2 
11f2 : a5 1e __ LDA ACCU + 3 
11f4 : 85 56 __ STA T0 + 3 
11f6 : a9 00 __ LDA #$00
11f8 : 85 1b __ STA ACCU + 0 
11fa : 85 1c __ STA ACCU + 1 
11fc : a9 10 __ LDA #$10
11fe : 85 1d __ STA ACCU + 2 
1200 : a9 41 __ LDA #$41
1202 : 85 1e __ STA ACCU + 3 
1204 : a2 53 __ LDX #$53
1206 : 20 21 4e JSR $4e21 ; (freg + 4)
1209 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
120c : 20 bf 51 JSR $51bf ; (f32_to_i16 + 0)
120f : 38 __ __ SEC
1210 : a9 08 __ LDA #$08
1212 : e5 1b __ SBC ACCU + 0 
1214 : 85 57 __ STA T1 + 0 
1216 : a9 00 __ LDA #$00
1218 : e5 1c __ SBC ACCU + 1 
121a : 30 08 __ BMI $1224 ; (main.s22 + 0)
.s24:
121c : d0 0a __ BNE $1228 ; (main.s18 + 0)
.s23:
121e : a5 57 __ LDA T1 + 0 
1220 : c9 05 __ CMP #$05
1222 : b0 04 __ BCS $1228 ; (main.s18 + 0)
.s22:
1224 : a9 ff __ LDA #$ff
1226 : 85 75 __ STA T13 + 0 
.s18:
1228 : a5 5f __ LDA T3 + 0 
122a : 0a __ __ ASL
122b : 85 53 __ STA T0 + 0 
122d : a9 00 __ LDA #$00
122f : 85 1c __ STA ACCU + 1 
1231 : 2a __ __ ROL
1232 : 06 53 __ ASL T0 + 0 
1234 : 2a __ __ ROL
1235 : 85 54 __ STA T0 + 1 
1237 : a5 63 __ LDA T4 + 0 
1239 : 85 1b __ STA ACCU + 0 
123b : a9 7c __ LDA #$7c
123d : 20 af 4d JSR $4daf ; (mul16by8 + 0)
1240 : 18 __ __ CLC
1241 : a9 80 __ LDA #$80
1243 : 65 1b __ ADC ACCU + 0 
1245 : 85 5f __ STA T3 + 0 
1247 : a9 87 __ LDA #$87
1249 : 65 1c __ ADC ACCU + 1 
124b : 85 60 __ STA T3 + 1 
124d : 18 __ __ CLC
124e : a5 5f __ LDA T3 + 0 
1250 : 65 53 __ ADC T0 + 0 
1252 : 85 73 __ STA T12 + 0 
1254 : a5 60 __ LDA T3 + 1 
1256 : 69 00 __ ADC #$00
1258 : 85 74 __ STA T12 + 1 
125a : a4 53 __ LDY T0 + 0 
125c : b1 5f __ LDA (T3 + 0),y 
125e : aa __ __ TAX
125f : a0 01 __ LDY #$01
1261 : b1 73 __ LDA (T12 + 0),y 
1263 : 85 60 __ STA T3 + 1 
1265 : c8 __ __ INY
1266 : b1 73 __ LDA (T12 + 0),y 
1268 : 85 63 __ STA T4 + 0 
126a : c8 __ __ INY
126b : b1 73 __ LDA (T12 + 0),y 
126d : 85 64 __ STA T4 + 1 
126f : c8 __ __ INY
1270 : b1 73 __ LDA (T12 + 0),y 
1272 : 85 67 __ STA T5 + 0 
1274 : c8 __ __ INY
1275 : b1 73 __ LDA (T12 + 0),y 
1277 : 85 68 __ STA T5 + 1 
1279 : c8 __ __ INY
127a : b1 73 __ LDA (T12 + 0),y 
127c : 85 6b __ STA T6 + 0 
127e : c8 __ __ INY
127f : b1 73 __ LDA (T12 + 0),y 
1281 : 8e ee c7 STX $c7ee ; (sstack + 48)
1284 : 8d f5 c7 STA $c7f5 ; (sstack + 55)
1287 : a5 60 __ LDA T3 + 1 
1289 : 8d ef c7 STA $c7ef ; (sstack + 49)
128c : a5 63 __ LDA T4 + 0 
128e : 8d f0 c7 STA $c7f0 ; (sstack + 50)
1291 : a5 64 __ LDA T4 + 1 
1293 : 8d f1 c7 STA $c7f1 ; (sstack + 51)
1296 : a5 67 __ LDA T5 + 0 
1298 : 8d f2 c7 STA $c7f2 ; (sstack + 52)
129b : a5 68 __ LDA T5 + 1 
129d : 8d f3 c7 STA $c7f3 ; (sstack + 53)
12a0 : a5 6b __ LDA T6 + 0 
12a2 : 8d f4 c7 STA $c7f4 ; (sstack + 54)
12a5 : 18 __ __ CLC
12a6 : a5 1b __ LDA ACCU + 0 
12a8 : 65 53 __ ADC T0 + 0 
12aa : a8 __ __ TAY
12ab : a5 1c __ LDA ACCU + 1 
12ad : 65 54 __ ADC T0 + 1 
12af : aa __ __ TAX
12b0 : 98 __ __ TYA
12b1 : 18 __ __ CLC
12b2 : 69 fc __ ADC #$fc
12b4 : 85 67 __ STA T5 + 0 
12b6 : 8a __ __ TXA
12b7 : 69 87 __ ADC #$87
12b9 : 85 68 __ STA T5 + 1 
12bb : a0 00 __ LDY #$00
12bd : b1 67 __ LDA (T5 + 0),y 
12bf : 85 53 __ STA T0 + 0 
12c1 : c8 __ __ INY
12c2 : b1 67 __ LDA (T5 + 0),y 
12c4 : 85 54 __ STA T0 + 1 
12c6 : c8 __ __ INY
12c7 : b1 67 __ LDA (T5 + 0),y 
12c9 : 85 5b __ STA T2 + 0 
12cb : c8 __ __ INY
12cc : b1 67 __ LDA (T5 + 0),y 
12ce : 85 5c __ STA T2 + 1 
12d0 : c8 __ __ INY
12d1 : b1 67 __ LDA (T5 + 0),y 
12d3 : aa __ __ TAX
12d4 : c8 __ __ INY
12d5 : b1 67 __ LDA (T5 + 0),y 
12d7 : 85 60 __ STA T3 + 1 
12d9 : c8 __ __ INY
12da : b1 67 __ LDA (T5 + 0),y 
12dc : 8d f8 c7 STA $c7f8 ; (sstack + 58)
12df : c8 __ __ INY
12e0 : b1 67 __ LDA (T5 + 0),y 
12e2 : 8e f6 c7 STX $c7f6 ; (sstack + 56)
12e5 : 8d f9 c7 STA $c7f9 ; (sstack + 59)
12e8 : a5 60 __ LDA T3 + 1 
12ea : 8d f7 c7 STA $c7f7 ; (sstack + 57)
12ed : a5 53 __ LDA T0 + 0 
12ef : 8d fa c7 STA $c7fa ; (sstack + 60)
12f2 : a5 54 __ LDA T0 + 1 
12f4 : 8d fb c7 STA $c7fb ; (sstack + 61)
12f7 : a5 5b __ LDA T2 + 0 
12f9 : 8d fc c7 STA $c7fc ; (sstack + 62)
12fc : a5 5c __ LDA T2 + 1 
12fe : 8d fd c7 STA $c7fd ; (sstack + 63)
1301 : a5 57 __ LDA T1 + 0 
1303 : 0a __ __ ASL
1304 : 0a __ __ ASL
1305 : 0a __ __ ASL
1306 : 18 __ __ CLC
1307 : 69 8a __ ADC #$8a
1309 : 8d fe c7 STA $c7fe ; (sstack + 64)
130c : a9 33 __ LDA #$33
130e : 8d ea c7 STA $c7ea ; (sstack + 44)
1311 : a9 54 __ LDA #$54
1313 : 8d eb c7 STA $c7eb ; (sstack + 45)
1316 : a9 3b __ LDA #$3b
1318 : 8d ec c7 STA $c7ec ; (sstack + 46)
131b : a9 54 __ LDA #$54
131d : 8d ed c7 STA $c7ed ; (sstack + 47)
1320 : a9 56 __ LDA #$56
1322 : 69 00 __ ADC #$00
1324 : 8d ff c7 STA $c7ff ; (sstack + 65)
1327 : 20 95 39 JSR $3995 ; (bm_quad_fill.s1 + 0)
132a : a9 33 __ LDA #$33
132c : 8d be c7 STA $c7be ; (sstack + 0)
132f : a9 54 __ LDA #$54
1331 : 8d bf c7 STA $c7bf ; (sstack + 1)
1334 : a9 3b __ LDA #$3b
1336 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
1339 : a9 54 __ LDA #$54
133b : 8d c1 c7 STA $c7c1 ; (sstack + 3)
133e : a0 00 __ LDY #$00
1340 : b1 73 __ LDA (T12 + 0),y 
1342 : aa __ __ TAX
1343 : c8 __ __ INY
1344 : b1 73 __ LDA (T12 + 0),y 
1346 : 85 54 __ STA T0 + 1 
1348 : c8 __ __ INY
1349 : b1 73 __ LDA (T12 + 0),y 
134b : 85 57 __ STA T1 + 0 
134d : c8 __ __ INY
134e : b1 73 __ LDA (T12 + 0),y 
1350 : 85 58 __ STA T1 + 1 
1352 : c8 __ __ INY
1353 : b1 73 __ LDA (T12 + 0),y 
1355 : 85 5b __ STA T2 + 0 
1357 : c8 __ __ INY
1358 : b1 73 __ LDA (T12 + 0),y 
135a : 85 5c __ STA T2 + 1 
135c : c8 __ __ INY
135d : b1 73 __ LDA (T12 + 0),y 
135f : 85 5f __ STA T3 + 0 
1361 : c8 __ __ INY
1362 : b1 73 __ LDA (T12 + 0),y 
1364 : 8e c2 c7 STX $c7c2 ; (sstack + 4)
1367 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
136a : a5 54 __ LDA T0 + 1 
136c : 8d c3 c7 STA $c7c3 ; (sstack + 5)
136f : a5 57 __ LDA T1 + 0 
1371 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
1374 : a5 58 __ LDA T1 + 1 
1376 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
1379 : a5 5b __ LDA T2 + 0 
137b : 8d c6 c7 STA $c7c6 ; (sstack + 8)
137e : a5 5c __ LDA T2 + 1 
1380 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
1383 : a5 5f __ LDA T3 + 0 
1385 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
1388 : a5 75 __ LDA T13 + 0 
138a : 8d ca c7 STA $c7ca ; (sstack + 12)
138d : a9 00 __ LDA #$00
138f : 8d cb c7 STA $c7cb ; (sstack + 13)
1392 : 20 09 43 JSR $4309 ; (bm_line.s1 + 0)
1395 : a9 33 __ LDA #$33
1397 : 8d be c7 STA $c7be ; (sstack + 0)
139a : a9 54 __ LDA #$54
139c : 8d bf c7 STA $c7bf ; (sstack + 1)
139f : a9 3b __ LDA #$3b
13a1 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
13a4 : a9 54 __ LDA #$54
13a6 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
13a9 : a0 00 __ LDY #$00
13ab : b1 67 __ LDA (T5 + 0),y 
13ad : aa __ __ TAX
13ae : c8 __ __ INY
13af : b1 67 __ LDA (T5 + 0),y 
13b1 : 85 54 __ STA T0 + 1 
13b3 : c8 __ __ INY
13b4 : b1 67 __ LDA (T5 + 0),y 
13b6 : 85 57 __ STA T1 + 0 
13b8 : c8 __ __ INY
13b9 : b1 67 __ LDA (T5 + 0),y 
13bb : 85 58 __ STA T1 + 1 
13bd : c8 __ __ INY
13be : b1 67 __ LDA (T5 + 0),y 
13c0 : 85 5b __ STA T2 + 0 
13c2 : c8 __ __ INY
13c3 : b1 67 __ LDA (T5 + 0),y 
13c5 : 85 5c __ STA T2 + 1 
13c7 : c8 __ __ INY
13c8 : b1 67 __ LDA (T5 + 0),y 
13ca : 85 5f __ STA T3 + 0 
13cc : c8 __ __ INY
13cd : b1 67 __ LDA (T5 + 0),y 
13cf : 8e c2 c7 STX $c7c2 ; (sstack + 4)
13d2 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
13d5 : a5 54 __ LDA T0 + 1 
13d7 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
13da : a5 57 __ LDA T1 + 0 
13dc : 8d c4 c7 STA $c7c4 ; (sstack + 6)
13df : a5 58 __ LDA T1 + 1 
13e1 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
13e4 : a5 5b __ LDA T2 + 0 
13e6 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
13e9 : a5 5c __ LDA T2 + 1 
13eb : 8d c7 c7 STA $c7c7 ; (sstack + 9)
13ee : a5 5f __ LDA T3 + 0 
13f0 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
13f3 : a5 75 __ LDA T13 + 0 
13f5 : 8d ca c7 STA $c7ca ; (sstack + 12)
13f8 : a9 00 __ LDA #$00
13fa : 8d cb c7 STA $c7cb ; (sstack + 13)
13fd : 20 09 43 JSR $4309 ; (bm_line.s1 + 0)
1400 : a9 33 __ LDA #$33
1402 : 8d be c7 STA $c7be ; (sstack + 0)
1405 : a9 54 __ LDA #$54
1407 : 8d bf c7 STA $c7bf ; (sstack + 1)
140a : a9 3b __ LDA #$3b
140c : 8d c0 c7 STA $c7c0 ; (sstack + 2)
140f : a9 54 __ LDA #$54
1411 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
1414 : a0 00 __ LDY #$00
1416 : b1 67 __ LDA (T5 + 0),y 
1418 : 85 53 __ STA T0 + 0 
141a : c8 __ __ INY
141b : b1 67 __ LDA (T5 + 0),y 
141d : 85 54 __ STA T0 + 1 
141f : c8 __ __ INY
1420 : b1 67 __ LDA (T5 + 0),y 
1422 : 85 57 __ STA T1 + 0 
1424 : c8 __ __ INY
1425 : b1 67 __ LDA (T5 + 0),y 
1427 : 85 58 __ STA T1 + 1 
1429 : a0 00 __ LDY #$00
142b : b1 73 __ LDA (T12 + 0),y 
142d : aa __ __ TAX
142e : c8 __ __ INY
142f : b1 73 __ LDA (T12 + 0),y 
1431 : 85 5c __ STA T2 + 1 
1433 : c8 __ __ INY
1434 : b1 73 __ LDA (T12 + 0),y 
1436 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
1439 : c8 __ __ INY
143a : b1 73 __ LDA (T12 + 0),y 
143c : 8e c2 c7 STX $c7c2 ; (sstack + 4)
143f : 8d c5 c7 STA $c7c5 ; (sstack + 7)
1442 : a5 5c __ LDA T2 + 1 
1444 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
1447 : a5 53 __ LDA T0 + 0 
1449 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
144c : a5 54 __ LDA T0 + 1 
144e : 8d c7 c7 STA $c7c7 ; (sstack + 9)
1451 : a5 57 __ LDA T1 + 0 
1453 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
1456 : a5 58 __ LDA T1 + 1 
1458 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
145b : a5 75 __ LDA T13 + 0 
145d : 8d ca c7 STA $c7ca ; (sstack + 12)
1460 : a9 00 __ LDA #$00
1462 : 8d cb c7 STA $c7cb ; (sstack + 13)
1465 : 20 09 43 JSR $4309 ; (bm_line.s1 + 0)
1468 : a9 33 __ LDA #$33
146a : 8d be c7 STA $c7be ; (sstack + 0)
146d : a9 54 __ LDA #$54
146f : 8d bf c7 STA $c7bf ; (sstack + 1)
1472 : a9 3b __ LDA #$3b
1474 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
1477 : a9 54 __ LDA #$54
1479 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
147c : a0 04 __ LDY #$04
147e : b1 67 __ LDA (T5 + 0),y 
1480 : 85 53 __ STA T0 + 0 
1482 : c8 __ __ INY
1483 : b1 67 __ LDA (T5 + 0),y 
1485 : 85 54 __ STA T0 + 1 
1487 : c8 __ __ INY
1488 : b1 67 __ LDA (T5 + 0),y 
148a : 85 57 __ STA T1 + 0 
148c : c8 __ __ INY
148d : b1 67 __ LDA (T5 + 0),y 
148f : 85 58 __ STA T1 + 1 
1491 : a0 04 __ LDY #$04
1493 : b1 73 __ LDA (T12 + 0),y 
1495 : aa __ __ TAX
1496 : c8 __ __ INY
1497 : b1 73 __ LDA (T12 + 0),y 
1499 : 85 5c __ STA T2 + 1 
149b : c8 __ __ INY
149c : b1 73 __ LDA (T12 + 0),y 
149e : 8d c4 c7 STA $c7c4 ; (sstack + 6)
14a1 : c8 __ __ INY
14a2 : b1 73 __ LDA (T12 + 0),y 
14a4 : 8e c2 c7 STX $c7c2 ; (sstack + 4)
14a7 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
14aa : a5 5c __ LDA T2 + 1 
14ac : 8d c3 c7 STA $c7c3 ; (sstack + 5)
14af : a5 53 __ LDA T0 + 0 
14b1 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
14b4 : a5 54 __ LDA T0 + 1 
14b6 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
14b9 : a5 57 __ LDA T1 + 0 
14bb : 8d c8 c7 STA $c7c8 ; (sstack + 10)
14be : a5 58 __ LDA T1 + 1 
14c0 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
14c3 : a5 75 __ LDA T13 + 0 
14c5 : 8d ca c7 STA $c7ca ; (sstack + 12)
14c8 : a9 00 __ LDA #$00
14ca : 8d cb c7 STA $c7cb ; (sstack + 13)
14cd : 20 09 43 JSR $4309 ; (bm_line.s1 + 0)
14d0 : 18 __ __ CLC
14d1 : a5 6d __ LDA T7 + 0 
14d3 : 69 06 __ ADC #$06
14d5 : 85 6d __ STA T7 + 0 
14d7 : 90 02 __ BCC $14db ; (main.s48 + 0)
.s47:
14d9 : e6 6e __ INC T7 + 1 
.s48:
14db : c9 a0 __ CMP #$a0
14dd : f0 03 __ BEQ $14e2 ; (main.s20 + 0)
14df : 4c 00 11 JMP $1100 ; (main.l17 + 0)
.s20:
14e2 : a5 6e __ LDA T7 + 1 
14e4 : c9 ba __ CMP #$ba
14e6 : d0 f7 __ BNE $14df ; (main.s48 + 4)
.s19:
14e8 : a9 36 __ LDA #$36
14ea : 85 01 __ STA $01 
14ec : 20 59 4d JSR $4d59 ; (getch.l4 + 0)
14ef : 20 97 4d JSR $4d97 ; (restore.s4 + 0)
14f2 : a9 00 __ LDA #$00
14f4 : 85 1b __ STA ACCU + 0 
14f6 : 85 1c __ STA ACCU + 1 
.s3:
14f8 : 18 __ __ CLC
14f9 : a5 23 __ LDA SP + 0 
14fb : 69 06 __ ADC #$06
14fd : 85 23 __ STA SP + 0 
14ff : 90 02 __ BCC $1503 ; (main.s3 + 11)
1501 : e6 24 __ INC SP + 1 
1503 : a2 22 __ LDX #$22
1505 : bd 31 c7 LDA $c731,x ; (main@stack + 0)
1508 : 95 53 __ STA T0 + 0,x 
150a : ca __ __ DEX
150b : 10 f8 __ BPL $1505 ; (main.s3 + 13)
150d : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  36, "/home/honza/projects/c64/projects/oscar64/samples/hires/func3d.c"
.s4:
150e : a9 00 __ LDA #$00
1510 : 85 0e __ STA P1 
1512 : 85 10 __ STA P3 
1514 : a9 36 __ LDA #$36
1516 : 85 01 __ STA $01 
1518 : a9 03 __ LDA #$03
151a : 85 0d __ STA P0 
151c : a9 c8 __ LDA #$c8
151e : 85 0f __ STA P2 
1520 : a9 e0 __ LDA #$e0
1522 : 85 11 __ STA P4 
1524 : 20 5e 15 JSR $155e ; (vic_setmode.s4 + 0)
1527 : a9 01 __ LDA #$01
1529 : 8d 21 d0 STA $d021 
152c : 8d 20 d0 STA $d020 
152f : 20 b0 15 JSR $15b0 ; (mmap_trampoline.s4 + 0)
1532 : a9 00 __ LDA #$00
1534 : 85 0d __ STA P0 
1536 : 85 0f __ STA P2 
1538 : a9 35 __ LDA #$35
153a : 85 01 __ STA $01 
153c : a9 e0 __ LDA #$e0
153e : 85 0e __ STA P1 
1540 : a9 40 __ LDA #$40
1542 : 85 11 __ STA P4 
1544 : a9 1f __ LDA #$1f
1546 : 85 12 __ STA P5 
1548 : a9 01 __ LDA #$01
154a : a2 fa __ LDX #$fa
.l6:
154c : ca __ __ DEX
154d : 9d 00 c8 STA $c800,x 
1550 : 9d fa c8 STA $c8fa,x 
1553 : 9d f4 c9 STA $c9f4,x 
1556 : 9d ee ca STA $caee,x 
1559 : d0 f1 __ BNE $154c ; (init.l6 + 0)
.s5:
155b : 4c fa 15 JMP $15fa ; (memset.s4 + 0)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
155e : a4 0d __ LDY P0 ; (mode + 0)
1560 : c0 02 __ CPY #$02
1562 : d0 09 __ BNE $156d ; (vic_setmode.s5 + 0)
.s10:
1564 : a9 5b __ LDA #$5b
1566 : 8d 11 d0 STA $d011 
.s8:
1569 : a9 08 __ LDA #$08
156b : d0 0c __ BNE $1579 ; (vic_setmode.s7 + 0)
.s5:
156d : b0 36 __ BCS $15a5 ; (vic_setmode.s6 + 0)
.s9:
156f : a9 1b __ LDA #$1b
1571 : 8d 11 d0 STA $d011 
1574 : 98 __ __ TYA
1575 : f0 f2 __ BEQ $1569 ; (vic_setmode.s8 + 0)
.s11:
1577 : a9 18 __ LDA #$18
.s7:
1579 : 8d 16 d0 STA $d016 
157c : ad 00 dd LDA $dd00 
157f : 29 fc __ AND #$fc
1581 : 85 1b __ STA ACCU + 0 
1583 : a5 0f __ LDA P2 ; (text + 1)
1585 : 0a __ __ ASL
1586 : 2a __ __ ROL
1587 : 29 01 __ AND #$01
1589 : 2a __ __ ROL
158a : 49 03 __ EOR #$03
158c : 05 1b __ ORA ACCU + 0 
158e : 8d 00 dd STA $dd00 
1591 : a5 0f __ LDA P2 ; (text + 1)
1593 : 29 3c __ AND #$3c
1595 : 0a __ __ ASL
1596 : 0a __ __ ASL
1597 : 85 1b __ STA ACCU + 0 
1599 : a5 11 __ LDA P4 ; (font + 1)
159b : 29 38 __ AND #$38
159d : 4a __ __ LSR
159e : 4a __ __ LSR
159f : 05 1b __ ORA ACCU + 0 
15a1 : 8d 18 d0 STA $d018 
.s3:
15a4 : 60 __ __ RTS
.s6:
15a5 : a9 3b __ LDA #$3b
15a7 : 8d 11 d0 STA $d011 
15aa : c0 03 __ CPY #$03
15ac : d0 c9 __ BNE $1577 ; (vic_setmode.s11 + 0)
15ae : f0 b9 __ BEQ $1569 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
15b0 : a9 c5 __ LDA #$c5
15b2 : 8d fa ff STA $fffa 
15b5 : a9 15 __ LDA #$15
15b7 : 8d fb ff STA $fffb 
15ba : a9 e3 __ LDA #$e3
15bc : 8d fe ff STA $fffe 
15bf : a9 15 __ LDA #$15
15c1 : 8d ff ff STA $ffff 
.s3:
15c4 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
15c5 : 48 __ __ PHA
15c6 : 8a __ __ TXA
15c7 : 48 __ __ PHA
15c8 : a9 15 __ LDA #$15
15ca : 48 __ __ PHA
15cb : a9 dc __ LDA #$dc
15cd : 48 __ __ PHA
15ce : ba __ __ TSX
15cf : bd 05 01 LDA $0105,x 
15d2 : 48 __ __ PHA
15d3 : a6 01 __ LDX $01 
15d5 : a9 36 __ LDA #$36
15d7 : 85 01 __ STA $01 
15d9 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
15dc : 86 01 __ STX $01 
15de : 68 __ __ PLA
15df : aa __ __ TAX
15e0 : 68 __ __ PLA
15e1 : 40 __ __ RTI
15e2 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
15e3 : 48 __ __ PHA
15e4 : 8a __ __ TXA
15e5 : 48 __ __ PHA
15e6 : a9 15 __ LDA #$15
15e8 : 48 __ __ PHA
15e9 : a9 dc __ LDA #$dc
15eb : 48 __ __ PHA
15ec : ba __ __ TSX
15ed : bd 05 01 LDA $0105,x 
15f0 : 48 __ __ PHA
15f1 : a6 01 __ LDX $01 
15f3 : a9 36 __ LDA #$36
15f5 : 85 01 __ STA $01 
15f7 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
15fa : a5 0f __ LDA P2 
15fc : a6 12 __ LDX P5 
15fe : f0 0c __ BEQ $160c ; (memset.s4 + 18)
1600 : a0 00 __ LDY #$00
1602 : 91 0d __ STA (P0),y ; (dst + 0)
1604 : c8 __ __ INY
1605 : d0 fb __ BNE $1602 ; (memset.s4 + 8)
1607 : e6 0e __ INC P1 ; (dst + 1)
1609 : ca __ __ DEX
160a : d0 f6 __ BNE $1602 ; (memset.s4 + 8)
160c : a4 11 __ LDY P4 
160e : f0 05 __ BEQ $1615 ; (memset.s4 + 27)
1610 : 88 __ __ DEY
1611 : 91 0d __ STA (P0),y ; (dst + 0)
1613 : d0 fb __ BNE $1610 ; (memset.s4 + 22)
1615 : a5 0d __ LDA P0 ; (dst + 0)
1617 : 85 1b __ STA ACCU + 0 
1619 : a5 0e __ LDA P1 ; (dst + 1)
161b : 85 1c __ STA ACCU + 1 
.s3:
161d : 60 __ __ RTS
--------------------------------------------------------------------
161e : __ __ __ BYT 50 72 65 70 61 72 69 6e 67 20 66 75 6e 63 74 69 : Preparing functi
162e : __ __ __ BYT 6f 6e 00                                        : on.
--------------------------------------------------------------------
bm_put_chars: ; bm_put_chars(const struct Bitmap*,const struct ClipRect*,i16,i16,const u8*,u8,enum BlitOp)->i16
; 160, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
1631 : a2 0d __ LDX #$0d
1633 : b5 53 __ LDA T3 + 0,x 
1635 : 9d a8 c7 STA $c7a8,x ; (bm_put_chars@stack + 0)
1638 : ca __ __ DEX
1639 : 10 f8 __ BPL $1633 ; (bm_put_chars.s1 + 2)
.s4:
163b : a9 00 __ LDA #$00
163d : 85 57 __ STA T5 + 0 
163f : 85 58 __ STA T5 + 1 
1641 : ad e9 c7 LDA $c7e9 ; (sstack + 43)
1644 : 85 59 __ STA T6 + 0 
1646 : ad e5 c7 LDA $c7e5 ; (sstack + 39)
1649 : 85 5b __ STA T7 + 0 
164b : ad e6 c7 LDA $c7e6 ; (sstack + 40)
164e : 85 5c __ STA T7 + 1 
1650 : ad ea c7 LDA $c7ea ; (sstack + 44)
1653 : 85 5a __ STA T6 + 1 
1655 : a0 07 __ LDY #$07
1657 : d1 5b __ CMP (T7 + 0),y 
1659 : d0 09 __ BNE $1664 ; (bm_put_chars.s51 + 0)
.s48:
165b : a5 59 __ LDA T6 + 0 
165d : 88 __ __ DEY
165e : d1 5b __ CMP (T7 + 0),y 
.s49:
1660 : 90 08 __ BCC $166a ; (bm_put_chars.s5 + 0)
1662 : b0 51 __ BCS $16b5 ; (bm_put_chars.s38 + 0)
.s51:
1664 : 51 5b __ EOR (T7 + 0),y 
1666 : 10 f8 __ BPL $1660 ; (bm_put_chars.s49 + 0)
.s50:
1668 : 90 4b __ BCC $16b5 ; (bm_put_chars.s38 + 0)
.s5:
166a : ad e7 c7 LDA $c7e7 ; (sstack + 41)
166d : 85 43 __ STA T0 + 0 ; (x + 1)
166f : a0 04 __ LDY #$04
1671 : b1 5b __ LDA (T7 + 0),y 
1673 : 85 45 __ STA T1 + 0 ; (y + 1)
1675 : c8 __ __ INY
1676 : b1 5b __ LDA (T7 + 0),y 
1678 : 85 46 __ STA T1 + 1 ; (str + 0)
167a : ad e8 c7 LDA $c7e8 ; (sstack + 42)
167d : 85 44 __ STA T0 + 1 ; (y + 0)
167f : c5 46 __ CMP T1 + 1 ; (str + 0)
1681 : d0 08 __ BNE $168b ; (bm_put_chars.s47 + 0)
.s44:
1683 : a5 43 __ LDA T0 + 0 ; (x + 1)
1685 : c5 45 __ CMP T1 + 0 ; (y + 1)
.s45:
1687 : 90 08 __ BCC $1691 ; (bm_put_chars.s6 + 0)
1689 : b0 2a __ BCS $16b5 ; (bm_put_chars.s38 + 0)
.s47:
168b : 45 46 __ EOR T1 + 1 ; (str + 0)
168d : 10 f8 __ BPL $1687 ; (bm_put_chars.s45 + 0)
.s46:
168f : 90 24 __ BCC $16b5 ; (bm_put_chars.s38 + 0)
.s6:
1691 : 18 __ __ CLC
1692 : a5 59 __ LDA T6 + 0 
1694 : 69 08 __ ADC #$08
1696 : 85 1b __ STA ACCU + 0 
1698 : a5 5a __ LDA T6 + 1 
169a : 69 00 __ ADC #$00
169c : 85 1c __ STA ACCU + 1 
169e : a0 03 __ LDY #$03
16a0 : b1 5b __ LDA (T7 + 0),y 
16a2 : c5 1c __ CMP ACCU + 1 
16a4 : d0 09 __ BNE $16af ; (bm_put_chars.s43 + 0)
.s40:
16a6 : 88 __ __ DEY
16a7 : b1 5b __ LDA (T7 + 0),y 
16a9 : c5 1b __ CMP ACCU + 0 
.s41:
16ab : b0 08 __ BCS $16b5 ; (bm_put_chars.s38 + 0)
16ad : 90 44 __ BCC $16f3 ; (bm_put_chars.s7 + 0)
.s43:
16af : 45 1c __ EOR ACCU + 1 
16b1 : 10 f8 __ BPL $16ab ; (bm_put_chars.s41 + 0)
.s42:
16b3 : b0 3e __ BCS $16f3 ; (bm_put_chars.s7 + 0)
.s38:
16b5 : ad ed c7 LDA $c7ed ; (sstack + 47)
16b8 : f0 26 __ BEQ $16e0 ; (bm_put_chars.s11 + 0)
.s39:
16ba : ad eb c7 LDA $c7eb ; (sstack + 45)
16bd : 85 43 __ STA T0 + 0 ; (x + 1)
16bf : ad ec c7 LDA $c7ec ; (sstack + 46)
16c2 : 85 44 __ STA T0 + 1 ; (y + 0)
16c4 : a0 00 __ LDY #$00
.l52:
16c6 : b1 43 __ LDA (T0 + 0),y ; (x + 1)
16c8 : 38 __ __ SEC
16c9 : e9 20 __ SBC #$20
16cb : aa __ __ TAX
16cc : bd a3 54 LDA $54a3,x ; (TinyFont[0] + 96)
16cf : 4a __ __ LSR
16d0 : 4a __ __ LSR
16d1 : 38 __ __ SEC
16d2 : 65 57 __ ADC T5 + 0 
16d4 : 85 57 __ STA T5 + 0 
16d6 : 90 02 __ BCC $16da ; (bm_put_chars.s63 + 0)
.s62:
16d8 : e6 58 __ INC T5 + 1 
.s63:
16da : c8 __ __ INY
16db : cc ed c7 CPY $c7ed ; (sstack + 47)
16de : 90 e6 __ BCC $16c6 ; (bm_put_chars.l52 + 0)
.s11:
16e0 : a5 57 __ LDA T5 + 0 
16e2 : 85 1b __ STA ACCU + 0 
16e4 : a5 58 __ LDA T5 + 1 
16e6 : 85 1c __ STA ACCU + 1 
.s3:
16e8 : a2 0d __ LDX #$0d
16ea : bd a8 c7 LDA $c7a8,x ; (bm_put_chars@stack + 0)
16ed : 95 53 __ STA T3 + 0,x 
16ef : ca __ __ DEX
16f0 : 10 f8 __ BPL $16ea ; (bm_put_chars.s3 + 2)
16f2 : 60 __ __ RTS
.s7:
16f3 : a0 00 __ LDY #$00
16f5 : b1 5b __ LDA (T7 + 0),y 
16f7 : 85 1b __ STA ACCU + 0 
16f9 : c8 __ __ INY
16fa : b1 5b __ LDA (T7 + 0),y 
16fc : 85 1c __ STA ACCU + 1 
16fe : a5 44 __ LDA T0 + 1 ; (y + 0)
1700 : c5 1c __ CMP ACCU + 1 
1702 : d0 09 __ BNE $170d ; (bm_put_chars.s37 + 0)
.s34:
1704 : a5 43 __ LDA T0 + 0 ; (x + 1)
1706 : c5 1b __ CMP ACCU + 0 
.s35:
1708 : 90 09 __ BCC $1713 ; (bm_put_chars.s25 + 0)
170a : 4c 8f 17 JMP $178f ; (bm_put_chars.s8 + 0)
.s37:
170d : 45 1c __ EOR ACCU + 1 
170f : 10 f7 __ BPL $1708 ; (bm_put_chars.s35 + 0)
.s36:
1711 : 90 7c __ BCC $178f ; (bm_put_chars.s8 + 0)
.s25:
1713 : a9 00 __ LDA #$00
1715 : 85 5d __ STA T8 + 0 
1717 : ad ed c7 LDA $c7ed ; (sstack + 47)
171a : 85 5f __ STA T9 + 0 
171c : f0 51 __ BEQ $176f ; (bm_put_chars.s26 + 0)
.s27:
171e : ad eb c7 LDA $c7eb ; (sstack + 45)
1721 : 85 43 __ STA T0 + 0 ; (x + 1)
1723 : ad ec c7 LDA $c7ec ; (sstack + 46)
1726 : 85 44 __ STA T0 + 1 ; (y + 0)
1728 : a0 00 __ LDY #$00
.l28:
172a : b1 43 __ LDA (T0 + 0),y ; (x + 1)
172c : 38 __ __ SEC
172d : e9 20 __ SBC #$20
172f : aa __ __ TAX
1730 : bd a3 54 LDA $54a3,x ; (TinyFont[0] + 96)
1733 : 4a __ __ LSR
1734 : 4a __ __ LSR
1735 : 18 __ __ CLC
1736 : 69 01 __ ADC #$01
1738 : 85 53 __ STA T3 + 0 
173a : 6d e7 c7 ADC $c7e7 ; (sstack + 41)
173d : aa __ __ TAX
173e : ad e8 c7 LDA $c7e8 ; (sstack + 42)
1741 : 69 00 __ ADC #$00
1743 : 85 56 __ STA T4 + 1 
1745 : c5 1c __ CMP ACCU + 1 
1747 : d0 06 __ BNE $174f ; (bm_put_chars.s33 + 0)
.s30:
1749 : e4 1b __ CPX ACCU + 0 
.s31:
174b : 90 08 __ BCC $1755 ; (bm_put_chars.s29 + 0)
174d : b0 1e __ BCS $176d ; (bm_put_chars.s53 + 0)
.s33:
174f : 45 1c __ EOR ACCU + 1 
1751 : 10 f8 __ BPL $174b ; (bm_put_chars.s31 + 0)
.s32:
1753 : 90 18 __ BCC $176d ; (bm_put_chars.s53 + 0)
.s29:
1755 : 8e e7 c7 STX $c7e7 ; (sstack + 41)
1758 : 18 __ __ CLC
1759 : a5 57 __ LDA T5 + 0 
175b : 65 53 __ ADC T3 + 0 
175d : 85 57 __ STA T5 + 0 
175f : 90 02 __ BCC $1763 ; (bm_put_chars.s56 + 0)
.s55:
1761 : e6 58 __ INC T5 + 1 
.s56:
1763 : a5 56 __ LDA T4 + 1 
1765 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
1768 : c8 __ __ INY
1769 : c4 5f __ CPY T9 + 0 
176b : 90 bd __ BCC $172a ; (bm_put_chars.l28 + 0)
.s53:
176d : 84 5d __ STY T8 + 0 
.s26:
176f : ad eb c7 LDA $c7eb ; (sstack + 45)
1772 : 18 __ __ CLC
1773 : 65 5d __ ADC T8 + 0 
1775 : 8d eb c7 STA $c7eb ; (sstack + 45)
1778 : 90 03 __ BCC $177d ; (bm_put_chars.s58 + 0)
.s57:
177a : ee ec c7 INC $c7ec ; (sstack + 46)
.s58:
177d : a5 5f __ LDA T9 + 0 
177f : 38 __ __ SEC
1780 : e5 5d __ SBC T8 + 0 
1782 : 8d ed c7 STA $c7ed ; (sstack + 47)
1785 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
1788 : 85 43 __ STA T0 + 0 ; (x + 1)
178a : ad e8 c7 LDA $c7e8 ; (sstack + 42)
178d : 85 44 __ STA T0 + 1 ; (y + 0)
.s8:
178f : a9 00 __ LDA #$00
1791 : 85 5f __ STA T9 + 0 
1793 : ad ed c7 LDA $c7ed ; (sstack + 47)
1796 : 85 60 __ STA T10 + 0 
1798 : f0 5d __ BEQ $17f7 ; (bm_put_chars.s9 + 0)
.s13:
179a : a5 44 __ LDA T0 + 1 ; (y + 0)
179c : c5 46 __ CMP T1 + 1 ; (str + 0)
179e : d0 08 __ BNE $17a8 ; (bm_put_chars.s24 + 0)
.s21:
17a0 : a5 43 __ LDA T0 + 0 ; (x + 1)
17a2 : c5 45 __ CMP T1 + 0 ; (y + 1)
.s22:
17a4 : 90 08 __ BCC $17ae ; (bm_put_chars.s14 + 0)
17a6 : b0 4f __ BCS $17f7 ; (bm_put_chars.s9 + 0)
.s24:
17a8 : 45 46 __ EOR T1 + 1 ; (str + 0)
17aa : 10 f8 __ BPL $17a4 ; (bm_put_chars.s22 + 0)
.s23:
17ac : 90 49 __ BCC $17f7 ; (bm_put_chars.s9 + 0)
.s14:
17ae : ad eb c7 LDA $c7eb ; (sstack + 45)
17b1 : 85 1b __ STA ACCU + 0 
17b3 : ad ec c7 LDA $c7ec ; (sstack + 46)
17b6 : 85 1c __ STA ACCU + 1 
17b8 : a0 00 __ LDY #$00
.l15:
17ba : b1 1b __ LDA (ACCU + 0),y 
17bc : 38 __ __ SEC
17bd : e9 20 __ SBC #$20
17bf : aa __ __ TAX
17c0 : bd a3 54 LDA $54a3,x ; (TinyFont[0] + 96)
17c3 : 4a __ __ LSR
17c4 : 4a __ __ LSR
17c5 : 18 __ __ CLC
17c6 : 69 01 __ ADC #$01
17c8 : aa __ __ TAX
17c9 : 65 57 __ ADC T5 + 0 
17cb : 85 57 __ STA T5 + 0 
17cd : 90 02 __ BCC $17d1 ; (bm_put_chars.s60 + 0)
.s59:
17cf : e6 58 __ INC T5 + 1 
.s60:
17d1 : c8 __ __ INY
17d2 : c4 60 __ CPY T10 + 0 
17d4 : b0 1f __ BCS $17f5 ; (bm_put_chars.s54 + 0)
.s16:
17d6 : 8a __ __ TXA
17d7 : 65 43 __ ADC T0 + 0 ; (x + 1)
17d9 : 85 43 __ STA T0 + 0 ; (x + 1)
17db : a5 44 __ LDA T0 + 1 ; (y + 0)
17dd : 69 00 __ ADC #$00
17df : 85 44 __ STA T0 + 1 ; (y + 0)
17e1 : c5 46 __ CMP T1 + 1 ; (str + 0)
17e3 : d0 07 __ BNE $17ec ; (bm_put_chars.s20 + 0)
.s17:
17e5 : a5 43 __ LDA T0 + 0 ; (x + 1)
17e7 : c5 45 __ CMP T1 + 0 ; (y + 1)
17e9 : 4c f3 17 JMP $17f3 ; (bm_put_chars.s18 + 0)
.s20:
17ec : 45 46 __ EOR T1 + 1 ; (str + 0)
17ee : 10 03 __ BPL $17f3 ; (bm_put_chars.s18 + 0)
17f0 : 4c a9 18 JMP $18a9 ; (bm_put_chars.s19 + 0)
.s18:
17f3 : 90 c5 __ BCC $17ba ; (bm_put_chars.l15 + 0)
.s54:
17f5 : 84 5f __ STY T9 + 0 
.s9:
17f7 : a5 5f __ LDA T9 + 0 
17f9 : 85 12 __ STA P5 
17fb : ad e8 c7 LDA $c7e8 ; (sstack + 42)
17fe : 85 54 __ STA T3 + 1 
1800 : a9 6e __ LDA #$6e
1802 : 85 0d __ STA P0 
1804 : a9 56 __ LDA #$56
1806 : 85 0e __ STA P1 
1808 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
180b : 85 53 __ STA T3 + 0 
180d : 29 07 __ AND #$07
180f : 85 55 __ STA T4 + 0 
1811 : 85 0f __ STA P2 
1813 : ad eb c7 LDA $c7eb ; (sstack + 45)
1816 : 85 5d __ STA T8 + 0 
1818 : 85 10 __ STA P3 
181a : ad ec c7 LDA $c7ec ; (sstack + 46)
181d : 85 5e __ STA T8 + 1 
181f : 85 11 __ STA P4 
1821 : 20 b1 18 JSR $18b1 ; (bmu_text.s4 + 0)
1824 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
1827 : 8d ce c7 STA $c7ce ; (sstack + 16)
182a : ad e4 c7 LDA $c7e4 ; (sstack + 38)
182d : 8d cf c7 STA $c7cf ; (sstack + 17)
1830 : a5 5b __ LDA T7 + 0 
1832 : 8d d0 c7 STA $c7d0 ; (sstack + 18)
1835 : a5 5c __ LDA T7 + 1 
1837 : 8d d1 c7 STA $c7d1 ; (sstack + 19)
183a : a5 53 __ LDA T3 + 0 
183c : 8d d2 c7 STA $c7d2 ; (sstack + 20)
183f : a5 54 __ LDA T3 + 1 
1841 : 8d d3 c7 STA $c7d3 ; (sstack + 21)
1844 : a5 59 __ LDA T6 + 0 
1846 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
1849 : a5 5a __ LDA T6 + 1 
184b : 8d d5 c7 STA $c7d5 ; (sstack + 23)
184e : a9 6e __ LDA #$6e
1850 : 8d d6 c7 STA $c7d6 ; (sstack + 24)
1853 : a9 56 __ LDA #$56
1855 : 8d d7 c7 STA $c7d7 ; (sstack + 25)
1858 : a5 55 __ LDA T4 + 0 
185a : 8d d8 c7 STA $c7d8 ; (sstack + 26)
185d : a9 00 __ LDA #$00
185f : 8d d9 c7 STA $c7d9 ; (sstack + 27)
1862 : 8d da c7 STA $c7da ; (sstack + 28)
1865 : 8d db c7 STA $c7db ; (sstack + 29)
1868 : 8d df c7 STA $c7df ; (sstack + 33)
186b : 8d e0 c7 STA $c7e0 ; (sstack + 34)
186e : 8d e1 c7 STA $c7e1 ; (sstack + 35)
1871 : a5 1b __ LDA ACCU + 0 
1873 : 8d dc c7 STA $c7dc ; (sstack + 30)
1876 : a5 1c __ LDA ACCU + 1 
1878 : 8d dd c7 STA $c7dd ; (sstack + 31)
187b : a9 08 __ LDA #$08
187d : 8d de c7 STA $c7de ; (sstack + 32)
1880 : ad ee c7 LDA $c7ee ; (sstack + 48)
1883 : 8d e2 c7 STA $c7e2 ; (sstack + 36)
1886 : 20 58 1a JSR $1a58 ; (bm_bitblit.s4 + 0)
.l10:
1889 : a4 5f __ LDY T9 + 0 
188b : c4 60 __ CPY T10 + 0 
188d : 90 03 __ BCC $1892 ; (bm_put_chars.s12 + 0)
188f : 4c e0 16 JMP $16e0 ; (bm_put_chars.s11 + 0)
.s12:
1892 : e6 5f __ INC T9 + 0 
1894 : b1 5d __ LDA (T8 + 0),y 
1896 : e9 1f __ SBC #$1f
1898 : aa __ __ TAX
1899 : bd a3 54 LDA $54a3,x ; (TinyFont[0] + 96)
189c : 4a __ __ LSR
189d : 4a __ __ LSR
189e : 38 __ __ SEC
189f : 65 57 __ ADC T5 + 0 
18a1 : 85 57 __ STA T5 + 0 
18a3 : 90 e4 __ BCC $1889 ; (bm_put_chars.l10 + 0)
.s61:
18a5 : e6 58 __ INC T5 + 1 
18a7 : b0 e0 __ BCS $1889 ; (bm_put_chars.l10 + 0)
.s19:
18a9 : b0 03 __ BCS $18ae ; (bm_put_chars.s19 + 5)
18ab : 4c f5 17 JMP $17f5 ; (bm_put_chars.s54 + 0)
18ae : 4c ba 17 JMP $17ba ; (bm_put_chars.l15 + 0)
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
18b1 : a9 00 __ LDA #$00
18b3 : 8d db 56 STA $56db ; (tworks[0] + 0)
18b6 : 8d dc 56 STA $56dc ; (tworks[0] + 1)
18b9 : 8d dd 56 STA $56dd ; (tworks[0] + 2)
18bc : 8d de 56 STA $56de ; (tworks[0] + 3)
18bf : 8d df 56 STA $56df ; (tworks[0] + 4)
18c2 : 8d e0 56 STA $56e0 ; (tworks[0] + 5)
18c5 : 8d e1 56 STA $56e1 ; (tworks[0] + 6)
18c8 : 8d e2 56 STA $56e2 ; (tworks[0] + 7)
18cb : 85 43 __ STA T0 + 0 
18cd : 85 44 __ STA T0 + 1 
18cf : a8 __ __ TAY
18d0 : b1 0d __ LDA (P0),y ; (bm + 0)
18d2 : 85 45 __ STA T1 + 0 
18d4 : c8 __ __ INY
18d5 : b1 0d __ LDA (P0),y ; (bm + 0)
18d7 : 85 46 __ STA T1 + 1 
18d9 : a5 12 __ LDA P5 ; (len + 0)
18db : d0 03 __ BNE $18e0 ; (bmu_text.s8 + 0)
18dd : 4c f6 19 JMP $19f6 ; (bmu_text.s5 + 0)
.s8:
18e0 : a9 00 __ LDA #$00
18e2 : 85 4c __ STA T7 + 0 
18e4 : 85 47 __ STA T2 + 0 
.l9:
18e6 : a4 47 __ LDY T2 + 0 
18e8 : b1 10 __ LDA (P3),y ; (str + 0)
18ea : 38 __ __ SEC
18eb : e9 20 __ SBC #$20
18ed : aa __ __ TAX
18ee : 18 __ __ CLC
18ef : a9 03 __ LDA #$03
18f1 : 7d 43 54 ADC $5443,x ; (TinyFont[0] + 0)
18f4 : 85 4a __ STA T6 + 0 
18f6 : bd a3 54 LDA $54a3,x ; (TinyFont[0] + 96)
18f9 : 29 03 __ AND #$03
18fb : 69 55 __ ADC #$55
18fd : 85 4b __ STA T6 + 1 
18ff : bd a3 54 LDA $54a3,x ; (TinyFont[0] + 96)
1902 : 4a __ __ LSR
1903 : 4a __ __ LSR
1904 : 85 48 __ STA T4 + 0 
1906 : 38 __ __ SEC
1907 : 65 43 __ ADC T0 + 0 
1909 : 85 43 __ STA T0 + 0 
190b : 90 02 __ BCC $190f ; (bmu_text.s18 + 0)
.s17:
190d : e6 44 __ INC T0 + 1 
.s18:
190f : a9 00 __ LDA #$00
1911 : 85 4d __ STA T8 + 0 
1913 : a5 48 __ LDA T4 + 0 
1915 : f0 75 __ BEQ $198c ; (bmu_text.s10 + 0)
.s16:
1917 : a0 00 __ LDY #$00
.l13:
1919 : b1 4a __ LDA (T6 + 0),y 
191b : 85 49 __ STA T5 + 0 
191d : a5 49 __ LDA T5 + 0 
191f : 0a __ __ ASL
1920 : 2e db 56 ROL $56db ; (tworks[0] + 0)
1923 : 0a __ __ ASL
1924 : 2e dc 56 ROL $56dc ; (tworks[0] + 1)
1927 : 0a __ __ ASL
1928 : 2e dd 56 ROL $56dd ; (tworks[0] + 2)
192b : 0a __ __ ASL
192c : 2e de 56 ROL $56de ; (tworks[0] + 3)
192f : 0a __ __ ASL
1930 : 2e df 56 ROL $56df ; (tworks[0] + 4)
1933 : 0a __ __ ASL
1934 : 2e e0 56 ROL $56e0 ; (tworks[0] + 5)
1937 : 0a __ __ ASL
1938 : 2e e1 56 ROL $56e1 ; (tworks[0] + 6)
193b : 0a __ __ ASL
193c : 2e e2 56 ROL $56e2 ; (tworks[0] + 7)
193f : e6 0f __ INC P2 ; (lx + 0)
1941 : a5 0f __ LDA P2 ; (lx + 0)
1943 : c9 08 __ CMP #$08
1945 : d0 3d __ BNE $1984 ; (bmu_text.s14 + 0)
.s15:
1947 : ad db 56 LDA $56db ; (tworks[0] + 0)
194a : a0 00 __ LDY #$00
194c : 84 0f __ STY P2 ; (lx + 0)
194e : 91 45 __ STA (T1 + 0),y 
1950 : ad dc 56 LDA $56dc ; (tworks[0] + 1)
1953 : c8 __ __ INY
1954 : 91 45 __ STA (T1 + 0),y 
1956 : ad dd 56 LDA $56dd ; (tworks[0] + 2)
1959 : c8 __ __ INY
195a : 91 45 __ STA (T1 + 0),y 
195c : ad de 56 LDA $56de ; (tworks[0] + 3)
195f : c8 __ __ INY
1960 : 91 45 __ STA (T1 + 0),y 
1962 : ad df 56 LDA $56df ; (tworks[0] + 4)
1965 : c8 __ __ INY
1966 : 91 45 __ STA (T1 + 0),y 
1968 : ad e0 56 LDA $56e0 ; (tworks[0] + 5)
196b : c8 __ __ INY
196c : 91 45 __ STA (T1 + 0),y 
196e : ad e1 56 LDA $56e1 ; (tworks[0] + 6)
1971 : c8 __ __ INY
1972 : 91 45 __ STA (T1 + 0),y 
1974 : ad e2 56 LDA $56e2 ; (tworks[0] + 7)
1977 : c8 __ __ INY
1978 : 91 45 __ STA (T1 + 0),y 
197a : a5 45 __ LDA T1 + 0 
197c : 69 07 __ ADC #$07
197e : 85 45 __ STA T1 + 0 
1980 : 90 02 __ BCC $1984 ; (bmu_text.s14 + 0)
.s19:
1982 : e6 46 __ INC T1 + 1 
.s14:
1984 : e6 4d __ INC T8 + 0 
1986 : a4 4d __ LDY T8 + 0 
1988 : c4 48 __ CPY T4 + 0 
198a : 90 8d __ BCC $1919 ; (bmu_text.l13 + 0)
.s10:
198c : 0e db 56 ASL $56db ; (tworks[0] + 0)
198f : 0e dc 56 ASL $56dc ; (tworks[0] + 1)
1992 : 0e dd 56 ASL $56dd ; (tworks[0] + 2)
1995 : 0e de 56 ASL $56de ; (tworks[0] + 3)
1998 : 0e df 56 ASL $56df ; (tworks[0] + 4)
199b : 0e e0 56 ASL $56e0 ; (tworks[0] + 5)
199e : 0e e1 56 ASL $56e1 ; (tworks[0] + 6)
19a1 : 0e e2 56 ASL $56e2 ; (tworks[0] + 7)
19a4 : e6 0f __ INC P2 ; (lx + 0)
19a6 : a5 0f __ LDA P2 ; (lx + 0)
19a8 : c9 08 __ CMP #$08
19aa : d0 3d __ BNE $19e9 ; (bmu_text.s11 + 0)
.s12:
19ac : ad db 56 LDA $56db ; (tworks[0] + 0)
19af : a0 00 __ LDY #$00
19b1 : 84 0f __ STY P2 ; (lx + 0)
19b3 : 91 45 __ STA (T1 + 0),y 
19b5 : ad dc 56 LDA $56dc ; (tworks[0] + 1)
19b8 : c8 __ __ INY
19b9 : 91 45 __ STA (T1 + 0),y 
19bb : ad dd 56 LDA $56dd ; (tworks[0] + 2)
19be : c8 __ __ INY
19bf : 91 45 __ STA (T1 + 0),y 
19c1 : ad de 56 LDA $56de ; (tworks[0] + 3)
19c4 : c8 __ __ INY
19c5 : 91 45 __ STA (T1 + 0),y 
19c7 : ad df 56 LDA $56df ; (tworks[0] + 4)
19ca : c8 __ __ INY
19cb : 91 45 __ STA (T1 + 0),y 
19cd : ad e0 56 LDA $56e0 ; (tworks[0] + 5)
19d0 : c8 __ __ INY
19d1 : 91 45 __ STA (T1 + 0),y 
19d3 : ad e1 56 LDA $56e1 ; (tworks[0] + 6)
19d6 : c8 __ __ INY
19d7 : 91 45 __ STA (T1 + 0),y 
19d9 : ad e2 56 LDA $56e2 ; (tworks[0] + 7)
19dc : c8 __ __ INY
19dd : 91 45 __ STA (T1 + 0),y 
19df : a5 45 __ LDA T1 + 0 
19e1 : 69 07 __ ADC #$07
19e3 : 85 45 __ STA T1 + 0 
19e5 : 90 02 __ BCC $19e9 ; (bmu_text.s11 + 0)
.s20:
19e7 : e6 46 __ INC T1 + 1 
.s11:
19e9 : e6 47 __ INC T2 + 0 
19eb : e6 4c __ INC T7 + 0 
19ed : a5 4c __ LDA T7 + 0 
19ef : c5 12 __ CMP P5 ; (len + 0)
19f1 : b0 03 __ BCS $19f6 ; (bmu_text.s5 + 0)
19f3 : 4c e6 18 JMP $18e6 ; (bmu_text.l9 + 0)
.s5:
19f6 : a5 0f __ LDA P2 ; (lx + 0)
19f8 : 85 47 __ STA T2 + 0 
19fa : c9 08 __ CMP #$08
19fc : b0 20 __ BCS $1a1e ; (bmu_text.s6 + 0)
.l7:
19fe : 0e db 56 ASL $56db ; (tworks[0] + 0)
1a01 : 0e dc 56 ASL $56dc ; (tworks[0] + 1)
1a04 : 0e dd 56 ASL $56dd ; (tworks[0] + 2)
1a07 : 0e de 56 ASL $56de ; (tworks[0] + 3)
1a0a : 0e df 56 ASL $56df ; (tworks[0] + 4)
1a0d : 0e e0 56 ASL $56e0 ; (tworks[0] + 5)
1a10 : 0e e1 56 ASL $56e1 ; (tworks[0] + 6)
1a13 : 0e e2 56 ASL $56e2 ; (tworks[0] + 7)
1a16 : e6 47 __ INC T2 + 0 
1a18 : a5 47 __ LDA T2 + 0 
1a1a : c9 08 __ CMP #$08
1a1c : 90 e0 __ BCC $19fe ; (bmu_text.l7 + 0)
.s6:
1a1e : ad db 56 LDA $56db ; (tworks[0] + 0)
1a21 : a0 00 __ LDY #$00
1a23 : 91 45 __ STA (T1 + 0),y 
1a25 : ad dc 56 LDA $56dc ; (tworks[0] + 1)
1a28 : c8 __ __ INY
1a29 : 91 45 __ STA (T1 + 0),y 
1a2b : ad dd 56 LDA $56dd ; (tworks[0] + 2)
1a2e : c8 __ __ INY
1a2f : 91 45 __ STA (T1 + 0),y 
1a31 : ad de 56 LDA $56de ; (tworks[0] + 3)
1a34 : c8 __ __ INY
1a35 : 91 45 __ STA (T1 + 0),y 
1a37 : ad df 56 LDA $56df ; (tworks[0] + 4)
1a3a : c8 __ __ INY
1a3b : 91 45 __ STA (T1 + 0),y 
1a3d : ad e0 56 LDA $56e0 ; (tworks[0] + 5)
1a40 : c8 __ __ INY
1a41 : 91 45 __ STA (T1 + 0),y 
1a43 : ad e1 56 LDA $56e1 ; (tworks[0] + 6)
1a46 : c8 __ __ INY
1a47 : 91 45 __ STA (T1 + 0),y 
1a49 : ad e2 56 LDA $56e2 ; (tworks[0] + 7)
1a4c : c8 __ __ INY
1a4d : 91 45 __ STA (T1 + 0),y 
1a4f : a5 43 __ LDA T0 + 0 
1a51 : 85 1b __ STA ACCU + 0 
1a53 : a5 44 __ LDA T0 + 1 
1a55 : 85 1c __ STA ACCU + 1 
.s3:
1a57 : 60 __ __ RTS
--------------------------------------------------------------------
bm_bitblit: ; bm_bitblit(const struct Bitmap*,const struct ClipRect*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 135, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1a58 : ad d0 c7 LDA $c7d0 ; (sstack + 18)
1a5b : 85 43 __ STA T0 + 0 
1a5d : ad d1 c7 LDA $c7d1 ; (sstack + 19)
1a60 : 85 44 __ STA T0 + 1 
1a62 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
1a65 : 38 __ __ SEC
1a66 : a0 00 __ LDY #$00
1a68 : f1 43 __ SBC (T0 + 0),y 
1a6a : 85 45 __ STA T1 + 0 
1a6c : ad d3 c7 LDA $c7d3 ; (sstack + 21)
1a6f : c8 __ __ INY
1a70 : f1 43 __ SBC (T0 + 0),y 
1a72 : 10 35 __ BPL $1aa9 ; (bm_bitblit.s5 + 0)
.s16:
1a74 : 85 46 __ STA T1 + 1 
1a76 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
1a79 : 38 __ __ SEC
1a7a : e5 45 __ SBC T1 + 0 
1a7c : 8d d2 c7 STA $c7d2 ; (sstack + 20)
1a7f : ad d3 c7 LDA $c7d3 ; (sstack + 21)
1a82 : e5 46 __ SBC T1 + 1 
1a84 : 8d d3 c7 STA $c7d3 ; (sstack + 21)
1a87 : ad d8 c7 LDA $c7d8 ; (sstack + 26)
1a8a : 38 __ __ SEC
1a8b : e5 45 __ SBC T1 + 0 
1a8d : 8d d8 c7 STA $c7d8 ; (sstack + 26)
1a90 : ad d9 c7 LDA $c7d9 ; (sstack + 27)
1a93 : e5 46 __ SBC T1 + 1 
1a95 : 8d d9 c7 STA $c7d9 ; (sstack + 27)
1a98 : ad dc c7 LDA $c7dc ; (sstack + 30)
1a9b : 18 __ __ CLC
1a9c : 65 45 __ ADC T1 + 0 
1a9e : 8d dc c7 STA $c7dc ; (sstack + 30)
1aa1 : ad dd c7 LDA $c7dd ; (sstack + 31)
1aa4 : 65 46 __ ADC T1 + 1 
1aa6 : 8d dd c7 STA $c7dd ; (sstack + 31)
.s5:
1aa9 : ad d4 c7 LDA $c7d4 ; (sstack + 22)
1aac : 38 __ __ SEC
1aad : a0 02 __ LDY #$02
1aaf : f1 43 __ SBC (T0 + 0),y 
1ab1 : 85 47 __ STA T2 + 0 
1ab3 : ad d5 c7 LDA $c7d5 ; (sstack + 23)
1ab6 : c8 __ __ INY
1ab7 : f1 43 __ SBC (T0 + 0),y 
1ab9 : 10 35 __ BPL $1af0 ; (bm_bitblit.s6 + 0)
.s15:
1abb : 85 48 __ STA T2 + 1 
1abd : ad d4 c7 LDA $c7d4 ; (sstack + 22)
1ac0 : 38 __ __ SEC
1ac1 : e5 47 __ SBC T2 + 0 
1ac3 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
1ac6 : ad d5 c7 LDA $c7d5 ; (sstack + 23)
1ac9 : e5 48 __ SBC T2 + 1 
1acb : 8d d5 c7 STA $c7d5 ; (sstack + 23)
1ace : ad da c7 LDA $c7da ; (sstack + 28)
1ad1 : 38 __ __ SEC
1ad2 : e5 47 __ SBC T2 + 0 
1ad4 : 8d da c7 STA $c7da ; (sstack + 28)
1ad7 : ad db c7 LDA $c7db ; (sstack + 29)
1ada : e5 48 __ SBC T2 + 1 
1adc : 8d db c7 STA $c7db ; (sstack + 29)
1adf : ad de c7 LDA $c7de ; (sstack + 32)
1ae2 : 18 __ __ CLC
1ae3 : 65 47 __ ADC T2 + 0 
1ae5 : 8d de c7 STA $c7de ; (sstack + 32)
1ae8 : ad df c7 LDA $c7df ; (sstack + 33)
1aeb : 65 48 __ ADC T2 + 1 
1aed : 8d df c7 STA $c7df ; (sstack + 33)
.s6:
1af0 : a0 04 __ LDY #$04
1af2 : b1 43 __ LDA (T0 + 0),y 
1af4 : 38 __ __ SEC
1af5 : ed d2 c7 SBC $c7d2 ; (sstack + 20)
1af8 : aa __ __ TAX
1af9 : c8 __ __ INY
1afa : b1 43 __ LDA (T0 + 0),y 
1afc : ed d3 c7 SBC $c7d3 ; (sstack + 21)
1aff : a8 __ __ TAY
1b00 : 8a __ __ TXA
1b01 : 38 __ __ SEC
1b02 : ed dc c7 SBC $c7dc ; (sstack + 30)
1b05 : 85 45 __ STA T1 + 0 
1b07 : 98 __ __ TYA
1b08 : ed dd c7 SBC $c7dd ; (sstack + 31)
1b0b : 10 11 __ BPL $1b1e ; (bm_bitblit.s7 + 0)
.s14:
1b0d : aa __ __ TAX
1b0e : ad dc c7 LDA $c7dc ; (sstack + 30)
1b11 : 18 __ __ CLC
1b12 : 65 45 __ ADC T1 + 0 
1b14 : 8d dc c7 STA $c7dc ; (sstack + 30)
1b17 : 8a __ __ TXA
1b18 : 6d dd c7 ADC $c7dd ; (sstack + 31)
1b1b : 8d dd c7 STA $c7dd ; (sstack + 31)
.s7:
1b1e : a0 07 __ LDY #$07
1b20 : b1 43 __ LDA (T0 + 0),y 
1b22 : 85 1c __ STA ACCU + 1 
1b24 : 38 __ __ SEC
1b25 : 88 __ __ DEY
1b26 : b1 43 __ LDA (T0 + 0),y 
1b28 : 85 1b __ STA ACCU + 0 
1b2a : ed d4 c7 SBC $c7d4 ; (sstack + 22)
1b2d : a8 __ __ TAY
1b2e : a5 1c __ LDA ACCU + 1 
1b30 : ed d5 c7 SBC $c7d5 ; (sstack + 23)
1b33 : aa __ __ TAX
1b34 : 98 __ __ TYA
1b35 : 38 __ __ SEC
1b36 : ed de c7 SBC $c7de ; (sstack + 32)
1b39 : 85 43 __ STA T0 + 0 
1b3b : 8a __ __ TXA
1b3c : ed df c7 SBC $c7df ; (sstack + 33)
1b3f : 10 11 __ BPL $1b52 ; (bm_bitblit.s8 + 0)
.s13:
1b41 : aa __ __ TAX
1b42 : ad de c7 LDA $c7de ; (sstack + 32)
1b45 : 18 __ __ CLC
1b46 : 65 43 __ ADC T0 + 0 
1b48 : 8d de c7 STA $c7de ; (sstack + 32)
1b4b : 8a __ __ TXA
1b4c : 6d df c7 ADC $c7df ; (sstack + 33)
1b4f : 8d df c7 STA $c7df ; (sstack + 33)
.s8:
1b52 : ad dd c7 LDA $c7dd ; (sstack + 31)
1b55 : 30 0f __ BMI $1b66 ; (bm_bitblit.s3 + 0)
.s12:
1b57 : 0d dc c7 ORA $c7dc ; (sstack + 30)
1b5a : f0 0a __ BEQ $1b66 ; (bm_bitblit.s3 + 0)
.s9:
1b5c : ad df c7 LDA $c7df ; (sstack + 33)
1b5f : 30 05 __ BMI $1b66 ; (bm_bitblit.s3 + 0)
.s11:
1b61 : 0d de c7 ORA $c7de ; (sstack + 32)
1b64 : d0 01 __ BNE $1b67 ; (bm_bitblit.s10 + 0)
.s3:
1b66 : 60 __ __ RTS
.s10:
1b67 : ad ce c7 LDA $c7ce ; (sstack + 16)
1b6a : 85 16 __ STA P9 
1b6c : ad cf c7 LDA $c7cf ; (sstack + 17)
1b6f : 85 17 __ STA P10 
1b71 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
1b74 : 85 18 __ STA P11 
1b76 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
1b79 : 8d be c7 STA $c7be ; (sstack + 0)
1b7c : ad d3 c7 LDA $c7d3 ; (sstack + 21)
1b7f : 8d bf c7 STA $c7bf ; (sstack + 1)
1b82 : ad d4 c7 LDA $c7d4 ; (sstack + 22)
1b85 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
1b88 : ad d5 c7 LDA $c7d5 ; (sstack + 23)
1b8b : 8d c1 c7 STA $c7c1 ; (sstack + 3)
1b8e : ad d6 c7 LDA $c7d6 ; (sstack + 24)
1b91 : 8d c2 c7 STA $c7c2 ; (sstack + 4)
1b94 : ad d7 c7 LDA $c7d7 ; (sstack + 25)
1b97 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
1b9a : ad d8 c7 LDA $c7d8 ; (sstack + 26)
1b9d : 8d c4 c7 STA $c7c4 ; (sstack + 6)
1ba0 : ad d9 c7 LDA $c7d9 ; (sstack + 27)
1ba3 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
1ba6 : ad da c7 LDA $c7da ; (sstack + 28)
1ba9 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
1bac : ad db c7 LDA $c7db ; (sstack + 29)
1baf : 8d c7 c7 STA $c7c7 ; (sstack + 9)
1bb2 : ad dc c7 LDA $c7dc ; (sstack + 30)
1bb5 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
1bb8 : ad dd c7 LDA $c7dd ; (sstack + 31)
1bbb : 8d c9 c7 STA $c7c9 ; (sstack + 11)
1bbe : ad de c7 LDA $c7de ; (sstack + 32)
1bc1 : 8d ca c7 STA $c7ca ; (sstack + 12)
1bc4 : ad df c7 LDA $c7df ; (sstack + 33)
1bc7 : 8d cb c7 STA $c7cb ; (sstack + 13)
1bca : ad e0 c7 LDA $c7e0 ; (sstack + 34)
1bcd : 8d cc c7 STA $c7cc ; (sstack + 14)
1bd0 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
1bd3 : 8d cd c7 STA $c7cd ; (sstack + 15)
1bd6 : 4c d9 1b JMP $1bd9 ; (bmu_bitblit.s1 + 0)
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
1bd9 : a5 53 __ LDA T6 + 0 
1bdb : 8d b8 c7 STA $c7b8 ; (bmu_bitblit@stack + 0)
1bde : a5 54 __ LDA T6 + 1 
1be0 : 8d b9 c7 STA $c7b9 ; (bmu_bitblit@stack + 1)
1be3 : a5 55 __ LDA T8 + 0 
1be5 : 8d ba c7 STA $c7ba ; (bmu_bitblit@stack + 2)
.s4:
1be8 : ad be c7 LDA $c7be ; (sstack + 0)
1beb : 85 4e __ STA T2 + 0 
1bed : 18 __ __ CLC
1bee : 6d c8 c7 ADC $c7c8 ; (sstack + 10)
1bf1 : 85 45 __ STA T1 + 0 
1bf3 : 29 07 __ AND #$07
1bf5 : aa __ __ TAX
1bf6 : bd 7e 56 LDA $567e,x ; (rmask[0] + 0)
1bf9 : 85 13 __ STA P6 
1bfb : ad c9 c7 LDA $c7c9 ; (sstack + 11)
1bfe : 6d bf c7 ADC $c7bf ; (sstack + 1)
1c01 : 4a __ __ LSR
1c02 : 66 45 __ ROR T1 + 0 
1c04 : 4a __ __ LSR
1c05 : 66 45 __ ROR T1 + 0 
1c07 : 4a __ __ LSR
1c08 : 66 45 __ ROR T1 + 0 
1c0a : ad bf c7 LDA $c7bf ; (sstack + 1)
1c0d : 4a __ __ LSR
1c0e : 66 4e __ ROR T2 + 0 
1c10 : 4a __ __ LSR
1c11 : 66 4e __ ROR T2 + 0 
1c13 : 4a __ __ LSR
1c14 : 66 4e __ ROR T2 + 0 
1c16 : 38 __ __ SEC
1c17 : a5 45 __ LDA T1 + 0 
1c19 : e5 4e __ SBC T2 + 0 
1c1b : 85 11 __ STA P4 
1c1d : ad be c7 LDA $c7be ; (sstack + 0)
1c20 : 29 07 __ AND #$07
1c22 : 85 4e __ STA T2 + 0 
1c24 : aa __ __ TAX
1c25 : bd 76 56 LDA $5676,x ; (lmask[0] + 0)
1c28 : 85 4c __ STA T10 + 0 
1c2a : 85 12 __ STA P5 
1c2c : ad c2 c7 LDA $c7c2 ; (sstack + 4)
1c2f : 85 49 __ STA T4 + 0 
1c31 : ad c3 c7 LDA $c7c3 ; (sstack + 5)
1c34 : 85 4a __ STA T4 + 1 
1c36 : a5 16 __ LDA P9 ; (dbm + 0)
1c38 : c5 49 __ CMP T4 + 0 
1c3a : d0 78 __ BNE $1cb4 ; (bmu_bitblit.s5 + 0)
.s52:
1c3c : a5 17 __ LDA P10 ; (dbm + 1)
1c3e : c5 4a __ CMP T4 + 1 
1c40 : d0 72 __ BNE $1cb4 ; (bmu_bitblit.s5 + 0)
.s38:
1c42 : ad c7 c7 LDA $c7c7 ; (sstack + 9)
1c45 : cd c1 c7 CMP $c7c1 ; (sstack + 3)
1c48 : d0 0a __ BNE $1c54 ; (bmu_bitblit.s51 + 0)
.s48:
1c4a : ad c6 c7 LDA $c7c6 ; (sstack + 8)
1c4d : cd c0 c7 CMP $c7c0 ; (sstack + 2)
.s49:
1c50 : b0 09 __ BCS $1c5b ; (bmu_bitblit.s39 + 0)
1c52 : 90 30 __ BCC $1c84 ; (bmu_bitblit.s41 + 0)
.s51:
1c54 : 4d c1 c7 EOR $c7c1 ; (sstack + 3)
1c57 : 10 f7 __ BPL $1c50 ; (bmu_bitblit.s49 + 0)
.s50:
1c59 : b0 29 __ BCS $1c84 ; (bmu_bitblit.s41 + 0)
.s39:
1c5b : ad c1 c7 LDA $c7c1 ; (sstack + 3)
1c5e : cd c7 c7 CMP $c7c7 ; (sstack + 9)
1c61 : d0 51 __ BNE $1cb4 ; (bmu_bitblit.s5 + 0)
.s47:
1c63 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
1c66 : cd c6 c7 CMP $c7c6 ; (sstack + 8)
1c69 : d0 49 __ BNE $1cb4 ; (bmu_bitblit.s5 + 0)
.s40:
1c6b : ad c5 c7 LDA $c7c5 ; (sstack + 7)
1c6e : cd bf c7 CMP $c7bf ; (sstack + 1)
1c71 : d0 0a __ BNE $1c7d ; (bmu_bitblit.s46 + 0)
.s43:
1c73 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
1c76 : cd be c7 CMP $c7be ; (sstack + 0)
.s44:
1c79 : 90 09 __ BCC $1c84 ; (bmu_bitblit.s41 + 0)
1c7b : b0 37 __ BCS $1cb4 ; (bmu_bitblit.s5 + 0)
.s46:
1c7d : 4d bf c7 EOR $c7bf ; (sstack + 1)
1c80 : 10 f7 __ BPL $1c79 ; (bmu_bitblit.s44 + 0)
.s45:
1c82 : 90 30 __ BCC $1cb4 ; (bmu_bitblit.s5 + 0)
.s41:
1c84 : a5 18 __ LDA P11 ; (op + 0)
1c86 : 29 08 __ AND #$08
1c88 : f0 2a __ BEQ $1cb4 ; (bmu_bitblit.s5 + 0)
.s42:
1c8a : ad ca c7 LDA $c7ca ; (sstack + 12)
1c8d : 18 __ __ CLC
1c8e : 6d c6 c7 ADC $c7c6 ; (sstack + 8)
1c91 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
1c94 : ad cb c7 LDA $c7cb ; (sstack + 13)
1c97 : 6d c7 c7 ADC $c7c7 ; (sstack + 9)
1c9a : 8d c7 c7 STA $c7c7 ; (sstack + 9)
1c9d : ad ca c7 LDA $c7ca ; (sstack + 12)
1ca0 : 18 __ __ CLC
1ca1 : 6d c0 c7 ADC $c7c0 ; (sstack + 2)
1ca4 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
1ca7 : ad cb c7 LDA $c7cb ; (sstack + 13)
1caa : 6d c1 c7 ADC $c7c1 ; (sstack + 3)
1cad : 8d c1 c7 STA $c7c1 ; (sstack + 3)
1cb0 : a9 01 __ LDA #$01
1cb2 : d0 02 __ BNE $1cb6 ; (bmu_bitblit.s6 + 0)
.s5:
1cb4 : a9 00 __ LDA #$00
.s6:
1cb6 : 85 15 __ STA P8 
1cb8 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
1cbb : 85 1c __ STA ACCU + 1 ; (dy + 1)
1cbd : ad c0 c7 LDA $c7c0 ; (sstack + 2)
1cc0 : 29 f8 __ AND #$f8
1cc2 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1cc4 : a0 04 __ LDY #$04
1cc6 : b1 16 __ LDA (P9),y ; (dbm + 0)
1cc8 : 85 52 __ STA T7 + 0 
1cca : 20 af 4d JSR $4daf ; (mul16by8 + 0)
1ccd : a0 00 __ LDY #$00
1ccf : b1 16 __ LDA (P9),y ; (dbm + 0)
1cd1 : 18 __ __ CLC
1cd2 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1cd4 : 85 02 __ STA $02 
1cd6 : c8 __ __ INY
1cd7 : b1 16 __ LDA (P9),y ; (dbm + 0)
1cd9 : 65 1c __ ADC ACCU + 1 ; (dy + 1)
1cdb : aa __ __ TAX
1cdc : ad be c7 LDA $c7be ; (sstack + 0)
1cdf : 29 f8 __ AND #$f8
1ce1 : 18 __ __ CLC
1ce2 : 65 02 __ ADC $02 
1ce4 : 85 47 __ STA T3 + 0 
1ce6 : 8a __ __ TXA
1ce7 : 6d bf c7 ADC $c7bf ; (sstack + 1)
1cea : aa __ __ TAX
1ceb : ad c0 c7 LDA $c7c0 ; (sstack + 2)
1cee : 29 07 __ AND #$07
1cf0 : 18 __ __ CLC
1cf1 : 65 47 __ ADC T3 + 0 
1cf3 : 85 53 __ STA T6 + 0 
1cf5 : 90 01 __ BCC $1cf8 ; (bmu_bitblit.s54 + 0)
.s53:
1cf7 : e8 __ __ INX
.s54:
1cf8 : 86 54 __ STX T6 + 1 
1cfa : ad c7 c7 LDA $c7c7 ; (sstack + 9)
1cfd : 85 1c __ STA ACCU + 1 ; (dy + 1)
1cff : ad c6 c7 LDA $c7c6 ; (sstack + 8)
1d02 : 29 f8 __ AND #$f8
1d04 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1d06 : a0 04 __ LDY #$04
1d08 : b1 49 __ LDA (T4 + 0),y 
1d0a : 85 55 __ STA T8 + 0 
1d0c : 20 af 4d JSR $4daf ; (mul16by8 + 0)
1d0f : a0 00 __ LDY #$00
1d11 : b1 49 __ LDA (T4 + 0),y 
1d13 : 18 __ __ CLC
1d14 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1d16 : 85 02 __ STA $02 
1d18 : c8 __ __ INY
1d19 : b1 49 __ LDA (T4 + 0),y 
1d1b : 65 1c __ ADC ACCU + 1 ; (dy + 1)
1d1d : aa __ __ TAX
1d1e : ad c4 c7 LDA $c7c4 ; (sstack + 6)
1d21 : 29 f8 __ AND #$f8
1d23 : 18 __ __ CLC
1d24 : 65 02 __ ADC $02 
1d26 : 85 49 __ STA T4 + 0 
1d28 : 8a __ __ TXA
1d29 : 6d c5 c7 ADC $c7c5 ; (sstack + 7)
1d2c : aa __ __ TAX
1d2d : ad c6 c7 LDA $c7c6 ; (sstack + 8)
1d30 : 29 07 __ AND #$07
1d32 : 18 __ __ CLC
1d33 : 65 49 __ ADC T4 + 0 
1d35 : 85 49 __ STA T4 + 0 
1d37 : 90 01 __ BCC $1d3a ; (bmu_bitblit.s56 + 0)
.s55:
1d39 : e8 __ __ INX
.s56:
1d3a : ad c4 c7 LDA $c7c4 ; (sstack + 6)
1d3d : 29 07 __ AND #$07
1d3f : 49 ff __ EOR #$ff
1d41 : 38 __ __ SEC
1d42 : 65 4e __ ADC T2 + 0 
1d44 : 85 43 __ STA T0 + 0 
1d46 : 29 07 __ AND #$07
1d48 : 85 10 __ STA P3 
1d4a : a5 15 __ LDA P8 
1d4c : f0 03 __ BEQ $1d51 ; (bmu_bitblit.s7 + 0)
1d4e : 4c 40 1f JMP $1f40 ; (bmu_bitblit.s36 + 0)
.s7:
1d51 : 86 51 __ STX T5 + 1 
1d53 : a4 49 __ LDY T4 + 0 
1d55 : 84 50 __ STY T5 + 0 
1d57 : a5 43 __ LDA T0 + 0 
1d59 : f0 0d __ BEQ $1d68 ; (bmu_bitblit.s8 + 0)
.s34:
1d5b : 30 0b __ BMI $1d68 ; (bmu_bitblit.s8 + 0)
.s35:
1d5d : 98 __ __ TYA
1d5e : 18 __ __ CLC
1d5f : 69 f8 __ ADC #$f8
1d61 : 85 50 __ STA T5 + 0 
1d63 : 8a __ __ TXA
1d64 : 69 ff __ ADC #$ff
1d66 : 85 51 __ STA T5 + 1 
.s8:
1d68 : a5 18 __ LDA P11 ; (op + 0)
1d6a : 85 14 __ STA P7 
1d6c : 20 8b 1f JSR $1f8b ; (builddop.s4 + 0)
1d6f : 18 __ __ CLC
1d70 : a5 52 __ LDA T7 + 0 
1d72 : 69 ff __ ADC #$ff
1d74 : 2a __ __ ROL
1d75 : 2a __ __ ROL
1d76 : 2a __ __ ROL
1d77 : aa __ __ TAX
1d78 : 29 f8 __ AND #$f8
1d7a : 85 43 __ STA T0 + 0 
1d7c : 8a __ __ TXA
1d7d : 29 07 __ AND #$07
1d7f : 2a __ __ ROL
1d80 : 69 f8 __ ADC #$f8
1d82 : 85 44 __ STA T0 + 1 
1d84 : ad cc c7 LDA $c7cc ; (sstack + 14)
1d87 : 85 45 __ STA T1 + 0 
1d89 : 85 47 __ STA T3 + 0 
1d8b : ad cd c7 LDA $c7cd ; (sstack + 15)
1d8e : 85 46 __ STA T1 + 1 
1d90 : a5 18 __ LDA P11 ; (op + 0)
1d92 : 29 08 __ AND #$08
1d94 : f0 03 __ BEQ $1d99 ; (bmu_bitblit.s9 + 0)
1d96 : 4c 33 1e JMP $1e33 ; (bmu_bitblit.s19 + 0)
.s9:
1d99 : ad ca c7 LDA $c7ca ; (sstack + 12)
1d9c : 85 47 __ STA T3 + 0 
1d9e : a5 18 __ LDA P11 ; (op + 0)
1da0 : 29 20 __ AND #$20
1da2 : d0 4c __ BNE $1df0 ; (bmu_bitblit.s15 + 0)
.s10:
1da4 : a5 47 __ LDA T3 + 0 
1da6 : f0 38 __ BEQ $1de0 ; (bmu_bitblit.s3 + 0)
.s11:
1da8 : a9 00 __ LDA #$00
1daa : 85 4e __ STA T2 + 0 
.l12:
1dac : a5 53 __ LDA T6 + 0 
1dae : 85 03 __ STA WORK + 0 
1db0 : a5 54 __ LDA T6 + 1 
1db2 : 85 04 __ STA WORK + 1 
1db4 : a5 53 __ LDA T6 + 0 
1db6 : 85 05 __ STA WORK + 2 
1db8 : a5 54 __ LDA T6 + 1 
1dba : 85 06 __ STA WORK + 3 
1dbc : a5 4e __ LDA T2 + 0 
1dbe : 85 07 __ STA WORK + 4 
1dc0 : 20 00 59 JSR $5900 ; (BLIT_CODE[0] + 0)
1dc3 : e6 53 __ INC T6 + 0 
1dc5 : d0 02 __ BNE $1dc9 ; (bmu_bitblit.s69 + 0)
.s68:
1dc7 : e6 54 __ INC T6 + 1 
.s69:
1dc9 : a5 53 __ LDA T6 + 0 
1dcb : 29 07 __ AND #$07
1dcd : d0 0d __ BNE $1ddc ; (bmu_bitblit.s13 + 0)
.s14:
1dcf : 18 __ __ CLC
1dd0 : a5 53 __ LDA T6 + 0 
1dd2 : 65 43 __ ADC T0 + 0 
1dd4 : 85 53 __ STA T6 + 0 
1dd6 : a5 54 __ LDA T6 + 1 
1dd8 : 65 44 __ ADC T0 + 1 
1dda : 85 54 __ STA T6 + 1 
.s13:
1ddc : c6 47 __ DEC T3 + 0 
1dde : d0 cc __ BNE $1dac ; (bmu_bitblit.l12 + 0)
.s3:
1de0 : ad b8 c7 LDA $c7b8 ; (bmu_bitblit@stack + 0)
1de3 : 85 53 __ STA T6 + 0 
1de5 : ad b9 c7 LDA $c7b9 ; (bmu_bitblit@stack + 1)
1de8 : 85 54 __ STA T6 + 1 
1dea : ad ba c7 LDA $c7ba ; (bmu_bitblit@stack + 2)
1ded : 85 55 __ STA T8 + 0 
1def : 60 __ __ RTS
.s15:
1df0 : a5 47 __ LDA T3 + 0 
1df2 : f0 ec __ BEQ $1de0 ; (bmu_bitblit.s3 + 0)
.l16:
1df4 : a5 53 __ LDA T6 + 0 
1df6 : 29 07 __ AND #$07
1df8 : a8 __ __ TAY
1df9 : b1 45 __ LDA (T1 + 0),y 
1dfb : 85 4e __ STA T2 + 0 
1dfd : a5 53 __ LDA T6 + 0 
1dff : 85 03 __ STA WORK + 0 
1e01 : a5 54 __ LDA T6 + 1 
1e03 : 85 04 __ STA WORK + 1 
1e05 : a5 53 __ LDA T6 + 0 
1e07 : 85 05 __ STA WORK + 2 
1e09 : a5 54 __ LDA T6 + 1 
1e0b : 85 06 __ STA WORK + 3 
1e0d : a5 4e __ LDA T2 + 0 
1e0f : 85 07 __ STA WORK + 4 
1e11 : 20 00 59 JSR $5900 ; (BLIT_CODE[0] + 0)
1e14 : e6 53 __ INC T6 + 0 
1e16 : d0 02 __ BNE $1e1a ; (bmu_bitblit.s67 + 0)
.s66:
1e18 : e6 54 __ INC T6 + 1 
.s67:
1e1a : a5 53 __ LDA T6 + 0 
1e1c : 29 07 __ AND #$07
1e1e : d0 0d __ BNE $1e2d ; (bmu_bitblit.s17 + 0)
.s18:
1e20 : 18 __ __ CLC
1e21 : a5 53 __ LDA T6 + 0 
1e23 : 65 43 __ ADC T0 + 0 
1e25 : 85 53 __ STA T6 + 0 
1e27 : a5 54 __ LDA T6 + 1 
1e29 : 65 44 __ ADC T0 + 1 
1e2b : 85 54 __ STA T6 + 1 
.s17:
1e2d : c6 47 __ DEC T3 + 0 
1e2f : d0 c3 __ BNE $1df4 ; (bmu_bitblit.l16 + 0)
1e31 : f0 ad __ BEQ $1de0 ; (bmu_bitblit.s3 + 0)
.s19:
1e33 : 18 __ __ CLC
1e34 : a5 55 __ LDA T8 + 0 
1e36 : 69 ff __ ADC #$ff
1e38 : 2a __ __ ROL
1e39 : 2a __ __ ROL
1e3a : 2a __ __ ROL
1e3b : aa __ __ TAX
1e3c : 29 f8 __ AND #$f8
1e3e : 85 4e __ STA T2 + 0 
1e40 : 8a __ __ TXA
1e41 : 29 07 __ AND #$07
1e43 : 2a __ __ ROL
1e44 : 69 f8 __ ADC #$f8
1e46 : 85 4f __ STA T2 + 1 
1e48 : a5 46 __ LDA T1 + 1 
1e4a : 85 48 __ STA T3 + 1 
1e4c : 05 45 __ ORA T1 + 0 
1e4e : d0 08 __ BNE $1e58 ; (bmu_bitblit.s21 + 0)
.s20:
1e50 : a5 50 __ LDA T5 + 0 
1e52 : 85 47 __ STA T3 + 0 
1e54 : a5 51 __ LDA T5 + 1 
1e56 : 85 48 __ STA T3 + 1 
.s21:
1e58 : ad ca c7 LDA $c7ca ; (sstack + 12)
1e5b : 85 45 __ STA T1 + 0 
1e5d : a5 15 __ LDA P8 
1e5f : d0 03 __ BNE $1e64 ; (bmu_bitblit.s28 + 0)
1e61 : 4c e3 1e JMP $1ee3 ; (bmu_bitblit.s22 + 0)
.s28:
1e64 : 38 __ __ SEC
1e65 : a9 00 __ LDA #$00
1e67 : e5 43 __ SBC T0 + 0 
1e69 : 85 43 __ STA T0 + 0 
1e6b : a9 00 __ LDA #$00
1e6d : e5 44 __ SBC T0 + 1 
1e6f : 85 44 __ STA T0 + 1 
1e71 : 38 __ __ SEC
1e72 : a9 00 __ LDA #$00
1e74 : e5 4e __ SBC T2 + 0 
1e76 : 85 4e __ STA T2 + 0 
1e78 : a9 00 __ LDA #$00
1e7a : e5 4f __ SBC T2 + 1 
1e7c : 85 4f __ STA T2 + 1 
1e7e : a5 45 __ LDA T1 + 0 
1e80 : d0 03 __ BNE $1e85 ; (bmu_bitblit.l29 + 0)
1e82 : 4c e0 1d JMP $1de0 ; (bmu_bitblit.s3 + 0)
.l29:
1e85 : a5 50 __ LDA T5 + 0 
1e87 : 29 07 __ AND #$07
1e89 : d0 0d __ BNE $1e98 ; (bmu_bitblit.s30 + 0)
.s33:
1e8b : 18 __ __ CLC
1e8c : a5 50 __ LDA T5 + 0 
1e8e : 65 4e __ ADC T2 + 0 
1e90 : 85 50 __ STA T5 + 0 
1e92 : a5 51 __ LDA T5 + 1 
1e94 : 65 4f __ ADC T2 + 1 
1e96 : 85 51 __ STA T5 + 1 
.s30:
1e98 : a5 53 __ LDA T6 + 0 
1e9a : 29 07 __ AND #$07
1e9c : d0 0d __ BNE $1eab ; (bmu_bitblit.s31 + 0)
.s32:
1e9e : 18 __ __ CLC
1e9f : a5 53 __ LDA T6 + 0 
1ea1 : 65 43 __ ADC T0 + 0 
1ea3 : 85 53 __ STA T6 + 0 
1ea5 : a5 54 __ LDA T6 + 1 
1ea7 : 65 44 __ ADC T0 + 1 
1ea9 : 85 54 __ STA T6 + 1 
.s31:
1eab : 18 __ __ CLC
1eac : a5 53 __ LDA T6 + 0 
1eae : 69 ff __ ADC #$ff
1eb0 : 85 53 __ STA T6 + 0 
1eb2 : 29 07 __ AND #$07
1eb4 : a8 __ __ TAY
1eb5 : b0 02 __ BCS $1eb9 ; (bmu_bitblit.s59 + 0)
.s58:
1eb7 : c6 54 __ DEC T6 + 1 
.s59:
1eb9 : b1 47 __ LDA (T3 + 0),y 
1ebb : 85 49 __ STA T4 + 0 
1ebd : a5 50 __ LDA T5 + 0 
1ebf : d0 02 __ BNE $1ec3 ; (bmu_bitblit.s61 + 0)
.s60:
1ec1 : c6 51 __ DEC T5 + 1 
.s61:
1ec3 : c6 50 __ DEC T5 + 0 
1ec5 : a5 50 __ LDA T5 + 0 
1ec7 : 85 03 __ STA WORK + 0 
1ec9 : a5 51 __ LDA T5 + 1 
1ecb : 85 04 __ STA WORK + 1 
1ecd : a5 53 __ LDA T6 + 0 
1ecf : 85 05 __ STA WORK + 2 
1ed1 : a5 54 __ LDA T6 + 1 
1ed3 : 85 06 __ STA WORK + 3 
1ed5 : a5 49 __ LDA T4 + 0 
1ed7 : 85 07 __ STA WORK + 4 
1ed9 : 20 00 59 JSR $5900 ; (BLIT_CODE[0] + 0)
1edc : c6 45 __ DEC T1 + 0 
1ede : d0 a5 __ BNE $1e85 ; (bmu_bitblit.l29 + 0)
1ee0 : 4c e0 1d JMP $1de0 ; (bmu_bitblit.s3 + 0)
.s22:
1ee3 : a5 45 __ LDA T1 + 0 
1ee5 : f0 f9 __ BEQ $1ee0 ; (bmu_bitblit.s61 + 29)
.l23:
1ee7 : a5 53 __ LDA T6 + 0 
1ee9 : 29 07 __ AND #$07
1eeb : a8 __ __ TAY
1eec : b1 47 __ LDA (T3 + 0),y 
1eee : 85 49 __ STA T4 + 0 
1ef0 : a5 50 __ LDA T5 + 0 
1ef2 : 85 03 __ STA WORK + 0 
1ef4 : a5 51 __ LDA T5 + 1 
1ef6 : 85 04 __ STA WORK + 1 
1ef8 : a5 53 __ LDA T6 + 0 
1efa : 85 05 __ STA WORK + 2 
1efc : a5 54 __ LDA T6 + 1 
1efe : 85 06 __ STA WORK + 3 
1f00 : a5 49 __ LDA T4 + 0 
1f02 : 85 07 __ STA WORK + 4 
1f04 : 20 00 59 JSR $5900 ; (BLIT_CODE[0] + 0)
1f07 : e6 50 __ INC T5 + 0 
1f09 : d0 02 __ BNE $1f0d ; (bmu_bitblit.s63 + 0)
.s62:
1f0b : e6 51 __ INC T5 + 1 
.s63:
1f0d : a5 50 __ LDA T5 + 0 
1f0f : 29 07 __ AND #$07
1f11 : d0 0d __ BNE $1f20 ; (bmu_bitblit.s24 + 0)
.s27:
1f13 : 18 __ __ CLC
1f14 : a5 50 __ LDA T5 + 0 
1f16 : 65 4e __ ADC T2 + 0 
1f18 : 85 50 __ STA T5 + 0 
1f1a : a5 51 __ LDA T5 + 1 
1f1c : 65 4f __ ADC T2 + 1 
1f1e : 85 51 __ STA T5 + 1 
.s24:
1f20 : e6 53 __ INC T6 + 0 
1f22 : d0 02 __ BNE $1f26 ; (bmu_bitblit.s65 + 0)
.s64:
1f24 : e6 54 __ INC T6 + 1 
.s65:
1f26 : a5 53 __ LDA T6 + 0 
1f28 : 29 07 __ AND #$07
1f2a : d0 0d __ BNE $1f39 ; (bmu_bitblit.s25 + 0)
.s26:
1f2c : 18 __ __ CLC
1f2d : a5 53 __ LDA T6 + 0 
1f2f : 65 43 __ ADC T0 + 0 
1f31 : 85 53 __ STA T6 + 0 
1f33 : a5 54 __ LDA T6 + 1 
1f35 : 65 44 __ ADC T0 + 1 
1f37 : 85 54 __ STA T6 + 1 
.s25:
1f39 : c6 45 __ DEC T1 + 0 
1f3b : d0 aa __ BNE $1ee7 ; (bmu_bitblit.l23 + 0)
1f3d : 4c e0 1d JMP $1de0 ; (bmu_bitblit.s3 + 0)
.s36:
1f40 : 18 __ __ CLC
1f41 : a5 11 __ LDA P4 
1f43 : 69 e1 __ ADC #$e1
1f45 : 2a __ __ ROL
1f46 : 2a __ __ ROL
1f47 : 2a __ __ ROL
1f48 : a8 __ __ TAY
1f49 : 29 f8 __ AND #$f8
1f4b : 85 45 __ STA T1 + 0 
1f4d : 98 __ __ TYA
1f4e : 29 07 __ AND #$07
1f50 : 2a __ __ ROL
1f51 : 69 f8 __ ADC #$f8
1f53 : 85 46 __ STA T1 + 1 
1f55 : 18 __ __ CLC
1f56 : a5 53 __ LDA T6 + 0 
1f58 : 65 45 __ ADC T1 + 0 
1f5a : 85 53 __ STA T6 + 0 
1f5c : a5 54 __ LDA T6 + 1 
1f5e : 65 46 __ ADC T1 + 1 
1f60 : 85 54 __ STA T6 + 1 
1f62 : a5 13 __ LDA P6 
1f64 : 85 12 __ STA P5 
1f66 : a5 4c __ LDA T10 + 0 
1f68 : 85 13 __ STA P6 
1f6a : 18 __ __ CLC
1f6b : a5 49 __ LDA T4 + 0 
1f6d : 65 45 __ ADC T1 + 0 
1f6f : 85 50 __ STA T5 + 0 
1f71 : 8a __ __ TXA
1f72 : 65 46 __ ADC T1 + 1 
1f74 : 85 51 __ STA T5 + 1 
1f76 : 24 43 __ BIT T0 + 0 
1f78 : 30 03 __ BMI $1f7d ; (bmu_bitblit.s37 + 0)
1f7a : 4c 68 1d JMP $1d68 ; (bmu_bitblit.s8 + 0)
.s37:
1f7d : 18 __ __ CLC
1f7e : a5 50 __ LDA T5 + 0 
1f80 : 69 08 __ ADC #$08
1f82 : 85 50 __ STA T5 + 0 
1f84 : 90 f4 __ BCC $1f7a ; (bmu_bitblit.s36 + 58)
.s57:
1f86 : e6 51 __ INC T5 + 1 
1f88 : 4c 68 1d JMP $1d68 ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1f8b : a5 15 __ LDA P8 ; (reverse + 0)
1f8d : f0 16 __ BEQ $1fa5 ; (builddop.s5 + 0)
.s48:
1f8f : a9 38 __ LDA #$38
1f91 : 85 48 __ STA T9 + 0 
1f93 : a9 e1 __ LDA #$e1
1f95 : 85 49 __ STA T10 + 0 
1f97 : a9 b0 __ LDA #$b0
1f99 : 85 4a __ STA T11 + 0 
1f9b : a9 c2 __ LDA #$c2
1f9d : 85 4b __ STA T12 + 0 
1f9f : a9 f8 __ LDA #$f8
1fa1 : 85 44 __ STA T3 + 0 
1fa3 : d0 16 __ BNE $1fbb ; (builddop.s6 + 0)
.s5:
1fa5 : a9 18 __ LDA #$18
1fa7 : 85 48 __ STA T9 + 0 
1fa9 : a9 61 __ LDA #$61
1fab : 85 49 __ STA T10 + 0 
1fad : a9 90 __ LDA #$90
1faf : 85 4a __ STA T11 + 0 
1fb1 : a9 e2 __ LDA #$e2
1fb3 : 85 4b __ STA T12 + 0 
1fb5 : a9 00 __ LDA #$00
1fb7 : 85 44 __ STA T3 + 0 
1fb9 : a9 08 __ LDA #$08
.s6:
1fbb : 85 47 __ STA T6 + 0 
1fbd : a5 14 __ LDA P7 ; (op + 0)
1fbf : 29 08 __ AND #$08
1fc1 : 85 45 __ STA T4 + 0 
1fc3 : a5 14 __ LDA P7 ; (op + 0)
1fc5 : 29 10 __ AND #$10
1fc7 : 85 46 __ STA T5 + 0 
1fc9 : a5 11 __ LDA P4 ; (w + 0)
1fcb : d0 06 __ BNE $1fd3 ; (builddop.s8 + 0)
.s7:
1fcd : a5 13 __ LDA P6 ; (rmask + 0)
1fcf : 25 12 __ AND P5 ; (lmask + 0)
1fd1 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
1fd3 : a9 a0 __ LDA #$a0
1fd5 : 8d 00 59 STA $5900 ; (BLIT_CODE[0] + 0)
1fd8 : a5 44 __ LDA T3 + 0 
1fda : 8d 01 59 STA $5901 ; (BLIT_CODE[0] + 1)
1fdd : a9 02 __ LDA #$02
1fdf : 85 43 __ STA T0 + 0 
1fe1 : a6 12 __ LDX P5 ; (lmask + 0)
1fe3 : e8 __ __ INX
1fe4 : d0 03 __ BNE $1fe9 ; (builddop.s9 + 0)
1fe6 : 4c 1c 22 JMP $221c ; (builddop.s44 + 0)
.s9:
1fe9 : a5 46 __ LDA T5 + 0 
1feb : f0 18 __ BEQ $2005 ; (builddop.s10 + 0)
.s43:
1fed : a9 b1 __ LDA #$b1
1fef : 8d 02 59 STA $5902 ; (BLIT_CODE[0] + 2)
1ff2 : a9 05 __ LDA #$05
1ff4 : 8d 03 59 STA $5903 ; (BLIT_CODE[0] + 3)
1ff7 : a9 85 __ LDA #$85
1ff9 : 8d 04 59 STA $5904 ; (BLIT_CODE[0] + 4)
1ffc : a9 0a __ LDA #$0a
1ffe : 8d 05 59 STA $5905 ; (BLIT_CODE[0] + 5)
2001 : a9 06 __ LDA #$06
2003 : 85 43 __ STA T0 + 0 
.s10:
2005 : a5 45 __ LDA T4 + 0 
2007 : d0 05 __ BNE $200e ; (builddop.s40 + 0)
.s11:
2009 : a5 43 __ LDA T0 + 0 
200b : 4c 6f 20 JMP $206f ; (builddop.s52 + 0)
.s40:
200e : a5 10 __ LDA P3 ; (shift + 0)
2010 : 85 0e __ STA P1 
2012 : d0 05 __ BNE $2019 ; (builddop.s42 + 0)
.s41:
2014 : a5 43 __ LDA T0 + 0 
2016 : 4c 66 20 JMP $2066 ; (builddop.s51 + 0)
.s42:
2019 : a9 b1 __ LDA #$b1
201b : a6 43 __ LDX T0 + 0 
201d : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
2020 : a9 03 __ LDA #$03
2022 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
2025 : 9d 06 59 STA $5906,x ; (BLIT_CODE[0] + 6)
2028 : 9d 0a 59 STA $590a,x ; (BLIT_CODE[0] + 10)
202b : a9 85 __ LDA #$85
202d : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
2030 : 9d 09 59 STA $5909,x ; (BLIT_CODE[0] + 9)
2033 : a9 08 __ LDA #$08
2035 : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
2038 : 9d 08 59 STA $5908,x ; (BLIT_CODE[0] + 8)
203b : a9 a5 __ LDA #$a5
203d : 9d 05 59 STA $5905,x ; (BLIT_CODE[0] + 5)
2040 : a9 02 __ LDA #$02
2042 : 9d 0c 59 STA $590c,x ; (BLIT_CODE[0] + 12)
2045 : a9 04 __ LDA #$04
2047 : 9d 0e 59 STA $590e,x ; (BLIT_CODE[0] + 14)
204a : a5 48 __ LDA T9 + 0 
204c : 9d 04 59 STA $5904,x ; (BLIT_CODE[0] + 4)
204f : a5 49 __ LDA T10 + 0 
2051 : 09 08 __ ORA #$08
2053 : 9d 07 59 STA $5907,x ; (BLIT_CODE[0] + 7)
2056 : a5 4a __ LDA T11 + 0 
2058 : 9d 0b 59 STA $590b,x ; (BLIT_CODE[0] + 11)
205b : a5 4b __ LDA T12 + 0 
205d : 09 04 __ ORA #$04
205f : 9d 0d 59 STA $590d,x ; (BLIT_CODE[0] + 13)
2062 : 8a __ __ TXA
2063 : 18 __ __ CLC
2064 : 69 0f __ ADC #$0f
.s51:
2066 : 85 0d __ STA P0 
2068 : a5 15 __ LDA P8 ; (reverse + 0)
206a : 85 0f __ STA P2 
206c : 20 7d 22 JSR $227d ; (builddop_src.s4 + 0)
.s52:
206f : 85 0d __ STA P0 
2071 : a5 14 __ LDA P7 ; (op + 0)
2073 : 85 0e __ STA P1 
2075 : a5 12 __ LDA P5 ; (lmask + 0)
2077 : 49 ff __ EOR #$ff
2079 : 85 0f __ STA P2 
207b : 20 bd 23 JSR $23bd ; (builddop_op.s4 + 0)
207e : 85 43 __ STA T0 + 0 
2080 : a5 11 __ LDA P4 ; (w + 0)
2082 : f0 68 __ BEQ $20ec ; (builddop.s12 + 0)
.s13:
2084 : a9 a0 __ LDA #$a0
2086 : a6 43 __ LDX T0 + 0 
2088 : e8 __ __ INX
2089 : e8 __ __ INX
208a : 86 43 __ STX T0 + 0 
208c : 86 0d __ STX P0 
208e : 9d fe 58 STA $58fe,x 
2091 : 18 __ __ CLC
2092 : a5 47 __ LDA T6 + 0 
2094 : 65 44 __ ADC T3 + 0 
2096 : 85 44 __ STA T3 + 0 
2098 : 9d ff 58 STA $58ff,x 
.s14:
209b : a5 11 __ LDA P4 ; (w + 0)
209d : c9 02 __ CMP #$02
209f : b0 53 __ BCS $20f4 ; (builddop.s21 + 0)
.s15:
20a1 : a5 13 __ LDA P6 ; (rmask + 0)
20a3 : f0 47 __ BEQ $20ec ; (builddop.s12 + 0)
.s16:
20a5 : a5 46 __ LDA T5 + 0 
20a7 : f0 1e __ BEQ $20c7 ; (builddop.s17 + 0)
.s20:
20a9 : a9 b1 __ LDA #$b1
20ab : a6 43 __ LDX T0 + 0 
20ad : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
20b0 : a9 05 __ LDA #$05
20b2 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
20b5 : a9 85 __ LDA #$85
20b7 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
20ba : a9 0a __ LDA #$0a
20bc : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
20bf : 8a __ __ TXA
20c0 : 18 __ __ CLC
20c1 : 69 04 __ ADC #$04
20c3 : 85 43 __ STA T0 + 0 
20c5 : 85 0d __ STA P0 
.s17:
20c7 : a5 45 __ LDA T4 + 0 
20c9 : d0 05 __ BNE $20d0 ; (builddop.s19 + 0)
.s18:
20cb : a5 43 __ LDA T0 + 0 
20cd : 4c db 20 JMP $20db ; (builddop.s50 + 0)
.s19:
20d0 : a5 10 __ LDA P3 ; (shift + 0)
20d2 : 85 0e __ STA P1 
20d4 : a5 15 __ LDA P8 ; (reverse + 0)
20d6 : 85 0f __ STA P2 
20d8 : 20 7d 22 JSR $227d ; (builddop_src.s4 + 0)
.s50:
20db : 85 0d __ STA P0 
20dd : a5 14 __ LDA P7 ; (op + 0)
20df : 85 0e __ STA P1 
20e1 : a5 13 __ LDA P6 ; (rmask + 0)
20e3 : 49 ff __ EOR #$ff
20e5 : 85 0f __ STA P2 
20e7 : 20 bd 23 JSR $23bd ; (builddop_op.s4 + 0)
20ea : 85 43 __ STA T0 + 0 
.s12:
20ec : a9 60 __ LDA #$60
20ee : a6 43 __ LDX T0 + 0 
20f0 : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
.s3:
20f3 : 60 __ __ RTS
.s21:
20f4 : a9 02 __ LDA #$02
20f6 : c5 11 __ CMP P4 ; (w + 0)
20f8 : a9 00 __ LDA #$00
20fa : 6a __ __ ROR
20fb : 85 4c __ STA T14 + 0 
20fd : d0 19 __ BNE $2118 ; (builddop.s22 + 0)
.s39:
20ff : a9 a2 __ LDA #$a2
2101 : a6 43 __ LDX T0 + 0 
2103 : e8 __ __ INX
2104 : e8 __ __ INX
2105 : 86 43 __ STX T0 + 0 
2107 : 9d fe 58 STA $58fe,x 
210a : 38 __ __ SEC
210b : a5 11 __ LDA P4 ; (w + 0)
210d : e9 01 __ SBC #$01
210f : 9d ff 58 STA $58ff,x 
2112 : a5 11 __ LDA P4 ; (w + 0)
2114 : c9 20 __ CMP #$20
2116 : b0 0d __ BCS $2125 ; (builddop.s24 + 0)
.s22:
2118 : a5 10 __ LDA P3 ; (shift + 0)
211a : d0 09 __ BNE $2125 ; (builddop.s24 + 0)
.s23:
211c : a5 48 __ LDA T9 + 0 
211e : a6 43 __ LDX T0 + 0 
2120 : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
2123 : e6 43 __ INC T0 + 0 
.s24:
2125 : a6 43 __ LDX T0 + 0 
2127 : 86 4d __ STX T15 + 0 
2129 : a5 46 __ LDA T5 + 0 
212b : f0 1a __ BEQ $2147 ; (builddop.s25 + 0)
.s38:
212d : a9 b1 __ LDA #$b1
212f : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
2132 : a9 05 __ LDA #$05
2134 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
2137 : a9 85 __ LDA #$85
2139 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
213c : a9 0a __ LDA #$0a
213e : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
2141 : 8a __ __ TXA
2142 : 18 __ __ CLC
2143 : 69 04 __ ADC #$04
2145 : 85 43 __ STA T0 + 0 
.s25:
2147 : a5 45 __ LDA T4 + 0 
2149 : d0 05 __ BNE $2150 ; (builddop.s37 + 0)
.s26:
214b : a5 43 __ LDA T0 + 0 
214d : 4c 5f 21 JMP $215f ; (builddop.s49 + 0)
.s37:
2150 : a5 43 __ LDA T0 + 0 
2152 : 85 0d __ STA P0 
2154 : a5 10 __ LDA P3 ; (shift + 0)
2156 : 85 0e __ STA P1 
2158 : a5 15 __ LDA P8 ; (reverse + 0)
215a : 85 0f __ STA P2 
215c : 20 7d 22 JSR $227d ; (builddop_src.s4 + 0)
.s49:
215f : 85 0d __ STA P0 
2161 : a5 14 __ LDA P7 ; (op + 0)
2163 : 85 0e __ STA P1 
2165 : a9 00 __ LDA #$00
2167 : 85 0f __ STA P2 
2169 : 20 bd 23 JSR $23bd ; (builddop_op.s4 + 0)
216c : 24 4c __ BIT T14 + 0 
216e : 10 17 __ BPL $2187 ; (builddop.s28 + 0)
.s27:
2170 : aa __ __ TAX
2171 : e8 __ __ INX
2172 : e8 __ __ INX
2173 : 86 43 __ STX T0 + 0 
2175 : 86 0d __ STX P0 
2177 : a9 a0 __ LDA #$a0
2179 : 9d fe 58 STA $58fe,x 
217c : 18 __ __ CLC
217d : a5 47 __ LDA T6 + 0 
217f : 65 44 __ ADC T3 + 0 
2181 : 9d ff 58 STA $58ff,x 
2184 : 4c a1 20 JMP $20a1 ; (builddop.s15 + 0)
.s28:
2187 : a8 __ __ TAY
2188 : a9 1f __ LDA #$1f
218a : c5 11 __ CMP P4 ; (w + 0)
218c : a9 00 __ LDA #$00
218e : 6a __ __ ROR
218f : 85 47 __ STA T6 + 0 
2191 : f0 04 __ BEQ $2197 ; (builddop.s36 + 0)
.s29:
2193 : a5 10 __ LDA P3 ; (shift + 0)
2195 : f0 06 __ BEQ $219d ; (builddop.s30 + 0)
.s36:
2197 : a5 48 __ LDA T9 + 0 
2199 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
219c : c8 __ __ INY
.s30:
219d : a9 98 __ LDA #$98
219f : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
21a2 : a9 08 __ LDA #$08
21a4 : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
21a7 : a9 a8 __ LDA #$a8
21a9 : 99 03 59 STA $5903,y ; (BLIT_CODE[0] + 3)
21ac : a5 49 __ LDA T10 + 0 
21ae : 09 08 __ ORA #$08
21b0 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
21b3 : 98 __ __ TYA
21b4 : 18 __ __ CLC
21b5 : 69 04 __ ADC #$04
21b7 : 85 43 __ STA T0 + 0 
21b9 : 24 47 __ BIT T6 + 0 
21bb : 30 3a __ BMI $21f7 ; (builddop.s31 + 0)
.s32:
21bd : a5 4a __ LDA T11 + 0 
21bf : 99 04 59 STA $5904,y ; (BLIT_CODE[0] + 4)
21c2 : a5 4b __ LDA T12 + 0 
21c4 : 09 04 __ ORA #$04
21c6 : aa __ __ TAX
21c7 : a5 45 __ LDA T4 + 0 
21c9 : d0 0d __ BNE $21d8 ; (builddop.s35 + 0)
.s33:
21cb : a9 02 __ LDA #$02
21cd : 99 05 59 STA $5905,y ; (BLIT_CODE[0] + 5)
21d0 : 18 __ __ CLC
21d1 : a5 43 __ LDA T0 + 0 
21d3 : 69 02 __ ADC #$02
21d5 : 4c e9 21 JMP $21e9 ; (builddop.s34 + 0)
.s35:
21d8 : a9 04 __ LDA #$04
21da : 99 05 59 STA $5905,y ; (BLIT_CODE[0] + 5)
21dd : 99 07 59 STA $5907,y ; (BLIT_CODE[0] + 7)
21e0 : 8a __ __ TXA
21e1 : 99 06 59 STA $5906,y ; (BLIT_CODE[0] + 6)
21e4 : 18 __ __ CLC
21e5 : a5 43 __ LDA T0 + 0 
21e7 : 69 04 __ ADC #$04
.s34:
21e9 : a8 __ __ TAY
21ea : c8 __ __ INY
21eb : c8 __ __ INY
21ec : 84 43 __ STY T0 + 0 
21ee : 8a __ __ TXA
21ef : 99 fe 58 STA $58fe,y 
21f2 : a9 06 __ LDA #$06
21f4 : 99 ff 58 STA $58ff,y 
.s31:
21f7 : a9 ca __ LDA #$ca
21f9 : a4 43 __ LDY T0 + 0 
21fb : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
21fe : a9 d0 __ LDA #$d0
2200 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
2203 : 98 __ __ TYA
2204 : 18 __ __ CLC
2205 : 69 01 __ ADC #$01
2207 : aa __ __ TAX
2208 : e8 __ __ INX
2209 : e8 __ __ INX
220a : 86 43 __ STX T0 + 0 
220c : 86 0d __ STX P0 
220e : 49 ff __ EOR #$ff
2210 : 38 __ __ SEC
2211 : 65 4d __ ADC T15 + 0 
2213 : 38 __ __ SEC
2214 : e9 02 __ SBC #$02
2216 : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
2219 : 4c a1 20 JMP $20a1 ; (builddop.s15 + 0)
.s44:
221c : 85 0d __ STA P0 
221e : a5 45 __ LDA T4 + 0 
2220 : f0 51 __ BEQ $2273 ; (builddop.s45 + 0)
.s46:
2222 : a5 10 __ LDA P3 ; (shift + 0)
2224 : f0 4d __ BEQ $2273 ; (builddop.s45 + 0)
.s47:
2226 : a9 03 __ LDA #$03
2228 : 8d 03 59 STA $5903 ; (BLIT_CODE[0] + 3)
222b : 8d 08 59 STA $5908 ; (BLIT_CODE[0] + 8)
222e : 8d 0c 59 STA $590c ; (BLIT_CODE[0] + 12)
2231 : a9 b1 __ LDA #$b1
2233 : 8d 02 59 STA $5902 ; (BLIT_CODE[0] + 2)
2236 : a9 85 __ LDA #$85
2238 : 8d 04 59 STA $5904 ; (BLIT_CODE[0] + 4)
223b : 8d 0b 59 STA $590b ; (BLIT_CODE[0] + 11)
223e : a9 08 __ LDA #$08
2240 : 8d 05 59 STA $5905 ; (BLIT_CODE[0] + 5)
2243 : 8d 0a 59 STA $590a ; (BLIT_CODE[0] + 10)
2246 : a9 a5 __ LDA #$a5
2248 : 8d 07 59 STA $5907 ; (BLIT_CODE[0] + 7)
224b : a9 02 __ LDA #$02
224d : 8d 0e 59 STA $590e ; (BLIT_CODE[0] + 14)
2250 : a9 04 __ LDA #$04
2252 : 8d 10 59 STA $5910 ; (BLIT_CODE[0] + 16)
2255 : a5 48 __ LDA T9 + 0 
2257 : 8d 06 59 STA $5906 ; (BLIT_CODE[0] + 6)
225a : a5 49 __ LDA T10 + 0 
225c : 09 08 __ ORA #$08
225e : 8d 09 59 STA $5909 ; (BLIT_CODE[0] + 9)
2261 : a5 4a __ LDA T11 + 0 
2263 : 8d 0d 59 STA $590d ; (BLIT_CODE[0] + 13)
2266 : a5 4b __ LDA T12 + 0 
2268 : 09 04 __ ORA #$04
226a : 8d 0f 59 STA $590f ; (BLIT_CODE[0] + 15)
226d : a9 11 __ LDA #$11
226f : 85 43 __ STA T0 + 0 
2271 : 85 0d __ STA P0 
.s45:
2273 : e6 11 __ INC P4 ; (w + 0)
2275 : d0 03 __ BNE $227a ; (builddop.s45 + 7)
2277 : 4c ec 20 JMP $20ec ; (builddop.s12 + 0)
227a : 4c 9b 20 JMP $209b ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
227d : a6 0d __ LDX P0 ; (ip + 0)
227f : e8 __ __ INX
2280 : a4 0d __ LDY P0 ; (ip + 0)
2282 : e8 __ __ INX
2283 : a5 0e __ LDA P1 ; (shift + 0)
2285 : d0 0c __ BNE $2293 ; (builddop_src.s6 + 0)
.s5:
2287 : a9 b1 __ LDA #$b1
2289 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
228c : a9 03 __ LDA #$03
228e : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
2291 : 8a __ __ TXA
.s3:
2292 : 60 __ __ RTS
.s6:
2293 : a9 a5 __ LDA #$a5
2295 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2298 : a9 08 __ LDA #$08
229a : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
229d : a5 0f __ LDA P2 ; (reverse + 0)
229f : f0 03 __ BEQ $22a4 ; (builddop_src.s7 + 0)
22a1 : 4c af 23 JMP $23af ; (builddop_src.s26 + 0)
.s7:
22a4 : a5 0e __ LDA P1 ; (shift + 0)
22a6 : c9 05 __ CMP #$05
22a8 : b0 06 __ BCS $22b0 ; (builddop_src.s8 + 0)
.s24:
22aa : a9 4a __ LDA #$4a
.s25:
22ac : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
22af : e8 __ __ INX
.s8:
22b0 : a9 85 __ LDA #$85
22b2 : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
22b5 : 9d 04 59 STA $5904,x ; (BLIT_CODE[0] + 4)
22b8 : a9 09 __ LDA #$09
22ba : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
22bd : a9 b1 __ LDA #$b1
22bf : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
22c2 : a9 03 __ LDA #$03
22c4 : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
22c7 : a9 08 __ LDA #$08
22c9 : 9d 05 59 STA $5905,x ; (BLIT_CODE[0] + 5)
22cc : 8a __ __ TXA
22cd : 18 __ __ CLC
22ce : 69 06 __ ADC #$06
22d0 : 85 1b __ STA ACCU + 0 
22d2 : a8 __ __ TAY
22d3 : a5 0f __ LDA P2 ; (reverse + 0)
22d5 : d0 72 __ BNE $2349 ; (builddop_src.s17 + 0)
.s9:
22d7 : a5 0e __ LDA P1 ; (shift + 0)
22d9 : c9 05 __ CMP #$05
22db : 90 0b __ BCC $22e8 ; (builddop_src.s10 + 0)
.s13:
22dd : a9 0a __ LDA #$0a
22df : 9d 06 59 STA $5906,x ; (BLIT_CODE[0] + 6)
22e2 : e6 1b __ INC ACCU + 0 
22e4 : a6 0e __ LDX P1 ; (shift + 0)
22e6 : b0 25 __ BCS $230d ; (builddop_src.l14 + 0)
.s10:
22e8 : c9 02 __ CMP #$02
22ea : 90 19 __ BCC $2305 ; (builddop_src.s11 + 0)
.s12:
22ec : c6 0e __ DEC P1 ; (shift + 0)
22ee : a6 0e __ LDX P1 ; (shift + 0)
.l29:
22f0 : a9 6a __ LDA #$6a
22f2 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
22f5 : a9 46 __ LDA #$46
22f7 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
22fa : a9 09 __ LDA #$09
22fc : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
22ff : c8 __ __ INY
2300 : c8 __ __ INY
2301 : c8 __ __ INY
2302 : ca __ __ DEX
2303 : d0 eb __ BNE $22f0 ; (builddop_src.l29 + 0)
.s11:
2305 : a9 6a __ LDA #$6a
.s30:
2307 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
230a : c8 __ __ INY
230b : 98 __ __ TYA
230c : 60 __ __ RTS
.l14:
230d : a5 1b __ LDA ACCU + 0 
230f : 85 1d __ STA ACCU + 2 
2311 : 85 1c __ STA ACCU + 1 
2313 : a8 __ __ TAY
2314 : 18 __ __ CLC
2315 : 69 03 __ ADC #$03
2317 : 85 1b __ STA ACCU + 0 
2319 : e0 07 __ CPX #$07
231b : b0 16 __ BCS $2333 ; (builddop_src.s15 + 0)
.s16:
231d : a9 26 __ LDA #$26
231f : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2322 : a9 09 __ LDA #$09
2324 : a4 1d __ LDY ACCU + 2 
2326 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
2329 : a9 0a __ LDA #$0a
232b : a4 1c __ LDY ACCU + 1 
232d : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
2330 : e8 __ __ INX
2331 : 90 da __ BCC $230d ; (builddop_src.l14 + 0)
.s15:
2333 : a9 a5 __ LDA #$a5
2335 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2338 : a9 09 __ LDA #$09
233a : a6 1d __ LDX ACCU + 2 
233c : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
233f : a9 2a __ LDA #$2a
2341 : a6 1c __ LDX ACCU + 1 
2343 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
2346 : a5 1b __ LDA ACCU + 0 
2348 : 60 __ __ RTS
.s17:
2349 : a5 0e __ LDA P1 ; (shift + 0)
234b : c9 05 __ CMP #$05
234d : b0 3e __ BCS $238d ; (builddop_src.s21 + 0)
.s18:
234f : a9 4a __ LDA #$4a
2351 : 9d 06 59 STA $5906,x ; (BLIT_CODE[0] + 6)
2354 : e6 1b __ INC ACCU + 0 
2356 : a6 0e __ LDX P1 ; (shift + 0)
2358 : e0 02 __ CPX #$02
235a : 90 1b __ BCC $2377 ; (builddop_src.s19 + 0)
.s20:
235c : a4 1b __ LDY ACCU + 0 
.l28:
235e : a9 66 __ LDA #$66
2360 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2363 : a9 09 __ LDA #$09
2365 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
2368 : a9 4a __ LDA #$4a
236a : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
236d : 98 __ __ TYA
236e : 18 __ __ CLC
236f : 69 03 __ ADC #$03
2371 : a8 __ __ TAY
2372 : ca __ __ DEX
2373 : d0 e9 __ BNE $235e ; (builddop_src.l28 + 0)
.s31:
2375 : 85 1b __ STA ACCU + 0 
.s19:
2377 : a9 a5 __ LDA #$a5
2379 : a6 1b __ LDX ACCU + 0 
237b : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
237e : a9 09 __ LDA #$09
2380 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
2383 : a9 6a __ LDA #$6a
2385 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
2388 : 8a __ __ TXA
2389 : 18 __ __ CLC
238a : 69 03 __ ADC #$03
238c : 60 __ __ RTS
.s21:
238d : c9 07 __ CMP #$07
238f : b0 19 __ BCS $23aa ; (builddop_src.s22 + 0)
.s23:
2391 : aa __ __ TAX
.l32:
2392 : a9 2a __ LDA #$2a
2394 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2397 : a9 06 __ LDA #$06
2399 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
239c : a9 09 __ LDA #$09
239e : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
23a1 : 98 __ __ TYA
23a2 : 69 03 __ ADC #$03
23a4 : e8 __ __ INX
23a5 : e0 07 __ CPX #$07
23a7 : a8 __ __ TAY
23a8 : 90 e8 __ BCC $2392 ; (builddop_src.l32 + 0)
.s22:
23aa : a9 2a __ LDA #$2a
23ac : 4c 07 23 JMP $2307 ; (builddop_src.s30 + 0)
.s26:
23af : a5 0e __ LDA P1 ; (shift + 0)
23b1 : c9 05 __ CMP #$05
23b3 : b0 03 __ BCS $23b8 ; (builddop_src.s27 + 0)
23b5 : 4c b0 22 JMP $22b0 ; (builddop_src.s8 + 0)
.s27:
23b8 : a9 0a __ LDA #$0a
23ba : 4c ac 22 JMP $22ac ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
23bd : a5 0e __ LDA P1 ; (op + 0)
23bf : 29 20 __ AND #$20
23c1 : f0 04 __ BEQ $23c7 ; (builddop_op.s27 + 0)
.s28:
23c3 : a9 07 __ LDA #$07
23c5 : d0 02 __ BNE $23c9 ; (builddop_op.s29 + 0)
.s27:
23c7 : a9 0a __ LDA #$0a
.s29:
23c9 : 85 1c __ STA ACCU + 1 
23cb : a5 0e __ LDA P1 ; (op + 0)
23cd : 29 03 __ AND #$03
23cf : 85 1b __ STA ACCU + 0 
23d1 : a5 0e __ LDA P1 ; (op + 0)
23d3 : 29 04 __ AND #$04
23d5 : f0 03 __ BEQ $23da ; (builddop_op.s5 + 0)
23d7 : 4c 6d 24 JMP $246d ; (builddop_op.s18 + 0)
.s5:
23da : a5 0e __ LDA P1 ; (op + 0)
23dc : 29 08 __ AND #$08
23de : d0 13 __ BNE $23f3 ; (builddop_op.s15 + 0)
.s6:
23e0 : a9 a5 __ LDA #$a5
23e2 : a4 0d __ LDY P0 ; (ip + 0)
23e4 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
23e7 : a5 1c __ LDA ACCU + 1 
.s7:
23e9 : c8 __ __ INY
23ea : c8 __ __ INY
23eb : 84 0d __ STY P0 ; (ip + 0)
23ed : 99 ff 58 STA $58ff,y 
23f0 : 4c 03 24 JMP $2403 ; (builddop_op.s16 + 0)
.s15:
23f3 : a5 0e __ LDA P1 ; (op + 0)
23f5 : 0a __ __ ASL
23f6 : 10 0b __ BPL $2403 ; (builddop_op.s16 + 0)
.s17:
23f8 : a9 49 __ LDA #$49
23fa : a4 0d __ LDY P0 ; (ip + 0)
23fc : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
23ff : a9 ff __ LDA #$ff
2401 : d0 e6 __ BNE $23e9 ; (builddop_op.s7 + 0)
.s16:
2403 : a6 1b __ LDX ACCU + 0 
2405 : f0 13 __ BEQ $241a ; (builddop_op.s8 + 0)
.s14:
2407 : a5 1c __ LDA ACCU + 1 
2409 : a4 0d __ LDY P0 ; (ip + 0)
240b : c8 __ __ INY
240c : c8 __ __ INY
240d : 84 0d __ STY P0 ; (ip + 0)
240f : 99 ff 58 STA $58ff,y 
2412 : bd 86 56 LDA $5686,x ; (blitops_op[0] + 0)
2415 : 09 04 __ ORA #$04
2417 : 99 fe 58 STA $58fe,y 
.s8:
241a : a5 0f __ LDA P2 ; (mask + 0)
241c : f0 3f __ BEQ $245d ; (builddop_op.s9 + 0)
.s10:
241e : a9 85 __ LDA #$85
2420 : a4 0d __ LDY P0 ; (ip + 0)
2422 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2425 : a9 09 __ LDA #$09
2427 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
242a : 98 __ __ TYA
242b : 18 __ __ CLC
242c : 69 08 __ ADC #$08
242e : 85 0d __ STA P0 ; (ip + 0)
2430 : a5 0e __ LDA P1 ; (op + 0)
2432 : 29 10 __ AND #$10
2434 : f0 09 __ BEQ $243f ; (builddop_op.s11 + 0)
.s13:
2436 : a9 45 __ LDA #$45
2438 : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
243b : a9 0a __ LDA #$0a
243d : d0 07 __ BNE $2446 ; (builddop_op.s12 + 0)
.s11:
243f : a9 51 __ LDA #$51
2441 : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
2444 : a9 05 __ LDA #$05
.s12:
2446 : 99 03 59 STA $5903,y ; (BLIT_CODE[0] + 3)
2449 : a9 29 __ LDA #$29
244b : 99 04 59 STA $5904,y ; (BLIT_CODE[0] + 4)
244e : a5 0f __ LDA P2 ; (mask + 0)
2450 : 99 05 59 STA $5905,y ; (BLIT_CODE[0] + 5)
2453 : a9 45 __ LDA #$45
2455 : 99 06 59 STA $5906,y ; (BLIT_CODE[0] + 6)
2458 : a9 09 __ LDA #$09
245a : 99 07 59 STA $5907,y ; (BLIT_CODE[0] + 7)
.s9:
245d : a9 91 __ LDA #$91
245f : a6 0d __ LDX P0 ; (ip + 0)
2461 : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
2464 : a9 05 __ LDA #$05
2466 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
2469 : e8 __ __ INX
246a : e8 __ __ INX
246b : 8a __ __ TXA
.s3:
246c : 60 __ __ RTS
.s18:
246d : a5 1b __ LDA ACCU + 0 
246f : d0 04 __ BNE $2475 ; (builddop_op.s20 + 0)
.s19:
2471 : a5 0f __ LDA P2 ; (mask + 0)
2473 : d0 14 __ BNE $2489 ; (builddop_op.s23 + 0)
.s20:
2475 : a5 0e __ LDA P1 ; (op + 0)
2477 : 29 40 __ AND #$40
2479 : f0 02 __ BEQ $247d ; (builddop_op.s21 + 0)
.s22:
247b : a9 ff __ LDA #$ff
.s21:
247d : aa __ __ TAX
247e : a9 a9 __ LDA #$a9
2480 : a4 0d __ LDY P0 ; (ip + 0)
2482 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2485 : 8a __ __ TXA
2486 : 4c e9 23 JMP $23e9 ; (builddop_op.s7 + 0)
.s23:
2489 : a9 b1 __ LDA #$b1
248b : a4 0d __ LDY P0 ; (ip + 0)
248d : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
2490 : a9 05 __ LDA #$05
2492 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
2495 : 06 0e __ ASL P1 ; (op + 0)
2497 : 30 0a __ BMI $24a3 ; (builddop_op.s26 + 0)
.s24:
2499 : a9 29 __ LDA #$29
249b : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
249e : a5 0f __ LDA P2 ; (mask + 0)
24a0 : 4c ac 24 JMP $24ac ; (builddop_op.s25 + 0)
.s26:
24a3 : a9 09 __ LDA #$09
24a5 : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
24a8 : a5 0f __ LDA P2 ; (mask + 0)
24aa : 49 ff __ EOR #$ff
.s25:
24ac : 99 03 59 STA $5903,y ; (BLIT_CODE[0] + 3)
24af : a9 91 __ LDA #$91
24b1 : 99 04 59 STA $5904,y ; (BLIT_CODE[0] + 4)
24b4 : a9 05 __ LDA #$05
24b6 : 99 05 59 STA $5905,y ; (BLIT_CODE[0] + 5)
24b9 : 98 __ __ TYA
24ba : 18 __ __ CLC
24bb : 69 06 __ ADC #$06
24bd : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
24be : a9 00 __ LDA #$00
24c0 : 85 1b __ STA ACCU + 0 
24c2 : 85 1c __ STA ACCU + 1 
24c4 : a8 __ __ TAY
24c5 : b1 0d __ LDA (P0),y ; (str + 0)
24c7 : f0 10 __ BEQ $24d9 ; (strlen.s3 + 0)
.s6:
24c9 : a2 00 __ LDX #$00
.l7:
24cb : c8 __ __ INY
24cc : d0 03 __ BNE $24d1 ; (strlen.s9 + 0)
.s8:
24ce : e6 0e __ INC P1 ; (str + 1)
24d0 : e8 __ __ INX
.s9:
24d1 : b1 0d __ LDA (P0),y ; (str + 0)
24d3 : d0 f6 __ BNE $24cb ; (strlen.l7 + 0)
.s5:
24d5 : 86 1c __ STX ACCU + 1 
24d7 : 84 1b __ STY ACCU + 0 
.s3:
24d9 : 60 __ __ RTS
--------------------------------------------------------------------
mat4_ident: ; mat4_ident(struct Matrix4*)->void
; 217, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
24da : a9 00 __ LDA #$00
24dc : 85 1d __ STA ACCU + 2 
24de : 85 1b __ STA ACCU + 0 
.l5:
24e0 : a5 1b __ LDA ACCU + 0 
24e2 : 0a __ __ ASL
24e3 : 0a __ __ ASL
24e4 : 85 1c __ STA ACCU + 1 
24e6 : a9 00 __ LDA #$00
24e8 : 85 43 __ STA T6 + 0 
.l6:
24ea : a5 1d __ LDA ACCU + 2 
24ec : c5 43 __ CMP T6 + 0 
24ee : d0 06 __ BNE $24f6 ; (mat4_ident.s7 + 0)
.s10:
24f0 : a9 3f __ LDA #$3f
24f2 : a2 80 __ LDX #$80
24f4 : d0 03 __ BNE $24f9 ; (mat4_ident.s8 + 0)
.s7:
24f6 : a9 00 __ LDA #$00
24f8 : aa __ __ TAX
.s8:
24f9 : 85 1e __ STA ACCU + 3 
24fb : a5 1c __ LDA ACCU + 1 
24fd : 0a __ __ ASL
24fe : 0a __ __ ASL
24ff : a8 __ __ TAY
2500 : a9 00 __ LDA #$00
2502 : 91 0d __ STA (P0),y ; (m + 0)
2504 : c8 __ __ INY
2505 : 91 0d __ STA (P0),y ; (m + 0)
2507 : 8a __ __ TXA
2508 : c8 __ __ INY
2509 : 91 0d __ STA (P0),y ; (m + 0)
250b : a5 1e __ LDA ACCU + 3 
250d : c8 __ __ INY
250e : 91 0d __ STA (P0),y ; (m + 0)
2510 : e6 1c __ INC ACCU + 1 
2512 : e6 43 __ INC T6 + 0 
2514 : a5 43 __ LDA T6 + 0 
2516 : c9 04 __ CMP #$04
2518 : 90 d0 __ BCC $24ea ; (mat4_ident.l6 + 0)
.s9:
251a : e6 1b __ INC ACCU + 0 
251c : e6 1d __ INC ACCU + 2 
251e : a5 1d __ LDA ACCU + 2 
2520 : c9 04 __ CMP #$04
2522 : 90 bc __ BCC $24e0 ; (mat4_ident.l5 + 0)
.s3:
2524 : 60 __ __ RTS
--------------------------------------------------------------------
mat4_make_perspective: ; mat4_make_perspective(struct Matrix4*,float,float,float,float)->void
; 223, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
2525 : a5 53 __ LDA T4 + 0 
2527 : 8d bc c7 STA $c7bc ; (mat4_make_perspective@stack + 0)
252a : a5 54 __ LDA T4 + 1 
252c : 8d bd c7 STA $c7bd ; (mat4_make_perspective@stack + 1)
.s4:
252f : ad c0 c7 LDA $c7c0 ; (sstack + 2)
2532 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
2534 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
2537 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
2539 : ad c2 c7 LDA $c7c2 ; (sstack + 4)
253c : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
253e : ad c3 c7 LDA $c7c3 ; (sstack + 5)
2541 : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
2543 : a9 00 __ LDA #$00
2545 : 85 03 __ STA WORK + 0 
2547 : 85 04 __ STA WORK + 1 
2549 : 85 05 __ STA WORK + 2 
254b : a9 3f __ LDA #$3f
254d : 85 06 __ STA WORK + 3 
254f : 20 31 4e JSR $4e31 ; (freg + 20)
2552 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2555 : a9 db __ LDA #$db
2557 : 85 03 __ STA WORK + 0 
2559 : a9 3f __ LDA #$3f
255b : 85 06 __ STA WORK + 3 
255d : a9 0f __ LDA #$0f
255f : 85 04 __ STA WORK + 1 
2561 : a9 c9 __ LDA #$c9
2563 : 85 05 __ STA WORK + 2 
2565 : 20 31 4e JSR $4e31 ; (freg + 20)
2568 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
256a : 49 80 __ EOR #$80
256c : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
256e : 20 68 4e JSR $4e68 ; (faddsub + 6)
2571 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
2573 : 85 15 __ STA P8 
2575 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
2577 : 85 16 __ STA P9 
2579 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
257b : 85 17 __ STA P10 
257d : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
257f : 85 18 __ STA P11 
2581 : 20 83 27 JSR $2783 ; (tan.s4 + 0)
2584 : ad be c7 LDA $c7be ; (sstack + 0)
2587 : 85 53 __ STA T4 + 0 
2589 : ad bf c7 LDA $c7bf ; (sstack + 1)
258c : 85 54 __ STA T4 + 1 
258e : a9 00 __ LDA #$00
2590 : a0 04 __ LDY #$04
2592 : 91 53 __ STA (T4 + 0),y 
2594 : c8 __ __ INY
2595 : 91 53 __ STA (T4 + 0),y 
2597 : c8 __ __ INY
2598 : 91 53 __ STA (T4 + 0),y 
259a : c8 __ __ INY
259b : 91 53 __ STA (T4 + 0),y 
259d : c8 __ __ INY
259e : 91 53 __ STA (T4 + 0),y 
25a0 : c8 __ __ INY
25a1 : 91 53 __ STA (T4 + 0),y 
25a3 : c8 __ __ INY
25a4 : 91 53 __ STA (T4 + 0),y 
25a6 : c8 __ __ INY
25a7 : 91 53 __ STA (T4 + 0),y 
25a9 : c8 __ __ INY
25aa : 91 53 __ STA (T4 + 0),y 
25ac : c8 __ __ INY
25ad : 91 53 __ STA (T4 + 0),y 
25af : c8 __ __ INY
25b0 : 91 53 __ STA (T4 + 0),y 
25b2 : c8 __ __ INY
25b3 : 91 53 __ STA (T4 + 0),y 
25b5 : c8 __ __ INY
25b6 : 91 53 __ STA (T4 + 0),y 
25b8 : c8 __ __ INY
25b9 : 91 53 __ STA (T4 + 0),y 
25bb : c8 __ __ INY
25bc : 91 53 __ STA (T4 + 0),y 
25be : c8 __ __ INY
25bf : 91 53 __ STA (T4 + 0),y 
25c1 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
25c3 : c8 __ __ INY
25c4 : 91 53 __ STA (T4 + 0),y 
25c6 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
25c8 : c8 __ __ INY
25c9 : 91 53 __ STA (T4 + 0),y 
25cb : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
25cd : c8 __ __ INY
25ce : 91 53 __ STA (T4 + 0),y 
25d0 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
25d2 : c8 __ __ INY
25d3 : 91 53 __ STA (T4 + 0),y 
25d5 : a9 00 __ LDA #$00
25d7 : c8 __ __ INY
25d8 : 91 53 __ STA (T4 + 0),y 
25da : c8 __ __ INY
25db : 91 53 __ STA (T4 + 0),y 
25dd : c8 __ __ INY
25de : 91 53 __ STA (T4 + 0),y 
25e0 : c8 __ __ INY
25e1 : 91 53 __ STA (T4 + 0),y 
25e3 : c8 __ __ INY
25e4 : 91 53 __ STA (T4 + 0),y 
25e6 : c8 __ __ INY
25e7 : 91 53 __ STA (T4 + 0),y 
25e9 : c8 __ __ INY
25ea : 91 53 __ STA (T4 + 0),y 
25ec : c8 __ __ INY
25ed : 91 53 __ STA (T4 + 0),y 
25ef : c8 __ __ INY
25f0 : 91 53 __ STA (T4 + 0),y 
25f2 : c8 __ __ INY
25f3 : 91 53 __ STA (T4 + 0),y 
25f5 : c8 __ __ INY
25f6 : 91 53 __ STA (T4 + 0),y 
25f8 : c8 __ __ INY
25f9 : 91 53 __ STA (T4 + 0),y 
25fb : c8 __ __ INY
25fc : 91 53 __ STA (T4 + 0),y 
25fe : c8 __ __ INY
25ff : 91 53 __ STA (T4 + 0),y 
2601 : c8 __ __ INY
2602 : 91 53 __ STA (T4 + 0),y 
2604 : c8 __ __ INY
2605 : 91 53 __ STA (T4 + 0),y 
2607 : a0 2c __ LDY #$2c
2609 : 91 53 __ STA (T4 + 0),y 
260b : c8 __ __ INY
260c : 91 53 __ STA (T4 + 0),y 
260e : a9 80 __ LDA #$80
2610 : c8 __ __ INY
2611 : 91 53 __ STA (T4 + 0),y 
2613 : a9 3f __ LDA #$3f
2615 : c8 __ __ INY
2616 : 91 53 __ STA (T4 + 0),y 
2618 : a9 00 __ LDA #$00
261a : c8 __ __ INY
261b : 91 53 __ STA (T4 + 0),y 
261d : c8 __ __ INY
261e : 91 53 __ STA (T4 + 0),y 
2620 : c8 __ __ INY
2621 : 91 53 __ STA (T4 + 0),y 
2623 : c8 __ __ INY
2624 : 91 53 __ STA (T4 + 0),y 
2626 : c8 __ __ INY
2627 : 91 53 __ STA (T4 + 0),y 
2629 : c8 __ __ INY
262a : 91 53 __ STA (T4 + 0),y 
262c : c8 __ __ INY
262d : 91 53 __ STA (T4 + 0),y 
262f : c8 __ __ INY
2630 : 91 53 __ STA (T4 + 0),y 
2632 : a0 3c __ LDY #$3c
2634 : 91 53 __ STA (T4 + 0),y 
2636 : c8 __ __ INY
2637 : 91 53 __ STA (T4 + 0),y 
2639 : c8 __ __ INY
263a : 91 53 __ STA (T4 + 0),y 
263c : c8 __ __ INY
263d : 91 53 __ STA (T4 + 0),y 
263f : ad c4 c7 LDA $c7c4 ; (sstack + 6)
2642 : 85 03 __ STA WORK + 0 
2644 : ad c5 c7 LDA $c7c5 ; (sstack + 7)
2647 : 85 04 __ STA WORK + 1 
2649 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
264c : 85 05 __ STA WORK + 2 
264e : ad c7 c7 LDA $c7c7 ; (sstack + 9)
2651 : 85 06 __ STA WORK + 3 
2653 : 20 31 4e JSR $4e31 ; (freg + 20)
2656 : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
2659 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
265b : a0 00 __ LDY #$00
265d : 91 53 __ STA (T4 + 0),y 
265f : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
2661 : c8 __ __ INY
2662 : 91 53 __ STA (T4 + 0),y 
2664 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
2666 : c8 __ __ INY
2667 : 91 53 __ STA (T4 + 0),y 
2669 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
266b : c8 __ __ INY
266c : 91 53 __ STA (T4 + 0),y 
266e : ad cc c7 LDA $c7cc ; (sstack + 14)
2671 : 85 43 __ STA T0 + 0 
2673 : ad cd c7 LDA $c7cd ; (sstack + 15)
2676 : 85 44 __ STA T0 + 1 
2678 : ad ce c7 LDA $c7ce ; (sstack + 16)
267b : 85 45 __ STA T0 + 2 
267d : ad cf c7 LDA $c7cf ; (sstack + 17)
2680 : 85 46 __ STA T0 + 3 
2682 : ad c8 c7 LDA $c7c8 ; (sstack + 10)
2685 : 85 47 __ STA T1 + 0 
2687 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
2689 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
268c : 85 48 __ STA T1 + 1 
268e : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
2690 : ad ca c7 LDA $c7ca ; (sstack + 12)
2693 : 85 49 __ STA T1 + 2 
2695 : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
2697 : ad cb c7 LDA $c7cb ; (sstack + 13)
269a : 85 4a __ STA T1 + 3 
269c : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
269e : a2 43 __ LDX #$43
26a0 : 20 21 4e JSR $4e21 ; (freg + 4)
26a3 : 20 68 4e JSR $4e68 ; (faddsub + 6)
26a6 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
26a8 : 85 4b __ STA T2 + 0 
26aa : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
26ac : 85 4c __ STA T2 + 1 
26ae : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
26b0 : 85 4d __ STA T2 + 2 
26b2 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
26b4 : 85 4e __ STA T2 + 3 
26b6 : a5 43 __ LDA T0 + 0 
26b8 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
26ba : a5 44 __ LDA T0 + 1 
26bc : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
26be : a5 45 __ LDA T0 + 2 
26c0 : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
26c2 : a5 46 __ LDA T0 + 3 
26c4 : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
26c6 : a2 47 __ LDX #$47
26c8 : 20 21 4e JSR $4e21 ; (freg + 4)
26cb : 20 62 4e JSR $4e62 ; (faddsub + 0)
26ce : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
26d0 : 85 4f __ STA T3 + 0 
26d2 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
26d4 : 85 50 __ STA T3 + 1 
26d6 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
26d8 : 85 51 __ STA T3 + 2 
26da : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
26dc : 85 52 __ STA T3 + 3 
26de : a9 00 __ LDA #$00
26e0 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
26e2 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
26e4 : a9 80 __ LDA #$80
26e6 : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
26e8 : a9 3f __ LDA #$3f
26ea : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
26ec : a2 4f __ LDX #$4f
26ee : 20 21 4e JSR $4e21 ; (freg + 4)
26f1 : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
26f4 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
26f6 : 85 4f __ STA T3 + 0 
26f8 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
26fa : 85 50 __ STA T3 + 1 
26fc : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
26fe : 85 51 __ STA T3 + 2 
2700 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
2702 : 85 52 __ STA T3 + 3 
2704 : a5 4b __ LDA T2 + 0 
2706 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
2708 : a5 4c __ LDA T2 + 1 
270a : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
270c : a5 4d __ LDA T2 + 2 
270e : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
2710 : a5 4e __ LDA T2 + 3 
2712 : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
2714 : a2 4f __ LDX #$4f
2716 : 20 21 4e JSR $4e21 ; (freg + 4)
2719 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
271c : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
271e : a0 28 __ LDY #$28
2720 : 91 53 __ STA (T4 + 0),y 
2722 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
2724 : c8 __ __ INY
2725 : 91 53 __ STA (T4 + 0),y 
2727 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
2729 : c8 __ __ INY
272a : 91 53 __ STA (T4 + 0),y 
272c : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
272e : c8 __ __ INY
272f : 91 53 __ STA (T4 + 0),y 
2731 : a5 43 __ LDA T0 + 0 
2733 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
2735 : a5 44 __ LDA T0 + 1 
2737 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
2739 : a5 45 __ LDA T0 + 2 
273b : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
273d : a5 46 __ LDA T0 + 3 
273f : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
2741 : a2 47 __ LDX #$47
2743 : 20 21 4e JSR $4e21 ; (freg + 4)
2746 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2749 : a2 4f __ LDX #$4f
274b : 20 21 4e JSR $4e21 ; (freg + 4)
274e : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2751 : a9 00 __ LDA #$00
2753 : 85 03 __ STA WORK + 0 
2755 : 85 04 __ STA WORK + 1 
2757 : 85 05 __ STA WORK + 2 
2759 : a9 c0 __ LDA #$c0
275b : 85 06 __ STA WORK + 3 
275d : 20 31 4e JSR $4e31 ; (freg + 20)
2760 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2763 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
2765 : a0 38 __ LDY #$38
2767 : 91 53 __ STA (T4 + 0),y 
2769 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
276b : c8 __ __ INY
276c : 91 53 __ STA (T4 + 0),y 
276e : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
2770 : c8 __ __ INY
2771 : 91 53 __ STA (T4 + 0),y 
2773 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
2775 : c8 __ __ INY
2776 : 91 53 __ STA (T4 + 0),y 
.s3:
2778 : ad bc c7 LDA $c7bc ; (mat4_make_perspective@stack + 0)
277b : 85 53 __ STA T4 + 0 
277d : ad bd c7 LDA $c7bd ; (mat4_make_perspective@stack + 1)
2780 : 85 54 __ STA T4 + 1 
2782 : 60 __ __ RTS
--------------------------------------------------------------------
tan: ; tan(float)->float
;  13, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
2783 : a5 15 __ LDA P8 ; (f + 0)
2785 : 85 0d __ STA P0 
2787 : 85 4b __ STA T0 + 0 
2789 : a5 16 __ LDA P9 ; (f + 1)
278b : 85 0e __ STA P1 
278d : 85 4c __ STA T0 + 1 
278f : a5 17 __ LDA P10 ; (f + 2)
2791 : 85 0f __ STA P2 
2793 : 85 4d __ STA T0 + 2 
2795 : a5 18 __ LDA P11 ; (f + 3)
2797 : 85 10 __ STA P3 
2799 : 85 4e __ STA T0 + 3 
279b : 20 01 28 JSR $2801 ; (sin.s4 + 0)
279e : a5 1b __ LDA ACCU + 0 
27a0 : 85 4f __ STA T1 + 0 
27a2 : a5 1c __ LDA ACCU + 1 
27a4 : 85 50 __ STA T1 + 1 
27a6 : a5 1d __ LDA ACCU + 2 
27a8 : 85 51 __ STA T1 + 2 
27aa : a5 1e __ LDA ACCU + 3 
27ac : 85 52 __ STA T1 + 3 
27ae : a9 db __ LDA #$db
27b0 : 85 1b __ STA ACCU + 0 
27b2 : a9 3f __ LDA #$3f
27b4 : 85 1e __ STA ACCU + 3 
27b6 : a9 0f __ LDA #$0f
27b8 : 85 1c __ STA ACCU + 1 
27ba : a9 c9 __ LDA #$c9
27bc : 85 1d __ STA ACCU + 2 
27be : a2 4b __ LDX #$4b
27c0 : 20 21 4e JSR $4e21 ; (freg + 4)
27c3 : 20 68 4e JSR $4e68 ; (faddsub + 6)
27c6 : a5 1b __ LDA ACCU + 0 
27c8 : 85 0d __ STA P0 
27ca : a5 1c __ LDA ACCU + 1 
27cc : 85 0e __ STA P1 
27ce : a5 1d __ LDA ACCU + 2 
27d0 : 85 0f __ STA P2 
27d2 : a5 1e __ LDA ACCU + 3 
27d4 : 85 10 __ STA P3 
27d6 : 20 01 28 JSR $2801 ; (sin.s4 + 0)
27d9 : a5 1b __ LDA ACCU + 0 
27db : 85 4b __ STA T0 + 0 
27dd : a5 1c __ LDA ACCU + 1 
27df : 85 4c __ STA T0 + 1 
27e1 : a5 1d __ LDA ACCU + 2 
27e3 : 85 4d __ STA T0 + 2 
27e5 : a5 1e __ LDA ACCU + 3 
27e7 : 85 4e __ STA T0 + 3 
27e9 : a5 4f __ LDA T1 + 0 
27eb : 85 1b __ STA ACCU + 0 
27ed : a5 50 __ LDA T1 + 1 
27ef : 85 1c __ STA ACCU + 1 
27f1 : a5 51 __ LDA T1 + 2 
27f3 : 85 1d __ STA ACCU + 2 
27f5 : a5 52 __ LDA T1 + 3 
27f7 : 85 1e __ STA ACCU + 3 
27f9 : a2 4b __ LDX #$4b
27fb : 20 21 4e JSR $4e21 ; (freg + 4)
27fe : 4c 17 50 JMP $5017 ; (crt_fdiv + 0)
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
2801 : a5 0d __ LDA P0 ; (f + 0)
2803 : 85 43 __ STA T0 + 0 
2805 : a5 0e __ LDA P1 ; (f + 1)
2807 : 85 44 __ STA T0 + 1 
2809 : a5 0f __ LDA P2 ; (f + 2)
280b : 85 45 __ STA T0 + 2 
280d : a5 10 __ LDA P3 ; (f + 3)
280f : 29 7f __ AND #$7f
2811 : 05 0f __ ORA P2 ; (f + 2)
2813 : 05 0e __ ORA P1 ; (f + 1)
2815 : 05 0d __ ORA P0 ; (f + 0)
2817 : f0 0e __ BEQ $2827 ; (sin.s5 + 0)
.s22:
2819 : 24 10 __ BIT P3 ; (f + 3)
281b : 10 0a __ BPL $2827 ; (sin.s5 + 0)
.s21:
281d : a9 00 __ LDA #$00
281f : 85 47 __ STA T1 + 0 
2821 : 85 48 __ STA T1 + 1 
2823 : a9 bf __ LDA #$bf
2825 : d0 08 __ BNE $282f ; (sin.s6 + 0)
.s5:
2827 : a9 00 __ LDA #$00
2829 : 85 47 __ STA T1 + 0 
282b : 85 48 __ STA T1 + 1 
282d : a9 3f __ LDA #$3f
.s6:
282f : 85 4a __ STA T1 + 3 
2831 : a5 10 __ LDA P3 ; (f + 3)
2833 : 29 7f __ AND #$7f
2835 : 85 46 __ STA T0 + 3 
2837 : a9 80 __ LDA #$80
2839 : 85 49 __ STA T1 + 2 
283b : a9 83 __ LDA #$83
283d : 85 1b __ STA ACCU + 0 
283f : a9 3e __ LDA #$3e
2841 : 85 1e __ STA ACCU + 3 
2843 : a9 f9 __ LDA #$f9
2845 : 85 1c __ STA ACCU + 1 
2847 : a9 22 __ LDA #$22
2849 : 85 1d __ STA ACCU + 2 
284b : a2 43 __ LDX #$43
284d : 20 21 4e JSR $4e21 ; (freg + 4)
2850 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2853 : a5 1b __ LDA ACCU + 0 
2855 : 85 43 __ STA T0 + 0 
2857 : a5 1c __ LDA ACCU + 1 
2859 : 85 44 __ STA T0 + 1 
285b : a5 1d __ LDA ACCU + 2 
285d : 85 45 __ STA T0 + 2 
285f : a5 1e __ LDA ACCU + 3 
2861 : 85 46 __ STA T0 + 3 
2863 : 20 41 4e JSR $4e41 ; (freg + 36)
2866 : 20 c5 50 JSR $50c5 ; (fround + 0)
2869 : a2 43 __ LDX #$43
286b : 20 21 4e JSR $4e21 ; (freg + 4)
286e : a5 1e __ LDA ACCU + 3 
2870 : 49 80 __ EOR #$80
2872 : 85 1e __ STA ACCU + 3 
2874 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2877 : a5 1b __ LDA ACCU + 0 
2879 : 85 43 __ STA T0 + 0 
287b : a5 1c __ LDA ACCU + 1 
287d : 85 44 __ STA T0 + 1 
287f : a6 1d __ LDX ACCU + 2 
2881 : 86 45 __ STX T0 + 2 
2883 : a5 1e __ LDA ACCU + 3 
2885 : 85 46 __ STA T0 + 3 
2887 : 30 3b __ BMI $28c4 ; (sin.s7 + 0)
.s16:
2889 : c9 3f __ CMP #$3f
288b : d0 0b __ BNE $2898 ; (sin.s20 + 0)
.s17:
288d : 8a __ __ TXA
288e : d0 08 __ BNE $2898 ; (sin.s20 + 0)
.s18:
2890 : a5 1c __ LDA ACCU + 1 
2892 : d0 04 __ BNE $2898 ; (sin.s20 + 0)
.s19:
2894 : a5 1b __ LDA ACCU + 0 
2896 : f0 02 __ BEQ $289a ; (sin.s15 + 0)
.s20:
2898 : 90 2a __ BCC $28c4 ; (sin.s7 + 0)
.s15:
289a : a9 00 __ LDA #$00
289c : 85 1b __ STA ACCU + 0 
289e : 85 1c __ STA ACCU + 1 
28a0 : 85 1d __ STA ACCU + 2 
28a2 : a9 bf __ LDA #$bf
28a4 : 85 1e __ STA ACCU + 3 
28a6 : a2 43 __ LDX #$43
28a8 : 20 21 4e JSR $4e21 ; (freg + 4)
28ab : 20 68 4e JSR $4e68 ; (faddsub + 6)
28ae : a5 1b __ LDA ACCU + 0 
28b0 : 85 43 __ STA T0 + 0 
28b2 : a5 1c __ LDA ACCU + 1 
28b4 : 85 44 __ STA T0 + 1 
28b6 : a5 1d __ LDA ACCU + 2 
28b8 : 85 45 __ STA T0 + 2 
28ba : a5 1e __ LDA ACCU + 3 
28bc : 85 46 __ STA T0 + 3 
28be : a5 4a __ LDA T1 + 3 
28c0 : 49 80 __ EOR #$80
28c2 : 85 4a __ STA T1 + 3 
.s7:
28c4 : a5 1e __ LDA ACCU + 3 
28c6 : 30 38 __ BMI $2900 ; (sin.s8 + 0)
.s10:
28c8 : c9 3e __ CMP #$3e
28ca : d0 0e __ BNE $28da ; (sin.s14 + 0)
.s11:
28cc : a5 1d __ LDA ACCU + 2 
28ce : c9 80 __ CMP #$80
28d0 : d0 08 __ BNE $28da ; (sin.s14 + 0)
.s12:
28d2 : a5 1c __ LDA ACCU + 1 
28d4 : d0 04 __ BNE $28da ; (sin.s14 + 0)
.s13:
28d6 : a5 1b __ LDA ACCU + 0 
28d8 : f0 02 __ BEQ $28dc ; (sin.s9 + 0)
.s14:
28da : 90 24 __ BCC $2900 ; (sin.s8 + 0)
.s9:
28dc : a9 00 __ LDA #$00
28de : 85 1b __ STA ACCU + 0 
28e0 : 85 1c __ STA ACCU + 1 
28e2 : 85 1d __ STA ACCU + 2 
28e4 : a9 3f __ LDA #$3f
28e6 : 85 1e __ STA ACCU + 3 
28e8 : a2 43 __ LDX #$43
28ea : 20 21 4e JSR $4e21 ; (freg + 4)
28ed : 20 62 4e JSR $4e62 ; (faddsub + 0)
28f0 : a5 1b __ LDA ACCU + 0 
28f2 : 85 43 __ STA T0 + 0 
28f4 : a5 1c __ LDA ACCU + 1 
28f6 : 85 44 __ STA T0 + 1 
28f8 : a5 1d __ LDA ACCU + 2 
28fa : 85 45 __ STA T0 + 2 
28fc : a5 1e __ LDA ACCU + 3 
28fe : 85 46 __ STA T0 + 3 
.s8:
2900 : a9 98 __ LDA #$98
2902 : 85 1b __ STA ACCU + 0 
2904 : a9 42 __ LDA #$42
2906 : 85 1e __ STA ACCU + 3 
2908 : a9 ec __ LDA #$ec
290a : 85 1c __ STA ACCU + 1 
290c : a9 5e __ LDA #$5e
290e : 85 1d __ STA ACCU + 2 
2910 : a2 43 __ LDX #$43
2912 : 20 21 4e JSR $4e21 ; (freg + 4)
2915 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2918 : a9 f8 __ LDA #$f8
291a : 85 03 __ STA WORK + 0 
291c : a9 41 __ LDA #$41
291e : 85 06 __ STA WORK + 3 
2920 : a9 c5 __ LDA #$c5
2922 : 85 04 __ STA WORK + 1 
2924 : a9 13 __ LDA #$13
2926 : 85 05 __ STA WORK + 2 
2928 : 20 31 4e JSR $4e31 ; (freg + 20)
292b : 20 68 4e JSR $4e68 ; (faddsub + 6)
292e : a2 43 __ LDX #$43
2930 : 20 21 4e JSR $4e21 ; (freg + 4)
2933 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2936 : a9 6e __ LDA #$6e
2938 : 85 03 __ STA WORK + 0 
293a : a9 c2 __ LDA #$c2
293c : 85 06 __ STA WORK + 3 
293e : a9 27 __ LDA #$27
2940 : 85 04 __ STA WORK + 1 
2942 : a9 2a __ LDA #$2a
2944 : 85 05 __ STA WORK + 2 
2946 : 20 31 4e JSR $4e31 ; (freg + 20)
2949 : 20 68 4e JSR $4e68 ; (faddsub + 6)
294c : a2 43 __ LDX #$43
294e : 20 21 4e JSR $4e21 ; (freg + 4)
2951 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2954 : a9 df __ LDA #$df
2956 : 85 03 __ STA WORK + 0 
2958 : a9 3d __ LDA #$3d
295a : 85 06 __ STA WORK + 3 
295c : a9 af __ LDA #$af
295e : 85 04 __ STA WORK + 1 
2960 : a9 5c __ LDA #$5c
2962 : 85 05 __ STA WORK + 2 
2964 : 20 31 4e JSR $4e31 ; (freg + 20)
2967 : 20 68 4e JSR $4e68 ; (faddsub + 6)
296a : a2 43 __ LDX #$43
296c : 20 21 4e JSR $4e21 ; (freg + 4)
296f : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2972 : a9 b6 __ LDA #$b6
2974 : 85 03 __ STA WORK + 0 
2976 : a9 40 __ LDA #$40
2978 : 85 06 __ STA WORK + 3 
297a : a9 0f __ LDA #$0f
297c : 85 04 __ STA WORK + 1 
297e : a9 c9 __ LDA #$c9
2980 : 85 05 __ STA WORK + 2 
2982 : 20 31 4e JSR $4e31 ; (freg + 20)
2985 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2988 : a2 43 __ LDX #$43
298a : 20 21 4e JSR $4e21 ; (freg + 4)
298d : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2990 : a2 47 __ LDX #$47
2992 : 20 21 4e JSR $4e21 ; (freg + 4)
2995 : 4c 4f 4f JMP $4f4f ; (crt_fmul + 0)
--------------------------------------------------------------------
sqrt: ; sqrt(float)->float
;  24, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
2998 : a5 10 __ LDA P3 ; (f + 3)
299a : 29 7f __ AND #$7f
299c : 05 0f __ ORA P2 ; (f + 2)
299e : 05 0e __ ORA P1 ; (f + 1)
29a0 : 05 0d __ ORA P0 ; (f + 0)
29a2 : f0 0f __ BEQ $29b3 ; (sqrt.s6 + 0)
.s7:
29a4 : 24 10 __ BIT P3 ; (f + 3)
29a6 : 10 0b __ BPL $29b3 ; (sqrt.s6 + 0)
.s5:
29a8 : a9 00 __ LDA #$00
29aa : 85 1b __ STA ACCU + 0 
29ac : 85 1c __ STA ACCU + 1 
29ae : 85 1d __ STA ACCU + 2 
29b0 : 85 1e __ STA ACCU + 3 
.s3:
29b2 : 60 __ __ RTS
.s6:
29b3 : a5 0d __ LDA P0 ; (f + 0)
29b5 : 85 1b __ STA ACCU + 0 
29b7 : 8d ba c7 STA $c7ba ; (x + 0)
29ba : a5 0e __ LDA P1 ; (f + 1)
29bc : 85 1c __ STA ACCU + 1 
29be : 8d bb c7 STA $c7bb ; (x + 1)
29c1 : a5 0f __ LDA P2 ; (f + 2)
29c3 : 85 1d __ STA ACCU + 2 
29c5 : 0a __ __ ASL
29c6 : a5 10 __ LDA P3 ; (f + 3)
29c8 : 85 1e __ STA ACCU + 3 
29ca : 2a __ __ ROL
29cb : aa __ __ TAX
29cc : a9 00 __ LDA #$00
29ce : 69 ff __ ADC #$ff
29d0 : 49 ff __ EOR #$ff
29d2 : a8 __ __ TAY
29d3 : 8a __ __ TXA
29d4 : 38 __ __ SEC
29d5 : e9 7f __ SBC #$7f
29d7 : aa __ __ TAX
29d8 : b0 01 __ BCS $29db ; (sqrt.s9 + 0)
.s8:
29da : 88 __ __ DEY
.s9:
29db : 98 __ __ TYA
29dc : 0a __ __ ASL
29dd : 8a __ __ TXA
29de : 69 00 __ ADC #$00
29e0 : 85 43 __ STA T1 + 0 
29e2 : 98 __ __ TYA
29e3 : 69 00 __ ADC #$00
29e5 : c9 80 __ CMP #$80
29e7 : 6a __ __ ROR
29e8 : 66 43 __ ROR T1 + 0 
29ea : a8 __ __ TAY
29eb : 18 __ __ CLC
29ec : a5 43 __ LDA T1 + 0 
29ee : 69 7f __ ADC #$7f
29f0 : aa __ __ TAX
29f1 : 98 __ __ TYA
29f2 : 69 00 __ ADC #$00
29f4 : 4a __ __ LSR
29f5 : 8a __ __ TXA
29f6 : 6a __ __ ROR
29f7 : 8d bd c7 STA $c7bd ; (x + 3)
29fa : a9 00 __ LDA #$00
29fc : 6a __ __ ROR
29fd : 8d bc c7 STA $c7bc ; (x + 2)
2a00 : ad ba c7 LDA $c7ba ; (x + 0)
2a03 : 85 43 __ STA T1 + 0 
2a05 : ad bb c7 LDA $c7bb ; (x + 1)
2a08 : 85 44 __ STA T1 + 1 
2a0a : ad bc c7 LDA $c7bc ; (x + 2)
2a0d : 85 45 __ STA T1 + 2 
2a0f : ad bd c7 LDA $c7bd ; (x + 3)
2a12 : 85 46 __ STA T1 + 3 
2a14 : a2 43 __ LDX #$43
2a16 : 20 21 4e JSR $4e21 ; (freg + 4)
2a19 : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
2a1c : a2 43 __ LDX #$43
2a1e : 20 21 4e JSR $4e21 ; (freg + 4)
2a21 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2a24 : a9 00 __ LDA #$00
2a26 : 85 03 __ STA WORK + 0 
2a28 : 85 04 __ STA WORK + 1 
2a2a : 85 05 __ STA WORK + 2 
2a2c : a9 3f __ LDA #$3f
2a2e : 85 06 __ STA WORK + 3 
2a30 : 20 31 4e JSR $4e31 ; (freg + 20)
2a33 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2a36 : a5 1b __ LDA ACCU + 0 
2a38 : 85 43 __ STA T1 + 0 
2a3a : a5 1c __ LDA ACCU + 1 
2a3c : 85 44 __ STA T1 + 1 
2a3e : a5 1d __ LDA ACCU + 2 
2a40 : 85 45 __ STA T1 + 2 
2a42 : a5 1e __ LDA ACCU + 3 
2a44 : 85 46 __ STA T1 + 3 
2a46 : a5 0d __ LDA P0 ; (f + 0)
2a48 : 85 1b __ STA ACCU + 0 
2a4a : a5 0e __ LDA P1 ; (f + 1)
2a4c : 85 1c __ STA ACCU + 1 
2a4e : a5 0f __ LDA P2 ; (f + 2)
2a50 : 85 1d __ STA ACCU + 2 
2a52 : a5 10 __ LDA P3 ; (f + 3)
2a54 : 85 1e __ STA ACCU + 3 
2a56 : a2 43 __ LDX #$43
2a58 : 20 21 4e JSR $4e21 ; (freg + 4)
2a5b : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
2a5e : a2 43 __ LDX #$43
2a60 : 20 21 4e JSR $4e21 ; (freg + 4)
2a63 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2a66 : a9 00 __ LDA #$00
2a68 : 85 03 __ STA WORK + 0 
2a6a : 85 04 __ STA WORK + 1 
2a6c : 85 05 __ STA WORK + 2 
2a6e : a9 3f __ LDA #$3f
2a70 : 85 06 __ STA WORK + 3 
2a72 : 20 31 4e JSR $4e31 ; (freg + 20)
2a75 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2a78 : a5 1b __ LDA ACCU + 0 
2a7a : 85 43 __ STA T1 + 0 
2a7c : a5 1c __ LDA ACCU + 1 
2a7e : 85 44 __ STA T1 + 1 
2a80 : a5 1d __ LDA ACCU + 2 
2a82 : 85 45 __ STA T1 + 2 
2a84 : a5 1e __ LDA ACCU + 3 
2a86 : 85 46 __ STA T1 + 3 
2a88 : a5 0d __ LDA P0 ; (f + 0)
2a8a : 85 1b __ STA ACCU + 0 
2a8c : a5 0e __ LDA P1 ; (f + 1)
2a8e : 85 1c __ STA ACCU + 1 
2a90 : a5 0f __ LDA P2 ; (f + 2)
2a92 : 85 1d __ STA ACCU + 2 
2a94 : a5 10 __ LDA P3 ; (f + 3)
2a96 : 85 1e __ STA ACCU + 3 
2a98 : a2 43 __ LDX #$43
2a9a : 20 21 4e JSR $4e21 ; (freg + 4)
2a9d : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
2aa0 : a2 43 __ LDX #$43
2aa2 : 20 21 4e JSR $4e21 ; (freg + 4)
2aa5 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2aa8 : a9 00 __ LDA #$00
2aaa : 85 03 __ STA WORK + 0 
2aac : 85 04 __ STA WORK + 1 
2aae : 85 05 __ STA WORK + 2 
2ab0 : a9 3f __ LDA #$3f
2ab2 : 85 06 __ STA WORK + 3 
2ab4 : 20 31 4e JSR $4e31 ; (freg + 20)
2ab7 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2aba : a5 1b __ LDA ACCU + 0 
2abc : 85 43 __ STA T1 + 0 
2abe : a5 1c __ LDA ACCU + 1 
2ac0 : 85 44 __ STA T1 + 1 
2ac2 : a5 1d __ LDA ACCU + 2 
2ac4 : 85 45 __ STA T1 + 2 
2ac6 : a5 1e __ LDA ACCU + 3 
2ac8 : 85 46 __ STA T1 + 3 
2aca : a5 0d __ LDA P0 ; (f + 0)
2acc : 85 1b __ STA ACCU + 0 
2ace : a5 0e __ LDA P1 ; (f + 1)
2ad0 : 85 1c __ STA ACCU + 1 
2ad2 : a5 0f __ LDA P2 ; (f + 2)
2ad4 : 85 1d __ STA ACCU + 2 
2ad6 : a5 10 __ LDA P3 ; (f + 3)
2ad8 : 85 1e __ STA ACCU + 3 
2ada : a2 43 __ LDX #$43
2adc : 20 21 4e JSR $4e21 ; (freg + 4)
2adf : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
2ae2 : a2 43 __ LDX #$43
2ae4 : 20 21 4e JSR $4e21 ; (freg + 4)
2ae7 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2aea : a9 00 __ LDA #$00
2aec : 85 03 __ STA WORK + 0 
2aee : 85 04 __ STA WORK + 1 
2af0 : 85 05 __ STA WORK + 2 
2af2 : a9 3f __ LDA #$3f
2af4 : 85 06 __ STA WORK + 3 
2af6 : 20 31 4e JSR $4e31 ; (freg + 20)
2af9 : 4c 4f 4f JMP $4f4f ; (crt_fmul + 0)
--------------------------------------------------------------------
exp: ; exp(float)->float
;  19, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
2afc : a9 00 __ LDA #$00
2afe : 8d ba c7 STA $c7ba ; (x + 0)
2b01 : 8d bb c7 STA $c7bb ; (x + 1)
2b04 : a5 0d __ LDA P0 ; (f + 0)
2b06 : 85 1b __ STA ACCU + 0 
2b08 : a5 0e __ LDA P1 ; (f + 1)
2b0a : 85 1c __ STA ACCU + 1 
2b0c : a5 0f __ LDA P2 ; (f + 2)
2b0e : 85 1d __ STA ACCU + 2 
2b10 : a5 10 __ LDA P3 ; (f + 3)
2b12 : 85 1e __ STA ACCU + 3 
2b14 : a9 3b __ LDA #$3b
2b16 : 85 03 __ STA WORK + 0 
2b18 : a9 3f __ LDA #$3f
2b1a : 85 06 __ STA WORK + 3 
2b1c : a9 aa __ LDA #$aa
2b1e : 85 04 __ STA WORK + 1 
2b20 : a9 b8 __ LDA #$b8
2b22 : 85 05 __ STA WORK + 2 
2b24 : 20 31 4e JSR $4e31 ; (freg + 20)
2b27 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2b2a : a5 1b __ LDA ACCU + 0 
2b2c : 85 43 __ STA T0 + 0 
2b2e : a5 1c __ LDA ACCU + 1 
2b30 : 85 44 __ STA T0 + 1 
2b32 : a5 1d __ LDA ACCU + 2 
2b34 : 85 45 __ STA T0 + 2 
2b36 : a5 1e __ LDA ACCU + 3 
2b38 : 85 46 __ STA T0 + 3 
2b3a : 20 41 4e JSR $4e41 ; (freg + 36)
2b3d : 20 c5 50 JSR $50c5 ; (fround + 0)
2b40 : a5 1b __ LDA ACCU + 0 
2b42 : 85 47 __ STA T1 + 0 
2b44 : a5 1c __ LDA ACCU + 1 
2b46 : 85 48 __ STA T1 + 1 
2b48 : a5 1d __ LDA ACCU + 2 
2b4a : 85 49 __ STA T1 + 2 
2b4c : a5 1e __ LDA ACCU + 3 
2b4e : 85 4a __ STA T1 + 3 
2b50 : 20 bf 51 JSR $51bf ; (f32_to_i16 + 0)
2b53 : 18 __ __ CLC
2b54 : a5 1b __ LDA ACCU + 0 
2b56 : 69 7f __ ADC #$7f
2b58 : aa __ __ TAX
2b59 : a5 1c __ LDA ACCU + 1 
2b5b : 69 00 __ ADC #$00
2b5d : 4a __ __ LSR
2b5e : 8a __ __ TXA
2b5f : 6a __ __ ROR
2b60 : 8d bd c7 STA $c7bd ; (x + 3)
2b63 : a9 00 __ LDA #$00
2b65 : 6a __ __ ROR
2b66 : 8d bc c7 STA $c7bc ; (x + 2)
2b69 : a5 43 __ LDA T0 + 0 
2b6b : 85 1b __ STA ACCU + 0 
2b6d : a5 44 __ LDA T0 + 1 
2b6f : 85 1c __ STA ACCU + 1 
2b71 : a5 45 __ LDA T0 + 2 
2b73 : 85 1d __ STA ACCU + 2 
2b75 : a5 46 __ LDA T0 + 3 
2b77 : 85 1e __ STA ACCU + 3 
2b79 : a2 47 __ LDX #$47
2b7b : 20 21 4e JSR $4e21 ; (freg + 4)
2b7e : 20 62 4e JSR $4e62 ; (faddsub + 0)
2b81 : a5 1b __ LDA ACCU + 0 
2b83 : 85 43 __ STA T0 + 0 
2b85 : a5 1c __ LDA ACCU + 1 
2b87 : 85 44 __ STA T0 + 1 
2b89 : a5 1d __ LDA ACCU + 2 
2b8b : 85 45 __ STA T0 + 2 
2b8d : a5 1e __ LDA ACCU + 3 
2b8f : 85 46 __ STA T0 + 3 
2b91 : a9 fc __ LDA #$fc
2b93 : 85 03 __ STA WORK + 0 
2b95 : a9 3a __ LDA #$3a
2b97 : 85 06 __ STA WORK + 3 
2b99 : a9 4d __ LDA #$4d
2b9b : 85 04 __ STA WORK + 1 
2b9d : a9 f8 __ LDA #$f8
2b9f : 85 05 __ STA WORK + 2 
2ba1 : 20 31 4e JSR $4e31 ; (freg + 20)
2ba4 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2ba7 : a9 70 __ LDA #$70
2ba9 : 85 03 __ STA WORK + 0 
2bab : a9 3c __ LDA #$3c
2bad : 85 06 __ STA WORK + 3 
2baf : a9 7c __ LDA #$7c
2bb1 : 85 04 __ STA WORK + 1 
2bb3 : a9 12 __ LDA #$12
2bb5 : 85 05 __ STA WORK + 2 
2bb7 : 20 31 4e JSR $4e31 ; (freg + 20)
2bba : 20 68 4e JSR $4e68 ; (faddsub + 6)
2bbd : a2 43 __ LDX #$43
2bbf : 20 21 4e JSR $4e21 ; (freg + 4)
2bc2 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2bc5 : a9 42 __ LDA #$42
2bc7 : 85 03 __ STA WORK + 0 
2bc9 : a9 3d __ LDA #$3d
2bcb : 85 06 __ STA WORK + 3 
2bcd : a9 de __ LDA #$de
2bcf : 85 04 __ STA WORK + 1 
2bd1 : a9 64 __ LDA #$64
2bd3 : 85 05 __ STA WORK + 2 
2bd5 : 20 31 4e JSR $4e31 ; (freg + 20)
2bd8 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2bdb : a2 43 __ LDX #$43
2bdd : 20 21 4e JSR $4e21 ; (freg + 4)
2be0 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2be3 : a9 2e __ LDA #$2e
2be5 : 85 03 __ STA WORK + 0 
2be7 : a9 3e __ LDA #$3e
2be9 : 85 06 __ STA WORK + 3 
2beb : a9 e5 __ LDA #$e5
2bed : 85 04 __ STA WORK + 1 
2bef : a9 75 __ LDA #$75
2bf1 : 85 05 __ STA WORK + 2 
2bf3 : 20 31 4e JSR $4e31 ; (freg + 20)
2bf6 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2bf9 : a2 43 __ LDX #$43
2bfb : 20 21 4e JSR $4e21 ; (freg + 4)
2bfe : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2c01 : a9 b7 __ LDA #$b7
2c03 : 85 03 __ STA WORK + 0 
2c05 : a9 3f __ LDA #$3f
2c07 : 85 06 __ STA WORK + 3 
2c09 : a9 72 __ LDA #$72
2c0b : 85 04 __ STA WORK + 1 
2c0d : a9 31 __ LDA #$31
2c0f : 85 05 __ STA WORK + 2 
2c11 : 20 31 4e JSR $4e31 ; (freg + 20)
2c14 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2c17 : a2 43 __ LDX #$43
2c19 : 20 21 4e JSR $4e21 ; (freg + 4)
2c1c : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2c1f : a9 00 __ LDA #$00
2c21 : 85 03 __ STA WORK + 0 
2c23 : 85 04 __ STA WORK + 1 
2c25 : a9 80 __ LDA #$80
2c27 : 85 05 __ STA WORK + 2 
2c29 : a9 3f __ LDA #$3f
2c2b : 85 06 __ STA WORK + 3 
2c2d : 20 31 4e JSR $4e31 ; (freg + 20)
2c30 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2c33 : ad ba c7 LDA $c7ba ; (x + 0)
2c36 : 85 03 __ STA WORK + 0 
2c38 : ad bb c7 LDA $c7bb ; (x + 1)
2c3b : 85 04 __ STA WORK + 1 
2c3d : ad bc c7 LDA $c7bc ; (x + 2)
2c40 : 85 05 __ STA WORK + 2 
2c42 : ad bd c7 LDA $c7bd ; (x + 3)
2c45 : 85 06 __ STA WORK + 3 
2c47 : 20 31 4e JSR $4e31 ; (freg + 20)
2c4a : 4c 4f 4f JMP $4f4f ; (crt_fmul + 0)
--------------------------------------------------------------------
2c4d : __ __ __ BYT 50 72 6f 6a 65 63 74 69 6e 67 20 76 65 72 74 69 : Projecting verti
2c5d : __ __ __ BYT 63 65 73 00                                     : ces.
--------------------------------------------------------------------
vec3_norm: ; vec3_norm(struct Vector3*)->void
; 103, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2c61 : a5 15 __ LDA P8 ; (v + 0)
2c63 : 85 13 __ STA P6 
2c65 : a5 16 __ LDA P9 ; (v + 1)
2c67 : 85 14 __ STA P7 
2c69 : 20 f7 2c JSR $2cf7 ; (vec3_length.s4 + 0)
2c6c : a5 1b __ LDA ACCU + 0 
2c6e : 85 43 __ STA T0 + 0 
2c70 : a5 1c __ LDA ACCU + 1 
2c72 : 85 44 __ STA T0 + 1 
2c74 : a5 1d __ LDA ACCU + 2 
2c76 : 85 45 __ STA T0 + 2 
2c78 : a5 1e __ LDA ACCU + 3 
2c7a : 85 46 __ STA T0 + 3 
2c7c : a5 15 __ LDA P8 ; (v + 0)
2c7e : 85 0d __ STA P0 
2c80 : a5 16 __ LDA P9 ; (v + 1)
2c82 : 85 0e __ STA P1 
2c84 : a9 00 __ LDA #$00
2c86 : 85 1b __ STA ACCU + 0 
2c88 : 85 1c __ STA ACCU + 1 
2c8a : a9 80 __ LDA #$80
2c8c : 85 1d __ STA ACCU + 2 
2c8e : a9 3f __ LDA #$3f
2c90 : 85 1e __ STA ACCU + 3 
2c92 : a2 43 __ LDX #$43
2c94 : 20 21 4e JSR $4e21 ; (freg + 4)
2c97 : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
2c9a : a5 1b __ LDA ACCU + 0 
2c9c : 85 0f __ STA P2 
2c9e : a5 1c __ LDA ACCU + 1 
2ca0 : 85 10 __ STA P3 
2ca2 : a5 1d __ LDA ACCU + 2 
2ca4 : 85 11 __ STA P4 
2ca6 : a5 1e __ LDA ACCU + 3 
2ca8 : 85 12 __ STA P5 
2caa : 4c ad 2c JMP $2cad ; (vec3_scale.s4 + 0)
--------------------------------------------------------------------
vec3_scale: ; vec3_scale(struct Vector3*,float)->void
;  91, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2cad : a5 0f __ LDA P2 ; (s + 0)
2caf : 85 43 __ STA T0 + 0 
2cb1 : a5 10 __ LDA P3 ; (s + 1)
2cb3 : 85 44 __ STA T0 + 1 
2cb5 : a5 11 __ LDA P4 ; (s + 2)
2cb7 : 85 45 __ STA T0 + 2 
2cb9 : a5 12 __ LDA P5 ; (s + 3)
2cbb : 85 46 __ STA T0 + 3 
2cbd : a0 00 __ LDY #$00
.l5:
2cbf : 84 47 __ STY T2 + 0 
2cc1 : b1 0d __ LDA (P0),y ; (vd + 0)
2cc3 : 85 1b __ STA ACCU + 0 
2cc5 : c8 __ __ INY
2cc6 : b1 0d __ LDA (P0),y ; (vd + 0)
2cc8 : 85 1c __ STA ACCU + 1 
2cca : c8 __ __ INY
2ccb : b1 0d __ LDA (P0),y ; (vd + 0)
2ccd : 85 1d __ STA ACCU + 2 
2ccf : c8 __ __ INY
2cd0 : b1 0d __ LDA (P0),y ; (vd + 0)
2cd2 : 85 1e __ STA ACCU + 3 
2cd4 : a2 43 __ LDX #$43
2cd6 : 20 21 4e JSR $4e21 ; (freg + 4)
2cd9 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2cdc : a5 1b __ LDA ACCU + 0 
2cde : a4 47 __ LDY T2 + 0 
2ce0 : 91 0d __ STA (P0),y ; (vd + 0)
2ce2 : a5 1c __ LDA ACCU + 1 
2ce4 : c8 __ __ INY
2ce5 : 91 0d __ STA (P0),y ; (vd + 0)
2ce7 : a5 1d __ LDA ACCU + 2 
2ce9 : c8 __ __ INY
2cea : 91 0d __ STA (P0),y ; (vd + 0)
2cec : a5 1e __ LDA ACCU + 3 
2cee : c8 __ __ INY
2cef : 91 0d __ STA (P0),y ; (vd + 0)
2cf1 : c8 __ __ INY
2cf2 : c0 0c __ CPY #$0c
2cf4 : d0 c9 __ BNE $2cbf ; (vec3_scale.l5 + 0)
.s3:
2cf6 : 60 __ __ RTS
--------------------------------------------------------------------
vec3_length: ; vec3_length(const struct Vector3*)->float
; 105, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2cf7 : a5 13 __ LDA P6 ; (v + 0)
2cf9 : 85 0f __ STA P2 
2cfb : 85 0d __ STA P0 
2cfd : a5 14 __ LDA P7 ; (v + 1)
2cff : 85 10 __ STA P3 
2d01 : 85 0e __ STA P1 
2d03 : 20 19 2d JSR $2d19 ; (vec3_vmul.s4 + 0)
2d06 : a5 1b __ LDA ACCU + 0 
2d08 : 85 0d __ STA P0 
2d0a : a5 1c __ LDA ACCU + 1 
2d0c : 85 0e __ STA P1 
2d0e : a5 1d __ LDA ACCU + 2 
2d10 : 85 0f __ STA P2 
2d12 : a5 1e __ LDA ACCU + 3 
2d14 : 85 10 __ STA P3 
2d16 : 4c 98 29 JMP $2998 ; (sqrt.s4 + 0)
--------------------------------------------------------------------
vec3_vmul: ; vec3_vmul(const struct Vector3*,const struct Vector3*)->float
; 101, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2d19 : a0 08 __ LDY #$08
2d1b : b1 0d __ LDA (P0),y ; (v1 + 0)
2d1d : 85 43 __ STA T0 + 0 
2d1f : c8 __ __ INY
2d20 : b1 0d __ LDA (P0),y ; (v1 + 0)
2d22 : 85 44 __ STA T0 + 1 
2d24 : c8 __ __ INY
2d25 : b1 0d __ LDA (P0),y ; (v1 + 0)
2d27 : 85 45 __ STA T0 + 2 
2d29 : c8 __ __ INY
2d2a : b1 0d __ LDA (P0),y ; (v1 + 0)
2d2c : 85 46 __ STA T0 + 3 
2d2e : a0 08 __ LDY #$08
2d30 : b1 0f __ LDA (P2),y ; (v2 + 0)
2d32 : 85 1b __ STA ACCU + 0 
2d34 : c8 __ __ INY
2d35 : b1 0f __ LDA (P2),y ; (v2 + 0)
2d37 : 85 1c __ STA ACCU + 1 
2d39 : c8 __ __ INY
2d3a : b1 0f __ LDA (P2),y ; (v2 + 0)
2d3c : 85 1d __ STA ACCU + 2 
2d3e : c8 __ __ INY
2d3f : b1 0f __ LDA (P2),y ; (v2 + 0)
2d41 : 85 1e __ STA ACCU + 3 
2d43 : a2 43 __ LDX #$43
2d45 : 20 21 4e JSR $4e21 ; (freg + 4)
2d48 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2d4b : a5 1b __ LDA ACCU + 0 
2d4d : 85 43 __ STA T0 + 0 
2d4f : a5 1c __ LDA ACCU + 1 
2d51 : 85 44 __ STA T0 + 1 
2d53 : a5 1d __ LDA ACCU + 2 
2d55 : 85 45 __ STA T0 + 2 
2d57 : a5 1e __ LDA ACCU + 3 
2d59 : 85 46 __ STA T0 + 3 
2d5b : a0 04 __ LDY #$04
2d5d : b1 0f __ LDA (P2),y ; (v2 + 0)
2d5f : 85 1b __ STA ACCU + 0 
2d61 : c8 __ __ INY
2d62 : b1 0f __ LDA (P2),y ; (v2 + 0)
2d64 : 85 1c __ STA ACCU + 1 
2d66 : c8 __ __ INY
2d67 : b1 0f __ LDA (P2),y ; (v2 + 0)
2d69 : 85 1d __ STA ACCU + 2 
2d6b : c8 __ __ INY
2d6c : b1 0f __ LDA (P2),y ; (v2 + 0)
2d6e : 85 1e __ STA ACCU + 3 
2d70 : a0 04 __ LDY #$04
2d72 : b1 0d __ LDA (P0),y ; (v1 + 0)
2d74 : 85 03 __ STA WORK + 0 
2d76 : c8 __ __ INY
2d77 : b1 0d __ LDA (P0),y ; (v1 + 0)
2d79 : 85 04 __ STA WORK + 1 
2d7b : c8 __ __ INY
2d7c : b1 0d __ LDA (P0),y ; (v1 + 0)
2d7e : 85 05 __ STA WORK + 2 
2d80 : c8 __ __ INY
2d81 : b1 0d __ LDA (P0),y ; (v1 + 0)
2d83 : 85 06 __ STA WORK + 3 
2d85 : 20 31 4e JSR $4e31 ; (freg + 20)
2d88 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2d8b : a5 1b __ LDA ACCU + 0 
2d8d : 85 47 __ STA T1 + 0 
2d8f : a5 1c __ LDA ACCU + 1 
2d91 : 85 48 __ STA T1 + 1 
2d93 : a5 1d __ LDA ACCU + 2 
2d95 : 85 49 __ STA T1 + 2 
2d97 : a5 1e __ LDA ACCU + 3 
2d99 : 85 4a __ STA T1 + 3 
2d9b : a0 00 __ LDY #$00
2d9d : b1 0f __ LDA (P2),y ; (v2 + 0)
2d9f : 85 1b __ STA ACCU + 0 
2da1 : c8 __ __ INY
2da2 : b1 0f __ LDA (P2),y ; (v2 + 0)
2da4 : 85 1c __ STA ACCU + 1 
2da6 : c8 __ __ INY
2da7 : b1 0f __ LDA (P2),y ; (v2 + 0)
2da9 : 85 1d __ STA ACCU + 2 
2dab : c8 __ __ INY
2dac : b1 0f __ LDA (P2),y ; (v2 + 0)
2dae : 85 1e __ STA ACCU + 3 
2db0 : a0 00 __ LDY #$00
2db2 : b1 0d __ LDA (P0),y ; (v1 + 0)
2db4 : 85 03 __ STA WORK + 0 
2db6 : c8 __ __ INY
2db7 : b1 0d __ LDA (P0),y ; (v1 + 0)
2db9 : 85 04 __ STA WORK + 1 
2dbb : c8 __ __ INY
2dbc : b1 0d __ LDA (P0),y ; (v1 + 0)
2dbe : 85 05 __ STA WORK + 2 
2dc0 : c8 __ __ INY
2dc1 : b1 0d __ LDA (P0),y ; (v1 + 0)
2dc3 : 85 06 __ STA WORK + 3 
2dc5 : 20 31 4e JSR $4e31 ; (freg + 20)
2dc8 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2dcb : a2 47 __ LDX #$47
2dcd : 20 21 4e JSR $4e21 ; (freg + 4)
2dd0 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2dd3 : a2 43 __ LDX #$43
2dd5 : 20 21 4e JSR $4e21 ; (freg + 4)
2dd8 : 4c 68 4e JMP $4e68 ; (faddsub + 6)
--------------------------------------------------------------------
mat4_scale: ; mat4_scale(struct Matrix4*,float)->void
; 227, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2ddb : a5 0f __ LDA P2 ; (s + 0)
2ddd : 85 43 __ STA T0 + 0 
2ddf : a5 10 __ LDA P3 ; (s + 1)
2de1 : 85 44 __ STA T0 + 1 
2de3 : a5 11 __ LDA P4 ; (s + 2)
2de5 : 85 45 __ STA T0 + 2 
2de7 : a5 12 __ LDA P5 ; (s + 3)
2de9 : 85 46 __ STA T0 + 3 
2deb : a0 00 __ LDY #$00
.l5:
2ded : 84 47 __ STY T2 + 0 
2def : b1 0d __ LDA (P0),y ; (md + 0)
2df1 : 85 1b __ STA ACCU + 0 
2df3 : c8 __ __ INY
2df4 : b1 0d __ LDA (P0),y ; (md + 0)
2df6 : 85 1c __ STA ACCU + 1 
2df8 : c8 __ __ INY
2df9 : b1 0d __ LDA (P0),y ; (md + 0)
2dfb : 85 1d __ STA ACCU + 2 
2dfd : c8 __ __ INY
2dfe : b1 0d __ LDA (P0),y ; (md + 0)
2e00 : 85 1e __ STA ACCU + 3 
2e02 : a2 43 __ LDX #$43
2e04 : 20 21 4e JSR $4e21 ; (freg + 4)
2e07 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
2e0a : a5 1b __ LDA ACCU + 0 
2e0c : a4 47 __ LDY T2 + 0 
2e0e : 91 0d __ STA (P0),y ; (md + 0)
2e10 : a5 1c __ LDA ACCU + 1 
2e12 : c8 __ __ INY
2e13 : 91 0d __ STA (P0),y ; (md + 0)
2e15 : a5 1d __ LDA ACCU + 2 
2e17 : c8 __ __ INY
2e18 : 91 0d __ STA (P0),y ; (md + 0)
2e1a : a5 1e __ LDA ACCU + 3 
2e1c : c8 __ __ INY
2e1d : 91 0d __ STA (P0),y ; (md + 0)
2e1f : c8 __ __ INY
2e20 : c0 40 __ CPY #$40
2e22 : d0 c9 __ BNE $2ded ; (mat4_scale.l5 + 0)
.s3:
2e24 : 60 __ __ RTS
--------------------------------------------------------------------
mat4_set_rotate_x: ; mat4_set_rotate_x(struct Matrix4*,float)->void
; 246, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2e25 : ad be c7 LDA $c7be ; (sstack + 0)
2e28 : 85 4b __ STA T1 + 0 
2e2a : ad bf c7 LDA $c7bf ; (sstack + 1)
2e2d : 85 4c __ STA T1 + 1 
2e2f : ad c0 c7 LDA $c7c0 ; (sstack + 2)
2e32 : 85 4d __ STA T1 + 2 
2e34 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
2e37 : 85 4e __ STA T1 + 3 
2e39 : a9 db __ LDA #$db
2e3b : 85 1b __ STA ACCU + 0 ; (a + 2)
2e3d : a9 3f __ LDA #$3f
2e3f : 85 1e __ STA ACCU + 3 
2e41 : a9 0f __ LDA #$0f
2e43 : 85 1c __ STA ACCU + 1 ; (a + 3)
2e45 : a9 c9 __ LDA #$c9
2e47 : 85 1d __ STA ACCU + 2 
2e49 : a2 4b __ LDX #$4b
2e4b : 20 21 4e JSR $4e21 ; (freg + 4)
2e4e : 20 68 4e JSR $4e68 ; (faddsub + 6)
2e51 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2e53 : 85 0d __ STA P0 
2e55 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2e57 : 85 0e __ STA P1 
2e59 : a5 1d __ LDA ACCU + 2 
2e5b : 85 0f __ STA P2 
2e5d : a5 1e __ LDA ACCU + 3 
2e5f : 85 10 __ STA P3 
2e61 : 20 01 28 JSR $2801 ; (sin.s4 + 0)
2e64 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2e66 : 85 4f __ STA T2 + 0 
2e68 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2e6a : 85 50 __ STA T2 + 1 
2e6c : a5 1d __ LDA ACCU + 2 
2e6e : 85 51 __ STA T2 + 2 
2e70 : a5 1e __ LDA ACCU + 3 
2e72 : 85 52 __ STA T2 + 3 
2e74 : a5 4b __ LDA T1 + 0 
2e76 : 85 0d __ STA P0 
2e78 : a5 4c __ LDA T1 + 1 
2e7a : 85 0e __ STA P1 
2e7c : a5 4d __ LDA T1 + 2 
2e7e : 85 0f __ STA P2 
2e80 : a5 4e __ LDA T1 + 3 
2e82 : 85 10 __ STA P3 
2e84 : 20 01 28 JSR $2801 ; (sin.s4 + 0)
2e87 : a5 1e __ LDA ACCU + 3 
2e89 : 49 80 __ EOR #$80
2e8b : a0 1b __ LDY #$1b
2e8d : 91 15 __ STA (P8),y ; (m + 0)
2e8f : a9 00 __ LDA #$00
2e91 : a8 __ __ TAY
2e92 : 91 15 __ STA (P8),y ; (m + 0)
2e94 : c8 __ __ INY
2e95 : 91 15 __ STA (P8),y ; (m + 0)
2e97 : a9 80 __ LDA #$80
2e99 : c8 __ __ INY
2e9a : 91 15 __ STA (P8),y ; (m + 0)
2e9c : a9 3f __ LDA #$3f
2e9e : c8 __ __ INY
2e9f : 91 15 __ STA (P8),y ; (m + 0)
2ea1 : a9 00 __ LDA #$00
2ea3 : c8 __ __ INY
2ea4 : 91 15 __ STA (P8),y ; (m + 0)
2ea6 : c8 __ __ INY
2ea7 : 91 15 __ STA (P8),y ; (m + 0)
2ea9 : c8 __ __ INY
2eaa : 91 15 __ STA (P8),y ; (m + 0)
2eac : c8 __ __ INY
2ead : 91 15 __ STA (P8),y ; (m + 0)
2eaf : c8 __ __ INY
2eb0 : 91 15 __ STA (P8),y ; (m + 0)
2eb2 : c8 __ __ INY
2eb3 : 91 15 __ STA (P8),y ; (m + 0)
2eb5 : c8 __ __ INY
2eb6 : 91 15 __ STA (P8),y ; (m + 0)
2eb8 : c8 __ __ INY
2eb9 : 91 15 __ STA (P8),y ; (m + 0)
2ebb : c8 __ __ INY
2ebc : 91 15 __ STA (P8),y ; (m + 0)
2ebe : c8 __ __ INY
2ebf : 91 15 __ STA (P8),y ; (m + 0)
2ec1 : c8 __ __ INY
2ec2 : 91 15 __ STA (P8),y ; (m + 0)
2ec4 : c8 __ __ INY
2ec5 : 91 15 __ STA (P8),y ; (m + 0)
2ec7 : c8 __ __ INY
2ec8 : 91 15 __ STA (P8),y ; (m + 0)
2eca : c8 __ __ INY
2ecb : 91 15 __ STA (P8),y ; (m + 0)
2ecd : c8 __ __ INY
2ece : 91 15 __ STA (P8),y ; (m + 0)
2ed0 : c8 __ __ INY
2ed1 : 91 15 __ STA (P8),y ; (m + 0)
2ed3 : a5 4f __ LDA T2 + 0 
2ed5 : c8 __ __ INY
2ed6 : 91 15 __ STA (P8),y ; (m + 0)
2ed8 : a5 50 __ LDA T2 + 1 
2eda : c8 __ __ INY
2edb : 91 15 __ STA (P8),y ; (m + 0)
2edd : a5 51 __ LDA T2 + 2 
2edf : c8 __ __ INY
2ee0 : 91 15 __ STA (P8),y ; (m + 0)
2ee2 : a5 52 __ LDA T2 + 3 
2ee4 : c8 __ __ INY
2ee5 : 91 15 __ STA (P8),y ; (m + 0)
2ee7 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2ee9 : c8 __ __ INY
2eea : 91 15 __ STA (P8),y ; (m + 0)
2eec : a5 1c __ LDA ACCU + 1 ; (a + 3)
2eee : c8 __ __ INY
2eef : 91 15 __ STA (P8),y ; (m + 0)
2ef1 : a5 1d __ LDA ACCU + 2 
2ef3 : c8 __ __ INY
2ef4 : 91 15 __ STA (P8),y ; (m + 0)
2ef6 : a9 00 __ LDA #$00
2ef8 : a0 1c __ LDY #$1c
2efa : 91 15 __ STA (P8),y ; (m + 0)
2efc : c8 __ __ INY
2efd : 91 15 __ STA (P8),y ; (m + 0)
2eff : c8 __ __ INY
2f00 : 91 15 __ STA (P8),y ; (m + 0)
2f02 : c8 __ __ INY
2f03 : 91 15 __ STA (P8),y ; (m + 0)
2f05 : c8 __ __ INY
2f06 : 91 15 __ STA (P8),y ; (m + 0)
2f08 : c8 __ __ INY
2f09 : 91 15 __ STA (P8),y ; (m + 0)
2f0b : c8 __ __ INY
2f0c : 91 15 __ STA (P8),y ; (m + 0)
2f0e : c8 __ __ INY
2f0f : 91 15 __ STA (P8),y ; (m + 0)
2f11 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2f13 : c8 __ __ INY
2f14 : 91 15 __ STA (P8),y ; (m + 0)
2f16 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2f18 : c8 __ __ INY
2f19 : 91 15 __ STA (P8),y ; (m + 0)
2f1b : a5 1d __ LDA ACCU + 2 
2f1d : c8 __ __ INY
2f1e : 91 15 __ STA (P8),y ; (m + 0)
2f20 : a5 1e __ LDA ACCU + 3 
2f22 : c8 __ __ INY
2f23 : 91 15 __ STA (P8),y ; (m + 0)
2f25 : a5 4f __ LDA T2 + 0 
2f27 : c8 __ __ INY
2f28 : 91 15 __ STA (P8),y ; (m + 0)
2f2a : a5 50 __ LDA T2 + 1 
2f2c : c8 __ __ INY
2f2d : 91 15 __ STA (P8),y ; (m + 0)
2f2f : a5 51 __ LDA T2 + 2 
2f31 : c8 __ __ INY
2f32 : 91 15 __ STA (P8),y ; (m + 0)
2f34 : a5 52 __ LDA T2 + 3 
2f36 : c8 __ __ INY
2f37 : 91 15 __ STA (P8),y ; (m + 0)
2f39 : a9 00 __ LDA #$00
2f3b : c8 __ __ INY
2f3c : 91 15 __ STA (P8),y ; (m + 0)
2f3e : c8 __ __ INY
2f3f : 91 15 __ STA (P8),y ; (m + 0)
2f41 : c8 __ __ INY
2f42 : 91 15 __ STA (P8),y ; (m + 0)
2f44 : c8 __ __ INY
2f45 : 91 15 __ STA (P8),y ; (m + 0)
2f47 : c8 __ __ INY
2f48 : 91 15 __ STA (P8),y ; (m + 0)
2f4a : c8 __ __ INY
2f4b : 91 15 __ STA (P8),y ; (m + 0)
2f4d : c8 __ __ INY
2f4e : 91 15 __ STA (P8),y ; (m + 0)
2f50 : c8 __ __ INY
2f51 : 91 15 __ STA (P8),y ; (m + 0)
2f53 : c8 __ __ INY
2f54 : 91 15 __ STA (P8),y ; (m + 0)
2f56 : c8 __ __ INY
2f57 : 91 15 __ STA (P8),y ; (m + 0)
2f59 : c8 __ __ INY
2f5a : 91 15 __ STA (P8),y ; (m + 0)
2f5c : c8 __ __ INY
2f5d : 91 15 __ STA (P8),y ; (m + 0)
2f5f : c8 __ __ INY
2f60 : 91 15 __ STA (P8),y ; (m + 0)
2f62 : c8 __ __ INY
2f63 : 91 15 __ STA (P8),y ; (m + 0)
2f65 : c8 __ __ INY
2f66 : 91 15 __ STA (P8),y ; (m + 0)
2f68 : c8 __ __ INY
2f69 : 91 15 __ STA (P8),y ; (m + 0)
2f6b : c8 __ __ INY
2f6c : 91 15 __ STA (P8),y ; (m + 0)
2f6e : c8 __ __ INY
2f6f : 91 15 __ STA (P8),y ; (m + 0)
2f71 : a9 80 __ LDA #$80
2f73 : c8 __ __ INY
2f74 : 91 15 __ STA (P8),y ; (m + 0)
2f76 : a9 3f __ LDA #$3f
2f78 : a8 __ __ TAY
2f79 : 91 15 __ STA (P8),y ; (m + 0)
.s3:
2f7b : 60 __ __ RTS
--------------------------------------------------------------------
mat4_set_rotate_y: ; mat4_set_rotate_y(struct Matrix4*,float)->void
; 248, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2f7c : ad be c7 LDA $c7be ; (sstack + 0)
2f7f : 85 4b __ STA T1 + 0 
2f81 : ad bf c7 LDA $c7bf ; (sstack + 1)
2f84 : 85 4c __ STA T1 + 1 
2f86 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
2f89 : 85 4d __ STA T1 + 2 
2f8b : ad c1 c7 LDA $c7c1 ; (sstack + 3)
2f8e : 85 4e __ STA T1 + 3 
2f90 : a9 db __ LDA #$db
2f92 : 85 1b __ STA ACCU + 0 ; (a + 2)
2f94 : a9 3f __ LDA #$3f
2f96 : 85 1e __ STA ACCU + 3 
2f98 : a9 0f __ LDA #$0f
2f9a : 85 1c __ STA ACCU + 1 ; (a + 3)
2f9c : a9 c9 __ LDA #$c9
2f9e : 85 1d __ STA ACCU + 2 
2fa0 : a2 4b __ LDX #$4b
2fa2 : 20 21 4e JSR $4e21 ; (freg + 4)
2fa5 : 20 68 4e JSR $4e68 ; (faddsub + 6)
2fa8 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2faa : 85 0d __ STA P0 
2fac : a5 1c __ LDA ACCU + 1 ; (a + 3)
2fae : 85 0e __ STA P1 
2fb0 : a5 1d __ LDA ACCU + 2 
2fb2 : 85 0f __ STA P2 
2fb4 : a5 1e __ LDA ACCU + 3 
2fb6 : 85 10 __ STA P3 
2fb8 : 20 01 28 JSR $2801 ; (sin.s4 + 0)
2fbb : a5 1b __ LDA ACCU + 0 ; (a + 2)
2fbd : 85 4f __ STA T2 + 0 
2fbf : a5 1c __ LDA ACCU + 1 ; (a + 3)
2fc1 : 85 50 __ STA T2 + 1 
2fc3 : a5 1d __ LDA ACCU + 2 
2fc5 : 85 51 __ STA T2 + 2 
2fc7 : a5 1e __ LDA ACCU + 3 
2fc9 : 85 52 __ STA T2 + 3 
2fcb : a5 4b __ LDA T1 + 0 
2fcd : 85 0d __ STA P0 
2fcf : a5 4c __ LDA T1 + 1 
2fd1 : 85 0e __ STA P1 
2fd3 : a5 4d __ LDA T1 + 2 
2fd5 : 85 0f __ STA P2 
2fd7 : a5 4e __ LDA T1 + 3 
2fd9 : 85 10 __ STA P3 
2fdb : 20 01 28 JSR $2801 ; (sin.s4 + 0)
2fde : a5 1e __ LDA ACCU + 3 
2fe0 : 49 80 __ EOR #$80
2fe2 : a0 0b __ LDY #$0b
2fe4 : 91 15 __ STA (P8),y ; (m + 0)
2fe6 : a5 4f __ LDA T2 + 0 
2fe8 : a0 00 __ LDY #$00
2fea : 91 15 __ STA (P8),y ; (m + 0)
2fec : a5 50 __ LDA T2 + 1 
2fee : c8 __ __ INY
2fef : 91 15 __ STA (P8),y ; (m + 0)
2ff1 : a5 51 __ LDA T2 + 2 
2ff3 : c8 __ __ INY
2ff4 : 91 15 __ STA (P8),y ; (m + 0)
2ff6 : a5 52 __ LDA T2 + 3 
2ff8 : c8 __ __ INY
2ff9 : 91 15 __ STA (P8),y ; (m + 0)
2ffb : a9 00 __ LDA #$00
2ffd : c8 __ __ INY
2ffe : 91 15 __ STA (P8),y ; (m + 0)
3000 : c8 __ __ INY
3001 : 91 15 __ STA (P8),y ; (m + 0)
3003 : c8 __ __ INY
3004 : 91 15 __ STA (P8),y ; (m + 0)
3006 : c8 __ __ INY
3007 : 91 15 __ STA (P8),y ; (m + 0)
3009 : a5 1b __ LDA ACCU + 0 ; (a + 2)
300b : c8 __ __ INY
300c : 91 15 __ STA (P8),y ; (m + 0)
300e : a5 1c __ LDA ACCU + 1 ; (a + 3)
3010 : c8 __ __ INY
3011 : 91 15 __ STA (P8),y ; (m + 0)
3013 : a5 1d __ LDA ACCU + 2 
3015 : c8 __ __ INY
3016 : 91 15 __ STA (P8),y ; (m + 0)
3018 : a9 00 __ LDA #$00
301a : a0 0c __ LDY #$0c
301c : 91 15 __ STA (P8),y ; (m + 0)
301e : c8 __ __ INY
301f : 91 15 __ STA (P8),y ; (m + 0)
3021 : c8 __ __ INY
3022 : 91 15 __ STA (P8),y ; (m + 0)
3024 : c8 __ __ INY
3025 : 91 15 __ STA (P8),y ; (m + 0)
3027 : c8 __ __ INY
3028 : 91 15 __ STA (P8),y ; (m + 0)
302a : c8 __ __ INY
302b : 91 15 __ STA (P8),y ; (m + 0)
302d : c8 __ __ INY
302e : 91 15 __ STA (P8),y ; (m + 0)
3030 : c8 __ __ INY
3031 : 91 15 __ STA (P8),y ; (m + 0)
3033 : c8 __ __ INY
3034 : 91 15 __ STA (P8),y ; (m + 0)
3036 : c8 __ __ INY
3037 : 91 15 __ STA (P8),y ; (m + 0)
3039 : a9 80 __ LDA #$80
303b : c8 __ __ INY
303c : 91 15 __ STA (P8),y ; (m + 0)
303e : a9 3f __ LDA #$3f
3040 : c8 __ __ INY
3041 : 91 15 __ STA (P8),y ; (m + 0)
3043 : a9 00 __ LDA #$00
3045 : c8 __ __ INY
3046 : 91 15 __ STA (P8),y ; (m + 0)
3048 : c8 __ __ INY
3049 : 91 15 __ STA (P8),y ; (m + 0)
304b : c8 __ __ INY
304c : 91 15 __ STA (P8),y ; (m + 0)
304e : c8 __ __ INY
304f : 91 15 __ STA (P8),y ; (m + 0)
3051 : c8 __ __ INY
3052 : 91 15 __ STA (P8),y ; (m + 0)
3054 : c8 __ __ INY
3055 : 91 15 __ STA (P8),y ; (m + 0)
3057 : c8 __ __ INY
3058 : 91 15 __ STA (P8),y ; (m + 0)
305a : c8 __ __ INY
305b : 91 15 __ STA (P8),y ; (m + 0)
305d : a5 1b __ LDA ACCU + 0 ; (a + 2)
305f : c8 __ __ INY
3060 : 91 15 __ STA (P8),y ; (m + 0)
3062 : a5 1c __ LDA ACCU + 1 ; (a + 3)
3064 : c8 __ __ INY
3065 : 91 15 __ STA (P8),y ; (m + 0)
3067 : a5 1d __ LDA ACCU + 2 
3069 : c8 __ __ INY
306a : 91 15 __ STA (P8),y ; (m + 0)
306c : a5 1e __ LDA ACCU + 3 
306e : c8 __ __ INY
306f : 91 15 __ STA (P8),y ; (m + 0)
3071 : a9 00 __ LDA #$00
3073 : c8 __ __ INY
3074 : 91 15 __ STA (P8),y ; (m + 0)
3076 : c8 __ __ INY
3077 : 91 15 __ STA (P8),y ; (m + 0)
3079 : c8 __ __ INY
307a : 91 15 __ STA (P8),y ; (m + 0)
307c : c8 __ __ INY
307d : 91 15 __ STA (P8),y ; (m + 0)
307f : a5 4f __ LDA T2 + 0 
3081 : c8 __ __ INY
3082 : 91 15 __ STA (P8),y ; (m + 0)
3084 : a5 50 __ LDA T2 + 1 
3086 : c8 __ __ INY
3087 : 91 15 __ STA (P8),y ; (m + 0)
3089 : a5 51 __ LDA T2 + 2 
308b : c8 __ __ INY
308c : 91 15 __ STA (P8),y ; (m + 0)
308e : a5 52 __ LDA T2 + 3 
3090 : c8 __ __ INY
3091 : 91 15 __ STA (P8),y ; (m + 0)
3093 : a9 00 __ LDA #$00
3095 : c8 __ __ INY
3096 : 91 15 __ STA (P8),y ; (m + 0)
3098 : c8 __ __ INY
3099 : 91 15 __ STA (P8),y ; (m + 0)
309b : c8 __ __ INY
309c : 91 15 __ STA (P8),y ; (m + 0)
309e : c8 __ __ INY
309f : 91 15 __ STA (P8),y ; (m + 0)
30a1 : c8 __ __ INY
30a2 : 91 15 __ STA (P8),y ; (m + 0)
30a4 : c8 __ __ INY
30a5 : 91 15 __ STA (P8),y ; (m + 0)
30a7 : c8 __ __ INY
30a8 : 91 15 __ STA (P8),y ; (m + 0)
30aa : c8 __ __ INY
30ab : 91 15 __ STA (P8),y ; (m + 0)
30ad : c8 __ __ INY
30ae : 91 15 __ STA (P8),y ; (m + 0)
30b0 : c8 __ __ INY
30b1 : 91 15 __ STA (P8),y ; (m + 0)
30b3 : c8 __ __ INY
30b4 : 91 15 __ STA (P8),y ; (m + 0)
30b6 : c8 __ __ INY
30b7 : 91 15 __ STA (P8),y ; (m + 0)
30b9 : c8 __ __ INY
30ba : 91 15 __ STA (P8),y ; (m + 0)
30bc : c8 __ __ INY
30bd : 91 15 __ STA (P8),y ; (m + 0)
30bf : c8 __ __ INY
30c0 : 91 15 __ STA (P8),y ; (m + 0)
30c2 : c8 __ __ INY
30c3 : 91 15 __ STA (P8),y ; (m + 0)
30c5 : c8 __ __ INY
30c6 : 91 15 __ STA (P8),y ; (m + 0)
30c8 : c8 __ __ INY
30c9 : 91 15 __ STA (P8),y ; (m + 0)
30cb : a9 80 __ LDA #$80
30cd : c8 __ __ INY
30ce : 91 15 __ STA (P8),y ; (m + 0)
30d0 : a9 3f __ LDA #$3f
30d2 : a8 __ __ TAY
30d3 : 91 15 __ STA (P8),y ; (m + 0)
.s3:
30d5 : 60 __ __ RTS
--------------------------------------------------------------------
mat4_rmmul: ; mat4_rmmul(struct Matrix4*,const struct Matrix4*)->void
; 233, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
30d6 : a5 53 __ LDA T9 + 0 
30d8 : 8d 9e c7 STA $c79e ; (mat4_rmmul@stack + 0)
30db : a5 54 __ LDA T9 + 1 
30dd : 8d 9f c7 STA $c79f ; (mat4_rmmul@stack + 1)
.s4:
30e0 : a9 00 __ LDA #$00
.l5:
30e2 : 85 4f __ STA T5 + 0 
30e4 : 0a __ __ ASL
30e5 : 0a __ __ ASL
30e6 : 18 __ __ CLC
30e7 : 65 0d __ ADC P0 ; (md + 0)
30e9 : 85 50 __ STA T7 + 0 
30eb : a5 0e __ LDA P1 ; (md + 1)
30ed : 69 00 __ ADC #$00
30ef : 85 51 __ STA T7 + 1 
30f1 : a5 0f __ LDA P2 ; (ms + 0)
30f3 : 85 53 __ STA T9 + 0 
30f5 : a9 00 __ LDA #$00
30f7 : 85 52 __ STA T8 + 0 
30f9 : a5 10 __ LDA P3 ; (ms + 1)
30fb : 85 54 __ STA T9 + 1 
.l6:
30fd : a0 0c __ LDY #$0c
30ff : b1 50 __ LDA (T7 + 0),y 
3101 : 85 1b __ STA ACCU + 0 
3103 : c8 __ __ INY
3104 : b1 50 __ LDA (T7 + 0),y 
3106 : 85 1c __ STA ACCU + 1 
3108 : c8 __ __ INY
3109 : b1 50 __ LDA (T7 + 0),y 
310b : 85 1d __ STA ACCU + 2 
310d : c8 __ __ INY
310e : b1 50 __ LDA (T7 + 0),y 
3110 : 85 1e __ STA ACCU + 3 
3112 : a0 30 __ LDY #$30
3114 : b1 53 __ LDA (T9 + 0),y 
3116 : 85 03 __ STA WORK + 0 
3118 : c8 __ __ INY
3119 : b1 53 __ LDA (T9 + 0),y 
311b : 85 04 __ STA WORK + 1 
311d : c8 __ __ INY
311e : b1 53 __ LDA (T9 + 0),y 
3120 : 85 05 __ STA WORK + 2 
3122 : c8 __ __ INY
3123 : b1 53 __ LDA (T9 + 0),y 
3125 : 85 06 __ STA WORK + 3 
3127 : 20 31 4e JSR $4e31 ; (freg + 20)
312a : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
312d : a5 1b __ LDA ACCU + 0 
312f : 85 43 __ STA T0 + 0 
3131 : a5 1c __ LDA ACCU + 1 
3133 : 85 44 __ STA T0 + 1 
3135 : a5 1d __ LDA ACCU + 2 
3137 : 85 45 __ STA T0 + 2 
3139 : a5 1e __ LDA ACCU + 3 
313b : 85 46 __ STA T0 + 3 
313d : a0 08 __ LDY #$08
313f : b1 50 __ LDA (T7 + 0),y 
3141 : 85 1b __ STA ACCU + 0 
3143 : c8 __ __ INY
3144 : b1 50 __ LDA (T7 + 0),y 
3146 : 85 1c __ STA ACCU + 1 
3148 : c8 __ __ INY
3149 : b1 50 __ LDA (T7 + 0),y 
314b : 85 1d __ STA ACCU + 2 
314d : c8 __ __ INY
314e : b1 50 __ LDA (T7 + 0),y 
3150 : 85 1e __ STA ACCU + 3 
3152 : a0 20 __ LDY #$20
3154 : b1 53 __ LDA (T9 + 0),y 
3156 : 85 03 __ STA WORK + 0 
3158 : c8 __ __ INY
3159 : b1 53 __ LDA (T9 + 0),y 
315b : 85 04 __ STA WORK + 1 
315d : c8 __ __ INY
315e : b1 53 __ LDA (T9 + 0),y 
3160 : 85 05 __ STA WORK + 2 
3162 : c8 __ __ INY
3163 : b1 53 __ LDA (T9 + 0),y 
3165 : 85 06 __ STA WORK + 3 
3167 : 20 31 4e JSR $4e31 ; (freg + 20)
316a : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
316d : a5 1b __ LDA ACCU + 0 
316f : 85 47 __ STA T1 + 0 
3171 : a5 1c __ LDA ACCU + 1 
3173 : 85 48 __ STA T1 + 1 
3175 : a5 1d __ LDA ACCU + 2 
3177 : 85 49 __ STA T1 + 2 
3179 : a5 1e __ LDA ACCU + 3 
317b : 85 4a __ STA T1 + 3 
317d : a0 04 __ LDY #$04
317f : b1 50 __ LDA (T7 + 0),y 
3181 : 85 1b __ STA ACCU + 0 
3183 : c8 __ __ INY
3184 : b1 50 __ LDA (T7 + 0),y 
3186 : 85 1c __ STA ACCU + 1 
3188 : c8 __ __ INY
3189 : b1 50 __ LDA (T7 + 0),y 
318b : 85 1d __ STA ACCU + 2 
318d : c8 __ __ INY
318e : b1 50 __ LDA (T7 + 0),y 
3190 : 85 1e __ STA ACCU + 3 
3192 : a0 10 __ LDY #$10
3194 : b1 53 __ LDA (T9 + 0),y 
3196 : 85 03 __ STA WORK + 0 
3198 : c8 __ __ INY
3199 : b1 53 __ LDA (T9 + 0),y 
319b : 85 04 __ STA WORK + 1 
319d : c8 __ __ INY
319e : b1 53 __ LDA (T9 + 0),y 
31a0 : 85 05 __ STA WORK + 2 
31a2 : c8 __ __ INY
31a3 : b1 53 __ LDA (T9 + 0),y 
31a5 : 85 06 __ STA WORK + 3 
31a7 : 20 31 4e JSR $4e31 ; (freg + 20)
31aa : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
31ad : a5 1b __ LDA ACCU + 0 
31af : 85 4b __ STA T2 + 0 
31b1 : a5 1c __ LDA ACCU + 1 
31b3 : 85 4c __ STA T2 + 1 
31b5 : a5 1d __ LDA ACCU + 2 
31b7 : 85 4d __ STA T2 + 2 
31b9 : a5 1e __ LDA ACCU + 3 
31bb : 85 4e __ STA T2 + 3 
31bd : a0 00 __ LDY #$00
31bf : b1 50 __ LDA (T7 + 0),y 
31c1 : 85 1b __ STA ACCU + 0 
31c3 : c8 __ __ INY
31c4 : b1 50 __ LDA (T7 + 0),y 
31c6 : 85 1c __ STA ACCU + 1 
31c8 : c8 __ __ INY
31c9 : b1 50 __ LDA (T7 + 0),y 
31cb : 85 1d __ STA ACCU + 2 
31cd : c8 __ __ INY
31ce : b1 50 __ LDA (T7 + 0),y 
31d0 : 85 1e __ STA ACCU + 3 
31d2 : a0 00 __ LDY #$00
31d4 : b1 53 __ LDA (T9 + 0),y 
31d6 : 85 03 __ STA WORK + 0 
31d8 : c8 __ __ INY
31d9 : b1 53 __ LDA (T9 + 0),y 
31db : 85 04 __ STA WORK + 1 
31dd : c8 __ __ INY
31de : b1 53 __ LDA (T9 + 0),y 
31e0 : 85 05 __ STA WORK + 2 
31e2 : c8 __ __ INY
31e3 : b1 53 __ LDA (T9 + 0),y 
31e5 : 85 06 __ STA WORK + 3 
31e7 : 20 31 4e JSR $4e31 ; (freg + 20)
31ea : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
31ed : a2 4b __ LDX #$4b
31ef : 20 21 4e JSR $4e21 ; (freg + 4)
31f2 : 20 68 4e JSR $4e68 ; (faddsub + 6)
31f5 : a2 47 __ LDX #$47
31f7 : 20 21 4e JSR $4e21 ; (freg + 4)
31fa : 20 68 4e JSR $4e68 ; (faddsub + 6)
31fd : a2 43 __ LDX #$43
31ff : 20 21 4e JSR $4e21 ; (freg + 4)
3202 : 20 68 4e JSR $4e68 ; (faddsub + 6)
3205 : a5 1b __ LDA ACCU + 0 
3207 : a6 52 __ LDX T8 + 0 
3209 : 9d ac c7 STA $c7ac,x ; (ma[0] + 0)
320c : a5 1c __ LDA ACCU + 1 
320e : 9d ad c7 STA $c7ad,x ; (ma[0] + 1)
3211 : a5 1d __ LDA ACCU + 2 
3213 : 9d ae c7 STA $c7ae,x ; (ma[0] + 2)
3216 : a5 1e __ LDA ACCU + 3 
3218 : 9d af c7 STA $c7af,x ; (ma[0] + 3)
321b : 18 __ __ CLC
321c : a5 53 __ LDA T9 + 0 
321e : 69 04 __ ADC #$04
3220 : 85 53 __ STA T9 + 0 
3222 : 90 03 __ BCC $3227 ; (mat4_rmmul.s11 + 0)
.s10:
3224 : e6 54 __ INC T9 + 1 
3226 : 18 __ __ CLC
.s11:
3227 : 8a __ __ TXA
3228 : 69 04 __ ADC #$04
322a : 85 52 __ STA T8 + 0 
322c : c9 10 __ CMP #$10
322e : f0 03 __ BEQ $3233 ; (mat4_rmmul.s7 + 0)
3230 : 4c fd 30 JMP $30fd ; (mat4_rmmul.l6 + 0)
.s7:
3233 : a2 00 __ LDX #$00
.l8:
3235 : bd ad c7 LDA $c7ad,x ; (ma[0] + 1)
3238 : 85 44 __ STA T0 + 1 
323a : bd ae c7 LDA $c7ae,x ; (ma[0] + 2)
323d : 85 45 __ STA T0 + 2 
323f : bd af c7 LDA $c7af,x ; (ma[0] + 3)
3242 : 85 46 __ STA T0 + 3 
3244 : bd ac c7 LDA $c7ac,x ; (ma[0] + 0)
3247 : a0 00 __ LDY #$00
3249 : 91 50 __ STA (T7 + 0),y 
324b : a5 44 __ LDA T0 + 1 
324d : c8 __ __ INY
324e : 91 50 __ STA (T7 + 0),y 
3250 : a5 45 __ LDA T0 + 2 
3252 : c8 __ __ INY
3253 : 91 50 __ STA (T7 + 0),y 
3255 : a5 46 __ LDA T0 + 3 
3257 : c8 __ __ INY
3258 : 91 50 __ STA (T7 + 0),y 
325a : 18 __ __ CLC
325b : a5 50 __ LDA T7 + 0 
325d : 69 04 __ ADC #$04
325f : 85 50 __ STA T7 + 0 
3261 : 90 03 __ BCC $3266 ; (mat4_rmmul.s13 + 0)
.s12:
3263 : e6 51 __ INC T7 + 1 
3265 : 18 __ __ CLC
.s13:
3266 : 8a __ __ TXA
3267 : 69 04 __ ADC #$04
3269 : aa __ __ TAX
326a : e0 10 __ CPX #$10
326c : d0 c7 __ BNE $3235 ; (mat4_rmmul.l8 + 0)
.s9:
326e : 18 __ __ CLC
326f : a5 4f __ LDA T5 + 0 
3271 : 69 04 __ ADC #$04
3273 : c9 10 __ CMP #$10
3275 : f0 03 __ BEQ $327a ; (mat4_rmmul.s3 + 0)
3277 : 4c e2 30 JMP $30e2 ; (mat4_rmmul.l5 + 0)
.s3:
327a : ad 9e c7 LDA $c79e ; (mat4_rmmul@stack + 0)
327d : 85 53 __ STA T9 + 0 
327f : ad 9f c7 LDA $c79f ; (mat4_rmmul@stack + 1)
3282 : 85 54 __ STA T9 + 1 
3284 : 60 __ __ RTS
--------------------------------------------------------------------
mat4_mmul: ; mat4_mmul(struct Matrix4*,const struct Matrix4*)->void
; 231, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
3285 : a5 53 __ LDA T9 + 0 
3287 : 8d 9e c7 STA $c79e ; (mat4_mmul@stack + 0)
328a : a5 54 __ LDA T9 + 1 
328c : 8d 9f c7 STA $c79f ; (mat4_mmul@stack + 1)
.s4:
328f : a9 00 __ LDA #$00
3291 : 85 4f __ STA T5 + 0 
.l5:
3293 : 0a __ __ ASL
3294 : 0a __ __ ASL
3295 : 18 __ __ CLC
3296 : 65 0d __ ADC P0 ; (md + 0)
3298 : 85 50 __ STA T7 + 0 
329a : a5 0e __ LDA P1 ; (md + 1)
329c : 69 00 __ ADC #$00
329e : 85 51 __ STA T7 + 1 
32a0 : a5 0f __ LDA P2 ; (ms + 0)
32a2 : 85 53 __ STA T9 + 0 
32a4 : a9 00 __ LDA #$00
32a6 : 85 52 __ STA T8 + 0 
32a8 : a5 10 __ LDA P3 ; (ms + 1)
32aa : 85 54 __ STA T9 + 1 
.l6:
32ac : a0 30 __ LDY #$30
32ae : b1 50 __ LDA (T7 + 0),y 
32b0 : 85 1b __ STA ACCU + 0 
32b2 : c8 __ __ INY
32b3 : b1 50 __ LDA (T7 + 0),y 
32b5 : 85 1c __ STA ACCU + 1 
32b7 : c8 __ __ INY
32b8 : b1 50 __ LDA (T7 + 0),y 
32ba : 85 1d __ STA ACCU + 2 
32bc : c8 __ __ INY
32bd : b1 50 __ LDA (T7 + 0),y 
32bf : 85 1e __ STA ACCU + 3 
32c1 : a0 0c __ LDY #$0c
32c3 : b1 53 __ LDA (T9 + 0),y 
32c5 : 85 03 __ STA WORK + 0 
32c7 : c8 __ __ INY
32c8 : b1 53 __ LDA (T9 + 0),y 
32ca : 85 04 __ STA WORK + 1 
32cc : c8 __ __ INY
32cd : b1 53 __ LDA (T9 + 0),y 
32cf : 85 05 __ STA WORK + 2 
32d1 : c8 __ __ INY
32d2 : b1 53 __ LDA (T9 + 0),y 
32d4 : 85 06 __ STA WORK + 3 
32d6 : 20 31 4e JSR $4e31 ; (freg + 20)
32d9 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
32dc : a5 1b __ LDA ACCU + 0 
32de : 85 43 __ STA T0 + 0 
32e0 : a5 1c __ LDA ACCU + 1 
32e2 : 85 44 __ STA T0 + 1 
32e4 : a5 1d __ LDA ACCU + 2 
32e6 : 85 45 __ STA T0 + 2 
32e8 : a5 1e __ LDA ACCU + 3 
32ea : 85 46 __ STA T0 + 3 
32ec : a0 20 __ LDY #$20
32ee : b1 50 __ LDA (T7 + 0),y 
32f0 : 85 1b __ STA ACCU + 0 
32f2 : c8 __ __ INY
32f3 : b1 50 __ LDA (T7 + 0),y 
32f5 : 85 1c __ STA ACCU + 1 
32f7 : c8 __ __ INY
32f8 : b1 50 __ LDA (T7 + 0),y 
32fa : 85 1d __ STA ACCU + 2 
32fc : c8 __ __ INY
32fd : b1 50 __ LDA (T7 + 0),y 
32ff : 85 1e __ STA ACCU + 3 
3301 : a0 08 __ LDY #$08
3303 : b1 53 __ LDA (T9 + 0),y 
3305 : 85 03 __ STA WORK + 0 
3307 : c8 __ __ INY
3308 : b1 53 __ LDA (T9 + 0),y 
330a : 85 04 __ STA WORK + 1 
330c : c8 __ __ INY
330d : b1 53 __ LDA (T9 + 0),y 
330f : 85 05 __ STA WORK + 2 
3311 : c8 __ __ INY
3312 : b1 53 __ LDA (T9 + 0),y 
3314 : 85 06 __ STA WORK + 3 
3316 : 20 31 4e JSR $4e31 ; (freg + 20)
3319 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
331c : a5 1b __ LDA ACCU + 0 
331e : 85 47 __ STA T1 + 0 
3320 : a5 1c __ LDA ACCU + 1 
3322 : 85 48 __ STA T1 + 1 
3324 : a5 1d __ LDA ACCU + 2 
3326 : 85 49 __ STA T1 + 2 
3328 : a5 1e __ LDA ACCU + 3 
332a : 85 4a __ STA T1 + 3 
332c : a0 10 __ LDY #$10
332e : b1 50 __ LDA (T7 + 0),y 
3330 : 85 1b __ STA ACCU + 0 
3332 : c8 __ __ INY
3333 : b1 50 __ LDA (T7 + 0),y 
3335 : 85 1c __ STA ACCU + 1 
3337 : c8 __ __ INY
3338 : b1 50 __ LDA (T7 + 0),y 
333a : 85 1d __ STA ACCU + 2 
333c : c8 __ __ INY
333d : b1 50 __ LDA (T7 + 0),y 
333f : 85 1e __ STA ACCU + 3 
3341 : a0 04 __ LDY #$04
3343 : b1 53 __ LDA (T9 + 0),y 
3345 : 85 03 __ STA WORK + 0 
3347 : c8 __ __ INY
3348 : b1 53 __ LDA (T9 + 0),y 
334a : 85 04 __ STA WORK + 1 
334c : c8 __ __ INY
334d : b1 53 __ LDA (T9 + 0),y 
334f : 85 05 __ STA WORK + 2 
3351 : c8 __ __ INY
3352 : b1 53 __ LDA (T9 + 0),y 
3354 : 85 06 __ STA WORK + 3 
3356 : 20 31 4e JSR $4e31 ; (freg + 20)
3359 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
335c : a5 1b __ LDA ACCU + 0 
335e : 85 4b __ STA T2 + 0 
3360 : a5 1c __ LDA ACCU + 1 
3362 : 85 4c __ STA T2 + 1 
3364 : a5 1d __ LDA ACCU + 2 
3366 : 85 4d __ STA T2 + 2 
3368 : a5 1e __ LDA ACCU + 3 
336a : 85 4e __ STA T2 + 3 
336c : a0 00 __ LDY #$00
336e : b1 50 __ LDA (T7 + 0),y 
3370 : 85 1b __ STA ACCU + 0 
3372 : c8 __ __ INY
3373 : b1 50 __ LDA (T7 + 0),y 
3375 : 85 1c __ STA ACCU + 1 
3377 : c8 __ __ INY
3378 : b1 50 __ LDA (T7 + 0),y 
337a : 85 1d __ STA ACCU + 2 
337c : c8 __ __ INY
337d : b1 50 __ LDA (T7 + 0),y 
337f : 85 1e __ STA ACCU + 3 
3381 : a0 00 __ LDY #$00
3383 : b1 53 __ LDA (T9 + 0),y 
3385 : 85 03 __ STA WORK + 0 
3387 : c8 __ __ INY
3388 : b1 53 __ LDA (T9 + 0),y 
338a : 85 04 __ STA WORK + 1 
338c : c8 __ __ INY
338d : b1 53 __ LDA (T9 + 0),y 
338f : 85 05 __ STA WORK + 2 
3391 : c8 __ __ INY
3392 : b1 53 __ LDA (T9 + 0),y 
3394 : 85 06 __ STA WORK + 3 
3396 : 20 31 4e JSR $4e31 ; (freg + 20)
3399 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
339c : a2 4b __ LDX #$4b
339e : 20 21 4e JSR $4e21 ; (freg + 4)
33a1 : 20 68 4e JSR $4e68 ; (faddsub + 6)
33a4 : a2 47 __ LDX #$47
33a6 : 20 21 4e JSR $4e21 ; (freg + 4)
33a9 : 20 68 4e JSR $4e68 ; (faddsub + 6)
33ac : a2 43 __ LDX #$43
33ae : 20 21 4e JSR $4e21 ; (freg + 4)
33b1 : 20 68 4e JSR $4e68 ; (faddsub + 6)
33b4 : a5 1b __ LDA ACCU + 0 
33b6 : a6 52 __ LDX T8 + 0 
33b8 : 9d ac c7 STA $c7ac,x ; (ma[0] + 0)
33bb : a5 1c __ LDA ACCU + 1 
33bd : 9d ad c7 STA $c7ad,x ; (ma[0] + 1)
33c0 : a5 1d __ LDA ACCU + 2 
33c2 : 9d ae c7 STA $c7ae,x ; (ma[0] + 2)
33c5 : a5 1e __ LDA ACCU + 3 
33c7 : 9d af c7 STA $c7af,x ; (ma[0] + 3)
33ca : 18 __ __ CLC
33cb : a5 53 __ LDA T9 + 0 
33cd : 69 10 __ ADC #$10
33cf : 85 53 __ STA T9 + 0 
33d1 : 90 03 __ BCC $33d6 ; (mat4_mmul.s11 + 0)
.s10:
33d3 : e6 54 __ INC T9 + 1 
33d5 : 18 __ __ CLC
.s11:
33d6 : 8a __ __ TXA
33d7 : 69 04 __ ADC #$04
33d9 : 85 52 __ STA T8 + 0 
33db : c9 10 __ CMP #$10
33dd : f0 03 __ BEQ $33e2 ; (mat4_mmul.s7 + 0)
33df : 4c ac 32 JMP $32ac ; (mat4_mmul.l6 + 0)
.s7:
33e2 : a2 00 __ LDX #$00
33e4 : 86 4b __ STX T2 + 0 
.l8:
33e6 : bd ad c7 LDA $c7ad,x ; (ma[0] + 1)
33e9 : 85 44 __ STA T0 + 1 
33eb : bd ae c7 LDA $c7ae,x ; (ma[0] + 2)
33ee : 85 45 __ STA T0 + 2 
33f0 : bd af c7 LDA $c7af,x ; (ma[0] + 3)
33f3 : 85 46 __ STA T0 + 3 
33f5 : bd ac c7 LDA $c7ac,x ; (ma[0] + 0)
33f8 : a4 4b __ LDY T2 + 0 
33fa : 91 50 __ STA (T7 + 0),y 
33fc : a5 44 __ LDA T0 + 1 
33fe : c8 __ __ INY
33ff : 91 50 __ STA (T7 + 0),y 
3401 : a5 45 __ LDA T0 + 2 
3403 : c8 __ __ INY
3404 : 91 50 __ STA (T7 + 0),y 
3406 : a5 46 __ LDA T0 + 3 
3408 : c8 __ __ INY
3409 : 91 50 __ STA (T7 + 0),y 
340b : 8a __ __ TXA
340c : 18 __ __ CLC
340d : 69 04 __ ADC #$04
340f : aa __ __ TAX
3410 : 98 __ __ TYA
3411 : 18 __ __ CLC
3412 : 69 0d __ ADC #$0d
3414 : 85 4b __ STA T2 + 0 
3416 : c9 40 __ CMP #$40
3418 : d0 cc __ BNE $33e6 ; (mat4_mmul.l8 + 0)
.s9:
341a : e6 4f __ INC T5 + 0 
341c : a5 4f __ LDA T5 + 0 
341e : c9 04 __ CMP #$04
3420 : f0 03 __ BEQ $3425 ; (mat4_mmul.s3 + 0)
3422 : 4c 93 32 JMP $3293 ; (mat4_mmul.l5 + 0)
.s3:
3425 : ad 9e c7 LDA $c79e ; (mat4_mmul@stack + 0)
3428 : 85 53 __ STA T9 + 0 
342a : ad 9f c7 LDA $c79f ; (mat4_mmul@stack + 1)
342d : 85 54 __ STA T9 + 1 
342f : 60 __ __ RTS
--------------------------------------------------------------------
vec3_project: ; vec3_project(struct Vector3*,const struct Matrix4*,const struct Vector3*)->void
; 259, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
3430 : a5 13 __ LDA P6 ; (vd + 0)
3432 : 85 0d __ STA P0 
3434 : a5 14 __ LDA P7 ; (vd + 1)
3436 : 85 0e __ STA P1 
3438 : a5 15 __ LDA P8 ; (m + 0)
343a : 85 0f __ STA P2 
343c : a5 16 __ LDA P9 ; (m + 1)
343e : 85 10 __ STA P3 
3440 : a5 17 __ LDA P10 ; (vs + 0)
3442 : 85 11 __ STA P4 
3444 : a5 18 __ LDA P11 ; (vs + 1)
3446 : 85 12 __ STA P5 
3448 : 20 c4 34 JSR $34c4 ; (vec3_mmulp.s4 + 0)
344b : a0 00 __ LDY #$00
344d : b1 13 __ LDA (P6),y ; (vd + 0)
344f : 85 1b __ STA ACCU + 0 
3451 : c8 __ __ INY
3452 : b1 13 __ LDA (P6),y ; (vd + 0)
3454 : 85 1c __ STA ACCU + 1 
3456 : c8 __ __ INY
3457 : b1 13 __ LDA (P6),y ; (vd + 0)
3459 : 85 1d __ STA ACCU + 2 
345b : c8 __ __ INY
345c : b1 13 __ LDA (P6),y ; (vd + 0)
345e : 85 1e __ STA ACCU + 3 
3460 : a0 08 __ LDY #$08
3462 : b1 13 __ LDA (P6),y ; (vd + 0)
3464 : 85 47 __ STA T1 + 0 
3466 : c8 __ __ INY
3467 : b1 13 __ LDA (P6),y ; (vd + 0)
3469 : 85 48 __ STA T1 + 1 
346b : c8 __ __ INY
346c : b1 13 __ LDA (P6),y ; (vd + 0)
346e : 85 49 __ STA T1 + 2 
3470 : c8 __ __ INY
3471 : b1 13 __ LDA (P6),y ; (vd + 0)
3473 : 85 4a __ STA T1 + 3 
3475 : a2 47 __ LDX #$47
3477 : 20 21 4e JSR $4e21 ; (freg + 4)
347a : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
347d : a5 1b __ LDA ACCU + 0 
347f : a0 00 __ LDY #$00
3481 : 91 13 __ STA (P6),y ; (vd + 0)
3483 : a5 1c __ LDA ACCU + 1 
3485 : c8 __ __ INY
3486 : 91 13 __ STA (P6),y ; (vd + 0)
3488 : a5 1d __ LDA ACCU + 2 
348a : c8 __ __ INY
348b : 91 13 __ STA (P6),y ; (vd + 0)
348d : a5 1e __ LDA ACCU + 3 
348f : c8 __ __ INY
3490 : 91 13 __ STA (P6),y ; (vd + 0)
3492 : c8 __ __ INY
3493 : b1 13 __ LDA (P6),y ; (vd + 0)
3495 : 85 1b __ STA ACCU + 0 
3497 : c8 __ __ INY
3498 : b1 13 __ LDA (P6),y ; (vd + 0)
349a : 85 1c __ STA ACCU + 1 
349c : c8 __ __ INY
349d : b1 13 __ LDA (P6),y ; (vd + 0)
349f : 85 1d __ STA ACCU + 2 
34a1 : c8 __ __ INY
34a2 : b1 13 __ LDA (P6),y ; (vd + 0)
34a4 : 85 1e __ STA ACCU + 3 
34a6 : a2 47 __ LDX #$47
34a8 : 20 21 4e JSR $4e21 ; (freg + 4)
34ab : 20 17 50 JSR $5017 ; (crt_fdiv + 0)
34ae : a5 1b __ LDA ACCU + 0 
34b0 : a0 04 __ LDY #$04
34b2 : 91 13 __ STA (P6),y ; (vd + 0)
34b4 : a5 1c __ LDA ACCU + 1 
34b6 : c8 __ __ INY
34b7 : 91 13 __ STA (P6),y ; (vd + 0)
34b9 : a5 1d __ LDA ACCU + 2 
34bb : c8 __ __ INY
34bc : 91 13 __ STA (P6),y ; (vd + 0)
34be : a5 1e __ LDA ACCU + 3 
34c0 : c8 __ __ INY
34c1 : 91 13 __ STA (P6),y ; (vd + 0)
.s3:
34c3 : 60 __ __ RTS
--------------------------------------------------------------------
vec3_mmulp: ; vec3_mmulp(struct Vector3*,const struct Matrix4*,const struct Vector3*)->void
; 241, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
34c4 : a9 00 __ LDA #$00
.l5:
34c6 : 85 4b __ STA T4 + 0 
34c8 : a0 08 __ LDY #$08
34ca : b1 11 __ LDA (P4),y ; (vs + 0)
34cc : 85 1b __ STA ACCU + 0 
34ce : c8 __ __ INY
34cf : b1 11 __ LDA (P4),y ; (vs + 0)
34d1 : 85 1c __ STA ACCU + 1 
34d3 : c8 __ __ INY
34d4 : b1 11 __ LDA (P4),y ; (vs + 0)
34d6 : 85 1d __ STA ACCU + 2 
34d8 : c8 __ __ INY
34d9 : b1 11 __ LDA (P4),y ; (vs + 0)
34db : 85 1e __ STA ACCU + 3 
34dd : a0 20 __ LDY #$20
34df : b1 0f __ LDA (P2),y ; (m + 0)
34e1 : 85 03 __ STA WORK + 0 
34e3 : c8 __ __ INY
34e4 : b1 0f __ LDA (P2),y ; (m + 0)
34e6 : 85 04 __ STA WORK + 1 
34e8 : c8 __ __ INY
34e9 : b1 0f __ LDA (P2),y ; (m + 0)
34eb : 85 05 __ STA WORK + 2 
34ed : c8 __ __ INY
34ee : b1 0f __ LDA (P2),y ; (m + 0)
34f0 : 85 06 __ STA WORK + 3 
34f2 : 20 31 4e JSR $4e31 ; (freg + 20)
34f5 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
34f8 : a5 1b __ LDA ACCU + 0 
34fa : 85 43 __ STA T0 + 0 
34fc : a5 1c __ LDA ACCU + 1 
34fe : 85 44 __ STA T0 + 1 
3500 : a5 1d __ LDA ACCU + 2 
3502 : 85 45 __ STA T0 + 2 
3504 : a5 1e __ LDA ACCU + 3 
3506 : 85 46 __ STA T0 + 3 
3508 : a0 04 __ LDY #$04
350a : b1 11 __ LDA (P4),y ; (vs + 0)
350c : 85 1b __ STA ACCU + 0 
350e : c8 __ __ INY
350f : b1 11 __ LDA (P4),y ; (vs + 0)
3511 : 85 1c __ STA ACCU + 1 
3513 : c8 __ __ INY
3514 : b1 11 __ LDA (P4),y ; (vs + 0)
3516 : 85 1d __ STA ACCU + 2 
3518 : c8 __ __ INY
3519 : b1 11 __ LDA (P4),y ; (vs + 0)
351b : 85 1e __ STA ACCU + 3 
351d : a0 10 __ LDY #$10
351f : b1 0f __ LDA (P2),y ; (m + 0)
3521 : 85 03 __ STA WORK + 0 
3523 : c8 __ __ INY
3524 : b1 0f __ LDA (P2),y ; (m + 0)
3526 : 85 04 __ STA WORK + 1 
3528 : c8 __ __ INY
3529 : b1 0f __ LDA (P2),y ; (m + 0)
352b : 85 05 __ STA WORK + 2 
352d : c8 __ __ INY
352e : b1 0f __ LDA (P2),y ; (m + 0)
3530 : 85 06 __ STA WORK + 3 
3532 : 20 31 4e JSR $4e31 ; (freg + 20)
3535 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
3538 : a5 1b __ LDA ACCU + 0 
353a : 85 47 __ STA T1 + 0 
353c : a5 1c __ LDA ACCU + 1 
353e : 85 48 __ STA T1 + 1 
3540 : a5 1d __ LDA ACCU + 2 
3542 : 85 49 __ STA T1 + 2 
3544 : a5 1e __ LDA ACCU + 3 
3546 : 85 4a __ STA T1 + 3 
3548 : a0 00 __ LDY #$00
354a : b1 11 __ LDA (P4),y ; (vs + 0)
354c : 85 1b __ STA ACCU + 0 
354e : c8 __ __ INY
354f : b1 11 __ LDA (P4),y ; (vs + 0)
3551 : 85 1c __ STA ACCU + 1 
3553 : c8 __ __ INY
3554 : b1 11 __ LDA (P4),y ; (vs + 0)
3556 : 85 1d __ STA ACCU + 2 
3558 : c8 __ __ INY
3559 : b1 11 __ LDA (P4),y ; (vs + 0)
355b : 85 1e __ STA ACCU + 3 
355d : a0 00 __ LDY #$00
355f : b1 0f __ LDA (P2),y ; (m + 0)
3561 : 85 03 __ STA WORK + 0 
3563 : c8 __ __ INY
3564 : b1 0f __ LDA (P2),y ; (m + 0)
3566 : 85 04 __ STA WORK + 1 
3568 : c8 __ __ INY
3569 : b1 0f __ LDA (P2),y ; (m + 0)
356b : 85 05 __ STA WORK + 2 
356d : c8 __ __ INY
356e : b1 0f __ LDA (P2),y ; (m + 0)
3570 : 85 06 __ STA WORK + 3 
3572 : 20 31 4e JSR $4e31 ; (freg + 20)
3575 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
3578 : a2 47 __ LDX #$47
357a : 20 21 4e JSR $4e21 ; (freg + 4)
357d : 20 68 4e JSR $4e68 ; (faddsub + 6)
3580 : a2 43 __ LDX #$43
3582 : 20 21 4e JSR $4e21 ; (freg + 4)
3585 : 20 68 4e JSR $4e68 ; (faddsub + 6)
3588 : a0 30 __ LDY #$30
358a : b1 0f __ LDA (P2),y ; (m + 0)
358c : 85 03 __ STA WORK + 0 
358e : c8 __ __ INY
358f : b1 0f __ LDA (P2),y ; (m + 0)
3591 : 85 04 __ STA WORK + 1 
3593 : c8 __ __ INY
3594 : b1 0f __ LDA (P2),y ; (m + 0)
3596 : 85 05 __ STA WORK + 2 
3598 : c8 __ __ INY
3599 : b1 0f __ LDA (P2),y ; (m + 0)
359b : 85 06 __ STA WORK + 3 
359d : 20 31 4e JSR $4e31 ; (freg + 20)
35a0 : 20 68 4e JSR $4e68 ; (faddsub + 6)
35a3 : a5 1b __ LDA ACCU + 0 
35a5 : a6 4b __ LDX T4 + 0 
35a7 : 9d b0 c7 STA $c7b0,x ; (vt.v[0] + 0)
35aa : a5 1c __ LDA ACCU + 1 
35ac : 9d b1 c7 STA $c7b1,x ; (vt.v[0] + 1)
35af : a5 1d __ LDA ACCU + 2 
35b1 : 9d b2 c7 STA $c7b2,x ; (vt.v[0] + 2)
35b4 : a5 1e __ LDA ACCU + 3 
35b6 : 9d b3 c7 STA $c7b3,x ; (vt.v[0] + 3)
35b9 : 18 __ __ CLC
35ba : a5 0f __ LDA P2 ; (m + 0)
35bc : 69 04 __ ADC #$04
35be : 85 0f __ STA P2 ; (m + 0)
35c0 : 90 03 __ BCC $35c5 ; (vec3_mmulp.s9 + 0)
.s8:
35c2 : e6 10 __ INC P3 ; (m + 1)
35c4 : 18 __ __ CLC
.s9:
35c5 : 8a __ __ TXA
35c6 : 69 04 __ ADC #$04
35c8 : c9 0c __ CMP #$0c
35ca : f0 03 __ BEQ $35cf ; (vec3_mmulp.s6 + 0)
35cc : 4c c6 34 JMP $34c6 ; (vec3_mmulp.l5 + 0)
.s6:
35cf : a0 0b __ LDY #$0b
.l7:
35d1 : b9 b0 c7 LDA $c7b0,y ; (vt.v[0] + 0)
35d4 : 91 0d __ STA (P0),y ; (vd + 0)
35d6 : 88 __ __ DEY
35d7 : 10 f8 __ BPL $35d1 ; (vec3_mmulp.l7 + 0)
.s3:
35d9 : 60 __ __ RTS
--------------------------------------------------------------------
35da : __ __ __ BYT 53 6f 72 74 69 6e 67 20 73 75 72 66 61 63 65 73 : Sorting surfaces
35ea : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
qsort: ; qsort(struct Surf*,i16)->void
;  80, "/home/honza/projects/c64/projects/oscar64/samples/hires/func3d.c"
.s1:
35eb : 38 __ __ SEC
35ec : a5 23 __ LDA SP + 0 
35ee : e9 14 __ SBC #$14
35f0 : 85 23 __ STA SP + 0 
35f2 : b0 02 __ BCS $35f6 ; (qsort.s1 + 11)
35f4 : c6 24 __ DEC SP + 1 
35f6 : a0 0d __ LDY #$0d
35f8 : a2 07 __ LDX #$07
35fa : b5 53 __ LDA T0 + 0,x 
35fc : 91 23 __ STA (SP + 0),y 
35fe : 88 __ __ DEY
35ff : ca __ __ DEX
3600 : 10 f8 __ BPL $35fa ; (qsort.s1 + 15)
.s4:
3602 : a0 18 __ LDY #$18
3604 : b1 23 __ LDA (SP + 0),y 
3606 : 85 57 __ STA T5 + 0 
3608 : c8 __ __ INY
3609 : b1 23 __ LDA (SP + 0),y 
360b : 30 0a __ BMI $3617 ; (qsort.s3 + 0)
.s19:
360d : 85 58 __ STA T5 + 1 
360f : d0 1e __ BNE $362f ; (qsort.s5 + 0)
.s18:
3611 : a5 57 __ LDA T5 + 0 
3613 : c9 02 __ CMP #$02
3615 : b0 18 __ BCS $362f ; (qsort.s5 + 0)
.s3:
3617 : a0 0d __ LDY #$0d
3619 : a2 07 __ LDX #$07
361b : b1 23 __ LDA (SP + 0),y 
361d : 95 53 __ STA T0 + 0,x 
361f : 88 __ __ DEY
3620 : ca __ __ DEX
3621 : 10 f8 __ BPL $361b ; (qsort.s3 + 4)
3623 : 18 __ __ CLC
3624 : a5 23 __ LDA SP + 0 
3626 : 69 14 __ ADC #$14
3628 : 85 23 __ STA SP + 0 
362a : 90 02 __ BCC $362e ; (qsort.s3 + 23)
362c : e6 24 __ INC SP + 1 
362e : 60 __ __ RTS
.s5:
362f : a0 16 __ LDY #$16
3631 : b1 23 __ LDA (SP + 0),y 
3633 : 85 47 __ STA T2 + 0 
3635 : c8 __ __ INY
3636 : b1 23 __ LDA (SP + 0),y 
3638 : 85 48 __ STA T2 + 1 
363a : 18 __ __ CLC
363b : a5 23 __ LDA SP + 0 
363d : 69 0e __ ADC #$0e
363f : 85 1f __ STA ADDR + 0 
3641 : a5 24 __ LDA SP + 1 
3643 : 69 00 __ ADC #$00
3645 : 85 20 __ STA ADDR + 1 
3647 : a0 05 __ LDY #$05
.l6:
3649 : b1 47 __ LDA (T2 + 0),y 
364b : 91 1f __ STA (ADDR + 0),y 
364d : 88 __ __ DEY
364e : 10 f9 __ BPL $3649 ; (qsort.l6 + 0)
.s7:
3650 : 38 __ __ SEC
3651 : a5 57 __ LDA T5 + 0 
3653 : e9 01 __ SBC #$01
3655 : 85 49 __ STA T3 + 0 
3657 : a5 58 __ LDA T5 + 1 
3659 : e9 00 __ SBC #$00
365b : 85 4a __ STA T3 + 1 
365d : 18 __ __ CLC
365e : a5 47 __ LDA T2 + 0 
3660 : 69 06 __ ADC #$06
3662 : 85 4b __ STA T4 + 0 
3664 : a5 48 __ LDA T2 + 1 
3666 : 69 00 __ ADC #$00
3668 : 85 4c __ STA T4 + 1 
366a : a9 00 __ LDA #$00
366c : 85 59 __ STA T6 + 0 
366e : 85 5a __ STA T6 + 1 
3670 : a8 __ __ TAY
3671 : b1 47 __ LDA (T2 + 0),y 
3673 : 85 53 __ STA T0 + 0 
3675 : c8 __ __ INY
3676 : b1 47 __ LDA (T2 + 0),y 
3678 : 85 54 __ STA T0 + 1 
367a : c8 __ __ INY
367b : b1 47 __ LDA (T2 + 0),y 
367d : 85 55 __ STA T0 + 2 
367f : c8 __ __ INY
3680 : b1 47 __ LDA (T2 + 0),y 
3682 : 85 56 __ STA T0 + 3 
.l8:
3684 : a0 00 __ LDY #$00
3686 : b1 4b __ LDA (T4 + 0),y 
3688 : 85 1b __ STA ACCU + 0 
368a : c8 __ __ INY
368b : b1 4b __ LDA (T4 + 0),y 
368d : 85 1c __ STA ACCU + 1 
368f : c8 __ __ INY
3690 : b1 4b __ LDA (T4 + 0),y 
3692 : 85 1d __ STA ACCU + 2 
3694 : c8 __ __ INY
3695 : b1 4b __ LDA (T4 + 0),y 
3697 : 85 1e __ STA ACCU + 3 
3699 : a5 53 __ LDA T0 + 0 
369b : 85 03 __ STA WORK + 0 
369d : a5 54 __ LDA T0 + 1 
369f : 85 04 __ STA WORK + 1 
36a1 : a5 55 __ LDA T0 + 2 
36a3 : 85 05 __ STA WORK + 2 
36a5 : a5 56 __ LDA T0 + 3 
36a7 : 85 06 __ STA WORK + 3 
36a9 : 20 52 52 JSR $5252 ; (crt_fcmp + 0)
36ac : 10 46 __ BPL $36f4 ; (qsort.s9 + 0)
.s13:
36ae : a5 59 __ LDA T6 + 0 
36b0 : 0a __ __ ASL
36b1 : a8 __ __ TAY
36b2 : a5 5a __ LDA T6 + 1 
36b4 : 2a __ __ ROL
36b5 : aa __ __ TAX
36b6 : 98 __ __ TYA
36b7 : 18 __ __ CLC
36b8 : 65 59 __ ADC T6 + 0 
36ba : 85 43 __ STA T1 + 0 
36bc : 8a __ __ TXA
36bd : 65 5a __ ADC T6 + 1 
36bf : 06 43 __ ASL T1 + 0 
36c1 : 2a __ __ ROL
36c2 : aa __ __ TAX
36c3 : 18 __ __ CLC
36c4 : a5 47 __ LDA T2 + 0 
36c6 : 65 43 __ ADC T1 + 0 
36c8 : 85 43 __ STA T1 + 0 
36ca : 8a __ __ TXA
36cb : 65 48 __ ADC T2 + 1 
36cd : 85 44 __ STA T1 + 1 
36cf : a0 05 __ LDY #$05
.l14:
36d1 : b1 4b __ LDA (T4 + 0),y 
36d3 : 91 43 __ STA (T1 + 0),y 
36d5 : 88 __ __ DEY
36d6 : 10 f9 __ BPL $36d1 ; (qsort.l14 + 0)
.s15:
36d8 : 18 __ __ CLC
36d9 : a5 43 __ LDA T1 + 0 
36db : 69 06 __ ADC #$06
36dd : 85 1b __ STA ACCU + 0 
36df : a5 44 __ LDA T1 + 1 
36e1 : 69 00 __ ADC #$00
36e3 : 85 1c __ STA ACCU + 1 
36e5 : a0 05 __ LDY #$05
.l16:
36e7 : b1 1b __ LDA (ACCU + 0),y 
36e9 : 91 4b __ STA (T4 + 0),y 
36eb : 88 __ __ DEY
36ec : 10 f9 __ BPL $36e7 ; (qsort.l16 + 0)
.s17:
36ee : e6 59 __ INC T6 + 0 
36f0 : d0 02 __ BNE $36f4 ; (qsort.s9 + 0)
.s20:
36f2 : e6 5a __ INC T6 + 1 
.s9:
36f4 : 18 __ __ CLC
36f5 : a5 4b __ LDA T4 + 0 
36f7 : 69 06 __ ADC #$06
36f9 : 85 4b __ STA T4 + 0 
36fb : 90 02 __ BCC $36ff ; (qsort.s25 + 0)
.s24:
36fd : e6 4c __ INC T4 + 1 
.s25:
36ff : a5 49 __ LDA T3 + 0 
3701 : d0 02 __ BNE $3705 ; (qsort.s22 + 0)
.s21:
3703 : c6 4a __ DEC T3 + 1 
.s22:
3705 : c6 49 __ DEC T3 + 0 
3707 : f0 03 __ BEQ $370c ; (qsort.s23 + 0)
3709 : 4c 84 36 JMP $3684 ; (qsort.l8 + 0)
.s23:
370c : a5 4a __ LDA T3 + 1 
370e : d0 f9 __ BNE $3709 ; (qsort.s22 + 4)
.s10:
3710 : a5 59 __ LDA T6 + 0 
3712 : 0a __ __ ASL
3713 : a8 __ __ TAY
3714 : a5 5a __ LDA T6 + 1 
3716 : 2a __ __ ROL
3717 : aa __ __ TAX
3718 : 98 __ __ TYA
3719 : 18 __ __ CLC
371a : 65 59 __ ADC T6 + 0 
371c : 85 53 __ STA T0 + 0 
371e : 8a __ __ TXA
371f : 65 5a __ ADC T6 + 1 
3721 : 06 53 __ ASL T0 + 0 
3723 : 2a __ __ ROL
3724 : aa __ __ TAX
3725 : 18 __ __ CLC
3726 : a5 47 __ LDA T2 + 0 
3728 : 65 53 __ ADC T0 + 0 
372a : 85 53 __ STA T0 + 0 
372c : 8a __ __ TXA
372d : 65 48 __ ADC T2 + 1 
372f : 85 54 __ STA T0 + 1 
3731 : 18 __ __ CLC
3732 : a5 23 __ LDA SP + 0 
3734 : 69 0e __ ADC #$0e
3736 : 85 1b __ STA ACCU + 0 
3738 : a5 24 __ LDA SP + 1 
373a : 69 00 __ ADC #$00
373c : 85 1c __ STA ACCU + 1 
373e : a0 05 __ LDY #$05
.l11:
3740 : b1 1b __ LDA (ACCU + 0),y 
3742 : 91 53 __ STA (T0 + 0),y 
3744 : 88 __ __ DEY
3745 : 10 f9 __ BPL $3740 ; (qsort.l11 + 0)
.s12:
3747 : a5 47 __ LDA T2 + 0 
3749 : a0 02 __ LDY #$02
374b : 91 23 __ STA (SP + 0),y 
374d : a5 48 __ LDA T2 + 1 
374f : c8 __ __ INY
3750 : 91 23 __ STA (SP + 0),y 
3752 : a5 59 __ LDA T6 + 0 
3754 : c8 __ __ INY
3755 : 91 23 __ STA (SP + 0),y 
3757 : a5 5a __ LDA T6 + 1 
3759 : c8 __ __ INY
375a : 91 23 __ STA (SP + 0),y 
375c : 20 eb 35 JSR $35eb ; (qsort.s1 + 0)
375f : 18 __ __ CLC
3760 : a5 53 __ LDA T0 + 0 
3762 : 69 06 __ ADC #$06
3764 : a0 02 __ LDY #$02
3766 : 91 23 __ STA (SP + 0),y 
3768 : a5 54 __ LDA T0 + 1 
376a : 69 00 __ ADC #$00
376c : c8 __ __ INY
376d : 91 23 __ STA (SP + 0),y 
376f : 38 __ __ SEC
3770 : a5 57 __ LDA T5 + 0 
3772 : e5 59 __ SBC T6 + 0 
3774 : a8 __ __ TAY
3775 : a5 58 __ LDA T5 + 1 
3777 : e5 5a __ SBC T6 + 1 
3779 : aa __ __ TAX
377a : 98 __ __ TYA
377b : 38 __ __ SEC
377c : e9 01 __ SBC #$01
377e : a0 04 __ LDY #$04
3780 : 91 23 __ STA (SP + 0),y 
3782 : 8a __ __ TXA
3783 : e9 00 __ SBC #$00
3785 : c8 __ __ INY
3786 : 91 23 __ STA (SP + 0),y 
3788 : 20 eb 35 JSR $35eb ; (qsort.s1 + 0)
378b : 4c 17 36 JMP $3617 ; (qsort.s3 + 0)
--------------------------------------------------------------------
378e : __ __ __ BYT 44 72 61 77 69 6e 67 20 73 75 72 66 61 63 65 73 : Drawing surfaces
379e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vec3_diff: ; vec3_diff(struct Vector3*,const struct Vector3*,const struct Vector3*)->void
;  83, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
379f : a0 00 __ LDY #$00
.l5:
37a1 : 84 47 __ STY T2 + 0 
37a3 : b1 11 __ LDA (P4),y ; (v2 + 0)
37a5 : 85 43 __ STA T1 + 0 
37a7 : c8 __ __ INY
37a8 : b1 11 __ LDA (P4),y ; (v2 + 0)
37aa : 85 44 __ STA T1 + 1 
37ac : c8 __ __ INY
37ad : b1 11 __ LDA (P4),y ; (v2 + 0)
37af : 85 45 __ STA T1 + 2 
37b1 : c8 __ __ INY
37b2 : b1 11 __ LDA (P4),y ; (v2 + 0)
37b4 : 85 46 __ STA T1 + 3 
37b6 : 88 __ __ DEY
37b7 : 88 __ __ DEY
37b8 : 88 __ __ DEY
37b9 : b1 0f __ LDA (P2),y ; (v1 + 0)
37bb : 85 1b __ STA ACCU + 0 
37bd : c8 __ __ INY
37be : b1 0f __ LDA (P2),y ; (v1 + 0)
37c0 : 85 1c __ STA ACCU + 1 
37c2 : c8 __ __ INY
37c3 : b1 0f __ LDA (P2),y ; (v1 + 0)
37c5 : 85 1d __ STA ACCU + 2 
37c7 : c8 __ __ INY
37c8 : b1 0f __ LDA (P2),y ; (v1 + 0)
37ca : 85 1e __ STA ACCU + 3 
37cc : a2 43 __ LDX #$43
37ce : 20 21 4e JSR $4e21 ; (freg + 4)
37d1 : 20 62 4e JSR $4e62 ; (faddsub + 0)
37d4 : a5 1b __ LDA ACCU + 0 
37d6 : a4 47 __ LDY T2 + 0 
37d8 : 91 0d __ STA (P0),y ; (vd + 0)
37da : a5 1c __ LDA ACCU + 1 
37dc : c8 __ __ INY
37dd : 91 0d __ STA (P0),y ; (vd + 0)
37df : a5 1d __ LDA ACCU + 2 
37e1 : c8 __ __ INY
37e2 : 91 0d __ STA (P0),y ; (vd + 0)
37e4 : a5 1e __ LDA ACCU + 3 
37e6 : c8 __ __ INY
37e7 : 91 0d __ STA (P0),y ; (vd + 0)
37e9 : c8 __ __ INY
37ea : c0 0c __ CPY #$0c
37ec : d0 b3 __ BNE $37a1 ; (vec3_diff.l5 + 0)
.s3:
37ee : 60 __ __ RTS
--------------------------------------------------------------------
vec3_xmul: ; vec3_xmul(struct Vector3*,const struct Vector3*,const struct Vector3*)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
37ef : a2 0b __ LDX #$0b
37f1 : b5 53 __ LDA T4 + 0,x 
37f3 : 9d ae c7 STA $c7ae,x ; (vec3_xmul@stack + 0)
37f6 : ca __ __ DEX
37f7 : 10 f8 __ BPL $37f1 ; (vec3_xmul.s1 + 2)
.s4:
37f9 : a0 08 __ LDY #$08
37fb : b1 0f __ LDA (P2),y ; (v1 + 0)
37fd : 85 4f __ STA T3 + 0 
37ff : c8 __ __ INY
3800 : b1 0f __ LDA (P2),y ; (v1 + 0)
3802 : 85 50 __ STA T3 + 1 
3804 : c8 __ __ INY
3805 : b1 0f __ LDA (P2),y ; (v1 + 0)
3807 : 85 51 __ STA T3 + 2 
3809 : c8 __ __ INY
380a : b1 0f __ LDA (P2),y ; (v1 + 0)
380c : 85 52 __ STA T3 + 3 
380e : a0 08 __ LDY #$08
3810 : b1 11 __ LDA (P4),y ; (v2 + 0)
3812 : 85 57 __ STA T5 + 0 
3814 : c8 __ __ INY
3815 : b1 11 __ LDA (P4),y ; (v2 + 0)
3817 : 85 58 __ STA T5 + 1 
3819 : c8 __ __ INY
381a : b1 11 __ LDA (P4),y ; (v2 + 0)
381c : 85 59 __ STA T5 + 2 
381e : c8 __ __ INY
381f : b1 11 __ LDA (P4),y ; (v2 + 0)
3821 : 85 5a __ STA T5 + 3 
3823 : a0 04 __ LDY #$04
3825 : b1 0f __ LDA (P2),y ; (v1 + 0)
3827 : 85 43 __ STA T0 + 0 
3829 : c8 __ __ INY
382a : b1 0f __ LDA (P2),y ; (v1 + 0)
382c : 85 44 __ STA T0 + 1 
382e : c8 __ __ INY
382f : b1 0f __ LDA (P2),y ; (v1 + 0)
3831 : 85 45 __ STA T0 + 2 
3833 : c8 __ __ INY
3834 : b1 0f __ LDA (P2),y ; (v1 + 0)
3836 : 85 46 __ STA T0 + 3 
3838 : a0 00 __ LDY #$00
383a : b1 11 __ LDA (P4),y ; (v2 + 0)
383c : 85 47 __ STA T1 + 0 
383e : 85 1b __ STA ACCU + 0 
3840 : c8 __ __ INY
3841 : b1 11 __ LDA (P4),y ; (v2 + 0)
3843 : 85 48 __ STA T1 + 1 
3845 : 85 1c __ STA ACCU + 1 
3847 : c8 __ __ INY
3848 : b1 11 __ LDA (P4),y ; (v2 + 0)
384a : 85 49 __ STA T1 + 2 
384c : 85 1d __ STA ACCU + 2 
384e : c8 __ __ INY
384f : b1 11 __ LDA (P4),y ; (v2 + 0)
3851 : 85 4a __ STA T1 + 3 
3853 : 85 1e __ STA ACCU + 3 
3855 : a2 43 __ LDX #$43
3857 : 20 21 4e JSR $4e21 ; (freg + 4)
385a : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
385d : a5 1b __ LDA ACCU + 0 
385f : 85 5b __ STA T7 + 0 
3861 : a5 1c __ LDA ACCU + 1 
3863 : 85 5c __ STA T7 + 1 
3865 : a5 1d __ LDA ACCU + 2 
3867 : 85 5d __ STA T7 + 2 
3869 : a5 1e __ LDA ACCU + 3 
386b : 85 5e __ STA T7 + 3 
386d : a0 04 __ LDY #$04
386f : b1 11 __ LDA (P4),y ; (v2 + 0)
3871 : 85 4b __ STA T2 + 0 
3873 : c8 __ __ INY
3874 : b1 11 __ LDA (P4),y ; (v2 + 0)
3876 : 85 4c __ STA T2 + 1 
3878 : c8 __ __ INY
3879 : b1 11 __ LDA (P4),y ; (v2 + 0)
387b : 85 4d __ STA T2 + 2 
387d : c8 __ __ INY
387e : b1 11 __ LDA (P4),y ; (v2 + 0)
3880 : 85 4e __ STA T2 + 3 
3882 : a0 00 __ LDY #$00
3884 : b1 0f __ LDA (P2),y ; (v1 + 0)
3886 : 85 1b __ STA ACCU + 0 
3888 : 85 53 __ STA T4 + 0 
388a : c8 __ __ INY
388b : b1 0f __ LDA (P2),y ; (v1 + 0)
388d : 85 1c __ STA ACCU + 1 
388f : 85 54 __ STA T4 + 1 
3891 : c8 __ __ INY
3892 : b1 0f __ LDA (P2),y ; (v1 + 0)
3894 : 85 1d __ STA ACCU + 2 
3896 : 85 55 __ STA T4 + 2 
3898 : c8 __ __ INY
3899 : b1 0f __ LDA (P2),y ; (v1 + 0)
389b : 85 1e __ STA ACCU + 3 
389d : 85 56 __ STA T4 + 3 
389f : a2 4b __ LDX #$4b
38a1 : 20 21 4e JSR $4e21 ; (freg + 4)
38a4 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
38a7 : a2 5b __ LDX #$5b
38a9 : 20 21 4e JSR $4e21 ; (freg + 4)
38ac : 20 62 4e JSR $4e62 ; (faddsub + 0)
38af : a5 1b __ LDA ACCU + 0 
38b1 : a0 08 __ LDY #$08
38b3 : 91 0d __ STA (P0),y ; (vd + 0)
38b5 : a5 1c __ LDA ACCU + 1 
38b7 : c8 __ __ INY
38b8 : 91 0d __ STA (P0),y ; (vd + 0)
38ba : a5 1d __ LDA ACCU + 2 
38bc : c8 __ __ INY
38bd : 91 0d __ STA (P0),y ; (vd + 0)
38bf : a5 1e __ LDA ACCU + 3 
38c1 : c8 __ __ INY
38c2 : 91 0d __ STA (P0),y ; (vd + 0)
38c4 : a5 43 __ LDA T0 + 0 
38c6 : 85 1b __ STA ACCU + 0 
38c8 : a5 44 __ LDA T0 + 1 
38ca : 85 1c __ STA ACCU + 1 
38cc : a5 45 __ LDA T0 + 2 
38ce : 85 1d __ STA ACCU + 2 
38d0 : a5 46 __ LDA T0 + 3 
38d2 : 85 1e __ STA ACCU + 3 
38d4 : a2 57 __ LDX #$57
38d6 : 20 21 4e JSR $4e21 ; (freg + 4)
38d9 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
38dc : a5 1b __ LDA ACCU + 0 
38de : 85 43 __ STA T0 + 0 
38e0 : a5 1c __ LDA ACCU + 1 
38e2 : 85 44 __ STA T0 + 1 
38e4 : a5 1d __ LDA ACCU + 2 
38e6 : 85 45 __ STA T0 + 2 
38e8 : a5 1e __ LDA ACCU + 3 
38ea : 85 46 __ STA T0 + 3 
38ec : a5 4b __ LDA T2 + 0 
38ee : 85 1b __ STA ACCU + 0 
38f0 : a5 4c __ LDA T2 + 1 
38f2 : 85 1c __ STA ACCU + 1 
38f4 : a5 4d __ LDA T2 + 2 
38f6 : 85 1d __ STA ACCU + 2 
38f8 : a5 4e __ LDA T2 + 3 
38fa : 85 1e __ STA ACCU + 3 
38fc : a2 4f __ LDX #$4f
38fe : 20 21 4e JSR $4e21 ; (freg + 4)
3901 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
3904 : a2 43 __ LDX #$43
3906 : 20 21 4e JSR $4e21 ; (freg + 4)
3909 : a5 1e __ LDA ACCU + 3 
390b : 49 80 __ EOR #$80
390d : 85 1e __ STA ACCU + 3 
390f : 20 68 4e JSR $4e68 ; (faddsub + 6)
3912 : a5 1b __ LDA ACCU + 0 
3914 : a0 00 __ LDY #$00
3916 : 91 0d __ STA (P0),y ; (vd + 0)
3918 : a5 1c __ LDA ACCU + 1 
391a : c8 __ __ INY
391b : 91 0d __ STA (P0),y ; (vd + 0)
391d : a5 1d __ LDA ACCU + 2 
391f : c8 __ __ INY
3920 : 91 0d __ STA (P0),y ; (vd + 0)
3922 : a5 1e __ LDA ACCU + 3 
3924 : c8 __ __ INY
3925 : 91 0d __ STA (P0),y ; (vd + 0)
3927 : a5 47 __ LDA T1 + 0 
3929 : 85 1b __ STA ACCU + 0 
392b : a5 48 __ LDA T1 + 1 
392d : 85 1c __ STA ACCU + 1 
392f : a5 49 __ LDA T1 + 2 
3931 : 85 1d __ STA ACCU + 2 
3933 : a5 4a __ LDA T1 + 3 
3935 : 85 1e __ STA ACCU + 3 
3937 : a2 4f __ LDX #$4f
3939 : 20 21 4e JSR $4e21 ; (freg + 4)
393c : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
393f : a5 1b __ LDA ACCU + 0 
3941 : 85 43 __ STA T0 + 0 
3943 : a5 1c __ LDA ACCU + 1 
3945 : 85 44 __ STA T0 + 1 
3947 : a5 1d __ LDA ACCU + 2 
3949 : 85 45 __ STA T0 + 2 
394b : a5 1e __ LDA ACCU + 3 
394d : 85 46 __ STA T0 + 3 
394f : a5 57 __ LDA T5 + 0 
3951 : 85 1b __ STA ACCU + 0 
3953 : a5 58 __ LDA T5 + 1 
3955 : 85 1c __ STA ACCU + 1 
3957 : a5 59 __ LDA T5 + 2 
3959 : 85 1d __ STA ACCU + 2 
395b : a5 5a __ LDA T5 + 3 
395d : 85 1e __ STA ACCU + 3 
395f : a2 53 __ LDX #$53
3961 : 20 21 4e JSR $4e21 ; (freg + 4)
3964 : 20 4f 4f JSR $4f4f ; (crt_fmul + 0)
3967 : a2 43 __ LDX #$43
3969 : 20 21 4e JSR $4e21 ; (freg + 4)
396c : a5 1e __ LDA ACCU + 3 
396e : 49 80 __ EOR #$80
3970 : 85 1e __ STA ACCU + 3 
3972 : 20 68 4e JSR $4e68 ; (faddsub + 6)
3975 : a5 1b __ LDA ACCU + 0 
3977 : a0 04 __ LDY #$04
3979 : 91 0d __ STA (P0),y ; (vd + 0)
397b : a5 1c __ LDA ACCU + 1 
397d : c8 __ __ INY
397e : 91 0d __ STA (P0),y ; (vd + 0)
3980 : a5 1d __ LDA ACCU + 2 
3982 : c8 __ __ INY
3983 : 91 0d __ STA (P0),y ; (vd + 0)
3985 : a5 1e __ LDA ACCU + 3 
3987 : c8 __ __ INY
3988 : 91 0d __ STA (P0),y ; (vd + 0)
.s3:
398a : a2 0b __ LDX #$0b
398c : bd ae c7 LDA $c7ae,x ; (vec3_xmul@stack + 0)
398f : 95 53 __ STA T4 + 0,x 
3991 : ca __ __ DEX
3992 : 10 f8 __ BPL $398c ; (vec3_xmul.s3 + 2)
3994 : 60 __ __ RTS
--------------------------------------------------------------------
bm_quad_fill: ; bm_quad_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,i16,i16,i16,i16,const u8*)->void
;  91, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
3995 : a2 0d __ LDX #$0d
3997 : b5 53 __ LDA T0 + 0,x ; (y2 + 0)
3999 : 9d 8b c7 STA $c78b,x ; (bm_quad_fill@stack + 0)
399c : ca __ __ DEX
399d : 10 f8 __ BPL $3997 ; (bm_quad_fill.s1 + 2)
.s4:
399f : ad ea c7 LDA $c7ea ; (sstack + 44)
39a2 : 85 55 __ STA T1 + 0 ; (x3 + 0)
39a4 : 8d d8 c7 STA $c7d8 ; (sstack + 26)
39a7 : ad eb c7 LDA $c7eb ; (sstack + 45)
39aa : 85 56 __ STA T1 + 1 ; (x3 + 1)
39ac : 8d d9 c7 STA $c7d9 ; (sstack + 27)
39af : ad ec c7 LDA $c7ec ; (sstack + 46)
39b2 : 85 57 __ STA T2 + 0 ; (y3 + 0)
39b4 : 8d da c7 STA $c7da ; (sstack + 28)
39b7 : ad ed c7 LDA $c7ed ; (sstack + 47)
39ba : 85 58 __ STA T2 + 1 ; (y3 + 1)
39bc : 8d db c7 STA $c7db ; (sstack + 29)
39bf : ad ee c7 LDA $c7ee ; (sstack + 48)
39c2 : 85 59 __ STA T3 + 0 ; (pat + 0)
39c4 : 8d dc c7 STA $c7dc ; (sstack + 30)
39c7 : ad ef c7 LDA $c7ef ; (sstack + 49)
39ca : 85 5a __ STA T3 + 1 ; (pat + 1)
39cc : 8d dd c7 STA $c7dd ; (sstack + 31)
39cf : ad f0 c7 LDA $c7f0 ; (sstack + 50)
39d2 : 85 5b __ STA T4 + 0 
39d4 : 8d de c7 STA $c7de ; (sstack + 32)
39d7 : ad f1 c7 LDA $c7f1 ; (sstack + 51)
39da : 85 5c __ STA T4 + 1 
39dc : 8d df c7 STA $c7df ; (sstack + 33)
39df : ad f2 c7 LDA $c7f2 ; (sstack + 52)
39e2 : 8d e0 c7 STA $c7e0 ; (sstack + 34)
39e5 : ad f3 c7 LDA $c7f3 ; (sstack + 53)
39e8 : 8d e1 c7 STA $c7e1 ; (sstack + 35)
39eb : ad f4 c7 LDA $c7f4 ; (sstack + 54)
39ee : 8d e2 c7 STA $c7e2 ; (sstack + 36)
39f1 : ad f5 c7 LDA $c7f5 ; (sstack + 55)
39f4 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
39f7 : ad f6 c7 LDA $c7f6 ; (sstack + 56)
39fa : 85 53 __ STA T0 + 0 ; (y2 + 0)
39fc : 8d e4 c7 STA $c7e4 ; (sstack + 38)
39ff : ad f7 c7 LDA $c7f7 ; (sstack + 57)
3a02 : 85 54 __ STA T0 + 1 ; (y2 + 1)
3a04 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
3a07 : ad f8 c7 LDA $c7f8 ; (sstack + 58)
3a0a : 85 5d __ STA T5 + 0 
3a0c : 8d e6 c7 STA $c7e6 ; (sstack + 40)
3a0f : ad f9 c7 LDA $c7f9 ; (sstack + 59)
3a12 : 85 5e __ STA T5 + 1 
3a14 : 8d e7 c7 STA $c7e7 ; (sstack + 41)
3a17 : ad fe c7 LDA $c7fe ; (sstack + 64)
3a1a : 85 5f __ STA T6 + 0 
3a1c : 8d e8 c7 STA $c7e8 ; (sstack + 42)
3a1f : ad ff c7 LDA $c7ff ; (sstack + 65)
3a22 : 85 60 __ STA T6 + 1 
3a24 : 8d e9 c7 STA $c7e9 ; (sstack + 43)
3a27 : 20 96 3a JSR $3a96 ; (bm_triangle_fill.s1 + 0)
3a2a : a5 55 __ LDA T1 + 0 ; (x3 + 0)
3a2c : 8d d8 c7 STA $c7d8 ; (sstack + 26)
3a2f : a5 56 __ LDA T1 + 1 ; (x3 + 1)
3a31 : 8d d9 c7 STA $c7d9 ; (sstack + 27)
3a34 : a5 57 __ LDA T2 + 0 ; (y3 + 0)
3a36 : 8d da c7 STA $c7da ; (sstack + 28)
3a39 : a5 58 __ LDA T2 + 1 ; (y3 + 1)
3a3b : 8d db c7 STA $c7db ; (sstack + 29)
3a3e : a5 59 __ LDA T3 + 0 ; (pat + 0)
3a40 : 8d dc c7 STA $c7dc ; (sstack + 30)
3a43 : a5 5a __ LDA T3 + 1 ; (pat + 1)
3a45 : 8d dd c7 STA $c7dd ; (sstack + 31)
3a48 : a5 5b __ LDA T4 + 0 
3a4a : 8d de c7 STA $c7de ; (sstack + 32)
3a4d : a5 5c __ LDA T4 + 1 
3a4f : 8d df c7 STA $c7df ; (sstack + 33)
3a52 : a5 53 __ LDA T0 + 0 ; (y2 + 0)
3a54 : 8d e0 c7 STA $c7e0 ; (sstack + 34)
3a57 : a5 54 __ LDA T0 + 1 ; (y2 + 1)
3a59 : 8d e1 c7 STA $c7e1 ; (sstack + 35)
3a5c : a5 5d __ LDA T5 + 0 
3a5e : 8d e2 c7 STA $c7e2 ; (sstack + 36)
3a61 : a5 5e __ LDA T5 + 1 
3a63 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
3a66 : ad fa c7 LDA $c7fa ; (sstack + 60)
3a69 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
3a6c : ad fb c7 LDA $c7fb ; (sstack + 61)
3a6f : 8d e5 c7 STA $c7e5 ; (sstack + 39)
3a72 : ad fc c7 LDA $c7fc ; (sstack + 62)
3a75 : 8d e6 c7 STA $c7e6 ; (sstack + 40)
3a78 : ad fd c7 LDA $c7fd ; (sstack + 63)
3a7b : 8d e7 c7 STA $c7e7 ; (sstack + 41)
3a7e : a5 5f __ LDA T6 + 0 
3a80 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
3a83 : a5 60 __ LDA T6 + 1 
3a85 : 8d e9 c7 STA $c7e9 ; (sstack + 43)
3a88 : 20 96 3a JSR $3a96 ; (bm_triangle_fill.s1 + 0)
.s3:
3a8b : a2 0d __ LDX #$0d
3a8d : bd 8b c7 LDA $c78b,x ; (bm_quad_fill@stack + 0)
3a90 : 95 53 __ STA T0 + 0,x ; (y2 + 0)
3a92 : ca __ __ DEX
3a93 : 10 f8 __ BPL $3a8d ; (bm_quad_fill.s3 + 2)
3a95 : 60 __ __ RTS
--------------------------------------------------------------------
bm_triangle_fill: ; bm_triangle_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,i16,i16,const u8*)->void
;  88, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
3a96 : a2 10 __ LDX #$10
3a98 : b5 53 __ LDA T1 + 0,x 
3a9a : 9d 99 c7 STA $c799,x ; (bm_triangle_fill@stack + 0)
3a9d : ca __ __ DEX
3a9e : 10 f8 __ BPL $3a98 ; (bm_triangle_fill.s1 + 2)
.s4:
3aa0 : ad de c7 LDA $c7de ; (sstack + 32)
3aa3 : 85 53 __ STA T1 + 0 
3aa5 : ad df c7 LDA $c7df ; (sstack + 33)
3aa8 : 85 54 __ STA T1 + 1 
3aaa : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3aad : c5 54 __ CMP T1 + 1 
3aaf : d0 09 __ BNE $3aba ; (bm_triangle_fill.s62 + 0)
.s59:
3ab1 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3ab4 : c5 53 __ CMP T1 + 0 
.s60:
3ab6 : 90 08 __ BCC $3ac0 ; (bm_triangle_fill.s49 + 0)
3ab8 : b0 20 __ BCS $3ada ; (bm_triangle_fill.s5 + 0)
.s62:
3aba : 45 54 __ EOR T1 + 1 
3abc : 10 f8 __ BPL $3ab6 ; (bm_triangle_fill.s60 + 0)
.s61:
3abe : 90 1a __ BCC $3ada ; (bm_triangle_fill.s5 + 0)
.s49:
3ac0 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3ac3 : cd e7 c7 CMP $c7e7 ; (sstack + 41)
3ac6 : d0 0b __ BNE $3ad3 ; (bm_triangle_fill.s58 + 0)
.s55:
3ac8 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3acb : cd e6 c7 CMP $c7e6 ; (sstack + 40)
.s56:
3ace : b0 0a __ BCS $3ada ; (bm_triangle_fill.s5 + 0)
3ad0 : 4c a0 3e JMP $3ea0 ; (bm_triangle_fill.s50 + 0)
.s58:
3ad3 : 4d e7 c7 EOR $c7e7 ; (sstack + 41)
3ad6 : 10 f6 __ BPL $3ace ; (bm_triangle_fill.s56 + 0)
.s57:
3ad8 : b0 f6 __ BCS $3ad0 ; (bm_triangle_fill.s56 + 2)
.s5:
3ada : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3add : c5 54 __ CMP T1 + 1 
3adf : d0 0a __ BNE $3aeb ; (bm_triangle_fill.s48 + 0)
.s45:
3ae1 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3ae4 : c5 53 __ CMP T1 + 0 
.s46:
3ae6 : b0 09 __ BCS $3af1 ; (bm_triangle_fill.s6 + 0)
3ae8 : 4c 65 3e JMP $3e65 ; (bm_triangle_fill.s42 + 0)
.s48:
3aeb : 45 54 __ EOR T1 + 1 
3aed : 10 f7 __ BPL $3ae6 ; (bm_triangle_fill.s46 + 0)
.s47:
3aef : b0 f7 __ BCS $3ae8 ; (bm_triangle_fill.s46 + 2)
.s6:
3af1 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3af4 : cd e3 c7 CMP $c7e3 ; (sstack + 37)
3af7 : d0 06 __ BNE $3aff ; (bm_triangle_fill.s44 + 0)
.s41:
3af9 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3afc : 4c 5f 3e JMP $3e5f ; (bm_triangle_fill.s63 + 0)
.s44:
3aff : 4d e3 c7 EOR $c7e3 ; (sstack + 37)
3b02 : 30 04 __ BMI $3b08 ; (bm_triangle_fill.s53 + 0)
.s52:
3b04 : b0 04 __ BCS $3b0a ; (bm_triangle_fill.s7 + 0)
3b06 : 90 0f __ BCC $3b17 ; (bm_triangle_fill.s40 + 0)
.s53:
3b08 : b0 0d __ BCS $3b17 ; (bm_triangle_fill.s40 + 0)
.s7:
3b0a : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3b0d : 85 60 __ STA T7 + 0 
3b0f : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3b12 : 85 61 __ STA T7 + 1 
3b14 : 4c 45 3b JMP $3b45 ; (bm_triangle_fill.s8 + 0)
.s40:
3b17 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3b1a : 85 60 __ STA T7 + 0 
3b1c : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3b1f : 85 61 __ STA T7 + 1 
3b21 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3b24 : 8d e2 c7 STA $c7e2 ; (sstack + 36)
3b27 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3b2a : 8d e3 c7 STA $c7e3 ; (sstack + 37)
3b2d : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3b30 : ae e4 c7 LDX $c7e4 ; (sstack + 38)
3b33 : 8e e0 c7 STX $c7e0 ; (sstack + 34)
3b36 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
3b39 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3b3c : ae e5 c7 LDX $c7e5 ; (sstack + 39)
3b3f : 8e e1 c7 STX $c7e1 ; (sstack + 35)
3b42 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
.s8:
3b45 : ad de c7 LDA $c7de ; (sstack + 32)
3b48 : 85 47 __ STA T5 + 0 
3b4a : ad df c7 LDA $c7df ; (sstack + 33)
3b4d : 85 48 __ STA T5 + 1 
3b4f : c5 61 __ CMP T7 + 1 
3b51 : d0 08 __ BNE $3b5b ; (bm_triangle_fill.s39 + 0)
.s36:
3b53 : a5 47 __ LDA T5 + 0 
3b55 : c5 60 __ CMP T7 + 0 
.s37:
3b57 : b0 08 __ BCS $3b61 ; (bm_triangle_fill.s3 + 0)
3b59 : 90 11 __ BCC $3b6c ; (bm_triangle_fill.s9 + 0)
.s39:
3b5b : 45 61 __ EOR T7 + 1 
3b5d : 10 f8 __ BPL $3b57 ; (bm_triangle_fill.s37 + 0)
.s38:
3b5f : b0 0b __ BCS $3b6c ; (bm_triangle_fill.s9 + 0)
.s3:
3b61 : a2 10 __ LDX #$10
3b63 : bd 99 c7 LDA $c799,x ; (bm_triangle_fill@stack + 0)
3b66 : 95 53 __ STA T1 + 0,x 
3b68 : ca __ __ DEX
3b69 : 10 f8 __ BPL $3b63 ; (bm_triangle_fill.s3 + 2)
3b6b : 60 __ __ RTS
.s9:
3b6c : ad dd c7 LDA $c7dd ; (sstack + 31)
3b6f : 85 46 __ STA T0 + 3 
3b71 : 85 5b __ STA T3 + 3 
3b73 : ad dc c7 LDA $c7dc ; (sstack + 30)
3b76 : 85 5a __ STA T3 + 2 
3b78 : 85 45 __ STA T0 + 2 
3b7a : a9 00 __ LDA #$00
3b7c : 85 43 __ STA T0 + 0 ; (pat + 0)
3b7e : 85 44 __ STA T0 + 1 ; (pat + 1)
3b80 : ad e4 c7 LDA $c7e4 ; (sstack + 38)
3b83 : 85 62 __ STA T8 + 0 
3b85 : 38 __ __ SEC
3b86 : e5 45 __ SBC T0 + 2 
3b88 : 85 1d __ STA ACCU + 2 
3b8a : ad e5 c7 LDA $c7e5 ; (sstack + 39)
3b8d : 85 63 __ STA T8 + 1 
3b8f : e5 46 __ SBC T0 + 3 
3b91 : 85 1e __ STA ACCU + 3 
3b93 : 38 __ __ SEC
3b94 : a5 60 __ LDA T7 + 0 
3b96 : e5 47 __ SBC T5 + 0 
3b98 : 85 03 __ STA WORK + 0 
3b9a : a5 61 __ LDA T7 + 1 
3b9c : e5 48 __ SBC T5 + 1 
3b9e : 85 04 __ STA WORK + 1 
3ba0 : 29 80 __ AND #$80
3ba2 : 10 02 __ BPL $3ba6 ; (bm_triangle_fill.s9 + 58)
3ba4 : a9 ff __ LDA #$ff
3ba6 : 85 06 __ STA WORK + 3 
3ba8 : 85 05 __ STA WORK + 2 
3baa : a9 00 __ LDA #$00
3bac : 85 1b __ STA ACCU + 0 
3bae : 85 1c __ STA ACCU + 1 
3bb0 : 20 09 53 JSR $5309 ; (divs32 + 0)
3bb3 : a5 1b __ LDA ACCU + 0 
3bb5 : 85 5c __ STA T4 + 0 
3bb7 : a5 1c __ LDA ACCU + 1 
3bb9 : 85 5d __ STA T4 + 1 
3bbb : a5 1d __ LDA ACCU + 2 
3bbd : 85 5e __ STA T4 + 2 
3bbf : a5 1e __ LDA ACCU + 3 
3bc1 : 85 5f __ STA T4 + 3 
3bc3 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3bc6 : 85 56 __ STA T2 + 0 
3bc8 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3bcb : 85 57 __ STA T2 + 1 
3bcd : a5 48 __ LDA T5 + 1 
3bcf : c5 57 __ CMP T2 + 1 
3bd1 : d0 09 __ BNE $3bdc ; (bm_triangle_fill.s35 + 0)
.s32:
3bd3 : a5 47 __ LDA T5 + 0 
3bd5 : c5 56 __ CMP T2 + 0 
.s33:
3bd7 : b0 09 __ BCS $3be2 ; (bm_triangle_fill.s10 + 0)
3bd9 : 4c 12 3d JMP $3d12 ; (bm_triangle_fill.s20 + 0)
.s35:
3bdc : 45 57 __ EOR T2 + 1 
3bde : 10 f7 __ BPL $3bd7 ; (bm_triangle_fill.s33 + 0)
.s34:
3be0 : b0 f7 __ BCS $3bd9 ; (bm_triangle_fill.s33 + 2)
.s10:
3be2 : ad d8 c7 LDA $c7d8 ; (sstack + 26)
3be5 : 8d be c7 STA $c7be ; (sstack + 0)
3be8 : ad d9 c7 LDA $c7d9 ; (sstack + 27)
3beb : 8d bf c7 STA $c7bf ; (sstack + 1)
3bee : ad da c7 LDA $c7da ; (sstack + 28)
3bf1 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
3bf4 : ad db c7 LDA $c7db ; (sstack + 29)
3bf7 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
3bfa : a5 56 __ LDA T2 + 0 
3bfc : 8d d2 c7 STA $c7d2 ; (sstack + 20)
3bff : a5 57 __ LDA T2 + 1 
3c01 : 8d d3 c7 STA $c7d3 ; (sstack + 21)
3c04 : a5 60 __ LDA T7 + 0 
3c06 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
3c09 : 38 __ __ SEC
3c0a : e5 56 __ SBC T2 + 0 
3c0c : 85 03 __ STA WORK + 0 
3c0e : a5 61 __ LDA T7 + 1 
3c10 : 8d d5 c7 STA $c7d5 ; (sstack + 23)
3c13 : e5 57 __ SBC T2 + 1 
3c15 : 85 04 __ STA WORK + 1 
3c17 : 29 80 __ AND #$80
3c19 : 10 02 __ BPL $3c1d ; (bm_triangle_fill.s10 + 59)
3c1b : a9 ff __ LDA #$ff
3c1d : 85 06 __ STA WORK + 3 
3c1f : 85 05 __ STA WORK + 2 
3c21 : ad e8 c7 LDA $c7e8 ; (sstack + 42)
3c24 : 8d d6 c7 STA $c7d6 ; (sstack + 24)
3c27 : ad e9 c7 LDA $c7e9 ; (sstack + 43)
3c2a : 8d d7 c7 STA $c7d7 ; (sstack + 25)
3c2d : 38 __ __ SEC
3c2e : a5 62 __ LDA T8 + 0 
3c30 : ed e0 c7 SBC $c7e0 ; (sstack + 34)
3c33 : 85 1d __ STA ACCU + 2 
3c35 : a5 63 __ LDA T8 + 1 
3c37 : ed e1 c7 SBC $c7e1 ; (sstack + 35)
3c3a : 85 1e __ STA ACCU + 3 
3c3c : a9 00 __ LDA #$00
3c3e : 85 1b __ STA ACCU + 0 
3c40 : 85 1c __ STA ACCU + 1 
3c42 : 20 09 53 JSR $5309 ; (divs32 + 0)
3c45 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3c48 : c5 46 __ CMP T0 + 3 
3c4a : d0 03 __ BNE $3c4f ; (bm_triangle_fill.s19 + 0)
3c4c : 4c ff 3c JMP $3cff ; (bm_triangle_fill.s14 + 0)
.s19:
3c4f : 45 46 __ EOR T0 + 3 
3c51 : 30 04 __ BMI $3c57 ; (bm_triangle_fill.s18 + 0)
.s17:
3c53 : b0 04 __ BCS $3c59 ; (bm_triangle_fill.s11 + 0)
3c55 : 90 52 __ BCC $3ca9 ; (bm_triangle_fill.s13 + 0)
.s18:
3c57 : b0 50 __ BCS $3ca9 ; (bm_triangle_fill.s13 + 0)
.s11:
3c59 : a5 43 __ LDA T0 + 0 ; (pat + 0)
3c5b : 8d c2 c7 STA $c7c2 ; (sstack + 4)
3c5e : a5 44 __ LDA T0 + 1 ; (pat + 1)
3c60 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
3c63 : a5 45 __ LDA T0 + 2 
3c65 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
3c68 : a5 46 __ LDA T0 + 3 
3c6a : 8d c5 c7 STA $c7c5 ; (sstack + 7)
3c6d : a9 00 __ LDA #$00
3c6f : 8d c6 c7 STA $c7c6 ; (sstack + 8)
3c72 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
3c75 : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3c78 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
3c7b : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3c7e : 8d c9 c7 STA $c7c9 ; (sstack + 11)
3c81 : a5 5c __ LDA T4 + 0 
3c83 : 8d ca c7 STA $c7ca ; (sstack + 12)
3c86 : a5 5d __ LDA T4 + 1 
3c88 : 8d cb c7 STA $c7cb ; (sstack + 13)
3c8b : a5 5e __ LDA T4 + 2 
3c8d : 8d cc c7 STA $c7cc ; (sstack + 14)
3c90 : a5 5f __ LDA T4 + 3 
3c92 : 8d cd c7 STA $c7cd ; (sstack + 15)
3c95 : a5 1b __ LDA ACCU + 0 
3c97 : 8d ce c7 STA $c7ce ; (sstack + 16)
3c9a : a5 1c __ LDA ACCU + 1 
3c9c : 8d cf c7 STA $c7cf ; (sstack + 17)
3c9f : a5 1d __ LDA ACCU + 2 
3ca1 : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3ca4 : a5 1e __ LDA ACCU + 3 
3ca6 : 4c f6 3c JMP $3cf6 ; (bm_triangle_fill.s12 + 0)
.s13:
3ca9 : a9 00 __ LDA #$00
3cab : 8d c2 c7 STA $c7c2 ; (sstack + 4)
3cae : 8d c3 c7 STA $c7c3 ; (sstack + 5)
3cb1 : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3cb4 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
3cb7 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3cba : 8d c5 c7 STA $c7c5 ; (sstack + 7)
3cbd : a5 43 __ LDA T0 + 0 ; (pat + 0)
3cbf : 8d c6 c7 STA $c7c6 ; (sstack + 8)
3cc2 : a5 44 __ LDA T0 + 1 ; (pat + 1)
3cc4 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
3cc7 : a5 45 __ LDA T0 + 2 
3cc9 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
3ccc : a5 46 __ LDA T0 + 3 
3cce : 8d c9 c7 STA $c7c9 ; (sstack + 11)
3cd1 : a5 1b __ LDA ACCU + 0 
3cd3 : 8d ca c7 STA $c7ca ; (sstack + 12)
3cd6 : a5 1c __ LDA ACCU + 1 
3cd8 : 8d cb c7 STA $c7cb ; (sstack + 13)
3cdb : a5 1d __ LDA ACCU + 2 
3cdd : 8d cc c7 STA $c7cc ; (sstack + 14)
3ce0 : a5 1e __ LDA ACCU + 3 
3ce2 : 8d cd c7 STA $c7cd ; (sstack + 15)
3ce5 : a5 5c __ LDA T4 + 0 
3ce7 : 8d ce c7 STA $c7ce ; (sstack + 16)
3cea : a5 5d __ LDA T4 + 1 
3cec : 8d cf c7 STA $c7cf ; (sstack + 17)
3cef : a5 5e __ LDA T4 + 2 
3cf1 : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3cf4 : a5 5f __ LDA T4 + 3 
.s12:
3cf6 : 8d d1 c7 STA $c7d1 ; (sstack + 19)
3cf9 : 20 e4 3e JSR $3ee4 ; (bm_trapezoid_fill.s1 + 0)
3cfc : 4c 61 3b JMP $3b61 ; (bm_triangle_fill.s3 + 0)
.s14:
3cff : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3d02 : c5 45 __ CMP T0 + 2 
3d04 : f0 03 __ BEQ $3d09 ; (bm_triangle_fill.s15 + 0)
3d06 : 4c 53 3c JMP $3c53 ; (bm_triangle_fill.s17 + 0)
.s15:
3d09 : a5 44 __ LDA T0 + 1 ; (pat + 1)
3d0b : d0 9c __ BNE $3ca9 ; (bm_triangle_fill.s13 + 0)
.s16:
3d0d : c5 43 __ CMP T0 + 0 ; (pat + 0)
3d0f : 4c 53 3c JMP $3c53 ; (bm_triangle_fill.s17 + 0)
.s20:
3d12 : ad d8 c7 LDA $c7d8 ; (sstack + 26)
3d15 : 8d be c7 STA $c7be ; (sstack + 0)
3d18 : ad d9 c7 LDA $c7d9 ; (sstack + 27)
3d1b : 8d bf c7 STA $c7bf ; (sstack + 1)
3d1e : ad da c7 LDA $c7da ; (sstack + 28)
3d21 : 8d c0 c7 STA $c7c0 ; (sstack + 2)
3d24 : ad db c7 LDA $c7db ; (sstack + 29)
3d27 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
3d2a : a9 00 __ LDA #$00
3d2c : 8d c2 c7 STA $c7c2 ; (sstack + 4)
3d2f : 8d c6 c7 STA $c7c6 ; (sstack + 8)
3d32 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
3d35 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
3d38 : a5 5a __ LDA T3 + 2 
3d3a : 8d c4 c7 STA $c7c4 ; (sstack + 6)
3d3d : 8d c8 c7 STA $c7c8 ; (sstack + 10)
3d40 : a5 5b __ LDA T3 + 3 
3d42 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
3d45 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
3d48 : a5 47 __ LDA T5 + 0 
3d4a : 8d d2 c7 STA $c7d2 ; (sstack + 20)
3d4d : a5 48 __ LDA T5 + 1 
3d4f : 8d d3 c7 STA $c7d3 ; (sstack + 21)
3d52 : a5 56 __ LDA T2 + 0 
3d54 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
3d57 : 38 __ __ SEC
3d58 : e5 47 __ SBC T5 + 0 
3d5a : 85 53 __ STA T1 + 0 
3d5c : 85 03 __ STA WORK + 0 
3d5e : a5 57 __ LDA T2 + 1 
3d60 : 8d d5 c7 STA $c7d5 ; (sstack + 23)
3d63 : e5 48 __ SBC T5 + 1 
3d65 : 85 54 __ STA T1 + 1 
3d67 : 85 04 __ STA WORK + 1 
3d69 : 29 80 __ AND #$80
3d6b : 10 02 __ BPL $3d6f ; (bm_triangle_fill.s20 + 93)
3d6d : a9 ff __ LDA #$ff
3d6f : 85 55 __ STA T1 + 2 
3d71 : 85 06 __ STA WORK + 3 
3d73 : 85 05 __ STA WORK + 2 
3d75 : ad e8 c7 LDA $c7e8 ; (sstack + 42)
3d78 : 8d d6 c7 STA $c7d6 ; (sstack + 24)
3d7b : ad e9 c7 LDA $c7e9 ; (sstack + 43)
3d7e : 8d d7 c7 STA $c7d7 ; (sstack + 25)
3d81 : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3d84 : 38 __ __ SEC
3d85 : ed dc c7 SBC $c7dc ; (sstack + 30)
3d88 : 85 1d __ STA ACCU + 2 
3d8a : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3d8d : ed dd c7 SBC $c7dd ; (sstack + 31)
3d90 : 85 1e __ STA ACCU + 3 
3d92 : a9 00 __ LDA #$00
3d94 : 85 1b __ STA ACCU + 0 
3d96 : 85 1c __ STA ACCU + 1 
3d98 : 20 09 53 JSR $5309 ; (divs32 + 0)
3d9b : a5 1e __ LDA ACCU + 3 
3d9d : c5 5f __ CMP T4 + 3 
3d9f : d0 03 __ BNE $3da4 ; (bm_triangle_fill.s31 + 0)
3da1 : 4c 49 3e JMP $3e49 ; (bm_triangle_fill.s26 + 0)
.s31:
3da4 : 45 5f __ EOR T4 + 3 
3da6 : 30 04 __ BMI $3dac ; (bm_triangle_fill.s30 + 0)
.s29:
3da8 : b0 04 __ BCS $3dae ; (bm_triangle_fill.s21 + 0)
3daa : 90 2a __ BCC $3dd6 ; (bm_triangle_fill.s25 + 0)
.s30:
3dac : b0 28 __ BCS $3dd6 ; (bm_triangle_fill.s25 + 0)
.s21:
3dae : a5 5c __ LDA T4 + 0 
3db0 : 8d ca c7 STA $c7ca ; (sstack + 12)
3db3 : a5 5d __ LDA T4 + 1 
3db5 : 8d cb c7 STA $c7cb ; (sstack + 13)
3db8 : a5 5e __ LDA T4 + 2 
3dba : 8d cc c7 STA $c7cc ; (sstack + 14)
3dbd : a5 5f __ LDA T4 + 3 
3dbf : 8d cd c7 STA $c7cd ; (sstack + 15)
3dc2 : a5 1b __ LDA ACCU + 0 
3dc4 : 8d ce c7 STA $c7ce ; (sstack + 16)
3dc7 : a5 1c __ LDA ACCU + 1 
3dc9 : 8d cf c7 STA $c7cf ; (sstack + 17)
3dcc : a5 1d __ LDA ACCU + 2 
3dce : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3dd1 : a5 1e __ LDA ACCU + 3 
3dd3 : 4c fb 3d JMP $3dfb ; (bm_triangle_fill.s22 + 0)
.s25:
3dd6 : a5 1b __ LDA ACCU + 0 
3dd8 : 8d ca c7 STA $c7ca ; (sstack + 12)
3ddb : a5 1c __ LDA ACCU + 1 
3ddd : 8d cb c7 STA $c7cb ; (sstack + 13)
3de0 : a5 1d __ LDA ACCU + 2 
3de2 : 8d cc c7 STA $c7cc ; (sstack + 14)
3de5 : a5 1e __ LDA ACCU + 3 
3de7 : 8d cd c7 STA $c7cd ; (sstack + 15)
3dea : a5 5c __ LDA T4 + 0 
3dec : 8d ce c7 STA $c7ce ; (sstack + 16)
3def : a5 5d __ LDA T4 + 1 
3df1 : 8d cf c7 STA $c7cf ; (sstack + 17)
3df4 : a5 5e __ LDA T4 + 2 
3df6 : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3df9 : a5 5f __ LDA T4 + 3 
.s22:
3dfb : 8d d1 c7 STA $c7d1 ; (sstack + 19)
3dfe : 20 e4 3e JSR $3ee4 ; (bm_trapezoid_fill.s1 + 0)
3e01 : a5 61 __ LDA T7 + 1 
3e03 : c5 57 __ CMP T2 + 1 
3e05 : d0 09 __ BNE $3e10 ; (bm_triangle_fill.s23 + 0)
.s24:
3e07 : a5 60 __ LDA T7 + 0 
3e09 : c5 56 __ CMP T2 + 0 
3e0b : d0 03 __ BNE $3e10 ; (bm_triangle_fill.s23 + 0)
3e0d : 4c 61 3b JMP $3b61 ; (bm_triangle_fill.s3 + 0)
.s23:
3e10 : a5 5c __ LDA T4 + 0 
3e12 : 85 1b __ STA ACCU + 0 
3e14 : a5 5d __ LDA T4 + 1 
3e16 : 85 1c __ STA ACCU + 1 
3e18 : a5 5e __ LDA T4 + 2 
3e1a : 85 1d __ STA ACCU + 2 
3e1c : a5 5f __ LDA T4 + 3 
3e1e : 85 1e __ STA ACCU + 3 
3e20 : a5 53 __ LDA T1 + 0 
3e22 : 85 03 __ STA WORK + 0 
3e24 : a5 54 __ LDA T1 + 1 
3e26 : 85 04 __ STA WORK + 1 
3e28 : a5 55 __ LDA T1 + 2 
3e2a : 85 05 __ STA WORK + 2 
3e2c : 85 06 __ STA WORK + 3 
3e2e : 20 a1 52 JSR $52a1 ; (mul32 + 0)
3e31 : a5 07 __ LDA WORK + 4 
3e33 : 85 43 __ STA T0 + 0 ; (pat + 0)
3e35 : a5 08 __ LDA WORK + 5 
3e37 : 85 44 __ STA T0 + 1 ; (pat + 1)
3e39 : 18 __ __ CLC
3e3a : a5 09 __ LDA WORK + 6 
3e3c : 65 5a __ ADC T3 + 2 
3e3e : 85 45 __ STA T0 + 2 
3e40 : a5 0a __ LDA WORK + 7 
3e42 : 65 5b __ ADC T3 + 3 
3e44 : 85 46 __ STA T0 + 3 
3e46 : 4c e2 3b JMP $3be2 ; (bm_triangle_fill.s10 + 0)
.s26:
3e49 : a5 1d __ LDA ACCU + 2 
3e4b : c5 5e __ CMP T4 + 2 
3e4d : f0 03 __ BEQ $3e52 ; (bm_triangle_fill.s27 + 0)
3e4f : 4c a8 3d JMP $3da8 ; (bm_triangle_fill.s29 + 0)
.s27:
3e52 : a5 1c __ LDA ACCU + 1 
3e54 : c5 5d __ CMP T4 + 1 
3e56 : d0 f7 __ BNE $3e4f ; (bm_triangle_fill.s26 + 6)
.s28:
3e58 : a5 1b __ LDA ACCU + 0 
3e5a : c5 5c __ CMP T4 + 0 
3e5c : 4c a8 3d JMP $3da8 ; (bm_triangle_fill.s29 + 0)
.s63:
3e5f : cd e2 c7 CMP $c7e2 ; (sstack + 36)
3e62 : 4c 04 3b JMP $3b04 ; (bm_triangle_fill.s52 + 0)
.s42:
3e65 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3e68 : 8d de c7 STA $c7de ; (sstack + 32)
3e6b : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3e6e : 8d df c7 STA $c7df ; (sstack + 33)
3e71 : a5 53 __ LDA T1 + 0 
3e73 : 8d e6 c7 STA $c7e6 ; (sstack + 40)
3e76 : ad dc c7 LDA $c7dc ; (sstack + 30)
3e79 : ae e4 c7 LDX $c7e4 ; (sstack + 38)
3e7c : 8e dc c7 STX $c7dc ; (sstack + 30)
3e7f : 8d e4 c7 STA $c7e4 ; (sstack + 38)
3e82 : ad dd c7 LDA $c7dd ; (sstack + 31)
3e85 : ae e5 c7 LDX $c7e5 ; (sstack + 39)
3e88 : 8e dd c7 STX $c7dd ; (sstack + 31)
3e8b : 8d e5 c7 STA $c7e5 ; (sstack + 39)
3e8e : a5 54 __ LDA T1 + 1 
3e90 : 8d e7 c7 STA $c7e7 ; (sstack + 41)
3e93 : cd e3 c7 CMP $c7e3 ; (sstack + 37)
3e96 : f0 03 __ BEQ $3e9b ; (bm_triangle_fill.s43 + 0)
3e98 : 4c ff 3a JMP $3aff ; (bm_triangle_fill.s44 + 0)
.s43:
3e9b : a5 53 __ LDA T1 + 0 
3e9d : 4c 5f 3e JMP $3e5f ; (bm_triangle_fill.s63 + 0)
.s50:
3ea0 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3ea3 : 8d de c7 STA $c7de ; (sstack + 32)
3ea6 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3ea9 : 8d df c7 STA $c7df ; (sstack + 33)
3eac : a5 53 __ LDA T1 + 0 
3eae : 8d e2 c7 STA $c7e2 ; (sstack + 36)
3eb1 : a5 54 __ LDA T1 + 1 
3eb3 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
3eb6 : ad dc c7 LDA $c7dc ; (sstack + 30)
3eb9 : ae e0 c7 LDX $c7e0 ; (sstack + 34)
3ebc : 8e dc c7 STX $c7dc ; (sstack + 30)
3ebf : 8d e0 c7 STA $c7e0 ; (sstack + 34)
3ec2 : ad dd c7 LDA $c7dd ; (sstack + 31)
3ec5 : ae e1 c7 LDX $c7e1 ; (sstack + 35)
3ec8 : 8e dd c7 STX $c7dd ; (sstack + 31)
3ecb : 8d e1 c7 STA $c7e1 ; (sstack + 35)
3ece : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3ed1 : c5 54 __ CMP T1 + 1 
3ed3 : d0 08 __ BNE $3edd ; (bm_triangle_fill.s54 + 0)
.s51:
3ed5 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3ed8 : c5 53 __ CMP T1 + 0 
3eda : 4c 04 3b JMP $3b04 ; (bm_triangle_fill.s52 + 0)
.s54:
3edd : 45 54 __ EOR T1 + 1 
3edf : 10 f9 __ BPL $3eda ; (bm_triangle_fill.s51 + 5)
3ee1 : 4c 08 3b JMP $3b08 ; (bm_triangle_fill.s53 + 0)
--------------------------------------------------------------------
bm_trapezoid_fill: ; bm_trapezoid_fill(const struct Bitmap*,const struct ClipRect*,i32,i32,i32,i32,i16,i16,const u8*)->void
;  85, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
3ee4 : a2 0e __ LDX #$0e
3ee6 : b5 53 __ LDA T3 + 0,x 
3ee8 : 9d ad c7 STA $c7ad,x ; (bm_trapezoid_fill@stack + 0)
3eeb : ca __ __ DEX
3eec : 10 f8 __ BPL $3ee6 ; (bm_trapezoid_fill.s1 + 2)
.s4:
3eee : ad c0 c7 LDA $c7c0 ; (sstack + 2)
3ef1 : 85 50 __ STA T6 + 0 
3ef3 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
3ef6 : 85 51 __ STA T6 + 1 
3ef8 : a0 02 __ LDY #$02
3efa : b1 50 __ LDA (T6 + 0),y 
3efc : 85 48 __ STA T1 + 0 
3efe : c8 __ __ INY
3eff : b1 50 __ LDA (T6 + 0),y 
3f01 : 85 49 __ STA T1 + 1 
3f03 : cd d5 c7 CMP $c7d5 ; (sstack + 23)
3f06 : d0 09 __ BNE $3f11 ; (bm_trapezoid_fill.s30 + 0)
.s27:
3f08 : a5 48 __ LDA T1 + 0 
3f0a : cd d4 c7 CMP $c7d4 ; (sstack + 22)
.s28:
3f0d : 90 09 __ BCC $3f18 ; (bm_trapezoid_fill.s5 + 0)
3f0f : b0 2c __ BCS $3f3d ; (bm_trapezoid_fill.s3 + 0)
.s30:
3f11 : 4d d5 c7 EOR $c7d5 ; (sstack + 23)
3f14 : 10 f7 __ BPL $3f0d ; (bm_trapezoid_fill.s28 + 0)
.s29:
3f16 : 90 25 __ BCC $3f3d ; (bm_trapezoid_fill.s3 + 0)
.s5:
3f18 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
3f1b : 85 57 __ STA T4 + 0 
3f1d : a0 06 __ LDY #$06
3f1f : b1 50 __ LDA (T6 + 0),y 
3f21 : 85 43 __ STA T5 + 0 
3f23 : c8 __ __ INY
3f24 : b1 50 __ LDA (T6 + 0),y 
3f26 : 85 44 __ STA T5 + 1 
3f28 : ad d3 c7 LDA $c7d3 ; (sstack + 21)
3f2b : c5 44 __ CMP T5 + 1 
3f2d : d0 08 __ BNE $3f37 ; (bm_trapezoid_fill.s26 + 0)
.s23:
3f2f : a5 57 __ LDA T4 + 0 
3f31 : c5 43 __ CMP T5 + 0 
.s24:
3f33 : b0 08 __ BCS $3f3d ; (bm_trapezoid_fill.s3 + 0)
3f35 : 90 11 __ BCC $3f48 ; (bm_trapezoid_fill.s6 + 0)
.s26:
3f37 : 45 44 __ EOR T5 + 1 
3f39 : 10 f8 __ BPL $3f33 ; (bm_trapezoid_fill.s24 + 0)
.s25:
3f3b : b0 0b __ BCS $3f48 ; (bm_trapezoid_fill.s6 + 0)
.s3:
3f3d : a2 0e __ LDX #$0e
3f3f : bd ad c7 LDA $c7ad,x ; (bm_trapezoid_fill@stack + 0)
3f42 : 95 53 __ STA T3 + 0,x 
3f44 : ca __ __ DEX
3f45 : 10 f8 __ BPL $3f3f ; (bm_trapezoid_fill.s3 + 2)
3f47 : 60 __ __ RTS
.s6:
3f48 : ad c2 c7 LDA $c7c2 ; (sstack + 4)
3f4b : 85 4c __ STA T2 + 0 
3f4d : ad c3 c7 LDA $c7c3 ; (sstack + 5)
3f50 : 85 4d __ STA T2 + 1 
3f52 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
3f55 : 85 4e __ STA T2 + 2 
3f57 : ad c5 c7 LDA $c7c5 ; (sstack + 7)
3f5a : 85 4f __ STA T2 + 3 
3f5c : ad c6 c7 LDA $c7c6 ; (sstack + 8)
3f5f : 85 53 __ STA T3 + 0 
3f61 : ad c7 c7 LDA $c7c7 ; (sstack + 9)
3f64 : 85 54 __ STA T3 + 1 
3f66 : ad c8 c7 LDA $c7c8 ; (sstack + 10)
3f69 : 85 55 __ STA T3 + 2 
3f6b : ad c9 c7 LDA $c7c9 ; (sstack + 11)
3f6e : 85 56 __ STA T3 + 3 
3f70 : a5 44 __ LDA T5 + 1 
3f72 : cd d5 c7 CMP $c7d5 ; (sstack + 23)
3f75 : d0 09 __ BNE $3f80 ; (bm_trapezoid_fill.s22 + 0)
.s19:
3f77 : a5 43 __ LDA T5 + 0 
3f79 : cd d4 c7 CMP $c7d4 ; (sstack + 22)
.s20:
3f7c : 90 09 __ BCC $3f87 ; (bm_trapezoid_fill.s18 + 0)
3f7e : b0 11 __ BCS $3f91 ; (bm_trapezoid_fill.s7 + 0)
.s22:
3f80 : 4d d5 c7 EOR $c7d5 ; (sstack + 23)
3f83 : 10 f7 __ BPL $3f7c ; (bm_trapezoid_fill.s20 + 0)
.s21:
3f85 : 90 0a __ BCC $3f91 ; (bm_trapezoid_fill.s7 + 0)
.s18:
3f87 : a5 43 __ LDA T5 + 0 
3f89 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
3f8c : a5 44 __ LDA T5 + 1 
3f8e : 8d d5 c7 STA $c7d5 ; (sstack + 23)
.s7:
3f91 : ad d3 c7 LDA $c7d3 ; (sstack + 21)
3f94 : c5 49 __ CMP T1 + 1 
3f96 : d0 09 __ BNE $3fa1 ; (bm_trapezoid_fill.s17 + 0)
.s14:
3f98 : a5 57 __ LDA T4 + 0 
3f9a : c5 48 __ CMP T1 + 0 
.s15:
3f9c : b0 09 __ BCS $3fa7 ; (bm_trapezoid_fill.s8 + 0)
3f9e : 4c d0 40 JMP $40d0 ; (bm_trapezoid_fill.s13 + 0)
.s17:
3fa1 : 45 49 __ EOR T1 + 1 
3fa3 : 10 f7 __ BPL $3f9c ; (bm_trapezoid_fill.s15 + 0)
.s16:
3fa5 : b0 f7 __ BCS $3f9e ; (bm_trapezoid_fill.s15 + 2)
.s8:
3fa7 : ad d4 c7 LDA $c7d4 ; (sstack + 22)
3faa : 85 52 __ STA T7 + 0 
3fac : ad d2 c7 LDA $c7d2 ; (sstack + 20)
3faf : c5 52 __ CMP T7 + 0 
3fb1 : b0 8a __ BCS $3f3d ; (bm_trapezoid_fill.s3 + 0)
.s9:
3fb3 : 29 f8 __ AND #$f8
3fb5 : 85 1b __ STA ACCU + 0 ; (clip + 0)
3fb7 : ad be c7 LDA $c7be ; (sstack + 0)
3fba : 85 57 __ STA T4 + 0 
3fbc : ad bf c7 LDA $c7bf ; (sstack + 1)
3fbf : 85 58 __ STA T4 + 1 
3fc1 : ad d3 c7 LDA $c7d3 ; (sstack + 21)
3fc4 : 85 1c __ STA ACCU + 1 ; (clip + 1)
3fc6 : a0 04 __ LDY #$04
3fc8 : b1 57 __ LDA (T4 + 0),y 
3fca : 85 43 __ STA T5 + 0 
3fcc : 20 af 4d JSR $4daf ; (mul16by8 + 0)
3fcf : a0 00 __ LDY #$00
3fd1 : b1 57 __ LDA (T4 + 0),y 
3fd3 : 18 __ __ CLC
3fd4 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
3fd6 : 85 02 __ STA $02 
3fd8 : c8 __ __ INY
3fd9 : b1 57 __ LDA (T4 + 0),y 
3fdb : 65 1c __ ADC ACCU + 1 ; (clip + 1)
3fdd : aa __ __ TAX
3fde : ad d2 c7 LDA $c7d2 ; (sstack + 20)
3fe1 : 85 61 __ STA T11 + 0 
3fe3 : 29 07 __ AND #$07
3fe5 : 18 __ __ CLC
3fe6 : 65 02 __ ADC $02 
3fe8 : 85 5b __ STA T8 + 0 
3fea : 90 02 __ BCC $3fee ; (bm_trapezoid_fill.s32 + 0)
.s31:
3fec : e8 __ __ INX
3fed : 18 __ __ CLC
.s32:
3fee : 86 5c __ STX T8 + 1 
3ff0 : a5 43 __ LDA T5 + 0 
3ff2 : 69 ff __ ADC #$ff
3ff4 : 2a __ __ ROL
3ff5 : 2a __ __ ROL
3ff6 : 2a __ __ ROL
3ff7 : aa __ __ TAX
3ff8 : 29 f8 __ AND #$f8
3ffa : 85 5d __ STA T9 + 0 
3ffc : 8a __ __ TXA
3ffd : 29 07 __ AND #$07
3fff : 2a __ __ ROL
4000 : 69 f8 __ ADC #$f8
4002 : 85 5e __ STA T9 + 1 
4004 : ad d6 c7 LDA $c7d6 ; (sstack + 24)
4007 : 85 5f __ STA T10 + 0 
4009 : ad d7 c7 LDA $c7d7 ; (sstack + 25)
400c : 85 60 __ STA T10 + 1 
400e : ad ce c7 LDA $c7ce ; (sstack + 16)
4011 : 85 48 __ STA T1 + 0 
4013 : ad cf c7 LDA $c7cf ; (sstack + 17)
4016 : 85 49 __ STA T1 + 1 
4018 : ad d0 c7 LDA $c7d0 ; (sstack + 18)
401b : 85 4a __ STA T1 + 2 
401d : ad d1 c7 LDA $c7d1 ; (sstack + 19)
4020 : 85 4b __ STA T1 + 3 
4022 : ad ca c7 LDA $c7ca ; (sstack + 12)
4025 : 85 57 __ STA T4 + 0 
4027 : ad cb c7 LDA $c7cb ; (sstack + 13)
402a : 85 58 __ STA T4 + 1 
402c : ad cc c7 LDA $c7cc ; (sstack + 14)
402f : 85 59 __ STA T4 + 2 
4031 : ad cd c7 LDA $c7cd ; (sstack + 15)
4034 : 85 5a __ STA T4 + 3 
.l10:
4036 : a0 00 __ LDY #$00
4038 : b1 50 __ LDA (T6 + 0),y 
403a : 85 0d __ STA P0 
403c : c8 __ __ INY
403d : b1 50 __ LDA (T6 + 0),y 
403f : 85 0e __ STA P1 
4041 : a0 04 __ LDY #$04
4043 : b1 50 __ LDA (T6 + 0),y 
4045 : 85 0f __ STA P2 
4047 : c8 __ __ INY
4048 : b1 50 __ LDA (T6 + 0),y 
404a : 85 10 __ STA P3 
404c : a5 5b __ LDA T8 + 0 
404e : 85 11 __ STA P4 
4050 : a5 5c __ LDA T8 + 1 
4052 : 85 12 __ STA P5 
4054 : a5 61 __ LDA T11 + 0 
4056 : 29 07 __ AND #$07
4058 : a8 __ __ TAY
4059 : b1 5f __ LDA (T10 + 0),y 
405b : 85 17 __ STA P10 
405d : a5 4e __ LDA T2 + 2 
405f : 85 13 __ STA P6 
4061 : a5 4f __ LDA T2 + 3 
4063 : 85 14 __ STA P7 
4065 : a5 55 __ LDA T3 + 2 
4067 : 85 15 __ STA P8 
4069 : a5 56 __ LDA T3 + 3 
406b : 85 16 __ STA P9 
406d : 20 66 41 JSR $4166 ; (bm_scan_fill.s4 + 0)
4070 : 18 __ __ CLC
4071 : a5 11 __ LDA P4 
4073 : 69 01 __ ADC #$01
4075 : 85 5b __ STA T8 + 0 
4077 : a5 12 __ LDA P5 
4079 : 69 00 __ ADC #$00
407b : 85 5c __ STA T8 + 1 
407d : a5 5b __ LDA T8 + 0 
407f : 29 07 __ AND #$07
4081 : d0 0d __ BNE $4090 ; (bm_trapezoid_fill.s12 + 0)
.s11:
4083 : 18 __ __ CLC
4084 : a5 5b __ LDA T8 + 0 
4086 : 65 5d __ ADC T9 + 0 
4088 : 85 5b __ STA T8 + 0 
408a : a5 5c __ LDA T8 + 1 
408c : 65 5e __ ADC T9 + 1 
408e : 85 5c __ STA T8 + 1 
.s12:
4090 : 18 __ __ CLC
4091 : a5 48 __ LDA T1 + 0 
4093 : 65 53 __ ADC T3 + 0 
4095 : 85 53 __ STA T3 + 0 
4097 : a5 49 __ LDA T1 + 1 
4099 : 65 54 __ ADC T3 + 1 
409b : 85 54 __ STA T3 + 1 
409d : a5 4a __ LDA T1 + 2 
409f : 65 55 __ ADC T3 + 2 
40a1 : 85 55 __ STA T3 + 2 
40a3 : a5 4b __ LDA T1 + 3 
40a5 : 65 56 __ ADC T3 + 3 
40a7 : 85 56 __ STA T3 + 3 
40a9 : 18 __ __ CLC
40aa : a5 57 __ LDA T4 + 0 
40ac : 65 4c __ ADC T2 + 0 
40ae : 85 4c __ STA T2 + 0 
40b0 : a5 58 __ LDA T4 + 1 
40b2 : 65 4d __ ADC T2 + 1 
40b4 : 85 4d __ STA T2 + 1 
40b6 : a5 59 __ LDA T4 + 2 
40b8 : 65 4e __ ADC T2 + 2 
40ba : 85 4e __ STA T2 + 2 
40bc : a5 5a __ LDA T4 + 3 
40be : 65 4f __ ADC T2 + 3 
40c0 : 85 4f __ STA T2 + 3 
40c2 : e6 61 __ INC T11 + 0 
40c4 : a5 61 __ LDA T11 + 0 
40c6 : c5 52 __ CMP T7 + 0 
40c8 : b0 03 __ BCS $40cd ; (bm_trapezoid_fill.s12 + 61)
40ca : 4c 36 40 JMP $4036 ; (bm_trapezoid_fill.l10 + 0)
40cd : 4c 3d 3f JMP $3f3d ; (bm_trapezoid_fill.s3 + 0)
.s13:
40d0 : a5 48 __ LDA T1 + 0 
40d2 : 8d d2 c7 STA $c7d2 ; (sstack + 20)
40d5 : 38 __ __ SEC
40d6 : e5 57 __ SBC T4 + 0 
40d8 : 85 45 __ STA T0 + 0 
40da : 85 03 __ STA WORK + 0 
40dc : a5 49 __ LDA T1 + 1 
40de : aa __ __ TAX
40df : ed d3 c7 SBC $c7d3 ; (sstack + 21)
40e2 : 8e d3 c7 STX $c7d3 ; (sstack + 21)
40e5 : 85 46 __ STA T0 + 1 
40e7 : 85 04 __ STA WORK + 1 
40e9 : 29 80 __ AND #$80
40eb : 10 02 __ BPL $40ef ; (bm_trapezoid_fill.s13 + 31)
40ed : a9 ff __ LDA #$ff
40ef : 85 47 __ STA T0 + 2 
40f1 : 85 06 __ STA WORK + 3 
40f3 : 85 05 __ STA WORK + 2 
40f5 : ad ce c7 LDA $c7ce ; (sstack + 16)
40f8 : 85 1b __ STA ACCU + 0 ; (clip + 0)
40fa : ad cf c7 LDA $c7cf ; (sstack + 17)
40fd : 85 1c __ STA ACCU + 1 ; (clip + 1)
40ff : ad d0 c7 LDA $c7d0 ; (sstack + 18)
4102 : 85 1d __ STA ACCU + 2 ; (x0 + 0)
4104 : ad d1 c7 LDA $c7d1 ; (sstack + 19)
4107 : 85 1e __ STA ACCU + 3 ; (x0 + 1)
4109 : 20 a1 52 JSR $52a1 ; (mul32 + 0)
410c : 18 __ __ CLC
410d : a5 07 __ LDA WORK + 4 
410f : 65 53 __ ADC T3 + 0 
4111 : 85 53 __ STA T3 + 0 
4113 : a5 08 __ LDA WORK + 5 
4115 : 65 54 __ ADC T3 + 1 
4117 : 85 54 __ STA T3 + 1 
4119 : a5 09 __ LDA WORK + 6 
411b : 65 55 __ ADC T3 + 2 
411d : 85 55 __ STA T3 + 2 
411f : a5 0a __ LDA WORK + 7 
4121 : 65 56 __ ADC T3 + 3 
4123 : 85 56 __ STA T3 + 3 
4125 : ad ca c7 LDA $c7ca ; (sstack + 12)
4128 : 85 1b __ STA ACCU + 0 ; (clip + 0)
412a : ad cb c7 LDA $c7cb ; (sstack + 13)
412d : 85 1c __ STA ACCU + 1 ; (clip + 1)
412f : ad cc c7 LDA $c7cc ; (sstack + 14)
4132 : 85 1d __ STA ACCU + 2 ; (x0 + 0)
4134 : ad cd c7 LDA $c7cd ; (sstack + 15)
4137 : 85 1e __ STA ACCU + 3 ; (x0 + 1)
4139 : a5 45 __ LDA T0 + 0 
413b : 85 03 __ STA WORK + 0 
413d : a5 46 __ LDA T0 + 1 
413f : 85 04 __ STA WORK + 1 
4141 : a5 47 __ LDA T0 + 2 
4143 : 85 05 __ STA WORK + 2 
4145 : 85 06 __ STA WORK + 3 
4147 : 20 a1 52 JSR $52a1 ; (mul32 + 0)
414a : 18 __ __ CLC
414b : a5 07 __ LDA WORK + 4 
414d : 65 4c __ ADC T2 + 0 
414f : 85 4c __ STA T2 + 0 
4151 : a5 08 __ LDA WORK + 5 
4153 : 65 4d __ ADC T2 + 1 
4155 : 85 4d __ STA T2 + 1 
4157 : a5 09 __ LDA WORK + 6 
4159 : 65 4e __ ADC T2 + 2 
415b : 85 4e __ STA T2 + 2 
415d : a5 0a __ LDA WORK + 7 
415f : 65 4f __ ADC T2 + 3 
4161 : 85 4f __ STA T2 + 3 
4163 : 4c a7 3f JMP $3fa7 ; (bm_trapezoid_fill.s8 + 0)
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
4166 : a5 14 __ LDA P7 ; (x0 + 1)
4168 : 30 0a __ BMI $4174 ; (bm_scan_fill.s24 + 0)
.s27:
416a : c5 0e __ CMP P1 ; (left + 1)
416c : d0 04 __ BNE $4172 ; (bm_scan_fill.s26 + 0)
.s25:
416e : a5 13 __ LDA P6 ; (x0 + 0)
4170 : c5 0d __ CMP P0 ; (left + 0)
.s26:
4172 : b0 08 __ BCS $417c ; (bm_scan_fill.s5 + 0)
.s24:
4174 : a5 0d __ LDA P0 ; (left + 0)
4176 : 85 13 __ STA P6 ; (x0 + 0)
4178 : a5 0e __ LDA P1 ; (left + 1)
417a : 85 14 __ STA P7 ; (x0 + 1)
.s5:
417c : 24 16 __ BIT P9 ; (x1 + 1)
417e : 30 64 __ BMI $41e4 ; (bm_scan_fill.s3 + 0)
.s23:
4180 : a5 10 __ LDA P3 ; (right + 1)
4182 : c5 16 __ CMP P9 ; (x1 + 1)
4184 : f0 03 __ BEQ $4189 ; (bm_scan_fill.s21 + 0)
4186 : 4c 00 43 JMP $4300 ; (bm_scan_fill.s22 + 0)
.s21:
4189 : a5 0f __ LDA P2 ; (right + 0)
418b : c5 15 __ CMP P8 ; (x1 + 0)
418d : b0 03 __ BCS $4192 ; (bm_scan_fill.s17 + 0)
418f : 4c ea 42 JMP $42ea ; (bm_scan_fill.s18 + 0)
.s17:
4192 : a5 14 __ LDA P7 ; (x0 + 1)
4194 : c5 16 __ CMP P9 ; (x1 + 1)
4196 : d0 04 __ BNE $419c ; (bm_scan_fill.s20 + 0)
.s16:
4198 : a5 13 __ LDA P6 ; (x0 + 0)
419a : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
419c : b0 46 __ BCS $41e4 ; (bm_scan_fill.s3 + 0)
.s6:
419e : a5 13 __ LDA P6 ; (x0 + 0)
41a0 : 29 f8 __ AND #$f8
41a2 : 85 1b __ STA ACCU + 0 
41a4 : 65 11 __ ADC P4 ; (lp + 0)
41a6 : 85 43 __ STA T1 + 0 
41a8 : a5 12 __ LDA P5 ; (lp + 1)
41aa : 65 14 __ ADC P7 ; (x0 + 1)
41ac : 85 44 __ STA T1 + 1 
41ae : a5 15 __ LDA P8 ; (x1 + 0)
41b0 : 29 07 __ AND #$07
41b2 : aa __ __ TAX
41b3 : a5 13 __ LDA P6 ; (x0 + 0)
41b5 : 29 07 __ AND #$07
41b7 : bc 7e 56 LDY $567e,x ; (rmask[0] + 0)
41ba : aa __ __ TAX
41bb : a5 15 __ LDA P8 ; (x1 + 0)
41bd : 29 f8 __ AND #$f8
41bf : 38 __ __ SEC
41c0 : e5 1b __ SBC ACCU + 0 
41c2 : 85 1b __ STA ACCU + 0 
41c4 : a5 16 __ LDA P9 ; (x1 + 1)
41c6 : e5 14 __ SBC P7 ; (x0 + 1)
41c8 : 85 1c __ STA ACCU + 1 
41ca : 05 1b __ ORA ACCU + 0 
41cc : d0 17 __ BNE $41e5 ; (bm_scan_fill.s7 + 0)
.s15:
41ce : 98 __ __ TYA
41cf : 3d 76 56 AND $5676,x ; (lmask[0] + 0)
41d2 : 85 1e __ STA ACCU + 3 
41d4 : a0 00 __ LDY #$00
.s11:
41d6 : 49 ff __ EOR #$ff
41d8 : 31 43 __ AND (T1 + 0),y 
41da : 85 1b __ STA ACCU + 0 
41dc : a5 17 __ LDA P10 ; (pat + 0)
41de : 25 1e __ AND ACCU + 3 
41e0 : 05 1b __ ORA ACCU + 0 
41e2 : 91 43 __ STA (T1 + 0),y 
.s3:
41e4 : 60 __ __ RTS
.s7:
41e5 : 84 1e __ STY ACCU + 3 
41e7 : bd 76 56 LDA $5676,x ; (lmask[0] + 0)
41ea : 49 ff __ EOR #$ff
41ec : a0 00 __ LDY #$00
41ee : 31 43 __ AND (T1 + 0),y 
41f0 : 85 1d __ STA ACCU + 2 
41f2 : a5 17 __ LDA P10 ; (pat + 0)
41f4 : 3d 76 56 AND $5676,x ; (lmask[0] + 0)
41f7 : 05 1d __ ORA ACCU + 2 
41f9 : 91 43 __ STA (T1 + 0),y 
41fb : a5 1c __ LDA ACCU + 1 
41fd : d0 03 __ BNE $4202 ; (bm_scan_fill.s14 + 0)
41ff : 4c 8d 42 JMP $428d ; (bm_scan_fill.s8 + 0)
.s14:
4202 : a5 17 __ LDA P10 ; (pat + 0)
4204 : a0 08 __ LDY #$08
4206 : 91 43 __ STA (T1 + 0),y 
4208 : a0 10 __ LDY #$10
420a : 91 43 __ STA (T1 + 0),y 
420c : a0 18 __ LDY #$18
420e : 91 43 __ STA (T1 + 0),y 
4210 : a0 20 __ LDY #$20
4212 : 91 43 __ STA (T1 + 0),y 
4214 : a0 28 __ LDY #$28
4216 : 91 43 __ STA (T1 + 0),y 
4218 : a0 30 __ LDY #$30
421a : 91 43 __ STA (T1 + 0),y 
421c : a0 38 __ LDY #$38
421e : 91 43 __ STA (T1 + 0),y 
4220 : a0 40 __ LDY #$40
4222 : 91 43 __ STA (T1 + 0),y 
4224 : a0 48 __ LDY #$48
4226 : 91 43 __ STA (T1 + 0),y 
4228 : a0 50 __ LDY #$50
422a : 91 43 __ STA (T1 + 0),y 
422c : a0 58 __ LDY #$58
422e : 91 43 __ STA (T1 + 0),y 
4230 : a0 60 __ LDY #$60
4232 : 91 43 __ STA (T1 + 0),y 
4234 : a0 68 __ LDY #$68
4236 : 91 43 __ STA (T1 + 0),y 
4238 : a0 70 __ LDY #$70
423a : 91 43 __ STA (T1 + 0),y 
423c : a0 78 __ LDY #$78
423e : 91 43 __ STA (T1 + 0),y 
4240 : a0 80 __ LDY #$80
4242 : 91 43 __ STA (T1 + 0),y 
4244 : a0 88 __ LDY #$88
4246 : 91 43 __ STA (T1 + 0),y 
4248 : a0 90 __ LDY #$90
424a : 91 43 __ STA (T1 + 0),y 
424c : a0 98 __ LDY #$98
424e : 91 43 __ STA (T1 + 0),y 
4250 : a0 a0 __ LDY #$a0
4252 : 91 43 __ STA (T1 + 0),y 
4254 : a0 a8 __ LDY #$a8
4256 : 91 43 __ STA (T1 + 0),y 
4258 : a0 b0 __ LDY #$b0
425a : 91 43 __ STA (T1 + 0),y 
425c : a0 b8 __ LDY #$b8
425e : 91 43 __ STA (T1 + 0),y 
4260 : a0 c0 __ LDY #$c0
4262 : 91 43 __ STA (T1 + 0),y 
4264 : a0 c8 __ LDY #$c8
4266 : 91 43 __ STA (T1 + 0),y 
4268 : a0 d0 __ LDY #$d0
426a : 91 43 __ STA (T1 + 0),y 
426c : a0 d8 __ LDY #$d8
426e : 91 43 __ STA (T1 + 0),y 
4270 : a0 e0 __ LDY #$e0
4272 : 91 43 __ STA (T1 + 0),y 
4274 : a0 e8 __ LDY #$e8
4276 : 91 43 __ STA (T1 + 0),y 
4278 : a0 f0 __ LDY #$f0
427a : 91 43 __ STA (T1 + 0),y 
427c : a0 f8 __ LDY #$f8
427e : 91 43 __ STA (T1 + 0),y 
4280 : 38 __ __ SEC
4281 : a5 1b __ LDA ACCU + 0 
4283 : e9 f8 __ SBC #$f8
4285 : 85 1b __ STA ACCU + 0 
4287 : e6 44 __ INC T1 + 1 
4289 : a9 00 __ LDA #$00
428b : f0 48 __ BEQ $42d5 ; (bm_scan_fill.s28 + 0)
.s8:
428d : 24 1b __ BIT ACCU + 0 
428f : 30 04 __ BMI $4295 ; (bm_scan_fill.s13 + 0)
.s9:
4291 : a9 08 __ LDA #$08
4293 : d0 40 __ BNE $42d5 ; (bm_scan_fill.s28 + 0)
.s13:
4295 : a5 17 __ LDA P10 ; (pat + 0)
4297 : a0 08 __ LDY #$08
4299 : 91 43 __ STA (T1 + 0),y 
429b : a0 10 __ LDY #$10
429d : 91 43 __ STA (T1 + 0),y 
429f : a0 18 __ LDY #$18
42a1 : 91 43 __ STA (T1 + 0),y 
42a3 : a0 20 __ LDY #$20
42a5 : 91 43 __ STA (T1 + 0),y 
42a7 : a0 28 __ LDY #$28
42a9 : 91 43 __ STA (T1 + 0),y 
42ab : a0 30 __ LDY #$30
42ad : 91 43 __ STA (T1 + 0),y 
42af : a0 38 __ LDY #$38
42b1 : 91 43 __ STA (T1 + 0),y 
42b3 : a0 40 __ LDY #$40
42b5 : 91 43 __ STA (T1 + 0),y 
42b7 : a0 48 __ LDY #$48
42b9 : 91 43 __ STA (T1 + 0),y 
42bb : a0 50 __ LDY #$50
42bd : 91 43 __ STA (T1 + 0),y 
42bf : a0 58 __ LDY #$58
42c1 : 91 43 __ STA (T1 + 0),y 
42c3 : a0 60 __ LDY #$60
42c5 : 91 43 __ STA (T1 + 0),y 
42c7 : a0 68 __ LDY #$68
42c9 : 91 43 __ STA (T1 + 0),y 
42cb : a0 70 __ LDY #$70
42cd : 91 43 __ STA (T1 + 0),y 
42cf : a0 78 __ LDY #$78
42d1 : 91 43 __ STA (T1 + 0),y 
42d3 : a9 80 __ LDA #$80
.s28:
42d5 : a6 17 __ LDX P10 ; (pat + 0)
42d7 : 4c e0 42 JMP $42e0 ; (bm_scan_fill.l10 + 0)
.s12:
42da : 8a __ __ TXA
42db : 91 43 __ STA (T1 + 0),y 
42dd : 98 __ __ TYA
42de : 69 08 __ ADC #$08
.l10:
42e0 : a8 __ __ TAY
42e1 : c4 1b __ CPY ACCU + 0 
42e3 : 90 f5 __ BCC $42da ; (bm_scan_fill.s12 + 0)
.s29:
42e5 : a5 1e __ LDA ACCU + 3 
42e7 : 4c d6 41 JMP $41d6 ; (bm_scan_fill.s11 + 0)
.s18:
42ea : 85 15 __ STA P8 ; (x1 + 0)
42ec : a5 10 __ LDA P3 ; (right + 1)
42ee : 85 16 __ STA P9 ; (x1 + 1)
42f0 : a5 14 __ LDA P7 ; (x0 + 1)
42f2 : c5 10 __ CMP P3 ; (right + 1)
42f4 : f0 03 __ BEQ $42f9 ; (bm_scan_fill.s19 + 0)
42f6 : 4c 9c 41 JMP $419c ; (bm_scan_fill.s20 + 0)
.s19:
42f9 : a5 13 __ LDA P6 ; (x0 + 0)
42fb : c5 0f __ CMP P2 ; (right + 0)
42fd : 4c 9c 41 JMP $419c ; (bm_scan_fill.s20 + 0)
.s22:
4300 : 90 03 __ BCC $4305 ; (bm_scan_fill.s30 + 0)
4302 : 4c 92 41 JMP $4192 ; (bm_scan_fill.s17 + 0)
.s30:
4305 : a5 0f __ LDA P2 ; (right + 0)
4307 : 90 e1 __ BCC $42ea ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
4309 : a2 0d __ LDX #$0d
430b : b5 53 __ LDA T2 + 0,x 
430d : 9d b0 c7 STA $c7b0,x ; (bm_line@stack + 0)
4310 : ca __ __ DEX
4311 : 10 f8 __ BPL $430b ; (bm_line.s1 + 2)
.s4:
4313 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
4316 : 85 55 __ STA T3 + 0 
4318 : ad c5 c7 LDA $c7c5 ; (sstack + 7)
431b : 85 56 __ STA T3 + 1 
431d : ad c8 c7 LDA $c7c8 ; (sstack + 10)
4320 : 85 53 __ STA T2 + 0 
4322 : 38 __ __ SEC
4323 : e5 55 __ SBC T3 + 0 
4325 : 85 57 __ STA T4 + 0 
4327 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
432a : 85 54 __ STA T2 + 1 
432c : e5 56 __ SBC T3 + 1 
432e : 85 58 __ STA T4 + 1 
4330 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
4333 : 85 59 __ STA T5 + 0 
4335 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
4338 : 85 5a __ STA T5 + 1 
433a : a0 00 __ LDY #$00
433c : b1 59 __ LDA (T5 + 0),y 
433e : 85 43 __ STA T0 + 0 
4340 : c8 __ __ INY
4341 : b1 59 __ LDA (T5 + 0),y 
4343 : 85 44 __ STA T0 + 1 
4345 : a0 04 __ LDY #$04
4347 : b1 59 __ LDA (T5 + 0),y 
4349 : 85 45 __ STA T1 + 0 
434b : ad c2 c7 LDA $c7c2 ; (sstack + 4)
434e : 85 5d __ STA T7 + 0 
4350 : ad c3 c7 LDA $c7c3 ; (sstack + 5)
4353 : 85 5e __ STA T7 + 1 
4355 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
4358 : 85 5b __ STA T6 + 0 
435a : 38 __ __ SEC
435b : e5 5d __ SBC T7 + 0 
435d : 85 5f __ STA T8 + 0 
435f : ad c7 c7 LDA $c7c7 ; (sstack + 9)
4362 : 85 5c __ STA T6 + 1 
4364 : c8 __ __ INY
4365 : e5 5e __ SBC T7 + 1 
4367 : 85 60 __ STA T8 + 1 
4369 : 30 07 __ BMI $4372 ; (bm_line.s5 + 0)
.s82:
436b : 05 5f __ ORA T8 + 0 
436d : f0 03 __ BEQ $4372 ; (bm_line.s5 + 0)
436f : 4c a2 46 JMP $46a2 ; (bm_line.s64 + 0)
.s5:
4372 : a5 5e __ LDA T7 + 1 
4374 : 10 03 __ BPL $4379 ; (bm_line.s63 + 0)
4376 : 4c ee 44 JMP $44ee ; (bm_line.s3 + 0)
.s63:
4379 : c5 44 __ CMP T0 + 1 
437b : d0 04 __ BNE $4381 ; (bm_line.s62 + 0)
.s61:
437d : a5 5d __ LDA T7 + 0 
437f : c5 43 __ CMP T0 + 0 
.s62:
4381 : 90 f3 __ BCC $4376 ; (bm_line.s5 + 4)
.s6:
4383 : a5 5c __ LDA T6 + 1 
4385 : 10 03 __ BPL $438a ; (bm_line.s60 + 0)
4387 : 4c 4b 46 JMP $464b ; (bm_line.s52 + 0)
.s60:
438a : d1 59 __ CMP (T5 + 0),y 
438c : d0 04 __ BNE $4392 ; (bm_line.s59 + 0)
.s58:
438e : a5 5b __ LDA T6 + 0 
4390 : c5 45 __ CMP T1 + 0 
.s59:
4392 : b0 e2 __ BCS $4376 ; (bm_line.s5 + 4)
.s7:
4394 : a5 5c __ LDA T6 + 1 
4396 : c5 44 __ CMP T0 + 1 
4398 : d0 04 __ BNE $439e ; (bm_line.s57 + 0)
.s56:
439a : a5 5b __ LDA T6 + 0 
439c : c5 43 __ CMP T0 + 0 
.s57:
439e : 90 e7 __ BCC $4387 ; (bm_line.s6 + 4)
.s8:
43a0 : a5 5e __ LDA T7 + 1 
43a2 : d1 59 __ CMP (T5 + 0),y 
43a4 : d0 04 __ BNE $43aa ; (bm_line.s54 + 0)
.s51:
43a6 : a5 5d __ LDA T7 + 0 
43a8 : c5 45 __ CMP T1 + 0 
.s54:
43aa : 90 4e __ BCC $43fa ; (bm_line.s9 + 0)
.s50:
43ac : a5 57 __ LDA T4 + 0 
43ae : 85 0f __ STA P2 
43b0 : a5 58 __ LDA T4 + 1 
43b2 : 85 10 __ STA P3 
43b4 : a5 5f __ LDA T8 + 0 
43b6 : 85 11 __ STA P4 
43b8 : a5 60 __ LDA T8 + 1 
43ba : 85 12 __ STA P5 
43bc : 18 __ __ CLC
43bd : a5 5d __ LDA T7 + 0 
43bf : 69 01 __ ADC #$01
43c1 : a8 __ __ TAY
43c2 : a5 5e __ LDA T7 + 1 
43c4 : 69 00 __ ADC #$00
43c6 : aa __ __ TAX
43c7 : 98 __ __ TYA
43c8 : 38 __ __ SEC
43c9 : a0 04 __ LDY #$04
43cb : f1 59 __ SBC (T5 + 0),y 
43cd : 85 0d __ STA P0 
43cf : 8a __ __ TXA
43d0 : c8 __ __ INY
43d1 : f1 59 __ SBC (T5 + 0),y 
43d3 : 85 0e __ STA P1 
43d5 : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
43d8 : 38 __ __ SEC
43d9 : a5 55 __ LDA T3 + 0 
43db : e5 1b __ SBC ACCU + 0 ; (clip + 0)
43dd : 8d c4 c7 STA $c7c4 ; (sstack + 6)
43e0 : a5 56 __ LDA T3 + 1 
43e2 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
43e4 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
43e7 : a0 04 __ LDY #$04
43e9 : b1 59 __ LDA (T5 + 0),y 
43eb : 38 __ __ SEC
43ec : e9 01 __ SBC #$01
43ee : aa __ __ TAX
43ef : c8 __ __ INY
43f0 : b1 59 __ LDA (T5 + 0),y 
43f2 : 8e c2 c7 STX $c7c2 ; (sstack + 4)
43f5 : e9 00 __ SBC #$00
43f7 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
.s9:
43fa : a0 02 __ LDY #$02
43fc : b1 59 __ LDA (T5 + 0),y 
43fe : 85 43 __ STA T0 + 0 
4400 : c8 __ __ INY
4401 : b1 59 __ LDA (T5 + 0),y 
4403 : 85 44 __ STA T0 + 1 
4405 : a0 06 __ LDY #$06
4407 : b1 59 __ LDA (T5 + 0),y 
4409 : 85 45 __ STA T1 + 0 
440b : c8 __ __ INY
440c : a5 58 __ LDA T4 + 1 
440e : 30 07 __ BMI $4417 ; (bm_line.s10 + 0)
.s49:
4410 : 05 57 __ ORA T4 + 0 
4412 : f0 03 __ BEQ $4417 ; (bm_line.s10 + 0)
4414 : 4c 53 45 JMP $4553 ; (bm_line.s30 + 0)
.s10:
4417 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
441a : 85 55 __ STA T3 + 0 
441c : ad c5 c7 LDA $c7c5 ; (sstack + 7)
441f : 10 03 __ BPL $4424 ; (bm_line.s29 + 0)
4421 : 4c ee 44 JMP $44ee ; (bm_line.s3 + 0)
.s29:
4424 : 85 56 __ STA T3 + 1 
4426 : c5 44 __ CMP T0 + 1 
4428 : d0 04 __ BNE $442e ; (bm_line.s28 + 0)
.s27:
442a : a5 55 __ LDA T3 + 0 
442c : c5 43 __ CMP T0 + 0 
.s28:
442e : 90 f1 __ BCC $4421 ; (bm_line.s10 + 10)
.s11:
4430 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
4433 : 10 03 __ BPL $4438 ; (bm_line.s26 + 0)
4435 : 4c f9 44 JMP $44f9 ; (bm_line.s17 + 0)
.s26:
4438 : d1 59 __ CMP (T5 + 0),y 
443a : d0 05 __ BNE $4441 ; (bm_line.s25 + 0)
.s24:
443c : ad c8 c7 LDA $c7c8 ; (sstack + 10)
443f : c5 45 __ CMP T1 + 0 
.s25:
4441 : b0 de __ BCS $4421 ; (bm_line.s10 + 10)
.s12:
4443 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
4446 : 30 ed __ BMI $4435 ; (bm_line.s11 + 5)
.s23:
4448 : c5 44 __ CMP T0 + 1 
444a : d0 05 __ BNE $4451 ; (bm_line.s22 + 0)
.s21:
444c : ad c8 c7 LDA $c7c8 ; (sstack + 10)
444f : c5 43 __ CMP T0 + 0 
.s22:
4451 : 90 e2 __ BCC $4435 ; (bm_line.s11 + 5)
.s13:
4453 : a5 56 __ LDA T3 + 1 
4455 : d1 59 __ CMP (T5 + 0),y 
4457 : d0 04 __ BNE $445d ; (bm_line.s19 + 0)
.s16:
4459 : a5 55 __ LDA T3 + 0 
445b : c5 45 __ CMP T1 + 0 
.s19:
445d : 90 50 __ BCC $44af ; (bm_line.s14 + 0)
.s15:
445f : a5 5f __ LDA T8 + 0 
4461 : 85 0f __ STA P2 
4463 : a5 60 __ LDA T8 + 1 
4465 : 85 10 __ STA P3 
4467 : a5 57 __ LDA T4 + 0 
4469 : 85 11 __ STA P4 
446b : a5 58 __ LDA T4 + 1 
446d : 85 12 __ STA P5 
446f : 18 __ __ CLC
4470 : a5 55 __ LDA T3 + 0 
4472 : 69 01 __ ADC #$01
4474 : a8 __ __ TAY
4475 : a5 56 __ LDA T3 + 1 
4477 : 69 00 __ ADC #$00
4479 : aa __ __ TAX
447a : 98 __ __ TYA
447b : 38 __ __ SEC
447c : a0 06 __ LDY #$06
447e : f1 59 __ SBC (T5 + 0),y 
4480 : 85 0d __ STA P0 
4482 : 8a __ __ TXA
4483 : c8 __ __ INY
4484 : f1 59 __ SBC (T5 + 0),y 
4486 : 85 0e __ STA P1 
4488 : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
448b : ad c2 c7 LDA $c7c2 ; (sstack + 4)
448e : 38 __ __ SEC
448f : e5 1b __ SBC ACCU + 0 ; (clip + 0)
4491 : 8d c2 c7 STA $c7c2 ; (sstack + 4)
4494 : ad c3 c7 LDA $c7c3 ; (sstack + 5)
4497 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
4499 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
449c : a0 06 __ LDY #$06
449e : b1 59 __ LDA (T5 + 0),y 
44a0 : 38 __ __ SEC
44a1 : e9 01 __ SBC #$01
44a3 : aa __ __ TAX
44a4 : c8 __ __ INY
44a5 : b1 59 __ LDA (T5 + 0),y 
44a7 : 8e c4 c7 STX $c7c4 ; (sstack + 6)
44aa : e9 00 __ SBC #$00
44ac : 8d c5 c7 STA $c7c5 ; (sstack + 7)
.s14:
44af : ad be c7 LDA $c7be ; (sstack + 0)
44b2 : 85 0d __ STA P0 
44b4 : ad bf c7 LDA $c7bf ; (sstack + 1)
44b7 : 85 0e __ STA P1 
44b9 : ad c2 c7 LDA $c7c2 ; (sstack + 4)
44bc : 85 0f __ STA P2 
44be : ad c3 c7 LDA $c7c3 ; (sstack + 5)
44c1 : 85 10 __ STA P3 
44c3 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
44c6 : 85 11 __ STA P4 
44c8 : ad c5 c7 LDA $c7c5 ; (sstack + 7)
44cb : 85 12 __ STA P5 
44cd : ad c6 c7 LDA $c7c6 ; (sstack + 8)
44d0 : 85 13 __ STA P6 
44d2 : ad c7 c7 LDA $c7c7 ; (sstack + 9)
44d5 : 85 14 __ STA P7 
44d7 : ad c8 c7 LDA $c7c8 ; (sstack + 10)
44da : 85 15 __ STA P8 
44dc : ad c9 c7 LDA $c7c9 ; (sstack + 11)
44df : 85 16 __ STA P9 
44e1 : ad ca c7 LDA $c7ca ; (sstack + 12)
44e4 : 85 17 __ STA P10 
44e6 : ad cb c7 LDA $c7cb ; (sstack + 13)
44e9 : 85 18 __ STA P11 
44eb : 20 43 48 JSR $4843 ; (bmu_line.s4 + 0)
.s3:
44ee : a2 0d __ LDX #$0d
44f0 : bd b0 c7 LDA $c7b0,x ; (bm_line@stack + 0)
44f3 : 95 53 __ STA T2 + 0,x 
44f5 : ca __ __ DEX
44f6 : 10 f8 __ BPL $44f0 ; (bm_line.s3 + 2)
44f8 : 60 __ __ RTS
.s17:
44f9 : a5 5f __ LDA T8 + 0 
44fb : 85 0f __ STA P2 
44fd : a5 60 __ LDA T8 + 1 
44ff : 85 10 __ STA P3 
4501 : a5 57 __ LDA T4 + 0 
4503 : 85 11 __ STA P4 
4505 : a5 58 __ LDA T4 + 1 
4507 : 85 12 __ STA P5 
4509 : 38 __ __ SEC
450a : a5 43 __ LDA T0 + 0 
450c : ed c8 c7 SBC $c7c8 ; (sstack + 10)
450f : 85 0d __ STA P0 
4511 : a5 44 __ LDA T0 + 1 
4513 : ed c9 c7 SBC $c7c9 ; (sstack + 11)
4516 : 85 0e __ STA P1 
4518 : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
451b : a0 02 __ LDY #$02
451d : b1 59 __ LDA (T5 + 0),y 
451f : 8d c8 c7 STA $c7c8 ; (sstack + 10)
4522 : c8 __ __ INY
4523 : b1 59 __ LDA (T5 + 0),y 
4525 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
4528 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
452b : 18 __ __ CLC
452c : 65 1b __ ADC ACCU + 0 ; (clip + 0)
452e : 8d c6 c7 STA $c7c6 ; (sstack + 8)
4531 : ad c7 c7 LDA $c7c7 ; (sstack + 9)
4534 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
4536 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
4539 : a0 07 __ LDY #$07
453b : b1 59 __ LDA (T5 + 0),y 
453d : 10 03 __ BPL $4542 ; (bm_line.s20 + 0)
453f : 4c 5f 44 JMP $445f ; (bm_line.s15 + 0)
.s20:
4542 : a5 56 __ LDA T3 + 1 
4544 : d1 59 __ CMP (T5 + 0),y 
4546 : f0 03 __ BEQ $454b ; (bm_line.s18 + 0)
4548 : 4c 5d 44 JMP $445d ; (bm_line.s19 + 0)
.s18:
454b : a5 55 __ LDA T3 + 0 
454d : 88 __ __ DEY
454e : d1 59 __ CMP (T5 + 0),y 
4550 : 4c 5d 44 JMP $445d ; (bm_line.s19 + 0)
.s30:
4553 : ad c8 c7 LDA $c7c8 ; (sstack + 10)
4556 : 85 55 __ STA T3 + 0 
4558 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
455b : 30 91 __ BMI $44ee ; (bm_line.s3 + 0)
.s48:
455d : 85 56 __ STA T3 + 1 
455f : c5 44 __ CMP T0 + 1 
4561 : d0 04 __ BNE $4567 ; (bm_line.s47 + 0)
.s46:
4563 : a5 55 __ LDA T3 + 0 
4565 : c5 43 __ CMP T0 + 0 
.s47:
4567 : 90 85 __ BCC $44ee ; (bm_line.s3 + 0)
.s31:
4569 : ad c5 c7 LDA $c7c5 ; (sstack + 7)
456c : 10 03 __ BPL $4571 ; (bm_line.s45 + 0)
456e : 4c f1 45 JMP $45f1 ; (bm_line.s36 + 0)
.s45:
4571 : d1 59 __ CMP (T5 + 0),y 
4573 : d0 05 __ BNE $457a ; (bm_line.s44 + 0)
.s43:
4575 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
4578 : c5 45 __ CMP T1 + 0 
.s44:
457a : 90 03 __ BCC $457f ; (bm_line.s32 + 0)
457c : 4c ee 44 JMP $44ee ; (bm_line.s3 + 0)
.s32:
457f : ad c5 c7 LDA $c7c5 ; (sstack + 7)
4582 : 30 6d __ BMI $45f1 ; (bm_line.s36 + 0)
.s42:
4584 : c5 44 __ CMP T0 + 1 
4586 : d0 05 __ BNE $458d ; (bm_line.s41 + 0)
.s40:
4588 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
458b : c5 43 __ CMP T0 + 0 
.s41:
458d : 90 62 __ BCC $45f1 ; (bm_line.s36 + 0)
.s33:
458f : a5 56 __ LDA T3 + 1 
4591 : d1 59 __ CMP (T5 + 0),y 
4593 : d0 04 __ BNE $4599 ; (bm_line.s38 + 0)
.s35:
4595 : a5 55 __ LDA T3 + 0 
4597 : c5 45 __ CMP T1 + 0 
.s38:
4599 : b0 03 __ BCS $459e ; (bm_line.s34 + 0)
459b : 4c af 44 JMP $44af ; (bm_line.s14 + 0)
.s34:
459e : a5 5f __ LDA T8 + 0 
45a0 : 85 0f __ STA P2 
45a2 : a5 60 __ LDA T8 + 1 
45a4 : 85 10 __ STA P3 
45a6 : a5 57 __ LDA T4 + 0 
45a8 : 85 11 __ STA P4 
45aa : a5 58 __ LDA T4 + 1 
45ac : 85 12 __ STA P5 
45ae : 18 __ __ CLC
45af : a5 55 __ LDA T3 + 0 
45b1 : 69 01 __ ADC #$01
45b3 : a8 __ __ TAY
45b4 : a5 56 __ LDA T3 + 1 
45b6 : 69 00 __ ADC #$00
45b8 : aa __ __ TAX
45b9 : 98 __ __ TYA
45ba : 38 __ __ SEC
45bb : a0 06 __ LDY #$06
45bd : f1 59 __ SBC (T5 + 0),y 
45bf : 85 0d __ STA P0 
45c1 : 8a __ __ TXA
45c2 : c8 __ __ INY
45c3 : f1 59 __ SBC (T5 + 0),y 
45c5 : 85 0e __ STA P1 
45c7 : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
45ca : ad c6 c7 LDA $c7c6 ; (sstack + 8)
45cd : 38 __ __ SEC
45ce : e5 1b __ SBC ACCU + 0 ; (clip + 0)
45d0 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
45d3 : ad c7 c7 LDA $c7c7 ; (sstack + 9)
45d6 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
45d8 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
45db : a0 06 __ LDY #$06
45dd : b1 59 __ LDA (T5 + 0),y 
45df : 38 __ __ SEC
45e0 : e9 01 __ SBC #$01
45e2 : aa __ __ TAX
45e3 : c8 __ __ INY
45e4 : b1 59 __ LDA (T5 + 0),y 
45e6 : 8e c8 c7 STX $c7c8 ; (sstack + 10)
45e9 : e9 00 __ SBC #$00
45eb : 8d c9 c7 STA $c7c9 ; (sstack + 11)
45ee : 4c af 44 JMP $44af ; (bm_line.s14 + 0)
.s36:
45f1 : a5 5f __ LDA T8 + 0 
45f3 : 85 0f __ STA P2 
45f5 : a5 60 __ LDA T8 + 1 
45f7 : 85 10 __ STA P3 
45f9 : a5 57 __ LDA T4 + 0 
45fb : 85 11 __ STA P4 
45fd : a5 58 __ LDA T4 + 1 
45ff : 85 12 __ STA P5 
4601 : 38 __ __ SEC
4602 : a5 43 __ LDA T0 + 0 
4604 : ed c4 c7 SBC $c7c4 ; (sstack + 6)
4607 : 85 0d __ STA P0 
4609 : a5 44 __ LDA T0 + 1 
460b : ed c5 c7 SBC $c7c5 ; (sstack + 7)
460e : 85 0e __ STA P1 
4610 : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
4613 : a0 02 __ LDY #$02
4615 : b1 59 __ LDA (T5 + 0),y 
4617 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
461a : c8 __ __ INY
461b : b1 59 __ LDA (T5 + 0),y 
461d : 8d c5 c7 STA $c7c5 ; (sstack + 7)
4620 : ad c2 c7 LDA $c7c2 ; (sstack + 4)
4623 : 18 __ __ CLC
4624 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
4626 : 8d c2 c7 STA $c7c2 ; (sstack + 4)
4629 : ad c3 c7 LDA $c7c3 ; (sstack + 5)
462c : 65 1c __ ADC ACCU + 1 ; (clip + 1)
462e : 8d c3 c7 STA $c7c3 ; (sstack + 5)
4631 : a0 07 __ LDY #$07
4633 : b1 59 __ LDA (T5 + 0),y 
4635 : 10 03 __ BPL $463a ; (bm_line.s39 + 0)
4637 : 4c 9e 45 JMP $459e ; (bm_line.s34 + 0)
.s39:
463a : a5 56 __ LDA T3 + 1 
463c : d1 59 __ CMP (T5 + 0),y 
463e : f0 03 __ BEQ $4643 ; (bm_line.s37 + 0)
4640 : 4c 99 45 JMP $4599 ; (bm_line.s38 + 0)
.s37:
4643 : a5 55 __ LDA T3 + 0 
4645 : 88 __ __ DEY
4646 : d1 59 __ CMP (T5 + 0),y 
4648 : 4c 99 45 JMP $4599 ; (bm_line.s38 + 0)
.s52:
464b : a5 57 __ LDA T4 + 0 
464d : 85 0f __ STA P2 
464f : a5 58 __ LDA T4 + 1 
4651 : 85 10 __ STA P3 
4653 : a5 5f __ LDA T8 + 0 
4655 : 85 11 __ STA P4 
4657 : a5 60 __ LDA T8 + 1 
4659 : 85 12 __ STA P5 
465b : 38 __ __ SEC
465c : a5 43 __ LDA T0 + 0 
465e : e5 5b __ SBC T6 + 0 
4660 : 85 0d __ STA P0 
4662 : a5 44 __ LDA T0 + 1 
4664 : e5 5c __ SBC T6 + 1 
4666 : 85 0e __ STA P1 
4668 : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
466b : 18 __ __ CLC
466c : a5 1b __ LDA ACCU + 0 ; (clip + 0)
466e : 65 53 __ ADC T2 + 0 
4670 : aa __ __ TAX
4671 : a0 00 __ LDY #$00
4673 : b1 59 __ LDA (T5 + 0),y 
4675 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
4678 : c8 __ __ INY
4679 : b1 59 __ LDA (T5 + 0),y 
467b : 8e c8 c7 STX $c7c8 ; (sstack + 10)
467e : 8d c7 c7 STA $c7c7 ; (sstack + 9)
4681 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
4683 : 65 54 __ ADC T2 + 1 
4685 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
4688 : a0 05 __ LDY #$05
468a : b1 59 __ LDA (T5 + 0),y 
468c : 10 03 __ BPL $4691 ; (bm_line.s55 + 0)
468e : 4c ac 43 JMP $43ac ; (bm_line.s50 + 0)
.s55:
4691 : a5 5e __ LDA T7 + 1 
4693 : d1 59 __ CMP (T5 + 0),y 
4695 : f0 03 __ BEQ $469a ; (bm_line.s53 + 0)
4697 : 4c aa 43 JMP $43aa ; (bm_line.s54 + 0)
.s53:
469a : a5 5d __ LDA T7 + 0 
469c : 88 __ __ DEY
469d : d1 59 __ CMP (T5 + 0),y 
469f : 4c aa 43 JMP $43aa ; (bm_line.s54 + 0)
.s64:
46a2 : a5 5c __ LDA T6 + 1 
46a4 : 10 03 __ BPL $46a9 ; (bm_line.s81 + 0)
46a6 : 4c ee 44 JMP $44ee ; (bm_line.s3 + 0)
.s81:
46a9 : c5 44 __ CMP T0 + 1 
46ab : d0 04 __ BNE $46b1 ; (bm_line.s80 + 0)
.s79:
46ad : a5 5b __ LDA T6 + 0 
46af : c5 43 __ CMP T0 + 0 
.s80:
46b1 : 90 f3 __ BCC $46a6 ; (bm_line.s64 + 4)
.s65:
46b3 : a5 5e __ LDA T7 + 1 
46b5 : 30 76 __ BMI $472d ; (bm_line.s70 + 0)
.s78:
46b7 : d1 59 __ CMP (T5 + 0),y 
46b9 : d0 04 __ BNE $46bf ; (bm_line.s77 + 0)
.s76:
46bb : a5 5d __ LDA T7 + 0 
46bd : c5 45 __ CMP T1 + 0 
.s77:
46bf : b0 e5 __ BCS $46a6 ; (bm_line.s64 + 4)
.s66:
46c1 : a5 5e __ LDA T7 + 1 
46c3 : c5 44 __ CMP T0 + 1 
46c5 : d0 04 __ BNE $46cb ; (bm_line.s75 + 0)
.s74:
46c7 : a5 5d __ LDA T7 + 0 
46c9 : c5 43 __ CMP T0 + 0 
.s75:
46cb : 90 60 __ BCC $472d ; (bm_line.s70 + 0)
.s67:
46cd : a5 5c __ LDA T6 + 1 
46cf : d1 59 __ CMP (T5 + 0),y 
46d1 : d0 04 __ BNE $46d7 ; (bm_line.s72 + 0)
.s69:
46d3 : a5 5b __ LDA T6 + 0 
46d5 : c5 45 __ CMP T1 + 0 
.s72:
46d7 : b0 03 __ BCS $46dc ; (bm_line.s68 + 0)
46d9 : 4c fa 43 JMP $43fa ; (bm_line.s9 + 0)
.s68:
46dc : a5 57 __ LDA T4 + 0 
46de : 85 0f __ STA P2 
46e0 : a5 58 __ LDA T4 + 1 
46e2 : 85 10 __ STA P3 
46e4 : a5 5f __ LDA T8 + 0 
46e6 : 85 11 __ STA P4 
46e8 : a5 60 __ LDA T8 + 1 
46ea : 85 12 __ STA P5 
46ec : 18 __ __ CLC
46ed : a5 5b __ LDA T6 + 0 
46ef : 69 01 __ ADC #$01
46f1 : a8 __ __ TAY
46f2 : a5 5c __ LDA T6 + 1 
46f4 : 69 00 __ ADC #$00
46f6 : aa __ __ TAX
46f7 : 98 __ __ TYA
46f8 : 38 __ __ SEC
46f9 : a0 04 __ LDY #$04
46fb : f1 59 __ SBC (T5 + 0),y 
46fd : 85 0d __ STA P0 
46ff : 8a __ __ TXA
4700 : c8 __ __ INY
4701 : f1 59 __ SBC (T5 + 0),y 
4703 : 85 0e __ STA P1 
4705 : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
4708 : 38 __ __ SEC
4709 : a5 53 __ LDA T2 + 0 
470b : e5 1b __ SBC ACCU + 0 ; (clip + 0)
470d : 8d c8 c7 STA $c7c8 ; (sstack + 10)
4710 : a5 54 __ LDA T2 + 1 
4712 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
4714 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
4717 : a0 04 __ LDY #$04
4719 : b1 59 __ LDA (T5 + 0),y 
471b : 38 __ __ SEC
471c : e9 01 __ SBC #$01
471e : aa __ __ TAX
471f : c8 __ __ INY
4720 : b1 59 __ LDA (T5 + 0),y 
4722 : 8e c6 c7 STX $c7c6 ; (sstack + 8)
4725 : e9 00 __ SBC #$00
4727 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
472a : 4c fa 43 JMP $43fa ; (bm_line.s9 + 0)
.s70:
472d : a5 57 __ LDA T4 + 0 
472f : 85 0f __ STA P2 
4731 : a5 58 __ LDA T4 + 1 
4733 : 85 10 __ STA P3 
4735 : a5 5f __ LDA T8 + 0 
4737 : 85 11 __ STA P4 
4739 : a5 60 __ LDA T8 + 1 
473b : 85 12 __ STA P5 
473d : 38 __ __ SEC
473e : a5 43 __ LDA T0 + 0 
4740 : e5 5d __ SBC T7 + 0 
4742 : 85 0d __ STA P0 
4744 : a5 44 __ LDA T0 + 1 
4746 : e5 5e __ SBC T7 + 1 
4748 : 85 0e __ STA P1 
474a : 20 84 47 JSR $4784 ; (lmuldiv16s.s4 + 0)
474d : 18 __ __ CLC
474e : a5 1b __ LDA ACCU + 0 ; (clip + 0)
4750 : 65 55 __ ADC T3 + 0 
4752 : aa __ __ TAX
4753 : a0 00 __ LDY #$00
4755 : b1 59 __ LDA (T5 + 0),y 
4757 : 8d c2 c7 STA $c7c2 ; (sstack + 4)
475a : c8 __ __ INY
475b : b1 59 __ LDA (T5 + 0),y 
475d : 8e c4 c7 STX $c7c4 ; (sstack + 6)
4760 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
4763 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
4765 : 65 56 __ ADC T3 + 1 
4767 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
476a : a0 05 __ LDY #$05
476c : b1 59 __ LDA (T5 + 0),y 
476e : 10 03 __ BPL $4773 ; (bm_line.s73 + 0)
4770 : 4c dc 46 JMP $46dc ; (bm_line.s68 + 0)
.s73:
4773 : a5 5c __ LDA T6 + 1 
4775 : d1 59 __ CMP (T5 + 0),y 
4777 : f0 03 __ BEQ $477c ; (bm_line.s71 + 0)
4779 : 4c d7 46 JMP $46d7 ; (bm_line.s72 + 0)
.s71:
477c : a5 5b __ LDA T6 + 0 
477e : 88 __ __ DEY
477f : d1 59 __ CMP (T5 + 0),y 
4781 : 4c d7 46 JMP $46d7 ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
4784 : a9 00 __ LDA #$00
4786 : 24 0e __ BIT P1 ; (a + 1)
4788 : 10 0d __ BPL $4797 ; (lmuldiv16s.s5 + 0)
.s10:
478a : 38 __ __ SEC
478b : e5 0d __ SBC P0 ; (a + 0)
478d : 85 0d __ STA P0 ; (a + 0)
478f : a9 00 __ LDA #$00
4791 : e5 0e __ SBC P1 ; (a + 1)
4793 : 85 0e __ STA P1 ; (a + 1)
4795 : a9 01 __ LDA #$01
.s5:
4797 : 85 43 __ STA T1 + 0 
4799 : 24 10 __ BIT P3 ; (b + 1)
479b : 10 14 __ BPL $47b1 ; (lmuldiv16s.s6 + 0)
.s9:
479d : 38 __ __ SEC
479e : a9 00 __ LDA #$00
47a0 : e5 0f __ SBC P2 ; (b + 0)
47a2 : 85 0f __ STA P2 ; (b + 0)
47a4 : a9 00 __ LDA #$00
47a6 : e5 10 __ SBC P3 ; (b + 1)
47a8 : 85 10 __ STA P3 ; (b + 1)
47aa : a9 00 __ LDA #$00
47ac : c5 43 __ CMP T1 + 0 
47ae : 2a __ __ ROL
47af : 85 43 __ STA T1 + 0 
.s6:
47b1 : 24 12 __ BIT P5 ; (c + 1)
47b3 : 10 14 __ BPL $47c9 ; (lmuldiv16s.s7 + 0)
.s8:
47b5 : 38 __ __ SEC
47b6 : a9 00 __ LDA #$00
47b8 : e5 11 __ SBC P4 ; (c + 0)
47ba : 85 11 __ STA P4 ; (c + 0)
47bc : a9 00 __ LDA #$00
47be : e5 12 __ SBC P5 ; (c + 1)
47c0 : 85 12 __ STA P5 ; (c + 1)
47c2 : a9 00 __ LDA #$00
47c4 : c5 43 __ CMP T1 + 0 
47c6 : 2a __ __ ROL
47c7 : 85 43 __ STA T1 + 0 
.s7:
47c9 : a9 00 __ LDA #$00
47cb : 85 05 __ STA WORK + 2 
47cd : 85 06 __ STA WORK + 3 
47cf : a5 0d __ LDA P0 ; (a + 0)
47d1 : 38 __ __ SEC
47d2 : a0 08 __ LDY #$08
47d4 : 6a __ __ ROR
47d5 : 90 0f __ BCC $47e6 ; (lmuldiv16s.s7 + 29)
47d7 : aa __ __ TAX
47d8 : 18 __ __ CLC
47d9 : a5 05 __ LDA WORK + 2 
47db : 65 0f __ ADC P2 ; (b + 0)
47dd : 85 05 __ STA WORK + 2 
47df : a5 06 __ LDA WORK + 3 
47e1 : 65 10 __ ADC P3 ; (b + 1)
47e3 : 85 06 __ STA WORK + 3 
47e5 : 8a __ __ TXA
47e6 : 66 06 __ ROR WORK + 3 
47e8 : 66 05 __ ROR WORK + 2 
47ea : 88 __ __ DEY
47eb : d0 e7 __ BNE $47d4 ; (lmuldiv16s.s7 + 11)
47ed : 6a __ __ ROR
47ee : 90 07 __ BCC $47f7 ; (lmuldiv16s.s7 + 46)
47f0 : 85 03 __ STA WORK + 0 
47f2 : a5 0e __ LDA P1 ; (a + 1)
47f4 : 18 __ __ CLC
47f5 : 90 db __ BCC $47d2 ; (lmuldiv16s.s7 + 9)
47f7 : 38 __ __ SEC
47f8 : 85 04 __ STA WORK + 1 
47fa : a2 08 __ LDX #$08
47fc : 26 04 __ ROL WORK + 1 
47fe : 26 05 __ ROL WORK + 2 
4800 : 26 06 __ ROL WORK + 3 
4802 : 90 0c __ BCC $4810 ; (lmuldiv16s.s7 + 71)
4804 : a5 05 __ LDA WORK + 2 
4806 : e5 11 __ SBC P4 ; (c + 0)
4808 : a8 __ __ TAY
4809 : a5 06 __ LDA WORK + 3 
480b : e5 12 __ SBC P5 ; (c + 1)
480d : 38 __ __ SEC
480e : b0 0c __ BCS $481c ; (lmuldiv16s.s7 + 83)
4810 : 38 __ __ SEC
4811 : a5 05 __ LDA WORK + 2 
4813 : e5 11 __ SBC P4 ; (c + 0)
4815 : a8 __ __ TAY
4816 : a5 06 __ LDA WORK + 3 
4818 : e5 12 __ SBC P5 ; (c + 1)
481a : 90 04 __ BCC $4820 ; (lmuldiv16s.s7 + 87)
481c : 85 06 __ STA WORK + 3 
481e : 84 05 __ STY WORK + 2 
4820 : ca __ __ DEX
4821 : d0 d9 __ BNE $47fc ; (lmuldiv16s.s7 + 51)
4823 : a5 04 __ LDA WORK + 1 
4825 : 2a __ __ ROL
4826 : 90 07 __ BCC $482f ; (lmuldiv16s.s7 + 102)
4828 : 85 1c __ STA ACCU + 1 
482a : a5 03 __ LDA WORK + 0 
482c : 18 __ __ CLC
482d : 90 c9 __ BCC $47f8 ; (lmuldiv16s.s7 + 47)
482f : 85 1b __ STA ACCU + 0 
4831 : a5 43 __ LDA T1 + 0 
4833 : f0 0d __ BEQ $4842 ; (lmuldiv16s.s3 + 0)
4835 : 38 __ __ SEC
4836 : a9 00 __ LDA #$00
4838 : e5 1b __ SBC ACCU + 0 
483a : 85 1b __ STA ACCU + 0 
483c : a9 00 __ LDA #$00
483e : e5 1c __ SBC ACCU + 1 
4840 : 85 1c __ STA ACCU + 1 
.s3:
4842 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
4843 : a5 17 __ LDA P10 ; (pattern + 0)
4845 : f0 03 __ BEQ $484a ; (bmu_line.s5 + 0)
4847 : 4c 49 4d JMP $4d49 ; (bmu_line.s59 + 0)
.s5:
484a : a5 18 __ LDA P11 ; (op + 0)
484c : f0 01 __ BEQ $484f ; (bmu_line.s6 + 0)
484e : 60 __ __ RTS
.s6:
484f : c6 17 __ DEC P10 ; (pattern + 0)
4851 : a9 02 __ LDA #$02
.s63:
4853 : 85 18 __ STA P11 ; (op + 0)
.s7:
4855 : 38 __ __ SEC
4856 : a5 13 __ LDA P6 ; (x1 + 0)
4858 : e5 0f __ SBC P2 ; (x0 + 0)
485a : 85 46 __ STA T2 + 0 
485c : a5 14 __ LDA P7 ; (x1 + 1)
485e : e5 10 __ SBC P3 ; (x0 + 1)
4860 : 85 47 __ STA T2 + 1 
4862 : 10 11 __ BPL $4875 ; (bmu_line.s8 + 0)
.s58:
4864 : 38 __ __ SEC
4865 : a9 00 __ LDA #$00
4867 : e5 46 __ SBC T2 + 0 
4869 : 85 46 __ STA T2 + 0 
486b : a9 00 __ LDA #$00
486d : e5 47 __ SBC T2 + 1 
486f : 85 47 __ STA T2 + 1 
4871 : a9 01 __ LDA #$01
4873 : d0 02 __ BNE $4877 ; (bmu_line.s9 + 0)
.s8:
4875 : a9 00 __ LDA #$00
.s9:
4877 : 85 51 __ STA T10 + 0 
4879 : 38 __ __ SEC
487a : a5 15 __ LDA P8 ; (y1 + 0)
487c : e5 11 __ SBC P4 ; (y0 + 0)
487e : 85 43 __ STA T0 + 0 
4880 : a5 16 __ LDA P9 ; (y1 + 1)
4882 : e5 12 __ SBC P5 ; (y0 + 1)
4884 : 85 44 __ STA T0 + 1 
4886 : 10 11 __ BPL $4899 ; (bmu_line.s10 + 0)
.s57:
4888 : 38 __ __ SEC
4889 : a9 00 __ LDA #$00
488b : e5 43 __ SBC T0 + 0 
488d : 85 43 __ STA T0 + 0 
488f : a9 00 __ LDA #$00
4891 : e5 44 __ SBC T0 + 1 
4893 : 85 44 __ STA T0 + 1 
4895 : a9 01 __ LDA #$01
4897 : d0 02 __ BNE $489b ; (bmu_line.s11 + 0)
.s10:
4899 : a9 00 __ LDA #$00
.s11:
489b : 85 52 __ STA T11 + 0 
489d : a5 44 __ LDA T0 + 1 
489f : c5 47 __ CMP T2 + 1 
48a1 : d0 04 __ BNE $48a7 ; (bmu_line.s56 + 0)
.s55:
48a3 : a5 43 __ LDA T0 + 0 
48a5 : c5 46 __ CMP T2 + 0 
.s56:
48a7 : b0 06 __ BCS $48af ; (bmu_line.s12 + 0)
.s54:
48a9 : a5 47 __ LDA T2 + 1 
48ab : a6 46 __ LDX T2 + 0 
48ad : 90 04 __ BCC $48b3 ; (bmu_line.s13 + 0)
.s12:
48af : a5 44 __ LDA T0 + 1 
48b1 : a6 43 __ LDX T0 + 0 
.s13:
48b3 : 86 49 __ STX T4 + 0 
48b5 : 85 4a __ STA T4 + 1 
48b7 : 38 __ __ SEC
48b8 : a5 43 __ LDA T0 + 0 
48ba : e5 46 __ SBC T2 + 0 
48bc : 85 4b __ STA T5 + 0 
48be : a5 44 __ LDA T0 + 1 
48c0 : e5 47 __ SBC T2 + 1 
48c2 : 85 4c __ STA T5 + 1 
48c4 : a5 4b __ LDA T5 + 0 
48c6 : 4a __ __ LSR
48c7 : b0 0c __ BCS $48d5 ; (bmu_line.s53 + 0)
.s14:
48c9 : a5 4c __ LDA T5 + 1 
48cb : c9 80 __ CMP #$80
48cd : 6a __ __ ROR
48ce : 85 4c __ STA T5 + 1 
48d0 : 66 4b __ ROR T5 + 0 
48d2 : 4c dd 48 JMP $48dd ; (bmu_line.s15 + 0)
.s53:
48d5 : 06 43 __ ASL T0 + 0 
48d7 : 26 44 __ ROL T0 + 1 
48d9 : 06 46 __ ASL T2 + 0 
48db : 26 47 __ ROL T2 + 1 
.s15:
48dd : a0 00 __ LDY #$00
48df : b1 0d __ LDA (P0),y ; (bm + 0)
48e1 : 85 4d __ STA T7 + 0 
48e3 : c8 __ __ INY
48e4 : b1 0d __ LDA (P0),y ; (bm + 0)
48e6 : 85 4e __ STA T7 + 1 
48e8 : a0 04 __ LDY #$04
48ea : b1 0d __ LDA (P0),y ; (bm + 0)
48ec : aa __ __ TAX
48ed : 0a __ __ ASL
48ee : 85 4f __ STA T8 + 0 
48f0 : a9 a0 __ LDA #$a0
48f2 : 8d 00 59 STA $5900 ; (BLIT_CODE[0] + 0)
48f5 : a9 a2 __ LDA #$a2
48f7 : 8d 02 59 STA $5902 ; (BLIT_CODE[0] + 2)
48fa : a9 a5 __ LDA #$a5
48fc : 8d 04 59 STA $5904 ; (BLIT_CODE[0] + 4)
48ff : a9 0a __ LDA #$0a
4901 : 8d 05 59 STA $5905 ; (BLIT_CODE[0] + 5)
4904 : a9 00 __ LDA #$00
4906 : 2a __ __ ROL
4907 : 06 4f __ ASL T8 + 0 
4909 : 2a __ __ ROL
490a : 06 4f __ ASL T8 + 0 
490c : 2a __ __ ROL
490d : 85 50 __ STA T8 + 1 
490f : a5 52 __ LDA T11 + 0 
4911 : f0 0d __ BEQ $4920 ; (bmu_line.s16 + 0)
.s52:
4913 : 38 __ __ SEC
4914 : a9 00 __ LDA #$00
4916 : e5 4f __ SBC T8 + 0 
4918 : 85 4f __ STA T8 + 0 
491a : a9 00 __ LDA #$00
491c : e5 50 __ SBC T8 + 1 
491e : 85 50 __ STA T8 + 1 
.s16:
4920 : a5 11 __ LDA P4 ; (y0 + 0)
4922 : 29 f8 __ AND #$f8
4924 : 85 1b __ STA ACCU + 0 
4926 : a5 12 __ LDA P5 ; (y0 + 1)
4928 : 85 1c __ STA ACCU + 1 
492a : 8a __ __ TXA
492b : 20 af 4d JSR $4daf ; (mul16by8 + 0)
492e : 18 __ __ CLC
492f : a5 4d __ LDA T7 + 0 
4931 : 65 1b __ ADC ACCU + 0 
4933 : 85 4d __ STA T7 + 0 
4935 : a5 4e __ LDA T7 + 1 
4937 : 65 1c __ ADC ACCU + 1 
4939 : aa __ __ TAX
493a : a5 0f __ LDA P2 ; (x0 + 0)
493c : 29 f8 __ AND #$f8
493e : 18 __ __ CLC
493f : 65 4d __ ADC T7 + 0 
4941 : 85 4d __ STA T7 + 0 
4943 : 8a __ __ TXA
4944 : 65 10 __ ADC P3 ; (x0 + 1)
4946 : 85 4e __ STA T7 + 1 
4948 : a5 46 __ LDA T2 + 0 
494a : 05 43 __ ORA T0 + 0 
494c : 29 80 __ AND #$80
494e : 85 1b __ STA ACCU + 0 
4950 : a5 47 __ LDA T2 + 1 
4952 : 05 44 __ ORA T0 + 1 
4954 : 05 1b __ ORA ACCU + 0 
4956 : f0 02 __ BEQ $495a ; (bmu_line.s67 + 0)
.s66:
4958 : a9 01 __ LDA #$01
.s67:
495a : 85 1b __ STA ACCU + 0 
495c : a5 11 __ LDA P4 ; (y0 + 0)
495e : 29 07 __ AND #$07
4960 : 8d 01 59 STA $5901 ; (BLIT_CODE[0] + 1)
4963 : a6 49 __ LDX T4 + 0 
4965 : e8 __ __ INX
4966 : 8e 03 59 STX $5903 ; (BLIT_CODE[0] + 3)
4969 : a5 0f __ LDA P2 ; (x0 + 0)
496b : 29 07 __ AND #$07
496d : aa __ __ TAX
496e : bd 20 57 LDA $5720,x ; (bitshift[0] + 32)
4971 : 85 48 __ STA T3 + 0 
4973 : a2 06 __ LDX #$06
4975 : 86 45 __ STX T1 + 0 
4977 : a5 18 __ LDA P11 ; (op + 0)
4979 : c9 02 __ CMP #$02
497b : d0 03 __ BNE $4980 ; (bmu_line.s17 + 0)
497d : 4c 01 4d JMP $4d01 ; (bmu_line.s49 + 0)
.s17:
4980 : b0 03 __ BCS $4985 ; (bmu_line.s18 + 0)
4982 : 4c 8b 4c JMP $4c8b ; (bmu_line.s44 + 0)
.s18:
4985 : c9 03 __ CMP #$03
4987 : d0 3d __ BNE $49c6 ; (bmu_line.s19 + 0)
.s40:
4989 : a6 17 __ LDX P10 ; (pattern + 0)
498b : e8 __ __ INX
498c : f0 1e __ BEQ $49ac ; (bmu_line.s41 + 0)
.s43:
498e : a9 06 __ LDA #$06
4990 : 8d 06 59 STA $5906 ; (BLIT_CODE[0] + 6)
4993 : 8d 09 59 STA $5909 ; (BLIT_CODE[0] + 9)
4996 : a9 07 __ LDA #$07
4998 : 8d 07 59 STA $5907 ; (BLIT_CODE[0] + 7)
499b : 8d 0b 59 STA $590b ; (BLIT_CODE[0] + 11)
499e : a9 90 __ LDA #$90
49a0 : 8d 08 59 STA $5908 ; (BLIT_CODE[0] + 8)
49a3 : a9 e6 __ LDA #$e6
49a5 : 8d 0a 59 STA $590a ; (BLIT_CODE[0] + 10)
49a8 : a9 0c __ LDA #$0c
49aa : 85 45 __ STA T1 + 0 
.s41:
49ac : a9 51 __ LDA #$51
.s42:
49ae : a6 45 __ LDX T1 + 0 
49b0 : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
49b3 : a9 03 __ LDA #$03
49b5 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
49b8 : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
49bb : a9 91 __ LDA #$91
49bd : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
49c0 : 8a __ __ TXA
49c1 : 18 __ __ CLC
49c2 : 69 04 __ ADC #$04
.s64:
49c4 : 85 45 __ STA T1 + 0 
.s19:
49c6 : a5 43 __ LDA T0 + 0 
49c8 : 05 44 __ ORA T0 + 1 
49ca : f0 03 __ BEQ $49cf ; (bmu_line.s20 + 0)
49cc : 4c a4 4a JMP $4aa4 ; (bmu_line.s28 + 0)
.s20:
49cf : a5 46 __ LDA T2 + 0 
49d1 : 05 47 __ ORA T2 + 1 
49d3 : f0 75 __ BEQ $4a4a ; (bmu_line.s21 + 0)
.s22:
49d5 : a9 0a __ LDA #$0a
49d7 : a6 45 __ LDX T1 + 0 
49d9 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
49dc : 9d 05 59 STA $5905,x ; (BLIT_CODE[0] + 5)
49df : a9 90 __ LDA #$90
49e1 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
49e4 : a9 0c __ LDA #$0c
49e6 : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
49e9 : a9 a5 __ LDA #$a5
49eb : 9d 06 59 STA $5906,x ; (BLIT_CODE[0] + 6)
49ee : a9 03 __ LDA #$03
49f0 : 9d 07 59 STA $5907,x ; (BLIT_CODE[0] + 7)
49f3 : a9 69 __ LDA #$69
49f5 : 9d 08 59 STA $5908,x ; (BLIT_CODE[0] + 8)
49f8 : a5 51 __ LDA T10 + 0 
49fa : f0 09 __ BEQ $4a05 ; (bmu_line.s23 + 0)
.s27:
49fc : a9 06 __ LDA #$06
49fe : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
4a01 : a9 26 __ LDA #$26
4a03 : d0 07 __ BNE $4a0c ; (bmu_line.s62 + 0)
.s23:
4a05 : a9 46 __ LDA #$46
4a07 : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
4a0a : a9 66 __ LDA #$66
.s62:
4a0c : 9d 04 59 STA $5904,x ; (BLIT_CODE[0] + 4)
4a0f : a9 02 __ LDA #$02
4a11 : 9d 0b 59 STA $590b,x ; (BLIT_CODE[0] + 11)
4a14 : a5 51 __ LDA T10 + 0 
4a16 : f0 0e __ BEQ $4a26 ; (bmu_line.s24 + 0)
.s26:
4a18 : a9 f8 __ LDA #$f8
4a1a : 9d 09 59 STA $5909,x ; (BLIT_CODE[0] + 9)
4a1d : a9 b0 __ LDA #$b0
4a1f : 9d 0a 59 STA $590a,x ; (BLIT_CODE[0] + 10)
4a22 : a9 c6 __ LDA #$c6
4a24 : d0 0c __ BNE $4a32 ; (bmu_line.s25 + 0)
.s24:
4a26 : a9 08 __ LDA #$08
4a28 : 9d 09 59 STA $5909,x ; (BLIT_CODE[0] + 9)
4a2b : a9 90 __ LDA #$90
4a2d : 9d 0a 59 STA $590a,x ; (BLIT_CODE[0] + 10)
4a30 : a9 e6 __ LDA #$e6
.s25:
4a32 : 9d 0c 59 STA $590c,x ; (BLIT_CODE[0] + 12)
4a35 : a9 04 __ LDA #$04
4a37 : 9d 0d 59 STA $590d,x ; (BLIT_CODE[0] + 13)
4a3a : a9 85 __ LDA #$85
4a3c : 9d 0e 59 STA $590e,x ; (BLIT_CODE[0] + 14)
4a3f : a9 03 __ LDA #$03
4a41 : 9d 0f 59 STA $590f,x ; (BLIT_CODE[0] + 15)
4a44 : 8a __ __ TXA
4a45 : 18 __ __ CLC
4a46 : 69 10 __ ADC #$10
4a48 : 85 45 __ STA T1 + 0 
.s21:
4a4a : a9 ca __ LDA #$ca
4a4c : a6 45 __ LDX T1 + 0 
4a4e : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
4a51 : a9 d0 __ LDA #$d0
4a53 : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
4a56 : a9 c6 __ LDA #$c6
4a58 : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
4a5b : a9 0b __ LDA #$0b
4a5d : 9d 04 59 STA $5904,x ; (BLIT_CODE[0] + 4)
4a60 : a9 10 __ LDA #$10
4a62 : 9d 05 59 STA $5905,x ; (BLIT_CODE[0] + 5)
4a65 : a9 60 __ LDA #$60
4a67 : 9d 07 59 STA $5907,x ; (BLIT_CODE[0] + 7)
4a6a : e6 45 __ INC T1 + 0 
4a6c : 38 __ __ SEC
4a6d : a9 02 __ LDA #$02
4a6f : e5 45 __ SBC T1 + 0 
4a71 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
4a74 : 8a __ __ TXA
4a75 : 18 __ __ CLC
4a76 : 69 05 __ ADC #$05
4a78 : 49 ff __ EOR #$ff
4a7a : 18 __ __ CLC
4a7b : 69 03 __ ADC #$03
4a7d : 9d 06 59 STA $5906,x ; (BLIT_CODE[0] + 6)
4a80 : a5 4a __ LDA T4 + 1 
4a82 : 85 49 __ STA T4 + 0 
4a84 : a5 4d __ LDA T7 + 0 
4a86 : 85 03 __ STA WORK + 0 
4a88 : a5 4e __ LDA T7 + 1 
4a8a : 85 04 __ STA WORK + 1 
4a8c : a5 4b __ LDA T5 + 0 
4a8e : 85 05 __ STA WORK + 2 
4a90 : a5 4c __ LDA T5 + 1 
4a92 : 85 06 __ STA WORK + 3 
4a94 : a5 49 __ LDA T4 + 0 
4a96 : 85 0b __ STA WORK + 8 
4a98 : a5 48 __ LDA T3 + 0 
4a9a : 85 0a __ STA WORK + 7 
4a9c : a5 17 __ LDA P10 ; (pattern + 0)
4a9e : 85 07 __ STA WORK + 4 
4aa0 : 20 00 59 JSR $5900 ; (BLIT_CODE[0] + 0)
.s3:
4aa3 : 60 __ __ RTS
.s28:
4aa4 : a5 46 __ LDA T2 + 0 
4aa6 : 05 47 __ ORA T2 + 1 
4aa8 : c9 01 __ CMP #$01
4aaa : a9 00 __ LDA #$00
4aac : 6a __ __ ROR
4aad : 85 1c __ STA ACCU + 1 
4aaf : f0 03 __ BEQ $4ab4 ; (bmu_line.s29 + 0)
4ab1 : 4c 4b 4c JMP $4c4b ; (bmu_line.s35 + 0)
.s29:
4ab4 : a2 00 __ LDX #$00
4ab6 : 86 46 __ STX T2 + 0 
4ab8 : 86 47 __ STX T2 + 1 
4aba : a5 52 __ LDA T11 + 0 
4abc : f0 03 __ BEQ $4ac1 ; (bmu_line.s30 + 0)
4abe : 4c e1 4b JMP $4be1 ; (bmu_line.s34 + 0)
.s30:
4ac1 : a9 c8 __ LDA #$c8
4ac3 : a4 45 __ LDY T1 + 0 
4ac5 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
4ac8 : a9 c0 __ LDA #$c0
4aca : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
4acd : a9 08 __ LDA #$08
4acf : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
4ad2 : a9 d0 __ LDA #$d0
4ad4 : 99 03 59 STA $5903,y ; (BLIT_CODE[0] + 3)
4ad7 : a9 a0 __ LDA #$a0
4ad9 : 99 05 59 STA $5905,y ; (BLIT_CODE[0] + 5)
4adc : a9 00 __ LDA #$00
4ade : 99 06 59 STA $5906,y ; (BLIT_CODE[0] + 6)
4ae1 : a9 a5 __ LDA #$a5
4ae3 : 99 07 59 STA $5907,y ; (BLIT_CODE[0] + 7)
4ae6 : 99 0d 59 STA $590d,y ; (BLIT_CODE[0] + 13)
4ae9 : a9 03 __ LDA #$03
4aeb : 99 08 59 STA $5908,y ; (BLIT_CODE[0] + 8)
4aee : 99 0c 59 STA $590c,y ; (BLIT_CODE[0] + 12)
4af1 : a9 69 __ LDA #$69
4af3 : 99 09 59 STA $5909,y ; (BLIT_CODE[0] + 9)
4af6 : 99 0f 59 STA $590f,y ; (BLIT_CODE[0] + 15)
4af9 : a9 85 __ LDA #$85
4afb : 99 0b 59 STA $590b,y ; (BLIT_CODE[0] + 11)
4afe : 99 11 59 STA $5911,y ; (BLIT_CODE[0] + 17)
4b01 : a9 04 __ LDA #$04
4b03 : 99 0e 59 STA $590e,y ; (BLIT_CODE[0] + 14)
4b06 : 99 12 59 STA $5912,y ; (BLIT_CODE[0] + 18)
4b09 : 8a __ __ TXA
4b0a : f0 04 __ BEQ $4b10 ; (bmu_line.s71 + 0)
.s72:
4b0c : a9 10 __ LDA #$10
4b0e : 90 02 __ BCC $4b12 ; (bmu_line.s73 + 0)
.s71:
4b10 : a9 0e __ LDA #$0e
.s73:
4b12 : 99 04 59 STA $5904,y ; (BLIT_CODE[0] + 4)
4b15 : 38 __ __ SEC
4b16 : a5 4f __ LDA T8 + 0 
4b18 : e9 01 __ SBC #$01
4b1a : 99 0a 59 STA $590a,y ; (BLIT_CODE[0] + 10)
4b1d : a5 50 __ LDA T8 + 1 
4b1f : e9 00 __ SBC #$00
4b21 : 99 10 59 STA $5910,y ; (BLIT_CODE[0] + 16)
4b24 : 98 __ __ TYA
4b25 : 18 __ __ CLC
4b26 : 69 13 __ ADC #$13
4b28 : 85 45 __ STA T1 + 0 
4b2a : a8 __ __ TAY
4b2b : 24 1c __ BIT ACCU + 1 
4b2d : 30 03 __ BMI $4b32 ; (bmu_line.s31 + 0)
4b2f : 4c cf 49 JMP $49cf ; (bmu_line.s20 + 0)
.s31:
4b32 : a9 a5 __ LDA #$a5
4b34 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
4b37 : a9 05 __ LDA #$05
4b39 : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
4b3c : 99 06 59 STA $5906,y ; (BLIT_CODE[0] + 6)
4b3f : a9 38 __ LDA #$38
4b41 : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
4b44 : a9 e9 __ LDA #$e9
4b46 : 99 03 59 STA $5903,y ; (BLIT_CODE[0] + 3)
4b49 : a9 85 __ LDA #$85
4b4b : 99 05 59 STA $5905,y ; (BLIT_CODE[0] + 5)
4b4e : a5 46 __ LDA T2 + 0 
4b50 : 99 04 59 STA $5904,y ; (BLIT_CODE[0] + 4)
4b53 : a5 1b __ LDA ACCU + 0 
4b55 : d0 2a __ BNE $4b81 ; (bmu_line.s33 + 0)
.s32:
4b57 : a9 10 __ LDA #$10
4b59 : 99 07 59 STA $5907,y ; (BLIT_CODE[0] + 7)
4b5c : a9 15 __ LDA #$15
4b5e : 99 08 59 STA $5908,y ; (BLIT_CODE[0] + 8)
4b61 : a9 18 __ LDA #$18
4b63 : 99 09 59 STA $5909,y ; (BLIT_CODE[0] + 9)
4b66 : a9 69 __ LDA #$69
4b68 : 99 0a 59 STA $590a,y ; (BLIT_CODE[0] + 10)
4b6b : a5 43 __ LDA T0 + 0 
4b6d : 99 0b 59 STA $590b,y ; (BLIT_CODE[0] + 11)
4b70 : a9 85 __ LDA #$85
4b72 : 99 0c 59 STA $590c,y ; (BLIT_CODE[0] + 12)
4b75 : a9 05 __ LDA #$05
4b77 : 99 0d 59 STA $590d,y ; (BLIT_CODE[0] + 13)
4b7a : 98 __ __ TYA
4b7b : 18 __ __ CLC
4b7c : 69 0e __ ADC #$0e
4b7e : 4c dc 4b JMP $4bdc ; (bmu_line.s65 + 0)
.s33:
4b81 : a9 a5 __ LDA #$a5
4b83 : 99 07 59 STA $5907,y ; (BLIT_CODE[0] + 7)
4b86 : 99 10 59 STA $5910,y ; (BLIT_CODE[0] + 16)
4b89 : 99 16 59 STA $5916,y ; (BLIT_CODE[0] + 22)
4b8c : a9 06 __ LDA #$06
4b8e : 99 08 59 STA $5908,y ; (BLIT_CODE[0] + 8)
4b91 : 99 0c 59 STA $590c,y ; (BLIT_CODE[0] + 12)
4b94 : 99 17 59 STA $5917,y ; (BLIT_CODE[0] + 23)
4b97 : 99 1b 59 STA $591b,y ; (BLIT_CODE[0] + 27)
4b9a : a9 e9 __ LDA #$e9
4b9c : 99 09 59 STA $5909,y ; (BLIT_CODE[0] + 9)
4b9f : a9 85 __ LDA #$85
4ba1 : 99 0b 59 STA $590b,y ; (BLIT_CODE[0] + 11)
4ba4 : 99 14 59 STA $5914,y ; (BLIT_CODE[0] + 20)
4ba7 : 99 1a 59 STA $591a,y ; (BLIT_CODE[0] + 26)
4baa : a9 10 __ LDA #$10
4bac : 99 0d 59 STA $590d,y ; (BLIT_CODE[0] + 13)
4baf : a9 1d __ LDA #$1d
4bb1 : 99 0e 59 STA $590e,y ; (BLIT_CODE[0] + 14)
4bb4 : a9 18 __ LDA #$18
4bb6 : 99 0f 59 STA $590f,y ; (BLIT_CODE[0] + 15)
4bb9 : a9 05 __ LDA #$05
4bbb : 99 11 59 STA $5911,y ; (BLIT_CODE[0] + 17)
4bbe : 99 15 59 STA $5915,y ; (BLIT_CODE[0] + 21)
4bc1 : a9 69 __ LDA #$69
4bc3 : 99 12 59 STA $5912,y ; (BLIT_CODE[0] + 18)
4bc6 : 99 18 59 STA $5918,y ; (BLIT_CODE[0] + 24)
4bc9 : a5 43 __ LDA T0 + 0 
4bcb : 99 13 59 STA $5913,y ; (BLIT_CODE[0] + 19)
4bce : a5 47 __ LDA T2 + 1 
4bd0 : 99 0a 59 STA $590a,y ; (BLIT_CODE[0] + 10)
4bd3 : a5 44 __ LDA T0 + 1 
4bd5 : 99 19 59 STA $5919,y ; (BLIT_CODE[0] + 25)
4bd8 : 98 __ __ TYA
4bd9 : 18 __ __ CLC
4bda : 69 1c __ ADC #$1c
.s65:
4bdc : 85 45 __ STA T1 + 0 
4bde : 4c d5 49 JMP $49d5 ; (bmu_line.s22 + 0)
.s34:
4be1 : a9 88 __ LDA #$88
4be3 : a4 45 __ LDY T1 + 0 
4be5 : 99 00 59 STA $5900,y ; (BLIT_CODE[0] + 0)
4be8 : a9 10 __ LDA #$10
4bea : 99 01 59 STA $5901,y ; (BLIT_CODE[0] + 1)
4bed : a9 18 __ LDA #$18
4bef : 99 03 59 STA $5903,y ; (BLIT_CODE[0] + 3)
4bf2 : a9 a0 __ LDA #$a0
4bf4 : 99 04 59 STA $5904,y ; (BLIT_CODE[0] + 4)
4bf7 : a9 07 __ LDA #$07
4bf9 : 99 05 59 STA $5905,y ; (BLIT_CODE[0] + 5)
4bfc : a9 a5 __ LDA #$a5
4bfe : 99 06 59 STA $5906,y ; (BLIT_CODE[0] + 6)
4c01 : 99 0c 59 STA $590c,y ; (BLIT_CODE[0] + 12)
4c04 : a9 03 __ LDA #$03
4c06 : 99 07 59 STA $5907,y ; (BLIT_CODE[0] + 7)
4c09 : 99 0b 59 STA $590b,y ; (BLIT_CODE[0] + 11)
4c0c : a9 69 __ LDA #$69
4c0e : 99 08 59 STA $5908,y ; (BLIT_CODE[0] + 8)
4c11 : 99 0e 59 STA $590e,y ; (BLIT_CODE[0] + 14)
4c14 : a9 85 __ LDA #$85
4c16 : 99 0a 59 STA $590a,y ; (BLIT_CODE[0] + 10)
4c19 : 99 10 59 STA $5910,y ; (BLIT_CODE[0] + 16)
4c1c : a9 04 __ LDA #$04
4c1e : 99 0d 59 STA $590d,y ; (BLIT_CODE[0] + 13)
4c21 : 99 11 59 STA $5911,y ; (BLIT_CODE[0] + 17)
4c24 : 8a __ __ TXA
4c25 : f0 04 __ BEQ $4c2b ; (bmu_line.s68 + 0)
.s69:
4c27 : a9 11 __ LDA #$11
4c29 : 90 02 __ BCC $4c2d ; (bmu_line.s70 + 0)
.s68:
4c2b : a9 0f __ LDA #$0f
.s70:
4c2d : 99 02 59 STA $5902,y ; (BLIT_CODE[0] + 2)
4c30 : a5 4f __ LDA T8 + 0 
4c32 : 99 09 59 STA $5909,y ; (BLIT_CODE[0] + 9)
4c35 : a5 50 __ LDA T8 + 1 
4c37 : 99 0f 59 STA $590f,y ; (BLIT_CODE[0] + 15)
4c3a : 98 __ __ TYA
4c3b : 18 __ __ CLC
4c3c : 69 12 __ ADC #$12
4c3e : 85 45 __ STA T1 + 0 
4c40 : a8 __ __ TAY
4c41 : 24 1c __ BIT ACCU + 1 
4c43 : 10 03 __ BPL $4c48 ; (bmu_line.s70 + 27)
4c45 : 4c 32 4b JMP $4b32 ; (bmu_line.s31 + 0)
4c48 : 4c cf 49 JMP $49cf ; (bmu_line.s20 + 0)
.s35:
4c4b : a9 a5 __ LDA #$a5
4c4d : a6 45 __ LDX T1 + 0 
4c4f : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
4c52 : a9 30 __ LDA #$30
4c54 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
4c57 : a5 1b __ LDA ACCU + 0 
4c59 : 69 05 __ ADC #$05
4c5b : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
4c5e : a5 1b __ LDA ACCU + 0 
4c60 : d0 21 __ BNE $4c83 ; (bmu_line.s39 + 0)
.s36:
4c62 : a0 1b __ LDY #$1b
4c64 : a5 52 __ LDA T11 + 0 
4c66 : d0 01 __ BNE $4c69 ; (bmu_line.s38 + 0)
.s37:
4c68 : c8 __ __ INY
.s38:
4c69 : 98 __ __ TYA
4c6a : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
4c6d : 8a __ __ TXA
4c6e : 18 __ __ CLC
4c6f : 69 04 __ ADC #$04
4c71 : 85 45 __ STA T1 + 0 
4c73 : a9 00 __ LDA #$00
4c75 : c5 1b __ CMP ACCU + 0 
4c77 : 2a __ __ ROL
4c78 : aa __ __ TAX
4c79 : a5 52 __ LDA T11 + 0 
4c7b : f0 03 __ BEQ $4c80 ; (bmu_line.s38 + 23)
4c7d : 4c e1 4b JMP $4be1 ; (bmu_line.s34 + 0)
4c80 : 4c c1 4a JMP $4ac1 ; (bmu_line.s30 + 0)
.s39:
4c83 : a0 21 __ LDY #$21
4c85 : a5 52 __ LDA T11 + 0 
4c87 : d0 e0 __ BNE $4c69 ; (bmu_line.s38 + 0)
4c89 : f0 dd __ BEQ $4c68 ; (bmu_line.s37 + 0)
.s44:
4c8b : a8 __ __ TAY
4c8c : d0 4b __ BNE $4cd9 ; (bmu_line.s46 + 0)
.s45:
4c8e : 8e 06 59 STX $5906 ; (BLIT_CODE[0] + 6)
4c91 : 8e 09 59 STX $5909 ; (BLIT_CODE[0] + 9)
4c94 : a9 07 __ LDA #$07
4c96 : 8d 07 59 STA $5907 ; (BLIT_CODE[0] + 7)
4c99 : 8d 0b 59 STA $590b ; (BLIT_CODE[0] + 11)
4c9c : a9 03 __ LDA #$03
4c9e : 8d 0d 59 STA $590d ; (BLIT_CODE[0] + 13)
4ca1 : 8d 13 59 STA $5913 ; (BLIT_CODE[0] + 19)
4ca4 : 8d 15 59 STA $5915 ; (BLIT_CODE[0] + 21)
4ca7 : a9 90 __ LDA #$90
4ca9 : 8d 08 59 STA $5908 ; (BLIT_CODE[0] + 8)
4cac : a9 e6 __ LDA #$e6
4cae : 8d 0a 59 STA $590a ; (BLIT_CODE[0] + 10)
4cb1 : a9 11 __ LDA #$11
4cb3 : 8d 0c 59 STA $590c ; (BLIT_CODE[0] + 12)
4cb6 : a9 d0 __ LDA #$d0
4cb8 : 8d 0e 59 STA $590e ; (BLIT_CODE[0] + 14)
4cbb : a9 04 __ LDA #$04
4cbd : 8d 0f 59 STA $590f ; (BLIT_CODE[0] + 15)
4cc0 : a9 49 __ LDA #$49
4cc2 : 8d 10 59 STA $5910 ; (BLIT_CODE[0] + 16)
4cc5 : a9 ff __ LDA #$ff
4cc7 : 8d 11 59 STA $5911 ; (BLIT_CODE[0] + 17)
4cca : a9 31 __ LDA #$31
4ccc : 8d 12 59 STA $5912 ; (BLIT_CODE[0] + 18)
4ccf : a9 91 __ LDA #$91
4cd1 : 8d 14 59 STA $5914 ; (BLIT_CODE[0] + 20)
4cd4 : a9 16 __ LDA #$16
4cd6 : 4c c4 49 JMP $49c4 ; (bmu_line.s64 + 0)
.s46:
4cd9 : a6 17 __ LDX P10 ; (pattern + 0)
4cdb : e8 __ __ INX
4cdc : f0 1e __ BEQ $4cfc ; (bmu_line.s47 + 0)
.s48:
4cde : a9 06 __ LDA #$06
4ce0 : 8d 06 59 STA $5906 ; (BLIT_CODE[0] + 6)
4ce3 : 8d 09 59 STA $5909 ; (BLIT_CODE[0] + 9)
4ce6 : a9 07 __ LDA #$07
4ce8 : 8d 07 59 STA $5907 ; (BLIT_CODE[0] + 7)
4ceb : 8d 0b 59 STA $590b ; (BLIT_CODE[0] + 11)
4cee : a9 90 __ LDA #$90
4cf0 : 8d 08 59 STA $5908 ; (BLIT_CODE[0] + 8)
4cf3 : a9 e6 __ LDA #$e6
4cf5 : 8d 0a 59 STA $590a ; (BLIT_CODE[0] + 10)
4cf8 : a9 0c __ LDA #$0c
4cfa : 85 45 __ STA T1 + 0 
.s47:
4cfc : a9 11 __ LDA #$11
4cfe : 4c ae 49 JMP $49ae ; (bmu_line.s42 + 0)
.s49:
4d01 : a4 17 __ LDY P10 ; (pattern + 0)
4d03 : c8 __ __ INY
4d04 : f0 1e __ BEQ $4d24 ; (bmu_line.s50 + 0)
.s51:
4d06 : 8e 06 59 STX $5906 ; (BLIT_CODE[0] + 6)
4d09 : a9 07 __ LDA #$07
4d0b : 8d 07 59 STA $5907 ; (BLIT_CODE[0] + 7)
4d0e : 8d 0b 59 STA $590b ; (BLIT_CODE[0] + 11)
4d11 : a9 90 __ LDA #$90
4d13 : 8d 08 59 STA $5908 ; (BLIT_CODE[0] + 8)
4d16 : a9 08 __ LDA #$08
4d18 : 8d 09 59 STA $5909 ; (BLIT_CODE[0] + 9)
4d1b : a9 e6 __ LDA #$e6
4d1d : 8d 0a 59 STA $590a ; (BLIT_CODE[0] + 10)
4d20 : a9 0c __ LDA #$0c
4d22 : 85 45 __ STA T1 + 0 
.s50:
4d24 : a9 49 __ LDA #$49
4d26 : a6 45 __ LDX T1 + 0 
4d28 : 9d 00 59 STA $5900,x ; (BLIT_CODE[0] + 0)
4d2b : a9 ff __ LDA #$ff
4d2d : 9d 01 59 STA $5901,x ; (BLIT_CODE[0] + 1)
4d30 : a9 31 __ LDA #$31
4d32 : 9d 02 59 STA $5902,x ; (BLIT_CODE[0] + 2)
4d35 : a9 03 __ LDA #$03
4d37 : 9d 03 59 STA $5903,x ; (BLIT_CODE[0] + 3)
4d3a : 9d 05 59 STA $5905,x ; (BLIT_CODE[0] + 5)
4d3d : a9 91 __ LDA #$91
4d3f : 9d 04 59 STA $5904,x ; (BLIT_CODE[0] + 4)
4d42 : 8a __ __ TXA
4d43 : 18 __ __ CLC
4d44 : 69 06 __ ADC #$06
4d46 : 4c c4 49 JMP $49c4 ; (bmu_line.s64 + 0)
.s59:
4d49 : c9 ff __ CMP #$ff
4d4b : f0 03 __ BEQ $4d50 ; (bmu_line.s60 + 0)
4d4d : 4c 55 48 JMP $4855 ; (bmu_line.s7 + 0)
.s60:
4d50 : a5 18 __ LDA P11 ; (op + 0)
4d52 : d0 f9 __ BNE $4d4d ; (bmu_line.s59 + 4)
.s61:
4d54 : a9 01 __ LDA #$01
4d56 : 4c 53 48 JMP $4853 ; (bmu_line.s63 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
4d59 : 20 e4 ff JSR $ffe4 
4d5c : 85 1b __ STA ACCU + 0 
4d5e : a5 1b __ LDA ACCU + 0 
4d60 : f0 f7 __ BEQ $4d59 ; (getch.l4 + 0)
.s5:
4d62 : 4c 65 4d JMP $4d65 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
4d65 : a8 __ __ TAY
4d66 : ad d2 56 LDA $56d2 ; (giocharmap + 0)
4d69 : f0 27 __ BEQ $4d92 ; (convch.s5 + 0)
.s6:
4d6b : c0 0d __ CPY #$0d
4d6d : d0 03 __ BNE $4d72 ; (convch.s7 + 0)
.s16:
4d6f : a9 0a __ LDA #$0a
.s3:
4d71 : 60 __ __ RTS
.s7:
4d72 : c9 02 __ CMP #$02
4d74 : 90 1c __ BCC $4d92 ; (convch.s5 + 0)
.s8:
4d76 : 98 __ __ TYA
4d77 : c0 41 __ CPY #$41
4d79 : 90 17 __ BCC $4d92 ; (convch.s5 + 0)
.s9:
4d7b : c9 db __ CMP #$db
4d7d : b0 13 __ BCS $4d92 ; (convch.s5 + 0)
.s10:
4d7f : c9 c1 __ CMP #$c1
4d81 : 90 03 __ BCC $4d86 ; (convch.s11 + 0)
.s15:
4d83 : 49 a0 __ EOR #$a0
4d85 : a8 __ __ TAY
.s11:
4d86 : c9 7b __ CMP #$7b
4d88 : b0 08 __ BCS $4d92 ; (convch.s5 + 0)
.s12:
4d8a : c9 61 __ CMP #$61
4d8c : b0 06 __ BCS $4d94 ; (convch.s14 + 0)
.s13:
4d8e : c9 5b __ CMP #$5b
4d90 : 90 02 __ BCC $4d94 ; (convch.s14 + 0)
.s5:
4d92 : 98 __ __ TYA
4d93 : 60 __ __ RTS
.s14:
4d94 : 49 20 __ EOR #$20
4d96 : 60 __ __ RTS
--------------------------------------------------------------------
restore: ; restore()->void
;  52, "/home/honza/projects/c64/projects/oscar64/samples/hires/func3d.c"
.s4:
4d97 : a9 00 __ LDA #$00
4d99 : 85 0d __ STA P0 
4d9b : 85 0e __ STA P1 
4d9d : 85 10 __ STA P3 
4d9f : a9 04 __ LDA #$04
4da1 : 85 0f __ STA P2 
4da3 : a9 10 __ LDA #$10
4da5 : 85 11 __ STA P4 
4da7 : 20 5e 15 JSR $155e ; (vic_setmode.s4 + 0)
4daa : a9 37 __ LDA #$37
4dac : 85 01 __ STA $01 
.s3:
4dae : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
4daf : 4a __ __ LSR
4db0 : f0 2e __ BEQ $4de0 ; (mul16by8 + 49)
4db2 : a2 00 __ LDX #$00
4db4 : a0 00 __ LDY #$00
4db6 : 90 13 __ BCC $4dcb ; (mul16by8 + 28)
4db8 : a4 1b __ LDY ACCU + 0 
4dba : a6 1c __ LDX ACCU + 1 
4dbc : b0 0d __ BCS $4dcb ; (mul16by8 + 28)
4dbe : 85 02 __ STA $02 
4dc0 : 18 __ __ CLC
4dc1 : 98 __ __ TYA
4dc2 : 65 1b __ ADC ACCU + 0 
4dc4 : a8 __ __ TAY
4dc5 : 8a __ __ TXA
4dc6 : 65 1c __ ADC ACCU + 1 
4dc8 : aa __ __ TAX
4dc9 : a5 02 __ LDA $02 
4dcb : 06 1b __ ASL ACCU + 0 
4dcd : 26 1c __ ROL ACCU + 1 
4dcf : 4a __ __ LSR
4dd0 : 90 f9 __ BCC $4dcb ; (mul16by8 + 28)
4dd2 : d0 ea __ BNE $4dbe ; (mul16by8 + 15)
4dd4 : 18 __ __ CLC
4dd5 : 98 __ __ TYA
4dd6 : 65 1b __ ADC ACCU + 0 
4dd8 : 85 1b __ STA ACCU + 0 
4dda : 8a __ __ TXA
4ddb : 65 1c __ ADC ACCU + 1 
4ddd : 85 1c __ STA ACCU + 1 
4ddf : 60 __ __ RTS
4de0 : b0 04 __ BCS $4de6 ; (mul16by8 + 55)
4de2 : 85 1b __ STA ACCU + 0 
4de4 : 85 1c __ STA ACCU + 1 
4de6 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
4de7 : a0 00 __ LDY #$00
4de9 : 84 07 __ STY WORK + 4 
4deb : 84 08 __ STY WORK + 5 
4ded : 84 09 __ STY WORK + 6 
4def : 4a __ __ LSR
4df0 : b0 0d __ BCS $4dff ; (mul32by8 + 24)
4df2 : f0 26 __ BEQ $4e1a ; (mul32by8 + 51)
4df4 : 06 1b __ ASL ACCU + 0 
4df6 : 26 1c __ ROL ACCU + 1 
4df8 : 26 1d __ ROL ACCU + 2 
4dfa : 26 1e __ ROL ACCU + 3 
4dfc : 4a __ __ LSR
4dfd : 90 f5 __ BCC $4df4 ; (mul32by8 + 13)
4dff : aa __ __ TAX
4e00 : 18 __ __ CLC
4e01 : a5 07 __ LDA WORK + 4 
4e03 : 65 1b __ ADC ACCU + 0 
4e05 : 85 07 __ STA WORK + 4 
4e07 : a5 08 __ LDA WORK + 5 
4e09 : 65 1c __ ADC ACCU + 1 
4e0b : 85 08 __ STA WORK + 5 
4e0d : a5 09 __ LDA WORK + 6 
4e0f : 65 1d __ ADC ACCU + 2 
4e11 : 85 09 __ STA WORK + 6 
4e13 : 98 __ __ TYA
4e14 : 65 1e __ ADC ACCU + 3 
4e16 : a8 __ __ TAY
4e17 : 8a __ __ TXA
4e18 : d0 da __ BNE $4df4 ; (mul32by8 + 13)
4e1a : 84 0a __ STY WORK + 7 
4e1c : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
4e1d : b1 19 __ LDA (IP + 0),y 
4e1f : c8 __ __ INY
4e20 : aa __ __ TAX
4e21 : b5 00 __ LDA $00,x 
4e23 : 85 03 __ STA WORK + 0 
4e25 : b5 01 __ LDA $01,x 
4e27 : 85 04 __ STA WORK + 1 
4e29 : b5 02 __ LDA $02,x 
4e2b : 85 05 __ STA WORK + 2 
4e2d : b5 03 __ LDA WORK + 0,x 
4e2f : 85 06 __ STA WORK + 3 
4e31 : a5 05 __ LDA WORK + 2 
4e33 : 0a __ __ ASL
4e34 : a5 06 __ LDA WORK + 3 
4e36 : 2a __ __ ROL
4e37 : 85 08 __ STA WORK + 5 
4e39 : f0 06 __ BEQ $4e41 ; (freg + 36)
4e3b : a5 05 __ LDA WORK + 2 
4e3d : 09 80 __ ORA #$80
4e3f : 85 05 __ STA WORK + 2 
4e41 : a5 1d __ LDA ACCU + 2 
4e43 : 0a __ __ ASL
4e44 : a5 1e __ LDA ACCU + 3 
4e46 : 2a __ __ ROL
4e47 : 85 07 __ STA WORK + 4 
4e49 : f0 06 __ BEQ $4e51 ; (freg + 52)
4e4b : a5 1d __ LDA ACCU + 2 
4e4d : 09 80 __ ORA #$80
4e4f : 85 1d __ STA ACCU + 2 
4e51 : 60 __ __ RTS
4e52 : 06 1e __ ASL ACCU + 3 
4e54 : a5 07 __ LDA WORK + 4 
4e56 : 6a __ __ ROR
4e57 : 85 1e __ STA ACCU + 3 
4e59 : b0 06 __ BCS $4e61 ; (freg + 68)
4e5b : a5 1d __ LDA ACCU + 2 
4e5d : 29 7f __ AND #$7f
4e5f : 85 1d __ STA ACCU + 2 
4e61 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
4e62 : a5 06 __ LDA WORK + 3 
4e64 : 49 80 __ EOR #$80
4e66 : 85 06 __ STA WORK + 3 
4e68 : a9 ff __ LDA #$ff
4e6a : c5 07 __ CMP WORK + 4 
4e6c : f0 04 __ BEQ $4e72 ; (faddsub + 16)
4e6e : c5 08 __ CMP WORK + 5 
4e70 : d0 11 __ BNE $4e83 ; (faddsub + 33)
4e72 : a5 1e __ LDA ACCU + 3 
4e74 : 09 7f __ ORA #$7f
4e76 : 85 1e __ STA ACCU + 3 
4e78 : a9 80 __ LDA #$80
4e7a : 85 1d __ STA ACCU + 2 
4e7c : a9 00 __ LDA #$00
4e7e : 85 1b __ STA ACCU + 0 
4e80 : 85 1c __ STA ACCU + 1 
4e82 : 60 __ __ RTS
4e83 : 38 __ __ SEC
4e84 : a5 07 __ LDA WORK + 4 
4e86 : e5 08 __ SBC WORK + 5 
4e88 : f0 38 __ BEQ $4ec2 ; (faddsub + 96)
4e8a : aa __ __ TAX
4e8b : b0 25 __ BCS $4eb2 ; (faddsub + 80)
4e8d : e0 e9 __ CPX #$e9
4e8f : b0 0e __ BCS $4e9f ; (faddsub + 61)
4e91 : a5 08 __ LDA WORK + 5 
4e93 : 85 07 __ STA WORK + 4 
4e95 : a9 00 __ LDA #$00
4e97 : 85 1b __ STA ACCU + 0 
4e99 : 85 1c __ STA ACCU + 1 
4e9b : 85 1d __ STA ACCU + 2 
4e9d : f0 23 __ BEQ $4ec2 ; (faddsub + 96)
4e9f : a5 1d __ LDA ACCU + 2 
4ea1 : 4a __ __ LSR
4ea2 : 66 1c __ ROR ACCU + 1 
4ea4 : 66 1b __ ROR ACCU + 0 
4ea6 : e8 __ __ INX
4ea7 : d0 f8 __ BNE $4ea1 ; (faddsub + 63)
4ea9 : 85 1d __ STA ACCU + 2 
4eab : a5 08 __ LDA WORK + 5 
4ead : 85 07 __ STA WORK + 4 
4eaf : 4c c2 4e JMP $4ec2 ; (faddsub + 96)
4eb2 : e0 18 __ CPX #$18
4eb4 : b0 33 __ BCS $4ee9 ; (faddsub + 135)
4eb6 : a5 05 __ LDA WORK + 2 
4eb8 : 4a __ __ LSR
4eb9 : 66 04 __ ROR WORK + 1 
4ebb : 66 03 __ ROR WORK + 0 
4ebd : ca __ __ DEX
4ebe : d0 f8 __ BNE $4eb8 ; (faddsub + 86)
4ec0 : 85 05 __ STA WORK + 2 
4ec2 : a5 1e __ LDA ACCU + 3 
4ec4 : 29 80 __ AND #$80
4ec6 : 85 1e __ STA ACCU + 3 
4ec8 : 45 06 __ EOR WORK + 3 
4eca : 30 31 __ BMI $4efd ; (faddsub + 155)
4ecc : 18 __ __ CLC
4ecd : a5 1b __ LDA ACCU + 0 
4ecf : 65 03 __ ADC WORK + 0 
4ed1 : 85 1b __ STA ACCU + 0 
4ed3 : a5 1c __ LDA ACCU + 1 
4ed5 : 65 04 __ ADC WORK + 1 
4ed7 : 85 1c __ STA ACCU + 1 
4ed9 : a5 1d __ LDA ACCU + 2 
4edb : 65 05 __ ADC WORK + 2 
4edd : 85 1d __ STA ACCU + 2 
4edf : 90 08 __ BCC $4ee9 ; (faddsub + 135)
4ee1 : 66 1d __ ROR ACCU + 2 
4ee3 : 66 1c __ ROR ACCU + 1 
4ee5 : 66 1b __ ROR ACCU + 0 
4ee7 : e6 07 __ INC WORK + 4 
4ee9 : a5 07 __ LDA WORK + 4 
4eeb : c9 ff __ CMP #$ff
4eed : f0 83 __ BEQ $4e72 ; (faddsub + 16)
4eef : 4a __ __ LSR
4ef0 : 05 1e __ ORA ACCU + 3 
4ef2 : 85 1e __ STA ACCU + 3 
4ef4 : b0 06 __ BCS $4efc ; (faddsub + 154)
4ef6 : a5 1d __ LDA ACCU + 2 
4ef8 : 29 7f __ AND #$7f
4efa : 85 1d __ STA ACCU + 2 
4efc : 60 __ __ RTS
4efd : 38 __ __ SEC
4efe : a5 1b __ LDA ACCU + 0 
4f00 : e5 03 __ SBC WORK + 0 
4f02 : 85 1b __ STA ACCU + 0 
4f04 : a5 1c __ LDA ACCU + 1 
4f06 : e5 04 __ SBC WORK + 1 
4f08 : 85 1c __ STA ACCU + 1 
4f0a : a5 1d __ LDA ACCU + 2 
4f0c : e5 05 __ SBC WORK + 2 
4f0e : 85 1d __ STA ACCU + 2 
4f10 : b0 19 __ BCS $4f2b ; (faddsub + 201)
4f12 : 38 __ __ SEC
4f13 : a9 00 __ LDA #$00
4f15 : e5 1b __ SBC ACCU + 0 
4f17 : 85 1b __ STA ACCU + 0 
4f19 : a9 00 __ LDA #$00
4f1b : e5 1c __ SBC ACCU + 1 
4f1d : 85 1c __ STA ACCU + 1 
4f1f : a9 00 __ LDA #$00
4f21 : e5 1d __ SBC ACCU + 2 
4f23 : 85 1d __ STA ACCU + 2 
4f25 : a5 1e __ LDA ACCU + 3 
4f27 : 49 80 __ EOR #$80
4f29 : 85 1e __ STA ACCU + 3 
4f2b : a5 1d __ LDA ACCU + 2 
4f2d : 30 ba __ BMI $4ee9 ; (faddsub + 135)
4f2f : 05 1c __ ORA ACCU + 1 
4f31 : 05 1b __ ORA ACCU + 0 
4f33 : f0 0f __ BEQ $4f44 ; (faddsub + 226)
4f35 : c6 07 __ DEC WORK + 4 
4f37 : f0 0b __ BEQ $4f44 ; (faddsub + 226)
4f39 : 06 1b __ ASL ACCU + 0 
4f3b : 26 1c __ ROL ACCU + 1 
4f3d : 26 1d __ ROL ACCU + 2 
4f3f : 10 f4 __ BPL $4f35 ; (faddsub + 211)
4f41 : 4c e9 4e JMP $4ee9 ; (faddsub + 135)
4f44 : a9 00 __ LDA #$00
4f46 : 85 1b __ STA ACCU + 0 
4f48 : 85 1c __ STA ACCU + 1 
4f4a : 85 1d __ STA ACCU + 2 
4f4c : 85 1e __ STA ACCU + 3 
4f4e : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
4f4f : a5 1b __ LDA ACCU + 0 
4f51 : 05 1c __ ORA ACCU + 1 
4f53 : 05 1d __ ORA ACCU + 2 
4f55 : f0 0e __ BEQ $4f65 ; (crt_fmul + 22)
4f57 : a5 03 __ LDA WORK + 0 
4f59 : 05 04 __ ORA WORK + 1 
4f5b : 05 05 __ ORA WORK + 2 
4f5d : d0 09 __ BNE $4f68 ; (crt_fmul + 25)
4f5f : 85 1b __ STA ACCU + 0 
4f61 : 85 1c __ STA ACCU + 1 
4f63 : 85 1d __ STA ACCU + 2 
4f65 : 85 1e __ STA ACCU + 3 
4f67 : 60 __ __ RTS
4f68 : a5 1e __ LDA ACCU + 3 
4f6a : 45 06 __ EOR WORK + 3 
4f6c : 29 80 __ AND #$80
4f6e : 85 1e __ STA ACCU + 3 
4f70 : a9 ff __ LDA #$ff
4f72 : c5 07 __ CMP WORK + 4 
4f74 : f0 42 __ BEQ $4fb8 ; (crt_fmul + 105)
4f76 : c5 08 __ CMP WORK + 5 
4f78 : f0 3e __ BEQ $4fb8 ; (crt_fmul + 105)
4f7a : a9 00 __ LDA #$00
4f7c : 85 09 __ STA WORK + 6 
4f7e : 85 0a __ STA WORK + 7 
4f80 : 85 0b __ STA WORK + 8 
4f82 : a4 1b __ LDY ACCU + 0 
4f84 : a5 03 __ LDA WORK + 0 
4f86 : d0 06 __ BNE $4f8e ; (crt_fmul + 63)
4f88 : a5 04 __ LDA WORK + 1 
4f8a : f0 0a __ BEQ $4f96 ; (crt_fmul + 71)
4f8c : d0 05 __ BNE $4f93 ; (crt_fmul + 68)
4f8e : 20 e9 4f JSR $4fe9 ; (crt_fmul8 + 0)
4f91 : a5 04 __ LDA WORK + 1 
4f93 : 20 e9 4f JSR $4fe9 ; (crt_fmul8 + 0)
4f96 : a5 05 __ LDA WORK + 2 
4f98 : 20 e9 4f JSR $4fe9 ; (crt_fmul8 + 0)
4f9b : 38 __ __ SEC
4f9c : a5 0b __ LDA WORK + 8 
4f9e : 30 06 __ BMI $4fa6 ; (crt_fmul + 87)
4fa0 : 06 09 __ ASL WORK + 6 
4fa2 : 26 0a __ ROL WORK + 7 
4fa4 : 2a __ __ ROL
4fa5 : 18 __ __ CLC
4fa6 : 29 7f __ AND #$7f
4fa8 : 85 0b __ STA WORK + 8 
4faa : a5 07 __ LDA WORK + 4 
4fac : 65 08 __ ADC WORK + 5 
4fae : 90 19 __ BCC $4fc9 ; (crt_fmul + 122)
4fb0 : e9 7f __ SBC #$7f
4fb2 : b0 04 __ BCS $4fb8 ; (crt_fmul + 105)
4fb4 : c9 ff __ CMP #$ff
4fb6 : d0 15 __ BNE $4fcd ; (crt_fmul + 126)
4fb8 : a5 1e __ LDA ACCU + 3 
4fba : 09 7f __ ORA #$7f
4fbc : 85 1e __ STA ACCU + 3 
4fbe : a9 80 __ LDA #$80
4fc0 : 85 1d __ STA ACCU + 2 
4fc2 : a9 00 __ LDA #$00
4fc4 : 85 1b __ STA ACCU + 0 
4fc6 : 85 1c __ STA ACCU + 1 
4fc8 : 60 __ __ RTS
4fc9 : e9 7e __ SBC #$7e
4fcb : 90 15 __ BCC $4fe2 ; (crt_fmul + 147)
4fcd : 4a __ __ LSR
4fce : 05 1e __ ORA ACCU + 3 
4fd0 : 85 1e __ STA ACCU + 3 
4fd2 : a9 00 __ LDA #$00
4fd4 : 6a __ __ ROR
4fd5 : 05 0b __ ORA WORK + 8 
4fd7 : 85 1d __ STA ACCU + 2 
4fd9 : a5 0a __ LDA WORK + 7 
4fdb : 85 1c __ STA ACCU + 1 
4fdd : a5 09 __ LDA WORK + 6 
4fdf : 85 1b __ STA ACCU + 0 
4fe1 : 60 __ __ RTS
4fe2 : a9 00 __ LDA #$00
4fe4 : 85 1e __ STA ACCU + 3 
4fe6 : f0 d8 __ BEQ $4fc0 ; (crt_fmul + 113)
4fe8 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
4fe9 : 38 __ __ SEC
4fea : 6a __ __ ROR
4feb : 90 1e __ BCC $500b ; (crt_fmul8 + 34)
4fed : aa __ __ TAX
4fee : 18 __ __ CLC
4fef : 98 __ __ TYA
4ff0 : 65 09 __ ADC WORK + 6 
4ff2 : 85 09 __ STA WORK + 6 
4ff4 : a5 0a __ LDA WORK + 7 
4ff6 : 65 1c __ ADC ACCU + 1 
4ff8 : 85 0a __ STA WORK + 7 
4ffa : a5 0b __ LDA WORK + 8 
4ffc : 65 1d __ ADC ACCU + 2 
4ffe : 6a __ __ ROR
4fff : 85 0b __ STA WORK + 8 
5001 : 8a __ __ TXA
5002 : 66 0a __ ROR WORK + 7 
5004 : 66 09 __ ROR WORK + 6 
5006 : 4a __ __ LSR
5007 : f0 0d __ BEQ $5016 ; (crt_fmul8 + 45)
5009 : b0 e2 __ BCS $4fed ; (crt_fmul8 + 4)
500b : 66 0b __ ROR WORK + 8 
500d : 66 0a __ ROR WORK + 7 
500f : 66 09 __ ROR WORK + 6 
5011 : 4a __ __ LSR
5012 : 90 f7 __ BCC $500b ; (crt_fmul8 + 34)
5014 : d0 d7 __ BNE $4fed ; (crt_fmul8 + 4)
5016 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
5017 : a5 1b __ LDA ACCU + 0 
5019 : 05 1c __ ORA ACCU + 1 
501b : 05 1d __ ORA ACCU + 2 
501d : d0 03 __ BNE $5022 ; (crt_fdiv + 11)
501f : 85 1e __ STA ACCU + 3 
5021 : 60 __ __ RTS
5022 : a5 1e __ LDA ACCU + 3 
5024 : 45 06 __ EOR WORK + 3 
5026 : 29 80 __ AND #$80
5028 : 85 1e __ STA ACCU + 3 
502a : a5 08 __ LDA WORK + 5 
502c : f0 62 __ BEQ $5090 ; (crt_fdiv + 121)
502e : a5 07 __ LDA WORK + 4 
5030 : c9 ff __ CMP #$ff
5032 : f0 5c __ BEQ $5090 ; (crt_fdiv + 121)
5034 : a9 00 __ LDA #$00
5036 : 85 09 __ STA WORK + 6 
5038 : 85 0a __ STA WORK + 7 
503a : 85 0b __ STA WORK + 8 
503c : a2 18 __ LDX #$18
503e : a5 1b __ LDA ACCU + 0 
5040 : c5 03 __ CMP WORK + 0 
5042 : a5 1c __ LDA ACCU + 1 
5044 : e5 04 __ SBC WORK + 1 
5046 : a5 1d __ LDA ACCU + 2 
5048 : e5 05 __ SBC WORK + 2 
504a : 90 13 __ BCC $505f ; (crt_fdiv + 72)
504c : a5 1b __ LDA ACCU + 0 
504e : e5 03 __ SBC WORK + 0 
5050 : 85 1b __ STA ACCU + 0 
5052 : a5 1c __ LDA ACCU + 1 
5054 : e5 04 __ SBC WORK + 1 
5056 : 85 1c __ STA ACCU + 1 
5058 : a5 1d __ LDA ACCU + 2 
505a : e5 05 __ SBC WORK + 2 
505c : 85 1d __ STA ACCU + 2 
505e : 38 __ __ SEC
505f : 26 09 __ ROL WORK + 6 
5061 : 26 0a __ ROL WORK + 7 
5063 : 26 0b __ ROL WORK + 8 
5065 : ca __ __ DEX
5066 : f0 0a __ BEQ $5072 ; (crt_fdiv + 91)
5068 : 06 1b __ ASL ACCU + 0 
506a : 26 1c __ ROL ACCU + 1 
506c : 26 1d __ ROL ACCU + 2 
506e : b0 dc __ BCS $504c ; (crt_fdiv + 53)
5070 : 90 cc __ BCC $503e ; (crt_fdiv + 39)
5072 : 38 __ __ SEC
5073 : a5 0b __ LDA WORK + 8 
5075 : 30 06 __ BMI $507d ; (crt_fdiv + 102)
5077 : 06 09 __ ASL WORK + 6 
5079 : 26 0a __ ROL WORK + 7 
507b : 2a __ __ ROL
507c : 18 __ __ CLC
507d : 29 7f __ AND #$7f
507f : 85 0b __ STA WORK + 8 
5081 : a5 07 __ LDA WORK + 4 
5083 : e5 08 __ SBC WORK + 5 
5085 : 90 1a __ BCC $50a1 ; (crt_fdiv + 138)
5087 : 18 __ __ CLC
5088 : 69 7f __ ADC #$7f
508a : b0 04 __ BCS $5090 ; (crt_fdiv + 121)
508c : c9 ff __ CMP #$ff
508e : d0 15 __ BNE $50a5 ; (crt_fdiv + 142)
5090 : a5 1e __ LDA ACCU + 3 
5092 : 09 7f __ ORA #$7f
5094 : 85 1e __ STA ACCU + 3 
5096 : a9 80 __ LDA #$80
5098 : 85 1d __ STA ACCU + 2 
509a : a9 00 __ LDA #$00
509c : 85 1c __ STA ACCU + 1 
509e : 85 1b __ STA ACCU + 0 
50a0 : 60 __ __ RTS
50a1 : 69 7f __ ADC #$7f
50a3 : 90 15 __ BCC $50ba ; (crt_fdiv + 163)
50a5 : 4a __ __ LSR
50a6 : 05 1e __ ORA ACCU + 3 
50a8 : 85 1e __ STA ACCU + 3 
50aa : a9 00 __ LDA #$00
50ac : 6a __ __ ROR
50ad : 05 0b __ ORA WORK + 8 
50af : 85 1d __ STA ACCU + 2 
50b1 : a5 0a __ LDA WORK + 7 
50b3 : 85 1c __ STA ACCU + 1 
50b5 : a5 09 __ LDA WORK + 6 
50b7 : 85 1b __ STA ACCU + 0 
50b9 : 60 __ __ RTS
50ba : a9 00 __ LDA #$00
50bc : 85 1e __ STA ACCU + 3 
50be : 85 1d __ STA ACCU + 2 
50c0 : 85 1c __ STA ACCU + 1 
50c2 : 85 1b __ STA ACCU + 0 
50c4 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
50c5 : 24 1e __ BIT ACCU + 3 
50c7 : 10 13 __ BPL $50dc ; (fround + 23)
50c9 : 30 6b __ BMI $5136 ; (fround + 113)
50cb : 24 1e __ BIT ACCU + 3 
50cd : 30 0d __ BMI $50dc ; (fround + 23)
50cf : 10 65 __ BPL $5136 ; (fround + 113)
50d1 : a9 00 __ LDA #$00
50d3 : 85 1b __ STA ACCU + 0 
50d5 : 85 1c __ STA ACCU + 1 
50d7 : 85 1d __ STA ACCU + 2 
50d9 : 85 1e __ STA ACCU + 3 
50db : 60 __ __ RTS
50dc : a5 07 __ LDA WORK + 4 
50de : c9 7f __ CMP #$7f
50e0 : 90 ef __ BCC $50d1 ; (fround + 12)
50e2 : c9 87 __ CMP #$87
50e4 : 90 16 __ BCC $50fc ; (fround + 55)
50e6 : c9 8f __ CMP #$8f
50e8 : 90 26 __ BCC $5110 ; (fround + 75)
50ea : c9 97 __ CMP #$97
50ec : b0 34 __ BCS $5122 ; (fround + 93)
50ee : 38 __ __ SEC
50ef : e9 8f __ SBC #$8f
50f1 : aa __ __ TAX
50f2 : a5 1b __ LDA ACCU + 0 
50f4 : 3d d3 56 AND $56d3,x ; (ubitmask[0] + 0)
50f7 : 85 1b __ STA ACCU + 0 
50f9 : 4c 22 51 JMP $5122 ; (fround + 93)
50fc : 38 __ __ SEC
50fd : e9 7f __ SBC #$7f
50ff : aa __ __ TAX
5100 : a5 1d __ LDA ACCU + 2 
5102 : 3d d3 56 AND $56d3,x ; (ubitmask[0] + 0)
5105 : 85 1d __ STA ACCU + 2 
5107 : a9 00 __ LDA #$00
5109 : 85 1b __ STA ACCU + 0 
510b : 85 1c __ STA ACCU + 1 
510d : 4c 22 51 JMP $5122 ; (fround + 93)
5110 : 38 __ __ SEC
5111 : e9 87 __ SBC #$87
5113 : aa __ __ TAX
5114 : a5 1c __ LDA ACCU + 1 
5116 : 3d d3 56 AND $56d3,x ; (ubitmask[0] + 0)
5119 : 85 1c __ STA ACCU + 1 
511b : a9 00 __ LDA #$00
511d : 85 1b __ STA ACCU + 0 
511f : 4c 22 51 JMP $5122 ; (fround + 93)
5122 : 4c 52 4e JMP $4e52 ; (freg + 53)
5125 : a9 7f __ LDA #$7f
5127 : 85 07 __ STA WORK + 4 
5129 : a9 00 __ LDA #$00
512b : 85 1b __ STA ACCU + 0 
512d : 85 1c __ STA ACCU + 1 
512f : a9 80 __ LDA #$80
5131 : 85 1d __ STA ACCU + 2 
5133 : 4c 52 4e JMP $4e52 ; (freg + 53)
5136 : a5 1b __ LDA ACCU + 0 
5138 : 05 1c __ ORA ACCU + 1 
513a : 05 1d __ ORA ACCU + 2 
513c : f0 93 __ BEQ $50d1 ; (fround + 12)
513e : a5 07 __ LDA WORK + 4 
5140 : c9 7f __ CMP #$7f
5142 : 90 e1 __ BCC $5125 ; (fround + 96)
5144 : c9 87 __ CMP #$87
5146 : 90 2e __ BCC $5176 ; (fround + 177)
5148 : c9 8f __ CMP #$8f
514a : 90 4c __ BCC $5198 ; (fround + 211)
514c : c9 97 __ CMP #$97
514e : b0 6c __ BCS $51bc ; (fround + 247)
5150 : 38 __ __ SEC
5151 : e9 8f __ SBC #$8f
5153 : aa __ __ TAX
5154 : 18 __ __ CLC
5155 : bd d3 56 LDA $56d3,x ; (ubitmask[0] + 0)
5158 : 49 ff __ EOR #$ff
515a : 65 1b __ ADC ACCU + 0 
515c : 85 1b __ STA ACCU + 0 
515e : a9 00 __ LDA #$00
5160 : 65 1c __ ADC ACCU + 1 
5162 : 85 1c __ STA ACCU + 1 
5164 : a9 00 __ LDA #$00
5166 : 65 1d __ ADC ACCU + 2 
5168 : 90 07 __ BCC $5171 ; (fround + 172)
516a : 6a __ __ ROR
516b : 66 1c __ ROR ACCU + 1 
516d : 66 1b __ ROR ACCU + 0 
516f : e6 07 __ INC WORK + 4 
5171 : 85 1d __ STA ACCU + 2 
5173 : 4c dc 50 JMP $50dc ; (fround + 23)
5176 : 38 __ __ SEC
5177 : e9 7f __ SBC #$7f
5179 : aa __ __ TAX
517a : 18 __ __ CLC
517b : a9 ff __ LDA #$ff
517d : 65 1b __ ADC ACCU + 0 
517f : a9 ff __ LDA #$ff
5181 : 65 1c __ ADC ACCU + 1 
5183 : bd d3 56 LDA $56d3,x ; (ubitmask[0] + 0)
5186 : 49 ff __ EOR #$ff
5188 : 65 1d __ ADC ACCU + 2 
518a : 90 07 __ BCC $5193 ; (fround + 206)
518c : 6a __ __ ROR
518d : 66 1c __ ROR ACCU + 1 
518f : 66 1b __ ROR ACCU + 0 
5191 : e6 07 __ INC WORK + 4 
5193 : 85 1d __ STA ACCU + 2 
5195 : 4c dc 50 JMP $50dc ; (fround + 23)
5198 : 38 __ __ SEC
5199 : e9 87 __ SBC #$87
519b : aa __ __ TAX
519c : 18 __ __ CLC
519d : a9 ff __ LDA #$ff
519f : 65 1b __ ADC ACCU + 0 
51a1 : bd d3 56 LDA $56d3,x ; (ubitmask[0] + 0)
51a4 : 49 ff __ EOR #$ff
51a6 : 65 1c __ ADC ACCU + 1 
51a8 : 85 1c __ STA ACCU + 1 
51aa : a9 00 __ LDA #$00
51ac : 65 1d __ ADC ACCU + 2 
51ae : 90 07 __ BCC $51b7 ; (fround + 242)
51b0 : 6a __ __ ROR
51b1 : 66 1c __ ROR ACCU + 1 
51b3 : 66 1b __ ROR ACCU + 0 
51b5 : e6 07 __ INC WORK + 4 
51b7 : 85 1d __ STA ACCU + 2 
51b9 : 4c dc 50 JMP $50dc ; (fround + 23)
51bc : 4c 52 4e JMP $4e52 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
51bf : 20 41 4e JSR $4e41 ; (freg + 36)
51c2 : a5 07 __ LDA WORK + 4 
51c4 : c9 7f __ CMP #$7f
51c6 : b0 07 __ BCS $51cf ; (f32_to_i16 + 16)
51c8 : a9 00 __ LDA #$00
51ca : 85 1b __ STA ACCU + 0 
51cc : 85 1c __ STA ACCU + 1 
51ce : 60 __ __ RTS
51cf : e9 8e __ SBC #$8e
51d1 : 90 16 __ BCC $51e9 ; (f32_to_i16 + 42)
51d3 : 24 1e __ BIT ACCU + 3 
51d5 : 30 09 __ BMI $51e0 ; (f32_to_i16 + 33)
51d7 : a9 ff __ LDA #$ff
51d9 : 85 1b __ STA ACCU + 0 
51db : a9 7f __ LDA #$7f
51dd : 85 1c __ STA ACCU + 1 
51df : 60 __ __ RTS
51e0 : a9 00 __ LDA #$00
51e2 : 85 1b __ STA ACCU + 0 
51e4 : a9 80 __ LDA #$80
51e6 : 85 1c __ STA ACCU + 1 
51e8 : 60 __ __ RTS
51e9 : aa __ __ TAX
51ea : a5 1c __ LDA ACCU + 1 
51ec : 46 1d __ LSR ACCU + 2 
51ee : 6a __ __ ROR
51ef : e8 __ __ INX
51f0 : d0 fa __ BNE $51ec ; (f32_to_i16 + 45)
51f2 : 24 1e __ BIT ACCU + 3 
51f4 : 10 0e __ BPL $5204 ; (f32_to_i16 + 69)
51f6 : 38 __ __ SEC
51f7 : 49 ff __ EOR #$ff
51f9 : 69 00 __ ADC #$00
51fb : 85 1b __ STA ACCU + 0 
51fd : a9 00 __ LDA #$00
51ff : e5 1d __ SBC ACCU + 2 
5201 : 85 1c __ STA ACCU + 1 
5203 : 60 __ __ RTS
5204 : 85 1b __ STA ACCU + 0 
5206 : a5 1d __ LDA ACCU + 2 
5208 : 85 1c __ STA ACCU + 1 
520a : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
520b : 24 1c __ BIT ACCU + 1 
520d : 30 03 __ BMI $5212 ; (sint16_to_float + 7)
520f : 4c 29 52 JMP $5229 ; (uint16_to_float + 0)
5212 : 38 __ __ SEC
5213 : a9 00 __ LDA #$00
5215 : e5 1b __ SBC ACCU + 0 
5217 : 85 1b __ STA ACCU + 0 
5219 : a9 00 __ LDA #$00
521b : e5 1c __ SBC ACCU + 1 
521d : 85 1c __ STA ACCU + 1 
521f : 20 29 52 JSR $5229 ; (uint16_to_float + 0)
5222 : a5 1e __ LDA ACCU + 3 
5224 : 09 80 __ ORA #$80
5226 : 85 1e __ STA ACCU + 3 
5228 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
5229 : a5 1b __ LDA ACCU + 0 
522b : 05 1c __ ORA ACCU + 1 
522d : d0 05 __ BNE $5234 ; (uint16_to_float + 11)
522f : 85 1d __ STA ACCU + 2 
5231 : 85 1e __ STA ACCU + 3 
5233 : 60 __ __ RTS
5234 : a2 8e __ LDX #$8e
5236 : a5 1c __ LDA ACCU + 1 
5238 : 30 06 __ BMI $5240 ; (uint16_to_float + 23)
523a : ca __ __ DEX
523b : 06 1b __ ASL ACCU + 0 
523d : 2a __ __ ROL
523e : 10 fa __ BPL $523a ; (uint16_to_float + 17)
5240 : 0a __ __ ASL
5241 : 85 1d __ STA ACCU + 2 
5243 : a5 1b __ LDA ACCU + 0 
5245 : 85 1c __ STA ACCU + 1 
5247 : 8a __ __ TXA
5248 : 4a __ __ LSR
5249 : 85 1e __ STA ACCU + 3 
524b : a9 00 __ LDA #$00
524d : 85 1b __ STA ACCU + 0 
524f : 66 1d __ ROR ACCU + 2 
5251 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fcmp: ; crt_fcmp
5252 : a5 1e __ LDA ACCU + 3 
5254 : 45 06 __ EOR WORK + 3 
5256 : 10 1e __ BPL $5276 ; (crt_fcmp + 36)
5258 : a5 1e __ LDA ACCU + 3 
525a : 29 7f __ AND #$7f
525c : 05 1d __ ORA ACCU + 2 
525e : 05 1c __ ORA ACCU + 1 
5260 : 05 1b __ ORA ACCU + 0 
5262 : d0 0c __ BNE $5270 ; (crt_fcmp + 30)
5264 : a5 06 __ LDA WORK + 3 
5266 : 29 7f __ AND #$7f
5268 : 05 05 __ ORA WORK + 2 
526a : 05 04 __ ORA WORK + 1 
526c : 05 03 __ ORA WORK + 0 
526e : f0 1e __ BEQ $528e ; (crt_fcmp + 60)
5270 : a5 1e __ LDA ACCU + 3 
5272 : 30 23 __ BMI $5297 ; (crt_fcmp + 69)
5274 : 10 28 __ BPL $529e ; (crt_fcmp + 76)
5276 : a5 1e __ LDA ACCU + 3 
5278 : c5 06 __ CMP WORK + 3 
527a : d0 15 __ BNE $5291 ; (crt_fcmp + 63)
527c : a5 1d __ LDA ACCU + 2 
527e : c5 05 __ CMP WORK + 2 
5280 : d0 0f __ BNE $5291 ; (crt_fcmp + 63)
5282 : a5 1c __ LDA ACCU + 1 
5284 : c5 04 __ CMP WORK + 1 
5286 : d0 09 __ BNE $5291 ; (crt_fcmp + 63)
5288 : a5 1b __ LDA ACCU + 0 
528a : c5 03 __ CMP WORK + 0 
528c : d0 03 __ BNE $5291 ; (crt_fcmp + 63)
528e : a9 00 __ LDA #$00
5290 : 60 __ __ RTS
5291 : b0 07 __ BCS $529a ; (crt_fcmp + 72)
5293 : 24 1e __ BIT ACCU + 3 
5295 : 30 07 __ BMI $529e ; (crt_fcmp + 76)
5297 : a9 01 __ LDA #$01
5299 : 60 __ __ RTS
529a : 24 1e __ BIT ACCU + 3 
529c : 30 f9 __ BMI $5297 ; (crt_fcmp + 69)
529e : a9 ff __ LDA #$ff
52a0 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
52a1 : a5 04 __ LDA WORK + 1 
52a3 : 05 05 __ ORA WORK + 2 
52a5 : 05 06 __ ORA WORK + 3 
52a7 : d0 05 __ BNE $52ae ; (mul32 + 13)
52a9 : a5 03 __ LDA WORK + 0 
52ab : 4c e7 4d JMP $4de7 ; (mul32by8 + 0)
52ae : a0 00 __ LDY #$00
52b0 : 84 07 __ STY WORK + 4 
52b2 : 84 08 __ STY WORK + 5 
52b4 : 98 __ __ TYA
52b5 : 38 __ __ SEC
52b6 : 66 03 __ ROR WORK + 0 
52b8 : 90 15 __ BCC $52cf ; (mul32 + 46)
52ba : aa __ __ TAX
52bb : 18 __ __ CLC
52bc : a5 07 __ LDA WORK + 4 
52be : 65 1b __ ADC ACCU + 0 
52c0 : 85 07 __ STA WORK + 4 
52c2 : a5 08 __ LDA WORK + 5 
52c4 : 65 1c __ ADC ACCU + 1 
52c6 : 85 08 __ STA WORK + 5 
52c8 : 98 __ __ TYA
52c9 : 65 1d __ ADC ACCU + 2 
52cb : a8 __ __ TAY
52cc : 8a __ __ TXA
52cd : 65 1e __ ADC ACCU + 3 
52cf : 46 04 __ LSR WORK + 1 
52d1 : 90 0f __ BCC $52e2 ; (mul32 + 65)
52d3 : aa __ __ TAX
52d4 : 18 __ __ CLC
52d5 : a5 08 __ LDA WORK + 5 
52d7 : 65 1b __ ADC ACCU + 0 
52d9 : 85 08 __ STA WORK + 5 
52db : 98 __ __ TYA
52dc : 65 1c __ ADC ACCU + 1 
52de : a8 __ __ TAY
52df : 8a __ __ TXA
52e0 : 65 1d __ ADC ACCU + 2 
52e2 : 46 05 __ LSR WORK + 2 
52e4 : 90 09 __ BCC $52ef ; (mul32 + 78)
52e6 : aa __ __ TAX
52e7 : 18 __ __ CLC
52e8 : 98 __ __ TYA
52e9 : 65 1b __ ADC ACCU + 0 
52eb : a8 __ __ TAY
52ec : 8a __ __ TXA
52ed : 65 1c __ ADC ACCU + 1 
52ef : 46 06 __ LSR WORK + 3 
52f1 : 90 03 __ BCC $52f6 ; (mul32 + 85)
52f3 : 18 __ __ CLC
52f4 : 65 1b __ ADC ACCU + 0 
52f6 : 06 1b __ ASL ACCU + 0 
52f8 : 26 1c __ ROL ACCU + 1 
52fa : 26 1d __ ROL ACCU + 2 
52fc : 26 1e __ ROL ACCU + 3 
52fe : 46 03 __ LSR WORK + 0 
5300 : 90 cd __ BCC $52cf ; (mul32 + 46)
5302 : d0 b6 __ BNE $52ba ; (mul32 + 25)
5304 : 84 09 __ STY WORK + 6 
5306 : 85 0a __ STA WORK + 7 
5308 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
5309 : 24 1e __ BIT ACCU + 3 
530b : 10 0d __ BPL $531a ; (divs32 + 17)
530d : 20 27 53 JSR $5327 ; (negaccu32 + 0)
5310 : 24 06 __ BIT WORK + 3 
5312 : 10 0d __ BPL $5321 ; (divs32 + 24)
5314 : 20 41 53 JSR $5341 ; (negtmp32 + 0)
5317 : 4c 5b 53 JMP $535b ; (divmod32 + 0)
531a : 24 06 __ BIT WORK + 3 
531c : 10 f9 __ BPL $5317 ; (divs32 + 14)
531e : 20 41 53 JSR $5341 ; (negtmp32 + 0)
5321 : 20 5b 53 JSR $535b ; (divmod32 + 0)
5324 : 4c 27 53 JMP $5327 ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
5327 : 38 __ __ SEC
5328 : a9 00 __ LDA #$00
532a : e5 1b __ SBC ACCU + 0 
532c : 85 1b __ STA ACCU + 0 
532e : a9 00 __ LDA #$00
5330 : e5 1c __ SBC ACCU + 1 
5332 : 85 1c __ STA ACCU + 1 
5334 : a9 00 __ LDA #$00
5336 : e5 1d __ SBC ACCU + 2 
5338 : 85 1d __ STA ACCU + 2 
533a : a9 00 __ LDA #$00
533c : e5 1e __ SBC ACCU + 3 
533e : 85 1e __ STA ACCU + 3 
5340 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
5341 : 38 __ __ SEC
5342 : a9 00 __ LDA #$00
5344 : e5 03 __ SBC WORK + 0 
5346 : 85 03 __ STA WORK + 0 
5348 : a9 00 __ LDA #$00
534a : e5 04 __ SBC WORK + 1 
534c : 85 04 __ STA WORK + 1 
534e : a9 00 __ LDA #$00
5350 : e5 05 __ SBC WORK + 2 
5352 : 85 05 __ STA WORK + 2 
5354 : a9 00 __ LDA #$00
5356 : e5 06 __ SBC WORK + 3 
5358 : 85 06 __ STA WORK + 3 
535a : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
535b : 84 02 __ STY $02 
535d : a0 20 __ LDY #$20
535f : a9 00 __ LDA #$00
5361 : 85 07 __ STA WORK + 4 
5363 : 85 08 __ STA WORK + 5 
5365 : 85 09 __ STA WORK + 6 
5367 : 85 0a __ STA WORK + 7 
5369 : a5 05 __ LDA WORK + 2 
536b : 05 06 __ ORA WORK + 3 
536d : d0 78 __ BNE $53e7 ; (divmod32 + 140)
536f : a5 04 __ LDA WORK + 1 
5371 : d0 27 __ BNE $539a ; (divmod32 + 63)
5373 : 18 __ __ CLC
5374 : 26 1b __ ROL ACCU + 0 
5376 : 26 1c __ ROL ACCU + 1 
5378 : 26 1d __ ROL ACCU + 2 
537a : 26 1e __ ROL ACCU + 3 
537c : 2a __ __ ROL
537d : 90 05 __ BCC $5384 ; (divmod32 + 41)
537f : e5 03 __ SBC WORK + 0 
5381 : 38 __ __ SEC
5382 : b0 06 __ BCS $538a ; (divmod32 + 47)
5384 : c5 03 __ CMP WORK + 0 
5386 : 90 02 __ BCC $538a ; (divmod32 + 47)
5388 : e5 03 __ SBC WORK + 0 
538a : 88 __ __ DEY
538b : d0 e7 __ BNE $5374 ; (divmod32 + 25)
538d : 85 07 __ STA WORK + 4 
538f : 26 1b __ ROL ACCU + 0 
5391 : 26 1c __ ROL ACCU + 1 
5393 : 26 1d __ ROL ACCU + 2 
5395 : 26 1e __ ROL ACCU + 3 
5397 : a4 02 __ LDY $02 
5399 : 60 __ __ RTS
539a : a5 1e __ LDA ACCU + 3 
539c : d0 10 __ BNE $53ae ; (divmod32 + 83)
539e : a6 1d __ LDX ACCU + 2 
53a0 : 86 1e __ STX ACCU + 3 
53a2 : a6 1c __ LDX ACCU + 1 
53a4 : 86 1d __ STX ACCU + 2 
53a6 : a6 1b __ LDX ACCU + 0 
53a8 : 86 1c __ STX ACCU + 1 
53aa : 85 1b __ STA ACCU + 0 
53ac : a0 18 __ LDY #$18
53ae : 18 __ __ CLC
53af : 26 1b __ ROL ACCU + 0 
53b1 : 26 1c __ ROL ACCU + 1 
53b3 : 26 1d __ ROL ACCU + 2 
53b5 : 26 1e __ ROL ACCU + 3 
53b7 : 26 07 __ ROL WORK + 4 
53b9 : 26 08 __ ROL WORK + 5 
53bb : 90 0c __ BCC $53c9 ; (divmod32 + 110)
53bd : a5 07 __ LDA WORK + 4 
53bf : e5 03 __ SBC WORK + 0 
53c1 : aa __ __ TAX
53c2 : a5 08 __ LDA WORK + 5 
53c4 : e5 04 __ SBC WORK + 1 
53c6 : 38 __ __ SEC
53c7 : b0 0c __ BCS $53d5 ; (divmod32 + 122)
53c9 : 38 __ __ SEC
53ca : a5 07 __ LDA WORK + 4 
53cc : e5 03 __ SBC WORK + 0 
53ce : aa __ __ TAX
53cf : a5 08 __ LDA WORK + 5 
53d1 : e5 04 __ SBC WORK + 1 
53d3 : 90 04 __ BCC $53d9 ; (divmod32 + 126)
53d5 : 86 07 __ STX WORK + 4 
53d7 : 85 08 __ STA WORK + 5 
53d9 : 88 __ __ DEY
53da : d0 d3 __ BNE $53af ; (divmod32 + 84)
53dc : 26 1b __ ROL ACCU + 0 
53de : 26 1c __ ROL ACCU + 1 
53e0 : 26 1d __ ROL ACCU + 2 
53e2 : 26 1e __ ROL ACCU + 3 
53e4 : a4 02 __ LDY $02 
53e6 : 60 __ __ RTS
53e7 : a0 10 __ LDY #$10
53e9 : a5 1e __ LDA ACCU + 3 
53eb : 85 08 __ STA WORK + 5 
53ed : a5 1d __ LDA ACCU + 2 
53ef : 85 07 __ STA WORK + 4 
53f1 : a9 00 __ LDA #$00
53f3 : 85 1d __ STA ACCU + 2 
53f5 : 85 1e __ STA ACCU + 3 
53f7 : 18 __ __ CLC
53f8 : 26 1b __ ROL ACCU + 0 
53fa : 26 1c __ ROL ACCU + 1 
53fc : 26 07 __ ROL WORK + 4 
53fe : 26 08 __ ROL WORK + 5 
5400 : 26 09 __ ROL WORK + 6 
5402 : 26 0a __ ROL WORK + 7 
5404 : a5 07 __ LDA WORK + 4 
5406 : c5 03 __ CMP WORK + 0 
5408 : a5 08 __ LDA WORK + 5 
540a : e5 04 __ SBC WORK + 1 
540c : a5 09 __ LDA WORK + 6 
540e : e5 05 __ SBC WORK + 2 
5410 : aa __ __ TAX
5411 : a5 0a __ LDA WORK + 7 
5413 : e5 06 __ SBC WORK + 3 
5415 : 90 11 __ BCC $5428 ; (divmod32 + 205)
5417 : 86 09 __ STX WORK + 6 
5419 : 85 0a __ STA WORK + 7 
541b : a5 07 __ LDA WORK + 4 
541d : e5 03 __ SBC WORK + 0 
541f : 85 07 __ STA WORK + 4 
5421 : a5 08 __ LDA WORK + 5 
5423 : e5 04 __ SBC WORK + 1 
5425 : 85 08 __ STA WORK + 5 
5427 : 38 __ __ SEC
5428 : 88 __ __ DEY
5429 : d0 cd __ BNE $53f8 ; (divmod32 + 157)
542b : 26 1b __ ROL ACCU + 0 
542d : 26 1c __ ROL ACCU + 1 
542f : a4 02 __ LDY $02 
5431 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
5432 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
Screen:
5433 : __ __ __ BYT 00 e0 00 00 28 19 40 01                         : ....(.@.
--------------------------------------------------------------------
SRect:
543b : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
TinyFont:
5443 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
5453 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
5463 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
5473 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
5483 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
5493 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
54a3 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
54b3 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
54c3 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
54d3 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
54e3 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
54f3 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
5503 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
5513 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
5523 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
5533 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
5543 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
5553 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
5563 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
5573 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
5583 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
5593 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
55a3 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
55b3 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
55c3 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
55d3 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
55e3 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
55f3 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
5603 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
5613 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
5623 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
5633 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
5643 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
5653 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
5663 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
566e : __ __ __ BYT 38 57 00 00 28 01 40 01                         : 8W..(.@.
--------------------------------------------------------------------
lmask:
5676 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
567e : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
5686 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
NineShadesOfGrey:
568a : __ __ __ BYT 00 00 00 00 00 00 00 00 22 00 88 00 22 00 88 00 : ........"..."...
569a : __ __ __ BYT 22 88 22 88 22 88 22 88 88 55 22 55 88 55 22 55 : "."."."..U"U.U"U
56aa : __ __ __ BYT aa 55 aa 55 aa 55 aa 55 bb 55 ee 55 bb 55 ee 55 : .U.U.U.U.U.U.U.U
56ba : __ __ __ BYT dd 77 dd 77 dd 77 dd 77 ff ee ff bb ff ee ff bb : .w.w.w.w........
56ca : __ __ __ BYT ff ff ff ff ff ff ff ff                         : ........
--------------------------------------------------------------------
giocharmap:
56d2 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
ubitmask:
56d3 : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
tworks:
56db : __ __ __ BSS	8
--------------------------------------------------------------------
vlight:
56e3 : __ __ __ BSS	12
--------------------------------------------------------------------
bitshift:
5700 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
5710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
5720 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
5730 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
tbuffer:
5738 : __ __ __ BSS	320
--------------------------------------------------------------------
wmat:
5878 : __ __ __ BSS	64
--------------------------------------------------------------------
pmat:
58b8 : __ __ __ BSS	64
--------------------------------------------------------------------
BLIT_CODE:
5900 : __ __ __ BSS	224
--------------------------------------------------------------------
v:
59e0 : __ __ __ BSS	11532
--------------------------------------------------------------------
rmat:
8700 : __ __ __ BSS	64
--------------------------------------------------------------------
tmat:
8740 : __ __ __ BSS	64
--------------------------------------------------------------------
p:
8780 : __ __ __ BSS	3844
--------------------------------------------------------------------
z:
9684 : __ __ __ BSS	3844
--------------------------------------------------------------------
surfs:
a588 : __ __ __ BSS	5400
