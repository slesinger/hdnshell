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
080e : 8e 5e 1a STX $1a5e ; (spentry + 0)
0811 : a2 1a __ LDX #$1a
0813 : a0 7c __ LDY #$7c
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1a __ CPX #$1a
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 7c __ CPY #$7c
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 9e __ LDA #$9e
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
;   9, "/home/honza/projects/c64/projects/hdnsh/oscar/projects/untitled/untitled.c"
.s4:
0880 : a9 04 __ LDA #$04
0882 : 8d 20 d0 STA $d020 
0885 : a9 50 __ LDA #$50
0887 : 8d fc 9f STA $9ffc ; (sstack + 8)
088a : a9 15 __ LDA #$15
088c : 8d fd 9f STA $9ffd ; (sstack + 9)
088f : 20 99 08 JSR $0899 ; (printf.s4 + 0)
0892 : a9 00 __ LDA #$00
0894 : 85 1b __ STA ACCU + 0 
0896 : 85 1c __ STA ACCU + 1 
.s3:
0898 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.h"
.s4:
0899 : a9 01 __ LDA #$01
089b : 8d fb 9f STA $9ffb ; (sstack + 7)
089e : a9 a0 __ LDA #$a0
08a0 : 8d f5 9f STA $9ff5 ; (sstack + 1)
08a3 : a9 9f __ LDA #$9f
08a5 : 8d f6 9f STA $9ff6 ; (sstack + 2)
08a8 : ad fc 9f LDA $9ffc ; (sstack + 8)
08ab : 8d f7 9f STA $9ff7 ; (sstack + 3)
08ae : ad fd 9f LDA $9ffd ; (sstack + 9)
08b1 : 8d f8 9f STA $9ff8 ; (sstack + 4)
08b4 : a9 fe __ LDA #$fe
08b6 : 8d f9 9f STA $9ff9 ; (sstack + 5)
08b9 : a9 9f __ LDA #$9f
08bb : 8d fa 9f STA $9ffa ; (sstack + 6)
08be : 4c c1 08 JMP $08c1 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s1:
08c1 : a2 09 __ LDX #$09
08c3 : b5 53 __ LDA T1 + 0,x 
08c5 : 9d d2 9f STA $9fd2,x ; (sformat@stack + 0)
08c8 : ca __ __ DEX
08c9 : 10 f8 __ BPL $08c3 ; (sformat.s1 + 2)
.s4:
08cb : ad f7 9f LDA $9ff7 ; (sstack + 3)
08ce : 85 55 __ STA T3 + 0 
08d0 : a9 00 __ LDA #$00
08d2 : 85 5b __ STA T6 + 0 
08d4 : ad f8 9f LDA $9ff8 ; (sstack + 4)
08d7 : 85 56 __ STA T3 + 1 
08d9 : ad f5 9f LDA $9ff5 ; (sstack + 1)
08dc : 85 57 __ STA T4 + 0 
08de : ad f6 9f LDA $9ff6 ; (sstack + 2)
08e1 : 85 58 __ STA T4 + 1 
.l5:
08e3 : a0 00 __ LDY #$00
08e5 : b1 55 __ LDA (T3 + 0),y 
08e7 : d0 36 __ BNE $091f ; (sformat.s10 + 0)
.s6:
08e9 : a4 5b __ LDY T6 + 0 
08eb : 91 57 __ STA (T4 + 0),y 
08ed : 98 __ __ TYA
08ee : f0 28 __ BEQ $0918 ; (sformat.s95 + 0)
.s7:
08f0 : ad fb 9f LDA $9ffb ; (sstack + 7)
08f3 : d0 18 __ BNE $090d ; (sformat.s9 + 0)
.s8:
08f5 : 98 __ __ TYA
08f6 : 18 __ __ CLC
08f7 : 65 57 __ ADC T4 + 0 
08f9 : aa __ __ TAX
08fa : a5 58 __ LDA T4 + 1 
08fc : 69 00 __ ADC #$00
.s3:
08fe : 86 1b __ STX ACCU + 0 ; (buff + 1)
0900 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0902 : a2 09 __ LDX #$09
0904 : bd d2 9f LDA $9fd2,x ; (sformat@stack + 0)
0907 : 95 53 __ STA T1 + 0,x 
0909 : ca __ __ DEX
090a : 10 f8 __ BPL $0904 ; (sformat.s3 + 6)
090c : 60 __ __ RTS
.s9:
090d : a5 57 __ LDA T4 + 0 
090f : 85 0e __ STA P1 
0911 : a5 58 __ LDA T4 + 1 
0913 : 85 0f __ STA P2 
0915 : 20 02 0d JSR $0d02 ; (puts.l4 + 0)
.s95:
0918 : a5 58 __ LDA T4 + 1 
091a : a6 57 __ LDX T4 + 0 
091c : 4c fe 08 JMP $08fe ; (sformat.s3 + 0)
.s10:
091f : c9 25 __ CMP #$25
0921 : f0 3e __ BEQ $0961 ; (sformat.s15 + 0)
.s11:
0923 : a4 5b __ LDY T6 + 0 
0925 : 91 57 __ STA (T4 + 0),y 
0927 : e6 55 __ INC T3 + 0 
0929 : d0 02 __ BNE $092d ; (sformat.s117 + 0)
.s116:
092b : e6 56 __ INC T3 + 1 
.s117:
092d : c8 __ __ INY
092e : 84 5b __ STY T6 + 0 
0930 : 98 __ __ TYA
0931 : c0 28 __ CPY #$28
0933 : 90 ae __ BCC $08e3 ; (sformat.l5 + 0)
.s12:
0935 : 85 43 __ STA T0 + 0 
0937 : a9 00 __ LDA #$00
0939 : 85 5b __ STA T6 + 0 
093b : ad fb 9f LDA $9ffb ; (sstack + 7)
093e : f0 14 __ BEQ $0954 ; (sformat.s13 + 0)
.s14:
0940 : a5 57 __ LDA T4 + 0 
0942 : 85 0e __ STA P1 
0944 : a5 58 __ LDA T4 + 1 
0946 : 85 0f __ STA P2 
0948 : a9 00 __ LDA #$00
094a : a4 43 __ LDY T0 + 0 
094c : 91 0e __ STA (P1),y 
094e : 20 02 0d JSR $0d02 ; (puts.l4 + 0)
0951 : 4c e3 08 JMP $08e3 ; (sformat.l5 + 0)
.s13:
0954 : 18 __ __ CLC
0955 : a5 57 __ LDA T4 + 0 
0957 : 65 43 __ ADC T0 + 0 
0959 : 85 57 __ STA T4 + 0 
095b : 90 86 __ BCC $08e3 ; (sformat.l5 + 0)
.s118:
095d : e6 58 __ INC T4 + 1 
095f : b0 82 __ BCS $08e3 ; (sformat.l5 + 0)
.s15:
0961 : a5 5b __ LDA T6 + 0 
0963 : f0 27 __ BEQ $098c ; (sformat.s16 + 0)
.s89:
0965 : 84 5b __ STY T6 + 0 
0967 : 85 43 __ STA T0 + 0 
0969 : ad fb 9f LDA $9ffb ; (sstack + 7)
096c : f0 13 __ BEQ $0981 ; (sformat.s90 + 0)
.s91:
096e : a5 57 __ LDA T4 + 0 
0970 : 85 0e __ STA P1 
0972 : a5 58 __ LDA T4 + 1 
0974 : 85 0f __ STA P2 
0976 : 98 __ __ TYA
0977 : a4 43 __ LDY T0 + 0 
0979 : 91 0e __ STA (P1),y 
097b : 20 02 0d JSR $0d02 ; (puts.l4 + 0)
097e : 4c 8c 09 JMP $098c ; (sformat.s16 + 0)
.s90:
0981 : 18 __ __ CLC
0982 : a5 57 __ LDA T4 + 0 
0984 : 65 43 __ ADC T0 + 0 
0986 : 85 57 __ STA T4 + 0 
0988 : 90 02 __ BCC $098c ; (sformat.s16 + 0)
.s115:
098a : e6 58 __ INC T4 + 1 
.s16:
098c : a9 00 __ LDA #$00
098e : 8d e1 9f STA $9fe1 ; (si.sign + 0)
0991 : 8d e2 9f STA $9fe2 ; (si.left + 0)
0994 : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
0997 : a0 01 __ LDY #$01
0999 : b1 55 __ LDA (T3 + 0),y 
099b : a2 20 __ LDX #$20
099d : 8e dc 9f STX $9fdc ; (si.fill + 0)
09a0 : a2 00 __ LDX #$00
09a2 : 8e dd 9f STX $9fdd ; (si.width + 0)
09a5 : ca __ __ DEX
09a6 : 8e de 9f STX $9fde ; (si.precision + 0)
09a9 : a2 0a __ LDX #$0a
09ab : 8e e0 9f STX $9fe0 ; (si.base + 0)
09ae : aa __ __ TAX
09af : a9 02 __ LDA #$02
09b1 : d0 07 __ BNE $09ba ; (sformat.l17 + 0)
.s85:
09b3 : a0 00 __ LDY #$00
09b5 : b1 55 __ LDA (T3 + 0),y 
09b7 : aa __ __ TAX
09b8 : a9 01 __ LDA #$01
.l17:
09ba : 18 __ __ CLC
09bb : 65 55 __ ADC T3 + 0 
09bd : 85 55 __ STA T3 + 0 
09bf : 90 02 __ BCC $09c3 ; (sformat.s106 + 0)
.s105:
09c1 : e6 56 __ INC T3 + 1 
.s106:
09c3 : 8a __ __ TXA
09c4 : e0 2b __ CPX #$2b
09c6 : d0 07 __ BNE $09cf ; (sformat.s18 + 0)
.s88:
09c8 : a9 01 __ LDA #$01
09ca : 8d e1 9f STA $9fe1 ; (si.sign + 0)
09cd : d0 e4 __ BNE $09b3 ; (sformat.s85 + 0)
.s18:
09cf : c9 30 __ CMP #$30
09d1 : d0 06 __ BNE $09d9 ; (sformat.s19 + 0)
.s87:
09d3 : 8d dc 9f STA $9fdc ; (si.fill + 0)
09d6 : 4c b3 09 JMP $09b3 ; (sformat.s85 + 0)
.s19:
09d9 : c9 23 __ CMP #$23
09db : d0 07 __ BNE $09e4 ; (sformat.s20 + 0)
.s86:
09dd : a9 01 __ LDA #$01
09df : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
09e2 : d0 cf __ BNE $09b3 ; (sformat.s85 + 0)
.s20:
09e4 : c9 2d __ CMP #$2d
09e6 : d0 07 __ BNE $09ef ; (sformat.s21 + 0)
.s84:
09e8 : a9 01 __ LDA #$01
09ea : 8d e2 9f STA $9fe2 ; (si.left + 0)
09ed : d0 c4 __ BNE $09b3 ; (sformat.s85 + 0)
.s21:
09ef : 85 47 __ STA T2 + 0 
09f1 : c9 30 __ CMP #$30
09f3 : 90 3c __ BCC $0a31 ; (sformat.s22 + 0)
.s80:
09f5 : c9 3a __ CMP #$3a
09f7 : b0 77 __ BCS $0a70 ; (sformat.s23 + 0)
.s81:
09f9 : a9 00 __ LDA #$00
09fb : 85 53 __ STA T1 + 0 
.l82:
09fd : a5 53 __ LDA T1 + 0 
09ff : 0a __ __ ASL
0a00 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0a02 : a9 00 __ LDA #$00
0a04 : 2a __ __ ROL
0a05 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0a07 : 2a __ __ ROL
0a08 : aa __ __ TAX
0a09 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0a0b : 65 53 __ ADC T1 + 0 
0a0d : 0a __ __ ASL
0a0e : 18 __ __ CLC
0a0f : 65 47 __ ADC T2 + 0 
0a11 : 38 __ __ SEC
0a12 : e9 30 __ SBC #$30
0a14 : 85 53 __ STA T1 + 0 
0a16 : a0 00 __ LDY #$00
0a18 : b1 55 __ LDA (T3 + 0),y 
0a1a : 85 47 __ STA T2 + 0 
0a1c : e6 55 __ INC T3 + 0 
0a1e : d0 02 __ BNE $0a22 ; (sformat.s114 + 0)
.s113:
0a20 : e6 56 __ INC T3 + 1 
.s114:
0a22 : c9 30 __ CMP #$30
0a24 : 90 04 __ BCC $0a2a ; (sformat.s104 + 0)
.s83:
0a26 : c9 3a __ CMP #$3a
0a28 : 90 d3 __ BCC $09fd ; (sformat.l82 + 0)
.s104:
0a2a : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0a2c : a6 53 __ LDX T1 + 0 
0a2e : 8e dd 9f STX $9fdd ; (si.width + 0)
.s22:
0a31 : c9 2e __ CMP #$2e
0a33 : d0 3b __ BNE $0a70 ; (sformat.s23 + 0)
.s76:
0a35 : a9 00 __ LDA #$00
0a37 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0a39 : 4c 53 0a JMP $0a53 ; (sformat.l77 + 0)
.s79:
0a3c : a5 43 __ LDA T0 + 0 
0a3e : 0a __ __ ASL
0a3f : 85 1b __ STA ACCU + 0 ; (buff + 1)
0a41 : 98 __ __ TYA
0a42 : 2a __ __ ROL
0a43 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0a45 : 2a __ __ ROL
0a46 : aa __ __ TAX
0a47 : 18 __ __ CLC
0a48 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0a4a : 65 43 __ ADC T0 + 0 
0a4c : 0a __ __ ASL
0a4d : 18 __ __ CLC
0a4e : 65 47 __ ADC T2 + 0 
0a50 : 38 __ __ SEC
0a51 : e9 30 __ SBC #$30
.l77:
0a53 : 85 43 __ STA T0 + 0 
0a55 : a0 00 __ LDY #$00
0a57 : b1 55 __ LDA (T3 + 0),y 
0a59 : 85 47 __ STA T2 + 0 
0a5b : e6 55 __ INC T3 + 0 
0a5d : d0 02 __ BNE $0a61 ; (sformat.s108 + 0)
.s107:
0a5f : e6 56 __ INC T3 + 1 
.s108:
0a61 : c9 30 __ CMP #$30
0a63 : 90 04 __ BCC $0a69 ; (sformat.s103 + 0)
.s78:
0a65 : c9 3a __ CMP #$3a
0a67 : 90 d3 __ BCC $0a3c ; (sformat.s79 + 0)
.s103:
0a69 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0a6b : a6 43 __ LDX T0 + 0 
0a6d : 8e de 9f STX $9fde ; (si.precision + 0)
.s23:
0a70 : c9 64 __ CMP #$64
0a72 : f0 0c __ BEQ $0a80 ; (sformat.s75 + 0)
.s24:
0a74 : c9 44 __ CMP #$44
0a76 : f0 08 __ BEQ $0a80 ; (sformat.s75 + 0)
.s25:
0a78 : c9 69 __ CMP #$69
0a7a : f0 04 __ BEQ $0a80 ; (sformat.s75 + 0)
.s26:
0a7c : c9 49 __ CMP #$49
0a7e : d0 07 __ BNE $0a87 ; (sformat.s27 + 0)
.s75:
0a80 : a9 01 __ LDA #$01
.s93:
0a82 : 85 13 __ STA P6 
0a84 : 4c c8 0c JMP $0cc8 ; (sformat.s73 + 0)
.s27:
0a87 : c9 75 __ CMP #$75
0a89 : f0 04 __ BEQ $0a8f ; (sformat.s74 + 0)
.s28:
0a8b : c9 55 __ CMP #$55
0a8d : d0 04 __ BNE $0a93 ; (sformat.s29 + 0)
.s74:
0a8f : a9 00 __ LDA #$00
0a91 : f0 ef __ BEQ $0a82 ; (sformat.s93 + 0)
.s29:
0a93 : c9 78 __ CMP #$78
0a95 : f0 04 __ BEQ $0a9b ; (sformat.s72 + 0)
.s30:
0a97 : c9 58 __ CMP #$58
0a99 : d0 15 __ BNE $0ab0 ; (sformat.s31 + 0)
.s72:
0a9b : a5 47 __ LDA T2 + 0 
0a9d : 29 e0 __ AND #$e0
0a9f : 09 01 __ ORA #$01
0aa1 : 8d df 9f STA $9fdf ; (si.cha + 0)
0aa4 : a9 00 __ LDA #$00
0aa6 : 85 13 __ STA P6 
0aa8 : a9 10 __ LDA #$10
0aaa : 8d e0 9f STA $9fe0 ; (si.base + 0)
0aad : 4c c8 0c JMP $0cc8 ; (sformat.s73 + 0)
.s31:
0ab0 : c9 6c __ CMP #$6c
0ab2 : d0 03 __ BNE $0ab7 ; (sformat.s32 + 0)
0ab4 : 4c 39 0c JMP $0c39 ; (sformat.s60 + 0)
.s32:
0ab7 : c9 4c __ CMP #$4c
0ab9 : f0 f9 __ BEQ $0ab4 ; (sformat.s31 + 4)
.s33:
0abb : c9 66 __ CMP #$66
0abd : f0 14 __ BEQ $0ad3 ; (sformat.s59 + 0)
.s34:
0abf : c9 67 __ CMP #$67
0ac1 : f0 10 __ BEQ $0ad3 ; (sformat.s59 + 0)
.s35:
0ac3 : c9 65 __ CMP #$65
0ac5 : f0 0c __ BEQ $0ad3 ; (sformat.s59 + 0)
.s36:
0ac7 : c9 46 __ CMP #$46
0ac9 : f0 08 __ BEQ $0ad3 ; (sformat.s59 + 0)
.s37:
0acb : c9 47 __ CMP #$47
0acd : f0 04 __ BEQ $0ad3 ; (sformat.s59 + 0)
.s38:
0acf : c9 45 __ CMP #$45
0ad1 : d0 5c __ BNE $0b2f ; (sformat.s39 + 0)
.s59:
0ad3 : a5 57 __ LDA T4 + 0 
0ad5 : 85 13 __ STA P6 
0ad7 : a5 58 __ LDA T4 + 1 
0ad9 : 85 14 __ STA P7 
0adb : a5 47 __ LDA T2 + 0 
0add : 29 e0 __ AND #$e0
0adf : 09 01 __ ORA #$01
0ae1 : 8d df 9f STA $9fdf ; (si.cha + 0)
0ae4 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0ae7 : 85 59 __ STA T5 + 0 
0ae9 : a9 dc __ LDA #$dc
0aeb : 85 11 __ STA P4 
0aed : a9 9f __ LDA #$9f
0aef : 85 12 __ STA P5 
0af1 : ad fa 9f LDA $9ffa ; (sstack + 6)
0af4 : 85 5a __ STA T5 + 1 
0af6 : a0 00 __ LDY #$00
0af8 : b1 59 __ LDA (T5 + 0),y 
0afa : 85 15 __ STA P8 
0afc : c8 __ __ INY
0afd : b1 59 __ LDA (T5 + 0),y 
0aff : 85 16 __ STA P9 
0b01 : c8 __ __ INY
0b02 : b1 59 __ LDA (T5 + 0),y 
0b04 : 85 17 __ STA P10 
0b06 : c8 __ __ INY
0b07 : b1 59 __ LDA (T5 + 0),y 
0b09 : 85 18 __ STA P11 
0b0b : a5 47 __ LDA T2 + 0 
0b0d : ed df 9f SBC $9fdf ; (si.cha + 0)
0b10 : 18 __ __ CLC
0b11 : 69 61 __ ADC #$61
0b13 : 8d f4 9f STA $9ff4 ; (sstack + 0)
0b16 : 20 dd 0f JSR $0fdd ; (nformf.s1 + 0)
0b19 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b1b : 85 5b __ STA T6 + 0 
0b1d : 18 __ __ CLC
0b1e : a5 59 __ LDA T5 + 0 
0b20 : 69 04 __ ADC #$04
0b22 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0b25 : a5 5a __ LDA T5 + 1 
0b27 : 69 00 __ ADC #$00
0b29 : 8d fa 9f STA $9ffa ; (sstack + 6)
0b2c : 4c e3 08 JMP $08e3 ; (sformat.l5 + 0)
.s39:
0b2f : c9 73 __ CMP #$73
0b31 : f0 3b __ BEQ $0b6e ; (sformat.s47 + 0)
.s40:
0b33 : c9 53 __ CMP #$53
0b35 : f0 37 __ BEQ $0b6e ; (sformat.s47 + 0)
.s41:
0b37 : c9 63 __ CMP #$63
0b39 : f0 12 __ BEQ $0b4d ; (sformat.s46 + 0)
.s42:
0b3b : c9 43 __ CMP #$43
0b3d : f0 0e __ BEQ $0b4d ; (sformat.s46 + 0)
.s43:
0b3f : aa __ __ TAX
0b40 : f0 ea __ BEQ $0b2c ; (sformat.s59 + 89)
.s44:
0b42 : a0 00 __ LDY #$00
0b44 : 91 57 __ STA (T4 + 0),y 
.s45:
0b46 : a9 01 __ LDA #$01
.s96:
0b48 : 85 5b __ STA T6 + 0 
0b4a : 4c e3 08 JMP $08e3 ; (sformat.l5 + 0)
.s46:
0b4d : ad f9 9f LDA $9ff9 ; (sstack + 5)
0b50 : 85 43 __ STA T0 + 0 
0b52 : ad fa 9f LDA $9ffa ; (sstack + 6)
0b55 : 85 44 __ STA T0 + 1 
0b57 : a0 00 __ LDY #$00
0b59 : b1 43 __ LDA (T0 + 0),y 
0b5b : 91 57 __ STA (T4 + 0),y 
0b5d : a5 43 __ LDA T0 + 0 
0b5f : 69 01 __ ADC #$01
0b61 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0b64 : a5 44 __ LDA T0 + 1 
0b66 : 69 00 __ ADC #$00
0b68 : 8d fa 9f STA $9ffa ; (sstack + 6)
0b6b : 4c 46 0b JMP $0b46 ; (sformat.s45 + 0)
.s47:
0b6e : ad f9 9f LDA $9ff9 ; (sstack + 5)
0b71 : 85 43 __ STA T0 + 0 
0b73 : 69 01 __ ADC #$01
0b75 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0b78 : ad fa 9f LDA $9ffa ; (sstack + 6)
0b7b : 85 44 __ STA T0 + 1 
0b7d : 69 00 __ ADC #$00
0b7f : 8d fa 9f STA $9ffa ; (sstack + 6)
0b82 : a0 00 __ LDY #$00
0b84 : 84 5c __ STY T7 + 0 
0b86 : b1 43 __ LDA (T0 + 0),y 
0b88 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0b8a : 85 53 __ STA T1 + 0 
0b8c : c8 __ __ INY
0b8d : b1 43 __ LDA (T0 + 0),y 
0b8f : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0b91 : 85 54 __ STA T1 + 1 
0b93 : ad dd 9f LDA $9fdd ; (si.width + 0)
0b96 : f0 0c __ BEQ $0ba4 ; (sformat.s48 + 0)
.s100:
0b98 : 88 __ __ DEY
0b99 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0b9b : f0 05 __ BEQ $0ba2 ; (sformat.s101 + 0)
.l58:
0b9d : c8 __ __ INY
0b9e : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0ba0 : d0 fb __ BNE $0b9d ; (sformat.l58 + 0)
.s101:
0ba2 : 84 5c __ STY T7 + 0 
.s48:
0ba4 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0ba7 : 85 59 __ STA T5 + 0 
0ba9 : d0 19 __ BNE $0bc4 ; (sformat.s49 + 0)
.s98:
0bab : a6 5c __ LDX T7 + 0 
0bad : ec dd 9f CPX $9fdd ; (si.width + 0)
0bb0 : a0 00 __ LDY #$00
0bb2 : b0 0c __ BCS $0bc0 ; (sformat.s99 + 0)
.l57:
0bb4 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0bb7 : 91 57 __ STA (T4 + 0),y 
0bb9 : c8 __ __ INY
0bba : e8 __ __ INX
0bbb : ec dd 9f CPX $9fdd ; (si.width + 0)
0bbe : 90 f4 __ BCC $0bb4 ; (sformat.l57 + 0)
.s99:
0bc0 : 86 5c __ STX T7 + 0 
0bc2 : 84 5b __ STY T6 + 0 
.s49:
0bc4 : ac fb 9f LDY $9ffb ; (sstack + 7)
0bc7 : d0 48 __ BNE $0c11 ; (sformat.s54 + 0)
.s50:
0bc9 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0bcb : f0 23 __ BEQ $0bf0 ; (sformat.s51 + 0)
.s53:
0bcd : 18 __ __ CLC
0bce : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0bd0 : 69 01 __ ADC #$01
0bd2 : 85 43 __ STA T0 + 0 
0bd4 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0bd6 : 69 00 __ ADC #$00
0bd8 : 85 44 __ STA T0 + 1 
0bda : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0bdc : a4 5b __ LDY T6 + 0 
0bde : 91 57 __ STA (T4 + 0),y 
0be0 : e6 5b __ INC T6 + 0 
0be2 : a0 00 __ LDY #$00
0be4 : b1 43 __ LDA (T0 + 0),y 
0be6 : a8 __ __ TAY
0be7 : e6 43 __ INC T0 + 0 
0be9 : d0 02 __ BNE $0bed ; (sformat.s112 + 0)
.s111:
0beb : e6 44 __ INC T0 + 1 
.s112:
0bed : 98 __ __ TYA
0bee : d0 ec __ BNE $0bdc ; (sformat.l92 + 0)
.s51:
0bf0 : a5 59 __ LDA T5 + 0 
0bf2 : d0 03 __ BNE $0bf7 ; (sformat.s97 + 0)
0bf4 : 4c e3 08 JMP $08e3 ; (sformat.l5 + 0)
.s97:
0bf7 : a6 5c __ LDX T7 + 0 
0bf9 : ec dd 9f CPX $9fdd ; (si.width + 0)
0bfc : a4 5b __ LDY T6 + 0 
0bfe : b0 0c __ BCS $0c0c ; (sformat.s102 + 0)
.l52:
0c00 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0c03 : 91 57 __ STA (T4 + 0),y 
0c05 : c8 __ __ INY
0c06 : e8 __ __ INX
0c07 : ec dd 9f CPX $9fdd ; (si.width + 0)
0c0a : 90 f4 __ BCC $0c00 ; (sformat.l52 + 0)
.s102:
0c0c : 84 5b __ STY T6 + 0 
0c0e : 4c e3 08 JMP $08e3 ; (sformat.l5 + 0)
.s54:
0c11 : a4 5b __ LDY T6 + 0 
0c13 : f0 11 __ BEQ $0c26 ; (sformat.s55 + 0)
.s56:
0c15 : a5 57 __ LDA T4 + 0 
0c17 : 85 0e __ STA P1 
0c19 : a5 58 __ LDA T4 + 1 
0c1b : 85 0f __ STA P2 
0c1d : a9 00 __ LDA #$00
0c1f : 85 5b __ STA T6 + 0 
0c21 : 91 0e __ STA (P1),y 
0c23 : 20 02 0d JSR $0d02 ; (puts.l4 + 0)
.s55:
0c26 : a5 53 __ LDA T1 + 0 
0c28 : 85 0e __ STA P1 
0c2a : a5 54 __ LDA T1 + 1 
0c2c : 85 0f __ STA P2 
0c2e : 20 02 0d JSR $0d02 ; (puts.l4 + 0)
0c31 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0c34 : d0 c1 __ BNE $0bf7 ; (sformat.s97 + 0)
0c36 : 4c e3 08 JMP $08e3 ; (sformat.l5 + 0)
.s60:
0c39 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0c3c : 85 43 __ STA T0 + 0 
0c3e : 69 03 __ ADC #$03
0c40 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0c43 : ad fa 9f LDA $9ffa ; (sstack + 6)
0c46 : 85 44 __ STA T0 + 1 
0c48 : 69 00 __ ADC #$00
0c4a : 8d fa 9f STA $9ffa ; (sstack + 6)
0c4d : a0 00 __ LDY #$00
0c4f : b1 55 __ LDA (T3 + 0),y 
0c51 : aa __ __ TAX
0c52 : e6 55 __ INC T3 + 0 
0c54 : d0 02 __ BNE $0c58 ; (sformat.s110 + 0)
.s109:
0c56 : e6 56 __ INC T3 + 1 
.s110:
0c58 : b1 43 __ LDA (T0 + 0),y 
0c5a : 85 1b __ STA ACCU + 0 ; (buff + 1)
0c5c : 85 11 __ STA P4 
0c5e : a0 01 __ LDY #$01
0c60 : b1 43 __ LDA (T0 + 0),y 
0c62 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0c64 : 85 12 __ STA P5 
0c66 : c8 __ __ INY
0c67 : b1 43 __ LDA (T0 + 0),y 
0c69 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0c6b : 85 13 __ STA P6 
0c6d : c8 __ __ INY
0c6e : b1 43 __ LDA (T0 + 0),y 
0c70 : 85 14 __ STA P7 
0c72 : e0 64 __ CPX #$64
0c74 : f0 0c __ BEQ $0c82 ; (sformat.s71 + 0)
.s61:
0c76 : e0 44 __ CPX #$44
0c78 : f0 08 __ BEQ $0c82 ; (sformat.s71 + 0)
.s62:
0c7a : e0 69 __ CPX #$69
0c7c : f0 04 __ BEQ $0c82 ; (sformat.s71 + 0)
.s63:
0c7e : e0 49 __ CPX #$49
0c80 : d0 1c __ BNE $0c9e ; (sformat.s64 + 0)
.s71:
0c82 : a9 01 __ LDA #$01
.s94:
0c84 : 85 15 __ STA P8 
.s69:
0c86 : a5 57 __ LDA T4 + 0 
0c88 : 85 0f __ STA P2 
0c8a : a5 58 __ LDA T4 + 1 
0c8c : 85 10 __ STA P3 
0c8e : a9 dc __ LDA #$dc
0c90 : 85 0d __ STA P0 
0c92 : a9 9f __ LDA #$9f
0c94 : 85 0e __ STA P1 
0c96 : 20 93 0e JSR $0e93 ; (nforml.s4 + 0)
0c99 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c9b : 4c 48 0b JMP $0b48 ; (sformat.s96 + 0)
.s64:
0c9e : e0 75 __ CPX #$75
0ca0 : f0 04 __ BEQ $0ca6 ; (sformat.s70 + 0)
.s65:
0ca2 : e0 55 __ CPX #$55
0ca4 : d0 04 __ BNE $0caa ; (sformat.s66 + 0)
.s70:
0ca6 : a9 00 __ LDA #$00
0ca8 : f0 da __ BEQ $0c84 ; (sformat.s94 + 0)
.s66:
0caa : e0 78 __ CPX #$78
0cac : f0 06 __ BEQ $0cb4 ; (sformat.s68 + 0)
.s67:
0cae : 85 1e __ STA ACCU + 3 ; (fps + 0)
0cb0 : e0 58 __ CPX #$58
0cb2 : d0 82 __ BNE $0c36 ; (sformat.s55 + 16)
.s68:
0cb4 : a9 00 __ LDA #$00
0cb6 : 85 15 __ STA P8 
0cb8 : a9 10 __ LDA #$10
0cba : 8d e0 9f STA $9fe0 ; (si.base + 0)
0cbd : 8a __ __ TXA
0cbe : 29 e0 __ AND #$e0
0cc0 : 09 01 __ ORA #$01
0cc2 : 8d df 9f STA $9fdf ; (si.cha + 0)
0cc5 : 4c 86 0c JMP $0c86 ; (sformat.s69 + 0)
.s73:
0cc8 : a5 57 __ LDA T4 + 0 
0cca : 85 0f __ STA P2 
0ccc : a5 58 __ LDA T4 + 1 
0cce : 85 10 __ STA P3 
0cd0 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0cd3 : 85 43 __ STA T0 + 0 
0cd5 : ad fa 9f LDA $9ffa ; (sstack + 6)
0cd8 : 85 44 __ STA T0 + 1 
0cda : a0 00 __ LDY #$00
0cdc : b1 43 __ LDA (T0 + 0),y 
0cde : 85 11 __ STA P4 
0ce0 : c8 __ __ INY
0ce1 : b1 43 __ LDA (T0 + 0),y 
0ce3 : 85 12 __ STA P5 
0ce5 : 18 __ __ CLC
0ce6 : a5 43 __ LDA T0 + 0 
0ce8 : 69 02 __ ADC #$02
0cea : 8d f9 9f STA $9ff9 ; (sstack + 5)
0ced : a5 44 __ LDA T0 + 1 
0cef : 69 00 __ ADC #$00
0cf1 : 8d fa 9f STA $9ffa ; (sstack + 6)
0cf4 : a9 dc __ LDA #$dc
0cf6 : 85 0d __ STA P0 
0cf8 : a9 9f __ LDA #$9f
0cfa : 85 0e __ STA P1 
0cfc : 20 78 0d JSR $0d78 ; (nformi.s4 + 0)
0cff : 4c 48 0b JMP $0b48 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.h"
.l4:
0d02 : a0 00 __ LDY #$00
0d04 : b1 0e __ LDA (P1),y ; (str + 0)
0d06 : d0 01 __ BNE $0d09 ; (puts.s5 + 0)
.s3:
0d08 : 60 __ __ RTS
.s5:
0d09 : e6 0e __ INC P1 ; (str + 0)
0d0b : d0 02 __ BNE $0d0f ; (puts.s7 + 0)
.s6:
0d0d : e6 0f __ INC P2 ; (str + 1)
.s7:
0d0f : 20 15 0d JSR $0d15 ; (putpch.s4 + 0)
0d12 : 4c 02 0d JMP $0d02 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/hdnsh/oscar/include/conio.h"
.s4:
0d15 : 85 0d __ STA P0 ; (c + 0)
0d17 : ad 5f 1a LDA $1a5f ; (giocharmap + 0)
0d1a : f0 32 __ BEQ $0d4e ; (putpch.s5 + 0)
.s6:
0d1c : a5 0d __ LDA P0 ; (c + 0)
0d1e : c9 0a __ CMP #$0a
0d20 : d0 04 __ BNE $0d26 ; (putpch.s7 + 0)
.s18:
0d22 : a9 0d __ LDA #$0d
0d24 : d0 32 __ BNE $0d58 ; (putpch.s15 + 0)
.s7:
0d26 : c9 09 __ CMP #$09
0d28 : f0 36 __ BEQ $0d60 ; (putpch.s16 + 0)
.s8:
0d2a : ad 5f 1a LDA $1a5f ; (giocharmap + 0)
0d2d : c9 02 __ CMP #$02
0d2f : 90 1d __ BCC $0d4e ; (putpch.s5 + 0)
.s9:
0d31 : a5 0d __ LDA P0 ; (c + 0)
0d33 : c9 41 __ CMP #$41
0d35 : 90 17 __ BCC $0d4e ; (putpch.s5 + 0)
.s10:
0d37 : c9 7b __ CMP #$7b
0d39 : b0 13 __ BCS $0d4e ; (putpch.s5 + 0)
.s11:
0d3b : c9 61 __ CMP #$61
0d3d : b0 04 __ BCS $0d43 ; (putpch.s13 + 0)
.s12:
0d3f : c9 5b __ CMP #$5b
0d41 : b0 0b __ BCS $0d4e ; (putpch.s5 + 0)
.s13:
0d43 : 49 20 __ EOR #$20
0d45 : 85 0d __ STA P0 ; (c + 0)
0d47 : ad 5f 1a LDA $1a5f ; (giocharmap + 0)
0d4a : c9 02 __ CMP #$02
0d4c : f0 06 __ BEQ $0d54 ; (putpch.s14 + 0)
.s5:
0d4e : a5 0d __ LDA P0 ; (c + 0)
0d50 : 20 d2 ff JSR $ffd2 
.s3:
0d53 : 60 __ __ RTS
.s14:
0d54 : a5 0d __ LDA P0 ; (c + 0)
0d56 : 29 5f __ AND #$5f
.s15:
0d58 : 85 43 __ STA T0 + 0 
0d5a : a5 43 __ LDA T0 + 0 
0d5c : 20 d2 ff JSR $ffd2 
0d5f : 60 __ __ RTS
.s16:
0d60 : a5 d3 __ LDA $d3 
0d62 : 29 03 __ AND #$03
0d64 : 85 43 __ STA T0 + 0 
0d66 : a9 20 __ LDA #$20
0d68 : 85 44 __ STA T1 + 0 
.l17:
0d6a : a5 44 __ LDA T1 + 0 
0d6c : 20 d2 ff JSR $ffd2 
0d6f : e6 43 __ INC T0 + 0 
0d71 : a5 43 __ LDA T0 + 0 
0d73 : c9 04 __ CMP #$04
0d75 : 90 f3 __ BCC $0d6a ; (putpch.l17 + 0)
0d77 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s4:
0d78 : a9 00 __ LDA #$00
0d7a : 85 43 __ STA T5 + 0 
0d7c : a0 04 __ LDY #$04
0d7e : b1 0d __ LDA (P0),y ; (si + 0)
0d80 : 85 44 __ STA T6 + 0 
0d82 : a5 13 __ LDA P6 ; (s + 0)
0d84 : f0 13 __ BEQ $0d99 ; (nformi.s5 + 0)
.s33:
0d86 : 24 12 __ BIT P5 ; (v + 1)
0d88 : 10 0f __ BPL $0d99 ; (nformi.s5 + 0)
.s34:
0d8a : 38 __ __ SEC
0d8b : a9 00 __ LDA #$00
0d8d : e5 11 __ SBC P4 ; (v + 0)
0d8f : 85 11 __ STA P4 ; (v + 0)
0d91 : a9 00 __ LDA #$00
0d93 : e5 12 __ SBC P5 ; (v + 1)
0d95 : 85 12 __ STA P5 ; (v + 1)
0d97 : e6 43 __ INC T5 + 0 
.s5:
0d99 : a9 10 __ LDA #$10
0d9b : 85 45 __ STA T7 + 0 
0d9d : a5 11 __ LDA P4 ; (v + 0)
0d9f : 05 12 __ ORA P5 ; (v + 1)
0da1 : f0 33 __ BEQ $0dd6 ; (nformi.s6 + 0)
.s28:
0da3 : a5 11 __ LDA P4 ; (v + 0)
0da5 : 85 1b __ STA ACCU + 0 
0da7 : a5 12 __ LDA P5 ; (v + 1)
0da9 : 85 1c __ STA ACCU + 1 
.l29:
0dab : a5 44 __ LDA T6 + 0 
0dad : 85 03 __ STA WORK + 0 
0daf : a9 00 __ LDA #$00
0db1 : 85 04 __ STA WORK + 1 
0db3 : 20 42 18 JSR $1842 ; (divmod + 0)
0db6 : a5 05 __ LDA WORK + 2 
0db8 : c9 0a __ CMP #$0a
0dba : b0 04 __ BCS $0dc0 ; (nformi.s32 + 0)
.s30:
0dbc : a9 30 __ LDA #$30
0dbe : 90 06 __ BCC $0dc6 ; (nformi.s31 + 0)
.s32:
0dc0 : a0 03 __ LDY #$03
0dc2 : b1 0d __ LDA (P0),y ; (si + 0)
0dc4 : e9 0a __ SBC #$0a
.s31:
0dc6 : 18 __ __ CLC
0dc7 : 65 05 __ ADC WORK + 2 
0dc9 : a6 45 __ LDX T7 + 0 
0dcb : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0dce : c6 45 __ DEC T7 + 0 
0dd0 : a5 1b __ LDA ACCU + 0 
0dd2 : 05 1c __ ORA ACCU + 1 
0dd4 : d0 d5 __ BNE $0dab ; (nformi.l29 + 0)
.s6:
0dd6 : a0 02 __ LDY #$02
0dd8 : b1 0d __ LDA (P0),y ; (si + 0)
0dda : c9 ff __ CMP #$ff
0ddc : d0 04 __ BNE $0de2 ; (nformi.s27 + 0)
.s7:
0dde : a9 0f __ LDA #$0f
0de0 : d0 05 __ BNE $0de7 ; (nformi.s39 + 0)
.s27:
0de2 : 38 __ __ SEC
0de3 : a9 10 __ LDA #$10
0de5 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0de7 : a8 __ __ TAY
0de8 : c4 45 __ CPY T7 + 0 
0dea : b0 0d __ BCS $0df9 ; (nformi.s8 + 0)
.s26:
0dec : a9 30 __ LDA #$30
.l40:
0dee : a6 45 __ LDX T7 + 0 
0df0 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0df3 : c6 45 __ DEC T7 + 0 
0df5 : c4 45 __ CPY T7 + 0 
0df7 : 90 f5 __ BCC $0dee ; (nformi.l40 + 0)
.s8:
0df9 : a0 07 __ LDY #$07
0dfb : b1 0d __ LDA (P0),y ; (si + 0)
0dfd : f0 1c __ BEQ $0e1b ; (nformi.s9 + 0)
.s24:
0dff : a5 44 __ LDA T6 + 0 
0e01 : c9 10 __ CMP #$10
0e03 : d0 16 __ BNE $0e1b ; (nformi.s9 + 0)
.s25:
0e05 : a0 03 __ LDY #$03
0e07 : b1 0d __ LDA (P0),y ; (si + 0)
0e09 : a8 __ __ TAY
0e0a : a9 30 __ LDA #$30
0e0c : a6 45 __ LDX T7 + 0 
0e0e : ca __ __ DEX
0e0f : ca __ __ DEX
0e10 : 86 45 __ STX T7 + 0 
0e12 : 9d e4 9f STA $9fe4,x ; (buffer[0] + 0)
0e15 : 98 __ __ TYA
0e16 : 69 16 __ ADC #$16
0e18 : 9d e5 9f STA $9fe5,x ; (buffer[0] + 1)
.s9:
0e1b : a9 00 __ LDA #$00
0e1d : 85 1b __ STA ACCU + 0 
0e1f : a5 43 __ LDA T5 + 0 
0e21 : f0 0c __ BEQ $0e2f ; (nformi.s10 + 0)
.s23:
0e23 : a9 2d __ LDA #$2d
.s22:
0e25 : a6 45 __ LDX T7 + 0 
0e27 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0e2a : c6 45 __ DEC T7 + 0 
0e2c : 4c 39 0e JMP $0e39 ; (nformi.s11 + 0)
.s10:
0e2f : a0 05 __ LDY #$05
0e31 : b1 0d __ LDA (P0),y ; (si + 0)
0e33 : f0 04 __ BEQ $0e39 ; (nformi.s11 + 0)
.s21:
0e35 : a9 2b __ LDA #$2b
0e37 : d0 ec __ BNE $0e25 ; (nformi.s22 + 0)
.s11:
0e39 : a6 45 __ LDX T7 + 0 
0e3b : a0 06 __ LDY #$06
0e3d : b1 0d __ LDA (P0),y ; (si + 0)
0e3f : d0 2b __ BNE $0e6c ; (nformi.s17 + 0)
.l12:
0e41 : 8a __ __ TXA
0e42 : 18 __ __ CLC
0e43 : a0 01 __ LDY #$01
0e45 : 71 0d __ ADC (P0),y ; (si + 0)
0e47 : b0 04 __ BCS $0e4d ; (nformi.s15 + 0)
.s16:
0e49 : c9 11 __ CMP #$11
0e4b : 90 0a __ BCC $0e57 ; (nformi.s13 + 0)
.s15:
0e4d : a0 00 __ LDY #$00
0e4f : b1 0d __ LDA (P0),y ; (si + 0)
0e51 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0e54 : ca __ __ DEX
0e55 : b0 ea __ BCS $0e41 ; (nformi.l12 + 0)
.s13:
0e57 : e0 10 __ CPX #$10
0e59 : b0 0e __ BCS $0e69 ; (nformi.s41 + 0)
.s14:
0e5b : 88 __ __ DEY
.l37:
0e5c : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0e5f : 91 0f __ STA (P2),y ; (str + 0)
0e61 : c8 __ __ INY
0e62 : e8 __ __ INX
0e63 : e0 10 __ CPX #$10
0e65 : 90 f5 __ BCC $0e5c ; (nformi.l37 + 0)
.s38:
0e67 : 84 1b __ STY ACCU + 0 
.s41:
0e69 : a5 1b __ LDA ACCU + 0 
.s3:
0e6b : 60 __ __ RTS
.s17:
0e6c : e0 10 __ CPX #$10
0e6e : b0 1a __ BCS $0e8a ; (nformi.l18 + 0)
.s20:
0e70 : a0 00 __ LDY #$00
.l35:
0e72 : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0e75 : 91 0f __ STA (P2),y ; (str + 0)
0e77 : c8 __ __ INY
0e78 : e8 __ __ INX
0e79 : e0 10 __ CPX #$10
0e7b : 90 f5 __ BCC $0e72 ; (nformi.l35 + 0)
.s36:
0e7d : 84 1b __ STY ACCU + 0 
0e7f : b0 09 __ BCS $0e8a ; (nformi.l18 + 0)
.s19:
0e81 : 88 __ __ DEY
0e82 : b1 0d __ LDA (P0),y ; (si + 0)
0e84 : a4 1b __ LDY ACCU + 0 
0e86 : 91 0f __ STA (P2),y ; (str + 0)
0e88 : e6 1b __ INC ACCU + 0 
.l18:
0e8a : a5 1b __ LDA ACCU + 0 
0e8c : a0 01 __ LDY #$01
0e8e : d1 0d __ CMP (P0),y ; (si + 0)
0e90 : 90 ef __ BCC $0e81 ; (nformi.s19 + 0)
0e92 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s4:
0e93 : a9 00 __ LDA #$00
0e95 : 85 43 __ STA T4 + 0 
0e97 : a5 15 __ LDA P8 ; (s + 0)
0e99 : f0 1f __ BEQ $0eba ; (nforml.s5 + 0)
.s35:
0e9b : 24 14 __ BIT P7 ; (v + 3)
0e9d : 10 1b __ BPL $0eba ; (nforml.s5 + 0)
.s36:
0e9f : 38 __ __ SEC
0ea0 : a9 00 __ LDA #$00
0ea2 : e5 11 __ SBC P4 ; (v + 0)
0ea4 : 85 11 __ STA P4 ; (v + 0)
0ea6 : a9 00 __ LDA #$00
0ea8 : e5 12 __ SBC P5 ; (v + 1)
0eaa : 85 12 __ STA P5 ; (v + 1)
0eac : a9 00 __ LDA #$00
0eae : e5 13 __ SBC P6 ; (v + 2)
0eb0 : 85 13 __ STA P6 ; (v + 2)
0eb2 : a9 00 __ LDA #$00
0eb4 : e5 14 __ SBC P7 ; (v + 3)
0eb6 : 85 14 __ STA P7 ; (v + 3)
0eb8 : e6 43 __ INC T4 + 0 
.s5:
0eba : a9 10 __ LDA #$10
0ebc : 85 44 __ STA T5 + 0 
0ebe : a5 14 __ LDA P7 ; (v + 3)
0ec0 : f0 03 __ BEQ $0ec5 ; (nforml.s31 + 0)
0ec2 : 4c 8d 0f JMP $0f8d ; (nforml.l28 + 0)
.s31:
0ec5 : a5 13 __ LDA P6 ; (v + 2)
0ec7 : d0 f9 __ BNE $0ec2 ; (nforml.s5 + 8)
.s32:
0ec9 : a5 12 __ LDA P5 ; (v + 1)
0ecb : d0 f5 __ BNE $0ec2 ; (nforml.s5 + 8)
.s33:
0ecd : c5 11 __ CMP P4 ; (v + 0)
0ecf : 90 f1 __ BCC $0ec2 ; (nforml.s5 + 8)
.s6:
0ed1 : a0 02 __ LDY #$02
0ed3 : b1 0d __ LDA (P0),y ; (si + 0)
0ed5 : c9 ff __ CMP #$ff
0ed7 : d0 04 __ BNE $0edd ; (nforml.s27 + 0)
.s7:
0ed9 : a9 0f __ LDA #$0f
0edb : d0 05 __ BNE $0ee2 ; (nforml.s41 + 0)
.s27:
0edd : 38 __ __ SEC
0ede : a9 10 __ LDA #$10
0ee0 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
0ee2 : a8 __ __ TAY
0ee3 : c4 44 __ CPY T5 + 0 
0ee5 : b0 0d __ BCS $0ef4 ; (nforml.s8 + 0)
.s26:
0ee7 : a9 30 __ LDA #$30
.l42:
0ee9 : a6 44 __ LDX T5 + 0 
0eeb : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0eee : c6 44 __ DEC T5 + 0 
0ef0 : c4 44 __ CPY T5 + 0 
0ef2 : 90 f5 __ BCC $0ee9 ; (nforml.l42 + 0)
.s8:
0ef4 : a0 07 __ LDY #$07
0ef6 : b1 0d __ LDA (P0),y ; (si + 0)
0ef8 : f0 1d __ BEQ $0f17 ; (nforml.s9 + 0)
.s24:
0efa : a0 04 __ LDY #$04
0efc : b1 0d __ LDA (P0),y ; (si + 0)
0efe : c9 10 __ CMP #$10
0f00 : d0 15 __ BNE $0f17 ; (nforml.s9 + 0)
.s25:
0f02 : 88 __ __ DEY
0f03 : b1 0d __ LDA (P0),y ; (si + 0)
0f05 : a8 __ __ TAY
0f06 : a9 30 __ LDA #$30
0f08 : a6 44 __ LDX T5 + 0 
0f0a : ca __ __ DEX
0f0b : ca __ __ DEX
0f0c : 86 44 __ STX T5 + 0 
0f0e : 9d e4 9f STA $9fe4,x ; (buffer[0] + 0)
0f11 : 98 __ __ TYA
0f12 : 69 16 __ ADC #$16
0f14 : 9d e5 9f STA $9fe5,x ; (buffer[0] + 1)
.s9:
0f17 : a9 00 __ LDA #$00
0f19 : 85 1b __ STA ACCU + 0 
0f1b : a5 43 __ LDA T4 + 0 
0f1d : f0 0c __ BEQ $0f2b ; (nforml.s10 + 0)
.s23:
0f1f : a9 2d __ LDA #$2d
.s22:
0f21 : a6 44 __ LDX T5 + 0 
0f23 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0f26 : c6 44 __ DEC T5 + 0 
0f28 : 4c 35 0f JMP $0f35 ; (nforml.s11 + 0)
.s10:
0f2b : a0 05 __ LDY #$05
0f2d : b1 0d __ LDA (P0),y ; (si + 0)
0f2f : f0 04 __ BEQ $0f35 ; (nforml.s11 + 0)
.s21:
0f31 : a9 2b __ LDA #$2b
0f33 : d0 ec __ BNE $0f21 ; (nforml.s22 + 0)
.s11:
0f35 : a0 06 __ LDY #$06
0f37 : a6 44 __ LDX T5 + 0 
0f39 : b1 0d __ LDA (P0),y ; (si + 0)
0f3b : d0 29 __ BNE $0f66 ; (nforml.s17 + 0)
.l12:
0f3d : 8a __ __ TXA
0f3e : 18 __ __ CLC
0f3f : a0 01 __ LDY #$01
0f41 : 71 0d __ ADC (P0),y ; (si + 0)
0f43 : b0 04 __ BCS $0f49 ; (nforml.s15 + 0)
.s16:
0f45 : c9 11 __ CMP #$11
0f47 : 90 0a __ BCC $0f53 ; (nforml.s13 + 0)
.s15:
0f49 : a0 00 __ LDY #$00
0f4b : b1 0d __ LDA (P0),y ; (si + 0)
0f4d : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0f50 : ca __ __ DEX
0f51 : b0 ea __ BCS $0f3d ; (nforml.l12 + 0)
.s13:
0f53 : e0 10 __ CPX #$10
0f55 : b0 0e __ BCS $0f65 ; (nforml.s3 + 0)
.s14:
0f57 : 88 __ __ DEY
.l39:
0f58 : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0f5b : 91 0f __ STA (P2),y ; (str + 0)
0f5d : c8 __ __ INY
0f5e : e8 __ __ INX
0f5f : e0 10 __ CPX #$10
0f61 : 90 f5 __ BCC $0f58 ; (nforml.l39 + 0)
.s40:
0f63 : 84 1b __ STY ACCU + 0 
.s3:
0f65 : 60 __ __ RTS
.s17:
0f66 : e0 10 __ CPX #$10
0f68 : b0 1a __ BCS $0f84 ; (nforml.l18 + 0)
.s20:
0f6a : a0 00 __ LDY #$00
.l37:
0f6c : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0f6f : 91 0f __ STA (P2),y ; (str + 0)
0f71 : c8 __ __ INY
0f72 : e8 __ __ INX
0f73 : e0 10 __ CPX #$10
0f75 : 90 f5 __ BCC $0f6c ; (nforml.l37 + 0)
.s38:
0f77 : 84 1b __ STY ACCU + 0 
0f79 : b0 09 __ BCS $0f84 ; (nforml.l18 + 0)
.s19:
0f7b : 88 __ __ DEY
0f7c : b1 0d __ LDA (P0),y ; (si + 0)
0f7e : a4 1b __ LDY ACCU + 0 
0f80 : 91 0f __ STA (P2),y ; (str + 0)
0f82 : e6 1b __ INC ACCU + 0 
.l18:
0f84 : a5 1b __ LDA ACCU + 0 
0f86 : a0 01 __ LDY #$01
0f88 : d1 0d __ CMP (P0),y ; (si + 0)
0f8a : 90 ef __ BCC $0f7b ; (nforml.s19 + 0)
0f8c : 60 __ __ RTS
.l28:
0f8d : a0 04 __ LDY #$04
0f8f : b1 0d __ LDA (P0),y ; (si + 0)
0f91 : 85 03 __ STA WORK + 0 
0f93 : a5 11 __ LDA P4 ; (v + 0)
0f95 : 85 1b __ STA ACCU + 0 
0f97 : a5 12 __ LDA P5 ; (v + 1)
0f99 : 85 1c __ STA ACCU + 1 
0f9b : a5 13 __ LDA P6 ; (v + 2)
0f9d : 85 1d __ STA ACCU + 2 
0f9f : a5 14 __ LDA P7 ; (v + 3)
0fa1 : 85 1e __ STA ACCU + 3 
0fa3 : a9 00 __ LDA #$00
0fa5 : 85 04 __ STA WORK + 1 
0fa7 : 85 05 __ STA WORK + 2 
0fa9 : 85 06 __ STA WORK + 3 
0fab : 20 87 19 JSR $1987 ; (divmod32 + 0)
0fae : a5 07 __ LDA WORK + 4 
0fb0 : c9 0a __ CMP #$0a
0fb2 : b0 04 __ BCS $0fb8 ; (nforml.s34 + 0)
.s29:
0fb4 : a9 30 __ LDA #$30
0fb6 : 90 06 __ BCC $0fbe ; (nforml.s30 + 0)
.s34:
0fb8 : a0 03 __ LDY #$03
0fba : b1 0d __ LDA (P0),y ; (si + 0)
0fbc : e9 0a __ SBC #$0a
.s30:
0fbe : 18 __ __ CLC
0fbf : 65 07 __ ADC WORK + 4 
0fc1 : a6 44 __ LDX T5 + 0 
0fc3 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0fc6 : c6 44 __ DEC T5 + 0 
0fc8 : a5 1b __ LDA ACCU + 0 
0fca : 85 11 __ STA P4 ; (v + 0)
0fcc : a5 1c __ LDA ACCU + 1 
0fce : 85 12 __ STA P5 ; (v + 1)
0fd0 : a5 1d __ LDA ACCU + 2 
0fd2 : 85 13 __ STA P6 ; (v + 2)
0fd4 : a5 1e __ LDA ACCU + 3 
0fd6 : 85 14 __ STA P7 ; (v + 3)
0fd8 : d0 b3 __ BNE $0f8d ; (nforml.l28 + 0)
0fda : 4c c5 0e JMP $0ec5 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s1:
0fdd : a2 03 __ LDX #$03
0fdf : b5 53 __ LDA T7 + 0,x 
0fe1 : 9d eb 9f STA $9feb,x ; (nformf@stack + 0)
0fe4 : ca __ __ DEX
0fe5 : 10 f8 __ BPL $0fdf ; (nformf.s1 + 2)
.s4:
0fe7 : a5 16 __ LDA P9 ; (f + 1)
0fe9 : 85 44 __ STA T0 + 1 
0feb : a5 17 __ LDA P10 ; (f + 2)
0fed : 85 45 __ STA T0 + 2 
0fef : a5 18 __ LDA P11 ; (f + 3)
0ff1 : 29 7f __ AND #$7f
0ff3 : 05 17 __ ORA P10 ; (f + 2)
0ff5 : 05 16 __ ORA P9 ; (f + 1)
0ff7 : 05 15 __ ORA P8 ; (f + 0)
0ff9 : f0 21 __ BEQ $101c ; (nformf.s5 + 0)
.s107:
0ffb : 24 18 __ BIT P11 ; (f + 3)
0ffd : 10 1d __ BPL $101c ; (nformf.s5 + 0)
.s106:
0fff : a9 2d __ LDA #$2d
1001 : a0 00 __ LDY #$00
1003 : 91 13 __ STA (P6),y ; (str + 0)
1005 : a5 18 __ LDA P11 ; (f + 3)
1007 : 49 80 __ EOR #$80
1009 : 85 10 __ STA P3 
100b : 85 18 __ STA P11 ; (f + 3)
100d : a5 15 __ LDA P8 ; (f + 0)
100f : 85 0d __ STA P0 
1011 : a5 16 __ LDA P9 ; (f + 1)
1013 : 85 0e __ STA P1 
1015 : a5 17 __ LDA P10 ; (f + 2)
1017 : 85 0f __ STA P2 
1019 : 4c 30 15 JMP $1530 ; (nformf.s104 + 0)
.s5:
101c : a5 15 __ LDA P8 ; (f + 0)
101e : 85 0d __ STA P0 
1020 : a5 16 __ LDA P9 ; (f + 1)
1022 : 85 0e __ STA P1 
1024 : a5 17 __ LDA P10 ; (f + 2)
1026 : 85 0f __ STA P2 
1028 : a5 18 __ LDA P11 ; (f + 3)
102a : 85 10 __ STA P3 
102c : a0 05 __ LDY #$05
102e : b1 11 __ LDA (P4),y ; (si + 0)
1030 : f0 09 __ BEQ $103b ; (nformf.s6 + 0)
.s103:
1032 : a9 2b __ LDA #$2b
1034 : a0 00 __ LDY #$00
1036 : 91 13 __ STA (P6),y ; (str + 0)
1038 : 4c 30 15 JMP $1530 ; (nformf.s104 + 0)
.s6:
103b : 20 41 15 JSR $1541 ; (isinf.s4 + 0)
103e : a2 00 __ LDX #$00
1040 : 86 54 __ STX T9 + 0 
1042 : a8 __ __ TAY
1043 : f0 05 __ BEQ $104a ; (nformf.s7 + 0)
.s101:
1045 : a9 02 __ LDA #$02
1047 : 4c 00 15 JMP $1500 ; (nformf.s102 + 0)
.s7:
104a : a5 11 __ LDA P4 ; (si + 0)
104c : 85 4b __ STA T2 + 0 
104e : a5 12 __ LDA P5 ; (si + 1)
1050 : 85 4c __ STA T2 + 1 
1052 : a0 02 __ LDY #$02
1054 : b1 11 __ LDA (P4),y ; (si + 0)
1056 : c9 ff __ CMP #$ff
1058 : d0 02 __ BNE $105c ; (nformf.s100 + 0)
.s8:
105a : a9 06 __ LDA #$06
.s100:
105c : 85 4d __ STA T3 + 0 
105e : 85 52 __ STA T6 + 0 
1060 : a9 00 __ LDA #$00
1062 : 85 4f __ STA T4 + 0 
1064 : 85 50 __ STA T4 + 1 
1066 : a5 18 __ LDA P11 ; (f + 3)
1068 : 85 46 __ STA T0 + 3 
106a : 29 7f __ AND #$7f
106c : 05 17 __ ORA P10 ; (f + 2)
106e : 05 16 __ ORA P9 ; (f + 1)
1070 : a6 15 __ LDX P8 ; (f + 0)
1072 : 86 43 __ STX T0 + 0 
1074 : 05 15 __ ORA P8 ; (f + 0)
1076 : d0 03 __ BNE $107b ; (nformf.s67 + 0)
1078 : 4c af 11 JMP $11af ; (nformf.s9 + 0)
.s67:
107b : a5 18 __ LDA P11 ; (f + 3)
107d : 10 03 __ BPL $1082 ; (nformf.s95 + 0)
107f : 4c 01 11 JMP $1101 ; (nformf.l80 + 0)
.s95:
1082 : c9 44 __ CMP #$44
1084 : d0 0d __ BNE $1093 ; (nformf.l99 + 0)
.s96:
1086 : a5 17 __ LDA P10 ; (f + 2)
1088 : c9 7a __ CMP #$7a
108a : d0 07 __ BNE $1093 ; (nformf.l99 + 0)
.s97:
108c : a5 16 __ LDA P9 ; (f + 1)
108e : d0 03 __ BNE $1093 ; (nformf.l99 + 0)
.s98:
1090 : 8a __ __ TXA
1091 : f0 02 __ BEQ $1095 ; (nformf.l90 + 0)
.l99:
1093 : 90 54 __ BCC $10e9 ; (nformf.s68 + 0)
.l90:
1095 : 18 __ __ CLC
1096 : a5 4f __ LDA T4 + 0 
1098 : 69 03 __ ADC #$03
109a : 85 4f __ STA T4 + 0 
109c : 90 02 __ BCC $10a0 ; (nformf.s121 + 0)
.s120:
109e : e6 50 __ INC T4 + 1 
.s121:
10a0 : a5 43 __ LDA T0 + 0 
10a2 : 85 1b __ STA ACCU + 0 
10a4 : a5 44 __ LDA T0 + 1 
10a6 : 85 1c __ STA ACCU + 1 
10a8 : a5 45 __ LDA T0 + 2 
10aa : 85 1d __ STA ACCU + 2 
10ac : a5 46 __ LDA T0 + 3 
10ae : 85 1e __ STA ACCU + 3 
10b0 : a9 00 __ LDA #$00
10b2 : 85 03 __ STA WORK + 0 
10b4 : 85 04 __ STA WORK + 1 
10b6 : a9 7a __ LDA #$7a
10b8 : 85 05 __ STA WORK + 2 
10ba : a9 44 __ LDA #$44
10bc : 85 06 __ STA WORK + 3 
10be : 20 74 15 JSR $1574 ; (freg + 20)
10c1 : 20 5a 17 JSR $175a ; (crt_fdiv + 0)
10c4 : a5 1b __ LDA ACCU + 0 
10c6 : 85 43 __ STA T0 + 0 
10c8 : a5 1c __ LDA ACCU + 1 
10ca : 85 44 __ STA T0 + 1 
10cc : a6 1d __ LDX ACCU + 2 
10ce : 86 45 __ STX T0 + 2 
10d0 : a5 1e __ LDA ACCU + 3 
10d2 : 85 46 __ STA T0 + 3 
10d4 : 30 13 __ BMI $10e9 ; (nformf.s68 + 0)
.s91:
10d6 : c9 44 __ CMP #$44
10d8 : d0 b9 __ BNE $1093 ; (nformf.l99 + 0)
.s92:
10da : e0 7a __ CPX #$7a
10dc : d0 b5 __ BNE $1093 ; (nformf.l99 + 0)
.s93:
10de : a5 1c __ LDA ACCU + 1 
10e0 : 38 __ __ SEC
10e1 : d0 b0 __ BNE $1093 ; (nformf.l99 + 0)
.s94:
10e3 : a5 1b __ LDA ACCU + 0 
10e5 : f0 ae __ BEQ $1095 ; (nformf.l90 + 0)
10e7 : d0 aa __ BNE $1093 ; (nformf.l99 + 0)
.s68:
10e9 : a5 46 __ LDA T0 + 3 
10eb : 30 14 __ BMI $1101 ; (nformf.l80 + 0)
.s86:
10ed : c9 3f __ CMP #$3f
10ef : d0 0e __ BNE $10ff ; (nformf.s85 + 0)
.s87:
10f1 : a5 45 __ LDA T0 + 2 
10f3 : c9 80 __ CMP #$80
10f5 : d0 08 __ BNE $10ff ; (nformf.s85 + 0)
.s88:
10f7 : a5 44 __ LDA T0 + 1 
10f9 : d0 04 __ BNE $10ff ; (nformf.s85 + 0)
.s89:
10fb : a5 43 __ LDA T0 + 0 
10fd : f0 49 __ BEQ $1148 ; (nformf.s69 + 0)
.s85:
10ff : b0 47 __ BCS $1148 ; (nformf.s69 + 0)
.l80:
1101 : 38 __ __ SEC
1102 : a5 4f __ LDA T4 + 0 
1104 : e9 03 __ SBC #$03
1106 : 85 4f __ STA T4 + 0 
1108 : b0 02 __ BCS $110c ; (nformf.s116 + 0)
.s115:
110a : c6 50 __ DEC T4 + 1 
.s116:
110c : a9 00 __ LDA #$00
110e : 85 1b __ STA ACCU + 0 
1110 : 85 1c __ STA ACCU + 1 
1112 : a9 7a __ LDA #$7a
1114 : 85 1d __ STA ACCU + 2 
1116 : a9 44 __ LDA #$44
1118 : 85 1e __ STA ACCU + 3 
111a : a2 43 __ LDX #$43
111c : 20 64 15 JSR $1564 ; (freg + 4)
111f : 20 92 16 JSR $1692 ; (crt_fmul + 0)
1122 : a5 1b __ LDA ACCU + 0 
1124 : 85 43 __ STA T0 + 0 
1126 : a5 1c __ LDA ACCU + 1 
1128 : 85 44 __ STA T0 + 1 
112a : a6 1d __ LDX ACCU + 2 
112c : 86 45 __ STX T0 + 2 
112e : a5 1e __ LDA ACCU + 3 
1130 : 85 46 __ STA T0 + 3 
1132 : 30 cd __ BMI $1101 ; (nformf.l80 + 0)
.s81:
1134 : c9 3f __ CMP #$3f
1136 : 90 c9 __ BCC $1101 ; (nformf.l80 + 0)
.s122:
1138 : d0 0e __ BNE $1148 ; (nformf.s69 + 0)
.s82:
113a : e0 80 __ CPX #$80
113c : 90 c3 __ BCC $1101 ; (nformf.l80 + 0)
.s123:
113e : d0 08 __ BNE $1148 ; (nformf.s69 + 0)
.s83:
1140 : a5 1c __ LDA ACCU + 1 
1142 : d0 bb __ BNE $10ff ; (nformf.s85 + 0)
.s84:
1144 : a5 1b __ LDA ACCU + 0 
1146 : d0 b7 __ BNE $10ff ; (nformf.s85 + 0)
.s69:
1148 : a5 46 __ LDA T0 + 3 
114a : 30 63 __ BMI $11af ; (nformf.s9 + 0)
.s75:
114c : c9 41 __ CMP #$41
114e : d0 0e __ BNE $115e ; (nformf.l79 + 0)
.s76:
1150 : a5 45 __ LDA T0 + 2 
1152 : c9 20 __ CMP #$20
1154 : d0 08 __ BNE $115e ; (nformf.l79 + 0)
.s77:
1156 : a5 44 __ LDA T0 + 1 
1158 : d0 04 __ BNE $115e ; (nformf.l79 + 0)
.s78:
115a : a5 43 __ LDA T0 + 0 
115c : f0 02 __ BEQ $1160 ; (nformf.l70 + 0)
.l79:
115e : 90 4f __ BCC $11af ; (nformf.s9 + 0)
.l70:
1160 : e6 4f __ INC T4 + 0 
1162 : d0 02 __ BNE $1166 ; (nformf.s119 + 0)
.s118:
1164 : e6 50 __ INC T4 + 1 
.s119:
1166 : a5 43 __ LDA T0 + 0 
1168 : 85 1b __ STA ACCU + 0 
116a : a5 44 __ LDA T0 + 1 
116c : 85 1c __ STA ACCU + 1 
116e : a5 45 __ LDA T0 + 2 
1170 : 85 1d __ STA ACCU + 2 
1172 : a5 46 __ LDA T0 + 3 
1174 : 85 1e __ STA ACCU + 3 
1176 : a9 00 __ LDA #$00
1178 : 85 03 __ STA WORK + 0 
117a : 85 04 __ STA WORK + 1 
117c : a9 20 __ LDA #$20
117e : 85 05 __ STA WORK + 2 
1180 : a9 41 __ LDA #$41
1182 : 85 06 __ STA WORK + 3 
1184 : 20 74 15 JSR $1574 ; (freg + 20)
1187 : 20 5a 17 JSR $175a ; (crt_fdiv + 0)
118a : a5 1b __ LDA ACCU + 0 
118c : 85 43 __ STA T0 + 0 
118e : a5 1c __ LDA ACCU + 1 
1190 : 85 44 __ STA T0 + 1 
1192 : a6 1d __ LDX ACCU + 2 
1194 : 86 45 __ STX T0 + 2 
1196 : a5 1e __ LDA ACCU + 3 
1198 : 85 46 __ STA T0 + 3 
119a : 30 13 __ BMI $11af ; (nformf.s9 + 0)
.s71:
119c : c9 41 __ CMP #$41
119e : d0 be __ BNE $115e ; (nformf.l79 + 0)
.s72:
11a0 : e0 20 __ CPX #$20
11a2 : d0 ba __ BNE $115e ; (nformf.l79 + 0)
.s73:
11a4 : a5 1c __ LDA ACCU + 1 
11a6 : 38 __ __ SEC
11a7 : d0 b5 __ BNE $115e ; (nformf.l79 + 0)
.s74:
11a9 : a5 1b __ LDA ACCU + 0 
11ab : f0 b3 __ BEQ $1160 ; (nformf.l70 + 0)
11ad : d0 af __ BNE $115e ; (nformf.l79 + 0)
.s9:
11af : ad f4 9f LDA $9ff4 ; (sstack + 0)
11b2 : c9 65 __ CMP #$65
11b4 : d0 04 __ BNE $11ba ; (nformf.s11 + 0)
.s10:
11b6 : a9 01 __ LDA #$01
11b8 : d0 02 __ BNE $11bc ; (nformf.s12 + 0)
.s11:
11ba : a9 00 __ LDA #$00
.s12:
11bc : 85 55 __ STA T10 + 0 
11be : a6 4d __ LDX T3 + 0 
11c0 : e8 __ __ INX
11c1 : 86 51 __ STX T5 + 0 
11c3 : ad f4 9f LDA $9ff4 ; (sstack + 0)
11c6 : c9 67 __ CMP #$67
11c8 : d0 13 __ BNE $11dd ; (nformf.s13 + 0)
.s63:
11ca : a5 50 __ LDA T4 + 1 
11cc : 30 08 __ BMI $11d6 ; (nformf.s64 + 0)
.s66:
11ce : d0 06 __ BNE $11d6 ; (nformf.s64 + 0)
.s65:
11d0 : a5 4f __ LDA T4 + 0 
11d2 : c9 04 __ CMP #$04
11d4 : 90 07 __ BCC $11dd ; (nformf.s13 + 0)
.s64:
11d6 : a9 01 __ LDA #$01
11d8 : 85 55 __ STA T10 + 0 
11da : 4c 66 14 JMP $1466 ; (nformf.s53 + 0)
.s13:
11dd : a5 55 __ LDA T10 + 0 
11df : d0 f9 __ BNE $11da ; (nformf.s64 + 4)
.s14:
11e1 : 24 50 __ BIT T4 + 1 
11e3 : 10 43 __ BPL $1228 ; (nformf.s15 + 0)
.s52:
11e5 : a5 43 __ LDA T0 + 0 
11e7 : 85 1b __ STA ACCU + 0 
11e9 : a5 44 __ LDA T0 + 1 
11eb : 85 1c __ STA ACCU + 1 
11ed : a5 45 __ LDA T0 + 2 
11ef : 85 1d __ STA ACCU + 2 
11f1 : a5 46 __ LDA T0 + 3 
11f3 : 85 1e __ STA ACCU + 3 
.l108:
11f5 : a9 00 __ LDA #$00
11f7 : 85 03 __ STA WORK + 0 
11f9 : 85 04 __ STA WORK + 1 
11fb : a9 20 __ LDA #$20
11fd : 85 05 __ STA WORK + 2 
11ff : a9 41 __ LDA #$41
1201 : 85 06 __ STA WORK + 3 
1203 : 20 74 15 JSR $1574 ; (freg + 20)
1206 : 20 5a 17 JSR $175a ; (crt_fdiv + 0)
1209 : 18 __ __ CLC
120a : a5 4f __ LDA T4 + 0 
120c : 69 01 __ ADC #$01
120e : 85 4f __ STA T4 + 0 
1210 : a5 50 __ LDA T4 + 1 
1212 : 69 00 __ ADC #$00
1214 : 85 50 __ STA T4 + 1 
1216 : 30 dd __ BMI $11f5 ; (nformf.l108 + 0)
.s109:
1218 : a5 1e __ LDA ACCU + 3 
121a : 85 46 __ STA T0 + 3 
121c : a5 1d __ LDA ACCU + 2 
121e : 85 45 __ STA T0 + 2 
1220 : a5 1c __ LDA ACCU + 1 
1222 : 85 44 __ STA T0 + 1 
1224 : a5 1b __ LDA ACCU + 0 
1226 : 85 43 __ STA T0 + 0 
.s15:
1228 : 18 __ __ CLC
1229 : a5 4d __ LDA T3 + 0 
122b : 65 4f __ ADC T4 + 0 
122d : 18 __ __ CLC
122e : 69 01 __ ADC #$01
1230 : 85 51 __ STA T5 + 0 
1232 : c9 07 __ CMP #$07
1234 : 90 14 __ BCC $124a ; (nformf.s51 + 0)
.s16:
1236 : ad 78 1a LDA $1a78 ; (fround5[0] + 24)
1239 : 85 47 __ STA T1 + 0 
123b : ad 79 1a LDA $1a79 ; (fround5[0] + 25)
123e : 85 48 __ STA T1 + 1 
1240 : ad 7a 1a LDA $1a7a ; (fround5[0] + 26)
1243 : 85 49 __ STA T1 + 2 
1245 : ad 7b 1a LDA $1a7b ; (fround5[0] + 27)
1248 : b0 15 __ BCS $125f ; (nformf.s17 + 0)
.s51:
124a : 0a __ __ ASL
124b : 0a __ __ ASL
124c : aa __ __ TAX
124d : bd 5c 1a LDA $1a5c,x ; (divmod32 + 213)
1250 : 85 47 __ STA T1 + 0 
1252 : bd 5d 1a LDA $1a5d,x ; (divmod32 + 214)
1255 : 85 48 __ STA T1 + 1 
1257 : bd 5e 1a LDA $1a5e,x ; (spentry + 0)
125a : 85 49 __ STA T1 + 2 
125c : bd 5f 1a LDA $1a5f,x ; (giocharmap + 0)
.s17:
125f : 85 4a __ STA T1 + 3 
1261 : a5 43 __ LDA T0 + 0 
1263 : 85 1b __ STA ACCU + 0 
1265 : a5 44 __ LDA T0 + 1 
1267 : 85 1c __ STA ACCU + 1 
1269 : a5 45 __ LDA T0 + 2 
126b : 85 1d __ STA ACCU + 2 
126d : a5 46 __ LDA T0 + 3 
126f : 85 1e __ STA ACCU + 3 
1271 : a2 47 __ LDX #$47
1273 : 20 64 15 JSR $1564 ; (freg + 4)
1276 : 20 ab 15 JSR $15ab ; (faddsub + 6)
1279 : a5 1c __ LDA ACCU + 1 
127b : 85 16 __ STA P9 ; (f + 1)
127d : a5 1d __ LDA ACCU + 2 
127f : 85 17 __ STA P10 ; (f + 2)
1281 : a6 1b __ LDX ACCU + 0 
1283 : a5 1e __ LDA ACCU + 3 
1285 : 85 18 __ STA P11 ; (f + 3)
1287 : 30 3a __ BMI $12c3 ; (nformf.s18 + 0)
.s46:
1289 : c9 41 __ CMP #$41
128b : d0 0d __ BNE $129a ; (nformf.s50 + 0)
.s47:
128d : a5 17 __ LDA P10 ; (f + 2)
128f : c9 20 __ CMP #$20
1291 : d0 07 __ BNE $129a ; (nformf.s50 + 0)
.s48:
1293 : a5 16 __ LDA P9 ; (f + 1)
1295 : d0 03 __ BNE $129a ; (nformf.s50 + 0)
.s49:
1297 : 8a __ __ TXA
1298 : f0 02 __ BEQ $129c ; (nformf.s45 + 0)
.s50:
129a : 90 27 __ BCC $12c3 ; (nformf.s18 + 0)
.s45:
129c : a9 00 __ LDA #$00
129e : 85 03 __ STA WORK + 0 
12a0 : 85 04 __ STA WORK + 1 
12a2 : a9 20 __ LDA #$20
12a4 : 85 05 __ STA WORK + 2 
12a6 : a9 41 __ LDA #$41
12a8 : 85 06 __ STA WORK + 3 
12aa : 20 74 15 JSR $1574 ; (freg + 20)
12ad : 20 5a 17 JSR $175a ; (crt_fdiv + 0)
12b0 : a5 1c __ LDA ACCU + 1 
12b2 : 85 16 __ STA P9 ; (f + 1)
12b4 : a5 1d __ LDA ACCU + 2 
12b6 : 85 17 __ STA P10 ; (f + 2)
12b8 : a5 1e __ LDA ACCU + 3 
12ba : 85 18 __ STA P11 ; (f + 3)
12bc : a6 4d __ LDX T3 + 0 
12be : ca __ __ DEX
12bf : 86 52 __ STX T6 + 0 
12c1 : a6 1b __ LDX ACCU + 0 
.s18:
12c3 : 38 __ __ SEC
12c4 : a5 51 __ LDA T5 + 0 
12c6 : e5 52 __ SBC T6 + 0 
12c8 : 85 4d __ STA T3 + 0 
12ca : a9 00 __ LDA #$00
12cc : e9 00 __ SBC #$00
12ce : 85 4e __ STA T3 + 1 
12d0 : a9 14 __ LDA #$14
12d2 : c5 51 __ CMP T5 + 0 
12d4 : b0 02 __ BCS $12d8 ; (nformf.s19 + 0)
.s44:
12d6 : 85 51 __ STA T5 + 0 
.s19:
12d8 : a5 4d __ LDA T3 + 0 
12da : d0 08 __ BNE $12e4 ; (nformf.s21 + 0)
.s20:
12dc : a9 30 __ LDA #$30
12de : a4 54 __ LDY T9 + 0 
12e0 : 91 13 __ STA (P6),y ; (str + 0)
12e2 : e6 54 __ INC T9 + 0 
.s21:
12e4 : a9 00 __ LDA #$00
12e6 : 85 56 __ STA T11 + 0 
12e8 : c5 4d __ CMP T3 + 0 
12ea : f0 6f __ BEQ $135b ; (nformf.l43 + 0)
.s23:
12ec : c9 07 __ CMP #$07
12ee : 90 04 __ BCC $12f4 ; (nformf.s24 + 0)
.l42:
12f0 : a9 30 __ LDA #$30
12f2 : b0 55 __ BCS $1349 ; (nformf.l25 + 0)
.s24:
12f4 : 86 1b __ STX ACCU + 0 
12f6 : 86 43 __ STX T0 + 0 
12f8 : a5 16 __ LDA P9 ; (f + 1)
12fa : 85 1c __ STA ACCU + 1 
12fc : 85 44 __ STA T0 + 1 
12fe : a5 17 __ LDA P10 ; (f + 2)
1300 : 85 1d __ STA ACCU + 2 
1302 : 85 45 __ STA T0 + 2 
1304 : a5 18 __ LDA P11 ; (f + 3)
1306 : 85 1e __ STA ACCU + 3 
1308 : 85 46 __ STA T0 + 3 
130a : 20 f4 18 JSR $18f4 ; (f32_to_i16 + 0)
130d : a5 1b __ LDA ACCU + 0 
130f : 85 53 __ STA T7 + 0 
1311 : 20 40 19 JSR $1940 ; (sint16_to_float + 0)
1314 : a2 43 __ LDX #$43
1316 : 20 64 15 JSR $1564 ; (freg + 4)
1319 : a5 1e __ LDA ACCU + 3 
131b : 49 80 __ EOR #$80
131d : 85 1e __ STA ACCU + 3 
131f : 20 ab 15 JSR $15ab ; (faddsub + 6)
1322 : a9 00 __ LDA #$00
1324 : 85 03 __ STA WORK + 0 
1326 : 85 04 __ STA WORK + 1 
1328 : a9 20 __ LDA #$20
132a : 85 05 __ STA WORK + 2 
132c : a9 41 __ LDA #$41
132e : 85 06 __ STA WORK + 3 
1330 : 20 74 15 JSR $1574 ; (freg + 20)
1333 : 20 92 16 JSR $1692 ; (crt_fmul + 0)
1336 : a5 1c __ LDA ACCU + 1 
1338 : 85 16 __ STA P9 ; (f + 1)
133a : a5 1d __ LDA ACCU + 2 
133c : 85 17 __ STA P10 ; (f + 2)
133e : a5 1e __ LDA ACCU + 3 
1340 : 85 18 __ STA P11 ; (f + 3)
1342 : 18 __ __ CLC
1343 : a5 53 __ LDA T7 + 0 
1345 : 69 30 __ ADC #$30
1347 : a6 1b __ LDX ACCU + 0 
.l25:
1349 : a4 54 __ LDY T9 + 0 
134b : 91 13 __ STA (P6),y ; (str + 0)
134d : e6 54 __ INC T9 + 0 
134f : e6 56 __ INC T11 + 0 
1351 : a5 56 __ LDA T11 + 0 
1353 : c5 51 __ CMP T5 + 0 
1355 : b0 14 __ BCS $136b ; (nformf.s26 + 0)
.s22:
1357 : c5 4d __ CMP T3 + 0 
1359 : d0 91 __ BNE $12ec ; (nformf.s23 + 0)
.l43:
135b : a9 2e __ LDA #$2e
135d : a4 54 __ LDY T9 + 0 
135f : 91 13 __ STA (P6),y ; (str + 0)
1361 : e6 54 __ INC T9 + 0 
1363 : a5 56 __ LDA T11 + 0 
1365 : c9 07 __ CMP #$07
1367 : 90 8b __ BCC $12f4 ; (nformf.s24 + 0)
1369 : b0 85 __ BCS $12f0 ; (nformf.l42 + 0)
.s26:
136b : a5 55 __ LDA T10 + 0 
136d : f0 66 __ BEQ $13d5 ; (nformf.s27 + 0)
.s38:
136f : a0 03 __ LDY #$03
1371 : b1 4b __ LDA (T2 + 0),y 
1373 : 69 03 __ ADC #$03
1375 : a4 54 __ LDY T9 + 0 
1377 : 91 13 __ STA (P6),y ; (str + 0)
1379 : c8 __ __ INY
137a : 84 54 __ STY T9 + 0 
137c : 24 50 __ BIT T4 + 1 
137e : 30 06 __ BMI $1386 ; (nformf.s41 + 0)
.s39:
1380 : a9 2b __ LDA #$2b
1382 : 91 13 __ STA (P6),y ; (str + 0)
1384 : d0 11 __ BNE $1397 ; (nformf.s40 + 0)
.s41:
1386 : a9 2d __ LDA #$2d
1388 : 91 13 __ STA (P6),y ; (str + 0)
138a : 38 __ __ SEC
138b : a9 00 __ LDA #$00
138d : e5 4f __ SBC T4 + 0 
138f : 85 4f __ STA T4 + 0 
1391 : a9 00 __ LDA #$00
1393 : e5 50 __ SBC T4 + 1 
1395 : 85 50 __ STA T4 + 1 
.s40:
1397 : e6 54 __ INC T9 + 0 
1399 : a5 4f __ LDA T4 + 0 
139b : 85 1b __ STA ACCU + 0 
139d : a5 50 __ LDA T4 + 1 
139f : 85 1c __ STA ACCU + 1 
13a1 : a9 0a __ LDA #$0a
13a3 : 85 03 __ STA WORK + 0 
13a5 : a9 00 __ LDA #$00
13a7 : 85 04 __ STA WORK + 1 
13a9 : 20 08 18 JSR $1808 ; (divs16 + 0)
13ac : 18 __ __ CLC
13ad : a5 1b __ LDA ACCU + 0 
13af : 69 30 __ ADC #$30
13b1 : a4 54 __ LDY T9 + 0 
13b3 : 91 13 __ STA (P6),y ; (str + 0)
13b5 : e6 54 __ INC T9 + 0 
13b7 : a5 4f __ LDA T4 + 0 
13b9 : 85 1b __ STA ACCU + 0 
13bb : a5 50 __ LDA T4 + 1 
13bd : 85 1c __ STA ACCU + 1 
13bf : a9 0a __ LDA #$0a
13c1 : 85 03 __ STA WORK + 0 
13c3 : a9 00 __ LDA #$00
13c5 : 85 04 __ STA WORK + 1 
13c7 : 20 c7 18 JSR $18c7 ; (mods16 + 0)
13ca : 18 __ __ CLC
13cb : a5 05 __ LDA WORK + 2 
13cd : 69 30 __ ADC #$30
13cf : a4 54 __ LDY T9 + 0 
13d1 : 91 13 __ STA (P6),y ; (str + 0)
13d3 : e6 54 __ INC T9 + 0 
.s27:
13d5 : a5 54 __ LDA T9 + 0 
13d7 : a0 01 __ LDY #$01
13d9 : d1 11 __ CMP (P4),y ; (si + 0)
13db : b0 6d __ BCS $144a ; (nformf.s3 + 0)
.s28:
13dd : a0 06 __ LDY #$06
13df : b1 11 __ LDA (P4),y ; (si + 0)
13e1 : f0 04 __ BEQ $13e7 ; (nformf.s29 + 0)
.s110:
13e3 : a6 54 __ LDX T9 + 0 
13e5 : 90 70 __ BCC $1457 ; (nformf.l36 + 0)
.s29:
13e7 : a5 54 __ LDA T9 + 0 
13e9 : f0 40 __ BEQ $142b ; (nformf.s30 + 0)
.s35:
13eb : e9 00 __ SBC #$00
13ed : a8 __ __ TAY
13ee : a9 00 __ LDA #$00
13f0 : e9 00 __ SBC #$00
13f2 : aa __ __ TAX
13f3 : 98 __ __ TYA
13f4 : 18 __ __ CLC
13f5 : 65 13 __ ADC P6 ; (str + 0)
13f7 : 85 47 __ STA T1 + 0 
13f9 : 8a __ __ TXA
13fa : 65 14 __ ADC P7 ; (str + 1)
13fc : 85 48 __ STA T1 + 1 
13fe : a9 01 __ LDA #$01
1400 : 85 4d __ STA T3 + 0 
1402 : a6 54 __ LDX T9 + 0 
1404 : 38 __ __ SEC
.l111:
1405 : a0 01 __ LDY #$01
1407 : b1 11 __ LDA (P4),y ; (si + 0)
1409 : e5 4d __ SBC T3 + 0 
140b : 85 4b __ STA T2 + 0 
140d : a9 00 __ LDA #$00
140f : e5 4e __ SBC T3 + 1 
1411 : 18 __ __ CLC
1412 : 65 14 __ ADC P7 ; (str + 1)
1414 : 85 4c __ STA T2 + 1 
1416 : 88 __ __ DEY
1417 : b1 47 __ LDA (T1 + 0),y 
1419 : a4 13 __ LDY P6 ; (str + 0)
141b : 91 4b __ STA (T2 + 0),y 
141d : a5 47 __ LDA T1 + 0 
141f : d0 02 __ BNE $1423 ; (nformf.s114 + 0)
.s113:
1421 : c6 48 __ DEC T1 + 1 
.s114:
1423 : c6 47 __ DEC T1 + 0 
1425 : e6 4d __ INC T3 + 0 
1427 : e4 4d __ CPX T3 + 0 
1429 : b0 da __ BCS $1405 ; (nformf.l111 + 0)
.s30:
142b : a9 00 __ LDA #$00
142d : 85 4d __ STA T3 + 0 
142f : 90 08 __ BCC $1439 ; (nformf.l31 + 0)
.s33:
1431 : a9 20 __ LDA #$20
1433 : a4 4d __ LDY T3 + 0 
1435 : 91 13 __ STA (P6),y ; (str + 0)
1437 : e6 4d __ INC T3 + 0 
.l31:
1439 : a0 01 __ LDY #$01
143b : b1 11 __ LDA (P4),y ; (si + 0)
143d : 38 __ __ SEC
143e : e5 54 __ SBC T9 + 0 
1440 : 90 ef __ BCC $1431 ; (nformf.s33 + 0)
.s34:
1442 : c5 4d __ CMP T3 + 0 
1444 : 90 02 __ BCC $1448 ; (nformf.s32 + 0)
.s112:
1446 : d0 e9 __ BNE $1431 ; (nformf.s33 + 0)
.s32:
1448 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
144a : 85 1b __ STA ACCU + 0 
144c : a2 03 __ LDX #$03
144e : bd eb 9f LDA $9feb,x ; (nformf@stack + 0)
1451 : 95 53 __ STA T7 + 0,x 
1453 : ca __ __ DEX
1454 : 10 f8 __ BPL $144e ; (nformf.s3 + 4)
1456 : 60 __ __ RTS
.l36:
1457 : 8a __ __ TXA
1458 : a0 01 __ LDY #$01
145a : d1 11 __ CMP (P4),y ; (si + 0)
145c : b0 ea __ BCS $1448 ; (nformf.s32 + 0)
.s37:
145e : a8 __ __ TAY
145f : a9 20 __ LDA #$20
1461 : 91 13 __ STA (P6),y ; (str + 0)
1463 : e8 __ __ INX
1464 : 90 f1 __ BCC $1457 ; (nformf.l36 + 0)
.s53:
1466 : a5 51 __ LDA T5 + 0 
1468 : c9 07 __ CMP #$07
146a : 90 14 __ BCC $1480 ; (nformf.s62 + 0)
.s54:
146c : ad 78 1a LDA $1a78 ; (fround5[0] + 24)
146f : 85 47 __ STA T1 + 0 
1471 : ad 79 1a LDA $1a79 ; (fround5[0] + 25)
1474 : 85 48 __ STA T1 + 1 
1476 : ad 7a 1a LDA $1a7a ; (fround5[0] + 26)
1479 : 85 49 __ STA T1 + 2 
147b : ad 7b 1a LDA $1a7b ; (fround5[0] + 27)
147e : b0 15 __ BCS $1495 ; (nformf.s55 + 0)
.s62:
1480 : 0a __ __ ASL
1481 : 0a __ __ ASL
1482 : aa __ __ TAX
1483 : bd 5c 1a LDA $1a5c,x ; (divmod32 + 213)
1486 : 85 47 __ STA T1 + 0 
1488 : bd 5d 1a LDA $1a5d,x ; (divmod32 + 214)
148b : 85 48 __ STA T1 + 1 
148d : bd 5e 1a LDA $1a5e,x ; (spentry + 0)
1490 : 85 49 __ STA T1 + 2 
1492 : bd 5f 1a LDA $1a5f,x ; (giocharmap + 0)
.s55:
1495 : 85 4a __ STA T1 + 3 
1497 : a5 43 __ LDA T0 + 0 
1499 : 85 1b __ STA ACCU + 0 
149b : a5 44 __ LDA T0 + 1 
149d : 85 1c __ STA ACCU + 1 
149f : a5 45 __ LDA T0 + 2 
14a1 : 85 1d __ STA ACCU + 2 
14a3 : a5 46 __ LDA T0 + 3 
14a5 : 85 1e __ STA ACCU + 3 
14a7 : a2 47 __ LDX #$47
14a9 : 20 64 15 JSR $1564 ; (freg + 4)
14ac : 20 ab 15 JSR $15ab ; (faddsub + 6)
14af : a5 1c __ LDA ACCU + 1 
14b1 : 85 16 __ STA P9 ; (f + 1)
14b3 : a5 1d __ LDA ACCU + 2 
14b5 : 85 17 __ STA P10 ; (f + 2)
14b7 : a6 1b __ LDX ACCU + 0 
14b9 : a5 1e __ LDA ACCU + 3 
14bb : 85 18 __ STA P11 ; (f + 3)
14bd : 10 03 __ BPL $14c2 ; (nformf.s57 + 0)
14bf : 4c c3 12 JMP $12c3 ; (nformf.s18 + 0)
.s57:
14c2 : c9 41 __ CMP #$41
14c4 : d0 0d __ BNE $14d3 ; (nformf.s61 + 0)
.s58:
14c6 : a5 17 __ LDA P10 ; (f + 2)
14c8 : c9 20 __ CMP #$20
14ca : d0 07 __ BNE $14d3 ; (nformf.s61 + 0)
.s59:
14cc : a5 16 __ LDA P9 ; (f + 1)
14ce : d0 03 __ BNE $14d3 ; (nformf.s61 + 0)
.s60:
14d0 : 8a __ __ TXA
14d1 : f0 02 __ BEQ $14d5 ; (nformf.s56 + 0)
.s61:
14d3 : 90 ea __ BCC $14bf ; (nformf.s55 + 42)
.s56:
14d5 : a9 00 __ LDA #$00
14d7 : 85 03 __ STA WORK + 0 
14d9 : 85 04 __ STA WORK + 1 
14db : a9 20 __ LDA #$20
14dd : 85 05 __ STA WORK + 2 
14df : a9 41 __ LDA #$41
14e1 : 85 06 __ STA WORK + 3 
14e3 : 20 74 15 JSR $1574 ; (freg + 20)
14e6 : 20 5a 17 JSR $175a ; (crt_fdiv + 0)
14e9 : a5 1c __ LDA ACCU + 1 
14eb : 85 16 __ STA P9 ; (f + 1)
14ed : a5 1d __ LDA ACCU + 2 
14ef : 85 17 __ STA P10 ; (f + 2)
14f1 : a5 1e __ LDA ACCU + 3 
14f3 : 85 18 __ STA P11 ; (f + 3)
14f5 : a6 1b __ LDX ACCU + 0 
14f7 : e6 4f __ INC T4 + 0 
14f9 : d0 c4 __ BNE $14bf ; (nformf.s55 + 42)
.s117:
14fb : e6 50 __ INC T4 + 1 
14fd : 4c c3 12 JMP $12c3 ; (nformf.s18 + 0)
.s102:
1500 : 86 43 __ STX T0 + 0 
1502 : 85 47 __ STA T1 + 0 
1504 : a0 03 __ LDY #$03
1506 : b1 11 __ LDA (P4),y ; (si + 0)
1508 : 18 __ __ CLC
1509 : 69 08 __ ADC #$08
150b : a4 43 __ LDY T0 + 0 
150d : 91 13 __ STA (P6),y ; (str + 0)
150f : 18 __ __ CLC
1510 : a0 03 __ LDY #$03
1512 : b1 11 __ LDA (P4),y ; (si + 0)
1514 : 69 0d __ ADC #$0d
1516 : a4 43 __ LDY T0 + 0 
1518 : c8 __ __ INY
1519 : 91 13 __ STA (P6),y ; (str + 0)
151b : a0 03 __ LDY #$03
151d : b1 11 __ LDA (P4),y ; (si + 0)
151f : 18 __ __ CLC
1520 : 69 05 __ ADC #$05
1522 : a4 47 __ LDY T1 + 0 
1524 : 91 13 __ STA (P6),y ; (str + 0)
1526 : 18 __ __ CLC
1527 : a5 54 __ LDA T9 + 0 
1529 : 69 03 __ ADC #$03
152b : 85 54 __ STA T9 + 0 
152d : 4c d5 13 JMP $13d5 ; (nformf.s27 + 0)
.s104:
1530 : 20 41 15 JSR $1541 ; (isinf.s4 + 0)
1533 : a2 01 __ LDX #$01
1535 : 86 54 __ STX T9 + 0 
1537 : a8 __ __ TAY
1538 : d0 03 __ BNE $153d ; (nformf.s105 + 0)
153a : 4c 4a 10 JMP $104a ; (nformf.s7 + 0)
.s105:
153d : a9 03 __ LDA #$03
153f : d0 bf __ BNE $1500 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/hdnsh/oscar/include/math.h"
.s4:
1541 : 06 0f __ ASL P2 ; (f + 2)
1543 : a5 10 __ LDA P3 ; (f + 3)
1545 : 2a __ __ ROL
1546 : c9 ff __ CMP #$ff
1548 : d0 03 __ BNE $154d ; (isinf.s6 + 0)
.s5:
154a : a9 01 __ LDA #$01
154c : 60 __ __ RTS
.s6:
154d : a9 00 __ LDA #$00
.s3:
154f : 60 __ __ RTS
--------------------------------------------------------------------
1550 : __ __ __ BYT 48 6f 6e 64 61 6e 69 20 72 75 6c 65 7a 21 0a 00 : Hondani rulez!..
--------------------------------------------------------------------
freg: ; freg
1560 : b1 19 __ LDA (IP + 0),y 
1562 : c8 __ __ INY
1563 : aa __ __ TAX
1564 : b5 00 __ LDA $00,x 
1566 : 85 03 __ STA WORK + 0 
1568 : b5 01 __ LDA $01,x 
156a : 85 04 __ STA WORK + 1 
156c : b5 02 __ LDA $02,x 
156e : 85 05 __ STA WORK + 2 
1570 : b5 03 __ LDA WORK + 0,x 
1572 : 85 06 __ STA WORK + 3 
1574 : a5 05 __ LDA WORK + 2 
1576 : 0a __ __ ASL
1577 : a5 06 __ LDA WORK + 3 
1579 : 2a __ __ ROL
157a : 85 08 __ STA WORK + 5 
157c : f0 06 __ BEQ $1584 ; (freg + 36)
157e : a5 05 __ LDA WORK + 2 
1580 : 09 80 __ ORA #$80
1582 : 85 05 __ STA WORK + 2 
1584 : a5 1d __ LDA ACCU + 2 
1586 : 0a __ __ ASL
1587 : a5 1e __ LDA ACCU + 3 
1589 : 2a __ __ ROL
158a : 85 07 __ STA WORK + 4 
158c : f0 06 __ BEQ $1594 ; (freg + 52)
158e : a5 1d __ LDA ACCU + 2 
1590 : 09 80 __ ORA #$80
1592 : 85 1d __ STA ACCU + 2 
1594 : 60 __ __ RTS
1595 : 06 1e __ ASL ACCU + 3 
1597 : a5 07 __ LDA WORK + 4 
1599 : 6a __ __ ROR
159a : 85 1e __ STA ACCU + 3 
159c : b0 06 __ BCS $15a4 ; (freg + 68)
159e : a5 1d __ LDA ACCU + 2 
15a0 : 29 7f __ AND #$7f
15a2 : 85 1d __ STA ACCU + 2 
15a4 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
15a5 : a5 06 __ LDA WORK + 3 
15a7 : 49 80 __ EOR #$80
15a9 : 85 06 __ STA WORK + 3 
15ab : a9 ff __ LDA #$ff
15ad : c5 07 __ CMP WORK + 4 
15af : f0 04 __ BEQ $15b5 ; (faddsub + 16)
15b1 : c5 08 __ CMP WORK + 5 
15b3 : d0 11 __ BNE $15c6 ; (faddsub + 33)
15b5 : a5 1e __ LDA ACCU + 3 
15b7 : 09 7f __ ORA #$7f
15b9 : 85 1e __ STA ACCU + 3 
15bb : a9 80 __ LDA #$80
15bd : 85 1d __ STA ACCU + 2 
15bf : a9 00 __ LDA #$00
15c1 : 85 1b __ STA ACCU + 0 
15c3 : 85 1c __ STA ACCU + 1 
15c5 : 60 __ __ RTS
15c6 : 38 __ __ SEC
15c7 : a5 07 __ LDA WORK + 4 
15c9 : e5 08 __ SBC WORK + 5 
15cb : f0 38 __ BEQ $1605 ; (faddsub + 96)
15cd : aa __ __ TAX
15ce : b0 25 __ BCS $15f5 ; (faddsub + 80)
15d0 : e0 e9 __ CPX #$e9
15d2 : b0 0e __ BCS $15e2 ; (faddsub + 61)
15d4 : a5 08 __ LDA WORK + 5 
15d6 : 85 07 __ STA WORK + 4 
15d8 : a9 00 __ LDA #$00
15da : 85 1b __ STA ACCU + 0 
15dc : 85 1c __ STA ACCU + 1 
15de : 85 1d __ STA ACCU + 2 
15e0 : f0 23 __ BEQ $1605 ; (faddsub + 96)
15e2 : a5 1d __ LDA ACCU + 2 
15e4 : 4a __ __ LSR
15e5 : 66 1c __ ROR ACCU + 1 
15e7 : 66 1b __ ROR ACCU + 0 
15e9 : e8 __ __ INX
15ea : d0 f8 __ BNE $15e4 ; (faddsub + 63)
15ec : 85 1d __ STA ACCU + 2 
15ee : a5 08 __ LDA WORK + 5 
15f0 : 85 07 __ STA WORK + 4 
15f2 : 4c 05 16 JMP $1605 ; (faddsub + 96)
15f5 : e0 18 __ CPX #$18
15f7 : b0 33 __ BCS $162c ; (faddsub + 135)
15f9 : a5 05 __ LDA WORK + 2 
15fb : 4a __ __ LSR
15fc : 66 04 __ ROR WORK + 1 
15fe : 66 03 __ ROR WORK + 0 
1600 : ca __ __ DEX
1601 : d0 f8 __ BNE $15fb ; (faddsub + 86)
1603 : 85 05 __ STA WORK + 2 
1605 : a5 1e __ LDA ACCU + 3 
1607 : 29 80 __ AND #$80
1609 : 85 1e __ STA ACCU + 3 
160b : 45 06 __ EOR WORK + 3 
160d : 30 31 __ BMI $1640 ; (faddsub + 155)
160f : 18 __ __ CLC
1610 : a5 1b __ LDA ACCU + 0 
1612 : 65 03 __ ADC WORK + 0 
1614 : 85 1b __ STA ACCU + 0 
1616 : a5 1c __ LDA ACCU + 1 
1618 : 65 04 __ ADC WORK + 1 
161a : 85 1c __ STA ACCU + 1 
161c : a5 1d __ LDA ACCU + 2 
161e : 65 05 __ ADC WORK + 2 
1620 : 85 1d __ STA ACCU + 2 
1622 : 90 08 __ BCC $162c ; (faddsub + 135)
1624 : 66 1d __ ROR ACCU + 2 
1626 : 66 1c __ ROR ACCU + 1 
1628 : 66 1b __ ROR ACCU + 0 
162a : e6 07 __ INC WORK + 4 
162c : a5 07 __ LDA WORK + 4 
162e : c9 ff __ CMP #$ff
1630 : f0 83 __ BEQ $15b5 ; (faddsub + 16)
1632 : 4a __ __ LSR
1633 : 05 1e __ ORA ACCU + 3 
1635 : 85 1e __ STA ACCU + 3 
1637 : b0 06 __ BCS $163f ; (faddsub + 154)
1639 : a5 1d __ LDA ACCU + 2 
163b : 29 7f __ AND #$7f
163d : 85 1d __ STA ACCU + 2 
163f : 60 __ __ RTS
1640 : 38 __ __ SEC
1641 : a5 1b __ LDA ACCU + 0 
1643 : e5 03 __ SBC WORK + 0 
1645 : 85 1b __ STA ACCU + 0 
1647 : a5 1c __ LDA ACCU + 1 
1649 : e5 04 __ SBC WORK + 1 
164b : 85 1c __ STA ACCU + 1 
164d : a5 1d __ LDA ACCU + 2 
164f : e5 05 __ SBC WORK + 2 
1651 : 85 1d __ STA ACCU + 2 
1653 : b0 19 __ BCS $166e ; (faddsub + 201)
1655 : 38 __ __ SEC
1656 : a9 00 __ LDA #$00
1658 : e5 1b __ SBC ACCU + 0 
165a : 85 1b __ STA ACCU + 0 
165c : a9 00 __ LDA #$00
165e : e5 1c __ SBC ACCU + 1 
1660 : 85 1c __ STA ACCU + 1 
1662 : a9 00 __ LDA #$00
1664 : e5 1d __ SBC ACCU + 2 
1666 : 85 1d __ STA ACCU + 2 
1668 : a5 1e __ LDA ACCU + 3 
166a : 49 80 __ EOR #$80
166c : 85 1e __ STA ACCU + 3 
166e : a5 1d __ LDA ACCU + 2 
1670 : 30 ba __ BMI $162c ; (faddsub + 135)
1672 : 05 1c __ ORA ACCU + 1 
1674 : 05 1b __ ORA ACCU + 0 
1676 : f0 0f __ BEQ $1687 ; (faddsub + 226)
1678 : c6 07 __ DEC WORK + 4 
167a : f0 0b __ BEQ $1687 ; (faddsub + 226)
167c : 06 1b __ ASL ACCU + 0 
167e : 26 1c __ ROL ACCU + 1 
1680 : 26 1d __ ROL ACCU + 2 
1682 : 10 f4 __ BPL $1678 ; (faddsub + 211)
1684 : 4c 2c 16 JMP $162c ; (faddsub + 135)
1687 : a9 00 __ LDA #$00
1689 : 85 1b __ STA ACCU + 0 
168b : 85 1c __ STA ACCU + 1 
168d : 85 1d __ STA ACCU + 2 
168f : 85 1e __ STA ACCU + 3 
1691 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1692 : a5 1b __ LDA ACCU + 0 
1694 : 05 1c __ ORA ACCU + 1 
1696 : 05 1d __ ORA ACCU + 2 
1698 : f0 0e __ BEQ $16a8 ; (crt_fmul + 22)
169a : a5 03 __ LDA WORK + 0 
169c : 05 04 __ ORA WORK + 1 
169e : 05 05 __ ORA WORK + 2 
16a0 : d0 09 __ BNE $16ab ; (crt_fmul + 25)
16a2 : 85 1b __ STA ACCU + 0 
16a4 : 85 1c __ STA ACCU + 1 
16a6 : 85 1d __ STA ACCU + 2 
16a8 : 85 1e __ STA ACCU + 3 
16aa : 60 __ __ RTS
16ab : a5 1e __ LDA ACCU + 3 
16ad : 45 06 __ EOR WORK + 3 
16af : 29 80 __ AND #$80
16b1 : 85 1e __ STA ACCU + 3 
16b3 : a9 ff __ LDA #$ff
16b5 : c5 07 __ CMP WORK + 4 
16b7 : f0 42 __ BEQ $16fb ; (crt_fmul + 105)
16b9 : c5 08 __ CMP WORK + 5 
16bb : f0 3e __ BEQ $16fb ; (crt_fmul + 105)
16bd : a9 00 __ LDA #$00
16bf : 85 09 __ STA WORK + 6 
16c1 : 85 0a __ STA WORK + 7 
16c3 : 85 0b __ STA WORK + 8 
16c5 : a4 1b __ LDY ACCU + 0 
16c7 : a5 03 __ LDA WORK + 0 
16c9 : d0 06 __ BNE $16d1 ; (crt_fmul + 63)
16cb : a5 04 __ LDA WORK + 1 
16cd : f0 0a __ BEQ $16d9 ; (crt_fmul + 71)
16cf : d0 05 __ BNE $16d6 ; (crt_fmul + 68)
16d1 : 20 2c 17 JSR $172c ; (crt_fmul8 + 0)
16d4 : a5 04 __ LDA WORK + 1 
16d6 : 20 2c 17 JSR $172c ; (crt_fmul8 + 0)
16d9 : a5 05 __ LDA WORK + 2 
16db : 20 2c 17 JSR $172c ; (crt_fmul8 + 0)
16de : 38 __ __ SEC
16df : a5 0b __ LDA WORK + 8 
16e1 : 30 06 __ BMI $16e9 ; (crt_fmul + 87)
16e3 : 06 09 __ ASL WORK + 6 
16e5 : 26 0a __ ROL WORK + 7 
16e7 : 2a __ __ ROL
16e8 : 18 __ __ CLC
16e9 : 29 7f __ AND #$7f
16eb : 85 0b __ STA WORK + 8 
16ed : a5 07 __ LDA WORK + 4 
16ef : 65 08 __ ADC WORK + 5 
16f1 : 90 19 __ BCC $170c ; (crt_fmul + 122)
16f3 : e9 7f __ SBC #$7f
16f5 : b0 04 __ BCS $16fb ; (crt_fmul + 105)
16f7 : c9 ff __ CMP #$ff
16f9 : d0 15 __ BNE $1710 ; (crt_fmul + 126)
16fb : a5 1e __ LDA ACCU + 3 
16fd : 09 7f __ ORA #$7f
16ff : 85 1e __ STA ACCU + 3 
1701 : a9 80 __ LDA #$80
1703 : 85 1d __ STA ACCU + 2 
1705 : a9 00 __ LDA #$00
1707 : 85 1b __ STA ACCU + 0 
1709 : 85 1c __ STA ACCU + 1 
170b : 60 __ __ RTS
170c : e9 7e __ SBC #$7e
170e : 90 15 __ BCC $1725 ; (crt_fmul + 147)
1710 : 4a __ __ LSR
1711 : 05 1e __ ORA ACCU + 3 
1713 : 85 1e __ STA ACCU + 3 
1715 : a9 00 __ LDA #$00
1717 : 6a __ __ ROR
1718 : 05 0b __ ORA WORK + 8 
171a : 85 1d __ STA ACCU + 2 
171c : a5 0a __ LDA WORK + 7 
171e : 85 1c __ STA ACCU + 1 
1720 : a5 09 __ LDA WORK + 6 
1722 : 85 1b __ STA ACCU + 0 
1724 : 60 __ __ RTS
1725 : a9 00 __ LDA #$00
1727 : 85 1e __ STA ACCU + 3 
1729 : f0 d8 __ BEQ $1703 ; (crt_fmul + 113)
172b : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
172c : 38 __ __ SEC
172d : 6a __ __ ROR
172e : 90 1e __ BCC $174e ; (crt_fmul8 + 34)
1730 : aa __ __ TAX
1731 : 18 __ __ CLC
1732 : 98 __ __ TYA
1733 : 65 09 __ ADC WORK + 6 
1735 : 85 09 __ STA WORK + 6 
1737 : a5 0a __ LDA WORK + 7 
1739 : 65 1c __ ADC ACCU + 1 
173b : 85 0a __ STA WORK + 7 
173d : a5 0b __ LDA WORK + 8 
173f : 65 1d __ ADC ACCU + 2 
1741 : 6a __ __ ROR
1742 : 85 0b __ STA WORK + 8 
1744 : 8a __ __ TXA
1745 : 66 0a __ ROR WORK + 7 
1747 : 66 09 __ ROR WORK + 6 
1749 : 4a __ __ LSR
174a : f0 0d __ BEQ $1759 ; (crt_fmul8 + 45)
174c : b0 e2 __ BCS $1730 ; (crt_fmul8 + 4)
174e : 66 0b __ ROR WORK + 8 
1750 : 66 0a __ ROR WORK + 7 
1752 : 66 09 __ ROR WORK + 6 
1754 : 4a __ __ LSR
1755 : 90 f7 __ BCC $174e ; (crt_fmul8 + 34)
1757 : d0 d7 __ BNE $1730 ; (crt_fmul8 + 4)
1759 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
175a : a5 1b __ LDA ACCU + 0 
175c : 05 1c __ ORA ACCU + 1 
175e : 05 1d __ ORA ACCU + 2 
1760 : d0 03 __ BNE $1765 ; (crt_fdiv + 11)
1762 : 85 1e __ STA ACCU + 3 
1764 : 60 __ __ RTS
1765 : a5 1e __ LDA ACCU + 3 
1767 : 45 06 __ EOR WORK + 3 
1769 : 29 80 __ AND #$80
176b : 85 1e __ STA ACCU + 3 
176d : a5 08 __ LDA WORK + 5 
176f : f0 62 __ BEQ $17d3 ; (crt_fdiv + 121)
1771 : a5 07 __ LDA WORK + 4 
1773 : c9 ff __ CMP #$ff
1775 : f0 5c __ BEQ $17d3 ; (crt_fdiv + 121)
1777 : a9 00 __ LDA #$00
1779 : 85 09 __ STA WORK + 6 
177b : 85 0a __ STA WORK + 7 
177d : 85 0b __ STA WORK + 8 
177f : a2 18 __ LDX #$18
1781 : a5 1b __ LDA ACCU + 0 
1783 : c5 03 __ CMP WORK + 0 
1785 : a5 1c __ LDA ACCU + 1 
1787 : e5 04 __ SBC WORK + 1 
1789 : a5 1d __ LDA ACCU + 2 
178b : e5 05 __ SBC WORK + 2 
178d : 90 13 __ BCC $17a2 ; (crt_fdiv + 72)
178f : a5 1b __ LDA ACCU + 0 
1791 : e5 03 __ SBC WORK + 0 
1793 : 85 1b __ STA ACCU + 0 
1795 : a5 1c __ LDA ACCU + 1 
1797 : e5 04 __ SBC WORK + 1 
1799 : 85 1c __ STA ACCU + 1 
179b : a5 1d __ LDA ACCU + 2 
179d : e5 05 __ SBC WORK + 2 
179f : 85 1d __ STA ACCU + 2 
17a1 : 38 __ __ SEC
17a2 : 26 09 __ ROL WORK + 6 
17a4 : 26 0a __ ROL WORK + 7 
17a6 : 26 0b __ ROL WORK + 8 
17a8 : ca __ __ DEX
17a9 : f0 0a __ BEQ $17b5 ; (crt_fdiv + 91)
17ab : 06 1b __ ASL ACCU + 0 
17ad : 26 1c __ ROL ACCU + 1 
17af : 26 1d __ ROL ACCU + 2 
17b1 : b0 dc __ BCS $178f ; (crt_fdiv + 53)
17b3 : 90 cc __ BCC $1781 ; (crt_fdiv + 39)
17b5 : 38 __ __ SEC
17b6 : a5 0b __ LDA WORK + 8 
17b8 : 30 06 __ BMI $17c0 ; (crt_fdiv + 102)
17ba : 06 09 __ ASL WORK + 6 
17bc : 26 0a __ ROL WORK + 7 
17be : 2a __ __ ROL
17bf : 18 __ __ CLC
17c0 : 29 7f __ AND #$7f
17c2 : 85 0b __ STA WORK + 8 
17c4 : a5 07 __ LDA WORK + 4 
17c6 : e5 08 __ SBC WORK + 5 
17c8 : 90 1a __ BCC $17e4 ; (crt_fdiv + 138)
17ca : 18 __ __ CLC
17cb : 69 7f __ ADC #$7f
17cd : b0 04 __ BCS $17d3 ; (crt_fdiv + 121)
17cf : c9 ff __ CMP #$ff
17d1 : d0 15 __ BNE $17e8 ; (crt_fdiv + 142)
17d3 : a5 1e __ LDA ACCU + 3 
17d5 : 09 7f __ ORA #$7f
17d7 : 85 1e __ STA ACCU + 3 
17d9 : a9 80 __ LDA #$80
17db : 85 1d __ STA ACCU + 2 
17dd : a9 00 __ LDA #$00
17df : 85 1c __ STA ACCU + 1 
17e1 : 85 1b __ STA ACCU + 0 
17e3 : 60 __ __ RTS
17e4 : 69 7f __ ADC #$7f
17e6 : 90 15 __ BCC $17fd ; (crt_fdiv + 163)
17e8 : 4a __ __ LSR
17e9 : 05 1e __ ORA ACCU + 3 
17eb : 85 1e __ STA ACCU + 3 
17ed : a9 00 __ LDA #$00
17ef : 6a __ __ ROR
17f0 : 05 0b __ ORA WORK + 8 
17f2 : 85 1d __ STA ACCU + 2 
17f4 : a5 0a __ LDA WORK + 7 
17f6 : 85 1c __ STA ACCU + 1 
17f8 : a5 09 __ LDA WORK + 6 
17fa : 85 1b __ STA ACCU + 0 
17fc : 60 __ __ RTS
17fd : a9 00 __ LDA #$00
17ff : 85 1e __ STA ACCU + 3 
1801 : 85 1d __ STA ACCU + 2 
1803 : 85 1c __ STA ACCU + 1 
1805 : 85 1b __ STA ACCU + 0 
1807 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1808 : 24 1c __ BIT ACCU + 1 
180a : 10 0d __ BPL $1819 ; (divs16 + 17)
180c : 20 26 18 JSR $1826 ; (negaccu + 0)
180f : 24 04 __ BIT WORK + 1 
1811 : 10 0d __ BPL $1820 ; (divs16 + 24)
1813 : 20 34 18 JSR $1834 ; (negtmp + 0)
1816 : 4c 42 18 JMP $1842 ; (divmod + 0)
1819 : 24 04 __ BIT WORK + 1 
181b : 10 f9 __ BPL $1816 ; (divs16 + 14)
181d : 20 34 18 JSR $1834 ; (negtmp + 0)
1820 : 20 42 18 JSR $1842 ; (divmod + 0)
1823 : 4c 26 18 JMP $1826 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1826 : 38 __ __ SEC
1827 : a9 00 __ LDA #$00
1829 : e5 1b __ SBC ACCU + 0 
182b : 85 1b __ STA ACCU + 0 
182d : a9 00 __ LDA #$00
182f : e5 1c __ SBC ACCU + 1 
1831 : 85 1c __ STA ACCU + 1 
1833 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1834 : 38 __ __ SEC
1835 : a9 00 __ LDA #$00
1837 : e5 03 __ SBC WORK + 0 
1839 : 85 03 __ STA WORK + 0 
183b : a9 00 __ LDA #$00
183d : e5 04 __ SBC WORK + 1 
183f : 85 04 __ STA WORK + 1 
1841 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1842 : a5 1c __ LDA ACCU + 1 
1844 : d0 31 __ BNE $1877 ; (divmod + 53)
1846 : a5 04 __ LDA WORK + 1 
1848 : d0 1e __ BNE $1868 ; (divmod + 38)
184a : 85 06 __ STA WORK + 3 
184c : a2 04 __ LDX #$04
184e : 06 1b __ ASL ACCU + 0 
1850 : 2a __ __ ROL
1851 : c5 03 __ CMP WORK + 0 
1853 : 90 02 __ BCC $1857 ; (divmod + 21)
1855 : e5 03 __ SBC WORK + 0 
1857 : 26 1b __ ROL ACCU + 0 
1859 : 2a __ __ ROL
185a : c5 03 __ CMP WORK + 0 
185c : 90 02 __ BCC $1860 ; (divmod + 30)
185e : e5 03 __ SBC WORK + 0 
1860 : 26 1b __ ROL ACCU + 0 
1862 : ca __ __ DEX
1863 : d0 eb __ BNE $1850 ; (divmod + 14)
1865 : 85 05 __ STA WORK + 2 
1867 : 60 __ __ RTS
1868 : a5 1b __ LDA ACCU + 0 
186a : 85 05 __ STA WORK + 2 
186c : a5 1c __ LDA ACCU + 1 
186e : 85 06 __ STA WORK + 3 
1870 : a9 00 __ LDA #$00
1872 : 85 1b __ STA ACCU + 0 
1874 : 85 1c __ STA ACCU + 1 
1876 : 60 __ __ RTS
1877 : a5 04 __ LDA WORK + 1 
1879 : d0 1f __ BNE $189a ; (divmod + 88)
187b : a5 03 __ LDA WORK + 0 
187d : 30 1b __ BMI $189a ; (divmod + 88)
187f : a9 00 __ LDA #$00
1881 : 85 06 __ STA WORK + 3 
1883 : a2 10 __ LDX #$10
1885 : 06 1b __ ASL ACCU + 0 
1887 : 26 1c __ ROL ACCU + 1 
1889 : 2a __ __ ROL
188a : c5 03 __ CMP WORK + 0 
188c : 90 02 __ BCC $1890 ; (divmod + 78)
188e : e5 03 __ SBC WORK + 0 
1890 : 26 1b __ ROL ACCU + 0 
1892 : 26 1c __ ROL ACCU + 1 
1894 : ca __ __ DEX
1895 : d0 f2 __ BNE $1889 ; (divmod + 71)
1897 : 85 05 __ STA WORK + 2 
1899 : 60 __ __ RTS
189a : a9 00 __ LDA #$00
189c : 85 05 __ STA WORK + 2 
189e : 85 06 __ STA WORK + 3 
18a0 : 84 02 __ STY $02 
18a2 : a0 10 __ LDY #$10
18a4 : 18 __ __ CLC
18a5 : 26 1b __ ROL ACCU + 0 
18a7 : 26 1c __ ROL ACCU + 1 
18a9 : 26 05 __ ROL WORK + 2 
18ab : 26 06 __ ROL WORK + 3 
18ad : 38 __ __ SEC
18ae : a5 05 __ LDA WORK + 2 
18b0 : e5 03 __ SBC WORK + 0 
18b2 : aa __ __ TAX
18b3 : a5 06 __ LDA WORK + 3 
18b5 : e5 04 __ SBC WORK + 1 
18b7 : 90 04 __ BCC $18bd ; (divmod + 123)
18b9 : 86 05 __ STX WORK + 2 
18bb : 85 06 __ STA WORK + 3 
18bd : 88 __ __ DEY
18be : d0 e5 __ BNE $18a5 ; (divmod + 99)
18c0 : 26 1b __ ROL ACCU + 0 
18c2 : 26 1c __ ROL ACCU + 1 
18c4 : a4 02 __ LDY $02 
18c6 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
18c7 : 24 1c __ BIT ACCU + 1 
18c9 : 10 10 __ BPL $18db ; (mods16 + 20)
18cb : 20 26 18 JSR $1826 ; (negaccu + 0)
18ce : 24 04 __ BIT WORK + 1 
18d0 : 10 03 __ BPL $18d5 ; (mods16 + 14)
18d2 : 20 34 18 JSR $1834 ; (negtmp + 0)
18d5 : 20 42 18 JSR $1842 ; (divmod + 0)
18d8 : 4c e6 18 JMP $18e6 ; (negtmpb + 0)
18db : 24 04 __ BIT WORK + 1 
18dd : 10 03 __ BPL $18e2 ; (mods16 + 27)
18df : 20 34 18 JSR $1834 ; (negtmp + 0)
18e2 : 4c 42 18 JMP $1842 ; (divmod + 0)
18e5 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
18e6 : 38 __ __ SEC
18e7 : a9 00 __ LDA #$00
18e9 : e5 05 __ SBC WORK + 2 
18eb : 85 05 __ STA WORK + 2 
18ed : a9 00 __ LDA #$00
18ef : e5 06 __ SBC WORK + 3 
18f1 : 85 06 __ STA WORK + 3 
18f3 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
18f4 : 20 84 15 JSR $1584 ; (freg + 36)
18f7 : a5 07 __ LDA WORK + 4 
18f9 : c9 7f __ CMP #$7f
18fb : b0 07 __ BCS $1904 ; (f32_to_i16 + 16)
18fd : a9 00 __ LDA #$00
18ff : 85 1b __ STA ACCU + 0 
1901 : 85 1c __ STA ACCU + 1 
1903 : 60 __ __ RTS
1904 : e9 8e __ SBC #$8e
1906 : 90 16 __ BCC $191e ; (f32_to_i16 + 42)
1908 : 24 1e __ BIT ACCU + 3 
190a : 30 09 __ BMI $1915 ; (f32_to_i16 + 33)
190c : a9 ff __ LDA #$ff
190e : 85 1b __ STA ACCU + 0 
1910 : a9 7f __ LDA #$7f
1912 : 85 1c __ STA ACCU + 1 
1914 : 60 __ __ RTS
1915 : a9 00 __ LDA #$00
1917 : 85 1b __ STA ACCU + 0 
1919 : a9 80 __ LDA #$80
191b : 85 1c __ STA ACCU + 1 
191d : 60 __ __ RTS
191e : aa __ __ TAX
191f : a5 1c __ LDA ACCU + 1 
1921 : 46 1d __ LSR ACCU + 2 
1923 : 6a __ __ ROR
1924 : e8 __ __ INX
1925 : d0 fa __ BNE $1921 ; (f32_to_i16 + 45)
1927 : 24 1e __ BIT ACCU + 3 
1929 : 10 0e __ BPL $1939 ; (f32_to_i16 + 69)
192b : 38 __ __ SEC
192c : 49 ff __ EOR #$ff
192e : 69 00 __ ADC #$00
1930 : 85 1b __ STA ACCU + 0 
1932 : a9 00 __ LDA #$00
1934 : e5 1d __ SBC ACCU + 2 
1936 : 85 1c __ STA ACCU + 1 
1938 : 60 __ __ RTS
1939 : 85 1b __ STA ACCU + 0 
193b : a5 1d __ LDA ACCU + 2 
193d : 85 1c __ STA ACCU + 1 
193f : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1940 : 24 1c __ BIT ACCU + 1 
1942 : 30 03 __ BMI $1947 ; (sint16_to_float + 7)
1944 : 4c 5e 19 JMP $195e ; (uint16_to_float + 0)
1947 : 38 __ __ SEC
1948 : a9 00 __ LDA #$00
194a : e5 1b __ SBC ACCU + 0 
194c : 85 1b __ STA ACCU + 0 
194e : a9 00 __ LDA #$00
1950 : e5 1c __ SBC ACCU + 1 
1952 : 85 1c __ STA ACCU + 1 
1954 : 20 5e 19 JSR $195e ; (uint16_to_float + 0)
1957 : a5 1e __ LDA ACCU + 3 
1959 : 09 80 __ ORA #$80
195b : 85 1e __ STA ACCU + 3 
195d : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
195e : a5 1b __ LDA ACCU + 0 
1960 : 05 1c __ ORA ACCU + 1 
1962 : d0 05 __ BNE $1969 ; (uint16_to_float + 11)
1964 : 85 1d __ STA ACCU + 2 
1966 : 85 1e __ STA ACCU + 3 
1968 : 60 __ __ RTS
1969 : a2 8e __ LDX #$8e
196b : a5 1c __ LDA ACCU + 1 
196d : 30 06 __ BMI $1975 ; (uint16_to_float + 23)
196f : ca __ __ DEX
1970 : 06 1b __ ASL ACCU + 0 
1972 : 2a __ __ ROL
1973 : 10 fa __ BPL $196f ; (uint16_to_float + 17)
1975 : 0a __ __ ASL
1976 : 85 1d __ STA ACCU + 2 
1978 : a5 1b __ LDA ACCU + 0 
197a : 85 1c __ STA ACCU + 1 
197c : 8a __ __ TXA
197d : 4a __ __ LSR
197e : 85 1e __ STA ACCU + 3 
1980 : a9 00 __ LDA #$00
1982 : 85 1b __ STA ACCU + 0 
1984 : 66 1d __ ROR ACCU + 2 
1986 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1987 : 84 02 __ STY $02 
1989 : a0 20 __ LDY #$20
198b : a9 00 __ LDA #$00
198d : 85 07 __ STA WORK + 4 
198f : 85 08 __ STA WORK + 5 
1991 : 85 09 __ STA WORK + 6 
1993 : 85 0a __ STA WORK + 7 
1995 : a5 05 __ LDA WORK + 2 
1997 : 05 06 __ ORA WORK + 3 
1999 : d0 78 __ BNE $1a13 ; (divmod32 + 140)
199b : a5 04 __ LDA WORK + 1 
199d : d0 27 __ BNE $19c6 ; (divmod32 + 63)
199f : 18 __ __ CLC
19a0 : 26 1b __ ROL ACCU + 0 
19a2 : 26 1c __ ROL ACCU + 1 
19a4 : 26 1d __ ROL ACCU + 2 
19a6 : 26 1e __ ROL ACCU + 3 
19a8 : 2a __ __ ROL
19a9 : 90 05 __ BCC $19b0 ; (divmod32 + 41)
19ab : e5 03 __ SBC WORK + 0 
19ad : 38 __ __ SEC
19ae : b0 06 __ BCS $19b6 ; (divmod32 + 47)
19b0 : c5 03 __ CMP WORK + 0 
19b2 : 90 02 __ BCC $19b6 ; (divmod32 + 47)
19b4 : e5 03 __ SBC WORK + 0 
19b6 : 88 __ __ DEY
19b7 : d0 e7 __ BNE $19a0 ; (divmod32 + 25)
19b9 : 85 07 __ STA WORK + 4 
19bb : 26 1b __ ROL ACCU + 0 
19bd : 26 1c __ ROL ACCU + 1 
19bf : 26 1d __ ROL ACCU + 2 
19c1 : 26 1e __ ROL ACCU + 3 
19c3 : a4 02 __ LDY $02 
19c5 : 60 __ __ RTS
19c6 : a5 1e __ LDA ACCU + 3 
19c8 : d0 10 __ BNE $19da ; (divmod32 + 83)
19ca : a6 1d __ LDX ACCU + 2 
19cc : 86 1e __ STX ACCU + 3 
19ce : a6 1c __ LDX ACCU + 1 
19d0 : 86 1d __ STX ACCU + 2 
19d2 : a6 1b __ LDX ACCU + 0 
19d4 : 86 1c __ STX ACCU + 1 
19d6 : 85 1b __ STA ACCU + 0 
19d8 : a0 18 __ LDY #$18
19da : 18 __ __ CLC
19db : 26 1b __ ROL ACCU + 0 
19dd : 26 1c __ ROL ACCU + 1 
19df : 26 1d __ ROL ACCU + 2 
19e1 : 26 1e __ ROL ACCU + 3 
19e3 : 26 07 __ ROL WORK + 4 
19e5 : 26 08 __ ROL WORK + 5 
19e7 : 90 0c __ BCC $19f5 ; (divmod32 + 110)
19e9 : a5 07 __ LDA WORK + 4 
19eb : e5 03 __ SBC WORK + 0 
19ed : aa __ __ TAX
19ee : a5 08 __ LDA WORK + 5 
19f0 : e5 04 __ SBC WORK + 1 
19f2 : 38 __ __ SEC
19f3 : b0 0c __ BCS $1a01 ; (divmod32 + 122)
19f5 : 38 __ __ SEC
19f6 : a5 07 __ LDA WORK + 4 
19f8 : e5 03 __ SBC WORK + 0 
19fa : aa __ __ TAX
19fb : a5 08 __ LDA WORK + 5 
19fd : e5 04 __ SBC WORK + 1 
19ff : 90 04 __ BCC $1a05 ; (divmod32 + 126)
1a01 : 86 07 __ STX WORK + 4 
1a03 : 85 08 __ STA WORK + 5 
1a05 : 88 __ __ DEY
1a06 : d0 d3 __ BNE $19db ; (divmod32 + 84)
1a08 : 26 1b __ ROL ACCU + 0 
1a0a : 26 1c __ ROL ACCU + 1 
1a0c : 26 1d __ ROL ACCU + 2 
1a0e : 26 1e __ ROL ACCU + 3 
1a10 : a4 02 __ LDY $02 
1a12 : 60 __ __ RTS
1a13 : a0 10 __ LDY #$10
1a15 : a5 1e __ LDA ACCU + 3 
1a17 : 85 08 __ STA WORK + 5 
1a19 : a5 1d __ LDA ACCU + 2 
1a1b : 85 07 __ STA WORK + 4 
1a1d : a9 00 __ LDA #$00
1a1f : 85 1d __ STA ACCU + 2 
1a21 : 85 1e __ STA ACCU + 3 
1a23 : 18 __ __ CLC
1a24 : 26 1b __ ROL ACCU + 0 
1a26 : 26 1c __ ROL ACCU + 1 
1a28 : 26 07 __ ROL WORK + 4 
1a2a : 26 08 __ ROL WORK + 5 
1a2c : 26 09 __ ROL WORK + 6 
1a2e : 26 0a __ ROL WORK + 7 
1a30 : a5 07 __ LDA WORK + 4 
1a32 : c5 03 __ CMP WORK + 0 
1a34 : a5 08 __ LDA WORK + 5 
1a36 : e5 04 __ SBC WORK + 1 
1a38 : a5 09 __ LDA WORK + 6 
1a3a : e5 05 __ SBC WORK + 2 
1a3c : aa __ __ TAX
1a3d : a5 0a __ LDA WORK + 7 
1a3f : e5 06 __ SBC WORK + 3 
1a41 : 90 11 __ BCC $1a54 ; (divmod32 + 205)
1a43 : 86 09 __ STX WORK + 6 
1a45 : 85 0a __ STA WORK + 7 
1a47 : a5 07 __ LDA WORK + 4 
1a49 : e5 03 __ SBC WORK + 0 
1a4b : 85 07 __ STA WORK + 4 
1a4d : a5 08 __ LDA WORK + 5 
1a4f : e5 04 __ SBC WORK + 1 
1a51 : 85 08 __ STA WORK + 5 
1a53 : 38 __ __ SEC
1a54 : 88 __ __ DEY
1a55 : d0 cd __ BNE $1a24 ; (divmod32 + 157)
1a57 : 26 1b __ ROL ACCU + 0 
1a59 : 26 1c __ ROL ACCU + 1 
1a5b : a4 02 __ LDY $02 
1a5d : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1a5e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1a5f : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1a60 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1a70 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
