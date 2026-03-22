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
080e : 8e d3 0c STX $0cd3 ; (spentry + 0)
0811 : a2 0d __ LDX #$0d
0813 : a0 32 __ LDY #$32
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0d __ CPX #$0d
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 32 __ CPY #$32
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
083f : a9 7f __ LDA #$7f
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 09 JSR $0900 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 135, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
0900 : a9 00 __ LDA #$00
0902 : 85 0d __ STA P0 
0904 : 85 0e __ STA P1 
0906 : 85 10 __ STA P3 
0908 : a9 36 __ LDA #$36
090a : 85 01 __ STA $01 
090c : a9 04 __ LDA #$04
090e : 85 0f __ STA P2 
0910 : a9 18 __ LDA #$18
0912 : 85 11 __ STA P4 
0914 : 20 a0 09 JSR $09a0 ; (vic_setmode.s4 + 0)
0917 : a9 00 __ LDA #$00
0919 : 85 0f __ STA P2 
091b : 85 11 __ STA P4 
091d : 85 12 __ STA P5 
091f : a9 04 __ LDA #$04
0921 : 85 10 __ STA P3 
0923 : a9 0c __ LDA #$0c
0925 : 85 0e __ STA P1 
0927 : a9 28 __ LDA #$28
0929 : 85 13 __ STA P6 
092b : a9 19 __ LDA #$19
092d : 85 14 __ STA P7 
092f : a9 dc __ LDA #$dc
0931 : 85 0d __ STA P0 
0933 : 20 f2 09 JSR $09f2 ; (cwin_init.s4 + 0)
0936 : a9 20 __ LDA #$20
0938 : 85 0f __ STA P2 
093a : a9 01 __ LDA #$01
093c : 85 10 __ STA P3 
093e : 20 41 0a JSR $0a41 ; (cwin_fill.s4 + 0)
0941 : a9 04 __ LDA #$04
0943 : 85 11 __ STA P4 
0945 : a9 0c __ LDA #$0c
0947 : 85 12 __ STA P5 
0949 : 20 94 0a JSR $0a94 ; (load.s4 + 0)
094c : 20 00 80 JSR $8000 ; (print1.s4 + 0)
094f : a9 ba __ LDA #$ba
0951 : 85 11 __ STA P4 
0953 : a9 0c __ LDA #$0c
0955 : 85 12 __ STA P5 
0957 : 20 94 0a JSR $0a94 ; (load.s4 + 0)
095a : 20 00 80 JSR $8000 ; (print1.s4 + 0)
095d : a9 bf __ LDA #$bf
095f : 85 11 __ STA P4 
0961 : a9 0c __ LDA #$0c
0963 : 85 12 __ STA P5 
0965 : 20 94 0a JSR $0a94 ; (load.s4 + 0)
0968 : 20 00 80 JSR $8000 ; (print1.s4 + 0)
096b : a9 c4 __ LDA #$c4
096d : 85 11 __ STA P4 
096f : a9 0c __ LDA #$0c
0971 : 85 12 __ STA P5 
0973 : 20 94 0a JSR $0a94 ; (load.s4 + 0)
0976 : 20 00 80 JSR $8000 ; (print1.s4 + 0)
0979 : a9 c9 __ LDA #$c9
097b : 85 11 __ STA P4 
097d : a9 0c __ LDA #$0c
097f : 85 12 __ STA P5 
0981 : 20 94 0a JSR $0a94 ; (load.s4 + 0)
0984 : 20 00 80 JSR $8000 ; (print1.s4 + 0)
0987 : a9 ce __ LDA #$ce
0989 : 85 11 __ STA P4 
098b : a9 0c __ LDA #$0c
098d : 85 12 __ STA P5 
098f : 20 94 0a JSR $0a94 ; (load.s4 + 0)
0992 : 20 00 80 JSR $8000 ; (print1.s4 + 0)
0995 : a9 00 __ LDA #$00
0997 : 85 1b __ STA ACCU + 0 
0999 : 85 1c __ STA ACCU + 1 
099b : a9 37 __ LDA #$37
099d : 85 01 __ STA $01 
.s3:
099f : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
09a0 : a4 0d __ LDY P0 ; (mode + 0)
09a2 : c0 02 __ CPY #$02
09a4 : d0 09 __ BNE $09af ; (vic_setmode.s5 + 0)
.s10:
09a6 : a9 5b __ LDA #$5b
09a8 : 8d 11 d0 STA $d011 
.s8:
09ab : a9 08 __ LDA #$08
09ad : d0 0c __ BNE $09bb ; (vic_setmode.s7 + 0)
.s5:
09af : b0 36 __ BCS $09e7 ; (vic_setmode.s6 + 0)
.s9:
09b1 : a9 1b __ LDA #$1b
09b3 : 8d 11 d0 STA $d011 
09b6 : 98 __ __ TYA
09b7 : f0 f2 __ BEQ $09ab ; (vic_setmode.s8 + 0)
.s11:
09b9 : a9 18 __ LDA #$18
.s7:
09bb : 8d 16 d0 STA $d016 
09be : ad 00 dd LDA $dd00 
09c1 : 29 fc __ AND #$fc
09c3 : 85 1b __ STA ACCU + 0 
09c5 : a5 0f __ LDA P2 ; (text + 1)
09c7 : 0a __ __ ASL
09c8 : 2a __ __ ROL
09c9 : 29 01 __ AND #$01
09cb : 2a __ __ ROL
09cc : 49 03 __ EOR #$03
09ce : 05 1b __ ORA ACCU + 0 
09d0 : 8d 00 dd STA $dd00 
09d3 : a5 0f __ LDA P2 ; (text + 1)
09d5 : 29 3c __ AND #$3c
09d7 : 0a __ __ ASL
09d8 : 0a __ __ ASL
09d9 : 85 1b __ STA ACCU + 0 
09db : a5 11 __ LDA P4 ; (font + 1)
09dd : 29 38 __ AND #$38
09df : 4a __ __ LSR
09e0 : 4a __ __ LSR
09e1 : 05 1b __ ORA ACCU + 0 
09e3 : 8d 18 d0 STA $d018 
.s3:
09e6 : 60 __ __ RTS
.s6:
09e7 : a9 3b __ LDA #$3b
09e9 : 8d 11 d0 STA $d011 
09ec : c0 03 __ CPY #$03
09ee : d0 c9 __ BNE $09b9 ; (vic_setmode.s11 + 0)
09f0 : f0 b9 __ BEQ $09ab ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
;  15, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
09f2 : a5 11 __ LDA P4 ; (sx + 0)
09f4 : a0 00 __ LDY #$00
09f6 : 91 0d __ STA (P0),y ; (win + 0)
09f8 : a5 12 __ LDA P5 ; (sy + 0)
09fa : c8 __ __ INY
09fb : 91 0d __ STA (P0),y ; (win + 0)
09fd : a5 13 __ LDA P6 ; (wx + 0)
09ff : c8 __ __ INY
0a00 : 91 0d __ STA (P0),y ; (win + 0)
0a02 : a5 14 __ LDA P7 ; (wy + 0)
0a04 : c8 __ __ INY
0a05 : 91 0d __ STA (P0),y ; (win + 0)
0a07 : a9 00 __ LDA #$00
0a09 : c8 __ __ INY
0a0a : 91 0d __ STA (P0),y ; (win + 0)
0a0c : c8 __ __ INY
0a0d : 91 0d __ STA (P0),y ; (win + 0)
0a0f : 06 12 __ ASL P5 ; (sy + 0)
0a11 : a6 12 __ LDX P5 ; (sy + 0)
0a13 : bd 00 0d LDA $0d00,x ; (mul40[0] + 0)
0a16 : 85 12 __ STA P5 ; (sy + 0)
0a18 : 18 __ __ CLC
0a19 : 65 11 __ ADC P4 ; (sx + 0)
0a1b : a0 0a __ LDY #$0a
0a1d : 91 0d __ STA (P0),y ; (win + 0)
0a1f : bd 01 0d LDA $0d01,x ; (mul40[0] + 1)
0a22 : aa __ __ TAX
0a23 : 69 d8 __ ADC #$d8
0a25 : c8 __ __ INY
0a26 : 91 0d __ STA (P0),y ; (win + 0)
0a28 : 18 __ __ CLC
0a29 : a5 0f __ LDA P2 ; (screen + 0)
0a2b : 65 12 __ ADC P5 ; (sy + 0)
0a2d : a8 __ __ TAY
0a2e : 8a __ __ TXA
0a2f : 65 10 __ ADC P3 ; (screen + 1)
0a31 : aa __ __ TAX
0a32 : 98 __ __ TYA
0a33 : 18 __ __ CLC
0a34 : 65 11 __ ADC P4 ; (sx + 0)
0a36 : a0 08 __ LDY #$08
0a38 : 91 0d __ STA (P0),y ; (win + 0)
0a3a : 8a __ __ TXA
0a3b : 69 00 __ ADC #$00
0a3d : c8 __ __ INY
0a3e : 91 0d __ STA (P0),y ; (win + 0)
.s3:
0a40 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_fill: ; cwin_fill(struct CharWin*,u8,u8)->void
;  24, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0a41 : a0 03 __ LDY #$03
0a43 : b1 0d __ LDA (P0),y ; (win + 0)
0a45 : f0 4c __ BEQ $0a93 ; (cwin_fill.s3 + 0)
.s5:
0a47 : a0 08 __ LDY #$08
0a49 : b1 0d __ LDA (P0),y ; (win + 0)
0a4b : 85 1b __ STA ACCU + 0 
0a4d : c8 __ __ INY
0a4e : b1 0d __ LDA (P0),y ; (win + 0)
0a50 : 85 1c __ STA ACCU + 1 
0a52 : c8 __ __ INY
0a53 : b1 0d __ LDA (P0),y ; (win + 0)
0a55 : 85 43 __ STA T2 + 0 
0a57 : c8 __ __ INY
0a58 : b1 0d __ LDA (P0),y ; (win + 0)
0a5a : 85 44 __ STA T2 + 1 
0a5c : a2 00 __ LDX #$00
.l6:
0a5e : a0 02 __ LDY #$02
0a60 : b1 0d __ LDA (P0),y ; (win + 0)
0a62 : f0 11 __ BEQ $0a75 ; (cwin_fill.s7 + 0)
.s8:
0a64 : 85 1d __ STA ACCU + 2 
0a66 : a0 00 __ LDY #$00
.l9:
0a68 : a5 0f __ LDA P2 ; (ch + 0)
0a6a : 91 1b __ STA (ACCU + 0),y 
0a6c : a5 10 __ LDA P3 ; (color + 0)
0a6e : 91 43 __ STA (T2 + 0),y 
0a70 : c8 __ __ INY
0a71 : c4 1d __ CPY ACCU + 2 
0a73 : 90 f3 __ BCC $0a68 ; (cwin_fill.l9 + 0)
.s7:
0a75 : 18 __ __ CLC
0a76 : a5 43 __ LDA T2 + 0 
0a78 : 69 28 __ ADC #$28
0a7a : 85 43 __ STA T2 + 0 
0a7c : 90 03 __ BCC $0a81 ; (cwin_fill.s11 + 0)
.s10:
0a7e : e6 44 __ INC T2 + 1 
0a80 : 18 __ __ CLC
.s11:
0a81 : a5 1b __ LDA ACCU + 0 
0a83 : 69 28 __ ADC #$28
0a85 : 85 1b __ STA ACCU + 0 
0a87 : 90 02 __ BCC $0a8b ; (cwin_fill.s13 + 0)
.s12:
0a89 : e6 1c __ INC ACCU + 1 
.s13:
0a8b : e8 __ __ INX
0a8c : 8a __ __ TXA
0a8d : a0 03 __ LDY #$03
0a8f : d1 0d __ CMP (P0),y ; (win + 0)
0a91 : 90 cb __ BCC $0a5e ; (cwin_fill.l6 + 0)
.s3:
0a93 : 60 __ __ RTS
--------------------------------------------------------------------
load: ; load(const u8*)->void
; 117, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
0a94 : a5 11 __ LDA P4 ; (fname + 0)
0a96 : 85 0d __ STA P0 
0a98 : a5 12 __ LDA P5 ; (fname + 1)
0a9a : 85 0e __ STA P1 
0a9c : 20 d5 0a JSR $0ad5 ; (krnio_setnam.s4 + 0)
0a9f : a9 02 __ LDA #$02
0aa1 : 85 0d __ STA P0 
0aa3 : 85 0f __ STA P2 
0aa5 : a9 08 __ LDA #$08
0aa7 : 85 0e __ STA P1 
0aa9 : 20 eb 0a JSR $0aeb ; (krnio_open.s4 + 0)
0aac : aa __ __ TAX
0aad : d0 01 __ BNE $0ab0 ; (load.s5 + 0)
.s3:
0aaf : 60 __ __ RTS
.s5:
0ab0 : a9 02 __ LDA #$02
0ab2 : 20 19 0b JSR $0b19 ; (krnio_chkin.s4 + 0)
0ab5 : aa __ __ TAX
0ab6 : f0 18 __ BEQ $0ad0 ; (load.s6 + 0)
.s7:
0ab8 : a9 02 __ LDA #$02
0aba : 85 0e __ STA P1 
0abc : 20 2e 0b JSR $0b2e ; (krnio_chrin.s4 + 0)
0abf : 85 49 __ STA T1 + 0 
0ac1 : 20 2e 0b JSR $0b2e ; (krnio_chrin.s4 + 0)
0ac4 : 85 10 __ STA P3 
0ac6 : a5 49 __ LDA T1 + 0 
0ac8 : 85 0f __ STA P2 
0aca : 20 36 0b JSR $0b36 ; (krnio_clrchn.s4 + 0)
0acd : 20 3a 0b JSR $0b3a ; (krnio_read_lzo.s4 + 0)
.s6:
0ad0 : a9 02 __ LDA #$02
0ad2 : 4c fc 0b JMP $0bfc ; (krnio_close.s4 + 0)
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0ad5 : a5 0d __ LDA P0 
0ad7 : 05 0e __ ORA P1 
0ad9 : f0 08 __ BEQ $0ae3 ; (krnio_setnam.s4 + 14)
0adb : a0 ff __ LDY #$ff
0add : c8 __ __ INY
0ade : b1 0d __ LDA (P0),y 
0ae0 : d0 fb __ BNE $0add ; (krnio_setnam.s4 + 8)
0ae2 : 98 __ __ TYA
0ae3 : a6 0d __ LDX P0 
0ae5 : a4 0e __ LDY P1 
0ae7 : 20 bd ff JSR $ffbd 
.s3:
0aea : 60 __ __ RTS
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0aeb : a9 00 __ LDA #$00
0aed : a6 0d __ LDX P0 ; (fnum + 0)
0aef : 9d e8 0c STA $0ce8,x ; (krnio_pstatus[0] + 0)
0af2 : a9 00 __ LDA #$00
0af4 : 85 1b __ STA ACCU + 0 
0af6 : 85 1c __ STA ACCU + 1 
0af8 : a5 0d __ LDA P0 ; (fnum + 0)
0afa : a6 0e __ LDX P1 
0afc : a4 0f __ LDY P2 
0afe : 20 ba ff JSR $ffba 
0b01 : 20 c0 ff JSR $ffc0 
0b04 : 90 08 __ BCC $0b0e ; (krnio_open.s4 + 35)
0b06 : a5 0d __ LDA P0 ; (fnum + 0)
0b08 : 20 c3 ff JSR $ffc3 
0b0b : 4c 12 0b JMP $0b12 ; (krnio_open.s4 + 39)
0b0e : a9 01 __ LDA #$01
0b10 : 85 1b __ STA ACCU + 0 
0b12 : a5 1b __ LDA ACCU + 0 
0b14 : f0 02 __ BEQ $0b18 ; (krnio_open.s3 + 0)
.s5:
0b16 : a9 01 __ LDA #$01
.s3:
0b18 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chkin: ; krnio_chkin(u8)->bool
;  55, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b19 : 85 0d __ STA P0 
0b1b : a6 0d __ LDX P0 
0b1d : 20 c6 ff JSR $ffc6 
0b20 : a9 00 __ LDA #$00
0b22 : 2a __ __ ROL
0b23 : 49 01 __ EOR #$01
0b25 : 85 1b __ STA ACCU + 0 
0b27 : a5 1b __ LDA ACCU + 0 
0b29 : f0 02 __ BEQ $0b2d ; (krnio_chkin.s3 + 0)
.s5:
0b2b : a9 01 __ LDA #$01
.s3:
0b2d : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrin: ; krnio_chrin()->u8
;  67, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b2e : 20 cf ff JSR $ffcf 
0b31 : 85 1b __ STA ACCU + 0 
.s3:
0b33 : a5 1b __ LDA ACCU + 0 
0b35 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b36 : 20 cc ff JSR $ffcc 
.s3:
0b39 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_read_lzo: ; krnio_read_lzo(u8,u8*)->i16
;  93, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0b3a : a6 0e __ LDX P1 ; (fnum + 0)
0b3c : bd e8 0c LDA $0ce8,x ; (krnio_pstatus[0] + 0)
0b3f : c9 40 __ CMP #$40
0b41 : d0 07 __ BNE $0b4a ; (krnio_read_lzo.s5 + 0)
.s18:
0b43 : a9 00 __ LDA #$00
.s21:
0b45 : 85 1b __ STA ACCU + 0 
.s3:
0b47 : 85 1c __ STA ACCU + 1 
0b49 : 60 __ __ RTS
.s5:
0b4a : 86 46 __ STX T4 + 0 
0b4c : 8a __ __ TXA
0b4d : 20 19 0b JSR $0b19 ; (krnio_chkin.s4 + 0)
0b50 : aa __ __ TAX
0b51 : d0 04 __ BNE $0b57 ; (krnio_read_lzo.s7 + 0)
.s6:
0b53 : a9 ff __ LDA #$ff
0b55 : d0 ee __ BNE $0b45 ; (krnio_read_lzo.s21 + 0)
.s7:
0b57 : a9 00 __ LDA #$00
0b59 : 85 47 __ STA T5 + 0 
0b5b : 85 48 __ STA T5 + 1 
.l8:
0b5d : 85 45 __ STA T2 + 0 
.l9:
0b5f : 20 2e 0b JSR $0b2e ; (krnio_chrin.s4 + 0)
0b62 : 85 43 __ STA T1 + 0 
0b64 : 20 f0 0b JSR $0bf0 ; (krnio_status.s4 + 0)
0b67 : 85 1d __ STA ACCU + 2 
0b69 : aa __ __ TAX
0b6a : f0 04 __ BEQ $0b70 ; (krnio_read_lzo.s10 + 0)
.s17:
0b6c : c9 40 __ CMP #$40
0b6e : d0 21 __ BNE $0b91 ; (krnio_read_lzo.s26 + 0)
.s10:
0b70 : a5 45 __ LDA T2 + 0 
0b72 : 30 41 __ BMI $0bb5 ; (krnio_read_lzo.s16 + 0)
.s11:
0b74 : d0 20 __ BNE $0b96 ; (krnio_read_lzo.s15 + 0)
.s12:
0b76 : a5 43 __ LDA T1 + 0 
0b78 : f0 17 __ BEQ $0b91 ; (krnio_read_lzo.s26 + 0)
.s14:
0b7a : 85 45 __ STA T2 + 0 
0b7c : a5 1d __ LDA ACCU + 2 
0b7e : f0 df __ BEQ $0b5f ; (krnio_read_lzo.l9 + 0)
.s13:
0b80 : a6 46 __ LDX T4 + 0 
0b82 : 9d e8 0c STA $0ce8,x ; (krnio_pstatus[0] + 0)
0b85 : 20 36 0b JSR $0b36 ; (krnio_clrchn.s4 + 0)
0b88 : a5 47 __ LDA T5 + 0 
0b8a : 85 1b __ STA ACCU + 0 
0b8c : a5 48 __ LDA T5 + 1 
0b8e : 4c 47 0b JMP $0b47 ; (krnio_read_lzo.s3 + 0)
.s26:
0b91 : a5 1d __ LDA ACCU + 2 
0b93 : 4c 80 0b JMP $0b80 ; (krnio_read_lzo.s13 + 0)
.s15:
0b96 : a5 47 __ LDA T5 + 0 
0b98 : 85 1b __ STA ACCU + 0 
0b9a : 18 __ __ CLC
0b9b : a5 10 __ LDA P3 ; (data + 1)
0b9d : 65 48 __ ADC T5 + 1 
0b9f : 85 1c __ STA ACCU + 1 
0ba1 : a5 43 __ LDA T1 + 0 
0ba3 : a4 0f __ LDY P2 ; (data + 0)
0ba5 : 91 1b __ STA (ACCU + 0),y 
0ba7 : c6 45 __ DEC T2 + 0 
0ba9 : e6 47 __ INC T5 + 0 
0bab : d0 02 __ BNE $0baf ; (krnio_read_lzo.s25 + 0)
.s24:
0bad : e6 48 __ INC T5 + 1 
.s25:
0baf : a5 1d __ LDA ACCU + 2 
0bb1 : d0 cd __ BNE $0b80 ; (krnio_read_lzo.s13 + 0)
0bb3 : f0 aa __ BEQ $0b5f ; (krnio_read_lzo.l9 + 0)
.s16:
0bb5 : 18 __ __ CLC
0bb6 : a5 0f __ LDA P2 ; (data + 0)
0bb8 : 65 47 __ ADC T5 + 0 
0bba : 85 1b __ STA ACCU + 0 
0bbc : a5 10 __ LDA P3 ; (data + 1)
0bbe : 65 48 __ ADC T5 + 1 
0bc0 : 85 1c __ STA ACCU + 1 
0bc2 : 38 __ __ SEC
0bc3 : a5 1b __ LDA ACCU + 0 
0bc5 : e5 43 __ SBC T1 + 0 
0bc7 : 85 43 __ STA T1 + 0 
0bc9 : a5 1c __ LDA ACCU + 1 
0bcb : e9 00 __ SBC #$00
0bcd : 85 44 __ STA T1 + 1 
0bcf : a5 45 __ LDA T2 + 0 
0bd1 : 29 7f __ AND #$7f
0bd3 : 85 1e __ STA ACCU + 3 
0bd5 : 18 __ __ CLC
0bd6 : 65 47 __ ADC T5 + 0 
0bd8 : 85 47 __ STA T5 + 0 
0bda : 90 02 __ BCC $0bde ; (krnio_read_lzo.s23 + 0)
.s22:
0bdc : e6 48 __ INC T5 + 1 
.s23:
0bde : a0 00 __ LDY #$00
.l19:
0be0 : b1 43 __ LDA (T1 + 0),y 
0be2 : 91 1b __ STA (ACCU + 0),y 
0be4 : c8 __ __ INY
0be5 : c4 1e __ CPY ACCU + 3 
0be7 : d0 f7 __ BNE $0be0 ; (krnio_read_lzo.l19 + 0)
.s20:
0be9 : a5 1d __ LDA ACCU + 2 
0beb : d0 93 __ BNE $0b80 ; (krnio_read_lzo.s13 + 0)
0bed : 4c 5d 0b JMP $0b5d ; (krnio_read_lzo.l8 + 0)
--------------------------------------------------------------------
krnio_status: ; krnio_status()->enum krnioerr
;  43, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0bf0 : 20 b7 ff JSR $ffb7 
0bf3 : 85 1b __ STA ACCU + 0 
0bf5 : a9 00 __ LDA #$00
0bf7 : 85 1c __ STA ACCU + 1 
.s3:
0bf9 : a5 1b __ LDA ACCU + 0 
0bfb : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
0bfc : 85 0d __ STA P0 
0bfe : a5 0d __ LDA P0 
0c00 : 20 c3 ff JSR $ffc3 
.s3:
0c03 : 60 __ __ RTS
--------------------------------------------------------------------
0c04 : __ __ __ BYT 4f 56 4c 31 00                                  : OVL1.
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->u8
;  64, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0c09 : a5 14 __ LDA P7 ; (win + 0)
0c0b : 85 0d __ STA P0 
0c0d : a5 15 __ LDA P8 ; (win + 1)
0c0f : 85 0e __ STA P1 
0c11 : a0 04 __ LDY #$04
0c13 : b1 14 __ LDA (P7),y ; (win + 0)
0c15 : 85 0f __ STA P2 
0c17 : c8 __ __ INY
0c18 : b1 14 __ LDA (P7),y ; (win + 0)
0c1a : 85 10 __ STA P3 
0c1c : a5 16 __ LDA P9 ; (str + 0)
0c1e : 85 11 __ STA P4 
0c20 : a5 17 __ LDA P10 ; (str + 1)
0c22 : 85 12 __ STA P5 
0c24 : a5 18 __ LDA P11 ; (color + 0)
0c26 : 85 13 __ STA P6 
0c28 : 20 49 0c JSR $0c49 ; (cwin_putat_string.s4 + 0)
0c2b : 85 1b __ STA ACCU + 0 
0c2d : 18 __ __ CLC
0c2e : a0 04 __ LDY #$04
0c30 : 71 14 __ ADC (P7),y ; (win + 0)
0c32 : 91 14 __ STA (P7),y ; (win + 0)
0c34 : a0 02 __ LDY #$02
0c36 : d1 14 __ CMP (P7),y ; (win + 0)
0c38 : 90 0e __ BCC $0c48 ; (cwin_put_string.s3 + 0)
.s5:
0c3a : a9 00 __ LDA #$00
0c3c : a0 04 __ LDY #$04
0c3e : 91 14 __ STA (P7),y ; (win + 0)
0c40 : 18 __ __ CLC
0c41 : c8 __ __ INY
0c42 : b1 14 __ LDA (P7),y ; (win + 0)
0c44 : 69 01 __ ADC #$01
0c46 : 91 14 __ STA (P7),y ; (win + 0)
.s3:
0c48 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string: ; cwin_putat_string(struct CharWin*,u8,u8,const u8*,u8)->u8
;  90, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0c49 : a5 10 __ LDA P3 ; (y + 0)
0c4b : 0a __ __ ASL
0c4c : aa __ __ TAX
0c4d : bd 00 0d LDA $0d00,x ; (mul40[0] + 0)
0c50 : 65 0f __ ADC P2 ; (x + 0)
0c52 : 85 1b __ STA ACCU + 0 
0c54 : bd 01 0d LDA $0d01,x ; (mul40[0] + 1)
0c57 : 69 00 __ ADC #$00
0c59 : 85 1c __ STA ACCU + 1 
0c5b : a0 08 __ LDY #$08
0c5d : b1 0d __ LDA (P0),y ; (win + 0)
0c5f : 65 1b __ ADC ACCU + 0 
0c61 : 85 43 __ STA T2 + 0 
0c63 : c8 __ __ INY
0c64 : b1 0d __ LDA (P0),y ; (win + 0)
0c66 : 65 1c __ ADC ACCU + 1 
0c68 : 85 44 __ STA T2 + 1 
0c6a : c8 __ __ INY
0c6b : b1 0d __ LDA (P0),y ; (win + 0)
0c6d : 18 __ __ CLC
0c6e : 65 1b __ ADC ACCU + 0 
0c70 : 85 1b __ STA ACCU + 0 
0c72 : c8 __ __ INY
0c73 : b1 0d __ LDA (P0),y ; (win + 0)
0c75 : 65 1c __ ADC ACCU + 1 
0c77 : 85 1c __ STA ACCU + 1 
0c79 : a0 00 __ LDY #$00
0c7b : b1 11 __ LDA (P4),y ; (str + 0)
0c7d : f0 16 __ BEQ $0c95 ; (cwin_putat_string.s5 + 0)
.l6:
0c7f : 4a __ __ LSR
0c80 : 4a __ __ LSR
0c81 : 4a __ __ LSR
0c82 : 4a __ __ LSR
0c83 : 4a __ __ LSR
0c84 : aa __ __ TAX
0c85 : bd d4 0c LDA $0cd4,x ; (p2smap[0] + 0)
0c88 : 51 11 __ EOR (P4),y ; (str + 0)
0c8a : 91 43 __ STA (T2 + 0),y 
0c8c : a5 13 __ LDA P6 ; (color + 0)
0c8e : 91 1b __ STA (ACCU + 0),y 
0c90 : c8 __ __ INY
0c91 : b1 11 __ LDA (P4),y ; (str + 0)
0c93 : d0 ea __ BNE $0c7f ; (cwin_putat_string.l6 + 0)
.s5:
0c95 : 98 __ __ TYA
.s3:
0c96 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->bool
;  44, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0c97 : a9 00 __ LDA #$00
0c99 : a0 04 __ LDY #$04
0c9b : 91 0d __ STA (P0),y ; (win + 0)
0c9d : 88 __ __ DEY
0c9e : b1 0d __ LDA (P0),y ; (win + 0)
0ca0 : 85 1b __ STA ACCU + 0 
0ca2 : a0 05 __ LDY #$05
0ca4 : b1 0d __ LDA (P0),y ; (win + 0)
0ca6 : aa __ __ TAX
0ca7 : 18 __ __ CLC
0ca8 : 69 01 __ ADC #$01
0caa : b0 0b __ BCS $0cb7 ; (cwin_cursor_newline.s5 + 0)
.s7:
0cac : c5 1b __ CMP ACCU + 0 
0cae : b0 07 __ BCS $0cb7 ; (cwin_cursor_newline.s5 + 0)
.s6:
0cb0 : e8 __ __ INX
0cb1 : 8a __ __ TXA
0cb2 : 91 0d __ STA (P0),y ; (win + 0)
0cb4 : a9 01 __ LDA #$01
0cb6 : 60 __ __ RTS
.s5:
0cb7 : a9 00 __ LDA #$00
.s3:
0cb9 : 60 __ __ RTS
--------------------------------------------------------------------
0cba : __ __ __ BYT 4f 56 4c 32 00                                  : OVL2.
--------------------------------------------------------------------
0cbf : __ __ __ BYT 4f 56 4c 33 00                                  : OVL3.
--------------------------------------------------------------------
0cc4 : __ __ __ BYT 4f 56 4c 34 00                                  : OVL4.
--------------------------------------------------------------------
0cc9 : __ __ __ BYT 4f 56 4c 35 00                                  : OVL5.
--------------------------------------------------------------------
0cce : __ __ __ BYT 4f 56 4c 36 00                                  : OVL6.
--------------------------------------------------------------------
spentry:
0cd3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
p2smap:
0cd4 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
cw:
0cdc : __ __ __ BSS	12
--------------------------------------------------------------------
krnio_pstatus:
0ce8 : __ __ __ BSS	16
--------------------------------------------------------------------
mul40:
0d00 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
0d10 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
0d20 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
0d30 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
print1: ; print1()->void
;  57, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
01:8000 : a9 07 __ LDA #$07
01:8002 : 85 18 __ STA P11 
01:8004 : a9 80 __ LDA #$80
01:8006 : 85 17 __ STA P10 
01:8008 : a9 dc __ LDA #$dc
01:800a : 85 14 __ STA P7 
01:800c : a9 0c __ LDA #$0c
01:800e : 85 15 __ STA P8 
01:8010 : a9 22 __ LDA #$22
01:8012 : 85 16 __ STA P9 
01:8014 : 20 09 0c JSR $0c09 ; (cwin_put_string.s4 + 0)
01:8017 : a9 dc __ LDA #$dc
01:8019 : 85 0d __ STA P0 
01:801b : a9 0c __ LDA #$0c
01:801d : 85 0e __ STA P1 
01:801f : 4c 97 0c JMP $0c97 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
01:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 52 53 54 20 4f 56 : .HIS IS FIRST OV
01:8032 : __ __ __ BYT 45 52 4c 41 59 00                               : ERLAY.
--------------------------------------------------------------------
print2: ; print2()->void
;  68, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
02:8000 : a9 07 __ LDA #$07
02:8002 : 85 18 __ STA P11 
02:8004 : a9 80 __ LDA #$80
02:8006 : 85 17 __ STA P10 
02:8008 : a9 dc __ LDA #$dc
02:800a : 85 14 __ STA P7 
02:800c : a9 0c __ LDA #$0c
02:800e : 85 15 __ STA P8 
02:8010 : a9 22 __ LDA #$22
02:8012 : 85 16 __ STA P9 
02:8014 : 20 09 0c JSR $0c09 ; (cwin_put_string.s4 + 0)
02:8017 : a9 dc __ LDA #$dc
02:8019 : 85 0d __ STA P0 
02:801b : a9 0c __ LDA #$0c
02:801d : 85 0e __ STA P1 
02:801f : 4c 97 0c JMP $0c97 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
02:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 53 45 43 4f 4e 44 20 4f : .HIS IS SECOND O
02:8032 : __ __ __ BYT 56 45 52 4c 41 59 00                            : VERLAY.
--------------------------------------------------------------------
print3: ; print3()->void
;  77, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
03:8000 : a9 07 __ LDA #$07
03:8002 : 85 18 __ STA P11 
03:8004 : a9 80 __ LDA #$80
03:8006 : 85 17 __ STA P10 
03:8008 : a9 dc __ LDA #$dc
03:800a : 85 14 __ STA P7 
03:800c : a9 0c __ LDA #$0c
03:800e : 85 15 __ STA P8 
03:8010 : a9 22 __ LDA #$22
03:8012 : 85 16 __ STA P9 
03:8014 : 20 09 0c JSR $0c09 ; (cwin_put_string.s4 + 0)
03:8017 : a9 dc __ LDA #$dc
03:8019 : 85 0d __ STA P0 
03:801b : a9 0c __ LDA #$0c
03:801d : 85 0e __ STA P1 
03:801f : 4c 97 0c JMP $0c97 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
03:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 54 48 49 52 44 20 4f 56 : .HIS IS THIRD OV
03:8032 : __ __ __ BYT 45 52 4c 41 59 00                               : ERLAY.
--------------------------------------------------------------------
print4: ; print4()->void
;  86, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
04:8000 : a9 07 __ LDA #$07
04:8002 : 85 18 __ STA P11 
04:8004 : a9 80 __ LDA #$80
04:8006 : 85 17 __ STA P10 
04:8008 : a9 dc __ LDA #$dc
04:800a : 85 14 __ STA P7 
04:800c : a9 0c __ LDA #$0c
04:800e : 85 15 __ STA P8 
04:8010 : a9 22 __ LDA #$22
04:8012 : 85 16 __ STA P9 
04:8014 : 20 09 0c JSR $0c09 ; (cwin_put_string.s4 + 0)
04:8017 : a9 dc __ LDA #$dc
04:8019 : 85 0d __ STA P0 
04:801b : a9 0c __ LDA #$0c
04:801d : 85 0e __ STA P1 
04:801f : 4c 97 0c JMP $0c97 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
04:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 46 4f 55 52 54 48 20 4f : .HIS IS FOURTH O
04:8032 : __ __ __ BYT 56 45 52 4c 41 59 00                            : VERLAY.
--------------------------------------------------------------------
print5: ; print5()->void
;  95, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
05:8000 : a9 07 __ LDA #$07
05:8002 : 85 18 __ STA P11 
05:8004 : a9 80 __ LDA #$80
05:8006 : 85 17 __ STA P10 
05:8008 : a9 dc __ LDA #$dc
05:800a : 85 14 __ STA P7 
05:800c : a9 0c __ LDA #$0c
05:800e : 85 15 __ STA P8 
05:8010 : a9 22 __ LDA #$22
05:8012 : 85 16 __ STA P9 
05:8014 : 20 09 0c JSR $0c09 ; (cwin_put_string.s4 + 0)
05:8017 : a9 dc __ LDA #$dc
05:8019 : 85 0d __ STA P0 
05:801b : a9 0c __ LDA #$0c
05:801d : 85 0e __ STA P1 
05:801f : 4c 97 0c JMP $0c97 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
05:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 46 54 48 20 4f 56 : .HIS IS FIFTH OV
05:8032 : __ __ __ BYT 45 52 4c 41 59 00                               : ERLAY.
--------------------------------------------------------------------
print6: ; print6()->void
; 104, "/home/honza/projects/c64/projects/oscar64/samples/memmap/overlaylzo.c"
.s4:
06:8000 : a9 07 __ LDA #$07
06:8002 : 85 18 __ STA P11 
06:8004 : a9 80 __ LDA #$80
06:8006 : 85 17 __ STA P10 
06:8008 : a9 dc __ LDA #$dc
06:800a : 85 14 __ STA P7 
06:800c : a9 0c __ LDA #$0c
06:800e : 85 15 __ STA P8 
06:8010 : a9 22 __ LDA #$22
06:8012 : 85 16 __ STA P9 
06:8014 : 20 09 0c JSR $0c09 ; (cwin_put_string.s4 + 0)
06:8017 : a9 dc __ LDA #$dc
06:8019 : 85 0d __ STA P0 
06:801b : a9 0c __ LDA #$0c
06:801d : 85 0e __ STA P1 
06:801f : 4c 97 0c JMP $0c97 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
06:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 53 49 58 54 48 20 4f 56 : .HIS IS SIXTH OV
06:8032 : __ __ __ BYT 45 52 4c 41 59 00                               : ERLAY.
