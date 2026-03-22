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
080e : 8e 9a 1c STX $1c9a ; (spentry + 0)
0811 : a2 33 __ LDX #$33
0813 : a0 5f __ LDY #$5f
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 36 __ CPX #$36
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 53 __ CPY #$53
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 f2 __ LDA #$f2
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
; 772, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
0880 : 20 8e 09 JSR $098e ; (mmap_trampoline.s4 + 0)
0883 : a9 00 __ LDA #$00
0885 : 85 11 __ STA P4 
0887 : 85 0d __ STA P0 
0889 : a9 30 __ LDA #$30
088b : 85 01 __ STA $01 
088d : a9 08 __ LDA #$08
088f : 85 12 __ STA P5 
0891 : a9 1c __ LDA #$1c
0893 : 85 10 __ STA P3 
0895 : a9 d0 __ LDA #$d0
0897 : 85 0e __ STA P1 
0899 : a9 9b __ LDA #$9b
089b : 85 0f __ STA P2 
089d : 20 d8 09 JSR $09d8 ; (memcpy.s4 + 0)
08a0 : a0 00 __ LDY #$00
.l6:
08a2 : b9 9b 24 LDA $249b,y ; (spriteset[0] + 0)
08a5 : 99 00 d8 STA $d800,y 
08a8 : c8 __ __ INY
08a9 : d0 f7 __ BNE $08a2 ; (main.l6 + 0)
.s5:
08ab : 84 10 __ STY P3 
08ad : 84 0e __ STY P1 
08af : a9 36 __ LDA #$36
08b1 : 85 01 __ STA $01 
08b3 : a9 01 __ LDA #$01
08b5 : 85 0d __ STA P0 
08b7 : a9 c8 __ LDA #$c8
08b9 : 85 0f __ STA P2 
08bb : a9 d0 __ LDA #$d0
08bd : 85 11 __ STA P4 
08bf : 20 07 0a JSR $0a07 ; (vic_setmode.s4 + 0)
08c2 : a9 00 __ LDA #$00
08c4 : 85 0f __ STA P2 
08c6 : 85 12 __ STA P5 
08c8 : a9 c8 __ LDA #$c8
08ca : 85 10 __ STA P3 
08cc : a9 05 __ LDA #$05
08ce : 85 11 __ STA P4 
08d0 : a9 1e __ LDA #$1e
08d2 : 85 13 __ STA P6 
08d4 : a9 06 __ LDA #$06
08d6 : 8d 20 d0 STA $d020 
08d9 : a9 00 __ LDA #$00
08db : 8d 21 d0 STA $d021 
08de : a9 06 __ LDA #$06
08e0 : 8d 22 d0 STA $d022 
08e3 : a9 01 __ LDA #$01
08e5 : 85 14 __ STA P7 
08e7 : 8d 23 d0 STA $d023 
08ea : a9 0b __ LDA #$0b
08ec : 8d 25 d0 STA $d025 
08ef : a9 01 __ LDA #$01
08f1 : 8d 26 d0 STA $d026 
08f4 : a9 f8 __ LDA #$f8
08f6 : 8d fc 2c STA $2cfc ; (vspriteScreen + 0)
08f9 : a9 cb __ LDA #$cb
08fb : 8d fd 2c STA $2cfd ; (vspriteScreen + 1)
08fe : a9 60 __ LDA #$60
0900 : a2 fa __ LDX #$fa
.l8:
0902 : ca __ __ DEX
0903 : 9d 00 c8 STA $c800,x 
0906 : 9d fa c8 STA $c8fa,x 
0909 : 9d f4 c9 STA $c9f4,x 
090c : 9d ee ca STA $caee,x 
090f : d0 f1 __ BNE $0902 ; (main.l8 + 0)
.s7:
0911 : a9 0f __ LDA #$0f
0913 : a2 fa __ LDX #$fa
.l10:
0915 : ca __ __ DEX
0916 : 9d 00 d8 STA $d800,x 
0919 : 9d fa d8 STA $d8fa,x 
091c : 9d f4 d9 STA $d9f4,x 
091f : 9d ee da STA $daee,x 
0922 : d0 f1 __ BNE $0915 ; (main.l10 + 0)
.s9:
0924 : a9 5f __ LDA #$5f
0926 : 85 0d __ STA P0 
0928 : a9 33 __ LDA #$33
092a : 85 0e __ STA P1 
092c : 20 59 0a JSR $0a59 ; (cwin_init.s4 + 0)
092f : a9 02 __ LDA #$02
0931 : 85 11 __ STA P4 
0933 : a9 33 __ LDA #$33
0935 : 85 0e __ STA P1 
0937 : a9 03 __ LDA #$03
0939 : 85 12 __ STA P5 
093b : a9 1c __ LDA #$1c
093d : 85 13 __ STA P6 
093f : a9 13 __ LDA #$13
0941 : 85 14 __ STA P7 
0943 : a9 6b __ LDA #$6b
0945 : 85 0d __ STA P0 
0947 : 20 59 0a JSR $0a59 ; (cwin_init.s4 + 0)
094a : a9 1e __ LDA #$1e
094c : 85 11 __ STA P4 
094e : a9 33 __ LDA #$33
0950 : 85 0e __ STA P1 
0952 : a9 06 __ LDA #$06
0954 : 85 12 __ STA P5 
0956 : a9 08 __ LDA #$08
0958 : 85 13 __ STA P6 
095a : a9 07 __ LDA #$07
095c : 85 14 __ STA P7 
095e : a9 77 __ LDA #$77
0960 : 85 0d __ STA P0 
0962 : 20 59 0a JSR $0a59 ; (cwin_init.s4 + 0)
0965 : a9 0f __ LDA #$0f
0967 : 85 12 __ STA P5 
0969 : a9 33 __ LDA #$33
096b : 85 0e __ STA P1 
096d : a9 83 __ LDA #$83
096f : 85 0d __ STA P0 
0971 : 20 59 0a JSR $0a59 ; (cwin_init.s4 + 0)
0974 : a9 00 __ LDA #$00
0976 : 8d ff 9f STA $9fff ; (sstack + 4)
0979 : 20 a8 0a JSR $0aa8 ; (ai_init.s4 + 0)
097c : 20 bd 0c JSR $0cbd ; (game_state.s4 + 0)
.l11:
097f : 20 85 12 JSR $1285 ; (game_loop.s1 + 0)
.l12:
0982 : 2c 11 d0 BIT $d011 
0985 : 30 fb __ BMI $0982 ; (main.l12 + 0)
.l13:
0987 : 2c 11 d0 BIT $d011 
098a : 10 fb __ BPL $0987 ; (main.l13 + 0)
098c : 30 f1 __ BMI $097f ; (main.l11 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
098e : a9 a3 __ LDA #$a3
0990 : 8d fa ff STA $fffa 
0993 : a9 09 __ LDA #$09
0995 : 8d fb ff STA $fffb 
0998 : a9 c1 __ LDA #$c1
099a : 8d fe ff STA $fffe 
099d : a9 09 __ LDA #$09
099f : 8d ff ff STA $ffff 
.s3:
09a2 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
09a3 : 48 __ __ PHA
09a4 : 8a __ __ TXA
09a5 : 48 __ __ PHA
09a6 : a9 09 __ LDA #$09
09a8 : 48 __ __ PHA
09a9 : a9 ba __ LDA #$ba
09ab : 48 __ __ PHA
09ac : ba __ __ TSX
09ad : bd 05 01 LDA $0105,x 
09b0 : 48 __ __ PHA
09b1 : a6 01 __ LDX $01 
09b3 : a9 36 __ LDA #$36
09b5 : 85 01 __ STA $01 
09b7 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
09ba : 86 01 __ STX $01 
09bc : 68 __ __ PLA
09bd : aa __ __ TAX
09be : 68 __ __ PLA
09bf : 40 __ __ RTI
09c0 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
09c1 : 48 __ __ PHA
09c2 : 8a __ __ TXA
09c3 : 48 __ __ PHA
09c4 : a9 09 __ LDA #$09
09c6 : 48 __ __ PHA
09c7 : a9 ba __ LDA #$ba
09c9 : 48 __ __ PHA
09ca : ba __ __ TSX
09cb : bd 05 01 LDA $0105,x 
09ce : 48 __ __ PHA
09cf : a6 01 __ LDX $01 
09d1 : a9 36 __ LDA #$36
09d3 : 85 01 __ STA $01 
09d5 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void*
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
09d8 : a6 12 __ LDX P5 
09da : f0 10 __ BEQ $09ec ; (memcpy.s4 + 20)
09dc : a0 00 __ LDY #$00
09de : b1 0f __ LDA (P2),y 
09e0 : 91 0d __ STA (P0),y ; (dst + 0)
09e2 : c8 __ __ INY
09e3 : d0 f9 __ BNE $09de ; (memcpy.s4 + 6)
09e5 : e6 10 __ INC P3 
09e7 : e6 0e __ INC P1 ; (dst + 1)
09e9 : ca __ __ DEX
09ea : d0 f2 __ BNE $09de ; (memcpy.s4 + 6)
09ec : a4 11 __ LDY P4 
09ee : f0 0e __ BEQ $09fe ; (memcpy.s4 + 38)
09f0 : 88 __ __ DEY
09f1 : f0 07 __ BEQ $09fa ; (memcpy.s4 + 34)
09f3 : b1 0f __ LDA (P2),y 
09f5 : 91 0d __ STA (P0),y ; (dst + 0)
09f7 : 88 __ __ DEY
09f8 : d0 f9 __ BNE $09f3 ; (memcpy.s4 + 27)
09fa : b1 0f __ LDA (P2),y 
09fc : 91 0d __ STA (P0),y ; (dst + 0)
09fe : a5 0d __ LDA P0 ; (dst + 0)
0a00 : 85 1b __ STA ACCU + 0 
0a02 : a5 0e __ LDA P1 ; (dst + 1)
0a04 : 85 1c __ STA ACCU + 1 
.s3:
0a06 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0a07 : a4 0d __ LDY P0 ; (mode + 0)
0a09 : c0 02 __ CPY #$02
0a0b : d0 09 __ BNE $0a16 ; (vic_setmode.s5 + 0)
.s10:
0a0d : a9 5b __ LDA #$5b
0a0f : 8d 11 d0 STA $d011 
.s8:
0a12 : a9 08 __ LDA #$08
0a14 : d0 0c __ BNE $0a22 ; (vic_setmode.s7 + 0)
.s5:
0a16 : b0 36 __ BCS $0a4e ; (vic_setmode.s6 + 0)
.s9:
0a18 : a9 1b __ LDA #$1b
0a1a : 8d 11 d0 STA $d011 
0a1d : 98 __ __ TYA
0a1e : f0 f2 __ BEQ $0a12 ; (vic_setmode.s8 + 0)
.s11:
0a20 : a9 18 __ LDA #$18
.s7:
0a22 : 8d 16 d0 STA $d016 
0a25 : ad 00 dd LDA $dd00 
0a28 : 29 fc __ AND #$fc
0a2a : 85 1b __ STA ACCU + 0 
0a2c : a5 0f __ LDA P2 ; (text + 1)
0a2e : 0a __ __ ASL
0a2f : 2a __ __ ROL
0a30 : 29 01 __ AND #$01
0a32 : 2a __ __ ROL
0a33 : 49 03 __ EOR #$03
0a35 : 05 1b __ ORA ACCU + 0 
0a37 : 8d 00 dd STA $dd00 
0a3a : a5 0f __ LDA P2 ; (text + 1)
0a3c : 29 3c __ AND #$3c
0a3e : 0a __ __ ASL
0a3f : 0a __ __ ASL
0a40 : 85 1b __ STA ACCU + 0 
0a42 : a5 11 __ LDA P4 ; (font + 1)
0a44 : 29 38 __ AND #$38
0a46 : 4a __ __ LSR
0a47 : 4a __ __ LSR
0a48 : 05 1b __ ORA ACCU + 0 
0a4a : 8d 18 d0 STA $d018 
.s3:
0a4d : 60 __ __ RTS
.s6:
0a4e : a9 3b __ LDA #$3b
0a50 : 8d 11 d0 STA $d011 
0a53 : c0 03 __ CPY #$03
0a55 : d0 c9 __ BNE $0a20 ; (vic_setmode.s11 + 0)
0a57 : f0 b9 __ BEQ $0a12 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
;  15, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0a59 : a5 11 __ LDA P4 ; (sx + 0)
0a5b : a0 00 __ LDY #$00
0a5d : 91 0d __ STA (P0),y ; (win + 0)
0a5f : a5 12 __ LDA P5 ; (sy + 0)
0a61 : c8 __ __ INY
0a62 : 91 0d __ STA (P0),y ; (win + 0)
0a64 : a5 13 __ LDA P6 ; (wx + 0)
0a66 : c8 __ __ INY
0a67 : 91 0d __ STA (P0),y ; (win + 0)
0a69 : a5 14 __ LDA P7 ; (wy + 0)
0a6b : c8 __ __ INY
0a6c : 91 0d __ STA (P0),y ; (win + 0)
0a6e : a9 00 __ LDA #$00
0a70 : c8 __ __ INY
0a71 : 91 0d __ STA (P0),y ; (win + 0)
0a73 : c8 __ __ INY
0a74 : 91 0d __ STA (P0),y ; (win + 0)
0a76 : 06 12 __ ASL P5 ; (sy + 0)
0a78 : a6 12 __ LDX P5 ; (sy + 0)
0a7a : bd 9b 2c LDA $2c9b,x ; (mul40[0] + 0)
0a7d : 85 12 __ STA P5 ; (sy + 0)
0a7f : 18 __ __ CLC
0a80 : 65 11 __ ADC P4 ; (sx + 0)
0a82 : a0 0a __ LDY #$0a
0a84 : 91 0d __ STA (P0),y ; (win + 0)
0a86 : bd 9c 2c LDA $2c9c,x ; (mul40[0] + 1)
0a89 : aa __ __ TAX
0a8a : 69 d8 __ ADC #$d8
0a8c : c8 __ __ INY
0a8d : 91 0d __ STA (P0),y ; (win + 0)
0a8f : 18 __ __ CLC
0a90 : a5 0f __ LDA P2 ; (screen + 0)
0a92 : 65 12 __ ADC P5 ; (sy + 0)
0a94 : a8 __ __ TAY
0a95 : 8a __ __ TXA
0a96 : 65 10 __ ADC P3 ; (screen + 1)
0a98 : aa __ __ TAX
0a99 : 98 __ __ TYA
0a9a : 18 __ __ CLC
0a9b : 65 11 __ ADC P4 ; (sx + 0)
0a9d : a0 08 __ LDY #$08
0a9f : 91 0d __ STA (P0),y ; (win + 0)
0aa1 : 8a __ __ TXA
0aa2 : 69 00 __ ADC #$00
0aa4 : c8 __ __ INY
0aa5 : 91 0d __ STA (P0),y ; (win + 0)
.s3:
0aa7 : 60 __ __ RTS
--------------------------------------------------------------------
ai_init: ; ai_init()->void
; 365, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
0aa8 : a9 00 __ LDA #$00
0aaa : 85 48 __ STA T7 + 0 
.l5:
0aac : a9 00 __ LDA #$00
0aae : 85 49 __ STA T8 + 0 
0ab0 : 85 43 __ STA T0 + 0 
0ab2 : 85 44 __ STA T1 + 0 
.l6:
0ab4 : a5 43 __ LDA T0 + 0 
0ab6 : 0a __ __ ASL
0ab7 : 85 45 __ STA T2 + 0 
0ab9 : a9 00 __ LDA #$00
0abb : 85 4a __ STA T9 + 0 
0abd : a5 49 __ LDA T8 + 0 
0abf : f0 1e __ BEQ $0adf ; (ai_init.s7 + 0)
.l20:
0ac1 : a5 4a __ LDA T9 + 0 
0ac3 : f0 14 __ BEQ $0ad9 ; (ai_init.s21 + 0)
.s23:
0ac5 : a6 48 __ LDX T7 + 0 
0ac7 : bd 85 1c LDA $1c85,x ; (__multab25L + 0)
0aca : 18 __ __ CLC
0acb : 65 44 __ ADC T1 + 0 
0acd : 18 __ __ CLC
0ace : 65 4a __ ADC T9 + 0 
0ad0 : 0a __ __ ASL
0ad1 : a8 __ __ TAY
0ad2 : a9 00 __ LDA #$00
0ad4 : 99 00 34 STA $3400,y ; (fscore[0] + 0)
0ad7 : f0 65 __ BEQ $0b3e ; (ai_init.l10 + 0)
.s21:
0ad9 : a5 49 __ LDA T8 + 0 
0adb : c9 04 __ CMP #$04
0add : f0 31 __ BEQ $0b10 ; (ai_init.s22 + 0)
.s7:
0adf : a5 4a __ LDA T9 + 0 
0ae1 : c9 04 __ CMP #$04
0ae3 : f0 2b __ BEQ $0b10 ; (ai_init.s22 + 0)
.s8:
0ae5 : a4 45 __ LDY T2 + 0 
0ae7 : be ce 2c LDX $2cce,y ; (score[0] + 1)
0aea : 86 47 __ STX T5 + 1 
0aec : 0a __ __ ASL
0aed : be cd 2c LDX $2ccd,y ; (score[0] + 0)
0af0 : a8 __ __ TAY
0af1 : 8a __ __ TXA
0af2 : 38 __ __ SEC
0af3 : f9 cd 2c SBC $2ccd,y ; (score[0] + 0)
0af6 : 85 1b __ STA ACCU + 0 
0af8 : a5 47 __ LDA T5 + 1 
0afa : f9 ce 2c SBC $2cce,y ; (score[0] + 1)
0afd : 85 1c __ STA ACCU + 1 
0aff : 18 __ __ CLC
0b00 : a5 48 __ LDA T7 + 0 
0b02 : 69 01 __ ADC #$01
0b04 : 20 c8 1b JSR $1bc8 ; (mul16by8 + 0)
0b07 : a5 1b __ LDA ACCU + 0 
0b09 : 85 46 __ STA T5 + 0 
0b0b : a5 1c __ LDA ACCU + 1 
0b0d : 4c 2a 0b JMP $0b2a ; (ai_init.s9 + 0)
.s22:
0b10 : a4 45 __ LDY T2 + 0 
0b12 : b9 ce 2c LDA $2cce,y ; (score[0] + 1)
0b15 : 85 1c __ STA ACCU + 1 
0b17 : a5 4a __ LDA T9 + 0 
0b19 : 0a __ __ ASL
0b1a : be cd 2c LDX $2ccd,y ; (score[0] + 0)
0b1d : a8 __ __ TAY
0b1e : 8a __ __ TXA
0b1f : 38 __ __ SEC
0b20 : f9 cd 2c SBC $2ccd,y ; (score[0] + 0)
0b23 : 85 46 __ STA T5 + 0 
0b25 : a5 1c __ LDA ACCU + 1 
0b27 : f9 ce 2c SBC $2cce,y ; (score[0] + 1)
.s9:
0b2a : aa __ __ TAX
0b2b : a4 48 __ LDY T7 + 0 
0b2d : b9 85 1c LDA $1c85,y ; (__multab25L + 0)
0b30 : 18 __ __ CLC
0b31 : 65 44 __ ADC T1 + 0 
0b33 : 18 __ __ CLC
0b34 : 65 4a __ ADC T9 + 0 
0b36 : 0a __ __ ASL
0b37 : a8 __ __ TAY
0b38 : a5 46 __ LDA T5 + 0 
0b3a : 99 00 34 STA $3400,y ; (fscore[0] + 0)
0b3d : 8a __ __ TXA
.l10:
0b3e : 99 01 34 STA $3401,y ; (fscore[0] + 1)
0b41 : e6 4a __ INC T9 + 0 
0b43 : a5 4a __ LDA T9 + 0 
0b45 : c9 05 __ CMP #$05
0b47 : b0 07 __ BCS $0b50 ; (ai_init.s11 + 0)
.s19:
0b49 : a5 49 __ LDA T8 + 0 
0b4b : f0 92 __ BEQ $0adf ; (ai_init.s7 + 0)
0b4d : 4c c1 0a JMP $0ac1 ; (ai_init.l20 + 0)
.s11:
0b50 : a5 44 __ LDA T1 + 0 
0b52 : 69 04 __ ADC #$04
0b54 : 85 44 __ STA T1 + 0 
0b56 : e6 43 __ INC T0 + 0 
0b58 : e6 49 __ INC T8 + 0 
0b5a : a5 49 __ LDA T8 + 0 
0b5c : c9 05 __ CMP #$05
0b5e : b0 03 __ BCS $0b63 ; (ai_init.s12 + 0)
0b60 : 4c b4 0a JMP $0ab4 ; (ai_init.l6 + 0)
.s12:
0b63 : e6 48 __ INC T7 + 0 
0b65 : a5 48 __ LDA T7 + 0 
0b67 : c9 05 __ CMP #$05
0b69 : b0 03 __ BCS $0b6e ; (ai_init.s13 + 0)
0b6b : 4c ac 0a JMP $0aac ; (ai_init.l5 + 0)
.s13:
0b6e : a9 00 __ LDA #$00
0b70 : 85 48 __ STA T7 + 0 
0b72 : a8 __ __ TAY
.l14:
0b73 : aa __ __ TAX
0b74 : 18 __ __ CLC
0b75 : 69 08 __ ADC #$08
0b77 : 85 44 __ STA T1 + 0 
0b79 : 18 __ __ CLC
0b7a : 69 08 __ ADC #$08
0b7c : 85 45 __ STA T2 + 0 
0b7e : 18 __ __ CLC
0b7f : 69 08 __ ADC #$08
0b81 : 85 1b __ STA ACCU + 0 
0b83 : a9 19 __ LDA #$19
.l24:
0b85 : 85 1c __ STA ACCU + 1 
0b87 : 99 0e 36 STA $360e,y ; (frows[0][0] + 276)
0b8a : 8a __ __ TXA
0b8b : 99 fa 34 STA $34fa,y ; (frows[0][0] + 0)
0b8e : a5 44 __ LDA T1 + 0 
0b90 : 99 3f 35 STA $353f,y ; (frows[0][0] + 69)
0b93 : 18 __ __ CLC
0b94 : 69 08 __ ADC #$08
0b96 : 85 44 __ STA T1 + 0 
0b98 : a5 45 __ LDA T2 + 0 
0b9a : 99 84 35 STA $3584,y ; (frows[0][0] + 138)
0b9d : 18 __ __ CLC
0b9e : 69 08 __ ADC #$08
0ba0 : 85 45 __ STA T2 + 0 
0ba2 : a5 1b __ LDA ACCU + 0 
0ba4 : 99 c9 35 STA $35c9,y ; (frows[0][0] + 207)
0ba7 : 18 __ __ CLC
0ba8 : 69 08 __ ADC #$08
0baa : 85 1b __ STA ACCU + 0 
0bac : 8a __ __ TXA
0bad : 18 __ __ CLC
0bae : 69 08 __ ADC #$08
0bb0 : aa __ __ TAX
0bb1 : 18 __ __ CLC
0bb2 : a5 1c __ LDA ACCU + 1 
0bb4 : 69 19 __ ADC #$19
0bb6 : c8 __ __ INY
0bb7 : c9 64 __ CMP #$64
0bb9 : d0 ca __ BNE $0b85 ; (ai_init.l24 + 0)
.s25:
0bbb : e6 48 __ INC T7 + 0 
0bbd : a5 48 __ LDA T7 + 0 
0bbf : c9 07 __ CMP #$07
0bc1 : 90 b0 __ BCC $0b73 ; (ai_init.l14 + 0)
.s15:
0bc3 : a9 00 __ LDA #$00
0bc5 : 85 43 __ STA T0 + 0 
.l16:
0bc7 : 85 1c __ STA ACCU + 1 
0bc9 : aa __ __ TAX
0bca : e8 __ __ INX
0bcb : 86 44 __ STX T1 + 0 
0bcd : e8 __ __ INX
0bce : 86 45 __ STX T2 + 0 
0bd0 : e8 __ __ INX
0bd1 : 86 1b __ STX ACCU + 0 
0bd3 : a9 e7 __ LDA #$e7
0bd5 : a2 00 __ LDX #$00
.l31:
0bd7 : 85 46 __ STA T5 + 0 
0bd9 : a5 1c __ LDA ACCU + 1 
0bdb : 99 fa 34 STA $34fa,y ; (frows[0][0] + 0)
0bde : a5 44 __ LDA T1 + 0 
0be0 : 99 3f 35 STA $353f,y ; (frows[0][0] + 69)
0be3 : a5 45 __ LDA T2 + 0 
0be5 : 99 84 35 STA $3584,y ; (frows[0][0] + 138)
0be8 : a5 1b __ LDA ACCU + 0 
0bea : 99 c9 35 STA $35c9,y ; (frows[0][0] + 207)
0bed : 8a __ __ TXA
0bee : f0 02 __ BEQ $0bf2 ; (ai_init.s30 + 0)
.s18:
0bf0 : a5 46 __ LDA T5 + 0 
.s30:
0bf2 : 99 0e 36 STA $360e,y ; (frows[0][0] + 276)
0bf5 : 18 __ __ CLC
0bf6 : a5 1c __ LDA ACCU + 1 
0bf8 : 69 08 __ ADC #$08
0bfa : 85 1c __ STA ACCU + 1 
0bfc : 18 __ __ CLC
0bfd : a5 44 __ LDA T1 + 0 
0bff : 69 08 __ ADC #$08
0c01 : 85 44 __ STA T1 + 0 
0c03 : 18 __ __ CLC
0c04 : a5 45 __ LDA T2 + 0 
0c06 : 69 08 __ ADC #$08
0c08 : 85 45 __ STA T2 + 0 
0c0a : 18 __ __ CLC
0c0b : a5 1b __ LDA ACCU + 0 
0c0d : 69 08 __ ADC #$08
0c0f : 85 1b __ STA ACCU + 0 
0c11 : 18 __ __ CLC
0c12 : a5 46 __ LDA T5 + 0 
0c14 : 69 19 __ ADC #$19
0c16 : c8 __ __ INY
0c17 : e8 __ __ INX
0c18 : e0 06 __ CPX #$06
0c1a : 90 bb __ BCC $0bd7 ; (ai_init.l31 + 0)
.s17:
0c1c : a5 43 __ LDA T0 + 0 
0c1e : 85 1c __ STA ACCU + 1 
0c20 : 69 08 __ ADC #$08
0c22 : aa __ __ TAX
0c23 : 18 __ __ CLC
0c24 : 69 09 __ ADC #$09
0c26 : 85 45 __ STA T2 + 0 
0c28 : 18 __ __ CLC
0c29 : 69 09 __ ADC #$09
0c2b : 85 1b __ STA ACCU + 0 
0c2d : a9 19 __ LDA #$19
.l26:
0c2f : 85 46 __ STA T5 + 0 
0c31 : 99 0e 36 STA $360e,y ; (frows[0][0] + 276)
0c34 : a5 1c __ LDA ACCU + 1 
0c36 : 99 fa 34 STA $34fa,y ; (frows[0][0] + 0)
0c39 : 18 __ __ CLC
0c3a : 69 08 __ ADC #$08
0c3c : 85 1c __ STA ACCU + 1 
0c3e : 8a __ __ TXA
0c3f : 99 3f 35 STA $353f,y ; (frows[0][0] + 69)
0c42 : a5 45 __ LDA T2 + 0 
0c44 : 99 84 35 STA $3584,y ; (frows[0][0] + 138)
0c47 : 18 __ __ CLC
0c48 : 69 08 __ ADC #$08
0c4a : 85 45 __ STA T2 + 0 
0c4c : a5 1b __ LDA ACCU + 0 
0c4e : 99 c9 35 STA $35c9,y ; (frows[0][0] + 207)
0c51 : 18 __ __ CLC
0c52 : 69 08 __ ADC #$08
0c54 : 85 1b __ STA ACCU + 0 
0c56 : 8a __ __ TXA
0c57 : 18 __ __ CLC
0c58 : 69 08 __ ADC #$08
0c5a : aa __ __ TAX
0c5b : 18 __ __ CLC
0c5c : a5 46 __ LDA T5 + 0 
0c5e : 69 19 __ ADC #$19
0c60 : c8 __ __ INY
0c61 : c9 64 __ CMP #$64
0c63 : d0 ca __ BNE $0c2f ; (ai_init.l26 + 0)
.s27:
0c65 : a5 43 __ LDA T0 + 0 
0c67 : 69 17 __ ADC #$17
0c69 : aa __ __ TAX
0c6a : 38 __ __ SEC
0c6b : e9 07 __ SBC #$07
0c6d : 85 45 __ STA T2 + 0 
0c6f : 38 __ __ SEC
0c70 : e9 07 __ SBC #$07
0c72 : 85 1b __ STA ACCU + 0 
0c74 : 38 __ __ SEC
0c75 : e9 07 __ SBC #$07
0c77 : 85 1c __ STA ACCU + 1 
0c79 : a9 19 __ LDA #$19
.l28:
0c7b : 85 46 __ STA T5 + 0 
0c7d : 99 0e 36 STA $360e,y ; (frows[0][0] + 276)
0c80 : 8a __ __ TXA
0c81 : 99 fa 34 STA $34fa,y ; (frows[0][0] + 0)
0c84 : a5 45 __ LDA T2 + 0 
0c86 : 99 3f 35 STA $353f,y ; (frows[0][0] + 69)
0c89 : 18 __ __ CLC
0c8a : 69 08 __ ADC #$08
0c8c : 85 45 __ STA T2 + 0 
0c8e : a5 1b __ LDA ACCU + 0 
0c90 : 99 84 35 STA $3584,y ; (frows[0][0] + 138)
0c93 : 18 __ __ CLC
0c94 : 69 08 __ ADC #$08
0c96 : 85 1b __ STA ACCU + 0 
0c98 : a5 1c __ LDA ACCU + 1 
0c9a : 99 c9 35 STA $35c9,y ; (frows[0][0] + 207)
0c9d : 18 __ __ CLC
0c9e : 69 08 __ ADC #$08
0ca0 : 85 1c __ STA ACCU + 1 
0ca2 : 8a __ __ TXA
0ca3 : 18 __ __ CLC
0ca4 : 69 08 __ ADC #$08
0ca6 : aa __ __ TAX
0ca7 : 18 __ __ CLC
0ca8 : a5 46 __ LDA T5 + 0 
0caa : 69 19 __ ADC #$19
0cac : c8 __ __ INY
0cad : c9 64 __ CMP #$64
0caf : d0 ca __ BNE $0c7b ; (ai_init.l28 + 0)
.s29:
0cb1 : e6 43 __ INC T0 + 0 
0cb3 : a5 43 __ LDA T0 + 0 
0cb5 : c9 04 __ CMP #$04
0cb7 : f0 03 __ BEQ $0cbc ; (ai_init.s3 + 0)
0cb9 : 4c c7 0b JMP $0bc7 ; (ai_init.l16 + 0)
.s3:
0cbc : 60 __ __ RTS
--------------------------------------------------------------------
game_state: ; game_state(enum GameState)->void
; 612, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
0cbd : a9 00 __ LDA #$00
0cbf : 85 0f __ STA P2 
0cc1 : 85 10 __ STA P3 
0cc3 : a9 01 __ LDA #$01
0cc5 : 85 12 __ STA P5 
0cc7 : 85 14 __ STA P7 
0cc9 : a9 28 __ LDA #$28
0ccb : 85 11 __ STA P4 
0ccd : ad ff 9f LDA $9fff ; (sstack + 4)
0cd0 : 85 4f __ STA T2 + 0 
0cd2 : 8d 8f 33 STA $338f ; (TheGame.state + 0)
0cd5 : ad d8 2c LDA $2cd8 ; (p2smap[0] + 1)
0cd8 : 49 20 __ EOR #$20
0cda : 85 13 __ STA P6 
0cdc : a9 5f __ LDA #$5f
0cde : 85 0d __ STA P0 
0ce0 : a9 33 __ LDA #$33
0ce2 : 85 0e __ STA P1 
0ce4 : 20 87 0d JSR $0d87 ; (cwin_fill_rect_raw.s4 + 0)
0ce7 : a5 4f __ LDA T2 + 0 
0ce9 : c9 03 __ CMP #$03
0ceb : d0 15 __ BNE $0d02 ; (game_state.s5 + 0)
.s17:
0ced : a9 07 __ LDA #$07
0cef : 85 13 __ STA P6 
0cf1 : a9 12 __ LDA #$12
0cf3 : a0 5d __ LDY #$5d
.s9:
0cf5 : 84 11 __ STY P4 
0cf7 : 85 12 __ STA P5 
0cf9 : 20 f5 11 JSR $11f5 ; (cwin_putat_string.s4 + 0)
0cfc : a9 f0 __ LDA #$f0
0cfe : 8d 90 33 STA $3390 ; (TheGame.count + 0)
.s3:
0d01 : 60 __ __ RTS
.s5:
0d02 : 90 1e __ BCC $0d22 ; (game_state.s11 + 0)
.s6:
0d04 : c9 04 __ CMP #$04
0d06 : d0 0b __ BNE $0d13 ; (game_state.s7 + 0)
.s10:
0d08 : a9 02 __ LDA #$02
0d0a : 85 13 __ STA P6 
0d0c : a9 12 __ LDA #$12
0d0e : a0 69 __ LDY #$69
0d10 : 4c f5 0c JMP $0cf5 ; (game_state.s9 + 0)
.s7:
0d13 : c9 05 __ CMP #$05
0d15 : d0 ea __ BNE $0d01 ; (game_state.s3 + 0)
.s8:
0d17 : a9 01 __ LDA #$01
0d19 : 85 13 __ STA P6 
0d1b : a9 12 __ LDA #$12
0d1d : a0 77 __ LDY #$77
0d1f : 4c f5 0c JMP $0cf5 ; (game_state.s9 + 0)
.s11:
0d22 : c9 01 __ CMP #$01
0d24 : d0 27 __ BNE $0d4d ; (game_state.s12 + 0)
.s16:
0d26 : a9 03 __ LDA #$03
0d28 : 8d 91 33 STA $3391 ; (TheGame.posx + 0)
0d2b : 85 18 __ STA P11 
0d2d : 8d fd 9f STA $9ffd ; (sstack + 2)
0d30 : a9 07 __ LDA #$07
0d32 : 8d fe 9f STA $9ffe ; (sstack + 3)
0d35 : a9 6b __ LDA #$6b
0d37 : 8d fb 9f STA $9ffb ; (sstack + 0)
0d3a : a9 33 __ LDA #$33
0d3c : 8d fc 9f STA $9ffc ; (sstack + 1)
0d3f : 20 4a 10 JSR $104a ; (column_select_anim.s4 + 0)
0d42 : a9 07 __ LDA #$07
0d44 : 85 13 __ STA P6 
0d46 : a9 12 __ LDA #$12
0d48 : a0 43 __ LDY #$43
0d4a : 4c 58 0d JMP $0d58 ; (game_state.s14 + 0)
.s12:
0d4d : aa __ __ TAX
0d4e : f0 1d __ BEQ $0d6d ; (game_state.s15 + 0)
.s13:
0d50 : a9 02 __ LDA #$02
0d52 : 85 13 __ STA P6 
0d54 : a9 12 __ LDA #$12
0d56 : a0 4f __ LDY #$4f
.s14:
0d58 : 84 11 __ STY P4 
0d5a : 85 12 __ STA P5 
0d5c : a9 00 __ LDA #$00
0d5e : 85 0f __ STA P2 
0d60 : 85 10 __ STA P3 
0d62 : a9 5f __ LDA #$5f
0d64 : 85 0d __ STA P0 
0d66 : a9 33 __ LDA #$33
0d68 : 85 0e __ STA P1 
0d6a : 4c f5 11 JMP $11f5 ; (cwin_putat_string.s4 + 0)
.s15:
0d6d : a9 3c __ LDA #$3c
0d6f : 8d 90 33 STA $3390 ; (TheGame.count + 0)
0d72 : a9 00 __ LDA #$00
0d74 : 8d 92 33 STA $3392 ; (TheGame.step + 0)
0d77 : 20 f7 0d JSR $0df7 ; (board_init.s4 + 0)
0d7a : a9 6b __ LDA #$6b
0d7c : 8d fd 9f STA $9ffd ; (sstack + 2)
0d7f : a9 33 __ LDA #$33
0d81 : 8d fe 9f STA $9ffe ; (sstack + 3)
0d84 : 4c 0b 0e JMP $0e0b ; (board_init_main.s4 + 0)
--------------------------------------------------------------------
cwin_fill_rect_raw: ; cwin_fill_rect_raw(struct CharWin*,u8,u8,u8,u8,u8,u8)->void
; 174, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0d87 : a5 11 __ LDA P4 ; (w + 0)
0d89 : f0 04 __ BEQ $0d8f ; (cwin_fill_rect_raw.s3 + 0)
.s5:
0d8b : a5 12 __ LDA P5 ; (h + 0)
0d8d : d0 01 __ BNE $0d90 ; (cwin_fill_rect_raw.s6 + 0)
.s3:
0d8f : 60 __ __ RTS
.s6:
0d90 : a5 10 __ LDA P3 ; (y + 0)
0d92 : 0a __ __ ASL
0d93 : aa __ __ TAX
0d94 : a0 08 __ LDY #$08
0d96 : b1 0d __ LDA (P0),y ; (win + 0)
0d98 : 7d 9b 2c ADC $2c9b,x ; (mul40[0] + 0)
0d9b : 85 43 __ STA T2 + 0 
0d9d : c8 __ __ INY
0d9e : b1 0d __ LDA (P0),y ; (win + 0)
0da0 : 7d 9c 2c ADC $2c9c,x ; (mul40[0] + 1)
0da3 : a8 __ __ TAY
0da4 : 18 __ __ CLC
0da5 : a5 43 __ LDA T2 + 0 
0da7 : 65 0f __ ADC P2 ; (x + 0)
0da9 : 85 43 __ STA T2 + 0 
0dab : 90 02 __ BCC $0daf ; (cwin_fill_rect_raw.s11 + 0)
.s10:
0dad : c8 __ __ INY
0dae : 18 __ __ CLC
.s11:
0daf : 84 44 __ STY T2 + 1 
0db1 : a0 0a __ LDY #$0a
0db3 : b1 0d __ LDA (P0),y ; (win + 0)
0db5 : 7d 9b 2c ADC $2c9b,x ; (mul40[0] + 0)
0db8 : 85 02 __ STA $02 
0dba : c8 __ __ INY
0dbb : b1 0d __ LDA (P0),y ; (win + 0)
0dbd : 7d 9c 2c ADC $2c9c,x ; (mul40[0] + 1)
0dc0 : aa __ __ TAX
0dc1 : 18 __ __ CLC
0dc2 : a5 02 __ LDA $02 
0dc4 : 65 0f __ ADC P2 ; (x + 0)
0dc6 : 85 1b __ STA ACCU + 0 
0dc8 : 90 01 __ BCC $0dcb ; (cwin_fill_rect_raw.s13 + 0)
.s12:
0dca : e8 __ __ INX
.s13:
0dcb : 86 1c __ STX ACCU + 1 
0dcd : a6 12 __ LDX P5 ; (h + 0)
.l7:
0dcf : a0 00 __ LDY #$00
.l8:
0dd1 : a5 13 __ LDA P6 ; (ch + 0)
0dd3 : 91 43 __ STA (T2 + 0),y 
0dd5 : a5 14 __ LDA P7 ; (color + 0)
0dd7 : 91 1b __ STA (ACCU + 0),y 
0dd9 : c8 __ __ INY
0dda : c4 11 __ CPY P4 ; (w + 0)
0ddc : 90 f3 __ BCC $0dd1 ; (cwin_fill_rect_raw.l8 + 0)
.s9:
0dde : a5 1b __ LDA ACCU + 0 
0de0 : 69 27 __ ADC #$27
0de2 : 85 1b __ STA ACCU + 0 
0de4 : 90 03 __ BCC $0de9 ; (cwin_fill_rect_raw.s15 + 0)
.s14:
0de6 : e6 1c __ INC ACCU + 1 
0de8 : 18 __ __ CLC
.s15:
0de9 : a5 43 __ LDA T2 + 0 
0deb : 69 28 __ ADC #$28
0ded : 85 43 __ STA T2 + 0 
0def : 90 02 __ BCC $0df3 ; (cwin_fill_rect_raw.s17 + 0)
.s16:
0df1 : e6 44 __ INC T2 + 1 
.s17:
0df3 : ca __ __ DEX
0df4 : d0 d9 __ BNE $0dcf ; (cwin_fill_rect_raw.l7 + 0)
0df6 : 60 __ __ RTS
--------------------------------------------------------------------
board_init: ; board_init()->void
; 240, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
0df7 : a9 06 __ LDA #$06
0df9 : a8 __ __ TAY
.l5:
0dfa : 99 d8 33 STA $33d8,y ; (board.ffree[0] + 0)
0dfd : 88 __ __ DEY
0dfe : 10 fa __ BPL $0dfa ; (board_init.l5 + 0)
.s6:
0e00 : a9 00 __ LDA #$00
0e02 : a2 2f __ LDX #$2f
.l7:
0e04 : 9d a8 33 STA $33a8,x ; (board.fcols[0] + 0)
0e07 : ca __ __ DEX
0e08 : 10 fa __ BPL $0e04 ; (board_init.l7 + 0)
.s3:
0e0a : 60 __ __ RTS
--------------------------------------------------------------------
board_init_main: ; board_init_main(struct CharWin*)->void
; 140, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
0e0b : ad fd 9f LDA $9ffd ; (sstack + 2)
0e0e : 85 0d __ STA P0 
0e10 : a9 00 __ LDA #$00
0e12 : 85 0f __ STA P2 
0e14 : a9 01 __ LDA #$01
0e16 : 85 10 __ STA P3 
0e18 : a9 54 __ LDA #$54
0e1a : 85 11 __ STA P4 
0e1c : a9 0e __ LDA #$0e
0e1e : 85 12 __ STA P5 
0e20 : ad fe 9f LDA $9ffe ; (sstack + 3)
0e23 : 85 0e __ STA P1 
0e25 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0e28 : a9 01 __ LDA #$01
0e2a : e6 0f __ INC P2 
0e2c : 85 12 __ STA P5 
0e2e : a9 15 __ LDA #$15
0e30 : 85 11 __ STA P4 
0e32 : a9 0e __ LDA #$0e
0e34 : 85 14 __ STA P7 
0e36 : a9 55 __ LDA #$55
0e38 : 85 13 __ STA P6 
0e3a : 20 87 0d JSR $0d87 ; (cwin_fill_rect_raw.s4 + 0)
0e3d : a9 16 __ LDA #$16
0e3f : 85 0f __ STA P2 
0e41 : a9 0e __ LDA #$0e
0e43 : 85 12 __ STA P5 
0e45 : a9 56 __ LDA #$56
0e47 : 85 11 __ STA P4 
0e49 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0e4c : e6 10 __ INC P3 
0e4e : a9 00 __ LDA #$00
0e50 : 85 0f __ STA P2 
0e52 : a9 01 __ LDA #$01
0e54 : 85 11 __ STA P4 
0e56 : a9 57 __ LDA #$57
0e58 : 85 13 __ STA P6 
0e5a : a9 12 __ LDA #$12
0e5c : 85 12 __ STA P5 
0e5e : 20 87 0d JSR $0d87 ; (cwin_fill_rect_raw.s4 + 0)
0e61 : e6 13 __ INC P6 
0e63 : a9 16 __ LDA #$16
0e65 : 85 0f __ STA P2 
0e67 : 20 87 0d JSR $0d87 ; (cwin_fill_rect_raw.s4 + 0)
0e6a : a9 00 __ LDA #$00
0e6c : 85 0f __ STA P2 
0e6e : a9 0e __ LDA #$0e
0e70 : 85 12 __ STA P5 
0e72 : a9 14 __ LDA #$14
0e74 : 85 10 __ STA P3 
0e76 : a9 59 __ LDA #$59
0e78 : 85 11 __ STA P4 
0e7a : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0e7d : a9 01 __ LDA #$01
0e7f : e6 0f __ INC P2 
0e81 : 85 12 __ STA P5 
0e83 : a9 15 __ LDA #$15
0e85 : 85 11 __ STA P4 
0e87 : a9 5a __ LDA #$5a
0e89 : 85 13 __ STA P6 
0e8b : 20 87 0d JSR $0d87 ; (cwin_fill_rect_raw.s4 + 0)
0e8e : a9 16 __ LDA #$16
0e90 : 85 0f __ STA P2 
0e92 : a9 0e __ LDA #$0e
0e94 : 85 12 __ STA P5 
0e96 : a9 5b __ LDA #$5b
0e98 : 85 11 __ STA P4 
0e9a : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0e9d : a9 00 __ LDA #$00
0e9f : 85 10 __ STA P3 
0ea1 : a9 01 __ LDA #$01
0ea3 : 85 12 __ STA P5 
0ea5 : a9 02 __ LDA #$02
0ea7 : 85 0f __ STA P2 
0ea9 : a9 31 __ LDA #$31
0eab : 85 11 __ STA P4 
.l6:
0ead : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0eb0 : 18 __ __ CLC
0eb1 : a5 0f __ LDA P2 
0eb3 : 69 03 __ ADC #$03
0eb5 : 85 0f __ STA P2 
0eb7 : e6 11 __ INC P4 
0eb9 : a5 11 __ LDA P4 
0ebb : c9 38 __ CMP #$38
0ebd : d0 ee __ BNE $0ead ; (board_init_main.l6 + 0)
.s5:
0ebf : a5 0d __ LDA P0 
0ec1 : 8d fb 9f STA $9ffb ; (sstack + 0)
0ec4 : a5 0e __ LDA P1 
0ec6 : 8d fc 9f STA $9ffc ; (sstack + 1)
0ec9 : 4c 0a 0f JMP $0f0a ; (board_draw_main.s4 + 0)
--------------------------------------------------------------------
cwin_putat_char_raw: ; cwin_putat_char_raw(struct CharWin*,u8,u8,u8,u8)->void
;  95, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
0ecc : a5 10 __ LDA P3 ; (y + 0)
0ece : 0a __ __ ASL
0ecf : aa __ __ TAX
0ed0 : bd 9b 2c LDA $2c9b,x ; (mul40[0] + 0)
0ed3 : 65 0f __ ADC P2 ; (x + 0)
0ed5 : 85 1b __ STA ACCU + 0 
0ed7 : bd 9c 2c LDA $2c9c,x ; (mul40[0] + 1)
0eda : 69 00 __ ADC #$00
0edc : 85 1c __ STA ACCU + 1 
0ede : a0 08 __ LDY #$08
0ee0 : b1 0d __ LDA (P0),y ; (win + 0)
0ee2 : 65 1b __ ADC ACCU + 0 
0ee4 : 85 43 __ STA T2 + 0 
0ee6 : c8 __ __ INY
0ee7 : b1 0d __ LDA (P0),y ; (win + 0)
0ee9 : 65 1c __ ADC ACCU + 1 
0eeb : 85 44 __ STA T2 + 1 
0eed : a5 11 __ LDA P4 ; (ch + 0)
0eef : a0 00 __ LDY #$00
0ef1 : 91 43 __ STA (T2 + 0),y 
0ef3 : a0 0a __ LDY #$0a
0ef5 : b1 0d __ LDA (P0),y ; (win + 0)
0ef7 : 18 __ __ CLC
0ef8 : 65 1b __ ADC ACCU + 0 
0efa : 85 1b __ STA ACCU + 0 
0efc : c8 __ __ INY
0efd : b1 0d __ LDA (P0),y ; (win + 0)
0eff : 65 1c __ ADC ACCU + 1 
0f01 : 85 1c __ STA ACCU + 1 
0f03 : a5 12 __ LDA P5 ; (color + 0)
0f05 : a0 00 __ LDY #$00
0f07 : 91 1b __ STA (ACCU + 0),y 
.s3:
0f09 : 60 __ __ RTS
--------------------------------------------------------------------
board_draw_main: ; board_draw_main(struct CharWin*)->void
; 122, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
0f0a : a9 00 __ LDA #$00
0f0c : 85 4d __ STA T6 + 0 
0f0e : 85 4a __ STA T1 + 0 
0f10 : ad fb 9f LDA $9ffb ; (sstack + 0)
0f13 : 85 13 __ STA P6 
0f15 : ad fc 9f LDA $9ffc ; (sstack + 1)
0f18 : 85 14 __ STA P7 
.l5:
0f1a : a5 4a __ LDA T1 + 0 
0f1c : 0a __ __ ASL
0f1d : 0a __ __ ASL
0f1e : 0a __ __ ASL
0f1f : 85 4b __ STA T3 + 0 
0f21 : a9 00 __ LDA #$00
0f23 : 85 4e __ STA T7 + 0 
0f25 : 85 4c __ STA T4 + 0 
0f27 : 18 __ __ CLC
.l6:
0f28 : a5 4c __ LDA T4 + 0 
0f2a : 65 4b __ ADC T3 + 0 
0f2c : aa __ __ TAX
0f2d : bd a8 33 LDA $33a8,x ; (board.fcols[0] + 0)
0f30 : c9 01 __ CMP #$01
0f32 : d0 04 __ BNE $0f38 ; (board_draw_main.s7 + 0)
.s12:
0f34 : a9 0a __ LDA #$0a
0f36 : d0 0a __ BNE $0f42 ; (board_draw_main.s9 + 0)
.s7:
0f38 : c9 05 __ CMP #$05
0f3a : d0 04 __ BNE $0f40 ; (board_draw_main.s8 + 0)
.s11:
0f3c : a9 0f __ LDA #$0f
0f3e : d0 02 __ BNE $0f42 ; (board_draw_main.s9 + 0)
.s8:
0f40 : a9 00 __ LDA #$00
.s9:
0f42 : 85 17 __ STA P10 
0f44 : a5 4e __ LDA T7 + 0 
0f46 : 85 15 __ STA P8 
0f48 : a5 4d __ LDA T6 + 0 
0f4a : 85 16 __ STA P9 
0f4c : 20 64 0f JSR $0f64 ; (board_draw_item.s4 + 0)
0f4f : e6 4c __ INC T4 + 0 
0f51 : e6 4e __ INC T7 + 0 
0f53 : a5 4e __ LDA T7 + 0 
0f55 : c9 07 __ CMP #$07
0f57 : 90 cf __ BCC $0f28 ; (board_draw_main.l6 + 0)
.s10:
0f59 : e6 4a __ INC T1 + 0 
0f5b : e6 4d __ INC T6 + 0 
0f5d : a5 4d __ LDA T6 + 0 
0f5f : c9 06 __ CMP #$06
0f61 : 90 b7 __ BCC $0f1a ; (board_draw_main.l5 + 0)
.s3:
0f63 : 60 __ __ RTS
--------------------------------------------------------------------
board_draw_item: ; board_draw_item(struct CharWin*,u8,u8,u8)->void
;  86, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
0f64 : a5 13 __ LDA P6 ; (cwin + 0)
0f66 : 85 0d __ STA P0 
0f68 : a5 14 __ LDA P7 ; (cwin + 1)
0f6a : 85 0e __ STA P1 
0f6c : a5 15 __ LDA P8 ; (x + 0)
0f6e : 0a __ __ ASL
0f6f : 38 __ __ SEC
0f70 : 65 15 __ ADC P8 ; (x + 0)
0f72 : 85 45 __ STA T2 + 0 
0f74 : 85 0f __ STA P2 
0f76 : 18 __ __ CLC
0f77 : 69 02 __ ADC #$02
0f79 : 85 48 __ STA T5 + 0 
0f7b : 18 __ __ CLC
0f7c : 69 ff __ ADC #$ff
0f7e : 85 49 __ STA T6 + 0 
0f80 : a5 16 __ LDA P9 ; (y + 0)
0f82 : 0a __ __ ASL
0f83 : 18 __ __ CLC
0f84 : 65 16 __ ADC P9 ; (y + 0)
0f86 : 18 __ __ CLC
0f87 : 69 02 __ ADC #$02
0f89 : 85 10 __ STA P3 
0f8b : 18 __ __ CLC
0f8c : 69 02 __ ADC #$02
0f8e : 85 46 __ STA T3 + 0 
0f90 : 18 __ __ CLC
0f91 : 69 ff __ ADC #$ff
0f93 : 85 47 __ STA T4 + 0 
0f95 : a5 17 __ LDA P10 ; (c + 0)
0f97 : f0 54 __ BEQ $0fed ; (board_draw_item.s5 + 0)
.s7:
0f99 : 85 12 __ STA P5 
0f9b : a9 49 __ LDA #$49
0f9d : 85 11 __ STA P4 
0f9f : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fa2 : a5 49 __ LDA T6 + 0 
0fa4 : 85 0f __ STA P2 
0fa6 : e6 11 __ INC P4 
0fa8 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fab : a5 48 __ LDA T5 + 0 
0fad : 85 0f __ STA P2 
0faf : e6 11 __ INC P4 
0fb1 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fb4 : a5 45 __ LDA T2 + 0 
0fb6 : 85 0f __ STA P2 
0fb8 : a5 47 __ LDA T4 + 0 
0fba : 85 10 __ STA P3 
0fbc : e6 11 __ INC P4 
0fbe : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fc1 : a5 49 __ LDA T6 + 0 
0fc3 : 85 0f __ STA P2 
0fc5 : e6 11 __ INC P4 
0fc7 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fca : a5 48 __ LDA T5 + 0 
0fcc : 85 0f __ STA P2 
0fce : e6 11 __ INC P4 
0fd0 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fd3 : a5 45 __ LDA T2 + 0 
0fd5 : 85 0f __ STA P2 
0fd7 : a5 46 __ LDA T3 + 0 
0fd9 : 85 10 __ STA P3 
0fdb : e6 11 __ INC P4 
0fdd : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fe0 : a5 49 __ LDA T6 + 0 
0fe2 : 85 0f __ STA P2 
0fe4 : e6 11 __ INC P4 
0fe6 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0fe9 : a9 51 __ LDA #$51
0feb : d0 54 __ BNE $1041 ; (board_draw_item.s6 + 0)
.s5:
0fed : a9 40 __ LDA #$40
0fef : 85 11 __ STA P4 
0ff1 : a9 0e __ LDA #$0e
0ff3 : 85 12 __ STA P5 
0ff5 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
0ff8 : a5 49 __ LDA T6 + 0 
0ffa : 85 0f __ STA P2 
0ffc : e6 11 __ INC P4 
0ffe : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
1001 : a5 48 __ LDA T5 + 0 
1003 : 85 0f __ STA P2 
1005 : e6 11 __ INC P4 
1007 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
100a : a5 45 __ LDA T2 + 0 
100c : 85 0f __ STA P2 
100e : a5 47 __ LDA T4 + 0 
1010 : 85 10 __ STA P3 
1012 : e6 11 __ INC P4 
1014 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
1017 : a5 49 __ LDA T6 + 0 
1019 : 85 0f __ STA P2 
101b : e6 11 __ INC P4 
101d : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
1020 : a5 48 __ LDA T5 + 0 
1022 : 85 0f __ STA P2 
1024 : e6 11 __ INC P4 
1026 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
1029 : a5 45 __ LDA T2 + 0 
102b : 85 0f __ STA P2 
102d : a5 46 __ LDA T3 + 0 
102f : 85 10 __ STA P3 
1031 : e6 11 __ INC P4 
1033 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
1036 : a5 49 __ LDA T6 + 0 
1038 : 85 0f __ STA P2 
103a : e6 11 __ INC P4 
103c : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
103f : a9 48 __ LDA #$48
.s6:
1041 : 85 11 __ STA P4 
1043 : a5 48 __ LDA T5 + 0 
1045 : 85 0f __ STA P2 
1047 : 4c cc 0e JMP $0ecc ; (cwin_putat_char_raw.s4 + 0)
--------------------------------------------------------------------
column_select_anim: ; column_select_anim(struct CharWin*,u8,u8,u8)->void
; 211, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
104a : a9 00 __ LDA #$00
104c : 85 0d __ STA P0 
104e : 85 16 __ STA P9 
1050 : 85 17 __ STA P10 
1052 : a9 01 __ LDA #$01
1054 : 85 0e __ STA P1 
1056 : 85 15 __ STA P8 
1058 : ad fb 9f LDA $9ffb ; (sstack + 0)
105b : 85 45 __ STA T1 + 0 
105d : a9 61 __ LDA #$61
105f : 85 13 __ STA P6 
1061 : ad fc 9f LDA $9ffc ; (sstack + 1)
1064 : 85 46 __ STA T1 + 1 
1066 : a5 18 __ LDA P11 ; (x0 + 0)
1068 : 0a __ __ ASL
1069 : a2 00 __ LDX #$00
106b : 90 02 __ BCC $106f ; (column_select_anim.s14 + 0)
.s13:
106d : e8 __ __ INX
106e : 18 __ __ CLC
.s14:
106f : 65 18 __ ADC P11 ; (x0 + 0)
1071 : 85 43 __ STA T0 + 0 
1073 : 90 02 __ BCC $1077 ; (column_select_anim.s20 + 0)
.s19:
1075 : e8 __ __ INX
1076 : 18 __ __ CLC
.s20:
1077 : a0 00 __ LDY #$00
1079 : b1 45 __ LDA (T1 + 0),y 
107b : 85 47 __ STA T2 + 0 
107d : 65 43 __ ADC T0 + 0 
107f : 85 43 __ STA T0 + 0 
1081 : 8a __ __ TXA
1082 : 69 00 __ ADC #$00
1084 : 06 43 __ ASL T0 + 0 
1086 : 2a __ __ ROL
1087 : 06 43 __ ASL T0 + 0 
1089 : 2a __ __ ROL
108a : 06 43 __ ASL T0 + 0 
108c : 2a __ __ ROL
108d : aa __ __ TAX
108e : 18 __ __ CLC
108f : a5 43 __ LDA T0 + 0 
1091 : 69 20 __ ADC #$20
1093 : 85 0f __ STA P2 
1095 : 8a __ __ TXA
1096 : 69 00 __ ADC #$00
1098 : 85 4a __ STA T4 + 1 
109a : 85 10 __ STA P3 
109c : c8 __ __ INY
109d : b1 45 __ LDA (T1 + 0),y 
109f : 18 __ __ CLC
10a0 : 69 04 __ ADC #$04
10a2 : 2a __ __ ROL
10a3 : 2a __ __ ROL
10a4 : 2a __ __ ROL
10a5 : aa __ __ TAX
10a6 : 29 f8 __ AND #$f8
10a8 : 09 04 __ ORA #$04
10aa : 85 11 __ STA P4 
10ac : 8a __ __ TXA
10ad : 29 07 __ AND #$07
10af : 2a __ __ ROL
10b0 : 85 12 __ STA P5 
10b2 : ad fe 9f LDA $9ffe ; (sstack + 3)
10b5 : 85 14 __ STA P7 
10b7 : 20 6b 11 JSR $116b ; (spr_set.s4 + 0)
10ba : a9 01 __ LDA #$01
10bc : 8d 1b d0 STA $d01b 
10bf : ad fd 9f LDA $9ffd ; (sstack + 2)
10c2 : 0a __ __ ASL
10c3 : a2 00 __ LDX #$00
10c5 : 90 02 __ BCC $10c9 ; (column_select_anim.s16 + 0)
.s15:
10c7 : e8 __ __ INX
10c8 : 18 __ __ CLC
.s16:
10c9 : 6d fd 9f ADC $9ffd ; (sstack + 2)
10cc : 90 02 __ BCC $10d0 ; (column_select_anim.s18 + 0)
.s17:
10ce : e8 __ __ INX
10cf : 18 __ __ CLC
.s18:
10d0 : 65 47 __ ADC T2 + 0 
10d2 : 85 43 __ STA T0 + 0 
10d4 : 8a __ __ TXA
10d5 : 69 00 __ ADC #$00
10d7 : 06 43 __ ASL T0 + 0 
10d9 : 2a __ __ ROL
10da : 06 43 __ ASL T0 + 0 
10dc : 2a __ __ ROL
10dd : 06 43 __ ASL T0 + 0 
10df : 2a __ __ ROL
10e0 : aa __ __ TAX
10e1 : 18 __ __ CLC
10e2 : a5 43 __ LDA T0 + 0 
10e4 : 69 20 __ ADC #$20
10e6 : 85 43 __ STA T0 + 0 
10e8 : 8a __ __ TXA
10e9 : 69 00 __ ADC #$00
10eb : 85 44 __ STA T0 + 1 
10ed : c5 4a __ CMP T4 + 1 
10ef : d0 06 __ BNE $10f7 ; (column_select_anim.s5 + 0)
.s12:
10f1 : a5 0f __ LDA P2 
10f3 : c5 43 __ CMP T0 + 0 
10f5 : f0 73 __ BEQ $116a ; (column_select_anim.s3 + 0)
.s5:
10f7 : a9 01 __ LDA #$01
10f9 : 85 45 __ STA T1 + 0 
.l6:
10fb : 2c 11 d0 BIT $d011 
10fe : 30 fb __ BMI $10fb ; (column_select_anim.l6 + 0)
.l7:
1100 : 2c 11 d0 BIT $d011 
1103 : 10 fb __ BPL $1100 ; (column_select_anim.l7 + 0)
.s8:
1105 : a5 11 __ LDA P4 
1107 : 8d 01 d0 STA $d001 
110a : a5 43 __ LDA T0 + 0 
110c : 85 1b __ STA ACCU + 0 ; (x1 + 0)
110e : a5 44 __ LDA T0 + 1 
1110 : 85 1c __ STA ACCU + 1 ; (c + 0)
1112 : a5 45 __ LDA T1 + 0 
1114 : 20 c8 1b JSR $1bc8 ; (mul16by8 + 0)
1117 : a5 1b __ LDA ACCU + 0 ; (x1 + 0)
1119 : 85 47 __ STA T2 + 0 
111b : a5 1c __ LDA ACCU + 1 ; (c + 0)
111d : 85 48 __ STA T2 + 1 
111f : a5 0f __ LDA P2 
1121 : 85 1b __ STA ACCU + 0 ; (x1 + 0)
1123 : a5 4a __ LDA T4 + 1 
1125 : 85 1c __ STA ACCU + 1 ; (c + 0)
1127 : 38 __ __ SEC
1128 : a9 08 __ LDA #$08
112a : e5 45 __ SBC T1 + 0 
112c : 20 c8 1b JSR $1bc8 ; (mul16by8 + 0)
112f : 18 __ __ CLC
1130 : a5 1b __ LDA ACCU + 0 ; (x1 + 0)
1132 : 65 47 __ ADC T2 + 0 
1134 : 85 47 __ STA T2 + 0 
1136 : a5 1c __ LDA ACCU + 1 ; (c + 0)
1138 : 65 48 __ ADC T2 + 1 
113a : 4a __ __ LSR
113b : 66 47 __ ROR T2 + 0 
113d : 4a __ __ LSR
113e : 66 47 __ ROR T2 + 0 
1140 : 4a __ __ LSR
1141 : 66 47 __ ROR T2 + 0 
1143 : 49 10 __ EOR #$10
1145 : 38 __ __ SEC
1146 : e9 10 __ SBC #$10
1148 : 29 01 __ AND #$01
114a : a6 47 __ LDX T2 + 0 
114c : 8e 00 d0 STX $d000 
114f : aa __ __ TAX
1150 : d0 08 __ BNE $115a ; (column_select_anim.s11 + 0)
.s9:
1152 : ad 10 d0 LDA $d010 
1155 : 29 fe __ AND #$fe
1157 : 4c 5f 11 JMP $115f ; (column_select_anim.s10 + 0)
.s11:
115a : ad 10 d0 LDA $d010 
115d : 09 01 __ ORA #$01
.s10:
115f : 8d 10 d0 STA $d010 
1162 : e6 45 __ INC T1 + 0 
1164 : a5 45 __ LDA T1 + 0 
1166 : c9 09 __ CMP #$09
1168 : 90 91 __ BCC $10fb ; (column_select_anim.l6 + 0)
.s3:
116a : 60 __ __ RTS
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
116b : a6 0d __ LDX P0 ; (sp + 0)
116d : bc 2f 33 LDY $332f,x ; (bitshift[0] + 8)
1170 : a5 0e __ LDA P1 ; (show + 0)
1172 : d0 09 __ BNE $117d ; (spr_set.s19 + 0)
.s5:
1174 : 98 __ __ TYA
1175 : 49 ff __ EOR #$ff
1177 : 2d 15 d0 AND $d015 
117a : 4c 81 11 JMP $1181 ; (spr_set.s6 + 0)
.s19:
117d : 98 __ __ TYA
117e : 0d 15 d0 ORA $d015 
.s6:
1181 : 8d 15 d0 STA $d015 
1184 : a5 15 __ LDA P8 ; (multi + 0)
1186 : d0 09 __ BNE $1191 ; (spr_set.s18 + 0)
.s7:
1188 : 98 __ __ TYA
1189 : 49 ff __ EOR #$ff
118b : 2d 1c d0 AND $d01c 
118e : 4c 95 11 JMP $1195 ; (spr_set.s8 + 0)
.s18:
1191 : 98 __ __ TYA
1192 : 0d 1c d0 ORA $d01c 
.s8:
1195 : 8d 1c d0 STA $d01c 
1198 : a5 16 __ LDA P9 ; (xexpand + 0)
119a : d0 09 __ BNE $11a5 ; (spr_set.s17 + 0)
.s9:
119c : 98 __ __ TYA
119d : 49 ff __ EOR #$ff
119f : 2d 1d d0 AND $d01d 
11a2 : 4c a9 11 JMP $11a9 ; (spr_set.s10 + 0)
.s17:
11a5 : 98 __ __ TYA
11a6 : 0d 1d d0 ORA $d01d 
.s10:
11a9 : 8d 1d d0 STA $d01d 
11ac : a5 17 __ LDA P10 ; (yexpand + 0)
11ae : d0 09 __ BNE $11b9 ; (spr_set.s16 + 0)
.s11:
11b0 : 98 __ __ TYA
11b1 : 49 ff __ EOR #$ff
11b3 : 2d 17 d0 AND $d017 
11b6 : 4c bd 11 JMP $11bd ; (spr_set.s12 + 0)
.s16:
11b9 : 98 __ __ TYA
11ba : 0d 17 d0 ORA $d017 
.s12:
11bd : 8d 17 d0 STA $d017 
11c0 : 8a __ __ TXA
11c1 : 0a __ __ ASL
11c2 : aa __ __ TAX
11c3 : a5 11 __ LDA P4 ; (ypos + 0)
11c5 : 9d 01 d0 STA $d001,x 
11c8 : a5 0f __ LDA P2 ; (xpos + 0)
11ca : 9d 00 d0 STA $d000,x 
11cd : 46 10 __ LSR P3 ; (xpos + 1)
11cf : 98 __ __ TYA
11d0 : 90 05 __ BCC $11d7 ; (spr_set.s13 + 0)
.s15:
11d2 : 0d 10 d0 ORA $d010 
11d5 : b0 05 __ BCS $11dc ; (spr_set.s14 + 0)
.s13:
11d7 : 49 ff __ EOR #$ff
11d9 : 2d 10 d0 AND $d010 
.s14:
11dc : 8d 10 d0 STA $d010 
11df : ad fc 2c LDA $2cfc ; (vspriteScreen + 0)
11e2 : 85 1b __ STA ACCU + 0 
11e4 : ad fd 2c LDA $2cfd ; (vspriteScreen + 1)
11e7 : 85 1c __ STA ACCU + 1 
11e9 : a5 13 __ LDA P6 ; (image + 0)
11eb : a4 0d __ LDY P0 ; (sp + 0)
11ed : 91 1b __ STA (ACCU + 0),y 
11ef : a5 14 __ LDA P7 ; (color + 0)
11f1 : 99 27 d0 STA $d027,y 
.s3:
11f4 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string: ; cwin_putat_string(struct CharWin*,u8,u8,const u8*,u8)->u8
;  90, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
11f5 : a5 10 __ LDA P3 ; (y + 0)
11f7 : 0a __ __ ASL
11f8 : aa __ __ TAX
11f9 : bd 9b 2c LDA $2c9b,x ; (mul40[0] + 0)
11fc : 65 0f __ ADC P2 ; (x + 0)
11fe : 85 1b __ STA ACCU + 0 
1200 : bd 9c 2c LDA $2c9c,x ; (mul40[0] + 1)
1203 : 69 00 __ ADC #$00
1205 : 85 1c __ STA ACCU + 1 
1207 : a0 08 __ LDY #$08
1209 : b1 0d __ LDA (P0),y ; (win + 0)
120b : 65 1b __ ADC ACCU + 0 
120d : 85 43 __ STA T2 + 0 
120f : c8 __ __ INY
1210 : b1 0d __ LDA (P0),y ; (win + 0)
1212 : 65 1c __ ADC ACCU + 1 
1214 : 85 44 __ STA T2 + 1 
1216 : c8 __ __ INY
1217 : b1 0d __ LDA (P0),y ; (win + 0)
1219 : 18 __ __ CLC
121a : 65 1b __ ADC ACCU + 0 
121c : 85 1b __ STA ACCU + 0 
121e : c8 __ __ INY
121f : b1 0d __ LDA (P0),y ; (win + 0)
1221 : 65 1c __ ADC ACCU + 1 
1223 : 85 1c __ STA ACCU + 1 
1225 : a0 00 __ LDY #$00
1227 : b1 11 __ LDA (P4),y ; (str + 0)
1229 : f0 16 __ BEQ $1241 ; (cwin_putat_string.s5 + 0)
.l6:
122b : 4a __ __ LSR
122c : 4a __ __ LSR
122d : 4a __ __ LSR
122e : 4a __ __ LSR
122f : 4a __ __ LSR
1230 : aa __ __ TAX
1231 : bd d7 2c LDA $2cd7,x ; (p2smap[0] + 0)
1234 : 51 11 __ EOR (P4),y ; (str + 0)
1236 : 91 43 __ STA (T2 + 0),y 
1238 : a5 13 __ LDA P6 ; (color + 0)
123a : 91 1b __ STA (ACCU + 0),y 
123c : c8 __ __ INY
123d : b1 11 __ LDA (P4),y ; (str + 0)
123f : d0 ea __ BNE $122b ; (cwin_putat_string.l6 + 0)
.s5:
1241 : 98 __ __ TYA
.s3:
1242 : 60 __ __ RTS
--------------------------------------------------------------------
1243 : __ __ __ BYT 50 4c 41 59 45 52 20 4d 4f 56 45 00             : PLAYER MOVE.
--------------------------------------------------------------------
124f : __ __ __ BYT 43 4f 4d 50 55 54 45 52 20 4d 4f 56 45 00       : COMPUTER MOVE.
--------------------------------------------------------------------
125d : __ __ __ BYT 50 4c 41 59 45 52 20 57 49 4e 53 00             : PLAYER WINS.
--------------------------------------------------------------------
1269 : __ __ __ BYT 43 4f 4d 50 55 54 45 52 20 57 49 4e 53 00       : COMPUTER WINS.
--------------------------------------------------------------------
1277 : __ __ __ BYT 4e 4f 20 4d 4f 52 45 20 4d 4f 56 45 53 00       : NO MORE MOVES.
--------------------------------------------------------------------
game_loop: ; game_loop()->void
; 669, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s1:
1285 : a2 03 __ LDX #$03
1287 : b5 53 __ LDA T0 + 0,x 
1289 : 9d f4 9f STA $9ff4,x ; (game_loop@stack + 0)
128c : ca __ __ DEX
128d : 10 f8 __ BPL $1287 ; (game_loop.s1 + 2)
128f : 38 __ __ SEC
1290 : a5 23 __ LDA SP + 0 
1292 : e9 08 __ SBC #$08
1294 : 85 23 __ STA SP + 0 
1296 : b0 02 __ BCS $129a ; (game_loop.s4 + 0)
1298 : c6 24 __ DEC SP + 1 
.s4:
129a : ad 8f 33 LDA $338f ; (TheGame.state + 0)
129d : c9 02 __ CMP #$02
129f : d0 03 __ BNE $12a4 ; (game_loop.s5 + 0)
12a1 : 4c c3 13 JMP $13c3 ; (game_loop.s30 + 0)
.s5:
12a4 : 90 28 __ BCC $12ce ; (game_loop.s10 + 0)
.s6:
12a6 : c9 03 __ CMP #$03
12a8 : 90 0e __ BCC $12b8 ; (game_loop.s3 + 0)
.s7:
12aa : ce 90 33 DEC $3390 ; (TheGame.count + 0)
12ad : d0 09 __ BNE $12b8 ; (game_loop.s3 + 0)
.s8:
12af : ad 90 33 LDA $3390 ; (TheGame.count + 0)
.s9:
12b2 : 8d ff 9f STA $9fff ; (sstack + 4)
12b5 : 20 bd 0c JSR $0cbd ; (game_state.s4 + 0)
.s3:
12b8 : 18 __ __ CLC
12b9 : a5 23 __ LDA SP + 0 
12bb : 69 08 __ ADC #$08
12bd : 85 23 __ STA SP + 0 
12bf : 90 02 __ BCC $12c3 ; (game_loop.s3 + 11)
12c1 : e6 24 __ INC SP + 1 
12c3 : a2 03 __ LDX #$03
12c5 : bd f4 9f LDA $9ff4,x ; (game_loop@stack + 0)
12c8 : 95 53 __ STA T0 + 0,x 
12ca : ca __ __ DEX
12cb : 10 f8 __ BPL $12c5 ; (game_loop.s3 + 13)
12cd : 60 __ __ RTS
.s10:
12ce : aa __ __ TAX
12cf : d0 09 __ BNE $12da ; (game_loop.s13 + 0)
.s11:
12d1 : ce 90 33 DEC $3390 ; (TheGame.count + 0)
12d4 : d0 e2 __ BNE $12b8 ; (game_loop.s3 + 0)
.s12:
12d6 : a9 01 __ LDA #$01
12d8 : d0 d8 __ BNE $12b2 ; (game_loop.s9 + 0)
.s13:
12da : ad 91 33 LDA $3391 ; (TheGame.posx + 0)
12dd : 85 55 __ STA T3 + 0 
12df : 85 56 __ STA T4 + 0 
12e1 : 20 6c 14 JSR $146c ; (kbhit.s4 + 0)
12e4 : a2 ff __ LDX #$ff
12e6 : 86 54 __ STX T2 + 0 
12e8 : aa __ __ TAX
12e9 : f0 03 __ BEQ $12ee ; (game_loop.s14 + 0)
12eb : 4c ae 13 JMP $13ae ; (game_loop.s27 + 0)
.s14:
12ee : 20 b1 14 JSR $14b1 ; (joy_poll.s4 + 0)
12f1 : ad df 33 LDA $33df ; (joyx[0] + 0)
12f4 : 10 13 __ BPL $1309 ; (game_loop.s24 + 0)
.s25:
12f6 : a5 55 __ LDA T3 + 0 
12f8 : f0 0a __ BEQ $1304 ; (game_loop.s15 + 0)
.s26:
12fa : 18 __ __ CLC
12fb : 69 ff __ ADC #$ff
.s38:
12fd : 85 56 __ STA T4 + 0 
.s41:
12ff : a5 55 __ LDA T3 + 0 
1301 : 4c 1f 13 JMP $131f ; (game_loop.s17 + 0)
.s15:
1304 : ad df 33 LDA $33df ; (joyx[0] + 0)
1307 : 30 0d __ BMI $1316 ; (game_loop.s16 + 0)
.s24:
1309 : f0 0b __ BEQ $1316 ; (game_loop.s16 + 0)
.s22:
130b : a5 55 __ LDA T3 + 0 
130d : c9 06 __ CMP #$06
130f : b0 05 __ BCS $1316 ; (game_loop.s16 + 0)
.s23:
1311 : 69 01 __ ADC #$01
1313 : 4c fd 12 JMP $12fd ; (game_loop.s38 + 0)
.s16:
1316 : ad e1 33 LDA $33e1 ; (joyb[0] + 0)
1319 : f0 e4 __ BEQ $12ff ; (game_loop.s41 + 0)
.s21:
131b : a5 55 __ LDA T3 + 0 
131d : 85 54 __ STA T2 + 0 
.s17:
131f : 85 18 __ STA P11 
1321 : a5 56 __ LDA T4 + 0 
1323 : 8d fd 9f STA $9ffd ; (sstack + 2)
1326 : a9 07 __ LDA #$07
1328 : 8d fe 9f STA $9ffe ; (sstack + 3)
132b : a9 6b __ LDA #$6b
132d : 8d fb 9f STA $9ffb ; (sstack + 0)
1330 : a9 33 __ LDA #$33
1332 : 8d fc 9f STA $9ffc ; (sstack + 1)
1335 : 20 4a 10 JSR $104a ; (column_select_anim.s4 + 0)
1338 : a5 56 __ LDA T4 + 0 
133a : 8d 91 33 STA $3391 ; (TheGame.posx + 0)
133d : a4 54 __ LDY T2 + 0 
133f : c0 ff __ CPY #$ff
1341 : d0 03 __ BNE $1346 ; (game_loop.s18 + 0)
1343 : 4c b8 12 JMP $12b8 ; (game_loop.s3 + 0)
.s18:
1346 : b9 d8 33 LDA $33d8,y ; (board.ffree[0] + 0)
1349 : f0 f8 __ BEQ $1343 ; (game_loop.s17 + 36)
.s19:
134b : 84 18 __ STY P11 
134d : aa __ __ TAX
134e : 18 __ __ CLC
134f : 69 ff __ ADC #$ff
1351 : 8d fd 9f STA $9ffd ; (sstack + 2)
1354 : 99 d8 33 STA $33d8,y ; (board.ffree[0] + 0)
1357 : a9 6b __ LDA #$6b
1359 : 8d fb 9f STA $9ffb ; (sstack + 0)
135c : a9 33 __ LDA #$33
135e : 8d fc 9f STA $9ffc ; (sstack + 1)
1361 : a9 07 __ LDA #$07
1363 : 8d fe 9f STA $9ffe ; (sstack + 3)
1366 : 8a __ __ TXA
1367 : 0a __ __ ASL
1368 : 0a __ __ ASL
1369 : 0a __ __ ASL
136a : 18 __ __ CLC
136b : 65 54 __ ADC T2 + 0 
136d : aa __ __ TAX
136e : a9 05 __ LDA #$05
1370 : 9d a0 33 STA $33a0,x ; (TheGame.moves[0] + 13)
1373 : ae 92 33 LDX $3392 ; (TheGame.step + 0)
1376 : ee 92 33 INC $3392 ; (TheGame.step + 0)
1379 : 98 __ __ TYA
137a : 9d 93 33 STA $3393,x ; (TheGame.moves[0] + 0)
137d : 20 f1 14 JSR $14f1 ; (item_drop_anim.s4 + 0)
1380 : a9 6b __ LDA #$6b
1382 : 8d fb 9f STA $9ffb ; (sstack + 0)
1385 : a9 33 __ LDA #$33
1387 : 8d fc 9f STA $9ffc ; (sstack + 1)
138a : 20 0a 0f JSR $0f0a ; (board_draw_main.s4 + 0)
138d : ad 15 d0 LDA $d015 
1390 : 29 fe __ AND #$fe
1392 : 8d 15 d0 STA $d015 
1395 : a9 01 __ LDA #$01
1397 : 20 6b 16 JSR $166b ; (board_eval.s4 + 0)
139a : a5 1c __ LDA ACCU + 1 
139c : c9 7d __ CMP #$7d
139e : d0 04 __ BNE $13a4 ; (game_loop.s40 + 0)
.s20:
13a0 : a5 1b __ LDA ACCU + 0 
13a2 : f0 05 __ BEQ $13a9 ; (game_loop.s39 + 0)
.s40:
13a4 : a9 02 __ LDA #$02
13a6 : 4c b2 12 JMP $12b2 ; (game_loop.s9 + 0)
.s39:
13a9 : a9 03 __ LDA #$03
13ab : 4c b2 12 JMP $12b2 ; (game_loop.s9 + 0)
.s27:
13ae : 20 73 14 JSR $1473 ; (getch.l4 + 0)
13b1 : c9 31 __ CMP #$31
13b3 : b0 03 __ BCS $13b8 ; (game_loop.s28 + 0)
13b5 : 4c ff 12 JMP $12ff ; (game_loop.s41 + 0)
.s28:
13b8 : c9 38 __ CMP #$38
13ba : b0 f9 __ BCS $13b5 ; (game_loop.s27 + 7)
.s29:
13bc : e9 30 __ SBC #$30
13be : 85 54 __ STA T2 + 0 
13c0 : 4c fd 12 JMP $12fd ; (game_loop.s38 + 0)
.s30:
13c3 : ad 92 33 LDA $3392 ; (TheGame.step + 0)
13c6 : 85 56 __ STA T4 + 0 
13c8 : 85 0d __ STA P0 
13ca : a9 93 __ LDA #$93
13cc : 85 0e __ STA P1 
13ce : a9 33 __ LDA #$33
13d0 : 85 0f __ STA P2 
13d2 : 20 f8 16 JSR $16f8 ; (board_opening.s4 + 0)
13d5 : 85 53 __ STA T0 + 0 
13d7 : a8 __ __ TAY
13d8 : c0 ff __ CPY #$ff
13da : d0 26 __ BNE $1402 ; (game_loop.s31 + 0)
.s37:
13dc : a9 00 __ LDA #$00
13de : a0 02 __ LDY #$02
13e0 : 91 23 __ STA (SP + 0),y 
13e2 : a9 01 __ LDA #$01
13e4 : c8 __ __ INY
13e5 : 91 23 __ STA (SP + 0),y 
13e7 : a9 80 __ LDA #$80
13e9 : c8 __ __ INY
13ea : 91 23 __ STA (SP + 0),y 
13ec : a9 ff __ LDA #$ff
13ee : c8 __ __ INY
13ef : 91 23 __ STA (SP + 0),y 
13f1 : a9 7f __ LDA #$7f
13f3 : c8 __ __ INY
13f4 : 91 23 __ STA (SP + 0),y 
13f6 : a9 00 __ LDA #$00
13f8 : c8 __ __ INY
13f9 : 91 23 __ STA (SP + 0),y 
13fb : 20 89 18 JSR $1889 ; (board_check.s1 + 0)
13fe : a4 1b __ LDY ACCU + 0 
1400 : 84 53 __ STY T0 + 0 
.s31:
1402 : b9 d8 33 LDA $33d8,y ; (board.ffree[0] + 0)
1405 : d0 03 __ BNE $140a ; (game_loop.s32 + 0)
1407 : 4c b8 12 JMP $12b8 ; (game_loop.s3 + 0)
.s32:
140a : 84 18 __ STY P11 
140c : aa __ __ TAX
140d : 18 __ __ CLC
140e : 69 ff __ ADC #$ff
1410 : 8d fd 9f STA $9ffd ; (sstack + 2)
1413 : 99 d8 33 STA $33d8,y ; (board.ffree[0] + 0)
1416 : a9 02 __ LDA #$02
1418 : 8d fe 9f STA $9ffe ; (sstack + 3)
141b : 8a __ __ TXA
141c : 0a __ __ ASL
141d : 0a __ __ ASL
141e : 0a __ __ ASL
141f : 18 __ __ CLC
1420 : 65 53 __ ADC T0 + 0 
1422 : aa __ __ TAX
1423 : a9 01 __ LDA #$01
1425 : 9d a0 33 STA $33a0,x ; (TheGame.moves[0] + 13)
1428 : a9 6b __ LDA #$6b
142a : 8d fb 9f STA $9ffb ; (sstack + 0)
142d : a9 33 __ LDA #$33
142f : 8d fc 9f STA $9ffc ; (sstack + 1)
1432 : 20 f1 14 JSR $14f1 ; (item_drop_anim.s4 + 0)
1435 : a9 6b __ LDA #$6b
1437 : 8d fb 9f STA $9ffb ; (sstack + 0)
143a : a9 33 __ LDA #$33
143c : 8d fc 9f STA $9ffc ; (sstack + 1)
143f : 20 0a 0f JSR $0f0a ; (board_draw_main.s4 + 0)
1442 : ad 15 d0 LDA $d015 
1445 : 29 fe __ AND #$fe
1447 : 8d 15 d0 STA $d015 
144a : a9 00 __ LDA #$00
144c : 20 6b 16 JSR $166b ; (board_eval.s4 + 0)
144f : a5 1c __ LDA ACCU + 1 
1451 : c9 7d __ CMP #$7d
1453 : d0 09 __ BNE $145e ; (game_loop.s33 + 0)
.s36:
1455 : a5 1b __ LDA ACCU + 0 
1457 : d0 05 __ BNE $145e ; (game_loop.s33 + 0)
.s35:
1459 : a9 04 __ LDA #$04
145b : 4c b2 12 JMP $12b2 ; (game_loop.s9 + 0)
.s33:
145e : a5 56 __ LDA T4 + 0 
1460 : c9 15 __ CMP #$15
1462 : f0 03 __ BEQ $1467 ; (game_loop.s34 + 0)
1464 : 4c d6 12 JMP $12d6 ; (game_loop.s12 + 0)
.s34:
1467 : a9 05 __ LDA #$05
1469 : 4c b2 12 JMP $12b2 ; (game_loop.s9 + 0)
--------------------------------------------------------------------
kbhit: ; kbhit()->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
146c : a5 c6 __ LDA $c6 
146e : 85 1b __ STA ACCU + 0 
.s3:
1470 : a5 1b __ LDA ACCU + 0 
1472 : 60 __ __ RTS
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
1473 : 20 e4 ff JSR $ffe4 
1476 : 85 1b __ STA ACCU + 0 
1478 : a5 1b __ LDA ACCU + 0 
147a : f0 f7 __ BEQ $1473 ; (getch.l4 + 0)
.s5:
147c : 4c 7f 14 JMP $147f ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
147f : a8 __ __ TAY
1480 : ad df 2c LDA $2cdf ; (giocharmap + 0)
1483 : f0 27 __ BEQ $14ac ; (convch.s5 + 0)
.s6:
1485 : c0 0d __ CPY #$0d
1487 : d0 03 __ BNE $148c ; (convch.s7 + 0)
.s16:
1489 : a9 0a __ LDA #$0a
.s3:
148b : 60 __ __ RTS
.s7:
148c : c9 02 __ CMP #$02
148e : 90 1c __ BCC $14ac ; (convch.s5 + 0)
.s8:
1490 : 98 __ __ TYA
1491 : c0 41 __ CPY #$41
1493 : 90 17 __ BCC $14ac ; (convch.s5 + 0)
.s9:
1495 : c9 db __ CMP #$db
1497 : b0 13 __ BCS $14ac ; (convch.s5 + 0)
.s10:
1499 : c9 c1 __ CMP #$c1
149b : 90 03 __ BCC $14a0 ; (convch.s11 + 0)
.s15:
149d : 49 a0 __ EOR #$a0
149f : a8 __ __ TAY
.s11:
14a0 : c9 7b __ CMP #$7b
14a2 : b0 08 __ BCS $14ac ; (convch.s5 + 0)
.s12:
14a4 : c9 61 __ CMP #$61
14a6 : b0 06 __ BCS $14ae ; (convch.s14 + 0)
.s13:
14a8 : c9 5b __ CMP #$5b
14aa : 90 02 __ BCC $14ae ; (convch.s14 + 0)
.s5:
14ac : 98 __ __ TYA
14ad : 60 __ __ RTS
.s14:
14ae : 49 20 __ EOR #$20
14b0 : 60 __ __ RTS
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
14b1 : aa __ __ TAX
14b2 : bd 00 dc LDA $dc00,x 
14b5 : a8 __ __ TAY
14b6 : 29 10 __ AND #$10
14b8 : f0 04 __ BEQ $14be ; (joy_poll.s10 + 0)
.s11:
14ba : a9 00 __ LDA #$00
14bc : f0 02 __ BEQ $14c0 ; (joy_poll.s12 + 0)
.s10:
14be : a9 01 __ LDA #$01
.s12:
14c0 : 9d e1 33 STA $33e1,x ; (joyb[0] + 0)
14c3 : 98 __ __ TYA
14c4 : 4a __ __ LSR
14c5 : b0 04 __ BCS $14cb ; (joy_poll.s9 + 0)
.s5:
14c7 : a9 ff __ LDA #$ff
14c9 : 90 0b __ BCC $14d6 ; (joy_poll.s6 + 0)
.s9:
14cb : 98 __ __ TYA
14cc : 29 02 __ AND #$02
14ce : f0 04 __ BEQ $14d4 ; (joy_poll.s13 + 0)
.s14:
14d0 : a9 00 __ LDA #$00
14d2 : b0 02 __ BCS $14d6 ; (joy_poll.s6 + 0)
.s13:
14d4 : a9 01 __ LDA #$01
.s6:
14d6 : 9d fe 2c STA $2cfe,x ; (joyy[0] + 0)
14d9 : 98 __ __ TYA
14da : 29 04 __ AND #$04
14dc : d0 06 __ BNE $14e4 ; (joy_poll.s8 + 0)
.s7:
14de : a9 ff __ LDA #$ff
.s3:
14e0 : 9d df 33 STA $33df,x ; (joyx[0] + 0)
14e3 : 60 __ __ RTS
.s8:
14e4 : 98 __ __ TYA
14e5 : 29 08 __ AND #$08
14e7 : f0 04 __ BEQ $14ed ; (joy_poll.s15 + 0)
.s16:
14e9 : a9 00 __ LDA #$00
14eb : f0 f3 __ BEQ $14e0 ; (joy_poll.s3 + 0)
.s15:
14ed : a9 01 __ LDA #$01
14ef : d0 ef __ BNE $14e0 ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
item_drop_anim: ; item_drop_anim(struct CharWin*,u8,u8,u8)->void
; 163, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
14f1 : a9 00 __ LDA #$00
14f3 : 85 0d __ STA P0 
14f5 : 85 16 __ STA P9 
14f7 : 85 17 __ STA P10 
14f9 : a9 01 __ LDA #$01
14fb : 85 0e __ STA P1 
14fd : 85 15 __ STA P8 
14ff : ad fb 9f LDA $9ffb ; (sstack + 0)
1502 : 85 4b __ STA T4 + 0 
1504 : a9 61 __ LDA #$61
1506 : 85 13 __ STA P6 
1508 : ad fc 9f LDA $9ffc ; (sstack + 1)
150b : 85 4c __ STA T4 + 1 
150d : a5 18 __ LDA P11 ; (x + 0)
150f : 0a __ __ ASL
1510 : a2 00 __ LDX #$00
1512 : 90 02 __ BCC $1516 ; (item_drop_anim.s19 + 0)
.s18:
1514 : e8 __ __ INX
1515 : 18 __ __ CLC
.s19:
1516 : 65 18 __ ADC P11 ; (x + 0)
1518 : 90 02 __ BCC $151c ; (item_drop_anim.s25 + 0)
.s24:
151a : e8 __ __ INX
151b : 18 __ __ CLC
.s25:
151c : a0 00 __ LDY #$00
151e : 71 4b __ ADC (T4 + 0),y 
1520 : 85 43 __ STA T0 + 0 
1522 : 8a __ __ TXA
1523 : 69 00 __ ADC #$00
1525 : 06 43 __ ASL T0 + 0 
1527 : 2a __ __ ROL
1528 : 06 43 __ ASL T0 + 0 
152a : 2a __ __ ROL
152b : 06 43 __ ASL T0 + 0 
152d : 2a __ __ ROL
152e : aa __ __ TAX
152f : 18 __ __ CLC
1530 : a5 43 __ LDA T0 + 0 
1532 : 69 20 __ ADC #$20
1534 : 85 0f __ STA P2 
1536 : 8a __ __ TXA
1537 : 69 00 __ ADC #$00
1539 : 85 10 __ STA P3 
153b : 29 01 __ AND #$01
153d : 85 48 __ STA T2 + 1 
153f : c8 __ __ INY
1540 : b1 4b __ LDA (T4 + 0),y 
1542 : 0a __ __ ASL
1543 : 85 45 __ STA T1 + 0 
1545 : a9 00 __ LDA #$00
1547 : 2a __ __ ROL
1548 : 06 45 __ ASL T1 + 0 
154a : 2a __ __ ROL
154b : 06 45 __ ASL T1 + 0 
154d : 2a __ __ ROL
154e : 85 46 __ STA T1 + 1 
1550 : a5 45 __ LDA T1 + 0 
1552 : 69 24 __ ADC #$24
1554 : 85 11 __ STA P4 
1556 : a5 46 __ LDA T1 + 1 
1558 : 69 00 __ ADC #$00
155a : 85 12 __ STA P5 
155c : ad fe 9f LDA $9ffe ; (sstack + 3)
155f : 85 14 __ STA P7 
1561 : 20 6b 11 JSR $116b ; (spr_set.s4 + 0)
1564 : a5 45 __ LDA T1 + 0 
1566 : 0a __ __ ASL
1567 : 85 43 __ STA T0 + 0 
1569 : a5 46 __ LDA T1 + 1 
156b : 2a __ __ ROL
156c : 06 43 __ ASL T0 + 0 
156e : 2a __ __ ROL
156f : 06 43 __ ASL T0 + 0 
1571 : 2a __ __ ROL
1572 : 06 43 __ ASL T0 + 0 
1574 : 2a __ __ ROL
1575 : 18 __ __ CLC
1576 : 69 02 __ ADC #$02
1578 : 85 44 __ STA T0 + 1 
157a : a5 43 __ LDA T0 + 0 
157c : 09 40 __ ORA #$40
157e : 85 43 __ STA T0 + 0 
1580 : ad fd 9f LDA $9ffd ; (sstack + 2)
1583 : 0a __ __ ASL
1584 : a2 00 __ LDX #$00
1586 : 90 02 __ BCC $158a ; (item_drop_anim.s21 + 0)
.s20:
1588 : e8 __ __ INX
1589 : 18 __ __ CLC
.s21:
158a : 6d fd 9f ADC $9ffd ; (sstack + 2)
158d : 90 02 __ BCC $1591 ; (item_drop_anim.s27 + 0)
.s26:
158f : e8 __ __ INX
1590 : 18 __ __ CLC
.s27:
1591 : a0 01 __ LDY #$01
1593 : 8c 1b d0 STY $d01b 
1596 : 71 4b __ ADC (T4 + 0),y 
1598 : 85 4a __ STA T3 + 1 
159a : 8a __ __ TXA
159b : 69 00 __ ADC #$00
159d : 4a __ __ LSR
159e : 66 4a __ ROR T3 + 1 
15a0 : a9 40 __ LDA #$40
15a2 : 6a __ __ ROR
15a3 : 85 49 __ STA T3 + 0 
15a5 : a5 4a __ LDA T3 + 1 
15a7 : 69 04 __ ADC #$04
15a9 : 85 4a __ STA T3 + 1 
15ab : a5 49 __ LDA T3 + 0 
15ad : 0a __ __ ASL
15ae : 85 4b __ STA T4 + 0 
15b0 : a5 4a __ LDA T3 + 1 
15b2 : 2a __ __ ROL
15b3 : 85 4c __ STA T4 + 1 
15b5 : a9 00 __ LDA #$00
15b7 : 85 4d __ STA T5 + 0 
15b9 : 85 4e __ STA T5 + 1 
15bb : a2 03 __ LDX #$03
.l5:
15bd : 18 __ __ CLC
15be : a5 4d __ LDA T5 + 0 
15c0 : 69 03 __ ADC #$03
15c2 : 85 4d __ STA T5 + 0 
15c4 : 90 03 __ BCC $15c9 ; (item_drop_anim.s23 + 0)
.s22:
15c6 : e6 4e __ INC T5 + 1 
15c8 : 18 __ __ CLC
.s23:
15c9 : 65 43 __ ADC T0 + 0 
15cb : 85 43 __ STA T0 + 0 
15cd : a5 4e __ LDA T5 + 1 
15cf : 65 44 __ ADC T0 + 1 
15d1 : 85 44 __ STA T0 + 1 
15d3 : a5 4a __ LDA T3 + 1 
15d5 : c5 44 __ CMP T0 + 1 
15d7 : d0 08 __ BNE $15e1 ; (item_drop_anim.s17 + 0)
.s14:
15d9 : a5 49 __ LDA T3 + 0 
15db : c5 43 __ CMP T0 + 0 
.s15:
15dd : 90 08 __ BCC $15e7 ; (item_drop_anim.s13 + 0)
15df : b0 4a __ BCS $162b ; (item_drop_anim.s6 + 0)
.s17:
15e1 : 45 44 __ EOR T0 + 1 
15e3 : 10 f8 __ BPL $15dd ; (item_drop_anim.s15 + 0)
.s16:
15e5 : 90 44 __ BCC $162b ; (item_drop_anim.s6 + 0)
.s13:
15e7 : 38 __ __ SEC
15e8 : a9 00 __ LDA #$00
15ea : e5 4d __ SBC T5 + 0 
15ec : 85 4d __ STA T5 + 0 
15ee : a9 00 __ LDA #$00
15f0 : e5 4e __ SBC T5 + 1 
15f2 : 85 4e __ STA T5 + 1 
15f4 : a5 4d __ LDA T5 + 0 
15f6 : 0a __ __ ASL
15f7 : 85 1b __ STA ACCU + 0 ; (y + 0)
15f9 : a5 4e __ LDA T5 + 1 
15fb : 2a __ __ ROL
15fc : 06 1b __ ASL ACCU + 0 ; (y + 0)
15fe : 2a __ __ ROL
15ff : a8 __ __ TAY
1600 : 18 __ __ CLC
1601 : a5 1b __ LDA ACCU + 0 ; (y + 0)
1603 : 65 4d __ ADC T5 + 0 
1605 : 85 4d __ STA T5 + 0 
1607 : 98 __ __ TYA
1608 : 65 4e __ ADC T5 + 1 
160a : 4a __ __ LSR
160b : 66 4d __ ROR T5 + 0 
160d : 4a __ __ LSR
160e : 66 4d __ ROR T5 + 0 
1610 : 4a __ __ LSR
1611 : 66 4d __ ROR T5 + 0 
1613 : 4a __ __ LSR
1614 : 66 4d __ ROR T5 + 0 
1616 : 49 08 __ EOR #$08
1618 : 38 __ __ SEC
1619 : e9 08 __ SBC #$08
161b : 85 4e __ STA T5 + 1 
161d : 38 __ __ SEC
161e : a5 4b __ LDA T4 + 0 
1620 : e5 43 __ SBC T0 + 0 
1622 : 85 43 __ STA T0 + 0 
1624 : a5 4c __ LDA T4 + 1 
1626 : e5 44 __ SBC T0 + 1 
1628 : 85 44 __ STA T0 + 1 
162a : ca __ __ DEX
.s6:
162b : a5 43 __ LDA T0 + 0 
162d : 85 1b __ STA ACCU + 0 ; (y + 0)
162f : a5 44 __ LDA T0 + 1 
1631 : 4a __ __ LSR
1632 : 66 1b __ ROR ACCU + 0 ; (y + 0)
1634 : 4a __ __ LSR
1635 : 66 1b __ ROR ACCU + 0 ; (y + 0)
1637 : 4a __ __ LSR
1638 : 66 1b __ ROR ACCU + 0 ; (y + 0)
163a : 4a __ __ LSR
163b : a5 1b __ LDA ACCU + 0 ; (y + 0)
163d : 6a __ __ ROR
163e : 8d 01 d0 STA $d001 
1641 : a5 0f __ LDA P2 
1643 : 8d 00 d0 STA $d000 
1646 : a5 48 __ LDA T2 + 1 
1648 : d0 08 __ BNE $1652 ; (item_drop_anim.s12 + 0)
.s7:
164a : ad 10 d0 LDA $d010 
164d : 29 fe __ AND #$fe
164f : 4c 57 16 JMP $1657 ; (item_drop_anim.s8 + 0)
.s12:
1652 : ad 10 d0 LDA $d010 
1655 : 09 01 __ ORA #$01
.s8:
1657 : 8d 10 d0 STA $d010 
.l9:
165a : 2c 11 d0 BIT $d011 
165d : 30 fb __ BMI $165a ; (item_drop_anim.l9 + 0)
.l10:
165f : 2c 11 d0 BIT $d011 
1662 : 10 fb __ BPL $165f ; (item_drop_anim.l10 + 0)
.s11:
1664 : 8a __ __ TXA
1665 : f0 03 __ BEQ $166a ; (item_drop_anim.s3 + 0)
1667 : 4c bd 15 JMP $15bd ; (item_drop_anim.l5 + 0)
.s3:
166a : 60 __ __ RTS
--------------------------------------------------------------------
board_eval: ; board_eval(bool)->i16
; 443, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
166b : a0 00 __ LDY #$00
166d : 84 1b __ STY ACCU + 0 
166f : 84 1c __ STY ACCU + 1 
1671 : 84 1e __ STY ACCU + 3 
1673 : aa __ __ TAX
1674 : 18 __ __ CLC
.l14:
1675 : b9 fa 34 LDA $34fa,y ; (frows[0][0] + 0)
1678 : a8 __ __ TAY
1679 : b9 a8 33 LDA $33a8,y ; (board.fcols[0] + 0)
167c : 85 1d __ STA ACCU + 2 
167e : a4 1e __ LDY ACCU + 3 
1680 : b9 3f 35 LDA $353f,y ; (frows[0][0] + 69)
1683 : a8 __ __ TAY
1684 : b9 a8 33 LDA $33a8,y ; (board.fcols[0] + 0)
1687 : 65 1d __ ADC ACCU + 2 
1689 : 85 1d __ STA ACCU + 2 
168b : a4 1e __ LDY ACCU + 3 
168d : b9 84 35 LDA $3584,y ; (frows[0][0] + 138)
1690 : a8 __ __ TAY
1691 : b9 a8 33 LDA $33a8,y ; (board.fcols[0] + 0)
1694 : 18 __ __ CLC
1695 : 65 1d __ ADC ACCU + 2 
1697 : 85 1d __ STA ACCU + 2 
1699 : a4 1e __ LDY ACCU + 3 
169b : b9 c9 35 LDA $35c9,y ; (frows[0][0] + 207)
169e : a8 __ __ TAY
169f : b9 a8 33 LDA $33a8,y ; (board.fcols[0] + 0)
16a2 : 18 __ __ CLC
16a3 : 65 1d __ ADC ACCU + 2 
16a5 : a4 1e __ LDY ACCU + 3 
16a7 : 18 __ __ CLC
16a8 : 79 0e 36 ADC $360e,y ; (frows[0][0] + 276)
16ab : 0a __ __ ASL
16ac : a8 __ __ TAY
16ad : b9 00 34 LDA $3400,y ; (fscore[0] + 0)
16b0 : 18 __ __ CLC
16b1 : 65 1b __ ADC ACCU + 0 
16b3 : 85 1b __ STA ACCU + 0 
16b5 : b9 01 34 LDA $3401,y ; (fscore[0] + 1)
16b8 : 65 1c __ ADC ACCU + 1 
16ba : 85 1c __ STA ACCU + 1 
16bc : e6 1e __ INC ACCU + 3 
16be : a4 1e __ LDY ACCU + 3 
16c0 : c0 45 __ CPY #$45
16c2 : 90 b1 __ BCC $1675 ; (board_eval.l14 + 0)
.s5:
16c4 : a8 __ __ TAY
16c5 : 10 04 __ BPL $16cb ; (board_eval.s6 + 0)
.s15:
16c7 : c9 e0 __ CMP #$e0
16c9 : 90 28 __ BCC $16f3 ; (board_eval.s12 + 0)
.s6:
16cb : 49 80 __ EOR #$80
16cd : c9 a0 __ CMP #$a0
16cf : 8a __ __ TXA
16d0 : 90 13 __ BCC $16e5 ; (board_eval.s7 + 0)
.s9:
16d2 : f0 08 __ BEQ $16dc ; (board_eval.s10 + 0)
.s11:
16d4 : a9 00 __ LDA #$00
16d6 : 85 1b __ STA ACCU + 0 
16d8 : a9 7d __ LDA #$7d
16da : d0 06 __ BNE $16e2 ; (board_eval.s13 + 0)
.s10:
16dc : a9 00 __ LDA #$00
16de : 85 1b __ STA ACCU + 0 
16e0 : a9 83 __ LDA #$83
.s13:
16e2 : 85 1c __ STA ACCU + 1 
.s3:
16e4 : 60 __ __ RTS
.s7:
16e5 : d0 fd __ BNE $16e4 ; (board_eval.s3 + 0)
.s8:
16e7 : 38 __ __ SEC
16e8 : e5 1b __ SBC ACCU + 0 
16ea : 85 1b __ STA ACCU + 0 
16ec : a9 00 __ LDA #$00
16ee : e5 1c __ SBC ACCU + 1 
16f0 : 85 1c __ STA ACCU + 1 
16f2 : 60 __ __ RTS
.s12:
16f3 : 8a __ __ TXA
16f4 : d0 e6 __ BNE $16dc ; (board_eval.s10 + 0)
16f6 : f0 dc __ BEQ $16d4 ; (board_eval.s11 + 0)
--------------------------------------------------------------------
board_opening: ; board_opening(u8,u8*)->u8
; 570, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
16f8 : a5 0d __ LDA P0 ; (step + 0)
16fa : c9 03 __ CMP #$03
16fc : d0 03 __ BNE $1701 ; (board_opening.s5 + 0)
16fe : 4c 3a 18 JMP $183a ; (board_opening.s17 + 0)
.s5:
1701 : b0 03 __ BCS $1706 ; (board_opening.s6 + 0)
1703 : 4c fe 17 JMP $17fe ; (board_opening.s11 + 0)
.s6:
1706 : c9 04 __ CMP #$04
1708 : f0 03 __ BEQ $170d ; (board_opening.s8 + 0)
.s7:
170a : a9 ff __ LDA #$ff
.s3:
170c : 60 __ __ RTS
.s8:
170d : a0 03 __ LDY #$03
170f : b1 0e __ LDA (P1),y ; (moves + 0)
1711 : 85 45 __ STA T1 + 0 
1713 : 88 __ __ DEY
1714 : b1 0e __ LDA (P1),y ; (moves + 0)
1716 : 85 47 __ STA T2 + 0 
1718 : 88 __ __ DEY
1719 : b1 0e __ LDA (P1),y ; (moves + 0)
171b : 85 1c __ STA ACCU + 1 
171d : 85 1b __ STA ACCU + 0 
171f : 88 __ __ DEY
1720 : b1 0e __ LDA (P1),y ; (moves + 0)
1722 : c9 04 __ CMP #$04
1724 : b0 03 __ BCS $1729 ; (board_opening.s9 + 0)
1726 : 4c ae 17 JMP $17ae ; (board_opening.s10 + 0)
.s9:
1729 : a9 06 __ LDA #$06
172b : f1 0e __ SBC (P1),y ; (moves + 0)
172d : aa __ __ TAX
172e : bd 8a 1c LDA $1c8a,x ; (__multab343L + 0)
1731 : 85 43 __ STA T0 + 0 
1733 : bd 8e 1c LDA $1c8e,x ; (__multab343H + 0)
1736 : 85 44 __ STA T0 + 1 
1738 : 38 __ __ SEC
1739 : a9 06 __ LDA #$06
173b : e5 1c __ SBC ACCU + 1 
173d : 85 1b __ STA ACCU + 0 
173f : 98 __ __ TYA
1740 : e9 00 __ SBC #$00
1742 : 85 1c __ STA ACCU + 1 
1744 : a9 31 __ LDA #$31
1746 : 20 c8 1b JSR $1bc8 ; (mul16by8 + 0)
1749 : 18 __ __ CLC
174a : a5 1b __ LDA ACCU + 0 
174c : 65 43 __ ADC T0 + 0 
174e : aa __ __ TAX
174f : a5 1c __ LDA ACCU + 1 
1751 : 65 44 __ ADC T0 + 1 
1753 : 85 44 __ STA T0 + 1 
1755 : 38 __ __ SEC
1756 : a9 06 __ LDA #$06
1758 : e5 47 __ SBC T2 + 0 
175a : 85 47 __ STA T2 + 0 
175c : a9 00 __ LDA #$00
175e : e9 00 __ SBC #$00
1760 : 85 48 __ STA T2 + 1 
1762 : a5 47 __ LDA T2 + 0 
1764 : 0a __ __ ASL
1765 : 85 1b __ STA ACCU + 0 
1767 : a5 48 __ LDA T2 + 1 
1769 : 2a __ __ ROL
176a : 06 1b __ ASL ACCU + 0 
176c : 2a __ __ ROL
176d : 06 1b __ ASL ACCU + 0 
176f : 2a __ __ ROL
1770 : a8 __ __ TAY
1771 : 38 __ __ SEC
1772 : a5 1b __ LDA ACCU + 0 
1774 : e5 47 __ SBC T2 + 0 
1776 : 85 47 __ STA T2 + 0 
1778 : 98 __ __ TYA
1779 : e5 48 __ SBC T2 + 1 
177b : a8 __ __ TAY
177c : 8a __ __ TXA
177d : 18 __ __ CLC
177e : 65 47 __ ADC T2 + 0 
1780 : 85 43 __ STA T0 + 0 
1782 : 98 __ __ TYA
1783 : 65 44 __ ADC T0 + 1 
1785 : aa __ __ TAX
1786 : 38 __ __ SEC
1787 : a9 06 __ LDA #$06
1789 : e5 45 __ SBC T1 + 0 
178b : a8 __ __ TAY
178c : a9 00 __ LDA #$00
178e : e9 00 __ SBC #$00
1790 : 85 46 __ STA T1 + 1 
1792 : 98 __ __ TYA
1793 : 18 __ __ CLC
1794 : 65 43 __ ADC T0 + 0 
1796 : a8 __ __ TAY
1797 : 8a __ __ TXA
1798 : 65 46 __ ADC T1 + 1 
179a : aa __ __ TAX
179b : 98 __ __ TYA
179c : 18 __ __ CLC
179d : 69 c4 __ ADC #$c4
179f : 85 43 __ STA T0 + 0 
17a1 : 8a __ __ TXA
17a2 : 69 2d __ ADC #$2d
17a4 : 85 44 __ STA T0 + 1 
17a6 : a9 06 __ LDA #$06
17a8 : 38 __ __ SEC
17a9 : a0 00 __ LDY #$00
17ab : f1 43 __ SBC (T0 + 0),y 
17ad : 60 __ __ RTS
.s10:
17ae : 84 1c __ STY ACCU + 1 
17b0 : aa __ __ TAX
17b1 : bd 8a 1c LDA $1c8a,x ; (__multab343L + 0)
17b4 : 85 43 __ STA T0 + 0 
17b6 : bd 8e 1c LDA $1c8e,x ; (__multab343H + 0)
17b9 : 85 44 __ STA T0 + 1 
17bb : a9 31 __ LDA #$31
17bd : 20 c8 1b JSR $1bc8 ; (mul16by8 + 0)
17c0 : 18 __ __ CLC
17c1 : a5 1b __ LDA ACCU + 0 
17c3 : 65 43 __ ADC T0 + 0 
17c5 : a8 __ __ TAY
17c6 : a5 1c __ LDA ACCU + 1 
17c8 : 65 44 __ ADC T0 + 1 
17ca : 85 44 __ STA T0 + 1 
17cc : a5 47 __ LDA T2 + 0 
17ce : 0a __ __ ASL
17cf : 85 1b __ STA ACCU + 0 
17d1 : a9 00 __ LDA #$00
17d3 : 2a __ __ ROL
17d4 : 06 1b __ ASL ACCU + 0 
17d6 : 2a __ __ ROL
17d7 : 06 1b __ ASL ACCU + 0 
17d9 : 2a __ __ ROL
17da : aa __ __ TAX
17db : 38 __ __ SEC
17dc : a5 1b __ LDA ACCU + 0 
17de : e5 47 __ SBC T2 + 0 
17e0 : 85 47 __ STA T2 + 0 
17e2 : b0 01 __ BCS $17e5 ; (board_opening.s21 + 0)
.s20:
17e4 : ca __ __ DEX
.s21:
17e5 : 98 __ __ TYA
17e6 : 18 __ __ CLC
17e7 : 65 47 __ ADC T2 + 0 
17e9 : a8 __ __ TAY
17ea : 8a __ __ TXA
17eb : 65 44 __ ADC T0 + 1 
17ed : aa __ __ TAX
17ee : 98 __ __ TYA
17ef : 18 __ __ CLC
17f0 : 69 c4 __ ADC #$c4
17f2 : 85 43 __ STA T0 + 0 
17f4 : 8a __ __ TXA
17f5 : 69 2d __ ADC #$2d
17f7 : 85 44 __ STA T0 + 1 
17f9 : a4 45 __ LDY T1 + 0 
17fb : b1 43 __ LDA (T0 + 0),y 
17fd : 60 __ __ RTS
.s11:
17fe : c9 01 __ CMP #$01
1800 : d0 03 __ BNE $1805 ; (board_opening.s12 + 0)
.s16:
1802 : a9 03 __ LDA #$03
1804 : 60 __ __ RTS
.s12:
1805 : c9 02 __ CMP #$02
1807 : f0 03 __ BEQ $180c ; (board_opening.s13 + 0)
1809 : 4c 0a 17 JMP $170a ; (board_opening.s7 + 0)
.s13:
180c : a0 01 __ LDY #$01
180e : b1 0e __ LDA (P1),y ; (moves + 0)
1810 : 85 45 __ STA T1 + 0 
1812 : 88 __ __ DEY
1813 : b1 0e __ LDA (P1),y ; (moves + 0)
1815 : c9 04 __ CMP #$04
1817 : 90 16 __ BCC $182f ; (board_opening.s15 + 0)
.s14:
1819 : a9 06 __ LDA #$06
181b : f1 0e __ SBC (P1),y ; (moves + 0)
181d : aa __ __ TAX
181e : 38 __ __ SEC
181f : a9 06 __ LDA #$06
1821 : e5 45 __ SBC T1 + 0 
1823 : 18 __ __ CLC
1824 : 7d 92 1c ADC $1c92,x ; (__multab7L + 0)
1827 : aa __ __ TAX
1828 : 38 __ __ SEC
1829 : a9 06 __ LDA #$06
182b : fd e0 2c SBC $2ce0,x ; (open2[0] + 0)
182e : 60 __ __ RTS
.s15:
182f : aa __ __ TAX
1830 : bd 92 1c LDA $1c92,x ; (__multab7L + 0)
1833 : 65 45 __ ADC T1 + 0 
1835 : aa __ __ TAX
1836 : bd e0 2c LDA $2ce0,x ; (open2[0] + 0)
1839 : 60 __ __ RTS
.s17:
183a : a0 02 __ LDY #$02
183c : b1 0e __ LDA (P1),y ; (moves + 0)
183e : 85 45 __ STA T1 + 0 
1840 : 88 __ __ DEY
1841 : b1 0e __ LDA (P1),y ; (moves + 0)
1843 : 85 47 __ STA T2 + 0 
1845 : 88 __ __ DEY
1846 : b1 0e __ LDA (P1),y ; (moves + 0)
1848 : c9 04 __ CMP #$04
184a : 90 28 __ BCC $1874 ; (board_opening.s19 + 0)
.s18:
184c : 49 ff __ EOR #$ff
184e : 69 06 __ ADC #$06
1850 : aa __ __ TAX
1851 : 38 __ __ SEC
1852 : a9 06 __ LDA #$06
1854 : e5 47 __ SBC T2 + 0 
1856 : 85 47 __ STA T2 + 0 
1858 : 0a __ __ ASL
1859 : 0a __ __ ASL
185a : 0a __ __ ASL
185b : 38 __ __ SEC
185c : e5 47 __ SBC T2 + 0 
185e : 18 __ __ CLC
185f : 7d 96 1c ADC $1c96,x ; (__multab49L + 0)
1862 : 85 43 __ STA T0 + 0 
1864 : 38 __ __ SEC
1865 : a9 06 __ LDA #$06
1867 : e5 45 __ SBC T1 + 0 
1869 : 18 __ __ CLC
186a : 65 43 __ ADC T0 + 0 
186c : aa __ __ TAX
186d : 38 __ __ SEC
186e : a9 06 __ LDA #$06
1870 : fd 00 2d SBC $2d00,x ; (open3[0] + 0)
1873 : 60 __ __ RTS
.s19:
1874 : aa __ __ TAX
1875 : a5 47 __ LDA T2 + 0 
1877 : 0a __ __ ASL
1878 : 0a __ __ ASL
1879 : 0a __ __ ASL
187a : 38 __ __ SEC
187b : e5 47 __ SBC T2 + 0 
187d : 18 __ __ CLC
187e : 7d 96 1c ADC $1c96,x ; (__multab49L + 0)
1881 : 18 __ __ CLC
1882 : 65 45 __ ADC T1 + 0 
1884 : aa __ __ TAX
1885 : bd 00 2d LDA $2d00,x ; (open3[0] + 0)
1888 : 60 __ __ RTS
--------------------------------------------------------------------
board_check: ; board_check(u8,i16,i16,bool)->i16
; 488, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s1:
1889 : 38 __ __ SEC
188a : a5 23 __ LDA SP + 0 
188c : e9 1f __ SBC #$1f
188e : 85 23 __ STA SP + 0 
1890 : b0 02 __ BCS $1894 ; (board_check.s1 + 11)
1892 : c6 24 __ DEC SP + 1 
1894 : a0 17 __ LDY #$17
1896 : a2 0f __ LDX #$0f
1898 : b5 53 __ LDA T0 + 0,x 
189a : 91 23 __ STA (SP + 0),y 
189c : 88 __ __ DEY
189d : ca __ __ DEX
189e : 10 f8 __ BPL $1898 ; (board_check.s1 + 15)
.s4:
18a0 : a0 26 __ LDY #$26
18a2 : b1 23 __ LDA (SP + 0),y 
18a4 : 85 5d __ STA T9 + 0 
18a6 : 20 6b 16 JSR $166b ; (board_eval.s4 + 0)
18a9 : a0 21 __ LDY #$21
18ab : b1 23 __ LDA (SP + 0),y 
18ad : 85 5b __ STA T7 + 0 
18af : 18 __ __ CLC
18b0 : 65 1b __ ADC ACCU + 0 
18b2 : 85 57 __ STA T2 + 0 
18b4 : a5 1c __ LDA ACCU + 1 
18b6 : 69 00 __ ADC #$00
18b8 : 85 58 __ STA T2 + 1 
18ba : a9 00 __ LDA #$00
18bc : 85 5e __ STA T10 + 0 
18be : 85 5f __ STA T11 + 0 
18c0 : c8 __ __ INY
18c1 : b1 23 __ LDA (SP + 0),y 
18c3 : 85 59 __ STA T3 + 0 
18c5 : c8 __ __ INY
18c6 : b1 23 __ LDA (SP + 0),y 
18c8 : 85 5a __ STA T3 + 1 
18ca : a5 5b __ LDA T7 + 0 
18cc : c9 05 __ CMP #$05
18ce : 90 03 __ BCC $18d3 ; (board_check.s10 + 0)
18d0 : 4c 6d 19 JMP $196d ; (board_check.s5 + 0)
.s10:
18d3 : a5 58 __ LDA T2 + 1 
18d5 : 49 80 __ EOR #$80
18d7 : c9 93 __ CMP #$93
18d9 : d0 04 __ BNE $18df ; (board_check.s34 + 0)
.s33:
18db : a5 57 __ LDA T2 + 0 
18dd : c9 88 __ CMP #$88
.s34:
18df : b0 ef __ BCS $18d0 ; (board_check.s4 + 48)
.s11:
18e1 : a5 58 __ LDA T2 + 1 
18e3 : 49 80 __ EOR #$80
18e5 : c9 6c __ CMP #$6c
18e7 : d0 04 __ BNE $18ed ; (board_check.s32 + 0)
.s31:
18e9 : a5 57 __ LDA T2 + 0 
18eb : c9 79 __ CMP #$79
.s32:
18ed : 90 7e __ BCC $196d ; (board_check.s5 + 0)
.s12:
18ef : a9 00 __ LDA #$00
18f1 : 85 60 __ STA T12 + 0 
18f3 : a5 5b __ LDA T7 + 0 
18f5 : c9 03 __ CMP #$03
18f7 : d0 5d __ BNE $1956 ; (board_check.s13 + 0)
.s30:
18f9 : a9 83 __ LDA #$83
18fb : 85 13 __ STA P6 
18fd : a9 33 __ LDA #$33
18ff : 85 14 __ STA P7 
1901 : 20 d9 1a JSR $1ad9 ; (board_draw.s4 + 0)
1904 : a5 57 __ LDA T2 + 0 
1906 : 85 0d __ STA P0 ; (level + 0)
1908 : a5 58 __ LDA T2 + 1 
190a : 85 0e __ STA P1 ; (alpha + 0)
190c : a9 0a __ LDA #$0a
190e : 85 11 __ STA P4 ; (beta + 1)
1910 : a9 33 __ LDA #$33
1912 : 85 10 __ STA P3 ; (beta + 0)
1914 : a9 00 __ LDA #$00
1916 : 85 12 __ STA P5 ; (player + 0)
1918 : a9 e3 __ LDA #$e3
191a : 85 0f __ STA P2 ; (alpha + 1)
191c : 20 42 1b JSR $1b42 ; (itoa.s4 + 0)
191f : a9 01 __ LDA #$01
1921 : e6 12 __ INC P5 ; (player + 0)
1923 : 85 14 __ STA P7 
1925 : a9 83 __ LDA #$83
1927 : 85 0d __ STA P0 ; (level + 0)
1929 : a9 33 __ LDA #$33
192b : 85 0e __ STA P1 ; (alpha + 0)
192d : a9 00 __ LDA #$00
192f : 85 0f __ STA P2 ; (alpha + 1)
1931 : a9 06 __ LDA #$06
1933 : 85 10 __ STA P3 ; (beta + 0)
1935 : a9 07 __ LDA #$07
1937 : 85 11 __ STA P4 ; (beta + 1)
1939 : ad d8 2c LDA $2cd8 ; (p2smap[0] + 1)
193c : 49 20 __ EOR #$20
193e : 85 13 __ STA P6 
1940 : 20 87 0d JSR $0d87 ; (cwin_fill_rect_raw.s4 + 0)
1943 : a9 e3 __ LDA #$e3
1945 : 85 11 __ STA P4 ; (beta + 1)
1947 : a9 01 __ LDA #$01
1949 : 85 13 __ STA P6 
194b : a9 33 __ LDA #$33
194d : 85 12 __ STA P5 ; (player + 0)
194f : 20 f5 11 JSR $11f5 ; (cwin_putat_string.s4 + 0)
1952 : a9 03 __ LDA #$03
1954 : 85 5b __ STA T7 + 0 
.s13:
1956 : 18 __ __ CLC
1957 : 69 01 __ ADC #$01
1959 : 85 61 __ STA T13 + 0 
195b : a2 00 __ LDX #$00
.l14:
195d : bc 20 33 LDY $3320,x ; (optx[0] + 0)
1960 : b9 d8 33 LDA $33d8,y ; (board.ffree[0] + 0)
1963 : d0 3e __ BNE $19a3 ; (board_check.s16 + 0)
.s15:
1965 : e6 60 __ INC T12 + 0 
1967 : a6 60 __ LDX T12 + 0 
1969 : e0 07 __ CPX #$07
196b : 90 f0 __ BCC $195d ; (board_check.l14 + 0)
.s5:
196d : a5 5b __ LDA T7 + 0 
196f : d0 07 __ BNE $1978 ; (board_check.s7 + 0)
.s6:
1971 : a9 00 __ LDA #$00
1973 : a6 5f __ LDX T11 + 0 
1975 : 4c 87 19 JMP $1987 ; (board_check.s3 + 0)
.s7:
1978 : a5 5e __ LDA T10 + 0 
197a : d0 07 __ BNE $1983 ; (board_check.s9 + 0)
.s8:
197c : a5 58 __ LDA T2 + 1 
197e : a6 57 __ LDX T2 + 0 
1980 : 4c 87 19 JMP $1987 ; (board_check.s3 + 0)
.s9:
1983 : a5 5a __ LDA T3 + 1 
1985 : a6 59 __ LDX T3 + 0 
.s3:
1987 : 86 1b __ STX ACCU + 0 
1989 : 85 1c __ STA ACCU + 1 
198b : a0 17 __ LDY #$17
198d : a2 0f __ LDX #$0f
198f : b1 23 __ LDA (SP + 0),y 
1991 : 95 53 __ STA T0 + 0,x 
1993 : 88 __ __ DEY
1994 : ca __ __ DEX
1995 : 10 f8 __ BPL $198f ; (board_check.s3 + 8)
1997 : 18 __ __ CLC
1998 : a5 23 __ LDA SP + 0 
199a : 69 1f __ ADC #$1f
199c : 85 23 __ STA SP + 0 
199e : 90 02 __ BCC $19a2 ; (board_check.s3 + 27)
19a0 : e6 24 __ INC SP + 1 
19a2 : 60 __ __ RTS
.s16:
19a3 : 84 5c __ STY T8 + 0 
19a5 : aa __ __ TAX
19a6 : 18 __ __ CLC
19a7 : 69 ff __ ADC #$ff
19a9 : 99 d8 33 STA $33d8,y ; (board.ffree[0] + 0)
19ac : a5 5d __ LDA T9 + 0 
19ae : f0 04 __ BEQ $19b4 ; (board_check.s35 + 0)
.s36:
19b0 : a0 05 __ LDY #$05
19b2 : d0 02 __ BNE $19b6 ; (board_check.s37 + 0)
.s35:
19b4 : a0 01 __ LDY #$01
.s37:
19b6 : 8a __ __ TXA
19b7 : 0a __ __ ASL
19b8 : 0a __ __ ASL
19b9 : 0a __ __ ASL
19ba : 05 5c __ ORA T8 + 0 
19bc : aa __ __ TAX
19bd : 98 __ __ TYA
19be : 9d a0 33 STA $33a0,x ; (TheGame.moves[0] + 13)
19c1 : a5 61 __ LDA T13 + 0 
19c3 : a0 02 __ LDY #$02
19c5 : 91 23 __ STA (SP + 0),y 
19c7 : a0 24 __ LDY #$24
19c9 : b1 23 __ LDA (SP + 0),y 
19cb : 85 55 __ STA T1 + 0 
19cd : c8 __ __ INY
19ce : b1 23 __ LDA (SP + 0),y 
19d0 : 85 56 __ STA T1 + 1 
19d2 : 38 __ __ SEC
19d3 : a9 00 __ LDA #$00
19d5 : e5 55 __ SBC T1 + 0 
19d7 : a0 03 __ LDY #$03
19d9 : 91 23 __ STA (SP + 0),y 
19db : a9 00 __ LDA #$00
19dd : e5 56 __ SBC T1 + 1 
19df : c8 __ __ INY
19e0 : 91 23 __ STA (SP + 0),y 
19e2 : 38 __ __ SEC
19e3 : a9 00 __ LDA #$00
19e5 : e5 59 __ SBC T3 + 0 
19e7 : c8 __ __ INY
19e8 : 91 23 __ STA (SP + 0),y 
19ea : a9 00 __ LDA #$00
19ec : e5 5a __ SBC T3 + 1 
19ee : c8 __ __ INY
19ef : 91 23 __ STA (SP + 0),y 
19f1 : a9 00 __ LDA #$00
19f3 : c5 5d __ CMP T9 + 0 
19f5 : 2a __ __ ROL
19f6 : c8 __ __ INY
19f7 : 91 23 __ STA (SP + 0),y 
19f9 : 20 89 18 JSR $1889 ; (board_check.s1 + 0)
19fc : a9 01 __ LDA #$01
19fe : 85 5e __ STA T10 + 0 
1a00 : 38 __ __ SEC
1a01 : a9 00 __ LDA #$00
1a03 : e5 1b __ SBC ACCU + 0 
1a05 : 85 53 __ STA T0 + 0 
1a07 : a9 00 __ LDA #$00
1a09 : e5 1c __ SBC ACCU + 1 
1a0b : 85 54 __ STA T0 + 1 
1a0d : a5 5a __ LDA T3 + 1 
1a0f : c5 54 __ CMP T0 + 1 
1a11 : d0 09 __ BNE $1a1c ; (board_check.s29 + 0)
.s26:
1a13 : a5 59 __ LDA T3 + 0 
1a15 : c5 53 __ CMP T0 + 0 
.s27:
1a17 : 90 09 __ BCC $1a22 ; (board_check.s18 + 0)
1a19 : 4c c3 1a JMP $1ac3 ; (board_check.s17 + 0)
.s29:
1a1c : 45 54 __ EOR T0 + 1 
1a1e : 10 f7 __ BPL $1a17 ; (board_check.s27 + 0)
.s28:
1a20 : 90 f7 __ BCC $1a19 ; (board_check.s27 + 2)
.s18:
1a22 : a5 5c __ LDA T8 + 0 
1a24 : 85 5f __ STA T11 + 0 
1a26 : a5 53 __ LDA T0 + 0 
1a28 : 85 59 __ STA T3 + 0 
1a2a : a5 54 __ LDA T0 + 1 
1a2c : 85 5a __ STA T3 + 1 
1a2e : a9 00 __ LDA #$00
1a30 : c5 5b __ CMP T7 + 0 
1a32 : 2a __ __ ROL
1a33 : 85 62 __ STA T14 + 0 
1a35 : f0 5b __ BEQ $1a92 ; (board_check.s19 + 0)
.s25:
1a37 : a9 77 __ LDA #$77
1a39 : 85 13 __ STA P6 
1a3b : a9 33 __ LDA #$33
1a3d : 85 14 __ STA P7 
1a3f : 20 d9 1a JSR $1ad9 ; (board_draw.s4 + 0)
1a42 : a5 53 __ LDA T0 + 0 
1a44 : 85 0d __ STA P0 ; (level + 0)
1a46 : a5 54 __ LDA T0 + 1 
1a48 : 85 0e __ STA P1 ; (alpha + 0)
1a4a : a9 0a __ LDA #$0a
1a4c : 85 11 __ STA P4 ; (beta + 1)
1a4e : a9 33 __ LDA #$33
1a50 : 85 10 __ STA P3 ; (beta + 0)
1a52 : a9 00 __ LDA #$00
1a54 : 85 12 __ STA P5 ; (player + 0)
1a56 : a9 e3 __ LDA #$e3
1a58 : 85 0f __ STA P2 ; (alpha + 1)
1a5a : 20 42 1b JSR $1b42 ; (itoa.s4 + 0)
1a5d : a9 00 __ LDA #$00
1a5f : 85 5b __ STA T7 + 0 
1a61 : 85 0f __ STA P2 ; (alpha + 1)
1a63 : a9 77 __ LDA #$77
1a65 : 85 0d __ STA P0 ; (level + 0)
1a67 : a9 33 __ LDA #$33
1a69 : 85 0e __ STA P1 ; (alpha + 0)
1a6b : a9 01 __ LDA #$01
1a6d : e6 12 __ INC P5 ; (player + 0)
1a6f : 85 14 __ STA P7 
1a71 : a9 06 __ LDA #$06
1a73 : 85 10 __ STA P3 ; (beta + 0)
1a75 : a9 07 __ LDA #$07
1a77 : 85 11 __ STA P4 ; (beta + 1)
1a79 : ad d8 2c LDA $2cd8 ; (p2smap[0] + 1)
1a7c : 49 20 __ EOR #$20
1a7e : 85 13 __ STA P6 
1a80 : 20 87 0d JSR $0d87 ; (cwin_fill_rect_raw.s4 + 0)
1a83 : a9 e3 __ LDA #$e3
1a85 : 85 11 __ STA P4 ; (beta + 1)
1a87 : a9 01 __ LDA #$01
1a89 : 85 13 __ STA P6 
1a8b : a9 33 __ LDA #$33
1a8d : 85 12 __ STA P5 ; (player + 0)
1a8f : 20 f5 11 JSR $11f5 ; (cwin_putat_string.s4 + 0)
.s19:
1a92 : a5 56 __ LDA T1 + 1 
1a94 : c5 54 __ CMP T0 + 1 
1a96 : d0 08 __ BNE $1aa0 ; (board_check.s24 + 0)
.s21:
1a98 : a5 55 __ LDA T1 + 0 
1a9a : c5 53 __ CMP T0 + 0 
.s22:
1a9c : 90 08 __ BCC $1aa6 ; (board_check.s20 + 0)
1a9e : b0 23 __ BCS $1ac3 ; (board_check.s17 + 0)
.s24:
1aa0 : 45 54 __ EOR T0 + 1 
1aa2 : 10 f8 __ BPL $1a9c ; (board_check.s22 + 0)
.s23:
1aa4 : 90 1d __ BCC $1ac3 ; (board_check.s17 + 0)
.s20:
1aa6 : a6 5c __ LDX T8 + 0 
1aa8 : bd d8 33 LDA $33d8,x ; (board.ffree[0] + 0)
1aab : fe d8 33 INC $33d8,x ; (board.ffree[0] + 0)
1aae : 0a __ __ ASL
1aaf : 0a __ __ ASL
1ab0 : 0a __ __ ASL
1ab1 : 05 5c __ ORA T8 + 0 
1ab3 : aa __ __ TAX
1ab4 : a9 00 __ LDA #$00
1ab6 : 9d a8 33 STA $33a8,x ; (board.fcols[0] + 0)
1ab9 : a5 62 __ LDA T14 + 0 
1abb : d0 03 __ BNE $1ac0 ; (board_check.s20 + 26)
1abd : 4c 83 19 JMP $1983 ; (board_check.s9 + 0)
1ac0 : 4c 71 19 JMP $1971 ; (board_check.s6 + 0)
.s17:
1ac3 : a6 5c __ LDX T8 + 0 
1ac5 : bd d8 33 LDA $33d8,x ; (board.ffree[0] + 0)
1ac8 : fe d8 33 INC $33d8,x ; (board.ffree[0] + 0)
1acb : 0a __ __ ASL
1acc : 0a __ __ ASL
1acd : 0a __ __ ASL
1ace : 05 5c __ ORA T8 + 0 
1ad0 : aa __ __ TAX
1ad1 : a9 00 __ LDA #$00
1ad3 : 9d a8 33 STA $33a8,x ; (board.fcols[0] + 0)
1ad6 : 4c 65 19 JMP $1965 ; (board_check.s15 + 0)
--------------------------------------------------------------------
board_draw: ; board_draw(struct CharWin*)->void
;  62, "/home/honza/projects/c64/projects/oscar64/samples/games/connectfour.c"
.s4:
1ad9 : a9 00 __ LDA #$00
1adb : 85 48 __ STA T6 + 0 
1add : 85 45 __ STA T1 + 0 
1adf : a5 13 __ LDA P6 ; (cwin + 0)
1ae1 : 85 0d __ STA P0 
1ae3 : a5 14 __ LDA P7 ; (cwin + 1)
1ae5 : 85 0e __ STA P1 
.l5:
1ae7 : a5 45 __ LDA T1 + 0 
1ae9 : 0a __ __ ASL
1aea : 0a __ __ ASL
1aeb : 0a __ __ ASL
1aec : 85 46 __ STA T3 + 0 
1aee : a9 00 __ LDA #$00
1af0 : 85 49 __ STA T7 + 0 
1af2 : 85 47 __ STA T4 + 0 
1af4 : a9 52 __ LDA #$52
1af6 : 85 11 __ STA P4 
1af8 : 18 __ __ CLC
.l6:
1af9 : a5 47 __ LDA T4 + 0 
1afb : 65 46 __ ADC T3 + 0 
1afd : aa __ __ TAX
1afe : bd a8 33 LDA $33a8,x ; (board.fcols[0] + 0)
1b01 : c9 01 __ CMP #$01
1b03 : d0 04 __ BNE $1b09 ; (board_draw.s7 + 0)
.s12:
1b05 : a9 0a __ LDA #$0a
1b07 : d0 0a __ BNE $1b13 ; (board_draw.s9 + 0)
.s7:
1b09 : c9 05 __ CMP #$05
1b0b : d0 04 __ BNE $1b11 ; (board_draw.s8 + 0)
.s11:
1b0d : a9 0f __ LDA #$0f
1b0f : d0 02 __ BNE $1b13 ; (board_draw.s9 + 0)
.s8:
1b11 : a9 08 __ LDA #$08
.s9:
1b13 : 85 12 __ STA P5 
1b15 : a5 49 __ LDA T7 + 0 
1b17 : 85 0f __ STA P2 
1b19 : a5 48 __ LDA T6 + 0 
1b1b : 85 10 __ STA P3 
1b1d : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
1b20 : e6 47 __ INC T4 + 0 
1b22 : e6 49 __ INC T7 + 0 
1b24 : a5 49 __ LDA T7 + 0 
1b26 : c9 07 __ CMP #$07
1b28 : 90 cf __ BCC $1af9 ; (board_draw.l6 + 0)
.s10:
1b2a : e6 11 __ INC P4 
1b2c : a9 07 __ LDA #$07
1b2e : 85 0f __ STA P2 
1b30 : a9 08 __ LDA #$08
1b32 : 85 12 __ STA P5 
1b34 : 20 cc 0e JSR $0ecc ; (cwin_putat_char_raw.s4 + 0)
1b37 : e6 45 __ INC T1 + 0 
1b39 : e6 48 __ INC T6 + 0 
1b3b : a5 48 __ LDA T6 + 0 
1b3d : c9 06 __ CMP #$06
1b3f : 90 a6 __ BCC $1ae7 ; (board_draw.l5 + 0)
.s3:
1b41 : 60 __ __ RTS
--------------------------------------------------------------------
itoa: ; itoa(i16,u8*,u16)->void
;  20, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
1b42 : 24 0e __ BIT P1 ; (n + 1)
1b44 : 30 06 __ BMI $1b4c ; (itoa.s5 + 0)
.s6:
1b46 : a9 00 __ LDA #$00
1b48 : 85 43 __ STA T6 + 0 
1b4a : f0 11 __ BEQ $1b5d ; (itoa.s7 + 0)
.s5:
1b4c : a9 ff __ LDA #$ff
1b4e : 85 43 __ STA T6 + 0 
1b50 : 38 __ __ SEC
1b51 : a9 00 __ LDA #$00
1b53 : e5 0d __ SBC P0 ; (n + 0)
1b55 : 85 0d __ STA P0 ; (n + 0)
1b57 : a9 00 __ LDA #$00
1b59 : e5 0e __ SBC P1 ; (n + 1)
1b5b : 85 0e __ STA P1 ; (n + 1)
.s7:
1b5d : a5 0d __ LDA P0 ; (n + 0)
1b5f : 85 1b __ STA ACCU + 0 
1b61 : a9 00 __ LDA #$00
1b63 : 85 44 __ STA T7 + 0 
1b65 : a5 0e __ LDA P1 ; (n + 1)
1b67 : 85 1c __ STA ACCU + 1 
.l8:
1b69 : a5 11 __ LDA P4 ; (radix + 0)
1b6b : 85 03 __ STA WORK + 0 
1b6d : a5 12 __ LDA P5 ; (radix + 1)
1b6f : 85 04 __ STA WORK + 1 
1b71 : 20 00 1c JSR $1c00 ; (divmod + 0)
1b74 : a5 05 __ LDA WORK + 2 
1b76 : c9 0a __ CMP #$0a
1b78 : b0 04 __ BCS $1b7e ; (itoa.s9 + 0)
.s17:
1b7a : a9 30 __ LDA #$30
1b7c : 90 02 __ BCC $1b80 ; (itoa.s10 + 0)
.s9:
1b7e : a9 37 __ LDA #$37
.s10:
1b80 : 18 __ __ CLC
1b81 : 65 05 __ ADC WORK + 2 
1b83 : a4 44 __ LDY T7 + 0 
1b85 : 91 0f __ STA (P2),y ; (s + 0)
1b87 : e6 44 __ INC T7 + 0 
1b89 : a5 1b __ LDA ACCU + 0 
1b8b : 05 1c __ ORA ACCU + 1 
1b8d : d0 da __ BNE $1b69 ; (itoa.l8 + 0)
.s11:
1b8f : 24 43 __ BIT T6 + 0 
1b91 : 10 08 __ BPL $1b9b ; (itoa.s12 + 0)
.s16:
1b93 : a9 2d __ LDA #$2d
1b95 : a4 44 __ LDY T7 + 0 
1b97 : 91 0f __ STA (P2),y ; (s + 0)
1b99 : e6 44 __ INC T7 + 0 
.s12:
1b9b : a9 00 __ LDA #$00
1b9d : a4 44 __ LDY T7 + 0 
1b9f : 91 0f __ STA (P2),y ; (s + 0)
1ba1 : 85 1b __ STA ACCU + 0 
1ba3 : 4c bc 1b JMP $1bbc ; (itoa.l13 + 0)
.s14:
1ba6 : a4 1b __ LDY ACCU + 0 
1ba8 : b1 0f __ LDA (P2),y ; (s + 0)
1baa : c6 44 __ DEC T7 + 0 
1bac : aa __ __ TAX
1bad : a4 44 __ LDY T7 + 0 
1baf : b1 0f __ LDA (P2),y ; (s + 0)
1bb1 : a4 1b __ LDY ACCU + 0 
1bb3 : 91 0f __ STA (P2),y ; (s + 0)
1bb5 : 8a __ __ TXA
1bb6 : a4 44 __ LDY T7 + 0 
1bb8 : 91 0f __ STA (P2),y ; (s + 0)
1bba : e6 1b __ INC ACCU + 0 
.l13:
1bbc : 18 __ __ CLC
1bbd : a5 1b __ LDA ACCU + 0 
1bbf : 69 01 __ ADC #$01
1bc1 : b0 04 __ BCS $1bc7 ; (itoa.s3 + 0)
.s15:
1bc3 : c5 44 __ CMP T7 + 0 
1bc5 : 90 df __ BCC $1ba6 ; (itoa.s14 + 0)
.s3:
1bc7 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
1bc8 : 4a __ __ LSR
1bc9 : f0 2e __ BEQ $1bf9 ; (mul16by8 + 49)
1bcb : a2 00 __ LDX #$00
1bcd : a0 00 __ LDY #$00
1bcf : 90 13 __ BCC $1be4 ; (mul16by8 + 28)
1bd1 : a4 1b __ LDY ACCU + 0 
1bd3 : a6 1c __ LDX ACCU + 1 
1bd5 : b0 0d __ BCS $1be4 ; (mul16by8 + 28)
1bd7 : 85 02 __ STA $02 
1bd9 : 18 __ __ CLC
1bda : 98 __ __ TYA
1bdb : 65 1b __ ADC ACCU + 0 
1bdd : a8 __ __ TAY
1bde : 8a __ __ TXA
1bdf : 65 1c __ ADC ACCU + 1 
1be1 : aa __ __ TAX
1be2 : a5 02 __ LDA $02 
1be4 : 06 1b __ ASL ACCU + 0 
1be6 : 26 1c __ ROL ACCU + 1 
1be8 : 4a __ __ LSR
1be9 : 90 f9 __ BCC $1be4 ; (mul16by8 + 28)
1beb : d0 ea __ BNE $1bd7 ; (mul16by8 + 15)
1bed : 18 __ __ CLC
1bee : 98 __ __ TYA
1bef : 65 1b __ ADC ACCU + 0 
1bf1 : 85 1b __ STA ACCU + 0 
1bf3 : 8a __ __ TXA
1bf4 : 65 1c __ ADC ACCU + 1 
1bf6 : 85 1c __ STA ACCU + 1 
1bf8 : 60 __ __ RTS
1bf9 : b0 04 __ BCS $1bff ; (mul16by8 + 55)
1bfb : 85 1b __ STA ACCU + 0 
1bfd : 85 1c __ STA ACCU + 1 
1bff : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1c00 : a5 1c __ LDA ACCU + 1 
1c02 : d0 31 __ BNE $1c35 ; (divmod + 53)
1c04 : a5 04 __ LDA WORK + 1 
1c06 : d0 1e __ BNE $1c26 ; (divmod + 38)
1c08 : 85 06 __ STA WORK + 3 
1c0a : a2 04 __ LDX #$04
1c0c : 06 1b __ ASL ACCU + 0 
1c0e : 2a __ __ ROL
1c0f : c5 03 __ CMP WORK + 0 
1c11 : 90 02 __ BCC $1c15 ; (divmod + 21)
1c13 : e5 03 __ SBC WORK + 0 
1c15 : 26 1b __ ROL ACCU + 0 
1c17 : 2a __ __ ROL
1c18 : c5 03 __ CMP WORK + 0 
1c1a : 90 02 __ BCC $1c1e ; (divmod + 30)
1c1c : e5 03 __ SBC WORK + 0 
1c1e : 26 1b __ ROL ACCU + 0 
1c20 : ca __ __ DEX
1c21 : d0 eb __ BNE $1c0e ; (divmod + 14)
1c23 : 85 05 __ STA WORK + 2 
1c25 : 60 __ __ RTS
1c26 : a5 1b __ LDA ACCU + 0 
1c28 : 85 05 __ STA WORK + 2 
1c2a : a5 1c __ LDA ACCU + 1 
1c2c : 85 06 __ STA WORK + 3 
1c2e : a9 00 __ LDA #$00
1c30 : 85 1b __ STA ACCU + 0 
1c32 : 85 1c __ STA ACCU + 1 
1c34 : 60 __ __ RTS
1c35 : a5 04 __ LDA WORK + 1 
1c37 : d0 1f __ BNE $1c58 ; (divmod + 88)
1c39 : a5 03 __ LDA WORK + 0 
1c3b : 30 1b __ BMI $1c58 ; (divmod + 88)
1c3d : a9 00 __ LDA #$00
1c3f : 85 06 __ STA WORK + 3 
1c41 : a2 10 __ LDX #$10
1c43 : 06 1b __ ASL ACCU + 0 
1c45 : 26 1c __ ROL ACCU + 1 
1c47 : 2a __ __ ROL
1c48 : c5 03 __ CMP WORK + 0 
1c4a : 90 02 __ BCC $1c4e ; (divmod + 78)
1c4c : e5 03 __ SBC WORK + 0 
1c4e : 26 1b __ ROL ACCU + 0 
1c50 : 26 1c __ ROL ACCU + 1 
1c52 : ca __ __ DEX
1c53 : d0 f2 __ BNE $1c47 ; (divmod + 71)
1c55 : 85 05 __ STA WORK + 2 
1c57 : 60 __ __ RTS
1c58 : a9 00 __ LDA #$00
1c5a : 85 05 __ STA WORK + 2 
1c5c : 85 06 __ STA WORK + 3 
1c5e : 84 02 __ STY $02 
1c60 : a0 10 __ LDY #$10
1c62 : 18 __ __ CLC
1c63 : 26 1b __ ROL ACCU + 0 
1c65 : 26 1c __ ROL ACCU + 1 
1c67 : 26 05 __ ROL WORK + 2 
1c69 : 26 06 __ ROL WORK + 3 
1c6b : 38 __ __ SEC
1c6c : a5 05 __ LDA WORK + 2 
1c6e : e5 03 __ SBC WORK + 0 
1c70 : aa __ __ TAX
1c71 : a5 06 __ LDA WORK + 3 
1c73 : e5 04 __ SBC WORK + 1 
1c75 : 90 04 __ BCC $1c7b ; (divmod + 123)
1c77 : 86 05 __ STX WORK + 2 
1c79 : 85 06 __ STA WORK + 3 
1c7b : 88 __ __ DEY
1c7c : d0 e5 __ BNE $1c63 ; (divmod + 99)
1c7e : 26 1b __ ROL ACCU + 0 
1c80 : 26 1c __ ROL ACCU + 1 
1c82 : a4 02 __ LDY $02 
1c84 : 60 __ __ RTS
--------------------------------------------------------------------
__multab25L:
1c85 : __ __ __ BYT 00 19 32 4b 64                                  : ..2Kd
--------------------------------------------------------------------
__multab343L:
1c8a : __ __ __ BYT 00 57 ae 05                                     : .W..
--------------------------------------------------------------------
__multab343H:
1c8e : __ __ __ BYT 00 01 02 04                                     : ....
--------------------------------------------------------------------
__multab7L:
1c92 : __ __ __ BYT 00 07 0e 15                                     : ....
--------------------------------------------------------------------
__multab49L:
1c96 : __ __ __ BYT 00 31 62 93                                     : .1b.
--------------------------------------------------------------------
spentry:
1c9a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
charset:
1c9b : __ __ __ BYT 3c 66 6e 6e 60 62 3c 00 18 3c 66 7e 66 66 66 00 : <fnn`b<..<f~fff.
1cab : __ __ __ BYT 7c 66 66 7c 66 66 7c 00 3c 66 60 60 60 66 3c 00 : |ff|ff|.<f```f<.
1cbb : __ __ __ BYT 78 6c 66 66 66 6c 78 00 7e 60 60 78 60 60 7e 00 : xlffflx.~``x``~.
1ccb : __ __ __ BYT 7e 60 60 78 60 60 60 00 3c 66 60 6e 66 66 3c 00 : ~``x```.<f`nff<.
1cdb : __ __ __ BYT 66 66 66 7e 66 66 66 00 3c 18 18 18 18 18 3c 00 : fff~fff.<.....<.
1ceb : __ __ __ BYT 1e 0c 0c 0c 0c 6c 38 00 66 6c 78 70 78 6c 66 00 : .....l8.flxpxlf.
1cfb : __ __ __ BYT 60 60 60 60 60 60 7e 00 63 77 7f 6b 63 63 63 00 : ``````~.cw.kccc.
1d0b : __ __ __ BYT 66 76 7e 7e 6e 66 66 00 3c 66 66 66 66 66 3c 00 : fv~~nff.<fffff<.
1d1b : __ __ __ BYT 7c 66 66 7c 60 60 60 00 3c 66 66 66 66 3c 0e 00 : |ff|```.<ffff<..
1d2b : __ __ __ BYT 7c 66 66 7c 78 6c 66 00 3c 66 60 3c 06 66 3c 00 : |ff|xlf.<f`<.f<.
1d3b : __ __ __ BYT 7e 18 18 18 18 18 18 00 66 66 66 66 66 66 3c 00 : ~.......ffffff<.
1d4b : __ __ __ BYT 66 66 66 66 66 3c 18 00 63 63 63 6b 7f 77 63 00 : fffff<..ccck.wc.
1d5b : __ __ __ BYT 66 66 3c 18 3c 66 66 00 66 66 66 3c 18 18 18 00 : ff<.<ff.fff<....
1d6b : __ __ __ BYT 7e 06 0c 18 30 60 7e 00 3c 30 30 30 30 30 3c 00 : ~...0`~.<00000<.
1d7b : __ __ __ BYT 0c 12 30 7c 30 62 fc 00 3c 0c 0c 0c 0c 0c 3c 00 : ..0|0b..<.....<.
1d8b : __ __ __ BYT 00 18 3c 7e 18 18 18 18 00 10 30 7f 7f 30 10 00 : ..<~......0..0..
1d9b : __ __ __ BYT 00 00 00 00 00 00 00 00 18 18 18 18 00 00 18 00 : ................
1dab : __ __ __ BYT 66 66 66 00 00 00 00 00 66 66 ff 66 ff 66 66 00 : fff.....ff.f.ff.
1dbb : __ __ __ BYT 18 3e 60 3c 06 7c 18 00 62 66 0c 18 30 66 46 00 : .>`<.|..bf..0fF.
1dcb : __ __ __ BYT 3c 66 3c 38 67 66 3f 00 06 0c 18 00 00 00 00 00 : <f<8gf?.........
1ddb : __ __ __ BYT 0c 18 30 30 30 18 0c 00 30 18 0c 0c 0c 18 30 00 : ..000...0.....0.
1deb : __ __ __ BYT 00 66 3c ff 3c 66 00 00 00 18 18 7e 18 18 00 00 : .f<.<f.....~....
1dfb : __ __ __ BYT 00 00 00 00 00 18 18 30 00 00 00 7e 00 00 00 00 : .......0...~....
1e0b : __ __ __ BYT 00 00 00 00 00 18 18 00 00 03 06 0c 18 30 60 00 : .............0`.
1e1b : __ __ __ BYT 3c 66 6e 76 66 66 3c 00 18 18 38 18 18 18 7e 00 : <fnvff<...8...~.
1e2b : __ __ __ BYT 3c 66 06 0c 30 60 7e 00 3c 66 06 1c 06 66 3c 00 : <f..0`~.<f...f<.
1e3b : __ __ __ BYT 06 0e 1e 66 7f 06 06 00 7e 60 7c 06 06 66 3c 00 : ...f....~`|..f<.
1e4b : __ __ __ BYT 3c 66 60 7c 66 66 3c 00 7e 66 0c 18 18 18 18 00 : <f`|ff<.~f......
1e5b : __ __ __ BYT 3c 66 66 3c 66 66 3c 00 3c 66 66 3e 06 66 3c 00 : <ff<ff<.<ff>.f<.
1e6b : __ __ __ BYT 00 00 18 00 00 18 00 00 00 00 18 00 00 18 18 30 : ...............0
1e7b : __ __ __ BYT 0e 18 30 60 30 18 0e 00 00 00 7e 00 7e 00 00 00 : ..0`0.....~.~...
1e8b : __ __ __ BYT 70 18 0c 06 0c 18 70 00 3c 66 06 0c 18 00 18 00 : p.....p.<f......
1e9b : __ __ __ BYT ff ff fc f0 f0 f0 c0 c0 ff ff 00 00 00 00 00 00 : ................
1eab : __ __ __ BYT ff ff 3f 0f 0f 0f 02 03 c0 c0 c0 c0 c0 c0 c0 c0 : ..?.............
1ebb : __ __ __ BYT 00 00 00 00 00 00 00 00 02 03 02 03 02 03 02 03 : ................
1ecb : __ __ __ BYT c0 c0 f0 f0 f0 fc ff ff 00 00 00 00 00 00 ba ff : ................
1edb : __ __ __ BYT 02 03 0b 0b 0f 2f bf ff 55 55 54 53 53 5f 4f 4f : ...../..UUTSS_OO
1eeb : __ __ __ BYT 55 55 00 ff ff ff ff ff 55 55 15 c5 f5 f5 f2 fd : UU......UU......
1efb : __ __ __ BYT 4f 7f 4f 7f 4f 7f 4f 7f ff ff ff ff ff ff ff ff : O.O.O.O.........
1f0b : __ __ __ BYT fe fd fe fd fe fd fe fd 7f 4f 5f 5f 53 54 55 55 : .........O__STUU
1f1b : __ __ __ BYT ff ff ff ff ff ff 9a 55 fe fd f9 f9 f5 e5 95 55 : .......U.......U
1f2b : __ __ __ BYT 55 5d 7f 7f 7f 7f 5d 55 40 40 40 40 40 40 40 40 : U]....]U@@@@@@@@
1f3b : __ __ __ BYT 00 00 00 02 0b 0b 2f 2f 00 00 aa ff ff ff ff ff : ......//........
1f4b : __ __ __ BYT 00 00 00 80 e0 f0 fc fc 2f 3f 2f 3f 2f 3f 2f 3f : ......../?/?/?/?
1f5b : __ __ __ BYT f0 fc f0 fc f0 fc f0 fc 3f 3f ff ff ff ff ff 3c : ........??.....<
1f6b : __ __ __ BYT ff ff ff ff ff ff 00 00 fc ff ff ff ff ff ff 3c : ...............<
1f7b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f8b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f9b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fbb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fcb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fdb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1feb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ffb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
200b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
201b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
202b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
203b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
204b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
205b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
206b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
207b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
208b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
209b : __ __ __ BYT c3 99 91 91 9f 99 c3 ff e7 c3 99 81 99 99 99 ff : ................
20ab : __ __ __ BYT 83 99 99 83 99 99 83 ff c3 99 9f 9f 9f 99 c3 ff : ................
20bb : __ __ __ BYT 87 93 99 99 99 93 87 ff 81 9f 9f 87 9f 9f 81 ff : ................
20cb : __ __ __ BYT 81 9f 9f 87 9f 9f 9f ff c3 99 9f 91 99 99 c3 ff : ................
20db : __ __ __ BYT 99 99 99 81 99 99 99 ff c3 e7 e7 e7 e7 e7 c3 ff : ................
20eb : __ __ __ BYT e1 f3 f3 f3 f3 93 c7 ff 99 93 87 8f 87 93 99 ff : ................
20fb : __ __ __ BYT 9f 9f 9f 9f 9f 9f 81 ff 9c 88 80 94 9c 9c 9c ff : ................
210b : __ __ __ BYT 99 89 81 81 91 99 99 ff c3 99 99 99 99 99 c3 ff : ................
211b : __ __ __ BYT 83 99 99 83 9f 9f 9f ff c3 99 99 99 99 c3 f1 ff : ................
212b : __ __ __ BYT 83 99 99 83 87 93 99 ff c3 99 9f c3 f9 99 c3 ff : ................
213b : __ __ __ BYT 81 e7 e7 e7 e7 e7 e7 ff 99 99 99 99 99 99 c3 ff : ................
214b : __ __ __ BYT 99 99 99 99 99 c3 e7 ff 9c 9c 9c 94 80 88 9c ff : ................
215b : __ __ __ BYT 99 99 c3 e7 c3 99 99 ff 99 99 99 c3 e7 e7 e7 ff : ................
216b : __ __ __ BYT 81 f9 f3 e7 cf 9f 81 ff c3 cf cf cf cf cf c3 ff : ................
217b : __ __ __ BYT f3 ed cf 83 cf 9d 03 ff c3 f3 f3 f3 f3 f3 c3 ff : ................
218b : __ __ __ BYT ff e7 c3 81 e7 e7 e7 e7 ff ef cf 80 80 cf ef ff : ................
219b : __ __ __ BYT ff ff ff ff ff ff ff ff e7 e7 e7 e7 ff ff e7 ff : ................
21ab : __ __ __ BYT 99 99 99 ff ff ff ff ff 99 99 00 99 00 99 99 ff : ................
21bb : __ __ __ BYT e7 c1 9f c3 f9 83 e7 ff 9d 99 f3 e7 cf 99 b9 ff : ................
21cb : __ __ __ BYT c3 99 c3 c7 98 99 c0 ff f9 f3 e7 ff ff ff ff ff : ................
21db : __ __ __ BYT f3 e7 cf cf cf e7 f3 ff cf e7 f3 f3 f3 e7 cf ff : ................
21eb : __ __ __ BYT ff 99 c3 00 c3 99 ff ff ff e7 e7 81 e7 e7 ff ff : ................
21fb : __ __ __ BYT ff ff ff ff ff e7 e7 cf ff ff ff 81 ff ff ff ff : ................
220b : __ __ __ BYT ff ff ff ff ff e7 e7 ff ff fc f9 f3 e7 cf 9f ff : ................
221b : __ __ __ BYT c3 99 91 89 99 99 c3 ff e7 e7 c7 e7 e7 e7 81 ff : ................
222b : __ __ __ BYT c3 99 f9 f3 cf 9f 81 ff c3 99 f9 e3 f9 99 c3 ff : ................
223b : __ __ __ BYT f9 f1 e1 99 80 f9 f9 ff 81 9f 83 f9 f9 99 c3 ff : ................
224b : __ __ __ BYT c3 99 9f 83 99 99 c3 ff 81 99 f3 e7 e7 e7 e7 ff : ................
225b : __ __ __ BYT c3 99 99 c3 99 99 c3 ff c3 99 99 c1 f9 99 c3 ff : ................
226b : __ __ __ BYT ff ff e7 ff ff e7 ff ff ff ff e7 ff ff e7 e7 cf : ................
227b : __ __ __ BYT f1 e7 cf 9f cf e7 f1 ff ff ff 81 ff 81 ff ff ff : ................
228b : __ __ __ BYT 8f e7 f3 f9 f3 e7 8f ff c3 99 f9 f3 e7 ff e7 ff : ................
229b : __ __ __ BYT ff ff ff 00 00 ff ff ff f7 e3 c1 80 80 e3 c1 ff : ................
22ab : __ __ __ BYT e7 e7 e7 e7 e7 e7 e7 e7 ff ff ff 00 00 ff ff ff : ................
22bb : __ __ __ BYT ff ff 00 00 ff ff ff ff ff 00 00 ff ff ff ff ff : ................
22cb : __ __ __ BYT ff ff ff ff 00 00 ff ff cf cf cf cf cf cf cf cf : ................
22db : __ __ __ BYT f3 f3 f3 f3 f3 f3 f3 f3 ff ff ff 1f 0f c7 e7 e7 : ................
22eb : __ __ __ BYT e7 e7 e3 f0 f8 ff ff ff e7 e7 c7 0f 1f ff ff ff : ................
22fb : __ __ __ BYT 3f 3f 3f 3f 3f 3f 00 00 3f 1f 8f c7 e3 f1 f8 fc : ??????..?.......
230b : __ __ __ BYT fc f8 f1 e3 c7 8f 1f 3f 00 00 3f 3f 3f 3f 3f 3f : .......?..??????
231b : __ __ __ BYT 00 00 fc fc fc fc fc fc ff c3 81 81 81 81 c3 ff : ................
232b : __ __ __ BYT ff ff ff ff ff 00 00 ff c9 80 80 80 c1 e3 f7 ff : ................
233b : __ __ __ BYT 9f 9f 9f 9f 9f 9f 9f 9f ff ff ff f8 f0 e3 e7 e7 : ................
234b : __ __ __ BYT 3c 18 81 c3 c3 81 18 3c ff c3 81 99 99 81 c3 ff : <......<........
235b : __ __ __ BYT e7 e7 99 99 e7 e7 c3 ff f9 f9 f9 f9 f9 f9 f9 f9 : ................
236b : __ __ __ BYT f7 e3 c1 80 c1 e3 f7 ff e7 e7 e7 00 00 e7 e7 e7 : ................
237b : __ __ __ BYT 3f 3f cf cf 3f 3f cf cf e7 e7 e7 e7 e7 e7 e7 e7 : ??..??..........
238b : __ __ __ BYT ff ff fc c1 89 c9 c9 ff 00 80 c0 e0 f0 f8 fc fe : ................
239b : __ __ __ BYT ff ff ff ff ff ff ff ff 0f 0f 0f 0f 0f 0f 0f 0f : ................
23ab : __ __ __ BYT ff ff ff ff 00 00 00 00 00 ff ff ff ff ff ff ff : ................
23bb : __ __ __ BYT ff ff ff ff ff ff ff 00 3f 3f 3f 3f 3f 3f 3f 3f : ........????????
23cb : __ __ __ BYT 33 33 cc cc 33 33 cc cc fc fc fc fc fc fc fc fc : 33..33..........
23db : __ __ __ BYT ff ff ff ff 33 33 cc cc 00 01 03 07 0f 1f 3f 7f : ....33........?.
23eb : __ __ __ BYT fc fc fc fc fc fc fc fc e7 e7 e7 e0 e0 e7 e7 e7 : ................
23fb : __ __ __ BYT ff ff ff ff f0 f0 f0 f0 e7 e7 e7 e0 e0 ff ff ff : ................
240b : __ __ __ BYT ff ff ff 07 07 e7 e7 e7 ff ff ff ff ff ff 00 00 : ................
241b : __ __ __ BYT ff ff ff e0 e0 e7 e7 e7 e7 e7 e7 00 00 ff ff ff : ................
242b : __ __ __ BYT ff ff ff 00 00 e7 e7 e7 e7 e7 e7 07 07 e7 e7 e7 : ................
243b : __ __ __ BYT 3f 3f 3f 3f 3f 3f 3f 3f 1f 1f 1f 1f 1f 1f 1f 1f : ????????........
244b : __ __ __ BYT f8 f8 f8 f8 f8 f8 f8 f8 00 00 ff ff ff ff ff ff : ................
245b : __ __ __ BYT 00 00 00 ff ff ff ff ff ff ff ff ff ff 00 00 00 : ................
246b : __ __ __ BYT fc fc fc fc fc fc 00 00 ff ff ff ff 0f 0f 0f 0f : ................
247b : __ __ __ BYT f0 f0 f0 f0 ff ff ff ff e7 e7 e7 07 07 ff ff ff : ................
248b : __ __ __ BYT 0f 0f 0f 0f ff ff ff ff 0f 0f 0f 0f f0 f0 f0 f0 : ................
--------------------------------------------------------------------
spriteset:
249b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24ab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24bb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24cb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
24db : __ __ __ BYT 00 fa 00 03 aa 80 0e aa a0 0e aa 90 3a aa a8 3a : ............:..:
24eb : __ __ __ BYT aa a4 ea aa aa aa aa a9 ea aa aa aa aa a9 ea aa : ................
24fb : __ __ __ BYT aa aa aa a9 ea aa a9 aa aa a9 aa aa a9 2a aa a4 : .............*..
250b : __ __ __ BYT 2a aa a4 0a aa 90 06 aa 90 01 aa 40 00 55 00 82 : *..........@.U..
251b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
252b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
253b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
254b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
255b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
256b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
257b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
258b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
259b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25ab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25bb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25cb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
25db : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25eb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25fb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
260b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
261b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
262b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
263b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
264b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
265b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
266b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
267b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
268b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
269b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26ab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26bb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26cb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
26db : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26eb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26fb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
270b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
271b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
272b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
273b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
274b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
275b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
276b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
277b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
278b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
279b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27ab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27bb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27cb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
27db : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27eb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27fb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
280b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
281b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
282b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
283b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
284b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
285b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
286b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
287b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
288b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
289b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28ab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28bb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28cb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28db : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28eb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
28fb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
290b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
291b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
292b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
293b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
294b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
295b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
296b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
297b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
298b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
299b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29ab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29bb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29cb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29db : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29eb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
29fb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a0b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a1b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a2b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a3b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a4b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a5b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a6b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a7b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a8b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2a9b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2aab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2abb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2acb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2adb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2aeb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2afb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b0b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b1b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b2b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b3b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b4b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b5b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b6b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b7b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b8b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2b9b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bab : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bbb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bcb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bdb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2beb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2bfb : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c0b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c1b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c2b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c3b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c4b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c5b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c6b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c7b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2c8b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
mul40:
2c9b : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
2cab : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
2cbb : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
2ccb : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
score:
2ccd : __ __ __ BYT 00 00 01 00 08 00 80 00 10 27                   : .........'
--------------------------------------------------------------------
p2smap:
2cd7 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
giocharmap:
2cdf : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
open2:
2ce0 : __ __ __ BYT 04 03 03 03 04 03 03 03 05 03 03 04 03 03 03 03 : ................
2cf0 : __ __ __ BYT 02 03 02 02 02 04 02 04 03 02 04 02             : ............
--------------------------------------------------------------------
vspriteScreen:
2cfc : __ __ __ BSS	2
--------------------------------------------------------------------
joyy:
2cfe : __ __ __ BSS	2
--------------------------------------------------------------------
open3:
2d00 : __ __ __ BYT 00 05 02 02 05 03 02 05 04 02 04 03 03 05 02 02 : ................
2d10 : __ __ __ BYT 03 02 03 02 02 04 05 02 04 04 03 02 03 03 03 03 : ................
2d20 : __ __ __ BYT 03 03 04 01 03 02 05 03 02 01 02 05 02 02 04 01 : ................
2d30 : __ __ __ BYT 04 05 04 02 04 03 03 05 04 01 03 04 04 04 03 02 : ................
2d40 : __ __ __ BYT 01 03 02 03 02 03 05 05 01 05 04 03 03 03 04 03 : ................
2d50 : __ __ __ BYT 03 05 03 03 03 05 02 03 04 01 03 05 04 03 01 04 : ................
2d60 : __ __ __ BYT 03 05 02 02 03 02 03 02 02 02 01 03 02 03 02 03 : ................
2d70 : __ __ __ BYT 03 01 03 02 02 03 03 02 01 03 02 02 02 02 03 03 : ................
2d80 : __ __ __ BYT 03 02 01 03 03 03 03 01 03 03 02 03 02 03 03 03 : ................
2d90 : __ __ __ BYT 03 03 03 03 02 01 02 03 04 03 02 04 03 02 02 02 : ................
2da0 : __ __ __ BYT 02 01 00 02 04 03 04 04 04 04 01 02 05 02 02 02 : ................
2db0 : __ __ __ BYT 02 03 02 04 06 05 04 04 04 04 03 02 04 03 02 03 : ................
2dc0 : __ __ __ BYT 04 05 04 03                                     : ....
--------------------------------------------------------------------
open4:
2dc4 : __ __ __ BYT 02 05 02 02 05 03 02 02 02 06 02 02 02 02 00 04 : ................
2dd4 : __ __ __ BYT 04 03 02 03 03 05 05 05 05 05 01 01 02 02 06 02 : ................
2de4 : __ __ __ BYT 02 02 02 00 04 04 04 03 05 04 01 05 01 01 01 01 : ................
2df4 : __ __ __ BYT 01 00 04 02 04 03 04 05 05 01 04 05 05 03 02 03 : ................
2e04 : __ __ __ BYT 03 01 01 01 01 03 05 05 04 05 05 04 04 03 03 03 : ................
2e14 : __ __ __ BYT 01 03 03 03 03 03 03 01 03 03 03 05 04 02 05 03 : ................
2e24 : __ __ __ BYT 01 04 00 03 06 02 03 03 03 03 03 01 01 01 01 03 : ................
2e34 : __ __ __ BYT 03 03 03 02 03 03 03 02 01 06 02 04 05 02 03 03 : ................
2e44 : __ __ __ BYT 03 02 03 03 03 03 01 05 05 03 03 03 03 03 00 02 : ................
2e54 : __ __ __ BYT 03 03 03 00 05 02 02 05 01 02 04 04 02 04 05 04 : ................
2e64 : __ __ __ BYT 02 02 02 03 02 02 02 02 02 05 05 02 02 01 02 04 : ................
2e74 : __ __ __ BYT 03 04 04 03 03 04 01 03 02 01 04 04 01 04 05 04 : ................
2e84 : __ __ __ BYT 04 04 02 04 00 03 03 04 03 03 03 03 03 03 01 03 : ................
2e94 : __ __ __ BYT 05 03 03 03 03 02 02 04 03 04 03 04 04 03 03 04 : ................
2ea4 : __ __ __ BYT 03 03 02 03 03 05 06 03 05 04 05 05 03 03 03 03 : ................
2eb4 : __ __ __ BYT 02 03 03 03 05 00 05 03 04 04 03 02 03 03 03 01 : ................
2ec4 : __ __ __ BYT 03 03 03 03 01 05 05 03 03 03 03 03 02 01 04 03 : ................
2ed4 : __ __ __ BYT 01 03 03 03 04 03 03 03 02 02 03 02 05 05 04 02 : ................
2ee4 : __ __ __ BYT 05 03 01 04 02 01 00 02 04 04 03 02 04 05 04 02 : ................
2ef4 : __ __ __ BYT 05 03 01 04 03 03 00 02 03 03 03 04 02 04 04 02 : ................
2f04 : __ __ __ BYT 02 04 03 03 03 04 06 03 03 02 05 03 01 04 02 01 : ................
2f14 : __ __ __ BYT 02 02 03 02 02 04 06 00 04 02 04 03 04 05 05 01 : ................
2f24 : __ __ __ BYT 04 05 05 03 02 03 03 01 01 01 01 03 05 05 04 05 : ................
2f34 : __ __ __ BYT 05 04 04 03 03 03 01 03 03 03 03 03 03 01 03 03 : ................
2f44 : __ __ __ BYT 03 05 04 02 05 03 01 04 02 02 06 02 02 02 02 04 : ................
2f54 : __ __ __ BYT 04 03 04 04 04 03 04 01 03 05 03 03 03 02 02 06 : ................
2f64 : __ __ __ BYT 02 02 02 02 05 01 03 03 05 04 03 02 02 06 02 02 : ................
2f74 : __ __ __ BYT 02 02 04 01 03 05 03 01 03 03 03 01 01 01 01 03 : ................
2f84 : __ __ __ BYT 06 02 03 01 04 05 04 03 03 03 02 03 03 03 01 02 : ................
2f94 : __ __ __ BYT 03 01 04 01 01 03 03 03 04 03 02 03 01 03 01 01 : ................
2fa4 : __ __ __ BYT 04 02 01 03 03 03 02 03 03 03 04 04 02 04 05 04 : ................
2fb4 : __ __ __ BYT 02 04 01 06 04 04 04 02 01 03 02 04 03 01 01 04 : ................
2fc4 : __ __ __ BYT 04 04 04 04 04 02 03 03 04 04 03 03 04 03 05 03 : ................
2fd4 : __ __ __ BYT 01 03 01 03 05 02 02 05 04 03 05 03 03 03 01 03 : ................
2fe4 : __ __ __ BYT 05 03 03 01 04 04 05 03 03 03 01 03 02 02 02 03 : ................
2ff4 : __ __ __ BYT 03 03 04 04 03 03 04 03 05 03 03 05 05 03 05 04 : ................
3004 : __ __ __ BYT 02 05 05 03 05 03 03 03 01 01 05 03 03 03 03 01 : ................
3014 : __ __ __ BYT 03 03 03 05 01 01 03 04 03 03 01 03 01 01 04 02 : ................
3024 : __ __ __ BYT 01 05 05 02 01 04 01 01 05 04 02 05 05 03 05 03 : ................
3034 : __ __ __ BYT 03 02 03 05 05 01 03 03 03 05 03 03 03 05 04 02 : ................
3044 : __ __ __ BYT 05 03 01 04 02 01 01 04 03 04 04 03 03 03 02 03 : ................
3054 : __ __ __ BYT 03 03 05 03 02 05 04 03 03 03 03 03 01 01 05 03 : ................
3064 : __ __ __ BYT 03 03 03 05 03 03 03 04 03 02 02 03 01 06 00 03 : ................
3074 : __ __ __ BYT 06 02 03 03 03 03 03 01 01 01 01 03 03 03 03 02 : ................
3084 : __ __ __ BYT 03 03 03 02 01 06 02 04 05 02 03 03 03 02 03 03 : ................
3094 : __ __ __ BYT 03 03 01 05 05 03 03 03 03 03 00 02 03 03 03 03 : ................
30a4 : __ __ __ BYT 03 01 01 01 01 03 06 02 03 01 04 05 04 03 03 03 : ................
30b4 : __ __ __ BYT 02 03 03 03 01 02 03 01 04 01 01 03 03 03 04 03 : ................
30c4 : __ __ __ BYT 02 03 01 03 01 01 04 02 01 03 03 03 02 03 03 03 : ................
30d4 : __ __ __ BYT 03 03 03 04 03 03 03 02 03 01 03 00 01 01 03 03 : ................
30e4 : __ __ __ BYT 03 03 04 03 03 03 03 03 03 02 02 03 04 04 04 02 : ................
30f4 : __ __ __ BYT 02 03 04 03 03 03 03 03 03 03 03 03 03 03 03 03 : ................
3104 : __ __ __ BYT 03 02 02 03 02 02 02 02 01 03 02 04 03 01 01 00 : ................
3114 : __ __ __ BYT 01 02 02 04 05 03 02 02 02 02 02 02 02 02 02 02 : ................
3124 : __ __ __ BYT 02 02 02 02 02 03 03 02 02 03 03 02 03 03 02 02 : ................
3134 : __ __ __ BYT 03 02 03 01 03 04 03 03 03 01 01 04 04 02 04 02 : ................
3144 : __ __ __ BYT 03 04 03 04 03 04 04 03 02 03 02 03 03 03 01 02 : ................
3154 : __ __ __ BYT 02 02 04 04 02 03 04 04 04 03 05 03 03 02 04 04 : ................
3164 : __ __ __ BYT 03 03 03 03 01 05 05 03 03 03 01 03 01 01 04 02 : ................
3174 : __ __ __ BYT 01 03 01 01 03 03 01 03 02 03 03 02 02 03 03 03 : ................
3184 : __ __ __ BYT 04 04 04 03 05 03 03 03 01 02 02 05 03 03 01 03 : ................
3194 : __ __ __ BYT 05 03 03 03 01 03 03 03 04 03 03 03 03 01 01 02 : ................
31a4 : __ __ __ BYT 01 03 00 01 03 03 04 03 03 02 03 03 02 02 03 02 : ................
31b4 : __ __ __ BYT 03 02 04 04 03 03 03 03 01 03 05 03 03 03 03 03 : ................
31c4 : __ __ __ BYT 03 02 03 03 06 00 02 01 02 03 04 04 04 01 03 03 : ................
31d4 : __ __ __ BYT 04 04 02 04 03 02 04 03 03 04 03 03 02 04 04 04 : ................
31e4 : __ __ __ BYT 03 03 02 01 04 03 03 03 04 02 01 04 05 04 02 04 : ................
31f4 : __ __ __ BYT 02 01 02 03 04 04 02 02 01 02 01 02 02 01 01 03 : ................
3204 : __ __ __ BYT 03 03 05 01 02 05 03 02 05 03 03 02 03 01 01 01 : ................
3214 : __ __ __ BYT 06 02 01 04 04 01 04 06 05 02 02 01 06 06 02 04 : ................
3224 : __ __ __ BYT 02 02 01 02 05 04 02 04 03 02 04 03 03 04 04 03 : ................
3234 : __ __ __ BYT 03 03 03 01 01 01 00 03 03 03 03 03 01 00 02 02 : ................
3244 : __ __ __ BYT 04 05 02 01 00 03 01 03 01 03 01 00 02 05 02 02 : ................
3254 : __ __ __ BYT 05 01 00 03 02 02 05 02 02 02 01 04 04 04 02 02 : ................
3264 : __ __ __ BYT 04 00 02 04 02 04 05 04 02 01 05 04 01 02 01 02 : ................
3274 : __ __ __ BYT 02 02 04 02 05 02 01 05 04 02 01 02 04 02 04 06 : ................
3284 : __ __ __ BYT 02 04 04 02 02 02 05 04 04 04 01 04 02 03 06 05 : ................
3294 : __ __ __ BYT 01 04 04 01 04 06 05 03 05 03 05 03 06 05 02 01 : ................
32a4 : __ __ __ BYT 02 04 04 06 05 03 03 03 03 03 06 05 05 05 03 03 : ................
32b4 : __ __ __ BYT 03 03 02 02 03 03 02 04 03 02 04 02 01 04 05 04 : ................
32c4 : __ __ __ BYT 02 02 04 00 00 05 04 02 01 00 02 05 02 02 05 04 : ................
32d4 : __ __ __ BYT 00 05 05 05 03 04 03 03 01 04 03 01 02 05 01 03 : ................
32e4 : __ __ __ BYT 03 03 05 05 02 02 05 04 05 04 04 02 02 03 04 05 : ................
32f4 : __ __ __ BYT 04 02 02 02 01 02 05 04 02 03 03 03 02 05 04 03 : ................
3304 : __ __ __ BYT 03 02 02 02 04 03 03 02 03 03 02 04 03 02 04 02 : ................
3314 : __ __ __ BYT 02 03 03 05 02 02 02 03 04 05 04 06             : ............
--------------------------------------------------------------------
optx:
3320 : __ __ __ BYT 03 02 04 01 05 00 06                            : .......
--------------------------------------------------------------------
bitshift:
3327 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
3337 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3347 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
3357 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
cws:
335f : __ __ __ BSS	12
--------------------------------------------------------------------
cwm:
336b : __ __ __ BSS	12
--------------------------------------------------------------------
cw:
3377 : __ __ __ BSS	12
--------------------------------------------------------------------
cwt:
3383 : __ __ __ BSS	12
--------------------------------------------------------------------
TheGame:
338f : __ __ __ BSS	25
--------------------------------------------------------------------
board:
33a8 : __ __ __ BSS	55
--------------------------------------------------------------------
joyx:
33df : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
33e1 : __ __ __ BSS	2
--------------------------------------------------------------------
buff:
33e3 : __ __ __ BSS	20
--------------------------------------------------------------------
fscore:
3400 : __ __ __ BSS	250
--------------------------------------------------------------------
frows:
34fa : __ __ __ BSS	345
