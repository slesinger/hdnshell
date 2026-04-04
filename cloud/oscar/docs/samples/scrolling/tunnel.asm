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
080e : 8e e5 0d STX $0de5 ; (spentry + 0)
0811 : a2 0d __ LDX #$0d
0813 : a0 e8 __ LDY #$e8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 10 __ CPX #$10
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 19 __ CPY #$19
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
; 178, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/tunnel.c"
.s4:
0880 : a9 00 __ LDA #$00
0882 : 8d 21 d0 STA $d021 
0885 : 8d 20 d0 STA $d020 
0888 : a9 20 __ LDA #$20
088a : a2 fa __ LDX #$fa
.l6:
088c : ca __ __ DEX
088d : 9d 00 04 STA $0400,x 
0890 : 9d fa 04 STA $04fa,x 
0893 : 9d f4 05 STA $05f4,x 
0896 : 9d ee 06 STA $06ee,x 
0899 : d0 f1 __ BNE $088c ; (main.l6 + 0)
.s5:
089b : a9 07 __ LDA #$07
089d : a2 fa __ LDX #$fa
.l8:
089f : ca __ __ DEX
08a0 : 9d 00 d8 STA $d800,x 
08a3 : 9d fa d8 STA $d8fa,x 
08a6 : 9d f4 d9 STA $d9f4,x 
08a9 : 9d ee da STA $daee,x 
08ac : d0 f1 __ BNE $089f ; (main.l8 + 0)
.s7:
08ae : 20 be 09 JSR $09be ; (buildTunnel.s4 + 0)
08b1 : a9 00 __ LDA #$00
08b3 : 85 0d __ STA P0 
.l34:
08b5 : 20 6a 0a JSR $0a6a ; (prepcol.s4 + 0)
08b8 : a5 0d __ LDA P0 
08ba : 20 db 0a JSR $0adb ; (expand.s4 + 0)
08bd : e6 0d __ INC P0 
08bf : a5 0d __ LDA P0 
08c1 : c9 28 __ CMP #$28
08c3 : 90 f0 __ BCC $08b5 ; (main.l34 + 0)
.s9:
08c5 : a9 00 __ LDA #$00
08c7 : 85 48 __ STA T1 + 0 
08c9 : 85 49 __ STA T1 + 1 
08cb : 85 4a __ STA T2 + 0 
08cd : 85 4b __ STA T2 + 1 
08cf : 85 4d __ STA T3 + 1 
08d1 : 85 4e __ STA T4 + 0 
08d3 : 85 4f __ STA T4 + 1 
08d5 : a9 01 __ LDA #$01
08d7 : 85 4c __ STA T3 + 0 
.l10:
08d9 : 20 43 0a JSR $0a43 ; (rand.s4 + 0)
08dc : a5 1b __ LDA ACCU + 0 
08de : 29 7f __ AND #$7f
08e0 : d0 0b __ BNE $08ed ; (main.s11 + 0)
.s33:
08e2 : 38 __ __ SEC
08e3 : e5 4c __ SBC T3 + 0 
08e5 : 85 4c __ STA T3 + 0 
08e7 : a9 00 __ LDA #$00
08e9 : e5 4d __ SBC T3 + 1 
08eb : 85 4d __ STA T3 + 1 
.s11:
08ed : 18 __ __ CLC
08ee : a5 4a __ LDA T2 + 0 
08f0 : 65 4c __ ADC T3 + 0 
08f2 : 85 4a __ STA T2 + 0 
08f4 : a5 4b __ LDA T2 + 1 
08f6 : 65 4d __ ADC T3 + 1 
08f8 : 85 4b __ STA T2 + 1 
08fa : a5 4a __ LDA T2 + 0 
08fc : 10 03 __ BPL $0901 ; (main.s37 + 0)
08fe : 4c b0 09 JMP $09b0 ; (main.s38 + 0)
.s37:
0901 : c9 21 __ CMP #$21
0903 : 90 08 __ BCC $090d ; (main.s12 + 0)
.s32:
0905 : a9 00 __ LDA #$00
0907 : a0 20 __ LDY #$20
.s36:
0909 : 84 4a __ STY T2 + 0 
090b : 85 4b __ STA T2 + 1 
.s12:
090d : a5 4e __ LDA T4 + 0 
090f : 85 43 __ STA T0 + 0 
0911 : 85 50 __ STA T5 + 0 
0913 : 18 __ __ CLC
0914 : a5 48 __ LDA T1 + 0 
0916 : 65 4a __ ADC T2 + 0 
0918 : 85 48 __ STA T1 + 0 
091a : 85 4e __ STA T4 + 0 
091c : a5 49 __ LDA T1 + 1 
091e : 65 4b __ ADC T2 + 1 
0920 : 85 49 __ STA T1 + 1 
0922 : 4a __ __ LSR
0923 : 66 4e __ ROR T4 + 0 
0925 : 4a __ __ LSR
0926 : 66 4e __ ROR T4 + 0 
0928 : 4a __ __ LSR
0929 : 66 4e __ ROR T4 + 0 
092b : 4a __ __ LSR
092c : 66 4e __ ROR T4 + 0 
092e : 4a __ __ LSR
092f : 66 4e __ ROR T4 + 0 
0931 : 49 04 __ EOR #$04
0933 : 38 __ __ SEC
0934 : e9 04 __ SBC #$04
0936 : a4 4f __ LDY T4 + 1 
0938 : 84 51 __ STY T5 + 1 
093a : 85 4f __ STA T4 + 1 
093c : 98 __ __ TYA
093d : c4 4f __ CPY T4 + 1 
093f : d0 08 __ BNE $0949 ; (main.s30 + 0)
.s27:
0941 : a5 43 __ LDA T0 + 0 
0943 : c5 4e __ CMP T4 + 0 
.s28:
0945 : 90 08 __ BCC $094f ; (main.s26 + 0)
0947 : b0 11 __ BCS $095a ; (main.s13 + 0)
.s30:
0949 : 45 4f __ EOR T4 + 1 
094b : 10 f8 __ BPL $0945 ; (main.s28 + 0)
.s29:
094d : 90 0b __ BCC $095a ; (main.s13 + 0)
.s26:
094f : 18 __ __ CLC
0950 : a5 4e __ LDA T4 + 0 
0952 : 69 27 __ ADC #$27
.s35:
0954 : 20 6a 0a JSR $0a6a ; (prepcol.s4 + 0)
0957 : 4c 64 09 JMP $0964 ; (main.l14 + 0)
.s13:
095a : a5 4e __ LDA T4 + 0 
095c : c4 4f __ CPY T4 + 1 
095e : d0 f4 __ BNE $0954 ; (main.s35 + 0)
.s25:
0960 : c5 43 __ CMP T0 + 0 
0962 : d0 f0 __ BNE $0954 ; (main.s35 + 0)
.l14:
0964 : 2c 11 d0 BIT $d011 
0967 : 30 fb __ BMI $0964 ; (main.l14 + 0)
.l15:
0969 : 2c 11 d0 BIT $d011 
096c : 10 fb __ BPL $0969 ; (main.l15 + 0)
.s16:
096e : a5 48 __ LDA T1 + 0 
0970 : 85 43 __ STA T0 + 0 
0972 : a5 49 __ LDA T1 + 1 
0974 : 4a __ __ LSR
0975 : 66 43 __ ROR T0 + 0 
0977 : 4a __ __ LSR
0978 : 66 43 __ ROR T0 + 0 
097a : 38 __ __ SEC
097b : a9 07 __ LDA #$07
097d : e5 43 __ SBC T0 + 0 
097f : 29 07 __ AND #$07
0981 : 8d 16 d0 STA $d016 
0984 : a5 51 __ LDA T5 + 1 
0986 : c5 4f __ CMP T4 + 1 
0988 : d0 08 __ BNE $0992 ; (main.s24 + 0)
.s21:
098a : a5 50 __ LDA T5 + 0 
098c : c5 4e __ CMP T4 + 0 
.s22:
098e : 90 08 __ BCC $0998 ; (main.s20 + 0)
0990 : b0 0c __ BCS $099e ; (main.s17 + 0)
.s24:
0992 : 45 4f __ EOR T4 + 1 
0994 : 10 f8 __ BPL $098e ; (main.s22 + 0)
.s23:
0996 : 90 06 __ BCC $099e ; (main.s17 + 0)
.s20:
0998 : 20 73 0b JSR $0b73 ; (scrollLeft.s4 + 0)
099b : 4c d9 08 JMP $08d9 ; (main.l10 + 0)
.s17:
099e : a5 51 __ LDA T5 + 1 
09a0 : c5 4f __ CMP T4 + 1 
09a2 : d0 06 __ BNE $09aa ; (main.s18 + 0)
.s19:
09a4 : a5 50 __ LDA T5 + 0 
09a6 : c5 4e __ CMP T4 + 0 
09a8 : f0 f1 __ BEQ $099b ; (main.s20 + 3)
.s18:
09aa : 20 ae 0c JSR $0cae ; (scrollRight.s4 + 0)
09ad : 4c d9 08 JMP $08d9 ; (main.l10 + 0)
.s38:
09b0 : c9 e0 __ CMP #$e0
09b2 : 90 03 __ BCC $09b7 ; (main.s31 + 0)
09b4 : 4c 0d 09 JMP $090d ; (main.s12 + 0)
.s31:
09b7 : a9 ff __ LDA #$ff
09b9 : a0 e0 __ LDY #$e0
09bb : 4c 09 09 JMP $0909 ; (main.s36 + 0)
--------------------------------------------------------------------
buildTunnel: ; buildTunnel()->void
; 140, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/tunnel.c"
.s4:
09be : a9 01 __ LDA #$01
09c0 : 85 43 __ STA T2 + 0 
09c2 : 85 45 __ STA T4 + 0 
09c4 : a9 18 __ LDA #$18
09c6 : 85 44 __ STA T3 + 0 
09c8 : a9 ff __ LDA #$ff
09ca : 85 46 __ STA T5 + 0 
09cc : a9 00 __ LDA #$00
09ce : 85 47 __ STA T6 + 0 
.l5:
09d0 : 20 43 0a JSR $0a43 ; (rand.s4 + 0)
09d3 : a5 1b __ LDA ACCU + 0 
09d5 : 29 e0 __ AND #$e0
09d7 : d0 05 __ BNE $09de ; (buildTunnel.s7 + 0)
.s6:
09d9 : 38 __ __ SEC
09da : e5 45 __ SBC T4 + 0 
09dc : 85 45 __ STA T4 + 0 
.s7:
09de : a5 1c __ LDA ACCU + 1 
09e0 : 29 e0 __ AND #$e0
09e2 : d0 05 __ BNE $09e9 ; (buildTunnel.s9 + 0)
.s8:
09e4 : 38 __ __ SEC
09e5 : e5 46 __ SBC T5 + 0 
09e7 : 85 46 __ STA T5 + 0 
.s9:
09e9 : 18 __ __ CLC
09ea : a5 46 __ LDA T5 + 0 
09ec : 65 44 __ ADC T3 + 0 
09ee : 85 44 __ STA T3 + 0 
09f0 : 18 __ __ CLC
09f1 : a5 45 __ LDA T4 + 0 
09f3 : 65 43 __ ADC T2 + 0 
09f5 : 85 43 __ STA T2 + 0 
09f7 : 10 08 __ BPL $0a01 ; (buildTunnel.s10 + 0)
.s17:
09f9 : a9 00 __ LDA #$00
09fb : 85 43 __ STA T2 + 0 
09fd : a9 01 __ LDA #$01
09ff : 85 45 __ STA T4 + 0 
.s10:
0a01 : a5 44 __ LDA T3 + 0 
0a03 : 30 0c __ BMI $0a11 ; (buildTunnel.s11 + 0)
.s18:
0a05 : c9 1a __ CMP #$1a
0a07 : 90 08 __ BCC $0a11 ; (buildTunnel.s11 + 0)
.s16:
0a09 : a9 19 __ LDA #$19
0a0b : 85 44 __ STA T3 + 0 
0a0d : a9 ff __ LDA #$ff
0a0f : 85 46 __ STA T5 + 0 
.s11:
0a11 : a5 43 __ LDA T2 + 0 
0a13 : a6 47 __ LDX T6 + 0 
0a15 : 9d 00 0e STA $0e00,x ; (ytop[0] + 0)
0a18 : a5 44 __ LDA T3 + 0 
0a1a : 9d 00 0f STA $0f00,x ; (ybottom[0] + 0)
0a1d : 0a __ __ ASL
0a1e : a0 00 __ LDY #$00
0a20 : 90 01 __ BCC $0a23 ; (buildTunnel.s20 + 0)
.s19:
0a22 : 88 __ __ DEY
.s20:
0a23 : 18 __ __ CLC
0a24 : a5 43 __ LDA T2 + 0 
0a26 : 69 05 __ ADC #$05
0a28 : 85 1b __ STA ACCU + 0 
0a2a : 98 __ __ TYA
0a2b : 30 08 __ BMI $0a35 ; (buildTunnel.s13 + 0)
.s15:
0a2d : d0 0e __ BNE $0a3d ; (buildTunnel.s12 + 0)
.s14:
0a2f : a5 44 __ LDA T3 + 0 
0a31 : c5 1b __ CMP ACCU + 0 
0a33 : b0 08 __ BCS $0a3d ; (buildTunnel.s12 + 0)
.s13:
0a35 : a9 ff __ LDA #$ff
0a37 : 85 45 __ STA T4 + 0 
0a39 : a9 01 __ LDA #$01
0a3b : 85 46 __ STA T5 + 0 
.s12:
0a3d : e8 __ __ INX
0a3e : 86 47 __ STX T6 + 0 
0a40 : d0 8e __ BNE $09d0 ; (buildTunnel.l5 + 0)
.s3:
0a42 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0a43 : ad e7 0d LDA $0de7 ; (seed + 1)
0a46 : 4a __ __ LSR
0a47 : ad e6 0d LDA $0de6 ; (seed + 0)
0a4a : 6a __ __ ROR
0a4b : aa __ __ TAX
0a4c : a9 00 __ LDA #$00
0a4e : 6a __ __ ROR
0a4f : 4d e6 0d EOR $0de6 ; (seed + 0)
0a52 : 85 1b __ STA ACCU + 0 
0a54 : 8a __ __ TXA
0a55 : 4d e7 0d EOR $0de7 ; (seed + 1)
0a58 : 85 1c __ STA ACCU + 1 
0a5a : 4a __ __ LSR
0a5b : 45 1b __ EOR ACCU + 0 
0a5d : 8d e6 0d STA $0de6 ; (seed + 0)
0a60 : 85 1b __ STA ACCU + 0 
0a62 : 45 1c __ EOR ACCU + 1 
0a64 : 8d e7 0d STA $0de7 ; (seed + 1)
0a67 : 85 1c __ STA ACCU + 1 
.s3:
0a69 : 60 __ __ RTS
--------------------------------------------------------------------
prepcol: ; prepcol(u8)->void
; 105, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/tunnel.c"
.s4:
0a6a : aa __ __ TAX
0a6b : bd 00 0f LDA $0f00,x ; (ybottom[0] + 0)
0a6e : 85 1c __ STA ACCU + 1 
0a70 : 38 __ __ SEC
0a71 : fd ff 0e SBC $0eff,x ; (ytop[0] + 255)
0a74 : 85 1b __ STA ACCU + 0 
0a76 : bd 00 0e LDA $0e00,x ; (ytop[0] + 0)
0a79 : 85 1d __ STA ACCU + 2 
0a7b : 38 __ __ SEC
0a7c : fd ff 0d SBC $0dff,x 
0a7f : aa __ __ TAX
0a80 : a4 1d __ LDY ACCU + 2 
0a82 : f0 0e __ BEQ $0a92 ; (prepcol.s17 + 0)
.s15:
0a84 : a9 a0 __ LDA #$a0
0a86 : a0 00 __ LDY #$00
.l16:
0a88 : 99 00 10 STA $1000,y ; (rbuff[0] + 0)
0a8b : c8 __ __ INY
0a8c : c4 1d __ CPY ACCU + 2 
0a8e : 90 f8 __ BCC $0a88 ; (prepcol.l16 + 0)
.s21:
0a90 : a4 1d __ LDY ACCU + 2 
.s17:
0a92 : c4 1c __ CPY ACCU + 1 
0a94 : b0 0a __ BCS $0aa0 ; (prepcol.s18 + 0)
.s14:
0a96 : a9 20 __ LDA #$20
.l19:
0a98 : 99 00 10 STA $1000,y ; (rbuff[0] + 0)
0a9b : c8 __ __ INY
0a9c : c4 1c __ CPY ACCU + 1 
0a9e : 90 f8 __ BCC $0a98 ; (prepcol.l19 + 0)
.s18:
0aa0 : a4 1c __ LDY ACCU + 1 
0aa2 : c0 19 __ CPY #$19
0aa4 : b0 0a __ BCS $0ab0 ; (prepcol.s5 + 0)
.s13:
0aa6 : a9 a0 __ LDA #$a0
.l20:
0aa8 : 99 00 10 STA $1000,y ; (rbuff[0] + 0)
0aab : c8 __ __ INY
0aac : c0 19 __ CPY #$19
0aae : 90 f8 __ BCC $0aa8 ; (prepcol.l20 + 0)
.s5:
0ab0 : 8a __ __ TXA
0ab1 : 10 09 __ BPL $0abc ; (prepcol.s6 + 0)
.s12:
0ab3 : a9 69 __ LDA #$69
0ab5 : a6 1d __ LDX ACCU + 2 
0ab7 : 9d 00 10 STA $1000,x ; (rbuff[0] + 0)
0aba : b0 09 __ BCS $0ac5 ; (prepcol.s7 + 0)
.s6:
0abc : f0 07 __ BEQ $0ac5 ; (prepcol.s7 + 0)
.s11:
0abe : a9 5f __ LDA #$5f
0ac0 : a6 1d __ LDX ACCU + 2 
0ac2 : 9d ff 0f STA $0fff,x ; (ybottom[0] + 255)
.s7:
0ac5 : a5 1b __ LDA ACCU + 0 
0ac7 : 10 08 __ BPL $0ad1 ; (prepcol.s8 + 0)
.s10:
0ac9 : a9 e9 __ LDA #$e9
0acb : a6 1c __ LDX ACCU + 1 
0acd : 9d 00 10 STA $1000,x ; (rbuff[0] + 0)
.s3:
0ad0 : 60 __ __ RTS
.s8:
0ad1 : f0 fd __ BEQ $0ad0 ; (prepcol.s3 + 0)
.s9:
0ad3 : a9 df __ LDA #$df
0ad5 : a6 1c __ LDX ACCU + 1 
0ad7 : 9d ff 0f STA $0fff,x ; (ybottom[0] + 255)
0ada : 60 __ __ RTS
--------------------------------------------------------------------
expand: ; expand(u8)->void
;  17, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/tunnel.c"
.s4:
0adb : aa __ __ TAX
0adc : ad 00 10 LDA $1000 ; (rbuff[0] + 0)
0adf : 9d 00 04 STA $0400,x 
0ae2 : ad 01 10 LDA $1001 ; (rbuff[0] + 1)
0ae5 : 9d 28 04 STA $0428,x 
0ae8 : ad 02 10 LDA $1002 ; (rbuff[0] + 2)
0aeb : 9d 50 04 STA $0450,x 
0aee : ad 03 10 LDA $1003 ; (rbuff[0] + 3)
0af1 : 9d 78 04 STA $0478,x 
0af4 : ad 04 10 LDA $1004 ; (rbuff[0] + 4)
0af7 : 9d a0 04 STA $04a0,x 
0afa : ad 05 10 LDA $1005 ; (rbuff[0] + 5)
0afd : 9d c8 04 STA $04c8,x 
0b00 : ad 06 10 LDA $1006 ; (rbuff[0] + 6)
0b03 : 9d f0 04 STA $04f0,x 
0b06 : ad 07 10 LDA $1007 ; (rbuff[0] + 7)
0b09 : 9d 18 05 STA $0518,x 
0b0c : ad 08 10 LDA $1008 ; (rbuff[0] + 8)
0b0f : 9d 40 05 STA $0540,x 
0b12 : ad 09 10 LDA $1009 ; (rbuff[0] + 9)
0b15 : 9d 68 05 STA $0568,x 
0b18 : ad 0a 10 LDA $100a ; (rbuff[0] + 10)
0b1b : 9d 90 05 STA $0590,x 
0b1e : ad 0b 10 LDA $100b ; (rbuff[0] + 11)
0b21 : 9d b8 05 STA $05b8,x 
0b24 : ad 0c 10 LDA $100c ; (rbuff[0] + 12)
0b27 : 9d e0 05 STA $05e0,x 
0b2a : ad 0d 10 LDA $100d ; (rbuff[0] + 13)
0b2d : 9d 08 06 STA $0608,x 
0b30 : ad 0e 10 LDA $100e ; (rbuff[0] + 14)
0b33 : 9d 30 06 STA $0630,x 
0b36 : ad 0f 10 LDA $100f ; (rbuff[0] + 15)
0b39 : 9d 58 06 STA $0658,x 
0b3c : ad 10 10 LDA $1010 ; (rbuff[0] + 16)
0b3f : 9d 80 06 STA $0680,x 
0b42 : ad 11 10 LDA $1011 ; (rbuff[0] + 17)
0b45 : 9d a8 06 STA $06a8,x 
0b48 : ad 12 10 LDA $1012 ; (rbuff[0] + 18)
0b4b : 9d d0 06 STA $06d0,x 
0b4e : ad 13 10 LDA $1013 ; (rbuff[0] + 19)
0b51 : 9d f8 06 STA $06f8,x 
0b54 : ad 14 10 LDA $1014 ; (rbuff[0] + 20)
0b57 : 9d 20 07 STA $0720,x 
0b5a : ad 15 10 LDA $1015 ; (rbuff[0] + 21)
0b5d : 9d 48 07 STA $0748,x 
0b60 : ad 16 10 LDA $1016 ; (rbuff[0] + 22)
0b63 : 9d 70 07 STA $0770,x 
0b66 : ad 17 10 LDA $1017 ; (rbuff[0] + 23)
0b69 : 9d 98 07 STA $0798,x 
0b6c : ad 18 10 LDA $1018 ; (rbuff[0] + 24)
0b6f : 9d c0 07 STA $07c0,x 
.s3:
0b72 : 60 __ __ RTS
--------------------------------------------------------------------
scrollLeft: ; scrollLeft()->void
;  31, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/tunnel.c"
.s4:
0b73 : a2 00 __ LDX #$00
.l5:
0b75 : bd 01 04 LDA $0401,x 
0b78 : 9d 00 04 STA $0400,x 
0b7b : bd 29 04 LDA $0429,x 
0b7e : 9d 28 04 STA $0428,x 
0b81 : bd 51 04 LDA $0451,x 
0b84 : 9d 50 04 STA $0450,x 
0b87 : bd 79 04 LDA $0479,x 
0b8a : 9d 78 04 STA $0478,x 
0b8d : bd a1 04 LDA $04a1,x 
0b90 : 9d a0 04 STA $04a0,x 
0b93 : bd c9 04 LDA $04c9,x 
0b96 : 9d c8 04 STA $04c8,x 
0b99 : bd f1 04 LDA $04f1,x 
0b9c : 9d f0 04 STA $04f0,x 
0b9f : bd 19 05 LDA $0519,x 
0ba2 : 9d 18 05 STA $0518,x 
0ba5 : bd 41 05 LDA $0541,x 
0ba8 : 9d 40 05 STA $0540,x 
0bab : bd 69 05 LDA $0569,x 
0bae : 9d 68 05 STA $0568,x 
0bb1 : bd 91 05 LDA $0591,x 
0bb4 : 9d 90 05 STA $0590,x 
0bb7 : bd b9 05 LDA $05b9,x 
0bba : 9d b8 05 STA $05b8,x 
0bbd : e8 __ __ INX
0bbe : e0 27 __ CPX #$27
0bc0 : d0 b3 __ BNE $0b75 ; (scrollLeft.l5 + 0)
.s6:
0bc2 : ad 00 10 LDA $1000 ; (rbuff[0] + 0)
0bc5 : 8d 27 04 STA $0427 
0bc8 : ad 01 10 LDA $1001 ; (rbuff[0] + 1)
0bcb : 8d 4f 04 STA $044f 
0bce : ad 02 10 LDA $1002 ; (rbuff[0] + 2)
0bd1 : 8d 77 04 STA $0477 
0bd4 : ad 03 10 LDA $1003 ; (rbuff[0] + 3)
0bd7 : 8d 9f 04 STA $049f 
0bda : ad 04 10 LDA $1004 ; (rbuff[0] + 4)
0bdd : 8d c7 04 STA $04c7 
0be0 : ad 05 10 LDA $1005 ; (rbuff[0] + 5)
0be3 : 8d ef 04 STA $04ef 
0be6 : ad 06 10 LDA $1006 ; (rbuff[0] + 6)
0be9 : 8d 17 05 STA $0517 
0bec : ad 07 10 LDA $1007 ; (rbuff[0] + 7)
0bef : 8d 3f 05 STA $053f 
0bf2 : ad 08 10 LDA $1008 ; (rbuff[0] + 8)
0bf5 : 8d 67 05 STA $0567 
0bf8 : ad 09 10 LDA $1009 ; (rbuff[0] + 9)
0bfb : 8d 8f 05 STA $058f 
0bfe : ad 0a 10 LDA $100a ; (rbuff[0] + 10)
0c01 : 8d b7 05 STA $05b7 
0c04 : ad 0b 10 LDA $100b ; (rbuff[0] + 11)
0c07 : 8d df 05 STA $05df 
0c0a : a2 00 __ LDX #$00
.l7:
0c0c : bd e1 05 LDA $05e1,x 
0c0f : 9d e0 05 STA $05e0,x 
0c12 : bd 09 06 LDA $0609,x 
0c15 : 9d 08 06 STA $0608,x 
0c18 : bd 31 06 LDA $0631,x 
0c1b : 9d 30 06 STA $0630,x 
0c1e : bd 59 06 LDA $0659,x 
0c21 : 9d 58 06 STA $0658,x 
0c24 : bd 81 06 LDA $0681,x 
0c27 : 9d 80 06 STA $0680,x 
0c2a : bd a9 06 LDA $06a9,x 
0c2d : 9d a8 06 STA $06a8,x 
0c30 : bd d1 06 LDA $06d1,x 
0c33 : 9d d0 06 STA $06d0,x 
0c36 : bd f9 06 LDA $06f9,x 
0c39 : 9d f8 06 STA $06f8,x 
0c3c : bd 21 07 LDA $0721,x 
0c3f : 9d 20 07 STA $0720,x 
0c42 : bd 49 07 LDA $0749,x 
0c45 : 9d 48 07 STA $0748,x 
0c48 : bd 71 07 LDA $0771,x 
0c4b : 9d 70 07 STA $0770,x 
0c4e : bd 99 07 LDA $0799,x 
0c51 : 9d 98 07 STA $0798,x 
0c54 : bd c1 07 LDA $07c1,x 
0c57 : 9d c0 07 STA $07c0,x 
0c5a : e8 __ __ INX
0c5b : e0 27 __ CPX #$27
0c5d : d0 ad __ BNE $0c0c ; (scrollLeft.l7 + 0)
.s8:
0c5f : ad 0c 10 LDA $100c ; (rbuff[0] + 12)
0c62 : 8d 07 06 STA $0607 
0c65 : ad 0d 10 LDA $100d ; (rbuff[0] + 13)
0c68 : 8d 2f 06 STA $062f 
0c6b : ad 0e 10 LDA $100e ; (rbuff[0] + 14)
0c6e : 8d 57 06 STA $0657 
0c71 : ad 0f 10 LDA $100f ; (rbuff[0] + 15)
0c74 : 8d 7f 06 STA $067f 
0c77 : ad 10 10 LDA $1010 ; (rbuff[0] + 16)
0c7a : 8d a7 06 STA $06a7 
0c7d : ad 11 10 LDA $1011 ; (rbuff[0] + 17)
0c80 : 8d cf 06 STA $06cf 
0c83 : ad 12 10 LDA $1012 ; (rbuff[0] + 18)
0c86 : 8d f7 06 STA $06f7 
0c89 : ad 13 10 LDA $1013 ; (rbuff[0] + 19)
0c8c : 8d 1f 07 STA $071f 
0c8f : ad 14 10 LDA $1014 ; (rbuff[0] + 20)
0c92 : 8d 47 07 STA $0747 
0c95 : ad 15 10 LDA $1015 ; (rbuff[0] + 21)
0c98 : 8d 6f 07 STA $076f 
0c9b : ad 16 10 LDA $1016 ; (rbuff[0] + 22)
0c9e : 8d 97 07 STA $0797 
0ca1 : ad 17 10 LDA $1017 ; (rbuff[0] + 23)
0ca4 : 8d bf 07 STA $07bf 
0ca7 : ad 18 10 LDA $1018 ; (rbuff[0] + 24)
0caa : 8d e7 07 STA $07e7 
.s3:
0cad : 60 __ __ RTS
--------------------------------------------------------------------
scrollRight: ; scrollRight()->void
;  68, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/tunnel.c"
.s4:
0cae : a2 27 __ LDX #$27
.l5:
0cb0 : bd 27 04 LDA $0427,x 
0cb3 : 9d 28 04 STA $0428,x 
0cb6 : bd 4f 04 LDA $044f,x 
0cb9 : 9d 50 04 STA $0450,x 
0cbc : bd 77 04 LDA $0477,x 
0cbf : 9d 78 04 STA $0478,x 
0cc2 : bd 9f 04 LDA $049f,x 
0cc5 : 9d a0 04 STA $04a0,x 
0cc8 : bd c7 04 LDA $04c7,x 
0ccb : 9d c8 04 STA $04c8,x 
0cce : bd ef 04 LDA $04ef,x 
0cd1 : 9d f0 04 STA $04f0,x 
0cd4 : bd ff 03 LDA $03ff,x 
0cd7 : 9d 00 04 STA $0400,x 
0cda : bd 3f 05 LDA $053f,x 
0cdd : 9d 40 05 STA $0540,x 
0ce0 : bd 67 05 LDA $0567,x 
0ce3 : 9d 68 05 STA $0568,x 
0ce6 : bd 8f 05 LDA $058f,x 
0ce9 : 9d 90 05 STA $0590,x 
0cec : bd b7 05 LDA $05b7,x 
0cef : 9d b8 05 STA $05b8,x 
0cf2 : bd 17 05 LDA $0517,x 
0cf5 : 9d 18 05 STA $0518,x 
0cf8 : ca __ __ DEX
0cf9 : d0 b5 __ BNE $0cb0 ; (scrollRight.l5 + 0)
.s6:
0cfb : ad 00 10 LDA $1000 ; (rbuff[0] + 0)
0cfe : 8d 00 04 STA $0400 
0d01 : ad 01 10 LDA $1001 ; (rbuff[0] + 1)
0d04 : 8d 28 04 STA $0428 
0d07 : ad 02 10 LDA $1002 ; (rbuff[0] + 2)
0d0a : 8d 50 04 STA $0450 
0d0d : ad 03 10 LDA $1003 ; (rbuff[0] + 3)
0d10 : 8d 78 04 STA $0478 
0d13 : ad 04 10 LDA $1004 ; (rbuff[0] + 4)
0d16 : 8d a0 04 STA $04a0 
0d19 : ad 05 10 LDA $1005 ; (rbuff[0] + 5)
0d1c : 8d c8 04 STA $04c8 
0d1f : ad 06 10 LDA $1006 ; (rbuff[0] + 6)
0d22 : 8d f0 04 STA $04f0 
0d25 : ad 07 10 LDA $1007 ; (rbuff[0] + 7)
0d28 : 8d 18 05 STA $0518 
0d2b : ad 08 10 LDA $1008 ; (rbuff[0] + 8)
0d2e : 8d 40 05 STA $0540 
0d31 : ad 09 10 LDA $1009 ; (rbuff[0] + 9)
0d34 : 8d 68 05 STA $0568 
0d37 : ad 0a 10 LDA $100a ; (rbuff[0] + 10)
0d3a : 8d 90 05 STA $0590 
0d3d : ad 0b 10 LDA $100b ; (rbuff[0] + 11)
0d40 : 8d b8 05 STA $05b8 
0d43 : a2 27 __ LDX #$27
.l7:
0d45 : bd 07 06 LDA $0607,x 
0d48 : 9d 08 06 STA $0608,x 
0d4b : bd 2f 06 LDA $062f,x 
0d4e : 9d 30 06 STA $0630,x 
0d51 : bd 57 06 LDA $0657,x 
0d54 : 9d 58 06 STA $0658,x 
0d57 : bd 7f 06 LDA $067f,x 
0d5a : 9d 80 06 STA $0680,x 
0d5d : bd a7 06 LDA $06a7,x 
0d60 : 9d a8 06 STA $06a8,x 
0d63 : bd cf 06 LDA $06cf,x 
0d66 : 9d d0 06 STA $06d0,x 
0d69 : bd df 05 LDA $05df,x 
0d6c : 9d e0 05 STA $05e0,x 
0d6f : bd 1f 07 LDA $071f,x 
0d72 : 9d 20 07 STA $0720,x 
0d75 : bd 47 07 LDA $0747,x 
0d78 : 9d 48 07 STA $0748,x 
0d7b : bd 6f 07 LDA $076f,x 
0d7e : 9d 70 07 STA $0770,x 
0d81 : bd 97 07 LDA $0797,x 
0d84 : 9d 98 07 STA $0798,x 
0d87 : bd bf 07 LDA $07bf,x 
0d8a : 9d c0 07 STA $07c0,x 
0d8d : bd f7 06 LDA $06f7,x 
0d90 : 9d f8 06 STA $06f8,x 
0d93 : ca __ __ DEX
0d94 : d0 af __ BNE $0d45 ; (scrollRight.l7 + 0)
.s8:
0d96 : ad 0c 10 LDA $100c ; (rbuff[0] + 12)
0d99 : 8d e0 05 STA $05e0 
0d9c : ad 0d 10 LDA $100d ; (rbuff[0] + 13)
0d9f : 8d 08 06 STA $0608 
0da2 : ad 0e 10 LDA $100e ; (rbuff[0] + 14)
0da5 : 8d 30 06 STA $0630 
0da8 : ad 0f 10 LDA $100f ; (rbuff[0] + 15)
0dab : 8d 58 06 STA $0658 
0dae : ad 10 10 LDA $1010 ; (rbuff[0] + 16)
0db1 : 8d 80 06 STA $0680 
0db4 : ad 11 10 LDA $1011 ; (rbuff[0] + 17)
0db7 : 8d a8 06 STA $06a8 
0dba : ad 12 10 LDA $1012 ; (rbuff[0] + 18)
0dbd : 8d d0 06 STA $06d0 
0dc0 : ad 13 10 LDA $1013 ; (rbuff[0] + 19)
0dc3 : 8d f8 06 STA $06f8 
0dc6 : ad 14 10 LDA $1014 ; (rbuff[0] + 20)
0dc9 : 8d 20 07 STA $0720 
0dcc : ad 15 10 LDA $1015 ; (rbuff[0] + 21)
0dcf : 8d 48 07 STA $0748 
0dd2 : ad 16 10 LDA $1016 ; (rbuff[0] + 22)
0dd5 : 8d 70 07 STA $0770 
0dd8 : ad 17 10 LDA $1017 ; (rbuff[0] + 23)
0ddb : 8d 98 07 STA $0798 
0dde : ad 18 10 LDA $1018 ; (rbuff[0] + 24)
0de1 : 8d c0 07 STA $07c0 
.s3:
0de4 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0de5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seed:
0de6 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ytop:
0e00 : __ __ __ BSS	256
--------------------------------------------------------------------
ybottom:
0f00 : __ __ __ BSS	256
--------------------------------------------------------------------
rbuff:
1000 : __ __ __ BSS	25
