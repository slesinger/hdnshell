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
080e : 8e ff 0b STX $0bff ; (spentry + 0)
0811 : a2 46 __ LDX #$46
0813 : a0 38 __ LDY #$38
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 4f __ CPX #$4f
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 7e __ CPY #$7e
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 f3 __ LDA #$f3
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
;1093, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s1:
0880 : a5 53 __ LDA T2 + 0 
0882 : 8d f5 9f STA $9ff5 ; (main@stack + 0)
0885 : 38 __ __ SEC
0886 : a5 23 __ LDA SP + 0 
0888 : e9 03 __ SBC #$03
088a : 85 23 __ STA SP + 0 
088c : b0 02 __ BCS $0890 ; (main.s4 + 0)
088e : c6 24 __ DEC SP + 1 
.s4:
0890 : a9 7f __ LDA #$7f
0892 : 8d 0d dc STA $dc0d 
0895 : 8d 0d dd STA $dd0d 
0898 : 8d 00 dc STA $dc00 
089b : a9 08 __ LDA #$08
089d : 85 12 __ STA P5 
089f : 8d 0e dc STA $dc0e 
08a2 : 8d 0f dc STA $dc0f 
08a5 : 8d 0e dd STA $dd0e 
08a8 : 8d 0f dd STA $dd0f 
08ab : a9 00 __ LDA #$00
08ad : 8d 03 dc STA $dc03 
08b0 : 8d 03 dd STA $dd03 
08b3 : a9 ff __ LDA #$ff
08b5 : 8d 02 dc STA $dc02 
08b8 : a9 07 __ LDA #$07
08ba : 8d 00 dd STA $dd00 
08bd : a9 3f __ LDA #$3f
08bf : 8d 02 dd STA $dd02 
08c2 : a9 94 __ LDA #$94
08c4 : 8d fa ff STA $fffa 
08c7 : a9 0a __ LDA #$0a
08c9 : 8d fb ff STA $fffb 
08cc : a9 b2 __ LDA #$b2
08ce : 8d fe ff STA $fffe 
08d1 : a9 0a __ LDA #$0a
08d3 : 8d ff ff STA $ffff 
08d6 : ad 0d dc LDA $dc0d 
08d9 : ad 0d dd LDA $dd0d 
08dc : a9 00 __ LDA #$00
08de : 85 11 __ STA P4 
08e0 : 85 0d __ STA P0 
08e2 : a9 30 __ LDA #$30
08e4 : 85 01 __ STA $01 
08e6 : a9 e0 __ LDA #$e0
08e8 : 85 0e __ STA P1 
08ea : a9 1e __ LDA #$1e
08ec : 85 10 __ STA P3 
08ee : a9 da __ LDA #$da
08f0 : 85 0f __ STA P2 
08f2 : 20 c9 0a JSR $0ac9 ; (memcpy.s4 + 0)
08f5 : a9 00 __ LDA #$00
08f7 : 85 11 __ STA P4 
08f9 : 85 0d __ STA P0 
08fb : a9 08 __ LDA #$08
08fd : 85 12 __ STA P5 
08ff : a9 26 __ LDA #$26
0901 : 85 10 __ STA P3 
0903 : a9 e8 __ LDA #$e8
0905 : 85 0e __ STA P1 
0907 : a9 da __ LDA #$da
0909 : 85 0f __ STA P2 
090b : 20 c9 0a JSR $0ac9 ; (memcpy.s4 + 0)
090e : a9 ff __ LDA #$ff
0910 : 8d c0 e7 STA $e7c0 
0913 : 8d c1 e7 STA $e7c1 
0916 : 8d c2 e7 STA $e7c2 
0919 : 8d c3 e7 STA $e7c3 
091c : 8d c4 e7 STA $e7c4 
091f : 8d c5 e7 STA $e7c5 
0922 : 8d c6 e7 STA $e7c6 
0925 : 8d c7 e7 STA $e7c7 
0928 : a9 10 __ LDA #$10
092a : 85 12 __ STA P5 
092c : a9 00 __ LDA #$00
092e : 85 11 __ STA P4 
0930 : 85 0d __ STA P0 
0932 : a9 d0 __ LDA #$d0
0934 : 85 0e __ STA P1 
0936 : a9 2e __ LDA #$2e
0938 : 85 10 __ STA P3 
093a : a9 da __ LDA #$da
093c : 85 0f __ STA P2 
093e : 20 c9 0a JSR $0ac9 ; (memcpy.s4 + 0)
0941 : a9 35 __ LDA #$35
0943 : 85 01 __ STA $01 
0945 : 20 f0 0a JSR $0af0 ; (tiles_unpack.s4 + 0)
0948 : 20 8d 0b JSR $0b8d ; (vic_setmode.s4 + 0)
094b : a9 f8 __ LDA #$f8
094d : 8d cb 45 STA $45cb ; (vspriteScreen + 0)
0950 : a9 cb __ LDA #$cb
0952 : 8d cc 45 STA $45cc ; (vspriteScreen + 1)
0955 : 20 a5 0b JSR $0ba5 ; (rirq_init_kernal.s4 + 0)
0958 : a9 04 __ LDA #$04
095a : 85 0f __ STA P2 
095c : a9 4d __ LDA #$4d
095e : 85 0e __ STA P1 
0960 : a9 30 __ LDA #$30
0962 : 85 0d __ STA P0 
0964 : 20 5d 0c JSR $0c5d ; (rirq_build.s4 + 0)
0967 : c6 0f __ DEC P2 
0969 : a9 d0 __ LDA #$d0
096b : 8d 3c 4d STA $4d3c ; (top.code[0] + 11)
096e : 8d 3f 4d STA $4d3f ; (top.code[0] + 14)
0971 : 8d 49 4d STA $4d49 ; (top.code[0] + 24)
0974 : a9 3a __ LDA #$3a
0976 : 8d cd 45 STA $45cd ; (rasterIRQRows[0] + 0)
0979 : a9 28 __ LDA #$28
097b : 8d 32 4d STA $4d32 ; (top.code[0] + 1)
097e : a9 10 __ LDA #$10
0980 : 8d 34 4d STA $4d34 ; (top.code[0] + 3)
0983 : a9 18 __ LDA #$18
0985 : 8d 3b 4d STA $4d3b ; (top.code[0] + 10)
0988 : a9 16 __ LDA #$16
098a : 8d 3e 4d STA $4d3e ; (top.code[0] + 13)
098d : a9 ff __ LDA #$ff
098f : 8d 41 4d STA $4d41 ; (top.code[0] + 16)
0992 : a9 c2 __ LDA #$c2
0994 : 8d 43 4d STA $4d43 ; (top.code[0] + 18)
0997 : a9 e7 __ LDA #$e7
0999 : 8d 44 4d STA $4d44 ; (top.code[0] + 19)
099c : a9 01 __ LDA #$01
099e : 8d 46 4d STA $4d46 ; (top.code[0] + 21)
09a1 : a9 21 __ LDA #$21
09a3 : 8d 48 4d STA $4d48 ; (top.code[0] + 23)
09a6 : a9 31 __ LDA #$31
09a8 : 8d 10 4d STA $4d10 ; (rasterIRQLow[0] + 0)
09ab : a9 4d __ LDA #$4d
09ad : 8d 20 4d STA $4d20 ; (rasterIRQHigh[0] + 0)
09b0 : a9 50 __ LDA #$50
09b2 : 85 0d __ STA P0 
09b4 : a9 4d __ LDA #$4d
09b6 : 85 0e __ STA P1 
09b8 : 20 5d 0c JSR $0c5d ; (rirq_build.s4 + 0)
09bb : a9 d0 __ LDA #$d0
09bd : 8d 5c 4d STA $4d5c ; (bottom.code[0] + 11)
09c0 : 8d 5f 4d STA $4d5f ; (bottom.code[0] + 14)
09c3 : 8d 64 4d STA $4d64 ; (bottom.code[0] + 19)
09c6 : a9 fa __ LDA #$fa
09c8 : 8d ce 45 STA $45ce ; (rasterIRQRows[0] + 1)
09cb : a9 2a __ LDA #$2a
09cd : 8d 52 4d STA $4d52 ; (bottom.code[0] + 1)
09d0 : a9 00 __ LDA #$00
09d2 : 8d 54 4d STA $4d54 ; (bottom.code[0] + 3)
09d5 : a9 18 __ LDA #$18
09d7 : 8d 5b 4d STA $4d5b ; (bottom.code[0] + 10)
09da : a9 16 __ LDA #$16
09dc : 8d 5e 4d STA $4d5e ; (bottom.code[0] + 13)
09df : a9 07 __ LDA #$07
09e1 : 8d 61 4d STA $4d61 ; (bottom.code[0] + 16)
09e4 : a9 21 __ LDA #$21
09e6 : 8d 63 4d STA $4d63 ; (bottom.code[0] + 18)
09e9 : a9 51 __ LDA #$51
09eb : 8d 11 4d STA $4d11 ; (rasterIRQLow[0] + 1)
09ee : a9 4d __ LDA #$4d
09f0 : 8d 21 4d STA $4d21 ; (rasterIRQHigh[0] + 1)
09f3 : 20 de 0c JSR $0cde ; (rirq_sort.s4 + 0)
09f6 : 20 e4 0b JSR $0be4 ; (rirq_start.s4 + 0)
09f9 : a9 00 __ LDA #$00
09fb : 8d 20 d0 STA $d020 
09fe : a9 01 __ LDA #$01
0a00 : 8d 21 d0 STA $d021 
0a03 : a9 0f __ LDA #$0f
0a05 : 8d 22 d0 STA $d022 
0a08 : a9 0c __ LDA #$0c
0a0a : 8d 23 d0 STA $d023 
0a0d : a9 0b __ LDA #$0b
0a0f : 8d 25 d0 STA $d025 
0a12 : a9 01 __ LDA #$01
0a14 : 8d 26 d0 STA $d026 
0a17 : a9 00 __ LDA #$00
0a19 : a2 fa __ LDX #$fa
.l6:
0a1b : ca __ __ DEX
0a1c : 9d 00 c8 STA $c800,x 
0a1f : 9d fa c8 STA $c8fa,x 
0a22 : 9d f4 c9 STA $c9f4,x 
0a25 : 9d ee ca STA $caee,x 
0a28 : d0 f1 __ BNE $0a1b ; (main.l6 + 0)
.s5:
0a2a : a2 50 __ LDX #$50
.l7:
0a2c : ca __ __ DEX
0a2d : 9d 00 d8 STA $d800,x 
0a30 : d0 fa __ BNE $0a2c ; (main.l7 + 0)
.s8:
0a32 : a9 08 __ LDA #$08
0a34 : a2 e6 __ LDX #$e6
.l10:
0a36 : ca __ __ DEX
0a37 : 9d 50 d8 STA $d850,x 
0a3a : 9d 36 d9 STA $d936,x 
0a3d : 9d 1c da STA $da1c,x 
0a40 : 9d 02 db STA $db02,x 
0a43 : d0 f1 __ BNE $0a36 ; (main.l10 + 0)
.s9:
0a45 : 20 5e 0d JSR $0d5e ; (sidfx_init.s4 + 0)
0a48 : a9 0f __ LDA #$0f
0a4a : 8d 18 d4 STA $d418 
0a4d : 20 90 0d JSR $0d90 ; (status_init.s4 + 0)
0a50 : a9 00 __ LDA #$00
0a52 : 85 53 __ STA T2 + 0 
.l11:
0a54 : 20 9e 0d JSR $0d9e ; (rand.s4 + 0)
0a57 : a9 28 __ LDA #$28
0a59 : 85 03 __ STA WORK + 0 
0a5b : a9 00 __ LDA #$00
0a5d : 85 04 __ STA WORK + 1 
0a5f : 20 52 1e JSR $1e52 ; (divmod + 0)
0a62 : a5 53 __ LDA T2 + 0 
0a64 : 29 03 __ AND #$03
0a66 : aa __ __ TAX
0a67 : bd f6 0b LDA $0bf6,x ; (__multab40L + 0)
0a6a : 18 __ __ CLC
0a6b : 65 05 __ ADC WORK + 2 
0a6d : a6 53 __ LDX T2 + 0 
0a6f : e8 __ __ INX
0a70 : 86 53 __ STX T2 + 0 
0a72 : 9d 8d 4d STA $4d8d,x ; (channels[2].pwm + 0)
0a75 : e0 18 __ CPX #$18
0a77 : 90 db __ BCC $0a54 ; (main.l11 + 0)
.s12:
0a79 : 20 c5 0d JSR $0dc5 ; (shot_init.s4 + 0)
0a7c : 20 04 0e JSR $0e04 ; (game_init.s4 + 0)
0a7f : 20 1f 0e JSR $0e1f ; (player_init.s4 + 0)
0a82 : a9 01 __ LDA #$01
0a84 : a0 02 __ LDY #$02
0a86 : 91 23 __ STA (SP + 0),y 
0a88 : 20 be 0e JSR $0ebe ; (game_state.s1 + 0)
0a8b : 20 98 0f JSR $0f98 ; (game_loop.s1 + 0)
.l13:
0a8e : 20 98 0f JSR $0f98 ; (game_loop.s1 + 0)
0a91 : 4c 8e 0a JMP $0a8e ; (main.l13 + 0)
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0a94 : 48 __ __ PHA
0a95 : 8a __ __ TXA
0a96 : 48 __ __ PHA
0a97 : a9 0a __ LDA #$0a
0a99 : 48 __ __ PHA
0a9a : a9 ab __ LDA #$ab
0a9c : 48 __ __ PHA
0a9d : ba __ __ TSX
0a9e : bd 05 01 LDA $0105,x 
0aa1 : 48 __ __ PHA
0aa2 : a6 01 __ LDX $01 
0aa4 : a9 36 __ LDA #$36
0aa6 : 85 01 __ STA $01 
0aa8 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0aab : 86 01 __ STX $01 
0aad : 68 __ __ PLA
0aae : aa __ __ TAX
0aaf : 68 __ __ PLA
0ab0 : 40 __ __ RTI
0ab1 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0ab2 : 48 __ __ PHA
0ab3 : 8a __ __ TXA
0ab4 : 48 __ __ PHA
0ab5 : a9 0a __ LDA #$0a
0ab7 : 48 __ __ PHA
0ab8 : a9 ab __ LDA #$ab
0aba : 48 __ __ PHA
0abb : ba __ __ TSX
0abc : bd 05 01 LDA $0105,x 
0abf : 48 __ __ PHA
0ac0 : a6 01 __ LDX $01 
0ac2 : a9 36 __ LDA #$36
0ac4 : 85 01 __ STA $01 
0ac6 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0ac9 : a6 12 __ LDX P5 
0acb : f0 10 __ BEQ $0add ; (memcpy.s4 + 20)
0acd : a0 00 __ LDY #$00
0acf : b1 0f __ LDA (P2),y 
0ad1 : 91 0d __ STA (P0),y 
0ad3 : c8 __ __ INY
0ad4 : d0 f9 __ BNE $0acf ; (memcpy.s4 + 6)
0ad6 : e6 10 __ INC P3 
0ad8 : e6 0e __ INC P1 
0ada : ca __ __ DEX
0adb : d0 f2 __ BNE $0acf ; (memcpy.s4 + 6)
0add : a4 11 __ LDY P4 
0adf : f0 0e __ BEQ $0aef ; (memcpy.s3 + 0)
0ae1 : 88 __ __ DEY
0ae2 : f0 07 __ BEQ $0aeb ; (memcpy.s4 + 34)
0ae4 : b1 0f __ LDA (P2),y 
0ae6 : 91 0d __ STA (P0),y 
0ae8 : 88 __ __ DEY
0ae9 : d0 f9 __ BNE $0ae4 ; (memcpy.s4 + 27)
0aeb : b1 0f __ LDA (P2),y 
0aed : 91 0d __ STA (P0),y 
.s3:
0aef : 60 __ __ RTS
--------------------------------------------------------------------
tiles_unpack: ; tiles_unpack()->void
; 254, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
0af0 : a9 00 __ LDA #$00
0af2 : 85 1b __ STA ACCU + 0 
0af4 : a9 da __ LDA #$da
0af6 : 85 43 __ STA T1 + 0 
0af8 : a9 3e __ LDA #$3e
0afa : 85 44 __ STA T1 + 1 
.l5:
0afc : a9 40 __ LDA #$40
0afe : 85 45 __ STA T2 + 0 
0b00 : a9 46 __ LDA #$46
0b02 : 85 46 __ STA T2 + 1 
0b04 : a0 00 __ LDY #$00
0b06 : 18 __ __ CLC
.l13:
0b07 : 84 1c __ STY ACCU + 1 
0b09 : b1 43 __ LDA (T1 + 0),y 
0b0b : a4 1b __ LDY ACCU + 0 
0b0d : 91 45 __ STA (T2 + 0),y 
0b0f : a5 45 __ LDA T2 + 0 
0b11 : 69 40 __ ADC #$40
0b13 : 85 45 __ STA T2 + 0 
0b15 : 90 02 __ BCC $0b19 ; (tiles_unpack.s15 + 0)
.s14:
0b17 : e6 46 __ INC T2 + 1 
.s15:
0b19 : a4 1c __ LDY ACCU + 1 
0b1b : c8 __ __ INY
0b1c : c0 10 __ CPY #$10
0b1e : 90 e7 __ BCC $0b07 ; (tiles_unpack.l13 + 0)
.s6:
0b20 : a5 43 __ LDA T1 + 0 
0b22 : 69 0f __ ADC #$0f
0b24 : 85 43 __ STA T1 + 0 
0b26 : 90 02 __ BCC $0b2a ; (tiles_unpack.s17 + 0)
.s16:
0b28 : e6 44 __ INC T1 + 1 
.s17:
0b2a : e6 1b __ INC ACCU + 0 
0b2c : a5 1b __ LDA ACCU + 0 
0b2e : c9 40 __ CMP #$40
0b30 : d0 ca __ BNE $0afc ; (tiles_unpack.l5 + 0)
.s7:
0b32 : a9 40 __ LDA #$40
0b34 : 85 1b __ STA ACCU + 0 
0b36 : a9 4a __ LDA #$4a
0b38 : 85 1c __ STA ACCU + 1 
0b3a : a9 da __ LDA #$da
0b3c : 85 43 __ STA T1 + 0 
0b3e : a9 42 __ LDA #$42
0b40 : 85 44 __ STA T1 + 1 
.l8:
0b42 : a2 00 __ LDX #$00
0b44 : 86 45 __ STX T2 + 0 
.l9:
0b46 : a5 45 __ LDA T2 + 0 
0b48 : 29 7f __ AND #$7f
0b4a : a8 __ __ TAY
0b4b : b1 43 __ LDA (T1 + 0),y 
0b4d : a4 45 __ LDY T2 + 0 
0b4f : 91 1b __ STA (ACCU + 0),y 
0b51 : c8 __ __ INY
0b52 : 84 45 __ STY T2 + 0 
0b54 : c0 90 __ CPY #$90
0b56 : d0 ee __ BNE $0b46 ; (tiles_unpack.l9 + 0)
.s10:
0b58 : 18 __ __ CLC
0b59 : a5 1b __ LDA ACCU + 0 
0b5b : 69 90 __ ADC #$90
0b5d : 85 1b __ STA ACCU + 0 
0b5f : 90 03 __ BCC $0b64 ; (tiles_unpack.s19 + 0)
.s18:
0b61 : e6 1c __ INC ACCU + 1 
0b63 : 18 __ __ CLC
.s19:
0b64 : a5 43 __ LDA T1 + 0 
0b66 : 69 80 __ ADC #$80
0b68 : 85 43 __ STA T1 + 0 
0b6a : 90 02 __ BCC $0b6e ; (tiles_unpack.s21 + 0)
.s20:
0b6c : e6 44 __ INC T1 + 1 
.s21:
0b6e : c9 5a __ CMP #$5a
0b70 : d0 d0 __ BNE $0b42 ; (tiles_unpack.l8 + 0)
.s12:
0b72 : a5 44 __ LDA T1 + 1 
0b74 : c9 45 __ CMP #$45
0b76 : d0 ca __ BNE $0b42 ; (tiles_unpack.l8 + 0)
.l11:
0b78 : a9 01 __ LDA #$01
0b7a : 9d 00 4e STA $4e00,x ; (xcollision[0] + 0)
0b7d : 9d 01 4e STA $4e01,x ; (xcollision[0] + 1)
0b80 : 9d 02 4e STA $4e02,x ; (xcollision[0] + 2)
0b83 : 8a __ __ TXA
0b84 : 18 __ __ CLC
0b85 : 69 28 __ ADC #$28
0b87 : aa __ __ TAX
0b88 : e0 a0 __ CPX #$a0
0b8a : d0 ec __ BNE $0b78 ; (tiles_unpack.l11 + 0)
.s3:
0b8c : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0b8d : a9 1b __ LDA #$1b
0b8f : 8d 11 d0 STA $d011 
0b92 : a9 18 __ LDA #$18
0b94 : 8d 16 d0 STA $d016 
0b97 : ad 00 dd LDA $dd00 
0b9a : 29 fc __ AND #$fc
0b9c : 8d 00 dd STA $dd00 
0b9f : a9 28 __ LDA #$28
0ba1 : 8d 18 d0 STA $d018 
.s3:
0ba4 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0ba5 : 20 c6 0b JSR $0bc6 ; (rirq_init_tables.s4 + 0)
0ba8 : 78 __ __ SEI
0ba9 : a9 01 __ LDA #$01
0bab : 8d 1a d0 STA $d01a 
0bae : a9 00 __ LDA #$00
0bb0 : 8d 14 03 STA $0314 
0bb3 : a9 0c __ LDA #$0c
0bb5 : 8d 15 03 STA $0315 
0bb8 : ad 11 d0 LDA $d011 
0bbb : 29 7f __ AND #$7f
0bbd : 8d 11 d0 STA $d011 
0bc0 : a9 ff __ LDA #$ff
0bc2 : 8d 12 d0 STA $d012 
.s3:
0bc5 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0bc6 : a2 00 __ LDX #$00
.l5:
0bc8 : a9 ff __ LDA #$ff
0bca : 9d cd 45 STA $45cd,x ; (rasterIRQRows[0] + 0)
0bcd : 8a __ __ TXA
0bce : 9d df 45 STA $45df,x ; (rasterIRQIndex[0] + 1)
0bd1 : e8 __ __ INX
0bd2 : e0 10 __ CPX #$10
0bd4 : d0 f2 __ BNE $0bc8 ; (rirq_init_tables.l5 + 0)
.s6:
0bd6 : 8e de 45 STX $45de ; (rasterIRQIndex[0] + 0)
0bd9 : a9 ff __ LDA #$ff
0bdb : 8d ff 45 STA $45ff ; (rasterIRQNext[0] + 16)
0bde : a9 00 __ LDA #$00
0be0 : 8d dd 45 STA $45dd ; (rasterIRQRows[0] + 16)
.s3:
0be3 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0be4 : ad 11 d0 LDA $d011 
0be7 : 29 7f __ AND #$7f
0be9 : 8d 11 d0 STA $d011 
0bec : a9 64 __ LDA #$64
0bee : 8d 12 d0 STA $d012 
0bf1 : 0e 19 d0 ASL $d019 
0bf4 : 58 __ __ CLI
.s3:
0bf5 : 60 __ __ RTS
--------------------------------------------------------------------
__multab40L:
0bf6 : __ __ __ BYT 00 28 50 78                                     : .(Px
--------------------------------------------------------------------
__multab32L:
0bfa : __ __ __ BYT 00 20 40 60 80                                  : . @`.
--------------------------------------------------------------------
spentry:
0bff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0c00 : ad 19 d0 LDA $d019 
0c03 : 10 51 __ BPL $0c56 ; (rirq_isr_kernal_io + 86)
0c05 : ae 38 46 LDX $4638 ; (nextIRQ + 0)
0c08 : 30 33 __ BMI $0c3d ; (rirq_isr_kernal_io + 61)
0c0a : bd ef 45 LDA $45ef,x ; (rasterIRQNext[0] + 0)
0c0d : bc df 45 LDY $45df,x ; (rasterIRQIndex[0] + 1)
0c10 : be 10 4d LDX $4d10,y ; (rasterIRQLow[0] + 0)
0c13 : 8e 1d 0c STX $0c1d ; (rirq_isr_kernal_io + 29)
0c16 : be 20 4d LDX $4d20,y ; (rasterIRQHigh[0] + 0)
0c19 : 8e 1e 0c STX $0c1e ; (rirq_isr_kernal_io + 30)
0c1c : 20 00 00 JSR $0000 
0c1f : ee 38 46 INC $4638 ; (nextIRQ + 0)
0c22 : ae 38 46 LDX $4638 ; (nextIRQ + 0)
0c25 : bc ef 45 LDY $45ef,x ; (rasterIRQNext[0] + 0)
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
0c43 : ee 39 46 INC $4639 ; (rirq_count + 0)
0c46 : ac ef 45 LDY $45ef ; (rasterIRQNext[0] + 0)
0c49 : 88 __ __ DEY
0c4a : 88 __ __ DEY
0c4b : 8c 12 d0 STY $d012 
0c4e : a2 00 __ LDX #$00
0c50 : 8e 38 46 STX $4638 ; (nextIRQ + 0)
0c53 : 4c 81 ea JMP $ea81 
0c56 : ad 0d dc LDA $dc0d 
0c59 : 58 __ __ CLI
0c5a : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0c5d : a9 a0 __ LDA #$a0
0c5f : a0 01 __ LDY #$01
0c61 : 91 0d __ STA (P0),y ; (ic + 0)
0c63 : a9 00 __ LDA #$00
0c65 : c8 __ __ INY
0c66 : 91 0d __ STA (P0),y ; (ic + 0)
0c68 : a9 a2 __ LDA #$a2
0c6a : c8 __ __ INY
0c6b : 91 0d __ STA (P0),y ; (ic + 0)
0c6d : a9 00 __ LDA #$00
0c6f : c8 __ __ INY
0c70 : 91 0d __ STA (P0),y ; (ic + 0)
0c72 : a9 cd __ LDA #$cd
0c74 : c8 __ __ INY
0c75 : 91 0d __ STA (P0),y ; (ic + 0)
0c77 : a9 12 __ LDA #$12
0c79 : c8 __ __ INY
0c7a : 91 0d __ STA (P0),y ; (ic + 0)
0c7c : a9 d0 __ LDA #$d0
0c7e : c8 __ __ INY
0c7f : 91 0d __ STA (P0),y ; (ic + 0)
0c81 : a9 b0 __ LDA #$b0
0c83 : c8 __ __ INY
0c84 : 91 0d __ STA (P0),y ; (ic + 0)
0c86 : a9 fb __ LDA #$fb
0c88 : c8 __ __ INY
0c89 : 91 0d __ STA (P0),y ; (ic + 0)
0c8b : a9 8c __ LDA #$8c
0c8d : c8 __ __ INY
0c8e : 91 0d __ STA (P0),y ; (ic + 0)
0c90 : a9 00 __ LDA #$00
0c92 : c8 __ __ INY
0c93 : 91 0d __ STA (P0),y ; (ic + 0)
0c95 : c8 __ __ INY
0c96 : 91 0d __ STA (P0),y ; (ic + 0)
0c98 : a9 8e __ LDA #$8e
0c9a : c8 __ __ INY
0c9b : 91 0d __ STA (P0),y ; (ic + 0)
0c9d : a9 00 __ LDA #$00
0c9f : c8 __ __ INY
0ca0 : 91 0d __ STA (P0),y ; (ic + 0)
0ca2 : c8 __ __ INY
0ca3 : 91 0d __ STA (P0),y ; (ic + 0)
0ca5 : a5 0f __ LDA P2 ; (size + 0)
0ca7 : a0 00 __ LDY #$00
0ca9 : 91 0d __ STA (P0),y ; (ic + 0)
0cab : 38 __ __ SEC
0cac : e9 02 __ SBC #$02
0cae : aa __ __ TAX
0caf : 18 __ __ CLC
0cb0 : a5 0d __ LDA P0 ; (ic + 0)
0cb2 : 69 01 __ ADC #$01
0cb4 : 85 1b __ STA ACCU + 0 
0cb6 : a5 0e __ LDA P1 ; (ic + 1)
0cb8 : 69 00 __ ADC #$00
0cba : 85 1c __ STA ACCU + 1 
0cbc : a0 0f __ LDY #$0f
.l5:
0cbe : a9 a9 __ LDA #$a9
0cc0 : 91 1b __ STA (ACCU + 0),y 
0cc2 : a9 00 __ LDA #$00
0cc4 : c8 __ __ INY
0cc5 : 91 1b __ STA (ACCU + 0),y 
0cc7 : a9 8d __ LDA #$8d
0cc9 : c8 __ __ INY
0cca : 91 1b __ STA (ACCU + 0),y 
0ccc : a9 00 __ LDA #$00
0cce : c8 __ __ INY
0ccf : 91 1b __ STA (ACCU + 0),y 
0cd1 : c8 __ __ INY
0cd2 : 91 1b __ STA (ACCU + 0),y 
0cd4 : c8 __ __ INY
0cd5 : ca __ __ DEX
0cd6 : d0 e6 __ BNE $0cbe ; (rirq_build.l5 + 0)
.s6:
0cd8 : a9 60 __ LDA #$60
0cda : c8 __ __ INY
0cdb : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0cdd : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0cde : a9 ff __ LDA #$ff
0ce0 : 8d 38 46 STA $4638 ; (nextIRQ + 0)
0ce3 : ae df 45 LDX $45df ; (rasterIRQIndex[0] + 1)
0ce6 : bd cd 45 LDA $45cd,x ; (rasterIRQRows[0] + 0)
0ce9 : 85 1c __ STA ACCU + 1 
0ceb : a2 02 __ LDX #$02
.l5:
0ced : bc de 45 LDY $45de,x ; (rasterIRQIndex[0] + 0)
0cf0 : b9 cd 45 LDA $45cd,y ; (rasterIRQRows[0] + 0)
0cf3 : c5 1c __ CMP ACCU + 1 
0cf5 : 90 04 __ BCC $0cfb ; (rirq_sort.s10 + 0)
.s6:
0cf7 : 85 1c __ STA ACCU + 1 
0cf9 : b0 24 __ BCS $0d1f ; (rirq_sort.s7 + 0)
.s10:
0cfb : 86 1d __ STX ACCU + 2 
0cfd : 84 1e __ STY ACCU + 3 
0cff : 85 1b __ STA ACCU + 0 
0d01 : bd dd 45 LDA $45dd,x ; (rasterIRQRows[0] + 16)
0d04 : 9d de 45 STA $45de,x ; (rasterIRQIndex[0] + 0)
0d07 : 90 05 __ BCC $0d0e ; (rirq_sort.l11 + 0)
.s13:
0d09 : 98 __ __ TYA
0d0a : 9d dd 45 STA $45dd,x ; (rasterIRQRows[0] + 16)
0d0d : ca __ __ DEX
.l11:
0d0e : a5 1b __ LDA ACCU + 0 
0d10 : bc dc 45 LDY $45dc,x ; (rasterIRQRows[0] + 15)
0d13 : d9 cd 45 CMP $45cd,y ; (rasterIRQRows[0] + 0)
0d16 : 90 f1 __ BCC $0d09 ; (rirq_sort.s13 + 0)
.s12:
0d18 : a5 1e __ LDA ACCU + 3 
0d1a : 9d dd 45 STA $45dd,x ; (rasterIRQRows[0] + 16)
0d1d : a6 1d __ LDX ACCU + 2 
.s7:
0d1f : e8 __ __ INX
0d20 : e0 11 __ CPX #$11
0d22 : 90 c9 __ BCC $0ced ; (rirq_sort.l5 + 0)
.s8:
0d24 : a2 03 __ LDX #$03
.l14:
0d26 : bc df 45 LDY $45df,x ; (rasterIRQIndex[0] + 1)
0d29 : b9 cd 45 LDA $45cd,y ; (rasterIRQRows[0] + 0)
0d2c : 9d ef 45 STA $45ef,x ; (rasterIRQNext[0] + 0)
0d2f : bc e3 45 LDY $45e3,x ; (rasterIRQIndex[0] + 5)
0d32 : b9 cd 45 LDA $45cd,y ; (rasterIRQRows[0] + 0)
0d35 : 9d f3 45 STA $45f3,x ; (rasterIRQNext[0] + 4)
0d38 : bc e7 45 LDY $45e7,x ; (rasterIRQIndex[0] + 9)
0d3b : b9 cd 45 LDA $45cd,y ; (rasterIRQRows[0] + 0)
0d3e : 9d f7 45 STA $45f7,x ; (rasterIRQNext[0] + 8)
0d41 : bc eb 45 LDY $45eb,x ; (rasterIRQIndex[0] + 13)
0d44 : b9 cd 45 LDA $45cd,y ; (rasterIRQRows[0] + 0)
0d47 : 9d fb 45 STA $45fb,x ; (rasterIRQNext[0] + 12)
0d4a : ca __ __ DEX
0d4b : 10 d9 __ BPL $0d26 ; (rirq_sort.l14 + 0)
.s15:
0d4d : ac ef 45 LDY $45ef ; (rasterIRQNext[0] + 0)
0d50 : c0 ff __ CPY #$ff
0d52 : f0 09 __ BEQ $0d5d ; (rirq_sort.s3 + 0)
.s9:
0d54 : 88 __ __ DEY
0d55 : 8c 12 d0 STY $d012 
0d58 : a9 00 __ LDA #$00
0d5a : 8d 38 46 STA $4638 ; (nextIRQ + 0)
.s3:
0d5d : 60 __ __ RTS
--------------------------------------------------------------------
sidfx_init: ; sidfx_init()->void
;  15, "/home/honza/projects/c64/projects/oscar64/include/audio/sidfx.h"
.s4:
0d5e : a9 01 __ LDA #$01
0d60 : 8d 76 4d STA $4d76 ; (channels[0].delay + 0)
0d63 : 8d 77 4d STA $4d77 ; (channels[1].delay + 0)
0d66 : 8d 78 4d STA $4d78 ; (channels[2].delay + 0)
0d69 : a9 00 __ LDA #$00
0d6b : 8d 79 4d STA $4d79 ; (channels[0].priority + 0)
0d6e : 8d 7a 4d STA $4d7a ; (channels[1].priority + 0)
0d71 : 8d 7b 4d STA $4d7b ; (channels[2].priority + 0)
0d74 : 8d 70 4d STA $4d70 ; (channels[0].com + 0)
0d77 : 8d 73 4d STA $4d73 ; (channels[0].com + 0)
0d7a : 8d 7f 4d STA $4d7f ; (channels[0].state + 0)
0d7d : 8d 71 4d STA $4d71 ; (channels[1].com + 0)
0d80 : 8d 74 4d STA $4d74 ; (channels[1].com + 0)
0d83 : 8d 80 4d STA $4d80 ; (channels[1].state + 0)
0d86 : 8d 72 4d STA $4d72 ; (channels[2].com + 0)
0d89 : 8d 75 4d STA $4d75 ; (channels[2].com + 0)
0d8c : 8d 81 4d STA $4d81 ; (channels[2].state + 0)
.s3:
0d8f : 60 __ __ RTS
--------------------------------------------------------------------
status_init: ; status_init()->void
; 171, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
0d90 : a2 00 __ LDX #$00
.l5:
0d92 : bd 5a 45 LDA $455a,x ; (StatusText[0] + 0)
0d95 : 9d 00 c8 STA $c800,x 
0d98 : e8 __ __ INX
0d99 : e0 28 __ CPX #$28
0d9b : d0 f5 __ BNE $0d92 ; (status_init.l5 + 0)
.s3:
0d9d : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0d9e : ad 84 45 LDA $4584 ; (seed + 1)
0da1 : 4a __ __ LSR
0da2 : ad 83 45 LDA $4583 ; (seed + 0)
0da5 : 6a __ __ ROR
0da6 : aa __ __ TAX
0da7 : a9 00 __ LDA #$00
0da9 : 6a __ __ ROR
0daa : 4d 83 45 EOR $4583 ; (seed + 0)
0dad : 85 1b __ STA ACCU + 0 
0daf : 8a __ __ TXA
0db0 : 4d 84 45 EOR $4584 ; (seed + 1)
0db3 : 85 1c __ STA ACCU + 1 
0db5 : 4a __ __ LSR
0db6 : 45 1b __ EOR ACCU + 0 
0db8 : 8d 83 45 STA $4583 ; (seed + 0)
0dbb : 85 1b __ STA ACCU + 0 
0dbd : 45 1c __ EOR ACCU + 1 
0dbf : 8d 84 45 STA $4584 ; (seed + 1)
0dc2 : 85 1c __ STA ACCU + 1 
.s3:
0dc4 : 60 __ __ RTS
--------------------------------------------------------------------
shot_init: ; shot_init()->void
; 461, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
0dc5 : a9 07 __ LDA #$07
0dc7 : 85 1b __ STA ACCU + 0 
0dc9 : 8d 3a 46 STA $463a ; (freeShot + 0)
0dcc : a9 06 __ LDA #$06
0dce : 8d 00 4f STA $4f00 ; (shots[0].ty + 0)
0dd1 : a9 00 __ LDA #$00
0dd3 : 8d 05 4f STA $4f05 ; (shots[0].next + 0)
0dd6 : a9 4f __ LDA #$4f
0dd8 : 8d 06 4f STA $4f06 ; (shots[0].next + 1)
0ddb : a9 4f __ LDA #$4f
0ddd : 8d 3b 46 STA $463b ; (freeShot + 1)
0de0 : a2 10 __ LDX #$10
.l5:
0de2 : 85 1c __ STA ACCU + 1 
0de4 : 18 __ __ CLC
0de5 : a5 1b __ LDA ACCU + 0 
0de7 : 69 07 __ ADC #$07
0de9 : 85 1d __ STA ACCU + 2 
0deb : a0 05 __ LDY #$05
0ded : 91 1b __ STA (ACCU + 0),y 
0def : a5 1c __ LDA ACCU + 1 
0df1 : 69 00 __ ADC #$00
0df3 : c8 __ __ INY
0df4 : 91 1b __ STA (ACCU + 0),y 
0df6 : a4 1d __ LDY ACCU + 2 
0df8 : 84 1b __ STY ACCU + 0 
0dfa : ca __ __ DEX
0dfb : d0 e5 __ BNE $0de2 ; (shot_init.l5 + 0)
.s6:
0dfd : 8e 7c 4f STX $4f7c ; (shots[0] + 124)
0e00 : 8e 7d 4f STX $4f7d ; (shots[0] + 125)
.s3:
0e03 : 60 __ __ RTS
--------------------------------------------------------------------
game_init: ; game_init()->void
; 775, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
0e04 : a9 00 __ LDA #$00
0e06 : 8d ad 4d STA $4dad ; (player.spx + 1)
0e09 : 8d a9 4d STA $4da9 ; (game.ecount + 0)
0e0c : 8d aa 4d STA $4daa ; (game.escore + 0)
0e0f : a9 28 __ LDA #$28
0e11 : 8d ac 4d STA $4dac ; (player.spx + 0)
0e14 : a9 50 __ LDA #$50
0e16 : 8d a8 4d STA $4da8 ; (game.edelay + 0)
0e19 : a9 04 __ LDA #$04
0e1b : 8d ab 4d STA $4dab ; (game.lives + 0)
.s3:
0e1e : 60 __ __ RTS
--------------------------------------------------------------------
player_init: ; player_init()->void
; 673, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
0e1f : a9 00 __ LDA #$00
0e21 : 85 0d __ STA P0 
0e23 : 85 0f __ STA P2 
0e25 : 85 11 __ STA P4 
0e27 : 8d ae 4d STA $4dae ; (player.vpx + 0)
0e2a : 8d b2 4d STA $4db2 ; (player.fdelay + 0)
0e2d : a9 a0 __ LDA #$a0
0e2f : 85 0e __ STA P1 
0e31 : a9 40 __ LDA #$40
0e33 : 85 12 __ STA P5 
0e35 : a9 06 __ LDA #$06
0e37 : 85 13 __ STA P6 
0e39 : a9 64 __ LDA #$64
0e3b : 85 10 __ STA P3 
0e3d : 8d b1 4d STA $4db1 ; (player.spy + 0)
0e40 : a9 01 __ LDA #$01
0e42 : 8d af 4d STA $4daf ; (player.ax + 0)
0e45 : 20 61 0e JSR $0e61 ; (spr_set.s4 + 0)
0e48 : a9 07 __ LDA #$07
0e4a : 85 0d __ STA P0 
0e4c : a9 0c __ LDA #$0c
0e4e : 85 13 __ STA P6 
0e50 : a9 00 __ LDA #$00
0e52 : 85 0f __ STA P2 
0e54 : a9 50 __ LDA #$50
0e56 : 85 12 __ STA P5 
0e58 : 20 61 0e JSR $0e61 ; (spr_set.s4 + 0)
0e5b : a9 80 __ LDA #$80
0e5d : 8d 1b d0 STA $d01b 
.s3:
0e60 : 60 __ __ RTS
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0e61 : a6 0d __ LDX P0 ; (sp + 0)
0e63 : bd 08 46 LDA $4608,x ; (bitshift[0] + 8)
0e66 : 0d 15 d0 ORA $d015 
0e69 : 8d 15 d0 STA $d015 
0e6c : ad 1c d0 LDA $d01c 
0e6f : 1d 08 46 ORA $4608,x ; (bitshift[0] + 8)
0e72 : 8d 1c d0 STA $d01c 
0e75 : bd 08 46 LDA $4608,x ; (bitshift[0] + 8)
0e78 : 49 ff __ EOR #$ff
0e7a : 85 1b __ STA ACCU + 0 
0e7c : 2d 1d d0 AND $d01d 
0e7f : 8d 1d d0 STA $d01d 
0e82 : ad 17 d0 LDA $d017 
0e85 : 25 1b __ AND ACCU + 0 
0e87 : 8d 17 d0 STA $d017 
0e8a : 8a __ __ TXA
0e8b : 0a __ __ ASL
0e8c : a8 __ __ TAY
0e8d : a5 10 __ LDA P3 ; (ypos + 0)
0e8f : 99 01 d0 STA $d001,y 
0e92 : a5 0e __ LDA P1 ; (xpos + 0)
0e94 : 99 00 d0 STA $d000,y 
0e97 : 46 0f __ LSR P2 ; (xpos + 1)
0e99 : ad 10 d0 LDA $d010 
0e9c : 90 05 __ BCC $0ea3 ; (spr_set.s5 + 0)
.s7:
0e9e : 1d 08 46 ORA $4608,x ; (bitshift[0] + 8)
0ea1 : b0 02 __ BCS $0ea5 ; (spr_set.s6 + 0)
.s5:
0ea3 : 25 1b __ AND ACCU + 0 
.s6:
0ea5 : 8d 10 d0 STA $d010 
0ea8 : ad cb 45 LDA $45cb ; (vspriteScreen + 0)
0eab : 85 1b __ STA ACCU + 0 
0ead : ad cc 45 LDA $45cc ; (vspriteScreen + 1)
0eb0 : 85 1c __ STA ACCU + 1 
0eb2 : a5 12 __ LDA P5 ; (image + 0)
0eb4 : a4 0d __ LDY P0 ; (sp + 0)
0eb6 : 91 1b __ STA (ACCU + 0),y 
0eb8 : a5 13 __ LDA P6 ; (color + 0)
0eba : 9d 27 d0 STA $d027,x 
.s3:
0ebd : 60 __ __ RTS
--------------------------------------------------------------------
game_state: ; game_state(enum GameState)->void
; 972, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s1:
0ebe : 38 __ __ SEC
0ebf : a5 23 __ LDA SP + 0 
0ec1 : e9 03 __ SBC #$03
0ec3 : 85 23 __ STA SP + 0 
0ec5 : b0 02 __ BCS $0ec9 ; (game_state.s4 + 0)
0ec7 : c6 24 __ DEC SP + 1 
.s4:
0ec9 : a0 05 __ LDY #$05
0ecb : b1 23 __ LDA (SP + 0),y 
0ecd : 8d a6 4d STA $4da6 ; (game.state + 0)
0ed0 : c9 02 __ CMP #$02
0ed2 : d0 0f __ BNE $0ee3 ; (game_state.s5 + 0)
.s18:
0ed4 : 20 1f 0e JSR $0e1f ; (player_init.s4 + 0)
.s3:
0ed7 : 18 __ __ CLC
0ed8 : a5 23 __ LDA SP + 0 
0eda : 69 03 __ ADC #$03
0edc : 85 23 __ STA SP + 0 
0ede : 90 02 __ BCC $0ee2 ; (game_state.s3 + 11)
0ee0 : e6 24 __ INC SP + 1 
0ee2 : 60 __ __ RTS
.s5:
0ee3 : 90 58 __ BCC $0f3d ; (game_state.s15 + 0)
.s6:
0ee5 : c9 03 __ CMP #$03
0ee7 : f0 0e __ BEQ $0ef7 ; (game_state.s9 + 0)
.s7:
0ee9 : c9 04 __ CMP #$04
0eeb : d0 ea __ BNE $0ed7 ; (game_state.s3 + 0)
.s8:
0eed : 20 66 0f JSR $0f66 ; (score_reset.s4 + 0)
0ef0 : a9 78 __ LDA #$78
0ef2 : 8d a7 4d STA $4da7 ; (game.count + 0)
0ef5 : d0 e0 __ BNE $0ed7 ; (game_state.s3 + 0)
.s9:
0ef7 : a9 40 __ LDA #$40
0ef9 : 8d a7 4d STA $4da7 ; (game.count + 0)
0efc : ad 7f 4d LDA $4d7f ; (channels[0].state + 0)
0eff : d0 04 __ BNE $0f05 ; (game_state.s13 + 0)
.s10:
0f01 : a9 03 __ LDA #$03
0f03 : d0 0a __ BNE $0f0f ; (game_state.s11 + 0)
.s13:
0f05 : ad 92 45 LDA $4592 ; (SIDFXBigExplosion[0].priority + 0)
0f08 : cd 79 4d CMP $4d79 ; (channels[0].priority + 0)
0f0b : 90 24 __ BCC $0f31 ; (game_state.s12 + 0)
.s14:
0f0d : a9 01 __ LDA #$01
.s11:
0f0f : a2 01 __ LDX #$01
0f11 : 8e 76 4d STX $4d76 ; (channels[0].delay + 0)
0f14 : ae 92 45 LDX $4592 ; (SIDFXBigExplosion[0].priority + 0)
0f17 : 8e 79 4d STX $4d79 ; (channels[0].priority + 0)
0f1a : a2 00 __ LDX #$00
0f1c : 8e 7f 4d STX $4d7f ; (channels[0].state + 0)
0f1f : a2 85 __ LDX #$85
0f21 : 8e 70 4d STX $4d70 ; (channels[0].com + 0)
0f24 : a2 45 __ LDX #$45
0f26 : 8e 73 4d STX $4d73 ; (channels[0].com + 0)
0f29 : a2 02 __ LDX #$02
0f2b : 8e 7c 4d STX $4d7c ; (channels[0].cnt + 0)
0f2e : 8d 7f 4d STA $4d7f ; (channels[0].state + 0)
.s12:
0f31 : a9 07 __ LDA #$07
0f33 : 8d 27 d0 STA $d027 
0f36 : a9 08 __ LDA #$08
0f38 : 8d 2e d0 STA $d02e 
0f3b : d0 9a __ BNE $0ed7 ; (game_state.s3 + 0)
.s15:
0f3d : aa __ __ TAX
0f3e : f0 17 __ BEQ $0f57 ; (game_state.s16 + 0)
.s17:
0f40 : a9 78 __ LDA #$78
0f42 : 8d a7 4d STA $4da7 ; (game.count + 0)
0f45 : ad 15 d0 LDA $d015 
0f48 : 29 fe __ AND #$fe
0f4a : 8d 15 d0 STA $d015 
0f4d : ad 15 d0 LDA $d015 
0f50 : 29 7f __ AND #$7f
0f52 : 8d 15 d0 STA $d015 
0f55 : 90 80 __ BCC $0ed7 ; (game_state.s3 + 0)
.s16:
0f57 : a9 01 __ LDA #$01
0f59 : a0 02 __ LDY #$02
0f5b : 91 23 __ STA (SP + 0),y 
0f5d : 20 04 0e JSR $0e04 ; (game_init.s4 + 0)
0f60 : 20 be 0e JSR $0ebe ; (game_state.s1 + 0)
0f63 : 4c d7 0e JMP $0ed7 ; (game_state.s3 + 0)
--------------------------------------------------------------------
score_reset: ; score_reset()->void
; 230, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
0f66 : a0 00 __ LDY #$00
.l5:
0f68 : b9 16 c8 LDA $c816,y 
0f6b : d9 08 c8 CMP $c808,y 
0f6e : d0 1a __ BNE $0f8a ; (score_reset.l6 + 0)
.s8:
0f70 : c8 __ __ INY
0f71 : c0 06 __ CPY #$06
0f73 : 90 f3 __ BCC $0f68 ; (score_reset.l5 + 0)
.s7:
0f75 : a9 30 __ LDA #$30
0f77 : 8d 08 c8 STA $c808 
0f7a : 8d 09 c8 STA $c809 
0f7d : 8d 0a c8 STA $c80a 
0f80 : 8d 0b c8 STA $c80b 
0f83 : 8d 0c c8 STA $c80c 
0f86 : 8d 0d c8 STA $c80d 
.s3:
0f89 : 60 __ __ RTS
.l6:
0f8a : b0 e9 __ BCS $0f75 ; (score_reset.s7 + 0)
.s9:
0f8c : b9 08 c8 LDA $c808,y 
0f8f : 99 16 c8 STA $c816,y 
0f92 : c8 __ __ INY
0f93 : c0 06 __ CPY #$06
0f95 : 4c 8a 0f JMP $0f8a ; (score_reset.l6 + 0)
--------------------------------------------------------------------
game_loop: ; game_loop()->void
;1007, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s1:
0f98 : a5 53 __ LDA T2 + 0 
0f9a : 8d f7 9f STA $9ff7 ; (game_loop@stack + 0)
0f9d : a5 54 __ LDA T2 + 1 
0f9f : 8d f8 9f STA $9ff8 ; (game_loop@stack + 1)
0fa2 : 38 __ __ SEC
0fa3 : a5 23 __ LDA SP + 0 
0fa5 : e9 03 __ SBC #$03
0fa7 : 85 23 __ STA SP + 0 
0fa9 : b0 02 __ BCS $0fad ; (game_loop.s4 + 0)
0fab : c6 24 __ DEC SP + 1 
.s4:
0fad : ad ac 4d LDA $4dac ; (player.spx + 0)
0fb0 : 85 53 __ STA T2 + 0 
0fb2 : 85 11 __ STA P4 
0fb4 : ad ad 4d LDA $4dad ; (player.spx + 1)
0fb7 : 85 54 __ STA T2 + 1 
0fb9 : 29 0f __ AND #$0f
0fbb : 85 12 __ STA P5 
0fbd : 20 11 11 JSR $1111 ; (tiles_draw.s1 + 0)
0fc0 : ad a6 4d LDA $4da6 ; (game.state + 0)
0fc3 : c9 02 __ CMP #$02
0fc5 : d0 03 __ BNE $0fca ; (game_loop.s5 + 0)
0fc7 : 4c 78 10 JMP $1078 ; (game_loop.s15 + 0)
.s5:
0fca : b0 03 __ BCS $0fcf ; (game_loop.s6 + 0)
0fcc : 4c 52 10 JMP $1052 ; (game_loop.s12 + 0)
.s6:
0fcf : c9 03 __ CMP #$03
0fd1 : f0 2f __ BEQ $1002 ; (game_loop.s10 + 0)
.s7:
0fd3 : c9 04 __ CMP #$04
0fd5 : d0 0f __ BNE $0fe6 ; (game_loop.s3 + 0)
.s8:
0fd7 : ce a7 4d DEC $4da7 ; (game.count + 0)
0fda : d0 0a __ BNE $0fe6 ; (game_loop.s3 + 0)
.s9:
0fdc : ad a7 4d LDA $4da7 ; (game.count + 0)
.s29:
0fdf : a0 02 __ LDY #$02
0fe1 : 91 23 __ STA (SP + 0),y 
0fe3 : 20 be 0e JSR $0ebe ; (game_state.s1 + 0)
.s3:
0fe6 : 20 e5 1b JSR $1be5 ; (sidfx_loop.s4 + 0)
0fe9 : 20 07 1e JSR $1e07 ; (status_update.s4 + 0)
0fec : 18 __ __ CLC
0fed : a5 23 __ LDA SP + 0 
0fef : 69 03 __ ADC #$03
0ff1 : 85 23 __ STA SP + 0 
0ff3 : 90 02 __ BCC $0ff7 ; (game_loop.s3 + 17)
0ff5 : e6 24 __ INC SP + 1 
0ff7 : ad f7 9f LDA $9ff7 ; (game_loop@stack + 0)
0ffa : 85 53 __ STA T2 + 0 
0ffc : ad f8 9f LDA $9ff8 ; (game_loop@stack + 1)
0fff : 85 54 __ STA T2 + 1 
1001 : 60 __ __ RTS
.s10:
1002 : ad ae 4d LDA $4dae ; (player.vpx + 0)
1005 : 4a __ __ LSR
1006 : 4a __ __ LSR
1007 : 49 20 __ EOR #$20
1009 : 38 __ __ SEC
100a : e9 20 __ SBC #$20
100c : aa __ __ TAX
100d : a9 00 __ LDA #$00
100f : e9 00 __ SBC #$00
1011 : 85 44 __ STA T0 + 1 
1013 : ad cb 45 LDA $45cb ; (vspriteScreen + 0)
1016 : 85 45 __ STA T1 + 0 
1018 : ad cc 45 LDA $45cc ; (vspriteScreen + 1)
101b : 85 46 __ STA T1 + 1 
101d : ad a7 4d LDA $4da7 ; (game.count + 0)
1020 : 4a __ __ LSR
1021 : 4a __ __ LSR
1022 : 49 7f __ EOR #$7f
1024 : a0 00 __ LDY #$00
1026 : 91 45 __ STA (T1 + 0),y 
1028 : a0 07 __ LDY #$07
102a : 91 45 __ STA (T1 + 0),y 
102c : 8a __ __ TXA
102d : 18 __ __ CLC
102e : 65 53 __ ADC T2 + 0 
1030 : 8d ac 4d STA $4dac ; (player.spx + 0)
1033 : a5 44 __ LDA T0 + 1 
1035 : 65 54 __ ADC T2 + 1 
1037 : 8d ad 4d STA $4dad ; (player.spx + 1)
103a : 20 81 19 JSR $1981 ; (enemies_move.s4 + 0)
103d : ce a7 4d DEC $4da7 ; (game.count + 0)
1040 : d0 a4 __ BNE $0fe6 ; (game_loop.s3 + 0)
.s11:
1042 : 20 bc 1b JSR $1bbc ; (enemies_reset.s4 + 0)
1045 : ce ab 4d DEC $4dab ; (game.lives + 0)
1048 : f0 04 __ BEQ $104e ; (game_loop.s30 + 0)
.s31:
104a : a9 01 __ LDA #$01
104c : d0 91 __ BNE $0fdf ; (game_loop.s29 + 0)
.s30:
104e : a9 04 __ LDA #$04
1050 : d0 8d __ BNE $0fdf ; (game_loop.s29 + 0)
.s12:
1052 : aa __ __ TAX
1053 : f0 91 __ BEQ $0fe6 ; (game_loop.s3 + 0)
.s13:
1055 : ad a7 4d LDA $4da7 ; (game.count + 0)
1058 : aa __ __ TAX
1059 : 4a __ __ LSR
105a : 4a __ __ LSR
105b : 49 ff __ EOR #$ff
105d : 38 __ __ SEC
105e : 65 11 __ ADC P4 
1060 : 8d ac 4d STA $4dac ; (player.spx + 0)
1063 : a5 54 __ LDA T2 + 1 
1065 : e9 00 __ SBC #$00
1067 : ca __ __ DEX
1068 : 8e a7 4d STX $4da7 ; (game.count + 0)
106b : 8d ad 4d STA $4dad ; (player.spx + 1)
106e : f0 03 __ BEQ $1073 ; (game_loop.s14 + 0)
1070 : 4c e6 0f JMP $0fe6 ; (game_loop.s3 + 0)
.s14:
1073 : a9 02 __ LDA #$02
1075 : 4c df 0f JMP $0fdf ; (game_loop.s29 + 0)
.s15:
1078 : 20 40 16 JSR $1640 ; (player_control.s4 + 0)
107b : ad ae 4d LDA $4dae ; (player.vpx + 0)
107e : 4a __ __ LSR
107f : 4a __ __ LSR
1080 : 49 20 __ EOR #$20
1082 : 38 __ __ SEC
1083 : e9 20 __ SBC #$20
1085 : 85 43 __ STA T0 + 0 
1087 : a9 00 __ LDA #$00
1089 : e9 00 __ SBC #$00
108b : aa __ __ TAX
108c : ad ac 4d LDA $4dac ; (player.spx + 0)
108f : 18 __ __ CLC
1090 : 65 43 __ ADC T0 + 0 
1092 : 8d ac 4d STA $4dac ; (player.spx + 0)
1095 : 8a __ __ TXA
1096 : 6d ad 4d ADC $4dad ; (player.spx + 1)
1099 : 8d ad 4d STA $4dad ; (player.spx + 1)
109c : ad a8 4d LDA $4da8 ; (game.edelay + 0)
109f : d0 5d __ BNE $10fe ; (game_loop.s26 + 0)
.s16:
10a1 : 20 81 19 JSR $1981 ; (enemies_move.s4 + 0)
10a4 : ad a9 4d LDA $4da9 ; (game.ecount + 0)
10a7 : d0 0c __ BNE $10b5 ; (game_loop.s18 + 0)
.s17:
10a9 : 20 9e 0d JSR $0d9e ; (rand.s4 + 0)
10ac : a5 1b __ LDA ACCU + 0 
10ae : 29 3f __ AND #$3f
10b0 : 09 40 __ ORA #$40
10b2 : 8d a8 4d STA $4da8 ; (game.edelay + 0)
.s18:
10b5 : 20 63 1a JSR $1a63 ; (shots_check.s4 + 0)
10b8 : aa __ __ TAX
10b9 : f0 35 __ BEQ $10f0 ; (game_loop.s19 + 0)
.s21:
10bb : ad 80 4d LDA $4d80 ; (channels[1].state + 0)
10be : d0 04 __ BNE $10c4 ; (game_loop.s24 + 0)
.s22:
10c0 : a9 03 __ LDA #$03
10c2 : d0 0a __ BNE $10ce ; (game_loop.s23 + 0)
.s24:
10c4 : ad ca 45 LDA $45ca ; (SIDFXExplosion[0].priority + 0)
10c7 : cd 7a 4d CMP $4d7a ; (channels[1].priority + 0)
10ca : 90 24 __ BCC $10f0 ; (game_loop.s19 + 0)
.s25:
10cc : a9 01 __ LDA #$01
.s23:
10ce : a2 01 __ LDX #$01
10d0 : 8e 77 4d STX $4d77 ; (channels[1].delay + 0)
10d3 : ae ca 45 LDX $45ca ; (SIDFXExplosion[0].priority + 0)
10d6 : 8e 7a 4d STX $4d7a ; (channels[1].priority + 0)
10d9 : a2 00 __ LDX #$00
10db : 8e 80 4d STX $4d80 ; (channels[1].state + 0)
10de : a2 bd __ LDX #$bd
10e0 : 8e 71 4d STX $4d71 ; (channels[1].com + 0)
10e3 : a2 45 __ LDX #$45
10e5 : 8e 74 4d STX $4d74 ; (channels[1].com + 0)
10e8 : a2 00 __ LDX #$00
10ea : 8e 7d 4d STX $4d7d ; (channels[1].cnt + 0)
10ed : 8d 80 4d STA $4d80 ; (channels[1].state + 0)
.s19:
10f0 : 20 36 1b JSR $1b36 ; (player_check.s4 + 0)
10f3 : aa __ __ TAX
10f4 : d0 03 __ BNE $10f9 ; (game_loop.s20 + 0)
10f6 : 4c e6 0f JMP $0fe6 ; (game_loop.s3 + 0)
.s20:
10f9 : a9 03 __ LDA #$03
10fb : 4c df 0f JMP $0fdf ; (game_loop.s29 + 0)
.s26:
10fe : 38 __ __ SEC
10ff : e9 01 __ SBC #$01
1101 : 8d a8 4d STA $4da8 ; (game.edelay + 0)
1104 : c9 0a __ CMP #$0a
1106 : b0 ad __ BCS $10b5 ; (game_loop.s18 + 0)
.s27:
1108 : 4a __ __ LSR
1109 : b0 aa __ BCS $10b5 ; (game_loop.s18 + 0)
.s28:
110b : 20 d2 18 JSR $18d2 ; (enemies_spawn.s4 + 0)
110e : 4c b5 10 JMP $10b5 ; (game_loop.s18 + 0)
--------------------------------------------------------------------
tiles_draw: ; tiles_draw(u16)->void
; 543, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s1:
1111 : a2 03 __ LDX #$03
1113 : b5 53 __ LDA T8 + 0,x 
1115 : 9d f9 9f STA $9ff9,x ; (tiles_draw@stack + 0)
1118 : ca __ __ DEX
1119 : 10 f8 __ BPL $1113 ; (tiles_draw.s1 + 2)
.l4:
111b : 2c 11 d0 BIT $d011 
111e : 30 fb __ BMI $111b ; (tiles_draw.l4 + 0)
.l5:
1120 : ad 12 d0 LDA $d012 
1123 : c9 6a __ CMP #$6a
1125 : 90 f9 __ BCC $1120 ; (tiles_draw.l5 + 0)
.s6:
1127 : a5 12 __ LDA P5 ; (x + 1)
1129 : 4a __ __ LSR
112a : 85 44 __ STA T0 + 1 
112c : a5 11 __ LDA P4 ; (x + 0)
112e : 29 07 __ AND #$07
1130 : 49 07 __ EOR #$07
1132 : aa __ __ TAX
1133 : 09 10 __ ORA #$10
1135 : 8d 34 4d STA $4d34 ; (top.code[0] + 3)
1138 : bd 08 46 LDA $4608,x ; (bitshift[0] + 8)
113b : 49 ff __ EOR #$ff
113d : 8d 41 4d STA $4d41 ; (top.code[0] + 16)
1140 : a5 11 __ LDA P4 ; (x + 0)
1142 : 6a __ __ ROR
1143 : 46 44 __ LSR T0 + 1 
1145 : 6a __ __ ROR
1146 : 46 44 __ LSR T0 + 1 
1148 : 6a __ __ ROR
1149 : aa __ __ TAX
114a : 29 03 __ AND #$03
114c : 85 4c __ STA T4 + 0 
114e : c9 02 __ CMP #$02
1150 : d0 04 __ BNE $1156 ; (tiles_draw.s8 + 0)
.s7:
1152 : a9 01 __ LDA #$01
1154 : d0 02 __ BNE $1158 ; (tiles_draw.s9 + 0)
.s8:
1156 : a9 00 __ LDA #$00
.s9:
1158 : 85 52 __ STA T11 + 0 
115a : 8a __ __ TXA
115b : 46 44 __ LSR T0 + 1 
115d : 6a __ __ ROR
115e : 46 44 __ LSR T0 + 1 
1160 : 6a __ __ ROR
1161 : 18 __ __ CLC
1162 : 69 40 __ ADC #$40
1164 : 85 4d __ STA T5 + 0 
1166 : a9 4a __ LDA #$4a
1168 : 69 00 __ ADC #$00
116a : 85 4e __ STA T5 + 1 
116c : a9 00 __ LDA #$00
116e : 85 51 __ STA T7 + 0 
1170 : 85 55 __ STA T12 + 0 
1172 : 85 56 __ STA T13 + 0 
1174 : a9 00 __ LDA #$00
1176 : 85 4f __ STA T6 + 0 
1178 : a9 4f __ LDA #$4f
117a : 85 50 __ STA T6 + 1 
117c : a9 78 __ LDA #$78
117e : 85 53 __ STA T8 + 0 
1180 : a9 c8 __ LDA #$c8
1182 : 85 54 __ STA T8 + 1 
.l10:
1184 : a5 53 __ LDA T8 + 0 
1186 : 85 0d __ STA P0 
1188 : 85 4a __ STA T3 + 0 
118a : a5 54 __ LDA T8 + 1 
118c : 85 0e __ STA P1 
118e : 18 __ __ CLC
118f : 69 10 __ ADC #$10
1191 : 85 4b __ STA T3 + 1 
1193 : a5 4d __ LDA T5 + 0 
1195 : 85 0f __ STA P2 
1197 : a5 4e __ LDA T5 + 1 
1199 : 85 10 __ STA P3 
119b : a5 52 __ LDA T11 + 0 
119d : f0 06 __ BEQ $11a5 ; (tiles_draw.s11 + 0)
.s34:
119f : 20 d0 14 JSR $14d0 ; (tiles_draw2.s4 + 0)
11a2 : 4c bd 11 JMP $11bd ; (tiles_draw.s13 + 0)
.s11:
11a5 : a5 4c __ LDA T4 + 0 
11a7 : c9 02 __ CMP #$02
11a9 : 90 06 __ BCC $11b1 ; (tiles_draw.s31 + 0)
.s12:
11ab : 20 88 15 JSR $1588 ; (tiles_draw3.s4 + 0)
11ae : 4c bd 11 JMP $11bd ; (tiles_draw.s13 + 0)
.s31:
11b1 : aa __ __ TAX
11b2 : d0 06 __ BNE $11ba ; (tiles_draw.s33 + 0)
.s32:
11b4 : 20 65 13 JSR $1365 ; (tiles_draw0.s4 + 0)
11b7 : 4c bd 11 JMP $11bd ; (tiles_draw.s13 + 0)
.s33:
11ba : 20 18 14 JSR $1418 ; (tiles_draw1.s4 + 0)
.s13:
11bd : a5 0d __ LDA P0 
11bf : a6 55 __ LDX T12 + 0 
11c1 : 18 __ __ CLC
11c2 : 7d 8e 4d ADC $4d8e,x ; (stars[0] + 0)
11c5 : 85 45 __ STA T1 + 0 
11c7 : a5 0e __ LDA P1 
11c9 : 69 00 __ ADC #$00
11cb : 85 46 __ STA T1 + 1 
11cd : a0 00 __ LDY #$00
11cf : b1 45 __ LDA (T1 + 0),y 
11d1 : f0 0b __ BEQ $11de ; (tiles_draw.s14 + 0)
.s30:
11d3 : a9 08 __ LDA #$08
11d5 : bc 8e 4d LDY $4d8e,x ; (stars[0] + 0)
11d8 : 91 4a __ STA (T3 + 0),y 
11da : a0 00 __ LDY #$00
11dc : f0 0b __ BEQ $11e9 ; (tiles_draw.s15 + 0)
.s14:
11de : bc 8e 4d LDY $4d8e,x ; (stars[0] + 0)
11e1 : 91 4a __ STA (T3 + 0),y 
11e3 : a9 f8 __ LDA #$f8
11e5 : a0 00 __ LDY #$00
11e7 : 91 45 __ STA (T1 + 0),y 
.s15:
11e9 : 18 __ __ CLC
11ea : a5 0d __ LDA P0 
11ec : 7d 8f 4d ADC $4d8f,x ; (stars[0] + 1)
11ef : 85 45 __ STA T1 + 0 
11f1 : a5 0e __ LDA P1 
11f3 : 69 00 __ ADC #$00
11f5 : 85 46 __ STA T1 + 1 
11f7 : b1 45 __ LDA (T1 + 0),y 
11f9 : f0 0b __ BEQ $1206 ; (tiles_draw.s16 + 0)
.s29:
11fb : a9 08 __ LDA #$08
11fd : bc 8f 4d LDY $4d8f,x ; (stars[0] + 1)
1200 : 91 4a __ STA (T3 + 0),y 
1202 : a0 00 __ LDY #$00
1204 : f0 0b __ BEQ $1211 ; (tiles_draw.s17 + 0)
.s16:
1206 : bc 8f 4d LDY $4d8f,x ; (stars[0] + 1)
1209 : 91 4a __ STA (T3 + 0),y 
120b : a9 f8 __ LDA #$f8
120d : a0 00 __ LDY #$00
120f : 91 45 __ STA (T1 + 0),y 
.s17:
1211 : 18 __ __ CLC
1212 : a5 0d __ LDA P0 
1214 : 7d 90 4d ADC $4d90,x ; (stars[0] + 2)
1217 : 85 45 __ STA T1 + 0 
1219 : a5 0e __ LDA P1 
121b : 69 00 __ ADC #$00
121d : 85 46 __ STA T1 + 1 
121f : b1 45 __ LDA (T1 + 0),y 
1221 : f0 0b __ BEQ $122e ; (tiles_draw.s18 + 0)
.s28:
1223 : a9 08 __ LDA #$08
1225 : bc 90 4d LDY $4d90,x ; (stars[0] + 2)
1228 : 91 4a __ STA (T3 + 0),y 
122a : a0 00 __ LDY #$00
122c : f0 0b __ BEQ $1239 ; (tiles_draw.s19 + 0)
.s18:
122e : bc 90 4d LDY $4d90,x ; (stars[0] + 2)
1231 : 91 4a __ STA (T3 + 0),y 
1233 : a9 f8 __ LDA #$f8
1235 : a0 00 __ LDY #$00
1237 : 91 45 __ STA (T1 + 0),y 
.s19:
1239 : 18 __ __ CLC
123a : a5 0d __ LDA P0 
123c : 7d 91 4d ADC $4d91,x ; (stars[0] + 3)
123f : 85 43 __ STA T0 + 0 
1241 : a5 0e __ LDA P1 
1243 : 69 00 __ ADC #$00
1245 : 85 44 __ STA T0 + 1 
1247 : b1 43 __ LDA (T0 + 0),y 
1249 : d0 0d __ BNE $1258 ; (tiles_draw.s27 + 0)
.s20:
124b : bc 91 4d LDY $4d91,x ; (stars[0] + 3)
124e : 91 4a __ STA (T3 + 0),y 
1250 : a9 f8 __ LDA #$f8
1252 : a0 00 __ LDY #$00
1254 : 91 43 __ STA (T0 + 0),y 
1256 : f0 07 __ BEQ $125f ; (tiles_draw.s39 + 0)
.s27:
1258 : a9 08 __ LDA #$08
125a : bc 91 4d LDY $4d91,x ; (stars[0] + 3)
125d : 91 4a __ STA (T3 + 0),y 
.s39:
125f : a9 e7 __ LDA #$e7
1261 : 85 48 __ STA T2 + 1 
.l21:
1263 : a0 05 __ LDY #$05
1265 : b1 4f __ LDA (T6 + 0),y 
1267 : 85 43 __ STA T0 + 0 
1269 : c8 __ __ INY
126a : b1 4f __ LDA (T6 + 0),y 
126c : 4c 81 12 JMP $1281 ; (tiles_draw.l22 + 0)
.s26:
126f : a5 43 __ LDA T0 + 0 
1271 : 85 4f __ STA T6 + 0 
1273 : a5 44 __ LDA T0 + 1 
1275 : 85 50 __ STA T6 + 1 
1277 : a0 05 __ LDY #$05
1279 : b1 43 __ LDA (T0 + 0),y 
127b : aa __ __ TAX
127c : c8 __ __ INY
127d : b1 43 __ LDA (T0 + 0),y 
127f : 86 43 __ STX T0 + 0 
.l22:
1281 : 85 44 __ STA T0 + 1 
1283 : a5 51 __ LDA T7 + 0 
1285 : a0 00 __ LDY #$00
1287 : d1 43 __ CMP (T0 + 0),y 
1289 : f0 33 __ BEQ $12be ; (tiles_draw.s24 + 0)
.s23:
128b : 18 __ __ CLC
128c : a5 55 __ LDA T12 + 0 
128e : 69 04 __ ADC #$04
1290 : 85 55 __ STA T12 + 0 
1292 : 18 __ __ CLC
1293 : a5 0f __ LDA P2 
1295 : 69 90 __ ADC #$90
1297 : 85 4d __ STA T5 + 0 
1299 : 90 03 __ BCC $129e ; (tiles_draw.s36 + 0)
.s35:
129b : e6 4e __ INC T5 + 1 
129d : 18 __ __ CLC
.s36:
129e : a5 0d __ LDA P0 
12a0 : 69 a0 __ ADC #$a0
12a2 : 85 53 __ STA T8 + 0 
12a4 : 90 02 __ BCC $12a8 ; (tiles_draw.s38 + 0)
.s37:
12a6 : e6 54 __ INC T8 + 1 
.s38:
12a8 : e6 51 __ INC T7 + 0 
12aa : a5 51 __ LDA T7 + 0 
12ac : c9 05 __ CMP #$05
12ae : b0 03 __ BCS $12b3 ; (tiles_draw.s3 + 0)
12b0 : 4c 84 11 JMP $1184 ; (tiles_draw.l10 + 0)
.s3:
12b3 : a2 03 __ LDX #$03
12b5 : bd f9 9f LDA $9ff9,x ; (tiles_draw@stack + 0)
12b8 : 95 53 __ STA T8 + 0,x 
12ba : ca __ __ DEX
12bb : 10 f8 __ BPL $12b5 ; (tiles_draw.s3 + 2)
12bd : 60 __ __ RTS
.s24:
12be : a0 04 __ LDY #$04
12c0 : b1 43 __ LDA (T0 + 0),y 
12c2 : 18 __ __ CLC
12c3 : a0 01 __ LDY #$01
12c5 : 71 43 __ ADC (T0 + 0),y 
12c7 : 85 45 __ STA T1 + 0 
12c9 : 91 43 __ STA (T0 + 0),y 
12cb : 18 __ __ CLC
12cc : a0 03 __ LDY #$03
12ce : b1 43 __ LDA (T0 + 0),y 
12d0 : 69 ff __ ADC #$ff
12d2 : 91 43 __ STA (T0 + 0),y 
12d4 : a4 45 __ LDY T1 + 0 
12d6 : b1 0d __ LDA (P0),y 
12d8 : aa __ __ TAX
12d9 : a0 02 __ LDY #$02
12db : b1 43 __ LDA (T0 + 0),y 
12dd : 85 1b __ STA ACCU + 0 
12df : a5 56 __ LDA T13 + 0 
12e1 : 09 e0 __ ORA #$e0
12e3 : a4 45 __ LDY T1 + 0 
12e5 : 91 0d __ STA (P0),y 
12e7 : a5 56 __ LDA T13 + 0 
12e9 : 0a __ __ ASL
12ea : 0a __ __ ASL
12eb : 0a __ __ ASL
12ec : 85 47 __ STA T2 + 0 
12ee : 8a __ __ TXA
12ef : 0a __ __ ASL
12f0 : 85 45 __ STA T1 + 0 
12f2 : a9 1c __ LDA #$1c
12f4 : 2a __ __ ROL
12f5 : 06 45 __ ASL T1 + 0 
12f7 : 2a __ __ ROL
12f8 : 06 45 __ ASL T1 + 0 
12fa : 2a __ __ ROL
12fb : 85 46 __ STA T1 + 1 
12fd : a0 00 __ LDY #$00
12ff : b1 45 __ LDA (T1 + 0),y 
1301 : a6 47 __ LDX T2 + 0 
1303 : 9d 00 e7 STA $e700,x 
1306 : c8 __ __ INY
1307 : b1 45 __ LDA (T1 + 0),y 
1309 : 9d 01 e7 STA $e701,x 
130c : c8 __ __ INY
130d : b1 45 __ LDA (T1 + 0),y 
130f : 9d 02 e7 STA $e702,x 
1312 : c8 __ __ INY
1313 : b1 45 __ LDA (T1 + 0),y 
1315 : 9d 03 e7 STA $e703,x 
1318 : c8 __ __ INY
1319 : b1 45 __ LDA (T1 + 0),y 
131b : 9d 04 e7 STA $e704,x 
131e : c8 __ __ INY
131f : b1 45 __ LDA (T1 + 0),y 
1321 : 9d 05 e7 STA $e705,x 
1324 : c8 __ __ INY
1325 : b1 45 __ LDA (T1 + 0),y 
1327 : 9d 06 e7 STA $e706,x 
132a : c8 __ __ INY
132b : b1 45 __ LDA (T1 + 0),y 
132d : 9d 07 e7 STA $e707,x 
1330 : a9 00 __ LDA #$00
1332 : a4 1b __ LDY ACCU + 0 
1334 : 91 47 __ STA (T2 + 0),y 
1336 : e6 56 __ INC T13 + 0 
1338 : a0 03 __ LDY #$03
133a : b1 43 __ LDA (T0 + 0),y 
133c : f0 03 __ BEQ $1341 ; (tiles_draw.s25 + 0)
133e : 4c 6f 12 JMP $126f ; (tiles_draw.s26 + 0)
.s25:
1341 : a0 05 __ LDY #$05
1343 : b1 43 __ LDA (T0 + 0),y 
1345 : 91 4f __ STA (T6 + 0),y 
1347 : c8 __ __ INY
1348 : b1 43 __ LDA (T0 + 0),y 
134a : 91 4f __ STA (T6 + 0),y 
134c : ad 3a 46 LDA $463a ; (freeShot + 0)
134f : 88 __ __ DEY
1350 : 91 43 __ STA (T0 + 0),y 
1352 : ad 3b 46 LDA $463b ; (freeShot + 1)
1355 : c8 __ __ INY
1356 : 91 43 __ STA (T0 + 0),y 
1358 : a5 43 __ LDA T0 + 0 
135a : 8d 3a 46 STA $463a ; (freeShot + 0)
135d : a5 44 __ LDA T0 + 1 
135f : 8d 3b 46 STA $463b ; (freeShot + 1)
1362 : 4c 63 12 JMP $1263 ; (tiles_draw.l21 + 0)
--------------------------------------------------------------------
tiles_draw0: ; tiles_draw0(u8*,u8*)->void
; 292, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1365 : 18 __ __ CLC
1366 : a5 0d __ LDA P0 ; (dp + 0)
1368 : 69 28 __ ADC #$28
136a : 85 1b __ STA ACCU + 0 
136c : a6 0e __ LDX P1 ; (dp + 1)
136e : 90 02 __ BCC $1372 ; (tiles_draw0.s6 + 0)
.s7:
1370 : e8 __ __ INX
1371 : 18 __ __ CLC
.s6:
1372 : 86 1c __ STX ACCU + 1 
1374 : 69 28 __ ADC #$28
1376 : 85 43 __ STA T2 + 0 
1378 : 90 02 __ BCC $137c ; (tiles_draw0.s8 + 0)
.s9:
137a : e8 __ __ INX
137b : 18 __ __ CLC
.s8:
137c : 86 44 __ STX T2 + 1 
137e : 69 28 __ ADC #$28
1380 : 85 45 __ STA T3 + 0 
1382 : 90 02 __ BCC $1386 ; (tiles_draw0.s10 + 0)
.s11:
1384 : e8 __ __ INX
1385 : 18 __ __ CLC
.s10:
1386 : 86 46 __ STX T3 + 1 
1388 : a9 00 __ LDA #$00
138a : 85 49 __ STA T11 + 0 
138c : 85 1d __ STA ACCU + 2 
138e : a9 01 __ LDA #$01
1390 : 85 1e __ STA ACCU + 3 
1392 : a9 02 __ LDA #$02
1394 : 85 47 __ STA T6 + 0 
1396 : a9 03 __ LDA #$03
1398 : a0 00 __ LDY #$00
.l5:
139a : 85 48 __ STA T7 + 0 
139c : b1 0f __ LDA (P2),y ; (tm + 0)
139e : aa __ __ TAX
139f : bd 40 46 LDA $4640,x ; (xtileset[0][0] + 0)
13a2 : a4 1d __ LDY ACCU + 2 
13a4 : 91 0d __ STA (P0),y ; (dp + 0)
13a6 : bd 40 47 LDA $4740,x ; (xtileset[0][0] + 256)
13a9 : 91 1b __ STA (ACCU + 0),y 
13ab : bd 40 48 LDA $4840,x ; (xtileset[0][0] + 512)
13ae : 91 43 __ STA (T2 + 0),y 
13b0 : bd 40 49 LDA $4940,x ; (xtileset[0][0] + 768)
13b3 : 91 45 __ STA (T3 + 0),y 
13b5 : bd 80 46 LDA $4680,x ; (xtileset[0][0] + 64)
13b8 : a4 1e __ LDY ACCU + 3 
13ba : 91 0d __ STA (P0),y ; (dp + 0)
13bc : bd 80 47 LDA $4780,x ; (xtileset[0][0] + 320)
13bf : 91 1b __ STA (ACCU + 0),y 
13c1 : bd 80 48 LDA $4880,x ; (xtileset[0][0] + 576)
13c4 : 91 43 __ STA (T2 + 0),y 
13c6 : bd 80 49 LDA $4980,x ; (xtileset[0][0] + 832)
13c9 : 91 45 __ STA (T3 + 0),y 
13cb : bd c0 46 LDA $46c0,x ; (xtileset[0][0] + 128)
13ce : a4 47 __ LDY T6 + 0 
13d0 : 91 0d __ STA (P0),y ; (dp + 0)
13d2 : bd c0 47 LDA $47c0,x ; (xtileset[0][0] + 384)
13d5 : 91 1b __ STA (ACCU + 0),y 
13d7 : bd c0 48 LDA $48c0,x ; (xtileset[0][0] + 640)
13da : 91 43 __ STA (T2 + 0),y 
13dc : bd c0 49 LDA $49c0,x ; (xtileset[0][0] + 896)
13df : 91 45 __ STA (T3 + 0),y 
13e1 : bd 00 47 LDA $4700,x ; (xtileset[0][0] + 192)
13e4 : a4 48 __ LDY T7 + 0 
13e6 : 91 0d __ STA (P0),y ; (dp + 0)
13e8 : bd 00 48 LDA $4800,x ; (xtileset[0][0] + 448)
13eb : 91 1b __ STA (ACCU + 0),y 
13ed : bd 00 49 LDA $4900,x ; (xtileset[0][0] + 704)
13f0 : 91 43 __ STA (T2 + 0),y 
13f2 : bd 00 4a LDA $4a00,x ; (xtileset[0][0] + 960)
13f5 : 91 45 __ STA (T3 + 0),y 
13f7 : a5 1d __ LDA ACCU + 2 
13f9 : 69 04 __ ADC #$04
13fb : 85 1d __ STA ACCU + 2 
13fd : 18 __ __ CLC
13fe : a5 1e __ LDA ACCU + 3 
1400 : 69 04 __ ADC #$04
1402 : 85 1e __ STA ACCU + 3 
1404 : 18 __ __ CLC
1405 : a5 47 __ LDA T6 + 0 
1407 : 69 04 __ ADC #$04
1409 : 85 47 __ STA T6 + 0 
140b : 98 __ __ TYA
140c : 18 __ __ CLC
140d : 69 04 __ ADC #$04
140f : e6 49 __ INC T11 + 0 
1411 : a4 49 __ LDY T11 + 0 
1413 : c0 0a __ CPY #$0a
1415 : 90 83 __ BCC $139a ; (tiles_draw0.l5 + 0)
.s3:
1417 : 60 __ __ RTS
--------------------------------------------------------------------
tiles_draw1: ; tiles_draw1(u8*,u8*)->void
; 421, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1418 : 18 __ __ CLC
1419 : a5 0d __ LDA P0 ; (dp + 0)
141b : 69 28 __ ADC #$28
141d : 85 1b __ STA ACCU + 0 
141f : a6 0e __ LDX P1 ; (dp + 1)
1421 : 90 02 __ BCC $1425 ; (tiles_draw1.s6 + 0)
.s7:
1423 : e8 __ __ INX
1424 : 18 __ __ CLC
.s6:
1425 : 86 1c __ STX ACCU + 1 
1427 : 69 28 __ ADC #$28
1429 : 85 43 __ STA T2 + 0 
142b : 90 02 __ BCC $142f ; (tiles_draw1.s8 + 0)
.s9:
142d : e8 __ __ INX
142e : 18 __ __ CLC
.s8:
142f : 86 44 __ STX T2 + 1 
1431 : 69 28 __ ADC #$28
1433 : 85 45 __ STA T3 + 0 
1435 : 90 02 __ BCC $1439 ; (tiles_draw1.s10 + 0)
.s11:
1437 : e8 __ __ INX
1438 : 18 __ __ CLC
.s10:
1439 : 86 46 __ STX T3 + 1 
143b : a9 01 __ LDA #$01
143d : 85 49 __ STA T11 + 0 
143f : 85 1e __ STA ACCU + 3 
1441 : a0 00 __ LDY #$00
1443 : 84 1d __ STY ACCU + 2 
1445 : a9 02 __ LDA #$02
1447 : 85 47 __ STA T6 + 0 
1449 : a9 03 __ LDA #$03
144b : 85 48 __ STA T7 + 0 
144d : b1 0f __ LDA (P2),y ; (tm + 0)
144f : aa __ __ TAX
.l5:
1450 : bd 80 46 LDA $4680,x ; (xtileset[0][0] + 64)
1453 : a4 1d __ LDY ACCU + 2 
1455 : 91 0d __ STA (P0),y ; (dp + 0)
1457 : bd 80 47 LDA $4780,x ; (xtileset[0][0] + 320)
145a : 91 1b __ STA (ACCU + 0),y 
145c : bd 80 48 LDA $4880,x ; (xtileset[0][0] + 576)
145f : 91 43 __ STA (T2 + 0),y 
1461 : bd 80 49 LDA $4980,x ; (xtileset[0][0] + 832)
1464 : 91 45 __ STA (T3 + 0),y 
1466 : bd c0 46 LDA $46c0,x ; (xtileset[0][0] + 128)
1469 : a4 1e __ LDY ACCU + 3 
146b : 91 0d __ STA (P0),y ; (dp + 0)
146d : bd c0 47 LDA $47c0,x ; (xtileset[0][0] + 384)
1470 : 91 1b __ STA (ACCU + 0),y 
1472 : bd c0 48 LDA $48c0,x ; (xtileset[0][0] + 640)
1475 : 91 43 __ STA (T2 + 0),y 
1477 : bd c0 49 LDA $49c0,x ; (xtileset[0][0] + 896)
147a : 91 45 __ STA (T3 + 0),y 
147c : bd 00 47 LDA $4700,x ; (xtileset[0][0] + 192)
147f : a4 47 __ LDY T6 + 0 
1481 : 91 0d __ STA (P0),y ; (dp + 0)
1483 : bd 00 48 LDA $4800,x ; (xtileset[0][0] + 448)
1486 : 91 1b __ STA (ACCU + 0),y 
1488 : bd 00 49 LDA $4900,x ; (xtileset[0][0] + 704)
148b : 91 43 __ STA (T2 + 0),y 
148d : bd 00 4a LDA $4a00,x ; (xtileset[0][0] + 960)
1490 : 91 45 __ STA (T3 + 0),y 
1492 : a4 49 __ LDY T11 + 0 
1494 : b1 0f __ LDA (P2),y ; (tm + 0)
1496 : aa __ __ TAX
1497 : bd 40 46 LDA $4640,x ; (xtileset[0][0] + 0)
149a : a4 48 __ LDY T7 + 0 
149c : 91 0d __ STA (P0),y ; (dp + 0)
149e : bd 40 47 LDA $4740,x ; (xtileset[0][0] + 256)
14a1 : 91 1b __ STA (ACCU + 0),y 
14a3 : bd 40 48 LDA $4840,x ; (xtileset[0][0] + 512)
14a6 : 91 43 __ STA (T2 + 0),y 
14a8 : bd 40 49 LDA $4940,x ; (xtileset[0][0] + 768)
14ab : 91 45 __ STA (T3 + 0),y 
14ad : a5 1d __ LDA ACCU + 2 
14af : 69 04 __ ADC #$04
14b1 : 85 1d __ STA ACCU + 2 
14b3 : 18 __ __ CLC
14b4 : a5 1e __ LDA ACCU + 3 
14b6 : 69 04 __ ADC #$04
14b8 : 85 1e __ STA ACCU + 3 
14ba : 18 __ __ CLC
14bb : a5 47 __ LDA T6 + 0 
14bd : 69 04 __ ADC #$04
14bf : 85 47 __ STA T6 + 0 
14c1 : 98 __ __ TYA
14c2 : 18 __ __ CLC
14c3 : 69 04 __ ADC #$04
14c5 : 85 48 __ STA T7 + 0 
14c7 : e6 49 __ INC T11 + 0 
14c9 : a5 49 __ LDA T11 + 0 
14cb : c9 0b __ CMP #$0b
14cd : 90 81 __ BCC $1450 ; (tiles_draw1.l5 + 0)
.s3:
14cf : 60 __ __ RTS
--------------------------------------------------------------------
tiles_draw2: ; tiles_draw2(u8*,u8*)->void
; 382, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
14d0 : 18 __ __ CLC
14d1 : a5 0d __ LDA P0 ; (dp + 0)
14d3 : 69 28 __ ADC #$28
14d5 : 85 1b __ STA ACCU + 0 
14d7 : a6 0e __ LDX P1 ; (dp + 1)
14d9 : 90 02 __ BCC $14dd ; (tiles_draw2.s6 + 0)
.s7:
14db : e8 __ __ INX
14dc : 18 __ __ CLC
.s6:
14dd : 86 1c __ STX ACCU + 1 
14df : 69 28 __ ADC #$28
14e1 : 85 43 __ STA T2 + 0 
14e3 : 90 02 __ BCC $14e7 ; (tiles_draw2.s8 + 0)
.s9:
14e5 : e8 __ __ INX
14e6 : 18 __ __ CLC
.s8:
14e7 : 86 44 __ STX T2 + 1 
14e9 : 69 28 __ ADC #$28
14eb : 85 45 __ STA T3 + 0 
14ed : 90 02 __ BCC $14f1 ; (tiles_draw2.s10 + 0)
.s11:
14ef : e8 __ __ INX
14f0 : 18 __ __ CLC
.s10:
14f1 : 86 46 __ STX T3 + 1 
14f3 : a9 01 __ LDA #$01
14f5 : 85 49 __ STA T11 + 0 
14f7 : 85 1e __ STA ACCU + 3 
14f9 : a0 00 __ LDY #$00
14fb : 84 1d __ STY ACCU + 2 
14fd : a9 02 __ LDA #$02
14ff : 85 47 __ STA T6 + 0 
1501 : a9 03 __ LDA #$03
1503 : 85 48 __ STA T7 + 0 
1505 : b1 0f __ LDA (P2),y ; (tm + 0)
1507 : aa __ __ TAX
.l5:
1508 : bd c0 46 LDA $46c0,x ; (xtileset[0][0] + 128)
150b : a4 1d __ LDY ACCU + 2 
150d : 91 0d __ STA (P0),y ; (dp + 0)
150f : bd c0 47 LDA $47c0,x ; (xtileset[0][0] + 384)
1512 : 91 1b __ STA (ACCU + 0),y 
1514 : bd c0 48 LDA $48c0,x ; (xtileset[0][0] + 640)
1517 : 91 43 __ STA (T2 + 0),y 
1519 : bd c0 49 LDA $49c0,x ; (xtileset[0][0] + 896)
151c : 91 45 __ STA (T3 + 0),y 
151e : bd 00 47 LDA $4700,x ; (xtileset[0][0] + 192)
1521 : a4 1e __ LDY ACCU + 3 
1523 : 91 0d __ STA (P0),y ; (dp + 0)
1525 : bd 00 48 LDA $4800,x ; (xtileset[0][0] + 448)
1528 : 91 1b __ STA (ACCU + 0),y 
152a : bd 00 49 LDA $4900,x ; (xtileset[0][0] + 704)
152d : 91 43 __ STA (T2 + 0),y 
152f : bd 00 4a LDA $4a00,x ; (xtileset[0][0] + 960)
1532 : 91 45 __ STA (T3 + 0),y 
1534 : a4 49 __ LDY T11 + 0 
1536 : b1 0f __ LDA (P2),y ; (tm + 0)
1538 : aa __ __ TAX
1539 : bd 40 46 LDA $4640,x ; (xtileset[0][0] + 0)
153c : a4 47 __ LDY T6 + 0 
153e : 91 0d __ STA (P0),y ; (dp + 0)
1540 : bd 40 47 LDA $4740,x ; (xtileset[0][0] + 256)
1543 : 91 1b __ STA (ACCU + 0),y 
1545 : bd 40 48 LDA $4840,x ; (xtileset[0][0] + 512)
1548 : 91 43 __ STA (T2 + 0),y 
154a : bd 40 49 LDA $4940,x ; (xtileset[0][0] + 768)
154d : 91 45 __ STA (T3 + 0),y 
154f : bd 80 46 LDA $4680,x ; (xtileset[0][0] + 64)
1552 : a4 48 __ LDY T7 + 0 
1554 : 91 0d __ STA (P0),y ; (dp + 0)
1556 : bd 80 47 LDA $4780,x ; (xtileset[0][0] + 320)
1559 : 91 1b __ STA (ACCU + 0),y 
155b : bd 80 48 LDA $4880,x ; (xtileset[0][0] + 576)
155e : 91 43 __ STA (T2 + 0),y 
1560 : bd 80 49 LDA $4980,x ; (xtileset[0][0] + 832)
1563 : 91 45 __ STA (T3 + 0),y 
1565 : a5 1d __ LDA ACCU + 2 
1567 : 69 04 __ ADC #$04
1569 : 85 1d __ STA ACCU + 2 
156b : 18 __ __ CLC
156c : a5 1e __ LDA ACCU + 3 
156e : 69 04 __ ADC #$04
1570 : 85 1e __ STA ACCU + 3 
1572 : 18 __ __ CLC
1573 : a5 47 __ LDA T6 + 0 
1575 : 69 04 __ ADC #$04
1577 : 85 47 __ STA T6 + 0 
1579 : 98 __ __ TYA
157a : 18 __ __ CLC
157b : 69 04 __ ADC #$04
157d : 85 48 __ STA T7 + 0 
157f : e6 49 __ INC T11 + 0 
1581 : a5 49 __ LDA T11 + 0 
1583 : c9 0b __ CMP #$0b
1585 : 90 81 __ BCC $1508 ; (tiles_draw2.l5 + 0)
.s3:
1587 : 60 __ __ RTS
--------------------------------------------------------------------
tiles_draw3: ; tiles_draw3(u8*,u8*)->void
; 340, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1588 : 18 __ __ CLC
1589 : a5 0d __ LDA P0 ; (dp + 0)
158b : 69 28 __ ADC #$28
158d : 85 1b __ STA ACCU + 0 
158f : a6 0e __ LDX P1 ; (dp + 1)
1591 : 90 02 __ BCC $1595 ; (tiles_draw3.s6 + 0)
.s7:
1593 : e8 __ __ INX
1594 : 18 __ __ CLC
.s6:
1595 : 86 1c __ STX ACCU + 1 
1597 : 69 28 __ ADC #$28
1599 : 85 43 __ STA T2 + 0 
159b : 90 02 __ BCC $159f ; (tiles_draw3.s8 + 0)
.s9:
159d : e8 __ __ INX
159e : 18 __ __ CLC
.s8:
159f : 86 44 __ STX T2 + 1 
15a1 : 69 28 __ ADC #$28
15a3 : 85 45 __ STA T3 + 0 
15a5 : 90 02 __ BCC $15a9 ; (tiles_draw3.s10 + 0)
.s11:
15a7 : e8 __ __ INX
15a8 : 18 __ __ CLC
.s10:
15a9 : 86 46 __ STX T3 + 1 
15ab : a9 01 __ LDA #$01
15ad : 85 49 __ STA T11 + 0 
15af : 85 1e __ STA ACCU + 3 
15b1 : a0 00 __ LDY #$00
15b3 : 84 1d __ STY ACCU + 2 
15b5 : a9 02 __ LDA #$02
15b7 : 85 47 __ STA T6 + 0 
15b9 : a9 03 __ LDA #$03
15bb : 85 48 __ STA T7 + 0 
15bd : b1 0f __ LDA (P2),y ; (tm + 0)
15bf : aa __ __ TAX
.l5:
15c0 : bd 00 47 LDA $4700,x ; (xtileset[0][0] + 192)
15c3 : a4 1d __ LDY ACCU + 2 
15c5 : 91 0d __ STA (P0),y ; (dp + 0)
15c7 : bd 00 48 LDA $4800,x ; (xtileset[0][0] + 448)
15ca : 91 1b __ STA (ACCU + 0),y 
15cc : bd 00 49 LDA $4900,x ; (xtileset[0][0] + 704)
15cf : 91 43 __ STA (T2 + 0),y 
15d1 : bd 00 4a LDA $4a00,x ; (xtileset[0][0] + 960)
15d4 : 91 45 __ STA (T3 + 0),y 
15d6 : a4 49 __ LDY T11 + 0 
15d8 : b1 0f __ LDA (P2),y ; (tm + 0)
15da : aa __ __ TAX
15db : bd 40 46 LDA $4640,x ; (xtileset[0][0] + 0)
15de : a4 1e __ LDY ACCU + 3 
15e0 : 91 0d __ STA (P0),y ; (dp + 0)
15e2 : bd 40 47 LDA $4740,x ; (xtileset[0][0] + 256)
15e5 : 91 1b __ STA (ACCU + 0),y 
15e7 : bd 40 48 LDA $4840,x ; (xtileset[0][0] + 512)
15ea : 91 43 __ STA (T2 + 0),y 
15ec : bd 40 49 LDA $4940,x ; (xtileset[0][0] + 768)
15ef : 91 45 __ STA (T3 + 0),y 
15f1 : bd 80 46 LDA $4680,x ; (xtileset[0][0] + 64)
15f4 : a4 47 __ LDY T6 + 0 
15f6 : 91 0d __ STA (P0),y ; (dp + 0)
15f8 : bd 80 47 LDA $4780,x ; (xtileset[0][0] + 320)
15fb : 91 1b __ STA (ACCU + 0),y 
15fd : bd 80 48 LDA $4880,x ; (xtileset[0][0] + 576)
1600 : 91 43 __ STA (T2 + 0),y 
1602 : bd 80 49 LDA $4980,x ; (xtileset[0][0] + 832)
1605 : 91 45 __ STA (T3 + 0),y 
1607 : bd c0 46 LDA $46c0,x ; (xtileset[0][0] + 128)
160a : a4 48 __ LDY T7 + 0 
160c : 91 0d __ STA (P0),y ; (dp + 0)
160e : bd c0 47 LDA $47c0,x ; (xtileset[0][0] + 384)
1611 : 91 1b __ STA (ACCU + 0),y 
1613 : bd c0 48 LDA $48c0,x ; (xtileset[0][0] + 640)
1616 : 91 43 __ STA (T2 + 0),y 
1618 : bd c0 49 LDA $49c0,x ; (xtileset[0][0] + 896)
161b : 91 45 __ STA (T3 + 0),y 
161d : a5 1d __ LDA ACCU + 2 
161f : 69 04 __ ADC #$04
1621 : 85 1d __ STA ACCU + 2 
1623 : 18 __ __ CLC
1624 : a5 1e __ LDA ACCU + 3 
1626 : 69 04 __ ADC #$04
1628 : 85 1e __ STA ACCU + 3 
162a : 18 __ __ CLC
162b : a5 47 __ LDA T6 + 0 
162d : 69 04 __ ADC #$04
162f : 85 47 __ STA T6 + 0 
1631 : 98 __ __ TYA
1632 : 18 __ __ CLC
1633 : 69 04 __ ADC #$04
1635 : 85 48 __ STA T7 + 0 
1637 : e6 49 __ INC T11 + 0 
1639 : a5 49 __ LDA T11 + 0 
163b : c9 0b __ CMP #$0b
163d : 90 81 __ BCC $15c0 ; (tiles_draw3.l5 + 0)
.s3:
163f : 60 __ __ RTS
--------------------------------------------------------------------
player_control: ; player_control()->void
; 690, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1640 : 20 ce 17 JSR $17ce ; (joy_poll.s4 + 0)
1643 : ad 3e 46 LDA $463e ; (joyx[0] + 0)
1646 : f0 03 __ BEQ $164b ; (player_control.s5 + 0)
.s45:
1648 : 8d af 4d STA $4daf ; (player.ax + 0)
.s5:
164b : ad 3c 46 LDA $463c ; (joyy[0] + 0)
164e : 0a __ __ ASL
164f : 18 __ __ CLC
1650 : 6d b1 4d ADC $4db1 ; (player.spy + 0)
1653 : 8d b1 4d STA $4db1 ; (player.spy + 0)
1656 : c9 0e __ CMP #$0e
1658 : b0 07 __ BCS $1661 ; (player_control.s6 + 0)
.s44:
165a : a9 0e __ LDA #$0e
.s47:
165c : 8d b1 4d STA $4db1 ; (player.spy + 0)
165f : 90 07 __ BCC $1668 ; (player_control.s7 + 0)
.s6:
1661 : a9 ad __ LDA #$ad
1663 : cd b1 4d CMP $4db1 ; (player.spy + 0)
1666 : 90 f4 __ BCC $165c ; (player_control.s47 + 0)
.s7:
1668 : ad af 4d LDA $4daf ; (player.ax + 0)
166b : 30 03 __ BMI $1670 ; (player_control.s28 + 0)
166d : 4c a3 17 JMP $17a3 ; (player_control.s43 + 0)
.s28:
1670 : ad ae 4d LDA $4dae ; (player.vpx + 0)
1673 : 10 04 __ BPL $1679 ; (player_control.s35 + 0)
.s49:
1675 : c9 e1 __ CMP #$e1
1677 : 90 03 __ BCC $167c ; (player_control.s29 + 0)
.s35:
1679 : ce ae 4d DEC $4dae ; (player.vpx + 0)
.s29:
167c : ae b0 4d LDX $4db0 ; (player.aphase + 0)
167f : e0 10 __ CPX #$10
1681 : b0 06 __ BCS $1689 ; (player_control.s30 + 0)
.s34:
1683 : e8 __ __ INX
.s33:
1684 : 8e b0 4d STX $4db0 ; (player.aphase + 0)
1687 : 90 0c __ BCC $1695 ; (player_control.s8 + 0)
.s30:
1689 : e0 11 __ CPX #$11
168b : 90 08 __ BCC $1695 ; (player_control.s8 + 0)
.s31:
168d : e0 20 __ CPX #$20
168f : b0 04 __ BCS $1695 ; (player_control.s8 + 0)
.s32:
1691 : ca __ __ DEX
1692 : 8e b0 4d STX $4db0 ; (player.aphase + 0)
.s8:
1695 : ad b0 4d LDA $4db0 ; (player.aphase + 0)
1698 : 29 1f __ AND #$1f
169a : 85 45 __ STA T2 + 0 
169c : 8d b0 4d STA $4db0 ; (player.aphase + 0)
169f : ad ae 4d LDA $4dae ; (player.vpx + 0)
16a2 : 85 47 __ STA T3 + 0 
16a4 : 85 43 __ STA T0 + 0 
16a6 : ad b2 4d LDA $4db2 ; (player.fdelay + 0)
16a9 : 85 1b __ STA ACCU + 0 
16ab : ad cb 45 LDA $45cb ; (vspriteScreen + 0)
16ae : 85 48 __ STA T1 + 0 
16b0 : ad cc 45 LDA $45cc ; (vspriteScreen + 1)
16b3 : 85 49 __ STA T1 + 1 
16b5 : a5 45 __ LDA T2 + 0 
16b7 : 4a __ __ LSR
16b8 : 09 40 __ ORA #$40
16ba : a0 00 __ LDY #$00
16bc : 91 48 __ STA (T1 + 0),y 
16be : 09 10 __ ORA #$10
16c0 : a0 07 __ LDY #$07
16c2 : 91 48 __ STA (T1 + 0),y 
16c4 : 06 47 __ ASL T3 + 0 
16c6 : a9 00 __ LDA #$00
16c8 : 69 ff __ ADC #$ff
16ca : 49 ff __ EOR #$ff
16cc : 06 43 __ ASL T0 + 0 
16ce : 2a __ __ ROL
16cf : 06 43 __ ASL T0 + 0 
16d1 : 2a __ __ ROL
16d2 : 85 44 __ STA T0 + 1 
16d4 : 38 __ __ SEC
16d5 : a9 94 __ LDA #$94
16d7 : e5 43 __ SBC T0 + 0 
16d9 : 85 48 __ STA T1 + 0 
16db : a9 00 __ LDA #$00
16dd : e5 44 __ SBC T0 + 1 
16df : 85 49 __ STA T1 + 1 
16e1 : a6 1b __ LDX ACCU + 0 
16e3 : f0 07 __ BEQ $16ec ; (player_control.s9 + 0)
.s27:
16e5 : ca __ __ DEX
16e6 : 8e b2 4d STX $4db2 ; (player.fdelay + 0)
16e9 : 4c 5c 17 JMP $175c ; (player_control.s10 + 0)
.s9:
16ec : ad b3 4d LDA $4db3 ; (joyb[0] + 0)
16ef : f0 6b __ BEQ $175c ; (player_control.s10 + 0)
.s15:
16f1 : a5 45 __ LDA T2 + 0 
16f3 : c9 04 __ CMP #$04
16f5 : 90 04 __ BCC $16fb ; (player_control.s26 + 0)
.s16:
16f7 : c9 1d __ CMP #$1d
16f9 : 90 04 __ BCC $16ff ; (player_control.s17 + 0)
.s26:
16fb : a9 01 __ LDA #$01
16fd : d0 0a __ BNE $1709 ; (player_control.s21 + 0)
.s17:
16ff : c9 0d __ CMP #$0d
1701 : 90 29 __ BCC $172c ; (player_control.s18 + 0)
.s19:
1703 : c9 14 __ CMP #$14
1705 : b0 25 __ BCS $172c ; (player_control.s18 + 0)
.s20:
1707 : a9 ff __ LDA #$ff
.s21:
1709 : 85 10 __ STA P3 
170b : ad b1 4d LDA $4db1 ; (player.spy + 0)
170e : 85 0f __ STA P2 
1710 : a5 48 __ LDA T1 + 0 
1712 : 85 0d __ STA P0 
1714 : a5 49 __ LDA T1 + 1 
1716 : 85 0e __ STA P1 
1718 : 20 0d 18 JSR $180d ; (shot_add.s4 + 0)
171b : ad 7f 4d LDA $4d7f ; (channels[0].state + 0)
171e : d0 04 __ BNE $1724 ; (player_control.s24 + 0)
.s22:
1720 : a9 03 __ LDA #$03
1722 : d0 11 __ BNE $1735 ; (player_control.s23 + 0)
.s24:
1724 : ad bc 45 LDA $45bc ; (SIDFXFire[0].priority + 0)
1727 : cd 79 4d CMP $4d79 ; (channels[0].priority + 0)
172a : b0 07 __ BCS $1733 ; (player_control.s25 + 0)
.s18:
172c : a9 06 __ LDA #$06
172e : 8d b2 4d STA $4db2 ; (player.fdelay + 0)
1731 : d0 29 __ BNE $175c ; (player_control.s10 + 0)
.s25:
1733 : a9 01 __ LDA #$01
.s23:
1735 : a2 06 __ LDX #$06
1737 : 8e b2 4d STX $4db2 ; (player.fdelay + 0)
173a : a2 01 __ LDX #$01
173c : 8e 76 4d STX $4d76 ; (channels[0].delay + 0)
173f : ae bc 45 LDX $45bc ; (SIDFXFire[0].priority + 0)
1742 : 8e 79 4d STX $4d79 ; (channels[0].priority + 0)
1745 : a2 00 __ LDX #$00
1747 : 8e 7f 4d STX $4d7f ; (channels[0].state + 0)
174a : a2 af __ LDX #$af
174c : 8e 70 4d STX $4d70 ; (channels[0].com + 0)
174f : a2 45 __ LDX #$45
1751 : 8e 73 4d STX $4d73 ; (channels[0].com + 0)
1754 : a2 00 __ LDX #$00
1756 : 8e 7c 4d STX $4d7c ; (channels[0].cnt + 0)
1759 : 8d 7f 4d STA $4d7f ; (channels[0].state + 0)
.s10:
175c : ad b1 4d LDA $4db1 ; (player.spy + 0)
175f : 18 __ __ CLC
1760 : 69 32 __ ADC #$32
1762 : 8d 01 d0 STA $d001 
1765 : a8 __ __ TAY
1766 : 18 __ __ CLC
1767 : a5 48 __ LDA T1 + 0 
1769 : 69 18 __ ADC #$18
176b : 85 43 __ STA T0 + 0 
176d : 8d 00 d0 STA $d000 
1770 : a5 49 __ LDA T1 + 1 
1772 : 69 00 __ ADC #$00
1774 : 85 44 __ STA T0 + 1 
1776 : 4a __ __ LSR
1777 : ad 10 d0 LDA $d010 
177a : 09 01 __ ORA #$01
177c : b0 02 __ BCS $1780 ; (player_control.s12 + 0)
.s11:
177e : 29 fe __ AND #$fe
.s12:
1780 : 8d 10 d0 STA $d010 
1783 : aa __ __ TAX
1784 : 98 __ __ TYA
1785 : 18 __ __ CLC
1786 : 69 08 __ ADC #$08
1788 : 8d 0f d0 STA $d00f 
178b : 18 __ __ CLC
178c : a5 43 __ LDA T0 + 0 
178e : 69 08 __ ADC #$08
1790 : 8d 0e d0 STA $d00e 
1793 : a5 44 __ LDA T0 + 1 
1795 : 69 00 __ ADC #$00
1797 : 4a __ __ LSR
1798 : 8a __ __ TXA
1799 : 09 80 __ ORA #$80
179b : b0 02 __ BCS $179f ; (player_control.s14 + 0)
.s13:
179d : 29 7f __ AND #$7f
.s14:
179f : 8d 10 d0 STA $d010 
.s3:
17a2 : 60 __ __ RTS
.s43:
17a3 : d0 03 __ BNE $17a8 ; (player_control.s36 + 0)
17a5 : 4c 95 16 JMP $1695 ; (player_control.s8 + 0)
.s36:
17a8 : ad ae 4d LDA $4dae ; (player.vpx + 0)
17ab : 30 04 __ BMI $17b1 ; (player_control.s42 + 0)
.s48:
17ad : c9 20 __ CMP #$20
17af : b0 03 __ BCS $17b4 ; (player_control.s37 + 0)
.s42:
17b1 : ee ae 4d INC $4dae ; (player.vpx + 0)
.s37:
17b4 : ad b0 4d LDA $4db0 ; (player.aphase + 0)
17b7 : f0 ec __ BEQ $17a5 ; (player_control.s43 + 2)
.s38:
17b9 : c9 10 __ CMP #$10
17bb : 90 0c __ BCC $17c9 ; (player_control.s41 + 0)
.s39:
17bd : c9 20 __ CMP #$20
17bf : b0 e4 __ BCS $17a5 ; (player_control.s43 + 2)
.s40:
17c1 : 69 01 __ ADC #$01
.s46:
17c3 : 8d b0 4d STA $4db0 ; (player.aphase + 0)
17c6 : 4c 95 16 JMP $1695 ; (player_control.s8 + 0)
.s41:
17c9 : 69 ff __ ADC #$ff
17cb : 4c c3 17 JMP $17c3 ; (player_control.s46 + 0)
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
17ce : ad 00 dc LDA $dc00 
17d1 : a8 __ __ TAY
17d2 : 29 10 __ AND #$10
17d4 : f0 04 __ BEQ $17da ; (joy_poll.s10 + 0)
.s11:
17d6 : a9 00 __ LDA #$00
17d8 : f0 02 __ BEQ $17dc ; (joy_poll.s12 + 0)
.s10:
17da : a9 01 __ LDA #$01
.s12:
17dc : 8d b3 4d STA $4db3 ; (joyb[0] + 0)
17df : 98 __ __ TYA
17e0 : 4a __ __ LSR
17e1 : b0 04 __ BCS $17e7 ; (joy_poll.s9 + 0)
.s5:
17e3 : a9 ff __ LDA #$ff
17e5 : 90 0b __ BCC $17f2 ; (joy_poll.s6 + 0)
.s9:
17e7 : 98 __ __ TYA
17e8 : 29 02 __ AND #$02
17ea : f0 04 __ BEQ $17f0 ; (joy_poll.s13 + 0)
.s14:
17ec : a9 00 __ LDA #$00
17ee : b0 02 __ BCS $17f2 ; (joy_poll.s6 + 0)
.s13:
17f0 : a9 01 __ LDA #$01
.s6:
17f2 : 8d 3c 46 STA $463c ; (joyy[0] + 0)
17f5 : 98 __ __ TYA
17f6 : 29 04 __ AND #$04
17f8 : d0 06 __ BNE $1800 ; (joy_poll.s8 + 0)
.s7:
17fa : a9 ff __ LDA #$ff
.s3:
17fc : 8d 3e 46 STA $463e ; (joyx[0] + 0)
17ff : 60 __ __ RTS
.s8:
1800 : 98 __ __ TYA
1801 : 29 08 __ AND #$08
1803 : f0 04 __ BEQ $1809 ; (joy_poll.s15 + 0)
.s16:
1805 : a9 00 __ LDA #$00
1807 : f0 f3 __ BEQ $17fc ; (joy_poll.s3 + 0)
.s15:
1809 : a9 01 __ LDA #$01
180b : d0 ef __ BNE $17fc ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
shot_add: ; shot_add(i16,u8,i8)->void
; 502, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
180d : ad 3a 46 LDA $463a ; (freeShot + 0)
1810 : 85 1b __ STA ACCU + 0 
1812 : ad 3b 46 LDA $463b ; (freeShot + 1)
1815 : 85 1c __ STA ACCU + 1 
1817 : a0 05 __ LDY #$05
1819 : b1 1b __ LDA (ACCU + 0),y 
181b : 8d 3a 46 STA $463a ; (freeShot + 0)
181e : c8 __ __ INY
181f : b1 1b __ LDA (ACCU + 0),y 
1821 : 8d 3b 46 STA $463b ; (freeShot + 1)
1824 : a5 0f __ LDA P2 ; (sy + 0)
1826 : 38 __ __ SEC
1827 : e9 0e __ SBC #$0e
1829 : aa __ __ TAX
182a : 29 07 __ AND #$07
182c : 85 1e __ STA ACCU + 3 
182e : 8a __ __ TXA
182f : 29 18 __ AND #$18
1831 : 4a __ __ LSR
1832 : 4a __ __ LSR
1833 : 4a __ __ LSR
1834 : 85 43 __ STA T3 + 0 
1836 : 8a __ __ TXA
1837 : 4a __ __ LSR
1838 : 4a __ __ LSR
1839 : 4a __ __ LSR
183a : 4a __ __ LSR
183b : 4a __ __ LSR
183c : 85 1d __ STA ACCU + 2 
183e : a9 4f __ LDA #$4f
1840 : a2 00 __ LDX #$00
1842 : 4c 49 18 JMP $1849 ; (shot_add.l5 + 0)
.s9:
1845 : a5 47 __ LDA T5 + 1 
1847 : a6 46 __ LDX T5 + 0 
.l5:
1849 : 86 44 __ STX T4 + 0 
184b : 85 45 __ STA T4 + 1 
184d : a0 05 __ LDY #$05
184f : b1 44 __ LDA (T4 + 0),y 
1851 : 85 46 __ STA T5 + 0 
1853 : c8 __ __ INY
1854 : b1 44 __ LDA (T4 + 0),y 
1856 : 85 47 __ STA T5 + 1 
1858 : a0 00 __ LDY #$00
185a : b1 46 __ LDA (T5 + 0),y 
185c : c5 1d __ CMP ACCU + 2 
185e : 90 e5 __ BCC $1845 ; (shot_add.s9 + 0)
.s6:
1860 : a5 1d __ LDA ACCU + 2 
1862 : 91 1b __ STA (ACCU + 0),y 
1864 : a5 1e __ LDA ACCU + 3 
1866 : a0 02 __ LDY #$02
1868 : 91 1b __ STA (ACCU + 0),y 
186a : a5 10 __ LDA P3 ; (dx + 0)
186c : a0 04 __ LDY #$04
186e : 91 1b __ STA (ACCU + 0),y 
1870 : a5 46 __ LDA T5 + 0 
1872 : c8 __ __ INY
1873 : 91 1b __ STA (ACCU + 0),y 
1875 : a5 47 __ LDA T5 + 1 
1877 : c8 __ __ INY
1878 : 91 1b __ STA (ACCU + 0),y 
187a : a5 1b __ LDA ACCU + 0 
187c : 88 __ __ DEY
187d : 91 44 __ STA (T4 + 0),y 
187f : a5 1c __ LDA ACCU + 1 
1881 : c8 __ __ INY
1882 : 91 44 __ STA (T4 + 0),y 
1884 : a6 43 __ LDX T3 + 0 
1886 : bd f6 0b LDA $0bf6,x ; (__multab40L + 0)
1889 : 85 1d __ STA ACCU + 2 
188b : 24 10 __ BIT P3 ; (dx + 0)
188d : 10 1d __ BPL $18ac ; (shot_add.s7 + 0)
.s8:
188f : a5 0e __ LDA P1 ; (sx + 1)
1891 : 4a __ __ LSR
1892 : 66 0d __ ROR P0 ; (sx + 0)
1894 : 4a __ __ LSR
1895 : 66 0d __ ROR P0 ; (sx + 0)
1897 : 4a __ __ LSR
1898 : 66 0d __ ROR P0 ; (sx + 0)
189a : 38 __ __ SEC
189b : a5 0d __ LDA P0 ; (sx + 0)
189d : e9 01 __ SBC #$01
189f : a0 03 __ LDY #$03
18a1 : 91 1b __ STA (ACCU + 0),y 
18a3 : 18 __ __ CLC
18a4 : a5 0d __ LDA P0 ; (sx + 0)
18a6 : 65 1d __ ADC ACCU + 2 
18a8 : a0 01 __ LDY #$01
18aa : d0 23 __ BNE $18cf ; (shot_add.s3 + 0)
.s7:
18ac : a5 0d __ LDA P0 ; (sx + 0)
18ae : 69 17 __ ADC #$17
18b0 : 85 0d __ STA P0 ; (sx + 0)
18b2 : a5 0e __ LDA P1 ; (sx + 1)
18b4 : 69 00 __ ADC #$00
18b6 : 4a __ __ LSR
18b7 : 66 0d __ ROR P0 ; (sx + 0)
18b9 : 4a __ __ LSR
18ba : 66 0d __ ROR P0 ; (sx + 0)
18bc : 4a __ __ LSR
18bd : 66 0d __ ROR P0 ; (sx + 0)
18bf : 18 __ __ CLC
18c0 : a5 0d __ LDA P0 ; (sx + 0)
18c2 : 65 1d __ ADC ACCU + 2 
18c4 : a0 01 __ LDY #$01
18c6 : 91 1b __ STA (ACCU + 0),y 
18c8 : 38 __ __ SEC
18c9 : a9 27 __ LDA #$27
18cb : e5 0d __ SBC P0 ; (sx + 0)
18cd : a0 03 __ LDY #$03
.s3:
18cf : 91 1b __ STA (ACCU + 0),y 
18d1 : 60 __ __ RTS
--------------------------------------------------------------------
enemies_spawn: ; enemies_spawn()->void
; 834, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
18d2 : a9 0e __ LDA #$0e
18d4 : 85 13 __ STA P6 
18d6 : 20 9e 0d JSR $0d9e ; (rand.s4 + 0)
18d9 : ad a9 4d LDA $4da9 ; (game.ecount + 0)
18dc : 85 44 __ STA T7 + 0 
18de : 85 1c __ STA ACCU + 1 
18e0 : a8 __ __ TAY
18e1 : 0a __ __ ASL
18e2 : 0a __ __ ASL
18e3 : 0a __ __ ASL
18e4 : aa __ __ TAX
18e5 : a9 80 __ LDA #$80
18e7 : 9d b9 4d STA $4db9,x ; (enemies[0].state + 0)
18ea : b9 fa 0b LDA $0bfa,y ; (__multab32L + 0)
18ed : 09 1d __ ORA #$1d
18ef : 85 43 __ STA T3 + 0 
18f1 : 9d b7 4d STA $4db7,x ; (enemies[0].py + 0)
18f4 : a5 1b __ LDA ACCU + 0 
18f6 : 29 03 __ AND #$03
18f8 : 69 01 __ ADC #$01
18fa : 2c ae 4d BIT $4dae ; (player.vpx + 0)
18fd : 30 1c __ BMI $191b ; (enemies_spawn.s5 + 0)
.s6:
18ff : 85 1d __ STA ACCU + 2 
1901 : a9 00 __ LDA #$00
1903 : 85 1e __ STA ACCU + 3 
1905 : 38 __ __ SEC
1906 : e5 1d __ SBC ACCU + 2 
1908 : 9d b8 4d STA $4db8,x ; (enemies[0].dx + 0)
190b : ad ac 4d LDA $4dac ; (player.spx + 0)
190e : 18 __ __ CLC
190f : 69 40 __ ADC #$40
1911 : 85 1d __ STA ACCU + 2 
1913 : ad ad 4d LDA $4dad ; (player.spx + 1)
1916 : 69 01 __ ADC #$01
1918 : 4c 2e 19 JMP $192e ; (enemies_spawn.s7 + 0)
.s5:
191b : a0 01 __ LDY #$01
191d : 84 1e __ STY ACCU + 3 
191f : 9d b8 4d STA $4db8,x ; (enemies[0].dx + 0)
1922 : ad ac 4d LDA $4dac ; (player.spx + 0)
1925 : e9 37 __ SBC #$37
1927 : 85 1d __ STA ACCU + 2 
1929 : ad ad 4d LDA $4dad ; (player.spx + 1)
192c : e9 00 __ SBC #$00
.s7:
192e : a8 __ __ TAY
192f : a5 1b __ LDA ACCU + 0 
1931 : 29 3e __ AND #$3e
1933 : 4a __ __ LSR
1934 : 65 1d __ ADC ACCU + 2 
1936 : 85 1b __ STA ACCU + 0 
1938 : 9d b5 4d STA $4db5,x ; (enemies[0].px + 0)
193b : 98 __ __ TYA
193c : 69 00 __ ADC #$00
193e : 9d b6 4d STA $4db6,x ; (enemies[0].px + 1)
1941 : a8 __ __ TAY
1942 : a5 1e __ LDA ACCU + 3 
1944 : c9 01 __ CMP #$01
1946 : a9 00 __ LDA #$00
1948 : 85 11 __ STA P4 
194a : 69 ff __ ADC #$ff
194c : 29 01 __ AND #$01
194e : 49 61 __ EOR #$61
1950 : 85 12 __ STA P5 
1952 : 18 __ __ CLC
1953 : a5 1c __ LDA ACCU + 1 
1955 : 69 02 __ ADC #$02
1957 : 85 0d __ STA P0 
1959 : 38 __ __ SEC
195a : a5 1b __ LDA ACCU + 0 
195c : ed ac 4d SBC $4dac ; (player.spx + 0)
195f : aa __ __ TAX
1960 : 98 __ __ TYA
1961 : ed ad 4d SBC $4dad ; (player.spx + 1)
1964 : a8 __ __ TAY
1965 : 8a __ __ TXA
1966 : 18 __ __ CLC
1967 : 69 18 __ ADC #$18
1969 : 85 0e __ STA P1 
196b : 90 02 __ BCC $196f ; (enemies_spawn.s9 + 0)
.s8:
196d : c8 __ __ INY
196e : 18 __ __ CLC
.s9:
196f : 84 0f __ STY P2 
1971 : a5 43 __ LDA T3 + 0 
1973 : 69 32 __ ADC #$32
1975 : 85 10 __ STA P3 
1977 : 20 61 0e JSR $0e61 ; (spr_set.s4 + 0)
197a : a6 44 __ LDX T7 + 0 
197c : e8 __ __ INX
197d : 8e a9 4d STX $4da9 ; (game.ecount + 0)
.s3:
1980 : 60 __ __ RTS
--------------------------------------------------------------------
enemies_move: ; enemies_move()->void
; 785, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1981 : a9 00 __ LDA #$00
1983 : 85 1b __ STA ACCU + 0 
.l5:
1985 : 0a __ __ ASL
1986 : 0a __ __ ASL
1987 : 0a __ __ ASL
1988 : 85 1c __ STA ACCU + 1 
198a : a8 __ __ TAY
198b : b9 b9 4d LDA $4db9,y ; (enemies[0].state + 0)
198e : d0 03 __ BNE $1993 ; (enemies_move.s7 + 0)
1990 : 4c 57 1a JMP $1a57 ; (enemies_move.s6 + 0)
.s7:
1993 : a2 00 __ LDX #$00
1995 : b9 b8 4d LDA $4db8,y ; (enemies[0].dx + 0)
1998 : 10 01 __ BPL $199b ; (enemies_move.s21 + 0)
.s20:
199a : ca __ __ DEX
.s21:
199b : 18 __ __ CLC
199c : 79 b5 4d ADC $4db5,y ; (enemies[0].px + 0)
199f : 85 43 __ STA T2 + 0 
19a1 : 99 b5 4d STA $4db5,y ; (enemies[0].px + 0)
19a4 : 8a __ __ TXA
19a5 : 79 b6 4d ADC $4db6,y ; (enemies[0].px + 1)
19a8 : 99 b6 4d STA $4db6,y ; (enemies[0].px + 1)
19ab : aa __ __ TAX
19ac : 38 __ __ SEC
19ad : a5 43 __ LDA T2 + 0 
19af : ed ac 4d SBC $4dac ; (player.spx + 0)
19b2 : 85 43 __ STA T2 + 0 
19b4 : 8a __ __ TXA
19b5 : ed ad 4d SBC $4dad ; (player.spx + 1)
19b8 : 85 44 __ STA T2 + 1 
19ba : 49 80 __ EOR #$80
19bc : c9 7f __ CMP #$7f
19be : d0 04 __ BNE $19c4 ; (enemies_move.s19 + 0)
.s18:
19c0 : a5 43 __ LDA T2 + 0 
19c2 : c9 40 __ CMP #$40
.s19:
19c4 : 90 0e __ BCC $19d4 ; (enemies_move.s15 + 0)
.s8:
19c6 : a5 44 __ LDA T2 + 1 
19c8 : 49 80 __ EOR #$80
19ca : c9 81 __ CMP #$81
19cc : d0 04 __ BNE $19d2 ; (enemies_move.s17 + 0)
.s16:
19ce : a5 43 __ LDA T2 + 0 
19d0 : c9 e0 __ CMP #$e0
.s17:
19d2 : 90 18 __ BCC $19ec ; (enemies_move.s9 + 0)
.s15:
19d4 : a9 00 __ LDA #$00
19d6 : 99 b9 4d STA $4db9,y ; (enemies[0].state + 0)
19d9 : ce a9 4d DEC $4da9 ; (game.ecount + 0)
19dc : a6 1b __ LDX ACCU + 0 
19de : bd 0a 46 LDA $460a,x ; (bitshift[0] + 10)
19e1 : 49 ff __ EOR #$ff
19e3 : 2d 15 d0 AND $d015 
19e6 : 8d 15 d0 STA $d015 
19e9 : 4c 57 1a JMP $1a57 ; (enemies_move.s6 + 0)
.s9:
19ec : a5 1b __ LDA ACCU + 0 
19ee : 69 02 __ ADC #$02
19f0 : 85 1d __ STA ACCU + 2 
19f2 : 0a __ __ ASL
19f3 : aa __ __ TAX
19f4 : b9 b7 4d LDA $4db7,y ; (enemies[0].py + 0)
19f7 : 18 __ __ CLC
19f8 : 69 32 __ ADC #$32
19fa : 9d 01 d0 STA $d001,x 
19fd : 18 __ __ CLC
19fe : a5 43 __ LDA T2 + 0 
1a00 : 69 18 __ ADC #$18
1a02 : 9d 00 d0 STA $d000,x 
1a05 : a6 1d __ LDX ACCU + 2 
1a07 : bd 08 46 LDA $4608,x ; (bitshift[0] + 8)
1a0a : 85 1e __ STA ACCU + 3 
1a0c : a5 44 __ LDA T2 + 1 
1a0e : 69 00 __ ADC #$00
1a10 : 4a __ __ LSR
1a11 : 90 07 __ BCC $1a1a ; (enemies_move.s10 + 0)
.s14:
1a13 : ad 10 d0 LDA $d010 
1a16 : 05 1e __ ORA ACCU + 3 
1a18 : b0 07 __ BCS $1a21 ; (enemies_move.s11 + 0)
.s10:
1a1a : a5 1e __ LDA ACCU + 3 
1a1c : 49 ff __ EOR #$ff
1a1e : 2d 10 d0 AND $d010 
.s11:
1a21 : 8d 10 d0 STA $d010 
1a24 : be b9 4d LDX $4db9,y ; (enemies[0].state + 0)
1a27 : 30 2e __ BMI $1a57 ; (enemies_move.s6 + 0)
.s12:
1a29 : ad cb 45 LDA $45cb ; (vspriteScreen + 0)
1a2c : 85 45 __ STA T3 + 0 
1a2e : ad cc 45 LDA $45cc ; (vspriteScreen + 1)
1a31 : 85 46 __ STA T3 + 1 
1a33 : a9 07 __ LDA #$07
1a35 : a4 1b __ LDY ACCU + 0 
1a37 : 99 29 d0 STA $d029,y 
1a3a : 8a __ __ TXA
1a3b : 4a __ __ LSR
1a3c : 4a __ __ LSR
1a3d : 49 7f __ EOR #$7f
1a3f : a4 1d __ LDY ACCU + 2 
1a41 : 91 45 __ STA (T3 + 0),y 
1a43 : a6 1c __ LDX ACCU + 1 
1a45 : de b9 4d DEC $4db9,x ; (enemies[0].state + 0)
1a48 : d0 0d __ BNE $1a57 ; (enemies_move.s6 + 0)
.s13:
1a4a : a5 1e __ LDA ACCU + 3 
1a4c : 49 ff __ EOR #$ff
1a4e : 2d 15 d0 AND $d015 
1a51 : 8d 15 d0 STA $d015 
1a54 : ce a9 4d DEC $4da9 ; (game.ecount + 0)
.s6:
1a57 : e6 1b __ INC ACCU + 0 
1a59 : a5 1b __ LDA ACCU + 0 
1a5b : c9 05 __ CMP #$05
1a5d : f0 03 __ BEQ $1a62 ; (enemies_move.s3 + 0)
1a5f : 4c 85 19 JMP $1985 ; (enemies_move.l5 + 0)
.s3:
1a62 : 60 __ __ RTS
--------------------------------------------------------------------
shots_check: ; shots_check()->bool
; 911, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1a63 : a9 00 __ LDA #$00
1a65 : 85 47 __ STA T8 + 0 
1a67 : 85 1e __ STA ACCU + 3 
1a69 : 85 1b __ STA ACCU + 0 
1a6b : a9 00 __ LDA #$00
1a6d : 85 43 __ STA T1 + 0 
1a6f : a9 4f __ LDA #$4f
1a71 : 85 44 __ STA T1 + 1 
.l5:
1a73 : a5 1b __ LDA ACCU + 0 
1a75 : 0a __ __ ASL
1a76 : 0a __ __ ASL
1a77 : 0a __ __ ASL
1a78 : 85 1d __ STA ACCU + 2 
1a7a : a8 __ __ TAY
1a7b : b9 b9 4d LDA $4db9,y ; (enemies[0].state + 0)
1a7e : 10 77 __ BPL $1af7 ; (shots_check.s6 + 0)
.s8:
1a80 : b9 b5 4d LDA $4db5,y ; (enemies[0].px + 0)
1a83 : 38 __ __ SEC
1a84 : ed ac 4d SBC $4dac ; (player.spx + 0)
1a87 : 85 1c __ STA ACCU + 1 
1a89 : b9 b6 4d LDA $4db6,y ; (enemies[0].px + 1)
1a8c : ed ad 4d SBC $4dad ; (player.spx + 1)
1a8f : 4a __ __ LSR
1a90 : 66 1c __ ROR ACCU + 1 
1a92 : 4a __ __ LSR
1a93 : 66 1c __ ROR ACCU + 1 
1a95 : 4a __ __ LSR
1a96 : 66 1c __ ROR ACCU + 1 
1a98 : a5 1c __ LDA ACCU + 1 
1a9a : c9 28 __ CMP #$28
1a9c : b0 59 __ BCS $1af7 ; (shots_check.s6 + 0)
.s9:
1a9e : a0 05 __ LDY #$05
1aa0 : b1 43 __ LDA (T1 + 0),y 
1aa2 : 85 45 __ STA T4 + 0 
1aa4 : c8 __ __ INY
1aa5 : b1 43 __ LDA (T1 + 0),y 
1aa7 : a6 02 __ LDX $02 
1aa9 : 90 12 __ BCC $1abd ; (shots_check.l10 + 0)
.s14:
1aab : a5 45 __ LDA T4 + 0 
1aad : 85 43 __ STA T1 + 0 
1aaf : a5 46 __ LDA T4 + 1 
1ab1 : 85 44 __ STA T1 + 1 
1ab3 : a0 05 __ LDY #$05
1ab5 : b1 45 __ LDA (T4 + 0),y 
1ab7 : aa __ __ TAX
1ab8 : c8 __ __ INY
1ab9 : b1 45 __ LDA (T4 + 0),y 
1abb : 86 45 __ STX T4 + 0 
.l10:
1abd : 85 46 __ STA T4 + 1 
1abf : a0 00 __ LDY #$00
1ac1 : b1 45 __ LDA (T4 + 0),y 
1ac3 : c5 1e __ CMP ACCU + 3 
1ac5 : 90 e4 __ BCC $1aab ; (shots_check.s14 + 0)
.s15:
1ac7 : 86 02 __ STX $02 
1ac9 : c5 1e __ CMP ACCU + 3 
1acb : d0 2a __ BNE $1af7 ; (shots_check.s6 + 0)
.l11:
1acd : a0 01 __ LDY #$01
1acf : b1 45 __ LDA (T4 + 0),y 
1ad1 : e5 1c __ SBC ACCU + 1 
1ad3 : aa __ __ TAX
1ad4 : a0 05 __ LDY #$05
1ad6 : bd 00 4e LDA $4e00,x ; (xcollision[0] + 0)
1ad9 : d0 2c __ BNE $1b07 ; (shots_check.s13 + 0)
.s12:
1adb : a5 45 __ LDA T4 + 0 
1add : 85 43 __ STA T1 + 0 
1adf : a5 46 __ LDA T4 + 1 
1ae1 : 85 44 __ STA T1 + 1 
1ae3 : b1 45 __ LDA (T4 + 0),y 
1ae5 : 85 02 __ STA $02 
1ae7 : aa __ __ TAX
1ae8 : c8 __ __ INY
1ae9 : b1 45 __ LDA (T4 + 0),y 
1aeb : 86 45 __ STX T4 + 0 
1aed : 85 46 __ STA T4 + 1 
1aef : a5 1e __ LDA ACCU + 3 
1af1 : a0 00 __ LDY #$00
1af3 : d1 45 __ CMP (T4 + 0),y 
1af5 : f0 d6 __ BEQ $1acd ; (shots_check.l11 + 0)
.s6:
1af7 : e6 1b __ INC ACCU + 0 
1af9 : e6 1e __ INC ACCU + 3 
1afb : a5 1e __ LDA ACCU + 3 
1afd : c9 05 __ CMP #$05
1aff : b0 03 __ BCS $1b04 ; (shots_check.s7 + 0)
1b01 : 4c 73 1a JMP $1a73 ; (shots_check.l5 + 0)
.s7:
1b04 : a5 47 __ LDA T8 + 0 
.s3:
1b06 : 60 __ __ RTS
.s13:
1b07 : a9 40 __ LDA #$40
1b09 : a6 1d __ LDX ACCU + 2 
1b0b : 9d b9 4d STA $4db9,x ; (enemies[0].state + 0)
1b0e : b1 45 __ LDA (T4 + 0),y 
1b10 : 91 43 __ STA (T1 + 0),y 
1b12 : c8 __ __ INY
1b13 : b1 45 __ LDA (T4 + 0),y 
1b15 : 91 43 __ STA (T1 + 0),y 
1b17 : ad 3a 46 LDA $463a ; (freeShot + 0)
1b1a : 88 __ __ DEY
1b1b : 91 45 __ STA (T4 + 0),y 
1b1d : ad 3b 46 LDA $463b ; (freeShot + 1)
1b20 : c8 __ __ INY
1b21 : 91 45 __ STA (T4 + 0),y 
1b23 : a5 45 __ LDA T4 + 0 
1b25 : 8d 3a 46 STA $463a ; (freeShot + 0)
1b28 : a5 46 __ LDA T4 + 1 
1b2a : 8d 3b 46 STA $463b ; (freeShot + 1)
1b2d : ee aa 4d INC $4daa ; (game.escore + 0)
1b30 : a9 01 __ LDA #$01
1b32 : 85 47 __ STA T8 + 0 
1b34 : d0 c1 __ BNE $1af7 ; (shots_check.s6 + 0)
--------------------------------------------------------------------
player_check: ; player_check()->bool
; 885, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1b36 : ad b1 4d LDA $4db1 ; (player.spy + 0)
1b39 : 38 __ __ SEC
1b3a : e9 0e __ SBC #$0e
1b3c : 85 1b __ STA ACCU + 0 
1b3e : a9 00 __ LDA #$00
1b40 : e9 00 __ SBC #$00
1b42 : 4a __ __ LSR
1b43 : 66 1b __ ROR ACCU + 0 
1b45 : 4a __ __ LSR
1b46 : 66 1b __ ROR ACCU + 0 
1b48 : 4a __ __ LSR
1b49 : 66 1b __ ROR ACCU + 0 
1b4b : 4a __ __ LSR
1b4c : 66 1b __ ROR ACCU + 0 
1b4e : 4a __ __ LSR
1b4f : a5 1b __ LDA ACCU + 0 
1b51 : 6a __ __ ROR
1b52 : c9 05 __ CMP #$05
1b54 : b0 5b __ BCS $1bb1 ; (player_check.s5 + 0)
.s6:
1b56 : 0a __ __ ASL
1b57 : 0a __ __ ASL
1b58 : 0a __ __ ASL
1b59 : aa __ __ TAX
1b5a : bd b9 4d LDA $4db9,x ; (enemies[0].state + 0)
1b5d : 10 52 __ BPL $1bb1 ; (player_check.s5 + 0)
.s7:
1b5f : bd b5 4d LDA $4db5,x ; (enemies[0].px + 0)
1b62 : 38 __ __ SEC
1b63 : ed ac 4d SBC $4dac ; (player.spx + 0)
1b66 : 85 1b __ STA ACCU + 0 
1b68 : bd b6 4d LDA $4db6,x ; (enemies[0].px + 1)
1b6b : ed ad 4d SBC $4dad ; (player.spx + 1)
1b6e : a8 __ __ TAY
1b6f : ad ae 4d LDA $4dae ; (player.vpx + 0)
1b72 : 0a __ __ ASL
1b73 : 85 43 __ STA T2 + 0 
1b75 : 90 04 __ BCC $1b7b ; (player_check.s14 + 0)
.s15:
1b77 : a9 ff __ LDA #$ff
1b79 : b0 02 __ BCS $1b7d ; (player_check.s16 + 0)
.s14:
1b7b : a9 00 __ LDA #$00
.s16:
1b7d : 06 43 __ ASL T2 + 0 
1b7f : 2a __ __ ROL
1b80 : 85 44 __ STA T2 + 1 
1b82 : 38 __ __ SEC
1b83 : a9 94 __ LDA #$94
1b85 : e5 43 __ SBC T2 + 0 
1b87 : 85 43 __ STA T2 + 0 
1b89 : a9 00 __ LDA #$00
1b8b : e5 44 __ SBC T2 + 1 
1b8d : 85 44 __ STA T2 + 1 
1b8f : 38 __ __ SEC
1b90 : a5 1b __ LDA ACCU + 0 
1b92 : e5 43 __ SBC T2 + 0 
1b94 : 85 1b __ STA ACCU + 0 
1b96 : 98 __ __ TYA
1b97 : e5 44 __ SBC T2 + 1 
1b99 : a8 __ __ TAY
1b9a : 49 80 __ EOR #$80
1b9c : c9 7f __ CMP #$7f
1b9e : d0 04 __ BNE $1ba4 ; (player_check.s13 + 0)
.s12:
1ba0 : a5 1b __ LDA ACCU + 0 
1ba2 : c9 f4 __ CMP #$f4
.s13:
1ba4 : 90 0b __ BCC $1bb1 ; (player_check.s5 + 0)
.s8:
1ba6 : 98 __ __ TYA
1ba7 : 30 0b __ BMI $1bb4 ; (player_check.s9 + 0)
.s11:
1ba9 : d0 06 __ BNE $1bb1 ; (player_check.s5 + 0)
.s10:
1bab : a9 0c __ LDA #$0c
1bad : c5 1b __ CMP ACCU + 0 
1baf : b0 03 __ BCS $1bb4 ; (player_check.s9 + 0)
.s5:
1bb1 : a9 00 __ LDA #$00
1bb3 : 60 __ __ RTS
.s9:
1bb4 : a9 40 __ LDA #$40
1bb6 : 9d b9 4d STA $4db9,x ; (enemies[0].state + 0)
1bb9 : a9 01 __ LDA #$01
.s3:
1bbb : 60 __ __ RTS
--------------------------------------------------------------------
enemies_reset: ; enemies_reset()->void
; 870, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1bbc : a0 02 __ LDY #$02
1bbe : a2 00 __ LDX #$00
.l5:
1bc0 : b9 08 46 LDA $4608,y ; (bitshift[0] + 8)
1bc3 : 49 ff __ EOR #$ff
1bc5 : 2d 15 d0 AND $d015 
1bc8 : 8d 15 d0 STA $d015 
1bcb : a9 00 __ LDA #$00
1bcd : 9d b9 4d STA $4db9,x ; (enemies[0].state + 0)
1bd0 : 8a __ __ TXA
1bd1 : 18 __ __ CLC
1bd2 : 69 08 __ ADC #$08
1bd4 : aa __ __ TAX
1bd5 : c8 __ __ INY
1bd6 : c0 07 __ CPY #$07
1bd8 : d0 e6 __ BNE $1bc0 ; (enemies_reset.l5 + 0)
.s6:
1bda : a9 50 __ LDA #$50
1bdc : 8d a8 4d STA $4da8 ; (game.edelay + 0)
1bdf : a9 00 __ LDA #$00
1be1 : 8d a9 4d STA $4da9 ; (game.ecount + 0)
.s3:
1be4 : 60 __ __ RTS
--------------------------------------------------------------------
sidfx_loop: ; sidfx_loop()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/audio/sidfx.h"
.s4:
1be5 : a2 00 __ LDX #$00
.l5:
1be7 : 86 47 __ STX T8 + 0 
1be9 : bd 7f 4d LDA $4d7f,x ; (channels[0].state + 0)
1bec : d0 03 __ BNE $1bf1 ; (sidfx_loop.s7 + 0)
1bee : 4c c3 1c JMP $1cc3 ; (sidfx_loop.s6 + 0)
.s7:
1bf1 : bd 76 4d LDA $4d76,x ; (channels[0].delay + 0)
1bf4 : 18 __ __ CLC
1bf5 : 69 ff __ ADC #$ff
1bf7 : 85 1d __ STA ACCU + 2 
1bf9 : 9d 76 4d STA $4d76,x ; (channels[0].delay + 0)
1bfc : bc 70 4d LDY $4d70,x ; (channels[0].com + 0)
1bff : 84 1b __ STY ACCU + 0 
1c01 : bc 73 4d LDY $4d73,x ; (channels[0].com + 0)
1c04 : 84 1c __ STY ACCU + 1 
1c06 : a8 __ __ TAY
1c07 : f0 52 __ BEQ $1c5b ; (sidfx_loop.s8 + 0)
.s37:
1c09 : a0 07 __ LDY #$07
1c0b : b1 1b __ LDA (ACCU + 0),y 
1c0d : 85 43 __ STA T3 + 0 
1c0f : c8 __ __ INY
1c10 : b1 1b __ LDA (ACCU + 0),y 
1c12 : 85 44 __ STA T3 + 1 
1c14 : 05 43 __ ORA T3 + 0 
1c16 : f0 1a __ BEQ $1c32 ; (sidfx_loop.s38 + 0)
.s40:
1c18 : bd 82 4d LDA $4d82,x ; (channels[0].freq + 0)
1c1b : 18 __ __ CLC
1c1c : 65 43 __ ADC T3 + 0 
1c1e : 9d 82 4d STA $4d82,x ; (channels[0].freq + 0)
1c21 : bc d7 1e LDY $1ed7,x ; (__multab7L + 0)
1c24 : 99 00 d4 STA $d400,y 
1c27 : bd 85 4d LDA $4d85,x ; (channels[0].freq + 0)
1c2a : 65 44 __ ADC T3 + 1 
1c2c : 9d 85 4d STA $4d85,x ; (channels[0].freq + 0)
1c2f : 99 01 d4 STA $d401,y 
.s38:
1c32 : a0 09 __ LDY #$09
1c34 : b1 1b __ LDA (ACCU + 0),y 
1c36 : 85 43 __ STA T3 + 0 
1c38 : c8 __ __ INY
1c39 : b1 1b __ LDA (ACCU + 0),y 
1c3b : 85 44 __ STA T3 + 1 
1c3d : 05 43 __ ORA T3 + 0 
1c3f : f0 1a __ BEQ $1c5b ; (sidfx_loop.s8 + 0)
.s39:
1c41 : bd 88 4d LDA $4d88,x ; (channels[0].pwm + 0)
1c44 : 18 __ __ CLC
1c45 : 65 43 __ ADC T3 + 0 
1c47 : 9d 88 4d STA $4d88,x ; (channels[0].pwm + 0)
1c4a : bc d7 1e LDY $1ed7,x ; (__multab7L + 0)
1c4d : 99 02 d4 STA $d402,y 
1c50 : bd 8b 4d LDA $4d8b,x ; (channels[0].pwm + 0)
1c53 : 65 44 __ ADC T3 + 1 
1c55 : 9d 8b 4d STA $4d8b,x ; (channels[0].pwm + 0)
1c58 : 99 03 d4 STA $d403,y 
.s8:
1c5b : bd d7 1e LDA $1ed7,x ; (__multab7L + 0)
1c5e : 85 43 __ STA T3 + 0 
1c60 : a5 1d __ LDA ACCU + 2 
1c62 : d0 5f __ BNE $1cc3 ; (sidfx_loop.s6 + 0)
.l9:
1c64 : a4 47 __ LDY T8 + 0 
1c66 : b9 7f 4d LDA $4d7f,y ; (channels[0].state + 0)
1c69 : c9 03 __ CMP #$03
1c6b : d0 03 __ BNE $1c70 ; (sidfx_loop.s10 + 0)
1c6d : 4c 9c 1d JMP $1d9c ; (sidfx_loop.s33 + 0)
.s10:
1c70 : b0 03 __ BCS $1c75 ; (sidfx_loop.s11 + 0)
1c72 : 4c 5a 1d JMP $1d5a ; (sidfx_loop.s27 + 0)
.s11:
1c75 : c9 04 __ CMP #$04
1c77 : f0 55 __ BEQ $1cce ; (sidfx_loop.s18 + 0)
.s12:
1c79 : c9 05 __ CMP #$05
1c7b : d0 41 __ BNE $1cbe ; (sidfx_loop.s13 + 0)
.s14:
1c7d : b9 7c 4d LDA $4d7c,y ; (channels[0].cnt + 0)
1c80 : d0 0d __ BNE $1c8f ; (sidfx_loop.s16 + 0)
.s15:
1c82 : a9 01 __ LDA #$01
1c84 : 99 7f 4d STA $4d7f,y ; (channels[0].state + 0)
1c87 : a9 00 __ LDA #$00
1c89 : 85 1b __ STA ACCU + 0 
1c8b : 85 1c __ STA ACCU + 1 
1c8d : f0 2f __ BEQ $1cbe ; (sidfx_loop.s13 + 0)
.s16:
1c8f : a6 47 __ LDX T8 + 0 
1c91 : de 7c 4d DEC $4d7c,x ; (channels[0].cnt + 0)
1c94 : a0 1b __ LDY #$1b
1c96 : b1 1b __ LDA (ACCU + 0),y 
1c98 : 9d 79 4d STA $4d79,x ; (channels[0].priority + 0)
1c9b : a0 12 __ LDY #$12
1c9d : b1 1b __ LDA (ACCU + 0),y 
1c9f : 29 01 __ AND #$01
1ca1 : aa __ __ TAX
1ca2 : a5 1b __ LDA ACCU + 0 
1ca4 : 69 0d __ ADC #$0d
1ca6 : 85 1b __ STA ACCU + 0 
1ca8 : a4 47 __ LDY T8 + 0 
1caa : 99 70 4d STA $4d70,y ; (channels[0].com + 0)
1cad : a5 1c __ LDA ACCU + 1 
1caf : 69 00 __ ADC #$00
1cb1 : 85 1c __ STA ACCU + 1 
1cb3 : 99 73 4d STA $4d73,y ; (channels[0].com + 0)
1cb6 : 8a __ __ TXA
1cb7 : d0 02 __ BNE $1cbb ; (sidfx_loop.s42 + 0)
.s17:
1cb9 : a9 03 __ LDA #$03
.s42:
1cbb : 99 7f 4d STA $4d7f,y ; (channels[0].state + 0)
.s13:
1cbe : b9 76 4d LDA $4d76,y ; (channels[0].delay + 0)
1cc1 : f0 a1 __ BEQ $1c64 ; (sidfx_loop.l9 + 0)
.s6:
1cc3 : a6 47 __ LDX T8 + 0 
1cc5 : e8 __ __ INX
1cc6 : e0 03 __ CPX #$03
1cc8 : b0 03 __ BCS $1ccd ; (sidfx_loop.s3 + 0)
1cca : 4c e7 1b JMP $1be7 ; (sidfx_loop.l5 + 0)
.s3:
1ccd : 60 __ __ RTS
.s18:
1cce : a0 0c __ LDY #$0c
1cd0 : b1 1b __ LDA (ACCU + 0),y 
1cd2 : d0 67 __ BNE $1d3b ; (sidfx_loop.s25 + 0)
.s19:
1cd4 : a4 47 __ LDY T8 + 0 
1cd6 : b9 7c 4d LDA $4d7c,y ; (channels[0].cnt + 0)
1cd9 : f0 a7 __ BEQ $1c82 ; (sidfx_loop.s15 + 0)
.s20:
1cdb : a0 06 __ LDY #$06
1cdd : b1 1b __ LDA (ACCU + 0),y 
1cdf : aa __ __ TAX
1ce0 : a5 1b __ LDA ACCU + 0 
1ce2 : 85 45 __ STA T4 + 0 
1ce4 : 69 0d __ ADC #$0d
1ce6 : 85 1b __ STA ACCU + 0 
1ce8 : a5 1c __ LDA ACCU + 1 
1cea : 85 46 __ STA T4 + 1 
1cec : 69 00 __ ADC #$00
1cee : 85 1c __ STA ACCU + 1 
1cf0 : a0 13 __ LDY #$13
1cf2 : b1 45 __ LDA (T4 + 0),y 
1cf4 : 29 ef __ AND #$ef
1cf6 : d0 28 __ BNE $1d20 ; (sidfx_loop.s21 + 0)
.s22:
1cf8 : 88 __ __ DEY
1cf9 : b1 45 __ LDA (T4 + 0),y 
1cfb : 85 1d __ STA ACCU + 2 
1cfd : 4a __ __ LSR
1cfe : 90 20 __ BCC $1d20 ; (sidfx_loop.s21 + 0)
.s23:
1d00 : 8a __ __ TXA
1d01 : 29 f0 __ AND #$f0
1d03 : aa __ __ TAX
1d04 : a0 14 __ LDY #$14
1d06 : b1 45 __ LDA (T4 + 0),y 
1d08 : 29 f0 __ AND #$f0
1d0a : 85 1e __ STA ACCU + 3 
1d0c : e4 1e __ CPX ACCU + 3 
1d0e : b0 10 __ BCS $1d20 ; (sidfx_loop.s21 + 0)
.s24:
1d10 : a5 1d __ LDA ACCU + 2 
1d12 : 29 fe __ AND #$fe
1d14 : a6 43 __ LDX T3 + 0 
1d16 : 9d 04 d4 STA $d404,x 
1d19 : a5 1d __ LDA ACCU + 2 
1d1b : 09 01 __ ORA #$01
1d1d : 9d 04 d4 STA $d404,x 
.s21:
1d20 : a6 47 __ LDX T8 + 0 
1d22 : de 7c 4d DEC $4d7c,x ; (channels[0].cnt + 0)
1d25 : a0 1b __ LDY #$1b
1d27 : b1 45 __ LDA (T4 + 0),y 
1d29 : 9d 79 4d STA $4d79,x ; (channels[0].priority + 0)
1d2c : a5 1b __ LDA ACCU + 0 
1d2e : 9d 70 4d STA $4d70,x ; (channels[0].com + 0)
1d31 : a5 1c __ LDA ACCU + 1 
1d33 : 9d 73 4d STA $4d73,x ; (channels[0].com + 0)
1d36 : a4 47 __ LDY T8 + 0 
1d38 : 4c b9 1c JMP $1cb9 ; (sidfx_loop.s17 + 0)
.s25:
1d3b : a0 04 __ LDY #$04
1d3d : b1 1b __ LDA (ACCU + 0),y 
1d3f : 29 fe __ AND #$fe
1d41 : a6 43 __ LDX T3 + 0 
1d43 : 9d 04 d4 STA $d404,x 
1d46 : a0 0c __ LDY #$0c
1d48 : b1 1b __ LDA (ACCU + 0),y 
1d4a : aa __ __ TAX
1d4b : a9 05 __ LDA #$05
1d4d : a4 47 __ LDY T8 + 0 
1d4f : 99 7f 4d STA $4d7f,y ; (channels[0].state + 0)
1d52 : ca __ __ DEX
.s26:
1d53 : 8a __ __ TXA
1d54 : 99 76 4d STA $4d76,y ; (channels[0].delay + 0)
1d57 : 4c be 1c JMP $1cbe ; (sidfx_loop.s13 + 0)
.s27:
1d5a : c9 01 __ CMP #$01
1d5c : f0 20 __ BEQ $1d7e ; (sidfx_loop.s31 + 0)
.s28:
1d5e : aa __ __ TAX
1d5f : d0 08 __ BNE $1d69 ; (sidfx_loop.s29 + 0)
.s30:
1d61 : a9 01 __ LDA #$01
1d63 : 99 76 4d STA $4d76,y ; (channels[0].delay + 0)
1d66 : 4c c3 1c JMP $1cc3 ; (sidfx_loop.s6 + 0)
.s29:
1d69 : a9 08 __ LDA #$08
1d6b : a6 43 __ LDX T3 + 0 
1d6d : 9d 04 d4 STA $d404,x 
1d70 : a9 00 __ LDA #$00
1d72 : 9d 04 d4 STA $d404,x 
1d75 : 9d 05 d4 STA $d405,x 
1d78 : 9d 06 d4 STA $d406,x 
1d7b : 4c b9 1c JMP $1cb9 ; (sidfx_loop.s17 + 0)
.s31:
1d7e : 99 76 4d STA $4d76,y ; (channels[0].delay + 0)
1d81 : a9 00 __ LDA #$00
1d83 : a6 43 __ LDX T3 + 0 
1d85 : 9d 04 d4 STA $d404,x 
1d88 : 9d 05 d4 STA $d405,x 
1d8b : 9d 06 d4 STA $d406,x 
1d8e : a5 1b __ LDA ACCU + 0 
1d90 : 05 1c __ ORA ACCU + 1 
1d92 : f0 02 __ BEQ $1d96 ; (sidfx_loop.s41 + 0)
.s32:
1d94 : a9 03 __ LDA #$03
.s41:
1d96 : 99 7f 4d STA $4d7f,y ; (channels[0].state + 0)
1d99 : 4c c3 1c JMP $1cc3 ; (sidfx_loop.s6 + 0)
.s33:
1d9c : a0 00 __ LDY #$00
1d9e : b1 1b __ LDA (ACCU + 0),y 
1da0 : a6 47 __ LDX T8 + 0 
1da2 : 9d 82 4d STA $4d82,x ; (channels[0].freq + 0)
1da5 : c8 __ __ INY
1da6 : b1 1b __ LDA (ACCU + 0),y 
1da8 : 9d 85 4d STA $4d85,x ; (channels[0].freq + 0)
1dab : c8 __ __ INY
1dac : b1 1b __ LDA (ACCU + 0),y 
1dae : 9d 88 4d STA $4d88,x ; (channels[0].pwm + 0)
1db1 : c8 __ __ INY
1db2 : b1 1b __ LDA (ACCU + 0),y 
1db4 : 9d 8b 4d STA $4d8b,x ; (channels[0].pwm + 0)
1db7 : a0 01 __ LDY #$01
1db9 : b1 1b __ LDA (ACCU + 0),y 
1dbb : 85 46 __ STA T4 + 1 
1dbd : a0 05 __ LDY #$05
1dbf : b1 1b __ LDA (ACCU + 0),y 
1dc1 : 85 1d __ STA ACCU + 2 
1dc3 : a0 00 __ LDY #$00
1dc5 : b1 1b __ LDA (ACCU + 0),y 
1dc7 : a6 43 __ LDX T3 + 0 
1dc9 : 9d 00 d4 STA $d400,x 
1dcc : a5 46 __ LDA T4 + 1 
1dce : 9d 01 d4 STA $d401,x 
1dd1 : a0 02 __ LDY #$02
1dd3 : b1 1b __ LDA (ACCU + 0),y 
1dd5 : 9d 02 d4 STA $d402,x 
1dd8 : c8 __ __ INY
1dd9 : b1 1b __ LDA (ACCU + 0),y 
1ddb : 9d 03 d4 STA $d403,x 
1dde : a5 1d __ LDA ACCU + 2 
1de0 : 9d 05 d4 STA $d405,x 
1de3 : a0 06 __ LDY #$06
1de5 : b1 1b __ LDA (ACCU + 0),y 
1de7 : 9d 06 d4 STA $d406,x 
1dea : a0 04 __ LDY #$04
1dec : b1 1b __ LDA (ACCU + 0),y 
1dee : 9d 04 d4 STA $d404,x 
1df1 : 4a __ __ LSR
1df2 : 90 04 __ BCC $1df8 ; (sidfx_loop.s34 + 0)
.s36:
1df4 : a0 0b __ LDY #$0b
1df6 : b0 02 __ BCS $1dfa ; (sidfx_loop.s35 + 0)
.s34:
1df8 : a0 0c __ LDY #$0c
.s35:
1dfa : b1 1b __ LDA (ACCU + 0),y 
1dfc : aa __ __ TAX
1dfd : a9 04 __ LDA #$04
1dff : a4 47 __ LDY T8 + 0 
1e01 : 99 7f 4d STA $4d7f,y ; (channels[0].state + 0)
1e04 : 4c 53 1d JMP $1d53 ; (sidfx_loop.s26 + 0)
--------------------------------------------------------------------
status_update: ; status_update()->void
; 178, "/home/honza/projects/c64/projects/oscar64/samples/games/hscrollshmup.c"
.s4:
1e07 : ad ab 4d LDA $4dab ; (game.lives + 0)
1e0a : 18 __ __ CLC
1e0b : 69 30 __ ADC #$30
1e0d : 8d 26 c8 STA $c826 
1e10 : ad aa 4d LDA $4daa ; (game.escore + 0)
1e13 : f0 3c __ BEQ $1e51 ; (status_update.s3 + 0)
.s5:
1e15 : c9 64 __ CMP #$64
1e17 : 90 0b __ BCC $1e24 ; (status_update.s6 + 0)
.s13:
1e19 : e9 64 __ SBC #$64
1e1b : 8d aa 4d STA $4daa ; (game.escore + 0)
1e1e : a9 01 __ LDA #$01
1e20 : a2 0b __ LDX #$0b
1e22 : d0 19 __ BNE $1e3d ; (status_update.l9 + 0)
.s6:
1e24 : c9 0a __ CMP #$0a
1e26 : 90 0b __ BCC $1e33 ; (status_update.s7 + 0)
.s12:
1e28 : e9 0a __ SBC #$0a
1e2a : 8d aa 4d STA $4daa ; (game.escore + 0)
1e2d : a9 01 __ LDA #$01
1e2f : a2 0c __ LDX #$0c
1e31 : d0 0a __ BNE $1e3d ; (status_update.l9 + 0)
.s7:
1e33 : a2 00 __ LDX #$00
1e35 : 8e aa 4d STX $4daa ; (game.escore + 0)
1e38 : aa __ __ TAX
1e39 : f0 16 __ BEQ $1e51 ; (status_update.s3 + 0)
.s8:
1e3b : a2 0d __ LDX #$0d
.l9:
1e3d : 18 __ __ CLC
1e3e : 7d 00 c8 ADC $c800,x 
1e41 : c9 3a __ CMP #$3a
1e43 : a0 00 __ LDY #$00
1e45 : 90 03 __ BCC $1e4a ; (status_update.s10 + 0)
.s11:
1e47 : e9 0a __ SBC #$0a
1e49 : c8 __ __ INY
.s10:
1e4a : 9d 00 c8 STA $c800,x 
1e4d : ca __ __ DEX
1e4e : 98 __ __ TYA
1e4f : d0 ec __ BNE $1e3d ; (status_update.l9 + 0)
.s3:
1e51 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1e52 : a5 1c __ LDA ACCU + 1 
1e54 : d0 31 __ BNE $1e87 ; (divmod + 53)
1e56 : a5 04 __ LDA WORK + 1 
1e58 : d0 1e __ BNE $1e78 ; (divmod + 38)
1e5a : 85 06 __ STA WORK + 3 
1e5c : a2 04 __ LDX #$04
1e5e : 06 1b __ ASL ACCU + 0 
1e60 : 2a __ __ ROL
1e61 : c5 03 __ CMP WORK + 0 
1e63 : 90 02 __ BCC $1e67 ; (divmod + 21)
1e65 : e5 03 __ SBC WORK + 0 
1e67 : 26 1b __ ROL ACCU + 0 
1e69 : 2a __ __ ROL
1e6a : c5 03 __ CMP WORK + 0 
1e6c : 90 02 __ BCC $1e70 ; (divmod + 30)
1e6e : e5 03 __ SBC WORK + 0 
1e70 : 26 1b __ ROL ACCU + 0 
1e72 : ca __ __ DEX
1e73 : d0 eb __ BNE $1e60 ; (divmod + 14)
1e75 : 85 05 __ STA WORK + 2 
1e77 : 60 __ __ RTS
1e78 : a5 1b __ LDA ACCU + 0 
1e7a : 85 05 __ STA WORK + 2 
1e7c : a5 1c __ LDA ACCU + 1 
1e7e : 85 06 __ STA WORK + 3 
1e80 : a9 00 __ LDA #$00
1e82 : 85 1b __ STA ACCU + 0 
1e84 : 85 1c __ STA ACCU + 1 
1e86 : 60 __ __ RTS
1e87 : a5 04 __ LDA WORK + 1 
1e89 : d0 1f __ BNE $1eaa ; (divmod + 88)
1e8b : a5 03 __ LDA WORK + 0 
1e8d : 30 1b __ BMI $1eaa ; (divmod + 88)
1e8f : a9 00 __ LDA #$00
1e91 : 85 06 __ STA WORK + 3 
1e93 : a2 10 __ LDX #$10
1e95 : 06 1b __ ASL ACCU + 0 
1e97 : 26 1c __ ROL ACCU + 1 
1e99 : 2a __ __ ROL
1e9a : c5 03 __ CMP WORK + 0 
1e9c : 90 02 __ BCC $1ea0 ; (divmod + 78)
1e9e : e5 03 __ SBC WORK + 0 
1ea0 : 26 1b __ ROL ACCU + 0 
1ea2 : 26 1c __ ROL ACCU + 1 
1ea4 : ca __ __ DEX
1ea5 : d0 f2 __ BNE $1e99 ; (divmod + 71)
1ea7 : 85 05 __ STA WORK + 2 
1ea9 : 60 __ __ RTS
1eaa : a9 00 __ LDA #$00
1eac : 85 05 __ STA WORK + 2 
1eae : 85 06 __ STA WORK + 3 
1eb0 : 84 02 __ STY $02 
1eb2 : a0 10 __ LDY #$10
1eb4 : 18 __ __ CLC
1eb5 : 26 1b __ ROL ACCU + 0 
1eb7 : 26 1c __ ROL ACCU + 1 
1eb9 : 26 05 __ ROL WORK + 2 
1ebb : 26 06 __ ROL WORK + 3 
1ebd : 38 __ __ SEC
1ebe : a5 05 __ LDA WORK + 2 
1ec0 : e5 03 __ SBC WORK + 0 
1ec2 : aa __ __ TAX
1ec3 : a5 06 __ LDA WORK + 3 
1ec5 : e5 04 __ SBC WORK + 1 
1ec7 : 90 04 __ BCC $1ecd ; (divmod + 123)
1ec9 : 86 05 __ STX WORK + 2 
1ecb : 85 06 __ STA WORK + 3 
1ecd : 88 __ __ DEY
1ece : d0 e5 __ BNE $1eb5 ; (divmod + 99)
1ed0 : 26 1b __ ROL ACCU + 0 
1ed2 : 26 1c __ ROL ACCU + 1 
1ed4 : a4 02 __ LDY $02 
1ed6 : 60 __ __ RTS
--------------------------------------------------------------------
__multab7L:
1ed7 : __ __ __ BYT 00 07 0e                                        : ...
--------------------------------------------------------------------
charset:
1eda : __ __ __ BYT ff ff ff ff ff ff ff ff 55 55 55 55 55 55 55 55 : ........UUUUUUUU
1eea : __ __ __ BYT 00 00 11 44 55 55 55 55 55 55 55 55 99 66 aa aa : ...DUUUUUUUU.f..
1efa : __ __ __ BYT 15 05 15 05 15 05 15 05 56 5a 56 5a 56 5a 56 5a : ........VZVZVZVZ
1f0a : __ __ __ BYT ff ff ff ff f0 f0 c1 c5 ff ff 00 00 11 44 15 55 : .............D.U
1f1a : __ __ __ BYT 00 00 11 44 15 55 55 55 ff ff fc fc f1 f0 f1 f0 : ...D.UUU........
1f2a : __ __ __ BYT 11 05 15 55 15 55 55 55 c1 c5 c1 c5 c1 c5 c1 c5 : ...U.UUU........
1f3a : __ __ __ BYT 11 05 15 05 15 05 15 05 ff ff 00 00 11 44 55 55 : .............DUU
1f4a : __ __ __ BYT ff ff ff ff 0f 0f 47 53 54 55 54 55 55 55 55 55 : ......GSTUTUUUUU
1f5a : __ __ __ BYT ff ff 7f bf 6f af 6f af 6b 5b 6b 5b 6b 5b 6b 5b : ....o.o.k[k[k[k[
1f6a : __ __ __ BYT 66 5a 56 5a 56 5a 56 5a c1 c5 c1 c5 c1 c5 c1 c4 : fZVZVZVZ........
1f7a : __ __ __ BYT f1 f0 f1 f0 fd fc ff ff 55 55 55 55 15 55 55 65 : ........UUUU.UUe
1f8a : __ __ __ BYT d9 e6 fa fa ff ff ff ff 55 65 99 66 aa aa ff ff : ........Ue.f....
1f9a : __ __ __ BYT 55 55 95 55 99 66 aa aa 56 5a 56 5a 56 5a 66 5a : UU.U.f..VZVZVZfZ
1faa : __ __ __ BYT 6b 5b 6b 5b 6b 5b 6b 9b 55 55 56 55 56 55 5a 66 : k[k[k[k.UUVUVUZf
1fba : __ __ __ BYT 6f af 6f af bf bf ff ff 55 55 55 56 99 66 aa aa : o.o.....UUUV.f..
1fca : __ __ __ BYT 55 56 99 66 aa aa ff ff 9b 6b af af ff ff ff ff : UV.f.....k......
1fda : __ __ __ BYT 55 55 6a 6a 65 65 65 65 55 55 aa aa 55 55 55 55 : UUjjeeeeUU..UUUU
1fea : __ __ __ BYT 55 55 a5 91 51 51 51 51 65 65 65 65 65 65 65 65 : UU..QQQQeeeeeeee
1ffa : __ __ __ BYT 51 51 51 51 51 51 51 51 65 65 65 65 54 50 55 55 : QQQQQQQQeeeeTPUU
200a : __ __ __ BYT 55 55 55 55 00 00 55 55 51 51 51 51 01 01 55 55 : UUUU..UUQQQQ..UU
201a : __ __ __ BYT 55 55 40 40 45 45 45 45 55 55 00 00 55 55 55 55 : UU@@EEEEUU..UUUU
202a : __ __ __ BYT 55 55 05 15 59 59 59 59 45 45 45 45 45 45 45 45 : UU..YYYYEEEEEEEE
203a : __ __ __ BYT 59 59 59 59 59 59 59 59 45 45 45 45 46 5a 55 55 : YYYYYYYYEEEEFZUU
204a : __ __ __ BYT 55 55 55 55 aa aa 55 55 59 59 59 59 a9 a9 55 55 : UUUU..UUYYYY..UU
205a : __ __ __ BYT ff ff 00 44 55 55 99 aa 00 15 15 55 55 55 55 56 : ...DUU.....UUUUV
206a : __ __ __ BYT 16 16 16 16 16 16 16 16 00 44 55 55 99 aa ff ff : .........DUU....
207a : __ __ __ BYT 15 55 55 55 55 56 16 aa 55 55 55 55 55 55 56 56 : .UUUUV..UUUUUUVV
208a : __ __ __ BYT 55 5a 65 95 95 95 55 55 55 a5 59 56 56 56 55 55 : UZe...UUU.YVVVUU
209a : __ __ __ BYT 55 55 55 55 55 55 15 15 56 56 56 56 56 56 55 55 : UUUUUU..VVVVVVUU
20aa : __ __ __ BYT 55 55 55 55 55 55 95 95 55 55 55 55 55 55 54 54 : UUUUUU..UUUUUUTT
20ba : __ __ __ BYT 15 15 15 15 15 15 55 55 95 65 50 55 55 55 55 55 : ......UU.ePUUUUU
20ca : __ __ __ BYT 54 51 05 55 55 55 55 55 55 55 55 00 15 15 15 15 : TQ.UUUUUUUU.....
20da : __ __ __ BYT 55 55 55 01 59 59 5a 5b 55 55 55 55 55 55 d5 95 : UUU.YYZ[UUUUUU..
20ea : __ __ __ BYT 15 15 15 15 15 15 15 15 5a 5b 5a 5b 5a 5b 5a 5b : ........Z[Z[Z[Z[
20fa : __ __ __ BYT d5 95 d5 95 d5 95 d5 95 15 15 15 15 15 15 15 6a : ...............j
210a : __ __ __ BYT 5a 5b 5a 5b 5a 5b 5a ab 5e 5b 5e 55 55 55 55 55 : Z[Z[Z[Z.^[^UUUUU
211a : __ __ __ BYT ee bb ee 55 55 55 55 55 d5 95 d5 55 55 55 55 55 : ...UUUUU...UUUUU
212a : __ __ __ BYT 55 55 55 55 55 55 55 54 55 55 55 55 55 40 00 3f : UUUUUUUTUUUUU@.?
213a : __ __ __ BYT 55 55 55 55 55 15 05 c9 54 53 53 43 4f 4f 4f 4d : UUUUU...TSSCOOOM
214a : __ __ __ BYT ff ff c7 4f 0f 1f 3f 3f f2 fe fe fe ff ff ff ff : ...O..??........
215a : __ __ __ BYT 55 55 55 95 a5 b5 a5 b9 4f 4f 4f 4f 43 53 53 54 : UUU.....OOOOCSST
216a : __ __ __ BYT 7f 7f ff ff ff ff ff ff f7 f7 cf 0f 7f fe fe fb : ................
217a : __ __ __ BYT b9 b9 b9 b9 a9 e9 a9 a9 56 55 55 55 55 55 55 55 : ........VUUUUUUU
218a : __ __ __ BYT 3f aa bf aa 6a 5a 55 55 ee bb ee ba aa aa a5 55 : ?...jZUU.......U
219a : __ __ __ BYT e9 a5 a5 95 95 55 55 55 55 55 55 aa 55 01 01 55 : .....UUUUUU.U..U
21aa : __ __ __ BYT 55 55 55 55 55 55 55 00 55 55 55 55 55 55 55 05 : UUUUUUU.UUUUUUU.
21ba : __ __ __ BYT 00 55 55 55 55 55 55 55 05 55 55 55 55 55 55 55 : .UUUUUUU.UUUUUUU
21ca : __ __ __ BYT 55 01 01 55 00 55 55 55 99 e6 f9 fe ff ff ff ff : U..U.UUU........
21da : __ __ __ BYT 55 55 95 65 99 e6 f9 fe 55 55 55 55 55 55 95 65 : UU.e....UUUUUU.e
21ea : __ __ __ BYT 55 55 95 65 99 e6 fa fe 55 55 55 55 55 55 56 59 : UU.e....UUUUUUVY
21fa : __ __ __ BYT 55 55 56 59 66 9b 6f bf 66 9b 6f bf ff ff ff ff : UUVYf.o.f.o.....
220a : __ __ __ BYT 55 55 56 59 66 9b af bf ff ff ff ff fc f1 c4 11 : UUVYf...........
221a : __ __ __ BYT fc f0 c4 11 45 15 55 55 fc f1 c4 11 45 15 55 55 : ....E.UU....E.UU
222a : __ __ __ BYT 45 15 55 55 55 55 55 55 3f 0f 13 44 51 54 55 55 : E.UUUUUU?..DQTUU
223a : __ __ __ BYT ff ff ff ff 3f 4f 13 44 51 54 55 55 55 55 55 55 : ....?O.DQTUUUUUU
224a : __ __ __ BYT 3f 4f 13 44 51 54 55 55 bf bf 6f 9f 6b 5b 66 59 : ?O.DQTUU..o.k[fY
225a : __ __ __ BYT fd fc f4 f0 d1 c1 45 05 40 40 51 54 55 55 55 55 : ......E.@@QTUUUU
226a : __ __ __ BYT 15 45 15 55 55 55 55 55 55 55 55 55 55 56 59 66 : .E.UUUUUUUUUUVYf
227a : __ __ __ BYT 55 55 55 55 66 99 aa aa 55 55 55 55 55 55 95 55 : UUUUf...UUUUUU.U
228a : __ __ __ BYT 5a 6a ab 6b af af bf bf a5 95 e9 e5 f9 fa fe fe : Zj.k............
229a : __ __ __ BYT 15 15 26 aa 6a aa 6a aa 56 56 67 ab ab ab ab ab : ..&.j.j.VVg.....
22aa : __ __ __ BYT 00 00 11 84 95 95 95 95 6a aa 6a aa 6a aa 6a aa : ........j.j.j.j.
22ba : __ __ __ BYT ab ab ab ab ab ab ab ab 95 95 95 95 95 95 95 95 : ................
22ca : __ __ __ BYT 6a aa 6a aa bf 7f 5a 55 ab ab ab ab ff ff aa 55 : j.j...ZU.......U
22da : __ __ __ BYT 95 95 95 95 95 95 95 55 55 66 99 6a aa 6a aa 6a : .......UUf.j.j.j
22ea : __ __ __ BYT 55 66 9b ab ab ab ab ab 55 55 55 55 95 95 95 95 : Uf......UUUU....
22fa : __ __ __ BYT aa 6a aa 6a aa 6a aa 6a aa 6a aa 6a ae 7b bf bf : .j.j.j.j.j.j.{..
230a : __ __ __ BYT ab ab ab ab ef bb ff ff 95 95 95 d5 99 e6 fa fe : ................
231a : __ __ __ BYT 4a da d5 c5 c1 c5 c1 c5 aa aa 55 55 55 55 55 55 : J.........UUUUUU
232a : __ __ __ BYT a5 a9 58 54 54 54 54 54 c1 c5 c1 c5 c1 c5 c0 00 : ..XTTTTT........
233a : __ __ __ BYT 55 55 55 55 55 55 00 00 54 54 54 54 54 50 01 05 : UUUUUU..TTTTTP..
234a : __ __ __ BYT 55 55 55 55 59 56 5a 56 55 55 55 55 95 65 95 45 : UUUUYVZVUUUU.e.E
235a : __ __ __ BYT 5a 56 5a 56 5a 56 5a 56 59 54 55 55 55 55 55 55 : ZVZVZVZVYTUUUUUU
236a : __ __ __ BYT 15 05 15 45 55 55 55 55 ff fd fc f4 f0 d0 c1 41 : ...EUUUU.......A
237a : __ __ __ BYT 00 00 11 04 15 55 55 55 45 c5 d1 f6 f9 fe fe ff : .....UUUE.......
238a : __ __ __ BYT ff 3f 3f 4f 1f 67 5b 59 6a 5b ab 6f af bf bf ff : .??O.g[Yj[.o....
239a : __ __ __ BYT 55 55 55 59 66 5a 6a 5a 55 55 55 95 65 b5 be bb : UUUYfZjZUUU.e...
23aa : __ __ __ BYT 6a 5a 6a 5a 6f 5b 56 55 be bb be bb fe bb ee 55 : jZjZo[VU.......U
23ba : __ __ __ BYT c6 c6 c6 c6 c6 c6 c6 c6 1b 1b 1b 1b 1b 1b 1b 1b : ................
23ca : __ __ __ BYT c5 c5 c5 c6 c6 c6 c6 c6 3f 43 54 95 e9 fe ff ff : ........?CT.....
23da : __ __ __ BYT ff ff 3f 43 54 95 e9 fe 1b 1b 1b 1b 1b 5b 5b 5b : ..?CT........[[[
23ea : __ __ __ BYT c6 c6 c6 c6 c5 c5 c5 c6 ff ff fc c1 15 56 6b bf : .............Vk.
23fa : __ __ __ BYT fc c1 15 56 6b bf ff ff 1b 5b 5b 5b 1b 1b 1b 1b : ...Vk....[[[....
240a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
241a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
242a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
243a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
244a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
245a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
246a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
247a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
248a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
249a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
250a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
251a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
252a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
253a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
254a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
255a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
256a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
257a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
258a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
259a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
260a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
261a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
262a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
263a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
264a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
265a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
266a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
267a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
268a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
269a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
tcharset:
26da : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff c3 f9 c1 99 c1 ff : ................
26ea : __ __ __ BYT ff 9f 9f 83 99 99 83 ff ff ff c3 9f 9f 9f c3 ff : ................
26fa : __ __ __ BYT ff f9 f9 c1 99 99 c1 ff ff ff c3 99 81 9f c3 ff : ................
270a : __ __ __ BYT ff f1 e7 c1 e7 e7 e7 ff ff ff c1 99 99 c1 f9 83 : ................
271a : __ __ __ BYT ff 9f 9f 83 99 99 99 ff ff e7 ff c7 e7 e7 c3 ff : ................
272a : __ __ __ BYT ff f9 ff f9 f9 f9 f9 c3 ff 9f 9f 93 87 93 99 ff : ................
273a : __ __ __ BYT ff c7 e7 e7 e7 e7 c3 ff ff ff 99 80 80 94 9c ff : ................
274a : __ __ __ BYT ff ff 83 99 99 99 99 ff ff ff c3 99 99 99 c3 ff : ................
275a : __ __ __ BYT ff ff 83 99 99 83 9f 9f ff ff c1 99 99 c1 f9 f9 : ................
276a : __ __ __ BYT ff ff 83 99 9f 9f 9f ff ff ff c1 9f c3 f9 83 ff : ................
277a : __ __ __ BYT ff e7 81 e7 e7 e7 f1 ff ff ff 99 99 99 99 c1 ff : ................
278a : __ __ __ BYT ff ff 99 99 99 c3 e7 ff ff ff 9c 94 80 c1 c9 ff : ................
279a : __ __ __ BYT ff ff 99 c3 e7 c3 99 ff ff ff 99 99 99 c1 f3 87 : ................
27aa : __ __ __ BYT ff ff 81 f3 e7 cf 81 ff c3 cf cf cf cf cf c3 ff : ................
27ba : __ __ __ BYT f3 ed cf 83 cf 9d 03 ff c3 f3 f3 f3 f3 f3 c3 ff : ................
27ca : __ __ __ BYT ff e7 c3 81 e7 e7 e7 e7 ff ef cf 80 80 cf ef ff : ................
27da : __ __ __ BYT ff ff ff ff ff ff ff ff e7 e7 e7 e7 ff ff e7 ff : ................
27ea : __ __ __ BYT 99 99 99 ff ff ff ff ff 99 99 00 99 00 99 99 ff : ................
27fa : __ __ __ BYT e7 c1 9f c3 f9 83 e7 ff 9d 99 f3 e7 cf 99 b9 ff : ................
280a : __ __ __ BYT c3 99 c3 c7 98 99 c0 ff f9 f3 e7 ff ff ff ff ff : ................
281a : __ __ __ BYT f3 e7 cf cf cf e7 f3 ff cf e7 f3 f3 f3 e7 cf ff : ................
282a : __ __ __ BYT ff 99 c3 00 c3 99 ff ff ff e7 e7 81 e7 e7 ff ff : ................
283a : __ __ __ BYT ff ff ff ff ff e7 e7 cf ff ff ff 81 ff ff ff ff : ................
284a : __ __ __ BYT ff ff ff ff ff e7 e7 ff ff fc f9 f3 e7 cf 9f ff : ................
285a : __ __ __ BYT c3 99 91 89 99 99 c3 ff e7 e7 c7 e7 e7 e7 81 ff : ................
286a : __ __ __ BYT c3 99 f9 f3 cf 9f 81 ff c3 99 f9 e3 f9 99 c3 ff : ................
287a : __ __ __ BYT f9 f1 e1 99 80 f9 f9 ff 81 9f 83 f9 f9 99 c3 ff : ................
288a : __ __ __ BYT c3 99 9f 83 99 99 c3 ff 81 99 f3 e7 e7 e7 e7 ff : ................
289a : __ __ __ BYT c3 99 99 c3 99 99 c3 ff c3 99 99 c1 f9 99 c3 ff : ................
28aa : __ __ __ BYT ff ff e7 ff ff e7 ff ff ff ff e7 ff ff e7 e7 cf : ................
28ba : __ __ __ BYT f1 e7 cf 9f cf e7 f1 ff ff ff 81 ff 81 ff ff ff : ................
28ca : __ __ __ BYT 8f e7 f3 f9 f3 e7 8f ff c3 99 f9 f3 e7 ff e7 ff : ................
28da : __ __ __ BYT ff ff ff 00 00 ff ff ff e7 c3 99 81 99 99 99 ff : ................
28ea : __ __ __ BYT 83 99 99 83 99 99 83 ff c3 99 9f 9f 9f 99 c3 ff : ................
28fa : __ __ __ BYT 87 93 99 99 99 93 87 ff 81 9f 9f 87 9f 9f 81 ff : ................
290a : __ __ __ BYT 81 9f 9f 87 9f 9f 9f ff c3 99 9f 91 99 99 c3 ff : ................
291a : __ __ __ BYT 99 99 99 81 99 99 99 ff c3 e7 e7 e7 e7 e7 c3 ff : ................
292a : __ __ __ BYT e1 f3 f3 f3 f3 93 c7 ff 99 93 87 8f 87 93 99 ff : ................
293a : __ __ __ BYT 9f 9f 9f 9f 9f 9f 81 ff 9c 88 80 94 9c 9c 9c ff : ................
294a : __ __ __ BYT 99 89 81 81 91 99 99 ff c3 99 99 99 99 99 c3 ff : ................
295a : __ __ __ BYT 83 99 99 83 9f 9f 9f ff c3 99 99 99 99 c3 f1 ff : ................
296a : __ __ __ BYT 83 99 99 83 87 93 99 ff c3 99 9f c3 f9 99 c3 ff : ................
297a : __ __ __ BYT 81 e7 e7 e7 e7 e7 e7 ff 99 99 99 99 99 99 c3 ff : ................
298a : __ __ __ BYT 99 99 99 99 99 c3 e7 ff 9c 9c 9c 94 80 88 9c ff : ................
299a : __ __ __ BYT 99 99 c3 e7 c3 99 99 ff 99 99 99 c3 e7 e7 e7 ff : ................
29aa : __ __ __ BYT 81 f9 f3 e7 cf 9f 81 ff e7 e7 e7 00 00 e7 e7 e7 : ................
29ba : __ __ __ BYT 3f 3f cf cf 3f 3f cf cf e7 e7 e7 e7 e7 e7 e7 e7 : ??..??..........
29ca : __ __ __ BYT cc cc 33 33 cc cc 33 33 ff ff ff ff ff ff ff ff : ..33..33........
29da : __ __ __ BYT ff ff fe fb ef ef ef ef ff ff bf ff ff f7 f7 f7 : ................
29ea : __ __ __ BYT ef ef ef ff ff fd ff ff f7 f7 f7 f7 df 7f ff ff : ................
29fa : __ __ __ BYT aa aa a8 a2 8a 8a 8a 8a aa aa 2a aa aa ae ae ae : ..........*.....
2a0a : __ __ __ BYT 8a 8a 8a aa aa ab aa aa ae ae ae ae ba ea aa aa : ................
2a1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a2a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a3a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a6a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a7a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2aaa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2aba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2aca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2ada : __ __ __ BYT 55 55 7f 7f 7f 7f 7f 7f 55 55 ff ff ff ff ff ff : UU......UU......
2aea : __ __ __ BYT 57 5e fc fe fc fe fc fe 7f 7f 7f 7f 7f 7f fa e0 : W^..............
2afa : __ __ __ BYT ff ff ff ff ff ff aa 00 fc fe fc fe fc fe a8 00 : ................
2b0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b1a : __ __ __ BYT 55 55 77 5d 77 5d 77 5d 55 55 77 dd 77 dd 77 dd : UUw]w]w]UUw.w.w.
2b2a : __ __ __ BYT 57 5e 74 de 74 de 74 de 77 5d 77 5d 77 5d fa e0 : W^t.t.t.w]w]w]..
2b3a : __ __ __ BYT 77 dd 77 dd 77 dd aa 00 74 de 74 de 74 de a8 00 : w.w.w...t.t.t...
2b4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b5a : __ __ __ BYT 55 55 7b 6e 7b 6e 7b 6e 55 55 bb ee bb ee bb ee : UU{n{n{nUU......
2b6a : __ __ __ BYT 57 5e b8 ee b8 ee b8 ee 7b 6e 7b 6e 7b 6e fa e0 : W^......{n{n{n..
2b7a : __ __ __ BYT bb ee bb ee bb ee aa 00 b8 ee b8 ee b8 ee a8 00 : ................
2b8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2baa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bda : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bfa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c2a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c3a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c6a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c7a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2caa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2cba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2cca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2cda : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2cea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2cfa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d2a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d3a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d6a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d7a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2d9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2daa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2dba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2dca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2dda : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2dea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2dfa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e2a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e3a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e6a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e7a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2e9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2eaa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2eba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2eca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
spriteset:
2eda : __ __ __ BYT 03 f0 00 0f fc 00 3f ff 00 01 54 00 01 50 00 01 : ......?...T..P..
2eea : __ __ __ BYT d0 00 0f fc 00 3f ff c0 ff fe bc ff fe af ff ff : .....?..........
2efa : __ __ __ BYT fd fd 5e a5 55 56 94 15 d5 40 07 f4 00 03 f0 00 : ..^.UV...@......
2f0a : __ __ __ BYT 03 f0 00 03 f0 00 15 55 00 05 54 00 01 50 00 86 : .......U..T..P..
2f1a : __ __ __ BYT 00 f0 00 03 fc 00 0f ff 00 00 54 00 00 50 00 01 : ..........T..P..
2f2a : __ __ __ BYT d0 00 0f fc 00 0f fd 40 3f e9 40 3f ea 50 3f f5 : .......@?.@?.P?.
2f3a : __ __ __ BYT 50 1f ea 50 15 69 40 15 55 40 07 d4 00 03 d0 00 : P..P.i@.U@......
2f4a : __ __ __ BYT 00 d0 00 00 d0 00 05 55 00 01 54 00 00 50 00 86 : .......U..T..P..
2f5a : __ __ __ BYT 00 ff 00 03 ff c0 00 14 00 00 34 00 00 35 00 00 : ..........4..5..
2f6a : __ __ __ BYT 3f 00 00 3f 40 00 ef 40 00 af 50 03 ad 50 03 fd : ?..?@..@..P..P..
2f7a : __ __ __ BYT 50 03 ad 50 00 a5 50 00 e5 40 00 15 40 00 35 00 : P..P..P..@..@.5.
2f8a : __ __ __ BYT 00 35 00 00 3c 00 00 3c 00 01 55 40 00 55 00 86 : .5..<..<..U@.U..
2f9a : __ __ __ BYT 00 0f 00 00 3f c0 00 ff f0 00 15 00 00 05 00 00 : ....?...........
2faa : __ __ __ BYT 05 40 00 3f f0 01 ff f0 03 ff f4 07 ff 54 07 f5 : .@.?.........T..
2fba : __ __ __ BYT 54 07 55 54 01 55 54 01 55 54 00 15 50 00 05 40 : T.UT.UT.UT..P..@
2fca : __ __ __ BYT 00 05 00 00 05 00 00 55 50 00 15 40 00 05 00 86 : .......UP..@....
2fda : __ __ __ BYT 00 0f c0 00 3f f0 00 ff fc 00 15 40 00 05 40 00 : ....?......@..@.
2fea : __ __ __ BYT 07 40 00 3f f0 03 fd fc 3f dd dd fd dd dd 5d dd : .@.?....?.....].
2ffa : __ __ __ BYT dd 55 55 5d 15 55 55 01 57 55 00 1f d0 00 0f c0 : .UU].UU.WU......
300a : __ __ __ BYT 00 0f c0 00 0f c0 00 55 54 00 15 50 00 05 40 86 : .......UT..P..@.
301a : __ __ __ BYT 00 00 00 00 05 40 00 35 70 00 55 54 00 57 54 00 : .....@.5p.UT.WT.
302a : __ __ __ BYT 5f d4 00 17 f0 03 ff fc 3d 5d ff f5 75 dd 75 5f : _.......=]..u.u_
303a : __ __ __ BYT dd 55 5f dd 15 5f d5 01 55 54 00 1f d0 00 f5 7c : .U_.._..UT.....|
304a : __ __ __ BYT 03 55 67 01 55 a5 00 5a a4 00 15 90 00 00 00 86 : .Ug.U..Z........
305a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
306a : __ __ __ BYT ff f0 01 7f e4 01 ff ec 35 ff ef f7 ff af 75 6a : ........5.....uj
307a : __ __ __ BYT ad 55 7f a5 15 55 65 01 55 64 00 57 64 00 55 50 : .U...Ue.Ud.Wd.UP
308a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 86 : ................
309a : __ __ __ BYT 00 00 00 00 3f b0 00 ea ac 03 ff af 03 ff ef 00 : ....?...........
30aa : __ __ __ BYT ff fc 00 1f d0 01 55 54 3f f5 7f fe bf ff 7a bf : ......UT?.....z.
30ba : __ __ __ BYT ff 5e bf ff 15 55 55 01 55 54 00 15 50 00 55 54 : .^...UU.UT..P.UT
30ca : __ __ __ BYT 00 f5 7c 00 fd fc 00 3f f0 00 0f c0 00 00 00 86 : ..|....?........
30da : __ __ __ BYT 00 0f c0 00 3f f0 00 ff fc 00 15 40 00 05 40 00 : ....?......@..@.
30ea : __ __ __ BYT 07 40 00 3f f0 03 ff fc 3e bf ff fa bf ff 7f ff : .@.?....>.......
30fa : __ __ __ BYT ff 5a b5 7f 16 95 55 01 57 54 00 1f d0 00 0f c0 : .Z....U.WT......
310a : __ __ __ BYT 00 0f c0 00 0f c0 00 55 54 00 15 50 00 05 40 86 : .......UT..P..@.
311a : __ __ __ BYT 00 0f 00 00 3f c0 00 ff f0 00 15 00 00 05 00 00 : ....?...........
312a : __ __ __ BYT 07 40 00 3f f0 01 7f f0 01 6b fc 05 ab fc 05 5f : .@.?.....k....._
313a : __ __ __ BYT fc 05 ab f4 01 69 54 01 55 54 00 17 d0 00 07 c0 : .....iT.UT......
314a : __ __ __ BYT 00 07 00 00 07 00 00 55 50 00 15 40 00 05 00 86 : .......UP..@....
315a : __ __ __ BYT 00 ff 00 03 ff c0 00 14 00 00 1c 00 00 5c 00 00 : .............\..
316a : __ __ __ BYT fc 00 01 fc 00 01 fb 00 05 fa 00 05 7a c0 05 7f : ............z...
317a : __ __ __ BYT c0 05 7a c0 05 5a 00 01 5b 00 01 54 00 00 5c 00 : ..z..Z..[..T..\.
318a : __ __ __ BYT 00 5c 00 00 3c 00 00 3c 00 01 55 40 00 55 00 86 : .\..<..<..U@.U..
319a : __ __ __ BYT 00 f0 00 03 fc 00 0f ff 00 00 54 00 00 50 00 01 : ..........T..P..
31aa : __ __ __ BYT 50 00 0f fc 00 0f ff 40 1f ff c0 15 ff d0 15 5f : P......@......._
31ba : __ __ __ BYT d0 15 55 d0 15 55 40 15 55 40 05 54 00 01 50 00 : ..U..U@.U@.T..P.
31ca : __ __ __ BYT 00 50 00 00 50 00 05 55 00 01 54 00 00 50 00 86 : .P..P..U..T..P..
31da : __ __ __ BYT 03 f0 00 0f fc 00 3f ff 00 01 54 00 01 50 00 01 : ......?...T..P..
31ea : __ __ __ BYT d0 00 0f fc 00 3f 7f c0 77 77 fc 77 77 7f 77 77 : .....?..ww.ww.ww
31fa : __ __ __ BYT 75 75 55 55 55 55 54 55 d5 40 07 f4 00 03 f0 00 : uuUUUUTU.@......
320a : __ __ __ BYT 03 f0 00 03 f0 00 15 55 00 05 54 00 01 50 00 86 : .......U..T..P..
321a : __ __ __ BYT 00 00 00 01 50 00 0d 5c 00 15 55 00 15 d5 00 17 : ....P..\..U.....
322a : __ __ __ BYT f5 00 0f d4 00 3f ff c0 ff 75 7c 77 5d 5f 77 f5 : .....?...u|w]_w.
323a : __ __ __ BYT 5d 77 f5 55 57 f5 54 15 55 40 07 f4 00 3d 5f 00 : ]w.UW.T.U@...=_.
324a : __ __ __ BYT d9 55 c0 5a 55 40 1a a5 00 06 54 00 00 00 00 86 : .U.ZU@....T.....
325a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0f : ................
326a : __ __ __ BYT ff 00 1b fd 40 3b ff 40 fb ff 5c fa ff df 7a a9 : ....@;.@..\...z.
327a : __ __ __ BYT 5d 5a fd 55 59 55 54 19 55 40 19 d5 00 05 55 00 : ]Z.UYUT.U@....U.
328a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 86 : ................
329a : __ __ __ BYT 00 00 00 0e fc 00 3a ab 00 fa ff c0 fb ff c0 3f : ......:........?
32aa : __ __ __ BYT ff 00 07 f4 00 15 55 40 fd 5f fc ff fe bf ff fe : ......U@._......
32ba : __ __ __ BYT ad ff fe b5 55 55 54 15 55 40 05 54 00 15 55 00 : ....UUT.U@.T..U.
32ca : __ __ __ BYT 3d 5f 00 3f 7f 00 0f fc 00 03 f0 00 00 00 00 86 : =_.?............
32da : __ __ __ BYT 02 a0 00 0a a8 00 2a aa 00 02 a8 00 02 a0 00 02 : ......*.........
32ea : __ __ __ BYT a0 00 0a a8 00 2a aa 80 aa aa a8 aa aa aa aa aa : .....*..........
32fa : __ __ __ BYT aa aa aa aa aa aa a8 2a aa 80 0a a8 00 02 a0 00 : .......*........
330a : __ __ __ BYT 02 a0 00 02 a0 00 2a aa 00 0a a8 00 02 a0 00 85 : ......*.........
331a : __ __ __ BYT 00 a0 00 02 a8 00 0a aa 00 00 a8 00 00 a0 00 02 : ................
332a : __ __ __ BYT a0 00 0a a8 00 0a aa 80 2a aa 80 2a aa a0 2a aa : ........*..*..*.
333a : __ __ __ BYT a0 2a aa a0 2a aa 80 2a aa 80 0a a8 00 02 a0 00 : .*..*..*........
334a : __ __ __ BYT 00 a0 00 00 a0 00 0a aa 00 02 a8 00 00 a0 00 85 : ................
335a : __ __ __ BYT 00 aa 00 02 aa 80 00 28 00 00 28 00 00 2a 00 00 : .......(..(..*..
336a : __ __ __ BYT 2a 00 00 2a 80 00 aa 80 00 aa a0 02 aa a0 02 aa : *..*............
337a : __ __ __ BYT a0 02 aa a0 00 aa a0 00 aa 80 00 2a 80 00 2a 00 : ...........*..*.
338a : __ __ __ BYT 00 2a 00 00 28 00 00 28 00 02 aa 80 00 aa 00 85 : .*..(..(........
339a : __ __ __ BYT 00 0a 00 00 2a 80 00 aa a0 00 2a 00 00 0a 00 00 : ....*.....*.....
33aa : __ __ __ BYT 0a 80 00 2a a0 02 aa a0 02 aa a8 0a aa a8 0a aa : ...*............
33ba : __ __ __ BYT a8 0a aa a8 02 aa a8 02 aa a8 00 2a a0 00 0a 80 : ...........*....
33ca : __ __ __ BYT 00 0a 00 00 0a 00 00 aa a0 00 2a 80 00 0a 00 85 : ..........*.....
33da : __ __ __ BYT 00 0a 80 00 2a a0 00 aa a8 00 2a 80 00 0a 80 00 : ....*.....*.....
33ea : __ __ __ BYT 0a 80 00 2a a0 02 aa a8 2a aa aa aa aa aa aa aa : ...*....*.......
33fa : __ __ __ BYT aa aa aa aa 2a aa aa 02 aa aa 00 2a a0 00 0a 80 : ....*......*....
340a : __ __ __ BYT 00 0a 80 00 0a 80 00 aa a8 00 2a a0 00 0a 80 85 : ..........*.....
341a : __ __ __ BYT 00 00 00 00 0a 80 00 2a a0 00 aa a8 00 aa a8 00 : .......*........
342a : __ __ __ BYT aa a8 00 2a a0 02 aa a8 2a aa aa aa aa aa aa aa : ...*....*.......
343a : __ __ __ BYT aa aa aa aa 2a aa aa 02 aa a8 00 2a a0 00 aa a8 : ....*......*....
344a : __ __ __ BYT 02 aa aa 02 aa aa 00 aa a8 00 2a a0 00 00 00 85 : ..........*.....
345a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
346a : __ __ __ BYT aa a0 02 aa a8 02 aa a8 2a aa aa aa aa aa aa aa : ........*.......
347a : __ __ __ BYT aa aa aa aa 2a aa aa 02 aa a8 00 aa a8 00 aa a0 : ....*...........
348a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
349a : __ __ __ BYT 00 00 00 00 2a a0 00 aa a8 02 aa aa 02 aa aa 00 : ....*...........
34aa : __ __ __ BYT aa a8 00 2a a0 02 aa a8 2a aa aa aa aa aa aa aa : ...*....*.......
34ba : __ __ __ BYT aa aa aa aa 2a aa aa 02 aa a8 00 2a a0 00 aa a8 : ....*......*....
34ca : __ __ __ BYT 00 aa a8 00 aa a8 00 2a a0 00 0a 80 00 00 00 85 : .......*........
34da : __ __ __ BYT 00 0a 80 00 2a a0 00 aa a8 00 2a 80 00 0a 80 00 : ....*.....*.....
34ea : __ __ __ BYT 0a 80 00 2a a0 02 aa a8 2a aa aa aa aa aa aa aa : ...*....*.......
34fa : __ __ __ BYT aa aa aa aa 2a aa aa 02 aa a8 00 2a a0 00 0a 80 : ....*......*....
350a : __ __ __ BYT 00 0a 80 00 0a 80 00 aa a8 00 2a a0 00 0a 80 85 : ..........*.....
351a : __ __ __ BYT 00 0a 00 00 2a 80 00 aa a0 00 2a 00 00 0a 00 00 : ....*.....*.....
352a : __ __ __ BYT 0a 80 00 2a a0 02 aa a0 02 aa a8 0a aa a8 0a aa : ...*............
353a : __ __ __ BYT a8 0a aa a8 02 aa a8 02 aa a8 00 2a a0 00 0a 80 : ...........*....
354a : __ __ __ BYT 00 0a 00 00 0a 00 00 aa a0 00 2a 80 00 0a 00 85 : ..........*.....
355a : __ __ __ BYT 00 aa 00 02 aa 80 00 28 00 00 28 00 00 a8 00 00 : .......(..(.....
356a : __ __ __ BYT a8 00 02 a8 00 02 aa 00 0a aa 00 0a aa 80 0a aa : ................
357a : __ __ __ BYT 80 0a aa 80 0a aa 00 02 aa 00 02 a8 00 00 a8 00 : ................
358a : __ __ __ BYT 00 a8 00 00 28 00 00 28 00 02 aa 80 00 aa 00 85 : ....(..(........
359a : __ __ __ BYT 00 a0 00 02 a8 00 0a aa 00 00 a8 00 00 a0 00 02 : ................
35aa : __ __ __ BYT a0 00 0a a8 00 0a aa 80 2a aa 80 2a aa a0 2a aa : ........*..*..*.
35ba : __ __ __ BYT a0 2a aa a0 2a aa 80 2a aa 80 0a a8 00 02 a0 00 : .*..*..*........
35ca : __ __ __ BYT 00 a0 00 00 a0 00 0a aa 00 02 a8 00 00 a0 00 85 : ................
35da : __ __ __ BYT 02 a0 00 0a a8 00 2a aa 00 02 a8 00 02 a0 00 02 : ......*.........
35ea : __ __ __ BYT a0 00 0a a8 00 2a aa 80 aa aa a8 aa aa aa aa aa : .....*..........
35fa : __ __ __ BYT aa aa aa aa aa aa a8 aa aa 80 0a a8 00 02 a0 00 : ................
360a : __ __ __ BYT 02 a0 00 02 a0 00 2a aa 00 0a a8 00 02 a0 00 85 : ......*.........
361a : __ __ __ BYT 00 00 00 02 a0 00 0a a8 00 2a aa 00 2a aa 00 2a : .........*..*..*
362a : __ __ __ BYT aa 00 0a a8 00 2a aa 80 aa aa a8 aa aa aa aa aa : .....*..........
363a : __ __ __ BYT aa aa aa aa aa aa a8 2a aa 80 0a a8 00 2a aa 00 : .......*.....*..
364a : __ __ __ BYT aa aa 80 aa aa 80 2a aa 00 0a a8 00 00 00 00 85 : ......*.........
365a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0a : ................
366a : __ __ __ BYT aa 00 2a aa 80 2a aa 80 aa aa a8 aa aa aa aa aa : ..*..*..........
367a : __ __ __ BYT aa aa aa aa aa aa a8 2a aa 80 2a aa 00 0a aa 00 : .......*..*.....
368a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
369a : __ __ __ BYT 00 00 00 0a a8 00 2a aa 00 aa aa 80 aa aa 80 2a : ......*........*
36aa : __ __ __ BYT aa 00 0a a8 00 2a aa 80 aa aa a8 aa aa aa aa aa : .....*..........
36ba : __ __ __ BYT aa aa aa aa aa aa a8 2a aa 80 0a a8 00 2a aa 00 : .......*.....*..
36ca : __ __ __ BYT 2a aa 00 2a aa 00 0a a8 00 02 a0 00 00 00 00 85 : *..*............
36da : __ __ __ BYT 02 aa 90 2a a9 50 00 0a 90 00 ff fc 02 aa a8 00 : ...*.P..........
36ea : __ __ __ BYT 55 54 00 3f ff 0f fe ea 3f ea b9 ff aa 79 ab aa : UT.?....?....y..
36fa : __ __ __ BYT 79 56 a5 79 15 6a b9 05 56 95 00 15 55 00 ff fc : yV.y.j..V...U...
370a : __ __ __ BYT 02 aa a8 00 55 54 00 0a 90 2a a9 50 02 aa 90 87 : ....UT...*.P....
371a : __ __ __ BYT 0e aa 80 0d 6a a8 0e a0 00 3f ff 00 3a aa 80 15 : ....j....?..:...
372a : __ __ __ BYT 55 00 ff fc 00 eb bf f0 ee fa ac ef aa a5 ef aa : U...............
373a : __ __ __ BYT 95 ef 9a 55 ae a5 54 aa 95 50 55 54 00 3f ff 00 : ...U..T..PUT.?..
374a : __ __ __ BYT 3a aa 80 15 55 00 0e a0 00 0d 6a a8 0e aa 80 87 : :...U.....j.....
375a : __ __ __ BYT 70 00 00 f8 00 00 f8 00 00 f8 00 00 70 00 00 00 : p...........p...
376a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
377a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
378a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 07 : ................
379a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
37aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
37ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
37ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
37da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
37ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
37fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
380a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
381a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
382a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
383a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
384a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
385a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
386a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
387a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
388a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
389a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
38aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
38ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
38ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
38da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
38ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
38fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
390a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
391a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
392a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
393a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
394a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
395a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
396a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
397a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
398a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
399a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
39aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
39ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
39ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
39da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
39ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
39fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3a1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a2a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a3a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3a5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a6a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a7a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3a8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3a9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3aaa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3aba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3aca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3ada : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3aea : __ __ __ BYT 00 00 00 14 00 00 29 00 00 29 00 00 1b 00 00 04 : ......)..)......
3afa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3b1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 3c 00 00 35 00 01 : ..........<..5..
3b2a : __ __ __ BYT d6 c0 02 96 c0 0e 5a c0 02 da 40 00 d5 80 00 15 : ......Z...@.....
3b3a : __ __ __ BYT 40 00 05 e0 00 06 a0 00 06 80 00 05 c0 00 00 00 : @...............
3b4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3b5a : __ __ __ BYT 00 00 00 00 00 00 00 03 00 00 0e 00 00 06 80 03 : ................
3b6a : __ __ __ BYT f6 80 02 96 c0 02 5a c0 02 d9 40 00 15 80 00 36 : ......Z...@....6
3b7a : __ __ __ BYT 40 00 06 60 00 06 a0 00 06 40 00 0d c0 00 00 00 : @..`.....@......
3b8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3b9a : __ __ __ BYT 00 00 00 00 00 00 3c 03 00 04 03 00 0c 36 80 00 : ......<......6..
3baa : __ __ __ BYT 1a 40 02 6a 00 02 ea 00 01 ea 40 00 e9 80 00 2a : .@.j......@....*
3bba : __ __ __ BYT 40 00 3a f0 00 06 60 00 06 40 00 0f 00 00 00 00 : @.:...`..@......
3bca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3bda : __ __ __ BYT 00 00 00 00 00 00 30 03 00 04 03 00 0c 2e 80 00 : ......0.........
3bea : __ __ __ BYT 2a c0 02 ea 00 02 ea 00 01 ea c0 00 ea 40 00 2a : *............@.*
3bfa : __ __ __ BYT c0 00 3a f0 00 3a e0 00 39 40 00 0f 00 00 00 00 : ..:..:..9@......
3c0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3c1a : __ __ __ BYT 00 00 00 00 00 00 30 00 00 04 00 00 0c 2e 80 00 : ......0.........
3c2a : __ __ __ BYT ea c0 0e aa 00 02 aa 00 03 aa c0 00 ea 40 00 2a : .............@.*
3c3a : __ __ __ BYT 80 00 3a f0 00 3a f0 00 0d c0 00 03 00 00 00 00 : ..:..:..........
3c4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3c5a : __ __ __ BYT 00 00 00 00 00 00 30 00 00 0c 00 00 0c 3e c0 03 : ......0......>..
3c6a : __ __ __ BYT 2a c0 02 ba 00 02 ea 00 03 fa c0 00 fa c0 00 2a : *..............*
3c7a : __ __ __ BYT 80 00 3a f0 00 3e f0 00 0f c0 00 03 00 00 00 00 : ..:..>..........
3c8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3c9a : __ __ __ BYT 00 00 00 00 00 00 30 03 00 0c 00 00 0c 31 c0 00 : ......0......1..
3caa : __ __ __ BYT 3a c0 02 fa 00 02 eb 00 03 fa c0 00 3a c0 00 3a : :...........:..:
3cba : __ __ __ BYT 80 00 3a f0 00 3e bc 00 0f c0 00 03 00 00 00 00 : ..:..>..........
3cca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3cda : __ __ __ BYT 00 00 00 00 00 00 30 03 00 0c 00 00 0c 33 c0 00 : ......0......3..
3cea : __ __ __ BYT 36 c0 03 fa c0 02 fb 30 03 3a c0 00 0a c0 00 3a : 6......0.:.....:
3cfa : __ __ __ BYT c0 00 3a c0 00 0e bc 00 0c c0 00 00 00 00 00 00 : ..:.............
3d0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3d1a : __ __ __ BYT 00 00 00 00 00 00 30 00 00 3c 00 00 0c 33 c0 03 : ......0..<...3..
3d2a : __ __ __ BYT 3f c0 02 ff c0 03 38 00 03 2a c0 00 0e c0 00 3e : ?.....8..*.....>
3d3a : __ __ __ BYT c0 00 3a c0 00 0f bc 00 0c c0 00 00 00 00 00 00 : ..:.............
3d4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3d5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 3c 00 00 0c 03 c0 00 : .........<......
3d6a : __ __ __ BYT 0f c0 03 3f 00 00 38 00 03 3a c0 00 0e 00 00 0e : ...?..8..:......
3d7a : __ __ __ BYT c0 00 0a 00 00 0f bc 00 00 00 00 00 00 00 00 00 : ................
3d8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3d9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 3c 00 00 0c 00 c0 00 : .........<......
3daa : __ __ __ BYT 0c c0 03 0c 00 00 b4 00 00 ff 00 00 0e 00 00 0f : ................
3dba : __ __ __ BYT cc 00 0e 00 00 0f fc 00 0f 00 00 00 00 00 00 00 : ................
3dca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 87 : ................
3dda : __ __ __ BYT 00 00 00 00 00 00 00 00 00 3c 00 00 0c 00 c0 00 : .........<......
3dea : __ __ __ BYT 0c c0 03 0c 00 00 cc 00 00 ff 00 00 0f 00 00 0f : ................
3dfa : __ __ __ BYT cc 00 0e 00 00 0f f0 00 0f 00 00 00 00 00 00 00 : ................
3e0a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3e1a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 3c 00 00 0c 00 c0 00 : .........<......
3e2a : __ __ __ BYT 00 00 00 00 00 00 cc 00 00 ff 00 00 0f 00 00 0f : ................
3e3a : __ __ __ BYT 0c 00 02 00 00 03 c0 00 0f c0 00 00 c0 00 03 00 : ................
3e4a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3e5a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 10 00 00 04 00 40 00 : ..............@.
3e6a : __ __ __ BYT 00 00 00 00 00 00 44 00 00 04 00 00 05 00 00 01 : ......D.........
3e7a : __ __ __ BYT 00 00 01 00 00 00 40 00 04 40 00 00 00 00 01 00 : ......@..@......
3e8a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 8c : ................
3e9a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 10 00 00 04 00 40 00 : ..............@.
3eaa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 04 00 00 04 00 00 01 : ................
3eba : __ __ __ BYT 00 00 01 00 00 00 40 00 00 40 00 00 00 00 00 00 : ......@..@......
3eca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 8c : ................
--------------------------------------------------------------------
tileset:
3eda : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3eea : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 01 : ................
3efa : __ __ __ BYT 02 02 02 02 01 01 01 01 01 01 01 01 01 01 01 01 : ................
3f0a : __ __ __ BYT 01 01 01 01 01 01 01 01 01 01 01 01 03 03 03 03 : ................
3f1a : __ __ __ BYT 04 01 01 01 04 01 01 01 04 01 01 01 04 01 01 01 : ................
3f2a : __ __ __ BYT 01 01 01 05 01 01 01 05 01 01 01 05 01 01 01 05 : ................
3f3a : __ __ __ BYT 00 06 07 08 09 0a 01 01 0b 01 01 01 0c 01 01 01 : ................
3f4a : __ __ __ BYT 02 0d 0e 00 01 01 0f 10 01 01 01 11 01 01 01 12 : ................
3f5a : __ __ __ BYT 04 01 01 01 13 01 01 01 14 15 01 01 00 16 17 18 : ................
3f6a : __ __ __ BYT 01 01 01 19 01 01 01 1a 01 01 1b 1c 1d 1e 1f 00 : ................
3f7a : __ __ __ BYT 20 21 21 22 23 01 01 24 23 01 01 24 25 26 26 27 :  !!"#..$#..$%&&'
3f8a : __ __ __ BYT 28 29 29 2a 2b 01 01 2c 2b 01 01 2c 2d 2e 2e 2f : ())*+..,+..,-../
3f9a : __ __ __ BYT 30 31 30 30 00 32 00 00 00 32 00 00 33 34 33 33 : 0100.2...2..3433
3faa : __ __ __ BYT 04 01 01 05 04 01 01 05 04 01 01 05 04 01 01 05 : ................
3fba : __ __ __ BYT 02 02 02 02 35 36 37 38 39 3a 3b 3c 01 3d 3e 01 : ....56789:;<.=>.
3fca : __ __ __ BYT 35 36 37 38 39 3a 3b 3c 01 3d 3e 01 03 03 03 03 : 56789:;<.=>.....
3fda : __ __ __ BYT 04 3f 40 41 04 42 43 44 04 45 46 44 04 47 48 49 : .?@A.BCD.EFD.GHI
3fea : __ __ __ BYT 4a 4b 4c 01 4d 4e 4f 50 51 52 53 54 55 56 57 58 : JKL.MNOPQRSTUVWX
3ffa : __ __ __ BYT 59 59 59 59 5a 5b 5a 5b 5c 5d 5c 5d 5e 5e 5e 5e : YYYYZ[Z[\]\]^^^^
400a : __ __ __ BYT 01 01 01 01 03 03 03 03 00 00 00 00 00 00 00 00 : ................
401a : __ __ __ BYT 00 00 00 00 00 00 00 00 02 02 02 02 01 01 01 01 : ................
402a : __ __ __ BYT 5f 60 61 01 00 00 5f 62 00 00 00 00 00 00 00 00 : _`a..._b........
403a : __ __ __ BYT 01 63 64 65 66 65 00 00 00 00 00 00 00 00 00 00 : .cdefe..........
404a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 67 68 67 69 6a 01 : ..........ghgij.
405a : __ __ __ BYT 00 00 00 00 00 00 00 00 6b 6c 00 00 01 6d 6e 6c : ........kl...mnl
406a : __ __ __ BYT 6f 00 00 70 55 71 02 72 01 01 01 01 01 01 01 01 : o..pUq.r........
407a : __ __ __ BYT 01 01 01 01 01 01 01 01 73 74 74 75 76 00 00 77 : ........sttuv..w
408a : __ __ __ BYT 02 78 79 7a 01 7b 7c 7d 01 7b 7c 7d 01 7e 7f 80 : .xyz.{|}.{|}.~..
409a : __ __ __ BYT 01 81 82 83 01 84 7c 7d 01 84 7c 7d 03 85 86 87 : ......|}..|}....
40aa : __ __ __ BYT 04 01 01 01 88 89 8a 01 8b 8c 8d 01 04 01 01 01 : ................
40ba : __ __ __ BYT 8e 03 03 8f 90 00 00 04 90 00 00 04 91 02 02 92 : ................
40ca : __ __ __ BYT 93 94 02 02 0c 01 01 01 04 01 01 01 04 01 01 01 : ................
40da : __ __ __ BYT 04 01 01 01 04 01 01 01 04 01 01 01 95 03 03 03 : ................
40ea : __ __ __ BYT 02 02 02 96 01 01 01 90 01 01 01 90 01 01 01 90 : ................
40fa : __ __ __ BYT 01 01 01 90 01 01 01 90 01 01 01 90 03 03 1d 97 : ................
410a : __ __ __ BYT 98 99 98 99 9a 9b 9a 9b 98 99 98 99 9a 9b 9a 9b : ................
411a : __ __ __ BYT 9c 00 00 9d 9e 9f a0 a1 9c 00 00 9d a2 a3 a4 a5 : ................
412a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
413a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
414a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
415a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
416a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
417a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
418a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
419a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41ea : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
41fa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
420a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
421a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
422a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
423a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
424a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
425a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
426a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
427a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
428a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
429a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42aa : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42ba : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42ca : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
tilemap:
42da : __ __ __ BYT 00 00 00 00 00 00 00 00 00 06 02 07 00 00 00 00 : ................
42ea : __ __ __ BYT 00 00 00 06 0e 07 00 00 00 00 00 00 1f 19 21 00 : ..............!.
42fa : __ __ __ BYT 00 00 06 19 0e 02 02 19 07 00 00 06 02 19 02 19 : ................
430a : __ __ __ BYT 02 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
431a : __ __ __ BYT 00 00 00 00 00 06 19 0e 02 02 02 0e 19 07 00 00 : ................
432a : __ __ __ BYT 00 00 00 00 1f 19 1b 0e 02 19 02 0e 19 21 00 00 : .............!..
433a : __ __ __ BYT 00 00 00 00 17 14 14 14 18 00 00 00 00 00 00 00 : ................
434a : __ __ __ BYT 00 00 00 17 18 17 18 17 18 00 00 00 00 00 00 00 : ................
435a : __ __ __ BYT 00 00 00 06 1b 07 00 00 06 01 11 05 00 06 07 00 : ................
436a : __ __ __ BYT 00 00 00 08 03 01 1b 19 07 00 00 00 10 23 05 0c : .............#..
437a : __ __ __ BYT 0c 0c 04 03 1a 01 0a 03 09 00 00 08 1a 0f 23 0b : ..............#.
438a : __ __ __ BYT 1c 09 00 00 00 1f 02 21 00 00 1f 1b 21 00 00 1f : .......!....!...
439a : __ __ __ BYT 0e 21 00 00 00 10 1e 1a 1c 0f 03 1a 03 09 00 06 : .!..............
43aa : __ __ __ BYT 07 00 00 06 01 12 12 12 12 12 12 12 12 01 07 00 : ................
43ba : __ __ __ BYT 00 00 06 02 0a 11 11 11 0b 1b 07 00 00 17 18 17 : ................
43ca : __ __ __ BYT 18 17 18 1d 0a 1e 0a 0b 05 00 00 00 00 00 00 00 : ................
43da : __ __ __ BYT 00 00 00 04 0b 01 02 19 12 12 12 12 0e 01 1e 19 : ................
43ea : __ __ __ BYT 07 00 00 00 00 10 11 0a 05 0c 0c 0c 1d 1e 05 00 : ................
43fa : __ __ __ BYT 00 00 1d 00 00 04 05 24 00 00 00 00 00 00 1d 05 : .......$........
440a : __ __ __ BYT 00 00 00 00 00 04 0a 05 0c 0c 10 0a 05 0c 0c 04 : ................
441a : __ __ __ BYT 0a 05 00 00 00 1d 05 00 00 24 00 00 24 00 00 10 : .........$..$...
442a : __ __ __ BYT 05 00 00 04 11 01 0a 1e 1e 0a 0a 0a 23 11 05 00 : ............#...
443a : __ __ __ BYT 00 00 04 12 12 12 12 12 12 12 05 00 00 1d 0a 0b : ................
444a : __ __ __ BYT 0a 23 05 15 16 15 16 15 16 17 18 17 18 17 18 00 : .#..............
445a : __ __ __ BYT 00 00 00 1d 12 12 12 12 0f 03 1e 0b 01 0a 03 1a : ................
446a : __ __ __ BYT 22 00 00 06 02 1e 03 1a 09 00 00 00 10 23 05 0c : "............#..
447a : __ __ __ BYT 0c 0c 04 19 1b 0b 11 02 07 00 00 06 0e 1b 0a 11 : ................
448a : __ __ __ BYT 02 07 00 00 00 20 0f 22 00 00 20 03 22 00 00 20 : ..... .".. .".. 
449a : __ __ __ BYT 1c 22 00 00 00 08 09 00 06 02 19 1b 0e 19 02 11 : ."..............
44aa : __ __ __ BYT 05 00 00 08 01 12 12 12 12 12 12 12 12 01 09 00 : ................
44ba : __ __ __ BYT 00 00 08 1c 0b 11 11 11 23 03 09 00 00 15 16 15 : ........#.......
44ca : __ __ __ BYT 16 15 16 00 00 00 00 00 00 1d 0a 0a 0b 0a 05 00 : ................
44da : __ __ __ BYT 00 00 00 08 0f 03 1a 09 00 00 20 1c 0f 22 00 00 : .......... .."..
44ea : __ __ __ BYT 00 00 00 08 1a 09 00 00 00 00 00 00 20 1a 22 00 : ............ .".
44fa : __ __ __ BYT 00 00 08 0f 1a 1c 03 1a 09 00 00 08 03 1a 03 0f : ................
450a : __ __ __ BYT 03 09 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
451a : __ __ __ BYT 00 00 00 00 00 00 00 00 08 1a 0f 03 03 1a 0f 03 : ................
452a : __ __ __ BYT 09 00 00 00 20 1a 0f 03 1c 1a 0f 03 1a 22 00 00 : .... ........"..
453a : __ __ __ BYT 00 00 00 00 15 13 13 13 16 00 00 00 00 00 00 00 : ................
454a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 15 16 15 16 15 16 00 : ................
--------------------------------------------------------------------
StatusText:
455a : __ __ __ BYT 20 53 03 0f 12 05 3a 20 30 30 30 30 30 30 20 20 :  S....: 000000  
456a : __ __ __ BYT 48 09 07 08 3a 20 30 30 30 30 30 30 20 20 20 4c : H...: 000000   L
457a : __ __ __ BYT 09 16 05 13 3a 20 30 20 00                      : ....: 0 .
--------------------------------------------------------------------
seed:
4583 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
SIDFXBigExplosion:
4585 : __ __ __ BYT e8 03 e8 03 21 00 f5 ec ff 00 00 04 00 00 e8 03 : ....!...........
4595 : __ __ __ BYT e8 03 81 00 f5 ec ff 00 00 0a 00 00 e8 03 e8 03 : ................
45a5 : __ __ __ BYT 81 00 fa f6 ff 00 00 08 50 00                   : ........P.
--------------------------------------------------------------------
SIDFXFire:
45af : __ __ __ BYT 40 1f e8 03 21 24 49 b0 ff 00 00 04 1e 00       : @...!$I.......
--------------------------------------------------------------------
SIDFXExplosion:
45bd : __ __ __ BYT e8 03 e8 03 81 00 fa ec ff 00 00 08 28 00       : ............(.
--------------------------------------------------------------------
vspriteScreen:
45cb : __ __ __ BSS	2
--------------------------------------------------------------------
rasterIRQRows:
45cd : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
45de : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
45ef : __ __ __ BSS	17
--------------------------------------------------------------------
bitshift:
4600 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
4610 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
4620 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
4630 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
nextIRQ:
4638 : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_count:
4639 : __ __ __ BSS	1
--------------------------------------------------------------------
freeShot:
463a : __ __ __ BSS	2
--------------------------------------------------------------------
joyy:
463c : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
463e : __ __ __ BSS	2
--------------------------------------------------------------------
xtileset:
4640 : __ __ __ BSS	1024
--------------------------------------------------------------------
xtilemap:
4a40 : __ __ __ BSS	720
--------------------------------------------------------------------
rasterIRQLow:
4d10 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
4d20 : __ __ __ BSS	16
--------------------------------------------------------------------
top:
4d30 : __ __ __ BSS	32
--------------------------------------------------------------------
bottom:
4d50 : __ __ __ BSS	32
--------------------------------------------------------------------
channels:
4d70 : __ __ __ BSS	30
--------------------------------------------------------------------
stars:
4d8e : __ __ __ BSS	24
--------------------------------------------------------------------
game:
4da6 : __ __ __ BSS	6
--------------------------------------------------------------------
player:
4dac : __ __ __ BSS	7
--------------------------------------------------------------------
joyb:
4db3 : __ __ __ BSS	2
--------------------------------------------------------------------
enemies:
4db5 : __ __ __ BSS	40
--------------------------------------------------------------------
xcollision:
4e00 : __ __ __ BSS	256
--------------------------------------------------------------------
shots:
4f00 : __ __ __ BSS	126
