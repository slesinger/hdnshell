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
080e : 8e c3 13 STX $13c3 ; (spentry + 0)
0811 : a2 14 __ LDX #$14
0813 : a0 f8 __ LDY #$f8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 14 __ CPX #$14
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 f8 __ CPY #$f8
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 d3 __ LDA #$d3
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
; 251, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
0880 : a9 00 __ LDA #$00
0882 : 85 18 __ STA P11 
0884 : 8d 20 d0 STA $d020 
0887 : 8d 21 d0 STA $d021 
088a : a9 0c __ LDA #$0c
088c : 8d 25 d0 STA $d025 
088f : a9 07 __ LDA #$07
0891 : 8d 26 d0 STA $d026 
0894 : a2 c0 __ LDX #$c0
.l5:
0896 : bd ff 13 LDA $13ff,x 
0899 : 9d 3f 03 STA $033f,x 
089c : ca __ __ DEX
089d : d0 f7 __ BNE $0896 ; (main.l5 + 0)
.s6:
089f : a9 f8 __ LDA #$f8
08a1 : 8d ca 13 STA $13ca ; (vspriteScreen + 0)
08a4 : a9 07 __ LDA #$07
08a6 : 8d cb 13 STA $13cb ; (vspriteScreen + 1)
08a9 : 20 c0 08 JSR $08c0 ; (game_state.s4 + 0)
.l7:
08ac : 20 04 0e JSR $0e04 ; (game_loop.s4 + 0)
.l8:
08af : 2c 11 d0 BIT $d011 
08b2 : 30 fb __ BMI $08af ; (main.l8 + 0)
.s9:
08b4 : 2c 11 d0 BIT $d011 
08b7 : 30 f3 __ BMI $08ac ; (main.l7 + 0)
.l10:
08b9 : 2c 11 d0 BIT $d011 
08bc : 10 fb __ BPL $08b9 ; (main.l10 + 0)
08be : 30 ec __ BMI $08ac ; (main.l7 + 0)
--------------------------------------------------------------------
game_state: ; game_state(enum GameState)->void
; 183, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
08c0 : a5 18 __ LDA P11 ; (state + 0)
08c2 : 8d cc 13 STA $13cc ; (TheGame.state + 0)
08c5 : c9 02 __ CMP #$02
08c7 : f0 36 __ BEQ $08ff ; (game_state.s10 + 0)
.s5:
08c9 : 90 1b __ BCC $08e6 ; (game_state.s8 + 0)
.s6:
08cb : c9 03 __ CMP #$03
08cd : f0 01 __ BEQ $08d0 ; (game_state.s7 + 0)
.s3:
08cf : 60 __ __ RTS
.s7:
08d0 : a9 00 __ LDA #$00
08d2 : 85 0f __ STA P2 
08d4 : 85 10 __ STA P3 
08d6 : a9 20 __ LDA #$20
08d8 : 8d cd 13 STA $13cd ; (TheGame.count + 0)
08db : a9 ce __ LDA #$ce
08dd : 85 0d __ STA P0 
08df : a9 13 __ LDA #$13
08e1 : 85 0e __ STA P1 
08e3 : 4c 3c 0d JMP $0d3c ; (lander_show.s4 + 0)
.s8:
08e6 : aa __ __ TAX
08e7 : d0 e6 __ BNE $08cf ; (game_state.s3 + 0)
.s9:
08e9 : a9 ce __ LDA #$ce
08eb : 8d fe 9f STA $9ffe ; (sstack + 0)
08ee : a9 13 __ LDA #$13
08f0 : 8d ff 9f STA $9fff ; (sstack + 1)
08f3 : 20 87 09 JSR $0987 ; (lander_init.s4 + 0)
08f6 : 20 17 0b JSR $0b17 ; (screen_init.s4 + 0)
08f9 : a9 20 __ LDA #$20
.s11:
08fb : 8d cd 13 STA $13cd ; (TheGame.count + 0)
08fe : 60 __ __ RTS
.s10:
08ff : a9 00 __ LDA #$00
0901 : 85 0f __ STA P2 
0903 : 85 10 __ STA P3 
0905 : 85 03 __ STA WORK + 0 
0907 : 85 04 __ STA WORK + 1 
0909 : ad d2 13 LDA $13d2 ; (TheGame.lander.py + 0)
090c : 85 1b __ STA ACCU + 0 
090e : ad d3 13 LDA $13d3 ; (TheGame.lander.py + 1)
0911 : 85 1c __ STA ACCU + 1 
0913 : ad d4 13 LDA $13d4 ; (TheGame.lander.py + 2)
0916 : 85 1d __ STA ACCU + 2 
0918 : ad d5 13 LDA $13d5 ; (TheGame.lander.py + 3)
091b : 85 1e __ STA ACCU + 3 
091d : a9 e8 __ LDA #$e8
091f : 85 05 __ STA WORK + 2 
0921 : a9 c1 __ LDA #$c1
0923 : 85 06 __ STA WORK + 3 
0925 : 20 c5 10 JSR $10c5 ; (freg + 20)
0928 : 20 fc 10 JSR $10fc ; (faddsub + 6)
092b : a9 00 __ LDA #$00
092d : 85 03 __ STA WORK + 0 
092f : 85 04 __ STA WORK + 1 
0931 : 85 05 __ STA WORK + 2 
0933 : a9 3e __ LDA #$3e
0935 : 85 06 __ STA WORK + 3 
0937 : 20 c5 10 JSR $10c5 ; (freg + 20)
093a : 20 e3 11 JSR $11e3 ; (crt_fmul + 0)
093d : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
0940 : a5 1b __ LDA ACCU + 0 
0942 : 0a __ __ ASL
0943 : 85 43 __ STA T0 + 0 
0945 : 90 04 __ BCC $094b ; (game_state.s12 + 0)
.s13:
0947 : a9 ff __ LDA #$ff
0949 : b0 02 __ BCS $094d ; (game_state.s14 + 0)
.s12:
094b : a9 00 __ LDA #$00
.s14:
094d : 06 43 __ ASL T0 + 0 
094f : 2a __ __ ROL
0950 : 06 43 __ ASL T0 + 0 
0952 : 2a __ __ ROL
0953 : a8 __ __ TAY
0954 : 18 __ __ CLC
0955 : a5 43 __ LDA T0 + 0 
0957 : 69 1c __ ADC #$1c
0959 : 85 1b __ STA ACCU + 0 
095b : 90 01 __ BCC $095e ; (game_state.s16 + 0)
.s15:
095d : c8 __ __ INY
.s16:
095e : 84 1c __ STY ACCU + 1 
0960 : 20 7c 13 JSR $137c ; (sint16_to_float + 0)
0963 : a5 1b __ LDA ACCU + 0 
0965 : 8d d2 13 STA $13d2 ; (TheGame.lander.py + 0)
0968 : a5 1c __ LDA ACCU + 1 
096a : 8d d3 13 STA $13d3 ; (TheGame.lander.py + 1)
096d : a5 1d __ LDA ACCU + 2 
096f : 8d d4 13 STA $13d4 ; (TheGame.lander.py + 2)
0972 : a5 1e __ LDA ACCU + 3 
0974 : 8d d5 13 STA $13d5 ; (TheGame.lander.py + 3)
0977 : a9 ce __ LDA #$ce
0979 : 85 0d __ STA P0 
097b : a9 13 __ LDA #$13
097d : 85 0e __ STA P1 
097f : 20 3c 0d JSR $0d3c ; (lander_show.s4 + 0)
0982 : a9 10 __ LDA #$10
0984 : 4c fb 08 JMP $08fb ; (game_state.s11 + 0)
--------------------------------------------------------------------
lander_init: ; lander_init(struct Lander*)->void
; 102, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
0987 : a9 00 __ LDA #$00
0989 : 85 0d __ STA P0 
098b : 85 10 __ STA P3 
098d : 85 12 __ STA P5 
098f : 85 15 __ STA P8 
0991 : 85 16 __ STA P9 
0993 : 85 17 __ STA P10 
0995 : ae fe 9f LDX $9ffe ; (sstack + 0)
0998 : 86 43 __ STX T1 + 0 
099a : ae ff 9f LDX $9fff ; (sstack + 1)
099d : 86 44 __ STX T1 + 1 
099f : a8 __ __ TAY
09a0 : 91 43 __ STA (T1 + 0),y 
09a2 : c8 __ __ INY
09a3 : 84 0e __ STY P1 
09a5 : 91 43 __ STA (T1 + 0),y 
09a7 : a9 a0 __ LDA #$a0
09a9 : 85 0f __ STA P2 
09ab : a9 32 __ LDA #$32
09ad : 85 11 __ STA P4 
09af : a9 20 __ LDA #$20
09b1 : c8 __ __ INY
09b2 : 91 43 __ STA (T1 + 0),y 
09b4 : a9 43 __ LDA #$43
09b6 : c8 __ __ INY
09b7 : 91 43 __ STA (T1 + 0),y 
09b9 : a9 00 __ LDA #$00
09bb : c8 __ __ INY
09bc : 91 43 __ STA (T1 + 0),y 
09be : c8 __ __ INY
09bf : 91 43 __ STA (T1 + 0),y 
09c1 : a9 48 __ LDA #$48
09c3 : c8 __ __ INY
09c4 : 91 43 __ STA (T1 + 0),y 
09c6 : a9 42 __ LDA #$42
09c8 : c8 __ __ INY
09c9 : 91 43 __ STA (T1 + 0),y 
09cb : a9 00 __ LDA #$00
09cd : c8 __ __ INY
09ce : 91 43 __ STA (T1 + 0),y 
09d0 : c8 __ __ INY
09d1 : 91 43 __ STA (T1 + 0),y 
09d3 : c8 __ __ INY
09d4 : 91 43 __ STA (T1 + 0),y 
09d6 : c8 __ __ INY
09d7 : 84 14 __ STY P7 
09d9 : 91 43 __ STA (T1 + 0),y 
09db : c8 __ __ INY
09dc : 91 43 __ STA (T1 + 0),y 
09de : c8 __ __ INY
09df : 91 43 __ STA (T1 + 0),y 
09e1 : c8 __ __ INY
09e2 : 84 13 __ STY P6 
09e4 : 91 43 __ STA (T1 + 0),y 
09e6 : c8 __ __ INY
09e7 : 91 43 __ STA (T1 + 0),y 
09e9 : 20 8d 0a JSR $0a8d ; (spr_set.s4 + 0)
09ec : e6 0d __ INC P0 
09ee : e6 15 __ INC P8 
09f0 : c6 13 __ DEC P6 
09f2 : a9 0f __ LDA #$0f
09f4 : 85 14 __ STA P7 
09f6 : a0 00 __ LDY #$00
09f8 : b1 43 __ LDA (T1 + 0),y 
09fa : 85 1b __ STA ACCU + 0 
09fc : c8 __ __ INY
09fd : b1 43 __ LDA (T1 + 0),y 
09ff : 85 1c __ STA ACCU + 1 
0a01 : c8 __ __ INY
0a02 : b1 43 __ LDA (T1 + 0),y 
0a04 : 85 1d __ STA ACCU + 2 
0a06 : c8 __ __ INY
0a07 : b1 43 __ LDA (T1 + 0),y 
0a09 : 85 1e __ STA ACCU + 3 
0a0b : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
0a0e : a5 1b __ LDA ACCU + 0 
0a10 : 85 0f __ STA P2 
0a12 : a5 1c __ LDA ACCU + 1 
0a14 : 85 10 __ STA P3 
0a16 : a0 04 __ LDY #$04
0a18 : b1 43 __ LDA (T1 + 0),y 
0a1a : 85 1b __ STA ACCU + 0 
0a1c : c8 __ __ INY
0a1d : b1 43 __ LDA (T1 + 0),y 
0a1f : 85 1c __ STA ACCU + 1 
0a21 : c8 __ __ INY
0a22 : b1 43 __ LDA (T1 + 0),y 
0a24 : 85 1d __ STA ACCU + 2 
0a26 : c8 __ __ INY
0a27 : b1 43 __ LDA (T1 + 0),y 
0a29 : 85 1e __ STA ACCU + 3 
0a2b : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
0a2e : a5 1b __ LDA ACCU + 0 
0a30 : 85 11 __ STA P4 
0a32 : a5 1c __ LDA ACCU + 1 
0a34 : 85 12 __ STA P5 
0a36 : 20 8d 0a JSR $0a8d ; (spr_set.s4 + 0)
0a39 : c6 0e __ DEC P1 
0a3b : c6 15 __ DEC P8 
0a3d : a9 0f __ LDA #$0f
0a3f : 85 13 __ STA P6 
0a41 : a0 00 __ LDY #$00
0a43 : b1 43 __ LDA (T1 + 0),y 
0a45 : 85 1b __ STA ACCU + 0 
0a47 : c8 __ __ INY
0a48 : 84 14 __ STY P7 
0a4a : b1 43 __ LDA (T1 + 0),y 
0a4c : 85 1c __ STA ACCU + 1 
0a4e : c8 __ __ INY
0a4f : 84 0d __ STY P0 
0a51 : b1 43 __ LDA (T1 + 0),y 
0a53 : 85 1d __ STA ACCU + 2 
0a55 : c8 __ __ INY
0a56 : b1 43 __ LDA (T1 + 0),y 
0a58 : 85 1e __ STA ACCU + 3 
0a5a : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
0a5d : a5 1b __ LDA ACCU + 0 
0a5f : 85 0f __ STA P2 
0a61 : a5 1c __ LDA ACCU + 1 
0a63 : 85 10 __ STA P3 
0a65 : a0 04 __ LDY #$04
0a67 : b1 43 __ LDA (T1 + 0),y 
0a69 : 85 1b __ STA ACCU + 0 
0a6b : c8 __ __ INY
0a6c : b1 43 __ LDA (T1 + 0),y 
0a6e : 85 1c __ STA ACCU + 1 
0a70 : c8 __ __ INY
0a71 : b1 43 __ LDA (T1 + 0),y 
0a73 : 85 1d __ STA ACCU + 2 
0a75 : c8 __ __ INY
0a76 : b1 43 __ LDA (T1 + 0),y 
0a78 : 85 1e __ STA ACCU + 3 
0a7a : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
0a7d : 18 __ __ CLC
0a7e : a5 1b __ LDA ACCU + 0 
0a80 : 69 14 __ ADC #$14
0a82 : 85 11 __ STA P4 
0a84 : a5 1c __ LDA ACCU + 1 
0a86 : 69 00 __ ADC #$00
0a88 : 85 12 __ STA P5 
0a8a : 4c 8d 0a JMP $0a8d ; (spr_set.s4 + 0)
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0a8d : a6 0d __ LDX P0 ; (sp + 0)
0a8f : bc c8 14 LDY $14c8,x ; (bitshift[0] + 8)
0a92 : a5 0e __ LDA P1 ; (show + 0)
0a94 : d0 09 __ BNE $0a9f ; (spr_set.s19 + 0)
.s5:
0a96 : 98 __ __ TYA
0a97 : 49 ff __ EOR #$ff
0a99 : 2d 15 d0 AND $d015 
0a9c : 4c a3 0a JMP $0aa3 ; (spr_set.s6 + 0)
.s19:
0a9f : 98 __ __ TYA
0aa0 : 0d 15 d0 ORA $d015 
.s6:
0aa3 : 8d 15 d0 STA $d015 
0aa6 : a5 15 __ LDA P8 ; (multi + 0)
0aa8 : d0 09 __ BNE $0ab3 ; (spr_set.s18 + 0)
.s7:
0aaa : 98 __ __ TYA
0aab : 49 ff __ EOR #$ff
0aad : 2d 1c d0 AND $d01c 
0ab0 : 4c b7 0a JMP $0ab7 ; (spr_set.s8 + 0)
.s18:
0ab3 : 98 __ __ TYA
0ab4 : 0d 1c d0 ORA $d01c 
.s8:
0ab7 : 8d 1c d0 STA $d01c 
0aba : a5 16 __ LDA P9 ; (xexpand + 0)
0abc : d0 09 __ BNE $0ac7 ; (spr_set.s17 + 0)
.s9:
0abe : 98 __ __ TYA
0abf : 49 ff __ EOR #$ff
0ac1 : 2d 1d d0 AND $d01d 
0ac4 : 4c cb 0a JMP $0acb ; (spr_set.s10 + 0)
.s17:
0ac7 : 98 __ __ TYA
0ac8 : 0d 1d d0 ORA $d01d 
.s10:
0acb : 8d 1d d0 STA $d01d 
0ace : a5 17 __ LDA P10 ; (yexpand + 0)
0ad0 : d0 09 __ BNE $0adb ; (spr_set.s16 + 0)
.s11:
0ad2 : 98 __ __ TYA
0ad3 : 49 ff __ EOR #$ff
0ad5 : 2d 17 d0 AND $d017 
0ad8 : 4c df 0a JMP $0adf ; (spr_set.s12 + 0)
.s16:
0adb : 98 __ __ TYA
0adc : 0d 17 d0 ORA $d017 
.s12:
0adf : 8d 17 d0 STA $d017 
0ae2 : 8a __ __ TXA
0ae3 : 0a __ __ ASL
0ae4 : aa __ __ TAX
0ae5 : a5 11 __ LDA P4 ; (ypos + 0)
0ae7 : 9d 01 d0 STA $d001,x 
0aea : a5 0f __ LDA P2 ; (xpos + 0)
0aec : 9d 00 d0 STA $d000,x 
0aef : 46 10 __ LSR P3 ; (xpos + 1)
0af1 : 98 __ __ TYA
0af2 : 90 05 __ BCC $0af9 ; (spr_set.s13 + 0)
.s15:
0af4 : 0d 10 d0 ORA $d010 
0af7 : b0 05 __ BCS $0afe ; (spr_set.s14 + 0)
.s13:
0af9 : 49 ff __ EOR #$ff
0afb : 2d 10 d0 AND $d010 
.s14:
0afe : 8d 10 d0 STA $d010 
0b01 : ad ca 13 LDA $13ca ; (vspriteScreen + 0)
0b04 : 85 1b __ STA ACCU + 0 
0b06 : ad cb 13 LDA $13cb ; (vspriteScreen + 1)
0b09 : 85 1c __ STA ACCU + 1 
0b0b : a5 13 __ LDA P6 ; (image + 0)
0b0d : a4 0d __ LDY P0 ; (sp + 0)
0b0f : 91 1b __ STA (ACCU + 0),y 
0b11 : a5 14 __ LDA P7 ; (color + 0)
0b13 : 99 27 d0 STA $d027,y 
.s3:
0b16 : 60 __ __ RTS
--------------------------------------------------------------------
screen_init: ; screen_init()->void
;  55, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
0b17 : a9 20 __ LDA #$20
0b19 : a2 fa __ LDX #$fa
.l6:
0b1b : ca __ __ DEX
0b1c : 9d 00 04 STA $0400,x 
0b1f : 9d fa 04 STA $04fa,x 
0b22 : 9d f4 05 STA $05f4,x 
0b25 : 9d ee 06 STA $06ee,x 
0b28 : d0 f1 __ BNE $0b1b ; (screen_init.l6 + 0)
.s5:
0b2a : a9 64 __ LDA #$64
0b2c : 85 47 __ STA T2 + 0 
.l7:
0b2e : 20 15 0d JSR $0d15 ; (rand.s4 + 0)
0b31 : a9 28 __ LDA #$28
0b33 : 85 03 __ STA WORK + 0 
0b35 : a9 00 __ LDA #$00
0b37 : 85 04 __ STA WORK + 1 
0b39 : 20 ab 12 JSR $12ab ; (divmod + 0)
0b3c : a5 05 __ LDA WORK + 2 
0b3e : 85 45 __ STA T1 + 0 
0b40 : 20 15 0d JSR $0d15 ; (rand.s4 + 0)
0b43 : a9 19 __ LDA #$19
0b45 : 85 03 __ STA WORK + 0 
0b47 : a9 00 __ LDA #$00
0b49 : 85 04 __ STA WORK + 1 
0b4b : 20 ab 12 JSR $12ab ; (divmod + 0)
0b4e : a5 05 __ LDA WORK + 2 
0b50 : 0a __ __ ASL
0b51 : 0a __ __ ASL
0b52 : 65 05 __ ADC WORK + 2 
0b54 : 0a __ __ ASL
0b55 : 0a __ __ ASL
0b56 : 85 43 __ STA T0 + 0 
0b58 : a9 00 __ LDA #$00
0b5a : 2a __ __ ROL
0b5b : 06 43 __ ASL T0 + 0 
0b5d : 2a __ __ ROL
0b5e : aa __ __ TAX
0b5f : a5 43 __ LDA T0 + 0 
0b61 : 65 45 __ ADC T1 + 0 
0b63 : 85 43 __ STA T0 + 0 
0b65 : 85 1f __ STA ADDR + 0 
0b67 : 8a __ __ TXA
0b68 : 69 04 __ ADC #$04
0b6a : 85 44 __ STA T0 + 1 
0b6c : 69 d4 __ ADC #$d4
0b6e : 85 20 __ STA ADDR + 1 
0b70 : a9 2e __ LDA #$2e
0b72 : a0 00 __ LDY #$00
0b74 : 91 43 __ STA (T0 + 0),y 
0b76 : a9 01 __ LDA #$01
0b78 : 91 1f __ STA (ADDR + 0),y 
0b7a : c6 47 __ DEC T2 + 0 
0b7c : d0 b0 __ BNE $0b2e ; (screen_init.l7 + 0)
.l8:
0b7e : 20 15 0d JSR $0d15 ; (rand.s4 + 0)
0b81 : a5 1b __ LDA ACCU + 0 
0b83 : 29 0f __ AND #$0f
0b85 : 18 __ __ CLC
0b86 : 69 04 __ ADC #$04
0b88 : a6 47 __ LDX T2 + 0 
0b8a : 9d d5 9f STA $9fd5,x ; (height[0] + 0)
0b8d : 8a __ __ TXA
0b8e : 69 08 __ ADC #$08
0b90 : 85 47 __ STA T2 + 0 
0b92 : c9 29 __ CMP #$29
0b94 : 90 e8 __ BCC $0b7e ; (screen_init.l8 + 0)
.s9:
0b96 : a9 08 __ LDA #$08
.l25:
0b98 : 85 49 __ STA T3 + 0 
0b9a : 4a __ __ LSR
0b9b : 85 4b __ STA T4 + 0 
0b9d : a9 00 __ LDA #$00
0b9f : 18 __ __ CLC
.l27:
0ba0 : 85 43 __ STA T0 + 0 
0ba2 : 85 4d __ STA T5 + 0 
0ba4 : 65 49 __ ADC T3 + 0 
0ba6 : 85 4f __ STA T6 + 0 
0ba8 : aa __ __ TAX
0ba9 : bd d5 9f LDA $9fd5,x ; (height[0] + 0)
0bac : 85 47 __ STA T2 + 0 
0bae : 29 80 __ AND #$80
0bb0 : 10 02 __ BPL $0bb4 ; (screen_init.l27 + 20)
0bb2 : a9 ff __ LDA #$ff
0bb4 : 85 48 __ STA T2 + 1 
0bb6 : a6 43 __ LDX T0 + 0 
0bb8 : bd d5 9f LDA $9fd5,x ; (height[0] + 0)
0bbb : 85 45 __ STA T1 + 0 
0bbd : 29 80 __ AND #$80
0bbf : 10 02 __ BPL $0bc3 ; (screen_init.l27 + 35)
0bc1 : a9 ff __ LDA #$ff
0bc3 : 85 46 __ STA T1 + 1 
0bc5 : 20 15 0d JSR $0d15 ; (rand.s4 + 0)
0bc8 : a5 49 __ LDA T3 + 0 
0bca : 85 03 __ STA WORK + 0 
0bcc : a9 00 __ LDA #$00
0bce : 85 04 __ STA WORK + 1 
0bd0 : 20 ab 12 JSR $12ab ; (divmod + 0)
0bd3 : a5 05 __ LDA WORK + 2 
0bd5 : 38 __ __ SEC
0bd6 : e5 4b __ SBC T4 + 0 
0bd8 : 85 43 __ STA T0 + 0 
0bda : 18 __ __ CLC
0bdb : a5 47 __ LDA T2 + 0 
0bdd : 65 45 __ ADC T1 + 0 
0bdf : aa __ __ TAX
0be0 : a5 48 __ LDA T2 + 1 
0be2 : 65 46 __ ADC T1 + 1 
0be4 : 4a __ __ LSR
0be5 : 8a __ __ TXA
0be6 : 6a __ __ ROR
0be7 : 18 __ __ CLC
0be8 : 65 43 __ ADC T0 + 0 
0bea : a8 __ __ TAY
0beb : 18 __ __ CLC
0bec : a5 4d __ LDA T5 + 0 
0bee : 65 4b __ ADC T4 + 0 
0bf0 : aa __ __ TAX
0bf1 : 98 __ __ TYA
0bf2 : 9d d5 9f STA $9fd5,x ; (height[0] + 0)
0bf5 : a5 4f __ LDA T6 + 0 
0bf7 : c9 28 __ CMP #$28
0bf9 : 90 a5 __ BCC $0ba0 ; (screen_init.l27 + 0)
.s10:
0bfb : a5 4b __ LDA T4 + 0 
0bfd : c9 02 __ CMP #$02
0bff : b0 97 __ BCS $0b98 ; (screen_init.l25 + 0)
.s11:
0c01 : 20 15 0d JSR $0d15 ; (rand.s4 + 0)
0c04 : a9 21 __ LDA #$21
0c06 : 85 03 __ STA WORK + 0 
0c08 : a9 00 __ LDA #$00
0c0a : 85 04 __ STA WORK + 1 
0c0c : 20 ab 12 JSR $12ab ; (divmod + 0)
0c0f : a6 05 __ LDX WORK + 2 
0c11 : e8 __ __ INX
0c12 : e8 __ __ INX
0c13 : 86 43 __ STX T0 + 0 
0c15 : bd d5 9f LDA $9fd5,x ; (height[0] + 0)
0c18 : 85 4b __ STA T4 + 0 
0c1a : a9 01 __ LDA #$01
0c1c : a8 __ __ TAY
.l12:
0c1d : 18 __ __ CLC
0c1e : 65 43 __ ADC T0 + 0 
0c20 : aa __ __ TAX
0c21 : bd d5 9f LDA $9fd5,x ; (height[0] + 0)
0c24 : 29 80 __ AND #$80
0c26 : 10 02 __ BPL $0c2a ; (screen_init.l12 + 13)
0c28 : a9 ff __ LDA #$ff
0c2a : 30 09 __ BMI $0c35 ; (screen_init.s19 + 0)
.s21:
0c2c : d0 0c __ BNE $0c3a ; (screen_init.s13 + 0)
.s20:
0c2e : bd d5 9f LDA $9fd5,x ; (height[0] + 0)
0c31 : c5 4b __ CMP T4 + 0 
0c33 : b0 05 __ BCS $0c3a ; (screen_init.s13 + 0)
.s19:
0c35 : bd d5 9f LDA $9fd5,x ; (height[0] + 0)
0c38 : 85 4b __ STA T4 + 0 
.s13:
0c3a : c8 __ __ INY
0c3b : 98 __ __ TYA
0c3c : c0 04 __ CPY #$04
0c3e : d0 dd __ BNE $0c1d ; (screen_init.l12 + 0)
.s14:
0c40 : a5 4b __ LDA T4 + 0 
0c42 : a6 43 __ LDX T0 + 0 
0c44 : a0 00 __ LDY #$00
.l26:
0c46 : 9d d5 9f STA $9fd5,x ; (height[0] + 0)
0c49 : e8 __ __ INX
0c4a : c8 __ __ INY
0c4b : c0 04 __ CPY #$04
0c4d : d0 f7 __ BNE $0c46 ; (screen_init.l26 + 0)
.s23:
0c4f : a2 00 __ LDX #$00
.l15:
0c51 : 86 4d __ STX T5 + 0 
0c53 : bd d5 9f LDA $9fd5,x ; (height[0] + 0)
0c56 : f0 35 __ BEQ $0c8d ; (screen_init.s16 + 0)
.s18:
0c58 : aa __ __ TAX
0c59 : a9 c0 __ LDA #$c0
0c5b : 85 47 __ STA T2 + 0 
0c5d : a9 07 __ LDA #$07
0c5f : 85 48 __ STA T2 + 1 
0c61 : a0 00 __ LDY #$00
.l22:
0c63 : 18 __ __ CLC
0c64 : a5 47 __ LDA T2 + 0 
0c66 : 65 4d __ ADC T5 + 0 
0c68 : 85 49 __ STA T3 + 0 
0c6a : 85 1f __ STA ADDR + 0 
0c6c : a5 48 __ LDA T2 + 1 
0c6e : 69 00 __ ADC #$00
0c70 : 85 4a __ STA T3 + 1 
0c72 : 18 __ __ CLC
0c73 : 69 d4 __ ADC #$d4
0c75 : 85 20 __ STA ADDR + 1 
0c77 : a9 a0 __ LDA #$a0
0c79 : 91 49 __ STA (T3 + 0),y 
0c7b : a9 07 __ LDA #$07
0c7d : 91 1f __ STA (ADDR + 0),y 
0c7f : 18 __ __ CLC
0c80 : a5 47 __ LDA T2 + 0 
0c82 : 69 d8 __ ADC #$d8
0c84 : 85 47 __ STA T2 + 0 
0c86 : b0 02 __ BCS $0c8a ; (screen_init.s29 + 0)
.s28:
0c88 : c6 48 __ DEC T2 + 1 
.s29:
0c8a : ca __ __ DEX
0c8b : d0 d6 __ BNE $0c63 ; (screen_init.l22 + 0)
.s16:
0c8d : a6 4d __ LDX T5 + 0 
0c8f : e8 __ __ INX
0c90 : e0 28 __ CPX #$28
0c92 : 90 bd __ BCC $0c51 ; (screen_init.l15 + 0)
.s17:
0c94 : a9 17 __ LDA #$17
0c96 : e5 4b __ SBC T4 + 0 
0c98 : 85 47 __ STA T2 + 0 
0c9a : 0a __ __ ASL
0c9b : 0a __ __ ASL
0c9c : 65 47 __ ADC T2 + 0 
0c9e : 0a __ __ ASL
0c9f : 0a __ __ ASL
0ca0 : 85 47 __ STA T2 + 0 
0ca2 : a9 01 __ LDA #$01
0ca4 : 2a __ __ ROL
0ca5 : 06 47 __ ASL T2 + 0 
0ca7 : 2a __ __ ROL
0ca8 : 85 48 __ STA T2 + 1 
0caa : 38 __ __ SEC
0cab : a9 18 __ LDA #$18
0cad : e5 4b __ SBC T4 + 0 
0caf : a8 __ __ TAY
0cb0 : 0a __ __ ASL
0cb1 : 85 1b __ STA ACCU + 0 
0cb3 : a9 00 __ LDA #$00
0cb5 : 2a __ __ ROL
0cb6 : 06 1b __ ASL ACCU + 0 
0cb8 : 2a __ __ ROL
0cb9 : aa __ __ TAX
0cba : 98 __ __ TYA
0cbb : 65 1b __ ADC ACCU + 0 
0cbd : 85 45 __ STA T1 + 0 
0cbf : 8a __ __ TXA
0cc0 : 69 00 __ ADC #$00
0cc2 : 06 45 __ ASL T1 + 0 
0cc4 : 2a __ __ ROL
0cc5 : 06 45 __ ASL T1 + 0 
0cc7 : 2a __ __ ROL
0cc8 : 06 45 __ ASL T1 + 0 
0cca : 2a __ __ ROL
0ccb : 69 04 __ ADC #$04
0ccd : 85 46 __ STA T1 + 1 
0ccf : a0 00 __ LDY #$00
0cd1 : a2 00 __ LDX #$00
.l24:
0cd3 : 8a __ __ TXA
0cd4 : 18 __ __ CLC
0cd5 : 65 43 __ ADC T0 + 0 
0cd7 : 85 4b __ STA T4 + 0 
0cd9 : 18 __ __ CLC
0cda : 65 45 __ ADC T1 + 0 
0cdc : 85 4d __ STA T5 + 0 
0cde : 85 1f __ STA ADDR + 0 
0ce0 : a5 46 __ LDA T1 + 1 
0ce2 : 69 00 __ ADC #$00
0ce4 : 85 4e __ STA T5 + 1 
0ce6 : 18 __ __ CLC
0ce7 : 69 d4 __ ADC #$d4
0ce9 : 85 20 __ STA ADDR + 1 
0ceb : a9 d6 __ LDA #$d6
0ced : 91 4d __ STA (T5 + 0),y 
0cef : a9 0c __ LDA #$0c
0cf1 : 91 1f __ STA (ADDR + 0),y 
0cf3 : 18 __ __ CLC
0cf4 : a5 47 __ LDA T2 + 0 
0cf6 : 65 4b __ ADC T4 + 0 
0cf8 : 85 4b __ STA T4 + 0 
0cfa : 85 1f __ STA ADDR + 0 
0cfc : a5 48 __ LDA T2 + 1 
0cfe : 69 00 __ ADC #$00
0d00 : 85 4c __ STA T4 + 1 
0d02 : 18 __ __ CLC
0d03 : 69 d4 __ ADC #$d4
0d05 : 85 20 __ STA ADDR + 1 
0d07 : a9 64 __ LDA #$64
0d09 : 91 4b __ STA (T4 + 0),y 
0d0b : a9 01 __ LDA #$01
0d0d : 91 1f __ STA (ADDR + 0),y 
0d0f : e8 __ __ INX
0d10 : e0 04 __ CPX #$04
0d12 : d0 bf __ BNE $0cd3 ; (screen_init.l24 + 0)
.s3:
0d14 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0d15 : ad c5 13 LDA $13c5 ; (seed + 1)
0d18 : 4a __ __ LSR
0d19 : ad c4 13 LDA $13c4 ; (seed + 0)
0d1c : 6a __ __ ROR
0d1d : aa __ __ TAX
0d1e : a9 00 __ LDA #$00
0d20 : 6a __ __ ROR
0d21 : 4d c4 13 EOR $13c4 ; (seed + 0)
0d24 : 85 1b __ STA ACCU + 0 
0d26 : 8a __ __ TXA
0d27 : 4d c5 13 EOR $13c5 ; (seed + 1)
0d2a : 85 1c __ STA ACCU + 1 
0d2c : 4a __ __ LSR
0d2d : 45 1b __ EOR ACCU + 0 
0d2f : 8d c4 13 STA $13c4 ; (seed + 0)
0d32 : 85 1b __ STA ACCU + 0 
0d34 : 45 1c __ EOR ACCU + 1 
0d36 : 8d c5 13 STA $13c5 ; (seed + 1)
0d39 : 85 1c __ STA ACCU + 1 
.s3:
0d3b : 60 __ __ RTS
--------------------------------------------------------------------
lander_show: ; lander_show(struct Lander*,i8,i8)->void
; 124, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
0d3c : a0 00 __ LDY #$00
0d3e : b1 0d __ LDA (P0),y ; (lander + 0)
0d40 : 85 1b __ STA ACCU + 0 
0d42 : c8 __ __ INY
0d43 : b1 0d __ LDA (P0),y ; (lander + 0)
0d45 : 85 1c __ STA ACCU + 1 
0d47 : c8 __ __ INY
0d48 : b1 0d __ LDA (P0),y ; (lander + 0)
0d4a : 85 1d __ STA ACCU + 2 
0d4c : c8 __ __ INY
0d4d : b1 0d __ LDA (P0),y ; (lander + 0)
0d4f : 85 1e __ STA ACCU + 3 
0d51 : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
0d54 : a5 1b __ LDA ACCU + 0 
0d56 : 85 43 __ STA T2 + 0 
0d58 : a5 1c __ LDA ACCU + 1 
0d5a : 29 01 __ AND #$01
0d5c : 85 44 __ STA T2 + 1 
0d5e : a0 04 __ LDY #$04
0d60 : b1 0d __ LDA (P0),y ; (lander + 0)
0d62 : 85 1b __ STA ACCU + 0 
0d64 : c8 __ __ INY
0d65 : b1 0d __ LDA (P0),y ; (lander + 0)
0d67 : 85 1c __ STA ACCU + 1 
0d69 : c8 __ __ INY
0d6a : b1 0d __ LDA (P0),y ; (lander + 0)
0d6c : 85 1d __ STA ACCU + 2 
0d6e : c8 __ __ INY
0d6f : b1 0d __ LDA (P0),y ; (lander + 0)
0d71 : 85 1e __ STA ACCU + 3 
0d73 : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
0d76 : a5 1b __ LDA ACCU + 0 
0d78 : 8d 01 d0 STA $d001 
0d7b : ee 20 d0 INC $d020 
0d7e : ad 20 d0 LDA $d020 
0d81 : a5 43 __ LDA T2 + 0 
0d83 : 8d 00 d0 STA $d000 
0d86 : a5 44 __ LDA T2 + 1 
0d88 : c9 01 __ CMP #$01
0d8a : a9 00 __ LDA #$00
0d8c : 6a __ __ ROR
0d8d : 85 1c __ STA ACCU + 1 
0d8f : f0 07 __ BEQ $0d98 ; (lander_show.s5 + 0)
.s15:
0d91 : ad 10 d0 LDA $d010 
0d94 : 09 01 __ ORA #$01
0d96 : 90 05 __ BCC $0d9d ; (lander_show.s6 + 0)
.s5:
0d98 : ad 10 d0 LDA $d010 
0d9b : 29 fe __ AND #$fe
.s6:
0d9d : 8d 10 d0 STA $d010 
0da0 : a5 1b __ LDA ACCU + 0 
0da2 : 8d 03 d0 STA $d003 
0da5 : a5 43 __ LDA T2 + 0 
0da7 : 8d 02 d0 STA $d002 
0daa : 24 1c __ BIT ACCU + 1 
0dac : 10 07 __ BPL $0db5 ; (lander_show.s7 + 0)
.s14:
0dae : ad 10 d0 LDA $d010 
0db1 : 09 02 __ ORA #$02
0db3 : 90 05 __ BCC $0dba ; (lander_show.s8 + 0)
.s7:
0db5 : ad 10 d0 LDA $d010 
0db8 : 29 fd __ AND #$fd
.s8:
0dba : 8d 10 d0 STA $d010 
0dbd : aa __ __ TAX
0dbe : 24 10 __ BIT P3 ; (jy + 0)
0dc0 : 30 0f __ BMI $0dd1 ; (lander_show.s10 + 0)
.s9:
0dc2 : ad 15 d0 LDA $d015 
0dc5 : 29 fb __ AND #$fb
.s3:
0dc7 : 8d 15 d0 STA $d015 
0dca : ce 20 d0 DEC $d020 
0dcd : ad 20 d0 LDA $d020 
0dd0 : 60 __ __ RTS
.s10:
0dd1 : 18 __ __ CLC
0dd2 : a5 1b __ LDA ACCU + 0 
0dd4 : 69 14 __ ADC #$14
0dd6 : 8d 05 d0 STA $d005 
0dd9 : a5 43 __ LDA T2 + 0 
0ddb : 8d 04 d0 STA $d004 
0dde : 24 1c __ BIT ACCU + 1 
0de0 : 30 06 __ BMI $0de8 ; (lander_show.s13 + 0)
.s11:
0de2 : 8a __ __ TXA
0de3 : 29 fb __ AND #$fb
0de5 : 4c eb 0d JMP $0deb ; (lander_show.s12 + 0)
.s13:
0de8 : 8a __ __ TXA
0de9 : 09 04 __ ORA #$04
.s12:
0deb : 8d 10 d0 STA $d010 
0dee : 20 15 0d JSR $0d15 ; (rand.s4 + 0)
0df1 : a5 1b __ LDA ACCU + 0 
0df3 : 29 03 __ AND #$03
0df5 : aa __ __ TAX
0df6 : bd c6 13 LDA $13c6,x ; (ExhaustColor[0] + 0)
0df9 : 8d 29 d0 STA $d029 
0dfc : ad 15 d0 LDA $d015 
0dff : 09 04 __ ORA #$04
0e01 : 4c c7 0d JMP $0dc7 ; (lander_show.s3 + 0)
--------------------------------------------------------------------
game_loop: ; game_loop()->void
; 214, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
0e04 : ad cc 13 LDA $13cc ; (TheGame.state + 0)
0e07 : c9 02 __ CMP #$02
0e09 : d0 08 __ BNE $0e13 ; (game_loop.s5 + 0)
.s18:
0e0b : ad cd 13 LDA $13cd ; (TheGame.count + 0)
0e0e : 85 50 __ STA T0 + 0 
0e10 : 4c 2b 0e JMP $0e2b ; (game_loop.s8 + 0)
.s5:
0e13 : 90 26 __ BCC $0e3b ; (game_loop.s11 + 0)
.s6:
0e15 : c9 03 __ CMP #$03
0e17 : d0 21 __ BNE $0e3a ; (game_loop.s3 + 0)
.s7:
0e19 : ad cd 13 LDA $13cd ; (TheGame.count + 0)
0e1c : 85 50 __ STA T0 + 0 
0e1e : 85 0f __ STA P2 
0e20 : a9 ce __ LDA #$ce
0e22 : 85 0d __ STA P0 
0e24 : a9 13 __ LDA #$13
0e26 : 85 0e __ STA P1 
0e28 : 20 a6 10 JSR $10a6 ; (lander_flash.s4 + 0)
.s8:
0e2b : a6 50 __ LDX T0 + 0 
0e2d : ca __ __ DEX
0e2e : 8e cd 13 STX $13cd ; (TheGame.count + 0)
0e31 : d0 07 __ BNE $0e3a ; (game_loop.s3 + 0)
.s9:
0e33 : a9 00 __ LDA #$00
.s10:
0e35 : 85 18 __ STA P11 
0e37 : 4c c0 08 JMP $08c0 ; (game_state.s4 + 0)
.s3:
0e3a : 60 __ __ RTS
.s11:
0e3b : aa __ __ TAX
0e3c : d0 09 __ BNE $0e47 ; (game_loop.s14 + 0)
.s12:
0e3e : ce cd 13 DEC $13cd ; (TheGame.count + 0)
0e41 : d0 f7 __ BNE $0e3a ; (game_loop.s3 + 0)
.s13:
0e43 : a9 01 __ LDA #$01
0e45 : 90 ee __ BCC $0e35 ; (game_loop.s10 + 0)
.s14:
0e47 : a9 00 __ LDA #$00
0e49 : 20 7d 0e JSR $0e7d ; (joy_poll.s4 + 0)
0e4c : ad e0 13 LDA $13e0 ; (joyx[0] + 0)
0e4f : 85 0f __ STA P2 
0e51 : a9 ce __ LDA #$ce
0e53 : 85 0d __ STA P0 
0e55 : a9 13 __ LDA #$13
0e57 : 85 0e __ STA P1 
0e59 : ad de 13 LDA $13de ; (joyy[0] + 0)
0e5c : 85 10 __ STA P3 
0e5e : 20 bd 0e JSR $0ebd ; (lander_move.s4 + 0)
0e61 : 20 e3 0f JSR $0fe3 ; (lander_check.s4 + 0)
0e64 : c9 01 __ CMP #$01
0e66 : d0 04 __ BNE $0e6c ; (game_loop.s15 + 0)
.s17:
0e68 : a9 03 __ LDA #$03
0e6a : d0 c9 __ BNE $0e35 ; (game_loop.s10 + 0)
.s15:
0e6c : c9 02 __ CMP #$02
0e6e : f0 c5 __ BEQ $0e35 ; (game_loop.s10 + 0)
.s16:
0e70 : ad e0 13 LDA $13e0 ; (joyx[0] + 0)
0e73 : 85 0f __ STA P2 
0e75 : ad de 13 LDA $13de ; (joyy[0] + 0)
0e78 : 85 10 __ STA P3 
0e7a : 4c 3c 0d JMP $0d3c ; (lander_show.s4 + 0)
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
0e7d : aa __ __ TAX
0e7e : bd 00 dc LDA $dc00,x 
0e81 : a8 __ __ TAY
0e82 : 29 10 __ AND #$10
0e84 : f0 04 __ BEQ $0e8a ; (joy_poll.s10 + 0)
.s11:
0e86 : a9 00 __ LDA #$00
0e88 : f0 02 __ BEQ $0e8c ; (joy_poll.s12 + 0)
.s10:
0e8a : a9 01 __ LDA #$01
.s12:
0e8c : 9d e2 13 STA $13e2,x ; (joyb[0] + 0)
0e8f : 98 __ __ TYA
0e90 : 4a __ __ LSR
0e91 : b0 04 __ BCS $0e97 ; (joy_poll.s9 + 0)
.s5:
0e93 : a9 ff __ LDA #$ff
0e95 : 90 0b __ BCC $0ea2 ; (joy_poll.s6 + 0)
.s9:
0e97 : 98 __ __ TYA
0e98 : 29 02 __ AND #$02
0e9a : f0 04 __ BEQ $0ea0 ; (joy_poll.s13 + 0)
.s14:
0e9c : a9 00 __ LDA #$00
0e9e : b0 02 __ BCS $0ea2 ; (joy_poll.s6 + 0)
.s13:
0ea0 : a9 01 __ LDA #$01
.s6:
0ea2 : 9d de 13 STA $13de,x ; (joyy[0] + 0)
0ea5 : 98 __ __ TYA
0ea6 : 29 04 __ AND #$04
0ea8 : d0 06 __ BNE $0eb0 ; (joy_poll.s8 + 0)
.s7:
0eaa : a9 ff __ LDA #$ff
.s3:
0eac : 9d e0 13 STA $13e0,x ; (joyx[0] + 0)
0eaf : 60 __ __ RTS
.s8:
0eb0 : 98 __ __ TYA
0eb1 : 29 08 __ AND #$08
0eb3 : f0 04 __ BEQ $0eb9 ; (joy_poll.s15 + 0)
.s16:
0eb5 : a9 00 __ LDA #$00
0eb7 : f0 f3 __ BEQ $0eac ; (joy_poll.s3 + 0)
.s15:
0eb9 : a9 01 __ LDA #$01
0ebb : d0 ef __ BNE $0eac ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
lander_move: ; lander_move(struct Lander*,i8,i8)->void
; 116, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
0ebd : a0 00 __ LDY #$00
0ebf : b1 0d __ LDA (P0),y ; (lander + 0)
0ec1 : 85 1b __ STA ACCU + 0 
0ec3 : c8 __ __ INY
0ec4 : b1 0d __ LDA (P0),y ; (lander + 0)
0ec6 : 85 1c __ STA ACCU + 1 
0ec8 : c8 __ __ INY
0ec9 : b1 0d __ LDA (P0),y ; (lander + 0)
0ecb : 85 1d __ STA ACCU + 2 
0ecd : c8 __ __ INY
0ece : b1 0d __ LDA (P0),y ; (lander + 0)
0ed0 : 85 1e __ STA ACCU + 3 
0ed2 : a0 08 __ LDY #$08
0ed4 : b1 0d __ LDA (P0),y ; (lander + 0)
0ed6 : 85 43 __ STA T1 + 0 
0ed8 : c8 __ __ INY
0ed9 : b1 0d __ LDA (P0),y ; (lander + 0)
0edb : 85 44 __ STA T1 + 1 
0edd : c8 __ __ INY
0ede : b1 0d __ LDA (P0),y ; (lander + 0)
0ee0 : 85 45 __ STA T1 + 2 
0ee2 : c8 __ __ INY
0ee3 : b1 0d __ LDA (P0),y ; (lander + 0)
0ee5 : 85 46 __ STA T1 + 3 
0ee7 : a2 43 __ LDX #$43
0ee9 : 20 b5 10 JSR $10b5 ; (freg + 4)
0eec : 20 fc 10 JSR $10fc ; (faddsub + 6)
0eef : a5 1b __ LDA ACCU + 0 
0ef1 : a0 00 __ LDY #$00
0ef3 : 91 0d __ STA (P0),y ; (lander + 0)
0ef5 : a5 1c __ LDA ACCU + 1 
0ef7 : c8 __ __ INY
0ef8 : 91 0d __ STA (P0),y ; (lander + 0)
0efa : a5 1d __ LDA ACCU + 2 
0efc : c8 __ __ INY
0efd : 91 0d __ STA (P0),y ; (lander + 0)
0eff : a5 1e __ LDA ACCU + 3 
0f01 : c8 __ __ INY
0f02 : 91 0d __ STA (P0),y ; (lander + 0)
0f04 : c8 __ __ INY
0f05 : b1 0d __ LDA (P0),y ; (lander + 0)
0f07 : 85 1b __ STA ACCU + 0 
0f09 : c8 __ __ INY
0f0a : b1 0d __ LDA (P0),y ; (lander + 0)
0f0c : 85 1c __ STA ACCU + 1 
0f0e : c8 __ __ INY
0f0f : b1 0d __ LDA (P0),y ; (lander + 0)
0f11 : 85 1d __ STA ACCU + 2 
0f13 : c8 __ __ INY
0f14 : b1 0d __ LDA (P0),y ; (lander + 0)
0f16 : 85 1e __ STA ACCU + 3 
0f18 : a0 0c __ LDY #$0c
0f1a : b1 0d __ LDA (P0),y ; (lander + 0)
0f1c : 85 47 __ STA T2 + 0 
0f1e : c8 __ __ INY
0f1f : b1 0d __ LDA (P0),y ; (lander + 0)
0f21 : 85 48 __ STA T2 + 1 
0f23 : c8 __ __ INY
0f24 : b1 0d __ LDA (P0),y ; (lander + 0)
0f26 : 85 49 __ STA T2 + 2 
0f28 : c8 __ __ INY
0f29 : b1 0d __ LDA (P0),y ; (lander + 0)
0f2b : 85 4a __ STA T2 + 3 
0f2d : a2 47 __ LDX #$47
0f2f : 20 b5 10 JSR $10b5 ; (freg + 4)
0f32 : 20 fc 10 JSR $10fc ; (faddsub + 6)
0f35 : a5 1b __ LDA ACCU + 0 
0f37 : a0 04 __ LDY #$04
0f39 : 91 0d __ STA (P0),y ; (lander + 0)
0f3b : a5 1c __ LDA ACCU + 1 
0f3d : c8 __ __ INY
0f3e : 91 0d __ STA (P0),y ; (lander + 0)
0f40 : a5 1d __ LDA ACCU + 2 
0f42 : c8 __ __ INY
0f43 : 91 0d __ STA (P0),y ; (lander + 0)
0f45 : a5 1e __ LDA ACCU + 3 
0f47 : c8 __ __ INY
0f48 : 91 0d __ STA (P0),y ; (lander + 0)
0f4a : a5 0f __ LDA P2 ; (jx + 0)
0f4c : 85 1b __ STA ACCU + 0 
0f4e : 29 80 __ AND #$80
0f50 : 10 02 __ BPL $0f54 ; (lander_move.s4 + 151)
0f52 : a9 ff __ LDA #$ff
0f54 : 85 1c __ STA ACCU + 1 
0f56 : 20 7c 13 JSR $137c ; (sint16_to_float + 0)
0f59 : a9 0a __ LDA #$0a
0f5b : 85 03 __ STA WORK + 0 
0f5d : a9 3c __ LDA #$3c
0f5f : 85 06 __ STA WORK + 3 
0f61 : a9 d7 __ LDA #$d7
0f63 : 85 04 __ STA WORK + 1 
0f65 : a9 a3 __ LDA #$a3
0f67 : 85 05 __ STA WORK + 2 
0f69 : 20 c5 10 JSR $10c5 ; (freg + 20)
0f6c : 20 e3 11 JSR $11e3 ; (crt_fmul + 0)
0f6f : a2 43 __ LDX #$43
0f71 : 20 b5 10 JSR $10b5 ; (freg + 4)
0f74 : 20 fc 10 JSR $10fc ; (faddsub + 6)
0f77 : a5 1b __ LDA ACCU + 0 
0f79 : a0 08 __ LDY #$08
0f7b : 91 0d __ STA (P0),y ; (lander + 0)
0f7d : a5 1c __ LDA ACCU + 1 
0f7f : c8 __ __ INY
0f80 : 91 0d __ STA (P0),y ; (lander + 0)
0f82 : a5 1d __ LDA ACCU + 2 
0f84 : c8 __ __ INY
0f85 : 91 0d __ STA (P0),y ; (lander + 0)
0f87 : a5 1e __ LDA ACCU + 3 
0f89 : c8 __ __ INY
0f8a : 91 0d __ STA (P0),y ; (lander + 0)
0f8c : a5 10 __ LDA P3 ; (jy + 0)
0f8e : 85 1b __ STA ACCU + 0 
0f90 : 29 80 __ AND #$80
0f92 : 10 02 __ BPL $0f96 ; (lander_move.s4 + 217)
0f94 : a9 ff __ LDA #$ff
0f96 : 85 1c __ STA ACCU + 1 
0f98 : 20 7c 13 JSR $137c ; (sint16_to_float + 0)
0f9b : a9 cc __ LDA #$cc
0f9d : 85 04 __ STA WORK + 1 
0f9f : 85 05 __ STA WORK + 2 
0fa1 : a9 cd __ LDA #$cd
0fa3 : 85 03 __ STA WORK + 0 
0fa5 : a9 3d __ LDA #$3d
0fa7 : 85 06 __ STA WORK + 3 
0fa9 : 20 c5 10 JSR $10c5 ; (freg + 20)
0fac : 20 e3 11 JSR $11e3 ; (crt_fmul + 0)
0faf : a9 0a __ LDA #$0a
0fb1 : 85 03 __ STA WORK + 0 
0fb3 : a9 3c __ LDA #$3c
0fb5 : 85 06 __ STA WORK + 3 
0fb7 : a9 d7 __ LDA #$d7
0fb9 : 85 04 __ STA WORK + 1 
0fbb : a9 23 __ LDA #$23
0fbd : 85 05 __ STA WORK + 2 
0fbf : 20 c5 10 JSR $10c5 ; (freg + 20)
0fc2 : 20 fc 10 JSR $10fc ; (faddsub + 6)
0fc5 : a2 47 __ LDX #$47
0fc7 : 20 b5 10 JSR $10b5 ; (freg + 4)
0fca : 20 fc 10 JSR $10fc ; (faddsub + 6)
0fcd : a5 1b __ LDA ACCU + 0 
0fcf : a0 0c __ LDY #$0c
0fd1 : 91 0d __ STA (P0),y ; (lander + 0)
0fd3 : a5 1c __ LDA ACCU + 1 
0fd5 : c8 __ __ INY
0fd6 : 91 0d __ STA (P0),y ; (lander + 0)
0fd8 : a5 1d __ LDA ACCU + 2 
0fda : c8 __ __ INY
0fdb : 91 0d __ STA (P0),y ; (lander + 0)
0fdd : a5 1e __ LDA ACCU + 3 
0fdf : c8 __ __ INY
0fe0 : 91 0d __ STA (P0),y ; (lander + 0)
.s3:
0fe2 : 60 __ __ RTS
--------------------------------------------------------------------
lander_check: ; lander_check(struct Lander*)->enum LanderCollision
; 156, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
0fe3 : a0 04 __ LDY #$04
0fe5 : b1 0d __ LDA (P0),y ; (lander + 0)
0fe7 : 85 1b __ STA ACCU + 0 
0fe9 : c8 __ __ INY
0fea : b1 0d __ LDA (P0),y ; (lander + 0)
0fec : 85 1c __ STA ACCU + 1 
0fee : c8 __ __ INY
0fef : b1 0d __ LDA (P0),y ; (lander + 0)
0ff1 : 85 1d __ STA ACCU + 2 
0ff3 : c8 __ __ INY
0ff4 : b1 0d __ LDA (P0),y ; (lander + 0)
0ff6 : 85 1e __ STA ACCU + 3 
0ff8 : a9 00 __ LDA #$00
0ffa : 85 03 __ STA WORK + 0 
0ffc : 85 04 __ STA WORK + 1 
0ffe : a9 e8 __ LDA #$e8
1000 : 85 05 __ STA WORK + 2 
1002 : a9 c1 __ LDA #$c1
1004 : 85 06 __ STA WORK + 3 
1006 : 20 c5 10 JSR $10c5 ; (freg + 20)
1009 : 20 fc 10 JSR $10fc ; (faddsub + 6)
100c : a9 00 __ LDA #$00
100e : 85 03 __ STA WORK + 0 
1010 : 85 04 __ STA WORK + 1 
1012 : 85 05 __ STA WORK + 2 
1014 : a9 3e __ LDA #$3e
1016 : 85 06 __ STA WORK + 3 
1018 : 20 c5 10 JSR $10c5 ; (freg + 20)
101b : 20 e3 11 JSR $11e3 ; (crt_fmul + 0)
101e : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
1021 : a5 1b __ LDA ACCU + 0 
1023 : 10 03 __ BPL $1028 ; (lander_check.s14 + 0)
.s13:
1025 : a9 00 __ LDA #$00
.s3:
1027 : 60 __ __ RTS
.s14:
1028 : c9 19 __ CMP #$19
102a : b0 6a __ BCS $1096 ; (lander_check.s12 + 0)
.s5:
102c : 85 43 __ STA T2 + 0 
102e : a0 00 __ LDY #$00
1030 : b1 0d __ LDA (P0),y ; (lander + 0)
1032 : 85 1b __ STA ACCU + 0 
1034 : c8 __ __ INY
1035 : b1 0d __ LDA (P0),y ; (lander + 0)
1037 : 85 1c __ STA ACCU + 1 
1039 : c8 __ __ INY
103a : b1 0d __ LDA (P0),y ; (lander + 0)
103c : 85 1d __ STA ACCU + 2 
103e : c8 __ __ INY
103f : b1 0d __ LDA (P0),y ; (lander + 0)
1041 : 85 1e __ STA ACCU + 3 
1043 : a9 00 __ LDA #$00
1045 : 85 03 __ STA WORK + 0 
1047 : 85 04 __ STA WORK + 1 
1049 : a9 c0 __ LDA #$c0
104b : 85 05 __ STA WORK + 2 
104d : a9 c1 __ LDA #$c1
104f : 85 06 __ STA WORK + 3 
1051 : 20 c5 10 JSR $10c5 ; (freg + 20)
1054 : 20 fc 10 JSR $10fc ; (faddsub + 6)
1057 : a9 00 __ LDA #$00
1059 : 85 44 __ STA T4 + 0 
105b : 85 03 __ STA WORK + 0 
105d : 85 04 __ STA WORK + 1 
105f : 85 05 __ STA WORK + 2 
1061 : a9 3e __ LDA #$3e
1063 : 85 06 __ STA WORK + 3 
1065 : 20 c5 10 JSR $10c5 ; (freg + 20)
1068 : 20 e3 11 JSR $11e3 ; (crt_fmul + 0)
106b : 20 30 13 JSR $1330 ; (f32_to_i16 + 0)
106e : a4 1b __ LDY ACCU + 0 
1070 : c0 28 __ CPY #$28
1072 : a2 04 __ LDX #$04
1074 : 90 08 __ BCC $107e ; (lander_check.l9 + 0)
.l7:
1076 : c8 __ __ INY
1077 : ca __ __ DEX
1078 : f0 29 __ BEQ $10a3 ; (lander_check.s8 + 0)
.s6:
107a : c0 28 __ CPY #$28
107c : b0 f8 __ BCS $1076 ; (lander_check.l7 + 0)
.l9:
107e : a5 43 __ LDA T2 + 0 
1080 : 0a __ __ ASL
1081 : 0a __ __ ASL
1082 : 65 43 __ ADC T2 + 0 
1084 : 0a __ __ ASL
1085 : 0a __ __ ASL
1086 : 85 1b __ STA ACCU + 0 
1088 : a9 01 __ LDA #$01
108a : 2a __ __ ROL
108b : 06 1b __ ASL ACCU + 0 
108d : 2a __ __ ROL
108e : 85 1c __ STA ACCU + 1 
1090 : b1 1b __ LDA (ACCU + 0),y 
1092 : c9 a0 __ CMP #$a0
1094 : d0 03 __ BNE $1099 ; (lander_check.s10 + 0)
.s12:
1096 : a9 01 __ LDA #$01
1098 : 60 __ __ RTS
.s10:
1099 : c9 d6 __ CMP #$d6
109b : d0 d9 __ BNE $1076 ; (lander_check.l7 + 0)
.s11:
109d : a9 02 __ LDA #$02
109f : 85 44 __ STA T4 + 0 
10a1 : d0 d3 __ BNE $1076 ; (lander_check.l7 + 0)
.s8:
10a3 : a5 44 __ LDA T4 + 0 
10a5 : 60 __ __ RTS
--------------------------------------------------------------------
lander_flash: ; lander_flash(struct Lander*,u8)->void
; 144, "/home/honza/projects/c64/projects/oscar64/samples/games/lander.c"
.s4:
10a6 : 20 15 0d JSR $0d15 ; (rand.s4 + 0)
10a9 : a5 1b __ LDA ACCU + 0 
10ab : 29 01 __ AND #$01
10ad : 8d 27 d0 STA $d027 
.s3:
10b0 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
10b1 : b1 19 __ LDA (IP + 0),y 
10b3 : c8 __ __ INY
10b4 : aa __ __ TAX
10b5 : b5 00 __ LDA $00,x 
10b7 : 85 03 __ STA WORK + 0 
10b9 : b5 01 __ LDA $01,x 
10bb : 85 04 __ STA WORK + 1 
10bd : b5 02 __ LDA $02,x 
10bf : 85 05 __ STA WORK + 2 
10c1 : b5 03 __ LDA WORK + 0,x 
10c3 : 85 06 __ STA WORK + 3 
10c5 : a5 05 __ LDA WORK + 2 
10c7 : 0a __ __ ASL
10c8 : a5 06 __ LDA WORK + 3 
10ca : 2a __ __ ROL
10cb : 85 08 __ STA WORK + 5 
10cd : f0 06 __ BEQ $10d5 ; (freg + 36)
10cf : a5 05 __ LDA WORK + 2 
10d1 : 09 80 __ ORA #$80
10d3 : 85 05 __ STA WORK + 2 
10d5 : a5 1d __ LDA ACCU + 2 
10d7 : 0a __ __ ASL
10d8 : a5 1e __ LDA ACCU + 3 
10da : 2a __ __ ROL
10db : 85 07 __ STA WORK + 4 
10dd : f0 06 __ BEQ $10e5 ; (freg + 52)
10df : a5 1d __ LDA ACCU + 2 
10e1 : 09 80 __ ORA #$80
10e3 : 85 1d __ STA ACCU + 2 
10e5 : 60 __ __ RTS
10e6 : 06 1e __ ASL ACCU + 3 
10e8 : a5 07 __ LDA WORK + 4 
10ea : 6a __ __ ROR
10eb : 85 1e __ STA ACCU + 3 
10ed : b0 06 __ BCS $10f5 ; (freg + 68)
10ef : a5 1d __ LDA ACCU + 2 
10f1 : 29 7f __ AND #$7f
10f3 : 85 1d __ STA ACCU + 2 
10f5 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
10f6 : a5 06 __ LDA WORK + 3 
10f8 : 49 80 __ EOR #$80
10fa : 85 06 __ STA WORK + 3 
10fc : a9 ff __ LDA #$ff
10fe : c5 07 __ CMP WORK + 4 
1100 : f0 04 __ BEQ $1106 ; (faddsub + 16)
1102 : c5 08 __ CMP WORK + 5 
1104 : d0 11 __ BNE $1117 ; (faddsub + 33)
1106 : a5 1e __ LDA ACCU + 3 
1108 : 09 7f __ ORA #$7f
110a : 85 1e __ STA ACCU + 3 
110c : a9 80 __ LDA #$80
110e : 85 1d __ STA ACCU + 2 
1110 : a9 00 __ LDA #$00
1112 : 85 1b __ STA ACCU + 0 
1114 : 85 1c __ STA ACCU + 1 
1116 : 60 __ __ RTS
1117 : 38 __ __ SEC
1118 : a5 07 __ LDA WORK + 4 
111a : e5 08 __ SBC WORK + 5 
111c : f0 38 __ BEQ $1156 ; (faddsub + 96)
111e : aa __ __ TAX
111f : b0 25 __ BCS $1146 ; (faddsub + 80)
1121 : e0 e9 __ CPX #$e9
1123 : b0 0e __ BCS $1133 ; (faddsub + 61)
1125 : a5 08 __ LDA WORK + 5 
1127 : 85 07 __ STA WORK + 4 
1129 : a9 00 __ LDA #$00
112b : 85 1b __ STA ACCU + 0 
112d : 85 1c __ STA ACCU + 1 
112f : 85 1d __ STA ACCU + 2 
1131 : f0 23 __ BEQ $1156 ; (faddsub + 96)
1133 : a5 1d __ LDA ACCU + 2 
1135 : 4a __ __ LSR
1136 : 66 1c __ ROR ACCU + 1 
1138 : 66 1b __ ROR ACCU + 0 
113a : e8 __ __ INX
113b : d0 f8 __ BNE $1135 ; (faddsub + 63)
113d : 85 1d __ STA ACCU + 2 
113f : a5 08 __ LDA WORK + 5 
1141 : 85 07 __ STA WORK + 4 
1143 : 4c 56 11 JMP $1156 ; (faddsub + 96)
1146 : e0 18 __ CPX #$18
1148 : b0 33 __ BCS $117d ; (faddsub + 135)
114a : a5 05 __ LDA WORK + 2 
114c : 4a __ __ LSR
114d : 66 04 __ ROR WORK + 1 
114f : 66 03 __ ROR WORK + 0 
1151 : ca __ __ DEX
1152 : d0 f8 __ BNE $114c ; (faddsub + 86)
1154 : 85 05 __ STA WORK + 2 
1156 : a5 1e __ LDA ACCU + 3 
1158 : 29 80 __ AND #$80
115a : 85 1e __ STA ACCU + 3 
115c : 45 06 __ EOR WORK + 3 
115e : 30 31 __ BMI $1191 ; (faddsub + 155)
1160 : 18 __ __ CLC
1161 : a5 1b __ LDA ACCU + 0 
1163 : 65 03 __ ADC WORK + 0 
1165 : 85 1b __ STA ACCU + 0 
1167 : a5 1c __ LDA ACCU + 1 
1169 : 65 04 __ ADC WORK + 1 
116b : 85 1c __ STA ACCU + 1 
116d : a5 1d __ LDA ACCU + 2 
116f : 65 05 __ ADC WORK + 2 
1171 : 85 1d __ STA ACCU + 2 
1173 : 90 08 __ BCC $117d ; (faddsub + 135)
1175 : 66 1d __ ROR ACCU + 2 
1177 : 66 1c __ ROR ACCU + 1 
1179 : 66 1b __ ROR ACCU + 0 
117b : e6 07 __ INC WORK + 4 
117d : a5 07 __ LDA WORK + 4 
117f : c9 ff __ CMP #$ff
1181 : f0 83 __ BEQ $1106 ; (faddsub + 16)
1183 : 4a __ __ LSR
1184 : 05 1e __ ORA ACCU + 3 
1186 : 85 1e __ STA ACCU + 3 
1188 : b0 06 __ BCS $1190 ; (faddsub + 154)
118a : a5 1d __ LDA ACCU + 2 
118c : 29 7f __ AND #$7f
118e : 85 1d __ STA ACCU + 2 
1190 : 60 __ __ RTS
1191 : 38 __ __ SEC
1192 : a5 1b __ LDA ACCU + 0 
1194 : e5 03 __ SBC WORK + 0 
1196 : 85 1b __ STA ACCU + 0 
1198 : a5 1c __ LDA ACCU + 1 
119a : e5 04 __ SBC WORK + 1 
119c : 85 1c __ STA ACCU + 1 
119e : a5 1d __ LDA ACCU + 2 
11a0 : e5 05 __ SBC WORK + 2 
11a2 : 85 1d __ STA ACCU + 2 
11a4 : b0 19 __ BCS $11bf ; (faddsub + 201)
11a6 : 38 __ __ SEC
11a7 : a9 00 __ LDA #$00
11a9 : e5 1b __ SBC ACCU + 0 
11ab : 85 1b __ STA ACCU + 0 
11ad : a9 00 __ LDA #$00
11af : e5 1c __ SBC ACCU + 1 
11b1 : 85 1c __ STA ACCU + 1 
11b3 : a9 00 __ LDA #$00
11b5 : e5 1d __ SBC ACCU + 2 
11b7 : 85 1d __ STA ACCU + 2 
11b9 : a5 1e __ LDA ACCU + 3 
11bb : 49 80 __ EOR #$80
11bd : 85 1e __ STA ACCU + 3 
11bf : a5 1d __ LDA ACCU + 2 
11c1 : 30 ba __ BMI $117d ; (faddsub + 135)
11c3 : 05 1c __ ORA ACCU + 1 
11c5 : 05 1b __ ORA ACCU + 0 
11c7 : f0 0f __ BEQ $11d8 ; (faddsub + 226)
11c9 : c6 07 __ DEC WORK + 4 
11cb : f0 0b __ BEQ $11d8 ; (faddsub + 226)
11cd : 06 1b __ ASL ACCU + 0 
11cf : 26 1c __ ROL ACCU + 1 
11d1 : 26 1d __ ROL ACCU + 2 
11d3 : 10 f4 __ BPL $11c9 ; (faddsub + 211)
11d5 : 4c 7d 11 JMP $117d ; (faddsub + 135)
11d8 : a9 00 __ LDA #$00
11da : 85 1b __ STA ACCU + 0 
11dc : 85 1c __ STA ACCU + 1 
11de : 85 1d __ STA ACCU + 2 
11e0 : 85 1e __ STA ACCU + 3 
11e2 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
11e3 : a5 1b __ LDA ACCU + 0 
11e5 : 05 1c __ ORA ACCU + 1 
11e7 : 05 1d __ ORA ACCU + 2 
11e9 : f0 0e __ BEQ $11f9 ; (crt_fmul + 22)
11eb : a5 03 __ LDA WORK + 0 
11ed : 05 04 __ ORA WORK + 1 
11ef : 05 05 __ ORA WORK + 2 
11f1 : d0 09 __ BNE $11fc ; (crt_fmul + 25)
11f3 : 85 1b __ STA ACCU + 0 
11f5 : 85 1c __ STA ACCU + 1 
11f7 : 85 1d __ STA ACCU + 2 
11f9 : 85 1e __ STA ACCU + 3 
11fb : 60 __ __ RTS
11fc : a5 1e __ LDA ACCU + 3 
11fe : 45 06 __ EOR WORK + 3 
1200 : 29 80 __ AND #$80
1202 : 85 1e __ STA ACCU + 3 
1204 : a9 ff __ LDA #$ff
1206 : c5 07 __ CMP WORK + 4 
1208 : f0 42 __ BEQ $124c ; (crt_fmul + 105)
120a : c5 08 __ CMP WORK + 5 
120c : f0 3e __ BEQ $124c ; (crt_fmul + 105)
120e : a9 00 __ LDA #$00
1210 : 85 09 __ STA WORK + 6 
1212 : 85 0a __ STA WORK + 7 
1214 : 85 0b __ STA WORK + 8 
1216 : a4 1b __ LDY ACCU + 0 
1218 : a5 03 __ LDA WORK + 0 
121a : d0 06 __ BNE $1222 ; (crt_fmul + 63)
121c : a5 04 __ LDA WORK + 1 
121e : f0 0a __ BEQ $122a ; (crt_fmul + 71)
1220 : d0 05 __ BNE $1227 ; (crt_fmul + 68)
1222 : 20 7d 12 JSR $127d ; (crt_fmul8 + 0)
1225 : a5 04 __ LDA WORK + 1 
1227 : 20 7d 12 JSR $127d ; (crt_fmul8 + 0)
122a : a5 05 __ LDA WORK + 2 
122c : 20 7d 12 JSR $127d ; (crt_fmul8 + 0)
122f : 38 __ __ SEC
1230 : a5 0b __ LDA WORK + 8 
1232 : 30 06 __ BMI $123a ; (crt_fmul + 87)
1234 : 06 09 __ ASL WORK + 6 
1236 : 26 0a __ ROL WORK + 7 
1238 : 2a __ __ ROL
1239 : 18 __ __ CLC
123a : 29 7f __ AND #$7f
123c : 85 0b __ STA WORK + 8 
123e : a5 07 __ LDA WORK + 4 
1240 : 65 08 __ ADC WORK + 5 
1242 : 90 19 __ BCC $125d ; (crt_fmul + 122)
1244 : e9 7f __ SBC #$7f
1246 : b0 04 __ BCS $124c ; (crt_fmul + 105)
1248 : c9 ff __ CMP #$ff
124a : d0 15 __ BNE $1261 ; (crt_fmul + 126)
124c : a5 1e __ LDA ACCU + 3 
124e : 09 7f __ ORA #$7f
1250 : 85 1e __ STA ACCU + 3 
1252 : a9 80 __ LDA #$80
1254 : 85 1d __ STA ACCU + 2 
1256 : a9 00 __ LDA #$00
1258 : 85 1b __ STA ACCU + 0 
125a : 85 1c __ STA ACCU + 1 
125c : 60 __ __ RTS
125d : e9 7e __ SBC #$7e
125f : 90 15 __ BCC $1276 ; (crt_fmul + 147)
1261 : 4a __ __ LSR
1262 : 05 1e __ ORA ACCU + 3 
1264 : 85 1e __ STA ACCU + 3 
1266 : a9 00 __ LDA #$00
1268 : 6a __ __ ROR
1269 : 05 0b __ ORA WORK + 8 
126b : 85 1d __ STA ACCU + 2 
126d : a5 0a __ LDA WORK + 7 
126f : 85 1c __ STA ACCU + 1 
1271 : a5 09 __ LDA WORK + 6 
1273 : 85 1b __ STA ACCU + 0 
1275 : 60 __ __ RTS
1276 : a9 00 __ LDA #$00
1278 : 85 1e __ STA ACCU + 3 
127a : f0 d8 __ BEQ $1254 ; (crt_fmul + 113)
127c : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
127d : 38 __ __ SEC
127e : 6a __ __ ROR
127f : 90 1e __ BCC $129f ; (crt_fmul8 + 34)
1281 : aa __ __ TAX
1282 : 18 __ __ CLC
1283 : 98 __ __ TYA
1284 : 65 09 __ ADC WORK + 6 
1286 : 85 09 __ STA WORK + 6 
1288 : a5 0a __ LDA WORK + 7 
128a : 65 1c __ ADC ACCU + 1 
128c : 85 0a __ STA WORK + 7 
128e : a5 0b __ LDA WORK + 8 
1290 : 65 1d __ ADC ACCU + 2 
1292 : 6a __ __ ROR
1293 : 85 0b __ STA WORK + 8 
1295 : 8a __ __ TXA
1296 : 66 0a __ ROR WORK + 7 
1298 : 66 09 __ ROR WORK + 6 
129a : 4a __ __ LSR
129b : f0 0d __ BEQ $12aa ; (crt_fmul8 + 45)
129d : b0 e2 __ BCS $1281 ; (crt_fmul8 + 4)
129f : 66 0b __ ROR WORK + 8 
12a1 : 66 0a __ ROR WORK + 7 
12a3 : 66 09 __ ROR WORK + 6 
12a5 : 4a __ __ LSR
12a6 : 90 f7 __ BCC $129f ; (crt_fmul8 + 34)
12a8 : d0 d7 __ BNE $1281 ; (crt_fmul8 + 4)
12aa : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
12ab : a5 1c __ LDA ACCU + 1 
12ad : d0 31 __ BNE $12e0 ; (divmod + 53)
12af : a5 04 __ LDA WORK + 1 
12b1 : d0 1e __ BNE $12d1 ; (divmod + 38)
12b3 : 85 06 __ STA WORK + 3 
12b5 : a2 04 __ LDX #$04
12b7 : 06 1b __ ASL ACCU + 0 
12b9 : 2a __ __ ROL
12ba : c5 03 __ CMP WORK + 0 
12bc : 90 02 __ BCC $12c0 ; (divmod + 21)
12be : e5 03 __ SBC WORK + 0 
12c0 : 26 1b __ ROL ACCU + 0 
12c2 : 2a __ __ ROL
12c3 : c5 03 __ CMP WORK + 0 
12c5 : 90 02 __ BCC $12c9 ; (divmod + 30)
12c7 : e5 03 __ SBC WORK + 0 
12c9 : 26 1b __ ROL ACCU + 0 
12cb : ca __ __ DEX
12cc : d0 eb __ BNE $12b9 ; (divmod + 14)
12ce : 85 05 __ STA WORK + 2 
12d0 : 60 __ __ RTS
12d1 : a5 1b __ LDA ACCU + 0 
12d3 : 85 05 __ STA WORK + 2 
12d5 : a5 1c __ LDA ACCU + 1 
12d7 : 85 06 __ STA WORK + 3 
12d9 : a9 00 __ LDA #$00
12db : 85 1b __ STA ACCU + 0 
12dd : 85 1c __ STA ACCU + 1 
12df : 60 __ __ RTS
12e0 : a5 04 __ LDA WORK + 1 
12e2 : d0 1f __ BNE $1303 ; (divmod + 88)
12e4 : a5 03 __ LDA WORK + 0 
12e6 : 30 1b __ BMI $1303 ; (divmod + 88)
12e8 : a9 00 __ LDA #$00
12ea : 85 06 __ STA WORK + 3 
12ec : a2 10 __ LDX #$10
12ee : 06 1b __ ASL ACCU + 0 
12f0 : 26 1c __ ROL ACCU + 1 
12f2 : 2a __ __ ROL
12f3 : c5 03 __ CMP WORK + 0 
12f5 : 90 02 __ BCC $12f9 ; (divmod + 78)
12f7 : e5 03 __ SBC WORK + 0 
12f9 : 26 1b __ ROL ACCU + 0 
12fb : 26 1c __ ROL ACCU + 1 
12fd : ca __ __ DEX
12fe : d0 f2 __ BNE $12f2 ; (divmod + 71)
1300 : 85 05 __ STA WORK + 2 
1302 : 60 __ __ RTS
1303 : a9 00 __ LDA #$00
1305 : 85 05 __ STA WORK + 2 
1307 : 85 06 __ STA WORK + 3 
1309 : 84 02 __ STY $02 
130b : a0 10 __ LDY #$10
130d : 18 __ __ CLC
130e : 26 1b __ ROL ACCU + 0 
1310 : 26 1c __ ROL ACCU + 1 
1312 : 26 05 __ ROL WORK + 2 
1314 : 26 06 __ ROL WORK + 3 
1316 : 38 __ __ SEC
1317 : a5 05 __ LDA WORK + 2 
1319 : e5 03 __ SBC WORK + 0 
131b : aa __ __ TAX
131c : a5 06 __ LDA WORK + 3 
131e : e5 04 __ SBC WORK + 1 
1320 : 90 04 __ BCC $1326 ; (divmod + 123)
1322 : 86 05 __ STX WORK + 2 
1324 : 85 06 __ STA WORK + 3 
1326 : 88 __ __ DEY
1327 : d0 e5 __ BNE $130e ; (divmod + 99)
1329 : 26 1b __ ROL ACCU + 0 
132b : 26 1c __ ROL ACCU + 1 
132d : a4 02 __ LDY $02 
132f : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1330 : 20 d5 10 JSR $10d5 ; (freg + 36)
1333 : a5 07 __ LDA WORK + 4 
1335 : c9 7f __ CMP #$7f
1337 : b0 07 __ BCS $1340 ; (f32_to_i16 + 16)
1339 : a9 00 __ LDA #$00
133b : 85 1b __ STA ACCU + 0 
133d : 85 1c __ STA ACCU + 1 
133f : 60 __ __ RTS
1340 : e9 8e __ SBC #$8e
1342 : 90 16 __ BCC $135a ; (f32_to_i16 + 42)
1344 : 24 1e __ BIT ACCU + 3 
1346 : 30 09 __ BMI $1351 ; (f32_to_i16 + 33)
1348 : a9 ff __ LDA #$ff
134a : 85 1b __ STA ACCU + 0 
134c : a9 7f __ LDA #$7f
134e : 85 1c __ STA ACCU + 1 
1350 : 60 __ __ RTS
1351 : a9 00 __ LDA #$00
1353 : 85 1b __ STA ACCU + 0 
1355 : a9 80 __ LDA #$80
1357 : 85 1c __ STA ACCU + 1 
1359 : 60 __ __ RTS
135a : aa __ __ TAX
135b : a5 1c __ LDA ACCU + 1 
135d : 46 1d __ LSR ACCU + 2 
135f : 6a __ __ ROR
1360 : e8 __ __ INX
1361 : d0 fa __ BNE $135d ; (f32_to_i16 + 45)
1363 : 24 1e __ BIT ACCU + 3 
1365 : 10 0e __ BPL $1375 ; (f32_to_i16 + 69)
1367 : 38 __ __ SEC
1368 : 49 ff __ EOR #$ff
136a : 69 00 __ ADC #$00
136c : 85 1b __ STA ACCU + 0 
136e : a9 00 __ LDA #$00
1370 : e5 1d __ SBC ACCU + 2 
1372 : 85 1c __ STA ACCU + 1 
1374 : 60 __ __ RTS
1375 : 85 1b __ STA ACCU + 0 
1377 : a5 1d __ LDA ACCU + 2 
1379 : 85 1c __ STA ACCU + 1 
137b : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
137c : 24 1c __ BIT ACCU + 1 
137e : 30 03 __ BMI $1383 ; (sint16_to_float + 7)
1380 : 4c 9a 13 JMP $139a ; (uint16_to_float + 0)
1383 : 38 __ __ SEC
1384 : a9 00 __ LDA #$00
1386 : e5 1b __ SBC ACCU + 0 
1388 : 85 1b __ STA ACCU + 0 
138a : a9 00 __ LDA #$00
138c : e5 1c __ SBC ACCU + 1 
138e : 85 1c __ STA ACCU + 1 
1390 : 20 9a 13 JSR $139a ; (uint16_to_float + 0)
1393 : a5 1e __ LDA ACCU + 3 
1395 : 09 80 __ ORA #$80
1397 : 85 1e __ STA ACCU + 3 
1399 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
139a : a5 1b __ LDA ACCU + 0 
139c : 05 1c __ ORA ACCU + 1 
139e : d0 05 __ BNE $13a5 ; (uint16_to_float + 11)
13a0 : 85 1d __ STA ACCU + 2 
13a2 : 85 1e __ STA ACCU + 3 
13a4 : 60 __ __ RTS
13a5 : a2 8e __ LDX #$8e
13a7 : a5 1c __ LDA ACCU + 1 
13a9 : 30 06 __ BMI $13b1 ; (uint16_to_float + 23)
13ab : ca __ __ DEX
13ac : 06 1b __ ASL ACCU + 0 
13ae : 2a __ __ ROL
13af : 10 fa __ BPL $13ab ; (uint16_to_float + 17)
13b1 : 0a __ __ ASL
13b2 : 85 1d __ STA ACCU + 2 
13b4 : a5 1b __ LDA ACCU + 0 
13b6 : 85 1c __ STA ACCU + 1 
13b8 : 8a __ __ TXA
13b9 : 4a __ __ LSR
13ba : 85 1e __ STA ACCU + 3 
13bc : a9 00 __ LDA #$00
13be : 85 1b __ STA ACCU + 0 
13c0 : 66 1d __ ROR ACCU + 2 
13c2 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
13c3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seed:
13c4 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ExhaustColor:
13c6 : __ __ __ BYT 07 01 08 0e                                     : ....
--------------------------------------------------------------------
vspriteScreen:
13ca : __ __ __ BSS	2
--------------------------------------------------------------------
TheGame:
13cc : __ __ __ BSS	18
--------------------------------------------------------------------
joyy:
13de : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
13e0 : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
13e2 : __ __ __ BSS	2
--------------------------------------------------------------------
landersprites:
1400 : __ __ __ BYT 00 3c 00 00 a8 00 00 a9 00 03 bd c0 03 bd c0 0b : .<..............
1410 : __ __ __ BYT bd c0 0b bd e0 0b bd d0 02 a5 50 01 55 40 01 55 : ..........P.U@.U
1420 : __ __ __ BYT 40 00 00 00 00 95 00 02 aa 80 0a aa a0 0a 00 20 : @.............. 
1430 : __ __ __ BYT 08 24 20 28 24 28 20 24 08 20 00 08 f0 00 00 9f : .$ ($( $. ......
1440 : __ __ __ BYT 00 3c 00 00 c3 00 03 18 c0 05 66 a0 05 42 a0 1d : .<........f..B..
1450 : __ __ __ BYT 42 b8 15 42 a8 15 42 a8 1e 3c 78 04 00 20 04 02 : B..B..B..<x.. ..
1460 : __ __ __ BYT a0 07 ff e0 01 15 80 06 00 60 09 00 90 0b ff d0 : .........`......
1470 : __ __ __ BYT 12 24 48 24 42 24 28 42 14 28 7e 14 fe 00 7f 00 : .$H$B$(B.(~.....
1480 : __ __ __ BYT 03 ff c0 04 e7 20 09 a5 90 01 a5 80 01 a5 80 01 : ..... ..........
1490 : __ __ __ BYT e7 80 00 ff 00 00 e7 00 00 7e 00 00 3c 00 00 3c : .........~..<..<
14a0 : __ __ __ BYT 00 00 18 00 00 18 00 00 18 00 00 00 00 00 18 00 : ................
14b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 01 : ................
--------------------------------------------------------------------
bitshift:
14c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
14d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
14e0 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
14f0 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
