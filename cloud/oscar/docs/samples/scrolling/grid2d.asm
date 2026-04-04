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
080e : 8e cf 0b STX $0bcf ; (spentry + 0)
0811 : a2 14 __ LDX #$14
0813 : a0 40 __ LDY #$40
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 19 __ CPX #$19
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 00 __ CPY #$00
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 fa __ LDA #$fa
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
; 183, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/grid2d.c"
.s1:
0880 : a2 03 __ LDX #$03
0882 : b5 53 __ LDA T7 + 0,x 
0884 : 9d fc 9f STA $9ffc,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : a9 00 __ LDA #$00
088c : 85 48 __ STA T2 + 0 
088e : a9 15 __ LDA #$15
0890 : 85 49 __ STA T2 + 1 
.l5:
0892 : a9 00 __ LDA #$00
0894 : 85 4a __ STA T3 + 0 
.l6:
0896 : 20 4b 0b JSR $0b4b ; (rand.s4 + 0)
0899 : a5 1b __ LDA ACCU + 0 
089b : 29 03 __ AND #$03
089d : a4 4a __ LDY T3 + 0 
089f : 91 48 __ STA (T2 + 0),y 
08a1 : c8 __ __ INY
08a2 : 84 4a __ STY T3 + 0 
08a4 : c0 20 __ CPY #$20
08a6 : d0 ee __ BNE $0896 ; (main.l6 + 0)
.s7:
08a8 : 18 __ __ CLC
08a9 : a5 48 __ LDA T2 + 0 
08ab : 69 20 __ ADC #$20
08ad : 85 48 __ STA T2 + 0 
08af : 90 02 __ BCC $08b3 ; (main.s24 + 0)
.s23:
08b1 : e6 49 __ INC T2 + 1 
.s24:
08b3 : aa __ __ TAX
08b4 : d0 dc __ BNE $0892 ; (main.l5 + 0)
.s21:
08b6 : a5 49 __ LDA T2 + 1 
08b8 : c9 19 __ CMP #$19
08ba : d0 d6 __ BNE $0892 ; (main.l5 + 0)
.s8:
08bc : a9 00 __ LDA #$00
08be : 8d 20 d0 STA $d020 
08c1 : 20 72 0b JSR $0b72 ; (rirq_init_kernal.s4 + 0)
08c4 : a9 01 __ LDA #$01
08c6 : 85 0f __ STA P2 
08c8 : a9 13 __ LDA #$13
08ca : 85 0e __ STA P1 
08cc : a9 6f __ LDA #$6f
08ce : 85 0d __ STA P0 
08d0 : 20 5d 0c JSR $0c5d ; (rirq_build.s4 + 0)
08d3 : a9 03 __ LDA #$03
08d5 : 85 0f __ STA P2 
08d7 : a9 56 __ LDA #$56
08d9 : 8d d2 0b STA $0bd2 ; (rasterIRQRows[0] + 0)
08dc : a9 00 __ LDA #$00
08de : 8d 71 13 STA $1371 ; (blank.code[0] + 1)
08e1 : a9 11 __ LDA #$11
08e3 : 8d 7a 13 STA $137a ; (blank.code[0] + 10)
08e6 : a9 d0 __ LDA #$d0
08e8 : 8d 7b 13 STA $137b ; (blank.code[0] + 11)
08eb : a9 70 __ LDA #$70
08ed : 8d 4f 13 STA $134f ; (rasterIRQLow[0] + 0)
08f0 : a9 13 __ LDA #$13
08f2 : 8d 5f 13 STA $135f ; (rasterIRQHigh[0] + 0)
08f5 : a9 8f __ LDA #$8f
08f7 : 85 0d __ STA P0 
08f9 : a9 13 __ LDA #$13
08fb : 85 0e __ STA P1 
08fd : 20 5d 0c JSR $0c5d ; (rirq_build.s4 + 0)
0900 : c6 0f __ DEC P2 
0902 : a9 d0 __ LDA #$d0
0904 : 8d 9a 13 STA $139a ; (scroll.code[0] + 10)
0907 : 8d 9e 13 STA $139e ; (scroll.code[0] + 14)
090a : 8d a3 13 STA $13a3 ; (scroll.code[0] + 19)
090d : a9 5e __ LDA #$5e
090f : 8d d3 0b STA $0bd3 ; (rasterIRQRows[0] + 1)
0912 : a9 0a __ LDA #$0a
0914 : 8d 91 13 STA $1391 ; (scroll.code[0] + 1)
0917 : a9 10 __ LDA #$10
0919 : 8d 93 13 STA $1393 ; (scroll.code[0] + 3)
091c : a9 88 __ LDA #$88
091e : 8d 99 13 STA $1399 ; (scroll.code[0] + 9)
0921 : a9 fd __ LDA #$fd
0923 : 8d 9b 13 STA $139b ; (scroll.code[0] + 11)
0926 : a9 11 __ LDA #$11
0928 : 8d 9d 13 STA $139d ; (scroll.code[0] + 13)
092b : a9 00 __ LDA #$00
092d : 8d a0 13 STA $13a0 ; (scroll.code[0] + 16)
0930 : a9 16 __ LDA #$16
0932 : 8d a2 13 STA $13a2 ; (scroll.code[0] + 18)
0935 : a9 90 __ LDA #$90
0937 : 8d 50 13 STA $1350 ; (rasterIRQLow[0] + 1)
093a : a9 13 __ LDA #$13
093c : 8d 60 13 STA $1360 ; (rasterIRQHigh[0] + 1)
093f : a9 af __ LDA #$af
0941 : 85 0d __ STA P0 
0943 : a9 13 __ LDA #$13
0945 : 85 0e __ STA P1 
0947 : 20 5d 0c JSR $0c5d ; (rirq_build.s4 + 0)
094a : a9 d0 __ LDA #$d0
094c : 8d bb 13 STA $13bb ; (bottom.code[0] + 11)
094f : 8d be 13 STA $13be ; (bottom.code[0] + 14)
0952 : a9 fa __ LDA #$fa
0954 : 8d d4 0b STA $0bd4 ; (rasterIRQRows[0] + 2)
0957 : a9 18 __ LDA #$18
0959 : 8d b1 13 STA $13b1 ; (bottom.code[0] + 1)
095c : a9 08 __ LDA #$08
095e : 8d b3 13 STA $13b3 ; (bottom.code[0] + 3)
0961 : a9 11 __ LDA #$11
0963 : 8d ba 13 STA $13ba ; (bottom.code[0] + 10)
0966 : a9 16 __ LDA #$16
0968 : 8d bd 13 STA $13bd ; (bottom.code[0] + 13)
096b : a9 b0 __ LDA #$b0
096d : 8d 51 13 STA $1351 ; (rasterIRQLow[0] + 2)
0970 : a9 13 __ LDA #$13
0972 : 8d 61 13 STA $1361 ; (rasterIRQHigh[0] + 2)
0975 : a9 00 __ LDA #$00
0977 : 20 01 0d JSR $0d01 ; (rirq_sort.s4 + 0)
097a : 20 b1 0b JSR $0bb1 ; (rirq_start.s4 + 0)
097d : a9 00 __ LDA #$00
097f : 85 4a __ STA T3 + 0 
0981 : 85 4c __ STA T4 + 0 
0983 : 85 4e __ STA T5 + 0 
0985 : 85 4f __ STA T5 + 1 
0987 : 85 50 __ STA T6 + 0 
0989 : 85 51 __ STA T6 + 1 
098b : 85 53 __ STA T7 + 0 
098d : 85 54 __ STA T7 + 1 
098f : 85 55 __ STA T8 + 0 
0991 : 85 56 __ STA T8 + 1 
0993 : a9 05 __ LDA #$05
0995 : 85 4b __ STA T3 + 1 
.l22:
0997 : 85 4d __ STA T4 + 1 
.l9:
0999 : ee 20 d0 INC $d020 
099c : ad 20 d0 LDA $d020 
099f : 20 c3 0b JSR $0bc3 ; (rirq_wait.l4 + 0)
09a2 : ce 20 d0 DEC $d020 
09a5 : a5 4a __ LDA T3 + 0 
09a7 : 85 43 __ STA T0 + 0 
09a9 : ad 20 d0 LDA $d020 
09ac : a5 4b __ LDA T3 + 1 
09ae : 4a __ __ LSR
09af : 66 43 __ ROR T0 + 0 
09b1 : 4a __ __ LSR
09b2 : 66 43 __ ROR T0 + 0 
09b4 : 4a __ __ LSR
09b5 : 66 43 __ ROR T0 + 0 
09b7 : 4a __ __ LSR
09b8 : 66 43 __ ROR T0 + 0 
09ba : 4a __ __ LSR
09bb : 66 43 __ ROR T0 + 0 
09bd : 49 04 __ EOR #$04
09bf : 38 __ __ SEC
09c0 : e9 04 __ SBC #$04
09c2 : a8 __ __ TAY
09c3 : 38 __ __ SEC
09c4 : a9 07 __ LDA #$07
09c6 : e5 43 __ SBC T0 + 0 
09c8 : 29 07 __ AND #$07
09ca : aa __ __ TAX
09cb : 09 70 __ ORA #$70
09cd : 8d 71 13 STA $1371 ; (blank.code[0] + 1)
09d0 : a9 c8 __ LDA #$c8
09d2 : 85 12 __ STA P5 
09d4 : a9 04 __ LDA #$04
09d6 : 85 13 __ STA P6 
09d8 : a9 15 __ LDA #$15
09da : 85 15 __ STA P8 
09dc : a5 43 __ LDA T0 + 0 
09de : 85 17 __ STA P10 
09e0 : 29 07 __ AND #$07
09e2 : c9 01 __ CMP #$01
09e4 : a9 00 __ LDA #$00
09e6 : 85 14 __ STA P7 
09e8 : 69 ff __ ADC #$ff
09ea : 29 0e __ AND #$0e
09ec : 49 0a __ EOR #$0a
09ee : 8d 91 13 STA $1391 ; (scroll.code[0] + 1)
09f1 : 98 __ __ TYA
09f2 : 4a __ __ LSR
09f3 : 66 17 __ ROR P10 
09f5 : 4a __ __ LSR
09f6 : 66 17 __ ROR P10 
09f8 : 4a __ __ LSR
09f9 : 66 17 __ ROR P10 
09fb : 8a __ __ TXA
09fc : 09 10 __ ORA #$10
09fe : 8d 93 13 STA $1393 ; (scroll.code[0] + 3)
0a01 : a5 4c __ LDA T4 + 0 
0a03 : 85 16 __ STA P9 
0a05 : a5 4d __ LDA T4 + 1 
0a07 : 4a __ __ LSR
0a08 : 66 16 __ ROR P9 
0a0a : 4a __ __ LSR
0a0b : 66 16 __ ROR P9 
0a0d : 4a __ __ LSR
0a0e : 66 16 __ ROR P9 
0a10 : 4a __ __ LSR
0a11 : 66 16 __ ROR P9 
0a13 : 4a __ __ LSR
0a14 : 66 16 __ ROR P9 
0a16 : 49 04 __ EOR #$04
0a18 : 38 __ __ SEC
0a19 : e9 04 __ SBC #$04
0a1b : aa __ __ TAX
0a1c : 38 __ __ SEC
0a1d : a9 07 __ LDA #$07
0a1f : e5 16 __ SBC P9 
0a21 : 29 07 __ AND #$07
0a23 : 8d a0 13 STA $13a0 ; (scroll.code[0] + 16)
0a26 : 8a __ __ TXA
0a27 : 4a __ __ LSR
0a28 : 66 16 __ ROR P9 
0a2a : 4a __ __ LSR
0a2b : 66 16 __ ROR P9 
0a2d : 4a __ __ LSR
0a2e : 66 16 __ ROR P9 
0a30 : 20 90 0d JSR $0d90 ; (expand.s4 + 0)
0a33 : 18 __ __ CLC
0a34 : a5 4e __ LDA T5 + 0 
0a36 : 65 55 __ ADC T8 + 0 
0a38 : 85 46 __ STA T1 + 0 
0a3a : a5 4f __ LDA T5 + 1 
0a3c : 65 56 __ ADC T8 + 1 
0a3e : 85 47 __ STA T1 + 1 
0a40 : 18 __ __ CLC
0a41 : a5 50 __ LDA T6 + 0 
0a43 : 65 53 __ ADC T7 + 0 
0a45 : 85 48 __ STA T2 + 0 
0a47 : a5 51 __ LDA T6 + 1 
0a49 : 65 54 __ ADC T7 + 1 
0a4b : 85 49 __ STA T2 + 1 
0a4d : 20 4b 0b JSR $0b4b ; (rand.s4 + 0)
0a50 : a5 1b __ LDA ACCU + 0 
0a52 : 29 3f __ AND #$3f
0a54 : d0 24 __ BNE $0a7a ; (main.s10 + 0)
.s20:
0a56 : 20 4b 0b JSR $0b4b ; (rand.s4 + 0)
0a59 : a5 1b __ LDA ACCU + 0 
0a5b : 29 3f __ AND #$3f
0a5d : 38 __ __ SEC
0a5e : e9 20 __ SBC #$20
0a60 : 85 53 __ STA T7 + 0 
0a62 : a9 00 __ LDA #$00
0a64 : e9 00 __ SBC #$00
0a66 : 85 54 __ STA T7 + 1 
0a68 : 20 4b 0b JSR $0b4b ; (rand.s4 + 0)
0a6b : a5 1b __ LDA ACCU + 0 
0a6d : 29 3f __ AND #$3f
0a6f : 38 __ __ SEC
0a70 : e9 20 __ SBC #$20
0a72 : 85 55 __ STA T8 + 0 
0a74 : a9 00 __ LDA #$00
0a76 : e9 00 __ SBC #$00
0a78 : 85 56 __ STA T8 + 1 
.s10:
0a7a : 18 __ __ CLC
0a7b : a5 48 __ LDA T2 + 0 
0a7d : 69 08 __ ADC #$08
0a7f : 85 43 __ STA T0 + 0 
0a81 : a5 49 __ LDA T2 + 1 
0a83 : 69 00 __ ADC #$00
0a85 : 4a __ __ LSR
0a86 : 66 43 __ ROR T0 + 0 
0a88 : 4a __ __ LSR
0a89 : 66 43 __ ROR T0 + 0 
0a8b : 4a __ __ LSR
0a8c : 66 43 __ ROR T0 + 0 
0a8e : 4a __ __ LSR
0a8f : 66 43 __ ROR T0 + 0 
0a91 : 49 08 __ EOR #$08
0a93 : 38 __ __ SEC
0a94 : e9 08 __ SBC #$08
0a96 : 85 44 __ STA T0 + 1 
0a98 : 38 __ __ SEC
0a99 : a5 48 __ LDA T2 + 0 
0a9b : e5 43 __ SBC T0 + 0 
0a9d : 85 50 __ STA T6 + 0 
0a9f : a5 49 __ LDA T2 + 1 
0aa1 : e5 44 __ SBC T0 + 1 
0aa3 : 85 51 __ STA T6 + 1 
0aa5 : 18 __ __ CLC
0aa6 : a5 46 __ LDA T1 + 0 
0aa8 : 69 08 __ ADC #$08
0aaa : 85 43 __ STA T0 + 0 
0aac : a5 47 __ LDA T1 + 1 
0aae : 69 00 __ ADC #$00
0ab0 : 4a __ __ LSR
0ab1 : 66 43 __ ROR T0 + 0 
0ab3 : 4a __ __ LSR
0ab4 : 66 43 __ ROR T0 + 0 
0ab6 : 4a __ __ LSR
0ab7 : 66 43 __ ROR T0 + 0 
0ab9 : 4a __ __ LSR
0aba : 66 43 __ ROR T0 + 0 
0abc : 49 08 __ EOR #$08
0abe : 38 __ __ SEC
0abf : e9 08 __ SBC #$08
0ac1 : 85 44 __ STA T0 + 1 
0ac3 : 38 __ __ SEC
0ac4 : a5 46 __ LDA T1 + 0 
0ac6 : e5 43 __ SBC T0 + 0 
0ac8 : 85 43 __ STA T0 + 0 
0aca : a5 47 __ LDA T1 + 1 
0acc : e5 44 __ SBC T0 + 1 
0ace : 85 44 __ STA T0 + 1 
0ad0 : 18 __ __ CLC
0ad1 : a5 43 __ LDA T0 + 0 
0ad3 : 65 4a __ ADC T3 + 0 
0ad5 : 85 4a __ STA T3 + 0 
0ad7 : a5 44 __ LDA T0 + 1 
0ad9 : 65 4b __ ADC T3 + 1 
0adb : 85 4b __ STA T3 + 1 
0add : 30 16 __ BMI $0af5 ; (main.s17 + 0)
.s11:
0adf : a5 43 __ LDA T0 + 0 
0ae1 : 85 4e __ STA T5 + 0 
0ae3 : a5 44 __ LDA T0 + 1 
0ae5 : 85 4f __ STA T5 + 1 
0ae7 : a9 68 __ LDA #$68
0ae9 : c5 4b __ CMP T3 + 1 
0aeb : f0 04 __ BEQ $0af1 ; (main.s18 + 0)
.s19:
0aed : 90 06 __ BCC $0af5 ; (main.s17 + 0)
0aef : b0 1e __ BCS $0b0f ; (main.s12 + 0)
.s18:
0af1 : a5 4a __ LDA T3 + 0 
0af3 : f0 1a __ BEQ $0b0f ; (main.s12 + 0)
.s17:
0af5 : 38 __ __ SEC
0af6 : a9 00 __ LDA #$00
0af8 : e5 43 __ SBC T0 + 0 
0afa : 85 4e __ STA T5 + 0 
0afc : a9 00 __ LDA #$00
0afe : e5 44 __ SBC T0 + 1 
0b00 : 85 4f __ STA T5 + 1 
0b02 : 18 __ __ CLC
0b03 : a5 4e __ LDA T5 + 0 
0b05 : 65 4a __ ADC T3 + 0 
0b07 : 85 4a __ STA T3 + 0 
0b09 : a5 4f __ LDA T5 + 1 
0b0b : 65 4b __ ADC T3 + 1 
0b0d : 85 4b __ STA T3 + 1 
.s12:
0b0f : 18 __ __ CLC
0b10 : a5 4c __ LDA T4 + 0 
0b12 : 65 50 __ ADC T6 + 0 
0b14 : 85 4c __ STA T4 + 0 
0b16 : a5 4d __ LDA T4 + 1 
0b18 : 65 51 __ ADC T6 + 1 
0b1a : 85 4d __ STA T4 + 1 
0b1c : 30 0b __ BMI $0b29 ; (main.s14 + 0)
.s13:
0b1e : a9 58 __ LDA #$58
0b20 : c5 4d __ CMP T4 + 1 
0b22 : f0 20 __ BEQ $0b44 ; (main.s15 + 0)
.s16:
0b24 : 90 03 __ BCC $0b29 ; (main.s14 + 0)
0b26 : 4c 99 09 JMP $0999 ; (main.l9 + 0)
.s14:
0b29 : 38 __ __ SEC
0b2a : a9 00 __ LDA #$00
0b2c : e5 50 __ SBC T6 + 0 
0b2e : 85 50 __ STA T6 + 0 
0b30 : a9 00 __ LDA #$00
0b32 : e5 51 __ SBC T6 + 1 
0b34 : 85 51 __ STA T6 + 1 
0b36 : 18 __ __ CLC
0b37 : a5 50 __ LDA T6 + 0 
0b39 : 65 4c __ ADC T4 + 0 
0b3b : 85 4c __ STA T4 + 0 
0b3d : a5 51 __ LDA T6 + 1 
0b3f : 65 4d __ ADC T4 + 1 
0b41 : 4c 97 09 JMP $0997 ; (main.l22 + 0)
.s15:
0b44 : a5 4c __ LDA T4 + 0 
0b46 : d0 e1 __ BNE $0b29 ; (main.s14 + 0)
0b48 : 4c 99 09 JMP $0999 ; (main.l9 + 0)
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0b4b : ad d1 0b LDA $0bd1 ; (seed + 1)
0b4e : 4a __ __ LSR
0b4f : ad d0 0b LDA $0bd0 ; (seed + 0)
0b52 : 6a __ __ ROR
0b53 : aa __ __ TAX
0b54 : a9 00 __ LDA #$00
0b56 : 6a __ __ ROR
0b57 : 4d d0 0b EOR $0bd0 ; (seed + 0)
0b5a : 85 1b __ STA ACCU + 0 
0b5c : 8a __ __ TXA
0b5d : 4d d1 0b EOR $0bd1 ; (seed + 1)
0b60 : 85 1c __ STA ACCU + 1 
0b62 : 4a __ __ LSR
0b63 : 45 1b __ EOR ACCU + 0 
0b65 : 8d d0 0b STA $0bd0 ; (seed + 0)
0b68 : 85 1b __ STA ACCU + 0 
0b6a : 45 1c __ EOR ACCU + 1 
0b6c : 8d d1 0b STA $0bd1 ; (seed + 1)
0b6f : 85 1c __ STA ACCU + 1 
.s3:
0b71 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0b72 : 20 93 0b JSR $0b93 ; (rirq_init_tables.s4 + 0)
0b75 : 78 __ __ SEI
0b76 : a9 01 __ LDA #$01
0b78 : 8d 1a d0 STA $d01a 
0b7b : a9 00 __ LDA #$00
0b7d : 8d 14 03 STA $0314 
0b80 : a9 0c __ LDA #$0c
0b82 : 8d 15 03 STA $0315 
0b85 : ad 11 d0 LDA $d011 
0b88 : 29 7f __ AND #$7f
0b8a : 8d 11 d0 STA $d011 
0b8d : a9 ff __ LDA #$ff
0b8f : 8d 12 d0 STA $d012 
.s3:
0b92 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0b93 : a2 00 __ LDX #$00
.l5:
0b95 : a9 ff __ LDA #$ff
0b97 : 9d d2 0b STA $0bd2,x ; (rasterIRQRows[0] + 0)
0b9a : 8a __ __ TXA
0b9b : 9d e4 0b STA $0be4,x ; (rasterIRQIndex[0] + 1)
0b9e : e8 __ __ INX
0b9f : e0 10 __ CPX #$10
0ba1 : d0 f2 __ BNE $0b95 ; (rirq_init_tables.l5 + 0)
.s6:
0ba3 : 8e e3 0b STX $0be3 ; (rasterIRQIndex[0] + 0)
0ba6 : a9 ff __ LDA #$ff
0ba8 : 8d 4e 13 STA $134e ; (rasterIRQNext[0] + 16)
0bab : a9 00 __ LDA #$00
0bad : 8d e2 0b STA $0be2 ; (rasterIRQRows[0] + 16)
.s3:
0bb0 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0bb1 : ad 11 d0 LDA $d011 
0bb4 : 29 7f __ AND #$7f
0bb6 : 8d 11 d0 STA $d011 
0bb9 : a9 64 __ LDA #$64
0bbb : 8d 12 d0 STA $d012 
0bbe : 0e 19 d0 ASL $d019 
0bc1 : 58 __ __ CLI
.s3:
0bc2 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_wait: ; rirq_wait()->void
; 198, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.l4:
0bc3 : ad f5 0b LDA $0bf5 ; (rirq_count + 0)
0bc6 : cd f6 0b CMP $0bf6 ; (rirq_pcount + 0)
0bc9 : f0 f8 __ BEQ $0bc3 ; (rirq_wait.l4 + 0)
.s5:
0bcb : 8d f6 0b STA $0bf6 ; (rirq_pcount + 0)
.s3:
0bce : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0bcf : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seed:
0bd0 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
rasterIRQRows:
0bd2 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
0be3 : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
0bf4 : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_count:
0bf5 : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_pcount:
0bf6 : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0c00 : ad 19 d0 LDA $d019 
0c03 : 10 51 __ BPL $0c56 ; (rirq_isr_kernal_io + 86)
0c05 : ae f4 0b LDX $0bf4 ; (nextIRQ + 0)
0c08 : 30 33 __ BMI $0c3d ; (rirq_isr_kernal_io + 61)
0c0a : bd 3e 13 LDA $133e,x ; (rasterIRQNext[0] + 0)
0c0d : bc e4 0b LDY $0be4,x ; (rasterIRQIndex[0] + 1)
0c10 : be 4f 13 LDX $134f,y ; (rasterIRQLow[0] + 0)
0c13 : 8e 1d 0c STX $0c1d ; (rirq_isr_kernal_io + 29)
0c16 : be 5f 13 LDX $135f,y ; (rasterIRQHigh[0] + 0)
0c19 : 8e 1e 0c STX $0c1e ; (rirq_isr_kernal_io + 30)
0c1c : 20 00 00 JSR $0000 
0c1f : ee f4 0b INC $0bf4 ; (nextIRQ + 0)
0c22 : ae f4 0b LDX $0bf4 ; (nextIRQ + 0)
0c25 : bc 3e 13 LDY $133e,x ; (rasterIRQNext[0] + 0)
0c28 : 0e 19 d0 ASL $d019 
0c2b : c0 ff __ CPY #$ff
0c2d : f0 14 __ BEQ $0c43 ; (rirq_isr_kernal_io + 67)
0c2f : 88 __ __ DEY
0c30 : 88 __ __ DEY
0c31 : 8c 12 d0 STY $d012 
0c34 : 88 __ __ DEY
0c35 : cc 12 d0 CPY $d012 
0c38 : 90 d0 __ BCC $0c0a ; (rirq_isr_kernal_io + 10)
0c3a : 4c 81 ea JMP $ea81 
0c3d : 0e 19 d0 ASL $d019 
0c40 : 4c 81 ea JMP $ea81 
0c43 : ee f5 0b INC $0bf5 ; (rirq_count + 0)
0c46 : ac 3e 13 LDY $133e ; (rasterIRQNext[0] + 0)
0c49 : 88 __ __ DEY
0c4a : 88 __ __ DEY
0c4b : 8c 12 d0 STY $d012 
0c4e : a2 00 __ LDX #$00
0c50 : 8e f4 0b STX $0bf4 ; (nextIRQ + 0)
0c53 : 4c 81 ea JMP $ea81 
0c56 : ad 0d dc LDA $dc0d 
0c59 : 58 __ __ CLI
0c5a : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0c5d : a5 0d __ LDA P0 ; (ic + 0)
0c5f : 85 1b __ STA ACCU + 0 
0c61 : a5 0e __ LDA P1 ; (ic + 1)
0c63 : 85 1c __ STA ACCU + 1 
0c65 : a9 a0 __ LDA #$a0
0c67 : a0 01 __ LDY #$01
0c69 : 91 0d __ STA (P0),y ; (ic + 0)
0c6b : a9 00 __ LDA #$00
0c6d : c8 __ __ INY
0c6e : 91 0d __ STA (P0),y ; (ic + 0)
0c70 : a9 a2 __ LDA #$a2
0c72 : c8 __ __ INY
0c73 : 91 0d __ STA (P0),y ; (ic + 0)
0c75 : a9 00 __ LDA #$00
0c77 : c8 __ __ INY
0c78 : 91 0d __ STA (P0),y ; (ic + 0)
0c7a : a9 cd __ LDA #$cd
0c7c : c8 __ __ INY
0c7d : 91 0d __ STA (P0),y ; (ic + 0)
0c7f : a9 12 __ LDA #$12
0c81 : c8 __ __ INY
0c82 : 91 0d __ STA (P0),y ; (ic + 0)
0c84 : a9 d0 __ LDA #$d0
0c86 : c8 __ __ INY
0c87 : 91 0d __ STA (P0),y ; (ic + 0)
0c89 : a9 b0 __ LDA #$b0
0c8b : c8 __ __ INY
0c8c : 91 0d __ STA (P0),y ; (ic + 0)
0c8e : a9 fb __ LDA #$fb
0c90 : c8 __ __ INY
0c91 : 91 0d __ STA (P0),y ; (ic + 0)
0c93 : a9 8c __ LDA #$8c
0c95 : c8 __ __ INY
0c96 : 91 0d __ STA (P0),y ; (ic + 0)
0c98 : a9 00 __ LDA #$00
0c9a : c8 __ __ INY
0c9b : 91 0d __ STA (P0),y ; (ic + 0)
0c9d : c8 __ __ INY
0c9e : 91 0d __ STA (P0),y ; (ic + 0)
0ca0 : a8 __ __ TAY
0ca1 : a5 0f __ LDA P2 ; (size + 0)
0ca3 : 91 0d __ STA (P0),y ; (ic + 0)
0ca5 : f0 53 __ BEQ $0cfa ; (rirq_build.s5 + 0)
.s6:
0ca7 : a0 0d __ LDY #$0d
0ca9 : c9 01 __ CMP #$01
0cab : d0 05 __ BNE $0cb2 ; (rirq_build.s7 + 0)
.s10:
0cad : a9 60 __ LDA #$60
0caf : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0cb1 : 60 __ __ RTS
.s7:
0cb2 : a9 8e __ LDA #$8e
0cb4 : 91 0d __ STA (P0),y ; (ic + 0)
0cb6 : a9 00 __ LDA #$00
0cb8 : c8 __ __ INY
0cb9 : 91 0d __ STA (P0),y ; (ic + 0)
0cbb : c8 __ __ INY
0cbc : 91 0d __ STA (P0),y ; (ic + 0)
0cbe : a5 0f __ LDA P2 ; (size + 0)
0cc0 : c9 03 __ CMP #$03
0cc2 : 90 2a __ BCC $0cee ; (rirq_build.s8 + 0)
.s9:
0cc4 : e9 02 __ SBC #$02
0cc6 : aa __ __ TAX
0cc7 : 18 __ __ CLC
0cc8 : a5 0d __ LDA P0 ; (ic + 0)
0cca : 69 01 __ ADC #$01
0ccc : 85 1b __ STA ACCU + 0 
0cce : a5 0e __ LDA P1 ; (ic + 1)
0cd0 : 69 00 __ ADC #$00
0cd2 : 85 1c __ STA ACCU + 1 
.l11:
0cd4 : a9 a9 __ LDA #$a9
0cd6 : 91 1b __ STA (ACCU + 0),y 
0cd8 : a9 00 __ LDA #$00
0cda : c8 __ __ INY
0cdb : 91 1b __ STA (ACCU + 0),y 
0cdd : a9 8d __ LDA #$8d
0cdf : c8 __ __ INY
0ce0 : 91 1b __ STA (ACCU + 0),y 
0ce2 : a9 00 __ LDA #$00
0ce4 : c8 __ __ INY
0ce5 : 91 1b __ STA (ACCU + 0),y 
0ce7 : c8 __ __ INY
0ce8 : 91 1b __ STA (ACCU + 0),y 
0cea : c8 __ __ INY
0ceb : ca __ __ DEX
0cec : d0 e6 __ BNE $0cd4 ; (rirq_build.l11 + 0)
.s8:
0cee : 98 __ __ TYA
0cef : 18 __ __ CLC
0cf0 : 65 0d __ ADC P0 ; (ic + 0)
0cf2 : 85 1b __ STA ACCU + 0 
0cf4 : a5 0e __ LDA P1 ; (ic + 1)
0cf6 : 69 00 __ ADC #$00
0cf8 : 85 1c __ STA ACCU + 1 
.s5:
0cfa : a9 60 __ LDA #$60
0cfc : a0 01 __ LDY #$01
0cfe : 91 1b __ STA (ACCU + 0),y 
0d00 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0d01 : 85 0d __ STA P0 ; (inirq + 0)
0d03 : a9 ff __ LDA #$ff
0d05 : 8d f4 0b STA $0bf4 ; (nextIRQ + 0)
0d08 : ae e4 0b LDX $0be4 ; (rasterIRQIndex[0] + 1)
0d0b : bd d2 0b LDA $0bd2,x ; (rasterIRQRows[0] + 0)
0d0e : 85 1c __ STA ACCU + 1 
0d10 : a2 02 __ LDX #$02
.l5:
0d12 : bc e3 0b LDY $0be3,x ; (rasterIRQIndex[0] + 0)
0d15 : b9 d2 0b LDA $0bd2,y ; (rasterIRQRows[0] + 0)
0d18 : c5 1c __ CMP ACCU + 1 
0d1a : 90 04 __ BCC $0d20 ; (rirq_sort.s12 + 0)
.s6:
0d1c : 85 1c __ STA ACCU + 1 
0d1e : b0 24 __ BCS $0d44 ; (rirq_sort.s7 + 0)
.s12:
0d20 : 86 1d __ STX ACCU + 2 
0d22 : 84 1e __ STY ACCU + 3 
0d24 : 85 1b __ STA ACCU + 0 
0d26 : bd e2 0b LDA $0be2,x ; (rasterIRQRows[0] + 16)
0d29 : 9d e3 0b STA $0be3,x ; (rasterIRQIndex[0] + 0)
0d2c : 90 05 __ BCC $0d33 ; (rirq_sort.l13 + 0)
.s15:
0d2e : 98 __ __ TYA
0d2f : 9d e2 0b STA $0be2,x ; (rasterIRQRows[0] + 16)
0d32 : ca __ __ DEX
.l13:
0d33 : a5 1b __ LDA ACCU + 0 
0d35 : bc e1 0b LDY $0be1,x ; (rasterIRQRows[0] + 15)
0d38 : d9 d2 0b CMP $0bd2,y ; (rasterIRQRows[0] + 0)
0d3b : 90 f1 __ BCC $0d2e ; (rirq_sort.s15 + 0)
.s14:
0d3d : a5 1e __ LDA ACCU + 3 
0d3f : 9d e2 0b STA $0be2,x ; (rasterIRQRows[0] + 16)
0d42 : a6 1d __ LDX ACCU + 2 
.s7:
0d44 : e8 __ __ INX
0d45 : e0 11 __ CPX #$11
0d47 : 90 c9 __ BCC $0d12 ; (rirq_sort.l5 + 0)
.s8:
0d49 : a2 03 __ LDX #$03
.l17:
0d4b : bc e4 0b LDY $0be4,x ; (rasterIRQIndex[0] + 1)
0d4e : b9 d2 0b LDA $0bd2,y ; (rasterIRQRows[0] + 0)
0d51 : 9d 3e 13 STA $133e,x ; (rasterIRQNext[0] + 0)
0d54 : bc e8 0b LDY $0be8,x ; (rasterIRQIndex[0] + 5)
0d57 : b9 d2 0b LDA $0bd2,y ; (rasterIRQRows[0] + 0)
0d5a : 9d 42 13 STA $1342,x ; (rasterIRQNext[0] + 4)
0d5d : bc ec 0b LDY $0bec,x ; (rasterIRQIndex[0] + 9)
0d60 : b9 d2 0b LDA $0bd2,y ; (rasterIRQRows[0] + 0)
0d63 : 9d 46 13 STA $1346,x ; (rasterIRQNext[0] + 8)
0d66 : bc f0 0b LDY $0bf0,x ; (rasterIRQIndex[0] + 13)
0d69 : b9 d2 0b LDA $0bd2,y ; (rasterIRQRows[0] + 0)
0d6c : 9d 4a 13 STA $134a,x ; (rasterIRQNext[0] + 12)
0d6f : ca __ __ DEX
0d70 : 10 d9 __ BPL $0d4b ; (rirq_sort.l17 + 0)
.s18:
0d72 : ad f5 0b LDA $0bf5 ; (rirq_count + 0)
0d75 : 8d f6 0b STA $0bf6 ; (rirq_pcount + 0)
0d78 : a5 0d __ LDA P0 ; (inirq + 0)
0d7a : f0 06 __ BEQ $0d82 ; (rirq_sort.s9 + 0)
.s11:
0d7c : a9 0f __ LDA #$0f
.s16:
0d7e : 8d f4 0b STA $0bf4 ; (nextIRQ + 0)
.s3:
0d81 : 60 __ __ RTS
.s9:
0d82 : ac 3e 13 LDY $133e ; (rasterIRQNext[0] + 0)
0d85 : c0 ff __ CPY #$ff
0d87 : f0 f8 __ BEQ $0d81 ; (rirq_sort.s3 + 0)
.s10:
0d89 : 88 __ __ DEY
0d8a : 8c 12 d0 STY $d012 
0d8d : 4c 7e 0d JMP $0d7e ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
expand: ; expand(u8*,const u8*,u8,u8)->void
; 129, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/grid2d.c"
.s4:
0d90 : a5 16 __ LDA P9 ; (px + 0)
0d92 : 4a __ __ LSR
0d93 : 4a __ __ LSR
0d94 : 18 __ __ CLC
0d95 : 65 14 __ ADC P7 ; (grid + 0)
0d97 : a8 __ __ TAY
0d98 : 90 02 __ BCC $0d9c ; (expand.s18 + 0)
.s17:
0d9a : e6 15 __ INC P8 ; (grid + 1)
.s18:
0d9c : a5 17 __ LDA P10 ; (py + 0)
0d9e : 29 fc __ AND #$fc
0da0 : 0a __ __ ASL
0da1 : 85 1b __ STA ACCU + 0 
0da3 : a9 00 __ LDA #$00
0da5 : 2a __ __ ROL
0da6 : 06 1b __ ASL ACCU + 0 
0da8 : 2a __ __ ROL
0da9 : 06 1b __ ASL ACCU + 0 
0dab : 2a __ __ ROL
0dac : aa __ __ TAX
0dad : 98 __ __ TYA
0dae : 65 1b __ ADC ACCU + 0 
0db0 : 85 14 __ STA P7 ; (grid + 0)
0db2 : 8a __ __ TXA
0db3 : 65 15 __ ADC P8 ; (grid + 1)
0db5 : 85 15 __ STA P8 ; (grid + 1)
0db7 : a5 16 __ LDA P9 ; (px + 0)
0db9 : 29 03 __ AND #$03
0dbb : 85 43 __ STA T0 + 0 
0dbd : c9 01 __ CMP #$01
0dbf : f0 02 __ BEQ $0dc3 ; (expand.s6 + 0)
.s5:
0dc1 : a9 00 __ LDA #$00
.s6:
0dc3 : 85 44 __ STA T5 + 0 
0dc5 : a5 17 __ LDA P10 ; (py + 0)
0dc7 : 29 03 __ AND #$03
0dc9 : 0a __ __ ASL
0dca : 0a __ __ ASL
0dcb : a8 __ __ TAY
0dcc : a9 14 __ LDA #$14
0dce : 85 45 __ STA T6 + 0 
.l7:
0dd0 : 84 11 __ STY P4 
0dd2 : a5 12 __ LDA P5 ; (dp + 0)
0dd4 : 85 0d __ STA P0 
0dd6 : a5 13 __ LDA P6 ; (dp + 1)
0dd8 : 85 0e __ STA P1 
0dda : a5 14 __ LDA P7 ; (grid + 0)
0ddc : 85 0f __ STA P2 
0dde : a5 15 __ LDA P8 ; (grid + 1)
0de0 : 85 10 __ STA P3 
0de2 : a5 44 __ LDA T5 + 0 
0de4 : f0 06 __ BEQ $0dec ; (expand.s8 + 0)
.s16:
0de6 : 20 70 0f JSR $0f70 ; (expandrow1.s4 + 0)
0de9 : 4c 06 0e JMP $0e06 ; (expand.s11 + 0)
.s8:
0dec : a5 43 __ LDA T0 + 0 
0dee : d0 06 __ BNE $0df6 ; (expand.s9 + 0)
.s15:
0df0 : 20 31 0e JSR $0e31 ; (expandrow0.s4 + 0)
0df3 : 4c 06 0e JMP $0e06 ; (expand.s11 + 0)
.s9:
0df6 : c9 02 __ CMP #$02
0df8 : d0 09 __ BNE $0e03 ; (expand.s10 + 0)
.s14:
0dfa : 20 b6 10 JSR $10b6 ; (expandrow2.s4 + 0)
0dfd : a9 02 __ LDA #$02
0dff : 85 43 __ STA T0 + 0 
0e01 : d0 03 __ BNE $0e06 ; (expand.s11 + 0)
.s10:
0e03 : 20 fa 11 JSR $11fa ; (expandrow3.s4 + 0)
.s11:
0e06 : 18 __ __ CLC
0e07 : a5 11 __ LDA P4 
0e09 : 69 04 __ ADC #$04
0e0b : a8 __ __ TAY
0e0c : c0 10 __ CPY #$10
0e0e : d0 0f __ BNE $0e1f ; (expand.s12 + 0)
.s13:
0e10 : 18 __ __ CLC
0e11 : a5 0f __ LDA P2 
0e13 : 69 20 __ ADC #$20
0e15 : 85 14 __ STA P7 ; (grid + 0)
0e17 : a5 10 __ LDA P3 
0e19 : 69 00 __ ADC #$00
0e1b : 85 15 __ STA P8 ; (grid + 1)
0e1d : a0 00 __ LDY #$00
.s12:
0e1f : 18 __ __ CLC
0e20 : a5 0d __ LDA P0 
0e22 : 69 28 __ ADC #$28
0e24 : 85 12 __ STA P5 ; (dp + 0)
0e26 : a5 0e __ LDA P1 
0e28 : 69 00 __ ADC #$00
0e2a : 85 13 __ STA P6 ; (dp + 1)
0e2c : c6 45 __ DEC T6 + 0 
0e2e : d0 a0 __ BNE $0dd0 ; (expand.l7 + 0)
.s3:
0e30 : 60 __ __ RTS
--------------------------------------------------------------------
expandrow0: ; expandrow0(u8*,const u8*,u8)->void
;  46, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/grid2d.c"
.s4:
0e31 : a5 11 __ LDA P4 ; (ly + 0)
0e33 : a0 00 __ LDY #$00
0e35 : 11 0f __ ORA (P2),y ; (grid + 0)
0e37 : aa __ __ TAX
0e38 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0e3b : 91 0d __ STA (P0),y ; (dp + 0)
0e3d : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0e40 : c8 __ __ INY
0e41 : 91 0d __ STA (P0),y ; (dp + 0)
0e43 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0e46 : c8 __ __ INY
0e47 : 91 0d __ STA (P0),y ; (dp + 0)
0e49 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0e4c : c8 __ __ INY
0e4d : 91 0d __ STA (P0),y ; (dp + 0)
0e4f : a0 01 __ LDY #$01
0e51 : b1 0f __ LDA (P2),y ; (grid + 0)
0e53 : 05 11 __ ORA P4 ; (ly + 0)
0e55 : aa __ __ TAX
0e56 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0e59 : a0 04 __ LDY #$04
0e5b : 91 0d __ STA (P0),y ; (dp + 0)
0e5d : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0e60 : c8 __ __ INY
0e61 : 91 0d __ STA (P0),y ; (dp + 0)
0e63 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0e66 : c8 __ __ INY
0e67 : 91 0d __ STA (P0),y ; (dp + 0)
0e69 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0e6c : c8 __ __ INY
0e6d : 91 0d __ STA (P0),y ; (dp + 0)
0e6f : a0 02 __ LDY #$02
0e71 : b1 0f __ LDA (P2),y ; (grid + 0)
0e73 : 05 11 __ ORA P4 ; (ly + 0)
0e75 : aa __ __ TAX
0e76 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0e79 : a0 08 __ LDY #$08
0e7b : 91 0d __ STA (P0),y ; (dp + 0)
0e7d : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0e80 : c8 __ __ INY
0e81 : 91 0d __ STA (P0),y ; (dp + 0)
0e83 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0e86 : c8 __ __ INY
0e87 : 91 0d __ STA (P0),y ; (dp + 0)
0e89 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0e8c : c8 __ __ INY
0e8d : 91 0d __ STA (P0),y ; (dp + 0)
0e8f : a0 03 __ LDY #$03
0e91 : b1 0f __ LDA (P2),y ; (grid + 0)
0e93 : 05 11 __ ORA P4 ; (ly + 0)
0e95 : aa __ __ TAX
0e96 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0e99 : a0 0c __ LDY #$0c
0e9b : 91 0d __ STA (P0),y ; (dp + 0)
0e9d : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0ea0 : c8 __ __ INY
0ea1 : 91 0d __ STA (P0),y ; (dp + 0)
0ea3 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0ea6 : c8 __ __ INY
0ea7 : 91 0d __ STA (P0),y ; (dp + 0)
0ea9 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0eac : c8 __ __ INY
0ead : 91 0d __ STA (P0),y ; (dp + 0)
0eaf : a0 04 __ LDY #$04
0eb1 : b1 0f __ LDA (P2),y ; (grid + 0)
0eb3 : 05 11 __ ORA P4 ; (ly + 0)
0eb5 : aa __ __ TAX
0eb6 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0eb9 : a0 10 __ LDY #$10
0ebb : 91 0d __ STA (P0),y ; (dp + 0)
0ebd : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0ec0 : c8 __ __ INY
0ec1 : 91 0d __ STA (P0),y ; (dp + 0)
0ec3 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0ec6 : c8 __ __ INY
0ec7 : 91 0d __ STA (P0),y ; (dp + 0)
0ec9 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0ecc : c8 __ __ INY
0ecd : 91 0d __ STA (P0),y ; (dp + 0)
0ecf : a0 05 __ LDY #$05
0ed1 : b1 0f __ LDA (P2),y ; (grid + 0)
0ed3 : 05 11 __ ORA P4 ; (ly + 0)
0ed5 : aa __ __ TAX
0ed6 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0ed9 : a0 14 __ LDY #$14
0edb : 91 0d __ STA (P0),y ; (dp + 0)
0edd : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0ee0 : c8 __ __ INY
0ee1 : 91 0d __ STA (P0),y ; (dp + 0)
0ee3 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0ee6 : c8 __ __ INY
0ee7 : 91 0d __ STA (P0),y ; (dp + 0)
0ee9 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0eec : c8 __ __ INY
0eed : 91 0d __ STA (P0),y ; (dp + 0)
0eef : a0 06 __ LDY #$06
0ef1 : b1 0f __ LDA (P2),y ; (grid + 0)
0ef3 : 05 11 __ ORA P4 ; (ly + 0)
0ef5 : aa __ __ TAX
0ef6 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0ef9 : a0 18 __ LDY #$18
0efb : 91 0d __ STA (P0),y ; (dp + 0)
0efd : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0f00 : c8 __ __ INY
0f01 : 91 0d __ STA (P0),y ; (dp + 0)
0f03 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0f06 : c8 __ __ INY
0f07 : 91 0d __ STA (P0),y ; (dp + 0)
0f09 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0f0c : c8 __ __ INY
0f0d : 91 0d __ STA (P0),y ; (dp + 0)
0f0f : a0 07 __ LDY #$07
0f11 : b1 0f __ LDA (P2),y ; (grid + 0)
0f13 : 05 11 __ ORA P4 ; (ly + 0)
0f15 : aa __ __ TAX
0f16 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0f19 : a0 1c __ LDY #$1c
0f1b : 91 0d __ STA (P0),y ; (dp + 0)
0f1d : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0f20 : c8 __ __ INY
0f21 : 91 0d __ STA (P0),y ; (dp + 0)
0f23 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0f26 : c8 __ __ INY
0f27 : 91 0d __ STA (P0),y ; (dp + 0)
0f29 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0f2c : c8 __ __ INY
0f2d : 91 0d __ STA (P0),y ; (dp + 0)
0f2f : a0 08 __ LDY #$08
0f31 : b1 0f __ LDA (P2),y ; (grid + 0)
0f33 : 05 11 __ ORA P4 ; (ly + 0)
0f35 : aa __ __ TAX
0f36 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0f39 : a0 20 __ LDY #$20
0f3b : 91 0d __ STA (P0),y ; (dp + 0)
0f3d : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0f40 : c8 __ __ INY
0f41 : 91 0d __ STA (P0),y ; (dp + 0)
0f43 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0f46 : c8 __ __ INY
0f47 : 91 0d __ STA (P0),y ; (dp + 0)
0f49 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0f4c : c8 __ __ INY
0f4d : 91 0d __ STA (P0),y ; (dp + 0)
0f4f : a0 09 __ LDY #$09
0f51 : b1 0f __ LDA (P2),y ; (grid + 0)
0f53 : 05 11 __ ORA P4 ; (ly + 0)
0f55 : aa __ __ TAX
0f56 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0f59 : a0 24 __ LDY #$24
0f5b : 91 0d __ STA (P0),y ; (dp + 0)
0f5d : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0f60 : c8 __ __ INY
0f61 : 91 0d __ STA (P0),y ; (dp + 0)
0f63 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0f66 : c8 __ __ INY
0f67 : 91 0d __ STA (P0),y ; (dp + 0)
0f69 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0f6c : c8 __ __ INY
0f6d : 91 0d __ STA (P0),y ; (dp + 0)
.s3:
0f6f : 60 __ __ RTS
--------------------------------------------------------------------
expandrow1: ; expandrow1(u8*,const u8*,u8)->void
;  63, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/grid2d.c"
.s4:
0f70 : a5 11 __ LDA P4 ; (ly + 0)
0f72 : a0 00 __ LDY #$00
0f74 : 11 0f __ ORA (P2),y ; (grid + 0)
0f76 : aa __ __ TAX
0f77 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0f7a : 91 0d __ STA (P0),y ; (dp + 0)
0f7c : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0f7f : c8 __ __ INY
0f80 : 91 0d __ STA (P0),y ; (dp + 0)
0f82 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0f85 : c8 __ __ INY
0f86 : 91 0d __ STA (P0),y ; (dp + 0)
0f88 : 88 __ __ DEY
0f89 : b1 0f __ LDA (P2),y ; (grid + 0)
0f8b : 05 11 __ ORA P4 ; (ly + 0)
0f8d : aa __ __ TAX
0f8e : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0f91 : a0 03 __ LDY #$03
0f93 : 91 0d __ STA (P0),y ; (dp + 0)
0f95 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0f98 : c8 __ __ INY
0f99 : 91 0d __ STA (P0),y ; (dp + 0)
0f9b : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0f9e : c8 __ __ INY
0f9f : 91 0d __ STA (P0),y ; (dp + 0)
0fa1 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0fa4 : c8 __ __ INY
0fa5 : 91 0d __ STA (P0),y ; (dp + 0)
0fa7 : a0 02 __ LDY #$02
0fa9 : b1 0f __ LDA (P2),y ; (grid + 0)
0fab : 05 11 __ ORA P4 ; (ly + 0)
0fad : aa __ __ TAX
0fae : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0fb1 : a0 07 __ LDY #$07
0fb3 : 91 0d __ STA (P0),y ; (dp + 0)
0fb5 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0fb8 : c8 __ __ INY
0fb9 : 91 0d __ STA (P0),y ; (dp + 0)
0fbb : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0fbe : c8 __ __ INY
0fbf : 91 0d __ STA (P0),y ; (dp + 0)
0fc1 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0fc4 : c8 __ __ INY
0fc5 : 91 0d __ STA (P0),y ; (dp + 0)
0fc7 : a0 03 __ LDY #$03
0fc9 : b1 0f __ LDA (P2),y ; (grid + 0)
0fcb : 05 11 __ ORA P4 ; (ly + 0)
0fcd : aa __ __ TAX
0fce : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0fd1 : a0 0b __ LDY #$0b
0fd3 : 91 0d __ STA (P0),y ; (dp + 0)
0fd5 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0fd8 : c8 __ __ INY
0fd9 : 91 0d __ STA (P0),y ; (dp + 0)
0fdb : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0fde : c8 __ __ INY
0fdf : 91 0d __ STA (P0),y ; (dp + 0)
0fe1 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
0fe4 : c8 __ __ INY
0fe5 : 91 0d __ STA (P0),y ; (dp + 0)
0fe7 : a0 04 __ LDY #$04
0fe9 : b1 0f __ LDA (P2),y ; (grid + 0)
0feb : 05 11 __ ORA P4 ; (ly + 0)
0fed : aa __ __ TAX
0fee : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0ff1 : a0 0f __ LDY #$0f
0ff3 : 91 0d __ STA (P0),y ; (dp + 0)
0ff5 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
0ff8 : c8 __ __ INY
0ff9 : 91 0d __ STA (P0),y ; (dp + 0)
0ffb : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
0ffe : c8 __ __ INY
0fff : 91 0d __ STA (P0),y ; (dp + 0)
1001 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1004 : c8 __ __ INY
1005 : 91 0d __ STA (P0),y ; (dp + 0)
1007 : a0 05 __ LDY #$05
1009 : b1 0f __ LDA (P2),y ; (grid + 0)
100b : 05 11 __ ORA P4 ; (ly + 0)
100d : aa __ __ TAX
100e : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
1011 : a0 13 __ LDY #$13
1013 : 91 0d __ STA (P0),y ; (dp + 0)
1015 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1018 : c8 __ __ INY
1019 : 91 0d __ STA (P0),y ; (dp + 0)
101b : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
101e : c8 __ __ INY
101f : 91 0d __ STA (P0),y ; (dp + 0)
1021 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1024 : c8 __ __ INY
1025 : 91 0d __ STA (P0),y ; (dp + 0)
1027 : a0 06 __ LDY #$06
1029 : b1 0f __ LDA (P2),y ; (grid + 0)
102b : 05 11 __ ORA P4 ; (ly + 0)
102d : aa __ __ TAX
102e : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
1031 : a0 17 __ LDY #$17
1033 : 91 0d __ STA (P0),y ; (dp + 0)
1035 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1038 : c8 __ __ INY
1039 : 91 0d __ STA (P0),y ; (dp + 0)
103b : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
103e : c8 __ __ INY
103f : 91 0d __ STA (P0),y ; (dp + 0)
1041 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1044 : c8 __ __ INY
1045 : 91 0d __ STA (P0),y ; (dp + 0)
1047 : a0 07 __ LDY #$07
1049 : b1 0f __ LDA (P2),y ; (grid + 0)
104b : 05 11 __ ORA P4 ; (ly + 0)
104d : aa __ __ TAX
104e : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
1051 : a0 1b __ LDY #$1b
1053 : 91 0d __ STA (P0),y ; (dp + 0)
1055 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1058 : c8 __ __ INY
1059 : 91 0d __ STA (P0),y ; (dp + 0)
105b : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
105e : c8 __ __ INY
105f : 91 0d __ STA (P0),y ; (dp + 0)
1061 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1064 : c8 __ __ INY
1065 : 91 0d __ STA (P0),y ; (dp + 0)
1067 : a0 08 __ LDY #$08
1069 : b1 0f __ LDA (P2),y ; (grid + 0)
106b : 05 11 __ ORA P4 ; (ly + 0)
106d : aa __ __ TAX
106e : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
1071 : a0 1f __ LDY #$1f
1073 : 91 0d __ STA (P0),y ; (dp + 0)
1075 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1078 : c8 __ __ INY
1079 : 91 0d __ STA (P0),y ; (dp + 0)
107b : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
107e : c8 __ __ INY
107f : 91 0d __ STA (P0),y ; (dp + 0)
1081 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1084 : c8 __ __ INY
1085 : 91 0d __ STA (P0),y ; (dp + 0)
1087 : a0 09 __ LDY #$09
1089 : b1 0f __ LDA (P2),y ; (grid + 0)
108b : 05 11 __ ORA P4 ; (ly + 0)
108d : aa __ __ TAX
108e : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
1091 : a0 23 __ LDY #$23
1093 : 91 0d __ STA (P0),y ; (dp + 0)
1095 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1098 : c8 __ __ INY
1099 : 91 0d __ STA (P0),y ; (dp + 0)
109b : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
109e : c8 __ __ INY
109f : 91 0d __ STA (P0),y ; (dp + 0)
10a1 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
10a4 : c8 __ __ INY
10a5 : 91 0d __ STA (P0),y ; (dp + 0)
10a7 : a0 0a __ LDY #$0a
10a9 : b1 0f __ LDA (P2),y ; (grid + 0)
10ab : 05 11 __ ORA P4 ; (ly + 0)
10ad : aa __ __ TAX
10ae : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
10b1 : a0 27 __ LDY #$27
10b3 : 91 0d __ STA (P0),y ; (dp + 0)
.s3:
10b5 : 60 __ __ RTS
--------------------------------------------------------------------
expandrow2: ; expandrow2(u8*,const u8*,u8)->void
;  85, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/grid2d.c"
.s4:
10b6 : a5 11 __ LDA P4 ; (ly + 0)
10b8 : a0 00 __ LDY #$00
10ba : 11 0f __ ORA (P2),y ; (grid + 0)
10bc : aa __ __ TAX
10bd : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
10c0 : 91 0d __ STA (P0),y ; (dp + 0)
10c2 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
10c5 : c8 __ __ INY
10c6 : 91 0d __ STA (P0),y ; (dp + 0)
10c8 : b1 0f __ LDA (P2),y ; (grid + 0)
10ca : 05 11 __ ORA P4 ; (ly + 0)
10cc : aa __ __ TAX
10cd : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
10d0 : c8 __ __ INY
10d1 : 91 0d __ STA (P0),y ; (dp + 0)
10d3 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
10d6 : c8 __ __ INY
10d7 : 91 0d __ STA (P0),y ; (dp + 0)
10d9 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
10dc : c8 __ __ INY
10dd : 91 0d __ STA (P0),y ; (dp + 0)
10df : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
10e2 : c8 __ __ INY
10e3 : 91 0d __ STA (P0),y ; (dp + 0)
10e5 : a0 02 __ LDY #$02
10e7 : b1 0f __ LDA (P2),y ; (grid + 0)
10e9 : 05 11 __ ORA P4 ; (ly + 0)
10eb : aa __ __ TAX
10ec : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
10ef : a0 06 __ LDY #$06
10f1 : 91 0d __ STA (P0),y ; (dp + 0)
10f3 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
10f6 : c8 __ __ INY
10f7 : 91 0d __ STA (P0),y ; (dp + 0)
10f9 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
10fc : c8 __ __ INY
10fd : 91 0d __ STA (P0),y ; (dp + 0)
10ff : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1102 : c8 __ __ INY
1103 : 91 0d __ STA (P0),y ; (dp + 0)
1105 : a0 03 __ LDY #$03
1107 : b1 0f __ LDA (P2),y ; (grid + 0)
1109 : 05 11 __ ORA P4 ; (ly + 0)
110b : aa __ __ TAX
110c : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
110f : a0 0a __ LDY #$0a
1111 : 91 0d __ STA (P0),y ; (dp + 0)
1113 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1116 : c8 __ __ INY
1117 : 91 0d __ STA (P0),y ; (dp + 0)
1119 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
111c : c8 __ __ INY
111d : 91 0d __ STA (P0),y ; (dp + 0)
111f : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1122 : c8 __ __ INY
1123 : 91 0d __ STA (P0),y ; (dp + 0)
1125 : a0 04 __ LDY #$04
1127 : b1 0f __ LDA (P2),y ; (grid + 0)
1129 : 05 11 __ ORA P4 ; (ly + 0)
112b : aa __ __ TAX
112c : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
112f : a0 0e __ LDY #$0e
1131 : 91 0d __ STA (P0),y ; (dp + 0)
1133 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1136 : c8 __ __ INY
1137 : 91 0d __ STA (P0),y ; (dp + 0)
1139 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
113c : c8 __ __ INY
113d : 91 0d __ STA (P0),y ; (dp + 0)
113f : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1142 : c8 __ __ INY
1143 : 91 0d __ STA (P0),y ; (dp + 0)
1145 : a0 05 __ LDY #$05
1147 : b1 0f __ LDA (P2),y ; (grid + 0)
1149 : 05 11 __ ORA P4 ; (ly + 0)
114b : aa __ __ TAX
114c : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
114f : a0 12 __ LDY #$12
1151 : 91 0d __ STA (P0),y ; (dp + 0)
1153 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1156 : c8 __ __ INY
1157 : 91 0d __ STA (P0),y ; (dp + 0)
1159 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
115c : c8 __ __ INY
115d : 91 0d __ STA (P0),y ; (dp + 0)
115f : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1162 : c8 __ __ INY
1163 : 91 0d __ STA (P0),y ; (dp + 0)
1165 : a0 06 __ LDY #$06
1167 : b1 0f __ LDA (P2),y ; (grid + 0)
1169 : 05 11 __ ORA P4 ; (ly + 0)
116b : aa __ __ TAX
116c : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
116f : a0 16 __ LDY #$16
1171 : 91 0d __ STA (P0),y ; (dp + 0)
1173 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1176 : c8 __ __ INY
1177 : 91 0d __ STA (P0),y ; (dp + 0)
1179 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
117c : c8 __ __ INY
117d : 91 0d __ STA (P0),y ; (dp + 0)
117f : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1182 : c8 __ __ INY
1183 : 91 0d __ STA (P0),y ; (dp + 0)
1185 : a0 07 __ LDY #$07
1187 : b1 0f __ LDA (P2),y ; (grid + 0)
1189 : 05 11 __ ORA P4 ; (ly + 0)
118b : aa __ __ TAX
118c : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
118f : a0 1a __ LDY #$1a
1191 : 91 0d __ STA (P0),y ; (dp + 0)
1193 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1196 : c8 __ __ INY
1197 : 91 0d __ STA (P0),y ; (dp + 0)
1199 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
119c : c8 __ __ INY
119d : 91 0d __ STA (P0),y ; (dp + 0)
119f : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
11a2 : c8 __ __ INY
11a3 : 91 0d __ STA (P0),y ; (dp + 0)
11a5 : a0 08 __ LDY #$08
11a7 : b1 0f __ LDA (P2),y ; (grid + 0)
11a9 : 05 11 __ ORA P4 ; (ly + 0)
11ab : aa __ __ TAX
11ac : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
11af : a0 1e __ LDY #$1e
11b1 : 91 0d __ STA (P0),y ; (dp + 0)
11b3 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
11b6 : c8 __ __ INY
11b7 : 91 0d __ STA (P0),y ; (dp + 0)
11b9 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
11bc : c8 __ __ INY
11bd : 91 0d __ STA (P0),y ; (dp + 0)
11bf : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
11c2 : c8 __ __ INY
11c3 : 91 0d __ STA (P0),y ; (dp + 0)
11c5 : a0 09 __ LDY #$09
11c7 : b1 0f __ LDA (P2),y ; (grid + 0)
11c9 : 05 11 __ ORA P4 ; (ly + 0)
11cb : aa __ __ TAX
11cc : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
11cf : a0 22 __ LDY #$22
11d1 : 91 0d __ STA (P0),y ; (dp + 0)
11d3 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
11d6 : c8 __ __ INY
11d7 : 91 0d __ STA (P0),y ; (dp + 0)
11d9 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
11dc : c8 __ __ INY
11dd : 91 0d __ STA (P0),y ; (dp + 0)
11df : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
11e2 : c8 __ __ INY
11e3 : 91 0d __ STA (P0),y ; (dp + 0)
11e5 : a0 0a __ LDY #$0a
11e7 : b1 0f __ LDA (P2),y ; (grid + 0)
11e9 : 05 11 __ ORA P4 ; (ly + 0)
11eb : aa __ __ TAX
11ec : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
11ef : a0 26 __ LDY #$26
11f1 : 91 0d __ STA (P0),y ; (dp + 0)
11f3 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
11f6 : c8 __ __ INY
11f7 : 91 0d __ STA (P0),y ; (dp + 0)
.s3:
11f9 : 60 __ __ RTS
--------------------------------------------------------------------
expandrow3: ; expandrow3(u8*,const u8*,u8)->void
; 107, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/grid2d.c"
.s4:
11fa : a5 11 __ LDA P4 ; (ly + 0)
11fc : a0 00 __ LDY #$00
11fe : 11 0f __ ORA (P2),y ; (grid + 0)
1200 : aa __ __ TAX
1201 : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1204 : 91 0d __ STA (P0),y ; (dp + 0)
1206 : c8 __ __ INY
1207 : b1 0f __ LDA (P2),y ; (grid + 0)
1209 : 05 11 __ ORA P4 ; (ly + 0)
120b : aa __ __ TAX
120c : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
120f : 91 0d __ STA (P0),y ; (dp + 0)
1211 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1214 : c8 __ __ INY
1215 : 91 0d __ STA (P0),y ; (dp + 0)
1217 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
121a : c8 __ __ INY
121b : 91 0d __ STA (P0),y ; (dp + 0)
121d : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1220 : c8 __ __ INY
1221 : 91 0d __ STA (P0),y ; (dp + 0)
1223 : a0 02 __ LDY #$02
1225 : b1 0f __ LDA (P2),y ; (grid + 0)
1227 : 05 11 __ ORA P4 ; (ly + 0)
1229 : aa __ __ TAX
122a : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
122d : a0 05 __ LDY #$05
122f : 91 0d __ STA (P0),y ; (dp + 0)
1231 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1234 : c8 __ __ INY
1235 : 91 0d __ STA (P0),y ; (dp + 0)
1237 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
123a : c8 __ __ INY
123b : 91 0d __ STA (P0),y ; (dp + 0)
123d : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1240 : c8 __ __ INY
1241 : 91 0d __ STA (P0),y ; (dp + 0)
1243 : a0 03 __ LDY #$03
1245 : b1 0f __ LDA (P2),y ; (grid + 0)
1247 : 05 11 __ ORA P4 ; (ly + 0)
1249 : aa __ __ TAX
124a : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
124d : a0 09 __ LDY #$09
124f : 91 0d __ STA (P0),y ; (dp + 0)
1251 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1254 : c8 __ __ INY
1255 : 91 0d __ STA (P0),y ; (dp + 0)
1257 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
125a : c8 __ __ INY
125b : 91 0d __ STA (P0),y ; (dp + 0)
125d : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1260 : c8 __ __ INY
1261 : 91 0d __ STA (P0),y ; (dp + 0)
1263 : a0 04 __ LDY #$04
1265 : b1 0f __ LDA (P2),y ; (grid + 0)
1267 : 05 11 __ ORA P4 ; (ly + 0)
1269 : aa __ __ TAX
126a : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
126d : a0 0d __ LDY #$0d
126f : 91 0d __ STA (P0),y ; (dp + 0)
1271 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1274 : c8 __ __ INY
1275 : 91 0d __ STA (P0),y ; (dp + 0)
1277 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
127a : c8 __ __ INY
127b : 91 0d __ STA (P0),y ; (dp + 0)
127d : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1280 : c8 __ __ INY
1281 : 91 0d __ STA (P0),y ; (dp + 0)
1283 : a0 05 __ LDY #$05
1285 : b1 0f __ LDA (P2),y ; (grid + 0)
1287 : 05 11 __ ORA P4 ; (ly + 0)
1289 : aa __ __ TAX
128a : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
128d : a0 11 __ LDY #$11
128f : 91 0d __ STA (P0),y ; (dp + 0)
1291 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1294 : c8 __ __ INY
1295 : 91 0d __ STA (P0),y ; (dp + 0)
1297 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
129a : c8 __ __ INY
129b : 91 0d __ STA (P0),y ; (dp + 0)
129d : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
12a0 : c8 __ __ INY
12a1 : 91 0d __ STA (P0),y ; (dp + 0)
12a3 : a0 06 __ LDY #$06
12a5 : b1 0f __ LDA (P2),y ; (grid + 0)
12a7 : 05 11 __ ORA P4 ; (ly + 0)
12a9 : aa __ __ TAX
12aa : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
12ad : a0 15 __ LDY #$15
12af : 91 0d __ STA (P0),y ; (dp + 0)
12b1 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
12b4 : c8 __ __ INY
12b5 : 91 0d __ STA (P0),y ; (dp + 0)
12b7 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
12ba : c8 __ __ INY
12bb : 91 0d __ STA (P0),y ; (dp + 0)
12bd : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
12c0 : c8 __ __ INY
12c1 : 91 0d __ STA (P0),y ; (dp + 0)
12c3 : a0 07 __ LDY #$07
12c5 : b1 0f __ LDA (P2),y ; (grid + 0)
12c7 : 05 11 __ ORA P4 ; (ly + 0)
12c9 : aa __ __ TAX
12ca : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
12cd : a0 19 __ LDY #$19
12cf : 91 0d __ STA (P0),y ; (dp + 0)
12d1 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
12d4 : c8 __ __ INY
12d5 : 91 0d __ STA (P0),y ; (dp + 0)
12d7 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
12da : c8 __ __ INY
12db : 91 0d __ STA (P0),y ; (dp + 0)
12dd : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
12e0 : c8 __ __ INY
12e1 : 91 0d __ STA (P0),y ; (dp + 0)
12e3 : a0 08 __ LDY #$08
12e5 : b1 0f __ LDA (P2),y ; (grid + 0)
12e7 : 05 11 __ ORA P4 ; (ly + 0)
12e9 : aa __ __ TAX
12ea : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
12ed : a0 1d __ LDY #$1d
12ef : 91 0d __ STA (P0),y ; (dp + 0)
12f1 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
12f4 : c8 __ __ INY
12f5 : 91 0d __ STA (P0),y ; (dp + 0)
12f7 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
12fa : c8 __ __ INY
12fb : 91 0d __ STA (P0),y ; (dp + 0)
12fd : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1300 : c8 __ __ INY
1301 : 91 0d __ STA (P0),y ; (dp + 0)
1303 : a0 09 __ LDY #$09
1305 : b1 0f __ LDA (P2),y ; (grid + 0)
1307 : 05 11 __ ORA P4 ; (ly + 0)
1309 : aa __ __ TAX
130a : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
130d : a0 21 __ LDY #$21
130f : 91 0d __ STA (P0),y ; (dp + 0)
1311 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1314 : c8 __ __ INY
1315 : 91 0d __ STA (P0),y ; (dp + 0)
1317 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
131a : c8 __ __ INY
131b : 91 0d __ STA (P0),y ; (dp + 0)
131d : bd 30 14 LDA $1430,x ; (quad[0][0] + 48)
1320 : c8 __ __ INY
1321 : 91 0d __ STA (P0),y ; (dp + 0)
1323 : a0 0a __ LDY #$0a
1325 : b1 0f __ LDA (P2),y ; (grid + 0)
1327 : 05 11 __ ORA P4 ; (ly + 0)
1329 : aa __ __ TAX
132a : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
132d : a0 25 __ LDY #$25
132f : 91 0d __ STA (P0),y ; (dp + 0)
1331 : bd 10 14 LDA $1410,x ; (quad[0][0] + 16)
1334 : c8 __ __ INY
1335 : 91 0d __ STA (P0),y ; (dp + 0)
1337 : bd 20 14 LDA $1420,x ; (quad[0][0] + 32)
133a : c8 __ __ INY
133b : 91 0d __ STA (P0),y ; (dp + 0)
.s3:
133d : 60 __ __ RTS
--------------------------------------------------------------------
rasterIRQNext:
133e : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQLow:
134f : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
135f : __ __ __ BSS	16
--------------------------------------------------------------------
blank:
136f : __ __ __ BSS	32
--------------------------------------------------------------------
scroll:
138f : __ __ __ BSS	32
--------------------------------------------------------------------
bottom:
13af : __ __ __ BSS	32
--------------------------------------------------------------------
quad:
1400 : __ __ __ BYT 20 55 6c 4e 20 5d e1 65 20 5d e1 65 20 4a 7c 4d :  UlN ].e ].e J|M
1410 : __ __ __ BYT 20 40 62 77 20 20 a0 20 20 20 a0 20 20 40 e2 6f :  @bw  .   .  @.o
1420 : __ __ __ BYT 20 40 62 77 20 20 a0 20 20 20 a0 20 20 40 e2 6f :  @bw  .   .  @.o
1430 : __ __ __ BYT 20 49 7b 4d 20 5d 61 6a 20 5d 61 6a 20 4b 7e 4e :  I{M ]aj ]aj K~N
--------------------------------------------------------------------
grid:
1500 : __ __ __ BSS	1024
