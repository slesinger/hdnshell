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
080e : 8e c5 0a STX $0ac5 ; (spentry + 0)
0811 : a2 0a __ LDX #$0a
0813 : a0 c7 __ LDY #$c7
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0a __ CPX #$0a
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 d7 __ CPY #$d7
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
;   9, "/home/honza/projects/c64/projects/oscar64/samples/memmap/charsetload.c"
.s4:
0880 : a9 12 __ LDA #$12
0882 : 85 0d __ STA P0 
0884 : a9 09 __ LDA #$09
0886 : 85 0e __ STA P1 
0888 : 20 fc 08 JSR $08fc ; (krnio_setnam.s4 + 0)
088b : a9 02 __ LDA #$02
088d : 85 0d __ STA P0 
088f : 85 0f __ STA P2 
0891 : a9 08 __ LDA #$08
0893 : 85 0e __ STA P1 
0895 : 20 1e 09 JSR $091e ; (krnio_open.s4 + 0)
0898 : aa __ __ TAX
0899 : f0 14 __ BEQ $08af ; (main.s5 + 0)
.s7:
089b : a9 02 __ LDA #$02
089d : 85 0e __ STA P1 
089f : a9 c0 __ LDA #$c0
08a1 : 85 10 __ STA P3 
08a3 : a9 00 __ LDA #$00
08a5 : 85 0f __ STA P2 
08a7 : 20 4c 09 JSR $094c ; (krnio_read_lzo.s4 + 0)
08aa : a9 02 __ LDA #$02
08ac : 20 2f 0a JSR $0a2f ; (krnio_close.s4 + 0)
.s5:
08af : a9 00 __ LDA #$00
08b1 : 85 0d __ STA P0 
08b3 : 85 10 __ STA P3 
08b5 : 85 0e __ STA P1 
08b7 : a9 cc __ LDA #$cc
08b9 : 85 44 __ STA T1 + 1 
08bb : 85 0f __ STA P2 
08bd : a9 c0 __ LDA #$c0
08bf : 85 11 __ STA P4 
08c1 : 20 37 0a JSR $0a37 ; (vic_setmode.s4 + 0)
08c4 : a0 00 __ LDY #$00
08c6 : 84 43 __ STY T1 + 0 
08c8 : 84 1c __ STY ACCU + 1 
08ca : a2 00 __ LDX #$00
.l8:
08cc : 8a __ __ TXA
08cd : 91 43 __ STA (T1 + 0),y 
08cf : c8 __ __ INY
08d0 : d0 02 __ BNE $08d4 ; (main.s11 + 0)
.s10:
08d2 : e6 44 __ INC T1 + 1 
.s11:
08d4 : e8 __ __ INX
08d5 : d0 02 __ BNE $08d9 ; (main.s13 + 0)
.s12:
08d7 : e6 1c __ INC ACCU + 1 
.s13:
08d9 : a5 1c __ LDA ACCU + 1 
08db : c9 03 __ CMP #$03
08dd : d0 ed __ BNE $08cc ; (main.l8 + 0)
.s9:
08df : e0 e8 __ CPX #$e8
08e1 : d0 e9 __ BNE $08cc ; (main.l8 + 0)
.s6:
08e3 : 20 89 0a JSR $0a89 ; (getpch.s4 + 0)
08e6 : a9 04 __ LDA #$04
08e8 : 85 0f __ STA P2 
08ea : a9 10 __ LDA #$10
08ec : 85 11 __ STA P4 
08ee : 20 37 0a JSR $0a37 ; (vic_setmode.s4 + 0)
08f1 : a9 00 __ LDA #$00
08f3 : 85 1b __ STA ACCU + 0 
08f5 : 85 1c __ STA ACCU + 1 
08f7 : a9 37 __ LDA #$37
08f9 : 85 01 __ STA $01 
.s3:
08fb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
08fc : a5 0d __ LDA P0 
08fe : 05 0e __ ORA P1 
0900 : f0 08 __ BEQ $090a ; (krnio_setnam.s4 + 14)
0902 : a0 ff __ LDY #$ff
0904 : c8 __ __ INY
0905 : b1 0d __ LDA (P0),y 
0907 : d0 fb __ BNE $0904 ; (krnio_setnam.s4 + 8)
0909 : 98 __ __ TYA
090a : a6 0d __ LDX P0 
090c : a4 0e __ LDY P1 
090e : 20 bd ff JSR $ffbd 
.s3:
0911 : 60 __ __ RTS
--------------------------------------------------------------------
0912 : __ __ __ BYT 43 48 41 52 53 45 54 2c 50 2c 52 00             : CHARSET,P,R.
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
091e : a9 00 __ LDA #$00
0920 : a6 0d __ LDX P0 ; (fnum + 0)
0922 : 9d c7 0a STA $0ac7,x ; (krnio_pstatus[0] + 0)
0925 : a9 00 __ LDA #$00
0927 : 85 1b __ STA ACCU + 0 
0929 : 85 1c __ STA ACCU + 1 
092b : a5 0d __ LDA P0 ; (fnum + 0)
092d : a6 0e __ LDX P1 
092f : a4 0f __ LDY P2 
0931 : 20 ba ff JSR $ffba 
0934 : 20 c0 ff JSR $ffc0 
0937 : 90 08 __ BCC $0941 ; (krnio_open.s4 + 35)
0939 : a5 0d __ LDA P0 ; (fnum + 0)
093b : 20 c3 ff JSR $ffc3 
093e : 4c 45 09 JMP $0945 ; (krnio_open.s4 + 39)
0941 : a9 01 __ LDA #$01
0943 : 85 1b __ STA ACCU + 0 
0945 : a5 1b __ LDA ACCU + 0 
0947 : f0 02 __ BEQ $094b ; (krnio_open.s3 + 0)
.s5:
0949 : a9 01 __ LDA #$01
.s3:
094b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read_lzo: ; krnio_read_lzo(u8,u8*)->i16
;  93, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
094c : a6 0e __ LDX P1 ; (fnum + 0)
094e : bd c7 0a LDA $0ac7,x ; (krnio_pstatus[0] + 0)
0951 : c9 40 __ CMP #$40
0953 : d0 07 __ BNE $095c ; (krnio_read_lzo.s5 + 0)
.s18:
0955 : a9 00 __ LDA #$00
.s21:
0957 : 85 1b __ STA ACCU + 0 
.s3:
0959 : 85 1c __ STA ACCU + 1 
095b : 60 __ __ RTS
.s5:
095c : 86 46 __ STX T4 + 0 
095e : 8a __ __ TXA
095f : 20 02 0a JSR $0a02 ; (krnio_chkin.s4 + 0)
0962 : aa __ __ TAX
0963 : d0 04 __ BNE $0969 ; (krnio_read_lzo.s7 + 0)
.s6:
0965 : a9 ff __ LDA #$ff
0967 : d0 ee __ BNE $0957 ; (krnio_read_lzo.s21 + 0)
.s7:
0969 : a9 00 __ LDA #$00
096b : 85 47 __ STA T5 + 0 
096d : 85 48 __ STA T5 + 1 
.l8:
096f : 85 45 __ STA T2 + 0 
.l9:
0971 : 20 17 0a JSR $0a17 ; (krnio_chrin.s4 + 0)
0974 : 85 43 __ STA T1 + 0 
0976 : 20 1f 0a JSR $0a1f ; (krnio_status.s4 + 0)
0979 : 85 1d __ STA ACCU + 2 
097b : aa __ __ TAX
097c : f0 04 __ BEQ $0982 ; (krnio_read_lzo.s10 + 0)
.s17:
097e : c9 40 __ CMP #$40
0980 : d0 21 __ BNE $09a3 ; (krnio_read_lzo.s26 + 0)
.s10:
0982 : a5 45 __ LDA T2 + 0 
0984 : 30 41 __ BMI $09c7 ; (krnio_read_lzo.s16 + 0)
.s11:
0986 : d0 20 __ BNE $09a8 ; (krnio_read_lzo.s15 + 0)
.s12:
0988 : a5 43 __ LDA T1 + 0 
098a : f0 17 __ BEQ $09a3 ; (krnio_read_lzo.s26 + 0)
.s14:
098c : 85 45 __ STA T2 + 0 
098e : a5 1d __ LDA ACCU + 2 
0990 : f0 df __ BEQ $0971 ; (krnio_read_lzo.l9 + 0)
.s13:
0992 : a6 46 __ LDX T4 + 0 
0994 : 9d c7 0a STA $0ac7,x ; (krnio_pstatus[0] + 0)
0997 : 20 2b 0a JSR $0a2b ; (krnio_clrchn.s4 + 0)
099a : a5 47 __ LDA T5 + 0 
099c : 85 1b __ STA ACCU + 0 
099e : a5 48 __ LDA T5 + 1 
09a0 : 4c 59 09 JMP $0959 ; (krnio_read_lzo.s3 + 0)
.s26:
09a3 : a5 1d __ LDA ACCU + 2 
09a5 : 4c 92 09 JMP $0992 ; (krnio_read_lzo.s13 + 0)
.s15:
09a8 : a5 47 __ LDA T5 + 0 
09aa : 85 1b __ STA ACCU + 0 
09ac : 18 __ __ CLC
09ad : a5 10 __ LDA P3 ; (data + 1)
09af : 65 48 __ ADC T5 + 1 
09b1 : 85 1c __ STA ACCU + 1 
09b3 : a5 43 __ LDA T1 + 0 
09b5 : a4 0f __ LDY P2 ; (data + 0)
09b7 : 91 1b __ STA (ACCU + 0),y 
09b9 : c6 45 __ DEC T2 + 0 
09bb : e6 47 __ INC T5 + 0 
09bd : d0 02 __ BNE $09c1 ; (krnio_read_lzo.s25 + 0)
.s24:
09bf : e6 48 __ INC T5 + 1 
.s25:
09c1 : a5 1d __ LDA ACCU + 2 
09c3 : d0 cd __ BNE $0992 ; (krnio_read_lzo.s13 + 0)
09c5 : f0 aa __ BEQ $0971 ; (krnio_read_lzo.l9 + 0)
.s16:
09c7 : 18 __ __ CLC
09c8 : a5 0f __ LDA P2 ; (data + 0)
09ca : 65 47 __ ADC T5 + 0 
09cc : 85 1b __ STA ACCU + 0 
09ce : a5 10 __ LDA P3 ; (data + 1)
09d0 : 65 48 __ ADC T5 + 1 
09d2 : 85 1c __ STA ACCU + 1 
09d4 : 38 __ __ SEC
09d5 : a5 1b __ LDA ACCU + 0 
09d7 : e5 43 __ SBC T1 + 0 
09d9 : 85 43 __ STA T1 + 0 
09db : a5 1c __ LDA ACCU + 1 
09dd : e9 00 __ SBC #$00
09df : 85 44 __ STA T1 + 1 
09e1 : a5 45 __ LDA T2 + 0 
09e3 : 29 7f __ AND #$7f
09e5 : 85 1e __ STA ACCU + 3 
09e7 : 18 __ __ CLC
09e8 : 65 47 __ ADC T5 + 0 
09ea : 85 47 __ STA T5 + 0 
09ec : 90 02 __ BCC $09f0 ; (krnio_read_lzo.s23 + 0)
.s22:
09ee : e6 48 __ INC T5 + 1 
.s23:
09f0 : a0 00 __ LDY #$00
.l19:
09f2 : b1 43 __ LDA (T1 + 0),y 
09f4 : 91 1b __ STA (ACCU + 0),y 
09f6 : c8 __ __ INY
09f7 : c4 1e __ CPY ACCU + 3 
09f9 : d0 f7 __ BNE $09f2 ; (krnio_read_lzo.l19 + 0)
.s20:
09fb : a5 1d __ LDA ACCU + 2 
09fd : d0 93 __ BNE $0992 ; (krnio_read_lzo.s13 + 0)
09ff : 4c 6f 09 JMP $096f ; (krnio_read_lzo.l8 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a02 : 85 0d __ STA P0 
0a04 : a6 0d __ LDX P0 
0a06 : 20 c6 ff JSR $ffc6 
0a09 : a9 00 __ LDA #$00
0a0b : 2a __ __ ROL
0a0c : 49 01 __ EOR #$01
0a0e : 85 1b __ STA ACCU + 0 
0a10 : a5 1b __ LDA ACCU + 0 
0a12 : f0 02 __ BEQ $0a16 ; (krnio_chkin.s3 + 0)
.s5:
0a14 : a9 01 __ LDA #$01
.s3:
0a16 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a17 : 20 cf ff JSR $ffcf 
0a1a : 85 1b __ STA ACCU + 0 
.s3:
0a1c : a5 1b __ LDA ACCU + 0 
0a1e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a1f : 20 b7 ff JSR $ffb7 
0a22 : 85 1b __ STA ACCU + 0 
0a24 : a9 00 __ LDA #$00
0a26 : 85 1c __ STA ACCU + 1 
.s3:
0a28 : a5 1b __ LDA ACCU + 0 
0a2a : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a2b : 20 cc ff JSR $ffcc 
.s3:
0a2e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a2f : 85 0d __ STA P0 
0a31 : a5 0d __ LDA P0 
0a33 : 20 c3 ff JSR $ffc3 
.s3:
0a36 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0a37 : a4 0d __ LDY P0 ; (mode + 0)
0a39 : c0 02 __ CPY #$02
0a3b : d0 09 __ BNE $0a46 ; (vic_setmode.s5 + 0)
.s10:
0a3d : a9 5b __ LDA #$5b
0a3f : 8d 11 d0 STA $d011 
.s8:
0a42 : a9 08 __ LDA #$08
0a44 : d0 0c __ BNE $0a52 ; (vic_setmode.s7 + 0)
.s5:
0a46 : b0 36 __ BCS $0a7e ; (vic_setmode.s6 + 0)
.s9:
0a48 : a9 1b __ LDA #$1b
0a4a : 8d 11 d0 STA $d011 
0a4d : 98 __ __ TYA
0a4e : f0 f2 __ BEQ $0a42 ; (vic_setmode.s8 + 0)
.s11:
0a50 : a9 18 __ LDA #$18
.s7:
0a52 : 8d 16 d0 STA $d016 
0a55 : ad 00 dd LDA $dd00 
0a58 : 29 fc __ AND #$fc
0a5a : 85 1b __ STA ACCU + 0 
0a5c : a5 0f __ LDA P2 ; (text + 1)
0a5e : 0a __ __ ASL
0a5f : 2a __ __ ROL
0a60 : 29 01 __ AND #$01
0a62 : 2a __ __ ROL
0a63 : 49 03 __ EOR #$03
0a65 : 05 1b __ ORA ACCU + 0 
0a67 : 8d 00 dd STA $dd00 
0a6a : a5 0f __ LDA P2 ; (text + 1)
0a6c : 29 3c __ AND #$3c
0a6e : 0a __ __ ASL
0a6f : 0a __ __ ASL
0a70 : 85 1b __ STA ACCU + 0 
0a72 : a5 11 __ LDA P4 ; (font + 1)
0a74 : 29 38 __ AND #$38
0a76 : 4a __ __ LSR
0a77 : 4a __ __ LSR
0a78 : 05 1b __ ORA ACCU + 0 
0a7a : 8d 18 d0 STA $d018 
.s3:
0a7d : 60 __ __ RTS
.s6:
0a7e : a9 3b __ LDA #$3b
0a80 : 8d 11 d0 STA $d011 
0a83 : c0 03 __ CPY #$03
0a85 : d0 c9 __ BNE $0a50 ; (vic_setmode.s11 + 0)
0a87 : f0 b9 __ BEQ $0a42 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
getpch: ; getpch()->u8
;  70, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0a89 : 20 cf ff JSR $ffcf 
0a8c : 85 1b __ STA ACCU + 0 
0a8e : a5 1b __ LDA ACCU + 0 
0a90 : 4c 93 0a JMP $0a93 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
0a93 : a8 __ __ TAY
0a94 : ad c6 0a LDA $0ac6 ; (giocharmap + 0)
0a97 : f0 27 __ BEQ $0ac0 ; (convch.s5 + 0)
.s6:
0a99 : c0 0d __ CPY #$0d
0a9b : d0 03 __ BNE $0aa0 ; (convch.s7 + 0)
.s16:
0a9d : a9 0a __ LDA #$0a
.s3:
0a9f : 60 __ __ RTS
.s7:
0aa0 : c9 02 __ CMP #$02
0aa2 : 90 1c __ BCC $0ac0 ; (convch.s5 + 0)
.s8:
0aa4 : 98 __ __ TYA
0aa5 : c0 41 __ CPY #$41
0aa7 : 90 17 __ BCC $0ac0 ; (convch.s5 + 0)
.s9:
0aa9 : c9 db __ CMP #$db
0aab : b0 13 __ BCS $0ac0 ; (convch.s5 + 0)
.s10:
0aad : c9 c1 __ CMP #$c1
0aaf : 90 03 __ BCC $0ab4 ; (convch.s11 + 0)
.s15:
0ab1 : 49 a0 __ EOR #$a0
0ab3 : a8 __ __ TAY
.s11:
0ab4 : c9 7b __ CMP #$7b
0ab6 : b0 08 __ BCS $0ac0 ; (convch.s5 + 0)
.s12:
0ab8 : c9 61 __ CMP #$61
0aba : b0 06 __ BCS $0ac2 ; (convch.s14 + 0)
.s13:
0abc : c9 5b __ CMP #$5b
0abe : 90 02 __ BCC $0ac2 ; (convch.s14 + 0)
.s5:
0ac0 : 98 __ __ TYA
0ac1 : 60 __ __ RTS
.s14:
0ac2 : 49 20 __ EOR #$20
0ac4 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0ac5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
0ac6 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
krnio_pstatus:
0ac7 : __ __ __ BSS	16
