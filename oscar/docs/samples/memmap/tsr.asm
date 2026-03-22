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
080e : 8e 49 c5 STX $c549 
0811 : a2 c5 __ LDX #$c5
0813 : a0 4b __ LDY #$4b
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 c5 __ CPX #$c5
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 4b __ CPY #$4b
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 ae __ LDA #$ae
083d : 85 23 __ STA SP + 0 
083f : a9 cf __ LDA #$cf
0841 : 85 24 __ STA SP + 1 
0843 : 20 70 08 JSR $0870 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  50, "/home/honza/projects/c64/projects/oscar64/samples/memmap/tsr.c"
.s4:
0870 : a9 03 __ LDA #$03
0872 : 85 1b __ STA ACCU + 0 
0874 : 85 43 __ STA T1 + 0 
0876 : a9 4c __ LDA #$4c
0878 : 8d 00 c0 STA $c000 
087b : a9 03 __ LDA #$03
087d : 8d 01 c0 STA $c001 
0880 : a9 c0 __ LDA #$c0
0882 : 8d 02 c0 STA $c002 
0885 : a9 09 __ LDA #$09
0887 : 85 1c __ STA ACCU + 1 
0889 : a9 c0 __ LDA #$c0
088b : 85 44 __ STA T1 + 1 
.l5:
088d : a0 00 __ LDY #$00
.l7:
088f : b1 1b __ LDA (ACCU + 0),y 
0891 : 91 43 __ STA (T1 + 0),y 
0893 : e6 43 __ INC T1 + 0 
0895 : d0 02 __ BNE $0899 ; (main.s9 + 0)
.s8:
0897 : e6 44 __ INC T1 + 1 
.s9:
0899 : e6 1b __ INC ACCU + 0 
089b : d0 f2 __ BNE $088f ; (main.l7 + 0)
.s10:
089d : e6 1c __ INC ACCU + 1 
089f : a5 1c __ LDA ACCU + 1 
08a1 : c9 19 __ CMP #$19
08a3 : d0 e8 __ BNE $088d ; (main.l5 + 0)
.s6:
08a5 : 84 1b __ STY ACCU + 0 
08a7 : 84 1c __ STY ACCU + 1 
.s3:
08a9 : 60 __ __ RTS
--------------------------------------------------------------------
tsr: ; tsr()->void
;  28, "/home/honza/projects/c64/projects/oscar64/samples/memmap/tsr.c"
.s4:
0903 : a9 ff __ LDA #$ff
0905 : 85 23 __ STA SP + 0 
0907 : a9 cf __ LDA #$cf
0909 : 85 24 __ STA SP + 1 
090b : a9 b7 __ LDA #$b7
090d : 8d fc cf STA $cffc 
0910 : a9 c4 __ LDA #$c4
0912 : 8d fd cf STA $cffd 
0915 : 4c 18 c0 JMP $c018 
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
0918 : ad fc cf LDA $cffc 
091b : 85 16 __ STA P9 
091d : a9 01 __ LDA #$01
091f : 85 18 __ STA P11 
0921 : a9 b0 __ LDA #$b0
0923 : 85 14 __ STA P7 
0925 : a9 cf __ LDA #$cf
0927 : 85 15 __ STA P8 
0929 : ad fd cf LDA $cffd 
092c : 85 17 __ STA P10 
092e : a9 fe __ LDA #$fe
0930 : 8d fa cf STA $cffa 
0933 : a9 cf __ LDA #$cf
0935 : 8d fb cf STA $cffb 
0938 : 4c 3b c0 JMP $c03b 
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
093b : a9 00 __ LDA #$00
.l74:
093d : 85 48 __ STA T6 + 0 
.l5:
093f : a0 00 __ LDY #$00
0941 : b1 16 __ LDA (P9),y ; (fmt + 0)
0943 : d0 2b __ BNE $0970 ; (sformat.s10 + 0)
.s6:
0945 : a4 48 __ LDY T6 + 0 
0947 : 91 14 __ STA (P7),y ; (buff + 0)
0949 : 98 __ __ TYA
094a : f0 1d __ BEQ $0969 ; (sformat.s76 + 0)
.s7:
094c : a5 18 __ LDA P11 ; (print + 0)
094e : d0 0e __ BNE $095e ; (sformat.s9 + 0)
.s8:
0950 : 98 __ __ TYA
0951 : 18 __ __ CLC
0952 : 65 14 __ ADC P7 ; (buff + 0)
0954 : aa __ __ TAX
0955 : a5 15 __ LDA P8 ; (buff + 1)
0957 : 69 00 __ ADC #$00
.s3:
0959 : 86 1b __ STX ACCU + 0 
095b : 85 1c __ STA ACCU + 1 
095d : 60 __ __ RTS
.s9:
095e : a5 14 __ LDA P7 ; (buff + 0)
0960 : 85 0e __ STA P1 
0962 : a5 15 __ LDA P8 ; (buff + 1)
0964 : 85 0f __ STA P2 
0966 : 20 26 c3 JSR $c326 
.s76:
0969 : a5 15 __ LDA P8 ; (buff + 1)
096b : a6 14 __ LDX P7 ; (buff + 0)
096d : 4c 59 c0 JMP $c059 
.s10:
0970 : c9 25 __ CMP #$25
0972 : f0 3d __ BEQ $09b1 ; (sformat.s15 + 0)
.s11:
0974 : a4 48 __ LDY T6 + 0 
0976 : 91 14 __ STA (P7),y ; (buff + 0)
0978 : e6 16 __ INC P9 ; (fmt + 0)
097a : d0 02 __ BNE $097e ; (sformat.s93 + 0)
.s92:
097c : e6 17 __ INC P10 ; (fmt + 1)
.s93:
097e : c8 __ __ INY
097f : 84 48 __ STY T6 + 0 
0981 : 98 __ __ TYA
0982 : c0 28 __ CPY #$28
0984 : 90 b9 __ BCC $093f ; (sformat.l5 + 0)
.s12:
0986 : 85 43 __ STA T0 + 0 
0988 : a9 00 __ LDA #$00
098a : 85 48 __ STA T6 + 0 
098c : a5 18 __ LDA P11 ; (print + 0)
098e : f0 14 __ BEQ $09a4 ; (sformat.s13 + 0)
.s14:
0990 : a5 14 __ LDA P7 ; (buff + 0)
0992 : 85 0e __ STA P1 
0994 : a5 15 __ LDA P8 ; (buff + 1)
0996 : 85 0f __ STA P2 
0998 : a9 00 __ LDA #$00
099a : a4 43 __ LDY T0 + 0 
099c : 91 14 __ STA (P7),y ; (buff + 0)
099e : 20 26 c3 JSR $c326 
09a1 : 4c 3f c0 JMP $c03f 
.s13:
09a4 : 18 __ __ CLC
09a5 : a5 14 __ LDA P7 ; (buff + 0)
09a7 : 65 43 __ ADC T0 + 0 
09a9 : 85 14 __ STA P7 ; (buff + 0)
09ab : 90 92 __ BCC $093f ; (sformat.l5 + 0)
.s94:
09ad : e6 15 __ INC P8 ; (buff + 1)
09af : b0 8e __ BCS $093f ; (sformat.l5 + 0)
.s15:
09b1 : a5 48 __ LDA T6 + 0 
09b3 : f0 26 __ BEQ $09db ; (sformat.s16 + 0)
.s70:
09b5 : 84 48 __ STY T6 + 0 
09b7 : 85 43 __ STA T0 + 0 
09b9 : a5 18 __ LDA P11 ; (print + 0)
09bb : f0 13 __ BEQ $09d0 ; (sformat.s71 + 0)
.s72:
09bd : a5 14 __ LDA P7 ; (buff + 0)
09bf : 85 0e __ STA P1 
09c1 : a5 15 __ LDA P8 ; (buff + 1)
09c3 : 85 0f __ STA P2 
09c5 : 98 __ __ TYA
09c6 : a4 43 __ LDY T0 + 0 
09c8 : 91 14 __ STA (P7),y ; (buff + 0)
09ca : 20 26 c3 JSR $c326 
09cd : 4c db c0 JMP $c0db 
.s71:
09d0 : 18 __ __ CLC
09d1 : a5 14 __ LDA P7 ; (buff + 0)
09d3 : 65 43 __ ADC T0 + 0 
09d5 : 85 14 __ STA P7 ; (buff + 0)
09d7 : 90 02 __ BCC $09db ; (sformat.s16 + 0)
.s91:
09d9 : e6 15 __ INC P8 ; (buff + 1)
.s16:
09db : a9 00 __ LDA #$00
09dd : 8d e7 cf STA $cfe7 
09e0 : 8d e8 cf STA $cfe8 
09e3 : 8d e9 cf STA $cfe9 
09e6 : a0 01 __ LDY #$01
09e8 : b1 16 __ LDA (P9),y ; (fmt + 0)
09ea : a2 20 __ LDX #$20
09ec : 8e e2 cf STX $cfe2 
09ef : a2 00 __ LDX #$00
09f1 : 8e e3 cf STX $cfe3 
09f4 : ca __ __ DEX
09f5 : 8e e4 cf STX $cfe4 
09f8 : a2 0a __ LDX #$0a
09fa : 8e e6 cf STX $cfe6 
09fd : aa __ __ TAX
09fe : a9 02 __ LDA #$02
0a00 : d0 07 __ BNE $0a09 ; (sformat.l17 + 0)
.s66:
0a02 : a0 00 __ LDY #$00
0a04 : b1 16 __ LDA (P9),y ; (fmt + 0)
0a06 : aa __ __ TAX
0a07 : a9 01 __ LDA #$01
.l17:
0a09 : 18 __ __ CLC
0a0a : 65 16 __ ADC P9 ; (fmt + 0)
0a0c : 85 16 __ STA P9 ; (fmt + 0)
0a0e : 90 02 __ BCC $0a12 ; (sformat.s84 + 0)
.s83:
0a10 : e6 17 __ INC P10 ; (fmt + 1)
.s84:
0a12 : 8a __ __ TXA
0a13 : e0 2b __ CPX #$2b
0a15 : d0 07 __ BNE $0a1e ; (sformat.s18 + 0)
.s69:
0a17 : a9 01 __ LDA #$01
0a19 : 8d e7 cf STA $cfe7 
0a1c : d0 e4 __ BNE $0a02 ; (sformat.s66 + 0)
.s18:
0a1e : c9 30 __ CMP #$30
0a20 : d0 06 __ BNE $0a28 ; (sformat.s19 + 0)
.s68:
0a22 : 8d e2 cf STA $cfe2 
0a25 : 4c 02 c1 JMP $c102 
.s19:
0a28 : c9 23 __ CMP #$23
0a2a : d0 07 __ BNE $0a33 ; (sformat.s20 + 0)
.s67:
0a2c : a9 01 __ LDA #$01
0a2e : 8d e9 cf STA $cfe9 
0a31 : d0 cf __ BNE $0a02 ; (sformat.s66 + 0)
.s20:
0a33 : c9 2d __ CMP #$2d
0a35 : d0 07 __ BNE $0a3e ; (sformat.s21 + 0)
.s65:
0a37 : a9 01 __ LDA #$01
0a39 : 8d e8 cf STA $cfe8 
0a3c : d0 c4 __ BNE $0a02 ; (sformat.s66 + 0)
.s21:
0a3e : 85 45 __ STA T4 + 0 
0a40 : c9 30 __ CMP #$30
0a42 : 90 31 __ BCC $0a75 ; (sformat.s22 + 0)
.s60:
0a44 : c9 3a __ CMP #$3a
0a46 : b0 5e __ BCS $0aa6 ; (sformat.s23 + 0)
.s61:
0a48 : a9 00 __ LDA #$00
0a4a : 85 46 __ STA T1 + 0 
.l62:
0a4c : a5 46 __ LDA T1 + 0 
0a4e : 0a __ __ ASL
0a4f : 0a __ __ ASL
0a50 : 18 __ __ CLC
0a51 : 65 46 __ ADC T1 + 0 
0a53 : 0a __ __ ASL
0a54 : 18 __ __ CLC
0a55 : 65 45 __ ADC T4 + 0 
0a57 : 38 __ __ SEC
0a58 : e9 30 __ SBC #$30
0a5a : 85 46 __ STA T1 + 0 
0a5c : a0 00 __ LDY #$00
0a5e : b1 16 __ LDA (P9),y ; (fmt + 0)
0a60 : 85 45 __ STA T4 + 0 
0a62 : e6 16 __ INC P9 ; (fmt + 0)
0a64 : d0 02 __ BNE $0a68 ; (sformat.s90 + 0)
.s89:
0a66 : e6 17 __ INC P10 ; (fmt + 1)
.s90:
0a68 : c9 30 __ CMP #$30
0a6a : 90 04 __ BCC $0a70 ; (sformat.s63 + 0)
.s64:
0a6c : c9 3a __ CMP #$3a
0a6e : 90 dc __ BCC $0a4c ; (sformat.l62 + 0)
.s63:
0a70 : a6 46 __ LDX T1 + 0 
0a72 : 8e e3 cf STX $cfe3 
.s22:
0a75 : c9 2e __ CMP #$2e
0a77 : d0 2d __ BNE $0aa6 ; (sformat.s23 + 0)
.s55:
0a79 : a9 00 __ LDA #$00
0a7b : f0 0e __ BEQ $0a8b ; (sformat.l56 + 0)
.s59:
0a7d : a5 43 __ LDA T0 + 0 
0a7f : 0a __ __ ASL
0a80 : 0a __ __ ASL
0a81 : 18 __ __ CLC
0a82 : 65 43 __ ADC T0 + 0 
0a84 : 0a __ __ ASL
0a85 : 18 __ __ CLC
0a86 : 65 45 __ ADC T4 + 0 
0a88 : 38 __ __ SEC
0a89 : e9 30 __ SBC #$30
.l56:
0a8b : 85 43 __ STA T0 + 0 
0a8d : a0 00 __ LDY #$00
0a8f : b1 16 __ LDA (P9),y ; (fmt + 0)
0a91 : 85 45 __ STA T4 + 0 
0a93 : e6 16 __ INC P9 ; (fmt + 0)
0a95 : d0 02 __ BNE $0a99 ; (sformat.s86 + 0)
.s85:
0a97 : e6 17 __ INC P10 ; (fmt + 1)
.s86:
0a99 : c9 30 __ CMP #$30
0a9b : 90 04 __ BCC $0aa1 ; (sformat.s57 + 0)
.s58:
0a9d : c9 3a __ CMP #$3a
0a9f : 90 dc __ BCC $0a7d ; (sformat.s59 + 0)
.s57:
0aa1 : a6 43 __ LDX T0 + 0 
0aa3 : 8e e4 cf STX $cfe4 
.s23:
0aa6 : c9 64 __ CMP #$64
0aa8 : f0 0c __ BEQ $0ab6 ; (sformat.s54 + 0)
.s24:
0aaa : c9 44 __ CMP #$44
0aac : f0 08 __ BEQ $0ab6 ; (sformat.s54 + 0)
.s25:
0aae : c9 69 __ CMP #$69
0ab0 : f0 04 __ BEQ $0ab6 ; (sformat.s54 + 0)
.s26:
0ab2 : c9 49 __ CMP #$49
0ab4 : d0 07 __ BNE $0abd ; (sformat.s27 + 0)
.s54:
0ab6 : a9 01 __ LDA #$01
.s75:
0ab8 : 85 13 __ STA P6 
0aba : 4c ec c2 JMP $c2ec 
.s27:
0abd : c9 75 __ CMP #$75
0abf : f0 04 __ BEQ $0ac5 ; (sformat.s53 + 0)
.s28:
0ac1 : c9 55 __ CMP #$55
0ac3 : d0 04 __ BNE $0ac9 ; (sformat.s29 + 0)
.s53:
0ac5 : a9 00 __ LDA #$00
0ac7 : f0 ef __ BEQ $0ab8 ; (sformat.s75 + 0)
.s29:
0ac9 : c9 78 __ CMP #$78
0acb : f0 04 __ BEQ $0ad1 ; (sformat.s51 + 0)
.s30:
0acd : c9 58 __ CMP #$58
0acf : d0 15 __ BNE $0ae6 ; (sformat.s31 + 0)
.s51:
0ad1 : a5 45 __ LDA T4 + 0 
0ad3 : 29 e0 __ AND #$e0
0ad5 : 09 01 __ ORA #$01
0ad7 : 8d e5 cf STA $cfe5 
0ada : a9 00 __ LDA #$00
0adc : 85 13 __ STA P6 
0ade : a9 10 __ LDA #$10
0ae0 : 8d e6 cf STA $cfe6 
0ae3 : 4c ec c2 JMP $c2ec 
.s31:
0ae6 : c9 73 __ CMP #$73
0ae8 : f0 3c __ BEQ $0b26 ; (sformat.s39 + 0)
.s32:
0aea : c9 53 __ CMP #$53
0aec : f0 38 __ BEQ $0b26 ; (sformat.s39 + 0)
.s33:
0aee : c9 63 __ CMP #$63
0af0 : f0 13 __ BEQ $0b05 ; (sformat.s38 + 0)
.s34:
0af2 : c9 43 __ CMP #$43
0af4 : f0 0f __ BEQ $0b05 ; (sformat.s38 + 0)
.s35:
0af6 : aa __ __ TAX
0af7 : d0 03 __ BNE $0afc ; (sformat.s36 + 0)
0af9 : 4c 3f c0 JMP $c03f 
.s36:
0afc : a0 00 __ LDY #$00
0afe : 91 14 __ STA (P7),y ; (buff + 0)
.s37:
0b00 : a9 01 __ LDA #$01
0b02 : 4c 3d c0 JMP $c03d 
.s38:
0b05 : ad fa cf LDA $cffa 
0b08 : 85 43 __ STA T0 + 0 
0b0a : ad fb cf LDA $cffb 
0b0d : 85 44 __ STA T0 + 1 
0b0f : a0 00 __ LDY #$00
0b11 : b1 43 __ LDA (T0 + 0),y 
0b13 : 91 14 __ STA (P7),y ; (buff + 0)
0b15 : a5 43 __ LDA T0 + 0 
0b17 : 69 01 __ ADC #$01
0b19 : 8d fa cf STA $cffa 
0b1c : a5 44 __ LDA T0 + 1 
0b1e : 69 00 __ ADC #$00
0b20 : 8d fb cf STA $cffb 
0b23 : 4c 00 c2 JMP $c200 
.s39:
0b26 : ad fa cf LDA $cffa 
0b29 : 85 43 __ STA T0 + 0 
0b2b : 69 01 __ ADC #$01
0b2d : 8d fa cf STA $cffa 
0b30 : ad fb cf LDA $cffb 
0b33 : 85 44 __ STA T0 + 1 
0b35 : 69 00 __ ADC #$00
0b37 : 8d fb cf STA $cffb 
0b3a : a0 00 __ LDY #$00
0b3c : 84 49 __ STY T7 + 0 
0b3e : b1 43 __ LDA (T0 + 0),y 
0b40 : 85 46 __ STA T1 + 0 
0b42 : c8 __ __ INY
0b43 : b1 43 __ LDA (T0 + 0),y 
0b45 : 85 47 __ STA T1 + 1 
0b47 : ad e3 cf LDA $cfe3 
0b4a : f0 0c __ BEQ $0b58 ; (sformat.s40 + 0)
.s80:
0b4c : 88 __ __ DEY
0b4d : b1 46 __ LDA (T1 + 0),y 
0b4f : f0 05 __ BEQ $0b56 ; (sformat.s81 + 0)
.l50:
0b51 : c8 __ __ INY
0b52 : b1 46 __ LDA (T1 + 0),y 
0b54 : d0 fb __ BNE $0b51 ; (sformat.l50 + 0)
.s81:
0b56 : 84 49 __ STY T7 + 0 
.s40:
0b58 : ad e8 cf LDA $cfe8 
0b5b : 85 1b __ STA ACCU + 0 
0b5d : d0 19 __ BNE $0b78 ; (sformat.s41 + 0)
.s78:
0b5f : a6 49 __ LDX T7 + 0 
0b61 : ec e3 cf CPX $cfe3 
0b64 : a0 00 __ LDY #$00
0b66 : b0 0c __ BCS $0b74 ; (sformat.s79 + 0)
.l49:
0b68 : ad e2 cf LDA $cfe2 
0b6b : 91 14 __ STA (P7),y ; (buff + 0)
0b6d : c8 __ __ INY
0b6e : e8 __ __ INX
0b6f : ec e3 cf CPX $cfe3 
0b72 : 90 f4 __ BCC $0b68 ; (sformat.l49 + 0)
.s79:
0b74 : 86 49 __ STX T7 + 0 
0b76 : 84 48 __ STY T6 + 0 
.s41:
0b78 : a4 18 __ LDY P11 ; (print + 0)
0b7a : d0 48 __ BNE $0bc4 ; (sformat.s46 + 0)
.s42:
0b7c : b1 46 __ LDA (T1 + 0),y 
0b7e : f0 23 __ BEQ $0ba3 ; (sformat.s43 + 0)
.s45:
0b80 : 18 __ __ CLC
0b81 : a5 46 __ LDA T1 + 0 
0b83 : 69 01 __ ADC #$01
0b85 : 85 43 __ STA T0 + 0 
0b87 : a5 47 __ LDA T1 + 1 
0b89 : 69 00 __ ADC #$00
0b8b : 85 44 __ STA T0 + 1 
0b8d : b1 46 __ LDA (T1 + 0),y 
.l73:
0b8f : a4 48 __ LDY T6 + 0 
0b91 : 91 14 __ STA (P7),y ; (buff + 0)
0b93 : e6 48 __ INC T6 + 0 
0b95 : a0 00 __ LDY #$00
0b97 : b1 43 __ LDA (T0 + 0),y 
0b99 : a8 __ __ TAY
0b9a : e6 43 __ INC T0 + 0 
0b9c : d0 02 __ BNE $0ba0 ; (sformat.s88 + 0)
.s87:
0b9e : e6 44 __ INC T0 + 1 
.s88:
0ba0 : 98 __ __ TYA
0ba1 : d0 ec __ BNE $0b8f ; (sformat.l73 + 0)
.s43:
0ba3 : a5 1b __ LDA ACCU + 0 
0ba5 : d0 03 __ BNE $0baa ; (sformat.s77 + 0)
0ba7 : 4c 3f c0 JMP $c03f 
.s77:
0baa : a6 49 __ LDX T7 + 0 
0bac : ec e3 cf CPX $cfe3 
0baf : a4 48 __ LDY T6 + 0 
0bb1 : b0 0c __ BCS $0bbf ; (sformat.s82 + 0)
.l44:
0bb3 : ad e2 cf LDA $cfe2 
0bb6 : 91 14 __ STA (P7),y ; (buff + 0)
0bb8 : c8 __ __ INY
0bb9 : e8 __ __ INX
0bba : ec e3 cf CPX $cfe3 
0bbd : 90 f4 __ BCC $0bb3 ; (sformat.l44 + 0)
.s82:
0bbf : 84 48 __ STY T6 + 0 
0bc1 : 4c 3f c0 JMP $c03f 
.s46:
0bc4 : a4 48 __ LDY T6 + 0 
0bc6 : f0 11 __ BEQ $0bd9 ; (sformat.s47 + 0)
.s48:
0bc8 : a5 14 __ LDA P7 ; (buff + 0)
0bca : 85 0e __ STA P1 
0bcc : a5 15 __ LDA P8 ; (buff + 1)
0bce : 85 0f __ STA P2 
0bd0 : a9 00 __ LDA #$00
0bd2 : 85 48 __ STA T6 + 0 
0bd4 : 91 14 __ STA (P7),y ; (buff + 0)
0bd6 : 20 26 c3 JSR $c326 
.s47:
0bd9 : a5 46 __ LDA T1 + 0 
0bdb : 85 0e __ STA P1 
0bdd : a5 47 __ LDA T1 + 1 
0bdf : 85 0f __ STA P2 
0be1 : 20 26 c3 JSR $c326 
0be4 : ad e8 cf LDA $cfe8 
0be7 : d0 c1 __ BNE $0baa ; (sformat.s77 + 0)
0be9 : 4c 3f c0 JMP $c03f 
.s52:
0bec : a5 14 __ LDA P7 ; (buff + 0)
0bee : 85 0f __ STA P2 
0bf0 : a5 15 __ LDA P8 ; (buff + 1)
0bf2 : 85 10 __ STA P3 
0bf4 : ad fa cf LDA $cffa 
0bf7 : 85 43 __ STA T0 + 0 
0bf9 : ad fb cf LDA $cffb 
0bfc : 85 44 __ STA T0 + 1 
0bfe : a0 00 __ LDY #$00
0c00 : b1 43 __ LDA (T0 + 0),y 
0c02 : 85 11 __ STA P4 
0c04 : c8 __ __ INY
0c05 : b1 43 __ LDA (T0 + 0),y 
0c07 : 85 12 __ STA P5 
0c09 : 18 __ __ CLC
0c0a : a5 43 __ LDA T0 + 0 
0c0c : 69 02 __ ADC #$02
0c0e : 8d fa cf STA $cffa 
0c11 : a5 44 __ LDA T0 + 1 
0c13 : 69 00 __ ADC #$00
0c15 : 8d fb cf STA $cffb 
0c18 : a9 e2 __ LDA #$e2
0c1a : 85 0d __ STA P0 
0c1c : a9 cf __ LDA #$cf
0c1e : 85 0e __ STA P1 
0c20 : 20 9c c3 JSR $c39c 
0c23 : 4c 3d c0 JMP $c03d 
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
0c26 : a0 00 __ LDY #$00
0c28 : b1 0e __ LDA (P1),y ; (str + 0)
0c2a : d0 01 __ BNE $0c2d ; (puts.s5 + 0)
.s3:
0c2c : 60 __ __ RTS
.s5:
0c2d : e6 0e __ INC P1 ; (str + 0)
0c2f : d0 02 __ BNE $0c33 ; (puts.s7 + 0)
.s6:
0c31 : e6 0f __ INC P2 ; (str + 1)
.s7:
0c33 : 20 39 c3 JSR $c339 
0c36 : 4c 26 c3 JMP $c326 
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0c39 : 85 0d __ STA P0 ; (c + 0)
0c3b : ad 4a c5 LDA $c54a 
0c3e : f0 32 __ BEQ $0c72 ; (putpch.s5 + 0)
.s6:
0c40 : a5 0d __ LDA P0 ; (c + 0)
0c42 : c9 0a __ CMP #$0a
0c44 : d0 04 __ BNE $0c4a ; (putpch.s7 + 0)
.s18:
0c46 : a9 0d __ LDA #$0d
0c48 : d0 32 __ BNE $0c7c ; (putpch.s15 + 0)
.s7:
0c4a : c9 09 __ CMP #$09
0c4c : f0 36 __ BEQ $0c84 ; (putpch.s16 + 0)
.s8:
0c4e : ad 4a c5 LDA $c54a 
0c51 : c9 02 __ CMP #$02
0c53 : 90 1d __ BCC $0c72 ; (putpch.s5 + 0)
.s9:
0c55 : a5 0d __ LDA P0 ; (c + 0)
0c57 : c9 41 __ CMP #$41
0c59 : 90 17 __ BCC $0c72 ; (putpch.s5 + 0)
.s10:
0c5b : c9 7b __ CMP #$7b
0c5d : b0 13 __ BCS $0c72 ; (putpch.s5 + 0)
.s11:
0c5f : c9 61 __ CMP #$61
0c61 : b0 04 __ BCS $0c67 ; (putpch.s13 + 0)
.s12:
0c63 : c9 5b __ CMP #$5b
0c65 : b0 0b __ BCS $0c72 ; (putpch.s5 + 0)
.s13:
0c67 : 49 20 __ EOR #$20
0c69 : 85 0d __ STA P0 ; (c + 0)
0c6b : ad 4a c5 LDA $c54a 
0c6e : c9 02 __ CMP #$02
0c70 : f0 06 __ BEQ $0c78 ; (putpch.s14 + 0)
.s5:
0c72 : a5 0d __ LDA P0 ; (c + 0)
0c74 : 20 d2 ff JSR $ffd2 
.s3:
0c77 : 60 __ __ RTS
.s14:
0c78 : a5 0d __ LDA P0 ; (c + 0)
0c7a : 29 5f __ AND #$5f
.s15:
0c7c : 85 43 __ STA T0 + 0 
0c7e : a5 43 __ LDA T0 + 0 
0c80 : 20 d2 ff JSR $ffd2 
0c83 : 60 __ __ RTS
.s16:
0c84 : a5 d3 __ LDA $d3 
0c86 : 29 03 __ AND #$03
0c88 : 85 43 __ STA T0 + 0 
0c8a : a9 20 __ LDA #$20
0c8c : 85 44 __ STA T1 + 0 
.l17:
0c8e : a5 44 __ LDA T1 + 0 
0c90 : 20 d2 ff JSR $ffd2 
0c93 : e6 43 __ INC T0 + 0 
0c95 : a5 43 __ LDA T0 + 0 
0c97 : c9 04 __ CMP #$04
0c99 : 90 f3 __ BCC $0c8e ; (putpch.l17 + 0)
0c9b : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0c9c : a9 00 __ LDA #$00
0c9e : 85 43 __ STA T5 + 0 
0ca0 : a0 04 __ LDY #$04
0ca2 : b1 0d __ LDA (P0),y ; (si + 0)
0ca4 : 85 44 __ STA T6 + 0 
0ca6 : a5 13 __ LDA P6 ; (s + 0)
0ca8 : f0 13 __ BEQ $0cbd ; (nformi.s5 + 0)
.s33:
0caa : 24 12 __ BIT P5 ; (v + 1)
0cac : 10 0f __ BPL $0cbd ; (nformi.s5 + 0)
.s34:
0cae : 38 __ __ SEC
0caf : a9 00 __ LDA #$00
0cb1 : e5 11 __ SBC P4 ; (v + 0)
0cb3 : 85 11 __ STA P4 ; (v + 0)
0cb5 : a9 00 __ LDA #$00
0cb7 : e5 12 __ SBC P5 ; (v + 1)
0cb9 : 85 12 __ STA P5 ; (v + 1)
0cbb : e6 43 __ INC T5 + 0 
.s5:
0cbd : a9 10 __ LDA #$10
0cbf : 85 45 __ STA T7 + 0 
0cc1 : a5 11 __ LDA P4 ; (v + 0)
0cc3 : 05 12 __ ORA P5 ; (v + 1)
0cc5 : f0 33 __ BEQ $0cfa ; (nformi.s6 + 0)
.s28:
0cc7 : a5 11 __ LDA P4 ; (v + 0)
0cc9 : 85 1b __ STA ACCU + 0 
0ccb : a5 12 __ LDA P5 ; (v + 1)
0ccd : 85 1c __ STA ACCU + 1 
.l29:
0ccf : a5 44 __ LDA T6 + 0 
0cd1 : 85 03 __ STA WORK + 0 
0cd3 : a9 00 __ LDA #$00
0cd5 : 85 04 __ STA WORK + 1 
0cd7 : 20 c4 c4 JSR $c4c4 
0cda : a5 05 __ LDA WORK + 2 
0cdc : c9 0a __ CMP #$0a
0cde : b0 04 __ BCS $0ce4 ; (nformi.s32 + 0)
.s30:
0ce0 : a9 30 __ LDA #$30
0ce2 : 90 06 __ BCC $0cea ; (nformi.s31 + 0)
.s32:
0ce4 : a0 03 __ LDY #$03
0ce6 : b1 0d __ LDA (P0),y ; (si + 0)
0ce8 : e9 0a __ SBC #$0a
.s31:
0cea : 18 __ __ CLC
0ceb : 65 05 __ ADC WORK + 2 
0ced : a6 45 __ LDX T7 + 0 
0cef : 9d e9 cf STA $cfe9,x 
0cf2 : c6 45 __ DEC T7 + 0 
0cf4 : a5 1b __ LDA ACCU + 0 
0cf6 : 05 1c __ ORA ACCU + 1 
0cf8 : d0 d5 __ BNE $0ccf ; (nformi.l29 + 0)
.s6:
0cfa : a0 02 __ LDY #$02
0cfc : b1 0d __ LDA (P0),y ; (si + 0)
0cfe : c9 ff __ CMP #$ff
0d00 : d0 04 __ BNE $0d06 ; (nformi.s27 + 0)
.s7:
0d02 : a9 0f __ LDA #$0f
0d04 : d0 05 __ BNE $0d0b ; (nformi.s39 + 0)
.s27:
0d06 : 38 __ __ SEC
0d07 : a9 10 __ LDA #$10
0d09 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0d0b : a8 __ __ TAY
0d0c : c4 45 __ CPY T7 + 0 
0d0e : b0 0d __ BCS $0d1d ; (nformi.s8 + 0)
.s26:
0d10 : a9 30 __ LDA #$30
.l40:
0d12 : a6 45 __ LDX T7 + 0 
0d14 : 9d e9 cf STA $cfe9,x 
0d17 : c6 45 __ DEC T7 + 0 
0d19 : c4 45 __ CPY T7 + 0 
0d1b : 90 f5 __ BCC $0d12 ; (nformi.l40 + 0)
.s8:
0d1d : a0 07 __ LDY #$07
0d1f : b1 0d __ LDA (P0),y ; (si + 0)
0d21 : f0 1c __ BEQ $0d3f ; (nformi.s9 + 0)
.s24:
0d23 : a5 44 __ LDA T6 + 0 
0d25 : c9 10 __ CMP #$10
0d27 : d0 16 __ BNE $0d3f ; (nformi.s9 + 0)
.s25:
0d29 : a0 03 __ LDY #$03
0d2b : b1 0d __ LDA (P0),y ; (si + 0)
0d2d : a8 __ __ TAY
0d2e : a9 30 __ LDA #$30
0d30 : a6 45 __ LDX T7 + 0 
0d32 : ca __ __ DEX
0d33 : ca __ __ DEX
0d34 : 86 45 __ STX T7 + 0 
0d36 : 9d ea cf STA $cfea,x 
0d39 : 98 __ __ TYA
0d3a : 69 16 __ ADC #$16
0d3c : 9d eb cf STA $cfeb,x 
.s9:
0d3f : a9 00 __ LDA #$00
0d41 : 85 1b __ STA ACCU + 0 
0d43 : a5 43 __ LDA T5 + 0 
0d45 : f0 0c __ BEQ $0d53 ; (nformi.s10 + 0)
.s23:
0d47 : a9 2d __ LDA #$2d
.s22:
0d49 : a6 45 __ LDX T7 + 0 
0d4b : 9d e9 cf STA $cfe9,x 
0d4e : c6 45 __ DEC T7 + 0 
0d50 : 4c 5d c4 JMP $c45d 
.s10:
0d53 : a0 05 __ LDY #$05
0d55 : b1 0d __ LDA (P0),y ; (si + 0)
0d57 : f0 04 __ BEQ $0d5d ; (nformi.s11 + 0)
.s21:
0d59 : a9 2b __ LDA #$2b
0d5b : d0 ec __ BNE $0d49 ; (nformi.s22 + 0)
.s11:
0d5d : a6 45 __ LDX T7 + 0 
0d5f : a0 06 __ LDY #$06
0d61 : b1 0d __ LDA (P0),y ; (si + 0)
0d63 : d0 2b __ BNE $0d90 ; (nformi.s17 + 0)
.l12:
0d65 : 8a __ __ TXA
0d66 : 18 __ __ CLC
0d67 : a0 01 __ LDY #$01
0d69 : 71 0d __ ADC (P0),y ; (si + 0)
0d6b : b0 04 __ BCS $0d71 ; (nformi.s15 + 0)
.s16:
0d6d : c9 11 __ CMP #$11
0d6f : 90 0a __ BCC $0d7b ; (nformi.s13 + 0)
.s15:
0d71 : a0 00 __ LDY #$00
0d73 : b1 0d __ LDA (P0),y ; (si + 0)
0d75 : 9d e9 cf STA $cfe9,x 
0d78 : ca __ __ DEX
0d79 : b0 ea __ BCS $0d65 ; (nformi.l12 + 0)
.s13:
0d7b : e0 10 __ CPX #$10
0d7d : b0 0e __ BCS $0d8d ; (nformi.s41 + 0)
.s14:
0d7f : 88 __ __ DEY
.l37:
0d80 : bd ea cf LDA $cfea,x 
0d83 : 91 0f __ STA (P2),y ; (str + 0)
0d85 : c8 __ __ INY
0d86 : e8 __ __ INX
0d87 : e0 10 __ CPX #$10
0d89 : 90 f5 __ BCC $0d80 ; (nformi.l37 + 0)
.s38:
0d8b : 84 1b __ STY ACCU + 0 
.s41:
0d8d : a5 1b __ LDA ACCU + 0 
.s3:
0d8f : 60 __ __ RTS
.s17:
0d90 : e0 10 __ CPX #$10
0d92 : b0 1a __ BCS $0dae ; (nformi.l18 + 0)
.s20:
0d94 : a0 00 __ LDY #$00
.l35:
0d96 : bd ea cf LDA $cfea,x 
0d99 : 91 0f __ STA (P2),y ; (str + 0)
0d9b : c8 __ __ INY
0d9c : e8 __ __ INX
0d9d : e0 10 __ CPX #$10
0d9f : 90 f5 __ BCC $0d96 ; (nformi.l35 + 0)
.s36:
0da1 : 84 1b __ STY ACCU + 0 
0da3 : b0 09 __ BCS $0dae ; (nformi.l18 + 0)
.s19:
0da5 : 88 __ __ DEY
0da6 : b1 0d __ LDA (P0),y ; (si + 0)
0da8 : a4 1b __ LDY ACCU + 0 
0daa : 91 0f __ STA (P2),y ; (str + 0)
0dac : e6 1b __ INC ACCU + 0 
.l18:
0dae : a5 1b __ LDA ACCU + 0 
0db0 : a0 01 __ LDY #$01
0db2 : d1 0d __ CMP (P0),y ; (si + 0)
0db4 : 90 ef __ BCC $0da5 ; (nformi.s19 + 0)
0db6 : 60 __ __ RTS
--------------------------------------------------------------------
0db7 : __ __ __ BYT c8 45 4c 4c 4f 20 d7 4f 52 4c 44 0a 00          : .ELLO .ORLD..
--------------------------------------------------------------------
divmod: ; divmod
0dc4 : a5 1c __ LDA ACCU + 1 
0dc6 : d0 31 __ BNE $0df9 ; (divmod + 53)
0dc8 : a5 04 __ LDA WORK + 1 
0dca : d0 1e __ BNE $0dea ; (divmod + 38)
0dcc : 85 06 __ STA WORK + 3 
0dce : a2 04 __ LDX #$04
0dd0 : 06 1b __ ASL ACCU + 0 
0dd2 : 2a __ __ ROL
0dd3 : c5 03 __ CMP WORK + 0 
0dd5 : 90 02 __ BCC $0dd9 ; (divmod + 21)
0dd7 : e5 03 __ SBC WORK + 0 
0dd9 : 26 1b __ ROL ACCU + 0 
0ddb : 2a __ __ ROL
0ddc : c5 03 __ CMP WORK + 0 
0dde : 90 02 __ BCC $0de2 ; (divmod + 30)
0de0 : e5 03 __ SBC WORK + 0 
0de2 : 26 1b __ ROL ACCU + 0 
0de4 : ca __ __ DEX
0de5 : d0 eb __ BNE $0dd2 ; (divmod + 14)
0de7 : 85 05 __ STA WORK + 2 
0de9 : 60 __ __ RTS
0dea : a5 1b __ LDA ACCU + 0 
0dec : 85 05 __ STA WORK + 2 
0dee : a5 1c __ LDA ACCU + 1 
0df0 : 85 06 __ STA WORK + 3 
0df2 : a9 00 __ LDA #$00
0df4 : 85 1b __ STA ACCU + 0 
0df6 : 85 1c __ STA ACCU + 1 
0df8 : 60 __ __ RTS
0df9 : a5 04 __ LDA WORK + 1 
0dfb : d0 1f __ BNE $0e1c ; (divmod + 88)
0dfd : a5 03 __ LDA WORK + 0 
0dff : 30 1b __ BMI $0e1c ; (divmod + 88)
0e01 : a9 00 __ LDA #$00
0e03 : 85 06 __ STA WORK + 3 
0e05 : a2 10 __ LDX #$10
0e07 : 06 1b __ ASL ACCU + 0 
0e09 : 26 1c __ ROL ACCU + 1 
0e0b : 2a __ __ ROL
0e0c : c5 03 __ CMP WORK + 0 
0e0e : 90 02 __ BCC $0e12 ; (divmod + 78)
0e10 : e5 03 __ SBC WORK + 0 
0e12 : 26 1b __ ROL ACCU + 0 
0e14 : 26 1c __ ROL ACCU + 1 
0e16 : ca __ __ DEX
0e17 : d0 f2 __ BNE $0e0b ; (divmod + 71)
0e19 : 85 05 __ STA WORK + 2 
0e1b : 60 __ __ RTS
0e1c : a9 00 __ LDA #$00
0e1e : 85 05 __ STA WORK + 2 
0e20 : 85 06 __ STA WORK + 3 
0e22 : 84 02 __ STY $02 
0e24 : a0 10 __ LDY #$10
0e26 : 18 __ __ CLC
0e27 : 26 1b __ ROL ACCU + 0 
0e29 : 26 1c __ ROL ACCU + 1 
0e2b : 26 05 __ ROL WORK + 2 
0e2d : 26 06 __ ROL WORK + 3 
0e2f : 38 __ __ SEC
0e30 : a5 05 __ LDA WORK + 2 
0e32 : e5 03 __ SBC WORK + 0 
0e34 : aa __ __ TAX
0e35 : a5 06 __ LDA WORK + 3 
0e37 : e5 04 __ SBC WORK + 1 
0e39 : 90 04 __ BCC $0e3f ; (divmod + 123)
0e3b : 86 05 __ STX WORK + 2 
0e3d : 85 06 __ STA WORK + 3 
0e3f : 88 __ __ DEY
0e40 : d0 e5 __ BNE $0e27 ; (divmod + 99)
0e42 : 26 1b __ ROL ACCU + 0 
0e44 : 26 1c __ ROL ACCU + 1 
0e46 : a4 02 __ LDY $02 
0e48 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0e49 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
0e4a : __ __ __ BYT 01                                              : .
