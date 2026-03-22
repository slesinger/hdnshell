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
080e : 8e cc 1b STX $1bcc ; (spentry + 0)
0811 : a2 1b __ LDX #$1b
0813 : a0 ea __ LDY #$ea
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1c __ CPX #$1c
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 1c __ CPY #$1c
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 96 __ LDA #$96
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
;  12, "/home/honza/projects/c64/projects/oscar64/samples/kernalio/fileread.c"
.s1:
0880 : a5 53 __ LDA T1 + 0 
0882 : 8d 98 9f STA $9f98 ; (main@stack + 0)
0885 : a5 54 __ LDA T2 + 0 
0887 : 8d 99 9f STA $9f99 ; (main@stack + 1)
.s4:
088a : a9 27 __ LDA #$27
088c : 85 0d __ STA P0 
088e : a9 09 __ LDA #$09
0890 : 85 0e __ STA P1 
0892 : 20 11 09 JSR $0911 ; (krnio_setnam.s4 + 0)
0895 : a9 02 __ LDA #$02
0897 : 85 0d __ STA P0 
0899 : 85 0f __ STA P2 
089b : a9 09 __ LDA #$09
089d : 85 0e __ STA P1 
089f : 20 35 09 JSR $0935 ; (krnio_open.s4 + 0)
08a2 : a0 00 __ LDY #$00
08a4 : 84 53 __ STY T1 + 0 
08a6 : aa __ __ TAX
08a7 : f0 1a __ BEQ $08c3 ; (main.s5 + 0)
.s7:
08a9 : 84 12 __ STY P5 
08ab : a9 02 __ LDA #$02
08ad : 85 0e __ STA P1 
08af : a9 1c __ LDA #$1c
08b1 : 85 10 __ STA P3 
08b3 : a9 1c __ LDA #$1c
08b5 : 85 11 __ STA P4 
08b7 : a9 00 __ LDA #$00
08b9 : 85 0f __ STA P2 
08bb : 20 63 09 JSR $0963 ; (krnio_read.s4 + 0)
08be : a9 02 __ LDA #$02
08c0 : 20 06 0a JSR $0a06 ; (krnio_close.s4 + 0)
.s5:
08c3 : a9 00 __ LDA #$00
08c5 : 85 54 __ STA T2 + 0 
08c7 : 18 __ __ CLC
.l8:
08c8 : a9 00 __ LDA #$00
08ca : 65 54 __ ADC T2 + 0 
08cc : 8d fc 9f STA $9ffc ; (sstack + 10)
08cf : a9 c5 __ LDA #$c5
08d1 : 8d fa 9f STA $9ffa ; (sstack + 8)
08d4 : a9 16 __ LDA #$16
08d6 : 8d fb 9f STA $9ffb ; (sstack + 9)
08d9 : a9 1c __ LDA #$1c
08db : 69 00 __ ADC #$00
08dd : 8d fd 9f STA $9ffd ; (sstack + 11)
08e0 : a6 54 __ LDX T2 + 0 
08e2 : bd 05 1c LDA $1c05,x ; (score[0].score + 0)
08e5 : 8d fe 9f STA $9ffe ; (sstack + 12)
08e8 : bd 06 1c LDA $1c06,x ; (score[0].score + 1)
08eb : 8d ff 9f STA $9fff ; (sstack + 13)
08ee : 20 0e 0a JSR $0a0e ; (printf.s4 + 0)
08f1 : 18 __ __ CLC
08f2 : a5 54 __ LDA T2 + 0 
08f4 : 69 07 __ ADC #$07
08f6 : 85 54 __ STA T2 + 0 
08f8 : e6 53 __ INC T1 + 0 
08fa : a5 53 __ LDA T1 + 0 
08fc : c9 04 __ CMP #$04
08fe : 90 c8 __ BCC $08c8 ; (main.l8 + 0)
.s6:
0900 : a9 00 __ LDA #$00
0902 : 85 1b __ STA ACCU + 0 
0904 : 85 1c __ STA ACCU + 1 
.s3:
0906 : ad 98 9f LDA $9f98 ; (main@stack + 0)
0909 : 85 53 __ STA T1 + 0 
090b : ad 99 9f LDA $9f99 ; (main@stack + 1)
090e : 85 54 __ STA T2 + 0 
0910 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0911 : a5 0d __ LDA P0 
0913 : 05 0e __ ORA P1 
0915 : f0 08 __ BEQ $091f ; (krnio_setnam.s4 + 14)
0917 : a0 ff __ LDY #$ff
0919 : c8 __ __ INY
091a : b1 0d __ LDA (P0),y 
091c : d0 fb __ BNE $0919 ; (krnio_setnam.s4 + 8)
091e : 98 __ __ TYA
091f : a6 0d __ LDX P0 
0921 : a4 0e __ LDY P1 
0923 : 20 bd ff JSR $ffbd 
.s3:
0926 : 60 __ __ RTS
--------------------------------------------------------------------
0927 : __ __ __ BYT 48 49 47 48 53 43 4f 52 45 2c 50 2c 52 00       : HIGHSCORE,P,R.
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0935 : a9 00 __ LDA #$00
0937 : a6 0d __ LDX P0 ; (fnum + 0)
0939 : 9d ea 1b STA $1bea,x ; (krnio_pstatus[0] + 0)
093c : a9 00 __ LDA #$00
093e : 85 1b __ STA ACCU + 0 
0940 : 85 1c __ STA ACCU + 1 
0942 : a5 0d __ LDA P0 ; (fnum + 0)
0944 : a6 0e __ LDX P1 
0946 : a4 0f __ LDY P2 
0948 : 20 ba ff JSR $ffba 
094b : 20 c0 ff JSR $ffc0 
094e : 90 08 __ BCC $0958 ; (krnio_open.s4 + 35)
0950 : a5 0d __ LDA P0 ; (fnum + 0)
0952 : 20 c3 ff JSR $ffc3 
0955 : 4c 5c 09 JMP $095c ; (krnio_open.s4 + 39)
0958 : a9 01 __ LDA #$01
095a : 85 1b __ STA ACCU + 0 
095c : a5 1b __ LDA ACCU + 0 
095e : f0 02 __ BEQ $0962 ; (krnio_open.s3 + 0)
.s5:
0960 : a9 01 __ LDA #$01
.s3:
0962 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
;  91, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0963 : a6 0e __ LDX P1 ; (fnum + 0)
0965 : bd ea 1b LDA $1bea,x ; (krnio_pstatus[0] + 0)
0968 : c9 40 __ CMP #$40
096a : d0 07 __ BNE $0973 ; (krnio_read.s5 + 0)
.s15:
096c : a9 00 __ LDA #$00
.s16:
096e : 85 1b __ STA ACCU + 0 
.s3:
0970 : 85 1c __ STA ACCU + 1 
0972 : 60 __ __ RTS
.s5:
0973 : 86 44 __ STX T2 + 0 
0975 : 8a __ __ TXA
0976 : 20 d9 09 JSR $09d9 ; (krnio_chkin.s4 + 0)
0979 : aa __ __ TAX
097a : d0 04 __ BNE $0980 ; (krnio_read.s7 + 0)
.s6:
097c : a9 ff __ LDA #$ff
097e : d0 ee __ BNE $096e ; (krnio_read.s16 + 0)
.s7:
0980 : a9 00 __ LDA #$00
0982 : 85 45 __ STA T3 + 0 
0984 : 85 46 __ STA T3 + 1 
0986 : a5 12 __ LDA P5 ; (num + 1)
0988 : 30 43 __ BMI $09cd ; (krnio_read.s8 + 0)
.s14:
098a : 05 11 __ ORA P4 ; (num + 0)
098c : f0 3f __ BEQ $09cd ; (krnio_read.s8 + 0)
.l9:
098e : 20 ee 09 JSR $09ee ; (krnio_chrin.s4 + 0)
0991 : 85 43 __ STA T0 + 0 
0993 : 20 f6 09 JSR $09f6 ; (krnio_status.s4 + 0)
0996 : 85 1d __ STA ACCU + 2 
0998 : a6 44 __ LDX T2 + 0 
099a : 9d ea 1b STA $1bea,x ; (krnio_pstatus[0] + 0)
099d : aa __ __ TAX
099e : f0 04 __ BEQ $09a4 ; (krnio_read.s10 + 0)
.s13:
09a0 : c9 40 __ CMP #$40
09a2 : d0 29 __ BNE $09cd ; (krnio_read.s8 + 0)
.s10:
09a4 : a5 45 __ LDA T3 + 0 
09a6 : 85 1b __ STA ACCU + 0 
09a8 : 18 __ __ CLC
09a9 : a5 10 __ LDA P3 ; (data + 1)
09ab : 65 46 __ ADC T3 + 1 
09ad : 85 1c __ STA ACCU + 1 
09af : a5 43 __ LDA T0 + 0 
09b1 : a4 0f __ LDY P2 ; (data + 0)
09b3 : 91 1b __ STA (ACCU + 0),y 
09b5 : e6 45 __ INC T3 + 0 
09b7 : d0 02 __ BNE $09bb ; (krnio_read.s18 + 0)
.s17:
09b9 : e6 46 __ INC T3 + 1 
.s18:
09bb : a5 1d __ LDA ACCU + 2 
09bd : d0 0e __ BNE $09cd ; (krnio_read.s8 + 0)
.s11:
09bf : a5 46 __ LDA T3 + 1 
09c1 : c5 12 __ CMP P5 ; (num + 1)
09c3 : 90 c9 __ BCC $098e ; (krnio_read.l9 + 0)
.s19:
09c5 : d0 06 __ BNE $09cd ; (krnio_read.s8 + 0)
.s12:
09c7 : a5 45 __ LDA T3 + 0 
09c9 : c5 11 __ CMP P4 ; (num + 0)
09cb : 90 c1 __ BCC $098e ; (krnio_read.l9 + 0)
.s8:
09cd : 20 02 0a JSR $0a02 ; (krnio_clrchn.s4 + 0)
09d0 : a5 45 __ LDA T3 + 0 
09d2 : 85 1b __ STA ACCU + 0 
09d4 : a5 46 __ LDA T3 + 1 
09d6 : 4c 70 09 JMP $0970 ; (krnio_read.s3 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
09d9 : 85 0d __ STA P0 
09db : a6 0d __ LDX P0 
09dd : 20 c6 ff JSR $ffc6 
09e0 : a9 00 __ LDA #$00
09e2 : 2a __ __ ROL
09e3 : 49 01 __ EOR #$01
09e5 : 85 1b __ STA ACCU + 0 
09e7 : a5 1b __ LDA ACCU + 0 
09e9 : f0 02 __ BEQ $09ed ; (krnio_chkin.s3 + 0)
.s5:
09eb : a9 01 __ LDA #$01
.s3:
09ed : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
09ee : 20 cf ff JSR $ffcf 
09f1 : 85 1b __ STA ACCU + 0 
.s3:
09f3 : a5 1b __ LDA ACCU + 0 
09f5 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
09f6 : 20 b7 ff JSR $ffb7 
09f9 : 85 1b __ STA ACCU + 0 
09fb : a9 00 __ LDA #$00
09fd : 85 1c __ STA ACCU + 1 
.s3:
09ff : a5 1b __ LDA ACCU + 0 
0a01 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a02 : 20 cc ff JSR $ffcc 
.s3:
0a05 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a06 : 85 0d __ STA P0 
0a08 : a5 0d __ LDA P0 
0a0a : 20 c3 ff JSR $ffc3 
.s3:
0a0d : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
0a0e : a9 01 __ LDA #$01
0a10 : 8d f9 9f STA $9ff9 ; (sstack + 7)
0a13 : a9 9e __ LDA #$9e
0a15 : 8d f3 9f STA $9ff3 ; (sstack + 1)
0a18 : a9 9f __ LDA #$9f
0a1a : 8d f4 9f STA $9ff4 ; (sstack + 2)
0a1d : ad fa 9f LDA $9ffa ; (sstack + 8)
0a20 : 8d f5 9f STA $9ff5 ; (sstack + 3)
0a23 : ad fb 9f LDA $9ffb ; (sstack + 9)
0a26 : 8d f6 9f STA $9ff6 ; (sstack + 4)
0a29 : a9 fc __ LDA #$fc
0a2b : 8d f7 9f STA $9ff7 ; (sstack + 5)
0a2e : a9 9f __ LDA #$9f
0a30 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0a33 : 4c 36 0a JMP $0a36 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
0a36 : a2 09 __ LDX #$09
0a38 : b5 53 __ LDA T1 + 0,x 
0a3a : 9d d0 9f STA $9fd0,x ; (sformat@stack + 0)
0a3d : ca __ __ DEX
0a3e : 10 f8 __ BPL $0a38 ; (sformat.s1 + 2)
.s4:
0a40 : ad f5 9f LDA $9ff5 ; (sstack + 3)
0a43 : 85 55 __ STA T3 + 0 
0a45 : a9 00 __ LDA #$00
0a47 : 85 5b __ STA T6 + 0 
0a49 : ad f6 9f LDA $9ff6 ; (sstack + 4)
0a4c : 85 56 __ STA T3 + 1 
0a4e : ad f3 9f LDA $9ff3 ; (sstack + 1)
0a51 : 85 57 __ STA T4 + 0 
0a53 : ad f4 9f LDA $9ff4 ; (sstack + 2)
0a56 : 85 58 __ STA T4 + 1 
.l5:
0a58 : a0 00 __ LDY #$00
0a5a : b1 55 __ LDA (T3 + 0),y 
0a5c : d0 36 __ BNE $0a94 ; (sformat.s10 + 0)
.s6:
0a5e : a4 5b __ LDY T6 + 0 
0a60 : 91 57 __ STA (T4 + 0),y 
0a62 : 98 __ __ TYA
0a63 : f0 28 __ BEQ $0a8d ; (sformat.s95 + 0)
.s7:
0a65 : ad f9 9f LDA $9ff9 ; (sstack + 7)
0a68 : d0 18 __ BNE $0a82 ; (sformat.s9 + 0)
.s8:
0a6a : 98 __ __ TYA
0a6b : 18 __ __ CLC
0a6c : 65 57 __ ADC T4 + 0 
0a6e : aa __ __ TAX
0a6f : a5 58 __ LDA T4 + 1 
0a71 : 69 00 __ ADC #$00
.s3:
0a73 : 86 1b __ STX ACCU + 0 ; (buff + 1)
0a75 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0a77 : a2 09 __ LDX #$09
0a79 : bd d0 9f LDA $9fd0,x ; (sformat@stack + 0)
0a7c : 95 53 __ STA T1 + 0,x 
0a7e : ca __ __ DEX
0a7f : 10 f8 __ BPL $0a79 ; (sformat.s3 + 6)
0a81 : 60 __ __ RTS
.s9:
0a82 : a5 57 __ LDA T4 + 0 
0a84 : 85 0e __ STA P1 
0a86 : a5 58 __ LDA T4 + 1 
0a88 : 85 0f __ STA P2 
0a8a : 20 77 0e JSR $0e77 ; (puts.l4 + 0)
.s95:
0a8d : a5 58 __ LDA T4 + 1 
0a8f : a6 57 __ LDX T4 + 0 
0a91 : 4c 73 0a JMP $0a73 ; (sformat.s3 + 0)
.s10:
0a94 : c9 25 __ CMP #$25
0a96 : f0 3e __ BEQ $0ad6 ; (sformat.s15 + 0)
.s11:
0a98 : a4 5b __ LDY T6 + 0 
0a9a : 91 57 __ STA (T4 + 0),y 
0a9c : e6 55 __ INC T3 + 0 
0a9e : d0 02 __ BNE $0aa2 ; (sformat.s117 + 0)
.s116:
0aa0 : e6 56 __ INC T3 + 1 
.s117:
0aa2 : c8 __ __ INY
0aa3 : 84 5b __ STY T6 + 0 
0aa5 : 98 __ __ TYA
0aa6 : c0 28 __ CPY #$28
0aa8 : 90 ae __ BCC $0a58 ; (sformat.l5 + 0)
.s12:
0aaa : 85 43 __ STA T0 + 0 
0aac : a9 00 __ LDA #$00
0aae : 85 5b __ STA T6 + 0 
0ab0 : ad f9 9f LDA $9ff9 ; (sstack + 7)
0ab3 : f0 14 __ BEQ $0ac9 ; (sformat.s13 + 0)
.s14:
0ab5 : a5 57 __ LDA T4 + 0 
0ab7 : 85 0e __ STA P1 
0ab9 : a5 58 __ LDA T4 + 1 
0abb : 85 0f __ STA P2 
0abd : a9 00 __ LDA #$00
0abf : a4 43 __ LDY T0 + 0 
0ac1 : 91 0e __ STA (P1),y 
0ac3 : 20 77 0e JSR $0e77 ; (puts.l4 + 0)
0ac6 : 4c 58 0a JMP $0a58 ; (sformat.l5 + 0)
.s13:
0ac9 : 18 __ __ CLC
0aca : a5 57 __ LDA T4 + 0 
0acc : 65 43 __ ADC T0 + 0 
0ace : 85 57 __ STA T4 + 0 
0ad0 : 90 86 __ BCC $0a58 ; (sformat.l5 + 0)
.s118:
0ad2 : e6 58 __ INC T4 + 1 
0ad4 : b0 82 __ BCS $0a58 ; (sformat.l5 + 0)
.s15:
0ad6 : a5 5b __ LDA T6 + 0 
0ad8 : f0 27 __ BEQ $0b01 ; (sformat.s16 + 0)
.s89:
0ada : 84 5b __ STY T6 + 0 
0adc : 85 43 __ STA T0 + 0 
0ade : ad f9 9f LDA $9ff9 ; (sstack + 7)
0ae1 : f0 13 __ BEQ $0af6 ; (sformat.s90 + 0)
.s91:
0ae3 : a5 57 __ LDA T4 + 0 
0ae5 : 85 0e __ STA P1 
0ae7 : a5 58 __ LDA T4 + 1 
0ae9 : 85 0f __ STA P2 
0aeb : 98 __ __ TYA
0aec : a4 43 __ LDY T0 + 0 
0aee : 91 0e __ STA (P1),y 
0af0 : 20 77 0e JSR $0e77 ; (puts.l4 + 0)
0af3 : 4c 01 0b JMP $0b01 ; (sformat.s16 + 0)
.s90:
0af6 : 18 __ __ CLC
0af7 : a5 57 __ LDA T4 + 0 
0af9 : 65 43 __ ADC T0 + 0 
0afb : 85 57 __ STA T4 + 0 
0afd : 90 02 __ BCC $0b01 ; (sformat.s16 + 0)
.s115:
0aff : e6 58 __ INC T4 + 1 
.s16:
0b01 : a9 00 __ LDA #$00
0b03 : 8d df 9f STA $9fdf ; (si.sign + 0)
0b06 : 8d e0 9f STA $9fe0 ; (si.left + 0)
0b09 : 8d e1 9f STA $9fe1 ; (si.prefix + 0)
0b0c : a0 01 __ LDY #$01
0b0e : b1 55 __ LDA (T3 + 0),y 
0b10 : a2 20 __ LDX #$20
0b12 : 8e da 9f STX $9fda ; (si.fill + 0)
0b15 : a2 00 __ LDX #$00
0b17 : 8e db 9f STX $9fdb ; (si.width + 0)
0b1a : ca __ __ DEX
0b1b : 8e dc 9f STX $9fdc ; (si.precision + 0)
0b1e : a2 0a __ LDX #$0a
0b20 : 8e de 9f STX $9fde ; (si.base + 0)
0b23 : aa __ __ TAX
0b24 : a9 02 __ LDA #$02
0b26 : d0 07 __ BNE $0b2f ; (sformat.l17 + 0)
.s85:
0b28 : a0 00 __ LDY #$00
0b2a : b1 55 __ LDA (T3 + 0),y 
0b2c : aa __ __ TAX
0b2d : a9 01 __ LDA #$01
.l17:
0b2f : 18 __ __ CLC
0b30 : 65 55 __ ADC T3 + 0 
0b32 : 85 55 __ STA T3 + 0 
0b34 : 90 02 __ BCC $0b38 ; (sformat.s106 + 0)
.s105:
0b36 : e6 56 __ INC T3 + 1 
.s106:
0b38 : 8a __ __ TXA
0b39 : e0 2b __ CPX #$2b
0b3b : d0 07 __ BNE $0b44 ; (sformat.s18 + 0)
.s88:
0b3d : a9 01 __ LDA #$01
0b3f : 8d df 9f STA $9fdf ; (si.sign + 0)
0b42 : d0 e4 __ BNE $0b28 ; (sformat.s85 + 0)
.s18:
0b44 : c9 30 __ CMP #$30
0b46 : d0 06 __ BNE $0b4e ; (sformat.s19 + 0)
.s87:
0b48 : 8d da 9f STA $9fda ; (si.fill + 0)
0b4b : 4c 28 0b JMP $0b28 ; (sformat.s85 + 0)
.s19:
0b4e : c9 23 __ CMP #$23
0b50 : d0 07 __ BNE $0b59 ; (sformat.s20 + 0)
.s86:
0b52 : a9 01 __ LDA #$01
0b54 : 8d e1 9f STA $9fe1 ; (si.prefix + 0)
0b57 : d0 cf __ BNE $0b28 ; (sformat.s85 + 0)
.s20:
0b59 : c9 2d __ CMP #$2d
0b5b : d0 07 __ BNE $0b64 ; (sformat.s21 + 0)
.s84:
0b5d : a9 01 __ LDA #$01
0b5f : 8d e0 9f STA $9fe0 ; (si.left + 0)
0b62 : d0 c4 __ BNE $0b28 ; (sformat.s85 + 0)
.s21:
0b64 : 85 47 __ STA T2 + 0 
0b66 : c9 30 __ CMP #$30
0b68 : 90 3c __ BCC $0ba6 ; (sformat.s22 + 0)
.s80:
0b6a : c9 3a __ CMP #$3a
0b6c : b0 77 __ BCS $0be5 ; (sformat.s23 + 0)
.s81:
0b6e : a9 00 __ LDA #$00
0b70 : 85 53 __ STA T1 + 0 
.l82:
0b72 : a5 53 __ LDA T1 + 0 
0b74 : 0a __ __ ASL
0b75 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0b77 : a9 00 __ LDA #$00
0b79 : 2a __ __ ROL
0b7a : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0b7c : 2a __ __ ROL
0b7d : aa __ __ TAX
0b7e : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0b80 : 65 53 __ ADC T1 + 0 
0b82 : 0a __ __ ASL
0b83 : 18 __ __ CLC
0b84 : 65 47 __ ADC T2 + 0 
0b86 : 38 __ __ SEC
0b87 : e9 30 __ SBC #$30
0b89 : 85 53 __ STA T1 + 0 
0b8b : a0 00 __ LDY #$00
0b8d : b1 55 __ LDA (T3 + 0),y 
0b8f : 85 47 __ STA T2 + 0 
0b91 : e6 55 __ INC T3 + 0 
0b93 : d0 02 __ BNE $0b97 ; (sformat.s114 + 0)
.s113:
0b95 : e6 56 __ INC T3 + 1 
.s114:
0b97 : c9 30 __ CMP #$30
0b99 : 90 04 __ BCC $0b9f ; (sformat.s104 + 0)
.s83:
0b9b : c9 3a __ CMP #$3a
0b9d : 90 d3 __ BCC $0b72 ; (sformat.l82 + 0)
.s104:
0b9f : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0ba1 : a6 53 __ LDX T1 + 0 
0ba3 : 8e db 9f STX $9fdb ; (si.width + 0)
.s22:
0ba6 : c9 2e __ CMP #$2e
0ba8 : d0 3b __ BNE $0be5 ; (sformat.s23 + 0)
.s76:
0baa : a9 00 __ LDA #$00
0bac : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0bae : 4c c8 0b JMP $0bc8 ; (sformat.l77 + 0)
.s79:
0bb1 : a5 43 __ LDA T0 + 0 
0bb3 : 0a __ __ ASL
0bb4 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0bb6 : 98 __ __ TYA
0bb7 : 2a __ __ ROL
0bb8 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0bba : 2a __ __ ROL
0bbb : aa __ __ TAX
0bbc : 18 __ __ CLC
0bbd : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0bbf : 65 43 __ ADC T0 + 0 
0bc1 : 0a __ __ ASL
0bc2 : 18 __ __ CLC
0bc3 : 65 47 __ ADC T2 + 0 
0bc5 : 38 __ __ SEC
0bc6 : e9 30 __ SBC #$30
.l77:
0bc8 : 85 43 __ STA T0 + 0 
0bca : a0 00 __ LDY #$00
0bcc : b1 55 __ LDA (T3 + 0),y 
0bce : 85 47 __ STA T2 + 0 
0bd0 : e6 55 __ INC T3 + 0 
0bd2 : d0 02 __ BNE $0bd6 ; (sformat.s108 + 0)
.s107:
0bd4 : e6 56 __ INC T3 + 1 
.s108:
0bd6 : c9 30 __ CMP #$30
0bd8 : 90 04 __ BCC $0bde ; (sformat.s103 + 0)
.s78:
0bda : c9 3a __ CMP #$3a
0bdc : 90 d3 __ BCC $0bb1 ; (sformat.s79 + 0)
.s103:
0bde : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0be0 : a6 43 __ LDX T0 + 0 
0be2 : 8e dc 9f STX $9fdc ; (si.precision + 0)
.s23:
0be5 : c9 64 __ CMP #$64
0be7 : f0 0c __ BEQ $0bf5 ; (sformat.s75 + 0)
.s24:
0be9 : c9 44 __ CMP #$44
0beb : f0 08 __ BEQ $0bf5 ; (sformat.s75 + 0)
.s25:
0bed : c9 69 __ CMP #$69
0bef : f0 04 __ BEQ $0bf5 ; (sformat.s75 + 0)
.s26:
0bf1 : c9 49 __ CMP #$49
0bf3 : d0 07 __ BNE $0bfc ; (sformat.s27 + 0)
.s75:
0bf5 : a9 01 __ LDA #$01
.s93:
0bf7 : 85 13 __ STA P6 
0bf9 : 4c 3d 0e JMP $0e3d ; (sformat.s73 + 0)
.s27:
0bfc : c9 75 __ CMP #$75
0bfe : f0 04 __ BEQ $0c04 ; (sformat.s74 + 0)
.s28:
0c00 : c9 55 __ CMP #$55
0c02 : d0 04 __ BNE $0c08 ; (sformat.s29 + 0)
.s74:
0c04 : a9 00 __ LDA #$00
0c06 : f0 ef __ BEQ $0bf7 ; (sformat.s93 + 0)
.s29:
0c08 : c9 78 __ CMP #$78
0c0a : f0 04 __ BEQ $0c10 ; (sformat.s72 + 0)
.s30:
0c0c : c9 58 __ CMP #$58
0c0e : d0 15 __ BNE $0c25 ; (sformat.s31 + 0)
.s72:
0c10 : a5 47 __ LDA T2 + 0 
0c12 : 29 e0 __ AND #$e0
0c14 : 09 01 __ ORA #$01
0c16 : 8d dd 9f STA $9fdd ; (si.cha + 0)
0c19 : a9 00 __ LDA #$00
0c1b : 85 13 __ STA P6 
0c1d : a9 10 __ LDA #$10
0c1f : 8d de 9f STA $9fde ; (si.base + 0)
0c22 : 4c 3d 0e JMP $0e3d ; (sformat.s73 + 0)
.s31:
0c25 : c9 6c __ CMP #$6c
0c27 : d0 03 __ BNE $0c2c ; (sformat.s32 + 0)
0c29 : 4c ae 0d JMP $0dae ; (sformat.s60 + 0)
.s32:
0c2c : c9 4c __ CMP #$4c
0c2e : f0 f9 __ BEQ $0c29 ; (sformat.s31 + 4)
.s33:
0c30 : c9 66 __ CMP #$66
0c32 : f0 14 __ BEQ $0c48 ; (sformat.s59 + 0)
.s34:
0c34 : c9 67 __ CMP #$67
0c36 : f0 10 __ BEQ $0c48 ; (sformat.s59 + 0)
.s35:
0c38 : c9 65 __ CMP #$65
0c3a : f0 0c __ BEQ $0c48 ; (sformat.s59 + 0)
.s36:
0c3c : c9 46 __ CMP #$46
0c3e : f0 08 __ BEQ $0c48 ; (sformat.s59 + 0)
.s37:
0c40 : c9 47 __ CMP #$47
0c42 : f0 04 __ BEQ $0c48 ; (sformat.s59 + 0)
.s38:
0c44 : c9 45 __ CMP #$45
0c46 : d0 5c __ BNE $0ca4 ; (sformat.s39 + 0)
.s59:
0c48 : a5 57 __ LDA T4 + 0 
0c4a : 85 13 __ STA P6 
0c4c : a5 58 __ LDA T4 + 1 
0c4e : 85 14 __ STA P7 
0c50 : a5 47 __ LDA T2 + 0 
0c52 : 29 e0 __ AND #$e0
0c54 : 09 01 __ ORA #$01
0c56 : 8d dd 9f STA $9fdd ; (si.cha + 0)
0c59 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0c5c : 85 59 __ STA T5 + 0 
0c5e : a9 da __ LDA #$da
0c60 : 85 11 __ STA P4 
0c62 : a9 9f __ LDA #$9f
0c64 : 85 12 __ STA P5 
0c66 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0c69 : 85 5a __ STA T5 + 1 
0c6b : a0 00 __ LDY #$00
0c6d : b1 59 __ LDA (T5 + 0),y 
0c6f : 85 15 __ STA P8 
0c71 : c8 __ __ INY
0c72 : b1 59 __ LDA (T5 + 0),y 
0c74 : 85 16 __ STA P9 
0c76 : c8 __ __ INY
0c77 : b1 59 __ LDA (T5 + 0),y 
0c79 : 85 17 __ STA P10 
0c7b : c8 __ __ INY
0c7c : b1 59 __ LDA (T5 + 0),y 
0c7e : 85 18 __ STA P11 
0c80 : a5 47 __ LDA T2 + 0 
0c82 : ed dd 9f SBC $9fdd ; (si.cha + 0)
0c85 : 18 __ __ CLC
0c86 : 69 61 __ ADC #$61
0c88 : 8d f2 9f STA $9ff2 ; (sstack + 0)
0c8b : 20 52 11 JSR $1152 ; (nformf.s1 + 0)
0c8e : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0c90 : 85 5b __ STA T6 + 0 
0c92 : 18 __ __ CLC
0c93 : a5 59 __ LDA T5 + 0 
0c95 : 69 04 __ ADC #$04
0c97 : 8d f7 9f STA $9ff7 ; (sstack + 5)
0c9a : a5 5a __ LDA T5 + 1 
0c9c : 69 00 __ ADC #$00
0c9e : 8d f8 9f STA $9ff8 ; (sstack + 6)
0ca1 : 4c 58 0a JMP $0a58 ; (sformat.l5 + 0)
.s39:
0ca4 : c9 73 __ CMP #$73
0ca6 : f0 3b __ BEQ $0ce3 ; (sformat.s47 + 0)
.s40:
0ca8 : c9 53 __ CMP #$53
0caa : f0 37 __ BEQ $0ce3 ; (sformat.s47 + 0)
.s41:
0cac : c9 63 __ CMP #$63
0cae : f0 12 __ BEQ $0cc2 ; (sformat.s46 + 0)
.s42:
0cb0 : c9 43 __ CMP #$43
0cb2 : f0 0e __ BEQ $0cc2 ; (sformat.s46 + 0)
.s43:
0cb4 : aa __ __ TAX
0cb5 : f0 ea __ BEQ $0ca1 ; (sformat.s59 + 89)
.s44:
0cb7 : a0 00 __ LDY #$00
0cb9 : 91 57 __ STA (T4 + 0),y 
.s45:
0cbb : a9 01 __ LDA #$01
.s96:
0cbd : 85 5b __ STA T6 + 0 
0cbf : 4c 58 0a JMP $0a58 ; (sformat.l5 + 0)
.s46:
0cc2 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0cc5 : 85 43 __ STA T0 + 0 
0cc7 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0cca : 85 44 __ STA T0 + 1 
0ccc : a0 00 __ LDY #$00
0cce : b1 43 __ LDA (T0 + 0),y 
0cd0 : 91 57 __ STA (T4 + 0),y 
0cd2 : a5 43 __ LDA T0 + 0 
0cd4 : 69 01 __ ADC #$01
0cd6 : 8d f7 9f STA $9ff7 ; (sstack + 5)
0cd9 : a5 44 __ LDA T0 + 1 
0cdb : 69 00 __ ADC #$00
0cdd : 8d f8 9f STA $9ff8 ; (sstack + 6)
0ce0 : 4c bb 0c JMP $0cbb ; (sformat.s45 + 0)
.s47:
0ce3 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0ce6 : 85 43 __ STA T0 + 0 
0ce8 : 69 01 __ ADC #$01
0cea : 8d f7 9f STA $9ff7 ; (sstack + 5)
0ced : ad f8 9f LDA $9ff8 ; (sstack + 6)
0cf0 : 85 44 __ STA T0 + 1 
0cf2 : 69 00 __ ADC #$00
0cf4 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0cf7 : a0 00 __ LDY #$00
0cf9 : 84 5c __ STY T7 + 0 
0cfb : b1 43 __ LDA (T0 + 0),y 
0cfd : 85 1b __ STA ACCU + 0 ; (buff + 1)
0cff : 85 53 __ STA T1 + 0 
0d01 : c8 __ __ INY
0d02 : b1 43 __ LDA (T0 + 0),y 
0d04 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d06 : 85 54 __ STA T1 + 1 
0d08 : ad db 9f LDA $9fdb ; (si.width + 0)
0d0b : f0 0c __ BEQ $0d19 ; (sformat.s48 + 0)
.s100:
0d0d : 88 __ __ DEY
0d0e : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d10 : f0 05 __ BEQ $0d17 ; (sformat.s101 + 0)
.l58:
0d12 : c8 __ __ INY
0d13 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d15 : d0 fb __ BNE $0d12 ; (sformat.l58 + 0)
.s101:
0d17 : 84 5c __ STY T7 + 0 
.s48:
0d19 : ad e0 9f LDA $9fe0 ; (si.left + 0)
0d1c : 85 59 __ STA T5 + 0 
0d1e : d0 19 __ BNE $0d39 ; (sformat.s49 + 0)
.s98:
0d20 : a6 5c __ LDX T7 + 0 
0d22 : ec db 9f CPX $9fdb ; (si.width + 0)
0d25 : a0 00 __ LDY #$00
0d27 : b0 0c __ BCS $0d35 ; (sformat.s99 + 0)
.l57:
0d29 : ad da 9f LDA $9fda ; (si.fill + 0)
0d2c : 91 57 __ STA (T4 + 0),y 
0d2e : c8 __ __ INY
0d2f : e8 __ __ INX
0d30 : ec db 9f CPX $9fdb ; (si.width + 0)
0d33 : 90 f4 __ BCC $0d29 ; (sformat.l57 + 0)
.s99:
0d35 : 86 5c __ STX T7 + 0 
0d37 : 84 5b __ STY T6 + 0 
.s49:
0d39 : ac f9 9f LDY $9ff9 ; (sstack + 7)
0d3c : d0 48 __ BNE $0d86 ; (sformat.s54 + 0)
.s50:
0d3e : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0d40 : f0 23 __ BEQ $0d65 ; (sformat.s51 + 0)
.s53:
0d42 : 18 __ __ CLC
0d43 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0d45 : 69 01 __ ADC #$01
0d47 : 85 43 __ STA T0 + 0 
0d49 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
0d4b : 69 00 __ ADC #$00
0d4d : 85 44 __ STA T0 + 1 
0d4f : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
0d51 : a4 5b __ LDY T6 + 0 
0d53 : 91 57 __ STA (T4 + 0),y 
0d55 : e6 5b __ INC T6 + 0 
0d57 : a0 00 __ LDY #$00
0d59 : b1 43 __ LDA (T0 + 0),y 
0d5b : a8 __ __ TAY
0d5c : e6 43 __ INC T0 + 0 
0d5e : d0 02 __ BNE $0d62 ; (sformat.s112 + 0)
.s111:
0d60 : e6 44 __ INC T0 + 1 
.s112:
0d62 : 98 __ __ TYA
0d63 : d0 ec __ BNE $0d51 ; (sformat.l92 + 0)
.s51:
0d65 : a5 59 __ LDA T5 + 0 
0d67 : d0 03 __ BNE $0d6c ; (sformat.s97 + 0)
0d69 : 4c 58 0a JMP $0a58 ; (sformat.l5 + 0)
.s97:
0d6c : a6 5c __ LDX T7 + 0 
0d6e : ec db 9f CPX $9fdb ; (si.width + 0)
0d71 : a4 5b __ LDY T6 + 0 
0d73 : b0 0c __ BCS $0d81 ; (sformat.s102 + 0)
.l52:
0d75 : ad da 9f LDA $9fda ; (si.fill + 0)
0d78 : 91 57 __ STA (T4 + 0),y 
0d7a : c8 __ __ INY
0d7b : e8 __ __ INX
0d7c : ec db 9f CPX $9fdb ; (si.width + 0)
0d7f : 90 f4 __ BCC $0d75 ; (sformat.l52 + 0)
.s102:
0d81 : 84 5b __ STY T6 + 0 
0d83 : 4c 58 0a JMP $0a58 ; (sformat.l5 + 0)
.s54:
0d86 : a4 5b __ LDY T6 + 0 
0d88 : f0 11 __ BEQ $0d9b ; (sformat.s55 + 0)
.s56:
0d8a : a5 57 __ LDA T4 + 0 
0d8c : 85 0e __ STA P1 
0d8e : a5 58 __ LDA T4 + 1 
0d90 : 85 0f __ STA P2 
0d92 : a9 00 __ LDA #$00
0d94 : 85 5b __ STA T6 + 0 
0d96 : 91 0e __ STA (P1),y 
0d98 : 20 77 0e JSR $0e77 ; (puts.l4 + 0)
.s55:
0d9b : a5 53 __ LDA T1 + 0 
0d9d : 85 0e __ STA P1 
0d9f : a5 54 __ LDA T1 + 1 
0da1 : 85 0f __ STA P2 
0da3 : 20 77 0e JSR $0e77 ; (puts.l4 + 0)
0da6 : ad e0 9f LDA $9fe0 ; (si.left + 0)
0da9 : d0 c1 __ BNE $0d6c ; (sformat.s97 + 0)
0dab : 4c 58 0a JMP $0a58 ; (sformat.l5 + 0)
.s60:
0dae : ad f7 9f LDA $9ff7 ; (sstack + 5)
0db1 : 85 43 __ STA T0 + 0 
0db3 : 69 03 __ ADC #$03
0db5 : 8d f7 9f STA $9ff7 ; (sstack + 5)
0db8 : ad f8 9f LDA $9ff8 ; (sstack + 6)
0dbb : 85 44 __ STA T0 + 1 
0dbd : 69 00 __ ADC #$00
0dbf : 8d f8 9f STA $9ff8 ; (sstack + 6)
0dc2 : a0 00 __ LDY #$00
0dc4 : b1 55 __ LDA (T3 + 0),y 
0dc6 : aa __ __ TAX
0dc7 : e6 55 __ INC T3 + 0 
0dc9 : d0 02 __ BNE $0dcd ; (sformat.s110 + 0)
.s109:
0dcb : e6 56 __ INC T3 + 1 
.s110:
0dcd : b1 43 __ LDA (T0 + 0),y 
0dcf : 85 1b __ STA ACCU + 0 ; (buff + 1)
0dd1 : 85 11 __ STA P4 
0dd3 : a0 01 __ LDY #$01
0dd5 : b1 43 __ LDA (T0 + 0),y 
0dd7 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0dd9 : 85 12 __ STA P5 
0ddb : c8 __ __ INY
0ddc : b1 43 __ LDA (T0 + 0),y 
0dde : 85 1d __ STA ACCU + 2 ; (fmt + 1)
0de0 : 85 13 __ STA P6 
0de2 : c8 __ __ INY
0de3 : b1 43 __ LDA (T0 + 0),y 
0de5 : 85 14 __ STA P7 
0de7 : e0 64 __ CPX #$64
0de9 : f0 0c __ BEQ $0df7 ; (sformat.s71 + 0)
.s61:
0deb : e0 44 __ CPX #$44
0ded : f0 08 __ BEQ $0df7 ; (sformat.s71 + 0)
.s62:
0def : e0 69 __ CPX #$69
0df1 : f0 04 __ BEQ $0df7 ; (sformat.s71 + 0)
.s63:
0df3 : e0 49 __ CPX #$49
0df5 : d0 1c __ BNE $0e13 ; (sformat.s64 + 0)
.s71:
0df7 : a9 01 __ LDA #$01
.s94:
0df9 : 85 15 __ STA P8 
.s69:
0dfb : a5 57 __ LDA T4 + 0 
0dfd : 85 0f __ STA P2 
0dff : a5 58 __ LDA T4 + 1 
0e01 : 85 10 __ STA P3 
0e03 : a9 da __ LDA #$da
0e05 : 85 0d __ STA P0 
0e07 : a9 9f __ LDA #$9f
0e09 : 85 0e __ STA P1 
0e0b : 20 08 10 JSR $1008 ; (nforml.s4 + 0)
0e0e : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0e10 : 4c bd 0c JMP $0cbd ; (sformat.s96 + 0)
.s64:
0e13 : e0 75 __ CPX #$75
0e15 : f0 04 __ BEQ $0e1b ; (sformat.s70 + 0)
.s65:
0e17 : e0 55 __ CPX #$55
0e19 : d0 04 __ BNE $0e1f ; (sformat.s66 + 0)
.s70:
0e1b : a9 00 __ LDA #$00
0e1d : f0 da __ BEQ $0df9 ; (sformat.s94 + 0)
.s66:
0e1f : e0 78 __ CPX #$78
0e21 : f0 06 __ BEQ $0e29 ; (sformat.s68 + 0)
.s67:
0e23 : 85 1e __ STA ACCU + 3 ; (fps + 0)
0e25 : e0 58 __ CPX #$58
0e27 : d0 82 __ BNE $0dab ; (sformat.s55 + 16)
.s68:
0e29 : a9 00 __ LDA #$00
0e2b : 85 15 __ STA P8 
0e2d : a9 10 __ LDA #$10
0e2f : 8d de 9f STA $9fde ; (si.base + 0)
0e32 : 8a __ __ TXA
0e33 : 29 e0 __ AND #$e0
0e35 : 09 01 __ ORA #$01
0e37 : 8d dd 9f STA $9fdd ; (si.cha + 0)
0e3a : 4c fb 0d JMP $0dfb ; (sformat.s69 + 0)
.s73:
0e3d : a5 57 __ LDA T4 + 0 
0e3f : 85 0f __ STA P2 
0e41 : a5 58 __ LDA T4 + 1 
0e43 : 85 10 __ STA P3 
0e45 : ad f7 9f LDA $9ff7 ; (sstack + 5)
0e48 : 85 43 __ STA T0 + 0 
0e4a : ad f8 9f LDA $9ff8 ; (sstack + 6)
0e4d : 85 44 __ STA T0 + 1 
0e4f : a0 00 __ LDY #$00
0e51 : b1 43 __ LDA (T0 + 0),y 
0e53 : 85 11 __ STA P4 
0e55 : c8 __ __ INY
0e56 : b1 43 __ LDA (T0 + 0),y 
0e58 : 85 12 __ STA P5 
0e5a : 18 __ __ CLC
0e5b : a5 43 __ LDA T0 + 0 
0e5d : 69 02 __ ADC #$02
0e5f : 8d f7 9f STA $9ff7 ; (sstack + 5)
0e62 : a5 44 __ LDA T0 + 1 
0e64 : 69 00 __ ADC #$00
0e66 : 8d f8 9f STA $9ff8 ; (sstack + 6)
0e69 : a9 da __ LDA #$da
0e6b : 85 0d __ STA P0 
0e6d : a9 9f __ LDA #$9f
0e6f : 85 0e __ STA P1 
0e71 : 20 ed 0e JSR $0eed ; (nformi.s4 + 0)
0e74 : 4c bd 0c JMP $0cbd ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
0e77 : a0 00 __ LDY #$00
0e79 : b1 0e __ LDA (P1),y ; (str + 0)
0e7b : d0 01 __ BNE $0e7e ; (puts.s5 + 0)
.s3:
0e7d : 60 __ __ RTS
.s5:
0e7e : e6 0e __ INC P1 ; (str + 0)
0e80 : d0 02 __ BNE $0e84 ; (puts.s7 + 0)
.s6:
0e82 : e6 0f __ INC P2 ; (str + 1)
.s7:
0e84 : 20 8a 0e JSR $0e8a ; (putpch.s4 + 0)
0e87 : 4c 77 0e JMP $0e77 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0e8a : 85 0d __ STA P0 ; (c + 0)
0e8c : ad cd 1b LDA $1bcd ; (giocharmap + 0)
0e8f : f0 32 __ BEQ $0ec3 ; (putpch.s5 + 0)
.s6:
0e91 : a5 0d __ LDA P0 ; (c + 0)
0e93 : c9 0a __ CMP #$0a
0e95 : d0 04 __ BNE $0e9b ; (putpch.s7 + 0)
.s18:
0e97 : a9 0d __ LDA #$0d
0e99 : d0 32 __ BNE $0ecd ; (putpch.s15 + 0)
.s7:
0e9b : c9 09 __ CMP #$09
0e9d : f0 36 __ BEQ $0ed5 ; (putpch.s16 + 0)
.s8:
0e9f : ad cd 1b LDA $1bcd ; (giocharmap + 0)
0ea2 : c9 02 __ CMP #$02
0ea4 : 90 1d __ BCC $0ec3 ; (putpch.s5 + 0)
.s9:
0ea6 : a5 0d __ LDA P0 ; (c + 0)
0ea8 : c9 41 __ CMP #$41
0eaa : 90 17 __ BCC $0ec3 ; (putpch.s5 + 0)
.s10:
0eac : c9 7b __ CMP #$7b
0eae : b0 13 __ BCS $0ec3 ; (putpch.s5 + 0)
.s11:
0eb0 : c9 61 __ CMP #$61
0eb2 : b0 04 __ BCS $0eb8 ; (putpch.s13 + 0)
.s12:
0eb4 : c9 5b __ CMP #$5b
0eb6 : b0 0b __ BCS $0ec3 ; (putpch.s5 + 0)
.s13:
0eb8 : 49 20 __ EOR #$20
0eba : 85 0d __ STA P0 ; (c + 0)
0ebc : ad cd 1b LDA $1bcd ; (giocharmap + 0)
0ebf : c9 02 __ CMP #$02
0ec1 : f0 06 __ BEQ $0ec9 ; (putpch.s14 + 0)
.s5:
0ec3 : a5 0d __ LDA P0 ; (c + 0)
0ec5 : 20 d2 ff JSR $ffd2 
.s3:
0ec8 : 60 __ __ RTS
.s14:
0ec9 : a5 0d __ LDA P0 ; (c + 0)
0ecb : 29 5f __ AND #$5f
.s15:
0ecd : 85 43 __ STA T0 + 0 
0ecf : a5 43 __ LDA T0 + 0 
0ed1 : 20 d2 ff JSR $ffd2 
0ed4 : 60 __ __ RTS
.s16:
0ed5 : a5 d3 __ LDA $d3 
0ed7 : 29 03 __ AND #$03
0ed9 : 85 43 __ STA T0 + 0 
0edb : a9 20 __ LDA #$20
0edd : 85 44 __ STA T1 + 0 
.l17:
0edf : a5 44 __ LDA T1 + 0 
0ee1 : 20 d2 ff JSR $ffd2 
0ee4 : e6 43 __ INC T0 + 0 
0ee6 : a5 43 __ LDA T0 + 0 
0ee8 : c9 04 __ CMP #$04
0eea : 90 f3 __ BCC $0edf ; (putpch.l17 + 0)
0eec : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
0eed : a9 00 __ LDA #$00
0eef : 85 43 __ STA T5 + 0 
0ef1 : a0 04 __ LDY #$04
0ef3 : b1 0d __ LDA (P0),y ; (si + 0)
0ef5 : 85 44 __ STA T6 + 0 
0ef7 : a5 13 __ LDA P6 ; (s + 0)
0ef9 : f0 13 __ BEQ $0f0e ; (nformi.s5 + 0)
.s33:
0efb : 24 12 __ BIT P5 ; (v + 1)
0efd : 10 0f __ BPL $0f0e ; (nformi.s5 + 0)
.s34:
0eff : 38 __ __ SEC
0f00 : a9 00 __ LDA #$00
0f02 : e5 11 __ SBC P4 ; (v + 0)
0f04 : 85 11 __ STA P4 ; (v + 0)
0f06 : a9 00 __ LDA #$00
0f08 : e5 12 __ SBC P5 ; (v + 1)
0f0a : 85 12 __ STA P5 ; (v + 1)
0f0c : e6 43 __ INC T5 + 0 
.s5:
0f0e : a9 10 __ LDA #$10
0f10 : 85 45 __ STA T7 + 0 
0f12 : a5 11 __ LDA P4 ; (v + 0)
0f14 : 05 12 __ ORA P5 ; (v + 1)
0f16 : f0 33 __ BEQ $0f4b ; (nformi.s6 + 0)
.s28:
0f18 : a5 11 __ LDA P4 ; (v + 0)
0f1a : 85 1b __ STA ACCU + 0 
0f1c : a5 12 __ LDA P5 ; (v + 1)
0f1e : 85 1c __ STA ACCU + 1 
.l29:
0f20 : a5 44 __ LDA T6 + 0 
0f22 : 85 03 __ STA WORK + 0 
0f24 : a9 00 __ LDA #$00
0f26 : 85 04 __ STA WORK + 1 
0f28 : 20 b0 19 JSR $19b0 ; (divmod + 0)
0f2b : a5 05 __ LDA WORK + 2 
0f2d : c9 0a __ CMP #$0a
0f2f : b0 04 __ BCS $0f35 ; (nformi.s32 + 0)
.s30:
0f31 : a9 30 __ LDA #$30
0f33 : 90 06 __ BCC $0f3b ; (nformi.s31 + 0)
.s32:
0f35 : a0 03 __ LDY #$03
0f37 : b1 0d __ LDA (P0),y ; (si + 0)
0f39 : e9 0a __ SBC #$0a
.s31:
0f3b : 18 __ __ CLC
0f3c : 65 05 __ ADC WORK + 2 
0f3e : a6 45 __ LDX T7 + 0 
0f40 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f43 : c6 45 __ DEC T7 + 0 
0f45 : a5 1b __ LDA ACCU + 0 
0f47 : 05 1c __ ORA ACCU + 1 
0f49 : d0 d5 __ BNE $0f20 ; (nformi.l29 + 0)
.s6:
0f4b : a0 02 __ LDY #$02
0f4d : b1 0d __ LDA (P0),y ; (si + 0)
0f4f : c9 ff __ CMP #$ff
0f51 : d0 04 __ BNE $0f57 ; (nformi.s27 + 0)
.s7:
0f53 : a9 0f __ LDA #$0f
0f55 : d0 05 __ BNE $0f5c ; (nformi.s39 + 0)
.s27:
0f57 : 38 __ __ SEC
0f58 : a9 10 __ LDA #$10
0f5a : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
0f5c : a8 __ __ TAY
0f5d : c4 45 __ CPY T7 + 0 
0f5f : b0 0d __ BCS $0f6e ; (nformi.s8 + 0)
.s26:
0f61 : a9 30 __ LDA #$30
.l40:
0f63 : a6 45 __ LDX T7 + 0 
0f65 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f68 : c6 45 __ DEC T7 + 0 
0f6a : c4 45 __ CPY T7 + 0 
0f6c : 90 f5 __ BCC $0f63 ; (nformi.l40 + 0)
.s8:
0f6e : a0 07 __ LDY #$07
0f70 : b1 0d __ LDA (P0),y ; (si + 0)
0f72 : f0 1c __ BEQ $0f90 ; (nformi.s9 + 0)
.s24:
0f74 : a5 44 __ LDA T6 + 0 
0f76 : c9 10 __ CMP #$10
0f78 : d0 16 __ BNE $0f90 ; (nformi.s9 + 0)
.s25:
0f7a : a0 03 __ LDY #$03
0f7c : b1 0d __ LDA (P0),y ; (si + 0)
0f7e : a8 __ __ TAY
0f7f : a9 30 __ LDA #$30
0f81 : a6 45 __ LDX T7 + 0 
0f83 : ca __ __ DEX
0f84 : ca __ __ DEX
0f85 : 86 45 __ STX T7 + 0 
0f87 : 9d e2 9f STA $9fe2,x ; (buffer[0] + 0)
0f8a : 98 __ __ TYA
0f8b : 69 16 __ ADC #$16
0f8d : 9d e3 9f STA $9fe3,x ; (buffer[0] + 1)
.s9:
0f90 : a9 00 __ LDA #$00
0f92 : 85 1b __ STA ACCU + 0 
0f94 : a5 43 __ LDA T5 + 0 
0f96 : f0 0c __ BEQ $0fa4 ; (nformi.s10 + 0)
.s23:
0f98 : a9 2d __ LDA #$2d
.s22:
0f9a : a6 45 __ LDX T7 + 0 
0f9c : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0f9f : c6 45 __ DEC T7 + 0 
0fa1 : 4c ae 0f JMP $0fae ; (nformi.s11 + 0)
.s10:
0fa4 : a0 05 __ LDY #$05
0fa6 : b1 0d __ LDA (P0),y ; (si + 0)
0fa8 : f0 04 __ BEQ $0fae ; (nformi.s11 + 0)
.s21:
0faa : a9 2b __ LDA #$2b
0fac : d0 ec __ BNE $0f9a ; (nformi.s22 + 0)
.s11:
0fae : a6 45 __ LDX T7 + 0 
0fb0 : a0 06 __ LDY #$06
0fb2 : b1 0d __ LDA (P0),y ; (si + 0)
0fb4 : d0 2b __ BNE $0fe1 ; (nformi.s17 + 0)
.l12:
0fb6 : 8a __ __ TXA
0fb7 : 18 __ __ CLC
0fb8 : a0 01 __ LDY #$01
0fba : 71 0d __ ADC (P0),y ; (si + 0)
0fbc : b0 04 __ BCS $0fc2 ; (nformi.s15 + 0)
.s16:
0fbe : c9 11 __ CMP #$11
0fc0 : 90 0a __ BCC $0fcc ; (nformi.s13 + 0)
.s15:
0fc2 : a0 00 __ LDY #$00
0fc4 : b1 0d __ LDA (P0),y ; (si + 0)
0fc6 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
0fc9 : ca __ __ DEX
0fca : b0 ea __ BCS $0fb6 ; (nformi.l12 + 0)
.s13:
0fcc : e0 10 __ CPX #$10
0fce : b0 0e __ BCS $0fde ; (nformi.s41 + 0)
.s14:
0fd0 : 88 __ __ DEY
.l37:
0fd1 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
0fd4 : 91 0f __ STA (P2),y ; (str + 0)
0fd6 : c8 __ __ INY
0fd7 : e8 __ __ INX
0fd8 : e0 10 __ CPX #$10
0fda : 90 f5 __ BCC $0fd1 ; (nformi.l37 + 0)
.s38:
0fdc : 84 1b __ STY ACCU + 0 
.s41:
0fde : a5 1b __ LDA ACCU + 0 
.s3:
0fe0 : 60 __ __ RTS
.s17:
0fe1 : e0 10 __ CPX #$10
0fe3 : b0 1a __ BCS $0fff ; (nformi.l18 + 0)
.s20:
0fe5 : a0 00 __ LDY #$00
.l35:
0fe7 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
0fea : 91 0f __ STA (P2),y ; (str + 0)
0fec : c8 __ __ INY
0fed : e8 __ __ INX
0fee : e0 10 __ CPX #$10
0ff0 : 90 f5 __ BCC $0fe7 ; (nformi.l35 + 0)
.s36:
0ff2 : 84 1b __ STY ACCU + 0 
0ff4 : b0 09 __ BCS $0fff ; (nformi.l18 + 0)
.s19:
0ff6 : 88 __ __ DEY
0ff7 : b1 0d __ LDA (P0),y ; (si + 0)
0ff9 : a4 1b __ LDY ACCU + 0 
0ffb : 91 0f __ STA (P2),y ; (str + 0)
0ffd : e6 1b __ INC ACCU + 0 
.l18:
0fff : a5 1b __ LDA ACCU + 0 
1001 : a0 01 __ LDY #$01
1003 : d1 0d __ CMP (P0),y ; (si + 0)
1005 : 90 ef __ BCC $0ff6 ; (nformi.s19 + 0)
1007 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
1008 : a9 00 __ LDA #$00
100a : 85 43 __ STA T4 + 0 
100c : a5 15 __ LDA P8 ; (s + 0)
100e : f0 1f __ BEQ $102f ; (nforml.s5 + 0)
.s35:
1010 : 24 14 __ BIT P7 ; (v + 3)
1012 : 10 1b __ BPL $102f ; (nforml.s5 + 0)
.s36:
1014 : 38 __ __ SEC
1015 : a9 00 __ LDA #$00
1017 : e5 11 __ SBC P4 ; (v + 0)
1019 : 85 11 __ STA P4 ; (v + 0)
101b : a9 00 __ LDA #$00
101d : e5 12 __ SBC P5 ; (v + 1)
101f : 85 12 __ STA P5 ; (v + 1)
1021 : a9 00 __ LDA #$00
1023 : e5 13 __ SBC P6 ; (v + 2)
1025 : 85 13 __ STA P6 ; (v + 2)
1027 : a9 00 __ LDA #$00
1029 : e5 14 __ SBC P7 ; (v + 3)
102b : 85 14 __ STA P7 ; (v + 3)
102d : e6 43 __ INC T4 + 0 
.s5:
102f : a9 10 __ LDA #$10
1031 : 85 44 __ STA T5 + 0 
1033 : a5 14 __ LDA P7 ; (v + 3)
1035 : f0 03 __ BEQ $103a ; (nforml.s31 + 0)
1037 : 4c 02 11 JMP $1102 ; (nforml.l28 + 0)
.s31:
103a : a5 13 __ LDA P6 ; (v + 2)
103c : d0 f9 __ BNE $1037 ; (nforml.s5 + 8)
.s32:
103e : a5 12 __ LDA P5 ; (v + 1)
1040 : d0 f5 __ BNE $1037 ; (nforml.s5 + 8)
.s33:
1042 : c5 11 __ CMP P4 ; (v + 0)
1044 : 90 f1 __ BCC $1037 ; (nforml.s5 + 8)
.s6:
1046 : a0 02 __ LDY #$02
1048 : b1 0d __ LDA (P0),y ; (si + 0)
104a : c9 ff __ CMP #$ff
104c : d0 04 __ BNE $1052 ; (nforml.s27 + 0)
.s7:
104e : a9 0f __ LDA #$0f
1050 : d0 05 __ BNE $1057 ; (nforml.s41 + 0)
.s27:
1052 : 38 __ __ SEC
1053 : a9 10 __ LDA #$10
1055 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
1057 : a8 __ __ TAY
1058 : c4 44 __ CPY T5 + 0 
105a : b0 0d __ BCS $1069 ; (nforml.s8 + 0)
.s26:
105c : a9 30 __ LDA #$30
.l42:
105e : a6 44 __ LDX T5 + 0 
1060 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
1063 : c6 44 __ DEC T5 + 0 
1065 : c4 44 __ CPY T5 + 0 
1067 : 90 f5 __ BCC $105e ; (nforml.l42 + 0)
.s8:
1069 : a0 07 __ LDY #$07
106b : b1 0d __ LDA (P0),y ; (si + 0)
106d : f0 1d __ BEQ $108c ; (nforml.s9 + 0)
.s24:
106f : a0 04 __ LDY #$04
1071 : b1 0d __ LDA (P0),y ; (si + 0)
1073 : c9 10 __ CMP #$10
1075 : d0 15 __ BNE $108c ; (nforml.s9 + 0)
.s25:
1077 : 88 __ __ DEY
1078 : b1 0d __ LDA (P0),y ; (si + 0)
107a : a8 __ __ TAY
107b : a9 30 __ LDA #$30
107d : a6 44 __ LDX T5 + 0 
107f : ca __ __ DEX
1080 : ca __ __ DEX
1081 : 86 44 __ STX T5 + 0 
1083 : 9d e2 9f STA $9fe2,x ; (buffer[0] + 0)
1086 : 98 __ __ TYA
1087 : 69 16 __ ADC #$16
1089 : 9d e3 9f STA $9fe3,x ; (buffer[0] + 1)
.s9:
108c : a9 00 __ LDA #$00
108e : 85 1b __ STA ACCU + 0 
1090 : a5 43 __ LDA T4 + 0 
1092 : f0 0c __ BEQ $10a0 ; (nforml.s10 + 0)
.s23:
1094 : a9 2d __ LDA #$2d
.s22:
1096 : a6 44 __ LDX T5 + 0 
1098 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
109b : c6 44 __ DEC T5 + 0 
109d : 4c aa 10 JMP $10aa ; (nforml.s11 + 0)
.s10:
10a0 : a0 05 __ LDY #$05
10a2 : b1 0d __ LDA (P0),y ; (si + 0)
10a4 : f0 04 __ BEQ $10aa ; (nforml.s11 + 0)
.s21:
10a6 : a9 2b __ LDA #$2b
10a8 : d0 ec __ BNE $1096 ; (nforml.s22 + 0)
.s11:
10aa : a0 06 __ LDY #$06
10ac : a6 44 __ LDX T5 + 0 
10ae : b1 0d __ LDA (P0),y ; (si + 0)
10b0 : d0 29 __ BNE $10db ; (nforml.s17 + 0)
.l12:
10b2 : 8a __ __ TXA
10b3 : 18 __ __ CLC
10b4 : a0 01 __ LDY #$01
10b6 : 71 0d __ ADC (P0),y ; (si + 0)
10b8 : b0 04 __ BCS $10be ; (nforml.s15 + 0)
.s16:
10ba : c9 11 __ CMP #$11
10bc : 90 0a __ BCC $10c8 ; (nforml.s13 + 0)
.s15:
10be : a0 00 __ LDY #$00
10c0 : b1 0d __ LDA (P0),y ; (si + 0)
10c2 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
10c5 : ca __ __ DEX
10c6 : b0 ea __ BCS $10b2 ; (nforml.l12 + 0)
.s13:
10c8 : e0 10 __ CPX #$10
10ca : b0 0e __ BCS $10da ; (nforml.s3 + 0)
.s14:
10cc : 88 __ __ DEY
.l39:
10cd : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
10d0 : 91 0f __ STA (P2),y ; (str + 0)
10d2 : c8 __ __ INY
10d3 : e8 __ __ INX
10d4 : e0 10 __ CPX #$10
10d6 : 90 f5 __ BCC $10cd ; (nforml.l39 + 0)
.s40:
10d8 : 84 1b __ STY ACCU + 0 
.s3:
10da : 60 __ __ RTS
.s17:
10db : e0 10 __ CPX #$10
10dd : b0 1a __ BCS $10f9 ; (nforml.l18 + 0)
.s20:
10df : a0 00 __ LDY #$00
.l37:
10e1 : bd e2 9f LDA $9fe2,x ; (buffer[0] + 0)
10e4 : 91 0f __ STA (P2),y ; (str + 0)
10e6 : c8 __ __ INY
10e7 : e8 __ __ INX
10e8 : e0 10 __ CPX #$10
10ea : 90 f5 __ BCC $10e1 ; (nforml.l37 + 0)
.s38:
10ec : 84 1b __ STY ACCU + 0 
10ee : b0 09 __ BCS $10f9 ; (nforml.l18 + 0)
.s19:
10f0 : 88 __ __ DEY
10f1 : b1 0d __ LDA (P0),y ; (si + 0)
10f3 : a4 1b __ LDY ACCU + 0 
10f5 : 91 0f __ STA (P2),y ; (str + 0)
10f7 : e6 1b __ INC ACCU + 0 
.l18:
10f9 : a5 1b __ LDA ACCU + 0 
10fb : a0 01 __ LDY #$01
10fd : d1 0d __ CMP (P0),y ; (si + 0)
10ff : 90 ef __ BCC $10f0 ; (nforml.s19 + 0)
1101 : 60 __ __ RTS
.l28:
1102 : a0 04 __ LDY #$04
1104 : b1 0d __ LDA (P0),y ; (si + 0)
1106 : 85 03 __ STA WORK + 0 
1108 : a5 11 __ LDA P4 ; (v + 0)
110a : 85 1b __ STA ACCU + 0 
110c : a5 12 __ LDA P5 ; (v + 1)
110e : 85 1c __ STA ACCU + 1 
1110 : a5 13 __ LDA P6 ; (v + 2)
1112 : 85 1d __ STA ACCU + 2 
1114 : a5 14 __ LDA P7 ; (v + 3)
1116 : 85 1e __ STA ACCU + 3 
1118 : a9 00 __ LDA #$00
111a : 85 04 __ STA WORK + 1 
111c : 85 05 __ STA WORK + 2 
111e : 85 06 __ STA WORK + 3 
1120 : 20 f5 1a JSR $1af5 ; (divmod32 + 0)
1123 : a5 07 __ LDA WORK + 4 
1125 : c9 0a __ CMP #$0a
1127 : b0 04 __ BCS $112d ; (nforml.s34 + 0)
.s29:
1129 : a9 30 __ LDA #$30
112b : 90 06 __ BCC $1133 ; (nforml.s30 + 0)
.s34:
112d : a0 03 __ LDY #$03
112f : b1 0d __ LDA (P0),y ; (si + 0)
1131 : e9 0a __ SBC #$0a
.s30:
1133 : 18 __ __ CLC
1134 : 65 07 __ ADC WORK + 4 
1136 : a6 44 __ LDX T5 + 0 
1138 : 9d e1 9f STA $9fe1,x ; (si.prefix + 0)
113b : c6 44 __ DEC T5 + 0 
113d : a5 1b __ LDA ACCU + 0 
113f : 85 11 __ STA P4 ; (v + 0)
1141 : a5 1c __ LDA ACCU + 1 
1143 : 85 12 __ STA P5 ; (v + 1)
1145 : a5 1d __ LDA ACCU + 2 
1147 : 85 13 __ STA P6 ; (v + 2)
1149 : a5 1e __ LDA ACCU + 3 
114b : 85 14 __ STA P7 ; (v + 3)
114d : d0 b3 __ BNE $1102 ; (nforml.l28 + 0)
114f : 4c 3a 10 JMP $103a ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
1152 : a2 03 __ LDX #$03
1154 : b5 53 __ LDA T7 + 0,x 
1156 : 9d e9 9f STA $9fe9,x ; (nformf@stack + 0)
1159 : ca __ __ DEX
115a : 10 f8 __ BPL $1154 ; (nformf.s1 + 2)
.s4:
115c : a5 16 __ LDA P9 ; (f + 1)
115e : 85 44 __ STA T0 + 1 
1160 : a5 17 __ LDA P10 ; (f + 2)
1162 : 85 45 __ STA T0 + 2 
1164 : a5 18 __ LDA P11 ; (f + 3)
1166 : 29 7f __ AND #$7f
1168 : 05 17 __ ORA P10 ; (f + 2)
116a : 05 16 __ ORA P9 ; (f + 1)
116c : 05 15 __ ORA P8 ; (f + 0)
116e : f0 21 __ BEQ $1191 ; (nformf.s5 + 0)
.s107:
1170 : 24 18 __ BIT P11 ; (f + 3)
1172 : 10 1d __ BPL $1191 ; (nformf.s5 + 0)
.s106:
1174 : a9 2d __ LDA #$2d
1176 : a0 00 __ LDY #$00
1178 : 91 13 __ STA (P6),y ; (str + 0)
117a : a5 18 __ LDA P11 ; (f + 3)
117c : 49 80 __ EOR #$80
117e : 85 10 __ STA P3 
1180 : 85 18 __ STA P11 ; (f + 3)
1182 : a5 15 __ LDA P8 ; (f + 0)
1184 : 85 0d __ STA P0 
1186 : a5 16 __ LDA P9 ; (f + 1)
1188 : 85 0e __ STA P1 
118a : a5 17 __ LDA P10 ; (f + 2)
118c : 85 0f __ STA P2 
118e : 4c a5 16 JMP $16a5 ; (nformf.s104 + 0)
.s5:
1191 : a5 15 __ LDA P8 ; (f + 0)
1193 : 85 0d __ STA P0 
1195 : a5 16 __ LDA P9 ; (f + 1)
1197 : 85 0e __ STA P1 
1199 : a5 17 __ LDA P10 ; (f + 2)
119b : 85 0f __ STA P2 
119d : a5 18 __ LDA P11 ; (f + 3)
119f : 85 10 __ STA P3 
11a1 : a0 05 __ LDY #$05
11a3 : b1 11 __ LDA (P4),y ; (si + 0)
11a5 : f0 09 __ BEQ $11b0 ; (nformf.s6 + 0)
.s103:
11a7 : a9 2b __ LDA #$2b
11a9 : a0 00 __ LDY #$00
11ab : 91 13 __ STA (P6),y ; (str + 0)
11ad : 4c a5 16 JMP $16a5 ; (nformf.s104 + 0)
.s6:
11b0 : 20 b6 16 JSR $16b6 ; (isinf.s4 + 0)
11b3 : a2 00 __ LDX #$00
11b5 : 86 54 __ STX T9 + 0 
11b7 : a8 __ __ TAY
11b8 : f0 05 __ BEQ $11bf ; (nformf.s7 + 0)
.s101:
11ba : a9 02 __ LDA #$02
11bc : 4c 75 16 JMP $1675 ; (nformf.s102 + 0)
.s7:
11bf : a5 11 __ LDA P4 ; (si + 0)
11c1 : 85 4b __ STA T2 + 0 
11c3 : a5 12 __ LDA P5 ; (si + 1)
11c5 : 85 4c __ STA T2 + 1 
11c7 : a0 02 __ LDY #$02
11c9 : b1 11 __ LDA (P4),y ; (si + 0)
11cb : c9 ff __ CMP #$ff
11cd : d0 02 __ BNE $11d1 ; (nformf.s100 + 0)
.s8:
11cf : a9 06 __ LDA #$06
.s100:
11d1 : 85 4d __ STA T3 + 0 
11d3 : 85 52 __ STA T6 + 0 
11d5 : a9 00 __ LDA #$00
11d7 : 85 4f __ STA T4 + 0 
11d9 : 85 50 __ STA T4 + 1 
11db : a5 18 __ LDA P11 ; (f + 3)
11dd : 85 46 __ STA T0 + 3 
11df : 29 7f __ AND #$7f
11e1 : 05 17 __ ORA P10 ; (f + 2)
11e3 : 05 16 __ ORA P9 ; (f + 1)
11e5 : a6 15 __ LDX P8 ; (f + 0)
11e7 : 86 43 __ STX T0 + 0 
11e9 : 05 15 __ ORA P8 ; (f + 0)
11eb : d0 03 __ BNE $11f0 ; (nformf.s67 + 0)
11ed : 4c 24 13 JMP $1324 ; (nformf.s9 + 0)
.s67:
11f0 : a5 18 __ LDA P11 ; (f + 3)
11f2 : 10 03 __ BPL $11f7 ; (nformf.s95 + 0)
11f4 : 4c 76 12 JMP $1276 ; (nformf.l80 + 0)
.s95:
11f7 : c9 44 __ CMP #$44
11f9 : d0 0d __ BNE $1208 ; (nformf.l99 + 0)
.s96:
11fb : a5 17 __ LDA P10 ; (f + 2)
11fd : c9 7a __ CMP #$7a
11ff : d0 07 __ BNE $1208 ; (nformf.l99 + 0)
.s97:
1201 : a5 16 __ LDA P9 ; (f + 1)
1203 : d0 03 __ BNE $1208 ; (nformf.l99 + 0)
.s98:
1205 : 8a __ __ TXA
1206 : f0 02 __ BEQ $120a ; (nformf.l90 + 0)
.l99:
1208 : 90 54 __ BCC $125e ; (nformf.s68 + 0)
.l90:
120a : 18 __ __ CLC
120b : a5 4f __ LDA T4 + 0 
120d : 69 03 __ ADC #$03
120f : 85 4f __ STA T4 + 0 
1211 : 90 02 __ BCC $1215 ; (nformf.s121 + 0)
.s120:
1213 : e6 50 __ INC T4 + 1 
.s121:
1215 : a5 43 __ LDA T0 + 0 
1217 : 85 1b __ STA ACCU + 0 
1219 : a5 44 __ LDA T0 + 1 
121b : 85 1c __ STA ACCU + 1 
121d : a5 45 __ LDA T0 + 2 
121f : 85 1d __ STA ACCU + 2 
1221 : a5 46 __ LDA T0 + 3 
1223 : 85 1e __ STA ACCU + 3 
1225 : a9 00 __ LDA #$00
1227 : 85 03 __ STA WORK + 0 
1229 : 85 04 __ STA WORK + 1 
122b : a9 7a __ LDA #$7a
122d : 85 05 __ STA WORK + 2 
122f : a9 44 __ LDA #$44
1231 : 85 06 __ STA WORK + 3 
1233 : 20 e2 16 JSR $16e2 ; (freg + 20)
1236 : 20 c8 18 JSR $18c8 ; (crt_fdiv + 0)
1239 : a5 1b __ LDA ACCU + 0 
123b : 85 43 __ STA T0 + 0 
123d : a5 1c __ LDA ACCU + 1 
123f : 85 44 __ STA T0 + 1 
1241 : a6 1d __ LDX ACCU + 2 
1243 : 86 45 __ STX T0 + 2 
1245 : a5 1e __ LDA ACCU + 3 
1247 : 85 46 __ STA T0 + 3 
1249 : 30 13 __ BMI $125e ; (nformf.s68 + 0)
.s91:
124b : c9 44 __ CMP #$44
124d : d0 b9 __ BNE $1208 ; (nformf.l99 + 0)
.s92:
124f : e0 7a __ CPX #$7a
1251 : d0 b5 __ BNE $1208 ; (nformf.l99 + 0)
.s93:
1253 : a5 1c __ LDA ACCU + 1 
1255 : 38 __ __ SEC
1256 : d0 b0 __ BNE $1208 ; (nformf.l99 + 0)
.s94:
1258 : a5 1b __ LDA ACCU + 0 
125a : f0 ae __ BEQ $120a ; (nformf.l90 + 0)
125c : d0 aa __ BNE $1208 ; (nformf.l99 + 0)
.s68:
125e : a5 46 __ LDA T0 + 3 
1260 : 30 14 __ BMI $1276 ; (nformf.l80 + 0)
.s86:
1262 : c9 3f __ CMP #$3f
1264 : d0 0e __ BNE $1274 ; (nformf.s85 + 0)
.s87:
1266 : a5 45 __ LDA T0 + 2 
1268 : c9 80 __ CMP #$80
126a : d0 08 __ BNE $1274 ; (nformf.s85 + 0)
.s88:
126c : a5 44 __ LDA T0 + 1 
126e : d0 04 __ BNE $1274 ; (nformf.s85 + 0)
.s89:
1270 : a5 43 __ LDA T0 + 0 
1272 : f0 49 __ BEQ $12bd ; (nformf.s69 + 0)
.s85:
1274 : b0 47 __ BCS $12bd ; (nformf.s69 + 0)
.l80:
1276 : 38 __ __ SEC
1277 : a5 4f __ LDA T4 + 0 
1279 : e9 03 __ SBC #$03
127b : 85 4f __ STA T4 + 0 
127d : b0 02 __ BCS $1281 ; (nformf.s116 + 0)
.s115:
127f : c6 50 __ DEC T4 + 1 
.s116:
1281 : a9 00 __ LDA #$00
1283 : 85 1b __ STA ACCU + 0 
1285 : 85 1c __ STA ACCU + 1 
1287 : a9 7a __ LDA #$7a
1289 : 85 1d __ STA ACCU + 2 
128b : a9 44 __ LDA #$44
128d : 85 1e __ STA ACCU + 3 
128f : a2 43 __ LDX #$43
1291 : 20 d2 16 JSR $16d2 ; (freg + 4)
1294 : 20 00 18 JSR $1800 ; (crt_fmul + 0)
1297 : a5 1b __ LDA ACCU + 0 
1299 : 85 43 __ STA T0 + 0 
129b : a5 1c __ LDA ACCU + 1 
129d : 85 44 __ STA T0 + 1 
129f : a6 1d __ LDX ACCU + 2 
12a1 : 86 45 __ STX T0 + 2 
12a3 : a5 1e __ LDA ACCU + 3 
12a5 : 85 46 __ STA T0 + 3 
12a7 : 30 cd __ BMI $1276 ; (nformf.l80 + 0)
.s81:
12a9 : c9 3f __ CMP #$3f
12ab : 90 c9 __ BCC $1276 ; (nformf.l80 + 0)
.s122:
12ad : d0 0e __ BNE $12bd ; (nformf.s69 + 0)
.s82:
12af : e0 80 __ CPX #$80
12b1 : 90 c3 __ BCC $1276 ; (nformf.l80 + 0)
.s123:
12b3 : d0 08 __ BNE $12bd ; (nformf.s69 + 0)
.s83:
12b5 : a5 1c __ LDA ACCU + 1 
12b7 : d0 bb __ BNE $1274 ; (nformf.s85 + 0)
.s84:
12b9 : a5 1b __ LDA ACCU + 0 
12bb : d0 b7 __ BNE $1274 ; (nformf.s85 + 0)
.s69:
12bd : a5 46 __ LDA T0 + 3 
12bf : 30 63 __ BMI $1324 ; (nformf.s9 + 0)
.s75:
12c1 : c9 41 __ CMP #$41
12c3 : d0 0e __ BNE $12d3 ; (nformf.l79 + 0)
.s76:
12c5 : a5 45 __ LDA T0 + 2 
12c7 : c9 20 __ CMP #$20
12c9 : d0 08 __ BNE $12d3 ; (nformf.l79 + 0)
.s77:
12cb : a5 44 __ LDA T0 + 1 
12cd : d0 04 __ BNE $12d3 ; (nformf.l79 + 0)
.s78:
12cf : a5 43 __ LDA T0 + 0 
12d1 : f0 02 __ BEQ $12d5 ; (nformf.l70 + 0)
.l79:
12d3 : 90 4f __ BCC $1324 ; (nformf.s9 + 0)
.l70:
12d5 : e6 4f __ INC T4 + 0 
12d7 : d0 02 __ BNE $12db ; (nformf.s119 + 0)
.s118:
12d9 : e6 50 __ INC T4 + 1 
.s119:
12db : a5 43 __ LDA T0 + 0 
12dd : 85 1b __ STA ACCU + 0 
12df : a5 44 __ LDA T0 + 1 
12e1 : 85 1c __ STA ACCU + 1 
12e3 : a5 45 __ LDA T0 + 2 
12e5 : 85 1d __ STA ACCU + 2 
12e7 : a5 46 __ LDA T0 + 3 
12e9 : 85 1e __ STA ACCU + 3 
12eb : a9 00 __ LDA #$00
12ed : 85 03 __ STA WORK + 0 
12ef : 85 04 __ STA WORK + 1 
12f1 : a9 20 __ LDA #$20
12f3 : 85 05 __ STA WORK + 2 
12f5 : a9 41 __ LDA #$41
12f7 : 85 06 __ STA WORK + 3 
12f9 : 20 e2 16 JSR $16e2 ; (freg + 20)
12fc : 20 c8 18 JSR $18c8 ; (crt_fdiv + 0)
12ff : a5 1b __ LDA ACCU + 0 
1301 : 85 43 __ STA T0 + 0 
1303 : a5 1c __ LDA ACCU + 1 
1305 : 85 44 __ STA T0 + 1 
1307 : a6 1d __ LDX ACCU + 2 
1309 : 86 45 __ STX T0 + 2 
130b : a5 1e __ LDA ACCU + 3 
130d : 85 46 __ STA T0 + 3 
130f : 30 13 __ BMI $1324 ; (nformf.s9 + 0)
.s71:
1311 : c9 41 __ CMP #$41
1313 : d0 be __ BNE $12d3 ; (nformf.l79 + 0)
.s72:
1315 : e0 20 __ CPX #$20
1317 : d0 ba __ BNE $12d3 ; (nformf.l79 + 0)
.s73:
1319 : a5 1c __ LDA ACCU + 1 
131b : 38 __ __ SEC
131c : d0 b5 __ BNE $12d3 ; (nformf.l79 + 0)
.s74:
131e : a5 1b __ LDA ACCU + 0 
1320 : f0 b3 __ BEQ $12d5 ; (nformf.l70 + 0)
1322 : d0 af __ BNE $12d3 ; (nformf.l79 + 0)
.s9:
1324 : ad f2 9f LDA $9ff2 ; (sstack + 0)
1327 : c9 65 __ CMP #$65
1329 : d0 04 __ BNE $132f ; (nformf.s11 + 0)
.s10:
132b : a9 01 __ LDA #$01
132d : d0 02 __ BNE $1331 ; (nformf.s12 + 0)
.s11:
132f : a9 00 __ LDA #$00
.s12:
1331 : 85 55 __ STA T10 + 0 
1333 : a6 4d __ LDX T3 + 0 
1335 : e8 __ __ INX
1336 : 86 51 __ STX T5 + 0 
1338 : ad f2 9f LDA $9ff2 ; (sstack + 0)
133b : c9 67 __ CMP #$67
133d : d0 13 __ BNE $1352 ; (nformf.s13 + 0)
.s63:
133f : a5 50 __ LDA T4 + 1 
1341 : 30 08 __ BMI $134b ; (nformf.s64 + 0)
.s66:
1343 : d0 06 __ BNE $134b ; (nformf.s64 + 0)
.s65:
1345 : a5 4f __ LDA T4 + 0 
1347 : c9 04 __ CMP #$04
1349 : 90 07 __ BCC $1352 ; (nformf.s13 + 0)
.s64:
134b : a9 01 __ LDA #$01
134d : 85 55 __ STA T10 + 0 
134f : 4c db 15 JMP $15db ; (nformf.s53 + 0)
.s13:
1352 : a5 55 __ LDA T10 + 0 
1354 : d0 f9 __ BNE $134f ; (nformf.s64 + 4)
.s14:
1356 : 24 50 __ BIT T4 + 1 
1358 : 10 43 __ BPL $139d ; (nformf.s15 + 0)
.s52:
135a : a5 43 __ LDA T0 + 0 
135c : 85 1b __ STA ACCU + 0 
135e : a5 44 __ LDA T0 + 1 
1360 : 85 1c __ STA ACCU + 1 
1362 : a5 45 __ LDA T0 + 2 
1364 : 85 1d __ STA ACCU + 2 
1366 : a5 46 __ LDA T0 + 3 
1368 : 85 1e __ STA ACCU + 3 
.l108:
136a : a9 00 __ LDA #$00
136c : 85 03 __ STA WORK + 0 
136e : 85 04 __ STA WORK + 1 
1370 : a9 20 __ LDA #$20
1372 : 85 05 __ STA WORK + 2 
1374 : a9 41 __ LDA #$41
1376 : 85 06 __ STA WORK + 3 
1378 : 20 e2 16 JSR $16e2 ; (freg + 20)
137b : 20 c8 18 JSR $18c8 ; (crt_fdiv + 0)
137e : 18 __ __ CLC
137f : a5 4f __ LDA T4 + 0 
1381 : 69 01 __ ADC #$01
1383 : 85 4f __ STA T4 + 0 
1385 : a5 50 __ LDA T4 + 1 
1387 : 69 00 __ ADC #$00
1389 : 85 50 __ STA T4 + 1 
138b : 30 dd __ BMI $136a ; (nformf.l108 + 0)
.s109:
138d : a5 1e __ LDA ACCU + 3 
138f : 85 46 __ STA T0 + 3 
1391 : a5 1d __ LDA ACCU + 2 
1393 : 85 45 __ STA T0 + 2 
1395 : a5 1c __ LDA ACCU + 1 
1397 : 85 44 __ STA T0 + 1 
1399 : a5 1b __ LDA ACCU + 0 
139b : 85 43 __ STA T0 + 0 
.s15:
139d : 18 __ __ CLC
139e : a5 4d __ LDA T3 + 0 
13a0 : 65 4f __ ADC T4 + 0 
13a2 : 18 __ __ CLC
13a3 : 69 01 __ ADC #$01
13a5 : 85 51 __ STA T5 + 0 
13a7 : c9 07 __ CMP #$07
13a9 : 90 14 __ BCC $13bf ; (nformf.s51 + 0)
.s16:
13ab : ad e6 1b LDA $1be6 ; (fround5[0] + 24)
13ae : 85 47 __ STA T1 + 0 
13b0 : ad e7 1b LDA $1be7 ; (fround5[0] + 25)
13b3 : 85 48 __ STA T1 + 1 
13b5 : ad e8 1b LDA $1be8 ; (fround5[0] + 26)
13b8 : 85 49 __ STA T1 + 2 
13ba : ad e9 1b LDA $1be9 ; (fround5[0] + 27)
13bd : b0 15 __ BCS $13d4 ; (nformf.s17 + 0)
.s51:
13bf : 0a __ __ ASL
13c0 : 0a __ __ ASL
13c1 : aa __ __ TAX
13c2 : bd ca 1b LDA $1bca,x ; (divmod32 + 213)
13c5 : 85 47 __ STA T1 + 0 
13c7 : bd cb 1b LDA $1bcb,x ; (divmod32 + 214)
13ca : 85 48 __ STA T1 + 1 
13cc : bd cc 1b LDA $1bcc,x ; (spentry + 0)
13cf : 85 49 __ STA T1 + 2 
13d1 : bd cd 1b LDA $1bcd,x ; (giocharmap + 0)
.s17:
13d4 : 85 4a __ STA T1 + 3 
13d6 : a5 43 __ LDA T0 + 0 
13d8 : 85 1b __ STA ACCU + 0 
13da : a5 44 __ LDA T0 + 1 
13dc : 85 1c __ STA ACCU + 1 
13de : a5 45 __ LDA T0 + 2 
13e0 : 85 1d __ STA ACCU + 2 
13e2 : a5 46 __ LDA T0 + 3 
13e4 : 85 1e __ STA ACCU + 3 
13e6 : a2 47 __ LDX #$47
13e8 : 20 d2 16 JSR $16d2 ; (freg + 4)
13eb : 20 19 17 JSR $1719 ; (faddsub + 6)
13ee : a5 1c __ LDA ACCU + 1 
13f0 : 85 16 __ STA P9 ; (f + 1)
13f2 : a5 1d __ LDA ACCU + 2 
13f4 : 85 17 __ STA P10 ; (f + 2)
13f6 : a6 1b __ LDX ACCU + 0 
13f8 : a5 1e __ LDA ACCU + 3 
13fa : 85 18 __ STA P11 ; (f + 3)
13fc : 30 3a __ BMI $1438 ; (nformf.s18 + 0)
.s46:
13fe : c9 41 __ CMP #$41
1400 : d0 0d __ BNE $140f ; (nformf.s50 + 0)
.s47:
1402 : a5 17 __ LDA P10 ; (f + 2)
1404 : c9 20 __ CMP #$20
1406 : d0 07 __ BNE $140f ; (nformf.s50 + 0)
.s48:
1408 : a5 16 __ LDA P9 ; (f + 1)
140a : d0 03 __ BNE $140f ; (nformf.s50 + 0)
.s49:
140c : 8a __ __ TXA
140d : f0 02 __ BEQ $1411 ; (nformf.s45 + 0)
.s50:
140f : 90 27 __ BCC $1438 ; (nformf.s18 + 0)
.s45:
1411 : a9 00 __ LDA #$00
1413 : 85 03 __ STA WORK + 0 
1415 : 85 04 __ STA WORK + 1 
1417 : a9 20 __ LDA #$20
1419 : 85 05 __ STA WORK + 2 
141b : a9 41 __ LDA #$41
141d : 85 06 __ STA WORK + 3 
141f : 20 e2 16 JSR $16e2 ; (freg + 20)
1422 : 20 c8 18 JSR $18c8 ; (crt_fdiv + 0)
1425 : a5 1c __ LDA ACCU + 1 
1427 : 85 16 __ STA P9 ; (f + 1)
1429 : a5 1d __ LDA ACCU + 2 
142b : 85 17 __ STA P10 ; (f + 2)
142d : a5 1e __ LDA ACCU + 3 
142f : 85 18 __ STA P11 ; (f + 3)
1431 : a6 4d __ LDX T3 + 0 
1433 : ca __ __ DEX
1434 : 86 52 __ STX T6 + 0 
1436 : a6 1b __ LDX ACCU + 0 
.s18:
1438 : 38 __ __ SEC
1439 : a5 51 __ LDA T5 + 0 
143b : e5 52 __ SBC T6 + 0 
143d : 85 4d __ STA T3 + 0 
143f : a9 00 __ LDA #$00
1441 : e9 00 __ SBC #$00
1443 : 85 4e __ STA T3 + 1 
1445 : a9 14 __ LDA #$14
1447 : c5 51 __ CMP T5 + 0 
1449 : b0 02 __ BCS $144d ; (nformf.s19 + 0)
.s44:
144b : 85 51 __ STA T5 + 0 
.s19:
144d : a5 4d __ LDA T3 + 0 
144f : d0 08 __ BNE $1459 ; (nformf.s21 + 0)
.s20:
1451 : a9 30 __ LDA #$30
1453 : a4 54 __ LDY T9 + 0 
1455 : 91 13 __ STA (P6),y ; (str + 0)
1457 : e6 54 __ INC T9 + 0 
.s21:
1459 : a9 00 __ LDA #$00
145b : 85 56 __ STA T11 + 0 
145d : c5 4d __ CMP T3 + 0 
145f : f0 6f __ BEQ $14d0 ; (nformf.l43 + 0)
.s23:
1461 : c9 07 __ CMP #$07
1463 : 90 04 __ BCC $1469 ; (nformf.s24 + 0)
.l42:
1465 : a9 30 __ LDA #$30
1467 : b0 55 __ BCS $14be ; (nformf.l25 + 0)
.s24:
1469 : 86 1b __ STX ACCU + 0 
146b : 86 43 __ STX T0 + 0 
146d : a5 16 __ LDA P9 ; (f + 1)
146f : 85 1c __ STA ACCU + 1 
1471 : 85 44 __ STA T0 + 1 
1473 : a5 17 __ LDA P10 ; (f + 2)
1475 : 85 1d __ STA ACCU + 2 
1477 : 85 45 __ STA T0 + 2 
1479 : a5 18 __ LDA P11 ; (f + 3)
147b : 85 1e __ STA ACCU + 3 
147d : 85 46 __ STA T0 + 3 
147f : 20 62 1a JSR $1a62 ; (f32_to_i16 + 0)
1482 : a5 1b __ LDA ACCU + 0 
1484 : 85 53 __ STA T7 + 0 
1486 : 20 ae 1a JSR $1aae ; (sint16_to_float + 0)
1489 : a2 43 __ LDX #$43
148b : 20 d2 16 JSR $16d2 ; (freg + 4)
148e : a5 1e __ LDA ACCU + 3 
1490 : 49 80 __ EOR #$80
1492 : 85 1e __ STA ACCU + 3 
1494 : 20 19 17 JSR $1719 ; (faddsub + 6)
1497 : a9 00 __ LDA #$00
1499 : 85 03 __ STA WORK + 0 
149b : 85 04 __ STA WORK + 1 
149d : a9 20 __ LDA #$20
149f : 85 05 __ STA WORK + 2 
14a1 : a9 41 __ LDA #$41
14a3 : 85 06 __ STA WORK + 3 
14a5 : 20 e2 16 JSR $16e2 ; (freg + 20)
14a8 : 20 00 18 JSR $1800 ; (crt_fmul + 0)
14ab : a5 1c __ LDA ACCU + 1 
14ad : 85 16 __ STA P9 ; (f + 1)
14af : a5 1d __ LDA ACCU + 2 
14b1 : 85 17 __ STA P10 ; (f + 2)
14b3 : a5 1e __ LDA ACCU + 3 
14b5 : 85 18 __ STA P11 ; (f + 3)
14b7 : 18 __ __ CLC
14b8 : a5 53 __ LDA T7 + 0 
14ba : 69 30 __ ADC #$30
14bc : a6 1b __ LDX ACCU + 0 
.l25:
14be : a4 54 __ LDY T9 + 0 
14c0 : 91 13 __ STA (P6),y ; (str + 0)
14c2 : e6 54 __ INC T9 + 0 
14c4 : e6 56 __ INC T11 + 0 
14c6 : a5 56 __ LDA T11 + 0 
14c8 : c5 51 __ CMP T5 + 0 
14ca : b0 14 __ BCS $14e0 ; (nformf.s26 + 0)
.s22:
14cc : c5 4d __ CMP T3 + 0 
14ce : d0 91 __ BNE $1461 ; (nformf.s23 + 0)
.l43:
14d0 : a9 2e __ LDA #$2e
14d2 : a4 54 __ LDY T9 + 0 
14d4 : 91 13 __ STA (P6),y ; (str + 0)
14d6 : e6 54 __ INC T9 + 0 
14d8 : a5 56 __ LDA T11 + 0 
14da : c9 07 __ CMP #$07
14dc : 90 8b __ BCC $1469 ; (nformf.s24 + 0)
14de : b0 85 __ BCS $1465 ; (nformf.l42 + 0)
.s26:
14e0 : a5 55 __ LDA T10 + 0 
14e2 : f0 66 __ BEQ $154a ; (nformf.s27 + 0)
.s38:
14e4 : a0 03 __ LDY #$03
14e6 : b1 4b __ LDA (T2 + 0),y 
14e8 : 69 03 __ ADC #$03
14ea : a4 54 __ LDY T9 + 0 
14ec : 91 13 __ STA (P6),y ; (str + 0)
14ee : c8 __ __ INY
14ef : 84 54 __ STY T9 + 0 
14f1 : 24 50 __ BIT T4 + 1 
14f3 : 30 06 __ BMI $14fb ; (nformf.s41 + 0)
.s39:
14f5 : a9 2b __ LDA #$2b
14f7 : 91 13 __ STA (P6),y ; (str + 0)
14f9 : d0 11 __ BNE $150c ; (nformf.s40 + 0)
.s41:
14fb : a9 2d __ LDA #$2d
14fd : 91 13 __ STA (P6),y ; (str + 0)
14ff : 38 __ __ SEC
1500 : a9 00 __ LDA #$00
1502 : e5 4f __ SBC T4 + 0 
1504 : 85 4f __ STA T4 + 0 
1506 : a9 00 __ LDA #$00
1508 : e5 50 __ SBC T4 + 1 
150a : 85 50 __ STA T4 + 1 
.s40:
150c : e6 54 __ INC T9 + 0 
150e : a5 4f __ LDA T4 + 0 
1510 : 85 1b __ STA ACCU + 0 
1512 : a5 50 __ LDA T4 + 1 
1514 : 85 1c __ STA ACCU + 1 
1516 : a9 0a __ LDA #$0a
1518 : 85 03 __ STA WORK + 0 
151a : a9 00 __ LDA #$00
151c : 85 04 __ STA WORK + 1 
151e : 20 76 19 JSR $1976 ; (divs16 + 0)
1521 : 18 __ __ CLC
1522 : a5 1b __ LDA ACCU + 0 
1524 : 69 30 __ ADC #$30
1526 : a4 54 __ LDY T9 + 0 
1528 : 91 13 __ STA (P6),y ; (str + 0)
152a : e6 54 __ INC T9 + 0 
152c : a5 4f __ LDA T4 + 0 
152e : 85 1b __ STA ACCU + 0 
1530 : a5 50 __ LDA T4 + 1 
1532 : 85 1c __ STA ACCU + 1 
1534 : a9 0a __ LDA #$0a
1536 : 85 03 __ STA WORK + 0 
1538 : a9 00 __ LDA #$00
153a : 85 04 __ STA WORK + 1 
153c : 20 35 1a JSR $1a35 ; (mods16 + 0)
153f : 18 __ __ CLC
1540 : a5 05 __ LDA WORK + 2 
1542 : 69 30 __ ADC #$30
1544 : a4 54 __ LDY T9 + 0 
1546 : 91 13 __ STA (P6),y ; (str + 0)
1548 : e6 54 __ INC T9 + 0 
.s27:
154a : a5 54 __ LDA T9 + 0 
154c : a0 01 __ LDY #$01
154e : d1 11 __ CMP (P4),y ; (si + 0)
1550 : b0 6d __ BCS $15bf ; (nformf.s3 + 0)
.s28:
1552 : a0 06 __ LDY #$06
1554 : b1 11 __ LDA (P4),y ; (si + 0)
1556 : f0 04 __ BEQ $155c ; (nformf.s29 + 0)
.s110:
1558 : a6 54 __ LDX T9 + 0 
155a : 90 70 __ BCC $15cc ; (nformf.l36 + 0)
.s29:
155c : a5 54 __ LDA T9 + 0 
155e : f0 40 __ BEQ $15a0 ; (nformf.s30 + 0)
.s35:
1560 : e9 00 __ SBC #$00
1562 : a8 __ __ TAY
1563 : a9 00 __ LDA #$00
1565 : e9 00 __ SBC #$00
1567 : aa __ __ TAX
1568 : 98 __ __ TYA
1569 : 18 __ __ CLC
156a : 65 13 __ ADC P6 ; (str + 0)
156c : 85 47 __ STA T1 + 0 
156e : 8a __ __ TXA
156f : 65 14 __ ADC P7 ; (str + 1)
1571 : 85 48 __ STA T1 + 1 
1573 : a9 01 __ LDA #$01
1575 : 85 4d __ STA T3 + 0 
1577 : a6 54 __ LDX T9 + 0 
1579 : 38 __ __ SEC
.l111:
157a : a0 01 __ LDY #$01
157c : b1 11 __ LDA (P4),y ; (si + 0)
157e : e5 4d __ SBC T3 + 0 
1580 : 85 4b __ STA T2 + 0 
1582 : a9 00 __ LDA #$00
1584 : e5 4e __ SBC T3 + 1 
1586 : 18 __ __ CLC
1587 : 65 14 __ ADC P7 ; (str + 1)
1589 : 85 4c __ STA T2 + 1 
158b : 88 __ __ DEY
158c : b1 47 __ LDA (T1 + 0),y 
158e : a4 13 __ LDY P6 ; (str + 0)
1590 : 91 4b __ STA (T2 + 0),y 
1592 : a5 47 __ LDA T1 + 0 
1594 : d0 02 __ BNE $1598 ; (nformf.s114 + 0)
.s113:
1596 : c6 48 __ DEC T1 + 1 
.s114:
1598 : c6 47 __ DEC T1 + 0 
159a : e6 4d __ INC T3 + 0 
159c : e4 4d __ CPX T3 + 0 
159e : b0 da __ BCS $157a ; (nformf.l111 + 0)
.s30:
15a0 : a9 00 __ LDA #$00
15a2 : 85 4d __ STA T3 + 0 
15a4 : 90 08 __ BCC $15ae ; (nformf.l31 + 0)
.s33:
15a6 : a9 20 __ LDA #$20
15a8 : a4 4d __ LDY T3 + 0 
15aa : 91 13 __ STA (P6),y ; (str + 0)
15ac : e6 4d __ INC T3 + 0 
.l31:
15ae : a0 01 __ LDY #$01
15b0 : b1 11 __ LDA (P4),y ; (si + 0)
15b2 : 38 __ __ SEC
15b3 : e5 54 __ SBC T9 + 0 
15b5 : 90 ef __ BCC $15a6 ; (nformf.s33 + 0)
.s34:
15b7 : c5 4d __ CMP T3 + 0 
15b9 : 90 02 __ BCC $15bd ; (nformf.s32 + 0)
.s112:
15bb : d0 e9 __ BNE $15a6 ; (nformf.s33 + 0)
.s32:
15bd : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
15bf : 85 1b __ STA ACCU + 0 
15c1 : a2 03 __ LDX #$03
15c3 : bd e9 9f LDA $9fe9,x ; (nformf@stack + 0)
15c6 : 95 53 __ STA T7 + 0,x 
15c8 : ca __ __ DEX
15c9 : 10 f8 __ BPL $15c3 ; (nformf.s3 + 4)
15cb : 60 __ __ RTS
.l36:
15cc : 8a __ __ TXA
15cd : a0 01 __ LDY #$01
15cf : d1 11 __ CMP (P4),y ; (si + 0)
15d1 : b0 ea __ BCS $15bd ; (nformf.s32 + 0)
.s37:
15d3 : a8 __ __ TAY
15d4 : a9 20 __ LDA #$20
15d6 : 91 13 __ STA (P6),y ; (str + 0)
15d8 : e8 __ __ INX
15d9 : 90 f1 __ BCC $15cc ; (nformf.l36 + 0)
.s53:
15db : a5 51 __ LDA T5 + 0 
15dd : c9 07 __ CMP #$07
15df : 90 14 __ BCC $15f5 ; (nformf.s62 + 0)
.s54:
15e1 : ad e6 1b LDA $1be6 ; (fround5[0] + 24)
15e4 : 85 47 __ STA T1 + 0 
15e6 : ad e7 1b LDA $1be7 ; (fround5[0] + 25)
15e9 : 85 48 __ STA T1 + 1 
15eb : ad e8 1b LDA $1be8 ; (fround5[0] + 26)
15ee : 85 49 __ STA T1 + 2 
15f0 : ad e9 1b LDA $1be9 ; (fround5[0] + 27)
15f3 : b0 15 __ BCS $160a ; (nformf.s55 + 0)
.s62:
15f5 : 0a __ __ ASL
15f6 : 0a __ __ ASL
15f7 : aa __ __ TAX
15f8 : bd ca 1b LDA $1bca,x ; (divmod32 + 213)
15fb : 85 47 __ STA T1 + 0 
15fd : bd cb 1b LDA $1bcb,x ; (divmod32 + 214)
1600 : 85 48 __ STA T1 + 1 
1602 : bd cc 1b LDA $1bcc,x ; (spentry + 0)
1605 : 85 49 __ STA T1 + 2 
1607 : bd cd 1b LDA $1bcd,x ; (giocharmap + 0)
.s55:
160a : 85 4a __ STA T1 + 3 
160c : a5 43 __ LDA T0 + 0 
160e : 85 1b __ STA ACCU + 0 
1610 : a5 44 __ LDA T0 + 1 
1612 : 85 1c __ STA ACCU + 1 
1614 : a5 45 __ LDA T0 + 2 
1616 : 85 1d __ STA ACCU + 2 
1618 : a5 46 __ LDA T0 + 3 
161a : 85 1e __ STA ACCU + 3 
161c : a2 47 __ LDX #$47
161e : 20 d2 16 JSR $16d2 ; (freg + 4)
1621 : 20 19 17 JSR $1719 ; (faddsub + 6)
1624 : a5 1c __ LDA ACCU + 1 
1626 : 85 16 __ STA P9 ; (f + 1)
1628 : a5 1d __ LDA ACCU + 2 
162a : 85 17 __ STA P10 ; (f + 2)
162c : a6 1b __ LDX ACCU + 0 
162e : a5 1e __ LDA ACCU + 3 
1630 : 85 18 __ STA P11 ; (f + 3)
1632 : 10 03 __ BPL $1637 ; (nformf.s57 + 0)
1634 : 4c 38 14 JMP $1438 ; (nformf.s18 + 0)
.s57:
1637 : c9 41 __ CMP #$41
1639 : d0 0d __ BNE $1648 ; (nformf.s61 + 0)
.s58:
163b : a5 17 __ LDA P10 ; (f + 2)
163d : c9 20 __ CMP #$20
163f : d0 07 __ BNE $1648 ; (nformf.s61 + 0)
.s59:
1641 : a5 16 __ LDA P9 ; (f + 1)
1643 : d0 03 __ BNE $1648 ; (nformf.s61 + 0)
.s60:
1645 : 8a __ __ TXA
1646 : f0 02 __ BEQ $164a ; (nformf.s56 + 0)
.s61:
1648 : 90 ea __ BCC $1634 ; (nformf.s55 + 42)
.s56:
164a : a9 00 __ LDA #$00
164c : 85 03 __ STA WORK + 0 
164e : 85 04 __ STA WORK + 1 
1650 : a9 20 __ LDA #$20
1652 : 85 05 __ STA WORK + 2 
1654 : a9 41 __ LDA #$41
1656 : 85 06 __ STA WORK + 3 
1658 : 20 e2 16 JSR $16e2 ; (freg + 20)
165b : 20 c8 18 JSR $18c8 ; (crt_fdiv + 0)
165e : a5 1c __ LDA ACCU + 1 
1660 : 85 16 __ STA P9 ; (f + 1)
1662 : a5 1d __ LDA ACCU + 2 
1664 : 85 17 __ STA P10 ; (f + 2)
1666 : a5 1e __ LDA ACCU + 3 
1668 : 85 18 __ STA P11 ; (f + 3)
166a : a6 1b __ LDX ACCU + 0 
166c : e6 4f __ INC T4 + 0 
166e : d0 c4 __ BNE $1634 ; (nformf.s55 + 42)
.s117:
1670 : e6 50 __ INC T4 + 1 
1672 : 4c 38 14 JMP $1438 ; (nformf.s18 + 0)
.s102:
1675 : 86 43 __ STX T0 + 0 
1677 : 85 47 __ STA T1 + 0 
1679 : a0 03 __ LDY #$03
167b : b1 11 __ LDA (P4),y ; (si + 0)
167d : 18 __ __ CLC
167e : 69 08 __ ADC #$08
1680 : a4 43 __ LDY T0 + 0 
1682 : 91 13 __ STA (P6),y ; (str + 0)
1684 : 18 __ __ CLC
1685 : a0 03 __ LDY #$03
1687 : b1 11 __ LDA (P4),y ; (si + 0)
1689 : 69 0d __ ADC #$0d
168b : a4 43 __ LDY T0 + 0 
168d : c8 __ __ INY
168e : 91 13 __ STA (P6),y ; (str + 0)
1690 : a0 03 __ LDY #$03
1692 : b1 11 __ LDA (P4),y ; (si + 0)
1694 : 18 __ __ CLC
1695 : 69 05 __ ADC #$05
1697 : a4 47 __ LDY T1 + 0 
1699 : 91 13 __ STA (P6),y ; (str + 0)
169b : 18 __ __ CLC
169c : a5 54 __ LDA T9 + 0 
169e : 69 03 __ ADC #$03
16a0 : 85 54 __ STA T9 + 0 
16a2 : 4c 4a 15 JMP $154a ; (nformf.s27 + 0)
.s104:
16a5 : 20 b6 16 JSR $16b6 ; (isinf.s4 + 0)
16a8 : a2 01 __ LDX #$01
16aa : 86 54 __ STX T9 + 0 
16ac : a8 __ __ TAY
16ad : d0 03 __ BNE $16b2 ; (nformf.s105 + 0)
16af : 4c bf 11 JMP $11bf ; (nformf.s7 + 0)
.s105:
16b2 : a9 03 __ LDA #$03
16b4 : d0 bf __ BNE $1675 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
16b6 : 06 0f __ ASL P2 ; (f + 2)
16b8 : a5 10 __ LDA P3 ; (f + 3)
16ba : 2a __ __ ROL
16bb : c9 ff __ CMP #$ff
16bd : d0 03 __ BNE $16c2 ; (isinf.s6 + 0)
.s5:
16bf : a9 01 __ LDA #$01
16c1 : 60 __ __ RTS
.s6:
16c2 : a9 00 __ LDA #$00
.s3:
16c4 : 60 __ __ RTS
--------------------------------------------------------------------
16c5 : __ __ __ BYT 25 73 20 3a 20 25 75 0a 00                      : %s : %u..
--------------------------------------------------------------------
freg: ; freg
16ce : b1 19 __ LDA (IP + 0),y 
16d0 : c8 __ __ INY
16d1 : aa __ __ TAX
16d2 : b5 00 __ LDA $00,x 
16d4 : 85 03 __ STA WORK + 0 
16d6 : b5 01 __ LDA $01,x 
16d8 : 85 04 __ STA WORK + 1 
16da : b5 02 __ LDA $02,x 
16dc : 85 05 __ STA WORK + 2 
16de : b5 03 __ LDA WORK + 0,x 
16e0 : 85 06 __ STA WORK + 3 
16e2 : a5 05 __ LDA WORK + 2 
16e4 : 0a __ __ ASL
16e5 : a5 06 __ LDA WORK + 3 
16e7 : 2a __ __ ROL
16e8 : 85 08 __ STA WORK + 5 
16ea : f0 06 __ BEQ $16f2 ; (freg + 36)
16ec : a5 05 __ LDA WORK + 2 
16ee : 09 80 __ ORA #$80
16f0 : 85 05 __ STA WORK + 2 
16f2 : a5 1d __ LDA ACCU + 2 
16f4 : 0a __ __ ASL
16f5 : a5 1e __ LDA ACCU + 3 
16f7 : 2a __ __ ROL
16f8 : 85 07 __ STA WORK + 4 
16fa : f0 06 __ BEQ $1702 ; (freg + 52)
16fc : a5 1d __ LDA ACCU + 2 
16fe : 09 80 __ ORA #$80
1700 : 85 1d __ STA ACCU + 2 
1702 : 60 __ __ RTS
1703 : 06 1e __ ASL ACCU + 3 
1705 : a5 07 __ LDA WORK + 4 
1707 : 6a __ __ ROR
1708 : 85 1e __ STA ACCU + 3 
170a : b0 06 __ BCS $1712 ; (freg + 68)
170c : a5 1d __ LDA ACCU + 2 
170e : 29 7f __ AND #$7f
1710 : 85 1d __ STA ACCU + 2 
1712 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1713 : a5 06 __ LDA WORK + 3 
1715 : 49 80 __ EOR #$80
1717 : 85 06 __ STA WORK + 3 
1719 : a9 ff __ LDA #$ff
171b : c5 07 __ CMP WORK + 4 
171d : f0 04 __ BEQ $1723 ; (faddsub + 16)
171f : c5 08 __ CMP WORK + 5 
1721 : d0 11 __ BNE $1734 ; (faddsub + 33)
1723 : a5 1e __ LDA ACCU + 3 
1725 : 09 7f __ ORA #$7f
1727 : 85 1e __ STA ACCU + 3 
1729 : a9 80 __ LDA #$80
172b : 85 1d __ STA ACCU + 2 
172d : a9 00 __ LDA #$00
172f : 85 1b __ STA ACCU + 0 
1731 : 85 1c __ STA ACCU + 1 
1733 : 60 __ __ RTS
1734 : 38 __ __ SEC
1735 : a5 07 __ LDA WORK + 4 
1737 : e5 08 __ SBC WORK + 5 
1739 : f0 38 __ BEQ $1773 ; (faddsub + 96)
173b : aa __ __ TAX
173c : b0 25 __ BCS $1763 ; (faddsub + 80)
173e : e0 e9 __ CPX #$e9
1740 : b0 0e __ BCS $1750 ; (faddsub + 61)
1742 : a5 08 __ LDA WORK + 5 
1744 : 85 07 __ STA WORK + 4 
1746 : a9 00 __ LDA #$00
1748 : 85 1b __ STA ACCU + 0 
174a : 85 1c __ STA ACCU + 1 
174c : 85 1d __ STA ACCU + 2 
174e : f0 23 __ BEQ $1773 ; (faddsub + 96)
1750 : a5 1d __ LDA ACCU + 2 
1752 : 4a __ __ LSR
1753 : 66 1c __ ROR ACCU + 1 
1755 : 66 1b __ ROR ACCU + 0 
1757 : e8 __ __ INX
1758 : d0 f8 __ BNE $1752 ; (faddsub + 63)
175a : 85 1d __ STA ACCU + 2 
175c : a5 08 __ LDA WORK + 5 
175e : 85 07 __ STA WORK + 4 
1760 : 4c 73 17 JMP $1773 ; (faddsub + 96)
1763 : e0 18 __ CPX #$18
1765 : b0 33 __ BCS $179a ; (faddsub + 135)
1767 : a5 05 __ LDA WORK + 2 
1769 : 4a __ __ LSR
176a : 66 04 __ ROR WORK + 1 
176c : 66 03 __ ROR WORK + 0 
176e : ca __ __ DEX
176f : d0 f8 __ BNE $1769 ; (faddsub + 86)
1771 : 85 05 __ STA WORK + 2 
1773 : a5 1e __ LDA ACCU + 3 
1775 : 29 80 __ AND #$80
1777 : 85 1e __ STA ACCU + 3 
1779 : 45 06 __ EOR WORK + 3 
177b : 30 31 __ BMI $17ae ; (faddsub + 155)
177d : 18 __ __ CLC
177e : a5 1b __ LDA ACCU + 0 
1780 : 65 03 __ ADC WORK + 0 
1782 : 85 1b __ STA ACCU + 0 
1784 : a5 1c __ LDA ACCU + 1 
1786 : 65 04 __ ADC WORK + 1 
1788 : 85 1c __ STA ACCU + 1 
178a : a5 1d __ LDA ACCU + 2 
178c : 65 05 __ ADC WORK + 2 
178e : 85 1d __ STA ACCU + 2 
1790 : 90 08 __ BCC $179a ; (faddsub + 135)
1792 : 66 1d __ ROR ACCU + 2 
1794 : 66 1c __ ROR ACCU + 1 
1796 : 66 1b __ ROR ACCU + 0 
1798 : e6 07 __ INC WORK + 4 
179a : a5 07 __ LDA WORK + 4 
179c : c9 ff __ CMP #$ff
179e : f0 83 __ BEQ $1723 ; (faddsub + 16)
17a0 : 4a __ __ LSR
17a1 : 05 1e __ ORA ACCU + 3 
17a3 : 85 1e __ STA ACCU + 3 
17a5 : b0 06 __ BCS $17ad ; (faddsub + 154)
17a7 : a5 1d __ LDA ACCU + 2 
17a9 : 29 7f __ AND #$7f
17ab : 85 1d __ STA ACCU + 2 
17ad : 60 __ __ RTS
17ae : 38 __ __ SEC
17af : a5 1b __ LDA ACCU + 0 
17b1 : e5 03 __ SBC WORK + 0 
17b3 : 85 1b __ STA ACCU + 0 
17b5 : a5 1c __ LDA ACCU + 1 
17b7 : e5 04 __ SBC WORK + 1 
17b9 : 85 1c __ STA ACCU + 1 
17bb : a5 1d __ LDA ACCU + 2 
17bd : e5 05 __ SBC WORK + 2 
17bf : 85 1d __ STA ACCU + 2 
17c1 : b0 19 __ BCS $17dc ; (faddsub + 201)
17c3 : 38 __ __ SEC
17c4 : a9 00 __ LDA #$00
17c6 : e5 1b __ SBC ACCU + 0 
17c8 : 85 1b __ STA ACCU + 0 
17ca : a9 00 __ LDA #$00
17cc : e5 1c __ SBC ACCU + 1 
17ce : 85 1c __ STA ACCU + 1 
17d0 : a9 00 __ LDA #$00
17d2 : e5 1d __ SBC ACCU + 2 
17d4 : 85 1d __ STA ACCU + 2 
17d6 : a5 1e __ LDA ACCU + 3 
17d8 : 49 80 __ EOR #$80
17da : 85 1e __ STA ACCU + 3 
17dc : a5 1d __ LDA ACCU + 2 
17de : 30 ba __ BMI $179a ; (faddsub + 135)
17e0 : 05 1c __ ORA ACCU + 1 
17e2 : 05 1b __ ORA ACCU + 0 
17e4 : f0 0f __ BEQ $17f5 ; (faddsub + 226)
17e6 : c6 07 __ DEC WORK + 4 
17e8 : f0 0b __ BEQ $17f5 ; (faddsub + 226)
17ea : 06 1b __ ASL ACCU + 0 
17ec : 26 1c __ ROL ACCU + 1 
17ee : 26 1d __ ROL ACCU + 2 
17f0 : 10 f4 __ BPL $17e6 ; (faddsub + 211)
17f2 : 4c 9a 17 JMP $179a ; (faddsub + 135)
17f5 : a9 00 __ LDA #$00
17f7 : 85 1b __ STA ACCU + 0 
17f9 : 85 1c __ STA ACCU + 1 
17fb : 85 1d __ STA ACCU + 2 
17fd : 85 1e __ STA ACCU + 3 
17ff : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1800 : a5 1b __ LDA ACCU + 0 
1802 : 05 1c __ ORA ACCU + 1 
1804 : 05 1d __ ORA ACCU + 2 
1806 : f0 0e __ BEQ $1816 ; (crt_fmul + 22)
1808 : a5 03 __ LDA WORK + 0 
180a : 05 04 __ ORA WORK + 1 
180c : 05 05 __ ORA WORK + 2 
180e : d0 09 __ BNE $1819 ; (crt_fmul + 25)
1810 : 85 1b __ STA ACCU + 0 
1812 : 85 1c __ STA ACCU + 1 
1814 : 85 1d __ STA ACCU + 2 
1816 : 85 1e __ STA ACCU + 3 
1818 : 60 __ __ RTS
1819 : a5 1e __ LDA ACCU + 3 
181b : 45 06 __ EOR WORK + 3 
181d : 29 80 __ AND #$80
181f : 85 1e __ STA ACCU + 3 
1821 : a9 ff __ LDA #$ff
1823 : c5 07 __ CMP WORK + 4 
1825 : f0 42 __ BEQ $1869 ; (crt_fmul + 105)
1827 : c5 08 __ CMP WORK + 5 
1829 : f0 3e __ BEQ $1869 ; (crt_fmul + 105)
182b : a9 00 __ LDA #$00
182d : 85 09 __ STA WORK + 6 
182f : 85 0a __ STA WORK + 7 
1831 : 85 0b __ STA WORK + 8 
1833 : a4 1b __ LDY ACCU + 0 
1835 : a5 03 __ LDA WORK + 0 
1837 : d0 06 __ BNE $183f ; (crt_fmul + 63)
1839 : a5 04 __ LDA WORK + 1 
183b : f0 0a __ BEQ $1847 ; (crt_fmul + 71)
183d : d0 05 __ BNE $1844 ; (crt_fmul + 68)
183f : 20 9a 18 JSR $189a ; (crt_fmul8 + 0)
1842 : a5 04 __ LDA WORK + 1 
1844 : 20 9a 18 JSR $189a ; (crt_fmul8 + 0)
1847 : a5 05 __ LDA WORK + 2 
1849 : 20 9a 18 JSR $189a ; (crt_fmul8 + 0)
184c : 38 __ __ SEC
184d : a5 0b __ LDA WORK + 8 
184f : 30 06 __ BMI $1857 ; (crt_fmul + 87)
1851 : 06 09 __ ASL WORK + 6 
1853 : 26 0a __ ROL WORK + 7 
1855 : 2a __ __ ROL
1856 : 18 __ __ CLC
1857 : 29 7f __ AND #$7f
1859 : 85 0b __ STA WORK + 8 
185b : a5 07 __ LDA WORK + 4 
185d : 65 08 __ ADC WORK + 5 
185f : 90 19 __ BCC $187a ; (crt_fmul + 122)
1861 : e9 7f __ SBC #$7f
1863 : b0 04 __ BCS $1869 ; (crt_fmul + 105)
1865 : c9 ff __ CMP #$ff
1867 : d0 15 __ BNE $187e ; (crt_fmul + 126)
1869 : a5 1e __ LDA ACCU + 3 
186b : 09 7f __ ORA #$7f
186d : 85 1e __ STA ACCU + 3 
186f : a9 80 __ LDA #$80
1871 : 85 1d __ STA ACCU + 2 
1873 : a9 00 __ LDA #$00
1875 : 85 1b __ STA ACCU + 0 
1877 : 85 1c __ STA ACCU + 1 
1879 : 60 __ __ RTS
187a : e9 7e __ SBC #$7e
187c : 90 15 __ BCC $1893 ; (crt_fmul + 147)
187e : 4a __ __ LSR
187f : 05 1e __ ORA ACCU + 3 
1881 : 85 1e __ STA ACCU + 3 
1883 : a9 00 __ LDA #$00
1885 : 6a __ __ ROR
1886 : 05 0b __ ORA WORK + 8 
1888 : 85 1d __ STA ACCU + 2 
188a : a5 0a __ LDA WORK + 7 
188c : 85 1c __ STA ACCU + 1 
188e : a5 09 __ LDA WORK + 6 
1890 : 85 1b __ STA ACCU + 0 
1892 : 60 __ __ RTS
1893 : a9 00 __ LDA #$00
1895 : 85 1e __ STA ACCU + 3 
1897 : f0 d8 __ BEQ $1871 ; (crt_fmul + 113)
1899 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
189a : 38 __ __ SEC
189b : 6a __ __ ROR
189c : 90 1e __ BCC $18bc ; (crt_fmul8 + 34)
189e : aa __ __ TAX
189f : 18 __ __ CLC
18a0 : 98 __ __ TYA
18a1 : 65 09 __ ADC WORK + 6 
18a3 : 85 09 __ STA WORK + 6 
18a5 : a5 0a __ LDA WORK + 7 
18a7 : 65 1c __ ADC ACCU + 1 
18a9 : 85 0a __ STA WORK + 7 
18ab : a5 0b __ LDA WORK + 8 
18ad : 65 1d __ ADC ACCU + 2 
18af : 6a __ __ ROR
18b0 : 85 0b __ STA WORK + 8 
18b2 : 8a __ __ TXA
18b3 : 66 0a __ ROR WORK + 7 
18b5 : 66 09 __ ROR WORK + 6 
18b7 : 4a __ __ LSR
18b8 : f0 0d __ BEQ $18c7 ; (crt_fmul8 + 45)
18ba : b0 e2 __ BCS $189e ; (crt_fmul8 + 4)
18bc : 66 0b __ ROR WORK + 8 
18be : 66 0a __ ROR WORK + 7 
18c0 : 66 09 __ ROR WORK + 6 
18c2 : 4a __ __ LSR
18c3 : 90 f7 __ BCC $18bc ; (crt_fmul8 + 34)
18c5 : d0 d7 __ BNE $189e ; (crt_fmul8 + 4)
18c7 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
18c8 : a5 1b __ LDA ACCU + 0 
18ca : 05 1c __ ORA ACCU + 1 
18cc : 05 1d __ ORA ACCU + 2 
18ce : d0 03 __ BNE $18d3 ; (crt_fdiv + 11)
18d0 : 85 1e __ STA ACCU + 3 
18d2 : 60 __ __ RTS
18d3 : a5 1e __ LDA ACCU + 3 
18d5 : 45 06 __ EOR WORK + 3 
18d7 : 29 80 __ AND #$80
18d9 : 85 1e __ STA ACCU + 3 
18db : a5 08 __ LDA WORK + 5 
18dd : f0 62 __ BEQ $1941 ; (crt_fdiv + 121)
18df : a5 07 __ LDA WORK + 4 
18e1 : c9 ff __ CMP #$ff
18e3 : f0 5c __ BEQ $1941 ; (crt_fdiv + 121)
18e5 : a9 00 __ LDA #$00
18e7 : 85 09 __ STA WORK + 6 
18e9 : 85 0a __ STA WORK + 7 
18eb : 85 0b __ STA WORK + 8 
18ed : a2 18 __ LDX #$18
18ef : a5 1b __ LDA ACCU + 0 
18f1 : c5 03 __ CMP WORK + 0 
18f3 : a5 1c __ LDA ACCU + 1 
18f5 : e5 04 __ SBC WORK + 1 
18f7 : a5 1d __ LDA ACCU + 2 
18f9 : e5 05 __ SBC WORK + 2 
18fb : 90 13 __ BCC $1910 ; (crt_fdiv + 72)
18fd : a5 1b __ LDA ACCU + 0 
18ff : e5 03 __ SBC WORK + 0 
1901 : 85 1b __ STA ACCU + 0 
1903 : a5 1c __ LDA ACCU + 1 
1905 : e5 04 __ SBC WORK + 1 
1907 : 85 1c __ STA ACCU + 1 
1909 : a5 1d __ LDA ACCU + 2 
190b : e5 05 __ SBC WORK + 2 
190d : 85 1d __ STA ACCU + 2 
190f : 38 __ __ SEC
1910 : 26 09 __ ROL WORK + 6 
1912 : 26 0a __ ROL WORK + 7 
1914 : 26 0b __ ROL WORK + 8 
1916 : ca __ __ DEX
1917 : f0 0a __ BEQ $1923 ; (crt_fdiv + 91)
1919 : 06 1b __ ASL ACCU + 0 
191b : 26 1c __ ROL ACCU + 1 
191d : 26 1d __ ROL ACCU + 2 
191f : b0 dc __ BCS $18fd ; (crt_fdiv + 53)
1921 : 90 cc __ BCC $18ef ; (crt_fdiv + 39)
1923 : 38 __ __ SEC
1924 : a5 0b __ LDA WORK + 8 
1926 : 30 06 __ BMI $192e ; (crt_fdiv + 102)
1928 : 06 09 __ ASL WORK + 6 
192a : 26 0a __ ROL WORK + 7 
192c : 2a __ __ ROL
192d : 18 __ __ CLC
192e : 29 7f __ AND #$7f
1930 : 85 0b __ STA WORK + 8 
1932 : a5 07 __ LDA WORK + 4 
1934 : e5 08 __ SBC WORK + 5 
1936 : 90 1a __ BCC $1952 ; (crt_fdiv + 138)
1938 : 18 __ __ CLC
1939 : 69 7f __ ADC #$7f
193b : b0 04 __ BCS $1941 ; (crt_fdiv + 121)
193d : c9 ff __ CMP #$ff
193f : d0 15 __ BNE $1956 ; (crt_fdiv + 142)
1941 : a5 1e __ LDA ACCU + 3 
1943 : 09 7f __ ORA #$7f
1945 : 85 1e __ STA ACCU + 3 
1947 : a9 80 __ LDA #$80
1949 : 85 1d __ STA ACCU + 2 
194b : a9 00 __ LDA #$00
194d : 85 1c __ STA ACCU + 1 
194f : 85 1b __ STA ACCU + 0 
1951 : 60 __ __ RTS
1952 : 69 7f __ ADC #$7f
1954 : 90 15 __ BCC $196b ; (crt_fdiv + 163)
1956 : 4a __ __ LSR
1957 : 05 1e __ ORA ACCU + 3 
1959 : 85 1e __ STA ACCU + 3 
195b : a9 00 __ LDA #$00
195d : 6a __ __ ROR
195e : 05 0b __ ORA WORK + 8 
1960 : 85 1d __ STA ACCU + 2 
1962 : a5 0a __ LDA WORK + 7 
1964 : 85 1c __ STA ACCU + 1 
1966 : a5 09 __ LDA WORK + 6 
1968 : 85 1b __ STA ACCU + 0 
196a : 60 __ __ RTS
196b : a9 00 __ LDA #$00
196d : 85 1e __ STA ACCU + 3 
196f : 85 1d __ STA ACCU + 2 
1971 : 85 1c __ STA ACCU + 1 
1973 : 85 1b __ STA ACCU + 0 
1975 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1976 : 24 1c __ BIT ACCU + 1 
1978 : 10 0d __ BPL $1987 ; (divs16 + 17)
197a : 20 94 19 JSR $1994 ; (negaccu + 0)
197d : 24 04 __ BIT WORK + 1 
197f : 10 0d __ BPL $198e ; (divs16 + 24)
1981 : 20 a2 19 JSR $19a2 ; (negtmp + 0)
1984 : 4c b0 19 JMP $19b0 ; (divmod + 0)
1987 : 24 04 __ BIT WORK + 1 
1989 : 10 f9 __ BPL $1984 ; (divs16 + 14)
198b : 20 a2 19 JSR $19a2 ; (negtmp + 0)
198e : 20 b0 19 JSR $19b0 ; (divmod + 0)
1991 : 4c 94 19 JMP $1994 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
1994 : 38 __ __ SEC
1995 : a9 00 __ LDA #$00
1997 : e5 1b __ SBC ACCU + 0 
1999 : 85 1b __ STA ACCU + 0 
199b : a9 00 __ LDA #$00
199d : e5 1c __ SBC ACCU + 1 
199f : 85 1c __ STA ACCU + 1 
19a1 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
19a2 : 38 __ __ SEC
19a3 : a9 00 __ LDA #$00
19a5 : e5 03 __ SBC WORK + 0 
19a7 : 85 03 __ STA WORK + 0 
19a9 : a9 00 __ LDA #$00
19ab : e5 04 __ SBC WORK + 1 
19ad : 85 04 __ STA WORK + 1 
19af : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
19b0 : a5 1c __ LDA ACCU + 1 
19b2 : d0 31 __ BNE $19e5 ; (divmod + 53)
19b4 : a5 04 __ LDA WORK + 1 
19b6 : d0 1e __ BNE $19d6 ; (divmod + 38)
19b8 : 85 06 __ STA WORK + 3 
19ba : a2 04 __ LDX #$04
19bc : 06 1b __ ASL ACCU + 0 
19be : 2a __ __ ROL
19bf : c5 03 __ CMP WORK + 0 
19c1 : 90 02 __ BCC $19c5 ; (divmod + 21)
19c3 : e5 03 __ SBC WORK + 0 
19c5 : 26 1b __ ROL ACCU + 0 
19c7 : 2a __ __ ROL
19c8 : c5 03 __ CMP WORK + 0 
19ca : 90 02 __ BCC $19ce ; (divmod + 30)
19cc : e5 03 __ SBC WORK + 0 
19ce : 26 1b __ ROL ACCU + 0 
19d0 : ca __ __ DEX
19d1 : d0 eb __ BNE $19be ; (divmod + 14)
19d3 : 85 05 __ STA WORK + 2 
19d5 : 60 __ __ RTS
19d6 : a5 1b __ LDA ACCU + 0 
19d8 : 85 05 __ STA WORK + 2 
19da : a5 1c __ LDA ACCU + 1 
19dc : 85 06 __ STA WORK + 3 
19de : a9 00 __ LDA #$00
19e0 : 85 1b __ STA ACCU + 0 
19e2 : 85 1c __ STA ACCU + 1 
19e4 : 60 __ __ RTS
19e5 : a5 04 __ LDA WORK + 1 
19e7 : d0 1f __ BNE $1a08 ; (divmod + 88)
19e9 : a5 03 __ LDA WORK + 0 
19eb : 30 1b __ BMI $1a08 ; (divmod + 88)
19ed : a9 00 __ LDA #$00
19ef : 85 06 __ STA WORK + 3 
19f1 : a2 10 __ LDX #$10
19f3 : 06 1b __ ASL ACCU + 0 
19f5 : 26 1c __ ROL ACCU + 1 
19f7 : 2a __ __ ROL
19f8 : c5 03 __ CMP WORK + 0 
19fa : 90 02 __ BCC $19fe ; (divmod + 78)
19fc : e5 03 __ SBC WORK + 0 
19fe : 26 1b __ ROL ACCU + 0 
1a00 : 26 1c __ ROL ACCU + 1 
1a02 : ca __ __ DEX
1a03 : d0 f2 __ BNE $19f7 ; (divmod + 71)
1a05 : 85 05 __ STA WORK + 2 
1a07 : 60 __ __ RTS
1a08 : a9 00 __ LDA #$00
1a0a : 85 05 __ STA WORK + 2 
1a0c : 85 06 __ STA WORK + 3 
1a0e : 84 02 __ STY $02 
1a10 : a0 10 __ LDY #$10
1a12 : 18 __ __ CLC
1a13 : 26 1b __ ROL ACCU + 0 
1a15 : 26 1c __ ROL ACCU + 1 
1a17 : 26 05 __ ROL WORK + 2 
1a19 : 26 06 __ ROL WORK + 3 
1a1b : 38 __ __ SEC
1a1c : a5 05 __ LDA WORK + 2 
1a1e : e5 03 __ SBC WORK + 0 
1a20 : aa __ __ TAX
1a21 : a5 06 __ LDA WORK + 3 
1a23 : e5 04 __ SBC WORK + 1 
1a25 : 90 04 __ BCC $1a2b ; (divmod + 123)
1a27 : 86 05 __ STX WORK + 2 
1a29 : 85 06 __ STA WORK + 3 
1a2b : 88 __ __ DEY
1a2c : d0 e5 __ BNE $1a13 ; (divmod + 99)
1a2e : 26 1b __ ROL ACCU + 0 
1a30 : 26 1c __ ROL ACCU + 1 
1a32 : a4 02 __ LDY $02 
1a34 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
1a35 : 24 1c __ BIT ACCU + 1 
1a37 : 10 10 __ BPL $1a49 ; (mods16 + 20)
1a39 : 20 94 19 JSR $1994 ; (negaccu + 0)
1a3c : 24 04 __ BIT WORK + 1 
1a3e : 10 03 __ BPL $1a43 ; (mods16 + 14)
1a40 : 20 a2 19 JSR $19a2 ; (negtmp + 0)
1a43 : 20 b0 19 JSR $19b0 ; (divmod + 0)
1a46 : 4c 54 1a JMP $1a54 ; (negtmpb + 0)
1a49 : 24 04 __ BIT WORK + 1 
1a4b : 10 03 __ BPL $1a50 ; (mods16 + 27)
1a4d : 20 a2 19 JSR $19a2 ; (negtmp + 0)
1a50 : 4c b0 19 JMP $19b0 ; (divmod + 0)
1a53 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
1a54 : 38 __ __ SEC
1a55 : a9 00 __ LDA #$00
1a57 : e5 05 __ SBC WORK + 2 
1a59 : 85 05 __ STA WORK + 2 
1a5b : a9 00 __ LDA #$00
1a5d : e5 06 __ SBC WORK + 3 
1a5f : 85 06 __ STA WORK + 3 
1a61 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1a62 : 20 f2 16 JSR $16f2 ; (freg + 36)
1a65 : a5 07 __ LDA WORK + 4 
1a67 : c9 7f __ CMP #$7f
1a69 : b0 07 __ BCS $1a72 ; (f32_to_i16 + 16)
1a6b : a9 00 __ LDA #$00
1a6d : 85 1b __ STA ACCU + 0 
1a6f : 85 1c __ STA ACCU + 1 
1a71 : 60 __ __ RTS
1a72 : e9 8e __ SBC #$8e
1a74 : 90 16 __ BCC $1a8c ; (f32_to_i16 + 42)
1a76 : 24 1e __ BIT ACCU + 3 
1a78 : 30 09 __ BMI $1a83 ; (f32_to_i16 + 33)
1a7a : a9 ff __ LDA #$ff
1a7c : 85 1b __ STA ACCU + 0 
1a7e : a9 7f __ LDA #$7f
1a80 : 85 1c __ STA ACCU + 1 
1a82 : 60 __ __ RTS
1a83 : a9 00 __ LDA #$00
1a85 : 85 1b __ STA ACCU + 0 
1a87 : a9 80 __ LDA #$80
1a89 : 85 1c __ STA ACCU + 1 
1a8b : 60 __ __ RTS
1a8c : aa __ __ TAX
1a8d : a5 1c __ LDA ACCU + 1 
1a8f : 46 1d __ LSR ACCU + 2 
1a91 : 6a __ __ ROR
1a92 : e8 __ __ INX
1a93 : d0 fa __ BNE $1a8f ; (f32_to_i16 + 45)
1a95 : 24 1e __ BIT ACCU + 3 
1a97 : 10 0e __ BPL $1aa7 ; (f32_to_i16 + 69)
1a99 : 38 __ __ SEC
1a9a : 49 ff __ EOR #$ff
1a9c : 69 00 __ ADC #$00
1a9e : 85 1b __ STA ACCU + 0 
1aa0 : a9 00 __ LDA #$00
1aa2 : e5 1d __ SBC ACCU + 2 
1aa4 : 85 1c __ STA ACCU + 1 
1aa6 : 60 __ __ RTS
1aa7 : 85 1b __ STA ACCU + 0 
1aa9 : a5 1d __ LDA ACCU + 2 
1aab : 85 1c __ STA ACCU + 1 
1aad : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1aae : 24 1c __ BIT ACCU + 1 
1ab0 : 30 03 __ BMI $1ab5 ; (sint16_to_float + 7)
1ab2 : 4c cc 1a JMP $1acc ; (uint16_to_float + 0)
1ab5 : 38 __ __ SEC
1ab6 : a9 00 __ LDA #$00
1ab8 : e5 1b __ SBC ACCU + 0 
1aba : 85 1b __ STA ACCU + 0 
1abc : a9 00 __ LDA #$00
1abe : e5 1c __ SBC ACCU + 1 
1ac0 : 85 1c __ STA ACCU + 1 
1ac2 : 20 cc 1a JSR $1acc ; (uint16_to_float + 0)
1ac5 : a5 1e __ LDA ACCU + 3 
1ac7 : 09 80 __ ORA #$80
1ac9 : 85 1e __ STA ACCU + 3 
1acb : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1acc : a5 1b __ LDA ACCU + 0 
1ace : 05 1c __ ORA ACCU + 1 
1ad0 : d0 05 __ BNE $1ad7 ; (uint16_to_float + 11)
1ad2 : 85 1d __ STA ACCU + 2 
1ad4 : 85 1e __ STA ACCU + 3 
1ad6 : 60 __ __ RTS
1ad7 : a2 8e __ LDX #$8e
1ad9 : a5 1c __ LDA ACCU + 1 
1adb : 30 06 __ BMI $1ae3 ; (uint16_to_float + 23)
1add : ca __ __ DEX
1ade : 06 1b __ ASL ACCU + 0 
1ae0 : 2a __ __ ROL
1ae1 : 10 fa __ BPL $1add ; (uint16_to_float + 17)
1ae3 : 0a __ __ ASL
1ae4 : 85 1d __ STA ACCU + 2 
1ae6 : a5 1b __ LDA ACCU + 0 
1ae8 : 85 1c __ STA ACCU + 1 
1aea : 8a __ __ TXA
1aeb : 4a __ __ LSR
1aec : 85 1e __ STA ACCU + 3 
1aee : a9 00 __ LDA #$00
1af0 : 85 1b __ STA ACCU + 0 
1af2 : 66 1d __ ROR ACCU + 2 
1af4 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
1af5 : 84 02 __ STY $02 
1af7 : a0 20 __ LDY #$20
1af9 : a9 00 __ LDA #$00
1afb : 85 07 __ STA WORK + 4 
1afd : 85 08 __ STA WORK + 5 
1aff : 85 09 __ STA WORK + 6 
1b01 : 85 0a __ STA WORK + 7 
1b03 : a5 05 __ LDA WORK + 2 
1b05 : 05 06 __ ORA WORK + 3 
1b07 : d0 78 __ BNE $1b81 ; (divmod32 + 140)
1b09 : a5 04 __ LDA WORK + 1 
1b0b : d0 27 __ BNE $1b34 ; (divmod32 + 63)
1b0d : 18 __ __ CLC
1b0e : 26 1b __ ROL ACCU + 0 
1b10 : 26 1c __ ROL ACCU + 1 
1b12 : 26 1d __ ROL ACCU + 2 
1b14 : 26 1e __ ROL ACCU + 3 
1b16 : 2a __ __ ROL
1b17 : 90 05 __ BCC $1b1e ; (divmod32 + 41)
1b19 : e5 03 __ SBC WORK + 0 
1b1b : 38 __ __ SEC
1b1c : b0 06 __ BCS $1b24 ; (divmod32 + 47)
1b1e : c5 03 __ CMP WORK + 0 
1b20 : 90 02 __ BCC $1b24 ; (divmod32 + 47)
1b22 : e5 03 __ SBC WORK + 0 
1b24 : 88 __ __ DEY
1b25 : d0 e7 __ BNE $1b0e ; (divmod32 + 25)
1b27 : 85 07 __ STA WORK + 4 
1b29 : 26 1b __ ROL ACCU + 0 
1b2b : 26 1c __ ROL ACCU + 1 
1b2d : 26 1d __ ROL ACCU + 2 
1b2f : 26 1e __ ROL ACCU + 3 
1b31 : a4 02 __ LDY $02 
1b33 : 60 __ __ RTS
1b34 : a5 1e __ LDA ACCU + 3 
1b36 : d0 10 __ BNE $1b48 ; (divmod32 + 83)
1b38 : a6 1d __ LDX ACCU + 2 
1b3a : 86 1e __ STX ACCU + 3 
1b3c : a6 1c __ LDX ACCU + 1 
1b3e : 86 1d __ STX ACCU + 2 
1b40 : a6 1b __ LDX ACCU + 0 
1b42 : 86 1c __ STX ACCU + 1 
1b44 : 85 1b __ STA ACCU + 0 
1b46 : a0 18 __ LDY #$18
1b48 : 18 __ __ CLC
1b49 : 26 1b __ ROL ACCU + 0 
1b4b : 26 1c __ ROL ACCU + 1 
1b4d : 26 1d __ ROL ACCU + 2 
1b4f : 26 1e __ ROL ACCU + 3 
1b51 : 26 07 __ ROL WORK + 4 
1b53 : 26 08 __ ROL WORK + 5 
1b55 : 90 0c __ BCC $1b63 ; (divmod32 + 110)
1b57 : a5 07 __ LDA WORK + 4 
1b59 : e5 03 __ SBC WORK + 0 
1b5b : aa __ __ TAX
1b5c : a5 08 __ LDA WORK + 5 
1b5e : e5 04 __ SBC WORK + 1 
1b60 : 38 __ __ SEC
1b61 : b0 0c __ BCS $1b6f ; (divmod32 + 122)
1b63 : 38 __ __ SEC
1b64 : a5 07 __ LDA WORK + 4 
1b66 : e5 03 __ SBC WORK + 0 
1b68 : aa __ __ TAX
1b69 : a5 08 __ LDA WORK + 5 
1b6b : e5 04 __ SBC WORK + 1 
1b6d : 90 04 __ BCC $1b73 ; (divmod32 + 126)
1b6f : 86 07 __ STX WORK + 4 
1b71 : 85 08 __ STA WORK + 5 
1b73 : 88 __ __ DEY
1b74 : d0 d3 __ BNE $1b49 ; (divmod32 + 84)
1b76 : 26 1b __ ROL ACCU + 0 
1b78 : 26 1c __ ROL ACCU + 1 
1b7a : 26 1d __ ROL ACCU + 2 
1b7c : 26 1e __ ROL ACCU + 3 
1b7e : a4 02 __ LDY $02 
1b80 : 60 __ __ RTS
1b81 : a0 10 __ LDY #$10
1b83 : a5 1e __ LDA ACCU + 3 
1b85 : 85 08 __ STA WORK + 5 
1b87 : a5 1d __ LDA ACCU + 2 
1b89 : 85 07 __ STA WORK + 4 
1b8b : a9 00 __ LDA #$00
1b8d : 85 1d __ STA ACCU + 2 
1b8f : 85 1e __ STA ACCU + 3 
1b91 : 18 __ __ CLC
1b92 : 26 1b __ ROL ACCU + 0 
1b94 : 26 1c __ ROL ACCU + 1 
1b96 : 26 07 __ ROL WORK + 4 
1b98 : 26 08 __ ROL WORK + 5 
1b9a : 26 09 __ ROL WORK + 6 
1b9c : 26 0a __ ROL WORK + 7 
1b9e : a5 07 __ LDA WORK + 4 
1ba0 : c5 03 __ CMP WORK + 0 
1ba2 : a5 08 __ LDA WORK + 5 
1ba4 : e5 04 __ SBC WORK + 1 
1ba6 : a5 09 __ LDA WORK + 6 
1ba8 : e5 05 __ SBC WORK + 2 
1baa : aa __ __ TAX
1bab : a5 0a __ LDA WORK + 7 
1bad : e5 06 __ SBC WORK + 3 
1baf : 90 11 __ BCC $1bc2 ; (divmod32 + 205)
1bb1 : 86 09 __ STX WORK + 6 
1bb3 : 85 0a __ STA WORK + 7 
1bb5 : a5 07 __ LDA WORK + 4 
1bb7 : e5 03 __ SBC WORK + 0 
1bb9 : 85 07 __ STA WORK + 4 
1bbb : a5 08 __ LDA WORK + 5 
1bbd : e5 04 __ SBC WORK + 1 
1bbf : 85 08 __ STA WORK + 5 
1bc1 : 38 __ __ SEC
1bc2 : 88 __ __ DEY
1bc3 : d0 cd __ BNE $1b92 ; (divmod32 + 157)
1bc5 : 26 1b __ ROL ACCU + 0 
1bc7 : 26 1c __ ROL ACCU + 1 
1bc9 : a4 02 __ LDY $02 
1bcb : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1bcc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
1bcd : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
1bce : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
1bde : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
krnio_pstatus:
1bea : __ __ __ BSS	16
--------------------------------------------------------------------
score:
1c00 : __ __ __ BSS	28
