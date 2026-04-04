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
080e : 8e 72 0c STX $0c72 ; (spentry + 0)
0811 : a2 0c __ LDX #$0c
0813 : a0 75 __ LDY #$75
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
082a : c0 20 __ CPY #$20
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
;  17, "/home/honza/projects/c64/projects/oscar64/samples/rasterirq/textcrawler.c"
.s4:
0880 : 20 3c 09 JSR $093c ; (rirq_init_kernal.s4 + 0)
0883 : a9 02 __ LDA #$02
0885 : 85 0f __ STA P2 
0887 : a9 0c __ LDA #$0c
0889 : 85 0e __ STA P1 
088b : a9 ca __ LDA #$ca
088d : 85 0d __ STA P0 
088f : 20 d8 09 JSR $09d8 ; (rirq_build.s4 + 0)
0892 : c6 0f __ DEC P2 
0894 : a9 d0 __ LDA #$d0
0896 : 8d d5 0c STA $0cd5 ; (scroll.code[0] + 10)
0899 : 8d d9 0c STA $0cd9 ; (scroll.code[0] + 14)
089c : a9 f1 __ LDA #$f1
089e : 8d 75 0c STA $0c75 ; (rasterIRQRows[0] + 0)
08a1 : a9 0b __ LDA #$0b
08a3 : 8d cc 0c STA $0ccc ; (scroll.code[0] + 1)
08a6 : a9 00 __ LDA #$00
08a8 : 8d ce 0c STA $0cce ; (scroll.code[0] + 3)
08ab : a9 88 __ LDA #$88
08ad : 8d d4 0c STA $0cd4 ; (scroll.code[0] + 9)
08b0 : a9 fd __ LDA #$fd
08b2 : 8d d6 0c STA $0cd6 ; (scroll.code[0] + 11)
08b5 : a9 16 __ LDA #$16
08b7 : 8d d8 0c STA $0cd8 ; (scroll.code[0] + 13)
08ba : a9 cb __ LDA #$cb
08bc : 8d a9 0c STA $0ca9 ; (rasterIRQLow[0] + 0)
08bf : a9 0c __ LDA #$0c
08c1 : 8d b9 0c STA $0cb9 ; (rasterIRQHigh[0] + 0)
08c4 : a9 00 __ LDA #$00
08c6 : 85 0d __ STA P0 
08c8 : a9 0d __ LDA #$0d
08ca : 85 0e __ STA P1 
08cc : 20 d8 09 JSR $09d8 ; (rirq_build.s4 + 0)
08cf : a9 fa __ LDA #$fa
08d1 : 8d 76 0c STA $0c76 ; (rasterIRQRows[0] + 1)
08d4 : a9 08 __ LDA #$08
08d6 : 8d 02 0d STA $0d02 ; (bottom.code[0] + 1)
08d9 : a9 16 __ LDA #$16
08db : 8d 0b 0d STA $0d0b ; (bottom.code[0] + 10)
08de : a9 d0 __ LDA #$d0
08e0 : 8d 0c 0d STA $0d0c ; (bottom.code[0] + 11)
08e3 : a9 01 __ LDA #$01
08e5 : 8d aa 0c STA $0caa ; (rasterIRQLow[0] + 1)
08e8 : a9 0d __ LDA #$0d
08ea : 8d ba 0c STA $0cba ; (rasterIRQHigh[0] + 1)
08ed : a9 00 __ LDA #$00
08ef : 20 7c 0a JSR $0a7c ; (rirq_sort.s4 + 0)
08f2 : 20 0b 0b JSR $0b0b ; (rirq_start.s4 + 0)
08f5 : a9 00 __ LDA #$00
08f7 : 85 43 __ STA T2 + 0 
08f9 : 85 44 __ STA T2 + 1 
.l8:
08fb : 20 1d 0b JSR $0b1d ; (rirq_wait.l4 + 0)
08fe : a5 43 __ LDA T2 + 0 
0900 : 29 07 __ AND #$07
0902 : aa __ __ TAX
0903 : 49 07 __ EOR #$07
0905 : 8d ce 0c STA $0cce ; (scroll.code[0] + 3)
0908 : 8a __ __ TXA
0909 : d0 28 __ BNE $0933 ; (main.s5 + 0)
.s6:
090b : a5 43 __ LDA T2 + 0 
090d : 85 1b __ STA ACCU + 0 
090f : a5 44 __ LDA T2 + 1 
0911 : 4a __ __ LSR
0912 : 66 1b __ ROR ACCU + 0 
0914 : 4a __ __ LSR
0915 : 66 1b __ ROR ACCU + 0 
0917 : 4a __ __ LSR
0918 : 66 1b __ ROR ACCU + 0 
091a : ad 73 0c LDA $0c73 ; (Text + 0)
091d : 18 __ __ CLC
091e : 65 1b __ ADC ACCU + 0 
0920 : 85 1b __ STA ACCU + 0 
0922 : ad 74 0c LDA $0c74 ; (Text + 1)
0925 : 69 00 __ ADC #$00
0927 : 85 1c __ STA ACCU + 1 
0929 : a0 27 __ LDY #$27
.l7:
092b : b1 1b __ LDA (ACCU + 0),y 
092d : 99 c0 07 STA $07c0,y 
0930 : 88 __ __ DEY
0931 : 10 f8 __ BPL $092b ; (main.l7 + 0)
.s5:
0933 : e6 43 __ INC T2 + 0 
0935 : d0 c4 __ BNE $08fb ; (main.l8 + 0)
.s9:
0937 : e6 44 __ INC T2 + 1 
0939 : 4c fb 08 JMP $08fb ; (main.l8 + 0)
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
093c : 20 5d 09 JSR $095d ; (rirq_init_tables.s4 + 0)
093f : 78 __ __ SEI
0940 : a9 01 __ LDA #$01
0942 : 8d 1a d0 STA $d01a 
0945 : a9 7b __ LDA #$7b
0947 : 8d 14 03 STA $0314 
094a : a9 09 __ LDA #$09
094c : 8d 15 03 STA $0315 
094f : ad 11 d0 LDA $d011 
0952 : 29 7f __ AND #$7f
0954 : 8d 11 d0 STA $d011 
0957 : a9 ff __ LDA #$ff
0959 : 8d 12 d0 STA $d012 
.s3:
095c : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
095d : a2 00 __ LDX #$00
.l5:
095f : a9 ff __ LDA #$ff
0961 : 9d 75 0c STA $0c75,x ; (rasterIRQRows[0] + 0)
0964 : 8a __ __ TXA
0965 : 9d 87 0c STA $0c87,x ; (rasterIRQIndex[0] + 1)
0968 : e8 __ __ INX
0969 : e0 10 __ CPX #$10
096b : d0 f2 __ BNE $095f ; (rirq_init_tables.l5 + 0)
.s6:
096d : 8e 86 0c STX $0c86 ; (rasterIRQIndex[0] + 0)
0970 : a9 ff __ LDA #$ff
0972 : 8d a7 0c STA $0ca7 ; (rasterIRQNext[0] + 16)
0975 : a9 00 __ LDA #$00
0977 : 8d 85 0c STA $0c85 ; (rasterIRQRows[0] + 16)
.s3:
097a : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
097b : ad 19 d0 LDA $d019 
097e : 10 51 __ BPL $09d1 ; (rirq_isr_kernal_io + 86)
0980 : ae a8 0c LDX $0ca8 ; (nextIRQ + 0)
0983 : 30 33 __ BMI $09b8 ; (rirq_isr_kernal_io + 61)
0985 : bd 97 0c LDA $0c97,x ; (rasterIRQNext[0] + 0)
0988 : bc 87 0c LDY $0c87,x ; (rasterIRQIndex[0] + 1)
098b : be a9 0c LDX $0ca9,y ; (rasterIRQLow[0] + 0)
098e : 8e 98 09 STX $0998 ; (rirq_isr_kernal_io + 29)
0991 : be b9 0c LDX $0cb9,y ; (rasterIRQHigh[0] + 0)
0994 : 8e 99 09 STX $0999 ; (rirq_isr_kernal_io + 30)
0997 : 20 00 00 JSR $0000 
099a : ee a8 0c INC $0ca8 ; (nextIRQ + 0)
099d : ae a8 0c LDX $0ca8 ; (nextIRQ + 0)
09a0 : bc 97 0c LDY $0c97,x ; (rasterIRQNext[0] + 0)
09a3 : 0e 19 d0 ASL $d019 
09a6 : c0 ff __ CPY #$ff
09a8 : f0 14 __ BEQ $09be ; (rirq_isr_kernal_io + 67)
09aa : 88 __ __ DEY
09ab : 88 __ __ DEY
09ac : 8c 12 d0 STY $d012 
09af : 88 __ __ DEY
09b0 : cc 12 d0 CPY $d012 
09b3 : 90 d0 __ BCC $0985 ; (rirq_isr_kernal_io + 10)
09b5 : 4c 81 ea JMP $ea81 
09b8 : 0e 19 d0 ASL $d019 
09bb : 4c 81 ea JMP $ea81 
09be : ee c9 0c INC $0cc9 ; (rirq_count + 0)
09c1 : ac 97 0c LDY $0c97 ; (rasterIRQNext[0] + 0)
09c4 : 88 __ __ DEY
09c5 : 88 __ __ DEY
09c6 : 8c 12 d0 STY $d012 
09c9 : a2 00 __ LDX #$00
09cb : 8e a8 0c STX $0ca8 ; (nextIRQ + 0)
09ce : 4c 81 ea JMP $ea81 
09d1 : ad 0d dc LDA $dc0d 
09d4 : 58 __ __ CLI
09d5 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
09d8 : a5 0d __ LDA P0 ; (ic + 0)
09da : 85 1b __ STA ACCU + 0 
09dc : a5 0e __ LDA P1 ; (ic + 1)
09de : 85 1c __ STA ACCU + 1 
09e0 : a9 a0 __ LDA #$a0
09e2 : a0 01 __ LDY #$01
09e4 : 91 0d __ STA (P0),y ; (ic + 0)
09e6 : a9 00 __ LDA #$00
09e8 : c8 __ __ INY
09e9 : 91 0d __ STA (P0),y ; (ic + 0)
09eb : a9 a2 __ LDA #$a2
09ed : c8 __ __ INY
09ee : 91 0d __ STA (P0),y ; (ic + 0)
09f0 : a9 00 __ LDA #$00
09f2 : c8 __ __ INY
09f3 : 91 0d __ STA (P0),y ; (ic + 0)
09f5 : a9 cd __ LDA #$cd
09f7 : c8 __ __ INY
09f8 : 91 0d __ STA (P0),y ; (ic + 0)
09fa : a9 12 __ LDA #$12
09fc : c8 __ __ INY
09fd : 91 0d __ STA (P0),y ; (ic + 0)
09ff : a9 d0 __ LDA #$d0
0a01 : c8 __ __ INY
0a02 : 91 0d __ STA (P0),y ; (ic + 0)
0a04 : a9 b0 __ LDA #$b0
0a06 : c8 __ __ INY
0a07 : 91 0d __ STA (P0),y ; (ic + 0)
0a09 : a9 fb __ LDA #$fb
0a0b : c8 __ __ INY
0a0c : 91 0d __ STA (P0),y ; (ic + 0)
0a0e : a9 8c __ LDA #$8c
0a10 : c8 __ __ INY
0a11 : 91 0d __ STA (P0),y ; (ic + 0)
0a13 : a9 00 __ LDA #$00
0a15 : c8 __ __ INY
0a16 : 91 0d __ STA (P0),y ; (ic + 0)
0a18 : c8 __ __ INY
0a19 : 91 0d __ STA (P0),y ; (ic + 0)
0a1b : a8 __ __ TAY
0a1c : a5 0f __ LDA P2 ; (size + 0)
0a1e : 91 0d __ STA (P0),y ; (ic + 0)
0a20 : f0 53 __ BEQ $0a75 ; (rirq_build.s5 + 0)
.s6:
0a22 : a0 0d __ LDY #$0d
0a24 : c9 01 __ CMP #$01
0a26 : d0 05 __ BNE $0a2d ; (rirq_build.s7 + 0)
.s10:
0a28 : a9 60 __ LDA #$60
0a2a : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0a2c : 60 __ __ RTS
.s7:
0a2d : a9 8e __ LDA #$8e
0a2f : 91 0d __ STA (P0),y ; (ic + 0)
0a31 : a9 00 __ LDA #$00
0a33 : c8 __ __ INY
0a34 : 91 0d __ STA (P0),y ; (ic + 0)
0a36 : c8 __ __ INY
0a37 : 91 0d __ STA (P0),y ; (ic + 0)
0a39 : a5 0f __ LDA P2 ; (size + 0)
0a3b : c9 03 __ CMP #$03
0a3d : 90 2a __ BCC $0a69 ; (rirq_build.s8 + 0)
.s9:
0a3f : e9 02 __ SBC #$02
0a41 : aa __ __ TAX
0a42 : 18 __ __ CLC
0a43 : a5 0d __ LDA P0 ; (ic + 0)
0a45 : 69 01 __ ADC #$01
0a47 : 85 1b __ STA ACCU + 0 
0a49 : a5 0e __ LDA P1 ; (ic + 1)
0a4b : 69 00 __ ADC #$00
0a4d : 85 1c __ STA ACCU + 1 
.l11:
0a4f : a9 a9 __ LDA #$a9
0a51 : 91 1b __ STA (ACCU + 0),y 
0a53 : a9 00 __ LDA #$00
0a55 : c8 __ __ INY
0a56 : 91 1b __ STA (ACCU + 0),y 
0a58 : a9 8d __ LDA #$8d
0a5a : c8 __ __ INY
0a5b : 91 1b __ STA (ACCU + 0),y 
0a5d : a9 00 __ LDA #$00
0a5f : c8 __ __ INY
0a60 : 91 1b __ STA (ACCU + 0),y 
0a62 : c8 __ __ INY
0a63 : 91 1b __ STA (ACCU + 0),y 
0a65 : c8 __ __ INY
0a66 : ca __ __ DEX
0a67 : d0 e6 __ BNE $0a4f ; (rirq_build.l11 + 0)
.s8:
0a69 : 98 __ __ TYA
0a6a : 18 __ __ CLC
0a6b : 65 0d __ ADC P0 ; (ic + 0)
0a6d : 85 1b __ STA ACCU + 0 
0a6f : a5 0e __ LDA P1 ; (ic + 1)
0a71 : 69 00 __ ADC #$00
0a73 : 85 1c __ STA ACCU + 1 
.s5:
0a75 : a9 60 __ LDA #$60
0a77 : a0 01 __ LDY #$01
0a79 : 91 1b __ STA (ACCU + 0),y 
0a7b : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0a7c : 85 0d __ STA P0 ; (inirq + 0)
0a7e : a9 ff __ LDA #$ff
0a80 : 8d a8 0c STA $0ca8 ; (nextIRQ + 0)
0a83 : ae 87 0c LDX $0c87 ; (rasterIRQIndex[0] + 1)
0a86 : bd 75 0c LDA $0c75,x ; (rasterIRQRows[0] + 0)
0a89 : 85 1c __ STA ACCU + 1 
0a8b : a2 02 __ LDX #$02
.l5:
0a8d : bc 86 0c LDY $0c86,x ; (rasterIRQIndex[0] + 0)
0a90 : b9 75 0c LDA $0c75,y ; (rasterIRQRows[0] + 0)
0a93 : c5 1c __ CMP ACCU + 1 
0a95 : 90 04 __ BCC $0a9b ; (rirq_sort.s12 + 0)
.s6:
0a97 : 85 1c __ STA ACCU + 1 
0a99 : b0 24 __ BCS $0abf ; (rirq_sort.s7 + 0)
.s12:
0a9b : 86 1d __ STX ACCU + 2 
0a9d : 84 1e __ STY ACCU + 3 
0a9f : 85 1b __ STA ACCU + 0 
0aa1 : bd 85 0c LDA $0c85,x ; (rasterIRQRows[0] + 16)
0aa4 : 9d 86 0c STA $0c86,x ; (rasterIRQIndex[0] + 0)
0aa7 : 90 05 __ BCC $0aae ; (rirq_sort.l13 + 0)
.s15:
0aa9 : 98 __ __ TYA
0aaa : 9d 85 0c STA $0c85,x ; (rasterIRQRows[0] + 16)
0aad : ca __ __ DEX
.l13:
0aae : a5 1b __ LDA ACCU + 0 
0ab0 : bc 84 0c LDY $0c84,x ; (rasterIRQRows[0] + 15)
0ab3 : d9 75 0c CMP $0c75,y ; (rasterIRQRows[0] + 0)
0ab6 : 90 f1 __ BCC $0aa9 ; (rirq_sort.s15 + 0)
.s14:
0ab8 : a5 1e __ LDA ACCU + 3 
0aba : 9d 85 0c STA $0c85,x ; (rasterIRQRows[0] + 16)
0abd : a6 1d __ LDX ACCU + 2 
.s7:
0abf : e8 __ __ INX
0ac0 : e0 11 __ CPX #$11
0ac2 : 90 c9 __ BCC $0a8d ; (rirq_sort.l5 + 0)
.s8:
0ac4 : a2 03 __ LDX #$03
.l17:
0ac6 : bc 87 0c LDY $0c87,x ; (rasterIRQIndex[0] + 1)
0ac9 : b9 75 0c LDA $0c75,y ; (rasterIRQRows[0] + 0)
0acc : 9d 97 0c STA $0c97,x ; (rasterIRQNext[0] + 0)
0acf : bc 8b 0c LDY $0c8b,x ; (rasterIRQIndex[0] + 5)
0ad2 : b9 75 0c LDA $0c75,y ; (rasterIRQRows[0] + 0)
0ad5 : 9d 9b 0c STA $0c9b,x ; (rasterIRQNext[0] + 4)
0ad8 : bc 8f 0c LDY $0c8f,x ; (rasterIRQIndex[0] + 9)
0adb : b9 75 0c LDA $0c75,y ; (rasterIRQRows[0] + 0)
0ade : 9d 9f 0c STA $0c9f,x ; (rasterIRQNext[0] + 8)
0ae1 : bc 93 0c LDY $0c93,x ; (rasterIRQIndex[0] + 13)
0ae4 : b9 75 0c LDA $0c75,y ; (rasterIRQRows[0] + 0)
0ae7 : 9d a3 0c STA $0ca3,x ; (rasterIRQNext[0] + 12)
0aea : ca __ __ DEX
0aeb : 10 d9 __ BPL $0ac6 ; (rirq_sort.l17 + 0)
.s18:
0aed : ad c9 0c LDA $0cc9 ; (rirq_count + 0)
0af0 : 8d ea 0c STA $0cea ; (rirq_pcount + 0)
0af3 : a5 0d __ LDA P0 ; (inirq + 0)
0af5 : f0 06 __ BEQ $0afd ; (rirq_sort.s9 + 0)
.s11:
0af7 : a9 0f __ LDA #$0f
.s16:
0af9 : 8d a8 0c STA $0ca8 ; (nextIRQ + 0)
.s3:
0afc : 60 __ __ RTS
.s9:
0afd : ac 97 0c LDY $0c97 ; (rasterIRQNext[0] + 0)
0b00 : c0 ff __ CPY #$ff
0b02 : f0 f8 __ BEQ $0afc ; (rirq_sort.s3 + 0)
.s10:
0b04 : 88 __ __ DEY
0b05 : 8c 12 d0 STY $d012 
0b08 : 4c f9 0a JMP $0af9 ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0b0b : ad 11 d0 LDA $d011 
0b0e : 29 7f __ AND #$7f
0b10 : 8d 11 d0 STA $d011 
0b13 : a9 64 __ LDA #$64
0b15 : 8d 12 d0 STA $d012 
0b18 : 0e 19 d0 ASL $d019 
0b1b : 58 __ __ CLI
.s3:
0b1c : 60 __ __ RTS
--------------------------------------------------------------------
rirq_wait: ; rirq_wait()->void
; 198, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.l4:
0b1d : ad c9 0c LDA $0cc9 ; (rirq_count + 0)
0b20 : cd ea 0c CMP $0cea ; (rirq_pcount + 0)
0b23 : f0 f8 __ BEQ $0b1d ; (rirq_wait.l4 + 0)
.s5:
0b25 : 8d ea 0c STA $0cea ; (rirq_pcount + 0)
.s3:
0b28 : 60 __ __ RTS
--------------------------------------------------------------------
0b29 : __ __ __ BYT 0c 01 02 0f 12 15 0d 20 12 05 12 15 0d 20 11 15 : ....... ..... ..
0b39 : __ __ __ BYT 0f 2e 20 11 15 01 13 09 20 09 0e 2c 20 13 05 11 : .. ..... .., ...
0b49 : __ __ __ BYT 15 09 2c 20 14 05 0e 05 14 15 12 20 16 0f 0c 15 : .., ....... ....
0b59 : __ __ __ BYT 10 14 01 14 05 0d 20 12 05 12 15 0d 20 10 0f 12 : ...... ..... ...
0b69 : __ __ __ BYT 12 0f 20 0e 0f 0e 20 05 14 20 0d 01 09 0f 12 05 : .. ... .. ......
0b79 : __ __ __ BYT 13 20 01 0c 09 01 13 20 0f 04 09 0f 20 05 13 14 : . ..... .... ...
0b89 : __ __ __ BYT 20 05 0f 13 2e 20 0d 01 07 0e 01 0d 20 01 10 05 :  .... ...... ...
0b99 : __ __ __ BYT 12 09 01 0d 20 03 15 0d 20 05 14 20 05 13 13 05 : .... ... .. ....
0ba9 : __ __ __ BYT 20 14 05 0d 10 0f 12 05 20 09 14 01 11 15 05 20 :  ....... ...... 
0bb9 : __ __ __ BYT 14 05 0d 10 0f 12 01 20 16 0f 0c 15 10 14 01 13 : ....... ........
0bc9 : __ __ __ BYT 20 05 14 20 09 10 13 01 0d 20 09 10 13 01 0d 20 :  .. ..... ..... 
0bd9 : __ __ __ BYT 05 01 12 15 0d 2e 20 09 04 20 13 15 13 03 09 10 : ...... .. ......
0be9 : __ __ __ BYT 09 14 20 11 15 09 01 20 12 05 12 15 0d 20 12 05 : .. .... ..... ..
0bf9 : __ __ __ BYT 10 12 05 08 05 0e 04 05 12 09 14 20 05 12 12 0f : ........... ....
0c09 : __ __ __ BYT 12 20 05 14 20 15 14 2e 20 04 0f 0c 0f 12 20 09 : . .. ... ..... .
0c19 : __ __ __ BYT 04 20 03 0f 12 10 0f 12 09 13 2c 20 05 0f 13 3f : . ........, ...?
0c29 : __ __ __ BYT 20 15 0e 04 05 20 16 05 12 0f 20 09 13 14 05 20 :  .... .... .... 
0c39 : __ __ __ BYT 11 15 09 01 3f 20 05 01 11 15 05 20 05 01 11 15 : ....? ..... ....
0c49 : __ __ __ BYT 05 2e 20 09 0e 2e 20 01 15 14 20 09 04 20 05 18 : .. ... ... .. ..
0c59 : __ __ __ BYT 10 05 04 09 14 01 20 09 0c 0c 15 0d 20 0d 0f 0c : ...... ..... ...
0c69 : __ __ __ BYT 05 13 14 09 01 13 2c 20 00                      : ......, .
--------------------------------------------------------------------
spentry:
0c72 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
Text:
0c73 : __ __ __ BYT 29 0b                                           : ).
--------------------------------------------------------------------
rasterIRQRows:
0c75 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
0c86 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
0c97 : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
0ca8 : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQLow:
0ca9 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
0cb9 : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_count:
0cc9 : __ __ __ BSS	1
--------------------------------------------------------------------
scroll:
0cca : __ __ __ BSS	32
--------------------------------------------------------------------
rirq_pcount:
0cea : __ __ __ BSS	1
--------------------------------------------------------------------
bottom:
0d00 : __ __ __ BSS	32
