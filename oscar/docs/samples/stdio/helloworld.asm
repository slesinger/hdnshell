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
080e : 8e 5b 1a STX $1a5b ; (spentry + 0)
0811 : a2 1a __ LDX #$1a
0813 : a0 79 __ LDY #$79
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
082a : c0 79 __ CPY #$79
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
;   3, "/home/honza/projects/c64/oscar64/samples/stdio/helloworld.c"
.s4:
0880 : a9 0e __ LDA #$0e
0882 : 20 99 08 JSR $0899 ; (putpch.s4 + 0)
0885 : a9 50 __ LDA #$50
0887 : 8d fc 9f STA $9ffc ; (sstack + 8)
088a : a9 15 __ LDA #$15
088c : 8d fd 9f STA $9ffd ; (sstack + 9)
088f : 20 fc 08 JSR $08fc ; (printf.s4 + 0)
0892 : a9 00 __ LDA #$00
0894 : 85 1b __ STA ACCU + 0 
0896 : 85 1c __ STA ACCU + 1 
.s3:
0898 : 60 __ __ RTS
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/oscar64/include/conio.h"
.s4:
0899 : 85 0d __ STA P0 ; (c + 0)
089b : ad 5c 1a LDA $1a5c ; (giocharmap + 0)
089e : f0 32 __ BEQ $08d2 ; (putpch.s5 + 0)
.s6:
08a0 : a5 0d __ LDA P0 ; (c + 0)
08a2 : c9 0a __ CMP #$0a
08a4 : d0 04 __ BNE $08aa ; (putpch.s7 + 0)
.s18:
08a6 : a9 0d __ LDA #$0d
08a8 : d0 32 __ BNE $08dc ; (putpch.s15 + 0)
.s7:
08aa : c9 09 __ CMP #$09
08ac : f0 36 __ BEQ $08e4 ; (putpch.s16 + 0)
.s8:
08ae : ad 5c 1a LDA $1a5c ; (giocharmap + 0)
08b1 : c9 02 __ CMP #$02
08b3 : 90 1d __ BCC $08d2 ; (putpch.s5 + 0)
.s9:
08b5 : a5 0d __ LDA P0 ; (c + 0)
08b7 : c9 41 __ CMP #$41
08b9 : 90 17 __ BCC $08d2 ; (putpch.s5 + 0)
.s10:
08bb : c9 7b __ CMP #$7b
08bd : b0 13 __ BCS $08d2 ; (putpch.s5 + 0)
.s11:
08bf : c9 61 __ CMP #$61
08c1 : b0 04 __ BCS $08c7 ; (putpch.s13 + 0)
.s12:
08c3 : c9 5b __ CMP #$5b
08c5 : b0 0b __ BCS $08d2 ; (putpch.s5 + 0)
.s13:
08c7 : 49 20 __ EOR #$20
08c9 : 85 0d __ STA P0 ; (c + 0)
08cb : ad 5c 1a LDA $1a5c ; (giocharmap + 0)
08ce : c9 02 __ CMP #$02
08d0 : f0 06 __ BEQ $08d8 ; (putpch.s14 + 0)
.s5:
08d2 : a5 0d __ LDA P0 ; (c + 0)
08d4 : 20 d2 ff JSR $ffd2 
.s3:
08d7 : 60 __ __ RTS
.s14:
08d8 : a5 0d __ LDA P0 ; (c + 0)
08da : 29 5f __ AND #$5f
.s15:
08dc : 85 43 __ STA T0 + 0 
08de : a5 43 __ LDA T0 + 0 
08e0 : 20 d2 ff JSR $ffd2 
08e3 : 60 __ __ RTS
.s16:
08e4 : a5 d3 __ LDA $d3 
08e6 : 29 03 __ AND #$03
08e8 : 85 43 __ STA T0 + 0 
08ea : a9 20 __ LDA #$20
08ec : 85 44 __ STA T1 + 0 
.l17:
08ee : a5 44 __ LDA T1 + 0 
08f0 : 20 d2 ff JSR $ffd2 
08f3 : e6 43 __ INC T0 + 0 
08f5 : a5 43 __ LDA T0 + 0 
08f7 : c9 04 __ CMP #$04
08f9 : 90 f3 __ BCC $08ee ; (putpch.l17 + 0)
08fb : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/oscar64/include/stdio.h"
.s4:
08fc : a9 01 __ LDA #$01
08fe : 8d fb 9f STA $9ffb ; (sstack + 7)
0901 : a9 a0 __ LDA #$a0
0903 : 8d f5 9f STA $9ff5 ; (sstack + 1)
0906 : a9 9f __ LDA #$9f
0908 : 8d f6 9f STA $9ff6 ; (sstack + 2)
090b : ad fc 9f LDA $9ffc ; (sstack + 8)
090e : 8d f7 9f STA $9ff7 ; (sstack + 3)
0911 : ad fd 9f LDA $9ffd ; (sstack + 9)
0914 : 8d f8 9f STA $9ff8 ; (sstack + 4)
0917 : a9 fe __ LDA #$fe
0919 : 8d f9 9f STA $9ff9 ; (sstack + 5)
091c : a9 9f __ LDA #$9f
091e : 8d fa 9f STA $9ffa ; (sstack + 6)
0921 : 4c 24 09 JMP $0924 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/oscar64/include/stdio.c"
.s1:
0924 : a2 09 __ LDX #$09
0926 : b5 53 __ LDA T1 + 0,x 
0928 : 9d d2 9f STA $9fd2,x ; (sformat@stack + 0)
092b : ca __ __ DEX
092c : 10 f8 __ BPL $0926 ; (sformat.s1 + 2)
.s4:
092e : ad f7 9f LDA $9ff7 ; (sstack + 3)
0931 : 85 55 __ STA T3 + 0 
0933 : a9 00 __ LDA #$00
0935 : 85 5b __ STA T6 + 0 
0937 : ad f8 9f LDA $9ff8 ; (sstack + 4)
093a : 85 56 __ STA T3 + 1 
093c : ad f5 9f LDA $9ff5 ; (sstack + 1)
093f : 85 57 __ STA T4 + 0 
0941 : ad f6 9f LDA $9ff6 ; (sstack + 2)
0944 : 85 58 __ STA T4 + 1 
.l5:
0946 : a0 00 __ LDY #$00
0948 : b1 55 __ LDA (T3 + 0),y 
094a : d0 36 __ BNE $0982 ; (sformat.s10 + 0)
.s6:
094c : a4 5b __ LDY T6 + 0 
094e : 91 57 __ STA (T4 + 0),y 
0950 : 98 __ __ TYA
0951 : f0 28 __ BEQ $097b ; (sformat.s95 + 0)
.s7:
0953 : ad fb 9f LDA $9ffb ; (sstack + 7)
0956 : d0 18 __ BNE $0970 ; (sformat.s9 + 0)
.s8:
0958 : 98 __ __ TYA
0959 : 18 __ __ CLC
095a : 65 57 __ ADC T4 + 0 
095c : aa __ __ TAX
095d : a5 58 __ LDA T4 + 1 
095f : 69 00 __ ADC #$00
.s3:
0961 : 86 1b __ STX ACCU + 0 ; (buff + 1)
0963 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0965 : a2 09 __ LDX #$09
0967 : bd d2 9f LDA $9fd2,x ; (sformat@stack + 0)
096a : 95 53 __ STA T1 + 0,x 
096c : ca __ __ DEX
096d : 10 f8 __ BPL $0967 ; (sformat.s3 + 6)
096f : 60 __ __ RTS
.s9:
0970 : a5 57 __ LDA T4 + 0 
0972 : 85 0e __ STA P1 
0974 : a5 58 __ LDA T4 + 1 
0976 : 85 0f __ STA P2 
0978 : 20 65 0d JSR $0d65 ; (puts.l4 + 0)
.s95:
097b : a5 58 __ LDA T4 + 1 
097d : a6 57 __ LDX T4 + 0 
097f : 4c 61 09 JMP $0961 ; (sformat.s3 + 0)
.s10:
0982 : c9 25 __ CMP #$25
0984 : f0 3e __ BEQ $09c4 ; (sformat.s15 + 0)
.s11:
0986 : a4 5b __ LDY T6 + 0 
0988 : 91 57 __ STA (T4 + 0),y 
098a : e6 55 __ INC T3 + 0 
098c : d0 02 __ BNE $0990 ; (sformat.s117 + 0)
.s116:
098e : e6 56 __ INC T3 + 1 
.s117:
0990 : c8 __ __ INY
0991 : 84 5b __ STY T6 + 0 
0993 : 98 __ __ TYA
0994 : c0 28 __ CPY #$28
0996 : 90 ae __ BCC $0946 ; (sformat.l5 + 0)
.s12:
0998 : 85 43 __ STA T0 + 0 
099a : a9 00 __ LDA #$00
099c : 85 5b __ STA T6 + 0 
099e : ad fb 9f LDA $9ffb ; (sstack + 7)
09a1 : f0 14 __ BEQ $09b7 ; (sformat.s13 + 0)
.s14:
09a3 : a5 57 __ LDA T4 + 0 
09a5 : 85 0e __ STA P1 
09a7 : a5 58 __ LDA T4 + 1 
09a9 : 85 0f __ STA P2 
09ab : a9 00 __ LDA #$00
09ad : a4 43 __ LDY T0 + 0 
09af : 91 0e __ STA (P1),y 
09b1 : 20 65 0d JSR $0d65 ; (puts.l4 + 0)
09b4 : 4c 46 09 JMP $0946 ; (sformat.l5 + 0)
.s13:
09b7 : 18 __ __ CLC
09b8 : a5 57 __ LDA T4 + 0 
09ba : 65 43 __ ADC T0 + 0 
09bc : 85 57 __ STA T4 + 0 
09be : 90 86 __ BCC $0946 ; (sformat.l5 + 0)
.s118:
09c0 : e6 58 __ INC T4 + 1 
09c2 : b0 82 __ BCS $0946 ; (sformat.l5 + 0)
.s15:
09c4 : a5 5b __ LDA T6 + 0 
09c6 : f0 27 __ BEQ $09ef ; (sformat.s16 + 0)
.s89:
09c8 : 84 5b __ STY T6 + 0 
09ca : 85 43 __ STA T0 + 0 
09cc : ad fb 9f LDA $9ffb ; (sstack + 7)
09cf : f0 13 __ BEQ $09e4 ; (sformat.s90 + 0)
.s91:
09d1 : a5 57 __ LDA T4 + 0 
09d3 : 85 0e __ STA P1 
09d5 : a5 58 __ LDA T4 + 1 
09d7 : 85 0f __ STA P2 
09d9 : 98 __ __ TYA
09da : a4 43 __ LDY T0 + 0 
09dc : 91 0e __ STA (P1),y 
09de : 20 65 0d JSR $0d65 ; (puts.l4 + 0)
09e1 : 4c ef 09 JMP $09ef ; (sformat.s16 + 0)
.s90:
09e4 : 18 __ __ CLC
09e5 : a5 57 __ LDA T4 + 0 
09e7 : 65 43 __ ADC T0 + 0 
09e9 : 85 57 __ STA T4 + 0 
09eb : 90 02 __ BCC $09ef ; (sformat.s16 + 0)
.s115:
09ed : e6 58 __ INC T4 + 1 
.s16:
09ef : a9 00 __ LDA #$00
09f1 : 8d e1 9f STA $9fe1 ; (si.sign + 0)
09f4 : 8d e2 9f STA $9fe2 ; (si.left + 0)
09f7 : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
09fa : a0 01 __ LDY #$01
09fc : b1 55 __ LDA (T3 + 0),y 
09fe : a2 20 __ LDX #$20
0a00 : 8e dc 9f STX $9fdc ; (si.fill + 0)
0a03 : a2 00 __ LDX #$00
0a05 : 8e dd 9f STX $9fdd ; (si.width + 0)
0a08 : ca __ __ DEX
0a09 : 8e de 9f STX $9fde ; (si.precision + 0)
0a0c : a2 0a __ LDX #$0a
0a0e : 8e e0 9f STX $9fe0 ; (si.base + 0)
0a11 : aa __ __ TAX
0a12 : a9 02 __ LDA #$02
0a14 : d0 07 __ BNE $0a1d ; (sformat.l17 + 0)
.s85:
0a16 : a0 00 __ LDY #$00
0a18 : b1 55 __ LDA (T3 + 0),y 
0a1a : aa __ __ TAX
0a1b : a9 01 __ LDA #$01
.l17:
0a1d : 18 __ __ CLC
0a1e : 65 55 __ ADC T3 + 0 
0a20 : 85 55 __ STA T3 + 0 
0a22 : 90 02 __ BCC $0a26 ; (sformat.s106 + 0)
.s105:
0a24 : e6 56 __ INC T3 + 1 
.s106:
0a26 : 8a __ __ TXA
0a27 : e0 2b __ CPX #$2b
0a29 : d0 07 __ BNE $0a32 ; (sformat.s18 + 0)
.s88:
0a2b : a9 01 __ LDA #$01
0a2d : 8d e1 9f STA $9fe1 ; (si.sign + 0)
0a30 : d0 e4 __ BNE $0a16 ; (sformat.s85 + 0)
.s18:
0a32 : c9 30 __ CMP #$30
0a34 : d0 06 __ BNE $0a3c ; (sformat.s19 + 0)
.s87:
0a36 : 8d dc 9f STA $9fdc ; (si.fill + 0)
0a39 : 4c 16 0a JMP $0a16 ; (sformat.s85 + 0)
.s19:
0a3c : c9 23 __ CMP #$23
0a3e : d0 07 __ BNE $0a47 ; (sformat.s20 + 0)
.s86:
0a40 : a9 01 __ LDA #$01
0a42 : 8d e3 9f STA $9fe3 ; (si.prefix + 0)
0a45 : d0 cf __ BNE $0a16 ; (sformat.s85 + 0)
.s20:
0a47 : c9 2d __ CMP #$2d
0a49 : d0 07 __ BNE $0a52 ; (sformat.s21 + 0)
.s84:
0a4b : a9 01 __ LDA #$01
0a4d : 8d e2 9f STA $9fe2 ; (si.left + 0)
0a50 : d0 c4 __ BNE $0a16 ; (sformat.s85 + 0)
.s21:
0a52 : 85 47 __ STA T2 + 0 
0a54 : c9 30 __ CMP #$30
0a56 : 90 3c __ BCC $0a94 ; (sformat.s22 + 0)
.s80:
0a58 : c9 3a __ CMP #$3a
0a5a : b0 77 __ BCS $0ad3 ; (sformat.s23 + 0)
.s81:
0a5c : a9 00 __ LDA #$00
0a5e : 85 53 __ STA T1 + 0 
.l82:
0a60 : a5 53 __ LDA T1 + 0 
0a62 : 0a __ __ ASL
0a63 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0a65 : a9 00 __ LDA #$00
0a67 : 2a __ __ ROL
0a68 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0a6a : 2a __ __ ROL
0a6b : aa __ __ TAX
0a6c : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0a6e : 65 53 __ ADC T1 + 0 
0a70 : 0a __ __ ASL
0a71 : 18 __ __ CLC
0a72 : 65 47 __ ADC T2 + 0 
0a74 : 38 __ __ SEC
0a75 : e9 30 __ SBC #$30
0a77 : 85 53 __ STA T1 + 0 
0a79 : a0 00 __ LDY #$00
0a7b : b1 55 __ LDA (T3 + 0),y 
0a7d : 85 47 __ STA T2 + 0 
0a7f : e6 55 __ INC T3 + 0 
0a81 : d0 02 __ BNE $0a85 ; (sformat.s114 + 0)
.s113:
0a83 : e6 56 __ INC T3 + 1 
.s114:
0a85 : c9 30 __ CMP #$30
0a87 : 90 04 __ BCC $0a8d ; (sformat.s104 + 0)
.s83:
0a89 : c9 3a __ CMP #$3a
0a8b : 90 d3 __ BCC $0a60 ; (sformat.l82 + 0)
.s104:
0a8d : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0a8f : a6 53 __ LDX T1 + 0 
0a91 : 8e dd 9f STX $9fdd ; (si.width + 0)
.s22:
0a94 : c9 2e __ CMP #$2e
0a96 : d0 3b __ BNE $0ad3 ; (sformat.s23 + 0)
.s76:
0a98 : a9 00 __ LDA #$00
0a9a : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0a9c : 4c b6 0a JMP $0ab6 ; (sformat.l77 + 0)
.s79:
0a9f : a5 43 __ LDA T0 + 0 
0aa1 : 0a __ __ ASL
0aa2 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0aa4 : 98 __ __ TYA
0aa5 : 2a __ __ ROL
0aa6 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0aa8 : 2a __ __ ROL
0aa9 : aa __ __ TAX
0aaa : 18 __ __ CLC
0aab : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0aad : 65 43 __ ADC T0 + 0 
0aaf : 0a __ __ ASL
0ab0 : 18 __ __ CLC
0ab1 : 65 47 __ ADC T2 + 0 
0ab3 : 38 __ __ SEC
0ab4 : e9 30 __ SBC #$30
.l77:
0ab6 : 85 43 __ STA T0 + 0 
0ab8 : a0 00 __ LDY #$00
0aba : b1 55 __ LDA (T3 + 0),y 
0abc : 85 47 __ STA T2 + 0 
0abe : e6 55 __ INC T3 + 0 
0ac0 : d0 02 __ BNE $0ac4 ; (sformat.s108 + 0)
.s107:
0ac2 : e6 56 __ INC T3 + 1 
.s108:
0ac4 : c9 30 __ CMP #$30
0ac6 : 90 04 __ BCC $0acc ; (sformat.s103 + 0)
.s78:
0ac8 : c9 3a __ CMP #$3a
0aca : 90 d3 __ BCC $0a9f ; (sformat.s79 + 0)
.s103:
0acc : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0ace : a6 43 __ LDX T0 + 0 
0ad0 : 8e de 9f STX $9fde ; (si.precision + 0)
.s23:
0ad3 : c9 64 __ CMP #$64
0ad5 : f0 0c __ BEQ $0ae3 ; (sformat.s75 + 0)
.s24:
0ad7 : c9 44 __ CMP #$44
0ad9 : f0 08 __ BEQ $0ae3 ; (sformat.s75 + 0)
.s25:
0adb : c9 69 __ CMP #$69
0add : f0 04 __ BEQ $0ae3 ; (sformat.s75 + 0)
.s26:
0adf : c9 49 __ CMP #$49
0ae1 : d0 07 __ BNE $0aea ; (sformat.s27 + 0)
.s75:
0ae3 : a9 01 __ LDA #$01
.s93:
0ae5 : 85 13 __ STA P6 
0ae7 : 4c 2b 0d JMP $0d2b ; (sformat.s73 + 0)
.s27:
0aea : c9 75 __ CMP #$75
0aec : f0 04 __ BEQ $0af2 ; (sformat.s74 + 0)
.s28:
0aee : c9 55 __ CMP #$55
0af0 : d0 04 __ BNE $0af6 ; (sformat.s29 + 0)
.s74:
0af2 : a9 00 __ LDA #$00
0af4 : f0 ef __ BEQ $0ae5 ; (sformat.s93 + 0)
.s29:
0af6 : c9 78 __ CMP #$78
0af8 : f0 04 __ BEQ $0afe ; (sformat.s72 + 0)
.s30:
0afa : c9 58 __ CMP #$58
0afc : d0 15 __ BNE $0b13 ; (sformat.s31 + 0)
.s72:
0afe : a5 47 __ LDA T2 + 0 
0b00 : 29 e0 __ AND #$e0
0b02 : 09 01 __ ORA #$01
0b04 : 8d df 9f STA $9fdf ; (si.cha + 0)
0b07 : a9 00 __ LDA #$00
0b09 : 85 13 __ STA P6 
0b0b : a9 10 __ LDA #$10
0b0d : 8d e0 9f STA $9fe0 ; (si.base + 0)
0b10 : 4c 2b 0d JMP $0d2b ; (sformat.s73 + 0)
.s31:
0b13 : c9 6c __ CMP #$6c
0b15 : d0 03 __ BNE $0b1a ; (sformat.s32 + 0)
0b17 : 4c 9c 0c JMP $0c9c ; (sformat.s60 + 0)
.s32:
0b1a : c9 4c __ CMP #$4c
0b1c : f0 f9 __ BEQ $0b17 ; (sformat.s31 + 4)
.s33:
0b1e : c9 66 __ CMP #$66
0b20 : f0 14 __ BEQ $0b36 ; (sformat.s59 + 0)
.s34:
0b22 : c9 67 __ CMP #$67
0b24 : f0 10 __ BEQ $0b36 ; (sformat.s59 + 0)
.s35:
0b26 : c9 65 __ CMP #$65
0b28 : f0 0c __ BEQ $0b36 ; (sformat.s59 + 0)
.s36:
0b2a : c9 46 __ CMP #$46
0b2c : f0 08 __ BEQ $0b36 ; (sformat.s59 + 0)
.s37:
0b2e : c9 47 __ CMP #$47
0b30 : f0 04 __ BEQ $0b36 ; (sformat.s59 + 0)
.s38:
0b32 : c9 45 __ CMP #$45
0b34 : d0 5c __ BNE $0b92 ; (sformat.s39 + 0)
.s59:
0b36 : a5 57 __ LDA T4 + 0 
0b38 : 85 13 __ STA P6 
0b3a : a5 58 __ LDA T4 + 1 
0b3c : 85 14 __ STA P7 
0b3e : a5 47 __ LDA T2 + 0 
0b40 : 29 e0 __ AND #$e0
0b42 : 09 01 __ ORA #$01
0b44 : 8d df 9f STA $9fdf ; (si.cha + 0)
0b47 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0b4a : 85 59 __ STA T5 + 0 
0b4c : a9 dc __ LDA #$dc
0b4e : 85 11 __ STA P4 
0b50 : a9 9f __ LDA #$9f
0b52 : 85 12 __ STA P5 
0b54 : ad fa 9f LDA $9ffa ; (sstack + 6)
0b57 : 85 5a __ STA T5 + 1 
0b59 : a0 00 __ LDY #$00
0b5b : b1 59 __ LDA (T5 + 0),y 
0b5d : 85 15 __ STA P8 
0b5f : c8 __ __ INY
0b60 : b1 59 __ LDA (T5 + 0),y 
0b62 : 85 16 __ STA P9 
0b64 : c8 __ __ INY
0b65 : b1 59 __ LDA (T5 + 0),y 
0b67 : 85 17 __ STA P10 
0b69 : c8 __ __ INY
0b6a : b1 59 __ LDA (T5 + 0),y 
0b6c : 85 18 __ STA P11 
0b6e : a5 47 __ LDA T2 + 0 
0b70 : ed df 9f SBC $9fdf ; (si.cha + 0)
0b73 : 18 __ __ CLC
0b74 : 69 61 __ ADC #$61
0b76 : 8d f4 9f STA $9ff4 ; (sstack + 0)
0b79 : 20 dd 0f JSR $0fdd ; (nformf.s1 + 0)
0b7c : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b7e : 85 5b __ STA T6 + 0 
0b80 : 18 __ __ CLC
0b81 : a5 59 __ LDA T5 + 0 
0b83 : 69 04 __ ADC #$04
0b85 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0b88 : a5 5a __ LDA T5 + 1 
0b8a : 69 00 __ ADC #$00
0b8c : 8d fa 9f STA $9ffa ; (sstack + 6)
0b8f : 4c 46 09 JMP $0946 ; (sformat.l5 + 0)
.s39:
0b92 : c9 73 __ CMP #$73
0b94 : f0 3b __ BEQ $0bd1 ; (sformat.s47 + 0)
.s40:
0b96 : c9 53 __ CMP #$53
0b98 : f0 37 __ BEQ $0bd1 ; (sformat.s47 + 0)
.s41:
0b9a : c9 63 __ CMP #$63
0b9c : f0 12 __ BEQ $0bb0 ; (sformat.s46 + 0)
.s42:
0b9e : c9 43 __ CMP #$43
0ba0 : f0 0e __ BEQ $0bb0 ; (sformat.s46 + 0)
.s43:
0ba2 : aa __ __ TAX
0ba3 : f0 ea __ BEQ $0b8f ; (sformat.s59 + 89)
.s44:
0ba5 : a0 00 __ LDY #$00
0ba7 : 91 57 __ STA (T4 + 0),y 
.s45:
0ba9 : a9 01 __ LDA #$01
.s96:
0bab : 85 5b __ STA T6 + 0 
0bad : 4c 46 09 JMP $0946 ; (sformat.l5 + 0)
.s46:
0bb0 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0bb3 : 85 43 __ STA T0 + 0 
0bb5 : ad fa 9f LDA $9ffa ; (sstack + 6)
0bb8 : 85 44 __ STA T0 + 1 
0bba : a0 00 __ LDY #$00
0bbc : b1 43 __ LDA (T0 + 0),y 
0bbe : 91 57 __ STA (T4 + 0),y 
0bc0 : a5 43 __ LDA T0 + 0 
0bc2 : 69 01 __ ADC #$01
0bc4 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0bc7 : a5 44 __ LDA T0 + 1 
0bc9 : 69 00 __ ADC #$00
0bcb : 8d fa 9f STA $9ffa ; (sstack + 6)
0bce : 4c a9 0b JMP $0ba9 ; (sformat.s45 + 0)
.s47:
0bd1 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0bd4 : 85 43 __ STA T0 + 0 
0bd6 : 69 01 __ ADC #$01
0bd8 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0bdb : ad fa 9f LDA $9ffa ; (sstack + 6)
0bde : 85 44 __ STA T0 + 1 
0be0 : 69 00 __ ADC #$00
0be2 : 8d fa 9f STA $9ffa ; (sstack + 6)
0be5 : a0 00 __ LDY #$00
0be7 : 84 5c __ STY T7 + 0 
0be9 : b1 43 __ LDA (T0 + 0),y 
0beb : 85 1b __ STA ACCU + 0 ; (buff + 1)
0bed : 85 53 __ STA T1 + 0 
0bef : c8 __ __ INY
0bf0 : b1 43 __ LDA (T0 + 0),y 
0bf2 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0bf4 : 85 54 __ STA T1 + 1 
0bf6 : ad dd 9f LDA $9fdd ; (si.width + 0)
0bf9 : f0 0c __ BEQ $0c07 ; (sformat.s48 + 0)
.s100:
0bfb : 88 __ __ DEY
0bfc : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0bfe : f0 05 __ BEQ $0c05 ; (sformat.s101 + 0)
.l58:
0c00 : c8 __ __ INY
0c01 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0c03 : d0 fb __ BNE $0c00 ; (sformat.l58 + 0)
.s101:
0c05 : 84 5c __ STY T7 + 0 
.s48:
0c07 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0c0a : 85 59 __ STA T5 + 0 
0c0c : d0 19 __ BNE $0c27 ; (sformat.s49 + 0)
.s98:
0c0e : a6 5c __ LDX T7 + 0 
0c10 : ec dd 9f CPX $9fdd ; (si.width + 0)
0c13 : a0 00 __ LDY #$00
0c15 : b0 0c __ BCS $0c23 ; (sformat.s99 + 0)
.l57:
0c17 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0c1a : 91 57 __ STA (T4 + 0),y 
0c1c : c8 __ __ INY
0c1d : e8 __ __ INX
0c1e : ec dd 9f CPX $9fdd ; (si.width + 0)
0c21 : 90 f4 __ BCC $0c17 ; (sformat.l57 + 0)
.s99:
0c23 : 86 5c __ STX T7 + 0 
0c25 : 84 5b __ STY T6 + 0 
.s49:
0c27 : ac fb 9f LDY $9ffb ; (sstack + 7)
0c2a : d0 48 __ BNE $0c74 ; (sformat.s54 + 0)
.s50:
0c2c : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0c2e : f0 23 __ BEQ $0c53 ; (sformat.s51 + 0)
.s53:
0c30 : 18 __ __ CLC
0c31 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c33 : 69 01 __ ADC #$01
0c35 : 85 43 __ STA T0 + 0 
0c37 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0c39 : 69 00 __ ADC #$00
0c3b : 85 44 __ STA T0 + 1 
0c3d : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0c3f : a4 5b __ LDY T6 + 0 
0c41 : 91 57 __ STA (T4 + 0),y 
0c43 : e6 5b __ INC T6 + 0 
0c45 : a0 00 __ LDY #$00
0c47 : b1 43 __ LDA (T0 + 0),y 
0c49 : a8 __ __ TAY
0c4a : e6 43 __ INC T0 + 0 
0c4c : d0 02 __ BNE $0c50 ; (sformat.s112 + 0)
.s111:
0c4e : e6 44 __ INC T0 + 1 
.s112:
0c50 : 98 __ __ TYA
0c51 : d0 ec __ BNE $0c3f ; (sformat.l92 + 0)
.s51:
0c53 : a5 59 __ LDA T5 + 0 
0c55 : d0 03 __ BNE $0c5a ; (sformat.s97 + 0)
0c57 : 4c 46 09 JMP $0946 ; (sformat.l5 + 0)
.s97:
0c5a : a6 5c __ LDX T7 + 0 
0c5c : ec dd 9f CPX $9fdd ; (si.width + 0)
0c5f : a4 5b __ LDY T6 + 0 
0c61 : b0 0c __ BCS $0c6f ; (sformat.s102 + 0)
.l52:
0c63 : ad dc 9f LDA $9fdc ; (si.fill + 0)
0c66 : 91 57 __ STA (T4 + 0),y 
0c68 : c8 __ __ INY
0c69 : e8 __ __ INX
0c6a : ec dd 9f CPX $9fdd ; (si.width + 0)
0c6d : 90 f4 __ BCC $0c63 ; (sformat.l52 + 0)
.s102:
0c6f : 84 5b __ STY T6 + 0 
0c71 : 4c 46 09 JMP $0946 ; (sformat.l5 + 0)
.s54:
0c74 : a4 5b __ LDY T6 + 0 
0c76 : f0 11 __ BEQ $0c89 ; (sformat.s55 + 0)
.s56:
0c78 : a5 57 __ LDA T4 + 0 
0c7a : 85 0e __ STA P1 
0c7c : a5 58 __ LDA T4 + 1 
0c7e : 85 0f __ STA P2 
0c80 : a9 00 __ LDA #$00
0c82 : 85 5b __ STA T6 + 0 
0c84 : 91 0e __ STA (P1),y 
0c86 : 20 65 0d JSR $0d65 ; (puts.l4 + 0)
.s55:
0c89 : a5 53 __ LDA T1 + 0 
0c8b : 85 0e __ STA P1 
0c8d : a5 54 __ LDA T1 + 1 
0c8f : 85 0f __ STA P2 
0c91 : 20 65 0d JSR $0d65 ; (puts.l4 + 0)
0c94 : ad e2 9f LDA $9fe2 ; (si.left + 0)
0c97 : d0 c1 __ BNE $0c5a ; (sformat.s97 + 0)
0c99 : 4c 46 09 JMP $0946 ; (sformat.l5 + 0)
.s60:
0c9c : ad f9 9f LDA $9ff9 ; (sstack + 5)
0c9f : 85 43 __ STA T0 + 0 
0ca1 : 69 03 __ ADC #$03
0ca3 : 8d f9 9f STA $9ff9 ; (sstack + 5)
0ca6 : ad fa 9f LDA $9ffa ; (sstack + 6)
0ca9 : 85 44 __ STA T0 + 1 
0cab : 69 00 __ ADC #$00
0cad : 8d fa 9f STA $9ffa ; (sstack + 6)
0cb0 : a0 00 __ LDY #$00
0cb2 : b1 55 __ LDA (T3 + 0),y 
0cb4 : aa __ __ TAX
0cb5 : e6 55 __ INC T3 + 0 
0cb7 : d0 02 __ BNE $0cbb ; (sformat.s110 + 0)
.s109:
0cb9 : e6 56 __ INC T3 + 1 
.s110:
0cbb : b1 43 __ LDA (T0 + 0),y 
0cbd : 85 1b __ STA ACCU + 0 ; (buff + 1)
0cbf : 85 11 __ STA P4 
0cc1 : a0 01 __ LDY #$01
0cc3 : b1 43 __ LDA (T0 + 0),y 
0cc5 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0cc7 : 85 12 __ STA P5 
0cc9 : c8 __ __ INY
0cca : b1 43 __ LDA (T0 + 0),y 
0ccc : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0cce : 85 13 __ STA P6 
0cd0 : c8 __ __ INY
0cd1 : b1 43 __ LDA (T0 + 0),y 
0cd3 : 85 14 __ STA P7 
0cd5 : e0 64 __ CPX #$64
0cd7 : f0 0c __ BEQ $0ce5 ; (sformat.s71 + 0)
.s61:
0cd9 : e0 44 __ CPX #$44
0cdb : f0 08 __ BEQ $0ce5 ; (sformat.s71 + 0)
.s62:
0cdd : e0 69 __ CPX #$69
0cdf : f0 04 __ BEQ $0ce5 ; (sformat.s71 + 0)
.s63:
0ce1 : e0 49 __ CPX #$49
0ce3 : d0 1c __ BNE $0d01 ; (sformat.s64 + 0)
.s71:
0ce5 : a9 01 __ LDA #$01
.s94:
0ce7 : 85 15 __ STA P8 
.s69:
0ce9 : a5 57 __ LDA T4 + 0 
0ceb : 85 0f __ STA P2 
0ced : a5 58 __ LDA T4 + 1 
0cef : 85 10 __ STA P3 
0cf1 : a9 dc __ LDA #$dc
0cf3 : 85 0d __ STA P0 
0cf5 : a9 9f __ LDA #$9f
0cf7 : 85 0e __ STA P1 
0cf9 : 20 93 0e JSR $0e93 ; (nforml.s4 + 0)
0cfc : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0cfe : 4c ab 0b JMP $0bab ; (sformat.s96 + 0)
.s64:
0d01 : e0 75 __ CPX #$75
0d03 : f0 04 __ BEQ $0d09 ; (sformat.s70 + 0)
.s65:
0d05 : e0 55 __ CPX #$55
0d07 : d0 04 __ BNE $0d0d ; (sformat.s66 + 0)
.s70:
0d09 : a9 00 __ LDA #$00
0d0b : f0 da __ BEQ $0ce7 ; (sformat.s94 + 0)
.s66:
0d0d : e0 78 __ CPX #$78
0d0f : f0 06 __ BEQ $0d17 ; (sformat.s68 + 0)
.s67:
0d11 : 85 1e __ STA ACCU + 3 ; (fps + 0)
0d13 : e0 58 __ CPX #$58
0d15 : d0 82 __ BNE $0c99 ; (sformat.s55 + 16)
.s68:
0d17 : a9 00 __ LDA #$00
0d19 : 85 15 __ STA P8 
0d1b : a9 10 __ LDA #$10
0d1d : 8d e0 9f STA $9fe0 ; (si.base + 0)
0d20 : 8a __ __ TXA
0d21 : 29 e0 __ AND #$e0
0d23 : 09 01 __ ORA #$01
0d25 : 8d df 9f STA $9fdf ; (si.cha + 0)
0d28 : 4c e9 0c JMP $0ce9 ; (sformat.s69 + 0)
.s73:
0d2b : a5 57 __ LDA T4 + 0 
0d2d : 85 0f __ STA P2 
0d2f : a5 58 __ LDA T4 + 1 
0d31 : 85 10 __ STA P3 
0d33 : ad f9 9f LDA $9ff9 ; (sstack + 5)
0d36 : 85 43 __ STA T0 + 0 
0d38 : ad fa 9f LDA $9ffa ; (sstack + 6)
0d3b : 85 44 __ STA T0 + 1 
0d3d : a0 00 __ LDY #$00
0d3f : b1 43 __ LDA (T0 + 0),y 
0d41 : 85 11 __ STA P4 
0d43 : c8 __ __ INY
0d44 : b1 43 __ LDA (T0 + 0),y 
0d46 : 85 12 __ STA P5 
0d48 : 18 __ __ CLC
0d49 : a5 43 __ LDA T0 + 0 
0d4b : 69 02 __ ADC #$02
0d4d : 8d f9 9f STA $9ff9 ; (sstack + 5)
0d50 : a5 44 __ LDA T0 + 1 
0d52 : 69 00 __ ADC #$00
0d54 : 8d fa 9f STA $9ffa ; (sstack + 6)
0d57 : a9 dc __ LDA #$dc
0d59 : 85 0d __ STA P0 
0d5b : a9 9f __ LDA #$9f
0d5d : 85 0e __ STA P1 
0d5f : 20 78 0d JSR $0d78 ; (nformi.s4 + 0)
0d62 : 4c ab 0b JMP $0bab ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/oscar64/include/stdio.h"
.l4:
0d65 : a0 00 __ LDY #$00
0d67 : b1 0e __ LDA (P1),y ; (str + 0)
0d69 : d0 01 __ BNE $0d6c ; (puts.s5 + 0)
.s3:
0d6b : 60 __ __ RTS
.s5:
0d6c : e6 0e __ INC P1 ; (str + 0)
0d6e : d0 02 __ BNE $0d72 ; (puts.s7 + 0)
.s6:
0d70 : e6 0f __ INC P2 ; (str + 1)
.s7:
0d72 : 20 99 08 JSR $0899 ; (putpch.s4 + 0)
0d75 : 4c 65 0d JMP $0d65 ; (puts.l4 + 0)
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/oscar64/include/stdio.c"
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
0db3 : 20 3f 18 JSR $183f ; (divmod + 0)
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
; 137, "/home/honza/projects/c64/oscar64/include/stdio.c"
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
0fab : 20 84 19 JSR $1984 ; (divmod32 + 0)
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
; 199, "/home/honza/projects/c64/oscar64/include/stdio.c"
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
10be : 20 71 15 JSR $1571 ; (freg + 20)
10c1 : 20 57 17 JSR $1757 ; (crt_fdiv + 0)
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
111c : 20 61 15 JSR $1561 ; (freg + 4)
111f : 20 8f 16 JSR $168f ; (crt_fmul + 0)
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
1184 : 20 71 15 JSR $1571 ; (freg + 20)
1187 : 20 57 17 JSR $1757 ; (crt_fdiv + 0)
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
1203 : 20 71 15 JSR $1571 ; (freg + 20)
1206 : 20 57 17 JSR $1757 ; (crt_fdiv + 0)
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
1236 : ad 75 1a LDA $1a75 ; (fround5[0] + 24)
1239 : 85 47 __ STA T1 + 0 
123b : ad 76 1a LDA $1a76 ; (fround5[0] + 25)
123e : 85 48 __ STA T1 + 1 
1240 : ad 77 1a LDA $1a77 ; (fround5[0] + 26)
1243 : 85 49 __ STA T1 + 2 
1245 : ad 78 1a LDA $1a78 ; (fround5[0] + 27)
1248 : b0 15 __ BCS $125f ; (nformf.s17 + 0)
.s51:
124a : 0a __ __ ASL
124b : 0a __ __ ASL
124c : aa __ __ TAX
124d : bd 59 1a LDA $1a59,x ; (divmod32 + 213)
1250 : 85 47 __ STA T1 + 0 
1252 : bd 5a 1a LDA $1a5a,x ; (divmod32 + 214)
1255 : 85 48 __ STA T1 + 1 
1257 : bd 5b 1a LDA $1a5b,x ; (spentry + 0)
125a : 85 49 __ STA T1 + 2 
125c : bd 5c 1a LDA $1a5c,x ; (giocharmap + 0)
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
1273 : 20 61 15 JSR $1561 ; (freg + 4)
1276 : 20 a8 15 JSR $15a8 ; (faddsub + 6)
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
12aa : 20 71 15 JSR $1571 ; (freg + 20)
12ad : 20 57 17 JSR $1757 ; (crt_fdiv + 0)
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
130a : 20 f1 18 JSR $18f1 ; (f32_to_i16 + 0)
130d : a5 1b __ LDA ACCU + 0 
130f : 85 53 __ STA T7 + 0 
1311 : 20 3d 19 JSR $193d ; (sint16_to_float + 0)
1314 : a2 43 __ LDX #$43
1316 : 20 61 15 JSR $1561 ; (freg + 4)
1319 : a5 1e __ LDA ACCU + 3 
131b : 49 80 __ EOR #$80
131d : 85 1e __ STA ACCU + 3 
131f : 20 a8 15 JSR $15a8 ; (faddsub + 6)
1322 : a9 00 __ LDA #$00
1324 : 85 03 __ STA WORK + 0 
1326 : 85 04 __ STA WORK + 1 
1328 : a9 20 __ LDA #$20
132a : 85 05 __ STA WORK + 2 
132c : a9 41 __ LDA #$41
132e : 85 06 __ STA WORK + 3 
1330 : 20 71 15 JSR $1571 ; (freg + 20)
1333 : 20 8f 16 JSR $168f ; (crt_fmul + 0)
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
13a9 : 20 05 18 JSR $1805 ; (divs16 + 0)
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
13c7 : 20 c4 18 JSR $18c4 ; (mods16 + 0)
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
146c : ad 75 1a LDA $1a75 ; (fround5[0] + 24)
146f : 85 47 __ STA T1 + 0 
1471 : ad 76 1a LDA $1a76 ; (fround5[0] + 25)
1474 : 85 48 __ STA T1 + 1 
1476 : ad 77 1a LDA $1a77 ; (fround5[0] + 26)
1479 : 85 49 __ STA T1 + 2 
147b : ad 78 1a LDA $1a78 ; (fround5[0] + 27)
147e : b0 15 __ BCS $1495 ; (nformf.s55 + 0)
.s62:
1480 : 0a __ __ ASL
1481 : 0a __ __ ASL
1482 : aa __ __ TAX
1483 : bd 59 1a LDA $1a59,x ; (divmod32 + 213)
1486 : 85 47 __ STA T1 + 0 
1488 : bd 5a 1a LDA $1a5a,x ; (divmod32 + 214)
148b : 85 48 __ STA T1 + 1 
148d : bd 5b 1a LDA $1a5b,x ; (spentry + 0)
1490 : 85 49 __ STA T1 + 2 
1492 : bd 5c 1a LDA $1a5c,x ; (giocharmap + 0)
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
14a9 : 20 61 15 JSR $1561 ; (freg + 4)
14ac : 20 a8 15 JSR $15a8 ; (faddsub + 6)
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
14e3 : 20 71 15 JSR $1571 ; (freg + 20)
14e6 : 20 57 17 JSR $1757 ; (crt_fdiv + 0)
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
;  26, "/home/honza/projects/c64/oscar64/include/math.h"
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
1550 : __ __ __ BYT c8 45 4c 4c 4f 20 d7 4f 52 4c 44 0a 00          : .ELLO .ORLD..
--------------------------------------------------------------------
freg: ; freg
155d : b1 19 __ LDA (IP + 0),y 
155f : c8 __ __ INY
1560 : aa __ __ TAX
1561 : b5 00 __ LDA $00,x 
1563 : 85 03 __ STA WORK + 0 
1565 : b5 01 __ LDA $01,x 
1567 : 85 04 __ STA WORK + 1 
1569 : b5 02 __ LDA $02,x 
156b : 85 05 __ STA WORK + 2 
156d : b5 03 __ LDA WORK + 0,x 
156f : 85 06 __ STA WORK + 3 
1571 : a5 05 __ LDA WORK + 2 
1573 : 0a __ __ ASL
1574 : a5 06 __ LDA WORK + 3 
1576 : 2a __ __ ROL
1577 : 85 08 __ STA WORK + 5 
1579 : f0 06 __ BEQ $1581 ; (freg + 36)
157b : a5 05 __ LDA WORK + 2 
157d : 09 80 __ ORA #$80
157f : 85 05 __ STA WORK + 2 
1581 : a5 1d __ LDA ACCU + 2 
1583 : 0a __ __ ASL
1584 : a5 1e __ LDA ACCU + 3 
1586 : 2a __ __ ROL
1587 : 85 07 __ STA WORK + 4 
1589 : f0 06 __ BEQ $1591 ; (freg + 52)
158b : a5 1d __ LDA ACCU + 2 
158d : 09 80 __ ORA #$80
158f : 85 1d __ STA ACCU + 2 
1591 : 60 __ __ RTS
1592 : 06 1e __ ASL ACCU + 3 
1594 : a5 07 __ LDA WORK + 4 
1596 : 6a __ __ ROR
1597 : 85 1e __ STA ACCU + 3 
1599 : b0 06 __ BCS $15a1 ; (freg + 68)
159b : a5 1d __ LDA ACCU + 2 
159d : 29 7f __ AND #$7f
159f : 85 1d __ STA ACCU + 2 
15a1 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
15a2 : a5 06 __ LDA WORK + 3 
15a4 : 49 80 __ EOR #$80
15a6 : 85 06 __ STA WORK + 3 
15a8 : a9 ff __ LDA #$ff
15aa : c5 07 __ CMP WORK + 4 
15ac : f0 04 __ BEQ $15b2 ; (faddsub + 16)
15ae : c5 08 __ CMP WORK + 5 
15b0 : d0 11 __ BNE $15c3 ; (faddsub + 33)
15b2 : a5 1e __ LDA ACCU + 3 
15b4 : 09 7f __ ORA #$7f
15b6 : 85 1e __ STA ACCU + 3 
15b8 : a9 80 __ LDA #$80
15ba : 85 1d __ STA ACCU + 2 
15bc : a9 00 __ LDA #$00
15be : 85 1b __ STA ACCU + 0 
15c0 : 85 1c __ STA ACCU + 1 
15c2 : 60 __ __ RTS
15c3 : 38 __ __ SEC
15c4 : a5 07 __ LDA WORK + 4 
15c6 : e5 08 __ SBC WORK + 5 
15c8 : f0 38 __ BEQ $1602 ; (faddsub + 96)
15ca : aa __ __ TAX
15cb : b0 25 __ BCS $15f2 ; (faddsub + 80)
15cd : e0 e9 __ CPX #$e9
15cf : b0 0e __ BCS $15df ; (faddsub + 61)
15d1 : a5 08 __ LDA WORK + 5 
15d3 : 85 07 __ STA WORK + 4 
15d5 : a9 00 __ LDA #$00
15d7 : 85 1b __ STA ACCU + 0 
15d9 : 85 1c __ STA ACCU + 1 
15db : 85 1d __ STA ACCU + 2 
15dd : f0 23 __ BEQ $1602 ; (faddsub + 96)
15df : a5 1d __ LDA ACCU + 2 
15e1 : 4a __ __ LSR
15e2 : 66 1c __ ROR ACCU + 1 
15e4 : 66 1b __ ROR ACCU + 0 
15e6 : e8 __ __ INX
15e7 : d0 f8 __ BNE $15e1 ; (faddsub + 63)
15e9 : 85 1d __ STA ACCU + 2 
15eb : a5 08 __ LDA WORK + 5 
15ed : 85 07 __ STA WORK + 4 
15ef : 4c 02 16 JMP $1602 ; (faddsub + 96)
15f2 : e0 18 __ CPX #$18
15f4 : b0 33 __ BCS $1629 ; (faddsub + 135)
15f6 : a5 05 __ LDA WORK + 2 
15f8 : 4a __ __ LSR
15f9 : 66 04 __ ROR WORK + 1 
15fb : 66 03 __ ROR WORK + 0 
15fd : ca __ __ DEX
15fe : d0 f8 __ BNE $15f8 ; (faddsub + 86)
1600 : 85 05 __ STA WORK + 2 
1602 : a5 1e __ LDA ACCU + 3 
1604 : 29 80 __ AND #$80
1606 : 85 1e __ STA ACCU + 3 
1608 : 45 06 __ EOR WORK + 3 
160a : 30 31 __ BMI $163d ; (faddsub + 155)
160c : 18 __ __ CLC
160d : a5 1b __ LDA ACCU + 0 
160f : 65 03 __ ADC WORK + 0 
1611 : 85 1b __ STA ACCU + 0 
1613 : a5 1c __ LDA ACCU + 1 
1615 : 65 04 __ ADC WORK + 1 
1617 : 85 1c __ STA ACCU + 1 
1619 : a5 1d __ LDA ACCU + 2 
161b : 65 05 __ ADC WORK + 2 
161d : 85 1d __ STA ACCU + 2 
161f : 90 08 __ BCC $1629 ; (faddsub + 135)
1621 : 66 1d __ ROR ACCU + 2 
1623 : 66 1c __ ROR ACCU + 1 
1625 : 66 1b __ ROR ACCU + 0 
1627 : e6 07 __ INC WORK + 4 
1629 : a5 07 __ LDA WORK + 4 
162b : c9 ff __ CMP #$ff
162d : f0 83 __ BEQ $15b2 ; (faddsub + 16)
162f : 4a __ __ LSR
1630 : 05 1e __ ORA ACCU + 3 
1632 : 85 1e __ STA ACCU + 3 
1634 : b0 06 __ BCS $163c ; (faddsub + 154)
1636 : a5 1d __ LDA ACCU + 2 
1638 : 29 7f __ AND #$7f
163a : 85 1d __ STA ACCU + 2 
163c : 60 __ __ RTS
163d : 38 __ __ SEC
163e : a5 1b __ LDA ACCU + 0 
1640 : e5 03 __ SBC WORK + 0 
1642 : 85 1b __ STA ACCU + 0 
1644 : a5 1c __ LDA ACCU + 1 
1646 : e5 04 __ SBC WORK + 1 
1648 : 85 1c __ STA ACCU + 1 
164a : a5 1d __ LDA ACCU + 2 
164c : e5 05 __ SBC WORK + 2 
164e : 85 1d __ STA ACCU + 2 
1650 : b0 19 __ BCS $166b ; (faddsub + 201)
1652 : 38 __ __ SEC
1653 : a9 00 __ LDA #$00
1655 : e5 1b __ SBC ACCU + 0 
1657 : 85 1b __ STA ACCU + 0 
1659 : a9 00 __ LDA #$00
165b : e5 1c __ SBC ACCU + 1 
165d : 85 1c __ STA ACCU + 1 
165f : a9 00 __ LDA #$00
1661 : e5 1d __ SBC ACCU + 2 
1663 : 85 1d __ STA ACCU + 2 
1665 : a5 1e __ LDA ACCU + 3 
1667 : 49 80 __ EOR #$80
1669 : 85 1e __ STA ACCU + 3 
166b : a5 1d __ LDA ACCU + 2 
166d : 30 ba __ BMI $1629 ; (faddsub + 135)
166f : 05 1c __ ORA ACCU + 1 
1671 : 05 1b __ ORA ACCU + 0 
1673 : f0 0f __ BEQ $1684 ; (faddsub + 226)
1675 : c6 07 __ DEC WORK + 4 
1677 : f0 0b __ BEQ $1684 ; (faddsub + 226)
1679 : 06 1b __ ASL ACCU + 0 
167b : 26 1c __ ROL ACCU + 1 
167d : 26 1d __ ROL ACCU + 2 
167f : 10 f4 __ BPL $1675 ; (faddsub + 211)
1681 : 4c 29 16 JMP $1629 ; (faddsub + 135)
1684 : a9 00 __ LDA #$00
1686 : 85 1b __ STA ACCU + 0 
1688 : 85 1c __ STA ACCU + 1 
168a : 85 1d __ STA ACCU + 2 
168c : 85 1e __ STA ACCU + 3 
168e : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
168f : a5 1b __ LDA ACCU + 0 
1691 : 05 1c __ ORA ACCU + 1 
1693 : 05 1d __ ORA ACCU + 2 
1695 : f0 0e __ BEQ $16a5 ; (crt_fmul + 22)
1697 : a5 03 __ LDA WORK + 0 
1699 : 05 04 __ ORA WORK + 1 
169b : 05 05 __ ORA WORK + 2 
169d : d0 09 __ BNE $16a8 ; (crt_fmul + 25)
169f : 85 1b __ STA ACCU + 0 
16a1 : 85 1c __ STA ACCU + 1 
16a3 : 85 1d __ STA ACCU + 2 
16a5 : 85 1e __ STA ACCU + 3 
16a7 : 60 __ __ RTS
16a8 : a5 1e __ LDA ACCU + 3 
16aa : 45 06 __ EOR WORK + 3 
16ac : 29 80 __ AND #$80
16ae : 85 1e __ STA ACCU + 3 
16b0 : a9 ff __ LDA #$ff
16b2 : c5 07 __ CMP WORK + 4 
16b4 : f0 42 __ BEQ $16f8 ; (crt_fmul + 105)
16b6 : c5 08 __ CMP WORK + 5 
16b8 : f0 3e __ BEQ $16f8 ; (crt_fmul + 105)
16ba : a9 00 __ LDA #$00
16bc : 85 09 __ STA WORK + 6 
16be : 85 0a __ STA WORK + 7 
16c0 : 85 0b __ STA WORK + 8 
16c2 : a4 1b __ LDY ACCU + 0 
16c4 : a5 03 __ LDA WORK + 0 
16c6 : d0 06 __ BNE $16ce ; (crt_fmul + 63)
16c8 : a5 04 __ LDA WORK + 1 
16ca : f0 0a __ BEQ $16d6 ; (crt_fmul + 71)
16cc : d0 05 __ BNE $16d3 ; (crt_fmul + 68)
16ce : 20 29 17 JSR $1729 ; (crt_fmul8 + 0)
16d1 : a5 04 __ LDA WORK + 1 
16d3 : 20 29 17 JSR $1729 ; (crt_fmul8 + 0)
16d6 : a5 05 __ LDA WORK + 2 
16d8 : 20 29 17 JSR $1729 ; (crt_fmul8 + 0)
16db : 38 __ __ SEC
16dc : a5 0b __ LDA WORK + 8 
16de : 30 06 __ BMI $16e6 ; (crt_fmul + 87)
16e0 : 06 09 __ ASL WORK + 6 
16e2 : 26 0a __ ROL WORK + 7 
16e4 : 2a __ __ ROL
16e5 : 18 __ __ CLC
16e6 : 29 7f __ AND #$7f
16e8 : 85 0b __ STA WORK + 8 
16ea : a5 07 __ LDA WORK + 4 
16ec : 65 08 __ ADC WORK + 5 
16ee : 90 19 __ BCC $1709 ; (crt_fmul + 122)
16f0 : e9 7f __ SBC #$7f
16f2 : b0 04 __ BCS $16f8 ; (crt_fmul + 105)
16f4 : c9 ff __ CMP #$ff
16f6 : d0 15 __ BNE $170d ; (crt_fmul + 126)
16f8 : a5 1e __ LDA ACCU + 3 
16fa : 09 7f __ ORA #$7f
16fc : 85 1e __ STA ACCU + 3 
16fe : a9 80 __ LDA #$80
1700 : 85 1d __ STA ACCU + 2 
1702 : a9 00 __ LDA #$00
1704 : 85 1b __ STA ACCU + 0 
1706 : 85 1c __ STA ACCU + 1 
1708 : 60 __ __ RTS
1709 : e9 7e __ SBC #$7e
170b : 90 15 __ BCC $1722 ; (crt_fmul + 147)
170d : 4a __ __ LSR
170e : 05 1e __ ORA ACCU + 3 
1710 : 85 1e __ STA ACCU + 3 
1712 : a9 00 __ LDA #$00
1714 : 6a __ __ ROR
1715 : 05 0b __ ORA WORK + 8 
1717 : 85 1d __ STA ACCU + 2 
1719 : a5 0a __ LDA WORK + 7 
171b : 85 1c __ STA ACCU + 1 
171d : a5 09 __ LDA WORK + 6 
171f : 85 1b __ STA ACCU + 0 
1721 : 60 __ __ RTS
1722 : a9 00 __ LDA #$00
1724 : 85 1e __ STA ACCU + 3 
1726 : f0 d8 __ BEQ $1700 ; (crt_fmul + 113)
1728 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1729 : 38 __ __ SEC
172a : 6a __ __ ROR
172b : 90 1e __ BCC $174b ; (crt_fmul8 + 34)
172d : aa __ __ TAX
172e : 18 __ __ CLC
172f : 98 __ __ TYA
1730 : 65 09 __ ADC WORK + 6 
1732 : 85 09 __ STA WORK + 6 
1734 : a5 0a __ LDA WORK + 7 
1736 : 65 1c __ ADC ACCU + 1 
1738 : 85 0a __ STA WORK + 7 
173a : a5 0b __ LDA WORK + 8 
173c : 65 1d __ ADC ACCU + 2 
173e : 6a __ __ ROR
173f : 85 0b __ STA WORK + 8 
1741 : 8a __ __ TXA
1742 : 66 0a __ ROR WORK + 7 
1744 : 66 09 __ ROR WORK + 6 
1746 : 4a __ __ LSR
1747 : f0 0d __ BEQ $1756 ; (crt_fmul8 + 45)
1749 : b0 e2 __ BCS $172d ; (crt_fmul8 + 4)
174b : 66 0b __ ROR WORK + 8 
174d : 66 0a __ ROR WORK + 7 
174f : 66 09 __ ROR WORK + 6 
1751 : 4a __ __ LSR
1752 : 90 f7 __ BCC $174b ; (crt_fmul8 + 34)
1754 : d0 d7 __ BNE $172d ; (crt_fmul8 + 4)
1756 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1757 : a5 1b __ LDA ACCU + 0 
1759 : 05 1c __ ORA ACCU + 1 
175b : 05 1d __ ORA ACCU + 2 
175d : d0 03 __ BNE $1762 ; (crt_fdiv + 11)
175f : 85 1e __ STA ACCU + 3 
1761 : 60 __ __ RTS
1762 : a5 1e __ LDA ACCU + 3 
1764 : 45 06 __ EOR WORK + 3 
1766 : 29 80 __ AND #$80
1768 : 85 1e __ STA ACCU + 3 
176a : a5 08 __ LDA WORK + 5 
176c : f0 62 __ BEQ $17d0 ; (crt_fdiv + 121)
176e : a5 07 __ LDA WORK + 4 
1770 : c9 ff __ CMP #$ff
1772 : f0 5c __ BEQ $17d0 ; (crt_fdiv + 121)
1774 : a9 00 __ LDA #$00
1776 : 85 09 __ STA WORK + 6 
1778 : 85 0a __ STA WORK + 7 
177a : 85 0b __ STA WORK + 8 
177c : a2 18 __ LDX #$18
177e : a5 1b __ LDA ACCU + 0 
1780 : c5 03 __ CMP WORK + 0 
1782 : a5 1c __ LDA ACCU + 1 
1784 : e5 04 __ SBC WORK + 1 
1786 : a5 1d __ LDA ACCU + 2 
1788 : e5 05 __ SBC WORK + 2 
178a : 90 13 __ BCC $179f ; (crt_fdiv + 72)
178c : a5 1b __ LDA ACCU + 0 
178e : e5 03 __ SBC WORK + 0 
1790 : 85 1b __ STA ACCU + 0 
1792 : a5 1c __ LDA ACCU + 1 
1794 : e5 04 __ SBC WORK + 1 
1796 : 85 1c __ STA ACCU + 1 
1798 : a5 1d __ LDA ACCU + 2 
179a : e5 05 __ SBC WORK + 2 
179c : 85 1d __ STA ACCU + 2 
179e : 38 __ __ SEC
179f : 26 09 __ ROL WORK + 6 
17a1 : 26 0a __ ROL WORK + 7 
17a3 : 26 0b __ ROL WORK + 8 
17a5 : ca __ __ DEX
17a6 : f0 0a __ BEQ $17b2 ; (crt_fdiv + 91)
17a8 : 06 1b __ ASL ACCU + 0 
17aa : 26 1c __ ROL ACCU + 1 
17ac : 26 1d __ ROL ACCU + 2 
17ae : b0 dc __ BCS $178c ; (crt_fdiv + 53)
17b0 : 90 cc __ BCC $177e ; (crt_fdiv + 39)
17b2 : 38 __ __ SEC
17b3 : a5 0b __ LDA WORK + 8 
17b5 : 30 06 __ BMI $17bd ; (crt_fdiv + 102)
17b7 : 06 09 __ ASL WORK + 6 
17b9 : 26 0a __ ROL WORK + 7 
17bb : 2a __ __ ROL
17bc : 18 __ __ CLC
17bd : 29 7f __ AND #$7f
17bf : 85 0b __ STA WORK + 8 
17c1 : a5 07 __ LDA WORK + 4 
17c3 : e5 08 __ SBC WORK + 5 
17c5 : 90 1a __ BCC $17e1 ; (crt_fdiv + 138)
17c7 : 18 __ __ CLC
17c8 : 69 7f __ ADC #$7f
17ca : b0 04 __ BCS $17d0 ; (crt_fdiv + 121)
17cc : c9 ff __ CMP #$ff
17ce : d0 15 __ BNE $17e5 ; (crt_fdiv + 142)
17d0 : a5 1e __ LDA ACCU + 3 
17d2 : 09 7f __ ORA #$7f
17d4 : 85 1e __ STA ACCU + 3 
17d6 : a9 80 __ LDA #$80
17d8 : 85 1d __ STA ACCU + 2 
17da : a9 00 __ LDA #$00
17dc : 85 1c __ STA ACCU + 1 
17de : 85 1b __ STA ACCU + 0 
17e0 : 60 __ __ RTS
17e1 : 69 7f __ ADC #$7f
17e3 : 90 15 __ BCC $17fa ; (crt_fdiv + 163)
17e5 : 4a __ __ LSR
17e6 : 05 1e __ ORA ACCU + 3 
17e8 : 85 1e __ STA ACCU + 3 
17ea : a9 00 __ LDA #$00
17ec : 6a __ __ ROR
17ed : 05 0b __ ORA WORK + 8 
17ef : 85 1d __ STA ACCU + 2 
17f1 : a5 0a __ LDA WORK + 7 
17f3 : 85 1c __ STA ACCU + 1 
17f5 : a5 09 __ LDA WORK + 6 
17f7 : 85 1b __ STA ACCU + 0 
17f9 : 60 __ __ RTS
17fa : a9 00 __ LDA #$00
17fc : 85 1e __ STA ACCU + 3 
17fe : 85 1d __ STA ACCU + 2 
1800 : 85 1c __ STA ACCU + 1 
1802 : 85 1b __ STA ACCU + 0 
1804 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1805 : 24 1c __ BIT ACCU + 1 
1807 : 10 0d __ BPL $1816 ; (divs16 + 17)
1809 : 20 23 18 JSR $1823 ; (negaccu + 0)
180c : 24 04 __ BIT WORK + 1 
180e : 10 0d __ BPL $181d ; (divs16 + 24)
1810 : 20 31 18 JSR $1831 ; (negtmp + 0)
1813 : 4c 3f 18 JMP $183f ; (divmod + 0)
1816 : 24 04 __ BIT WORK + 1 
1818 : 10 f9 __ BPL $1813 ; (divs16 + 14)
181a : 20 31 18 JSR $1831 ; (negtmp + 0)
181d : 20 3f 18 JSR $183f ; (divmod + 0)
1820 : 4c 23 18 JMP $1823 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1823 : 38 __ __ SEC
1824 : a9 00 __ LDA #$00
1826 : e5 1b __ SBC ACCU + 0 
1828 : 85 1b __ STA ACCU + 0 
182a : a9 00 __ LDA #$00
182c : e5 1c __ SBC ACCU + 1 
182e : 85 1c __ STA ACCU + 1 
1830 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1831 : 38 __ __ SEC
1832 : a9 00 __ LDA #$00
1834 : e5 03 __ SBC WORK + 0 
1836 : 85 03 __ STA WORK + 0 
1838 : a9 00 __ LDA #$00
183a : e5 04 __ SBC WORK + 1 
183c : 85 04 __ STA WORK + 1 
183e : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
183f : a5 1c __ LDA ACCU + 1 
1841 : d0 31 __ BNE $1874 ; (divmod + 53)
1843 : a5 04 __ LDA WORK + 1 
1845 : d0 1e __ BNE $1865 ; (divmod + 38)
1847 : 85 06 __ STA WORK + 3 
1849 : a2 04 __ LDX #$04
184b : 06 1b __ ASL ACCU + 0 
184d : 2a __ __ ROL
184e : c5 03 __ CMP WORK + 0 
1850 : 90 02 __ BCC $1854 ; (divmod + 21)
1852 : e5 03 __ SBC WORK + 0 
1854 : 26 1b __ ROL ACCU + 0 
1856 : 2a __ __ ROL
1857 : c5 03 __ CMP WORK + 0 
1859 : 90 02 __ BCC $185d ; (divmod + 30)
185b : e5 03 __ SBC WORK + 0 
185d : 26 1b __ ROL ACCU + 0 
185f : ca __ __ DEX
1860 : d0 eb __ BNE $184d ; (divmod + 14)
1862 : 85 05 __ STA WORK + 2 
1864 : 60 __ __ RTS
1865 : a5 1b __ LDA ACCU + 0 
1867 : 85 05 __ STA WORK + 2 
1869 : a5 1c __ LDA ACCU + 1 
186b : 85 06 __ STA WORK + 3 
186d : a9 00 __ LDA #$00
186f : 85 1b __ STA ACCU + 0 
1871 : 85 1c __ STA ACCU + 1 
1873 : 60 __ __ RTS
1874 : a5 04 __ LDA WORK + 1 
1876 : d0 1f __ BNE $1897 ; (divmod + 88)
1878 : a5 03 __ LDA WORK + 0 
187a : 30 1b __ BMI $1897 ; (divmod + 88)
187c : a9 00 __ LDA #$00
187e : 85 06 __ STA WORK + 3 
1880 : a2 10 __ LDX #$10
1882 : 06 1b __ ASL ACCU + 0 
1884 : 26 1c __ ROL ACCU + 1 
1886 : 2a __ __ ROL
1887 : c5 03 __ CMP WORK + 0 
1889 : 90 02 __ BCC $188d ; (divmod + 78)
188b : e5 03 __ SBC WORK + 0 
188d : 26 1b __ ROL ACCU + 0 
188f : 26 1c __ ROL ACCU + 1 
1891 : ca __ __ DEX
1892 : d0 f2 __ BNE $1886 ; (divmod + 71)
1894 : 85 05 __ STA WORK + 2 
1896 : 60 __ __ RTS
1897 : a9 00 __ LDA #$00
1899 : 85 05 __ STA WORK + 2 
189b : 85 06 __ STA WORK + 3 
189d : 84 02 __ STY $02 
189f : a0 10 __ LDY #$10
18a1 : 18 __ __ CLC
18a2 : 26 1b __ ROL ACCU + 0 
18a4 : 26 1c __ ROL ACCU + 1 
18a6 : 26 05 __ ROL WORK + 2 
18a8 : 26 06 __ ROL WORK + 3 
18aa : 38 __ __ SEC
18ab : a5 05 __ LDA WORK + 2 
18ad : e5 03 __ SBC WORK + 0 
18af : aa __ __ TAX
18b0 : a5 06 __ LDA WORK + 3 
18b2 : e5 04 __ SBC WORK + 1 
18b4 : 90 04 __ BCC $18ba ; (divmod + 123)
18b6 : 86 05 __ STX WORK + 2 
18b8 : 85 06 __ STA WORK + 3 
18ba : 88 __ __ DEY
18bb : d0 e5 __ BNE $18a2 ; (divmod + 99)
18bd : 26 1b __ ROL ACCU + 0 
18bf : 26 1c __ ROL ACCU + 1 
18c1 : a4 02 __ LDY $02 
18c3 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
18c4 : 24 1c __ BIT ACCU + 1 
18c6 : 10 10 __ BPL $18d8 ; (mods16 + 20)
18c8 : 20 23 18 JSR $1823 ; (negaccu + 0)
18cb : 24 04 __ BIT WORK + 1 
18cd : 10 03 __ BPL $18d2 ; (mods16 + 14)
18cf : 20 31 18 JSR $1831 ; (negtmp + 0)
18d2 : 20 3f 18 JSR $183f ; (divmod + 0)
18d5 : 4c e3 18 JMP $18e3 ; (negtmpb + 0)
18d8 : 24 04 __ BIT WORK + 1 
18da : 10 03 __ BPL $18df ; (mods16 + 27)
18dc : 20 31 18 JSR $1831 ; (negtmp + 0)
18df : 4c 3f 18 JMP $183f ; (divmod + 0)
18e2 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
18e3 : 38 __ __ SEC
18e4 : a9 00 __ LDA #$00
18e6 : e5 05 __ SBC WORK + 2 
18e8 : 85 05 __ STA WORK + 2 
18ea : a9 00 __ LDA #$00
18ec : e5 06 __ SBC WORK + 3 
18ee : 85 06 __ STA WORK + 3 
18f0 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
18f1 : 20 81 15 JSR $1581 ; (freg + 36)
18f4 : a5 07 __ LDA WORK + 4 
18f6 : c9 7f __ CMP #$7f
18f8 : b0 07 __ BCS $1901 ; (f32_to_i16 + 16)
18fa : a9 00 __ LDA #$00
18fc : 85 1b __ STA ACCU + 0 
18fe : 85 1c __ STA ACCU + 1 
1900 : 60 __ __ RTS
1901 : e9 8e __ SBC #$8e
1903 : 90 16 __ BCC $191b ; (f32_to_i16 + 42)
1905 : 24 1e __ BIT ACCU + 3 
1907 : 30 09 __ BMI $1912 ; (f32_to_i16 + 33)
1909 : a9 ff __ LDA #$ff
190b : 85 1b __ STA ACCU + 0 
190d : a9 7f __ LDA #$7f
190f : 85 1c __ STA ACCU + 1 
1911 : 60 __ __ RTS
1912 : a9 00 __ LDA #$00
1914 : 85 1b __ STA ACCU + 0 
1916 : a9 80 __ LDA #$80
1918 : 85 1c __ STA ACCU + 1 
191a : 60 __ __ RTS
191b : aa __ __ TAX
191c : a5 1c __ LDA ACCU + 1 
191e : 46 1d __ LSR ACCU + 2 
1920 : 6a __ __ ROR
1921 : e8 __ __ INX
1922 : d0 fa __ BNE $191e ; (f32_to_i16 + 45)
1924 : 24 1e __ BIT ACCU + 3 
1926 : 10 0e __ BPL $1936 ; (f32_to_i16 + 69)
1928 : 38 __ __ SEC
1929 : 49 ff __ EOR #$ff
192b : 69 00 __ ADC #$00
192d : 85 1b __ STA ACCU + 0 
192f : a9 00 __ LDA #$00
1931 : e5 1d __ SBC ACCU + 2 
1933 : 85 1c __ STA ACCU + 1 
1935 : 60 __ __ RTS
1936 : 85 1b __ STA ACCU + 0 
1938 : a5 1d __ LDA ACCU + 2 
193a : 85 1c __ STA ACCU + 1 
193c : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
193d : 24 1c __ BIT ACCU + 1 
193f : 30 03 __ BMI $1944 ; (sint16_to_float + 7)
1941 : 4c 5b 19 JMP $195b ; (uint16_to_float + 0)
1944 : 38 __ __ SEC
1945 : a9 00 __ LDA #$00
1947 : e5 1b __ SBC ACCU + 0 
1949 : 85 1b __ STA ACCU + 0 
194b : a9 00 __ LDA #$00
194d : e5 1c __ SBC ACCU + 1 
194f : 85 1c __ STA ACCU + 1 
1951 : 20 5b 19 JSR $195b ; (uint16_to_float + 0)
1954 : a5 1e __ LDA ACCU + 3 
1956 : 09 80 __ ORA #$80
1958 : 85 1e __ STA ACCU + 3 
195a : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
195b : a5 1b __ LDA ACCU + 0 
195d : 05 1c __ ORA ACCU + 1 
195f : d0 05 __ BNE $1966 ; (uint16_to_float + 11)
1961 : 85 1d __ STA ACCU + 2 
1963 : 85 1e __ STA ACCU + 3 
1965 : 60 __ __ RTS
1966 : a2 8e __ LDX #$8e
1968 : a5 1c __ LDA ACCU + 1 
196a : 30 06 __ BMI $1972 ; (uint16_to_float + 23)
196c : ca __ __ DEX
196d : 06 1b __ ASL ACCU + 0 
196f : 2a __ __ ROL
1970 : 10 fa __ BPL $196c ; (uint16_to_float + 17)
1972 : 0a __ __ ASL
1973 : 85 1d __ STA ACCU + 2 
1975 : a5 1b __ LDA ACCU + 0 
1977 : 85 1c __ STA ACCU + 1 
1979 : 8a __ __ TXA
197a : 4a __ __ LSR
197b : 85 1e __ STA ACCU + 3 
197d : a9 00 __ LDA #$00
197f : 85 1b __ STA ACCU + 0 
1981 : 66 1d __ ROR ACCU + 2 
1983 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1984 : 84 02 __ STY $02 
1986 : a0 20 __ LDY #$20
1988 : a9 00 __ LDA #$00
198a : 85 07 __ STA WORK + 4 
198c : 85 08 __ STA WORK + 5 
198e : 85 09 __ STA WORK + 6 
1990 : 85 0a __ STA WORK + 7 
1992 : a5 05 __ LDA WORK + 2 
1994 : 05 06 __ ORA WORK + 3 
1996 : d0 78 __ BNE $1a10 ; (divmod32 + 140)
1998 : a5 04 __ LDA WORK + 1 
199a : d0 27 __ BNE $19c3 ; (divmod32 + 63)
199c : 18 __ __ CLC
199d : 26 1b __ ROL ACCU + 0 
199f : 26 1c __ ROL ACCU + 1 
19a1 : 26 1d __ ROL ACCU + 2 
19a3 : 26 1e __ ROL ACCU + 3 
19a5 : 2a __ __ ROL
19a6 : 90 05 __ BCC $19ad ; (divmod32 + 41)
19a8 : e5 03 __ SBC WORK + 0 
19aa : 38 __ __ SEC
19ab : b0 06 __ BCS $19b3 ; (divmod32 + 47)
19ad : c5 03 __ CMP WORK + 0 
19af : 90 02 __ BCC $19b3 ; (divmod32 + 47)
19b1 : e5 03 __ SBC WORK + 0 
19b3 : 88 __ __ DEY
19b4 : d0 e7 __ BNE $199d ; (divmod32 + 25)
19b6 : 85 07 __ STA WORK + 4 
19b8 : 26 1b __ ROL ACCU + 0 
19ba : 26 1c __ ROL ACCU + 1 
19bc : 26 1d __ ROL ACCU + 2 
19be : 26 1e __ ROL ACCU + 3 
19c0 : a4 02 __ LDY $02 
19c2 : 60 __ __ RTS
19c3 : a5 1e __ LDA ACCU + 3 
19c5 : d0 10 __ BNE $19d7 ; (divmod32 + 83)
19c7 : a6 1d __ LDX ACCU + 2 
19c9 : 86 1e __ STX ACCU + 3 
19cb : a6 1c __ LDX ACCU + 1 
19cd : 86 1d __ STX ACCU + 2 
19cf : a6 1b __ LDX ACCU + 0 
19d1 : 86 1c __ STX ACCU + 1 
19d3 : 85 1b __ STA ACCU + 0 
19d5 : a0 18 __ LDY #$18
19d7 : 18 __ __ CLC
19d8 : 26 1b __ ROL ACCU + 0 
19da : 26 1c __ ROL ACCU + 1 
19dc : 26 1d __ ROL ACCU + 2 
19de : 26 1e __ ROL ACCU + 3 
19e0 : 26 07 __ ROL WORK + 4 
19e2 : 26 08 __ ROL WORK + 5 
19e4 : 90 0c __ BCC $19f2 ; (divmod32 + 110)
19e6 : a5 07 __ LDA WORK + 4 
19e8 : e5 03 __ SBC WORK + 0 
19ea : aa __ __ TAX
19eb : a5 08 __ LDA WORK + 5 
19ed : e5 04 __ SBC WORK + 1 
19ef : 38 __ __ SEC
19f0 : b0 0c __ BCS $19fe ; (divmod32 + 122)
19f2 : 38 __ __ SEC
19f3 : a5 07 __ LDA WORK + 4 
19f5 : e5 03 __ SBC WORK + 0 
19f7 : aa __ __ TAX
19f8 : a5 08 __ LDA WORK + 5 
19fa : e5 04 __ SBC WORK + 1 
19fc : 90 04 __ BCC $1a02 ; (divmod32 + 126)
19fe : 86 07 __ STX WORK + 4 
1a00 : 85 08 __ STA WORK + 5 
1a02 : 88 __ __ DEY
1a03 : d0 d3 __ BNE $19d8 ; (divmod32 + 84)
1a05 : 26 1b __ ROL ACCU + 0 
1a07 : 26 1c __ ROL ACCU + 1 
1a09 : 26 1d __ ROL ACCU + 2 
1a0b : 26 1e __ ROL ACCU + 3 
1a0d : a4 02 __ LDY $02 
1a0f : 60 __ __ RTS
1a10 : a0 10 __ LDY #$10
1a12 : a5 1e __ LDA ACCU + 3 
1a14 : 85 08 __ STA WORK + 5 
1a16 : a5 1d __ LDA ACCU + 2 
1a18 : 85 07 __ STA WORK + 4 
1a1a : a9 00 __ LDA #$00
1a1c : 85 1d __ STA ACCU + 2 
1a1e : 85 1e __ STA ACCU + 3 
1a20 : 18 __ __ CLC
1a21 : 26 1b __ ROL ACCU + 0 
1a23 : 26 1c __ ROL ACCU + 1 
1a25 : 26 07 __ ROL WORK + 4 
1a27 : 26 08 __ ROL WORK + 5 
1a29 : 26 09 __ ROL WORK + 6 
1a2b : 26 0a __ ROL WORK + 7 
1a2d : a5 07 __ LDA WORK + 4 
1a2f : c5 03 __ CMP WORK + 0 
1a31 : a5 08 __ LDA WORK + 5 
1a33 : e5 04 __ SBC WORK + 1 
1a35 : a5 09 __ LDA WORK + 6 
1a37 : e5 05 __ SBC WORK + 2 
1a39 : aa __ __ TAX
1a3a : a5 0a __ LDA WORK + 7 
1a3c : e5 06 __ SBC WORK + 3 
1a3e : 90 11 __ BCC $1a51 ; (divmod32 + 205)
1a40 : 86 09 __ STX WORK + 6 
1a42 : 85 0a __ STA WORK + 7 
1a44 : a5 07 __ LDA WORK + 4 
1a46 : e5 03 __ SBC WORK + 0 
1a48 : 85 07 __ STA WORK + 4 
1a4a : a5 08 __ LDA WORK + 5 
1a4c : e5 04 __ SBC WORK + 1 
1a4e : 85 08 __ STA WORK + 5 
1a50 : 38 __ __ SEC
1a51 : 88 __ __ DEY
1a52 : d0 cd __ BNE $1a21 ; (divmod32 + 157)
1a54 : 26 1b __ ROL ACCU + 0 
1a56 : 26 1c __ ROL ACCU + 1 
1a58 : a4 02 __ LDY $02 
1a5a : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1a5b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1a5c : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1a5d : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1a6d : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
