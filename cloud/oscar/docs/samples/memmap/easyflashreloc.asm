; Compiled with 1.32.268
--------------------------------------------------------------------
startup: ; startup
0800 : 09 80 __ ORA #$80
0802 : bc fe c3 LDY $c3fe,x 
0805 : c2 __ __ INV
0806 : cd 38 30 CMP $3038 
0809 : a2 00 __ LDX #$00
080b : bd 00 80 LDA $8000,x ; (entry1.fhello + 0)
080e : 9d 00 08 STA $0800,x ; (startup + 0)
0811 : e8 __ __ INX
0812 : d0 f7 __ BNE $080b ; (startup + 11)
0814 : a9 00 __ LDA #$00
0816 : 85 19 __ STA IP + 0 
0818 : a9 81 __ LDA #$81
081a : 85 1a __ STA IP + 1 
081c : a9 00 __ LDA #$00
081e : 85 23 __ STA SP + 0 
0820 : a9 09 __ LDA #$09
0822 : 85 24 __ STA SP + 1 
0824 : a0 00 __ LDY #$00
0826 : b1 19 __ LDA (IP + 0),y 
0828 : 85 1b __ STA ACCU + 0 
082a : 30 3b __ BMI $0867 ; (startup + 103)
082c : 18 __ __ CLC
082d : a5 19 __ LDA IP + 0 
082f : 69 01 __ ADC #$01
0831 : 85 1f __ STA ADDR + 0 
0833 : a5 1a __ LDA IP + 1 
0835 : 69 00 __ ADC #$00
0837 : 85 20 __ STA ADDR + 1 
0839 : 18 __ __ CLC
083a : a5 1f __ LDA ADDR + 0 
083c : 65 1b __ ADC ACCU + 0 
083e : 85 19 __ STA IP + 0 
0840 : a5 20 __ LDA ADDR + 1 
0842 : 69 00 __ ADC #$00
0844 : 85 1a __ STA IP + 1 
0846 : a0 00 __ LDY #$00
0848 : b1 1f __ LDA (ADDR + 0),y 
084a : 91 23 __ STA (SP + 0),y 
084c : c8 __ __ INY
084d : c4 1b __ CPY ACCU + 0 
084f : d0 f7 __ BNE $0848 ; (startup + 72)
0851 : 18 __ __ CLC
0852 : a5 23 __ LDA SP + 0 
0854 : 65 1b __ ADC ACCU + 0 
0856 : 85 23 __ STA SP + 0 
0858 : a5 24 __ LDA SP + 1 
085a : 69 00 __ ADC #$00
085c : 85 24 __ STA SP + 1 
085e : a0 00 __ LDY #$00
0860 : b1 19 __ LDA (IP + 0),y 
0862 : d0 c4 __ BNE $0828 ; (startup + 40)
0864 : 4c 8c 08 JMP $088c ; (startup + 140)
0867 : a5 23 __ LDA SP + 0 
0869 : 38 __ __ SEC
086a : a0 01 __ LDY #$01
086c : f1 19 __ SBC (IP + 0),y 
086e : 85 1f __ STA ADDR + 0 
0870 : a5 24 __ LDA SP + 1 
0872 : e9 00 __ SBC #$00
0874 : 85 20 __ STA ADDR + 1 
0876 : 18 __ __ CLC
0877 : a5 19 __ LDA IP + 0 
0879 : 69 02 __ ADC #$02
087b : 85 19 __ STA IP + 0 
087d : a5 1a __ LDA IP + 1 
087f : 69 00 __ ADC #$00
0881 : 85 1a __ STA IP + 1 
0883 : a5 1b __ LDA ACCU + 0 
0885 : 29 7f __ AND #$7f
0887 : 85 1b __ STA ACCU + 0 
0889 : 4c 46 08 JMP $0846 ; (startup + 70)
088c : a9 2f __ LDA #$2f
088e : 85 00 __ STA $00 
0890 : a9 36 __ LDA #$36
0892 : 85 01 __ STA $01 
0894 : a2 0b __ LDX #$0b
0896 : a0 f8 __ LDY #$f8
0898 : a9 00 __ LDA #$00
089a : 85 19 __ STA IP + 0 
089c : 86 1a __ STX IP + 1 
089e : e0 0c __ CPX #$0c
08a0 : f0 0b __ BEQ $08ad ; (startup + 173)
08a2 : 91 19 __ STA (IP + 0),y 
08a4 : c8 __ __ INY
08a5 : d0 fb __ BNE $08a2 ; (startup + 162)
08a7 : e8 __ __ INX
08a8 : d0 f2 __ BNE $089c ; (startup + 156)
08aa : 91 19 __ STA (IP + 0),y 
08ac : c8 __ __ INY
08ad : c0 0c __ CPY #$0c
08af : d0 f9 __ BNE $08aa ; (startup + 170)
08b1 : a9 00 __ LDA #$00
08b3 : a2 f7 __ LDX #$f7
08b5 : d0 03 __ BNE $08ba ; (startup + 186)
08b7 : 95 00 __ STA $00,x 
08b9 : e8 __ __ INX
08ba : e0 f7 __ CPX #$f7
08bc : d0 f9 __ BNE $08b7 ; (startup + 183)
08be : a9 fd __ LDA #$fd
08c0 : 85 23 __ STA SP + 0 
08c2 : a9 7f __ LDA #$7f
08c4 : 85 24 __ STA SP + 1 
08c6 : 20 00 09 JSR $0900 ; (main.s4 + 0)
08c9 : a9 4c __ LDA #$4c
08cb : 85 54 __ STA $54 
08cd : a9 00 __ LDA #$00
08cf : 85 13 __ STA P6 
08d1 : a9 19 __ LDA #$19
08d3 : 85 16 __ STA P9 
08d5 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
; 199, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
0900 : a9 37 __ LDA #$37
0902 : 85 01 __ STA $01 
0904 : a9 00 __ LDA #$00
0906 : 85 0d __ STA P0 
0908 : 20 79 09 JSR $0979 ; (cia_init.s4 + 0)
090b : a9 00 __ LDA #$00
090d : 85 0e __ STA P1 
090f : 85 10 __ STA P3 
0911 : a9 04 __ LDA #$04
0913 : 85 0f __ STA P2 
0915 : a9 18 __ LDA #$18
0917 : 85 11 __ STA P4 
0919 : 20 b0 09 JSR $09b0 ; (vic_setmode.s4 + 0)
091c : a9 00 __ LDA #$00
091e : 85 0f __ STA P2 
0920 : 85 11 __ STA P4 
0922 : 85 12 __ STA P5 
0924 : a9 04 __ LDA #$04
0926 : 85 10 __ STA P3 
0928 : a9 0c __ LDA #$0c
092a : 85 0e __ STA P1 
092c : a9 28 __ LDA #$28
092e : 85 13 __ STA P6 
0930 : a9 19 __ LDA #$19
0932 : 85 14 __ STA P7 
0934 : a9 00 __ LDA #$00
0936 : 85 0d __ STA P0 
0938 : 20 02 0a JSR $0a02 ; (cwin_init.s4 + 0)
093b : a9 20 __ LDA #$20
093d : 85 0f __ STA P2 
093f : a9 01 __ LDA #$01
0941 : 85 10 __ STA P3 
0943 : 20 51 0a JSR $0a51 ; (cwin_fill.s4 + 0)
0946 : a9 01 __ LDA #$01
0948 : 8d ff 7f STA $7fff ; (sstack + 0)
094b : 20 a4 0a JSR $0aa4 ; (callbank.s4 + 0)
094e : a9 02 __ LDA #$02
0950 : 8d ff 7f STA $7fff ; (sstack + 0)
0953 : 20 a4 0a JSR $0aa4 ; (callbank.s4 + 0)
0956 : a9 03 __ LDA #$03
0958 : 8d ff 7f STA $7fff ; (sstack + 0)
095b : 20 a4 0a JSR $0aa4 ; (callbank.s4 + 0)
095e : a9 04 __ LDA #$04
0960 : 8d ff 7f STA $7fff ; (sstack + 0)
0963 : 20 a4 0a JSR $0aa4 ; (callbank.s4 + 0)
0966 : a9 05 __ LDA #$05
0968 : 8d ff 7f STA $7fff ; (sstack + 0)
096b : 20 a4 0a JSR $0aa4 ; (callbank.s4 + 0)
096e : a9 06 __ LDA #$06
0970 : 8d ff 7f STA $7fff ; (sstack + 0)
0973 : 20 a4 0a JSR $0aa4 ; (callbank.s4 + 0)
.l5:
0976 : 4c 76 09 JMP $0976 ; (main.l5 + 0)
--------------------------------------------------------------------
cia_init: ; cia_init()->void
;  22, "/home/honza/projects/c64/projects/oscar64/include/c64/cia.h"
.s4:
0979 : a9 7f __ LDA #$7f
097b : 8d 0d dc STA $dc0d 
097e : 8d 0d dd STA $dd0d 
0981 : 8d 00 dc STA $dc00 
0984 : a9 08 __ LDA #$08
0986 : 8d 0e dc STA $dc0e 
0989 : 8d 0f dc STA $dc0f 
098c : 8d 0e dd STA $dd0e 
098f : 8d 0f dd STA $dd0f 
0992 : a9 00 __ LDA #$00
0994 : 8d 03 dc STA $dc03 
0997 : 8d 03 dd STA $dd03 
099a : a9 ff __ LDA #$ff
099c : 8d 02 dc STA $dc02 
099f : a9 07 __ LDA #$07
09a1 : 8d 00 dd STA $dd00 
09a4 : a9 3f __ LDA #$3f
09a6 : 8d 02 dd STA $dd02 
09a9 : ad 0d dc LDA $dc0d 
09ac : ad 0d dd LDA $dd0d 
.s3:
09af : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
09b0 : a4 0d __ LDY P0 ; (mode + 0)
09b2 : c0 02 __ CPY #$02
09b4 : d0 09 __ BNE $09bf ; (vic_setmode.s5 + 0)
.s10:
09b6 : a9 5b __ LDA #$5b
09b8 : 8d 11 d0 STA $d011 
.s8:
09bb : a9 08 __ LDA #$08
09bd : d0 0c __ BNE $09cb ; (vic_setmode.s7 + 0)
.s5:
09bf : b0 36 __ BCS $09f7 ; (vic_setmode.s6 + 0)
.s9:
09c1 : a9 1b __ LDA #$1b
09c3 : 8d 11 d0 STA $d011 
09c6 : 98 __ __ TYA
09c7 : f0 f2 __ BEQ $09bb ; (vic_setmode.s8 + 0)
.s11:
09c9 : a9 18 __ LDA #$18
.s7:
09cb : 8d 16 d0 STA $d016 
09ce : ad 00 dd LDA $dd00 
09d1 : 29 fc __ AND #$fc
09d3 : 85 1b __ STA ACCU + 0 
09d5 : a5 0f __ LDA P2 ; (text + 1)
09d7 : 0a __ __ ASL
09d8 : 2a __ __ ROL
09d9 : 29 01 __ AND #$01
09db : 2a __ __ ROL
09dc : 49 03 __ EOR #$03
09de : 05 1b __ ORA ACCU + 0 
09e0 : 8d 00 dd STA $dd00 
09e3 : a5 0f __ LDA P2 ; (text + 1)
09e5 : 29 3c __ AND #$3c
09e7 : 0a __ __ ASL
09e8 : 0a __ __ ASL
09e9 : 85 1b __ STA ACCU + 0 
09eb : a5 11 __ LDA P4 ; (font + 1)
09ed : 29 38 __ AND #$38
09ef : 4a __ __ LSR
09f0 : 4a __ __ LSR
09f1 : 05 1b __ ORA ACCU + 0 
09f3 : 8d 18 d0 STA $d018 
.s3:
09f6 : 60 __ __ RTS
.s6:
09f7 : a9 3b __ LDA #$3b
09f9 : 8d 11 d0 STA $d011 
09fc : c0 03 __ CPY #$03
09fe : d0 c9 __ BNE $09c9 ; (vic_setmode.s11 + 0)
0a00 : f0 b9 __ BEQ $09bb ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
;  15, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0a02 : a5 11 __ LDA P4 ; (sx + 0)
0a04 : a0 00 __ LDY #$00
0a06 : 91 0d __ STA (P0),y ; (win + 0)
0a08 : a5 12 __ LDA P5 ; (sy + 0)
0a0a : c8 __ __ INY
0a0b : 91 0d __ STA (P0),y ; (win + 0)
0a0d : a5 13 __ LDA P6 ; (wx + 0)
0a0f : c8 __ __ INY
0a10 : 91 0d __ STA (P0),y ; (win + 0)
0a12 : a5 14 __ LDA P7 ; (wy + 0)
0a14 : c8 __ __ INY
0a15 : 91 0d __ STA (P0),y ; (win + 0)
0a17 : a9 00 __ LDA #$00
0a19 : c8 __ __ INY
0a1a : 91 0d __ STA (P0),y ; (win + 0)
0a1c : c8 __ __ INY
0a1d : 91 0d __ STA (P0),y ; (win + 0)
0a1f : 06 12 __ ASL P5 ; (sy + 0)
0a21 : a6 12 __ LDX P5 ; (sy + 0)
0a23 : bd be 0b LDA $0bbe,x ; (mul40[0] + 0)
0a26 : 85 12 __ STA P5 ; (sy + 0)
0a28 : 18 __ __ CLC
0a29 : 65 11 __ ADC P4 ; (sx + 0)
0a2b : a0 0a __ LDY #$0a
0a2d : 91 0d __ STA (P0),y ; (win + 0)
0a2f : bd bf 0b LDA $0bbf,x ; (mul40[0] + 1)
0a32 : aa __ __ TAX
0a33 : 69 d8 __ ADC #$d8
0a35 : c8 __ __ INY
0a36 : 91 0d __ STA (P0),y ; (win + 0)
0a38 : 18 __ __ CLC
0a39 : a5 0f __ LDA P2 ; (screen + 0)
0a3b : 65 12 __ ADC P5 ; (sy + 0)
0a3d : a8 __ __ TAY
0a3e : 8a __ __ TXA
0a3f : 65 10 __ ADC P3 ; (screen + 1)
0a41 : aa __ __ TAX
0a42 : 98 __ __ TYA
0a43 : 18 __ __ CLC
0a44 : 65 11 __ ADC P4 ; (sx + 0)
0a46 : a0 08 __ LDY #$08
0a48 : 91 0d __ STA (P0),y ; (win + 0)
0a4a : 8a __ __ TXA
0a4b : 69 00 __ ADC #$00
0a4d : c8 __ __ INY
0a4e : 91 0d __ STA (P0),y ; (win + 0)
.s3:
0a50 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_fill: ; cwin_fill(struct CharWin*,u8,u8)->void
;  24, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0a51 : a0 03 __ LDY #$03
0a53 : b1 0d __ LDA (P0),y ; (win + 0)
0a55 : f0 4c __ BEQ $0aa3 ; (cwin_fill.s3 + 0)
.s5:
0a57 : a0 08 __ LDY #$08
0a59 : b1 0d __ LDA (P0),y ; (win + 0)
0a5b : 85 1b __ STA ACCU + 0 
0a5d : c8 __ __ INY
0a5e : b1 0d __ LDA (P0),y ; (win + 0)
0a60 : 85 1c __ STA ACCU + 1 
0a62 : c8 __ __ INY
0a63 : b1 0d __ LDA (P0),y ; (win + 0)
0a65 : 85 43 __ STA T2 + 0 
0a67 : c8 __ __ INY
0a68 : b1 0d __ LDA (P0),y ; (win + 0)
0a6a : 85 44 __ STA T2 + 1 
0a6c : a2 00 __ LDX #$00
.l6:
0a6e : a0 02 __ LDY #$02
0a70 : b1 0d __ LDA (P0),y ; (win + 0)
0a72 : f0 11 __ BEQ $0a85 ; (cwin_fill.s7 + 0)
.s8:
0a74 : 85 1d __ STA ACCU + 2 
0a76 : a0 00 __ LDY #$00
.l9:
0a78 : a5 0f __ LDA P2 ; (ch + 0)
0a7a : 91 1b __ STA (ACCU + 0),y 
0a7c : a5 10 __ LDA P3 ; (color + 0)
0a7e : 91 43 __ STA (T2 + 0),y 
0a80 : c8 __ __ INY
0a81 : c4 1d __ CPY ACCU + 2 
0a83 : 90 f3 __ BCC $0a78 ; (cwin_fill.l9 + 0)
.s7:
0a85 : 18 __ __ CLC
0a86 : a5 43 __ LDA T2 + 0 
0a88 : 69 28 __ ADC #$28
0a8a : 85 43 __ STA T2 + 0 
0a8c : 90 03 __ BCC $0a91 ; (cwin_fill.s11 + 0)
.s10:
0a8e : e6 44 __ INC T2 + 1 
0a90 : 18 __ __ CLC
.s11:
0a91 : a5 1b __ LDA ACCU + 0 
0a93 : 69 28 __ ADC #$28
0a95 : 85 1b __ STA ACCU + 0 
0a97 : 90 02 __ BCC $0a9b ; (cwin_fill.s13 + 0)
.s12:
0a99 : e6 1c __ INC ACCU + 1 
.s13:
0a9b : e8 __ __ INX
0a9c : 8a __ __ TXA
0a9d : a0 03 __ LDY #$03
0a9f : d1 0d __ CMP (P0),y ; (win + 0)
0aa1 : 90 cb __ BCC $0a6e ; (cwin_fill.l6 + 0)
.s3:
0aa3 : 60 __ __ RTS
--------------------------------------------------------------------
callbank: ; callbank(u8)->void
; 189, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
0aa4 : ad ff 7f LDA $7fff ; (sstack + 0)
0aa7 : 8d 00 de STA $de00 
0aaa : a9 00 __ LDA #$00
0aac : 85 11 __ STA P4 
0aae : 85 0d __ STA P0 
0ab0 : 85 0f __ STA P2 
0ab2 : a9 10 __ LDA #$10
0ab4 : 85 12 __ STA P5 
0ab6 : a9 80 __ LDA #$80
0ab8 : 85 10 __ STA P3 
0aba : a9 70 __ LDA #$70
0abc : 85 0e __ STA P1 
0abe : 20 db 0a JSR $0adb ; (memcpy.s4 + 0)
0ac1 : ad 00 70 LDA $7000 
0ac4 : 85 1b __ STA ACCU + 0 
0ac6 : ad 01 70 LDA $7001 
0ac9 : 85 1c __ STA ACCU + 1 
0acb : 20 bb 0b JSR $0bbb ; (bcexec + 0)
0ace : ad 02 70 LDA $7002 
0ad1 : 85 1b __ STA ACCU + 0 
0ad3 : ad 03 70 LDA $7003 
0ad6 : 85 1c __ STA ACCU + 1 
0ad8 : 6c 1b 00 JMP ($001b)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void*
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0adb : a6 12 __ LDX P5 
0add : f0 10 __ BEQ $0aef ; (memcpy.s4 + 20)
0adf : a0 00 __ LDY #$00
0ae1 : b1 0f __ LDA (P2),y 
0ae3 : 91 0d __ STA (P0),y ; (dst + 0)
0ae5 : c8 __ __ INY
0ae6 : d0 f9 __ BNE $0ae1 ; (memcpy.s4 + 6)
0ae8 : e6 10 __ INC P3 
0aea : e6 0e __ INC P1 ; (dst + 1)
0aec : ca __ __ DEX
0aed : d0 f2 __ BNE $0ae1 ; (memcpy.s4 + 6)
0aef : a4 11 __ LDY P4 
0af1 : f0 0e __ BEQ $0b01 ; (memcpy.s4 + 38)
0af3 : 88 __ __ DEY
0af4 : f0 07 __ BEQ $0afd ; (memcpy.s4 + 34)
0af6 : b1 0f __ LDA (P2),y 
0af8 : 91 0d __ STA (P0),y ; (dst + 0)
0afa : 88 __ __ DEY
0afb : d0 f9 __ BNE $0af6 ; (memcpy.s4 + 27)
0afd : b1 0f __ LDA (P2),y 
0aff : 91 0d __ STA (P0),y ; (dst + 0)
0b01 : a5 0d __ LDA P0 ; (dst + 0)
0b03 : 85 1b __ STA ACCU + 0 
0b05 : a5 0e __ LDA P1 ; (dst + 1)
0b07 : 85 1c __ STA ACCU + 1 
.s3:
0b09 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->u8
;  64, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0b0a : a5 14 __ LDA P7 ; (win + 0)
0b0c : 85 0d __ STA P0 
0b0e : a5 15 __ LDA P8 ; (win + 1)
0b10 : 85 0e __ STA P1 
0b12 : a0 04 __ LDY #$04
0b14 : b1 14 __ LDA (P7),y ; (win + 0)
0b16 : 85 0f __ STA P2 
0b18 : c8 __ __ INY
0b19 : b1 14 __ LDA (P7),y ; (win + 0)
0b1b : 85 10 __ STA P3 
0b1d : a5 16 __ LDA P9 ; (str + 0)
0b1f : 85 11 __ STA P4 
0b21 : a5 17 __ LDA P10 ; (str + 1)
0b23 : 85 12 __ STA P5 
0b25 : a5 18 __ LDA P11 ; (color + 0)
0b27 : 85 13 __ STA P6 
0b29 : 20 4a 0b JSR $0b4a ; (cwin_putat_string.s4 + 0)
0b2c : 85 1b __ STA ACCU + 0 
0b2e : 18 __ __ CLC
0b2f : a0 04 __ LDY #$04
0b31 : 71 14 __ ADC (P7),y ; (win + 0)
0b33 : 91 14 __ STA (P7),y ; (win + 0)
0b35 : a0 02 __ LDY #$02
0b37 : d1 14 __ CMP (P7),y ; (win + 0)
0b39 : 90 0e __ BCC $0b49 ; (cwin_put_string.s3 + 0)
.s5:
0b3b : a9 00 __ LDA #$00
0b3d : a0 04 __ LDY #$04
0b3f : 91 14 __ STA (P7),y ; (win + 0)
0b41 : 18 __ __ CLC
0b42 : c8 __ __ INY
0b43 : b1 14 __ LDA (P7),y ; (win + 0)
0b45 : 69 01 __ ADC #$01
0b47 : 91 14 __ STA (P7),y ; (win + 0)
.s3:
0b49 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string: ; cwin_putat_string(struct CharWin*,u8,u8,const u8*,u8)->u8
;  90, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0b4a : a5 10 __ LDA P3 ; (y + 0)
0b4c : 0a __ __ ASL
0b4d : aa __ __ TAX
0b4e : bd be 0b LDA $0bbe,x ; (mul40[0] + 0)
0b51 : 65 0f __ ADC P2 ; (x + 0)
0b53 : 85 1b __ STA ACCU + 0 
0b55 : bd bf 0b LDA $0bbf,x ; (mul40[0] + 1)
0b58 : 69 00 __ ADC #$00
0b5a : 85 1c __ STA ACCU + 1 
0b5c : a0 08 __ LDY #$08
0b5e : b1 0d __ LDA (P0),y ; (win + 0)
0b60 : 65 1b __ ADC ACCU + 0 
0b62 : 85 43 __ STA T2 + 0 
0b64 : c8 __ __ INY
0b65 : b1 0d __ LDA (P0),y ; (win + 0)
0b67 : 65 1c __ ADC ACCU + 1 
0b69 : 85 44 __ STA T2 + 1 
0b6b : c8 __ __ INY
0b6c : b1 0d __ LDA (P0),y ; (win + 0)
0b6e : 18 __ __ CLC
0b6f : 65 1b __ ADC ACCU + 0 
0b71 : 85 1b __ STA ACCU + 0 
0b73 : c8 __ __ INY
0b74 : b1 0d __ LDA (P0),y ; (win + 0)
0b76 : 65 1c __ ADC ACCU + 1 
0b78 : 85 1c __ STA ACCU + 1 
0b7a : a0 00 __ LDY #$00
0b7c : b1 11 __ LDA (P4),y ; (str + 0)
0b7e : f0 16 __ BEQ $0b96 ; (cwin_putat_string.s5 + 0)
.l6:
0b80 : 4a __ __ LSR
0b81 : 4a __ __ LSR
0b82 : 4a __ __ LSR
0b83 : 4a __ __ LSR
0b84 : 4a __ __ LSR
0b85 : aa __ __ TAX
0b86 : bd f0 0b LDA $0bf0,x ; (p2smap[0] + 0)
0b89 : 51 11 __ EOR (P4),y ; (str + 0)
0b8b : 91 43 __ STA (T2 + 0),y 
0b8d : a5 13 __ LDA P6 ; (color + 0)
0b8f : 91 1b __ STA (ACCU + 0),y 
0b91 : c8 __ __ INY
0b92 : b1 11 __ LDA (P4),y ; (str + 0)
0b94 : d0 ea __ BNE $0b80 ; (cwin_putat_string.l6 + 0)
.s5:
0b96 : 98 __ __ TYA
.s3:
0b97 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->bool
;  44, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0b98 : a9 00 __ LDA #$00
0b9a : a0 04 __ LDY #$04
0b9c : 91 0d __ STA (P0),y ; (win + 0)
0b9e : 88 __ __ DEY
0b9f : b1 0d __ LDA (P0),y ; (win + 0)
0ba1 : 85 1b __ STA ACCU + 0 
0ba3 : a0 05 __ LDY #$05
0ba5 : b1 0d __ LDA (P0),y ; (win + 0)
0ba7 : aa __ __ TAX
0ba8 : 18 __ __ CLC
0ba9 : 69 01 __ ADC #$01
0bab : b0 0b __ BCS $0bb8 ; (cwin_cursor_newline.s5 + 0)
.s7:
0bad : c5 1b __ CMP ACCU + 0 
0baf : b0 07 __ BCS $0bb8 ; (cwin_cursor_newline.s5 + 0)
.s6:
0bb1 : e8 __ __ INX
0bb2 : 8a __ __ TXA
0bb3 : 91 0d __ STA (P0),y ; (win + 0)
0bb5 : a9 01 __ LDA #$01
0bb7 : 60 __ __ RTS
.s5:
0bb8 : a9 00 __ LDA #$00
.s3:
0bba : 60 __ __ RTS
--------------------------------------------------------------------
bcexec: ; bcexec
0bbb : 6c 1b 00 JMP ($001b)
--------------------------------------------------------------------
mul40:
0bbe : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
0bce : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
0bde : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
0bee : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
0bf0 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
cw:
0c00 : __ __ __ BSS	12
--------------------------------------------------------------------
entry1:
01:8000 : __ __ __ BYT 04 70 2e 70                                     : .p.p
--------------------------------------------------------------------
print1: ; print1()->void
;  60, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
01:8004 : a9 07 __ LDA #$07
01:8006 : 85 18 __ STA P11 
01:8008 : a9 70 __ LDA #$70
01:800a : 85 17 __ STA P10 
01:800c : a9 00 __ LDA #$00
01:800e : 85 14 __ STA P7 
01:8010 : a9 0c __ LDA #$0c
01:8012 : 85 15 __ STA P8 
01:8014 : a9 1b __ LDA #$1b
01:8016 : 85 16 __ STA P9 
01:8018 : 4c 0a 0b JMP $0b0a ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
01:801b : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 52 53 54 20 42 41 : .HIS IS FIRST BA
01:802b : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
done1: ; done1()->void
;  65, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
01:802e : a9 00 __ LDA #$00
01:8030 : 85 0d __ STA P0 
01:8032 : a9 0c __ LDA #$0c
01:8034 : 85 0e __ STA P1 
01:8036 : 4c 98 0b JMP $0b98 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
entry2:
02:8000 : __ __ __ BYT 04 70 2f 70                                     : .p/p
--------------------------------------------------------------------
print2: ; print2()->void
;  83, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
02:8004 : a9 07 __ LDA #$07
02:8006 : 85 18 __ STA P11 
02:8008 : a9 70 __ LDA #$70
02:800a : 85 17 __ STA P10 
02:800c : a9 00 __ LDA #$00
02:800e : 85 14 __ STA P7 
02:8010 : a9 0c __ LDA #$0c
02:8012 : 85 15 __ STA P8 
02:8014 : a9 1b __ LDA #$1b
02:8016 : 85 16 __ STA P9 
02:8018 : 4c 0a 0b JMP $0b0a ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
02:801b : __ __ __ BYT d4 48 49 53 20 49 53 20 53 45 43 4f 4e 44 20 42 : .HIS IS SECOND B
02:802b : __ __ __ BYT 41 4e 4b 00                                     : ANK.
--------------------------------------------------------------------
done2: ; done2()->void
;  88, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
02:802f : a9 00 __ LDA #$00
02:8031 : 85 0d __ STA P0 
02:8033 : a9 0c __ LDA #$0c
02:8035 : 85 0e __ STA P1 
02:8037 : 4c 98 0b JMP $0b98 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
entry3:
03:8000 : __ __ __ BYT 04 70 2e 70                                     : .p.p
--------------------------------------------------------------------
print3: ; print3()->void
; 104, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
03:8004 : a9 07 __ LDA #$07
03:8006 : 85 18 __ STA P11 
03:8008 : a9 70 __ LDA #$70
03:800a : 85 17 __ STA P10 
03:800c : a9 00 __ LDA #$00
03:800e : 85 14 __ STA P7 
03:8010 : a9 0c __ LDA #$0c
03:8012 : 85 15 __ STA P8 
03:8014 : a9 1b __ LDA #$1b
03:8016 : 85 16 __ STA P9 
03:8018 : 4c 0a 0b JMP $0b0a ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
03:801b : __ __ __ BYT d4 48 49 53 20 49 53 20 54 48 49 52 44 20 42 41 : .HIS IS THIRD BA
03:802b : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
done3: ; done3()->void
; 109, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
03:802e : a9 00 __ LDA #$00
03:8030 : 85 0d __ STA P0 
03:8032 : a9 0c __ LDA #$0c
03:8034 : 85 0e __ STA P1 
03:8036 : 4c 98 0b JMP $0b98 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
entry4:
04:8000 : __ __ __ BYT 04 70 2f 70                                     : .p/p
--------------------------------------------------------------------
print4: ; print4()->void
; 124, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
04:8004 : a9 07 __ LDA #$07
04:8006 : 85 18 __ STA P11 
04:8008 : a9 70 __ LDA #$70
04:800a : 85 17 __ STA P10 
04:800c : a9 00 __ LDA #$00
04:800e : 85 14 __ STA P7 
04:8010 : a9 0c __ LDA #$0c
04:8012 : 85 15 __ STA P8 
04:8014 : a9 1b __ LDA #$1b
04:8016 : 85 16 __ STA P9 
04:8018 : 4c 0a 0b JMP $0b0a ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
04:801b : __ __ __ BYT d4 48 49 53 20 49 53 20 46 4f 55 52 54 48 20 42 : .HIS IS FOURTH B
04:802b : __ __ __ BYT 41 4e 4b 00                                     : ANK.
--------------------------------------------------------------------
done4: ; done4()->void
; 129, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
04:802f : a9 00 __ LDA #$00
04:8031 : 85 0d __ STA P0 
04:8033 : a9 0c __ LDA #$0c
04:8035 : 85 0e __ STA P1 
04:8037 : 4c 98 0b JMP $0b98 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
entry5:
05:8000 : __ __ __ BYT 04 70 2e 70                                     : .p.p
--------------------------------------------------------------------
print5: ; print5()->void
; 144, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
05:8004 : a9 07 __ LDA #$07
05:8006 : 85 18 __ STA P11 
05:8008 : a9 70 __ LDA #$70
05:800a : 85 17 __ STA P10 
05:800c : a9 00 __ LDA #$00
05:800e : 85 14 __ STA P7 
05:8010 : a9 0c __ LDA #$0c
05:8012 : 85 15 __ STA P8 
05:8014 : a9 1b __ LDA #$1b
05:8016 : 85 16 __ STA P9 
05:8018 : 4c 0a 0b JMP $0b0a ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
05:801b : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 46 54 48 20 42 41 : .HIS IS FIFTH BA
05:802b : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
done5: ; done5()->void
; 149, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
05:802e : a9 00 __ LDA #$00
05:8030 : 85 0d __ STA P0 
05:8032 : a9 0c __ LDA #$0c
05:8034 : 85 0e __ STA P1 
05:8036 : 4c 98 0b JMP $0b98 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
entry6:
06:8000 : __ __ __ BYT 04 70 2e 70                                     : .p.p
--------------------------------------------------------------------
print6: ; print6()->void
; 164, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
06:8004 : a9 07 __ LDA #$07
06:8006 : 85 18 __ STA P11 
06:8008 : a9 70 __ LDA #$70
06:800a : 85 17 __ STA P10 
06:800c : a9 00 __ LDA #$00
06:800e : 85 14 __ STA P7 
06:8010 : a9 0c __ LDA #$0c
06:8012 : 85 15 __ STA P8 
06:8014 : a9 1b __ LDA #$1b
06:8016 : 85 16 __ STA P9 
06:8018 : 4c 0a 0b JMP $0b0a ; (cwin_put_string.s4 + 0)
--------------------------------------------------------------------
06:801b : __ __ __ BYT d4 48 49 53 20 49 53 20 53 49 58 54 48 20 42 41 : .HIS IS SIXTH BA
06:802b : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
done6: ; done6()->void
; 169, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflashreloc.c"
.s4:
06:802e : a9 00 __ LDA #$00
06:8030 : 85 0d __ STA P0 
06:8032 : a9 0c __ LDA #$0c
06:8034 : 85 0e __ STA P1 
06:8036 : 4c 98 0b JMP $0b98 ; (cwin_cursor_newline.s4 + 0)
