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
080e : 8e 57 09 STX $0957 ; (spentry + 0)
0811 : a2 09 __ LDX #$09
0813 : a0 58 __ LDY #$58
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
082a : c0 68 __ CPY #$68
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
;   4, "/home/honza/projects/c64/projects/oscar64/samples/kernalio/charwrite.c"
.s4:
0880 : a9 d0 __ LDA #$d0
0882 : 85 0d __ STA P0 
0884 : a9 08 __ LDA #$08
0886 : 85 0e __ STA P1 
0888 : 20 ba 08 JSR $08ba ; (krnio_setnam.s4 + 0)
088b : a9 02 __ LDA #$02
088d : 85 0d __ STA P0 
088f : 85 0f __ STA P2 
0891 : a9 09 __ LDA #$09
0893 : 85 0e __ STA P1 
0895 : 20 dd 08 JSR $08dd ; (krnio_open.s4 + 0)
0898 : aa __ __ TAX
0899 : f0 1a __ BEQ $08b5 ; (main.s3 + 0)
.s5:
089b : a9 00 __ LDA #$00
089d : 85 43 __ STA T1 + 0 
.l6:
089f : a5 43 __ LDA T1 + 0 
08a1 : 85 0f __ STA P2 
08a3 : a9 02 __ LDA #$02
08a5 : 85 0e __ STA P1 
08a7 : 20 0b 09 JSR $090b ; (krnio_putch.s4 + 0)
08aa : e6 43 __ INC T1 + 0 
08ac : 10 f1 __ BPL $089f ; (main.l6 + 0)
.s7:
08ae : a9 02 __ LDA #$02
08b0 : 20 4f 09 JSR $094f ; (krnio_close.s4 + 0)
08b3 : a9 00 __ LDA #$00
.s3:
08b5 : 85 1b __ STA ACCU + 0 
08b7 : 85 1c __ STA ACCU + 1 
08b9 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
08ba : a5 0d __ LDA P0 
08bc : 05 0e __ ORA P1 
08be : f0 08 __ BEQ $08c8 ; (krnio_setnam.s4 + 14)
08c0 : a0 ff __ LDY #$ff
08c2 : c8 __ __ INY
08c3 : b1 0d __ LDA (P0),y 
08c5 : d0 fb __ BNE $08c2 ; (krnio_setnam.s4 + 8)
08c7 : 98 __ __ TYA
08c8 : a6 0d __ LDX P0 
08ca : a4 0e __ LDY P1 
08cc : 20 bd ff JSR $ffbd 
.s3:
08cf : 60 __ __ RTS
--------------------------------------------------------------------
08d0 : __ __ __ BYT 40 30 3a 43 48 41 52 53 2c 50 2c 57 00          : @0:CHARS,P,W.
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
08dd : a9 00 __ LDA #$00
08df : a6 0d __ LDX P0 ; (fnum + 0)
08e1 : 9d 58 09 STA $0958,x ; (krnio_pstatus[0] + 0)
08e4 : a9 00 __ LDA #$00
08e6 : 85 1b __ STA ACCU + 0 
08e8 : 85 1c __ STA ACCU + 1 
08ea : a5 0d __ LDA P0 ; (fnum + 0)
08ec : a6 0e __ LDX P1 
08ee : a4 0f __ LDY P2 
08f0 : 20 ba ff JSR $ffba 
08f3 : 20 c0 ff JSR $ffc0 
08f6 : 90 08 __ BCC $0900 ; (krnio_open.s4 + 35)
08f8 : a5 0d __ LDA P0 ; (fnum + 0)
08fa : 20 c3 ff JSR $ffc3 
08fd : 4c 04 09 JMP $0904 ; (krnio_open.s4 + 39)
0900 : a9 01 __ LDA #$01
0902 : 85 1b __ STA ACCU + 0 
0904 : a5 1b __ LDA ACCU + 0 
0906 : f0 02 __ BEQ $090a ; (krnio_open.s3 + 0)
.s5:
0908 : a9 01 __ LDA #$01
.s3:
090a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_putch: ; krnio_putch(u8,u8)->i16
;  78, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
090b : a5 0e __ LDA P1 ; (fnum + 0)
090d : 20 26 09 JSR $0926 ; (krnio_chkout.s4 + 0)
0910 : aa __ __ TAX
0911 : f0 0c __ BEQ $091f ; (krnio_putch.s5 + 0)
.s6:
0913 : a5 0f __ LDA P2 ; (ch + 0)
0915 : 20 3b 09 JSR $093b ; (krnio_chrout.s4 + 0)
0918 : 20 4b 09 JSR $094b ; (krnio_clrchn.s4 + 0)
091b : a9 00 __ LDA #$00
091d : f0 02 __ BEQ $0921 ; (krnio_putch.s3 + 0)
.s5:
091f : a9 ff __ LDA #$ff
.s3:
0921 : 85 1b __ STA ACCU + 0 
0923 : 85 1c __ STA ACCU + 1 
0925 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
;  51, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0926 : 85 0d __ STA P0 
0928 : a6 0d __ LDX P0 
092a : 20 c9 ff JSR $ffc9 
092d : a9 00 __ LDA #$00
092f : 2a __ __ ROL
0930 : 49 01 __ EOR #$01
0932 : 85 1b __ STA ACCU + 0 
0934 : a5 1b __ LDA ACCU + 0 
0936 : f0 02 __ BEQ $093a ; (krnio_chkout.s3 + 0)
.s5:
0938 : a9 01 __ LDA #$01
.s3:
093a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->bool
;  63, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
093b : 85 0d __ STA P0 
093d : a5 0d __ LDA P0 
093f : 20 d2 ff JSR $ffd2 
0942 : 85 1b __ STA ACCU + 0 
0944 : a5 1b __ LDA ACCU + 0 
0946 : f0 02 __ BEQ $094a ; (krnio_chrout.s3 + 0)
.s5:
0948 : a9 01 __ LDA #$01
.s3:
094a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
094b : 20 cc ff JSR $ffcc 
.s3:
094e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
094f : 85 0d __ STA P0 
0951 : a5 0d __ LDA P0 
0953 : 20 c3 ff JSR $ffc3 
.s3:
0956 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0957 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_pstatus:
0958 : __ __ __ BSS	16
