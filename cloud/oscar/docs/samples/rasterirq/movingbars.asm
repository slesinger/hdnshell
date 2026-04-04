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
080e : 8e 91 12 STX $1291 ; (spentry + 0)
0811 : a2 12 __ LDX #$12
0813 : a0 9a __ LDY #$9a
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 15 __ CPX #$15
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
083b : a9 fe __ LDA #$fe
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  13, "/home/honza/projects/c64/projects/oscar64/samples/rasterirq/movingbars.c"
.s4:
0880 : 20 d8 0a JSR $0ad8 ; (rirq_init_kernal.s4 + 0)
0883 : a9 03 __ LDA #$03
0885 : 85 0f __ STA P2 
0887 : a9 13 __ LDA #$13
0889 : 85 0e __ STA P1 
088b : a9 00 __ LDA #$00
088d : 85 0d __ STA P0 
088f : 20 74 0b JSR $0b74 ; (rirq_build.s4 + 0)
0892 : a9 02 __ LDA #$02
0894 : 8d 04 13 STA $1304 ; (ftop.code[0] + 3)
0897 : 8d 11 13 STA $1311 ; (ftop.code[0] + 16)
089a : a9 0a __ LDA #$0a
089c : 8d 02 13 STA $1302 ; (ftop.code[0] + 1)
089f : a9 d0 __ LDA #$d0
08a1 : 8d 0b 13 STA $130b ; (ftop.code[0] + 10)
08a4 : 8d 0f 13 STA $130f ; (ftop.code[0] + 14)
08a7 : 8d 14 13 STA $1314 ; (ftop.code[0] + 19)
08aa : a9 88 __ LDA #$88
08ac : 8d 0a 13 STA $130a ; (ftop.code[0] + 9)
08af : a9 fd __ LDA #$fd
08b1 : 8d 0c 13 STA $130c ; (ftop.code[0] + 11)
08b4 : a9 21 __ LDA #$21
08b6 : 8d 0e 13 STA $130e ; (ftop.code[0] + 13)
08b9 : a9 20 __ LDA #$20
08bb : 8d 13 13 STA $1313 ; (ftop.code[0] + 18)
08be : a9 20 __ LDA #$20
08c0 : 85 0d __ STA P0 
08c2 : a9 13 __ LDA #$13
08c4 : 85 0e __ STA P1 
08c6 : 20 74 0b JSR $0b74 ; (rirq_build.s4 + 0)
08c9 : a9 d0 __ LDA #$d0
08cb : 8d 2b 13 STA $132b ; (fbottom.code[0] + 10)
08ce : 8d 2f 13 STA $132f ; (fbottom.code[0] + 14)
08d1 : 8d 34 13 STA $1334 ; (fbottom.code[0] + 19)
08d4 : a9 0a __ LDA #$0a
08d6 : 8d 22 13 STA $1322 ; (fbottom.code[0] + 1)
08d9 : a9 06 __ LDA #$06
08db : 8d 24 13 STA $1324 ; (fbottom.code[0] + 3)
08de : a9 88 __ LDA #$88
08e0 : 8d 2a 13 STA $132a ; (fbottom.code[0] + 9)
08e3 : a9 fd __ LDA #$fd
08e5 : 8d 2c 13 STA $132c ; (fbottom.code[0] + 11)
08e8 : a9 21 __ LDA #$21
08ea : 8d 2e 13 STA $132e ; (fbottom.code[0] + 13)
08ed : a9 0e __ LDA #$0e
08ef : 8d 31 13 STA $1331 ; (fbottom.code[0] + 16)
08f2 : a9 20 __ LDA #$20
08f4 : 8d 33 13 STA $1333 ; (fbottom.code[0] + 18)
08f7 : a9 40 __ LDA #$40
08f9 : 85 0d __ STA P0 
08fb : a9 13 __ LDA #$13
08fd : 85 0e __ STA P1 
08ff : 20 74 0b JSR $0b74 ; (rirq_build.s4 + 0)
0902 : a9 07 __ LDA #$07
0904 : 8d 44 13 STA $1344 ; (btop.code[0] + 3)
0907 : 8d 51 13 STA $1351 ; (btop.code[0] + 16)
090a : a9 0a __ LDA #$0a
090c : 8d 42 13 STA $1342 ; (btop.code[0] + 1)
090f : a9 d0 __ LDA #$d0
0911 : 8d 4b 13 STA $134b ; (btop.code[0] + 10)
0914 : 8d 4f 13 STA $134f ; (btop.code[0] + 14)
0917 : 8d 54 13 STA $1354 ; (btop.code[0] + 19)
091a : a9 88 __ LDA #$88
091c : 8d 4a 13 STA $134a ; (btop.code[0] + 9)
091f : a9 fd __ LDA #$fd
0921 : 8d 4c 13 STA $134c ; (btop.code[0] + 11)
0924 : a9 21 __ LDA #$21
0926 : 8d 4e 13 STA $134e ; (btop.code[0] + 13)
0929 : a9 20 __ LDA #$20
092b : 8d 53 13 STA $1353 ; (btop.code[0] + 18)
092e : a9 60 __ LDA #$60
0930 : 85 0d __ STA P0 
0932 : a9 13 __ LDA #$13
0934 : 85 0e __ STA P1 
0936 : 20 74 0b JSR $0b74 ; (rirq_build.s4 + 0)
0939 : a9 d0 __ LDA #$d0
093b : 8d 6b 13 STA $136b ; (bbottom.code[0] + 10)
093e : 8d 6f 13 STA $136f ; (bbottom.code[0] + 14)
0941 : 8d 74 13 STA $1374 ; (bbottom.code[0] + 19)
0944 : a9 00 __ LDA #$00
0946 : 85 0f __ STA P2 
0948 : a9 0a __ LDA #$0a
094a : 8d 62 13 STA $1362 ; (bbottom.code[0] + 1)
094d : a9 06 __ LDA #$06
094f : 8d 64 13 STA $1364 ; (bbottom.code[0] + 3)
0952 : a9 88 __ LDA #$88
0954 : 8d 6a 13 STA $136a ; (bbottom.code[0] + 9)
0957 : a9 fd __ LDA #$fd
0959 : 8d 6c 13 STA $136c ; (bbottom.code[0] + 11)
095c : a9 21 __ LDA #$21
095e : 8d 6e 13 STA $136e ; (bbottom.code[0] + 13)
0961 : a9 0e __ LDA #$0e
0963 : 8d 71 13 STA $1371 ; (bbottom.code[0] + 16)
0966 : a9 20 __ LDA #$20
0968 : 8d 73 13 STA $1373 ; (bbottom.code[0] + 18)
096b : a9 80 __ LDA #$80
096d : 85 0d __ STA P0 
096f : a9 13 __ LDA #$13
0971 : 85 0e __ STA P1 
0973 : 20 74 0b JSR $0b74 ; (rirq_build.s4 + 0)
0976 : a9 64 __ LDA #$64
0978 : 8d 9a 12 STA $129a ; (rasterIRQRows[0] + 0)
097b : a9 74 __ LDA #$74
097d : 8d 9b 12 STA $129b ; (rasterIRQRows[0] + 1)
0980 : a9 c8 __ LDA #$c8
0982 : 8d 9c 12 STA $129c ; (rasterIRQRows[0] + 2)
0985 : a9 d8 __ LDA #$d8
0987 : 8d 9d 12 STA $129d ; (rasterIRQRows[0] + 3)
098a : a9 fa __ LDA #$fa
098c : 8d 9e 12 STA $129e ; (rasterIRQRows[0] + 4)
098f : a9 01 __ LDA #$01
0991 : 8d ce 12 STA $12ce ; (rasterIRQLow[0] + 0)
0994 : a9 13 __ LDA #$13
0996 : 8d de 12 STA $12de ; (rasterIRQHigh[0] + 0)
0999 : a9 21 __ LDA #$21
099b : 8d cf 12 STA $12cf ; (rasterIRQLow[0] + 1)
099e : a9 13 __ LDA #$13
09a0 : 8d df 12 STA $12df ; (rasterIRQHigh[0] + 1)
09a3 : a9 41 __ LDA #$41
09a5 : 8d d0 12 STA $12d0 ; (rasterIRQLow[0] + 2)
09a8 : a9 13 __ LDA #$13
09aa : 8d e0 12 STA $12e0 ; (rasterIRQHigh[0] + 2)
09ad : a9 61 __ LDA #$61
09af : 8d d1 12 STA $12d1 ; (rasterIRQLow[0] + 3)
09b2 : a9 13 __ LDA #$13
09b4 : 8d e1 12 STA $12e1 ; (rasterIRQHigh[0] + 3)
09b7 : a9 81 __ LDA #$81
09b9 : 8d d2 12 STA $12d2 ; (rasterIRQLow[0] + 4)
09bc : a9 13 __ LDA #$13
09be : 8d e2 12 STA $12e2 ; (rasterIRQHigh[0] + 4)
09c1 : a9 00 __ LDA #$00
09c3 : 85 4b __ STA T2 + 0 
09c5 : 20 18 0c JSR $0c18 ; (rirq_sort.s4 + 0)
09c8 : 20 a7 0c JSR $0ca7 ; (rirq_start.s4 + 0)
.l5:
09cb : a5 4b __ LDA T2 + 0 
09cd : 85 1b __ STA ACCU + 0 
09cf : a9 00 __ LDA #$00
09d1 : 85 1c __ STA ACCU + 1 
09d3 : 20 4a 12 JSR $124a ; (sint16_to_float + 0)
09d6 : a9 db __ LDA #$db
09d8 : 85 03 __ STA WORK + 0 
09da : a9 40 __ LDA #$40
09dc : 85 06 __ STA WORK + 3 
09de : a9 0f __ LDA #$0f
09e0 : 85 04 __ STA WORK + 1 
09e2 : a9 49 __ LDA #$49
09e4 : 85 05 __ STA WORK + 2 
09e6 : 20 70 0e JSR $0e70 ; (freg + 20)
09e9 : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
09ec : a9 00 __ LDA #$00
09ee : 85 03 __ STA WORK + 0 
09f0 : 85 04 __ STA WORK + 1 
09f2 : a9 80 __ LDA #$80
09f4 : 85 05 __ STA WORK + 2 
09f6 : a9 41 __ LDA #$41
09f8 : 85 06 __ STA WORK + 3 
09fa : 20 70 0e JSR $0e70 ; (freg + 20)
09fd : 20 56 10 JSR $1056 ; (crt_fdiv + 0)
0a00 : a5 1b __ LDA ACCU + 0 
0a02 : 85 0d __ STA P0 
0a04 : a5 1c __ LDA ACCU + 1 
0a06 : 85 0e __ STA P1 
0a08 : a5 1d __ LDA ACCU + 2 
0a0a : 85 0f __ STA P2 
0a0c : a5 1e __ LDA ACCU + 3 
0a0e : 85 10 __ STA P3 
0a10 : 20 b9 0c JSR $0cb9 ; (sin.s4 + 0)
0a13 : a9 00 __ LDA #$00
0a15 : 85 03 __ STA WORK + 0 
0a17 : 85 04 __ STA WORK + 1 
0a19 : a9 70 __ LDA #$70
0a1b : 85 05 __ STA WORK + 2 
0a1d : a9 42 __ LDA #$42
0a1f : 85 06 __ STA WORK + 3 
0a21 : 20 70 0e JSR $0e70 ; (freg + 20)
0a24 : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
0a27 : a9 00 __ LDA #$00
0a29 : 85 03 __ STA WORK + 0 
0a2b : 85 04 __ STA WORK + 1 
0a2d : a9 f0 __ LDA #$f0
0a2f : 85 05 __ STA WORK + 2 
0a31 : a9 42 __ LDA #$42
0a33 : 85 06 __ STA WORK + 3 
0a35 : 20 70 0e JSR $0e70 ; (freg + 20)
0a38 : 20 a7 0e JSR $0ea7 ; (faddsub + 6)
0a3b : 20 fe 11 JSR $11fe ; (f32_to_i16 + 0)
0a3e : a5 1b __ LDA ACCU + 0 
0a40 : 09 01 __ ORA #$01
0a42 : a6 4b __ LDX T2 + 0 
0a44 : 9d 00 14 STA $1400,x ; (sintab[0] + 0)
0a47 : e8 __ __ INX
0a48 : 86 4b __ STX T2 + 0 
0a4a : e0 20 __ CPX #$20
0a4c : b0 03 __ BCS $0a51 ; (main.s6 + 0)
0a4e : 4c cb 09 JMP $09cb ; (main.l5 + 0)
.s6:
0a51 : a9 03 __ LDA #$03
0a53 : 85 4c __ STA T6 + 0 
0a55 : a9 00 __ LDA #$00
0a57 : 85 4d __ STA T7 + 0 
0a59 : b0 0c __ BCS $0a67 ; (main.l7 + 0)
.s14:
0a5b : a9 00 __ LDA #$00
0a5d : 20 18 0c JSR $0c18 ; (rirq_sort.s4 + 0)
0a60 : 20 50 0e JSR $0e50 ; (rirq_wait.l4 + 0)
0a63 : e6 4d __ INC T7 + 0 
0a65 : e6 4c __ INC T6 + 0 
.l7:
0a67 : a5 4c __ LDA T6 + 0 
0a69 : 29 1f __ AND #$1f
0a6b : aa __ __ TAX
0a6c : bd 00 14 LDA $1400,x ; (sintab[0] + 0)
0a6f : 85 49 __ STA T3 + 0 
0a71 : 8d 9a 12 STA $129a ; (rasterIRQRows[0] + 0)
0a74 : a5 4d __ LDA T7 + 0 
0a76 : 29 1f __ AND #$1f
0a78 : aa __ __ TAX
0a79 : bd 00 14 LDA $1400,x ; (sintab[0] + 0)
0a7c : c5 49 __ CMP T3 + 0 
0a7e : d0 12 __ BNE $0a92 ; (main.s8 + 0)
.s19:
0a80 : a9 ff __ LDA #$ff
0a82 : 8d 9c 12 STA $129c ; (rasterIRQRows[0] + 2)
0a85 : 8d 9d 12 STA $129d ; (rasterIRQRows[0] + 3)
0a88 : a5 49 __ LDA T3 + 0 
0a8a : 69 0f __ ADC #$0f
0a8c : 8d 9b 12 STA $129b ; (rasterIRQRows[0] + 1)
0a8f : 4c 5b 0a JMP $0a5b ; (main.s14 + 0)
.s8:
0a92 : 85 4a __ STA T4 + 0 
0a94 : c5 49 __ CMP T3 + 0 
0a96 : 90 12 __ BCC $0aaa ; (main.s17 + 0)
.s9:
0a98 : a5 49 __ LDA T3 + 0 
0a9a : 69 0f __ ADC #$0f
0a9c : a8 __ __ TAY
0a9d : b0 04 __ BCS $0aa3 ; (main.s10 + 0)
.s18:
0a9f : c4 4a __ CPY T4 + 0 
0aa1 : 90 07 __ BCC $0aaa ; (main.s17 + 0)
.s10:
0aa3 : 8d 9c 12 STA $129c ; (rasterIRQRows[0] + 2)
0aa6 : a9 ff __ LDA #$ff
0aa8 : b0 09 __ BCS $0ab3 ; (main.s11 + 0)
.s17:
0aaa : a5 4a __ LDA T4 + 0 
0aac : 8d 9c 12 STA $129c ; (rasterIRQRows[0] + 2)
0aaf : a5 49 __ LDA T3 + 0 
0ab1 : 69 10 __ ADC #$10
.s11:
0ab3 : 8d 9b 12 STA $129b ; (rasterIRQRows[0] + 1)
0ab6 : 38 __ __ SEC
0ab7 : a5 49 __ LDA T3 + 0 
0ab9 : e9 10 __ SBC #$10
0abb : 90 06 __ BCC $0ac3 ; (main.s12 + 0)
.s16:
0abd : c5 4a __ CMP T4 + 0 
0abf : 90 02 __ BCC $0ac3 ; (main.s12 + 0)
.s21:
0ac1 : d0 0a __ BNE $0acd ; (main.s15 + 0)
.s12:
0ac3 : a5 49 __ LDA T3 + 0 
0ac5 : c5 4a __ CMP T4 + 0 
0ac7 : 90 04 __ BCC $0acd ; (main.s15 + 0)
.s13:
0ac9 : a9 ff __ LDA #$ff
0acb : b0 05 __ BCS $0ad2 ; (main.s20 + 0)
.s15:
0acd : 18 __ __ CLC
0ace : a5 4a __ LDA T4 + 0 
0ad0 : 69 10 __ ADC #$10
.s20:
0ad2 : 8d 9d 12 STA $129d ; (rasterIRQRows[0] + 3)
0ad5 : 4c 5b 0a JMP $0a5b ; (main.s14 + 0)
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0ad8 : 20 f9 0a JSR $0af9 ; (rirq_init_tables.s4 + 0)
0adb : 78 __ __ SEI
0adc : a9 01 __ LDA #$01
0ade : 8d 1a d0 STA $d01a 
0ae1 : a9 17 __ LDA #$17
0ae3 : 8d 14 03 STA $0314 
0ae6 : a9 0b __ LDA #$0b
0ae8 : 8d 15 03 STA $0315 
0aeb : ad 11 d0 LDA $d011 
0aee : 29 7f __ AND #$7f
0af0 : 8d 11 d0 STA $d011 
0af3 : a9 ff __ LDA #$ff
0af5 : 8d 12 d0 STA $d012 
.s3:
0af8 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0af9 : a2 00 __ LDX #$00
.l5:
0afb : a9 ff __ LDA #$ff
0afd : 9d 9a 12 STA $129a,x ; (rasterIRQRows[0] + 0)
0b00 : 8a __ __ TXA
0b01 : 9d ac 12 STA $12ac,x ; (rasterIRQIndex[0] + 1)
0b04 : e8 __ __ INX
0b05 : e0 10 __ CPX #$10
0b07 : d0 f2 __ BNE $0afb ; (rirq_init_tables.l5 + 0)
.s6:
0b09 : 8e ab 12 STX $12ab ; (rasterIRQIndex[0] + 0)
0b0c : a9 ff __ LDA #$ff
0b0e : 8d cc 12 STA $12cc ; (rasterIRQNext[0] + 16)
0b11 : a9 00 __ LDA #$00
0b13 : 8d aa 12 STA $12aa ; (rasterIRQRows[0] + 16)
.s3:
0b16 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0b17 : ad 19 d0 LDA $d019 
0b1a : 10 51 __ BPL $0b6d ; (rirq_isr_kernal_io + 86)
0b1c : ae cd 12 LDX $12cd ; (nextIRQ + 0)
0b1f : 30 33 __ BMI $0b54 ; (rirq_isr_kernal_io + 61)
0b21 : bd bc 12 LDA $12bc,x ; (rasterIRQNext[0] + 0)
0b24 : bc ac 12 LDY $12ac,x ; (rasterIRQIndex[0] + 1)
0b27 : be ce 12 LDX $12ce,y ; (rasterIRQLow[0] + 0)
0b2a : 8e 34 0b STX $0b34 ; (rirq_isr_kernal_io + 29)
0b2d : be de 12 LDX $12de,y ; (rasterIRQHigh[0] + 0)
0b30 : 8e 35 0b STX $0b35 ; (rirq_isr_kernal_io + 30)
0b33 : 20 00 00 JSR $0000 
0b36 : ee cd 12 INC $12cd ; (nextIRQ + 0)
0b39 : ae cd 12 LDX $12cd ; (nextIRQ + 0)
0b3c : bc bc 12 LDY $12bc,x ; (rasterIRQNext[0] + 0)
0b3f : 0e 19 d0 ASL $d019 
0b42 : c0 ff __ CPY #$ff
0b44 : f0 14 __ BEQ $0b5a ; (rirq_isr_kernal_io + 67)
0b46 : 88 __ __ DEY
0b47 : 88 __ __ DEY
0b48 : 8c 12 d0 STY $d012 
0b4b : 88 __ __ DEY
0b4c : cc 12 d0 CPY $d012 
0b4f : 90 d0 __ BCC $0b21 ; (rirq_isr_kernal_io + 10)
0b51 : 4c 81 ea JMP $ea81 
0b54 : 0e 19 d0 ASL $d019 
0b57 : 4c 81 ea JMP $ea81 
0b5a : ee ee 12 INC $12ee ; (rirq_count + 0)
0b5d : ac bc 12 LDY $12bc ; (rasterIRQNext[0] + 0)
0b60 : 88 __ __ DEY
0b61 : 88 __ __ DEY
0b62 : 8c 12 d0 STY $d012 
0b65 : a2 00 __ LDX #$00
0b67 : 8e cd 12 STX $12cd ; (nextIRQ + 0)
0b6a : 4c 81 ea JMP $ea81 
0b6d : ad 0d dc LDA $dc0d 
0b70 : 58 __ __ CLI
0b71 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0b74 : a5 0d __ LDA P0 ; (ic + 0)
0b76 : 85 1b __ STA ACCU + 0 
0b78 : a5 0e __ LDA P1 ; (ic + 1)
0b7a : 85 1c __ STA ACCU + 1 
0b7c : a9 a0 __ LDA #$a0
0b7e : a0 01 __ LDY #$01
0b80 : 91 0d __ STA (P0),y ; (ic + 0)
0b82 : a9 00 __ LDA #$00
0b84 : c8 __ __ INY
0b85 : 91 0d __ STA (P0),y ; (ic + 0)
0b87 : a9 a2 __ LDA #$a2
0b89 : c8 __ __ INY
0b8a : 91 0d __ STA (P0),y ; (ic + 0)
0b8c : a9 00 __ LDA #$00
0b8e : c8 __ __ INY
0b8f : 91 0d __ STA (P0),y ; (ic + 0)
0b91 : a9 cd __ LDA #$cd
0b93 : c8 __ __ INY
0b94 : 91 0d __ STA (P0),y ; (ic + 0)
0b96 : a9 12 __ LDA #$12
0b98 : c8 __ __ INY
0b99 : 91 0d __ STA (P0),y ; (ic + 0)
0b9b : a9 d0 __ LDA #$d0
0b9d : c8 __ __ INY
0b9e : 91 0d __ STA (P0),y ; (ic + 0)
0ba0 : a9 b0 __ LDA #$b0
0ba2 : c8 __ __ INY
0ba3 : 91 0d __ STA (P0),y ; (ic + 0)
0ba5 : a9 fb __ LDA #$fb
0ba7 : c8 __ __ INY
0ba8 : 91 0d __ STA (P0),y ; (ic + 0)
0baa : a9 8c __ LDA #$8c
0bac : c8 __ __ INY
0bad : 91 0d __ STA (P0),y ; (ic + 0)
0baf : a9 00 __ LDA #$00
0bb1 : c8 __ __ INY
0bb2 : 91 0d __ STA (P0),y ; (ic + 0)
0bb4 : c8 __ __ INY
0bb5 : 91 0d __ STA (P0),y ; (ic + 0)
0bb7 : a8 __ __ TAY
0bb8 : a5 0f __ LDA P2 ; (size + 0)
0bba : 91 0d __ STA (P0),y ; (ic + 0)
0bbc : f0 53 __ BEQ $0c11 ; (rirq_build.s5 + 0)
.s6:
0bbe : a0 0d __ LDY #$0d
0bc0 : c9 01 __ CMP #$01
0bc2 : d0 05 __ BNE $0bc9 ; (rirq_build.s7 + 0)
.s10:
0bc4 : a9 60 __ LDA #$60
0bc6 : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0bc8 : 60 __ __ RTS
.s7:
0bc9 : a9 8e __ LDA #$8e
0bcb : 91 0d __ STA (P0),y ; (ic + 0)
0bcd : a9 00 __ LDA #$00
0bcf : c8 __ __ INY
0bd0 : 91 0d __ STA (P0),y ; (ic + 0)
0bd2 : c8 __ __ INY
0bd3 : 91 0d __ STA (P0),y ; (ic + 0)
0bd5 : a5 0f __ LDA P2 ; (size + 0)
0bd7 : c9 03 __ CMP #$03
0bd9 : 90 2a __ BCC $0c05 ; (rirq_build.s8 + 0)
.s9:
0bdb : e9 02 __ SBC #$02
0bdd : aa __ __ TAX
0bde : 18 __ __ CLC
0bdf : a5 0d __ LDA P0 ; (ic + 0)
0be1 : 69 01 __ ADC #$01
0be3 : 85 1b __ STA ACCU + 0 
0be5 : a5 0e __ LDA P1 ; (ic + 1)
0be7 : 69 00 __ ADC #$00
0be9 : 85 1c __ STA ACCU + 1 
.l11:
0beb : a9 a9 __ LDA #$a9
0bed : 91 1b __ STA (ACCU + 0),y 
0bef : a9 00 __ LDA #$00
0bf1 : c8 __ __ INY
0bf2 : 91 1b __ STA (ACCU + 0),y 
0bf4 : a9 8d __ LDA #$8d
0bf6 : c8 __ __ INY
0bf7 : 91 1b __ STA (ACCU + 0),y 
0bf9 : a9 00 __ LDA #$00
0bfb : c8 __ __ INY
0bfc : 91 1b __ STA (ACCU + 0),y 
0bfe : c8 __ __ INY
0bff : 91 1b __ STA (ACCU + 0),y 
0c01 : c8 __ __ INY
0c02 : ca __ __ DEX
0c03 : d0 e6 __ BNE $0beb ; (rirq_build.l11 + 0)
.s8:
0c05 : 98 __ __ TYA
0c06 : 18 __ __ CLC
0c07 : 65 0d __ ADC P0 ; (ic + 0)
0c09 : 85 1b __ STA ACCU + 0 
0c0b : a5 0e __ LDA P1 ; (ic + 1)
0c0d : 69 00 __ ADC #$00
0c0f : 85 1c __ STA ACCU + 1 
.s5:
0c11 : a9 60 __ LDA #$60
0c13 : a0 01 __ LDY #$01
0c15 : 91 1b __ STA (ACCU + 0),y 
0c17 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0c18 : 85 0d __ STA P0 ; (inirq + 0)
0c1a : a9 ff __ LDA #$ff
0c1c : 8d cd 12 STA $12cd ; (nextIRQ + 0)
0c1f : ae ac 12 LDX $12ac ; (rasterIRQIndex[0] + 1)
0c22 : bd 9a 12 LDA $129a,x ; (rasterIRQRows[0] + 0)
0c25 : 85 1c __ STA ACCU + 1 
0c27 : a2 02 __ LDX #$02
.l5:
0c29 : bc ab 12 LDY $12ab,x ; (rasterIRQIndex[0] + 0)
0c2c : b9 9a 12 LDA $129a,y ; (rasterIRQRows[0] + 0)
0c2f : c5 1c __ CMP ACCU + 1 
0c31 : 90 04 __ BCC $0c37 ; (rirq_sort.s12 + 0)
.s6:
0c33 : 85 1c __ STA ACCU + 1 
0c35 : b0 24 __ BCS $0c5b ; (rirq_sort.s7 + 0)
.s12:
0c37 : 86 1d __ STX ACCU + 2 
0c39 : 84 1e __ STY ACCU + 3 
0c3b : 85 1b __ STA ACCU + 0 
0c3d : bd aa 12 LDA $12aa,x ; (rasterIRQRows[0] + 16)
0c40 : 9d ab 12 STA $12ab,x ; (rasterIRQIndex[0] + 0)
0c43 : 90 05 __ BCC $0c4a ; (rirq_sort.l13 + 0)
.s15:
0c45 : 98 __ __ TYA
0c46 : 9d aa 12 STA $12aa,x ; (rasterIRQRows[0] + 16)
0c49 : ca __ __ DEX
.l13:
0c4a : a5 1b __ LDA ACCU + 0 
0c4c : bc a9 12 LDY $12a9,x ; (rasterIRQRows[0] + 15)
0c4f : d9 9a 12 CMP $129a,y ; (rasterIRQRows[0] + 0)
0c52 : 90 f1 __ BCC $0c45 ; (rirq_sort.s15 + 0)
.s14:
0c54 : a5 1e __ LDA ACCU + 3 
0c56 : 9d aa 12 STA $12aa,x ; (rasterIRQRows[0] + 16)
0c59 : a6 1d __ LDX ACCU + 2 
.s7:
0c5b : e8 __ __ INX
0c5c : e0 11 __ CPX #$11
0c5e : 90 c9 __ BCC $0c29 ; (rirq_sort.l5 + 0)
.s8:
0c60 : a2 03 __ LDX #$03
.l17:
0c62 : bc ac 12 LDY $12ac,x ; (rasterIRQIndex[0] + 1)
0c65 : b9 9a 12 LDA $129a,y ; (rasterIRQRows[0] + 0)
0c68 : 9d bc 12 STA $12bc,x ; (rasterIRQNext[0] + 0)
0c6b : bc b0 12 LDY $12b0,x ; (rasterIRQIndex[0] + 5)
0c6e : b9 9a 12 LDA $129a,y ; (rasterIRQRows[0] + 0)
0c71 : 9d c0 12 STA $12c0,x ; (rasterIRQNext[0] + 4)
0c74 : bc b4 12 LDY $12b4,x ; (rasterIRQIndex[0] + 9)
0c77 : b9 9a 12 LDA $129a,y ; (rasterIRQRows[0] + 0)
0c7a : 9d c4 12 STA $12c4,x ; (rasterIRQNext[0] + 8)
0c7d : bc b8 12 LDY $12b8,x ; (rasterIRQIndex[0] + 13)
0c80 : b9 9a 12 LDA $129a,y ; (rasterIRQRows[0] + 0)
0c83 : 9d c8 12 STA $12c8,x ; (rasterIRQNext[0] + 12)
0c86 : ca __ __ DEX
0c87 : 10 d9 __ BPL $0c62 ; (rirq_sort.l17 + 0)
.s18:
0c89 : ad ee 12 LDA $12ee ; (rirq_count + 0)
0c8c : 8d ef 12 STA $12ef ; (rirq_pcount + 0)
0c8f : a5 0d __ LDA P0 ; (inirq + 0)
0c91 : f0 06 __ BEQ $0c99 ; (rirq_sort.s9 + 0)
.s11:
0c93 : a9 0f __ LDA #$0f
.s16:
0c95 : 8d cd 12 STA $12cd ; (nextIRQ + 0)
.s3:
0c98 : 60 __ __ RTS
.s9:
0c99 : ac bc 12 LDY $12bc ; (rasterIRQNext[0] + 0)
0c9c : c0 ff __ CPY #$ff
0c9e : f0 f8 __ BEQ $0c98 ; (rirq_sort.s3 + 0)
.s10:
0ca0 : 88 __ __ DEY
0ca1 : 8c 12 d0 STY $d012 
0ca4 : 4c 95 0c JMP $0c95 ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0ca7 : ad 11 d0 LDA $d011 
0caa : 29 7f __ AND #$7f
0cac : 8d 11 d0 STA $d011 
0caf : a9 64 __ LDA #$64
0cb1 : 8d 12 d0 STA $d012 
0cb4 : 0e 19 d0 ASL $d019 
0cb7 : 58 __ __ CLI
.s3:
0cb8 : 60 __ __ RTS
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
0cb9 : a5 0d __ LDA P0 ; (f + 0)
0cbb : 85 43 __ STA T0 + 0 
0cbd : a5 0e __ LDA P1 ; (f + 1)
0cbf : 85 44 __ STA T0 + 1 
0cc1 : a5 0f __ LDA P2 ; (f + 2)
0cc3 : 85 45 __ STA T0 + 2 
0cc5 : a5 10 __ LDA P3 ; (f + 3)
0cc7 : 29 7f __ AND #$7f
0cc9 : 05 0f __ ORA P2 ; (f + 2)
0ccb : 05 0e __ ORA P1 ; (f + 1)
0ccd : 05 0d __ ORA P0 ; (f + 0)
0ccf : f0 0e __ BEQ $0cdf ; (sin.s5 + 0)
.s22:
0cd1 : 24 10 __ BIT P3 ; (f + 3)
0cd3 : 10 0a __ BPL $0cdf ; (sin.s5 + 0)
.s21:
0cd5 : a9 00 __ LDA #$00
0cd7 : 85 47 __ STA T1 + 0 
0cd9 : 85 48 __ STA T1 + 1 
0cdb : a9 bf __ LDA #$bf
0cdd : d0 08 __ BNE $0ce7 ; (sin.s6 + 0)
.s5:
0cdf : a9 00 __ LDA #$00
0ce1 : 85 47 __ STA T1 + 0 
0ce3 : 85 48 __ STA T1 + 1 
0ce5 : a9 3f __ LDA #$3f
.s6:
0ce7 : 85 4a __ STA T1 + 3 
0ce9 : a5 10 __ LDA P3 ; (f + 3)
0ceb : 29 7f __ AND #$7f
0ced : 85 46 __ STA T0 + 3 
0cef : a9 80 __ LDA #$80
0cf1 : 85 49 __ STA T1 + 2 
0cf3 : a9 83 __ LDA #$83
0cf5 : 85 1b __ STA ACCU + 0 
0cf7 : a9 3e __ LDA #$3e
0cf9 : 85 1e __ STA ACCU + 3 
0cfb : a9 f9 __ LDA #$f9
0cfd : 85 1c __ STA ACCU + 1 
0cff : a9 22 __ LDA #$22
0d01 : 85 1d __ STA ACCU + 2 
0d03 : a2 43 __ LDX #$43
0d05 : 20 60 0e JSR $0e60 ; (freg + 4)
0d08 : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
0d0b : a5 1b __ LDA ACCU + 0 
0d0d : 85 43 __ STA T0 + 0 
0d0f : a5 1c __ LDA ACCU + 1 
0d11 : 85 44 __ STA T0 + 1 
0d13 : a5 1d __ LDA ACCU + 2 
0d15 : 85 45 __ STA T0 + 2 
0d17 : a5 1e __ LDA ACCU + 3 
0d19 : 85 46 __ STA T0 + 3 
0d1b : 20 80 0e JSR $0e80 ; (freg + 36)
0d1e : 20 04 11 JSR $1104 ; (fround + 0)
0d21 : a2 43 __ LDX #$43
0d23 : 20 60 0e JSR $0e60 ; (freg + 4)
0d26 : a5 1e __ LDA ACCU + 3 
0d28 : 49 80 __ EOR #$80
0d2a : 85 1e __ STA ACCU + 3 
0d2c : 20 a7 0e JSR $0ea7 ; (faddsub + 6)
0d2f : a5 1b __ LDA ACCU + 0 
0d31 : 85 43 __ STA T0 + 0 
0d33 : a5 1c __ LDA ACCU + 1 
0d35 : 85 44 __ STA T0 + 1 
0d37 : a6 1d __ LDX ACCU + 2 
0d39 : 86 45 __ STX T0 + 2 
0d3b : a5 1e __ LDA ACCU + 3 
0d3d : 85 46 __ STA T0 + 3 
0d3f : 30 3b __ BMI $0d7c ; (sin.s7 + 0)
.s16:
0d41 : c9 3f __ CMP #$3f
0d43 : d0 0b __ BNE $0d50 ; (sin.s20 + 0)
.s17:
0d45 : 8a __ __ TXA
0d46 : d0 08 __ BNE $0d50 ; (sin.s20 + 0)
.s18:
0d48 : a5 1c __ LDA ACCU + 1 
0d4a : d0 04 __ BNE $0d50 ; (sin.s20 + 0)
.s19:
0d4c : a5 1b __ LDA ACCU + 0 
0d4e : f0 02 __ BEQ $0d52 ; (sin.s15 + 0)
.s20:
0d50 : 90 2a __ BCC $0d7c ; (sin.s7 + 0)
.s15:
0d52 : a9 00 __ LDA #$00
0d54 : 85 1b __ STA ACCU + 0 
0d56 : 85 1c __ STA ACCU + 1 
0d58 : 85 1d __ STA ACCU + 2 
0d5a : a9 bf __ LDA #$bf
0d5c : 85 1e __ STA ACCU + 3 
0d5e : a2 43 __ LDX #$43
0d60 : 20 60 0e JSR $0e60 ; (freg + 4)
0d63 : 20 a7 0e JSR $0ea7 ; (faddsub + 6)
0d66 : a5 1b __ LDA ACCU + 0 
0d68 : 85 43 __ STA T0 + 0 
0d6a : a5 1c __ LDA ACCU + 1 
0d6c : 85 44 __ STA T0 + 1 
0d6e : a5 1d __ LDA ACCU + 2 
0d70 : 85 45 __ STA T0 + 2 
0d72 : a5 1e __ LDA ACCU + 3 
0d74 : 85 46 __ STA T0 + 3 
0d76 : a5 4a __ LDA T1 + 3 
0d78 : 49 80 __ EOR #$80
0d7a : 85 4a __ STA T1 + 3 
.s7:
0d7c : a5 1e __ LDA ACCU + 3 
0d7e : 30 38 __ BMI $0db8 ; (sin.s8 + 0)
.s10:
0d80 : c9 3e __ CMP #$3e
0d82 : d0 0e __ BNE $0d92 ; (sin.s14 + 0)
.s11:
0d84 : a5 1d __ LDA ACCU + 2 
0d86 : c9 80 __ CMP #$80
0d88 : d0 08 __ BNE $0d92 ; (sin.s14 + 0)
.s12:
0d8a : a5 1c __ LDA ACCU + 1 
0d8c : d0 04 __ BNE $0d92 ; (sin.s14 + 0)
.s13:
0d8e : a5 1b __ LDA ACCU + 0 
0d90 : f0 02 __ BEQ $0d94 ; (sin.s9 + 0)
.s14:
0d92 : 90 24 __ BCC $0db8 ; (sin.s8 + 0)
.s9:
0d94 : a9 00 __ LDA #$00
0d96 : 85 1b __ STA ACCU + 0 
0d98 : 85 1c __ STA ACCU + 1 
0d9a : 85 1d __ STA ACCU + 2 
0d9c : a9 3f __ LDA #$3f
0d9e : 85 1e __ STA ACCU + 3 
0da0 : a2 43 __ LDX #$43
0da2 : 20 60 0e JSR $0e60 ; (freg + 4)
0da5 : 20 a1 0e JSR $0ea1 ; (faddsub + 0)
0da8 : a5 1b __ LDA ACCU + 0 
0daa : 85 43 __ STA T0 + 0 
0dac : a5 1c __ LDA ACCU + 1 
0dae : 85 44 __ STA T0 + 1 
0db0 : a5 1d __ LDA ACCU + 2 
0db2 : 85 45 __ STA T0 + 2 
0db4 : a5 1e __ LDA ACCU + 3 
0db6 : 85 46 __ STA T0 + 3 
.s8:
0db8 : a9 98 __ LDA #$98
0dba : 85 1b __ STA ACCU + 0 
0dbc : a9 42 __ LDA #$42
0dbe : 85 1e __ STA ACCU + 3 
0dc0 : a9 ec __ LDA #$ec
0dc2 : 85 1c __ STA ACCU + 1 
0dc4 : a9 5e __ LDA #$5e
0dc6 : 85 1d __ STA ACCU + 2 
0dc8 : a2 43 __ LDX #$43
0dca : 20 60 0e JSR $0e60 ; (freg + 4)
0dcd : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
0dd0 : a9 f8 __ LDA #$f8
0dd2 : 85 03 __ STA WORK + 0 
0dd4 : a9 41 __ LDA #$41
0dd6 : 85 06 __ STA WORK + 3 
0dd8 : a9 c5 __ LDA #$c5
0dda : 85 04 __ STA WORK + 1 
0ddc : a9 13 __ LDA #$13
0dde : 85 05 __ STA WORK + 2 
0de0 : 20 70 0e JSR $0e70 ; (freg + 20)
0de3 : 20 a7 0e JSR $0ea7 ; (faddsub + 6)
0de6 : a2 43 __ LDX #$43
0de8 : 20 60 0e JSR $0e60 ; (freg + 4)
0deb : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
0dee : a9 6e __ LDA #$6e
0df0 : 85 03 __ STA WORK + 0 
0df2 : a9 c2 __ LDA #$c2
0df4 : 85 06 __ STA WORK + 3 
0df6 : a9 27 __ LDA #$27
0df8 : 85 04 __ STA WORK + 1 
0dfa : a9 2a __ LDA #$2a
0dfc : 85 05 __ STA WORK + 2 
0dfe : 20 70 0e JSR $0e70 ; (freg + 20)
0e01 : 20 a7 0e JSR $0ea7 ; (faddsub + 6)
0e04 : a2 43 __ LDX #$43
0e06 : 20 60 0e JSR $0e60 ; (freg + 4)
0e09 : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
0e0c : a9 df __ LDA #$df
0e0e : 85 03 __ STA WORK + 0 
0e10 : a9 3d __ LDA #$3d
0e12 : 85 06 __ STA WORK + 3 
0e14 : a9 af __ LDA #$af
0e16 : 85 04 __ STA WORK + 1 
0e18 : a9 5c __ LDA #$5c
0e1a : 85 05 __ STA WORK + 2 
0e1c : 20 70 0e JSR $0e70 ; (freg + 20)
0e1f : 20 a7 0e JSR $0ea7 ; (faddsub + 6)
0e22 : a2 43 __ LDX #$43
0e24 : 20 60 0e JSR $0e60 ; (freg + 4)
0e27 : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
0e2a : a9 b6 __ LDA #$b6
0e2c : 85 03 __ STA WORK + 0 
0e2e : a9 40 __ LDA #$40
0e30 : 85 06 __ STA WORK + 3 
0e32 : a9 0f __ LDA #$0f
0e34 : 85 04 __ STA WORK + 1 
0e36 : a9 c9 __ LDA #$c9
0e38 : 85 05 __ STA WORK + 2 
0e3a : 20 70 0e JSR $0e70 ; (freg + 20)
0e3d : 20 a7 0e JSR $0ea7 ; (faddsub + 6)
0e40 : a2 43 __ LDX #$43
0e42 : 20 60 0e JSR $0e60 ; (freg + 4)
0e45 : 20 8e 0f JSR $0f8e ; (crt_fmul + 0)
0e48 : a2 47 __ LDX #$47
0e4a : 20 60 0e JSR $0e60 ; (freg + 4)
0e4d : 4c 8e 0f JMP $0f8e ; (crt_fmul + 0)
--------------------------------------------------------------------
rirq_wait: ; rirq_wait()->void
; 198, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.l4:
0e50 : ad ee 12 LDA $12ee ; (rirq_count + 0)
0e53 : cd ef 12 CMP $12ef ; (rirq_pcount + 0)
0e56 : f0 f8 __ BEQ $0e50 ; (rirq_wait.l4 + 0)
.s5:
0e58 : 8d ef 12 STA $12ef ; (rirq_pcount + 0)
.s3:
0e5b : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
0e5c : b1 19 __ LDA (IP + 0),y 
0e5e : c8 __ __ INY
0e5f : aa __ __ TAX
0e60 : b5 00 __ LDA $00,x 
0e62 : 85 03 __ STA WORK + 0 
0e64 : b5 01 __ LDA $01,x 
0e66 : 85 04 __ STA WORK + 1 
0e68 : b5 02 __ LDA $02,x 
0e6a : 85 05 __ STA WORK + 2 
0e6c : b5 03 __ LDA WORK + 0,x 
0e6e : 85 06 __ STA WORK + 3 
0e70 : a5 05 __ LDA WORK + 2 
0e72 : 0a __ __ ASL
0e73 : a5 06 __ LDA WORK + 3 
0e75 : 2a __ __ ROL
0e76 : 85 08 __ STA WORK + 5 
0e78 : f0 06 __ BEQ $0e80 ; (freg + 36)
0e7a : a5 05 __ LDA WORK + 2 
0e7c : 09 80 __ ORA #$80
0e7e : 85 05 __ STA WORK + 2 
0e80 : a5 1d __ LDA ACCU + 2 
0e82 : 0a __ __ ASL
0e83 : a5 1e __ LDA ACCU + 3 
0e85 : 2a __ __ ROL
0e86 : 85 07 __ STA WORK + 4 
0e88 : f0 06 __ BEQ $0e90 ; (freg + 52)
0e8a : a5 1d __ LDA ACCU + 2 
0e8c : 09 80 __ ORA #$80
0e8e : 85 1d __ STA ACCU + 2 
0e90 : 60 __ __ RTS
0e91 : 06 1e __ ASL ACCU + 3 
0e93 : a5 07 __ LDA WORK + 4 
0e95 : 6a __ __ ROR
0e96 : 85 1e __ STA ACCU + 3 
0e98 : b0 06 __ BCS $0ea0 ; (freg + 68)
0e9a : a5 1d __ LDA ACCU + 2 
0e9c : 29 7f __ AND #$7f
0e9e : 85 1d __ STA ACCU + 2 
0ea0 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
0ea1 : a5 06 __ LDA WORK + 3 
0ea3 : 49 80 __ EOR #$80
0ea5 : 85 06 __ STA WORK + 3 
0ea7 : a9 ff __ LDA #$ff
0ea9 : c5 07 __ CMP WORK + 4 
0eab : f0 04 __ BEQ $0eb1 ; (faddsub + 16)
0ead : c5 08 __ CMP WORK + 5 
0eaf : d0 11 __ BNE $0ec2 ; (faddsub + 33)
0eb1 : a5 1e __ LDA ACCU + 3 
0eb3 : 09 7f __ ORA #$7f
0eb5 : 85 1e __ STA ACCU + 3 
0eb7 : a9 80 __ LDA #$80
0eb9 : 85 1d __ STA ACCU + 2 
0ebb : a9 00 __ LDA #$00
0ebd : 85 1b __ STA ACCU + 0 
0ebf : 85 1c __ STA ACCU + 1 
0ec1 : 60 __ __ RTS
0ec2 : 38 __ __ SEC
0ec3 : a5 07 __ LDA WORK + 4 
0ec5 : e5 08 __ SBC WORK + 5 
0ec7 : f0 38 __ BEQ $0f01 ; (faddsub + 96)
0ec9 : aa __ __ TAX
0eca : b0 25 __ BCS $0ef1 ; (faddsub + 80)
0ecc : e0 e9 __ CPX #$e9
0ece : b0 0e __ BCS $0ede ; (faddsub + 61)
0ed0 : a5 08 __ LDA WORK + 5 
0ed2 : 85 07 __ STA WORK + 4 
0ed4 : a9 00 __ LDA #$00
0ed6 : 85 1b __ STA ACCU + 0 
0ed8 : 85 1c __ STA ACCU + 1 
0eda : 85 1d __ STA ACCU + 2 
0edc : f0 23 __ BEQ $0f01 ; (faddsub + 96)
0ede : a5 1d __ LDA ACCU + 2 
0ee0 : 4a __ __ LSR
0ee1 : 66 1c __ ROR ACCU + 1 
0ee3 : 66 1b __ ROR ACCU + 0 
0ee5 : e8 __ __ INX
0ee6 : d0 f8 __ BNE $0ee0 ; (faddsub + 63)
0ee8 : 85 1d __ STA ACCU + 2 
0eea : a5 08 __ LDA WORK + 5 
0eec : 85 07 __ STA WORK + 4 
0eee : 4c 01 0f JMP $0f01 ; (faddsub + 96)
0ef1 : e0 18 __ CPX #$18
0ef3 : b0 33 __ BCS $0f28 ; (faddsub + 135)
0ef5 : a5 05 __ LDA WORK + 2 
0ef7 : 4a __ __ LSR
0ef8 : 66 04 __ ROR WORK + 1 
0efa : 66 03 __ ROR WORK + 0 
0efc : ca __ __ DEX
0efd : d0 f8 __ BNE $0ef7 ; (faddsub + 86)
0eff : 85 05 __ STA WORK + 2 
0f01 : a5 1e __ LDA ACCU + 3 
0f03 : 29 80 __ AND #$80
0f05 : 85 1e __ STA ACCU + 3 
0f07 : 45 06 __ EOR WORK + 3 
0f09 : 30 31 __ BMI $0f3c ; (faddsub + 155)
0f0b : 18 __ __ CLC
0f0c : a5 1b __ LDA ACCU + 0 
0f0e : 65 03 __ ADC WORK + 0 
0f10 : 85 1b __ STA ACCU + 0 
0f12 : a5 1c __ LDA ACCU + 1 
0f14 : 65 04 __ ADC WORK + 1 
0f16 : 85 1c __ STA ACCU + 1 
0f18 : a5 1d __ LDA ACCU + 2 
0f1a : 65 05 __ ADC WORK + 2 
0f1c : 85 1d __ STA ACCU + 2 
0f1e : 90 08 __ BCC $0f28 ; (faddsub + 135)
0f20 : 66 1d __ ROR ACCU + 2 
0f22 : 66 1c __ ROR ACCU + 1 
0f24 : 66 1b __ ROR ACCU + 0 
0f26 : e6 07 __ INC WORK + 4 
0f28 : a5 07 __ LDA WORK + 4 
0f2a : c9 ff __ CMP #$ff
0f2c : f0 83 __ BEQ $0eb1 ; (faddsub + 16)
0f2e : 4a __ __ LSR
0f2f : 05 1e __ ORA ACCU + 3 
0f31 : 85 1e __ STA ACCU + 3 
0f33 : b0 06 __ BCS $0f3b ; (faddsub + 154)
0f35 : a5 1d __ LDA ACCU + 2 
0f37 : 29 7f __ AND #$7f
0f39 : 85 1d __ STA ACCU + 2 
0f3b : 60 __ __ RTS
0f3c : 38 __ __ SEC
0f3d : a5 1b __ LDA ACCU + 0 
0f3f : e5 03 __ SBC WORK + 0 
0f41 : 85 1b __ STA ACCU + 0 
0f43 : a5 1c __ LDA ACCU + 1 
0f45 : e5 04 __ SBC WORK + 1 
0f47 : 85 1c __ STA ACCU + 1 
0f49 : a5 1d __ LDA ACCU + 2 
0f4b : e5 05 __ SBC WORK + 2 
0f4d : 85 1d __ STA ACCU + 2 
0f4f : b0 19 __ BCS $0f6a ; (faddsub + 201)
0f51 : 38 __ __ SEC
0f52 : a9 00 __ LDA #$00
0f54 : e5 1b __ SBC ACCU + 0 
0f56 : 85 1b __ STA ACCU + 0 
0f58 : a9 00 __ LDA #$00
0f5a : e5 1c __ SBC ACCU + 1 
0f5c : 85 1c __ STA ACCU + 1 
0f5e : a9 00 __ LDA #$00
0f60 : e5 1d __ SBC ACCU + 2 
0f62 : 85 1d __ STA ACCU + 2 
0f64 : a5 1e __ LDA ACCU + 3 
0f66 : 49 80 __ EOR #$80
0f68 : 85 1e __ STA ACCU + 3 
0f6a : a5 1d __ LDA ACCU + 2 
0f6c : 30 ba __ BMI $0f28 ; (faddsub + 135)
0f6e : 05 1c __ ORA ACCU + 1 
0f70 : 05 1b __ ORA ACCU + 0 
0f72 : f0 0f __ BEQ $0f83 ; (faddsub + 226)
0f74 : c6 07 __ DEC WORK + 4 
0f76 : f0 0b __ BEQ $0f83 ; (faddsub + 226)
0f78 : 06 1b __ ASL ACCU + 0 
0f7a : 26 1c __ ROL ACCU + 1 
0f7c : 26 1d __ ROL ACCU + 2 
0f7e : 10 f4 __ BPL $0f74 ; (faddsub + 211)
0f80 : 4c 28 0f JMP $0f28 ; (faddsub + 135)
0f83 : a9 00 __ LDA #$00
0f85 : 85 1b __ STA ACCU + 0 
0f87 : 85 1c __ STA ACCU + 1 
0f89 : 85 1d __ STA ACCU + 2 
0f8b : 85 1e __ STA ACCU + 3 
0f8d : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
0f8e : a5 1b __ LDA ACCU + 0 
0f90 : 05 1c __ ORA ACCU + 1 
0f92 : 05 1d __ ORA ACCU + 2 
0f94 : f0 0e __ BEQ $0fa4 ; (crt_fmul + 22)
0f96 : a5 03 __ LDA WORK + 0 
0f98 : 05 04 __ ORA WORK + 1 
0f9a : 05 05 __ ORA WORK + 2 
0f9c : d0 09 __ BNE $0fa7 ; (crt_fmul + 25)
0f9e : 85 1b __ STA ACCU + 0 
0fa0 : 85 1c __ STA ACCU + 1 
0fa2 : 85 1d __ STA ACCU + 2 
0fa4 : 85 1e __ STA ACCU + 3 
0fa6 : 60 __ __ RTS
0fa7 : a5 1e __ LDA ACCU + 3 
0fa9 : 45 06 __ EOR WORK + 3 
0fab : 29 80 __ AND #$80
0fad : 85 1e __ STA ACCU + 3 
0faf : a9 ff __ LDA #$ff
0fb1 : c5 07 __ CMP WORK + 4 
0fb3 : f0 42 __ BEQ $0ff7 ; (crt_fmul + 105)
0fb5 : c5 08 __ CMP WORK + 5 
0fb7 : f0 3e __ BEQ $0ff7 ; (crt_fmul + 105)
0fb9 : a9 00 __ LDA #$00
0fbb : 85 09 __ STA WORK + 6 
0fbd : 85 0a __ STA WORK + 7 
0fbf : 85 0b __ STA WORK + 8 
0fc1 : a4 1b __ LDY ACCU + 0 
0fc3 : a5 03 __ LDA WORK + 0 
0fc5 : d0 06 __ BNE $0fcd ; (crt_fmul + 63)
0fc7 : a5 04 __ LDA WORK + 1 
0fc9 : f0 0a __ BEQ $0fd5 ; (crt_fmul + 71)
0fcb : d0 05 __ BNE $0fd2 ; (crt_fmul + 68)
0fcd : 20 28 10 JSR $1028 ; (crt_fmul8 + 0)
0fd0 : a5 04 __ LDA WORK + 1 
0fd2 : 20 28 10 JSR $1028 ; (crt_fmul8 + 0)
0fd5 : a5 05 __ LDA WORK + 2 
0fd7 : 20 28 10 JSR $1028 ; (crt_fmul8 + 0)
0fda : 38 __ __ SEC
0fdb : a5 0b __ LDA WORK + 8 
0fdd : 30 06 __ BMI $0fe5 ; (crt_fmul + 87)
0fdf : 06 09 __ ASL WORK + 6 
0fe1 : 26 0a __ ROL WORK + 7 
0fe3 : 2a __ __ ROL
0fe4 : 18 __ __ CLC
0fe5 : 29 7f __ AND #$7f
0fe7 : 85 0b __ STA WORK + 8 
0fe9 : a5 07 __ LDA WORK + 4 
0feb : 65 08 __ ADC WORK + 5 
0fed : 90 19 __ BCC $1008 ; (crt_fmul + 122)
0fef : e9 7f __ SBC #$7f
0ff1 : b0 04 __ BCS $0ff7 ; (crt_fmul + 105)
0ff3 : c9 ff __ CMP #$ff
0ff5 : d0 15 __ BNE $100c ; (crt_fmul + 126)
0ff7 : a5 1e __ LDA ACCU + 3 
0ff9 : 09 7f __ ORA #$7f
0ffb : 85 1e __ STA ACCU + 3 
0ffd : a9 80 __ LDA #$80
0fff : 85 1d __ STA ACCU + 2 
1001 : a9 00 __ LDA #$00
1003 : 85 1b __ STA ACCU + 0 
1005 : 85 1c __ STA ACCU + 1 
1007 : 60 __ __ RTS
1008 : e9 7e __ SBC #$7e
100a : 90 15 __ BCC $1021 ; (crt_fmul + 147)
100c : 4a __ __ LSR
100d : 05 1e __ ORA ACCU + 3 
100f : 85 1e __ STA ACCU + 3 
1011 : a9 00 __ LDA #$00
1013 : 6a __ __ ROR
1014 : 05 0b __ ORA WORK + 8 
1016 : 85 1d __ STA ACCU + 2 
1018 : a5 0a __ LDA WORK + 7 
101a : 85 1c __ STA ACCU + 1 
101c : a5 09 __ LDA WORK + 6 
101e : 85 1b __ STA ACCU + 0 
1020 : 60 __ __ RTS
1021 : a9 00 __ LDA #$00
1023 : 85 1e __ STA ACCU + 3 
1025 : f0 d8 __ BEQ $0fff ; (crt_fmul + 113)
1027 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1028 : 38 __ __ SEC
1029 : 6a __ __ ROR
102a : 90 1e __ BCC $104a ; (crt_fmul8 + 34)
102c : aa __ __ TAX
102d : 18 __ __ CLC
102e : 98 __ __ TYA
102f : 65 09 __ ADC WORK + 6 
1031 : 85 09 __ STA WORK + 6 
1033 : a5 0a __ LDA WORK + 7 
1035 : 65 1c __ ADC ACCU + 1 
1037 : 85 0a __ STA WORK + 7 
1039 : a5 0b __ LDA WORK + 8 
103b : 65 1d __ ADC ACCU + 2 
103d : 6a __ __ ROR
103e : 85 0b __ STA WORK + 8 
1040 : 8a __ __ TXA
1041 : 66 0a __ ROR WORK + 7 
1043 : 66 09 __ ROR WORK + 6 
1045 : 4a __ __ LSR
1046 : f0 0d __ BEQ $1055 ; (crt_fmul8 + 45)
1048 : b0 e2 __ BCS $102c ; (crt_fmul8 + 4)
104a : 66 0b __ ROR WORK + 8 
104c : 66 0a __ ROR WORK + 7 
104e : 66 09 __ ROR WORK + 6 
1050 : 4a __ __ LSR
1051 : 90 f7 __ BCC $104a ; (crt_fmul8 + 34)
1053 : d0 d7 __ BNE $102c ; (crt_fmul8 + 4)
1055 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1056 : a5 1b __ LDA ACCU + 0 
1058 : 05 1c __ ORA ACCU + 1 
105a : 05 1d __ ORA ACCU + 2 
105c : d0 03 __ BNE $1061 ; (crt_fdiv + 11)
105e : 85 1e __ STA ACCU + 3 
1060 : 60 __ __ RTS
1061 : a5 1e __ LDA ACCU + 3 
1063 : 45 06 __ EOR WORK + 3 
1065 : 29 80 __ AND #$80
1067 : 85 1e __ STA ACCU + 3 
1069 : a5 08 __ LDA WORK + 5 
106b : f0 62 __ BEQ $10cf ; (crt_fdiv + 121)
106d : a5 07 __ LDA WORK + 4 
106f : c9 ff __ CMP #$ff
1071 : f0 5c __ BEQ $10cf ; (crt_fdiv + 121)
1073 : a9 00 __ LDA #$00
1075 : 85 09 __ STA WORK + 6 
1077 : 85 0a __ STA WORK + 7 
1079 : 85 0b __ STA WORK + 8 
107b : a2 18 __ LDX #$18
107d : a5 1b __ LDA ACCU + 0 
107f : c5 03 __ CMP WORK + 0 
1081 : a5 1c __ LDA ACCU + 1 
1083 : e5 04 __ SBC WORK + 1 
1085 : a5 1d __ LDA ACCU + 2 
1087 : e5 05 __ SBC WORK + 2 
1089 : 90 13 __ BCC $109e ; (crt_fdiv + 72)
108b : a5 1b __ LDA ACCU + 0 
108d : e5 03 __ SBC WORK + 0 
108f : 85 1b __ STA ACCU + 0 
1091 : a5 1c __ LDA ACCU + 1 
1093 : e5 04 __ SBC WORK + 1 
1095 : 85 1c __ STA ACCU + 1 
1097 : a5 1d __ LDA ACCU + 2 
1099 : e5 05 __ SBC WORK + 2 
109b : 85 1d __ STA ACCU + 2 
109d : 38 __ __ SEC
109e : 26 09 __ ROL WORK + 6 
10a0 : 26 0a __ ROL WORK + 7 
10a2 : 26 0b __ ROL WORK + 8 
10a4 : ca __ __ DEX
10a5 : f0 0a __ BEQ $10b1 ; (crt_fdiv + 91)
10a7 : 06 1b __ ASL ACCU + 0 
10a9 : 26 1c __ ROL ACCU + 1 
10ab : 26 1d __ ROL ACCU + 2 
10ad : b0 dc __ BCS $108b ; (crt_fdiv + 53)
10af : 90 cc __ BCC $107d ; (crt_fdiv + 39)
10b1 : 38 __ __ SEC
10b2 : a5 0b __ LDA WORK + 8 
10b4 : 30 06 __ BMI $10bc ; (crt_fdiv + 102)
10b6 : 06 09 __ ASL WORK + 6 
10b8 : 26 0a __ ROL WORK + 7 
10ba : 2a __ __ ROL
10bb : 18 __ __ CLC
10bc : 29 7f __ AND #$7f
10be : 85 0b __ STA WORK + 8 
10c0 : a5 07 __ LDA WORK + 4 
10c2 : e5 08 __ SBC WORK + 5 
10c4 : 90 1a __ BCC $10e0 ; (crt_fdiv + 138)
10c6 : 18 __ __ CLC
10c7 : 69 7f __ ADC #$7f
10c9 : b0 04 __ BCS $10cf ; (crt_fdiv + 121)
10cb : c9 ff __ CMP #$ff
10cd : d0 15 __ BNE $10e4 ; (crt_fdiv + 142)
10cf : a5 1e __ LDA ACCU + 3 
10d1 : 09 7f __ ORA #$7f
10d3 : 85 1e __ STA ACCU + 3 
10d5 : a9 80 __ LDA #$80
10d7 : 85 1d __ STA ACCU + 2 
10d9 : a9 00 __ LDA #$00
10db : 85 1c __ STA ACCU + 1 
10dd : 85 1b __ STA ACCU + 0 
10df : 60 __ __ RTS
10e0 : 69 7f __ ADC #$7f
10e2 : 90 15 __ BCC $10f9 ; (crt_fdiv + 163)
10e4 : 4a __ __ LSR
10e5 : 05 1e __ ORA ACCU + 3 
10e7 : 85 1e __ STA ACCU + 3 
10e9 : a9 00 __ LDA #$00
10eb : 6a __ __ ROR
10ec : 05 0b __ ORA WORK + 8 
10ee : 85 1d __ STA ACCU + 2 
10f0 : a5 0a __ LDA WORK + 7 
10f2 : 85 1c __ STA ACCU + 1 
10f4 : a5 09 __ LDA WORK + 6 
10f6 : 85 1b __ STA ACCU + 0 
10f8 : 60 __ __ RTS
10f9 : a9 00 __ LDA #$00
10fb : 85 1e __ STA ACCU + 3 
10fd : 85 1d __ STA ACCU + 2 
10ff : 85 1c __ STA ACCU + 1 
1101 : 85 1b __ STA ACCU + 0 
1103 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
1104 : 24 1e __ BIT ACCU + 3 
1106 : 10 13 __ BPL $111b ; (fround + 23)
1108 : 30 6b __ BMI $1175 ; (fround + 113)
110a : 24 1e __ BIT ACCU + 3 
110c : 30 0d __ BMI $111b ; (fround + 23)
110e : 10 65 __ BPL $1175 ; (fround + 113)
1110 : a9 00 __ LDA #$00
1112 : 85 1b __ STA ACCU + 0 
1114 : 85 1c __ STA ACCU + 1 
1116 : 85 1d __ STA ACCU + 2 
1118 : 85 1e __ STA ACCU + 3 
111a : 60 __ __ RTS
111b : a5 07 __ LDA WORK + 4 
111d : c9 7f __ CMP #$7f
111f : 90 ef __ BCC $1110 ; (fround + 12)
1121 : c9 87 __ CMP #$87
1123 : 90 16 __ BCC $113b ; (fround + 55)
1125 : c9 8f __ CMP #$8f
1127 : 90 26 __ BCC $114f ; (fround + 75)
1129 : c9 97 __ CMP #$97
112b : b0 34 __ BCS $1161 ; (fround + 93)
112d : 38 __ __ SEC
112e : e9 8f __ SBC #$8f
1130 : aa __ __ TAX
1131 : a5 1b __ LDA ACCU + 0 
1133 : 3d 92 12 AND $1292,x ; (ubitmask[0] + 0)
1136 : 85 1b __ STA ACCU + 0 
1138 : 4c 61 11 JMP $1161 ; (fround + 93)
113b : 38 __ __ SEC
113c : e9 7f __ SBC #$7f
113e : aa __ __ TAX
113f : a5 1d __ LDA ACCU + 2 
1141 : 3d 92 12 AND $1292,x ; (ubitmask[0] + 0)
1144 : 85 1d __ STA ACCU + 2 
1146 : a9 00 __ LDA #$00
1148 : 85 1b __ STA ACCU + 0 
114a : 85 1c __ STA ACCU + 1 
114c : 4c 61 11 JMP $1161 ; (fround + 93)
114f : 38 __ __ SEC
1150 : e9 87 __ SBC #$87
1152 : aa __ __ TAX
1153 : a5 1c __ LDA ACCU + 1 
1155 : 3d 92 12 AND $1292,x ; (ubitmask[0] + 0)
1158 : 85 1c __ STA ACCU + 1 
115a : a9 00 __ LDA #$00
115c : 85 1b __ STA ACCU + 0 
115e : 4c 61 11 JMP $1161 ; (fround + 93)
1161 : 4c 91 0e JMP $0e91 ; (freg + 53)
1164 : a9 7f __ LDA #$7f
1166 : 85 07 __ STA WORK + 4 
1168 : a9 00 __ LDA #$00
116a : 85 1b __ STA ACCU + 0 
116c : 85 1c __ STA ACCU + 1 
116e : a9 80 __ LDA #$80
1170 : 85 1d __ STA ACCU + 2 
1172 : 4c 91 0e JMP $0e91 ; (freg + 53)
1175 : a5 1b __ LDA ACCU + 0 
1177 : 05 1c __ ORA ACCU + 1 
1179 : 05 1d __ ORA ACCU + 2 
117b : f0 93 __ BEQ $1110 ; (fround + 12)
117d : a5 07 __ LDA WORK + 4 
117f : c9 7f __ CMP #$7f
1181 : 90 e1 __ BCC $1164 ; (fround + 96)
1183 : c9 87 __ CMP #$87
1185 : 90 2e __ BCC $11b5 ; (fround + 177)
1187 : c9 8f __ CMP #$8f
1189 : 90 4c __ BCC $11d7 ; (fround + 211)
118b : c9 97 __ CMP #$97
118d : b0 6c __ BCS $11fb ; (fround + 247)
118f : 38 __ __ SEC
1190 : e9 8f __ SBC #$8f
1192 : aa __ __ TAX
1193 : 18 __ __ CLC
1194 : bd 92 12 LDA $1292,x ; (ubitmask[0] + 0)
1197 : 49 ff __ EOR #$ff
1199 : 65 1b __ ADC ACCU + 0 
119b : 85 1b __ STA ACCU + 0 
119d : a9 00 __ LDA #$00
119f : 65 1c __ ADC ACCU + 1 
11a1 : 85 1c __ STA ACCU + 1 
11a3 : a9 00 __ LDA #$00
11a5 : 65 1d __ ADC ACCU + 2 
11a7 : 90 07 __ BCC $11b0 ; (fround + 172)
11a9 : 6a __ __ ROR
11aa : 66 1c __ ROR ACCU + 1 
11ac : 66 1b __ ROR ACCU + 0 
11ae : e6 07 __ INC WORK + 4 
11b0 : 85 1d __ STA ACCU + 2 
11b2 : 4c 1b 11 JMP $111b ; (fround + 23)
11b5 : 38 __ __ SEC
11b6 : e9 7f __ SBC #$7f
11b8 : aa __ __ TAX
11b9 : 18 __ __ CLC
11ba : a9 ff __ LDA #$ff
11bc : 65 1b __ ADC ACCU + 0 
11be : a9 ff __ LDA #$ff
11c0 : 65 1c __ ADC ACCU + 1 
11c2 : bd 92 12 LDA $1292,x ; (ubitmask[0] + 0)
11c5 : 49 ff __ EOR #$ff
11c7 : 65 1d __ ADC ACCU + 2 
11c9 : 90 07 __ BCC $11d2 ; (fround + 206)
11cb : 6a __ __ ROR
11cc : 66 1c __ ROR ACCU + 1 
11ce : 66 1b __ ROR ACCU + 0 
11d0 : e6 07 __ INC WORK + 4 
11d2 : 85 1d __ STA ACCU + 2 
11d4 : 4c 1b 11 JMP $111b ; (fround + 23)
11d7 : 38 __ __ SEC
11d8 : e9 87 __ SBC #$87
11da : aa __ __ TAX
11db : 18 __ __ CLC
11dc : a9 ff __ LDA #$ff
11de : 65 1b __ ADC ACCU + 0 
11e0 : bd 92 12 LDA $1292,x ; (ubitmask[0] + 0)
11e3 : 49 ff __ EOR #$ff
11e5 : 65 1c __ ADC ACCU + 1 
11e7 : 85 1c __ STA ACCU + 1 
11e9 : a9 00 __ LDA #$00
11eb : 65 1d __ ADC ACCU + 2 
11ed : 90 07 __ BCC $11f6 ; (fround + 242)
11ef : 6a __ __ ROR
11f0 : 66 1c __ ROR ACCU + 1 
11f2 : 66 1b __ ROR ACCU + 0 
11f4 : e6 07 __ INC WORK + 4 
11f6 : 85 1d __ STA ACCU + 2 
11f8 : 4c 1b 11 JMP $111b ; (fround + 23)
11fb : 4c 91 0e JMP $0e91 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
11fe : 20 80 0e JSR $0e80 ; (freg + 36)
1201 : a5 07 __ LDA WORK + 4 
1203 : c9 7f __ CMP #$7f
1205 : b0 07 __ BCS $120e ; (f32_to_i16 + 16)
1207 : a9 00 __ LDA #$00
1209 : 85 1b __ STA ACCU + 0 
120b : 85 1c __ STA ACCU + 1 
120d : 60 __ __ RTS
120e : e9 8e __ SBC #$8e
1210 : 90 16 __ BCC $1228 ; (f32_to_i16 + 42)
1212 : 24 1e __ BIT ACCU + 3 
1214 : 30 09 __ BMI $121f ; (f32_to_i16 + 33)
1216 : a9 ff __ LDA #$ff
1218 : 85 1b __ STA ACCU + 0 
121a : a9 7f __ LDA #$7f
121c : 85 1c __ STA ACCU + 1 
121e : 60 __ __ RTS
121f : a9 00 __ LDA #$00
1221 : 85 1b __ STA ACCU + 0 
1223 : a9 80 __ LDA #$80
1225 : 85 1c __ STA ACCU + 1 
1227 : 60 __ __ RTS
1228 : aa __ __ TAX
1229 : a5 1c __ LDA ACCU + 1 
122b : 46 1d __ LSR ACCU + 2 
122d : 6a __ __ ROR
122e : e8 __ __ INX
122f : d0 fa __ BNE $122b ; (f32_to_i16 + 45)
1231 : 24 1e __ BIT ACCU + 3 
1233 : 10 0e __ BPL $1243 ; (f32_to_i16 + 69)
1235 : 38 __ __ SEC
1236 : 49 ff __ EOR #$ff
1238 : 69 00 __ ADC #$00
123a : 85 1b __ STA ACCU + 0 
123c : a9 00 __ LDA #$00
123e : e5 1d __ SBC ACCU + 2 
1240 : 85 1c __ STA ACCU + 1 
1242 : 60 __ __ RTS
1243 : 85 1b __ STA ACCU + 0 
1245 : a5 1d __ LDA ACCU + 2 
1247 : 85 1c __ STA ACCU + 1 
1249 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
124a : 24 1c __ BIT ACCU + 1 
124c : 30 03 __ BMI $1251 ; (sint16_to_float + 7)
124e : 4c 68 12 JMP $1268 ; (uint16_to_float + 0)
1251 : 38 __ __ SEC
1252 : a9 00 __ LDA #$00
1254 : e5 1b __ SBC ACCU + 0 
1256 : 85 1b __ STA ACCU + 0 
1258 : a9 00 __ LDA #$00
125a : e5 1c __ SBC ACCU + 1 
125c : 85 1c __ STA ACCU + 1 
125e : 20 68 12 JSR $1268 ; (uint16_to_float + 0)
1261 : a5 1e __ LDA ACCU + 3 
1263 : 09 80 __ ORA #$80
1265 : 85 1e __ STA ACCU + 3 
1267 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1268 : a5 1b __ LDA ACCU + 0 
126a : 05 1c __ ORA ACCU + 1 
126c : d0 05 __ BNE $1273 ; (uint16_to_float + 11)
126e : 85 1d __ STA ACCU + 2 
1270 : 85 1e __ STA ACCU + 3 
1272 : 60 __ __ RTS
1273 : a2 8e __ LDX #$8e
1275 : a5 1c __ LDA ACCU + 1 
1277 : 30 06 __ BMI $127f ; (uint16_to_float + 23)
1279 : ca __ __ DEX
127a : 06 1b __ ASL ACCU + 0 
127c : 2a __ __ ROL
127d : 10 fa __ BPL $1279 ; (uint16_to_float + 17)
127f : 0a __ __ ASL
1280 : 85 1d __ STA ACCU + 2 
1282 : a5 1b __ LDA ACCU + 0 
1284 : 85 1c __ STA ACCU + 1 
1286 : 8a __ __ TXA
1287 : 4a __ __ LSR
1288 : 85 1e __ STA ACCU + 3 
128a : a9 00 __ LDA #$00
128c : 85 1b __ STA ACCU + 0 
128e : 66 1d __ ROR ACCU + 2 
1290 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1291 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
ubitmask:
1292 : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
rasterIRQRows:
129a : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
12ab : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
12bc : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
12cd : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQLow:
12ce : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
12de : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_count:
12ee : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_pcount:
12ef : __ __ __ BSS	1
--------------------------------------------------------------------
ftop:
1300 : __ __ __ BSS	32
--------------------------------------------------------------------
fbottom:
1320 : __ __ __ BSS	32
--------------------------------------------------------------------
btop:
1340 : __ __ __ BSS	32
--------------------------------------------------------------------
bbottom:
1360 : __ __ __ BSS	32
--------------------------------------------------------------------
final:
1380 : __ __ __ BSS	32
--------------------------------------------------------------------
sintab:
1400 : __ __ __ BSS	256
