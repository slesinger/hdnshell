; Compiled with 1.32.268
--------------------------------------------------------------------
startup: ; startup
0800 : 09 80 __ ORA #$80
0802 : bc fe c3 LDY $c3fe,x 
0805 : c2 __ __ INV
0806 : cd 38 30 CMP $3038 
0809 : a2 00 __ LDX #$00
080b : bd 00 80 LDA $8000,x ; (print1.s4 + 0)
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
0896 : a0 b6 __ LDY #$b6
0898 : a9 00 __ LDA #$00
089a : 85 19 __ STA IP + 0 
089c : 86 1a __ STX IP + 1 
089e : e0 0b __ CPX #$0b
08a0 : f0 0b __ BEQ $08ad ; (startup + 173)
08a2 : 91 19 __ STA (IP + 0),y 
08a4 : c8 __ __ INY
08a5 : d0 fb __ BNE $08a2 ; (startup + 162)
08a7 : e8 __ __ INX
08a8 : d0 f2 __ BNE $089c ; (startup + 156)
08aa : 91 19 __ STA (IP + 0),y 
08ac : c8 __ __ INY
08ad : c0 c2 __ CPY #$c2
08af : d0 f9 __ BNE $08aa ; (startup + 170)
08b1 : a9 00 __ LDA #$00
08b3 : a2 f7 __ LDX #$f7
08b5 : d0 03 __ BNE $08ba ; (startup + 186)
08b7 : 95 00 __ STA $00,x 
08b9 : e8 __ __ INX
08ba : e0 f7 __ CPX #$f7
08bc : d0 f9 __ BNE $08b7 ; (startup + 183)
08be : a9 fb __ LDA #$fb
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
; 119, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
0900 : a9 37 __ LDA #$37
0902 : 85 01 __ STA $01 
0904 : a9 00 __ LDA #$00
0906 : 85 0d __ STA P0 
0908 : 20 8d 09 JSR $098d ; (cia_init.s4 + 0)
090b : a9 00 __ LDA #$00
090d : 85 0e __ STA P1 
090f : 85 10 __ STA P3 
0911 : a9 04 __ LDA #$04
0913 : 85 0f __ STA P2 
0915 : a9 18 __ LDA #$18
0917 : 85 11 __ STA P4 
0919 : 20 c4 09 JSR $09c4 ; (vic_setmode.s4 + 0)
091c : a9 00 __ LDA #$00
091e : 85 0f __ STA P2 
0920 : 85 11 __ STA P4 
0922 : 85 12 __ STA P5 
0924 : a9 04 __ LDA #$04
0926 : 85 10 __ STA P3 
0928 : a9 0b __ LDA #$0b
092a : 85 0e __ STA P1 
092c : a9 28 __ LDA #$28
092e : 85 13 __ STA P6 
0930 : a9 19 __ LDA #$19
0932 : 85 14 __ STA P7 
0934 : a9 b6 __ LDA #$b6
0936 : 85 0d __ STA P0 
0938 : 20 16 0a JSR $0a16 ; (cwin_init.s4 + 0)
093b : a9 20 __ LDA #$20
093d : 85 0f __ STA P2 
093f : a9 01 __ LDA #$01
0941 : 85 10 __ STA P3 
0943 : 20 65 0a JSR $0a65 ; (cwin_fill.s4 + 0)
0946 : a9 01 __ LDA #$01
0948 : 8d 00 de STA $de00 
094b : 20 00 80 JSR $8000 ; (print1.s4 + 0)
094e : a9 02 __ LDA #$02
0950 : 8d 00 de STA $de00 
0953 : 20 00 80 JSR $8000 ; (print1.s4 + 0)
0956 : a9 03 __ LDA #$03
0958 : 8d 00 de STA $de00 
095b : 20 00 80 JSR $8000 ; (print1.s4 + 0)
095e : a9 04 __ LDA #$04
0960 : 8d 00 de STA $de00 
0963 : 20 00 80 JSR $8000 ; (print1.s4 + 0)
0966 : a9 05 __ LDA #$05
0968 : 8d fd 7f STA $7ffd ; (sstack + 0)
096b : a9 00 __ LDA #$00
096d : 8d fe 7f STA $7ffe ; (sstack + 1)
0970 : a9 80 __ LDA #$80
0972 : 8d ff 7f STA $7fff ; (sstack + 2)
0975 : 20 69 0b JSR $0b69 ; (fcall.s4 + 0)
0978 : a9 06 __ LDA #$06
097a : 8d fd 7f STA $7ffd ; (sstack + 0)
097d : a9 00 __ LDA #$00
097f : 8d fe 7f STA $7ffe ; (sstack + 1)
0982 : a9 80 __ LDA #$80
0984 : 8d ff 7f STA $7fff ; (sstack + 2)
0987 : 20 69 0b JSR $0b69 ; (fcall.s4 + 0)
.l5:
098a : 4c 8a 09 JMP $098a ; (main.l5 + 0)
--------------------------------------------------------------------
cia_init: ; cia_init()->void
;  22, "/home/honza/projects/c64/projects/oscar64/include/c64/cia.h"
.s4:
098d : a9 7f __ LDA #$7f
098f : 8d 0d dc STA $dc0d 
0992 : 8d 0d dd STA $dd0d 
0995 : 8d 00 dc STA $dc00 
0998 : a9 08 __ LDA #$08
099a : 8d 0e dc STA $dc0e 
099d : 8d 0f dc STA $dc0f 
09a0 : 8d 0e dd STA $dd0e 
09a3 : 8d 0f dd STA $dd0f 
09a6 : a9 00 __ LDA #$00
09a8 : 8d 03 dc STA $dc03 
09ab : 8d 03 dd STA $dd03 
09ae : a9 ff __ LDA #$ff
09b0 : 8d 02 dc STA $dc02 
09b3 : a9 07 __ LDA #$07
09b5 : 8d 00 dd STA $dd00 
09b8 : a9 3f __ LDA #$3f
09ba : 8d 02 dd STA $dd02 
09bd : ad 0d dc LDA $dc0d 
09c0 : ad 0d dd LDA $dd0d 
.s3:
09c3 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
09c4 : a4 0d __ LDY P0 ; (mode + 0)
09c6 : c0 02 __ CPY #$02
09c8 : d0 09 __ BNE $09d3 ; (vic_setmode.s5 + 0)
.s10:
09ca : a9 5b __ LDA #$5b
09cc : 8d 11 d0 STA $d011 
.s8:
09cf : a9 08 __ LDA #$08
09d1 : d0 0c __ BNE $09df ; (vic_setmode.s7 + 0)
.s5:
09d3 : b0 36 __ BCS $0a0b ; (vic_setmode.s6 + 0)
.s9:
09d5 : a9 1b __ LDA #$1b
09d7 : 8d 11 d0 STA $d011 
09da : 98 __ __ TYA
09db : f0 f2 __ BEQ $09cf ; (vic_setmode.s8 + 0)
.s11:
09dd : a9 18 __ LDA #$18
.s7:
09df : 8d 16 d0 STA $d016 
09e2 : ad 00 dd LDA $dd00 
09e5 : 29 fc __ AND #$fc
09e7 : 85 1b __ STA ACCU + 0 
09e9 : a5 0f __ LDA P2 ; (text + 1)
09eb : 0a __ __ ASL
09ec : 2a __ __ ROL
09ed : 29 01 __ AND #$01
09ef : 2a __ __ ROL
09f0 : 49 03 __ EOR #$03
09f2 : 05 1b __ ORA ACCU + 0 
09f4 : 8d 00 dd STA $dd00 
09f7 : a5 0f __ LDA P2 ; (text + 1)
09f9 : 29 3c __ AND #$3c
09fb : 0a __ __ ASL
09fc : 0a __ __ ASL
09fd : 85 1b __ STA ACCU + 0 
09ff : a5 11 __ LDA P4 ; (font + 1)
0a01 : 29 38 __ AND #$38
0a03 : 4a __ __ LSR
0a04 : 4a __ __ LSR
0a05 : 05 1b __ ORA ACCU + 0 
0a07 : 8d 18 d0 STA $d018 
.s3:
0a0a : 60 __ __ RTS
.s6:
0a0b : a9 3b __ LDA #$3b
0a0d : 8d 11 d0 STA $d011 
0a10 : c0 03 __ CPY #$03
0a12 : d0 c9 __ BNE $09dd ; (vic_setmode.s11 + 0)
0a14 : f0 b9 __ BEQ $09cf ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
;  15, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0a16 : a5 11 __ LDA P4 ; (sx + 0)
0a18 : a0 00 __ LDY #$00
0a1a : 91 0d __ STA (P0),y ; (win + 0)
0a1c : a5 12 __ LDA P5 ; (sy + 0)
0a1e : c8 __ __ INY
0a1f : 91 0d __ STA (P0),y ; (win + 0)
0a21 : a5 13 __ LDA P6 ; (wx + 0)
0a23 : c8 __ __ INY
0a24 : 91 0d __ STA (P0),y ; (win + 0)
0a26 : a5 14 __ LDA P7 ; (wy + 0)
0a28 : c8 __ __ INY
0a29 : 91 0d __ STA (P0),y ; (win + 0)
0a2b : a9 00 __ LDA #$00
0a2d : c8 __ __ INY
0a2e : 91 0d __ STA (P0),y ; (win + 0)
0a30 : c8 __ __ INY
0a31 : 91 0d __ STA (P0),y ; (win + 0)
0a33 : 06 12 __ ASL P5 ; (sy + 0)
0a35 : a6 12 __ LDX P5 ; (sy + 0)
0a37 : bd 7c 0b LDA $0b7c,x ; (mul40[0] + 0)
0a3a : 85 12 __ STA P5 ; (sy + 0)
0a3c : 18 __ __ CLC
0a3d : 65 11 __ ADC P4 ; (sx + 0)
0a3f : a0 0a __ LDY #$0a
0a41 : 91 0d __ STA (P0),y ; (win + 0)
0a43 : bd 7d 0b LDA $0b7d,x ; (mul40[0] + 1)
0a46 : aa __ __ TAX
0a47 : 69 d8 __ ADC #$d8
0a49 : c8 __ __ INY
0a4a : 91 0d __ STA (P0),y ; (win + 0)
0a4c : 18 __ __ CLC
0a4d : a5 0f __ LDA P2 ; (screen + 0)
0a4f : 65 12 __ ADC P5 ; (sy + 0)
0a51 : a8 __ __ TAY
0a52 : 8a __ __ TXA
0a53 : 65 10 __ ADC P3 ; (screen + 1)
0a55 : aa __ __ TAX
0a56 : 98 __ __ TYA
0a57 : 18 __ __ CLC
0a58 : 65 11 __ ADC P4 ; (sx + 0)
0a5a : a0 08 __ LDY #$08
0a5c : 91 0d __ STA (P0),y ; (win + 0)
0a5e : 8a __ __ TXA
0a5f : 69 00 __ ADC #$00
0a61 : c8 __ __ INY
0a62 : 91 0d __ STA (P0),y ; (win + 0)
.s3:
0a64 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_fill: ; cwin_fill(struct CharWin*,u8,u8)->void
;  24, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0a65 : a0 03 __ LDY #$03
0a67 : b1 0d __ LDA (P0),y ; (win + 0)
0a69 : f0 4c __ BEQ $0ab7 ; (cwin_fill.s3 + 0)
.s5:
0a6b : a0 08 __ LDY #$08
0a6d : b1 0d __ LDA (P0),y ; (win + 0)
0a6f : 85 1b __ STA ACCU + 0 
0a71 : c8 __ __ INY
0a72 : b1 0d __ LDA (P0),y ; (win + 0)
0a74 : 85 1c __ STA ACCU + 1 
0a76 : c8 __ __ INY
0a77 : b1 0d __ LDA (P0),y ; (win + 0)
0a79 : 85 43 __ STA T2 + 0 
0a7b : c8 __ __ INY
0a7c : b1 0d __ LDA (P0),y ; (win + 0)
0a7e : 85 44 __ STA T2 + 1 
0a80 : a2 00 __ LDX #$00
.l6:
0a82 : a0 02 __ LDY #$02
0a84 : b1 0d __ LDA (P0),y ; (win + 0)
0a86 : f0 11 __ BEQ $0a99 ; (cwin_fill.s7 + 0)
.s8:
0a88 : 85 1d __ STA ACCU + 2 
0a8a : a0 00 __ LDY #$00
.l9:
0a8c : a5 0f __ LDA P2 ; (ch + 0)
0a8e : 91 1b __ STA (ACCU + 0),y 
0a90 : a5 10 __ LDA P3 ; (color + 0)
0a92 : 91 43 __ STA (T2 + 0),y 
0a94 : c8 __ __ INY
0a95 : c4 1d __ CPY ACCU + 2 
0a97 : 90 f3 __ BCC $0a8c ; (cwin_fill.l9 + 0)
.s7:
0a99 : 18 __ __ CLC
0a9a : a5 43 __ LDA T2 + 0 
0a9c : 69 28 __ ADC #$28
0a9e : 85 43 __ STA T2 + 0 
0aa0 : 90 03 __ BCC $0aa5 ; (cwin_fill.s11 + 0)
.s10:
0aa2 : e6 44 __ INC T2 + 1 
0aa4 : 18 __ __ CLC
.s11:
0aa5 : a5 1b __ LDA ACCU + 0 
0aa7 : 69 28 __ ADC #$28
0aa9 : 85 1b __ STA ACCU + 0 
0aab : 90 02 __ BCC $0aaf ; (cwin_fill.s13 + 0)
.s12:
0aad : e6 1c __ INC ACCU + 1 
.s13:
0aaf : e8 __ __ INX
0ab0 : 8a __ __ TXA
0ab1 : a0 03 __ LDY #$03
0ab3 : d1 0d __ CMP (P0),y ; (win + 0)
0ab5 : 90 cb __ BCC $0a82 ; (cwin_fill.l6 + 0)
.s3:
0ab7 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_put_string: ; cwin_put_string(struct CharWin*,const u8*,u8)->u8
;  64, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0ab8 : a5 14 __ LDA P7 ; (win + 0)
0aba : 85 0d __ STA P0 
0abc : a5 15 __ LDA P8 ; (win + 1)
0abe : 85 0e __ STA P1 
0ac0 : a0 04 __ LDY #$04
0ac2 : b1 14 __ LDA (P7),y ; (win + 0)
0ac4 : 85 0f __ STA P2 
0ac6 : c8 __ __ INY
0ac7 : b1 14 __ LDA (P7),y ; (win + 0)
0ac9 : 85 10 __ STA P3 
0acb : a5 16 __ LDA P9 ; (str + 0)
0acd : 85 11 __ STA P4 
0acf : a5 17 __ LDA P10 ; (str + 1)
0ad1 : 85 12 __ STA P5 
0ad3 : a5 18 __ LDA P11 ; (color + 0)
0ad5 : 85 13 __ STA P6 
0ad7 : 20 f8 0a JSR $0af8 ; (cwin_putat_string.s4 + 0)
0ada : 85 1b __ STA ACCU + 0 
0adc : 18 __ __ CLC
0add : a0 04 __ LDY #$04
0adf : 71 14 __ ADC (P7),y ; (win + 0)
0ae1 : 91 14 __ STA (P7),y ; (win + 0)
0ae3 : a0 02 __ LDY #$02
0ae5 : d1 14 __ CMP (P7),y ; (win + 0)
0ae7 : 90 0e __ BCC $0af7 ; (cwin_put_string.s3 + 0)
.s5:
0ae9 : a9 00 __ LDA #$00
0aeb : a0 04 __ LDY #$04
0aed : 91 14 __ STA (P7),y ; (win + 0)
0aef : 18 __ __ CLC
0af0 : c8 __ __ INY
0af1 : b1 14 __ LDA (P7),y ; (win + 0)
0af3 : 69 01 __ ADC #$01
0af5 : 91 14 __ STA (P7),y ; (win + 0)
.s3:
0af7 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string: ; cwin_putat_string(struct CharWin*,u8,u8,const u8*,u8)->u8
;  90, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0af8 : a5 10 __ LDA P3 ; (y + 0)
0afa : 0a __ __ ASL
0afb : aa __ __ TAX
0afc : bd 7c 0b LDA $0b7c,x ; (mul40[0] + 0)
0aff : 65 0f __ ADC P2 ; (x + 0)
0b01 : 85 1b __ STA ACCU + 0 
0b03 : bd 7d 0b LDA $0b7d,x ; (mul40[0] + 1)
0b06 : 69 00 __ ADC #$00
0b08 : 85 1c __ STA ACCU + 1 
0b0a : a0 08 __ LDY #$08
0b0c : b1 0d __ LDA (P0),y ; (win + 0)
0b0e : 65 1b __ ADC ACCU + 0 
0b10 : 85 43 __ STA T2 + 0 
0b12 : c8 __ __ INY
0b13 : b1 0d __ LDA (P0),y ; (win + 0)
0b15 : 65 1c __ ADC ACCU + 1 
0b17 : 85 44 __ STA T2 + 1 
0b19 : c8 __ __ INY
0b1a : b1 0d __ LDA (P0),y ; (win + 0)
0b1c : 18 __ __ CLC
0b1d : 65 1b __ ADC ACCU + 0 
0b1f : 85 1b __ STA ACCU + 0 
0b21 : c8 __ __ INY
0b22 : b1 0d __ LDA (P0),y ; (win + 0)
0b24 : 65 1c __ ADC ACCU + 1 
0b26 : 85 1c __ STA ACCU + 1 
0b28 : a0 00 __ LDY #$00
0b2a : b1 11 __ LDA (P4),y ; (str + 0)
0b2c : f0 16 __ BEQ $0b44 ; (cwin_putat_string.s5 + 0)
.l6:
0b2e : 4a __ __ LSR
0b2f : 4a __ __ LSR
0b30 : 4a __ __ LSR
0b31 : 4a __ __ LSR
0b32 : 4a __ __ LSR
0b33 : aa __ __ TAX
0b34 : bd ae 0b LDA $0bae,x ; (p2smap[0] + 0)
0b37 : 51 11 __ EOR (P4),y ; (str + 0)
0b39 : 91 43 __ STA (T2 + 0),y 
0b3b : a5 13 __ LDA P6 ; (color + 0)
0b3d : 91 1b __ STA (ACCU + 0),y 
0b3f : c8 __ __ INY
0b40 : b1 11 __ LDA (P4),y ; (str + 0)
0b42 : d0 ea __ BNE $0b2e ; (cwin_putat_string.l6 + 0)
.s5:
0b44 : 98 __ __ TYA
.s3:
0b45 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_cursor_newline: ; cwin_cursor_newline(struct CharWin*)->bool
;  44, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0b46 : a9 00 __ LDA #$00
0b48 : a0 04 __ LDY #$04
0b4a : 91 0d __ STA (P0),y ; (win + 0)
0b4c : 88 __ __ DEY
0b4d : b1 0d __ LDA (P0),y ; (win + 0)
0b4f : 85 1b __ STA ACCU + 0 
0b51 : a0 05 __ LDY #$05
0b53 : b1 0d __ LDA (P0),y ; (win + 0)
0b55 : aa __ __ TAX
0b56 : 18 __ __ CLC
0b57 : 69 01 __ ADC #$01
0b59 : b0 0b __ BCS $0b66 ; (cwin_cursor_newline.s5 + 0)
.s7:
0b5b : c5 1b __ CMP ACCU + 0 
0b5d : b0 07 __ BCS $0b66 ; (cwin_cursor_newline.s5 + 0)
.s6:
0b5f : e8 __ __ INX
0b60 : 8a __ __ TXA
0b61 : 91 0d __ STA (P0),y ; (win + 0)
0b63 : a9 01 __ LDA #$01
0b65 : 60 __ __ RTS
.s5:
0b66 : a9 00 __ LDA #$00
.s3:
0b68 : 60 __ __ RTS
--------------------------------------------------------------------
fcall: ; fcall(u8,void(*)()*)->void
; 110, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
0b69 : ad fd 7f LDA $7ffd ; (sstack + 0)
0b6c : 8d 00 de STA $de00 
0b6f : ad fe 7f LDA $7ffe ; (sstack + 1)
0b72 : 85 1b __ STA ACCU + 0 ; (func + 1)
0b74 : ad ff 7f LDA $7fff ; (sstack + 2)
0b77 : 85 1c __ STA ACCU + 1 
0b79 : 6c 1b 00 JMP ($001b)
--------------------------------------------------------------------
mul40:
0b7c : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
0b8c : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
0b9c : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
0bac : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
0bae : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
cw:
0bb6 : __ __ __ BSS	12
--------------------------------------------------------------------
print1: ; print1()->void
;  50, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
01:8000 : a9 07 __ LDA #$07
01:8002 : 85 18 __ STA P11 
01:8004 : a9 80 __ LDA #$80
01:8006 : 85 17 __ STA P10 
01:8008 : a9 b6 __ LDA #$b6
01:800a : 85 14 __ STA P7 
01:800c : a9 0b __ LDA #$0b
01:800e : 85 15 __ STA P8 
01:8010 : a9 22 __ LDA #$22
01:8012 : 85 16 __ STA P9 
01:8014 : 20 b8 0a JSR $0ab8 ; (cwin_put_string.s4 + 0)
01:8017 : a9 b6 __ LDA #$b6
01:8019 : 85 0d __ STA P0 
01:801b : a9 0b __ LDA #$0b
01:801d : 85 0e __ STA P1 
01:801f : 4c 46 0b JMP $0b46 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
01:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 52 53 54 20 42 41 : .HIS IS FIRST BA
01:8032 : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
print2: ; print2()->void
;  61, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
02:8000 : a9 07 __ LDA #$07
02:8002 : 85 18 __ STA P11 
02:8004 : a9 80 __ LDA #$80
02:8006 : 85 17 __ STA P10 
02:8008 : a9 b6 __ LDA #$b6
02:800a : 85 14 __ STA P7 
02:800c : a9 0b __ LDA #$0b
02:800e : 85 15 __ STA P8 
02:8010 : a9 22 __ LDA #$22
02:8012 : 85 16 __ STA P9 
02:8014 : 20 b8 0a JSR $0ab8 ; (cwin_put_string.s4 + 0)
02:8017 : a9 b6 __ LDA #$b6
02:8019 : 85 0d __ STA P0 
02:801b : a9 0b __ LDA #$0b
02:801d : 85 0e __ STA P1 
02:801f : 4c 46 0b JMP $0b46 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
02:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 53 45 43 4f 4e 44 20 42 : .HIS IS SECOND B
02:8032 : __ __ __ BYT 41 4e 4b 00                                     : ANK.
--------------------------------------------------------------------
print3: ; print3()->void
;  70, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
03:8000 : a9 07 __ LDA #$07
03:8002 : 85 18 __ STA P11 
03:8004 : a9 80 __ LDA #$80
03:8006 : 85 17 __ STA P10 
03:8008 : a9 b6 __ LDA #$b6
03:800a : 85 14 __ STA P7 
03:800c : a9 0b __ LDA #$0b
03:800e : 85 15 __ STA P8 
03:8010 : a9 22 __ LDA #$22
03:8012 : 85 16 __ STA P9 
03:8014 : 20 b8 0a JSR $0ab8 ; (cwin_put_string.s4 + 0)
03:8017 : a9 b6 __ LDA #$b6
03:8019 : 85 0d __ STA P0 
03:801b : a9 0b __ LDA #$0b
03:801d : 85 0e __ STA P1 
03:801f : 4c 46 0b JMP $0b46 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
03:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 54 48 49 52 44 20 42 41 : .HIS IS THIRD BA
03:8032 : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
print4: ; print4()->void
;  79, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
04:8000 : a9 07 __ LDA #$07
04:8002 : 85 18 __ STA P11 
04:8004 : a9 80 __ LDA #$80
04:8006 : 85 17 __ STA P10 
04:8008 : a9 b6 __ LDA #$b6
04:800a : 85 14 __ STA P7 
04:800c : a9 0b __ LDA #$0b
04:800e : 85 15 __ STA P8 
04:8010 : a9 22 __ LDA #$22
04:8012 : 85 16 __ STA P9 
04:8014 : 20 b8 0a JSR $0ab8 ; (cwin_put_string.s4 + 0)
04:8017 : a9 b6 __ LDA #$b6
04:8019 : 85 0d __ STA P0 
04:801b : a9 0b __ LDA #$0b
04:801d : 85 0e __ STA P1 
04:801f : 4c 46 0b JMP $0b46 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
04:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 46 4f 55 52 54 48 20 42 : .HIS IS FOURTH B
04:8032 : __ __ __ BYT 41 4e 4b 00                                     : ANK.
--------------------------------------------------------------------
print5: ; print5()->void
;  88, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
05:8000 : a9 07 __ LDA #$07
05:8002 : 85 18 __ STA P11 
05:8004 : a9 80 __ LDA #$80
05:8006 : 85 17 __ STA P10 
05:8008 : a9 b6 __ LDA #$b6
05:800a : 85 14 __ STA P7 
05:800c : a9 0b __ LDA #$0b
05:800e : 85 15 __ STA P8 
05:8010 : a9 22 __ LDA #$22
05:8012 : 85 16 __ STA P9 
05:8014 : 20 b8 0a JSR $0ab8 ; (cwin_put_string.s4 + 0)
05:8017 : a9 b6 __ LDA #$b6
05:8019 : 85 0d __ STA P0 
05:801b : a9 0b __ LDA #$0b
05:801d : 85 0e __ STA P1 
05:801f : 4c 46 0b JMP $0b46 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
05:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 46 49 46 54 48 20 42 41 : .HIS IS FIFTH BA
05:8032 : __ __ __ BYT 4e 4b 00                                        : NK.
--------------------------------------------------------------------
print6: ; print6()->void
;  97, "/home/honza/projects/c64/projects/oscar64/samples/memmap/easyflash.c"
.s4:
06:8000 : a9 07 __ LDA #$07
06:8002 : 85 18 __ STA P11 
06:8004 : a9 80 __ LDA #$80
06:8006 : 85 17 __ STA P10 
06:8008 : a9 b6 __ LDA #$b6
06:800a : 85 14 __ STA P7 
06:800c : a9 0b __ LDA #$0b
06:800e : 85 15 __ STA P8 
06:8010 : a9 22 __ LDA #$22
06:8012 : 85 16 __ STA P9 
06:8014 : 20 b8 0a JSR $0ab8 ; (cwin_put_string.s4 + 0)
06:8017 : a9 b6 __ LDA #$b6
06:8019 : 85 0d __ STA P0 
06:801b : a9 0b __ LDA #$0b
06:801d : 85 0e __ STA P1 
06:801f : 4c 46 0b JMP $0b46 ; (cwin_cursor_newline.s4 + 0)
--------------------------------------------------------------------
06:8022 : __ __ __ BYT d4 48 49 53 20 49 53 20 53 49 58 54 48 20 42 41 : .HIS IS SIXTH BA
06:8032 : __ __ __ BYT 4e 4b 00                                        : NK.
