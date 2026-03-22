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
080e : 8e 66 0b STX $0b66 ; (spentry + 0)
0811 : a2 0b __ LDX #$0b
0813 : a0 68 __ LDY #$68
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0b __ CPX #$0b
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 80 __ CPY #$80
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
;  13, "/home/honza/projects/c64/projects/oscar64/samples/kernalio/hiresread.c"
.s4:
0880 : a9 28 __ LDA #$28
0882 : 85 11 __ STA P4 
0884 : a9 19 __ LDA #$19
0886 : 85 12 __ STA P5 
0888 : 20 3b 09 JSR $093b ; (mmap_trampoline.s4 + 0)
088b : a9 68 __ LDA #$68
088d : 85 0d __ STA P0 
088f : a9 e0 __ LDA #$e0
0891 : 85 10 __ STA P3 
0893 : a9 0b __ LDA #$0b
0895 : 85 0e __ STA P1 
0897 : a9 00 __ LDA #$00
0899 : 85 0f __ STA P2 
089b : 20 85 09 JSR $0985 ; (bm_init.s4 + 0)
089e : a9 00 __ LDA #$00
08a0 : 85 0d __ STA P0 
08a2 : 85 10 __ STA P3 
08a4 : a9 30 __ LDA #$30
08a6 : 85 01 __ STA $01 
08a8 : a9 e0 __ LDA #$e0
08aa : 85 0e __ STA P1 
08ac : a9 1f __ LDA #$1f
08ae : 85 12 __ STA P5 
08b0 : a9 40 __ LDA #$40
08b2 : 85 11 __ STA P4 
08b4 : 20 b7 09 JSR $09b7 ; (memset.s4 + 0)
08b7 : a9 70 __ LDA #$70
08b9 : a2 fa __ LDX #$fa
.l6:
08bb : ca __ __ DEX
08bc : 9d 00 d0 STA $d000,x 
08bf : 9d fa d0 STA $d0fa,x 
08c2 : 9d f4 d1 STA $d1f4,x 
08c5 : 9d ee d2 STA $d2ee,x 
08c8 : d0 f1 __ BNE $08bb ; (main.l6 + 0)
.s5:
08ca : a9 00 __ LDA #$00
08cc : 85 10 __ STA P3 
08ce : 85 0e __ STA P1 
08d0 : a9 35 __ LDA #$35
08d2 : 85 01 __ STA $01 
08d4 : a9 03 __ LDA #$03
08d6 : 85 0d __ STA P0 
08d8 : a9 e0 __ LDA #$e0
08da : 85 11 __ STA P4 
08dc : a9 d0 __ LDA #$d0
08de : 85 0f __ STA P2 
08e0 : 20 db 09 JSR $09db ; (vic_setmode.s4 + 0)
08e3 : a9 37 __ LDA #$37
08e5 : 85 01 __ STA $01 
08e7 : a9 43 __ LDA #$43
08e9 : 85 0d __ STA P0 
08eb : a9 0a __ LDA #$0a
08ed : 85 0e __ STA P1 
08ef : 20 2d 0a JSR $0a2d ; (krnio_setnam.s4 + 0)
08f2 : a9 02 __ LDA #$02
08f4 : 85 0d __ STA P0 
08f6 : 85 0f __ STA P2 
08f8 : a9 09 __ LDA #$09
08fa : 85 0e __ STA P1 
08fc : 20 51 0a JSR $0a51 ; (krnio_open.s4 + 0)
08ff : aa __ __ TAX
0900 : f0 1c __ BEQ $091e ; (main.s7 + 0)
.s8:
0902 : a9 02 __ LDA #$02
0904 : 85 0e __ STA P1 
0906 : a9 1f __ LDA #$1f
0908 : 85 12 __ STA P5 
090a : a9 00 __ LDA #$00
090c : 85 0f __ STA P2 
090e : a9 e0 __ LDA #$e0
0910 : 85 10 __ STA P3 
0912 : a9 40 __ LDA #$40
0914 : 85 11 __ STA P4 
0916 : 20 7f 0a JSR $0a7f ; (krnio_read.s4 + 0)
0919 : a9 02 __ LDA #$02
091b : 20 22 0b JSR $0b22 ; (krnio_close.s4 + 0)
.s7:
091e : 20 2a 0b JSR $0b2a ; (getpch.s4 + 0)
0921 : a9 00 __ LDA #$00
0923 : 85 0d __ STA P0 
0925 : 85 0e __ STA P1 
0927 : 85 10 __ STA P3 
0929 : a9 04 __ LDA #$04
092b : 85 0f __ STA P2 
092d : a9 10 __ LDA #$10
092f : 85 11 __ STA P4 
0931 : 20 db 09 JSR $09db ; (vic_setmode.s4 + 0)
0934 : a9 00 __ LDA #$00
0936 : 85 1b __ STA ACCU + 0 
0938 : 85 1c __ STA ACCU + 1 
.s3:
093a : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
093b : a9 50 __ LDA #$50
093d : 8d fa ff STA $fffa 
0940 : a9 09 __ LDA #$09
0942 : 8d fb ff STA $fffb 
0945 : a9 6e __ LDA #$6e
0947 : 8d fe ff STA $fffe 
094a : a9 09 __ LDA #$09
094c : 8d ff ff STA $ffff 
.s3:
094f : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0950 : 48 __ __ PHA
0951 : 8a __ __ TXA
0952 : 48 __ __ PHA
0953 : a9 09 __ LDA #$09
0955 : 48 __ __ PHA
0956 : a9 67 __ LDA #$67
0958 : 48 __ __ PHA
0959 : ba __ __ TSX
095a : bd 05 01 LDA $0105,x 
095d : 48 __ __ PHA
095e : a6 01 __ LDX $01 
0960 : a9 36 __ LDA #$36
0962 : 85 01 __ STA $01 
0964 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0967 : 86 01 __ STX $01 
0969 : 68 __ __ PLA
096a : aa __ __ TAX
096b : 68 __ __ PLA
096c : 40 __ __ RTI
096d : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
096e : 48 __ __ PHA
096f : 8a __ __ TXA
0970 : 48 __ __ PHA
0971 : a9 09 __ LDA #$09
0973 : 48 __ __ PHA
0974 : a9 67 __ LDA #$67
0976 : 48 __ __ PHA
0977 : ba __ __ TSX
0978 : bd 05 01 LDA $0105,x 
097b : 48 __ __ PHA
097c : a6 01 __ LDX $01 
097e : a9 36 __ LDA #$36
0980 : 85 01 __ STA $01 
0982 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0985 : a5 0f __ LDA P2 ; (data + 0)
0987 : a0 00 __ LDY #$00
0989 : 91 0d __ STA (P0),y ; (bm + 0)
098b : a5 10 __ LDA P3 ; (data + 1)
098d : c8 __ __ INY
098e : 91 0d __ STA (P0),y ; (bm + 0)
0990 : a9 00 __ LDA #$00
0992 : c8 __ __ INY
0993 : 91 0d __ STA (P0),y ; (bm + 0)
0995 : c8 __ __ INY
0996 : 91 0d __ STA (P0),y ; (bm + 0)
0998 : a5 11 __ LDA P4 ; (cw + 0)
099a : c8 __ __ INY
099b : 91 0d __ STA (P0),y ; (bm + 0)
099d : a5 12 __ LDA P5 ; (ch + 0)
099f : c8 __ __ INY
09a0 : 91 0d __ STA (P0),y ; (bm + 0)
09a2 : a9 00 __ LDA #$00
09a4 : 06 11 __ ASL P4 ; (cw + 0)
09a6 : 2a __ __ ROL
09a7 : 06 11 __ ASL P4 ; (cw + 0)
09a9 : 2a __ __ ROL
09aa : 06 11 __ ASL P4 ; (cw + 0)
09ac : 2a __ __ ROL
09ad : a0 07 __ LDY #$07
09af : 91 0d __ STA (P0),y ; (bm + 0)
09b1 : a5 11 __ LDA P4 ; (cw + 0)
09b3 : 88 __ __ DEY
09b4 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
09b6 : 60 __ __ RTS
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
09b7 : a5 0f __ LDA P2 
09b9 : a6 12 __ LDX P5 
09bb : f0 0c __ BEQ $09c9 ; (memset.s4 + 18)
09bd : a0 00 __ LDY #$00
09bf : 91 0d __ STA (P0),y ; (dst + 0)
09c1 : c8 __ __ INY
09c2 : d0 fb __ BNE $09bf ; (memset.s4 + 8)
09c4 : e6 0e __ INC P1 ; (dst + 1)
09c6 : ca __ __ DEX
09c7 : d0 f6 __ BNE $09bf ; (memset.s4 + 8)
09c9 : a4 11 __ LDY P4 
09cb : f0 05 __ BEQ $09d2 ; (memset.s4 + 27)
09cd : 88 __ __ DEY
09ce : 91 0d __ STA (P0),y ; (dst + 0)
09d0 : d0 fb __ BNE $09cd ; (memset.s4 + 22)
09d2 : a5 0d __ LDA P0 ; (dst + 0)
09d4 : 85 1b __ STA ACCU + 0 
09d6 : a5 0e __ LDA P1 ; (dst + 1)
09d8 : 85 1c __ STA ACCU + 1 
.s3:
09da : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
09db : a4 0d __ LDY P0 ; (mode + 0)
09dd : c0 02 __ CPY #$02
09df : d0 09 __ BNE $09ea ; (vic_setmode.s5 + 0)
.s10:
09e1 : a9 5b __ LDA #$5b
09e3 : 8d 11 d0 STA $d011 
.s8:
09e6 : a9 08 __ LDA #$08
09e8 : d0 0c __ BNE $09f6 ; (vic_setmode.s7 + 0)
.s5:
09ea : b0 36 __ BCS $0a22 ; (vic_setmode.s6 + 0)
.s9:
09ec : a9 1b __ LDA #$1b
09ee : 8d 11 d0 STA $d011 
09f1 : 98 __ __ TYA
09f2 : f0 f2 __ BEQ $09e6 ; (vic_setmode.s8 + 0)
.s11:
09f4 : a9 18 __ LDA #$18
.s7:
09f6 : 8d 16 d0 STA $d016 
09f9 : ad 00 dd LDA $dd00 
09fc : 29 fc __ AND #$fc
09fe : 85 1b __ STA ACCU + 0 
0a00 : a5 0f __ LDA P2 ; (text + 1)
0a02 : 0a __ __ ASL
0a03 : 2a __ __ ROL
0a04 : 29 01 __ AND #$01
0a06 : 2a __ __ ROL
0a07 : 49 03 __ EOR #$03
0a09 : 05 1b __ ORA ACCU + 0 
0a0b : 8d 00 dd STA $dd00 
0a0e : a5 0f __ LDA P2 ; (text + 1)
0a10 : 29 3c __ AND #$3c
0a12 : 0a __ __ ASL
0a13 : 0a __ __ ASL
0a14 : 85 1b __ STA ACCU + 0 
0a16 : a5 11 __ LDA P4 ; (font + 1)
0a18 : 29 38 __ AND #$38
0a1a : 4a __ __ LSR
0a1b : 4a __ __ LSR
0a1c : 05 1b __ ORA ACCU + 0 
0a1e : 8d 18 d0 STA $d018 
.s3:
0a21 : 60 __ __ RTS
.s6:
0a22 : a9 3b __ LDA #$3b
0a24 : 8d 11 d0 STA $d011 
0a27 : c0 03 __ CPY #$03
0a29 : d0 c9 __ BNE $09f4 ; (vic_setmode.s11 + 0)
0a2b : f0 b9 __ BEQ $09e6 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a2d : a5 0d __ LDA P0 
0a2f : 05 0e __ ORA P1 
0a31 : f0 08 __ BEQ $0a3b ; (krnio_setnam.s4 + 14)
0a33 : a0 ff __ LDY #$ff
0a35 : c8 __ __ INY
0a36 : b1 0d __ LDA (P0),y 
0a38 : d0 fb __ BNE $0a35 ; (krnio_setnam.s4 + 8)
0a3a : 98 __ __ TYA
0a3b : a6 0d __ LDX P0 
0a3d : a4 0e __ LDY P1 
0a3f : 20 bd ff JSR $ffbd 
.s3:
0a42 : 60 __ __ RTS
--------------------------------------------------------------------
0a43 : __ __ __ BYT 54 45 53 54 49 4d 41 47 45 2c 50 2c 52 00       : TESTIMAGE,P,R.
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a51 : a9 00 __ LDA #$00
0a53 : a6 0d __ LDX P0 ; (fnum + 0)
0a55 : 9d 70 0b STA $0b70,x ; (krnio_pstatus[0] + 0)
0a58 : a9 00 __ LDA #$00
0a5a : 85 1b __ STA ACCU + 0 
0a5c : 85 1c __ STA ACCU + 1 
0a5e : a5 0d __ LDA P0 ; (fnum + 0)
0a60 : a6 0e __ LDX P1 
0a62 : a4 0f __ LDY P2 
0a64 : 20 ba ff JSR $ffba 
0a67 : 20 c0 ff JSR $ffc0 
0a6a : 90 08 __ BCC $0a74 ; (krnio_open.s4 + 35)
0a6c : a5 0d __ LDA P0 ; (fnum + 0)
0a6e : 20 c3 ff JSR $ffc3 
0a71 : 4c 78 0a JMP $0a78 ; (krnio_open.s4 + 39)
0a74 : a9 01 __ LDA #$01
0a76 : 85 1b __ STA ACCU + 0 
0a78 : a5 1b __ LDA ACCU + 0 
0a7a : f0 02 __ BEQ $0a7e ; (krnio_open.s3 + 0)
.s5:
0a7c : a9 01 __ LDA #$01
.s3:
0a7e : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read: ; krnio_read(u8,u8*,i16)->i16
;  91, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0a7f : a6 0e __ LDX P1 ; (fnum + 0)
0a81 : bd 70 0b LDA $0b70,x ; (krnio_pstatus[0] + 0)
0a84 : c9 40 __ CMP #$40
0a86 : d0 07 __ BNE $0a8f ; (krnio_read.s5 + 0)
.s15:
0a88 : a9 00 __ LDA #$00
.s16:
0a8a : 85 1b __ STA ACCU + 0 
.s3:
0a8c : 85 1c __ STA ACCU + 1 
0a8e : 60 __ __ RTS
.s5:
0a8f : 86 44 __ STX T2 + 0 
0a91 : 8a __ __ TXA
0a92 : 20 f5 0a JSR $0af5 ; (krnio_chkin.s4 + 0)
0a95 : aa __ __ TAX
0a96 : d0 04 __ BNE $0a9c ; (krnio_read.s7 + 0)
.s6:
0a98 : a9 ff __ LDA #$ff
0a9a : d0 ee __ BNE $0a8a ; (krnio_read.s16 + 0)
.s7:
0a9c : a9 00 __ LDA #$00
0a9e : 85 45 __ STA T3 + 0 
0aa0 : 85 46 __ STA T3 + 1 
0aa2 : a5 12 __ LDA P5 ; (num + 1)
0aa4 : 30 43 __ BMI $0ae9 ; (krnio_read.s8 + 0)
.s14:
0aa6 : 05 11 __ ORA P4 ; (num + 0)
0aa8 : f0 3f __ BEQ $0ae9 ; (krnio_read.s8 + 0)
.l9:
0aaa : 20 0a 0b JSR $0b0a ; (krnio_chrin.s4 + 0)
0aad : 85 43 __ STA T0 + 0 
0aaf : 20 12 0b JSR $0b12 ; (krnio_status.s4 + 0)
0ab2 : 85 1d __ STA ACCU + 2 
0ab4 : a6 44 __ LDX T2 + 0 
0ab6 : 9d 70 0b STA $0b70,x ; (krnio_pstatus[0] + 0)
0ab9 : aa __ __ TAX
0aba : f0 04 __ BEQ $0ac0 ; (krnio_read.s10 + 0)
.s13:
0abc : c9 40 __ CMP #$40
0abe : d0 29 __ BNE $0ae9 ; (krnio_read.s8 + 0)
.s10:
0ac0 : a5 45 __ LDA T3 + 0 
0ac2 : 85 1b __ STA ACCU + 0 
0ac4 : 18 __ __ CLC
0ac5 : a5 10 __ LDA P3 ; (data + 1)
0ac7 : 65 46 __ ADC T3 + 1 
0ac9 : 85 1c __ STA ACCU + 1 
0acb : a5 43 __ LDA T0 + 0 
0acd : a4 0f __ LDY P2 ; (data + 0)
0acf : 91 1b __ STA (ACCU + 0),y 
0ad1 : e6 45 __ INC T3 + 0 
0ad3 : d0 02 __ BNE $0ad7 ; (krnio_read.s18 + 0)
.s17:
0ad5 : e6 46 __ INC T3 + 1 
.s18:
0ad7 : a5 1d __ LDA ACCU + 2 
0ad9 : d0 0e __ BNE $0ae9 ; (krnio_read.s8 + 0)
.s11:
0adb : a5 46 __ LDA T3 + 1 
0add : c5 12 __ CMP P5 ; (num + 1)
0adf : 90 c9 __ BCC $0aaa ; (krnio_read.l9 + 0)
.s19:
0ae1 : d0 06 __ BNE $0ae9 ; (krnio_read.s8 + 0)
.s12:
0ae3 : a5 45 __ LDA T3 + 0 
0ae5 : c5 11 __ CMP P4 ; (num + 0)
0ae7 : 90 c1 __ BCC $0aaa ; (krnio_read.l9 + 0)
.s8:
0ae9 : 20 1e 0b JSR $0b1e ; (krnio_clrchn.s4 + 0)
0aec : a5 45 __ LDA T3 + 0 
0aee : 85 1b __ STA ACCU + 0 
0af0 : a5 46 __ LDA T3 + 1 
0af2 : 4c 8c 0a JMP $0a8c ; (krnio_read.s3 + 0)
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0af5 : 85 0d __ STA P0 
0af7 : a6 0d __ LDX P0 
0af9 : 20 c6 ff JSR $ffc6 
0afc : a9 00 __ LDA #$00
0afe : 2a __ __ ROL
0aff : 49 01 __ EOR #$01
0b01 : 85 1b __ STA ACCU + 0 
0b03 : a5 1b __ LDA ACCU + 0 
0b05 : f0 02 __ BEQ $0b09 ; (krnio_chkin.s3 + 0)
.s5:
0b07 : a9 01 __ LDA #$01
.s3:
0b09 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b0a : 20 cf ff JSR $ffcf 
0b0d : 85 1b __ STA ACCU + 0 
.s3:
0b0f : a5 1b __ LDA ACCU + 0 
0b11 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b12 : 20 b7 ff JSR $ffb7 
0b15 : 85 1b __ STA ACCU + 0 
0b17 : a9 00 __ LDA #$00
0b19 : 85 1c __ STA ACCU + 1 
.s3:
0b1b : a5 1b __ LDA ACCU + 0 
0b1d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b1e : 20 cc ff JSR $ffcc 
.s3:
0b21 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b22 : 85 0d __ STA P0 
0b24 : a5 0d __ LDA P0 
0b26 : 20 c3 ff JSR $ffc3 
.s3:
0b29 : 60 __ __ RTS
--------------------------------------------------------------------
getpch: ; getpch()->u8
;  70, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0b2a : 20 cf ff JSR $ffcf 
0b2d : 85 1b __ STA ACCU + 0 
0b2f : a5 1b __ LDA ACCU + 0 
0b31 : 4c 34 0b JMP $0b34 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
0b34 : a8 __ __ TAY
0b35 : ad 67 0b LDA $0b67 ; (giocharmap + 0)
0b38 : f0 27 __ BEQ $0b61 ; (convch.s5 + 0)
.s6:
0b3a : c0 0d __ CPY #$0d
0b3c : d0 03 __ BNE $0b41 ; (convch.s7 + 0)
.s16:
0b3e : a9 0a __ LDA #$0a
.s3:
0b40 : 60 __ __ RTS
.s7:
0b41 : c9 02 __ CMP #$02
0b43 : 90 1c __ BCC $0b61 ; (convch.s5 + 0)
.s8:
0b45 : 98 __ __ TYA
0b46 : c0 41 __ CPY #$41
0b48 : 90 17 __ BCC $0b61 ; (convch.s5 + 0)
.s9:
0b4a : c9 db __ CMP #$db
0b4c : b0 13 __ BCS $0b61 ; (convch.s5 + 0)
.s10:
0b4e : c9 c1 __ CMP #$c1
0b50 : 90 03 __ BCC $0b55 ; (convch.s11 + 0)
.s15:
0b52 : 49 a0 __ EOR #$a0
0b54 : a8 __ __ TAY
.s11:
0b55 : c9 7b __ CMP #$7b
0b57 : b0 08 __ BCS $0b61 ; (convch.s5 + 0)
.s12:
0b59 : c9 61 __ CMP #$61
0b5b : b0 06 __ BCS $0b63 ; (convch.s14 + 0)
.s13:
0b5d : c9 5b __ CMP #$5b
0b5f : 90 02 __ BCC $0b63 ; (convch.s14 + 0)
.s5:
0b61 : 98 __ __ TYA
0b62 : 60 __ __ RTS
.s14:
0b63 : 49 20 __ EOR #$20
0b65 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0b66 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
0b67 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
Screen:
0b68 : __ __ __ BSS	8
--------------------------------------------------------------------
krnio_pstatus:
0b70 : __ __ __ BSS	16
