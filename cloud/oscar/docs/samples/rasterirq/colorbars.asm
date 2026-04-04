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
080e : 8e d0 0a STX $0ad0 ; (spentry + 0)
0811 : a2 0a __ LDX #$0a
0813 : a0 d1 __ LDY #$d1
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0d __ CPX #$0d
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 11 __ CPY #$11
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
;   8, "/home/honza/projects/c64/projects/oscar64/samples/rasterirq/colorbars.c"
.s4:
0880 : 20 f5 08 JSR $08f5 ; (rirq_init_kernal.s4 + 0)
0883 : a9 00 __ LDA #$00
0885 : 85 43 __ STA T4 + 0 
0887 : a9 50 __ LDA #$50
0889 : 85 44 __ STA T5 + 0 
088b : a9 02 __ LDA #$02
088d : 85 0f __ STA P2 
088f : a9 31 __ LDA #$31
0891 : 85 0d __ STA P0 
0893 : a9 0b __ LDA #$0b
0895 : 85 0e __ STA P1 
.l5:
0897 : 20 91 09 JSR $0991 ; (rirq_build.s4 + 0)
089a : a5 43 __ LDA T4 + 0 
089c : aa __ __ TAX
089d : e8 __ __ INX
089e : 86 43 __ STX T4 + 0 
08a0 : a0 02 __ LDY #$02
08a2 : 91 0d __ STA (P0),y 
08a4 : a0 04 __ LDY #$04
08a6 : 91 0d __ STA (P0),y 
08a8 : a9 20 __ LDA #$20
08aa : a0 0b __ LDY #$0b
08ac : 91 0d __ STA (P0),y 
08ae : a9 d0 __ LDA #$d0
08b0 : c8 __ __ INY
08b1 : 91 0d __ STA (P0),y 
08b3 : a9 21 __ LDA #$21
08b5 : a0 0e __ LDY #$0e
08b7 : 91 0d __ STA (P0),y 
08b9 : a9 d0 __ LDA #$d0
08bb : c8 __ __ INY
08bc : 91 0d __ STA (P0),y 
08be : 18 __ __ CLC
08bf : a5 0d __ LDA P0 
08c1 : 69 01 __ ADC #$01
08c3 : 9d 10 0b STA $0b10,x ; (rasterIRQNext[0] + 16)
08c6 : a5 0e __ LDA P1 
08c8 : 69 00 __ ADC #$00
08ca : 9d 20 0b STA $0b20,x ; (rasterIRQLow[0] + 15)
08cd : a5 44 __ LDA T5 + 0 
08cf : 9d d0 0a STA $0ad0,x ; (spentry + 0)
08d2 : 18 __ __ CLC
08d3 : 69 08 __ ADC #$08
08d5 : 85 44 __ STA T5 + 0 
08d7 : 18 __ __ CLC
08d8 : a5 0d __ LDA P0 
08da : 69 20 __ ADC #$20
08dc : 85 0d __ STA P0 
08de : 90 02 __ BCC $08e2 ; (main.s8 + 0)
.s7:
08e0 : e6 0e __ INC P1 
.s8:
08e2 : e0 0f __ CPX #$0f
08e4 : 90 b1 __ BCC $0897 ; (main.l5 + 0)
.s6:
08e6 : a9 00 __ LDA #$00
08e8 : 20 35 0a JSR $0a35 ; (rirq_sort.s4 + 0)
08eb : 20 be 0a JSR $0abe ; (rirq_start.s4 + 0)
08ee : a9 00 __ LDA #$00
08f0 : 85 1b __ STA ACCU + 0 
08f2 : 85 1c __ STA ACCU + 1 
.s3:
08f4 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
08f5 : 20 16 09 JSR $0916 ; (rirq_init_tables.s4 + 0)
08f8 : 78 __ __ SEI
08f9 : a9 01 __ LDA #$01
08fb : 8d 1a d0 STA $d01a 
08fe : a9 34 __ LDA #$34
0900 : 8d 14 03 STA $0314 
0903 : a9 09 __ LDA #$09
0905 : 8d 15 03 STA $0315 
0908 : ad 11 d0 LDA $d011 
090b : 29 7f __ AND #$7f
090d : 8d 11 d0 STA $d011 
0910 : a9 ff __ LDA #$ff
0912 : 8d 12 d0 STA $d012 
.s3:
0915 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0916 : a2 00 __ LDX #$00
.l5:
0918 : a9 ff __ LDA #$ff
091a : 9d d1 0a STA $0ad1,x ; (rasterIRQRows[0] + 0)
091d : 8a __ __ TXA
091e : 9d e3 0a STA $0ae3,x ; (rasterIRQIndex[0] + 1)
0921 : e8 __ __ INX
0922 : e0 10 __ CPX #$10
0924 : d0 f2 __ BNE $0918 ; (rirq_init_tables.l5 + 0)
.s6:
0926 : 8e e2 0a STX $0ae2 ; (rasterIRQIndex[0] + 0)
0929 : a9 ff __ LDA #$ff
092b : 8d 10 0b STA $0b10 ; (rasterIRQNext[0] + 16)
092e : a9 00 __ LDA #$00
0930 : 8d e1 0a STA $0ae1 ; (rasterIRQRows[0] + 16)
.s3:
0933 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0934 : ad 19 d0 LDA $d019 
0937 : 10 51 __ BPL $098a ; (rirq_isr_kernal_io + 86)
0939 : ae f3 0a LDX $0af3 ; (nextIRQ + 0)
093c : 30 33 __ BMI $0971 ; (rirq_isr_kernal_io + 61)
093e : bd 00 0b LDA $0b00,x ; (rasterIRQNext[0] + 0)
0941 : bc e3 0a LDY $0ae3,x ; (rasterIRQIndex[0] + 1)
0944 : be 11 0b LDX $0b11,y ; (rasterIRQLow[0] + 0)
0947 : 8e 51 09 STX $0951 ; (rirq_isr_kernal_io + 29)
094a : be 21 0b LDX $0b21,y ; (rasterIRQHigh[0] + 0)
094d : 8e 52 09 STX $0952 ; (rirq_isr_kernal_io + 30)
0950 : 20 00 00 JSR $0000 
0953 : ee f3 0a INC $0af3 ; (nextIRQ + 0)
0956 : ae f3 0a LDX $0af3 ; (nextIRQ + 0)
0959 : bc 00 0b LDY $0b00,x ; (rasterIRQNext[0] + 0)
095c : 0e 19 d0 ASL $d019 
095f : c0 ff __ CPY #$ff
0961 : f0 14 __ BEQ $0977 ; (rirq_isr_kernal_io + 67)
0963 : 88 __ __ DEY
0964 : 88 __ __ DEY
0965 : 8c 12 d0 STY $d012 
0968 : 88 __ __ DEY
0969 : cc 12 d0 CPY $d012 
096c : 90 d0 __ BCC $093e ; (rirq_isr_kernal_io + 10)
096e : 4c 81 ea JMP $ea81 
0971 : 0e 19 d0 ASL $d019 
0974 : 4c 81 ea JMP $ea81 
0977 : ee f4 0a INC $0af4 ; (rirq_count + 0)
097a : ac 00 0b LDY $0b00 ; (rasterIRQNext[0] + 0)
097d : 88 __ __ DEY
097e : 88 __ __ DEY
097f : 8c 12 d0 STY $d012 
0982 : a2 00 __ LDX #$00
0984 : 8e f3 0a STX $0af3 ; (nextIRQ + 0)
0987 : 4c 81 ea JMP $ea81 
098a : ad 0d dc LDA $dc0d 
098d : 58 __ __ CLI
098e : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0991 : a5 0d __ LDA P0 ; (ic + 0)
0993 : 85 1b __ STA ACCU + 0 
0995 : a5 0e __ LDA P1 ; (ic + 1)
0997 : 85 1c __ STA ACCU + 1 
0999 : a9 a0 __ LDA #$a0
099b : a0 01 __ LDY #$01
099d : 91 0d __ STA (P0),y ; (ic + 0)
099f : a9 00 __ LDA #$00
09a1 : c8 __ __ INY
09a2 : 91 0d __ STA (P0),y ; (ic + 0)
09a4 : a9 a2 __ LDA #$a2
09a6 : c8 __ __ INY
09a7 : 91 0d __ STA (P0),y ; (ic + 0)
09a9 : a9 00 __ LDA #$00
09ab : c8 __ __ INY
09ac : 91 0d __ STA (P0),y ; (ic + 0)
09ae : a9 cd __ LDA #$cd
09b0 : c8 __ __ INY
09b1 : 91 0d __ STA (P0),y ; (ic + 0)
09b3 : a9 12 __ LDA #$12
09b5 : c8 __ __ INY
09b6 : 91 0d __ STA (P0),y ; (ic + 0)
09b8 : a9 d0 __ LDA #$d0
09ba : c8 __ __ INY
09bb : 91 0d __ STA (P0),y ; (ic + 0)
09bd : a9 b0 __ LDA #$b0
09bf : c8 __ __ INY
09c0 : 91 0d __ STA (P0),y ; (ic + 0)
09c2 : a9 fb __ LDA #$fb
09c4 : c8 __ __ INY
09c5 : 91 0d __ STA (P0),y ; (ic + 0)
09c7 : a9 8c __ LDA #$8c
09c9 : c8 __ __ INY
09ca : 91 0d __ STA (P0),y ; (ic + 0)
09cc : a9 00 __ LDA #$00
09ce : c8 __ __ INY
09cf : 91 0d __ STA (P0),y ; (ic + 0)
09d1 : c8 __ __ INY
09d2 : 91 0d __ STA (P0),y ; (ic + 0)
09d4 : a8 __ __ TAY
09d5 : a5 0f __ LDA P2 ; (size + 0)
09d7 : 91 0d __ STA (P0),y ; (ic + 0)
09d9 : f0 53 __ BEQ $0a2e ; (rirq_build.s5 + 0)
.s6:
09db : a0 0d __ LDY #$0d
09dd : c9 01 __ CMP #$01
09df : d0 05 __ BNE $09e6 ; (rirq_build.s7 + 0)
.s10:
09e1 : a9 60 __ LDA #$60
09e3 : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
09e5 : 60 __ __ RTS
.s7:
09e6 : a9 8e __ LDA #$8e
09e8 : 91 0d __ STA (P0),y ; (ic + 0)
09ea : a9 00 __ LDA #$00
09ec : c8 __ __ INY
09ed : 91 0d __ STA (P0),y ; (ic + 0)
09ef : c8 __ __ INY
09f0 : 91 0d __ STA (P0),y ; (ic + 0)
09f2 : a5 0f __ LDA P2 ; (size + 0)
09f4 : c9 03 __ CMP #$03
09f6 : 90 2a __ BCC $0a22 ; (rirq_build.s8 + 0)
.s9:
09f8 : e9 02 __ SBC #$02
09fa : aa __ __ TAX
09fb : 18 __ __ CLC
09fc : a5 0d __ LDA P0 ; (ic + 0)
09fe : 69 01 __ ADC #$01
0a00 : 85 1b __ STA ACCU + 0 
0a02 : a5 0e __ LDA P1 ; (ic + 1)
0a04 : 69 00 __ ADC #$00
0a06 : 85 1c __ STA ACCU + 1 
.l11:
0a08 : a9 a9 __ LDA #$a9
0a0a : 91 1b __ STA (ACCU + 0),y 
0a0c : a9 00 __ LDA #$00
0a0e : c8 __ __ INY
0a0f : 91 1b __ STA (ACCU + 0),y 
0a11 : a9 8d __ LDA #$8d
0a13 : c8 __ __ INY
0a14 : 91 1b __ STA (ACCU + 0),y 
0a16 : a9 00 __ LDA #$00
0a18 : c8 __ __ INY
0a19 : 91 1b __ STA (ACCU + 0),y 
0a1b : c8 __ __ INY
0a1c : 91 1b __ STA (ACCU + 0),y 
0a1e : c8 __ __ INY
0a1f : ca __ __ DEX
0a20 : d0 e6 __ BNE $0a08 ; (rirq_build.l11 + 0)
.s8:
0a22 : 98 __ __ TYA
0a23 : 18 __ __ CLC
0a24 : 65 0d __ ADC P0 ; (ic + 0)
0a26 : 85 1b __ STA ACCU + 0 
0a28 : a5 0e __ LDA P1 ; (ic + 1)
0a2a : 69 00 __ ADC #$00
0a2c : 85 1c __ STA ACCU + 1 
.s5:
0a2e : a9 60 __ LDA #$60
0a30 : a0 01 __ LDY #$01
0a32 : 91 1b __ STA (ACCU + 0),y 
0a34 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0a35 : 85 0d __ STA P0 ; (inirq + 0)
0a37 : a9 ff __ LDA #$ff
0a39 : 8d f3 0a STA $0af3 ; (nextIRQ + 0)
0a3c : ae e3 0a LDX $0ae3 ; (rasterIRQIndex[0] + 1)
0a3f : bd d1 0a LDA $0ad1,x ; (rasterIRQRows[0] + 0)
0a42 : 85 1c __ STA ACCU + 1 
0a44 : a2 02 __ LDX #$02
.l5:
0a46 : bc e2 0a LDY $0ae2,x ; (rasterIRQIndex[0] + 0)
0a49 : b9 d1 0a LDA $0ad1,y ; (rasterIRQRows[0] + 0)
0a4c : c5 1c __ CMP ACCU + 1 
0a4e : 90 04 __ BCC $0a54 ; (rirq_sort.s12 + 0)
.s6:
0a50 : 85 1c __ STA ACCU + 1 
0a52 : b0 24 __ BCS $0a78 ; (rirq_sort.s7 + 0)
.s12:
0a54 : 86 1d __ STX ACCU + 2 
0a56 : 84 1e __ STY ACCU + 3 
0a58 : 85 1b __ STA ACCU + 0 
0a5a : bd e1 0a LDA $0ae1,x ; (rasterIRQRows[0] + 16)
0a5d : 9d e2 0a STA $0ae2,x ; (rasterIRQIndex[0] + 0)
0a60 : 90 05 __ BCC $0a67 ; (rirq_sort.l13 + 0)
.s15:
0a62 : 98 __ __ TYA
0a63 : 9d e1 0a STA $0ae1,x ; (rasterIRQRows[0] + 16)
0a66 : ca __ __ DEX
.l13:
0a67 : a5 1b __ LDA ACCU + 0 
0a69 : bc e0 0a LDY $0ae0,x ; (rasterIRQRows[0] + 15)
0a6c : d9 d1 0a CMP $0ad1,y ; (rasterIRQRows[0] + 0)
0a6f : 90 f1 __ BCC $0a62 ; (rirq_sort.s15 + 0)
.s14:
0a71 : a5 1e __ LDA ACCU + 3 
0a73 : 9d e1 0a STA $0ae1,x ; (rasterIRQRows[0] + 16)
0a76 : a6 1d __ LDX ACCU + 2 
.s7:
0a78 : e8 __ __ INX
0a79 : e0 11 __ CPX #$11
0a7b : 90 c9 __ BCC $0a46 ; (rirq_sort.l5 + 0)
.s8:
0a7d : a2 03 __ LDX #$03
.l17:
0a7f : bc e3 0a LDY $0ae3,x ; (rasterIRQIndex[0] + 1)
0a82 : b9 d1 0a LDA $0ad1,y ; (rasterIRQRows[0] + 0)
0a85 : 9d 00 0b STA $0b00,x ; (rasterIRQNext[0] + 0)
0a88 : bc e7 0a LDY $0ae7,x ; (rasterIRQIndex[0] + 5)
0a8b : b9 d1 0a LDA $0ad1,y ; (rasterIRQRows[0] + 0)
0a8e : 9d 04 0b STA $0b04,x ; (rasterIRQNext[0] + 4)
0a91 : bc eb 0a LDY $0aeb,x ; (rasterIRQIndex[0] + 9)
0a94 : b9 d1 0a LDA $0ad1,y ; (rasterIRQRows[0] + 0)
0a97 : 9d 08 0b STA $0b08,x ; (rasterIRQNext[0] + 8)
0a9a : bc ef 0a LDY $0aef,x ; (rasterIRQIndex[0] + 13)
0a9d : b9 d1 0a LDA $0ad1,y ; (rasterIRQRows[0] + 0)
0aa0 : 9d 0c 0b STA $0b0c,x ; (rasterIRQNext[0] + 12)
0aa3 : ca __ __ DEX
0aa4 : 10 d9 __ BPL $0a7f ; (rirq_sort.l17 + 0)
.s18:
0aa6 : a5 0d __ LDA P0 ; (inirq + 0)
0aa8 : f0 06 __ BEQ $0ab0 ; (rirq_sort.s9 + 0)
.s11:
0aaa : a9 0f __ LDA #$0f
.s16:
0aac : 8d f3 0a STA $0af3 ; (nextIRQ + 0)
.s3:
0aaf : 60 __ __ RTS
.s9:
0ab0 : ac 00 0b LDY $0b00 ; (rasterIRQNext[0] + 0)
0ab3 : c0 ff __ CPY #$ff
0ab5 : f0 f8 __ BEQ $0aaf ; (rirq_sort.s3 + 0)
.s10:
0ab7 : 88 __ __ DEY
0ab8 : 8c 12 d0 STY $d012 
0abb : 4c ac 0a JMP $0aac ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0abe : ad 11 d0 LDA $d011 
0ac1 : 29 7f __ AND #$7f
0ac3 : 8d 11 d0 STA $d011 
0ac6 : a9 64 __ LDA #$64
0ac8 : 8d 12 d0 STA $d012 
0acb : 0e 19 d0 ASL $d019 
0ace : 58 __ __ CLI
.s3:
0acf : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0ad0 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
rasterIRQRows:
0ad1 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
0ae2 : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
0af3 : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_count:
0af4 : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQNext:
0b00 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQLow:
0b11 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
0b21 : __ __ __ BSS	16
--------------------------------------------------------------------
bars:
0b31 : __ __ __ BSS	480
