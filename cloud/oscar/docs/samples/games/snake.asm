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
080e : 8e 29 0d STX $0d29 ; (spentry + 0)
0811 : a2 0d __ LDX #$0d
0813 : a0 34 __ LDY #$34
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0f __ CPX #$0f
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 42 __ CPY #$42
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
; 261, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
0880 : a9 00 __ LDA #$00
0882 : 85 13 __ STA P6 
0884 : 8d 20 d0 STA $d020 
0887 : 8d 21 d0 STA $d021 
088a : 20 a1 08 JSR $08a1 ; (game_state.s4 + 0)
.l5:
088d : 20 e1 09 JSR $09e1 ; (game_loop.s4 + 0)
.l6:
0890 : 2c 11 d0 BIT $d011 
0893 : 30 fb __ BMI $0890 ; (main.l6 + 0)
.s7:
0895 : 2c 11 d0 BIT $d011 
0898 : 30 f3 __ BMI $088d ; (main.l5 + 0)
.l8:
089a : 2c 11 d0 BIT $d011 
089d : 10 fb __ BPL $089a ; (main.l8 + 0)
089f : 30 ec __ BMI $088d ; (main.l5 + 0)
--------------------------------------------------------------------
game_state: ; game_state(enum GameState)->void
; 183, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
08a1 : a5 13 __ LDA P6 ; (state + 0)
08a3 : 8d 34 0d STA $0d34 ; (TheGame.state + 0)
08a6 : c9 01 __ CMP #$01
08a8 : d0 14 __ BNE $08be ; (game_state.s5 + 0)
.s9:
08aa : a9 36 __ LDA #$36
08ac : 85 0d __ STA P0 
08ae : a9 0d __ LDA #$0d
08b0 : 85 0e __ STA P1 
08b2 : 20 34 09 JSR $0934 ; (snake_init.s4 + 0)
08b5 : 20 61 09 JSR $0961 ; (screen_fruit.l4 + 0)
.s7:
08b8 : a9 10 __ LDA #$10
.s10:
08ba : 8d 35 0d STA $0d35 ; (TheGame.count + 0)
.s3:
08bd : 60 __ __ RTS
.s5:
08be : aa __ __ TAX
08bf : d0 07 __ BNE $08c8 ; (game_state.s6 + 0)
.s8:
08c1 : 20 cd 08 JSR $08cd ; (screen_init.s4 + 0)
08c4 : a9 20 __ LDA #$20
08c6 : d0 f2 __ BNE $08ba ; (game_state.s10 + 0)
.s6:
08c8 : c9 02 __ CMP #$02
08ca : f0 ec __ BEQ $08b8 ; (game_state.s7 + 0)
08cc : 60 __ __ RTS
--------------------------------------------------------------------
screen_init: ; screen_init()->void
;  76, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
08cd : a9 20 __ LDA #$20
08cf : a2 fa __ LDX #$fa
.l5:
08d1 : ca __ __ DEX
08d2 : 9d 00 04 STA $0400,x 
08d5 : 9d fa 04 STA $04fa,x 
08d8 : 9d f4 05 STA $05f4,x 
08db : 9d ee 06 STA $06ee,x 
08de : d0 f1 __ BNE $08d1 ; (screen_init.l5 + 0)
.s6:
08e0 : a2 00 __ LDX #$00
.l9:
08e2 : a9 a0 __ LDA #$a0
08e4 : 9d 00 04 STA $0400,x 
08e7 : 9d c0 07 STA $07c0,x 
08ea : a9 0f __ LDA #$0f
08ec : 9d 00 d8 STA $d800,x 
08ef : 9d c0 db STA $dbc0,x 
08f2 : e8 __ __ INX
08f3 : e0 28 __ CPX #$28
08f5 : d0 eb __ BNE $08e2 ; (screen_init.l9 + 0)
.s10:
08f7 : a9 00 __ LDA #$00
08f9 : 85 1b __ STA ACCU + 0 
08fb : a9 04 __ LDA #$04
08fd : 85 1c __ STA ACCU + 1 
.l7:
08ff : a9 a0 __ LDA #$a0
0901 : a0 00 __ LDY #$00
0903 : 84 1f __ STY ADDR + 0 
0905 : 91 1b __ STA (ACCU + 0),y 
0907 : a0 27 __ LDY #$27
0909 : 91 1b __ STA (ACCU + 0),y 
090b : 18 __ __ CLC
090c : a5 1c __ LDA ACCU + 1 
090e : 69 d4 __ ADC #$d4
0910 : 85 20 __ STA ADDR + 1 
0912 : a9 0f __ LDA #$0f
0914 : a4 1b __ LDY ACCU + 0 
0916 : 91 1f __ STA (ADDR + 0),y 
0918 : 84 1f __ STY ADDR + 0 
091a : a0 27 __ LDY #$27
091c : 91 1f __ STA (ADDR + 0),y 
091e : 18 __ __ CLC
091f : a5 1b __ LDA ACCU + 0 
0921 : 69 28 __ ADC #$28
0923 : 85 1b __ STA ACCU + 0 
0925 : 90 02 __ BCC $0929 ; (screen_init.s12 + 0)
.s11:
0927 : e6 1c __ INC ACCU + 1 
.s12:
0929 : c9 e8 __ CMP #$e8
092b : d0 d2 __ BNE $08ff ; (screen_init.l7 + 0)
.s8:
092d : a5 1c __ LDA ACCU + 1 
092f : c9 07 __ CMP #$07
0931 : d0 cc __ BNE $08ff ; (screen_init.l7 + 0)
.s3:
0933 : 60 __ __ RTS
--------------------------------------------------------------------
snake_init: ; snake_init(struct Snake*)->void
;  98, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
0934 : a9 14 __ LDA #$14
0936 : a0 00 __ LDY #$00
0938 : 91 0d __ STA (P0),y ; (s + 0)
093a : a9 0c __ LDA #$0c
093c : c8 __ __ INY
093d : 91 0d __ STA (P0),y ; (s + 0)
093f : 98 __ __ TYA
0940 : c8 __ __ INY
0941 : 91 0d __ STA (P0),y ; (s + 0)
0943 : a9 00 __ LDA #$00
0945 : c8 __ __ INY
0946 : 91 0d __ STA (P0),y ; (s + 0)
0948 : e6 0e __ INC P1 ; (s + 1)
094a : e6 0e __ INC P1 ; (s + 1)
094c : a9 01 __ LDA #$01
094e : c8 __ __ INY
094f : 91 0d __ STA (P0),y ; (s + 0)
0951 : a9 00 __ LDA #$00
0953 : c8 __ __ INY
0954 : 91 0d __ STA (P0),y ; (s + 0)
0956 : a9 51 __ LDA #$51
0958 : 8d f4 05 STA $05f4 
095b : a9 01 __ LDA #$01
095d : 8d f4 d9 STA $d9f4 
.s3:
0960 : 60 __ __ RTS
--------------------------------------------------------------------
screen_fruit: ; screen_fruit()->void
;  58, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.l4:
0961 : 20 ba 09 JSR $09ba ; (rand.s4 + 0)
0964 : a9 26 __ LDA #$26
0966 : 85 03 __ STA WORK + 0 
0968 : a9 00 __ LDA #$00
096a : 85 04 __ STA WORK + 1 
096c : 20 a4 0c JSR $0ca4 ; (divmod + 0)
096f : a5 05 __ LDA WORK + 2 
0971 : 85 43 __ STA T1 + 0 
0973 : 20 ba 09 JSR $09ba ; (rand.s4 + 0)
0976 : a9 17 __ LDA #$17
0978 : 85 03 __ STA WORK + 0 
097a : a9 00 __ LDA #$00
097c : 85 04 __ STA WORK + 1 
097e : 20 a4 0c JSR $0ca4 ; (divmod + 0)
0981 : 18 __ __ CLC
0982 : a5 05 __ LDA WORK + 2 
0984 : 69 01 __ ADC #$01
0986 : 85 1b __ STA ACCU + 0 
0988 : 0a __ __ ASL
0989 : 0a __ __ ASL
098a : 65 1b __ ADC ACCU + 0 
098c : 0a __ __ ASL
098d : 0a __ __ ASL
098e : 85 1b __ STA ACCU + 0 
0990 : a9 01 __ LDA #$01
0992 : 2a __ __ ROL
0993 : 06 1b __ ASL ACCU + 0 
0995 : 2a __ __ ROL
0996 : aa __ __ TAX
0997 : a5 1b __ LDA ACCU + 0 
0999 : 09 01 __ ORA #$01
099b : 65 43 __ ADC T1 + 0 
099d : 85 1b __ STA ACCU + 0 
099f : 90 01 __ BCC $09a2 ; (screen_fruit.s7 + 0)
.s6:
09a1 : e8 __ __ INX
.s7:
09a2 : 86 1c __ STX ACCU + 1 
09a4 : a0 00 __ LDY #$00
09a6 : b1 1b __ LDA (ACCU + 0),y 
09a8 : c9 20 __ CMP #$20
09aa : d0 b5 __ BNE $0961 ; (screen_fruit.l4 + 0)
.s5:
09ac : a9 53 __ LDA #$53
09ae : 91 1b __ STA (ACCU + 0),y 
09b0 : 8a __ __ TXA
09b1 : 69 d3 __ ADC #$d3
09b3 : 85 1c __ STA ACCU + 1 
09b5 : a9 07 __ LDA #$07
09b7 : 91 1b __ STA (ACCU + 0),y 
.s3:
09b9 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
09ba : ad 2b 0d LDA $0d2b ; (seed + 1)
09bd : 4a __ __ LSR
09be : ad 2a 0d LDA $0d2a ; (seed + 0)
09c1 : 6a __ __ ROR
09c2 : aa __ __ TAX
09c3 : a9 00 __ LDA #$00
09c5 : 6a __ __ ROR
09c6 : 4d 2a 0d EOR $0d2a ; (seed + 0)
09c9 : 85 1b __ STA ACCU + 0 
09cb : 8a __ __ TXA
09cc : 4d 2b 0d EOR $0d2b ; (seed + 1)
09cf : 85 1c __ STA ACCU + 1 
09d1 : 4a __ __ LSR
09d2 : 45 1b __ EOR ACCU + 0 
09d4 : 8d 2a 0d STA $0d2a ; (seed + 0)
09d7 : 85 1b __ STA ACCU + 0 
09d9 : 45 1c __ EOR ACCU + 1 
09db : 8d 2b 0d STA $0d2b ; (seed + 1)
09de : 85 1c __ STA ACCU + 1 
.s3:
09e0 : 60 __ __ RTS
--------------------------------------------------------------------
game_loop: ; game_loop()->void
; 225, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
09e1 : ad 34 0d LDA $0d34 ; (TheGame.state + 0)
09e4 : c9 01 __ CMP #$01
09e6 : f0 4f __ BEQ $0a37 ; (game_loop.s12 + 0)
.s5:
09e8 : aa __ __ TAX
09e9 : f0 43 __ BEQ $0a2e ; (game_loop.s10 + 0)
.s6:
09eb : c9 02 __ CMP #$02
09ed : d0 3e __ BNE $0a2d ; (game_loop.s3 + 0)
.s7:
09ef : ad 35 0d LDA $0d35 ; (TheGame.count + 0)
09f2 : 85 48 __ STA T1 + 0 
09f4 : 49 ff __ EOR #$ff
09f6 : 69 10 __ ADC #$10
09f8 : aa __ __ TAX
09f9 : a9 36 __ LDA #$36
09fb : 85 0d __ STA P0 
09fd : a9 0d __ LDA #$0d
09ff : 85 0e __ STA P1 
0a01 : a9 00 __ LDA #$00
0a03 : e9 00 __ SBC #$00
0a05 : a8 __ __ TAY
0a06 : 0a __ __ ASL
0a07 : 8a __ __ TXA
0a08 : 69 00 __ ADC #$00
0a0a : 85 47 __ STA T0 + 0 
0a0c : 98 __ __ TYA
0a0d : 69 00 __ ADC #$00
0a0f : 4a __ __ LSR
0a10 : 66 47 __ ROR T0 + 0 
0a12 : a6 47 __ LDX T0 + 0 
0a14 : bd 2c 0d LDA $0d2c,x ; (FlashColors[0] + 0)
0a17 : 85 0f __ STA P2 
0a19 : 20 23 0c JSR $0c23 ; (snake_flash.s4 + 0)
0a1c : 18 __ __ CLC
0a1d : a5 48 __ LDA T1 + 0 
0a1f : 69 ff __ ADC #$ff
0a21 : 8d 35 0d STA $0d35 ; (TheGame.count + 0)
0a24 : d0 07 __ BNE $0a2d ; (game_loop.s3 + 0)
.s8:
0a26 : a9 00 __ LDA #$00
.s9:
0a28 : 85 13 __ STA P6 
0a2a : 4c a1 08 JMP $08a1 ; (game_state.s4 + 0)
.s3:
0a2d : 60 __ __ RTS
.s10:
0a2e : ce 35 0d DEC $0d35 ; (TheGame.count + 0)
0a31 : d0 fa __ BNE $0a2d ; (game_loop.s3 + 0)
.s11:
0a33 : a9 01 __ LDA #$01
0a35 : d0 f1 __ BNE $0a28 ; (game_loop.s9 + 0)
.s12:
0a37 : a9 00 __ LDA #$00
0a39 : 20 67 0a JSR $0a67 ; (joy_poll.s4 + 0)
0a3c : ad 3e 0f LDA $0f3e ; (joyx[0] + 0)
0a3f : 85 0f __ STA P2 
0a41 : a9 36 __ LDA #$36
0a43 : 85 0d __ STA P0 
0a45 : a9 0d __ LDA #$0d
0a47 : 85 0e __ STA P1 
0a49 : ad 3c 0f LDA $0f3c ; (joyy[0] + 0)
0a4c : 85 10 __ STA P3 
0a4e : 20 a7 0a JSR $0aa7 ; (snake_control.s4 + 0)
0a51 : ce 35 0d DEC $0d35 ; (TheGame.count + 0)
0a54 : d0 d7 __ BNE $0a2d ; (game_loop.s3 + 0)
.s13:
0a56 : 20 cd 0a JSR $0acd ; (snake_advance.s4 + 0)
0a59 : a5 1b __ LDA ACCU + 0 
0a5b : f0 04 __ BEQ $0a61 ; (game_loop.s14 + 0)
.s15:
0a5d : a9 02 __ LDA #$02
0a5f : d0 c7 __ BNE $0a28 ; (game_loop.s9 + 0)
.s14:
0a61 : a9 04 __ LDA #$04
0a63 : 8d 35 0d STA $0d35 ; (TheGame.count + 0)
0a66 : 60 __ __ RTS
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
0a67 : aa __ __ TAX
0a68 : bd 00 dc LDA $dc00,x 
0a6b : a8 __ __ TAY
0a6c : 29 10 __ AND #$10
0a6e : f0 04 __ BEQ $0a74 ; (joy_poll.s10 + 0)
.s11:
0a70 : a9 00 __ LDA #$00
0a72 : f0 02 __ BEQ $0a76 ; (joy_poll.s12 + 0)
.s10:
0a74 : a9 01 __ LDA #$01
.s12:
0a76 : 9d 40 0f STA $0f40,x ; (joyb[0] + 0)
0a79 : 98 __ __ TYA
0a7a : 4a __ __ LSR
0a7b : b0 04 __ BCS $0a81 ; (joy_poll.s9 + 0)
.s5:
0a7d : a9 ff __ LDA #$ff
0a7f : 90 0b __ BCC $0a8c ; (joy_poll.s6 + 0)
.s9:
0a81 : 98 __ __ TYA
0a82 : 29 02 __ AND #$02
0a84 : f0 04 __ BEQ $0a8a ; (joy_poll.s13 + 0)
.s14:
0a86 : a9 00 __ LDA #$00
0a88 : b0 02 __ BCS $0a8c ; (joy_poll.s6 + 0)
.s13:
0a8a : a9 01 __ LDA #$01
.s6:
0a8c : 9d 3c 0f STA $0f3c,x ; (joyy[0] + 0)
0a8f : 98 __ __ TYA
0a90 : 29 04 __ AND #$04
0a92 : d0 06 __ BNE $0a9a ; (joy_poll.s8 + 0)
.s7:
0a94 : a9 ff __ LDA #$ff
.s3:
0a96 : 9d 3e 0f STA $0f3e,x ; (joyx[0] + 0)
0a99 : 60 __ __ RTS
.s8:
0a9a : 98 __ __ TYA
0a9b : 29 08 __ AND #$08
0a9d : f0 04 __ BEQ $0aa3 ; (joy_poll.s15 + 0)
.s16:
0a9f : a9 00 __ LDA #$00
0aa1 : f0 f3 __ BEQ $0a96 ; (joy_poll.s3 + 0)
.s15:
0aa3 : a9 01 __ LDA #$01
0aa5 : d0 ef __ BNE $0a96 ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
snake_control: ; snake_control(struct Snake*,i8,i8)->void
; 167, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
0aa7 : a0 02 __ LDY #$02
0aa9 : b1 0d __ LDA (P0),y ; (s + 0)
0aab : f0 0f __ BEQ $0abc ; (snake_control.s5 + 0)
.s8:
0aad : a5 10 __ LDA P3 ; (jy + 0)
0aaf : f0 0b __ BEQ $0abc ; (snake_control.s5 + 0)
.s9:
0ab1 : a9 00 __ LDA #$00
0ab3 : 91 0d __ STA (P0),y ; (s + 0)
0ab5 : a5 10 __ LDA P3 ; (jy + 0)
.s10:
0ab7 : a0 03 __ LDY #$03
0ab9 : 91 0d __ STA (P0),y ; (s + 0)
.s3:
0abb : 60 __ __ RTS
.s5:
0abc : a0 03 __ LDY #$03
0abe : b1 0d __ LDA (P0),y ; (s + 0)
0ac0 : f0 f9 __ BEQ $0abb ; (snake_control.s3 + 0)
.s6:
0ac2 : a5 0f __ LDA P2 ; (jx + 0)
0ac4 : f0 f5 __ BEQ $0abb ; (snake_control.s3 + 0)
.s7:
0ac6 : 88 __ __ DEY
0ac7 : 91 0d __ STA (P0),y ; (s + 0)
0ac9 : a9 00 __ LDA #$00
0acb : f0 ea __ BEQ $0ab7 ; (snake_control.s10 + 0)
--------------------------------------------------------------------
snake_advance: ; snake_advance(struct Snake*)->bool
; 116, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
0acd : a5 0d __ LDA P0 ; (s + 0)
0acf : 85 1f __ STA ADDR + 0 
0ad1 : 18 __ __ CLC
0ad2 : a5 0e __ LDA P1 ; (s + 1)
0ad4 : 69 02 __ ADC #$02
0ad6 : 85 20 __ STA ADDR + 1 
0ad8 : a0 05 __ LDY #$05
0ada : b1 1f __ LDA (ADDR + 0),y 
0adc : 0a __ __ ASL
0add : a2 00 __ LDX #$00
0adf : 90 02 __ BCC $0ae3 ; (snake_advance.s10 + 0)
.s9:
0ae1 : e8 __ __ INX
0ae2 : 18 __ __ CLC
.s10:
0ae3 : 65 0d __ ADC P0 ; (s + 0)
0ae5 : 85 44 __ STA T1 + 0 
0ae7 : 8a __ __ TXA
0ae8 : 65 0e __ ADC P1 ; (s + 1)
0aea : 85 45 __ STA T1 + 1 
0aec : a0 00 __ LDY #$00
0aee : b1 0d __ LDA (P0),y ; (s + 0)
0af0 : a0 04 __ LDY #$04
0af2 : 91 44 __ STA (T1 + 0),y 
0af4 : a0 01 __ LDY #$01
0af6 : b1 0d __ LDA (P0),y ; (s + 0)
0af8 : a0 05 __ LDY #$05
0afa : 91 44 __ STA (T1 + 0),y 
0afc : b1 1f __ LDA (ADDR + 0),y 
0afe : 18 __ __ CLC
0aff : 69 01 __ ADC #$01
0b01 : 91 1f __ STA (ADDR + 0),y 
0b03 : a0 01 __ LDY #$01
0b05 : b1 0d __ LDA (P0),y ; (s + 0)
0b07 : 0a __ __ ASL
0b08 : 85 1b __ STA ACCU + 0 
0b0a : a9 00 __ LDA #$00
0b0c : 2a __ __ ROL
0b0d : 06 1b __ ASL ACCU + 0 
0b0f : 2a __ __ ROL
0b10 : aa __ __ TAX
0b11 : a5 1b __ LDA ACCU + 0 
0b13 : 71 0d __ ADC (P0),y ; (s + 0)
0b15 : 85 1b __ STA ACCU + 0 
0b17 : 8a __ __ TXA
0b18 : 69 00 __ ADC #$00
0b1a : 06 1b __ ASL ACCU + 0 
0b1c : 2a __ __ ROL
0b1d : 06 1b __ ASL ACCU + 0 
0b1f : 2a __ __ ROL
0b20 : 06 1b __ ASL ACCU + 0 
0b22 : 2a __ __ ROL
0b23 : aa __ __ TAX
0b24 : a5 1b __ LDA ACCU + 0 
0b26 : 88 __ __ DEY
0b27 : 71 0d __ ADC (P0),y ; (s + 0)
0b29 : 85 1b __ STA ACCU + 0 
0b2b : 85 1f __ STA ADDR + 0 
0b2d : 8a __ __ TXA
0b2e : 69 04 __ ADC #$04
0b30 : 85 1c __ STA ACCU + 1 
0b32 : 69 d4 __ ADC #$d4
0b34 : 85 20 __ STA ADDR + 1 
0b36 : a9 51 __ LDA #$51
0b38 : 91 1b __ STA (ACCU + 0),y 
0b3a : a9 0e __ LDA #$0e
0b3c : 91 1f __ STA (ADDR + 0),y 
0b3e : b1 0d __ LDA (P0),y ; (s + 0)
0b40 : 18 __ __ CLC
0b41 : a0 02 __ LDY #$02
0b43 : 71 0d __ ADC (P0),y ; (s + 0)
0b45 : 85 44 __ STA T1 + 0 
0b47 : a0 00 __ LDY #$00
0b49 : 91 0d __ STA (P0),y ; (s + 0)
0b4b : a0 03 __ LDY #$03
0b4d : b1 0d __ LDA (P0),y ; (s + 0)
0b4f : 18 __ __ CLC
0b50 : a0 01 __ LDY #$01
0b52 : 71 0d __ ADC (P0),y ; (s + 0)
0b54 : 91 0d __ STA (P0),y ; (s + 0)
0b56 : a8 __ __ TAY
0b57 : 0a __ __ ASL
0b58 : 85 1b __ STA ACCU + 0 
0b5a : a9 00 __ LDA #$00
0b5c : 2a __ __ ROL
0b5d : 06 1b __ ASL ACCU + 0 
0b5f : 2a __ __ ROL
0b60 : aa __ __ TAX
0b61 : 98 __ __ TYA
0b62 : 65 1b __ ADC ACCU + 0 
0b64 : 85 1b __ STA ACCU + 0 
0b66 : 8a __ __ TXA
0b67 : 69 00 __ ADC #$00
0b69 : 06 1b __ ASL ACCU + 0 
0b6b : 2a __ __ ROL
0b6c : 06 1b __ ASL ACCU + 0 
0b6e : 2a __ __ ROL
0b6f : 06 1b __ ASL ACCU + 0 
0b71 : 2a __ __ ROL
0b72 : aa __ __ TAX
0b73 : a5 1b __ LDA ACCU + 0 
0b75 : 65 44 __ ADC T1 + 0 
0b77 : 85 1b __ STA ACCU + 0 
0b79 : 85 1f __ STA ADDR + 0 
0b7b : 8a __ __ TXA
0b7c : 69 04 __ ADC #$04
0b7e : 85 1c __ STA ACCU + 1 
0b80 : 69 d4 __ ADC #$d4
0b82 : 85 20 __ STA ADDR + 1 
0b84 : a9 01 __ LDA #$01
0b86 : a0 00 __ LDY #$00
0b88 : 91 1f __ STA (ADDR + 0),y 
0b8a : b1 1b __ LDA (ACCU + 0),y 
0b8c : 85 1d __ STA ACCU + 2 
0b8e : a9 51 __ LDA #$51
0b90 : 91 1b __ STA (ACCU + 0),y 
0b92 : a5 0d __ LDA P0 ; (s + 0)
0b94 : 85 1f __ STA ADDR + 0 
0b96 : 18 __ __ CLC
0b97 : 69 04 __ ADC #$04
0b99 : aa __ __ TAX
0b9a : a5 0e __ LDA P1 ; (s + 1)
0b9c : 69 00 __ ADC #$00
0b9e : 85 1c __ STA ACCU + 1 
0ba0 : 18 __ __ CLC
0ba1 : a5 0e __ LDA P1 ; (s + 1)
0ba3 : 69 02 __ ADC #$02
0ba5 : 85 20 __ STA ADDR + 1 
0ba7 : a0 05 __ LDY #$05
0ba9 : b1 1f __ LDA (ADDR + 0),y 
0bab : 38 __ __ SEC
0bac : 88 __ __ DEY
0bad : f1 1f __ SBC (ADDR + 0),y 
0baf : 0a __ __ ASL
0bb0 : 85 44 __ STA T1 + 0 
0bb2 : a9 00 __ LDA #$00
0bb4 : 2a __ __ ROL
0bb5 : a8 __ __ TAY
0bb6 : 8a __ __ TXA
0bb7 : 65 44 __ ADC T1 + 0 
0bb9 : 85 1b __ STA ACCU + 0 
0bbb : 98 __ __ TYA
0bbc : 65 1c __ ADC ACCU + 1 
0bbe : 85 1c __ STA ACCU + 1 
0bc0 : a0 00 __ LDY #$00
0bc2 : b1 1b __ LDA (ACCU + 0),y 
0bc4 : 85 44 __ STA T1 + 0 
0bc6 : c8 __ __ INY
0bc7 : b1 1b __ LDA (ACCU + 0),y 
0bc9 : a8 __ __ TAY
0bca : 0a __ __ ASL
0bcb : 85 1b __ STA ACCU + 0 
0bcd : a9 00 __ LDA #$00
0bcf : 2a __ __ ROL
0bd0 : 06 1b __ ASL ACCU + 0 
0bd2 : 2a __ __ ROL
0bd3 : aa __ __ TAX
0bd4 : 98 __ __ TYA
0bd5 : 65 1b __ ADC ACCU + 0 
0bd7 : 85 1b __ STA ACCU + 0 
0bd9 : 8a __ __ TXA
0bda : 69 00 __ ADC #$00
0bdc : 06 1b __ ASL ACCU + 0 
0bde : 2a __ __ ROL
0bdf : 06 1b __ ASL ACCU + 0 
0be1 : 2a __ __ ROL
0be2 : 06 1b __ ASL ACCU + 0 
0be4 : 2a __ __ ROL
0be5 : aa __ __ TAX
0be6 : a5 1b __ LDA ACCU + 0 
0be8 : 65 44 __ ADC T1 + 0 
0bea : 85 1b __ STA ACCU + 0 
0bec : 85 1f __ STA ADDR + 0 
0bee : 8a __ __ TXA
0bef : 69 04 __ ADC #$04
0bf1 : 85 1c __ STA ACCU + 1 
0bf3 : 69 d4 __ ADC #$d4
0bf5 : 85 20 __ STA ADDR + 1 
0bf7 : a9 20 __ LDA #$20
0bf9 : a0 00 __ LDY #$00
0bfb : 91 1b __ STA (ACCU + 0),y 
0bfd : 98 __ __ TYA
0bfe : 91 1f __ STA (ADDR + 0),y 
0c00 : a5 1d __ LDA ACCU + 2 
0c02 : c9 53 __ CMP #$53
0c04 : d0 15 __ BNE $0c1b ; (snake_advance.s5 + 0)
.s7:
0c06 : e6 0e __ INC P1 ; (s + 1)
0c08 : e6 0e __ INC P1 ; (s + 1)
0c0a : 18 __ __ CLC
0c0b : a0 04 __ LDY #$04
0c0d : b1 0d __ LDA (P0),y ; (s + 0)
0c0f : 69 01 __ ADC #$01
0c11 : 91 0d __ STA (P0),y ; (s + 0)
0c13 : 20 61 09 JSR $0961 ; (screen_fruit.l4 + 0)
.s8:
0c16 : a9 00 __ LDA #$00
.s3:
0c18 : 85 1b __ STA ACCU + 0 
0c1a : 60 __ __ RTS
.s5:
0c1b : c9 20 __ CMP #$20
0c1d : f0 f7 __ BEQ $0c16 ; (snake_advance.s8 + 0)
.s6:
0c1f : a9 01 __ LDA #$01
0c21 : d0 f5 __ BNE $0c18 ; (snake_advance.s3 + 0)
--------------------------------------------------------------------
snake_flash: ; snake_flash(struct Snake*,u8)->void
; 155, "/home/honza/projects/c64/projects/oscar64/samples/games/snake.c"
.s4:
0c23 : a5 0d __ LDA P0 ; (s + 0)
0c25 : 85 1f __ STA ADDR + 0 
0c27 : 18 __ __ CLC
0c28 : 69 04 __ ADC #$04
0c2a : 85 43 __ STA T1 + 0 
0c2c : a9 00 __ LDA #$00
0c2e : 85 1e __ STA ACCU + 3 
0c30 : a5 0e __ LDA P1 ; (s + 1)
0c32 : aa __ __ TAX
0c33 : 69 00 __ ADC #$00
0c35 : 85 44 __ STA T1 + 1 
.l5:
0c37 : 8a __ __ TXA
0c38 : 18 __ __ CLC
0c39 : 69 02 __ ADC #$02
0c3b : 85 20 __ STA ADDR + 1 
0c3d : a5 1e __ LDA ACCU + 3 
0c3f : a0 04 __ LDY #$04
0c41 : d1 1f __ CMP (ADDR + 0),y 
0c43 : b0 5e __ BCS $0ca3 ; (snake_flash.s3 + 0)
.s6:
0c45 : 8a __ __ TXA
0c46 : 69 02 __ ADC #$02
0c48 : 85 20 __ STA ADDR + 1 
0c4a : c8 __ __ INY
0c4b : b1 1f __ LDA (ADDR + 0),y 
0c4d : 18 __ __ CLC
0c4e : e5 1e __ SBC ACCU + 3 
0c50 : 0a __ __ ASL
0c51 : 85 45 __ STA T2 + 0 
0c53 : a5 44 __ LDA T1 + 1 
0c55 : 69 00 __ ADC #$00
0c57 : 85 46 __ STA T2 + 1 
0c59 : a4 43 __ LDY T1 + 0 
0c5b : b1 45 __ LDA (T2 + 0),y 
0c5d : 85 1d __ STA ACCU + 2 
0c5f : c8 __ __ INY
0c60 : b1 45 __ LDA (T2 + 0),y 
0c62 : a8 __ __ TAY
0c63 : 0a __ __ ASL
0c64 : 85 1b __ STA ACCU + 0 
0c66 : a9 00 __ LDA #$00
0c68 : 2a __ __ ROL
0c69 : 06 1b __ ASL ACCU + 0 
0c6b : 2a __ __ ROL
0c6c : 85 1c __ STA ACCU + 1 
0c6e : 98 __ __ TYA
0c6f : 65 1b __ ADC ACCU + 0 
0c71 : 85 45 __ STA T2 + 0 
0c73 : a5 1c __ LDA ACCU + 1 
0c75 : 69 00 __ ADC #$00
0c77 : 06 45 __ ASL T2 + 0 
0c79 : 2a __ __ ROL
0c7a : 06 45 __ ASL T2 + 0 
0c7c : 2a __ __ ROL
0c7d : 06 45 __ ASL T2 + 0 
0c7f : 2a __ __ ROL
0c80 : a8 __ __ TAY
0c81 : 18 __ __ CLC
0c82 : a5 45 __ LDA T2 + 0 
0c84 : 65 1d __ ADC ACCU + 2 
0c86 : 85 45 __ STA T2 + 0 
0c88 : 85 1b __ STA ACCU + 0 
0c8a : 98 __ __ TYA
0c8b : 69 04 __ ADC #$04
0c8d : 85 46 __ STA T2 + 1 
0c8f : 18 __ __ CLC
0c90 : 69 d4 __ ADC #$d4
0c92 : 85 1c __ STA ACCU + 1 
0c94 : a9 51 __ LDA #$51
0c96 : a0 00 __ LDY #$00
0c98 : 91 45 __ STA (T2 + 0),y 
0c9a : a5 0f __ LDA P2 ; (c + 0)
0c9c : 91 1b __ STA (ACCU + 0),y 
0c9e : e6 1e __ INC ACCU + 3 
0ca0 : 4c 37 0c JMP $0c37 ; (snake_flash.l5 + 0)
.s3:
0ca3 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
0ca4 : a5 1c __ LDA ACCU + 1 
0ca6 : d0 31 __ BNE $0cd9 ; (divmod + 53)
0ca8 : a5 04 __ LDA WORK + 1 
0caa : d0 1e __ BNE $0cca ; (divmod + 38)
0cac : 85 06 __ STA WORK + 3 
0cae : a2 04 __ LDX #$04
0cb0 : 06 1b __ ASL ACCU + 0 
0cb2 : 2a __ __ ROL
0cb3 : c5 03 __ CMP WORK + 0 
0cb5 : 90 02 __ BCC $0cb9 ; (divmod + 21)
0cb7 : e5 03 __ SBC WORK + 0 
0cb9 : 26 1b __ ROL ACCU + 0 
0cbb : 2a __ __ ROL
0cbc : c5 03 __ CMP WORK + 0 
0cbe : 90 02 __ BCC $0cc2 ; (divmod + 30)
0cc0 : e5 03 __ SBC WORK + 0 
0cc2 : 26 1b __ ROL ACCU + 0 
0cc4 : ca __ __ DEX
0cc5 : d0 eb __ BNE $0cb2 ; (divmod + 14)
0cc7 : 85 05 __ STA WORK + 2 
0cc9 : 60 __ __ RTS
0cca : a5 1b __ LDA ACCU + 0 
0ccc : 85 05 __ STA WORK + 2 
0cce : a5 1c __ LDA ACCU + 1 
0cd0 : 85 06 __ STA WORK + 3 
0cd2 : a9 00 __ LDA #$00
0cd4 : 85 1b __ STA ACCU + 0 
0cd6 : 85 1c __ STA ACCU + 1 
0cd8 : 60 __ __ RTS
0cd9 : a5 04 __ LDA WORK + 1 
0cdb : d0 1f __ BNE $0cfc ; (divmod + 88)
0cdd : a5 03 __ LDA WORK + 0 
0cdf : 30 1b __ BMI $0cfc ; (divmod + 88)
0ce1 : a9 00 __ LDA #$00
0ce3 : 85 06 __ STA WORK + 3 
0ce5 : a2 10 __ LDX #$10
0ce7 : 06 1b __ ASL ACCU + 0 
0ce9 : 26 1c __ ROL ACCU + 1 
0ceb : 2a __ __ ROL
0cec : c5 03 __ CMP WORK + 0 
0cee : 90 02 __ BCC $0cf2 ; (divmod + 78)
0cf0 : e5 03 __ SBC WORK + 0 
0cf2 : 26 1b __ ROL ACCU + 0 
0cf4 : 26 1c __ ROL ACCU + 1 
0cf6 : ca __ __ DEX
0cf7 : d0 f2 __ BNE $0ceb ; (divmod + 71)
0cf9 : 85 05 __ STA WORK + 2 
0cfb : 60 __ __ RTS
0cfc : a9 00 __ LDA #$00
0cfe : 85 05 __ STA WORK + 2 
0d00 : 85 06 __ STA WORK + 3 
0d02 : 84 02 __ STY $02 
0d04 : a0 10 __ LDY #$10
0d06 : 18 __ __ CLC
0d07 : 26 1b __ ROL ACCU + 0 
0d09 : 26 1c __ ROL ACCU + 1 
0d0b : 26 05 __ ROL WORK + 2 
0d0d : 26 06 __ ROL WORK + 3 
0d0f : 38 __ __ SEC
0d10 : a5 05 __ LDA WORK + 2 
0d12 : e5 03 __ SBC WORK + 0 
0d14 : aa __ __ TAX
0d15 : a5 06 __ LDA WORK + 3 
0d17 : e5 04 __ SBC WORK + 1 
0d19 : 90 04 __ BCC $0d1f ; (divmod + 123)
0d1b : 86 05 __ STX WORK + 2 
0d1d : 85 06 __ STA WORK + 3 
0d1f : 88 __ __ DEY
0d20 : d0 e5 __ BNE $0d07 ; (divmod + 99)
0d22 : 26 1b __ ROL ACCU + 0 
0d24 : 26 1c __ ROL ACCU + 1 
0d26 : a4 02 __ LDY $02 
0d28 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0d29 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seed:
0d2a : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
FlashColors:
0d2c : __ __ __ BYT 07 01 0f 07 08 02 0c 0b                         : ........
--------------------------------------------------------------------
TheGame:
0d34 : __ __ __ BSS	520
--------------------------------------------------------------------
joyy:
0f3c : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
0f3e : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
0f40 : __ __ __ BSS	2
