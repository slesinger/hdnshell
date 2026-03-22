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
080e : 8e 27 31 STX $3127 ; (spentry + 0)
0811 : a2 31 __ LDX #$31
0813 : a0 d1 __ LDY #$d1
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 32 __ CPX #$32
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 e0 __ CPY #$e0
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 3a __ LDA #$3a
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
;  42, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/polygon.c"
.s1:
0880 : a2 15 __ LDX #$15
0882 : b5 53 __ LDA T1 + 0,x 
0884 : 9d 3c 9f STA $9f3c,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 76 0e JSR $0e76 ; (init.s4 + 0)
088d : a9 00 __ LDA #$00
088f : 8d e9 9f STA $9fe9 ; (sstack + 0)
0892 : 8d ea 9f STA $9fea ; (sstack + 1)
0895 : 8d eb 9f STA $9feb ; (sstack + 2)
0898 : 8d ec 9f STA $9fec ; (sstack + 3)
089b : 8d ef 9f STA $9fef ; (sstack + 6)
089e : 8d f0 9f STA $9ff0 ; (sstack + 7)
08a1 : 8d f1 9f STA $9ff1 ; (sstack + 8)
08a4 : 8d f2 9f STA $9ff2 ; (sstack + 9)
08a7 : 8d f6 9f STA $9ff6 ; (sstack + 13)
08aa : a9 20 __ LDA #$20
08ac : 85 18 __ STA P11 
08ae : a9 d1 __ LDA #$d1
08b0 : 85 16 __ STA P9 
08b2 : 8d ed 9f STA $9fed ; (sstack + 4)
08b5 : a9 40 __ LDA #$40
08b7 : 8d f3 9f STA $9ff3 ; (sstack + 10)
08ba : a9 01 __ LDA #$01
08bc : 8d f4 9f STA $9ff4 ; (sstack + 11)
08bf : a9 c8 __ LDA #$c8
08c1 : 8d f5 9f STA $9ff5 ; (sstack + 12)
08c4 : a9 31 __ LDA #$31
08c6 : 85 17 __ STA P10 
08c8 : 8d ee 9f STA $9fee ; (sstack + 5)
08cb : a9 64 __ LDA #$64
08cd : 8d f7 9f STA $9ff7 ; (sstack + 14)
08d0 : a9 31 __ LDA #$31
08d2 : 8d f8 9f STA $9ff8 ; (sstack + 15)
08d5 : 20 e8 0f JSR $0fe8 ; (bmu_bitblit.s1 + 0)
08d8 : a9 08 __ LDA #$08
08da : 8d e9 9f STA $9fe9 ; (sstack + 0)
08dd : 8d eb 9f STA $9feb ; (sstack + 2)
08e0 : 8d ef 9f STA $9fef ; (sstack + 6)
08e3 : 8d f1 9f STA $9ff1 ; (sstack + 8)
08e6 : a9 00 __ LDA #$00
08e8 : 8d ea 9f STA $9fea ; (sstack + 1)
08eb : 8d ec 9f STA $9fec ; (sstack + 3)
08ee : a9 d1 __ LDA #$d1
08f0 : 8d ed 9f STA $9fed ; (sstack + 4)
08f3 : a9 31 __ LDA #$31
08f5 : 8d ee 9f STA $9fee ; (sstack + 5)
08f8 : a9 00 __ LDA #$00
08fa : 8d f0 9f STA $9ff0 ; (sstack + 7)
08fd : 8d f2 9f STA $9ff2 ; (sstack + 9)
0900 : 8d f6 9f STA $9ff6 ; (sstack + 13)
0903 : a9 30 __ LDA #$30
0905 : 8d f3 9f STA $9ff3 ; (sstack + 10)
0908 : a9 01 __ LDA #$01
090a : 8d f4 9f STA $9ff4 ; (sstack + 11)
090d : a9 b8 __ LDA #$b8
090f : 8d f5 9f STA $9ff5 ; (sstack + 12)
0912 : a9 8c __ LDA #$8c
0914 : 8d f7 9f STA $9ff7 ; (sstack + 14)
0917 : a9 31 __ LDA #$31
0919 : 8d f8 9f STA $9ff8 ; (sstack + 15)
091c : 20 e8 0f JSR $0fe8 ; (bmu_bitblit.s1 + 0)
091f : a9 0a __ LDA #$0a
0921 : 8d e9 9f STA $9fe9 ; (sstack + 0)
0924 : 8d eb 9f STA $9feb ; (sstack + 2)
0927 : 8d ef 9f STA $9fef ; (sstack + 6)
092a : 8d f1 9f STA $9ff1 ; (sstack + 8)
092d : a9 00 __ LDA #$00
092f : 8d ea 9f STA $9fea ; (sstack + 1)
0932 : 8d ec 9f STA $9fec ; (sstack + 3)
0935 : a9 d1 __ LDA #$d1
0937 : 8d ed 9f STA $9fed ; (sstack + 4)
093a : a9 31 __ LDA #$31
093c : 8d ee 9f STA $9fee ; (sstack + 5)
093f : a9 00 __ LDA #$00
0941 : 8d f0 9f STA $9ff0 ; (sstack + 7)
0944 : 8d f2 9f STA $9ff2 ; (sstack + 9)
0947 : 8d f6 9f STA $9ff6 ; (sstack + 13)
094a : a9 2c __ LDA #$2c
094c : 8d f3 9f STA $9ff3 ; (sstack + 10)
094f : a9 01 __ LDA #$01
0951 : 8d f4 9f STA $9ff4 ; (sstack + 11)
0954 : a9 b4 __ LDA #$b4
0956 : 8d f5 9f STA $9ff5 ; (sstack + 12)
0959 : a9 3c __ LDA #$3c
095b : 8d f7 9f STA $9ff7 ; (sstack + 14)
095e : a9 31 __ LDA #$31
0960 : 8d f8 9f STA $9ff8 ; (sstack + 15)
0963 : 20 e8 0f JSR $0fe8 ; (bmu_bitblit.s1 + 0)
0966 : a2 07 __ LDX #$07
.l5:
0968 : bd cd 18 LDA $18cd,x 
096b : 9d cc 9f STA $9fcc,x ; (cr.left + 0)
096e : ca __ __ DEX
096f : 10 f7 __ BPL $0968 ; (main.l5 + 0)
.s6:
0971 : a9 00 __ LDA #$00
0973 : 85 5f __ STA T4 + 0 
0975 : 85 63 __ STA T5 + 0 
.l7:
0977 : 85 1b __ STA ACCU + 0 
0979 : a9 00 __ LDA #$00
097b : 85 1c __ STA ACCU + 1 
097d : 20 4f 2f JSR $2f4f ; (sint16_to_float + 0)
0980 : a9 db __ LDA #$db
0982 : 85 03 __ STA WORK + 0 
0984 : a9 40 __ LDA #$40
0986 : 85 06 __ STA WORK + 3 
0988 : a9 0f __ LDA #$0f
098a : 85 04 __ STA WORK + 1 
098c : a9 49 __ LDA #$49
098e : 85 05 __ STA WORK + 2 
0990 : 20 f0 2a JSR $2af0 ; (freg + 20)
0993 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0996 : a9 00 __ LDA #$00
0998 : 85 03 __ STA WORK + 0 
099a : 85 04 __ STA WORK + 1 
099c : a9 a0 __ LDA #$a0
099e : 85 05 __ STA WORK + 2 
09a0 : a9 40 __ LDA #$40
09a2 : 85 06 __ STA WORK + 3 
09a4 : 20 f0 2a JSR $2af0 ; (freg + 20)
09a7 : 20 d6 2c JSR $2cd6 ; (crt_fdiv + 0)
09aa : a5 1b __ LDA ACCU + 0 
09ac : 85 53 __ STA T1 + 0 
09ae : a5 1c __ LDA ACCU + 1 
09b0 : 85 54 __ STA T1 + 1 
09b2 : a5 1d __ LDA ACCU + 2 
09b4 : 85 55 __ STA T1 + 2 
09b6 : a5 1e __ LDA ACCU + 3 
09b8 : 85 56 __ STA T1 + 3 
09ba : a9 db __ LDA #$db
09bc : 85 03 __ STA WORK + 0 
09be : a9 3f __ LDA #$3f
09c0 : 85 06 __ STA WORK + 3 
09c2 : a9 0f __ LDA #$0f
09c4 : 85 04 __ STA WORK + 1 
09c6 : a9 c9 __ LDA #$c9
09c8 : 85 05 __ STA WORK + 2 
09ca : 20 f0 2a JSR $2af0 ; (freg + 20)
09cd : 20 27 2b JSR $2b27 ; (faddsub + 6)
09d0 : a5 1b __ LDA ACCU + 0 
09d2 : 85 0d __ STA P0 
09d4 : a5 1c __ LDA ACCU + 1 
09d6 : 85 0e __ STA P1 
09d8 : a5 1d __ LDA ACCU + 2 
09da : 85 0f __ STA P2 
09dc : a5 1e __ LDA ACCU + 3 
09de : 85 10 __ STA P3 
09e0 : 20 d5 18 JSR $18d5 ; (sin.s4 + 0)
09e3 : a5 1b __ LDA ACCU + 0 
09e5 : 85 57 __ STA T2 + 0 
09e7 : a5 1c __ LDA ACCU + 1 
09e9 : 85 58 __ STA T2 + 1 
09eb : a5 1d __ LDA ACCU + 2 
09ed : 85 59 __ STA T2 + 2 
09ef : a5 1e __ LDA ACCU + 3 
09f1 : 85 5a __ STA T2 + 3 
09f3 : a5 53 __ LDA T1 + 0 
09f5 : 85 0d __ STA P0 
09f7 : a5 54 __ LDA T1 + 1 
09f9 : 85 0e __ STA P1 
09fb : a5 55 __ LDA T1 + 2 
09fd : 85 0f __ STA P2 
09ff : a5 56 __ LDA T1 + 3 
0a01 : 85 10 __ STA P3 
0a03 : 20 d5 18 JSR $18d5 ; (sin.s4 + 0)
0a06 : a5 1b __ LDA ACCU + 0 
0a08 : 85 43 __ STA T0 + 0 
0a0a : a5 1c __ LDA ACCU + 1 
0a0c : 85 44 __ STA T0 + 1 
0a0e : a5 1d __ LDA ACCU + 2 
0a10 : 85 45 __ STA T0 + 2 
0a12 : a5 1e __ LDA ACCU + 3 
0a14 : 85 46 __ STA T0 + 3 
0a16 : a5 5f __ LDA T4 + 0 
0a18 : 4a __ __ LSR
0a19 : 90 0e __ BCC $0a29 ; (main.s8 + 0)
.s16:
0a1b : a9 00 __ LDA #$00
0a1d : 85 53 __ STA T1 + 0 
0a1f : 85 54 __ STA T1 + 1 
0a21 : a9 80 __ LDA #$80
0a23 : 85 55 __ STA T1 + 2 
0a25 : a9 3f __ LDA #$3f
0a27 : b0 0c __ BCS $0a35 ; (main.s9 + 0)
.s8:
0a29 : a9 cc __ LDA #$cc
0a2b : 85 54 __ STA T1 + 1 
0a2d : 85 55 __ STA T1 + 2 
0a2f : a9 cd __ LDA #$cd
0a31 : 85 53 __ STA T1 + 0 
0a33 : a9 3e __ LDA #$3e
.s9:
0a35 : 85 56 __ STA T1 + 3 
0a37 : a5 57 __ LDA T2 + 0 
0a39 : 85 1b __ STA ACCU + 0 
0a3b : a5 58 __ LDA T2 + 1 
0a3d : 85 1c __ STA ACCU + 1 
0a3f : a5 59 __ LDA T2 + 2 
0a41 : 85 1d __ STA ACCU + 2 
0a43 : a5 5a __ LDA T2 + 3 
0a45 : 85 1e __ STA ACCU + 3 
0a47 : a2 53 __ LDX #$53
0a49 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0a4c : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0a4f : a5 1b __ LDA ACCU + 0 
0a51 : a6 63 __ LDX T5 + 0 
0a53 : 9d a4 9f STA $9fa4,x ; (px[0] + 0)
0a56 : a5 1c __ LDA ACCU + 1 
0a58 : 9d a5 9f STA $9fa5,x ; (px[0] + 1)
0a5b : a5 1d __ LDA ACCU + 2 
0a5d : 9d a6 9f STA $9fa6,x ; (px[0] + 2)
0a60 : a5 1e __ LDA ACCU + 3 
0a62 : 9d a7 9f STA $9fa7,x ; (px[0] + 3)
0a65 : a5 43 __ LDA T0 + 0 
0a67 : 85 1b __ STA ACCU + 0 
0a69 : a5 44 __ LDA T0 + 1 
0a6b : 85 1c __ STA ACCU + 1 
0a6d : a5 45 __ LDA T0 + 2 
0a6f : 85 1d __ STA ACCU + 2 
0a71 : a5 46 __ LDA T0 + 3 
0a73 : 85 1e __ STA ACCU + 3 
0a75 : a2 53 __ LDX #$53
0a77 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0a7a : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0a7d : a5 1b __ LDA ACCU + 0 
0a7f : a6 63 __ LDX T5 + 0 
0a81 : 9d 7c 9f STA $9f7c,x ; (py[0] + 0)
0a84 : a5 1c __ LDA ACCU + 1 
0a86 : 9d 7d 9f STA $9f7d,x ; (py[0] + 1)
0a89 : a5 1d __ LDA ACCU + 2 
0a8b : 9d 7e 9f STA $9f7e,x ; (py[0] + 2)
0a8e : a5 1e __ LDA ACCU + 3 
0a90 : 9d 7f 9f STA $9f7f,x ; (py[0] + 3)
0a93 : 8a __ __ TXA
0a94 : 18 __ __ CLC
0a95 : 69 04 __ ADC #$04
0a97 : 85 63 __ STA T5 + 0 
0a99 : e6 5f __ INC T4 + 0 
0a9b : a5 5f __ LDA T4 + 0 
0a9d : c9 0a __ CMP #$0a
0a9f : b0 03 __ BCS $0aa4 ; (main.s10 + 0)
0aa1 : 4c 77 09 JMP $0977 ; (main.l7 + 0)
.s10:
0aa4 : a9 00 __ LDA #$00
0aa6 : 85 67 __ STA T10 + 0 
0aa8 : a9 04 __ LDA #$04
0aaa : 85 68 __ STA T11 + 0 
.l11:
0aac : a5 67 __ LDA T10 + 0 
0aae : 85 1b __ STA ACCU + 0 
0ab0 : a9 00 __ LDA #$00
0ab2 : 85 1c __ STA ACCU + 1 
0ab4 : 20 4f 2f JSR $2f4f ; (sint16_to_float + 0)
0ab7 : a9 db __ LDA #$db
0ab9 : 85 03 __ STA WORK + 0 
0abb : a9 40 __ LDA #$40
0abd : 85 06 __ STA WORK + 3 
0abf : a9 0f __ LDA #$0f
0ac1 : 85 04 __ STA WORK + 1 
0ac3 : a9 49 __ LDA #$49
0ac5 : 85 05 __ STA WORK + 2 
0ac7 : 20 f0 2a JSR $2af0 ; (freg + 20)
0aca : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0acd : a9 00 __ LDA #$00
0acf : 85 03 __ STA WORK + 0 
0ad1 : 85 04 __ STA WORK + 1 
0ad3 : a9 80 __ LDA #$80
0ad5 : 85 05 __ STA WORK + 2 
0ad7 : a9 41 __ LDA #$41
0ad9 : 85 06 __ STA WORK + 3 
0adb : 20 f0 2a JSR $2af0 ; (freg + 20)
0ade : 20 d6 2c JSR $2cd6 ; (crt_fdiv + 0)
0ae1 : a5 1b __ LDA ACCU + 0 
0ae3 : 85 53 __ STA T1 + 0 
0ae5 : a5 1c __ LDA ACCU + 1 
0ae7 : 85 54 __ STA T1 + 1 
0ae9 : a5 1d __ LDA ACCU + 2 
0aeb : 85 55 __ STA T1 + 2 
0aed : a5 1e __ LDA ACCU + 3 
0aef : 85 56 __ STA T1 + 3 
0af1 : a2 1b __ LDX #$1b
0af3 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0af6 : 20 27 2b JSR $2b27 ; (faddsub + 6)
0af9 : a5 1b __ LDA ACCU + 0 
0afb : 85 5f __ STA T4 + 0 
0afd : a5 1c __ LDA ACCU + 1 
0aff : 85 60 __ STA T4 + 1 
0b01 : a5 1d __ LDA ACCU + 2 
0b03 : 85 61 __ STA T4 + 2 
0b05 : a5 1e __ LDA ACCU + 3 
0b07 : 85 62 __ STA T4 + 3 
0b09 : a9 db __ LDA #$db
0b0b : 85 1b __ STA ACCU + 0 
0b0d : a9 3f __ LDA #$3f
0b0f : 85 1e __ STA ACCU + 3 
0b11 : a9 0f __ LDA #$0f
0b13 : 85 1c __ STA ACCU + 1 
0b15 : a9 c9 __ LDA #$c9
0b17 : 85 1d __ STA ACCU + 2 
0b19 : a2 53 __ LDX #$53
0b1b : 20 e0 2a JSR $2ae0 ; (freg + 4)
0b1e : 20 27 2b JSR $2b27 ; (faddsub + 6)
0b21 : a5 1b __ LDA ACCU + 0 
0b23 : 85 0d __ STA P0 
0b25 : a5 1c __ LDA ACCU + 1 
0b27 : 85 0e __ STA P1 
0b29 : a5 1d __ LDA ACCU + 2 
0b2b : 85 0f __ STA P2 
0b2d : a5 1e __ LDA ACCU + 3 
0b2f : 85 10 __ STA P3 
0b31 : 20 d5 18 JSR $18d5 ; (sin.s4 + 0)
0b34 : a5 1b __ LDA ACCU + 0 
0b36 : 85 57 __ STA T2 + 0 
0b38 : a5 1c __ LDA ACCU + 1 
0b3a : 85 58 __ STA T2 + 1 
0b3c : a5 1d __ LDA ACCU + 2 
0b3e : 85 59 __ STA T2 + 2 
0b40 : a5 1e __ LDA ACCU + 3 
0b42 : 85 5a __ STA T2 + 3 
0b44 : a5 53 __ LDA T1 + 0 
0b46 : 85 0d __ STA P0 
0b48 : a5 54 __ LDA T1 + 1 
0b4a : 85 0e __ STA P1 
0b4c : a5 55 __ LDA T1 + 2 
0b4e : 85 0f __ STA P2 
0b50 : a5 56 __ LDA T1 + 3 
0b52 : 85 10 __ STA P3 
0b54 : 20 d5 18 JSR $18d5 ; (sin.s4 + 0)
0b57 : a5 1b __ LDA ACCU + 0 
0b59 : 85 5b __ STA T3 + 0 
0b5b : a5 1c __ LDA ACCU + 1 
0b5d : 85 5c __ STA T3 + 1 
0b5f : a5 1d __ LDA ACCU + 2 
0b61 : 85 5d __ STA T3 + 2 
0b63 : a5 1e __ LDA ACCU + 3 
0b65 : 85 5e __ STA T3 + 3 
0b67 : a9 db __ LDA #$db
0b69 : 85 1b __ STA ACCU + 0 
0b6b : a9 3f __ LDA #$3f
0b6d : 85 1e __ STA ACCU + 3 
0b6f : a9 0f __ LDA #$0f
0b71 : 85 1c __ STA ACCU + 1 
0b73 : a9 c9 __ LDA #$c9
0b75 : 85 1d __ STA ACCU + 2 
0b77 : a2 5f __ LDX #$5f
0b79 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0b7c : 20 27 2b JSR $2b27 ; (faddsub + 6)
0b7f : a5 1b __ LDA ACCU + 0 
0b81 : 85 0d __ STA P0 
0b83 : a5 1c __ LDA ACCU + 1 
0b85 : 85 0e __ STA P1 
0b87 : a5 1d __ LDA ACCU + 2 
0b89 : 85 0f __ STA P2 
0b8b : a5 1e __ LDA ACCU + 3 
0b8d : 85 10 __ STA P3 
0b8f : 20 d5 18 JSR $18d5 ; (sin.s4 + 0)
0b92 : a5 1b __ LDA ACCU + 0 
0b94 : 85 63 __ STA T5 + 0 
0b96 : a5 1c __ LDA ACCU + 1 
0b98 : 85 64 __ STA T5 + 1 
0b9a : a5 1d __ LDA ACCU + 2 
0b9c : 85 65 __ STA T5 + 2 
0b9e : a5 1e __ LDA ACCU + 3 
0ba0 : 85 66 __ STA T5 + 3 
0ba2 : a5 5f __ LDA T4 + 0 
0ba4 : 85 0d __ STA P0 
0ba6 : a5 60 __ LDA T4 + 1 
0ba8 : 85 0e __ STA P1 
0baa : a5 61 __ LDA T4 + 2 
0bac : 85 0f __ STA P2 
0bae : a5 62 __ LDA T4 + 3 
0bb0 : 85 10 __ STA P3 
0bb2 : 20 d5 18 JSR $18d5 ; (sin.s4 + 0)
0bb5 : a5 1b __ LDA ACCU + 0 
0bb7 : 85 43 __ STA T0 + 0 
0bb9 : a5 1c __ LDA ACCU + 1 
0bbb : 85 44 __ STA T0 + 1 
0bbd : a5 1d __ LDA ACCU + 2 
0bbf : 85 45 __ STA T0 + 2 
0bc1 : a5 1e __ LDA ACCU + 3 
0bc3 : 85 46 __ STA T0 + 3 
0bc5 : a5 68 __ LDA T11 + 0 
0bc7 : 85 1b __ STA ACCU + 0 
0bc9 : a9 00 __ LDA #$00
0bcb : 85 1c __ STA ACCU + 1 
0bcd : 20 4f 2f JSR $2f4f ; (sint16_to_float + 0)
0bd0 : a5 1b __ LDA ACCU + 0 
0bd2 : 85 53 __ STA T1 + 0 
0bd4 : a5 1c __ LDA ACCU + 1 
0bd6 : 85 54 __ STA T1 + 1 
0bd8 : a5 1d __ LDA ACCU + 2 
0bda : 85 55 __ STA T1 + 2 
0bdc : a5 1e __ LDA ACCU + 3 
0bde : 85 56 __ STA T1 + 3 
0be0 : a5 57 __ LDA T2 + 0 
0be2 : 85 1b __ STA ACCU + 0 
0be4 : a5 58 __ LDA T2 + 1 
0be6 : 85 1c __ STA ACCU + 1 
0be8 : a5 59 __ LDA T2 + 2 
0bea : 85 1d __ STA ACCU + 2 
0bec : a5 5a __ LDA T2 + 3 
0bee : 85 1e __ STA ACCU + 3 
0bf0 : a2 53 __ LDX #$53
0bf2 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0bf5 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0bf8 : a5 1b __ LDA ACCU + 0 
0bfa : 85 57 __ STA T2 + 0 
0bfc : a5 1c __ LDA ACCU + 1 
0bfe : 85 58 __ STA T2 + 1 
0c00 : a5 1d __ LDA ACCU + 2 
0c02 : 85 59 __ STA T2 + 2 
0c04 : a5 1e __ LDA ACCU + 3 
0c06 : 85 5a __ STA T2 + 3 
0c08 : a5 5b __ LDA T3 + 0 
0c0a : 85 1b __ STA ACCU + 0 
0c0c : a5 5c __ LDA T3 + 1 
0c0e : 85 1c __ STA ACCU + 1 
0c10 : a5 5d __ LDA T3 + 2 
0c12 : 85 1d __ STA ACCU + 2 
0c14 : a5 5e __ LDA T3 + 3 
0c16 : 85 1e __ STA ACCU + 3 
0c18 : a2 53 __ LDX #$53
0c1a : 20 e0 2a JSR $2ae0 ; (freg + 4)
0c1d : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0c20 : a5 1b __ LDA ACCU + 0 
0c22 : 85 5b __ STA T3 + 0 
0c24 : a5 1c __ LDA ACCU + 1 
0c26 : 85 5c __ STA T3 + 1 
0c28 : a5 1d __ LDA ACCU + 2 
0c2a : 85 5d __ STA T3 + 2 
0c2c : a5 1e __ LDA ACCU + 3 
0c2e : 85 5e __ STA T3 + 3 
0c30 : a5 53 __ LDA T1 + 0 
0c32 : 85 1b __ STA ACCU + 0 
0c34 : a5 54 __ LDA T1 + 1 
0c36 : 85 1c __ STA ACCU + 1 
0c38 : a5 55 __ LDA T1 + 2 
0c3a : 85 1d __ STA ACCU + 2 
0c3c : a5 56 __ LDA T1 + 3 
0c3e : 85 1e __ STA ACCU + 3 
0c40 : a2 63 __ LDX #$63
0c42 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0c45 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0c48 : a9 00 __ LDA #$00
0c4a : 85 03 __ STA WORK + 0 
0c4c : 85 04 __ STA WORK + 1 
0c4e : a9 20 __ LDA #$20
0c50 : 85 05 __ STA WORK + 2 
0c52 : a9 43 __ LDA #$43
0c54 : 85 06 __ STA WORK + 3 
0c56 : 20 f0 2a JSR $2af0 ; (freg + 20)
0c59 : 20 27 2b JSR $2b27 ; (faddsub + 6)
0c5c : a5 1b __ LDA ACCU + 0 
0c5e : 85 5f __ STA T4 + 0 
0c60 : a5 1c __ LDA ACCU + 1 
0c62 : 85 60 __ STA T4 + 1 
0c64 : a5 1d __ LDA ACCU + 2 
0c66 : 85 61 __ STA T4 + 2 
0c68 : a5 1e __ LDA ACCU + 3 
0c6a : 85 62 __ STA T4 + 3 
0c6c : a5 43 __ LDA T0 + 0 
0c6e : 85 1b __ STA ACCU + 0 
0c70 : a5 44 __ LDA T0 + 1 
0c72 : 85 1c __ STA ACCU + 1 
0c74 : a5 45 __ LDA T0 + 2 
0c76 : 85 1d __ STA ACCU + 2 
0c78 : a5 46 __ LDA T0 + 3 
0c7a : 85 1e __ STA ACCU + 3 
0c7c : a2 53 __ LDX #$53
0c7e : 20 e0 2a JSR $2ae0 ; (freg + 4)
0c81 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0c84 : a9 00 __ LDA #$00
0c86 : 85 03 __ STA WORK + 0 
0c88 : 85 04 __ STA WORK + 1 
0c8a : a9 c8 __ LDA #$c8
0c8c : 85 05 __ STA WORK + 2 
0c8e : a9 42 __ LDA #$42
0c90 : 85 06 __ STA WORK + 3 
0c92 : 20 f0 2a JSR $2af0 ; (freg + 20)
0c95 : 20 27 2b JSR $2b27 ; (faddsub + 6)
0c98 : a5 1b __ LDA ACCU + 0 
0c9a : 85 43 __ STA T0 + 0 
0c9c : a5 1c __ LDA ACCU + 1 
0c9e : 85 44 __ STA T0 + 1 
0ca0 : a5 1d __ LDA ACCU + 2 
0ca2 : 85 45 __ STA T0 + 2 
0ca4 : a5 1e __ LDA ACCU + 3 
0ca6 : 85 46 __ STA T0 + 3 
0ca8 : a9 00 __ LDA #$00
0caa : 85 4f __ STA T8 + 0 
0cac : 85 51 __ STA T9 + 0 
.l12:
0cae : a6 4f __ LDX T8 + 0 
0cb0 : bd 7c 9f LDA $9f7c,x ; (py[0] + 0)
0cb3 : 85 53 __ STA T1 + 0 
0cb5 : 85 1b __ STA ACCU + 0 
0cb7 : bd 7d 9f LDA $9f7d,x ; (py[0] + 1)
0cba : 85 54 __ STA T1 + 1 
0cbc : 85 1c __ STA ACCU + 1 
0cbe : bd 7e 9f LDA $9f7e,x ; (py[0] + 2)
0cc1 : 85 55 __ STA T1 + 2 
0cc3 : 85 1d __ STA ACCU + 2 
0cc5 : bd 7f 9f LDA $9f7f,x ; (py[0] + 3)
0cc8 : 85 56 __ STA T1 + 3 
0cca : 85 1e __ STA ACCU + 3 
0ccc : a2 5b __ LDX #$5b
0cce : 20 e0 2a JSR $2ae0 ; (freg + 4)
0cd1 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0cd4 : a5 1b __ LDA ACCU + 0 
0cd6 : 85 63 __ STA T5 + 0 
0cd8 : a5 1c __ LDA ACCU + 1 
0cda : 85 64 __ STA T5 + 1 
0cdc : a5 1d __ LDA ACCU + 2 
0cde : 85 65 __ STA T5 + 2 
0ce0 : a5 1e __ LDA ACCU + 3 
0ce2 : 85 66 __ STA T5 + 3 
0ce4 : a6 4f __ LDX T8 + 0 
0ce6 : bd a4 9f LDA $9fa4,x ; (px[0] + 0)
0ce9 : 85 47 __ STA T6 + 0 
0ceb : 85 1b __ STA ACCU + 0 
0ced : bd a5 9f LDA $9fa5,x ; (px[0] + 1)
0cf0 : 85 48 __ STA T6 + 1 
0cf2 : 85 1c __ STA ACCU + 1 
0cf4 : bd a6 9f LDA $9fa6,x ; (px[0] + 2)
0cf7 : 85 49 __ STA T6 + 2 
0cf9 : 85 1d __ STA ACCU + 2 
0cfb : bd a7 9f LDA $9fa7,x ; (px[0] + 3)
0cfe : 85 4a __ STA T6 + 3 
0d00 : 85 1e __ STA ACCU + 3 
0d02 : a2 57 __ LDX #$57
0d04 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0d07 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0d0a : a2 5f __ LDX #$5f
0d0c : 20 e0 2a JSR $2ae0 ; (freg + 4)
0d0f : 20 27 2b JSR $2b27 ; (faddsub + 6)
0d12 : a2 63 __ LDX #$63
0d14 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0d17 : 20 27 2b JSR $2b27 ; (faddsub + 6)
0d1a : 20 03 2f JSR $2f03 ; (f32_to_i16 + 0)
0d1d : a5 1b __ LDA ACCU + 0 
0d1f : a6 51 __ LDX T9 + 0 
0d21 : 9d 68 9f STA $9f68,x ; (rpx[0] + 0)
0d24 : a5 1c __ LDA ACCU + 1 
0d26 : 9d 69 9f STA $9f69,x ; (rpx[0] + 1)
0d29 : a5 53 __ LDA T1 + 0 
0d2b : 85 1b __ STA ACCU + 0 
0d2d : a5 54 __ LDA T1 + 1 
0d2f : 85 1c __ STA ACCU + 1 
0d31 : a5 55 __ LDA T1 + 2 
0d33 : 85 1d __ STA ACCU + 2 
0d35 : a5 56 __ LDA T1 + 3 
0d37 : 85 1e __ STA ACCU + 3 
0d39 : a2 57 __ LDX #$57
0d3b : 20 e0 2a JSR $2ae0 ; (freg + 4)
0d3e : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0d41 : a5 1b __ LDA ACCU + 0 
0d43 : 85 53 __ STA T1 + 0 
0d45 : a5 1c __ LDA ACCU + 1 
0d47 : 85 54 __ STA T1 + 1 
0d49 : a5 1d __ LDA ACCU + 2 
0d4b : 85 55 __ STA T1 + 2 
0d4d : a5 1e __ LDA ACCU + 3 
0d4f : 85 56 __ STA T1 + 3 
0d51 : a5 47 __ LDA T6 + 0 
0d53 : 85 1b __ STA ACCU + 0 
0d55 : a5 48 __ LDA T6 + 1 
0d57 : 85 1c __ STA ACCU + 1 
0d59 : a5 49 __ LDA T6 + 2 
0d5b : 85 1d __ STA ACCU + 2 
0d5d : a5 4a __ LDA T6 + 3 
0d5f : 85 1e __ STA ACCU + 3 
0d61 : a2 5b __ LDX #$5b
0d63 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0d66 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
0d69 : a2 43 __ LDX #$43
0d6b : 20 e0 2a JSR $2ae0 ; (freg + 4)
0d6e : a5 1e __ LDA ACCU + 3 
0d70 : 49 80 __ EOR #$80
0d72 : 85 1e __ STA ACCU + 3 
0d74 : 20 27 2b JSR $2b27 ; (faddsub + 6)
0d77 : a2 53 __ LDX #$53
0d79 : 20 e0 2a JSR $2ae0 ; (freg + 4)
0d7c : 20 27 2b JSR $2b27 ; (faddsub + 6)
0d7f : 20 03 2f JSR $2f03 ; (f32_to_i16 + 0)
0d82 : a5 1b __ LDA ACCU + 0 
0d84 : a6 51 __ LDX T9 + 0 
0d86 : e8 __ __ INX
0d87 : e8 __ __ INX
0d88 : 86 51 __ STX T9 + 0 
0d8a : 9d 52 9f STA $9f52,x ; (main@stack + 22)
0d8d : a5 1c __ LDA ACCU + 1 
0d8f : 9d 53 9f STA $9f53,x ; (main@stack + 23)
0d92 : 18 __ __ CLC
0d93 : a5 4f __ LDA T8 + 0 
0d95 : 69 04 __ ADC #$04
0d97 : 85 4f __ STA T8 + 0 
0d99 : e0 14 __ CPX #$14
0d9b : f0 03 __ BEQ $0da0 ; (main.s13 + 0)
0d9d : 4c ae 0c JMP $0cae ; (main.l12 + 0)
.s13:
0da0 : a5 67 __ LDA T10 + 0 
0da2 : 29 0c __ AND #$0c
0da4 : 0a __ __ ASL
0da5 : 85 43 __ STA T0 + 0 
0da7 : a9 0a __ LDA #$0a
0da9 : 85 18 __ STA P11 
0dab : a9 68 __ LDA #$68
0dad : 8d ed 9f STA $9fed ; (sstack + 4)
0db0 : a9 9f __ LDA #$9f
0db2 : 8d ee 9f STA $9fee ; (sstack + 5)
0db5 : a9 54 __ LDA #$54
0db7 : 8d ef 9f STA $9fef ; (sstack + 6)
0dba : a9 9f __ LDA #$9f
0dbc : 8d f0 9f STA $9ff0 ; (sstack + 7)
0dbf : a5 67 __ LDA T10 + 0 
0dc1 : 29 03 __ AND #$03
0dc3 : 4a __ __ LSR
0dc4 : 6a __ __ ROR
0dc5 : 6a __ __ ROR
0dc6 : 6a __ __ ROR
0dc7 : 05 43 __ ORA T0 + 0 
0dc9 : 69 3c __ ADC #$3c
0dcb : 8d f1 9f STA $9ff1 ; (sstack + 8)
0dce : a9 31 __ LDA #$31
0dd0 : 69 00 __ ADC #$00
0dd2 : 8d f2 9f STA $9ff2 ; (sstack + 9)
0dd5 : a9 d1 __ LDA #$d1
0dd7 : 8d e9 9f STA $9fe9 ; (sstack + 0)
0dda : a9 31 __ LDA #$31
0ddc : 8d ea 9f STA $9fea ; (sstack + 1)
0ddf : a9 cc __ LDA #$cc
0de1 : 8d eb 9f STA $9feb ; (sstack + 2)
0de4 : a9 9f __ LDA #$9f
0de6 : 8d ec 9f STA $9fec ; (sstack + 3)
0de9 : 20 6c 1a JSR $1a6c ; (bmmc_polygon_nc_fill.s1 + 0)
0dec : a9 00 __ LDA #$00
0dee : 85 57 __ STA T2 + 0 
.l17:
0df0 : 0a __ __ ASL
0df1 : aa __ __ TAX
0df2 : a9 d1 __ LDA #$d1
0df4 : 8d f3 9f STA $9ff3 ; (sstack + 10)
0df7 : a9 31 __ LDA #$31
0df9 : 8d f4 9f STA $9ff4 ; (sstack + 11)
0dfc : a9 cc __ LDA #$cc
0dfe : 8d f5 9f STA $9ff5 ; (sstack + 12)
0e01 : a9 9f __ LDA #$9f
0e03 : 8d f6 9f STA $9ff6 ; (sstack + 13)
0e06 : bd 68 9f LDA $9f68,x ; (rpx[0] + 0)
0e09 : 8d f7 9f STA $9ff7 ; (sstack + 14)
0e0c : bd 69 9f LDA $9f69,x ; (rpx[0] + 1)
0e0f : 8d f8 9f STA $9ff8 ; (sstack + 15)
0e12 : bd 54 9f LDA $9f54,x ; (rpy[0] + 0)
0e15 : 8d f9 9f STA $9ff9 ; (sstack + 16)
0e18 : bd 55 9f LDA $9f55,x ; (rpy[0] + 1)
0e1b : 8d fa 9f STA $9ffa ; (sstack + 17)
0e1e : e6 57 __ INC T2 + 0 
0e20 : a5 57 __ LDA T2 + 0 
0e22 : 85 1b __ STA ACCU + 0 
0e24 : a9 00 __ LDA #$00
0e26 : 8d ff 9f STA $9fff ; (sstack + 22)
0e29 : 85 1c __ STA ACCU + 1 
0e2b : 85 04 __ STA WORK + 1 
0e2d : a9 0a __ LDA #$0a
0e2f : 85 03 __ STA WORK + 0 
0e31 : 20 84 2d JSR $2d84 ; (divmod + 0)
0e34 : a5 05 __ LDA WORK + 2 
0e36 : 0a __ __ ASL
0e37 : aa __ __ TAX
0e38 : bd 68 9f LDA $9f68,x ; (rpx[0] + 0)
0e3b : 8d fb 9f STA $9ffb ; (sstack + 18)
0e3e : bd 69 9f LDA $9f69,x ; (rpx[0] + 1)
0e41 : 8d fc 9f STA $9ffc ; (sstack + 19)
0e44 : bd 54 9f LDA $9f54,x ; (rpy[0] + 0)
0e47 : 8d fd 9f STA $9ffd ; (sstack + 20)
0e4a : bd 55 9f LDA $9f55,x ; (rpy[0] + 1)
0e4d : 8d fe 9f STA $9ffe ; (sstack + 21)
0e50 : 20 40 21 JSR $2140 ; (bmmc_line.s1 + 0)
0e53 : a5 57 __ LDA T2 + 0 
0e55 : c9 0a __ CMP #$0a
0e57 : 90 97 __ BCC $0df0 ; (main.l17 + 0)
.s14:
0e59 : e6 68 __ INC T11 + 0 
0e5b : e6 67 __ INC T10 + 0 
0e5d : 30 03 __ BMI $0e62 ; (main.s15 + 0)
0e5f : 4c ac 0a JMP $0aac ; (main.l11 + 0)
.s15:
0e62 : 20 16 2a JSR $2a16 ; (done.s4 + 0)
0e65 : a9 00 __ LDA #$00
0e67 : 85 1b __ STA ACCU + 0 
0e69 : 85 1c __ STA ACCU + 1 
.s3:
0e6b : a2 15 __ LDX #$15
0e6d : bd 3c 9f LDA $9f3c,x ; (main@stack + 0)
0e70 : 95 53 __ STA T1 + 0,x 
0e72 : ca __ __ DEX
0e73 : 10 f8 __ BPL $0e6d ; (main.s3 + 2)
0e75 : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  14, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/polygon.c"
.s4:
0e76 : 20 f6 0e JSR $0ef6 ; (mmap_trampoline.s4 + 0)
0e79 : a9 00 __ LDA #$00
0e7b : 85 0f __ STA P2 
0e7d : 85 10 __ STA P3 
0e7f : a9 30 __ LDA #$30
0e81 : 85 01 __ STA $01 
0e83 : a9 40 __ LDA #$40
0e85 : 85 11 __ STA P4 
0e87 : a9 1f __ LDA #$1f
0e89 : 85 12 __ STA P5 
0e8b : a9 67 __ LDA #$67
0e8d : a2 fa __ LDX #$fa
.l6:
0e8f : ca __ __ DEX
0e90 : 9d 00 c8 STA $c800,x 
0e93 : 9d fa c8 STA $c8fa,x 
0e96 : 9d f4 c9 STA $c9f4,x 
0e99 : 9d ee ca STA $caee,x 
0e9c : d0 f1 __ BNE $0e8f ; (init.l6 + 0)
.s5:
0e9e : a9 02 __ LDA #$02
0ea0 : a2 fa __ LDX #$fa
.l8:
0ea2 : ca __ __ DEX
0ea3 : 9d 00 d8 STA $d800,x 
0ea6 : 9d fa d8 STA $d8fa,x 
0ea9 : 9d f4 d9 STA $d9f4,x 
0eac : 9d ee da STA $daee,x 
0eaf : d0 f1 __ BNE $0ea2 ; (init.l8 + 0)
.s7:
0eb1 : a9 00 __ LDA #$00
0eb3 : 85 0d __ STA P0 
0eb5 : a9 e0 __ LDA #$e0
0eb7 : 85 0e __ STA P1 
0eb9 : 20 40 0f JSR $0f40 ; (memset.s4 + 0)
0ebc : a9 00 __ LDA #$00
0ebe : 85 10 __ STA P3 
0ec0 : 85 0e __ STA P1 
0ec2 : a9 35 __ LDA #$35
0ec4 : 85 01 __ STA $01 
0ec6 : a9 04 __ LDA #$04
0ec8 : 85 0d __ STA P0 
0eca : a9 e0 __ LDA #$e0
0ecc : 85 11 __ STA P4 
0ece : a9 c8 __ LDA #$c8
0ed0 : 85 0f __ STA P2 
0ed2 : 20 64 0f JSR $0f64 ; (vic_setmode.s4 + 0)
0ed5 : a9 00 __ LDA #$00
0ed7 : 85 0f __ STA P2 
0ed9 : 8d 21 d0 STA $d021 
0edc : 8d 20 d0 STA $d020 
0edf : a9 e0 __ LDA #$e0
0ee1 : 85 10 __ STA P3 
0ee3 : a9 28 __ LDA #$28
0ee5 : 85 11 __ STA P4 
0ee7 : a9 19 __ LDA #$19
0ee9 : 85 12 __ STA P5 
0eeb : a9 d1 __ LDA #$d1
0eed : 85 0d __ STA P0 
0eef : a9 31 __ LDA #$31
0ef1 : 85 0e __ STA P1 
0ef3 : 4c b6 0f JMP $0fb6 ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0ef6 : a9 0b __ LDA #$0b
0ef8 : 8d fa ff STA $fffa 
0efb : a9 0f __ LDA #$0f
0efd : 8d fb ff STA $fffb 
0f00 : a9 29 __ LDA #$29
0f02 : 8d fe ff STA $fffe 
0f05 : a9 0f __ LDA #$0f
0f07 : 8d ff ff STA $ffff 
.s3:
0f0a : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0f0b : 48 __ __ PHA
0f0c : 8a __ __ TXA
0f0d : 48 __ __ PHA
0f0e : a9 0f __ LDA #$0f
0f10 : 48 __ __ PHA
0f11 : a9 22 __ LDA #$22
0f13 : 48 __ __ PHA
0f14 : ba __ __ TSX
0f15 : bd 05 01 LDA $0105,x 
0f18 : 48 __ __ PHA
0f19 : a6 01 __ LDX $01 
0f1b : a9 36 __ LDA #$36
0f1d : 85 01 __ STA $01 
0f1f : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0f22 : 86 01 __ STX $01 
0f24 : 68 __ __ PLA
0f25 : aa __ __ TAX
0f26 : 68 __ __ PLA
0f27 : 40 __ __ RTI
0f28 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0f29 : 48 __ __ PHA
0f2a : 8a __ __ TXA
0f2b : 48 __ __ PHA
0f2c : a9 0f __ LDA #$0f
0f2e : 48 __ __ PHA
0f2f : a9 22 __ LDA #$22
0f31 : 48 __ __ PHA
0f32 : ba __ __ TSX
0f33 : bd 05 01 LDA $0105,x 
0f36 : 48 __ __ PHA
0f37 : a6 01 __ LDX $01 
0f39 : a9 36 __ LDA #$36
0f3b : 85 01 __ STA $01 
0f3d : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0f40 : a5 0f __ LDA P2 
0f42 : a6 12 __ LDX P5 
0f44 : f0 0c __ BEQ $0f52 ; (memset.s4 + 18)
0f46 : a0 00 __ LDY #$00
0f48 : 91 0d __ STA (P0),y ; (dst + 0)
0f4a : c8 __ __ INY
0f4b : d0 fb __ BNE $0f48 ; (memset.s4 + 8)
0f4d : e6 0e __ INC P1 ; (dst + 1)
0f4f : ca __ __ DEX
0f50 : d0 f6 __ BNE $0f48 ; (memset.s4 + 8)
0f52 : a4 11 __ LDY P4 
0f54 : f0 05 __ BEQ $0f5b ; (memset.s4 + 27)
0f56 : 88 __ __ DEY
0f57 : 91 0d __ STA (P0),y ; (dst + 0)
0f59 : d0 fb __ BNE $0f56 ; (memset.s4 + 22)
0f5b : a5 0d __ LDA P0 ; (dst + 0)
0f5d : 85 1b __ STA ACCU + 0 
0f5f : a5 0e __ LDA P1 ; (dst + 1)
0f61 : 85 1c __ STA ACCU + 1 
.s3:
0f63 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0f64 : a4 0d __ LDY P0 ; (mode + 0)
0f66 : c0 02 __ CPY #$02
0f68 : d0 09 __ BNE $0f73 ; (vic_setmode.s5 + 0)
.s10:
0f6a : a9 5b __ LDA #$5b
0f6c : 8d 11 d0 STA $d011 
.s8:
0f6f : a9 08 __ LDA #$08
0f71 : d0 0c __ BNE $0f7f ; (vic_setmode.s7 + 0)
.s5:
0f73 : b0 36 __ BCS $0fab ; (vic_setmode.s6 + 0)
.s9:
0f75 : a9 1b __ LDA #$1b
0f77 : 8d 11 d0 STA $d011 
0f7a : 98 __ __ TYA
0f7b : f0 f2 __ BEQ $0f6f ; (vic_setmode.s8 + 0)
.s11:
0f7d : a9 18 __ LDA #$18
.s7:
0f7f : 8d 16 d0 STA $d016 
0f82 : ad 00 dd LDA $dd00 
0f85 : 29 fc __ AND #$fc
0f87 : 85 1b __ STA ACCU + 0 
0f89 : a5 0f __ LDA P2 ; (text + 1)
0f8b : 0a __ __ ASL
0f8c : 2a __ __ ROL
0f8d : 29 01 __ AND #$01
0f8f : 2a __ __ ROL
0f90 : 49 03 __ EOR #$03
0f92 : 05 1b __ ORA ACCU + 0 
0f94 : 8d 00 dd STA $dd00 
0f97 : a5 0f __ LDA P2 ; (text + 1)
0f99 : 29 3c __ AND #$3c
0f9b : 0a __ __ ASL
0f9c : 0a __ __ ASL
0f9d : 85 1b __ STA ACCU + 0 
0f9f : a5 11 __ LDA P4 ; (font + 1)
0fa1 : 29 38 __ AND #$38
0fa3 : 4a __ __ LSR
0fa4 : 4a __ __ LSR
0fa5 : 05 1b __ ORA ACCU + 0 
0fa7 : 8d 18 d0 STA $d018 
.s3:
0faa : 60 __ __ RTS
.s6:
0fab : a9 3b __ LDA #$3b
0fad : 8d 11 d0 STA $d011 
0fb0 : c0 03 __ CPY #$03
0fb2 : d0 c9 __ BNE $0f7d ; (vic_setmode.s11 + 0)
0fb4 : f0 b9 __ BEQ $0f6f ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0fb6 : a5 0f __ LDA P2 ; (data + 0)
0fb8 : a0 00 __ LDY #$00
0fba : 91 0d __ STA (P0),y ; (bm + 0)
0fbc : a5 10 __ LDA P3 ; (data + 1)
0fbe : c8 __ __ INY
0fbf : 91 0d __ STA (P0),y ; (bm + 0)
0fc1 : a9 00 __ LDA #$00
0fc3 : c8 __ __ INY
0fc4 : 91 0d __ STA (P0),y ; (bm + 0)
0fc6 : c8 __ __ INY
0fc7 : 91 0d __ STA (P0),y ; (bm + 0)
0fc9 : a5 11 __ LDA P4 ; (cw + 0)
0fcb : c8 __ __ INY
0fcc : 91 0d __ STA (P0),y ; (bm + 0)
0fce : a5 12 __ LDA P5 ; (ch + 0)
0fd0 : c8 __ __ INY
0fd1 : 91 0d __ STA (P0),y ; (bm + 0)
0fd3 : a9 00 __ LDA #$00
0fd5 : 06 11 __ ASL P4 ; (cw + 0)
0fd7 : 2a __ __ ROL
0fd8 : 06 11 __ ASL P4 ; (cw + 0)
0fda : 2a __ __ ROL
0fdb : 06 11 __ ASL P4 ; (cw + 0)
0fdd : 2a __ __ ROL
0fde : a0 07 __ LDY #$07
0fe0 : 91 0d __ STA (P0),y ; (bm + 0)
0fe2 : a5 11 __ LDA P4 ; (cw + 0)
0fe4 : 88 __ __ DEY
0fe5 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0fe7 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
0fe8 : a5 53 __ LDA T6 + 0 
0fea : 8d e3 9f STA $9fe3 ; (bmu_bitblit@stack + 0)
0fed : a5 54 __ LDA T6 + 1 
0fef : 8d e4 9f STA $9fe4 ; (bmu_bitblit@stack + 1)
0ff2 : a5 55 __ LDA T8 + 0 
0ff4 : 8d e5 9f STA $9fe5 ; (bmu_bitblit@stack + 2)
.s4:
0ff7 : ad e9 9f LDA $9fe9 ; (sstack + 0)
0ffa : 85 4e __ STA T2 + 0 
0ffc : 18 __ __ CLC
0ffd : 6d f3 9f ADC $9ff3 ; (sstack + 10)
1000 : 85 45 __ STA T1 + 0 
1002 : 29 07 __ AND #$07
1004 : aa __ __ TAX
1005 : bd 30 31 LDA $3130,x ; (rmask[0] + 0)
1008 : 85 13 __ STA P6 
100a : ad f4 9f LDA $9ff4 ; (sstack + 11)
100d : 6d ea 9f ADC $9fea ; (sstack + 1)
1010 : 4a __ __ LSR
1011 : 66 45 __ ROR T1 + 0 
1013 : 4a __ __ LSR
1014 : 66 45 __ ROR T1 + 0 
1016 : 4a __ __ LSR
1017 : 66 45 __ ROR T1 + 0 
1019 : ad ea 9f LDA $9fea ; (sstack + 1)
101c : 4a __ __ LSR
101d : 66 4e __ ROR T2 + 0 
101f : 4a __ __ LSR
1020 : 66 4e __ ROR T2 + 0 
1022 : 4a __ __ LSR
1023 : 66 4e __ ROR T2 + 0 
1025 : 38 __ __ SEC
1026 : a5 45 __ LDA T1 + 0 
1028 : e5 4e __ SBC T2 + 0 
102a : 85 11 __ STA P4 
102c : ad e9 9f LDA $9fe9 ; (sstack + 0)
102f : 29 07 __ AND #$07
1031 : 85 4e __ STA T2 + 0 
1033 : aa __ __ TAX
1034 : bd 28 31 LDA $3128,x ; (lmask[0] + 0)
1037 : 85 4c __ STA T10 + 0 
1039 : 85 12 __ STA P5 
103b : ad ed 9f LDA $9fed ; (sstack + 4)
103e : 85 49 __ STA T4 + 0 
1040 : ad ee 9f LDA $9fee ; (sstack + 5)
1043 : 85 4a __ STA T4 + 1 
1045 : a5 16 __ LDA P9 ; (dbm + 0)
1047 : c5 49 __ CMP T4 + 0 
1049 : d0 78 __ BNE $10c3 ; (bmu_bitblit.s5 + 0)
.s52:
104b : a5 17 __ LDA P10 ; (dbm + 1)
104d : c5 4a __ CMP T4 + 1 
104f : d0 72 __ BNE $10c3 ; (bmu_bitblit.s5 + 0)
.s38:
1051 : ad f2 9f LDA $9ff2 ; (sstack + 9)
1054 : cd ec 9f CMP $9fec ; (sstack + 3)
1057 : d0 0a __ BNE $1063 ; (bmu_bitblit.s51 + 0)
.s48:
1059 : ad f1 9f LDA $9ff1 ; (sstack + 8)
105c : cd eb 9f CMP $9feb ; (sstack + 2)
.s49:
105f : b0 09 __ BCS $106a ; (bmu_bitblit.s39 + 0)
1061 : 90 30 __ BCC $1093 ; (bmu_bitblit.s41 + 0)
.s51:
1063 : 4d ec 9f EOR $9fec ; (sstack + 3)
1066 : 10 f7 __ BPL $105f ; (bmu_bitblit.s49 + 0)
.s50:
1068 : b0 29 __ BCS $1093 ; (bmu_bitblit.s41 + 0)
.s39:
106a : ad ec 9f LDA $9fec ; (sstack + 3)
106d : cd f2 9f CMP $9ff2 ; (sstack + 9)
1070 : d0 51 __ BNE $10c3 ; (bmu_bitblit.s5 + 0)
.s47:
1072 : ad eb 9f LDA $9feb ; (sstack + 2)
1075 : cd f1 9f CMP $9ff1 ; (sstack + 8)
1078 : d0 49 __ BNE $10c3 ; (bmu_bitblit.s5 + 0)
.s40:
107a : ad f0 9f LDA $9ff0 ; (sstack + 7)
107d : cd ea 9f CMP $9fea ; (sstack + 1)
1080 : d0 0a __ BNE $108c ; (bmu_bitblit.s46 + 0)
.s43:
1082 : ad ef 9f LDA $9fef ; (sstack + 6)
1085 : cd e9 9f CMP $9fe9 ; (sstack + 0)
.s44:
1088 : 90 09 __ BCC $1093 ; (bmu_bitblit.s41 + 0)
108a : b0 37 __ BCS $10c3 ; (bmu_bitblit.s5 + 0)
.s46:
108c : 4d ea 9f EOR $9fea ; (sstack + 1)
108f : 10 f7 __ BPL $1088 ; (bmu_bitblit.s44 + 0)
.s45:
1091 : 90 30 __ BCC $10c3 ; (bmu_bitblit.s5 + 0)
.s41:
1093 : a5 18 __ LDA P11 ; (op + 0)
1095 : 29 08 __ AND #$08
1097 : f0 2a __ BEQ $10c3 ; (bmu_bitblit.s5 + 0)
.s42:
1099 : ad f5 9f LDA $9ff5 ; (sstack + 12)
109c : 18 __ __ CLC
109d : 6d f1 9f ADC $9ff1 ; (sstack + 8)
10a0 : 8d f1 9f STA $9ff1 ; (sstack + 8)
10a3 : ad f6 9f LDA $9ff6 ; (sstack + 13)
10a6 : 6d f2 9f ADC $9ff2 ; (sstack + 9)
10a9 : 8d f2 9f STA $9ff2 ; (sstack + 9)
10ac : ad f5 9f LDA $9ff5 ; (sstack + 12)
10af : 18 __ __ CLC
10b0 : 6d eb 9f ADC $9feb ; (sstack + 2)
10b3 : 8d eb 9f STA $9feb ; (sstack + 2)
10b6 : ad f6 9f LDA $9ff6 ; (sstack + 13)
10b9 : 6d ec 9f ADC $9fec ; (sstack + 3)
10bc : 8d ec 9f STA $9fec ; (sstack + 3)
10bf : a9 01 __ LDA #$01
10c1 : d0 02 __ BNE $10c5 ; (bmu_bitblit.s6 + 0)
.s5:
10c3 : a9 00 __ LDA #$00
.s6:
10c5 : 85 15 __ STA P8 
10c7 : ad ec 9f LDA $9fec ; (sstack + 3)
10ca : 85 1c __ STA ACCU + 1 ; (dy + 1)
10cc : ad eb 9f LDA $9feb ; (sstack + 2)
10cf : 29 f8 __ AND #$f8
10d1 : 85 1b __ STA ACCU + 0 ; (dy + 0)
10d3 : a0 04 __ LDY #$04
10d5 : b1 16 __ LDA (P9),y ; (dbm + 0)
10d7 : 85 52 __ STA T7 + 0 
10d9 : 20 6e 2a JSR $2a6e ; (mul16by8 + 0)
10dc : a0 00 __ LDY #$00
10de : b1 16 __ LDA (P9),y ; (dbm + 0)
10e0 : 18 __ __ CLC
10e1 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
10e3 : 85 02 __ STA $02 
10e5 : c8 __ __ INY
10e6 : b1 16 __ LDA (P9),y ; (dbm + 0)
10e8 : 65 1c __ ADC ACCU + 1 ; (dy + 1)
10ea : aa __ __ TAX
10eb : ad e9 9f LDA $9fe9 ; (sstack + 0)
10ee : 29 f8 __ AND #$f8
10f0 : 18 __ __ CLC
10f1 : 65 02 __ ADC $02 
10f3 : 85 47 __ STA T3 + 0 
10f5 : 8a __ __ TXA
10f6 : 6d ea 9f ADC $9fea ; (sstack + 1)
10f9 : aa __ __ TAX
10fa : ad eb 9f LDA $9feb ; (sstack + 2)
10fd : 29 07 __ AND #$07
10ff : 18 __ __ CLC
1100 : 65 47 __ ADC T3 + 0 
1102 : 85 53 __ STA T6 + 0 
1104 : 90 01 __ BCC $1107 ; (bmu_bitblit.s54 + 0)
.s53:
1106 : e8 __ __ INX
.s54:
1107 : 86 54 __ STX T6 + 1 
1109 : ad f2 9f LDA $9ff2 ; (sstack + 9)
110c : 85 1c __ STA ACCU + 1 ; (dy + 1)
110e : ad f1 9f LDA $9ff1 ; (sstack + 8)
1111 : 29 f8 __ AND #$f8
1113 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1115 : a0 04 __ LDY #$04
1117 : b1 49 __ LDA (T4 + 0),y 
1119 : 85 55 __ STA T8 + 0 
111b : 20 6e 2a JSR $2a6e ; (mul16by8 + 0)
111e : a0 00 __ LDY #$00
1120 : b1 49 __ LDA (T4 + 0),y 
1122 : 18 __ __ CLC
1123 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1125 : 85 02 __ STA $02 
1127 : c8 __ __ INY
1128 : b1 49 __ LDA (T4 + 0),y 
112a : 65 1c __ ADC ACCU + 1 ; (dy + 1)
112c : aa __ __ TAX
112d : ad ef 9f LDA $9fef ; (sstack + 6)
1130 : 29 f8 __ AND #$f8
1132 : 18 __ __ CLC
1133 : 65 02 __ ADC $02 
1135 : 85 49 __ STA T4 + 0 
1137 : 8a __ __ TXA
1138 : 6d f0 9f ADC $9ff0 ; (sstack + 7)
113b : aa __ __ TAX
113c : ad f1 9f LDA $9ff1 ; (sstack + 8)
113f : 29 07 __ AND #$07
1141 : 18 __ __ CLC
1142 : 65 49 __ ADC T4 + 0 
1144 : 85 49 __ STA T4 + 0 
1146 : 90 01 __ BCC $1149 ; (bmu_bitblit.s56 + 0)
.s55:
1148 : e8 __ __ INX
.s56:
1149 : ad ef 9f LDA $9fef ; (sstack + 6)
114c : 29 07 __ AND #$07
114e : 49 ff __ EOR #$ff
1150 : 38 __ __ SEC
1151 : 65 4e __ ADC T2 + 0 
1153 : 85 43 __ STA T0 + 0 
1155 : 29 07 __ AND #$07
1157 : 85 10 __ STA P3 
1159 : a5 15 __ LDA P8 
115b : f0 03 __ BEQ $1160 ; (bmu_bitblit.s7 + 0)
115d : 4c 4f 13 JMP $134f ; (bmu_bitblit.s36 + 0)
.s7:
1160 : 86 51 __ STX T5 + 1 
1162 : a4 49 __ LDY T4 + 0 
1164 : 84 50 __ STY T5 + 0 
1166 : a5 43 __ LDA T0 + 0 
1168 : f0 0d __ BEQ $1177 ; (bmu_bitblit.s8 + 0)
.s34:
116a : 30 0b __ BMI $1177 ; (bmu_bitblit.s8 + 0)
.s35:
116c : 98 __ __ TYA
116d : 18 __ __ CLC
116e : 69 f8 __ ADC #$f8
1170 : 85 50 __ STA T5 + 0 
1172 : 8a __ __ TXA
1173 : 69 ff __ ADC #$ff
1175 : 85 51 __ STA T5 + 1 
.s8:
1177 : a5 18 __ LDA P11 ; (op + 0)
1179 : 85 14 __ STA P7 
117b : 20 9a 13 JSR $139a ; (builddop.s4 + 0)
117e : 18 __ __ CLC
117f : a5 52 __ LDA T7 + 0 
1181 : 69 ff __ ADC #$ff
1183 : 2a __ __ ROL
1184 : 2a __ __ ROL
1185 : 2a __ __ ROL
1186 : aa __ __ TAX
1187 : 29 f8 __ AND #$f8
1189 : 85 43 __ STA T0 + 0 
118b : 8a __ __ TXA
118c : 29 07 __ AND #$07
118e : 2a __ __ ROL
118f : 69 f8 __ ADC #$f8
1191 : 85 44 __ STA T0 + 1 
1193 : ad f7 9f LDA $9ff7 ; (sstack + 14)
1196 : 85 45 __ STA T1 + 0 
1198 : 85 47 __ STA T3 + 0 
119a : ad f8 9f LDA $9ff8 ; (sstack + 15)
119d : 85 46 __ STA T1 + 1 
119f : a5 18 __ LDA P11 ; (op + 0)
11a1 : 29 08 __ AND #$08
11a3 : f0 03 __ BEQ $11a8 ; (bmu_bitblit.s9 + 0)
11a5 : 4c 42 12 JMP $1242 ; (bmu_bitblit.s19 + 0)
.s9:
11a8 : ad f5 9f LDA $9ff5 ; (sstack + 12)
11ab : 85 47 __ STA T3 + 0 
11ad : a5 18 __ LDA P11 ; (op + 0)
11af : 29 20 __ AND #$20
11b1 : d0 4c __ BNE $11ff ; (bmu_bitblit.s15 + 0)
.s10:
11b3 : a5 47 __ LDA T3 + 0 
11b5 : f0 38 __ BEQ $11ef ; (bmu_bitblit.s3 + 0)
.s11:
11b7 : a9 00 __ LDA #$00
11b9 : 85 4e __ STA T2 + 0 
.l12:
11bb : a5 53 __ LDA T6 + 0 
11bd : 85 03 __ STA WORK + 0 
11bf : a5 54 __ LDA T6 + 1 
11c1 : 85 04 __ STA WORK + 1 
11c3 : a5 53 __ LDA T6 + 0 
11c5 : 85 05 __ STA WORK + 2 
11c7 : a5 54 __ LDA T6 + 1 
11c9 : 85 06 __ STA WORK + 3 
11cb : a5 4e __ LDA T2 + 0 
11cd : 85 07 __ STA WORK + 4 
11cf : 20 00 32 JSR $3200 ; (BLIT_CODE[0] + 0)
11d2 : e6 53 __ INC T6 + 0 
11d4 : d0 02 __ BNE $11d8 ; (bmu_bitblit.s69 + 0)
.s68:
11d6 : e6 54 __ INC T6 + 1 
.s69:
11d8 : a5 53 __ LDA T6 + 0 
11da : 29 07 __ AND #$07
11dc : d0 0d __ BNE $11eb ; (bmu_bitblit.s13 + 0)
.s14:
11de : 18 __ __ CLC
11df : a5 53 __ LDA T6 + 0 
11e1 : 65 43 __ ADC T0 + 0 
11e3 : 85 53 __ STA T6 + 0 
11e5 : a5 54 __ LDA T6 + 1 
11e7 : 65 44 __ ADC T0 + 1 
11e9 : 85 54 __ STA T6 + 1 
.s13:
11eb : c6 47 __ DEC T3 + 0 
11ed : d0 cc __ BNE $11bb ; (bmu_bitblit.l12 + 0)
.s3:
11ef : ad e3 9f LDA $9fe3 ; (bmu_bitblit@stack + 0)
11f2 : 85 53 __ STA T6 + 0 
11f4 : ad e4 9f LDA $9fe4 ; (bmu_bitblit@stack + 1)
11f7 : 85 54 __ STA T6 + 1 
11f9 : ad e5 9f LDA $9fe5 ; (bmu_bitblit@stack + 2)
11fc : 85 55 __ STA T8 + 0 
11fe : 60 __ __ RTS
.s15:
11ff : a5 47 __ LDA T3 + 0 
1201 : f0 ec __ BEQ $11ef ; (bmu_bitblit.s3 + 0)
.l16:
1203 : a5 53 __ LDA T6 + 0 
1205 : 29 07 __ AND #$07
1207 : a8 __ __ TAY
1208 : b1 45 __ LDA (T1 + 0),y 
120a : 85 4e __ STA T2 + 0 
120c : a5 53 __ LDA T6 + 0 
120e : 85 03 __ STA WORK + 0 
1210 : a5 54 __ LDA T6 + 1 
1212 : 85 04 __ STA WORK + 1 
1214 : a5 53 __ LDA T6 + 0 
1216 : 85 05 __ STA WORK + 2 
1218 : a5 54 __ LDA T6 + 1 
121a : 85 06 __ STA WORK + 3 
121c : a5 4e __ LDA T2 + 0 
121e : 85 07 __ STA WORK + 4 
1220 : 20 00 32 JSR $3200 ; (BLIT_CODE[0] + 0)
1223 : e6 53 __ INC T6 + 0 
1225 : d0 02 __ BNE $1229 ; (bmu_bitblit.s67 + 0)
.s66:
1227 : e6 54 __ INC T6 + 1 
.s67:
1229 : a5 53 __ LDA T6 + 0 
122b : 29 07 __ AND #$07
122d : d0 0d __ BNE $123c ; (bmu_bitblit.s17 + 0)
.s18:
122f : 18 __ __ CLC
1230 : a5 53 __ LDA T6 + 0 
1232 : 65 43 __ ADC T0 + 0 
1234 : 85 53 __ STA T6 + 0 
1236 : a5 54 __ LDA T6 + 1 
1238 : 65 44 __ ADC T0 + 1 
123a : 85 54 __ STA T6 + 1 
.s17:
123c : c6 47 __ DEC T3 + 0 
123e : d0 c3 __ BNE $1203 ; (bmu_bitblit.l16 + 0)
1240 : f0 ad __ BEQ $11ef ; (bmu_bitblit.s3 + 0)
.s19:
1242 : 18 __ __ CLC
1243 : a5 55 __ LDA T8 + 0 
1245 : 69 ff __ ADC #$ff
1247 : 2a __ __ ROL
1248 : 2a __ __ ROL
1249 : 2a __ __ ROL
124a : aa __ __ TAX
124b : 29 f8 __ AND #$f8
124d : 85 4e __ STA T2 + 0 
124f : 8a __ __ TXA
1250 : 29 07 __ AND #$07
1252 : 2a __ __ ROL
1253 : 69 f8 __ ADC #$f8
1255 : 85 4f __ STA T2 + 1 
1257 : a5 46 __ LDA T1 + 1 
1259 : 85 48 __ STA T3 + 1 
125b : 05 45 __ ORA T1 + 0 
125d : d0 08 __ BNE $1267 ; (bmu_bitblit.s21 + 0)
.s20:
125f : a5 50 __ LDA T5 + 0 
1261 : 85 47 __ STA T3 + 0 
1263 : a5 51 __ LDA T5 + 1 
1265 : 85 48 __ STA T3 + 1 
.s21:
1267 : ad f5 9f LDA $9ff5 ; (sstack + 12)
126a : 85 45 __ STA T1 + 0 
126c : a5 15 __ LDA P8 
126e : d0 03 __ BNE $1273 ; (bmu_bitblit.s28 + 0)
1270 : 4c f2 12 JMP $12f2 ; (bmu_bitblit.s22 + 0)
.s28:
1273 : 38 __ __ SEC
1274 : a9 00 __ LDA #$00
1276 : e5 43 __ SBC T0 + 0 
1278 : 85 43 __ STA T0 + 0 
127a : a9 00 __ LDA #$00
127c : e5 44 __ SBC T0 + 1 
127e : 85 44 __ STA T0 + 1 
1280 : 38 __ __ SEC
1281 : a9 00 __ LDA #$00
1283 : e5 4e __ SBC T2 + 0 
1285 : 85 4e __ STA T2 + 0 
1287 : a9 00 __ LDA #$00
1289 : e5 4f __ SBC T2 + 1 
128b : 85 4f __ STA T2 + 1 
128d : a5 45 __ LDA T1 + 0 
128f : d0 03 __ BNE $1294 ; (bmu_bitblit.l29 + 0)
1291 : 4c ef 11 JMP $11ef ; (bmu_bitblit.s3 + 0)
.l29:
1294 : a5 50 __ LDA T5 + 0 
1296 : 29 07 __ AND #$07
1298 : d0 0d __ BNE $12a7 ; (bmu_bitblit.s30 + 0)
.s33:
129a : 18 __ __ CLC
129b : a5 50 __ LDA T5 + 0 
129d : 65 4e __ ADC T2 + 0 
129f : 85 50 __ STA T5 + 0 
12a1 : a5 51 __ LDA T5 + 1 
12a3 : 65 4f __ ADC T2 + 1 
12a5 : 85 51 __ STA T5 + 1 
.s30:
12a7 : a5 53 __ LDA T6 + 0 
12a9 : 29 07 __ AND #$07
12ab : d0 0d __ BNE $12ba ; (bmu_bitblit.s31 + 0)
.s32:
12ad : 18 __ __ CLC
12ae : a5 53 __ LDA T6 + 0 
12b0 : 65 43 __ ADC T0 + 0 
12b2 : 85 53 __ STA T6 + 0 
12b4 : a5 54 __ LDA T6 + 1 
12b6 : 65 44 __ ADC T0 + 1 
12b8 : 85 54 __ STA T6 + 1 
.s31:
12ba : 18 __ __ CLC
12bb : a5 53 __ LDA T6 + 0 
12bd : 69 ff __ ADC #$ff
12bf : 85 53 __ STA T6 + 0 
12c1 : 29 07 __ AND #$07
12c3 : a8 __ __ TAY
12c4 : b0 02 __ BCS $12c8 ; (bmu_bitblit.s59 + 0)
.s58:
12c6 : c6 54 __ DEC T6 + 1 
.s59:
12c8 : b1 47 __ LDA (T3 + 0),y 
12ca : 85 49 __ STA T4 + 0 
12cc : a5 50 __ LDA T5 + 0 
12ce : d0 02 __ BNE $12d2 ; (bmu_bitblit.s61 + 0)
.s60:
12d0 : c6 51 __ DEC T5 + 1 
.s61:
12d2 : c6 50 __ DEC T5 + 0 
12d4 : a5 50 __ LDA T5 + 0 
12d6 : 85 03 __ STA WORK + 0 
12d8 : a5 51 __ LDA T5 + 1 
12da : 85 04 __ STA WORK + 1 
12dc : a5 53 __ LDA T6 + 0 
12de : 85 05 __ STA WORK + 2 
12e0 : a5 54 __ LDA T6 + 1 
12e2 : 85 06 __ STA WORK + 3 
12e4 : a5 49 __ LDA T4 + 0 
12e6 : 85 07 __ STA WORK + 4 
12e8 : 20 00 32 JSR $3200 ; (BLIT_CODE[0] + 0)
12eb : c6 45 __ DEC T1 + 0 
12ed : d0 a5 __ BNE $1294 ; (bmu_bitblit.l29 + 0)
12ef : 4c ef 11 JMP $11ef ; (bmu_bitblit.s3 + 0)
.s22:
12f2 : a5 45 __ LDA T1 + 0 
12f4 : f0 f9 __ BEQ $12ef ; (bmu_bitblit.s61 + 29)
.l23:
12f6 : a5 53 __ LDA T6 + 0 
12f8 : 29 07 __ AND #$07
12fa : a8 __ __ TAY
12fb : b1 47 __ LDA (T3 + 0),y 
12fd : 85 49 __ STA T4 + 0 
12ff : a5 50 __ LDA T5 + 0 
1301 : 85 03 __ STA WORK + 0 
1303 : a5 51 __ LDA T5 + 1 
1305 : 85 04 __ STA WORK + 1 
1307 : a5 53 __ LDA T6 + 0 
1309 : 85 05 __ STA WORK + 2 
130b : a5 54 __ LDA T6 + 1 
130d : 85 06 __ STA WORK + 3 
130f : a5 49 __ LDA T4 + 0 
1311 : 85 07 __ STA WORK + 4 
1313 : 20 00 32 JSR $3200 ; (BLIT_CODE[0] + 0)
1316 : e6 50 __ INC T5 + 0 
1318 : d0 02 __ BNE $131c ; (bmu_bitblit.s63 + 0)
.s62:
131a : e6 51 __ INC T5 + 1 
.s63:
131c : a5 50 __ LDA T5 + 0 
131e : 29 07 __ AND #$07
1320 : d0 0d __ BNE $132f ; (bmu_bitblit.s24 + 0)
.s27:
1322 : 18 __ __ CLC
1323 : a5 50 __ LDA T5 + 0 
1325 : 65 4e __ ADC T2 + 0 
1327 : 85 50 __ STA T5 + 0 
1329 : a5 51 __ LDA T5 + 1 
132b : 65 4f __ ADC T2 + 1 
132d : 85 51 __ STA T5 + 1 
.s24:
132f : e6 53 __ INC T6 + 0 
1331 : d0 02 __ BNE $1335 ; (bmu_bitblit.s65 + 0)
.s64:
1333 : e6 54 __ INC T6 + 1 
.s65:
1335 : a5 53 __ LDA T6 + 0 
1337 : 29 07 __ AND #$07
1339 : d0 0d __ BNE $1348 ; (bmu_bitblit.s25 + 0)
.s26:
133b : 18 __ __ CLC
133c : a5 53 __ LDA T6 + 0 
133e : 65 43 __ ADC T0 + 0 
1340 : 85 53 __ STA T6 + 0 
1342 : a5 54 __ LDA T6 + 1 
1344 : 65 44 __ ADC T0 + 1 
1346 : 85 54 __ STA T6 + 1 
.s25:
1348 : c6 45 __ DEC T1 + 0 
134a : d0 aa __ BNE $12f6 ; (bmu_bitblit.l23 + 0)
134c : 4c ef 11 JMP $11ef ; (bmu_bitblit.s3 + 0)
.s36:
134f : 18 __ __ CLC
1350 : a5 11 __ LDA P4 
1352 : 69 e1 __ ADC #$e1
1354 : 2a __ __ ROL
1355 : 2a __ __ ROL
1356 : 2a __ __ ROL
1357 : a8 __ __ TAY
1358 : 29 f8 __ AND #$f8
135a : 85 45 __ STA T1 + 0 
135c : 98 __ __ TYA
135d : 29 07 __ AND #$07
135f : 2a __ __ ROL
1360 : 69 f8 __ ADC #$f8
1362 : 85 46 __ STA T1 + 1 
1364 : 18 __ __ CLC
1365 : a5 53 __ LDA T6 + 0 
1367 : 65 45 __ ADC T1 + 0 
1369 : 85 53 __ STA T6 + 0 
136b : a5 54 __ LDA T6 + 1 
136d : 65 46 __ ADC T1 + 1 
136f : 85 54 __ STA T6 + 1 
1371 : a5 13 __ LDA P6 
1373 : 85 12 __ STA P5 
1375 : a5 4c __ LDA T10 + 0 
1377 : 85 13 __ STA P6 
1379 : 18 __ __ CLC
137a : a5 49 __ LDA T4 + 0 
137c : 65 45 __ ADC T1 + 0 
137e : 85 50 __ STA T5 + 0 
1380 : 8a __ __ TXA
1381 : 65 46 __ ADC T1 + 1 
1383 : 85 51 __ STA T5 + 1 
1385 : 24 43 __ BIT T0 + 0 
1387 : 30 03 __ BMI $138c ; (bmu_bitblit.s37 + 0)
1389 : 4c 77 11 JMP $1177 ; (bmu_bitblit.s8 + 0)
.s37:
138c : 18 __ __ CLC
138d : a5 50 __ LDA T5 + 0 
138f : 69 08 __ ADC #$08
1391 : 85 50 __ STA T5 + 0 
1393 : 90 f4 __ BCC $1389 ; (bmu_bitblit.s36 + 58)
.s57:
1395 : e6 51 __ INC T5 + 1 
1397 : 4c 77 11 JMP $1177 ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
139a : a5 15 __ LDA P8 ; (reverse + 0)
139c : f0 16 __ BEQ $13b4 ; (builddop.s5 + 0)
.s48:
139e : a9 38 __ LDA #$38
13a0 : 85 48 __ STA T9 + 0 
13a2 : a9 e1 __ LDA #$e1
13a4 : 85 49 __ STA T10 + 0 
13a6 : a9 b0 __ LDA #$b0
13a8 : 85 4a __ STA T11 + 0 
13aa : a9 c2 __ LDA #$c2
13ac : 85 4b __ STA T12 + 0 
13ae : a9 f8 __ LDA #$f8
13b0 : 85 44 __ STA T3 + 0 
13b2 : d0 16 __ BNE $13ca ; (builddop.s6 + 0)
.s5:
13b4 : a9 18 __ LDA #$18
13b6 : 85 48 __ STA T9 + 0 
13b8 : a9 61 __ LDA #$61
13ba : 85 49 __ STA T10 + 0 
13bc : a9 90 __ LDA #$90
13be : 85 4a __ STA T11 + 0 
13c0 : a9 e2 __ LDA #$e2
13c2 : 85 4b __ STA T12 + 0 
13c4 : a9 00 __ LDA #$00
13c6 : 85 44 __ STA T3 + 0 
13c8 : a9 08 __ LDA #$08
.s6:
13ca : 85 47 __ STA T6 + 0 
13cc : a5 14 __ LDA P7 ; (op + 0)
13ce : 29 08 __ AND #$08
13d0 : 85 45 __ STA T4 + 0 
13d2 : a5 14 __ LDA P7 ; (op + 0)
13d4 : 29 10 __ AND #$10
13d6 : 85 46 __ STA T5 + 0 
13d8 : a5 11 __ LDA P4 ; (w + 0)
13da : d0 06 __ BNE $13e2 ; (builddop.s8 + 0)
.s7:
13dc : a5 13 __ LDA P6 ; (rmask + 0)
13de : 25 12 __ AND P5 ; (lmask + 0)
13e0 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
13e2 : a9 a0 __ LDA #$a0
13e4 : 8d 00 32 STA $3200 ; (BLIT_CODE[0] + 0)
13e7 : a5 44 __ LDA T3 + 0 
13e9 : 8d 01 32 STA $3201 ; (BLIT_CODE[0] + 1)
13ec : a9 02 __ LDA #$02
13ee : 85 43 __ STA T0 + 0 
13f0 : a6 12 __ LDX P5 ; (lmask + 0)
13f2 : e8 __ __ INX
13f3 : d0 03 __ BNE $13f8 ; (builddop.s9 + 0)
13f5 : 4c 2b 16 JMP $162b ; (builddop.s44 + 0)
.s9:
13f8 : a5 46 __ LDA T5 + 0 
13fa : f0 18 __ BEQ $1414 ; (builddop.s10 + 0)
.s43:
13fc : a9 b1 __ LDA #$b1
13fe : 8d 02 32 STA $3202 ; (BLIT_CODE[0] + 2)
1401 : a9 05 __ LDA #$05
1403 : 8d 03 32 STA $3203 ; (BLIT_CODE[0] + 3)
1406 : a9 85 __ LDA #$85
1408 : 8d 04 32 STA $3204 ; (BLIT_CODE[0] + 4)
140b : a9 0a __ LDA #$0a
140d : 8d 05 32 STA $3205 ; (BLIT_CODE[0] + 5)
1410 : a9 06 __ LDA #$06
1412 : 85 43 __ STA T0 + 0 
.s10:
1414 : a5 45 __ LDA T4 + 0 
1416 : d0 05 __ BNE $141d ; (builddop.s40 + 0)
.s11:
1418 : a5 43 __ LDA T0 + 0 
141a : 4c 7e 14 JMP $147e ; (builddop.s52 + 0)
.s40:
141d : a5 10 __ LDA P3 ; (shift + 0)
141f : 85 0e __ STA P1 
1421 : d0 05 __ BNE $1428 ; (builddop.s42 + 0)
.s41:
1423 : a5 43 __ LDA T0 + 0 
1425 : 4c 75 14 JMP $1475 ; (builddop.s51 + 0)
.s42:
1428 : a9 b1 __ LDA #$b1
142a : a6 43 __ LDX T0 + 0 
142c : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
142f : a9 03 __ LDA #$03
1431 : 9d 01 32 STA $3201,x ; (BLIT_CODE[0] + 1)
1434 : 9d 06 32 STA $3206,x ; (BLIT_CODE[0] + 6)
1437 : 9d 0a 32 STA $320a,x ; (BLIT_CODE[0] + 10)
143a : a9 85 __ LDA #$85
143c : 9d 02 32 STA $3202,x ; (BLIT_CODE[0] + 2)
143f : 9d 09 32 STA $3209,x ; (BLIT_CODE[0] + 9)
1442 : a9 08 __ LDA #$08
1444 : 9d 03 32 STA $3203,x ; (BLIT_CODE[0] + 3)
1447 : 9d 08 32 STA $3208,x ; (BLIT_CODE[0] + 8)
144a : a9 a5 __ LDA #$a5
144c : 9d 05 32 STA $3205,x ; (BLIT_CODE[0] + 5)
144f : a9 02 __ LDA #$02
1451 : 9d 0c 32 STA $320c,x ; (BLIT_CODE[0] + 12)
1454 : a9 04 __ LDA #$04
1456 : 9d 0e 32 STA $320e,x ; (BLIT_CODE[0] + 14)
1459 : a5 48 __ LDA T9 + 0 
145b : 9d 04 32 STA $3204,x ; (BLIT_CODE[0] + 4)
145e : a5 49 __ LDA T10 + 0 
1460 : 09 08 __ ORA #$08
1462 : 9d 07 32 STA $3207,x ; (BLIT_CODE[0] + 7)
1465 : a5 4a __ LDA T11 + 0 
1467 : 9d 0b 32 STA $320b,x ; (BLIT_CODE[0] + 11)
146a : a5 4b __ LDA T12 + 0 
146c : 09 04 __ ORA #$04
146e : 9d 0d 32 STA $320d,x ; (BLIT_CODE[0] + 13)
1471 : 8a __ __ TXA
1472 : 18 __ __ CLC
1473 : 69 0f __ ADC #$0f
.s51:
1475 : 85 0d __ STA P0 
1477 : a5 15 __ LDA P8 ; (reverse + 0)
1479 : 85 0f __ STA P2 
147b : 20 8c 16 JSR $168c ; (builddop_src.s4 + 0)
.s52:
147e : 85 0d __ STA P0 
1480 : a5 14 __ LDA P7 ; (op + 0)
1482 : 85 0e __ STA P1 
1484 : a5 12 __ LDA P5 ; (lmask + 0)
1486 : 49 ff __ EOR #$ff
1488 : 85 0f __ STA P2 
148a : 20 cc 17 JSR $17cc ; (builddop_op.s4 + 0)
148d : 85 43 __ STA T0 + 0 
148f : a5 11 __ LDA P4 ; (w + 0)
1491 : f0 68 __ BEQ $14fb ; (builddop.s12 + 0)
.s13:
1493 : a9 a0 __ LDA #$a0
1495 : a6 43 __ LDX T0 + 0 
1497 : e8 __ __ INX
1498 : e8 __ __ INX
1499 : 86 43 __ STX T0 + 0 
149b : 86 0d __ STX P0 
149d : 9d fe 31 STA $31fe,x 
14a0 : 18 __ __ CLC
14a1 : a5 47 __ LDA T6 + 0 
14a3 : 65 44 __ ADC T3 + 0 
14a5 : 85 44 __ STA T3 + 0 
14a7 : 9d ff 31 STA $31ff,x 
.s14:
14aa : a5 11 __ LDA P4 ; (w + 0)
14ac : c9 02 __ CMP #$02
14ae : b0 53 __ BCS $1503 ; (builddop.s21 + 0)
.s15:
14b0 : a5 13 __ LDA P6 ; (rmask + 0)
14b2 : f0 47 __ BEQ $14fb ; (builddop.s12 + 0)
.s16:
14b4 : a5 46 __ LDA T5 + 0 
14b6 : f0 1e __ BEQ $14d6 ; (builddop.s17 + 0)
.s20:
14b8 : a9 b1 __ LDA #$b1
14ba : a6 43 __ LDX T0 + 0 
14bc : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
14bf : a9 05 __ LDA #$05
14c1 : 9d 01 32 STA $3201,x ; (BLIT_CODE[0] + 1)
14c4 : a9 85 __ LDA #$85
14c6 : 9d 02 32 STA $3202,x ; (BLIT_CODE[0] + 2)
14c9 : a9 0a __ LDA #$0a
14cb : 9d 03 32 STA $3203,x ; (BLIT_CODE[0] + 3)
14ce : 8a __ __ TXA
14cf : 18 __ __ CLC
14d0 : 69 04 __ ADC #$04
14d2 : 85 43 __ STA T0 + 0 
14d4 : 85 0d __ STA P0 
.s17:
14d6 : a5 45 __ LDA T4 + 0 
14d8 : d0 05 __ BNE $14df ; (builddop.s19 + 0)
.s18:
14da : a5 43 __ LDA T0 + 0 
14dc : 4c ea 14 JMP $14ea ; (builddop.s50 + 0)
.s19:
14df : a5 10 __ LDA P3 ; (shift + 0)
14e1 : 85 0e __ STA P1 
14e3 : a5 15 __ LDA P8 ; (reverse + 0)
14e5 : 85 0f __ STA P2 
14e7 : 20 8c 16 JSR $168c ; (builddop_src.s4 + 0)
.s50:
14ea : 85 0d __ STA P0 
14ec : a5 14 __ LDA P7 ; (op + 0)
14ee : 85 0e __ STA P1 
14f0 : a5 13 __ LDA P6 ; (rmask + 0)
14f2 : 49 ff __ EOR #$ff
14f4 : 85 0f __ STA P2 
14f6 : 20 cc 17 JSR $17cc ; (builddop_op.s4 + 0)
14f9 : 85 43 __ STA T0 + 0 
.s12:
14fb : a9 60 __ LDA #$60
14fd : a6 43 __ LDX T0 + 0 
14ff : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
.s3:
1502 : 60 __ __ RTS
.s21:
1503 : a9 02 __ LDA #$02
1505 : c5 11 __ CMP P4 ; (w + 0)
1507 : a9 00 __ LDA #$00
1509 : 6a __ __ ROR
150a : 85 4c __ STA T14 + 0 
150c : d0 19 __ BNE $1527 ; (builddop.s22 + 0)
.s39:
150e : a9 a2 __ LDA #$a2
1510 : a6 43 __ LDX T0 + 0 
1512 : e8 __ __ INX
1513 : e8 __ __ INX
1514 : 86 43 __ STX T0 + 0 
1516 : 9d fe 31 STA $31fe,x 
1519 : 38 __ __ SEC
151a : a5 11 __ LDA P4 ; (w + 0)
151c : e9 01 __ SBC #$01
151e : 9d ff 31 STA $31ff,x 
1521 : a5 11 __ LDA P4 ; (w + 0)
1523 : c9 20 __ CMP #$20
1525 : b0 0d __ BCS $1534 ; (builddop.s24 + 0)
.s22:
1527 : a5 10 __ LDA P3 ; (shift + 0)
1529 : d0 09 __ BNE $1534 ; (builddop.s24 + 0)
.s23:
152b : a5 48 __ LDA T9 + 0 
152d : a6 43 __ LDX T0 + 0 
152f : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
1532 : e6 43 __ INC T0 + 0 
.s24:
1534 : a6 43 __ LDX T0 + 0 
1536 : 86 4d __ STX T15 + 0 
1538 : a5 46 __ LDA T5 + 0 
153a : f0 1a __ BEQ $1556 ; (builddop.s25 + 0)
.s38:
153c : a9 b1 __ LDA #$b1
153e : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
1541 : a9 05 __ LDA #$05
1543 : 9d 01 32 STA $3201,x ; (BLIT_CODE[0] + 1)
1546 : a9 85 __ LDA #$85
1548 : 9d 02 32 STA $3202,x ; (BLIT_CODE[0] + 2)
154b : a9 0a __ LDA #$0a
154d : 9d 03 32 STA $3203,x ; (BLIT_CODE[0] + 3)
1550 : 8a __ __ TXA
1551 : 18 __ __ CLC
1552 : 69 04 __ ADC #$04
1554 : 85 43 __ STA T0 + 0 
.s25:
1556 : a5 45 __ LDA T4 + 0 
1558 : d0 05 __ BNE $155f ; (builddop.s37 + 0)
.s26:
155a : a5 43 __ LDA T0 + 0 
155c : 4c 6e 15 JMP $156e ; (builddop.s49 + 0)
.s37:
155f : a5 43 __ LDA T0 + 0 
1561 : 85 0d __ STA P0 
1563 : a5 10 __ LDA P3 ; (shift + 0)
1565 : 85 0e __ STA P1 
1567 : a5 15 __ LDA P8 ; (reverse + 0)
1569 : 85 0f __ STA P2 
156b : 20 8c 16 JSR $168c ; (builddop_src.s4 + 0)
.s49:
156e : 85 0d __ STA P0 
1570 : a5 14 __ LDA P7 ; (op + 0)
1572 : 85 0e __ STA P1 
1574 : a9 00 __ LDA #$00
1576 : 85 0f __ STA P2 
1578 : 20 cc 17 JSR $17cc ; (builddop_op.s4 + 0)
157b : 24 4c __ BIT T14 + 0 
157d : 10 17 __ BPL $1596 ; (builddop.s28 + 0)
.s27:
157f : aa __ __ TAX
1580 : e8 __ __ INX
1581 : e8 __ __ INX
1582 : 86 43 __ STX T0 + 0 
1584 : 86 0d __ STX P0 
1586 : a9 a0 __ LDA #$a0
1588 : 9d fe 31 STA $31fe,x 
158b : 18 __ __ CLC
158c : a5 47 __ LDA T6 + 0 
158e : 65 44 __ ADC T3 + 0 
1590 : 9d ff 31 STA $31ff,x 
1593 : 4c b0 14 JMP $14b0 ; (builddop.s15 + 0)
.s28:
1596 : a8 __ __ TAY
1597 : a9 1f __ LDA #$1f
1599 : c5 11 __ CMP P4 ; (w + 0)
159b : a9 00 __ LDA #$00
159d : 6a __ __ ROR
159e : 85 47 __ STA T6 + 0 
15a0 : f0 04 __ BEQ $15a6 ; (builddop.s36 + 0)
.s29:
15a2 : a5 10 __ LDA P3 ; (shift + 0)
15a4 : f0 06 __ BEQ $15ac ; (builddop.s30 + 0)
.s36:
15a6 : a5 48 __ LDA T9 + 0 
15a8 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
15ab : c8 __ __ INY
.s30:
15ac : a9 98 __ LDA #$98
15ae : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
15b1 : a9 08 __ LDA #$08
15b3 : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
15b6 : a9 a8 __ LDA #$a8
15b8 : 99 03 32 STA $3203,y ; (BLIT_CODE[0] + 3)
15bb : a5 49 __ LDA T10 + 0 
15bd : 09 08 __ ORA #$08
15bf : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
15c2 : 98 __ __ TYA
15c3 : 18 __ __ CLC
15c4 : 69 04 __ ADC #$04
15c6 : 85 43 __ STA T0 + 0 
15c8 : 24 47 __ BIT T6 + 0 
15ca : 30 3a __ BMI $1606 ; (builddop.s31 + 0)
.s32:
15cc : a5 4a __ LDA T11 + 0 
15ce : 99 04 32 STA $3204,y ; (BLIT_CODE[0] + 4)
15d1 : a5 4b __ LDA T12 + 0 
15d3 : 09 04 __ ORA #$04
15d5 : aa __ __ TAX
15d6 : a5 45 __ LDA T4 + 0 
15d8 : d0 0d __ BNE $15e7 ; (builddop.s35 + 0)
.s33:
15da : a9 02 __ LDA #$02
15dc : 99 05 32 STA $3205,y ; (BLIT_CODE[0] + 5)
15df : 18 __ __ CLC
15e0 : a5 43 __ LDA T0 + 0 
15e2 : 69 02 __ ADC #$02
15e4 : 4c f8 15 JMP $15f8 ; (builddop.s34 + 0)
.s35:
15e7 : a9 04 __ LDA #$04
15e9 : 99 05 32 STA $3205,y ; (BLIT_CODE[0] + 5)
15ec : 99 07 32 STA $3207,y ; (BLIT_CODE[0] + 7)
15ef : 8a __ __ TXA
15f0 : 99 06 32 STA $3206,y ; (BLIT_CODE[0] + 6)
15f3 : 18 __ __ CLC
15f4 : a5 43 __ LDA T0 + 0 
15f6 : 69 04 __ ADC #$04
.s34:
15f8 : a8 __ __ TAY
15f9 : c8 __ __ INY
15fa : c8 __ __ INY
15fb : 84 43 __ STY T0 + 0 
15fd : 8a __ __ TXA
15fe : 99 fe 31 STA $31fe,y 
1601 : a9 06 __ LDA #$06
1603 : 99 ff 31 STA $31ff,y 
.s31:
1606 : a9 ca __ LDA #$ca
1608 : a4 43 __ LDY T0 + 0 
160a : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
160d : a9 d0 __ LDA #$d0
160f : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
1612 : 98 __ __ TYA
1613 : 18 __ __ CLC
1614 : 69 01 __ ADC #$01
1616 : aa __ __ TAX
1617 : e8 __ __ INX
1618 : e8 __ __ INX
1619 : 86 43 __ STX T0 + 0 
161b : 86 0d __ STX P0 
161d : 49 ff __ EOR #$ff
161f : 38 __ __ SEC
1620 : 65 4d __ ADC T15 + 0 
1622 : 38 __ __ SEC
1623 : e9 02 __ SBC #$02
1625 : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
1628 : 4c b0 14 JMP $14b0 ; (builddop.s15 + 0)
.s44:
162b : 85 0d __ STA P0 
162d : a5 45 __ LDA T4 + 0 
162f : f0 51 __ BEQ $1682 ; (builddop.s45 + 0)
.s46:
1631 : a5 10 __ LDA P3 ; (shift + 0)
1633 : f0 4d __ BEQ $1682 ; (builddop.s45 + 0)
.s47:
1635 : a9 03 __ LDA #$03
1637 : 8d 03 32 STA $3203 ; (BLIT_CODE[0] + 3)
163a : 8d 08 32 STA $3208 ; (BLIT_CODE[0] + 8)
163d : 8d 0c 32 STA $320c ; (BLIT_CODE[0] + 12)
1640 : a9 b1 __ LDA #$b1
1642 : 8d 02 32 STA $3202 ; (BLIT_CODE[0] + 2)
1645 : a9 85 __ LDA #$85
1647 : 8d 04 32 STA $3204 ; (BLIT_CODE[0] + 4)
164a : 8d 0b 32 STA $320b ; (BLIT_CODE[0] + 11)
164d : a9 08 __ LDA #$08
164f : 8d 05 32 STA $3205 ; (BLIT_CODE[0] + 5)
1652 : 8d 0a 32 STA $320a ; (BLIT_CODE[0] + 10)
1655 : a9 a5 __ LDA #$a5
1657 : 8d 07 32 STA $3207 ; (BLIT_CODE[0] + 7)
165a : a9 02 __ LDA #$02
165c : 8d 0e 32 STA $320e ; (BLIT_CODE[0] + 14)
165f : a9 04 __ LDA #$04
1661 : 8d 10 32 STA $3210 ; (BLIT_CODE[0] + 16)
1664 : a5 48 __ LDA T9 + 0 
1666 : 8d 06 32 STA $3206 ; (BLIT_CODE[0] + 6)
1669 : a5 49 __ LDA T10 + 0 
166b : 09 08 __ ORA #$08
166d : 8d 09 32 STA $3209 ; (BLIT_CODE[0] + 9)
1670 : a5 4a __ LDA T11 + 0 
1672 : 8d 0d 32 STA $320d ; (BLIT_CODE[0] + 13)
1675 : a5 4b __ LDA T12 + 0 
1677 : 09 04 __ ORA #$04
1679 : 8d 0f 32 STA $320f ; (BLIT_CODE[0] + 15)
167c : a9 11 __ LDA #$11
167e : 85 43 __ STA T0 + 0 
1680 : 85 0d __ STA P0 
.s45:
1682 : e6 11 __ INC P4 ; (w + 0)
1684 : d0 03 __ BNE $1689 ; (builddop.s45 + 7)
1686 : 4c fb 14 JMP $14fb ; (builddop.s12 + 0)
1689 : 4c aa 14 JMP $14aa ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
168c : a6 0d __ LDX P0 ; (ip + 0)
168e : e8 __ __ INX
168f : a4 0d __ LDY P0 ; (ip + 0)
1691 : e8 __ __ INX
1692 : a5 0e __ LDA P1 ; (shift + 0)
1694 : d0 0c __ BNE $16a2 ; (builddop_src.s6 + 0)
.s5:
1696 : a9 b1 __ LDA #$b1
1698 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
169b : a9 03 __ LDA #$03
169d : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
16a0 : 8a __ __ TXA
.s3:
16a1 : 60 __ __ RTS
.s6:
16a2 : a9 a5 __ LDA #$a5
16a4 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
16a7 : a9 08 __ LDA #$08
16a9 : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
16ac : a5 0f __ LDA P2 ; (reverse + 0)
16ae : f0 03 __ BEQ $16b3 ; (builddop_src.s7 + 0)
16b0 : 4c be 17 JMP $17be ; (builddop_src.s26 + 0)
.s7:
16b3 : a5 0e __ LDA P1 ; (shift + 0)
16b5 : c9 05 __ CMP #$05
16b7 : b0 06 __ BCS $16bf ; (builddop_src.s8 + 0)
.s24:
16b9 : a9 4a __ LDA #$4a
.s25:
16bb : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
16be : e8 __ __ INX
.s8:
16bf : a9 85 __ LDA #$85
16c1 : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
16c4 : 9d 04 32 STA $3204,x ; (BLIT_CODE[0] + 4)
16c7 : a9 09 __ LDA #$09
16c9 : 9d 01 32 STA $3201,x ; (BLIT_CODE[0] + 1)
16cc : a9 b1 __ LDA #$b1
16ce : 9d 02 32 STA $3202,x ; (BLIT_CODE[0] + 2)
16d1 : a9 03 __ LDA #$03
16d3 : 9d 03 32 STA $3203,x ; (BLIT_CODE[0] + 3)
16d6 : a9 08 __ LDA #$08
16d8 : 9d 05 32 STA $3205,x ; (BLIT_CODE[0] + 5)
16db : 8a __ __ TXA
16dc : 18 __ __ CLC
16dd : 69 06 __ ADC #$06
16df : 85 1b __ STA ACCU + 0 
16e1 : a8 __ __ TAY
16e2 : a5 0f __ LDA P2 ; (reverse + 0)
16e4 : d0 72 __ BNE $1758 ; (builddop_src.s17 + 0)
.s9:
16e6 : a5 0e __ LDA P1 ; (shift + 0)
16e8 : c9 05 __ CMP #$05
16ea : 90 0b __ BCC $16f7 ; (builddop_src.s10 + 0)
.s13:
16ec : a9 0a __ LDA #$0a
16ee : 9d 06 32 STA $3206,x ; (BLIT_CODE[0] + 6)
16f1 : e6 1b __ INC ACCU + 0 
16f3 : a6 0e __ LDX P1 ; (shift + 0)
16f5 : b0 25 __ BCS $171c ; (builddop_src.l14 + 0)
.s10:
16f7 : c9 02 __ CMP #$02
16f9 : 90 19 __ BCC $1714 ; (builddop_src.s11 + 0)
.s12:
16fb : c6 0e __ DEC P1 ; (shift + 0)
16fd : a6 0e __ LDX P1 ; (shift + 0)
.l29:
16ff : a9 6a __ LDA #$6a
1701 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
1704 : a9 46 __ LDA #$46
1706 : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
1709 : a9 09 __ LDA #$09
170b : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
170e : c8 __ __ INY
170f : c8 __ __ INY
1710 : c8 __ __ INY
1711 : ca __ __ DEX
1712 : d0 eb __ BNE $16ff ; (builddop_src.l29 + 0)
.s11:
1714 : a9 6a __ LDA #$6a
.s30:
1716 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
1719 : c8 __ __ INY
171a : 98 __ __ TYA
171b : 60 __ __ RTS
.l14:
171c : a5 1b __ LDA ACCU + 0 
171e : 85 1d __ STA ACCU + 2 
1720 : 85 1c __ STA ACCU + 1 
1722 : a8 __ __ TAY
1723 : 18 __ __ CLC
1724 : 69 03 __ ADC #$03
1726 : 85 1b __ STA ACCU + 0 
1728 : e0 07 __ CPX #$07
172a : b0 16 __ BCS $1742 ; (builddop_src.s15 + 0)
.s16:
172c : a9 26 __ LDA #$26
172e : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
1731 : a9 09 __ LDA #$09
1733 : a4 1d __ LDY ACCU + 2 
1735 : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
1738 : a9 0a __ LDA #$0a
173a : a4 1c __ LDY ACCU + 1 
173c : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
173f : e8 __ __ INX
1740 : 90 da __ BCC $171c ; (builddop_src.l14 + 0)
.s15:
1742 : a9 a5 __ LDA #$a5
1744 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
1747 : a9 09 __ LDA #$09
1749 : a6 1d __ LDX ACCU + 2 
174b : 9d 01 32 STA $3201,x ; (BLIT_CODE[0] + 1)
174e : a9 2a __ LDA #$2a
1750 : a6 1c __ LDX ACCU + 1 
1752 : 9d 02 32 STA $3202,x ; (BLIT_CODE[0] + 2)
1755 : a5 1b __ LDA ACCU + 0 
1757 : 60 __ __ RTS
.s17:
1758 : a5 0e __ LDA P1 ; (shift + 0)
175a : c9 05 __ CMP #$05
175c : b0 3e __ BCS $179c ; (builddop_src.s21 + 0)
.s18:
175e : a9 4a __ LDA #$4a
1760 : 9d 06 32 STA $3206,x ; (BLIT_CODE[0] + 6)
1763 : e6 1b __ INC ACCU + 0 
1765 : a6 0e __ LDX P1 ; (shift + 0)
1767 : e0 02 __ CPX #$02
1769 : 90 1b __ BCC $1786 ; (builddop_src.s19 + 0)
.s20:
176b : a4 1b __ LDY ACCU + 0 
.l28:
176d : a9 66 __ LDA #$66
176f : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
1772 : a9 09 __ LDA #$09
1774 : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
1777 : a9 4a __ LDA #$4a
1779 : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
177c : 98 __ __ TYA
177d : 18 __ __ CLC
177e : 69 03 __ ADC #$03
1780 : a8 __ __ TAY
1781 : ca __ __ DEX
1782 : d0 e9 __ BNE $176d ; (builddop_src.l28 + 0)
.s31:
1784 : 85 1b __ STA ACCU + 0 
.s19:
1786 : a9 a5 __ LDA #$a5
1788 : a6 1b __ LDX ACCU + 0 
178a : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
178d : a9 09 __ LDA #$09
178f : 9d 01 32 STA $3201,x ; (BLIT_CODE[0] + 1)
1792 : a9 6a __ LDA #$6a
1794 : 9d 02 32 STA $3202,x ; (BLIT_CODE[0] + 2)
1797 : 8a __ __ TXA
1798 : 18 __ __ CLC
1799 : 69 03 __ ADC #$03
179b : 60 __ __ RTS
.s21:
179c : c9 07 __ CMP #$07
179e : b0 19 __ BCS $17b9 ; (builddop_src.s22 + 0)
.s23:
17a0 : aa __ __ TAX
.l32:
17a1 : a9 2a __ LDA #$2a
17a3 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
17a6 : a9 06 __ LDA #$06
17a8 : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
17ab : a9 09 __ LDA #$09
17ad : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
17b0 : 98 __ __ TYA
17b1 : 69 03 __ ADC #$03
17b3 : e8 __ __ INX
17b4 : e0 07 __ CPX #$07
17b6 : a8 __ __ TAY
17b7 : 90 e8 __ BCC $17a1 ; (builddop_src.l32 + 0)
.s22:
17b9 : a9 2a __ LDA #$2a
17bb : 4c 16 17 JMP $1716 ; (builddop_src.s30 + 0)
.s26:
17be : a5 0e __ LDA P1 ; (shift + 0)
17c0 : c9 05 __ CMP #$05
17c2 : b0 03 __ BCS $17c7 ; (builddop_src.s27 + 0)
17c4 : 4c bf 16 JMP $16bf ; (builddop_src.s8 + 0)
.s27:
17c7 : a9 0a __ LDA #$0a
17c9 : 4c bb 16 JMP $16bb ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
17cc : a5 0e __ LDA P1 ; (op + 0)
17ce : 29 20 __ AND #$20
17d0 : f0 04 __ BEQ $17d6 ; (builddop_op.s27 + 0)
.s28:
17d2 : a9 07 __ LDA #$07
17d4 : d0 02 __ BNE $17d8 ; (builddop_op.s29 + 0)
.s27:
17d6 : a9 0a __ LDA #$0a
.s29:
17d8 : 85 1c __ STA ACCU + 1 
17da : a5 0e __ LDA P1 ; (op + 0)
17dc : 29 03 __ AND #$03
17de : 85 1b __ STA ACCU + 0 
17e0 : a5 0e __ LDA P1 ; (op + 0)
17e2 : 29 04 __ AND #$04
17e4 : f0 03 __ BEQ $17e9 ; (builddop_op.s5 + 0)
17e6 : 4c 7c 18 JMP $187c ; (builddop_op.s18 + 0)
.s5:
17e9 : a5 0e __ LDA P1 ; (op + 0)
17eb : 29 08 __ AND #$08
17ed : d0 13 __ BNE $1802 ; (builddop_op.s15 + 0)
.s6:
17ef : a9 a5 __ LDA #$a5
17f1 : a4 0d __ LDY P0 ; (ip + 0)
17f3 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
17f6 : a5 1c __ LDA ACCU + 1 
.s7:
17f8 : c8 __ __ INY
17f9 : c8 __ __ INY
17fa : 84 0d __ STY P0 ; (ip + 0)
17fc : 99 ff 31 STA $31ff,y 
17ff : 4c 12 18 JMP $1812 ; (builddop_op.s16 + 0)
.s15:
1802 : a5 0e __ LDA P1 ; (op + 0)
1804 : 0a __ __ ASL
1805 : 10 0b __ BPL $1812 ; (builddop_op.s16 + 0)
.s17:
1807 : a9 49 __ LDA #$49
1809 : a4 0d __ LDY P0 ; (ip + 0)
180b : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
180e : a9 ff __ LDA #$ff
1810 : d0 e6 __ BNE $17f8 ; (builddop_op.s7 + 0)
.s16:
1812 : a6 1b __ LDX ACCU + 0 
1814 : f0 13 __ BEQ $1829 ; (builddop_op.s8 + 0)
.s14:
1816 : a5 1c __ LDA ACCU + 1 
1818 : a4 0d __ LDY P0 ; (ip + 0)
181a : c8 __ __ INY
181b : c8 __ __ INY
181c : 84 0d __ STY P0 ; (ip + 0)
181e : 99 ff 31 STA $31ff,y 
1821 : bd 38 31 LDA $3138,x ; (blitops_op[0] + 0)
1824 : 09 04 __ ORA #$04
1826 : 99 fe 31 STA $31fe,y 
.s8:
1829 : a5 0f __ LDA P2 ; (mask + 0)
182b : f0 3f __ BEQ $186c ; (builddop_op.s9 + 0)
.s10:
182d : a9 85 __ LDA #$85
182f : a4 0d __ LDY P0 ; (ip + 0)
1831 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
1834 : a9 09 __ LDA #$09
1836 : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
1839 : 98 __ __ TYA
183a : 18 __ __ CLC
183b : 69 08 __ ADC #$08
183d : 85 0d __ STA P0 ; (ip + 0)
183f : a5 0e __ LDA P1 ; (op + 0)
1841 : 29 10 __ AND #$10
1843 : f0 09 __ BEQ $184e ; (builddop_op.s11 + 0)
.s13:
1845 : a9 45 __ LDA #$45
1847 : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
184a : a9 0a __ LDA #$0a
184c : d0 07 __ BNE $1855 ; (builddop_op.s12 + 0)
.s11:
184e : a9 51 __ LDA #$51
1850 : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
1853 : a9 05 __ LDA #$05
.s12:
1855 : 99 03 32 STA $3203,y ; (BLIT_CODE[0] + 3)
1858 : a9 29 __ LDA #$29
185a : 99 04 32 STA $3204,y ; (BLIT_CODE[0] + 4)
185d : a5 0f __ LDA P2 ; (mask + 0)
185f : 99 05 32 STA $3205,y ; (BLIT_CODE[0] + 5)
1862 : a9 45 __ LDA #$45
1864 : 99 06 32 STA $3206,y ; (BLIT_CODE[0] + 6)
1867 : a9 09 __ LDA #$09
1869 : 99 07 32 STA $3207,y ; (BLIT_CODE[0] + 7)
.s9:
186c : a9 91 __ LDA #$91
186e : a6 0d __ LDX P0 ; (ip + 0)
1870 : 9d 00 32 STA $3200,x ; (BLIT_CODE[0] + 0)
1873 : a9 05 __ LDA #$05
1875 : 9d 01 32 STA $3201,x ; (BLIT_CODE[0] + 1)
1878 : e8 __ __ INX
1879 : e8 __ __ INX
187a : 8a __ __ TXA
.s3:
187b : 60 __ __ RTS
.s18:
187c : a5 1b __ LDA ACCU + 0 
187e : d0 04 __ BNE $1884 ; (builddop_op.s20 + 0)
.s19:
1880 : a5 0f __ LDA P2 ; (mask + 0)
1882 : d0 14 __ BNE $1898 ; (builddop_op.s23 + 0)
.s20:
1884 : a5 0e __ LDA P1 ; (op + 0)
1886 : 29 40 __ AND #$40
1888 : f0 02 __ BEQ $188c ; (builddop_op.s21 + 0)
.s22:
188a : a9 ff __ LDA #$ff
.s21:
188c : aa __ __ TAX
188d : a9 a9 __ LDA #$a9
188f : a4 0d __ LDY P0 ; (ip + 0)
1891 : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
1894 : 8a __ __ TXA
1895 : 4c f8 17 JMP $17f8 ; (builddop_op.s7 + 0)
.s23:
1898 : a9 b1 __ LDA #$b1
189a : a4 0d __ LDY P0 ; (ip + 0)
189c : 99 00 32 STA $3200,y ; (BLIT_CODE[0] + 0)
189f : a9 05 __ LDA #$05
18a1 : 99 01 32 STA $3201,y ; (BLIT_CODE[0] + 1)
18a4 : 06 0e __ ASL P1 ; (op + 0)
18a6 : 30 0a __ BMI $18b2 ; (builddop_op.s26 + 0)
.s24:
18a8 : a9 29 __ LDA #$29
18aa : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
18ad : a5 0f __ LDA P2 ; (mask + 0)
18af : 4c bb 18 JMP $18bb ; (builddop_op.s25 + 0)
.s26:
18b2 : a9 09 __ LDA #$09
18b4 : 99 02 32 STA $3202,y ; (BLIT_CODE[0] + 2)
18b7 : a5 0f __ LDA P2 ; (mask + 0)
18b9 : 49 ff __ EOR #$ff
.s25:
18bb : 99 03 32 STA $3203,y ; (BLIT_CODE[0] + 3)
18be : a9 91 __ LDA #$91
18c0 : 99 04 32 STA $3204,y ; (BLIT_CODE[0] + 4)
18c3 : a9 05 __ LDA #$05
18c5 : 99 05 32 STA $3205,y ; (BLIT_CODE[0] + 5)
18c8 : 98 __ __ TYA
18c9 : 18 __ __ CLC
18ca : 69 06 __ ADC #$06
18cc : 60 __ __ RTS
--------------------------------------------------------------------
18cd : __ __ __ BYT 0a 00 0a 00 36 01 be 00                         : ....6...
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
18d5 : a5 0d __ LDA P0 ; (f + 0)
18d7 : 85 43 __ STA T0 + 0 
18d9 : a5 0e __ LDA P1 ; (f + 1)
18db : 85 44 __ STA T0 + 1 
18dd : a5 0f __ LDA P2 ; (f + 2)
18df : 85 45 __ STA T0 + 2 
18e1 : a5 10 __ LDA P3 ; (f + 3)
18e3 : 29 7f __ AND #$7f
18e5 : 05 0f __ ORA P2 ; (f + 2)
18e7 : 05 0e __ ORA P1 ; (f + 1)
18e9 : 05 0d __ ORA P0 ; (f + 0)
18eb : f0 0e __ BEQ $18fb ; (sin.s5 + 0)
.s22:
18ed : 24 10 __ BIT P3 ; (f + 3)
18ef : 10 0a __ BPL $18fb ; (sin.s5 + 0)
.s21:
18f1 : a9 00 __ LDA #$00
18f3 : 85 47 __ STA T1 + 0 
18f5 : 85 48 __ STA T1 + 1 
18f7 : a9 bf __ LDA #$bf
18f9 : d0 08 __ BNE $1903 ; (sin.s6 + 0)
.s5:
18fb : a9 00 __ LDA #$00
18fd : 85 47 __ STA T1 + 0 
18ff : 85 48 __ STA T1 + 1 
1901 : a9 3f __ LDA #$3f
.s6:
1903 : 85 4a __ STA T1 + 3 
1905 : a5 10 __ LDA P3 ; (f + 3)
1907 : 29 7f __ AND #$7f
1909 : 85 46 __ STA T0 + 3 
190b : a9 80 __ LDA #$80
190d : 85 49 __ STA T1 + 2 
190f : a9 83 __ LDA #$83
1911 : 85 1b __ STA ACCU + 0 
1913 : a9 3e __ LDA #$3e
1915 : 85 1e __ STA ACCU + 3 
1917 : a9 f9 __ LDA #$f9
1919 : 85 1c __ STA ACCU + 1 
191b : a9 22 __ LDA #$22
191d : 85 1d __ STA ACCU + 2 
191f : a2 43 __ LDX #$43
1921 : 20 e0 2a JSR $2ae0 ; (freg + 4)
1924 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
1927 : a5 1b __ LDA ACCU + 0 
1929 : 85 43 __ STA T0 + 0 
192b : a5 1c __ LDA ACCU + 1 
192d : 85 44 __ STA T0 + 1 
192f : a5 1d __ LDA ACCU + 2 
1931 : 85 45 __ STA T0 + 2 
1933 : a5 1e __ LDA ACCU + 3 
1935 : 85 46 __ STA T0 + 3 
1937 : 20 00 2b JSR $2b00 ; (freg + 36)
193a : 20 09 2e JSR $2e09 ; (fround + 0)
193d : a2 43 __ LDX #$43
193f : 20 e0 2a JSR $2ae0 ; (freg + 4)
1942 : a5 1e __ LDA ACCU + 3 
1944 : 49 80 __ EOR #$80
1946 : 85 1e __ STA ACCU + 3 
1948 : 20 27 2b JSR $2b27 ; (faddsub + 6)
194b : a5 1b __ LDA ACCU + 0 
194d : 85 43 __ STA T0 + 0 
194f : a5 1c __ LDA ACCU + 1 
1951 : 85 44 __ STA T0 + 1 
1953 : a6 1d __ LDX ACCU + 2 
1955 : 86 45 __ STX T0 + 2 
1957 : a5 1e __ LDA ACCU + 3 
1959 : 85 46 __ STA T0 + 3 
195b : 30 3b __ BMI $1998 ; (sin.s7 + 0)
.s16:
195d : c9 3f __ CMP #$3f
195f : d0 0b __ BNE $196c ; (sin.s20 + 0)
.s17:
1961 : 8a __ __ TXA
1962 : d0 08 __ BNE $196c ; (sin.s20 + 0)
.s18:
1964 : a5 1c __ LDA ACCU + 1 
1966 : d0 04 __ BNE $196c ; (sin.s20 + 0)
.s19:
1968 : a5 1b __ LDA ACCU + 0 
196a : f0 02 __ BEQ $196e ; (sin.s15 + 0)
.s20:
196c : 90 2a __ BCC $1998 ; (sin.s7 + 0)
.s15:
196e : a9 00 __ LDA #$00
1970 : 85 1b __ STA ACCU + 0 
1972 : 85 1c __ STA ACCU + 1 
1974 : 85 1d __ STA ACCU + 2 
1976 : a9 bf __ LDA #$bf
1978 : 85 1e __ STA ACCU + 3 
197a : a2 43 __ LDX #$43
197c : 20 e0 2a JSR $2ae0 ; (freg + 4)
197f : 20 27 2b JSR $2b27 ; (faddsub + 6)
1982 : a5 1b __ LDA ACCU + 0 
1984 : 85 43 __ STA T0 + 0 
1986 : a5 1c __ LDA ACCU + 1 
1988 : 85 44 __ STA T0 + 1 
198a : a5 1d __ LDA ACCU + 2 
198c : 85 45 __ STA T0 + 2 
198e : a5 1e __ LDA ACCU + 3 
1990 : 85 46 __ STA T0 + 3 
1992 : a5 4a __ LDA T1 + 3 
1994 : 49 80 __ EOR #$80
1996 : 85 4a __ STA T1 + 3 
.s7:
1998 : a5 1e __ LDA ACCU + 3 
199a : 30 38 __ BMI $19d4 ; (sin.s8 + 0)
.s10:
199c : c9 3e __ CMP #$3e
199e : d0 0e __ BNE $19ae ; (sin.s14 + 0)
.s11:
19a0 : a5 1d __ LDA ACCU + 2 
19a2 : c9 80 __ CMP #$80
19a4 : d0 08 __ BNE $19ae ; (sin.s14 + 0)
.s12:
19a6 : a5 1c __ LDA ACCU + 1 
19a8 : d0 04 __ BNE $19ae ; (sin.s14 + 0)
.s13:
19aa : a5 1b __ LDA ACCU + 0 
19ac : f0 02 __ BEQ $19b0 ; (sin.s9 + 0)
.s14:
19ae : 90 24 __ BCC $19d4 ; (sin.s8 + 0)
.s9:
19b0 : a9 00 __ LDA #$00
19b2 : 85 1b __ STA ACCU + 0 
19b4 : 85 1c __ STA ACCU + 1 
19b6 : 85 1d __ STA ACCU + 2 
19b8 : a9 3f __ LDA #$3f
19ba : 85 1e __ STA ACCU + 3 
19bc : a2 43 __ LDX #$43
19be : 20 e0 2a JSR $2ae0 ; (freg + 4)
19c1 : 20 21 2b JSR $2b21 ; (faddsub + 0)
19c4 : a5 1b __ LDA ACCU + 0 
19c6 : 85 43 __ STA T0 + 0 
19c8 : a5 1c __ LDA ACCU + 1 
19ca : 85 44 __ STA T0 + 1 
19cc : a5 1d __ LDA ACCU + 2 
19ce : 85 45 __ STA T0 + 2 
19d0 : a5 1e __ LDA ACCU + 3 
19d2 : 85 46 __ STA T0 + 3 
.s8:
19d4 : a9 98 __ LDA #$98
19d6 : 85 1b __ STA ACCU + 0 
19d8 : a9 42 __ LDA #$42
19da : 85 1e __ STA ACCU + 3 
19dc : a9 ec __ LDA #$ec
19de : 85 1c __ STA ACCU + 1 
19e0 : a9 5e __ LDA #$5e
19e2 : 85 1d __ STA ACCU + 2 
19e4 : a2 43 __ LDX #$43
19e6 : 20 e0 2a JSR $2ae0 ; (freg + 4)
19e9 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
19ec : a9 f8 __ LDA #$f8
19ee : 85 03 __ STA WORK + 0 
19f0 : a9 41 __ LDA #$41
19f2 : 85 06 __ STA WORK + 3 
19f4 : a9 c5 __ LDA #$c5
19f6 : 85 04 __ STA WORK + 1 
19f8 : a9 13 __ LDA #$13
19fa : 85 05 __ STA WORK + 2 
19fc : 20 f0 2a JSR $2af0 ; (freg + 20)
19ff : 20 27 2b JSR $2b27 ; (faddsub + 6)
1a02 : a2 43 __ LDX #$43
1a04 : 20 e0 2a JSR $2ae0 ; (freg + 4)
1a07 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
1a0a : a9 6e __ LDA #$6e
1a0c : 85 03 __ STA WORK + 0 
1a0e : a9 c2 __ LDA #$c2
1a10 : 85 06 __ STA WORK + 3 
1a12 : a9 27 __ LDA #$27
1a14 : 85 04 __ STA WORK + 1 
1a16 : a9 2a __ LDA #$2a
1a18 : 85 05 __ STA WORK + 2 
1a1a : 20 f0 2a JSR $2af0 ; (freg + 20)
1a1d : 20 27 2b JSR $2b27 ; (faddsub + 6)
1a20 : a2 43 __ LDX #$43
1a22 : 20 e0 2a JSR $2ae0 ; (freg + 4)
1a25 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
1a28 : a9 df __ LDA #$df
1a2a : 85 03 __ STA WORK + 0 
1a2c : a9 3d __ LDA #$3d
1a2e : 85 06 __ STA WORK + 3 
1a30 : a9 af __ LDA #$af
1a32 : 85 04 __ STA WORK + 1 
1a34 : a9 5c __ LDA #$5c
1a36 : 85 05 __ STA WORK + 2 
1a38 : 20 f0 2a JSR $2af0 ; (freg + 20)
1a3b : 20 27 2b JSR $2b27 ; (faddsub + 6)
1a3e : a2 43 __ LDX #$43
1a40 : 20 e0 2a JSR $2ae0 ; (freg + 4)
1a43 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
1a46 : a9 b6 __ LDA #$b6
1a48 : 85 03 __ STA WORK + 0 
1a4a : a9 40 __ LDA #$40
1a4c : 85 06 __ STA WORK + 3 
1a4e : a9 0f __ LDA #$0f
1a50 : 85 04 __ STA WORK + 1 
1a52 : a9 c9 __ LDA #$c9
1a54 : 85 05 __ STA WORK + 2 
1a56 : 20 f0 2a JSR $2af0 ; (freg + 20)
1a59 : 20 27 2b JSR $2b27 ; (faddsub + 6)
1a5c : a2 43 __ LDX #$43
1a5e : 20 e0 2a JSR $2ae0 ; (freg + 4)
1a61 : 20 0e 2c JSR $2c0e ; (crt_fmul + 0)
1a64 : a2 47 __ LDX #$47
1a66 : 20 e0 2a JSR $2ae0 ; (freg + 4)
1a69 : 4c 0e 2c JMP $2c0e ; (crt_fmul + 0)
--------------------------------------------------------------------
bmmc_polygon_nc_fill: ; bmmc_polygon_nc_fill(const struct Bitmap*,const struct ClipRect*,i16*,i16*,u8,const u8*)->void
;  51, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
1a6c : a2 0f __ LDX #$0f
1a6e : b5 53 __ LDA T6 + 0,x 
1a70 : 9d d7 9f STA $9fd7,x ; (bmmc_polygon_nc_fill@stack + 0)
1a73 : ca __ __ DEX
1a74 : 10 f8 __ BPL $1a6e ; (bmmc_polygon_nc_fill.s1 + 2)
.s4:
1a76 : a9 00 __ LDA #$00
1a78 : 85 5b __ STA T10 + 0 
1a7a : 85 5c __ STA T10 + 1 
1a7c : 85 5d __ STA T11 + 0 
1a7e : 85 5e __ STA T11 + 1 
1a80 : a5 18 __ LDA P11 ; (num + 0)
1a82 : 85 61 __ STA T13 + 0 
1a84 : a9 00 __ LDA #$00
1a86 : 85 4f __ STA T3 + 0 
1a88 : a9 32 __ LDA #$32
1a8a : 85 50 __ STA T3 + 1 
1a8c : a9 10 __ LDA #$10
1a8e : c5 18 __ CMP P11 ; (num + 0)
1a90 : b0 02 __ BCS $1a94 ; (bmmc_polygon_nc_fill.s5 + 0)
.s94:
1a92 : 85 61 __ STA T13 + 0 
.s5:
1a94 : ad eb 9f LDA $9feb ; (sstack + 2)
1a97 : 85 5f __ STA T12 + 0 
1a99 : ad ec 9f LDA $9fec ; (sstack + 3)
1a9c : 85 60 __ STA T12 + 1 
1a9e : a5 61 __ LDA T13 + 0 
1aa0 : d0 03 __ BNE $1aa5 ; (bmmc_polygon_nc_fill.s50 + 0)
1aa2 : 4c 67 1b JMP $1b67 ; (bmmc_polygon_nc_fill.s6 + 0)
.s50:
1aa5 : a9 00 __ LDA #$00
1aa7 : 85 62 __ STA T14 + 0 
1aa9 : 85 43 __ STA T4 + 0 
1aab : a0 02 __ LDY #$02
1aad : b1 5f __ LDA (T12 + 0),y 
1aaf : 85 51 __ STA T5 + 0 
1ab1 : c8 __ __ INY
1ab2 : b1 5f __ LDA (T12 + 0),y 
1ab4 : 85 52 __ STA T5 + 1 
1ab6 : a0 06 __ LDY #$06
1ab8 : b1 5f __ LDA (T12 + 0),y 
1aba : 85 53 __ STA T6 + 0 
1abc : c8 __ __ INY
1abd : b1 5f __ LDA (T12 + 0),y 
1abf : 85 54 __ STA T6 + 1 
1ac1 : a2 00 __ LDX #$00
1ac3 : 18 __ __ CLC
.l51:
1ac4 : a5 43 __ LDA T4 + 0 
1ac6 : 69 01 __ ADC #$01
1ac8 : c5 61 __ CMP T13 + 0 
1aca : 90 02 __ BCC $1ace ; (bmmc_polygon_nc_fill.s52 + 0)
.s93:
1acc : a9 00 __ LDA #$00
.s52:
1ace : 85 45 __ STA T0 + 0 
1ad0 : ad ef 9f LDA $9fef ; (sstack + 6)
1ad3 : 85 49 __ STA T1 + 0 
1ad5 : ad f0 9f LDA $9ff0 ; (sstack + 7)
1ad8 : 85 4a __ STA T1 + 1 
1ada : a5 43 __ LDA T4 + 0 
1adc : 0a __ __ ASL
1add : a8 __ __ TAY
1ade : b1 49 __ LDA (T1 + 0),y 
1ae0 : 85 55 __ STA T7 + 0 
1ae2 : c8 __ __ INY
1ae3 : b1 49 __ LDA (T1 + 0),y 
1ae5 : 85 56 __ STA T7 + 1 
1ae7 : a5 45 __ LDA T0 + 0 
1ae9 : 0a __ __ ASL
1aea : a8 __ __ TAY
1aeb : b1 49 __ LDA (T1 + 0),y 
1aed : 85 4d __ STA T2 + 0 
1aef : a5 56 __ LDA T7 + 1 
1af1 : c8 __ __ INY
1af2 : d1 49 __ CMP (T1 + 0),y 
1af4 : d0 06 __ BNE $1afc ; (bmmc_polygon_nc_fill.s54 + 0)
.s92:
1af6 : a5 55 __ LDA T7 + 0 
1af8 : c5 4d __ CMP T2 + 0 
1afa : f0 5e __ BEQ $1b5a ; (bmmc_polygon_nc_fill.s53 + 0)
.s54:
1afc : b1 49 __ LDA (T1 + 0),y 
1afe : c5 56 __ CMP T7 + 1 
1b00 : d0 08 __ BNE $1b0a ; (bmmc_polygon_nc_fill.s91 + 0)
.s88:
1b02 : a5 4d __ LDA T2 + 0 
1b04 : c5 55 __ CMP T7 + 0 
.s89:
1b06 : 90 08 __ BCC $1b10 ; (bmmc_polygon_nc_fill.s87 + 0)
1b08 : b0 0c __ BCS $1b16 ; (bmmc_polygon_nc_fill.s55 + 0)
.s91:
1b0a : 45 56 __ EOR T7 + 1 
1b0c : 10 f8 __ BPL $1b06 ; (bmmc_polygon_nc_fill.s89 + 0)
.s90:
1b0e : 90 06 __ BCC $1b16 ; (bmmc_polygon_nc_fill.s55 + 0)
.s87:
1b10 : a5 62 __ LDA T14 + 0 
1b12 : a6 45 __ LDX T0 + 0 
1b14 : 85 45 __ STA T0 + 0 
.s55:
1b16 : 8a __ __ TXA
1b17 : 0a __ __ ASL
1b18 : 85 4d __ STA T2 + 0 
1b1a : a8 __ __ TAY
1b1b : b1 49 __ LDA (T1 + 0),y 
1b1d : 85 55 __ STA T7 + 0 
1b1f : c8 __ __ INY
1b20 : b1 49 __ LDA (T1 + 0),y 
1b22 : 85 56 __ STA T7 + 1 
1b24 : c5 54 __ CMP T6 + 1 
1b26 : d0 08 __ BNE $1b30 ; (bmmc_polygon_nc_fill.s86 + 0)
.s83:
1b28 : a5 55 __ LDA T7 + 0 
1b2a : c5 53 __ CMP T6 + 0 
.s84:
1b2c : 90 08 __ BCC $1b36 ; (bmmc_polygon_nc_fill.s56 + 0)
1b2e : b0 2a __ BCS $1b5a ; (bmmc_polygon_nc_fill.s53 + 0)
.s86:
1b30 : 45 54 __ EOR T6 + 1 
1b32 : 10 f8 __ BPL $1b2c ; (bmmc_polygon_nc_fill.s84 + 0)
.s85:
1b34 : 90 24 __ BCC $1b5a ; (bmmc_polygon_nc_fill.s53 + 0)
.s56:
1b36 : a5 45 __ LDA T0 + 0 
1b38 : 0a __ __ ASL
1b39 : 85 57 __ STA T8 + 0 
1b3b : a8 __ __ TAY
1b3c : b1 49 __ LDA (T1 + 0),y 
1b3e : 85 59 __ STA T9 + 0 
1b40 : c8 __ __ INY
1b41 : b1 49 __ LDA (T1 + 0),y 
1b43 : 85 5a __ STA T9 + 1 
1b45 : a5 52 __ LDA T5 + 1 
1b47 : c5 5a __ CMP T9 + 1 
1b49 : d0 09 __ BNE $1b54 ; (bmmc_polygon_nc_fill.s82 + 0)
.s79:
1b4b : a5 51 __ LDA T5 + 0 
1b4d : c5 59 __ CMP T9 + 0 
.s80:
1b4f : b0 09 __ BCS $1b5a ; (bmmc_polygon_nc_fill.s53 + 0)
1b51 : 4c 29 1e JMP $1e29 ; (bmmc_polygon_nc_fill.s57 + 0)
.s82:
1b54 : 45 5a __ EOR T9 + 1 
1b56 : 10 f7 __ BPL $1b4f ; (bmmc_polygon_nc_fill.s80 + 0)
.s81:
1b58 : b0 f7 __ BCS $1b51 ; (bmmc_polygon_nc_fill.s80 + 2)
.s53:
1b5a : e6 43 __ INC T4 + 0 
1b5c : e6 62 __ INC T14 + 0 
1b5e : a6 62 __ LDX T14 + 0 
1b60 : e4 61 __ CPX T13 + 0 
1b62 : b0 03 __ BCS $1b67 ; (bmmc_polygon_nc_fill.s6 + 0)
1b64 : 4c c4 1a JMP $1ac4 ; (bmmc_polygon_nc_fill.l51 + 0)
.s6:
1b67 : a5 5b __ LDA T10 + 0 
1b69 : 05 5c __ ORA T10 + 1 
1b6b : f0 69 __ BEQ $1bd6 ; (bmmc_polygon_nc_fill.s3 + 0)
.s7:
1b6d : a0 00 __ LDY #$00
1b6f : 84 1c __ STY ACCU + 1 ; (clip + 1)
1b71 : ad e9 9f LDA $9fe9 ; (sstack + 0)
1b74 : 85 4d __ STA T2 + 0 
1b76 : ad ea 9f LDA $9fea ; (sstack + 1)
1b79 : 85 4e __ STA T2 + 1 
1b7b : b1 5b __ LDA (T10 + 0),y 
1b7d : 85 59 __ STA T9 + 0 
1b7f : 29 f8 __ AND #$f8
1b81 : aa __ __ TAX
1b82 : a0 04 __ LDY #$04
1b84 : b1 4d __ LDA (T2 + 0),y 
1b86 : 85 4f __ STA T3 + 0 
1b88 : 85 1b __ STA ACCU + 0 ; (clip + 0)
1b8a : 8a __ __ TXA
1b8b : 20 6e 2a JSR $2a6e ; (mul16by8 + 0)
1b8e : a0 00 __ LDY #$00
1b90 : b1 4d __ LDA (T2 + 0),y 
1b92 : 18 __ __ CLC
1b93 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
1b95 : 85 02 __ STA $02 
1b97 : c8 __ __ INY
1b98 : b1 4d __ LDA (T2 + 0),y 
1b9a : 65 1c __ ADC ACCU + 1 ; (clip + 1)
1b9c : aa __ __ TAX
1b9d : a5 59 __ LDA T9 + 0 
1b9f : 29 07 __ AND #$07
1ba1 : 18 __ __ CLC
1ba2 : 65 02 __ ADC $02 
1ba4 : 85 53 __ STA T6 + 0 
1ba6 : 90 02 __ BCC $1baa ; (bmmc_polygon_nc_fill.s102 + 0)
.s101:
1ba8 : e8 __ __ INX
1ba9 : 18 __ __ CLC
.s102:
1baa : 86 54 __ STX T6 + 1 
1bac : a5 4f __ LDA T3 + 0 
1bae : 69 ff __ ADC #$ff
1bb0 : 2a __ __ ROL
1bb1 : 2a __ __ ROL
1bb2 : 2a __ __ ROL
1bb3 : aa __ __ TAX
1bb4 : 29 f8 __ AND #$f8
1bb6 : 85 55 __ STA T7 + 0 
1bb8 : 8a __ __ TXA
1bb9 : 29 07 __ AND #$07
1bbb : 2a __ __ ROL
1bbc : 69 f8 __ ADC #$f8
1bbe : 85 56 __ STA T7 + 1 
1bc0 : ad f1 9f LDA $9ff1 ; (sstack + 8)
1bc3 : 85 57 __ STA T8 + 0 
1bc5 : ad f2 9f LDA $9ff2 ; (sstack + 9)
1bc8 : 85 58 __ STA T8 + 1 
1bca : a5 5b __ LDA T10 + 0 
1bcc : 05 5c __ ORA T10 + 1 
1bce : d0 1a __ BNE $1bea ; (bmmc_polygon_nc_fill.l15 + 0)
.s8:
1bd0 : a5 5d __ LDA T11 + 0 
1bd2 : 05 5e __ ORA T11 + 1 
1bd4 : d0 0b __ BNE $1be1 ; (bmmc_polygon_nc_fill.s9 + 0)
.s3:
1bd6 : a2 0f __ LDX #$0f
1bd8 : bd d7 9f LDA $9fd7,x ; (bmmc_polygon_nc_fill@stack + 0)
1bdb : 95 53 __ STA T6 + 0,x 
1bdd : ca __ __ DEX
1bde : 10 f8 __ BPL $1bd8 ; (bmmc_polygon_nc_fill.s3 + 2)
1be0 : 60 __ __ RTS
.s9:
1be1 : a5 5b __ LDA T10 + 0 
1be3 : 05 5c __ ORA T10 + 1 
1be5 : d0 03 __ BNE $1bea ; (bmmc_polygon_nc_fill.l15 + 0)
1be7 : 4c 9f 1c JMP $1c9f ; (bmmc_polygon_nc_fill.l10 + 0)
.l15:
1bea : a5 59 __ LDA T9 + 0 
1bec : a0 00 __ LDY #$00
1bee : d1 5b __ CMP (T10 + 0),y 
1bf0 : d0 f5 __ BNE $1be7 ; (bmmc_polygon_nc_fill.s9 + 6)
.l16:
1bf2 : 84 43 __ STY T4 + 0 
1bf4 : 84 44 __ STY T4 + 1 
1bf6 : a5 5e __ LDA T11 + 1 
1bf8 : 85 50 __ STA T3 + 1 
1bfa : a0 0a __ LDY #$0a
1bfc : b1 5b __ LDA (T10 + 0),y 
1bfe : 85 51 __ STA T5 + 0 
1c00 : c8 __ __ INY
1c01 : b1 5b __ LDA (T10 + 0),y 
1c03 : 85 52 __ STA T5 + 1 
1c05 : a5 5d __ LDA T11 + 0 
1c07 : 85 4f __ STA T3 + 0 
1c09 : 05 5e __ ORA T11 + 1 
1c0b : f0 56 __ BEQ $1c63 ; (bmmc_polygon_nc_fill.s17 + 0)
.s22:
1c0d : a0 02 __ LDY #$02
1c0f : b1 5b __ LDA (T10 + 0),y 
1c11 : 85 45 __ STA T0 + 0 
1c13 : c8 __ __ INY
1c14 : b1 5b __ LDA (T10 + 0),y 
1c16 : 85 46 __ STA T0 + 1 
1c18 : c8 __ __ INY
1c19 : b1 5b __ LDA (T10 + 0),y 
1c1b : 85 47 __ STA T0 + 2 
1c1d : c8 __ __ INY
1c1e : b1 5b __ LDA (T10 + 0),y 
1c20 : 85 48 __ STA T0 + 3 
1c22 : a6 02 __ LDX $02 
.l23:
1c24 : a0 02 __ LDY #$02
1c26 : b1 4f __ LDA (T3 + 0),y 
1c28 : 85 49 __ STA T1 + 0 
1c2a : c8 __ __ INY
1c2b : b1 4f __ LDA (T3 + 0),y 
1c2d : 85 4a __ STA T1 + 1 
1c2f : c8 __ __ INY
1c30 : b1 4f __ LDA (T3 + 0),y 
1c32 : 85 4b __ STA T1 + 2 
1c34 : c8 __ __ INY
1c35 : b1 4f __ LDA (T3 + 0),y 
1c37 : c5 48 __ CMP T0 + 3 
1c39 : d0 03 __ BNE $1c3e ; (bmmc_polygon_nc_fill.s41 + 0)
1c3b : 4c 13 1e JMP $1e13 ; (bmmc_polygon_nc_fill.s36 + 0)
.s41:
1c3e : 45 48 __ EOR T0 + 3 
1c40 : 30 05 __ BMI $1c47 ; (bmmc_polygon_nc_fill.s40 + 0)
.s39:
1c42 : 90 05 __ BCC $1c49 ; (bmmc_polygon_nc_fill.s26 + 0)
1c44 : 4c cc 1d JMP $1dcc ; (bmmc_polygon_nc_fill.s24 + 0)
.s40:
1c47 : 90 fb __ BCC $1c44 ; (bmmc_polygon_nc_fill.s39 + 2)
.s26:
1c49 : a5 4f __ LDA T3 + 0 
1c4b : 85 43 __ STA T4 + 0 
1c4d : a5 50 __ LDA T3 + 1 
1c4f : 85 44 __ STA T4 + 1 
1c51 : a0 0a __ LDY #$0a
1c53 : b1 4f __ LDA (T3 + 0),y 
1c55 : aa __ __ TAX
1c56 : c8 __ __ INY
1c57 : b1 4f __ LDA (T3 + 0),y 
1c59 : 86 4f __ STX T3 + 0 
1c5b : 85 50 __ STA T3 + 1 
1c5d : 05 4f __ ORA T3 + 0 
1c5f : d0 c3 __ BNE $1c24 ; (bmmc_polygon_nc_fill.l23 + 0)
.s98:
1c61 : 86 02 __ STX $02 
.s17:
1c63 : a5 4f __ LDA T3 + 0 
1c65 : a0 0a __ LDY #$0a
1c67 : 91 5b __ STA (T10 + 0),y 
1c69 : a5 50 __ LDA T3 + 1 
1c6b : c8 __ __ INY
1c6c : 91 5b __ STA (T10 + 0),y 
1c6e : a5 43 __ LDA T4 + 0 
1c70 : 05 44 __ ORA T4 + 1 
1c72 : f0 0c __ BEQ $1c80 ; (bmmc_polygon_nc_fill.s18 + 0)
.s21:
1c74 : a5 5b __ LDA T10 + 0 
1c76 : 88 __ __ DEY
1c77 : 91 43 __ STA (T4 + 0),y 
1c79 : a5 5c __ LDA T10 + 1 
1c7b : c8 __ __ INY
1c7c : 91 43 __ STA (T4 + 0),y 
1c7e : d0 08 __ BNE $1c88 ; (bmmc_polygon_nc_fill.s19 + 0)
.s18:
1c80 : a5 5b __ LDA T10 + 0 
1c82 : 85 5d __ STA T11 + 0 
1c84 : a5 5c __ LDA T10 + 1 
1c86 : 85 5e __ STA T11 + 1 
.s19:
1c88 : a5 51 __ LDA T5 + 0 
1c8a : 85 5b __ STA T10 + 0 
1c8c : a5 52 __ LDA T5 + 1 
1c8e : 85 5c __ STA T10 + 1 
1c90 : 05 51 __ ORA T5 + 0 
1c92 : f0 0b __ BEQ $1c9f ; (bmmc_polygon_nc_fill.l10 + 0)
.s20:
1c94 : a5 59 __ LDA T9 + 0 
1c96 : a0 00 __ LDY #$00
1c98 : d1 51 __ CMP (T5 + 0),y 
1c9a : d0 03 __ BNE $1c9f ; (bmmc_polygon_nc_fill.l10 + 0)
1c9c : 4c f2 1b JMP $1bf2 ; (bmmc_polygon_nc_fill.l16 + 0)
.l10:
1c9f : a5 5d __ LDA T11 + 0 
1ca1 : 05 5e __ ORA T11 + 1 
1ca3 : f0 03 __ BEQ $1ca8 ; (bmmc_polygon_nc_fill.s11 + 0)
1ca5 : 4c 57 1d JMP $1d57 ; (bmmc_polygon_nc_fill.s49 + 0)
.s11:
1ca8 : e6 53 __ INC T6 + 0 
1caa : d0 02 __ BNE $1cae ; (bmmc_polygon_nc_fill.s104 + 0)
.s103:
1cac : e6 54 __ INC T6 + 1 
.s104:
1cae : a5 53 __ LDA T6 + 0 
1cb0 : 29 07 __ AND #$07
1cb2 : d0 0d __ BNE $1cc1 ; (bmmc_polygon_nc_fill.s13 + 0)
.s12:
1cb4 : 18 __ __ CLC
1cb5 : a5 53 __ LDA T6 + 0 
1cb7 : 65 55 __ ADC T7 + 0 
1cb9 : 85 53 __ STA T6 + 0 
1cbb : a5 54 __ LDA T6 + 1 
1cbd : 65 56 __ ADC T7 + 1 
1cbf : 85 54 __ STA T6 + 1 
.s13:
1cc1 : e6 59 __ INC T9 + 0 
1cc3 : a5 5d __ LDA T11 + 0 
1cc5 : 05 5e __ ORA T11 + 1 
1cc7 : f0 67 __ BEQ $1d30 ; (bmmc_polygon_nc_fill.s14 + 0)
.s42:
1cc9 : a5 5d __ LDA T11 + 0 
1ccb : 85 4d __ STA T2 + 0 
1ccd : a5 5e __ LDA T11 + 1 
1ccf : 85 4e __ STA T2 + 1 
1cd1 : a9 00 __ LDA #$00
1cd3 : 85 45 __ STA T0 + 0 
1cd5 : 85 46 __ STA T0 + 1 
.l43:
1cd7 : a5 59 __ LDA T9 + 0 
1cd9 : a0 01 __ LDY #$01
1cdb : d1 4d __ CMP (T2 + 0),y 
1cdd : f0 34 __ BEQ $1d13 ; (bmmc_polygon_nc_fill.s46 + 0)
.s44:
1cdf : 18 __ __ CLC
1ce0 : a0 06 __ LDY #$06
1ce2 : b1 4d __ LDA (T2 + 0),y 
1ce4 : a0 02 __ LDY #$02
1ce6 : 71 4d __ ADC (T2 + 0),y 
1ce8 : 91 4d __ STA (T2 + 0),y 
1cea : a0 07 __ LDY #$07
1cec : b1 4d __ LDA (T2 + 0),y 
1cee : a0 03 __ LDY #$03
1cf0 : 71 4d __ ADC (T2 + 0),y 
1cf2 : 91 4d __ STA (T2 + 0),y 
1cf4 : a0 08 __ LDY #$08
1cf6 : b1 4d __ LDA (T2 + 0),y 
1cf8 : a0 04 __ LDY #$04
1cfa : 71 4d __ ADC (T2 + 0),y 
1cfc : 91 4d __ STA (T2 + 0),y 
1cfe : a0 09 __ LDY #$09
1d00 : b1 4d __ LDA (T2 + 0),y 
1d02 : a0 05 __ LDY #$05
1d04 : 71 4d __ ADC (T2 + 0),y 
1d06 : 91 4d __ STA (T2 + 0),y 
1d08 : a5 4d __ LDA T2 + 0 
1d0a : 85 45 __ STA T0 + 0 
1d0c : a5 4e __ LDA T2 + 1 
1d0e : 85 46 __ STA T0 + 1 
1d10 : 4c 45 1d JMP $1d45 ; (bmmc_polygon_nc_fill.s45 + 0)
.s46:
1d13 : a5 45 __ LDA T0 + 0 
1d15 : a0 0a __ LDY #$0a
1d17 : 05 46 __ ORA T0 + 1 
1d19 : d0 21 __ BNE $1d3c ; (bmmc_polygon_nc_fill.s48 + 0)
.s47:
1d1b : b1 4d __ LDA (T2 + 0),y 
1d1d : aa __ __ TAX
1d1e : c8 __ __ INY
1d1f : b1 4d __ LDA (T2 + 0),y 
1d21 : 86 4d __ STX T2 + 0 
1d23 : 86 5d __ STX T11 + 0 
1d25 : 85 4e __ STA T2 + 1 
1d27 : 85 5e __ STA T11 + 1 
1d29 : 8a __ __ TXA
1d2a : 05 4e __ ORA T2 + 1 
1d2c : d0 a9 __ BNE $1cd7 ; (bmmc_polygon_nc_fill.l43 + 0)
.s99:
1d2e : 86 02 __ STX $02 
.s14:
1d30 : a5 5b __ LDA T10 + 0 
1d32 : 05 5c __ ORA T10 + 1 
1d34 : f0 03 __ BEQ $1d39 ; (bmmc_polygon_nc_fill.s14 + 9)
1d36 : 4c ea 1b JMP $1bea ; (bmmc_polygon_nc_fill.l15 + 0)
1d39 : 4c d0 1b JMP $1bd0 ; (bmmc_polygon_nc_fill.s8 + 0)
.s48:
1d3c : b1 4d __ LDA (T2 + 0),y 
1d3e : 91 45 __ STA (T0 + 0),y 
1d40 : c8 __ __ INY
1d41 : b1 4d __ LDA (T2 + 0),y 
1d43 : 91 45 __ STA (T0 + 0),y 
.s45:
1d45 : a0 0a __ LDY #$0a
1d47 : b1 4d __ LDA (T2 + 0),y 
1d49 : aa __ __ TAX
1d4a : c8 __ __ INY
1d4b : b1 4d __ LDA (T2 + 0),y 
1d4d : 86 4d __ STX T2 + 0 
1d4f : 85 4e __ STA T2 + 1 
1d51 : 05 4d __ ORA T2 + 0 
1d53 : f0 d9 __ BEQ $1d2e ; (bmmc_polygon_nc_fill.s99 + 0)
1d55 : d0 80 __ BNE $1cd7 ; (bmmc_polygon_nc_fill.l43 + 0)
.s49:
1d57 : a5 59 __ LDA T9 + 0 
1d59 : 29 07 __ AND #$07
1d5b : 85 4f __ STA T3 + 0 
1d5d : a5 5d __ LDA T11 + 0 
1d5f : 85 49 __ STA T1 + 0 
1d61 : a5 5e __ LDA T11 + 1 
1d63 : 85 4a __ STA T1 + 1 
1d65 : a5 53 __ LDA T6 + 0 
1d67 : 85 11 __ STA P4 
1d69 : a5 54 __ LDA T6 + 1 
1d6b : 85 12 __ STA P5 
.l95:
1d6d : a4 4f __ LDY T3 + 0 
1d6f : b1 57 __ LDA (T8 + 0),y 
1d71 : 85 17 __ STA P10 
1d73 : a0 00 __ LDY #$00
1d75 : b1 5f __ LDA (T12 + 0),y 
1d77 : 85 0d __ STA P0 
1d79 : c8 __ __ INY
1d7a : b1 5f __ LDA (T12 + 0),y 
1d7c : 85 0e __ STA P1 
1d7e : a0 04 __ LDY #$04
1d80 : b1 5f __ LDA (T12 + 0),y 
1d82 : 85 0f __ STA P2 
1d84 : c8 __ __ INY
1d85 : b1 5f __ LDA (T12 + 0),y 
1d87 : 85 10 __ STA P3 
1d89 : 88 __ __ DEY
1d8a : b1 49 __ LDA (T1 + 0),y 
1d8c : 29 fe __ AND #$fe
1d8e : 85 13 __ STA P6 
1d90 : c8 __ __ INY
1d91 : b1 49 __ LDA (T1 + 0),y 
1d93 : 85 14 __ STA P7 
1d95 : a0 0a __ LDY #$0a
1d97 : b1 49 __ LDA (T1 + 0),y 
1d99 : aa __ __ TAX
1d9a : c8 __ __ INY
1d9b : b1 49 __ LDA (T1 + 0),y 
1d9d : 86 49 __ STX T1 + 0 
1d9f : 85 4a __ STA T1 + 1 
1da1 : a0 04 __ LDY #$04
1da3 : b1 49 __ LDA (T1 + 0),y 
1da5 : 18 __ __ CLC
1da6 : 69 01 __ ADC #$01
1da8 : 29 fe __ AND #$fe
1daa : 85 15 __ STA P8 
1dac : c8 __ __ INY
1dad : b1 49 __ LDA (T1 + 0),y 
1daf : 69 00 __ ADC #$00
1db1 : 85 16 __ STA P9 
1db3 : 20 9d 1f JSR $1f9d ; (bm_scan_fill.s4 + 0)
1db6 : a0 0a __ LDY #$0a
1db8 : b1 49 __ LDA (T1 + 0),y 
1dba : 85 02 __ STA $02 
1dbc : c8 __ __ INY
1dbd : b1 49 __ LDA (T1 + 0),y 
1dbf : 85 4a __ STA T1 + 1 
1dc1 : a5 02 __ LDA $02 
1dc3 : 85 49 __ STA T1 + 0 
1dc5 : 05 4a __ ORA T1 + 1 
1dc7 : d0 a4 __ BNE $1d6d ; (bmmc_polygon_nc_fill.l95 + 0)
1dc9 : 4c a8 1c JMP $1ca8 ; (bmmc_polygon_nc_fill.s11 + 0)
.s24:
1dcc : a5 48 __ LDA T0 + 3 
1dce : d1 4f __ CMP (T3 + 0),y 
1dd0 : f0 03 __ BEQ $1dd5 ; (bmmc_polygon_nc_fill.s33 + 0)
1dd2 : 4c 61 1c JMP $1c61 ; (bmmc_polygon_nc_fill.s98 + 0)
.s33:
1dd5 : a5 47 __ LDA T0 + 2 
1dd7 : c5 4b __ CMP T1 + 2 
1dd9 : d0 f7 __ BNE $1dd2 ; (bmmc_polygon_nc_fill.s24 + 6)
.s34:
1ddb : a5 46 __ LDA T0 + 1 
1ddd : c5 4a __ CMP T1 + 1 
1ddf : d0 f1 __ BNE $1dd2 ; (bmmc_polygon_nc_fill.s24 + 6)
.s35:
1de1 : a5 45 __ LDA T0 + 0 
1de3 : c5 49 __ CMP T1 + 0 
1de5 : d0 eb __ BNE $1dd2 ; (bmmc_polygon_nc_fill.s24 + 6)
.s25:
1de7 : a0 09 __ LDY #$09
1de9 : b1 4f __ LDA (T3 + 0),y 
1deb : d1 5b __ CMP (T10 + 0),y 
1ded : f0 0e __ BEQ $1dfd ; (bmmc_polygon_nc_fill.s27 + 0)
.s32:
1def : 51 5b __ EOR (T10 + 0),y 
1df1 : 30 05 __ BMI $1df8 ; (bmmc_polygon_nc_fill.s31 + 0)
.s30:
1df3 : b0 dd __ BCS $1dd2 ; (bmmc_polygon_nc_fill.s24 + 6)
1df5 : 4c 49 1c JMP $1c49 ; (bmmc_polygon_nc_fill.s26 + 0)
.s31:
1df8 : 90 d8 __ BCC $1dd2 ; (bmmc_polygon_nc_fill.s24 + 6)
1dfa : 4c 49 1c JMP $1c49 ; (bmmc_polygon_nc_fill.s26 + 0)
.s27:
1dfd : 88 __ __ DEY
1dfe : b1 4f __ LDA (T3 + 0),y 
1e00 : d1 5b __ CMP (T10 + 0),y 
1e02 : d0 ef __ BNE $1df3 ; (bmmc_polygon_nc_fill.s30 + 0)
.s28:
1e04 : 88 __ __ DEY
1e05 : b1 4f __ LDA (T3 + 0),y 
1e07 : d1 5b __ CMP (T10 + 0),y 
1e09 : d0 e8 __ BNE $1df3 ; (bmmc_polygon_nc_fill.s30 + 0)
.s29:
1e0b : 88 __ __ DEY
1e0c : b1 4f __ LDA (T3 + 0),y 
1e0e : d1 5b __ CMP (T10 + 0),y 
1e10 : 4c f3 1d JMP $1df3 ; (bmmc_polygon_nc_fill.s30 + 0)
.s36:
1e13 : a5 4b __ LDA T1 + 2 
1e15 : c5 47 __ CMP T0 + 2 
1e17 : f0 03 __ BEQ $1e1c ; (bmmc_polygon_nc_fill.s37 + 0)
1e19 : 4c 42 1c JMP $1c42 ; (bmmc_polygon_nc_fill.s39 + 0)
.s37:
1e1c : a5 4a __ LDA T1 + 1 
1e1e : c5 46 __ CMP T0 + 1 
1e20 : d0 f7 __ BNE $1e19 ; (bmmc_polygon_nc_fill.s36 + 6)
.s38:
1e22 : a5 49 __ LDA T1 + 0 
1e24 : c5 45 __ CMP T0 + 0 
1e26 : 4c 42 1c JMP $1c42 ; (bmmc_polygon_nc_fill.s39 + 0)
.s57:
1e29 : ad ed 9f LDA $9fed ; (sstack + 4)
1e2c : 85 49 __ STA T1 + 0 
1e2e : ad ee 9f LDA $9fee ; (sstack + 5)
1e31 : 85 4a __ STA T1 + 1 
1e33 : a4 4d __ LDY T2 + 0 
1e35 : b1 49 __ LDA (T1 + 0),y 
1e37 : 85 47 __ STA T0 + 2 
1e39 : c8 __ __ INY
1e3a : b1 49 __ LDA (T1 + 0),y 
1e3c : 85 48 __ STA T0 + 3 
1e3e : a0 05 __ LDY #$05
1e40 : 91 4f __ STA (T3 + 0),y 
1e42 : a9 00 __ LDA #$00
1e44 : a0 02 __ LDY #$02
1e46 : 91 4f __ STA (T3 + 0),y 
1e48 : a9 80 __ LDA #$80
1e4a : 85 1c __ STA ACCU + 1 ; (clip + 1)
1e4c : c8 __ __ INY
1e4d : 91 4f __ STA (T3 + 0),y 
1e4f : a5 47 __ LDA T0 + 2 
1e51 : c8 __ __ INY
1e52 : 91 4f __ STA (T3 + 0),y 
1e54 : a4 57 __ LDY T8 + 0 
1e56 : b1 49 __ LDA (T1 + 0),y 
1e58 : 18 __ __ CLC
1e59 : e5 47 __ SBC T0 + 2 
1e5b : 85 1d __ STA ACCU + 2 ; (px + 0)
1e5d : c8 __ __ INY
1e5e : b1 49 __ LDA (T1 + 0),y 
1e60 : e5 48 __ SBC T0 + 3 
1e62 : 85 1e __ STA ACCU + 3 ; (px + 1)
1e64 : 38 __ __ SEC
1e65 : a5 59 __ LDA T9 + 0 
1e67 : e5 55 __ SBC T7 + 0 
1e69 : 85 03 __ STA WORK + 0 
1e6b : a5 5a __ LDA T9 + 1 
1e6d : e5 56 __ SBC T7 + 1 
1e6f : 85 04 __ STA WORK + 1 
1e71 : 0a __ __ ASL
1e72 : a9 00 __ LDA #$00
1e74 : 85 1b __ STA ACCU + 0 ; (clip + 0)
1e76 : 69 ff __ ADC #$ff
1e78 : 49 ff __ EOR #$ff
1e7a : 85 06 __ STA WORK + 3 
1e7c : 85 05 __ STA WORK + 2 
1e7e : 20 fe 2f JSR $2ffe ; (divs32 + 0)
1e81 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
1e83 : a0 06 __ LDY #$06
1e85 : 91 4f __ STA (T3 + 0),y 
1e87 : aa __ __ TAX
1e88 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
1e8a : 85 4a __ STA T1 + 1 
1e8c : c8 __ __ INY
1e8d : 91 4f __ STA (T3 + 0),y 
1e8f : a5 1d __ LDA ACCU + 2 ; (px + 0)
1e91 : 85 4b __ STA T1 + 2 
1e93 : c8 __ __ INY
1e94 : 91 4f __ STA (T3 + 0),y 
1e96 : a5 1e __ LDA ACCU + 3 ; (px + 1)
1e98 : 85 4c __ STA T1 + 3 
1e9a : c8 __ __ INY
1e9b : 91 4f __ STA (T3 + 0),y 
1e9d : a5 56 __ LDA T7 + 1 
1e9f : c5 52 __ CMP T5 + 1 
1ea1 : d0 08 __ BNE $1eab ; (bmmc_polygon_nc_fill.s78 + 0)
.s75:
1ea3 : a5 55 __ LDA T7 + 0 
1ea5 : c5 51 __ CMP T5 + 0 
.s76:
1ea7 : b0 08 __ BCS $1eb1 ; (bmmc_polygon_nc_fill.s58 + 0)
1ea9 : 90 0d __ BCC $1eb8 ; (bmmc_polygon_nc_fill.s74 + 0)
.s78:
1eab : 45 52 __ EOR T5 + 1 
1ead : 10 f8 __ BPL $1ea7 ; (bmmc_polygon_nc_fill.s76 + 0)
.s77:
1eaf : b0 07 __ BCS $1eb8 ; (bmmc_polygon_nc_fill.s74 + 0)
.s58:
1eb1 : a5 56 __ LDA T7 + 1 
1eb3 : a6 55 __ LDX T7 + 0 
1eb5 : 4c 01 1f JMP $1f01 ; (bmmc_polygon_nc_fill.s59 + 0)
.s74:
1eb8 : 86 03 __ STX WORK + 0 
1eba : 38 __ __ SEC
1ebb : a5 51 __ LDA T5 + 0 
1ebd : e5 55 __ SBC T7 + 0 
1ebf : 85 1b __ STA ACCU + 0 ; (clip + 0)
1ec1 : a5 52 __ LDA T5 + 1 
1ec3 : e5 56 __ SBC T7 + 1 
1ec5 : 85 1c __ STA ACCU + 1 ; (clip + 1)
1ec7 : 29 80 __ AND #$80
1ec9 : 10 02 __ BPL $1ecd ; (bmmc_polygon_nc_fill.s74 + 21)
1ecb : a9 ff __ LDA #$ff
1ecd : 85 1d __ STA ACCU + 2 ; (px + 0)
1ecf : 85 1e __ STA ACCU + 3 ; (px + 1)
1ed1 : a5 4a __ LDA T1 + 1 
1ed3 : 85 04 __ STA WORK + 1 
1ed5 : a5 4b __ LDA T1 + 2 
1ed7 : 85 05 __ STA WORK + 2 
1ed9 : a5 4c __ LDA T1 + 3 
1edb : 85 06 __ STA WORK + 3 
1edd : 20 96 2f JSR $2f96 ; (mul32 + 0)
1ee0 : 18 __ __ CLC
1ee1 : a5 08 __ LDA WORK + 5 
1ee3 : 69 80 __ ADC #$80
1ee5 : a0 03 __ LDY #$03
1ee7 : 91 4f __ STA (T3 + 0),y 
1ee9 : a5 09 __ LDA WORK + 6 
1eeb : 65 47 __ ADC T0 + 2 
1eed : c8 __ __ INY
1eee : 91 4f __ STA (T3 + 0),y 
1ef0 : a5 0a __ LDA WORK + 7 
1ef2 : 65 48 __ ADC T0 + 3 
1ef4 : c8 __ __ INY
1ef5 : 91 4f __ STA (T3 + 0),y 
1ef7 : a5 07 __ LDA WORK + 4 
1ef9 : a0 02 __ LDY #$02
1efb : 91 4f __ STA (T3 + 0),y 
1efd : a5 52 __ LDA T5 + 1 
1eff : a6 51 __ LDX T5 + 0 
.s59:
1f01 : 86 45 __ STX T0 + 0 
1f03 : 85 46 __ STA T0 + 1 
1f05 : a5 54 __ LDA T6 + 1 
1f07 : c5 5a __ CMP T9 + 1 
1f09 : d0 08 __ BNE $1f13 ; (bmmc_polygon_nc_fill.s73 + 0)
.s70:
1f0b : a5 53 __ LDA T6 + 0 
1f0d : c5 59 __ CMP T9 + 0 
.s71:
1f0f : 90 08 __ BCC $1f19 ; (bmmc_polygon_nc_fill.s69 + 0)
1f11 : b0 0a __ BCS $1f1d ; (bmmc_polygon_nc_fill.s60 + 0)
.s73:
1f13 : 45 5a __ EOR T9 + 1 
1f15 : 10 f8 __ BPL $1f0f ; (bmmc_polygon_nc_fill.s71 + 0)
.s72:
1f17 : 90 04 __ BCC $1f1d ; (bmmc_polygon_nc_fill.s60 + 0)
.s69:
1f19 : a5 53 __ LDA T6 + 0 
1f1b : 85 59 __ STA T9 + 0 
.s60:
1f1d : 8a __ __ TXA
1f1e : a0 00 __ LDY #$00
1f20 : 91 4f __ STA (T3 + 0),y 
1f22 : a5 59 __ LDA T9 + 0 
1f24 : c8 __ __ INY
1f25 : 91 4f __ STA (T3 + 0),y 
1f27 : a5 5c __ LDA T10 + 1 
1f29 : 85 4a __ STA T1 + 1 
1f2b : a9 00 __ LDA #$00
1f2d : 85 4d __ STA T2 + 0 
1f2f : 85 4e __ STA T2 + 1 
1f31 : a5 5b __ LDA T10 + 0 
1f33 : 85 49 __ STA T1 + 0 
1f35 : 05 5c __ ORA T10 + 1 
1f37 : f0 2e __ BEQ $1f67 ; (bmmc_polygon_nc_fill.s61 + 0)
.s96:
1f39 : a6 02 __ LDX $02 
1f3b : a5 46 __ LDA T0 + 1 
1f3d : 30 26 __ BMI $1f65 ; (bmmc_polygon_nc_fill.s97 + 0)
.l68:
1f3f : d0 08 __ BNE $1f49 ; (bmmc_polygon_nc_fill.s66 + 0)
.s67:
1f41 : a5 45 __ LDA T0 + 0 
1f43 : a0 00 __ LDY #$00
1f45 : d1 49 __ CMP (T1 + 0),y 
1f47 : 90 1c __ BCC $1f65 ; (bmmc_polygon_nc_fill.s97 + 0)
.s66:
1f49 : a5 49 __ LDA T1 + 0 
1f4b : 85 4d __ STA T2 + 0 
1f4d : a5 4a __ LDA T1 + 1 
1f4f : 85 4e __ STA T2 + 1 
1f51 : a0 0a __ LDY #$0a
1f53 : b1 49 __ LDA (T1 + 0),y 
1f55 : aa __ __ TAX
1f56 : c8 __ __ INY
1f57 : b1 49 __ LDA (T1 + 0),y 
1f59 : 86 49 __ STX T1 + 0 
1f5b : 85 4a __ STA T1 + 1 
1f5d : 05 49 __ ORA T1 + 0 
1f5f : f0 04 __ BEQ $1f65 ; (bmmc_polygon_nc_fill.s97 + 0)
.s65:
1f61 : a5 46 __ LDA T0 + 1 
1f63 : 10 da __ BPL $1f3f ; (bmmc_polygon_nc_fill.l68 + 0)
.s97:
1f65 : 86 02 __ STX $02 
.s61:
1f67 : a5 49 __ LDA T1 + 0 
1f69 : a0 0a __ LDY #$0a
1f6b : 91 4f __ STA (T3 + 0),y 
1f6d : a5 4a __ LDA T1 + 1 
1f6f : c8 __ __ INY
1f70 : 91 4f __ STA (T3 + 0),y 
1f72 : a5 4d __ LDA T2 + 0 
1f74 : 05 4e __ ORA T2 + 1 
1f76 : f0 0c __ BEQ $1f84 ; (bmmc_polygon_nc_fill.s62 + 0)
.s64:
1f78 : a5 4f __ LDA T3 + 0 
1f7a : 88 __ __ DEY
1f7b : 91 4d __ STA (T2 + 0),y 
1f7d : a5 50 __ LDA T3 + 1 
1f7f : c8 __ __ INY
1f80 : 91 4d __ STA (T2 + 0),y 
1f82 : d0 08 __ BNE $1f8c ; (bmmc_polygon_nc_fill.s63 + 0)
.s62:
1f84 : a5 4f __ LDA T3 + 0 
1f86 : 85 5b __ STA T10 + 0 
1f88 : a5 50 __ LDA T3 + 1 
1f8a : 85 5c __ STA T10 + 1 
.s63:
1f8c : 18 __ __ CLC
1f8d : a5 4f __ LDA T3 + 0 
1f8f : 69 0c __ ADC #$0c
1f91 : 85 4f __ STA T3 + 0 
1f93 : b0 03 __ BCS $1f98 ; (bmmc_polygon_nc_fill.s100 + 0)
1f95 : 4c 5a 1b JMP $1b5a ; (bmmc_polygon_nc_fill.s53 + 0)
.s100:
1f98 : e6 50 __ INC T3 + 1 
1f9a : 4c 5a 1b JMP $1b5a ; (bmmc_polygon_nc_fill.s53 + 0)
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1f9d : a5 14 __ LDA P7 ; (x0 + 1)
1f9f : 30 0a __ BMI $1fab ; (bm_scan_fill.s24 + 0)
.s27:
1fa1 : c5 0e __ CMP P1 ; (left + 1)
1fa3 : d0 04 __ BNE $1fa9 ; (bm_scan_fill.s26 + 0)
.s25:
1fa5 : a5 13 __ LDA P6 ; (x0 + 0)
1fa7 : c5 0d __ CMP P0 ; (left + 0)
.s26:
1fa9 : b0 08 __ BCS $1fb3 ; (bm_scan_fill.s5 + 0)
.s24:
1fab : a5 0d __ LDA P0 ; (left + 0)
1fad : 85 13 __ STA P6 ; (x0 + 0)
1faf : a5 0e __ LDA P1 ; (left + 1)
1fb1 : 85 14 __ STA P7 ; (x0 + 1)
.s5:
1fb3 : 24 16 __ BIT P9 ; (x1 + 1)
1fb5 : 30 64 __ BMI $201b ; (bm_scan_fill.s3 + 0)
.s23:
1fb7 : a5 10 __ LDA P3 ; (right + 1)
1fb9 : c5 16 __ CMP P9 ; (x1 + 1)
1fbb : f0 03 __ BEQ $1fc0 ; (bm_scan_fill.s21 + 0)
1fbd : 4c 37 21 JMP $2137 ; (bm_scan_fill.s22 + 0)
.s21:
1fc0 : a5 0f __ LDA P2 ; (right + 0)
1fc2 : c5 15 __ CMP P8 ; (x1 + 0)
1fc4 : b0 03 __ BCS $1fc9 ; (bm_scan_fill.s17 + 0)
1fc6 : 4c 21 21 JMP $2121 ; (bm_scan_fill.s18 + 0)
.s17:
1fc9 : a5 14 __ LDA P7 ; (x0 + 1)
1fcb : c5 16 __ CMP P9 ; (x1 + 1)
1fcd : d0 04 __ BNE $1fd3 ; (bm_scan_fill.s20 + 0)
.s16:
1fcf : a5 13 __ LDA P6 ; (x0 + 0)
1fd1 : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
1fd3 : b0 46 __ BCS $201b ; (bm_scan_fill.s3 + 0)
.s6:
1fd5 : a5 13 __ LDA P6 ; (x0 + 0)
1fd7 : 29 f8 __ AND #$f8
1fd9 : 85 1b __ STA ACCU + 0 
1fdb : 65 11 __ ADC P4 ; (lp + 0)
1fdd : 85 43 __ STA T1 + 0 
1fdf : a5 12 __ LDA P5 ; (lp + 1)
1fe1 : 65 14 __ ADC P7 ; (x0 + 1)
1fe3 : 85 44 __ STA T1 + 1 
1fe5 : a5 15 __ LDA P8 ; (x1 + 0)
1fe7 : 29 07 __ AND #$07
1fe9 : aa __ __ TAX
1fea : a5 13 __ LDA P6 ; (x0 + 0)
1fec : 29 07 __ AND #$07
1fee : bc 30 31 LDY $3130,x ; (rmask[0] + 0)
1ff1 : aa __ __ TAX
1ff2 : a5 15 __ LDA P8 ; (x1 + 0)
1ff4 : 29 f8 __ AND #$f8
1ff6 : 38 __ __ SEC
1ff7 : e5 1b __ SBC ACCU + 0 
1ff9 : 85 1b __ STA ACCU + 0 
1ffb : a5 16 __ LDA P9 ; (x1 + 1)
1ffd : e5 14 __ SBC P7 ; (x0 + 1)
1fff : 85 1c __ STA ACCU + 1 
2001 : 05 1b __ ORA ACCU + 0 
2003 : d0 17 __ BNE $201c ; (bm_scan_fill.s7 + 0)
.s15:
2005 : 98 __ __ TYA
2006 : 3d 28 31 AND $3128,x ; (lmask[0] + 0)
2009 : 85 1e __ STA ACCU + 3 
200b : a0 00 __ LDY #$00
.s11:
200d : 49 ff __ EOR #$ff
200f : 31 43 __ AND (T1 + 0),y 
2011 : 85 1b __ STA ACCU + 0 
2013 : a5 17 __ LDA P10 ; (pat + 0)
2015 : 25 1e __ AND ACCU + 3 
2017 : 05 1b __ ORA ACCU + 0 
2019 : 91 43 __ STA (T1 + 0),y 
.s3:
201b : 60 __ __ RTS
.s7:
201c : 84 1e __ STY ACCU + 3 
201e : bd 28 31 LDA $3128,x ; (lmask[0] + 0)
2021 : 49 ff __ EOR #$ff
2023 : a0 00 __ LDY #$00
2025 : 31 43 __ AND (T1 + 0),y 
2027 : 85 1d __ STA ACCU + 2 
2029 : a5 17 __ LDA P10 ; (pat + 0)
202b : 3d 28 31 AND $3128,x ; (lmask[0] + 0)
202e : 05 1d __ ORA ACCU + 2 
2030 : 91 43 __ STA (T1 + 0),y 
2032 : a5 1c __ LDA ACCU + 1 
2034 : d0 03 __ BNE $2039 ; (bm_scan_fill.s14 + 0)
2036 : 4c c4 20 JMP $20c4 ; (bm_scan_fill.s8 + 0)
.s14:
2039 : a5 17 __ LDA P10 ; (pat + 0)
203b : a0 08 __ LDY #$08
203d : 91 43 __ STA (T1 + 0),y 
203f : a0 10 __ LDY #$10
2041 : 91 43 __ STA (T1 + 0),y 
2043 : a0 18 __ LDY #$18
2045 : 91 43 __ STA (T1 + 0),y 
2047 : a0 20 __ LDY #$20
2049 : 91 43 __ STA (T1 + 0),y 
204b : a0 28 __ LDY #$28
204d : 91 43 __ STA (T1 + 0),y 
204f : a0 30 __ LDY #$30
2051 : 91 43 __ STA (T1 + 0),y 
2053 : a0 38 __ LDY #$38
2055 : 91 43 __ STA (T1 + 0),y 
2057 : a0 40 __ LDY #$40
2059 : 91 43 __ STA (T1 + 0),y 
205b : a0 48 __ LDY #$48
205d : 91 43 __ STA (T1 + 0),y 
205f : a0 50 __ LDY #$50
2061 : 91 43 __ STA (T1 + 0),y 
2063 : a0 58 __ LDY #$58
2065 : 91 43 __ STA (T1 + 0),y 
2067 : a0 60 __ LDY #$60
2069 : 91 43 __ STA (T1 + 0),y 
206b : a0 68 __ LDY #$68
206d : 91 43 __ STA (T1 + 0),y 
206f : a0 70 __ LDY #$70
2071 : 91 43 __ STA (T1 + 0),y 
2073 : a0 78 __ LDY #$78
2075 : 91 43 __ STA (T1 + 0),y 
2077 : a0 80 __ LDY #$80
2079 : 91 43 __ STA (T1 + 0),y 
207b : a0 88 __ LDY #$88
207d : 91 43 __ STA (T1 + 0),y 
207f : a0 90 __ LDY #$90
2081 : 91 43 __ STA (T1 + 0),y 
2083 : a0 98 __ LDY #$98
2085 : 91 43 __ STA (T1 + 0),y 
2087 : a0 a0 __ LDY #$a0
2089 : 91 43 __ STA (T1 + 0),y 
208b : a0 a8 __ LDY #$a8
208d : 91 43 __ STA (T1 + 0),y 
208f : a0 b0 __ LDY #$b0
2091 : 91 43 __ STA (T1 + 0),y 
2093 : a0 b8 __ LDY #$b8
2095 : 91 43 __ STA (T1 + 0),y 
2097 : a0 c0 __ LDY #$c0
2099 : 91 43 __ STA (T1 + 0),y 
209b : a0 c8 __ LDY #$c8
209d : 91 43 __ STA (T1 + 0),y 
209f : a0 d0 __ LDY #$d0
20a1 : 91 43 __ STA (T1 + 0),y 
20a3 : a0 d8 __ LDY #$d8
20a5 : 91 43 __ STA (T1 + 0),y 
20a7 : a0 e0 __ LDY #$e0
20a9 : 91 43 __ STA (T1 + 0),y 
20ab : a0 e8 __ LDY #$e8
20ad : 91 43 __ STA (T1 + 0),y 
20af : a0 f0 __ LDY #$f0
20b1 : 91 43 __ STA (T1 + 0),y 
20b3 : a0 f8 __ LDY #$f8
20b5 : 91 43 __ STA (T1 + 0),y 
20b7 : 38 __ __ SEC
20b8 : a5 1b __ LDA ACCU + 0 
20ba : e9 f8 __ SBC #$f8
20bc : 85 1b __ STA ACCU + 0 
20be : e6 44 __ INC T1 + 1 
20c0 : a9 00 __ LDA #$00
20c2 : f0 48 __ BEQ $210c ; (bm_scan_fill.s28 + 0)
.s8:
20c4 : 24 1b __ BIT ACCU + 0 
20c6 : 30 04 __ BMI $20cc ; (bm_scan_fill.s13 + 0)
.s9:
20c8 : a9 08 __ LDA #$08
20ca : d0 40 __ BNE $210c ; (bm_scan_fill.s28 + 0)
.s13:
20cc : a5 17 __ LDA P10 ; (pat + 0)
20ce : a0 08 __ LDY #$08
20d0 : 91 43 __ STA (T1 + 0),y 
20d2 : a0 10 __ LDY #$10
20d4 : 91 43 __ STA (T1 + 0),y 
20d6 : a0 18 __ LDY #$18
20d8 : 91 43 __ STA (T1 + 0),y 
20da : a0 20 __ LDY #$20
20dc : 91 43 __ STA (T1 + 0),y 
20de : a0 28 __ LDY #$28
20e0 : 91 43 __ STA (T1 + 0),y 
20e2 : a0 30 __ LDY #$30
20e4 : 91 43 __ STA (T1 + 0),y 
20e6 : a0 38 __ LDY #$38
20e8 : 91 43 __ STA (T1 + 0),y 
20ea : a0 40 __ LDY #$40
20ec : 91 43 __ STA (T1 + 0),y 
20ee : a0 48 __ LDY #$48
20f0 : 91 43 __ STA (T1 + 0),y 
20f2 : a0 50 __ LDY #$50
20f4 : 91 43 __ STA (T1 + 0),y 
20f6 : a0 58 __ LDY #$58
20f8 : 91 43 __ STA (T1 + 0),y 
20fa : a0 60 __ LDY #$60
20fc : 91 43 __ STA (T1 + 0),y 
20fe : a0 68 __ LDY #$68
2100 : 91 43 __ STA (T1 + 0),y 
2102 : a0 70 __ LDY #$70
2104 : 91 43 __ STA (T1 + 0),y 
2106 : a0 78 __ LDY #$78
2108 : 91 43 __ STA (T1 + 0),y 
210a : a9 80 __ LDA #$80
.s28:
210c : a6 17 __ LDX P10 ; (pat + 0)
210e : 4c 17 21 JMP $2117 ; (bm_scan_fill.l10 + 0)
.s12:
2111 : 8a __ __ TXA
2112 : 91 43 __ STA (T1 + 0),y 
2114 : 98 __ __ TYA
2115 : 69 08 __ ADC #$08
.l10:
2117 : a8 __ __ TAY
2118 : c4 1b __ CPY ACCU + 0 
211a : 90 f5 __ BCC $2111 ; (bm_scan_fill.s12 + 0)
.s29:
211c : a5 1e __ LDA ACCU + 3 
211e : 4c 0d 20 JMP $200d ; (bm_scan_fill.s11 + 0)
.s18:
2121 : 85 15 __ STA P8 ; (x1 + 0)
2123 : a5 10 __ LDA P3 ; (right + 1)
2125 : 85 16 __ STA P9 ; (x1 + 1)
2127 : a5 14 __ LDA P7 ; (x0 + 1)
2129 : c5 10 __ CMP P3 ; (right + 1)
212b : f0 03 __ BEQ $2130 ; (bm_scan_fill.s19 + 0)
212d : 4c d3 1f JMP $1fd3 ; (bm_scan_fill.s20 + 0)
.s19:
2130 : a5 13 __ LDA P6 ; (x0 + 0)
2132 : c5 0f __ CMP P2 ; (right + 0)
2134 : 4c d3 1f JMP $1fd3 ; (bm_scan_fill.s20 + 0)
.s22:
2137 : 90 03 __ BCC $213c ; (bm_scan_fill.s30 + 0)
2139 : 4c c9 1f JMP $1fc9 ; (bm_scan_fill.s17 + 0)
.s30:
213c : a5 0f __ LDA P2 ; (right + 0)
213e : 90 e1 __ BCC $2121 ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
bmmc_line: ; bmmc_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8)->void
;  22, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
2140 : a2 11 __ LDX #$11
2142 : b5 53 __ LDA T1 + 0,x 
2144 : 9d d4 9f STA $9fd4,x ; (bmmc_line@stack + 0)
2147 : ca __ __ DEX
2148 : 10 f8 __ BPL $2142 ; (bmmc_line.s1 + 2)
.s4:
214a : ad f9 9f LDA $9ff9 ; (sstack + 16)
214d : 85 55 __ STA T2 + 0 
214f : ad fa 9f LDA $9ffa ; (sstack + 17)
2152 : 85 56 __ STA T2 + 1 
2154 : ad fd 9f LDA $9ffd ; (sstack + 20)
2157 : 85 53 __ STA T1 + 0 
2159 : 38 __ __ SEC
215a : e5 55 __ SBC T2 + 0 
215c : 85 57 __ STA T3 + 0 
215e : ad fe 9f LDA $9ffe ; (sstack + 21)
2161 : 85 54 __ STA T1 + 1 
2163 : e5 56 __ SBC T2 + 1 
2165 : 85 58 __ STA T3 + 1 
2167 : ad f7 9f LDA $9ff7 ; (sstack + 14)
216a : 85 5b __ STA T5 + 0 
216c : ad fb 9f LDA $9ffb ; (sstack + 18)
216f : 85 59 __ STA T4 + 0 
2171 : 38 __ __ SEC
2172 : e5 5b __ SBC T5 + 0 
2174 : 85 5d __ STA T6 + 0 
2176 : ad fc 9f LDA $9ffc ; (sstack + 19)
2179 : 85 5a __ STA T4 + 1 
217b : ed f8 9f SBC $9ff8 ; (sstack + 15)
217e : 85 5e __ STA T6 + 1 
2180 : ad f5 9f LDA $9ff5 ; (sstack + 12)
2183 : 85 5f __ STA T7 + 0 
2185 : ad f6 9f LDA $9ff6 ; (sstack + 13)
2188 : 85 60 __ STA T7 + 1 
218a : a0 00 __ LDY #$00
218c : b1 5f __ LDA (T7 + 0),y 
218e : 85 61 __ STA T8 + 0 
2190 : c8 __ __ INY
2191 : b1 5f __ LDA (T7 + 0),y 
2193 : 85 62 __ STA T8 + 1 
2195 : ad f8 9f LDA $9ff8 ; (sstack + 15)
2198 : 85 5c __ STA T5 + 1 
219a : c5 5a __ CMP T4 + 1 
219c : d0 09 __ BNE $21a7 ; (bmmc_line.s130 + 0)
.s127:
219e : a5 5b __ LDA T5 + 0 
21a0 : c5 59 __ CMP T4 + 0 
.s128:
21a2 : b0 09 __ BCS $21ad ; (bmmc_line.s5 + 0)
21a4 : 4c b3 25 JMP $25b3 ; (bmmc_line.s104 + 0)
.s130:
21a7 : 45 5a __ EOR T4 + 1 
21a9 : 10 f7 __ BPL $21a2 ; (bmmc_line.s128 + 0)
.s129:
21ab : b0 f7 __ BCS $21a4 ; (bmmc_line.s128 + 2)
.s5:
21ad : a5 5c __ LDA T5 + 1 
21af : c5 5a __ CMP T4 + 1 
21b1 : d0 0b __ BNE $21be ; (bmmc_line.s81 + 0)
.s103:
21b3 : a5 59 __ LDA T4 + 0 
21b5 : c5 5b __ CMP T5 + 0 
21b7 : d0 03 __ BNE $21bc ; (bmmc_line.s141 + 0)
21b9 : 4c 7d 25 JMP $257d ; (bmmc_line.s6 + 0)
.s141:
21bc : a5 5c __ LDA T5 + 1 
.s81:
21be : c5 62 __ CMP T8 + 1 
21c0 : d0 08 __ BNE $21ca ; (bmmc_line.s102 + 0)
.s99:
21c2 : a5 5b __ LDA T5 + 0 
21c4 : c5 61 __ CMP T8 + 0 
.s100:
21c6 : b0 08 __ BCS $21d0 ; (bmmc_line.s82 + 0)
21c8 : 90 25 __ BCC $21ef ; (bmmc_line.s3 + 0)
.s102:
21ca : 45 62 __ EOR T8 + 1 
21cc : 10 f8 __ BPL $21c6 ; (bmmc_line.s100 + 0)
.s101:
21ce : b0 1f __ BCS $21ef ; (bmmc_line.s3 + 0)
.s82:
21d0 : a0 04 __ LDY #$04
21d2 : b1 5f __ LDA (T7 + 0),y 
21d4 : 85 63 __ STA T9 + 0 
21d6 : c8 __ __ INY
21d7 : b1 5f __ LDA (T7 + 0),y 
21d9 : 85 64 __ STA T9 + 1 
21db : a5 5a __ LDA T4 + 1 
21dd : c5 64 __ CMP T9 + 1 
21df : d0 08 __ BNE $21e9 ; (bmmc_line.s98 + 0)
.s95:
21e1 : a5 59 __ LDA T4 + 0 
21e3 : c5 63 __ CMP T9 + 0 
.s96:
21e5 : b0 08 __ BCS $21ef ; (bmmc_line.s3 + 0)
21e7 : 90 11 __ BCC $21fa ; (bmmc_line.s83 + 0)
.s98:
21e9 : 45 64 __ EOR T9 + 1 
21eb : 10 f8 __ BPL $21e5 ; (bmmc_line.s96 + 0)
.s97:
21ed : b0 0b __ BCS $21fa ; (bmmc_line.s83 + 0)
.s3:
21ef : a2 11 __ LDX #$11
21f1 : bd d4 9f LDA $9fd4,x ; (bmmc_line@stack + 0)
21f4 : 95 53 __ STA T1 + 0,x 
21f6 : ca __ __ DEX
21f7 : 10 f8 __ BPL $21f1 ; (bmmc_line.s3 + 2)
21f9 : 60 __ __ RTS
.s83:
21fa : a5 5a __ LDA T4 + 1 
21fc : c5 62 __ CMP T8 + 1 
21fe : d0 08 __ BNE $2208 ; (bmmc_line.s94 + 0)
.s91:
2200 : a5 59 __ LDA T4 + 0 
2202 : c5 61 __ CMP T8 + 0 
.s92:
2204 : 90 08 __ BCC $220e ; (bmmc_line.s90 + 0)
2206 : b0 3f __ BCS $2247 ; (bmmc_line.s84 + 0)
.s94:
2208 : 45 62 __ EOR T8 + 1 
220a : 10 f8 __ BPL $2204 ; (bmmc_line.s92 + 0)
.s93:
220c : 90 39 __ BCC $2247 ; (bmmc_line.s84 + 0)
.s90:
220e : a5 57 __ LDA T3 + 0 
2210 : 85 0f __ STA P2 
2212 : a5 58 __ LDA T3 + 1 
2214 : 85 10 __ STA P3 
2216 : a5 5d __ LDA T6 + 0 
2218 : 85 11 __ STA P4 
221a : a5 5e __ LDA T6 + 1 
221c : 85 12 __ STA P5 
221e : 38 __ __ SEC
221f : a5 61 __ LDA T8 + 0 
2221 : e5 59 __ SBC T4 + 0 
2223 : 85 0d __ STA P0 
2225 : a5 62 __ LDA T8 + 1 
2227 : e5 5a __ SBC T4 + 1 
2229 : 85 0e __ STA P1 
222b : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
222e : 18 __ __ CLC
222f : a5 1b __ LDA ACCU + 0 
2231 : 65 53 __ ADC T1 + 0 
2233 : 8d fd 9f STA $9ffd ; (sstack + 20)
2236 : a5 1c __ LDA ACCU + 1 
2238 : 65 54 __ ADC T1 + 1 
223a : 8d fe 9f STA $9ffe ; (sstack + 21)
223d : a5 61 __ LDA T8 + 0 
223f : 8d fb 9f STA $9ffb ; (sstack + 18)
2242 : a5 62 __ LDA T8 + 1 
2244 : 8d fc 9f STA $9ffc ; (sstack + 19)
.s84:
2247 : a5 5c __ LDA T5 + 1 
2249 : c5 64 __ CMP T9 + 1 
224b : d0 08 __ BNE $2255 ; (bmmc_line.s89 + 0)
.s86:
224d : a5 5b __ LDA T5 + 0 
224f : c5 63 __ CMP T9 + 0 
.s87:
2251 : 90 08 __ BCC $225b ; (bmmc_line.s8 + 0)
2253 : b0 0c __ BCS $2261 ; (bmmc_line.s85 + 0)
.s89:
2255 : 45 64 __ EOR T9 + 1 
2257 : 10 f8 __ BPL $2251 ; (bmmc_line.s87 + 0)
.s88:
2259 : 90 06 __ BCC $2261 ; (bmmc_line.s85 + 0)
.s8:
225b : ae f9 9f LDX $9ff9 ; (sstack + 16)
225e : 4c a7 22 JMP $22a7 ; (bmmc_line.s131 + 0)
.s85:
2261 : a5 57 __ LDA T3 + 0 
2263 : 85 0f __ STA P2 
2265 : a5 58 __ LDA T3 + 1 
2267 : 85 10 __ STA P3 
2269 : a5 5d __ LDA T6 + 0 
226b : 85 11 __ STA P4 
226d : a5 5e __ LDA T6 + 1 
226f : 85 12 __ STA P5 
2271 : 18 __ __ CLC
2272 : a5 5b __ LDA T5 + 0 
2274 : 69 01 __ ADC #$01
2276 : a6 5c __ LDX T5 + 1 
2278 : 90 01 __ BCC $227b ; (bmmc_line.s140 + 0)
.s139:
227a : e8 __ __ INX
.s140:
227b : 38 __ __ SEC
227c : e5 63 __ SBC T9 + 0 
227e : 85 0d __ STA P0 
2280 : 8a __ __ TXA
2281 : e5 64 __ SBC T9 + 1 
2283 : 85 0e __ STA P1 
2285 : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
2288 : 38 __ __ SEC
2289 : a5 55 __ LDA T2 + 0 
228b : e5 1b __ SBC ACCU + 0 
228d : 8d f9 9f STA $9ff9 ; (sstack + 16)
2290 : aa __ __ TAX
2291 : a5 56 __ LDA T2 + 1 
2293 : e5 1c __ SBC ACCU + 1 
2295 : 8d fa 9f STA $9ffa ; (sstack + 17)
2298 : 38 __ __ SEC
2299 : a5 63 __ LDA T9 + 0 
229b : e9 01 __ SBC #$01
229d : 8d f7 9f STA $9ff7 ; (sstack + 14)
22a0 : a5 64 __ LDA T9 + 1 
22a2 : e9 00 __ SBC #$00
22a4 : 8d f8 9f STA $9ff8 ; (sstack + 15)
.s131:
22a7 : ad fa 9f LDA $9ffa ; (sstack + 17)
22aa : cd fe 9f CMP $9ffe ; (sstack + 21)
22ad : d0 04 __ BNE $22b3 ; (bmmc_line.s72 + 0)
.s69:
22af : 8a __ __ TXA
22b0 : 4c 77 25 JMP $2577 ; (bmmc_line.s132 + 0)
.s72:
22b3 : 4d fe 9f EOR $9ffe ; (sstack + 21)
22b6 : 30 05 __ BMI $22bd ; (bmmc_line.s71 + 0)
.s70:
22b8 : b0 05 __ BCS $22bf ; (bmmc_line.s9 + 0)
22ba : 4c 66 24 JMP $2466 ; (bmmc_line.s47 + 0)
.s71:
22bd : b0 fb __ BCS $22ba ; (bmmc_line.s70 + 2)
.s9:
22bf : a0 02 __ LDY #$02
22c1 : b1 5f __ LDA (T7 + 0),y 
22c3 : 85 53 __ STA T1 + 0 
22c5 : c8 __ __ INY
22c6 : b1 5f __ LDA (T7 + 0),y 
22c8 : 85 54 __ STA T1 + 1 
22ca : ad f9 9f LDA $9ff9 ; (sstack + 16)
22cd : 85 55 __ STA T2 + 0 
22cf : ad fa 9f LDA $9ffa ; (sstack + 17)
22d2 : 85 56 __ STA T2 + 1 
22d4 : ad fe 9f LDA $9ffe ; (sstack + 21)
22d7 : c5 56 __ CMP T2 + 1 
22d9 : d0 0a __ BNE $22e5 ; (bmmc_line.s46 + 0)
.s43:
22db : ad fd 9f LDA $9ffd ; (sstack + 20)
22de : c5 55 __ CMP T2 + 0 
.s44:
22e0 : b0 09 __ BCS $22eb ; (bmmc_line.s10 + 0)
22e2 : 4c 68 23 JMP $2368 ; (bmmc_line.s21 + 0)
.s46:
22e5 : 45 56 __ EOR T2 + 1 
22e7 : 10 f7 __ BPL $22e0 ; (bmmc_line.s44 + 0)
.s45:
22e9 : b0 7d __ BCS $2368 ; (bmmc_line.s21 + 0)
.s10:
22eb : a5 56 __ LDA T2 + 1 
22ed : c5 54 __ CMP T1 + 1 
22ef : d0 07 __ BNE $22f8 ; (bmmc_line.s20 + 0)
.s17:
22f1 : a5 55 __ LDA T2 + 0 
22f3 : c5 53 __ CMP T1 + 0 
22f5 : 4c fc 22 JMP $22fc ; (bmmc_line.s18 + 0)
.s20:
22f8 : 45 54 __ EOR T1 + 1 
22fa : 30 67 __ BMI $2363 ; (bmmc_line.s19 + 0)
.s18:
22fc : b0 03 __ BCS $2301 ; (bmmc_line.s11 + 0)
22fe : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s11:
2301 : a5 56 __ LDA T2 + 1 
2303 : a0 07 __ LDY #$07
2305 : d1 5f __ CMP (T7 + 0),y 
2307 : d0 08 __ BNE $2311 ; (bmmc_line.s16 + 0)
.s13:
2309 : a5 55 __ LDA T2 + 0 
230b : 88 __ __ DEY
230c : d1 5f __ CMP (T7 + 0),y 
230e : 4c 15 23 JMP $2315 ; (bmmc_line.s14 + 0)
.s16:
2311 : 51 5f __ EOR (T7 + 0),y 
2313 : 30 49 __ BMI $235e ; (bmmc_line.s15 + 0)
.s14:
2315 : b0 e7 __ BCS $22fe ; (bmmc_line.s18 + 2)
.s12:
2317 : ad ff 9f LDA $9fff ; (sstack + 22)
231a : 85 18 __ STA P11 
231c : ad f3 9f LDA $9ff3 ; (sstack + 10)
231f : 8d e9 9f STA $9fe9 ; (sstack + 0)
2322 : ad f4 9f LDA $9ff4 ; (sstack + 11)
2325 : 8d ea 9f STA $9fea ; (sstack + 1)
2328 : ad f7 9f LDA $9ff7 ; (sstack + 14)
232b : 8d eb 9f STA $9feb ; (sstack + 2)
232e : ad f8 9f LDA $9ff8 ; (sstack + 15)
2331 : 8d ec 9f STA $9fec ; (sstack + 3)
2334 : ad f9 9f LDA $9ff9 ; (sstack + 16)
2337 : 8d ed 9f STA $9fed ; (sstack + 4)
233a : ad fa 9f LDA $9ffa ; (sstack + 17)
233d : 8d ee 9f STA $9fee ; (sstack + 5)
2340 : ad fb 9f LDA $9ffb ; (sstack + 18)
2343 : 8d ef 9f STA $9fef ; (sstack + 6)
2346 : ad fc 9f LDA $9ffc ; (sstack + 19)
2349 : 8d f0 9f STA $9ff0 ; (sstack + 7)
234c : ad fd 9f LDA $9ffd ; (sstack + 20)
234f : 8d f1 9f STA $9ff1 ; (sstack + 8)
2352 : ad fe 9f LDA $9ffe ; (sstack + 21)
2355 : 8d f2 9f STA $9ff2 ; (sstack + 9)
2358 : 20 01 27 JSR $2701 ; (bmmcu_line.s1 + 0)
235b : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s15:
235e : b0 b7 __ BCS $2317 ; (bmmc_line.s12 + 0)
2360 : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s19:
2363 : 90 9c __ BCC $2301 ; (bmmc_line.s11 + 0)
2365 : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s21:
2368 : a5 56 __ LDA T2 + 1 
236a : c5 54 __ CMP T1 + 1 
236c : d0 07 __ BNE $2375 ; (bmmc_line.s42 + 0)
.s39:
236e : a5 55 __ LDA T2 + 0 
2370 : c5 53 __ CMP T1 + 0 
2372 : 4c 7c 23 JMP $237c ; (bmmc_line.s40 + 0)
.s42:
2375 : 45 54 __ EOR T1 + 1 
2377 : 10 03 __ BPL $237c ; (bmmc_line.s40 + 0)
2379 : 4c 61 24 JMP $2461 ; (bmmc_line.s41 + 0)
.s40:
237c : 90 e7 __ BCC $2365 ; (bmmc_line.s19 + 2)
.s22:
237e : a0 06 __ LDY #$06
2380 : b1 5f __ LDA (T7 + 0),y 
2382 : 85 59 __ STA T4 + 0 
2384 : c8 __ __ INY
2385 : b1 5f __ LDA (T7 + 0),y 
2387 : 85 5a __ STA T4 + 1 
2389 : ad fe 9f LDA $9ffe ; (sstack + 21)
238c : c5 5a __ CMP T4 + 1 
238e : d0 08 __ BNE $2398 ; (bmmc_line.s38 + 0)
.s35:
2390 : ad fd 9f LDA $9ffd ; (sstack + 20)
2393 : c5 59 __ CMP T4 + 0 
2395 : 4c 9f 23 JMP $239f ; (bmmc_line.s36 + 0)
.s38:
2398 : 45 5a __ EOR T4 + 1 
239a : 10 03 __ BPL $239f ; (bmmc_line.s36 + 0)
239c : 4c 59 24 JMP $2459 ; (bmmc_line.s37 + 0)
.s36:
239f : b0 c4 __ BCS $2365 ; (bmmc_line.s19 + 2)
.s23:
23a1 : ad fe 9f LDA $9ffe ; (sstack + 21)
23a4 : c5 54 __ CMP T1 + 1 
23a6 : d0 09 __ BNE $23b1 ; (bmmc_line.s34 + 0)
.s31:
23a8 : ad fd 9f LDA $9ffd ; (sstack + 20)
23ab : c5 53 __ CMP T1 + 0 
.s32:
23ad : 90 08 __ BCC $23b7 ; (bmmc_line.s30 + 0)
23af : b0 43 __ BCS $23f4 ; (bmmc_line.s24 + 0)
.s34:
23b1 : 45 54 __ EOR T1 + 1 
23b3 : 10 f8 __ BPL $23ad ; (bmmc_line.s32 + 0)
.s33:
23b5 : 90 3d __ BCC $23f4 ; (bmmc_line.s24 + 0)
.s30:
23b7 : a5 5d __ LDA T6 + 0 
23b9 : 85 0f __ STA P2 
23bb : a5 5e __ LDA T6 + 1 
23bd : 85 10 __ STA P3 
23bf : a5 57 __ LDA T3 + 0 
23c1 : 85 11 __ STA P4 
23c3 : a5 58 __ LDA T3 + 1 
23c5 : 85 12 __ STA P5 
23c7 : 38 __ __ SEC
23c8 : a5 53 __ LDA T1 + 0 
23ca : ed fd 9f SBC $9ffd ; (sstack + 20)
23cd : 85 0d __ STA P0 
23cf : a5 54 __ LDA T1 + 1 
23d1 : ed fe 9f SBC $9ffe ; (sstack + 21)
23d4 : 85 0e __ STA P1 
23d6 : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
23d9 : a5 53 __ LDA T1 + 0 
23db : 8d fd 9f STA $9ffd ; (sstack + 20)
23de : a5 54 __ LDA T1 + 1 
23e0 : 8d fe 9f STA $9ffe ; (sstack + 21)
23e3 : ad fb 9f LDA $9ffb ; (sstack + 18)
23e6 : 18 __ __ CLC
23e7 : 65 1b __ ADC ACCU + 0 
23e9 : 8d fb 9f STA $9ffb ; (sstack + 18)
23ec : ad fc 9f LDA $9ffc ; (sstack + 19)
23ef : 65 1c __ ADC ACCU + 1 
23f1 : 8d fc 9f STA $9ffc ; (sstack + 19)
.s24:
23f4 : a5 56 __ LDA T2 + 1 
23f6 : c5 5a __ CMP T4 + 1 
23f8 : d0 07 __ BNE $2401 ; (bmmc_line.s29 + 0)
.s26:
23fa : a5 55 __ LDA T2 + 0 
23fc : c5 59 __ CMP T4 + 0 
23fe : 4c 05 24 JMP $2405 ; (bmmc_line.s27 + 0)
.s29:
2401 : 45 5a __ EOR T4 + 1 
2403 : 30 4f __ BMI $2454 ; (bmmc_line.s28 + 0)
.s27:
2405 : b0 03 __ BCS $240a ; (bmmc_line.s25 + 0)
2407 : 4c 17 23 JMP $2317 ; (bmmc_line.s12 + 0)
.s25:
240a : a5 5d __ LDA T6 + 0 
240c : 85 0f __ STA P2 
240e : a5 5e __ LDA T6 + 1 
2410 : 85 10 __ STA P3 
2412 : a5 57 __ LDA T3 + 0 
2414 : 85 11 __ STA P4 
2416 : a5 58 __ LDA T3 + 1 
2418 : 85 12 __ STA P5 
241a : 18 __ __ CLC
241b : a5 55 __ LDA T2 + 0 
241d : 69 01 __ ADC #$01
241f : a6 56 __ LDX T2 + 1 
2421 : 90 01 __ BCC $2424 ; (bmmc_line.s136 + 0)
.s135:
2423 : e8 __ __ INX
.s136:
2424 : 38 __ __ SEC
2425 : e5 59 __ SBC T4 + 0 
2427 : 85 0d __ STA P0 
2429 : 8a __ __ TXA
242a : e5 5a __ SBC T4 + 1 
242c : 85 0e __ STA P1 
242e : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
2431 : ad f7 9f LDA $9ff7 ; (sstack + 14)
2434 : 38 __ __ SEC
2435 : e5 1b __ SBC ACCU + 0 
2437 : 8d f7 9f STA $9ff7 ; (sstack + 14)
243a : ad f8 9f LDA $9ff8 ; (sstack + 15)
243d : e5 1c __ SBC ACCU + 1 
243f : 8d f8 9f STA $9ff8 ; (sstack + 15)
2442 : 38 __ __ SEC
2443 : a5 59 __ LDA T4 + 0 
2445 : e9 01 __ SBC #$01
2447 : 8d f9 9f STA $9ff9 ; (sstack + 16)
244a : a5 5a __ LDA T4 + 1 
244c : e9 00 __ SBC #$00
244e : 8d fa 9f STA $9ffa ; (sstack + 17)
2451 : 4c 17 23 JMP $2317 ; (bmmc_line.s12 + 0)
.s28:
2454 : 90 b4 __ BCC $240a ; (bmmc_line.s25 + 0)
2456 : 4c 17 23 JMP $2317 ; (bmmc_line.s12 + 0)
.s37:
2459 : 90 03 __ BCC $245e ; (bmmc_line.s37 + 5)
245b : 4c a1 23 JMP $23a1 ; (bmmc_line.s23 + 0)
245e : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s41:
2461 : b0 fb __ BCS $245e ; (bmmc_line.s37 + 5)
2463 : 4c 7e 23 JMP $237e ; (bmmc_line.s22 + 0)
.s47:
2466 : ad fd 9f LDA $9ffd ; (sstack + 20)
2469 : 85 55 __ STA T2 + 0 
246b : a0 02 __ LDY #$02
246d : b1 5f __ LDA (T7 + 0),y 
246f : 85 53 __ STA T1 + 0 
2471 : c8 __ __ INY
2472 : b1 5f __ LDA (T7 + 0),y 
2474 : 85 54 __ STA T1 + 1 
2476 : ad fe 9f LDA $9ffe ; (sstack + 21)
2479 : 85 56 __ STA T2 + 1 
247b : c5 54 __ CMP T1 + 1 
247d : d0 07 __ BNE $2486 ; (bmmc_line.s68 + 0)
.s65:
247f : a5 55 __ LDA T2 + 0 
2481 : c5 53 __ CMP T1 + 0 
2483 : 4c 8d 24 JMP $248d ; (bmmc_line.s66 + 0)
.s68:
2486 : 45 54 __ EOR T1 + 1 
2488 : 10 03 __ BPL $248d ; (bmmc_line.s66 + 0)
248a : 4c 72 25 JMP $2572 ; (bmmc_line.s67 + 0)
.s66:
248d : 90 cf __ BCC $245e ; (bmmc_line.s37 + 5)
.s48:
248f : a0 06 __ LDY #$06
2491 : b1 5f __ LDA (T7 + 0),y 
2493 : 85 59 __ STA T4 + 0 
2495 : c8 __ __ INY
2496 : b1 5f __ LDA (T7 + 0),y 
2498 : 85 5a __ STA T4 + 1 
249a : ad fa 9f LDA $9ffa ; (sstack + 17)
249d : c5 5a __ CMP T4 + 1 
249f : d0 08 __ BNE $24a9 ; (bmmc_line.s64 + 0)
.s61:
24a1 : ad f9 9f LDA $9ff9 ; (sstack + 16)
24a4 : c5 59 __ CMP T4 + 0 
24a6 : 4c b0 24 JMP $24b0 ; (bmmc_line.s62 + 0)
.s64:
24a9 : 45 5a __ EOR T4 + 1 
24ab : 10 03 __ BPL $24b0 ; (bmmc_line.s62 + 0)
24ad : 4c 6a 25 JMP $256a ; (bmmc_line.s63 + 0)
.s62:
24b0 : b0 ac __ BCS $245e ; (bmmc_line.s37 + 5)
.s49:
24b2 : ad fa 9f LDA $9ffa ; (sstack + 17)
24b5 : c5 54 __ CMP T1 + 1 
24b7 : d0 09 __ BNE $24c2 ; (bmmc_line.s60 + 0)
.s57:
24b9 : ad f9 9f LDA $9ff9 ; (sstack + 16)
24bc : c5 53 __ CMP T1 + 0 
.s58:
24be : 90 08 __ BCC $24c8 ; (bmmc_line.s56 + 0)
24c0 : b0 43 __ BCS $2505 ; (bmmc_line.s50 + 0)
.s60:
24c2 : 45 54 __ EOR T1 + 1 
24c4 : 10 f8 __ BPL $24be ; (bmmc_line.s58 + 0)
.s59:
24c6 : 90 3d __ BCC $2505 ; (bmmc_line.s50 + 0)
.s56:
24c8 : a5 5d __ LDA T6 + 0 
24ca : 85 0f __ STA P2 
24cc : a5 5e __ LDA T6 + 1 
24ce : 85 10 __ STA P3 
24d0 : a5 57 __ LDA T3 + 0 
24d2 : 85 11 __ STA P4 
24d4 : a5 58 __ LDA T3 + 1 
24d6 : 85 12 __ STA P5 
24d8 : 38 __ __ SEC
24d9 : a5 53 __ LDA T1 + 0 
24db : ed f9 9f SBC $9ff9 ; (sstack + 16)
24de : 85 0d __ STA P0 
24e0 : a5 54 __ LDA T1 + 1 
24e2 : ed fa 9f SBC $9ffa ; (sstack + 17)
24e5 : 85 0e __ STA P1 
24e7 : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
24ea : a5 53 __ LDA T1 + 0 
24ec : 8d f9 9f STA $9ff9 ; (sstack + 16)
24ef : a5 54 __ LDA T1 + 1 
24f1 : 8d fa 9f STA $9ffa ; (sstack + 17)
24f4 : ad f7 9f LDA $9ff7 ; (sstack + 14)
24f7 : 18 __ __ CLC
24f8 : 65 1b __ ADC ACCU + 0 
24fa : 8d f7 9f STA $9ff7 ; (sstack + 14)
24fd : ad f8 9f LDA $9ff8 ; (sstack + 15)
2500 : 65 1c __ ADC ACCU + 1 
2502 : 8d f8 9f STA $9ff8 ; (sstack + 15)
.s50:
2505 : a5 56 __ LDA T2 + 1 
2507 : c5 5a __ CMP T4 + 1 
2509 : d0 07 __ BNE $2512 ; (bmmc_line.s55 + 0)
.s52:
250b : a5 55 __ LDA T2 + 0 
250d : c5 59 __ CMP T4 + 0 
250f : 4c 16 25 JMP $2516 ; (bmmc_line.s53 + 0)
.s55:
2512 : 45 5a __ EOR T4 + 1 
2514 : 30 4f __ BMI $2565 ; (bmmc_line.s54 + 0)
.s53:
2516 : b0 03 __ BCS $251b ; (bmmc_line.s51 + 0)
2518 : 4c 17 23 JMP $2317 ; (bmmc_line.s12 + 0)
.s51:
251b : a5 5d __ LDA T6 + 0 
251d : 85 0f __ STA P2 
251f : a5 5e __ LDA T6 + 1 
2521 : 85 10 __ STA P3 
2523 : a5 57 __ LDA T3 + 0 
2525 : 85 11 __ STA P4 
2527 : a5 58 __ LDA T3 + 1 
2529 : 85 12 __ STA P5 
252b : 18 __ __ CLC
252c : a5 55 __ LDA T2 + 0 
252e : 69 01 __ ADC #$01
2530 : a6 56 __ LDX T2 + 1 
2532 : 90 01 __ BCC $2535 ; (bmmc_line.s134 + 0)
.s133:
2534 : e8 __ __ INX
.s134:
2535 : 38 __ __ SEC
2536 : e5 59 __ SBC T4 + 0 
2538 : 85 0d __ STA P0 
253a : 8a __ __ TXA
253b : e5 5a __ SBC T4 + 1 
253d : 85 0e __ STA P1 
253f : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
2542 : ad fb 9f LDA $9ffb ; (sstack + 18)
2545 : 38 __ __ SEC
2546 : e5 1b __ SBC ACCU + 0 
2548 : 8d fb 9f STA $9ffb ; (sstack + 18)
254b : ad fc 9f LDA $9ffc ; (sstack + 19)
254e : e5 1c __ SBC ACCU + 1 
2550 : 8d fc 9f STA $9ffc ; (sstack + 19)
2553 : 38 __ __ SEC
2554 : a5 59 __ LDA T4 + 0 
2556 : e9 01 __ SBC #$01
2558 : 8d fd 9f STA $9ffd ; (sstack + 20)
255b : a5 5a __ LDA T4 + 1 
255d : e9 00 __ SBC #$00
255f : 8d fe 9f STA $9ffe ; (sstack + 21)
2562 : 4c 17 23 JMP $2317 ; (bmmc_line.s12 + 0)
.s54:
2565 : 90 b4 __ BCC $251b ; (bmmc_line.s51 + 0)
2567 : 4c 17 23 JMP $2317 ; (bmmc_line.s12 + 0)
.s63:
256a : 90 03 __ BCC $256f ; (bmmc_line.s63 + 5)
256c : 4c b2 24 JMP $24b2 ; (bmmc_line.s49 + 0)
256f : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s67:
2572 : b0 fb __ BCS $256f ; (bmmc_line.s63 + 5)
2574 : 4c 8f 24 JMP $248f ; (bmmc_line.s48 + 0)
.s132:
2577 : cd fd 9f CMP $9ffd ; (sstack + 20)
257a : 4c b8 22 JMP $22b8 ; (bmmc_line.s70 + 0)
.s6:
257d : a5 5c __ LDA T5 + 1 
257f : c5 62 __ CMP T8 + 1 
2581 : d0 07 __ BNE $258a ; (bmmc_line.s80 + 0)
.s77:
2583 : a5 5b __ LDA T5 + 0 
2585 : c5 61 __ CMP T8 + 0 
2587 : 4c 8e 25 JMP $258e ; (bmmc_line.s78 + 0)
.s80:
258a : 45 62 __ EOR T8 + 1 
258c : 30 20 __ BMI $25ae ; (bmmc_line.s79 + 0)
.s78:
258e : 90 df __ BCC $256f ; (bmmc_line.s63 + 5)
.s7:
2590 : a5 5c __ LDA T5 + 1 
2592 : a0 05 __ LDY #$05
2594 : d1 5f __ CMP (T7 + 0),y 
2596 : d0 08 __ BNE $25a0 ; (bmmc_line.s76 + 0)
.s73:
2598 : a5 5b __ LDA T5 + 0 
259a : 88 __ __ DEY
259b : d1 5f __ CMP (T7 + 0),y 
259d : 4c a4 25 JMP $25a4 ; (bmmc_line.s74 + 0)
.s76:
25a0 : 51 5f __ EOR (T7 + 0),y 
25a2 : 30 05 __ BMI $25a9 ; (bmmc_line.s75 + 0)
.s74:
25a4 : b0 c9 __ BCS $256f ; (bmmc_line.s63 + 5)
25a6 : 4c 5b 22 JMP $225b ; (bmmc_line.s8 + 0)
.s75:
25a9 : b0 fb __ BCS $25a6 ; (bmmc_line.s74 + 2)
25ab : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s79:
25ae : 90 e0 __ BCC $2590 ; (bmmc_line.s7 + 0)
25b0 : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s104:
25b3 : a5 5a __ LDA T4 + 1 
25b5 : c5 62 __ CMP T8 + 1 
25b7 : d0 07 __ BNE $25c0 ; (bmmc_line.s126 + 0)
.s123:
25b9 : a5 59 __ LDA T4 + 0 
25bb : c5 61 __ CMP T8 + 0 
25bd : 4c c7 25 JMP $25c7 ; (bmmc_line.s124 + 0)
.s126:
25c0 : 45 62 __ EOR T8 + 1 
25c2 : 10 03 __ BPL $25c7 ; (bmmc_line.s124 + 0)
25c4 : 4c b0 26 JMP $26b0 ; (bmmc_line.s125 + 0)
.s124:
25c7 : 90 e7 __ BCC $25b0 ; (bmmc_line.s79 + 2)
.s105:
25c9 : a0 04 __ LDY #$04
25cb : b1 5f __ LDA (T7 + 0),y 
25cd : 85 63 __ STA T9 + 0 
25cf : c8 __ __ INY
25d0 : b1 5f __ LDA (T7 + 0),y 
25d2 : 85 64 __ STA T9 + 1 
25d4 : a5 5c __ LDA T5 + 1 
25d6 : c5 64 __ CMP T9 + 1 
25d8 : d0 07 __ BNE $25e1 ; (bmmc_line.s122 + 0)
.s119:
25da : a5 5b __ LDA T5 + 0 
25dc : c5 63 __ CMP T9 + 0 
25de : 4c e8 25 JMP $25e8 ; (bmmc_line.s120 + 0)
.s122:
25e1 : 45 64 __ EOR T9 + 1 
25e3 : 10 03 __ BPL $25e8 ; (bmmc_line.s120 + 0)
25e5 : 4c a8 26 JMP $26a8 ; (bmmc_line.s121 + 0)
.s120:
25e8 : b0 c6 __ BCS $25b0 ; (bmmc_line.s79 + 2)
.s106:
25ea : a5 5c __ LDA T5 + 1 
25ec : c5 62 __ CMP T8 + 1 
25ee : d0 08 __ BNE $25f8 ; (bmmc_line.s118 + 0)
.s115:
25f0 : a5 5b __ LDA T5 + 0 
25f2 : c5 61 __ CMP T8 + 0 
.s116:
25f4 : 90 08 __ BCC $25fe ; (bmmc_line.s114 + 0)
25f6 : b0 3f __ BCS $2637 ; (bmmc_line.s107 + 0)
.s118:
25f8 : 45 62 __ EOR T8 + 1 
25fa : 10 f8 __ BPL $25f4 ; (bmmc_line.s116 + 0)
.s117:
25fc : 90 39 __ BCC $2637 ; (bmmc_line.s107 + 0)
.s114:
25fe : a5 57 __ LDA T3 + 0 
2600 : 85 0f __ STA P2 
2602 : a5 58 __ LDA T3 + 1 
2604 : 85 10 __ STA P3 
2606 : a5 5d __ LDA T6 + 0 
2608 : 85 11 __ STA P4 
260a : a5 5e __ LDA T6 + 1 
260c : 85 12 __ STA P5 
260e : 38 __ __ SEC
260f : a5 61 __ LDA T8 + 0 
2611 : e5 5b __ SBC T5 + 0 
2613 : 85 0d __ STA P0 
2615 : a5 62 __ LDA T8 + 1 
2617 : e5 5c __ SBC T5 + 1 
2619 : 85 0e __ STA P1 
261b : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
261e : 18 __ __ CLC
261f : a5 1b __ LDA ACCU + 0 
2621 : 65 55 __ ADC T2 + 0 
2623 : 8d f9 9f STA $9ff9 ; (sstack + 16)
2626 : a5 1c __ LDA ACCU + 1 
2628 : 65 56 __ ADC T2 + 1 
262a : 8d fa 9f STA $9ffa ; (sstack + 17)
262d : a5 61 __ LDA T8 + 0 
262f : 8d f7 9f STA $9ff7 ; (sstack + 14)
2632 : a5 62 __ LDA T8 + 1 
2634 : 8d f8 9f STA $9ff8 ; (sstack + 15)
.s107:
2637 : a5 5a __ LDA T4 + 1 
2639 : c5 64 __ CMP T9 + 1 
263b : d0 07 __ BNE $2644 ; (bmmc_line.s113 + 0)
.s110:
263d : a5 59 __ LDA T4 + 0 
263f : c5 63 __ CMP T9 + 0 
2641 : 4c 48 26 JMP $2648 ; (bmmc_line.s111 + 0)
.s113:
2644 : 45 64 __ EOR T9 + 1 
2646 : 30 5b __ BMI $26a3 ; (bmmc_line.s112 + 0)
.s111:
2648 : b0 03 __ BCS $264d ; (bmmc_line.s108 + 0)
264a : 4c 5b 22 JMP $225b ; (bmmc_line.s8 + 0)
.s108:
264d : a5 57 __ LDA T3 + 0 
264f : 85 0f __ STA P2 
2651 : a5 58 __ LDA T3 + 1 
2653 : 85 10 __ STA P3 
2655 : a5 5d __ LDA T6 + 0 
2657 : 85 11 __ STA P4 
2659 : a5 5e __ LDA T6 + 1 
265b : 85 12 __ STA P5 
265d : 18 __ __ CLC
265e : a5 59 __ LDA T4 + 0 
2660 : 69 01 __ ADC #$01
2662 : a6 5a __ LDX T4 + 1 
2664 : 90 01 __ BCC $2667 ; (bmmc_line.s138 + 0)
.s137:
2666 : e8 __ __ INX
.s138:
2667 : 38 __ __ SEC
2668 : e5 63 __ SBC T9 + 0 
266a : 85 0d __ STA P0 
266c : 8a __ __ TXA
266d : e5 64 __ SBC T9 + 1 
266f : 85 0e __ STA P1 
2671 : 20 b5 26 JSR $26b5 ; (mmuldiv.s4 + 0)
2674 : 38 __ __ SEC
2675 : a5 53 __ LDA T1 + 0 
2677 : e5 1b __ SBC ACCU + 0 
2679 : 8d fd 9f STA $9ffd ; (sstack + 20)
267c : a5 54 __ LDA T1 + 1 
267e : e5 1c __ SBC ACCU + 1 
2680 : 8d fe 9f STA $9ffe ; (sstack + 21)
2683 : 38 __ __ SEC
2684 : a5 63 __ LDA T9 + 0 
2686 : e9 01 __ SBC #$01
2688 : 8d fb 9f STA $9ffb ; (sstack + 18)
268b : a5 64 __ LDA T9 + 1 
268d : e9 00 __ SBC #$00
268f : 8d fc 9f STA $9ffc ; (sstack + 19)
2692 : ad fa 9f LDA $9ffa ; (sstack + 17)
2695 : cd fe 9f CMP $9ffe ; (sstack + 21)
2698 : f0 03 __ BEQ $269d ; (bmmc_line.s109 + 0)
269a : 4c b3 22 JMP $22b3 ; (bmmc_line.s72 + 0)
.s109:
269d : ad f9 9f LDA $9ff9 ; (sstack + 16)
26a0 : 4c 77 25 JMP $2577 ; (bmmc_line.s132 + 0)
.s112:
26a3 : 90 a8 __ BCC $264d ; (bmmc_line.s108 + 0)
26a5 : 4c 5b 22 JMP $225b ; (bmmc_line.s8 + 0)
.s121:
26a8 : 90 03 __ BCC $26ad ; (bmmc_line.s121 + 5)
26aa : 4c ea 25 JMP $25ea ; (bmmc_line.s106 + 0)
26ad : 4c ef 21 JMP $21ef ; (bmmc_line.s3 + 0)
.s125:
26b0 : b0 fb __ BCS $26ad ; (bmmc_line.s121 + 5)
26b2 : 4c c9 25 JMP $25c9 ; (bmmc_line.s105 + 0)
--------------------------------------------------------------------
mmuldiv: ; mmuldiv(i16,i16,i16)->i16
; 665, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.c"
.s4:
26b5 : a5 0e __ LDA P1 ; (x + 1)
26b7 : 85 04 __ STA WORK + 1 
26b9 : 29 80 __ AND #$80
26bb : 10 02 __ BPL $26bf ; (mmuldiv.s4 + 10)
26bd : a9 ff __ LDA #$ff
26bf : 85 06 __ STA WORK + 3 
26c1 : 85 05 __ STA WORK + 2 
26c3 : a5 10 __ LDA P3 ; (mul + 1)
26c5 : 85 1c __ STA ACCU + 1 
26c7 : 29 80 __ AND #$80
26c9 : 10 02 __ BPL $26cd ; (mmuldiv.s4 + 24)
26cb : a9 ff __ LDA #$ff
26cd : 85 1e __ STA ACCU + 3 
26cf : 85 1d __ STA ACCU + 2 
26d1 : a5 0f __ LDA P2 ; (mul + 0)
26d3 : 85 1b __ STA ACCU + 0 
26d5 : a5 0d __ LDA P0 ; (x + 0)
26d7 : 85 03 __ STA WORK + 0 
26d9 : 20 96 2f JSR $2f96 ; (mul32 + 0)
26dc : a5 12 __ LDA P5 ; (div + 1)
26de : 85 04 __ STA WORK + 1 
26e0 : 29 80 __ AND #$80
26e2 : 10 02 __ BPL $26e6 ; (mmuldiv.s4 + 49)
26e4 : a9 ff __ LDA #$ff
26e6 : 85 06 __ STA WORK + 3 
26e8 : 85 05 __ STA WORK + 2 
26ea : a5 07 __ LDA WORK + 4 
26ec : 85 1b __ STA ACCU + 0 
26ee : a5 08 __ LDA WORK + 5 
26f0 : 85 1c __ STA ACCU + 1 
26f2 : a5 09 __ LDA WORK + 6 
26f4 : 85 1d __ STA ACCU + 2 
26f6 : a5 0a __ LDA WORK + 7 
26f8 : 85 1e __ STA ACCU + 3 
26fa : a5 11 __ LDA P4 ; (div + 0)
26fc : 85 03 __ STA WORK + 0 
26fe : 4c fe 2f JMP $2ffe ; (divs32 + 0)
--------------------------------------------------------------------
bmmcu_line: ; bmmcu_line(const struct Bitmap*,i16,i16,i16,i16,u8)->void
;  19, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
2701 : a5 53 __ LDA T9 + 0 
2703 : 8d e6 9f STA $9fe6 ; (bmmcu_line@stack + 0)
.s4:
2706 : ad ed 9f LDA $9fed ; (sstack + 4)
2709 : 85 48 __ STA T3 + 0 
270b : 29 07 __ AND #$07
270d : 85 0d __ STA P0 
270f : ad ee 9f LDA $9fee ; (sstack + 5)
2712 : 85 49 __ STA T3 + 1 
2714 : a6 18 __ LDX P11 ; (color + 0)
2716 : bd c4 31 LDA $31c4,x ; (cbytes[0] + 0)
2719 : 49 ff __ EOR #$ff
271b : 85 17 __ STA P10 
271d : ad f0 9f LDA $9ff0 ; (sstack + 7)
2720 : c9 80 __ CMP #$80
2722 : 6a __ __ ROR
2723 : aa __ __ TAX
2724 : ad ef 9f LDA $9fef ; (sstack + 6)
2727 : 6a __ __ ROR
2728 : 85 45 __ STA T1 + 0 
272a : ad ec 9f LDA $9fec ; (sstack + 3)
272d : c9 80 __ CMP #$80
272f : 6a __ __ ROR
2730 : 85 4b __ STA T4 + 1 
2732 : ad eb 9f LDA $9feb ; (sstack + 2)
2735 : 6a __ __ ROR
2736 : 85 4a __ STA T4 + 0 
2738 : 49 ff __ EOR #$ff
273a : 38 __ __ SEC
273b : 65 45 __ ADC T1 + 0 
273d : 85 4c __ STA T5 + 0 
273f : 8a __ __ TXA
2740 : e5 4b __ SBC T4 + 1 
2742 : 85 4d __ STA T5 + 1 
2744 : 10 11 __ BPL $2757 ; (bmmcu_line.s5 + 0)
.s15:
2746 : 38 __ __ SEC
2747 : a9 00 __ LDA #$00
2749 : e5 4c __ SBC T5 + 0 
274b : 85 4c __ STA T5 + 0 
274d : a9 00 __ LDA #$00
274f : e5 4d __ SBC T5 + 1 
2751 : 85 4d __ STA T5 + 1 
2753 : a0 01 __ LDY #$01
2755 : d0 02 __ BNE $2759 ; (bmmcu_line.s6 + 0)
.s5:
2757 : a0 00 __ LDY #$00
.s6:
2759 : ad f1 9f LDA $9ff1 ; (sstack + 8)
275c : 38 __ __ SEC
275d : e5 48 __ SBC T3 + 0 
275f : 85 4e __ STA T6 + 0 
2761 : ad f2 9f LDA $9ff2 ; (sstack + 9)
2764 : e5 49 __ SBC T3 + 1 
2766 : 85 4f __ STA T6 + 1 
2768 : 10 15 __ BPL $277f ; (bmmcu_line.s7 + 0)
.s13:
276a : 98 __ __ TYA
276b : 09 02 __ ORA #$02
276d : a8 __ __ TAY
276e : 38 __ __ SEC
276f : a9 00 __ LDA #$00
2771 : e5 4e __ SBC T6 + 0 
2773 : 85 4e __ STA T6 + 0 
2775 : a9 00 __ LDA #$00
2777 : e5 4f __ SBC T6 + 1 
2779 : 85 4f __ STA T6 + 1 
277b : 24 4d __ BIT T5 + 1 
277d : 30 10 __ BMI $278f ; (bmmcu_line.s8 + 0)
.s7:
277f : c5 4d __ CMP T5 + 1 
2781 : d0 04 __ BNE $2787 ; (bmmcu_line.s14 + 0)
.s16:
2783 : a5 4e __ LDA T6 + 0 
2785 : c5 4c __ CMP T5 + 0 
.s14:
2787 : b0 06 __ BCS $278f ; (bmmcu_line.s8 + 0)
.s12:
2789 : a5 4d __ LDA T5 + 1 
278b : a6 4c __ LDX T5 + 0 
278d : 90 04 __ BCC $2793 ; (bmmcu_line.s9 + 0)
.s8:
278f : a5 4f __ LDA T6 + 1 
2791 : a6 4e __ LDX T6 + 0 
.s9:
2793 : 84 43 __ STY T0 + 0 
2795 : 85 51 __ STA T7 + 1 
2797 : 98 __ __ TYA
2798 : 29 02 __ AND #$02
279a : f0 02 __ BEQ $279e ; (bmmcu_line.s18 + 0)
.s17:
279c : a9 01 __ LDA #$01
.s18:
279e : 85 16 __ STA P9 
27a0 : ad e9 9f LDA $9fe9 ; (sstack + 0)
27a3 : 85 45 __ STA T1 + 0 
27a5 : ad ea 9f LDA $9fea ; (sstack + 1)
27a8 : 85 46 __ STA T1 + 1 
27aa : a0 04 __ LDY #$04
27ac : b1 45 __ LDA (T1 + 0),y 
27ae : 85 52 __ STA T8 + 0 
27b0 : 0a __ __ ASL
27b1 : 85 47 __ STA T2 + 0 
27b3 : a9 00 __ LDA #$00
27b5 : 2a __ __ ROL
27b6 : 06 47 __ ASL T2 + 0 
27b8 : 2a __ __ ROL
27b9 : 06 47 __ ASL T2 + 0 
27bb : 2a __ __ ROL
27bc : 85 14 __ STA P7 
27be : a5 16 __ LDA P9 
27c0 : f0 0d __ BEQ $27cf ; (bmmcu_line.s10 + 0)
.s11:
27c2 : 38 __ __ SEC
27c3 : a9 00 __ LDA #$00
27c5 : e5 47 __ SBC T2 + 0 
27c7 : 85 47 __ STA T2 + 0 
27c9 : a9 00 __ LDA #$00
27cb : e5 14 __ SBC P7 
27cd : 85 14 __ STA P7 
.s10:
27cf : e8 __ __ INX
27d0 : 86 0e __ STX P1 
27d2 : a5 47 __ LDA T2 + 0 
27d4 : 85 13 __ STA P6 
27d6 : a5 43 __ LDA T0 + 0 
27d8 : 29 01 __ AND #$01
27da : 85 15 __ STA P8 
27dc : a5 4c __ LDA T5 + 0 
27de : 0a __ __ ASL
27df : 85 0f __ STA P2 
27e1 : a5 4d __ LDA T5 + 1 
27e3 : 2a __ __ ROL
27e4 : 85 10 __ STA P3 
27e6 : a5 4e __ LDA T6 + 0 
27e8 : 0a __ __ ASL
27e9 : 85 11 __ STA P4 
27eb : a5 4f __ LDA T6 + 1 
27ed : 2a __ __ ROL
27ee : 85 12 __ STA P5 
27f0 : a5 4a __ LDA T4 + 0 
27f2 : 29 03 __ AND #$03
27f4 : 0a __ __ ASL
27f5 : aa __ __ TAX
27f6 : bd bc 31 LDA $31bc,x ; (ormask[0] + 0)
27f9 : 85 53 __ STA T9 + 0 
27fb : a0 00 __ LDY #$00
27fd : b1 45 __ LDA (T1 + 0),y 
27ff : aa __ __ TAX
2800 : c8 __ __ INY
2801 : b1 45 __ LDA (T1 + 0),y 
2803 : 86 45 __ STX T1 + 0 
2805 : 85 46 __ STA T1 + 1 
2807 : 20 6d 28 JSR $286d ; (mbuildline.s4 + 0)
280a : a5 48 __ LDA T3 + 0 
280c : 29 f8 __ AND #$f8
280e : 85 1b __ STA ACCU + 0 ; (x0 + 0)
2810 : a5 49 __ LDA T3 + 1 
2812 : 85 1c __ STA ACCU + 1 ; (x0 + 1)
2814 : a5 52 __ LDA T8 + 0 
2816 : 20 6e 2a JSR $2a6e ; (mul16by8 + 0)
2819 : 18 __ __ CLC
281a : a5 45 __ LDA T1 + 0 
281c : 65 1b __ ADC ACCU + 0 ; (x0 + 0)
281e : a8 __ __ TAY
281f : a5 46 __ LDA T1 + 1 
2821 : 65 1c __ ADC ACCU + 1 ; (x0 + 1)
2823 : 85 44 __ STA T0 + 1 
2825 : a5 4a __ LDA T4 + 0 
2827 : 29 fc __ AND #$fc
2829 : 0a __ __ ASL
282a : 85 45 __ STA T1 + 0 
282c : a5 4b __ LDA T4 + 1 
282e : 2a __ __ ROL
282f : aa __ __ TAX
2830 : 98 __ __ TYA
2831 : 18 __ __ CLC
2832 : 65 45 __ ADC T1 + 0 
2834 : 85 43 __ STA T0 + 0 
2836 : 8a __ __ TXA
2837 : 65 44 __ ADC T0 + 1 
2839 : 85 44 __ STA T0 + 1 
283b : 38 __ __ SEC
283c : a5 4e __ LDA T6 + 0 
283e : e5 4c __ SBC T5 + 0 
2840 : 85 45 __ STA T1 + 0 
2842 : a5 4f __ LDA T6 + 1 
2844 : e5 4d __ SBC T5 + 1 
2846 : 85 46 __ STA T1 + 1 
2848 : a5 51 __ LDA T7 + 1 
284a : 85 47 __ STA T2 + 0 
284c : a5 43 __ LDA T0 + 0 
284e : 85 03 __ STA WORK + 0 
2850 : a5 44 __ LDA T0 + 1 
2852 : 85 04 __ STA WORK + 1 
2854 : a5 45 __ LDA T1 + 0 
2856 : 85 05 __ STA WORK + 2 
2858 : a5 46 __ LDA T1 + 1 
285a : 85 06 __ STA WORK + 3 
285c : a5 47 __ LDA T2 + 0 
285e : 85 0b __ STA WORK + 8 
2860 : a5 53 __ LDA T9 + 0 
2862 : 85 0a __ STA WORK + 7 
2864 : 20 00 32 JSR $3200 ; (BLIT_CODE[0] + 0)
.s3:
2867 : ad e6 9f LDA $9fe6 ; (bmmcu_line@stack + 0)
286a : 85 53 __ STA T9 + 0 
286c : 60 __ __ RTS
--------------------------------------------------------------------
mbuildline: ; mbuildline(u8,u8,i16,i16,i16,bool,bool,u8)->void
; 525, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.c"
.s4:
286d : a9 a0 __ LDA #$a0
286f : 8d 00 32 STA $3200 ; (BLIT_CODE[0] + 0)
2872 : 8d 24 32 STA $3224 ; (BLIT_CODE[0] + 36)
2875 : a5 0d __ LDA P0 ; (ly + 0)
2877 : 8d 01 32 STA $3201 ; (BLIT_CODE[0] + 1)
287a : a9 a2 __ LDA #$a2
287c : 8d 02 32 STA $3202 ; (BLIT_CODE[0] + 2)
287f : a5 0e __ LDA P1 ; (lx + 0)
2881 : 8d 03 32 STA $3203 ; (BLIT_CODE[0] + 3)
2884 : a9 03 __ LDA #$03
2886 : 8d 05 32 STA $3205 ; (BLIT_CODE[0] + 5)
2889 : 8d 0d 32 STA $320d ; (BLIT_CODE[0] + 13)
288c : 8d 19 32 STA $3219 ; (BLIT_CODE[0] + 25)
288f : 8d 1d 32 STA $321d ; (BLIT_CODE[0] + 29)
2892 : 8d 41 32 STA $3241 ; (BLIT_CODE[0] + 65)
2895 : 8d 45 32 STA $3245 ; (BLIT_CODE[0] + 69)
2898 : a9 b1 __ LDA #$b1
289a : 8d 04 32 STA $3204 ; (BLIT_CODE[0] + 4)
289d : a9 49 __ LDA #$49
289f : 8d 06 32 STA $3206 ; (BLIT_CODE[0] + 6)
28a2 : 8d 0a 32 STA $320a ; (BLIT_CODE[0] + 10)
28a5 : a9 05 __ LDA #$05
28a7 : 8d 08 32 STA $3208 ; (BLIT_CODE[0] + 8)
28aa : 8d 28 32 STA $3228 ; (BLIT_CODE[0] + 40)
28ad : 8d 2c 32 STA $322c ; (BLIT_CODE[0] + 44)
28b0 : 8d 4e 32 STA $324e ; (BLIT_CODE[0] + 78)
28b3 : 8d 52 32 STA $3252 ; (BLIT_CODE[0] + 82)
28b6 : a9 0a __ LDA #$0a
28b8 : 8d 09 32 STA $3209 ; (BLIT_CODE[0] + 9)
28bb : 8d 38 32 STA $3238 ; (BLIT_CODE[0] + 56)
28be : 8d 3a 32 STA $323a ; (BLIT_CODE[0] + 58)
28c1 : 8d 3e 32 STA $323e ; (BLIT_CODE[0] + 62)
28c4 : a9 a5 __ LDA #$a5
28c6 : 8d 0e 32 STA $320e ; (BLIT_CODE[0] + 14)
28c9 : 8d 18 32 STA $3218 ; (BLIT_CODE[0] + 24)
28cc : 8d 1e 32 STA $321e ; (BLIT_CODE[0] + 30)
28cf : 8d 27 32 STA $3227 ; (BLIT_CODE[0] + 39)
28d2 : 8d 2d 32 STA $322d ; (BLIT_CODE[0] + 45)
28d5 : 8d 33 32 STA $3233 ; (BLIT_CODE[0] + 51)
28d8 : 8d 40 32 STA $3240 ; (BLIT_CODE[0] + 64)
28db : 8d 46 32 STA $3246 ; (BLIT_CODE[0] + 70)
28de : 8d 4d 32 STA $324d ; (BLIT_CODE[0] + 77)
28e1 : 8d 53 32 STA $3253 ; (BLIT_CODE[0] + 83)
28e4 : a9 91 __ LDA #$91
28e6 : 8d 0c 32 STA $320c ; (BLIT_CODE[0] + 12)
28e9 : a9 06 __ LDA #$06
28eb : 8d 0f 32 STA $320f ; (BLIT_CODE[0] + 15)
28ee : 8d 2e 32 STA $322e ; (BLIT_CODE[0] + 46)
28f1 : 8d 32 32 STA $3232 ; (BLIT_CODE[0] + 50)
28f4 : 8d 34 32 STA $3234 ; (BLIT_CODE[0] + 52)
28f7 : 8d 54 32 STA $3254 ; (BLIT_CODE[0] + 84)
28fa : 8d 58 32 STA $3258 ; (BLIT_CODE[0] + 88)
28fd : a9 d0 __ LDA #$d0
28ff : 8d 15 32 STA $3215 ; (BLIT_CODE[0] + 21)
2902 : 8d 5a 32 STA $325a ; (BLIT_CODE[0] + 90)
2905 : a9 30 __ LDA #$30
2907 : 8d 10 32 STA $3210 ; (BLIT_CODE[0] + 16)
290a : a9 21 __ LDA #$21
290c : 8d 11 32 STA $3211 ; (BLIT_CODE[0] + 17)
290f : a9 c0 __ LDA #$c0
2911 : 8d 13 32 STA $3213 ; (BLIT_CODE[0] + 19)
2914 : a9 0f __ LDA #$0f
2916 : 8d 16 32 STA $3216 ; (BLIT_CODE[0] + 22)
2919 : 8d 3c 32 STA $323c ; (BLIT_CODE[0] + 60)
291c : a9 18 __ LDA #$18
291e : 8d 17 32 STA $3217 ; (BLIT_CODE[0] + 23)
2921 : 8d 3f 32 STA $323f ; (BLIT_CODE[0] + 63)
2924 : 8d 4c 32 STA $324c ; (BLIT_CODE[0] + 76)
2927 : a9 69 __ LDA #$69
2929 : 8d 1a 32 STA $321a ; (BLIT_CODE[0] + 26)
292c : 8d 20 32 STA $3220 ; (BLIT_CODE[0] + 32)
292f : 8d 42 32 STA $3242 ; (BLIT_CODE[0] + 66)
2932 : 8d 48 32 STA $3248 ; (BLIT_CODE[0] + 72)
2935 : 8d 4f 32 STA $324f ; (BLIT_CODE[0] + 79)
2938 : 8d 55 32 STA $3255 ; (BLIT_CODE[0] + 85)
293b : a9 85 __ LDA #$85
293d : 8d 1c 32 STA $321c ; (BLIT_CODE[0] + 28)
2940 : 8d 22 32 STA $3222 ; (BLIT_CODE[0] + 34)
2943 : 8d 2b 32 STA $322b ; (BLIT_CODE[0] + 43)
2946 : 8d 31 32 STA $3231 ; (BLIT_CODE[0] + 49)
2949 : 8d 44 32 STA $3244 ; (BLIT_CODE[0] + 68)
294c : 8d 4a 32 STA $324a ; (BLIT_CODE[0] + 74)
294f : 8d 51 32 STA $3251 ; (BLIT_CODE[0] + 81)
2952 : 8d 57 32 STA $3257 ; (BLIT_CODE[0] + 87)
2955 : a9 04 __ LDA #$04
2957 : 8d 1f 32 STA $321f ; (BLIT_CODE[0] + 31)
295a : 8d 23 32 STA $3223 ; (BLIT_CODE[0] + 35)
295d : 8d 47 32 STA $3247 ; (BLIT_CODE[0] + 71)
2960 : 8d 4b 32 STA $324b ; (BLIT_CODE[0] + 75)
2963 : a9 e9 __ LDA #$e9
2965 : 8d 29 32 STA $3229 ; (BLIT_CODE[0] + 41)
2968 : 8d 2f 32 STA $322f ; (BLIT_CODE[0] + 47)
296b : a9 38 __ LDA #$38
296d : 8d 26 32 STA $3226 ; (BLIT_CODE[0] + 38)
2970 : a9 10 __ LDA #$10
2972 : 8d 35 32 STA $3235 ; (BLIT_CODE[0] + 53)
2975 : 8d 5e 32 STA $325e ; (BLIT_CODE[0] + 94)
2978 : a5 17 __ LDA P10 ; (color + 0)
297a : 8d 07 32 STA $3207 ; (BLIT_CODE[0] + 7)
297d : 8d 0b 32 STA $320b ; (BLIT_CODE[0] + 11)
2980 : a9 20 __ LDA #$20
2982 : 8d 36 32 STA $3236 ; (BLIT_CODE[0] + 54)
2985 : a9 90 __ LDA #$90
2987 : 8d 3b 32 STA $323b ; (BLIT_CODE[0] + 59)
298a : a9 ca __ LDA #$ca
298c : 8d 59 32 STA $3259 ; (BLIT_CODE[0] + 89)
298f : a9 a8 __ LDA #$a8
2991 : 8d 5b 32 STA $325b ; (BLIT_CODE[0] + 91)
2994 : a9 c6 __ LDA #$c6
2996 : 8d 5c 32 STA $325c ; (BLIT_CODE[0] + 92)
2999 : a9 0b __ LDA #$0b
299b : 8d 5d 32 STA $325d ; (BLIT_CODE[0] + 93)
299e : a9 a4 __ LDA #$a4
29a0 : 8d 5f 32 STA $325f ; (BLIT_CODE[0] + 95)
29a3 : a9 60 __ LDA #$60
29a5 : 8d 60 32 STA $3260 ; (BLIT_CODE[0] + 96)
29a8 : a5 16 __ LDA P9 ; (up + 0)
29aa : f0 09 __ BEQ $29b5 ; (mbuildline.s5 + 0)
.s14:
29ac : a9 88 __ LDA #$88
29ae : 8d 12 32 STA $3212 ; (BLIT_CODE[0] + 18)
29b1 : a9 ff __ LDA #$ff
29b3 : d0 07 __ BNE $29bc ; (mbuildline.s6 + 0)
.s5:
29b5 : a9 c8 __ LDA #$c8
29b7 : 8d 12 32 STA $3212 ; (BLIT_CODE[0] + 18)
29ba : a9 08 __ LDA #$08
.s6:
29bc : 8d 14 32 STA $3214 ; (BLIT_CODE[0] + 20)
29bf : a5 13 __ LDA P6 ; (stride + 0)
29c1 : 8d 1b 32 STA $321b ; (BLIT_CODE[0] + 27)
29c4 : a5 14 __ LDA P7 ; (stride + 1)
29c6 : 8d 21 32 STA $3221 ; (BLIT_CODE[0] + 33)
29c9 : a5 16 __ LDA P9 ; (up + 0)
29cb : f0 02 __ BEQ $29cf ; (mbuildline.s7 + 0)
.s13:
29cd : a9 07 __ LDA #$07
.s7:
29cf : 8d 25 32 STA $3225 ; (BLIT_CODE[0] + 37)
29d2 : a5 0f __ LDA P2 ; (dx + 0)
29d4 : 8d 2a 32 STA $322a ; (BLIT_CODE[0] + 42)
29d7 : a5 10 __ LDA P3 ; (dx + 1)
29d9 : 8d 30 32 STA $3230 ; (BLIT_CODE[0] + 48)
29dc : a5 15 __ LDA P8 ; (left + 0)
29de : f0 09 __ BEQ $29e9 ; (mbuildline.s8 + 0)
.s12:
29e0 : a9 06 __ LDA #$06
29e2 : 8d 37 32 STA $3237 ; (BLIT_CODE[0] + 55)
29e5 : a9 26 __ LDA #$26
29e7 : d0 07 __ BNE $29f0 ; (mbuildline.s15 + 0)
.s8:
29e9 : a9 46 __ LDA #$46
29eb : 8d 37 32 STA $3237 ; (BLIT_CODE[0] + 55)
29ee : a9 66 __ LDA #$66
.s15:
29f0 : 8d 39 32 STA $3239 ; (BLIT_CODE[0] + 57)
29f3 : 8d 3d 32 STA $323d ; (BLIT_CODE[0] + 61)
29f6 : a5 15 __ LDA P8 ; (left + 0)
29f8 : f0 09 __ BEQ $2a03 ; (mbuildline.s9 + 0)
.s11:
29fa : a9 f8 __ LDA #$f8
29fc : 8d 43 32 STA $3243 ; (BLIT_CODE[0] + 67)
29ff : a9 ff __ LDA #$ff
2a01 : d0 05 __ BNE $2a08 ; (mbuildline.s10 + 0)
.s9:
2a03 : a2 08 __ LDX #$08
2a05 : 8e 43 32 STX $3243 ; (BLIT_CODE[0] + 67)
.s10:
2a08 : 8d 49 32 STA $3249 ; (BLIT_CODE[0] + 73)
2a0b : a5 11 __ LDA P4 ; (dy + 0)
2a0d : 8d 50 32 STA $3250 ; (BLIT_CODE[0] + 80)
2a10 : a5 12 __ LDA P5 ; (dy + 1)
2a12 : 8d 56 32 STA $3256 ; (BLIT_CODE[0] + 86)
.s3:
2a15 : 60 __ __ RTS
--------------------------------------------------------------------
done: ; done()->void
;  33, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/polygon.c"
.s4:
2a16 : a9 37 __ LDA #$37
2a18 : 85 01 __ STA $01 
2a1a : 20 30 2a JSR $2a30 ; (getch.l4 + 0)
2a1d : a9 00 __ LDA #$00
2a1f : 85 0d __ STA P0 
2a21 : 85 0e __ STA P1 
2a23 : 85 10 __ STA P3 
2a25 : a9 04 __ LDA #$04
2a27 : 85 0f __ STA P2 
2a29 : a9 10 __ LDA #$10
2a2b : 85 11 __ STA P4 
2a2d : 4c 64 0f JMP $0f64 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
2a30 : 20 e4 ff JSR $ffe4 
2a33 : 85 1b __ STA ACCU + 0 
2a35 : a5 1b __ LDA ACCU + 0 
2a37 : f0 f7 __ BEQ $2a30 ; (getch.l4 + 0)
.s5:
2a39 : 4c 3c 2a JMP $2a3c ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
2a3c : a8 __ __ TAY
2a3d : ad c8 31 LDA $31c8 ; (giocharmap + 0)
2a40 : f0 27 __ BEQ $2a69 ; (convch.s5 + 0)
.s6:
2a42 : c0 0d __ CPY #$0d
2a44 : d0 03 __ BNE $2a49 ; (convch.s7 + 0)
.s16:
2a46 : a9 0a __ LDA #$0a
.s3:
2a48 : 60 __ __ RTS
.s7:
2a49 : c9 02 __ CMP #$02
2a4b : 90 1c __ BCC $2a69 ; (convch.s5 + 0)
.s8:
2a4d : 98 __ __ TYA
2a4e : c0 41 __ CPY #$41
2a50 : 90 17 __ BCC $2a69 ; (convch.s5 + 0)
.s9:
2a52 : c9 db __ CMP #$db
2a54 : b0 13 __ BCS $2a69 ; (convch.s5 + 0)
.s10:
2a56 : c9 c1 __ CMP #$c1
2a58 : 90 03 __ BCC $2a5d ; (convch.s11 + 0)
.s15:
2a5a : 49 a0 __ EOR #$a0
2a5c : a8 __ __ TAY
.s11:
2a5d : c9 7b __ CMP #$7b
2a5f : b0 08 __ BCS $2a69 ; (convch.s5 + 0)
.s12:
2a61 : c9 61 __ CMP #$61
2a63 : b0 06 __ BCS $2a6b ; (convch.s14 + 0)
.s13:
2a65 : c9 5b __ CMP #$5b
2a67 : 90 02 __ BCC $2a6b ; (convch.s14 + 0)
.s5:
2a69 : 98 __ __ TYA
2a6a : 60 __ __ RTS
.s14:
2a6b : 49 20 __ EOR #$20
2a6d : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
2a6e : 4a __ __ LSR
2a6f : f0 2e __ BEQ $2a9f ; (mul16by8 + 49)
2a71 : a2 00 __ LDX #$00
2a73 : a0 00 __ LDY #$00
2a75 : 90 13 __ BCC $2a8a ; (mul16by8 + 28)
2a77 : a4 1b __ LDY ACCU + 0 
2a79 : a6 1c __ LDX ACCU + 1 
2a7b : b0 0d __ BCS $2a8a ; (mul16by8 + 28)
2a7d : 85 02 __ STA $02 
2a7f : 18 __ __ CLC
2a80 : 98 __ __ TYA
2a81 : 65 1b __ ADC ACCU + 0 
2a83 : a8 __ __ TAY
2a84 : 8a __ __ TXA
2a85 : 65 1c __ ADC ACCU + 1 
2a87 : aa __ __ TAX
2a88 : a5 02 __ LDA $02 
2a8a : 06 1b __ ASL ACCU + 0 
2a8c : 26 1c __ ROL ACCU + 1 
2a8e : 4a __ __ LSR
2a8f : 90 f9 __ BCC $2a8a ; (mul16by8 + 28)
2a91 : d0 ea __ BNE $2a7d ; (mul16by8 + 15)
2a93 : 18 __ __ CLC
2a94 : 98 __ __ TYA
2a95 : 65 1b __ ADC ACCU + 0 
2a97 : 85 1b __ STA ACCU + 0 
2a99 : 8a __ __ TXA
2a9a : 65 1c __ ADC ACCU + 1 
2a9c : 85 1c __ STA ACCU + 1 
2a9e : 60 __ __ RTS
2a9f : b0 04 __ BCS $2aa5 ; (mul16by8 + 55)
2aa1 : 85 1b __ STA ACCU + 0 
2aa3 : 85 1c __ STA ACCU + 1 
2aa5 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
2aa6 : a0 00 __ LDY #$00
2aa8 : 84 07 __ STY WORK + 4 
2aaa : 84 08 __ STY WORK + 5 
2aac : 84 09 __ STY WORK + 6 
2aae : 4a __ __ LSR
2aaf : b0 0d __ BCS $2abe ; (mul32by8 + 24)
2ab1 : f0 26 __ BEQ $2ad9 ; (mul32by8 + 51)
2ab3 : 06 1b __ ASL ACCU + 0 
2ab5 : 26 1c __ ROL ACCU + 1 
2ab7 : 26 1d __ ROL ACCU + 2 
2ab9 : 26 1e __ ROL ACCU + 3 
2abb : 4a __ __ LSR
2abc : 90 f5 __ BCC $2ab3 ; (mul32by8 + 13)
2abe : aa __ __ TAX
2abf : 18 __ __ CLC
2ac0 : a5 07 __ LDA WORK + 4 
2ac2 : 65 1b __ ADC ACCU + 0 
2ac4 : 85 07 __ STA WORK + 4 
2ac6 : a5 08 __ LDA WORK + 5 
2ac8 : 65 1c __ ADC ACCU + 1 
2aca : 85 08 __ STA WORK + 5 
2acc : a5 09 __ LDA WORK + 6 
2ace : 65 1d __ ADC ACCU + 2 
2ad0 : 85 09 __ STA WORK + 6 
2ad2 : 98 __ __ TYA
2ad3 : 65 1e __ ADC ACCU + 3 
2ad5 : a8 __ __ TAY
2ad6 : 8a __ __ TXA
2ad7 : d0 da __ BNE $2ab3 ; (mul32by8 + 13)
2ad9 : 84 0a __ STY WORK + 7 
2adb : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
2adc : b1 19 __ LDA (IP + 0),y 
2ade : c8 __ __ INY
2adf : aa __ __ TAX
2ae0 : b5 00 __ LDA $00,x 
2ae2 : 85 03 __ STA WORK + 0 
2ae4 : b5 01 __ LDA $01,x 
2ae6 : 85 04 __ STA WORK + 1 
2ae8 : b5 02 __ LDA $02,x 
2aea : 85 05 __ STA WORK + 2 
2aec : b5 03 __ LDA WORK + 0,x 
2aee : 85 06 __ STA WORK + 3 
2af0 : a5 05 __ LDA WORK + 2 
2af2 : 0a __ __ ASL
2af3 : a5 06 __ LDA WORK + 3 
2af5 : 2a __ __ ROL
2af6 : 85 08 __ STA WORK + 5 
2af8 : f0 06 __ BEQ $2b00 ; (freg + 36)
2afa : a5 05 __ LDA WORK + 2 
2afc : 09 80 __ ORA #$80
2afe : 85 05 __ STA WORK + 2 
2b00 : a5 1d __ LDA ACCU + 2 
2b02 : 0a __ __ ASL
2b03 : a5 1e __ LDA ACCU + 3 
2b05 : 2a __ __ ROL
2b06 : 85 07 __ STA WORK + 4 
2b08 : f0 06 __ BEQ $2b10 ; (freg + 52)
2b0a : a5 1d __ LDA ACCU + 2 
2b0c : 09 80 __ ORA #$80
2b0e : 85 1d __ STA ACCU + 2 
2b10 : 60 __ __ RTS
2b11 : 06 1e __ ASL ACCU + 3 
2b13 : a5 07 __ LDA WORK + 4 
2b15 : 6a __ __ ROR
2b16 : 85 1e __ STA ACCU + 3 
2b18 : b0 06 __ BCS $2b20 ; (freg + 68)
2b1a : a5 1d __ LDA ACCU + 2 
2b1c : 29 7f __ AND #$7f
2b1e : 85 1d __ STA ACCU + 2 
2b20 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
2b21 : a5 06 __ LDA WORK + 3 
2b23 : 49 80 __ EOR #$80
2b25 : 85 06 __ STA WORK + 3 
2b27 : a9 ff __ LDA #$ff
2b29 : c5 07 __ CMP WORK + 4 
2b2b : f0 04 __ BEQ $2b31 ; (faddsub + 16)
2b2d : c5 08 __ CMP WORK + 5 
2b2f : d0 11 __ BNE $2b42 ; (faddsub + 33)
2b31 : a5 1e __ LDA ACCU + 3 
2b33 : 09 7f __ ORA #$7f
2b35 : 85 1e __ STA ACCU + 3 
2b37 : a9 80 __ LDA #$80
2b39 : 85 1d __ STA ACCU + 2 
2b3b : a9 00 __ LDA #$00
2b3d : 85 1b __ STA ACCU + 0 
2b3f : 85 1c __ STA ACCU + 1 
2b41 : 60 __ __ RTS
2b42 : 38 __ __ SEC
2b43 : a5 07 __ LDA WORK + 4 
2b45 : e5 08 __ SBC WORK + 5 
2b47 : f0 38 __ BEQ $2b81 ; (faddsub + 96)
2b49 : aa __ __ TAX
2b4a : b0 25 __ BCS $2b71 ; (faddsub + 80)
2b4c : e0 e9 __ CPX #$e9
2b4e : b0 0e __ BCS $2b5e ; (faddsub + 61)
2b50 : a5 08 __ LDA WORK + 5 
2b52 : 85 07 __ STA WORK + 4 
2b54 : a9 00 __ LDA #$00
2b56 : 85 1b __ STA ACCU + 0 
2b58 : 85 1c __ STA ACCU + 1 
2b5a : 85 1d __ STA ACCU + 2 
2b5c : f0 23 __ BEQ $2b81 ; (faddsub + 96)
2b5e : a5 1d __ LDA ACCU + 2 
2b60 : 4a __ __ LSR
2b61 : 66 1c __ ROR ACCU + 1 
2b63 : 66 1b __ ROR ACCU + 0 
2b65 : e8 __ __ INX
2b66 : d0 f8 __ BNE $2b60 ; (faddsub + 63)
2b68 : 85 1d __ STA ACCU + 2 
2b6a : a5 08 __ LDA WORK + 5 
2b6c : 85 07 __ STA WORK + 4 
2b6e : 4c 81 2b JMP $2b81 ; (faddsub + 96)
2b71 : e0 18 __ CPX #$18
2b73 : b0 33 __ BCS $2ba8 ; (faddsub + 135)
2b75 : a5 05 __ LDA WORK + 2 
2b77 : 4a __ __ LSR
2b78 : 66 04 __ ROR WORK + 1 
2b7a : 66 03 __ ROR WORK + 0 
2b7c : ca __ __ DEX
2b7d : d0 f8 __ BNE $2b77 ; (faddsub + 86)
2b7f : 85 05 __ STA WORK + 2 
2b81 : a5 1e __ LDA ACCU + 3 
2b83 : 29 80 __ AND #$80
2b85 : 85 1e __ STA ACCU + 3 
2b87 : 45 06 __ EOR WORK + 3 
2b89 : 30 31 __ BMI $2bbc ; (faddsub + 155)
2b8b : 18 __ __ CLC
2b8c : a5 1b __ LDA ACCU + 0 
2b8e : 65 03 __ ADC WORK + 0 
2b90 : 85 1b __ STA ACCU + 0 
2b92 : a5 1c __ LDA ACCU + 1 
2b94 : 65 04 __ ADC WORK + 1 
2b96 : 85 1c __ STA ACCU + 1 
2b98 : a5 1d __ LDA ACCU + 2 
2b9a : 65 05 __ ADC WORK + 2 
2b9c : 85 1d __ STA ACCU + 2 
2b9e : 90 08 __ BCC $2ba8 ; (faddsub + 135)
2ba0 : 66 1d __ ROR ACCU + 2 
2ba2 : 66 1c __ ROR ACCU + 1 
2ba4 : 66 1b __ ROR ACCU + 0 
2ba6 : e6 07 __ INC WORK + 4 
2ba8 : a5 07 __ LDA WORK + 4 
2baa : c9 ff __ CMP #$ff
2bac : f0 83 __ BEQ $2b31 ; (faddsub + 16)
2bae : 4a __ __ LSR
2baf : 05 1e __ ORA ACCU + 3 
2bb1 : 85 1e __ STA ACCU + 3 
2bb3 : b0 06 __ BCS $2bbb ; (faddsub + 154)
2bb5 : a5 1d __ LDA ACCU + 2 
2bb7 : 29 7f __ AND #$7f
2bb9 : 85 1d __ STA ACCU + 2 
2bbb : 60 __ __ RTS
2bbc : 38 __ __ SEC
2bbd : a5 1b __ LDA ACCU + 0 
2bbf : e5 03 __ SBC WORK + 0 
2bc1 : 85 1b __ STA ACCU + 0 
2bc3 : a5 1c __ LDA ACCU + 1 
2bc5 : e5 04 __ SBC WORK + 1 
2bc7 : 85 1c __ STA ACCU + 1 
2bc9 : a5 1d __ LDA ACCU + 2 
2bcb : e5 05 __ SBC WORK + 2 
2bcd : 85 1d __ STA ACCU + 2 
2bcf : b0 19 __ BCS $2bea ; (faddsub + 201)
2bd1 : 38 __ __ SEC
2bd2 : a9 00 __ LDA #$00
2bd4 : e5 1b __ SBC ACCU + 0 
2bd6 : 85 1b __ STA ACCU + 0 
2bd8 : a9 00 __ LDA #$00
2bda : e5 1c __ SBC ACCU + 1 
2bdc : 85 1c __ STA ACCU + 1 
2bde : a9 00 __ LDA #$00
2be0 : e5 1d __ SBC ACCU + 2 
2be2 : 85 1d __ STA ACCU + 2 
2be4 : a5 1e __ LDA ACCU + 3 
2be6 : 49 80 __ EOR #$80
2be8 : 85 1e __ STA ACCU + 3 
2bea : a5 1d __ LDA ACCU + 2 
2bec : 30 ba __ BMI $2ba8 ; (faddsub + 135)
2bee : 05 1c __ ORA ACCU + 1 
2bf0 : 05 1b __ ORA ACCU + 0 
2bf2 : f0 0f __ BEQ $2c03 ; (faddsub + 226)
2bf4 : c6 07 __ DEC WORK + 4 
2bf6 : f0 0b __ BEQ $2c03 ; (faddsub + 226)
2bf8 : 06 1b __ ASL ACCU + 0 
2bfa : 26 1c __ ROL ACCU + 1 
2bfc : 26 1d __ ROL ACCU + 2 
2bfe : 10 f4 __ BPL $2bf4 ; (faddsub + 211)
2c00 : 4c a8 2b JMP $2ba8 ; (faddsub + 135)
2c03 : a9 00 __ LDA #$00
2c05 : 85 1b __ STA ACCU + 0 
2c07 : 85 1c __ STA ACCU + 1 
2c09 : 85 1d __ STA ACCU + 2 
2c0b : 85 1e __ STA ACCU + 3 
2c0d : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
2c0e : a5 1b __ LDA ACCU + 0 
2c10 : 05 1c __ ORA ACCU + 1 
2c12 : 05 1d __ ORA ACCU + 2 
2c14 : f0 0e __ BEQ $2c24 ; (crt_fmul + 22)
2c16 : a5 03 __ LDA WORK + 0 
2c18 : 05 04 __ ORA WORK + 1 
2c1a : 05 05 __ ORA WORK + 2 
2c1c : d0 09 __ BNE $2c27 ; (crt_fmul + 25)
2c1e : 85 1b __ STA ACCU + 0 
2c20 : 85 1c __ STA ACCU + 1 
2c22 : 85 1d __ STA ACCU + 2 
2c24 : 85 1e __ STA ACCU + 3 
2c26 : 60 __ __ RTS
2c27 : a5 1e __ LDA ACCU + 3 
2c29 : 45 06 __ EOR WORK + 3 
2c2b : 29 80 __ AND #$80
2c2d : 85 1e __ STA ACCU + 3 
2c2f : a9 ff __ LDA #$ff
2c31 : c5 07 __ CMP WORK + 4 
2c33 : f0 42 __ BEQ $2c77 ; (crt_fmul + 105)
2c35 : c5 08 __ CMP WORK + 5 
2c37 : f0 3e __ BEQ $2c77 ; (crt_fmul + 105)
2c39 : a9 00 __ LDA #$00
2c3b : 85 09 __ STA WORK + 6 
2c3d : 85 0a __ STA WORK + 7 
2c3f : 85 0b __ STA WORK + 8 
2c41 : a4 1b __ LDY ACCU + 0 
2c43 : a5 03 __ LDA WORK + 0 
2c45 : d0 06 __ BNE $2c4d ; (crt_fmul + 63)
2c47 : a5 04 __ LDA WORK + 1 
2c49 : f0 0a __ BEQ $2c55 ; (crt_fmul + 71)
2c4b : d0 05 __ BNE $2c52 ; (crt_fmul + 68)
2c4d : 20 a8 2c JSR $2ca8 ; (crt_fmul8 + 0)
2c50 : a5 04 __ LDA WORK + 1 
2c52 : 20 a8 2c JSR $2ca8 ; (crt_fmul8 + 0)
2c55 : a5 05 __ LDA WORK + 2 
2c57 : 20 a8 2c JSR $2ca8 ; (crt_fmul8 + 0)
2c5a : 38 __ __ SEC
2c5b : a5 0b __ LDA WORK + 8 
2c5d : 30 06 __ BMI $2c65 ; (crt_fmul + 87)
2c5f : 06 09 __ ASL WORK + 6 
2c61 : 26 0a __ ROL WORK + 7 
2c63 : 2a __ __ ROL
2c64 : 18 __ __ CLC
2c65 : 29 7f __ AND #$7f
2c67 : 85 0b __ STA WORK + 8 
2c69 : a5 07 __ LDA WORK + 4 
2c6b : 65 08 __ ADC WORK + 5 
2c6d : 90 19 __ BCC $2c88 ; (crt_fmul + 122)
2c6f : e9 7f __ SBC #$7f
2c71 : b0 04 __ BCS $2c77 ; (crt_fmul + 105)
2c73 : c9 ff __ CMP #$ff
2c75 : d0 15 __ BNE $2c8c ; (crt_fmul + 126)
2c77 : a5 1e __ LDA ACCU + 3 
2c79 : 09 7f __ ORA #$7f
2c7b : 85 1e __ STA ACCU + 3 
2c7d : a9 80 __ LDA #$80
2c7f : 85 1d __ STA ACCU + 2 
2c81 : a9 00 __ LDA #$00
2c83 : 85 1b __ STA ACCU + 0 
2c85 : 85 1c __ STA ACCU + 1 
2c87 : 60 __ __ RTS
2c88 : e9 7e __ SBC #$7e
2c8a : 90 15 __ BCC $2ca1 ; (crt_fmul + 147)
2c8c : 4a __ __ LSR
2c8d : 05 1e __ ORA ACCU + 3 
2c8f : 85 1e __ STA ACCU + 3 
2c91 : a9 00 __ LDA #$00
2c93 : 6a __ __ ROR
2c94 : 05 0b __ ORA WORK + 8 
2c96 : 85 1d __ STA ACCU + 2 
2c98 : a5 0a __ LDA WORK + 7 
2c9a : 85 1c __ STA ACCU + 1 
2c9c : a5 09 __ LDA WORK + 6 
2c9e : 85 1b __ STA ACCU + 0 
2ca0 : 60 __ __ RTS
2ca1 : a9 00 __ LDA #$00
2ca3 : 85 1e __ STA ACCU + 3 
2ca5 : f0 d8 __ BEQ $2c7f ; (crt_fmul + 113)
2ca7 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
2ca8 : 38 __ __ SEC
2ca9 : 6a __ __ ROR
2caa : 90 1e __ BCC $2cca ; (crt_fmul8 + 34)
2cac : aa __ __ TAX
2cad : 18 __ __ CLC
2cae : 98 __ __ TYA
2caf : 65 09 __ ADC WORK + 6 
2cb1 : 85 09 __ STA WORK + 6 
2cb3 : a5 0a __ LDA WORK + 7 
2cb5 : 65 1c __ ADC ACCU + 1 
2cb7 : 85 0a __ STA WORK + 7 
2cb9 : a5 0b __ LDA WORK + 8 
2cbb : 65 1d __ ADC ACCU + 2 
2cbd : 6a __ __ ROR
2cbe : 85 0b __ STA WORK + 8 
2cc0 : 8a __ __ TXA
2cc1 : 66 0a __ ROR WORK + 7 
2cc3 : 66 09 __ ROR WORK + 6 
2cc5 : 4a __ __ LSR
2cc6 : f0 0d __ BEQ $2cd5 ; (crt_fmul8 + 45)
2cc8 : b0 e2 __ BCS $2cac ; (crt_fmul8 + 4)
2cca : 66 0b __ ROR WORK + 8 
2ccc : 66 0a __ ROR WORK + 7 
2cce : 66 09 __ ROR WORK + 6 
2cd0 : 4a __ __ LSR
2cd1 : 90 f7 __ BCC $2cca ; (crt_fmul8 + 34)
2cd3 : d0 d7 __ BNE $2cac ; (crt_fmul8 + 4)
2cd5 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
2cd6 : a5 1b __ LDA ACCU + 0 
2cd8 : 05 1c __ ORA ACCU + 1 
2cda : 05 1d __ ORA ACCU + 2 
2cdc : d0 03 __ BNE $2ce1 ; (crt_fdiv + 11)
2cde : 85 1e __ STA ACCU + 3 
2ce0 : 60 __ __ RTS
2ce1 : a5 1e __ LDA ACCU + 3 
2ce3 : 45 06 __ EOR WORK + 3 
2ce5 : 29 80 __ AND #$80
2ce7 : 85 1e __ STA ACCU + 3 
2ce9 : a5 08 __ LDA WORK + 5 
2ceb : f0 62 __ BEQ $2d4f ; (crt_fdiv + 121)
2ced : a5 07 __ LDA WORK + 4 
2cef : c9 ff __ CMP #$ff
2cf1 : f0 5c __ BEQ $2d4f ; (crt_fdiv + 121)
2cf3 : a9 00 __ LDA #$00
2cf5 : 85 09 __ STA WORK + 6 
2cf7 : 85 0a __ STA WORK + 7 
2cf9 : 85 0b __ STA WORK + 8 
2cfb : a2 18 __ LDX #$18
2cfd : a5 1b __ LDA ACCU + 0 
2cff : c5 03 __ CMP WORK + 0 
2d01 : a5 1c __ LDA ACCU + 1 
2d03 : e5 04 __ SBC WORK + 1 
2d05 : a5 1d __ LDA ACCU + 2 
2d07 : e5 05 __ SBC WORK + 2 
2d09 : 90 13 __ BCC $2d1e ; (crt_fdiv + 72)
2d0b : a5 1b __ LDA ACCU + 0 
2d0d : e5 03 __ SBC WORK + 0 
2d0f : 85 1b __ STA ACCU + 0 
2d11 : a5 1c __ LDA ACCU + 1 
2d13 : e5 04 __ SBC WORK + 1 
2d15 : 85 1c __ STA ACCU + 1 
2d17 : a5 1d __ LDA ACCU + 2 
2d19 : e5 05 __ SBC WORK + 2 
2d1b : 85 1d __ STA ACCU + 2 
2d1d : 38 __ __ SEC
2d1e : 26 09 __ ROL WORK + 6 
2d20 : 26 0a __ ROL WORK + 7 
2d22 : 26 0b __ ROL WORK + 8 
2d24 : ca __ __ DEX
2d25 : f0 0a __ BEQ $2d31 ; (crt_fdiv + 91)
2d27 : 06 1b __ ASL ACCU + 0 
2d29 : 26 1c __ ROL ACCU + 1 
2d2b : 26 1d __ ROL ACCU + 2 
2d2d : b0 dc __ BCS $2d0b ; (crt_fdiv + 53)
2d2f : 90 cc __ BCC $2cfd ; (crt_fdiv + 39)
2d31 : 38 __ __ SEC
2d32 : a5 0b __ LDA WORK + 8 
2d34 : 30 06 __ BMI $2d3c ; (crt_fdiv + 102)
2d36 : 06 09 __ ASL WORK + 6 
2d38 : 26 0a __ ROL WORK + 7 
2d3a : 2a __ __ ROL
2d3b : 18 __ __ CLC
2d3c : 29 7f __ AND #$7f
2d3e : 85 0b __ STA WORK + 8 
2d40 : a5 07 __ LDA WORK + 4 
2d42 : e5 08 __ SBC WORK + 5 
2d44 : 90 1a __ BCC $2d60 ; (crt_fdiv + 138)
2d46 : 18 __ __ CLC
2d47 : 69 7f __ ADC #$7f
2d49 : b0 04 __ BCS $2d4f ; (crt_fdiv + 121)
2d4b : c9 ff __ CMP #$ff
2d4d : d0 15 __ BNE $2d64 ; (crt_fdiv + 142)
2d4f : a5 1e __ LDA ACCU + 3 
2d51 : 09 7f __ ORA #$7f
2d53 : 85 1e __ STA ACCU + 3 
2d55 : a9 80 __ LDA #$80
2d57 : 85 1d __ STA ACCU + 2 
2d59 : a9 00 __ LDA #$00
2d5b : 85 1c __ STA ACCU + 1 
2d5d : 85 1b __ STA ACCU + 0 
2d5f : 60 __ __ RTS
2d60 : 69 7f __ ADC #$7f
2d62 : 90 15 __ BCC $2d79 ; (crt_fdiv + 163)
2d64 : 4a __ __ LSR
2d65 : 05 1e __ ORA ACCU + 3 
2d67 : 85 1e __ STA ACCU + 3 
2d69 : a9 00 __ LDA #$00
2d6b : 6a __ __ ROR
2d6c : 05 0b __ ORA WORK + 8 
2d6e : 85 1d __ STA ACCU + 2 
2d70 : a5 0a __ LDA WORK + 7 
2d72 : 85 1c __ STA ACCU + 1 
2d74 : a5 09 __ LDA WORK + 6 
2d76 : 85 1b __ STA ACCU + 0 
2d78 : 60 __ __ RTS
2d79 : a9 00 __ LDA #$00
2d7b : 85 1e __ STA ACCU + 3 
2d7d : 85 1d __ STA ACCU + 2 
2d7f : 85 1c __ STA ACCU + 1 
2d81 : 85 1b __ STA ACCU + 0 
2d83 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
2d84 : a5 1c __ LDA ACCU + 1 
2d86 : d0 31 __ BNE $2db9 ; (divmod + 53)
2d88 : a5 04 __ LDA WORK + 1 
2d8a : d0 1e __ BNE $2daa ; (divmod + 38)
2d8c : 85 06 __ STA WORK + 3 
2d8e : a2 04 __ LDX #$04
2d90 : 06 1b __ ASL ACCU + 0 
2d92 : 2a __ __ ROL
2d93 : c5 03 __ CMP WORK + 0 
2d95 : 90 02 __ BCC $2d99 ; (divmod + 21)
2d97 : e5 03 __ SBC WORK + 0 
2d99 : 26 1b __ ROL ACCU + 0 
2d9b : 2a __ __ ROL
2d9c : c5 03 __ CMP WORK + 0 
2d9e : 90 02 __ BCC $2da2 ; (divmod + 30)
2da0 : e5 03 __ SBC WORK + 0 
2da2 : 26 1b __ ROL ACCU + 0 
2da4 : ca __ __ DEX
2da5 : d0 eb __ BNE $2d92 ; (divmod + 14)
2da7 : 85 05 __ STA WORK + 2 
2da9 : 60 __ __ RTS
2daa : a5 1b __ LDA ACCU + 0 
2dac : 85 05 __ STA WORK + 2 
2dae : a5 1c __ LDA ACCU + 1 
2db0 : 85 06 __ STA WORK + 3 
2db2 : a9 00 __ LDA #$00
2db4 : 85 1b __ STA ACCU + 0 
2db6 : 85 1c __ STA ACCU + 1 
2db8 : 60 __ __ RTS
2db9 : a5 04 __ LDA WORK + 1 
2dbb : d0 1f __ BNE $2ddc ; (divmod + 88)
2dbd : a5 03 __ LDA WORK + 0 
2dbf : 30 1b __ BMI $2ddc ; (divmod + 88)
2dc1 : a9 00 __ LDA #$00
2dc3 : 85 06 __ STA WORK + 3 
2dc5 : a2 10 __ LDX #$10
2dc7 : 06 1b __ ASL ACCU + 0 
2dc9 : 26 1c __ ROL ACCU + 1 
2dcb : 2a __ __ ROL
2dcc : c5 03 __ CMP WORK + 0 
2dce : 90 02 __ BCC $2dd2 ; (divmod + 78)
2dd0 : e5 03 __ SBC WORK + 0 
2dd2 : 26 1b __ ROL ACCU + 0 
2dd4 : 26 1c __ ROL ACCU + 1 
2dd6 : ca __ __ DEX
2dd7 : d0 f2 __ BNE $2dcb ; (divmod + 71)
2dd9 : 85 05 __ STA WORK + 2 
2ddb : 60 __ __ RTS
2ddc : a9 00 __ LDA #$00
2dde : 85 05 __ STA WORK + 2 
2de0 : 85 06 __ STA WORK + 3 
2de2 : 84 02 __ STY $02 
2de4 : a0 10 __ LDY #$10
2de6 : 18 __ __ CLC
2de7 : 26 1b __ ROL ACCU + 0 
2de9 : 26 1c __ ROL ACCU + 1 
2deb : 26 05 __ ROL WORK + 2 
2ded : 26 06 __ ROL WORK + 3 
2def : 38 __ __ SEC
2df0 : a5 05 __ LDA WORK + 2 
2df2 : e5 03 __ SBC WORK + 0 
2df4 : aa __ __ TAX
2df5 : a5 06 __ LDA WORK + 3 
2df7 : e5 04 __ SBC WORK + 1 
2df9 : 90 04 __ BCC $2dff ; (divmod + 123)
2dfb : 86 05 __ STX WORK + 2 
2dfd : 85 06 __ STA WORK + 3 
2dff : 88 __ __ DEY
2e00 : d0 e5 __ BNE $2de7 ; (divmod + 99)
2e02 : 26 1b __ ROL ACCU + 0 
2e04 : 26 1c __ ROL ACCU + 1 
2e06 : a4 02 __ LDY $02 
2e08 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
2e09 : 24 1e __ BIT ACCU + 3 
2e0b : 10 13 __ BPL $2e20 ; (fround + 23)
2e0d : 30 6b __ BMI $2e7a ; (fround + 113)
2e0f : 24 1e __ BIT ACCU + 3 
2e11 : 30 0d __ BMI $2e20 ; (fround + 23)
2e13 : 10 65 __ BPL $2e7a ; (fround + 113)
2e15 : a9 00 __ LDA #$00
2e17 : 85 1b __ STA ACCU + 0 
2e19 : 85 1c __ STA ACCU + 1 
2e1b : 85 1d __ STA ACCU + 2 
2e1d : 85 1e __ STA ACCU + 3 
2e1f : 60 __ __ RTS
2e20 : a5 07 __ LDA WORK + 4 
2e22 : c9 7f __ CMP #$7f
2e24 : 90 ef __ BCC $2e15 ; (fround + 12)
2e26 : c9 87 __ CMP #$87
2e28 : 90 16 __ BCC $2e40 ; (fround + 55)
2e2a : c9 8f __ CMP #$8f
2e2c : 90 26 __ BCC $2e54 ; (fround + 75)
2e2e : c9 97 __ CMP #$97
2e30 : b0 34 __ BCS $2e66 ; (fround + 93)
2e32 : 38 __ __ SEC
2e33 : e9 8f __ SBC #$8f
2e35 : aa __ __ TAX
2e36 : a5 1b __ LDA ACCU + 0 
2e38 : 3d c9 31 AND $31c9,x ; (ubitmask[0] + 0)
2e3b : 85 1b __ STA ACCU + 0 
2e3d : 4c 66 2e JMP $2e66 ; (fround + 93)
2e40 : 38 __ __ SEC
2e41 : e9 7f __ SBC #$7f
2e43 : aa __ __ TAX
2e44 : a5 1d __ LDA ACCU + 2 
2e46 : 3d c9 31 AND $31c9,x ; (ubitmask[0] + 0)
2e49 : 85 1d __ STA ACCU + 2 
2e4b : a9 00 __ LDA #$00
2e4d : 85 1b __ STA ACCU + 0 
2e4f : 85 1c __ STA ACCU + 1 
2e51 : 4c 66 2e JMP $2e66 ; (fround + 93)
2e54 : 38 __ __ SEC
2e55 : e9 87 __ SBC #$87
2e57 : aa __ __ TAX
2e58 : a5 1c __ LDA ACCU + 1 
2e5a : 3d c9 31 AND $31c9,x ; (ubitmask[0] + 0)
2e5d : 85 1c __ STA ACCU + 1 
2e5f : a9 00 __ LDA #$00
2e61 : 85 1b __ STA ACCU + 0 
2e63 : 4c 66 2e JMP $2e66 ; (fround + 93)
2e66 : 4c 11 2b JMP $2b11 ; (freg + 53)
2e69 : a9 7f __ LDA #$7f
2e6b : 85 07 __ STA WORK + 4 
2e6d : a9 00 __ LDA #$00
2e6f : 85 1b __ STA ACCU + 0 
2e71 : 85 1c __ STA ACCU + 1 
2e73 : a9 80 __ LDA #$80
2e75 : 85 1d __ STA ACCU + 2 
2e77 : 4c 11 2b JMP $2b11 ; (freg + 53)
2e7a : a5 1b __ LDA ACCU + 0 
2e7c : 05 1c __ ORA ACCU + 1 
2e7e : 05 1d __ ORA ACCU + 2 
2e80 : f0 93 __ BEQ $2e15 ; (fround + 12)
2e82 : a5 07 __ LDA WORK + 4 
2e84 : c9 7f __ CMP #$7f
2e86 : 90 e1 __ BCC $2e69 ; (fround + 96)
2e88 : c9 87 __ CMP #$87
2e8a : 90 2e __ BCC $2eba ; (fround + 177)
2e8c : c9 8f __ CMP #$8f
2e8e : 90 4c __ BCC $2edc ; (fround + 211)
2e90 : c9 97 __ CMP #$97
2e92 : b0 6c __ BCS $2f00 ; (fround + 247)
2e94 : 38 __ __ SEC
2e95 : e9 8f __ SBC #$8f
2e97 : aa __ __ TAX
2e98 : 18 __ __ CLC
2e99 : bd c9 31 LDA $31c9,x ; (ubitmask[0] + 0)
2e9c : 49 ff __ EOR #$ff
2e9e : 65 1b __ ADC ACCU + 0 
2ea0 : 85 1b __ STA ACCU + 0 
2ea2 : a9 00 __ LDA #$00
2ea4 : 65 1c __ ADC ACCU + 1 
2ea6 : 85 1c __ STA ACCU + 1 
2ea8 : a9 00 __ LDA #$00
2eaa : 65 1d __ ADC ACCU + 2 
2eac : 90 07 __ BCC $2eb5 ; (fround + 172)
2eae : 6a __ __ ROR
2eaf : 66 1c __ ROR ACCU + 1 
2eb1 : 66 1b __ ROR ACCU + 0 
2eb3 : e6 07 __ INC WORK + 4 
2eb5 : 85 1d __ STA ACCU + 2 
2eb7 : 4c 20 2e JMP $2e20 ; (fround + 23)
2eba : 38 __ __ SEC
2ebb : e9 7f __ SBC #$7f
2ebd : aa __ __ TAX
2ebe : 18 __ __ CLC
2ebf : a9 ff __ LDA #$ff
2ec1 : 65 1b __ ADC ACCU + 0 
2ec3 : a9 ff __ LDA #$ff
2ec5 : 65 1c __ ADC ACCU + 1 
2ec7 : bd c9 31 LDA $31c9,x ; (ubitmask[0] + 0)
2eca : 49 ff __ EOR #$ff
2ecc : 65 1d __ ADC ACCU + 2 
2ece : 90 07 __ BCC $2ed7 ; (fround + 206)
2ed0 : 6a __ __ ROR
2ed1 : 66 1c __ ROR ACCU + 1 
2ed3 : 66 1b __ ROR ACCU + 0 
2ed5 : e6 07 __ INC WORK + 4 
2ed7 : 85 1d __ STA ACCU + 2 
2ed9 : 4c 20 2e JMP $2e20 ; (fround + 23)
2edc : 38 __ __ SEC
2edd : e9 87 __ SBC #$87
2edf : aa __ __ TAX
2ee0 : 18 __ __ CLC
2ee1 : a9 ff __ LDA #$ff
2ee3 : 65 1b __ ADC ACCU + 0 
2ee5 : bd c9 31 LDA $31c9,x ; (ubitmask[0] + 0)
2ee8 : 49 ff __ EOR #$ff
2eea : 65 1c __ ADC ACCU + 1 
2eec : 85 1c __ STA ACCU + 1 
2eee : a9 00 __ LDA #$00
2ef0 : 65 1d __ ADC ACCU + 2 
2ef2 : 90 07 __ BCC $2efb ; (fround + 242)
2ef4 : 6a __ __ ROR
2ef5 : 66 1c __ ROR ACCU + 1 
2ef7 : 66 1b __ ROR ACCU + 0 
2ef9 : e6 07 __ INC WORK + 4 
2efb : 85 1d __ STA ACCU + 2 
2efd : 4c 20 2e JMP $2e20 ; (fround + 23)
2f00 : 4c 11 2b JMP $2b11 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
2f03 : 20 00 2b JSR $2b00 ; (freg + 36)
2f06 : a5 07 __ LDA WORK + 4 
2f08 : c9 7f __ CMP #$7f
2f0a : b0 07 __ BCS $2f13 ; (f32_to_i16 + 16)
2f0c : a9 00 __ LDA #$00
2f0e : 85 1b __ STA ACCU + 0 
2f10 : 85 1c __ STA ACCU + 1 
2f12 : 60 __ __ RTS
2f13 : e9 8e __ SBC #$8e
2f15 : 90 16 __ BCC $2f2d ; (f32_to_i16 + 42)
2f17 : 24 1e __ BIT ACCU + 3 
2f19 : 30 09 __ BMI $2f24 ; (f32_to_i16 + 33)
2f1b : a9 ff __ LDA #$ff
2f1d : 85 1b __ STA ACCU + 0 
2f1f : a9 7f __ LDA #$7f
2f21 : 85 1c __ STA ACCU + 1 
2f23 : 60 __ __ RTS
2f24 : a9 00 __ LDA #$00
2f26 : 85 1b __ STA ACCU + 0 
2f28 : a9 80 __ LDA #$80
2f2a : 85 1c __ STA ACCU + 1 
2f2c : 60 __ __ RTS
2f2d : aa __ __ TAX
2f2e : a5 1c __ LDA ACCU + 1 
2f30 : 46 1d __ LSR ACCU + 2 
2f32 : 6a __ __ ROR
2f33 : e8 __ __ INX
2f34 : d0 fa __ BNE $2f30 ; (f32_to_i16 + 45)
2f36 : 24 1e __ BIT ACCU + 3 
2f38 : 10 0e __ BPL $2f48 ; (f32_to_i16 + 69)
2f3a : 38 __ __ SEC
2f3b : 49 ff __ EOR #$ff
2f3d : 69 00 __ ADC #$00
2f3f : 85 1b __ STA ACCU + 0 
2f41 : a9 00 __ LDA #$00
2f43 : e5 1d __ SBC ACCU + 2 
2f45 : 85 1c __ STA ACCU + 1 
2f47 : 60 __ __ RTS
2f48 : 85 1b __ STA ACCU + 0 
2f4a : a5 1d __ LDA ACCU + 2 
2f4c : 85 1c __ STA ACCU + 1 
2f4e : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
2f4f : 24 1c __ BIT ACCU + 1 
2f51 : 30 03 __ BMI $2f56 ; (sint16_to_float + 7)
2f53 : 4c 6d 2f JMP $2f6d ; (uint16_to_float + 0)
2f56 : 38 __ __ SEC
2f57 : a9 00 __ LDA #$00
2f59 : e5 1b __ SBC ACCU + 0 
2f5b : 85 1b __ STA ACCU + 0 
2f5d : a9 00 __ LDA #$00
2f5f : e5 1c __ SBC ACCU + 1 
2f61 : 85 1c __ STA ACCU + 1 
2f63 : 20 6d 2f JSR $2f6d ; (uint16_to_float + 0)
2f66 : a5 1e __ LDA ACCU + 3 
2f68 : 09 80 __ ORA #$80
2f6a : 85 1e __ STA ACCU + 3 
2f6c : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
2f6d : a5 1b __ LDA ACCU + 0 
2f6f : 05 1c __ ORA ACCU + 1 
2f71 : d0 05 __ BNE $2f78 ; (uint16_to_float + 11)
2f73 : 85 1d __ STA ACCU + 2 
2f75 : 85 1e __ STA ACCU + 3 
2f77 : 60 __ __ RTS
2f78 : a2 8e __ LDX #$8e
2f7a : a5 1c __ LDA ACCU + 1 
2f7c : 30 06 __ BMI $2f84 ; (uint16_to_float + 23)
2f7e : ca __ __ DEX
2f7f : 06 1b __ ASL ACCU + 0 
2f81 : 2a __ __ ROL
2f82 : 10 fa __ BPL $2f7e ; (uint16_to_float + 17)
2f84 : 0a __ __ ASL
2f85 : 85 1d __ STA ACCU + 2 
2f87 : a5 1b __ LDA ACCU + 0 
2f89 : 85 1c __ STA ACCU + 1 
2f8b : 8a __ __ TXA
2f8c : 4a __ __ LSR
2f8d : 85 1e __ STA ACCU + 3 
2f8f : a9 00 __ LDA #$00
2f91 : 85 1b __ STA ACCU + 0 
2f93 : 66 1d __ ROR ACCU + 2 
2f95 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
2f96 : a5 04 __ LDA WORK + 1 
2f98 : 05 05 __ ORA WORK + 2 
2f9a : 05 06 __ ORA WORK + 3 
2f9c : d0 05 __ BNE $2fa3 ; (mul32 + 13)
2f9e : a5 03 __ LDA WORK + 0 
2fa0 : 4c a6 2a JMP $2aa6 ; (mul32by8 + 0)
2fa3 : a0 00 __ LDY #$00
2fa5 : 84 07 __ STY WORK + 4 
2fa7 : 84 08 __ STY WORK + 5 
2fa9 : 98 __ __ TYA
2faa : 38 __ __ SEC
2fab : 66 03 __ ROR WORK + 0 
2fad : 90 15 __ BCC $2fc4 ; (mul32 + 46)
2faf : aa __ __ TAX
2fb0 : 18 __ __ CLC
2fb1 : a5 07 __ LDA WORK + 4 
2fb3 : 65 1b __ ADC ACCU + 0 
2fb5 : 85 07 __ STA WORK + 4 
2fb7 : a5 08 __ LDA WORK + 5 
2fb9 : 65 1c __ ADC ACCU + 1 
2fbb : 85 08 __ STA WORK + 5 
2fbd : 98 __ __ TYA
2fbe : 65 1d __ ADC ACCU + 2 
2fc0 : a8 __ __ TAY
2fc1 : 8a __ __ TXA
2fc2 : 65 1e __ ADC ACCU + 3 
2fc4 : 46 04 __ LSR WORK + 1 
2fc6 : 90 0f __ BCC $2fd7 ; (mul32 + 65)
2fc8 : aa __ __ TAX
2fc9 : 18 __ __ CLC
2fca : a5 08 __ LDA WORK + 5 
2fcc : 65 1b __ ADC ACCU + 0 
2fce : 85 08 __ STA WORK + 5 
2fd0 : 98 __ __ TYA
2fd1 : 65 1c __ ADC ACCU + 1 
2fd3 : a8 __ __ TAY
2fd4 : 8a __ __ TXA
2fd5 : 65 1d __ ADC ACCU + 2 
2fd7 : 46 05 __ LSR WORK + 2 
2fd9 : 90 09 __ BCC $2fe4 ; (mul32 + 78)
2fdb : aa __ __ TAX
2fdc : 18 __ __ CLC
2fdd : 98 __ __ TYA
2fde : 65 1b __ ADC ACCU + 0 
2fe0 : a8 __ __ TAY
2fe1 : 8a __ __ TXA
2fe2 : 65 1c __ ADC ACCU + 1 
2fe4 : 46 06 __ LSR WORK + 3 
2fe6 : 90 03 __ BCC $2feb ; (mul32 + 85)
2fe8 : 18 __ __ CLC
2fe9 : 65 1b __ ADC ACCU + 0 
2feb : 06 1b __ ASL ACCU + 0 
2fed : 26 1c __ ROL ACCU + 1 
2fef : 26 1d __ ROL ACCU + 2 
2ff1 : 26 1e __ ROL ACCU + 3 
2ff3 : 46 03 __ LSR WORK + 0 
2ff5 : 90 cd __ BCC $2fc4 ; (mul32 + 46)
2ff7 : d0 b6 __ BNE $2faf ; (mul32 + 25)
2ff9 : 84 09 __ STY WORK + 6 
2ffb : 85 0a __ STA WORK + 7 
2ffd : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
2ffe : 24 1e __ BIT ACCU + 3 
3000 : 10 0d __ BPL $300f ; (divs32 + 17)
3002 : 20 1c 30 JSR $301c ; (negaccu32 + 0)
3005 : 24 06 __ BIT WORK + 3 
3007 : 10 0d __ BPL $3016 ; (divs32 + 24)
3009 : 20 36 30 JSR $3036 ; (negtmp32 + 0)
300c : 4c 50 30 JMP $3050 ; (divmod32 + 0)
300f : 24 06 __ BIT WORK + 3 
3011 : 10 f9 __ BPL $300c ; (divs32 + 14)
3013 : 20 36 30 JSR $3036 ; (negtmp32 + 0)
3016 : 20 50 30 JSR $3050 ; (divmod32 + 0)
3019 : 4c 1c 30 JMP $301c ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
301c : 38 __ __ SEC
301d : a9 00 __ LDA #$00
301f : e5 1b __ SBC ACCU + 0 
3021 : 85 1b __ STA ACCU + 0 
3023 : a9 00 __ LDA #$00
3025 : e5 1c __ SBC ACCU + 1 
3027 : 85 1c __ STA ACCU + 1 
3029 : a9 00 __ LDA #$00
302b : e5 1d __ SBC ACCU + 2 
302d : 85 1d __ STA ACCU + 2 
302f : a9 00 __ LDA #$00
3031 : e5 1e __ SBC ACCU + 3 
3033 : 85 1e __ STA ACCU + 3 
3035 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
3036 : 38 __ __ SEC
3037 : a9 00 __ LDA #$00
3039 : e5 03 __ SBC WORK + 0 
303b : 85 03 __ STA WORK + 0 
303d : a9 00 __ LDA #$00
303f : e5 04 __ SBC WORK + 1 
3041 : 85 04 __ STA WORK + 1 
3043 : a9 00 __ LDA #$00
3045 : e5 05 __ SBC WORK + 2 
3047 : 85 05 __ STA WORK + 2 
3049 : a9 00 __ LDA #$00
304b : e5 06 __ SBC WORK + 3 
304d : 85 06 __ STA WORK + 3 
304f : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
3050 : 84 02 __ STY $02 
3052 : a0 20 __ LDY #$20
3054 : a9 00 __ LDA #$00
3056 : 85 07 __ STA WORK + 4 
3058 : 85 08 __ STA WORK + 5 
305a : 85 09 __ STA WORK + 6 
305c : 85 0a __ STA WORK + 7 
305e : a5 05 __ LDA WORK + 2 
3060 : 05 06 __ ORA WORK + 3 
3062 : d0 78 __ BNE $30dc ; (divmod32 + 140)
3064 : a5 04 __ LDA WORK + 1 
3066 : d0 27 __ BNE $308f ; (divmod32 + 63)
3068 : 18 __ __ CLC
3069 : 26 1b __ ROL ACCU + 0 
306b : 26 1c __ ROL ACCU + 1 
306d : 26 1d __ ROL ACCU + 2 
306f : 26 1e __ ROL ACCU + 3 
3071 : 2a __ __ ROL
3072 : 90 05 __ BCC $3079 ; (divmod32 + 41)
3074 : e5 03 __ SBC WORK + 0 
3076 : 38 __ __ SEC
3077 : b0 06 __ BCS $307f ; (divmod32 + 47)
3079 : c5 03 __ CMP WORK + 0 
307b : 90 02 __ BCC $307f ; (divmod32 + 47)
307d : e5 03 __ SBC WORK + 0 
307f : 88 __ __ DEY
3080 : d0 e7 __ BNE $3069 ; (divmod32 + 25)
3082 : 85 07 __ STA WORK + 4 
3084 : 26 1b __ ROL ACCU + 0 
3086 : 26 1c __ ROL ACCU + 1 
3088 : 26 1d __ ROL ACCU + 2 
308a : 26 1e __ ROL ACCU + 3 
308c : a4 02 __ LDY $02 
308e : 60 __ __ RTS
308f : a5 1e __ LDA ACCU + 3 
3091 : d0 10 __ BNE $30a3 ; (divmod32 + 83)
3093 : a6 1d __ LDX ACCU + 2 
3095 : 86 1e __ STX ACCU + 3 
3097 : a6 1c __ LDX ACCU + 1 
3099 : 86 1d __ STX ACCU + 2 
309b : a6 1b __ LDX ACCU + 0 
309d : 86 1c __ STX ACCU + 1 
309f : 85 1b __ STA ACCU + 0 
30a1 : a0 18 __ LDY #$18
30a3 : 18 __ __ CLC
30a4 : 26 1b __ ROL ACCU + 0 
30a6 : 26 1c __ ROL ACCU + 1 
30a8 : 26 1d __ ROL ACCU + 2 
30aa : 26 1e __ ROL ACCU + 3 
30ac : 26 07 __ ROL WORK + 4 
30ae : 26 08 __ ROL WORK + 5 
30b0 : 90 0c __ BCC $30be ; (divmod32 + 110)
30b2 : a5 07 __ LDA WORK + 4 
30b4 : e5 03 __ SBC WORK + 0 
30b6 : aa __ __ TAX
30b7 : a5 08 __ LDA WORK + 5 
30b9 : e5 04 __ SBC WORK + 1 
30bb : 38 __ __ SEC
30bc : b0 0c __ BCS $30ca ; (divmod32 + 122)
30be : 38 __ __ SEC
30bf : a5 07 __ LDA WORK + 4 
30c1 : e5 03 __ SBC WORK + 0 
30c3 : aa __ __ TAX
30c4 : a5 08 __ LDA WORK + 5 
30c6 : e5 04 __ SBC WORK + 1 
30c8 : 90 04 __ BCC $30ce ; (divmod32 + 126)
30ca : 86 07 __ STX WORK + 4 
30cc : 85 08 __ STA WORK + 5 
30ce : 88 __ __ DEY
30cf : d0 d3 __ BNE $30a4 ; (divmod32 + 84)
30d1 : 26 1b __ ROL ACCU + 0 
30d3 : 26 1c __ ROL ACCU + 1 
30d5 : 26 1d __ ROL ACCU + 2 
30d7 : 26 1e __ ROL ACCU + 3 
30d9 : a4 02 __ LDY $02 
30db : 60 __ __ RTS
30dc : a0 10 __ LDY #$10
30de : a5 1e __ LDA ACCU + 3 
30e0 : 85 08 __ STA WORK + 5 
30e2 : a5 1d __ LDA ACCU + 2 
30e4 : 85 07 __ STA WORK + 4 
30e6 : a9 00 __ LDA #$00
30e8 : 85 1d __ STA ACCU + 2 
30ea : 85 1e __ STA ACCU + 3 
30ec : 18 __ __ CLC
30ed : 26 1b __ ROL ACCU + 0 
30ef : 26 1c __ ROL ACCU + 1 
30f1 : 26 07 __ ROL WORK + 4 
30f3 : 26 08 __ ROL WORK + 5 
30f5 : 26 09 __ ROL WORK + 6 
30f7 : 26 0a __ ROL WORK + 7 
30f9 : a5 07 __ LDA WORK + 4 
30fb : c5 03 __ CMP WORK + 0 
30fd : a5 08 __ LDA WORK + 5 
30ff : e5 04 __ SBC WORK + 1 
3101 : a5 09 __ LDA WORK + 6 
3103 : e5 05 __ SBC WORK + 2 
3105 : aa __ __ TAX
3106 : a5 0a __ LDA WORK + 7 
3108 : e5 06 __ SBC WORK + 3 
310a : 90 11 __ BCC $311d ; (divmod32 + 205)
310c : 86 09 __ STX WORK + 6 
310e : 85 0a __ STA WORK + 7 
3110 : a5 07 __ LDA WORK + 4 
3112 : e5 03 __ SBC WORK + 0 
3114 : 85 07 __ STA WORK + 4 
3116 : a5 08 __ LDA WORK + 5 
3118 : e5 04 __ SBC WORK + 1 
311a : 85 08 __ STA WORK + 5 
311c : 38 __ __ SEC
311d : 88 __ __ DEY
311e : d0 cd __ BNE $30ed ; (divmod32 + 157)
3120 : 26 1b __ ROL ACCU + 0 
3122 : 26 1c __ ROL ACCU + 1 
3124 : a4 02 __ LDY $02 
3126 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
3127 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
lmask:
3128 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
3130 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
3138 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
MixedColors:
313c : __ __ __ BYT 00 00 00 00 00 00 00 00 11 44 11 44 11 44 11 44 : .........D.D.D.D
314c : __ __ __ BYT 22 88 22 88 22 88 22 88 33 cc 33 cc 33 cc 33 cc : ".".".".3.3.3.3.
315c : __ __ __ BYT 44 11 44 11 44 11 44 11 55 55 55 55 55 55 55 55 : D.D.D.D.UUUUUUUU
316c : __ __ __ BYT 66 99 66 99 66 99 66 99 77 dd 77 dd 77 dd 77 dd : f.f.f.f.w.w.w.w.
317c : __ __ __ BYT 88 22 88 22 88 22 88 22 99 66 99 66 99 66 99 66 : .".".".".f.f.f.f
318c : __ __ __ BYT aa aa aa aa aa aa aa aa bb ee bb ee bb ee bb ee : ................
319c : __ __ __ BYT cc 33 cc 33 cc 33 cc 33 dd 77 dd 77 dd 77 dd 77 : .3.3.3.3.w.w.w.w
31ac : __ __ __ BYT ee bb ee bb ee bb ee bb ff ff ff ff ff ff ff ff : ................
--------------------------------------------------------------------
ormask:
31bc : __ __ __ BYT c0 c0 30 30 0c 0c 03 03                         : ..00....
--------------------------------------------------------------------
cbytes:
31c4 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
giocharmap:
31c8 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
ubitmask:
31c9 : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
Screen:
31d1 : __ __ __ BSS	8
--------------------------------------------------------------------
BLIT_CODE:
3200 : __ __ __ BSS	224
