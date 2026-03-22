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
080e : 8e 8b 1b STX $1b8b ; (spentry + 0)
0811 : a2 1b __ LDX #$1b
0813 : a0 a9 __ LDY #$a9
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
082a : c0 b9 __ CPY #$b9
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 98 __ LDA #$98
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
;   4, "/home/honza/projects/c64/projects/oscar64/samples/kernalio/charread.c"
.s1:
0880 : a2 03 __ LDX #$03
0882 : b5 53 __ LDA T1 + 0,x 
0884 : 9d 9a 9f STA $9f9a,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : a9 0d __ LDA #$0d
088c : 85 0d __ STA P0 
088e : a9 09 __ LDA #$09
0890 : 85 0e __ STA P1 
0892 : 20 f7 08 JSR $08f7 ; (krnio_setnam.s4 + 0)
0895 : a9 02 __ LDA #$02
0897 : 85 0d __ STA P0 
0899 : 85 0f __ STA P2 
089b : a9 09 __ LDA #$09
089d : 85 0e __ STA P1 
089f : 20 1a 09 JSR $091a ; (krnio_open.s4 + 0)
08a2 : aa __ __ TAX
08a3 : f0 43 __ BEQ $08e8 ; (main.s3 + 0)
.s5:
08a5 : a9 00 __ LDA #$00
08a7 : 85 53 __ STA T1 + 0 
08a9 : 85 54 __ STA T1 + 1 
.l6:
08ab : a9 02 __ LDA #$02
08ad : 85 0e __ STA P1 
08af : 20 48 09 JSR $0948 ; (krnio_getch.s4 + 0)
08b2 : a5 1c __ LDA ACCU + 1 
08b4 : 30 2b __ BMI $08e1 ; (main.s7 + 0)
.s8:
08b6 : 85 56 __ STA T2 + 1 
08b8 : 8d ff 9f STA $9fff ; (sstack + 13)
08bb : a5 53 __ LDA T1 + 0 
08bd : 8d fc 9f STA $9ffc ; (sstack + 10)
08c0 : a5 54 __ LDA T1 + 1 
08c2 : 8d fd 9f STA $9ffd ; (sstack + 11)
08c5 : a5 1b __ LDA ACCU + 0 
08c7 : 8d fe 9f STA $9ffe ; (sstack + 12)
08ca : a9 7c __ LDA #$7c
08cc : 8d fa 9f STA $9ffa ; (sstack + 8)
08cf : a9 16 __ LDA #$16
08d1 : 8d fb 9f STA $9ffb ; (sstack + 9)
08d4 : 20 c5 09 JSR $09c5 ; (printf.s4 + 0)
08d7 : e6 53 __ INC T1 + 0 
08d9 : d0 02 __ BNE $08dd ; (main.s10 + 0)
.s9:
08db : e6 54 __ INC T1 + 1 
.s10:
08dd : 46 56 __ LSR T2 + 1 
08df : 90 ca __ BCC $08ab ; (main.l6 + 0)
.s7:
08e1 : a9 02 __ LDA #$02
08e3 : 20 85 16 JSR $1685 ; (krnio_close.s4 + 0)
08e6 : a9 00 __ LDA #$00
.s3:
08e8 : 85 1b __ STA ACCU + 0 
08ea : 85 1c __ STA ACCU + 1 
08ec : a2 03 __ LDX #$03
08ee : bd 9a 9f LDA $9f9a,x ; (main@stack + 0)
08f1 : 95 53 __ STA T1 + 0,x 
08f3 : ca __ __ DEX
08f4 : 10 f8 __ BPL $08ee ; (main.s3 + 6)
08f6 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
08f7 : a5 0d __ LDA P0 
08f9 : 05 0e __ ORA P1 
08fb : f0 08 __ BEQ $0905 ; (krnio_setnam.s4 + 14)
08fd : a0 ff __ LDY #$ff
08ff : c8 __ __ INY
0900 : b1 0d __ LDA (P0),y 
0902 : d0 fb __ BNE $08ff ; (krnio_setnam.s4 + 8)
0904 : 98 __ __ TYA
0905 : a6 0d __ LDX P0 
0907 : a4 0e __ LDY P1 
0909 : 20 bd ff JSR $ffbd 
.s3:
090c : 60 __ __ RTS
--------------------------------------------------------------------
090d : __ __ __ BYT 40 30 3a 43 48 41 52 53 2c 50 2c 52 00          : @0:CHARS,P,R.
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
091a : a9 00 __ LDA #$00
091c : a6 0d __ LDX P0 ; (fnum + 0)
091e : 9d a9 1b STA $1ba9,x ; (krnio_pstatus[0] + 0)
0921 : a9 00 __ LDA #$00
0923 : 85 1b __ STA ACCU + 0 
0925 : 85 1c __ STA ACCU + 1 
0927 : a5 0d __ LDA P0 ; (fnum + 0)
0929 : a6 0e __ LDX P1 
092b : a4 0f __ LDY P2 
092d : 20 ba ff JSR $ffba 
0930 : 20 c0 ff JSR $ffc0 
0933 : 90 08 __ BCC $093d ; (krnio_open.s4 + 35)
0935 : a5 0d __ LDA P0 ; (fnum + 0)
0937 : 20 c3 ff JSR $ffc3 
093a : 4c 41 09 JMP $0941 ; (krnio_open.s4 + 39)
093d : a9 01 __ LDA #$01
093f : 85 1b __ STA ACCU + 0 
0941 : a5 1b __ LDA ACCU + 0 
0943 : f0 02 __ BEQ $0947 ; (krnio_open.s3 + 0)
.s5:
0945 : a9 01 __ LDA #$01
.s3:
0947 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_getch: ; krnio_getch(u8)->i16
;  73, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0948 : a4 0e __ LDY P1 ; (fnum + 0)
094a : b9 a9 1b LDA $1ba9,y ; (krnio_pstatus[0] + 0)
094d : c9 40 __ CMP #$40
094f : f0 41 __ BEQ $0992 ; (krnio_getch.s12 + 0)
.s5:
0951 : 98 __ __ TYA
0952 : 20 98 09 JSR $0998 ; (krnio_chkin.s4 + 0)
0955 : aa __ __ TAX
0956 : d0 12 __ BNE $096a ; (krnio_getch.s8 + 0)
.s6:
0958 : a9 ff __ LDA #$ff
095a : 85 43 __ STA T0 + 0 
095c : 85 44 __ STA T0 + 1 
.s7:
095e : 20 c1 09 JSR $09c1 ; (krnio_clrchn.s4 + 0)
0961 : a5 43 __ LDA T0 + 0 
0963 : 85 1b __ STA ACCU + 0 
0965 : a5 44 __ LDA T0 + 1 
.s3:
0967 : 85 1c __ STA ACCU + 1 
0969 : 60 __ __ RTS
.s8:
096a : 20 ad 09 JSR $09ad ; (krnio_chrin.s4 + 0)
096d : 85 45 __ STA T2 + 0 
096f : 85 43 __ STA T0 + 0 
0971 : 20 b5 09 JSR $09b5 ; (krnio_status.s4 + 0)
0974 : a6 0e __ LDX P1 ; (fnum + 0)
0976 : 9d a9 1b STA $1ba9,x ; (krnio_pstatus[0] + 0)
0979 : a2 00 __ LDX #$00
097b : 86 44 __ STX T0 + 1 
097d : aa __ __ TAX
097e : f0 de __ BEQ $095e ; (krnio_getch.s7 + 0)
.s9:
0980 : c9 40 __ CMP #$40
0982 : d0 0b __ BNE $098f ; (krnio_getch.s10 + 0)
.s11:
0984 : 20 c1 09 JSR $09c1 ; (krnio_clrchn.s4 + 0)
0987 : a5 45 __ LDA T2 + 0 
0989 : 85 1b __ STA ACCU + 0 
098b : a9 01 __ LDA #$01
098d : d0 d8 __ BNE $0967 ; (krnio_getch.s3 + 0)
.s10:
098f : 20 c1 09 JSR $09c1 ; (krnio_clrchn.s4 + 0)
.s12:
0992 : a9 ff __ LDA #$ff
0994 : 85 1b __ STA ACCU + 0 
0996 : d0 cf __ BNE $0967 ; (krnio_getch.s3 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0998 : 85 0d __ STA P0 
099a : a6 0d __ LDX P0 
099c : 20 c6 ff JSR $ffc6 
099f : a9 00 __ LDA #$00
09a1 : 2a __ __ ROL
09a2 : 49 01 __ EOR #$01
09a4 : 85 1b __ STA ACCU + 0 
09a6 : a5 1b __ LDA ACCU + 0 
09a8 : f0 02 __ BEQ $09ac ; (krnio_chkin.s3 + 0)
.s5:
09aa : a9 01 __ LDA #$01
.s3:
09ac : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
09ad : 20 cf ff JSR $ffcf 
09b0 : 85 1b __ STA ACCU + 0 
.s3:
09b2 : a5 1b __ LDA ACCU + 0 
09b4 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
09b5 : 20 b7 ff JSR $ffb7 
09b8 : 85 1b __ STA ACCU + 0 
09ba : a9 00 __ LDA #$00
09bc : 85 1c __ STA ACCU + 1 
.s3:
09be : a5 1b __ LDA ACCU + 0 
09c0 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
09c1 : 20 cc ff JSR $ffcc 
.s3:
09c4 : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
09c5 : a9 01 __ LDA #$01
09c7 : 8d f9 9f STA $9ff9 ; (sstack + 7)
09ca : a9 9e __ LDA #$9e
09cc : 8d f3 9f STA $9ff3 ; (sstack + 1)
09cf : a9 9f __ LDA #$9f
09d1 : 8d f4 9f STA $9ff4 ; (sstack + 2)
09d4 : ad fa 9f LDA $9ffa ; (sstack + 8)
09d7 : 8d f5 9f STA $9ff5 ; (sstack + 3)
09da : ad fb 9f LDA $9ffb ; (sstack + 9)
09dd : 8d f6 9f STA $9ff6 ; (sstack + 4)
09e0 : a9 fc __ LDA #$fc
09e2 : 8d f7 9f STA $9ff7 ; (sstack + 5)
09e5 : a9 9f __ LDA #$9f
09e7 : 8d f8 9f STA $9ff8 ; (sstack + 6)
09ea : 4c ed 09 JMP $09ed ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
09ed : a2 09 __ LDX #$09
09ef : b5 53 __ LDA T1 + 0,x 
09f1 : 9d d0 9f STA $9fd0,x ; (sformat@stack + 0)
09f4 : ca __ __ DEX
09f5 : 10 f8 __ BPL $09ef ; (sformat.s1 + 2)
.s4:
09f7 : ad f5 9f LDA $9ff5 ; (sstack + 3)
09fa : 85 55 __ STA T3 + 0 
09fc : a9 00 __ LDA #$00
09fe : 85 5b __ STA T6 + 0 
0a00 : ad f6 9f LDA $9ff6 ; (sstack + 4)
0a03 : 85 56 __ STA T3 + 1 
0a05 : ad f3 9f LDA $9ff3 ; (sstack + 1)
0a08 : 85 57 __ STA T4 + 0 
0a0a : ad f4 9f LDA $9ff4 ; (sstack + 2)
0a0d : 85 58 __ STA T4 + 1 
.l5:
0a0f : a0 00 __ LDY #$00
0a11 : b1 55 __ LDA (T3 + 0),y 
0a13 : d0 36 __ BNE $0a4b ; (sformat.s10 + 0)
.s6:
0a15 : a4 5b __ LDY T6 + 0 
0a17 : 91 57 __ STA (T4 + 0),y 
0a19 : 98 __ __ TYA
0a1a : f0 28 __ BEQ $0a44 ; (sformat.s95 + 0)
.s7:
0a1c : ad f9 9f LDA $9ff9 ; (sstack + 7)
0a1f : d0 18 __ BNE $0a39 ; (sformat.s9 + 0)
.s8:
0a21 : 98 __ __ TYA
0a22 : 18 __ __ CLC
0a23 : 65 57 __ ADC T4 + 0 
0a25 : aa __ __ TAX
0a26 : a5 58 __ LDA T4 + 1 
0a28 : 69 00 __ ADC #$00
.s3:
0a2a : 86 1b __ STX ACCU + 0 ; (buff + 1)
0a2c : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0a2e : a2 09 __ LDX #$09
0a30 : bd d0 9f LDA $9fd0,x ; (sformat@stack + 0)
0a33 : 95 53 __ STA T1 + 0,x 
0a35 : ca __ __ DEX
0a36 : 10 f8 __ BPL $0a30 ; (sformat.s3 + 6)
0a38 : 60 __ __ RTS
.s9:
0a39 : a5 57 __ LDA T4 + 0 
0a3b : 85 0e __ STA P1 
0a3d : a5 58 __ LDA T4 + 1 
0a3f : 85 0f __ STA P2 
0a41 : 20 2e 0e JSR $0e2e ; (puts.l4 + 0)
.s95:
0a44 : a5 58 __ LDA T4 + 1 
0a46 : a6 57 __ LDX T4 + 0 
0a48 : 4c 2a 0a JMP $0a2a ; (sformat.s3 + 0)
.s10:
0a4b : c9 25 __ CMP #$25
0a4d : f0 3e __ BEQ $0a8d ; (sformat.s15 + 0)
.s11:
0a4f : a4 5b __ LDY T6 + 0 
0a51 : 91 57 __ STA (T4 + 0),y 
0a53 : e6 55 __ INC T3 + 0 
0a55 : d0 02 __ BNE $0a59 ; (sformat.s117 + 0)
.s116:
0a57 : e6 56 __ INC T3 + 1 
.s117:
0a59 : c8 __ __ INY
0a5a : 84 5b __ STY T6 + 0 
0a5c : 98 __ __ TYA
0a5d : c0 28 __ CPY #$28
0a5f : 90 ae __ BCC $0a0f ; (sformat.l5 + 0)
.s12:
0a61 : 85 43 __ STA T0 + 0 
0a63 : a9 00 __ LDA #$00
0a65 : 85 5b __ STA T6 + 0 
0a67 : ad f9 9f LDA $9ff9 ; (sstack + 7)
0a6a : f0 14 __ BEQ $0a80 ; (sformat.s13 + 0)
.s14:
0a6c : a5 57 __ LDA T4 + 0 
0a6e : 85 0e __ STA P1 
0a70 : a5 58 __ LDA T4 + 1 
0a72 : 85 0f __ STA P2 
0a74 : a9 00 __ LDA #$00
0a76 : a4 43 __ LDY T0 + 0 
0a78 : 91 0e __ STA (P1),y 
0a7a : 20 2e 0e JSR $0e2e ; (puts.l4 + 0)
0a7d : 4c 0f 0a JMP $0a0f ; (sformat.l5 + 0)
.s13:
0a80 : 18 __ __ CLC
0a81 : a5 57 __ LDA T4 + 0 
0a83 : 65 43 __ ADC T0 + 0 
0a85 : 85 57 __ STA T4 + 0 
0a87 : 90 86 __ BCC $0a0f ; (sformat.l5 + 0)
.s118:
0a89 : e6 58 __ INC T4 + 1 
0a8b : b0 82 __ BCS $0a0f ; (sformat.l5 + 0)
.s15:
0a8d : a5 5b __ LDA T6 + 0 
0a8f : f0 27 __ BEQ $0ab8 ; (sformat.s16 + 0)
.s89:
0a91 : 84 5b __ STY T6 + 0 
0a93 : 85 43 __ STA T0 + 0 
0a95 : ad f9 9f LDA $9ff9 ; (sstack + 7)
0a98 : f0 13 __ BEQ $0aad ; (sformat.s90 + 0)
.s91:
0a9a : a5 57 __ LDA T4 + 0 
0a9c : 85 0e __ STA P1 
0a9e : a5 58 __ LDA T4 + 1 
0aa0 : 85 0f __ STA P2 
0aa2 : 98 __ __ TYA
0aa3 : a4 43 __ LDY T0 + 0 
0aa5 : 91 0e __ STA (P1),y 
0aa7 : 20 2e 0e JSR $0e2e ; (puts.l4 + 0)
0aaa : 4c b8 0a JMP $0ab8 ; (sformat.s16 + 0)
.s90:
0aad : 18 __ __ CLC
0aae : a5 57 __ LDA T4 + 0 
0ab0 : 65 43 __ ADC T0 + 0 
0ab2 : 85 57 __ STA T4 + 0 
0ab4 : 90 02 __ BCC $0ab8 ; (sformat.s16 + 0)
.s115:
0ab6 : e6 58 __ INC T4 + 1 
.s16:
0ab8 : a9 00 __ LDA #$00
0aba : 8d df 9f STA $9fdf ; (si.sign + 0)
0abd : 8d e0 9f STA $9fe0 ; (si.left + 0)
0ac0 : 8d e1 9f STA $9fe1 ; (si.prefix + 0)
0ac3 : a0 01 __ LDY #$01
0ac5 : b1 55 __ LDA (T3 + 0),y 
0ac7 : a2 20 __ LDX #$20
0ac9 : 8e da 9f STX $9fda ; (si.fill + 0)
0acc : a2 00 __ LDX #$00
0ace : 8e db 9f STX $9fdb ; (si.width + 0)
0ad1 : ca __ __ DEX
0ad2 : 8e dc 9f STX $9fdc ; (si.precision + 0)
0ad5 : a2 0a __ LDX #$0a
0ad7 : 8e de 9f STX $9fde ; (si.base + 0)
0ada : aa __ __ TAX
0adb : a9 02 __ LDA #$02
0add : d0 07 __ BNE $0ae6 ; (sformat.l17 + 0)
.s85:
0adf : a0 00 __ LDY #$00
0ae1 : b1 55 __ LDA (T3 + 0),y 
0ae3 : aa __ __ TAX
0ae4 : a9 01 __ LDA #$01
.l17:
0ae6 : 18 __ __ CLC
0ae7 : 65 55 __ ADC T3 + 0 
0ae9 : 85 55 __ STA T3 + 0 
0aeb : 90 02 __ BCC $0aef ; (sformat.s106 + 0)
.s105:
0aed : e6 56 __ INC T3 + 1 
.s106:
0aef : 8a __ __ TXA
0af0 : e0 2b __ CPX #$2b
0af2 : d0 07 __ BNE $0afb ; (sformat.s18 + 0)
.s88:
0af4 : a9 01 __ LDA #$01
0af6 : 8d df 9f STA $9fdf ; (si.sign + 0)
0af9 : d0 e4 __ BNE $0adf ; (sformat.s85 + 0)
.s18:
0afb : c9 30 __ CMP #$30
0afd : d0 06 __ BNE $0b05 ; (sformat.s19 + 0)
.s87:
0aff : 8d da 9f STA $9fda ; (si.fill + 0)
0b02 : 4c df 0a JMP $0adf ; (sformat.s85 + 0)
.s19:
0b05 : c9 23 __ CMP #$23
0b07 : d0 07 __ BNE $0b10 ; (sformat.s20 + 0)
.s86:
0b09 : a9 01 __ LDA #$01
0b0b : 8d e1 9f STA $9fe1 ; (si.prefix + 0)
0b0e : d0 cf __ BNE $0adf ; (sformat.s85 + 0)
.s20:
0b10 : c9 2d __ CMP #$2d
0b12 : d0 07 __ BNE $0b1b ; (sformat.s21 + 0)
.s84:
0b14 : a9 01 __ LDA #$01
0b16 : 8d e0 9f STA $9fe0 ; (si.left + 0)
0b19 : d0 c4 __ BNE $0adf ; (sformat.s85 + 0)
.s21:
0b1b : 85 47 __ STA T2 + 0 
0b1d : c9 30 __ CMP #$30
0b1f : 90 3c __ BCC $0b5d ; (sformat.s22 + 0)
.s80:
0b21 : c9 3a __ CMP #$3a
0b23 : b0 77 __ BCS $0b9c ; (sformat.s23 + 0)
.s81:
0b25 : a9 00 __ LDA #$00
0b27 : 85 53 __ STA T1 + 0 
.l82:
0b29 : a5 53 __ LDA T1 + 0 
0b2b : 0a __ __ ASL
0b2c : 85 1b __ STA ACCU + 0 ; (buff + 1)
0b2e : a9 00 __ LDA #$00
0b30 : 2a __ __ ROL
0b31 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0b33 : 2a __ __ ROL
0b34 : aa __ __ TAX
0b35 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b37 : 65 53 __ ADC T1 + 0 
0b39 : 0a __ __ ASL
0b3a : 18 __ __ CLC
0b3b : 65 47 __ ADC T2 + 0 
0b3d : 38 __ __ SEC
0b3e : e9 30 __ SBC #$30
0b40 : 85 53 __ STA T1 + 0 
0b42 : a0 00 __ LDY #$00
0b44 : b1 55 __ LDA (T3 + 0),y 
0b46 : 85 47 __ STA T2 + 0 
0b48 : e6 55 __ INC T3 + 0 
0b4a : d0 02 __ BNE $0b4e ; (sformat.s114 + 0)
.s113:
0b4c : e6 56 __ INC T3 + 1 
.s114:
0b4e : c9 30 __ CMP #$30
0b50 : 90 04 __ BCC $0b56 ; (sformat.s104 + 0)
.s83:
0b52 : c9 3a __ CMP #$3a
0b54 : 90 d3 __ BCC $0b29 ; (sformat.l82 + 0)
.s104:
0b56 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0b58 : a6 53 __ LDX T1 + 0 
0b5a : 8e db 9f STX $9fdb ; (si.width + 0)
.s22:
0b5d : c9 2e __ CMP #$2e
0b5f : d0 3b __ BNE $0b9c ; (sformat.s23 + 0)
.s76:
0b61 : a9 00 __ LDA #$00
0b63 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0b65 : 4c 7f 0b JMP $0b7f ; (sformat.l77 + 0)
.s79:
0b68 : a5 43 __ LDA T0 + 0 
0b6a : 0a __ __ ASL
0b6b : 85 1b __ STA ACCU + 0 ; (buff + 1)
0b6d : 98 __ __ TYA
0b6e : 2a __ __ ROL
0b6f : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0b71 : 2a __ __ ROL
0b72 : aa __ __ TAX
0b73 : 18 __ __ CLC
0b74 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b76 : 65 43 __ ADC T0 + 0 
0b78 : 0a __ __ ASL
0b79 : 18 __ __ CLC
0b7a : 65 47 __ ADC T2 + 0 
0b7c : 38 __ __ SEC
0b7d : e9 30 __ SBC #$30
.l77:
0b7f : 85 43 __ STA T0 + 0 
0b81 : a0 00 __ LDY #$00
0b83 : b1 55 __ LDA (T3 + 0),y 
0b85 : 85 47 __ STA T2 + 0 
0b87 : e6 55 __ INC T3 + 0 
0b89 : d0 02 __ BNE $0b8d ; (sformat.s108 + 0)
.s107:
0b8b : e6 56 __ INC T3 + 1 
.s108:
0b8d : c9 30 __ CMP #$30
0b8f : 90 04 __ BCC $0b95 ; (sformat.s103 + 0)
.s78:
0b91 : c9 3a __ CMP #$3a
0b93 : 90 d3 __ BCC $0b68 ; (sformat.s79 + 0)
.s103:
0b95 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0b97 : a6 43 __ LDX T0 + 0 
0b99 : 8e dc 9f STX $9fdc ; (si.precision + 0)
.s23:
0b9c : c9 64 __ CMP #$64
0b9e : f0 0c __ BEQ $0bac ; (sformat.s75 + 0)
.s24:
0ba0 : c9 44 __ CMP #$44
0ba2 : f0 08 __ BEQ $0bac ; (sformat.s75 + 0)
.s25:
0ba4 : c9 69 __ CMP #$69
0ba6 : f0 04 __ BEQ $0bac ; (sformat.s75 + 0)
.s26:
0ba8 : c9 49 __ CMP #$49
0baa : d0 07 __ BNE $0bb3 ; (sformat.s27 + 0)
.s75:
0bac : a9 01 __ LDA #$01
.s93:
0bae : 85 13 __ STA P6 
0bb0 : 4c f4 0d JMP $0df4 ; (sformat.s73 + 0)
.s27:
0bb3 : c9 75 __ CMP #$75
0bb5 : f0 04 __ BEQ $0bbb ; (sformat.s74 + 0)
.s28:
0bb7 : c9 55 __ CMP #$55
0bb9 : d0 04 __ BNE $0bbf ; (sformat.s29 + 0)
.s74:
0bbb : a9 00 __ LDA #$00
0bbd : f0 ef __ BEQ $0bae ; (sformat.s93 + 0)
.s29:
0bbf : c9 78 __ CMP #$78
0bc1 : f0 04 __ BEQ $0bc7 ; (sformat.s72 + 0)
.s30:
0bc3 : c9 58 __ CMP #$58
0bc5 : d0 15 __ BNE $0bdc ; (sformat.s31 + 0)
.s72:
0bc7 : a5 47 __ LDA T2 + 0 
0bc9 : 29 e0 __ AND #$e0
0bcb : 09 01 __ ORA #$01
0bcd : 8d dd 9f STA $9fdd ; (si.cha + 0)
0bd0 : a9 00 __ LDA #$00
0bd2 : 85 13 __ STA P6 
0bd4 : a9 10 __ LDA #$10
0bd6 : 8d de 9f STA $9fde ; (si.base + 0)
0bd9 : 4c f4 0d JMP $0df4 ; (sformat.s73 + 0)
.s31:
0bdc : c9 6c __ CMP #$6c
0bde : d0 03 __ BNE $0be3 ; (sformat.s32 + 0)
0be0 : 4c 65 0d JMP $0d65 ; (sformat.s60 + 0)
.s32:
0be3 : c9 4c __ CMP #$4c
0be5 : f0 f9 __ BEQ $0be0 ; (sformat.s31 + 4)
.s33:
0be7 : c9 66 __ CMP #$66
0be9 : f0 14 __ BEQ $0bff ; (sformat.s59 + 0)
.s34:
0beb : c9 67 __ CMP #$67
0bed : f0 10 __ BEQ $0bff ; (sformat.s59 + 0)
.s35:
0bef : c9 65 __ CMP #$65
0bf1 : f0 0c __ BEQ $0bff ; (sformat.s59 + 0)
.s36:
0bf3 : c9 46 __ CMP #$46
0bf5 : f0 08 __ BEQ $0bff ; (sformat.s59 + 0)
.s37:
0bf7 : c9 47 __ CMP #$47
0bf9 : f0 04 __ BEQ $0bff ; (sformat.s59 + 0)
.s38:
0bfb : c9 45 __ CMP #$45
0bfd : d0 5c __ BNE $0c5b ; (sformat.s39 + 0)
.s59:
0bff : a5 57 __ LDA T4 + 0 
0c01 : 85 13 __ STA P6 
0c03 : a5 58 __ LDA T4 + 1 
0c05 : 85 14 __ STA P7 
0c07 : a5 47 __ LDA T2 + 0 
0c09 : 29 e0 __ AND #$e0
0c0b : 09 01 __ ORA #$01
0c0d : 8d dd 9f STA $9fdd ; (si.cha + 0)
0c10 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0c13 : 85 59 __ STA T5 + 0 
0c15 : a9 da __ LDA #$da
0c17 : 85 11 __ STA P4 
0c19 : a9 9f __ LDA #$9f
0c1b : 85 12 __ STA P5 
0c1d : ad f8 9f LDA $9ff8 ; (sstack + 6)
0c20 : 85 5a __ STA T5 + 1 
0c22 : a0 00 __ LDY #$00
0c24 : b1 59 __ LDA (T5 + 0),y 
0c26 : 85 15 __ STA P8 
0c28 : c8 __ __ INY
0c29 : b1 59 __ LDA (T5 + 0),y 
0c2b : 85 16 __ STA P9 
0c2d : c8 __ __ INY
0c2e : b1 59 __ LDA (T5 + 0),y 
0c30 : 85 17 __ STA P10 
0c32 : c8 __ __ INY
0c33 : b1 59 __ LDA (T5 + 0),y 
0c35 : 85 18 __ STA P11 
0c37 : a5 47 __ LDA T2 + 0 
0c39 : ed dd 9f SBC $9fdd ; (si.cha + 0)
0c3c : 18 __ __ CLC
0c3d : 69 61 __ ADC #$61
0c3f : 8d f2 9f STA $9ff2 ; (sstack + 0)
0c42 : 20 09 11 JSR $1109 ; (nformf.s1 + 0)
0c45 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c47 : 85 5b __ STA T6 + 0 
0c49 : 18 __ __ CLC
0c4a : a5 59 __ LDA T5 + 0 
0c4c : 69 04 __ ADC #$04
0c4e : 8d f7 9f STA $9ff7 ; (sstack + 5)
0c51 : a5 5a __ LDA T5 + 1 
0c53 : 69 00 __ ADC #$00
0c55 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0c58 : 4c 0f 0a JMP $0a0f ; (sformat.l5 + 0)
.s39:
0c5b : c9 73 __ CMP #$73
0c5d : f0 3b __ BEQ $0c9a ; (sformat.s47 + 0)
.s40:
0c5f : c9 53 __ CMP #$53
0c61 : f0 37 __ BEQ $0c9a ; (sformat.s47 + 0)
.s41:
0c63 : c9 63 __ CMP #$63
0c65 : f0 12 __ BEQ $0c79 ; (sformat.s46 + 0)
.s42:
0c67 : c9 43 __ CMP #$43
0c69 : f0 0e __ BEQ $0c79 ; (sformat.s46 + 0)
.s43:
0c6b : aa __ __ TAX
0c6c : f0 ea __ BEQ $0c58 ; (sformat.s59 + 89)
.s44:
0c6e : a0 00 __ LDY #$00
0c70 : 91 57 __ STA (T4 + 0),y 
.s45:
0c72 : a9 01 __ LDA #$01
.s96:
0c74 : 85 5b __ STA T6 + 0 
0c76 : 4c 0f 0a JMP $0a0f ; (sformat.l5 + 0)
.s46:
0c79 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0c7c : 85 43 __ STA T0 + 0 
0c7e : ad f8 9f LDA $9ff8 ; (sstack + 6)
0c81 : 85 44 __ STA T0 + 1 
0c83 : a0 00 __ LDY #$00
0c85 : b1 43 __ LDA (T0 + 0),y 
0c87 : 91 57 __ STA (T4 + 0),y 
0c89 : a5 43 __ LDA T0 + 0 
0c8b : 69 01 __ ADC #$01
0c8d : 8d f7 9f STA $9ff7 ; (sstack + 5)
0c90 : a5 44 __ LDA T0 + 1 
0c92 : 69 00 __ ADC #$00
0c94 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0c97 : 4c 72 0c JMP $0c72 ; (sformat.s45 + 0)
.s47:
0c9a : ad f7 9f LDA $9ff7 ; (sstack + 5)
0c9d : 85 43 __ STA T0 + 0 
0c9f : 69 01 __ ADC #$01
0ca1 : 8d f7 9f STA $9ff7 ; (sstack + 5)
0ca4 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0ca7 : 85 44 __ STA T0 + 1 
0ca9 : 69 00 __ ADC #$00
0cab : 8d f8 9f STA $9ff8 ; (sstack + 6)
0cae : a0 00 __ LDY #$00
0cb0 : 84 5c __ STY T7 + 0 
0cb2 : b1 43 __ LDA (T0 + 0),y 
0cb4 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0cb6 : 85 53 __ STA T1 + 0 
0cb8 : c8 __ __ INY
0cb9 : b1 43 __ LDA (T0 + 0),y 
0cbb : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0cbd : 85 54 __ STA T1 + 1 
0cbf : ad db 9f LDA $9fdb ; (si.width + 0)
0cc2 : f0 0c __ BEQ $0cd0 ; (sformat.s48 + 0)
.s100:
0cc4 : 88 __ __ DEY
0cc5 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0cc7 : f0 05 __ BEQ $0cce ; (sformat.s101 + 0)
.l58:
0cc9 : c8 __ __ INY
0cca : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0ccc : d0 fb __ BNE $0cc9 ; (sformat.l58 + 0)
.s101:
0cce : 84 5c __ STY T7 + 0 
.s48:
0cd0 : ad e0 9f LDA $9fe0 ; (si.left + 0)
0cd3 : 85 59 __ STA T5 + 0 
0cd5 : d0 19 __ BNE $0cf0 ; (sformat.s49 + 0)
.s98:
0cd7 : a6 5c __ LDX T7 + 0 
0cd9 : ec db 9f CPX $9fdb ; (si.width + 0)
0cdc : a0 00 __ LDY #$00
0cde : b0 0c __ BCS $0cec ; (sformat.s99 + 0)
.l57:
0ce0 : ad da 9f LDA $9fda ; (si.fill + 0)
0ce3 : 91 57 __ STA (T4 + 0),y 
0ce5 : c8 __ __ INY
0ce6 : e8 __ __ INX
0ce7 : ec db 9f CPX $9fdb ; (si.width + 0)
0cea : 90 f4 __ BCC $0ce0 ; (sformat.l57 + 0)
.s99:
0cec : 86 5c __ STX T7 + 0 
0cee : 84 5b __ STY T6 + 0 
.s49:
0cf0 : ac f9 9f LDY $9ff9 ; (sstack + 7)
0cf3 : d0 48 __ BNE $0d3d ; (sformat.s54 + 0)
.s50:
0cf5 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0cf7 : f0 23 __ BEQ $0d1c ; (sformat.s51 + 0)
.s53:
0cf9 : 18 __ __ CLC
0cfa : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0cfc : 69 01 __ ADC #$01
0cfe : 85 43 __ STA T0 + 0 
0d00 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0d02 : 69 00 __ ADC #$00
0d04 : 85 44 __ STA T0 + 1 
0d06 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0d08 : a4 5b __ LDY T6 + 0 
0d0a : 91 57 __ STA (T4 + 0),y 
0d0c : e6 5b __ INC T6 + 0 
0d0e : a0 00 __ LDY #$00
0d10 : b1 43 __ LDA (T0 + 0),y 
0d12 : a8 __ __ TAY
0d13 : e6 43 __ INC T0 + 0 
0d15 : d0 02 __ BNE $0d19 ; (sformat.s112 + 0)
.s111:
0d17 : e6 44 __ INC T0 + 1 
.s112:
0d19 : 98 __ __ TYA
0d1a : d0 ec __ BNE $0d08 ; (sformat.l92 + 0)
.s51:
0d1c : a5 59 __ LDA T5 + 0 
0d1e : d0 03 __ BNE $0d23 ; (sformat.s97 + 0)
0d20 : 4c 0f 0a JMP $0a0f ; (sformat.l5 + 0)
.s97:
0d23 : a6 5c __ LDX T7 + 0 
0d25 : ec db 9f CPX $9fdb ; (si.width + 0)
0d28 : a4 5b __ LDY T6 + 0 
0d2a : b0 0c __ BCS $0d38 ; (sformat.s102 + 0)
.l52:
0d2c : ad da 9f LDA $9fda ; (si.fill + 0)
0d2f : 91 57 __ STA (T4 + 0),y 
0d31 : c8 __ __ INY
0d32 : e8 __ __ INX
0d33 : ec db 9f CPX $9fdb ; (si.width + 0)
0d36 : 90 f4 __ BCC $0d2c ; (sformat.l52 + 0)
.s102:
0d38 : 84 5b __ STY T6 + 0 
0d3a : 4c 0f 0a JMP $0a0f ; (sformat.l5 + 0)
.s54:
0d3d : a4 5b __ LDY T6 + 0 
0d3f : f0 11 __ BEQ $0d52 ; (sformat.s55 + 0)
.s56:
0d41 : a5 57 __ LDA T4 + 0 
0d43 : 85 0e __ STA P1 
0d45 : a5 58 __ LDA T4 + 1 
0d47 : 85 0f __ STA P2 
0d49 : a9 00 __ LDA #$00
0d4b : 85 5b __ STA T6 + 0 
0d4d : 91 0e __ STA (P1),y 
0d4f : 20 2e 0e JSR $0e2e ; (puts.l4 + 0)
.s55:
0d52 : a5 53 __ LDA T1 + 0 
0d54 : 85 0e __ STA P1 
0d56 : a5 54 __ LDA T1 + 1 
0d58 : 85 0f __ STA P2 
0d5a : 20 2e 0e JSR $0e2e ; (puts.l4 + 0)
0d5d : ad e0 9f LDA $9fe0 ; (si.left + 0)
0d60 : d0 c1 __ BNE $0d23 ; (sformat.s97 + 0)
0d62 : 4c 0f 0a JMP $0a0f ; (sformat.l5 + 0)
.s60:
0d65 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0d68 : 85 43 __ STA T0 + 0 
0d6a : 69 03 __ ADC #$03
0d6c : 8d f7 9f STA $9ff7 ; (sstack + 5)
0d6f : ad f8 9f LDA $9ff8 ; (sstack + 6)
0d72 : 85 44 __ STA T0 + 1 
0d74 : 69 00 __ ADC #$00
0d76 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0d79 : a0 00 __ LDY #$00
0d7b : b1 55 __ LDA (T3 + 0),y 
0d7d : aa __ __ TAX
0d7e : e6 55 __ INC T3 + 0 
0d80 : d0 02 __ BNE $0d84 ; (sformat.s110 + 0)
.s109:
0d82 : e6 56 __ INC T3 + 1 
.s110:
0d84 : b1 43 __ LDA (T0 + 0),y 
0d86 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0d88 : 85 11 __ STA P4 
0d8a : a0 01 __ LDY #$01
0d8c : b1 43 __ LDA (T0 + 0),y 
0d8e : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d90 : 85 12 __ STA P5 
0d92 : c8 __ __ INY
0d93 : b1 43 __ LDA (T0 + 0),y 
0d95 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0d97 : 85 13 __ STA P6 
0d99 : c8 __ __ INY
0d9a : b1 43 __ LDA (T0 + 0),y 
0d9c : 85 14 __ STA P7 
0d9e : e0 64 __ CPX #$64
0da0 : f0 0c __ BEQ $0dae ; (sformat.s71 + 0)
.s61:
0da2 : e0 44 __ CPX #$44
0da4 : f0 08 __ BEQ $0dae ; (sformat.s71 + 0)
.s62:
0da6 : e0 69 __ CPX #$69
0da8 : f0 04 __ BEQ $0dae ; (sformat.s71 + 0)
.s63:
0daa : e0 49 __ CPX #$49
0dac : d0 1c __ BNE $0dca ; (sformat.s64 + 0)
.s71:
0dae : a9 01 __ LDA #$01
.s94:
0db0 : 85 15 __ STA P8 
.s69:
0db2 : a5 57 __ LDA T4 + 0 
0db4 : 85 0f __ STA P2 
0db6 : a5 58 __ LDA T4 + 1 
0db8 : 85 10 __ STA P3 
0dba : a9 da __ LDA #$da
0dbc : 85 0d __ STA P0 
0dbe : a9 9f __ LDA #$9f
0dc0 : 85 0e __ STA P1 
0dc2 : 20 bf 0f JSR $0fbf ; (nforml.s4 + 0)
0dc5 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0dc7 : 4c 74 0c JMP $0c74 ; (sformat.s96 + 0)
.s64:
0dca : e0 75 __ CPX #$75
0dcc : f0 04 __ BEQ $0dd2 ; (sformat.s70 + 0)
.s65:
0dce : e0 55 __ CPX #$55
0dd0 : d0 04 __ BNE $0dd6 ; (sformat.s66 + 0)
.s70:
0dd2 : a9 00 __ LDA #$00
0dd4 : f0 da __ BEQ $0db0 ; (sformat.s94 + 0)
.s66:
0dd6 : e0 78 __ CPX #$78
0dd8 : f0 06 __ BEQ $0de0 ; (sformat.s68 + 0)
.s67:
0dda : 85 1e __ STA ACCU + 3 ; (fps + 0)
0ddc : e0 58 __ CPX #$58
0dde : d0 82 __ BNE $0d62 ; (sformat.s55 + 16)
.s68:
0de0 : a9 00 __ LDA #$00
0de2 : 85 15 __ STA P8 
0de4 : a9 10 __ LDA #$10
0de6 : 8d de 9f STA $9fde ; (si.base + 0)
0de9 : 8a __ __ TXA
0dea : 29 e0 __ AND #$e0
0dec : 09 01 __ ORA #$01
0dee : 8d dd 9f STA $9fdd ; (si.cha + 0)
0df1 : 4c b2 0d JMP $0db2 ; (sformat.s69 + 0)
.s73:
0df4 : a5 57 __ LDA T4 + 0 
0df6 : 85 0f __ STA P2 
0df8 : a5 58 __ LDA T4 + 1 
0dfa : 85 10 __ STA P3 
0dfc : ad f7 9f LDA $9ff7 ; (sstack + 5)
0dff : 85 43 __ STA T0 + 0 
0e01 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0e04 : 85 44 __ STA T0 + 1 
0e06 : a0 00 __ LDY #$00
0e08 : b1 43 __ LDA (T0 + 0),y 
0e0a : 85 11 __ STA P4 
0e0c : c8 __ __ INY
0e0d : b1 43 __ LDA (T0 + 0),y 
0e0f : 85 12 __ STA P5 
0e11 : 18 __ __ CLC
0e12 : a5 43 __ LDA T0 + 0 
0e14 : 69 02 __ ADC #$02
0e16 : 8d f7 9f STA $9ff7 ; (sstack + 5)
0e19 : a5 44 __ LDA T0 + 1 
0e1b : 69 00 __ ADC #$00
0e1d : 8d f8 9f STA $9ff8 ; (sstack + 6)
0e20 : a9 da __ LDA #$da
0e22 : 85 0d __ STA P0 
0e24 : a9 9f __ LDA #$9f
0e26 : 85 0e __ STA P1 
0e28 : 20 a4 0e JSR $0ea4 ; (nformi.s4 + 0)
0e2b : 4c 74 0c JMP $0c74 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
0e2e : a0 00 __ LDY #$00
0e30 : b1 0e __ LDA (P1),y ; (str + 0)
0e32 : d0 01 __ BNE $0e35 ; (puts.s5 + 0)
.s3:
0e34 : 60 __ __ RTS
.s5:
0e35 : e6 0e __ INC P1 ; (str + 0)
0e37 : d0 02 __ BNE $0e3b ; (puts.s7 + 0)
.s6:
0e39 : e6 0f __ INC P2 ; (str + 1)
.s7:
0e3b : 20 41 0e JSR $0e41 ; (putpch.s4 + 0)
0e3e : 4c 2e 0e JMP $0e2e ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0e41 : 85 0d __ STA P0 ; (c + 0)
0e43 : ad 8c 1b LDA $1b8c ; (giocharmap + 0)
0e46 : f0 32 __ BEQ $0e7a ; (putpch.s5 + 0)
.s6:
0e48 : a5 0d __ LDA P0 ; (c + 0)
0e4a : c9 0a __ CMP #$0a
0e4c : d0 04 __ BNE $0e52 ; (putpch.s7 + 0)
.s18:
0e4e : a9 0d __ LDA #$0d
0e50 : d0 32 __ BNE $0e84 ; (putpch.s15 + 0)
.s7:
0e52 : c9 09 __ CMP #$09
0e54 : f0 36 __ BEQ $0e8c ; (putpch.s16 + 0)
.s8:
0e56 : ad 8c 1b LDA $1b8c ; (giocharmap + 0)
0e59 : c9 02 __ CMP #$02
0e5b : 90 1d __ BCC $0e7a ; (putpch.s5 + 0)
.s9:
0e5d : a5 0d __ LDA P0 ; (c + 0)
0e5f : c9 41 __ CMP #$41
0e61 : 90 17 __ BCC $0e7a ; (putpch.s5 + 0)
.s10:
0e63 : c9 7b __ CMP #$7b
0e65 : b0 13 __ BCS $0e7a ; (putpch.s5 + 0)
.s11:
0e67 : c9 61 __ CMP #$61
0e69 : b0 04 __ BCS $0e6f ; (putpch.s13 + 0)
.s12:
0e6b : c9 5b __ CMP #$5b
0e6d : b0 0b __ BCS $0e7a ; (putpch.s5 + 0)
.s13:
0e6f : 49 20 __ EOR #$20
0e71 : 85 0d __ STA P0 ; (c + 0)
0e73 : ad 8c 1b LDA $1b8c ; (giocharmap + 0)
0e76 : c9 02 __ CMP #$02
0e78 : f0 06 __ BEQ $0e80 ; (putpch.s14 + 0)
.s5:
0e7a : a5 0d __ LDA P0 ; (c + 0)
0e7c : 20 d2 ff JSR $ffd2 
.s3:
0e7f : 60 __ __ RTS
.s14:
0e80 : a5 0d __ LDA P0 ; (c + 0)
0e82 : 29 5f __ AND #$5f
.s15:
0e84 : 85 43 __ STA T0 + 0 
0e86 : a5 43 __ LDA T0 + 0 
0e88 : 20 d2 ff JSR $ffd2 
0e8b : 60 __ __ RTS
.s16:
0e8c : a5 d3 __ LDA $d3 
0e8e : 29 03 __ AND #$03
0e90 : 85 43 __ STA T0 + 0 
0e92 : a9 20 __ LDA #$20
0e94 : 85 44 __ STA T1 + 0 
.l17:
0e96 : a5 44 __ LDA T1 + 0 
0e98 : 20 d2 ff JSR $ffd2 
0e9b : e6 43 __ INC T0 + 0 
0e9d : a5 43 __ LDA T0 + 0 
0e9f : c9 04 __ CMP #$04
0ea1 : 90 f3 __ BCC $0e96 ; (putpch.l17 + 0)
0ea3 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0ea4 : a9 00 __ LDA #$00
0ea6 : 85 43 __ STA T5 + 0 
0ea8 : a0 04 __ LDY #$04
0eaa : b1 0d __ LDA (P0),y ; (si + 0)
0eac : 85 44 __ STA T6 + 0 
0eae : a5 13 __ LDA P6 ; (s + 0)
0eb0 : f0 13 __ BEQ $0ec5 ; (nformi.s5 + 0)
.s33:
0eb2 : 24 12 __ BIT P5 ; (v + 1)
0eb4 : 10 0f __ BPL $0ec5 ; (nformi.s5 + 0)
.s34:
0eb6 : 38 __ __ SEC
0eb7 : a9 00 __ LDA #$00
0eb9 : e5 11 __ SBC P4 ; (v + 0)
0ebb : 85 11 __ STA P4 ; (v + 0)
0ebd : a9 00 __ LDA #$00
0ebf : e5 12 __ SBC P5 ; (v + 1)
0ec1 : 85 12 __ STA P5 ; (v + 1)
0ec3 : e6 43 __ INC T5 + 0 
.s5:
0ec5 : a9 10 __ LDA #$10
0ec7 : 85 45 __ STA T7 + 0 
0ec9 : a5 11 __ LDA P4 ; (v + 0)
0ecb : 05 12 __ ORA P5 ; (v + 1)
0ecd : f0 33 __ BEQ $0f02 ; (nformi.s6 + 0)
.s28:
0ecf : a5 11 __ LDA P4 ; (v + 0)
0ed1 : 85 1b __ STA ACCU + 0 
0ed3 : a5 12 __ LDA P5 ; (v + 1)
0ed5 : 85 1c __ STA ACCU + 1 
.l29:
0ed7 : a5 44 __ LDA T6 + 0 
0ed9 : 85 03 __ STA WORK + 0 
0edb : a9 00 __ LDA #$00
0edd : 85 04 __ STA WORK + 1 
0edf : 20 6f 19 JSR $196f ; (divmod + 0)
0ee2 : a5 05 __ LDA WORK + 2 
0ee4 : c9 0a __ CMP #$0a
0ee6 : b0 04 __ BCS $0eec ; (nformi.s32 + 0)
.s30:
0ee8 : a9 30 __ LDA #$30
0eea : 90 06 __ BCC $0ef2 ; (nformi.s31 + 0)
.s32:
0eec : a0 03 __ LDY #$03
0eee : b1 0d __ LDA (P0),y ; (si + 0)
0ef0 : e9 0a __ SBC #$0a
.s31:
0ef2 : 18 __ __ CLC
0ef3 : 65 05 __ ADC WORK + 2 
0ef5 : a6 45 __ LDX T7 + 0 
0ef7 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0efa : c6 45 __ DEC T7 + 0 
0efc : a5 1b __ LDA ACCU + 0 
0efe : 05 1c __ ORA ACCU + 1 
0f00 : d0 d5 __ BNE $0ed7 ; (nformi.l29 + 0)
.s6:
0f02 : a0 02 __ LDY #$02
0f04 : b1 0d __ LDA (P0),y ; (si + 0)
0f06 : c9 ff __ CMP #$ff
0f08 : d0 04 __ BNE $0f0e ; (nformi.s27 + 0)
.s7:
0f0a : a9 0f __ LDA #$0f
0f0c : d0 05 __ BNE $0f13 ; (nformi.s39 + 0)
.s27:
0f0e : 38 __ __ SEC
0f0f : a9 10 __ LDA #$10
0f11 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0f13 : a8 __ __ TAY
0f14 : c4 45 __ CPY T7 + 0 
0f16 : b0 0d __ BCS $0f25 ; (nformi.s8 + 0)
.s26:
0f18 : a9 30 __ LDA #$30
.l40:
0f1a : a6 45 __ LDX T7 + 0 
0f1c : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f1f : c6 45 __ DEC T7 + 0 
0f21 : c4 45 __ CPY T7 + 0 
0f23 : 90 f5 __ BCC $0f1a ; (nformi.l40 + 0)
.s8:
0f25 : a0 07 __ LDY #$07
0f27 : b1 0d __ LDA (P0),y ; (si + 0)
0f29 : f0 1c __ BEQ $0f47 ; (nformi.s9 + 0)
.s24:
0f2b : a5 44 __ LDA T6 + 0 
0f2d : c9 10 __ CMP #$10
0f2f : d0 16 __ BNE $0f47 ; (nformi.s9 + 0)
.s25:
0f31 : a0 03 __ LDY #$03
0f33 : b1 0d __ LDA (P0),y ; (si + 0)
0f35 : a8 __ __ TAY
0f36 : a9 30 __ LDA #$30
0f38 : a6 45 __ LDX T7 + 0 
0f3a : ca __ __ DEX
0f3b : ca __ __ DEX
0f3c : 86 45 __ STX T7 + 0 
0f3e : 9d e2 9f STA $9fe2,x ; (buffer[0] + 0)
0f41 : 98 __ __ TYA
0f42 : 69 16 __ ADC #$16
0f44 : 9d e3 9f STA $9fe3,x ; (buffer[0] + 1)
.s9:
0f47 : a9 00 __ LDA #$00
0f49 : 85 1b __ STA ACCU + 0 
0f4b : a5 43 __ LDA T5 + 0 
0f4d : f0 0c __ BEQ $0f5b ; (nformi.s10 + 0)
.s23:
0f4f : a9 2d __ LDA #$2d
.s22:
0f51 : a6 45 __ LDX T7 + 0 
0f53 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f56 : c6 45 __ DEC T7 + 0 
0f58 : 4c 65 0f JMP $0f65 ; (nformi.s11 + 0)
.s10:
0f5b : a0 05 __ LDY #$05
0f5d : b1 0d __ LDA (P0),y ; (si + 0)
0f5f : f0 04 __ BEQ $0f65 ; (nformi.s11 + 0)
.s21:
0f61 : a9 2b __ LDA #$2b
0f63 : d0 ec __ BNE $0f51 ; (nformi.s22 + 0)
.s11:
0f65 : a6 45 __ LDX T7 + 0 
0f67 : a0 06 __ LDY #$06
0f69 : b1 0d __ LDA (P0),y ; (si + 0)
0f6b : d0 2b __ BNE $0f98 ; (nformi.s17 + 0)
.l12:
0f6d : 8a __ __ TXA
0f6e : 18 __ __ CLC
0f6f : a0 01 __ LDY #$01
0f71 : 71 0d __ ADC (P0),y ; (si + 0)
0f73 : b0 04 __ BCS $0f79 ; (nformi.s15 + 0)
.s16:
0f75 : c9 11 __ CMP #$11
0f77 : 90 0a __ BCC $0f83 ; (nformi.s13 + 0)
.s15:
0f79 : a0 00 __ LDY #$00
0f7b : b1 0d __ LDA (P0),y ; (si + 0)
0f7d : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f80 : ca __ __ DEX
0f81 : b0 ea __ BCS $0f6d ; (nformi.l12 + 0)
.s13:
0f83 : e0 10 __ CPX #$10
0f85 : b0 0e __ BCS $0f95 ; (nformi.s41 + 0)
.s14:
0f87 : 88 __ __ DEY
.l37:
0f88 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
0f8b : 91 0f __ STA (P2),y ; (str + 0)
0f8d : c8 __ __ INY
0f8e : e8 __ __ INX
0f8f : e0 10 __ CPX #$10
0f91 : 90 f5 __ BCC $0f88 ; (nformi.l37 + 0)
.s38:
0f93 : 84 1b __ STY ACCU + 0 
.s41:
0f95 : a5 1b __ LDA ACCU + 0 
.s3:
0f97 : 60 __ __ RTS
.s17:
0f98 : e0 10 __ CPX #$10
0f9a : b0 1a __ BCS $0fb6 ; (nformi.l18 + 0)
.s20:
0f9c : a0 00 __ LDY #$00
.l35:
0f9e : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
0fa1 : 91 0f __ STA (P2),y ; (str + 0)
0fa3 : c8 __ __ INY
0fa4 : e8 __ __ INX
0fa5 : e0 10 __ CPX #$10
0fa7 : 90 f5 __ BCC $0f9e ; (nformi.l35 + 0)
.s36:
0fa9 : 84 1b __ STY ACCU + 0 
0fab : b0 09 __ BCS $0fb6 ; (nformi.l18 + 0)
.s19:
0fad : 88 __ __ DEY
0fae : b1 0d __ LDA (P0),y ; (si + 0)
0fb0 : a4 1b __ LDY ACCU + 0 
0fb2 : 91 0f __ STA (P2),y ; (str + 0)
0fb4 : e6 1b __ INC ACCU + 0 
.l18:
0fb6 : a5 1b __ LDA ACCU + 0 
0fb8 : a0 01 __ LDY #$01
0fba : d1 0d __ CMP (P0),y ; (si + 0)
0fbc : 90 ef __ BCC $0fad ; (nformi.s19 + 0)
0fbe : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0fbf : a9 00 __ LDA #$00
0fc1 : 85 43 __ STA T4 + 0 
0fc3 : a5 15 __ LDA P8 ; (s + 0)
0fc5 : f0 1f __ BEQ $0fe6 ; (nforml.s5 + 0)
.s35:
0fc7 : 24 14 __ BIT P7 ; (v + 3)
0fc9 : 10 1b __ BPL $0fe6 ; (nforml.s5 + 0)
.s36:
0fcb : 38 __ __ SEC
0fcc : a9 00 __ LDA #$00
0fce : e5 11 __ SBC P4 ; (v + 0)
0fd0 : 85 11 __ STA P4 ; (v + 0)
0fd2 : a9 00 __ LDA #$00
0fd4 : e5 12 __ SBC P5 ; (v + 1)
0fd6 : 85 12 __ STA P5 ; (v + 1)
0fd8 : a9 00 __ LDA #$00
0fda : e5 13 __ SBC P6 ; (v + 2)
0fdc : 85 13 __ STA P6 ; (v + 2)
0fde : a9 00 __ LDA #$00
0fe0 : e5 14 __ SBC P7 ; (v + 3)
0fe2 : 85 14 __ STA P7 ; (v + 3)
0fe4 : e6 43 __ INC T4 + 0 
.s5:
0fe6 : a9 10 __ LDA #$10
0fe8 : 85 44 __ STA T5 + 0 
0fea : a5 14 __ LDA P7 ; (v + 3)
0fec : f0 03 __ BEQ $0ff1 ; (nforml.s31 + 0)
0fee : 4c b9 10 JMP $10b9 ; (nforml.l28 + 0)
.s31:
0ff1 : a5 13 __ LDA P6 ; (v + 2)
0ff3 : d0 f9 __ BNE $0fee ; (nforml.s5 + 8)
.s32:
0ff5 : a5 12 __ LDA P5 ; (v + 1)
0ff7 : d0 f5 __ BNE $0fee ; (nforml.s5 + 8)
.s33:
0ff9 : c5 11 __ CMP P4 ; (v + 0)
0ffb : 90 f1 __ BCC $0fee ; (nforml.s5 + 8)
.s6:
0ffd : a0 02 __ LDY #$02
0fff : b1 0d __ LDA (P0),y ; (si + 0)
1001 : c9 ff __ CMP #$ff
1003 : d0 04 __ BNE $1009 ; (nforml.s27 + 0)
.s7:
1005 : a9 0f __ LDA #$0f
1007 : d0 05 __ BNE $100e ; (nforml.s41 + 0)
.s27:
1009 : 38 __ __ SEC
100a : a9 10 __ LDA #$10
100c : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
100e : a8 __ __ TAY
100f : c4 44 __ CPY T5 + 0 
1011 : b0 0d __ BCS $1020 ; (nforml.s8 + 0)
.s26:
1013 : a9 30 __ LDA #$30
.l42:
1015 : a6 44 __ LDX T5 + 0 
1017 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
101a : c6 44 __ DEC T5 + 0 
101c : c4 44 __ CPY T5 + 0 
101e : 90 f5 __ BCC $1015 ; (nforml.l42 + 0)
.s8:
1020 : a0 07 __ LDY #$07
1022 : b1 0d __ LDA (P0),y ; (si + 0)
1024 : f0 1d __ BEQ $1043 ; (nforml.s9 + 0)
.s24:
1026 : a0 04 __ LDY #$04
1028 : b1 0d __ LDA (P0),y ; (si + 0)
102a : c9 10 __ CMP #$10
102c : d0 15 __ BNE $1043 ; (nforml.s9 + 0)
.s25:
102e : 88 __ __ DEY
102f : b1 0d __ LDA (P0),y ; (si + 0)
1031 : a8 __ __ TAY
1032 : a9 30 __ LDA #$30
1034 : a6 44 __ LDX T5 + 0 
1036 : ca __ __ DEX
1037 : ca __ __ DEX
1038 : 86 44 __ STX T5 + 0 
103a : 9d e2 9f STA $9fe2,x ; (buffer[0] + 0)
103d : 98 __ __ TYA
103e : 69 16 __ ADC #$16
1040 : 9d e3 9f STA $9fe3,x ; (buffer[0] + 1)
.s9:
1043 : a9 00 __ LDA #$00
1045 : 85 1b __ STA ACCU + 0 
1047 : a5 43 __ LDA T4 + 0 
1049 : f0 0c __ BEQ $1057 ; (nforml.s10 + 0)
.s23:
104b : a9 2d __ LDA #$2d
.s22:
104d : a6 44 __ LDX T5 + 0 
104f : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
1052 : c6 44 __ DEC T5 + 0 
1054 : 4c 61 10 JMP $1061 ; (nforml.s11 + 0)
.s10:
1057 : a0 05 __ LDY #$05
1059 : b1 0d __ LDA (P0),y ; (si + 0)
105b : f0 04 __ BEQ $1061 ; (nforml.s11 + 0)
.s21:
105d : a9 2b __ LDA #$2b
105f : d0 ec __ BNE $104d ; (nforml.s22 + 0)
.s11:
1061 : a0 06 __ LDY #$06
1063 : a6 44 __ LDX T5 + 0 
1065 : b1 0d __ LDA (P0),y ; (si + 0)
1067 : d0 29 __ BNE $1092 ; (nforml.s17 + 0)
.l12:
1069 : 8a __ __ TXA
106a : 18 __ __ CLC
106b : a0 01 __ LDY #$01
106d : 71 0d __ ADC (P0),y ; (si + 0)
106f : b0 04 __ BCS $1075 ; (nforml.s15 + 0)
.s16:
1071 : c9 11 __ CMP #$11
1073 : 90 0a __ BCC $107f ; (nforml.s13 + 0)
.s15:
1075 : a0 00 __ LDY #$00
1077 : b1 0d __ LDA (P0),y ; (si + 0)
1079 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
107c : ca __ __ DEX
107d : b0 ea __ BCS $1069 ; (nforml.l12 + 0)
.s13:
107f : e0 10 __ CPX #$10
1081 : b0 0e __ BCS $1091 ; (nforml.s3 + 0)
.s14:
1083 : 88 __ __ DEY
.l39:
1084 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
1087 : 91 0f __ STA (P2),y ; (str + 0)
1089 : c8 __ __ INY
108a : e8 __ __ INX
108b : e0 10 __ CPX #$10
108d : 90 f5 __ BCC $1084 ; (nforml.l39 + 0)
.s40:
108f : 84 1b __ STY ACCU + 0 
.s3:
1091 : 60 __ __ RTS
.s17:
1092 : e0 10 __ CPX #$10
1094 : b0 1a __ BCS $10b0 ; (nforml.l18 + 0)
.s20:
1096 : a0 00 __ LDY #$00
.l37:
1098 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
109b : 91 0f __ STA (P2),y ; (str + 0)
109d : c8 __ __ INY
109e : e8 __ __ INX
109f : e0 10 __ CPX #$10
10a1 : 90 f5 __ BCC $1098 ; (nforml.l37 + 0)
.s38:
10a3 : 84 1b __ STY ACCU + 0 
10a5 : b0 09 __ BCS $10b0 ; (nforml.l18 + 0)
.s19:
10a7 : 88 __ __ DEY
10a8 : b1 0d __ LDA (P0),y ; (si + 0)
10aa : a4 1b __ LDY ACCU + 0 
10ac : 91 0f __ STA (P2),y ; (str + 0)
10ae : e6 1b __ INC ACCU + 0 
.l18:
10b0 : a5 1b __ LDA ACCU + 0 
10b2 : a0 01 __ LDY #$01
10b4 : d1 0d __ CMP (P0),y ; (si + 0)
10b6 : 90 ef __ BCC $10a7 ; (nforml.s19 + 0)
10b8 : 60 __ __ RTS
.l28:
10b9 : a0 04 __ LDY #$04
10bb : b1 0d __ LDA (P0),y ; (si + 0)
10bd : 85 03 __ STA WORK + 0 
10bf : a5 11 __ LDA P4 ; (v + 0)
10c1 : 85 1b __ STA ACCU + 0 
10c3 : a5 12 __ LDA P5 ; (v + 1)
10c5 : 85 1c __ STA ACCU + 1 
10c7 : a5 13 __ LDA P6 ; (v + 2)
10c9 : 85 1d __ STA ACCU + 2 
10cb : a5 14 __ LDA P7 ; (v + 3)
10cd : 85 1e __ STA ACCU + 3 
10cf : a9 00 __ LDA #$00
10d1 : 85 04 __ STA WORK + 1 
10d3 : 85 05 __ STA WORK + 2 
10d5 : 85 06 __ STA WORK + 3 
10d7 : 20 b4 1a JSR $1ab4 ; (divmod32 + 0)
10da : a5 07 __ LDA WORK + 4 
10dc : c9 0a __ CMP #$0a
10de : b0 04 __ BCS $10e4 ; (nforml.s34 + 0)
.s29:
10e0 : a9 30 __ LDA #$30
10e2 : 90 06 __ BCC $10ea ; (nforml.s30 + 0)
.s34:
10e4 : a0 03 __ LDY #$03
10e6 : b1 0d __ LDA (P0),y ; (si + 0)
10e8 : e9 0a __ SBC #$0a
.s30:
10ea : 18 __ __ CLC
10eb : 65 07 __ ADC WORK + 4 
10ed : a6 44 __ LDX T5 + 0 
10ef : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
10f2 : c6 44 __ DEC T5 + 0 
10f4 : a5 1b __ LDA ACCU + 0 
10f6 : 85 11 __ STA P4 ; (v + 0)
10f8 : a5 1c __ LDA ACCU + 1 
10fa : 85 12 __ STA P5 ; (v + 1)
10fc : a5 1d __ LDA ACCU + 2 
10fe : 85 13 __ STA P6 ; (v + 2)
1100 : a5 1e __ LDA ACCU + 3 
1102 : 85 14 __ STA P7 ; (v + 3)
1104 : d0 b3 __ BNE $10b9 ; (nforml.l28 + 0)
1106 : 4c f1 0f JMP $0ff1 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
1109 : a2 03 __ LDX #$03
110b : b5 53 __ LDA T7 + 0,x 
110d : 9d e9 9f STA $9fe9,x ; (nformf@stack + 0)
1110 : ca __ __ DEX
1111 : 10 f8 __ BPL $110b ; (nformf.s1 + 2)
.s4:
1113 : a5 16 __ LDA P9 ; (f + 1)
1115 : 85 44 __ STA T0 + 1 
1117 : a5 17 __ LDA P10 ; (f + 2)
1119 : 85 45 __ STA T0 + 2 
111b : a5 18 __ LDA P11 ; (f + 3)
111d : 29 7f __ AND #$7f
111f : 05 17 __ ORA P10 ; (f + 2)
1121 : 05 16 __ ORA P9 ; (f + 1)
1123 : 05 15 __ ORA P8 ; (f + 0)
1125 : f0 21 __ BEQ $1148 ; (nformf.s5 + 0)
.s107:
1127 : 24 18 __ BIT P11 ; (f + 3)
1129 : 10 1d __ BPL $1148 ; (nformf.s5 + 0)
.s106:
112b : a9 2d __ LDA #$2d
112d : a0 00 __ LDY #$00
112f : 91 13 __ STA (P6),y ; (str + 0)
1131 : a5 18 __ LDA P11 ; (f + 3)
1133 : 49 80 __ EOR #$80
1135 : 85 10 __ STA P3 
1137 : 85 18 __ STA P11 ; (f + 3)
1139 : a5 15 __ LDA P8 ; (f + 0)
113b : 85 0d __ STA P0 
113d : a5 16 __ LDA P9 ; (f + 1)
113f : 85 0e __ STA P1 
1141 : a5 17 __ LDA P10 ; (f + 2)
1143 : 85 0f __ STA P2 
1145 : 4c 5c 16 JMP $165c ; (nformf.s104 + 0)
.s5:
1148 : a5 15 __ LDA P8 ; (f + 0)
114a : 85 0d __ STA P0 
114c : a5 16 __ LDA P9 ; (f + 1)
114e : 85 0e __ STA P1 
1150 : a5 17 __ LDA P10 ; (f + 2)
1152 : 85 0f __ STA P2 
1154 : a5 18 __ LDA P11 ; (f + 3)
1156 : 85 10 __ STA P3 
1158 : a0 05 __ LDY #$05
115a : b1 11 __ LDA (P4),y ; (si + 0)
115c : f0 09 __ BEQ $1167 ; (nformf.s6 + 0)
.s103:
115e : a9 2b __ LDA #$2b
1160 : a0 00 __ LDY #$00
1162 : 91 13 __ STA (P6),y ; (str + 0)
1164 : 4c 5c 16 JMP $165c ; (nformf.s104 + 0)
.s6:
1167 : 20 6d 16 JSR $166d ; (isinf.s4 + 0)
116a : a2 00 __ LDX #$00
116c : 86 54 __ STX T9 + 0 
116e : a8 __ __ TAY
116f : f0 05 __ BEQ $1176 ; (nformf.s7 + 0)
.s101:
1171 : a9 02 __ LDA #$02
1173 : 4c 2c 16 JMP $162c ; (nformf.s102 + 0)
.s7:
1176 : a5 11 __ LDA P4 ; (si + 0)
1178 : 85 4b __ STA T2 + 0 
117a : a5 12 __ LDA P5 ; (si + 1)
117c : 85 4c __ STA T2 + 1 
117e : a0 02 __ LDY #$02
1180 : b1 11 __ LDA (P4),y ; (si + 0)
1182 : c9 ff __ CMP #$ff
1184 : d0 02 __ BNE $1188 ; (nformf.s100 + 0)
.s8:
1186 : a9 06 __ LDA #$06
.s100:
1188 : 85 4d __ STA T3 + 0 
118a : 85 52 __ STA T6 + 0 
118c : a9 00 __ LDA #$00
118e : 85 4f __ STA T4 + 0 
1190 : 85 50 __ STA T4 + 1 
1192 : a5 18 __ LDA P11 ; (f + 3)
1194 : 85 46 __ STA T0 + 3 
1196 : 29 7f __ AND #$7f
1198 : 05 17 __ ORA P10 ; (f + 2)
119a : 05 16 __ ORA P9 ; (f + 1)
119c : a6 15 __ LDX P8 ; (f + 0)
119e : 86 43 __ STX T0 + 0 
11a0 : 05 15 __ ORA P8 ; (f + 0)
11a2 : d0 03 __ BNE $11a7 ; (nformf.s67 + 0)
11a4 : 4c db 12 JMP $12db ; (nformf.s9 + 0)
.s67:
11a7 : a5 18 __ LDA P11 ; (f + 3)
11a9 : 10 03 __ BPL $11ae ; (nformf.s95 + 0)
11ab : 4c 2d 12 JMP $122d ; (nformf.l80 + 0)
.s95:
11ae : c9 44 __ CMP #$44
11b0 : d0 0d __ BNE $11bf ; (nformf.l99 + 0)
.s96:
11b2 : a5 17 __ LDA P10 ; (f + 2)
11b4 : c9 7a __ CMP #$7a
11b6 : d0 07 __ BNE $11bf ; (nformf.l99 + 0)
.s97:
11b8 : a5 16 __ LDA P9 ; (f + 1)
11ba : d0 03 __ BNE $11bf ; (nformf.l99 + 0)
.s98:
11bc : 8a __ __ TXA
11bd : f0 02 __ BEQ $11c1 ; (nformf.l90 + 0)
.l99:
11bf : 90 54 __ BCC $1215 ; (nformf.s68 + 0)
.l90:
11c1 : 18 __ __ CLC
11c2 : a5 4f __ LDA T4 + 0 
11c4 : 69 03 __ ADC #$03
11c6 : 85 4f __ STA T4 + 0 
11c8 : 90 02 __ BCC $11cc ; (nformf.s121 + 0)
.s120:
11ca : e6 50 __ INC T4 + 1 
.s121:
11cc : a5 43 __ LDA T0 + 0 
11ce : 85 1b __ STA ACCU + 0 
11d0 : a5 44 __ LDA T0 + 1 
11d2 : 85 1c __ STA ACCU + 1 
11d4 : a5 45 __ LDA T0 + 2 
11d6 : 85 1d __ STA ACCU + 2 
11d8 : a5 46 __ LDA T0 + 3 
11da : 85 1e __ STA ACCU + 3 
11dc : a9 00 __ LDA #$00
11de : 85 03 __ STA WORK + 0 
11e0 : 85 04 __ STA WORK + 1 
11e2 : a9 7a __ LDA #$7a
11e4 : 85 05 __ STA WORK + 2 
11e6 : a9 44 __ LDA #$44
11e8 : 85 06 __ STA WORK + 3 
11ea : 20 a1 16 JSR $16a1 ; (freg + 20)
11ed : 20 87 18 JSR $1887 ; (crt_fdiv + 0)
11f0 : a5 1b __ LDA ACCU + 0 
11f2 : 85 43 __ STA T0 + 0 
11f4 : a5 1c __ LDA ACCU + 1 
11f6 : 85 44 __ STA T0 + 1 
11f8 : a6 1d __ LDX ACCU + 2 
11fa : 86 45 __ STX T0 + 2 
11fc : a5 1e __ LDA ACCU + 3 
11fe : 85 46 __ STA T0 + 3 
1200 : 30 13 __ BMI $1215 ; (nformf.s68 + 0)
.s91:
1202 : c9 44 __ CMP #$44
1204 : d0 b9 __ BNE $11bf ; (nformf.l99 + 0)
.s92:
1206 : e0 7a __ CPX #$7a
1208 : d0 b5 __ BNE $11bf ; (nformf.l99 + 0)
.s93:
120a : a5 1c __ LDA ACCU + 1 
120c : 38 __ __ SEC
120d : d0 b0 __ BNE $11bf ; (nformf.l99 + 0)
.s94:
120f : a5 1b __ LDA ACCU + 0 
1211 : f0 ae __ BEQ $11c1 ; (nformf.l90 + 0)
1213 : d0 aa __ BNE $11bf ; (nformf.l99 + 0)
.s68:
1215 : a5 46 __ LDA T0 + 3 
1217 : 30 14 __ BMI $122d ; (nformf.l80 + 0)
.s86:
1219 : c9 3f __ CMP #$3f
121b : d0 0e __ BNE $122b ; (nformf.s85 + 0)
.s87:
121d : a5 45 __ LDA T0 + 2 
121f : c9 80 __ CMP #$80
1221 : d0 08 __ BNE $122b ; (nformf.s85 + 0)
.s88:
1223 : a5 44 __ LDA T0 + 1 
1225 : d0 04 __ BNE $122b ; (nformf.s85 + 0)
.s89:
1227 : a5 43 __ LDA T0 + 0 
1229 : f0 49 __ BEQ $1274 ; (nformf.s69 + 0)
.s85:
122b : b0 47 __ BCS $1274 ; (nformf.s69 + 0)
.l80:
122d : 38 __ __ SEC
122e : a5 4f __ LDA T4 + 0 
1230 : e9 03 __ SBC #$03
1232 : 85 4f __ STA T4 + 0 
1234 : b0 02 __ BCS $1238 ; (nformf.s116 + 0)
.s115:
1236 : c6 50 __ DEC T4 + 1 
.s116:
1238 : a9 00 __ LDA #$00
123a : 85 1b __ STA ACCU + 0 
123c : 85 1c __ STA ACCU + 1 
123e : a9 7a __ LDA #$7a
1240 : 85 1d __ STA ACCU + 2 
1242 : a9 44 __ LDA #$44
1244 : 85 1e __ STA ACCU + 3 
1246 : a2 43 __ LDX #$43
1248 : 20 91 16 JSR $1691 ; (freg + 4)
124b : 20 bf 17 JSR $17bf ; (crt_fmul + 0)
124e : a5 1b __ LDA ACCU + 0 
1250 : 85 43 __ STA T0 + 0 
1252 : a5 1c __ LDA ACCU + 1 
1254 : 85 44 __ STA T0 + 1 
1256 : a6 1d __ LDX ACCU + 2 
1258 : 86 45 __ STX T0 + 2 
125a : a5 1e __ LDA ACCU + 3 
125c : 85 46 __ STA T0 + 3 
125e : 30 cd __ BMI $122d ; (nformf.l80 + 0)
.s81:
1260 : c9 3f __ CMP #$3f
1262 : 90 c9 __ BCC $122d ; (nformf.l80 + 0)
.s122:
1264 : d0 0e __ BNE $1274 ; (nformf.s69 + 0)
.s82:
1266 : e0 80 __ CPX #$80
1268 : 90 c3 __ BCC $122d ; (nformf.l80 + 0)
.s123:
126a : d0 08 __ BNE $1274 ; (nformf.s69 + 0)
.s83:
126c : a5 1c __ LDA ACCU + 1 
126e : d0 bb __ BNE $122b ; (nformf.s85 + 0)
.s84:
1270 : a5 1b __ LDA ACCU + 0 
1272 : d0 b7 __ BNE $122b ; (nformf.s85 + 0)
.s69:
1274 : a5 46 __ LDA T0 + 3 
1276 : 30 63 __ BMI $12db ; (nformf.s9 + 0)
.s75:
1278 : c9 41 __ CMP #$41
127a : d0 0e __ BNE $128a ; (nformf.l79 + 0)
.s76:
127c : a5 45 __ LDA T0 + 2 
127e : c9 20 __ CMP #$20
1280 : d0 08 __ BNE $128a ; (nformf.l79 + 0)
.s77:
1282 : a5 44 __ LDA T0 + 1 
1284 : d0 04 __ BNE $128a ; (nformf.l79 + 0)
.s78:
1286 : a5 43 __ LDA T0 + 0 
1288 : f0 02 __ BEQ $128c ; (nformf.l70 + 0)
.l79:
128a : 90 4f __ BCC $12db ; (nformf.s9 + 0)
.l70:
128c : e6 4f __ INC T4 + 0 
128e : d0 02 __ BNE $1292 ; (nformf.s119 + 0)
.s118:
1290 : e6 50 __ INC T4 + 1 
.s119:
1292 : a5 43 __ LDA T0 + 0 
1294 : 85 1b __ STA ACCU + 0 
1296 : a5 44 __ LDA T0 + 1 
1298 : 85 1c __ STA ACCU + 1 
129a : a5 45 __ LDA T0 + 2 
129c : 85 1d __ STA ACCU + 2 
129e : a5 46 __ LDA T0 + 3 
12a0 : 85 1e __ STA ACCU + 3 
12a2 : a9 00 __ LDA #$00
12a4 : 85 03 __ STA WORK + 0 
12a6 : 85 04 __ STA WORK + 1 
12a8 : a9 20 __ LDA #$20
12aa : 85 05 __ STA WORK + 2 
12ac : a9 41 __ LDA #$41
12ae : 85 06 __ STA WORK + 3 
12b0 : 20 a1 16 JSR $16a1 ; (freg + 20)
12b3 : 20 87 18 JSR $1887 ; (crt_fdiv + 0)
12b6 : a5 1b __ LDA ACCU + 0 
12b8 : 85 43 __ STA T0 + 0 
12ba : a5 1c __ LDA ACCU + 1 
12bc : 85 44 __ STA T0 + 1 
12be : a6 1d __ LDX ACCU + 2 
12c0 : 86 45 __ STX T0 + 2 
12c2 : a5 1e __ LDA ACCU + 3 
12c4 : 85 46 __ STA T0 + 3 
12c6 : 30 13 __ BMI $12db ; (nformf.s9 + 0)
.s71:
12c8 : c9 41 __ CMP #$41
12ca : d0 be __ BNE $128a ; (nformf.l79 + 0)
.s72:
12cc : e0 20 __ CPX #$20
12ce : d0 ba __ BNE $128a ; (nformf.l79 + 0)
.s73:
12d0 : a5 1c __ LDA ACCU + 1 
12d2 : 38 __ __ SEC
12d3 : d0 b5 __ BNE $128a ; (nformf.l79 + 0)
.s74:
12d5 : a5 1b __ LDA ACCU + 0 
12d7 : f0 b3 __ BEQ $128c ; (nformf.l70 + 0)
12d9 : d0 af __ BNE $128a ; (nformf.l79 + 0)
.s9:
12db : ad f2 9f LDA $9ff2 ; (sstack + 0)
12de : c9 65 __ CMP #$65
12e0 : d0 04 __ BNE $12e6 ; (nformf.s11 + 0)
.s10:
12e2 : a9 01 __ LDA #$01
12e4 : d0 02 __ BNE $12e8 ; (nformf.s12 + 0)
.s11:
12e6 : a9 00 __ LDA #$00
.s12:
12e8 : 85 55 __ STA T10 + 0 
12ea : a6 4d __ LDX T3 + 0 
12ec : e8 __ __ INX
12ed : 86 51 __ STX T5 + 0 
12ef : ad f2 9f LDA $9ff2 ; (sstack + 0)
12f2 : c9 67 __ CMP #$67
12f4 : d0 13 __ BNE $1309 ; (nformf.s13 + 0)
.s63:
12f6 : a5 50 __ LDA T4 + 1 
12f8 : 30 08 __ BMI $1302 ; (nformf.s64 + 0)
.s66:
12fa : d0 06 __ BNE $1302 ; (nformf.s64 + 0)
.s65:
12fc : a5 4f __ LDA T4 + 0 
12fe : c9 04 __ CMP #$04
1300 : 90 07 __ BCC $1309 ; (nformf.s13 + 0)
.s64:
1302 : a9 01 __ LDA #$01
1304 : 85 55 __ STA T10 + 0 
1306 : 4c 92 15 JMP $1592 ; (nformf.s53 + 0)
.s13:
1309 : a5 55 __ LDA T10 + 0 
130b : d0 f9 __ BNE $1306 ; (nformf.s64 + 4)
.s14:
130d : 24 50 __ BIT T4 + 1 
130f : 10 43 __ BPL $1354 ; (nformf.s15 + 0)
.s52:
1311 : a5 43 __ LDA T0 + 0 
1313 : 85 1b __ STA ACCU + 0 
1315 : a5 44 __ LDA T0 + 1 
1317 : 85 1c __ STA ACCU + 1 
1319 : a5 45 __ LDA T0 + 2 
131b : 85 1d __ STA ACCU + 2 
131d : a5 46 __ LDA T0 + 3 
131f : 85 1e __ STA ACCU + 3 
.l108:
1321 : a9 00 __ LDA #$00
1323 : 85 03 __ STA WORK + 0 
1325 : 85 04 __ STA WORK + 1 
1327 : a9 20 __ LDA #$20
1329 : 85 05 __ STA WORK + 2 
132b : a9 41 __ LDA #$41
132d : 85 06 __ STA WORK + 3 
132f : 20 a1 16 JSR $16a1 ; (freg + 20)
1332 : 20 87 18 JSR $1887 ; (crt_fdiv + 0)
1335 : 18 __ __ CLC
1336 : a5 4f __ LDA T4 + 0 
1338 : 69 01 __ ADC #$01
133a : 85 4f __ STA T4 + 0 
133c : a5 50 __ LDA T4 + 1 
133e : 69 00 __ ADC #$00
1340 : 85 50 __ STA T4 + 1 
1342 : 30 dd __ BMI $1321 ; (nformf.l108 + 0)
.s109:
1344 : a5 1e __ LDA ACCU + 3 
1346 : 85 46 __ STA T0 + 3 
1348 : a5 1d __ LDA ACCU + 2 
134a : 85 45 __ STA T0 + 2 
134c : a5 1c __ LDA ACCU + 1 
134e : 85 44 __ STA T0 + 1 
1350 : a5 1b __ LDA ACCU + 0 
1352 : 85 43 __ STA T0 + 0 
.s15:
1354 : 18 __ __ CLC
1355 : a5 4d __ LDA T3 + 0 
1357 : 65 4f __ ADC T4 + 0 
1359 : 18 __ __ CLC
135a : 69 01 __ ADC #$01
135c : 85 51 __ STA T5 + 0 
135e : c9 07 __ CMP #$07
1360 : 90 14 __ BCC $1376 ; (nformf.s51 + 0)
.s16:
1362 : ad a5 1b LDA $1ba5 ; (fround5[0] + 24)
1365 : 85 47 __ STA T1 + 0 
1367 : ad a6 1b LDA $1ba6 ; (fround5[0] + 25)
136a : 85 48 __ STA T1 + 1 
136c : ad a7 1b LDA $1ba7 ; (fround5[0] + 26)
136f : 85 49 __ STA T1 + 2 
1371 : ad a8 1b LDA $1ba8 ; (fround5[0] + 27)
1374 : b0 15 __ BCS $138b ; (nformf.s17 + 0)
.s51:
1376 : 0a __ __ ASL
1377 : 0a __ __ ASL
1378 : aa __ __ TAX
1379 : bd 89 1b LDA $1b89,x ; (divmod32 + 213)
137c : 85 47 __ STA T1 + 0 
137e : bd 8a 1b LDA $1b8a,x ; (divmod32 + 214)
1381 : 85 48 __ STA T1 + 1 
1383 : bd 8b 1b LDA $1b8b,x ; (spentry + 0)
1386 : 85 49 __ STA T1 + 2 
1388 : bd 8c 1b LDA $1b8c,x ; (giocharmap + 0)
.s17:
138b : 85 4a __ STA T1 + 3 
138d : a5 43 __ LDA T0 + 0 
138f : 85 1b __ STA ACCU + 0 
1391 : a5 44 __ LDA T0 + 1 
1393 : 85 1c __ STA ACCU + 1 
1395 : a5 45 __ LDA T0 + 2 
1397 : 85 1d __ STA ACCU + 2 
1399 : a5 46 __ LDA T0 + 3 
139b : 85 1e __ STA ACCU + 3 
139d : a2 47 __ LDX #$47
139f : 20 91 16 JSR $1691 ; (freg + 4)
13a2 : 20 d8 16 JSR $16d8 ; (faddsub + 6)
13a5 : a5 1c __ LDA ACCU + 1 
13a7 : 85 16 __ STA P9 ; (f + 1)
13a9 : a5 1d __ LDA ACCU + 2 
13ab : 85 17 __ STA P10 ; (f + 2)
13ad : a6 1b __ LDX ACCU + 0 
13af : a5 1e __ LDA ACCU + 3 
13b1 : 85 18 __ STA P11 ; (f + 3)
13b3 : 30 3a __ BMI $13ef ; (nformf.s18 + 0)
.s46:
13b5 : c9 41 __ CMP #$41
13b7 : d0 0d __ BNE $13c6 ; (nformf.s50 + 0)
.s47:
13b9 : a5 17 __ LDA P10 ; (f + 2)
13bb : c9 20 __ CMP #$20
13bd : d0 07 __ BNE $13c6 ; (nformf.s50 + 0)
.s48:
13bf : a5 16 __ LDA P9 ; (f + 1)
13c1 : d0 03 __ BNE $13c6 ; (nformf.s50 + 0)
.s49:
13c3 : 8a __ __ TXA
13c4 : f0 02 __ BEQ $13c8 ; (nformf.s45 + 0)
.s50:
13c6 : 90 27 __ BCC $13ef ; (nformf.s18 + 0)
.s45:
13c8 : a9 00 __ LDA #$00
13ca : 85 03 __ STA WORK + 0 
13cc : 85 04 __ STA WORK + 1 
13ce : a9 20 __ LDA #$20
13d0 : 85 05 __ STA WORK + 2 
13d2 : a9 41 __ LDA #$41
13d4 : 85 06 __ STA WORK + 3 
13d6 : 20 a1 16 JSR $16a1 ; (freg + 20)
13d9 : 20 87 18 JSR $1887 ; (crt_fdiv + 0)
13dc : a5 1c __ LDA ACCU + 1 
13de : 85 16 __ STA P9 ; (f + 1)
13e0 : a5 1d __ LDA ACCU + 2 
13e2 : 85 17 __ STA P10 ; (f + 2)
13e4 : a5 1e __ LDA ACCU + 3 
13e6 : 85 18 __ STA P11 ; (f + 3)
13e8 : a6 4d __ LDX T3 + 0 
13ea : ca __ __ DEX
13eb : 86 52 __ STX T6 + 0 
13ed : a6 1b __ LDX ACCU + 0 
.s18:
13ef : 38 __ __ SEC
13f0 : a5 51 __ LDA T5 + 0 
13f2 : e5 52 __ SBC T6 + 0 
13f4 : 85 4d __ STA T3 + 0 
13f6 : a9 00 __ LDA #$00
13f8 : e9 00 __ SBC #$00
13fa : 85 4e __ STA T3 + 1 
13fc : a9 14 __ LDA #$14
13fe : c5 51 __ CMP T5 + 0 
1400 : b0 02 __ BCS $1404 ; (nformf.s19 + 0)
.s44:
1402 : 85 51 __ STA T5 + 0 
.s19:
1404 : a5 4d __ LDA T3 + 0 
1406 : d0 08 __ BNE $1410 ; (nformf.s21 + 0)
.s20:
1408 : a9 30 __ LDA #$30
140a : a4 54 __ LDY T9 + 0 
140c : 91 13 __ STA (P6),y ; (str + 0)
140e : e6 54 __ INC T9 + 0 
.s21:
1410 : a9 00 __ LDA #$00
1412 : 85 56 __ STA T11 + 0 
1414 : c5 4d __ CMP T3 + 0 
1416 : f0 6f __ BEQ $1487 ; (nformf.l43 + 0)
.s23:
1418 : c9 07 __ CMP #$07
141a : 90 04 __ BCC $1420 ; (nformf.s24 + 0)
.l42:
141c : a9 30 __ LDA #$30
141e : b0 55 __ BCS $1475 ; (nformf.l25 + 0)
.s24:
1420 : 86 1b __ STX ACCU + 0 
1422 : 86 43 __ STX T0 + 0 
1424 : a5 16 __ LDA P9 ; (f + 1)
1426 : 85 1c __ STA ACCU + 1 
1428 : 85 44 __ STA T0 + 1 
142a : a5 17 __ LDA P10 ; (f + 2)
142c : 85 1d __ STA ACCU + 2 
142e : 85 45 __ STA T0 + 2 
1430 : a5 18 __ LDA P11 ; (f + 3)
1432 : 85 1e __ STA ACCU + 3 
1434 : 85 46 __ STA T0 + 3 
1436 : 20 21 1a JSR $1a21 ; (f32_to_i16 + 0)
1439 : a5 1b __ LDA ACCU + 0 
143b : 85 53 __ STA T7 + 0 
143d : 20 6d 1a JSR $1a6d ; (sint16_to_float + 0)
1440 : a2 43 __ LDX #$43
1442 : 20 91 16 JSR $1691 ; (freg + 4)
1445 : a5 1e __ LDA ACCU + 3 
1447 : 49 80 __ EOR #$80
1449 : 85 1e __ STA ACCU + 3 
144b : 20 d8 16 JSR $16d8 ; (faddsub + 6)
144e : a9 00 __ LDA #$00
1450 : 85 03 __ STA WORK + 0 
1452 : 85 04 __ STA WORK + 1 
1454 : a9 20 __ LDA #$20
1456 : 85 05 __ STA WORK + 2 
1458 : a9 41 __ LDA #$41
145a : 85 06 __ STA WORK + 3 
145c : 20 a1 16 JSR $16a1 ; (freg + 20)
145f : 20 bf 17 JSR $17bf ; (crt_fmul + 0)
1462 : a5 1c __ LDA ACCU + 1 
1464 : 85 16 __ STA P9 ; (f + 1)
1466 : a5 1d __ LDA ACCU + 2 
1468 : 85 17 __ STA P10 ; (f + 2)
146a : a5 1e __ LDA ACCU + 3 
146c : 85 18 __ STA P11 ; (f + 3)
146e : 18 __ __ CLC
146f : a5 53 __ LDA T7 + 0 
1471 : 69 30 __ ADC #$30
1473 : a6 1b __ LDX ACCU + 0 
.l25:
1475 : a4 54 __ LDY T9 + 0 
1477 : 91 13 __ STA (P6),y ; (str + 0)
1479 : e6 54 __ INC T9 + 0 
147b : e6 56 __ INC T11 + 0 
147d : a5 56 __ LDA T11 + 0 
147f : c5 51 __ CMP T5 + 0 
1481 : b0 14 __ BCS $1497 ; (nformf.s26 + 0)
.s22:
1483 : c5 4d __ CMP T3 + 0 
1485 : d0 91 __ BNE $1418 ; (nformf.s23 + 0)
.l43:
1487 : a9 2e __ LDA #$2e
1489 : a4 54 __ LDY T9 + 0 
148b : 91 13 __ STA (P6),y ; (str + 0)
148d : e6 54 __ INC T9 + 0 
148f : a5 56 __ LDA T11 + 0 
1491 : c9 07 __ CMP #$07
1493 : 90 8b __ BCC $1420 ; (nformf.s24 + 0)
1495 : b0 85 __ BCS $141c ; (nformf.l42 + 0)
.s26:
1497 : a5 55 __ LDA T10 + 0 
1499 : f0 66 __ BEQ $1501 ; (nformf.s27 + 0)
.s38:
149b : a0 03 __ LDY #$03
149d : b1 4b __ LDA (T2 + 0),y 
149f : 69 03 __ ADC #$03
14a1 : a4 54 __ LDY T9 + 0 
14a3 : 91 13 __ STA (P6),y ; (str + 0)
14a5 : c8 __ __ INY
14a6 : 84 54 __ STY T9 + 0 
14a8 : 24 50 __ BIT T4 + 1 
14aa : 30 06 __ BMI $14b2 ; (nformf.s41 + 0)
.s39:
14ac : a9 2b __ LDA #$2b
14ae : 91 13 __ STA (P6),y ; (str + 0)
14b0 : d0 11 __ BNE $14c3 ; (nformf.s40 + 0)
.s41:
14b2 : a9 2d __ LDA #$2d
14b4 : 91 13 __ STA (P6),y ; (str + 0)
14b6 : 38 __ __ SEC
14b7 : a9 00 __ LDA #$00
14b9 : e5 4f __ SBC T4 + 0 
14bb : 85 4f __ STA T4 + 0 
14bd : a9 00 __ LDA #$00
14bf : e5 50 __ SBC T4 + 1 
14c1 : 85 50 __ STA T4 + 1 
.s40:
14c3 : e6 54 __ INC T9 + 0 
14c5 : a5 4f __ LDA T4 + 0 
14c7 : 85 1b __ STA ACCU + 0 
14c9 : a5 50 __ LDA T4 + 1 
14cb : 85 1c __ STA ACCU + 1 
14cd : a9 0a __ LDA #$0a
14cf : 85 03 __ STA WORK + 0 
14d1 : a9 00 __ LDA #$00
14d3 : 85 04 __ STA WORK + 1 
14d5 : 20 35 19 JSR $1935 ; (divs16 + 0)
14d8 : 18 __ __ CLC
14d9 : a5 1b __ LDA ACCU + 0 
14db : 69 30 __ ADC #$30
14dd : a4 54 __ LDY T9 + 0 
14df : 91 13 __ STA (P6),y ; (str + 0)
14e1 : e6 54 __ INC T9 + 0 
14e3 : a5 4f __ LDA T4 + 0 
14e5 : 85 1b __ STA ACCU + 0 
14e7 : a5 50 __ LDA T4 + 1 
14e9 : 85 1c __ STA ACCU + 1 
14eb : a9 0a __ LDA #$0a
14ed : 85 03 __ STA WORK + 0 
14ef : a9 00 __ LDA #$00
14f1 : 85 04 __ STA WORK + 1 
14f3 : 20 f4 19 JSR $19f4 ; (mods16 + 0)
14f6 : 18 __ __ CLC
14f7 : a5 05 __ LDA WORK + 2 
14f9 : 69 30 __ ADC #$30
14fb : a4 54 __ LDY T9 + 0 
14fd : 91 13 __ STA (P6),y ; (str + 0)
14ff : e6 54 __ INC T9 + 0 
.s27:
1501 : a5 54 __ LDA T9 + 0 
1503 : a0 01 __ LDY #$01
1505 : d1 11 __ CMP (P4),y ; (si + 0)
1507 : b0 6d __ BCS $1576 ; (nformf.s3 + 0)
.s28:
1509 : a0 06 __ LDY #$06
150b : b1 11 __ LDA (P4),y ; (si + 0)
150d : f0 04 __ BEQ $1513 ; (nformf.s29 + 0)
.s110:
150f : a6 54 __ LDX T9 + 0 
1511 : 90 70 __ BCC $1583 ; (nformf.l36 + 0)
.s29:
1513 : a5 54 __ LDA T9 + 0 
1515 : f0 40 __ BEQ $1557 ; (nformf.s30 + 0)
.s35:
1517 : e9 00 __ SBC #$00
1519 : a8 __ __ TAY
151a : a9 00 __ LDA #$00
151c : e9 00 __ SBC #$00
151e : aa __ __ TAX
151f : 98 __ __ TYA
1520 : 18 __ __ CLC
1521 : 65 13 __ ADC P6 ; (str + 0)
1523 : 85 47 __ STA T1 + 0 
1525 : 8a __ __ TXA
1526 : 65 14 __ ADC P7 ; (str + 1)
1528 : 85 48 __ STA T1 + 1 
152a : a9 01 __ LDA #$01
152c : 85 4d __ STA T3 + 0 
152e : a6 54 __ LDX T9 + 0 
1530 : 38 __ __ SEC
.l111:
1531 : a0 01 __ LDY #$01
1533 : b1 11 __ LDA (P4),y ; (si + 0)
1535 : e5 4d __ SBC T3 + 0 
1537 : 85 4b __ STA T2 + 0 
1539 : a9 00 __ LDA #$00
153b : e5 4e __ SBC T3 + 1 
153d : 18 __ __ CLC
153e : 65 14 __ ADC P7 ; (str + 1)
1540 : 85 4c __ STA T2 + 1 
1542 : 88 __ __ DEY
1543 : b1 47 __ LDA (T1 + 0),y 
1545 : a4 13 __ LDY P6 ; (str + 0)
1547 : 91 4b __ STA (T2 + 0),y 
1549 : a5 47 __ LDA T1 + 0 
154b : d0 02 __ BNE $154f ; (nformf.s114 + 0)
.s113:
154d : c6 48 __ DEC T1 + 1 
.s114:
154f : c6 47 __ DEC T1 + 0 
1551 : e6 4d __ INC T3 + 0 
1553 : e4 4d __ CPX T3 + 0 
1555 : b0 da __ BCS $1531 ; (nformf.l111 + 0)
.s30:
1557 : a9 00 __ LDA #$00
1559 : 85 4d __ STA T3 + 0 
155b : 90 08 __ BCC $1565 ; (nformf.l31 + 0)
.s33:
155d : a9 20 __ LDA #$20
155f : a4 4d __ LDY T3 + 0 
1561 : 91 13 __ STA (P6),y ; (str + 0)
1563 : e6 4d __ INC T3 + 0 
.l31:
1565 : a0 01 __ LDY #$01
1567 : b1 11 __ LDA (P4),y ; (si + 0)
1569 : 38 __ __ SEC
156a : e5 54 __ SBC T9 + 0 
156c : 90 ef __ BCC $155d ; (nformf.s33 + 0)
.s34:
156e : c5 4d __ CMP T3 + 0 
1570 : 90 02 __ BCC $1574 ; (nformf.s32 + 0)
.s112:
1572 : d0 e9 __ BNE $155d ; (nformf.s33 + 0)
.s32:
1574 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
1576 : 85 1b __ STA ACCU + 0 
1578 : a2 03 __ LDX #$03
157a : bd e9 9f LDA $9fe9,x ; (nformf@stack + 0)
157d : 95 53 __ STA T7 + 0,x 
157f : ca __ __ DEX
1580 : 10 f8 __ BPL $157a ; (nformf.s3 + 4)
1582 : 60 __ __ RTS
.l36:
1583 : 8a __ __ TXA
1584 : a0 01 __ LDY #$01
1586 : d1 11 __ CMP (P4),y ; (si + 0)
1588 : b0 ea __ BCS $1574 ; (nformf.s32 + 0)
.s37:
158a : a8 __ __ TAY
158b : a9 20 __ LDA #$20
158d : 91 13 __ STA (P6),y ; (str + 0)
158f : e8 __ __ INX
1590 : 90 f1 __ BCC $1583 ; (nformf.l36 + 0)
.s53:
1592 : a5 51 __ LDA T5 + 0 
1594 : c9 07 __ CMP #$07
1596 : 90 14 __ BCC $15ac ; (nformf.s62 + 0)
.s54:
1598 : ad a5 1b LDA $1ba5 ; (fround5[0] + 24)
159b : 85 47 __ STA T1 + 0 
159d : ad a6 1b LDA $1ba6 ; (fround5[0] + 25)
15a0 : 85 48 __ STA T1 + 1 
15a2 : ad a7 1b LDA $1ba7 ; (fround5[0] + 26)
15a5 : 85 49 __ STA T1 + 2 
15a7 : ad a8 1b LDA $1ba8 ; (fround5[0] + 27)
15aa : b0 15 __ BCS $15c1 ; (nformf.s55 + 0)
.s62:
15ac : 0a __ __ ASL
15ad : 0a __ __ ASL
15ae : aa __ __ TAX
15af : bd 89 1b LDA $1b89,x ; (divmod32 + 213)
15b2 : 85 47 __ STA T1 + 0 
15b4 : bd 8a 1b LDA $1b8a,x ; (divmod32 + 214)
15b7 : 85 48 __ STA T1 + 1 
15b9 : bd 8b 1b LDA $1b8b,x ; (spentry + 0)
15bc : 85 49 __ STA T1 + 2 
15be : bd 8c 1b LDA $1b8c,x ; (giocharmap + 0)
.s55:
15c1 : 85 4a __ STA T1 + 3 
15c3 : a5 43 __ LDA T0 + 0 
15c5 : 85 1b __ STA ACCU + 0 
15c7 : a5 44 __ LDA T0 + 1 
15c9 : 85 1c __ STA ACCU + 1 
15cb : a5 45 __ LDA T0 + 2 
15cd : 85 1d __ STA ACCU + 2 
15cf : a5 46 __ LDA T0 + 3 
15d1 : 85 1e __ STA ACCU + 3 
15d3 : a2 47 __ LDX #$47
15d5 : 20 91 16 JSR $1691 ; (freg + 4)
15d8 : 20 d8 16 JSR $16d8 ; (faddsub + 6)
15db : a5 1c __ LDA ACCU + 1 
15dd : 85 16 __ STA P9 ; (f + 1)
15df : a5 1d __ LDA ACCU + 2 
15e1 : 85 17 __ STA P10 ; (f + 2)
15e3 : a6 1b __ LDX ACCU + 0 
15e5 : a5 1e __ LDA ACCU + 3 
15e7 : 85 18 __ STA P11 ; (f + 3)
15e9 : 10 03 __ BPL $15ee ; (nformf.s57 + 0)
15eb : 4c ef 13 JMP $13ef ; (nformf.s18 + 0)
.s57:
15ee : c9 41 __ CMP #$41
15f0 : d0 0d __ BNE $15ff ; (nformf.s61 + 0)
.s58:
15f2 : a5 17 __ LDA P10 ; (f + 2)
15f4 : c9 20 __ CMP #$20
15f6 : d0 07 __ BNE $15ff ; (nformf.s61 + 0)
.s59:
15f8 : a5 16 __ LDA P9 ; (f + 1)
15fa : d0 03 __ BNE $15ff ; (nformf.s61 + 0)
.s60:
15fc : 8a __ __ TXA
15fd : f0 02 __ BEQ $1601 ; (nformf.s56 + 0)
.s61:
15ff : 90 ea __ BCC $15eb ; (nformf.s55 + 42)
.s56:
1601 : a9 00 __ LDA #$00
1603 : 85 03 __ STA WORK + 0 
1605 : 85 04 __ STA WORK + 1 
1607 : a9 20 __ LDA #$20
1609 : 85 05 __ STA WORK + 2 
160b : a9 41 __ LDA #$41
160d : 85 06 __ STA WORK + 3 
160f : 20 a1 16 JSR $16a1 ; (freg + 20)
1612 : 20 87 18 JSR $1887 ; (crt_fdiv + 0)
1615 : a5 1c __ LDA ACCU + 1 
1617 : 85 16 __ STA P9 ; (f + 1)
1619 : a5 1d __ LDA ACCU + 2 
161b : 85 17 __ STA P10 ; (f + 2)
161d : a5 1e __ LDA ACCU + 3 
161f : 85 18 __ STA P11 ; (f + 3)
1621 : a6 1b __ LDX ACCU + 0 
1623 : e6 4f __ INC T4 + 0 
1625 : d0 c4 __ BNE $15eb ; (nformf.s55 + 42)
.s117:
1627 : e6 50 __ INC T4 + 1 
1629 : 4c ef 13 JMP $13ef ; (nformf.s18 + 0)
.s102:
162c : 86 43 __ STX T0 + 0 
162e : 85 47 __ STA T1 + 0 
1630 : a0 03 __ LDY #$03
1632 : b1 11 __ LDA (P4),y ; (si + 0)
1634 : 18 __ __ CLC
1635 : 69 08 __ ADC #$08
1637 : a4 43 __ LDY T0 + 0 
1639 : 91 13 __ STA (P6),y ; (str + 0)
163b : 18 __ __ CLC
163c : a0 03 __ LDY #$03
163e : b1 11 __ LDA (P4),y ; (si + 0)
1640 : 69 0d __ ADC #$0d
1642 : a4 43 __ LDY T0 + 0 
1644 : c8 __ __ INY
1645 : 91 13 __ STA (P6),y ; (str + 0)
1647 : a0 03 __ LDY #$03
1649 : b1 11 __ LDA (P4),y ; (si + 0)
164b : 18 __ __ CLC
164c : 69 05 __ ADC #$05
164e : a4 47 __ LDY T1 + 0 
1650 : 91 13 __ STA (P6),y ; (str + 0)
1652 : 18 __ __ CLC
1653 : a5 54 __ LDA T9 + 0 
1655 : 69 03 __ ADC #$03
1657 : 85 54 __ STA T9 + 0 
1659 : 4c 01 15 JMP $1501 ; (nformf.s27 + 0)
.s104:
165c : 20 6d 16 JSR $166d ; (isinf.s4 + 0)
165f : a2 01 __ LDX #$01
1661 : 86 54 __ STX T9 + 0 
1663 : a8 __ __ TAY
1664 : d0 03 __ BNE $1669 ; (nformf.s105 + 0)
1666 : 4c 76 11 JMP $1176 ; (nformf.s7 + 0)
.s105:
1669 : a9 03 __ LDA #$03
166b : d0 bf __ BNE $162c ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
166d : 06 0f __ ASL P2 ; (f + 2)
166f : a5 10 __ LDA P3 ; (f + 3)
1671 : 2a __ __ ROL
1672 : c9 ff __ CMP #$ff
1674 : d0 03 __ BNE $1679 ; (isinf.s6 + 0)
.s5:
1676 : a9 01 __ LDA #$01
1678 : 60 __ __ RTS
.s6:
1679 : a9 00 __ LDA #$00
.s3:
167b : 60 __ __ RTS
--------------------------------------------------------------------
167c : __ __ __ BYT 25 64 20 3a 20 25 64 0a 00                      : %d : %d..
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1685 : 85 0d __ STA P0 
1687 : a5 0d __ LDA P0 
1689 : 20 c3 ff JSR $ffc3 
.s3:
168c : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
168d : b1 19 __ LDA (IP + 0),y 
168f : c8 __ __ INY
1690 : aa __ __ TAX
1691 : b5 00 __ LDA $00,x 
1693 : 85 03 __ STA WORK + 0 
1695 : b5 01 __ LDA $01,x 
1697 : 85 04 __ STA WORK + 1 
1699 : b5 02 __ LDA $02,x 
169b : 85 05 __ STA WORK + 2 
169d : b5 03 __ LDA WORK + 0,x 
169f : 85 06 __ STA WORK + 3 
16a1 : a5 05 __ LDA WORK + 2 
16a3 : 0a __ __ ASL
16a4 : a5 06 __ LDA WORK + 3 
16a6 : 2a __ __ ROL
16a7 : 85 08 __ STA WORK + 5 
16a9 : f0 06 __ BEQ $16b1 ; (freg + 36)
16ab : a5 05 __ LDA WORK + 2 
16ad : 09 80 __ ORA #$80
16af : 85 05 __ STA WORK + 2 
16b1 : a5 1d __ LDA ACCU + 2 
16b3 : 0a __ __ ASL
16b4 : a5 1e __ LDA ACCU + 3 
16b6 : 2a __ __ ROL
16b7 : 85 07 __ STA WORK + 4 
16b9 : f0 06 __ BEQ $16c1 ; (freg + 52)
16bb : a5 1d __ LDA ACCU + 2 
16bd : 09 80 __ ORA #$80
16bf : 85 1d __ STA ACCU + 2 
16c1 : 60 __ __ RTS
16c2 : 06 1e __ ASL ACCU + 3 
16c4 : a5 07 __ LDA WORK + 4 
16c6 : 6a __ __ ROR
16c7 : 85 1e __ STA ACCU + 3 
16c9 : b0 06 __ BCS $16d1 ; (freg + 68)
16cb : a5 1d __ LDA ACCU + 2 
16cd : 29 7f __ AND #$7f
16cf : 85 1d __ STA ACCU + 2 
16d1 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
16d2 : a5 06 __ LDA WORK + 3 
16d4 : 49 80 __ EOR #$80
16d6 : 85 06 __ STA WORK + 3 
16d8 : a9 ff __ LDA #$ff
16da : c5 07 __ CMP WORK + 4 
16dc : f0 04 __ BEQ $16e2 ; (faddsub + 16)
16de : c5 08 __ CMP WORK + 5 
16e0 : d0 11 __ BNE $16f3 ; (faddsub + 33)
16e2 : a5 1e __ LDA ACCU + 3 
16e4 : 09 7f __ ORA #$7f
16e6 : 85 1e __ STA ACCU + 3 
16e8 : a9 80 __ LDA #$80
16ea : 85 1d __ STA ACCU + 2 
16ec : a9 00 __ LDA #$00
16ee : 85 1b __ STA ACCU + 0 
16f0 : 85 1c __ STA ACCU + 1 
16f2 : 60 __ __ RTS
16f3 : 38 __ __ SEC
16f4 : a5 07 __ LDA WORK + 4 
16f6 : e5 08 __ SBC WORK + 5 
16f8 : f0 38 __ BEQ $1732 ; (faddsub + 96)
16fa : aa __ __ TAX
16fb : b0 25 __ BCS $1722 ; (faddsub + 80)
16fd : e0 e9 __ CPX #$e9
16ff : b0 0e __ BCS $170f ; (faddsub + 61)
1701 : a5 08 __ LDA WORK + 5 
1703 : 85 07 __ STA WORK + 4 
1705 : a9 00 __ LDA #$00
1707 : 85 1b __ STA ACCU + 0 
1709 : 85 1c __ STA ACCU + 1 
170b : 85 1d __ STA ACCU + 2 
170d : f0 23 __ BEQ $1732 ; (faddsub + 96)
170f : a5 1d __ LDA ACCU + 2 
1711 : 4a __ __ LSR
1712 : 66 1c __ ROR ACCU + 1 
1714 : 66 1b __ ROR ACCU + 0 
1716 : e8 __ __ INX
1717 : d0 f8 __ BNE $1711 ; (faddsub + 63)
1719 : 85 1d __ STA ACCU + 2 
171b : a5 08 __ LDA WORK + 5 
171d : 85 07 __ STA WORK + 4 
171f : 4c 32 17 JMP $1732 ; (faddsub + 96)
1722 : e0 18 __ CPX #$18
1724 : b0 33 __ BCS $1759 ; (faddsub + 135)
1726 : a5 05 __ LDA WORK + 2 
1728 : 4a __ __ LSR
1729 : 66 04 __ ROR WORK + 1 
172b : 66 03 __ ROR WORK + 0 
172d : ca __ __ DEX
172e : d0 f8 __ BNE $1728 ; (faddsub + 86)
1730 : 85 05 __ STA WORK + 2 
1732 : a5 1e __ LDA ACCU + 3 
1734 : 29 80 __ AND #$80
1736 : 85 1e __ STA ACCU + 3 
1738 : 45 06 __ EOR WORK + 3 
173a : 30 31 __ BMI $176d ; (faddsub + 155)
173c : 18 __ __ CLC
173d : a5 1b __ LDA ACCU + 0 
173f : 65 03 __ ADC WORK + 0 
1741 : 85 1b __ STA ACCU + 0 
1743 : a5 1c __ LDA ACCU + 1 
1745 : 65 04 __ ADC WORK + 1 
1747 : 85 1c __ STA ACCU + 1 
1749 : a5 1d __ LDA ACCU + 2 
174b : 65 05 __ ADC WORK + 2 
174d : 85 1d __ STA ACCU + 2 
174f : 90 08 __ BCC $1759 ; (faddsub + 135)
1751 : 66 1d __ ROR ACCU + 2 
1753 : 66 1c __ ROR ACCU + 1 
1755 : 66 1b __ ROR ACCU + 0 
1757 : e6 07 __ INC WORK + 4 
1759 : a5 07 __ LDA WORK + 4 
175b : c9 ff __ CMP #$ff
175d : f0 83 __ BEQ $16e2 ; (faddsub + 16)
175f : 4a __ __ LSR
1760 : 05 1e __ ORA ACCU + 3 
1762 : 85 1e __ STA ACCU + 3 
1764 : b0 06 __ BCS $176c ; (faddsub + 154)
1766 : a5 1d __ LDA ACCU + 2 
1768 : 29 7f __ AND #$7f
176a : 85 1d __ STA ACCU + 2 
176c : 60 __ __ RTS
176d : 38 __ __ SEC
176e : a5 1b __ LDA ACCU + 0 
1770 : e5 03 __ SBC WORK + 0 
1772 : 85 1b __ STA ACCU + 0 
1774 : a5 1c __ LDA ACCU + 1 
1776 : e5 04 __ SBC WORK + 1 
1778 : 85 1c __ STA ACCU + 1 
177a : a5 1d __ LDA ACCU + 2 
177c : e5 05 __ SBC WORK + 2 
177e : 85 1d __ STA ACCU + 2 
1780 : b0 19 __ BCS $179b ; (faddsub + 201)
1782 : 38 __ __ SEC
1783 : a9 00 __ LDA #$00
1785 : e5 1b __ SBC ACCU + 0 
1787 : 85 1b __ STA ACCU + 0 
1789 : a9 00 __ LDA #$00
178b : e5 1c __ SBC ACCU + 1 
178d : 85 1c __ STA ACCU + 1 
178f : a9 00 __ LDA #$00
1791 : e5 1d __ SBC ACCU + 2 
1793 : 85 1d __ STA ACCU + 2 
1795 : a5 1e __ LDA ACCU + 3 
1797 : 49 80 __ EOR #$80
1799 : 85 1e __ STA ACCU + 3 
179b : a5 1d __ LDA ACCU + 2 
179d : 30 ba __ BMI $1759 ; (faddsub + 135)
179f : 05 1c __ ORA ACCU + 1 
17a1 : 05 1b __ ORA ACCU + 0 
17a3 : f0 0f __ BEQ $17b4 ; (faddsub + 226)
17a5 : c6 07 __ DEC WORK + 4 
17a7 : f0 0b __ BEQ $17b4 ; (faddsub + 226)
17a9 : 06 1b __ ASL ACCU + 0 
17ab : 26 1c __ ROL ACCU + 1 
17ad : 26 1d __ ROL ACCU + 2 
17af : 10 f4 __ BPL $17a5 ; (faddsub + 211)
17b1 : 4c 59 17 JMP $1759 ; (faddsub + 135)
17b4 : a9 00 __ LDA #$00
17b6 : 85 1b __ STA ACCU + 0 
17b8 : 85 1c __ STA ACCU + 1 
17ba : 85 1d __ STA ACCU + 2 
17bc : 85 1e __ STA ACCU + 3 
17be : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
17bf : a5 1b __ LDA ACCU + 0 
17c1 : 05 1c __ ORA ACCU + 1 
17c3 : 05 1d __ ORA ACCU + 2 
17c5 : f0 0e __ BEQ $17d5 ; (crt_fmul + 22)
17c7 : a5 03 __ LDA WORK + 0 
17c9 : 05 04 __ ORA WORK + 1 
17cb : 05 05 __ ORA WORK + 2 
17cd : d0 09 __ BNE $17d8 ; (crt_fmul + 25)
17cf : 85 1b __ STA ACCU + 0 
17d1 : 85 1c __ STA ACCU + 1 
17d3 : 85 1d __ STA ACCU + 2 
17d5 : 85 1e __ STA ACCU + 3 
17d7 : 60 __ __ RTS
17d8 : a5 1e __ LDA ACCU + 3 
17da : 45 06 __ EOR WORK + 3 
17dc : 29 80 __ AND #$80
17de : 85 1e __ STA ACCU + 3 
17e0 : a9 ff __ LDA #$ff
17e2 : c5 07 __ CMP WORK + 4 
17e4 : f0 42 __ BEQ $1828 ; (crt_fmul + 105)
17e6 : c5 08 __ CMP WORK + 5 
17e8 : f0 3e __ BEQ $1828 ; (crt_fmul + 105)
17ea : a9 00 __ LDA #$00
17ec : 85 09 __ STA WORK + 6 
17ee : 85 0a __ STA WORK + 7 
17f0 : 85 0b __ STA WORK + 8 
17f2 : a4 1b __ LDY ACCU + 0 
17f4 : a5 03 __ LDA WORK + 0 
17f6 : d0 06 __ BNE $17fe ; (crt_fmul + 63)
17f8 : a5 04 __ LDA WORK + 1 
17fa : f0 0a __ BEQ $1806 ; (crt_fmul + 71)
17fc : d0 05 __ BNE $1803 ; (crt_fmul + 68)
17fe : 20 59 18 JSR $1859 ; (crt_fmul8 + 0)
1801 : a5 04 __ LDA WORK + 1 
1803 : 20 59 18 JSR $1859 ; (crt_fmul8 + 0)
1806 : a5 05 __ LDA WORK + 2 
1808 : 20 59 18 JSR $1859 ; (crt_fmul8 + 0)
180b : 38 __ __ SEC
180c : a5 0b __ LDA WORK + 8 
180e : 30 06 __ BMI $1816 ; (crt_fmul + 87)
1810 : 06 09 __ ASL WORK + 6 
1812 : 26 0a __ ROL WORK + 7 
1814 : 2a __ __ ROL
1815 : 18 __ __ CLC
1816 : 29 7f __ AND #$7f
1818 : 85 0b __ STA WORK + 8 
181a : a5 07 __ LDA WORK + 4 
181c : 65 08 __ ADC WORK + 5 
181e : 90 19 __ BCC $1839 ; (crt_fmul + 122)
1820 : e9 7f __ SBC #$7f
1822 : b0 04 __ BCS $1828 ; (crt_fmul + 105)
1824 : c9 ff __ CMP #$ff
1826 : d0 15 __ BNE $183d ; (crt_fmul + 126)
1828 : a5 1e __ LDA ACCU + 3 
182a : 09 7f __ ORA #$7f
182c : 85 1e __ STA ACCU + 3 
182e : a9 80 __ LDA #$80
1830 : 85 1d __ STA ACCU + 2 
1832 : a9 00 __ LDA #$00
1834 : 85 1b __ STA ACCU + 0 
1836 : 85 1c __ STA ACCU + 1 
1838 : 60 __ __ RTS
1839 : e9 7e __ SBC #$7e
183b : 90 15 __ BCC $1852 ; (crt_fmul + 147)
183d : 4a __ __ LSR
183e : 05 1e __ ORA ACCU + 3 
1840 : 85 1e __ STA ACCU + 3 
1842 : a9 00 __ LDA #$00
1844 : 6a __ __ ROR
1845 : 05 0b __ ORA WORK + 8 
1847 : 85 1d __ STA ACCU + 2 
1849 : a5 0a __ LDA WORK + 7 
184b : 85 1c __ STA ACCU + 1 
184d : a5 09 __ LDA WORK + 6 
184f : 85 1b __ STA ACCU + 0 
1851 : 60 __ __ RTS
1852 : a9 00 __ LDA #$00
1854 : 85 1e __ STA ACCU + 3 
1856 : f0 d8 __ BEQ $1830 ; (crt_fmul + 113)
1858 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1859 : 38 __ __ SEC
185a : 6a __ __ ROR
185b : 90 1e __ BCC $187b ; (crt_fmul8 + 34)
185d : aa __ __ TAX
185e : 18 __ __ CLC
185f : 98 __ __ TYA
1860 : 65 09 __ ADC WORK + 6 
1862 : 85 09 __ STA WORK + 6 
1864 : a5 0a __ LDA WORK + 7 
1866 : 65 1c __ ADC ACCU + 1 
1868 : 85 0a __ STA WORK + 7 
186a : a5 0b __ LDA WORK + 8 
186c : 65 1d __ ADC ACCU + 2 
186e : 6a __ __ ROR
186f : 85 0b __ STA WORK + 8 
1871 : 8a __ __ TXA
1872 : 66 0a __ ROR WORK + 7 
1874 : 66 09 __ ROR WORK + 6 
1876 : 4a __ __ LSR
1877 : f0 0d __ BEQ $1886 ; (crt_fmul8 + 45)
1879 : b0 e2 __ BCS $185d ; (crt_fmul8 + 4)
187b : 66 0b __ ROR WORK + 8 
187d : 66 0a __ ROR WORK + 7 
187f : 66 09 __ ROR WORK + 6 
1881 : 4a __ __ LSR
1882 : 90 f7 __ BCC $187b ; (crt_fmul8 + 34)
1884 : d0 d7 __ BNE $185d ; (crt_fmul8 + 4)
1886 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1887 : a5 1b __ LDA ACCU + 0 
1889 : 05 1c __ ORA ACCU + 1 
188b : 05 1d __ ORA ACCU + 2 
188d : d0 03 __ BNE $1892 ; (crt_fdiv + 11)
188f : 85 1e __ STA ACCU + 3 
1891 : 60 __ __ RTS
1892 : a5 1e __ LDA ACCU + 3 
1894 : 45 06 __ EOR WORK + 3 
1896 : 29 80 __ AND #$80
1898 : 85 1e __ STA ACCU + 3 
189a : a5 08 __ LDA WORK + 5 
189c : f0 62 __ BEQ $1900 ; (crt_fdiv + 121)
189e : a5 07 __ LDA WORK + 4 
18a0 : c9 ff __ CMP #$ff
18a2 : f0 5c __ BEQ $1900 ; (crt_fdiv + 121)
18a4 : a9 00 __ LDA #$00
18a6 : 85 09 __ STA WORK + 6 
18a8 : 85 0a __ STA WORK + 7 
18aa : 85 0b __ STA WORK + 8 
18ac : a2 18 __ LDX #$18
18ae : a5 1b __ LDA ACCU + 0 
18b0 : c5 03 __ CMP WORK + 0 
18b2 : a5 1c __ LDA ACCU + 1 
18b4 : e5 04 __ SBC WORK + 1 
18b6 : a5 1d __ LDA ACCU + 2 
18b8 : e5 05 __ SBC WORK + 2 
18ba : 90 13 __ BCC $18cf ; (crt_fdiv + 72)
18bc : a5 1b __ LDA ACCU + 0 
18be : e5 03 __ SBC WORK + 0 
18c0 : 85 1b __ STA ACCU + 0 
18c2 : a5 1c __ LDA ACCU + 1 
18c4 : e5 04 __ SBC WORK + 1 
18c6 : 85 1c __ STA ACCU + 1 
18c8 : a5 1d __ LDA ACCU + 2 
18ca : e5 05 __ SBC WORK + 2 
18cc : 85 1d __ STA ACCU + 2 
18ce : 38 __ __ SEC
18cf : 26 09 __ ROL WORK + 6 
18d1 : 26 0a __ ROL WORK + 7 
18d3 : 26 0b __ ROL WORK + 8 
18d5 : ca __ __ DEX
18d6 : f0 0a __ BEQ $18e2 ; (crt_fdiv + 91)
18d8 : 06 1b __ ASL ACCU + 0 
18da : 26 1c __ ROL ACCU + 1 
18dc : 26 1d __ ROL ACCU + 2 
18de : b0 dc __ BCS $18bc ; (crt_fdiv + 53)
18e0 : 90 cc __ BCC $18ae ; (crt_fdiv + 39)
18e2 : 38 __ __ SEC
18e3 : a5 0b __ LDA WORK + 8 
18e5 : 30 06 __ BMI $18ed ; (crt_fdiv + 102)
18e7 : 06 09 __ ASL WORK + 6 
18e9 : 26 0a __ ROL WORK + 7 
18eb : 2a __ __ ROL
18ec : 18 __ __ CLC
18ed : 29 7f __ AND #$7f
18ef : 85 0b __ STA WORK + 8 
18f1 : a5 07 __ LDA WORK + 4 
18f3 : e5 08 __ SBC WORK + 5 
18f5 : 90 1a __ BCC $1911 ; (crt_fdiv + 138)
18f7 : 18 __ __ CLC
18f8 : 69 7f __ ADC #$7f
18fa : b0 04 __ BCS $1900 ; (crt_fdiv + 121)
18fc : c9 ff __ CMP #$ff
18fe : d0 15 __ BNE $1915 ; (crt_fdiv + 142)
1900 : a5 1e __ LDA ACCU + 3 
1902 : 09 7f __ ORA #$7f
1904 : 85 1e __ STA ACCU + 3 
1906 : a9 80 __ LDA #$80
1908 : 85 1d __ STA ACCU + 2 
190a : a9 00 __ LDA #$00
190c : 85 1c __ STA ACCU + 1 
190e : 85 1b __ STA ACCU + 0 
1910 : 60 __ __ RTS
1911 : 69 7f __ ADC #$7f
1913 : 90 15 __ BCC $192a ; (crt_fdiv + 163)
1915 : 4a __ __ LSR
1916 : 05 1e __ ORA ACCU + 3 
1918 : 85 1e __ STA ACCU + 3 
191a : a9 00 __ LDA #$00
191c : 6a __ __ ROR
191d : 05 0b __ ORA WORK + 8 
191f : 85 1d __ STA ACCU + 2 
1921 : a5 0a __ LDA WORK + 7 
1923 : 85 1c __ STA ACCU + 1 
1925 : a5 09 __ LDA WORK + 6 
1927 : 85 1b __ STA ACCU + 0 
1929 : 60 __ __ RTS
192a : a9 00 __ LDA #$00
192c : 85 1e __ STA ACCU + 3 
192e : 85 1d __ STA ACCU + 2 
1930 : 85 1c __ STA ACCU + 1 
1932 : 85 1b __ STA ACCU + 0 
1934 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1935 : 24 1c __ BIT ACCU + 1 
1937 : 10 0d __ BPL $1946 ; (divs16 + 17)
1939 : 20 53 19 JSR $1953 ; (negaccu + 0)
193c : 24 04 __ BIT WORK + 1 
193e : 10 0d __ BPL $194d ; (divs16 + 24)
1940 : 20 61 19 JSR $1961 ; (negtmp + 0)
1943 : 4c 6f 19 JMP $196f ; (divmod + 0)
1946 : 24 04 __ BIT WORK + 1 
1948 : 10 f9 __ BPL $1943 ; (divs16 + 14)
194a : 20 61 19 JSR $1961 ; (negtmp + 0)
194d : 20 6f 19 JSR $196f ; (divmod + 0)
1950 : 4c 53 19 JMP $1953 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1953 : 38 __ __ SEC
1954 : a9 00 __ LDA #$00
1956 : e5 1b __ SBC ACCU + 0 
1958 : 85 1b __ STA ACCU + 0 
195a : a9 00 __ LDA #$00
195c : e5 1c __ SBC ACCU + 1 
195e : 85 1c __ STA ACCU + 1 
1960 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
1961 : 38 __ __ SEC
1962 : a9 00 __ LDA #$00
1964 : e5 03 __ SBC WORK + 0 
1966 : 85 03 __ STA WORK + 0 
1968 : a9 00 __ LDA #$00
196a : e5 04 __ SBC WORK + 1 
196c : 85 04 __ STA WORK + 1 
196e : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
196f : a5 1c __ LDA ACCU + 1 
1971 : d0 31 __ BNE $19a4 ; (divmod + 53)
1973 : a5 04 __ LDA WORK + 1 
1975 : d0 1e __ BNE $1995 ; (divmod + 38)
1977 : 85 06 __ STA WORK + 3 
1979 : a2 04 __ LDX #$04
197b : 06 1b __ ASL ACCU + 0 
197d : 2a __ __ ROL
197e : c5 03 __ CMP WORK + 0 
1980 : 90 02 __ BCC $1984 ; (divmod + 21)
1982 : e5 03 __ SBC WORK + 0 
1984 : 26 1b __ ROL ACCU + 0 
1986 : 2a __ __ ROL
1987 : c5 03 __ CMP WORK + 0 
1989 : 90 02 __ BCC $198d ; (divmod + 30)
198b : e5 03 __ SBC WORK + 0 
198d : 26 1b __ ROL ACCU + 0 
198f : ca __ __ DEX
1990 : d0 eb __ BNE $197d ; (divmod + 14)
1992 : 85 05 __ STA WORK + 2 
1994 : 60 __ __ RTS
1995 : a5 1b __ LDA ACCU + 0 
1997 : 85 05 __ STA WORK + 2 
1999 : a5 1c __ LDA ACCU + 1 
199b : 85 06 __ STA WORK + 3 
199d : a9 00 __ LDA #$00
199f : 85 1b __ STA ACCU + 0 
19a1 : 85 1c __ STA ACCU + 1 
19a3 : 60 __ __ RTS
19a4 : a5 04 __ LDA WORK + 1 
19a6 : d0 1f __ BNE $19c7 ; (divmod + 88)
19a8 : a5 03 __ LDA WORK + 0 
19aa : 30 1b __ BMI $19c7 ; (divmod + 88)
19ac : a9 00 __ LDA #$00
19ae : 85 06 __ STA WORK + 3 
19b0 : a2 10 __ LDX #$10
19b2 : 06 1b __ ASL ACCU + 0 
19b4 : 26 1c __ ROL ACCU + 1 
19b6 : 2a __ __ ROL
19b7 : c5 03 __ CMP WORK + 0 
19b9 : 90 02 __ BCC $19bd ; (divmod + 78)
19bb : e5 03 __ SBC WORK + 0 
19bd : 26 1b __ ROL ACCU + 0 
19bf : 26 1c __ ROL ACCU + 1 
19c1 : ca __ __ DEX
19c2 : d0 f2 __ BNE $19b6 ; (divmod + 71)
19c4 : 85 05 __ STA WORK + 2 
19c6 : 60 __ __ RTS
19c7 : a9 00 __ LDA #$00
19c9 : 85 05 __ STA WORK + 2 
19cb : 85 06 __ STA WORK + 3 
19cd : 84 02 __ STY $02 
19cf : a0 10 __ LDY #$10
19d1 : 18 __ __ CLC
19d2 : 26 1b __ ROL ACCU + 0 
19d4 : 26 1c __ ROL ACCU + 1 
19d6 : 26 05 __ ROL WORK + 2 
19d8 : 26 06 __ ROL WORK + 3 
19da : 38 __ __ SEC
19db : a5 05 __ LDA WORK + 2 
19dd : e5 03 __ SBC WORK + 0 
19df : aa __ __ TAX
19e0 : a5 06 __ LDA WORK + 3 
19e2 : e5 04 __ SBC WORK + 1 
19e4 : 90 04 __ BCC $19ea ; (divmod + 123)
19e6 : 86 05 __ STX WORK + 2 
19e8 : 85 06 __ STA WORK + 3 
19ea : 88 __ __ DEY
19eb : d0 e5 __ BNE $19d2 ; (divmod + 99)
19ed : 26 1b __ ROL ACCU + 0 
19ef : 26 1c __ ROL ACCU + 1 
19f1 : a4 02 __ LDY $02 
19f3 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
19f4 : 24 1c __ BIT ACCU + 1 
19f6 : 10 10 __ BPL $1a08 ; (mods16 + 20)
19f8 : 20 53 19 JSR $1953 ; (negaccu + 0)
19fb : 24 04 __ BIT WORK + 1 
19fd : 10 03 __ BPL $1a02 ; (mods16 + 14)
19ff : 20 61 19 JSR $1961 ; (negtmp + 0)
1a02 : 20 6f 19 JSR $196f ; (divmod + 0)
1a05 : 4c 13 1a JMP $1a13 ; (negtmpb + 0)
1a08 : 24 04 __ BIT WORK + 1 
1a0a : 10 03 __ BPL $1a0f ; (mods16 + 27)
1a0c : 20 61 19 JSR $1961 ; (negtmp + 0)
1a0f : 4c 6f 19 JMP $196f ; (divmod + 0)
1a12 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
1a13 : 38 __ __ SEC
1a14 : a9 00 __ LDA #$00
1a16 : e5 05 __ SBC WORK + 2 
1a18 : 85 05 __ STA WORK + 2 
1a1a : a9 00 __ LDA #$00
1a1c : e5 06 __ SBC WORK + 3 
1a1e : 85 06 __ STA WORK + 3 
1a20 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1a21 : 20 b1 16 JSR $16b1 ; (freg + 36)
1a24 : a5 07 __ LDA WORK + 4 
1a26 : c9 7f __ CMP #$7f
1a28 : b0 07 __ BCS $1a31 ; (f32_to_i16 + 16)
1a2a : a9 00 __ LDA #$00
1a2c : 85 1b __ STA ACCU + 0 
1a2e : 85 1c __ STA ACCU + 1 
1a30 : 60 __ __ RTS
1a31 : e9 8e __ SBC #$8e
1a33 : 90 16 __ BCC $1a4b ; (f32_to_i16 + 42)
1a35 : 24 1e __ BIT ACCU + 3 
1a37 : 30 09 __ BMI $1a42 ; (f32_to_i16 + 33)
1a39 : a9 ff __ LDA #$ff
1a3b : 85 1b __ STA ACCU + 0 
1a3d : a9 7f __ LDA #$7f
1a3f : 85 1c __ STA ACCU + 1 
1a41 : 60 __ __ RTS
1a42 : a9 00 __ LDA #$00
1a44 : 85 1b __ STA ACCU + 0 
1a46 : a9 80 __ LDA #$80
1a48 : 85 1c __ STA ACCU + 1 
1a4a : 60 __ __ RTS
1a4b : aa __ __ TAX
1a4c : a5 1c __ LDA ACCU + 1 
1a4e : 46 1d __ LSR ACCU + 2 
1a50 : 6a __ __ ROR
1a51 : e8 __ __ INX
1a52 : d0 fa __ BNE $1a4e ; (f32_to_i16 + 45)
1a54 : 24 1e __ BIT ACCU + 3 
1a56 : 10 0e __ BPL $1a66 ; (f32_to_i16 + 69)
1a58 : 38 __ __ SEC
1a59 : 49 ff __ EOR #$ff
1a5b : 69 00 __ ADC #$00
1a5d : 85 1b __ STA ACCU + 0 
1a5f : a9 00 __ LDA #$00
1a61 : e5 1d __ SBC ACCU + 2 
1a63 : 85 1c __ STA ACCU + 1 
1a65 : 60 __ __ RTS
1a66 : 85 1b __ STA ACCU + 0 
1a68 : a5 1d __ LDA ACCU + 2 
1a6a : 85 1c __ STA ACCU + 1 
1a6c : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1a6d : 24 1c __ BIT ACCU + 1 
1a6f : 30 03 __ BMI $1a74 ; (sint16_to_float + 7)
1a71 : 4c 8b 1a JMP $1a8b ; (uint16_to_float + 0)
1a74 : 38 __ __ SEC
1a75 : a9 00 __ LDA #$00
1a77 : e5 1b __ SBC ACCU + 0 
1a79 : 85 1b __ STA ACCU + 0 
1a7b : a9 00 __ LDA #$00
1a7d : e5 1c __ SBC ACCU + 1 
1a7f : 85 1c __ STA ACCU + 1 
1a81 : 20 8b 1a JSR $1a8b ; (uint16_to_float + 0)
1a84 : a5 1e __ LDA ACCU + 3 
1a86 : 09 80 __ ORA #$80
1a88 : 85 1e __ STA ACCU + 3 
1a8a : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1a8b : a5 1b __ LDA ACCU + 0 
1a8d : 05 1c __ ORA ACCU + 1 
1a8f : d0 05 __ BNE $1a96 ; (uint16_to_float + 11)
1a91 : 85 1d __ STA ACCU + 2 
1a93 : 85 1e __ STA ACCU + 3 
1a95 : 60 __ __ RTS
1a96 : a2 8e __ LDX #$8e
1a98 : a5 1c __ LDA ACCU + 1 
1a9a : 30 06 __ BMI $1aa2 ; (uint16_to_float + 23)
1a9c : ca __ __ DEX
1a9d : 06 1b __ ASL ACCU + 0 
1a9f : 2a __ __ ROL
1aa0 : 10 fa __ BPL $1a9c ; (uint16_to_float + 17)
1aa2 : 0a __ __ ASL
1aa3 : 85 1d __ STA ACCU + 2 
1aa5 : a5 1b __ LDA ACCU + 0 
1aa7 : 85 1c __ STA ACCU + 1 
1aa9 : 8a __ __ TXA
1aaa : 4a __ __ LSR
1aab : 85 1e __ STA ACCU + 3 
1aad : a9 00 __ LDA #$00
1aaf : 85 1b __ STA ACCU + 0 
1ab1 : 66 1d __ ROR ACCU + 2 
1ab3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1ab4 : 84 02 __ STY $02 
1ab6 : a0 20 __ LDY #$20
1ab8 : a9 00 __ LDA #$00
1aba : 85 07 __ STA WORK + 4 
1abc : 85 08 __ STA WORK + 5 
1abe : 85 09 __ STA WORK + 6 
1ac0 : 85 0a __ STA WORK + 7 
1ac2 : a5 05 __ LDA WORK + 2 
1ac4 : 05 06 __ ORA WORK + 3 
1ac6 : d0 78 __ BNE $1b40 ; (divmod32 + 140)
1ac8 : a5 04 __ LDA WORK + 1 
1aca : d0 27 __ BNE $1af3 ; (divmod32 + 63)
1acc : 18 __ __ CLC
1acd : 26 1b __ ROL ACCU + 0 
1acf : 26 1c __ ROL ACCU + 1 
1ad1 : 26 1d __ ROL ACCU + 2 
1ad3 : 26 1e __ ROL ACCU + 3 
1ad5 : 2a __ __ ROL
1ad6 : 90 05 __ BCC $1add ; (divmod32 + 41)
1ad8 : e5 03 __ SBC WORK + 0 
1ada : 38 __ __ SEC
1adb : b0 06 __ BCS $1ae3 ; (divmod32 + 47)
1add : c5 03 __ CMP WORK + 0 
1adf : 90 02 __ BCC $1ae3 ; (divmod32 + 47)
1ae1 : e5 03 __ SBC WORK + 0 
1ae3 : 88 __ __ DEY
1ae4 : d0 e7 __ BNE $1acd ; (divmod32 + 25)
1ae6 : 85 07 __ STA WORK + 4 
1ae8 : 26 1b __ ROL ACCU + 0 
1aea : 26 1c __ ROL ACCU + 1 
1aec : 26 1d __ ROL ACCU + 2 
1aee : 26 1e __ ROL ACCU + 3 
1af0 : a4 02 __ LDY $02 
1af2 : 60 __ __ RTS
1af3 : a5 1e __ LDA ACCU + 3 
1af5 : d0 10 __ BNE $1b07 ; (divmod32 + 83)
1af7 : a6 1d __ LDX ACCU + 2 
1af9 : 86 1e __ STX ACCU + 3 
1afb : a6 1c __ LDX ACCU + 1 
1afd : 86 1d __ STX ACCU + 2 
1aff : a6 1b __ LDX ACCU + 0 
1b01 : 86 1c __ STX ACCU + 1 
1b03 : 85 1b __ STA ACCU + 0 
1b05 : a0 18 __ LDY #$18
1b07 : 18 __ __ CLC
1b08 : 26 1b __ ROL ACCU + 0 
1b0a : 26 1c __ ROL ACCU + 1 
1b0c : 26 1d __ ROL ACCU + 2 
1b0e : 26 1e __ ROL ACCU + 3 
1b10 : 26 07 __ ROL WORK + 4 
1b12 : 26 08 __ ROL WORK + 5 
1b14 : 90 0c __ BCC $1b22 ; (divmod32 + 110)
1b16 : a5 07 __ LDA WORK + 4 
1b18 : e5 03 __ SBC WORK + 0 
1b1a : aa __ __ TAX
1b1b : a5 08 __ LDA WORK + 5 
1b1d : e5 04 __ SBC WORK + 1 
1b1f : 38 __ __ SEC
1b20 : b0 0c __ BCS $1b2e ; (divmod32 + 122)
1b22 : 38 __ __ SEC
1b23 : a5 07 __ LDA WORK + 4 
1b25 : e5 03 __ SBC WORK + 0 
1b27 : aa __ __ TAX
1b28 : a5 08 __ LDA WORK + 5 
1b2a : e5 04 __ SBC WORK + 1 
1b2c : 90 04 __ BCC $1b32 ; (divmod32 + 126)
1b2e : 86 07 __ STX WORK + 4 
1b30 : 85 08 __ STA WORK + 5 
1b32 : 88 __ __ DEY
1b33 : d0 d3 __ BNE $1b08 ; (divmod32 + 84)
1b35 : 26 1b __ ROL ACCU + 0 
1b37 : 26 1c __ ROL ACCU + 1 
1b39 : 26 1d __ ROL ACCU + 2 
1b3b : 26 1e __ ROL ACCU + 3 
1b3d : a4 02 __ LDY $02 
1b3f : 60 __ __ RTS
1b40 : a0 10 __ LDY #$10
1b42 : a5 1e __ LDA ACCU + 3 
1b44 : 85 08 __ STA WORK + 5 
1b46 : a5 1d __ LDA ACCU + 2 
1b48 : 85 07 __ STA WORK + 4 
1b4a : a9 00 __ LDA #$00
1b4c : 85 1d __ STA ACCU + 2 
1b4e : 85 1e __ STA ACCU + 3 
1b50 : 18 __ __ CLC
1b51 : 26 1b __ ROL ACCU + 0 
1b53 : 26 1c __ ROL ACCU + 1 
1b55 : 26 07 __ ROL WORK + 4 
1b57 : 26 08 __ ROL WORK + 5 
1b59 : 26 09 __ ROL WORK + 6 
1b5b : 26 0a __ ROL WORK + 7 
1b5d : a5 07 __ LDA WORK + 4 
1b5f : c5 03 __ CMP WORK + 0 
1b61 : a5 08 __ LDA WORK + 5 
1b63 : e5 04 __ SBC WORK + 1 
1b65 : a5 09 __ LDA WORK + 6 
1b67 : e5 05 __ SBC WORK + 2 
1b69 : aa __ __ TAX
1b6a : a5 0a __ LDA WORK + 7 
1b6c : e5 06 __ SBC WORK + 3 
1b6e : 90 11 __ BCC $1b81 ; (divmod32 + 205)
1b70 : 86 09 __ STX WORK + 6 
1b72 : 85 0a __ STA WORK + 7 
1b74 : a5 07 __ LDA WORK + 4 
1b76 : e5 03 __ SBC WORK + 0 
1b78 : 85 07 __ STA WORK + 4 
1b7a : a5 08 __ LDA WORK + 5 
1b7c : e5 04 __ SBC WORK + 1 
1b7e : 85 08 __ STA WORK + 5 
1b80 : 38 __ __ SEC
1b81 : 88 __ __ DEY
1b82 : d0 cd __ BNE $1b51 ; (divmod32 + 157)
1b84 : 26 1b __ ROL ACCU + 0 
1b86 : 26 1c __ ROL ACCU + 1 
1b88 : a4 02 __ LDY $02 
1b8a : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1b8b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1b8c : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1b8d : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1b9d : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
krnio_pstatus:
1ba9 : __ __ __ BSS	16
