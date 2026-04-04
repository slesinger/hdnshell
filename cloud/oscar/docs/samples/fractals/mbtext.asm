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
080e : 8e c3 0c STX $0cc3 ; (spentry + 0)
0811 : a2 0c __ LDX #$0c
0813 : a0 c4 __ LDY #$c4
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0c __ CPX #$0c
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 c4 __ CPY #$c4
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 ec __ LDA #$ec
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;   6, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbtext.c"
.s1:
0880 : a2 0e __ LDX #$0e
0882 : b5 53 __ LDA T4 + 0,x 
0884 : 9d ee 9f STA $9fee,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : a9 a0 __ LDA #$a0
088c : a2 00 __ LDX #$00
.l6:
088e : 9d 00 04 STA $0400,x 
0891 : 9d 00 05 STA $0500,x 
0894 : 9d 00 06 STA $0600,x 
0897 : 9d 00 07 STA $0700,x 
089a : e8 __ __ INX
089b : d0 f1 __ BNE $088e ; (main.l6 + 0)
.s5:
089d : 86 5f __ STX T7 + 0 
089f : 8a __ __ TXA
.l7:
08a0 : 85 1b __ STA ACCU + 0 
08a2 : a9 00 __ LDA #$00
08a4 : 85 1c __ STA ACCU + 1 
08a6 : 20 7c 0c JSR $0c7c ; (sint16_to_float + 0)
08a9 : a9 0a __ LDA #$0a
08ab : 85 03 __ STA WORK + 0 
08ad : a9 3d __ LDA #$3d
08af : 85 06 __ STA WORK + 3 
08b1 : a9 d7 __ LDA #$d7
08b3 : 85 04 __ STA WORK + 1 
08b5 : a9 a3 __ LDA #$a3
08b7 : 85 05 __ STA WORK + 2 
08b9 : 20 96 0a JSR $0a96 ; (freg + 20)
08bc : 20 b4 0b JSR $0bb4 ; (crt_fmul + 0)
08bf : a9 00 __ LDA #$00
08c1 : 85 60 __ STA T8 + 0 
08c3 : 85 03 __ STA WORK + 0 
08c5 : 85 04 __ STA WORK + 1 
08c7 : a9 80 __ LDA #$80
08c9 : 85 05 __ STA WORK + 2 
08cb : a9 bf __ LDA #$bf
08cd : 85 06 __ STA WORK + 3 
08cf : 20 96 0a JSR $0a96 ; (freg + 20)
08d2 : 20 cd 0a JSR $0acd ; (faddsub + 6)
08d5 : a5 1b __ LDA ACCU + 0 
08d7 : 85 43 __ STA T0 + 0 
08d9 : a5 1c __ LDA ACCU + 1 
08db : 85 44 __ STA T0 + 1 
08dd : a5 1d __ LDA ACCU + 2 
08df : 85 45 __ STA T0 + 2 
08e1 : a5 1e __ LDA ACCU + 3 
08e3 : 85 46 __ STA T0 + 3 
.l8:
08e5 : a5 60 __ LDA T8 + 0 
08e7 : 85 1b __ STA ACCU + 0 
08e9 : a9 00 __ LDA #$00
08eb : 85 1c __ STA ACCU + 1 
08ed : 20 7c 0c JSR $0c7c ; (sint16_to_float + 0)
08f0 : a9 33 __ LDA #$33
08f2 : 85 03 __ STA WORK + 0 
08f4 : 85 04 __ STA WORK + 1 
08f6 : a9 b3 __ LDA #$b3
08f8 : 85 05 __ STA WORK + 2 
08fa : a9 3d __ LDA #$3d
08fc : 85 06 __ STA WORK + 3 
08fe : 20 96 0a JSR $0a96 ; (freg + 20)
0901 : 20 b4 0b JSR $0bb4 ; (crt_fmul + 0)
0904 : a9 00 __ LDA #$00
0906 : 85 03 __ STA WORK + 0 
0908 : 85 04 __ STA WORK + 1 
090a : a9 20 __ LDA #$20
090c : 85 05 __ STA WORK + 2 
090e : a9 c0 __ LDA #$c0
0910 : 85 06 __ STA WORK + 3 
0912 : 20 96 0a JSR $0a96 ; (freg + 20)
0915 : 20 cd 0a JSR $0acd ; (faddsub + 6)
0918 : a5 1b __ LDA ACCU + 0 
091a : 85 47 __ STA T1 + 0 
091c : a5 1c __ LDA ACCU + 1 
091e : 85 48 __ STA T1 + 1 
0920 : a5 1d __ LDA ACCU + 2 
0922 : 85 49 __ STA T1 + 2 
0924 : a5 1e __ LDA ACCU + 3 
0926 : 85 4a __ STA T1 + 3 
0928 : a9 00 __ LDA #$00
092a : 85 4b __ STA T2 + 0 
092c : 85 4c __ STA T2 + 1 
092e : 85 4d __ STA T2 + 2 
0930 : 85 4e __ STA T2 + 3 
0932 : 85 4f __ STA T3 + 0 
0934 : 85 50 __ STA T3 + 1 
0936 : 85 51 __ STA T3 + 2 
0938 : 85 52 __ STA T3 + 3 
093a : 85 61 __ STA T9 + 0 
.l9:
093c : a5 4b __ LDA T2 + 0 
093e : 85 1b __ STA ACCU + 0 
0940 : a5 4c __ LDA T2 + 1 
0942 : 85 1c __ STA ACCU + 1 
0944 : a5 4d __ LDA T2 + 2 
0946 : 85 1d __ STA ACCU + 2 
0948 : a5 4e __ LDA T2 + 3 
094a : 85 1e __ STA ACCU + 3 
094c : a2 4b __ LDX #$4b
094e : 20 86 0a JSR $0a86 ; (freg + 4)
0951 : 20 b4 0b JSR $0bb4 ; (crt_fmul + 0)
0954 : a5 1b __ LDA ACCU + 0 
0956 : 85 53 __ STA T4 + 0 
0958 : a5 1c __ LDA ACCU + 1 
095a : 85 54 __ STA T4 + 1 
095c : a5 1d __ LDA ACCU + 2 
095e : 85 55 __ STA T4 + 2 
0960 : a5 1e __ LDA ACCU + 3 
0962 : 85 56 __ STA T4 + 3 
0964 : a5 4f __ LDA T3 + 0 
0966 : 85 1b __ STA ACCU + 0 
0968 : a5 50 __ LDA T3 + 1 
096a : 85 1c __ STA ACCU + 1 
096c : a5 51 __ LDA T3 + 2 
096e : 85 1d __ STA ACCU + 2 
0970 : a5 52 __ LDA T3 + 3 
0972 : 85 1e __ STA ACCU + 3 
0974 : a2 4f __ LDX #$4f
0976 : 20 86 0a JSR $0a86 ; (freg + 4)
0979 : 20 b4 0b JSR $0bb4 ; (crt_fmul + 0)
097c : a5 1b __ LDA ACCU + 0 
097e : 85 57 __ STA T5 + 0 
0980 : a5 1c __ LDA ACCU + 1 
0982 : 85 58 __ STA T5 + 1 
0984 : a5 1d __ LDA ACCU + 2 
0986 : 85 59 __ STA T5 + 2 
0988 : a5 1e __ LDA ACCU + 3 
098a : 85 5a __ STA T5 + 3 
098c : a2 53 __ LDX #$53
098e : 20 86 0a JSR $0a86 ; (freg + 4)
0991 : 20 cd 0a JSR $0acd ; (faddsub + 6)
0994 : a5 1e __ LDA ACCU + 3 
0996 : 30 54 __ BMI $09ec ; (main.s10 + 0)
.s14:
0998 : c9 40 __ CMP #$40
099a : d0 0e __ BNE $09aa ; (main.s18 + 0)
.s15:
099c : a5 1d __ LDA ACCU + 2 
099e : c9 80 __ CMP #$80
09a0 : d0 08 __ BNE $09aa ; (main.s18 + 0)
.s16:
09a2 : a5 1c __ LDA ACCU + 1 
09a4 : d0 04 __ BNE $09aa ; (main.s18 + 0)
.s17:
09a6 : a5 1b __ LDA ACCU + 0 
09a8 : f0 42 __ BEQ $09ec ; (main.s10 + 0)
.s18:
09aa : 90 40 __ BCC $09ec ; (main.s10 + 0)
.s11:
09ac : a5 5f __ LDA T7 + 0 
09ae : 0a __ __ ASL
09af : 0a __ __ ASL
09b0 : 65 5f __ ADC T7 + 0 
09b2 : 0a __ __ ASL
09b3 : 0a __ __ ASL
09b4 : 85 47 __ STA T1 + 0 
09b6 : a9 36 __ LDA #$36
09b8 : 2a __ __ ROL
09b9 : 06 47 __ ASL T1 + 0 
09bb : 2a __ __ ROL
09bc : 85 48 __ STA T1 + 1 
09be : a5 61 __ LDA T9 + 0 
09c0 : 69 ff __ ADC #$ff
09c2 : a4 60 __ LDY T8 + 0 
09c4 : 91 47 __ STA (T1 + 0),y 
09c6 : c8 __ __ INY
09c7 : 84 60 __ STY T8 + 0 
09c9 : c0 28 __ CPY #$28
09cb : b0 03 __ BCS $09d0 ; (main.s12 + 0)
09cd : 4c e5 08 JMP $08e5 ; (main.l8 + 0)
.s12:
09d0 : e6 5f __ INC T7 + 0 
09d2 : a5 5f __ LDA T7 + 0 
09d4 : c9 19 __ CMP #$19
09d6 : b0 03 __ BCS $09db ; (main.s13 + 0)
09d8 : 4c a0 08 JMP $08a0 ; (main.l7 + 0)
.s13:
09db : a9 00 __ LDA #$00
09dd : 85 1b __ STA ACCU + 0 
09df : 85 1c __ STA ACCU + 1 
.s3:
09e1 : a2 0e __ LDX #$0e
09e3 : bd ee 9f LDA $9fee,x ; (main@stack + 0)
09e6 : 95 53 __ STA T4 + 0,x 
09e8 : ca __ __ DEX
09e9 : 10 f8 __ BPL $09e3 ; (main.s3 + 2)
09eb : 60 __ __ RTS
.s10:
09ec : a5 4b __ LDA T2 + 0 
09ee : 85 1b __ STA ACCU + 0 
09f0 : a5 4c __ LDA T2 + 1 
09f2 : 85 1c __ STA ACCU + 1 
09f4 : a5 4d __ LDA T2 + 2 
09f6 : 85 1d __ STA ACCU + 2 
09f8 : a5 4e __ LDA T2 + 3 
09fa : 85 1e __ STA ACCU + 3 
09fc : a2 4b __ LDX #$4b
09fe : 20 86 0a JSR $0a86 ; (freg + 4)
0a01 : 20 cd 0a JSR $0acd ; (faddsub + 6)
0a04 : a5 1b __ LDA ACCU + 0 
0a06 : 85 5b __ STA T6 + 0 
0a08 : a5 1c __ LDA ACCU + 1 
0a0a : 85 5c __ STA T6 + 1 
0a0c : a5 1d __ LDA ACCU + 2 
0a0e : 85 5d __ STA T6 + 2 
0a10 : a5 1e __ LDA ACCU + 3 
0a12 : 85 5e __ STA T6 + 3 
0a14 : a5 53 __ LDA T4 + 0 
0a16 : 85 1b __ STA ACCU + 0 
0a18 : a5 54 __ LDA T4 + 1 
0a1a : 85 1c __ STA ACCU + 1 
0a1c : a5 55 __ LDA T4 + 2 
0a1e : 85 1d __ STA ACCU + 2 
0a20 : a5 56 __ LDA T4 + 3 
0a22 : 85 1e __ STA ACCU + 3 
0a24 : a2 57 __ LDX #$57
0a26 : 20 86 0a JSR $0a86 ; (freg + 4)
0a29 : 20 c7 0a JSR $0ac7 ; (faddsub + 0)
0a2c : a2 47 __ LDX #$47
0a2e : 20 86 0a JSR $0a86 ; (freg + 4)
0a31 : 20 cd 0a JSR $0acd ; (faddsub + 6)
0a34 : a5 1b __ LDA ACCU + 0 
0a36 : 85 4b __ STA T2 + 0 
0a38 : a5 1c __ LDA ACCU + 1 
0a3a : 85 4c __ STA T2 + 1 
0a3c : a5 1d __ LDA ACCU + 2 
0a3e : 85 4d __ STA T2 + 2 
0a40 : a5 1e __ LDA ACCU + 3 
0a42 : 85 4e __ STA T2 + 3 
0a44 : a5 4f __ LDA T3 + 0 
0a46 : 85 1b __ STA ACCU + 0 
0a48 : a5 50 __ LDA T3 + 1 
0a4a : 85 1c __ STA ACCU + 1 
0a4c : a5 51 __ LDA T3 + 2 
0a4e : 85 1d __ STA ACCU + 2 
0a50 : a5 52 __ LDA T3 + 3 
0a52 : 85 1e __ STA ACCU + 3 
0a54 : a2 5b __ LDX #$5b
0a56 : 20 86 0a JSR $0a86 ; (freg + 4)
0a59 : 20 b4 0b JSR $0bb4 ; (crt_fmul + 0)
0a5c : a2 43 __ LDX #$43
0a5e : 20 86 0a JSR $0a86 ; (freg + 4)
0a61 : 20 cd 0a JSR $0acd ; (faddsub + 6)
0a64 : a5 1b __ LDA ACCU + 0 
0a66 : 85 4f __ STA T3 + 0 
0a68 : a5 1c __ LDA ACCU + 1 
0a6a : 85 50 __ STA T3 + 1 
0a6c : a5 1d __ LDA ACCU + 2 
0a6e : 85 51 __ STA T3 + 2 
0a70 : a5 1e __ LDA ACCU + 3 
0a72 : 85 52 __ STA T3 + 3 
0a74 : e6 61 __ INC T9 + 0 
0a76 : a5 61 __ LDA T9 + 0 
0a78 : c9 0f __ CMP #$0f
0a7a : 90 03 __ BCC $0a7f ; (main.s10 + 147)
0a7c : 4c ac 09 JMP $09ac ; (main.s11 + 0)
0a7f : 4c 3c 09 JMP $093c ; (main.l9 + 0)
--------------------------------------------------------------------
freg: ; freg
0a82 : b1 19 __ LDA (IP + 0),y 
0a84 : c8 __ __ INY
0a85 : aa __ __ TAX
0a86 : b5 00 __ LDA $00,x 
0a88 : 85 03 __ STA WORK + 0 
0a8a : b5 01 __ LDA $01,x 
0a8c : 85 04 __ STA WORK + 1 
0a8e : b5 02 __ LDA $02,x 
0a90 : 85 05 __ STA WORK + 2 
0a92 : b5 03 __ LDA WORK + 0,x 
0a94 : 85 06 __ STA WORK + 3 
0a96 : a5 05 __ LDA WORK + 2 
0a98 : 0a __ __ ASL
0a99 : a5 06 __ LDA WORK + 3 
0a9b : 2a __ __ ROL
0a9c : 85 08 __ STA WORK + 5 
0a9e : f0 06 __ BEQ $0aa6 ; (freg + 36)
0aa0 : a5 05 __ LDA WORK + 2 
0aa2 : 09 80 __ ORA #$80
0aa4 : 85 05 __ STA WORK + 2 
0aa6 : a5 1d __ LDA ACCU + 2 
0aa8 : 0a __ __ ASL
0aa9 : a5 1e __ LDA ACCU + 3 
0aab : 2a __ __ ROL
0aac : 85 07 __ STA WORK + 4 
0aae : f0 06 __ BEQ $0ab6 ; (freg + 52)
0ab0 : a5 1d __ LDA ACCU + 2 
0ab2 : 09 80 __ ORA #$80
0ab4 : 85 1d __ STA ACCU + 2 
0ab6 : 60 __ __ RTS
0ab7 : 06 1e __ ASL ACCU + 3 
0ab9 : a5 07 __ LDA WORK + 4 
0abb : 6a __ __ ROR
0abc : 85 1e __ STA ACCU + 3 
0abe : b0 06 __ BCS $0ac6 ; (freg + 68)
0ac0 : a5 1d __ LDA ACCU + 2 
0ac2 : 29 7f __ AND #$7f
0ac4 : 85 1d __ STA ACCU + 2 
0ac6 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
0ac7 : a5 06 __ LDA WORK + 3 
0ac9 : 49 80 __ EOR #$80
0acb : 85 06 __ STA WORK + 3 
0acd : a9 ff __ LDA #$ff
0acf : c5 07 __ CMP WORK + 4 
0ad1 : f0 04 __ BEQ $0ad7 ; (faddsub + 16)
0ad3 : c5 08 __ CMP WORK + 5 
0ad5 : d0 11 __ BNE $0ae8 ; (faddsub + 33)
0ad7 : a5 1e __ LDA ACCU + 3 
0ad9 : 09 7f __ ORA #$7f
0adb : 85 1e __ STA ACCU + 3 
0add : a9 80 __ LDA #$80
0adf : 85 1d __ STA ACCU + 2 
0ae1 : a9 00 __ LDA #$00
0ae3 : 85 1b __ STA ACCU + 0 
0ae5 : 85 1c __ STA ACCU + 1 
0ae7 : 60 __ __ RTS
0ae8 : 38 __ __ SEC
0ae9 : a5 07 __ LDA WORK + 4 
0aeb : e5 08 __ SBC WORK + 5 
0aed : f0 38 __ BEQ $0b27 ; (faddsub + 96)
0aef : aa __ __ TAX
0af0 : b0 25 __ BCS $0b17 ; (faddsub + 80)
0af2 : e0 e9 __ CPX #$e9
0af4 : b0 0e __ BCS $0b04 ; (faddsub + 61)
0af6 : a5 08 __ LDA WORK + 5 
0af8 : 85 07 __ STA WORK + 4 
0afa : a9 00 __ LDA #$00
0afc : 85 1b __ STA ACCU + 0 
0afe : 85 1c __ STA ACCU + 1 
0b00 : 85 1d __ STA ACCU + 2 
0b02 : f0 23 __ BEQ $0b27 ; (faddsub + 96)
0b04 : a5 1d __ LDA ACCU + 2 
0b06 : 4a __ __ LSR
0b07 : 66 1c __ ROR ACCU + 1 
0b09 : 66 1b __ ROR ACCU + 0 
0b0b : e8 __ __ INX
0b0c : d0 f8 __ BNE $0b06 ; (faddsub + 63)
0b0e : 85 1d __ STA ACCU + 2 
0b10 : a5 08 __ LDA WORK + 5 
0b12 : 85 07 __ STA WORK + 4 
0b14 : 4c 27 0b JMP $0b27 ; (faddsub + 96)
0b17 : e0 18 __ CPX #$18
0b19 : b0 33 __ BCS $0b4e ; (faddsub + 135)
0b1b : a5 05 __ LDA WORK + 2 
0b1d : 4a __ __ LSR
0b1e : 66 04 __ ROR WORK + 1 
0b20 : 66 03 __ ROR WORK + 0 
0b22 : ca __ __ DEX
0b23 : d0 f8 __ BNE $0b1d ; (faddsub + 86)
0b25 : 85 05 __ STA WORK + 2 
0b27 : a5 1e __ LDA ACCU + 3 
0b29 : 29 80 __ AND #$80
0b2b : 85 1e __ STA ACCU + 3 
0b2d : 45 06 __ EOR WORK + 3 
0b2f : 30 31 __ BMI $0b62 ; (faddsub + 155)
0b31 : 18 __ __ CLC
0b32 : a5 1b __ LDA ACCU + 0 
0b34 : 65 03 __ ADC WORK + 0 
0b36 : 85 1b __ STA ACCU + 0 
0b38 : a5 1c __ LDA ACCU + 1 
0b3a : 65 04 __ ADC WORK + 1 
0b3c : 85 1c __ STA ACCU + 1 
0b3e : a5 1d __ LDA ACCU + 2 
0b40 : 65 05 __ ADC WORK + 2 
0b42 : 85 1d __ STA ACCU + 2 
0b44 : 90 08 __ BCC $0b4e ; (faddsub + 135)
0b46 : 66 1d __ ROR ACCU + 2 
0b48 : 66 1c __ ROR ACCU + 1 
0b4a : 66 1b __ ROR ACCU + 0 
0b4c : e6 07 __ INC WORK + 4 
0b4e : a5 07 __ LDA WORK + 4 
0b50 : c9 ff __ CMP #$ff
0b52 : f0 83 __ BEQ $0ad7 ; (faddsub + 16)
0b54 : 4a __ __ LSR
0b55 : 05 1e __ ORA ACCU + 3 
0b57 : 85 1e __ STA ACCU + 3 
0b59 : b0 06 __ BCS $0b61 ; (faddsub + 154)
0b5b : a5 1d __ LDA ACCU + 2 
0b5d : 29 7f __ AND #$7f
0b5f : 85 1d __ STA ACCU + 2 
0b61 : 60 __ __ RTS
0b62 : 38 __ __ SEC
0b63 : a5 1b __ LDA ACCU + 0 
0b65 : e5 03 __ SBC WORK + 0 
0b67 : 85 1b __ STA ACCU + 0 
0b69 : a5 1c __ LDA ACCU + 1 
0b6b : e5 04 __ SBC WORK + 1 
0b6d : 85 1c __ STA ACCU + 1 
0b6f : a5 1d __ LDA ACCU + 2 
0b71 : e5 05 __ SBC WORK + 2 
0b73 : 85 1d __ STA ACCU + 2 
0b75 : b0 19 __ BCS $0b90 ; (faddsub + 201)
0b77 : 38 __ __ SEC
0b78 : a9 00 __ LDA #$00
0b7a : e5 1b __ SBC ACCU + 0 
0b7c : 85 1b __ STA ACCU + 0 
0b7e : a9 00 __ LDA #$00
0b80 : e5 1c __ SBC ACCU + 1 
0b82 : 85 1c __ STA ACCU + 1 
0b84 : a9 00 __ LDA #$00
0b86 : e5 1d __ SBC ACCU + 2 
0b88 : 85 1d __ STA ACCU + 2 
0b8a : a5 1e __ LDA ACCU + 3 
0b8c : 49 80 __ EOR #$80
0b8e : 85 1e __ STA ACCU + 3 
0b90 : a5 1d __ LDA ACCU + 2 
0b92 : 30 ba __ BMI $0b4e ; (faddsub + 135)
0b94 : 05 1c __ ORA ACCU + 1 
0b96 : 05 1b __ ORA ACCU + 0 
0b98 : f0 0f __ BEQ $0ba9 ; (faddsub + 226)
0b9a : c6 07 __ DEC WORK + 4 
0b9c : f0 0b __ BEQ $0ba9 ; (faddsub + 226)
0b9e : 06 1b __ ASL ACCU + 0 
0ba0 : 26 1c __ ROL ACCU + 1 
0ba2 : 26 1d __ ROL ACCU + 2 
0ba4 : 10 f4 __ BPL $0b9a ; (faddsub + 211)
0ba6 : 4c 4e 0b JMP $0b4e ; (faddsub + 135)
0ba9 : a9 00 __ LDA #$00
0bab : 85 1b __ STA ACCU + 0 
0bad : 85 1c __ STA ACCU + 1 
0baf : 85 1d __ STA ACCU + 2 
0bb1 : 85 1e __ STA ACCU + 3 
0bb3 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
0bb4 : a5 1b __ LDA ACCU + 0 
0bb6 : 05 1c __ ORA ACCU + 1 
0bb8 : 05 1d __ ORA ACCU + 2 
0bba : f0 0e __ BEQ $0bca ; (crt_fmul + 22)
0bbc : a5 03 __ LDA WORK + 0 
0bbe : 05 04 __ ORA WORK + 1 
0bc0 : 05 05 __ ORA WORK + 2 
0bc2 : d0 09 __ BNE $0bcd ; (crt_fmul + 25)
0bc4 : 85 1b __ STA ACCU + 0 
0bc6 : 85 1c __ STA ACCU + 1 
0bc8 : 85 1d __ STA ACCU + 2 
0bca : 85 1e __ STA ACCU + 3 
0bcc : 60 __ __ RTS
0bcd : a5 1e __ LDA ACCU + 3 
0bcf : 45 06 __ EOR WORK + 3 
0bd1 : 29 80 __ AND #$80
0bd3 : 85 1e __ STA ACCU + 3 
0bd5 : a9 ff __ LDA #$ff
0bd7 : c5 07 __ CMP WORK + 4 
0bd9 : f0 42 __ BEQ $0c1d ; (crt_fmul + 105)
0bdb : c5 08 __ CMP WORK + 5 
0bdd : f0 3e __ BEQ $0c1d ; (crt_fmul + 105)
0bdf : a9 00 __ LDA #$00
0be1 : 85 09 __ STA WORK + 6 
0be3 : 85 0a __ STA WORK + 7 
0be5 : 85 0b __ STA WORK + 8 
0be7 : a4 1b __ LDY ACCU + 0 
0be9 : a5 03 __ LDA WORK + 0 
0beb : d0 06 __ BNE $0bf3 ; (crt_fmul + 63)
0bed : a5 04 __ LDA WORK + 1 
0bef : f0 0a __ BEQ $0bfb ; (crt_fmul + 71)
0bf1 : d0 05 __ BNE $0bf8 ; (crt_fmul + 68)
0bf3 : 20 4e 0c JSR $0c4e ; (crt_fmul8 + 0)
0bf6 : a5 04 __ LDA WORK + 1 
0bf8 : 20 4e 0c JSR $0c4e ; (crt_fmul8 + 0)
0bfb : a5 05 __ LDA WORK + 2 
0bfd : 20 4e 0c JSR $0c4e ; (crt_fmul8 + 0)
0c00 : 38 __ __ SEC
0c01 : a5 0b __ LDA WORK + 8 
0c03 : 30 06 __ BMI $0c0b ; (crt_fmul + 87)
0c05 : 06 09 __ ASL WORK + 6 
0c07 : 26 0a __ ROL WORK + 7 
0c09 : 2a __ __ ROL
0c0a : 18 __ __ CLC
0c0b : 29 7f __ AND #$7f
0c0d : 85 0b __ STA WORK + 8 
0c0f : a5 07 __ LDA WORK + 4 
0c11 : 65 08 __ ADC WORK + 5 
0c13 : 90 19 __ BCC $0c2e ; (crt_fmul + 122)
0c15 : e9 7f __ SBC #$7f
0c17 : b0 04 __ BCS $0c1d ; (crt_fmul + 105)
0c19 : c9 ff __ CMP #$ff
0c1b : d0 15 __ BNE $0c32 ; (crt_fmul + 126)
0c1d : a5 1e __ LDA ACCU + 3 
0c1f : 09 7f __ ORA #$7f
0c21 : 85 1e __ STA ACCU + 3 
0c23 : a9 80 __ LDA #$80
0c25 : 85 1d __ STA ACCU + 2 
0c27 : a9 00 __ LDA #$00
0c29 : 85 1b __ STA ACCU + 0 
0c2b : 85 1c __ STA ACCU + 1 
0c2d : 60 __ __ RTS
0c2e : e9 7e __ SBC #$7e
0c30 : 90 15 __ BCC $0c47 ; (crt_fmul + 147)
0c32 : 4a __ __ LSR
0c33 : 05 1e __ ORA ACCU + 3 
0c35 : 85 1e __ STA ACCU + 3 
0c37 : a9 00 __ LDA #$00
0c39 : 6a __ __ ROR
0c3a : 05 0b __ ORA WORK + 8 
0c3c : 85 1d __ STA ACCU + 2 
0c3e : a5 0a __ LDA WORK + 7 
0c40 : 85 1c __ STA ACCU + 1 
0c42 : a5 09 __ LDA WORK + 6 
0c44 : 85 1b __ STA ACCU + 0 
0c46 : 60 __ __ RTS
0c47 : a9 00 __ LDA #$00
0c49 : 85 1e __ STA ACCU + 3 
0c4b : f0 d8 __ BEQ $0c25 ; (crt_fmul + 113)
0c4d : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
0c4e : 38 __ __ SEC
0c4f : 6a __ __ ROR
0c50 : 90 1e __ BCC $0c70 ; (crt_fmul8 + 34)
0c52 : aa __ __ TAX
0c53 : 18 __ __ CLC
0c54 : 98 __ __ TYA
0c55 : 65 09 __ ADC WORK + 6 
0c57 : 85 09 __ STA WORK + 6 
0c59 : a5 0a __ LDA WORK + 7 
0c5b : 65 1c __ ADC ACCU + 1 
0c5d : 85 0a __ STA WORK + 7 
0c5f : a5 0b __ LDA WORK + 8 
0c61 : 65 1d __ ADC ACCU + 2 
0c63 : 6a __ __ ROR
0c64 : 85 0b __ STA WORK + 8 
0c66 : 8a __ __ TXA
0c67 : 66 0a __ ROR WORK + 7 
0c69 : 66 09 __ ROR WORK + 6 
0c6b : 4a __ __ LSR
0c6c : f0 0d __ BEQ $0c7b ; (crt_fmul8 + 45)
0c6e : b0 e2 __ BCS $0c52 ; (crt_fmul8 + 4)
0c70 : 66 0b __ ROR WORK + 8 
0c72 : 66 0a __ ROR WORK + 7 
0c74 : 66 09 __ ROR WORK + 6 
0c76 : 4a __ __ LSR
0c77 : 90 f7 __ BCC $0c70 ; (crt_fmul8 + 34)
0c79 : d0 d7 __ BNE $0c52 ; (crt_fmul8 + 4)
0c7b : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
0c7c : 24 1c __ BIT ACCU + 1 
0c7e : 30 03 __ BMI $0c83 ; (sint16_to_float + 7)
0c80 : 4c 9a 0c JMP $0c9a ; (uint16_to_float + 0)
0c83 : 38 __ __ SEC
0c84 : a9 00 __ LDA #$00
0c86 : e5 1b __ SBC ACCU + 0 
0c88 : 85 1b __ STA ACCU + 0 
0c8a : a9 00 __ LDA #$00
0c8c : e5 1c __ SBC ACCU + 1 
0c8e : 85 1c __ STA ACCU + 1 
0c90 : 20 9a 0c JSR $0c9a ; (uint16_to_float + 0)
0c93 : a5 1e __ LDA ACCU + 3 
0c95 : 09 80 __ ORA #$80
0c97 : 85 1e __ STA ACCU + 3 
0c99 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
0c9a : a5 1b __ LDA ACCU + 0 
0c9c : 05 1c __ ORA ACCU + 1 
0c9e : d0 05 __ BNE $0ca5 ; (uint16_to_float + 11)
0ca0 : 85 1d __ STA ACCU + 2 
0ca2 : 85 1e __ STA ACCU + 3 
0ca4 : 60 __ __ RTS
0ca5 : a2 8e __ LDX #$8e
0ca7 : a5 1c __ LDA ACCU + 1 
0ca9 : 30 06 __ BMI $0cb1 ; (uint16_to_float + 23)
0cab : ca __ __ DEX
0cac : 06 1b __ ASL ACCU + 0 
0cae : 2a __ __ ROL
0caf : 10 fa __ BPL $0cab ; (uint16_to_float + 17)
0cb1 : 0a __ __ ASL
0cb2 : 85 1d __ STA ACCU + 2 
0cb4 : a5 1b __ LDA ACCU + 0 
0cb6 : 85 1c __ STA ACCU + 1 
0cb8 : 8a __ __ TXA
0cb9 : 4a __ __ LSR
0cba : 85 1e __ STA ACCU + 3 
0cbc : a9 00 __ LDA #$00
0cbe : 85 1b __ STA ACCU + 0 
0cc0 : 66 1d __ ROR ACCU + 2 
0cc2 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0cc3 : __ __ __ BYT 00                                              : .
