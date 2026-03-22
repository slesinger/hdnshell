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
080e : 8e db 1c STX $1cdb ; (spentry + 0)
0811 : a2 1d __ LDX #$1d
0813 : a0 38 __ LDY #$38
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1e __ CPX #$1e
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
083b : a9 e2 __ LDA #$e2
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
;  55, "/home/honza/projects/c64/projects/oscar64/samples/hires/fractaltree.c"
.s1:
0880 : 38 __ __ SEC
0881 : a5 23 __ LDA SP + 0 
0883 : e9 12 __ SBC #$12
0885 : 85 23 __ STA SP + 0 
0887 : b0 02 __ BCS $088b ; (main.s4 + 0)
0889 : c6 24 __ DEC SP + 1 
.s4:
088b : 20 ef 08 JSR $08ef ; (init.s4 + 0)
088e : a9 00 __ LDA #$00
0890 : a0 02 __ LDY #$02
0892 : 91 23 __ STA (SP + 0),y 
0894 : c8 __ __ INY
0895 : 91 23 __ STA (SP + 0),y 
0897 : a9 0c __ LDA #$0c
0899 : c8 __ __ INY
089a : 91 23 __ STA (SP + 0),y 
089c : a9 43 __ LDA #$43
089e : c8 __ __ INY
089f : 91 23 __ STA (SP + 0),y 
08a1 : a9 00 __ LDA #$00
08a3 : c8 __ __ INY
08a4 : 91 23 __ STA (SP + 0),y 
08a6 : c8 __ __ INY
08a7 : 91 23 __ STA (SP + 0),y 
08a9 : a9 47 __ LDA #$47
08ab : c8 __ __ INY
08ac : 91 23 __ STA (SP + 0),y 
08ae : a9 43 __ LDA #$43
08b0 : c8 __ __ INY
08b1 : 91 23 __ STA (SP + 0),y 
08b3 : a9 e4 __ LDA #$e4
08b5 : c8 __ __ INY
08b6 : 91 23 __ STA (SP + 0),y 
08b8 : a9 cb __ LDA #$cb
08ba : c8 __ __ INY
08bb : 91 23 __ STA (SP + 0),y 
08bd : a9 96 __ LDA #$96
08bf : c8 __ __ INY
08c0 : 91 23 __ STA (SP + 0),y 
08c2 : a9 40 __ LDA #$40
08c4 : c8 __ __ INY
08c5 : 91 23 __ STA (SP + 0),y 
08c7 : a9 00 __ LDA #$00
08c9 : c8 __ __ INY
08ca : 91 23 __ STA (SP + 0),y 
08cc : c8 __ __ INY
08cd : 91 23 __ STA (SP + 0),y 
08cf : c8 __ __ INY
08d0 : 91 23 __ STA (SP + 0),y 
08d2 : a9 42 __ LDA #$42
08d4 : c8 __ __ INY
08d5 : 91 23 __ STA (SP + 0),y 
08d7 : 20 4d 0a JSR $0a4d ; (draw.s1 + 0)
08da : 20 0b 19 JSR $190b ; (done.s4 + 0)
08dd : a9 00 __ LDA #$00
08df : 85 1b __ STA ACCU + 0 
08e1 : 85 1c __ STA ACCU + 1 
.s3:
08e3 : 18 __ __ CLC
08e4 : a5 23 __ LDA SP + 0 
08e6 : 69 12 __ ADC #$12
08e8 : 85 23 __ STA SP + 0 
08ea : 90 02 __ BCC $08ee ; (main.s3 + 11)
08ec : e6 24 __ INC SP + 1 
08ee : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  15, "/home/honza/projects/c64/projects/oscar64/samples/hires/fractaltree.c"
.s4:
08ef : 20 5b 09 JSR $095b ; (mmap_trampoline.s4 + 0)
08f2 : a9 00 __ LDA #$00
08f4 : 85 0f __ STA P2 
08f6 : 85 10 __ STA P3 
08f8 : a9 30 __ LDA #$30
08fa : 85 01 __ STA $01 
08fc : a9 40 __ LDA #$40
08fe : 85 11 __ STA P4 
0900 : a9 1f __ LDA #$1f
0902 : 85 12 __ STA P5 
0904 : a9 01 __ LDA #$01
0906 : a2 fa __ LDX #$fa
.l6:
0908 : ca __ __ DEX
0909 : 9d 00 d0 STA $d000,x 
090c : 9d fa d0 STA $d0fa,x 
090f : 9d f4 d1 STA $d1f4,x 
0912 : 9d ee d2 STA $d2ee,x 
0915 : d0 f1 __ BNE $0908 ; (init.l6 + 0)
.s5:
0917 : a9 00 __ LDA #$00
0919 : 85 0d __ STA P0 
091b : a9 e0 __ LDA #$e0
091d : 85 0e __ STA P1 
091f : 20 a5 09 JSR $09a5 ; (memset.s4 + 0)
0922 : a9 00 __ LDA #$00
0924 : 85 10 __ STA P3 
0926 : 85 0e __ STA P1 
0928 : a9 35 __ LDA #$35
092a : 85 01 __ STA $01 
092c : a9 03 __ LDA #$03
092e : 85 0d __ STA P0 
0930 : a9 e0 __ LDA #$e0
0932 : 85 11 __ STA P4 
0934 : a9 d0 __ LDA #$d0
0936 : 85 0f __ STA P2 
0938 : 20 c9 09 JSR $09c9 ; (vic_setmode.s4 + 0)
093b : a9 00 __ LDA #$00
093d : 85 0f __ STA P2 
093f : a9 e0 __ LDA #$e0
0941 : 85 10 __ STA P3 
0943 : a9 28 __ LDA #$28
0945 : 85 11 __ STA P4 
0947 : a9 19 __ LDA #$19
0949 : 85 12 __ STA P5 
094b : a9 01 __ LDA #$01
094d : 8d 20 d0 STA $d020 
0950 : a9 ed __ LDA #$ed
0952 : 85 0d __ STA P0 
0954 : a9 1c __ LDA #$1c
0956 : 85 0e __ STA P1 
0958 : 4c 1b 0a JMP $0a1b ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
095b : a9 70 __ LDA #$70
095d : 8d fa ff STA $fffa 
0960 : a9 09 __ LDA #$09
0962 : 8d fb ff STA $fffb 
0965 : a9 8e __ LDA #$8e
0967 : 8d fe ff STA $fffe 
096a : a9 09 __ LDA #$09
096c : 8d ff ff STA $ffff 
.s3:
096f : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0970 : 48 __ __ PHA
0971 : 8a __ __ TXA
0972 : 48 __ __ PHA
0973 : a9 09 __ LDA #$09
0975 : 48 __ __ PHA
0976 : a9 87 __ LDA #$87
0978 : 48 __ __ PHA
0979 : ba __ __ TSX
097a : bd 05 01 LDA $0105,x 
097d : 48 __ __ PHA
097e : a6 01 __ LDX $01 
0980 : a9 36 __ LDA #$36
0982 : 85 01 __ STA $01 
0984 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0987 : 86 01 __ STX $01 
0989 : 68 __ __ PLA
098a : aa __ __ TAX
098b : 68 __ __ PLA
098c : 40 __ __ RTI
098d : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
098e : 48 __ __ PHA
098f : 8a __ __ TXA
0990 : 48 __ __ PHA
0991 : a9 09 __ LDA #$09
0993 : 48 __ __ PHA
0994 : a9 87 __ LDA #$87
0996 : 48 __ __ PHA
0997 : ba __ __ TSX
0998 : bd 05 01 LDA $0105,x 
099b : 48 __ __ PHA
099c : a6 01 __ LDX $01 
099e : a9 36 __ LDA #$36
09a0 : 85 01 __ STA $01 
09a2 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
09a5 : a5 0f __ LDA P2 
09a7 : a6 12 __ LDX P5 
09a9 : f0 0c __ BEQ $09b7 ; (memset.s4 + 18)
09ab : a0 00 __ LDY #$00
09ad : 91 0d __ STA (P0),y ; (dst + 0)
09af : c8 __ __ INY
09b0 : d0 fb __ BNE $09ad ; (memset.s4 + 8)
09b2 : e6 0e __ INC P1 ; (dst + 1)
09b4 : ca __ __ DEX
09b5 : d0 f6 __ BNE $09ad ; (memset.s4 + 8)
09b7 : a4 11 __ LDY P4 
09b9 : f0 05 __ BEQ $09c0 ; (memset.s4 + 27)
09bb : 88 __ __ DEY
09bc : 91 0d __ STA (P0),y ; (dst + 0)
09be : d0 fb __ BNE $09bb ; (memset.s4 + 22)
09c0 : a5 0d __ LDA P0 ; (dst + 0)
09c2 : 85 1b __ STA ACCU + 0 
09c4 : a5 0e __ LDA P1 ; (dst + 1)
09c6 : 85 1c __ STA ACCU + 1 
.s3:
09c8 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
09c9 : a4 0d __ LDY P0 ; (mode + 0)
09cb : c0 02 __ CPY #$02
09cd : d0 09 __ BNE $09d8 ; (vic_setmode.s5 + 0)
.s10:
09cf : a9 5b __ LDA #$5b
09d1 : 8d 11 d0 STA $d011 
.s8:
09d4 : a9 08 __ LDA #$08
09d6 : d0 0c __ BNE $09e4 ; (vic_setmode.s7 + 0)
.s5:
09d8 : b0 36 __ BCS $0a10 ; (vic_setmode.s6 + 0)
.s9:
09da : a9 1b __ LDA #$1b
09dc : 8d 11 d0 STA $d011 
09df : 98 __ __ TYA
09e0 : f0 f2 __ BEQ $09d4 ; (vic_setmode.s8 + 0)
.s11:
09e2 : a9 18 __ LDA #$18
.s7:
09e4 : 8d 16 d0 STA $d016 
09e7 : ad 00 dd LDA $dd00 
09ea : 29 fc __ AND #$fc
09ec : 85 1b __ STA ACCU + 0 
09ee : a5 0f __ LDA P2 ; (text + 1)
09f0 : 0a __ __ ASL
09f1 : 2a __ __ ROL
09f2 : 29 01 __ AND #$01
09f4 : 2a __ __ ROL
09f5 : 49 03 __ EOR #$03
09f7 : 05 1b __ ORA ACCU + 0 
09f9 : 8d 00 dd STA $dd00 
09fc : a5 0f __ LDA P2 ; (text + 1)
09fe : 29 3c __ AND #$3c
0a00 : 0a __ __ ASL
0a01 : 0a __ __ ASL
0a02 : 85 1b __ STA ACCU + 0 
0a04 : a5 11 __ LDA P4 ; (font + 1)
0a06 : 29 38 __ AND #$38
0a08 : 4a __ __ LSR
0a09 : 4a __ __ LSR
0a0a : 05 1b __ ORA ACCU + 0 
0a0c : 8d 18 d0 STA $d018 
.s3:
0a0f : 60 __ __ RTS
.s6:
0a10 : a9 3b __ LDA #$3b
0a12 : 8d 11 d0 STA $d011 
0a15 : c0 03 __ CPY #$03
0a17 : d0 c9 __ BNE $09e2 ; (vic_setmode.s11 + 0)
0a19 : f0 b9 __ BEQ $09d4 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0a1b : a5 0f __ LDA P2 ; (data + 0)
0a1d : a0 00 __ LDY #$00
0a1f : 91 0d __ STA (P0),y ; (bm + 0)
0a21 : a5 10 __ LDA P3 ; (data + 1)
0a23 : c8 __ __ INY
0a24 : 91 0d __ STA (P0),y ; (bm + 0)
0a26 : a9 00 __ LDA #$00
0a28 : c8 __ __ INY
0a29 : 91 0d __ STA (P0),y ; (bm + 0)
0a2b : c8 __ __ INY
0a2c : 91 0d __ STA (P0),y ; (bm + 0)
0a2e : a5 11 __ LDA P4 ; (cw + 0)
0a30 : c8 __ __ INY
0a31 : 91 0d __ STA (P0),y ; (bm + 0)
0a33 : a5 12 __ LDA P5 ; (ch + 0)
0a35 : c8 __ __ INY
0a36 : 91 0d __ STA (P0),y ; (bm + 0)
0a38 : a9 00 __ LDA #$00
0a3a : 06 11 __ ASL P4 ; (cw + 0)
0a3c : 2a __ __ ROL
0a3d : 06 11 __ ASL P4 ; (cw + 0)
0a3f : 2a __ __ ROL
0a40 : 06 11 __ ASL P4 ; (cw + 0)
0a42 : 2a __ __ ROL
0a43 : a0 07 __ LDY #$07
0a45 : 91 0d __ STA (P0),y ; (bm + 0)
0a47 : a5 11 __ LDA P4 ; (cw + 0)
0a49 : 88 __ __ DEY
0a4a : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0a4c : 60 __ __ RTS
--------------------------------------------------------------------
draw: ; draw(float,float,float,float)->void
;  41, "/home/honza/projects/c64/projects/oscar64/samples/hires/fractaltree.c"
.s1:
0a4d : 38 __ __ SEC
0a4e : a5 23 __ LDA SP + 0 
0a50 : e9 26 __ SBC #$26
0a52 : 85 23 __ STA SP + 0 
0a54 : b0 02 __ BCS $0a58 ; (draw.s1 + 11)
0a56 : c6 24 __ DEC SP + 1 
0a58 : a0 25 __ LDY #$25
0a5a : a2 13 __ LDX #$13
0a5c : b5 53 __ LDA T1 + 0,x 
0a5e : 91 23 __ STA (SP + 0),y 
0a60 : 88 __ __ DEY
0a61 : ca __ __ DEX
0a62 : 10 f8 __ BPL $0a5c ; (draw.s1 + 15)
.s4:
0a64 : a0 34 __ LDY #$34
0a66 : b1 23 __ LDA (SP + 0),y 
0a68 : 85 5f __ STA T4 + 0 
0a6a : c8 __ __ INY
0a6b : b1 23 __ LDA (SP + 0),y 
0a6d : 85 60 __ STA T4 + 1 
0a6f : c8 __ __ INY
0a70 : b1 23 __ LDA (SP + 0),y 
0a72 : 85 61 __ STA T4 + 2 
0a74 : c8 __ __ INY
0a75 : b1 23 __ LDA (SP + 0),y 
0a77 : 10 03 __ BPL $0a7c ; (draw.s6 + 0)
0a79 : 4c 0c 0d JMP $0d0c ; (draw.s3 + 0)
.s6:
0a7c : 85 62 __ STA T4 + 3 
0a7e : c9 40 __ CMP #$40
0a80 : d0 0e __ BNE $0a90 ; (draw.s10 + 0)
.s7:
0a82 : a5 61 __ LDA T4 + 2 
0a84 : c9 c0 __ CMP #$c0
0a86 : d0 08 __ BNE $0a90 ; (draw.s10 + 0)
.s8:
0a88 : a5 60 __ LDA T4 + 1 
0a8a : d0 04 __ BNE $0a90 ; (draw.s10 + 0)
.s9:
0a8c : a5 5f __ LDA T4 + 0 
0a8e : f0 02 __ BEQ $0a92 ; (draw.s5 + 0)
.s10:
0a90 : 90 e7 __ BCC $0a79 ; (draw.s4 + 21)
.s5:
0a92 : a0 30 __ LDY #$30
0a94 : b1 23 __ LDA (SP + 0),y 
0a96 : 85 63 __ STA T5 + 0 
0a98 : c8 __ __ INY
0a99 : b1 23 __ LDA (SP + 0),y 
0a9b : 85 64 __ STA T5 + 1 
0a9d : c8 __ __ INY
0a9e : b1 23 __ LDA (SP + 0),y 
0aa0 : 85 65 __ STA T5 + 2 
0aa2 : c8 __ __ INY
0aa3 : b1 23 __ LDA (SP + 0),y 
0aa5 : 85 66 __ STA T5 + 3 
0aa7 : a9 db __ LDA #$db
0aa9 : 85 1b __ STA ACCU + 0 ; (s + 2)
0aab : a9 3f __ LDA #$3f
0aad : 85 1e __ STA ACCU + 3 
0aaf : a9 0f __ LDA #$0f
0ab1 : 85 1c __ STA ACCU + 1 ; (s + 3)
0ab3 : a9 c9 __ LDA #$c9
0ab5 : 85 1d __ STA ACCU + 2 
0ab7 : a2 63 __ LDX #$63
0ab9 : 20 9f 19 JSR $199f ; (freg + 4)
0abc : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0abf : a5 1b __ LDA ACCU + 0 ; (s + 2)
0ac1 : 85 0d __ STA P0 ; (x + 0)
0ac3 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0ac5 : 85 0e __ STA P1 ; (x + 1)
0ac7 : a5 1d __ LDA ACCU + 2 
0ac9 : 85 0f __ STA P2 ; (x + 2)
0acb : a5 1e __ LDA ACCU + 3 
0acd : 85 10 __ STA P3 ; (x + 3)
0acf : 20 24 0d JSR $0d24 ; (sin.s4 + 0)
0ad2 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0ad4 : 85 5b __ STA T3 + 0 
0ad6 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0ad8 : 85 5c __ STA T3 + 1 
0ada : a5 1d __ LDA ACCU + 2 
0adc : 85 5d __ STA T3 + 2 
0ade : a5 1e __ LDA ACCU + 3 
0ae0 : 85 5e __ STA T3 + 3 
0ae2 : a5 63 __ LDA T5 + 0 
0ae4 : 85 0d __ STA P0 ; (x + 0)
0ae6 : a5 64 __ LDA T5 + 1 
0ae8 : 85 0e __ STA P1 ; (x + 1)
0aea : a5 65 __ LDA T5 + 2 
0aec : 85 0f __ STA P2 ; (x + 2)
0aee : a5 66 __ LDA T5 + 3 
0af0 : 85 10 __ STA P3 ; (x + 3)
0af2 : 20 24 0d JSR $0d24 ; (sin.s4 + 0)
0af5 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0af7 : 85 43 __ STA T0 + 0 
0af9 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0afb : 85 44 __ STA T0 + 1 
0afd : a5 1d __ LDA ACCU + 2 
0aff : 85 45 __ STA T0 + 2 
0b01 : a5 1e __ LDA ACCU + 3 
0b03 : 85 46 __ STA T0 + 3 
0b05 : a9 ff __ LDA #$ff
0b07 : 8d fe 9f STA $9ffe ; (sstack + 12)
0b0a : a9 00 __ LDA #$00
0b0c : 8d ff 9f STA $9fff ; (sstack + 13)
0b0f : a9 ed __ LDA #$ed
0b11 : 8d f2 9f STA $9ff2 ; (sstack + 0)
0b14 : a9 1c __ LDA #$1c
0b16 : 8d f3 9f STA $9ff3 ; (sstack + 1)
0b19 : a9 dc __ LDA #$dc
0b1b : 8d f4 9f STA $9ff4 ; (sstack + 2)
0b1e : a9 1c __ LDA #$1c
0b20 : 8d f5 9f STA $9ff5 ; (sstack + 3)
0b23 : a0 28 __ LDY #$28
0b25 : b1 23 __ LDA (SP + 0),y 
0b27 : 85 53 __ STA T1 + 0 
0b29 : 85 1b __ STA ACCU + 0 ; (s + 2)
0b2b : c8 __ __ INY
0b2c : b1 23 __ LDA (SP + 0),y 
0b2e : 85 54 __ STA T1 + 1 
0b30 : 85 1c __ STA ACCU + 1 ; (s + 3)
0b32 : c8 __ __ INY
0b33 : b1 23 __ LDA (SP + 0),y 
0b35 : 85 55 __ STA T1 + 2 
0b37 : 85 1d __ STA ACCU + 2 
0b39 : c8 __ __ INY
0b3a : b1 23 __ LDA (SP + 0),y 
0b3c : 85 56 __ STA T1 + 3 
0b3e : 85 1e __ STA ACCU + 3 
0b40 : 20 8f 1c JSR $1c8f ; (f32_to_i16 + 0)
0b43 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0b45 : 8d f6 9f STA $9ff6 ; (sstack + 4)
0b48 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0b4a : 8d f7 9f STA $9ff7 ; (sstack + 5)
0b4d : a0 2c __ LDY #$2c
0b4f : b1 23 __ LDA (SP + 0),y 
0b51 : 85 57 __ STA T2 + 0 
0b53 : 85 1b __ STA ACCU + 0 ; (s + 2)
0b55 : c8 __ __ INY
0b56 : b1 23 __ LDA (SP + 0),y 
0b58 : 85 58 __ STA T2 + 1 
0b5a : 85 1c __ STA ACCU + 1 ; (s + 3)
0b5c : c8 __ __ INY
0b5d : b1 23 __ LDA (SP + 0),y 
0b5f : 85 59 __ STA T2 + 2 
0b61 : 85 1d __ STA ACCU + 2 
0b63 : c8 __ __ INY
0b64 : b1 23 __ LDA (SP + 0),y 
0b66 : 85 5a __ STA T2 + 3 
0b68 : 85 1e __ STA ACCU + 3 
0b6a : 20 8f 1c JSR $1c8f ; (f32_to_i16 + 0)
0b6d : a5 1b __ LDA ACCU + 0 ; (s + 2)
0b6f : 8d f8 9f STA $9ff8 ; (sstack + 6)
0b72 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0b74 : 8d f9 9f STA $9ff9 ; (sstack + 7)
0b77 : a5 5b __ LDA T3 + 0 
0b79 : 85 1b __ STA ACCU + 0 ; (s + 2)
0b7b : a5 5c __ LDA T3 + 1 
0b7d : 85 1c __ STA ACCU + 1 ; (s + 3)
0b7f : a5 5d __ LDA T3 + 2 
0b81 : 85 1d __ STA ACCU + 2 
0b83 : a5 5e __ LDA T3 + 3 
0b85 : 85 1e __ STA ACCU + 3 
0b87 : a2 5f __ LDX #$5f
0b89 : 20 9f 19 JSR $199f ; (freg + 4)
0b8c : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0b8f : a2 53 __ LDX #$53
0b91 : 20 9f 19 JSR $199f ; (freg + 4)
0b94 : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0b97 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0b99 : 85 53 __ STA T1 + 0 
0b9b : a5 1c __ LDA ACCU + 1 ; (s + 3)
0b9d : 85 54 __ STA T1 + 1 
0b9f : a5 1d __ LDA ACCU + 2 
0ba1 : 85 55 __ STA T1 + 2 
0ba3 : a5 1e __ LDA ACCU + 3 
0ba5 : 85 56 __ STA T1 + 3 
0ba7 : 20 8f 1c JSR $1c8f ; (f32_to_i16 + 0)
0baa : a5 1b __ LDA ACCU + 0 ; (s + 2)
0bac : 8d fa 9f STA $9ffa ; (sstack + 8)
0baf : a5 1c __ LDA ACCU + 1 ; (s + 3)
0bb1 : 8d fb 9f STA $9ffb ; (sstack + 9)
0bb4 : a5 43 __ LDA T0 + 0 
0bb6 : 85 1b __ STA ACCU + 0 ; (s + 2)
0bb8 : a5 44 __ LDA T0 + 1 
0bba : 85 1c __ STA ACCU + 1 ; (s + 3)
0bbc : a5 45 __ LDA T0 + 2 
0bbe : 85 1d __ STA ACCU + 2 
0bc0 : a5 46 __ LDA T0 + 3 
0bc2 : 85 1e __ STA ACCU + 3 
0bc4 : a2 5f __ LDX #$5f
0bc6 : 20 9f 19 JSR $199f ; (freg + 4)
0bc9 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0bcc : a2 57 __ LDX #$57
0bce : 20 9f 19 JSR $199f ; (freg + 4)
0bd1 : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0bd4 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0bd6 : 85 57 __ STA T2 + 0 
0bd8 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0bda : 85 58 __ STA T2 + 1 
0bdc : a5 1d __ LDA ACCU + 2 
0bde : 85 59 __ STA T2 + 2 
0be0 : a5 1e __ LDA ACCU + 3 
0be2 : 85 5a __ STA T2 + 3 
0be4 : 20 8f 1c JSR $1c8f ; (f32_to_i16 + 0)
0be7 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0be9 : 8d fc 9f STA $9ffc ; (sstack + 10)
0bec : a5 1c __ LDA ACCU + 1 ; (s + 3)
0bee : 8d fd 9f STA $9ffd ; (sstack + 11)
0bf1 : 20 bb 0e JSR $0ebb ; (bm_line.s1 + 0)
0bf4 : a5 53 __ LDA T1 + 0 
0bf6 : a0 02 __ LDY #$02
0bf8 : 91 23 __ STA (SP + 0),y 
0bfa : a5 54 __ LDA T1 + 1 
0bfc : c8 __ __ INY
0bfd : 91 23 __ STA (SP + 0),y 
0bff : a5 55 __ LDA T1 + 2 
0c01 : c8 __ __ INY
0c02 : 91 23 __ STA (SP + 0),y 
0c04 : a5 56 __ LDA T1 + 3 
0c06 : c8 __ __ INY
0c07 : 91 23 __ STA (SP + 0),y 
0c09 : a5 57 __ LDA T2 + 0 
0c0b : c8 __ __ INY
0c0c : 91 23 __ STA (SP + 0),y 
0c0e : a5 58 __ LDA T2 + 1 
0c10 : c8 __ __ INY
0c11 : 91 23 __ STA (SP + 0),y 
0c13 : a5 59 __ LDA T2 + 2 
0c15 : c8 __ __ INY
0c16 : 91 23 __ STA (SP + 0),y 
0c18 : a5 5a __ LDA T2 + 3 
0c1a : c8 __ __ INY
0c1b : 91 23 __ STA (SP + 0),y 
0c1d : a9 99 __ LDA #$99
0c1f : 85 1c __ STA ACCU + 1 ; (s + 3)
0c21 : 85 1d __ STA ACCU + 2 
0c23 : a9 9a __ LDA #$9a
0c25 : 85 1b __ STA ACCU + 0 ; (s + 2)
0c27 : a9 3e __ LDA #$3e
0c29 : 85 1e __ STA ACCU + 3 
0c2b : a2 63 __ LDX #$63
0c2d : 20 9f 19 JSR $199f ; (freg + 4)
0c30 : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0c33 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0c35 : a0 0a __ LDY #$0a
0c37 : 91 23 __ STA (SP + 0),y 
0c39 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0c3b : c8 __ __ INY
0c3c : 91 23 __ STA (SP + 0),y 
0c3e : a5 1d __ LDA ACCU + 2 
0c40 : c8 __ __ INY
0c41 : 91 23 __ STA (SP + 0),y 
0c43 : a5 1e __ LDA ACCU + 3 
0c45 : c8 __ __ INY
0c46 : 91 23 __ STA (SP + 0),y 
0c48 : a9 66 __ LDA #$66
0c4a : 85 1b __ STA ACCU + 0 ; (s + 2)
0c4c : 85 1c __ STA ACCU + 1 ; (s + 3)
0c4e : 85 1d __ STA ACCU + 2 
0c50 : a9 3f __ LDA #$3f
0c52 : 85 1e __ STA ACCU + 3 
0c54 : a2 5f __ LDX #$5f
0c56 : 20 9f 19 JSR $199f ; (freg + 4)
0c59 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0c5c : a5 1b __ LDA ACCU + 0 ; (s + 2)
0c5e : a0 0e __ LDY #$0e
0c60 : 91 23 __ STA (SP + 0),y 
0c62 : a5 1c __ LDA ACCU + 1 ; (s + 3)
0c64 : c8 __ __ INY
0c65 : 91 23 __ STA (SP + 0),y 
0c67 : a5 1d __ LDA ACCU + 2 
0c69 : c8 __ __ INY
0c6a : 91 23 __ STA (SP + 0),y 
0c6c : a5 1e __ LDA ACCU + 3 
0c6e : c8 __ __ INY
0c6f : 91 23 __ STA (SP + 0),y 
0c71 : 20 4d 0a JSR $0a4d ; (draw.s1 + 0)
0c74 : a0 34 __ LDY #$34
0c76 : b1 23 __ LDA (SP + 0),y 
0c78 : 85 5f __ STA T4 + 0 
0c7a : c8 __ __ INY
0c7b : b1 23 __ LDA (SP + 0),y 
0c7d : 85 60 __ STA T4 + 1 
0c7f : c8 __ __ INY
0c80 : b1 23 __ LDA (SP + 0),y 
0c82 : 85 61 __ STA T4 + 2 
0c84 : c8 __ __ INY
0c85 : b1 23 __ LDA (SP + 0),y 
0c87 : 85 62 __ STA T4 + 3 
0c89 : a9 cc __ LDA #$cc
0c8b : 85 1c __ STA ACCU + 1 ; (s + 3)
0c8d : 85 1d __ STA ACCU + 2 
0c8f : a9 cd __ LDA #$cd
0c91 : 85 1b __ STA ACCU + 0 ; (s + 2)
0c93 : a9 be __ LDA #$be
0c95 : 85 1e __ STA ACCU + 3 
0c97 : a2 63 __ LDX #$63
0c99 : 20 9f 19 JSR $199f ; (freg + 4)
0c9c : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0c9f : a5 53 __ LDA T1 + 0 
0ca1 : a0 02 __ LDY #$02
0ca3 : 91 23 __ STA (SP + 0),y 
0ca5 : a5 54 __ LDA T1 + 1 
0ca7 : c8 __ __ INY
0ca8 : 91 23 __ STA (SP + 0),y 
0caa : a5 55 __ LDA T1 + 2 
0cac : c8 __ __ INY
0cad : 91 23 __ STA (SP + 0),y 
0caf : a5 56 __ LDA T1 + 3 
0cb1 : c8 __ __ INY
0cb2 : 91 23 __ STA (SP + 0),y 
0cb4 : a5 57 __ LDA T2 + 0 
0cb6 : c8 __ __ INY
0cb7 : 91 23 __ STA (SP + 0),y 
0cb9 : a5 58 __ LDA T2 + 1 
0cbb : c8 __ __ INY
0cbc : 91 23 __ STA (SP + 0),y 
0cbe : a5 59 __ LDA T2 + 2 
0cc0 : c8 __ __ INY
0cc1 : 91 23 __ STA (SP + 0),y 
0cc3 : a5 5a __ LDA T2 + 3 
0cc5 : c8 __ __ INY
0cc6 : 91 23 __ STA (SP + 0),y 
0cc8 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0cca : c8 __ __ INY
0ccb : 91 23 __ STA (SP + 0),y 
0ccd : a5 1c __ LDA ACCU + 1 ; (s + 3)
0ccf : c8 __ __ INY
0cd0 : 91 23 __ STA (SP + 0),y 
0cd2 : a5 1d __ LDA ACCU + 2 
0cd4 : c8 __ __ INY
0cd5 : 91 23 __ STA (SP + 0),y 
0cd7 : a5 1e __ LDA ACCU + 3 
0cd9 : c8 __ __ INY
0cda : 91 23 __ STA (SP + 0),y 
0cdc : a9 cd __ LDA #$cd
0cde : 85 1b __ STA ACCU + 0 ; (s + 2)
0ce0 : a9 3f __ LDA #$3f
0ce2 : 85 1e __ STA ACCU + 3 
0ce4 : a9 cc __ LDA #$cc
0ce6 : 85 1c __ STA ACCU + 1 ; (s + 3)
0ce8 : a9 4c __ LDA #$4c
0cea : 85 1d __ STA ACCU + 2 
0cec : a2 5f __ LDX #$5f
0cee : 20 9f 19 JSR $199f ; (freg + 4)
0cf1 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0cf4 : a5 1b __ LDA ACCU + 0 ; (s + 2)
0cf6 : a0 0e __ LDY #$0e
0cf8 : 91 23 __ STA (SP + 0),y 
0cfa : a5 1c __ LDA ACCU + 1 ; (s + 3)
0cfc : c8 __ __ INY
0cfd : 91 23 __ STA (SP + 0),y 
0cff : a5 1d __ LDA ACCU + 2 
0d01 : c8 __ __ INY
0d02 : 91 23 __ STA (SP + 0),y 
0d04 : a5 1e __ LDA ACCU + 3 
0d06 : c8 __ __ INY
0d07 : 91 23 __ STA (SP + 0),y 
0d09 : 20 4d 0a JSR $0a4d ; (draw.s1 + 0)
.s3:
0d0c : a0 25 __ LDY #$25
0d0e : a2 13 __ LDX #$13
0d10 : b1 23 __ LDA (SP + 0),y 
0d12 : 95 53 __ STA T1 + 0,x 
0d14 : 88 __ __ DEY
0d15 : ca __ __ DEX
0d16 : 10 f8 __ BPL $0d10 ; (draw.s3 + 4)
0d18 : 18 __ __ CLC
0d19 : a5 23 __ LDA SP + 0 
0d1b : 69 26 __ ADC #$26
0d1d : 85 23 __ STA SP + 0 
0d1f : 90 02 __ BCC $0d23 ; (draw.s3 + 23)
0d21 : e6 24 __ INC SP + 1 
0d23 : 60 __ __ RTS
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
0d24 : a5 0d __ LDA P0 ; (f + 0)
0d26 : 85 43 __ STA T0 + 0 
0d28 : a5 0e __ LDA P1 ; (f + 1)
0d2a : 85 44 __ STA T0 + 1 
0d2c : a5 0f __ LDA P2 ; (f + 2)
0d2e : 85 45 __ STA T0 + 2 
0d30 : a5 10 __ LDA P3 ; (f + 3)
0d32 : 29 7f __ AND #$7f
0d34 : 05 0f __ ORA P2 ; (f + 2)
0d36 : 05 0e __ ORA P1 ; (f + 1)
0d38 : 05 0d __ ORA P0 ; (f + 0)
0d3a : f0 0e __ BEQ $0d4a ; (sin.s5 + 0)
.s22:
0d3c : 24 10 __ BIT P3 ; (f + 3)
0d3e : 10 0a __ BPL $0d4a ; (sin.s5 + 0)
.s21:
0d40 : a9 00 __ LDA #$00
0d42 : 85 47 __ STA T1 + 0 
0d44 : 85 48 __ STA T1 + 1 
0d46 : a9 bf __ LDA #$bf
0d48 : d0 08 __ BNE $0d52 ; (sin.s6 + 0)
.s5:
0d4a : a9 00 __ LDA #$00
0d4c : 85 47 __ STA T1 + 0 
0d4e : 85 48 __ STA T1 + 1 
0d50 : a9 3f __ LDA #$3f
.s6:
0d52 : 85 4a __ STA T1 + 3 
0d54 : a5 10 __ LDA P3 ; (f + 3)
0d56 : 29 7f __ AND #$7f
0d58 : 85 46 __ STA T0 + 3 
0d5a : a9 80 __ LDA #$80
0d5c : 85 49 __ STA T1 + 2 
0d5e : a9 83 __ LDA #$83
0d60 : 85 1b __ STA ACCU + 0 
0d62 : a9 3e __ LDA #$3e
0d64 : 85 1e __ STA ACCU + 3 
0d66 : a9 f9 __ LDA #$f9
0d68 : 85 1c __ STA ACCU + 1 
0d6a : a9 22 __ LDA #$22
0d6c : 85 1d __ STA ACCU + 2 
0d6e : a2 43 __ LDX #$43
0d70 : 20 9f 19 JSR $199f ; (freg + 4)
0d73 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0d76 : a5 1b __ LDA ACCU + 0 
0d78 : 85 43 __ STA T0 + 0 
0d7a : a5 1c __ LDA ACCU + 1 
0d7c : 85 44 __ STA T0 + 1 
0d7e : a5 1d __ LDA ACCU + 2 
0d80 : 85 45 __ STA T0 + 2 
0d82 : a5 1e __ LDA ACCU + 3 
0d84 : 85 46 __ STA T0 + 3 
0d86 : 20 bf 19 JSR $19bf ; (freg + 36)
0d89 : 20 95 1b JSR $1b95 ; (fround + 0)
0d8c : a2 43 __ LDX #$43
0d8e : 20 9f 19 JSR $199f ; (freg + 4)
0d91 : a5 1e __ LDA ACCU + 3 
0d93 : 49 80 __ EOR #$80
0d95 : 85 1e __ STA ACCU + 3 
0d97 : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0d9a : a5 1b __ LDA ACCU + 0 
0d9c : 85 43 __ STA T0 + 0 
0d9e : a5 1c __ LDA ACCU + 1 
0da0 : 85 44 __ STA T0 + 1 
0da2 : a6 1d __ LDX ACCU + 2 
0da4 : 86 45 __ STX T0 + 2 
0da6 : a5 1e __ LDA ACCU + 3 
0da8 : 85 46 __ STA T0 + 3 
0daa : 30 3b __ BMI $0de7 ; (sin.s7 + 0)
.s16:
0dac : c9 3f __ CMP #$3f
0dae : d0 0b __ BNE $0dbb ; (sin.s20 + 0)
.s17:
0db0 : 8a __ __ TXA
0db1 : d0 08 __ BNE $0dbb ; (sin.s20 + 0)
.s18:
0db3 : a5 1c __ LDA ACCU + 1 
0db5 : d0 04 __ BNE $0dbb ; (sin.s20 + 0)
.s19:
0db7 : a5 1b __ LDA ACCU + 0 
0db9 : f0 02 __ BEQ $0dbd ; (sin.s15 + 0)
.s20:
0dbb : 90 2a __ BCC $0de7 ; (sin.s7 + 0)
.s15:
0dbd : a9 00 __ LDA #$00
0dbf : 85 1b __ STA ACCU + 0 
0dc1 : 85 1c __ STA ACCU + 1 
0dc3 : 85 1d __ STA ACCU + 2 
0dc5 : a9 bf __ LDA #$bf
0dc7 : 85 1e __ STA ACCU + 3 
0dc9 : a2 43 __ LDX #$43
0dcb : 20 9f 19 JSR $199f ; (freg + 4)
0dce : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0dd1 : a5 1b __ LDA ACCU + 0 
0dd3 : 85 43 __ STA T0 + 0 
0dd5 : a5 1c __ LDA ACCU + 1 
0dd7 : 85 44 __ STA T0 + 1 
0dd9 : a5 1d __ LDA ACCU + 2 
0ddb : 85 45 __ STA T0 + 2 
0ddd : a5 1e __ LDA ACCU + 3 
0ddf : 85 46 __ STA T0 + 3 
0de1 : a5 4a __ LDA T1 + 3 
0de3 : 49 80 __ EOR #$80
0de5 : 85 4a __ STA T1 + 3 
.s7:
0de7 : a5 1e __ LDA ACCU + 3 
0de9 : 30 38 __ BMI $0e23 ; (sin.s8 + 0)
.s10:
0deb : c9 3e __ CMP #$3e
0ded : d0 0e __ BNE $0dfd ; (sin.s14 + 0)
.s11:
0def : a5 1d __ LDA ACCU + 2 
0df1 : c9 80 __ CMP #$80
0df3 : d0 08 __ BNE $0dfd ; (sin.s14 + 0)
.s12:
0df5 : a5 1c __ LDA ACCU + 1 
0df7 : d0 04 __ BNE $0dfd ; (sin.s14 + 0)
.s13:
0df9 : a5 1b __ LDA ACCU + 0 
0dfb : f0 02 __ BEQ $0dff ; (sin.s9 + 0)
.s14:
0dfd : 90 24 __ BCC $0e23 ; (sin.s8 + 0)
.s9:
0dff : a9 00 __ LDA #$00
0e01 : 85 1b __ STA ACCU + 0 
0e03 : 85 1c __ STA ACCU + 1 
0e05 : 85 1d __ STA ACCU + 2 
0e07 : a9 3f __ LDA #$3f
0e09 : 85 1e __ STA ACCU + 3 
0e0b : a2 43 __ LDX #$43
0e0d : 20 9f 19 JSR $199f ; (freg + 4)
0e10 : 20 e0 19 JSR $19e0 ; (faddsub + 0)
0e13 : a5 1b __ LDA ACCU + 0 
0e15 : 85 43 __ STA T0 + 0 
0e17 : a5 1c __ LDA ACCU + 1 
0e19 : 85 44 __ STA T0 + 1 
0e1b : a5 1d __ LDA ACCU + 2 
0e1d : 85 45 __ STA T0 + 2 
0e1f : a5 1e __ LDA ACCU + 3 
0e21 : 85 46 __ STA T0 + 3 
.s8:
0e23 : a9 98 __ LDA #$98
0e25 : 85 1b __ STA ACCU + 0 
0e27 : a9 42 __ LDA #$42
0e29 : 85 1e __ STA ACCU + 3 
0e2b : a9 ec __ LDA #$ec
0e2d : 85 1c __ STA ACCU + 1 
0e2f : a9 5e __ LDA #$5e
0e31 : 85 1d __ STA ACCU + 2 
0e33 : a2 43 __ LDX #$43
0e35 : 20 9f 19 JSR $199f ; (freg + 4)
0e38 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0e3b : a9 f8 __ LDA #$f8
0e3d : 85 03 __ STA WORK + 0 
0e3f : a9 41 __ LDA #$41
0e41 : 85 06 __ STA WORK + 3 
0e43 : a9 c5 __ LDA #$c5
0e45 : 85 04 __ STA WORK + 1 
0e47 : a9 13 __ LDA #$13
0e49 : 85 05 __ STA WORK + 2 
0e4b : 20 af 19 JSR $19af ; (freg + 20)
0e4e : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0e51 : a2 43 __ LDX #$43
0e53 : 20 9f 19 JSR $199f ; (freg + 4)
0e56 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0e59 : a9 6e __ LDA #$6e
0e5b : 85 03 __ STA WORK + 0 
0e5d : a9 c2 __ LDA #$c2
0e5f : 85 06 __ STA WORK + 3 
0e61 : a9 27 __ LDA #$27
0e63 : 85 04 __ STA WORK + 1 
0e65 : a9 2a __ LDA #$2a
0e67 : 85 05 __ STA WORK + 2 
0e69 : 20 af 19 JSR $19af ; (freg + 20)
0e6c : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0e6f : a2 43 __ LDX #$43
0e71 : 20 9f 19 JSR $199f ; (freg + 4)
0e74 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0e77 : a9 df __ LDA #$df
0e79 : 85 03 __ STA WORK + 0 
0e7b : a9 3d __ LDA #$3d
0e7d : 85 06 __ STA WORK + 3 
0e7f : a9 af __ LDA #$af
0e81 : 85 04 __ STA WORK + 1 
0e83 : a9 5c __ LDA #$5c
0e85 : 85 05 __ STA WORK + 2 
0e87 : 20 af 19 JSR $19af ; (freg + 20)
0e8a : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0e8d : a2 43 __ LDX #$43
0e8f : 20 9f 19 JSR $199f ; (freg + 4)
0e92 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0e95 : a9 b6 __ LDA #$b6
0e97 : 85 03 __ STA WORK + 0 
0e99 : a9 40 __ LDA #$40
0e9b : 85 06 __ STA WORK + 3 
0e9d : a9 0f __ LDA #$0f
0e9f : 85 04 __ STA WORK + 1 
0ea1 : a9 c9 __ LDA #$c9
0ea3 : 85 05 __ STA WORK + 2 
0ea5 : 20 af 19 JSR $19af ; (freg + 20)
0ea8 : 20 e6 19 JSR $19e6 ; (faddsub + 6)
0eab : a2 43 __ LDX #$43
0ead : 20 9f 19 JSR $199f ; (freg + 4)
0eb0 : 20 cd 1a JSR $1acd ; (crt_fmul + 0)
0eb3 : a2 47 __ LDX #$47
0eb5 : 20 9f 19 JSR $199f ; (freg + 4)
0eb8 : 4c cd 1a JMP $1acd ; (crt_fmul + 0)
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
0ebb : a2 0d __ LDX #$0d
0ebd : b5 53 __ LDA T2 + 0,x 
0ebf : 9d e4 9f STA $9fe4,x ; (bm_line@stack + 0)
0ec2 : ca __ __ DEX
0ec3 : 10 f8 __ BPL $0ebd ; (bm_line.s1 + 2)
.s4:
0ec5 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0ec8 : 85 55 __ STA T3 + 0 
0eca : ad f9 9f LDA $9ff9 ; (sstack + 7)
0ecd : 85 56 __ STA T3 + 1 
0ecf : ad fc 9f LDA $9ffc ; (sstack + 10)
0ed2 : 85 53 __ STA T2 + 0 
0ed4 : 38 __ __ SEC
0ed5 : e5 55 __ SBC T3 + 0 
0ed7 : 85 57 __ STA T4 + 0 
0ed9 : ad fd 9f LDA $9ffd ; (sstack + 11)
0edc : 85 54 __ STA T2 + 1 
0ede : e5 56 __ SBC T3 + 1 
0ee0 : 85 58 __ STA T4 + 1 
0ee2 : ad f4 9f LDA $9ff4 ; (sstack + 2)
0ee5 : 85 59 __ STA T5 + 0 
0ee7 : ad f5 9f LDA $9ff5 ; (sstack + 3)
0eea : 85 5a __ STA T5 + 1 
0eec : a0 00 __ LDY #$00
0eee : b1 59 __ LDA (T5 + 0),y 
0ef0 : 85 43 __ STA T0 + 0 
0ef2 : c8 __ __ INY
0ef3 : b1 59 __ LDA (T5 + 0),y 
0ef5 : 85 44 __ STA T0 + 1 
0ef7 : a0 04 __ LDY #$04
0ef9 : b1 59 __ LDA (T5 + 0),y 
0efb : 85 45 __ STA T1 + 0 
0efd : ad f6 9f LDA $9ff6 ; (sstack + 4)
0f00 : 85 5d __ STA T7 + 0 
0f02 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0f05 : 85 5e __ STA T7 + 1 
0f07 : ad fa 9f LDA $9ffa ; (sstack + 8)
0f0a : 85 5b __ STA T6 + 0 
0f0c : 38 __ __ SEC
0f0d : e5 5d __ SBC T7 + 0 
0f0f : 85 5f __ STA T8 + 0 
0f11 : ad fb 9f LDA $9ffb ; (sstack + 9)
0f14 : 85 5c __ STA T6 + 1 
0f16 : c8 __ __ INY
0f17 : e5 5e __ SBC T7 + 1 
0f19 : 85 60 __ STA T8 + 1 
0f1b : 30 07 __ BMI $0f24 ; (bm_line.s5 + 0)
.s82:
0f1d : 05 5f __ ORA T8 + 0 
0f1f : f0 03 __ BEQ $0f24 ; (bm_line.s5 + 0)
0f21 : 4c 54 12 JMP $1254 ; (bm_line.s64 + 0)
.s5:
0f24 : a5 5e __ LDA T7 + 1 
0f26 : 10 03 __ BPL $0f2b ; (bm_line.s63 + 0)
0f28 : 4c a0 10 JMP $10a0 ; (bm_line.s3 + 0)
.s63:
0f2b : c5 44 __ CMP T0 + 1 
0f2d : d0 04 __ BNE $0f33 ; (bm_line.s62 + 0)
.s61:
0f2f : a5 5d __ LDA T7 + 0 
0f31 : c5 43 __ CMP T0 + 0 
.s62:
0f33 : 90 f3 __ BCC $0f28 ; (bm_line.s5 + 4)
.s6:
0f35 : a5 5c __ LDA T6 + 1 
0f37 : 10 03 __ BPL $0f3c ; (bm_line.s60 + 0)
0f39 : 4c fd 11 JMP $11fd ; (bm_line.s52 + 0)
.s60:
0f3c : d1 59 __ CMP (T5 + 0),y 
0f3e : d0 04 __ BNE $0f44 ; (bm_line.s59 + 0)
.s58:
0f40 : a5 5b __ LDA T6 + 0 
0f42 : c5 45 __ CMP T1 + 0 
.s59:
0f44 : b0 e2 __ BCS $0f28 ; (bm_line.s5 + 4)
.s7:
0f46 : a5 5c __ LDA T6 + 1 
0f48 : c5 44 __ CMP T0 + 1 
0f4a : d0 04 __ BNE $0f50 ; (bm_line.s57 + 0)
.s56:
0f4c : a5 5b __ LDA T6 + 0 
0f4e : c5 43 __ CMP T0 + 0 
.s57:
0f50 : 90 e7 __ BCC $0f39 ; (bm_line.s6 + 4)
.s8:
0f52 : a5 5e __ LDA T7 + 1 
0f54 : d1 59 __ CMP (T5 + 0),y 
0f56 : d0 04 __ BNE $0f5c ; (bm_line.s54 + 0)
.s51:
0f58 : a5 5d __ LDA T7 + 0 
0f5a : c5 45 __ CMP T1 + 0 
.s54:
0f5c : 90 4e __ BCC $0fac ; (bm_line.s9 + 0)
.s50:
0f5e : a5 57 __ LDA T4 + 0 
0f60 : 85 0f __ STA P2 
0f62 : a5 58 __ LDA T4 + 1 
0f64 : 85 10 __ STA P3 
0f66 : a5 5f __ LDA T8 + 0 
0f68 : 85 11 __ STA P4 
0f6a : a5 60 __ LDA T8 + 1 
0f6c : 85 12 __ STA P5 
0f6e : 18 __ __ CLC
0f6f : a5 5d __ LDA T7 + 0 
0f71 : 69 01 __ ADC #$01
0f73 : a8 __ __ TAY
0f74 : a5 5e __ LDA T7 + 1 
0f76 : 69 00 __ ADC #$00
0f78 : aa __ __ TAX
0f79 : 98 __ __ TYA
0f7a : 38 __ __ SEC
0f7b : a0 04 __ LDY #$04
0f7d : f1 59 __ SBC (T5 + 0),y 
0f7f : 85 0d __ STA P0 
0f81 : 8a __ __ TXA
0f82 : c8 __ __ INY
0f83 : f1 59 __ SBC (T5 + 0),y 
0f85 : 85 0e __ STA P1 
0f87 : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
0f8a : 38 __ __ SEC
0f8b : a5 55 __ LDA T3 + 0 
0f8d : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0f8f : 8d f8 9f STA $9ff8 ; (sstack + 6)
0f92 : a5 56 __ LDA T3 + 1 
0f94 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0f96 : 8d f9 9f STA $9ff9 ; (sstack + 7)
0f99 : a0 04 __ LDY #$04
0f9b : b1 59 __ LDA (T5 + 0),y 
0f9d : 38 __ __ SEC
0f9e : e9 01 __ SBC #$01
0fa0 : aa __ __ TAX
0fa1 : c8 __ __ INY
0fa2 : b1 59 __ LDA (T5 + 0),y 
0fa4 : 8e f6 9f STX $9ff6 ; (sstack + 4)
0fa7 : e9 00 __ SBC #$00
0fa9 : 8d f7 9f STA $9ff7 ; (sstack + 5)
.s9:
0fac : a0 02 __ LDY #$02
0fae : b1 59 __ LDA (T5 + 0),y 
0fb0 : 85 43 __ STA T0 + 0 
0fb2 : c8 __ __ INY
0fb3 : b1 59 __ LDA (T5 + 0),y 
0fb5 : 85 44 __ STA T0 + 1 
0fb7 : a0 06 __ LDY #$06
0fb9 : b1 59 __ LDA (T5 + 0),y 
0fbb : 85 45 __ STA T1 + 0 
0fbd : c8 __ __ INY
0fbe : a5 58 __ LDA T4 + 1 
0fc0 : 30 07 __ BMI $0fc9 ; (bm_line.s10 + 0)
.s49:
0fc2 : 05 57 __ ORA T4 + 0 
0fc4 : f0 03 __ BEQ $0fc9 ; (bm_line.s10 + 0)
0fc6 : 4c 05 11 JMP $1105 ; (bm_line.s30 + 0)
.s10:
0fc9 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0fcc : 85 55 __ STA T3 + 0 
0fce : ad f9 9f LDA $9ff9 ; (sstack + 7)
0fd1 : 10 03 __ BPL $0fd6 ; (bm_line.s29 + 0)
0fd3 : 4c a0 10 JMP $10a0 ; (bm_line.s3 + 0)
.s29:
0fd6 : 85 56 __ STA T3 + 1 
0fd8 : c5 44 __ CMP T0 + 1 
0fda : d0 04 __ BNE $0fe0 ; (bm_line.s28 + 0)
.s27:
0fdc : a5 55 __ LDA T3 + 0 
0fde : c5 43 __ CMP T0 + 0 
.s28:
0fe0 : 90 f1 __ BCC $0fd3 ; (bm_line.s10 + 10)
.s11:
0fe2 : ad fd 9f LDA $9ffd ; (sstack + 11)
0fe5 : 10 03 __ BPL $0fea ; (bm_line.s26 + 0)
0fe7 : 4c ab 10 JMP $10ab ; (bm_line.s17 + 0)
.s26:
0fea : d1 59 __ CMP (T5 + 0),y 
0fec : d0 05 __ BNE $0ff3 ; (bm_line.s25 + 0)
.s24:
0fee : ad fc 9f LDA $9ffc ; (sstack + 10)
0ff1 : c5 45 __ CMP T1 + 0 
.s25:
0ff3 : b0 de __ BCS $0fd3 ; (bm_line.s10 + 10)
.s12:
0ff5 : ad fd 9f LDA $9ffd ; (sstack + 11)
0ff8 : 30 ed __ BMI $0fe7 ; (bm_line.s11 + 5)
.s23:
0ffa : c5 44 __ CMP T0 + 1 
0ffc : d0 05 __ BNE $1003 ; (bm_line.s22 + 0)
.s21:
0ffe : ad fc 9f LDA $9ffc ; (sstack + 10)
1001 : c5 43 __ CMP T0 + 0 
.s22:
1003 : 90 e2 __ BCC $0fe7 ; (bm_line.s11 + 5)
.s13:
1005 : a5 56 __ LDA T3 + 1 
1007 : d1 59 __ CMP (T5 + 0),y 
1009 : d0 04 __ BNE $100f ; (bm_line.s19 + 0)
.s16:
100b : a5 55 __ LDA T3 + 0 
100d : c5 45 __ CMP T1 + 0 
.s19:
100f : 90 50 __ BCC $1061 ; (bm_line.s14 + 0)
.s15:
1011 : a5 5f __ LDA T8 + 0 
1013 : 85 0f __ STA P2 
1015 : a5 60 __ LDA T8 + 1 
1017 : 85 10 __ STA P3 
1019 : a5 57 __ LDA T4 + 0 
101b : 85 11 __ STA P4 
101d : a5 58 __ LDA T4 + 1 
101f : 85 12 __ STA P5 
1021 : 18 __ __ CLC
1022 : a5 55 __ LDA T3 + 0 
1024 : 69 01 __ ADC #$01
1026 : a8 __ __ TAY
1027 : a5 56 __ LDA T3 + 1 
1029 : 69 00 __ ADC #$00
102b : aa __ __ TAX
102c : 98 __ __ TYA
102d : 38 __ __ SEC
102e : a0 06 __ LDY #$06
1030 : f1 59 __ SBC (T5 + 0),y 
1032 : 85 0d __ STA P0 
1034 : 8a __ __ TXA
1035 : c8 __ __ INY
1036 : f1 59 __ SBC (T5 + 0),y 
1038 : 85 0e __ STA P1 
103a : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
103d : ad f6 9f LDA $9ff6 ; (sstack + 4)
1040 : 38 __ __ SEC
1041 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
1043 : 8d f6 9f STA $9ff6 ; (sstack + 4)
1046 : ad f7 9f LDA $9ff7 ; (sstack + 5)
1049 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
104b : 8d f7 9f STA $9ff7 ; (sstack + 5)
104e : a0 06 __ LDY #$06
1050 : b1 59 __ LDA (T5 + 0),y 
1052 : 38 __ __ SEC
1053 : e9 01 __ SBC #$01
1055 : aa __ __ TAX
1056 : c8 __ __ INY
1057 : b1 59 __ LDA (T5 + 0),y 
1059 : 8e f8 9f STX $9ff8 ; (sstack + 6)
105c : e9 00 __ SBC #$00
105e : 8d f9 9f STA $9ff9 ; (sstack + 7)
.s14:
1061 : ad f2 9f LDA $9ff2 ; (sstack + 0)
1064 : 85 0d __ STA P0 
1066 : ad f3 9f LDA $9ff3 ; (sstack + 1)
1069 : 85 0e __ STA P1 
106b : ad f6 9f LDA $9ff6 ; (sstack + 4)
106e : 85 0f __ STA P2 
1070 : ad f7 9f LDA $9ff7 ; (sstack + 5)
1073 : 85 10 __ STA P3 
1075 : ad f8 9f LDA $9ff8 ; (sstack + 6)
1078 : 85 11 __ STA P4 
107a : ad f9 9f LDA $9ff9 ; (sstack + 7)
107d : 85 12 __ STA P5 
107f : ad fa 9f LDA $9ffa ; (sstack + 8)
1082 : 85 13 __ STA P6 
1084 : ad fb 9f LDA $9ffb ; (sstack + 9)
1087 : 85 14 __ STA P7 
1089 : ad fc 9f LDA $9ffc ; (sstack + 10)
108c : 85 15 __ STA P8 
108e : ad fd 9f LDA $9ffd ; (sstack + 11)
1091 : 85 16 __ STA P9 
1093 : ad fe 9f LDA $9ffe ; (sstack + 12)
1096 : 85 17 __ STA P10 
1098 : ad ff 9f LDA $9fff ; (sstack + 13)
109b : 85 18 __ STA P11 
109d : 20 f5 13 JSR $13f5 ; (bmu_line.s4 + 0)
.s3:
10a0 : a2 0d __ LDX #$0d
10a2 : bd e4 9f LDA $9fe4,x ; (bm_line@stack + 0)
10a5 : 95 53 __ STA T2 + 0,x 
10a7 : ca __ __ DEX
10a8 : 10 f8 __ BPL $10a2 ; (bm_line.s3 + 2)
10aa : 60 __ __ RTS
.s17:
10ab : a5 5f __ LDA T8 + 0 
10ad : 85 0f __ STA P2 
10af : a5 60 __ LDA T8 + 1 
10b1 : 85 10 __ STA P3 
10b3 : a5 57 __ LDA T4 + 0 
10b5 : 85 11 __ STA P4 
10b7 : a5 58 __ LDA T4 + 1 
10b9 : 85 12 __ STA P5 
10bb : 38 __ __ SEC
10bc : a5 43 __ LDA T0 + 0 
10be : ed fc 9f SBC $9ffc ; (sstack + 10)
10c1 : 85 0d __ STA P0 
10c3 : a5 44 __ LDA T0 + 1 
10c5 : ed fd 9f SBC $9ffd ; (sstack + 11)
10c8 : 85 0e __ STA P1 
10ca : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
10cd : a0 02 __ LDY #$02
10cf : b1 59 __ LDA (T5 + 0),y 
10d1 : 8d fc 9f STA $9ffc ; (sstack + 10)
10d4 : c8 __ __ INY
10d5 : b1 59 __ LDA (T5 + 0),y 
10d7 : 8d fd 9f STA $9ffd ; (sstack + 11)
10da : ad fa 9f LDA $9ffa ; (sstack + 8)
10dd : 18 __ __ CLC
10de : 65 1b __ ADC ACCU + 0 ; (clip + 0)
10e0 : 8d fa 9f STA $9ffa ; (sstack + 8)
10e3 : ad fb 9f LDA $9ffb ; (sstack + 9)
10e6 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
10e8 : 8d fb 9f STA $9ffb ; (sstack + 9)
10eb : a0 07 __ LDY #$07
10ed : b1 59 __ LDA (T5 + 0),y 
10ef : 10 03 __ BPL $10f4 ; (bm_line.s20 + 0)
10f1 : 4c 11 10 JMP $1011 ; (bm_line.s15 + 0)
.s20:
10f4 : a5 56 __ LDA T3 + 1 
10f6 : d1 59 __ CMP (T5 + 0),y 
10f8 : f0 03 __ BEQ $10fd ; (bm_line.s18 + 0)
10fa : 4c 0f 10 JMP $100f ; (bm_line.s19 + 0)
.s18:
10fd : a5 55 __ LDA T3 + 0 
10ff : 88 __ __ DEY
1100 : d1 59 __ CMP (T5 + 0),y 
1102 : 4c 0f 10 JMP $100f ; (bm_line.s19 + 0)
.s30:
1105 : ad fc 9f LDA $9ffc ; (sstack + 10)
1108 : 85 55 __ STA T3 + 0 
110a : ad fd 9f LDA $9ffd ; (sstack + 11)
110d : 30 91 __ BMI $10a0 ; (bm_line.s3 + 0)
.s48:
110f : 85 56 __ STA T3 + 1 
1111 : c5 44 __ CMP T0 + 1 
1113 : d0 04 __ BNE $1119 ; (bm_line.s47 + 0)
.s46:
1115 : a5 55 __ LDA T3 + 0 
1117 : c5 43 __ CMP T0 + 0 
.s47:
1119 : 90 85 __ BCC $10a0 ; (bm_line.s3 + 0)
.s31:
111b : ad f9 9f LDA $9ff9 ; (sstack + 7)
111e : 10 03 __ BPL $1123 ; (bm_line.s45 + 0)
1120 : 4c a3 11 JMP $11a3 ; (bm_line.s36 + 0)
.s45:
1123 : d1 59 __ CMP (T5 + 0),y 
1125 : d0 05 __ BNE $112c ; (bm_line.s44 + 0)
.s43:
1127 : ad f8 9f LDA $9ff8 ; (sstack + 6)
112a : c5 45 __ CMP T1 + 0 
.s44:
112c : 90 03 __ BCC $1131 ; (bm_line.s32 + 0)
112e : 4c a0 10 JMP $10a0 ; (bm_line.s3 + 0)
.s32:
1131 : ad f9 9f LDA $9ff9 ; (sstack + 7)
1134 : 30 6d __ BMI $11a3 ; (bm_line.s36 + 0)
.s42:
1136 : c5 44 __ CMP T0 + 1 
1138 : d0 05 __ BNE $113f ; (bm_line.s41 + 0)
.s40:
113a : ad f8 9f LDA $9ff8 ; (sstack + 6)
113d : c5 43 __ CMP T0 + 0 
.s41:
113f : 90 62 __ BCC $11a3 ; (bm_line.s36 + 0)
.s33:
1141 : a5 56 __ LDA T3 + 1 
1143 : d1 59 __ CMP (T5 + 0),y 
1145 : d0 04 __ BNE $114b ; (bm_line.s38 + 0)
.s35:
1147 : a5 55 __ LDA T3 + 0 
1149 : c5 45 __ CMP T1 + 0 
.s38:
114b : b0 03 __ BCS $1150 ; (bm_line.s34 + 0)
114d : 4c 61 10 JMP $1061 ; (bm_line.s14 + 0)
.s34:
1150 : a5 5f __ LDA T8 + 0 
1152 : 85 0f __ STA P2 
1154 : a5 60 __ LDA T8 + 1 
1156 : 85 10 __ STA P3 
1158 : a5 57 __ LDA T4 + 0 
115a : 85 11 __ STA P4 
115c : a5 58 __ LDA T4 + 1 
115e : 85 12 __ STA P5 
1160 : 18 __ __ CLC
1161 : a5 55 __ LDA T3 + 0 
1163 : 69 01 __ ADC #$01
1165 : a8 __ __ TAY
1166 : a5 56 __ LDA T3 + 1 
1168 : 69 00 __ ADC #$00
116a : aa __ __ TAX
116b : 98 __ __ TYA
116c : 38 __ __ SEC
116d : a0 06 __ LDY #$06
116f : f1 59 __ SBC (T5 + 0),y 
1171 : 85 0d __ STA P0 
1173 : 8a __ __ TXA
1174 : c8 __ __ INY
1175 : f1 59 __ SBC (T5 + 0),y 
1177 : 85 0e __ STA P1 
1179 : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
117c : ad fa 9f LDA $9ffa ; (sstack + 8)
117f : 38 __ __ SEC
1180 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
1182 : 8d fa 9f STA $9ffa ; (sstack + 8)
1185 : ad fb 9f LDA $9ffb ; (sstack + 9)
1188 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
118a : 8d fb 9f STA $9ffb ; (sstack + 9)
118d : a0 06 __ LDY #$06
118f : b1 59 __ LDA (T5 + 0),y 
1191 : 38 __ __ SEC
1192 : e9 01 __ SBC #$01
1194 : aa __ __ TAX
1195 : c8 __ __ INY
1196 : b1 59 __ LDA (T5 + 0),y 
1198 : 8e fc 9f STX $9ffc ; (sstack + 10)
119b : e9 00 __ SBC #$00
119d : 8d fd 9f STA $9ffd ; (sstack + 11)
11a0 : 4c 61 10 JMP $1061 ; (bm_line.s14 + 0)
.s36:
11a3 : a5 5f __ LDA T8 + 0 
11a5 : 85 0f __ STA P2 
11a7 : a5 60 __ LDA T8 + 1 
11a9 : 85 10 __ STA P3 
11ab : a5 57 __ LDA T4 + 0 
11ad : 85 11 __ STA P4 
11af : a5 58 __ LDA T4 + 1 
11b1 : 85 12 __ STA P5 
11b3 : 38 __ __ SEC
11b4 : a5 43 __ LDA T0 + 0 
11b6 : ed f8 9f SBC $9ff8 ; (sstack + 6)
11b9 : 85 0d __ STA P0 
11bb : a5 44 __ LDA T0 + 1 
11bd : ed f9 9f SBC $9ff9 ; (sstack + 7)
11c0 : 85 0e __ STA P1 
11c2 : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
11c5 : a0 02 __ LDY #$02
11c7 : b1 59 __ LDA (T5 + 0),y 
11c9 : 8d f8 9f STA $9ff8 ; (sstack + 6)
11cc : c8 __ __ INY
11cd : b1 59 __ LDA (T5 + 0),y 
11cf : 8d f9 9f STA $9ff9 ; (sstack + 7)
11d2 : ad f6 9f LDA $9ff6 ; (sstack + 4)
11d5 : 18 __ __ CLC
11d6 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
11d8 : 8d f6 9f STA $9ff6 ; (sstack + 4)
11db : ad f7 9f LDA $9ff7 ; (sstack + 5)
11de : 65 1c __ ADC ACCU + 1 ; (clip + 1)
11e0 : 8d f7 9f STA $9ff7 ; (sstack + 5)
11e3 : a0 07 __ LDY #$07
11e5 : b1 59 __ LDA (T5 + 0),y 
11e7 : 10 03 __ BPL $11ec ; (bm_line.s39 + 0)
11e9 : 4c 50 11 JMP $1150 ; (bm_line.s34 + 0)
.s39:
11ec : a5 56 __ LDA T3 + 1 
11ee : d1 59 __ CMP (T5 + 0),y 
11f0 : f0 03 __ BEQ $11f5 ; (bm_line.s37 + 0)
11f2 : 4c 4b 11 JMP $114b ; (bm_line.s38 + 0)
.s37:
11f5 : a5 55 __ LDA T3 + 0 
11f7 : 88 __ __ DEY
11f8 : d1 59 __ CMP (T5 + 0),y 
11fa : 4c 4b 11 JMP $114b ; (bm_line.s38 + 0)
.s52:
11fd : a5 57 __ LDA T4 + 0 
11ff : 85 0f __ STA P2 
1201 : a5 58 __ LDA T4 + 1 
1203 : 85 10 __ STA P3 
1205 : a5 5f __ LDA T8 + 0 
1207 : 85 11 __ STA P4 
1209 : a5 60 __ LDA T8 + 1 
120b : 85 12 __ STA P5 
120d : 38 __ __ SEC
120e : a5 43 __ LDA T0 + 0 
1210 : e5 5b __ SBC T6 + 0 
1212 : 85 0d __ STA P0 
1214 : a5 44 __ LDA T0 + 1 
1216 : e5 5c __ SBC T6 + 1 
1218 : 85 0e __ STA P1 
121a : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
121d : 18 __ __ CLC
121e : a5 1b __ LDA ACCU + 0 ; (clip + 0)
1220 : 65 53 __ ADC T2 + 0 
1222 : aa __ __ TAX
1223 : a0 00 __ LDY #$00
1225 : b1 59 __ LDA (T5 + 0),y 
1227 : 8d fa 9f STA $9ffa ; (sstack + 8)
122a : c8 __ __ INY
122b : b1 59 __ LDA (T5 + 0),y 
122d : 8e fc 9f STX $9ffc ; (sstack + 10)
1230 : 8d fb 9f STA $9ffb ; (sstack + 9)
1233 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
1235 : 65 54 __ ADC T2 + 1 
1237 : 8d fd 9f STA $9ffd ; (sstack + 11)
123a : a0 05 __ LDY #$05
123c : b1 59 __ LDA (T5 + 0),y 
123e : 10 03 __ BPL $1243 ; (bm_line.s55 + 0)
1240 : 4c 5e 0f JMP $0f5e ; (bm_line.s50 + 0)
.s55:
1243 : a5 5e __ LDA T7 + 1 
1245 : d1 59 __ CMP (T5 + 0),y 
1247 : f0 03 __ BEQ $124c ; (bm_line.s53 + 0)
1249 : 4c 5c 0f JMP $0f5c ; (bm_line.s54 + 0)
.s53:
124c : a5 5d __ LDA T7 + 0 
124e : 88 __ __ DEY
124f : d1 59 __ CMP (T5 + 0),y 
1251 : 4c 5c 0f JMP $0f5c ; (bm_line.s54 + 0)
.s64:
1254 : a5 5c __ LDA T6 + 1 
1256 : 10 03 __ BPL $125b ; (bm_line.s81 + 0)
1258 : 4c a0 10 JMP $10a0 ; (bm_line.s3 + 0)
.s81:
125b : c5 44 __ CMP T0 + 1 
125d : d0 04 __ BNE $1263 ; (bm_line.s80 + 0)
.s79:
125f : a5 5b __ LDA T6 + 0 
1261 : c5 43 __ CMP T0 + 0 
.s80:
1263 : 90 f3 __ BCC $1258 ; (bm_line.s64 + 4)
.s65:
1265 : a5 5e __ LDA T7 + 1 
1267 : 30 76 __ BMI $12df ; (bm_line.s70 + 0)
.s78:
1269 : d1 59 __ CMP (T5 + 0),y 
126b : d0 04 __ BNE $1271 ; (bm_line.s77 + 0)
.s76:
126d : a5 5d __ LDA T7 + 0 
126f : c5 45 __ CMP T1 + 0 
.s77:
1271 : b0 e5 __ BCS $1258 ; (bm_line.s64 + 4)
.s66:
1273 : a5 5e __ LDA T7 + 1 
1275 : c5 44 __ CMP T0 + 1 
1277 : d0 04 __ BNE $127d ; (bm_line.s75 + 0)
.s74:
1279 : a5 5d __ LDA T7 + 0 
127b : c5 43 __ CMP T0 + 0 
.s75:
127d : 90 60 __ BCC $12df ; (bm_line.s70 + 0)
.s67:
127f : a5 5c __ LDA T6 + 1 
1281 : d1 59 __ CMP (T5 + 0),y 
1283 : d0 04 __ BNE $1289 ; (bm_line.s72 + 0)
.s69:
1285 : a5 5b __ LDA T6 + 0 
1287 : c5 45 __ CMP T1 + 0 
.s72:
1289 : b0 03 __ BCS $128e ; (bm_line.s68 + 0)
128b : 4c ac 0f JMP $0fac ; (bm_line.s9 + 0)
.s68:
128e : a5 57 __ LDA T4 + 0 
1290 : 85 0f __ STA P2 
1292 : a5 58 __ LDA T4 + 1 
1294 : 85 10 __ STA P3 
1296 : a5 5f __ LDA T8 + 0 
1298 : 85 11 __ STA P4 
129a : a5 60 __ LDA T8 + 1 
129c : 85 12 __ STA P5 
129e : 18 __ __ CLC
129f : a5 5b __ LDA T6 + 0 
12a1 : 69 01 __ ADC #$01
12a3 : a8 __ __ TAY
12a4 : a5 5c __ LDA T6 + 1 
12a6 : 69 00 __ ADC #$00
12a8 : aa __ __ TAX
12a9 : 98 __ __ TYA
12aa : 38 __ __ SEC
12ab : a0 04 __ LDY #$04
12ad : f1 59 __ SBC (T5 + 0),y 
12af : 85 0d __ STA P0 
12b1 : 8a __ __ TXA
12b2 : c8 __ __ INY
12b3 : f1 59 __ SBC (T5 + 0),y 
12b5 : 85 0e __ STA P1 
12b7 : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
12ba : 38 __ __ SEC
12bb : a5 53 __ LDA T2 + 0 
12bd : e5 1b __ SBC ACCU + 0 ; (clip + 0)
12bf : 8d fc 9f STA $9ffc ; (sstack + 10)
12c2 : a5 54 __ LDA T2 + 1 
12c4 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
12c6 : 8d fd 9f STA $9ffd ; (sstack + 11)
12c9 : a0 04 __ LDY #$04
12cb : b1 59 __ LDA (T5 + 0),y 
12cd : 38 __ __ SEC
12ce : e9 01 __ SBC #$01
12d0 : aa __ __ TAX
12d1 : c8 __ __ INY
12d2 : b1 59 __ LDA (T5 + 0),y 
12d4 : 8e fa 9f STX $9ffa ; (sstack + 8)
12d7 : e9 00 __ SBC #$00
12d9 : 8d fb 9f STA $9ffb ; (sstack + 9)
12dc : 4c ac 0f JMP $0fac ; (bm_line.s9 + 0)
.s70:
12df : a5 57 __ LDA T4 + 0 
12e1 : 85 0f __ STA P2 
12e3 : a5 58 __ LDA T4 + 1 
12e5 : 85 10 __ STA P3 
12e7 : a5 5f __ LDA T8 + 0 
12e9 : 85 11 __ STA P4 
12eb : a5 60 __ LDA T8 + 1 
12ed : 85 12 __ STA P5 
12ef : 38 __ __ SEC
12f0 : a5 43 __ LDA T0 + 0 
12f2 : e5 5d __ SBC T7 + 0 
12f4 : 85 0d __ STA P0 
12f6 : a5 44 __ LDA T0 + 1 
12f8 : e5 5e __ SBC T7 + 1 
12fa : 85 0e __ STA P1 
12fc : 20 36 13 JSR $1336 ; (lmuldiv16s.s4 + 0)
12ff : 18 __ __ CLC
1300 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
1302 : 65 55 __ ADC T3 + 0 
1304 : aa __ __ TAX
1305 : a0 00 __ LDY #$00
1307 : b1 59 __ LDA (T5 + 0),y 
1309 : 8d f6 9f STA $9ff6 ; (sstack + 4)
130c : c8 __ __ INY
130d : b1 59 __ LDA (T5 + 0),y 
130f : 8e f8 9f STX $9ff8 ; (sstack + 6)
1312 : 8d f7 9f STA $9ff7 ; (sstack + 5)
1315 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
1317 : 65 56 __ ADC T3 + 1 
1319 : 8d f9 9f STA $9ff9 ; (sstack + 7)
131c : a0 05 __ LDY #$05
131e : b1 59 __ LDA (T5 + 0),y 
1320 : 10 03 __ BPL $1325 ; (bm_line.s73 + 0)
1322 : 4c 8e 12 JMP $128e ; (bm_line.s68 + 0)
.s73:
1325 : a5 5c __ LDA T6 + 1 
1327 : d1 59 __ CMP (T5 + 0),y 
1329 : f0 03 __ BEQ $132e ; (bm_line.s71 + 0)
132b : 4c 89 12 JMP $1289 ; (bm_line.s72 + 0)
.s71:
132e : a5 5b __ LDA T6 + 0 
1330 : 88 __ __ DEY
1331 : d1 59 __ CMP (T5 + 0),y 
1333 : 4c 89 12 JMP $1289 ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
1336 : a9 00 __ LDA #$00
1338 : 24 0e __ BIT P1 ; (a + 1)
133a : 10 0d __ BPL $1349 ; (lmuldiv16s.s5 + 0)
.s10:
133c : 38 __ __ SEC
133d : e5 0d __ SBC P0 ; (a + 0)
133f : 85 0d __ STA P0 ; (a + 0)
1341 : a9 00 __ LDA #$00
1343 : e5 0e __ SBC P1 ; (a + 1)
1345 : 85 0e __ STA P1 ; (a + 1)
1347 : a9 01 __ LDA #$01
.s5:
1349 : 85 43 __ STA T1 + 0 
134b : 24 10 __ BIT P3 ; (b + 1)
134d : 10 14 __ BPL $1363 ; (lmuldiv16s.s6 + 0)
.s9:
134f : 38 __ __ SEC
1350 : a9 00 __ LDA #$00
1352 : e5 0f __ SBC P2 ; (b + 0)
1354 : 85 0f __ STA P2 ; (b + 0)
1356 : a9 00 __ LDA #$00
1358 : e5 10 __ SBC P3 ; (b + 1)
135a : 85 10 __ STA P3 ; (b + 1)
135c : a9 00 __ LDA #$00
135e : c5 43 __ CMP T1 + 0 
1360 : 2a __ __ ROL
1361 : 85 43 __ STA T1 + 0 
.s6:
1363 : 24 12 __ BIT P5 ; (c + 1)
1365 : 10 14 __ BPL $137b ; (lmuldiv16s.s7 + 0)
.s8:
1367 : 38 __ __ SEC
1368 : a9 00 __ LDA #$00
136a : e5 11 __ SBC P4 ; (c + 0)
136c : 85 11 __ STA P4 ; (c + 0)
136e : a9 00 __ LDA #$00
1370 : e5 12 __ SBC P5 ; (c + 1)
1372 : 85 12 __ STA P5 ; (c + 1)
1374 : a9 00 __ LDA #$00
1376 : c5 43 __ CMP T1 + 0 
1378 : 2a __ __ ROL
1379 : 85 43 __ STA T1 + 0 
.s7:
137b : a9 00 __ LDA #$00
137d : 85 05 __ STA WORK + 2 
137f : 85 06 __ STA WORK + 3 
1381 : a5 0d __ LDA P0 ; (a + 0)
1383 : 38 __ __ SEC
1384 : a0 08 __ LDY #$08
1386 : 6a __ __ ROR
1387 : 90 0f __ BCC $1398 ; (lmuldiv16s.s7 + 29)
1389 : aa __ __ TAX
138a : 18 __ __ CLC
138b : a5 05 __ LDA WORK + 2 
138d : 65 0f __ ADC P2 ; (b + 0)
138f : 85 05 __ STA WORK + 2 
1391 : a5 06 __ LDA WORK + 3 
1393 : 65 10 __ ADC P3 ; (b + 1)
1395 : 85 06 __ STA WORK + 3 
1397 : 8a __ __ TXA
1398 : 66 06 __ ROR WORK + 3 
139a : 66 05 __ ROR WORK + 2 
139c : 88 __ __ DEY
139d : d0 e7 __ BNE $1386 ; (lmuldiv16s.s7 + 11)
139f : 6a __ __ ROR
13a0 : 90 07 __ BCC $13a9 ; (lmuldiv16s.s7 + 46)
13a2 : 85 03 __ STA WORK + 0 
13a4 : a5 0e __ LDA P1 ; (a + 1)
13a6 : 18 __ __ CLC
13a7 : 90 db __ BCC $1384 ; (lmuldiv16s.s7 + 9)
13a9 : 38 __ __ SEC
13aa : 85 04 __ STA WORK + 1 
13ac : a2 08 __ LDX #$08
13ae : 26 04 __ ROL WORK + 1 
13b0 : 26 05 __ ROL WORK + 2 
13b2 : 26 06 __ ROL WORK + 3 
13b4 : 90 0c __ BCC $13c2 ; (lmuldiv16s.s7 + 71)
13b6 : a5 05 __ LDA WORK + 2 
13b8 : e5 11 __ SBC P4 ; (c + 0)
13ba : a8 __ __ TAY
13bb : a5 06 __ LDA WORK + 3 
13bd : e5 12 __ SBC P5 ; (c + 1)
13bf : 38 __ __ SEC
13c0 : b0 0c __ BCS $13ce ; (lmuldiv16s.s7 + 83)
13c2 : 38 __ __ SEC
13c3 : a5 05 __ LDA WORK + 2 
13c5 : e5 11 __ SBC P4 ; (c + 0)
13c7 : a8 __ __ TAY
13c8 : a5 06 __ LDA WORK + 3 
13ca : e5 12 __ SBC P5 ; (c + 1)
13cc : 90 04 __ BCC $13d2 ; (lmuldiv16s.s7 + 87)
13ce : 85 06 __ STA WORK + 3 
13d0 : 84 05 __ STY WORK + 2 
13d2 : ca __ __ DEX
13d3 : d0 d9 __ BNE $13ae ; (lmuldiv16s.s7 + 51)
13d5 : a5 04 __ LDA WORK + 1 
13d7 : 2a __ __ ROL
13d8 : 90 07 __ BCC $13e1 ; (lmuldiv16s.s7 + 102)
13da : 85 1c __ STA ACCU + 1 
13dc : a5 03 __ LDA WORK + 0 
13de : 18 __ __ CLC
13df : 90 c9 __ BCC $13aa ; (lmuldiv16s.s7 + 47)
13e1 : 85 1b __ STA ACCU + 0 
13e3 : a5 43 __ LDA T1 + 0 
13e5 : f0 0d __ BEQ $13f4 ; (lmuldiv16s.s3 + 0)
13e7 : 38 __ __ SEC
13e8 : a9 00 __ LDA #$00
13ea : e5 1b __ SBC ACCU + 0 
13ec : 85 1b __ STA ACCU + 0 
13ee : a9 00 __ LDA #$00
13f0 : e5 1c __ SBC ACCU + 1 
13f2 : 85 1c __ STA ACCU + 1 
.s3:
13f4 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
13f5 : a5 17 __ LDA P10 ; (pattern + 0)
13f7 : f0 03 __ BEQ $13fc ; (bmu_line.s5 + 0)
13f9 : 4c fb 18 JMP $18fb ; (bmu_line.s59 + 0)
.s5:
13fc : a5 18 __ LDA P11 ; (op + 0)
13fe : f0 01 __ BEQ $1401 ; (bmu_line.s6 + 0)
1400 : 60 __ __ RTS
.s6:
1401 : c6 17 __ DEC P10 ; (pattern + 0)
1403 : a9 02 __ LDA #$02
.s63:
1405 : 85 18 __ STA P11 ; (op + 0)
.s7:
1407 : 38 __ __ SEC
1408 : a5 13 __ LDA P6 ; (x1 + 0)
140a : e5 0f __ SBC P2 ; (x0 + 0)
140c : 85 46 __ STA T2 + 0 
140e : a5 14 __ LDA P7 ; (x1 + 1)
1410 : e5 10 __ SBC P3 ; (x0 + 1)
1412 : 85 47 __ STA T2 + 1 
1414 : 10 11 __ BPL $1427 ; (bmu_line.s8 + 0)
.s58:
1416 : 38 __ __ SEC
1417 : a9 00 __ LDA #$00
1419 : e5 46 __ SBC T2 + 0 
141b : 85 46 __ STA T2 + 0 
141d : a9 00 __ LDA #$00
141f : e5 47 __ SBC T2 + 1 
1421 : 85 47 __ STA T2 + 1 
1423 : a9 01 __ LDA #$01
1425 : d0 02 __ BNE $1429 ; (bmu_line.s9 + 0)
.s8:
1427 : a9 00 __ LDA #$00
.s9:
1429 : 85 51 __ STA T10 + 0 
142b : 38 __ __ SEC
142c : a5 15 __ LDA P8 ; (y1 + 0)
142e : e5 11 __ SBC P4 ; (y0 + 0)
1430 : 85 43 __ STA T0 + 0 
1432 : a5 16 __ LDA P9 ; (y1 + 1)
1434 : e5 12 __ SBC P5 ; (y0 + 1)
1436 : 85 44 __ STA T0 + 1 
1438 : 10 11 __ BPL $144b ; (bmu_line.s10 + 0)
.s57:
143a : 38 __ __ SEC
143b : a9 00 __ LDA #$00
143d : e5 43 __ SBC T0 + 0 
143f : 85 43 __ STA T0 + 0 
1441 : a9 00 __ LDA #$00
1443 : e5 44 __ SBC T0 + 1 
1445 : 85 44 __ STA T0 + 1 
1447 : a9 01 __ LDA #$01
1449 : d0 02 __ BNE $144d ; (bmu_line.s11 + 0)
.s10:
144b : a9 00 __ LDA #$00
.s11:
144d : 85 52 __ STA T11 + 0 
144f : a5 44 __ LDA T0 + 1 
1451 : c5 47 __ CMP T2 + 1 
1453 : d0 04 __ BNE $1459 ; (bmu_line.s56 + 0)
.s55:
1455 : a5 43 __ LDA T0 + 0 
1457 : c5 46 __ CMP T2 + 0 
.s56:
1459 : b0 06 __ BCS $1461 ; (bmu_line.s12 + 0)
.s54:
145b : a5 47 __ LDA T2 + 1 
145d : a6 46 __ LDX T2 + 0 
145f : 90 04 __ BCC $1465 ; (bmu_line.s13 + 0)
.s12:
1461 : a5 44 __ LDA T0 + 1 
1463 : a6 43 __ LDX T0 + 0 
.s13:
1465 : 86 49 __ STX T4 + 0 
1467 : 85 4a __ STA T4 + 1 
1469 : 38 __ __ SEC
146a : a5 43 __ LDA T0 + 0 
146c : e5 46 __ SBC T2 + 0 
146e : 85 4b __ STA T5 + 0 
1470 : a5 44 __ LDA T0 + 1 
1472 : e5 47 __ SBC T2 + 1 
1474 : 85 4c __ STA T5 + 1 
1476 : a5 4b __ LDA T5 + 0 
1478 : 4a __ __ LSR
1479 : b0 0c __ BCS $1487 ; (bmu_line.s53 + 0)
.s14:
147b : a5 4c __ LDA T5 + 1 
147d : c9 80 __ CMP #$80
147f : 6a __ __ ROR
1480 : 85 4c __ STA T5 + 1 
1482 : 66 4b __ ROR T5 + 0 
1484 : 4c 8f 14 JMP $148f ; (bmu_line.s15 + 0)
.s53:
1487 : 06 43 __ ASL T0 + 0 
1489 : 26 44 __ ROL T0 + 1 
148b : 06 46 __ ASL T2 + 0 
148d : 26 47 __ ROL T2 + 1 
.s15:
148f : a0 00 __ LDY #$00
1491 : b1 0d __ LDA (P0),y ; (bm + 0)
1493 : 85 4d __ STA T7 + 0 
1495 : c8 __ __ INY
1496 : b1 0d __ LDA (P0),y ; (bm + 0)
1498 : 85 4e __ STA T7 + 1 
149a : a0 04 __ LDY #$04
149c : b1 0d __ LDA (P0),y ; (bm + 0)
149e : aa __ __ TAX
149f : 0a __ __ ASL
14a0 : 85 4f __ STA T8 + 0 
14a2 : a9 a0 __ LDA #$a0
14a4 : 8d 00 1e STA $1e00 ; (BLIT_CODE[0] + 0)
14a7 : a9 a2 __ LDA #$a2
14a9 : 8d 02 1e STA $1e02 ; (BLIT_CODE[0] + 2)
14ac : a9 a5 __ LDA #$a5
14ae : 8d 04 1e STA $1e04 ; (BLIT_CODE[0] + 4)
14b1 : a9 0a __ LDA #$0a
14b3 : 8d 05 1e STA $1e05 ; (BLIT_CODE[0] + 5)
14b6 : a9 00 __ LDA #$00
14b8 : 2a __ __ ROL
14b9 : 06 4f __ ASL T8 + 0 
14bb : 2a __ __ ROL
14bc : 06 4f __ ASL T8 + 0 
14be : 2a __ __ ROL
14bf : 85 50 __ STA T8 + 1 
14c1 : a5 52 __ LDA T11 + 0 
14c3 : f0 0d __ BEQ $14d2 ; (bmu_line.s16 + 0)
.s52:
14c5 : 38 __ __ SEC
14c6 : a9 00 __ LDA #$00
14c8 : e5 4f __ SBC T8 + 0 
14ca : 85 4f __ STA T8 + 0 
14cc : a9 00 __ LDA #$00
14ce : e5 50 __ SBC T8 + 1 
14d0 : 85 50 __ STA T8 + 1 
.s16:
14d2 : a5 11 __ LDA P4 ; (y0 + 0)
14d4 : 29 f8 __ AND #$f8
14d6 : 85 1b __ STA ACCU + 0 
14d8 : a5 12 __ LDA P5 ; (y0 + 1)
14da : 85 1c __ STA ACCU + 1 
14dc : 8a __ __ TXA
14dd : 20 63 19 JSR $1963 ; (mul16by8 + 0)
14e0 : 18 __ __ CLC
14e1 : a5 4d __ LDA T7 + 0 
14e3 : 65 1b __ ADC ACCU + 0 
14e5 : 85 4d __ STA T7 + 0 
14e7 : a5 4e __ LDA T7 + 1 
14e9 : 65 1c __ ADC ACCU + 1 
14eb : aa __ __ TAX
14ec : a5 0f __ LDA P2 ; (x0 + 0)
14ee : 29 f8 __ AND #$f8
14f0 : 18 __ __ CLC
14f1 : 65 4d __ ADC T7 + 0 
14f3 : 85 4d __ STA T7 + 0 
14f5 : 8a __ __ TXA
14f6 : 65 10 __ ADC P3 ; (x0 + 1)
14f8 : 85 4e __ STA T7 + 1 
14fa : a5 46 __ LDA T2 + 0 
14fc : 05 43 __ ORA T0 + 0 
14fe : 29 80 __ AND #$80
1500 : 85 1b __ STA ACCU + 0 
1502 : a5 47 __ LDA T2 + 1 
1504 : 05 44 __ ORA T0 + 1 
1506 : 05 1b __ ORA ACCU + 0 
1508 : f0 02 __ BEQ $150c ; (bmu_line.s67 + 0)
.s66:
150a : a9 01 __ LDA #$01
.s67:
150c : 85 1b __ STA ACCU + 0 
150e : a5 11 __ LDA P4 ; (y0 + 0)
1510 : 29 07 __ AND #$07
1512 : 8d 01 1e STA $1e01 ; (BLIT_CODE[0] + 1)
1515 : a6 49 __ LDX T4 + 0 
1517 : e8 __ __ INX
1518 : 8e 03 1e STX $1e03 ; (BLIT_CODE[0] + 3)
151b : a5 0f __ LDA P2 ; (x0 + 0)
151d : 29 07 __ AND #$07
151f : aa __ __ TAX
1520 : bd 20 1d LDA $1d20,x ; (bitshift[0] + 32)
1523 : 85 48 __ STA T3 + 0 
1525 : a2 06 __ LDX #$06
1527 : 86 45 __ STX T1 + 0 
1529 : a5 18 __ LDA P11 ; (op + 0)
152b : c9 02 __ CMP #$02
152d : d0 03 __ BNE $1532 ; (bmu_line.s17 + 0)
152f : 4c b3 18 JMP $18b3 ; (bmu_line.s49 + 0)
.s17:
1532 : b0 03 __ BCS $1537 ; (bmu_line.s18 + 0)
1534 : 4c 3d 18 JMP $183d ; (bmu_line.s44 + 0)
.s18:
1537 : c9 03 __ CMP #$03
1539 : d0 3d __ BNE $1578 ; (bmu_line.s19 + 0)
.s40:
153b : a6 17 __ LDX P10 ; (pattern + 0)
153d : e8 __ __ INX
153e : f0 1e __ BEQ $155e ; (bmu_line.s41 + 0)
.s43:
1540 : a9 06 __ LDA #$06
1542 : 8d 06 1e STA $1e06 ; (BLIT_CODE[0] + 6)
1545 : 8d 09 1e STA $1e09 ; (BLIT_CODE[0] + 9)
1548 : a9 07 __ LDA #$07
154a : 8d 07 1e STA $1e07 ; (BLIT_CODE[0] + 7)
154d : 8d 0b 1e STA $1e0b ; (BLIT_CODE[0] + 11)
1550 : a9 90 __ LDA #$90
1552 : 8d 08 1e STA $1e08 ; (BLIT_CODE[0] + 8)
1555 : a9 e6 __ LDA #$e6
1557 : 8d 0a 1e STA $1e0a ; (BLIT_CODE[0] + 10)
155a : a9 0c __ LDA #$0c
155c : 85 45 __ STA T1 + 0 
.s41:
155e : a9 51 __ LDA #$51
.s42:
1560 : a6 45 __ LDX T1 + 0 
1562 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
1565 : a9 03 __ LDA #$03
1567 : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
156a : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
156d : a9 91 __ LDA #$91
156f : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
1572 : 8a __ __ TXA
1573 : 18 __ __ CLC
1574 : 69 04 __ ADC #$04
.s64:
1576 : 85 45 __ STA T1 + 0 
.s19:
1578 : a5 43 __ LDA T0 + 0 
157a : 05 44 __ ORA T0 + 1 
157c : f0 03 __ BEQ $1581 ; (bmu_line.s20 + 0)
157e : 4c 56 16 JMP $1656 ; (bmu_line.s28 + 0)
.s20:
1581 : a5 46 __ LDA T2 + 0 
1583 : 05 47 __ ORA T2 + 1 
1585 : f0 75 __ BEQ $15fc ; (bmu_line.s21 + 0)
.s22:
1587 : a9 0a __ LDA #$0a
1589 : a6 45 __ LDX T1 + 0 
158b : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
158e : 9d 05 1e STA $1e05,x ; (BLIT_CODE[0] + 5)
1591 : a9 90 __ LDA #$90
1593 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
1596 : a9 0c __ LDA #$0c
1598 : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
159b : a9 a5 __ LDA #$a5
159d : 9d 06 1e STA $1e06,x ; (BLIT_CODE[0] + 6)
15a0 : a9 03 __ LDA #$03
15a2 : 9d 07 1e STA $1e07,x ; (BLIT_CODE[0] + 7)
15a5 : a9 69 __ LDA #$69
15a7 : 9d 08 1e STA $1e08,x ; (BLIT_CODE[0] + 8)
15aa : a5 51 __ LDA T10 + 0 
15ac : f0 09 __ BEQ $15b7 ; (bmu_line.s23 + 0)
.s27:
15ae : a9 06 __ LDA #$06
15b0 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
15b3 : a9 26 __ LDA #$26
15b5 : d0 07 __ BNE $15be ; (bmu_line.s62 + 0)
.s23:
15b7 : a9 46 __ LDA #$46
15b9 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
15bc : a9 66 __ LDA #$66
.s62:
15be : 9d 04 1e STA $1e04,x ; (BLIT_CODE[0] + 4)
15c1 : a9 02 __ LDA #$02
15c3 : 9d 0b 1e STA $1e0b,x ; (BLIT_CODE[0] + 11)
15c6 : a5 51 __ LDA T10 + 0 
15c8 : f0 0e __ BEQ $15d8 ; (bmu_line.s24 + 0)
.s26:
15ca : a9 f8 __ LDA #$f8
15cc : 9d 09 1e STA $1e09,x ; (BLIT_CODE[0] + 9)
15cf : a9 b0 __ LDA #$b0
15d1 : 9d 0a 1e STA $1e0a,x ; (BLIT_CODE[0] + 10)
15d4 : a9 c6 __ LDA #$c6
15d6 : d0 0c __ BNE $15e4 ; (bmu_line.s25 + 0)
.s24:
15d8 : a9 08 __ LDA #$08
15da : 9d 09 1e STA $1e09,x ; (BLIT_CODE[0] + 9)
15dd : a9 90 __ LDA #$90
15df : 9d 0a 1e STA $1e0a,x ; (BLIT_CODE[0] + 10)
15e2 : a9 e6 __ LDA #$e6
.s25:
15e4 : 9d 0c 1e STA $1e0c,x ; (BLIT_CODE[0] + 12)
15e7 : a9 04 __ LDA #$04
15e9 : 9d 0d 1e STA $1e0d,x ; (BLIT_CODE[0] + 13)
15ec : a9 85 __ LDA #$85
15ee : 9d 0e 1e STA $1e0e,x ; (BLIT_CODE[0] + 14)
15f1 : a9 03 __ LDA #$03
15f3 : 9d 0f 1e STA $1e0f,x ; (BLIT_CODE[0] + 15)
15f6 : 8a __ __ TXA
15f7 : 18 __ __ CLC
15f8 : 69 10 __ ADC #$10
15fa : 85 45 __ STA T1 + 0 
.s21:
15fc : a9 ca __ LDA #$ca
15fe : a6 45 __ LDX T1 + 0 
1600 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
1603 : a9 d0 __ LDA #$d0
1605 : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
1608 : a9 c6 __ LDA #$c6
160a : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
160d : a9 0b __ LDA #$0b
160f : 9d 04 1e STA $1e04,x ; (BLIT_CODE[0] + 4)
1612 : a9 10 __ LDA #$10
1614 : 9d 05 1e STA $1e05,x ; (BLIT_CODE[0] + 5)
1617 : a9 60 __ LDA #$60
1619 : 9d 07 1e STA $1e07,x ; (BLIT_CODE[0] + 7)
161c : e6 45 __ INC T1 + 0 
161e : 38 __ __ SEC
161f : a9 02 __ LDA #$02
1621 : e5 45 __ SBC T1 + 0 
1623 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
1626 : 8a __ __ TXA
1627 : 18 __ __ CLC
1628 : 69 05 __ ADC #$05
162a : 49 ff __ EOR #$ff
162c : 18 __ __ CLC
162d : 69 03 __ ADC #$03
162f : 9d 06 1e STA $1e06,x ; (BLIT_CODE[0] + 6)
1632 : a5 4a __ LDA T4 + 1 
1634 : 85 49 __ STA T4 + 0 
1636 : a5 4d __ LDA T7 + 0 
1638 : 85 03 __ STA WORK + 0 
163a : a5 4e __ LDA T7 + 1 
163c : 85 04 __ STA WORK + 1 
163e : a5 4b __ LDA T5 + 0 
1640 : 85 05 __ STA WORK + 2 
1642 : a5 4c __ LDA T5 + 1 
1644 : 85 06 __ STA WORK + 3 
1646 : a5 49 __ LDA T4 + 0 
1648 : 85 0b __ STA WORK + 8 
164a : a5 48 __ LDA T3 + 0 
164c : 85 0a __ STA WORK + 7 
164e : a5 17 __ LDA P10 ; (pattern + 0)
1650 : 85 07 __ STA WORK + 4 
1652 : 20 00 1e JSR $1e00 ; (BLIT_CODE[0] + 0)
.s3:
1655 : 60 __ __ RTS
.s28:
1656 : a5 46 __ LDA T2 + 0 
1658 : 05 47 __ ORA T2 + 1 
165a : c9 01 __ CMP #$01
165c : a9 00 __ LDA #$00
165e : 6a __ __ ROR
165f : 85 1c __ STA ACCU + 1 
1661 : f0 03 __ BEQ $1666 ; (bmu_line.s29 + 0)
1663 : 4c fd 17 JMP $17fd ; (bmu_line.s35 + 0)
.s29:
1666 : a2 00 __ LDX #$00
1668 : 86 46 __ STX T2 + 0 
166a : 86 47 __ STX T2 + 1 
166c : a5 52 __ LDA T11 + 0 
166e : f0 03 __ BEQ $1673 ; (bmu_line.s30 + 0)
1670 : 4c 93 17 JMP $1793 ; (bmu_line.s34 + 0)
.s30:
1673 : a9 c8 __ LDA #$c8
1675 : a4 45 __ LDY T1 + 0 
1677 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
167a : a9 c0 __ LDA #$c0
167c : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
167f : a9 08 __ LDA #$08
1681 : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1684 : a9 d0 __ LDA #$d0
1686 : 99 03 1e STA $1e03,y ; (BLIT_CODE[0] + 3)
1689 : a9 a0 __ LDA #$a0
168b : 99 05 1e STA $1e05,y ; (BLIT_CODE[0] + 5)
168e : a9 00 __ LDA #$00
1690 : 99 06 1e STA $1e06,y ; (BLIT_CODE[0] + 6)
1693 : a9 a5 __ LDA #$a5
1695 : 99 07 1e STA $1e07,y ; (BLIT_CODE[0] + 7)
1698 : 99 0d 1e STA $1e0d,y ; (BLIT_CODE[0] + 13)
169b : a9 03 __ LDA #$03
169d : 99 08 1e STA $1e08,y ; (BLIT_CODE[0] + 8)
16a0 : 99 0c 1e STA $1e0c,y ; (BLIT_CODE[0] + 12)
16a3 : a9 69 __ LDA #$69
16a5 : 99 09 1e STA $1e09,y ; (BLIT_CODE[0] + 9)
16a8 : 99 0f 1e STA $1e0f,y ; (BLIT_CODE[0] + 15)
16ab : a9 85 __ LDA #$85
16ad : 99 0b 1e STA $1e0b,y ; (BLIT_CODE[0] + 11)
16b0 : 99 11 1e STA $1e11,y ; (BLIT_CODE[0] + 17)
16b3 : a9 04 __ LDA #$04
16b5 : 99 0e 1e STA $1e0e,y ; (BLIT_CODE[0] + 14)
16b8 : 99 12 1e STA $1e12,y ; (BLIT_CODE[0] + 18)
16bb : 8a __ __ TXA
16bc : f0 04 __ BEQ $16c2 ; (bmu_line.s71 + 0)
.s72:
16be : a9 10 __ LDA #$10
16c0 : 90 02 __ BCC $16c4 ; (bmu_line.s73 + 0)
.s71:
16c2 : a9 0e __ LDA #$0e
.s73:
16c4 : 99 04 1e STA $1e04,y ; (BLIT_CODE[0] + 4)
16c7 : 38 __ __ SEC
16c8 : a5 4f __ LDA T8 + 0 
16ca : e9 01 __ SBC #$01
16cc : 99 0a 1e STA $1e0a,y ; (BLIT_CODE[0] + 10)
16cf : a5 50 __ LDA T8 + 1 
16d1 : e9 00 __ SBC #$00
16d3 : 99 10 1e STA $1e10,y ; (BLIT_CODE[0] + 16)
16d6 : 98 __ __ TYA
16d7 : 18 __ __ CLC
16d8 : 69 13 __ ADC #$13
16da : 85 45 __ STA T1 + 0 
16dc : a8 __ __ TAY
16dd : 24 1c __ BIT ACCU + 1 
16df : 30 03 __ BMI $16e4 ; (bmu_line.s31 + 0)
16e1 : 4c 81 15 JMP $1581 ; (bmu_line.s20 + 0)
.s31:
16e4 : a9 a5 __ LDA #$a5
16e6 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
16e9 : a9 05 __ LDA #$05
16eb : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
16ee : 99 06 1e STA $1e06,y ; (BLIT_CODE[0] + 6)
16f1 : a9 38 __ LDA #$38
16f3 : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
16f6 : a9 e9 __ LDA #$e9
16f8 : 99 03 1e STA $1e03,y ; (BLIT_CODE[0] + 3)
16fb : a9 85 __ LDA #$85
16fd : 99 05 1e STA $1e05,y ; (BLIT_CODE[0] + 5)
1700 : a5 46 __ LDA T2 + 0 
1702 : 99 04 1e STA $1e04,y ; (BLIT_CODE[0] + 4)
1705 : a5 1b __ LDA ACCU + 0 
1707 : d0 2a __ BNE $1733 ; (bmu_line.s33 + 0)
.s32:
1709 : a9 10 __ LDA #$10
170b : 99 07 1e STA $1e07,y ; (BLIT_CODE[0] + 7)
170e : a9 15 __ LDA #$15
1710 : 99 08 1e STA $1e08,y ; (BLIT_CODE[0] + 8)
1713 : a9 18 __ LDA #$18
1715 : 99 09 1e STA $1e09,y ; (BLIT_CODE[0] + 9)
1718 : a9 69 __ LDA #$69
171a : 99 0a 1e STA $1e0a,y ; (BLIT_CODE[0] + 10)
171d : a5 43 __ LDA T0 + 0 
171f : 99 0b 1e STA $1e0b,y ; (BLIT_CODE[0] + 11)
1722 : a9 85 __ LDA #$85
1724 : 99 0c 1e STA $1e0c,y ; (BLIT_CODE[0] + 12)
1727 : a9 05 __ LDA #$05
1729 : 99 0d 1e STA $1e0d,y ; (BLIT_CODE[0] + 13)
172c : 98 __ __ TYA
172d : 18 __ __ CLC
172e : 69 0e __ ADC #$0e
1730 : 4c 8e 17 JMP $178e ; (bmu_line.s65 + 0)
.s33:
1733 : a9 a5 __ LDA #$a5
1735 : 99 07 1e STA $1e07,y ; (BLIT_CODE[0] + 7)
1738 : 99 10 1e STA $1e10,y ; (BLIT_CODE[0] + 16)
173b : 99 16 1e STA $1e16,y ; (BLIT_CODE[0] + 22)
173e : a9 06 __ LDA #$06
1740 : 99 08 1e STA $1e08,y ; (BLIT_CODE[0] + 8)
1743 : 99 0c 1e STA $1e0c,y ; (BLIT_CODE[0] + 12)
1746 : 99 17 1e STA $1e17,y ; (BLIT_CODE[0] + 23)
1749 : 99 1b 1e STA $1e1b,y ; (BLIT_CODE[0] + 27)
174c : a9 e9 __ LDA #$e9
174e : 99 09 1e STA $1e09,y ; (BLIT_CODE[0] + 9)
1751 : a9 85 __ LDA #$85
1753 : 99 0b 1e STA $1e0b,y ; (BLIT_CODE[0] + 11)
1756 : 99 14 1e STA $1e14,y ; (BLIT_CODE[0] + 20)
1759 : 99 1a 1e STA $1e1a,y ; (BLIT_CODE[0] + 26)
175c : a9 10 __ LDA #$10
175e : 99 0d 1e STA $1e0d,y ; (BLIT_CODE[0] + 13)
1761 : a9 1d __ LDA #$1d
1763 : 99 0e 1e STA $1e0e,y ; (BLIT_CODE[0] + 14)
1766 : a9 18 __ LDA #$18
1768 : 99 0f 1e STA $1e0f,y ; (BLIT_CODE[0] + 15)
176b : a9 05 __ LDA #$05
176d : 99 11 1e STA $1e11,y ; (BLIT_CODE[0] + 17)
1770 : 99 15 1e STA $1e15,y ; (BLIT_CODE[0] + 21)
1773 : a9 69 __ LDA #$69
1775 : 99 12 1e STA $1e12,y ; (BLIT_CODE[0] + 18)
1778 : 99 18 1e STA $1e18,y ; (BLIT_CODE[0] + 24)
177b : a5 43 __ LDA T0 + 0 
177d : 99 13 1e STA $1e13,y ; (BLIT_CODE[0] + 19)
1780 : a5 47 __ LDA T2 + 1 
1782 : 99 0a 1e STA $1e0a,y ; (BLIT_CODE[0] + 10)
1785 : a5 44 __ LDA T0 + 1 
1787 : 99 19 1e STA $1e19,y ; (BLIT_CODE[0] + 25)
178a : 98 __ __ TYA
178b : 18 __ __ CLC
178c : 69 1c __ ADC #$1c
.s65:
178e : 85 45 __ STA T1 + 0 
1790 : 4c 87 15 JMP $1587 ; (bmu_line.s22 + 0)
.s34:
1793 : a9 88 __ LDA #$88
1795 : a4 45 __ LDY T1 + 0 
1797 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
179a : a9 10 __ LDA #$10
179c : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
179f : a9 18 __ LDA #$18
17a1 : 99 03 1e STA $1e03,y ; (BLIT_CODE[0] + 3)
17a4 : a9 a0 __ LDA #$a0
17a6 : 99 04 1e STA $1e04,y ; (BLIT_CODE[0] + 4)
17a9 : a9 07 __ LDA #$07
17ab : 99 05 1e STA $1e05,y ; (BLIT_CODE[0] + 5)
17ae : a9 a5 __ LDA #$a5
17b0 : 99 06 1e STA $1e06,y ; (BLIT_CODE[0] + 6)
17b3 : 99 0c 1e STA $1e0c,y ; (BLIT_CODE[0] + 12)
17b6 : a9 03 __ LDA #$03
17b8 : 99 07 1e STA $1e07,y ; (BLIT_CODE[0] + 7)
17bb : 99 0b 1e STA $1e0b,y ; (BLIT_CODE[0] + 11)
17be : a9 69 __ LDA #$69
17c0 : 99 08 1e STA $1e08,y ; (BLIT_CODE[0] + 8)
17c3 : 99 0e 1e STA $1e0e,y ; (BLIT_CODE[0] + 14)
17c6 : a9 85 __ LDA #$85
17c8 : 99 0a 1e STA $1e0a,y ; (BLIT_CODE[0] + 10)
17cb : 99 10 1e STA $1e10,y ; (BLIT_CODE[0] + 16)
17ce : a9 04 __ LDA #$04
17d0 : 99 0d 1e STA $1e0d,y ; (BLIT_CODE[0] + 13)
17d3 : 99 11 1e STA $1e11,y ; (BLIT_CODE[0] + 17)
17d6 : 8a __ __ TXA
17d7 : f0 04 __ BEQ $17dd ; (bmu_line.s68 + 0)
.s69:
17d9 : a9 11 __ LDA #$11
17db : 90 02 __ BCC $17df ; (bmu_line.s70 + 0)
.s68:
17dd : a9 0f __ LDA #$0f
.s70:
17df : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
17e2 : a5 4f __ LDA T8 + 0 
17e4 : 99 09 1e STA $1e09,y ; (BLIT_CODE[0] + 9)
17e7 : a5 50 __ LDA T8 + 1 
17e9 : 99 0f 1e STA $1e0f,y ; (BLIT_CODE[0] + 15)
17ec : 98 __ __ TYA
17ed : 18 __ __ CLC
17ee : 69 12 __ ADC #$12
17f0 : 85 45 __ STA T1 + 0 
17f2 : a8 __ __ TAY
17f3 : 24 1c __ BIT ACCU + 1 
17f5 : 10 03 __ BPL $17fa ; (bmu_line.s70 + 27)
17f7 : 4c e4 16 JMP $16e4 ; (bmu_line.s31 + 0)
17fa : 4c 81 15 JMP $1581 ; (bmu_line.s20 + 0)
.s35:
17fd : a9 a5 __ LDA #$a5
17ff : a6 45 __ LDX T1 + 0 
1801 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
1804 : a9 30 __ LDA #$30
1806 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
1809 : a5 1b __ LDA ACCU + 0 
180b : 69 05 __ ADC #$05
180d : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
1810 : a5 1b __ LDA ACCU + 0 
1812 : d0 21 __ BNE $1835 ; (bmu_line.s39 + 0)
.s36:
1814 : a0 1b __ LDY #$1b
1816 : a5 52 __ LDA T11 + 0 
1818 : d0 01 __ BNE $181b ; (bmu_line.s38 + 0)
.s37:
181a : c8 __ __ INY
.s38:
181b : 98 __ __ TYA
181c : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
181f : 8a __ __ TXA
1820 : 18 __ __ CLC
1821 : 69 04 __ ADC #$04
1823 : 85 45 __ STA T1 + 0 
1825 : a9 00 __ LDA #$00
1827 : c5 1b __ CMP ACCU + 0 
1829 : 2a __ __ ROL
182a : aa __ __ TAX
182b : a5 52 __ LDA T11 + 0 
182d : f0 03 __ BEQ $1832 ; (bmu_line.s38 + 23)
182f : 4c 93 17 JMP $1793 ; (bmu_line.s34 + 0)
1832 : 4c 73 16 JMP $1673 ; (bmu_line.s30 + 0)
.s39:
1835 : a0 21 __ LDY #$21
1837 : a5 52 __ LDA T11 + 0 
1839 : d0 e0 __ BNE $181b ; (bmu_line.s38 + 0)
183b : f0 dd __ BEQ $181a ; (bmu_line.s37 + 0)
.s44:
183d : a8 __ __ TAY
183e : d0 4b __ BNE $188b ; (bmu_line.s46 + 0)
.s45:
1840 : 8e 06 1e STX $1e06 ; (BLIT_CODE[0] + 6)
1843 : 8e 09 1e STX $1e09 ; (BLIT_CODE[0] + 9)
1846 : a9 07 __ LDA #$07
1848 : 8d 07 1e STA $1e07 ; (BLIT_CODE[0] + 7)
184b : 8d 0b 1e STA $1e0b ; (BLIT_CODE[0] + 11)
184e : a9 03 __ LDA #$03
1850 : 8d 0d 1e STA $1e0d ; (BLIT_CODE[0] + 13)
1853 : 8d 13 1e STA $1e13 ; (BLIT_CODE[0] + 19)
1856 : 8d 15 1e STA $1e15 ; (BLIT_CODE[0] + 21)
1859 : a9 90 __ LDA #$90
185b : 8d 08 1e STA $1e08 ; (BLIT_CODE[0] + 8)
185e : a9 e6 __ LDA #$e6
1860 : 8d 0a 1e STA $1e0a ; (BLIT_CODE[0] + 10)
1863 : a9 11 __ LDA #$11
1865 : 8d 0c 1e STA $1e0c ; (BLIT_CODE[0] + 12)
1868 : a9 d0 __ LDA #$d0
186a : 8d 0e 1e STA $1e0e ; (BLIT_CODE[0] + 14)
186d : a9 04 __ LDA #$04
186f : 8d 0f 1e STA $1e0f ; (BLIT_CODE[0] + 15)
1872 : a9 49 __ LDA #$49
1874 : 8d 10 1e STA $1e10 ; (BLIT_CODE[0] + 16)
1877 : a9 ff __ LDA #$ff
1879 : 8d 11 1e STA $1e11 ; (BLIT_CODE[0] + 17)
187c : a9 31 __ LDA #$31
187e : 8d 12 1e STA $1e12 ; (BLIT_CODE[0] + 18)
1881 : a9 91 __ LDA #$91
1883 : 8d 14 1e STA $1e14 ; (BLIT_CODE[0] + 20)
1886 : a9 16 __ LDA #$16
1888 : 4c 76 15 JMP $1576 ; (bmu_line.s64 + 0)
.s46:
188b : a6 17 __ LDX P10 ; (pattern + 0)
188d : e8 __ __ INX
188e : f0 1e __ BEQ $18ae ; (bmu_line.s47 + 0)
.s48:
1890 : a9 06 __ LDA #$06
1892 : 8d 06 1e STA $1e06 ; (BLIT_CODE[0] + 6)
1895 : 8d 09 1e STA $1e09 ; (BLIT_CODE[0] + 9)
1898 : a9 07 __ LDA #$07
189a : 8d 07 1e STA $1e07 ; (BLIT_CODE[0] + 7)
189d : 8d 0b 1e STA $1e0b ; (BLIT_CODE[0] + 11)
18a0 : a9 90 __ LDA #$90
18a2 : 8d 08 1e STA $1e08 ; (BLIT_CODE[0] + 8)
18a5 : a9 e6 __ LDA #$e6
18a7 : 8d 0a 1e STA $1e0a ; (BLIT_CODE[0] + 10)
18aa : a9 0c __ LDA #$0c
18ac : 85 45 __ STA T1 + 0 
.s47:
18ae : a9 11 __ LDA #$11
18b0 : 4c 60 15 JMP $1560 ; (bmu_line.s42 + 0)
.s49:
18b3 : a4 17 __ LDY P10 ; (pattern + 0)
18b5 : c8 __ __ INY
18b6 : f0 1e __ BEQ $18d6 ; (bmu_line.s50 + 0)
.s51:
18b8 : 8e 06 1e STX $1e06 ; (BLIT_CODE[0] + 6)
18bb : a9 07 __ LDA #$07
18bd : 8d 07 1e STA $1e07 ; (BLIT_CODE[0] + 7)
18c0 : 8d 0b 1e STA $1e0b ; (BLIT_CODE[0] + 11)
18c3 : a9 90 __ LDA #$90
18c5 : 8d 08 1e STA $1e08 ; (BLIT_CODE[0] + 8)
18c8 : a9 08 __ LDA #$08
18ca : 8d 09 1e STA $1e09 ; (BLIT_CODE[0] + 9)
18cd : a9 e6 __ LDA #$e6
18cf : 8d 0a 1e STA $1e0a ; (BLIT_CODE[0] + 10)
18d2 : a9 0c __ LDA #$0c
18d4 : 85 45 __ STA T1 + 0 
.s50:
18d6 : a9 49 __ LDA #$49
18d8 : a6 45 __ LDX T1 + 0 
18da : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
18dd : a9 ff __ LDA #$ff
18df : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
18e2 : a9 31 __ LDA #$31
18e4 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
18e7 : a9 03 __ LDA #$03
18e9 : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
18ec : 9d 05 1e STA $1e05,x ; (BLIT_CODE[0] + 5)
18ef : a9 91 __ LDA #$91
18f1 : 9d 04 1e STA $1e04,x ; (BLIT_CODE[0] + 4)
18f4 : 8a __ __ TXA
18f5 : 18 __ __ CLC
18f6 : 69 06 __ ADC #$06
18f8 : 4c 76 15 JMP $1576 ; (bmu_line.s64 + 0)
.s59:
18fb : c9 ff __ CMP #$ff
18fd : f0 03 __ BEQ $1902 ; (bmu_line.s60 + 0)
18ff : 4c 07 14 JMP $1407 ; (bmu_line.s7 + 0)
.s60:
1902 : a5 18 __ LDA P11 ; (op + 0)
1904 : d0 f9 __ BNE $18ff ; (bmu_line.s59 + 4)
.s61:
1906 : a9 01 __ LDA #$01
1908 : 4c 05 14 JMP $1405 ; (bmu_line.s63 + 0)
--------------------------------------------------------------------
done: ; done()->void
;  32, "/home/honza/projects/c64/projects/oscar64/samples/hires/fractaltree.c"
.s4:
190b : a9 37 __ LDA #$37
190d : 85 01 __ STA $01 
190f : 20 25 19 JSR $1925 ; (getch.l4 + 0)
1912 : a9 00 __ LDA #$00
1914 : 85 0d __ STA P0 
1916 : 85 0e __ STA P1 
1918 : 85 10 __ STA P3 
191a : a9 04 __ LDA #$04
191c : 85 0f __ STA P2 
191e : a9 10 __ LDA #$10
1920 : 85 11 __ STA P4 
1922 : 4c c9 09 JMP $09c9 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
1925 : 20 e4 ff JSR $ffe4 
1928 : 85 1b __ STA ACCU + 0 
192a : a5 1b __ LDA ACCU + 0 
192c : f0 f7 __ BEQ $1925 ; (getch.l4 + 0)
.s5:
192e : 4c 31 19 JMP $1931 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
1931 : a8 __ __ TAY
1932 : ad e4 1c LDA $1ce4 ; (giocharmap + 0)
1935 : f0 27 __ BEQ $195e ; (convch.s5 + 0)
.s6:
1937 : c0 0d __ CPY #$0d
1939 : d0 03 __ BNE $193e ; (convch.s7 + 0)
.s16:
193b : a9 0a __ LDA #$0a
.s3:
193d : 60 __ __ RTS
.s7:
193e : c9 02 __ CMP #$02
1940 : 90 1c __ BCC $195e ; (convch.s5 + 0)
.s8:
1942 : 98 __ __ TYA
1943 : c0 41 __ CPY #$41
1945 : 90 17 __ BCC $195e ; (convch.s5 + 0)
.s9:
1947 : c9 db __ CMP #$db
1949 : b0 13 __ BCS $195e ; (convch.s5 + 0)
.s10:
194b : c9 c1 __ CMP #$c1
194d : 90 03 __ BCC $1952 ; (convch.s11 + 0)
.s15:
194f : 49 a0 __ EOR #$a0
1951 : a8 __ __ TAY
.s11:
1952 : c9 7b __ CMP #$7b
1954 : b0 08 __ BCS $195e ; (convch.s5 + 0)
.s12:
1956 : c9 61 __ CMP #$61
1958 : b0 06 __ BCS $1960 ; (convch.s14 + 0)
.s13:
195a : c9 5b __ CMP #$5b
195c : 90 02 __ BCC $1960 ; (convch.s14 + 0)
.s5:
195e : 98 __ __ TYA
195f : 60 __ __ RTS
.s14:
1960 : 49 20 __ EOR #$20
1962 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
1963 : 4a __ __ LSR
1964 : f0 2e __ BEQ $1994 ; (mul16by8 + 49)
1966 : a2 00 __ LDX #$00
1968 : a0 00 __ LDY #$00
196a : 90 13 __ BCC $197f ; (mul16by8 + 28)
196c : a4 1b __ LDY ACCU + 0 
196e : a6 1c __ LDX ACCU + 1 
1970 : b0 0d __ BCS $197f ; (mul16by8 + 28)
1972 : 85 02 __ STA $02 
1974 : 18 __ __ CLC
1975 : 98 __ __ TYA
1976 : 65 1b __ ADC ACCU + 0 
1978 : a8 __ __ TAY
1979 : 8a __ __ TXA
197a : 65 1c __ ADC ACCU + 1 
197c : aa __ __ TAX
197d : a5 02 __ LDA $02 
197f : 06 1b __ ASL ACCU + 0 
1981 : 26 1c __ ROL ACCU + 1 
1983 : 4a __ __ LSR
1984 : 90 f9 __ BCC $197f ; (mul16by8 + 28)
1986 : d0 ea __ BNE $1972 ; (mul16by8 + 15)
1988 : 18 __ __ CLC
1989 : 98 __ __ TYA
198a : 65 1b __ ADC ACCU + 0 
198c : 85 1b __ STA ACCU + 0 
198e : 8a __ __ TXA
198f : 65 1c __ ADC ACCU + 1 
1991 : 85 1c __ STA ACCU + 1 
1993 : 60 __ __ RTS
1994 : b0 04 __ BCS $199a ; (mul16by8 + 55)
1996 : 85 1b __ STA ACCU + 0 
1998 : 85 1c __ STA ACCU + 1 
199a : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
199b : b1 19 __ LDA (IP + 0),y 
199d : c8 __ __ INY
199e : aa __ __ TAX
199f : b5 00 __ LDA $00,x 
19a1 : 85 03 __ STA WORK + 0 
19a3 : b5 01 __ LDA $01,x 
19a5 : 85 04 __ STA WORK + 1 
19a7 : b5 02 __ LDA $02,x 
19a9 : 85 05 __ STA WORK + 2 
19ab : b5 03 __ LDA WORK + 0,x 
19ad : 85 06 __ STA WORK + 3 
19af : a5 05 __ LDA WORK + 2 
19b1 : 0a __ __ ASL
19b2 : a5 06 __ LDA WORK + 3 
19b4 : 2a __ __ ROL
19b5 : 85 08 __ STA WORK + 5 
19b7 : f0 06 __ BEQ $19bf ; (freg + 36)
19b9 : a5 05 __ LDA WORK + 2 
19bb : 09 80 __ ORA #$80
19bd : 85 05 __ STA WORK + 2 
19bf : a5 1d __ LDA ACCU + 2 
19c1 : 0a __ __ ASL
19c2 : a5 1e __ LDA ACCU + 3 
19c4 : 2a __ __ ROL
19c5 : 85 07 __ STA WORK + 4 
19c7 : f0 06 __ BEQ $19cf ; (freg + 52)
19c9 : a5 1d __ LDA ACCU + 2 
19cb : 09 80 __ ORA #$80
19cd : 85 1d __ STA ACCU + 2 
19cf : 60 __ __ RTS
19d0 : 06 1e __ ASL ACCU + 3 
19d2 : a5 07 __ LDA WORK + 4 
19d4 : 6a __ __ ROR
19d5 : 85 1e __ STA ACCU + 3 
19d7 : b0 06 __ BCS $19df ; (freg + 68)
19d9 : a5 1d __ LDA ACCU + 2 
19db : 29 7f __ AND #$7f
19dd : 85 1d __ STA ACCU + 2 
19df : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
19e0 : a5 06 __ LDA WORK + 3 
19e2 : 49 80 __ EOR #$80
19e4 : 85 06 __ STA WORK + 3 
19e6 : a9 ff __ LDA #$ff
19e8 : c5 07 __ CMP WORK + 4 
19ea : f0 04 __ BEQ $19f0 ; (faddsub + 16)
19ec : c5 08 __ CMP WORK + 5 
19ee : d0 11 __ BNE $1a01 ; (faddsub + 33)
19f0 : a5 1e __ LDA ACCU + 3 
19f2 : 09 7f __ ORA #$7f
19f4 : 85 1e __ STA ACCU + 3 
19f6 : a9 80 __ LDA #$80
19f8 : 85 1d __ STA ACCU + 2 
19fa : a9 00 __ LDA #$00
19fc : 85 1b __ STA ACCU + 0 
19fe : 85 1c __ STA ACCU + 1 
1a00 : 60 __ __ RTS
1a01 : 38 __ __ SEC
1a02 : a5 07 __ LDA WORK + 4 
1a04 : e5 08 __ SBC WORK + 5 
1a06 : f0 38 __ BEQ $1a40 ; (faddsub + 96)
1a08 : aa __ __ TAX
1a09 : b0 25 __ BCS $1a30 ; (faddsub + 80)
1a0b : e0 e9 __ CPX #$e9
1a0d : b0 0e __ BCS $1a1d ; (faddsub + 61)
1a0f : a5 08 __ LDA WORK + 5 
1a11 : 85 07 __ STA WORK + 4 
1a13 : a9 00 __ LDA #$00
1a15 : 85 1b __ STA ACCU + 0 
1a17 : 85 1c __ STA ACCU + 1 
1a19 : 85 1d __ STA ACCU + 2 
1a1b : f0 23 __ BEQ $1a40 ; (faddsub + 96)
1a1d : a5 1d __ LDA ACCU + 2 
1a1f : 4a __ __ LSR
1a20 : 66 1c __ ROR ACCU + 1 
1a22 : 66 1b __ ROR ACCU + 0 
1a24 : e8 __ __ INX
1a25 : d0 f8 __ BNE $1a1f ; (faddsub + 63)
1a27 : 85 1d __ STA ACCU + 2 
1a29 : a5 08 __ LDA WORK + 5 
1a2b : 85 07 __ STA WORK + 4 
1a2d : 4c 40 1a JMP $1a40 ; (faddsub + 96)
1a30 : e0 18 __ CPX #$18
1a32 : b0 33 __ BCS $1a67 ; (faddsub + 135)
1a34 : a5 05 __ LDA WORK + 2 
1a36 : 4a __ __ LSR
1a37 : 66 04 __ ROR WORK + 1 
1a39 : 66 03 __ ROR WORK + 0 
1a3b : ca __ __ DEX
1a3c : d0 f8 __ BNE $1a36 ; (faddsub + 86)
1a3e : 85 05 __ STA WORK + 2 
1a40 : a5 1e __ LDA ACCU + 3 
1a42 : 29 80 __ AND #$80
1a44 : 85 1e __ STA ACCU + 3 
1a46 : 45 06 __ EOR WORK + 3 
1a48 : 30 31 __ BMI $1a7b ; (faddsub + 155)
1a4a : 18 __ __ CLC
1a4b : a5 1b __ LDA ACCU + 0 
1a4d : 65 03 __ ADC WORK + 0 
1a4f : 85 1b __ STA ACCU + 0 
1a51 : a5 1c __ LDA ACCU + 1 
1a53 : 65 04 __ ADC WORK + 1 
1a55 : 85 1c __ STA ACCU + 1 
1a57 : a5 1d __ LDA ACCU + 2 
1a59 : 65 05 __ ADC WORK + 2 
1a5b : 85 1d __ STA ACCU + 2 
1a5d : 90 08 __ BCC $1a67 ; (faddsub + 135)
1a5f : 66 1d __ ROR ACCU + 2 
1a61 : 66 1c __ ROR ACCU + 1 
1a63 : 66 1b __ ROR ACCU + 0 
1a65 : e6 07 __ INC WORK + 4 
1a67 : a5 07 __ LDA WORK + 4 
1a69 : c9 ff __ CMP #$ff
1a6b : f0 83 __ BEQ $19f0 ; (faddsub + 16)
1a6d : 4a __ __ LSR
1a6e : 05 1e __ ORA ACCU + 3 
1a70 : 85 1e __ STA ACCU + 3 
1a72 : b0 06 __ BCS $1a7a ; (faddsub + 154)
1a74 : a5 1d __ LDA ACCU + 2 
1a76 : 29 7f __ AND #$7f
1a78 : 85 1d __ STA ACCU + 2 
1a7a : 60 __ __ RTS
1a7b : 38 __ __ SEC
1a7c : a5 1b __ LDA ACCU + 0 
1a7e : e5 03 __ SBC WORK + 0 
1a80 : 85 1b __ STA ACCU + 0 
1a82 : a5 1c __ LDA ACCU + 1 
1a84 : e5 04 __ SBC WORK + 1 
1a86 : 85 1c __ STA ACCU + 1 
1a88 : a5 1d __ LDA ACCU + 2 
1a8a : e5 05 __ SBC WORK + 2 
1a8c : 85 1d __ STA ACCU + 2 
1a8e : b0 19 __ BCS $1aa9 ; (faddsub + 201)
1a90 : 38 __ __ SEC
1a91 : a9 00 __ LDA #$00
1a93 : e5 1b __ SBC ACCU + 0 
1a95 : 85 1b __ STA ACCU + 0 
1a97 : a9 00 __ LDA #$00
1a99 : e5 1c __ SBC ACCU + 1 
1a9b : 85 1c __ STA ACCU + 1 
1a9d : a9 00 __ LDA #$00
1a9f : e5 1d __ SBC ACCU + 2 
1aa1 : 85 1d __ STA ACCU + 2 
1aa3 : a5 1e __ LDA ACCU + 3 
1aa5 : 49 80 __ EOR #$80
1aa7 : 85 1e __ STA ACCU + 3 
1aa9 : a5 1d __ LDA ACCU + 2 
1aab : 30 ba __ BMI $1a67 ; (faddsub + 135)
1aad : 05 1c __ ORA ACCU + 1 
1aaf : 05 1b __ ORA ACCU + 0 
1ab1 : f0 0f __ BEQ $1ac2 ; (faddsub + 226)
1ab3 : c6 07 __ DEC WORK + 4 
1ab5 : f0 0b __ BEQ $1ac2 ; (faddsub + 226)
1ab7 : 06 1b __ ASL ACCU + 0 
1ab9 : 26 1c __ ROL ACCU + 1 
1abb : 26 1d __ ROL ACCU + 2 
1abd : 10 f4 __ BPL $1ab3 ; (faddsub + 211)
1abf : 4c 67 1a JMP $1a67 ; (faddsub + 135)
1ac2 : a9 00 __ LDA #$00
1ac4 : 85 1b __ STA ACCU + 0 
1ac6 : 85 1c __ STA ACCU + 1 
1ac8 : 85 1d __ STA ACCU + 2 
1aca : 85 1e __ STA ACCU + 3 
1acc : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1acd : a5 1b __ LDA ACCU + 0 
1acf : 05 1c __ ORA ACCU + 1 
1ad1 : 05 1d __ ORA ACCU + 2 
1ad3 : f0 0e __ BEQ $1ae3 ; (crt_fmul + 22)
1ad5 : a5 03 __ LDA WORK + 0 
1ad7 : 05 04 __ ORA WORK + 1 
1ad9 : 05 05 __ ORA WORK + 2 
1adb : d0 09 __ BNE $1ae6 ; (crt_fmul + 25)
1add : 85 1b __ STA ACCU + 0 
1adf : 85 1c __ STA ACCU + 1 
1ae1 : 85 1d __ STA ACCU + 2 
1ae3 : 85 1e __ STA ACCU + 3 
1ae5 : 60 __ __ RTS
1ae6 : a5 1e __ LDA ACCU + 3 
1ae8 : 45 06 __ EOR WORK + 3 
1aea : 29 80 __ AND #$80
1aec : 85 1e __ STA ACCU + 3 
1aee : a9 ff __ LDA #$ff
1af0 : c5 07 __ CMP WORK + 4 
1af2 : f0 42 __ BEQ $1b36 ; (crt_fmul + 105)
1af4 : c5 08 __ CMP WORK + 5 
1af6 : f0 3e __ BEQ $1b36 ; (crt_fmul + 105)
1af8 : a9 00 __ LDA #$00
1afa : 85 09 __ STA WORK + 6 
1afc : 85 0a __ STA WORK + 7 
1afe : 85 0b __ STA WORK + 8 
1b00 : a4 1b __ LDY ACCU + 0 
1b02 : a5 03 __ LDA WORK + 0 
1b04 : d0 06 __ BNE $1b0c ; (crt_fmul + 63)
1b06 : a5 04 __ LDA WORK + 1 
1b08 : f0 0a __ BEQ $1b14 ; (crt_fmul + 71)
1b0a : d0 05 __ BNE $1b11 ; (crt_fmul + 68)
1b0c : 20 67 1b JSR $1b67 ; (crt_fmul8 + 0)
1b0f : a5 04 __ LDA WORK + 1 
1b11 : 20 67 1b JSR $1b67 ; (crt_fmul8 + 0)
1b14 : a5 05 __ LDA WORK + 2 
1b16 : 20 67 1b JSR $1b67 ; (crt_fmul8 + 0)
1b19 : 38 __ __ SEC
1b1a : a5 0b __ LDA WORK + 8 
1b1c : 30 06 __ BMI $1b24 ; (crt_fmul + 87)
1b1e : 06 09 __ ASL WORK + 6 
1b20 : 26 0a __ ROL WORK + 7 
1b22 : 2a __ __ ROL
1b23 : 18 __ __ CLC
1b24 : 29 7f __ AND #$7f
1b26 : 85 0b __ STA WORK + 8 
1b28 : a5 07 __ LDA WORK + 4 
1b2a : 65 08 __ ADC WORK + 5 
1b2c : 90 19 __ BCC $1b47 ; (crt_fmul + 122)
1b2e : e9 7f __ SBC #$7f
1b30 : b0 04 __ BCS $1b36 ; (crt_fmul + 105)
1b32 : c9 ff __ CMP #$ff
1b34 : d0 15 __ BNE $1b4b ; (crt_fmul + 126)
1b36 : a5 1e __ LDA ACCU + 3 
1b38 : 09 7f __ ORA #$7f
1b3a : 85 1e __ STA ACCU + 3 
1b3c : a9 80 __ LDA #$80
1b3e : 85 1d __ STA ACCU + 2 
1b40 : a9 00 __ LDA #$00
1b42 : 85 1b __ STA ACCU + 0 
1b44 : 85 1c __ STA ACCU + 1 
1b46 : 60 __ __ RTS
1b47 : e9 7e __ SBC #$7e
1b49 : 90 15 __ BCC $1b60 ; (crt_fmul + 147)
1b4b : 4a __ __ LSR
1b4c : 05 1e __ ORA ACCU + 3 
1b4e : 85 1e __ STA ACCU + 3 
1b50 : a9 00 __ LDA #$00
1b52 : 6a __ __ ROR
1b53 : 05 0b __ ORA WORK + 8 
1b55 : 85 1d __ STA ACCU + 2 
1b57 : a5 0a __ LDA WORK + 7 
1b59 : 85 1c __ STA ACCU + 1 
1b5b : a5 09 __ LDA WORK + 6 
1b5d : 85 1b __ STA ACCU + 0 
1b5f : 60 __ __ RTS
1b60 : a9 00 __ LDA #$00
1b62 : 85 1e __ STA ACCU + 3 
1b64 : f0 d8 __ BEQ $1b3e ; (crt_fmul + 113)
1b66 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1b67 : 38 __ __ SEC
1b68 : 6a __ __ ROR
1b69 : 90 1e __ BCC $1b89 ; (crt_fmul8 + 34)
1b6b : aa __ __ TAX
1b6c : 18 __ __ CLC
1b6d : 98 __ __ TYA
1b6e : 65 09 __ ADC WORK + 6 
1b70 : 85 09 __ STA WORK + 6 
1b72 : a5 0a __ LDA WORK + 7 
1b74 : 65 1c __ ADC ACCU + 1 
1b76 : 85 0a __ STA WORK + 7 
1b78 : a5 0b __ LDA WORK + 8 
1b7a : 65 1d __ ADC ACCU + 2 
1b7c : 6a __ __ ROR
1b7d : 85 0b __ STA WORK + 8 
1b7f : 8a __ __ TXA
1b80 : 66 0a __ ROR WORK + 7 
1b82 : 66 09 __ ROR WORK + 6 
1b84 : 4a __ __ LSR
1b85 : f0 0d __ BEQ $1b94 ; (crt_fmul8 + 45)
1b87 : b0 e2 __ BCS $1b6b ; (crt_fmul8 + 4)
1b89 : 66 0b __ ROR WORK + 8 
1b8b : 66 0a __ ROR WORK + 7 
1b8d : 66 09 __ ROR WORK + 6 
1b8f : 4a __ __ LSR
1b90 : 90 f7 __ BCC $1b89 ; (crt_fmul8 + 34)
1b92 : d0 d7 __ BNE $1b6b ; (crt_fmul8 + 4)
1b94 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
1b95 : 24 1e __ BIT ACCU + 3 
1b97 : 10 13 __ BPL $1bac ; (fround + 23)
1b99 : 30 6b __ BMI $1c06 ; (fround + 113)
1b9b : 24 1e __ BIT ACCU + 3 
1b9d : 30 0d __ BMI $1bac ; (fround + 23)
1b9f : 10 65 __ BPL $1c06 ; (fround + 113)
1ba1 : a9 00 __ LDA #$00
1ba3 : 85 1b __ STA ACCU + 0 
1ba5 : 85 1c __ STA ACCU + 1 
1ba7 : 85 1d __ STA ACCU + 2 
1ba9 : 85 1e __ STA ACCU + 3 
1bab : 60 __ __ RTS
1bac : a5 07 __ LDA WORK + 4 
1bae : c9 7f __ CMP #$7f
1bb0 : 90 ef __ BCC $1ba1 ; (fround + 12)
1bb2 : c9 87 __ CMP #$87
1bb4 : 90 16 __ BCC $1bcc ; (fround + 55)
1bb6 : c9 8f __ CMP #$8f
1bb8 : 90 26 __ BCC $1be0 ; (fround + 75)
1bba : c9 97 __ CMP #$97
1bbc : b0 34 __ BCS $1bf2 ; (fround + 93)
1bbe : 38 __ __ SEC
1bbf : e9 8f __ SBC #$8f
1bc1 : aa __ __ TAX
1bc2 : a5 1b __ LDA ACCU + 0 
1bc4 : 3d e5 1c AND $1ce5,x ; (ubitmask[0] + 0)
1bc7 : 85 1b __ STA ACCU + 0 
1bc9 : 4c f2 1b JMP $1bf2 ; (fround + 93)
1bcc : 38 __ __ SEC
1bcd : e9 7f __ SBC #$7f
1bcf : aa __ __ TAX
1bd0 : a5 1d __ LDA ACCU + 2 
1bd2 : 3d e5 1c AND $1ce5,x ; (ubitmask[0] + 0)
1bd5 : 85 1d __ STA ACCU + 2 
1bd7 : a9 00 __ LDA #$00
1bd9 : 85 1b __ STA ACCU + 0 
1bdb : 85 1c __ STA ACCU + 1 
1bdd : 4c f2 1b JMP $1bf2 ; (fround + 93)
1be0 : 38 __ __ SEC
1be1 : e9 87 __ SBC #$87
1be3 : aa __ __ TAX
1be4 : a5 1c __ LDA ACCU + 1 
1be6 : 3d e5 1c AND $1ce5,x ; (ubitmask[0] + 0)
1be9 : 85 1c __ STA ACCU + 1 
1beb : a9 00 __ LDA #$00
1bed : 85 1b __ STA ACCU + 0 
1bef : 4c f2 1b JMP $1bf2 ; (fround + 93)
1bf2 : 4c d0 19 JMP $19d0 ; (freg + 53)
1bf5 : a9 7f __ LDA #$7f
1bf7 : 85 07 __ STA WORK + 4 
1bf9 : a9 00 __ LDA #$00
1bfb : 85 1b __ STA ACCU + 0 
1bfd : 85 1c __ STA ACCU + 1 
1bff : a9 80 __ LDA #$80
1c01 : 85 1d __ STA ACCU + 2 
1c03 : 4c d0 19 JMP $19d0 ; (freg + 53)
1c06 : a5 1b __ LDA ACCU + 0 
1c08 : 05 1c __ ORA ACCU + 1 
1c0a : 05 1d __ ORA ACCU + 2 
1c0c : f0 93 __ BEQ $1ba1 ; (fround + 12)
1c0e : a5 07 __ LDA WORK + 4 
1c10 : c9 7f __ CMP #$7f
1c12 : 90 e1 __ BCC $1bf5 ; (fround + 96)
1c14 : c9 87 __ CMP #$87
1c16 : 90 2e __ BCC $1c46 ; (fround + 177)
1c18 : c9 8f __ CMP #$8f
1c1a : 90 4c __ BCC $1c68 ; (fround + 211)
1c1c : c9 97 __ CMP #$97
1c1e : b0 6c __ BCS $1c8c ; (fround + 247)
1c20 : 38 __ __ SEC
1c21 : e9 8f __ SBC #$8f
1c23 : aa __ __ TAX
1c24 : 18 __ __ CLC
1c25 : bd e5 1c LDA $1ce5,x ; (ubitmask[0] + 0)
1c28 : 49 ff __ EOR #$ff
1c2a : 65 1b __ ADC ACCU + 0 
1c2c : 85 1b __ STA ACCU + 0 
1c2e : a9 00 __ LDA #$00
1c30 : 65 1c __ ADC ACCU + 1 
1c32 : 85 1c __ STA ACCU + 1 
1c34 : a9 00 __ LDA #$00
1c36 : 65 1d __ ADC ACCU + 2 
1c38 : 90 07 __ BCC $1c41 ; (fround + 172)
1c3a : 6a __ __ ROR
1c3b : 66 1c __ ROR ACCU + 1 
1c3d : 66 1b __ ROR ACCU + 0 
1c3f : e6 07 __ INC WORK + 4 
1c41 : 85 1d __ STA ACCU + 2 
1c43 : 4c ac 1b JMP $1bac ; (fround + 23)
1c46 : 38 __ __ SEC
1c47 : e9 7f __ SBC #$7f
1c49 : aa __ __ TAX
1c4a : 18 __ __ CLC
1c4b : a9 ff __ LDA #$ff
1c4d : 65 1b __ ADC ACCU + 0 
1c4f : a9 ff __ LDA #$ff
1c51 : 65 1c __ ADC ACCU + 1 
1c53 : bd e5 1c LDA $1ce5,x ; (ubitmask[0] + 0)
1c56 : 49 ff __ EOR #$ff
1c58 : 65 1d __ ADC ACCU + 2 
1c5a : 90 07 __ BCC $1c63 ; (fround + 206)
1c5c : 6a __ __ ROR
1c5d : 66 1c __ ROR ACCU + 1 
1c5f : 66 1b __ ROR ACCU + 0 
1c61 : e6 07 __ INC WORK + 4 
1c63 : 85 1d __ STA ACCU + 2 
1c65 : 4c ac 1b JMP $1bac ; (fround + 23)
1c68 : 38 __ __ SEC
1c69 : e9 87 __ SBC #$87
1c6b : aa __ __ TAX
1c6c : 18 __ __ CLC
1c6d : a9 ff __ LDA #$ff
1c6f : 65 1b __ ADC ACCU + 0 
1c71 : bd e5 1c LDA $1ce5,x ; (ubitmask[0] + 0)
1c74 : 49 ff __ EOR #$ff
1c76 : 65 1c __ ADC ACCU + 1 
1c78 : 85 1c __ STA ACCU + 1 
1c7a : a9 00 __ LDA #$00
1c7c : 65 1d __ ADC ACCU + 2 
1c7e : 90 07 __ BCC $1c87 ; (fround + 242)
1c80 : 6a __ __ ROR
1c81 : 66 1c __ ROR ACCU + 1 
1c83 : 66 1b __ ROR ACCU + 0 
1c85 : e6 07 __ INC WORK + 4 
1c87 : 85 1d __ STA ACCU + 2 
1c89 : 4c ac 1b JMP $1bac ; (fround + 23)
1c8c : 4c d0 19 JMP $19d0 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1c8f : 20 bf 19 JSR $19bf ; (freg + 36)
1c92 : a5 07 __ LDA WORK + 4 
1c94 : c9 7f __ CMP #$7f
1c96 : b0 07 __ BCS $1c9f ; (f32_to_i16 + 16)
1c98 : a9 00 __ LDA #$00
1c9a : 85 1b __ STA ACCU + 0 
1c9c : 85 1c __ STA ACCU + 1 
1c9e : 60 __ __ RTS
1c9f : e9 8e __ SBC #$8e
1ca1 : 90 16 __ BCC $1cb9 ; (f32_to_i16 + 42)
1ca3 : 24 1e __ BIT ACCU + 3 
1ca5 : 30 09 __ BMI $1cb0 ; (f32_to_i16 + 33)
1ca7 : a9 ff __ LDA #$ff
1ca9 : 85 1b __ STA ACCU + 0 
1cab : a9 7f __ LDA #$7f
1cad : 85 1c __ STA ACCU + 1 
1caf : 60 __ __ RTS
1cb0 : a9 00 __ LDA #$00
1cb2 : 85 1b __ STA ACCU + 0 
1cb4 : a9 80 __ LDA #$80
1cb6 : 85 1c __ STA ACCU + 1 
1cb8 : 60 __ __ RTS
1cb9 : aa __ __ TAX
1cba : a5 1c __ LDA ACCU + 1 
1cbc : 46 1d __ LSR ACCU + 2 
1cbe : 6a __ __ ROR
1cbf : e8 __ __ INX
1cc0 : d0 fa __ BNE $1cbc ; (f32_to_i16 + 45)
1cc2 : 24 1e __ BIT ACCU + 3 
1cc4 : 10 0e __ BPL $1cd4 ; (f32_to_i16 + 69)
1cc6 : 38 __ __ SEC
1cc7 : 49 ff __ EOR #$ff
1cc9 : 69 00 __ ADC #$00
1ccb : 85 1b __ STA ACCU + 0 
1ccd : a9 00 __ LDA #$00
1ccf : e5 1d __ SBC ACCU + 2 
1cd1 : 85 1c __ STA ACCU + 1 
1cd3 : 60 __ __ RTS
1cd4 : 85 1b __ STA ACCU + 0 
1cd6 : a5 1d __ LDA ACCU + 2 
1cd8 : 85 1c __ STA ACCU + 1 
1cda : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1cdb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
Clip:
1cdc : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
giocharmap:
1ce4 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
ubitmask:
1ce5 : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
Screen:
1ced : __ __ __ BSS	8
--------------------------------------------------------------------
bitshift:
1d00 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
1d10 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d20 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
1d30 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
BLIT_CODE:
1e00 : __ __ __ BSS	224
