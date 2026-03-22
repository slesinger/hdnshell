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
080e : 8e b9 1c STX $1cb9 ; (spentry + 0)
0811 : a2 1c __ LDX #$1c
0813 : a0 e4 __ LDY #$e4
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 25 __ CPX #$25
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
;  12, "/home/honza/projects/c64/projects/hdnsh/oscar/digitalclock/digitalclock.c"
.s4:
0880 : 20 78 15 JSR $1578 ; (rand.s4 + 0)
0883 : a5 1b __ LDA ACCU + 0 
0885 : 8d fe 9f STA $9ffe ; (sstack + 10)
0888 : a5 1c __ LDA ACCU + 1 
088a : 8d ff 9f STA $9fff ; (sstack + 11)
088d : a9 74 __ LDA #$74
088f : 8d fc 9f STA $9ffc ; (sstack + 8)
0892 : a9 15 __ LDA #$15
0894 : 8d fd 9f STA $9ffd ; (sstack + 9)
0897 : 20 bd 08 JSR $08bd ; (printf.s4 + 0)
089a : 20 9f 15 JSR $159f ; (uii_identify.s4 + 0)
.l5:
089d : a9 52 __ LDA #$52
089f : 8d fc 9f STA $9ffc ; (sstack + 8)
08a2 : a9 17 __ LDA #$17
08a4 : 8d fd 9f STA $9ffd ; (sstack + 9)
08a7 : a9 e4 __ LDA #$e4
08a9 : 8d fe 9f STA $9ffe ; (sstack + 10)
08ac : a9 1c __ LDA #$1c
08ae : 8d ff 9f STA $9fff ; (sstack + 11)
08b1 : 20 bd 08 JSR $08bd ; (printf.s4 + 0)
08b4 : 20 56 17 JSR $1756 ; (getpch.s4 + 0)
08b7 : 20 92 17 JSR $1792 ; (uii_get_time.s4 + 0)
08ba : 4c 9d 08 JMP $089d ; (main.l5 + 0)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.h"
.s4:
08bd : a9 01 __ LDA #$01
08bf : 8d fb 9f STA $9ffb ; (sstack + 7)
08c2 : a9 a0 __ LDA #$a0
08c4 : 8d f5 9f STA $9ff5 ; (sstack + 1)
08c7 : a9 9f __ LDA #$9f
08c9 : 8d f6 9f STA $9ff6 ; (sstack + 2)
08cc : ad fc 9f LDA $9ffc ; (sstack + 8)
08cf : 8d f7 9f STA $9ff7 ; (sstack + 3)
08d2 : ad fd 9f LDA $9ffd ; (sstack + 9)
08d5 : 8d f8 9f STA $9ff8 ; (sstack + 4)
08d8 : a9 fe __ LDA #$fe
08da : 8d f9 9f STA $9ff9 ; (sstack + 5)
08dd : a9 9f __ LDA #$9f
08df : 8d fa 9f STA $9ffa ; (sstack + 6)
08e2 : 4c e5 08 JMP $08e5 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s1:
08e5 : a2 09 __ LDX #$09
08e7 : b5 53 __ LDA T1 + 0,x 
08e9 : 9d d2 9f STA $9fd2,x ; (sformat@stack + 0)
08ec : ca __ __ DEX
08ed : 10 f8 __ BPL $08e7 ; (sformat.s1 + 2)
.s4:
08ef : ad f7 9f LDA $9ff7 ; (sstack + 3)
08f2 : 85 55 __ STA T3 + 0 
08f4 : a9 00 __ LDA #$00
08f6 : 85 5b __ STA T6 + 0 
08f8 : ad f8 9f LDA $9ff8 ; (sstack + 4)
08fb : 85 56 __ STA T3 + 1 
08fd : ad f5 9f LDA $9ff5 ; (sstack + 1)
0900 : 85 57 __ STA T4 + 0 
0902 : ad f6 9f LDA $9ff6 ; (sstack + 2)
0905 : 85 58 __ STA T4 + 1 
.l5:
0907 : a0 00 __ LDY #$00
0909 : b1 55 __ LDA (T3 + 0),y 
090b : d0 36 __ BNE $0943 ; (sformat.s10 + 0)
.s6:
090d : a4 5b __ LDY T6 + 0 
090f : 91 57 __ STA (T4 + 0),y 
0911 : 98 __ __ TYA
0912 : f0 28 __ BEQ $093c ; (sformat.s95 + 0)
.s7:
0914 : ad fb 9f LDA $9ffb ; (sstack + 7)
0917 : d0 18 __ BNE $0931 ; (sformat.s9 + 0)
.s8:
0919 : 98 __ __ TYA
091a : 18 __ __ CLC
091b : 65 57 __ ADC T4 + 0 
091d : aa __ __ TAX
091e : a5 58 __ LDA T4 + 1 
0920 : 69 00 __ ADC #$00
.s3:
0922 : 86 1b __ STX ACCU + 0 ; (buff + 1)
0924 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0926 : a2 09 __ LDX #$09
0928 : bd d2 9f LDA $9fd2,x ; (sformat@stack + 0)
092b : 95 53 __ STA T1 + 0,x 
092d : ca __ __ DEX
092e : 10 f8 __ BPL $0928 ; (sformat.s3 + 6)
0930 : 60 __ __ RTS
.s9:
0931 : a5 57 __ LDA T4 + 0 
0933 : 85 0e __ STA P1 
0935 : a5 58 __ LDA T4 + 1 
0937 : 85 0f __ STA P2 
0939 : 20 26 0d JSR $0d26 ; (puts.l4 + 0)
.s95:
093c : a5 58 __ LDA T4 + 1 
093e : a6 57 __ LDX T4 + 0 
0940 : 4c 22 09 JMP $0922 ; (sformat.s3 + 0)
.s10:
0943 : c9 25 __ CMP #$25
0945 : f0 3e __ BEQ $0985 ; (sformat.s15 + 0)
.s11:
0947 : a4 5b __ LDY T6 + 0 
0949 : 91 57 __ STA (T4 + 0),y 
094b : e6 55 __ INC T3 + 0 
094d : d0 02 __ BNE $0951 ; (sformat.s117 + 0)
.s116:
094f : e6 56 __ INC T3 + 1 
.s117:
0951 : c8 __ __ INY
0952 : 84 5b __ STY T6 + 0 
0954 : 98 __ __ TYA
0955 : c0 28 __ CPY #$28
0957 : 90 ae __ BCC $0907 ; (sformat.l5 + 0)
.s12:
0959 : 85 43 __ STA T0 + 0 
095b : a9 00 __ LDA #$00
095d : 85 5b __ STA T6 + 0 
095f : ad fb 9f LDA $9ffb ; (sstack + 7)
0962 : f0 14 __ BEQ $0978 ; (sformat.s13 + 0)
.s14:
0964 : a5 57 __ LDA T4 + 0 
0966 : 85 0e __ STA P1 
0968 : a5 58 __ LDA T4 + 1 
096a : 85 0f __ STA P2 
096c : a9 00 __ LDA #$00
096e : a4 43 __ LDY T0 + 0 
0970 : 91 0e __ STA (P1),y 
0972 : 20 26 0d JSR $0d26 ; (puts.l4 + 0)
0975 : 4c 07 09 JMP $0907 ; (sformat.l5 + 0)
.s13:
0978 : 18 __ __ CLC
0979 : a5 57 __ LDA T4 + 0 
097b : 65 43 __ ADC T0 + 0 
097d : 85 57 __ STA T4 + 0 
097f : 90 86 __ BCC $0907 ; (sformat.l5 + 0)
.s118:
0981 : e6 58 __ INC T4 + 1 
0983 : b0 82 __ BCS $0907 ; (sformat.l5 + 0)
.s15:
0985 : a5 5b __ LDA T6 + 0 
0987 : f0 27 __ BEQ $09b0 ; (sformat.s16 + 0)
.s89:
0989 : 84 5b __ STY T6 + 0 
098b : 85 43 __ STA T0 + 0 
098d : ad fb 9f LDA $9ffb ; (sstack + 7)
0990 : f0 13 __ BEQ $09a5 ; (sformat.s90 + 0)
.s91:
0992 : a5 57 __ LDA T4 + 0 
0994 : 85 0e __ STA P1 
0996 : a5 58 __ LDA T4 + 1 
0998 : 85 0f __ STA P2 
099a : 98 __ __ TYA
099b : a4 43 __ LDY T0 + 0 
099d : 91 0e __ STA (P1),y 
099f : 20 26 0d JSR $0d26 ; (puts.l4 + 0)
09a2 : 4c b0 09 JMP $09b0 ; (sformat.s16 + 0)
.s90:
09a5 : 18 __ __ CLC
09a6 : a5 57 __ LDA T4 + 0 
09a8 : 65 43 __ ADC T0 + 0 
09aa : 85 57 __ STA T4 + 0 
09ac : 90 02 __ BCC $09b0 ; (sformat.s16 + 0)
.s115:
09ae : e6 58 __ INC T4 + 1 
.s16:
09b0 : a9 00 __ LDA #$00
09b2 : 8d e1 9f STA $9fe1 ; (si.sign + 0)
09b5 : 8d e2 9f STA $9fe2 ; (si.left + 0)
09b8 : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
09bb : a0 01 __ LDY #$01
09bd : b1 55 __ LDA (T3 + 0),y 
09bf : a2 20 __ LDX #$20
09c1 : 8e dc 9f STX $9fdc ; (si.fill + 0)
09c4 : a2 00 __ LDX #$00
09c6 : 8e dd 9f STX $9fdd ; (si.width + 0)
09c9 : ca __ __ DEX
09ca : 8e de 9f STX $9fde ; (si.precision + 0)
09cd : a2 0a __ LDX #$0a
09cf : 8e e0 9f STX $9fe0 ; (si.base + 0)
09d2 : aa __ __ TAX
09d3 : a9 02 __ LDA #$02
09d5 : d0 07 __ BNE $09de ; (sformat.l17 + 0)
.s85:
09d7 : a0 00 __ LDY #$00
09d9 : b1 55 __ LDA (T3 + 0),y 
09db : aa __ __ TAX
09dc : a9 01 __ LDA #$01
.l17:
09de : 18 __ __ CLC
09df : 65 55 __ ADC T3 + 0 
09e1 : 85 55 __ STA T3 + 0 
09e3 : 90 02 __ BCC $09e7 ; (sformat.s106 + 0)
.s105:
09e5 : e6 56 __ INC T3 + 1 
.s106:
09e7 : 8a __ __ TXA
09e8 : e0 2b __ CPX #$2b
09ea : d0 07 __ BNE $09f3 ; (sformat.s18 + 0)
.s88:
09ec : a9 01 __ LDA #$01
09ee : 8d e1 9f STA $9fe1 ; (si.sign + 0)
09f1 : d0 e4 __ BNE $09d7 ; (sformat.s85 + 0)
.s18:
09f3 : c9 30 __ CMP #$30
09f5 : d0 06 __ BNE $09fd ; (sformat.s19 + 0)
.s87:
09f7 : 8d dc 9f STA $9fdc ; (si.fill + 0)
09fa : 4c d7 09 JMP $09d7 ; (sformat.s85 + 0)
.s19:
09fd : c9 23 __ CMP #$23
09ff : d0 07 __ BNE $0a08 ; (sformat.s20 + 0)
.s86:
0a01 : a9 01 __ LDA #$01
0a03 : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
0a06 : d0 cf __ BNE $09d7 ; (sformat.s85 + 0)
.s20:
0a08 : c9 2d __ CMP #$2d
0a0a : d0 07 __ BNE $0a13 ; (sformat.s21 + 0)
.s84:
0a0c : a9 01 __ LDA #$01
0a0e : 8d e2 9f STA $9fe2 ; (si.left + 0)
0a11 : d0 c4 __ BNE $09d7 ; (sformat.s85 + 0)
.s21:
0a13 : 85 47 __ STA T2 + 0 
0a15 : c9 30 __ CMP #$30
0a17 : 90 3c __ BCC $0a55 ; (sformat.s22 + 0)
.s80:
0a19 : c9 3a __ CMP #$3a
0a1b : b0 77 __ BCS $0a94 ; (sformat.s23 + 0)
.s81:
0a1d : a9 00 __ LDA #$00
0a1f : 85 53 __ STA T1 + 0 
.l82:
0a21 : a5 53 __ LDA T1 + 0 
0a23 : 0a __ __ ASL
0a24 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0a26 : a9 00 __ LDA #$00
0a28 : 2a __ __ ROL
0a29 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0a2b : 2a __ __ ROL
0a2c : aa __ __ TAX
0a2d : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0a2f : 65 53 __ ADC T1 + 0 
0a31 : 0a __ __ ASL
0a32 : 18 __ __ CLC
0a33 : 65 47 __ ADC T2 + 0 
0a35 : 38 __ __ SEC
0a36 : e9 30 __ SBC #$30
0a38 : 85 53 __ STA T1 + 0 
0a3a : a0 00 __ LDY #$00
0a3c : b1 55 __ LDA (T3 + 0),y 
0a3e : 85 47 __ STA T2 + 0 
0a40 : e6 55 __ INC T3 + 0 
0a42 : d0 02 __ BNE $0a46 ; (sformat.s114 + 0)
.s113:
0a44 : e6 56 __ INC T3 + 1 
.s114:
0a46 : c9 30 __ CMP #$30
0a48 : 90 04 __ BCC $0a4e ; (sformat.s104 + 0)
.s83:
0a4a : c9 3a __ CMP #$3a
0a4c : 90 d3 __ BCC $0a21 ; (sformat.l82 + 0)
.s104:
0a4e : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0a50 : a6 53 __ LDX T1 + 0 
0a52 : 8e dd 9f STX $9fdd ; (si.width + 0)
.s22:
0a55 : c9 2e __ CMP #$2e
0a57 : d0 3b __ BNE $0a94 ; (sformat.s23 + 0)
.s76:
0a59 : a9 00 __ LDA #$00
0a5b : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0a5d : 4c 77 0a JMP $0a77 ; (sformat.l77 + 0)
.s79:
0a60 : a5 43 __ LDA T0 + 0 
0a62 : 0a __ __ ASL
0a63 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0a65 : 98 __ __ TYA
0a66 : 2a __ __ ROL
0a67 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0a69 : 2a __ __ ROL
0a6a : aa __ __ TAX
0a6b : 18 __ __ CLC
0a6c : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0a6e : 65 43 __ ADC T0 + 0 
0a70 : 0a __ __ ASL
0a71 : 18 __ __ CLC
0a72 : 65 47 __ ADC T2 + 0 
0a74 : 38 __ __ SEC
0a75 : e9 30 __ SBC #$30
.l77:
0a77 : 85 43 __ STA T0 + 0 
0a79 : a0 00 __ LDY #$00
0a7b : b1 55 __ LDA (T3 + 0),y 
0a7d : 85 47 __ STA T2 + 0 
0a7f : e6 55 __ INC T3 + 0 
0a81 : d0 02 __ BNE $0a85 ; (sformat.s108 + 0)
.s107:
0a83 : e6 56 __ INC T3 + 1 
.s108:
0a85 : c9 30 __ CMP #$30
0a87 : 90 04 __ BCC $0a8d ; (sformat.s103 + 0)
.s78:
0a89 : c9 3a __ CMP #$3a
0a8b : 90 d3 __ BCC $0a60 ; (sformat.s79 + 0)
.s103:
0a8d : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0a8f : a6 43 __ LDX T0 + 0 
0a91 : 8e de 9f STX $9fde ; (si.precision + 0)
.s23:
0a94 : c9 64 __ CMP #$64
0a96 : f0 0c __ BEQ $0aa4 ; (sformat.s75 + 0)
.s24:
0a98 : c9 44 __ CMP #$44
0a9a : f0 08 __ BEQ $0aa4 ; (sformat.s75 + 0)
.s25:
0a9c : c9 69 __ CMP #$69
0a9e : f0 04 __ BEQ $0aa4 ; (sformat.s75 + 0)
.s26:
0aa0 : c9 49 __ CMP #$49
0aa2 : d0 07 __ BNE $0aab ; (sformat.s27 + 0)
.s75:
0aa4 : a9 01 __ LDA #$01
.s93:
0aa6 : 85 13 __ STA P6 
0aa8 : 4c ec 0c JMP $0cec ; (sformat.s73 + 0)
.s27:
0aab : c9 75 __ CMP #$75
0aad : f0 04 __ BEQ $0ab3 ; (sformat.s74 + 0)
.s28:
0aaf : c9 55 __ CMP #$55
0ab1 : d0 04 __ BNE $0ab7 ; (sformat.s29 + 0)
.s74:
0ab3 : a9 00 __ LDA #$00
0ab5 : f0 ef __ BEQ $0aa6 ; (sformat.s93 + 0)
.s29:
0ab7 : c9 78 __ CMP #$78
0ab9 : f0 04 __ BEQ $0abf ; (sformat.s72 + 0)
.s30:
0abb : c9 58 __ CMP #$58
0abd : d0 15 __ BNE $0ad4 ; (sformat.s31 + 0)
.s72:
0abf : a5 47 __ LDA T2 + 0 
0ac1 : 29 e0 __ AND #$e0
0ac3 : 09 01 __ ORA #$01
0ac5 : 8d df 9f STA $9fdf ; (si.cha + 0)
0ac8 : a9 00 __ LDA #$00
0aca : 85 13 __ STA P6 
0acc : a9 10 __ LDA #$10
0ace : 8d e0 9f STA $9fe0 ; (si.base + 0)
0ad1 : 4c ec 0c JMP $0cec ; (sformat.s73 + 0)
.s31:
0ad4 : c9 6c __ CMP #$6c
0ad6 : d0 03 __ BNE $0adb ; (sformat.s32 + 0)
0ad8 : 4c 5d 0c JMP $0c5d ; (sformat.s60 + 0)
.s32:
0adb : c9 4c __ CMP #$4c
0add : f0 f9 __ BEQ $0ad8 ; (sformat.s31 + 4)
.s33:
0adf : c9 66 __ CMP #$66
0ae1 : f0 14 __ BEQ $0af7 ; (sformat.s59 + 0)
.s34:
0ae3 : c9 67 __ CMP #$67
0ae5 : f0 10 __ BEQ $0af7 ; (sformat.s59 + 0)
.s35:
0ae7 : c9 65 __ CMP #$65
0ae9 : f0 0c __ BEQ $0af7 ; (sformat.s59 + 0)
.s36:
0aeb : c9 46 __ CMP #$46
0aed : f0 08 __ BEQ $0af7 ; (sformat.s59 + 0)
.s37:
0aef : c9 47 __ CMP #$47
0af1 : f0 04 __ BEQ $0af7 ; (sformat.s59 + 0)
.s38:
0af3 : c9 45 __ CMP #$45
0af5 : d0 5c __ BNE $0b53 ; (sformat.s39 + 0)
.s59:
0af7 : a5 57 __ LDA T4 + 0 
0af9 : 85 13 __ STA P6 
0afb : a5 58 __ LDA T4 + 1 
0afd : 85 14 __ STA P7 
0aff : a5 47 __ LDA T2 + 0 
0b01 : 29 e0 __ AND #$e0
0b03 : 09 01 __ ORA #$01
0b05 : 8d df 9f STA $9fdf ; (si.cha + 0)
0b08 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0b0b : 85 59 __ STA T5 + 0 
0b0d : a9 dc __ LDA #$dc
0b0f : 85 11 __ STA P4 
0b11 : a9 9f __ LDA #$9f
0b13 : 85 12 __ STA P5 
0b15 : ad fa 9f LDA $9ffa ; (sstack + 6)
0b18 : 85 5a __ STA T5 + 1 
0b1a : a0 00 __ LDY #$00
0b1c : b1 59 __ LDA (T5 + 0),y 
0b1e : 85 15 __ STA P8 
0b20 : c8 __ __ INY
0b21 : b1 59 __ LDA (T5 + 0),y 
0b23 : 85 16 __ STA P9 
0b25 : c8 __ __ INY
0b26 : b1 59 __ LDA (T5 + 0),y 
0b28 : 85 17 __ STA P10 
0b2a : c8 __ __ INY
0b2b : b1 59 __ LDA (T5 + 0),y 
0b2d : 85 18 __ STA P11 
0b2f : a5 47 __ LDA T2 + 0 
0b31 : ed df 9f SBC $9fdf ; (si.cha + 0)
0b34 : 18 __ __ CLC
0b35 : 69 61 __ ADC #$61
0b37 : 8d f4 9f STA $9ff4 ; (sstack + 0)
0b3a : 20 01 10 JSR $1001 ; (nformf.s1 + 0)
0b3d : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b3f : 85 5b __ STA T6 + 0 
0b41 : 18 __ __ CLC
0b42 : a5 59 __ LDA T5 + 0 
0b44 : 69 04 __ ADC #$04
0b46 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0b49 : a5 5a __ LDA T5 + 1 
0b4b : 69 00 __ ADC #$00
0b4d : 8d fa 9f STA $9ffa ; (sstack + 6)
0b50 : 4c 07 09 JMP $0907 ; (sformat.l5 + 0)
.s39:
0b53 : c9 73 __ CMP #$73
0b55 : f0 3b __ BEQ $0b92 ; (sformat.s47 + 0)
.s40:
0b57 : c9 53 __ CMP #$53
0b59 : f0 37 __ BEQ $0b92 ; (sformat.s47 + 0)
.s41:
0b5b : c9 63 __ CMP #$63
0b5d : f0 12 __ BEQ $0b71 ; (sformat.s46 + 0)
.s42:
0b5f : c9 43 __ CMP #$43
0b61 : f0 0e __ BEQ $0b71 ; (sformat.s46 + 0)
.s43:
0b63 : aa __ __ TAX
0b64 : f0 ea __ BEQ $0b50 ; (sformat.s59 + 89)
.s44:
0b66 : a0 00 __ LDY #$00
0b68 : 91 57 __ STA (T4 + 0),y 
.s45:
0b6a : a9 01 __ LDA #$01
.s96:
0b6c : 85 5b __ STA T6 + 0 
0b6e : 4c 07 09 JMP $0907 ; (sformat.l5 + 0)
.s46:
0b71 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0b74 : 85 43 __ STA T0 + 0 
0b76 : ad fa 9f LDA $9ffa ; (sstack + 6)
0b79 : 85 44 __ STA T0 + 1 
0b7b : a0 00 __ LDY #$00
0b7d : b1 43 __ LDA (T0 + 0),y 
0b7f : 91 57 __ STA (T4 + 0),y 
0b81 : a5 43 __ LDA T0 + 0 
0b83 : 69 01 __ ADC #$01
0b85 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0b88 : a5 44 __ LDA T0 + 1 
0b8a : 69 00 __ ADC #$00
0b8c : 8d fa 9f STA $9ffa ; (sstack + 6)
0b8f : 4c 6a 0b JMP $0b6a ; (sformat.s45 + 0)
.s47:
0b92 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0b95 : 85 43 __ STA T0 + 0 
0b97 : 69 01 __ ADC #$01
0b99 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0b9c : ad fa 9f LDA $9ffa ; (sstack + 6)
0b9f : 85 44 __ STA T0 + 1 
0ba1 : 69 00 __ ADC #$00
0ba3 : 8d fa 9f STA $9ffa ; (sstack + 6)
0ba6 : a0 00 __ LDY #$00
0ba8 : 84 5c __ STY T7 + 0 
0baa : b1 43 __ LDA (T0 + 0),y 
0bac : 85 1b __ STA ACCU + 0 ; (buff + 1)
0bae : 85 53 __ STA T1 + 0 
0bb0 : c8 __ __ INY
0bb1 : b1 43 __ LDA (T0 + 0),y 
0bb3 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0bb5 : 85 54 __ STA T1 + 1 
0bb7 : ad dd 9f LDA $9fdd ; (si.width + 0)
0bba : f0 0c __ BEQ $0bc8 ; (sformat.s48 + 0)
.s100:
0bbc : 88 __ __ DEY
0bbd : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0bbf : f0 05 __ BEQ $0bc6 ; (sformat.s101 + 0)
.l58:
0bc1 : c8 __ __ INY
0bc2 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0bc4 : d0 fb __ BNE $0bc1 ; (sformat.l58 + 0)
.s101:
0bc6 : 84 5c __ STY T7 + 0 
.s48:
0bc8 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0bcb : 85 59 __ STA T5 + 0 
0bcd : d0 19 __ BNE $0be8 ; (sformat.s49 + 0)
.s98:
0bcf : a6 5c __ LDX T7 + 0 
0bd1 : ec dd 9f CPX $9fdd ; (si.width + 0)
0bd4 : a0 00 __ LDY #$00
0bd6 : b0 0c __ BCS $0be4 ; (sformat.s99 + 0)
.l57:
0bd8 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0bdb : 91 57 __ STA (T4 + 0),y 
0bdd : c8 __ __ INY
0bde : e8 __ __ INX
0bdf : ec dd 9f CPX $9fdd ; (si.width + 0)
0be2 : 90 f4 __ BCC $0bd8 ; (sformat.l57 + 0)
.s99:
0be4 : 86 5c __ STX T7 + 0 
0be6 : 84 5b __ STY T6 + 0 
.s49:
0be8 : ac fb 9f LDY $9ffb ; (sstack + 7)
0beb : d0 48 __ BNE $0c35 ; (sformat.s54 + 0)
.s50:
0bed : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0bef : f0 23 __ BEQ $0c14 ; (sformat.s51 + 0)
.s53:
0bf1 : 18 __ __ CLC
0bf2 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0bf4 : 69 01 __ ADC #$01
0bf6 : 85 43 __ STA T0 + 0 
0bf8 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0bfa : 69 00 __ ADC #$00
0bfc : 85 44 __ STA T0 + 1 
0bfe : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0c00 : a4 5b __ LDY T6 + 0 
0c02 : 91 57 __ STA (T4 + 0),y 
0c04 : e6 5b __ INC T6 + 0 
0c06 : a0 00 __ LDY #$00
0c08 : b1 43 __ LDA (T0 + 0),y 
0c0a : a8 __ __ TAY
0c0b : e6 43 __ INC T0 + 0 
0c0d : d0 02 __ BNE $0c11 ; (sformat.s112 + 0)
.s111:
0c0f : e6 44 __ INC T0 + 1 
.s112:
0c11 : 98 __ __ TYA
0c12 : d0 ec __ BNE $0c00 ; (sformat.l92 + 0)
.s51:
0c14 : a5 59 __ LDA T5 + 0 
0c16 : d0 03 __ BNE $0c1b ; (sformat.s97 + 0)
0c18 : 4c 07 09 JMP $0907 ; (sformat.l5 + 0)
.s97:
0c1b : a6 5c __ LDX T7 + 0 
0c1d : ec dd 9f CPX $9fdd ; (si.width + 0)
0c20 : a4 5b __ LDY T6 + 0 
0c22 : b0 0c __ BCS $0c30 ; (sformat.s102 + 0)
.l52:
0c24 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0c27 : 91 57 __ STA (T4 + 0),y 
0c29 : c8 __ __ INY
0c2a : e8 __ __ INX
0c2b : ec dd 9f CPX $9fdd ; (si.width + 0)
0c2e : 90 f4 __ BCC $0c24 ; (sformat.l52 + 0)
.s102:
0c30 : 84 5b __ STY T6 + 0 
0c32 : 4c 07 09 JMP $0907 ; (sformat.l5 + 0)
.s54:
0c35 : a4 5b __ LDY T6 + 0 
0c37 : f0 11 __ BEQ $0c4a ; (sformat.s55 + 0)
.s56:
0c39 : a5 57 __ LDA T4 + 0 
0c3b : 85 0e __ STA P1 
0c3d : a5 58 __ LDA T4 + 1 
0c3f : 85 0f __ STA P2 
0c41 : a9 00 __ LDA #$00
0c43 : 85 5b __ STA T6 + 0 
0c45 : 91 0e __ STA (P1),y 
0c47 : 20 26 0d JSR $0d26 ; (puts.l4 + 0)
.s55:
0c4a : a5 53 __ LDA T1 + 0 
0c4c : 85 0e __ STA P1 
0c4e : a5 54 __ LDA T1 + 1 
0c50 : 85 0f __ STA P2 
0c52 : 20 26 0d JSR $0d26 ; (puts.l4 + 0)
0c55 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0c58 : d0 c1 __ BNE $0c1b ; (sformat.s97 + 0)
0c5a : 4c 07 09 JMP $0907 ; (sformat.l5 + 0)
.s60:
0c5d : ad f9 9f LDA $9ff9 ; (sstack + 5)
0c60 : 85 43 __ STA T0 + 0 
0c62 : 69 03 __ ADC #$03
0c64 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0c67 : ad fa 9f LDA $9ffa ; (sstack + 6)
0c6a : 85 44 __ STA T0 + 1 
0c6c : 69 00 __ ADC #$00
0c6e : 8d fa 9f STA $9ffa ; (sstack + 6)
0c71 : a0 00 __ LDY #$00
0c73 : b1 55 __ LDA (T3 + 0),y 
0c75 : aa __ __ TAX
0c76 : e6 55 __ INC T3 + 0 
0c78 : d0 02 __ BNE $0c7c ; (sformat.s110 + 0)
.s109:
0c7a : e6 56 __ INC T3 + 1 
.s110:
0c7c : b1 43 __ LDA (T0 + 0),y 
0c7e : 85 1b __ STA ACCU + 0 ; (buff + 1)
0c80 : 85 11 __ STA P4 
0c82 : a0 01 __ LDY #$01
0c84 : b1 43 __ LDA (T0 + 0),y 
0c86 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0c88 : 85 12 __ STA P5 
0c8a : c8 __ __ INY
0c8b : b1 43 __ LDA (T0 + 0),y 
0c8d : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0c8f : 85 13 __ STA P6 
0c91 : c8 __ __ INY
0c92 : b1 43 __ LDA (T0 + 0),y 
0c94 : 85 14 __ STA P7 
0c96 : e0 64 __ CPX #$64
0c98 : f0 0c __ BEQ $0ca6 ; (sformat.s71 + 0)
.s61:
0c9a : e0 44 __ CPX #$44
0c9c : f0 08 __ BEQ $0ca6 ; (sformat.s71 + 0)
.s62:
0c9e : e0 69 __ CPX #$69
0ca0 : f0 04 __ BEQ $0ca6 ; (sformat.s71 + 0)
.s63:
0ca2 : e0 49 __ CPX #$49
0ca4 : d0 1c __ BNE $0cc2 ; (sformat.s64 + 0)
.s71:
0ca6 : a9 01 __ LDA #$01
.s94:
0ca8 : 85 15 __ STA P8 
.s69:
0caa : a5 57 __ LDA T4 + 0 
0cac : 85 0f __ STA P2 
0cae : a5 58 __ LDA T4 + 1 
0cb0 : 85 10 __ STA P3 
0cb2 : a9 dc __ LDA #$dc
0cb4 : 85 0d __ STA P0 
0cb6 : a9 9f __ LDA #$9f
0cb8 : 85 0e __ STA P1 
0cba : 20 b7 0e JSR $0eb7 ; (nforml.s4 + 0)
0cbd : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0cbf : 4c 6c 0b JMP $0b6c ; (sformat.s96 + 0)
.s64:
0cc2 : e0 75 __ CPX #$75
0cc4 : f0 04 __ BEQ $0cca ; (sformat.s70 + 0)
.s65:
0cc6 : e0 55 __ CPX #$55
0cc8 : d0 04 __ BNE $0cce ; (sformat.s66 + 0)
.s70:
0cca : a9 00 __ LDA #$00
0ccc : f0 da __ BEQ $0ca8 ; (sformat.s94 + 0)
.s66:
0cce : e0 78 __ CPX #$78
0cd0 : f0 06 __ BEQ $0cd8 ; (sformat.s68 + 0)
.s67:
0cd2 : 85 1e __ STA ACCU + 3 ; (fps + 0)
0cd4 : e0 58 __ CPX #$58
0cd6 : d0 82 __ BNE $0c5a ; (sformat.s55 + 16)
.s68:
0cd8 : a9 00 __ LDA #$00
0cda : 85 15 __ STA P8 
0cdc : a9 10 __ LDA #$10
0cde : 8d e0 9f STA $9fe0 ; (si.base + 0)
0ce1 : 8a __ __ TXA
0ce2 : 29 e0 __ AND #$e0
0ce4 : 09 01 __ ORA #$01
0ce6 : 8d df 9f STA $9fdf ; (si.cha + 0)
0ce9 : 4c aa 0c JMP $0caa ; (sformat.s69 + 0)
.s73:
0cec : a5 57 __ LDA T4 + 0 
0cee : 85 0f __ STA P2 
0cf0 : a5 58 __ LDA T4 + 1 
0cf2 : 85 10 __ STA P3 
0cf4 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0cf7 : 85 43 __ STA T0 + 0 
0cf9 : ad fa 9f LDA $9ffa ; (sstack + 6)
0cfc : 85 44 __ STA T0 + 1 
0cfe : a0 00 __ LDY #$00
0d00 : b1 43 __ LDA (T0 + 0),y 
0d02 : 85 11 __ STA P4 
0d04 : c8 __ __ INY
0d05 : b1 43 __ LDA (T0 + 0),y 
0d07 : 85 12 __ STA P5 
0d09 : 18 __ __ CLC
0d0a : a5 43 __ LDA T0 + 0 
0d0c : 69 02 __ ADC #$02
0d0e : 8d f9 9f STA $9ff9 ; (sstack + 5)
0d11 : a5 44 __ LDA T0 + 1 
0d13 : 69 00 __ ADC #$00
0d15 : 8d fa 9f STA $9ffa ; (sstack + 6)
0d18 : a9 dc __ LDA #$dc
0d1a : 85 0d __ STA P0 
0d1c : a9 9f __ LDA #$9f
0d1e : 85 0e __ STA P1 
0d20 : 20 9c 0d JSR $0d9c ; (nformi.s4 + 0)
0d23 : 4c 6c 0b JMP $0b6c ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.h"
.l4:
0d26 : a0 00 __ LDY #$00
0d28 : b1 0e __ LDA (P1),y ; (str + 0)
0d2a : d0 01 __ BNE $0d2d ; (puts.s5 + 0)
.s3:
0d2c : 60 __ __ RTS
.s5:
0d2d : e6 0e __ INC P1 ; (str + 0)
0d2f : d0 02 __ BNE $0d33 ; (puts.s7 + 0)
.s6:
0d31 : e6 0f __ INC P2 ; (str + 1)
.s7:
0d33 : 20 39 0d JSR $0d39 ; (putpch.s4 + 0)
0d36 : 4c 26 0d JMP $0d26 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/hdnsh/oscar/include/conio.h"
.s4:
0d39 : 85 0d __ STA P0 ; (c + 0)
0d3b : ad ba 1c LDA $1cba ; (giocharmap + 0)
0d3e : f0 32 __ BEQ $0d72 ; (putpch.s5 + 0)
.s6:
0d40 : a5 0d __ LDA P0 ; (c + 0)
0d42 : c9 0a __ CMP #$0a
0d44 : d0 04 __ BNE $0d4a ; (putpch.s7 + 0)
.s18:
0d46 : a9 0d __ LDA #$0d
0d48 : d0 32 __ BNE $0d7c ; (putpch.s15 + 0)
.s7:
0d4a : c9 09 __ CMP #$09
0d4c : f0 36 __ BEQ $0d84 ; (putpch.s16 + 0)
.s8:
0d4e : ad ba 1c LDA $1cba ; (giocharmap + 0)
0d51 : c9 02 __ CMP #$02
0d53 : 90 1d __ BCC $0d72 ; (putpch.s5 + 0)
.s9:
0d55 : a5 0d __ LDA P0 ; (c + 0)
0d57 : c9 41 __ CMP #$41
0d59 : 90 17 __ BCC $0d72 ; (putpch.s5 + 0)
.s10:
0d5b : c9 7b __ CMP #$7b
0d5d : b0 13 __ BCS $0d72 ; (putpch.s5 + 0)
.s11:
0d5f : c9 61 __ CMP #$61
0d61 : b0 04 __ BCS $0d67 ; (putpch.s13 + 0)
.s12:
0d63 : c9 5b __ CMP #$5b
0d65 : b0 0b __ BCS $0d72 ; (putpch.s5 + 0)
.s13:
0d67 : 49 20 __ EOR #$20
0d69 : 85 0d __ STA P0 ; (c + 0)
0d6b : ad ba 1c LDA $1cba ; (giocharmap + 0)
0d6e : c9 02 __ CMP #$02
0d70 : f0 06 __ BEQ $0d78 ; (putpch.s14 + 0)
.s5:
0d72 : a5 0d __ LDA P0 ; (c + 0)
0d74 : 20 d2 ff JSR $ffd2 
.s3:
0d77 : 60 __ __ RTS
.s14:
0d78 : a5 0d __ LDA P0 ; (c + 0)
0d7a : 29 5f __ AND #$5f
.s15:
0d7c : 85 43 __ STA T0 + 0 
0d7e : a5 43 __ LDA T0 + 0 
0d80 : 20 d2 ff JSR $ffd2 
0d83 : 60 __ __ RTS
.s16:
0d84 : a5 d3 __ LDA $d3 
0d86 : 29 03 __ AND #$03
0d88 : 85 43 __ STA T0 + 0 
0d8a : a9 20 __ LDA #$20
0d8c : 85 44 __ STA T1 + 0 
.l17:
0d8e : a5 44 __ LDA T1 + 0 
0d90 : 20 d2 ff JSR $ffd2 
0d93 : e6 43 __ INC T0 + 0 
0d95 : a5 43 __ LDA T0 + 0 
0d97 : c9 04 __ CMP #$04
0d99 : 90 f3 __ BCC $0d8e ; (putpch.l17 + 0)
0d9b : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s4:
0d9c : a9 00 __ LDA #$00
0d9e : 85 43 __ STA T5 + 0 
0da0 : a0 04 __ LDY #$04
0da2 : b1 0d __ LDA (P0),y ; (si + 0)
0da4 : 85 44 __ STA T6 + 0 
0da6 : a5 13 __ LDA P6 ; (s + 0)
0da8 : f0 13 __ BEQ $0dbd ; (nformi.s5 + 0)
.s33:
0daa : 24 12 __ BIT P5 ; (v + 1)
0dac : 10 0f __ BPL $0dbd ; (nformi.s5 + 0)
.s34:
0dae : 38 __ __ SEC
0daf : a9 00 __ LDA #$00
0db1 : e5 11 __ SBC P4 ; (v + 0)
0db3 : 85 11 __ STA P4 ; (v + 0)
0db5 : a9 00 __ LDA #$00
0db7 : e5 12 __ SBC P5 ; (v + 1)
0db9 : 85 12 __ STA P5 ; (v + 1)
0dbb : e6 43 __ INC T5 + 0 
.s5:
0dbd : a9 10 __ LDA #$10
0dbf : 85 45 __ STA T7 + 0 
0dc1 : a5 11 __ LDA P4 ; (v + 0)
0dc3 : 05 12 __ ORA P5 ; (v + 1)
0dc5 : f0 33 __ BEQ $0dfa ; (nformi.s6 + 0)
.s28:
0dc7 : a5 11 __ LDA P4 ; (v + 0)
0dc9 : 85 1b __ STA ACCU + 0 
0dcb : a5 12 __ LDA P5 ; (v + 1)
0dcd : 85 1c __ STA ACCU + 1 
.l29:
0dcf : a5 44 __ LDA T6 + 0 
0dd1 : 85 03 __ STA WORK + 0 
0dd3 : a9 00 __ LDA #$00
0dd5 : 85 04 __ STA WORK + 1 
0dd7 : 20 9d 1a JSR $1a9d ; (divmod + 0)
0dda : a5 05 __ LDA WORK + 2 
0ddc : c9 0a __ CMP #$0a
0dde : b0 04 __ BCS $0de4 ; (nformi.s32 + 0)
.s30:
0de0 : a9 30 __ LDA #$30
0de2 : 90 06 __ BCC $0dea ; (nformi.s31 + 0)
.s32:
0de4 : a0 03 __ LDY #$03
0de6 : b1 0d __ LDA (P0),y ; (si + 0)
0de8 : e9 0a __ SBC #$0a
.s31:
0dea : 18 __ __ CLC
0deb : 65 05 __ ADC WORK + 2 
0ded : a6 45 __ LDX T7 + 0 
0def : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0df2 : c6 45 __ DEC T7 + 0 
0df4 : a5 1b __ LDA ACCU + 0 
0df6 : 05 1c __ ORA ACCU + 1 
0df8 : d0 d5 __ BNE $0dcf ; (nformi.l29 + 0)
.s6:
0dfa : a0 02 __ LDY #$02
0dfc : b1 0d __ LDA (P0),y ; (si + 0)
0dfe : c9 ff __ CMP #$ff
0e00 : d0 04 __ BNE $0e06 ; (nformi.s27 + 0)
.s7:
0e02 : a9 0f __ LDA #$0f
0e04 : d0 05 __ BNE $0e0b ; (nformi.s39 + 0)
.s27:
0e06 : 38 __ __ SEC
0e07 : a9 10 __ LDA #$10
0e09 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0e0b : a8 __ __ TAY
0e0c : c4 45 __ CPY T7 + 0 
0e0e : b0 0d __ BCS $0e1d ; (nformi.s8 + 0)
.s26:
0e10 : a9 30 __ LDA #$30
.l40:
0e12 : a6 45 __ LDX T7 + 0 
0e14 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0e17 : c6 45 __ DEC T7 + 0 
0e19 : c4 45 __ CPY T7 + 0 
0e1b : 90 f5 __ BCC $0e12 ; (nformi.l40 + 0)
.s8:
0e1d : a0 07 __ LDY #$07
0e1f : b1 0d __ LDA (P0),y ; (si + 0)
0e21 : f0 1c __ BEQ $0e3f ; (nformi.s9 + 0)
.s24:
0e23 : a5 44 __ LDA T6 + 0 
0e25 : c9 10 __ CMP #$10
0e27 : d0 16 __ BNE $0e3f ; (nformi.s9 + 0)
.s25:
0e29 : a0 03 __ LDY #$03
0e2b : b1 0d __ LDA (P0),y ; (si + 0)
0e2d : a8 __ __ TAY
0e2e : a9 30 __ LDA #$30
0e30 : a6 45 __ LDX T7 + 0 
0e32 : ca __ __ DEX
0e33 : ca __ __ DEX
0e34 : 86 45 __ STX T7 + 0 
0e36 : 9d e4 9f STA $9fe4,x ; (buffer[0] + 0)
0e39 : 98 __ __ TYA
0e3a : 69 16 __ ADC #$16
0e3c : 9d e5 9f STA $9fe5,x ; (buffer[0] + 1)
.s9:
0e3f : a9 00 __ LDA #$00
0e41 : 85 1b __ STA ACCU + 0 
0e43 : a5 43 __ LDA T5 + 0 
0e45 : f0 0c __ BEQ $0e53 ; (nformi.s10 + 0)
.s23:
0e47 : a9 2d __ LDA #$2d
.s22:
0e49 : a6 45 __ LDX T7 + 0 
0e4b : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0e4e : c6 45 __ DEC T7 + 0 
0e50 : 4c 5d 0e JMP $0e5d ; (nformi.s11 + 0)
.s10:
0e53 : a0 05 __ LDY #$05
0e55 : b1 0d __ LDA (P0),y ; (si + 0)
0e57 : f0 04 __ BEQ $0e5d ; (nformi.s11 + 0)
.s21:
0e59 : a9 2b __ LDA #$2b
0e5b : d0 ec __ BNE $0e49 ; (nformi.s22 + 0)
.s11:
0e5d : a6 45 __ LDX T7 + 0 
0e5f : a0 06 __ LDY #$06
0e61 : b1 0d __ LDA (P0),y ; (si + 0)
0e63 : d0 2b __ BNE $0e90 ; (nformi.s17 + 0)
.l12:
0e65 : 8a __ __ TXA
0e66 : 18 __ __ CLC
0e67 : a0 01 __ LDY #$01
0e69 : 71 0d __ ADC (P0),y ; (si + 0)
0e6b : b0 04 __ BCS $0e71 ; (nformi.s15 + 0)
.s16:
0e6d : c9 11 __ CMP #$11
0e6f : 90 0a __ BCC $0e7b ; (nformi.s13 + 0)
.s15:
0e71 : a0 00 __ LDY #$00
0e73 : b1 0d __ LDA (P0),y ; (si + 0)
0e75 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0e78 : ca __ __ DEX
0e79 : b0 ea __ BCS $0e65 ; (nformi.l12 + 0)
.s13:
0e7b : e0 10 __ CPX #$10
0e7d : b0 0e __ BCS $0e8d ; (nformi.s41 + 0)
.s14:
0e7f : 88 __ __ DEY
.l37:
0e80 : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0e83 : 91 0f __ STA (P2),y ; (str + 0)
0e85 : c8 __ __ INY
0e86 : e8 __ __ INX
0e87 : e0 10 __ CPX #$10
0e89 : 90 f5 __ BCC $0e80 ; (nformi.l37 + 0)
.s38:
0e8b : 84 1b __ STY ACCU + 0 
.s41:
0e8d : a5 1b __ LDA ACCU + 0 
.s3:
0e8f : 60 __ __ RTS
.s17:
0e90 : e0 10 __ CPX #$10
0e92 : b0 1a __ BCS $0eae ; (nformi.l18 + 0)
.s20:
0e94 : a0 00 __ LDY #$00
.l35:
0e96 : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0e99 : 91 0f __ STA (P2),y ; (str + 0)
0e9b : c8 __ __ INY
0e9c : e8 __ __ INX
0e9d : e0 10 __ CPX #$10
0e9f : 90 f5 __ BCC $0e96 ; (nformi.l35 + 0)
.s36:
0ea1 : 84 1b __ STY ACCU + 0 
0ea3 : b0 09 __ BCS $0eae ; (nformi.l18 + 0)
.s19:
0ea5 : 88 __ __ DEY
0ea6 : b1 0d __ LDA (P0),y ; (si + 0)
0ea8 : a4 1b __ LDY ACCU + 0 
0eaa : 91 0f __ STA (P2),y ; (str + 0)
0eac : e6 1b __ INC ACCU + 0 
.l18:
0eae : a5 1b __ LDA ACCU + 0 
0eb0 : a0 01 __ LDY #$01
0eb2 : d1 0d __ CMP (P0),y ; (si + 0)
0eb4 : 90 ef __ BCC $0ea5 ; (nformi.s19 + 0)
0eb6 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s4:
0eb7 : a9 00 __ LDA #$00
0eb9 : 85 43 __ STA T4 + 0 
0ebb : a5 15 __ LDA P8 ; (s + 0)
0ebd : f0 1f __ BEQ $0ede ; (nforml.s5 + 0)
.s35:
0ebf : 24 14 __ BIT P7 ; (v + 3)
0ec1 : 10 1b __ BPL $0ede ; (nforml.s5 + 0)
.s36:
0ec3 : 38 __ __ SEC
0ec4 : a9 00 __ LDA #$00
0ec6 : e5 11 __ SBC P4 ; (v + 0)
0ec8 : 85 11 __ STA P4 ; (v + 0)
0eca : a9 00 __ LDA #$00
0ecc : e5 12 __ SBC P5 ; (v + 1)
0ece : 85 12 __ STA P5 ; (v + 1)
0ed0 : a9 00 __ LDA #$00
0ed2 : e5 13 __ SBC P6 ; (v + 2)
0ed4 : 85 13 __ STA P6 ; (v + 2)
0ed6 : a9 00 __ LDA #$00
0ed8 : e5 14 __ SBC P7 ; (v + 3)
0eda : 85 14 __ STA P7 ; (v + 3)
0edc : e6 43 __ INC T4 + 0 
.s5:
0ede : a9 10 __ LDA #$10
0ee0 : 85 44 __ STA T5 + 0 
0ee2 : a5 14 __ LDA P7 ; (v + 3)
0ee4 : f0 03 __ BEQ $0ee9 ; (nforml.s31 + 0)
0ee6 : 4c b1 0f JMP $0fb1 ; (nforml.l28 + 0)
.s31:
0ee9 : a5 13 __ LDA P6 ; (v + 2)
0eeb : d0 f9 __ BNE $0ee6 ; (nforml.s5 + 8)
.s32:
0eed : a5 12 __ LDA P5 ; (v + 1)
0eef : d0 f5 __ BNE $0ee6 ; (nforml.s5 + 8)
.s33:
0ef1 : c5 11 __ CMP P4 ; (v + 0)
0ef3 : 90 f1 __ BCC $0ee6 ; (nforml.s5 + 8)
.s6:
0ef5 : a0 02 __ LDY #$02
0ef7 : b1 0d __ LDA (P0),y ; (si + 0)
0ef9 : c9 ff __ CMP #$ff
0efb : d0 04 __ BNE $0f01 ; (nforml.s27 + 0)
.s7:
0efd : a9 0f __ LDA #$0f
0eff : d0 05 __ BNE $0f06 ; (nforml.s41 + 0)
.s27:
0f01 : 38 __ __ SEC
0f02 : a9 10 __ LDA #$10
0f04 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
0f06 : a8 __ __ TAY
0f07 : c4 44 __ CPY T5 + 0 
0f09 : b0 0d __ BCS $0f18 ; (nforml.s8 + 0)
.s26:
0f0b : a9 30 __ LDA #$30
.l42:
0f0d : a6 44 __ LDX T5 + 0 
0f0f : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0f12 : c6 44 __ DEC T5 + 0 
0f14 : c4 44 __ CPY T5 + 0 
0f16 : 90 f5 __ BCC $0f0d ; (nforml.l42 + 0)
.s8:
0f18 : a0 07 __ LDY #$07
0f1a : b1 0d __ LDA (P0),y ; (si + 0)
0f1c : f0 1d __ BEQ $0f3b ; (nforml.s9 + 0)
.s24:
0f1e : a0 04 __ LDY #$04
0f20 : b1 0d __ LDA (P0),y ; (si + 0)
0f22 : c9 10 __ CMP #$10
0f24 : d0 15 __ BNE $0f3b ; (nforml.s9 + 0)
.s25:
0f26 : 88 __ __ DEY
0f27 : b1 0d __ LDA (P0),y ; (si + 0)
0f29 : a8 __ __ TAY
0f2a : a9 30 __ LDA #$30
0f2c : a6 44 __ LDX T5 + 0 
0f2e : ca __ __ DEX
0f2f : ca __ __ DEX
0f30 : 86 44 __ STX T5 + 0 
0f32 : 9d e4 9f STA $9fe4,x ; (buffer[0] + 0)
0f35 : 98 __ __ TYA
0f36 : 69 16 __ ADC #$16
0f38 : 9d e5 9f STA $9fe5,x ; (buffer[0] + 1)
.s9:
0f3b : a9 00 __ LDA #$00
0f3d : 85 1b __ STA ACCU + 0 
0f3f : a5 43 __ LDA T4 + 0 
0f41 : f0 0c __ BEQ $0f4f ; (nforml.s10 + 0)
.s23:
0f43 : a9 2d __ LDA #$2d
.s22:
0f45 : a6 44 __ LDX T5 + 0 
0f47 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0f4a : c6 44 __ DEC T5 + 0 
0f4c : 4c 59 0f JMP $0f59 ; (nforml.s11 + 0)
.s10:
0f4f : a0 05 __ LDY #$05
0f51 : b1 0d __ LDA (P0),y ; (si + 0)
0f53 : f0 04 __ BEQ $0f59 ; (nforml.s11 + 0)
.s21:
0f55 : a9 2b __ LDA #$2b
0f57 : d0 ec __ BNE $0f45 ; (nforml.s22 + 0)
.s11:
0f59 : a0 06 __ LDY #$06
0f5b : a6 44 __ LDX T5 + 0 
0f5d : b1 0d __ LDA (P0),y ; (si + 0)
0f5f : d0 29 __ BNE $0f8a ; (nforml.s17 + 0)
.l12:
0f61 : 8a __ __ TXA
0f62 : 18 __ __ CLC
0f63 : a0 01 __ LDY #$01
0f65 : 71 0d __ ADC (P0),y ; (si + 0)
0f67 : b0 04 __ BCS $0f6d ; (nforml.s15 + 0)
.s16:
0f69 : c9 11 __ CMP #$11
0f6b : 90 0a __ BCC $0f77 ; (nforml.s13 + 0)
.s15:
0f6d : a0 00 __ LDY #$00
0f6f : b1 0d __ LDA (P0),y ; (si + 0)
0f71 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0f74 : ca __ __ DEX
0f75 : b0 ea __ BCS $0f61 ; (nforml.l12 + 0)
.s13:
0f77 : e0 10 __ CPX #$10
0f79 : b0 0e __ BCS $0f89 ; (nforml.s3 + 0)
.s14:
0f7b : 88 __ __ DEY
.l39:
0f7c : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0f7f : 91 0f __ STA (P2),y ; (str + 0)
0f81 : c8 __ __ INY
0f82 : e8 __ __ INX
0f83 : e0 10 __ CPX #$10
0f85 : 90 f5 __ BCC $0f7c ; (nforml.l39 + 0)
.s40:
0f87 : 84 1b __ STY ACCU + 0 
.s3:
0f89 : 60 __ __ RTS
.s17:
0f8a : e0 10 __ CPX #$10
0f8c : b0 1a __ BCS $0fa8 ; (nforml.l18 + 0)
.s20:
0f8e : a0 00 __ LDY #$00
.l37:
0f90 : bd e4 9f LDA $9fe4,x ; (buffer[0] + 0)
0f93 : 91 0f __ STA (P2),y ; (str + 0)
0f95 : c8 __ __ INY
0f96 : e8 __ __ INX
0f97 : e0 10 __ CPX #$10
0f99 : 90 f5 __ BCC $0f90 ; (nforml.l37 + 0)
.s38:
0f9b : 84 1b __ STY ACCU + 0 
0f9d : b0 09 __ BCS $0fa8 ; (nforml.l18 + 0)
.s19:
0f9f : 88 __ __ DEY
0fa0 : b1 0d __ LDA (P0),y ; (si + 0)
0fa2 : a4 1b __ LDY ACCU + 0 
0fa4 : 91 0f __ STA (P2),y ; (str + 0)
0fa6 : e6 1b __ INC ACCU + 0 
.l18:
0fa8 : a5 1b __ LDA ACCU + 0 
0faa : a0 01 __ LDY #$01
0fac : d1 0d __ CMP (P0),y ; (si + 0)
0fae : 90 ef __ BCC $0f9f ; (nforml.s19 + 0)
0fb0 : 60 __ __ RTS
.l28:
0fb1 : a0 04 __ LDY #$04
0fb3 : b1 0d __ LDA (P0),y ; (si + 0)
0fb5 : 85 03 __ STA WORK + 0 
0fb7 : a5 11 __ LDA P4 ; (v + 0)
0fb9 : 85 1b __ STA ACCU + 0 
0fbb : a5 12 __ LDA P5 ; (v + 1)
0fbd : 85 1c __ STA ACCU + 1 
0fbf : a5 13 __ LDA P6 ; (v + 2)
0fc1 : 85 1d __ STA ACCU + 2 
0fc3 : a5 14 __ LDA P7 ; (v + 3)
0fc5 : 85 1e __ STA ACCU + 3 
0fc7 : a9 00 __ LDA #$00
0fc9 : 85 04 __ STA WORK + 1 
0fcb : 85 05 __ STA WORK + 2 
0fcd : 85 06 __ STA WORK + 3 
0fcf : 20 e2 1b JSR $1be2 ; (divmod32 + 0)
0fd2 : a5 07 __ LDA WORK + 4 
0fd4 : c9 0a __ CMP #$0a
0fd6 : b0 04 __ BCS $0fdc ; (nforml.s34 + 0)
.s29:
0fd8 : a9 30 __ LDA #$30
0fda : 90 06 __ BCC $0fe2 ; (nforml.s30 + 0)
.s34:
0fdc : a0 03 __ LDY #$03
0fde : b1 0d __ LDA (P0),y ; (si + 0)
0fe0 : e9 0a __ SBC #$0a
.s30:
0fe2 : 18 __ __ CLC
0fe3 : 65 07 __ ADC WORK + 4 
0fe5 : a6 44 __ LDX T5 + 0 
0fe7 : 9d e3 9f STA $9fe3,x ; (si.prefix + 0)
0fea : c6 44 __ DEC T5 + 0 
0fec : a5 1b __ LDA ACCU + 0 
0fee : 85 11 __ STA P4 ; (v + 0)
0ff0 : a5 1c __ LDA ACCU + 1 
0ff2 : 85 12 __ STA P5 ; (v + 1)
0ff4 : a5 1d __ LDA ACCU + 2 
0ff6 : 85 13 __ STA P6 ; (v + 2)
0ff8 : a5 1e __ LDA ACCU + 3 
0ffa : 85 14 __ STA P7 ; (v + 3)
0ffc : d0 b3 __ BNE $0fb1 ; (nforml.l28 + 0)
0ffe : 4c e9 0e JMP $0ee9 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s1:
1001 : a2 03 __ LDX #$03
1003 : b5 53 __ LDA T7 + 0,x 
1005 : 9d eb 9f STA $9feb,x ; (nformf@stack + 0)
1008 : ca __ __ DEX
1009 : 10 f8 __ BPL $1003 ; (nformf.s1 + 2)
.s4:
100b : a5 16 __ LDA P9 ; (f + 1)
100d : 85 44 __ STA T0 + 1 
100f : a5 17 __ LDA P10 ; (f + 2)
1011 : 85 45 __ STA T0 + 2 
1013 : a5 18 __ LDA P11 ; (f + 3)
1015 : 29 7f __ AND #$7f
1017 : 05 17 __ ORA P10 ; (f + 2)
1019 : 05 16 __ ORA P9 ; (f + 1)
101b : 05 15 __ ORA P8 ; (f + 0)
101d : f0 21 __ BEQ $1040 ; (nformf.s5 + 0)
.s107:
101f : 24 18 __ BIT P11 ; (f + 3)
1021 : 10 1d __ BPL $1040 ; (nformf.s5 + 0)
.s106:
1023 : a9 2d __ LDA #$2d
1025 : a0 00 __ LDY #$00
1027 : 91 13 __ STA (P6),y ; (str + 0)
1029 : a5 18 __ LDA P11 ; (f + 3)
102b : 49 80 __ EOR #$80
102d : 85 10 __ STA P3 
102f : 85 18 __ STA P11 ; (f + 3)
1031 : a5 15 __ LDA P8 ; (f + 0)
1033 : 85 0d __ STA P0 
1035 : a5 16 __ LDA P9 ; (f + 1)
1037 : 85 0e __ STA P1 
1039 : a5 17 __ LDA P10 ; (f + 2)
103b : 85 0f __ STA P2 
103d : 4c 54 15 JMP $1554 ; (nformf.s104 + 0)
.s5:
1040 : a5 15 __ LDA P8 ; (f + 0)
1042 : 85 0d __ STA P0 
1044 : a5 16 __ LDA P9 ; (f + 1)
1046 : 85 0e __ STA P1 
1048 : a5 17 __ LDA P10 ; (f + 2)
104a : 85 0f __ STA P2 
104c : a5 18 __ LDA P11 ; (f + 3)
104e : 85 10 __ STA P3 
1050 : a0 05 __ LDY #$05
1052 : b1 11 __ LDA (P4),y ; (si + 0)
1054 : f0 09 __ BEQ $105f ; (nformf.s6 + 0)
.s103:
1056 : a9 2b __ LDA #$2b
1058 : a0 00 __ LDY #$00
105a : 91 13 __ STA (P6),y ; (str + 0)
105c : 4c 54 15 JMP $1554 ; (nformf.s104 + 0)
.s6:
105f : 20 65 15 JSR $1565 ; (isinf.s4 + 0)
1062 : a2 00 __ LDX #$00
1064 : 86 54 __ STX T9 + 0 
1066 : a8 __ __ TAY
1067 : f0 05 __ BEQ $106e ; (nformf.s7 + 0)
.s101:
1069 : a9 02 __ LDA #$02
106b : 4c 24 15 JMP $1524 ; (nformf.s102 + 0)
.s7:
106e : a5 11 __ LDA P4 ; (si + 0)
1070 : 85 4b __ STA T2 + 0 
1072 : a5 12 __ LDA P5 ; (si + 1)
1074 : 85 4c __ STA T2 + 1 
1076 : a0 02 __ LDY #$02
1078 : b1 11 __ LDA (P4),y ; (si + 0)
107a : c9 ff __ CMP #$ff
107c : d0 02 __ BNE $1080 ; (nformf.s100 + 0)
.s8:
107e : a9 06 __ LDA #$06
.s100:
1080 : 85 4d __ STA T3 + 0 
1082 : 85 52 __ STA T6 + 0 
1084 : a9 00 __ LDA #$00
1086 : 85 4f __ STA T4 + 0 
1088 : 85 50 __ STA T4 + 1 
108a : a5 18 __ LDA P11 ; (f + 3)
108c : 85 46 __ STA T0 + 3 
108e : 29 7f __ AND #$7f
1090 : 05 17 __ ORA P10 ; (f + 2)
1092 : 05 16 __ ORA P9 ; (f + 1)
1094 : a6 15 __ LDX P8 ; (f + 0)
1096 : 86 43 __ STX T0 + 0 
1098 : 05 15 __ ORA P8 ; (f + 0)
109a : d0 03 __ BNE $109f ; (nformf.s67 + 0)
109c : 4c d3 11 JMP $11d3 ; (nformf.s9 + 0)
.s67:
109f : a5 18 __ LDA P11 ; (f + 3)
10a1 : 10 03 __ BPL $10a6 ; (nformf.s95 + 0)
10a3 : 4c 25 11 JMP $1125 ; (nformf.l80 + 0)
.s95:
10a6 : c9 44 __ CMP #$44
10a8 : d0 0d __ BNE $10b7 ; (nformf.l99 + 0)
.s96:
10aa : a5 17 __ LDA P10 ; (f + 2)
10ac : c9 7a __ CMP #$7a
10ae : d0 07 __ BNE $10b7 ; (nformf.l99 + 0)
.s97:
10b0 : a5 16 __ LDA P9 ; (f + 1)
10b2 : d0 03 __ BNE $10b7 ; (nformf.l99 + 0)
.s98:
10b4 : 8a __ __ TXA
10b5 : f0 02 __ BEQ $10b9 ; (nformf.l90 + 0)
.l99:
10b7 : 90 54 __ BCC $110d ; (nformf.s68 + 0)
.l90:
10b9 : 18 __ __ CLC
10ba : a5 4f __ LDA T4 + 0 
10bc : 69 03 __ ADC #$03
10be : 85 4f __ STA T4 + 0 
10c0 : 90 02 __ BCC $10c4 ; (nformf.s121 + 0)
.s120:
10c2 : e6 50 __ INC T4 + 1 
.s121:
10c4 : a5 43 __ LDA T0 + 0 
10c6 : 85 1b __ STA ACCU + 0 
10c8 : a5 44 __ LDA T0 + 1 
10ca : 85 1c __ STA ACCU + 1 
10cc : a5 45 __ LDA T0 + 2 
10ce : 85 1d __ STA ACCU + 2 
10d0 : a5 46 __ LDA T0 + 3 
10d2 : 85 1e __ STA ACCU + 3 
10d4 : a9 00 __ LDA #$00
10d6 : 85 03 __ STA WORK + 0 
10d8 : 85 04 __ STA WORK + 1 
10da : a9 7a __ LDA #$7a
10dc : 85 05 __ STA WORK + 2 
10de : a9 44 __ LDA #$44
10e0 : 85 06 __ STA WORK + 3 
10e2 : 20 cf 17 JSR $17cf ; (freg + 20)
10e5 : 20 b5 19 JSR $19b5 ; (crt_fdiv + 0)
10e8 : a5 1b __ LDA ACCU + 0 
10ea : 85 43 __ STA T0 + 0 
10ec : a5 1c __ LDA ACCU + 1 
10ee : 85 44 __ STA T0 + 1 
10f0 : a6 1d __ LDX ACCU + 2 
10f2 : 86 45 __ STX T0 + 2 
10f4 : a5 1e __ LDA ACCU + 3 
10f6 : 85 46 __ STA T0 + 3 
10f8 : 30 13 __ BMI $110d ; (nformf.s68 + 0)
.s91:
10fa : c9 44 __ CMP #$44
10fc : d0 b9 __ BNE $10b7 ; (nformf.l99 + 0)
.s92:
10fe : e0 7a __ CPX #$7a
1100 : d0 b5 __ BNE $10b7 ; (nformf.l99 + 0)
.s93:
1102 : a5 1c __ LDA ACCU + 1 
1104 : 38 __ __ SEC
1105 : d0 b0 __ BNE $10b7 ; (nformf.l99 + 0)
.s94:
1107 : a5 1b __ LDA ACCU + 0 
1109 : f0 ae __ BEQ $10b9 ; (nformf.l90 + 0)
110b : d0 aa __ BNE $10b7 ; (nformf.l99 + 0)
.s68:
110d : a5 46 __ LDA T0 + 3 
110f : 30 14 __ BMI $1125 ; (nformf.l80 + 0)
.s86:
1111 : c9 3f __ CMP #$3f
1113 : d0 0e __ BNE $1123 ; (nformf.s85 + 0)
.s87:
1115 : a5 45 __ LDA T0 + 2 
1117 : c9 80 __ CMP #$80
1119 : d0 08 __ BNE $1123 ; (nformf.s85 + 0)
.s88:
111b : a5 44 __ LDA T0 + 1 
111d : d0 04 __ BNE $1123 ; (nformf.s85 + 0)
.s89:
111f : a5 43 __ LDA T0 + 0 
1121 : f0 49 __ BEQ $116c ; (nformf.s69 + 0)
.s85:
1123 : b0 47 __ BCS $116c ; (nformf.s69 + 0)
.l80:
1125 : 38 __ __ SEC
1126 : a5 4f __ LDA T4 + 0 
1128 : e9 03 __ SBC #$03
112a : 85 4f __ STA T4 + 0 
112c : b0 02 __ BCS $1130 ; (nformf.s116 + 0)
.s115:
112e : c6 50 __ DEC T4 + 1 
.s116:
1130 : a9 00 __ LDA #$00
1132 : 85 1b __ STA ACCU + 0 
1134 : 85 1c __ STA ACCU + 1 
1136 : a9 7a __ LDA #$7a
1138 : 85 1d __ STA ACCU + 2 
113a : a9 44 __ LDA #$44
113c : 85 1e __ STA ACCU + 3 
113e : a2 43 __ LDX #$43
1140 : 20 bf 17 JSR $17bf ; (freg + 4)
1143 : 20 ed 18 JSR $18ed ; (crt_fmul + 0)
1146 : a5 1b __ LDA ACCU + 0 
1148 : 85 43 __ STA T0 + 0 
114a : a5 1c __ LDA ACCU + 1 
114c : 85 44 __ STA T0 + 1 
114e : a6 1d __ LDX ACCU + 2 
1150 : 86 45 __ STX T0 + 2 
1152 : a5 1e __ LDA ACCU + 3 
1154 : 85 46 __ STA T0 + 3 
1156 : 30 cd __ BMI $1125 ; (nformf.l80 + 0)
.s81:
1158 : c9 3f __ CMP #$3f
115a : 90 c9 __ BCC $1125 ; (nformf.l80 + 0)
.s122:
115c : d0 0e __ BNE $116c ; (nformf.s69 + 0)
.s82:
115e : e0 80 __ CPX #$80
1160 : 90 c3 __ BCC $1125 ; (nformf.l80 + 0)
.s123:
1162 : d0 08 __ BNE $116c ; (nformf.s69 + 0)
.s83:
1164 : a5 1c __ LDA ACCU + 1 
1166 : d0 bb __ BNE $1123 ; (nformf.s85 + 0)
.s84:
1168 : a5 1b __ LDA ACCU + 0 
116a : d0 b7 __ BNE $1123 ; (nformf.s85 + 0)
.s69:
116c : a5 46 __ LDA T0 + 3 
116e : 30 63 __ BMI $11d3 ; (nformf.s9 + 0)
.s75:
1170 : c9 41 __ CMP #$41
1172 : d0 0e __ BNE $1182 ; (nformf.l79 + 0)
.s76:
1174 : a5 45 __ LDA T0 + 2 
1176 : c9 20 __ CMP #$20
1178 : d0 08 __ BNE $1182 ; (nformf.l79 + 0)
.s77:
117a : a5 44 __ LDA T0 + 1 
117c : d0 04 __ BNE $1182 ; (nformf.l79 + 0)
.s78:
117e : a5 43 __ LDA T0 + 0 
1180 : f0 02 __ BEQ $1184 ; (nformf.l70 + 0)
.l79:
1182 : 90 4f __ BCC $11d3 ; (nformf.s9 + 0)
.l70:
1184 : e6 4f __ INC T4 + 0 
1186 : d0 02 __ BNE $118a ; (nformf.s119 + 0)
.s118:
1188 : e6 50 __ INC T4 + 1 
.s119:
118a : a5 43 __ LDA T0 + 0 
118c : 85 1b __ STA ACCU + 0 
118e : a5 44 __ LDA T0 + 1 
1190 : 85 1c __ STA ACCU + 1 
1192 : a5 45 __ LDA T0 + 2 
1194 : 85 1d __ STA ACCU + 2 
1196 : a5 46 __ LDA T0 + 3 
1198 : 85 1e __ STA ACCU + 3 
119a : a9 00 __ LDA #$00
119c : 85 03 __ STA WORK + 0 
119e : 85 04 __ STA WORK + 1 
11a0 : a9 20 __ LDA #$20
11a2 : 85 05 __ STA WORK + 2 
11a4 : a9 41 __ LDA #$41
11a6 : 85 06 __ STA WORK + 3 
11a8 : 20 cf 17 JSR $17cf ; (freg + 20)
11ab : 20 b5 19 JSR $19b5 ; (crt_fdiv + 0)
11ae : a5 1b __ LDA ACCU + 0 
11b0 : 85 43 __ STA T0 + 0 
11b2 : a5 1c __ LDA ACCU + 1 
11b4 : 85 44 __ STA T0 + 1 
11b6 : a6 1d __ LDX ACCU + 2 
11b8 : 86 45 __ STX T0 + 2 
11ba : a5 1e __ LDA ACCU + 3 
11bc : 85 46 __ STA T0 + 3 
11be : 30 13 __ BMI $11d3 ; (nformf.s9 + 0)
.s71:
11c0 : c9 41 __ CMP #$41
11c2 : d0 be __ BNE $1182 ; (nformf.l79 + 0)
.s72:
11c4 : e0 20 __ CPX #$20
11c6 : d0 ba __ BNE $1182 ; (nformf.l79 + 0)
.s73:
11c8 : a5 1c __ LDA ACCU + 1 
11ca : 38 __ __ SEC
11cb : d0 b5 __ BNE $1182 ; (nformf.l79 + 0)
.s74:
11cd : a5 1b __ LDA ACCU + 0 
11cf : f0 b3 __ BEQ $1184 ; (nformf.l70 + 0)
11d1 : d0 af __ BNE $1182 ; (nformf.l79 + 0)
.s9:
11d3 : ad f4 9f LDA $9ff4 ; (sstack + 0)
11d6 : c9 65 __ CMP #$65
11d8 : d0 04 __ BNE $11de ; (nformf.s11 + 0)
.s10:
11da : a9 01 __ LDA #$01
11dc : d0 02 __ BNE $11e0 ; (nformf.s12 + 0)
.s11:
11de : a9 00 __ LDA #$00
.s12:
11e0 : 85 55 __ STA T10 + 0 
11e2 : a6 4d __ LDX T3 + 0 
11e4 : e8 __ __ INX
11e5 : 86 51 __ STX T5 + 0 
11e7 : ad f4 9f LDA $9ff4 ; (sstack + 0)
11ea : c9 67 __ CMP #$67
11ec : d0 13 __ BNE $1201 ; (nformf.s13 + 0)
.s63:
11ee : a5 50 __ LDA T4 + 1 
11f0 : 30 08 __ BMI $11fa ; (nformf.s64 + 0)
.s66:
11f2 : d0 06 __ BNE $11fa ; (nformf.s64 + 0)
.s65:
11f4 : a5 4f __ LDA T4 + 0 
11f6 : c9 04 __ CMP #$04
11f8 : 90 07 __ BCC $1201 ; (nformf.s13 + 0)
.s64:
11fa : a9 01 __ LDA #$01
11fc : 85 55 __ STA T10 + 0 
11fe : 4c 8a 14 JMP $148a ; (nformf.s53 + 0)
.s13:
1201 : a5 55 __ LDA T10 + 0 
1203 : d0 f9 __ BNE $11fe ; (nformf.s64 + 4)
.s14:
1205 : 24 50 __ BIT T4 + 1 
1207 : 10 43 __ BPL $124c ; (nformf.s15 + 0)
.s52:
1209 : a5 43 __ LDA T0 + 0 
120b : 85 1b __ STA ACCU + 0 
120d : a5 44 __ LDA T0 + 1 
120f : 85 1c __ STA ACCU + 1 
1211 : a5 45 __ LDA T0 + 2 
1213 : 85 1d __ STA ACCU + 2 
1215 : a5 46 __ LDA T0 + 3 
1217 : 85 1e __ STA ACCU + 3 
.l108:
1219 : a9 00 __ LDA #$00
121b : 85 03 __ STA WORK + 0 
121d : 85 04 __ STA WORK + 1 
121f : a9 20 __ LDA #$20
1221 : 85 05 __ STA WORK + 2 
1223 : a9 41 __ LDA #$41
1225 : 85 06 __ STA WORK + 3 
1227 : 20 cf 17 JSR $17cf ; (freg + 20)
122a : 20 b5 19 JSR $19b5 ; (crt_fdiv + 0)
122d : 18 __ __ CLC
122e : a5 4f __ LDA T4 + 0 
1230 : 69 01 __ ADC #$01
1232 : 85 4f __ STA T4 + 0 
1234 : a5 50 __ LDA T4 + 1 
1236 : 69 00 __ ADC #$00
1238 : 85 50 __ STA T4 + 1 
123a : 30 dd __ BMI $1219 ; (nformf.l108 + 0)
.s109:
123c : a5 1e __ LDA ACCU + 3 
123e : 85 46 __ STA T0 + 3 
1240 : a5 1d __ LDA ACCU + 2 
1242 : 85 45 __ STA T0 + 2 
1244 : a5 1c __ LDA ACCU + 1 
1246 : 85 44 __ STA T0 + 1 
1248 : a5 1b __ LDA ACCU + 0 
124a : 85 43 __ STA T0 + 0 
.s15:
124c : 18 __ __ CLC
124d : a5 4d __ LDA T3 + 0 
124f : 65 4f __ ADC T4 + 0 
1251 : 18 __ __ CLC
1252 : 69 01 __ ADC #$01
1254 : 85 51 __ STA T5 + 0 
1256 : c9 07 __ CMP #$07
1258 : 90 14 __ BCC $126e ; (nformf.s51 + 0)
.s16:
125a : ad d3 1c LDA $1cd3 ; (fround5[0] + 24)
125d : 85 47 __ STA T1 + 0 
125f : ad d4 1c LDA $1cd4 ; (fround5[0] + 25)
1262 : 85 48 __ STA T1 + 1 
1264 : ad d5 1c LDA $1cd5 ; (fround5[0] + 26)
1267 : 85 49 __ STA T1 + 2 
1269 : ad d6 1c LDA $1cd6 ; (fround5[0] + 27)
126c : b0 15 __ BCS $1283 ; (nformf.s17 + 0)
.s51:
126e : 0a __ __ ASL
126f : 0a __ __ ASL
1270 : aa __ __ TAX
1271 : bd b7 1c LDA $1cb7,x ; (divmod32 + 213)
1274 : 85 47 __ STA T1 + 0 
1276 : bd b8 1c LDA $1cb8,x ; (divmod32 + 214)
1279 : 85 48 __ STA T1 + 1 
127b : bd b9 1c LDA $1cb9,x ; (spentry + 0)
127e : 85 49 __ STA T1 + 2 
1280 : bd ba 1c LDA $1cba,x ; (giocharmap + 0)
.s17:
1283 : 85 4a __ STA T1 + 3 
1285 : a5 43 __ LDA T0 + 0 
1287 : 85 1b __ STA ACCU + 0 
1289 : a5 44 __ LDA T0 + 1 
128b : 85 1c __ STA ACCU + 1 
128d : a5 45 __ LDA T0 + 2 
128f : 85 1d __ STA ACCU + 2 
1291 : a5 46 __ LDA T0 + 3 
1293 : 85 1e __ STA ACCU + 3 
1295 : a2 47 __ LDX #$47
1297 : 20 bf 17 JSR $17bf ; (freg + 4)
129a : 20 06 18 JSR $1806 ; (faddsub + 6)
129d : a5 1c __ LDA ACCU + 1 
129f : 85 16 __ STA P9 ; (f + 1)
12a1 : a5 1d __ LDA ACCU + 2 
12a3 : 85 17 __ STA P10 ; (f + 2)
12a5 : a6 1b __ LDX ACCU + 0 
12a7 : a5 1e __ LDA ACCU + 3 
12a9 : 85 18 __ STA P11 ; (f + 3)
12ab : 30 3a __ BMI $12e7 ; (nformf.s18 + 0)
.s46:
12ad : c9 41 __ CMP #$41
12af : d0 0d __ BNE $12be ; (nformf.s50 + 0)
.s47:
12b1 : a5 17 __ LDA P10 ; (f + 2)
12b3 : c9 20 __ CMP #$20
12b5 : d0 07 __ BNE $12be ; (nformf.s50 + 0)
.s48:
12b7 : a5 16 __ LDA P9 ; (f + 1)
12b9 : d0 03 __ BNE $12be ; (nformf.s50 + 0)
.s49:
12bb : 8a __ __ TXA
12bc : f0 02 __ BEQ $12c0 ; (nformf.s45 + 0)
.s50:
12be : 90 27 __ BCC $12e7 ; (nformf.s18 + 0)
.s45:
12c0 : a9 00 __ LDA #$00
12c2 : 85 03 __ STA WORK + 0 
12c4 : 85 04 __ STA WORK + 1 
12c6 : a9 20 __ LDA #$20
12c8 : 85 05 __ STA WORK + 2 
12ca : a9 41 __ LDA #$41
12cc : 85 06 __ STA WORK + 3 
12ce : 20 cf 17 JSR $17cf ; (freg + 20)
12d1 : 20 b5 19 JSR $19b5 ; (crt_fdiv + 0)
12d4 : a5 1c __ LDA ACCU + 1 
12d6 : 85 16 __ STA P9 ; (f + 1)
12d8 : a5 1d __ LDA ACCU + 2 
12da : 85 17 __ STA P10 ; (f + 2)
12dc : a5 1e __ LDA ACCU + 3 
12de : 85 18 __ STA P11 ; (f + 3)
12e0 : a6 4d __ LDX T3 + 0 
12e2 : ca __ __ DEX
12e3 : 86 52 __ STX T6 + 0 
12e5 : a6 1b __ LDX ACCU + 0 
.s18:
12e7 : 38 __ __ SEC
12e8 : a5 51 __ LDA T5 + 0 
12ea : e5 52 __ SBC T6 + 0 
12ec : 85 4d __ STA T3 + 0 
12ee : a9 00 __ LDA #$00
12f0 : e9 00 __ SBC #$00
12f2 : 85 4e __ STA T3 + 1 
12f4 : a9 14 __ LDA #$14
12f6 : c5 51 __ CMP T5 + 0 
12f8 : b0 02 __ BCS $12fc ; (nformf.s19 + 0)
.s44:
12fa : 85 51 __ STA T5 + 0 
.s19:
12fc : a5 4d __ LDA T3 + 0 
12fe : d0 08 __ BNE $1308 ; (nformf.s21 + 0)
.s20:
1300 : a9 30 __ LDA #$30
1302 : a4 54 __ LDY T9 + 0 
1304 : 91 13 __ STA (P6),y ; (str + 0)
1306 : e6 54 __ INC T9 + 0 
.s21:
1308 : a9 00 __ LDA #$00
130a : 85 56 __ STA T11 + 0 
130c : c5 4d __ CMP T3 + 0 
130e : f0 6f __ BEQ $137f ; (nformf.l43 + 0)
.s23:
1310 : c9 07 __ CMP #$07
1312 : 90 04 __ BCC $1318 ; (nformf.s24 + 0)
.l42:
1314 : a9 30 __ LDA #$30
1316 : b0 55 __ BCS $136d ; (nformf.l25 + 0)
.s24:
1318 : 86 1b __ STX ACCU + 0 
131a : 86 43 __ STX T0 + 0 
131c : a5 16 __ LDA P9 ; (f + 1)
131e : 85 1c __ STA ACCU + 1 
1320 : 85 44 __ STA T0 + 1 
1322 : a5 17 __ LDA P10 ; (f + 2)
1324 : 85 1d __ STA ACCU + 2 
1326 : 85 45 __ STA T0 + 2 
1328 : a5 18 __ LDA P11 ; (f + 3)
132a : 85 1e __ STA ACCU + 3 
132c : 85 46 __ STA T0 + 3 
132e : 20 4f 1b JSR $1b4f ; (f32_to_i16 + 0)
1331 : a5 1b __ LDA ACCU + 0 
1333 : 85 53 __ STA T7 + 0 
1335 : 20 9b 1b JSR $1b9b ; (sint16_to_float + 0)
1338 : a2 43 __ LDX #$43
133a : 20 bf 17 JSR $17bf ; (freg + 4)
133d : a5 1e __ LDA ACCU + 3 
133f : 49 80 __ EOR #$80
1341 : 85 1e __ STA ACCU + 3 
1343 : 20 06 18 JSR $1806 ; (faddsub + 6)
1346 : a9 00 __ LDA #$00
1348 : 85 03 __ STA WORK + 0 
134a : 85 04 __ STA WORK + 1 
134c : a9 20 __ LDA #$20
134e : 85 05 __ STA WORK + 2 
1350 : a9 41 __ LDA #$41
1352 : 85 06 __ STA WORK + 3 
1354 : 20 cf 17 JSR $17cf ; (freg + 20)
1357 : 20 ed 18 JSR $18ed ; (crt_fmul + 0)
135a : a5 1c __ LDA ACCU + 1 
135c : 85 16 __ STA P9 ; (f + 1)
135e : a5 1d __ LDA ACCU + 2 
1360 : 85 17 __ STA P10 ; (f + 2)
1362 : a5 1e __ LDA ACCU + 3 
1364 : 85 18 __ STA P11 ; (f + 3)
1366 : 18 __ __ CLC
1367 : a5 53 __ LDA T7 + 0 
1369 : 69 30 __ ADC #$30
136b : a6 1b __ LDX ACCU + 0 
.l25:
136d : a4 54 __ LDY T9 + 0 
136f : 91 13 __ STA (P6),y ; (str + 0)
1371 : e6 54 __ INC T9 + 0 
1373 : e6 56 __ INC T11 + 0 
1375 : a5 56 __ LDA T11 + 0 
1377 : c5 51 __ CMP T5 + 0 
1379 : b0 14 __ BCS $138f ; (nformf.s26 + 0)
.s22:
137b : c5 4d __ CMP T3 + 0 
137d : d0 91 __ BNE $1310 ; (nformf.s23 + 0)
.l43:
137f : a9 2e __ LDA #$2e
1381 : a4 54 __ LDY T9 + 0 
1383 : 91 13 __ STA (P6),y ; (str + 0)
1385 : e6 54 __ INC T9 + 0 
1387 : a5 56 __ LDA T11 + 0 
1389 : c9 07 __ CMP #$07
138b : 90 8b __ BCC $1318 ; (nformf.s24 + 0)
138d : b0 85 __ BCS $1314 ; (nformf.l42 + 0)
.s26:
138f : a5 55 __ LDA T10 + 0 
1391 : f0 66 __ BEQ $13f9 ; (nformf.s27 + 0)
.s38:
1393 : a0 03 __ LDY #$03
1395 : b1 4b __ LDA (T2 + 0),y 
1397 : 69 03 __ ADC #$03
1399 : a4 54 __ LDY T9 + 0 
139b : 91 13 __ STA (P6),y ; (str + 0)
139d : c8 __ __ INY
139e : 84 54 __ STY T9 + 0 
13a0 : 24 50 __ BIT T4 + 1 
13a2 : 30 06 __ BMI $13aa ; (nformf.s41 + 0)
.s39:
13a4 : a9 2b __ LDA #$2b
13a6 : 91 13 __ STA (P6),y ; (str + 0)
13a8 : d0 11 __ BNE $13bb ; (nformf.s40 + 0)
.s41:
13aa : a9 2d __ LDA #$2d
13ac : 91 13 __ STA (P6),y ; (str + 0)
13ae : 38 __ __ SEC
13af : a9 00 __ LDA #$00
13b1 : e5 4f __ SBC T4 + 0 
13b3 : 85 4f __ STA T4 + 0 
13b5 : a9 00 __ LDA #$00
13b7 : e5 50 __ SBC T4 + 1 
13b9 : 85 50 __ STA T4 + 1 
.s40:
13bb : e6 54 __ INC T9 + 0 
13bd : a5 4f __ LDA T4 + 0 
13bf : 85 1b __ STA ACCU + 0 
13c1 : a5 50 __ LDA T4 + 1 
13c3 : 85 1c __ STA ACCU + 1 
13c5 : a9 0a __ LDA #$0a
13c7 : 85 03 __ STA WORK + 0 
13c9 : a9 00 __ LDA #$00
13cb : 85 04 __ STA WORK + 1 
13cd : 20 63 1a JSR $1a63 ; (divs16 + 0)
13d0 : 18 __ __ CLC
13d1 : a5 1b __ LDA ACCU + 0 
13d3 : 69 30 __ ADC #$30
13d5 : a4 54 __ LDY T9 + 0 
13d7 : 91 13 __ STA (P6),y ; (str + 0)
13d9 : e6 54 __ INC T9 + 0 
13db : a5 4f __ LDA T4 + 0 
13dd : 85 1b __ STA ACCU + 0 
13df : a5 50 __ LDA T4 + 1 
13e1 : 85 1c __ STA ACCU + 1 
13e3 : a9 0a __ LDA #$0a
13e5 : 85 03 __ STA WORK + 0 
13e7 : a9 00 __ LDA #$00
13e9 : 85 04 __ STA WORK + 1 
13eb : 20 22 1b JSR $1b22 ; (mods16 + 0)
13ee : 18 __ __ CLC
13ef : a5 05 __ LDA WORK + 2 
13f1 : 69 30 __ ADC #$30
13f3 : a4 54 __ LDY T9 + 0 
13f5 : 91 13 __ STA (P6),y ; (str + 0)
13f7 : e6 54 __ INC T9 + 0 
.s27:
13f9 : a5 54 __ LDA T9 + 0 
13fb : a0 01 __ LDY #$01
13fd : d1 11 __ CMP (P4),y ; (si + 0)
13ff : b0 6d __ BCS $146e ; (nformf.s3 + 0)
.s28:
1401 : a0 06 __ LDY #$06
1403 : b1 11 __ LDA (P4),y ; (si + 0)
1405 : f0 04 __ BEQ $140b ; (nformf.s29 + 0)
.s110:
1407 : a6 54 __ LDX T9 + 0 
1409 : 90 70 __ BCC $147b ; (nformf.l36 + 0)
.s29:
140b : a5 54 __ LDA T9 + 0 
140d : f0 40 __ BEQ $144f ; (nformf.s30 + 0)
.s35:
140f : e9 00 __ SBC #$00
1411 : a8 __ __ TAY
1412 : a9 00 __ LDA #$00
1414 : e9 00 __ SBC #$00
1416 : aa __ __ TAX
1417 : 98 __ __ TYA
1418 : 18 __ __ CLC
1419 : 65 13 __ ADC P6 ; (str + 0)
141b : 85 47 __ STA T1 + 0 
141d : 8a __ __ TXA
141e : 65 14 __ ADC P7 ; (str + 1)
1420 : 85 48 __ STA T1 + 1 
1422 : a9 01 __ LDA #$01
1424 : 85 4d __ STA T3 + 0 
1426 : a6 54 __ LDX T9 + 0 
1428 : 38 __ __ SEC
.l111:
1429 : a0 01 __ LDY #$01
142b : b1 11 __ LDA (P4),y ; (si + 0)
142d : e5 4d __ SBC T3 + 0 
142f : 85 4b __ STA T2 + 0 
1431 : a9 00 __ LDA #$00
1433 : e5 4e __ SBC T3 + 1 
1435 : 18 __ __ CLC
1436 : 65 14 __ ADC P7 ; (str + 1)
1438 : 85 4c __ STA T2 + 1 
143a : 88 __ __ DEY
143b : b1 47 __ LDA (T1 + 0),y 
143d : a4 13 __ LDY P6 ; (str + 0)
143f : 91 4b __ STA (T2 + 0),y 
1441 : a5 47 __ LDA T1 + 0 
1443 : d0 02 __ BNE $1447 ; (nformf.s114 + 0)
.s113:
1445 : c6 48 __ DEC T1 + 1 
.s114:
1447 : c6 47 __ DEC T1 + 0 
1449 : e6 4d __ INC T3 + 0 
144b : e4 4d __ CPX T3 + 0 
144d : b0 da __ BCS $1429 ; (nformf.l111 + 0)
.s30:
144f : a9 00 __ LDA #$00
1451 : 85 4d __ STA T3 + 0 
1453 : 90 08 __ BCC $145d ; (nformf.l31 + 0)
.s33:
1455 : a9 20 __ LDA #$20
1457 : a4 4d __ LDY T3 + 0 
1459 : 91 13 __ STA (P6),y ; (str + 0)
145b : e6 4d __ INC T3 + 0 
.l31:
145d : a0 01 __ LDY #$01
145f : b1 11 __ LDA (P4),y ; (si + 0)
1461 : 38 __ __ SEC
1462 : e5 54 __ SBC T9 + 0 
1464 : 90 ef __ BCC $1455 ; (nformf.s33 + 0)
.s34:
1466 : c5 4d __ CMP T3 + 0 
1468 : 90 02 __ BCC $146c ; (nformf.s32 + 0)
.s112:
146a : d0 e9 __ BNE $1455 ; (nformf.s33 + 0)
.s32:
146c : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
146e : 85 1b __ STA ACCU + 0 
1470 : a2 03 __ LDX #$03
1472 : bd eb 9f LDA $9feb,x ; (nformf@stack + 0)
1475 : 95 53 __ STA T7 + 0,x 
1477 : ca __ __ DEX
1478 : 10 f8 __ BPL $1472 ; (nformf.s3 + 4)
147a : 60 __ __ RTS
.l36:
147b : 8a __ __ TXA
147c : a0 01 __ LDY #$01
147e : d1 11 __ CMP (P4),y ; (si + 0)
1480 : b0 ea __ BCS $146c ; (nformf.s32 + 0)
.s37:
1482 : a8 __ __ TAY
1483 : a9 20 __ LDA #$20
1485 : 91 13 __ STA (P6),y ; (str + 0)
1487 : e8 __ __ INX
1488 : 90 f1 __ BCC $147b ; (nformf.l36 + 0)
.s53:
148a : a5 51 __ LDA T5 + 0 
148c : c9 07 __ CMP #$07
148e : 90 14 __ BCC $14a4 ; (nformf.s62 + 0)
.s54:
1490 : ad d3 1c LDA $1cd3 ; (fround5[0] + 24)
1493 : 85 47 __ STA T1 + 0 
1495 : ad d4 1c LDA $1cd4 ; (fround5[0] + 25)
1498 : 85 48 __ STA T1 + 1 
149a : ad d5 1c LDA $1cd5 ; (fround5[0] + 26)
149d : 85 49 __ STA T1 + 2 
149f : ad d6 1c LDA $1cd6 ; (fround5[0] + 27)
14a2 : b0 15 __ BCS $14b9 ; (nformf.s55 + 0)
.s62:
14a4 : 0a __ __ ASL
14a5 : 0a __ __ ASL
14a6 : aa __ __ TAX
14a7 : bd b7 1c LDA $1cb7,x ; (divmod32 + 213)
14aa : 85 47 __ STA T1 + 0 
14ac : bd b8 1c LDA $1cb8,x ; (divmod32 + 214)
14af : 85 48 __ STA T1 + 1 
14b1 : bd b9 1c LDA $1cb9,x ; (spentry + 0)
14b4 : 85 49 __ STA T1 + 2 
14b6 : bd ba 1c LDA $1cba,x ; (giocharmap + 0)
.s55:
14b9 : 85 4a __ STA T1 + 3 
14bb : a5 43 __ LDA T0 + 0 
14bd : 85 1b __ STA ACCU + 0 
14bf : a5 44 __ LDA T0 + 1 
14c1 : 85 1c __ STA ACCU + 1 
14c3 : a5 45 __ LDA T0 + 2 
14c5 : 85 1d __ STA ACCU + 2 
14c7 : a5 46 __ LDA T0 + 3 
14c9 : 85 1e __ STA ACCU + 3 
14cb : a2 47 __ LDX #$47
14cd : 20 bf 17 JSR $17bf ; (freg + 4)
14d0 : 20 06 18 JSR $1806 ; (faddsub + 6)
14d3 : a5 1c __ LDA ACCU + 1 
14d5 : 85 16 __ STA P9 ; (f + 1)
14d7 : a5 1d __ LDA ACCU + 2 
14d9 : 85 17 __ STA P10 ; (f + 2)
14db : a6 1b __ LDX ACCU + 0 
14dd : a5 1e __ LDA ACCU + 3 
14df : 85 18 __ STA P11 ; (f + 3)
14e1 : 10 03 __ BPL $14e6 ; (nformf.s57 + 0)
14e3 : 4c e7 12 JMP $12e7 ; (nformf.s18 + 0)
.s57:
14e6 : c9 41 __ CMP #$41
14e8 : d0 0d __ BNE $14f7 ; (nformf.s61 + 0)
.s58:
14ea : a5 17 __ LDA P10 ; (f + 2)
14ec : c9 20 __ CMP #$20
14ee : d0 07 __ BNE $14f7 ; (nformf.s61 + 0)
.s59:
14f0 : a5 16 __ LDA P9 ; (f + 1)
14f2 : d0 03 __ BNE $14f7 ; (nformf.s61 + 0)
.s60:
14f4 : 8a __ __ TXA
14f5 : f0 02 __ BEQ $14f9 ; (nformf.s56 + 0)
.s61:
14f7 : 90 ea __ BCC $14e3 ; (nformf.s55 + 42)
.s56:
14f9 : a9 00 __ LDA #$00
14fb : 85 03 __ STA WORK + 0 
14fd : 85 04 __ STA WORK + 1 
14ff : a9 20 __ LDA #$20
1501 : 85 05 __ STA WORK + 2 
1503 : a9 41 __ LDA #$41
1505 : 85 06 __ STA WORK + 3 
1507 : 20 cf 17 JSR $17cf ; (freg + 20)
150a : 20 b5 19 JSR $19b5 ; (crt_fdiv + 0)
150d : a5 1c __ LDA ACCU + 1 
150f : 85 16 __ STA P9 ; (f + 1)
1511 : a5 1d __ LDA ACCU + 2 
1513 : 85 17 __ STA P10 ; (f + 2)
1515 : a5 1e __ LDA ACCU + 3 
1517 : 85 18 __ STA P11 ; (f + 3)
1519 : a6 1b __ LDX ACCU + 0 
151b : e6 4f __ INC T4 + 0 
151d : d0 c4 __ BNE $14e3 ; (nformf.s55 + 42)
.s117:
151f : e6 50 __ INC T4 + 1 
1521 : 4c e7 12 JMP $12e7 ; (nformf.s18 + 0)
.s102:
1524 : 86 43 __ STX T0 + 0 
1526 : 85 47 __ STA T1 + 0 
1528 : a0 03 __ LDY #$03
152a : b1 11 __ LDA (P4),y ; (si + 0)
152c : 18 __ __ CLC
152d : 69 08 __ ADC #$08
152f : a4 43 __ LDY T0 + 0 
1531 : 91 13 __ STA (P6),y ; (str + 0)
1533 : 18 __ __ CLC
1534 : a0 03 __ LDY #$03
1536 : b1 11 __ LDA (P4),y ; (si + 0)
1538 : 69 0d __ ADC #$0d
153a : a4 43 __ LDY T0 + 0 
153c : c8 __ __ INY
153d : 91 13 __ STA (P6),y ; (str + 0)
153f : a0 03 __ LDY #$03
1541 : b1 11 __ LDA (P4),y ; (si + 0)
1543 : 18 __ __ CLC
1544 : 69 05 __ ADC #$05
1546 : a4 47 __ LDY T1 + 0 
1548 : 91 13 __ STA (P6),y ; (str + 0)
154a : 18 __ __ CLC
154b : a5 54 __ LDA T9 + 0 
154d : 69 03 __ ADC #$03
154f : 85 54 __ STA T9 + 0 
1551 : 4c f9 13 JMP $13f9 ; (nformf.s27 + 0)
.s104:
1554 : 20 65 15 JSR $1565 ; (isinf.s4 + 0)
1557 : a2 01 __ LDX #$01
1559 : 86 54 __ STX T9 + 0 
155b : a8 __ __ TAY
155c : d0 03 __ BNE $1561 ; (nformf.s105 + 0)
155e : 4c 6e 10 JMP $106e ; (nformf.s7 + 0)
.s105:
1561 : a9 03 __ LDA #$03
1563 : d0 bf __ BNE $1524 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/hdnsh/oscar/include/math.h"
.s4:
1565 : 06 0f __ ASL P2 ; (f + 2)
1567 : a5 10 __ LDA P3 ; (f + 3)
1569 : 2a __ __ ROL
156a : c9 ff __ CMP #$ff
156c : d0 03 __ BNE $1571 ; (isinf.s6 + 0)
.s5:
156e : a9 01 __ LDA #$01
1570 : 60 __ __ RTS
.s6:
1571 : a9 00 __ LDA #$00
.s3:
1573 : 60 __ __ RTS
--------------------------------------------------------------------
1574 : __ __ __ BYT 25 64 0a 00                                     : %d..
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdlib.h"
.s4:
1578 : ad d8 1c LDA $1cd8 ; (seed + 1)
157b : 4a __ __ LSR
157c : ad d7 1c LDA $1cd7 ; (seed + 0)
157f : 6a __ __ ROR
1580 : aa __ __ TAX
1581 : a9 00 __ LDA #$00
1583 : 6a __ __ ROR
1584 : 4d d7 1c EOR $1cd7 ; (seed + 0)
1587 : 85 1b __ STA ACCU + 0 
1589 : 8a __ __ TXA
158a : 4d d8 1c EOR $1cd8 ; (seed + 1)
158d : 85 1c __ STA ACCU + 1 
158f : 4a __ __ LSR
1590 : 45 1b __ EOR ACCU + 0 
1592 : 8d d7 1c STA $1cd7 ; (seed + 0)
1595 : 85 1b __ STA ACCU + 0 
1597 : 45 1c __ EOR ACCU + 1 
1599 : 8d d8 1c STA $1cd8 ; (seed + 1)
159c : 85 1c __ STA ACCU + 1 
.s3:
159e : 60 __ __ RTS
--------------------------------------------------------------------
uii_identify: ; uii_identify()->void
; 106, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
159f : a9 01 __ LDA #$01
15a1 : 8d d9 1c STA $1cd9 ; (uii_target + 0)
15a4 : 8d f3 9f STA $9ff3 ; (cmd[0] + 1)
15a7 : a9 02 __ LDA #$02
15a9 : 85 0f __ STA P2 
15ab : a9 00 __ LDA #$00
15ad : 85 10 __ STA P3 
15af : 8d f2 9f STA $9ff2 ; (cmd[0] + 0)
15b2 : a9 f2 __ LDA #$f2
15b4 : 85 0d __ STA P0 
15b6 : a9 9f __ LDA #$9f
15b8 : 85 0e __ STA P1 
15ba : 20 c6 15 JSR $15c6 ; (uii_sendcommand.s4 + 0)
15bd : 20 60 16 JSR $1660 ; (uii_readdata.s4 + 0)
15c0 : 20 d4 16 JSR $16d4 ; (uii_readstatus.s4 + 0)
15c3 : 4c 2f 17 JMP $172f ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,i16)->void
; 142, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
15c6 : ad d9 1c LDA $1cd9 ; (uii_target + 0)
15c9 : a0 00 __ LDY #$00
15cb : 84 1b __ STY ACCU + 0 
15cd : 84 1c __ STY ACCU + 1 
15cf : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
15d1 : ad da 1c LDA $1cda ; (statusreg + 0)
15d4 : 85 43 __ STA T2 + 0 
15d6 : ad db 1c LDA $1cdb ; (statusreg + 1)
15d9 : 85 44 __ STA T2 + 1 
.l6:
15db : a0 00 __ LDY #$00
.l20:
15dd : b1 43 __ LDA (T2 + 0),y 
15df : 29 20 __ AND #$20
15e1 : d0 fa __ BNE $15dd ; (uii_sendcommand.l20 + 0)
.s7:
15e3 : b1 43 __ LDA (T2 + 0),y 
15e5 : 29 10 __ AND #$10
15e7 : d0 f2 __ BNE $15db ; (uii_sendcommand.l6 + 0)
.s8:
15e9 : a5 10 __ LDA P3 ; (count + 1)
15eb : 30 47 __ BMI $1634 ; (uii_sendcommand.s9 + 0)
.s19:
15ed : 85 46 __ STA T3 + 1 
15ef : a5 1c __ LDA ACCU + 1 
15f1 : c5 10 __ CMP P3 ; (count + 1)
15f3 : d0 04 __ BNE $15f9 ; (uii_sendcommand.s18 + 0)
.s17:
15f5 : a5 1b __ LDA ACCU + 0 
15f7 : c5 0f __ CMP P2 ; (count + 0)
.s18:
15f9 : b0 39 __ BCS $1634 ; (uii_sendcommand.s9 + 0)
.s13:
15fb : a5 0d __ LDA P0 ; (bytes + 0)
15fd : 65 1b __ ADC ACCU + 0 
15ff : 85 47 __ STA T4 + 0 
1601 : a5 0e __ LDA P1 ; (bytes + 1)
1603 : 65 1c __ ADC ACCU + 1 
1605 : 85 48 __ STA T4 + 1 
1607 : ad dc 1c LDA $1cdc ; (cmddatareg + 0)
160a : 85 49 __ STA T5 + 0 
160c : ad dd 1c LDA $1cdd ; (cmddatareg + 1)
160f : 85 4a __ STA T5 + 1 
1611 : a6 1b __ LDX ACCU + 0 
.l14:
1613 : b1 47 __ LDA (T4 + 0),y 
1615 : 91 49 __ STA (T5 + 0),y 
1617 : e8 __ __ INX
1618 : d0 02 __ BNE $161c ; (uii_sendcommand.s23 + 0)
.s22:
161a : e6 1c __ INC ACCU + 1 
.s23:
161c : 24 46 __ BIT T3 + 1 
161e : 30 12 __ BMI $1632 ; (uii_sendcommand.s21 + 0)
.s16:
1620 : e6 47 __ INC T4 + 0 
1622 : d0 02 __ BNE $1626 ; (uii_sendcommand.s25 + 0)
.s24:
1624 : e6 48 __ INC T4 + 1 
.s25:
1626 : a5 1c __ LDA ACCU + 1 
1628 : c5 10 __ CMP P3 ; (count + 1)
162a : 90 e7 __ BCC $1613 ; (uii_sendcommand.l14 + 0)
.s26:
162c : d0 04 __ BNE $1632 ; (uii_sendcommand.s21 + 0)
.s15:
162e : e4 0f __ CPX P2 ; (count + 0)
1630 : 90 e1 __ BCC $1613 ; (uii_sendcommand.l14 + 0)
.s21:
1632 : 86 1b __ STX ACCU + 0 
.s9:
1634 : ad de 1c LDA $1cde ; (controlreg + 0)
1637 : 85 45 __ STA T3 + 0 
1639 : ad df 1c LDA $1cdf ; (controlreg + 1)
163c : 85 46 __ STA T3 + 1 
163e : b1 45 __ LDA (T3 + 0),y 
1640 : aa __ __ TAX
1641 : 09 01 __ ORA #$01
1643 : 91 45 __ STA (T3 + 0),y 
1645 : b1 43 __ LDA (T2 + 0),y 
1647 : 29 04 __ AND #$04
1649 : f0 08 __ BEQ $1653 ; (uii_sendcommand.l10 + 0)
.s12:
164b : 8a __ __ TXA
164c : 09 09 __ ORA #$09
164e : 91 45 __ STA (T3 + 0),y 
1650 : 4c d1 15 JMP $15d1 ; (uii_sendcommand.l5 + 0)
.l10:
1653 : b1 43 __ LDA (T2 + 0),y 
1655 : 29 20 __ AND #$20
1657 : d0 06 __ BNE $165f ; (uii_sendcommand.s3 + 0)
.s11:
1659 : b1 43 __ LDA (T2 + 0),y 
165b : 29 10 __ AND #$10
165d : d0 f4 __ BNE $1653 ; (uii_sendcommand.l10 + 0)
.s3:
165f : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->i16
; 143, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1660 : a9 00 __ LDA #$00
1662 : 8d e4 1c STA $1ce4 ; (uii_data[0] + 0)
1665 : 20 b9 16 JSR $16b9 ; (uii_isdataavailable.s4 + 0)
1668 : a9 00 __ LDA #$00
166a : 85 45 __ STA T1 + 0 
166c : 85 46 __ STA T1 + 1 
166e : a5 1b __ LDA ACCU + 0 
1670 : 05 1c __ ORA ACCU + 1 
1672 : f0 2d __ BEQ $16a1 ; (uii_readdata.s5 + 0)
.s6:
1674 : a9 e4 __ LDA #$e4
1676 : 85 47 __ STA T2 + 0 
1678 : a9 1c __ LDA #$1c
167a : 85 48 __ STA T2 + 1 
.l7:
167c : ad e0 1c LDA $1ce0 ; (respdatareg + 0)
167f : 85 43 __ STA T0 + 0 
1681 : ad e1 1c LDA $1ce1 ; (respdatareg + 1)
1684 : 85 44 __ STA T0 + 1 
1686 : a0 00 __ LDY #$00
1688 : b1 43 __ LDA (T0 + 0),y 
168a : 91 47 __ STA (T2 + 0),y 
168c : e6 45 __ INC T1 + 0 
168e : d0 02 __ BNE $1692 ; (uii_readdata.s9 + 0)
.s8:
1690 : e6 46 __ INC T1 + 1 
.s9:
1692 : e6 47 __ INC T2 + 0 
1694 : d0 02 __ BNE $1698 ; (uii_readdata.s11 + 0)
.s10:
1696 : e6 48 __ INC T2 + 1 
.s11:
1698 : 20 b9 16 JSR $16b9 ; (uii_isdataavailable.s4 + 0)
169b : a5 1b __ LDA ACCU + 0 
169d : 05 1c __ ORA ACCU + 1 
169f : d0 db __ BNE $167c ; (uii_readdata.l7 + 0)
.s5:
16a1 : a9 e4 __ LDA #$e4
16a3 : 85 43 __ STA T0 + 0 
16a5 : 18 __ __ CLC
16a6 : a9 1c __ LDA #$1c
16a8 : 65 46 __ ADC T1 + 1 
16aa : 85 44 __ STA T0 + 1 
16ac : a9 00 __ LDA #$00
16ae : a4 45 __ LDY T1 + 0 
16b0 : 84 1b __ STY ACCU + 0 
16b2 : 91 43 __ STA (T0 + 0),y 
16b4 : a5 46 __ LDA T1 + 1 
16b6 : 85 1c __ STA ACCU + 1 
.s3:
16b8 : 60 __ __ RTS
--------------------------------------------------------------------
uii_isdataavailable: ; uii_isdataavailable()->i16
; 147, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
16b9 : ad da 1c LDA $1cda ; (statusreg + 0)
16bc : 85 1b __ STA ACCU + 0 
16be : ad db 1c LDA $1cdb ; (statusreg + 1)
16c1 : 85 1c __ STA ACCU + 1 
16c3 : a0 00 __ LDY #$00
16c5 : b1 1b __ LDA (ACCU + 0),y 
16c7 : 10 06 __ BPL $16cf ; (uii_isdataavailable.s5 + 0)
.s6:
16c9 : a9 01 __ LDA #$01
16cb : 85 1b __ STA ACCU + 0 
16cd : d0 02 __ BNE $16d1 ; (uii_isdataavailable.s3 + 0)
.s5:
16cf : 84 1b __ STY ACCU + 0 
.s3:
16d1 : 84 1c __ STY ACCU + 1 
16d3 : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->i16
; 144, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
16d4 : a9 00 __ LDA #$00
16d6 : 8d 00 24 STA $2400 ; (uii_status[0] + 0)
16d9 : 85 43 __ STA T2 + 0 
16db : 85 44 __ STA T2 + 1 
.l7:
16dd : 20 11 17 JSR $1711 ; (uii_isstatusdataavailable.s4 + 0)
16e0 : a5 1b __ LDA ACCU + 0 
16e2 : 05 1c __ ORA ACCU + 1 
16e4 : f0 1f __ BEQ $1705 ; (uii_readstatus.s5 + 0)
.s6:
16e6 : ad e2 1c LDA $1ce2 ; (statusdatareg + 0)
16e9 : 85 1b __ STA ACCU + 0 
16eb : ad e3 1c LDA $1ce3 ; (statusdatareg + 1)
16ee : 85 1c __ STA ACCU + 1 
16f0 : a0 00 __ LDY #$00
16f2 : b1 1b __ LDA (ACCU + 0),y 
16f4 : a6 43 __ LDX T2 + 0 
16f6 : 9d 00 24 STA $2400,x ; (uii_status[0] + 0)
16f9 : 8a __ __ TXA
16fa : 18 __ __ CLC
16fb : 69 01 __ ADC #$01
16fd : 85 43 __ STA T2 + 0 
16ff : 90 dc __ BCC $16dd ; (uii_readstatus.l7 + 0)
.s8:
1701 : e6 44 __ INC T2 + 1 
1703 : b0 d8 __ BCS $16dd ; (uii_readstatus.l7 + 0)
.s5:
1705 : a6 43 __ LDX T2 + 0 
1707 : 86 1b __ STX ACCU + 0 
1709 : 9d 00 24 STA $2400,x ; (uii_status[0] + 0)
170c : a5 44 __ LDA T2 + 1 
170e : 85 1c __ STA ACCU + 1 
.s3:
1710 : 60 __ __ RTS
--------------------------------------------------------------------
uii_isstatusdataavailable: ; uii_isstatusdataavailable()->i16
; 148, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1711 : ad da 1c LDA $1cda ; (statusreg + 0)
1714 : 85 1b __ STA ACCU + 0 
1716 : ad db 1c LDA $1cdb ; (statusreg + 1)
1719 : 85 1c __ STA ACCU + 1 
171b : a0 00 __ LDY #$00
171d : b1 1b __ LDA (ACCU + 0),y 
171f : 29 40 __ AND #$40
1721 : f0 07 __ BEQ $172a ; (uii_isstatusdataavailable.s5 + 0)
.s6:
1723 : a9 01 __ LDA #$01
1725 : 85 1b __ STA ACCU + 0 
1727 : 98 __ __ TYA
1728 : f0 02 __ BEQ $172c ; (uii_isstatusdataavailable.s3 + 0)
.s5:
172a : 85 1b __ STA ACCU + 0 
.s3:
172c : 85 1c __ STA ACCU + 1 
172e : 60 __ __ RTS
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 145, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
172f : ad de 1c LDA $1cde ; (controlreg + 0)
1732 : 85 1b __ STA ACCU + 0 
1734 : ad df 1c LDA $1cdf ; (controlreg + 1)
1737 : 85 1c __ STA ACCU + 1 
1739 : a0 00 __ LDY #$00
173b : b1 1b __ LDA (ACCU + 0),y 
173d : 09 02 __ ORA #$02
173f : 91 1b __ STA (ACCU + 0),y 
1741 : ad da 1c LDA $1cda ; (statusreg + 0)
1744 : 85 1b __ STA ACCU + 0 
1746 : ad db 1c LDA $1cdb ; (statusreg + 1)
1749 : 85 1c __ STA ACCU + 1 
.l5:
174b : b1 1b __ LDA (ACCU + 0),y 
174d : 29 02 __ AND #$02
174f : d0 fa __ BNE $174b ; (uii_accept.l5 + 0)
.s3:
1751 : 60 __ __ RTS
--------------------------------------------------------------------
1752 : __ __ __ BYT 25 73 0a 00                                     : %s..
--------------------------------------------------------------------
getpch: ; getpch()->u8
;  70, "/home/honza/projects/c64/projects/hdnsh/oscar/include/conio.h"
.s4:
1756 : 20 cf ff JSR $ffcf 
1759 : 85 1b __ STA ACCU + 0 
175b : a5 1b __ LDA ACCU + 0 
175d : 4c 60 17 JMP $1760 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/hdnsh/oscar/include/conio.c"
.s4:
1760 : a8 __ __ TAY
1761 : ad ba 1c LDA $1cba ; (giocharmap + 0)
1764 : f0 27 __ BEQ $178d ; (convch.s5 + 0)
.s6:
1766 : c0 0d __ CPY #$0d
1768 : d0 03 __ BNE $176d ; (convch.s7 + 0)
.s16:
176a : a9 0a __ LDA #$0a
.s3:
176c : 60 __ __ RTS
.s7:
176d : c9 02 __ CMP #$02
176f : 90 1c __ BCC $178d ; (convch.s5 + 0)
.s8:
1771 : 98 __ __ TYA
1772 : c0 41 __ CPY #$41
1774 : 90 17 __ BCC $178d ; (convch.s5 + 0)
.s9:
1776 : c9 db __ CMP #$db
1778 : b0 13 __ BCS $178d ; (convch.s5 + 0)
.s10:
177a : c9 c1 __ CMP #$c1
177c : 90 03 __ BCC $1781 ; (convch.s11 + 0)
.s15:
177e : 49 a0 __ EOR #$a0
1780 : a8 __ __ TAY
.s11:
1781 : c9 7b __ CMP #$7b
1783 : b0 08 __ BCS $178d ; (convch.s5 + 0)
.s12:
1785 : c9 61 __ CMP #$61
1787 : b0 06 __ BCS $178f ; (convch.s14 + 0)
.s13:
1789 : c9 5b __ CMP #$5b
178b : 90 02 __ BCC $178f ; (convch.s14 + 0)
.s5:
178d : 98 __ __ TYA
178e : 60 __ __ RTS
.s14:
178f : 49 20 __ EOR #$20
1791 : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_time: ; uii_get_time()->void
; 162, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1792 : a9 00 __ LDA #$00
1794 : 85 10 __ STA P3 
1796 : 8d f2 9f STA $9ff2 ; (cmd[0] + 0)
1799 : a9 02 __ LDA #$02
179b : 85 0f __ STA P2 
179d : a9 01 __ LDA #$01
179f : 8d d9 1c STA $1cd9 ; (uii_target + 0)
17a2 : a9 26 __ LDA #$26
17a4 : 8d f3 9f STA $9ff3 ; (cmd[0] + 1)
17a7 : a9 f2 __ LDA #$f2
17a9 : 85 0d __ STA P0 
17ab : a9 9f __ LDA #$9f
17ad : 85 0e __ STA P1 
17af : 20 c6 15 JSR $15c6 ; (uii_sendcommand.s4 + 0)
17b2 : 20 60 16 JSR $1660 ; (uii_readdata.s4 + 0)
17b5 : 20 d4 16 JSR $16d4 ; (uii_readstatus.s4 + 0)
17b8 : 4c 2f 17 JMP $172f ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
freg: ; freg
17bb : b1 19 __ LDA (IP + 0),y 
17bd : c8 __ __ INY
17be : aa __ __ TAX
17bf : b5 00 __ LDA $00,x 
17c1 : 85 03 __ STA WORK + 0 
17c3 : b5 01 __ LDA $01,x 
17c5 : 85 04 __ STA WORK + 1 
17c7 : b5 02 __ LDA $02,x 
17c9 : 85 05 __ STA WORK + 2 
17cb : b5 03 __ LDA WORK + 0,x 
17cd : 85 06 __ STA WORK + 3 
17cf : a5 05 __ LDA WORK + 2 
17d1 : 0a __ __ ASL
17d2 : a5 06 __ LDA WORK + 3 
17d4 : 2a __ __ ROL
17d5 : 85 08 __ STA WORK + 5 
17d7 : f0 06 __ BEQ $17df ; (freg + 36)
17d9 : a5 05 __ LDA WORK + 2 
17db : 09 80 __ ORA #$80
17dd : 85 05 __ STA WORK + 2 
17df : a5 1d __ LDA ACCU + 2 
17e1 : 0a __ __ ASL
17e2 : a5 1e __ LDA ACCU + 3 
17e4 : 2a __ __ ROL
17e5 : 85 07 __ STA WORK + 4 
17e7 : f0 06 __ BEQ $17ef ; (freg + 52)
17e9 : a5 1d __ LDA ACCU + 2 
17eb : 09 80 __ ORA #$80
17ed : 85 1d __ STA ACCU + 2 
17ef : 60 __ __ RTS
17f0 : 06 1e __ ASL ACCU + 3 
17f2 : a5 07 __ LDA WORK + 4 
17f4 : 6a __ __ ROR
17f5 : 85 1e __ STA ACCU + 3 
17f7 : b0 06 __ BCS $17ff ; (freg + 68)
17f9 : a5 1d __ LDA ACCU + 2 
17fb : 29 7f __ AND #$7f
17fd : 85 1d __ STA ACCU + 2 
17ff : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1800 : a5 06 __ LDA WORK + 3 
1802 : 49 80 __ EOR #$80
1804 : 85 06 __ STA WORK + 3 
1806 : a9 ff __ LDA #$ff
1808 : c5 07 __ CMP WORK + 4 
180a : f0 04 __ BEQ $1810 ; (faddsub + 16)
180c : c5 08 __ CMP WORK + 5 
180e : d0 11 __ BNE $1821 ; (faddsub + 33)
1810 : a5 1e __ LDA ACCU + 3 
1812 : 09 7f __ ORA #$7f
1814 : 85 1e __ STA ACCU + 3 
1816 : a9 80 __ LDA #$80
1818 : 85 1d __ STA ACCU + 2 
181a : a9 00 __ LDA #$00
181c : 85 1b __ STA ACCU + 0 
181e : 85 1c __ STA ACCU + 1 
1820 : 60 __ __ RTS
1821 : 38 __ __ SEC
1822 : a5 07 __ LDA WORK + 4 
1824 : e5 08 __ SBC WORK + 5 
1826 : f0 38 __ BEQ $1860 ; (faddsub + 96)
1828 : aa __ __ TAX
1829 : b0 25 __ BCS $1850 ; (faddsub + 80)
182b : e0 e9 __ CPX #$e9
182d : b0 0e __ BCS $183d ; (faddsub + 61)
182f : a5 08 __ LDA WORK + 5 
1831 : 85 07 __ STA WORK + 4 
1833 : a9 00 __ LDA #$00
1835 : 85 1b __ STA ACCU + 0 
1837 : 85 1c __ STA ACCU + 1 
1839 : 85 1d __ STA ACCU + 2 
183b : f0 23 __ BEQ $1860 ; (faddsub + 96)
183d : a5 1d __ LDA ACCU + 2 
183f : 4a __ __ LSR
1840 : 66 1c __ ROR ACCU + 1 
1842 : 66 1b __ ROR ACCU + 0 
1844 : e8 __ __ INX
1845 : d0 f8 __ BNE $183f ; (faddsub + 63)
1847 : 85 1d __ STA ACCU + 2 
1849 : a5 08 __ LDA WORK + 5 
184b : 85 07 __ STA WORK + 4 
184d : 4c 60 18 JMP $1860 ; (faddsub + 96)
1850 : e0 18 __ CPX #$18
1852 : b0 33 __ BCS $1887 ; (faddsub + 135)
1854 : a5 05 __ LDA WORK + 2 
1856 : 4a __ __ LSR
1857 : 66 04 __ ROR WORK + 1 
1859 : 66 03 __ ROR WORK + 0 
185b : ca __ __ DEX
185c : d0 f8 __ BNE $1856 ; (faddsub + 86)
185e : 85 05 __ STA WORK + 2 
1860 : a5 1e __ LDA ACCU + 3 
1862 : 29 80 __ AND #$80
1864 : 85 1e __ STA ACCU + 3 
1866 : 45 06 __ EOR WORK + 3 
1868 : 30 31 __ BMI $189b ; (faddsub + 155)
186a : 18 __ __ CLC
186b : a5 1b __ LDA ACCU + 0 
186d : 65 03 __ ADC WORK + 0 
186f : 85 1b __ STA ACCU + 0 
1871 : a5 1c __ LDA ACCU + 1 
1873 : 65 04 __ ADC WORK + 1 
1875 : 85 1c __ STA ACCU + 1 
1877 : a5 1d __ LDA ACCU + 2 
1879 : 65 05 __ ADC WORK + 2 
187b : 85 1d __ STA ACCU + 2 
187d : 90 08 __ BCC $1887 ; (faddsub + 135)
187f : 66 1d __ ROR ACCU + 2 
1881 : 66 1c __ ROR ACCU + 1 
1883 : 66 1b __ ROR ACCU + 0 
1885 : e6 07 __ INC WORK + 4 
1887 : a5 07 __ LDA WORK + 4 
1889 : c9 ff __ CMP #$ff
188b : f0 83 __ BEQ $1810 ; (faddsub + 16)
188d : 4a __ __ LSR
188e : 05 1e __ ORA ACCU + 3 
1890 : 85 1e __ STA ACCU + 3 
1892 : b0 06 __ BCS $189a ; (faddsub + 154)
1894 : a5 1d __ LDA ACCU + 2 
1896 : 29 7f __ AND #$7f
1898 : 85 1d __ STA ACCU + 2 
189a : 60 __ __ RTS
189b : 38 __ __ SEC
189c : a5 1b __ LDA ACCU + 0 
189e : e5 03 __ SBC WORK + 0 
18a0 : 85 1b __ STA ACCU + 0 
18a2 : a5 1c __ LDA ACCU + 1 
18a4 : e5 04 __ SBC WORK + 1 
18a6 : 85 1c __ STA ACCU + 1 
18a8 : a5 1d __ LDA ACCU + 2 
18aa : e5 05 __ SBC WORK + 2 
18ac : 85 1d __ STA ACCU + 2 
18ae : b0 19 __ BCS $18c9 ; (faddsub + 201)
18b0 : 38 __ __ SEC
18b1 : a9 00 __ LDA #$00
18b3 : e5 1b __ SBC ACCU + 0 
18b5 : 85 1b __ STA ACCU + 0 
18b7 : a9 00 __ LDA #$00
18b9 : e5 1c __ SBC ACCU + 1 
18bb : 85 1c __ STA ACCU + 1 
18bd : a9 00 __ LDA #$00
18bf : e5 1d __ SBC ACCU + 2 
18c1 : 85 1d __ STA ACCU + 2 
18c3 : a5 1e __ LDA ACCU + 3 
18c5 : 49 80 __ EOR #$80
18c7 : 85 1e __ STA ACCU + 3 
18c9 : a5 1d __ LDA ACCU + 2 
18cb : 30 ba __ BMI $1887 ; (faddsub + 135)
18cd : 05 1c __ ORA ACCU + 1 
18cf : 05 1b __ ORA ACCU + 0 
18d1 : f0 0f __ BEQ $18e2 ; (faddsub + 226)
18d3 : c6 07 __ DEC WORK + 4 
18d5 : f0 0b __ BEQ $18e2 ; (faddsub + 226)
18d7 : 06 1b __ ASL ACCU + 0 
18d9 : 26 1c __ ROL ACCU + 1 
18db : 26 1d __ ROL ACCU + 2 
18dd : 10 f4 __ BPL $18d3 ; (faddsub + 211)
18df : 4c 87 18 JMP $1887 ; (faddsub + 135)
18e2 : a9 00 __ LDA #$00
18e4 : 85 1b __ STA ACCU + 0 
18e6 : 85 1c __ STA ACCU + 1 
18e8 : 85 1d __ STA ACCU + 2 
18ea : 85 1e __ STA ACCU + 3 
18ec : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
18ed : a5 1b __ LDA ACCU + 0 
18ef : 05 1c __ ORA ACCU + 1 
18f1 : 05 1d __ ORA ACCU + 2 
18f3 : f0 0e __ BEQ $1903 ; (crt_fmul + 22)
18f5 : a5 03 __ LDA WORK + 0 
18f7 : 05 04 __ ORA WORK + 1 
18f9 : 05 05 __ ORA WORK + 2 
18fb : d0 09 __ BNE $1906 ; (crt_fmul + 25)
18fd : 85 1b __ STA ACCU + 0 
18ff : 85 1c __ STA ACCU + 1 
1901 : 85 1d __ STA ACCU + 2 
1903 : 85 1e __ STA ACCU + 3 
1905 : 60 __ __ RTS
1906 : a5 1e __ LDA ACCU + 3 
1908 : 45 06 __ EOR WORK + 3 
190a : 29 80 __ AND #$80
190c : 85 1e __ STA ACCU + 3 
190e : a9 ff __ LDA #$ff
1910 : c5 07 __ CMP WORK + 4 
1912 : f0 42 __ BEQ $1956 ; (crt_fmul + 105)
1914 : c5 08 __ CMP WORK + 5 
1916 : f0 3e __ BEQ $1956 ; (crt_fmul + 105)
1918 : a9 00 __ LDA #$00
191a : 85 09 __ STA WORK + 6 
191c : 85 0a __ STA WORK + 7 
191e : 85 0b __ STA WORK + 8 
1920 : a4 1b __ LDY ACCU + 0 
1922 : a5 03 __ LDA WORK + 0 
1924 : d0 06 __ BNE $192c ; (crt_fmul + 63)
1926 : a5 04 __ LDA WORK + 1 
1928 : f0 0a __ BEQ $1934 ; (crt_fmul + 71)
192a : d0 05 __ BNE $1931 ; (crt_fmul + 68)
192c : 20 87 19 JSR $1987 ; (crt_fmul8 + 0)
192f : a5 04 __ LDA WORK + 1 
1931 : 20 87 19 JSR $1987 ; (crt_fmul8 + 0)
1934 : a5 05 __ LDA WORK + 2 
1936 : 20 87 19 JSR $1987 ; (crt_fmul8 + 0)
1939 : 38 __ __ SEC
193a : a5 0b __ LDA WORK + 8 
193c : 30 06 __ BMI $1944 ; (crt_fmul + 87)
193e : 06 09 __ ASL WORK + 6 
1940 : 26 0a __ ROL WORK + 7 
1942 : 2a __ __ ROL
1943 : 18 __ __ CLC
1944 : 29 7f __ AND #$7f
1946 : 85 0b __ STA WORK + 8 
1948 : a5 07 __ LDA WORK + 4 
194a : 65 08 __ ADC WORK + 5 
194c : 90 19 __ BCC $1967 ; (crt_fmul + 122)
194e : e9 7f __ SBC #$7f
1950 : b0 04 __ BCS $1956 ; (crt_fmul + 105)
1952 : c9 ff __ CMP #$ff
1954 : d0 15 __ BNE $196b ; (crt_fmul + 126)
1956 : a5 1e __ LDA ACCU + 3 
1958 : 09 7f __ ORA #$7f
195a : 85 1e __ STA ACCU + 3 
195c : a9 80 __ LDA #$80
195e : 85 1d __ STA ACCU + 2 
1960 : a9 00 __ LDA #$00
1962 : 85 1b __ STA ACCU + 0 
1964 : 85 1c __ STA ACCU + 1 
1966 : 60 __ __ RTS
1967 : e9 7e __ SBC #$7e
1969 : 90 15 __ BCC $1980 ; (crt_fmul + 147)
196b : 4a __ __ LSR
196c : 05 1e __ ORA ACCU + 3 
196e : 85 1e __ STA ACCU + 3 
1970 : a9 00 __ LDA #$00
1972 : 6a __ __ ROR
1973 : 05 0b __ ORA WORK + 8 
1975 : 85 1d __ STA ACCU + 2 
1977 : a5 0a __ LDA WORK + 7 
1979 : 85 1c __ STA ACCU + 1 
197b : a5 09 __ LDA WORK + 6 
197d : 85 1b __ STA ACCU + 0 
197f : 60 __ __ RTS
1980 : a9 00 __ LDA #$00
1982 : 85 1e __ STA ACCU + 3 
1984 : f0 d8 __ BEQ $195e ; (crt_fmul + 113)
1986 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1987 : 38 __ __ SEC
1988 : 6a __ __ ROR
1989 : 90 1e __ BCC $19a9 ; (crt_fmul8 + 34)
198b : aa __ __ TAX
198c : 18 __ __ CLC
198d : 98 __ __ TYA
198e : 65 09 __ ADC WORK + 6 
1990 : 85 09 __ STA WORK + 6 
1992 : a5 0a __ LDA WORK + 7 
1994 : 65 1c __ ADC ACCU + 1 
1996 : 85 0a __ STA WORK + 7 
1998 : a5 0b __ LDA WORK + 8 
199a : 65 1d __ ADC ACCU + 2 
199c : 6a __ __ ROR
199d : 85 0b __ STA WORK + 8 
199f : 8a __ __ TXA
19a0 : 66 0a __ ROR WORK + 7 
19a2 : 66 09 __ ROR WORK + 6 
19a4 : 4a __ __ LSR
19a5 : f0 0d __ BEQ $19b4 ; (crt_fmul8 + 45)
19a7 : b0 e2 __ BCS $198b ; (crt_fmul8 + 4)
19a9 : 66 0b __ ROR WORK + 8 
19ab : 66 0a __ ROR WORK + 7 
19ad : 66 09 __ ROR WORK + 6 
19af : 4a __ __ LSR
19b0 : 90 f7 __ BCC $19a9 ; (crt_fmul8 + 34)
19b2 : d0 d7 __ BNE $198b ; (crt_fmul8 + 4)
19b4 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
19b5 : a5 1b __ LDA ACCU + 0 
19b7 : 05 1c __ ORA ACCU + 1 
19b9 : 05 1d __ ORA ACCU + 2 
19bb : d0 03 __ BNE $19c0 ; (crt_fdiv + 11)
19bd : 85 1e __ STA ACCU + 3 
19bf : 60 __ __ RTS
19c0 : a5 1e __ LDA ACCU + 3 
19c2 : 45 06 __ EOR WORK + 3 
19c4 : 29 80 __ AND #$80
19c6 : 85 1e __ STA ACCU + 3 
19c8 : a5 08 __ LDA WORK + 5 
19ca : f0 62 __ BEQ $1a2e ; (crt_fdiv + 121)
19cc : a5 07 __ LDA WORK + 4 
19ce : c9 ff __ CMP #$ff
19d0 : f0 5c __ BEQ $1a2e ; (crt_fdiv + 121)
19d2 : a9 00 __ LDA #$00
19d4 : 85 09 __ STA WORK + 6 
19d6 : 85 0a __ STA WORK + 7 
19d8 : 85 0b __ STA WORK + 8 
19da : a2 18 __ LDX #$18
19dc : a5 1b __ LDA ACCU + 0 
19de : c5 03 __ CMP WORK + 0 
19e0 : a5 1c __ LDA ACCU + 1 
19e2 : e5 04 __ SBC WORK + 1 
19e4 : a5 1d __ LDA ACCU + 2 
19e6 : e5 05 __ SBC WORK + 2 
19e8 : 90 13 __ BCC $19fd ; (crt_fdiv + 72)
19ea : a5 1b __ LDA ACCU + 0 
19ec : e5 03 __ SBC WORK + 0 
19ee : 85 1b __ STA ACCU + 0 
19f0 : a5 1c __ LDA ACCU + 1 
19f2 : e5 04 __ SBC WORK + 1 
19f4 : 85 1c __ STA ACCU + 1 
19f6 : a5 1d __ LDA ACCU + 2 
19f8 : e5 05 __ SBC WORK + 2 
19fa : 85 1d __ STA ACCU + 2 
19fc : 38 __ __ SEC
19fd : 26 09 __ ROL WORK + 6 
19ff : 26 0a __ ROL WORK + 7 
1a01 : 26 0b __ ROL WORK + 8 
1a03 : ca __ __ DEX
1a04 : f0 0a __ BEQ $1a10 ; (crt_fdiv + 91)
1a06 : 06 1b __ ASL ACCU + 0 
1a08 : 26 1c __ ROL ACCU + 1 
1a0a : 26 1d __ ROL ACCU + 2 
1a0c : b0 dc __ BCS $19ea ; (crt_fdiv + 53)
1a0e : 90 cc __ BCC $19dc ; (crt_fdiv + 39)
1a10 : 38 __ __ SEC
1a11 : a5 0b __ LDA WORK + 8 
1a13 : 30 06 __ BMI $1a1b ; (crt_fdiv + 102)
1a15 : 06 09 __ ASL WORK + 6 
1a17 : 26 0a __ ROL WORK + 7 
1a19 : 2a __ __ ROL
1a1a : 18 __ __ CLC
1a1b : 29 7f __ AND #$7f
1a1d : 85 0b __ STA WORK + 8 
1a1f : a5 07 __ LDA WORK + 4 
1a21 : e5 08 __ SBC WORK + 5 
1a23 : 90 1a __ BCC $1a3f ; (crt_fdiv + 138)
1a25 : 18 __ __ CLC
1a26 : 69 7f __ ADC #$7f
1a28 : b0 04 __ BCS $1a2e ; (crt_fdiv + 121)
1a2a : c9 ff __ CMP #$ff
1a2c : d0 15 __ BNE $1a43 ; (crt_fdiv + 142)
1a2e : a5 1e __ LDA ACCU + 3 
1a30 : 09 7f __ ORA #$7f
1a32 : 85 1e __ STA ACCU + 3 
1a34 : a9 80 __ LDA #$80
1a36 : 85 1d __ STA ACCU + 2 
1a38 : a9 00 __ LDA #$00
1a3a : 85 1c __ STA ACCU + 1 
1a3c : 85 1b __ STA ACCU + 0 
1a3e : 60 __ __ RTS
1a3f : 69 7f __ ADC #$7f
1a41 : 90 15 __ BCC $1a58 ; (crt_fdiv + 163)
1a43 : 4a __ __ LSR
1a44 : 05 1e __ ORA ACCU + 3 
1a46 : 85 1e __ STA ACCU + 3 
1a48 : a9 00 __ LDA #$00
1a4a : 6a __ __ ROR
1a4b : 05 0b __ ORA WORK + 8 
1a4d : 85 1d __ STA ACCU + 2 
1a4f : a5 0a __ LDA WORK + 7 
1a51 : 85 1c __ STA ACCU + 1 
1a53 : a5 09 __ LDA WORK + 6 
1a55 : 85 1b __ STA ACCU + 0 
1a57 : 60 __ __ RTS
1a58 : a9 00 __ LDA #$00
1a5a : 85 1e __ STA ACCU + 3 
1a5c : 85 1d __ STA ACCU + 2 
1a5e : 85 1c __ STA ACCU + 1 
1a60 : 85 1b __ STA ACCU + 0 
1a62 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1a63 : 24 1c __ BIT ACCU + 1 
1a65 : 10 0d __ BPL $1a74 ; (divs16 + 17)
1a67 : 20 81 1a JSR $1a81 ; (negaccu + 0)
1a6a : 24 04 __ BIT WORK + 1 
1a6c : 10 0d __ BPL $1a7b ; (divs16 + 24)
1a6e : 20 8f 1a JSR $1a8f ; (negtmp + 0)
1a71 : 4c 9d 1a JMP $1a9d ; (divmod + 0)
1a74 : 24 04 __ BIT WORK + 1 
1a76 : 10 f9 __ BPL $1a71 ; (divs16 + 14)
1a78 : 20 8f 1a JSR $1a8f ; (negtmp + 0)
1a7b : 20 9d 1a JSR $1a9d ; (divmod + 0)
1a7e : 4c 81 1a JMP $1a81 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1a81 : 38 __ __ SEC
1a82 : a9 00 __ LDA #$00
1a84 : e5 1b __ SBC ACCU + 0 
1a86 : 85 1b __ STA ACCU + 0 
1a88 : a9 00 __ LDA #$00
1a8a : e5 1c __ SBC ACCU + 1 
1a8c : 85 1c __ STA ACCU + 1 
1a8e : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1a8f : 38 __ __ SEC
1a90 : a9 00 __ LDA #$00
1a92 : e5 03 __ SBC WORK + 0 
1a94 : 85 03 __ STA WORK + 0 
1a96 : a9 00 __ LDA #$00
1a98 : e5 04 __ SBC WORK + 1 
1a9a : 85 04 __ STA WORK + 1 
1a9c : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1a9d : a5 1c __ LDA ACCU + 1 
1a9f : d0 31 __ BNE $1ad2 ; (divmod + 53)
1aa1 : a5 04 __ LDA WORK + 1 
1aa3 : d0 1e __ BNE $1ac3 ; (divmod + 38)
1aa5 : 85 06 __ STA WORK + 3 
1aa7 : a2 04 __ LDX #$04
1aa9 : 06 1b __ ASL ACCU + 0 
1aab : 2a __ __ ROL
1aac : c5 03 __ CMP WORK + 0 
1aae : 90 02 __ BCC $1ab2 ; (divmod + 21)
1ab0 : e5 03 __ SBC WORK + 0 
1ab2 : 26 1b __ ROL ACCU + 0 
1ab4 : 2a __ __ ROL
1ab5 : c5 03 __ CMP WORK + 0 
1ab7 : 90 02 __ BCC $1abb ; (divmod + 30)
1ab9 : e5 03 __ SBC WORK + 0 
1abb : 26 1b __ ROL ACCU + 0 
1abd : ca __ __ DEX
1abe : d0 eb __ BNE $1aab ; (divmod + 14)
1ac0 : 85 05 __ STA WORK + 2 
1ac2 : 60 __ __ RTS
1ac3 : a5 1b __ LDA ACCU + 0 
1ac5 : 85 05 __ STA WORK + 2 
1ac7 : a5 1c __ LDA ACCU + 1 
1ac9 : 85 06 __ STA WORK + 3 
1acb : a9 00 __ LDA #$00
1acd : 85 1b __ STA ACCU + 0 
1acf : 85 1c __ STA ACCU + 1 
1ad1 : 60 __ __ RTS
1ad2 : a5 04 __ LDA WORK + 1 
1ad4 : d0 1f __ BNE $1af5 ; (divmod + 88)
1ad6 : a5 03 __ LDA WORK + 0 
1ad8 : 30 1b __ BMI $1af5 ; (divmod + 88)
1ada : a9 00 __ LDA #$00
1adc : 85 06 __ STA WORK + 3 
1ade : a2 10 __ LDX #$10
1ae0 : 06 1b __ ASL ACCU + 0 
1ae2 : 26 1c __ ROL ACCU + 1 
1ae4 : 2a __ __ ROL
1ae5 : c5 03 __ CMP WORK + 0 
1ae7 : 90 02 __ BCC $1aeb ; (divmod + 78)
1ae9 : e5 03 __ SBC WORK + 0 
1aeb : 26 1b __ ROL ACCU + 0 
1aed : 26 1c __ ROL ACCU + 1 
1aef : ca __ __ DEX
1af0 : d0 f2 __ BNE $1ae4 ; (divmod + 71)
1af2 : 85 05 __ STA WORK + 2 
1af4 : 60 __ __ RTS
1af5 : a9 00 __ LDA #$00
1af7 : 85 05 __ STA WORK + 2 
1af9 : 85 06 __ STA WORK + 3 
1afb : 84 02 __ STY $02 
1afd : a0 10 __ LDY #$10
1aff : 18 __ __ CLC
1b00 : 26 1b __ ROL ACCU + 0 
1b02 : 26 1c __ ROL ACCU + 1 
1b04 : 26 05 __ ROL WORK + 2 
1b06 : 26 06 __ ROL WORK + 3 
1b08 : 38 __ __ SEC
1b09 : a5 05 __ LDA WORK + 2 
1b0b : e5 03 __ SBC WORK + 0 
1b0d : aa __ __ TAX
1b0e : a5 06 __ LDA WORK + 3 
1b10 : e5 04 __ SBC WORK + 1 
1b12 : 90 04 __ BCC $1b18 ; (divmod + 123)
1b14 : 86 05 __ STX WORK + 2 
1b16 : 85 06 __ STA WORK + 3 
1b18 : 88 __ __ DEY
1b19 : d0 e5 __ BNE $1b00 ; (divmod + 99)
1b1b : 26 1b __ ROL ACCU + 0 
1b1d : 26 1c __ ROL ACCU + 1 
1b1f : a4 02 __ LDY $02 
1b21 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
1b22 : 24 1c __ BIT ACCU + 1 
1b24 : 10 10 __ BPL $1b36 ; (mods16 + 20)
1b26 : 20 81 1a JSR $1a81 ; (negaccu + 0)
1b29 : 24 04 __ BIT WORK + 1 
1b2b : 10 03 __ BPL $1b30 ; (mods16 + 14)
1b2d : 20 8f 1a JSR $1a8f ; (negtmp + 0)
1b30 : 20 9d 1a JSR $1a9d ; (divmod + 0)
1b33 : 4c 41 1b JMP $1b41 ; (negtmpb + 0)
1b36 : 24 04 __ BIT WORK + 1 
1b38 : 10 03 __ BPL $1b3d ; (mods16 + 27)
1b3a : 20 8f 1a JSR $1a8f ; (negtmp + 0)
1b3d : 4c 9d 1a JMP $1a9d ; (divmod + 0)
1b40 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
1b41 : 38 __ __ SEC
1b42 : a9 00 __ LDA #$00
1b44 : e5 05 __ SBC WORK + 2 
1b46 : 85 05 __ STA WORK + 2 
1b48 : a9 00 __ LDA #$00
1b4a : e5 06 __ SBC WORK + 3 
1b4c : 85 06 __ STA WORK + 3 
1b4e : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1b4f : 20 df 17 JSR $17df ; (freg + 36)
1b52 : a5 07 __ LDA WORK + 4 
1b54 : c9 7f __ CMP #$7f
1b56 : b0 07 __ BCS $1b5f ; (f32_to_i16 + 16)
1b58 : a9 00 __ LDA #$00
1b5a : 85 1b __ STA ACCU + 0 
1b5c : 85 1c __ STA ACCU + 1 
1b5e : 60 __ __ RTS
1b5f : e9 8e __ SBC #$8e
1b61 : 90 16 __ BCC $1b79 ; (f32_to_i16 + 42)
1b63 : 24 1e __ BIT ACCU + 3 
1b65 : 30 09 __ BMI $1b70 ; (f32_to_i16 + 33)
1b67 : a9 ff __ LDA #$ff
1b69 : 85 1b __ STA ACCU + 0 
1b6b : a9 7f __ LDA #$7f
1b6d : 85 1c __ STA ACCU + 1 
1b6f : 60 __ __ RTS
1b70 : a9 00 __ LDA #$00
1b72 : 85 1b __ STA ACCU + 0 
1b74 : a9 80 __ LDA #$80
1b76 : 85 1c __ STA ACCU + 1 
1b78 : 60 __ __ RTS
1b79 : aa __ __ TAX
1b7a : a5 1c __ LDA ACCU + 1 
1b7c : 46 1d __ LSR ACCU + 2 
1b7e : 6a __ __ ROR
1b7f : e8 __ __ INX
1b80 : d0 fa __ BNE $1b7c ; (f32_to_i16 + 45)
1b82 : 24 1e __ BIT ACCU + 3 
1b84 : 10 0e __ BPL $1b94 ; (f32_to_i16 + 69)
1b86 : 38 __ __ SEC
1b87 : 49 ff __ EOR #$ff
1b89 : 69 00 __ ADC #$00
1b8b : 85 1b __ STA ACCU + 0 
1b8d : a9 00 __ LDA #$00
1b8f : e5 1d __ SBC ACCU + 2 
1b91 : 85 1c __ STA ACCU + 1 
1b93 : 60 __ __ RTS
1b94 : 85 1b __ STA ACCU + 0 
1b96 : a5 1d __ LDA ACCU + 2 
1b98 : 85 1c __ STA ACCU + 1 
1b9a : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1b9b : 24 1c __ BIT ACCU + 1 
1b9d : 30 03 __ BMI $1ba2 ; (sint16_to_float + 7)
1b9f : 4c b9 1b JMP $1bb9 ; (uint16_to_float + 0)
1ba2 : 38 __ __ SEC
1ba3 : a9 00 __ LDA #$00
1ba5 : e5 1b __ SBC ACCU + 0 
1ba7 : 85 1b __ STA ACCU + 0 
1ba9 : a9 00 __ LDA #$00
1bab : e5 1c __ SBC ACCU + 1 
1bad : 85 1c __ STA ACCU + 1 
1baf : 20 b9 1b JSR $1bb9 ; (uint16_to_float + 0)
1bb2 : a5 1e __ LDA ACCU + 3 
1bb4 : 09 80 __ ORA #$80
1bb6 : 85 1e __ STA ACCU + 3 
1bb8 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1bb9 : a5 1b __ LDA ACCU + 0 
1bbb : 05 1c __ ORA ACCU + 1 
1bbd : d0 05 __ BNE $1bc4 ; (uint16_to_float + 11)
1bbf : 85 1d __ STA ACCU + 2 
1bc1 : 85 1e __ STA ACCU + 3 
1bc3 : 60 __ __ RTS
1bc4 : a2 8e __ LDX #$8e
1bc6 : a5 1c __ LDA ACCU + 1 
1bc8 : 30 06 __ BMI $1bd0 ; (uint16_to_float + 23)
1bca : ca __ __ DEX
1bcb : 06 1b __ ASL ACCU + 0 
1bcd : 2a __ __ ROL
1bce : 10 fa __ BPL $1bca ; (uint16_to_float + 17)
1bd0 : 0a __ __ ASL
1bd1 : 85 1d __ STA ACCU + 2 
1bd3 : a5 1b __ LDA ACCU + 0 
1bd5 : 85 1c __ STA ACCU + 1 
1bd7 : 8a __ __ TXA
1bd8 : 4a __ __ LSR
1bd9 : 85 1e __ STA ACCU + 3 
1bdb : a9 00 __ LDA #$00
1bdd : 85 1b __ STA ACCU + 0 
1bdf : 66 1d __ ROR ACCU + 2 
1be1 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1be2 : 84 02 __ STY $02 
1be4 : a0 20 __ LDY #$20
1be6 : a9 00 __ LDA #$00
1be8 : 85 07 __ STA WORK + 4 
1bea : 85 08 __ STA WORK + 5 
1bec : 85 09 __ STA WORK + 6 
1bee : 85 0a __ STA WORK + 7 
1bf0 : a5 05 __ LDA WORK + 2 
1bf2 : 05 06 __ ORA WORK + 3 
1bf4 : d0 78 __ BNE $1c6e ; (divmod32 + 140)
1bf6 : a5 04 __ LDA WORK + 1 
1bf8 : d0 27 __ BNE $1c21 ; (divmod32 + 63)
1bfa : 18 __ __ CLC
1bfb : 26 1b __ ROL ACCU + 0 
1bfd : 26 1c __ ROL ACCU + 1 
1bff : 26 1d __ ROL ACCU + 2 
1c01 : 26 1e __ ROL ACCU + 3 
1c03 : 2a __ __ ROL
1c04 : 90 05 __ BCC $1c0b ; (divmod32 + 41)
1c06 : e5 03 __ SBC WORK + 0 
1c08 : 38 __ __ SEC
1c09 : b0 06 __ BCS $1c11 ; (divmod32 + 47)
1c0b : c5 03 __ CMP WORK + 0 
1c0d : 90 02 __ BCC $1c11 ; (divmod32 + 47)
1c0f : e5 03 __ SBC WORK + 0 
1c11 : 88 __ __ DEY
1c12 : d0 e7 __ BNE $1bfb ; (divmod32 + 25)
1c14 : 85 07 __ STA WORK + 4 
1c16 : 26 1b __ ROL ACCU + 0 
1c18 : 26 1c __ ROL ACCU + 1 
1c1a : 26 1d __ ROL ACCU + 2 
1c1c : 26 1e __ ROL ACCU + 3 
1c1e : a4 02 __ LDY $02 
1c20 : 60 __ __ RTS
1c21 : a5 1e __ LDA ACCU + 3 
1c23 : d0 10 __ BNE $1c35 ; (divmod32 + 83)
1c25 : a6 1d __ LDX ACCU + 2 
1c27 : 86 1e __ STX ACCU + 3 
1c29 : a6 1c __ LDX ACCU + 1 
1c2b : 86 1d __ STX ACCU + 2 
1c2d : a6 1b __ LDX ACCU + 0 
1c2f : 86 1c __ STX ACCU + 1 
1c31 : 85 1b __ STA ACCU + 0 
1c33 : a0 18 __ LDY #$18
1c35 : 18 __ __ CLC
1c36 : 26 1b __ ROL ACCU + 0 
1c38 : 26 1c __ ROL ACCU + 1 
1c3a : 26 1d __ ROL ACCU + 2 
1c3c : 26 1e __ ROL ACCU + 3 
1c3e : 26 07 __ ROL WORK + 4 
1c40 : 26 08 __ ROL WORK + 5 
1c42 : 90 0c __ BCC $1c50 ; (divmod32 + 110)
1c44 : a5 07 __ LDA WORK + 4 
1c46 : e5 03 __ SBC WORK + 0 
1c48 : aa __ __ TAX
1c49 : a5 08 __ LDA WORK + 5 
1c4b : e5 04 __ SBC WORK + 1 
1c4d : 38 __ __ SEC
1c4e : b0 0c __ BCS $1c5c ; (divmod32 + 122)
1c50 : 38 __ __ SEC
1c51 : a5 07 __ LDA WORK + 4 
1c53 : e5 03 __ SBC WORK + 0 
1c55 : aa __ __ TAX
1c56 : a5 08 __ LDA WORK + 5 
1c58 : e5 04 __ SBC WORK + 1 
1c5a : 90 04 __ BCC $1c60 ; (divmod32 + 126)
1c5c : 86 07 __ STX WORK + 4 
1c5e : 85 08 __ STA WORK + 5 
1c60 : 88 __ __ DEY
1c61 : d0 d3 __ BNE $1c36 ; (divmod32 + 84)
1c63 : 26 1b __ ROL ACCU + 0 
1c65 : 26 1c __ ROL ACCU + 1 
1c67 : 26 1d __ ROL ACCU + 2 
1c69 : 26 1e __ ROL ACCU + 3 
1c6b : a4 02 __ LDY $02 
1c6d : 60 __ __ RTS
1c6e : a0 10 __ LDY #$10
1c70 : a5 1e __ LDA ACCU + 3 
1c72 : 85 08 __ STA WORK + 5 
1c74 : a5 1d __ LDA ACCU + 2 
1c76 : 85 07 __ STA WORK + 4 
1c78 : a9 00 __ LDA #$00
1c7a : 85 1d __ STA ACCU + 2 
1c7c : 85 1e __ STA ACCU + 3 
1c7e : 18 __ __ CLC
1c7f : 26 1b __ ROL ACCU + 0 
1c81 : 26 1c __ ROL ACCU + 1 
1c83 : 26 07 __ ROL WORK + 4 
1c85 : 26 08 __ ROL WORK + 5 
1c87 : 26 09 __ ROL WORK + 6 
1c89 : 26 0a __ ROL WORK + 7 
1c8b : a5 07 __ LDA WORK + 4 
1c8d : c5 03 __ CMP WORK + 0 
1c8f : a5 08 __ LDA WORK + 5 
1c91 : e5 04 __ SBC WORK + 1 
1c93 : a5 09 __ LDA WORK + 6 
1c95 : e5 05 __ SBC WORK + 2 
1c97 : aa __ __ TAX
1c98 : a5 0a __ LDA WORK + 7 
1c9a : e5 06 __ SBC WORK + 3 
1c9c : 90 11 __ BCC $1caf ; (divmod32 + 205)
1c9e : 86 09 __ STX WORK + 6 
1ca0 : 85 0a __ STA WORK + 7 
1ca2 : a5 07 __ LDA WORK + 4 
1ca4 : e5 03 __ SBC WORK + 0 
1ca6 : 85 07 __ STA WORK + 4 
1ca8 : a5 08 __ LDA WORK + 5 
1caa : e5 04 __ SBC WORK + 1 
1cac : 85 08 __ STA WORK + 5 
1cae : 38 __ __ SEC
1caf : 88 __ __ DEY
1cb0 : d0 cd __ BNE $1c7f ; (divmod32 + 157)
1cb2 : 26 1b __ ROL ACCU + 0 
1cb4 : 26 1c __ ROL ACCU + 1 
1cb6 : a4 02 __ LDY $02 
1cb8 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1cb9 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1cba : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1cbb : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1ccb : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
seed:
1cd7 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
uii_target:
1cd9 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
statusreg:
1cda : __ __ __ BYT 1c df                                           : ..
--------------------------------------------------------------------
cmddatareg:
1cdc : __ __ __ BYT 1d df                                           : ..
--------------------------------------------------------------------
controlreg:
1cde : __ __ __ BYT 1c df                                           : ..
--------------------------------------------------------------------
respdatareg:
1ce0 : __ __ __ BYT 1e df                                           : ..
--------------------------------------------------------------------
statusdatareg:
1ce2 : __ __ __ BYT 1f df                                           : ..
--------------------------------------------------------------------
uii_data:
1ce4 : __ __ __ BSS	1792
--------------------------------------------------------------------
uii_status:
2400 : __ __ __ BSS	256
