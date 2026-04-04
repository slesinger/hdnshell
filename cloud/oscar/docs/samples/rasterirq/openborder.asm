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
080e : 8e fd 09 STX $09fd ; (spentry + 0)
0811 : a2 0c __ LDX #$0c
0813 : a0 80 __ LDY #$80
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
082a : c0 c0 __ CPY #$c0
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
;  14, "/home/honza/projects/c64/projects/oscar64/samples/rasterirq/openborder.c"
.s4:
0880 : 20 b2 09 JSR $09b2 ; (rirq_init_kernal.s4 + 0)
0883 : a9 01 __ LDA #$01
0885 : 85 0f __ STA P2 
0887 : a9 0c __ LDA #$0c
0889 : 85 0e __ STA P1 
088b : a9 80 __ LDA #$80
088d : 85 0d __ STA P0 
088f : 20 5d 0a JSR $0a5d ; (rirq_build.s4 + 0)
0892 : a9 f7 __ LDA #$f7
0894 : 8d a2 0b STA $0ba2 ; (rasterIRQRows[0] + 0)
0897 : a9 13 __ LDA #$13
0899 : 8d 82 0c STA $0c82 ; (open.code[0] + 1)
089c : a9 11 __ LDA #$11
089e : 8d 8b 0c STA $0c8b ; (open.code[0] + 10)
08a1 : a9 d0 __ LDA #$d0
08a3 : 8d 8c 0c STA $0c8c ; (open.code[0] + 11)
08a6 : a9 81 __ LDA #$81
08a8 : 8d d5 0b STA $0bd5 ; (rasterIRQLow[0] + 0)
08ab : a9 0c __ LDA #$0c
08ad : 8d e5 0b STA $0be5 ; (rasterIRQHigh[0] + 0)
08b0 : a9 a0 __ LDA #$a0
08b2 : 85 0d __ STA P0 
08b4 : a9 0c __ LDA #$0c
08b6 : 85 0e __ STA P1 
08b8 : 20 5d 0a JSR $0a5d ; (rirq_build.s4 + 0)
08bb : a9 32 __ LDA #$32
08bd : 8d a3 0b STA $0ba3 ; (rasterIRQRows[0] + 1)
08c0 : a9 1b __ LDA #$1b
08c2 : 8d a2 0c STA $0ca2 ; (bottom.code[0] + 1)
08c5 : a9 11 __ LDA #$11
08c7 : 8d ab 0c STA $0cab ; (bottom.code[0] + 10)
08ca : a9 d0 __ LDA #$d0
08cc : 8d ac 0c STA $0cac ; (bottom.code[0] + 11)
08cf : a9 a1 __ LDA #$a1
08d1 : 8d d6 0b STA $0bd6 ; (rasterIRQLow[0] + 1)
08d4 : a9 0c __ LDA #$0c
08d6 : 8d e6 0b STA $0be6 ; (rasterIRQHigh[0] + 1)
08d9 : a9 00 __ LDA #$00
08db : 20 01 0b JSR $0b01 ; (rirq_sort.s4 + 0)
08de : 20 90 0b JSR $0b90 ; (rirq_start.s4 + 0)
08e1 : a9 ff __ LDA #$ff
08e3 : 8d 15 d0 STA $d015 
08e6 : a9 aa __ LDA #$aa
08e8 : 8d 1c d0 STA $d01c 
08eb : a9 00 __ LDA #$00
08ed : 8d 27 d0 STA $d027 
08f0 : a9 08 __ LDA #$08
08f2 : 8d 28 d0 STA $d028 
08f5 : a9 00 __ LDA #$00
08f7 : 8d 29 d0 STA $d029 
08fa : a9 08 __ LDA #$08
08fc : 8d 2a d0 STA $d02a 
08ff : a9 00 __ LDA #$00
0901 : 8d 2b d0 STA $d02b 
0904 : a9 08 __ LDA #$08
0906 : 8d 2c d0 STA $d02c 
0909 : a9 00 __ LDA #$00
090b : 8d 2d d0 STA $d02d 
090e : a9 08 __ LDA #$08
0910 : 8d 2e d0 STA $d02e 
0913 : a9 09 __ LDA #$09
0915 : 8d 25 d0 STA $d025 
0918 : a9 01 __ LDA #$01
091a : 8d 26 d0 STA $d026 
091d : a9 0f __ LDA #$0f
091f : 8d f8 07 STA $07f8 
0922 : 8d fa 07 STA $07fa 
0925 : 8d fc 07 STA $07fc 
0928 : 8d fe 07 STA $07fe 
092b : a9 0e __ LDA #$0e
092d : 8d f9 07 STA $07f9 
0930 : 8d fb 07 STA $07fb 
0933 : 8d fd 07 STA $07fd 
0936 : 8d ff 07 STA $07ff 
0939 : a2 7f __ LDX #$7f
.l5:
093b : bd 00 0c LDA $0c00,x ; (spdata[0] + 0)
093e : 9d 80 03 STA $0380,x 
0941 : ca __ __ DEX
0942 : 10 f7 __ BPL $093b ; (main.l5 + 0)
.l6:
0944 : a9 00 __ LDA #$00
0946 : 85 43 __ STA T0 + 0 
0948 : 85 44 __ STA T1 + 0 
094a : 85 45 __ STA T2 + 0 
094c : 85 46 __ STA T3 + 0 
.l7:
094e : a9 00 __ LDA #$00
0950 : 8d 10 d0 STA $d010 
0953 : a5 43 __ LDA T0 + 0 
0955 : 8d 01 d0 STA $d001 
0958 : 8d 03 d0 STA $d003 
095b : a9 64 __ LDA #$64
095d : 8d 00 d0 STA $d000 
0960 : 8d 02 d0 STA $d002 
0963 : a5 46 __ LDA T3 + 0 
0965 : 8d 05 d0 STA $d005 
0968 : 8d 07 d0 STA $d007 
096b : a9 8c __ LDA #$8c
096d : 8d 04 d0 STA $d004 
0970 : 8d 06 d0 STA $d006 
0973 : a5 45 __ LDA T2 + 0 
0975 : 8d 09 d0 STA $d009 
0978 : 8d 0b d0 STA $d00b 
097b : a9 b4 __ LDA #$b4
097d : 8d 08 d0 STA $d008 
0980 : 8d 0a d0 STA $d00a 
0983 : a5 44 __ LDA T1 + 0 
0985 : 8d 0d d0 STA $d00d 
0988 : 8d 0f d0 STA $d00f 
098b : a9 dc __ LDA #$dc
098d : 8d 0c d0 STA $d00c 
0990 : 8d 0e d0 STA $d00e 
0993 : 20 f1 09 JSR $09f1 ; (rirq_wait.l4 + 0)
0996 : e6 46 __ INC T3 + 0 
0998 : e6 46 __ INC T3 + 0 
099a : 18 __ __ CLC
099b : a5 45 __ LDA T2 + 0 
099d : 69 03 __ ADC #$03
099f : 85 45 __ STA T2 + 0 
09a1 : 18 __ __ CLC
09a2 : a5 44 __ LDA T1 + 0 
09a4 : 69 04 __ ADC #$04
09a6 : 85 44 __ STA T1 + 0 
09a8 : e6 43 __ INC T0 + 0 
09aa : a5 43 __ LDA T0 + 0 
09ac : c9 ff __ CMP #$ff
09ae : 90 9e __ BCC $094e ; (main.l7 + 0)
09b0 : b0 92 __ BCS $0944 ; (main.l6 + 0)
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
09b2 : 20 d3 09 JSR $09d3 ; (rirq_init_tables.s4 + 0)
09b5 : 78 __ __ SEI
09b6 : a9 01 __ LDA #$01
09b8 : 8d 1a d0 STA $d01a 
09bb : a9 00 __ LDA #$00
09bd : 8d 14 03 STA $0314 
09c0 : a9 0a __ LDA #$0a
09c2 : 8d 15 03 STA $0315 
09c5 : ad 11 d0 LDA $d011 
09c8 : 29 7f __ AND #$7f
09ca : 8d 11 d0 STA $d011 
09cd : a9 ff __ LDA #$ff
09cf : 8d 12 d0 STA $d012 
.s3:
09d2 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
09d3 : a2 00 __ LDX #$00
.l5:
09d5 : a9 ff __ LDA #$ff
09d7 : 9d a2 0b STA $0ba2,x ; (rasterIRQRows[0] + 0)
09da : 8a __ __ TXA
09db : 9d b4 0b STA $0bb4,x ; (rasterIRQIndex[0] + 1)
09de : e8 __ __ INX
09df : e0 10 __ CPX #$10
09e1 : d0 f2 __ BNE $09d5 ; (rirq_init_tables.l5 + 0)
.s6:
09e3 : 8e b3 0b STX $0bb3 ; (rasterIRQIndex[0] + 0)
09e6 : a9 ff __ LDA #$ff
09e8 : 8d d4 0b STA $0bd4 ; (rasterIRQNext[0] + 16)
09eb : a9 00 __ LDA #$00
09ed : 8d b2 0b STA $0bb2 ; (rasterIRQRows[0] + 16)
.s3:
09f0 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_wait: ; rirq_wait()->void
; 198, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.l4:
09f1 : ad ff 09 LDA $09ff ; (rirq_count + 0)
09f4 : cd f5 0b CMP $0bf5 ; (rirq_pcount + 0)
09f7 : f0 f8 __ BEQ $09f1 ; (rirq_wait.l4 + 0)
.s5:
09f9 : 8d f5 0b STA $0bf5 ; (rirq_pcount + 0)
.s3:
09fc : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
09fd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
nextIRQ:
09fe : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_count:
09ff : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0a00 : ad 19 d0 LDA $d019 
0a03 : 10 51 __ BPL $0a56 ; (rirq_isr_kernal_io + 86)
0a05 : ae fe 09 LDX $09fe ; (nextIRQ + 0)
0a08 : 30 33 __ BMI $0a3d ; (rirq_isr_kernal_io + 61)
0a0a : bd c4 0b LDA $0bc4,x ; (rasterIRQNext[0] + 0)
0a0d : bc b4 0b LDY $0bb4,x ; (rasterIRQIndex[0] + 1)
0a10 : be d5 0b LDX $0bd5,y ; (rasterIRQLow[0] + 0)
0a13 : 8e 1d 0a STX $0a1d ; (rirq_isr_kernal_io + 29)
0a16 : be e5 0b LDX $0be5,y ; (rasterIRQHigh[0] + 0)
0a19 : 8e 1e 0a STX $0a1e ; (rirq_isr_kernal_io + 30)
0a1c : 20 00 00 JSR $0000 
0a1f : ee fe 09 INC $09fe ; (nextIRQ + 0)
0a22 : ae fe 09 LDX $09fe ; (nextIRQ + 0)
0a25 : bc c4 0b LDY $0bc4,x ; (rasterIRQNext[0] + 0)
0a28 : 0e 19 d0 ASL $d019 
0a2b : c0 ff __ CPY #$ff
0a2d : f0 14 __ BEQ $0a43 ; (rirq_isr_kernal_io + 67)
0a2f : 88 __ __ DEY
0a30 : 88 __ __ DEY
0a31 : 8c 12 d0 STY $d012 
0a34 : 88 __ __ DEY
0a35 : cc 12 d0 CPY $d012 
0a38 : 90 d0 __ BCC $0a0a ; (rirq_isr_kernal_io + 10)
0a3a : 4c 81 ea JMP $ea81 
0a3d : 0e 19 d0 ASL $d019 
0a40 : 4c 81 ea JMP $ea81 
0a43 : ee ff 09 INC $09ff ; (rirq_count + 0)
0a46 : ac c4 0b LDY $0bc4 ; (rasterIRQNext[0] + 0)
0a49 : 88 __ __ DEY
0a4a : 88 __ __ DEY
0a4b : 8c 12 d0 STY $d012 
0a4e : a2 00 __ LDX #$00
0a50 : 8e fe 09 STX $09fe ; (nextIRQ + 0)
0a53 : 4c 81 ea JMP $ea81 
0a56 : ad 0d dc LDA $dc0d 
0a59 : 58 __ __ CLI
0a5a : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0a5d : a5 0d __ LDA P0 ; (ic + 0)
0a5f : 85 1b __ STA ACCU + 0 
0a61 : a5 0e __ LDA P1 ; (ic + 1)
0a63 : 85 1c __ STA ACCU + 1 
0a65 : a9 a0 __ LDA #$a0
0a67 : a0 01 __ LDY #$01
0a69 : 91 0d __ STA (P0),y ; (ic + 0)
0a6b : a9 00 __ LDA #$00
0a6d : c8 __ __ INY
0a6e : 91 0d __ STA (P0),y ; (ic + 0)
0a70 : a9 a2 __ LDA #$a2
0a72 : c8 __ __ INY
0a73 : 91 0d __ STA (P0),y ; (ic + 0)
0a75 : a9 00 __ LDA #$00
0a77 : c8 __ __ INY
0a78 : 91 0d __ STA (P0),y ; (ic + 0)
0a7a : a9 cd __ LDA #$cd
0a7c : c8 __ __ INY
0a7d : 91 0d __ STA (P0),y ; (ic + 0)
0a7f : a9 12 __ LDA #$12
0a81 : c8 __ __ INY
0a82 : 91 0d __ STA (P0),y ; (ic + 0)
0a84 : a9 d0 __ LDA #$d0
0a86 : c8 __ __ INY
0a87 : 91 0d __ STA (P0),y ; (ic + 0)
0a89 : a9 b0 __ LDA #$b0
0a8b : c8 __ __ INY
0a8c : 91 0d __ STA (P0),y ; (ic + 0)
0a8e : a9 fb __ LDA #$fb
0a90 : c8 __ __ INY
0a91 : 91 0d __ STA (P0),y ; (ic + 0)
0a93 : a9 8c __ LDA #$8c
0a95 : c8 __ __ INY
0a96 : 91 0d __ STA (P0),y ; (ic + 0)
0a98 : a9 00 __ LDA #$00
0a9a : c8 __ __ INY
0a9b : 91 0d __ STA (P0),y ; (ic + 0)
0a9d : c8 __ __ INY
0a9e : 91 0d __ STA (P0),y ; (ic + 0)
0aa0 : a8 __ __ TAY
0aa1 : a5 0f __ LDA P2 ; (size + 0)
0aa3 : 91 0d __ STA (P0),y ; (ic + 0)
0aa5 : f0 53 __ BEQ $0afa ; (rirq_build.s5 + 0)
.s6:
0aa7 : a0 0d __ LDY #$0d
0aa9 : c9 01 __ CMP #$01
0aab : d0 05 __ BNE $0ab2 ; (rirq_build.s7 + 0)
.s10:
0aad : a9 60 __ LDA #$60
0aaf : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0ab1 : 60 __ __ RTS
.s7:
0ab2 : a9 8e __ LDA #$8e
0ab4 : 91 0d __ STA (P0),y ; (ic + 0)
0ab6 : a9 00 __ LDA #$00
0ab8 : c8 __ __ INY
0ab9 : 91 0d __ STA (P0),y ; (ic + 0)
0abb : c8 __ __ INY
0abc : 91 0d __ STA (P0),y ; (ic + 0)
0abe : a5 0f __ LDA P2 ; (size + 0)
0ac0 : c9 03 __ CMP #$03
0ac2 : 90 2a __ BCC $0aee ; (rirq_build.s8 + 0)
.s9:
0ac4 : e9 02 __ SBC #$02
0ac6 : aa __ __ TAX
0ac7 : 18 __ __ CLC
0ac8 : a5 0d __ LDA P0 ; (ic + 0)
0aca : 69 01 __ ADC #$01
0acc : 85 1b __ STA ACCU + 0 
0ace : a5 0e __ LDA P1 ; (ic + 1)
0ad0 : 69 00 __ ADC #$00
0ad2 : 85 1c __ STA ACCU + 1 
.l11:
0ad4 : a9 a9 __ LDA #$a9
0ad6 : 91 1b __ STA (ACCU + 0),y 
0ad8 : a9 00 __ LDA #$00
0ada : c8 __ __ INY
0adb : 91 1b __ STA (ACCU + 0),y 
0add : a9 8d __ LDA #$8d
0adf : c8 __ __ INY
0ae0 : 91 1b __ STA (ACCU + 0),y 
0ae2 : a9 00 __ LDA #$00
0ae4 : c8 __ __ INY
0ae5 : 91 1b __ STA (ACCU + 0),y 
0ae7 : c8 __ __ INY
0ae8 : 91 1b __ STA (ACCU + 0),y 
0aea : c8 __ __ INY
0aeb : ca __ __ DEX
0aec : d0 e6 __ BNE $0ad4 ; (rirq_build.l11 + 0)
.s8:
0aee : 98 __ __ TYA
0aef : 18 __ __ CLC
0af0 : 65 0d __ ADC P0 ; (ic + 0)
0af2 : 85 1b __ STA ACCU + 0 
0af4 : a5 0e __ LDA P1 ; (ic + 1)
0af6 : 69 00 __ ADC #$00
0af8 : 85 1c __ STA ACCU + 1 
.s5:
0afa : a9 60 __ LDA #$60
0afc : a0 01 __ LDY #$01
0afe : 91 1b __ STA (ACCU + 0),y 
0b00 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0b01 : 85 0d __ STA P0 ; (inirq + 0)
0b03 : a9 ff __ LDA #$ff
0b05 : 8d fe 09 STA $09fe ; (nextIRQ + 0)
0b08 : ae b4 0b LDX $0bb4 ; (rasterIRQIndex[0] + 1)
0b0b : bd a2 0b LDA $0ba2,x ; (rasterIRQRows[0] + 0)
0b0e : 85 1c __ STA ACCU + 1 
0b10 : a2 02 __ LDX #$02
.l5:
0b12 : bc b3 0b LDY $0bb3,x ; (rasterIRQIndex[0] + 0)
0b15 : b9 a2 0b LDA $0ba2,y ; (rasterIRQRows[0] + 0)
0b18 : c5 1c __ CMP ACCU + 1 
0b1a : 90 04 __ BCC $0b20 ; (rirq_sort.s12 + 0)
.s6:
0b1c : 85 1c __ STA ACCU + 1 
0b1e : b0 24 __ BCS $0b44 ; (rirq_sort.s7 + 0)
.s12:
0b20 : 86 1d __ STX ACCU + 2 
0b22 : 84 1e __ STY ACCU + 3 
0b24 : 85 1b __ STA ACCU + 0 
0b26 : bd b2 0b LDA $0bb2,x ; (rasterIRQRows[0] + 16)
0b29 : 9d b3 0b STA $0bb3,x ; (rasterIRQIndex[0] + 0)
0b2c : 90 05 __ BCC $0b33 ; (rirq_sort.l13 + 0)
.s15:
0b2e : 98 __ __ TYA
0b2f : 9d b2 0b STA $0bb2,x ; (rasterIRQRows[0] + 16)
0b32 : ca __ __ DEX
.l13:
0b33 : a5 1b __ LDA ACCU + 0 
0b35 : bc b1 0b LDY $0bb1,x ; (rasterIRQRows[0] + 15)
0b38 : d9 a2 0b CMP $0ba2,y ; (rasterIRQRows[0] + 0)
0b3b : 90 f1 __ BCC $0b2e ; (rirq_sort.s15 + 0)
.s14:
0b3d : a5 1e __ LDA ACCU + 3 
0b3f : 9d b2 0b STA $0bb2,x ; (rasterIRQRows[0] + 16)
0b42 : a6 1d __ LDX ACCU + 2 
.s7:
0b44 : e8 __ __ INX
0b45 : e0 11 __ CPX #$11
0b47 : 90 c9 __ BCC $0b12 ; (rirq_sort.l5 + 0)
.s8:
0b49 : a2 03 __ LDX #$03
.l17:
0b4b : bc b4 0b LDY $0bb4,x ; (rasterIRQIndex[0] + 1)
0b4e : b9 a2 0b LDA $0ba2,y ; (rasterIRQRows[0] + 0)
0b51 : 9d c4 0b STA $0bc4,x ; (rasterIRQNext[0] + 0)
0b54 : bc b8 0b LDY $0bb8,x ; (rasterIRQIndex[0] + 5)
0b57 : b9 a2 0b LDA $0ba2,y ; (rasterIRQRows[0] + 0)
0b5a : 9d c8 0b STA $0bc8,x ; (rasterIRQNext[0] + 4)
0b5d : bc bc 0b LDY $0bbc,x ; (rasterIRQIndex[0] + 9)
0b60 : b9 a2 0b LDA $0ba2,y ; (rasterIRQRows[0] + 0)
0b63 : 9d cc 0b STA $0bcc,x ; (rasterIRQNext[0] + 8)
0b66 : bc c0 0b LDY $0bc0,x ; (rasterIRQIndex[0] + 13)
0b69 : b9 a2 0b LDA $0ba2,y ; (rasterIRQRows[0] + 0)
0b6c : 9d d0 0b STA $0bd0,x ; (rasterIRQNext[0] + 12)
0b6f : ca __ __ DEX
0b70 : 10 d9 __ BPL $0b4b ; (rirq_sort.l17 + 0)
.s18:
0b72 : ad ff 09 LDA $09ff ; (rirq_count + 0)
0b75 : 8d f5 0b STA $0bf5 ; (rirq_pcount + 0)
0b78 : a5 0d __ LDA P0 ; (inirq + 0)
0b7a : f0 06 __ BEQ $0b82 ; (rirq_sort.s9 + 0)
.s11:
0b7c : a9 0f __ LDA #$0f
.s16:
0b7e : 8d fe 09 STA $09fe ; (nextIRQ + 0)
.s3:
0b81 : 60 __ __ RTS
.s9:
0b82 : ac c4 0b LDY $0bc4 ; (rasterIRQNext[0] + 0)
0b85 : c0 ff __ CPY #$ff
0b87 : f0 f8 __ BEQ $0b81 ; (rirq_sort.s3 + 0)
.s10:
0b89 : 88 __ __ DEY
0b8a : 8c 12 d0 STY $d012 
0b8d : 4c 7e 0b JMP $0b7e ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0b90 : ad 11 d0 LDA $d011 
0b93 : 29 7f __ AND #$7f
0b95 : 8d 11 d0 STA $d011 
0b98 : a9 64 __ LDA #$64
0b9a : 8d 12 d0 STA $d012 
0b9d : 0e 19 d0 ASL $d019 
0ba0 : 58 __ __ CLI
.s3:
0ba1 : 60 __ __ RTS
--------------------------------------------------------------------
rasterIRQRows:
0ba2 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
0bb3 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
0bc4 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQLow:
0bd5 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
0be5 : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_pcount:
0bf5 : __ __ __ BSS	1
--------------------------------------------------------------------
spdata:
0c00 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 28 a4 20 2a : ............(. *
0c10 : __ __ __ BYT a9 60 0a a5 60 0a a5 60 0a aa 60 02 ef 40 02 ef : .`..`..`..`..@..
0c20 : __ __ __ BYT 80 02 aa a0 0a 85 90 0a a5 50 0a a6 60 02 a9 40 : .........P..`..@
0c30 : __ __ __ BYT 01 55 40 00 55 00 00 28 00 00 00 00 00 00 00 98 : .U@.U..(........
0c40 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 38 00 38 24 10 48 20 : .........8.8$.H 
0c50 : __ __ __ BYT 10 08 39 87 18 01 01 00 01 00 00 00 28 00 04 6c : ..9.........(..l
0c60 : __ __ __ BYT 20 04 00 20 08 38 10 08 10 10 08 92 10 04 7c 20 :  .. .8........| 
0c70 : __ __ __ BYT 04 00 20 03 81 c0 00 7e 00 00 00 00 00 00 00 10 : .. ....~........
--------------------------------------------------------------------
open:
0c80 : __ __ __ BSS	32
--------------------------------------------------------------------
bottom:
0ca0 : __ __ __ BSS	32
