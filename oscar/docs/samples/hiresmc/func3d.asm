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
080e : 8e 45 48 STX $4845 ; (spentry + 0)
0811 : a2 4b __ LDX #$4b
0813 : a0 80 __ LDY #$80
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 ae __ CPX #$ae
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
083b : a9 2e __ LDA #$2e
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
;  99, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/func3d.c"
.s1:
0a00 : a2 1f __ LDX #$1f
0a02 : b5 53 __ LDA T0 + 0,x 
0a04 : 9d 30 c7 STA $c730,x ; (main@stack + 0)
0a07 : ca __ __ DEX
0a08 : 10 f8 __ BPL $0a02 ; (main.s1 + 2)
0a0a : 38 __ __ SEC
0a0b : a5 23 __ LDA SP + 0 
0a0d : e9 06 __ SBC #$06
0a0f : 85 23 __ STA SP + 0 
0a11 : b0 02 __ BCS $0a15 ; (main.s4 + 0)
0a13 : c6 24 __ DEC SP + 1 
.s4:
0a15 : 20 55 13 JSR $1355 ; (init.s4 + 0)
0a18 : a9 78 __ LDA #$78
0a1a : 85 0d __ STA P0 
0a1c : a9 14 __ LDA #$14
0a1e : 85 0e __ STA P1 
0a20 : 20 18 23 JSR $2318 ; (strlen.s4 + 0)
0a23 : a9 00 __ LDA #$00
0a25 : 8d e7 c7 STA $c7e7 ; (sstack + 41)
0a28 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
0a2b : 8d e9 c7 STA $c7e9 ; (sstack + 43)
0a2e : 8d ea c7 STA $c7ea ; (sstack + 44)
0a31 : a9 78 __ LDA #$78
0a33 : 8d eb c7 STA $c7eb ; (sstack + 45)
0a36 : a9 14 __ LDA #$14
0a38 : 8d ec c7 STA $c7ec ; (sstack + 46)
0a3b : a5 1b __ LDA ACCU + 0 
0a3d : 8d ed c7 STA $c7ed ; (sstack + 47)
0a40 : a9 08 __ LDA #$08
0a42 : 8d ee c7 STA $c7ee ; (sstack + 48)
0a45 : a9 46 __ LDA #$46
0a47 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
0a4a : a9 48 __ LDA #$48
0a4c : 8d e4 c7 STA $c7e4 ; (sstack + 38)
0a4f : a9 4e __ LDA #$4e
0a51 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
0a54 : a9 48 __ LDA #$48
0a56 : 8d e6 c7 STA $c7e6 ; (sstack + 40)
0a59 : 20 8b 14 JSR $148b ; (bm_put_chars.s1 + 0)
0a5c : a9 ae __ LDA #$ae
0a5e : 85 0d __ STA P0 
0a60 : a9 4a __ LDA #$4a
0a62 : 85 0e __ STA P1 
0a64 : 20 34 23 JSR $2334 ; (mat4_ident.s4 + 0)
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
0aa7 : a9 c0 __ LDA #$c0
0aa9 : 8d be c7 STA $c7be ; (sstack + 0)
0aac : a9 4c __ LDA #$4c
0aae : 8d bf c7 STA $c7bf ; (sstack + 1)
0ab1 : 20 7f 23 JSR $237f ; (mat4_make_perspective.s1 + 0)
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
0aca : 20 1e 46 JSR $461e ; (sint16_to_float + 0)
0acd : a9 88 __ LDA #$88
0acf : 85 04 __ STA WORK + 1 
0ad1 : 85 05 __ STA WORK + 2 
0ad3 : a9 89 __ LDA #$89
0ad5 : 85 03 __ STA WORK + 0 
0ad7 : a9 3d __ LDA #$3d
0ad9 : 85 06 __ STA WORK + 3 
0adb : 20 44 42 JSR $4244 ; (freg + 20)
0ade : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0ae1 : a5 1b __ LDA ACCU + 0 
0ae3 : 85 5b __ STA T2 + 0 
0ae5 : a5 1c __ LDA ACCU + 1 
0ae7 : 85 5c __ STA T2 + 1 
0ae9 : a5 1d __ LDA ACCU + 2 
0aeb : 85 5d __ STA T2 + 2 
0aed : a5 1e __ LDA ACCU + 3 
0aef : 85 5e __ STA T2 + 3 
0af1 : a2 1b __ LDX #$1b
0af3 : 20 34 42 JSR $4234 ; (freg + 4)
0af6 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
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
0b15 : a9 4d __ LDA #$4d
0b17 : 85 72 __ STA T9 + 1 
.l6:
0b19 : a5 6f __ LDA T8 + 0 
0b1b : 85 1b __ STA ACCU + 0 
0b1d : a5 70 __ LDA T8 + 1 
0b1f : 85 1c __ STA ACCU + 1 
0b21 : 20 1e 46 JSR $461e ; (sint16_to_float + 0)
0b24 : a9 88 __ LDA #$88
0b26 : 85 04 __ STA WORK + 1 
0b28 : 85 05 __ STA WORK + 2 
0b2a : a9 89 __ LDA #$89
0b2c : 85 03 __ STA WORK + 0 
0b2e : a9 3d __ LDA #$3d
0b30 : 85 06 __ STA WORK + 3 
0b32 : 20 44 42 JSR $4244 ; (freg + 20)
0b35 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0b38 : a5 1b __ LDA ACCU + 0 
0b3a : 85 57 __ STA T1 + 0 
0b3c : a5 1c __ LDA ACCU + 1 
0b3e : 85 58 __ STA T1 + 1 
0b40 : a5 1d __ LDA ACCU + 2 
0b42 : 85 59 __ STA T1 + 2 
0b44 : a5 1e __ LDA ACCU + 3 
0b46 : 85 5a __ STA T1 + 3 
0b48 : a2 1b __ LDX #$1b
0b4a : 20 34 42 JSR $4234 ; (freg + 4)
0b4d : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0b50 : a2 5f __ LDX #$5f
0b52 : 20 34 42 JSR $4234 ; (freg + 4)
0b55 : 20 7b 42 JSR $427b ; (faddsub + 6)
0b58 : a5 1b __ LDA ACCU + 0 
0b5a : 85 0d __ STA P0 
0b5c : a5 1c __ LDA ACCU + 1 
0b5e : 85 0e __ STA P1 
0b60 : a5 1d __ LDA ACCU + 2 
0b62 : 85 0f __ STA P2 
0b64 : a5 1e __ LDA ACCU + 3 
0b66 : 85 10 __ STA P3 
0b68 : 20 f2 27 JSR $27f2 ; (sqrt.s4 + 0)
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
0b89 : 20 44 42 JSR $4244 ; (freg + 20)
0b8c : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0b8f : a9 db __ LDA #$db
0b91 : 85 03 __ STA WORK + 0 
0b93 : a9 3f __ LDA #$3f
0b95 : 85 06 __ STA WORK + 3 
0b97 : a9 0f __ LDA #$0f
0b99 : 85 04 __ STA WORK + 1 
0b9b : a9 c9 __ LDA #$c9
0b9d : 85 05 __ STA WORK + 2 
0b9f : 20 44 42 JSR $4244 ; (freg + 20)
0ba2 : 20 7b 42 JSR $427b ; (faddsub + 6)
0ba5 : a5 1b __ LDA ACCU + 0 
0ba7 : 85 0d __ STA P0 
0ba9 : a5 1c __ LDA ACCU + 1 
0bab : 85 0e __ STA P1 
0bad : a5 1d __ LDA ACCU + 2 
0baf : 85 0f __ STA P2 
0bb1 : a5 1e __ LDA ACCU + 3 
0bb3 : 85 10 __ STA P3 
0bb5 : 20 5b 26 JSR $265b ; (sin.s4 + 0)
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
0bd6 : 20 34 42 JSR $4234 ; (freg + 4)
0bd9 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0bdc : a5 1b __ LDA ACCU + 0 
0bde : 85 0d __ STA P0 
0be0 : a5 1c __ LDA ACCU + 1 
0be2 : 85 0e __ STA P1 
0be4 : a5 1d __ LDA ACCU + 2 
0be6 : 85 0f __ STA P2 
0be8 : a5 1e __ LDA ACCU + 3 
0bea : 85 10 __ STA P3 
0bec : 20 56 29 JSR $2956 ; (exp.s4 + 0)
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
0c3a : 20 34 42 JSR $4234 ; (freg + 4)
0c3d : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0c40 : a9 00 __ LDA #$00
0c42 : 85 03 __ STA WORK + 0 
0c44 : 85 04 __ STA WORK + 1 
0c46 : 85 05 __ STA WORK + 2 
0c48 : a9 3f __ LDA #$3f
0c4a : 85 06 __ STA WORK + 3 
0c4c : 20 44 42 JSR $4244 ; (freg + 20)
0c4f : 20 62 43 JSR $4362 ; (crt_fmul + 0)
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
0c83 : f0 03 __ BEQ $0c88 ; (main.s25 + 0)
0c85 : 4c 19 0b JMP $0b19 ; (main.l6 + 0)
.s25:
0c88 : a5 6f __ LDA T8 + 0 
0c8a : c9 f0 __ CMP #$f0
0c8c : d0 f7 __ BNE $0c85 ; (main.l6 + 364)
.s7:
0c8e : a5 6d __ LDA T7 + 0 
0c90 : 69 0b __ ADC #$0b
0c92 : 85 6d __ STA T7 + 0 
0c94 : 90 03 __ BCC $0c99 ; (main.s29 + 0)
.s28:
0c96 : e6 6e __ INC T7 + 1 
0c98 : 18 __ __ CLC
.s29:
0c99 : a5 6b __ LDA T6 + 0 
0c9b : 69 01 __ ADC #$01
0c9d : 85 6b __ STA T6 + 0 
0c9f : a5 6c __ LDA T6 + 1 
0ca1 : 69 00 __ ADC #$00
0ca3 : 85 6c __ STA T6 + 1 
0ca5 : f0 03 __ BEQ $0caa ; (main.s24 + 0)
0ca7 : 4c c2 0a JMP $0ac2 ; (main.l5 + 0)
.s24:
0caa : a5 6b __ LDA T6 + 0 
0cac : c9 10 __ CMP #$10
0cae : d0 f7 __ BNE $0ca7 ; (main.s29 + 14)
.s8:
0cb0 : a9 a7 __ LDA #$a7
0cb2 : 85 0d __ STA P0 
0cb4 : a9 2a __ LDA #$2a
0cb6 : 85 0e __ STA P1 
0cb8 : 20 18 23 JSR $2318 ; (strlen.s4 + 0)
0cbb : a9 00 __ LDA #$00
0cbd : 8d e7 c7 STA $c7e7 ; (sstack + 41)
0cc0 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
0cc3 : 8d ea c7 STA $c7ea ; (sstack + 44)
0cc6 : a9 a7 __ LDA #$a7
0cc8 : 8d eb c7 STA $c7eb ; (sstack + 45)
0ccb : a9 2a __ LDA #$2a
0ccd : 8d ec c7 STA $c7ec ; (sstack + 46)
0cd0 : a5 1b __ LDA ACCU + 0 
0cd2 : 8d ed c7 STA $c7ed ; (sstack + 47)
0cd5 : a9 08 __ LDA #$08
0cd7 : 8d e9 c7 STA $c7e9 ; (sstack + 43)
0cda : 8d ee c7 STA $c7ee ; (sstack + 48)
0cdd : a9 46 __ LDA #$46
0cdf : 8d e3 c7 STA $c7e3 ; (sstack + 37)
0ce2 : a9 48 __ LDA #$48
0ce4 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
0ce7 : a9 4e __ LDA #$4e
0ce9 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
0cec : a9 48 __ LDA #$48
0cee : 8d e6 c7 STA $c7e6 ; (sstack + 40)
0cf1 : 20 8b 14 JSR $148b ; (bm_put_chars.s1 + 0)
0cf4 : a9 00 __ LDA #$00
0cf6 : 8d ee 4a STA $4aee ; (vlight.v[0] + 0)
0cf9 : 8d ef 4a STA $4aef ; (vlight.v[0] + 1)
0cfc : 8d f0 4a STA $4af0 ; (vlight.v[0] + 2)
0cff : 8d f2 4a STA $4af2 ; (vlight.v[0] + 4)
0d02 : 8d f3 4a STA $4af3 ; (vlight.v[0] + 5)
0d05 : 8d f4 4a STA $4af4 ; (vlight.v[0] + 6)
0d08 : 8d f6 4a STA $4af6 ; (vlight.v[0] + 8)
0d0b : 8d f7 4a STA $4af7 ; (vlight.v[0] + 9)
0d0e : a9 40 __ LDA #$40
0d10 : 8d f1 4a STA $4af1 ; (vlight.v[0] + 3)
0d13 : a9 c0 __ LDA #$c0
0d15 : 8d f5 4a STA $4af5 ; (vlight.v[0] + 7)
0d18 : a9 80 __ LDA #$80
0d1a : 8d f8 4a STA $4af8 ; (vlight.v[0] + 10)
0d1d : a9 bf __ LDA #$bf
0d1f : 8d f9 4a STA $4af9 ; (vlight.v[0] + 11)
0d22 : a9 ee __ LDA #$ee
0d24 : 85 15 __ STA P8 
0d26 : a9 4a __ LDA #$4a
0d28 : 85 16 __ STA P9 
0d2a : 20 bb 2a JSR $2abb ; (vec3_norm.s4 + 0)
0d2d : a9 00 __ LDA #$00
0d2f : 85 0f __ STA P2 
0d31 : 85 10 __ STA P3 
0d33 : a9 90 __ LDA #$90
0d35 : 85 11 __ STA P4 
0d37 : a9 4a __ LDA #$4a
0d39 : 85 0e __ STA P1 
0d3b : a9 41 __ LDA #$41
0d3d : 85 12 __ STA P5 
0d3f : a9 ae __ LDA #$ae
0d41 : 85 0d __ STA P0 
0d43 : 20 35 2c JSR $2c35 ; (mat4_scale.s4 + 0)
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
0d5e : a9 7b __ LDA #$7b
0d60 : 85 16 __ STA P9 
0d62 : 20 7f 2c JSR $2c7f ; (mat4_set_rotate_x.s4 + 0)
0d65 : a9 99 __ LDA #$99
0d67 : 8d bf c7 STA $c7bf ; (sstack + 1)
0d6a : 8d c0 c7 STA $c7c0 ; (sstack + 2)
0d6d : a9 9a __ LDA #$9a
0d6f : 8d be c7 STA $c7be ; (sstack + 0)
0d72 : a9 3e __ LDA #$3e
0d74 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
0d77 : a9 40 __ LDA #$40
0d79 : 85 15 __ STA P8 
0d7b : a9 7b __ LDA #$7b
0d7d : 85 16 __ STA P9 
0d7f : 20 d6 2d JSR $2dd6 ; (mat4_set_rotate_y.s4 + 0)
0d82 : a9 00 __ LDA #$00
0d84 : 85 0d __ STA P0 
0d86 : a9 7b __ LDA #$7b
0d88 : 85 10 __ STA P3 
0d8a : a9 7b __ LDA #$7b
0d8c : 85 0e __ STA P1 
0d8e : a9 40 __ LDA #$40
0d90 : 85 0f __ STA P2 
0d92 : 20 30 2f JSR $2f30 ; (mat4_rmmul.s1 + 0)
0d95 : a9 ae __ LDA #$ae
0d97 : 85 0f __ STA P2 
0d99 : a9 4a __ LDA #$4a
0d9b : 85 10 __ STA P3 
0d9d : 20 30 2f JSR $2f30 ; (mat4_rmmul.s1 + 0)
0da0 : ad 38 7b LDA $7b38 ; (rmat.m[0] + 56)
0da3 : 85 1b __ STA ACCU + 0 
0da5 : a9 40 __ LDA #$40
0da7 : 85 0d __ STA P0 
0da9 : a9 7b __ LDA #$7b
0dab : 85 0e __ STA P1 
0dad : a9 00 __ LDA #$00
0daf : 85 0f __ STA P2 
0db1 : a9 7b __ LDA #$7b
0db3 : 85 10 __ STA P3 
0db5 : ad 39 7b LDA $7b39 ; (rmat.m[0] + 57)
0db8 : 85 1c __ STA ACCU + 1 
0dba : ad 3a 7b LDA $7b3a ; (rmat.m[0] + 58)
0dbd : 85 1d __ STA ACCU + 2 
0dbf : ad 3b 7b LDA $7b3b ; (rmat.m[0] + 59)
0dc2 : 85 1e __ STA ACCU + 3 
0dc4 : a9 00 __ LDA #$00
0dc6 : 85 03 __ STA WORK + 0 
0dc8 : 85 04 __ STA WORK + 1 
0dca : a9 a0 __ LDA #$a0
0dcc : 85 05 __ STA WORK + 2 
0dce : a9 41 __ LDA #$41
0dd0 : 85 06 __ STA WORK + 3 
0dd2 : 20 44 42 JSR $4244 ; (freg + 20)
0dd5 : 20 7b 42 JSR $427b ; (faddsub + 6)
0dd8 : a5 1b __ LDA ACCU + 0 
0dda : 8d 38 7b STA $7b38 ; (rmat.m[0] + 56)
0ddd : a5 1c __ LDA ACCU + 1 
0ddf : 8d 39 7b STA $7b39 ; (rmat.m[0] + 57)
0de2 : a5 1d __ LDA ACCU + 2 
0de4 : 8d 3a 7b STA $7b3a ; (rmat.m[0] + 58)
0de7 : a5 1e __ LDA ACCU + 3 
0de9 : 8d 3b 7b STA $7b3b ; (rmat.m[0] + 59)
0dec : a2 3f __ LDX #$3f
.l9:
0dee : bd c0 4c LDA $4cc0,x ; (pmat.m[0] + 0)
0df1 : 9d 40 7b STA $7b40,x ; (tmat.m[0] + 0)
0df4 : ca __ __ DEX
0df5 : 10 f7 __ BPL $0dee ; (main.l9 + 0)
.s10:
0df7 : 20 df 30 JSR $30df ; (mat4_mmul.s1 + 0)
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
0e12 : a9 8a __ LDA #$8a
0e14 : 85 6e __ STA T7 + 1 
0e16 : a9 80 __ LDA #$80
0e18 : 85 6f __ STA T8 + 0 
0e1a : a9 7b __ LDA #$7b
0e1c : 85 70 __ STA T8 + 1 
0e1e : a9 e0 __ LDA #$e0
0e20 : 85 71 __ STA T9 + 0 
0e22 : a9 4d __ LDA #$4d
0e24 : 85 72 __ STA T9 + 1 
.l26:
0e26 : 18 __ __ CLC
0e27 : a5 71 __ LDA T9 + 0 
0e29 : 65 5f __ ADC T3 + 0 
0e2b : 85 17 __ STA P10 
0e2d : a5 72 __ LDA T9 + 1 
0e2f : 65 60 __ ADC T3 + 1 
0e31 : 85 18 __ STA P11 
0e33 : 20 8a 32 JSR $328a ; (vec3_project.s4 + 0)
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
0e58 : 20 44 42 JSR $4244 ; (freg + 20)
0e5b : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0e5e : a9 00 __ LDA #$00
0e60 : 85 03 __ STA WORK + 0 
0e62 : 85 04 __ STA WORK + 1 
0e64 : a9 20 __ LDA #$20
0e66 : 85 05 __ STA WORK + 2 
0e68 : a9 43 __ LDA #$43
0e6a : 85 06 __ STA WORK + 3 
0e6c : 20 44 42 JSR $4244 ; (freg + 20)
0e6f : 20 7b 42 JSR $427b ; (faddsub + 6)
0e72 : 20 d2 45 JSR $45d2 ; (f32_to_i16 + 0)
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
0ea2 : 20 44 42 JSR $4244 ; (freg + 20)
0ea5 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
0ea8 : a9 00 __ LDA #$00
0eaa : 85 03 __ STA WORK + 0 
0eac : 85 04 __ STA WORK + 1 
0eae : a9 a0 __ LDA #$a0
0eb0 : 85 05 __ STA WORK + 2 
0eb2 : a9 42 __ LDA #$42
0eb4 : 85 06 __ STA WORK + 3 
0eb6 : 20 44 42 JSR $4244 ; (freg + 20)
0eb9 : 20 7b 42 JSR $427b ; (faddsub + 6)
0ebc : 20 d2 45 JSR $45d2 ; (f32_to_i16 + 0)
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
0ef6 : 90 03 __ BCC $0efb ; (main.s31 + 0)
.s30:
0ef8 : e6 70 __ INC T8 + 1 
0efa : 18 __ __ CLC
.s31:
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
0f0e : 90 02 __ BCC $0f12 ; (main.s33 + 0)
.s32:
0f10 : e6 6e __ INC T7 + 1 
.s33:
0f12 : a2 88 __ LDX #$88
0f14 : 86 1b __ STX ACCU + 0 
0f16 : a2 99 __ LDX #$99
0f18 : 86 1c __ STX ACCU + 1 
0f1a : c9 88 __ CMP #$88
0f1c : f0 03 __ BEQ $0f21 ; (main.s23 + 0)
0f1e : 4c 26 0e JMP $0e26 ; (main.l26 + 0)
.s23:
0f21 : a5 6e __ LDA T7 + 1 
0f23 : c9 99 __ CMP #$99
0f25 : d0 f7 __ BNE $0f1e ; (main.s33 + 12)
.s12:
0f27 : a5 5f __ LDA T3 + 0 
0f29 : 69 0b __ ADC #$0b
0f2b : 85 5f __ STA T3 + 0 
0f2d : 90 02 __ BCC $0f31 ; (main.s35 + 0)
.s34:
0f2f : e6 60 __ INC T3 + 1 
.s35:
0f31 : e6 5b __ INC T2 + 0 
0f33 : a5 5b __ LDA T2 + 0 
0f35 : c9 1f __ CMP #$1f
0f37 : b0 03 __ BCS $0f3c ; (main.s13 + 0)
0f39 : 4c 0a 0e JMP $0e0a ; (main.l11 + 0)
.s13:
0f3c : a9 34 __ LDA #$34
0f3e : 85 0d __ STA P0 
0f40 : a9 34 __ LDA #$34
0f42 : 85 0e __ STA P1 
0f44 : 20 18 23 JSR $2318 ; (strlen.s4 + 0)
0f47 : a9 00 __ LDA #$00
0f49 : 8d e7 c7 STA $c7e7 ; (sstack + 41)
0f4c : 8d e8 c7 STA $c7e8 ; (sstack + 42)
0f4f : 8d ea c7 STA $c7ea ; (sstack + 44)
0f52 : a9 10 __ LDA #$10
0f54 : 8d e9 c7 STA $c7e9 ; (sstack + 43)
0f57 : a9 34 __ LDA #$34
0f59 : 8d eb c7 STA $c7eb ; (sstack + 45)
0f5c : a9 34 __ LDA #$34
0f5e : 8d ec c7 STA $c7ec ; (sstack + 46)
0f61 : a5 1b __ LDA ACCU + 0 
0f63 : 8d ed c7 STA $c7ed ; (sstack + 47)
0f66 : a9 08 __ LDA #$08
0f68 : 8d ee c7 STA $c7ee ; (sstack + 48)
0f6b : a9 46 __ LDA #$46
0f6d : 8d e3 c7 STA $c7e3 ; (sstack + 37)
0f70 : a9 48 __ LDA #$48
0f72 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
0f75 : a9 4e __ LDA #$4e
0f77 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
0f7a : a9 48 __ LDA #$48
0f7c : 8d e6 c7 STA $c7e6 ; (sstack + 40)
0f7f : 20 8b 14 JSR $148b ; (bm_put_chars.s1 + 0)
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
0f93 : 20 c2 41 JSR $41c2 ; (mul16by8 + 0)
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
0fb3 : 69 99 __ ADC #$99
0fb5 : 85 68 __ STA T5 + 1 
0fb7 : a5 5b __ LDA T2 + 0 
0fb9 : 85 1b __ STA ACCU + 0 
0fbb : a9 00 __ LDA #$00
0fbd : 85 1c __ STA ACCU + 1 
0fbf : a9 7c __ LDA #$7c
0fc1 : 20 c2 41 JSR $41c2 ; (mul16by8 + 0)
0fc4 : 18 __ __ CLC
0fc5 : a9 84 __ LDA #$84
0fc7 : 65 1b __ ADC ACCU + 0 
0fc9 : 85 6b __ STA T6 + 0 
0fcb : a9 8a __ LDA #$8a
0fcd : 65 1c __ ADC ACCU + 1 
0fcf : 85 6c __ STA T6 + 1 
0fd1 : 18 __ __ CLC
0fd2 : a5 1b __ LDA ACCU + 0 
0fd4 : 69 00 __ ADC #$00
0fd6 : 85 6d __ STA T7 + 0 
0fd8 : a5 1c __ LDA ACCU + 1 
0fda : 69 8b __ ADC #$8b
0fdc : 85 6e __ STA T7 + 1 
0fde : a9 00 __ LDA #$00
0fe0 : 85 6f __ STA T8 + 0 
.l27:
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
1014 : 20 44 42 JSR $4244 ; (freg + 20)
1017 : 20 7b 42 JSR $427b ; (faddsub + 6)
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
102f : 20 44 42 JSR $4244 ; (freg + 20)
1032 : 20 7b 42 JSR $427b ; (faddsub + 6)
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
104a : 20 44 42 JSR $4244 ; (freg + 20)
104d : 20 7b 42 JSR $427b ; (faddsub + 6)
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
106c : 90 03 __ BCC $1071 ; (main.s37 + 0)
.s36:
106e : e6 6c __ INC T6 + 1 
1070 : 18 __ __ CLC
.s37:
1071 : a5 6d __ LDA T7 + 0 
1073 : 69 04 __ ADC #$04
1075 : 85 6d __ STA T7 + 0 
1077 : 90 03 __ BCC $107c ; (main.s39 + 0)
.s38:
1079 : e6 6e __ INC T7 + 1 
107b : 18 __ __ CLC
.s39:
107c : a5 67 __ LDA T5 + 0 
107e : 69 06 __ ADC #$06
1080 : 85 67 __ STA T5 + 0 
1082 : 90 02 __ BCC $1086 ; (main.s41 + 0)
.s40:
1084 : e6 68 __ INC T5 + 1 
.s41:
1086 : e6 6f __ INC T8 + 0 
1088 : a5 6f __ LDA T8 + 0 
108a : c9 1e __ CMP #$1e
108c : b0 03 __ BCS $1091 ; (main.s15 + 0)
108e : 4c e2 0f JMP $0fe2 ; (main.l27 + 0)
.s15:
1091 : a5 63 __ LDA T4 + 0 
1093 : c9 1e __ CMP #$1e
1095 : b0 03 __ BCS $109a ; (main.s16 + 0)
1097 : 4c 84 0f JMP $0f84 ; (main.l14 + 0)
.s16:
109a : a9 88 __ LDA #$88
109c : a0 02 __ LDY #$02
109e : 91 23 __ STA (SP + 0),y 
10a0 : a9 99 __ LDA #$99
10a2 : c8 __ __ INY
10a3 : 91 23 __ STA (SP + 0),y 
10a5 : a9 84 __ LDA #$84
10a7 : c8 __ __ INY
10a8 : 91 23 __ STA (SP + 0),y 
10aa : a9 03 __ LDA #$03
10ac : c8 __ __ INY
10ad : 91 23 __ STA (SP + 0),y 
10af : 20 45 34 JSR $3445 ; (qsort.s1 + 0)
10b2 : a9 e8 __ LDA #$e8
10b4 : 85 0d __ STA P0 
10b6 : a9 35 __ LDA #$35
10b8 : 85 0e __ STA P1 
10ba : 20 18 23 JSR $2318 ; (strlen.s4 + 0)
10bd : a9 00 __ LDA #$00
10bf : 8d e7 c7 STA $c7e7 ; (sstack + 41)
10c2 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
10c5 : 8d ea c7 STA $c7ea ; (sstack + 44)
10c8 : a9 18 __ LDA #$18
10ca : 8d e9 c7 STA $c7e9 ; (sstack + 43)
10cd : a9 e8 __ LDA #$e8
10cf : 8d eb c7 STA $c7eb ; (sstack + 45)
10d2 : a9 35 __ LDA #$35
10d4 : 8d ec c7 STA $c7ec ; (sstack + 46)
10d7 : a5 1b __ LDA ACCU + 0 
10d9 : 8d ed c7 STA $c7ed ; (sstack + 47)
10dc : a9 08 __ LDA #$08
10de : 8d ee c7 STA $c7ee ; (sstack + 48)
10e1 : a9 46 __ LDA #$46
10e3 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
10e6 : a9 48 __ LDA #$48
10e8 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
10eb : a9 4e __ LDA #$4e
10ed : 8d e5 c7 STA $c7e5 ; (sstack + 39)
10f0 : a9 48 __ LDA #$48
10f2 : 8d e6 c7 STA $c7e6 ; (sstack + 40)
10f5 : 20 8b 14 JSR $148b ; (bm_put_chars.s1 + 0)
10f8 : a9 88 __ LDA #$88
10fa : 85 6d __ STA T7 + 0 
10fc : a9 99 __ LDA #$99
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
1111 : 90 02 __ BCC $1115 ; (main.s43 + 0)
.s42:
1113 : e8 __ __ INX
1114 : 18 __ __ CLC
.s43:
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
1132 : 20 c2 41 JSR $41c2 ; (mul16by8 + 0)
1135 : 18 __ __ CLC
1136 : a9 e0 __ LDA #$e0
1138 : 65 1b __ ADC ACCU + 0 
113a : a8 __ __ TAY
113b : a9 4d __ LDA #$4d
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
1155 : a9 4f __ LDA #$4f
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
1172 : 20 f9 35 JSR $35f9 ; (vec3_diff.s4 + 0)
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
1192 : 20 f9 35 JSR $35f9 ; (vec3_diff.s4 + 0)
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
11ad : 20 49 36 JSR $3649 ; (vec3_xmul.s1 + 0)
11b0 : a9 58 __ LDA #$58
11b2 : 85 15 __ STA P8 
11b4 : a9 c7 __ LDA #$c7
11b6 : 85 16 __ STA P9 
11b8 : 20 bb 2a JSR $2abb ; (vec3_norm.s4 + 0)
11bb : a9 ee __ LDA #$ee
11bd : 85 0d __ STA P0 
11bf : a9 c7 __ LDA #$c7
11c1 : 85 10 __ STA P3 
11c3 : a9 4a __ LDA #$4a
11c5 : 85 0e __ STA P1 
11c7 : a9 58 __ LDA #$58
11c9 : 85 0f __ STA P2 
11cb : 20 73 2b JSR $2b73 ; (vec3_vmul.s4 + 0)
11ce : a9 46 __ LDA #$46
11d0 : 8d ea c7 STA $c7ea ; (sstack + 44)
11d3 : a9 48 __ LDA #$48
11d5 : 8d eb c7 STA $c7eb ; (sstack + 45)
11d8 : a9 4e __ LDA #$4e
11da : 8d ec c7 STA $c7ec ; (sstack + 46)
11dd : a9 48 __ LDA #$48
11df : 8d ed c7 STA $c7ed ; (sstack + 47)
11e2 : a9 00 __ LDA #$00
11e4 : 85 57 __ STA T1 + 0 
11e6 : a5 1e __ LDA ACCU + 3 
11e8 : 29 7f __ AND #$7f
11ea : 05 1d __ ORA ACCU + 2 
11ec : 05 1c __ ORA ACCU + 1 
11ee : 05 1b __ ORA ACCU + 0 
11f0 : f0 32 __ BEQ $1224 ; (main.s18 + 0)
.s22:
11f2 : 24 1e __ BIT ACCU + 3 
11f4 : 30 2e __ BMI $1224 ; (main.s18 + 0)
.s21:
11f6 : a5 1b __ LDA ACCU + 0 
11f8 : 85 53 __ STA T0 + 0 
11fa : a5 1c __ LDA ACCU + 1 
11fc : 85 54 __ STA T0 + 1 
11fe : a5 1d __ LDA ACCU + 2 
1200 : 85 55 __ STA T0 + 2 
1202 : a5 1e __ LDA ACCU + 3 
1204 : 85 56 __ STA T0 + 3 
1206 : a9 00 __ LDA #$00
1208 : 85 1b __ STA ACCU + 0 
120a : 85 1c __ STA ACCU + 1 
120c : a9 c0 __ LDA #$c0
120e : 85 1d __ STA ACCU + 2 
1210 : a9 40 __ LDA #$40
1212 : 85 1e __ STA ACCU + 3 
1214 : a2 53 __ LDX #$53
1216 : 20 34 42 JSR $4234 ; (freg + 4)
1219 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
121c : 20 d2 45 JSR $45d2 ; (f32_to_i16 + 0)
121f : a6 1b __ LDX ACCU + 0 
1221 : e8 __ __ INX
1222 : 86 57 __ STX T1 + 0 
.s18:
1224 : a5 5f __ LDA T3 + 0 
1226 : 0a __ __ ASL
1227 : 85 53 __ STA T0 + 0 
1229 : a9 00 __ LDA #$00
122b : 85 1c __ STA ACCU + 1 
122d : 2a __ __ ROL
122e : 06 53 __ ASL T0 + 0 
1230 : 2a __ __ ROL
1231 : 85 54 __ STA T0 + 1 
1233 : a5 63 __ LDA T4 + 0 
1235 : 85 1b __ STA ACCU + 0 
1237 : a9 7c __ LDA #$7c
1239 : 20 c2 41 JSR $41c2 ; (mul16by8 + 0)
123c : a5 1b __ LDA ACCU + 0 
123e : 85 5b __ STA T2 + 0 
1240 : 18 __ __ CLC
1241 : 69 80 __ ADC #$80
1243 : 85 5f __ STA T3 + 0 
1245 : a9 7b __ LDA #$7b
1247 : 65 1c __ ADC ACCU + 1 
1249 : 85 60 __ STA T3 + 1 
124b : a4 53 __ LDY T0 + 0 
124d : b1 5f __ LDA (T3 + 0),y 
124f : aa __ __ TAX
1250 : c8 __ __ INY
1251 : b1 5f __ LDA (T3 + 0),y 
1253 : 85 64 __ STA T4 + 1 
1255 : c8 __ __ INY
1256 : b1 5f __ LDA (T3 + 0),y 
1258 : 85 67 __ STA T5 + 0 
125a : c8 __ __ INY
125b : b1 5f __ LDA (T3 + 0),y 
125d : 85 68 __ STA T5 + 1 
125f : c8 __ __ INY
1260 : b1 5f __ LDA (T3 + 0),y 
1262 : 85 6b __ STA T6 + 0 
1264 : c8 __ __ INY
1265 : b1 5f __ LDA (T3 + 0),y 
1267 : 85 6c __ STA T6 + 1 
1269 : c8 __ __ INY
126a : b1 5f __ LDA (T3 + 0),y 
126c : 85 1b __ STA ACCU + 0 
126e : c8 __ __ INY
126f : b1 5f __ LDA (T3 + 0),y 
1271 : 8e ee c7 STX $c7ee ; (sstack + 48)
1274 : 8d f5 c7 STA $c7f5 ; (sstack + 55)
1277 : a5 64 __ LDA T4 + 1 
1279 : 8d ef c7 STA $c7ef ; (sstack + 49)
127c : a5 67 __ LDA T5 + 0 
127e : 8d f0 c7 STA $c7f0 ; (sstack + 50)
1281 : a5 68 __ LDA T5 + 1 
1283 : 8d f1 c7 STA $c7f1 ; (sstack + 51)
1286 : a5 6b __ LDA T6 + 0 
1288 : 8d f2 c7 STA $c7f2 ; (sstack + 52)
128b : a5 6c __ LDA T6 + 1 
128d : 8d f3 c7 STA $c7f3 ; (sstack + 53)
1290 : a5 1b __ LDA ACCU + 0 
1292 : 8d f4 c7 STA $c7f4 ; (sstack + 54)
1295 : 18 __ __ CLC
1296 : a5 5b __ LDA T2 + 0 
1298 : 65 53 __ ADC T0 + 0 
129a : a8 __ __ TAY
129b : a5 1c __ LDA ACCU + 1 
129d : 65 54 __ ADC T0 + 1 
129f : aa __ __ TAX
12a0 : 98 __ __ TYA
12a1 : 18 __ __ CLC
12a2 : 69 fc __ ADC #$fc
12a4 : 85 53 __ STA T0 + 0 
12a6 : 8a __ __ TXA
12a7 : 69 7b __ ADC #$7b
12a9 : 85 54 __ STA T0 + 1 
12ab : a0 00 __ LDY #$00
12ad : b1 53 __ LDA (T0 + 0),y 
12af : 85 5b __ STA T2 + 0 
12b1 : c8 __ __ INY
12b2 : b1 53 __ LDA (T0 + 0),y 
12b4 : 85 5c __ STA T2 + 1 
12b6 : c8 __ __ INY
12b7 : b1 53 __ LDA (T0 + 0),y 
12b9 : 85 5f __ STA T3 + 0 
12bb : c8 __ __ INY
12bc : b1 53 __ LDA (T0 + 0),y 
12be : 85 60 __ STA T3 + 1 
12c0 : c8 __ __ INY
12c1 : b1 53 __ LDA (T0 + 0),y 
12c3 : aa __ __ TAX
12c4 : c8 __ __ INY
12c5 : b1 53 __ LDA (T0 + 0),y 
12c7 : 85 64 __ STA T4 + 1 
12c9 : c8 __ __ INY
12ca : b1 53 __ LDA (T0 + 0),y 
12cc : 8d f8 c7 STA $c7f8 ; (sstack + 58)
12cf : c8 __ __ INY
12d0 : b1 53 __ LDA (T0 + 0),y 
12d2 : 8e f6 c7 STX $c7f6 ; (sstack + 56)
12d5 : 8d f9 c7 STA $c7f9 ; (sstack + 59)
12d8 : a5 64 __ LDA T4 + 1 
12da : 8d f7 c7 STA $c7f7 ; (sstack + 57)
12dd : a5 5b __ LDA T2 + 0 
12df : 8d fa c7 STA $c7fa ; (sstack + 60)
12e2 : a5 5c __ LDA T2 + 1 
12e4 : 8d fb c7 STA $c7fb ; (sstack + 61)
12e7 : a5 5f __ LDA T3 + 0 
12e9 : 8d fc c7 STA $c7fc ; (sstack + 62)
12ec : a5 60 __ LDA T3 + 1 
12ee : 8d fd c7 STA $c7fd ; (sstack + 63)
12f1 : 18 __ __ CLC
12f2 : a5 57 __ LDA T1 + 0 
12f4 : 69 01 __ ADC #$01
12f6 : 29 fe __ AND #$fe
12f8 : 0a __ __ ASL
12f9 : 0a __ __ ASL
12fa : 85 53 __ STA T0 + 0 
12fc : a5 57 __ LDA T1 + 0 
12fe : 29 fe __ AND #$fe
1300 : 0a __ __ ASL
1301 : 0a __ __ ASL
1302 : 0a __ __ ASL
1303 : 0a __ __ ASL
1304 : 18 __ __ CLC
1305 : 65 53 __ ADC T0 + 0 
1307 : 18 __ __ CLC
1308 : 69 00 __ ADC #$00
130a : 8d fe c7 STA $c7fe ; (sstack + 64)
130d : a9 4b __ LDA #$4b
130f : 69 00 __ ADC #$00
1311 : 8d ff c7 STA $c7ff ; (sstack + 65)
1314 : 20 ef 37 JSR $37ef ; (bmmc_quad_fill.s1 + 0)
1317 : 18 __ __ CLC
1318 : a5 6d __ LDA T7 + 0 
131a : 69 06 __ ADC #$06
131c : 85 6d __ STA T7 + 0 
131e : 90 02 __ BCC $1322 ; (main.s45 + 0)
.s44:
1320 : e6 6e __ INC T7 + 1 
.s45:
1322 : c9 a0 __ CMP #$a0
1324 : f0 03 __ BEQ $1329 ; (main.s20 + 0)
1326 : 4c 00 11 JMP $1100 ; (main.l17 + 0)
.s20:
1329 : a5 6e __ LDA T7 + 1 
132b : c9 ae __ CMP #$ae
132d : d0 f7 __ BNE $1326 ; (main.s45 + 4)
.s19:
132f : a9 36 __ LDA #$36
1331 : 85 01 __ STA $01 
1333 : 20 6c 41 JSR $416c ; (getch.l4 + 0)
1336 : 20 aa 41 JSR $41aa ; (restore.s4 + 0)
1339 : a9 00 __ LDA #$00
133b : 85 1b __ STA ACCU + 0 
133d : 85 1c __ STA ACCU + 1 
.s3:
133f : 18 __ __ CLC
1340 : a5 23 __ LDA SP + 0 
1342 : 69 06 __ ADC #$06
1344 : 85 23 __ STA SP + 0 
1346 : 90 02 __ BCC $134a ; (main.s3 + 11)
1348 : e6 24 __ INC SP + 1 
134a : a2 1f __ LDX #$1f
134c : bd 30 c7 LDA $c730,x ; (main@stack + 0)
134f : 95 53 __ STA T0 + 0,x 
1351 : ca __ __ DEX
1352 : 10 f8 __ BPL $134c ; (main.s3 + 13)
1354 : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  31, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/func3d.c"
.s4:
1355 : a9 00 __ LDA #$00
1357 : 85 0e __ STA P1 
1359 : 85 10 __ STA P3 
135b : a9 36 __ LDA #$36
135d : 85 01 __ STA $01 
135f : a9 04 __ LDA #$04
1361 : 85 0d __ STA P0 
1363 : a9 c8 __ LDA #$c8
1365 : 85 0f __ STA P2 
1367 : a9 e0 __ LDA #$e0
1369 : 85 11 __ STA P4 
136b : 20 b8 13 JSR $13b8 ; (vic_setmode.s4 + 0)
136e : a9 0b __ LDA #$0b
1370 : 8d 21 d0 STA $d021 
1373 : 8d 20 d0 STA $d020 
1376 : 20 0a 14 JSR $140a ; (mmap_trampoline.s4 + 0)
1379 : a9 00 __ LDA #$00
137b : 85 0d __ STA P0 
137d : 85 0f __ STA P2 
137f : a9 35 __ LDA #$35
1381 : 85 01 __ STA $01 
1383 : a9 e0 __ LDA #$e0
1385 : 85 0e __ STA P1 
1387 : a9 40 __ LDA #$40
1389 : 85 11 __ STA P4 
138b : a9 1f __ LDA #$1f
138d : 85 12 __ STA P5 
138f : a9 cf __ LDA #$cf
1391 : a2 fa __ LDX #$fa
.l6:
1393 : ca __ __ DEX
1394 : 9d 00 c8 STA $c800,x 
1397 : 9d fa c8 STA $c8fa,x 
139a : 9d f4 c9 STA $c9f4,x 
139d : 9d ee ca STA $caee,x 
13a0 : d0 f1 __ BNE $1393 ; (init.l6 + 0)
.s5:
13a2 : a9 01 __ LDA #$01
13a4 : a2 fa __ LDX #$fa
.l8:
13a6 : ca __ __ DEX
13a7 : 9d 00 d8 STA $d800,x 
13aa : 9d fa d8 STA $d8fa,x 
13ad : 9d f4 d9 STA $d9f4,x 
13b0 : 9d ee da STA $daee,x 
13b3 : d0 f1 __ BNE $13a6 ; (init.l8 + 0)
.s7:
13b5 : 4c 54 14 JMP $1454 ; (memset.s4 + 0)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
13b8 : a4 0d __ LDY P0 ; (mode + 0)
13ba : c0 02 __ CPY #$02
13bc : d0 09 __ BNE $13c7 ; (vic_setmode.s5 + 0)
.s10:
13be : a9 5b __ LDA #$5b
13c0 : 8d 11 d0 STA $d011 
.s8:
13c3 : a9 08 __ LDA #$08
13c5 : d0 0c __ BNE $13d3 ; (vic_setmode.s7 + 0)
.s5:
13c7 : b0 36 __ BCS $13ff ; (vic_setmode.s6 + 0)
.s9:
13c9 : a9 1b __ LDA #$1b
13cb : 8d 11 d0 STA $d011 
13ce : 98 __ __ TYA
13cf : f0 f2 __ BEQ $13c3 ; (vic_setmode.s8 + 0)
.s11:
13d1 : a9 18 __ LDA #$18
.s7:
13d3 : 8d 16 d0 STA $d016 
13d6 : ad 00 dd LDA $dd00 
13d9 : 29 fc __ AND #$fc
13db : 85 1b __ STA ACCU + 0 
13dd : a5 0f __ LDA P2 ; (text + 1)
13df : 0a __ __ ASL
13e0 : 2a __ __ ROL
13e1 : 29 01 __ AND #$01
13e3 : 2a __ __ ROL
13e4 : 49 03 __ EOR #$03
13e6 : 05 1b __ ORA ACCU + 0 
13e8 : 8d 00 dd STA $dd00 
13eb : a5 0f __ LDA P2 ; (text + 1)
13ed : 29 3c __ AND #$3c
13ef : 0a __ __ ASL
13f0 : 0a __ __ ASL
13f1 : 85 1b __ STA ACCU + 0 
13f3 : a5 11 __ LDA P4 ; (font + 1)
13f5 : 29 38 __ AND #$38
13f7 : 4a __ __ LSR
13f8 : 4a __ __ LSR
13f9 : 05 1b __ ORA ACCU + 0 
13fb : 8d 18 d0 STA $d018 
.s3:
13fe : 60 __ __ RTS
.s6:
13ff : a9 3b __ LDA #$3b
1401 : 8d 11 d0 STA $d011 
1404 : c0 03 __ CPY #$03
1406 : d0 c9 __ BNE $13d1 ; (vic_setmode.s11 + 0)
1408 : f0 b9 __ BEQ $13c3 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
140a : a9 1f __ LDA #$1f
140c : 8d fa ff STA $fffa 
140f : a9 14 __ LDA #$14
1411 : 8d fb ff STA $fffb 
1414 : a9 3d __ LDA #$3d
1416 : 8d fe ff STA $fffe 
1419 : a9 14 __ LDA #$14
141b : 8d ff ff STA $ffff 
.s3:
141e : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
141f : 48 __ __ PHA
1420 : 8a __ __ TXA
1421 : 48 __ __ PHA
1422 : a9 14 __ LDA #$14
1424 : 48 __ __ PHA
1425 : a9 36 __ LDA #$36
1427 : 48 __ __ PHA
1428 : ba __ __ TSX
1429 : bd 05 01 LDA $0105,x 
142c : 48 __ __ PHA
142d : a6 01 __ LDX $01 
142f : a9 36 __ LDA #$36
1431 : 85 01 __ STA $01 
1433 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
1436 : 86 01 __ STX $01 
1438 : 68 __ __ PLA
1439 : aa __ __ TAX
143a : 68 __ __ PLA
143b : 40 __ __ RTI
143c : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
143d : 48 __ __ PHA
143e : 8a __ __ TXA
143f : 48 __ __ PHA
1440 : a9 14 __ LDA #$14
1442 : 48 __ __ PHA
1443 : a9 36 __ LDA #$36
1445 : 48 __ __ PHA
1446 : ba __ __ TSX
1447 : bd 05 01 LDA $0105,x 
144a : 48 __ __ PHA
144b : a6 01 __ LDX $01 
144d : a9 36 __ LDA #$36
144f : 85 01 __ STA $01 
1451 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
1454 : a5 0f __ LDA P2 
1456 : a6 12 __ LDX P5 
1458 : f0 0c __ BEQ $1466 ; (memset.s4 + 18)
145a : a0 00 __ LDY #$00
145c : 91 0d __ STA (P0),y ; (dst + 0)
145e : c8 __ __ INY
145f : d0 fb __ BNE $145c ; (memset.s4 + 8)
1461 : e6 0e __ INC P1 ; (dst + 1)
1463 : ca __ __ DEX
1464 : d0 f6 __ BNE $145c ; (memset.s4 + 8)
1466 : a4 11 __ LDY P4 
1468 : f0 05 __ BEQ $146f ; (memset.s4 + 27)
146a : 88 __ __ DEY
146b : 91 0d __ STA (P0),y ; (dst + 0)
146d : d0 fb __ BNE $146a ; (memset.s4 + 22)
146f : a5 0d __ LDA P0 ; (dst + 0)
1471 : 85 1b __ STA ACCU + 0 
1473 : a5 0e __ LDA P1 ; (dst + 1)
1475 : 85 1c __ STA ACCU + 1 
.s3:
1477 : 60 __ __ RTS
--------------------------------------------------------------------
1478 : __ __ __ BYT 50 72 65 70 61 72 69 6e 67 20 66 75 6e 63 74 69 : Preparing functi
1488 : __ __ __ BYT 6f 6e 00                                        : on.
--------------------------------------------------------------------
bm_put_chars: ; bm_put_chars(const struct Bitmap*,const struct ClipRect*,i16,i16,const u8*,u8,enum BlitOp)->i16
; 160, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
148b : a2 0d __ LDX #$0d
148d : b5 53 __ LDA T3 + 0,x 
148f : 9d a8 c7 STA $c7a8,x ; (bm_put_chars@stack + 0)
1492 : ca __ __ DEX
1493 : 10 f8 __ BPL $148d ; (bm_put_chars.s1 + 2)
.s4:
1495 : a9 00 __ LDA #$00
1497 : 85 57 __ STA T5 + 0 
1499 : 85 58 __ STA T5 + 1 
149b : ad e9 c7 LDA $c7e9 ; (sstack + 43)
149e : 85 59 __ STA T6 + 0 
14a0 : ad e5 c7 LDA $c7e5 ; (sstack + 39)
14a3 : 85 5b __ STA T7 + 0 
14a5 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
14a8 : 85 5c __ STA T7 + 1 
14aa : ad ea c7 LDA $c7ea ; (sstack + 44)
14ad : 85 5a __ STA T6 + 1 
14af : a0 07 __ LDY #$07
14b1 : d1 5b __ CMP (T7 + 0),y 
14b3 : d0 09 __ BNE $14be ; (bm_put_chars.s51 + 0)
.s48:
14b5 : a5 59 __ LDA T6 + 0 
14b7 : 88 __ __ DEY
14b8 : d1 5b __ CMP (T7 + 0),y 
.s49:
14ba : 90 08 __ BCC $14c4 ; (bm_put_chars.s5 + 0)
14bc : b0 51 __ BCS $150f ; (bm_put_chars.s38 + 0)
.s51:
14be : 51 5b __ EOR (T7 + 0),y 
14c0 : 10 f8 __ BPL $14ba ; (bm_put_chars.s49 + 0)
.s50:
14c2 : 90 4b __ BCC $150f ; (bm_put_chars.s38 + 0)
.s5:
14c4 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
14c7 : 85 43 __ STA T0 + 0 ; (x + 1)
14c9 : a0 04 __ LDY #$04
14cb : b1 5b __ LDA (T7 + 0),y 
14cd : 85 45 __ STA T1 + 0 ; (y + 1)
14cf : c8 __ __ INY
14d0 : b1 5b __ LDA (T7 + 0),y 
14d2 : 85 46 __ STA T1 + 1 ; (str + 0)
14d4 : ad e8 c7 LDA $c7e8 ; (sstack + 42)
14d7 : 85 44 __ STA T0 + 1 ; (y + 0)
14d9 : c5 46 __ CMP T1 + 1 ; (str + 0)
14db : d0 08 __ BNE $14e5 ; (bm_put_chars.s47 + 0)
.s44:
14dd : a5 43 __ LDA T0 + 0 ; (x + 1)
14df : c5 45 __ CMP T1 + 0 ; (y + 1)
.s45:
14e1 : 90 08 __ BCC $14eb ; (bm_put_chars.s6 + 0)
14e3 : b0 2a __ BCS $150f ; (bm_put_chars.s38 + 0)
.s47:
14e5 : 45 46 __ EOR T1 + 1 ; (str + 0)
14e7 : 10 f8 __ BPL $14e1 ; (bm_put_chars.s45 + 0)
.s46:
14e9 : 90 24 __ BCC $150f ; (bm_put_chars.s38 + 0)
.s6:
14eb : 18 __ __ CLC
14ec : a5 59 __ LDA T6 + 0 
14ee : 69 08 __ ADC #$08
14f0 : 85 1b __ STA ACCU + 0 
14f2 : a5 5a __ LDA T6 + 1 
14f4 : 69 00 __ ADC #$00
14f6 : 85 1c __ STA ACCU + 1 
14f8 : a0 03 __ LDY #$03
14fa : b1 5b __ LDA (T7 + 0),y 
14fc : c5 1c __ CMP ACCU + 1 
14fe : d0 09 __ BNE $1509 ; (bm_put_chars.s43 + 0)
.s40:
1500 : 88 __ __ DEY
1501 : b1 5b __ LDA (T7 + 0),y 
1503 : c5 1b __ CMP ACCU + 0 
.s41:
1505 : b0 08 __ BCS $150f ; (bm_put_chars.s38 + 0)
1507 : 90 44 __ BCC $154d ; (bm_put_chars.s7 + 0)
.s43:
1509 : 45 1c __ EOR ACCU + 1 
150b : 10 f8 __ BPL $1505 ; (bm_put_chars.s41 + 0)
.s42:
150d : b0 3e __ BCS $154d ; (bm_put_chars.s7 + 0)
.s38:
150f : ad ed c7 LDA $c7ed ; (sstack + 47)
1512 : f0 26 __ BEQ $153a ; (bm_put_chars.s11 + 0)
.s39:
1514 : ad eb c7 LDA $c7eb ; (sstack + 45)
1517 : 85 43 __ STA T0 + 0 ; (x + 1)
1519 : ad ec c7 LDA $c7ec ; (sstack + 46)
151c : 85 44 __ STA T0 + 1 ; (y + 0)
151e : a0 00 __ LDY #$00
.l52:
1520 : b1 43 __ LDA (T0 + 0),y ; (x + 1)
1522 : 38 __ __ SEC
1523 : e9 20 __ SBC #$20
1525 : aa __ __ TAX
1526 : bd b6 48 LDA $48b6,x ; (TinyFont[0] + 96)
1529 : 4a __ __ LSR
152a : 4a __ __ LSR
152b : 38 __ __ SEC
152c : 65 57 __ ADC T5 + 0 
152e : 85 57 __ STA T5 + 0 
1530 : 90 02 __ BCC $1534 ; (bm_put_chars.s63 + 0)
.s62:
1532 : e6 58 __ INC T5 + 1 
.s63:
1534 : c8 __ __ INY
1535 : cc ed c7 CPY $c7ed ; (sstack + 47)
1538 : 90 e6 __ BCC $1520 ; (bm_put_chars.l52 + 0)
.s11:
153a : a5 57 __ LDA T5 + 0 
153c : 85 1b __ STA ACCU + 0 
153e : a5 58 __ LDA T5 + 1 
1540 : 85 1c __ STA ACCU + 1 
.s3:
1542 : a2 0d __ LDX #$0d
1544 : bd a8 c7 LDA $c7a8,x ; (bm_put_chars@stack + 0)
1547 : 95 53 __ STA T3 + 0,x 
1549 : ca __ __ DEX
154a : 10 f8 __ BPL $1544 ; (bm_put_chars.s3 + 2)
154c : 60 __ __ RTS
.s7:
154d : a0 00 __ LDY #$00
154f : b1 5b __ LDA (T7 + 0),y 
1551 : 85 1b __ STA ACCU + 0 
1553 : c8 __ __ INY
1554 : b1 5b __ LDA (T7 + 0),y 
1556 : 85 1c __ STA ACCU + 1 
1558 : a5 44 __ LDA T0 + 1 ; (y + 0)
155a : c5 1c __ CMP ACCU + 1 
155c : d0 09 __ BNE $1567 ; (bm_put_chars.s37 + 0)
.s34:
155e : a5 43 __ LDA T0 + 0 ; (x + 1)
1560 : c5 1b __ CMP ACCU + 0 
.s35:
1562 : 90 09 __ BCC $156d ; (bm_put_chars.s25 + 0)
1564 : 4c e9 15 JMP $15e9 ; (bm_put_chars.s8 + 0)
.s37:
1567 : 45 1c __ EOR ACCU + 1 
1569 : 10 f7 __ BPL $1562 ; (bm_put_chars.s35 + 0)
.s36:
156b : 90 7c __ BCC $15e9 ; (bm_put_chars.s8 + 0)
.s25:
156d : a9 00 __ LDA #$00
156f : 85 5d __ STA T8 + 0 
1571 : ad ed c7 LDA $c7ed ; (sstack + 47)
1574 : 85 5f __ STA T9 + 0 
1576 : f0 51 __ BEQ $15c9 ; (bm_put_chars.s26 + 0)
.s27:
1578 : ad eb c7 LDA $c7eb ; (sstack + 45)
157b : 85 43 __ STA T0 + 0 ; (x + 1)
157d : ad ec c7 LDA $c7ec ; (sstack + 46)
1580 : 85 44 __ STA T0 + 1 ; (y + 0)
1582 : a0 00 __ LDY #$00
.l28:
1584 : b1 43 __ LDA (T0 + 0),y ; (x + 1)
1586 : 38 __ __ SEC
1587 : e9 20 __ SBC #$20
1589 : aa __ __ TAX
158a : bd b6 48 LDA $48b6,x ; (TinyFont[0] + 96)
158d : 4a __ __ LSR
158e : 4a __ __ LSR
158f : 18 __ __ CLC
1590 : 69 01 __ ADC #$01
1592 : 85 53 __ STA T3 + 0 
1594 : 6d e7 c7 ADC $c7e7 ; (sstack + 41)
1597 : aa __ __ TAX
1598 : ad e8 c7 LDA $c7e8 ; (sstack + 42)
159b : 69 00 __ ADC #$00
159d : 85 56 __ STA T4 + 1 
159f : c5 1c __ CMP ACCU + 1 
15a1 : d0 06 __ BNE $15a9 ; (bm_put_chars.s33 + 0)
.s30:
15a3 : e4 1b __ CPX ACCU + 0 
.s31:
15a5 : 90 08 __ BCC $15af ; (bm_put_chars.s29 + 0)
15a7 : b0 1e __ BCS $15c7 ; (bm_put_chars.s53 + 0)
.s33:
15a9 : 45 1c __ EOR ACCU + 1 
15ab : 10 f8 __ BPL $15a5 ; (bm_put_chars.s31 + 0)
.s32:
15ad : 90 18 __ BCC $15c7 ; (bm_put_chars.s53 + 0)
.s29:
15af : 8e e7 c7 STX $c7e7 ; (sstack + 41)
15b2 : 18 __ __ CLC
15b3 : a5 57 __ LDA T5 + 0 
15b5 : 65 53 __ ADC T3 + 0 
15b7 : 85 57 __ STA T5 + 0 
15b9 : 90 02 __ BCC $15bd ; (bm_put_chars.s56 + 0)
.s55:
15bb : e6 58 __ INC T5 + 1 
.s56:
15bd : a5 56 __ LDA T4 + 1 
15bf : 8d e8 c7 STA $c7e8 ; (sstack + 42)
15c2 : c8 __ __ INY
15c3 : c4 5f __ CPY T9 + 0 
15c5 : 90 bd __ BCC $1584 ; (bm_put_chars.l28 + 0)
.s53:
15c7 : 84 5d __ STY T8 + 0 
.s26:
15c9 : ad eb c7 LDA $c7eb ; (sstack + 45)
15cc : 18 __ __ CLC
15cd : 65 5d __ ADC T8 + 0 
15cf : 8d eb c7 STA $c7eb ; (sstack + 45)
15d2 : 90 03 __ BCC $15d7 ; (bm_put_chars.s58 + 0)
.s57:
15d4 : ee ec c7 INC $c7ec ; (sstack + 46)
.s58:
15d7 : a5 5f __ LDA T9 + 0 
15d9 : 38 __ __ SEC
15da : e5 5d __ SBC T8 + 0 
15dc : 8d ed c7 STA $c7ed ; (sstack + 47)
15df : ad e7 c7 LDA $c7e7 ; (sstack + 41)
15e2 : 85 43 __ STA T0 + 0 ; (x + 1)
15e4 : ad e8 c7 LDA $c7e8 ; (sstack + 42)
15e7 : 85 44 __ STA T0 + 1 ; (y + 0)
.s8:
15e9 : a9 00 __ LDA #$00
15eb : 85 5f __ STA T9 + 0 
15ed : ad ed c7 LDA $c7ed ; (sstack + 47)
15f0 : 85 60 __ STA T10 + 0 
15f2 : f0 5d __ BEQ $1651 ; (bm_put_chars.s9 + 0)
.s13:
15f4 : a5 44 __ LDA T0 + 1 ; (y + 0)
15f6 : c5 46 __ CMP T1 + 1 ; (str + 0)
15f8 : d0 08 __ BNE $1602 ; (bm_put_chars.s24 + 0)
.s21:
15fa : a5 43 __ LDA T0 + 0 ; (x + 1)
15fc : c5 45 __ CMP T1 + 0 ; (y + 1)
.s22:
15fe : 90 08 __ BCC $1608 ; (bm_put_chars.s14 + 0)
1600 : b0 4f __ BCS $1651 ; (bm_put_chars.s9 + 0)
.s24:
1602 : 45 46 __ EOR T1 + 1 ; (str + 0)
1604 : 10 f8 __ BPL $15fe ; (bm_put_chars.s22 + 0)
.s23:
1606 : 90 49 __ BCC $1651 ; (bm_put_chars.s9 + 0)
.s14:
1608 : ad eb c7 LDA $c7eb ; (sstack + 45)
160b : 85 1b __ STA ACCU + 0 
160d : ad ec c7 LDA $c7ec ; (sstack + 46)
1610 : 85 1c __ STA ACCU + 1 
1612 : a0 00 __ LDY #$00
.l15:
1614 : b1 1b __ LDA (ACCU + 0),y 
1616 : 38 __ __ SEC
1617 : e9 20 __ SBC #$20
1619 : aa __ __ TAX
161a : bd b6 48 LDA $48b6,x ; (TinyFont[0] + 96)
161d : 4a __ __ LSR
161e : 4a __ __ LSR
161f : 18 __ __ CLC
1620 : 69 01 __ ADC #$01
1622 : aa __ __ TAX
1623 : 65 57 __ ADC T5 + 0 
1625 : 85 57 __ STA T5 + 0 
1627 : 90 02 __ BCC $162b ; (bm_put_chars.s60 + 0)
.s59:
1629 : e6 58 __ INC T5 + 1 
.s60:
162b : c8 __ __ INY
162c : c4 60 __ CPY T10 + 0 
162e : b0 1f __ BCS $164f ; (bm_put_chars.s54 + 0)
.s16:
1630 : 8a __ __ TXA
1631 : 65 43 __ ADC T0 + 0 ; (x + 1)
1633 : 85 43 __ STA T0 + 0 ; (x + 1)
1635 : a5 44 __ LDA T0 + 1 ; (y + 0)
1637 : 69 00 __ ADC #$00
1639 : 85 44 __ STA T0 + 1 ; (y + 0)
163b : c5 46 __ CMP T1 + 1 ; (str + 0)
163d : d0 07 __ BNE $1646 ; (bm_put_chars.s20 + 0)
.s17:
163f : a5 43 __ LDA T0 + 0 ; (x + 1)
1641 : c5 45 __ CMP T1 + 0 ; (y + 1)
1643 : 4c 4d 16 JMP $164d ; (bm_put_chars.s18 + 0)
.s20:
1646 : 45 46 __ EOR T1 + 1 ; (str + 0)
1648 : 10 03 __ BPL $164d ; (bm_put_chars.s18 + 0)
164a : 4c 03 17 JMP $1703 ; (bm_put_chars.s19 + 0)
.s18:
164d : 90 c5 __ BCC $1614 ; (bm_put_chars.l15 + 0)
.s54:
164f : 84 5f __ STY T9 + 0 
.s9:
1651 : a5 5f __ LDA T9 + 0 
1653 : 85 12 __ STA P5 
1655 : ad e8 c7 LDA $c7e8 ; (sstack + 42)
1658 : 85 54 __ STA T3 + 1 
165a : a9 81 __ LDA #$81
165c : 85 0d __ STA P0 
165e : a9 4a __ LDA #$4a
1660 : 85 0e __ STA P1 
1662 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
1665 : 85 53 __ STA T3 + 0 
1667 : 29 07 __ AND #$07
1669 : 85 55 __ STA T4 + 0 
166b : 85 0f __ STA P2 
166d : ad eb c7 LDA $c7eb ; (sstack + 45)
1670 : 85 5d __ STA T8 + 0 
1672 : 85 10 __ STA P3 
1674 : ad ec c7 LDA $c7ec ; (sstack + 46)
1677 : 85 5e __ STA T8 + 1 
1679 : 85 11 __ STA P4 
167b : 20 0b 17 JSR $170b ; (bmu_text.s4 + 0)
167e : ad e3 c7 LDA $c7e3 ; (sstack + 37)
1681 : 8d ce c7 STA $c7ce ; (sstack + 16)
1684 : ad e4 c7 LDA $c7e4 ; (sstack + 38)
1687 : 8d cf c7 STA $c7cf ; (sstack + 17)
168a : a5 5b __ LDA T7 + 0 
168c : 8d d0 c7 STA $c7d0 ; (sstack + 18)
168f : a5 5c __ LDA T7 + 1 
1691 : 8d d1 c7 STA $c7d1 ; (sstack + 19)
1694 : a5 53 __ LDA T3 + 0 
1696 : 8d d2 c7 STA $c7d2 ; (sstack + 20)
1699 : a5 54 __ LDA T3 + 1 
169b : 8d d3 c7 STA $c7d3 ; (sstack + 21)
169e : a5 59 __ LDA T6 + 0 
16a0 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
16a3 : a5 5a __ LDA T6 + 1 
16a5 : 8d d5 c7 STA $c7d5 ; (sstack + 23)
16a8 : a9 81 __ LDA #$81
16aa : 8d d6 c7 STA $c7d6 ; (sstack + 24)
16ad : a9 4a __ LDA #$4a
16af : 8d d7 c7 STA $c7d7 ; (sstack + 25)
16b2 : a5 55 __ LDA T4 + 0 
16b4 : 8d d8 c7 STA $c7d8 ; (sstack + 26)
16b7 : a9 00 __ LDA #$00
16b9 : 8d d9 c7 STA $c7d9 ; (sstack + 27)
16bc : 8d da c7 STA $c7da ; (sstack + 28)
16bf : 8d db c7 STA $c7db ; (sstack + 29)
16c2 : 8d df c7 STA $c7df ; (sstack + 33)
16c5 : 8d e0 c7 STA $c7e0 ; (sstack + 34)
16c8 : 8d e1 c7 STA $c7e1 ; (sstack + 35)
16cb : a5 1b __ LDA ACCU + 0 
16cd : 8d dc c7 STA $c7dc ; (sstack + 30)
16d0 : a5 1c __ LDA ACCU + 1 
16d2 : 8d dd c7 STA $c7dd ; (sstack + 31)
16d5 : a9 08 __ LDA #$08
16d7 : 8d de c7 STA $c7de ; (sstack + 32)
16da : ad ee c7 LDA $c7ee ; (sstack + 48)
16dd : 8d e2 c7 STA $c7e2 ; (sstack + 36)
16e0 : 20 b2 18 JSR $18b2 ; (bm_bitblit.s4 + 0)
.l10:
16e3 : a4 5f __ LDY T9 + 0 
16e5 : c4 60 __ CPY T10 + 0 
16e7 : 90 03 __ BCC $16ec ; (bm_put_chars.s12 + 0)
16e9 : 4c 3a 15 JMP $153a ; (bm_put_chars.s11 + 0)
.s12:
16ec : e6 5f __ INC T9 + 0 
16ee : b1 5d __ LDA (T8 + 0),y 
16f0 : e9 1f __ SBC #$1f
16f2 : aa __ __ TAX
16f3 : bd b6 48 LDA $48b6,x ; (TinyFont[0] + 96)
16f6 : 4a __ __ LSR
16f7 : 4a __ __ LSR
16f8 : 38 __ __ SEC
16f9 : 65 57 __ ADC T5 + 0 
16fb : 85 57 __ STA T5 + 0 
16fd : 90 e4 __ BCC $16e3 ; (bm_put_chars.l10 + 0)
.s61:
16ff : e6 58 __ INC T5 + 1 
1701 : b0 e0 __ BCS $16e3 ; (bm_put_chars.l10 + 0)
.s19:
1703 : b0 03 __ BCS $1708 ; (bm_put_chars.s19 + 5)
1705 : 4c 4f 16 JMP $164f ; (bm_put_chars.s54 + 0)
1708 : 4c 14 16 JMP $1614 ; (bm_put_chars.l15 + 0)
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
170b : a9 00 __ LDA #$00
170d : 8d a6 4a STA $4aa6 ; (tworks[0] + 0)
1710 : 8d a7 4a STA $4aa7 ; (tworks[0] + 1)
1713 : 8d a8 4a STA $4aa8 ; (tworks[0] + 2)
1716 : 8d a9 4a STA $4aa9 ; (tworks[0] + 3)
1719 : 8d aa 4a STA $4aaa ; (tworks[0] + 4)
171c : 8d ab 4a STA $4aab ; (tworks[0] + 5)
171f : 8d ac 4a STA $4aac ; (tworks[0] + 6)
1722 : 8d ad 4a STA $4aad ; (tworks[0] + 7)
1725 : 85 43 __ STA T0 + 0 
1727 : 85 44 __ STA T0 + 1 
1729 : a8 __ __ TAY
172a : b1 0d __ LDA (P0),y ; (bm + 0)
172c : 85 45 __ STA T1 + 0 
172e : c8 __ __ INY
172f : b1 0d __ LDA (P0),y ; (bm + 0)
1731 : 85 46 __ STA T1 + 1 
1733 : a5 12 __ LDA P5 ; (len + 0)
1735 : d0 03 __ BNE $173a ; (bmu_text.s8 + 0)
1737 : 4c 50 18 JMP $1850 ; (bmu_text.s5 + 0)
.s8:
173a : a9 00 __ LDA #$00
173c : 85 4c __ STA T7 + 0 
173e : 85 47 __ STA T2 + 0 
.l9:
1740 : a4 47 __ LDY T2 + 0 
1742 : b1 10 __ LDA (P3),y ; (str + 0)
1744 : 38 __ __ SEC
1745 : e9 20 __ SBC #$20
1747 : aa __ __ TAX
1748 : 18 __ __ CLC
1749 : a9 16 __ LDA #$16
174b : 7d 56 48 ADC $4856,x ; (TinyFont[0] + 0)
174e : 85 4a __ STA T6 + 0 
1750 : bd b6 48 LDA $48b6,x ; (TinyFont[0] + 96)
1753 : 29 03 __ AND #$03
1755 : 69 49 __ ADC #$49
1757 : 85 4b __ STA T6 + 1 
1759 : bd b6 48 LDA $48b6,x ; (TinyFont[0] + 96)
175c : 4a __ __ LSR
175d : 4a __ __ LSR
175e : 85 48 __ STA T4 + 0 
1760 : 38 __ __ SEC
1761 : 65 43 __ ADC T0 + 0 
1763 : 85 43 __ STA T0 + 0 
1765 : 90 02 __ BCC $1769 ; (bmu_text.s18 + 0)
.s17:
1767 : e6 44 __ INC T0 + 1 
.s18:
1769 : a9 00 __ LDA #$00
176b : 85 4d __ STA T8 + 0 
176d : a5 48 __ LDA T4 + 0 
176f : f0 75 __ BEQ $17e6 ; (bmu_text.s10 + 0)
.s16:
1771 : a0 00 __ LDY #$00
.l13:
1773 : b1 4a __ LDA (T6 + 0),y 
1775 : 85 49 __ STA T5 + 0 
1777 : a5 49 __ LDA T5 + 0 
1779 : 0a __ __ ASL
177a : 2e a6 4a ROL $4aa6 ; (tworks[0] + 0)
177d : 0a __ __ ASL
177e : 2e a7 4a ROL $4aa7 ; (tworks[0] + 1)
1781 : 0a __ __ ASL
1782 : 2e a8 4a ROL $4aa8 ; (tworks[0] + 2)
1785 : 0a __ __ ASL
1786 : 2e a9 4a ROL $4aa9 ; (tworks[0] + 3)
1789 : 0a __ __ ASL
178a : 2e aa 4a ROL $4aaa ; (tworks[0] + 4)
178d : 0a __ __ ASL
178e : 2e ab 4a ROL $4aab ; (tworks[0] + 5)
1791 : 0a __ __ ASL
1792 : 2e ac 4a ROL $4aac ; (tworks[0] + 6)
1795 : 0a __ __ ASL
1796 : 2e ad 4a ROL $4aad ; (tworks[0] + 7)
1799 : e6 0f __ INC P2 ; (lx + 0)
179b : a5 0f __ LDA P2 ; (lx + 0)
179d : c9 08 __ CMP #$08
179f : d0 3d __ BNE $17de ; (bmu_text.s14 + 0)
.s15:
17a1 : ad a6 4a LDA $4aa6 ; (tworks[0] + 0)
17a4 : a0 00 __ LDY #$00
17a6 : 84 0f __ STY P2 ; (lx + 0)
17a8 : 91 45 __ STA (T1 + 0),y 
17aa : ad a7 4a LDA $4aa7 ; (tworks[0] + 1)
17ad : c8 __ __ INY
17ae : 91 45 __ STA (T1 + 0),y 
17b0 : ad a8 4a LDA $4aa8 ; (tworks[0] + 2)
17b3 : c8 __ __ INY
17b4 : 91 45 __ STA (T1 + 0),y 
17b6 : ad a9 4a LDA $4aa9 ; (tworks[0] + 3)
17b9 : c8 __ __ INY
17ba : 91 45 __ STA (T1 + 0),y 
17bc : ad aa 4a LDA $4aaa ; (tworks[0] + 4)
17bf : c8 __ __ INY
17c0 : 91 45 __ STA (T1 + 0),y 
17c2 : ad ab 4a LDA $4aab ; (tworks[0] + 5)
17c5 : c8 __ __ INY
17c6 : 91 45 __ STA (T1 + 0),y 
17c8 : ad ac 4a LDA $4aac ; (tworks[0] + 6)
17cb : c8 __ __ INY
17cc : 91 45 __ STA (T1 + 0),y 
17ce : ad ad 4a LDA $4aad ; (tworks[0] + 7)
17d1 : c8 __ __ INY
17d2 : 91 45 __ STA (T1 + 0),y 
17d4 : a5 45 __ LDA T1 + 0 
17d6 : 69 07 __ ADC #$07
17d8 : 85 45 __ STA T1 + 0 
17da : 90 02 __ BCC $17de ; (bmu_text.s14 + 0)
.s19:
17dc : e6 46 __ INC T1 + 1 
.s14:
17de : e6 4d __ INC T8 + 0 
17e0 : a4 4d __ LDY T8 + 0 
17e2 : c4 48 __ CPY T4 + 0 
17e4 : 90 8d __ BCC $1773 ; (bmu_text.l13 + 0)
.s10:
17e6 : 0e a6 4a ASL $4aa6 ; (tworks[0] + 0)
17e9 : 0e a7 4a ASL $4aa7 ; (tworks[0] + 1)
17ec : 0e a8 4a ASL $4aa8 ; (tworks[0] + 2)
17ef : 0e a9 4a ASL $4aa9 ; (tworks[0] + 3)
17f2 : 0e aa 4a ASL $4aaa ; (tworks[0] + 4)
17f5 : 0e ab 4a ASL $4aab ; (tworks[0] + 5)
17f8 : 0e ac 4a ASL $4aac ; (tworks[0] + 6)
17fb : 0e ad 4a ASL $4aad ; (tworks[0] + 7)
17fe : e6 0f __ INC P2 ; (lx + 0)
1800 : a5 0f __ LDA P2 ; (lx + 0)
1802 : c9 08 __ CMP #$08
1804 : d0 3d __ BNE $1843 ; (bmu_text.s11 + 0)
.s12:
1806 : ad a6 4a LDA $4aa6 ; (tworks[0] + 0)
1809 : a0 00 __ LDY #$00
180b : 84 0f __ STY P2 ; (lx + 0)
180d : 91 45 __ STA (T1 + 0),y 
180f : ad a7 4a LDA $4aa7 ; (tworks[0] + 1)
1812 : c8 __ __ INY
1813 : 91 45 __ STA (T1 + 0),y 
1815 : ad a8 4a LDA $4aa8 ; (tworks[0] + 2)
1818 : c8 __ __ INY
1819 : 91 45 __ STA (T1 + 0),y 
181b : ad a9 4a LDA $4aa9 ; (tworks[0] + 3)
181e : c8 __ __ INY
181f : 91 45 __ STA (T1 + 0),y 
1821 : ad aa 4a LDA $4aaa ; (tworks[0] + 4)
1824 : c8 __ __ INY
1825 : 91 45 __ STA (T1 + 0),y 
1827 : ad ab 4a LDA $4aab ; (tworks[0] + 5)
182a : c8 __ __ INY
182b : 91 45 __ STA (T1 + 0),y 
182d : ad ac 4a LDA $4aac ; (tworks[0] + 6)
1830 : c8 __ __ INY
1831 : 91 45 __ STA (T1 + 0),y 
1833 : ad ad 4a LDA $4aad ; (tworks[0] + 7)
1836 : c8 __ __ INY
1837 : 91 45 __ STA (T1 + 0),y 
1839 : a5 45 __ LDA T1 + 0 
183b : 69 07 __ ADC #$07
183d : 85 45 __ STA T1 + 0 
183f : 90 02 __ BCC $1843 ; (bmu_text.s11 + 0)
.s20:
1841 : e6 46 __ INC T1 + 1 
.s11:
1843 : e6 47 __ INC T2 + 0 
1845 : e6 4c __ INC T7 + 0 
1847 : a5 4c __ LDA T7 + 0 
1849 : c5 12 __ CMP P5 ; (len + 0)
184b : b0 03 __ BCS $1850 ; (bmu_text.s5 + 0)
184d : 4c 40 17 JMP $1740 ; (bmu_text.l9 + 0)
.s5:
1850 : a5 0f __ LDA P2 ; (lx + 0)
1852 : 85 47 __ STA T2 + 0 
1854 : c9 08 __ CMP #$08
1856 : b0 20 __ BCS $1878 ; (bmu_text.s6 + 0)
.l7:
1858 : 0e a6 4a ASL $4aa6 ; (tworks[0] + 0)
185b : 0e a7 4a ASL $4aa7 ; (tworks[0] + 1)
185e : 0e a8 4a ASL $4aa8 ; (tworks[0] + 2)
1861 : 0e a9 4a ASL $4aa9 ; (tworks[0] + 3)
1864 : 0e aa 4a ASL $4aaa ; (tworks[0] + 4)
1867 : 0e ab 4a ASL $4aab ; (tworks[0] + 5)
186a : 0e ac 4a ASL $4aac ; (tworks[0] + 6)
186d : 0e ad 4a ASL $4aad ; (tworks[0] + 7)
1870 : e6 47 __ INC T2 + 0 
1872 : a5 47 __ LDA T2 + 0 
1874 : c9 08 __ CMP #$08
1876 : 90 e0 __ BCC $1858 ; (bmu_text.l7 + 0)
.s6:
1878 : ad a6 4a LDA $4aa6 ; (tworks[0] + 0)
187b : a0 00 __ LDY #$00
187d : 91 45 __ STA (T1 + 0),y 
187f : ad a7 4a LDA $4aa7 ; (tworks[0] + 1)
1882 : c8 __ __ INY
1883 : 91 45 __ STA (T1 + 0),y 
1885 : ad a8 4a LDA $4aa8 ; (tworks[0] + 2)
1888 : c8 __ __ INY
1889 : 91 45 __ STA (T1 + 0),y 
188b : ad a9 4a LDA $4aa9 ; (tworks[0] + 3)
188e : c8 __ __ INY
188f : 91 45 __ STA (T1 + 0),y 
1891 : ad aa 4a LDA $4aaa ; (tworks[0] + 4)
1894 : c8 __ __ INY
1895 : 91 45 __ STA (T1 + 0),y 
1897 : ad ab 4a LDA $4aab ; (tworks[0] + 5)
189a : c8 __ __ INY
189b : 91 45 __ STA (T1 + 0),y 
189d : ad ac 4a LDA $4aac ; (tworks[0] + 6)
18a0 : c8 __ __ INY
18a1 : 91 45 __ STA (T1 + 0),y 
18a3 : ad ad 4a LDA $4aad ; (tworks[0] + 7)
18a6 : c8 __ __ INY
18a7 : 91 45 __ STA (T1 + 0),y 
18a9 : a5 43 __ LDA T0 + 0 
18ab : 85 1b __ STA ACCU + 0 
18ad : a5 44 __ LDA T0 + 1 
18af : 85 1c __ STA ACCU + 1 
.s3:
18b1 : 60 __ __ RTS
--------------------------------------------------------------------
bm_bitblit: ; bm_bitblit(const struct Bitmap*,const struct ClipRect*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 135, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
18b2 : ad d0 c7 LDA $c7d0 ; (sstack + 18)
18b5 : 85 43 __ STA T0 + 0 
18b7 : ad d1 c7 LDA $c7d1 ; (sstack + 19)
18ba : 85 44 __ STA T0 + 1 
18bc : ad d2 c7 LDA $c7d2 ; (sstack + 20)
18bf : 38 __ __ SEC
18c0 : a0 00 __ LDY #$00
18c2 : f1 43 __ SBC (T0 + 0),y 
18c4 : 85 45 __ STA T1 + 0 
18c6 : ad d3 c7 LDA $c7d3 ; (sstack + 21)
18c9 : c8 __ __ INY
18ca : f1 43 __ SBC (T0 + 0),y 
18cc : 10 35 __ BPL $1903 ; (bm_bitblit.s5 + 0)
.s16:
18ce : 85 46 __ STA T1 + 1 
18d0 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
18d3 : 38 __ __ SEC
18d4 : e5 45 __ SBC T1 + 0 
18d6 : 8d d2 c7 STA $c7d2 ; (sstack + 20)
18d9 : ad d3 c7 LDA $c7d3 ; (sstack + 21)
18dc : e5 46 __ SBC T1 + 1 
18de : 8d d3 c7 STA $c7d3 ; (sstack + 21)
18e1 : ad d8 c7 LDA $c7d8 ; (sstack + 26)
18e4 : 38 __ __ SEC
18e5 : e5 45 __ SBC T1 + 0 
18e7 : 8d d8 c7 STA $c7d8 ; (sstack + 26)
18ea : ad d9 c7 LDA $c7d9 ; (sstack + 27)
18ed : e5 46 __ SBC T1 + 1 
18ef : 8d d9 c7 STA $c7d9 ; (sstack + 27)
18f2 : ad dc c7 LDA $c7dc ; (sstack + 30)
18f5 : 18 __ __ CLC
18f6 : 65 45 __ ADC T1 + 0 
18f8 : 8d dc c7 STA $c7dc ; (sstack + 30)
18fb : ad dd c7 LDA $c7dd ; (sstack + 31)
18fe : 65 46 __ ADC T1 + 1 
1900 : 8d dd c7 STA $c7dd ; (sstack + 31)
.s5:
1903 : ad d4 c7 LDA $c7d4 ; (sstack + 22)
1906 : 38 __ __ SEC
1907 : a0 02 __ LDY #$02
1909 : f1 43 __ SBC (T0 + 0),y 
190b : 85 47 __ STA T2 + 0 
190d : ad d5 c7 LDA $c7d5 ; (sstack + 23)
1910 : c8 __ __ INY
1911 : f1 43 __ SBC (T0 + 0),y 
1913 : 10 35 __ BPL $194a ; (bm_bitblit.s6 + 0)
.s15:
1915 : 85 48 __ STA T2 + 1 
1917 : ad d4 c7 LDA $c7d4 ; (sstack + 22)
191a : 38 __ __ SEC
191b : e5 47 __ SBC T2 + 0 
191d : 8d d4 c7 STA $c7d4 ; (sstack + 22)
1920 : ad d5 c7 LDA $c7d5 ; (sstack + 23)
1923 : e5 48 __ SBC T2 + 1 
1925 : 8d d5 c7 STA $c7d5 ; (sstack + 23)
1928 : ad da c7 LDA $c7da ; (sstack + 28)
192b : 38 __ __ SEC
192c : e5 47 __ SBC T2 + 0 
192e : 8d da c7 STA $c7da ; (sstack + 28)
1931 : ad db c7 LDA $c7db ; (sstack + 29)
1934 : e5 48 __ SBC T2 + 1 
1936 : 8d db c7 STA $c7db ; (sstack + 29)
1939 : ad de c7 LDA $c7de ; (sstack + 32)
193c : 18 __ __ CLC
193d : 65 47 __ ADC T2 + 0 
193f : 8d de c7 STA $c7de ; (sstack + 32)
1942 : ad df c7 LDA $c7df ; (sstack + 33)
1945 : 65 48 __ ADC T2 + 1 
1947 : 8d df c7 STA $c7df ; (sstack + 33)
.s6:
194a : a0 04 __ LDY #$04
194c : b1 43 __ LDA (T0 + 0),y 
194e : 38 __ __ SEC
194f : ed d2 c7 SBC $c7d2 ; (sstack + 20)
1952 : aa __ __ TAX
1953 : c8 __ __ INY
1954 : b1 43 __ LDA (T0 + 0),y 
1956 : ed d3 c7 SBC $c7d3 ; (sstack + 21)
1959 : a8 __ __ TAY
195a : 8a __ __ TXA
195b : 38 __ __ SEC
195c : ed dc c7 SBC $c7dc ; (sstack + 30)
195f : 85 45 __ STA T1 + 0 
1961 : 98 __ __ TYA
1962 : ed dd c7 SBC $c7dd ; (sstack + 31)
1965 : 10 11 __ BPL $1978 ; (bm_bitblit.s7 + 0)
.s14:
1967 : aa __ __ TAX
1968 : ad dc c7 LDA $c7dc ; (sstack + 30)
196b : 18 __ __ CLC
196c : 65 45 __ ADC T1 + 0 
196e : 8d dc c7 STA $c7dc ; (sstack + 30)
1971 : 8a __ __ TXA
1972 : 6d dd c7 ADC $c7dd ; (sstack + 31)
1975 : 8d dd c7 STA $c7dd ; (sstack + 31)
.s7:
1978 : a0 07 __ LDY #$07
197a : b1 43 __ LDA (T0 + 0),y 
197c : 85 1c __ STA ACCU + 1 
197e : 38 __ __ SEC
197f : 88 __ __ DEY
1980 : b1 43 __ LDA (T0 + 0),y 
1982 : 85 1b __ STA ACCU + 0 
1984 : ed d4 c7 SBC $c7d4 ; (sstack + 22)
1987 : a8 __ __ TAY
1988 : a5 1c __ LDA ACCU + 1 
198a : ed d5 c7 SBC $c7d5 ; (sstack + 23)
198d : aa __ __ TAX
198e : 98 __ __ TYA
198f : 38 __ __ SEC
1990 : ed de c7 SBC $c7de ; (sstack + 32)
1993 : 85 43 __ STA T0 + 0 
1995 : 8a __ __ TXA
1996 : ed df c7 SBC $c7df ; (sstack + 33)
1999 : 10 11 __ BPL $19ac ; (bm_bitblit.s8 + 0)
.s13:
199b : aa __ __ TAX
199c : ad de c7 LDA $c7de ; (sstack + 32)
199f : 18 __ __ CLC
19a0 : 65 43 __ ADC T0 + 0 
19a2 : 8d de c7 STA $c7de ; (sstack + 32)
19a5 : 8a __ __ TXA
19a6 : 6d df c7 ADC $c7df ; (sstack + 33)
19a9 : 8d df c7 STA $c7df ; (sstack + 33)
.s8:
19ac : ad dd c7 LDA $c7dd ; (sstack + 31)
19af : 30 0f __ BMI $19c0 ; (bm_bitblit.s3 + 0)
.s12:
19b1 : 0d dc c7 ORA $c7dc ; (sstack + 30)
19b4 : f0 0a __ BEQ $19c0 ; (bm_bitblit.s3 + 0)
.s9:
19b6 : ad df c7 LDA $c7df ; (sstack + 33)
19b9 : 30 05 __ BMI $19c0 ; (bm_bitblit.s3 + 0)
.s11:
19bb : 0d de c7 ORA $c7de ; (sstack + 32)
19be : d0 01 __ BNE $19c1 ; (bm_bitblit.s10 + 0)
.s3:
19c0 : 60 __ __ RTS
.s10:
19c1 : ad ce c7 LDA $c7ce ; (sstack + 16)
19c4 : 85 16 __ STA P9 
19c6 : ad cf c7 LDA $c7cf ; (sstack + 17)
19c9 : 85 17 __ STA P10 
19cb : ad e2 c7 LDA $c7e2 ; (sstack + 36)
19ce : 85 18 __ STA P11 
19d0 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
19d3 : 8d be c7 STA $c7be ; (sstack + 0)
19d6 : ad d3 c7 LDA $c7d3 ; (sstack + 21)
19d9 : 8d bf c7 STA $c7bf ; (sstack + 1)
19dc : ad d4 c7 LDA $c7d4 ; (sstack + 22)
19df : 8d c0 c7 STA $c7c0 ; (sstack + 2)
19e2 : ad d5 c7 LDA $c7d5 ; (sstack + 23)
19e5 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
19e8 : ad d6 c7 LDA $c7d6 ; (sstack + 24)
19eb : 8d c2 c7 STA $c7c2 ; (sstack + 4)
19ee : ad d7 c7 LDA $c7d7 ; (sstack + 25)
19f1 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
19f4 : ad d8 c7 LDA $c7d8 ; (sstack + 26)
19f7 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
19fa : ad d9 c7 LDA $c7d9 ; (sstack + 27)
19fd : 8d c5 c7 STA $c7c5 ; (sstack + 7)
1a00 : ad da c7 LDA $c7da ; (sstack + 28)
1a03 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
1a06 : ad db c7 LDA $c7db ; (sstack + 29)
1a09 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
1a0c : ad dc c7 LDA $c7dc ; (sstack + 30)
1a0f : 8d c8 c7 STA $c7c8 ; (sstack + 10)
1a12 : ad dd c7 LDA $c7dd ; (sstack + 31)
1a15 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
1a18 : ad de c7 LDA $c7de ; (sstack + 32)
1a1b : 8d ca c7 STA $c7ca ; (sstack + 12)
1a1e : ad df c7 LDA $c7df ; (sstack + 33)
1a21 : 8d cb c7 STA $c7cb ; (sstack + 13)
1a24 : ad e0 c7 LDA $c7e0 ; (sstack + 34)
1a27 : 8d cc c7 STA $c7cc ; (sstack + 14)
1a2a : ad e1 c7 LDA $c7e1 ; (sstack + 35)
1a2d : 8d cd c7 STA $c7cd ; (sstack + 15)
1a30 : 4c 33 1a JMP $1a33 ; (bmu_bitblit.s1 + 0)
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
1a33 : a5 53 __ LDA T6 + 0 
1a35 : 8d b8 c7 STA $c7b8 ; (bmu_bitblit@stack + 0)
1a38 : a5 54 __ LDA T6 + 1 
1a3a : 8d b9 c7 STA $c7b9 ; (bmu_bitblit@stack + 1)
1a3d : a5 55 __ LDA T8 + 0 
1a3f : 8d ba c7 STA $c7ba ; (bmu_bitblit@stack + 2)
.s4:
1a42 : ad be c7 LDA $c7be ; (sstack + 0)
1a45 : 85 4e __ STA T2 + 0 
1a47 : 18 __ __ CLC
1a48 : 6d c8 c7 ADC $c7c8 ; (sstack + 10)
1a4b : 85 45 __ STA T1 + 0 
1a4d : 29 07 __ AND #$07
1a4f : aa __ __ TAX
1a50 : bd 91 4a LDA $4a91,x ; (rmask[0] + 0)
1a53 : 85 13 __ STA P6 
1a55 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
1a58 : 6d bf c7 ADC $c7bf ; (sstack + 1)
1a5b : 4a __ __ LSR
1a5c : 66 45 __ ROR T1 + 0 
1a5e : 4a __ __ LSR
1a5f : 66 45 __ ROR T1 + 0 
1a61 : 4a __ __ LSR
1a62 : 66 45 __ ROR T1 + 0 
1a64 : ad bf c7 LDA $c7bf ; (sstack + 1)
1a67 : 4a __ __ LSR
1a68 : 66 4e __ ROR T2 + 0 
1a6a : 4a __ __ LSR
1a6b : 66 4e __ ROR T2 + 0 
1a6d : 4a __ __ LSR
1a6e : 66 4e __ ROR T2 + 0 
1a70 : 38 __ __ SEC
1a71 : a5 45 __ LDA T1 + 0 
1a73 : e5 4e __ SBC T2 + 0 
1a75 : 85 11 __ STA P4 
1a77 : ad be c7 LDA $c7be ; (sstack + 0)
1a7a : 29 07 __ AND #$07
1a7c : 85 4e __ STA T2 + 0 
1a7e : aa __ __ TAX
1a7f : bd 89 4a LDA $4a89,x ; (lmask[0] + 0)
1a82 : 85 4c __ STA T10 + 0 
1a84 : 85 12 __ STA P5 
1a86 : ad c2 c7 LDA $c7c2 ; (sstack + 4)
1a89 : 85 49 __ STA T4 + 0 
1a8b : ad c3 c7 LDA $c7c3 ; (sstack + 5)
1a8e : 85 4a __ STA T4 + 1 
1a90 : a5 16 __ LDA P9 ; (dbm + 0)
1a92 : c5 49 __ CMP T4 + 0 
1a94 : d0 78 __ BNE $1b0e ; (bmu_bitblit.s5 + 0)
.s52:
1a96 : a5 17 __ LDA P10 ; (dbm + 1)
1a98 : c5 4a __ CMP T4 + 1 
1a9a : d0 72 __ BNE $1b0e ; (bmu_bitblit.s5 + 0)
.s38:
1a9c : ad c7 c7 LDA $c7c7 ; (sstack + 9)
1a9f : cd c1 c7 CMP $c7c1 ; (sstack + 3)
1aa2 : d0 0a __ BNE $1aae ; (bmu_bitblit.s51 + 0)
.s48:
1aa4 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
1aa7 : cd c0 c7 CMP $c7c0 ; (sstack + 2)
.s49:
1aaa : b0 09 __ BCS $1ab5 ; (bmu_bitblit.s39 + 0)
1aac : 90 30 __ BCC $1ade ; (bmu_bitblit.s41 + 0)
.s51:
1aae : 4d c1 c7 EOR $c7c1 ; (sstack + 3)
1ab1 : 10 f7 __ BPL $1aaa ; (bmu_bitblit.s49 + 0)
.s50:
1ab3 : b0 29 __ BCS $1ade ; (bmu_bitblit.s41 + 0)
.s39:
1ab5 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
1ab8 : cd c7 c7 CMP $c7c7 ; (sstack + 9)
1abb : d0 51 __ BNE $1b0e ; (bmu_bitblit.s5 + 0)
.s47:
1abd : ad c0 c7 LDA $c7c0 ; (sstack + 2)
1ac0 : cd c6 c7 CMP $c7c6 ; (sstack + 8)
1ac3 : d0 49 __ BNE $1b0e ; (bmu_bitblit.s5 + 0)
.s40:
1ac5 : ad c5 c7 LDA $c7c5 ; (sstack + 7)
1ac8 : cd bf c7 CMP $c7bf ; (sstack + 1)
1acb : d0 0a __ BNE $1ad7 ; (bmu_bitblit.s46 + 0)
.s43:
1acd : ad c4 c7 LDA $c7c4 ; (sstack + 6)
1ad0 : cd be c7 CMP $c7be ; (sstack + 0)
.s44:
1ad3 : 90 09 __ BCC $1ade ; (bmu_bitblit.s41 + 0)
1ad5 : b0 37 __ BCS $1b0e ; (bmu_bitblit.s5 + 0)
.s46:
1ad7 : 4d bf c7 EOR $c7bf ; (sstack + 1)
1ada : 10 f7 __ BPL $1ad3 ; (bmu_bitblit.s44 + 0)
.s45:
1adc : 90 30 __ BCC $1b0e ; (bmu_bitblit.s5 + 0)
.s41:
1ade : a5 18 __ LDA P11 ; (op + 0)
1ae0 : 29 08 __ AND #$08
1ae2 : f0 2a __ BEQ $1b0e ; (bmu_bitblit.s5 + 0)
.s42:
1ae4 : ad ca c7 LDA $c7ca ; (sstack + 12)
1ae7 : 18 __ __ CLC
1ae8 : 6d c6 c7 ADC $c7c6 ; (sstack + 8)
1aeb : 8d c6 c7 STA $c7c6 ; (sstack + 8)
1aee : ad cb c7 LDA $c7cb ; (sstack + 13)
1af1 : 6d c7 c7 ADC $c7c7 ; (sstack + 9)
1af4 : 8d c7 c7 STA $c7c7 ; (sstack + 9)
1af7 : ad ca c7 LDA $c7ca ; (sstack + 12)
1afa : 18 __ __ CLC
1afb : 6d c0 c7 ADC $c7c0 ; (sstack + 2)
1afe : 8d c0 c7 STA $c7c0 ; (sstack + 2)
1b01 : ad cb c7 LDA $c7cb ; (sstack + 13)
1b04 : 6d c1 c7 ADC $c7c1 ; (sstack + 3)
1b07 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
1b0a : a9 01 __ LDA #$01
1b0c : d0 02 __ BNE $1b10 ; (bmu_bitblit.s6 + 0)
.s5:
1b0e : a9 00 __ LDA #$00
.s6:
1b10 : 85 15 __ STA P8 
1b12 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
1b15 : 85 1c __ STA ACCU + 1 ; (dy + 1)
1b17 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
1b1a : 29 f8 __ AND #$f8
1b1c : 85 1b __ STA ACCU + 0 ; (dy + 0)
1b1e : a0 04 __ LDY #$04
1b20 : b1 16 __ LDA (P9),y ; (dbm + 0)
1b22 : 85 52 __ STA T7 + 0 
1b24 : 20 c2 41 JSR $41c2 ; (mul16by8 + 0)
1b27 : a0 00 __ LDY #$00
1b29 : b1 16 __ LDA (P9),y ; (dbm + 0)
1b2b : 18 __ __ CLC
1b2c : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1b2e : 85 02 __ STA $02 
1b30 : c8 __ __ INY
1b31 : b1 16 __ LDA (P9),y ; (dbm + 0)
1b33 : 65 1c __ ADC ACCU + 1 ; (dy + 1)
1b35 : aa __ __ TAX
1b36 : ad be c7 LDA $c7be ; (sstack + 0)
1b39 : 29 f8 __ AND #$f8
1b3b : 18 __ __ CLC
1b3c : 65 02 __ ADC $02 
1b3e : 85 47 __ STA T3 + 0 
1b40 : 8a __ __ TXA
1b41 : 6d bf c7 ADC $c7bf ; (sstack + 1)
1b44 : aa __ __ TAX
1b45 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
1b48 : 29 07 __ AND #$07
1b4a : 18 __ __ CLC
1b4b : 65 47 __ ADC T3 + 0 
1b4d : 85 53 __ STA T6 + 0 
1b4f : 90 01 __ BCC $1b52 ; (bmu_bitblit.s54 + 0)
.s53:
1b51 : e8 __ __ INX
.s54:
1b52 : 86 54 __ STX T6 + 1 
1b54 : ad c7 c7 LDA $c7c7 ; (sstack + 9)
1b57 : 85 1c __ STA ACCU + 1 ; (dy + 1)
1b59 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
1b5c : 29 f8 __ AND #$f8
1b5e : 85 1b __ STA ACCU + 0 ; (dy + 0)
1b60 : a0 04 __ LDY #$04
1b62 : b1 49 __ LDA (T4 + 0),y 
1b64 : 85 55 __ STA T8 + 0 
1b66 : 20 c2 41 JSR $41c2 ; (mul16by8 + 0)
1b69 : a0 00 __ LDY #$00
1b6b : b1 49 __ LDA (T4 + 0),y 
1b6d : 18 __ __ CLC
1b6e : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1b70 : 85 02 __ STA $02 
1b72 : c8 __ __ INY
1b73 : b1 49 __ LDA (T4 + 0),y 
1b75 : 65 1c __ ADC ACCU + 1 ; (dy + 1)
1b77 : aa __ __ TAX
1b78 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
1b7b : 29 f8 __ AND #$f8
1b7d : 18 __ __ CLC
1b7e : 65 02 __ ADC $02 
1b80 : 85 49 __ STA T4 + 0 
1b82 : 8a __ __ TXA
1b83 : 6d c5 c7 ADC $c7c5 ; (sstack + 7)
1b86 : aa __ __ TAX
1b87 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
1b8a : 29 07 __ AND #$07
1b8c : 18 __ __ CLC
1b8d : 65 49 __ ADC T4 + 0 
1b8f : 85 49 __ STA T4 + 0 
1b91 : 90 01 __ BCC $1b94 ; (bmu_bitblit.s56 + 0)
.s55:
1b93 : e8 __ __ INX
.s56:
1b94 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
1b97 : 29 07 __ AND #$07
1b99 : 49 ff __ EOR #$ff
1b9b : 38 __ __ SEC
1b9c : 65 4e __ ADC T2 + 0 
1b9e : 85 43 __ STA T0 + 0 
1ba0 : 29 07 __ AND #$07
1ba2 : 85 10 __ STA P3 
1ba4 : a5 15 __ LDA P8 
1ba6 : f0 03 __ BEQ $1bab ; (bmu_bitblit.s7 + 0)
1ba8 : 4c 9a 1d JMP $1d9a ; (bmu_bitblit.s36 + 0)
.s7:
1bab : 86 51 __ STX T5 + 1 
1bad : a4 49 __ LDY T4 + 0 
1baf : 84 50 __ STY T5 + 0 
1bb1 : a5 43 __ LDA T0 + 0 
1bb3 : f0 0d __ BEQ $1bc2 ; (bmu_bitblit.s8 + 0)
.s34:
1bb5 : 30 0b __ BMI $1bc2 ; (bmu_bitblit.s8 + 0)
.s35:
1bb7 : 98 __ __ TYA
1bb8 : 18 __ __ CLC
1bb9 : 69 f8 __ ADC #$f8
1bbb : 85 50 __ STA T5 + 0 
1bbd : 8a __ __ TXA
1bbe : 69 ff __ ADC #$ff
1bc0 : 85 51 __ STA T5 + 1 
.s8:
1bc2 : a5 18 __ LDA P11 ; (op + 0)
1bc4 : 85 14 __ STA P7 
1bc6 : 20 e5 1d JSR $1de5 ; (builddop.s4 + 0)
1bc9 : 18 __ __ CLC
1bca : a5 52 __ LDA T7 + 0 
1bcc : 69 ff __ ADC #$ff
1bce : 2a __ __ ROL
1bcf : 2a __ __ ROL
1bd0 : 2a __ __ ROL
1bd1 : aa __ __ TAX
1bd2 : 29 f8 __ AND #$f8
1bd4 : 85 43 __ STA T0 + 0 
1bd6 : 8a __ __ TXA
1bd7 : 29 07 __ AND #$07
1bd9 : 2a __ __ ROL
1bda : 69 f8 __ ADC #$f8
1bdc : 85 44 __ STA T0 + 1 
1bde : ad cc c7 LDA $c7cc ; (sstack + 14)
1be1 : 85 45 __ STA T1 + 0 
1be3 : 85 47 __ STA T3 + 0 
1be5 : ad cd c7 LDA $c7cd ; (sstack + 15)
1be8 : 85 46 __ STA T1 + 1 
1bea : a5 18 __ LDA P11 ; (op + 0)
1bec : 29 08 __ AND #$08
1bee : f0 03 __ BEQ $1bf3 ; (bmu_bitblit.s9 + 0)
1bf0 : 4c 8d 1c JMP $1c8d ; (bmu_bitblit.s19 + 0)
.s9:
1bf3 : ad ca c7 LDA $c7ca ; (sstack + 12)
1bf6 : 85 47 __ STA T3 + 0 
1bf8 : a5 18 __ LDA P11 ; (op + 0)
1bfa : 29 20 __ AND #$20
1bfc : d0 4c __ BNE $1c4a ; (bmu_bitblit.s15 + 0)
.s10:
1bfe : a5 47 __ LDA T3 + 0 
1c00 : f0 38 __ BEQ $1c3a ; (bmu_bitblit.s3 + 0)
.s11:
1c02 : a9 00 __ LDA #$00
1c04 : 85 4e __ STA T2 + 0 
.l12:
1c06 : a5 53 __ LDA T6 + 0 
1c08 : 85 03 __ STA WORK + 0 
1c0a : a5 54 __ LDA T6 + 1 
1c0c : 85 04 __ STA WORK + 1 
1c0e : a5 53 __ LDA T6 + 0 
1c10 : 85 05 __ STA WORK + 2 
1c12 : a5 54 __ LDA T6 + 1 
1c14 : 85 06 __ STA WORK + 3 
1c16 : a5 4e __ LDA T2 + 0 
1c18 : 85 07 __ STA WORK + 4 
1c1a : 20 00 4d JSR $4d00 ; (BLIT_CODE[0] + 0)
1c1d : e6 53 __ INC T6 + 0 
1c1f : d0 02 __ BNE $1c23 ; (bmu_bitblit.s69 + 0)
.s68:
1c21 : e6 54 __ INC T6 + 1 
.s69:
1c23 : a5 53 __ LDA T6 + 0 
1c25 : 29 07 __ AND #$07
1c27 : d0 0d __ BNE $1c36 ; (bmu_bitblit.s13 + 0)
.s14:
1c29 : 18 __ __ CLC
1c2a : a5 53 __ LDA T6 + 0 
1c2c : 65 43 __ ADC T0 + 0 
1c2e : 85 53 __ STA T6 + 0 
1c30 : a5 54 __ LDA T6 + 1 
1c32 : 65 44 __ ADC T0 + 1 
1c34 : 85 54 __ STA T6 + 1 
.s13:
1c36 : c6 47 __ DEC T3 + 0 
1c38 : d0 cc __ BNE $1c06 ; (bmu_bitblit.l12 + 0)
.s3:
1c3a : ad b8 c7 LDA $c7b8 ; (bmu_bitblit@stack + 0)
1c3d : 85 53 __ STA T6 + 0 
1c3f : ad b9 c7 LDA $c7b9 ; (bmu_bitblit@stack + 1)
1c42 : 85 54 __ STA T6 + 1 
1c44 : ad ba c7 LDA $c7ba ; (bmu_bitblit@stack + 2)
1c47 : 85 55 __ STA T8 + 0 
1c49 : 60 __ __ RTS
.s15:
1c4a : a5 47 __ LDA T3 + 0 
1c4c : f0 ec __ BEQ $1c3a ; (bmu_bitblit.s3 + 0)
.l16:
1c4e : a5 53 __ LDA T6 + 0 
1c50 : 29 07 __ AND #$07
1c52 : a8 __ __ TAY
1c53 : b1 45 __ LDA (T1 + 0),y 
1c55 : 85 4e __ STA T2 + 0 
1c57 : a5 53 __ LDA T6 + 0 
1c59 : 85 03 __ STA WORK + 0 
1c5b : a5 54 __ LDA T6 + 1 
1c5d : 85 04 __ STA WORK + 1 
1c5f : a5 53 __ LDA T6 + 0 
1c61 : 85 05 __ STA WORK + 2 
1c63 : a5 54 __ LDA T6 + 1 
1c65 : 85 06 __ STA WORK + 3 
1c67 : a5 4e __ LDA T2 + 0 
1c69 : 85 07 __ STA WORK + 4 
1c6b : 20 00 4d JSR $4d00 ; (BLIT_CODE[0] + 0)
1c6e : e6 53 __ INC T6 + 0 
1c70 : d0 02 __ BNE $1c74 ; (bmu_bitblit.s67 + 0)
.s66:
1c72 : e6 54 __ INC T6 + 1 
.s67:
1c74 : a5 53 __ LDA T6 + 0 
1c76 : 29 07 __ AND #$07
1c78 : d0 0d __ BNE $1c87 ; (bmu_bitblit.s17 + 0)
.s18:
1c7a : 18 __ __ CLC
1c7b : a5 53 __ LDA T6 + 0 
1c7d : 65 43 __ ADC T0 + 0 
1c7f : 85 53 __ STA T6 + 0 
1c81 : a5 54 __ LDA T6 + 1 
1c83 : 65 44 __ ADC T0 + 1 
1c85 : 85 54 __ STA T6 + 1 
.s17:
1c87 : c6 47 __ DEC T3 + 0 
1c89 : d0 c3 __ BNE $1c4e ; (bmu_bitblit.l16 + 0)
1c8b : f0 ad __ BEQ $1c3a ; (bmu_bitblit.s3 + 0)
.s19:
1c8d : 18 __ __ CLC
1c8e : a5 55 __ LDA T8 + 0 
1c90 : 69 ff __ ADC #$ff
1c92 : 2a __ __ ROL
1c93 : 2a __ __ ROL
1c94 : 2a __ __ ROL
1c95 : aa __ __ TAX
1c96 : 29 f8 __ AND #$f8
1c98 : 85 4e __ STA T2 + 0 
1c9a : 8a __ __ TXA
1c9b : 29 07 __ AND #$07
1c9d : 2a __ __ ROL
1c9e : 69 f8 __ ADC #$f8
1ca0 : 85 4f __ STA T2 + 1 
1ca2 : a5 46 __ LDA T1 + 1 
1ca4 : 85 48 __ STA T3 + 1 
1ca6 : 05 45 __ ORA T1 + 0 
1ca8 : d0 08 __ BNE $1cb2 ; (bmu_bitblit.s21 + 0)
.s20:
1caa : a5 50 __ LDA T5 + 0 
1cac : 85 47 __ STA T3 + 0 
1cae : a5 51 __ LDA T5 + 1 
1cb0 : 85 48 __ STA T3 + 1 
.s21:
1cb2 : ad ca c7 LDA $c7ca ; (sstack + 12)
1cb5 : 85 45 __ STA T1 + 0 
1cb7 : a5 15 __ LDA P8 
1cb9 : d0 03 __ BNE $1cbe ; (bmu_bitblit.s28 + 0)
1cbb : 4c 3d 1d JMP $1d3d ; (bmu_bitblit.s22 + 0)
.s28:
1cbe : 38 __ __ SEC
1cbf : a9 00 __ LDA #$00
1cc1 : e5 43 __ SBC T0 + 0 
1cc3 : 85 43 __ STA T0 + 0 
1cc5 : a9 00 __ LDA #$00
1cc7 : e5 44 __ SBC T0 + 1 
1cc9 : 85 44 __ STA T0 + 1 
1ccb : 38 __ __ SEC
1ccc : a9 00 __ LDA #$00
1cce : e5 4e __ SBC T2 + 0 
1cd0 : 85 4e __ STA T2 + 0 
1cd2 : a9 00 __ LDA #$00
1cd4 : e5 4f __ SBC T2 + 1 
1cd6 : 85 4f __ STA T2 + 1 
1cd8 : a5 45 __ LDA T1 + 0 
1cda : d0 03 __ BNE $1cdf ; (bmu_bitblit.l29 + 0)
1cdc : 4c 3a 1c JMP $1c3a ; (bmu_bitblit.s3 + 0)
.l29:
1cdf : a5 50 __ LDA T5 + 0 
1ce1 : 29 07 __ AND #$07
1ce3 : d0 0d __ BNE $1cf2 ; (bmu_bitblit.s30 + 0)
.s33:
1ce5 : 18 __ __ CLC
1ce6 : a5 50 __ LDA T5 + 0 
1ce8 : 65 4e __ ADC T2 + 0 
1cea : 85 50 __ STA T5 + 0 
1cec : a5 51 __ LDA T5 + 1 
1cee : 65 4f __ ADC T2 + 1 
1cf0 : 85 51 __ STA T5 + 1 
.s30:
1cf2 : a5 53 __ LDA T6 + 0 
1cf4 : 29 07 __ AND #$07
1cf6 : d0 0d __ BNE $1d05 ; (bmu_bitblit.s31 + 0)
.s32:
1cf8 : 18 __ __ CLC
1cf9 : a5 53 __ LDA T6 + 0 
1cfb : 65 43 __ ADC T0 + 0 
1cfd : 85 53 __ STA T6 + 0 
1cff : a5 54 __ LDA T6 + 1 
1d01 : 65 44 __ ADC T0 + 1 
1d03 : 85 54 __ STA T6 + 1 
.s31:
1d05 : 18 __ __ CLC
1d06 : a5 53 __ LDA T6 + 0 
1d08 : 69 ff __ ADC #$ff
1d0a : 85 53 __ STA T6 + 0 
1d0c : 29 07 __ AND #$07
1d0e : a8 __ __ TAY
1d0f : b0 02 __ BCS $1d13 ; (bmu_bitblit.s59 + 0)
.s58:
1d11 : c6 54 __ DEC T6 + 1 
.s59:
1d13 : b1 47 __ LDA (T3 + 0),y 
1d15 : 85 49 __ STA T4 + 0 
1d17 : a5 50 __ LDA T5 + 0 
1d19 : d0 02 __ BNE $1d1d ; (bmu_bitblit.s61 + 0)
.s60:
1d1b : c6 51 __ DEC T5 + 1 
.s61:
1d1d : c6 50 __ DEC T5 + 0 
1d1f : a5 50 __ LDA T5 + 0 
1d21 : 85 03 __ STA WORK + 0 
1d23 : a5 51 __ LDA T5 + 1 
1d25 : 85 04 __ STA WORK + 1 
1d27 : a5 53 __ LDA T6 + 0 
1d29 : 85 05 __ STA WORK + 2 
1d2b : a5 54 __ LDA T6 + 1 
1d2d : 85 06 __ STA WORK + 3 
1d2f : a5 49 __ LDA T4 + 0 
1d31 : 85 07 __ STA WORK + 4 
1d33 : 20 00 4d JSR $4d00 ; (BLIT_CODE[0] + 0)
1d36 : c6 45 __ DEC T1 + 0 
1d38 : d0 a5 __ BNE $1cdf ; (bmu_bitblit.l29 + 0)
1d3a : 4c 3a 1c JMP $1c3a ; (bmu_bitblit.s3 + 0)
.s22:
1d3d : a5 45 __ LDA T1 + 0 
1d3f : f0 f9 __ BEQ $1d3a ; (bmu_bitblit.s61 + 29)
.l23:
1d41 : a5 53 __ LDA T6 + 0 
1d43 : 29 07 __ AND #$07
1d45 : a8 __ __ TAY
1d46 : b1 47 __ LDA (T3 + 0),y 
1d48 : 85 49 __ STA T4 + 0 
1d4a : a5 50 __ LDA T5 + 0 
1d4c : 85 03 __ STA WORK + 0 
1d4e : a5 51 __ LDA T5 + 1 
1d50 : 85 04 __ STA WORK + 1 
1d52 : a5 53 __ LDA T6 + 0 
1d54 : 85 05 __ STA WORK + 2 
1d56 : a5 54 __ LDA T6 + 1 
1d58 : 85 06 __ STA WORK + 3 
1d5a : a5 49 __ LDA T4 + 0 
1d5c : 85 07 __ STA WORK + 4 
1d5e : 20 00 4d JSR $4d00 ; (BLIT_CODE[0] + 0)
1d61 : e6 50 __ INC T5 + 0 
1d63 : d0 02 __ BNE $1d67 ; (bmu_bitblit.s63 + 0)
.s62:
1d65 : e6 51 __ INC T5 + 1 
.s63:
1d67 : a5 50 __ LDA T5 + 0 
1d69 : 29 07 __ AND #$07
1d6b : d0 0d __ BNE $1d7a ; (bmu_bitblit.s24 + 0)
.s27:
1d6d : 18 __ __ CLC
1d6e : a5 50 __ LDA T5 + 0 
1d70 : 65 4e __ ADC T2 + 0 
1d72 : 85 50 __ STA T5 + 0 
1d74 : a5 51 __ LDA T5 + 1 
1d76 : 65 4f __ ADC T2 + 1 
1d78 : 85 51 __ STA T5 + 1 
.s24:
1d7a : e6 53 __ INC T6 + 0 
1d7c : d0 02 __ BNE $1d80 ; (bmu_bitblit.s65 + 0)
.s64:
1d7e : e6 54 __ INC T6 + 1 
.s65:
1d80 : a5 53 __ LDA T6 + 0 
1d82 : 29 07 __ AND #$07
1d84 : d0 0d __ BNE $1d93 ; (bmu_bitblit.s25 + 0)
.s26:
1d86 : 18 __ __ CLC
1d87 : a5 53 __ LDA T6 + 0 
1d89 : 65 43 __ ADC T0 + 0 
1d8b : 85 53 __ STA T6 + 0 
1d8d : a5 54 __ LDA T6 + 1 
1d8f : 65 44 __ ADC T0 + 1 
1d91 : 85 54 __ STA T6 + 1 
.s25:
1d93 : c6 45 __ DEC T1 + 0 
1d95 : d0 aa __ BNE $1d41 ; (bmu_bitblit.l23 + 0)
1d97 : 4c 3a 1c JMP $1c3a ; (bmu_bitblit.s3 + 0)
.s36:
1d9a : 18 __ __ CLC
1d9b : a5 11 __ LDA P4 
1d9d : 69 e1 __ ADC #$e1
1d9f : 2a __ __ ROL
1da0 : 2a __ __ ROL
1da1 : 2a __ __ ROL
1da2 : a8 __ __ TAY
1da3 : 29 f8 __ AND #$f8
1da5 : 85 45 __ STA T1 + 0 
1da7 : 98 __ __ TYA
1da8 : 29 07 __ AND #$07
1daa : 2a __ __ ROL
1dab : 69 f8 __ ADC #$f8
1dad : 85 46 __ STA T1 + 1 
1daf : 18 __ __ CLC
1db0 : a5 53 __ LDA T6 + 0 
1db2 : 65 45 __ ADC T1 + 0 
1db4 : 85 53 __ STA T6 + 0 
1db6 : a5 54 __ LDA T6 + 1 
1db8 : 65 46 __ ADC T1 + 1 
1dba : 85 54 __ STA T6 + 1 
1dbc : a5 13 __ LDA P6 
1dbe : 85 12 __ STA P5 
1dc0 : a5 4c __ LDA T10 + 0 
1dc2 : 85 13 __ STA P6 
1dc4 : 18 __ __ CLC
1dc5 : a5 49 __ LDA T4 + 0 
1dc7 : 65 45 __ ADC T1 + 0 
1dc9 : 85 50 __ STA T5 + 0 
1dcb : 8a __ __ TXA
1dcc : 65 46 __ ADC T1 + 1 
1dce : 85 51 __ STA T5 + 1 
1dd0 : 24 43 __ BIT T0 + 0 
1dd2 : 30 03 __ BMI $1dd7 ; (bmu_bitblit.s37 + 0)
1dd4 : 4c c2 1b JMP $1bc2 ; (bmu_bitblit.s8 + 0)
.s37:
1dd7 : 18 __ __ CLC
1dd8 : a5 50 __ LDA T5 + 0 
1dda : 69 08 __ ADC #$08
1ddc : 85 50 __ STA T5 + 0 
1dde : 90 f4 __ BCC $1dd4 ; (bmu_bitblit.s36 + 58)
.s57:
1de0 : e6 51 __ INC T5 + 1 
1de2 : 4c c2 1b JMP $1bc2 ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1de5 : a5 15 __ LDA P8 ; (reverse + 0)
1de7 : f0 16 __ BEQ $1dff ; (builddop.s5 + 0)
.s48:
1de9 : a9 38 __ LDA #$38
1deb : 85 48 __ STA T9 + 0 
1ded : a9 e1 __ LDA #$e1
1def : 85 49 __ STA T10 + 0 
1df1 : a9 b0 __ LDA #$b0
1df3 : 85 4a __ STA T11 + 0 
1df5 : a9 c2 __ LDA #$c2
1df7 : 85 4b __ STA T12 + 0 
1df9 : a9 f8 __ LDA #$f8
1dfb : 85 44 __ STA T3 + 0 
1dfd : d0 16 __ BNE $1e15 ; (builddop.s6 + 0)
.s5:
1dff : a9 18 __ LDA #$18
1e01 : 85 48 __ STA T9 + 0 
1e03 : a9 61 __ LDA #$61
1e05 : 85 49 __ STA T10 + 0 
1e07 : a9 90 __ LDA #$90
1e09 : 85 4a __ STA T11 + 0 
1e0b : a9 e2 __ LDA #$e2
1e0d : 85 4b __ STA T12 + 0 
1e0f : a9 00 __ LDA #$00
1e11 : 85 44 __ STA T3 + 0 
1e13 : a9 08 __ LDA #$08
.s6:
1e15 : 85 47 __ STA T6 + 0 
1e17 : a5 14 __ LDA P7 ; (op + 0)
1e19 : 29 08 __ AND #$08
1e1b : 85 45 __ STA T4 + 0 
1e1d : a5 14 __ LDA P7 ; (op + 0)
1e1f : 29 10 __ AND #$10
1e21 : 85 46 __ STA T5 + 0 
1e23 : a5 11 __ LDA P4 ; (w + 0)
1e25 : d0 06 __ BNE $1e2d ; (builddop.s8 + 0)
.s7:
1e27 : a5 13 __ LDA P6 ; (rmask + 0)
1e29 : 25 12 __ AND P5 ; (lmask + 0)
1e2b : 85 12 __ STA P5 ; (lmask + 0)
.s8:
1e2d : a9 a0 __ LDA #$a0
1e2f : 8d 00 4d STA $4d00 ; (BLIT_CODE[0] + 0)
1e32 : a5 44 __ LDA T3 + 0 
1e34 : 8d 01 4d STA $4d01 ; (BLIT_CODE[0] + 1)
1e37 : a9 02 __ LDA #$02
1e39 : 85 43 __ STA T0 + 0 
1e3b : a6 12 __ LDX P5 ; (lmask + 0)
1e3d : e8 __ __ INX
1e3e : d0 03 __ BNE $1e43 ; (builddop.s9 + 0)
1e40 : 4c 76 20 JMP $2076 ; (builddop.s44 + 0)
.s9:
1e43 : a5 46 __ LDA T5 + 0 
1e45 : f0 18 __ BEQ $1e5f ; (builddop.s10 + 0)
.s43:
1e47 : a9 b1 __ LDA #$b1
1e49 : 8d 02 4d STA $4d02 ; (BLIT_CODE[0] + 2)
1e4c : a9 05 __ LDA #$05
1e4e : 8d 03 4d STA $4d03 ; (BLIT_CODE[0] + 3)
1e51 : a9 85 __ LDA #$85
1e53 : 8d 04 4d STA $4d04 ; (BLIT_CODE[0] + 4)
1e56 : a9 0a __ LDA #$0a
1e58 : 8d 05 4d STA $4d05 ; (BLIT_CODE[0] + 5)
1e5b : a9 06 __ LDA #$06
1e5d : 85 43 __ STA T0 + 0 
.s10:
1e5f : a5 45 __ LDA T4 + 0 
1e61 : d0 05 __ BNE $1e68 ; (builddop.s40 + 0)
.s11:
1e63 : a5 43 __ LDA T0 + 0 
1e65 : 4c c9 1e JMP $1ec9 ; (builddop.s52 + 0)
.s40:
1e68 : a5 10 __ LDA P3 ; (shift + 0)
1e6a : 85 0e __ STA P1 
1e6c : d0 05 __ BNE $1e73 ; (builddop.s42 + 0)
.s41:
1e6e : a5 43 __ LDA T0 + 0 
1e70 : 4c c0 1e JMP $1ec0 ; (builddop.s51 + 0)
.s42:
1e73 : a9 b1 __ LDA #$b1
1e75 : a6 43 __ LDX T0 + 0 
1e77 : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
1e7a : a9 03 __ LDA #$03
1e7c : 9d 01 4d STA $4d01,x ; (BLIT_CODE[0] + 1)
1e7f : 9d 06 4d STA $4d06,x ; (BLIT_CODE[0] + 6)
1e82 : 9d 0a 4d STA $4d0a,x ; (BLIT_CODE[0] + 10)
1e85 : a9 85 __ LDA #$85
1e87 : 9d 02 4d STA $4d02,x ; (BLIT_CODE[0] + 2)
1e8a : 9d 09 4d STA $4d09,x ; (BLIT_CODE[0] + 9)
1e8d : a9 08 __ LDA #$08
1e8f : 9d 03 4d STA $4d03,x ; (BLIT_CODE[0] + 3)
1e92 : 9d 08 4d STA $4d08,x ; (BLIT_CODE[0] + 8)
1e95 : a9 a5 __ LDA #$a5
1e97 : 9d 05 4d STA $4d05,x ; (BLIT_CODE[0] + 5)
1e9a : a9 02 __ LDA #$02
1e9c : 9d 0c 4d STA $4d0c,x ; (BLIT_CODE[0] + 12)
1e9f : a9 04 __ LDA #$04
1ea1 : 9d 0e 4d STA $4d0e,x ; (BLIT_CODE[0] + 14)
1ea4 : a5 48 __ LDA T9 + 0 
1ea6 : 9d 04 4d STA $4d04,x ; (BLIT_CODE[0] + 4)
1ea9 : a5 49 __ LDA T10 + 0 
1eab : 09 08 __ ORA #$08
1ead : 9d 07 4d STA $4d07,x ; (BLIT_CODE[0] + 7)
1eb0 : a5 4a __ LDA T11 + 0 
1eb2 : 9d 0b 4d STA $4d0b,x ; (BLIT_CODE[0] + 11)
1eb5 : a5 4b __ LDA T12 + 0 
1eb7 : 09 04 __ ORA #$04
1eb9 : 9d 0d 4d STA $4d0d,x ; (BLIT_CODE[0] + 13)
1ebc : 8a __ __ TXA
1ebd : 18 __ __ CLC
1ebe : 69 0f __ ADC #$0f
.s51:
1ec0 : 85 0d __ STA P0 
1ec2 : a5 15 __ LDA P8 ; (reverse + 0)
1ec4 : 85 0f __ STA P2 
1ec6 : 20 d7 20 JSR $20d7 ; (builddop_src.s4 + 0)
.s52:
1ec9 : 85 0d __ STA P0 
1ecb : a5 14 __ LDA P7 ; (op + 0)
1ecd : 85 0e __ STA P1 
1ecf : a5 12 __ LDA P5 ; (lmask + 0)
1ed1 : 49 ff __ EOR #$ff
1ed3 : 85 0f __ STA P2 
1ed5 : 20 17 22 JSR $2217 ; (builddop_op.s4 + 0)
1ed8 : 85 43 __ STA T0 + 0 
1eda : a5 11 __ LDA P4 ; (w + 0)
1edc : f0 68 __ BEQ $1f46 ; (builddop.s12 + 0)
.s13:
1ede : a9 a0 __ LDA #$a0
1ee0 : a6 43 __ LDX T0 + 0 
1ee2 : e8 __ __ INX
1ee3 : e8 __ __ INX
1ee4 : 86 43 __ STX T0 + 0 
1ee6 : 86 0d __ STX P0 
1ee8 : 9d fe 4c STA $4cfe,x ; (pmat.m[0] + 62)
1eeb : 18 __ __ CLC
1eec : a5 47 __ LDA T6 + 0 
1eee : 65 44 __ ADC T3 + 0 
1ef0 : 85 44 __ STA T3 + 0 
1ef2 : 9d ff 4c STA $4cff,x ; (pmat.m[0] + 63)
.s14:
1ef5 : a5 11 __ LDA P4 ; (w + 0)
1ef7 : c9 02 __ CMP #$02
1ef9 : b0 53 __ BCS $1f4e ; (builddop.s21 + 0)
.s15:
1efb : a5 13 __ LDA P6 ; (rmask + 0)
1efd : f0 47 __ BEQ $1f46 ; (builddop.s12 + 0)
.s16:
1eff : a5 46 __ LDA T5 + 0 
1f01 : f0 1e __ BEQ $1f21 ; (builddop.s17 + 0)
.s20:
1f03 : a9 b1 __ LDA #$b1
1f05 : a6 43 __ LDX T0 + 0 
1f07 : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
1f0a : a9 05 __ LDA #$05
1f0c : 9d 01 4d STA $4d01,x ; (BLIT_CODE[0] + 1)
1f0f : a9 85 __ LDA #$85
1f11 : 9d 02 4d STA $4d02,x ; (BLIT_CODE[0] + 2)
1f14 : a9 0a __ LDA #$0a
1f16 : 9d 03 4d STA $4d03,x ; (BLIT_CODE[0] + 3)
1f19 : 8a __ __ TXA
1f1a : 18 __ __ CLC
1f1b : 69 04 __ ADC #$04
1f1d : 85 43 __ STA T0 + 0 
1f1f : 85 0d __ STA P0 
.s17:
1f21 : a5 45 __ LDA T4 + 0 
1f23 : d0 05 __ BNE $1f2a ; (builddop.s19 + 0)
.s18:
1f25 : a5 43 __ LDA T0 + 0 
1f27 : 4c 35 1f JMP $1f35 ; (builddop.s50 + 0)
.s19:
1f2a : a5 10 __ LDA P3 ; (shift + 0)
1f2c : 85 0e __ STA P1 
1f2e : a5 15 __ LDA P8 ; (reverse + 0)
1f30 : 85 0f __ STA P2 
1f32 : 20 d7 20 JSR $20d7 ; (builddop_src.s4 + 0)
.s50:
1f35 : 85 0d __ STA P0 
1f37 : a5 14 __ LDA P7 ; (op + 0)
1f39 : 85 0e __ STA P1 
1f3b : a5 13 __ LDA P6 ; (rmask + 0)
1f3d : 49 ff __ EOR #$ff
1f3f : 85 0f __ STA P2 
1f41 : 20 17 22 JSR $2217 ; (builddop_op.s4 + 0)
1f44 : 85 43 __ STA T0 + 0 
.s12:
1f46 : a9 60 __ LDA #$60
1f48 : a6 43 __ LDX T0 + 0 
1f4a : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
.s3:
1f4d : 60 __ __ RTS
.s21:
1f4e : a9 02 __ LDA #$02
1f50 : c5 11 __ CMP P4 ; (w + 0)
1f52 : a9 00 __ LDA #$00
1f54 : 6a __ __ ROR
1f55 : 85 4c __ STA T14 + 0 
1f57 : d0 19 __ BNE $1f72 ; (builddop.s22 + 0)
.s39:
1f59 : a9 a2 __ LDA #$a2
1f5b : a6 43 __ LDX T0 + 0 
1f5d : e8 __ __ INX
1f5e : e8 __ __ INX
1f5f : 86 43 __ STX T0 + 0 
1f61 : 9d fe 4c STA $4cfe,x ; (pmat.m[0] + 62)
1f64 : 38 __ __ SEC
1f65 : a5 11 __ LDA P4 ; (w + 0)
1f67 : e9 01 __ SBC #$01
1f69 : 9d ff 4c STA $4cff,x ; (pmat.m[0] + 63)
1f6c : a5 11 __ LDA P4 ; (w + 0)
1f6e : c9 20 __ CMP #$20
1f70 : b0 0d __ BCS $1f7f ; (builddop.s24 + 0)
.s22:
1f72 : a5 10 __ LDA P3 ; (shift + 0)
1f74 : d0 09 __ BNE $1f7f ; (builddop.s24 + 0)
.s23:
1f76 : a5 48 __ LDA T9 + 0 
1f78 : a6 43 __ LDX T0 + 0 
1f7a : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
1f7d : e6 43 __ INC T0 + 0 
.s24:
1f7f : a6 43 __ LDX T0 + 0 
1f81 : 86 4d __ STX T15 + 0 
1f83 : a5 46 __ LDA T5 + 0 
1f85 : f0 1a __ BEQ $1fa1 ; (builddop.s25 + 0)
.s38:
1f87 : a9 b1 __ LDA #$b1
1f89 : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
1f8c : a9 05 __ LDA #$05
1f8e : 9d 01 4d STA $4d01,x ; (BLIT_CODE[0] + 1)
1f91 : a9 85 __ LDA #$85
1f93 : 9d 02 4d STA $4d02,x ; (BLIT_CODE[0] + 2)
1f96 : a9 0a __ LDA #$0a
1f98 : 9d 03 4d STA $4d03,x ; (BLIT_CODE[0] + 3)
1f9b : 8a __ __ TXA
1f9c : 18 __ __ CLC
1f9d : 69 04 __ ADC #$04
1f9f : 85 43 __ STA T0 + 0 
.s25:
1fa1 : a5 45 __ LDA T4 + 0 
1fa3 : d0 05 __ BNE $1faa ; (builddop.s37 + 0)
.s26:
1fa5 : a5 43 __ LDA T0 + 0 
1fa7 : 4c b9 1f JMP $1fb9 ; (builddop.s49 + 0)
.s37:
1faa : a5 43 __ LDA T0 + 0 
1fac : 85 0d __ STA P0 
1fae : a5 10 __ LDA P3 ; (shift + 0)
1fb0 : 85 0e __ STA P1 
1fb2 : a5 15 __ LDA P8 ; (reverse + 0)
1fb4 : 85 0f __ STA P2 
1fb6 : 20 d7 20 JSR $20d7 ; (builddop_src.s4 + 0)
.s49:
1fb9 : 85 0d __ STA P0 
1fbb : a5 14 __ LDA P7 ; (op + 0)
1fbd : 85 0e __ STA P1 
1fbf : a9 00 __ LDA #$00
1fc1 : 85 0f __ STA P2 
1fc3 : 20 17 22 JSR $2217 ; (builddop_op.s4 + 0)
1fc6 : 24 4c __ BIT T14 + 0 
1fc8 : 10 17 __ BPL $1fe1 ; (builddop.s28 + 0)
.s27:
1fca : aa __ __ TAX
1fcb : e8 __ __ INX
1fcc : e8 __ __ INX
1fcd : 86 43 __ STX T0 + 0 
1fcf : 86 0d __ STX P0 
1fd1 : a9 a0 __ LDA #$a0
1fd3 : 9d fe 4c STA $4cfe,x ; (pmat.m[0] + 62)
1fd6 : 18 __ __ CLC
1fd7 : a5 47 __ LDA T6 + 0 
1fd9 : 65 44 __ ADC T3 + 0 
1fdb : 9d ff 4c STA $4cff,x ; (pmat.m[0] + 63)
1fde : 4c fb 1e JMP $1efb ; (builddop.s15 + 0)
.s28:
1fe1 : a8 __ __ TAY
1fe2 : a9 1f __ LDA #$1f
1fe4 : c5 11 __ CMP P4 ; (w + 0)
1fe6 : a9 00 __ LDA #$00
1fe8 : 6a __ __ ROR
1fe9 : 85 47 __ STA T6 + 0 
1feb : f0 04 __ BEQ $1ff1 ; (builddop.s36 + 0)
.s29:
1fed : a5 10 __ LDA P3 ; (shift + 0)
1fef : f0 06 __ BEQ $1ff7 ; (builddop.s30 + 0)
.s36:
1ff1 : a5 48 __ LDA T9 + 0 
1ff3 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
1ff6 : c8 __ __ INY
.s30:
1ff7 : a9 98 __ LDA #$98
1ff9 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
1ffc : a9 08 __ LDA #$08
1ffe : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
2001 : a9 a8 __ LDA #$a8
2003 : 99 03 4d STA $4d03,y ; (BLIT_CODE[0] + 3)
2006 : a5 49 __ LDA T10 + 0 
2008 : 09 08 __ ORA #$08
200a : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
200d : 98 __ __ TYA
200e : 18 __ __ CLC
200f : 69 04 __ ADC #$04
2011 : 85 43 __ STA T0 + 0 
2013 : 24 47 __ BIT T6 + 0 
2015 : 30 3a __ BMI $2051 ; (builddop.s31 + 0)
.s32:
2017 : a5 4a __ LDA T11 + 0 
2019 : 99 04 4d STA $4d04,y ; (BLIT_CODE[0] + 4)
201c : a5 4b __ LDA T12 + 0 
201e : 09 04 __ ORA #$04
2020 : aa __ __ TAX
2021 : a5 45 __ LDA T4 + 0 
2023 : d0 0d __ BNE $2032 ; (builddop.s35 + 0)
.s33:
2025 : a9 02 __ LDA #$02
2027 : 99 05 4d STA $4d05,y ; (BLIT_CODE[0] + 5)
202a : 18 __ __ CLC
202b : a5 43 __ LDA T0 + 0 
202d : 69 02 __ ADC #$02
202f : 4c 43 20 JMP $2043 ; (builddop.s34 + 0)
.s35:
2032 : a9 04 __ LDA #$04
2034 : 99 05 4d STA $4d05,y ; (BLIT_CODE[0] + 5)
2037 : 99 07 4d STA $4d07,y ; (BLIT_CODE[0] + 7)
203a : 8a __ __ TXA
203b : 99 06 4d STA $4d06,y ; (BLIT_CODE[0] + 6)
203e : 18 __ __ CLC
203f : a5 43 __ LDA T0 + 0 
2041 : 69 04 __ ADC #$04
.s34:
2043 : a8 __ __ TAY
2044 : c8 __ __ INY
2045 : c8 __ __ INY
2046 : 84 43 __ STY T0 + 0 
2048 : 8a __ __ TXA
2049 : 99 fe 4c STA $4cfe,y ; (pmat.m[0] + 62)
204c : a9 06 __ LDA #$06
204e : 99 ff 4c STA $4cff,y ; (pmat.m[0] + 63)
.s31:
2051 : a9 ca __ LDA #$ca
2053 : a4 43 __ LDY T0 + 0 
2055 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
2058 : a9 d0 __ LDA #$d0
205a : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
205d : 98 __ __ TYA
205e : 18 __ __ CLC
205f : 69 01 __ ADC #$01
2061 : aa __ __ TAX
2062 : e8 __ __ INX
2063 : e8 __ __ INX
2064 : 86 43 __ STX T0 + 0 
2066 : 86 0d __ STX P0 
2068 : 49 ff __ EOR #$ff
206a : 38 __ __ SEC
206b : 65 4d __ ADC T15 + 0 
206d : 38 __ __ SEC
206e : e9 02 __ SBC #$02
2070 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
2073 : 4c fb 1e JMP $1efb ; (builddop.s15 + 0)
.s44:
2076 : 85 0d __ STA P0 
2078 : a5 45 __ LDA T4 + 0 
207a : f0 51 __ BEQ $20cd ; (builddop.s45 + 0)
.s46:
207c : a5 10 __ LDA P3 ; (shift + 0)
207e : f0 4d __ BEQ $20cd ; (builddop.s45 + 0)
.s47:
2080 : a9 03 __ LDA #$03
2082 : 8d 03 4d STA $4d03 ; (BLIT_CODE[0] + 3)
2085 : 8d 08 4d STA $4d08 ; (BLIT_CODE[0] + 8)
2088 : 8d 0c 4d STA $4d0c ; (BLIT_CODE[0] + 12)
208b : a9 b1 __ LDA #$b1
208d : 8d 02 4d STA $4d02 ; (BLIT_CODE[0] + 2)
2090 : a9 85 __ LDA #$85
2092 : 8d 04 4d STA $4d04 ; (BLIT_CODE[0] + 4)
2095 : 8d 0b 4d STA $4d0b ; (BLIT_CODE[0] + 11)
2098 : a9 08 __ LDA #$08
209a : 8d 05 4d STA $4d05 ; (BLIT_CODE[0] + 5)
209d : 8d 0a 4d STA $4d0a ; (BLIT_CODE[0] + 10)
20a0 : a9 a5 __ LDA #$a5
20a2 : 8d 07 4d STA $4d07 ; (BLIT_CODE[0] + 7)
20a5 : a9 02 __ LDA #$02
20a7 : 8d 0e 4d STA $4d0e ; (BLIT_CODE[0] + 14)
20aa : a9 04 __ LDA #$04
20ac : 8d 10 4d STA $4d10 ; (BLIT_CODE[0] + 16)
20af : a5 48 __ LDA T9 + 0 
20b1 : 8d 06 4d STA $4d06 ; (BLIT_CODE[0] + 6)
20b4 : a5 49 __ LDA T10 + 0 
20b6 : 09 08 __ ORA #$08
20b8 : 8d 09 4d STA $4d09 ; (BLIT_CODE[0] + 9)
20bb : a5 4a __ LDA T11 + 0 
20bd : 8d 0d 4d STA $4d0d ; (BLIT_CODE[0] + 13)
20c0 : a5 4b __ LDA T12 + 0 
20c2 : 09 04 __ ORA #$04
20c4 : 8d 0f 4d STA $4d0f ; (BLIT_CODE[0] + 15)
20c7 : a9 11 __ LDA #$11
20c9 : 85 43 __ STA T0 + 0 
20cb : 85 0d __ STA P0 
.s45:
20cd : e6 11 __ INC P4 ; (w + 0)
20cf : d0 03 __ BNE $20d4 ; (builddop.s45 + 7)
20d1 : 4c 46 1f JMP $1f46 ; (builddop.s12 + 0)
20d4 : 4c f5 1e JMP $1ef5 ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
20d7 : a6 0d __ LDX P0 ; (ip + 0)
20d9 : e8 __ __ INX
20da : a4 0d __ LDY P0 ; (ip + 0)
20dc : e8 __ __ INX
20dd : a5 0e __ LDA P1 ; (shift + 0)
20df : d0 0c __ BNE $20ed ; (builddop_src.s6 + 0)
.s5:
20e1 : a9 b1 __ LDA #$b1
20e3 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
20e6 : a9 03 __ LDA #$03
20e8 : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
20eb : 8a __ __ TXA
.s3:
20ec : 60 __ __ RTS
.s6:
20ed : a9 a5 __ LDA #$a5
20ef : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
20f2 : a9 08 __ LDA #$08
20f4 : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
20f7 : a5 0f __ LDA P2 ; (reverse + 0)
20f9 : f0 03 __ BEQ $20fe ; (builddop_src.s7 + 0)
20fb : 4c 09 22 JMP $2209 ; (builddop_src.s26 + 0)
.s7:
20fe : a5 0e __ LDA P1 ; (shift + 0)
2100 : c9 05 __ CMP #$05
2102 : b0 06 __ BCS $210a ; (builddop_src.s8 + 0)
.s24:
2104 : a9 4a __ LDA #$4a
.s25:
2106 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
2109 : e8 __ __ INX
.s8:
210a : a9 85 __ LDA #$85
210c : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
210f : 9d 04 4d STA $4d04,x ; (BLIT_CODE[0] + 4)
2112 : a9 09 __ LDA #$09
2114 : 9d 01 4d STA $4d01,x ; (BLIT_CODE[0] + 1)
2117 : a9 b1 __ LDA #$b1
2119 : 9d 02 4d STA $4d02,x ; (BLIT_CODE[0] + 2)
211c : a9 03 __ LDA #$03
211e : 9d 03 4d STA $4d03,x ; (BLIT_CODE[0] + 3)
2121 : a9 08 __ LDA #$08
2123 : 9d 05 4d STA $4d05,x ; (BLIT_CODE[0] + 5)
2126 : 8a __ __ TXA
2127 : 18 __ __ CLC
2128 : 69 06 __ ADC #$06
212a : 85 1b __ STA ACCU + 0 
212c : a8 __ __ TAY
212d : a5 0f __ LDA P2 ; (reverse + 0)
212f : d0 72 __ BNE $21a3 ; (builddop_src.s17 + 0)
.s9:
2131 : a5 0e __ LDA P1 ; (shift + 0)
2133 : c9 05 __ CMP #$05
2135 : 90 0b __ BCC $2142 ; (builddop_src.s10 + 0)
.s13:
2137 : a9 0a __ LDA #$0a
2139 : 9d 06 4d STA $4d06,x ; (BLIT_CODE[0] + 6)
213c : e6 1b __ INC ACCU + 0 
213e : a6 0e __ LDX P1 ; (shift + 0)
2140 : b0 25 __ BCS $2167 ; (builddop_src.l14 + 0)
.s10:
2142 : c9 02 __ CMP #$02
2144 : 90 19 __ BCC $215f ; (builddop_src.s11 + 0)
.s12:
2146 : c6 0e __ DEC P1 ; (shift + 0)
2148 : a6 0e __ LDX P1 ; (shift + 0)
.l29:
214a : a9 6a __ LDA #$6a
214c : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
214f : a9 46 __ LDA #$46
2151 : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
2154 : a9 09 __ LDA #$09
2156 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
2159 : c8 __ __ INY
215a : c8 __ __ INY
215b : c8 __ __ INY
215c : ca __ __ DEX
215d : d0 eb __ BNE $214a ; (builddop_src.l29 + 0)
.s11:
215f : a9 6a __ LDA #$6a
.s30:
2161 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
2164 : c8 __ __ INY
2165 : 98 __ __ TYA
2166 : 60 __ __ RTS
.l14:
2167 : a5 1b __ LDA ACCU + 0 
2169 : 85 1d __ STA ACCU + 2 
216b : 85 1c __ STA ACCU + 1 
216d : a8 __ __ TAY
216e : 18 __ __ CLC
216f : 69 03 __ ADC #$03
2171 : 85 1b __ STA ACCU + 0 
2173 : e0 07 __ CPX #$07
2175 : b0 16 __ BCS $218d ; (builddop_src.s15 + 0)
.s16:
2177 : a9 26 __ LDA #$26
2179 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
217c : a9 09 __ LDA #$09
217e : a4 1d __ LDY ACCU + 2 
2180 : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
2183 : a9 0a __ LDA #$0a
2185 : a4 1c __ LDY ACCU + 1 
2187 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
218a : e8 __ __ INX
218b : 90 da __ BCC $2167 ; (builddop_src.l14 + 0)
.s15:
218d : a9 a5 __ LDA #$a5
218f : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
2192 : a9 09 __ LDA #$09
2194 : a6 1d __ LDX ACCU + 2 
2196 : 9d 01 4d STA $4d01,x ; (BLIT_CODE[0] + 1)
2199 : a9 2a __ LDA #$2a
219b : a6 1c __ LDX ACCU + 1 
219d : 9d 02 4d STA $4d02,x ; (BLIT_CODE[0] + 2)
21a0 : a5 1b __ LDA ACCU + 0 
21a2 : 60 __ __ RTS
.s17:
21a3 : a5 0e __ LDA P1 ; (shift + 0)
21a5 : c9 05 __ CMP #$05
21a7 : b0 3e __ BCS $21e7 ; (builddop_src.s21 + 0)
.s18:
21a9 : a9 4a __ LDA #$4a
21ab : 9d 06 4d STA $4d06,x ; (BLIT_CODE[0] + 6)
21ae : e6 1b __ INC ACCU + 0 
21b0 : a6 0e __ LDX P1 ; (shift + 0)
21b2 : e0 02 __ CPX #$02
21b4 : 90 1b __ BCC $21d1 ; (builddop_src.s19 + 0)
.s20:
21b6 : a4 1b __ LDY ACCU + 0 
.l28:
21b8 : a9 66 __ LDA #$66
21ba : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
21bd : a9 09 __ LDA #$09
21bf : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
21c2 : a9 4a __ LDA #$4a
21c4 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
21c7 : 98 __ __ TYA
21c8 : 18 __ __ CLC
21c9 : 69 03 __ ADC #$03
21cb : a8 __ __ TAY
21cc : ca __ __ DEX
21cd : d0 e9 __ BNE $21b8 ; (builddop_src.l28 + 0)
.s31:
21cf : 85 1b __ STA ACCU + 0 
.s19:
21d1 : a9 a5 __ LDA #$a5
21d3 : a6 1b __ LDX ACCU + 0 
21d5 : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
21d8 : a9 09 __ LDA #$09
21da : 9d 01 4d STA $4d01,x ; (BLIT_CODE[0] + 1)
21dd : a9 6a __ LDA #$6a
21df : 9d 02 4d STA $4d02,x ; (BLIT_CODE[0] + 2)
21e2 : 8a __ __ TXA
21e3 : 18 __ __ CLC
21e4 : 69 03 __ ADC #$03
21e6 : 60 __ __ RTS
.s21:
21e7 : c9 07 __ CMP #$07
21e9 : b0 19 __ BCS $2204 ; (builddop_src.s22 + 0)
.s23:
21eb : aa __ __ TAX
.l32:
21ec : a9 2a __ LDA #$2a
21ee : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
21f1 : a9 06 __ LDA #$06
21f3 : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
21f6 : a9 09 __ LDA #$09
21f8 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
21fb : 98 __ __ TYA
21fc : 69 03 __ ADC #$03
21fe : e8 __ __ INX
21ff : e0 07 __ CPX #$07
2201 : a8 __ __ TAY
2202 : 90 e8 __ BCC $21ec ; (builddop_src.l32 + 0)
.s22:
2204 : a9 2a __ LDA #$2a
2206 : 4c 61 21 JMP $2161 ; (builddop_src.s30 + 0)
.s26:
2209 : a5 0e __ LDA P1 ; (shift + 0)
220b : c9 05 __ CMP #$05
220d : b0 03 __ BCS $2212 ; (builddop_src.s27 + 0)
220f : 4c 0a 21 JMP $210a ; (builddop_src.s8 + 0)
.s27:
2212 : a9 0a __ LDA #$0a
2214 : 4c 06 21 JMP $2106 ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
2217 : a5 0e __ LDA P1 ; (op + 0)
2219 : 29 20 __ AND #$20
221b : f0 04 __ BEQ $2221 ; (builddop_op.s27 + 0)
.s28:
221d : a9 07 __ LDA #$07
221f : d0 02 __ BNE $2223 ; (builddop_op.s29 + 0)
.s27:
2221 : a9 0a __ LDA #$0a
.s29:
2223 : 85 1c __ STA ACCU + 1 
2225 : a5 0e __ LDA P1 ; (op + 0)
2227 : 29 03 __ AND #$03
2229 : 85 1b __ STA ACCU + 0 
222b : a5 0e __ LDA P1 ; (op + 0)
222d : 29 04 __ AND #$04
222f : f0 03 __ BEQ $2234 ; (builddop_op.s5 + 0)
2231 : 4c c7 22 JMP $22c7 ; (builddop_op.s18 + 0)
.s5:
2234 : a5 0e __ LDA P1 ; (op + 0)
2236 : 29 08 __ AND #$08
2238 : d0 13 __ BNE $224d ; (builddop_op.s15 + 0)
.s6:
223a : a9 a5 __ LDA #$a5
223c : a4 0d __ LDY P0 ; (ip + 0)
223e : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
2241 : a5 1c __ LDA ACCU + 1 
.s7:
2243 : c8 __ __ INY
2244 : c8 __ __ INY
2245 : 84 0d __ STY P0 ; (ip + 0)
2247 : 99 ff 4c STA $4cff,y ; (pmat.m[0] + 63)
224a : 4c 5d 22 JMP $225d ; (builddop_op.s16 + 0)
.s15:
224d : a5 0e __ LDA P1 ; (op + 0)
224f : 0a __ __ ASL
2250 : 10 0b __ BPL $225d ; (builddop_op.s16 + 0)
.s17:
2252 : a9 49 __ LDA #$49
2254 : a4 0d __ LDY P0 ; (ip + 0)
2256 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
2259 : a9 ff __ LDA #$ff
225b : d0 e6 __ BNE $2243 ; (builddop_op.s7 + 0)
.s16:
225d : a6 1b __ LDX ACCU + 0 
225f : f0 13 __ BEQ $2274 ; (builddop_op.s8 + 0)
.s14:
2261 : a5 1c __ LDA ACCU + 1 
2263 : a4 0d __ LDY P0 ; (ip + 0)
2265 : c8 __ __ INY
2266 : c8 __ __ INY
2267 : 84 0d __ STY P0 ; (ip + 0)
2269 : 99 ff 4c STA $4cff,y ; (pmat.m[0] + 63)
226c : bd 99 4a LDA $4a99,x ; (blitops_op[0] + 0)
226f : 09 04 __ ORA #$04
2271 : 99 fe 4c STA $4cfe,y ; (pmat.m[0] + 62)
.s8:
2274 : a5 0f __ LDA P2 ; (mask + 0)
2276 : f0 3f __ BEQ $22b7 ; (builddop_op.s9 + 0)
.s10:
2278 : a9 85 __ LDA #$85
227a : a4 0d __ LDY P0 ; (ip + 0)
227c : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
227f : a9 09 __ LDA #$09
2281 : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
2284 : 98 __ __ TYA
2285 : 18 __ __ CLC
2286 : 69 08 __ ADC #$08
2288 : 85 0d __ STA P0 ; (ip + 0)
228a : a5 0e __ LDA P1 ; (op + 0)
228c : 29 10 __ AND #$10
228e : f0 09 __ BEQ $2299 ; (builddop_op.s11 + 0)
.s13:
2290 : a9 45 __ LDA #$45
2292 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
2295 : a9 0a __ LDA #$0a
2297 : d0 07 __ BNE $22a0 ; (builddop_op.s12 + 0)
.s11:
2299 : a9 51 __ LDA #$51
229b : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
229e : a9 05 __ LDA #$05
.s12:
22a0 : 99 03 4d STA $4d03,y ; (BLIT_CODE[0] + 3)
22a3 : a9 29 __ LDA #$29
22a5 : 99 04 4d STA $4d04,y ; (BLIT_CODE[0] + 4)
22a8 : a5 0f __ LDA P2 ; (mask + 0)
22aa : 99 05 4d STA $4d05,y ; (BLIT_CODE[0] + 5)
22ad : a9 45 __ LDA #$45
22af : 99 06 4d STA $4d06,y ; (BLIT_CODE[0] + 6)
22b2 : a9 09 __ LDA #$09
22b4 : 99 07 4d STA $4d07,y ; (BLIT_CODE[0] + 7)
.s9:
22b7 : a9 91 __ LDA #$91
22b9 : a6 0d __ LDX P0 ; (ip + 0)
22bb : 9d 00 4d STA $4d00,x ; (BLIT_CODE[0] + 0)
22be : a9 05 __ LDA #$05
22c0 : 9d 01 4d STA $4d01,x ; (BLIT_CODE[0] + 1)
22c3 : e8 __ __ INX
22c4 : e8 __ __ INX
22c5 : 8a __ __ TXA
.s3:
22c6 : 60 __ __ RTS
.s18:
22c7 : a5 1b __ LDA ACCU + 0 
22c9 : d0 04 __ BNE $22cf ; (builddop_op.s20 + 0)
.s19:
22cb : a5 0f __ LDA P2 ; (mask + 0)
22cd : d0 14 __ BNE $22e3 ; (builddop_op.s23 + 0)
.s20:
22cf : a5 0e __ LDA P1 ; (op + 0)
22d1 : 29 40 __ AND #$40
22d3 : f0 02 __ BEQ $22d7 ; (builddop_op.s21 + 0)
.s22:
22d5 : a9 ff __ LDA #$ff
.s21:
22d7 : aa __ __ TAX
22d8 : a9 a9 __ LDA #$a9
22da : a4 0d __ LDY P0 ; (ip + 0)
22dc : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
22df : 8a __ __ TXA
22e0 : 4c 43 22 JMP $2243 ; (builddop_op.s7 + 0)
.s23:
22e3 : a9 b1 __ LDA #$b1
22e5 : a4 0d __ LDY P0 ; (ip + 0)
22e7 : 99 00 4d STA $4d00,y ; (BLIT_CODE[0] + 0)
22ea : a9 05 __ LDA #$05
22ec : 99 01 4d STA $4d01,y ; (BLIT_CODE[0] + 1)
22ef : 06 0e __ ASL P1 ; (op + 0)
22f1 : 30 0a __ BMI $22fd ; (builddop_op.s26 + 0)
.s24:
22f3 : a9 29 __ LDA #$29
22f5 : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
22f8 : a5 0f __ LDA P2 ; (mask + 0)
22fa : 4c 06 23 JMP $2306 ; (builddop_op.s25 + 0)
.s26:
22fd : a9 09 __ LDA #$09
22ff : 99 02 4d STA $4d02,y ; (BLIT_CODE[0] + 2)
2302 : a5 0f __ LDA P2 ; (mask + 0)
2304 : 49 ff __ EOR #$ff
.s25:
2306 : 99 03 4d STA $4d03,y ; (BLIT_CODE[0] + 3)
2309 : a9 91 __ LDA #$91
230b : 99 04 4d STA $4d04,y ; (BLIT_CODE[0] + 4)
230e : a9 05 __ LDA #$05
2310 : 99 05 4d STA $4d05,y ; (BLIT_CODE[0] + 5)
2313 : 98 __ __ TYA
2314 : 18 __ __ CLC
2315 : 69 06 __ ADC #$06
2317 : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
2318 : a9 00 __ LDA #$00
231a : 85 1b __ STA ACCU + 0 
231c : 85 1c __ STA ACCU + 1 
231e : a8 __ __ TAY
231f : b1 0d __ LDA (P0),y ; (str + 0)
2321 : f0 10 __ BEQ $2333 ; (strlen.s3 + 0)
.s6:
2323 : a2 00 __ LDX #$00
.l7:
2325 : c8 __ __ INY
2326 : d0 03 __ BNE $232b ; (strlen.s9 + 0)
.s8:
2328 : e6 0e __ INC P1 ; (str + 1)
232a : e8 __ __ INX
.s9:
232b : b1 0d __ LDA (P0),y ; (str + 0)
232d : d0 f6 __ BNE $2325 ; (strlen.l7 + 0)
.s5:
232f : 86 1c __ STX ACCU + 1 
2331 : 84 1b __ STY ACCU + 0 
.s3:
2333 : 60 __ __ RTS
--------------------------------------------------------------------
mat4_ident: ; mat4_ident(struct Matrix4*)->void
; 217, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2334 : a9 00 __ LDA #$00
2336 : 85 1d __ STA ACCU + 2 
2338 : 85 1b __ STA ACCU + 0 
.l5:
233a : a5 1b __ LDA ACCU + 0 
233c : 0a __ __ ASL
233d : 0a __ __ ASL
233e : 85 1c __ STA ACCU + 1 
2340 : a9 00 __ LDA #$00
2342 : 85 43 __ STA T6 + 0 
.l6:
2344 : a5 1d __ LDA ACCU + 2 
2346 : c5 43 __ CMP T6 + 0 
2348 : d0 06 __ BNE $2350 ; (mat4_ident.s7 + 0)
.s10:
234a : a9 3f __ LDA #$3f
234c : a2 80 __ LDX #$80
234e : d0 03 __ BNE $2353 ; (mat4_ident.s8 + 0)
.s7:
2350 : a9 00 __ LDA #$00
2352 : aa __ __ TAX
.s8:
2353 : 85 1e __ STA ACCU + 3 
2355 : a5 1c __ LDA ACCU + 1 
2357 : 0a __ __ ASL
2358 : 0a __ __ ASL
2359 : a8 __ __ TAY
235a : a9 00 __ LDA #$00
235c : 91 0d __ STA (P0),y ; (m + 0)
235e : c8 __ __ INY
235f : 91 0d __ STA (P0),y ; (m + 0)
2361 : 8a __ __ TXA
2362 : c8 __ __ INY
2363 : 91 0d __ STA (P0),y ; (m + 0)
2365 : a5 1e __ LDA ACCU + 3 
2367 : c8 __ __ INY
2368 : 91 0d __ STA (P0),y ; (m + 0)
236a : e6 1c __ INC ACCU + 1 
236c : e6 43 __ INC T6 + 0 
236e : a5 43 __ LDA T6 + 0 
2370 : c9 04 __ CMP #$04
2372 : 90 d0 __ BCC $2344 ; (mat4_ident.l6 + 0)
.s9:
2374 : e6 1b __ INC ACCU + 0 
2376 : e6 1d __ INC ACCU + 2 
2378 : a5 1d __ LDA ACCU + 2 
237a : c9 04 __ CMP #$04
237c : 90 bc __ BCC $233a ; (mat4_ident.l5 + 0)
.s3:
237e : 60 __ __ RTS
--------------------------------------------------------------------
mat4_make_perspective: ; mat4_make_perspective(struct Matrix4*,float,float,float,float)->void
; 223, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
237f : a5 53 __ LDA T4 + 0 
2381 : 8d bc c7 STA $c7bc ; (mat4_make_perspective@stack + 0)
2384 : a5 54 __ LDA T4 + 1 
2386 : 8d bd c7 STA $c7bd ; (mat4_make_perspective@stack + 1)
.s4:
2389 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
238c : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
238e : ad c1 c7 LDA $c7c1 ; (sstack + 3)
2391 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
2393 : ad c2 c7 LDA $c7c2 ; (sstack + 4)
2396 : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
2398 : ad c3 c7 LDA $c7c3 ; (sstack + 5)
239b : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
239d : a9 00 __ LDA #$00
239f : 85 03 __ STA WORK + 0 
23a1 : 85 04 __ STA WORK + 1 
23a3 : 85 05 __ STA WORK + 2 
23a5 : a9 3f __ LDA #$3f
23a7 : 85 06 __ STA WORK + 3 
23a9 : 20 44 42 JSR $4244 ; (freg + 20)
23ac : 20 62 43 JSR $4362 ; (crt_fmul + 0)
23af : a9 db __ LDA #$db
23b1 : 85 03 __ STA WORK + 0 
23b3 : a9 3f __ LDA #$3f
23b5 : 85 06 __ STA WORK + 3 
23b7 : a9 0f __ LDA #$0f
23b9 : 85 04 __ STA WORK + 1 
23bb : a9 c9 __ LDA #$c9
23bd : 85 05 __ STA WORK + 2 
23bf : 20 44 42 JSR $4244 ; (freg + 20)
23c2 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
23c4 : 49 80 __ EOR #$80
23c6 : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
23c8 : 20 7b 42 JSR $427b ; (faddsub + 6)
23cb : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
23cd : 85 15 __ STA P8 
23cf : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
23d1 : 85 16 __ STA P9 
23d3 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
23d5 : 85 17 __ STA P10 
23d7 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
23d9 : 85 18 __ STA P11 
23db : 20 dd 25 JSR $25dd ; (tan.s4 + 0)
23de : ad be c7 LDA $c7be ; (sstack + 0)
23e1 : 85 53 __ STA T4 + 0 
23e3 : ad bf c7 LDA $c7bf ; (sstack + 1)
23e6 : 85 54 __ STA T4 + 1 
23e8 : a9 00 __ LDA #$00
23ea : a0 04 __ LDY #$04
23ec : 91 53 __ STA (T4 + 0),y 
23ee : c8 __ __ INY
23ef : 91 53 __ STA (T4 + 0),y 
23f1 : c8 __ __ INY
23f2 : 91 53 __ STA (T4 + 0),y 
23f4 : c8 __ __ INY
23f5 : 91 53 __ STA (T4 + 0),y 
23f7 : c8 __ __ INY
23f8 : 91 53 __ STA (T4 + 0),y 
23fa : c8 __ __ INY
23fb : 91 53 __ STA (T4 + 0),y 
23fd : c8 __ __ INY
23fe : 91 53 __ STA (T4 + 0),y 
2400 : c8 __ __ INY
2401 : 91 53 __ STA (T4 + 0),y 
2403 : c8 __ __ INY
2404 : 91 53 __ STA (T4 + 0),y 
2406 : c8 __ __ INY
2407 : 91 53 __ STA (T4 + 0),y 
2409 : c8 __ __ INY
240a : 91 53 __ STA (T4 + 0),y 
240c : c8 __ __ INY
240d : 91 53 __ STA (T4 + 0),y 
240f : c8 __ __ INY
2410 : 91 53 __ STA (T4 + 0),y 
2412 : c8 __ __ INY
2413 : 91 53 __ STA (T4 + 0),y 
2415 : c8 __ __ INY
2416 : 91 53 __ STA (T4 + 0),y 
2418 : c8 __ __ INY
2419 : 91 53 __ STA (T4 + 0),y 
241b : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
241d : c8 __ __ INY
241e : 91 53 __ STA (T4 + 0),y 
2420 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
2422 : c8 __ __ INY
2423 : 91 53 __ STA (T4 + 0),y 
2425 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
2427 : c8 __ __ INY
2428 : 91 53 __ STA (T4 + 0),y 
242a : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
242c : c8 __ __ INY
242d : 91 53 __ STA (T4 + 0),y 
242f : a9 00 __ LDA #$00
2431 : c8 __ __ INY
2432 : 91 53 __ STA (T4 + 0),y 
2434 : c8 __ __ INY
2435 : 91 53 __ STA (T4 + 0),y 
2437 : c8 __ __ INY
2438 : 91 53 __ STA (T4 + 0),y 
243a : c8 __ __ INY
243b : 91 53 __ STA (T4 + 0),y 
243d : c8 __ __ INY
243e : 91 53 __ STA (T4 + 0),y 
2440 : c8 __ __ INY
2441 : 91 53 __ STA (T4 + 0),y 
2443 : c8 __ __ INY
2444 : 91 53 __ STA (T4 + 0),y 
2446 : c8 __ __ INY
2447 : 91 53 __ STA (T4 + 0),y 
2449 : c8 __ __ INY
244a : 91 53 __ STA (T4 + 0),y 
244c : c8 __ __ INY
244d : 91 53 __ STA (T4 + 0),y 
244f : c8 __ __ INY
2450 : 91 53 __ STA (T4 + 0),y 
2452 : c8 __ __ INY
2453 : 91 53 __ STA (T4 + 0),y 
2455 : c8 __ __ INY
2456 : 91 53 __ STA (T4 + 0),y 
2458 : c8 __ __ INY
2459 : 91 53 __ STA (T4 + 0),y 
245b : c8 __ __ INY
245c : 91 53 __ STA (T4 + 0),y 
245e : c8 __ __ INY
245f : 91 53 __ STA (T4 + 0),y 
2461 : a0 2c __ LDY #$2c
2463 : 91 53 __ STA (T4 + 0),y 
2465 : c8 __ __ INY
2466 : 91 53 __ STA (T4 + 0),y 
2468 : a9 80 __ LDA #$80
246a : c8 __ __ INY
246b : 91 53 __ STA (T4 + 0),y 
246d : a9 3f __ LDA #$3f
246f : c8 __ __ INY
2470 : 91 53 __ STA (T4 + 0),y 
2472 : a9 00 __ LDA #$00
2474 : c8 __ __ INY
2475 : 91 53 __ STA (T4 + 0),y 
2477 : c8 __ __ INY
2478 : 91 53 __ STA (T4 + 0),y 
247a : c8 __ __ INY
247b : 91 53 __ STA (T4 + 0),y 
247d : c8 __ __ INY
247e : 91 53 __ STA (T4 + 0),y 
2480 : c8 __ __ INY
2481 : 91 53 __ STA (T4 + 0),y 
2483 : c8 __ __ INY
2484 : 91 53 __ STA (T4 + 0),y 
2486 : c8 __ __ INY
2487 : 91 53 __ STA (T4 + 0),y 
2489 : c8 __ __ INY
248a : 91 53 __ STA (T4 + 0),y 
248c : a0 3c __ LDY #$3c
248e : 91 53 __ STA (T4 + 0),y 
2490 : c8 __ __ INY
2491 : 91 53 __ STA (T4 + 0),y 
2493 : c8 __ __ INY
2494 : 91 53 __ STA (T4 + 0),y 
2496 : c8 __ __ INY
2497 : 91 53 __ STA (T4 + 0),y 
2499 : ad c4 c7 LDA $c7c4 ; (sstack + 6)
249c : 85 03 __ STA WORK + 0 
249e : ad c5 c7 LDA $c7c5 ; (sstack + 7)
24a1 : 85 04 __ STA WORK + 1 
24a3 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
24a6 : 85 05 __ STA WORK + 2 
24a8 : ad c7 c7 LDA $c7c7 ; (sstack + 9)
24ab : 85 06 __ STA WORK + 3 
24ad : 20 44 42 JSR $4244 ; (freg + 20)
24b0 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
24b3 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
24b5 : a0 00 __ LDY #$00
24b7 : 91 53 __ STA (T4 + 0),y 
24b9 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
24bb : c8 __ __ INY
24bc : 91 53 __ STA (T4 + 0),y 
24be : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
24c0 : c8 __ __ INY
24c1 : 91 53 __ STA (T4 + 0),y 
24c3 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
24c5 : c8 __ __ INY
24c6 : 91 53 __ STA (T4 + 0),y 
24c8 : ad cc c7 LDA $c7cc ; (sstack + 14)
24cb : 85 43 __ STA T0 + 0 
24cd : ad cd c7 LDA $c7cd ; (sstack + 15)
24d0 : 85 44 __ STA T0 + 1 
24d2 : ad ce c7 LDA $c7ce ; (sstack + 16)
24d5 : 85 45 __ STA T0 + 2 
24d7 : ad cf c7 LDA $c7cf ; (sstack + 17)
24da : 85 46 __ STA T0 + 3 
24dc : ad c8 c7 LDA $c7c8 ; (sstack + 10)
24df : 85 47 __ STA T1 + 0 
24e1 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
24e3 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
24e6 : 85 48 __ STA T1 + 1 
24e8 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
24ea : ad ca c7 LDA $c7ca ; (sstack + 12)
24ed : 85 49 __ STA T1 + 2 
24ef : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
24f1 : ad cb c7 LDA $c7cb ; (sstack + 13)
24f4 : 85 4a __ STA T1 + 3 
24f6 : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
24f8 : a2 43 __ LDX #$43
24fa : 20 34 42 JSR $4234 ; (freg + 4)
24fd : 20 7b 42 JSR $427b ; (faddsub + 6)
2500 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
2502 : 85 4b __ STA T2 + 0 
2504 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
2506 : 85 4c __ STA T2 + 1 
2508 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
250a : 85 4d __ STA T2 + 2 
250c : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
250e : 85 4e __ STA T2 + 3 
2510 : a5 43 __ LDA T0 + 0 
2512 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
2514 : a5 44 __ LDA T0 + 1 
2516 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
2518 : a5 45 __ LDA T0 + 2 
251a : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
251c : a5 46 __ LDA T0 + 3 
251e : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
2520 : a2 47 __ LDX #$47
2522 : 20 34 42 JSR $4234 ; (freg + 4)
2525 : 20 75 42 JSR $4275 ; (faddsub + 0)
2528 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
252a : 85 4f __ STA T3 + 0 
252c : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
252e : 85 50 __ STA T3 + 1 
2530 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
2532 : 85 51 __ STA T3 + 2 
2534 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
2536 : 85 52 __ STA T3 + 3 
2538 : a9 00 __ LDA #$00
253a : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
253c : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
253e : a9 80 __ LDA #$80
2540 : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
2542 : a9 3f __ LDA #$3f
2544 : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
2546 : a2 4f __ LDX #$4f
2548 : 20 34 42 JSR $4234 ; (freg + 4)
254b : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
254e : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
2550 : 85 4f __ STA T3 + 0 
2552 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
2554 : 85 50 __ STA T3 + 1 
2556 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
2558 : 85 51 __ STA T3 + 2 
255a : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
255c : 85 52 __ STA T3 + 3 
255e : a5 4b __ LDA T2 + 0 
2560 : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
2562 : a5 4c __ LDA T2 + 1 
2564 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
2566 : a5 4d __ LDA T2 + 2 
2568 : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
256a : a5 4e __ LDA T2 + 3 
256c : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
256e : a2 4f __ LDX #$4f
2570 : 20 34 42 JSR $4234 ; (freg + 4)
2573 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2576 : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
2578 : a0 28 __ LDY #$28
257a : 91 53 __ STA (T4 + 0),y 
257c : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
257e : c8 __ __ INY
257f : 91 53 __ STA (T4 + 0),y 
2581 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
2583 : c8 __ __ INY
2584 : 91 53 __ STA (T4 + 0),y 
2586 : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
2588 : c8 __ __ INY
2589 : 91 53 __ STA (T4 + 0),y 
258b : a5 43 __ LDA T0 + 0 
258d : 85 1b __ STA ACCU + 0 ; (fieldOfViewInRadians + 0)
258f : a5 44 __ LDA T0 + 1 
2591 : 85 1c __ STA ACCU + 1 ; (fieldOfViewInRadians + 1)
2593 : a5 45 __ LDA T0 + 2 
2595 : 85 1d __ STA ACCU + 2 ; (fieldOfViewInRadians + 2)
2597 : a5 46 __ LDA T0 + 3 
2599 : 85 1e __ STA ACCU + 3 ; (fieldOfViewInRadians + 3)
259b : a2 47 __ LDX #$47
259d : 20 34 42 JSR $4234 ; (freg + 4)
25a0 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
25a3 : a2 4f __ LDX #$4f
25a5 : 20 34 42 JSR $4234 ; (freg + 4)
25a8 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
25ab : a9 00 __ LDA #$00
25ad : 85 03 __ STA WORK + 0 
25af : 85 04 __ STA WORK + 1 
25b1 : 85 05 __ STA WORK + 2 
25b3 : a9 c0 __ LDA #$c0
25b5 : 85 06 __ STA WORK + 3 
25b7 : 20 44 42 JSR $4244 ; (freg + 20)
25ba : 20 62 43 JSR $4362 ; (crt_fmul + 0)
25bd : a5 1b __ LDA ACCU + 0 ; (fieldOfViewInRadians + 0)
25bf : a0 38 __ LDY #$38
25c1 : 91 53 __ STA (T4 + 0),y 
25c3 : a5 1c __ LDA ACCU + 1 ; (fieldOfViewInRadians + 1)
25c5 : c8 __ __ INY
25c6 : 91 53 __ STA (T4 + 0),y 
25c8 : a5 1d __ LDA ACCU + 2 ; (fieldOfViewInRadians + 2)
25ca : c8 __ __ INY
25cb : 91 53 __ STA (T4 + 0),y 
25cd : a5 1e __ LDA ACCU + 3 ; (fieldOfViewInRadians + 3)
25cf : c8 __ __ INY
25d0 : 91 53 __ STA (T4 + 0),y 
.s3:
25d2 : ad bc c7 LDA $c7bc ; (mat4_make_perspective@stack + 0)
25d5 : 85 53 __ STA T4 + 0 
25d7 : ad bd c7 LDA $c7bd ; (mat4_make_perspective@stack + 1)
25da : 85 54 __ STA T4 + 1 
25dc : 60 __ __ RTS
--------------------------------------------------------------------
tan: ; tan(float)->float
;  13, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
25dd : a5 15 __ LDA P8 ; (f + 0)
25df : 85 0d __ STA P0 
25e1 : 85 4b __ STA T0 + 0 
25e3 : a5 16 __ LDA P9 ; (f + 1)
25e5 : 85 0e __ STA P1 
25e7 : 85 4c __ STA T0 + 1 
25e9 : a5 17 __ LDA P10 ; (f + 2)
25eb : 85 0f __ STA P2 
25ed : 85 4d __ STA T0 + 2 
25ef : a5 18 __ LDA P11 ; (f + 3)
25f1 : 85 10 __ STA P3 
25f3 : 85 4e __ STA T0 + 3 
25f5 : 20 5b 26 JSR $265b ; (sin.s4 + 0)
25f8 : a5 1b __ LDA ACCU + 0 
25fa : 85 4f __ STA T1 + 0 
25fc : a5 1c __ LDA ACCU + 1 
25fe : 85 50 __ STA T1 + 1 
2600 : a5 1d __ LDA ACCU + 2 
2602 : 85 51 __ STA T1 + 2 
2604 : a5 1e __ LDA ACCU + 3 
2606 : 85 52 __ STA T1 + 3 
2608 : a9 db __ LDA #$db
260a : 85 1b __ STA ACCU + 0 
260c : a9 3f __ LDA #$3f
260e : 85 1e __ STA ACCU + 3 
2610 : a9 0f __ LDA #$0f
2612 : 85 1c __ STA ACCU + 1 
2614 : a9 c9 __ LDA #$c9
2616 : 85 1d __ STA ACCU + 2 
2618 : a2 4b __ LDX #$4b
261a : 20 34 42 JSR $4234 ; (freg + 4)
261d : 20 7b 42 JSR $427b ; (faddsub + 6)
2620 : a5 1b __ LDA ACCU + 0 
2622 : 85 0d __ STA P0 
2624 : a5 1c __ LDA ACCU + 1 
2626 : 85 0e __ STA P1 
2628 : a5 1d __ LDA ACCU + 2 
262a : 85 0f __ STA P2 
262c : a5 1e __ LDA ACCU + 3 
262e : 85 10 __ STA P3 
2630 : 20 5b 26 JSR $265b ; (sin.s4 + 0)
2633 : a5 1b __ LDA ACCU + 0 
2635 : 85 4b __ STA T0 + 0 
2637 : a5 1c __ LDA ACCU + 1 
2639 : 85 4c __ STA T0 + 1 
263b : a5 1d __ LDA ACCU + 2 
263d : 85 4d __ STA T0 + 2 
263f : a5 1e __ LDA ACCU + 3 
2641 : 85 4e __ STA T0 + 3 
2643 : a5 4f __ LDA T1 + 0 
2645 : 85 1b __ STA ACCU + 0 
2647 : a5 50 __ LDA T1 + 1 
2649 : 85 1c __ STA ACCU + 1 
264b : a5 51 __ LDA T1 + 2 
264d : 85 1d __ STA ACCU + 2 
264f : a5 52 __ LDA T1 + 3 
2651 : 85 1e __ STA ACCU + 3 
2653 : a2 4b __ LDX #$4b
2655 : 20 34 42 JSR $4234 ; (freg + 4)
2658 : 4c 2a 44 JMP $442a ; (crt_fdiv + 0)
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
265b : a5 0d __ LDA P0 ; (f + 0)
265d : 85 43 __ STA T0 + 0 
265f : a5 0e __ LDA P1 ; (f + 1)
2661 : 85 44 __ STA T0 + 1 
2663 : a5 0f __ LDA P2 ; (f + 2)
2665 : 85 45 __ STA T0 + 2 
2667 : a5 10 __ LDA P3 ; (f + 3)
2669 : 29 7f __ AND #$7f
266b : 05 0f __ ORA P2 ; (f + 2)
266d : 05 0e __ ORA P1 ; (f + 1)
266f : 05 0d __ ORA P0 ; (f + 0)
2671 : f0 0e __ BEQ $2681 ; (sin.s5 + 0)
.s22:
2673 : 24 10 __ BIT P3 ; (f + 3)
2675 : 10 0a __ BPL $2681 ; (sin.s5 + 0)
.s21:
2677 : a9 00 __ LDA #$00
2679 : 85 47 __ STA T1 + 0 
267b : 85 48 __ STA T1 + 1 
267d : a9 bf __ LDA #$bf
267f : d0 08 __ BNE $2689 ; (sin.s6 + 0)
.s5:
2681 : a9 00 __ LDA #$00
2683 : 85 47 __ STA T1 + 0 
2685 : 85 48 __ STA T1 + 1 
2687 : a9 3f __ LDA #$3f
.s6:
2689 : 85 4a __ STA T1 + 3 
268b : a5 10 __ LDA P3 ; (f + 3)
268d : 29 7f __ AND #$7f
268f : 85 46 __ STA T0 + 3 
2691 : a9 80 __ LDA #$80
2693 : 85 49 __ STA T1 + 2 
2695 : a9 83 __ LDA #$83
2697 : 85 1b __ STA ACCU + 0 
2699 : a9 3e __ LDA #$3e
269b : 85 1e __ STA ACCU + 3 
269d : a9 f9 __ LDA #$f9
269f : 85 1c __ STA ACCU + 1 
26a1 : a9 22 __ LDA #$22
26a3 : 85 1d __ STA ACCU + 2 
26a5 : a2 43 __ LDX #$43
26a7 : 20 34 42 JSR $4234 ; (freg + 4)
26aa : 20 62 43 JSR $4362 ; (crt_fmul + 0)
26ad : a5 1b __ LDA ACCU + 0 
26af : 85 43 __ STA T0 + 0 
26b1 : a5 1c __ LDA ACCU + 1 
26b3 : 85 44 __ STA T0 + 1 
26b5 : a5 1d __ LDA ACCU + 2 
26b7 : 85 45 __ STA T0 + 2 
26b9 : a5 1e __ LDA ACCU + 3 
26bb : 85 46 __ STA T0 + 3 
26bd : 20 54 42 JSR $4254 ; (freg + 36)
26c0 : 20 d8 44 JSR $44d8 ; (fround + 0)
26c3 : a2 43 __ LDX #$43
26c5 : 20 34 42 JSR $4234 ; (freg + 4)
26c8 : a5 1e __ LDA ACCU + 3 
26ca : 49 80 __ EOR #$80
26cc : 85 1e __ STA ACCU + 3 
26ce : 20 7b 42 JSR $427b ; (faddsub + 6)
26d1 : a5 1b __ LDA ACCU + 0 
26d3 : 85 43 __ STA T0 + 0 
26d5 : a5 1c __ LDA ACCU + 1 
26d7 : 85 44 __ STA T0 + 1 
26d9 : a6 1d __ LDX ACCU + 2 
26db : 86 45 __ STX T0 + 2 
26dd : a5 1e __ LDA ACCU + 3 
26df : 85 46 __ STA T0 + 3 
26e1 : 30 3b __ BMI $271e ; (sin.s7 + 0)
.s16:
26e3 : c9 3f __ CMP #$3f
26e5 : d0 0b __ BNE $26f2 ; (sin.s20 + 0)
.s17:
26e7 : 8a __ __ TXA
26e8 : d0 08 __ BNE $26f2 ; (sin.s20 + 0)
.s18:
26ea : a5 1c __ LDA ACCU + 1 
26ec : d0 04 __ BNE $26f2 ; (sin.s20 + 0)
.s19:
26ee : a5 1b __ LDA ACCU + 0 
26f0 : f0 02 __ BEQ $26f4 ; (sin.s15 + 0)
.s20:
26f2 : 90 2a __ BCC $271e ; (sin.s7 + 0)
.s15:
26f4 : a9 00 __ LDA #$00
26f6 : 85 1b __ STA ACCU + 0 
26f8 : 85 1c __ STA ACCU + 1 
26fa : 85 1d __ STA ACCU + 2 
26fc : a9 bf __ LDA #$bf
26fe : 85 1e __ STA ACCU + 3 
2700 : a2 43 __ LDX #$43
2702 : 20 34 42 JSR $4234 ; (freg + 4)
2705 : 20 7b 42 JSR $427b ; (faddsub + 6)
2708 : a5 1b __ LDA ACCU + 0 
270a : 85 43 __ STA T0 + 0 
270c : a5 1c __ LDA ACCU + 1 
270e : 85 44 __ STA T0 + 1 
2710 : a5 1d __ LDA ACCU + 2 
2712 : 85 45 __ STA T0 + 2 
2714 : a5 1e __ LDA ACCU + 3 
2716 : 85 46 __ STA T0 + 3 
2718 : a5 4a __ LDA T1 + 3 
271a : 49 80 __ EOR #$80
271c : 85 4a __ STA T1 + 3 
.s7:
271e : a5 1e __ LDA ACCU + 3 
2720 : 30 38 __ BMI $275a ; (sin.s8 + 0)
.s10:
2722 : c9 3e __ CMP #$3e
2724 : d0 0e __ BNE $2734 ; (sin.s14 + 0)
.s11:
2726 : a5 1d __ LDA ACCU + 2 
2728 : c9 80 __ CMP #$80
272a : d0 08 __ BNE $2734 ; (sin.s14 + 0)
.s12:
272c : a5 1c __ LDA ACCU + 1 
272e : d0 04 __ BNE $2734 ; (sin.s14 + 0)
.s13:
2730 : a5 1b __ LDA ACCU + 0 
2732 : f0 02 __ BEQ $2736 ; (sin.s9 + 0)
.s14:
2734 : 90 24 __ BCC $275a ; (sin.s8 + 0)
.s9:
2736 : a9 00 __ LDA #$00
2738 : 85 1b __ STA ACCU + 0 
273a : 85 1c __ STA ACCU + 1 
273c : 85 1d __ STA ACCU + 2 
273e : a9 3f __ LDA #$3f
2740 : 85 1e __ STA ACCU + 3 
2742 : a2 43 __ LDX #$43
2744 : 20 34 42 JSR $4234 ; (freg + 4)
2747 : 20 75 42 JSR $4275 ; (faddsub + 0)
274a : a5 1b __ LDA ACCU + 0 
274c : 85 43 __ STA T0 + 0 
274e : a5 1c __ LDA ACCU + 1 
2750 : 85 44 __ STA T0 + 1 
2752 : a5 1d __ LDA ACCU + 2 
2754 : 85 45 __ STA T0 + 2 
2756 : a5 1e __ LDA ACCU + 3 
2758 : 85 46 __ STA T0 + 3 
.s8:
275a : a9 98 __ LDA #$98
275c : 85 1b __ STA ACCU + 0 
275e : a9 42 __ LDA #$42
2760 : 85 1e __ STA ACCU + 3 
2762 : a9 ec __ LDA #$ec
2764 : 85 1c __ STA ACCU + 1 
2766 : a9 5e __ LDA #$5e
2768 : 85 1d __ STA ACCU + 2 
276a : a2 43 __ LDX #$43
276c : 20 34 42 JSR $4234 ; (freg + 4)
276f : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2772 : a9 f8 __ LDA #$f8
2774 : 85 03 __ STA WORK + 0 
2776 : a9 41 __ LDA #$41
2778 : 85 06 __ STA WORK + 3 
277a : a9 c5 __ LDA #$c5
277c : 85 04 __ STA WORK + 1 
277e : a9 13 __ LDA #$13
2780 : 85 05 __ STA WORK + 2 
2782 : 20 44 42 JSR $4244 ; (freg + 20)
2785 : 20 7b 42 JSR $427b ; (faddsub + 6)
2788 : a2 43 __ LDX #$43
278a : 20 34 42 JSR $4234 ; (freg + 4)
278d : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2790 : a9 6e __ LDA #$6e
2792 : 85 03 __ STA WORK + 0 
2794 : a9 c2 __ LDA #$c2
2796 : 85 06 __ STA WORK + 3 
2798 : a9 27 __ LDA #$27
279a : 85 04 __ STA WORK + 1 
279c : a9 2a __ LDA #$2a
279e : 85 05 __ STA WORK + 2 
27a0 : 20 44 42 JSR $4244 ; (freg + 20)
27a3 : 20 7b 42 JSR $427b ; (faddsub + 6)
27a6 : a2 43 __ LDX #$43
27a8 : 20 34 42 JSR $4234 ; (freg + 4)
27ab : 20 62 43 JSR $4362 ; (crt_fmul + 0)
27ae : a9 df __ LDA #$df
27b0 : 85 03 __ STA WORK + 0 
27b2 : a9 3d __ LDA #$3d
27b4 : 85 06 __ STA WORK + 3 
27b6 : a9 af __ LDA #$af
27b8 : 85 04 __ STA WORK + 1 
27ba : a9 5c __ LDA #$5c
27bc : 85 05 __ STA WORK + 2 
27be : 20 44 42 JSR $4244 ; (freg + 20)
27c1 : 20 7b 42 JSR $427b ; (faddsub + 6)
27c4 : a2 43 __ LDX #$43
27c6 : 20 34 42 JSR $4234 ; (freg + 4)
27c9 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
27cc : a9 b6 __ LDA #$b6
27ce : 85 03 __ STA WORK + 0 
27d0 : a9 40 __ LDA #$40
27d2 : 85 06 __ STA WORK + 3 
27d4 : a9 0f __ LDA #$0f
27d6 : 85 04 __ STA WORK + 1 
27d8 : a9 c9 __ LDA #$c9
27da : 85 05 __ STA WORK + 2 
27dc : 20 44 42 JSR $4244 ; (freg + 20)
27df : 20 7b 42 JSR $427b ; (faddsub + 6)
27e2 : a2 43 __ LDX #$43
27e4 : 20 34 42 JSR $4234 ; (freg + 4)
27e7 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
27ea : a2 47 __ LDX #$47
27ec : 20 34 42 JSR $4234 ; (freg + 4)
27ef : 4c 62 43 JMP $4362 ; (crt_fmul + 0)
--------------------------------------------------------------------
sqrt: ; sqrt(float)->float
;  24, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
27f2 : a5 10 __ LDA P3 ; (f + 3)
27f4 : 29 7f __ AND #$7f
27f6 : 05 0f __ ORA P2 ; (f + 2)
27f8 : 05 0e __ ORA P1 ; (f + 1)
27fa : 05 0d __ ORA P0 ; (f + 0)
27fc : f0 0f __ BEQ $280d ; (sqrt.s6 + 0)
.s7:
27fe : 24 10 __ BIT P3 ; (f + 3)
2800 : 10 0b __ BPL $280d ; (sqrt.s6 + 0)
.s5:
2802 : a9 00 __ LDA #$00
2804 : 85 1b __ STA ACCU + 0 
2806 : 85 1c __ STA ACCU + 1 
2808 : 85 1d __ STA ACCU + 2 
280a : 85 1e __ STA ACCU + 3 
.s3:
280c : 60 __ __ RTS
.s6:
280d : a5 0d __ LDA P0 ; (f + 0)
280f : 85 1b __ STA ACCU + 0 
2811 : 8d ba c7 STA $c7ba ; (x + 0)
2814 : a5 0e __ LDA P1 ; (f + 1)
2816 : 85 1c __ STA ACCU + 1 
2818 : 8d bb c7 STA $c7bb ; (x + 1)
281b : a5 0f __ LDA P2 ; (f + 2)
281d : 85 1d __ STA ACCU + 2 
281f : 0a __ __ ASL
2820 : a5 10 __ LDA P3 ; (f + 3)
2822 : 85 1e __ STA ACCU + 3 
2824 : 2a __ __ ROL
2825 : aa __ __ TAX
2826 : a9 00 __ LDA #$00
2828 : 69 ff __ ADC #$ff
282a : 49 ff __ EOR #$ff
282c : a8 __ __ TAY
282d : 8a __ __ TXA
282e : 38 __ __ SEC
282f : e9 7f __ SBC #$7f
2831 : aa __ __ TAX
2832 : b0 01 __ BCS $2835 ; (sqrt.s9 + 0)
.s8:
2834 : 88 __ __ DEY
.s9:
2835 : 98 __ __ TYA
2836 : 0a __ __ ASL
2837 : 8a __ __ TXA
2838 : 69 00 __ ADC #$00
283a : 85 43 __ STA T1 + 0 
283c : 98 __ __ TYA
283d : 69 00 __ ADC #$00
283f : c9 80 __ CMP #$80
2841 : 6a __ __ ROR
2842 : 66 43 __ ROR T1 + 0 
2844 : a8 __ __ TAY
2845 : 18 __ __ CLC
2846 : a5 43 __ LDA T1 + 0 
2848 : 69 7f __ ADC #$7f
284a : aa __ __ TAX
284b : 98 __ __ TYA
284c : 69 00 __ ADC #$00
284e : 4a __ __ LSR
284f : 8a __ __ TXA
2850 : 6a __ __ ROR
2851 : 8d bd c7 STA $c7bd ; (x + 3)
2854 : a9 00 __ LDA #$00
2856 : 6a __ __ ROR
2857 : 8d bc c7 STA $c7bc ; (x + 2)
285a : ad ba c7 LDA $c7ba ; (x + 0)
285d : 85 43 __ STA T1 + 0 
285f : ad bb c7 LDA $c7bb ; (x + 1)
2862 : 85 44 __ STA T1 + 1 
2864 : ad bc c7 LDA $c7bc ; (x + 2)
2867 : 85 45 __ STA T1 + 2 
2869 : ad bd c7 LDA $c7bd ; (x + 3)
286c : 85 46 __ STA T1 + 3 
286e : a2 43 __ LDX #$43
2870 : 20 34 42 JSR $4234 ; (freg + 4)
2873 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
2876 : a2 43 __ LDX #$43
2878 : 20 34 42 JSR $4234 ; (freg + 4)
287b : 20 7b 42 JSR $427b ; (faddsub + 6)
287e : a9 00 __ LDA #$00
2880 : 85 03 __ STA WORK + 0 
2882 : 85 04 __ STA WORK + 1 
2884 : 85 05 __ STA WORK + 2 
2886 : a9 3f __ LDA #$3f
2888 : 85 06 __ STA WORK + 3 
288a : 20 44 42 JSR $4244 ; (freg + 20)
288d : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2890 : a5 1b __ LDA ACCU + 0 
2892 : 85 43 __ STA T1 + 0 
2894 : a5 1c __ LDA ACCU + 1 
2896 : 85 44 __ STA T1 + 1 
2898 : a5 1d __ LDA ACCU + 2 
289a : 85 45 __ STA T1 + 2 
289c : a5 1e __ LDA ACCU + 3 
289e : 85 46 __ STA T1 + 3 
28a0 : a5 0d __ LDA P0 ; (f + 0)
28a2 : 85 1b __ STA ACCU + 0 
28a4 : a5 0e __ LDA P1 ; (f + 1)
28a6 : 85 1c __ STA ACCU + 1 
28a8 : a5 0f __ LDA P2 ; (f + 2)
28aa : 85 1d __ STA ACCU + 2 
28ac : a5 10 __ LDA P3 ; (f + 3)
28ae : 85 1e __ STA ACCU + 3 
28b0 : a2 43 __ LDX #$43
28b2 : 20 34 42 JSR $4234 ; (freg + 4)
28b5 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
28b8 : a2 43 __ LDX #$43
28ba : 20 34 42 JSR $4234 ; (freg + 4)
28bd : 20 7b 42 JSR $427b ; (faddsub + 6)
28c0 : a9 00 __ LDA #$00
28c2 : 85 03 __ STA WORK + 0 
28c4 : 85 04 __ STA WORK + 1 
28c6 : 85 05 __ STA WORK + 2 
28c8 : a9 3f __ LDA #$3f
28ca : 85 06 __ STA WORK + 3 
28cc : 20 44 42 JSR $4244 ; (freg + 20)
28cf : 20 62 43 JSR $4362 ; (crt_fmul + 0)
28d2 : a5 1b __ LDA ACCU + 0 
28d4 : 85 43 __ STA T1 + 0 
28d6 : a5 1c __ LDA ACCU + 1 
28d8 : 85 44 __ STA T1 + 1 
28da : a5 1d __ LDA ACCU + 2 
28dc : 85 45 __ STA T1 + 2 
28de : a5 1e __ LDA ACCU + 3 
28e0 : 85 46 __ STA T1 + 3 
28e2 : a5 0d __ LDA P0 ; (f + 0)
28e4 : 85 1b __ STA ACCU + 0 
28e6 : a5 0e __ LDA P1 ; (f + 1)
28e8 : 85 1c __ STA ACCU + 1 
28ea : a5 0f __ LDA P2 ; (f + 2)
28ec : 85 1d __ STA ACCU + 2 
28ee : a5 10 __ LDA P3 ; (f + 3)
28f0 : 85 1e __ STA ACCU + 3 
28f2 : a2 43 __ LDX #$43
28f4 : 20 34 42 JSR $4234 ; (freg + 4)
28f7 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
28fa : a2 43 __ LDX #$43
28fc : 20 34 42 JSR $4234 ; (freg + 4)
28ff : 20 7b 42 JSR $427b ; (faddsub + 6)
2902 : a9 00 __ LDA #$00
2904 : 85 03 __ STA WORK + 0 
2906 : 85 04 __ STA WORK + 1 
2908 : 85 05 __ STA WORK + 2 
290a : a9 3f __ LDA #$3f
290c : 85 06 __ STA WORK + 3 
290e : 20 44 42 JSR $4244 ; (freg + 20)
2911 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2914 : a5 1b __ LDA ACCU + 0 
2916 : 85 43 __ STA T1 + 0 
2918 : a5 1c __ LDA ACCU + 1 
291a : 85 44 __ STA T1 + 1 
291c : a5 1d __ LDA ACCU + 2 
291e : 85 45 __ STA T1 + 2 
2920 : a5 1e __ LDA ACCU + 3 
2922 : 85 46 __ STA T1 + 3 
2924 : a5 0d __ LDA P0 ; (f + 0)
2926 : 85 1b __ STA ACCU + 0 
2928 : a5 0e __ LDA P1 ; (f + 1)
292a : 85 1c __ STA ACCU + 1 
292c : a5 0f __ LDA P2 ; (f + 2)
292e : 85 1d __ STA ACCU + 2 
2930 : a5 10 __ LDA P3 ; (f + 3)
2932 : 85 1e __ STA ACCU + 3 
2934 : a2 43 __ LDX #$43
2936 : 20 34 42 JSR $4234 ; (freg + 4)
2939 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
293c : a2 43 __ LDX #$43
293e : 20 34 42 JSR $4234 ; (freg + 4)
2941 : 20 7b 42 JSR $427b ; (faddsub + 6)
2944 : a9 00 __ LDA #$00
2946 : 85 03 __ STA WORK + 0 
2948 : 85 04 __ STA WORK + 1 
294a : 85 05 __ STA WORK + 2 
294c : a9 3f __ LDA #$3f
294e : 85 06 __ STA WORK + 3 
2950 : 20 44 42 JSR $4244 ; (freg + 20)
2953 : 4c 62 43 JMP $4362 ; (crt_fmul + 0)
--------------------------------------------------------------------
exp: ; exp(float)->float
;  19, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
2956 : a9 00 __ LDA #$00
2958 : 8d ba c7 STA $c7ba ; (x + 0)
295b : 8d bb c7 STA $c7bb ; (x + 1)
295e : a5 0d __ LDA P0 ; (f + 0)
2960 : 85 1b __ STA ACCU + 0 
2962 : a5 0e __ LDA P1 ; (f + 1)
2964 : 85 1c __ STA ACCU + 1 
2966 : a5 0f __ LDA P2 ; (f + 2)
2968 : 85 1d __ STA ACCU + 2 
296a : a5 10 __ LDA P3 ; (f + 3)
296c : 85 1e __ STA ACCU + 3 
296e : a9 3b __ LDA #$3b
2970 : 85 03 __ STA WORK + 0 
2972 : a9 3f __ LDA #$3f
2974 : 85 06 __ STA WORK + 3 
2976 : a9 aa __ LDA #$aa
2978 : 85 04 __ STA WORK + 1 
297a : a9 b8 __ LDA #$b8
297c : 85 05 __ STA WORK + 2 
297e : 20 44 42 JSR $4244 ; (freg + 20)
2981 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2984 : a5 1b __ LDA ACCU + 0 
2986 : 85 43 __ STA T0 + 0 
2988 : a5 1c __ LDA ACCU + 1 
298a : 85 44 __ STA T0 + 1 
298c : a5 1d __ LDA ACCU + 2 
298e : 85 45 __ STA T0 + 2 
2990 : a5 1e __ LDA ACCU + 3 
2992 : 85 46 __ STA T0 + 3 
2994 : 20 54 42 JSR $4254 ; (freg + 36)
2997 : 20 d8 44 JSR $44d8 ; (fround + 0)
299a : a5 1b __ LDA ACCU + 0 
299c : 85 47 __ STA T1 + 0 
299e : a5 1c __ LDA ACCU + 1 
29a0 : 85 48 __ STA T1 + 1 
29a2 : a5 1d __ LDA ACCU + 2 
29a4 : 85 49 __ STA T1 + 2 
29a6 : a5 1e __ LDA ACCU + 3 
29a8 : 85 4a __ STA T1 + 3 
29aa : 20 d2 45 JSR $45d2 ; (f32_to_i16 + 0)
29ad : 18 __ __ CLC
29ae : a5 1b __ LDA ACCU + 0 
29b0 : 69 7f __ ADC #$7f
29b2 : aa __ __ TAX
29b3 : a5 1c __ LDA ACCU + 1 
29b5 : 69 00 __ ADC #$00
29b7 : 4a __ __ LSR
29b8 : 8a __ __ TXA
29b9 : 6a __ __ ROR
29ba : 8d bd c7 STA $c7bd ; (x + 3)
29bd : a9 00 __ LDA #$00
29bf : 6a __ __ ROR
29c0 : 8d bc c7 STA $c7bc ; (x + 2)
29c3 : a5 43 __ LDA T0 + 0 
29c5 : 85 1b __ STA ACCU + 0 
29c7 : a5 44 __ LDA T0 + 1 
29c9 : 85 1c __ STA ACCU + 1 
29cb : a5 45 __ LDA T0 + 2 
29cd : 85 1d __ STA ACCU + 2 
29cf : a5 46 __ LDA T0 + 3 
29d1 : 85 1e __ STA ACCU + 3 
29d3 : a2 47 __ LDX #$47
29d5 : 20 34 42 JSR $4234 ; (freg + 4)
29d8 : 20 75 42 JSR $4275 ; (faddsub + 0)
29db : a5 1b __ LDA ACCU + 0 
29dd : 85 43 __ STA T0 + 0 
29df : a5 1c __ LDA ACCU + 1 
29e1 : 85 44 __ STA T0 + 1 
29e3 : a5 1d __ LDA ACCU + 2 
29e5 : 85 45 __ STA T0 + 2 
29e7 : a5 1e __ LDA ACCU + 3 
29e9 : 85 46 __ STA T0 + 3 
29eb : a9 fc __ LDA #$fc
29ed : 85 03 __ STA WORK + 0 
29ef : a9 3a __ LDA #$3a
29f1 : 85 06 __ STA WORK + 3 
29f3 : a9 4d __ LDA #$4d
29f5 : 85 04 __ STA WORK + 1 
29f7 : a9 f8 __ LDA #$f8
29f9 : 85 05 __ STA WORK + 2 
29fb : 20 44 42 JSR $4244 ; (freg + 20)
29fe : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2a01 : a9 70 __ LDA #$70
2a03 : 85 03 __ STA WORK + 0 
2a05 : a9 3c __ LDA #$3c
2a07 : 85 06 __ STA WORK + 3 
2a09 : a9 7c __ LDA #$7c
2a0b : 85 04 __ STA WORK + 1 
2a0d : a9 12 __ LDA #$12
2a0f : 85 05 __ STA WORK + 2 
2a11 : 20 44 42 JSR $4244 ; (freg + 20)
2a14 : 20 7b 42 JSR $427b ; (faddsub + 6)
2a17 : a2 43 __ LDX #$43
2a19 : 20 34 42 JSR $4234 ; (freg + 4)
2a1c : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2a1f : a9 42 __ LDA #$42
2a21 : 85 03 __ STA WORK + 0 
2a23 : a9 3d __ LDA #$3d
2a25 : 85 06 __ STA WORK + 3 
2a27 : a9 de __ LDA #$de
2a29 : 85 04 __ STA WORK + 1 
2a2b : a9 64 __ LDA #$64
2a2d : 85 05 __ STA WORK + 2 
2a2f : 20 44 42 JSR $4244 ; (freg + 20)
2a32 : 20 7b 42 JSR $427b ; (faddsub + 6)
2a35 : a2 43 __ LDX #$43
2a37 : 20 34 42 JSR $4234 ; (freg + 4)
2a3a : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2a3d : a9 2e __ LDA #$2e
2a3f : 85 03 __ STA WORK + 0 
2a41 : a9 3e __ LDA #$3e
2a43 : 85 06 __ STA WORK + 3 
2a45 : a9 e5 __ LDA #$e5
2a47 : 85 04 __ STA WORK + 1 
2a49 : a9 75 __ LDA #$75
2a4b : 85 05 __ STA WORK + 2 
2a4d : 20 44 42 JSR $4244 ; (freg + 20)
2a50 : 20 7b 42 JSR $427b ; (faddsub + 6)
2a53 : a2 43 __ LDX #$43
2a55 : 20 34 42 JSR $4234 ; (freg + 4)
2a58 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2a5b : a9 b7 __ LDA #$b7
2a5d : 85 03 __ STA WORK + 0 
2a5f : a9 3f __ LDA #$3f
2a61 : 85 06 __ STA WORK + 3 
2a63 : a9 72 __ LDA #$72
2a65 : 85 04 __ STA WORK + 1 
2a67 : a9 31 __ LDA #$31
2a69 : 85 05 __ STA WORK + 2 
2a6b : 20 44 42 JSR $4244 ; (freg + 20)
2a6e : 20 7b 42 JSR $427b ; (faddsub + 6)
2a71 : a2 43 __ LDX #$43
2a73 : 20 34 42 JSR $4234 ; (freg + 4)
2a76 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2a79 : a9 00 __ LDA #$00
2a7b : 85 03 __ STA WORK + 0 
2a7d : 85 04 __ STA WORK + 1 
2a7f : a9 80 __ LDA #$80
2a81 : 85 05 __ STA WORK + 2 
2a83 : a9 3f __ LDA #$3f
2a85 : 85 06 __ STA WORK + 3 
2a87 : 20 44 42 JSR $4244 ; (freg + 20)
2a8a : 20 7b 42 JSR $427b ; (faddsub + 6)
2a8d : ad ba c7 LDA $c7ba ; (x + 0)
2a90 : 85 03 __ STA WORK + 0 
2a92 : ad bb c7 LDA $c7bb ; (x + 1)
2a95 : 85 04 __ STA WORK + 1 
2a97 : ad bc c7 LDA $c7bc ; (x + 2)
2a9a : 85 05 __ STA WORK + 2 
2a9c : ad bd c7 LDA $c7bd ; (x + 3)
2a9f : 85 06 __ STA WORK + 3 
2aa1 : 20 44 42 JSR $4244 ; (freg + 20)
2aa4 : 4c 62 43 JMP $4362 ; (crt_fmul + 0)
--------------------------------------------------------------------
2aa7 : __ __ __ BYT 50 72 6f 6a 65 63 74 69 6e 67 20 76 65 72 74 69 : Projecting verti
2ab7 : __ __ __ BYT 63 65 73 00                                     : ces.
--------------------------------------------------------------------
vec3_norm: ; vec3_norm(struct Vector3*)->void
; 103, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2abb : a5 15 __ LDA P8 ; (v + 0)
2abd : 85 13 __ STA P6 
2abf : a5 16 __ LDA P9 ; (v + 1)
2ac1 : 85 14 __ STA P7 
2ac3 : 20 51 2b JSR $2b51 ; (vec3_length.s4 + 0)
2ac6 : a5 1b __ LDA ACCU + 0 
2ac8 : 85 43 __ STA T0 + 0 
2aca : a5 1c __ LDA ACCU + 1 
2acc : 85 44 __ STA T0 + 1 
2ace : a5 1d __ LDA ACCU + 2 
2ad0 : 85 45 __ STA T0 + 2 
2ad2 : a5 1e __ LDA ACCU + 3 
2ad4 : 85 46 __ STA T0 + 3 
2ad6 : a5 15 __ LDA P8 ; (v + 0)
2ad8 : 85 0d __ STA P0 
2ada : a5 16 __ LDA P9 ; (v + 1)
2adc : 85 0e __ STA P1 
2ade : a9 00 __ LDA #$00
2ae0 : 85 1b __ STA ACCU + 0 
2ae2 : 85 1c __ STA ACCU + 1 
2ae4 : a9 80 __ LDA #$80
2ae6 : 85 1d __ STA ACCU + 2 
2ae8 : a9 3f __ LDA #$3f
2aea : 85 1e __ STA ACCU + 3 
2aec : a2 43 __ LDX #$43
2aee : 20 34 42 JSR $4234 ; (freg + 4)
2af1 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
2af4 : a5 1b __ LDA ACCU + 0 
2af6 : 85 0f __ STA P2 
2af8 : a5 1c __ LDA ACCU + 1 
2afa : 85 10 __ STA P3 
2afc : a5 1d __ LDA ACCU + 2 
2afe : 85 11 __ STA P4 
2b00 : a5 1e __ LDA ACCU + 3 
2b02 : 85 12 __ STA P5 
2b04 : 4c 07 2b JMP $2b07 ; (vec3_scale.s4 + 0)
--------------------------------------------------------------------
vec3_scale: ; vec3_scale(struct Vector3*,float)->void
;  91, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2b07 : a5 0f __ LDA P2 ; (s + 0)
2b09 : 85 43 __ STA T0 + 0 
2b0b : a5 10 __ LDA P3 ; (s + 1)
2b0d : 85 44 __ STA T0 + 1 
2b0f : a5 11 __ LDA P4 ; (s + 2)
2b11 : 85 45 __ STA T0 + 2 
2b13 : a5 12 __ LDA P5 ; (s + 3)
2b15 : 85 46 __ STA T0 + 3 
2b17 : a0 00 __ LDY #$00
.l5:
2b19 : 84 47 __ STY T2 + 0 
2b1b : b1 0d __ LDA (P0),y ; (vd + 0)
2b1d : 85 1b __ STA ACCU + 0 
2b1f : c8 __ __ INY
2b20 : b1 0d __ LDA (P0),y ; (vd + 0)
2b22 : 85 1c __ STA ACCU + 1 
2b24 : c8 __ __ INY
2b25 : b1 0d __ LDA (P0),y ; (vd + 0)
2b27 : 85 1d __ STA ACCU + 2 
2b29 : c8 __ __ INY
2b2a : b1 0d __ LDA (P0),y ; (vd + 0)
2b2c : 85 1e __ STA ACCU + 3 
2b2e : a2 43 __ LDX #$43
2b30 : 20 34 42 JSR $4234 ; (freg + 4)
2b33 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2b36 : a5 1b __ LDA ACCU + 0 
2b38 : a4 47 __ LDY T2 + 0 
2b3a : 91 0d __ STA (P0),y ; (vd + 0)
2b3c : a5 1c __ LDA ACCU + 1 
2b3e : c8 __ __ INY
2b3f : 91 0d __ STA (P0),y ; (vd + 0)
2b41 : a5 1d __ LDA ACCU + 2 
2b43 : c8 __ __ INY
2b44 : 91 0d __ STA (P0),y ; (vd + 0)
2b46 : a5 1e __ LDA ACCU + 3 
2b48 : c8 __ __ INY
2b49 : 91 0d __ STA (P0),y ; (vd + 0)
2b4b : c8 __ __ INY
2b4c : c0 0c __ CPY #$0c
2b4e : d0 c9 __ BNE $2b19 ; (vec3_scale.l5 + 0)
.s3:
2b50 : 60 __ __ RTS
--------------------------------------------------------------------
vec3_length: ; vec3_length(const struct Vector3*)->float
; 105, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2b51 : a5 13 __ LDA P6 ; (v + 0)
2b53 : 85 0f __ STA P2 
2b55 : 85 0d __ STA P0 
2b57 : a5 14 __ LDA P7 ; (v + 1)
2b59 : 85 10 __ STA P3 
2b5b : 85 0e __ STA P1 
2b5d : 20 73 2b JSR $2b73 ; (vec3_vmul.s4 + 0)
2b60 : a5 1b __ LDA ACCU + 0 
2b62 : 85 0d __ STA P0 
2b64 : a5 1c __ LDA ACCU + 1 
2b66 : 85 0e __ STA P1 
2b68 : a5 1d __ LDA ACCU + 2 
2b6a : 85 0f __ STA P2 
2b6c : a5 1e __ LDA ACCU + 3 
2b6e : 85 10 __ STA P3 
2b70 : 4c f2 27 JMP $27f2 ; (sqrt.s4 + 0)
--------------------------------------------------------------------
vec3_vmul: ; vec3_vmul(const struct Vector3*,const struct Vector3*)->float
; 101, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2b73 : a0 08 __ LDY #$08
2b75 : b1 0d __ LDA (P0),y ; (v1 + 0)
2b77 : 85 43 __ STA T0 + 0 
2b79 : c8 __ __ INY
2b7a : b1 0d __ LDA (P0),y ; (v1 + 0)
2b7c : 85 44 __ STA T0 + 1 
2b7e : c8 __ __ INY
2b7f : b1 0d __ LDA (P0),y ; (v1 + 0)
2b81 : 85 45 __ STA T0 + 2 
2b83 : c8 __ __ INY
2b84 : b1 0d __ LDA (P0),y ; (v1 + 0)
2b86 : 85 46 __ STA T0 + 3 
2b88 : a0 08 __ LDY #$08
2b8a : b1 0f __ LDA (P2),y ; (v2 + 0)
2b8c : 85 1b __ STA ACCU + 0 
2b8e : c8 __ __ INY
2b8f : b1 0f __ LDA (P2),y ; (v2 + 0)
2b91 : 85 1c __ STA ACCU + 1 
2b93 : c8 __ __ INY
2b94 : b1 0f __ LDA (P2),y ; (v2 + 0)
2b96 : 85 1d __ STA ACCU + 2 
2b98 : c8 __ __ INY
2b99 : b1 0f __ LDA (P2),y ; (v2 + 0)
2b9b : 85 1e __ STA ACCU + 3 
2b9d : a2 43 __ LDX #$43
2b9f : 20 34 42 JSR $4234 ; (freg + 4)
2ba2 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2ba5 : a5 1b __ LDA ACCU + 0 
2ba7 : 85 43 __ STA T0 + 0 
2ba9 : a5 1c __ LDA ACCU + 1 
2bab : 85 44 __ STA T0 + 1 
2bad : a5 1d __ LDA ACCU + 2 
2baf : 85 45 __ STA T0 + 2 
2bb1 : a5 1e __ LDA ACCU + 3 
2bb3 : 85 46 __ STA T0 + 3 
2bb5 : a0 04 __ LDY #$04
2bb7 : b1 0f __ LDA (P2),y ; (v2 + 0)
2bb9 : 85 1b __ STA ACCU + 0 
2bbb : c8 __ __ INY
2bbc : b1 0f __ LDA (P2),y ; (v2 + 0)
2bbe : 85 1c __ STA ACCU + 1 
2bc0 : c8 __ __ INY
2bc1 : b1 0f __ LDA (P2),y ; (v2 + 0)
2bc3 : 85 1d __ STA ACCU + 2 
2bc5 : c8 __ __ INY
2bc6 : b1 0f __ LDA (P2),y ; (v2 + 0)
2bc8 : 85 1e __ STA ACCU + 3 
2bca : a0 04 __ LDY #$04
2bcc : b1 0d __ LDA (P0),y ; (v1 + 0)
2bce : 85 03 __ STA WORK + 0 
2bd0 : c8 __ __ INY
2bd1 : b1 0d __ LDA (P0),y ; (v1 + 0)
2bd3 : 85 04 __ STA WORK + 1 
2bd5 : c8 __ __ INY
2bd6 : b1 0d __ LDA (P0),y ; (v1 + 0)
2bd8 : 85 05 __ STA WORK + 2 
2bda : c8 __ __ INY
2bdb : b1 0d __ LDA (P0),y ; (v1 + 0)
2bdd : 85 06 __ STA WORK + 3 
2bdf : 20 44 42 JSR $4244 ; (freg + 20)
2be2 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2be5 : a5 1b __ LDA ACCU + 0 
2be7 : 85 47 __ STA T1 + 0 
2be9 : a5 1c __ LDA ACCU + 1 
2beb : 85 48 __ STA T1 + 1 
2bed : a5 1d __ LDA ACCU + 2 
2bef : 85 49 __ STA T1 + 2 
2bf1 : a5 1e __ LDA ACCU + 3 
2bf3 : 85 4a __ STA T1 + 3 
2bf5 : a0 00 __ LDY #$00
2bf7 : b1 0f __ LDA (P2),y ; (v2 + 0)
2bf9 : 85 1b __ STA ACCU + 0 
2bfb : c8 __ __ INY
2bfc : b1 0f __ LDA (P2),y ; (v2 + 0)
2bfe : 85 1c __ STA ACCU + 1 
2c00 : c8 __ __ INY
2c01 : b1 0f __ LDA (P2),y ; (v2 + 0)
2c03 : 85 1d __ STA ACCU + 2 
2c05 : c8 __ __ INY
2c06 : b1 0f __ LDA (P2),y ; (v2 + 0)
2c08 : 85 1e __ STA ACCU + 3 
2c0a : a0 00 __ LDY #$00
2c0c : b1 0d __ LDA (P0),y ; (v1 + 0)
2c0e : 85 03 __ STA WORK + 0 
2c10 : c8 __ __ INY
2c11 : b1 0d __ LDA (P0),y ; (v1 + 0)
2c13 : 85 04 __ STA WORK + 1 
2c15 : c8 __ __ INY
2c16 : b1 0d __ LDA (P0),y ; (v1 + 0)
2c18 : 85 05 __ STA WORK + 2 
2c1a : c8 __ __ INY
2c1b : b1 0d __ LDA (P0),y ; (v1 + 0)
2c1d : 85 06 __ STA WORK + 3 
2c1f : 20 44 42 JSR $4244 ; (freg + 20)
2c22 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2c25 : a2 47 __ LDX #$47
2c27 : 20 34 42 JSR $4234 ; (freg + 4)
2c2a : 20 7b 42 JSR $427b ; (faddsub + 6)
2c2d : a2 43 __ LDX #$43
2c2f : 20 34 42 JSR $4234 ; (freg + 4)
2c32 : 4c 7b 42 JMP $427b ; (faddsub + 6)
--------------------------------------------------------------------
mat4_scale: ; mat4_scale(struct Matrix4*,float)->void
; 227, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2c35 : a5 0f __ LDA P2 ; (s + 0)
2c37 : 85 43 __ STA T0 + 0 
2c39 : a5 10 __ LDA P3 ; (s + 1)
2c3b : 85 44 __ STA T0 + 1 
2c3d : a5 11 __ LDA P4 ; (s + 2)
2c3f : 85 45 __ STA T0 + 2 
2c41 : a5 12 __ LDA P5 ; (s + 3)
2c43 : 85 46 __ STA T0 + 3 
2c45 : a0 00 __ LDY #$00
.l5:
2c47 : 84 47 __ STY T2 + 0 
2c49 : b1 0d __ LDA (P0),y ; (md + 0)
2c4b : 85 1b __ STA ACCU + 0 
2c4d : c8 __ __ INY
2c4e : b1 0d __ LDA (P0),y ; (md + 0)
2c50 : 85 1c __ STA ACCU + 1 
2c52 : c8 __ __ INY
2c53 : b1 0d __ LDA (P0),y ; (md + 0)
2c55 : 85 1d __ STA ACCU + 2 
2c57 : c8 __ __ INY
2c58 : b1 0d __ LDA (P0),y ; (md + 0)
2c5a : 85 1e __ STA ACCU + 3 
2c5c : a2 43 __ LDX #$43
2c5e : 20 34 42 JSR $4234 ; (freg + 4)
2c61 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2c64 : a5 1b __ LDA ACCU + 0 
2c66 : a4 47 __ LDY T2 + 0 
2c68 : 91 0d __ STA (P0),y ; (md + 0)
2c6a : a5 1c __ LDA ACCU + 1 
2c6c : c8 __ __ INY
2c6d : 91 0d __ STA (P0),y ; (md + 0)
2c6f : a5 1d __ LDA ACCU + 2 
2c71 : c8 __ __ INY
2c72 : 91 0d __ STA (P0),y ; (md + 0)
2c74 : a5 1e __ LDA ACCU + 3 
2c76 : c8 __ __ INY
2c77 : 91 0d __ STA (P0),y ; (md + 0)
2c79 : c8 __ __ INY
2c7a : c0 40 __ CPY #$40
2c7c : d0 c9 __ BNE $2c47 ; (mat4_scale.l5 + 0)
.s3:
2c7e : 60 __ __ RTS
--------------------------------------------------------------------
mat4_set_rotate_x: ; mat4_set_rotate_x(struct Matrix4*,float)->void
; 246, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2c7f : ad be c7 LDA $c7be ; (sstack + 0)
2c82 : 85 4b __ STA T1 + 0 
2c84 : ad bf c7 LDA $c7bf ; (sstack + 1)
2c87 : 85 4c __ STA T1 + 1 
2c89 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
2c8c : 85 4d __ STA T1 + 2 
2c8e : ad c1 c7 LDA $c7c1 ; (sstack + 3)
2c91 : 85 4e __ STA T1 + 3 
2c93 : a9 db __ LDA #$db
2c95 : 85 1b __ STA ACCU + 0 ; (a + 2)
2c97 : a9 3f __ LDA #$3f
2c99 : 85 1e __ STA ACCU + 3 
2c9b : a9 0f __ LDA #$0f
2c9d : 85 1c __ STA ACCU + 1 ; (a + 3)
2c9f : a9 c9 __ LDA #$c9
2ca1 : 85 1d __ STA ACCU + 2 
2ca3 : a2 4b __ LDX #$4b
2ca5 : 20 34 42 JSR $4234 ; (freg + 4)
2ca8 : 20 7b 42 JSR $427b ; (faddsub + 6)
2cab : a5 1b __ LDA ACCU + 0 ; (a + 2)
2cad : 85 0d __ STA P0 
2caf : a5 1c __ LDA ACCU + 1 ; (a + 3)
2cb1 : 85 0e __ STA P1 
2cb3 : a5 1d __ LDA ACCU + 2 
2cb5 : 85 0f __ STA P2 
2cb7 : a5 1e __ LDA ACCU + 3 
2cb9 : 85 10 __ STA P3 
2cbb : 20 5b 26 JSR $265b ; (sin.s4 + 0)
2cbe : a5 1b __ LDA ACCU + 0 ; (a + 2)
2cc0 : 85 4f __ STA T2 + 0 
2cc2 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2cc4 : 85 50 __ STA T2 + 1 
2cc6 : a5 1d __ LDA ACCU + 2 
2cc8 : 85 51 __ STA T2 + 2 
2cca : a5 1e __ LDA ACCU + 3 
2ccc : 85 52 __ STA T2 + 3 
2cce : a5 4b __ LDA T1 + 0 
2cd0 : 85 0d __ STA P0 
2cd2 : a5 4c __ LDA T1 + 1 
2cd4 : 85 0e __ STA P1 
2cd6 : a5 4d __ LDA T1 + 2 
2cd8 : 85 0f __ STA P2 
2cda : a5 4e __ LDA T1 + 3 
2cdc : 85 10 __ STA P3 
2cde : 20 5b 26 JSR $265b ; (sin.s4 + 0)
2ce1 : a5 1e __ LDA ACCU + 3 
2ce3 : 49 80 __ EOR #$80
2ce5 : a0 1b __ LDY #$1b
2ce7 : 91 15 __ STA (P8),y ; (m + 0)
2ce9 : a9 00 __ LDA #$00
2ceb : a8 __ __ TAY
2cec : 91 15 __ STA (P8),y ; (m + 0)
2cee : c8 __ __ INY
2cef : 91 15 __ STA (P8),y ; (m + 0)
2cf1 : a9 80 __ LDA #$80
2cf3 : c8 __ __ INY
2cf4 : 91 15 __ STA (P8),y ; (m + 0)
2cf6 : a9 3f __ LDA #$3f
2cf8 : c8 __ __ INY
2cf9 : 91 15 __ STA (P8),y ; (m + 0)
2cfb : a9 00 __ LDA #$00
2cfd : c8 __ __ INY
2cfe : 91 15 __ STA (P8),y ; (m + 0)
2d00 : c8 __ __ INY
2d01 : 91 15 __ STA (P8),y ; (m + 0)
2d03 : c8 __ __ INY
2d04 : 91 15 __ STA (P8),y ; (m + 0)
2d06 : c8 __ __ INY
2d07 : 91 15 __ STA (P8),y ; (m + 0)
2d09 : c8 __ __ INY
2d0a : 91 15 __ STA (P8),y ; (m + 0)
2d0c : c8 __ __ INY
2d0d : 91 15 __ STA (P8),y ; (m + 0)
2d0f : c8 __ __ INY
2d10 : 91 15 __ STA (P8),y ; (m + 0)
2d12 : c8 __ __ INY
2d13 : 91 15 __ STA (P8),y ; (m + 0)
2d15 : c8 __ __ INY
2d16 : 91 15 __ STA (P8),y ; (m + 0)
2d18 : c8 __ __ INY
2d19 : 91 15 __ STA (P8),y ; (m + 0)
2d1b : c8 __ __ INY
2d1c : 91 15 __ STA (P8),y ; (m + 0)
2d1e : c8 __ __ INY
2d1f : 91 15 __ STA (P8),y ; (m + 0)
2d21 : c8 __ __ INY
2d22 : 91 15 __ STA (P8),y ; (m + 0)
2d24 : c8 __ __ INY
2d25 : 91 15 __ STA (P8),y ; (m + 0)
2d27 : c8 __ __ INY
2d28 : 91 15 __ STA (P8),y ; (m + 0)
2d2a : c8 __ __ INY
2d2b : 91 15 __ STA (P8),y ; (m + 0)
2d2d : a5 4f __ LDA T2 + 0 
2d2f : c8 __ __ INY
2d30 : 91 15 __ STA (P8),y ; (m + 0)
2d32 : a5 50 __ LDA T2 + 1 
2d34 : c8 __ __ INY
2d35 : 91 15 __ STA (P8),y ; (m + 0)
2d37 : a5 51 __ LDA T2 + 2 
2d39 : c8 __ __ INY
2d3a : 91 15 __ STA (P8),y ; (m + 0)
2d3c : a5 52 __ LDA T2 + 3 
2d3e : c8 __ __ INY
2d3f : 91 15 __ STA (P8),y ; (m + 0)
2d41 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2d43 : c8 __ __ INY
2d44 : 91 15 __ STA (P8),y ; (m + 0)
2d46 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2d48 : c8 __ __ INY
2d49 : 91 15 __ STA (P8),y ; (m + 0)
2d4b : a5 1d __ LDA ACCU + 2 
2d4d : c8 __ __ INY
2d4e : 91 15 __ STA (P8),y ; (m + 0)
2d50 : a9 00 __ LDA #$00
2d52 : a0 1c __ LDY #$1c
2d54 : 91 15 __ STA (P8),y ; (m + 0)
2d56 : c8 __ __ INY
2d57 : 91 15 __ STA (P8),y ; (m + 0)
2d59 : c8 __ __ INY
2d5a : 91 15 __ STA (P8),y ; (m + 0)
2d5c : c8 __ __ INY
2d5d : 91 15 __ STA (P8),y ; (m + 0)
2d5f : c8 __ __ INY
2d60 : 91 15 __ STA (P8),y ; (m + 0)
2d62 : c8 __ __ INY
2d63 : 91 15 __ STA (P8),y ; (m + 0)
2d65 : c8 __ __ INY
2d66 : 91 15 __ STA (P8),y ; (m + 0)
2d68 : c8 __ __ INY
2d69 : 91 15 __ STA (P8),y ; (m + 0)
2d6b : a5 1b __ LDA ACCU + 0 ; (a + 2)
2d6d : c8 __ __ INY
2d6e : 91 15 __ STA (P8),y ; (m + 0)
2d70 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2d72 : c8 __ __ INY
2d73 : 91 15 __ STA (P8),y ; (m + 0)
2d75 : a5 1d __ LDA ACCU + 2 
2d77 : c8 __ __ INY
2d78 : 91 15 __ STA (P8),y ; (m + 0)
2d7a : a5 1e __ LDA ACCU + 3 
2d7c : c8 __ __ INY
2d7d : 91 15 __ STA (P8),y ; (m + 0)
2d7f : a5 4f __ LDA T2 + 0 
2d81 : c8 __ __ INY
2d82 : 91 15 __ STA (P8),y ; (m + 0)
2d84 : a5 50 __ LDA T2 + 1 
2d86 : c8 __ __ INY
2d87 : 91 15 __ STA (P8),y ; (m + 0)
2d89 : a5 51 __ LDA T2 + 2 
2d8b : c8 __ __ INY
2d8c : 91 15 __ STA (P8),y ; (m + 0)
2d8e : a5 52 __ LDA T2 + 3 
2d90 : c8 __ __ INY
2d91 : 91 15 __ STA (P8),y ; (m + 0)
2d93 : a9 00 __ LDA #$00
2d95 : c8 __ __ INY
2d96 : 91 15 __ STA (P8),y ; (m + 0)
2d98 : c8 __ __ INY
2d99 : 91 15 __ STA (P8),y ; (m + 0)
2d9b : c8 __ __ INY
2d9c : 91 15 __ STA (P8),y ; (m + 0)
2d9e : c8 __ __ INY
2d9f : 91 15 __ STA (P8),y ; (m + 0)
2da1 : c8 __ __ INY
2da2 : 91 15 __ STA (P8),y ; (m + 0)
2da4 : c8 __ __ INY
2da5 : 91 15 __ STA (P8),y ; (m + 0)
2da7 : c8 __ __ INY
2da8 : 91 15 __ STA (P8),y ; (m + 0)
2daa : c8 __ __ INY
2dab : 91 15 __ STA (P8),y ; (m + 0)
2dad : c8 __ __ INY
2dae : 91 15 __ STA (P8),y ; (m + 0)
2db0 : c8 __ __ INY
2db1 : 91 15 __ STA (P8),y ; (m + 0)
2db3 : c8 __ __ INY
2db4 : 91 15 __ STA (P8),y ; (m + 0)
2db6 : c8 __ __ INY
2db7 : 91 15 __ STA (P8),y ; (m + 0)
2db9 : c8 __ __ INY
2dba : 91 15 __ STA (P8),y ; (m + 0)
2dbc : c8 __ __ INY
2dbd : 91 15 __ STA (P8),y ; (m + 0)
2dbf : c8 __ __ INY
2dc0 : 91 15 __ STA (P8),y ; (m + 0)
2dc2 : c8 __ __ INY
2dc3 : 91 15 __ STA (P8),y ; (m + 0)
2dc5 : c8 __ __ INY
2dc6 : 91 15 __ STA (P8),y ; (m + 0)
2dc8 : c8 __ __ INY
2dc9 : 91 15 __ STA (P8),y ; (m + 0)
2dcb : a9 80 __ LDA #$80
2dcd : c8 __ __ INY
2dce : 91 15 __ STA (P8),y ; (m + 0)
2dd0 : a9 3f __ LDA #$3f
2dd2 : a8 __ __ TAY
2dd3 : 91 15 __ STA (P8),y ; (m + 0)
.s3:
2dd5 : 60 __ __ RTS
--------------------------------------------------------------------
mat4_set_rotate_y: ; mat4_set_rotate_y(struct Matrix4*,float)->void
; 248, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
2dd6 : ad be c7 LDA $c7be ; (sstack + 0)
2dd9 : 85 4b __ STA T1 + 0 
2ddb : ad bf c7 LDA $c7bf ; (sstack + 1)
2dde : 85 4c __ STA T1 + 1 
2de0 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
2de3 : 85 4d __ STA T1 + 2 
2de5 : ad c1 c7 LDA $c7c1 ; (sstack + 3)
2de8 : 85 4e __ STA T1 + 3 
2dea : a9 db __ LDA #$db
2dec : 85 1b __ STA ACCU + 0 ; (a + 2)
2dee : a9 3f __ LDA #$3f
2df0 : 85 1e __ STA ACCU + 3 
2df2 : a9 0f __ LDA #$0f
2df4 : 85 1c __ STA ACCU + 1 ; (a + 3)
2df6 : a9 c9 __ LDA #$c9
2df8 : 85 1d __ STA ACCU + 2 
2dfa : a2 4b __ LDX #$4b
2dfc : 20 34 42 JSR $4234 ; (freg + 4)
2dff : 20 7b 42 JSR $427b ; (faddsub + 6)
2e02 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2e04 : 85 0d __ STA P0 
2e06 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2e08 : 85 0e __ STA P1 
2e0a : a5 1d __ LDA ACCU + 2 
2e0c : 85 0f __ STA P2 
2e0e : a5 1e __ LDA ACCU + 3 
2e10 : 85 10 __ STA P3 
2e12 : 20 5b 26 JSR $265b ; (sin.s4 + 0)
2e15 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2e17 : 85 4f __ STA T2 + 0 
2e19 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2e1b : 85 50 __ STA T2 + 1 
2e1d : a5 1d __ LDA ACCU + 2 
2e1f : 85 51 __ STA T2 + 2 
2e21 : a5 1e __ LDA ACCU + 3 
2e23 : 85 52 __ STA T2 + 3 
2e25 : a5 4b __ LDA T1 + 0 
2e27 : 85 0d __ STA P0 
2e29 : a5 4c __ LDA T1 + 1 
2e2b : 85 0e __ STA P1 
2e2d : a5 4d __ LDA T1 + 2 
2e2f : 85 0f __ STA P2 
2e31 : a5 4e __ LDA T1 + 3 
2e33 : 85 10 __ STA P3 
2e35 : 20 5b 26 JSR $265b ; (sin.s4 + 0)
2e38 : a5 1e __ LDA ACCU + 3 
2e3a : 49 80 __ EOR #$80
2e3c : a0 0b __ LDY #$0b
2e3e : 91 15 __ STA (P8),y ; (m + 0)
2e40 : a5 4f __ LDA T2 + 0 
2e42 : a0 00 __ LDY #$00
2e44 : 91 15 __ STA (P8),y ; (m + 0)
2e46 : a5 50 __ LDA T2 + 1 
2e48 : c8 __ __ INY
2e49 : 91 15 __ STA (P8),y ; (m + 0)
2e4b : a5 51 __ LDA T2 + 2 
2e4d : c8 __ __ INY
2e4e : 91 15 __ STA (P8),y ; (m + 0)
2e50 : a5 52 __ LDA T2 + 3 
2e52 : c8 __ __ INY
2e53 : 91 15 __ STA (P8),y ; (m + 0)
2e55 : a9 00 __ LDA #$00
2e57 : c8 __ __ INY
2e58 : 91 15 __ STA (P8),y ; (m + 0)
2e5a : c8 __ __ INY
2e5b : 91 15 __ STA (P8),y ; (m + 0)
2e5d : c8 __ __ INY
2e5e : 91 15 __ STA (P8),y ; (m + 0)
2e60 : c8 __ __ INY
2e61 : 91 15 __ STA (P8),y ; (m + 0)
2e63 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2e65 : c8 __ __ INY
2e66 : 91 15 __ STA (P8),y ; (m + 0)
2e68 : a5 1c __ LDA ACCU + 1 ; (a + 3)
2e6a : c8 __ __ INY
2e6b : 91 15 __ STA (P8),y ; (m + 0)
2e6d : a5 1d __ LDA ACCU + 2 
2e6f : c8 __ __ INY
2e70 : 91 15 __ STA (P8),y ; (m + 0)
2e72 : a9 00 __ LDA #$00
2e74 : a0 0c __ LDY #$0c
2e76 : 91 15 __ STA (P8),y ; (m + 0)
2e78 : c8 __ __ INY
2e79 : 91 15 __ STA (P8),y ; (m + 0)
2e7b : c8 __ __ INY
2e7c : 91 15 __ STA (P8),y ; (m + 0)
2e7e : c8 __ __ INY
2e7f : 91 15 __ STA (P8),y ; (m + 0)
2e81 : c8 __ __ INY
2e82 : 91 15 __ STA (P8),y ; (m + 0)
2e84 : c8 __ __ INY
2e85 : 91 15 __ STA (P8),y ; (m + 0)
2e87 : c8 __ __ INY
2e88 : 91 15 __ STA (P8),y ; (m + 0)
2e8a : c8 __ __ INY
2e8b : 91 15 __ STA (P8),y ; (m + 0)
2e8d : c8 __ __ INY
2e8e : 91 15 __ STA (P8),y ; (m + 0)
2e90 : c8 __ __ INY
2e91 : 91 15 __ STA (P8),y ; (m + 0)
2e93 : a9 80 __ LDA #$80
2e95 : c8 __ __ INY
2e96 : 91 15 __ STA (P8),y ; (m + 0)
2e98 : a9 3f __ LDA #$3f
2e9a : c8 __ __ INY
2e9b : 91 15 __ STA (P8),y ; (m + 0)
2e9d : a9 00 __ LDA #$00
2e9f : c8 __ __ INY
2ea0 : 91 15 __ STA (P8),y ; (m + 0)
2ea2 : c8 __ __ INY
2ea3 : 91 15 __ STA (P8),y ; (m + 0)
2ea5 : c8 __ __ INY
2ea6 : 91 15 __ STA (P8),y ; (m + 0)
2ea8 : c8 __ __ INY
2ea9 : 91 15 __ STA (P8),y ; (m + 0)
2eab : c8 __ __ INY
2eac : 91 15 __ STA (P8),y ; (m + 0)
2eae : c8 __ __ INY
2eaf : 91 15 __ STA (P8),y ; (m + 0)
2eb1 : c8 __ __ INY
2eb2 : 91 15 __ STA (P8),y ; (m + 0)
2eb4 : c8 __ __ INY
2eb5 : 91 15 __ STA (P8),y ; (m + 0)
2eb7 : a5 1b __ LDA ACCU + 0 ; (a + 2)
2eb9 : c8 __ __ INY
2eba : 91 15 __ STA (P8),y ; (m + 0)
2ebc : a5 1c __ LDA ACCU + 1 ; (a + 3)
2ebe : c8 __ __ INY
2ebf : 91 15 __ STA (P8),y ; (m + 0)
2ec1 : a5 1d __ LDA ACCU + 2 
2ec3 : c8 __ __ INY
2ec4 : 91 15 __ STA (P8),y ; (m + 0)
2ec6 : a5 1e __ LDA ACCU + 3 
2ec8 : c8 __ __ INY
2ec9 : 91 15 __ STA (P8),y ; (m + 0)
2ecb : a9 00 __ LDA #$00
2ecd : c8 __ __ INY
2ece : 91 15 __ STA (P8),y ; (m + 0)
2ed0 : c8 __ __ INY
2ed1 : 91 15 __ STA (P8),y ; (m + 0)
2ed3 : c8 __ __ INY
2ed4 : 91 15 __ STA (P8),y ; (m + 0)
2ed6 : c8 __ __ INY
2ed7 : 91 15 __ STA (P8),y ; (m + 0)
2ed9 : a5 4f __ LDA T2 + 0 
2edb : c8 __ __ INY
2edc : 91 15 __ STA (P8),y ; (m + 0)
2ede : a5 50 __ LDA T2 + 1 
2ee0 : c8 __ __ INY
2ee1 : 91 15 __ STA (P8),y ; (m + 0)
2ee3 : a5 51 __ LDA T2 + 2 
2ee5 : c8 __ __ INY
2ee6 : 91 15 __ STA (P8),y ; (m + 0)
2ee8 : a5 52 __ LDA T2 + 3 
2eea : c8 __ __ INY
2eeb : 91 15 __ STA (P8),y ; (m + 0)
2eed : a9 00 __ LDA #$00
2eef : c8 __ __ INY
2ef0 : 91 15 __ STA (P8),y ; (m + 0)
2ef2 : c8 __ __ INY
2ef3 : 91 15 __ STA (P8),y ; (m + 0)
2ef5 : c8 __ __ INY
2ef6 : 91 15 __ STA (P8),y ; (m + 0)
2ef8 : c8 __ __ INY
2ef9 : 91 15 __ STA (P8),y ; (m + 0)
2efb : c8 __ __ INY
2efc : 91 15 __ STA (P8),y ; (m + 0)
2efe : c8 __ __ INY
2eff : 91 15 __ STA (P8),y ; (m + 0)
2f01 : c8 __ __ INY
2f02 : 91 15 __ STA (P8),y ; (m + 0)
2f04 : c8 __ __ INY
2f05 : 91 15 __ STA (P8),y ; (m + 0)
2f07 : c8 __ __ INY
2f08 : 91 15 __ STA (P8),y ; (m + 0)
2f0a : c8 __ __ INY
2f0b : 91 15 __ STA (P8),y ; (m + 0)
2f0d : c8 __ __ INY
2f0e : 91 15 __ STA (P8),y ; (m + 0)
2f10 : c8 __ __ INY
2f11 : 91 15 __ STA (P8),y ; (m + 0)
2f13 : c8 __ __ INY
2f14 : 91 15 __ STA (P8),y ; (m + 0)
2f16 : c8 __ __ INY
2f17 : 91 15 __ STA (P8),y ; (m + 0)
2f19 : c8 __ __ INY
2f1a : 91 15 __ STA (P8),y ; (m + 0)
2f1c : c8 __ __ INY
2f1d : 91 15 __ STA (P8),y ; (m + 0)
2f1f : c8 __ __ INY
2f20 : 91 15 __ STA (P8),y ; (m + 0)
2f22 : c8 __ __ INY
2f23 : 91 15 __ STA (P8),y ; (m + 0)
2f25 : a9 80 __ LDA #$80
2f27 : c8 __ __ INY
2f28 : 91 15 __ STA (P8),y ; (m + 0)
2f2a : a9 3f __ LDA #$3f
2f2c : a8 __ __ TAY
2f2d : 91 15 __ STA (P8),y ; (m + 0)
.s3:
2f2f : 60 __ __ RTS
--------------------------------------------------------------------
mat4_rmmul: ; mat4_rmmul(struct Matrix4*,const struct Matrix4*)->void
; 233, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
2f30 : a5 53 __ LDA T9 + 0 
2f32 : 8d 9e c7 STA $c79e ; (mat4_rmmul@stack + 0)
2f35 : a5 54 __ LDA T9 + 1 
2f37 : 8d 9f c7 STA $c79f ; (mat4_rmmul@stack + 1)
.s4:
2f3a : a9 00 __ LDA #$00
.l5:
2f3c : 85 4f __ STA T5 + 0 
2f3e : 0a __ __ ASL
2f3f : 0a __ __ ASL
2f40 : 18 __ __ CLC
2f41 : 65 0d __ ADC P0 ; (md + 0)
2f43 : 85 50 __ STA T7 + 0 
2f45 : a5 0e __ LDA P1 ; (md + 1)
2f47 : 69 00 __ ADC #$00
2f49 : 85 51 __ STA T7 + 1 
2f4b : a5 0f __ LDA P2 ; (ms + 0)
2f4d : 85 53 __ STA T9 + 0 
2f4f : a9 00 __ LDA #$00
2f51 : 85 52 __ STA T8 + 0 
2f53 : a5 10 __ LDA P3 ; (ms + 1)
2f55 : 85 54 __ STA T9 + 1 
.l6:
2f57 : a0 0c __ LDY #$0c
2f59 : b1 50 __ LDA (T7 + 0),y 
2f5b : 85 1b __ STA ACCU + 0 
2f5d : c8 __ __ INY
2f5e : b1 50 __ LDA (T7 + 0),y 
2f60 : 85 1c __ STA ACCU + 1 
2f62 : c8 __ __ INY
2f63 : b1 50 __ LDA (T7 + 0),y 
2f65 : 85 1d __ STA ACCU + 2 
2f67 : c8 __ __ INY
2f68 : b1 50 __ LDA (T7 + 0),y 
2f6a : 85 1e __ STA ACCU + 3 
2f6c : a0 30 __ LDY #$30
2f6e : b1 53 __ LDA (T9 + 0),y 
2f70 : 85 03 __ STA WORK + 0 
2f72 : c8 __ __ INY
2f73 : b1 53 __ LDA (T9 + 0),y 
2f75 : 85 04 __ STA WORK + 1 
2f77 : c8 __ __ INY
2f78 : b1 53 __ LDA (T9 + 0),y 
2f7a : 85 05 __ STA WORK + 2 
2f7c : c8 __ __ INY
2f7d : b1 53 __ LDA (T9 + 0),y 
2f7f : 85 06 __ STA WORK + 3 
2f81 : 20 44 42 JSR $4244 ; (freg + 20)
2f84 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2f87 : a5 1b __ LDA ACCU + 0 
2f89 : 85 43 __ STA T0 + 0 
2f8b : a5 1c __ LDA ACCU + 1 
2f8d : 85 44 __ STA T0 + 1 
2f8f : a5 1d __ LDA ACCU + 2 
2f91 : 85 45 __ STA T0 + 2 
2f93 : a5 1e __ LDA ACCU + 3 
2f95 : 85 46 __ STA T0 + 3 
2f97 : a0 08 __ LDY #$08
2f99 : b1 50 __ LDA (T7 + 0),y 
2f9b : 85 1b __ STA ACCU + 0 
2f9d : c8 __ __ INY
2f9e : b1 50 __ LDA (T7 + 0),y 
2fa0 : 85 1c __ STA ACCU + 1 
2fa2 : c8 __ __ INY
2fa3 : b1 50 __ LDA (T7 + 0),y 
2fa5 : 85 1d __ STA ACCU + 2 
2fa7 : c8 __ __ INY
2fa8 : b1 50 __ LDA (T7 + 0),y 
2faa : 85 1e __ STA ACCU + 3 
2fac : a0 20 __ LDY #$20
2fae : b1 53 __ LDA (T9 + 0),y 
2fb0 : 85 03 __ STA WORK + 0 
2fb2 : c8 __ __ INY
2fb3 : b1 53 __ LDA (T9 + 0),y 
2fb5 : 85 04 __ STA WORK + 1 
2fb7 : c8 __ __ INY
2fb8 : b1 53 __ LDA (T9 + 0),y 
2fba : 85 05 __ STA WORK + 2 
2fbc : c8 __ __ INY
2fbd : b1 53 __ LDA (T9 + 0),y 
2fbf : 85 06 __ STA WORK + 3 
2fc1 : 20 44 42 JSR $4244 ; (freg + 20)
2fc4 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
2fc7 : a5 1b __ LDA ACCU + 0 
2fc9 : 85 47 __ STA T1 + 0 
2fcb : a5 1c __ LDA ACCU + 1 
2fcd : 85 48 __ STA T1 + 1 
2fcf : a5 1d __ LDA ACCU + 2 
2fd1 : 85 49 __ STA T1 + 2 
2fd3 : a5 1e __ LDA ACCU + 3 
2fd5 : 85 4a __ STA T1 + 3 
2fd7 : a0 04 __ LDY #$04
2fd9 : b1 50 __ LDA (T7 + 0),y 
2fdb : 85 1b __ STA ACCU + 0 
2fdd : c8 __ __ INY
2fde : b1 50 __ LDA (T7 + 0),y 
2fe0 : 85 1c __ STA ACCU + 1 
2fe2 : c8 __ __ INY
2fe3 : b1 50 __ LDA (T7 + 0),y 
2fe5 : 85 1d __ STA ACCU + 2 
2fe7 : c8 __ __ INY
2fe8 : b1 50 __ LDA (T7 + 0),y 
2fea : 85 1e __ STA ACCU + 3 
2fec : a0 10 __ LDY #$10
2fee : b1 53 __ LDA (T9 + 0),y 
2ff0 : 85 03 __ STA WORK + 0 
2ff2 : c8 __ __ INY
2ff3 : b1 53 __ LDA (T9 + 0),y 
2ff5 : 85 04 __ STA WORK + 1 
2ff7 : c8 __ __ INY
2ff8 : b1 53 __ LDA (T9 + 0),y 
2ffa : 85 05 __ STA WORK + 2 
2ffc : c8 __ __ INY
2ffd : b1 53 __ LDA (T9 + 0),y 
2fff : 85 06 __ STA WORK + 3 
3001 : 20 44 42 JSR $4244 ; (freg + 20)
3004 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3007 : a5 1b __ LDA ACCU + 0 
3009 : 85 4b __ STA T2 + 0 
300b : a5 1c __ LDA ACCU + 1 
300d : 85 4c __ STA T2 + 1 
300f : a5 1d __ LDA ACCU + 2 
3011 : 85 4d __ STA T2 + 2 
3013 : a5 1e __ LDA ACCU + 3 
3015 : 85 4e __ STA T2 + 3 
3017 : a0 00 __ LDY #$00
3019 : b1 50 __ LDA (T7 + 0),y 
301b : 85 1b __ STA ACCU + 0 
301d : c8 __ __ INY
301e : b1 50 __ LDA (T7 + 0),y 
3020 : 85 1c __ STA ACCU + 1 
3022 : c8 __ __ INY
3023 : b1 50 __ LDA (T7 + 0),y 
3025 : 85 1d __ STA ACCU + 2 
3027 : c8 __ __ INY
3028 : b1 50 __ LDA (T7 + 0),y 
302a : 85 1e __ STA ACCU + 3 
302c : a0 00 __ LDY #$00
302e : b1 53 __ LDA (T9 + 0),y 
3030 : 85 03 __ STA WORK + 0 
3032 : c8 __ __ INY
3033 : b1 53 __ LDA (T9 + 0),y 
3035 : 85 04 __ STA WORK + 1 
3037 : c8 __ __ INY
3038 : b1 53 __ LDA (T9 + 0),y 
303a : 85 05 __ STA WORK + 2 
303c : c8 __ __ INY
303d : b1 53 __ LDA (T9 + 0),y 
303f : 85 06 __ STA WORK + 3 
3041 : 20 44 42 JSR $4244 ; (freg + 20)
3044 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3047 : a2 4b __ LDX #$4b
3049 : 20 34 42 JSR $4234 ; (freg + 4)
304c : 20 7b 42 JSR $427b ; (faddsub + 6)
304f : a2 47 __ LDX #$47
3051 : 20 34 42 JSR $4234 ; (freg + 4)
3054 : 20 7b 42 JSR $427b ; (faddsub + 6)
3057 : a2 43 __ LDX #$43
3059 : 20 34 42 JSR $4234 ; (freg + 4)
305c : 20 7b 42 JSR $427b ; (faddsub + 6)
305f : a5 1b __ LDA ACCU + 0 
3061 : a6 52 __ LDX T8 + 0 
3063 : 9d ac c7 STA $c7ac,x ; (ma[0] + 0)
3066 : a5 1c __ LDA ACCU + 1 
3068 : 9d ad c7 STA $c7ad,x ; (ma[0] + 1)
306b : a5 1d __ LDA ACCU + 2 
306d : 9d ae c7 STA $c7ae,x ; (ma[0] + 2)
3070 : a5 1e __ LDA ACCU + 3 
3072 : 9d af c7 STA $c7af,x ; (ma[0] + 3)
3075 : 18 __ __ CLC
3076 : a5 53 __ LDA T9 + 0 
3078 : 69 04 __ ADC #$04
307a : 85 53 __ STA T9 + 0 
307c : 90 03 __ BCC $3081 ; (mat4_rmmul.s11 + 0)
.s10:
307e : e6 54 __ INC T9 + 1 
3080 : 18 __ __ CLC
.s11:
3081 : 8a __ __ TXA
3082 : 69 04 __ ADC #$04
3084 : 85 52 __ STA T8 + 0 
3086 : c9 10 __ CMP #$10
3088 : f0 03 __ BEQ $308d ; (mat4_rmmul.s7 + 0)
308a : 4c 57 2f JMP $2f57 ; (mat4_rmmul.l6 + 0)
.s7:
308d : a2 00 __ LDX #$00
.l8:
308f : bd ad c7 LDA $c7ad,x ; (ma[0] + 1)
3092 : 85 44 __ STA T0 + 1 
3094 : bd ae c7 LDA $c7ae,x ; (ma[0] + 2)
3097 : 85 45 __ STA T0 + 2 
3099 : bd af c7 LDA $c7af,x ; (ma[0] + 3)
309c : 85 46 __ STA T0 + 3 
309e : bd ac c7 LDA $c7ac,x ; (ma[0] + 0)
30a1 : a0 00 __ LDY #$00
30a3 : 91 50 __ STA (T7 + 0),y 
30a5 : a5 44 __ LDA T0 + 1 
30a7 : c8 __ __ INY
30a8 : 91 50 __ STA (T7 + 0),y 
30aa : a5 45 __ LDA T0 + 2 
30ac : c8 __ __ INY
30ad : 91 50 __ STA (T7 + 0),y 
30af : a5 46 __ LDA T0 + 3 
30b1 : c8 __ __ INY
30b2 : 91 50 __ STA (T7 + 0),y 
30b4 : 18 __ __ CLC
30b5 : a5 50 __ LDA T7 + 0 
30b7 : 69 04 __ ADC #$04
30b9 : 85 50 __ STA T7 + 0 
30bb : 90 03 __ BCC $30c0 ; (mat4_rmmul.s13 + 0)
.s12:
30bd : e6 51 __ INC T7 + 1 
30bf : 18 __ __ CLC
.s13:
30c0 : 8a __ __ TXA
30c1 : 69 04 __ ADC #$04
30c3 : aa __ __ TAX
30c4 : e0 10 __ CPX #$10
30c6 : d0 c7 __ BNE $308f ; (mat4_rmmul.l8 + 0)
.s9:
30c8 : 18 __ __ CLC
30c9 : a5 4f __ LDA T5 + 0 
30cb : 69 04 __ ADC #$04
30cd : c9 10 __ CMP #$10
30cf : f0 03 __ BEQ $30d4 ; (mat4_rmmul.s3 + 0)
30d1 : 4c 3c 2f JMP $2f3c ; (mat4_rmmul.l5 + 0)
.s3:
30d4 : ad 9e c7 LDA $c79e ; (mat4_rmmul@stack + 0)
30d7 : 85 53 __ STA T9 + 0 
30d9 : ad 9f c7 LDA $c79f ; (mat4_rmmul@stack + 1)
30dc : 85 54 __ STA T9 + 1 
30de : 60 __ __ RTS
--------------------------------------------------------------------
mat4_mmul: ; mat4_mmul(struct Matrix4*,const struct Matrix4*)->void
; 231, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
30df : a5 53 __ LDA T9 + 0 
30e1 : 8d 9e c7 STA $c79e ; (mat4_mmul@stack + 0)
30e4 : a5 54 __ LDA T9 + 1 
30e6 : 8d 9f c7 STA $c79f ; (mat4_mmul@stack + 1)
.s4:
30e9 : a9 00 __ LDA #$00
30eb : 85 4f __ STA T5 + 0 
.l5:
30ed : 0a __ __ ASL
30ee : 0a __ __ ASL
30ef : 18 __ __ CLC
30f0 : 65 0d __ ADC P0 ; (md + 0)
30f2 : 85 50 __ STA T7 + 0 
30f4 : a5 0e __ LDA P1 ; (md + 1)
30f6 : 69 00 __ ADC #$00
30f8 : 85 51 __ STA T7 + 1 
30fa : a5 0f __ LDA P2 ; (ms + 0)
30fc : 85 53 __ STA T9 + 0 
30fe : a9 00 __ LDA #$00
3100 : 85 52 __ STA T8 + 0 
3102 : a5 10 __ LDA P3 ; (ms + 1)
3104 : 85 54 __ STA T9 + 1 
.l6:
3106 : a0 30 __ LDY #$30
3108 : b1 50 __ LDA (T7 + 0),y 
310a : 85 1b __ STA ACCU + 0 
310c : c8 __ __ INY
310d : b1 50 __ LDA (T7 + 0),y 
310f : 85 1c __ STA ACCU + 1 
3111 : c8 __ __ INY
3112 : b1 50 __ LDA (T7 + 0),y 
3114 : 85 1d __ STA ACCU + 2 
3116 : c8 __ __ INY
3117 : b1 50 __ LDA (T7 + 0),y 
3119 : 85 1e __ STA ACCU + 3 
311b : a0 0c __ LDY #$0c
311d : b1 53 __ LDA (T9 + 0),y 
311f : 85 03 __ STA WORK + 0 
3121 : c8 __ __ INY
3122 : b1 53 __ LDA (T9 + 0),y 
3124 : 85 04 __ STA WORK + 1 
3126 : c8 __ __ INY
3127 : b1 53 __ LDA (T9 + 0),y 
3129 : 85 05 __ STA WORK + 2 
312b : c8 __ __ INY
312c : b1 53 __ LDA (T9 + 0),y 
312e : 85 06 __ STA WORK + 3 
3130 : 20 44 42 JSR $4244 ; (freg + 20)
3133 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3136 : a5 1b __ LDA ACCU + 0 
3138 : 85 43 __ STA T0 + 0 
313a : a5 1c __ LDA ACCU + 1 
313c : 85 44 __ STA T0 + 1 
313e : a5 1d __ LDA ACCU + 2 
3140 : 85 45 __ STA T0 + 2 
3142 : a5 1e __ LDA ACCU + 3 
3144 : 85 46 __ STA T0 + 3 
3146 : a0 20 __ LDY #$20
3148 : b1 50 __ LDA (T7 + 0),y 
314a : 85 1b __ STA ACCU + 0 
314c : c8 __ __ INY
314d : b1 50 __ LDA (T7 + 0),y 
314f : 85 1c __ STA ACCU + 1 
3151 : c8 __ __ INY
3152 : b1 50 __ LDA (T7 + 0),y 
3154 : 85 1d __ STA ACCU + 2 
3156 : c8 __ __ INY
3157 : b1 50 __ LDA (T7 + 0),y 
3159 : 85 1e __ STA ACCU + 3 
315b : a0 08 __ LDY #$08
315d : b1 53 __ LDA (T9 + 0),y 
315f : 85 03 __ STA WORK + 0 
3161 : c8 __ __ INY
3162 : b1 53 __ LDA (T9 + 0),y 
3164 : 85 04 __ STA WORK + 1 
3166 : c8 __ __ INY
3167 : b1 53 __ LDA (T9 + 0),y 
3169 : 85 05 __ STA WORK + 2 
316b : c8 __ __ INY
316c : b1 53 __ LDA (T9 + 0),y 
316e : 85 06 __ STA WORK + 3 
3170 : 20 44 42 JSR $4244 ; (freg + 20)
3173 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3176 : a5 1b __ LDA ACCU + 0 
3178 : 85 47 __ STA T1 + 0 
317a : a5 1c __ LDA ACCU + 1 
317c : 85 48 __ STA T1 + 1 
317e : a5 1d __ LDA ACCU + 2 
3180 : 85 49 __ STA T1 + 2 
3182 : a5 1e __ LDA ACCU + 3 
3184 : 85 4a __ STA T1 + 3 
3186 : a0 10 __ LDY #$10
3188 : b1 50 __ LDA (T7 + 0),y 
318a : 85 1b __ STA ACCU + 0 
318c : c8 __ __ INY
318d : b1 50 __ LDA (T7 + 0),y 
318f : 85 1c __ STA ACCU + 1 
3191 : c8 __ __ INY
3192 : b1 50 __ LDA (T7 + 0),y 
3194 : 85 1d __ STA ACCU + 2 
3196 : c8 __ __ INY
3197 : b1 50 __ LDA (T7 + 0),y 
3199 : 85 1e __ STA ACCU + 3 
319b : a0 04 __ LDY #$04
319d : b1 53 __ LDA (T9 + 0),y 
319f : 85 03 __ STA WORK + 0 
31a1 : c8 __ __ INY
31a2 : b1 53 __ LDA (T9 + 0),y 
31a4 : 85 04 __ STA WORK + 1 
31a6 : c8 __ __ INY
31a7 : b1 53 __ LDA (T9 + 0),y 
31a9 : 85 05 __ STA WORK + 2 
31ab : c8 __ __ INY
31ac : b1 53 __ LDA (T9 + 0),y 
31ae : 85 06 __ STA WORK + 3 
31b0 : 20 44 42 JSR $4244 ; (freg + 20)
31b3 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
31b6 : a5 1b __ LDA ACCU + 0 
31b8 : 85 4b __ STA T2 + 0 
31ba : a5 1c __ LDA ACCU + 1 
31bc : 85 4c __ STA T2 + 1 
31be : a5 1d __ LDA ACCU + 2 
31c0 : 85 4d __ STA T2 + 2 
31c2 : a5 1e __ LDA ACCU + 3 
31c4 : 85 4e __ STA T2 + 3 
31c6 : a0 00 __ LDY #$00
31c8 : b1 50 __ LDA (T7 + 0),y 
31ca : 85 1b __ STA ACCU + 0 
31cc : c8 __ __ INY
31cd : b1 50 __ LDA (T7 + 0),y 
31cf : 85 1c __ STA ACCU + 1 
31d1 : c8 __ __ INY
31d2 : b1 50 __ LDA (T7 + 0),y 
31d4 : 85 1d __ STA ACCU + 2 
31d6 : c8 __ __ INY
31d7 : b1 50 __ LDA (T7 + 0),y 
31d9 : 85 1e __ STA ACCU + 3 
31db : a0 00 __ LDY #$00
31dd : b1 53 __ LDA (T9 + 0),y 
31df : 85 03 __ STA WORK + 0 
31e1 : c8 __ __ INY
31e2 : b1 53 __ LDA (T9 + 0),y 
31e4 : 85 04 __ STA WORK + 1 
31e6 : c8 __ __ INY
31e7 : b1 53 __ LDA (T9 + 0),y 
31e9 : 85 05 __ STA WORK + 2 
31eb : c8 __ __ INY
31ec : b1 53 __ LDA (T9 + 0),y 
31ee : 85 06 __ STA WORK + 3 
31f0 : 20 44 42 JSR $4244 ; (freg + 20)
31f3 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
31f6 : a2 4b __ LDX #$4b
31f8 : 20 34 42 JSR $4234 ; (freg + 4)
31fb : 20 7b 42 JSR $427b ; (faddsub + 6)
31fe : a2 47 __ LDX #$47
3200 : 20 34 42 JSR $4234 ; (freg + 4)
3203 : 20 7b 42 JSR $427b ; (faddsub + 6)
3206 : a2 43 __ LDX #$43
3208 : 20 34 42 JSR $4234 ; (freg + 4)
320b : 20 7b 42 JSR $427b ; (faddsub + 6)
320e : a5 1b __ LDA ACCU + 0 
3210 : a6 52 __ LDX T8 + 0 
3212 : 9d ac c7 STA $c7ac,x ; (ma[0] + 0)
3215 : a5 1c __ LDA ACCU + 1 
3217 : 9d ad c7 STA $c7ad,x ; (ma[0] + 1)
321a : a5 1d __ LDA ACCU + 2 
321c : 9d ae c7 STA $c7ae,x ; (ma[0] + 2)
321f : a5 1e __ LDA ACCU + 3 
3221 : 9d af c7 STA $c7af,x ; (ma[0] + 3)
3224 : 18 __ __ CLC
3225 : a5 53 __ LDA T9 + 0 
3227 : 69 10 __ ADC #$10
3229 : 85 53 __ STA T9 + 0 
322b : 90 03 __ BCC $3230 ; (mat4_mmul.s11 + 0)
.s10:
322d : e6 54 __ INC T9 + 1 
322f : 18 __ __ CLC
.s11:
3230 : 8a __ __ TXA
3231 : 69 04 __ ADC #$04
3233 : 85 52 __ STA T8 + 0 
3235 : c9 10 __ CMP #$10
3237 : f0 03 __ BEQ $323c ; (mat4_mmul.s7 + 0)
3239 : 4c 06 31 JMP $3106 ; (mat4_mmul.l6 + 0)
.s7:
323c : a2 00 __ LDX #$00
323e : 86 4b __ STX T2 + 0 
.l8:
3240 : bd ad c7 LDA $c7ad,x ; (ma[0] + 1)
3243 : 85 44 __ STA T0 + 1 
3245 : bd ae c7 LDA $c7ae,x ; (ma[0] + 2)
3248 : 85 45 __ STA T0 + 2 
324a : bd af c7 LDA $c7af,x ; (ma[0] + 3)
324d : 85 46 __ STA T0 + 3 
324f : bd ac c7 LDA $c7ac,x ; (ma[0] + 0)
3252 : a4 4b __ LDY T2 + 0 
3254 : 91 50 __ STA (T7 + 0),y 
3256 : a5 44 __ LDA T0 + 1 
3258 : c8 __ __ INY
3259 : 91 50 __ STA (T7 + 0),y 
325b : a5 45 __ LDA T0 + 2 
325d : c8 __ __ INY
325e : 91 50 __ STA (T7 + 0),y 
3260 : a5 46 __ LDA T0 + 3 
3262 : c8 __ __ INY
3263 : 91 50 __ STA (T7 + 0),y 
3265 : 8a __ __ TXA
3266 : 18 __ __ CLC
3267 : 69 04 __ ADC #$04
3269 : aa __ __ TAX
326a : 98 __ __ TYA
326b : 18 __ __ CLC
326c : 69 0d __ ADC #$0d
326e : 85 4b __ STA T2 + 0 
3270 : c9 40 __ CMP #$40
3272 : d0 cc __ BNE $3240 ; (mat4_mmul.l8 + 0)
.s9:
3274 : e6 4f __ INC T5 + 0 
3276 : a5 4f __ LDA T5 + 0 
3278 : c9 04 __ CMP #$04
327a : f0 03 __ BEQ $327f ; (mat4_mmul.s3 + 0)
327c : 4c ed 30 JMP $30ed ; (mat4_mmul.l5 + 0)
.s3:
327f : ad 9e c7 LDA $c79e ; (mat4_mmul@stack + 0)
3282 : 85 53 __ STA T9 + 0 
3284 : ad 9f c7 LDA $c79f ; (mat4_mmul@stack + 1)
3287 : 85 54 __ STA T9 + 1 
3289 : 60 __ __ RTS
--------------------------------------------------------------------
vec3_project: ; vec3_project(struct Vector3*,const struct Matrix4*,const struct Vector3*)->void
; 259, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
328a : a5 13 __ LDA P6 ; (vd + 0)
328c : 85 0d __ STA P0 
328e : a5 14 __ LDA P7 ; (vd + 1)
3290 : 85 0e __ STA P1 
3292 : a5 15 __ LDA P8 ; (m + 0)
3294 : 85 0f __ STA P2 
3296 : a5 16 __ LDA P9 ; (m + 1)
3298 : 85 10 __ STA P3 
329a : a5 17 __ LDA P10 ; (vs + 0)
329c : 85 11 __ STA P4 
329e : a5 18 __ LDA P11 ; (vs + 1)
32a0 : 85 12 __ STA P5 
32a2 : 20 1e 33 JSR $331e ; (vec3_mmulp.s4 + 0)
32a5 : a0 00 __ LDY #$00
32a7 : b1 13 __ LDA (P6),y ; (vd + 0)
32a9 : 85 1b __ STA ACCU + 0 
32ab : c8 __ __ INY
32ac : b1 13 __ LDA (P6),y ; (vd + 0)
32ae : 85 1c __ STA ACCU + 1 
32b0 : c8 __ __ INY
32b1 : b1 13 __ LDA (P6),y ; (vd + 0)
32b3 : 85 1d __ STA ACCU + 2 
32b5 : c8 __ __ INY
32b6 : b1 13 __ LDA (P6),y ; (vd + 0)
32b8 : 85 1e __ STA ACCU + 3 
32ba : a0 08 __ LDY #$08
32bc : b1 13 __ LDA (P6),y ; (vd + 0)
32be : 85 47 __ STA T1 + 0 
32c0 : c8 __ __ INY
32c1 : b1 13 __ LDA (P6),y ; (vd + 0)
32c3 : 85 48 __ STA T1 + 1 
32c5 : c8 __ __ INY
32c6 : b1 13 __ LDA (P6),y ; (vd + 0)
32c8 : 85 49 __ STA T1 + 2 
32ca : c8 __ __ INY
32cb : b1 13 __ LDA (P6),y ; (vd + 0)
32cd : 85 4a __ STA T1 + 3 
32cf : a2 47 __ LDX #$47
32d1 : 20 34 42 JSR $4234 ; (freg + 4)
32d4 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
32d7 : a5 1b __ LDA ACCU + 0 
32d9 : a0 00 __ LDY #$00
32db : 91 13 __ STA (P6),y ; (vd + 0)
32dd : a5 1c __ LDA ACCU + 1 
32df : c8 __ __ INY
32e0 : 91 13 __ STA (P6),y ; (vd + 0)
32e2 : a5 1d __ LDA ACCU + 2 
32e4 : c8 __ __ INY
32e5 : 91 13 __ STA (P6),y ; (vd + 0)
32e7 : a5 1e __ LDA ACCU + 3 
32e9 : c8 __ __ INY
32ea : 91 13 __ STA (P6),y ; (vd + 0)
32ec : c8 __ __ INY
32ed : b1 13 __ LDA (P6),y ; (vd + 0)
32ef : 85 1b __ STA ACCU + 0 
32f1 : c8 __ __ INY
32f2 : b1 13 __ LDA (P6),y ; (vd + 0)
32f4 : 85 1c __ STA ACCU + 1 
32f6 : c8 __ __ INY
32f7 : b1 13 __ LDA (P6),y ; (vd + 0)
32f9 : 85 1d __ STA ACCU + 2 
32fb : c8 __ __ INY
32fc : b1 13 __ LDA (P6),y ; (vd + 0)
32fe : 85 1e __ STA ACCU + 3 
3300 : a2 47 __ LDX #$47
3302 : 20 34 42 JSR $4234 ; (freg + 4)
3305 : 20 2a 44 JSR $442a ; (crt_fdiv + 0)
3308 : a5 1b __ LDA ACCU + 0 
330a : a0 04 __ LDY #$04
330c : 91 13 __ STA (P6),y ; (vd + 0)
330e : a5 1c __ LDA ACCU + 1 
3310 : c8 __ __ INY
3311 : 91 13 __ STA (P6),y ; (vd + 0)
3313 : a5 1d __ LDA ACCU + 2 
3315 : c8 __ __ INY
3316 : 91 13 __ STA (P6),y ; (vd + 0)
3318 : a5 1e __ LDA ACCU + 3 
331a : c8 __ __ INY
331b : 91 13 __ STA (P6),y ; (vd + 0)
.s3:
331d : 60 __ __ RTS
--------------------------------------------------------------------
vec3_mmulp: ; vec3_mmulp(struct Vector3*,const struct Matrix4*,const struct Vector3*)->void
; 241, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
331e : a9 00 __ LDA #$00
.l5:
3320 : 85 4b __ STA T4 + 0 
3322 : a0 08 __ LDY #$08
3324 : b1 11 __ LDA (P4),y ; (vs + 0)
3326 : 85 1b __ STA ACCU + 0 
3328 : c8 __ __ INY
3329 : b1 11 __ LDA (P4),y ; (vs + 0)
332b : 85 1c __ STA ACCU + 1 
332d : c8 __ __ INY
332e : b1 11 __ LDA (P4),y ; (vs + 0)
3330 : 85 1d __ STA ACCU + 2 
3332 : c8 __ __ INY
3333 : b1 11 __ LDA (P4),y ; (vs + 0)
3335 : 85 1e __ STA ACCU + 3 
3337 : a0 20 __ LDY #$20
3339 : b1 0f __ LDA (P2),y ; (m + 0)
333b : 85 03 __ STA WORK + 0 
333d : c8 __ __ INY
333e : b1 0f __ LDA (P2),y ; (m + 0)
3340 : 85 04 __ STA WORK + 1 
3342 : c8 __ __ INY
3343 : b1 0f __ LDA (P2),y ; (m + 0)
3345 : 85 05 __ STA WORK + 2 
3347 : c8 __ __ INY
3348 : b1 0f __ LDA (P2),y ; (m + 0)
334a : 85 06 __ STA WORK + 3 
334c : 20 44 42 JSR $4244 ; (freg + 20)
334f : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3352 : a5 1b __ LDA ACCU + 0 
3354 : 85 43 __ STA T0 + 0 
3356 : a5 1c __ LDA ACCU + 1 
3358 : 85 44 __ STA T0 + 1 
335a : a5 1d __ LDA ACCU + 2 
335c : 85 45 __ STA T0 + 2 
335e : a5 1e __ LDA ACCU + 3 
3360 : 85 46 __ STA T0 + 3 
3362 : a0 04 __ LDY #$04
3364 : b1 11 __ LDA (P4),y ; (vs + 0)
3366 : 85 1b __ STA ACCU + 0 
3368 : c8 __ __ INY
3369 : b1 11 __ LDA (P4),y ; (vs + 0)
336b : 85 1c __ STA ACCU + 1 
336d : c8 __ __ INY
336e : b1 11 __ LDA (P4),y ; (vs + 0)
3370 : 85 1d __ STA ACCU + 2 
3372 : c8 __ __ INY
3373 : b1 11 __ LDA (P4),y ; (vs + 0)
3375 : 85 1e __ STA ACCU + 3 
3377 : a0 10 __ LDY #$10
3379 : b1 0f __ LDA (P2),y ; (m + 0)
337b : 85 03 __ STA WORK + 0 
337d : c8 __ __ INY
337e : b1 0f __ LDA (P2),y ; (m + 0)
3380 : 85 04 __ STA WORK + 1 
3382 : c8 __ __ INY
3383 : b1 0f __ LDA (P2),y ; (m + 0)
3385 : 85 05 __ STA WORK + 2 
3387 : c8 __ __ INY
3388 : b1 0f __ LDA (P2),y ; (m + 0)
338a : 85 06 __ STA WORK + 3 
338c : 20 44 42 JSR $4244 ; (freg + 20)
338f : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3392 : a5 1b __ LDA ACCU + 0 
3394 : 85 47 __ STA T1 + 0 
3396 : a5 1c __ LDA ACCU + 1 
3398 : 85 48 __ STA T1 + 1 
339a : a5 1d __ LDA ACCU + 2 
339c : 85 49 __ STA T1 + 2 
339e : a5 1e __ LDA ACCU + 3 
33a0 : 85 4a __ STA T1 + 3 
33a2 : a0 00 __ LDY #$00
33a4 : b1 11 __ LDA (P4),y ; (vs + 0)
33a6 : 85 1b __ STA ACCU + 0 
33a8 : c8 __ __ INY
33a9 : b1 11 __ LDA (P4),y ; (vs + 0)
33ab : 85 1c __ STA ACCU + 1 
33ad : c8 __ __ INY
33ae : b1 11 __ LDA (P4),y ; (vs + 0)
33b0 : 85 1d __ STA ACCU + 2 
33b2 : c8 __ __ INY
33b3 : b1 11 __ LDA (P4),y ; (vs + 0)
33b5 : 85 1e __ STA ACCU + 3 
33b7 : a0 00 __ LDY #$00
33b9 : b1 0f __ LDA (P2),y ; (m + 0)
33bb : 85 03 __ STA WORK + 0 
33bd : c8 __ __ INY
33be : b1 0f __ LDA (P2),y ; (m + 0)
33c0 : 85 04 __ STA WORK + 1 
33c2 : c8 __ __ INY
33c3 : b1 0f __ LDA (P2),y ; (m + 0)
33c5 : 85 05 __ STA WORK + 2 
33c7 : c8 __ __ INY
33c8 : b1 0f __ LDA (P2),y ; (m + 0)
33ca : 85 06 __ STA WORK + 3 
33cc : 20 44 42 JSR $4244 ; (freg + 20)
33cf : 20 62 43 JSR $4362 ; (crt_fmul + 0)
33d2 : a2 47 __ LDX #$47
33d4 : 20 34 42 JSR $4234 ; (freg + 4)
33d7 : 20 7b 42 JSR $427b ; (faddsub + 6)
33da : a2 43 __ LDX #$43
33dc : 20 34 42 JSR $4234 ; (freg + 4)
33df : 20 7b 42 JSR $427b ; (faddsub + 6)
33e2 : a0 30 __ LDY #$30
33e4 : b1 0f __ LDA (P2),y ; (m + 0)
33e6 : 85 03 __ STA WORK + 0 
33e8 : c8 __ __ INY
33e9 : b1 0f __ LDA (P2),y ; (m + 0)
33eb : 85 04 __ STA WORK + 1 
33ed : c8 __ __ INY
33ee : b1 0f __ LDA (P2),y ; (m + 0)
33f0 : 85 05 __ STA WORK + 2 
33f2 : c8 __ __ INY
33f3 : b1 0f __ LDA (P2),y ; (m + 0)
33f5 : 85 06 __ STA WORK + 3 
33f7 : 20 44 42 JSR $4244 ; (freg + 20)
33fa : 20 7b 42 JSR $427b ; (faddsub + 6)
33fd : a5 1b __ LDA ACCU + 0 
33ff : a6 4b __ LDX T4 + 0 
3401 : 9d b0 c7 STA $c7b0,x ; (vt.v[0] + 0)
3404 : a5 1c __ LDA ACCU + 1 
3406 : 9d b1 c7 STA $c7b1,x ; (vt.v[0] + 1)
3409 : a5 1d __ LDA ACCU + 2 
340b : 9d b2 c7 STA $c7b2,x ; (vt.v[0] + 2)
340e : a5 1e __ LDA ACCU + 3 
3410 : 9d b3 c7 STA $c7b3,x ; (vt.v[0] + 3)
3413 : 18 __ __ CLC
3414 : a5 0f __ LDA P2 ; (m + 0)
3416 : 69 04 __ ADC #$04
3418 : 85 0f __ STA P2 ; (m + 0)
341a : 90 03 __ BCC $341f ; (vec3_mmulp.s9 + 0)
.s8:
341c : e6 10 __ INC P3 ; (m + 1)
341e : 18 __ __ CLC
.s9:
341f : 8a __ __ TXA
3420 : 69 04 __ ADC #$04
3422 : c9 0c __ CMP #$0c
3424 : f0 03 __ BEQ $3429 ; (vec3_mmulp.s6 + 0)
3426 : 4c 20 33 JMP $3320 ; (vec3_mmulp.l5 + 0)
.s6:
3429 : a0 0b __ LDY #$0b
.l7:
342b : b9 b0 c7 LDA $c7b0,y ; (vt.v[0] + 0)
342e : 91 0d __ STA (P0),y ; (vd + 0)
3430 : 88 __ __ DEY
3431 : 10 f8 __ BPL $342b ; (vec3_mmulp.l7 + 0)
.s3:
3433 : 60 __ __ RTS
--------------------------------------------------------------------
3434 : __ __ __ BYT 53 6f 72 74 69 6e 67 20 73 75 72 66 61 63 65 73 : Sorting surfaces
3444 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
qsort: ; qsort(struct Surf*,i16)->void
;  76, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/func3d.c"
.s1:
3445 : 38 __ __ SEC
3446 : a5 23 __ LDA SP + 0 
3448 : e9 14 __ SBC #$14
344a : 85 23 __ STA SP + 0 
344c : b0 02 __ BCS $3450 ; (qsort.s1 + 11)
344e : c6 24 __ DEC SP + 1 
3450 : a0 0d __ LDY #$0d
3452 : a2 07 __ LDX #$07
3454 : b5 53 __ LDA T0 + 0,x 
3456 : 91 23 __ STA (SP + 0),y 
3458 : 88 __ __ DEY
3459 : ca __ __ DEX
345a : 10 f8 __ BPL $3454 ; (qsort.s1 + 15)
.s4:
345c : a0 18 __ LDY #$18
345e : b1 23 __ LDA (SP + 0),y 
3460 : 85 57 __ STA T5 + 0 
3462 : c8 __ __ INY
3463 : b1 23 __ LDA (SP + 0),y 
3465 : 30 0a __ BMI $3471 ; (qsort.s3 + 0)
.s19:
3467 : 85 58 __ STA T5 + 1 
3469 : d0 1e __ BNE $3489 ; (qsort.s5 + 0)
.s18:
346b : a5 57 __ LDA T5 + 0 
346d : c9 02 __ CMP #$02
346f : b0 18 __ BCS $3489 ; (qsort.s5 + 0)
.s3:
3471 : a0 0d __ LDY #$0d
3473 : a2 07 __ LDX #$07
3475 : b1 23 __ LDA (SP + 0),y 
3477 : 95 53 __ STA T0 + 0,x 
3479 : 88 __ __ DEY
347a : ca __ __ DEX
347b : 10 f8 __ BPL $3475 ; (qsort.s3 + 4)
347d : 18 __ __ CLC
347e : a5 23 __ LDA SP + 0 
3480 : 69 14 __ ADC #$14
3482 : 85 23 __ STA SP + 0 
3484 : 90 02 __ BCC $3488 ; (qsort.s3 + 23)
3486 : e6 24 __ INC SP + 1 
3488 : 60 __ __ RTS
.s5:
3489 : a0 16 __ LDY #$16
348b : b1 23 __ LDA (SP + 0),y 
348d : 85 47 __ STA T2 + 0 
348f : c8 __ __ INY
3490 : b1 23 __ LDA (SP + 0),y 
3492 : 85 48 __ STA T2 + 1 
3494 : 18 __ __ CLC
3495 : a5 23 __ LDA SP + 0 
3497 : 69 0e __ ADC #$0e
3499 : 85 1f __ STA ADDR + 0 
349b : a5 24 __ LDA SP + 1 
349d : 69 00 __ ADC #$00
349f : 85 20 __ STA ADDR + 1 
34a1 : a0 05 __ LDY #$05
.l6:
34a3 : b1 47 __ LDA (T2 + 0),y 
34a5 : 91 1f __ STA (ADDR + 0),y 
34a7 : 88 __ __ DEY
34a8 : 10 f9 __ BPL $34a3 ; (qsort.l6 + 0)
.s7:
34aa : 38 __ __ SEC
34ab : a5 57 __ LDA T5 + 0 
34ad : e9 01 __ SBC #$01
34af : 85 49 __ STA T3 + 0 
34b1 : a5 58 __ LDA T5 + 1 
34b3 : e9 00 __ SBC #$00
34b5 : 85 4a __ STA T3 + 1 
34b7 : 18 __ __ CLC
34b8 : a5 47 __ LDA T2 + 0 
34ba : 69 06 __ ADC #$06
34bc : 85 4b __ STA T4 + 0 
34be : a5 48 __ LDA T2 + 1 
34c0 : 69 00 __ ADC #$00
34c2 : 85 4c __ STA T4 + 1 
34c4 : a9 00 __ LDA #$00
34c6 : 85 59 __ STA T6 + 0 
34c8 : 85 5a __ STA T6 + 1 
34ca : a8 __ __ TAY
34cb : b1 47 __ LDA (T2 + 0),y 
34cd : 85 53 __ STA T0 + 0 
34cf : c8 __ __ INY
34d0 : b1 47 __ LDA (T2 + 0),y 
34d2 : 85 54 __ STA T0 + 1 
34d4 : c8 __ __ INY
34d5 : b1 47 __ LDA (T2 + 0),y 
34d7 : 85 55 __ STA T0 + 2 
34d9 : c8 __ __ INY
34da : b1 47 __ LDA (T2 + 0),y 
34dc : 85 56 __ STA T0 + 3 
.l8:
34de : a0 00 __ LDY #$00
34e0 : b1 4b __ LDA (T4 + 0),y 
34e2 : 85 1b __ STA ACCU + 0 
34e4 : c8 __ __ INY
34e5 : b1 4b __ LDA (T4 + 0),y 
34e7 : 85 1c __ STA ACCU + 1 
34e9 : c8 __ __ INY
34ea : b1 4b __ LDA (T4 + 0),y 
34ec : 85 1d __ STA ACCU + 2 
34ee : c8 __ __ INY
34ef : b1 4b __ LDA (T4 + 0),y 
34f1 : 85 1e __ STA ACCU + 3 
34f3 : a5 53 __ LDA T0 + 0 
34f5 : 85 03 __ STA WORK + 0 
34f7 : a5 54 __ LDA T0 + 1 
34f9 : 85 04 __ STA WORK + 1 
34fb : a5 55 __ LDA T0 + 2 
34fd : 85 05 __ STA WORK + 2 
34ff : a5 56 __ LDA T0 + 3 
3501 : 85 06 __ STA WORK + 3 
3503 : 20 65 46 JSR $4665 ; (crt_fcmp + 0)
3506 : 10 46 __ BPL $354e ; (qsort.s9 + 0)
.s13:
3508 : a5 59 __ LDA T6 + 0 
350a : 0a __ __ ASL
350b : a8 __ __ TAY
350c : a5 5a __ LDA T6 + 1 
350e : 2a __ __ ROL
350f : aa __ __ TAX
3510 : 98 __ __ TYA
3511 : 18 __ __ CLC
3512 : 65 59 __ ADC T6 + 0 
3514 : 85 43 __ STA T1 + 0 
3516 : 8a __ __ TXA
3517 : 65 5a __ ADC T6 + 1 
3519 : 06 43 __ ASL T1 + 0 
351b : 2a __ __ ROL
351c : aa __ __ TAX
351d : 18 __ __ CLC
351e : a5 47 __ LDA T2 + 0 
3520 : 65 43 __ ADC T1 + 0 
3522 : 85 43 __ STA T1 + 0 
3524 : 8a __ __ TXA
3525 : 65 48 __ ADC T2 + 1 
3527 : 85 44 __ STA T1 + 1 
3529 : a0 05 __ LDY #$05
.l14:
352b : b1 4b __ LDA (T4 + 0),y 
352d : 91 43 __ STA (T1 + 0),y 
352f : 88 __ __ DEY
3530 : 10 f9 __ BPL $352b ; (qsort.l14 + 0)
.s15:
3532 : 18 __ __ CLC
3533 : a5 43 __ LDA T1 + 0 
3535 : 69 06 __ ADC #$06
3537 : 85 1b __ STA ACCU + 0 
3539 : a5 44 __ LDA T1 + 1 
353b : 69 00 __ ADC #$00
353d : 85 1c __ STA ACCU + 1 
353f : a0 05 __ LDY #$05
.l16:
3541 : b1 1b __ LDA (ACCU + 0),y 
3543 : 91 4b __ STA (T4 + 0),y 
3545 : 88 __ __ DEY
3546 : 10 f9 __ BPL $3541 ; (qsort.l16 + 0)
.s17:
3548 : e6 59 __ INC T6 + 0 
354a : d0 02 __ BNE $354e ; (qsort.s9 + 0)
.s20:
354c : e6 5a __ INC T6 + 1 
.s9:
354e : 18 __ __ CLC
354f : a5 4b __ LDA T4 + 0 
3551 : 69 06 __ ADC #$06
3553 : 85 4b __ STA T4 + 0 
3555 : 90 02 __ BCC $3559 ; (qsort.s25 + 0)
.s24:
3557 : e6 4c __ INC T4 + 1 
.s25:
3559 : a5 49 __ LDA T3 + 0 
355b : d0 02 __ BNE $355f ; (qsort.s22 + 0)
.s21:
355d : c6 4a __ DEC T3 + 1 
.s22:
355f : c6 49 __ DEC T3 + 0 
3561 : f0 03 __ BEQ $3566 ; (qsort.s23 + 0)
3563 : 4c de 34 JMP $34de ; (qsort.l8 + 0)
.s23:
3566 : a5 4a __ LDA T3 + 1 
3568 : d0 f9 __ BNE $3563 ; (qsort.s22 + 4)
.s10:
356a : a5 59 __ LDA T6 + 0 
356c : 0a __ __ ASL
356d : a8 __ __ TAY
356e : a5 5a __ LDA T6 + 1 
3570 : 2a __ __ ROL
3571 : aa __ __ TAX
3572 : 98 __ __ TYA
3573 : 18 __ __ CLC
3574 : 65 59 __ ADC T6 + 0 
3576 : 85 53 __ STA T0 + 0 
3578 : 8a __ __ TXA
3579 : 65 5a __ ADC T6 + 1 
357b : 06 53 __ ASL T0 + 0 
357d : 2a __ __ ROL
357e : aa __ __ TAX
357f : 18 __ __ CLC
3580 : a5 47 __ LDA T2 + 0 
3582 : 65 53 __ ADC T0 + 0 
3584 : 85 53 __ STA T0 + 0 
3586 : 8a __ __ TXA
3587 : 65 48 __ ADC T2 + 1 
3589 : 85 54 __ STA T0 + 1 
358b : 18 __ __ CLC
358c : a5 23 __ LDA SP + 0 
358e : 69 0e __ ADC #$0e
3590 : 85 1b __ STA ACCU + 0 
3592 : a5 24 __ LDA SP + 1 
3594 : 69 00 __ ADC #$00
3596 : 85 1c __ STA ACCU + 1 
3598 : a0 05 __ LDY #$05
.l11:
359a : b1 1b __ LDA (ACCU + 0),y 
359c : 91 53 __ STA (T0 + 0),y 
359e : 88 __ __ DEY
359f : 10 f9 __ BPL $359a ; (qsort.l11 + 0)
.s12:
35a1 : a5 47 __ LDA T2 + 0 
35a3 : a0 02 __ LDY #$02
35a5 : 91 23 __ STA (SP + 0),y 
35a7 : a5 48 __ LDA T2 + 1 
35a9 : c8 __ __ INY
35aa : 91 23 __ STA (SP + 0),y 
35ac : a5 59 __ LDA T6 + 0 
35ae : c8 __ __ INY
35af : 91 23 __ STA (SP + 0),y 
35b1 : a5 5a __ LDA T6 + 1 
35b3 : c8 __ __ INY
35b4 : 91 23 __ STA (SP + 0),y 
35b6 : 20 45 34 JSR $3445 ; (qsort.s1 + 0)
35b9 : 18 __ __ CLC
35ba : a5 53 __ LDA T0 + 0 
35bc : 69 06 __ ADC #$06
35be : a0 02 __ LDY #$02
35c0 : 91 23 __ STA (SP + 0),y 
35c2 : a5 54 __ LDA T0 + 1 
35c4 : 69 00 __ ADC #$00
35c6 : c8 __ __ INY
35c7 : 91 23 __ STA (SP + 0),y 
35c9 : 38 __ __ SEC
35ca : a5 57 __ LDA T5 + 0 
35cc : e5 59 __ SBC T6 + 0 
35ce : a8 __ __ TAY
35cf : a5 58 __ LDA T5 + 1 
35d1 : e5 5a __ SBC T6 + 1 
35d3 : aa __ __ TAX
35d4 : 98 __ __ TYA
35d5 : 38 __ __ SEC
35d6 : e9 01 __ SBC #$01
35d8 : a0 04 __ LDY #$04
35da : 91 23 __ STA (SP + 0),y 
35dc : 8a __ __ TXA
35dd : e9 00 __ SBC #$00
35df : c8 __ __ INY
35e0 : 91 23 __ STA (SP + 0),y 
35e2 : 20 45 34 JSR $3445 ; (qsort.s1 + 0)
35e5 : 4c 71 34 JMP $3471 ; (qsort.s3 + 0)
--------------------------------------------------------------------
35e8 : __ __ __ BYT 44 72 61 77 69 6e 67 20 73 75 72 66 61 63 65 73 : Drawing surfaces
35f8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
vec3_diff: ; vec3_diff(struct Vector3*,const struct Vector3*,const struct Vector3*)->void
;  83, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
35f9 : a0 00 __ LDY #$00
.l5:
35fb : 84 47 __ STY T2 + 0 
35fd : b1 11 __ LDA (P4),y ; (v2 + 0)
35ff : 85 43 __ STA T1 + 0 
3601 : c8 __ __ INY
3602 : b1 11 __ LDA (P4),y ; (v2 + 0)
3604 : 85 44 __ STA T1 + 1 
3606 : c8 __ __ INY
3607 : b1 11 __ LDA (P4),y ; (v2 + 0)
3609 : 85 45 __ STA T1 + 2 
360b : c8 __ __ INY
360c : b1 11 __ LDA (P4),y ; (v2 + 0)
360e : 85 46 __ STA T1 + 3 
3610 : 88 __ __ DEY
3611 : 88 __ __ DEY
3612 : 88 __ __ DEY
3613 : b1 0f __ LDA (P2),y ; (v1 + 0)
3615 : 85 1b __ STA ACCU + 0 
3617 : c8 __ __ INY
3618 : b1 0f __ LDA (P2),y ; (v1 + 0)
361a : 85 1c __ STA ACCU + 1 
361c : c8 __ __ INY
361d : b1 0f __ LDA (P2),y ; (v1 + 0)
361f : 85 1d __ STA ACCU + 2 
3621 : c8 __ __ INY
3622 : b1 0f __ LDA (P2),y ; (v1 + 0)
3624 : 85 1e __ STA ACCU + 3 
3626 : a2 43 __ LDX #$43
3628 : 20 34 42 JSR $4234 ; (freg + 4)
362b : 20 75 42 JSR $4275 ; (faddsub + 0)
362e : a5 1b __ LDA ACCU + 0 
3630 : a4 47 __ LDY T2 + 0 
3632 : 91 0d __ STA (P0),y ; (vd + 0)
3634 : a5 1c __ LDA ACCU + 1 
3636 : c8 __ __ INY
3637 : 91 0d __ STA (P0),y ; (vd + 0)
3639 : a5 1d __ LDA ACCU + 2 
363b : c8 __ __ INY
363c : 91 0d __ STA (P0),y ; (vd + 0)
363e : a5 1e __ LDA ACCU + 3 
3640 : c8 __ __ INY
3641 : 91 0d __ STA (P0),y ; (vd + 0)
3643 : c8 __ __ INY
3644 : c0 0c __ CPY #$0c
3646 : d0 b3 __ BNE $35fb ; (vec3_diff.l5 + 0)
.s3:
3648 : 60 __ __ RTS
--------------------------------------------------------------------
vec3_xmul: ; vec3_xmul(struct Vector3*,const struct Vector3*,const struct Vector3*)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s1:
3649 : a2 0b __ LDX #$0b
364b : b5 53 __ LDA T4 + 0,x 
364d : 9d ae c7 STA $c7ae,x ; (vec3_xmul@stack + 0)
3650 : ca __ __ DEX
3651 : 10 f8 __ BPL $364b ; (vec3_xmul.s1 + 2)
.s4:
3653 : a0 08 __ LDY #$08
3655 : b1 0f __ LDA (P2),y ; (v1 + 0)
3657 : 85 4f __ STA T3 + 0 
3659 : c8 __ __ INY
365a : b1 0f __ LDA (P2),y ; (v1 + 0)
365c : 85 50 __ STA T3 + 1 
365e : c8 __ __ INY
365f : b1 0f __ LDA (P2),y ; (v1 + 0)
3661 : 85 51 __ STA T3 + 2 
3663 : c8 __ __ INY
3664 : b1 0f __ LDA (P2),y ; (v1 + 0)
3666 : 85 52 __ STA T3 + 3 
3668 : a0 08 __ LDY #$08
366a : b1 11 __ LDA (P4),y ; (v2 + 0)
366c : 85 57 __ STA T5 + 0 
366e : c8 __ __ INY
366f : b1 11 __ LDA (P4),y ; (v2 + 0)
3671 : 85 58 __ STA T5 + 1 
3673 : c8 __ __ INY
3674 : b1 11 __ LDA (P4),y ; (v2 + 0)
3676 : 85 59 __ STA T5 + 2 
3678 : c8 __ __ INY
3679 : b1 11 __ LDA (P4),y ; (v2 + 0)
367b : 85 5a __ STA T5 + 3 
367d : a0 04 __ LDY #$04
367f : b1 0f __ LDA (P2),y ; (v1 + 0)
3681 : 85 43 __ STA T0 + 0 
3683 : c8 __ __ INY
3684 : b1 0f __ LDA (P2),y ; (v1 + 0)
3686 : 85 44 __ STA T0 + 1 
3688 : c8 __ __ INY
3689 : b1 0f __ LDA (P2),y ; (v1 + 0)
368b : 85 45 __ STA T0 + 2 
368d : c8 __ __ INY
368e : b1 0f __ LDA (P2),y ; (v1 + 0)
3690 : 85 46 __ STA T0 + 3 
3692 : a0 00 __ LDY #$00
3694 : b1 11 __ LDA (P4),y ; (v2 + 0)
3696 : 85 47 __ STA T1 + 0 
3698 : 85 1b __ STA ACCU + 0 
369a : c8 __ __ INY
369b : b1 11 __ LDA (P4),y ; (v2 + 0)
369d : 85 48 __ STA T1 + 1 
369f : 85 1c __ STA ACCU + 1 
36a1 : c8 __ __ INY
36a2 : b1 11 __ LDA (P4),y ; (v2 + 0)
36a4 : 85 49 __ STA T1 + 2 
36a6 : 85 1d __ STA ACCU + 2 
36a8 : c8 __ __ INY
36a9 : b1 11 __ LDA (P4),y ; (v2 + 0)
36ab : 85 4a __ STA T1 + 3 
36ad : 85 1e __ STA ACCU + 3 
36af : a2 43 __ LDX #$43
36b1 : 20 34 42 JSR $4234 ; (freg + 4)
36b4 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
36b7 : a5 1b __ LDA ACCU + 0 
36b9 : 85 5b __ STA T7 + 0 
36bb : a5 1c __ LDA ACCU + 1 
36bd : 85 5c __ STA T7 + 1 
36bf : a5 1d __ LDA ACCU + 2 
36c1 : 85 5d __ STA T7 + 2 
36c3 : a5 1e __ LDA ACCU + 3 
36c5 : 85 5e __ STA T7 + 3 
36c7 : a0 04 __ LDY #$04
36c9 : b1 11 __ LDA (P4),y ; (v2 + 0)
36cb : 85 4b __ STA T2 + 0 
36cd : c8 __ __ INY
36ce : b1 11 __ LDA (P4),y ; (v2 + 0)
36d0 : 85 4c __ STA T2 + 1 
36d2 : c8 __ __ INY
36d3 : b1 11 __ LDA (P4),y ; (v2 + 0)
36d5 : 85 4d __ STA T2 + 2 
36d7 : c8 __ __ INY
36d8 : b1 11 __ LDA (P4),y ; (v2 + 0)
36da : 85 4e __ STA T2 + 3 
36dc : a0 00 __ LDY #$00
36de : b1 0f __ LDA (P2),y ; (v1 + 0)
36e0 : 85 1b __ STA ACCU + 0 
36e2 : 85 53 __ STA T4 + 0 
36e4 : c8 __ __ INY
36e5 : b1 0f __ LDA (P2),y ; (v1 + 0)
36e7 : 85 1c __ STA ACCU + 1 
36e9 : 85 54 __ STA T4 + 1 
36eb : c8 __ __ INY
36ec : b1 0f __ LDA (P2),y ; (v1 + 0)
36ee : 85 1d __ STA ACCU + 2 
36f0 : 85 55 __ STA T4 + 2 
36f2 : c8 __ __ INY
36f3 : b1 0f __ LDA (P2),y ; (v1 + 0)
36f5 : 85 1e __ STA ACCU + 3 
36f7 : 85 56 __ STA T4 + 3 
36f9 : a2 4b __ LDX #$4b
36fb : 20 34 42 JSR $4234 ; (freg + 4)
36fe : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3701 : a2 5b __ LDX #$5b
3703 : 20 34 42 JSR $4234 ; (freg + 4)
3706 : 20 75 42 JSR $4275 ; (faddsub + 0)
3709 : a5 1b __ LDA ACCU + 0 
370b : a0 08 __ LDY #$08
370d : 91 0d __ STA (P0),y ; (vd + 0)
370f : a5 1c __ LDA ACCU + 1 
3711 : c8 __ __ INY
3712 : 91 0d __ STA (P0),y ; (vd + 0)
3714 : a5 1d __ LDA ACCU + 2 
3716 : c8 __ __ INY
3717 : 91 0d __ STA (P0),y ; (vd + 0)
3719 : a5 1e __ LDA ACCU + 3 
371b : c8 __ __ INY
371c : 91 0d __ STA (P0),y ; (vd + 0)
371e : a5 43 __ LDA T0 + 0 
3720 : 85 1b __ STA ACCU + 0 
3722 : a5 44 __ LDA T0 + 1 
3724 : 85 1c __ STA ACCU + 1 
3726 : a5 45 __ LDA T0 + 2 
3728 : 85 1d __ STA ACCU + 2 
372a : a5 46 __ LDA T0 + 3 
372c : 85 1e __ STA ACCU + 3 
372e : a2 57 __ LDX #$57
3730 : 20 34 42 JSR $4234 ; (freg + 4)
3733 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3736 : a5 1b __ LDA ACCU + 0 
3738 : 85 43 __ STA T0 + 0 
373a : a5 1c __ LDA ACCU + 1 
373c : 85 44 __ STA T0 + 1 
373e : a5 1d __ LDA ACCU + 2 
3740 : 85 45 __ STA T0 + 2 
3742 : a5 1e __ LDA ACCU + 3 
3744 : 85 46 __ STA T0 + 3 
3746 : a5 4b __ LDA T2 + 0 
3748 : 85 1b __ STA ACCU + 0 
374a : a5 4c __ LDA T2 + 1 
374c : 85 1c __ STA ACCU + 1 
374e : a5 4d __ LDA T2 + 2 
3750 : 85 1d __ STA ACCU + 2 
3752 : a5 4e __ LDA T2 + 3 
3754 : 85 1e __ STA ACCU + 3 
3756 : a2 4f __ LDX #$4f
3758 : 20 34 42 JSR $4234 ; (freg + 4)
375b : 20 62 43 JSR $4362 ; (crt_fmul + 0)
375e : a2 43 __ LDX #$43
3760 : 20 34 42 JSR $4234 ; (freg + 4)
3763 : a5 1e __ LDA ACCU + 3 
3765 : 49 80 __ EOR #$80
3767 : 85 1e __ STA ACCU + 3 
3769 : 20 7b 42 JSR $427b ; (faddsub + 6)
376c : a5 1b __ LDA ACCU + 0 
376e : a0 00 __ LDY #$00
3770 : 91 0d __ STA (P0),y ; (vd + 0)
3772 : a5 1c __ LDA ACCU + 1 
3774 : c8 __ __ INY
3775 : 91 0d __ STA (P0),y ; (vd + 0)
3777 : a5 1d __ LDA ACCU + 2 
3779 : c8 __ __ INY
377a : 91 0d __ STA (P0),y ; (vd + 0)
377c : a5 1e __ LDA ACCU + 3 
377e : c8 __ __ INY
377f : 91 0d __ STA (P0),y ; (vd + 0)
3781 : a5 47 __ LDA T1 + 0 
3783 : 85 1b __ STA ACCU + 0 
3785 : a5 48 __ LDA T1 + 1 
3787 : 85 1c __ STA ACCU + 1 
3789 : a5 49 __ LDA T1 + 2 
378b : 85 1d __ STA ACCU + 2 
378d : a5 4a __ LDA T1 + 3 
378f : 85 1e __ STA ACCU + 3 
3791 : a2 4f __ LDX #$4f
3793 : 20 34 42 JSR $4234 ; (freg + 4)
3796 : 20 62 43 JSR $4362 ; (crt_fmul + 0)
3799 : a5 1b __ LDA ACCU + 0 
379b : 85 43 __ STA T0 + 0 
379d : a5 1c __ LDA ACCU + 1 
379f : 85 44 __ STA T0 + 1 
37a1 : a5 1d __ LDA ACCU + 2 
37a3 : 85 45 __ STA T0 + 2 
37a5 : a5 1e __ LDA ACCU + 3 
37a7 : 85 46 __ STA T0 + 3 
37a9 : a5 57 __ LDA T5 + 0 
37ab : 85 1b __ STA ACCU + 0 
37ad : a5 58 __ LDA T5 + 1 
37af : 85 1c __ STA ACCU + 1 
37b1 : a5 59 __ LDA T5 + 2 
37b3 : 85 1d __ STA ACCU + 2 
37b5 : a5 5a __ LDA T5 + 3 
37b7 : 85 1e __ STA ACCU + 3 
37b9 : a2 53 __ LDX #$53
37bb : 20 34 42 JSR $4234 ; (freg + 4)
37be : 20 62 43 JSR $4362 ; (crt_fmul + 0)
37c1 : a2 43 __ LDX #$43
37c3 : 20 34 42 JSR $4234 ; (freg + 4)
37c6 : a5 1e __ LDA ACCU + 3 
37c8 : 49 80 __ EOR #$80
37ca : 85 1e __ STA ACCU + 3 
37cc : 20 7b 42 JSR $427b ; (faddsub + 6)
37cf : a5 1b __ LDA ACCU + 0 
37d1 : a0 04 __ LDY #$04
37d3 : 91 0d __ STA (P0),y ; (vd + 0)
37d5 : a5 1c __ LDA ACCU + 1 
37d7 : c8 __ __ INY
37d8 : 91 0d __ STA (P0),y ; (vd + 0)
37da : a5 1d __ LDA ACCU + 2 
37dc : c8 __ __ INY
37dd : 91 0d __ STA (P0),y ; (vd + 0)
37df : a5 1e __ LDA ACCU + 3 
37e1 : c8 __ __ INY
37e2 : 91 0d __ STA (P0),y ; (vd + 0)
.s3:
37e4 : a2 0b __ LDX #$0b
37e6 : bd ae c7 LDA $c7ae,x ; (vec3_xmul@stack + 0)
37e9 : 95 53 __ STA T4 + 0,x 
37eb : ca __ __ DEX
37ec : 10 f8 __ BPL $37e6 ; (vec3_xmul.s3 + 2)
37ee : 60 __ __ RTS
--------------------------------------------------------------------
bmmc_quad_fill: ; bmmc_quad_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,i16,i16,i16,i16,const u8*)->void
;  43, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
37ef : a2 0d __ LDX #$0d
37f1 : b5 53 __ LDA T0 + 0,x ; (y2 + 0)
37f3 : 9d 8b c7 STA $c78b,x ; (bmmc_quad_fill@stack + 0)
37f6 : ca __ __ DEX
37f7 : 10 f8 __ BPL $37f1 ; (bmmc_quad_fill.s1 + 2)
.s4:
37f9 : ad ea c7 LDA $c7ea ; (sstack + 44)
37fc : 85 55 __ STA T1 + 0 ; (x3 + 0)
37fe : 8d d8 c7 STA $c7d8 ; (sstack + 26)
3801 : ad eb c7 LDA $c7eb ; (sstack + 45)
3804 : 85 56 __ STA T1 + 1 ; (x3 + 1)
3806 : 8d d9 c7 STA $c7d9 ; (sstack + 27)
3809 : ad ec c7 LDA $c7ec ; (sstack + 46)
380c : 85 57 __ STA T2 + 0 ; (y3 + 0)
380e : 8d da c7 STA $c7da ; (sstack + 28)
3811 : ad ed c7 LDA $c7ed ; (sstack + 47)
3814 : 85 58 __ STA T2 + 1 ; (y3 + 1)
3816 : 8d db c7 STA $c7db ; (sstack + 29)
3819 : ad ee c7 LDA $c7ee ; (sstack + 48)
381c : 85 59 __ STA T3 + 0 ; (pat + 0)
381e : 8d dc c7 STA $c7dc ; (sstack + 30)
3821 : ad ef c7 LDA $c7ef ; (sstack + 49)
3824 : 85 5a __ STA T3 + 1 ; (pat + 1)
3826 : 8d dd c7 STA $c7dd ; (sstack + 31)
3829 : ad f0 c7 LDA $c7f0 ; (sstack + 50)
382c : 85 5b __ STA T4 + 0 
382e : 8d de c7 STA $c7de ; (sstack + 32)
3831 : ad f1 c7 LDA $c7f1 ; (sstack + 51)
3834 : 85 5c __ STA T4 + 1 
3836 : 8d df c7 STA $c7df ; (sstack + 33)
3839 : ad f2 c7 LDA $c7f2 ; (sstack + 52)
383c : 8d e0 c7 STA $c7e0 ; (sstack + 34)
383f : ad f3 c7 LDA $c7f3 ; (sstack + 53)
3842 : 8d e1 c7 STA $c7e1 ; (sstack + 35)
3845 : ad f4 c7 LDA $c7f4 ; (sstack + 54)
3848 : 8d e2 c7 STA $c7e2 ; (sstack + 36)
384b : ad f5 c7 LDA $c7f5 ; (sstack + 55)
384e : 8d e3 c7 STA $c7e3 ; (sstack + 37)
3851 : ad f6 c7 LDA $c7f6 ; (sstack + 56)
3854 : 85 53 __ STA T0 + 0 ; (y2 + 0)
3856 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
3859 : ad f7 c7 LDA $c7f7 ; (sstack + 57)
385c : 85 54 __ STA T0 + 1 ; (y2 + 1)
385e : 8d e5 c7 STA $c7e5 ; (sstack + 39)
3861 : ad f8 c7 LDA $c7f8 ; (sstack + 58)
3864 : 85 5d __ STA T5 + 0 
3866 : 8d e6 c7 STA $c7e6 ; (sstack + 40)
3869 : ad f9 c7 LDA $c7f9 ; (sstack + 59)
386c : 85 5e __ STA T5 + 1 
386e : 8d e7 c7 STA $c7e7 ; (sstack + 41)
3871 : ad fe c7 LDA $c7fe ; (sstack + 64)
3874 : 85 5f __ STA T6 + 0 
3876 : 8d e8 c7 STA $c7e8 ; (sstack + 42)
3879 : ad ff c7 LDA $c7ff ; (sstack + 65)
387c : 85 60 __ STA T6 + 1 
387e : 8d e9 c7 STA $c7e9 ; (sstack + 43)
3881 : 20 f0 38 JSR $38f0 ; (bmmc_triangle_fill.s1 + 0)
3884 : a5 55 __ LDA T1 + 0 ; (x3 + 0)
3886 : 8d d8 c7 STA $c7d8 ; (sstack + 26)
3889 : a5 56 __ LDA T1 + 1 ; (x3 + 1)
388b : 8d d9 c7 STA $c7d9 ; (sstack + 27)
388e : a5 57 __ LDA T2 + 0 ; (y3 + 0)
3890 : 8d da c7 STA $c7da ; (sstack + 28)
3893 : a5 58 __ LDA T2 + 1 ; (y3 + 1)
3895 : 8d db c7 STA $c7db ; (sstack + 29)
3898 : a5 59 __ LDA T3 + 0 ; (pat + 0)
389a : 8d dc c7 STA $c7dc ; (sstack + 30)
389d : a5 5a __ LDA T3 + 1 ; (pat + 1)
389f : 8d dd c7 STA $c7dd ; (sstack + 31)
38a2 : a5 5b __ LDA T4 + 0 
38a4 : 8d de c7 STA $c7de ; (sstack + 32)
38a7 : a5 5c __ LDA T4 + 1 
38a9 : 8d df c7 STA $c7df ; (sstack + 33)
38ac : a5 53 __ LDA T0 + 0 ; (y2 + 0)
38ae : 8d e0 c7 STA $c7e0 ; (sstack + 34)
38b1 : a5 54 __ LDA T0 + 1 ; (y2 + 1)
38b3 : 8d e1 c7 STA $c7e1 ; (sstack + 35)
38b6 : a5 5d __ LDA T5 + 0 
38b8 : 8d e2 c7 STA $c7e2 ; (sstack + 36)
38bb : a5 5e __ LDA T5 + 1 
38bd : 8d e3 c7 STA $c7e3 ; (sstack + 37)
38c0 : ad fa c7 LDA $c7fa ; (sstack + 60)
38c3 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
38c6 : ad fb c7 LDA $c7fb ; (sstack + 61)
38c9 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
38cc : ad fc c7 LDA $c7fc ; (sstack + 62)
38cf : 8d e6 c7 STA $c7e6 ; (sstack + 40)
38d2 : ad fd c7 LDA $c7fd ; (sstack + 63)
38d5 : 8d e7 c7 STA $c7e7 ; (sstack + 41)
38d8 : a5 5f __ LDA T6 + 0 
38da : 8d e8 c7 STA $c7e8 ; (sstack + 42)
38dd : a5 60 __ LDA T6 + 1 
38df : 8d e9 c7 STA $c7e9 ; (sstack + 43)
38e2 : 20 f0 38 JSR $38f0 ; (bmmc_triangle_fill.s1 + 0)
.s3:
38e5 : a2 0d __ LDX #$0d
38e7 : bd 8b c7 LDA $c78b,x ; (bmmc_quad_fill@stack + 0)
38ea : 95 53 __ STA T0 + 0,x ; (y2 + 0)
38ec : ca __ __ DEX
38ed : 10 f8 __ BPL $38e7 ; (bmmc_quad_fill.s3 + 2)
38ef : 60 __ __ RTS
--------------------------------------------------------------------
bmmc_triangle_fill: ; bmmc_triangle_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,i16,i16,const u8*)->void
;  40, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
38f0 : a2 10 __ LDX #$10
38f2 : b5 53 __ LDA T1 + 0,x 
38f4 : 9d 99 c7 STA $c799,x ; (bmmc_triangle_fill@stack + 0)
38f7 : ca __ __ DEX
38f8 : 10 f8 __ BPL $38f2 ; (bmmc_triangle_fill.s1 + 2)
.s4:
38fa : ad de c7 LDA $c7de ; (sstack + 32)
38fd : 85 53 __ STA T1 + 0 
38ff : ad df c7 LDA $c7df ; (sstack + 33)
3902 : 85 54 __ STA T1 + 1 
3904 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3907 : c5 54 __ CMP T1 + 1 
3909 : d0 09 __ BNE $3914 ; (bmmc_triangle_fill.s62 + 0)
.s59:
390b : ad e2 c7 LDA $c7e2 ; (sstack + 36)
390e : c5 53 __ CMP T1 + 0 
.s60:
3910 : 90 08 __ BCC $391a ; (bmmc_triangle_fill.s49 + 0)
3912 : b0 20 __ BCS $3934 ; (bmmc_triangle_fill.s5 + 0)
.s62:
3914 : 45 54 __ EOR T1 + 1 
3916 : 10 f8 __ BPL $3910 ; (bmmc_triangle_fill.s60 + 0)
.s61:
3918 : 90 1a __ BCC $3934 ; (bmmc_triangle_fill.s5 + 0)
.s49:
391a : ad e3 c7 LDA $c7e3 ; (sstack + 37)
391d : cd e7 c7 CMP $c7e7 ; (sstack + 41)
3920 : d0 0b __ BNE $392d ; (bmmc_triangle_fill.s58 + 0)
.s55:
3922 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3925 : cd e6 c7 CMP $c7e6 ; (sstack + 40)
.s56:
3928 : b0 0a __ BCS $3934 ; (bmmc_triangle_fill.s5 + 0)
392a : 4c fa 3c JMP $3cfa ; (bmmc_triangle_fill.s50 + 0)
.s58:
392d : 4d e7 c7 EOR $c7e7 ; (sstack + 41)
3930 : 10 f6 __ BPL $3928 ; (bmmc_triangle_fill.s56 + 0)
.s57:
3932 : b0 f6 __ BCS $392a ; (bmmc_triangle_fill.s56 + 2)
.s5:
3934 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3937 : c5 54 __ CMP T1 + 1 
3939 : d0 0a __ BNE $3945 ; (bmmc_triangle_fill.s48 + 0)
.s45:
393b : ad e6 c7 LDA $c7e6 ; (sstack + 40)
393e : c5 53 __ CMP T1 + 0 
.s46:
3940 : b0 09 __ BCS $394b ; (bmmc_triangle_fill.s6 + 0)
3942 : 4c bf 3c JMP $3cbf ; (bmmc_triangle_fill.s42 + 0)
.s48:
3945 : 45 54 __ EOR T1 + 1 
3947 : 10 f7 __ BPL $3940 ; (bmmc_triangle_fill.s46 + 0)
.s47:
3949 : b0 f7 __ BCS $3942 ; (bmmc_triangle_fill.s46 + 2)
.s6:
394b : ad e7 c7 LDA $c7e7 ; (sstack + 41)
394e : cd e3 c7 CMP $c7e3 ; (sstack + 37)
3951 : d0 06 __ BNE $3959 ; (bmmc_triangle_fill.s44 + 0)
.s41:
3953 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3956 : 4c b9 3c JMP $3cb9 ; (bmmc_triangle_fill.s63 + 0)
.s44:
3959 : 4d e3 c7 EOR $c7e3 ; (sstack + 37)
395c : 30 04 __ BMI $3962 ; (bmmc_triangle_fill.s53 + 0)
.s52:
395e : b0 04 __ BCS $3964 ; (bmmc_triangle_fill.s7 + 0)
3960 : 90 0f __ BCC $3971 ; (bmmc_triangle_fill.s40 + 0)
.s53:
3962 : b0 0d __ BCS $3971 ; (bmmc_triangle_fill.s40 + 0)
.s7:
3964 : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3967 : 85 60 __ STA T7 + 0 
3969 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
396c : 85 61 __ STA T7 + 1 
396e : 4c 9f 39 JMP $399f ; (bmmc_triangle_fill.s8 + 0)
.s40:
3971 : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3974 : 85 60 __ STA T7 + 0 
3976 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3979 : 85 61 __ STA T7 + 1 
397b : ad e6 c7 LDA $c7e6 ; (sstack + 40)
397e : 8d e2 c7 STA $c7e2 ; (sstack + 36)
3981 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3984 : 8d e3 c7 STA $c7e3 ; (sstack + 37)
3987 : ad e0 c7 LDA $c7e0 ; (sstack + 34)
398a : ae e4 c7 LDX $c7e4 ; (sstack + 38)
398d : 8e e0 c7 STX $c7e0 ; (sstack + 34)
3990 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
3993 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3996 : ae e5 c7 LDX $c7e5 ; (sstack + 39)
3999 : 8e e1 c7 STX $c7e1 ; (sstack + 35)
399c : 8d e5 c7 STA $c7e5 ; (sstack + 39)
.s8:
399f : ad de c7 LDA $c7de ; (sstack + 32)
39a2 : 85 47 __ STA T5 + 0 
39a4 : ad df c7 LDA $c7df ; (sstack + 33)
39a7 : 85 48 __ STA T5 + 1 
39a9 : c5 61 __ CMP T7 + 1 
39ab : d0 08 __ BNE $39b5 ; (bmmc_triangle_fill.s39 + 0)
.s36:
39ad : a5 47 __ LDA T5 + 0 
39af : c5 60 __ CMP T7 + 0 
.s37:
39b1 : b0 08 __ BCS $39bb ; (bmmc_triangle_fill.s3 + 0)
39b3 : 90 11 __ BCC $39c6 ; (bmmc_triangle_fill.s9 + 0)
.s39:
39b5 : 45 61 __ EOR T7 + 1 
39b7 : 10 f8 __ BPL $39b1 ; (bmmc_triangle_fill.s37 + 0)
.s38:
39b9 : b0 0b __ BCS $39c6 ; (bmmc_triangle_fill.s9 + 0)
.s3:
39bb : a2 10 __ LDX #$10
39bd : bd 99 c7 LDA $c799,x ; (bmmc_triangle_fill@stack + 0)
39c0 : 95 53 __ STA T1 + 0,x 
39c2 : ca __ __ DEX
39c3 : 10 f8 __ BPL $39bd ; (bmmc_triangle_fill.s3 + 2)
39c5 : 60 __ __ RTS
.s9:
39c6 : ad dd c7 LDA $c7dd ; (sstack + 31)
39c9 : 85 46 __ STA T0 + 3 
39cb : 85 5b __ STA T3 + 3 
39cd : ad dc c7 LDA $c7dc ; (sstack + 30)
39d0 : 85 5a __ STA T3 + 2 
39d2 : 85 45 __ STA T0 + 2 
39d4 : a9 00 __ LDA #$00
39d6 : 85 43 __ STA T0 + 0 ; (pat + 0)
39d8 : 85 44 __ STA T0 + 1 ; (pat + 1)
39da : ad e4 c7 LDA $c7e4 ; (sstack + 38)
39dd : 85 62 __ STA T8 + 0 
39df : 38 __ __ SEC
39e0 : e5 45 __ SBC T0 + 2 
39e2 : 85 1d __ STA ACCU + 2 
39e4 : ad e5 c7 LDA $c7e5 ; (sstack + 39)
39e7 : 85 63 __ STA T8 + 1 
39e9 : e5 46 __ SBC T0 + 3 
39eb : 85 1e __ STA ACCU + 3 
39ed : 38 __ __ SEC
39ee : a5 60 __ LDA T7 + 0 
39f0 : e5 47 __ SBC T5 + 0 
39f2 : 85 03 __ STA WORK + 0 
39f4 : a5 61 __ LDA T7 + 1 
39f6 : e5 48 __ SBC T5 + 1 
39f8 : 85 04 __ STA WORK + 1 
39fa : 29 80 __ AND #$80
39fc : 10 02 __ BPL $3a00 ; (bmmc_triangle_fill.s9 + 58)
39fe : a9 ff __ LDA #$ff
3a00 : 85 06 __ STA WORK + 3 
3a02 : 85 05 __ STA WORK + 2 
3a04 : a9 00 __ LDA #$00
3a06 : 85 1b __ STA ACCU + 0 
3a08 : 85 1c __ STA ACCU + 1 
3a0a : 20 1c 47 JSR $471c ; (divs32 + 0)
3a0d : a5 1b __ LDA ACCU + 0 
3a0f : 85 5c __ STA T4 + 0 
3a11 : a5 1c __ LDA ACCU + 1 
3a13 : 85 5d __ STA T4 + 1 
3a15 : a5 1d __ LDA ACCU + 2 
3a17 : 85 5e __ STA T4 + 2 
3a19 : a5 1e __ LDA ACCU + 3 
3a1b : 85 5f __ STA T4 + 3 
3a1d : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3a20 : 85 56 __ STA T2 + 0 
3a22 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3a25 : 85 57 __ STA T2 + 1 
3a27 : a5 48 __ LDA T5 + 1 
3a29 : c5 57 __ CMP T2 + 1 
3a2b : d0 09 __ BNE $3a36 ; (bmmc_triangle_fill.s35 + 0)
.s32:
3a2d : a5 47 __ LDA T5 + 0 
3a2f : c5 56 __ CMP T2 + 0 
.s33:
3a31 : b0 09 __ BCS $3a3c ; (bmmc_triangle_fill.s10 + 0)
3a33 : 4c 6c 3b JMP $3b6c ; (bmmc_triangle_fill.s20 + 0)
.s35:
3a36 : 45 57 __ EOR T2 + 1 
3a38 : 10 f7 __ BPL $3a31 ; (bmmc_triangle_fill.s33 + 0)
.s34:
3a3a : b0 f7 __ BCS $3a33 ; (bmmc_triangle_fill.s33 + 2)
.s10:
3a3c : ad d8 c7 LDA $c7d8 ; (sstack + 26)
3a3f : 8d be c7 STA $c7be ; (sstack + 0)
3a42 : ad d9 c7 LDA $c7d9 ; (sstack + 27)
3a45 : 8d bf c7 STA $c7bf ; (sstack + 1)
3a48 : ad da c7 LDA $c7da ; (sstack + 28)
3a4b : 8d c0 c7 STA $c7c0 ; (sstack + 2)
3a4e : ad db c7 LDA $c7db ; (sstack + 29)
3a51 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
3a54 : a5 56 __ LDA T2 + 0 
3a56 : 8d d2 c7 STA $c7d2 ; (sstack + 20)
3a59 : a5 57 __ LDA T2 + 1 
3a5b : 8d d3 c7 STA $c7d3 ; (sstack + 21)
3a5e : a5 60 __ LDA T7 + 0 
3a60 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
3a63 : 38 __ __ SEC
3a64 : e5 56 __ SBC T2 + 0 
3a66 : 85 03 __ STA WORK + 0 
3a68 : a5 61 __ LDA T7 + 1 
3a6a : 8d d5 c7 STA $c7d5 ; (sstack + 23)
3a6d : e5 57 __ SBC T2 + 1 
3a6f : 85 04 __ STA WORK + 1 
3a71 : 29 80 __ AND #$80
3a73 : 10 02 __ BPL $3a77 ; (bmmc_triangle_fill.s10 + 59)
3a75 : a9 ff __ LDA #$ff
3a77 : 85 06 __ STA WORK + 3 
3a79 : 85 05 __ STA WORK + 2 
3a7b : ad e8 c7 LDA $c7e8 ; (sstack + 42)
3a7e : 8d d6 c7 STA $c7d6 ; (sstack + 24)
3a81 : ad e9 c7 LDA $c7e9 ; (sstack + 43)
3a84 : 8d d7 c7 STA $c7d7 ; (sstack + 25)
3a87 : 38 __ __ SEC
3a88 : a5 62 __ LDA T8 + 0 
3a8a : ed e0 c7 SBC $c7e0 ; (sstack + 34)
3a8d : 85 1d __ STA ACCU + 2 
3a8f : a5 63 __ LDA T8 + 1 
3a91 : ed e1 c7 SBC $c7e1 ; (sstack + 35)
3a94 : 85 1e __ STA ACCU + 3 
3a96 : a9 00 __ LDA #$00
3a98 : 85 1b __ STA ACCU + 0 
3a9a : 85 1c __ STA ACCU + 1 
3a9c : 20 1c 47 JSR $471c ; (divs32 + 0)
3a9f : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3aa2 : c5 46 __ CMP T0 + 3 
3aa4 : d0 03 __ BNE $3aa9 ; (bmmc_triangle_fill.s19 + 0)
3aa6 : 4c 59 3b JMP $3b59 ; (bmmc_triangle_fill.s14 + 0)
.s19:
3aa9 : 45 46 __ EOR T0 + 3 
3aab : 30 04 __ BMI $3ab1 ; (bmmc_triangle_fill.s18 + 0)
.s17:
3aad : b0 04 __ BCS $3ab3 ; (bmmc_triangle_fill.s11 + 0)
3aaf : 90 52 __ BCC $3b03 ; (bmmc_triangle_fill.s13 + 0)
.s18:
3ab1 : b0 50 __ BCS $3b03 ; (bmmc_triangle_fill.s13 + 0)
.s11:
3ab3 : a5 43 __ LDA T0 + 0 ; (pat + 0)
3ab5 : 8d c2 c7 STA $c7c2 ; (sstack + 4)
3ab8 : a5 44 __ LDA T0 + 1 ; (pat + 1)
3aba : 8d c3 c7 STA $c7c3 ; (sstack + 5)
3abd : a5 45 __ LDA T0 + 2 
3abf : 8d c4 c7 STA $c7c4 ; (sstack + 6)
3ac2 : a5 46 __ LDA T0 + 3 
3ac4 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
3ac7 : a9 00 __ LDA #$00
3ac9 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
3acc : 8d c7 c7 STA $c7c7 ; (sstack + 9)
3acf : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3ad2 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
3ad5 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3ad8 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
3adb : a5 5c __ LDA T4 + 0 
3add : 8d ca c7 STA $c7ca ; (sstack + 12)
3ae0 : a5 5d __ LDA T4 + 1 
3ae2 : 8d cb c7 STA $c7cb ; (sstack + 13)
3ae5 : a5 5e __ LDA T4 + 2 
3ae7 : 8d cc c7 STA $c7cc ; (sstack + 14)
3aea : a5 5f __ LDA T4 + 3 
3aec : 8d cd c7 STA $c7cd ; (sstack + 15)
3aef : a5 1b __ LDA ACCU + 0 
3af1 : 8d ce c7 STA $c7ce ; (sstack + 16)
3af4 : a5 1c __ LDA ACCU + 1 
3af6 : 8d cf c7 STA $c7cf ; (sstack + 17)
3af9 : a5 1d __ LDA ACCU + 2 
3afb : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3afe : a5 1e __ LDA ACCU + 3 
3b00 : 4c 50 3b JMP $3b50 ; (bmmc_triangle_fill.s12 + 0)
.s13:
3b03 : a9 00 __ LDA #$00
3b05 : 8d c2 c7 STA $c7c2 ; (sstack + 4)
3b08 : 8d c3 c7 STA $c7c3 ; (sstack + 5)
3b0b : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3b0e : 8d c4 c7 STA $c7c4 ; (sstack + 6)
3b11 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3b14 : 8d c5 c7 STA $c7c5 ; (sstack + 7)
3b17 : a5 43 __ LDA T0 + 0 ; (pat + 0)
3b19 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
3b1c : a5 44 __ LDA T0 + 1 ; (pat + 1)
3b1e : 8d c7 c7 STA $c7c7 ; (sstack + 9)
3b21 : a5 45 __ LDA T0 + 2 
3b23 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
3b26 : a5 46 __ LDA T0 + 3 
3b28 : 8d c9 c7 STA $c7c9 ; (sstack + 11)
3b2b : a5 1b __ LDA ACCU + 0 
3b2d : 8d ca c7 STA $c7ca ; (sstack + 12)
3b30 : a5 1c __ LDA ACCU + 1 
3b32 : 8d cb c7 STA $c7cb ; (sstack + 13)
3b35 : a5 1d __ LDA ACCU + 2 
3b37 : 8d cc c7 STA $c7cc ; (sstack + 14)
3b3a : a5 1e __ LDA ACCU + 3 
3b3c : 8d cd c7 STA $c7cd ; (sstack + 15)
3b3f : a5 5c __ LDA T4 + 0 
3b41 : 8d ce c7 STA $c7ce ; (sstack + 16)
3b44 : a5 5d __ LDA T4 + 1 
3b46 : 8d cf c7 STA $c7cf ; (sstack + 17)
3b49 : a5 5e __ LDA T4 + 2 
3b4b : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3b4e : a5 5f __ LDA T4 + 3 
.s12:
3b50 : 8d d1 c7 STA $c7d1 ; (sstack + 19)
3b53 : 20 3e 3d JSR $3d3e ; (bmmc_trapezoid_fill.s1 + 0)
3b56 : 4c bb 39 JMP $39bb ; (bmmc_triangle_fill.s3 + 0)
.s14:
3b59 : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3b5c : c5 45 __ CMP T0 + 2 
3b5e : f0 03 __ BEQ $3b63 ; (bmmc_triangle_fill.s15 + 0)
3b60 : 4c ad 3a JMP $3aad ; (bmmc_triangle_fill.s17 + 0)
.s15:
3b63 : a5 44 __ LDA T0 + 1 ; (pat + 1)
3b65 : d0 9c __ BNE $3b03 ; (bmmc_triangle_fill.s13 + 0)
.s16:
3b67 : c5 43 __ CMP T0 + 0 ; (pat + 0)
3b69 : 4c ad 3a JMP $3aad ; (bmmc_triangle_fill.s17 + 0)
.s20:
3b6c : ad d8 c7 LDA $c7d8 ; (sstack + 26)
3b6f : 8d be c7 STA $c7be ; (sstack + 0)
3b72 : ad d9 c7 LDA $c7d9 ; (sstack + 27)
3b75 : 8d bf c7 STA $c7bf ; (sstack + 1)
3b78 : ad da c7 LDA $c7da ; (sstack + 28)
3b7b : 8d c0 c7 STA $c7c0 ; (sstack + 2)
3b7e : ad db c7 LDA $c7db ; (sstack + 29)
3b81 : 8d c1 c7 STA $c7c1 ; (sstack + 3)
3b84 : a9 00 __ LDA #$00
3b86 : 8d c2 c7 STA $c7c2 ; (sstack + 4)
3b89 : 8d c6 c7 STA $c7c6 ; (sstack + 8)
3b8c : 8d c3 c7 STA $c7c3 ; (sstack + 5)
3b8f : 8d c7 c7 STA $c7c7 ; (sstack + 9)
3b92 : a5 5a __ LDA T3 + 2 
3b94 : 8d c4 c7 STA $c7c4 ; (sstack + 6)
3b97 : 8d c8 c7 STA $c7c8 ; (sstack + 10)
3b9a : a5 5b __ LDA T3 + 3 
3b9c : 8d c5 c7 STA $c7c5 ; (sstack + 7)
3b9f : 8d c9 c7 STA $c7c9 ; (sstack + 11)
3ba2 : a5 47 __ LDA T5 + 0 
3ba4 : 8d d2 c7 STA $c7d2 ; (sstack + 20)
3ba7 : a5 48 __ LDA T5 + 1 
3ba9 : 8d d3 c7 STA $c7d3 ; (sstack + 21)
3bac : a5 56 __ LDA T2 + 0 
3bae : 8d d4 c7 STA $c7d4 ; (sstack + 22)
3bb1 : 38 __ __ SEC
3bb2 : e5 47 __ SBC T5 + 0 
3bb4 : 85 53 __ STA T1 + 0 
3bb6 : 85 03 __ STA WORK + 0 
3bb8 : a5 57 __ LDA T2 + 1 
3bba : 8d d5 c7 STA $c7d5 ; (sstack + 23)
3bbd : e5 48 __ SBC T5 + 1 
3bbf : 85 54 __ STA T1 + 1 
3bc1 : 85 04 __ STA WORK + 1 
3bc3 : 29 80 __ AND #$80
3bc5 : 10 02 __ BPL $3bc9 ; (bmmc_triangle_fill.s20 + 93)
3bc7 : a9 ff __ LDA #$ff
3bc9 : 85 55 __ STA T1 + 2 
3bcb : 85 06 __ STA WORK + 3 
3bcd : 85 05 __ STA WORK + 2 
3bcf : ad e8 c7 LDA $c7e8 ; (sstack + 42)
3bd2 : 8d d6 c7 STA $c7d6 ; (sstack + 24)
3bd5 : ad e9 c7 LDA $c7e9 ; (sstack + 43)
3bd8 : 8d d7 c7 STA $c7d7 ; (sstack + 25)
3bdb : ad e0 c7 LDA $c7e0 ; (sstack + 34)
3bde : 38 __ __ SEC
3bdf : ed dc c7 SBC $c7dc ; (sstack + 30)
3be2 : 85 1d __ STA ACCU + 2 
3be4 : ad e1 c7 LDA $c7e1 ; (sstack + 35)
3be7 : ed dd c7 SBC $c7dd ; (sstack + 31)
3bea : 85 1e __ STA ACCU + 3 
3bec : a9 00 __ LDA #$00
3bee : 85 1b __ STA ACCU + 0 
3bf0 : 85 1c __ STA ACCU + 1 
3bf2 : 20 1c 47 JSR $471c ; (divs32 + 0)
3bf5 : a5 1e __ LDA ACCU + 3 
3bf7 : c5 5f __ CMP T4 + 3 
3bf9 : d0 03 __ BNE $3bfe ; (bmmc_triangle_fill.s31 + 0)
3bfb : 4c a3 3c JMP $3ca3 ; (bmmc_triangle_fill.s26 + 0)
.s31:
3bfe : 45 5f __ EOR T4 + 3 
3c00 : 30 04 __ BMI $3c06 ; (bmmc_triangle_fill.s30 + 0)
.s29:
3c02 : b0 04 __ BCS $3c08 ; (bmmc_triangle_fill.s21 + 0)
3c04 : 90 2a __ BCC $3c30 ; (bmmc_triangle_fill.s25 + 0)
.s30:
3c06 : b0 28 __ BCS $3c30 ; (bmmc_triangle_fill.s25 + 0)
.s21:
3c08 : a5 5c __ LDA T4 + 0 
3c0a : 8d ca c7 STA $c7ca ; (sstack + 12)
3c0d : a5 5d __ LDA T4 + 1 
3c0f : 8d cb c7 STA $c7cb ; (sstack + 13)
3c12 : a5 5e __ LDA T4 + 2 
3c14 : 8d cc c7 STA $c7cc ; (sstack + 14)
3c17 : a5 5f __ LDA T4 + 3 
3c19 : 8d cd c7 STA $c7cd ; (sstack + 15)
3c1c : a5 1b __ LDA ACCU + 0 
3c1e : 8d ce c7 STA $c7ce ; (sstack + 16)
3c21 : a5 1c __ LDA ACCU + 1 
3c23 : 8d cf c7 STA $c7cf ; (sstack + 17)
3c26 : a5 1d __ LDA ACCU + 2 
3c28 : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3c2b : a5 1e __ LDA ACCU + 3 
3c2d : 4c 55 3c JMP $3c55 ; (bmmc_triangle_fill.s22 + 0)
.s25:
3c30 : a5 1b __ LDA ACCU + 0 
3c32 : 8d ca c7 STA $c7ca ; (sstack + 12)
3c35 : a5 1c __ LDA ACCU + 1 
3c37 : 8d cb c7 STA $c7cb ; (sstack + 13)
3c3a : a5 1d __ LDA ACCU + 2 
3c3c : 8d cc c7 STA $c7cc ; (sstack + 14)
3c3f : a5 1e __ LDA ACCU + 3 
3c41 : 8d cd c7 STA $c7cd ; (sstack + 15)
3c44 : a5 5c __ LDA T4 + 0 
3c46 : 8d ce c7 STA $c7ce ; (sstack + 16)
3c49 : a5 5d __ LDA T4 + 1 
3c4b : 8d cf c7 STA $c7cf ; (sstack + 17)
3c4e : a5 5e __ LDA T4 + 2 
3c50 : 8d d0 c7 STA $c7d0 ; (sstack + 18)
3c53 : a5 5f __ LDA T4 + 3 
.s22:
3c55 : 8d d1 c7 STA $c7d1 ; (sstack + 19)
3c58 : 20 3e 3d JSR $3d3e ; (bmmc_trapezoid_fill.s1 + 0)
3c5b : a5 61 __ LDA T7 + 1 
3c5d : c5 57 __ CMP T2 + 1 
3c5f : d0 09 __ BNE $3c6a ; (bmmc_triangle_fill.s23 + 0)
.s24:
3c61 : a5 60 __ LDA T7 + 0 
3c63 : c5 56 __ CMP T2 + 0 
3c65 : d0 03 __ BNE $3c6a ; (bmmc_triangle_fill.s23 + 0)
3c67 : 4c bb 39 JMP $39bb ; (bmmc_triangle_fill.s3 + 0)
.s23:
3c6a : a5 5c __ LDA T4 + 0 
3c6c : 85 1b __ STA ACCU + 0 
3c6e : a5 5d __ LDA T4 + 1 
3c70 : 85 1c __ STA ACCU + 1 
3c72 : a5 5e __ LDA T4 + 2 
3c74 : 85 1d __ STA ACCU + 2 
3c76 : a5 5f __ LDA T4 + 3 
3c78 : 85 1e __ STA ACCU + 3 
3c7a : a5 53 __ LDA T1 + 0 
3c7c : 85 03 __ STA WORK + 0 
3c7e : a5 54 __ LDA T1 + 1 
3c80 : 85 04 __ STA WORK + 1 
3c82 : a5 55 __ LDA T1 + 2 
3c84 : 85 05 __ STA WORK + 2 
3c86 : 85 06 __ STA WORK + 3 
3c88 : 20 b4 46 JSR $46b4 ; (mul32 + 0)
3c8b : a5 07 __ LDA WORK + 4 
3c8d : 85 43 __ STA T0 + 0 ; (pat + 0)
3c8f : a5 08 __ LDA WORK + 5 
3c91 : 85 44 __ STA T0 + 1 ; (pat + 1)
3c93 : 18 __ __ CLC
3c94 : a5 09 __ LDA WORK + 6 
3c96 : 65 5a __ ADC T3 + 2 
3c98 : 85 45 __ STA T0 + 2 
3c9a : a5 0a __ LDA WORK + 7 
3c9c : 65 5b __ ADC T3 + 3 
3c9e : 85 46 __ STA T0 + 3 
3ca0 : 4c 3c 3a JMP $3a3c ; (bmmc_triangle_fill.s10 + 0)
.s26:
3ca3 : a5 1d __ LDA ACCU + 2 
3ca5 : c5 5e __ CMP T4 + 2 
3ca7 : f0 03 __ BEQ $3cac ; (bmmc_triangle_fill.s27 + 0)
3ca9 : 4c 02 3c JMP $3c02 ; (bmmc_triangle_fill.s29 + 0)
.s27:
3cac : a5 1c __ LDA ACCU + 1 
3cae : c5 5d __ CMP T4 + 1 
3cb0 : d0 f7 __ BNE $3ca9 ; (bmmc_triangle_fill.s26 + 6)
.s28:
3cb2 : a5 1b __ LDA ACCU + 0 
3cb4 : c5 5c __ CMP T4 + 0 
3cb6 : 4c 02 3c JMP $3c02 ; (bmmc_triangle_fill.s29 + 0)
.s63:
3cb9 : cd e2 c7 CMP $c7e2 ; (sstack + 36)
3cbc : 4c 5e 39 JMP $395e ; (bmmc_triangle_fill.s52 + 0)
.s42:
3cbf : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3cc2 : 8d de c7 STA $c7de ; (sstack + 32)
3cc5 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3cc8 : 8d df c7 STA $c7df ; (sstack + 33)
3ccb : a5 53 __ LDA T1 + 0 
3ccd : 8d e6 c7 STA $c7e6 ; (sstack + 40)
3cd0 : ad dc c7 LDA $c7dc ; (sstack + 30)
3cd3 : ae e4 c7 LDX $c7e4 ; (sstack + 38)
3cd6 : 8e dc c7 STX $c7dc ; (sstack + 30)
3cd9 : 8d e4 c7 STA $c7e4 ; (sstack + 38)
3cdc : ad dd c7 LDA $c7dd ; (sstack + 31)
3cdf : ae e5 c7 LDX $c7e5 ; (sstack + 39)
3ce2 : 8e dd c7 STX $c7dd ; (sstack + 31)
3ce5 : 8d e5 c7 STA $c7e5 ; (sstack + 39)
3ce8 : a5 54 __ LDA T1 + 1 
3cea : 8d e7 c7 STA $c7e7 ; (sstack + 41)
3ced : cd e3 c7 CMP $c7e3 ; (sstack + 37)
3cf0 : f0 03 __ BEQ $3cf5 ; (bmmc_triangle_fill.s43 + 0)
3cf2 : 4c 59 39 JMP $3959 ; (bmmc_triangle_fill.s44 + 0)
.s43:
3cf5 : a5 53 __ LDA T1 + 0 
3cf7 : 4c b9 3c JMP $3cb9 ; (bmmc_triangle_fill.s63 + 0)
.s50:
3cfa : ad e2 c7 LDA $c7e2 ; (sstack + 36)
3cfd : 8d de c7 STA $c7de ; (sstack + 32)
3d00 : ad e3 c7 LDA $c7e3 ; (sstack + 37)
3d03 : 8d df c7 STA $c7df ; (sstack + 33)
3d06 : a5 53 __ LDA T1 + 0 
3d08 : 8d e2 c7 STA $c7e2 ; (sstack + 36)
3d0b : a5 54 __ LDA T1 + 1 
3d0d : 8d e3 c7 STA $c7e3 ; (sstack + 37)
3d10 : ad dc c7 LDA $c7dc ; (sstack + 30)
3d13 : ae e0 c7 LDX $c7e0 ; (sstack + 34)
3d16 : 8e dc c7 STX $c7dc ; (sstack + 30)
3d19 : 8d e0 c7 STA $c7e0 ; (sstack + 34)
3d1c : ad dd c7 LDA $c7dd ; (sstack + 31)
3d1f : ae e1 c7 LDX $c7e1 ; (sstack + 35)
3d22 : 8e dd c7 STX $c7dd ; (sstack + 31)
3d25 : 8d e1 c7 STA $c7e1 ; (sstack + 35)
3d28 : ad e7 c7 LDA $c7e7 ; (sstack + 41)
3d2b : c5 54 __ CMP T1 + 1 
3d2d : d0 08 __ BNE $3d37 ; (bmmc_triangle_fill.s54 + 0)
.s51:
3d2f : ad e6 c7 LDA $c7e6 ; (sstack + 40)
3d32 : c5 53 __ CMP T1 + 0 
3d34 : 4c 5e 39 JMP $395e ; (bmmc_triangle_fill.s52 + 0)
.s54:
3d37 : 45 54 __ EOR T1 + 1 
3d39 : 10 f9 __ BPL $3d34 ; (bmmc_triangle_fill.s51 + 5)
3d3b : 4c 62 39 JMP $3962 ; (bmmc_triangle_fill.s53 + 0)
--------------------------------------------------------------------
bmmc_trapezoid_fill: ; bmmc_trapezoid_fill(const struct Bitmap*,const struct ClipRect*,i32,i32,i32,i32,i16,i16,const u8*)->void
;  37, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
3d3e : a2 0e __ LDX #$0e
3d40 : b5 53 __ LDA T3 + 0,x 
3d42 : 9d ad c7 STA $c7ad,x ; (bmmc_trapezoid_fill@stack + 0)
3d45 : ca __ __ DEX
3d46 : 10 f8 __ BPL $3d40 ; (bmmc_trapezoid_fill.s1 + 2)
.s4:
3d48 : ad c0 c7 LDA $c7c0 ; (sstack + 2)
3d4b : 85 50 __ STA T6 + 0 
3d4d : ad c1 c7 LDA $c7c1 ; (sstack + 3)
3d50 : 85 51 __ STA T6 + 1 
3d52 : a0 02 __ LDY #$02
3d54 : b1 50 __ LDA (T6 + 0),y 
3d56 : 85 48 __ STA T1 + 0 
3d58 : c8 __ __ INY
3d59 : b1 50 __ LDA (T6 + 0),y 
3d5b : 85 49 __ STA T1 + 1 
3d5d : cd d5 c7 CMP $c7d5 ; (sstack + 23)
3d60 : d0 09 __ BNE $3d6b ; (bmmc_trapezoid_fill.s30 + 0)
.s27:
3d62 : a5 48 __ LDA T1 + 0 
3d64 : cd d4 c7 CMP $c7d4 ; (sstack + 22)
.s28:
3d67 : 90 09 __ BCC $3d72 ; (bmmc_trapezoid_fill.s5 + 0)
3d69 : b0 2c __ BCS $3d97 ; (bmmc_trapezoid_fill.s3 + 0)
.s30:
3d6b : 4d d5 c7 EOR $c7d5 ; (sstack + 23)
3d6e : 10 f7 __ BPL $3d67 ; (bmmc_trapezoid_fill.s28 + 0)
.s29:
3d70 : 90 25 __ BCC $3d97 ; (bmmc_trapezoid_fill.s3 + 0)
.s5:
3d72 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
3d75 : 85 57 __ STA T4 + 0 
3d77 : a0 06 __ LDY #$06
3d79 : b1 50 __ LDA (T6 + 0),y 
3d7b : 85 43 __ STA T5 + 0 
3d7d : c8 __ __ INY
3d7e : b1 50 __ LDA (T6 + 0),y 
3d80 : 85 44 __ STA T5 + 1 
3d82 : ad d3 c7 LDA $c7d3 ; (sstack + 21)
3d85 : c5 44 __ CMP T5 + 1 
3d87 : d0 08 __ BNE $3d91 ; (bmmc_trapezoid_fill.s26 + 0)
.s23:
3d89 : a5 57 __ LDA T4 + 0 
3d8b : c5 43 __ CMP T5 + 0 
.s24:
3d8d : b0 08 __ BCS $3d97 ; (bmmc_trapezoid_fill.s3 + 0)
3d8f : 90 11 __ BCC $3da2 ; (bmmc_trapezoid_fill.s6 + 0)
.s26:
3d91 : 45 44 __ EOR T5 + 1 
3d93 : 10 f8 __ BPL $3d8d ; (bmmc_trapezoid_fill.s24 + 0)
.s25:
3d95 : b0 0b __ BCS $3da2 ; (bmmc_trapezoid_fill.s6 + 0)
.s3:
3d97 : a2 0e __ LDX #$0e
3d99 : bd ad c7 LDA $c7ad,x ; (bmmc_trapezoid_fill@stack + 0)
3d9c : 95 53 __ STA T3 + 0,x 
3d9e : ca __ __ DEX
3d9f : 10 f8 __ BPL $3d99 ; (bmmc_trapezoid_fill.s3 + 2)
3da1 : 60 __ __ RTS
.s6:
3da2 : ad c2 c7 LDA $c7c2 ; (sstack + 4)
3da5 : 85 4c __ STA T2 + 0 
3da7 : ad c3 c7 LDA $c7c3 ; (sstack + 5)
3daa : 85 4d __ STA T2 + 1 
3dac : ad c4 c7 LDA $c7c4 ; (sstack + 6)
3daf : 85 4e __ STA T2 + 2 
3db1 : ad c5 c7 LDA $c7c5 ; (sstack + 7)
3db4 : 85 4f __ STA T2 + 3 
3db6 : ad c6 c7 LDA $c7c6 ; (sstack + 8)
3db9 : 85 53 __ STA T3 + 0 
3dbb : ad c7 c7 LDA $c7c7 ; (sstack + 9)
3dbe : 85 54 __ STA T3 + 1 
3dc0 : ad c8 c7 LDA $c7c8 ; (sstack + 10)
3dc3 : 85 55 __ STA T3 + 2 
3dc5 : ad c9 c7 LDA $c7c9 ; (sstack + 11)
3dc8 : 85 56 __ STA T3 + 3 
3dca : a5 44 __ LDA T5 + 1 
3dcc : cd d5 c7 CMP $c7d5 ; (sstack + 23)
3dcf : d0 09 __ BNE $3dda ; (bmmc_trapezoid_fill.s22 + 0)
.s19:
3dd1 : a5 43 __ LDA T5 + 0 
3dd3 : cd d4 c7 CMP $c7d4 ; (sstack + 22)
.s20:
3dd6 : 90 09 __ BCC $3de1 ; (bmmc_trapezoid_fill.s18 + 0)
3dd8 : b0 11 __ BCS $3deb ; (bmmc_trapezoid_fill.s7 + 0)
.s22:
3dda : 4d d5 c7 EOR $c7d5 ; (sstack + 23)
3ddd : 10 f7 __ BPL $3dd6 ; (bmmc_trapezoid_fill.s20 + 0)
.s21:
3ddf : 90 0a __ BCC $3deb ; (bmmc_trapezoid_fill.s7 + 0)
.s18:
3de1 : a5 43 __ LDA T5 + 0 
3de3 : 8d d4 c7 STA $c7d4 ; (sstack + 22)
3de6 : a5 44 __ LDA T5 + 1 
3de8 : 8d d5 c7 STA $c7d5 ; (sstack + 23)
.s7:
3deb : ad d3 c7 LDA $c7d3 ; (sstack + 21)
3dee : c5 49 __ CMP T1 + 1 
3df0 : d0 09 __ BNE $3dfb ; (bmmc_trapezoid_fill.s17 + 0)
.s14:
3df2 : a5 57 __ LDA T4 + 0 
3df4 : c5 48 __ CMP T1 + 0 
.s15:
3df6 : b0 09 __ BCS $3e01 ; (bmmc_trapezoid_fill.s8 + 0)
3df8 : 4c 33 3f JMP $3f33 ; (bmmc_trapezoid_fill.s13 + 0)
.s17:
3dfb : 45 49 __ EOR T1 + 1 
3dfd : 10 f7 __ BPL $3df6 ; (bmmc_trapezoid_fill.s15 + 0)
.s16:
3dff : b0 f7 __ BCS $3df8 ; (bmmc_trapezoid_fill.s15 + 2)
.s8:
3e01 : ad d4 c7 LDA $c7d4 ; (sstack + 22)
3e04 : 85 52 __ STA T7 + 0 
3e06 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
3e09 : c5 52 __ CMP T7 + 0 
3e0b : b0 8a __ BCS $3d97 ; (bmmc_trapezoid_fill.s3 + 0)
.s9:
3e0d : 29 f8 __ AND #$f8
3e0f : 85 1b __ STA ACCU + 0 ; (clip + 0)
3e11 : ad be c7 LDA $c7be ; (sstack + 0)
3e14 : 85 57 __ STA T4 + 0 
3e16 : ad bf c7 LDA $c7bf ; (sstack + 1)
3e19 : 85 58 __ STA T4 + 1 
3e1b : ad d3 c7 LDA $c7d3 ; (sstack + 21)
3e1e : 85 1c __ STA ACCU + 1 ; (clip + 1)
3e20 : a0 04 __ LDY #$04
3e22 : b1 57 __ LDA (T4 + 0),y 
3e24 : 85 43 __ STA T5 + 0 
3e26 : 20 c2 41 JSR $41c2 ; (mul16by8 + 0)
3e29 : a0 00 __ LDY #$00
3e2b : b1 57 __ LDA (T4 + 0),y 
3e2d : 18 __ __ CLC
3e2e : 65 1b __ ADC ACCU + 0 ; (clip + 0)
3e30 : 85 02 __ STA $02 
3e32 : c8 __ __ INY
3e33 : b1 57 __ LDA (T4 + 0),y 
3e35 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
3e37 : aa __ __ TAX
3e38 : ad d2 c7 LDA $c7d2 ; (sstack + 20)
3e3b : 85 61 __ STA T11 + 0 
3e3d : 29 07 __ AND #$07
3e3f : 18 __ __ CLC
3e40 : 65 02 __ ADC $02 
3e42 : 85 5b __ STA T8 + 0 
3e44 : 90 02 __ BCC $3e48 ; (bmmc_trapezoid_fill.s32 + 0)
.s31:
3e46 : e8 __ __ INX
3e47 : 18 __ __ CLC
.s32:
3e48 : 86 5c __ STX T8 + 1 
3e4a : a5 43 __ LDA T5 + 0 
3e4c : 69 ff __ ADC #$ff
3e4e : 2a __ __ ROL
3e4f : 2a __ __ ROL
3e50 : 2a __ __ ROL
3e51 : aa __ __ TAX
3e52 : 29 f8 __ AND #$f8
3e54 : 85 5d __ STA T9 + 0 
3e56 : 8a __ __ TXA
3e57 : 29 07 __ AND #$07
3e59 : 2a __ __ ROL
3e5a : 69 f8 __ ADC #$f8
3e5c : 85 5e __ STA T9 + 1 
3e5e : ad d6 c7 LDA $c7d6 ; (sstack + 24)
3e61 : 85 5f __ STA T10 + 0 
3e63 : ad d7 c7 LDA $c7d7 ; (sstack + 25)
3e66 : 85 60 __ STA T10 + 1 
3e68 : ad ce c7 LDA $c7ce ; (sstack + 16)
3e6b : 85 48 __ STA T1 + 0 
3e6d : ad cf c7 LDA $c7cf ; (sstack + 17)
3e70 : 85 49 __ STA T1 + 1 
3e72 : ad d0 c7 LDA $c7d0 ; (sstack + 18)
3e75 : 85 4a __ STA T1 + 2 
3e77 : ad d1 c7 LDA $c7d1 ; (sstack + 19)
3e7a : 85 4b __ STA T1 + 3 
3e7c : ad ca c7 LDA $c7ca ; (sstack + 12)
3e7f : 85 57 __ STA T4 + 0 
3e81 : ad cb c7 LDA $c7cb ; (sstack + 13)
3e84 : 85 58 __ STA T4 + 1 
3e86 : ad cc c7 LDA $c7cc ; (sstack + 14)
3e89 : 85 59 __ STA T4 + 2 
3e8b : ad cd c7 LDA $c7cd ; (sstack + 15)
3e8e : 85 5a __ STA T4 + 3 
.l10:
3e90 : a0 00 __ LDY #$00
3e92 : b1 50 __ LDA (T6 + 0),y 
3e94 : 85 0d __ STA P0 
3e96 : c8 __ __ INY
3e97 : b1 50 __ LDA (T6 + 0),y 
3e99 : 85 0e __ STA P1 
3e9b : a0 04 __ LDY #$04
3e9d : b1 50 __ LDA (T6 + 0),y 
3e9f : 85 0f __ STA P2 
3ea1 : c8 __ __ INY
3ea2 : b1 50 __ LDA (T6 + 0),y 
3ea4 : 85 10 __ STA P3 
3ea6 : a5 5b __ LDA T8 + 0 
3ea8 : 85 11 __ STA P4 
3eaa : a5 5c __ LDA T8 + 1 
3eac : 85 12 __ STA P5 
3eae : a5 61 __ LDA T11 + 0 
3eb0 : 29 07 __ AND #$07
3eb2 : a8 __ __ TAY
3eb3 : b1 5f __ LDA (T10 + 0),y 
3eb5 : 85 17 __ STA P10 
3eb7 : a5 4e __ LDA T2 + 2 
3eb9 : 29 fe __ AND #$fe
3ebb : 85 13 __ STA P6 
3ebd : a5 4f __ LDA T2 + 3 
3ebf : 85 14 __ STA P7 
3ec1 : 18 __ __ CLC
3ec2 : a5 55 __ LDA T3 + 2 
3ec4 : 69 01 __ ADC #$01
3ec6 : 29 fe __ AND #$fe
3ec8 : 85 15 __ STA P8 
3eca : a5 56 __ LDA T3 + 3 
3ecc : 69 00 __ ADC #$00
3ece : 85 16 __ STA P9 
3ed0 : 20 c9 3f JSR $3fc9 ; (bm_scan_fill.s4 + 0)
3ed3 : 18 __ __ CLC
3ed4 : a5 11 __ LDA P4 
3ed6 : 69 01 __ ADC #$01
3ed8 : 85 5b __ STA T8 + 0 
3eda : a5 12 __ LDA P5 
3edc : 69 00 __ ADC #$00
3ede : 85 5c __ STA T8 + 1 
3ee0 : a5 5b __ LDA T8 + 0 
3ee2 : 29 07 __ AND #$07
3ee4 : d0 0d __ BNE $3ef3 ; (bmmc_trapezoid_fill.s12 + 0)
.s11:
3ee6 : 18 __ __ CLC
3ee7 : a5 5b __ LDA T8 + 0 
3ee9 : 65 5d __ ADC T9 + 0 
3eeb : 85 5b __ STA T8 + 0 
3eed : a5 5c __ LDA T8 + 1 
3eef : 65 5e __ ADC T9 + 1 
3ef1 : 85 5c __ STA T8 + 1 
.s12:
3ef3 : 18 __ __ CLC
3ef4 : a5 48 __ LDA T1 + 0 
3ef6 : 65 53 __ ADC T3 + 0 
3ef8 : 85 53 __ STA T3 + 0 
3efa : a5 49 __ LDA T1 + 1 
3efc : 65 54 __ ADC T3 + 1 
3efe : 85 54 __ STA T3 + 1 
3f00 : a5 4a __ LDA T1 + 2 
3f02 : 65 55 __ ADC T3 + 2 
3f04 : 85 55 __ STA T3 + 2 
3f06 : a5 4b __ LDA T1 + 3 
3f08 : 65 56 __ ADC T3 + 3 
3f0a : 85 56 __ STA T3 + 3 
3f0c : 18 __ __ CLC
3f0d : a5 57 __ LDA T4 + 0 
3f0f : 65 4c __ ADC T2 + 0 
3f11 : 85 4c __ STA T2 + 0 
3f13 : a5 58 __ LDA T4 + 1 
3f15 : 65 4d __ ADC T2 + 1 
3f17 : 85 4d __ STA T2 + 1 
3f19 : a5 59 __ LDA T4 + 2 
3f1b : 65 4e __ ADC T2 + 2 
3f1d : 85 4e __ STA T2 + 2 
3f1f : a5 5a __ LDA T4 + 3 
3f21 : 65 4f __ ADC T2 + 3 
3f23 : 85 4f __ STA T2 + 3 
3f25 : e6 61 __ INC T11 + 0 
3f27 : a5 61 __ LDA T11 + 0 
3f29 : c5 52 __ CMP T7 + 0 
3f2b : b0 03 __ BCS $3f30 ; (bmmc_trapezoid_fill.s12 + 61)
3f2d : 4c 90 3e JMP $3e90 ; (bmmc_trapezoid_fill.l10 + 0)
3f30 : 4c 97 3d JMP $3d97 ; (bmmc_trapezoid_fill.s3 + 0)
.s13:
3f33 : a5 48 __ LDA T1 + 0 
3f35 : 8d d2 c7 STA $c7d2 ; (sstack + 20)
3f38 : 38 __ __ SEC
3f39 : e5 57 __ SBC T4 + 0 
3f3b : 85 45 __ STA T0 + 0 
3f3d : 85 03 __ STA WORK + 0 
3f3f : a5 49 __ LDA T1 + 1 
3f41 : aa __ __ TAX
3f42 : ed d3 c7 SBC $c7d3 ; (sstack + 21)
3f45 : 8e d3 c7 STX $c7d3 ; (sstack + 21)
3f48 : 85 46 __ STA T0 + 1 
3f4a : 85 04 __ STA WORK + 1 
3f4c : 29 80 __ AND #$80
3f4e : 10 02 __ BPL $3f52 ; (bmmc_trapezoid_fill.s13 + 31)
3f50 : a9 ff __ LDA #$ff
3f52 : 85 47 __ STA T0 + 2 
3f54 : 85 06 __ STA WORK + 3 
3f56 : 85 05 __ STA WORK + 2 
3f58 : ad ce c7 LDA $c7ce ; (sstack + 16)
3f5b : 85 1b __ STA ACCU + 0 ; (clip + 0)
3f5d : ad cf c7 LDA $c7cf ; (sstack + 17)
3f60 : 85 1c __ STA ACCU + 1 ; (clip + 1)
3f62 : ad d0 c7 LDA $c7d0 ; (sstack + 18)
3f65 : 85 1d __ STA ACCU + 2 ; (x0 + 0)
3f67 : ad d1 c7 LDA $c7d1 ; (sstack + 19)
3f6a : 85 1e __ STA ACCU + 3 ; (x0 + 1)
3f6c : 20 b4 46 JSR $46b4 ; (mul32 + 0)
3f6f : 18 __ __ CLC
3f70 : a5 07 __ LDA WORK + 4 
3f72 : 65 53 __ ADC T3 + 0 
3f74 : 85 53 __ STA T3 + 0 
3f76 : a5 08 __ LDA WORK + 5 
3f78 : 65 54 __ ADC T3 + 1 
3f7a : 85 54 __ STA T3 + 1 
3f7c : a5 09 __ LDA WORK + 6 
3f7e : 65 55 __ ADC T3 + 2 
3f80 : 85 55 __ STA T3 + 2 
3f82 : a5 0a __ LDA WORK + 7 
3f84 : 65 56 __ ADC T3 + 3 
3f86 : 85 56 __ STA T3 + 3 
3f88 : ad ca c7 LDA $c7ca ; (sstack + 12)
3f8b : 85 1b __ STA ACCU + 0 ; (clip + 0)
3f8d : ad cb c7 LDA $c7cb ; (sstack + 13)
3f90 : 85 1c __ STA ACCU + 1 ; (clip + 1)
3f92 : ad cc c7 LDA $c7cc ; (sstack + 14)
3f95 : 85 1d __ STA ACCU + 2 ; (x0 + 0)
3f97 : ad cd c7 LDA $c7cd ; (sstack + 15)
3f9a : 85 1e __ STA ACCU + 3 ; (x0 + 1)
3f9c : a5 45 __ LDA T0 + 0 
3f9e : 85 03 __ STA WORK + 0 
3fa0 : a5 46 __ LDA T0 + 1 
3fa2 : 85 04 __ STA WORK + 1 
3fa4 : a5 47 __ LDA T0 + 2 
3fa6 : 85 05 __ STA WORK + 2 
3fa8 : 85 06 __ STA WORK + 3 
3faa : 20 b4 46 JSR $46b4 ; (mul32 + 0)
3fad : 18 __ __ CLC
3fae : a5 07 __ LDA WORK + 4 
3fb0 : 65 4c __ ADC T2 + 0 
3fb2 : 85 4c __ STA T2 + 0 
3fb4 : a5 08 __ LDA WORK + 5 
3fb6 : 65 4d __ ADC T2 + 1 
3fb8 : 85 4d __ STA T2 + 1 
3fba : a5 09 __ LDA WORK + 6 
3fbc : 65 4e __ ADC T2 + 2 
3fbe : 85 4e __ STA T2 + 2 
3fc0 : a5 0a __ LDA WORK + 7 
3fc2 : 65 4f __ ADC T2 + 3 
3fc4 : 85 4f __ STA T2 + 3 
3fc6 : 4c 01 3e JMP $3e01 ; (bmmc_trapezoid_fill.s8 + 0)
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
3fc9 : a5 14 __ LDA P7 ; (x0 + 1)
3fcb : 30 0a __ BMI $3fd7 ; (bm_scan_fill.s24 + 0)
.s27:
3fcd : c5 0e __ CMP P1 ; (left + 1)
3fcf : d0 04 __ BNE $3fd5 ; (bm_scan_fill.s26 + 0)
.s25:
3fd1 : a5 13 __ LDA P6 ; (x0 + 0)
3fd3 : c5 0d __ CMP P0 ; (left + 0)
.s26:
3fd5 : b0 08 __ BCS $3fdf ; (bm_scan_fill.s5 + 0)
.s24:
3fd7 : a5 0d __ LDA P0 ; (left + 0)
3fd9 : 85 13 __ STA P6 ; (x0 + 0)
3fdb : a5 0e __ LDA P1 ; (left + 1)
3fdd : 85 14 __ STA P7 ; (x0 + 1)
.s5:
3fdf : 24 16 __ BIT P9 ; (x1 + 1)
3fe1 : 30 64 __ BMI $4047 ; (bm_scan_fill.s3 + 0)
.s23:
3fe3 : a5 10 __ LDA P3 ; (right + 1)
3fe5 : c5 16 __ CMP P9 ; (x1 + 1)
3fe7 : f0 03 __ BEQ $3fec ; (bm_scan_fill.s21 + 0)
3fe9 : 4c 63 41 JMP $4163 ; (bm_scan_fill.s22 + 0)
.s21:
3fec : a5 0f __ LDA P2 ; (right + 0)
3fee : c5 15 __ CMP P8 ; (x1 + 0)
3ff0 : b0 03 __ BCS $3ff5 ; (bm_scan_fill.s17 + 0)
3ff2 : 4c 4d 41 JMP $414d ; (bm_scan_fill.s18 + 0)
.s17:
3ff5 : a5 14 __ LDA P7 ; (x0 + 1)
3ff7 : c5 16 __ CMP P9 ; (x1 + 1)
3ff9 : d0 04 __ BNE $3fff ; (bm_scan_fill.s20 + 0)
.s16:
3ffb : a5 13 __ LDA P6 ; (x0 + 0)
3ffd : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
3fff : b0 46 __ BCS $4047 ; (bm_scan_fill.s3 + 0)
.s6:
4001 : a5 13 __ LDA P6 ; (x0 + 0)
4003 : 29 f8 __ AND #$f8
4005 : 85 1b __ STA ACCU + 0 
4007 : 65 11 __ ADC P4 ; (lp + 0)
4009 : 85 43 __ STA T1 + 0 
400b : a5 12 __ LDA P5 ; (lp + 1)
400d : 65 14 __ ADC P7 ; (x0 + 1)
400f : 85 44 __ STA T1 + 1 
4011 : a5 15 __ LDA P8 ; (x1 + 0)
4013 : 29 07 __ AND #$07
4015 : aa __ __ TAX
4016 : a5 13 __ LDA P6 ; (x0 + 0)
4018 : 29 07 __ AND #$07
401a : bc 91 4a LDY $4a91,x ; (rmask[0] + 0)
401d : aa __ __ TAX
401e : a5 15 __ LDA P8 ; (x1 + 0)
4020 : 29 f8 __ AND #$f8
4022 : 38 __ __ SEC
4023 : e5 1b __ SBC ACCU + 0 
4025 : 85 1b __ STA ACCU + 0 
4027 : a5 16 __ LDA P9 ; (x1 + 1)
4029 : e5 14 __ SBC P7 ; (x0 + 1)
402b : 85 1c __ STA ACCU + 1 
402d : 05 1b __ ORA ACCU + 0 
402f : d0 17 __ BNE $4048 ; (bm_scan_fill.s7 + 0)
.s15:
4031 : 98 __ __ TYA
4032 : 3d 89 4a AND $4a89,x ; (lmask[0] + 0)
4035 : 85 1e __ STA ACCU + 3 
4037 : a0 00 __ LDY #$00
.s11:
4039 : 49 ff __ EOR #$ff
403b : 31 43 __ AND (T1 + 0),y 
403d : 85 1b __ STA ACCU + 0 
403f : a5 17 __ LDA P10 ; (pat + 0)
4041 : 25 1e __ AND ACCU + 3 
4043 : 05 1b __ ORA ACCU + 0 
4045 : 91 43 __ STA (T1 + 0),y 
.s3:
4047 : 60 __ __ RTS
.s7:
4048 : 84 1e __ STY ACCU + 3 
404a : bd 89 4a LDA $4a89,x ; (lmask[0] + 0)
404d : 49 ff __ EOR #$ff
404f : a0 00 __ LDY #$00
4051 : 31 43 __ AND (T1 + 0),y 
4053 : 85 1d __ STA ACCU + 2 
4055 : a5 17 __ LDA P10 ; (pat + 0)
4057 : 3d 89 4a AND $4a89,x ; (lmask[0] + 0)
405a : 05 1d __ ORA ACCU + 2 
405c : 91 43 __ STA (T1 + 0),y 
405e : a5 1c __ LDA ACCU + 1 
4060 : d0 03 __ BNE $4065 ; (bm_scan_fill.s14 + 0)
4062 : 4c f0 40 JMP $40f0 ; (bm_scan_fill.s8 + 0)
.s14:
4065 : a5 17 __ LDA P10 ; (pat + 0)
4067 : a0 08 __ LDY #$08
4069 : 91 43 __ STA (T1 + 0),y 
406b : a0 10 __ LDY #$10
406d : 91 43 __ STA (T1 + 0),y 
406f : a0 18 __ LDY #$18
4071 : 91 43 __ STA (T1 + 0),y 
4073 : a0 20 __ LDY #$20
4075 : 91 43 __ STA (T1 + 0),y 
4077 : a0 28 __ LDY #$28
4079 : 91 43 __ STA (T1 + 0),y 
407b : a0 30 __ LDY #$30
407d : 91 43 __ STA (T1 + 0),y 
407f : a0 38 __ LDY #$38
4081 : 91 43 __ STA (T1 + 0),y 
4083 : a0 40 __ LDY #$40
4085 : 91 43 __ STA (T1 + 0),y 
4087 : a0 48 __ LDY #$48
4089 : 91 43 __ STA (T1 + 0),y 
408b : a0 50 __ LDY #$50
408d : 91 43 __ STA (T1 + 0),y 
408f : a0 58 __ LDY #$58
4091 : 91 43 __ STA (T1 + 0),y 
4093 : a0 60 __ LDY #$60
4095 : 91 43 __ STA (T1 + 0),y 
4097 : a0 68 __ LDY #$68
4099 : 91 43 __ STA (T1 + 0),y 
409b : a0 70 __ LDY #$70
409d : 91 43 __ STA (T1 + 0),y 
409f : a0 78 __ LDY #$78
40a1 : 91 43 __ STA (T1 + 0),y 
40a3 : a0 80 __ LDY #$80
40a5 : 91 43 __ STA (T1 + 0),y 
40a7 : a0 88 __ LDY #$88
40a9 : 91 43 __ STA (T1 + 0),y 
40ab : a0 90 __ LDY #$90
40ad : 91 43 __ STA (T1 + 0),y 
40af : a0 98 __ LDY #$98
40b1 : 91 43 __ STA (T1 + 0),y 
40b3 : a0 a0 __ LDY #$a0
40b5 : 91 43 __ STA (T1 + 0),y 
40b7 : a0 a8 __ LDY #$a8
40b9 : 91 43 __ STA (T1 + 0),y 
40bb : a0 b0 __ LDY #$b0
40bd : 91 43 __ STA (T1 + 0),y 
40bf : a0 b8 __ LDY #$b8
40c1 : 91 43 __ STA (T1 + 0),y 
40c3 : a0 c0 __ LDY #$c0
40c5 : 91 43 __ STA (T1 + 0),y 
40c7 : a0 c8 __ LDY #$c8
40c9 : 91 43 __ STA (T1 + 0),y 
40cb : a0 d0 __ LDY #$d0
40cd : 91 43 __ STA (T1 + 0),y 
40cf : a0 d8 __ LDY #$d8
40d1 : 91 43 __ STA (T1 + 0),y 
40d3 : a0 e0 __ LDY #$e0
40d5 : 91 43 __ STA (T1 + 0),y 
40d7 : a0 e8 __ LDY #$e8
40d9 : 91 43 __ STA (T1 + 0),y 
40db : a0 f0 __ LDY #$f0
40dd : 91 43 __ STA (T1 + 0),y 
40df : a0 f8 __ LDY #$f8
40e1 : 91 43 __ STA (T1 + 0),y 
40e3 : 38 __ __ SEC
40e4 : a5 1b __ LDA ACCU + 0 
40e6 : e9 f8 __ SBC #$f8
40e8 : 85 1b __ STA ACCU + 0 
40ea : e6 44 __ INC T1 + 1 
40ec : a9 00 __ LDA #$00
40ee : f0 48 __ BEQ $4138 ; (bm_scan_fill.s28 + 0)
.s8:
40f0 : 24 1b __ BIT ACCU + 0 
40f2 : 30 04 __ BMI $40f8 ; (bm_scan_fill.s13 + 0)
.s9:
40f4 : a9 08 __ LDA #$08
40f6 : d0 40 __ BNE $4138 ; (bm_scan_fill.s28 + 0)
.s13:
40f8 : a5 17 __ LDA P10 ; (pat + 0)
40fa : a0 08 __ LDY #$08
40fc : 91 43 __ STA (T1 + 0),y 
40fe : a0 10 __ LDY #$10
4100 : 91 43 __ STA (T1 + 0),y 
4102 : a0 18 __ LDY #$18
4104 : 91 43 __ STA (T1 + 0),y 
4106 : a0 20 __ LDY #$20
4108 : 91 43 __ STA (T1 + 0),y 
410a : a0 28 __ LDY #$28
410c : 91 43 __ STA (T1 + 0),y 
410e : a0 30 __ LDY #$30
4110 : 91 43 __ STA (T1 + 0),y 
4112 : a0 38 __ LDY #$38
4114 : 91 43 __ STA (T1 + 0),y 
4116 : a0 40 __ LDY #$40
4118 : 91 43 __ STA (T1 + 0),y 
411a : a0 48 __ LDY #$48
411c : 91 43 __ STA (T1 + 0),y 
411e : a0 50 __ LDY #$50
4120 : 91 43 __ STA (T1 + 0),y 
4122 : a0 58 __ LDY #$58
4124 : 91 43 __ STA (T1 + 0),y 
4126 : a0 60 __ LDY #$60
4128 : 91 43 __ STA (T1 + 0),y 
412a : a0 68 __ LDY #$68
412c : 91 43 __ STA (T1 + 0),y 
412e : a0 70 __ LDY #$70
4130 : 91 43 __ STA (T1 + 0),y 
4132 : a0 78 __ LDY #$78
4134 : 91 43 __ STA (T1 + 0),y 
4136 : a9 80 __ LDA #$80
.s28:
4138 : a6 17 __ LDX P10 ; (pat + 0)
413a : 4c 43 41 JMP $4143 ; (bm_scan_fill.l10 + 0)
.s12:
413d : 8a __ __ TXA
413e : 91 43 __ STA (T1 + 0),y 
4140 : 98 __ __ TYA
4141 : 69 08 __ ADC #$08
.l10:
4143 : a8 __ __ TAY
4144 : c4 1b __ CPY ACCU + 0 
4146 : 90 f5 __ BCC $413d ; (bm_scan_fill.s12 + 0)
.s29:
4148 : a5 1e __ LDA ACCU + 3 
414a : 4c 39 40 JMP $4039 ; (bm_scan_fill.s11 + 0)
.s18:
414d : 85 15 __ STA P8 ; (x1 + 0)
414f : a5 10 __ LDA P3 ; (right + 1)
4151 : 85 16 __ STA P9 ; (x1 + 1)
4153 : a5 14 __ LDA P7 ; (x0 + 1)
4155 : c5 10 __ CMP P3 ; (right + 1)
4157 : f0 03 __ BEQ $415c ; (bm_scan_fill.s19 + 0)
4159 : 4c ff 3f JMP $3fff ; (bm_scan_fill.s20 + 0)
.s19:
415c : a5 13 __ LDA P6 ; (x0 + 0)
415e : c5 0f __ CMP P2 ; (right + 0)
4160 : 4c ff 3f JMP $3fff ; (bm_scan_fill.s20 + 0)
.s22:
4163 : 90 03 __ BCC $4168 ; (bm_scan_fill.s30 + 0)
4165 : 4c f5 3f JMP $3ff5 ; (bm_scan_fill.s17 + 0)
.s30:
4168 : a5 0f __ LDA P2 ; (right + 0)
416a : 90 e1 __ BCC $414d ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
416c : 20 e4 ff JSR $ffe4 
416f : 85 1b __ STA ACCU + 0 
4171 : a5 1b __ LDA ACCU + 0 
4173 : f0 f7 __ BEQ $416c ; (getch.l4 + 0)
.s5:
4175 : 4c 78 41 JMP $4178 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
4178 : a8 __ __ TAY
4179 : ad 9d 4a LDA $4a9d ; (giocharmap + 0)
417c : f0 27 __ BEQ $41a5 ; (convch.s5 + 0)
.s6:
417e : c0 0d __ CPY #$0d
4180 : d0 03 __ BNE $4185 ; (convch.s7 + 0)
.s16:
4182 : a9 0a __ LDA #$0a
.s3:
4184 : 60 __ __ RTS
.s7:
4185 : c9 02 __ CMP #$02
4187 : 90 1c __ BCC $41a5 ; (convch.s5 + 0)
.s8:
4189 : 98 __ __ TYA
418a : c0 41 __ CPY #$41
418c : 90 17 __ BCC $41a5 ; (convch.s5 + 0)
.s9:
418e : c9 db __ CMP #$db
4190 : b0 13 __ BCS $41a5 ; (convch.s5 + 0)
.s10:
4192 : c9 c1 __ CMP #$c1
4194 : 90 03 __ BCC $4199 ; (convch.s11 + 0)
.s15:
4196 : 49 a0 __ EOR #$a0
4198 : a8 __ __ TAY
.s11:
4199 : c9 7b __ CMP #$7b
419b : b0 08 __ BCS $41a5 ; (convch.s5 + 0)
.s12:
419d : c9 61 __ CMP #$61
419f : b0 06 __ BCS $41a7 ; (convch.s14 + 0)
.s13:
41a1 : c9 5b __ CMP #$5b
41a3 : 90 02 __ BCC $41a7 ; (convch.s14 + 0)
.s5:
41a5 : 98 __ __ TYA
41a6 : 60 __ __ RTS
.s14:
41a7 : 49 20 __ EOR #$20
41a9 : 60 __ __ RTS
--------------------------------------------------------------------
restore: ; restore()->void
;  48, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/func3d.c"
.s4:
41aa : a9 00 __ LDA #$00
41ac : 85 0d __ STA P0 
41ae : 85 0e __ STA P1 
41b0 : 85 10 __ STA P3 
41b2 : a9 04 __ LDA #$04
41b4 : 85 0f __ STA P2 
41b6 : a9 10 __ LDA #$10
41b8 : 85 11 __ STA P4 
41ba : 20 b8 13 JSR $13b8 ; (vic_setmode.s4 + 0)
41bd : a9 37 __ LDA #$37
41bf : 85 01 __ STA $01 
.s3:
41c1 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
41c2 : 4a __ __ LSR
41c3 : f0 2e __ BEQ $41f3 ; (mul16by8 + 49)
41c5 : a2 00 __ LDX #$00
41c7 : a0 00 __ LDY #$00
41c9 : 90 13 __ BCC $41de ; (mul16by8 + 28)
41cb : a4 1b __ LDY ACCU + 0 
41cd : a6 1c __ LDX ACCU + 1 
41cf : b0 0d __ BCS $41de ; (mul16by8 + 28)
41d1 : 85 02 __ STA $02 
41d3 : 18 __ __ CLC
41d4 : 98 __ __ TYA
41d5 : 65 1b __ ADC ACCU + 0 
41d7 : a8 __ __ TAY
41d8 : 8a __ __ TXA
41d9 : 65 1c __ ADC ACCU + 1 
41db : aa __ __ TAX
41dc : a5 02 __ LDA $02 
41de : 06 1b __ ASL ACCU + 0 
41e0 : 26 1c __ ROL ACCU + 1 
41e2 : 4a __ __ LSR
41e3 : 90 f9 __ BCC $41de ; (mul16by8 + 28)
41e5 : d0 ea __ BNE $41d1 ; (mul16by8 + 15)
41e7 : 18 __ __ CLC
41e8 : 98 __ __ TYA
41e9 : 65 1b __ ADC ACCU + 0 
41eb : 85 1b __ STA ACCU + 0 
41ed : 8a __ __ TXA
41ee : 65 1c __ ADC ACCU + 1 
41f0 : 85 1c __ STA ACCU + 1 
41f2 : 60 __ __ RTS
41f3 : b0 04 __ BCS $41f9 ; (mul16by8 + 55)
41f5 : 85 1b __ STA ACCU + 0 
41f7 : 85 1c __ STA ACCU + 1 
41f9 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
41fa : a0 00 __ LDY #$00
41fc : 84 07 __ STY WORK + 4 
41fe : 84 08 __ STY WORK + 5 
4200 : 84 09 __ STY WORK + 6 
4202 : 4a __ __ LSR
4203 : b0 0d __ BCS $4212 ; (mul32by8 + 24)
4205 : f0 26 __ BEQ $422d ; (mul32by8 + 51)
4207 : 06 1b __ ASL ACCU + 0 
4209 : 26 1c __ ROL ACCU + 1 
420b : 26 1d __ ROL ACCU + 2 
420d : 26 1e __ ROL ACCU + 3 
420f : 4a __ __ LSR
4210 : 90 f5 __ BCC $4207 ; (mul32by8 + 13)
4212 : aa __ __ TAX
4213 : 18 __ __ CLC
4214 : a5 07 __ LDA WORK + 4 
4216 : 65 1b __ ADC ACCU + 0 
4218 : 85 07 __ STA WORK + 4 
421a : a5 08 __ LDA WORK + 5 
421c : 65 1c __ ADC ACCU + 1 
421e : 85 08 __ STA WORK + 5 
4220 : a5 09 __ LDA WORK + 6 
4222 : 65 1d __ ADC ACCU + 2 
4224 : 85 09 __ STA WORK + 6 
4226 : 98 __ __ TYA
4227 : 65 1e __ ADC ACCU + 3 
4229 : a8 __ __ TAY
422a : 8a __ __ TXA
422b : d0 da __ BNE $4207 ; (mul32by8 + 13)
422d : 84 0a __ STY WORK + 7 
422f : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
4230 : b1 19 __ LDA (IP + 0),y 
4232 : c8 __ __ INY
4233 : aa __ __ TAX
4234 : b5 00 __ LDA $00,x 
4236 : 85 03 __ STA WORK + 0 
4238 : b5 01 __ LDA $01,x 
423a : 85 04 __ STA WORK + 1 
423c : b5 02 __ LDA $02,x 
423e : 85 05 __ STA WORK + 2 
4240 : b5 03 __ LDA WORK + 0,x 
4242 : 85 06 __ STA WORK + 3 
4244 : a5 05 __ LDA WORK + 2 
4246 : 0a __ __ ASL
4247 : a5 06 __ LDA WORK + 3 
4249 : 2a __ __ ROL
424a : 85 08 __ STA WORK + 5 
424c : f0 06 __ BEQ $4254 ; (freg + 36)
424e : a5 05 __ LDA WORK + 2 
4250 : 09 80 __ ORA #$80
4252 : 85 05 __ STA WORK + 2 
4254 : a5 1d __ LDA ACCU + 2 
4256 : 0a __ __ ASL
4257 : a5 1e __ LDA ACCU + 3 
4259 : 2a __ __ ROL
425a : 85 07 __ STA WORK + 4 
425c : f0 06 __ BEQ $4264 ; (freg + 52)
425e : a5 1d __ LDA ACCU + 2 
4260 : 09 80 __ ORA #$80
4262 : 85 1d __ STA ACCU + 2 
4264 : 60 __ __ RTS
4265 : 06 1e __ ASL ACCU + 3 
4267 : a5 07 __ LDA WORK + 4 
4269 : 6a __ __ ROR
426a : 85 1e __ STA ACCU + 3 
426c : b0 06 __ BCS $4274 ; (freg + 68)
426e : a5 1d __ LDA ACCU + 2 
4270 : 29 7f __ AND #$7f
4272 : 85 1d __ STA ACCU + 2 
4274 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
4275 : a5 06 __ LDA WORK + 3 
4277 : 49 80 __ EOR #$80
4279 : 85 06 __ STA WORK + 3 
427b : a9 ff __ LDA #$ff
427d : c5 07 __ CMP WORK + 4 
427f : f0 04 __ BEQ $4285 ; (faddsub + 16)
4281 : c5 08 __ CMP WORK + 5 
4283 : d0 11 __ BNE $4296 ; (faddsub + 33)
4285 : a5 1e __ LDA ACCU + 3 
4287 : 09 7f __ ORA #$7f
4289 : 85 1e __ STA ACCU + 3 
428b : a9 80 __ LDA #$80
428d : 85 1d __ STA ACCU + 2 
428f : a9 00 __ LDA #$00
4291 : 85 1b __ STA ACCU + 0 
4293 : 85 1c __ STA ACCU + 1 
4295 : 60 __ __ RTS
4296 : 38 __ __ SEC
4297 : a5 07 __ LDA WORK + 4 
4299 : e5 08 __ SBC WORK + 5 
429b : f0 38 __ BEQ $42d5 ; (faddsub + 96)
429d : aa __ __ TAX
429e : b0 25 __ BCS $42c5 ; (faddsub + 80)
42a0 : e0 e9 __ CPX #$e9
42a2 : b0 0e __ BCS $42b2 ; (faddsub + 61)
42a4 : a5 08 __ LDA WORK + 5 
42a6 : 85 07 __ STA WORK + 4 
42a8 : a9 00 __ LDA #$00
42aa : 85 1b __ STA ACCU + 0 
42ac : 85 1c __ STA ACCU + 1 
42ae : 85 1d __ STA ACCU + 2 
42b0 : f0 23 __ BEQ $42d5 ; (faddsub + 96)
42b2 : a5 1d __ LDA ACCU + 2 
42b4 : 4a __ __ LSR
42b5 : 66 1c __ ROR ACCU + 1 
42b7 : 66 1b __ ROR ACCU + 0 
42b9 : e8 __ __ INX
42ba : d0 f8 __ BNE $42b4 ; (faddsub + 63)
42bc : 85 1d __ STA ACCU + 2 
42be : a5 08 __ LDA WORK + 5 
42c0 : 85 07 __ STA WORK + 4 
42c2 : 4c d5 42 JMP $42d5 ; (faddsub + 96)
42c5 : e0 18 __ CPX #$18
42c7 : b0 33 __ BCS $42fc ; (faddsub + 135)
42c9 : a5 05 __ LDA WORK + 2 
42cb : 4a __ __ LSR
42cc : 66 04 __ ROR WORK + 1 
42ce : 66 03 __ ROR WORK + 0 
42d0 : ca __ __ DEX
42d1 : d0 f8 __ BNE $42cb ; (faddsub + 86)
42d3 : 85 05 __ STA WORK + 2 
42d5 : a5 1e __ LDA ACCU + 3 
42d7 : 29 80 __ AND #$80
42d9 : 85 1e __ STA ACCU + 3 
42db : 45 06 __ EOR WORK + 3 
42dd : 30 31 __ BMI $4310 ; (faddsub + 155)
42df : 18 __ __ CLC
42e0 : a5 1b __ LDA ACCU + 0 
42e2 : 65 03 __ ADC WORK + 0 
42e4 : 85 1b __ STA ACCU + 0 
42e6 : a5 1c __ LDA ACCU + 1 
42e8 : 65 04 __ ADC WORK + 1 
42ea : 85 1c __ STA ACCU + 1 
42ec : a5 1d __ LDA ACCU + 2 
42ee : 65 05 __ ADC WORK + 2 
42f0 : 85 1d __ STA ACCU + 2 
42f2 : 90 08 __ BCC $42fc ; (faddsub + 135)
42f4 : 66 1d __ ROR ACCU + 2 
42f6 : 66 1c __ ROR ACCU + 1 
42f8 : 66 1b __ ROR ACCU + 0 
42fa : e6 07 __ INC WORK + 4 
42fc : a5 07 __ LDA WORK + 4 
42fe : c9 ff __ CMP #$ff
4300 : f0 83 __ BEQ $4285 ; (faddsub + 16)
4302 : 4a __ __ LSR
4303 : 05 1e __ ORA ACCU + 3 
4305 : 85 1e __ STA ACCU + 3 
4307 : b0 06 __ BCS $430f ; (faddsub + 154)
4309 : a5 1d __ LDA ACCU + 2 
430b : 29 7f __ AND #$7f
430d : 85 1d __ STA ACCU + 2 
430f : 60 __ __ RTS
4310 : 38 __ __ SEC
4311 : a5 1b __ LDA ACCU + 0 
4313 : e5 03 __ SBC WORK + 0 
4315 : 85 1b __ STA ACCU + 0 
4317 : a5 1c __ LDA ACCU + 1 
4319 : e5 04 __ SBC WORK + 1 
431b : 85 1c __ STA ACCU + 1 
431d : a5 1d __ LDA ACCU + 2 
431f : e5 05 __ SBC WORK + 2 
4321 : 85 1d __ STA ACCU + 2 
4323 : b0 19 __ BCS $433e ; (faddsub + 201)
4325 : 38 __ __ SEC
4326 : a9 00 __ LDA #$00
4328 : e5 1b __ SBC ACCU + 0 
432a : 85 1b __ STA ACCU + 0 
432c : a9 00 __ LDA #$00
432e : e5 1c __ SBC ACCU + 1 
4330 : 85 1c __ STA ACCU + 1 
4332 : a9 00 __ LDA #$00
4334 : e5 1d __ SBC ACCU + 2 
4336 : 85 1d __ STA ACCU + 2 
4338 : a5 1e __ LDA ACCU + 3 
433a : 49 80 __ EOR #$80
433c : 85 1e __ STA ACCU + 3 
433e : a5 1d __ LDA ACCU + 2 
4340 : 30 ba __ BMI $42fc ; (faddsub + 135)
4342 : 05 1c __ ORA ACCU + 1 
4344 : 05 1b __ ORA ACCU + 0 
4346 : f0 0f __ BEQ $4357 ; (faddsub + 226)
4348 : c6 07 __ DEC WORK + 4 
434a : f0 0b __ BEQ $4357 ; (faddsub + 226)
434c : 06 1b __ ASL ACCU + 0 
434e : 26 1c __ ROL ACCU + 1 
4350 : 26 1d __ ROL ACCU + 2 
4352 : 10 f4 __ BPL $4348 ; (faddsub + 211)
4354 : 4c fc 42 JMP $42fc ; (faddsub + 135)
4357 : a9 00 __ LDA #$00
4359 : 85 1b __ STA ACCU + 0 
435b : 85 1c __ STA ACCU + 1 
435d : 85 1d __ STA ACCU + 2 
435f : 85 1e __ STA ACCU + 3 
4361 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
4362 : a5 1b __ LDA ACCU + 0 
4364 : 05 1c __ ORA ACCU + 1 
4366 : 05 1d __ ORA ACCU + 2 
4368 : f0 0e __ BEQ $4378 ; (crt_fmul + 22)
436a : a5 03 __ LDA WORK + 0 
436c : 05 04 __ ORA WORK + 1 
436e : 05 05 __ ORA WORK + 2 
4370 : d0 09 __ BNE $437b ; (crt_fmul + 25)
4372 : 85 1b __ STA ACCU + 0 
4374 : 85 1c __ STA ACCU + 1 
4376 : 85 1d __ STA ACCU + 2 
4378 : 85 1e __ STA ACCU + 3 
437a : 60 __ __ RTS
437b : a5 1e __ LDA ACCU + 3 
437d : 45 06 __ EOR WORK + 3 
437f : 29 80 __ AND #$80
4381 : 85 1e __ STA ACCU + 3 
4383 : a9 ff __ LDA #$ff
4385 : c5 07 __ CMP WORK + 4 
4387 : f0 42 __ BEQ $43cb ; (crt_fmul + 105)
4389 : c5 08 __ CMP WORK + 5 
438b : f0 3e __ BEQ $43cb ; (crt_fmul + 105)
438d : a9 00 __ LDA #$00
438f : 85 09 __ STA WORK + 6 
4391 : 85 0a __ STA WORK + 7 
4393 : 85 0b __ STA WORK + 8 
4395 : a4 1b __ LDY ACCU + 0 
4397 : a5 03 __ LDA WORK + 0 
4399 : d0 06 __ BNE $43a1 ; (crt_fmul + 63)
439b : a5 04 __ LDA WORK + 1 
439d : f0 0a __ BEQ $43a9 ; (crt_fmul + 71)
439f : d0 05 __ BNE $43a6 ; (crt_fmul + 68)
43a1 : 20 fc 43 JSR $43fc ; (crt_fmul8 + 0)
43a4 : a5 04 __ LDA WORK + 1 
43a6 : 20 fc 43 JSR $43fc ; (crt_fmul8 + 0)
43a9 : a5 05 __ LDA WORK + 2 
43ab : 20 fc 43 JSR $43fc ; (crt_fmul8 + 0)
43ae : 38 __ __ SEC
43af : a5 0b __ LDA WORK + 8 
43b1 : 30 06 __ BMI $43b9 ; (crt_fmul + 87)
43b3 : 06 09 __ ASL WORK + 6 
43b5 : 26 0a __ ROL WORK + 7 
43b7 : 2a __ __ ROL
43b8 : 18 __ __ CLC
43b9 : 29 7f __ AND #$7f
43bb : 85 0b __ STA WORK + 8 
43bd : a5 07 __ LDA WORK + 4 
43bf : 65 08 __ ADC WORK + 5 
43c1 : 90 19 __ BCC $43dc ; (crt_fmul + 122)
43c3 : e9 7f __ SBC #$7f
43c5 : b0 04 __ BCS $43cb ; (crt_fmul + 105)
43c7 : c9 ff __ CMP #$ff
43c9 : d0 15 __ BNE $43e0 ; (crt_fmul + 126)
43cb : a5 1e __ LDA ACCU + 3 
43cd : 09 7f __ ORA #$7f
43cf : 85 1e __ STA ACCU + 3 
43d1 : a9 80 __ LDA #$80
43d3 : 85 1d __ STA ACCU + 2 
43d5 : a9 00 __ LDA #$00
43d7 : 85 1b __ STA ACCU + 0 
43d9 : 85 1c __ STA ACCU + 1 
43db : 60 __ __ RTS
43dc : e9 7e __ SBC #$7e
43de : 90 15 __ BCC $43f5 ; (crt_fmul + 147)
43e0 : 4a __ __ LSR
43e1 : 05 1e __ ORA ACCU + 3 
43e3 : 85 1e __ STA ACCU + 3 
43e5 : a9 00 __ LDA #$00
43e7 : 6a __ __ ROR
43e8 : 05 0b __ ORA WORK + 8 
43ea : 85 1d __ STA ACCU + 2 
43ec : a5 0a __ LDA WORK + 7 
43ee : 85 1c __ STA ACCU + 1 
43f0 : a5 09 __ LDA WORK + 6 
43f2 : 85 1b __ STA ACCU + 0 
43f4 : 60 __ __ RTS
43f5 : a9 00 __ LDA #$00
43f7 : 85 1e __ STA ACCU + 3 
43f9 : f0 d8 __ BEQ $43d3 ; (crt_fmul + 113)
43fb : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
43fc : 38 __ __ SEC
43fd : 6a __ __ ROR
43fe : 90 1e __ BCC $441e ; (crt_fmul8 + 34)
4400 : aa __ __ TAX
4401 : 18 __ __ CLC
4402 : 98 __ __ TYA
4403 : 65 09 __ ADC WORK + 6 
4405 : 85 09 __ STA WORK + 6 
4407 : a5 0a __ LDA WORK + 7 
4409 : 65 1c __ ADC ACCU + 1 
440b : 85 0a __ STA WORK + 7 
440d : a5 0b __ LDA WORK + 8 
440f : 65 1d __ ADC ACCU + 2 
4411 : 6a __ __ ROR
4412 : 85 0b __ STA WORK + 8 
4414 : 8a __ __ TXA
4415 : 66 0a __ ROR WORK + 7 
4417 : 66 09 __ ROR WORK + 6 
4419 : 4a __ __ LSR
441a : f0 0d __ BEQ $4429 ; (crt_fmul8 + 45)
441c : b0 e2 __ BCS $4400 ; (crt_fmul8 + 4)
441e : 66 0b __ ROR WORK + 8 
4420 : 66 0a __ ROR WORK + 7 
4422 : 66 09 __ ROR WORK + 6 
4424 : 4a __ __ LSR
4425 : 90 f7 __ BCC $441e ; (crt_fmul8 + 34)
4427 : d0 d7 __ BNE $4400 ; (crt_fmul8 + 4)
4429 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
442a : a5 1b __ LDA ACCU + 0 
442c : 05 1c __ ORA ACCU + 1 
442e : 05 1d __ ORA ACCU + 2 
4430 : d0 03 __ BNE $4435 ; (crt_fdiv + 11)
4432 : 85 1e __ STA ACCU + 3 
4434 : 60 __ __ RTS
4435 : a5 1e __ LDA ACCU + 3 
4437 : 45 06 __ EOR WORK + 3 
4439 : 29 80 __ AND #$80
443b : 85 1e __ STA ACCU + 3 
443d : a5 08 __ LDA WORK + 5 
443f : f0 62 __ BEQ $44a3 ; (crt_fdiv + 121)
4441 : a5 07 __ LDA WORK + 4 
4443 : c9 ff __ CMP #$ff
4445 : f0 5c __ BEQ $44a3 ; (crt_fdiv + 121)
4447 : a9 00 __ LDA #$00
4449 : 85 09 __ STA WORK + 6 
444b : 85 0a __ STA WORK + 7 
444d : 85 0b __ STA WORK + 8 
444f : a2 18 __ LDX #$18
4451 : a5 1b __ LDA ACCU + 0 
4453 : c5 03 __ CMP WORK + 0 
4455 : a5 1c __ LDA ACCU + 1 
4457 : e5 04 __ SBC WORK + 1 
4459 : a5 1d __ LDA ACCU + 2 
445b : e5 05 __ SBC WORK + 2 
445d : 90 13 __ BCC $4472 ; (crt_fdiv + 72)
445f : a5 1b __ LDA ACCU + 0 
4461 : e5 03 __ SBC WORK + 0 
4463 : 85 1b __ STA ACCU + 0 
4465 : a5 1c __ LDA ACCU + 1 
4467 : e5 04 __ SBC WORK + 1 
4469 : 85 1c __ STA ACCU + 1 
446b : a5 1d __ LDA ACCU + 2 
446d : e5 05 __ SBC WORK + 2 
446f : 85 1d __ STA ACCU + 2 
4471 : 38 __ __ SEC
4472 : 26 09 __ ROL WORK + 6 
4474 : 26 0a __ ROL WORK + 7 
4476 : 26 0b __ ROL WORK + 8 
4478 : ca __ __ DEX
4479 : f0 0a __ BEQ $4485 ; (crt_fdiv + 91)
447b : 06 1b __ ASL ACCU + 0 
447d : 26 1c __ ROL ACCU + 1 
447f : 26 1d __ ROL ACCU + 2 
4481 : b0 dc __ BCS $445f ; (crt_fdiv + 53)
4483 : 90 cc __ BCC $4451 ; (crt_fdiv + 39)
4485 : 38 __ __ SEC
4486 : a5 0b __ LDA WORK + 8 
4488 : 30 06 __ BMI $4490 ; (crt_fdiv + 102)
448a : 06 09 __ ASL WORK + 6 
448c : 26 0a __ ROL WORK + 7 
448e : 2a __ __ ROL
448f : 18 __ __ CLC
4490 : 29 7f __ AND #$7f
4492 : 85 0b __ STA WORK + 8 
4494 : a5 07 __ LDA WORK + 4 
4496 : e5 08 __ SBC WORK + 5 
4498 : 90 1a __ BCC $44b4 ; (crt_fdiv + 138)
449a : 18 __ __ CLC
449b : 69 7f __ ADC #$7f
449d : b0 04 __ BCS $44a3 ; (crt_fdiv + 121)
449f : c9 ff __ CMP #$ff
44a1 : d0 15 __ BNE $44b8 ; (crt_fdiv + 142)
44a3 : a5 1e __ LDA ACCU + 3 
44a5 : 09 7f __ ORA #$7f
44a7 : 85 1e __ STA ACCU + 3 
44a9 : a9 80 __ LDA #$80
44ab : 85 1d __ STA ACCU + 2 
44ad : a9 00 __ LDA #$00
44af : 85 1c __ STA ACCU + 1 
44b1 : 85 1b __ STA ACCU + 0 
44b3 : 60 __ __ RTS
44b4 : 69 7f __ ADC #$7f
44b6 : 90 15 __ BCC $44cd ; (crt_fdiv + 163)
44b8 : 4a __ __ LSR
44b9 : 05 1e __ ORA ACCU + 3 
44bb : 85 1e __ STA ACCU + 3 
44bd : a9 00 __ LDA #$00
44bf : 6a __ __ ROR
44c0 : 05 0b __ ORA WORK + 8 
44c2 : 85 1d __ STA ACCU + 2 
44c4 : a5 0a __ LDA WORK + 7 
44c6 : 85 1c __ STA ACCU + 1 
44c8 : a5 09 __ LDA WORK + 6 
44ca : 85 1b __ STA ACCU + 0 
44cc : 60 __ __ RTS
44cd : a9 00 __ LDA #$00
44cf : 85 1e __ STA ACCU + 3 
44d1 : 85 1d __ STA ACCU + 2 
44d3 : 85 1c __ STA ACCU + 1 
44d5 : 85 1b __ STA ACCU + 0 
44d7 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
44d8 : 24 1e __ BIT ACCU + 3 
44da : 10 13 __ BPL $44ef ; (fround + 23)
44dc : 30 6b __ BMI $4549 ; (fround + 113)
44de : 24 1e __ BIT ACCU + 3 
44e0 : 30 0d __ BMI $44ef ; (fround + 23)
44e2 : 10 65 __ BPL $4549 ; (fround + 113)
44e4 : a9 00 __ LDA #$00
44e6 : 85 1b __ STA ACCU + 0 
44e8 : 85 1c __ STA ACCU + 1 
44ea : 85 1d __ STA ACCU + 2 
44ec : 85 1e __ STA ACCU + 3 
44ee : 60 __ __ RTS
44ef : a5 07 __ LDA WORK + 4 
44f1 : c9 7f __ CMP #$7f
44f3 : 90 ef __ BCC $44e4 ; (fround + 12)
44f5 : c9 87 __ CMP #$87
44f7 : 90 16 __ BCC $450f ; (fround + 55)
44f9 : c9 8f __ CMP #$8f
44fb : 90 26 __ BCC $4523 ; (fround + 75)
44fd : c9 97 __ CMP #$97
44ff : b0 34 __ BCS $4535 ; (fround + 93)
4501 : 38 __ __ SEC
4502 : e9 8f __ SBC #$8f
4504 : aa __ __ TAX
4505 : a5 1b __ LDA ACCU + 0 
4507 : 3d 9e 4a AND $4a9e,x ; (ubitmask[0] + 0)
450a : 85 1b __ STA ACCU + 0 
450c : 4c 35 45 JMP $4535 ; (fround + 93)
450f : 38 __ __ SEC
4510 : e9 7f __ SBC #$7f
4512 : aa __ __ TAX
4513 : a5 1d __ LDA ACCU + 2 
4515 : 3d 9e 4a AND $4a9e,x ; (ubitmask[0] + 0)
4518 : 85 1d __ STA ACCU + 2 
451a : a9 00 __ LDA #$00
451c : 85 1b __ STA ACCU + 0 
451e : 85 1c __ STA ACCU + 1 
4520 : 4c 35 45 JMP $4535 ; (fround + 93)
4523 : 38 __ __ SEC
4524 : e9 87 __ SBC #$87
4526 : aa __ __ TAX
4527 : a5 1c __ LDA ACCU + 1 
4529 : 3d 9e 4a AND $4a9e,x ; (ubitmask[0] + 0)
452c : 85 1c __ STA ACCU + 1 
452e : a9 00 __ LDA #$00
4530 : 85 1b __ STA ACCU + 0 
4532 : 4c 35 45 JMP $4535 ; (fround + 93)
4535 : 4c 65 42 JMP $4265 ; (freg + 53)
4538 : a9 7f __ LDA #$7f
453a : 85 07 __ STA WORK + 4 
453c : a9 00 __ LDA #$00
453e : 85 1b __ STA ACCU + 0 
4540 : 85 1c __ STA ACCU + 1 
4542 : a9 80 __ LDA #$80
4544 : 85 1d __ STA ACCU + 2 
4546 : 4c 65 42 JMP $4265 ; (freg + 53)
4549 : a5 1b __ LDA ACCU + 0 
454b : 05 1c __ ORA ACCU + 1 
454d : 05 1d __ ORA ACCU + 2 
454f : f0 93 __ BEQ $44e4 ; (fround + 12)
4551 : a5 07 __ LDA WORK + 4 
4553 : c9 7f __ CMP #$7f
4555 : 90 e1 __ BCC $4538 ; (fround + 96)
4557 : c9 87 __ CMP #$87
4559 : 90 2e __ BCC $4589 ; (fround + 177)
455b : c9 8f __ CMP #$8f
455d : 90 4c __ BCC $45ab ; (fround + 211)
455f : c9 97 __ CMP #$97
4561 : b0 6c __ BCS $45cf ; (fround + 247)
4563 : 38 __ __ SEC
4564 : e9 8f __ SBC #$8f
4566 : aa __ __ TAX
4567 : 18 __ __ CLC
4568 : bd 9e 4a LDA $4a9e,x ; (ubitmask[0] + 0)
456b : 49 ff __ EOR #$ff
456d : 65 1b __ ADC ACCU + 0 
456f : 85 1b __ STA ACCU + 0 
4571 : a9 00 __ LDA #$00
4573 : 65 1c __ ADC ACCU + 1 
4575 : 85 1c __ STA ACCU + 1 
4577 : a9 00 __ LDA #$00
4579 : 65 1d __ ADC ACCU + 2 
457b : 90 07 __ BCC $4584 ; (fround + 172)
457d : 6a __ __ ROR
457e : 66 1c __ ROR ACCU + 1 
4580 : 66 1b __ ROR ACCU + 0 
4582 : e6 07 __ INC WORK + 4 
4584 : 85 1d __ STA ACCU + 2 
4586 : 4c ef 44 JMP $44ef ; (fround + 23)
4589 : 38 __ __ SEC
458a : e9 7f __ SBC #$7f
458c : aa __ __ TAX
458d : 18 __ __ CLC
458e : a9 ff __ LDA #$ff
4590 : 65 1b __ ADC ACCU + 0 
4592 : a9 ff __ LDA #$ff
4594 : 65 1c __ ADC ACCU + 1 
4596 : bd 9e 4a LDA $4a9e,x ; (ubitmask[0] + 0)
4599 : 49 ff __ EOR #$ff
459b : 65 1d __ ADC ACCU + 2 
459d : 90 07 __ BCC $45a6 ; (fround + 206)
459f : 6a __ __ ROR
45a0 : 66 1c __ ROR ACCU + 1 
45a2 : 66 1b __ ROR ACCU + 0 
45a4 : e6 07 __ INC WORK + 4 
45a6 : 85 1d __ STA ACCU + 2 
45a8 : 4c ef 44 JMP $44ef ; (fround + 23)
45ab : 38 __ __ SEC
45ac : e9 87 __ SBC #$87
45ae : aa __ __ TAX
45af : 18 __ __ CLC
45b0 : a9 ff __ LDA #$ff
45b2 : 65 1b __ ADC ACCU + 0 
45b4 : bd 9e 4a LDA $4a9e,x ; (ubitmask[0] + 0)
45b7 : 49 ff __ EOR #$ff
45b9 : 65 1c __ ADC ACCU + 1 
45bb : 85 1c __ STA ACCU + 1 
45bd : a9 00 __ LDA #$00
45bf : 65 1d __ ADC ACCU + 2 
45c1 : 90 07 __ BCC $45ca ; (fround + 242)
45c3 : 6a __ __ ROR
45c4 : 66 1c __ ROR ACCU + 1 
45c6 : 66 1b __ ROR ACCU + 0 
45c8 : e6 07 __ INC WORK + 4 
45ca : 85 1d __ STA ACCU + 2 
45cc : 4c ef 44 JMP $44ef ; (fround + 23)
45cf : 4c 65 42 JMP $4265 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
45d2 : 20 54 42 JSR $4254 ; (freg + 36)
45d5 : a5 07 __ LDA WORK + 4 
45d7 : c9 7f __ CMP #$7f
45d9 : b0 07 __ BCS $45e2 ; (f32_to_i16 + 16)
45db : a9 00 __ LDA #$00
45dd : 85 1b __ STA ACCU + 0 
45df : 85 1c __ STA ACCU + 1 
45e1 : 60 __ __ RTS
45e2 : e9 8e __ SBC #$8e
45e4 : 90 16 __ BCC $45fc ; (f32_to_i16 + 42)
45e6 : 24 1e __ BIT ACCU + 3 
45e8 : 30 09 __ BMI $45f3 ; (f32_to_i16 + 33)
45ea : a9 ff __ LDA #$ff
45ec : 85 1b __ STA ACCU + 0 
45ee : a9 7f __ LDA #$7f
45f0 : 85 1c __ STA ACCU + 1 
45f2 : 60 __ __ RTS
45f3 : a9 00 __ LDA #$00
45f5 : 85 1b __ STA ACCU + 0 
45f7 : a9 80 __ LDA #$80
45f9 : 85 1c __ STA ACCU + 1 
45fb : 60 __ __ RTS
45fc : aa __ __ TAX
45fd : a5 1c __ LDA ACCU + 1 
45ff : 46 1d __ LSR ACCU + 2 
4601 : 6a __ __ ROR
4602 : e8 __ __ INX
4603 : d0 fa __ BNE $45ff ; (f32_to_i16 + 45)
4605 : 24 1e __ BIT ACCU + 3 
4607 : 10 0e __ BPL $4617 ; (f32_to_i16 + 69)
4609 : 38 __ __ SEC
460a : 49 ff __ EOR #$ff
460c : 69 00 __ ADC #$00
460e : 85 1b __ STA ACCU + 0 
4610 : a9 00 __ LDA #$00
4612 : e5 1d __ SBC ACCU + 2 
4614 : 85 1c __ STA ACCU + 1 
4616 : 60 __ __ RTS
4617 : 85 1b __ STA ACCU + 0 
4619 : a5 1d __ LDA ACCU + 2 
461b : 85 1c __ STA ACCU + 1 
461d : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
461e : 24 1c __ BIT ACCU + 1 
4620 : 30 03 __ BMI $4625 ; (sint16_to_float + 7)
4622 : 4c 3c 46 JMP $463c ; (uint16_to_float + 0)
4625 : 38 __ __ SEC
4626 : a9 00 __ LDA #$00
4628 : e5 1b __ SBC ACCU + 0 
462a : 85 1b __ STA ACCU + 0 
462c : a9 00 __ LDA #$00
462e : e5 1c __ SBC ACCU + 1 
4630 : 85 1c __ STA ACCU + 1 
4632 : 20 3c 46 JSR $463c ; (uint16_to_float + 0)
4635 : a5 1e __ LDA ACCU + 3 
4637 : 09 80 __ ORA #$80
4639 : 85 1e __ STA ACCU + 3 
463b : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
463c : a5 1b __ LDA ACCU + 0 
463e : 05 1c __ ORA ACCU + 1 
4640 : d0 05 __ BNE $4647 ; (uint16_to_float + 11)
4642 : 85 1d __ STA ACCU + 2 
4644 : 85 1e __ STA ACCU + 3 
4646 : 60 __ __ RTS
4647 : a2 8e __ LDX #$8e
4649 : a5 1c __ LDA ACCU + 1 
464b : 30 06 __ BMI $4653 ; (uint16_to_float + 23)
464d : ca __ __ DEX
464e : 06 1b __ ASL ACCU + 0 
4650 : 2a __ __ ROL
4651 : 10 fa __ BPL $464d ; (uint16_to_float + 17)
4653 : 0a __ __ ASL
4654 : 85 1d __ STA ACCU + 2 
4656 : a5 1b __ LDA ACCU + 0 
4658 : 85 1c __ STA ACCU + 1 
465a : 8a __ __ TXA
465b : 4a __ __ LSR
465c : 85 1e __ STA ACCU + 3 
465e : a9 00 __ LDA #$00
4660 : 85 1b __ STA ACCU + 0 
4662 : 66 1d __ ROR ACCU + 2 
4664 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fcmp: ; crt_fcmp
4665 : a5 1e __ LDA ACCU + 3 
4667 : 45 06 __ EOR WORK + 3 
4669 : 10 1e __ BPL $4689 ; (crt_fcmp + 36)
466b : a5 1e __ LDA ACCU + 3 
466d : 29 7f __ AND #$7f
466f : 05 1d __ ORA ACCU + 2 
4671 : 05 1c __ ORA ACCU + 1 
4673 : 05 1b __ ORA ACCU + 0 
4675 : d0 0c __ BNE $4683 ; (crt_fcmp + 30)
4677 : a5 06 __ LDA WORK + 3 
4679 : 29 7f __ AND #$7f
467b : 05 05 __ ORA WORK + 2 
467d : 05 04 __ ORA WORK + 1 
467f : 05 03 __ ORA WORK + 0 
4681 : f0 1e __ BEQ $46a1 ; (crt_fcmp + 60)
4683 : a5 1e __ LDA ACCU + 3 
4685 : 30 23 __ BMI $46aa ; (crt_fcmp + 69)
4687 : 10 28 __ BPL $46b1 ; (crt_fcmp + 76)
4689 : a5 1e __ LDA ACCU + 3 
468b : c5 06 __ CMP WORK + 3 
468d : d0 15 __ BNE $46a4 ; (crt_fcmp + 63)
468f : a5 1d __ LDA ACCU + 2 
4691 : c5 05 __ CMP WORK + 2 
4693 : d0 0f __ BNE $46a4 ; (crt_fcmp + 63)
4695 : a5 1c __ LDA ACCU + 1 
4697 : c5 04 __ CMP WORK + 1 
4699 : d0 09 __ BNE $46a4 ; (crt_fcmp + 63)
469b : a5 1b __ LDA ACCU + 0 
469d : c5 03 __ CMP WORK + 0 
469f : d0 03 __ BNE $46a4 ; (crt_fcmp + 63)
46a1 : a9 00 __ LDA #$00
46a3 : 60 __ __ RTS
46a4 : b0 07 __ BCS $46ad ; (crt_fcmp + 72)
46a6 : 24 1e __ BIT ACCU + 3 
46a8 : 30 07 __ BMI $46b1 ; (crt_fcmp + 76)
46aa : a9 01 __ LDA #$01
46ac : 60 __ __ RTS
46ad : 24 1e __ BIT ACCU + 3 
46af : 30 f9 __ BMI $46aa ; (crt_fcmp + 69)
46b1 : a9 ff __ LDA #$ff
46b3 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
46b4 : a5 04 __ LDA WORK + 1 
46b6 : 05 05 __ ORA WORK + 2 
46b8 : 05 06 __ ORA WORK + 3 
46ba : d0 05 __ BNE $46c1 ; (mul32 + 13)
46bc : a5 03 __ LDA WORK + 0 
46be : 4c fa 41 JMP $41fa ; (mul32by8 + 0)
46c1 : a0 00 __ LDY #$00
46c3 : 84 07 __ STY WORK + 4 
46c5 : 84 08 __ STY WORK + 5 
46c7 : 98 __ __ TYA
46c8 : 38 __ __ SEC
46c9 : 66 03 __ ROR WORK + 0 
46cb : 90 15 __ BCC $46e2 ; (mul32 + 46)
46cd : aa __ __ TAX
46ce : 18 __ __ CLC
46cf : a5 07 __ LDA WORK + 4 
46d1 : 65 1b __ ADC ACCU + 0 
46d3 : 85 07 __ STA WORK + 4 
46d5 : a5 08 __ LDA WORK + 5 
46d7 : 65 1c __ ADC ACCU + 1 
46d9 : 85 08 __ STA WORK + 5 
46db : 98 __ __ TYA
46dc : 65 1d __ ADC ACCU + 2 
46de : a8 __ __ TAY
46df : 8a __ __ TXA
46e0 : 65 1e __ ADC ACCU + 3 
46e2 : 46 04 __ LSR WORK + 1 
46e4 : 90 0f __ BCC $46f5 ; (mul32 + 65)
46e6 : aa __ __ TAX
46e7 : 18 __ __ CLC
46e8 : a5 08 __ LDA WORK + 5 
46ea : 65 1b __ ADC ACCU + 0 
46ec : 85 08 __ STA WORK + 5 
46ee : 98 __ __ TYA
46ef : 65 1c __ ADC ACCU + 1 
46f1 : a8 __ __ TAY
46f2 : 8a __ __ TXA
46f3 : 65 1d __ ADC ACCU + 2 
46f5 : 46 05 __ LSR WORK + 2 
46f7 : 90 09 __ BCC $4702 ; (mul32 + 78)
46f9 : aa __ __ TAX
46fa : 18 __ __ CLC
46fb : 98 __ __ TYA
46fc : 65 1b __ ADC ACCU + 0 
46fe : a8 __ __ TAY
46ff : 8a __ __ TXA
4700 : 65 1c __ ADC ACCU + 1 
4702 : 46 06 __ LSR WORK + 3 
4704 : 90 03 __ BCC $4709 ; (mul32 + 85)
4706 : 18 __ __ CLC
4707 : 65 1b __ ADC ACCU + 0 
4709 : 06 1b __ ASL ACCU + 0 
470b : 26 1c __ ROL ACCU + 1 
470d : 26 1d __ ROL ACCU + 2 
470f : 26 1e __ ROL ACCU + 3 
4711 : 46 03 __ LSR WORK + 0 
4713 : 90 cd __ BCC $46e2 ; (mul32 + 46)
4715 : d0 b6 __ BNE $46cd ; (mul32 + 25)
4717 : 84 09 __ STY WORK + 6 
4719 : 85 0a __ STA WORK + 7 
471b : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
471c : 24 1e __ BIT ACCU + 3 
471e : 10 0d __ BPL $472d ; (divs32 + 17)
4720 : 20 3a 47 JSR $473a ; (negaccu32 + 0)
4723 : 24 06 __ BIT WORK + 3 
4725 : 10 0d __ BPL $4734 ; (divs32 + 24)
4727 : 20 54 47 JSR $4754 ; (negtmp32 + 0)
472a : 4c 6e 47 JMP $476e ; (divmod32 + 0)
472d : 24 06 __ BIT WORK + 3 
472f : 10 f9 __ BPL $472a ; (divs32 + 14)
4731 : 20 54 47 JSR $4754 ; (negtmp32 + 0)
4734 : 20 6e 47 JSR $476e ; (divmod32 + 0)
4737 : 4c 3a 47 JMP $473a ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
473a : 38 __ __ SEC
473b : a9 00 __ LDA #$00
473d : e5 1b __ SBC ACCU + 0 
473f : 85 1b __ STA ACCU + 0 
4741 : a9 00 __ LDA #$00
4743 : e5 1c __ SBC ACCU + 1 
4745 : 85 1c __ STA ACCU + 1 
4747 : a9 00 __ LDA #$00
4749 : e5 1d __ SBC ACCU + 2 
474b : 85 1d __ STA ACCU + 2 
474d : a9 00 __ LDA #$00
474f : e5 1e __ SBC ACCU + 3 
4751 : 85 1e __ STA ACCU + 3 
4753 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
4754 : 38 __ __ SEC
4755 : a9 00 __ LDA #$00
4757 : e5 03 __ SBC WORK + 0 
4759 : 85 03 __ STA WORK + 0 
475b : a9 00 __ LDA #$00
475d : e5 04 __ SBC WORK + 1 
475f : 85 04 __ STA WORK + 1 
4761 : a9 00 __ LDA #$00
4763 : e5 05 __ SBC WORK + 2 
4765 : 85 05 __ STA WORK + 2 
4767 : a9 00 __ LDA #$00
4769 : e5 06 __ SBC WORK + 3 
476b : 85 06 __ STA WORK + 3 
476d : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
476e : 84 02 __ STY $02 
4770 : a0 20 __ LDY #$20
4772 : a9 00 __ LDA #$00
4774 : 85 07 __ STA WORK + 4 
4776 : 85 08 __ STA WORK + 5 
4778 : 85 09 __ STA WORK + 6 
477a : 85 0a __ STA WORK + 7 
477c : a5 05 __ LDA WORK + 2 
477e : 05 06 __ ORA WORK + 3 
4780 : d0 78 __ BNE $47fa ; (divmod32 + 140)
4782 : a5 04 __ LDA WORK + 1 
4784 : d0 27 __ BNE $47ad ; (divmod32 + 63)
4786 : 18 __ __ CLC
4787 : 26 1b __ ROL ACCU + 0 
4789 : 26 1c __ ROL ACCU + 1 
478b : 26 1d __ ROL ACCU + 2 
478d : 26 1e __ ROL ACCU + 3 
478f : 2a __ __ ROL
4790 : 90 05 __ BCC $4797 ; (divmod32 + 41)
4792 : e5 03 __ SBC WORK + 0 
4794 : 38 __ __ SEC
4795 : b0 06 __ BCS $479d ; (divmod32 + 47)
4797 : c5 03 __ CMP WORK + 0 
4799 : 90 02 __ BCC $479d ; (divmod32 + 47)
479b : e5 03 __ SBC WORK + 0 
479d : 88 __ __ DEY
479e : d0 e7 __ BNE $4787 ; (divmod32 + 25)
47a0 : 85 07 __ STA WORK + 4 
47a2 : 26 1b __ ROL ACCU + 0 
47a4 : 26 1c __ ROL ACCU + 1 
47a6 : 26 1d __ ROL ACCU + 2 
47a8 : 26 1e __ ROL ACCU + 3 
47aa : a4 02 __ LDY $02 
47ac : 60 __ __ RTS
47ad : a5 1e __ LDA ACCU + 3 
47af : d0 10 __ BNE $47c1 ; (divmod32 + 83)
47b1 : a6 1d __ LDX ACCU + 2 
47b3 : 86 1e __ STX ACCU + 3 
47b5 : a6 1c __ LDX ACCU + 1 
47b7 : 86 1d __ STX ACCU + 2 
47b9 : a6 1b __ LDX ACCU + 0 
47bb : 86 1c __ STX ACCU + 1 
47bd : 85 1b __ STA ACCU + 0 
47bf : a0 18 __ LDY #$18
47c1 : 18 __ __ CLC
47c2 : 26 1b __ ROL ACCU + 0 
47c4 : 26 1c __ ROL ACCU + 1 
47c6 : 26 1d __ ROL ACCU + 2 
47c8 : 26 1e __ ROL ACCU + 3 
47ca : 26 07 __ ROL WORK + 4 
47cc : 26 08 __ ROL WORK + 5 
47ce : 90 0c __ BCC $47dc ; (divmod32 + 110)
47d0 : a5 07 __ LDA WORK + 4 
47d2 : e5 03 __ SBC WORK + 0 
47d4 : aa __ __ TAX
47d5 : a5 08 __ LDA WORK + 5 
47d7 : e5 04 __ SBC WORK + 1 
47d9 : 38 __ __ SEC
47da : b0 0c __ BCS $47e8 ; (divmod32 + 122)
47dc : 38 __ __ SEC
47dd : a5 07 __ LDA WORK + 4 
47df : e5 03 __ SBC WORK + 0 
47e1 : aa __ __ TAX
47e2 : a5 08 __ LDA WORK + 5 
47e4 : e5 04 __ SBC WORK + 1 
47e6 : 90 04 __ BCC $47ec ; (divmod32 + 126)
47e8 : 86 07 __ STX WORK + 4 
47ea : 85 08 __ STA WORK + 5 
47ec : 88 __ __ DEY
47ed : d0 d3 __ BNE $47c2 ; (divmod32 + 84)
47ef : 26 1b __ ROL ACCU + 0 
47f1 : 26 1c __ ROL ACCU + 1 
47f3 : 26 1d __ ROL ACCU + 2 
47f5 : 26 1e __ ROL ACCU + 3 
47f7 : a4 02 __ LDY $02 
47f9 : 60 __ __ RTS
47fa : a0 10 __ LDY #$10
47fc : a5 1e __ LDA ACCU + 3 
47fe : 85 08 __ STA WORK + 5 
4800 : a5 1d __ LDA ACCU + 2 
4802 : 85 07 __ STA WORK + 4 
4804 : a9 00 __ LDA #$00
4806 : 85 1d __ STA ACCU + 2 
4808 : 85 1e __ STA ACCU + 3 
480a : 18 __ __ CLC
480b : 26 1b __ ROL ACCU + 0 
480d : 26 1c __ ROL ACCU + 1 
480f : 26 07 __ ROL WORK + 4 
4811 : 26 08 __ ROL WORK + 5 
4813 : 26 09 __ ROL WORK + 6 
4815 : 26 0a __ ROL WORK + 7 
4817 : a5 07 __ LDA WORK + 4 
4819 : c5 03 __ CMP WORK + 0 
481b : a5 08 __ LDA WORK + 5 
481d : e5 04 __ SBC WORK + 1 
481f : a5 09 __ LDA WORK + 6 
4821 : e5 05 __ SBC WORK + 2 
4823 : aa __ __ TAX
4824 : a5 0a __ LDA WORK + 7 
4826 : e5 06 __ SBC WORK + 3 
4828 : 90 11 __ BCC $483b ; (divmod32 + 205)
482a : 86 09 __ STX WORK + 6 
482c : 85 0a __ STA WORK + 7 
482e : a5 07 __ LDA WORK + 4 
4830 : e5 03 __ SBC WORK + 0 
4832 : 85 07 __ STA WORK + 4 
4834 : a5 08 __ LDA WORK + 5 
4836 : e5 04 __ SBC WORK + 1 
4838 : 85 08 __ STA WORK + 5 
483a : 38 __ __ SEC
483b : 88 __ __ DEY
483c : d0 cd __ BNE $480b ; (divmod32 + 157)
483e : 26 1b __ ROL ACCU + 0 
4840 : 26 1c __ ROL ACCU + 1 
4842 : a4 02 __ LDY $02 
4844 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
4845 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
Screen:
4846 : __ __ __ BYT 00 e0 00 00 28 19 40 01                         : ....(.@.
--------------------------------------------------------------------
SRect:
484e : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
TinyFont:
4856 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
4866 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
4876 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
4886 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
4896 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
48a6 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
48b6 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
48c6 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
48d6 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
48e6 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
48f6 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
4906 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
4916 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
4926 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
4936 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
4946 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
4956 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
4966 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
4976 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
4986 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
4996 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
49a6 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
49b6 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
49c6 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
49d6 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
49e6 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
49f6 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
4a06 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
4a16 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
4a26 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
4a36 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
4a46 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
4a56 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
4a66 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
4a76 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
4a81 : __ __ __ BYT 80 4b 00 00 28 01 40 01                         : .K..(.@.
--------------------------------------------------------------------
lmask:
4a89 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
4a91 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
4a99 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
giocharmap:
4a9d : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
ubitmask:
4a9e : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
tworks:
4aa6 : __ __ __ BSS	8
--------------------------------------------------------------------
wmat:
4aae : __ __ __ BSS	64
--------------------------------------------------------------------
vlight:
4aee : __ __ __ BSS	12
--------------------------------------------------------------------
MixedColors:
4b00 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 44 11 44 11 44 11 44 : .........D.D.D.D
4b10 : __ __ __ BYT 22 88 22 88 22 88 22 88 33 cc 33 cc 33 cc 33 cc : ".".".".3.3.3.3.
4b20 : __ __ __ BYT 44 11 44 11 44 11 44 11 55 55 55 55 55 55 55 55 : D.D.D.D.UUUUUUUU
4b30 : __ __ __ BYT 66 99 66 99 66 99 66 99 77 dd 77 dd 77 dd 77 dd : f.f.f.f.w.w.w.w.
4b40 : __ __ __ BYT 88 22 88 22 88 22 88 22 99 66 99 66 99 66 99 66 : .".".".".f.f.f.f
4b50 : __ __ __ BYT aa aa aa aa aa aa aa aa bb ee bb ee bb ee bb ee : ................
4b60 : __ __ __ BYT cc 33 cc 33 cc 33 cc 33 dd 77 dd 77 dd 77 dd 77 : .3.3.3.3.w.w.w.w
4b70 : __ __ __ BYT ee bb ee bb ee bb ee bb ff ff ff ff ff ff ff ff : ................
--------------------------------------------------------------------
tbuffer:
4b80 : __ __ __ BSS	320
--------------------------------------------------------------------
pmat:
4cc0 : __ __ __ BSS	64
--------------------------------------------------------------------
BLIT_CODE:
4d00 : __ __ __ BSS	224
--------------------------------------------------------------------
v:
4de0 : __ __ __ BSS	11532
--------------------------------------------------------------------
rmat:
7b00 : __ __ __ BSS	64
--------------------------------------------------------------------
tmat:
7b40 : __ __ __ BSS	64
--------------------------------------------------------------------
p:
7b80 : __ __ __ BSS	3844
--------------------------------------------------------------------
z:
8a84 : __ __ __ BSS	3844
--------------------------------------------------------------------
surfs:
9988 : __ __ __ BSS	5400
