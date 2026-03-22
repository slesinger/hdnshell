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
080e : 8e 84 1b STX $1b84 ; (spentry + 0)
0811 : a2 1b __ LDX #$1b
0813 : a0 a2 __ LDY #$a2
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1b __ CPX #$1b
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 b2 __ CPY #$b2
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 6e __ LDA #$6e
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
;   4, "/home/honza/projects/c64/projects/oscar64/samples/kernalio/diskdir.c"
.s1:
0880 : a5 53 __ LDA T2 + 0 
0882 : 8d 70 9f STA $9f70 ; (main@stack + 0)
0885 : a5 54 __ LDA T2 + 1 
0887 : 8d 71 9f STA $9f71 ; (main@stack + 1)
088a : a5 55 __ LDA T3 + 0 
088c : 8d 72 9f STA $9f72 ; (main@stack + 2)
.s4:
088f : a9 55 __ LDA #$55
0891 : 85 0d __ STA P0 
0893 : a9 09 __ LDA #$09
0895 : 85 0e __ STA P1 
0897 : 20 3f 09 JSR $093f ; (krnio_setnam.s4 + 0)
089a : a9 02 __ LDA #$02
089c : 85 0d __ STA P0 
089e : a9 00 __ LDA #$00
08a0 : 85 0f __ STA P2 
08a2 : a9 09 __ LDA #$09
08a4 : 85 0e __ STA P1 
08a6 : 20 57 09 JSR $0957 ; (krnio_open.s4 + 0)
08a9 : aa __ __ TAX
08aa : d0 1b __ BNE $08c7 ; (main.s6 + 0)
.s5:
08ac : a9 6c __ LDA #$6c
08ae : 8d fa 9f STA $9ffa ; (sstack + 8)
08b1 : a9 16 __ LDA #$16
08b3 : 8d fb 9f STA $9ffb ; (sstack + 9)
08b6 : 20 7a 16 JSR $167a ; (krnio_status.s4 + 0)
08b9 : 8d fc 9f STA $9ffc ; (sstack + 10)
08bc : a9 00 __ LDA #$00
08be : 8d fd 9f STA $9ffd ; (sstack + 11)
08c1 : 20 a2 09 JSR $09a2 ; (printf.s4 + 0)
08c4 : 4c 07 09 JMP $0907 ; (main.s3 + 0)
.s6:
08c7 : a9 02 __ LDA #$02
08c9 : 20 85 09 JSR $0985 ; (krnio_chkin.s4 + 0)
08cc : aa __ __ TAX
08cd : f0 33 __ BEQ $0902 ; (main.s14 + 0)
.s7:
08cf : 20 9a 09 JSR $099a ; (krnio_chrin.s4 + 0)
08d2 : 20 9a 09 JSR $099a ; (krnio_chrin.s4 + 0)
08d5 : 4c f9 08 JMP $08f9 ; (main.l8 + 0)
.s12:
08d8 : a5 53 __ LDA T2 + 0 
08da : 8d fc 9f STA $9ffc ; (sstack + 10)
08dd : a5 54 __ LDA T2 + 1 
08df : 8d fd 9f STA $9ffd ; (sstack + 11)
08e2 : a9 59 __ LDA #$59
08e4 : 8d fa 9f STA $9ffa ; (sstack + 8)
08e7 : a9 16 __ LDA #$16
08e9 : 8d fb 9f STA $9ffb ; (sstack + 9)
08ec : a9 76 __ LDA #$76
08ee : 8d fe 9f STA $9ffe ; (sstack + 12)
08f1 : a9 9f __ LDA #$9f
08f3 : 8d ff 9f STA $9fff ; (sstack + 13)
08f6 : 20 a2 09 JSR $09a2 ; (printf.s4 + 0)
.l8:
08f9 : 20 9a 09 JSR $099a ; (krnio_chrin.s4 + 0)
08fc : aa __ __ TAX
08fd : d0 1e __ BNE $091d ; (main.s10 + 0)
.s9:
08ff : 20 60 16 JSR $1660 ; (krnio_clrchn.s4 + 0)
.s14:
0902 : a9 02 __ LDA #$02
0904 : 20 64 16 JSR $1664 ; (krnio_close.s4 + 0)
.s3:
0907 : a9 00 __ LDA #$00
0909 : 85 1b __ STA ACCU + 0 
090b : 85 1c __ STA ACCU + 1 
090d : ad 70 9f LDA $9f70 ; (main@stack + 0)
0910 : 85 53 __ STA T2 + 0 
0912 : ad 71 9f LDA $9f71 ; (main@stack + 1)
0915 : 85 54 __ STA T2 + 1 
0917 : ad 72 9f LDA $9f72 ; (main@stack + 2)
091a : 85 55 __ STA T3 + 0 
091c : 60 __ __ RTS
.s10:
091d : 20 9a 09 JSR $099a ; (krnio_chrin.s4 + 0)
0920 : 20 9a 09 JSR $099a ; (krnio_chrin.s4 + 0)
0923 : 85 53 __ STA T2 + 0 
0925 : 20 9a 09 JSR $099a ; (krnio_chrin.s4 + 0)
0928 : 85 54 __ STA T2 + 1 
092a : a9 00 __ LDA #$00
092c : 85 55 __ STA T3 + 0 
092e : f0 02 __ BEQ $0932 ; (main.l11 + 0)
.s13:
0930 : e6 55 __ INC T3 + 0 
.l11:
0932 : 20 9a 09 JSR $099a ; (krnio_chrin.s4 + 0)
0935 : a6 55 __ LDX T3 + 0 
0937 : a8 __ __ TAY
0938 : 9d 76 9f STA $9f76,x ; (buff[0] + 0)
093b : d0 f3 __ BNE $0930 ; (main.s13 + 0)
093d : f0 99 __ BEQ $08d8 ; (main.s12 + 0)
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
093f : a5 0d __ LDA P0 
0941 : 05 0e __ ORA P1 
0943 : f0 08 __ BEQ $094d ; (krnio_setnam.s4 + 14)
0945 : a0 ff __ LDY #$ff
0947 : c8 __ __ INY
0948 : b1 0d __ LDA (P0),y 
094a : d0 fb __ BNE $0947 ; (krnio_setnam.s4 + 8)
094c : 98 __ __ TYA
094d : a6 0d __ LDX P0 
094f : a4 0e __ LDY P1 
0951 : 20 bd ff JSR $ffbd 
.s3:
0954 : 60 __ __ RTS
--------------------------------------------------------------------
0955 : __ __ __ BYT 24 00                                           : $.
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0957 : a9 00 __ LDA #$00
0959 : a6 0d __ LDX P0 ; (fnum + 0)
095b : 9d a2 1b STA $1ba2,x ; (krnio_pstatus[0] + 0)
095e : a9 00 __ LDA #$00
0960 : 85 1b __ STA ACCU + 0 
0962 : 85 1c __ STA ACCU + 1 
0964 : a5 0d __ LDA P0 ; (fnum + 0)
0966 : a6 0e __ LDX P1 
0968 : a4 0f __ LDY P2 
096a : 20 ba ff JSR $ffba 
096d : 20 c0 ff JSR $ffc0 
0970 : 90 08 __ BCC $097a ; (krnio_open.s4 + 35)
0972 : a5 0d __ LDA P0 ; (fnum + 0)
0974 : 20 c3 ff JSR $ffc3 
0977 : 4c 7e 09 JMP $097e ; (krnio_open.s4 + 39)
097a : a9 01 __ LDA #$01
097c : 85 1b __ STA ACCU + 0 
097e : a5 1b __ LDA ACCU + 0 
0980 : f0 02 __ BEQ $0984 ; (krnio_open.s3 + 0)
.s5:
0982 : a9 01 __ LDA #$01
.s3:
0984 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0985 : 85 0d __ STA P0 
0987 : a6 0d __ LDX P0 
0989 : 20 c6 ff JSR $ffc6 
098c : a9 00 __ LDA #$00
098e : 2a __ __ ROL
098f : 49 01 __ EOR #$01
0991 : 85 1b __ STA ACCU + 0 
0993 : a5 1b __ LDA ACCU + 0 
0995 : f0 02 __ BEQ $0999 ; (krnio_chkin.s3 + 0)
.s5:
0997 : a9 01 __ LDA #$01
.s3:
0999 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
099a : 20 cf ff JSR $ffcf 
099d : 85 1b __ STA ACCU + 0 
.s3:
099f : a5 1b __ LDA ACCU + 0 
09a1 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
09a2 : a9 01 __ LDA #$01
09a4 : 8d f9 9f STA $9ff9 ; (sstack + 7)
09a7 : a9 9e __ LDA #$9e
09a9 : 8d f3 9f STA $9ff3 ; (sstack + 1)
09ac : a9 9f __ LDA #$9f
09ae : 8d f4 9f STA $9ff4 ; (sstack + 2)
09b1 : ad fa 9f LDA $9ffa ; (sstack + 8)
09b4 : 8d f5 9f STA $9ff5 ; (sstack + 3)
09b7 : ad fb 9f LDA $9ffb ; (sstack + 9)
09ba : 8d f6 9f STA $9ff6 ; (sstack + 4)
09bd : a9 fc __ LDA #$fc
09bf : 8d f7 9f STA $9ff7 ; (sstack + 5)
09c2 : a9 9f __ LDA #$9f
09c4 : 8d f8 9f STA $9ff8 ; (sstack + 6)
09c7 : 4c ca 09 JMP $09ca ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
09ca : a2 09 __ LDX #$09
09cc : b5 53 __ LDA T1 + 0,x 
09ce : 9d d0 9f STA $9fd0,x ; (sformat@stack + 0)
09d1 : ca __ __ DEX
09d2 : 10 f8 __ BPL $09cc ; (sformat.s1 + 2)
.s4:
09d4 : ad f5 9f LDA $9ff5 ; (sstack + 3)
09d7 : 85 55 __ STA T3 + 0 
09d9 : a9 00 __ LDA #$00
09db : 85 5b __ STA T6 + 0 
09dd : ad f6 9f LDA $9ff6 ; (sstack + 4)
09e0 : 85 56 __ STA T3 + 1 
09e2 : ad f3 9f LDA $9ff3 ; (sstack + 1)
09e5 : 85 57 __ STA T4 + 0 
09e7 : ad f4 9f LDA $9ff4 ; (sstack + 2)
09ea : 85 58 __ STA T4 + 1 
.l5:
09ec : a0 00 __ LDY #$00
09ee : b1 55 __ LDA (T3 + 0),y 
09f0 : d0 36 __ BNE $0a28 ; (sformat.s10 + 0)
.s6:
09f2 : a4 5b __ LDY T6 + 0 
09f4 : 91 57 __ STA (T4 + 0),y 
09f6 : 98 __ __ TYA
09f7 : f0 28 __ BEQ $0a21 ; (sformat.s95 + 0)
.s7:
09f9 : ad f9 9f LDA $9ff9 ; (sstack + 7)
09fc : d0 18 __ BNE $0a16 ; (sformat.s9 + 0)
.s8:
09fe : 98 __ __ TYA
09ff : 18 __ __ CLC
0a00 : 65 57 __ ADC T4 + 0 
0a02 : aa __ __ TAX
0a03 : a5 58 __ LDA T4 + 1 
0a05 : 69 00 __ ADC #$00
.s3:
0a07 : 86 1b __ STX ACCU + 0 ; (buff + 1)
0a09 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0a0b : a2 09 __ LDX #$09
0a0d : bd d0 9f LDA $9fd0,x ; (sformat@stack + 0)
0a10 : 95 53 __ STA T1 + 0,x 
0a12 : ca __ __ DEX
0a13 : 10 f8 __ BPL $0a0d ; (sformat.s3 + 6)
0a15 : 60 __ __ RTS
.s9:
0a16 : a5 57 __ LDA T4 + 0 
0a18 : 85 0e __ STA P1 
0a1a : a5 58 __ LDA T4 + 1 
0a1c : 85 0f __ STA P2 
0a1e : 20 0b 0e JSR $0e0b ; (puts.l4 + 0)
.s95:
0a21 : a5 58 __ LDA T4 + 1 
0a23 : a6 57 __ LDX T4 + 0 
0a25 : 4c 07 0a JMP $0a07 ; (sformat.s3 + 0)
.s10:
0a28 : c9 25 __ CMP #$25
0a2a : f0 3e __ BEQ $0a6a ; (sformat.s15 + 0)
.s11:
0a2c : a4 5b __ LDY T6 + 0 
0a2e : 91 57 __ STA (T4 + 0),y 
0a30 : e6 55 __ INC T3 + 0 
0a32 : d0 02 __ BNE $0a36 ; (sformat.s117 + 0)
.s116:
0a34 : e6 56 __ INC T3 + 1 
.s117:
0a36 : c8 __ __ INY
0a37 : 84 5b __ STY T6 + 0 
0a39 : 98 __ __ TYA
0a3a : c0 28 __ CPY #$28
0a3c : 90 ae __ BCC $09ec ; (sformat.l5 + 0)
.s12:
0a3e : 85 43 __ STA T0 + 0 
0a40 : a9 00 __ LDA #$00
0a42 : 85 5b __ STA T6 + 0 
0a44 : ad f9 9f LDA $9ff9 ; (sstack + 7)
0a47 : f0 14 __ BEQ $0a5d ; (sformat.s13 + 0)
.s14:
0a49 : a5 57 __ LDA T4 + 0 
0a4b : 85 0e __ STA P1 
0a4d : a5 58 __ LDA T4 + 1 
0a4f : 85 0f __ STA P2 
0a51 : a9 00 __ LDA #$00
0a53 : a4 43 __ LDY T0 + 0 
0a55 : 91 0e __ STA (P1),y 
0a57 : 20 0b 0e JSR $0e0b ; (puts.l4 + 0)
0a5a : 4c ec 09 JMP $09ec ; (sformat.l5 + 0)
.s13:
0a5d : 18 __ __ CLC
0a5e : a5 57 __ LDA T4 + 0 
0a60 : 65 43 __ ADC T0 + 0 
0a62 : 85 57 __ STA T4 + 0 
0a64 : 90 86 __ BCC $09ec ; (sformat.l5 + 0)
.s118:
0a66 : e6 58 __ INC T4 + 1 
0a68 : b0 82 __ BCS $09ec ; (sformat.l5 + 0)
.s15:
0a6a : a5 5b __ LDA T6 + 0 
0a6c : f0 27 __ BEQ $0a95 ; (sformat.s16 + 0)
.s89:
0a6e : 84 5b __ STY T6 + 0 
0a70 : 85 43 __ STA T0 + 0 
0a72 : ad f9 9f LDA $9ff9 ; (sstack + 7)
0a75 : f0 13 __ BEQ $0a8a ; (sformat.s90 + 0)
.s91:
0a77 : a5 57 __ LDA T4 + 0 
0a79 : 85 0e __ STA P1 
0a7b : a5 58 __ LDA T4 + 1 
0a7d : 85 0f __ STA P2 
0a7f : 98 __ __ TYA
0a80 : a4 43 __ LDY T0 + 0 
0a82 : 91 0e __ STA (P1),y 
0a84 : 20 0b 0e JSR $0e0b ; (puts.l4 + 0)
0a87 : 4c 95 0a JMP $0a95 ; (sformat.s16 + 0)
.s90:
0a8a : 18 __ __ CLC
0a8b : a5 57 __ LDA T4 + 0 
0a8d : 65 43 __ ADC T0 + 0 
0a8f : 85 57 __ STA T4 + 0 
0a91 : 90 02 __ BCC $0a95 ; (sformat.s16 + 0)
.s115:
0a93 : e6 58 __ INC T4 + 1 
.s16:
0a95 : a9 00 __ LDA #$00
0a97 : 8d df 9f STA $9fdf ; (si.sign + 0)
0a9a : 8d e0 9f STA $9fe0 ; (si.left + 0)
0a9d : 8d e1 9f STA $9fe1 ; (si.prefix + 0)
0aa0 : a0 01 __ LDY #$01
0aa2 : b1 55 __ LDA (T3 + 0),y 
0aa4 : a2 20 __ LDX #$20
0aa6 : 8e da 9f STX $9fda ; (si.fill + 0)
0aa9 : a2 00 __ LDX #$00
0aab : 8e db 9f STX $9fdb ; (si.width + 0)
0aae : ca __ __ DEX
0aaf : 8e dc 9f STX $9fdc ; (si.precision + 0)
0ab2 : a2 0a __ LDX #$0a
0ab4 : 8e de 9f STX $9fde ; (si.base + 0)
0ab7 : aa __ __ TAX
0ab8 : a9 02 __ LDA #$02
0aba : d0 07 __ BNE $0ac3 ; (sformat.l17 + 0)
.s85:
0abc : a0 00 __ LDY #$00
0abe : b1 55 __ LDA (T3 + 0),y 
0ac0 : aa __ __ TAX
0ac1 : a9 01 __ LDA #$01
.l17:
0ac3 : 18 __ __ CLC
0ac4 : 65 55 __ ADC T3 + 0 
0ac6 : 85 55 __ STA T3 + 0 
0ac8 : 90 02 __ BCC $0acc ; (sformat.s106 + 0)
.s105:
0aca : e6 56 __ INC T3 + 1 
.s106:
0acc : 8a __ __ TXA
0acd : e0 2b __ CPX #$2b
0acf : d0 07 __ BNE $0ad8 ; (sformat.s18 + 0)
.s88:
0ad1 : a9 01 __ LDA #$01
0ad3 : 8d df 9f STA $9fdf ; (si.sign + 0)
0ad6 : d0 e4 __ BNE $0abc ; (sformat.s85 + 0)
.s18:
0ad8 : c9 30 __ CMP #$30
0ada : d0 06 __ BNE $0ae2 ; (sformat.s19 + 0)
.s87:
0adc : 8d da 9f STA $9fda ; (si.fill + 0)
0adf : 4c bc 0a JMP $0abc ; (sformat.s85 + 0)
.s19:
0ae2 : c9 23 __ CMP #$23
0ae4 : d0 07 __ BNE $0aed ; (sformat.s20 + 0)
.s86:
0ae6 : a9 01 __ LDA #$01
0ae8 : 8d e1 9f STA $9fe1 ; (si.prefix + 0)
0aeb : d0 cf __ BNE $0abc ; (sformat.s85 + 0)
.s20:
0aed : c9 2d __ CMP #$2d
0aef : d0 07 __ BNE $0af8 ; (sformat.s21 + 0)
.s84:
0af1 : a9 01 __ LDA #$01
0af3 : 8d e0 9f STA $9fe0 ; (si.left + 0)
0af6 : d0 c4 __ BNE $0abc ; (sformat.s85 + 0)
.s21:
0af8 : 85 47 __ STA T2 + 0 
0afa : c9 30 __ CMP #$30
0afc : 90 3c __ BCC $0b3a ; (sformat.s22 + 0)
.s80:
0afe : c9 3a __ CMP #$3a
0b00 : b0 77 __ BCS $0b79 ; (sformat.s23 + 0)
.s81:
0b02 : a9 00 __ LDA #$00
0b04 : 85 53 __ STA T1 + 0 
.l82:
0b06 : a5 53 __ LDA T1 + 0 
0b08 : 0a __ __ ASL
0b09 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0b0b : a9 00 __ LDA #$00
0b0d : 2a __ __ ROL
0b0e : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0b10 : 2a __ __ ROL
0b11 : aa __ __ TAX
0b12 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b14 : 65 53 __ ADC T1 + 0 
0b16 : 0a __ __ ASL
0b17 : 18 __ __ CLC
0b18 : 65 47 __ ADC T2 + 0 
0b1a : 38 __ __ SEC
0b1b : e9 30 __ SBC #$30
0b1d : 85 53 __ STA T1 + 0 
0b1f : a0 00 __ LDY #$00
0b21 : b1 55 __ LDA (T3 + 0),y 
0b23 : 85 47 __ STA T2 + 0 
0b25 : e6 55 __ INC T3 + 0 
0b27 : d0 02 __ BNE $0b2b ; (sformat.s114 + 0)
.s113:
0b29 : e6 56 __ INC T3 + 1 
.s114:
0b2b : c9 30 __ CMP #$30
0b2d : 90 04 __ BCC $0b33 ; (sformat.s104 + 0)
.s83:
0b2f : c9 3a __ CMP #$3a
0b31 : 90 d3 __ BCC $0b06 ; (sformat.l82 + 0)
.s104:
0b33 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0b35 : a6 53 __ LDX T1 + 0 
0b37 : 8e db 9f STX $9fdb ; (si.width + 0)
.s22:
0b3a : c9 2e __ CMP #$2e
0b3c : d0 3b __ BNE $0b79 ; (sformat.s23 + 0)
.s76:
0b3e : a9 00 __ LDA #$00
0b40 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0b42 : 4c 5c 0b JMP $0b5c ; (sformat.l77 + 0)
.s79:
0b45 : a5 43 __ LDA T0 + 0 
0b47 : 0a __ __ ASL
0b48 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0b4a : 98 __ __ TYA
0b4b : 2a __ __ ROL
0b4c : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0b4e : 2a __ __ ROL
0b4f : aa __ __ TAX
0b50 : 18 __ __ CLC
0b51 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b53 : 65 43 __ ADC T0 + 0 
0b55 : 0a __ __ ASL
0b56 : 18 __ __ CLC
0b57 : 65 47 __ ADC T2 + 0 
0b59 : 38 __ __ SEC
0b5a : e9 30 __ SBC #$30
.l77:
0b5c : 85 43 __ STA T0 + 0 
0b5e : a0 00 __ LDY #$00
0b60 : b1 55 __ LDA (T3 + 0),y 
0b62 : 85 47 __ STA T2 + 0 
0b64 : e6 55 __ INC T3 + 0 
0b66 : d0 02 __ BNE $0b6a ; (sformat.s108 + 0)
.s107:
0b68 : e6 56 __ INC T3 + 1 
.s108:
0b6a : c9 30 __ CMP #$30
0b6c : 90 04 __ BCC $0b72 ; (sformat.s103 + 0)
.s78:
0b6e : c9 3a __ CMP #$3a
0b70 : 90 d3 __ BCC $0b45 ; (sformat.s79 + 0)
.s103:
0b72 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0b74 : a6 43 __ LDX T0 + 0 
0b76 : 8e dc 9f STX $9fdc ; (si.precision + 0)
.s23:
0b79 : c9 64 __ CMP #$64
0b7b : f0 0c __ BEQ $0b89 ; (sformat.s75 + 0)
.s24:
0b7d : c9 44 __ CMP #$44
0b7f : f0 08 __ BEQ $0b89 ; (sformat.s75 + 0)
.s25:
0b81 : c9 69 __ CMP #$69
0b83 : f0 04 __ BEQ $0b89 ; (sformat.s75 + 0)
.s26:
0b85 : c9 49 __ CMP #$49
0b87 : d0 07 __ BNE $0b90 ; (sformat.s27 + 0)
.s75:
0b89 : a9 01 __ LDA #$01
.s93:
0b8b : 85 13 __ STA P6 
0b8d : 4c d1 0d JMP $0dd1 ; (sformat.s73 + 0)
.s27:
0b90 : c9 75 __ CMP #$75
0b92 : f0 04 __ BEQ $0b98 ; (sformat.s74 + 0)
.s28:
0b94 : c9 55 __ CMP #$55
0b96 : d0 04 __ BNE $0b9c ; (sformat.s29 + 0)
.s74:
0b98 : a9 00 __ LDA #$00
0b9a : f0 ef __ BEQ $0b8b ; (sformat.s93 + 0)
.s29:
0b9c : c9 78 __ CMP #$78
0b9e : f0 04 __ BEQ $0ba4 ; (sformat.s72 + 0)
.s30:
0ba0 : c9 58 __ CMP #$58
0ba2 : d0 15 __ BNE $0bb9 ; (sformat.s31 + 0)
.s72:
0ba4 : a5 47 __ LDA T2 + 0 
0ba6 : 29 e0 __ AND #$e0
0ba8 : 09 01 __ ORA #$01
0baa : 8d dd 9f STA $9fdd ; (si.cha + 0)
0bad : a9 00 __ LDA #$00
0baf : 85 13 __ STA P6 
0bb1 : a9 10 __ LDA #$10
0bb3 : 8d de 9f STA $9fde ; (si.base + 0)
0bb6 : 4c d1 0d JMP $0dd1 ; (sformat.s73 + 0)
.s31:
0bb9 : c9 6c __ CMP #$6c
0bbb : d0 03 __ BNE $0bc0 ; (sformat.s32 + 0)
0bbd : 4c 42 0d JMP $0d42 ; (sformat.s60 + 0)
.s32:
0bc0 : c9 4c __ CMP #$4c
0bc2 : f0 f9 __ BEQ $0bbd ; (sformat.s31 + 4)
.s33:
0bc4 : c9 66 __ CMP #$66
0bc6 : f0 14 __ BEQ $0bdc ; (sformat.s59 + 0)
.s34:
0bc8 : c9 67 __ CMP #$67
0bca : f0 10 __ BEQ $0bdc ; (sformat.s59 + 0)
.s35:
0bcc : c9 65 __ CMP #$65
0bce : f0 0c __ BEQ $0bdc ; (sformat.s59 + 0)
.s36:
0bd0 : c9 46 __ CMP #$46
0bd2 : f0 08 __ BEQ $0bdc ; (sformat.s59 + 0)
.s37:
0bd4 : c9 47 __ CMP #$47
0bd6 : f0 04 __ BEQ $0bdc ; (sformat.s59 + 0)
.s38:
0bd8 : c9 45 __ CMP #$45
0bda : d0 5c __ BNE $0c38 ; (sformat.s39 + 0)
.s59:
0bdc : a5 57 __ LDA T4 + 0 
0bde : 85 13 __ STA P6 
0be0 : a5 58 __ LDA T4 + 1 
0be2 : 85 14 __ STA P7 
0be4 : a5 47 __ LDA T2 + 0 
0be6 : 29 e0 __ AND #$e0
0be8 : 09 01 __ ORA #$01
0bea : 8d dd 9f STA $9fdd ; (si.cha + 0)
0bed : ad f7 9f LDA $9ff7 ; (sstack + 5)
0bf0 : 85 59 __ STA T5 + 0 
0bf2 : a9 da __ LDA #$da
0bf4 : 85 11 __ STA P4 
0bf6 : a9 9f __ LDA #$9f
0bf8 : 85 12 __ STA P5 
0bfa : ad f8 9f LDA $9ff8 ; (sstack + 6)
0bfd : 85 5a __ STA T5 + 1 
0bff : a0 00 __ LDY #$00
0c01 : b1 59 __ LDA (T5 + 0),y 
0c03 : 85 15 __ STA P8 
0c05 : c8 __ __ INY
0c06 : b1 59 __ LDA (T5 + 0),y 
0c08 : 85 16 __ STA P9 
0c0a : c8 __ __ INY
0c0b : b1 59 __ LDA (T5 + 0),y 
0c0d : 85 17 __ STA P10 
0c0f : c8 __ __ INY
0c10 : b1 59 __ LDA (T5 + 0),y 
0c12 : 85 18 __ STA P11 
0c14 : a5 47 __ LDA T2 + 0 
0c16 : ed dd 9f SBC $9fdd ; (si.cha + 0)
0c19 : 18 __ __ CLC
0c1a : 69 61 __ ADC #$61
0c1c : 8d f2 9f STA $9ff2 ; (sstack + 0)
0c1f : 20 e6 10 JSR $10e6 ; (nformf.s1 + 0)
0c22 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c24 : 85 5b __ STA T6 + 0 
0c26 : 18 __ __ CLC
0c27 : a5 59 __ LDA T5 + 0 
0c29 : 69 04 __ ADC #$04
0c2b : 8d f7 9f STA $9ff7 ; (sstack + 5)
0c2e : a5 5a __ LDA T5 + 1 
0c30 : 69 00 __ ADC #$00
0c32 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0c35 : 4c ec 09 JMP $09ec ; (sformat.l5 + 0)
.s39:
0c38 : c9 73 __ CMP #$73
0c3a : f0 3b __ BEQ $0c77 ; (sformat.s47 + 0)
.s40:
0c3c : c9 53 __ CMP #$53
0c3e : f0 37 __ BEQ $0c77 ; (sformat.s47 + 0)
.s41:
0c40 : c9 63 __ CMP #$63
0c42 : f0 12 __ BEQ $0c56 ; (sformat.s46 + 0)
.s42:
0c44 : c9 43 __ CMP #$43
0c46 : f0 0e __ BEQ $0c56 ; (sformat.s46 + 0)
.s43:
0c48 : aa __ __ TAX
0c49 : f0 ea __ BEQ $0c35 ; (sformat.s59 + 89)
.s44:
0c4b : a0 00 __ LDY #$00
0c4d : 91 57 __ STA (T4 + 0),y 
.s45:
0c4f : a9 01 __ LDA #$01
.s96:
0c51 : 85 5b __ STA T6 + 0 
0c53 : 4c ec 09 JMP $09ec ; (sformat.l5 + 0)
.s46:
0c56 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0c59 : 85 43 __ STA T0 + 0 
0c5b : ad f8 9f LDA $9ff8 ; (sstack + 6)
0c5e : 85 44 __ STA T0 + 1 
0c60 : a0 00 __ LDY #$00
0c62 : b1 43 __ LDA (T0 + 0),y 
0c64 : 91 57 __ STA (T4 + 0),y 
0c66 : a5 43 __ LDA T0 + 0 
0c68 : 69 01 __ ADC #$01
0c6a : 8d f7 9f STA $9ff7 ; (sstack + 5)
0c6d : a5 44 __ LDA T0 + 1 
0c6f : 69 00 __ ADC #$00
0c71 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0c74 : 4c 4f 0c JMP $0c4f ; (sformat.s45 + 0)
.s47:
0c77 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0c7a : 85 43 __ STA T0 + 0 
0c7c : 69 01 __ ADC #$01
0c7e : 8d f7 9f STA $9ff7 ; (sstack + 5)
0c81 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0c84 : 85 44 __ STA T0 + 1 
0c86 : 69 00 __ ADC #$00
0c88 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0c8b : a0 00 __ LDY #$00
0c8d : 84 5c __ STY T7 + 0 
0c8f : b1 43 __ LDA (T0 + 0),y 
0c91 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0c93 : 85 53 __ STA T1 + 0 
0c95 : c8 __ __ INY
0c96 : b1 43 __ LDA (T0 + 0),y 
0c98 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0c9a : 85 54 __ STA T1 + 1 
0c9c : ad db 9f LDA $9fdb ; (si.width + 0)
0c9f : f0 0c __ BEQ $0cad ; (sformat.s48 + 0)
.s100:
0ca1 : 88 __ __ DEY
0ca2 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0ca4 : f0 05 __ BEQ $0cab ; (sformat.s101 + 0)
.l58:
0ca6 : c8 __ __ INY
0ca7 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0ca9 : d0 fb __ BNE $0ca6 ; (sformat.l58 + 0)
.s101:
0cab : 84 5c __ STY T7 + 0 
.s48:
0cad : ad e0 9f LDA $9fe0 ; (si.left + 0)
0cb0 : 85 59 __ STA T5 + 0 
0cb2 : d0 19 __ BNE $0ccd ; (sformat.s49 + 0)
.s98:
0cb4 : a6 5c __ LDX T7 + 0 
0cb6 : ec db 9f CPX $9fdb ; (si.width + 0)
0cb9 : a0 00 __ LDY #$00
0cbb : b0 0c __ BCS $0cc9 ; (sformat.s99 + 0)
.l57:
0cbd : ad da 9f LDA $9fda ; (si.fill + 0)
0cc0 : 91 57 __ STA (T4 + 0),y 
0cc2 : c8 __ __ INY
0cc3 : e8 __ __ INX
0cc4 : ec db 9f CPX $9fdb ; (si.width + 0)
0cc7 : 90 f4 __ BCC $0cbd ; (sformat.l57 + 0)
.s99:
0cc9 : 86 5c __ STX T7 + 0 
0ccb : 84 5b __ STY T6 + 0 
.s49:
0ccd : ac f9 9f LDY $9ff9 ; (sstack + 7)
0cd0 : d0 48 __ BNE $0d1a ; (sformat.s54 + 0)
.s50:
0cd2 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0cd4 : f0 23 __ BEQ $0cf9 ; (sformat.s51 + 0)
.s53:
0cd6 : 18 __ __ CLC
0cd7 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0cd9 : 69 01 __ ADC #$01
0cdb : 85 43 __ STA T0 + 0 
0cdd : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0cdf : 69 00 __ ADC #$00
0ce1 : 85 44 __ STA T0 + 1 
0ce3 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0ce5 : a4 5b __ LDY T6 + 0 
0ce7 : 91 57 __ STA (T4 + 0),y 
0ce9 : e6 5b __ INC T6 + 0 
0ceb : a0 00 __ LDY #$00
0ced : b1 43 __ LDA (T0 + 0),y 
0cef : a8 __ __ TAY
0cf0 : e6 43 __ INC T0 + 0 
0cf2 : d0 02 __ BNE $0cf6 ; (sformat.s112 + 0)
.s111:
0cf4 : e6 44 __ INC T0 + 1 
.s112:
0cf6 : 98 __ __ TYA
0cf7 : d0 ec __ BNE $0ce5 ; (sformat.l92 + 0)
.s51:
0cf9 : a5 59 __ LDA T5 + 0 
0cfb : d0 03 __ BNE $0d00 ; (sformat.s97 + 0)
0cfd : 4c ec 09 JMP $09ec ; (sformat.l5 + 0)
.s97:
0d00 : a6 5c __ LDX T7 + 0 
0d02 : ec db 9f CPX $9fdb ; (si.width + 0)
0d05 : a4 5b __ LDY T6 + 0 
0d07 : b0 0c __ BCS $0d15 ; (sformat.s102 + 0)
.l52:
0d09 : ad da 9f LDA $9fda ; (si.fill + 0)
0d0c : 91 57 __ STA (T4 + 0),y 
0d0e : c8 __ __ INY
0d0f : e8 __ __ INX
0d10 : ec db 9f CPX $9fdb ; (si.width + 0)
0d13 : 90 f4 __ BCC $0d09 ; (sformat.l52 + 0)
.s102:
0d15 : 84 5b __ STY T6 + 0 
0d17 : 4c ec 09 JMP $09ec ; (sformat.l5 + 0)
.s54:
0d1a : a4 5b __ LDY T6 + 0 
0d1c : f0 11 __ BEQ $0d2f ; (sformat.s55 + 0)
.s56:
0d1e : a5 57 __ LDA T4 + 0 
0d20 : 85 0e __ STA P1 
0d22 : a5 58 __ LDA T4 + 1 
0d24 : 85 0f __ STA P2 
0d26 : a9 00 __ LDA #$00
0d28 : 85 5b __ STA T6 + 0 
0d2a : 91 0e __ STA (P1),y 
0d2c : 20 0b 0e JSR $0e0b ; (puts.l4 + 0)
.s55:
0d2f : a5 53 __ LDA T1 + 0 
0d31 : 85 0e __ STA P1 
0d33 : a5 54 __ LDA T1 + 1 
0d35 : 85 0f __ STA P2 
0d37 : 20 0b 0e JSR $0e0b ; (puts.l4 + 0)
0d3a : ad e0 9f LDA $9fe0 ; (si.left + 0)
0d3d : d0 c1 __ BNE $0d00 ; (sformat.s97 + 0)
0d3f : 4c ec 09 JMP $09ec ; (sformat.l5 + 0)
.s60:
0d42 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0d45 : 85 43 __ STA T0 + 0 
0d47 : 69 03 __ ADC #$03
0d49 : 8d f7 9f STA $9ff7 ; (sstack + 5)
0d4c : ad f8 9f LDA $9ff8 ; (sstack + 6)
0d4f : 85 44 __ STA T0 + 1 
0d51 : 69 00 __ ADC #$00
0d53 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0d56 : a0 00 __ LDY #$00
0d58 : b1 55 __ LDA (T3 + 0),y 
0d5a : aa __ __ TAX
0d5b : e6 55 __ INC T3 + 0 
0d5d : d0 02 __ BNE $0d61 ; (sformat.s110 + 0)
.s109:
0d5f : e6 56 __ INC T3 + 1 
.s110:
0d61 : b1 43 __ LDA (T0 + 0),y 
0d63 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0d65 : 85 11 __ STA P4 
0d67 : a0 01 __ LDY #$01
0d69 : b1 43 __ LDA (T0 + 0),y 
0d6b : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d6d : 85 12 __ STA P5 
0d6f : c8 __ __ INY
0d70 : b1 43 __ LDA (T0 + 0),y 
0d72 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0d74 : 85 13 __ STA P6 
0d76 : c8 __ __ INY
0d77 : b1 43 __ LDA (T0 + 0),y 
0d79 : 85 14 __ STA P7 
0d7b : e0 64 __ CPX #$64
0d7d : f0 0c __ BEQ $0d8b ; (sformat.s71 + 0)
.s61:
0d7f : e0 44 __ CPX #$44
0d81 : f0 08 __ BEQ $0d8b ; (sformat.s71 + 0)
.s62:
0d83 : e0 69 __ CPX #$69
0d85 : f0 04 __ BEQ $0d8b ; (sformat.s71 + 0)
.s63:
0d87 : e0 49 __ CPX #$49
0d89 : d0 1c __ BNE $0da7 ; (sformat.s64 + 0)
.s71:
0d8b : a9 01 __ LDA #$01
.s94:
0d8d : 85 15 __ STA P8 
.s69:
0d8f : a5 57 __ LDA T4 + 0 
0d91 : 85 0f __ STA P2 
0d93 : a5 58 __ LDA T4 + 1 
0d95 : 85 10 __ STA P3 
0d97 : a9 da __ LDA #$da
0d99 : 85 0d __ STA P0 
0d9b : a9 9f __ LDA #$9f
0d9d : 85 0e __ STA P1 
0d9f : 20 9c 0f JSR $0f9c ; (nforml.s4 + 0)
0da2 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0da4 : 4c 51 0c JMP $0c51 ; (sformat.s96 + 0)
.s64:
0da7 : e0 75 __ CPX #$75
0da9 : f0 04 __ BEQ $0daf ; (sformat.s70 + 0)
.s65:
0dab : e0 55 __ CPX #$55
0dad : d0 04 __ BNE $0db3 ; (sformat.s66 + 0)
.s70:
0daf : a9 00 __ LDA #$00
0db1 : f0 da __ BEQ $0d8d ; (sformat.s94 + 0)
.s66:
0db3 : e0 78 __ CPX #$78
0db5 : f0 06 __ BEQ $0dbd ; (sformat.s68 + 0)
.s67:
0db7 : 85 1e __ STA ACCU + 3 ; (fps + 0)
0db9 : e0 58 __ CPX #$58
0dbb : d0 82 __ BNE $0d3f ; (sformat.s55 + 16)
.s68:
0dbd : a9 00 __ LDA #$00
0dbf : 85 15 __ STA P8 
0dc1 : a9 10 __ LDA #$10
0dc3 : 8d de 9f STA $9fde ; (si.base + 0)
0dc6 : 8a __ __ TXA
0dc7 : 29 e0 __ AND #$e0
0dc9 : 09 01 __ ORA #$01
0dcb : 8d dd 9f STA $9fdd ; (si.cha + 0)
0dce : 4c 8f 0d JMP $0d8f ; (sformat.s69 + 0)
.s73:
0dd1 : a5 57 __ LDA T4 + 0 
0dd3 : 85 0f __ STA P2 
0dd5 : a5 58 __ LDA T4 + 1 
0dd7 : 85 10 __ STA P3 
0dd9 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0ddc : 85 43 __ STA T0 + 0 
0dde : ad f8 9f LDA $9ff8 ; (sstack + 6)
0de1 : 85 44 __ STA T0 + 1 
0de3 : a0 00 __ LDY #$00
0de5 : b1 43 __ LDA (T0 + 0),y 
0de7 : 85 11 __ STA P4 
0de9 : c8 __ __ INY
0dea : b1 43 __ LDA (T0 + 0),y 
0dec : 85 12 __ STA P5 
0dee : 18 __ __ CLC
0def : a5 43 __ LDA T0 + 0 
0df1 : 69 02 __ ADC #$02
0df3 : 8d f7 9f STA $9ff7 ; (sstack + 5)
0df6 : a5 44 __ LDA T0 + 1 
0df8 : 69 00 __ ADC #$00
0dfa : 8d f8 9f STA $9ff8 ; (sstack + 6)
0dfd : a9 da __ LDA #$da
0dff : 85 0d __ STA P0 
0e01 : a9 9f __ LDA #$9f
0e03 : 85 0e __ STA P1 
0e05 : 20 81 0e JSR $0e81 ; (nformi.s4 + 0)
0e08 : 4c 51 0c JMP $0c51 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
0e0b : a0 00 __ LDY #$00
0e0d : b1 0e __ LDA (P1),y ; (str + 0)
0e0f : d0 01 __ BNE $0e12 ; (puts.s5 + 0)
.s3:
0e11 : 60 __ __ RTS
.s5:
0e12 : e6 0e __ INC P1 ; (str + 0)
0e14 : d0 02 __ BNE $0e18 ; (puts.s7 + 0)
.s6:
0e16 : e6 0f __ INC P2 ; (str + 1)
.s7:
0e18 : 20 1e 0e JSR $0e1e ; (putpch.s4 + 0)
0e1b : 4c 0b 0e JMP $0e0b ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0e1e : 85 0d __ STA P0 ; (c + 0)
0e20 : ad 85 1b LDA $1b85 ; (giocharmap + 0)
0e23 : f0 32 __ BEQ $0e57 ; (putpch.s5 + 0)
.s6:
0e25 : a5 0d __ LDA P0 ; (c + 0)
0e27 : c9 0a __ CMP #$0a
0e29 : d0 04 __ BNE $0e2f ; (putpch.s7 + 0)
.s18:
0e2b : a9 0d __ LDA #$0d
0e2d : d0 32 __ BNE $0e61 ; (putpch.s15 + 0)
.s7:
0e2f : c9 09 __ CMP #$09
0e31 : f0 36 __ BEQ $0e69 ; (putpch.s16 + 0)
.s8:
0e33 : ad 85 1b LDA $1b85 ; (giocharmap + 0)
0e36 : c9 02 __ CMP #$02
0e38 : 90 1d __ BCC $0e57 ; (putpch.s5 + 0)
.s9:
0e3a : a5 0d __ LDA P0 ; (c + 0)
0e3c : c9 41 __ CMP #$41
0e3e : 90 17 __ BCC $0e57 ; (putpch.s5 + 0)
.s10:
0e40 : c9 7b __ CMP #$7b
0e42 : b0 13 __ BCS $0e57 ; (putpch.s5 + 0)
.s11:
0e44 : c9 61 __ CMP #$61
0e46 : b0 04 __ BCS $0e4c ; (putpch.s13 + 0)
.s12:
0e48 : c9 5b __ CMP #$5b
0e4a : b0 0b __ BCS $0e57 ; (putpch.s5 + 0)
.s13:
0e4c : 49 20 __ EOR #$20
0e4e : 85 0d __ STA P0 ; (c + 0)
0e50 : ad 85 1b LDA $1b85 ; (giocharmap + 0)
0e53 : c9 02 __ CMP #$02
0e55 : f0 06 __ BEQ $0e5d ; (putpch.s14 + 0)
.s5:
0e57 : a5 0d __ LDA P0 ; (c + 0)
0e59 : 20 d2 ff JSR $ffd2 
.s3:
0e5c : 60 __ __ RTS
.s14:
0e5d : a5 0d __ LDA P0 ; (c + 0)
0e5f : 29 5f __ AND #$5f
.s15:
0e61 : 85 43 __ STA T0 + 0 
0e63 : a5 43 __ LDA T0 + 0 
0e65 : 20 d2 ff JSR $ffd2 
0e68 : 60 __ __ RTS
.s16:
0e69 : a5 d3 __ LDA $d3 
0e6b : 29 03 __ AND #$03
0e6d : 85 43 __ STA T0 + 0 
0e6f : a9 20 __ LDA #$20
0e71 : 85 44 __ STA T1 + 0 
.l17:
0e73 : a5 44 __ LDA T1 + 0 
0e75 : 20 d2 ff JSR $ffd2 
0e78 : e6 43 __ INC T0 + 0 
0e7a : a5 43 __ LDA T0 + 0 
0e7c : c9 04 __ CMP #$04
0e7e : 90 f3 __ BCC $0e73 ; (putpch.l17 + 0)
0e80 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0e81 : a9 00 __ LDA #$00
0e83 : 85 43 __ STA T5 + 0 
0e85 : a0 04 __ LDY #$04
0e87 : b1 0d __ LDA (P0),y ; (si + 0)
0e89 : 85 44 __ STA T6 + 0 
0e8b : a5 13 __ LDA P6 ; (s + 0)
0e8d : f0 13 __ BEQ $0ea2 ; (nformi.s5 + 0)
.s33:
0e8f : 24 12 __ BIT P5 ; (v + 1)
0e91 : 10 0f __ BPL $0ea2 ; (nformi.s5 + 0)
.s34:
0e93 : 38 __ __ SEC
0e94 : a9 00 __ LDA #$00
0e96 : e5 11 __ SBC P4 ; (v + 0)
0e98 : 85 11 __ STA P4 ; (v + 0)
0e9a : a9 00 __ LDA #$00
0e9c : e5 12 __ SBC P5 ; (v + 1)
0e9e : 85 12 __ STA P5 ; (v + 1)
0ea0 : e6 43 __ INC T5 + 0 
.s5:
0ea2 : a9 10 __ LDA #$10
0ea4 : 85 45 __ STA T7 + 0 
0ea6 : a5 11 __ LDA P4 ; (v + 0)
0ea8 : 05 12 __ ORA P5 ; (v + 1)
0eaa : f0 33 __ BEQ $0edf ; (nformi.s6 + 0)
.s28:
0eac : a5 11 __ LDA P4 ; (v + 0)
0eae : 85 1b __ STA ACCU + 0 
0eb0 : a5 12 __ LDA P5 ; (v + 1)
0eb2 : 85 1c __ STA ACCU + 1 
.l29:
0eb4 : a5 44 __ LDA T6 + 0 
0eb6 : 85 03 __ STA WORK + 0 
0eb8 : a9 00 __ LDA #$00
0eba : 85 04 __ STA WORK + 1 
0ebc : 20 68 19 JSR $1968 ; (divmod + 0)
0ebf : a5 05 __ LDA WORK + 2 
0ec1 : c9 0a __ CMP #$0a
0ec3 : b0 04 __ BCS $0ec9 ; (nformi.s32 + 0)
.s30:
0ec5 : a9 30 __ LDA #$30
0ec7 : 90 06 __ BCC $0ecf ; (nformi.s31 + 0)
.s32:
0ec9 : a0 03 __ LDY #$03
0ecb : b1 0d __ LDA (P0),y ; (si + 0)
0ecd : e9 0a __ SBC #$0a
.s31:
0ecf : 18 __ __ CLC
0ed0 : 65 05 __ ADC WORK + 2 
0ed2 : a6 45 __ LDX T7 + 0 
0ed4 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0ed7 : c6 45 __ DEC T7 + 0 
0ed9 : a5 1b __ LDA ACCU + 0 
0edb : 05 1c __ ORA ACCU + 1 
0edd : d0 d5 __ BNE $0eb4 ; (nformi.l29 + 0)
.s6:
0edf : a0 02 __ LDY #$02
0ee1 : b1 0d __ LDA (P0),y ; (si + 0)
0ee3 : c9 ff __ CMP #$ff
0ee5 : d0 04 __ BNE $0eeb ; (nformi.s27 + 0)
.s7:
0ee7 : a9 0f __ LDA #$0f
0ee9 : d0 05 __ BNE $0ef0 ; (nformi.s39 + 0)
.s27:
0eeb : 38 __ __ SEC
0eec : a9 10 __ LDA #$10
0eee : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0ef0 : a8 __ __ TAY
0ef1 : c4 45 __ CPY T7 + 0 
0ef3 : b0 0d __ BCS $0f02 ; (nformi.s8 + 0)
.s26:
0ef5 : a9 30 __ LDA #$30
.l40:
0ef7 : a6 45 __ LDX T7 + 0 
0ef9 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0efc : c6 45 __ DEC T7 + 0 
0efe : c4 45 __ CPY T7 + 0 
0f00 : 90 f5 __ BCC $0ef7 ; (nformi.l40 + 0)
.s8:
0f02 : a0 07 __ LDY #$07
0f04 : b1 0d __ LDA (P0),y ; (si + 0)
0f06 : f0 1c __ BEQ $0f24 ; (nformi.s9 + 0)
.s24:
0f08 : a5 44 __ LDA T6 + 0 
0f0a : c9 10 __ CMP #$10
0f0c : d0 16 __ BNE $0f24 ; (nformi.s9 + 0)
.s25:
0f0e : a0 03 __ LDY #$03
0f10 : b1 0d __ LDA (P0),y ; (si + 0)
0f12 : a8 __ __ TAY
0f13 : a9 30 __ LDA #$30
0f15 : a6 45 __ LDX T7 + 0 
0f17 : ca __ __ DEX
0f18 : ca __ __ DEX
0f19 : 86 45 __ STX T7 + 0 
0f1b : 9d e2 9f STA $9fe2,x ; (buffer[0] + 0)
0f1e : 98 __ __ TYA
0f1f : 69 16 __ ADC #$16
0f21 : 9d e3 9f STA $9fe3,x ; (buffer[0] + 1)
.s9:
0f24 : a9 00 __ LDA #$00
0f26 : 85 1b __ STA ACCU + 0 
0f28 : a5 43 __ LDA T5 + 0 
0f2a : f0 0c __ BEQ $0f38 ; (nformi.s10 + 0)
.s23:
0f2c : a9 2d __ LDA #$2d
.s22:
0f2e : a6 45 __ LDX T7 + 0 
0f30 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f33 : c6 45 __ DEC T7 + 0 
0f35 : 4c 42 0f JMP $0f42 ; (nformi.s11 + 0)
.s10:
0f38 : a0 05 __ LDY #$05
0f3a : b1 0d __ LDA (P0),y ; (si + 0)
0f3c : f0 04 __ BEQ $0f42 ; (nformi.s11 + 0)
.s21:
0f3e : a9 2b __ LDA #$2b
0f40 : d0 ec __ BNE $0f2e ; (nformi.s22 + 0)
.s11:
0f42 : a6 45 __ LDX T7 + 0 
0f44 : a0 06 __ LDY #$06
0f46 : b1 0d __ LDA (P0),y ; (si + 0)
0f48 : d0 2b __ BNE $0f75 ; (nformi.s17 + 0)
.l12:
0f4a : 8a __ __ TXA
0f4b : 18 __ __ CLC
0f4c : a0 01 __ LDY #$01
0f4e : 71 0d __ ADC (P0),y ; (si + 0)
0f50 : b0 04 __ BCS $0f56 ; (nformi.s15 + 0)
.s16:
0f52 : c9 11 __ CMP #$11
0f54 : 90 0a __ BCC $0f60 ; (nformi.s13 + 0)
.s15:
0f56 : a0 00 __ LDY #$00
0f58 : b1 0d __ LDA (P0),y ; (si + 0)
0f5a : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f5d : ca __ __ DEX
0f5e : b0 ea __ BCS $0f4a ; (nformi.l12 + 0)
.s13:
0f60 : e0 10 __ CPX #$10
0f62 : b0 0e __ BCS $0f72 ; (nformi.s41 + 0)
.s14:
0f64 : 88 __ __ DEY
.l37:
0f65 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
0f68 : 91 0f __ STA (P2),y ; (str + 0)
0f6a : c8 __ __ INY
0f6b : e8 __ __ INX
0f6c : e0 10 __ CPX #$10
0f6e : 90 f5 __ BCC $0f65 ; (nformi.l37 + 0)
.s38:
0f70 : 84 1b __ STY ACCU + 0 
.s41:
0f72 : a5 1b __ LDA ACCU + 0 
.s3:
0f74 : 60 __ __ RTS
.s17:
0f75 : e0 10 __ CPX #$10
0f77 : b0 1a __ BCS $0f93 ; (nformi.l18 + 0)
.s20:
0f79 : a0 00 __ LDY #$00
.l35:
0f7b : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
0f7e : 91 0f __ STA (P2),y ; (str + 0)
0f80 : c8 __ __ INY
0f81 : e8 __ __ INX
0f82 : e0 10 __ CPX #$10
0f84 : 90 f5 __ BCC $0f7b ; (nformi.l35 + 0)
.s36:
0f86 : 84 1b __ STY ACCU + 0 
0f88 : b0 09 __ BCS $0f93 ; (nformi.l18 + 0)
.s19:
0f8a : 88 __ __ DEY
0f8b : b1 0d __ LDA (P0),y ; (si + 0)
0f8d : a4 1b __ LDY ACCU + 0 
0f8f : 91 0f __ STA (P2),y ; (str + 0)
0f91 : e6 1b __ INC ACCU + 0 
.l18:
0f93 : a5 1b __ LDA ACCU + 0 
0f95 : a0 01 __ LDY #$01
0f97 : d1 0d __ CMP (P0),y ; (si + 0)
0f99 : 90 ef __ BCC $0f8a ; (nformi.s19 + 0)
0f9b : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0f9c : a9 00 __ LDA #$00
0f9e : 85 43 __ STA T4 + 0 
0fa0 : a5 15 __ LDA P8 ; (s + 0)
0fa2 : f0 1f __ BEQ $0fc3 ; (nforml.s5 + 0)
.s35:
0fa4 : 24 14 __ BIT P7 ; (v + 3)
0fa6 : 10 1b __ BPL $0fc3 ; (nforml.s5 + 0)
.s36:
0fa8 : 38 __ __ SEC
0fa9 : a9 00 __ LDA #$00
0fab : e5 11 __ SBC P4 ; (v + 0)
0fad : 85 11 __ STA P4 ; (v + 0)
0faf : a9 00 __ LDA #$00
0fb1 : e5 12 __ SBC P5 ; (v + 1)
0fb3 : 85 12 __ STA P5 ; (v + 1)
0fb5 : a9 00 __ LDA #$00
0fb7 : e5 13 __ SBC P6 ; (v + 2)
0fb9 : 85 13 __ STA P6 ; (v + 2)
0fbb : a9 00 __ LDA #$00
0fbd : e5 14 __ SBC P7 ; (v + 3)
0fbf : 85 14 __ STA P7 ; (v + 3)
0fc1 : e6 43 __ INC T4 + 0 
.s5:
0fc3 : a9 10 __ LDA #$10
0fc5 : 85 44 __ STA T5 + 0 
0fc7 : a5 14 __ LDA P7 ; (v + 3)
0fc9 : f0 03 __ BEQ $0fce ; (nforml.s31 + 0)
0fcb : 4c 96 10 JMP $1096 ; (nforml.l28 + 0)
.s31:
0fce : a5 13 __ LDA P6 ; (v + 2)
0fd0 : d0 f9 __ BNE $0fcb ; (nforml.s5 + 8)
.s32:
0fd2 : a5 12 __ LDA P5 ; (v + 1)
0fd4 : d0 f5 __ BNE $0fcb ; (nforml.s5 + 8)
.s33:
0fd6 : c5 11 __ CMP P4 ; (v + 0)
0fd8 : 90 f1 __ BCC $0fcb ; (nforml.s5 + 8)
.s6:
0fda : a0 02 __ LDY #$02
0fdc : b1 0d __ LDA (P0),y ; (si + 0)
0fde : c9 ff __ CMP #$ff
0fe0 : d0 04 __ BNE $0fe6 ; (nforml.s27 + 0)
.s7:
0fe2 : a9 0f __ LDA #$0f
0fe4 : d0 05 __ BNE $0feb ; (nforml.s41 + 0)
.s27:
0fe6 : 38 __ __ SEC
0fe7 : a9 10 __ LDA #$10
0fe9 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
0feb : a8 __ __ TAY
0fec : c4 44 __ CPY T5 + 0 
0fee : b0 0d __ BCS $0ffd ; (nforml.s8 + 0)
.s26:
0ff0 : a9 30 __ LDA #$30
.l42:
0ff2 : a6 44 __ LDX T5 + 0 
0ff4 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0ff7 : c6 44 __ DEC T5 + 0 
0ff9 : c4 44 __ CPY T5 + 0 
0ffb : 90 f5 __ BCC $0ff2 ; (nforml.l42 + 0)
.s8:
0ffd : a0 07 __ LDY #$07
0fff : b1 0d __ LDA (P0),y ; (si + 0)
1001 : f0 1d __ BEQ $1020 ; (nforml.s9 + 0)
.s24:
1003 : a0 04 __ LDY #$04
1005 : b1 0d __ LDA (P0),y ; (si + 0)
1007 : c9 10 __ CMP #$10
1009 : d0 15 __ BNE $1020 ; (nforml.s9 + 0)
.s25:
100b : 88 __ __ DEY
100c : b1 0d __ LDA (P0),y ; (si + 0)
100e : a8 __ __ TAY
100f : a9 30 __ LDA #$30
1011 : a6 44 __ LDX T5 + 0 
1013 : ca __ __ DEX
1014 : ca __ __ DEX
1015 : 86 44 __ STX T5 + 0 
1017 : 9d e2 9f STA $9fe2,x ; (buffer[0] + 0)
101a : 98 __ __ TYA
101b : 69 16 __ ADC #$16
101d : 9d e3 9f STA $9fe3,x ; (buffer[0] + 1)
.s9:
1020 : a9 00 __ LDA #$00
1022 : 85 1b __ STA ACCU + 0 
1024 : a5 43 __ LDA T4 + 0 
1026 : f0 0c __ BEQ $1034 ; (nforml.s10 + 0)
.s23:
1028 : a9 2d __ LDA #$2d
.s22:
102a : a6 44 __ LDX T5 + 0 
102c : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
102f : c6 44 __ DEC T5 + 0 
1031 : 4c 3e 10 JMP $103e ; (nforml.s11 + 0)
.s10:
1034 : a0 05 __ LDY #$05
1036 : b1 0d __ LDA (P0),y ; (si + 0)
1038 : f0 04 __ BEQ $103e ; (nforml.s11 + 0)
.s21:
103a : a9 2b __ LDA #$2b
103c : d0 ec __ BNE $102a ; (nforml.s22 + 0)
.s11:
103e : a0 06 __ LDY #$06
1040 : a6 44 __ LDX T5 + 0 
1042 : b1 0d __ LDA (P0),y ; (si + 0)
1044 : d0 29 __ BNE $106f ; (nforml.s17 + 0)
.l12:
1046 : 8a __ __ TXA
1047 : 18 __ __ CLC
1048 : a0 01 __ LDY #$01
104a : 71 0d __ ADC (P0),y ; (si + 0)
104c : b0 04 __ BCS $1052 ; (nforml.s15 + 0)
.s16:
104e : c9 11 __ CMP #$11
1050 : 90 0a __ BCC $105c ; (nforml.s13 + 0)
.s15:
1052 : a0 00 __ LDY #$00
1054 : b1 0d __ LDA (P0),y ; (si + 0)
1056 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
1059 : ca __ __ DEX
105a : b0 ea __ BCS $1046 ; (nforml.l12 + 0)
.s13:
105c : e0 10 __ CPX #$10
105e : b0 0e __ BCS $106e ; (nforml.s3 + 0)
.s14:
1060 : 88 __ __ DEY
.l39:
1061 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
1064 : 91 0f __ STA (P2),y ; (str + 0)
1066 : c8 __ __ INY
1067 : e8 __ __ INX
1068 : e0 10 __ CPX #$10
106a : 90 f5 __ BCC $1061 ; (nforml.l39 + 0)
.s40:
106c : 84 1b __ STY ACCU + 0 
.s3:
106e : 60 __ __ RTS
.s17:
106f : e0 10 __ CPX #$10
1071 : b0 1a __ BCS $108d ; (nforml.l18 + 0)
.s20:
1073 : a0 00 __ LDY #$00
.l37:
1075 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
1078 : 91 0f __ STA (P2),y ; (str + 0)
107a : c8 __ __ INY
107b : e8 __ __ INX
107c : e0 10 __ CPX #$10
107e : 90 f5 __ BCC $1075 ; (nforml.l37 + 0)
.s38:
1080 : 84 1b __ STY ACCU + 0 
1082 : b0 09 __ BCS $108d ; (nforml.l18 + 0)
.s19:
1084 : 88 __ __ DEY
1085 : b1 0d __ LDA (P0),y ; (si + 0)
1087 : a4 1b __ LDY ACCU + 0 
1089 : 91 0f __ STA (P2),y ; (str + 0)
108b : e6 1b __ INC ACCU + 0 
.l18:
108d : a5 1b __ LDA ACCU + 0 
108f : a0 01 __ LDY #$01
1091 : d1 0d __ CMP (P0),y ; (si + 0)
1093 : 90 ef __ BCC $1084 ; (nforml.s19 + 0)
1095 : 60 __ __ RTS
.l28:
1096 : a0 04 __ LDY #$04
1098 : b1 0d __ LDA (P0),y ; (si + 0)
109a : 85 03 __ STA WORK + 0 
109c : a5 11 __ LDA P4 ; (v + 0)
109e : 85 1b __ STA ACCU + 0 
10a0 : a5 12 __ LDA P5 ; (v + 1)
10a2 : 85 1c __ STA ACCU + 1 
10a4 : a5 13 __ LDA P6 ; (v + 2)
10a6 : 85 1d __ STA ACCU + 2 
10a8 : a5 14 __ LDA P7 ; (v + 3)
10aa : 85 1e __ STA ACCU + 3 
10ac : a9 00 __ LDA #$00
10ae : 85 04 __ STA WORK + 1 
10b0 : 85 05 __ STA WORK + 2 
10b2 : 85 06 __ STA WORK + 3 
10b4 : 20 ad 1a JSR $1aad ; (divmod32 + 0)
10b7 : a5 07 __ LDA WORK + 4 
10b9 : c9 0a __ CMP #$0a
10bb : b0 04 __ BCS $10c1 ; (nforml.s34 + 0)
.s29:
10bd : a9 30 __ LDA #$30
10bf : 90 06 __ BCC $10c7 ; (nforml.s30 + 0)
.s34:
10c1 : a0 03 __ LDY #$03
10c3 : b1 0d __ LDA (P0),y ; (si + 0)
10c5 : e9 0a __ SBC #$0a
.s30:
10c7 : 18 __ __ CLC
10c8 : 65 07 __ ADC WORK + 4 
10ca : a6 44 __ LDX T5 + 0 
10cc : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
10cf : c6 44 __ DEC T5 + 0 
10d1 : a5 1b __ LDA ACCU + 0 
10d3 : 85 11 __ STA P4 ; (v + 0)
10d5 : a5 1c __ LDA ACCU + 1 
10d7 : 85 12 __ STA P5 ; (v + 1)
10d9 : a5 1d __ LDA ACCU + 2 
10db : 85 13 __ STA P6 ; (v + 2)
10dd : a5 1e __ LDA ACCU + 3 
10df : 85 14 __ STA P7 ; (v + 3)
10e1 : d0 b3 __ BNE $1096 ; (nforml.l28 + 0)
10e3 : 4c ce 0f JMP $0fce ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
10e6 : a2 03 __ LDX #$03
10e8 : b5 53 __ LDA T7 + 0,x 
10ea : 9d e9 9f STA $9fe9,x ; (nformf@stack + 0)
10ed : ca __ __ DEX
10ee : 10 f8 __ BPL $10e8 ; (nformf.s1 + 2)
.s4:
10f0 : a5 16 __ LDA P9 ; (f + 1)
10f2 : 85 44 __ STA T0 + 1 
10f4 : a5 17 __ LDA P10 ; (f + 2)
10f6 : 85 45 __ STA T0 + 2 
10f8 : a5 18 __ LDA P11 ; (f + 3)
10fa : 29 7f __ AND #$7f
10fc : 05 17 __ ORA P10 ; (f + 2)
10fe : 05 16 __ ORA P9 ; (f + 1)
1100 : 05 15 __ ORA P8 ; (f + 0)
1102 : f0 21 __ BEQ $1125 ; (nformf.s5 + 0)
.s107:
1104 : 24 18 __ BIT P11 ; (f + 3)
1106 : 10 1d __ BPL $1125 ; (nformf.s5 + 0)
.s106:
1108 : a9 2d __ LDA #$2d
110a : a0 00 __ LDY #$00
110c : 91 13 __ STA (P6),y ; (str + 0)
110e : a5 18 __ LDA P11 ; (f + 3)
1110 : 49 80 __ EOR #$80
1112 : 85 10 __ STA P3 
1114 : 85 18 __ STA P11 ; (f + 3)
1116 : a5 15 __ LDA P8 ; (f + 0)
1118 : 85 0d __ STA P0 
111a : a5 16 __ LDA P9 ; (f + 1)
111c : 85 0e __ STA P1 
111e : a5 17 __ LDA P10 ; (f + 2)
1120 : 85 0f __ STA P2 
1122 : 4c 39 16 JMP $1639 ; (nformf.s104 + 0)
.s5:
1125 : a5 15 __ LDA P8 ; (f + 0)
1127 : 85 0d __ STA P0 
1129 : a5 16 __ LDA P9 ; (f + 1)
112b : 85 0e __ STA P1 
112d : a5 17 __ LDA P10 ; (f + 2)
112f : 85 0f __ STA P2 
1131 : a5 18 __ LDA P11 ; (f + 3)
1133 : 85 10 __ STA P3 
1135 : a0 05 __ LDY #$05
1137 : b1 11 __ LDA (P4),y ; (si + 0)
1139 : f0 09 __ BEQ $1144 ; (nformf.s6 + 0)
.s103:
113b : a9 2b __ LDA #$2b
113d : a0 00 __ LDY #$00
113f : 91 13 __ STA (P6),y ; (str + 0)
1141 : 4c 39 16 JMP $1639 ; (nformf.s104 + 0)
.s6:
1144 : 20 4a 16 JSR $164a ; (isinf.s4 + 0)
1147 : a2 00 __ LDX #$00
1149 : 86 54 __ STX T9 + 0 
114b : a8 __ __ TAY
114c : f0 05 __ BEQ $1153 ; (nformf.s7 + 0)
.s101:
114e : a9 02 __ LDA #$02
1150 : 4c 09 16 JMP $1609 ; (nformf.s102 + 0)
.s7:
1153 : a5 11 __ LDA P4 ; (si + 0)
1155 : 85 4b __ STA T2 + 0 
1157 : a5 12 __ LDA P5 ; (si + 1)
1159 : 85 4c __ STA T2 + 1 
115b : a0 02 __ LDY #$02
115d : b1 11 __ LDA (P4),y ; (si + 0)
115f : c9 ff __ CMP #$ff
1161 : d0 02 __ BNE $1165 ; (nformf.s100 + 0)
.s8:
1163 : a9 06 __ LDA #$06
.s100:
1165 : 85 4d __ STA T3 + 0 
1167 : 85 52 __ STA T6 + 0 
1169 : a9 00 __ LDA #$00
116b : 85 4f __ STA T4 + 0 
116d : 85 50 __ STA T4 + 1 
116f : a5 18 __ LDA P11 ; (f + 3)
1171 : 85 46 __ STA T0 + 3 
1173 : 29 7f __ AND #$7f
1175 : 05 17 __ ORA P10 ; (f + 2)
1177 : 05 16 __ ORA P9 ; (f + 1)
1179 : a6 15 __ LDX P8 ; (f + 0)
117b : 86 43 __ STX T0 + 0 
117d : 05 15 __ ORA P8 ; (f + 0)
117f : d0 03 __ BNE $1184 ; (nformf.s67 + 0)
1181 : 4c b8 12 JMP $12b8 ; (nformf.s9 + 0)
.s67:
1184 : a5 18 __ LDA P11 ; (f + 3)
1186 : 10 03 __ BPL $118b ; (nformf.s95 + 0)
1188 : 4c 0a 12 JMP $120a ; (nformf.l80 + 0)
.s95:
118b : c9 44 __ CMP #$44
118d : d0 0d __ BNE $119c ; (nformf.l99 + 0)
.s96:
118f : a5 17 __ LDA P10 ; (f + 2)
1191 : c9 7a __ CMP #$7a
1193 : d0 07 __ BNE $119c ; (nformf.l99 + 0)
.s97:
1195 : a5 16 __ LDA P9 ; (f + 1)
1197 : d0 03 __ BNE $119c ; (nformf.l99 + 0)
.s98:
1199 : 8a __ __ TXA
119a : f0 02 __ BEQ $119e ; (nformf.l90 + 0)
.l99:
119c : 90 54 __ BCC $11f2 ; (nformf.s68 + 0)
.l90:
119e : 18 __ __ CLC
119f : a5 4f __ LDA T4 + 0 
11a1 : 69 03 __ ADC #$03
11a3 : 85 4f __ STA T4 + 0 
11a5 : 90 02 __ BCC $11a9 ; (nformf.s121 + 0)
.s120:
11a7 : e6 50 __ INC T4 + 1 
.s121:
11a9 : a5 43 __ LDA T0 + 0 
11ab : 85 1b __ STA ACCU + 0 
11ad : a5 44 __ LDA T0 + 1 
11af : 85 1c __ STA ACCU + 1 
11b1 : a5 45 __ LDA T0 + 2 
11b3 : 85 1d __ STA ACCU + 2 
11b5 : a5 46 __ LDA T0 + 3 
11b7 : 85 1e __ STA ACCU + 3 
11b9 : a9 00 __ LDA #$00
11bb : 85 03 __ STA WORK + 0 
11bd : 85 04 __ STA WORK + 1 
11bf : a9 7a __ LDA #$7a
11c1 : 85 05 __ STA WORK + 2 
11c3 : a9 44 __ LDA #$44
11c5 : 85 06 __ STA WORK + 3 
11c7 : 20 9a 16 JSR $169a ; (freg + 20)
11ca : 20 80 18 JSR $1880 ; (crt_fdiv + 0)
11cd : a5 1b __ LDA ACCU + 0 
11cf : 85 43 __ STA T0 + 0 
11d1 : a5 1c __ LDA ACCU + 1 
11d3 : 85 44 __ STA T0 + 1 
11d5 : a6 1d __ LDX ACCU + 2 
11d7 : 86 45 __ STX T0 + 2 
11d9 : a5 1e __ LDA ACCU + 3 
11db : 85 46 __ STA T0 + 3 
11dd : 30 13 __ BMI $11f2 ; (nformf.s68 + 0)
.s91:
11df : c9 44 __ CMP #$44
11e1 : d0 b9 __ BNE $119c ; (nformf.l99 + 0)
.s92:
11e3 : e0 7a __ CPX #$7a
11e5 : d0 b5 __ BNE $119c ; (nformf.l99 + 0)
.s93:
11e7 : a5 1c __ LDA ACCU + 1 
11e9 : 38 __ __ SEC
11ea : d0 b0 __ BNE $119c ; (nformf.l99 + 0)
.s94:
11ec : a5 1b __ LDA ACCU + 0 
11ee : f0 ae __ BEQ $119e ; (nformf.l90 + 0)
11f0 : d0 aa __ BNE $119c ; (nformf.l99 + 0)
.s68:
11f2 : a5 46 __ LDA T0 + 3 
11f4 : 30 14 __ BMI $120a ; (nformf.l80 + 0)
.s86:
11f6 : c9 3f __ CMP #$3f
11f8 : d0 0e __ BNE $1208 ; (nformf.s85 + 0)
.s87:
11fa : a5 45 __ LDA T0 + 2 
11fc : c9 80 __ CMP #$80
11fe : d0 08 __ BNE $1208 ; (nformf.s85 + 0)
.s88:
1200 : a5 44 __ LDA T0 + 1 
1202 : d0 04 __ BNE $1208 ; (nformf.s85 + 0)
.s89:
1204 : a5 43 __ LDA T0 + 0 
1206 : f0 49 __ BEQ $1251 ; (nformf.s69 + 0)
.s85:
1208 : b0 47 __ BCS $1251 ; (nformf.s69 + 0)
.l80:
120a : 38 __ __ SEC
120b : a5 4f __ LDA T4 + 0 
120d : e9 03 __ SBC #$03
120f : 85 4f __ STA T4 + 0 
1211 : b0 02 __ BCS $1215 ; (nformf.s116 + 0)
.s115:
1213 : c6 50 __ DEC T4 + 1 
.s116:
1215 : a9 00 __ LDA #$00
1217 : 85 1b __ STA ACCU + 0 
1219 : 85 1c __ STA ACCU + 1 
121b : a9 7a __ LDA #$7a
121d : 85 1d __ STA ACCU + 2 
121f : a9 44 __ LDA #$44
1221 : 85 1e __ STA ACCU + 3 
1223 : a2 43 __ LDX #$43
1225 : 20 8a 16 JSR $168a ; (freg + 4)
1228 : 20 b8 17 JSR $17b8 ; (crt_fmul + 0)
122b : a5 1b __ LDA ACCU + 0 
122d : 85 43 __ STA T0 + 0 
122f : a5 1c __ LDA ACCU + 1 
1231 : 85 44 __ STA T0 + 1 
1233 : a6 1d __ LDX ACCU + 2 
1235 : 86 45 __ STX T0 + 2 
1237 : a5 1e __ LDA ACCU + 3 
1239 : 85 46 __ STA T0 + 3 
123b : 30 cd __ BMI $120a ; (nformf.l80 + 0)
.s81:
123d : c9 3f __ CMP #$3f
123f : 90 c9 __ BCC $120a ; (nformf.l80 + 0)
.s122:
1241 : d0 0e __ BNE $1251 ; (nformf.s69 + 0)
.s82:
1243 : e0 80 __ CPX #$80
1245 : 90 c3 __ BCC $120a ; (nformf.l80 + 0)
.s123:
1247 : d0 08 __ BNE $1251 ; (nformf.s69 + 0)
.s83:
1249 : a5 1c __ LDA ACCU + 1 
124b : d0 bb __ BNE $1208 ; (nformf.s85 + 0)
.s84:
124d : a5 1b __ LDA ACCU + 0 
124f : d0 b7 __ BNE $1208 ; (nformf.s85 + 0)
.s69:
1251 : a5 46 __ LDA T0 + 3 
1253 : 30 63 __ BMI $12b8 ; (nformf.s9 + 0)
.s75:
1255 : c9 41 __ CMP #$41
1257 : d0 0e __ BNE $1267 ; (nformf.l79 + 0)
.s76:
1259 : a5 45 __ LDA T0 + 2 
125b : c9 20 __ CMP #$20
125d : d0 08 __ BNE $1267 ; (nformf.l79 + 0)
.s77:
125f : a5 44 __ LDA T0 + 1 
1261 : d0 04 __ BNE $1267 ; (nformf.l79 + 0)
.s78:
1263 : a5 43 __ LDA T0 + 0 
1265 : f0 02 __ BEQ $1269 ; (nformf.l70 + 0)
.l79:
1267 : 90 4f __ BCC $12b8 ; (nformf.s9 + 0)
.l70:
1269 : e6 4f __ INC T4 + 0 
126b : d0 02 __ BNE $126f ; (nformf.s119 + 0)
.s118:
126d : e6 50 __ INC T4 + 1 
.s119:
126f : a5 43 __ LDA T0 + 0 
1271 : 85 1b __ STA ACCU + 0 
1273 : a5 44 __ LDA T0 + 1 
1275 : 85 1c __ STA ACCU + 1 
1277 : a5 45 __ LDA T0 + 2 
1279 : 85 1d __ STA ACCU + 2 
127b : a5 46 __ LDA T0 + 3 
127d : 85 1e __ STA ACCU + 3 
127f : a9 00 __ LDA #$00
1281 : 85 03 __ STA WORK + 0 
1283 : 85 04 __ STA WORK + 1 
1285 : a9 20 __ LDA #$20
1287 : 85 05 __ STA WORK + 2 
1289 : a9 41 __ LDA #$41
128b : 85 06 __ STA WORK + 3 
128d : 20 9a 16 JSR $169a ; (freg + 20)
1290 : 20 80 18 JSR $1880 ; (crt_fdiv + 0)
1293 : a5 1b __ LDA ACCU + 0 
1295 : 85 43 __ STA T0 + 0 
1297 : a5 1c __ LDA ACCU + 1 
1299 : 85 44 __ STA T0 + 1 
129b : a6 1d __ LDX ACCU + 2 
129d : 86 45 __ STX T0 + 2 
129f : a5 1e __ LDA ACCU + 3 
12a1 : 85 46 __ STA T0 + 3 
12a3 : 30 13 __ BMI $12b8 ; (nformf.s9 + 0)
.s71:
12a5 : c9 41 __ CMP #$41
12a7 : d0 be __ BNE $1267 ; (nformf.l79 + 0)
.s72:
12a9 : e0 20 __ CPX #$20
12ab : d0 ba __ BNE $1267 ; (nformf.l79 + 0)
.s73:
12ad : a5 1c __ LDA ACCU + 1 
12af : 38 __ __ SEC
12b0 : d0 b5 __ BNE $1267 ; (nformf.l79 + 0)
.s74:
12b2 : a5 1b __ LDA ACCU + 0 
12b4 : f0 b3 __ BEQ $1269 ; (nformf.l70 + 0)
12b6 : d0 af __ BNE $1267 ; (nformf.l79 + 0)
.s9:
12b8 : ad f2 9f LDA $9ff2 ; (sstack + 0)
12bb : c9 65 __ CMP #$65
12bd : d0 04 __ BNE $12c3 ; (nformf.s11 + 0)
.s10:
12bf : a9 01 __ LDA #$01
12c1 : d0 02 __ BNE $12c5 ; (nformf.s12 + 0)
.s11:
12c3 : a9 00 __ LDA #$00
.s12:
12c5 : 85 55 __ STA T10 + 0 
12c7 : a6 4d __ LDX T3 + 0 
12c9 : e8 __ __ INX
12ca : 86 51 __ STX T5 + 0 
12cc : ad f2 9f LDA $9ff2 ; (sstack + 0)
12cf : c9 67 __ CMP #$67
12d1 : d0 13 __ BNE $12e6 ; (nformf.s13 + 0)
.s63:
12d3 : a5 50 __ LDA T4 + 1 
12d5 : 30 08 __ BMI $12df ; (nformf.s64 + 0)
.s66:
12d7 : d0 06 __ BNE $12df ; (nformf.s64 + 0)
.s65:
12d9 : a5 4f __ LDA T4 + 0 
12db : c9 04 __ CMP #$04
12dd : 90 07 __ BCC $12e6 ; (nformf.s13 + 0)
.s64:
12df : a9 01 __ LDA #$01
12e1 : 85 55 __ STA T10 + 0 
12e3 : 4c 6f 15 JMP $156f ; (nformf.s53 + 0)
.s13:
12e6 : a5 55 __ LDA T10 + 0 
12e8 : d0 f9 __ BNE $12e3 ; (nformf.s64 + 4)
.s14:
12ea : 24 50 __ BIT T4 + 1 
12ec : 10 43 __ BPL $1331 ; (nformf.s15 + 0)
.s52:
12ee : a5 43 __ LDA T0 + 0 
12f0 : 85 1b __ STA ACCU + 0 
12f2 : a5 44 __ LDA T0 + 1 
12f4 : 85 1c __ STA ACCU + 1 
12f6 : a5 45 __ LDA T0 + 2 
12f8 : 85 1d __ STA ACCU + 2 
12fa : a5 46 __ LDA T0 + 3 
12fc : 85 1e __ STA ACCU + 3 
.l108:
12fe : a9 00 __ LDA #$00
1300 : 85 03 __ STA WORK + 0 
1302 : 85 04 __ STA WORK + 1 
1304 : a9 20 __ LDA #$20
1306 : 85 05 __ STA WORK + 2 
1308 : a9 41 __ LDA #$41
130a : 85 06 __ STA WORK + 3 
130c : 20 9a 16 JSR $169a ; (freg + 20)
130f : 20 80 18 JSR $1880 ; (crt_fdiv + 0)
1312 : 18 __ __ CLC
1313 : a5 4f __ LDA T4 + 0 
1315 : 69 01 __ ADC #$01
1317 : 85 4f __ STA T4 + 0 
1319 : a5 50 __ LDA T4 + 1 
131b : 69 00 __ ADC #$00
131d : 85 50 __ STA T4 + 1 
131f : 30 dd __ BMI $12fe ; (nformf.l108 + 0)
.s109:
1321 : a5 1e __ LDA ACCU + 3 
1323 : 85 46 __ STA T0 + 3 
1325 : a5 1d __ LDA ACCU + 2 
1327 : 85 45 __ STA T0 + 2 
1329 : a5 1c __ LDA ACCU + 1 
132b : 85 44 __ STA T0 + 1 
132d : a5 1b __ LDA ACCU + 0 
132f : 85 43 __ STA T0 + 0 
.s15:
1331 : 18 __ __ CLC
1332 : a5 4d __ LDA T3 + 0 
1334 : 65 4f __ ADC T4 + 0 
1336 : 18 __ __ CLC
1337 : 69 01 __ ADC #$01
1339 : 85 51 __ STA T5 + 0 
133b : c9 07 __ CMP #$07
133d : 90 14 __ BCC $1353 ; (nformf.s51 + 0)
.s16:
133f : ad 9e 1b LDA $1b9e ; (fround5[0] + 24)
1342 : 85 47 __ STA T1 + 0 
1344 : ad 9f 1b LDA $1b9f ; (fround5[0] + 25)
1347 : 85 48 __ STA T1 + 1 
1349 : ad a0 1b LDA $1ba0 ; (fround5[0] + 26)
134c : 85 49 __ STA T1 + 2 
134e : ad a1 1b LDA $1ba1 ; (fround5[0] + 27)
1351 : b0 15 __ BCS $1368 ; (nformf.s17 + 0)
.s51:
1353 : 0a __ __ ASL
1354 : 0a __ __ ASL
1355 : aa __ __ TAX
1356 : bd 82 1b LDA $1b82,x ; (divmod32 + 213)
1359 : 85 47 __ STA T1 + 0 
135b : bd 83 1b LDA $1b83,x ; (divmod32 + 214)
135e : 85 48 __ STA T1 + 1 
1360 : bd 84 1b LDA $1b84,x ; (spentry + 0)
1363 : 85 49 __ STA T1 + 2 
1365 : bd 85 1b LDA $1b85,x ; (giocharmap + 0)
.s17:
1368 : 85 4a __ STA T1 + 3 
136a : a5 43 __ LDA T0 + 0 
136c : 85 1b __ STA ACCU + 0 
136e : a5 44 __ LDA T0 + 1 
1370 : 85 1c __ STA ACCU + 1 
1372 : a5 45 __ LDA T0 + 2 
1374 : 85 1d __ STA ACCU + 2 
1376 : a5 46 __ LDA T0 + 3 
1378 : 85 1e __ STA ACCU + 3 
137a : a2 47 __ LDX #$47
137c : 20 8a 16 JSR $168a ; (freg + 4)
137f : 20 d1 16 JSR $16d1 ; (faddsub + 6)
1382 : a5 1c __ LDA ACCU + 1 
1384 : 85 16 __ STA P9 ; (f + 1)
1386 : a5 1d __ LDA ACCU + 2 
1388 : 85 17 __ STA P10 ; (f + 2)
138a : a6 1b __ LDX ACCU + 0 
138c : a5 1e __ LDA ACCU + 3 
138e : 85 18 __ STA P11 ; (f + 3)
1390 : 30 3a __ BMI $13cc ; (nformf.s18 + 0)
.s46:
1392 : c9 41 __ CMP #$41
1394 : d0 0d __ BNE $13a3 ; (nformf.s50 + 0)
.s47:
1396 : a5 17 __ LDA P10 ; (f + 2)
1398 : c9 20 __ CMP #$20
139a : d0 07 __ BNE $13a3 ; (nformf.s50 + 0)
.s48:
139c : a5 16 __ LDA P9 ; (f + 1)
139e : d0 03 __ BNE $13a3 ; (nformf.s50 + 0)
.s49:
13a0 : 8a __ __ TXA
13a1 : f0 02 __ BEQ $13a5 ; (nformf.s45 + 0)
.s50:
13a3 : 90 27 __ BCC $13cc ; (nformf.s18 + 0)
.s45:
13a5 : a9 00 __ LDA #$00
13a7 : 85 03 __ STA WORK + 0 
13a9 : 85 04 __ STA WORK + 1 
13ab : a9 20 __ LDA #$20
13ad : 85 05 __ STA WORK + 2 
13af : a9 41 __ LDA #$41
13b1 : 85 06 __ STA WORK + 3 
13b3 : 20 9a 16 JSR $169a ; (freg + 20)
13b6 : 20 80 18 JSR $1880 ; (crt_fdiv + 0)
13b9 : a5 1c __ LDA ACCU + 1 
13bb : 85 16 __ STA P9 ; (f + 1)
13bd : a5 1d __ LDA ACCU + 2 
13bf : 85 17 __ STA P10 ; (f + 2)
13c1 : a5 1e __ LDA ACCU + 3 
13c3 : 85 18 __ STA P11 ; (f + 3)
13c5 : a6 4d __ LDX T3 + 0 
13c7 : ca __ __ DEX
13c8 : 86 52 __ STX T6 + 0 
13ca : a6 1b __ LDX ACCU + 0 
.s18:
13cc : 38 __ __ SEC
13cd : a5 51 __ LDA T5 + 0 
13cf : e5 52 __ SBC T6 + 0 
13d1 : 85 4d __ STA T3 + 0 
13d3 : a9 00 __ LDA #$00
13d5 : e9 00 __ SBC #$00
13d7 : 85 4e __ STA T3 + 1 
13d9 : a9 14 __ LDA #$14
13db : c5 51 __ CMP T5 + 0 
13dd : b0 02 __ BCS $13e1 ; (nformf.s19 + 0)
.s44:
13df : 85 51 __ STA T5 + 0 
.s19:
13e1 : a5 4d __ LDA T3 + 0 
13e3 : d0 08 __ BNE $13ed ; (nformf.s21 + 0)
.s20:
13e5 : a9 30 __ LDA #$30
13e7 : a4 54 __ LDY T9 + 0 
13e9 : 91 13 __ STA (P6),y ; (str + 0)
13eb : e6 54 __ INC T9 + 0 
.s21:
13ed : a9 00 __ LDA #$00
13ef : 85 56 __ STA T11 + 0 
13f1 : c5 4d __ CMP T3 + 0 
13f3 : f0 6f __ BEQ $1464 ; (nformf.l43 + 0)
.s23:
13f5 : c9 07 __ CMP #$07
13f7 : 90 04 __ BCC $13fd ; (nformf.s24 + 0)
.l42:
13f9 : a9 30 __ LDA #$30
13fb : b0 55 __ BCS $1452 ; (nformf.l25 + 0)
.s24:
13fd : 86 1b __ STX ACCU + 0 
13ff : 86 43 __ STX T0 + 0 
1401 : a5 16 __ LDA P9 ; (f + 1)
1403 : 85 1c __ STA ACCU + 1 
1405 : 85 44 __ STA T0 + 1 
1407 : a5 17 __ LDA P10 ; (f + 2)
1409 : 85 1d __ STA ACCU + 2 
140b : 85 45 __ STA T0 + 2 
140d : a5 18 __ LDA P11 ; (f + 3)
140f : 85 1e __ STA ACCU + 3 
1411 : 85 46 __ STA T0 + 3 
1413 : 20 1a 1a JSR $1a1a ; (f32_to_i16 + 0)
1416 : a5 1b __ LDA ACCU + 0 
1418 : 85 53 __ STA T7 + 0 
141a : 20 66 1a JSR $1a66 ; (sint16_to_float + 0)
141d : a2 43 __ LDX #$43
141f : 20 8a 16 JSR $168a ; (freg + 4)
1422 : a5 1e __ LDA ACCU + 3 
1424 : 49 80 __ EOR #$80
1426 : 85 1e __ STA ACCU + 3 
1428 : 20 d1 16 JSR $16d1 ; (faddsub + 6)
142b : a9 00 __ LDA #$00
142d : 85 03 __ STA WORK + 0 
142f : 85 04 __ STA WORK + 1 
1431 : a9 20 __ LDA #$20
1433 : 85 05 __ STA WORK + 2 
1435 : a9 41 __ LDA #$41
1437 : 85 06 __ STA WORK + 3 
1439 : 20 9a 16 JSR $169a ; (freg + 20)
143c : 20 b8 17 JSR $17b8 ; (crt_fmul + 0)
143f : a5 1c __ LDA ACCU + 1 
1441 : 85 16 __ STA P9 ; (f + 1)
1443 : a5 1d __ LDA ACCU + 2 
1445 : 85 17 __ STA P10 ; (f + 2)
1447 : a5 1e __ LDA ACCU + 3 
1449 : 85 18 __ STA P11 ; (f + 3)
144b : 18 __ __ CLC
144c : a5 53 __ LDA T7 + 0 
144e : 69 30 __ ADC #$30
1450 : a6 1b __ LDX ACCU + 0 
.l25:
1452 : a4 54 __ LDY T9 + 0 
1454 : 91 13 __ STA (P6),y ; (str + 0)
1456 : e6 54 __ INC T9 + 0 
1458 : e6 56 __ INC T11 + 0 
145a : a5 56 __ LDA T11 + 0 
145c : c5 51 __ CMP T5 + 0 
145e : b0 14 __ BCS $1474 ; (nformf.s26 + 0)
.s22:
1460 : c5 4d __ CMP T3 + 0 
1462 : d0 91 __ BNE $13f5 ; (nformf.s23 + 0)
.l43:
1464 : a9 2e __ LDA #$2e
1466 : a4 54 __ LDY T9 + 0 
1468 : 91 13 __ STA (P6),y ; (str + 0)
146a : e6 54 __ INC T9 + 0 
146c : a5 56 __ LDA T11 + 0 
146e : c9 07 __ CMP #$07
1470 : 90 8b __ BCC $13fd ; (nformf.s24 + 0)
1472 : b0 85 __ BCS $13f9 ; (nformf.l42 + 0)
.s26:
1474 : a5 55 __ LDA T10 + 0 
1476 : f0 66 __ BEQ $14de ; (nformf.s27 + 0)
.s38:
1478 : a0 03 __ LDY #$03
147a : b1 4b __ LDA (T2 + 0),y 
147c : 69 03 __ ADC #$03
147e : a4 54 __ LDY T9 + 0 
1480 : 91 13 __ STA (P6),y ; (str + 0)
1482 : c8 __ __ INY
1483 : 84 54 __ STY T9 + 0 
1485 : 24 50 __ BIT T4 + 1 
1487 : 30 06 __ BMI $148f ; (nformf.s41 + 0)
.s39:
1489 : a9 2b __ LDA #$2b
148b : 91 13 __ STA (P6),y ; (str + 0)
148d : d0 11 __ BNE $14a0 ; (nformf.s40 + 0)
.s41:
148f : a9 2d __ LDA #$2d
1491 : 91 13 __ STA (P6),y ; (str + 0)
1493 : 38 __ __ SEC
1494 : a9 00 __ LDA #$00
1496 : e5 4f __ SBC T4 + 0 
1498 : 85 4f __ STA T4 + 0 
149a : a9 00 __ LDA #$00
149c : e5 50 __ SBC T4 + 1 
149e : 85 50 __ STA T4 + 1 
.s40:
14a0 : e6 54 __ INC T9 + 0 
14a2 : a5 4f __ LDA T4 + 0 
14a4 : 85 1b __ STA ACCU + 0 
14a6 : a5 50 __ LDA T4 + 1 
14a8 : 85 1c __ STA ACCU + 1 
14aa : a9 0a __ LDA #$0a
14ac : 85 03 __ STA WORK + 0 
14ae : a9 00 __ LDA #$00
14b0 : 85 04 __ STA WORK + 1 
14b2 : 20 2e 19 JSR $192e ; (divs16 + 0)
14b5 : 18 __ __ CLC
14b6 : a5 1b __ LDA ACCU + 0 
14b8 : 69 30 __ ADC #$30
14ba : a4 54 __ LDY T9 + 0 
14bc : 91 13 __ STA (P6),y ; (str + 0)
14be : e6 54 __ INC T9 + 0 
14c0 : a5 4f __ LDA T4 + 0 
14c2 : 85 1b __ STA ACCU + 0 
14c4 : a5 50 __ LDA T4 + 1 
14c6 : 85 1c __ STA ACCU + 1 
14c8 : a9 0a __ LDA #$0a
14ca : 85 03 __ STA WORK + 0 
14cc : a9 00 __ LDA #$00
14ce : 85 04 __ STA WORK + 1 
14d0 : 20 ed 19 JSR $19ed ; (mods16 + 0)
14d3 : 18 __ __ CLC
14d4 : a5 05 __ LDA WORK + 2 
14d6 : 69 30 __ ADC #$30
14d8 : a4 54 __ LDY T9 + 0 
14da : 91 13 __ STA (P6),y ; (str + 0)
14dc : e6 54 __ INC T9 + 0 
.s27:
14de : a5 54 __ LDA T9 + 0 
14e0 : a0 01 __ LDY #$01
14e2 : d1 11 __ CMP (P4),y ; (si + 0)
14e4 : b0 6d __ BCS $1553 ; (nformf.s3 + 0)
.s28:
14e6 : a0 06 __ LDY #$06
14e8 : b1 11 __ LDA (P4),y ; (si + 0)
14ea : f0 04 __ BEQ $14f0 ; (nformf.s29 + 0)
.s110:
14ec : a6 54 __ LDX T9 + 0 
14ee : 90 70 __ BCC $1560 ; (nformf.l36 + 0)
.s29:
14f0 : a5 54 __ LDA T9 + 0 
14f2 : f0 40 __ BEQ $1534 ; (nformf.s30 + 0)
.s35:
14f4 : e9 00 __ SBC #$00
14f6 : a8 __ __ TAY
14f7 : a9 00 __ LDA #$00
14f9 : e9 00 __ SBC #$00
14fb : aa __ __ TAX
14fc : 98 __ __ TYA
14fd : 18 __ __ CLC
14fe : 65 13 __ ADC P6 ; (str + 0)
1500 : 85 47 __ STA T1 + 0 
1502 : 8a __ __ TXA
1503 : 65 14 __ ADC P7 ; (str + 1)
1505 : 85 48 __ STA T1 + 1 
1507 : a9 01 __ LDA #$01
1509 : 85 4d __ STA T3 + 0 
150b : a6 54 __ LDX T9 + 0 
150d : 38 __ __ SEC
.l111:
150e : a0 01 __ LDY #$01
1510 : b1 11 __ LDA (P4),y ; (si + 0)
1512 : e5 4d __ SBC T3 + 0 
1514 : 85 4b __ STA T2 + 0 
1516 : a9 00 __ LDA #$00
1518 : e5 4e __ SBC T3 + 1 
151a : 18 __ __ CLC
151b : 65 14 __ ADC P7 ; (str + 1)
151d : 85 4c __ STA T2 + 1 
151f : 88 __ __ DEY
1520 : b1 47 __ LDA (T1 + 0),y 
1522 : a4 13 __ LDY P6 ; (str + 0)
1524 : 91 4b __ STA (T2 + 0),y 
1526 : a5 47 __ LDA T1 + 0 
1528 : d0 02 __ BNE $152c ; (nformf.s114 + 0)
.s113:
152a : c6 48 __ DEC T1 + 1 
.s114:
152c : c6 47 __ DEC T1 + 0 
152e : e6 4d __ INC T3 + 0 
1530 : e4 4d __ CPX T3 + 0 
1532 : b0 da __ BCS $150e ; (nformf.l111 + 0)
.s30:
1534 : a9 00 __ LDA #$00
1536 : 85 4d __ STA T3 + 0 
1538 : 90 08 __ BCC $1542 ; (nformf.l31 + 0)
.s33:
153a : a9 20 __ LDA #$20
153c : a4 4d __ LDY T3 + 0 
153e : 91 13 __ STA (P6),y ; (str + 0)
1540 : e6 4d __ INC T3 + 0 
.l31:
1542 : a0 01 __ LDY #$01
1544 : b1 11 __ LDA (P4),y ; (si + 0)
1546 : 38 __ __ SEC
1547 : e5 54 __ SBC T9 + 0 
1549 : 90 ef __ BCC $153a ; (nformf.s33 + 0)
.s34:
154b : c5 4d __ CMP T3 + 0 
154d : 90 02 __ BCC $1551 ; (nformf.s32 + 0)
.s112:
154f : d0 e9 __ BNE $153a ; (nformf.s33 + 0)
.s32:
1551 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
1553 : 85 1b __ STA ACCU + 0 
1555 : a2 03 __ LDX #$03
1557 : bd e9 9f LDA $9fe9,x ; (nformf@stack + 0)
155a : 95 53 __ STA T7 + 0,x 
155c : ca __ __ DEX
155d : 10 f8 __ BPL $1557 ; (nformf.s3 + 4)
155f : 60 __ __ RTS
.l36:
1560 : 8a __ __ TXA
1561 : a0 01 __ LDY #$01
1563 : d1 11 __ CMP (P4),y ; (si + 0)
1565 : b0 ea __ BCS $1551 ; (nformf.s32 + 0)
.s37:
1567 : a8 __ __ TAY
1568 : a9 20 __ LDA #$20
156a : 91 13 __ STA (P6),y ; (str + 0)
156c : e8 __ __ INX
156d : 90 f1 __ BCC $1560 ; (nformf.l36 + 0)
.s53:
156f : a5 51 __ LDA T5 + 0 
1571 : c9 07 __ CMP #$07
1573 : 90 14 __ BCC $1589 ; (nformf.s62 + 0)
.s54:
1575 : ad 9e 1b LDA $1b9e ; (fround5[0] + 24)
1578 : 85 47 __ STA T1 + 0 
157a : ad 9f 1b LDA $1b9f ; (fround5[0] + 25)
157d : 85 48 __ STA T1 + 1 
157f : ad a0 1b LDA $1ba0 ; (fround5[0] + 26)
1582 : 85 49 __ STA T1 + 2 
1584 : ad a1 1b LDA $1ba1 ; (fround5[0] + 27)
1587 : b0 15 __ BCS $159e ; (nformf.s55 + 0)
.s62:
1589 : 0a __ __ ASL
158a : 0a __ __ ASL
158b : aa __ __ TAX
158c : bd 82 1b LDA $1b82,x ; (divmod32 + 213)
158f : 85 47 __ STA T1 + 0 
1591 : bd 83 1b LDA $1b83,x ; (divmod32 + 214)
1594 : 85 48 __ STA T1 + 1 
1596 : bd 84 1b LDA $1b84,x ; (spentry + 0)
1599 : 85 49 __ STA T1 + 2 
159b : bd 85 1b LDA $1b85,x ; (giocharmap + 0)
.s55:
159e : 85 4a __ STA T1 + 3 
15a0 : a5 43 __ LDA T0 + 0 
15a2 : 85 1b __ STA ACCU + 0 
15a4 : a5 44 __ LDA T0 + 1 
15a6 : 85 1c __ STA ACCU + 1 
15a8 : a5 45 __ LDA T0 + 2 
15aa : 85 1d __ STA ACCU + 2 
15ac : a5 46 __ LDA T0 + 3 
15ae : 85 1e __ STA ACCU + 3 
15b0 : a2 47 __ LDX #$47
15b2 : 20 8a 16 JSR $168a ; (freg + 4)
15b5 : 20 d1 16 JSR $16d1 ; (faddsub + 6)
15b8 : a5 1c __ LDA ACCU + 1 
15ba : 85 16 __ STA P9 ; (f + 1)
15bc : a5 1d __ LDA ACCU + 2 
15be : 85 17 __ STA P10 ; (f + 2)
15c0 : a6 1b __ LDX ACCU + 0 
15c2 : a5 1e __ LDA ACCU + 3 
15c4 : 85 18 __ STA P11 ; (f + 3)
15c6 : 10 03 __ BPL $15cb ; (nformf.s57 + 0)
15c8 : 4c cc 13 JMP $13cc ; (nformf.s18 + 0)
.s57:
15cb : c9 41 __ CMP #$41
15cd : d0 0d __ BNE $15dc ; (nformf.s61 + 0)
.s58:
15cf : a5 17 __ LDA P10 ; (f + 2)
15d1 : c9 20 __ CMP #$20
15d3 : d0 07 __ BNE $15dc ; (nformf.s61 + 0)
.s59:
15d5 : a5 16 __ LDA P9 ; (f + 1)
15d7 : d0 03 __ BNE $15dc ; (nformf.s61 + 0)
.s60:
15d9 : 8a __ __ TXA
15da : f0 02 __ BEQ $15de ; (nformf.s56 + 0)
.s61:
15dc : 90 ea __ BCC $15c8 ; (nformf.s55 + 42)
.s56:
15de : a9 00 __ LDA #$00
15e0 : 85 03 __ STA WORK + 0 
15e2 : 85 04 __ STA WORK + 1 
15e4 : a9 20 __ LDA #$20
15e6 : 85 05 __ STA WORK + 2 
15e8 : a9 41 __ LDA #$41
15ea : 85 06 __ STA WORK + 3 
15ec : 20 9a 16 JSR $169a ; (freg + 20)
15ef : 20 80 18 JSR $1880 ; (crt_fdiv + 0)
15f2 : a5 1c __ LDA ACCU + 1 
15f4 : 85 16 __ STA P9 ; (f + 1)
15f6 : a5 1d __ LDA ACCU + 2 
15f8 : 85 17 __ STA P10 ; (f + 2)
15fa : a5 1e __ LDA ACCU + 3 
15fc : 85 18 __ STA P11 ; (f + 3)
15fe : a6 1b __ LDX ACCU + 0 
1600 : e6 4f __ INC T4 + 0 
1602 : d0 c4 __ BNE $15c8 ; (nformf.s55 + 42)
.s117:
1604 : e6 50 __ INC T4 + 1 
1606 : 4c cc 13 JMP $13cc ; (nformf.s18 + 0)
.s102:
1609 : 86 43 __ STX T0 + 0 
160b : 85 47 __ STA T1 + 0 
160d : a0 03 __ LDY #$03
160f : b1 11 __ LDA (P4),y ; (si + 0)
1611 : 18 __ __ CLC
1612 : 69 08 __ ADC #$08
1614 : a4 43 __ LDY T0 + 0 
1616 : 91 13 __ STA (P6),y ; (str + 0)
1618 : 18 __ __ CLC
1619 : a0 03 __ LDY #$03
161b : b1 11 __ LDA (P4),y ; (si + 0)
161d : 69 0d __ ADC #$0d
161f : a4 43 __ LDY T0 + 0 
1621 : c8 __ __ INY
1622 : 91 13 __ STA (P6),y ; (str + 0)
1624 : a0 03 __ LDY #$03
1626 : b1 11 __ LDA (P4),y ; (si + 0)
1628 : 18 __ __ CLC
1629 : 69 05 __ ADC #$05
162b : a4 47 __ LDY T1 + 0 
162d : 91 13 __ STA (P6),y ; (str + 0)
162f : 18 __ __ CLC
1630 : a5 54 __ LDA T9 + 0 
1632 : 69 03 __ ADC #$03
1634 : 85 54 __ STA T9 + 0 
1636 : 4c de 14 JMP $14de ; (nformf.s27 + 0)
.s104:
1639 : 20 4a 16 JSR $164a ; (isinf.s4 + 0)
163c : a2 01 __ LDX #$01
163e : 86 54 __ STX T9 + 0 
1640 : a8 __ __ TAY
1641 : d0 03 __ BNE $1646 ; (nformf.s105 + 0)
1643 : 4c 53 11 JMP $1153 ; (nformf.s7 + 0)
.s105:
1646 : a9 03 __ LDA #$03
1648 : d0 bf __ BNE $1609 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
164a : 06 0f __ ASL P2 ; (f + 2)
164c : a5 10 __ LDA P3 ; (f + 3)
164e : 2a __ __ ROL
164f : c9 ff __ CMP #$ff
1651 : d0 03 __ BNE $1656 ; (isinf.s6 + 0)
.s5:
1653 : a9 01 __ LDA #$01
1655 : 60 __ __ RTS
.s6:
1656 : a9 00 __ LDA #$00
.s3:
1658 : 60 __ __ RTS
--------------------------------------------------------------------
1659 : __ __ __ BYT 25 75 20 25 73 0a 00                            : %u %s..
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1660 : 20 cc ff JSR $ffcc 
.s3:
1663 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1664 : 85 0d __ STA P0 
1666 : a5 0d __ LDA P0 
1668 : 20 c3 ff JSR $ffc3 
.s3:
166b : 60 __ __ RTS
--------------------------------------------------------------------
166c : __ __ __ BYT 46 41 49 4c 20 4f 50 45 4e 20 25 64 0a 00       : FAIL OPEN %d..
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
167a : 20 b7 ff JSR $ffb7 
167d : 85 1b __ STA ACCU + 0 
167f : a9 00 __ LDA #$00
1681 : 85 1c __ STA ACCU + 1 
.s3:
1683 : a5 1b __ LDA ACCU + 0 
1685 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
1686 : b1 19 __ LDA (IP + 0),y 
1688 : c8 __ __ INY
1689 : aa __ __ TAX
168a : b5 00 __ LDA $00,x 
168c : 85 03 __ STA WORK + 0 
168e : b5 01 __ LDA $01,x 
1690 : 85 04 __ STA WORK + 1 
1692 : b5 02 __ LDA $02,x 
1694 : 85 05 __ STA WORK + 2 
1696 : b5 03 __ LDA WORK + 0,x 
1698 : 85 06 __ STA WORK + 3 
169a : a5 05 __ LDA WORK + 2 
169c : 0a __ __ ASL
169d : a5 06 __ LDA WORK + 3 
169f : 2a __ __ ROL
16a0 : 85 08 __ STA WORK + 5 
16a2 : f0 06 __ BEQ $16aa ; (freg + 36)
16a4 : a5 05 __ LDA WORK + 2 
16a6 : 09 80 __ ORA #$80
16a8 : 85 05 __ STA WORK + 2 
16aa : a5 1d __ LDA ACCU + 2 
16ac : 0a __ __ ASL
16ad : a5 1e __ LDA ACCU + 3 
16af : 2a __ __ ROL
16b0 : 85 07 __ STA WORK + 4 
16b2 : f0 06 __ BEQ $16ba ; (freg + 52)
16b4 : a5 1d __ LDA ACCU + 2 
16b6 : 09 80 __ ORA #$80
16b8 : 85 1d __ STA ACCU + 2 
16ba : 60 __ __ RTS
16bb : 06 1e __ ASL ACCU + 3 
16bd : a5 07 __ LDA WORK + 4 
16bf : 6a __ __ ROR
16c0 : 85 1e __ STA ACCU + 3 
16c2 : b0 06 __ BCS $16ca ; (freg + 68)
16c4 : a5 1d __ LDA ACCU + 2 
16c6 : 29 7f __ AND #$7f
16c8 : 85 1d __ STA ACCU + 2 
16ca : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
16cb : a5 06 __ LDA WORK + 3 
16cd : 49 80 __ EOR #$80
16cf : 85 06 __ STA WORK + 3 
16d1 : a9 ff __ LDA #$ff
16d3 : c5 07 __ CMP WORK + 4 
16d5 : f0 04 __ BEQ $16db ; (faddsub + 16)
16d7 : c5 08 __ CMP WORK + 5 
16d9 : d0 11 __ BNE $16ec ; (faddsub + 33)
16db : a5 1e __ LDA ACCU + 3 
16dd : 09 7f __ ORA #$7f
16df : 85 1e __ STA ACCU + 3 
16e1 : a9 80 __ LDA #$80
16e3 : 85 1d __ STA ACCU + 2 
16e5 : a9 00 __ LDA #$00
16e7 : 85 1b __ STA ACCU + 0 
16e9 : 85 1c __ STA ACCU + 1 
16eb : 60 __ __ RTS
16ec : 38 __ __ SEC
16ed : a5 07 __ LDA WORK + 4 
16ef : e5 08 __ SBC WORK + 5 
16f1 : f0 38 __ BEQ $172b ; (faddsub + 96)
16f3 : aa __ __ TAX
16f4 : b0 25 __ BCS $171b ; (faddsub + 80)
16f6 : e0 e9 __ CPX #$e9
16f8 : b0 0e __ BCS $1708 ; (faddsub + 61)
16fa : a5 08 __ LDA WORK + 5 
16fc : 85 07 __ STA WORK + 4 
16fe : a9 00 __ LDA #$00
1700 : 85 1b __ STA ACCU + 0 
1702 : 85 1c __ STA ACCU + 1 
1704 : 85 1d __ STA ACCU + 2 
1706 : f0 23 __ BEQ $172b ; (faddsub + 96)
1708 : a5 1d __ LDA ACCU + 2 
170a : 4a __ __ LSR
170b : 66 1c __ ROR ACCU + 1 
170d : 66 1b __ ROR ACCU + 0 
170f : e8 __ __ INX
1710 : d0 f8 __ BNE $170a ; (faddsub + 63)
1712 : 85 1d __ STA ACCU + 2 
1714 : a5 08 __ LDA WORK + 5 
1716 : 85 07 __ STA WORK + 4 
1718 : 4c 2b 17 JMP $172b ; (faddsub + 96)
171b : e0 18 __ CPX #$18
171d : b0 33 __ BCS $1752 ; (faddsub + 135)
171f : a5 05 __ LDA WORK + 2 
1721 : 4a __ __ LSR
1722 : 66 04 __ ROR WORK + 1 
1724 : 66 03 __ ROR WORK + 0 
1726 : ca __ __ DEX
1727 : d0 f8 __ BNE $1721 ; (faddsub + 86)
1729 : 85 05 __ STA WORK + 2 
172b : a5 1e __ LDA ACCU + 3 
172d : 29 80 __ AND #$80
172f : 85 1e __ STA ACCU + 3 
1731 : 45 06 __ EOR WORK + 3 
1733 : 30 31 __ BMI $1766 ; (faddsub + 155)
1735 : 18 __ __ CLC
1736 : a5 1b __ LDA ACCU + 0 
1738 : 65 03 __ ADC WORK + 0 
173a : 85 1b __ STA ACCU + 0 
173c : a5 1c __ LDA ACCU + 1 
173e : 65 04 __ ADC WORK + 1 
1740 : 85 1c __ STA ACCU + 1 
1742 : a5 1d __ LDA ACCU + 2 
1744 : 65 05 __ ADC WORK + 2 
1746 : 85 1d __ STA ACCU + 2 
1748 : 90 08 __ BCC $1752 ; (faddsub + 135)
174a : 66 1d __ ROR ACCU + 2 
174c : 66 1c __ ROR ACCU + 1 
174e : 66 1b __ ROR ACCU + 0 
1750 : e6 07 __ INC WORK + 4 
1752 : a5 07 __ LDA WORK + 4 
1754 : c9 ff __ CMP #$ff
1756 : f0 83 __ BEQ $16db ; (faddsub + 16)
1758 : 4a __ __ LSR
1759 : 05 1e __ ORA ACCU + 3 
175b : 85 1e __ STA ACCU + 3 
175d : b0 06 __ BCS $1765 ; (faddsub + 154)
175f : a5 1d __ LDA ACCU + 2 
1761 : 29 7f __ AND #$7f
1763 : 85 1d __ STA ACCU + 2 
1765 : 60 __ __ RTS
1766 : 38 __ __ SEC
1767 : a5 1b __ LDA ACCU + 0 
1769 : e5 03 __ SBC WORK + 0 
176b : 85 1b __ STA ACCU + 0 
176d : a5 1c __ LDA ACCU + 1 
176f : e5 04 __ SBC WORK + 1 
1771 : 85 1c __ STA ACCU + 1 
1773 : a5 1d __ LDA ACCU + 2 
1775 : e5 05 __ SBC WORK + 2 
1777 : 85 1d __ STA ACCU + 2 
1779 : b0 19 __ BCS $1794 ; (faddsub + 201)
177b : 38 __ __ SEC
177c : a9 00 __ LDA #$00
177e : e5 1b __ SBC ACCU + 0 
1780 : 85 1b __ STA ACCU + 0 
1782 : a9 00 __ LDA #$00
1784 : e5 1c __ SBC ACCU + 1 
1786 : 85 1c __ STA ACCU + 1 
1788 : a9 00 __ LDA #$00
178a : e5 1d __ SBC ACCU + 2 
178c : 85 1d __ STA ACCU + 2 
178e : a5 1e __ LDA ACCU + 3 
1790 : 49 80 __ EOR #$80
1792 : 85 1e __ STA ACCU + 3 
1794 : a5 1d __ LDA ACCU + 2 
1796 : 30 ba __ BMI $1752 ; (faddsub + 135)
1798 : 05 1c __ ORA ACCU + 1 
179a : 05 1b __ ORA ACCU + 0 
179c : f0 0f __ BEQ $17ad ; (faddsub + 226)
179e : c6 07 __ DEC WORK + 4 
17a0 : f0 0b __ BEQ $17ad ; (faddsub + 226)
17a2 : 06 1b __ ASL ACCU + 0 
17a4 : 26 1c __ ROL ACCU + 1 
17a6 : 26 1d __ ROL ACCU + 2 
17a8 : 10 f4 __ BPL $179e ; (faddsub + 211)
17aa : 4c 52 17 JMP $1752 ; (faddsub + 135)
17ad : a9 00 __ LDA #$00
17af : 85 1b __ STA ACCU + 0 
17b1 : 85 1c __ STA ACCU + 1 
17b3 : 85 1d __ STA ACCU + 2 
17b5 : 85 1e __ STA ACCU + 3 
17b7 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
17b8 : a5 1b __ LDA ACCU + 0 
17ba : 05 1c __ ORA ACCU + 1 
17bc : 05 1d __ ORA ACCU + 2 
17be : f0 0e __ BEQ $17ce ; (crt_fmul + 22)
17c0 : a5 03 __ LDA WORK + 0 
17c2 : 05 04 __ ORA WORK + 1 
17c4 : 05 05 __ ORA WORK + 2 
17c6 : d0 09 __ BNE $17d1 ; (crt_fmul + 25)
17c8 : 85 1b __ STA ACCU + 0 
17ca : 85 1c __ STA ACCU + 1 
17cc : 85 1d __ STA ACCU + 2 
17ce : 85 1e __ STA ACCU + 3 
17d0 : 60 __ __ RTS
17d1 : a5 1e __ LDA ACCU + 3 
17d3 : 45 06 __ EOR WORK + 3 
17d5 : 29 80 __ AND #$80
17d7 : 85 1e __ STA ACCU + 3 
17d9 : a9 ff __ LDA #$ff
17db : c5 07 __ CMP WORK + 4 
17dd : f0 42 __ BEQ $1821 ; (crt_fmul + 105)
17df : c5 08 __ CMP WORK + 5 
17e1 : f0 3e __ BEQ $1821 ; (crt_fmul + 105)
17e3 : a9 00 __ LDA #$00
17e5 : 85 09 __ STA WORK + 6 
17e7 : 85 0a __ STA WORK + 7 
17e9 : 85 0b __ STA WORK + 8 
17eb : a4 1b __ LDY ACCU + 0 
17ed : a5 03 __ LDA WORK + 0 
17ef : d0 06 __ BNE $17f7 ; (crt_fmul + 63)
17f1 : a5 04 __ LDA WORK + 1 
17f3 : f0 0a __ BEQ $17ff ; (crt_fmul + 71)
17f5 : d0 05 __ BNE $17fc ; (crt_fmul + 68)
17f7 : 20 52 18 JSR $1852 ; (crt_fmul8 + 0)
17fa : a5 04 __ LDA WORK + 1 
17fc : 20 52 18 JSR $1852 ; (crt_fmul8 + 0)
17ff : a5 05 __ LDA WORK + 2 
1801 : 20 52 18 JSR $1852 ; (crt_fmul8 + 0)
1804 : 38 __ __ SEC
1805 : a5 0b __ LDA WORK + 8 
1807 : 30 06 __ BMI $180f ; (crt_fmul + 87)
1809 : 06 09 __ ASL WORK + 6 
180b : 26 0a __ ROL WORK + 7 
180d : 2a __ __ ROL
180e : 18 __ __ CLC
180f : 29 7f __ AND #$7f
1811 : 85 0b __ STA WORK + 8 
1813 : a5 07 __ LDA WORK + 4 
1815 : 65 08 __ ADC WORK + 5 
1817 : 90 19 __ BCC $1832 ; (crt_fmul + 122)
1819 : e9 7f __ SBC #$7f
181b : b0 04 __ BCS $1821 ; (crt_fmul + 105)
181d : c9 ff __ CMP #$ff
181f : d0 15 __ BNE $1836 ; (crt_fmul + 126)
1821 : a5 1e __ LDA ACCU + 3 
1823 : 09 7f __ ORA #$7f
1825 : 85 1e __ STA ACCU + 3 
1827 : a9 80 __ LDA #$80
1829 : 85 1d __ STA ACCU + 2 
182b : a9 00 __ LDA #$00
182d : 85 1b __ STA ACCU + 0 
182f : 85 1c __ STA ACCU + 1 
1831 : 60 __ __ RTS
1832 : e9 7e __ SBC #$7e
1834 : 90 15 __ BCC $184b ; (crt_fmul + 147)
1836 : 4a __ __ LSR
1837 : 05 1e __ ORA ACCU + 3 
1839 : 85 1e __ STA ACCU + 3 
183b : a9 00 __ LDA #$00
183d : 6a __ __ ROR
183e : 05 0b __ ORA WORK + 8 
1840 : 85 1d __ STA ACCU + 2 
1842 : a5 0a __ LDA WORK + 7 
1844 : 85 1c __ STA ACCU + 1 
1846 : a5 09 __ LDA WORK + 6 
1848 : 85 1b __ STA ACCU + 0 
184a : 60 __ __ RTS
184b : a9 00 __ LDA #$00
184d : 85 1e __ STA ACCU + 3 
184f : f0 d8 __ BEQ $1829 ; (crt_fmul + 113)
1851 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1852 : 38 __ __ SEC
1853 : 6a __ __ ROR
1854 : 90 1e __ BCC $1874 ; (crt_fmul8 + 34)
1856 : aa __ __ TAX
1857 : 18 __ __ CLC
1858 : 98 __ __ TYA
1859 : 65 09 __ ADC WORK + 6 
185b : 85 09 __ STA WORK + 6 
185d : a5 0a __ LDA WORK + 7 
185f : 65 1c __ ADC ACCU + 1 
1861 : 85 0a __ STA WORK + 7 
1863 : a5 0b __ LDA WORK + 8 
1865 : 65 1d __ ADC ACCU + 2 
1867 : 6a __ __ ROR
1868 : 85 0b __ STA WORK + 8 
186a : 8a __ __ TXA
186b : 66 0a __ ROR WORK + 7 
186d : 66 09 __ ROR WORK + 6 
186f : 4a __ __ LSR
1870 : f0 0d __ BEQ $187f ; (crt_fmul8 + 45)
1872 : b0 e2 __ BCS $1856 ; (crt_fmul8 + 4)
1874 : 66 0b __ ROR WORK + 8 
1876 : 66 0a __ ROR WORK + 7 
1878 : 66 09 __ ROR WORK + 6 
187a : 4a __ __ LSR
187b : 90 f7 __ BCC $1874 ; (crt_fmul8 + 34)
187d : d0 d7 __ BNE $1856 ; (crt_fmul8 + 4)
187f : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1880 : a5 1b __ LDA ACCU + 0 
1882 : 05 1c __ ORA ACCU + 1 
1884 : 05 1d __ ORA ACCU + 2 
1886 : d0 03 __ BNE $188b ; (crt_fdiv + 11)
1888 : 85 1e __ STA ACCU + 3 
188a : 60 __ __ RTS
188b : a5 1e __ LDA ACCU + 3 
188d : 45 06 __ EOR WORK + 3 
188f : 29 80 __ AND #$80
1891 : 85 1e __ STA ACCU + 3 
1893 : a5 08 __ LDA WORK + 5 
1895 : f0 62 __ BEQ $18f9 ; (crt_fdiv + 121)
1897 : a5 07 __ LDA WORK + 4 
1899 : c9 ff __ CMP #$ff
189b : f0 5c __ BEQ $18f9 ; (crt_fdiv + 121)
189d : a9 00 __ LDA #$00
189f : 85 09 __ STA WORK + 6 
18a1 : 85 0a __ STA WORK + 7 
18a3 : 85 0b __ STA WORK + 8 
18a5 : a2 18 __ LDX #$18
18a7 : a5 1b __ LDA ACCU + 0 
18a9 : c5 03 __ CMP WORK + 0 
18ab : a5 1c __ LDA ACCU + 1 
18ad : e5 04 __ SBC WORK + 1 
18af : a5 1d __ LDA ACCU + 2 
18b1 : e5 05 __ SBC WORK + 2 
18b3 : 90 13 __ BCC $18c8 ; (crt_fdiv + 72)
18b5 : a5 1b __ LDA ACCU + 0 
18b7 : e5 03 __ SBC WORK + 0 
18b9 : 85 1b __ STA ACCU + 0 
18bb : a5 1c __ LDA ACCU + 1 
18bd : e5 04 __ SBC WORK + 1 
18bf : 85 1c __ STA ACCU + 1 
18c1 : a5 1d __ LDA ACCU + 2 
18c3 : e5 05 __ SBC WORK + 2 
18c5 : 85 1d __ STA ACCU + 2 
18c7 : 38 __ __ SEC
18c8 : 26 09 __ ROL WORK + 6 
18ca : 26 0a __ ROL WORK + 7 
18cc : 26 0b __ ROL WORK + 8 
18ce : ca __ __ DEX
18cf : f0 0a __ BEQ $18db ; (crt_fdiv + 91)
18d1 : 06 1b __ ASL ACCU + 0 
18d3 : 26 1c __ ROL ACCU + 1 
18d5 : 26 1d __ ROL ACCU + 2 
18d7 : b0 dc __ BCS $18b5 ; (crt_fdiv + 53)
18d9 : 90 cc __ BCC $18a7 ; (crt_fdiv + 39)
18db : 38 __ __ SEC
18dc : a5 0b __ LDA WORK + 8 
18de : 30 06 __ BMI $18e6 ; (crt_fdiv + 102)
18e0 : 06 09 __ ASL WORK + 6 
18e2 : 26 0a __ ROL WORK + 7 
18e4 : 2a __ __ ROL
18e5 : 18 __ __ CLC
18e6 : 29 7f __ AND #$7f
18e8 : 85 0b __ STA WORK + 8 
18ea : a5 07 __ LDA WORK + 4 
18ec : e5 08 __ SBC WORK + 5 
18ee : 90 1a __ BCC $190a ; (crt_fdiv + 138)
18f0 : 18 __ __ CLC
18f1 : 69 7f __ ADC #$7f
18f3 : b0 04 __ BCS $18f9 ; (crt_fdiv + 121)
18f5 : c9 ff __ CMP #$ff
18f7 : d0 15 __ BNE $190e ; (crt_fdiv + 142)
18f9 : a5 1e __ LDA ACCU + 3 
18fb : 09 7f __ ORA #$7f
18fd : 85 1e __ STA ACCU + 3 
18ff : a9 80 __ LDA #$80
1901 : 85 1d __ STA ACCU + 2 
1903 : a9 00 __ LDA #$00
1905 : 85 1c __ STA ACCU + 1 
1907 : 85 1b __ STA ACCU + 0 
1909 : 60 __ __ RTS
190a : 69 7f __ ADC #$7f
190c : 90 15 __ BCC $1923 ; (crt_fdiv + 163)
190e : 4a __ __ LSR
190f : 05 1e __ ORA ACCU + 3 
1911 : 85 1e __ STA ACCU + 3 
1913 : a9 00 __ LDA #$00
1915 : 6a __ __ ROR
1916 : 05 0b __ ORA WORK + 8 
1918 : 85 1d __ STA ACCU + 2 
191a : a5 0a __ LDA WORK + 7 
191c : 85 1c __ STA ACCU + 1 
191e : a5 09 __ LDA WORK + 6 
1920 : 85 1b __ STA ACCU + 0 
1922 : 60 __ __ RTS
1923 : a9 00 __ LDA #$00
1925 : 85 1e __ STA ACCU + 3 
1927 : 85 1d __ STA ACCU + 2 
1929 : 85 1c __ STA ACCU + 1 
192b : 85 1b __ STA ACCU + 0 
192d : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
192e : 24 1c __ BIT ACCU + 1 
1930 : 10 0d __ BPL $193f ; (divs16 + 17)
1932 : 20 4c 19 JSR $194c ; (negaccu + 0)
1935 : 24 04 __ BIT WORK + 1 
1937 : 10 0d __ BPL $1946 ; (divs16 + 24)
1939 : 20 5a 19 JSR $195a ; (negtmp + 0)
193c : 4c 68 19 JMP $1968 ; (divmod + 0)
193f : 24 04 __ BIT WORK + 1 
1941 : 10 f9 __ BPL $193c ; (divs16 + 14)
1943 : 20 5a 19 JSR $195a ; (negtmp + 0)
1946 : 20 68 19 JSR $1968 ; (divmod + 0)
1949 : 4c 4c 19 JMP $194c ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
194c : 38 __ __ SEC
194d : a9 00 __ LDA #$00
194f : e5 1b __ SBC ACCU + 0 
1951 : 85 1b __ STA ACCU + 0 
1953 : a9 00 __ LDA #$00
1955 : e5 1c __ SBC ACCU + 1 
1957 : 85 1c __ STA ACCU + 1 
1959 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
195a : 38 __ __ SEC
195b : a9 00 __ LDA #$00
195d : e5 03 __ SBC WORK + 0 
195f : 85 03 __ STA WORK + 0 
1961 : a9 00 __ LDA #$00
1963 : e5 04 __ SBC WORK + 1 
1965 : 85 04 __ STA WORK + 1 
1967 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1968 : a5 1c __ LDA ACCU + 1 
196a : d0 31 __ BNE $199d ; (divmod + 53)
196c : a5 04 __ LDA WORK + 1 
196e : d0 1e __ BNE $198e ; (divmod + 38)
1970 : 85 06 __ STA WORK + 3 
1972 : a2 04 __ LDX #$04
1974 : 06 1b __ ASL ACCU + 0 
1976 : 2a __ __ ROL
1977 : c5 03 __ CMP WORK + 0 
1979 : 90 02 __ BCC $197d ; (divmod + 21)
197b : e5 03 __ SBC WORK + 0 
197d : 26 1b __ ROL ACCU + 0 
197f : 2a __ __ ROL
1980 : c5 03 __ CMP WORK + 0 
1982 : 90 02 __ BCC $1986 ; (divmod + 30)
1984 : e5 03 __ SBC WORK + 0 
1986 : 26 1b __ ROL ACCU + 0 
1988 : ca __ __ DEX
1989 : d0 eb __ BNE $1976 ; (divmod + 14)
198b : 85 05 __ STA WORK + 2 
198d : 60 __ __ RTS
198e : a5 1b __ LDA ACCU + 0 
1990 : 85 05 __ STA WORK + 2 
1992 : a5 1c __ LDA ACCU + 1 
1994 : 85 06 __ STA WORK + 3 
1996 : a9 00 __ LDA #$00
1998 : 85 1b __ STA ACCU + 0 
199a : 85 1c __ STA ACCU + 1 
199c : 60 __ __ RTS
199d : a5 04 __ LDA WORK + 1 
199f : d0 1f __ BNE $19c0 ; (divmod + 88)
19a1 : a5 03 __ LDA WORK + 0 
19a3 : 30 1b __ BMI $19c0 ; (divmod + 88)
19a5 : a9 00 __ LDA #$00
19a7 : 85 06 __ STA WORK + 3 
19a9 : a2 10 __ LDX #$10
19ab : 06 1b __ ASL ACCU + 0 
19ad : 26 1c __ ROL ACCU + 1 
19af : 2a __ __ ROL
19b0 : c5 03 __ CMP WORK + 0 
19b2 : 90 02 __ BCC $19b6 ; (divmod + 78)
19b4 : e5 03 __ SBC WORK + 0 
19b6 : 26 1b __ ROL ACCU + 0 
19b8 : 26 1c __ ROL ACCU + 1 
19ba : ca __ __ DEX
19bb : d0 f2 __ BNE $19af ; (divmod + 71)
19bd : 85 05 __ STA WORK + 2 
19bf : 60 __ __ RTS
19c0 : a9 00 __ LDA #$00
19c2 : 85 05 __ STA WORK + 2 
19c4 : 85 06 __ STA WORK + 3 
19c6 : 84 02 __ STY $02 
19c8 : a0 10 __ LDY #$10
19ca : 18 __ __ CLC
19cb : 26 1b __ ROL ACCU + 0 
19cd : 26 1c __ ROL ACCU + 1 
19cf : 26 05 __ ROL WORK + 2 
19d1 : 26 06 __ ROL WORK + 3 
19d3 : 38 __ __ SEC
19d4 : a5 05 __ LDA WORK + 2 
19d6 : e5 03 __ SBC WORK + 0 
19d8 : aa __ __ TAX
19d9 : a5 06 __ LDA WORK + 3 
19db : e5 04 __ SBC WORK + 1 
19dd : 90 04 __ BCC $19e3 ; (divmod + 123)
19df : 86 05 __ STX WORK + 2 
19e1 : 85 06 __ STA WORK + 3 
19e3 : 88 __ __ DEY
19e4 : d0 e5 __ BNE $19cb ; (divmod + 99)
19e6 : 26 1b __ ROL ACCU + 0 
19e8 : 26 1c __ ROL ACCU + 1 
19ea : a4 02 __ LDY $02 
19ec : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
19ed : 24 1c __ BIT ACCU + 1 
19ef : 10 10 __ BPL $1a01 ; (mods16 + 20)
19f1 : 20 4c 19 JSR $194c ; (negaccu + 0)
19f4 : 24 04 __ BIT WORK + 1 
19f6 : 10 03 __ BPL $19fb ; (mods16 + 14)
19f8 : 20 5a 19 JSR $195a ; (negtmp + 0)
19fb : 20 68 19 JSR $1968 ; (divmod + 0)
19fe : 4c 0c 1a JMP $1a0c ; (negtmpb + 0)
1a01 : 24 04 __ BIT WORK + 1 
1a03 : 10 03 __ BPL $1a08 ; (mods16 + 27)
1a05 : 20 5a 19 JSR $195a ; (negtmp + 0)
1a08 : 4c 68 19 JMP $1968 ; (divmod + 0)
1a0b : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
1a0c : 38 __ __ SEC
1a0d : a9 00 __ LDA #$00
1a0f : e5 05 __ SBC WORK + 2 
1a11 : 85 05 __ STA WORK + 2 
1a13 : a9 00 __ LDA #$00
1a15 : e5 06 __ SBC WORK + 3 
1a17 : 85 06 __ STA WORK + 3 
1a19 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1a1a : 20 aa 16 JSR $16aa ; (freg + 36)
1a1d : a5 07 __ LDA WORK + 4 
1a1f : c9 7f __ CMP #$7f
1a21 : b0 07 __ BCS $1a2a ; (f32_to_i16 + 16)
1a23 : a9 00 __ LDA #$00
1a25 : 85 1b __ STA ACCU + 0 
1a27 : 85 1c __ STA ACCU + 1 
1a29 : 60 __ __ RTS
1a2a : e9 8e __ SBC #$8e
1a2c : 90 16 __ BCC $1a44 ; (f32_to_i16 + 42)
1a2e : 24 1e __ BIT ACCU + 3 
1a30 : 30 09 __ BMI $1a3b ; (f32_to_i16 + 33)
1a32 : a9 ff __ LDA #$ff
1a34 : 85 1b __ STA ACCU + 0 
1a36 : a9 7f __ LDA #$7f
1a38 : 85 1c __ STA ACCU + 1 
1a3a : 60 __ __ RTS
1a3b : a9 00 __ LDA #$00
1a3d : 85 1b __ STA ACCU + 0 
1a3f : a9 80 __ LDA #$80
1a41 : 85 1c __ STA ACCU + 1 
1a43 : 60 __ __ RTS
1a44 : aa __ __ TAX
1a45 : a5 1c __ LDA ACCU + 1 
1a47 : 46 1d __ LSR ACCU + 2 
1a49 : 6a __ __ ROR
1a4a : e8 __ __ INX
1a4b : d0 fa __ BNE $1a47 ; (f32_to_i16 + 45)
1a4d : 24 1e __ BIT ACCU + 3 
1a4f : 10 0e __ BPL $1a5f ; (f32_to_i16 + 69)
1a51 : 38 __ __ SEC
1a52 : 49 ff __ EOR #$ff
1a54 : 69 00 __ ADC #$00
1a56 : 85 1b __ STA ACCU + 0 
1a58 : a9 00 __ LDA #$00
1a5a : e5 1d __ SBC ACCU + 2 
1a5c : 85 1c __ STA ACCU + 1 
1a5e : 60 __ __ RTS
1a5f : 85 1b __ STA ACCU + 0 
1a61 : a5 1d __ LDA ACCU + 2 
1a63 : 85 1c __ STA ACCU + 1 
1a65 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1a66 : 24 1c __ BIT ACCU + 1 
1a68 : 30 03 __ BMI $1a6d ; (sint16_to_float + 7)
1a6a : 4c 84 1a JMP $1a84 ; (uint16_to_float + 0)
1a6d : 38 __ __ SEC
1a6e : a9 00 __ LDA #$00
1a70 : e5 1b __ SBC ACCU + 0 
1a72 : 85 1b __ STA ACCU + 0 
1a74 : a9 00 __ LDA #$00
1a76 : e5 1c __ SBC ACCU + 1 
1a78 : 85 1c __ STA ACCU + 1 
1a7a : 20 84 1a JSR $1a84 ; (uint16_to_float + 0)
1a7d : a5 1e __ LDA ACCU + 3 
1a7f : 09 80 __ ORA #$80
1a81 : 85 1e __ STA ACCU + 3 
1a83 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1a84 : a5 1b __ LDA ACCU + 0 
1a86 : 05 1c __ ORA ACCU + 1 
1a88 : d0 05 __ BNE $1a8f ; (uint16_to_float + 11)
1a8a : 85 1d __ STA ACCU + 2 
1a8c : 85 1e __ STA ACCU + 3 
1a8e : 60 __ __ RTS
1a8f : a2 8e __ LDX #$8e
1a91 : a5 1c __ LDA ACCU + 1 
1a93 : 30 06 __ BMI $1a9b ; (uint16_to_float + 23)
1a95 : ca __ __ DEX
1a96 : 06 1b __ ASL ACCU + 0 
1a98 : 2a __ __ ROL
1a99 : 10 fa __ BPL $1a95 ; (uint16_to_float + 17)
1a9b : 0a __ __ ASL
1a9c : 85 1d __ STA ACCU + 2 
1a9e : a5 1b __ LDA ACCU + 0 
1aa0 : 85 1c __ STA ACCU + 1 
1aa2 : 8a __ __ TXA
1aa3 : 4a __ __ LSR
1aa4 : 85 1e __ STA ACCU + 3 
1aa6 : a9 00 __ LDA #$00
1aa8 : 85 1b __ STA ACCU + 0 
1aaa : 66 1d __ ROR ACCU + 2 
1aac : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1aad : 84 02 __ STY $02 
1aaf : a0 20 __ LDY #$20
1ab1 : a9 00 __ LDA #$00
1ab3 : 85 07 __ STA WORK + 4 
1ab5 : 85 08 __ STA WORK + 5 
1ab7 : 85 09 __ STA WORK + 6 
1ab9 : 85 0a __ STA WORK + 7 
1abb : a5 05 __ LDA WORK + 2 
1abd : 05 06 __ ORA WORK + 3 
1abf : d0 78 __ BNE $1b39 ; (divmod32 + 140)
1ac1 : a5 04 __ LDA WORK + 1 
1ac3 : d0 27 __ BNE $1aec ; (divmod32 + 63)
1ac5 : 18 __ __ CLC
1ac6 : 26 1b __ ROL ACCU + 0 
1ac8 : 26 1c __ ROL ACCU + 1 
1aca : 26 1d __ ROL ACCU + 2 
1acc : 26 1e __ ROL ACCU + 3 
1ace : 2a __ __ ROL
1acf : 90 05 __ BCC $1ad6 ; (divmod32 + 41)
1ad1 : e5 03 __ SBC WORK + 0 
1ad3 : 38 __ __ SEC
1ad4 : b0 06 __ BCS $1adc ; (divmod32 + 47)
1ad6 : c5 03 __ CMP WORK + 0 
1ad8 : 90 02 __ BCC $1adc ; (divmod32 + 47)
1ada : e5 03 __ SBC WORK + 0 
1adc : 88 __ __ DEY
1add : d0 e7 __ BNE $1ac6 ; (divmod32 + 25)
1adf : 85 07 __ STA WORK + 4 
1ae1 : 26 1b __ ROL ACCU + 0 
1ae3 : 26 1c __ ROL ACCU + 1 
1ae5 : 26 1d __ ROL ACCU + 2 
1ae7 : 26 1e __ ROL ACCU + 3 
1ae9 : a4 02 __ LDY $02 
1aeb : 60 __ __ RTS
1aec : a5 1e __ LDA ACCU + 3 
1aee : d0 10 __ BNE $1b00 ; (divmod32 + 83)
1af0 : a6 1d __ LDX ACCU + 2 
1af2 : 86 1e __ STX ACCU + 3 
1af4 : a6 1c __ LDX ACCU + 1 
1af6 : 86 1d __ STX ACCU + 2 
1af8 : a6 1b __ LDX ACCU + 0 
1afa : 86 1c __ STX ACCU + 1 
1afc : 85 1b __ STA ACCU + 0 
1afe : a0 18 __ LDY #$18
1b00 : 18 __ __ CLC
1b01 : 26 1b __ ROL ACCU + 0 
1b03 : 26 1c __ ROL ACCU + 1 
1b05 : 26 1d __ ROL ACCU + 2 
1b07 : 26 1e __ ROL ACCU + 3 
1b09 : 26 07 __ ROL WORK + 4 
1b0b : 26 08 __ ROL WORK + 5 
1b0d : 90 0c __ BCC $1b1b ; (divmod32 + 110)
1b0f : a5 07 __ LDA WORK + 4 
1b11 : e5 03 __ SBC WORK + 0 
1b13 : aa __ __ TAX
1b14 : a5 08 __ LDA WORK + 5 
1b16 : e5 04 __ SBC WORK + 1 
1b18 : 38 __ __ SEC
1b19 : b0 0c __ BCS $1b27 ; (divmod32 + 122)
1b1b : 38 __ __ SEC
1b1c : a5 07 __ LDA WORK + 4 
1b1e : e5 03 __ SBC WORK + 0 
1b20 : aa __ __ TAX
1b21 : a5 08 __ LDA WORK + 5 
1b23 : e5 04 __ SBC WORK + 1 
1b25 : 90 04 __ BCC $1b2b ; (divmod32 + 126)
1b27 : 86 07 __ STX WORK + 4 
1b29 : 85 08 __ STA WORK + 5 
1b2b : 88 __ __ DEY
1b2c : d0 d3 __ BNE $1b01 ; (divmod32 + 84)
1b2e : 26 1b __ ROL ACCU + 0 
1b30 : 26 1c __ ROL ACCU + 1 
1b32 : 26 1d __ ROL ACCU + 2 
1b34 : 26 1e __ ROL ACCU + 3 
1b36 : a4 02 __ LDY $02 
1b38 : 60 __ __ RTS
1b39 : a0 10 __ LDY #$10
1b3b : a5 1e __ LDA ACCU + 3 
1b3d : 85 08 __ STA WORK + 5 
1b3f : a5 1d __ LDA ACCU + 2 
1b41 : 85 07 __ STA WORK + 4 
1b43 : a9 00 __ LDA #$00
1b45 : 85 1d __ STA ACCU + 2 
1b47 : 85 1e __ STA ACCU + 3 
1b49 : 18 __ __ CLC
1b4a : 26 1b __ ROL ACCU + 0 
1b4c : 26 1c __ ROL ACCU + 1 
1b4e : 26 07 __ ROL WORK + 4 
1b50 : 26 08 __ ROL WORK + 5 
1b52 : 26 09 __ ROL WORK + 6 
1b54 : 26 0a __ ROL WORK + 7 
1b56 : a5 07 __ LDA WORK + 4 
1b58 : c5 03 __ CMP WORK + 0 
1b5a : a5 08 __ LDA WORK + 5 
1b5c : e5 04 __ SBC WORK + 1 
1b5e : a5 09 __ LDA WORK + 6 
1b60 : e5 05 __ SBC WORK + 2 
1b62 : aa __ __ TAX
1b63 : a5 0a __ LDA WORK + 7 
1b65 : e5 06 __ SBC WORK + 3 
1b67 : 90 11 __ BCC $1b7a ; (divmod32 + 205)
1b69 : 86 09 __ STX WORK + 6 
1b6b : 85 0a __ STA WORK + 7 
1b6d : a5 07 __ LDA WORK + 4 
1b6f : e5 03 __ SBC WORK + 0 
1b71 : 85 07 __ STA WORK + 4 
1b73 : a5 08 __ LDA WORK + 5 
1b75 : e5 04 __ SBC WORK + 1 
1b77 : 85 08 __ STA WORK + 5 
1b79 : 38 __ __ SEC
1b7a : 88 __ __ DEY
1b7b : d0 cd __ BNE $1b4a ; (divmod32 + 157)
1b7d : 26 1b __ ROL ACCU + 0 
1b7f : 26 1c __ ROL ACCU + 1 
1b81 : a4 02 __ LDY $02 
1b83 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1b84 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1b85 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1b86 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1b96 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
krnio_pstatus:
1ba2 : __ __ __ BSS	16
