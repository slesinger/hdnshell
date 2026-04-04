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
080e : 8e 01 18 STX $1801 ; (spentry + 0)
0811 : a2 28 __ LDX #$28
0813 : a0 63 __ LDY #$63
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 28 __ CPX #$28
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 d6 __ CPY #$d6
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 e3 __ LDA #$e3
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
; 618, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s1:
0880 : a5 53 __ LDA T1 + 0 
0882 : 8d e5 9f STA $9fe5 ; (main@stack + 0)
.s4:
0885 : 20 4e 09 JSR $094e ; (mmap_trampoline.s4 + 0)
0888 : a9 00 __ LDA #$00
088a : 85 11 __ STA P4 
088c : 85 0d __ STA P0 
088e : a9 30 __ LDA #$30
0890 : 85 01 __ STA $01 
0892 : a9 08 __ LDA #$08
0894 : 85 12 __ STA P5 
0896 : a9 18 __ LDA #$18
0898 : 85 10 __ STA P3 
089a : a9 d0 __ LDA #$d0
089c : 85 0e __ STA P1 
089e : a9 02 __ LDA #$02
08a0 : 85 0f __ STA P2 
08a2 : 20 98 09 JSR $0998 ; (memcpy.s4 + 0)
08a5 : a0 00 __ LDY #$00
.l6:
08a7 : b9 02 20 LDA $2002,y ; (spriteset[0] + 0)
08aa : 99 00 d8 STA $d800,y 
08ad : c8 __ __ INY
08ae : d0 f7 __ BNE $08a7 ; (main.l6 + 0)
.s5:
08b0 : 84 10 __ STY P3 
08b2 : 84 0e __ STY P1 
08b4 : a9 36 __ LDA #$36
08b6 : 85 01 __ STA $01 
08b8 : a9 01 __ LDA #$01
08ba : 85 0d __ STA P0 
08bc : a9 c8 __ LDA #$c8
08be : 85 0f __ STA P2 
08c0 : a9 d0 __ LDA #$d0
08c2 : 85 11 __ STA P4 
08c4 : 20 c7 09 JSR $09c7 ; (vic_setmode.s4 + 0)
08c7 : a9 00 __ LDA #$00
08c9 : 8d ff 9f STA $9fff ; (sstack + 10)
08cc : 8d 20 d0 STA $d020 
08cf : 8d 21 d0 STA $d021 
08d2 : a2 01 __ LDX #$01
08d4 : 8e 22 d0 STX $d022 
08d7 : a9 0b __ LDA #$0b
08d9 : 8d 23 d0 STA $d023 
08dc : 8d 25 d0 STA $d025 
08df : 8e 26 d0 STX $d026 
08e2 : a9 f8 __ LDA #$f8
08e4 : 8d 63 28 STA $2863 ; (vspriteScreen + 0)
08e7 : a9 cb __ LDA #$cb
08e9 : 8d 64 28 STA $2864 ; (vspriteScreen + 1)
08ec : a9 60 __ LDA #$60
08ee : a2 fa __ LDX #$fa
.l8:
08f0 : ca __ __ DEX
08f1 : 9d 00 c8 STA $c800,x 
08f4 : 9d fa c8 STA $c8fa,x 
08f7 : 9d f4 c9 STA $c9f4,x 
08fa : 9d ee ca STA $caee,x 
08fd : d0 f1 __ BNE $08f0 ; (main.l8 + 0)
.s7:
08ff : a9 0f __ LDA #$0f
0901 : a2 fa __ LDX #$fa
.l10:
0903 : ca __ __ DEX
0904 : 9d 00 d8 STA $d800,x 
0907 : 9d fa d8 STA $d8fa,x 
090a : 9d f4 d9 STA $d9f4,x 
090d : 9d ee da STA $daee,x 
0910 : d0 f1 __ BNE $0903 ; (main.l10 + 0)
.s9:
0912 : 20 19 0a JSR $0a19 ; (game_state.s4 + 0)
0915 : a9 0f __ LDA #$0f
0917 : 8d 18 d4 STA $d418 
.l11:
091a : 20 f0 0d JSR $0df0 ; (brick_animate.s4 + 0)
091d : 20 56 0f JSR $0f56 ; (game_loop.s1 + 0)
0920 : 20 25 16 JSR $1625 ; (sound_loop.s4 + 0)
.l12:
0923 : 2c 11 d0 BIT $d011 
0926 : 30 fb __ BMI $0923 ; (main.l12 + 0)
.l13:
0928 : 2c 11 d0 BIT $d011 
092b : 10 fb __ BPL $0928 ; (main.l13 + 0)
.s14:
092d : a9 00 __ LDA #$00
.l15:
092f : 85 53 __ STA T1 + 0 
0931 : 18 __ __ CLC
0932 : 69 66 __ ADC #$66
0934 : 85 0d __ STA P0 
0936 : a9 28 __ LDA #$28
0938 : 69 00 __ ADC #$00
093a : 85 0e __ STA P1 
093c : 20 a2 16 JSR $16a2 ; (ball_move.s4 + 0)
093f : 18 __ __ CLC
0940 : a5 53 __ LDA T1 + 0 
0942 : 69 0a __ ADC #$0a
0944 : c9 1e __ CMP #$1e
0946 : d0 e7 __ BNE $092f ; (main.l15 + 0)
.s16:
0948 : 20 3f 17 JSR $173f ; (paddle_move.s4 + 0)
094b : 4c 1a 09 JMP $091a ; (main.l11 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
094e : a9 63 __ LDA #$63
0950 : 8d fa ff STA $fffa 
0953 : a9 09 __ LDA #$09
0955 : 8d fb ff STA $fffb 
0958 : a9 81 __ LDA #$81
095a : 8d fe ff STA $fffe 
095d : a9 09 __ LDA #$09
095f : 8d ff ff STA $ffff 
.s3:
0962 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0963 : 48 __ __ PHA
0964 : 8a __ __ TXA
0965 : 48 __ __ PHA
0966 : a9 09 __ LDA #$09
0968 : 48 __ __ PHA
0969 : a9 7a __ LDA #$7a
096b : 48 __ __ PHA
096c : ba __ __ TSX
096d : bd 05 01 LDA $0105,x 
0970 : 48 __ __ PHA
0971 : a6 01 __ LDX $01 
0973 : a9 36 __ LDA #$36
0975 : 85 01 __ STA $01 
0977 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
097a : 86 01 __ STX $01 
097c : 68 __ __ PLA
097d : aa __ __ TAX
097e : 68 __ __ PLA
097f : 40 __ __ RTI
0980 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0981 : 48 __ __ PHA
0982 : 8a __ __ TXA
0983 : 48 __ __ PHA
0984 : a9 09 __ LDA #$09
0986 : 48 __ __ PHA
0987 : a9 7a __ LDA #$7a
0989 : 48 __ __ PHA
098a : ba __ __ TSX
098b : bd 05 01 LDA $0105,x 
098e : 48 __ __ PHA
098f : a6 01 __ LDX $01 
0991 : a9 36 __ LDA #$36
0993 : 85 01 __ STA $01 
0995 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void*
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0998 : a6 12 __ LDX P5 
099a : f0 10 __ BEQ $09ac ; (memcpy.s4 + 20)
099c : a0 00 __ LDY #$00
099e : b1 0f __ LDA (P2),y 
09a0 : 91 0d __ STA (P0),y ; (dst + 0)
09a2 : c8 __ __ INY
09a3 : d0 f9 __ BNE $099e ; (memcpy.s4 + 6)
09a5 : e6 10 __ INC P3 
09a7 : e6 0e __ INC P1 ; (dst + 1)
09a9 : ca __ __ DEX
09aa : d0 f2 __ BNE $099e ; (memcpy.s4 + 6)
09ac : a4 11 __ LDY P4 
09ae : f0 0e __ BEQ $09be ; (memcpy.s4 + 38)
09b0 : 88 __ __ DEY
09b1 : f0 07 __ BEQ $09ba ; (memcpy.s4 + 34)
09b3 : b1 0f __ LDA (P2),y 
09b5 : 91 0d __ STA (P0),y ; (dst + 0)
09b7 : 88 __ __ DEY
09b8 : d0 f9 __ BNE $09b3 ; (memcpy.s4 + 27)
09ba : b1 0f __ LDA (P2),y 
09bc : 91 0d __ STA (P0),y ; (dst + 0)
09be : a5 0d __ LDA P0 ; (dst + 0)
09c0 : 85 1b __ STA ACCU + 0 
09c2 : a5 0e __ LDA P1 ; (dst + 1)
09c4 : 85 1c __ STA ACCU + 1 
.s3:
09c6 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
09c7 : a4 0d __ LDY P0 ; (mode + 0)
09c9 : c0 02 __ CPY #$02
09cb : d0 09 __ BNE $09d6 ; (vic_setmode.s5 + 0)
.s10:
09cd : a9 5b __ LDA #$5b
09cf : 8d 11 d0 STA $d011 
.s8:
09d2 : a9 08 __ LDA #$08
09d4 : d0 0c __ BNE $09e2 ; (vic_setmode.s7 + 0)
.s5:
09d6 : b0 36 __ BCS $0a0e ; (vic_setmode.s6 + 0)
.s9:
09d8 : a9 1b __ LDA #$1b
09da : 8d 11 d0 STA $d011 
09dd : 98 __ __ TYA
09de : f0 f2 __ BEQ $09d2 ; (vic_setmode.s8 + 0)
.s11:
09e0 : a9 18 __ LDA #$18
.s7:
09e2 : 8d 16 d0 STA $d016 
09e5 : ad 00 dd LDA $dd00 
09e8 : 29 fc __ AND #$fc
09ea : 85 1b __ STA ACCU + 0 
09ec : a5 0f __ LDA P2 ; (text + 1)
09ee : 0a __ __ ASL
09ef : 2a __ __ ROL
09f0 : 29 01 __ AND #$01
09f2 : 2a __ __ ROL
09f3 : 49 03 __ EOR #$03
09f5 : 05 1b __ ORA ACCU + 0 
09f7 : 8d 00 dd STA $dd00 
09fa : a5 0f __ LDA P2 ; (text + 1)
09fc : 29 3c __ AND #$3c
09fe : 0a __ __ ASL
09ff : 0a __ __ ASL
0a00 : 85 1b __ STA ACCU + 0 
0a02 : a5 11 __ LDA P4 ; (font + 1)
0a04 : 29 38 __ AND #$38
0a06 : 4a __ __ LSR
0a07 : 4a __ __ LSR
0a08 : 05 1b __ ORA ACCU + 0 
0a0a : 8d 18 d0 STA $d018 
.s3:
0a0d : 60 __ __ RTS
.s6:
0a0e : a9 3b __ LDA #$3b
0a10 : 8d 11 d0 STA $d011 
0a13 : c0 03 __ CPY #$03
0a15 : d0 c9 __ BNE $09e0 ; (vic_setmode.s11 + 0)
0a17 : f0 b9 __ BEQ $09d2 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
game_state: ; game_state(enum GameState)->void
; 540, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
0a19 : ad ff 9f LDA $9fff ; (sstack + 10)
0a1c : 8d 65 28 STA $2865 ; (TheGame.state + 0)
0a1f : c9 02 __ CMP #$02
0a21 : d0 52 __ BNE $0a75 ; (game_state.s5 + 0)
.s13:
0a23 : a9 ff __ LDA #$ff
0a25 : 8d 6f 28 STA $286f ; (TheGame.balls[0].vy + 1)
0a28 : 8d 79 28 STA $2879 ; (TheGame.balls[0] + 19)
0a2b : 8d 83 28 STA $2883 ; (TheGame.balls[0] + 29)
0a2e : a9 a0 __ LDA #$a0
0a30 : 8d 6e 28 STA $286e ; (TheGame.balls[0].vy + 0)
0a33 : a9 90 __ LDA #$90
0a35 : 8d 78 28 STA $2878 ; (TheGame.balls[0] + 18)
0a38 : 8d 82 28 STA $2882 ; (TheGame.balls[0] + 28)
0a3b : ad 85 28 LDA $2885 ; (paddlevx + 0)
0a3e : 85 43 __ STA T0 + 0 
0a40 : ad 86 28 LDA $2886 ; (paddlevx + 1)
0a43 : 4a __ __ LSR
0a44 : 66 43 __ ROR T0 + 0 
0a46 : 4a __ __ LSR
0a47 : 66 43 __ ROR T0 + 0 
0a49 : 49 20 __ EOR #$20
0a4b : 38 __ __ SEC
0a4c : e9 20 __ SBC #$20
0a4e : 8d 6d 28 STA $286d ; (TheGame.balls[0].vx + 1)
0a51 : a5 43 __ LDA T0 + 0 
0a53 : 8d 6c 28 STA $286c ; (TheGame.balls[0].vx + 0)
0a56 : 38 __ __ SEC
0a57 : e9 10 __ SBC #$10
0a59 : 8d 76 28 STA $2876 ; (TheGame.balls[0] + 16)
0a5c : ad 6d 28 LDA $286d ; (TheGame.balls[0].vx + 1)
0a5f : e9 00 __ SBC #$00
0a61 : 8d 77 28 STA $2877 ; (TheGame.balls[0] + 17)
0a64 : 18 __ __ CLC
0a65 : a5 43 __ LDA T0 + 0 
0a67 : 69 10 __ ADC #$10
0a69 : 8d 80 28 STA $2880 ; (TheGame.balls[0] + 26)
0a6c : ad 6d 28 LDA $286d ; (TheGame.balls[0].vx + 1)
0a6f : 69 00 __ ADC #$00
0a71 : 8d 81 28 STA $2881 ; (TheGame.balls[0] + 27)
0a74 : 60 __ __ RTS
.s5:
0a75 : 90 12 __ BCC $0a89 ; (game_state.s10 + 0)
.s6:
0a77 : c9 03 __ CMP #$03
0a79 : d0 06 __ BNE $0a81 ; (game_state.s7 + 0)
.s9:
0a7b : a9 3c __ LDA #$3c
.s14:
0a7d : 8d 84 28 STA $2884 ; (TheGame.count + 0)
.s3:
0a80 : 60 __ __ RTS
.s7:
0a81 : c9 04 __ CMP #$04
0a83 : d0 fb __ BNE $0a80 ; (game_state.s3 + 0)
.s8:
0a85 : a9 78 __ LDA #$78
0a87 : d0 f4 __ BNE $0a7d ; (game_state.s14 + 0)
.s10:
0a89 : aa __ __ TAX
0a8a : d0 09 __ BNE $0a95 ; (game_state.s12 + 0)
.s11:
0a8c : 20 2c 0b JSR $0b2c ; (brick_init.s4 + 0)
0a8f : 20 6b 0c JSR $0c6b ; (paddle_init.s4 + 0)
0a92 : 4c 85 0a JMP $0a85 ; (game_state.s8 + 0)
.s12:
0a95 : a9 00 __ LDA #$00
0a97 : 85 18 __ STA P11 
0a99 : 8d f9 9f STA $9ff9 ; (sstack + 4)
0a9c : 8d fb 9f STA $9ffb ; (sstack + 6)
0a9f : 8d fc 9f STA $9ffc ; (sstack + 7)
0aa2 : 8d fd 9f STA $9ffd ; (sstack + 8)
0aa5 : 8d fe 9f STA $9ffe ; (sstack + 9)
0aa8 : a9 2e __ LDA #$2e
0aaa : 8d fa 9f STA $9ffa ; (sstack + 5)
0aad : ad 87 28 LDA $2887 ; (paddlex + 0)
0ab0 : 69 80 __ ADC #$80
0ab2 : 85 4b __ STA T1 + 0 
0ab4 : 8d f7 9f STA $9ff7 ; (sstack + 2)
0ab7 : a9 66 __ LDA #$66
0ab9 : 8d f5 9f STA $9ff5 ; (sstack + 0)
0abc : a9 28 __ LDA #$28
0abe : 8d f6 9f STA $9ff6 ; (sstack + 1)
0ac1 : ad 88 28 LDA $2888 ; (paddlex + 1)
0ac4 : 69 05 __ ADC #$05
0ac6 : 85 4c __ STA T1 + 1 
0ac8 : 8d f8 9f STA $9ff8 ; (sstack + 3)
0acb : 20 39 0d JSR $0d39 ; (ball_init.s4 + 0)
0ace : e6 18 __ INC P11 
0ad0 : a5 4b __ LDA T1 + 0 
0ad2 : 8d f7 9f STA $9ff7 ; (sstack + 2)
0ad5 : a5 4c __ LDA T1 + 1 
0ad7 : 8d f8 9f STA $9ff8 ; (sstack + 3)
0ada : a9 00 __ LDA #$00
0adc : 8d f9 9f STA $9ff9 ; (sstack + 4)
0adf : 8d fb 9f STA $9ffb ; (sstack + 6)
0ae2 : 8d fc 9f STA $9ffc ; (sstack + 7)
0ae5 : 8d fd 9f STA $9ffd ; (sstack + 8)
0ae8 : 8d fe 9f STA $9ffe ; (sstack + 9)
0aeb : a9 2e __ LDA #$2e
0aed : 8d fa 9f STA $9ffa ; (sstack + 5)
0af0 : a9 70 __ LDA #$70
0af2 : 8d f5 9f STA $9ff5 ; (sstack + 0)
0af5 : a9 28 __ LDA #$28
0af7 : 8d f6 9f STA $9ff6 ; (sstack + 1)
0afa : 20 39 0d JSR $0d39 ; (ball_init.s4 + 0)
0afd : e6 18 __ INC P11 
0aff : a5 4b __ LDA T1 + 0 
0b01 : 8d f7 9f STA $9ff7 ; (sstack + 2)
0b04 : a5 4c __ LDA T1 + 1 
0b06 : 8d f8 9f STA $9ff8 ; (sstack + 3)
0b09 : a9 00 __ LDA #$00
0b0b : 8d f9 9f STA $9ff9 ; (sstack + 4)
0b0e : 8d fb 9f STA $9ffb ; (sstack + 6)
0b11 : 8d fc 9f STA $9ffc ; (sstack + 7)
0b14 : 8d fd 9f STA $9ffd ; (sstack + 8)
0b17 : 8d fe 9f STA $9ffe ; (sstack + 9)
0b1a : a9 2e __ LDA #$2e
0b1c : 8d fa 9f STA $9ffa ; (sstack + 5)
0b1f : a9 7a __ LDA #$7a
0b21 : 8d f5 9f STA $9ff5 ; (sstack + 0)
0b24 : a9 28 __ LDA #$28
0b26 : 8d f6 9f STA $9ff6 ; (sstack + 1)
0b29 : 4c 39 0d JMP $0d39 ; (ball_init.s4 + 0)
--------------------------------------------------------------------
brick_init: ; brick_init()->void
; 128, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
0b2c : a9 c8 __ LDA #$c8
0b2e : 85 48 __ STA T1 + 1 
0b30 : a9 00 __ LDA #$00
0b32 : 85 47 __ STA T1 + 0 
0b34 : aa __ __ TAX
.l5:
0b35 : 29 01 __ AND #$01
0b37 : 0a __ __ ASL
0b38 : 85 49 __ STA T2 + 0 
0b3a : a0 00 __ LDY #$00
.l9:
0b3c : 98 __ __ TYA
0b3d : 29 01 __ AND #$01
0b3f : 09 60 __ ORA #$60
0b41 : 18 __ __ CLC
0b42 : 65 49 __ ADC T2 + 0 
0b44 : 91 47 __ STA (T1 + 0),y 
0b46 : c8 __ __ INY
0b47 : c0 28 __ CPY #$28
0b49 : d0 f1 __ BNE $0b3c ; (brick_init.l9 + 0)
.s6:
0b4b : 18 __ __ CLC
0b4c : a5 47 __ LDA T1 + 0 
0b4e : 69 28 __ ADC #$28
0b50 : 85 47 __ STA T1 + 0 
0b52 : 90 02 __ BCC $0b56 ; (brick_init.s13 + 0)
.s12:
0b54 : e6 48 __ INC T1 + 1 
.s13:
0b56 : e8 __ __ INX
0b57 : 8a __ __ TXA
0b58 : e0 19 __ CPX #$19
0b5a : d0 d9 __ BNE $0b35 ; (brick_init.l5 + 0)
.s7:
0b5c : 20 9e 0b JSR $0b9e ; (status_init.s4 + 0)
0b5f : a9 00 __ LDA #$00
0b61 : 85 47 __ STA T1 + 0 
0b63 : a9 08 __ LDA #$08
0b65 : 85 49 __ STA T2 + 0 
.l8:
0b67 : a5 47 __ LDA T1 + 0 
0b69 : 0a __ __ ASL
0b6a : 09 01 __ ORA #$01
0b6c : 85 0e __ STA P1 
0b6e : a5 49 __ LDA T2 + 0 
0b70 : 85 10 __ STA P3 
0b72 : a9 02 __ LDA #$02
0b74 : 85 0d __ STA P0 
0b76 : a9 00 __ LDA #$00
0b78 : 85 4a __ STA T4 + 0 
.l11:
0b7a : 29 0c __ AND #$0c
0b7c : 09 40 __ ORA #$40
0b7e : 0a __ __ ASL
0b7f : 85 0f __ STA P2 
0b81 : 20 b5 0b JSR $0bb5 ; (brick_put.s4 + 0)
0b84 : 18 __ __ CLC
0b85 : a5 0d __ LDA P0 
0b87 : 69 03 __ ADC #$03
0b89 : 85 0d __ STA P0 
0b8b : e6 4a __ INC T4 + 0 
0b8d : a5 4a __ LDA T4 + 0 
0b8f : c9 0c __ CMP #$0c
0b91 : d0 e7 __ BNE $0b7a ; (brick_init.l11 + 0)
.s10:
0b93 : e6 47 __ INC T1 + 0 
0b95 : e6 49 __ INC T2 + 0 
0b97 : a5 49 __ LDA T2 + 0 
0b99 : c9 10 __ CMP #$10
0b9b : d0 ca __ BNE $0b67 ; (brick_init.l8 + 0)
.s3:
0b9d : 60 __ __ RTS
--------------------------------------------------------------------
status_init: ; status_init()->void
;  32, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
0b9e : a0 00 __ LDY #$00
.l7:
0ba0 : b9 02 28 LDA $2802,y ; (StatusText[0] + 0)
0ba3 : c9 20 __ CMP #$20
0ba5 : f0 08 __ BEQ $0baf ; (status_init.s5 + 0)
.s6:
0ba7 : 99 00 c8 STA $c800,y 
0baa : a9 07 __ LDA #$07
0bac : 99 00 d8 STA $d800,y 
.s5:
0baf : c8 __ __ INY
0bb0 : c0 28 __ CPY #$28
0bb2 : 90 ec __ BCC $0ba0 ; (status_init.l7 + 0)
.s3:
0bb4 : 60 __ __ RTS
--------------------------------------------------------------------
brick_put: ; brick_put(u8,u8,u8,u8)->void
;  98, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
0bb5 : a5 0e __ LDA P1 ; (y + 0)
0bb7 : 0a __ __ ASL
0bb8 : 85 1b __ STA ACCU + 0 
0bba : a9 00 __ LDA #$00
0bbc : 2a __ __ ROL
0bbd : 06 1b __ ASL ACCU + 0 
0bbf : 2a __ __ ROL
0bc0 : aa __ __ TAX
0bc1 : a5 1b __ LDA ACCU + 0 
0bc3 : 65 0e __ ADC P1 ; (y + 0)
0bc5 : 85 43 __ STA T2 + 0 
0bc7 : 8a __ __ TXA
0bc8 : 69 00 __ ADC #$00
0bca : 06 43 __ ASL T2 + 0 
0bcc : 2a __ __ ROL
0bcd : 06 43 __ ASL T2 + 0 
0bcf : 2a __ __ ROL
0bd0 : 06 43 __ ASL T2 + 0 
0bd2 : 2a __ __ ROL
0bd3 : 69 d8 __ ADC #$d8
0bd5 : 85 44 __ STA T2 + 1 
0bd7 : 18 __ __ CLC
0bd8 : a5 43 __ LDA T2 + 0 
0bda : 65 0d __ ADC P0 ; (x + 0)
0bdc : 85 45 __ STA T3 + 0 
0bde : aa __ __ TAX
0bdf : a5 44 __ LDA T2 + 1 
0be1 : 69 00 __ ADC #$00
0be3 : 85 46 __ STA T3 + 1 
0be5 : a9 0f __ LDA #$0f
0be7 : a0 51 __ LDY #$51
0be9 : 91 45 __ STA (T3 + 0),y 
0beb : c8 __ __ INY
0bec : 91 45 __ STA (T3 + 0),y 
0bee : c8 __ __ INY
0bef : 91 45 __ STA (T3 + 0),y 
0bf1 : a5 10 __ LDA P3 ; (c + 0)
0bf3 : a4 0d __ LDY P0 ; (x + 0)
0bf5 : 91 43 __ STA (T2 + 0),y 
0bf7 : c8 __ __ INY
0bf8 : 91 43 __ STA (T2 + 0),y 
0bfa : c8 __ __ INY
0bfb : 91 43 __ STA (T2 + 0),y 
0bfd : 86 43 __ STX T2 + 0 
0bff : a0 28 __ LDY #$28
0c01 : 91 45 __ STA (T3 + 0),y 
0c03 : c8 __ __ INY
0c04 : 91 45 __ STA (T3 + 0),y 
0c06 : c8 __ __ INY
0c07 : 91 45 __ STA (T3 + 0),y 
0c09 : 18 __ __ CLC
0c0a : a5 46 __ LDA T3 + 1 
0c0c : 69 f0 __ ADC #$f0
0c0e : 85 44 __ STA T2 + 1 
0c10 : a6 0f __ LDX P2 ; (b + 0)
0c12 : 8a __ __ TXA
0c13 : a0 00 __ LDY #$00
0c15 : 91 43 __ STA (T2 + 0),y 
0c17 : 09 01 __ ORA #$01
0c19 : c8 __ __ INY
0c1a : 91 43 __ STA (T2 + 0),y 
0c1c : 8a __ __ TXA
0c1d : 09 02 __ ORA #$02
0c1f : c8 __ __ INY
0c20 : 91 43 __ STA (T2 + 0),y 
0c22 : 8a __ __ TXA
0c23 : 09 03 __ ORA #$03
0c25 : a0 28 __ LDY #$28
0c27 : 91 43 __ STA (T2 + 0),y 
0c29 : 8a __ __ TXA
0c2a : 09 04 __ ORA #$04
0c2c : c8 __ __ INY
0c2d : 91 43 __ STA (T2 + 0),y 
0c2f : 8a __ __ TXA
0c30 : 09 05 __ ORA #$05
0c32 : c8 __ __ INY
0c33 : 91 43 __ STA (T2 + 0),y 
0c35 : a5 0d __ LDA P0 ; (x + 0)
0c37 : 29 01 __ AND #$01
0c39 : 85 1b __ STA ACCU + 0 
0c3b : 49 ff __ EOR #$ff
0c3d : 18 __ __ CLC
0c3e : 69 68 __ ADC #$68
0c40 : 85 45 __ STA T3 + 0 
0c42 : a5 0e __ LDA P1 ; (y + 0)
0c44 : 29 01 __ AND #$01
0c46 : 0a __ __ ASL
0c47 : 85 1c __ STA ACCU + 1 
0c49 : 49 ff __ EOR #$ff
0c4b : 38 __ __ SEC
0c4c : 65 45 __ ADC T3 + 0 
0c4e : c8 __ __ INY
0c4f : 91 43 __ STA (T2 + 0),y 
0c51 : 38 __ __ SEC
0c52 : a9 65 __ LDA #$65
0c54 : e5 1b __ SBC ACCU + 0 
0c56 : 18 __ __ CLC
0c57 : 65 1c __ ADC ACCU + 1 
0c59 : a0 51 __ LDY #$51
0c5b : 91 43 __ STA (T2 + 0),y 
0c5d : a0 53 __ LDY #$53
0c5f : 91 43 __ STA (T2 + 0),y 
0c61 : a5 1b __ LDA ACCU + 0 
0c63 : 09 64 __ ORA #$64
0c65 : 05 1c __ ORA ACCU + 1 
0c67 : 88 __ __ DEY
0c68 : 91 43 __ STA (T2 + 0),y 
.s3:
0c6a : 60 __ __ RTS
--------------------------------------------------------------------
paddle_init: ; paddle_init()->void
; 496, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
0c6b : a9 00 __ LDA #$00
0c6d : 85 0d __ STA P0 
0c6f : 85 10 __ STA P3 
0c71 : 85 12 __ STA P5 
0c73 : 85 14 __ STA P7 
0c75 : 85 15 __ STA P8 
0c77 : 85 17 __ STA P10 
0c79 : a9 01 __ LDA #$01
0c7b : 85 0e __ STA P1 
0c7d : 85 16 __ STA P9 
0c7f : a9 00 __ LDA #$00
0c81 : 8d 87 28 STA $2887 ; (paddlex + 0)
0c84 : 8d 85 28 STA $2885 ; (paddlevx + 0)
0c87 : 8d 86 28 STA $2886 ; (paddlevx + 1)
0c8a : a9 b8 __ LDA #$b8
0c8c : 85 0f __ STA P2 
0c8e : a9 f0 __ LDA #$f0
0c90 : 85 11 __ STA P4 
0c92 : a9 63 __ LDA #$63
0c94 : 85 13 __ STA P6 
0c96 : a9 28 __ LDA #$28
0c98 : 8d 88 28 STA $2888 ; (paddlex + 1)
0c9b : 20 af 0c JSR $0caf ; (spr_set.s4 + 0)
0c9e : e6 0d __ INC P0 
0ca0 : e6 15 __ INC P8 
0ca2 : c6 13 __ DEC P6 
0ca4 : a9 00 __ LDA #$00
0ca6 : 85 10 __ STA P3 
0ca8 : a9 0f __ LDA #$0f
0caa : 85 14 __ STA P7 
0cac : 4c af 0c JMP $0caf ; (spr_set.s4 + 0)
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0caf : a6 0d __ LDX P0 ; (sp + 0)
0cb1 : bc 33 28 LDY $2833,x ; (bitshift[0] + 8)
0cb4 : a5 0e __ LDA P1 ; (show + 0)
0cb6 : d0 09 __ BNE $0cc1 ; (spr_set.s19 + 0)
.s5:
0cb8 : 98 __ __ TYA
0cb9 : 49 ff __ EOR #$ff
0cbb : 2d 15 d0 AND $d015 
0cbe : 4c c5 0c JMP $0cc5 ; (spr_set.s6 + 0)
.s19:
0cc1 : 98 __ __ TYA
0cc2 : 0d 15 d0 ORA $d015 
.s6:
0cc5 : 8d 15 d0 STA $d015 
0cc8 : a5 15 __ LDA P8 ; (multi + 0)
0cca : d0 09 __ BNE $0cd5 ; (spr_set.s18 + 0)
.s7:
0ccc : 98 __ __ TYA
0ccd : 49 ff __ EOR #$ff
0ccf : 2d 1c d0 AND $d01c 
0cd2 : 4c d9 0c JMP $0cd9 ; (spr_set.s8 + 0)
.s18:
0cd5 : 98 __ __ TYA
0cd6 : 0d 1c d0 ORA $d01c 
.s8:
0cd9 : 8d 1c d0 STA $d01c 
0cdc : a5 16 __ LDA P9 ; (xexpand + 0)
0cde : d0 09 __ BNE $0ce9 ; (spr_set.s17 + 0)
.s9:
0ce0 : 98 __ __ TYA
0ce1 : 49 ff __ EOR #$ff
0ce3 : 2d 1d d0 AND $d01d 
0ce6 : 4c ed 0c JMP $0ced ; (spr_set.s10 + 0)
.s17:
0ce9 : 98 __ __ TYA
0cea : 0d 1d d0 ORA $d01d 
.s10:
0ced : 8d 1d d0 STA $d01d 
0cf0 : a5 17 __ LDA P10 ; (yexpand + 0)
0cf2 : d0 09 __ BNE $0cfd ; (spr_set.s16 + 0)
.s11:
0cf4 : 98 __ __ TYA
0cf5 : 49 ff __ EOR #$ff
0cf7 : 2d 17 d0 AND $d017 
0cfa : 4c 01 0d JMP $0d01 ; (spr_set.s12 + 0)
.s16:
0cfd : 98 __ __ TYA
0cfe : 0d 17 d0 ORA $d017 
.s12:
0d01 : 8d 17 d0 STA $d017 
0d04 : 8a __ __ TXA
0d05 : 0a __ __ ASL
0d06 : aa __ __ TAX
0d07 : a5 11 __ LDA P4 ; (ypos + 0)
0d09 : 9d 01 d0 STA $d001,x 
0d0c : a5 0f __ LDA P2 ; (xpos + 0)
0d0e : 9d 00 d0 STA $d000,x 
0d11 : 46 10 __ LSR P3 ; (xpos + 1)
0d13 : 98 __ __ TYA
0d14 : 90 05 __ BCC $0d1b ; (spr_set.s13 + 0)
.s15:
0d16 : 0d 10 d0 ORA $d010 
0d19 : b0 05 __ BCS $0d20 ; (spr_set.s14 + 0)
.s13:
0d1b : 49 ff __ EOR #$ff
0d1d : 2d 10 d0 AND $d010 
.s14:
0d20 : 8d 10 d0 STA $d010 
0d23 : ad 63 28 LDA $2863 ; (vspriteScreen + 0)
0d26 : 85 1b __ STA ACCU + 0 
0d28 : ad 64 28 LDA $2864 ; (vspriteScreen + 1)
0d2b : 85 1c __ STA ACCU + 1 
0d2d : a5 13 __ LDA P6 ; (image + 0)
0d2f : a4 0d __ LDY P0 ; (sp + 0)
0d31 : 91 1b __ STA (ACCU + 0),y 
0d33 : a5 14 __ LDA P7 ; (color + 0)
0d35 : 99 27 d0 STA $d027,y 
.s3:
0d38 : 60 __ __ RTS
--------------------------------------------------------------------
ball_init: ; ball_init(struct Ball*,u8,i16,i16,i16,i16)->void
; 266, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
0d39 : a9 00 __ LDA #$00
0d3b : 85 14 __ STA P7 
0d3d : 85 15 __ STA P8 
0d3f : 85 16 __ STA P9 
0d41 : 85 17 __ STA P10 
0d43 : a9 61 __ LDA #$61
0d45 : 85 13 __ STA P6 
0d47 : ad f5 9f LDA $9ff5 ; (sstack + 0)
0d4a : 85 1b __ STA ACCU + 0 ; (sx + 0)
0d4c : ad f6 9f LDA $9ff6 ; (sstack + 1)
0d4f : 85 1c __ STA ACCU + 1 ; (sx + 1)
0d51 : a9 01 __ LDA #$01
0d53 : 85 0e __ STA P1 
0d55 : a8 __ __ TAY
0d56 : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d58 : a5 18 __ LDA P11 ; (index + 0)
0d5a : 88 __ __ DEY
0d5b : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d5d : ad f8 9f LDA $9ff8 ; (sstack + 3)
0d60 : 85 44 __ STA T1 + 1 
0d62 : ad f7 9f LDA $9ff7 ; (sstack + 2)
0d65 : 85 43 __ STA T1 + 0 
0d67 : a0 02 __ LDY #$02
0d69 : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d6b : a5 44 __ LDA T1 + 1 
0d6d : c8 __ __ INY
0d6e : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d70 : ad fa 9f LDA $9ffa ; (sstack + 5)
0d73 : 85 46 __ STA T2 + 1 
0d75 : ad f9 9f LDA $9ff9 ; (sstack + 4)
0d78 : 85 45 __ STA T2 + 0 
0d7a : c8 __ __ INY
0d7b : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d7d : a5 46 __ LDA T2 + 1 
0d7f : c8 __ __ INY
0d80 : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d82 : ad fb 9f LDA $9ffb ; (sstack + 6)
0d85 : c8 __ __ INY
0d86 : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d88 : ad fc 9f LDA $9ffc ; (sstack + 7)
0d8b : c8 __ __ INY
0d8c : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d8e : ad fd 9f LDA $9ffd ; (sstack + 8)
0d91 : c8 __ __ INY
0d92 : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d94 : ad fe 9f LDA $9ffe ; (sstack + 9)
0d97 : c8 __ __ INY
0d98 : 91 1b __ STA (ACCU + 0),y ; (sx + 0)
0d9a : 18 __ __ CLC
0d9b : a5 18 __ LDA P11 ; (index + 0)
0d9d : 69 01 __ ADC #$01
0d9f : 0a __ __ ASL
0da0 : 85 0d __ STA P0 
0da2 : 06 43 __ ASL T1 + 0 
0da4 : 26 44 __ ROL T1 + 1 
0da6 : a9 00 __ LDA #$00
0da8 : 69 ff __ ADC #$ff
0daa : 49 ff __ EOR #$ff
0dac : 06 43 __ ASL T1 + 0 
0dae : 26 44 __ ROL T1 + 1 
0db0 : 2a __ __ ROL
0db1 : aa __ __ TAX
0db2 : 18 __ __ CLC
0db3 : a5 44 __ LDA T1 + 1 
0db5 : 69 18 __ ADC #$18
0db7 : 85 0f __ STA P2 
0db9 : 8a __ __ TXA
0dba : 69 00 __ ADC #$00
0dbc : 85 44 __ STA T1 + 1 
0dbe : 85 10 __ STA P3 
0dc0 : 06 45 __ ASL T2 + 0 
0dc2 : 26 46 __ ROL T2 + 1 
0dc4 : a9 00 __ LDA #$00
0dc6 : 69 ff __ ADC #$ff
0dc8 : 49 ff __ EOR #$ff
0dca : 06 45 __ ASL T2 + 0 
0dcc : 26 46 __ ROL T2 + 1 
0dce : 2a __ __ ROL
0dcf : aa __ __ TAX
0dd0 : 18 __ __ CLC
0dd1 : a5 46 __ LDA T2 + 1 
0dd3 : 69 32 __ ADC #$32
0dd5 : 85 11 __ STA P4 
0dd7 : 90 01 __ BCC $0dda ; (ball_init.s6 + 0)
.s5:
0dd9 : e8 __ __ INX
.s6:
0dda : 86 12 __ STX P5 
0ddc : 20 af 0c JSR $0caf ; (spr_set.s4 + 0)
0ddf : a5 44 __ LDA T1 + 1 
0de1 : 85 10 __ STA P3 
0de3 : c6 13 __ DEC P6 
0de5 : e6 15 __ INC P8 
0de7 : a9 0f __ LDA #$0f
0de9 : 85 14 __ STA P7 
0deb : e6 0d __ INC P0 
0ded : 4c af 0c JMP $0caf ; (spr_set.s4 + 0)
--------------------------------------------------------------------
brick_animate: ; brick_animate()->void
; 191, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
0df0 : ad 89 28 LDA $2889 ; (numFlashingBricks[0] + 0)
0df3 : 85 1e __ STA ACCU + 3 
0df5 : d0 49 __ BNE $0e40 ; (brick_animate.s7 + 0)
.s5:
0df7 : a5 1e __ LDA ACCU + 3 
0df9 : 85 1d __ STA ACCU + 2 
0dfb : a2 00 __ LDX #$00
.l28:
0dfd : bd 8a 28 LDA $288a,x ; (numFlashingBricks[0] + 1)
0e00 : 38 __ __ SEC
0e01 : e5 1e __ SBC ACCU + 3 
0e03 : 9d 89 28 STA $2889,x ; (numFlashingBricks[0] + 0)
0e06 : e8 __ __ INX
0e07 : e0 03 __ CPX #$03
0e09 : d0 f2 __ BNE $0dfd ; (brick_animate.l28 + 0)
.s29:
0e0b : ad 8b 28 LDA $288b ; (numFlashingBricks[0] + 2)
0e0e : 8d 8c 28 STA $288c ; (numFlashingBricks[0] + 3)
0e11 : f0 2c __ BEQ $0e3f ; (brick_animate.s3 + 0)
.s6:
0e13 : 06 1d __ ASL ACCU + 2 
0e15 : a9 00 __ LDA #$00
0e17 : 85 1b __ STA ACCU + 0 
0e19 : a6 1d __ LDX ACCU + 2 
0e1b : ac 8b 28 LDY $288b ; (numFlashingBricks[0] + 2)
.l30:
0e1e : bd 8e 28 LDA $288e,x ; (flashingBricks[0] + 1)
0e21 : 85 44 __ STA T2 + 1 
0e23 : bd 8d 28 LDA $288d,x ; (flashingBricks[0] + 0)
0e26 : a6 1b __ LDX ACCU + 0 
0e28 : e8 __ __ INX
0e29 : e8 __ __ INX
0e2a : 86 1b __ STX ACCU + 0 
0e2c : 9d 8b 28 STA $288b,x ; (numFlashingBricks[0] + 2)
0e2f : a5 44 __ LDA T2 + 1 
0e31 : 9d 8c 28 STA $288c,x ; (numFlashingBricks[0] + 3)
0e34 : 18 __ __ CLC
0e35 : a5 1d __ LDA ACCU + 2 
0e37 : 69 02 __ ADC #$02
0e39 : 85 1d __ STA ACCU + 2 
0e3b : aa __ __ TAX
0e3c : 88 __ __ DEY
0e3d : d0 df __ BNE $0e1e ; (brick_animate.l30 + 0)
.s3:
0e3f : 60 __ __ RTS
.s7:
0e40 : 85 49 __ STA T6 + 0 
0e42 : a9 00 __ LDA #$00
0e44 : 85 1d __ STA ACCU + 2 
.l8:
0e46 : a5 1d __ LDA ACCU + 2 
0e48 : 0a __ __ ASL
0e49 : aa __ __ TAX
0e4a : bd 8e 28 LDA $288e,x ; (flashingBricks[0] + 1)
0e4d : 85 1c __ STA ACCU + 1 
0e4f : 0a __ __ ASL
0e50 : 85 1b __ STA ACCU + 0 
0e52 : a9 00 __ LDA #$00
0e54 : 2a __ __ ROL
0e55 : 06 1b __ ASL ACCU + 0 
0e57 : 2a __ __ ROL
0e58 : a8 __ __ TAY
0e59 : a5 1b __ LDA ACCU + 0 
0e5b : 65 1c __ ADC ACCU + 1 
0e5d : 85 45 __ STA T3 + 0 
0e5f : 98 __ __ TYA
0e60 : 69 00 __ ADC #$00
0e62 : 06 45 __ ASL T3 + 0 
0e64 : 2a __ __ ROL
0e65 : 06 45 __ ASL T3 + 0 
0e67 : 2a __ __ ROL
0e68 : 06 45 __ ASL T3 + 0 
0e6a : 2a __ __ ROL
0e6b : 85 46 __ STA T3 + 1 
0e6d : bd 8d 28 LDA $288d,x ; (flashingBricks[0] + 0)
0e70 : aa __ __ TAX
0e71 : 65 45 __ ADC T3 + 0 
0e73 : 85 47 __ STA T4 + 0 
0e75 : a5 46 __ LDA T3 + 1 
0e77 : 69 d8 __ ADC #$d8
0e79 : 85 48 __ STA T4 + 1 
0e7b : a9 0f __ LDA #$0f
0e7d : a0 00 __ LDY #$00
0e7f : 91 47 __ STA (T4 + 0),y 
0e81 : c8 __ __ INY
0e82 : 91 47 __ STA (T4 + 0),y 
0e84 : c8 __ __ INY
0e85 : 91 47 __ STA (T4 + 0),y 
0e87 : a0 28 __ LDY #$28
0e89 : 91 47 __ STA (T4 + 0),y 
0e8b : c8 __ __ INY
0e8c : 91 47 __ STA (T4 + 0),y 
0e8e : c8 __ __ INY
0e8f : 91 47 __ STA (T4 + 0),y 
0e91 : 8a __ __ TXA
0e92 : 29 01 __ AND #$01
0e94 : 09 60 __ ORA #$60
0e96 : 85 47 __ STA T4 + 0 
0e98 : a5 1c __ LDA ACCU + 1 
0e9a : 29 01 __ AND #$01
0e9c : 0a __ __ ASL
0e9d : 05 47 __ ORA T4 + 0 
0e9f : 85 1b __ STA ACCU + 0 
0ea1 : 8a __ __ TXA
0ea2 : e9 00 __ SBC #$00
0ea4 : 85 43 __ STA T2 + 0 
0ea6 : a9 00 __ LDA #$00
0ea8 : e9 00 __ SBC #$00
0eaa : aa __ __ TAX
0eab : 18 __ __ CLC
0eac : a5 45 __ LDA T3 + 0 
0eae : 69 d8 __ ADC #$d8
0eb0 : a8 __ __ TAY
0eb1 : a5 46 __ LDA T3 + 1 
0eb3 : 69 c7 __ ADC #$c7
0eb5 : 85 46 __ STA T3 + 1 
0eb7 : 98 __ __ TYA
0eb8 : 18 __ __ CLC
0eb9 : 65 43 __ ADC T2 + 0 
0ebb : 85 45 __ STA T3 + 0 
0ebd : 8a __ __ TXA
0ebe : 65 46 __ ADC T3 + 1 
0ec0 : 85 46 __ STA T3 + 1 
0ec2 : a0 00 __ LDY #$00
0ec4 : b1 45 __ LDA (T3 + 0),y 
0ec6 : 10 07 __ BPL $0ecf ; (brick_animate.s9 + 0)
.s27:
0ec8 : a5 1b __ LDA ACCU + 0 
0eca : 09 04 __ ORA #$04
0ecc : 4c d1 0e JMP $0ed1 ; (brick_animate.s10 + 0)
.s9:
0ecf : a5 1b __ LDA ACCU + 0 
.s10:
0ed1 : a0 29 __ LDY #$29
0ed3 : 91 45 __ STA (T3 + 0),y 
0ed5 : a5 1b __ LDA ACCU + 0 
0ed7 : 49 01 __ EOR #$01
0ed9 : 85 43 __ STA T2 + 0 
0edb : a0 01 __ LDY #$01
0edd : b1 45 __ LDA (T3 + 0),y 
0edf : 10 07 __ BPL $0ee8 ; (brick_animate.s11 + 0)
.s26:
0ee1 : a5 43 __ LDA T2 + 0 
0ee3 : 09 04 __ ORA #$04
0ee5 : 4c ea 0e JMP $0eea ; (brick_animate.s12 + 0)
.s11:
0ee8 : a5 43 __ LDA T2 + 0 
.s12:
0eea : a0 2a __ LDY #$2a
0eec : 91 45 __ STA (T3 + 0),y 
0eee : a0 02 __ LDY #$02
0ef0 : b1 45 __ LDA (T3 + 0),y 
0ef2 : 10 07 __ BPL $0efb ; (brick_animate.s13 + 0)
.s25:
0ef4 : a5 1b __ LDA ACCU + 0 
0ef6 : 09 04 __ ORA #$04
0ef8 : 4c fd 0e JMP $0efd ; (brick_animate.s14 + 0)
.s13:
0efb : a5 1b __ LDA ACCU + 0 
.s14:
0efd : a0 2b __ LDY #$2b
0eff : 91 45 __ STA (T3 + 0),y 
0f01 : a5 1b __ LDA ACCU + 0 
0f03 : 49 02 __ EOR #$02
0f05 : a0 53 __ LDY #$53
0f07 : 91 45 __ STA (T3 + 0),y 
0f09 : aa __ __ TAX
0f0a : a0 28 __ LDY #$28
0f0c : b1 45 __ LDA (T3 + 0),y 
0f0e : 10 06 __ BPL $0f16 ; (brick_animate.s15 + 0)
.s24:
0f10 : 8a __ __ TXA
0f11 : 09 04 __ ORA #$04
0f13 : 4c 17 0f JMP $0f17 ; (brick_animate.s31 + 0)
.s15:
0f16 : 8a __ __ TXA
.s31:
0f17 : a0 51 __ LDY #$51
0f19 : 91 45 __ STA (T3 + 0),y 
0f1b : a5 1b __ LDA ACCU + 0 
0f1d : 49 03 __ EOR #$03
0f1f : c8 __ __ INY
0f20 : 91 45 __ STA (T3 + 0),y 
0f22 : aa __ __ TAX
0f23 : a0 54 __ LDY #$54
0f25 : b1 45 __ LDA (T3 + 0),y 
0f27 : 30 03 __ BMI $0f2c ; (brick_animate.s16 + 0)
.s23:
0f29 : 8a __ __ TXA
0f2a : 91 45 __ STA (T3 + 0),y 
.s16:
0f2c : a0 7a __ LDY #$7a
0f2e : b1 45 __ LDA (T3 + 0),y 
0f30 : 30 04 __ BMI $0f36 ; (brick_animate.s17 + 0)
.s22:
0f32 : a5 43 __ LDA T2 + 0 
0f34 : 91 45 __ STA (T3 + 0),y 
.s17:
0f36 : a0 7b __ LDY #$7b
0f38 : b1 45 __ LDA (T3 + 0),y 
0f3a : 30 04 __ BMI $0f40 ; (brick_animate.s18 + 0)
.s21:
0f3c : a5 1b __ LDA ACCU + 0 
0f3e : 91 45 __ STA (T3 + 0),y 
.s18:
0f40 : a0 7c __ LDY #$7c
0f42 : b1 45 __ LDA (T3 + 0),y 
0f44 : 30 04 __ BMI $0f4a ; (brick_animate.s19 + 0)
.s20:
0f46 : a5 43 __ LDA T2 + 0 
0f48 : 91 45 __ STA (T3 + 0),y 
.s19:
0f4a : e6 1d __ INC ACCU + 2 
0f4c : c6 49 __ DEC T6 + 0 
0f4e : f0 03 __ BEQ $0f53 ; (brick_animate.s19 + 9)
0f50 : 4c 46 0e JMP $0e46 ; (brick_animate.l8 + 0)
0f53 : 4c f7 0d JMP $0df7 ; (brick_animate.s5 + 0)
--------------------------------------------------------------------
game_loop: ; game_loop()->void
; 578, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s1:
0f56 : a5 53 __ LDA T1 + 0 
0f58 : 8d e7 9f STA $9fe7 ; (game_loop@stack + 0)
.s4:
0f5b : ad 65 28 LDA $2865 ; (TheGame.state + 0)
0f5e : c9 02 __ CMP #$02
0f60 : f0 56 __ BEQ $0fb8 ; (game_loop.s16 + 0)
.s5:
0f62 : 90 28 __ BCC $0f8c ; (game_loop.s13 + 0)
.s6:
0f64 : c9 03 __ CMP #$03
0f66 : f0 18 __ BEQ $0f80 ; (game_loop.s11 + 0)
.s7:
0f68 : c9 04 __ CMP #$04
0f6a : d0 0e __ BNE $0f7a ; (game_loop.s3 + 0)
.s8:
0f6c : ce 84 28 DEC $2884 ; (TheGame.count + 0)
0f6f : d0 09 __ BNE $0f7a ; (game_loop.s3 + 0)
.s9:
0f71 : ad 84 28 LDA $2884 ; (TheGame.count + 0)
.s10:
0f74 : 8d ff 9f STA $9fff ; (sstack + 10)
0f77 : 20 19 0a JSR $0a19 ; (game_state.s4 + 0)
.s3:
0f7a : ad e7 9f LDA $9fe7 ; (game_loop@stack + 0)
0f7d : 85 53 __ STA T1 + 0 
0f7f : 60 __ __ RTS
.s11:
0f80 : 20 08 10 JSR $1008 ; (paddle_control.s4 + 0)
0f83 : ce 84 28 DEC $2884 ; (TheGame.count + 0)
0f86 : d0 f2 __ BNE $0f7a ; (game_loop.s3 + 0)
.s12:
0f88 : a9 01 __ LDA #$01
0f8a : d0 e8 __ BNE $0f74 ; (game_loop.s10 + 0)
.s13:
0f8c : aa __ __ TAX
0f8d : f0 f1 __ BEQ $0f80 ; (game_loop.s11 + 0)
.s14:
0f8f : 20 08 10 JSR $1008 ; (paddle_control.s4 + 0)
0f92 : ad 87 28 LDA $2887 ; (paddlex + 0)
0f95 : 18 __ __ CLC
0f96 : 69 80 __ ADC #$80
0f98 : 8d 72 28 STA $2872 ; (TheGame.balls[0] + 12)
0f9b : 8d 7c 28 STA $287c ; (TheGame.balls[0] + 22)
0f9e : 8d 68 28 STA $2868 ; (TheGame.balls[0].sx + 0)
0fa1 : ad 88 28 LDA $2888 ; (paddlex + 1)
0fa4 : 69 05 __ ADC #$05
0fa6 : 8d 73 28 STA $2873 ; (TheGame.balls[0] + 13)
0fa9 : 8d 69 28 STA $2869 ; (TheGame.balls[0].sx + 1)
0fac : 8d 7d 28 STA $287d ; (TheGame.balls[0] + 23)
0faf : ad d1 28 LDA $28d1 ; (joyb[0] + 0)
0fb2 : f0 c6 __ BEQ $0f7a ; (game_loop.s3 + 0)
.s15:
0fb4 : a9 02 __ LDA #$02
0fb6 : d0 bc __ BNE $0f74 ; (game_loop.s10 + 0)
.s16:
0fb8 : 20 08 10 JSR $1008 ; (paddle_control.s4 + 0)
0fbb : a9 00 __ LDA #$00
.l17:
0fbd : 85 53 __ STA T1 + 0 
0fbf : 18 __ __ CLC
0fc0 : 69 66 __ ADC #$66
0fc2 : 85 12 __ STA P5 
0fc4 : a9 28 __ LDA #$28
0fc6 : 69 00 __ ADC #$00
0fc8 : 85 13 __ STA P6 
0fca : 20 0e 11 JSR $110e ; (ball_loop.s1 + 0)
0fcd : 18 __ __ CLC
0fce : a5 53 __ LDA T1 + 0 
0fd0 : 69 0a __ ADC #$0a
0fd2 : c9 1e __ CMP #$1e
0fd4 : d0 e7 __ BNE $0fbd ; (game_loop.l17 + 0)
.s18:
0fd6 : a9 00 __ LDA #$00
.l19:
0fd8 : 85 53 __ STA T1 + 0 
0fda : 18 __ __ CLC
0fdb : 69 66 __ ADC #$66
0fdd : 85 12 __ STA P5 
0fdf : a9 28 __ LDA #$28
0fe1 : 69 00 __ ADC #$00
0fe3 : 85 13 __ STA P6 
0fe5 : 20 0e 11 JSR $110e ; (ball_loop.s1 + 0)
0fe8 : 18 __ __ CLC
0fe9 : a5 53 __ LDA T1 + 0 
0feb : 69 0a __ ADC #$0a
0fed : c9 1e __ CMP #$1e
0fef : d0 e7 __ BNE $0fd8 ; (game_loop.l19 + 0)
.s20:
0ff1 : ad 67 28 LDA $2867 ; (TheGame.balls[0].active + 0)
0ff4 : d0 84 __ BNE $0f7a ; (game_loop.s3 + 0)
.s21:
0ff6 : ad 71 28 LDA $2871 ; (TheGame.balls[0] + 11)
0ff9 : f0 03 __ BEQ $0ffe ; (game_loop.s22 + 0)
0ffb : 4c 7a 0f JMP $0f7a ; (game_loop.s3 + 0)
.s22:
0ffe : ad 7b 28 LDA $287b ; (TheGame.balls[0] + 21)
1001 : d0 f8 __ BNE $0ffb ; (game_loop.s21 + 5)
.s23:
1003 : a9 03 __ LDA #$03
1005 : 4c 74 0f JMP $0f74 ; (game_loop.s10 + 0)
--------------------------------------------------------------------
paddle_control: ; paddle_control()->void
; 505, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
1008 : a9 00 __ LDA #$00
100a : 20 ce 10 JSR $10ce ; (joy_poll.s4 + 0)
100d : ad 85 28 LDA $2885 ; (paddlevx + 0)
1010 : 85 1b __ STA ACCU + 0 
1012 : ad 86 28 LDA $2886 ; (paddlevx + 1)
1015 : 85 1c __ STA ACCU + 1 
1017 : ad cf 28 LDA $28cf ; (joyx[0] + 0)
101a : d0 70 __ BNE $108c ; (paddle_control.s14 + 0)
.s5:
101c : 24 1c __ BIT ACCU + 1 
101e : 30 05 __ BMI $1025 ; (paddle_control.s13 + 0)
.s6:
1020 : 46 1c __ LSR ACCU + 1 
1022 : 4c 35 10 JMP $1035 ; (paddle_control.s7 + 0)
.s13:
1025 : 18 __ __ CLC
1026 : a5 1b __ LDA ACCU + 0 
1028 : 69 01 __ ADC #$01
102a : 85 1b __ STA ACCU + 0 
102c : a5 1c __ LDA ACCU + 1 
102e : 69 00 __ ADC #$00
1030 : c9 80 __ CMP #$80
1032 : 6a __ __ ROR
1033 : 85 1c __ STA ACCU + 1 
.s7:
1035 : a5 1b __ LDA ACCU + 0 
1037 : 6a __ __ ROR
1038 : 8d 85 28 STA $2885 ; (paddlevx + 0)
103b : a5 1c __ LDA ACCU + 1 
.s18:
103d : 8d 86 28 STA $2886 ; (paddlevx + 1)
.s8:
1040 : ad 87 28 LDA $2887 ; (paddlex + 0)
1043 : 18 __ __ CLC
1044 : 6d 85 28 ADC $2885 ; (paddlevx + 0)
1047 : 8d 87 28 STA $2887 ; (paddlex + 0)
104a : ad 88 28 LDA $2888 ; (paddlex + 1)
104d : 6d 86 28 ADC $2886 ; (paddlevx + 1)
1050 : 8d 88 28 STA $2888 ; (paddlex + 1)
1053 : 10 04 __ BPL $1059 ; (paddle_control.s9 + 0)
.s24:
1055 : c9 ff __ CMP #$ff
1057 : 90 0e __ BCC $1067 ; (paddle_control.s10 + 0)
.s9:
1059 : 49 80 __ EOR #$80
105b : c9 c5 __ CMP #$c5
105d : f0 03 __ BEQ $1062 ; (paddle_control.s11 + 0)
.s12:
105f : b0 06 __ BCS $1067 ; (paddle_control.s10 + 0)
1061 : 60 __ __ RTS
.s11:
1062 : ad 87 28 LDA $2887 ; (paddlex + 0)
1065 : f0 24 __ BEQ $108b ; (paddle_control.s3 + 0)
.s10:
1067 : 38 __ __ SEC
1068 : a9 00 __ LDA #$00
106a : ed 85 28 SBC $2885 ; (paddlevx + 0)
106d : 8d 85 28 STA $2885 ; (paddlevx + 0)
1070 : a9 00 __ LDA #$00
1072 : ed 86 28 SBC $2886 ; (paddlevx + 1)
1075 : 8d 86 28 STA $2886 ; (paddlevx + 1)
1078 : ad 85 28 LDA $2885 ; (paddlevx + 0)
107b : 18 __ __ CLC
107c : 6d 87 28 ADC $2887 ; (paddlex + 0)
107f : 8d 87 28 STA $2887 ; (paddlex + 0)
1082 : ad 86 28 LDA $2886 ; (paddlevx + 1)
1085 : 6d 88 28 ADC $2888 ; (paddlex + 1)
1088 : 8d 88 28 STA $2888 ; (paddlex + 1)
.s3:
108b : 60 __ __ RTS
.s14:
108c : 0a __ __ ASL
108d : 85 1b __ STA ACCU + 0 
108f : 90 04 __ BCC $1095 ; (paddle_control.s19 + 0)
.s20:
1091 : a9 ff __ LDA #$ff
1093 : b0 02 __ BCS $1097 ; (paddle_control.s21 + 0)
.s19:
1095 : a9 00 __ LDA #$00
.s21:
1097 : 06 1b __ ASL ACCU + 0 
1099 : 2a __ __ ROL
109a : 06 1b __ ASL ACCU + 0 
109c : 2a __ __ ROL
109d : aa __ __ TAX
109e : 18 __ __ CLC
109f : a5 1b __ LDA ACCU + 0 
10a1 : 6d 85 28 ADC $2885 ; (paddlevx + 0)
10a4 : 8d 85 28 STA $2885 ; (paddlevx + 0)
10a7 : 8a __ __ TXA
10a8 : 65 1c __ ADC ACCU + 1 
10aa : 8d 86 28 STA $2886 ; (paddlevx + 1)
10ad : 30 04 __ BMI $10b3 ; (paddle_control.s15 + 0)
.s22:
10af : c9 01 __ CMP #$01
10b1 : b0 11 __ BCS $10c4 ; (paddle_control.s17 + 0)
.s15:
10b3 : aa __ __ TAX
10b4 : 10 8a __ BPL $1040 ; (paddle_control.s8 + 0)
.s23:
10b6 : c9 ff __ CMP #$ff
10b8 : b0 86 __ BCS $1040 ; (paddle_control.s8 + 0)
.s16:
10ba : a9 00 __ LDA #$00
10bc : 8d 85 28 STA $2885 ; (paddlevx + 0)
10bf : a9 ff __ LDA #$ff
10c1 : 4c 3d 10 JMP $103d ; (paddle_control.s18 + 0)
.s17:
10c4 : a9 00 __ LDA #$00
10c6 : 8d 85 28 STA $2885 ; (paddlevx + 0)
10c9 : a9 01 __ LDA #$01
10cb : 4c 3d 10 JMP $103d ; (paddle_control.s18 + 0)
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
10ce : aa __ __ TAX
10cf : bd 00 dc LDA $dc00,x 
10d2 : a8 __ __ TAY
10d3 : 29 10 __ AND #$10
10d5 : f0 04 __ BEQ $10db ; (joy_poll.s10 + 0)
.s11:
10d7 : a9 00 __ LDA #$00
10d9 : f0 02 __ BEQ $10dd ; (joy_poll.s12 + 0)
.s10:
10db : a9 01 __ LDA #$01
.s12:
10dd : 9d d1 28 STA $28d1,x ; (joyb[0] + 0)
10e0 : 98 __ __ TYA
10e1 : 4a __ __ LSR
10e2 : b0 04 __ BCS $10e8 ; (joy_poll.s9 + 0)
.s5:
10e4 : a9 ff __ LDA #$ff
10e6 : 90 0b __ BCC $10f3 ; (joy_poll.s6 + 0)
.s9:
10e8 : 98 __ __ TYA
10e9 : 29 02 __ AND #$02
10eb : f0 04 __ BEQ $10f1 ; (joy_poll.s13 + 0)
.s14:
10ed : a9 00 __ LDA #$00
10ef : b0 02 __ BCS $10f3 ; (joy_poll.s6 + 0)
.s13:
10f1 : a9 01 __ LDA #$01
.s6:
10f3 : 9d cd 28 STA $28cd,x ; (joyy[0] + 0)
10f6 : 98 __ __ TYA
10f7 : 29 04 __ AND #$04
10f9 : d0 06 __ BNE $1101 ; (joy_poll.s8 + 0)
.s7:
10fb : a9 ff __ LDA #$ff
.s3:
10fd : 9d cf 28 STA $28cf,x ; (joyx[0] + 0)
1100 : 60 __ __ RTS
.s8:
1101 : 98 __ __ TYA
1102 : 29 08 __ AND #$08
1104 : f0 04 __ BEQ $110a ; (joy_poll.s15 + 0)
.s16:
1106 : a9 00 __ LDA #$00
1108 : f0 f3 __ BEQ $10fd ; (joy_poll.s3 + 0)
.s15:
110a : a9 01 __ LDA #$01
110c : d0 ef __ BNE $10fd ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
ball_loop: ; ball_loop(struct Ball*)->void
; 352, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s1:
110e : a2 08 __ LDX #$08
1110 : b5 53 __ LDA T7 + 0,x 
1112 : 9d e9 9f STA $9fe9,x ; (ball_loop@stack + 0)
1115 : ca __ __ DEX
1116 : 10 f8 __ BPL $1110 ; (ball_loop.s1 + 2)
.s4:
1118 : a0 01 __ LDY #$01
111a : b1 12 __ LDA (P5),y ; (ball + 0)
111c : d0 0b __ BNE $1129 ; (ball_loop.s5 + 0)
.s3:
111e : a2 08 __ LDX #$08
1120 : bd e9 9f LDA $9fe9,x ; (ball_loop@stack + 0)
1123 : 95 53 __ STA T7 + 0,x 
1125 : ca __ __ DEX
1126 : 10 f8 __ BPL $1120 ; (ball_loop.s3 + 2)
1128 : 60 __ __ RTS
.s5:
1129 : a0 03 __ LDY #$03
112b : b1 12 __ LDA (P5),y ; (ball + 0)
112d : 85 44 __ STA T0 + 1 
112f : a0 06 __ LDY #$06
1131 : b1 12 __ LDA (P5),y ; (ball + 0)
1133 : 85 48 __ STA T1 + 0 
1135 : 18 __ __ CLC
1136 : a0 02 __ LDY #$02
1138 : 71 12 __ ADC (P5),y ; (ball + 0)
113a : 85 4c __ STA T4 + 0 
113c : 91 12 __ STA (P5),y ; (ball + 0)
113e : a0 07 __ LDY #$07
1140 : b1 12 __ LDA (P5),y ; (ball + 0)
1142 : 85 49 __ STA T1 + 1 
1144 : 65 44 __ ADC T0 + 1 
1146 : 85 4d __ STA T4 + 1 
1148 : a0 03 __ LDY #$03
114a : 91 12 __ STA (P5),y ; (ball + 0)
114c : a0 05 __ LDY #$05
114e : b1 12 __ LDA (P5),y ; (ball + 0)
1150 : 85 44 __ STA T0 + 1 
1152 : a0 08 __ LDY #$08
1154 : b1 12 __ LDA (P5),y ; (ball + 0)
1156 : 85 4e __ STA T5 + 0 
1158 : 18 __ __ CLC
1159 : a0 04 __ LDY #$04
115b : 71 12 __ ADC (P5),y ; (ball + 0)
115d : 85 50 __ STA T6 + 0 
115f : 91 12 __ STA (P5),y ; (ball + 0)
1161 : a0 09 __ LDY #$09
1163 : b1 12 __ LDA (P5),y ; (ball + 0)
1165 : 85 4f __ STA T5 + 1 
1167 : 65 44 __ ADC T0 + 1 
1169 : 85 51 __ STA T6 + 1 
116b : a0 05 __ LDY #$05
116d : 91 12 __ STA (P5),y ; (ball + 0)
116f : a5 4c __ LDA T4 + 0 
1171 : 0a __ __ ASL
1172 : 85 4b __ STA T2 + 1 
1174 : a5 4d __ LDA T4 + 1 
1176 : 2a __ __ ROL
1177 : 85 4a __ STA T2 + 0 
1179 : a9 00 __ LDA #$00
117b : 69 ff __ ADC #$ff
117d : 49 ff __ EOR #$ff
117f : 06 4b __ ASL T2 + 1 
1181 : 26 4a __ ROL T2 + 0 
1183 : 2a __ __ ROL
1184 : 85 4b __ STA T2 + 1 
1186 : 18 __ __ CLC
1187 : a5 4a __ LDA T2 + 0 
1189 : 69 06 __ ADC #$06
118b : 85 53 __ STA T7 + 0 
118d : a5 4b __ LDA T2 + 1 
118f : 69 00 __ ADC #$00
1191 : 85 54 __ STA T7 + 1 
1193 : ad 87 28 LDA $2887 ; (paddlex + 0)
1196 : 0a __ __ ASL
1197 : 85 56 __ STA T8 + 1 
1199 : ad 88 28 LDA $2888 ; (paddlex + 1)
119c : 2a __ __ ROL
119d : 85 55 __ STA T8 + 0 
119f : a9 00 __ LDA #$00
11a1 : 69 ff __ ADC #$ff
11a3 : 49 ff __ EOR #$ff
11a5 : 06 56 __ ASL T8 + 1 
11a7 : 26 55 __ ROL T8 + 0 
11a9 : 2a __ __ ROL
11aa : 85 56 __ STA T8 + 1 
11ac : a5 50 __ LDA T6 + 0 
11ae : 0a __ __ ASL
11af : 85 58 __ STA T9 + 1 
11b1 : a5 51 __ LDA T6 + 1 
11b3 : 2a __ __ ROL
11b4 : 85 57 __ STA T9 + 0 
11b6 : a9 00 __ LDA #$00
11b8 : 85 59 __ STA T13 + 0 
11ba : 69 ff __ ADC #$ff
11bc : 49 ff __ EOR #$ff
11be : 06 58 __ ASL T9 + 1 
11c0 : 26 57 __ ROL T9 + 0 
11c2 : 2a __ __ ROL
11c3 : 85 58 __ STA T9 + 1 
11c5 : a5 4b __ LDA T2 + 1 
11c7 : 49 80 __ EOR #$80
11c9 : c9 81 __ CMP #$81
11cb : d0 04 __ BNE $11d1 ; (ball_loop.s80 + 0)
.s79:
11cd : a5 4a __ LDA T2 + 0 
11cf : c9 3b __ CMP #$3b
.s80:
11d1 : b0 04 __ BCS $11d7 ; (ball_loop.s78 + 0)
.s6:
11d3 : 24 4b __ BIT T2 + 1 
11d5 : 10 0f __ BPL $11e6 ; (ball_loop.s7 + 0)
.s78:
11d7 : a9 96 __ LDA #$96
11d9 : 85 0d __ STA P0 
11db : a9 04 __ LDA #$04
11dd : 85 0e __ STA P1 
11df : 20 f0 14 JSR $14f0 ; (sound_trigger.s4 + 0)
11e2 : a9 ff __ LDA #$ff
11e4 : d0 02 __ BNE $11e8 ; (ball_loop.s8 + 0)
.s7:
11e6 : a9 00 __ LDA #$00
.s8:
11e8 : 85 5a __ STA T14 + 0 
11ea : a5 58 __ LDA T9 + 1 
11ec : 10 10 __ BPL $11fe ; (ball_loop.s9 + 0)
.s77:
11ee : a9 96 __ LDA #$96
11f0 : 85 0d __ STA P0 
11f2 : a9 04 __ LDA #$04
11f4 : 85 0e __ STA P1 
11f6 : 20 f0 14 JSR $14f0 ; (sound_trigger.s4 + 0)
11f9 : e6 59 __ INC T13 + 0 
11fb : 4c eb 12 JMP $12eb ; (ball_loop.s11 + 0)
.s9:
11fe : d0 06 __ BNE $1206 ; (ball_loop.s75 + 0)
.s76:
1200 : a5 57 __ LDA T9 + 0 
1202 : c9 c8 __ CMP #$c8
1204 : 90 0e __ BCC $1214 ; (ball_loop.s10 + 0)
.s75:
1206 : a5 12 __ LDA P5 ; (ball + 0)
1208 : 85 0d __ STA P0 
120a : a5 13 __ LDA P6 ; (ball + 1)
120c : 85 0e __ STA P1 
120e : 20 10 15 JSR $1510 ; (ball_lost.s4 + 0)
1211 : 4c 1e 11 JMP $111e ; (ball_loop.s3 + 0)
.s10:
1214 : c9 b9 __ CMP #$b9
1216 : 90 e3 __ BCC $11fb ; (ball_loop.s77 + 13)
.s49:
1218 : c9 be __ CMP #$be
121a : b0 df __ BCS $11fb ; (ball_loop.s77 + 13)
.s50:
121c : a5 4a __ LDA T2 + 0 
121e : 69 05 __ ADC #$05
1220 : aa __ __ TAX
1221 : a5 4b __ LDA T2 + 1 
1223 : 69 00 __ ADC #$00
1225 : c5 56 __ CMP T8 + 1 
1227 : d0 07 __ BNE $1230 ; (ball_loop.s74 + 0)
.s71:
1229 : e4 55 __ CPX T8 + 0 
.s72:
122b : b0 09 __ BCS $1236 ; (ball_loop.s51 + 0)
122d : 4c eb 12 JMP $12eb ; (ball_loop.s11 + 0)
.s74:
1230 : 45 56 __ EOR T8 + 1 
1232 : 10 f7 __ BPL $122b ; (ball_loop.s72 + 0)
.s73:
1234 : b0 f7 __ BCS $122d ; (ball_loop.s72 + 2)
.s51:
1236 : 18 __ __ CLC
1237 : a5 55 __ LDA T8 + 0 
1239 : 69 30 __ ADC #$30
123b : 85 43 __ STA T0 + 0 
123d : a5 56 __ LDA T8 + 1 
123f : 69 00 __ ADC #$00
1241 : 85 44 __ STA T0 + 1 
1243 : a5 4b __ LDA T2 + 1 
1245 : c5 44 __ CMP T0 + 1 
1247 : d0 09 __ BNE $1252 ; (ball_loop.s70 + 0)
.s67:
1249 : a5 4a __ LDA T2 + 0 
124b : c5 43 __ CMP T0 + 0 
.s68:
124d : 90 09 __ BCC $1258 ; (ball_loop.s52 + 0)
124f : 4c eb 12 JMP $12eb ; (ball_loop.s11 + 0)
.s70:
1252 : 45 44 __ EOR T0 + 1 
1254 : 10 f7 __ BPL $124d ; (ball_loop.s68 + 0)
.s69:
1256 : 90 f7 __ BCC $124f ; (ball_loop.s68 + 2)
.s52:
1258 : e6 59 __ INC T13 + 0 
125a : a5 4b __ LDA T2 + 1 
125c : c5 56 __ CMP T8 + 1 
125e : d0 08 __ BNE $1268 ; (ball_loop.s66 + 0)
.s63:
1260 : a5 4a __ LDA T2 + 0 
1262 : c5 55 __ CMP T8 + 0 
.s64:
1264 : 90 08 __ BCC $126e ; (ball_loop.s61 + 0)
1266 : b0 0e __ BCS $1276 ; (ball_loop.s53 + 0)
.s66:
1268 : 45 56 __ EOR T8 + 1 
126a : 10 f8 __ BPL $1264 ; (ball_loop.s64 + 0)
.s65:
126c : 90 08 __ BCC $1276 ; (ball_loop.s53 + 0)
.s61:
126e : a5 49 __ LDA T1 + 1 
1270 : 30 04 __ BMI $1276 ; (ball_loop.s53 + 0)
.s62:
1272 : 05 48 __ ORA T1 + 0 
1274 : d0 18 __ BNE $128e ; (ball_loop.s56 + 0)
.s53:
1276 : a5 54 __ LDA T7 + 1 
1278 : c5 44 __ CMP T0 + 1 
127a : d0 08 __ BNE $1284 ; (ball_loop.s60 + 0)
.s57:
127c : a5 53 __ LDA T7 + 0 
127e : c5 43 __ CMP T0 + 0 
.s58:
1280 : b0 08 __ BCS $128a ; (ball_loop.s55 + 0)
1282 : 90 1b __ BCC $129f ; (ball_loop.s54 + 0)
.s60:
1284 : 45 44 __ EOR T0 + 1 
1286 : 10 f8 __ BPL $1280 ; (ball_loop.s58 + 0)
.s59:
1288 : b0 15 __ BCS $129f ; (ball_loop.s54 + 0)
.s55:
128a : 24 49 __ BIT T1 + 1 
128c : 10 11 __ BPL $129f ; (ball_loop.s54 + 0)
.s56:
128e : a9 2d __ LDA #$2d
1290 : 85 0d __ STA P0 
1292 : a9 09 __ LDA #$09
1294 : 85 0e __ STA P1 
1296 : 20 f0 14 JSR $14f0 ; (sound_trigger.s4 + 0)
1299 : a9 ff __ LDA #$ff
129b : 85 5a __ STA T14 + 0 
129d : d0 4c __ BNE $12eb ; (ball_loop.s11 + 0)
.s54:
129f : a5 48 __ LDA T1 + 0 
12a1 : 0a __ __ ASL
12a2 : a8 __ __ TAY
12a3 : a9 2d __ LDA #$2d
12a5 : 85 0d __ STA P0 
12a7 : a9 09 __ LDA #$09
12a9 : 85 0e __ STA P1 
12ab : a5 49 __ LDA T1 + 1 
12ad : 2a __ __ ROL
12ae : aa __ __ TAX
12af : 98 __ __ TYA
12b0 : 18 __ __ CLC
12b1 : 65 48 __ ADC T1 + 0 
12b3 : 85 43 __ STA T0 + 0 
12b5 : 8a __ __ TXA
12b6 : 65 49 __ ADC T1 + 1 
12b8 : 06 43 __ ASL T0 + 0 
12ba : 2a __ __ ROL
12bb : a8 __ __ TAY
12bc : ad 85 28 LDA $2885 ; (paddlevx + 0)
12bf : 18 __ __ CLC
12c0 : 65 43 __ ADC T0 + 0 
12c2 : aa __ __ TAX
12c3 : 98 __ __ TYA
12c4 : 6d 86 28 ADC $2886 ; (paddlevx + 1)
12c7 : a8 __ __ TAY
12c8 : 8a __ __ TXA
12c9 : 18 __ __ CLC
12ca : 69 04 __ ADC #$04
12cc : 85 43 __ STA T0 + 0 
12ce : 98 __ __ TYA
12cf : 69 00 __ ADC #$00
12d1 : 4a __ __ LSR
12d2 : 66 43 __ ROR T0 + 0 
12d4 : 4a __ __ LSR
12d5 : 66 43 __ ROR T0 + 0 
12d7 : 4a __ __ LSR
12d8 : 66 43 __ ROR T0 + 0 
12da : 49 10 __ EOR #$10
12dc : 38 __ __ SEC
12dd : e9 10 __ SBC #$10
12df : a0 07 __ LDY #$07
12e1 : 91 12 __ STA (P5),y ; (ball + 0)
12e3 : a5 43 __ LDA T0 + 0 
12e5 : 88 __ __ DEY
12e6 : 91 12 __ STA (P5),y ; (ball + 0)
12e8 : 20 f0 14 JSR $14f0 ; (sound_trigger.s4 + 0)
.s11:
12eb : a5 4b __ LDA T2 + 1 
12ed : 4a __ __ LSR
12ee : a6 4a __ LDX T2 + 0 
12f0 : 86 53 __ STX T7 + 0 
12f2 : 66 53 __ ROR T7 + 0 
12f4 : 4a __ __ LSR
12f5 : 66 53 __ ROR T7 + 0 
12f7 : 4a __ __ LSR
12f8 : 66 53 __ ROR T7 + 0 
12fa : 24 53 __ BIT T7 + 0 
12fc : 30 57 __ BMI $1355 ; (ball_loop.s12 + 0)
.s16:
12fe : 8a __ __ TXA
12ff : 18 __ __ CLC
1300 : 69 05 __ ADC #$05
1302 : 85 55 __ STA T8 + 0 
1304 : a5 4b __ LDA T2 + 1 
1306 : 69 00 __ ADC #$00
1308 : 4a __ __ LSR
1309 : 66 55 __ ROR T8 + 0 
130b : 4a __ __ LSR
130c : 66 55 __ ROR T8 + 0 
130e : 4a __ __ LSR
130f : 66 55 __ ROR T8 + 0 
1311 : 49 10 __ EOR #$10
1313 : 38 __ __ SEC
1314 : e9 10 __ SBC #$10
1316 : 85 56 __ STA T8 + 1 
1318 : a5 55 __ LDA T8 + 0 
131a : 30 04 __ BMI $1320 ; (ball_loop.s17 + 0)
.s81:
131c : c9 28 __ CMP #$28
131e : b0 35 __ BCS $1355 ; (ball_loop.s12 + 0)
.s17:
1320 : a5 58 __ LDA T9 + 1 
1322 : 4a __ __ LSR
1323 : a6 57 __ LDX T9 + 0 
1325 : 86 52 __ STX T10 + 0 
1327 : 66 52 __ ROR T10 + 0 
1329 : 4a __ __ LSR
132a : 66 52 __ ROR T10 + 0 
132c : 4a __ __ LSR
132d : 66 52 __ ROR T10 + 0 
132f : 24 52 __ BIT T10 + 0 
1331 : 30 22 __ BMI $1355 ; (ball_loop.s12 + 0)
.s18:
1333 : 8a __ __ TXA
1334 : 18 __ __ CLC
1335 : 69 05 __ ADC #$05
1337 : 85 57 __ STA T9 + 0 
1339 : a5 58 __ LDA T9 + 1 
133b : 69 00 __ ADC #$00
133d : 4a __ __ LSR
133e : 66 57 __ ROR T9 + 0 
1340 : 4a __ __ LSR
1341 : 66 57 __ ROR T9 + 0 
1343 : 4a __ __ LSR
1344 : 66 57 __ ROR T9 + 0 
1346 : 49 10 __ EOR #$10
1348 : 38 __ __ SEC
1349 : e9 10 __ SBC #$10
134b : 85 58 __ STA T9 + 1 
134d : a5 57 __ LDA T9 + 0 
134f : 30 56 __ BMI $13a7 ; (ball_loop.s19 + 0)
.s82:
1351 : c9 18 __ CMP #$18
1353 : 90 52 __ BCC $13a7 ; (ball_loop.s19 + 0)
.s12:
1355 : a5 59 __ LDA T13 + 0 
1357 : f0 22 __ BEQ $137b ; (ball_loop.s13 + 0)
.s15:
1359 : 38 __ __ SEC
135a : a9 00 __ LDA #$00
135c : e5 4e __ SBC T5 + 0 
135e : a0 08 __ LDY #$08
1360 : 91 12 __ STA (P5),y ; (ball + 0)
1362 : aa __ __ TAX
1363 : a9 00 __ LDA #$00
1365 : e5 4f __ SBC T5 + 1 
1367 : 85 44 __ STA T0 + 1 
1369 : c8 __ __ INY
136a : 91 12 __ STA (P5),y ; (ball + 0)
136c : 8a __ __ TXA
136d : 18 __ __ CLC
136e : 65 50 __ ADC T6 + 0 
1370 : a0 04 __ LDY #$04
1372 : 91 12 __ STA (P5),y ; (ball + 0)
1374 : a5 44 __ LDA T0 + 1 
1376 : 65 51 __ ADC T6 + 1 
1378 : c8 __ __ INY
1379 : 91 12 __ STA (P5),y ; (ball + 0)
.s13:
137b : 24 5a __ BIT T14 + 0 
137d : 30 03 __ BMI $1382 ; (ball_loop.s14 + 0)
137f : 4c 1e 11 JMP $111e ; (ball_loop.s3 + 0)
.s14:
1382 : a9 00 __ LDA #$00
1384 : 38 __ __ SEC
1385 : a0 06 __ LDY #$06
1387 : f1 12 __ SBC (P5),y ; (ball + 0)
1389 : 91 12 __ STA (P5),y ; (ball + 0)
138b : aa __ __ TAX
138c : a9 00 __ LDA #$00
138e : c8 __ __ INY
138f : f1 12 __ SBC (P5),y ; (ball + 0)
1391 : 85 44 __ STA T0 + 1 
1393 : 91 12 __ STA (P5),y ; (ball + 0)
1395 : 8a __ __ TXA
1396 : 18 __ __ CLC
1397 : 65 4c __ ADC T4 + 0 
1399 : a0 02 __ LDY #$02
139b : 91 12 __ STA (P5),y ; (ball + 0)
139d : a5 44 __ LDA T0 + 1 
139f : 65 4d __ ADC T4 + 1 
13a1 : c8 __ __ INY
13a2 : 91 12 __ STA (P5),y ; (ball + 0)
13a4 : 4c 1e 11 JMP $111e ; (ball_loop.s3 + 0)
.s19:
13a7 : a5 52 __ LDA T10 + 0 
13a9 : 0a __ __ ASL
13aa : 0a __ __ ASL
13ab : 65 52 __ ADC T10 + 0 
13ad : 0a __ __ ASL
13ae : 0a __ __ ASL
13af : 85 43 __ STA T0 + 0 
13b1 : a9 00 __ LDA #$00
13b3 : 2a __ __ ROL
13b4 : 06 43 __ ASL T0 + 0 
13b6 : 2a __ __ ROL
13b7 : aa __ __ TAX
13b8 : 09 c8 __ ORA #$c8
13ba : 85 49 __ STA T1 + 1 
13bc : a5 43 __ LDA T0 + 0 
13be : 85 48 __ STA T1 + 0 
13c0 : a4 53 __ LDY T7 + 0 
13c2 : b1 48 __ LDA (T1 + 0),y 
13c4 : 30 04 __ BMI $13ca ; (ball_loop.s48 + 0)
.s20:
13c6 : a9 00 __ LDA #$00
13c8 : f0 02 __ BEQ $13cc ; (ball_loop.s21 + 0)
.s48:
13ca : a9 01 __ LDA #$01
.s21:
13cc : 85 45 __ STA T11 + 0 
13ce : 18 __ __ CLC
13cf : a5 43 __ LDA T0 + 0 
13d1 : 65 55 __ ADC T8 + 0 
13d3 : 85 43 __ STA T0 + 0 
13d5 : 8a __ __ TXA
13d6 : 65 56 __ ADC T8 + 1 
13d8 : 18 __ __ CLC
13d9 : 69 c8 __ ADC #$c8
13db : 85 44 __ STA T0 + 1 
13dd : a0 00 __ LDY #$00
13df : 84 5b __ STY T15 + 0 
13e1 : b1 43 __ LDA (T0 + 0),y 
13e3 : 10 06 __ BPL $13eb ; (ball_loop.s22 + 0)
.s47:
13e5 : a5 45 __ LDA T11 + 0 
13e7 : 09 02 __ ORA #$02
13e9 : 85 45 __ STA T11 + 0 
.s22:
13eb : a5 57 __ LDA T9 + 0 
13ed : 0a __ __ ASL
13ee : 85 1b __ STA ACCU + 0 
13f0 : a5 58 __ LDA T9 + 1 
13f2 : 2a __ __ ROL
13f3 : 06 1b __ ASL ACCU + 0 
13f5 : 2a __ __ ROL
13f6 : aa __ __ TAX
13f7 : 18 __ __ CLC
13f8 : a5 1b __ LDA ACCU + 0 
13fa : 65 57 __ ADC T9 + 0 
13fc : 85 43 __ STA T0 + 0 
13fe : 8a __ __ TXA
13ff : 65 58 __ ADC T9 + 1 
1401 : 06 43 __ ASL T0 + 0 
1403 : 2a __ __ ROL
1404 : 06 43 __ ASL T0 + 0 
1406 : 2a __ __ ROL
1407 : 06 43 __ ASL T0 + 0 
1409 : 2a __ __ ROL
140a : aa __ __ TAX
140b : 18 __ __ CLC
140c : 69 c8 __ ADC #$c8
140e : 85 49 __ STA T1 + 1 
1410 : a5 43 __ LDA T0 + 0 
1412 : 85 48 __ STA T1 + 0 
1414 : a4 53 __ LDY T7 + 0 
1416 : b1 48 __ LDA (T1 + 0),y 
1418 : 10 06 __ BPL $1420 ; (ball_loop.s23 + 0)
.s46:
141a : a5 45 __ LDA T11 + 0 
141c : 09 04 __ ORA #$04
141e : 85 45 __ STA T11 + 0 
.s23:
1420 : a0 06 __ LDY #$06
1422 : b1 12 __ LDA (P5),y ; (ball + 0)
1424 : 85 48 __ STA T1 + 0 
1426 : c8 __ __ INY
1427 : b1 12 __ LDA (P5),y ; (ball + 0)
1429 : 85 49 __ STA T1 + 1 
142b : 18 __ __ CLC
142c : a5 43 __ LDA T0 + 0 
142e : 65 55 __ ADC T8 + 0 
1430 : 85 43 __ STA T0 + 0 
1432 : 8a __ __ TXA
1433 : 65 56 __ ADC T8 + 1 
1435 : 18 __ __ CLC
1436 : 69 c8 __ ADC #$c8
1438 : 85 44 __ STA T0 + 1 
143a : a0 00 __ LDY #$00
143c : b1 43 __ LDA (T0 + 0),y 
143e : 10 06 __ BPL $1446 ; (ball_loop.s24 + 0)
.s45:
1440 : a5 45 __ LDA T11 + 0 
1442 : 09 08 __ ORA #$08
1444 : 85 45 __ STA T11 + 0 
.s24:
1446 : 24 49 __ BIT T1 + 1 
1448 : 10 08 __ BPL $1452 ; (ball_loop.s25 + 0)
.s44:
144a : a5 45 __ LDA T11 + 0 
144c : 29 03 __ AND #$03
144e : c9 01 __ CMP #$01
1450 : f0 1d __ BEQ $146f ; (ball_loop.s41 + 0)
.s25:
1452 : a5 45 __ LDA T11 + 0 
1454 : 29 0c __ AND #$0c
1456 : c9 04 __ CMP #$04
1458 : f0 15 __ BEQ $146f ; (ball_loop.s41 + 0)
.s26:
145a : aa __ __ TAX
145b : a5 49 __ LDA T1 + 1 
145d : 30 0c __ BMI $146b ; (ball_loop.s27 + 0)
.s43:
145f : 05 48 __ ORA T1 + 0 
1461 : f0 08 __ BEQ $146b ; (ball_loop.s27 + 0)
.s42:
1463 : a5 45 __ LDA T11 + 0 
1465 : 29 03 __ AND #$03
1467 : c9 02 __ CMP #$02
1469 : f0 04 __ BEQ $146f ; (ball_loop.s41 + 0)
.s27:
146b : e0 08 __ CPX #$08
146d : d0 06 __ BNE $1475 ; (ball_loop.s28 + 0)
.s41:
146f : e6 5b __ INC T15 + 0 
1471 : a9 ff __ LDA #$ff
1473 : 85 5a __ STA T14 + 0 
.s28:
1475 : 24 4f __ BIT T5 + 1 
1477 : 10 08 __ BPL $1481 ; (ball_loop.s29 + 0)
.s40:
1479 : a5 45 __ LDA T11 + 0 
147b : 29 05 __ AND #$05
147d : c9 01 __ CMP #$01
147f : f0 62 __ BEQ $14e3 ; (ball_loop.s36 + 0)
.s29:
1481 : a5 45 __ LDA T11 + 0 
1483 : 29 0a __ AND #$0a
1485 : c9 02 __ CMP #$02
1487 : f0 5a __ BEQ $14e3 ; (ball_loop.s36 + 0)
.s30:
1489 : aa __ __ TAX
148a : a5 4f __ LDA T5 + 1 
148c : 30 0c __ BMI $149a ; (ball_loop.s31 + 0)
.s39:
148e : 05 4e __ ORA T5 + 0 
1490 : f0 08 __ BEQ $149a ; (ball_loop.s31 + 0)
.s38:
1492 : a5 45 __ LDA T11 + 0 
1494 : 29 05 __ AND #$05
1496 : c9 04 __ CMP #$04
1498 : f0 49 __ BEQ $14e3 ; (ball_loop.s36 + 0)
.s31:
149a : e0 08 __ CPX #$08
149c : f0 45 __ BEQ $14e3 ; (ball_loop.s36 + 0)
.s32:
149e : a5 45 __ LDA T11 + 0 
14a0 : f0 2c __ BEQ $14ce ; (ball_loop.s33 + 0)
.s35:
14a2 : a5 53 __ LDA T7 + 0 
14a4 : 85 10 __ STA P3 
14a6 : a5 52 __ LDA T10 + 0 
14a8 : 85 11 __ STA P4 
14aa : 20 3e 15 JSR $153e ; (brick_hit.s4 + 0)
14ad : a5 55 __ LDA T8 + 0 
14af : 85 10 __ STA P3 
14b1 : a5 52 __ LDA T10 + 0 
14b3 : 85 11 __ STA P4 
14b5 : 20 3e 15 JSR $153e ; (brick_hit.s4 + 0)
14b8 : a5 53 __ LDA T7 + 0 
14ba : 85 10 __ STA P3 
14bc : a5 57 __ LDA T9 + 0 
14be : 85 11 __ STA P4 
14c0 : 20 3e 15 JSR $153e ; (brick_hit.s4 + 0)
14c3 : a5 55 __ LDA T8 + 0 
14c5 : 85 10 __ STA P3 
14c7 : a5 57 __ LDA T9 + 0 
14c9 : 85 11 __ STA P4 
14cb : 20 3e 15 JSR $153e ; (brick_hit.s4 + 0)
.s33:
14ce : a5 5b __ LDA T15 + 0 
14d0 : d0 03 __ BNE $14d5 ; (ball_loop.s34 + 0)
14d2 : 4c 55 13 JMP $1355 ; (ball_loop.s12 + 0)
.s34:
14d5 : a9 5a __ LDA #$5a
14d7 : 85 0d __ STA P0 
14d9 : a9 12 __ LDA #$12
14db : 85 0e __ STA P1 
14dd : 20 f0 14 JSR $14f0 ; (sound_trigger.s4 + 0)
14e0 : 4c 55 13 JMP $1355 ; (ball_loop.s12 + 0)
.s36:
14e3 : a2 01 __ LDX #$01
14e5 : 86 59 __ STX T13 + 0 
14e7 : a5 45 __ LDA T11 + 0 
14e9 : f0 ea __ BEQ $14d5 ; (ball_loop.s34 + 0)
.s37:
14eb : 86 5b __ STX T15 + 0 
14ed : 4c a2 14 JMP $14a2 ; (ball_loop.s35 + 0)
--------------------------------------------------------------------
sound_trigger: ; sound_trigger(u16)->void
; 301, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
14f0 : a5 0d __ LDA P0 ; (freq + 0)
14f2 : 8d d3 28 STA $28d3 ; (sound_freq + 0)
14f5 : a5 0e __ LDA P1 ; (freq + 1)
14f7 : 8d d4 28 STA $28d4 ; (sound_freq + 1)
14fa : ad d5 28 LDA $28d5 ; (sound_index + 0)
14fd : d0 06 __ BNE $1505 ; (sound_trigger.s6 + 0)
.s5:
14ff : a9 03 __ LDA #$03
.s8:
1501 : 8d d5 28 STA $28d5 ; (sound_index + 0)
.s3:
1504 : 60 __ __ RTS
.s6:
1505 : a9 06 __ LDA #$06
1507 : cd d5 28 CMP $28d5 ; (sound_index + 0)
150a : b0 f8 __ BCS $1504 ; (sound_trigger.s3 + 0)
.s7:
150c : a9 01 __ LDA #$01
150e : 90 f1 __ BCC $1501 ; (sound_trigger.s8 + 0)
--------------------------------------------------------------------
ball_lost: ; ball_lost(struct Ball*)->void
; 281, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
1510 : a9 00 __ LDA #$00
1512 : a0 01 __ LDY #$01
1514 : 91 0d __ STA (P0),y ; (ball + 0)
1516 : a8 __ __ TAY
1517 : b1 0d __ LDA (P0),y ; (ball + 0)
1519 : 18 __ __ CLC
151a : 69 01 __ ADC #$01
151c : 0a __ __ ASL
151d : aa __ __ TAX
151e : bd 33 28 LDA $2833,x ; (bitshift[0] + 8)
1521 : 49 ff __ EOR #$ff
1523 : 2d 15 d0 AND $d015 
1526 : 8d 15 d0 STA $d015 
1529 : b1 0d __ LDA (P0),y ; (ball + 0)
152b : 18 __ __ CLC
152c : 69 01 __ ADC #$01
152e : 0a __ __ ASL
152f : 09 01 __ ORA #$01
1531 : aa __ __ TAX
1532 : bd 33 28 LDA $2833,x ; (bitshift[0] + 8)
1535 : 49 ff __ EOR #$ff
1537 : 2d 15 d0 AND $d015 
153a : 8d 15 d0 STA $d015 
.s3:
153d : 60 __ __ RTS
--------------------------------------------------------------------
brick_hit: ; brick_hit(u8,u8)->void
; 149, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
153e : a5 11 __ LDA P4 ; (y + 0)
1540 : 0a __ __ ASL
1541 : 0a __ __ ASL
1542 : 65 11 __ ADC P4 ; (y + 0)
1544 : 0a __ __ ASL
1545 : 0a __ __ ASL
1546 : 85 45 __ STA T1 + 0 
1548 : a9 32 __ LDA #$32
154a : 2a __ __ ROL
154b : 06 45 __ ASL T1 + 0 
154d : 2a __ __ ROL
154e : 85 46 __ STA T1 + 1 
1550 : a4 10 __ LDY P3 ; (x + 0)
1552 : b1 45 __ LDA (T1 + 0),y 
1554 : 10 35 __ BPL $158b ; (brick_hit.s3 + 0)
.s5:
1556 : 29 07 __ AND #$07
1558 : c9 03 __ CMP #$03
155a : 90 04 __ BCC $1560 ; (brick_hit.s6 + 0)
.s12:
155c : c6 11 __ DEC P4 ; (y + 0)
155e : e9 03 __ SBC #$03
.s6:
1560 : 85 1b __ STA ACCU + 0 
1562 : 98 __ __ TYA
1563 : 38 __ __ SEC
1564 : e5 1b __ SBC ACCU + 0 
1566 : 85 44 __ STA T0 + 0 
1568 : a0 00 __ LDY #$00
156a : ad 8c 28 LDA $288c ; (numFlashingBricks[0] + 3)
156d : 85 47 __ STA T5 + 0 
156f : f0 16 __ BEQ $1587 ; (brick_hit.s7 + 0)
.l9:
1571 : 98 __ __ TYA
1572 : 0a __ __ ASL
1573 : aa __ __ TAX
1574 : a5 11 __ LDA P4 ; (y + 0)
1576 : dd 8e 28 CMP $288e,x ; (flashingBricks[0] + 1)
1579 : d0 07 __ BNE $1582 ; (brick_hit.s10 + 0)
.s11:
157b : a5 44 __ LDA T0 + 0 
157d : dd 8d 28 CMP $288d,x ; (flashingBricks[0] + 0)
1580 : f0 05 __ BEQ $1587 ; (brick_hit.s7 + 0)
.s10:
1582 : c8 __ __ INY
1583 : c4 47 __ CPY T5 + 0 
1585 : 90 ea __ BCC $1571 ; (brick_hit.l9 + 0)
.s7:
1587 : c4 47 __ CPY T5 + 0 
1589 : f0 01 __ BEQ $158c ; (brick_hit.s8 + 0)
.s3:
158b : 60 __ __ RTS
.s8:
158c : a9 00 __ LDA #$00
158e : 85 0d __ STA P0 
1590 : 85 0f __ STA P2 
1592 : 98 __ __ TYA
1593 : 0a __ __ ASL
1594 : aa __ __ TAX
1595 : a9 05 __ LDA #$05
1597 : 85 0e __ STA P1 
1599 : a5 44 __ LDA T0 + 0 
159b : 9d 8d 28 STA $288d,x ; (flashingBricks[0] + 0)
159e : a5 11 __ LDA P4 ; (y + 0)
15a0 : 9d 8e 28 STA $288e,x ; (flashingBricks[0] + 1)
15a3 : a6 47 __ LDX T5 + 0 
15a5 : e8 __ __ INX
15a6 : 8e 8c 28 STX $288c ; (numFlashingBricks[0] + 3)
15a9 : 0a __ __ ASL
15aa : 0a __ __ ASL
15ab : 65 11 __ ADC P4 ; (y + 0)
15ad : 0a __ __ ASL
15ae : 0a __ __ ASL
15af : 85 45 __ STA T1 + 0 
15b1 : a9 00 __ LDA #$00
15b3 : 2a __ __ ROL
15b4 : 06 45 __ ASL T1 + 0 
15b6 : 2a __ __ ROL
15b7 : aa __ __ TAX
15b8 : a5 45 __ LDA T1 + 0 
15ba : 65 44 __ ADC T0 + 0 
15bc : 85 45 __ STA T1 + 0 
15be : 8a __ __ TXA
15bf : 69 d8 __ ADC #$d8
15c1 : 85 46 __ STA T1 + 1 
15c3 : a9 09 __ LDA #$09
15c5 : a0 00 __ LDY #$00
15c7 : 91 45 __ STA (T1 + 0),y 
15c9 : c8 __ __ INY
15ca : 91 45 __ STA (T1 + 0),y 
15cc : c8 __ __ INY
15cd : 91 45 __ STA (T1 + 0),y 
15cf : a0 28 __ LDY #$28
15d1 : 91 45 __ STA (T1 + 0),y 
15d3 : c8 __ __ INY
15d4 : 91 45 __ STA (T1 + 0),y 
15d6 : c8 __ __ INY
15d7 : 91 45 __ STA (T1 + 0),y 
15d9 : 4c dc 15 JMP $15dc ; (score_inc.s4 + 0)
--------------------------------------------------------------------
score_inc: ; score_inc(u8,u16)->void
;  46, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
15dc : 38 __ __ SEC
15dd : a9 0d __ LDA #$0d
15df : e5 0d __ SBC P0 ; (digit + 0)
15e1 : 85 43 __ STA T0 + 0 
15e3 : 4c eb 15 JMP $15eb ; (score_inc.l5 + 0)
.s7:
15e6 : 99 00 c8 STA $c800,y 
15e9 : c6 43 __ DEC T0 + 0 
.l5:
15eb : a5 0f __ LDA P2 ; (val + 1)
15ed : 05 0e __ ORA P1 ; (val + 0)
15ef : f0 33 __ BEQ $1624 ; (score_inc.s3 + 0)
.s6:
15f1 : a5 0e __ LDA P1 ; (val + 0)
15f3 : 85 1b __ STA ACCU + 0 
15f5 : a5 0f __ LDA P2 ; (val + 1)
15f7 : 85 1c __ STA ACCU + 1 
15f9 : a9 0a __ LDA #$0a
15fb : 85 03 __ STA WORK + 0 
15fd : a9 00 __ LDA #$00
15ff : 85 04 __ STA WORK + 1 
1601 : 20 7c 17 JSR $177c ; (divmod + 0)
1604 : a5 1b __ LDA ACCU + 0 
1606 : 85 0e __ STA P1 ; (val + 0)
1608 : a5 1c __ LDA ACCU + 1 
160a : 85 0f __ STA P2 ; (val + 1)
160c : a4 43 __ LDY T0 + 0 
160e : b9 00 c8 LDA $c800,y 
1611 : 18 __ __ CLC
1612 : 65 05 __ ADC WORK + 2 
1614 : c9 3a __ CMP #$3a
1616 : 90 ce __ BCC $15e6 ; (score_inc.s7 + 0)
.s8:
1618 : e6 0e __ INC P1 ; (val + 0)
161a : d0 02 __ BNE $161e ; (score_inc.s10 + 0)
.s9:
161c : e6 0f __ INC P2 ; (val + 1)
.s10:
161e : 38 __ __ SEC
161f : e9 0a __ SBC #$0a
1621 : 4c e6 15 JMP $15e6 ; (score_inc.s7 + 0)
.s3:
1624 : 60 __ __ RTS
--------------------------------------------------------------------
sound_loop: ; sound_loop()->void
; 310, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
1625 : ad d5 28 LDA $28d5 ; (sound_index + 0)
1628 : c9 04 __ CMP #$04
162a : 90 48 __ BCC $1674 ; (sound_loop.s16 + 0)
.s5:
162c : a9 05 __ LDA #$05
162e : cd d5 28 CMP $28d5 ; (sound_index + 0)
1631 : b0 17 __ BCS $164a ; (sound_loop.s9 + 0)
.s6:
1633 : ad d5 28 LDA $28d5 ; (sound_index + 0)
1636 : c9 13 __ CMP #$13
1638 : d0 04 __ BNE $163e ; (sound_loop.s7 + 0)
.s15:
163a : a9 08 __ LDA #$08
163c : d0 30 __ BNE $166e ; (sound_loop.s20 + 0)
.s7:
163e : 90 0e __ BCC $164e ; (sound_loop.s11 + 0)
.s8:
1640 : c9 14 __ CMP #$14
1642 : d0 06 __ BNE $164a ; (sound_loop.s9 + 0)
.s10:
1644 : a9 00 __ LDA #$00
1646 : 8d d5 28 STA $28d5 ; (sound_index + 0)
1649 : 60 __ __ RTS
.s9:
164a : ee d5 28 INC $28d5 ; (sound_index + 0)
.s3:
164d : 60 __ __ RTS
.s11:
164e : c9 06 __ CMP #$06
1650 : d0 0b __ BNE $165d ; (sound_loop.s12 + 0)
.s14:
1652 : a9 07 __ LDA #$07
1654 : 8d d5 28 STA $28d5 ; (sound_index + 0)
1657 : a9 40 __ LDA #$40
1659 : 8d 04 d4 STA $d404 
165c : 60 __ __ RTS
.s12:
165d : c9 12 __ CMP #$12
165f : d0 e9 __ BNE $164a ; (sound_loop.s9 + 0)
.s13:
1661 : a9 00 __ LDA #$00
1663 : 8d 04 d4 STA $d404 
1666 : 8d 05 d4 STA $d405 
1669 : 8d 06 d4 STA $d406 
166c : f0 dc __ BEQ $164a ; (sound_loop.s9 + 0)
.s20:
166e : 8d 04 d4 STA $d404 
1671 : 4c 4a 16 JMP $164a ; (sound_loop.s9 + 0)
.s16:
1674 : c9 02 __ CMP #$02
1676 : f0 c2 __ BEQ $163a ; (sound_loop.s15 + 0)
.s17:
1678 : b0 04 __ BCS $167e ; (sound_loop.s18 + 0)
.s19:
167a : aa __ __ TAX
167b : d0 e4 __ BNE $1661 ; (sound_loop.s13 + 0)
167d : 60 __ __ RTS
.s18:
167e : ad d3 28 LDA $28d3 ; (sound_freq + 0)
1681 : 8d 00 d4 STA $d400 
1684 : ad d4 28 LDA $28d4 ; (sound_freq + 1)
1687 : 8d 01 d4 STA $d401 
168a : a9 00 __ LDA #$00
168c : 8d 05 d4 STA $d405 
168f : a9 f8 __ LDA #$f8
1691 : 8d 06 d4 STA $d406 
1694 : a9 00 __ LDA #$00
1696 : 8d 02 d4 STA $d402 
1699 : a9 08 __ LDA #$08
169b : 8d 03 d4 STA $d403 
169e : a9 c1 __ LDA #$c1
16a0 : b0 cc __ BCS $166e ; (sound_loop.s20 + 0)
--------------------------------------------------------------------
ball_move: ; ball_move(struct Ball*)->void
; 469, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
16a2 : a0 02 __ LDY #$02
16a4 : b1 0d __ LDA (P0),y ; (ball + 0)
16a6 : 85 1b __ STA ACCU + 0 
16a8 : c8 __ __ INY
16a9 : b1 0d __ LDA (P0),y ; (ball + 0)
16ab : 85 1c __ STA ACCU + 1 
16ad : c8 __ __ INY
16ae : b1 0d __ LDA (P0),y ; (ball + 0)
16b0 : 0a __ __ ASL
16b1 : 85 1d __ STA ACCU + 2 
16b3 : c8 __ __ INY
16b4 : b1 0d __ LDA (P0),y ; (ball + 0)
16b6 : 2a __ __ ROL
16b7 : 06 1d __ ASL ACCU + 2 
16b9 : 2a __ __ ROL
16ba : 18 __ __ CLC
16bb : 69 32 __ ADC #$32
16bd : 85 1d __ STA ACCU + 2 
16bf : a0 00 __ LDY #$00
16c1 : b1 0d __ LDA (P0),y ; (ball + 0)
16c3 : 18 __ __ CLC
16c4 : 69 01 __ ADC #$01
16c6 : 0a __ __ ASL
16c7 : 85 1e __ STA ACCU + 3 
16c9 : 0a __ __ ASL
16ca : 85 43 __ STA T4 + 0 
16cc : aa __ __ TAX
16cd : a5 1d __ LDA ACCU + 2 
16cf : 9d 01 d0 STA $d001,x 
16d2 : 06 1b __ ASL ACCU + 0 
16d4 : 26 1c __ ROL ACCU + 1 
16d6 : 98 __ __ TYA
16d7 : 69 ff __ ADC #$ff
16d9 : 49 ff __ EOR #$ff
16db : 06 1b __ ASL ACCU + 0 
16dd : 26 1c __ ROL ACCU + 1 
16df : 2a __ __ ROL
16e0 : a6 1c __ LDX ACCU + 1 
16e2 : 85 1c __ STA ACCU + 1 
16e4 : 8a __ __ TXA
16e5 : 18 __ __ CLC
16e6 : 69 18 __ ADC #$18
16e8 : 85 1b __ STA ACCU + 0 
16ea : a6 43 __ LDX T4 + 0 
16ec : 9d 00 d0 STA $d000,x 
16ef : a5 1c __ LDA ACCU + 1 
16f1 : 69 00 __ ADC #$00
16f3 : 29 01 __ AND #$01
16f5 : 85 1c __ STA ACCU + 1 
16f7 : a6 1e __ LDX ACCU + 3 
16f9 : 09 00 __ ORA #$00
16fb : d0 0b __ BNE $1708 ; (ball_move.s10 + 0)
.s5:
16fd : bd 33 28 LDA $2833,x ; (bitshift[0] + 8)
1700 : 49 ff __ EOR #$ff
1702 : 2d 10 d0 AND $d010 
1705 : 4c 0e 17 JMP $170e ; (ball_move.s6 + 0)
.s10:
1708 : ad 10 d0 LDA $d010 
170b : 1d 33 28 ORA $2833,x ; (bitshift[0] + 8)
.s6:
170e : 8d 10 d0 STA $d010 
1711 : b1 0d __ LDA (P0),y ; (ball + 0)
1713 : 18 __ __ CLC
1714 : 69 01 __ ADC #$01
1716 : 0a __ __ ASL
1717 : 09 01 __ ORA #$01
1719 : aa __ __ TAX
171a : 0a __ __ ASL
171b : a8 __ __ TAY
171c : a5 1d __ LDA ACCU + 2 
171e : 99 01 d0 STA $d001,y 
1721 : a5 1b __ LDA ACCU + 0 
1723 : 99 00 d0 STA $d000,y 
1726 : a5 1c __ LDA ACCU + 1 
1728 : d0 0b __ BNE $1735 ; (ball_move.s9 + 0)
.s7:
172a : bd 33 28 LDA $2833,x ; (bitshift[0] + 8)
172d : 49 ff __ EOR #$ff
172f : 2d 10 d0 AND $d010 
1732 : 4c 3b 17 JMP $173b ; (ball_move.s8 + 0)
.s9:
1735 : ad 10 d0 LDA $d010 
1738 : 1d 33 28 ORA $2833,x ; (bitshift[0] + 8)
.s8:
173b : 8d 10 d0 STA $d010 
.s3:
173e : 60 __ __ RTS
--------------------------------------------------------------------
paddle_move: ; paddle_move()->void
; 534, "/home/honza/projects/c64/projects/oscar64/samples/games/breakout.c"
.s4:
173f : a2 f0 __ LDX #$f0
1741 : 8e 01 d0 STX $d001 
1744 : ad 87 28 LDA $2887 ; (paddlex + 0)
1747 : 0a __ __ ASL
1748 : 85 1b __ STA ACCU + 0 
174a : ad 88 28 LDA $2888 ; (paddlex + 1)
174d : 2a __ __ ROL
174e : 85 1c __ STA ACCU + 1 
1750 : a9 00 __ LDA #$00
1752 : 69 ff __ ADC #$ff
1754 : 49 ff __ EOR #$ff
1756 : 06 1b __ ASL ACCU + 0 
1758 : 26 1c __ ROL ACCU + 1 
175a : 2a __ __ ROL
175b : a8 __ __ TAY
175c : 18 __ __ CLC
175d : a5 1c __ LDA ACCU + 1 
175f : 69 18 __ ADC #$18
1761 : 8d 00 d0 STA $d000 
1764 : 8e 03 d0 STX $d003 
1767 : aa __ __ TAX
1768 : 98 __ __ TYA
1769 : 69 00 __ ADC #$00
176b : 4a __ __ LSR
176c : ad 10 d0 LDA $d010 
176f : 09 03 __ ORA #$03
1771 : 8e 02 d0 STX $d002 
1774 : b0 02 __ BCS $1778 ; (paddle_move.s6 + 0)
.s5:
1776 : 29 fc __ AND #$fc
.s6:
1778 : 8d 10 d0 STA $d010 
.s3:
177b : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
177c : a5 1c __ LDA ACCU + 1 
177e : d0 31 __ BNE $17b1 ; (divmod + 53)
1780 : a5 04 __ LDA WORK + 1 
1782 : d0 1e __ BNE $17a2 ; (divmod + 38)
1784 : 85 06 __ STA WORK + 3 
1786 : a2 04 __ LDX #$04
1788 : 06 1b __ ASL ACCU + 0 
178a : 2a __ __ ROL
178b : c5 03 __ CMP WORK + 0 
178d : 90 02 __ BCC $1791 ; (divmod + 21)
178f : e5 03 __ SBC WORK + 0 
1791 : 26 1b __ ROL ACCU + 0 
1793 : 2a __ __ ROL
1794 : c5 03 __ CMP WORK + 0 
1796 : 90 02 __ BCC $179a ; (divmod + 30)
1798 : e5 03 __ SBC WORK + 0 
179a : 26 1b __ ROL ACCU + 0 
179c : ca __ __ DEX
179d : d0 eb __ BNE $178a ; (divmod + 14)
179f : 85 05 __ STA WORK + 2 
17a1 : 60 __ __ RTS
17a2 : a5 1b __ LDA ACCU + 0 
17a4 : 85 05 __ STA WORK + 2 
17a6 : a5 1c __ LDA ACCU + 1 
17a8 : 85 06 __ STA WORK + 3 
17aa : a9 00 __ LDA #$00
17ac : 85 1b __ STA ACCU + 0 
17ae : 85 1c __ STA ACCU + 1 
17b0 : 60 __ __ RTS
17b1 : a5 04 __ LDA WORK + 1 
17b3 : d0 1f __ BNE $17d4 ; (divmod + 88)
17b5 : a5 03 __ LDA WORK + 0 
17b7 : 30 1b __ BMI $17d4 ; (divmod + 88)
17b9 : a9 00 __ LDA #$00
17bb : 85 06 __ STA WORK + 3 
17bd : a2 10 __ LDX #$10
17bf : 06 1b __ ASL ACCU + 0 
17c1 : 26 1c __ ROL ACCU + 1 
17c3 : 2a __ __ ROL
17c4 : c5 03 __ CMP WORK + 0 
17c6 : 90 02 __ BCC $17ca ; (divmod + 78)
17c8 : e5 03 __ SBC WORK + 0 
17ca : 26 1b __ ROL ACCU + 0 
17cc : 26 1c __ ROL ACCU + 1 
17ce : ca __ __ DEX
17cf : d0 f2 __ BNE $17c3 ; (divmod + 71)
17d1 : 85 05 __ STA WORK + 2 
17d3 : 60 __ __ RTS
17d4 : a9 00 __ LDA #$00
17d6 : 85 05 __ STA WORK + 2 
17d8 : 85 06 __ STA WORK + 3 
17da : 84 02 __ STY $02 
17dc : a0 10 __ LDY #$10
17de : 18 __ __ CLC
17df : 26 1b __ ROL ACCU + 0 
17e1 : 26 1c __ ROL ACCU + 1 
17e3 : 26 05 __ ROL WORK + 2 
17e5 : 26 06 __ ROL WORK + 3 
17e7 : 38 __ __ SEC
17e8 : a5 05 __ LDA WORK + 2 
17ea : e5 03 __ SBC WORK + 0 
17ec : aa __ __ TAX
17ed : a5 06 __ LDA WORK + 3 
17ef : e5 04 __ SBC WORK + 1 
17f1 : 90 04 __ BCC $17f7 ; (divmod + 123)
17f3 : 86 05 __ STX WORK + 2 
17f5 : 85 06 __ STA WORK + 3 
17f7 : 88 __ __ DEY
17f8 : d0 e5 __ BNE $17df ; (divmod + 99)
17fa : 26 1b __ ROL ACCU + 0 
17fc : 26 1c __ ROL ACCU + 1 
17fe : a4 02 __ LDY $02 
1800 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1801 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
charset:
1802 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff c3 f9 c1 99 c1 ff : ................
1812 : __ __ __ BYT ff 9f 9f 83 99 99 83 ff ff ff c3 9f 9f 9f c3 ff : ................
1822 : __ __ __ BYT ff f9 f9 c1 99 99 c1 ff ff ff c3 99 81 9f c3 ff : ................
1832 : __ __ __ BYT ff f1 e7 c1 e7 e7 e7 ff ff ff c1 99 99 c1 f9 83 : ................
1842 : __ __ __ BYT ff 9f 9f 83 99 99 99 ff ff e7 ff c7 e7 e7 c3 ff : ................
1852 : __ __ __ BYT ff f9 ff f9 f9 f9 f9 c3 ff 9f 9f 93 87 93 99 ff : ................
1862 : __ __ __ BYT ff c7 e7 e7 e7 e7 c3 ff ff ff 99 80 80 94 9c ff : ................
1872 : __ __ __ BYT ff ff 83 99 99 99 99 ff ff ff c3 99 99 99 c3 ff : ................
1882 : __ __ __ BYT ff ff 83 99 99 83 9f 9f ff ff c1 99 99 c1 f9 f9 : ................
1892 : __ __ __ BYT ff ff 83 99 9f 9f 9f ff ff ff c1 9f c3 f9 83 ff : ................
18a2 : __ __ __ BYT ff e7 81 e7 e7 e7 f1 ff ff ff 99 99 99 99 c1 ff : ................
18b2 : __ __ __ BYT ff ff 99 99 99 c3 e7 ff ff ff 9c 94 80 c1 c9 ff : ................
18c2 : __ __ __ BYT ff ff 99 c3 e7 c3 99 ff ff ff 99 99 99 c1 f3 87 : ................
18d2 : __ __ __ BYT ff ff 81 f3 e7 cf 81 ff c3 cf cf cf cf cf c3 ff : ................
18e2 : __ __ __ BYT f3 ed cf 83 cf 9d 03 ff c3 f3 f3 f3 f3 f3 c3 ff : ................
18f2 : __ __ __ BYT ff e7 c3 81 e7 e7 e7 e7 ff ef cf 80 80 cf ef ff : ................
1902 : __ __ __ BYT ff ff ff ff ff ff ff ff e7 e7 e7 e7 ff ff e7 ff : ................
1912 : __ __ __ BYT 99 99 99 ff ff ff ff ff 99 99 00 99 00 99 99 ff : ................
1922 : __ __ __ BYT e7 c1 9f c3 f9 83 e7 ff 9d 99 f3 e7 cf 99 b9 ff : ................
1932 : __ __ __ BYT c3 99 c3 c7 98 99 c0 ff f9 f3 e7 ff ff ff ff ff : ................
1942 : __ __ __ BYT f3 e7 cf cf cf e7 f3 ff cf e7 f3 f3 f3 e7 cf ff : ................
1952 : __ __ __ BYT ff 99 c3 00 c3 99 ff ff ff e7 e7 81 e7 e7 ff ff : ................
1962 : __ __ __ BYT ff ff ff ff ff e7 e7 cf ff ff ff 81 ff ff ff ff : ................
1972 : __ __ __ BYT ff ff ff ff ff e7 e7 ff ff fc f9 f3 e7 cf 9f ff : ................
1982 : __ __ __ BYT c3 99 91 89 99 99 c3 ff e7 e7 c7 e7 e7 e7 81 ff : ................
1992 : __ __ __ BYT c3 99 f9 f3 cf 9f 81 ff c3 99 f9 e3 f9 99 c3 ff : ................
19a2 : __ __ __ BYT f9 f1 e1 99 80 f9 f9 ff 81 9f 83 f9 f9 99 c3 ff : ................
19b2 : __ __ __ BYT c3 99 9f 83 99 99 c3 ff 81 99 f3 e7 e7 e7 e7 ff : ................
19c2 : __ __ __ BYT c3 99 99 c3 99 99 c3 ff c3 99 99 c1 f9 99 c3 ff : ................
19d2 : __ __ __ BYT ff ff e7 ff ff e7 ff ff ff ff e7 ff ff e7 e7 cf : ................
19e2 : __ __ __ BYT f1 e7 cf 9f cf e7 f1 ff ff ff 81 ff 81 ff ff ff : ................
19f2 : __ __ __ BYT 8f e7 f3 f9 f3 e7 8f ff c3 99 f9 f3 e7 ff e7 ff : ................
1a02 : __ __ __ BYT ff ff ff 00 00 ff ff ff e7 c3 99 81 99 99 99 ff : ................
1a12 : __ __ __ BYT 83 99 99 83 99 99 83 ff c3 99 9f 9f 9f 99 c3 ff : ................
1a22 : __ __ __ BYT 87 93 99 99 99 93 87 ff 81 9f 9f 87 9f 9f 81 ff : ................
1a32 : __ __ __ BYT 81 9f 9f 87 9f 9f 9f ff c3 99 9f 91 99 99 c3 ff : ................
1a42 : __ __ __ BYT 99 99 99 81 99 99 99 ff c3 e7 e7 e7 e7 e7 c3 ff : ................
1a52 : __ __ __ BYT e1 f3 f3 f3 f3 93 c7 ff 99 93 87 8f 87 93 99 ff : ................
1a62 : __ __ __ BYT 9f 9f 9f 9f 9f 9f 81 ff 9c 88 80 94 9c 9c 9c ff : ................
1a72 : __ __ __ BYT 99 89 81 81 91 99 99 ff c3 99 99 99 99 99 c3 ff : ................
1a82 : __ __ __ BYT 83 99 99 83 9f 9f 9f ff c3 99 99 99 99 c3 f1 ff : ................
1a92 : __ __ __ BYT 83 99 99 83 87 93 99 ff c3 99 9f c3 f9 99 c3 ff : ................
1aa2 : __ __ __ BYT 81 e7 e7 e7 e7 e7 e7 ff 99 99 99 99 99 99 c3 ff : ................
1ab2 : __ __ __ BYT 99 99 99 99 99 c3 e7 ff 9c 9c 9c 94 80 88 9c ff : ................
1ac2 : __ __ __ BYT 99 99 c3 e7 c3 99 99 ff 99 99 99 c3 e7 e7 e7 ff : ................
1ad2 : __ __ __ BYT 81 f9 f3 e7 cf 9f 81 ff e7 e7 e7 00 00 e7 e7 e7 : ................
1ae2 : __ __ __ BYT 3f 3f cf cf 3f 3f cf cf e7 e7 e7 e7 e7 e7 e7 e7 : ??..??..........
1af2 : __ __ __ BYT cc cc 33 33 cc cc 33 33 ff ff ff ff ff ff ff ff : ..33..33........
1b02 : __ __ __ BYT ff ff fe fb ef ef ef ef ff ff bf ff ff f7 f7 f7 : ................
1b12 : __ __ __ BYT ef ef ef ff ff fd ff ff f7 f7 f7 f7 df 7f ff ff : ................
1b22 : __ __ __ BYT aa aa a8 a2 8a 8a 8a 8a aa aa 2a aa aa ae ae ae : ..........*.....
1b32 : __ __ __ BYT 8a 8a 8a aa aa ab aa aa ae ae ae ae ba ea aa aa : ................
1b42 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b52 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b62 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b72 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b82 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1b92 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ba2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1bb2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1bc2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1bd2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1be2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1bf2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c02 : __ __ __ BYT 55 55 7f 7f 7f 7f 7f 7f 55 55 ff ff ff ff ff ff : UU......UU......
1c12 : __ __ __ BYT 57 5e fc fe fc fe fc fe 7f 7f 7f 7f 7f 7f fa e0 : W^..............
1c22 : __ __ __ BYT ff ff ff ff ff ff aa 00 fc fe fc fe fc fe a8 00 : ................
1c32 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c42 : __ __ __ BYT 55 55 77 5d 77 5d 77 5d 55 55 77 dd 77 dd 77 dd : UUw]w]w]UUw.w.w.
1c52 : __ __ __ BYT 57 5e 74 de 74 de 74 de 77 5d 77 5d 77 5d fa e0 : W^t.t.t.w]w]w]..
1c62 : __ __ __ BYT 77 dd 77 dd 77 dd aa 00 74 de 74 de 74 de a8 00 : w.w.w...t.t.t...
1c72 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1c82 : __ __ __ BYT 55 55 7b 6e 7b 6e 7b 6e 55 55 bb ee bb ee bb ee : UU{n{n{nUU......
1c92 : __ __ __ BYT 57 5e b8 ee b8 ee b8 ee 7b 6e 7b 6e 7b 6e fa e0 : W^......{n{n{n..
1ca2 : __ __ __ BYT bb ee bb ee bb ee aa 00 b8 ee b8 ee b8 ee a8 00 : ................
1cb2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1cc2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1cd2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ce2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1cf2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d02 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d12 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d22 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d32 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d42 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d52 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d62 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d72 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d82 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1d92 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1da2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1db2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1dc2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1dd2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1de2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1df2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e02 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e12 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e22 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e32 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e42 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e52 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e62 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e72 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e82 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1e92 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ea2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1eb2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ec2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ed2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ee2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ef2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f02 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f12 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f22 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f32 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f42 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f52 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f62 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f72 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f82 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1f92 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fa2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fb2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fc2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fd2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1fe2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1ff2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
spriteset:
2002 : __ __ __ BYT 30 00 00 b4 00 00 f8 00 00 e4 00 00 94 00 00 00 : 0...............
2012 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2022 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2032 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9f : ................
2042 : __ __ __ BYT 78 00 00 84 00 00 84 00 00 84 00 00 84 00 00 78 : x..............x
2052 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2062 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2072 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2082 : __ __ __ BYT 00 00 00 9e aa ae df ff 9f 9e aa 9e 59 55 59 59 : ............YUYY
2092 : __ __ __ BYT 55 59 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : UY..............
20a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9f : ................
20c2 : __ __ __ BYT 67 ff e6 98 00 19 80 00 01 80 00 01 80 00 01 98 : g...............
20d2 : __ __ __ BYT 00 19 67 ff e6 00 00 00 00 00 00 00 00 00 00 00 : ..g.............
20e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
20f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2102 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2112 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2122 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2132 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2142 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2152 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2162 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2172 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2182 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2192 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
21c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
21f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2202 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2212 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2222 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2232 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2242 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2252 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2262 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2272 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2282 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2292 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
22c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
22f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2302 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2312 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2322 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2332 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2342 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2352 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2362 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2372 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
2382 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2392 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
23f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2402 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2412 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2422 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2432 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2442 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2452 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2462 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2472 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2482 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2492 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
24f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2502 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2512 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2522 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2532 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2542 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2552 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2562 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2572 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2582 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2592 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
25f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2602 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2612 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2622 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2632 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2642 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2652 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2662 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2672 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2682 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2692 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
26f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2702 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2712 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2722 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2732 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2742 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2752 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2762 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2772 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2782 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2792 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27a2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27b2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27c2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27d2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27e2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
27f2 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
StatusText:
2802 : __ __ __ BYT 20 53 03 0f 12 05 3a 20 30 30 30 30 30 30 20 20 :  S....: 000000  
2812 : __ __ __ BYT 48 09 07 08 3a 20 30 30 30 30 30 30 20 20 20 4c : H...: 000000   L
2822 : __ __ __ BYT 09 16 05 13 3a 20 30 20 00                      : ....: 0 .
--------------------------------------------------------------------
bitshift:
282b : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
283b : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
284b : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
285b : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
vspriteScreen:
2863 : __ __ __ BSS	2
--------------------------------------------------------------------
TheGame:
2865 : __ __ __ BSS	32
--------------------------------------------------------------------
paddlevx:
2885 : __ __ __ BSS	2
--------------------------------------------------------------------
paddlex:
2887 : __ __ __ BSS	2
--------------------------------------------------------------------
numFlashingBricks:
2889 : __ __ __ BSS	4
--------------------------------------------------------------------
flashingBricks:
288d : __ __ __ BSS	64
--------------------------------------------------------------------
joyy:
28cd : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
28cf : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
28d1 : __ __ __ BSS	2
--------------------------------------------------------------------
sound_freq:
28d3 : __ __ __ BSS	2
--------------------------------------------------------------------
sound_index:
28d5 : __ __ __ BSS	1
