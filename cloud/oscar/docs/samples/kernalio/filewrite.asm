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
080e : 8e 92 09 STX $0992 ; (spentry + 0)
0811 : a2 09 __ LDX #$09
0813 : a0 af __ LDY #$af
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 09 __ CPX #$09
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 bf __ CPY #$bf
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
;  17, "/home/honza/projects/c64/projects/oscar64/samples/kernalio/filewrite.c"
.s4:
0880 : a9 d4 __ LDA #$d4
0882 : 85 0d __ STA P0 
0884 : a9 08 __ LDA #$08
0886 : 85 0e __ STA P1 
0888 : 20 be 08 JSR $08be ; (krnio_setnam.s4 + 0)
088b : a9 02 __ LDA #$02
088d : 85 0d __ STA P0 
088f : 85 0f __ STA P2 
0891 : a9 09 __ LDA #$09
0893 : 85 0e __ STA P1 
0895 : 20 e5 08 JSR $08e5 ; (krnio_open.s4 + 0)
0898 : aa __ __ TAX
0899 : f0 1e __ BEQ $08b9 ; (main.s5 + 0)
.s6:
089b : a9 02 __ LDA #$02
089d : 85 0e __ STA P1 
089f : a9 09 __ LDA #$09
08a1 : 85 10 __ STA P3 
08a3 : a9 1c __ LDA #$1c
08a5 : 85 11 __ STA P4 
08a7 : a9 00 __ LDA #$00
08a9 : 85 12 __ STA P5 
08ab : a9 93 __ LDA #$93
08ad : 85 0f __ STA P2 
08af : 20 13 09 JSR $0913 ; (krnio_write.s4 + 0)
08b2 : a9 02 __ LDA #$02
08b4 : 20 8a 09 JSR $098a ; (krnio_close.s4 + 0)
08b7 : a9 00 __ LDA #$00
.s5:
08b9 : 85 1b __ STA ACCU + 0 
08bb : 85 1c __ STA ACCU + 1 
.s3:
08bd : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
08be : a5 0d __ LDA P0 
08c0 : 05 0e __ ORA P1 
08c2 : f0 08 __ BEQ $08cc ; (krnio_setnam.s4 + 14)
08c4 : a0 ff __ LDY #$ff
08c6 : c8 __ __ INY
08c7 : b1 0d __ LDA (P0),y 
08c9 : d0 fb __ BNE $08c6 ; (krnio_setnam.s4 + 8)
08cb : 98 __ __ TYA
08cc : a6 0d __ LDX P0 
08ce : a4 0e __ LDY P1 
08d0 : 20 bd ff JSR $ffbd 
.s3:
08d3 : 60 __ __ RTS
--------------------------------------------------------------------
08d4 : __ __ __ BYT 40 30 3a 48 49 47 48 53 43 4f 52 45 2c 50 2c 57 : @0:HIGHSCORE,P,W
08e4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
08e5 : a9 00 __ LDA #$00
08e7 : a6 0d __ LDX P0 ; (fnum + 0)
08e9 : 9d af 09 STA $09af,x ; (krnio_pstatus[0] + 0)
08ec : a9 00 __ LDA #$00
08ee : 85 1b __ STA ACCU + 0 
08f0 : 85 1c __ STA ACCU + 1 
08f2 : a5 0d __ LDA P0 ; (fnum + 0)
08f4 : a6 0e __ LDX P1 
08f6 : a4 0f __ LDY P2 
08f8 : 20 ba ff JSR $ffba 
08fb : 20 c0 ff JSR $ffc0 
08fe : 90 08 __ BCC $0908 ; (krnio_open.s4 + 35)
0900 : a5 0d __ LDA P0 ; (fnum + 0)
0902 : 20 c3 ff JSR $ffc3 
0905 : 4c 0c 09 JMP $090c ; (krnio_open.s4 + 39)
0908 : a9 01 __ LDA #$01
090a : 85 1b __ STA ACCU + 0 
090c : a5 1b __ LDA ACCU + 0 
090e : f0 02 __ BEQ $0912 ; (krnio_open.s3 + 0)
.s5:
0910 : a9 01 __ LDA #$01
.s3:
0912 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_write: ; krnio_write(u8,const u8*,i16)->i16
;  82, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0913 : a5 0e __ LDA P1 ; (fnum + 0)
0915 : 20 61 09 JSR $0961 ; (krnio_chkout.s4 + 0)
0918 : aa __ __ TAX
0919 : d0 07 __ BNE $0922 ; (krnio_write.s6 + 0)
.s5:
091b : a9 ff __ LDA #$ff
091d : 85 1b __ STA ACCU + 0 
.s3:
091f : 85 1c __ STA ACCU + 1 
0921 : 60 __ __ RTS
.s6:
0922 : a5 12 __ LDA P5 ; (num + 1)
0924 : 30 2f __ BMI $0955 ; (krnio_write.s7 + 0)
.s10:
0926 : 05 11 __ ORA P4 ; (num + 0)
0928 : f0 2b __ BEQ $0955 ; (krnio_write.s7 + 0)
.s8:
092a : a5 11 __ LDA P4 ; (num + 0)
092c : 85 43 __ STA T1 + 0 
092e : a5 12 __ LDA P5 ; (num + 1)
0930 : 85 44 __ STA T1 + 1 
0932 : a5 0f __ LDA P2 ; (data + 0)
0934 : 85 45 __ STA T2 + 0 
0936 : a5 10 __ LDA P3 ; (data + 1)
0938 : 85 46 __ STA T2 + 1 
.l9:
093a : a0 00 __ LDY #$00
093c : b1 45 __ LDA (T2 + 0),y 
093e : 20 76 09 JSR $0976 ; (krnio_chrout.s4 + 0)
0941 : e6 45 __ INC T2 + 0 
0943 : d0 02 __ BNE $0947 ; (krnio_write.s15 + 0)
.s14:
0945 : e6 46 __ INC T2 + 1 
.s15:
0947 : a5 43 __ LDA T1 + 0 
0949 : d0 02 __ BNE $094d ; (krnio_write.s12 + 0)
.s11:
094b : c6 44 __ DEC T1 + 1 
.s12:
094d : c6 43 __ DEC T1 + 0 
094f : d0 e9 __ BNE $093a ; (krnio_write.l9 + 0)
.s13:
0951 : a5 44 __ LDA T1 + 1 
0953 : d0 e5 __ BNE $093a ; (krnio_write.l9 + 0)
.s7:
0955 : 20 86 09 JSR $0986 ; (krnio_clrchn.s4 + 0)
0958 : a5 11 __ LDA P4 ; (num + 0)
095a : 85 1b __ STA ACCU + 0 
095c : a5 12 __ LDA P5 ; (num + 1)
095e : 4c 1f 09 JMP $091f ; (krnio_write.s3 + 0)
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
;  51, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0961 : 85 0d __ STA P0 
0963 : a6 0d __ LDX P0 
0965 : 20 c9 ff JSR $ffc9 
0968 : a9 00 __ LDA #$00
096a : 2a __ __ ROL
096b : 49 01 __ EOR #$01
096d : 85 1b __ STA ACCU + 0 
096f : a5 1b __ LDA ACCU + 0 
0971 : f0 02 __ BEQ $0975 ; (krnio_chkout.s3 + 0)
.s5:
0973 : a9 01 __ LDA #$01
.s3:
0975 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->bool
;  63, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0976 : 85 0d __ STA P0 
0978 : a5 0d __ LDA P0 
097a : 20 d2 ff JSR $ffd2 
097d : 85 1b __ STA ACCU + 0 
097f : a5 1b __ LDA ACCU + 0 
0981 : f0 02 __ BEQ $0985 ; (krnio_chrout.s3 + 0)
.s5:
0983 : a9 01 __ LDA #$01
.s3:
0985 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0986 : 20 cc ff JSR $ffcc 
.s3:
0989 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
098a : 85 0d __ STA P0 
098c : a5 0d __ LDA P0 
098e : 20 c3 ff JSR $ffc3 
.s3:
0991 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0992 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
score:
0993 : __ __ __ BYT 41 41 41 00 00 10 27 42 42 42 00 00 28 23 43 43 : AAA...'BBB..(#CC
09a3 : __ __ __ BYT 43 00 00 40 1f 44 44 44 00 00 a0 0f             : C..@.DDD....
--------------------------------------------------------------------
krnio_pstatus:
09af : __ __ __ BSS	16
