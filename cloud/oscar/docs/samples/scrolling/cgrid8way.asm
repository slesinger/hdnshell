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
080e : 8e a3 13 STX $13a3 ; (spentry + 0)
0811 : a2 14 __ LDX #$14
0813 : a0 40 __ LDY #$40
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 16 __ CPX #$16
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 00 __ CPY #$00
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
; 355, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/cgrid8way.c"
.s4:
0880 : 78 __ __ SEI
0881 : a9 00 __ LDA #$00
0883 : 85 44 __ STA T2 + 0 
0885 : 85 45 __ STA T2 + 1 
0887 : a9 15 __ LDA #$15
0889 : 85 47 __ STA T3 + 1 
.l5:
088b : a5 44 __ LDA T2 + 0 
088d : 85 46 __ STA T3 + 0 
088f : a9 00 __ LDA #$00
0891 : 85 48 __ STA T4 + 0 
.l6:
0893 : 20 37 0a JSR $0a37 ; (rand.s4 + 0)
0896 : a5 1b __ LDA ACCU + 0 
0898 : 29 03 __ AND #$03
089a : a4 48 __ LDY T4 + 0 
089c : 91 46 __ STA (T3 + 0),y 
089e : c8 __ __ INY
089f : 84 48 __ STY T4 + 0 
08a1 : c0 10 __ CPY #$10
08a3 : d0 ee __ BNE $0893 ; (main.l6 + 0)
.s7:
08a5 : 18 __ __ CLC
08a6 : a5 44 __ LDA T2 + 0 
08a8 : 69 10 __ ADC #$10
08aa : 85 44 __ STA T2 + 0 
08ac : a5 45 __ LDA T2 + 1 
08ae : 69 00 __ ADC #$00
08b0 : 85 45 __ STA T2 + 1 
08b2 : c9 01 __ CMP #$01
08b4 : d0 d5 __ BNE $088b ; (main.l5 + 0)
.s21:
08b6 : a5 44 __ LDA T2 + 0 
08b8 : d0 d1 __ BNE $088b ; (main.l5 + 0)
.s8:
08ba : 85 43 __ STA T1 + 0 
08bc : 85 48 __ STA T4 + 0 
08be : 85 49 __ STA T5 + 0 
08c0 : 85 0d __ STA P0 
08c2 : a9 04 __ LDA #$04
08c4 : 85 0e __ STA P1 
08c6 : a9 d8 __ LDA #$d8
08c8 : 85 10 __ STA P3 
08ca : a9 15 __ LDA #$15
08cc : 85 12 __ STA P5 
08ce : a9 00 __ LDA #$00
08d0 : 85 0f __ STA P2 
.l23:
08d2 : 29 1c __ AND #$1c
08d4 : 0a __ __ ASL
08d5 : 0a __ __ ASL
08d6 : 85 11 __ STA P4 
08d8 : a9 00 __ LDA #$00
08da : 85 14 __ STA P7 
08dc : a5 43 __ LDA T1 + 0 
08de : 29 03 __ AND #$03
08e0 : 0a __ __ ASL
08e1 : 0a __ __ ASL
08e2 : 85 13 __ STA P6 
08e4 : 20 5e 0a JSR $0a5e ; (expandrow.s4 + 0)
08e7 : 18 __ __ CLC
08e8 : a5 0d __ LDA P0 
08ea : 69 28 __ ADC #$28
08ec : 85 0d __ STA P0 
08ee : 90 03 __ BCC $08f3 ; (main.s25 + 0)
.s24:
08f0 : e6 0e __ INC P1 
08f2 : 18 __ __ CLC
.s25:
08f3 : a5 0f __ LDA P2 
08f5 : 69 28 __ ADC #$28
08f7 : 85 0f __ STA P2 
08f9 : 90 02 __ BCC $08fd ; (main.s27 + 0)
.s26:
08fb : e6 10 __ INC P3 
.s27:
08fd : e6 43 __ INC T1 + 0 
08ff : a5 43 __ LDA T1 + 0 
0901 : c9 19 __ CMP #$19
0903 : d0 cd __ BNE $08d2 ; (main.l23 + 0)
.s22:
0905 : a9 14 __ LDA #$14
0907 : 8d 11 d0 STA $d011 
090a : a9 04 __ LDA #$04
090c : 8d 16 d0 STA $d016 
.l9:
090f : a9 00 __ LDA #$00
0911 : 20 99 0a JSR $0a99 ; (joy_poll.s4 + 0)
0914 : ad a8 13 LDA $13a8 ; (joyx[0] + 0)
0917 : c9 01 __ CMP #$01
0919 : d0 45 __ BNE $0960 ; (main.s10 + 0)
.s19:
091b : a5 48 __ LDA T4 + 0 
091d : c9 18 __ CMP #$18
091f : b0 ee __ BCS $090f ; (main.l9 + 0)
.s20:
0921 : e6 48 __ INC T4 + 0 
0923 : a5 48 __ LDA T4 + 0 
0925 : 69 27 __ ADC #$27
0927 : aa __ __ TAX
0928 : 4a __ __ LSR
0929 : 4a __ __ LSR
092a : 85 43 __ STA T1 + 0 
092c : a5 49 __ LDA T5 + 0 
092e : 29 3c __ AND #$3c
0930 : 0a __ __ ASL
0931 : 0a __ __ ASL
0932 : 65 43 __ ADC T1 + 0 
0934 : 85 11 __ STA P4 
0936 : a5 49 __ LDA T5 + 0 
0938 : 29 03 __ AND #$03
093a : 0a __ __ ASL
093b : 0a __ __ ASL
093c : 85 13 __ STA P6 
093e : a9 15 __ LDA #$15
0940 : 85 12 __ STA P5 
0942 : a9 ac __ LDA #$ac
0944 : 85 0d __ STA P0 
0946 : a9 13 __ LDA #$13
0948 : 85 0e __ STA P1 
094a : a9 d4 __ LDA #$d4
094c : 85 0f __ STA P2 
094e : a9 13 __ LDA #$13
0950 : 85 10 __ STA P3 
0952 : 8a __ __ TXA
0953 : 29 03 __ AND #$03
0955 : 85 14 __ STA P7 
0957 : 20 d9 0a JSR $0ad9 ; (expandcol.s4 + 0)
095a : 20 20 0b JSR $0b20 ; (scroll_left.l4 + 0)
095d : 4c 0f 09 JMP $090f ; (main.l9 + 0)
.s10:
0960 : c9 ff __ CMP #$ff
0962 : d0 41 __ BNE $09a5 ; (main.s11 + 0)
.s17:
0964 : a5 48 __ LDA T4 + 0 
0966 : f0 a7 __ BEQ $090f ; (main.l9 + 0)
.s18:
0968 : c6 48 __ DEC T4 + 0 
096a : a5 48 __ LDA T4 + 0 
096c : 4a __ __ LSR
096d : 4a __ __ LSR
096e : 85 43 __ STA T1 + 0 
0970 : a5 49 __ LDA T5 + 0 
0972 : 29 3c __ AND #$3c
0974 : 0a __ __ ASL
0975 : 0a __ __ ASL
0976 : 65 43 __ ADC T1 + 0 
0978 : 85 11 __ STA P4 
097a : a5 49 __ LDA T5 + 0 
097c : 29 03 __ AND #$03
097e : 0a __ __ ASL
097f : 0a __ __ ASL
0980 : 85 13 __ STA P6 
0982 : a9 15 __ LDA #$15
0984 : 85 12 __ STA P5 
0986 : a9 ac __ LDA #$ac
0988 : 85 0d __ STA P0 
098a : a9 13 __ LDA #$13
098c : 85 0e __ STA P1 
098e : a9 d4 __ LDA #$d4
0990 : 85 0f __ STA P2 
0992 : a9 13 __ LDA #$13
0994 : 85 10 __ STA P3 
0996 : a5 48 __ LDA T4 + 0 
0998 : 29 03 __ AND #$03
099a : 85 14 __ STA P7 
099c : 20 d9 0a JSR $0ad9 ; (expandcol.s4 + 0)
099f : 20 e1 0d JSR $0de1 ; (scroll_right.l4 + 0)
09a2 : 4c 0f 09 JMP $090f ; (main.l9 + 0)
.s11:
09a5 : ad a6 13 LDA $13a6 ; (joyy[0] + 0)
09a8 : c9 01 __ CMP #$01
09aa : d0 46 __ BNE $09f2 ; (main.s12 + 0)
.s15:
09ac : a5 49 __ LDA T5 + 0 
09ae : c9 27 __ CMP #$27
09b0 : b0 f0 __ BCS $09a2 ; (main.s18 + 58)
.s16:
09b2 : a5 48 __ LDA T4 + 0 
09b4 : 4a __ __ LSR
09b5 : 4a __ __ LSR
09b6 : 85 43 __ STA T1 + 0 
09b8 : e6 49 __ INC T5 + 0 
09ba : 18 __ __ CLC
09bb : a5 49 __ LDA T5 + 0 
09bd : 69 18 __ ADC #$18
09bf : aa __ __ TAX
09c0 : 29 3c __ AND #$3c
09c2 : 0a __ __ ASL
09c3 : 0a __ __ ASL
09c4 : 65 43 __ ADC T1 + 0 
09c6 : 85 11 __ STA P4 
09c8 : 8a __ __ TXA
09c9 : 29 03 __ AND #$03
09cb : 0a __ __ ASL
09cc : 0a __ __ ASL
09cd : 85 13 __ STA P6 
09cf : a9 15 __ LDA #$15
09d1 : 85 12 __ STA P5 
09d3 : a9 ac __ LDA #$ac
09d5 : 85 0d __ STA P0 
09d7 : a9 13 __ LDA #$13
09d9 : 85 0e __ STA P1 
09db : a9 d4 __ LDA #$d4
09dd : 85 0f __ STA P2 
09df : a9 13 __ LDA #$13
09e1 : 85 10 __ STA P3 
09e3 : a5 48 __ LDA T4 + 0 
09e5 : 29 03 __ AND #$03
09e7 : 85 14 __ STA P7 
09e9 : 20 5e 0a JSR $0a5e ; (expandrow.s4 + 0)
09ec : 20 85 10 JSR $1085 ; (scroll_up.l4 + 0)
09ef : 4c 0f 09 JMP $090f ; (main.l9 + 0)
.s12:
09f2 : c9 ff __ CMP #$ff
09f4 : d0 f9 __ BNE $09ef ; (main.s16 + 61)
.s13:
09f6 : a5 49 __ LDA T5 + 0 
09f8 : f0 f5 __ BEQ $09ef ; (main.s16 + 61)
.s14:
09fa : a5 48 __ LDA T4 + 0 
09fc : 4a __ __ LSR
09fd : 4a __ __ LSR
09fe : 85 43 __ STA T1 + 0 
0a00 : c6 49 __ DEC T5 + 0 
0a02 : a5 49 __ LDA T5 + 0 
0a04 : 29 3c __ AND #$3c
0a06 : 0a __ __ ASL
0a07 : 0a __ __ ASL
0a08 : 65 43 __ ADC T1 + 0 
0a0a : 85 11 __ STA P4 
0a0c : a5 49 __ LDA T5 + 0 
0a0e : 29 03 __ AND #$03
0a10 : 0a __ __ ASL
0a11 : 0a __ __ ASL
0a12 : 85 13 __ STA P6 
0a14 : a9 15 __ LDA #$15
0a16 : 85 12 __ STA P5 
0a18 : a9 ac __ LDA #$ac
0a1a : 85 0d __ STA P0 
0a1c : a9 13 __ LDA #$13
0a1e : 85 0e __ STA P1 
0a20 : a9 d4 __ LDA #$d4
0a22 : 85 0f __ STA P2 
0a24 : a9 13 __ LDA #$13
0a26 : 85 10 __ STA P3 
0a28 : a5 48 __ LDA T4 + 0 
0a2a : 29 03 __ AND #$03
0a2c : 85 14 __ STA P7 
0a2e : 20 5e 0a JSR $0a5e ; (expandrow.s4 + 0)
0a31 : 20 03 12 JSR $1203 ; (scroll_down.l4 + 0)
0a34 : 4c 0f 09 JMP $090f ; (main.l9 + 0)
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0a37 : ad a5 13 LDA $13a5 ; (seed + 1)
0a3a : 4a __ __ LSR
0a3b : ad a4 13 LDA $13a4 ; (seed + 0)
0a3e : 6a __ __ ROR
0a3f : aa __ __ TAX
0a40 : a9 00 __ LDA #$00
0a42 : 6a __ __ ROR
0a43 : 4d a4 13 EOR $13a4 ; (seed + 0)
0a46 : 85 1b __ STA ACCU + 0 
0a48 : 8a __ __ TXA
0a49 : 4d a5 13 EOR $13a5 ; (seed + 1)
0a4c : 85 1c __ STA ACCU + 1 
0a4e : 4a __ __ LSR
0a4f : 45 1b __ EOR ACCU + 0 
0a51 : 8d a4 13 STA $13a4 ; (seed + 0)
0a54 : 85 1b __ STA ACCU + 0 
0a56 : 45 1c __ EOR ACCU + 1 
0a58 : 8d a5 13 STA $13a5 ; (seed + 1)
0a5b : 85 1c __ STA ACCU + 1 
.s3:
0a5d : 60 __ __ RTS
--------------------------------------------------------------------
expandrow: ; expandrow(u8*,u8*,const u8*,u8,u8)->void
;  48, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/cgrid8way.c"
.s4:
0a5e : a9 00 __ LDA #$00
0a60 : 85 1c __ STA ACCU + 1 
0a62 : 85 1b __ STA ACCU + 0 
.l5:
0a64 : a4 1c __ LDY ACCU + 1 
0a66 : b1 11 __ LDA (P4),y ; (grid + 0)
0a68 : 18 __ __ CLC
0a69 : 65 13 __ ADC P6 ; (ly + 0)
0a6b : a6 14 __ LDX P7 ; (lx + 0)
0a6d : 18 __ __ CLC
0a6e : 7d 9f 13 ADC $139f,x ; (__multab16L + 0)
0a71 : aa __ __ TAX
0a72 : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0a75 : a4 1b __ LDY ACCU + 0 
0a77 : 91 0d __ STA (P0),y ; (dp + 0)
0a79 : a4 1c __ LDY ACCU + 1 
0a7b : b1 11 __ LDA (P4),y ; (grid + 0)
0a7d : a4 1b __ LDY ACCU + 0 
0a7f : 91 0f __ STA (P2),y ; (cp + 0)
0a81 : a6 14 __ LDX P7 ; (lx + 0)
0a83 : e8 __ __ INX
0a84 : 86 14 __ STX P7 ; (lx + 0)
0a86 : e0 04 __ CPX #$04
0a88 : d0 06 __ BNE $0a90 ; (expandrow.s6 + 0)
.s7:
0a8a : e6 1c __ INC ACCU + 1 
0a8c : a9 00 __ LDA #$00
0a8e : 85 14 __ STA P7 ; (lx + 0)
.s6:
0a90 : e6 1b __ INC ACCU + 0 
0a92 : a5 1b __ LDA ACCU + 0 
0a94 : c9 28 __ CMP #$28
0a96 : d0 cc __ BNE $0a64 ; (expandrow.l5 + 0)
.s3:
0a98 : 60 __ __ RTS
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
0a99 : aa __ __ TAX
0a9a : bd 00 dc LDA $dc00,x 
0a9d : a8 __ __ TAY
0a9e : 29 10 __ AND #$10
0aa0 : f0 04 __ BEQ $0aa6 ; (joy_poll.s10 + 0)
.s11:
0aa2 : a9 00 __ LDA #$00
0aa4 : f0 02 __ BEQ $0aa8 ; (joy_poll.s12 + 0)
.s10:
0aa6 : a9 01 __ LDA #$01
.s12:
0aa8 : 9d aa 13 STA $13aa,x ; (joyb[0] + 0)
0aab : 98 __ __ TYA
0aac : 4a __ __ LSR
0aad : b0 04 __ BCS $0ab3 ; (joy_poll.s9 + 0)
.s5:
0aaf : a9 ff __ LDA #$ff
0ab1 : 90 0b __ BCC $0abe ; (joy_poll.s6 + 0)
.s9:
0ab3 : 98 __ __ TYA
0ab4 : 29 02 __ AND #$02
0ab6 : f0 04 __ BEQ $0abc ; (joy_poll.s13 + 0)
.s14:
0ab8 : a9 00 __ LDA #$00
0aba : b0 02 __ BCS $0abe ; (joy_poll.s6 + 0)
.s13:
0abc : a9 01 __ LDA #$01
.s6:
0abe : 9d a6 13 STA $13a6,x ; (joyy[0] + 0)
0ac1 : 98 __ __ TYA
0ac2 : 29 04 __ AND #$04
0ac4 : d0 06 __ BNE $0acc ; (joy_poll.s8 + 0)
.s7:
0ac6 : a9 ff __ LDA #$ff
.s3:
0ac8 : 9d a8 13 STA $13a8,x ; (joyx[0] + 0)
0acb : 60 __ __ RTS
.s8:
0acc : 98 __ __ TYA
0acd : 29 08 __ AND #$08
0acf : f0 04 __ BEQ $0ad5 ; (joy_poll.s15 + 0)
.s16:
0ad1 : a9 00 __ LDA #$00
0ad3 : f0 f3 __ BEQ $0ac8 ; (joy_poll.s3 + 0)
.s15:
0ad5 : a9 01 __ LDA #$01
0ad7 : d0 ef __ BNE $0ac8 ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
expandcol: ; expandcol(u8*,u8*,const u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/cgrid8way.c"
.s4:
0ad9 : a5 14 __ LDA P7 ; (lx + 0)
0adb : 0a __ __ ASL
0adc : 0a __ __ ASL
0add : 0a __ __ ASL
0ade : 0a __ __ ASL
0adf : 85 1b __ STA ACCU + 0 
0ae1 : a9 00 __ LDA #$00
0ae3 : 85 1c __ STA ACCU + 1 
.l5:
0ae5 : a0 00 __ LDY #$00
0ae7 : b1 11 __ LDA (P4),y ; (grid + 0)
0ae9 : 18 __ __ CLC
0aea : 65 13 __ ADC P6 ; (ly + 0)
0aec : 65 1b __ ADC ACCU + 0 
0aee : aa __ __ TAX
0aef : bd 00 14 LDA $1400,x ; (quad[0][0] + 0)
0af2 : a4 1c __ LDY ACCU + 1 
0af4 : 91 0d __ STA (P0),y ; (dp + 0)
0af6 : a0 00 __ LDY #$00
0af8 : b1 11 __ LDA (P4),y ; (grid + 0)
0afa : a4 1c __ LDY ACCU + 1 
0afc : 91 0f __ STA (P2),y ; (cp + 0)
0afe : 18 __ __ CLC
0aff : a5 13 __ LDA P6 ; (ly + 0)
0b01 : 69 04 __ ADC #$04
0b03 : 85 13 __ STA P6 ; (ly + 0)
0b05 : c9 10 __ CMP #$10
0b07 : d0 0e __ BNE $0b17 ; (expandcol.s6 + 0)
.s7:
0b09 : a9 00 __ LDA #$00
0b0b : 85 13 __ STA P6 ; (ly + 0)
0b0d : a5 11 __ LDA P4 ; (grid + 0)
0b0f : 69 0f __ ADC #$0f
0b11 : 85 11 __ STA P4 ; (grid + 0)
0b13 : 90 02 __ BCC $0b17 ; (expandcol.s6 + 0)
.s8:
0b15 : e6 12 __ INC P5 ; (grid + 1)
.s6:
0b17 : e6 1c __ INC ACCU + 1 
0b19 : a5 1c __ LDA ACCU + 1 
0b1b : c9 19 __ CMP #$19
0b1d : d0 c6 __ BNE $0ae5 ; (expandcol.l5 + 0)
.s3:
0b1f : 60 __ __ RTS
--------------------------------------------------------------------
scroll_left: ; scroll_left()->void
;  94, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/cgrid8way.c"
.l4:
0b20 : 2c 11 d0 BIT $d011 
0b23 : 30 fb __ BMI $0b20 ; (scroll_left.l4 + 0)
.l5:
0b25 : 2c 11 d0 BIT $d011 
0b28 : 10 fb __ BPL $0b25 ; (scroll_left.l5 + 0)
.s6:
0b2a : a9 02 __ LDA #$02
0b2c : 8d 16 d0 STA $d016 
.l7:
0b2f : 2c 11 d0 BIT $d011 
0b32 : 30 fb __ BMI $0b2f ; (scroll_left.l7 + 0)
.l8:
0b34 : 2c 11 d0 BIT $d011 
0b37 : 10 fb __ BPL $0b34 ; (scroll_left.l8 + 0)
.s9:
0b39 : a9 00 __ LDA #$00
0b3b : 85 0e __ STA P1 
0b3d : 8d 16 d0 STA $d016 
0b40 : a9 92 __ LDA #$92
0b42 : 85 0d __ STA P0 
0b44 : 20 c8 0d JSR $0dc8 ; (vic_waitLine.s4 + 0)
0b47 : a2 00 __ LDX #$00
.l14:
0b49 : bd 01 04 LDA $0401,x 
0b4c : 9d 00 04 STA $0400,x 
0b4f : bd 01 d8 LDA $d801,x 
0b52 : 9d 00 d8 STA $d800,x 
0b55 : bd 29 04 LDA $0429,x 
0b58 : 9d 28 04 STA $0428,x 
0b5b : bd 29 d8 LDA $d829,x 
0b5e : 9d 28 d8 STA $d828,x 
0b61 : bd 51 04 LDA $0451,x 
0b64 : 9d 50 04 STA $0450,x 
0b67 : bd 51 d8 LDA $d851,x 
0b6a : 9d 50 d8 STA $d850,x 
0b6d : bd 79 04 LDA $0479,x 
0b70 : 9d 78 04 STA $0478,x 
0b73 : bd 79 d8 LDA $d879,x 
0b76 : 9d 78 d8 STA $d878,x 
0b79 : bd a1 04 LDA $04a1,x 
0b7c : 9d a0 04 STA $04a0,x 
0b7f : bd a1 d8 LDA $d8a1,x 
0b82 : 9d a0 d8 STA $d8a0,x 
0b85 : bd c9 04 LDA $04c9,x 
0b88 : 9d c8 04 STA $04c8,x 
0b8b : bd c9 d8 LDA $d8c9,x 
0b8e : 9d c8 d8 STA $d8c8,x 
0b91 : bd f1 04 LDA $04f1,x 
0b94 : 9d f0 04 STA $04f0,x 
0b97 : bd f1 d8 LDA $d8f1,x 
0b9a : 9d f0 d8 STA $d8f0,x 
0b9d : bd 19 05 LDA $0519,x 
0ba0 : 9d 18 05 STA $0518,x 
0ba3 : bd 19 d9 LDA $d919,x 
0ba6 : 9d 18 d9 STA $d918,x 
0ba9 : bd 41 05 LDA $0541,x 
0bac : 9d 40 05 STA $0540,x 
0baf : bd 41 d9 LDA $d941,x 
0bb2 : 9d 40 d9 STA $d940,x 
0bb5 : bd 69 05 LDA $0569,x 
0bb8 : 9d 68 05 STA $0568,x 
0bbb : bd 69 d9 LDA $d969,x 
0bbe : 9d 68 d9 STA $d968,x 
0bc1 : bd 91 05 LDA $0591,x 
0bc4 : 9d 90 05 STA $0590,x 
0bc7 : bd 91 d9 LDA $d991,x 
0bca : 9d 90 d9 STA $d990,x 
0bcd : bd b9 05 LDA $05b9,x 
0bd0 : 9d b8 05 STA $05b8,x 
0bd3 : bd b9 d9 LDA $d9b9,x 
0bd6 : 9d b8 d9 STA $d9b8,x 
0bd9 : e8 __ __ INX
0bda : e0 27 __ CPX #$27
0bdc : f0 03 __ BEQ $0be1 ; (scroll_left.s15 + 0)
0bde : 4c 49 0b JMP $0b49 ; (scroll_left.l14 + 0)
.s15:
0be1 : ad ac 13 LDA $13ac ; (news[0] + 0)
0be4 : 8d 27 04 STA $0427 
0be7 : ad ad 13 LDA $13ad ; (news[0] + 1)
0bea : 8d 4f 04 STA $044f 
0bed : ad ae 13 LDA $13ae ; (news[0] + 2)
0bf0 : 8d 77 04 STA $0477 
0bf3 : ad af 13 LDA $13af ; (news[0] + 3)
0bf6 : 8d 9f 04 STA $049f 
0bf9 : ad b0 13 LDA $13b0 ; (news[0] + 4)
0bfc : 8d c7 04 STA $04c7 
0bff : ad b1 13 LDA $13b1 ; (news[0] + 5)
0c02 : 8d ef 04 STA $04ef 
0c05 : ad b2 13 LDA $13b2 ; (news[0] + 6)
0c08 : 8d 17 05 STA $0517 
0c0b : ad b3 13 LDA $13b3 ; (news[0] + 7)
0c0e : 8d 3f 05 STA $053f 
0c11 : ad b4 13 LDA $13b4 ; (news[0] + 8)
0c14 : 8d 67 05 STA $0567 
0c17 : ad b5 13 LDA $13b5 ; (news[0] + 9)
0c1a : 8d 8f 05 STA $058f 
0c1d : ad b6 13 LDA $13b6 ; (news[0] + 10)
0c20 : 8d b7 05 STA $05b7 
0c23 : ad b7 13 LDA $13b7 ; (news[0] + 11)
0c26 : 8d df 05 STA $05df 
0c29 : ad d4 13 LDA $13d4 ; (newc[0] + 0)
0c2c : 8d 27 d8 STA $d827 
0c2f : ad d5 13 LDA $13d5 ; (newc[0] + 1)
0c32 : 8d 4f d8 STA $d84f 
0c35 : ad d6 13 LDA $13d6 ; (newc[0] + 2)
0c38 : 8d 77 d8 STA $d877 
0c3b : ad d7 13 LDA $13d7 ; (newc[0] + 3)
0c3e : 8d 9f d8 STA $d89f 
0c41 : ad d8 13 LDA $13d8 ; (newc[0] + 4)
0c44 : 8d c7 d8 STA $d8c7 
0c47 : ad d9 13 LDA $13d9 ; (newc[0] + 5)
0c4a : 8d ef d8 STA $d8ef 
0c4d : ad da 13 LDA $13da ; (newc[0] + 6)
0c50 : 8d 17 d9 STA $d917 
0c53 : ad db 13 LDA $13db ; (newc[0] + 7)
0c56 : 8d 3f d9 STA $d93f 
0c59 : ad dc 13 LDA $13dc ; (newc[0] + 8)
0c5c : 8d 67 d9 STA $d967 
0c5f : ad dd 13 LDA $13dd ; (newc[0] + 9)
0c62 : 8d 8f d9 STA $d98f 
0c65 : ad de 13 LDA $13de ; (newc[0] + 10)
0c68 : 8d b7 d9 STA $d9b7 
0c6b : ad df 13 LDA $13df ; (newc[0] + 11)
0c6e : 8d df d9 STA $d9df 
.l10:
0c71 : 2c 11 d0 BIT $d011 
0c74 : 10 fb __ BPL $0c71 ; (scroll_left.l10 + 0)
.s11:
0c76 : a9 06 __ LDA #$06
0c78 : 8d 16 d0 STA $d016 
0c7b : a2 00 __ LDX #$00
.l16:
0c7d : bd e1 05 LDA $05e1,x 
0c80 : 9d e0 05 STA $05e0,x 
0c83 : bd e1 d9 LDA $d9e1,x 
0c86 : 9d e0 d9 STA $d9e0,x 
0c89 : bd 09 06 LDA $0609,x 
0c8c : 9d 08 06 STA $0608,x 
0c8f : bd 09 da LDA $da09,x 
0c92 : 9d 08 da STA $da08,x 
0c95 : bd 31 06 LDA $0631,x 
0c98 : 9d 30 06 STA $0630,x 
0c9b : bd 31 da LDA $da31,x 
0c9e : 9d 30 da STA $da30,x 
0ca1 : bd 59 06 LDA $0659,x 
0ca4 : 9d 58 06 STA $0658,x 
0ca7 : bd 59 da LDA $da59,x 
0caa : 9d 58 da STA $da58,x 
0cad : bd 81 06 LDA $0681,x 
0cb0 : 9d 80 06 STA $0680,x 
0cb3 : bd 81 da LDA $da81,x 
0cb6 : 9d 80 da STA $da80,x 
0cb9 : bd a9 06 LDA $06a9,x 
0cbc : 9d a8 06 STA $06a8,x 
0cbf : bd a9 da LDA $daa9,x 
0cc2 : 9d a8 da STA $daa8,x 
0cc5 : bd d1 06 LDA $06d1,x 
0cc8 : 9d d0 06 STA $06d0,x 
0ccb : bd d1 da LDA $dad1,x 
0cce : 9d d0 da STA $dad0,x 
0cd1 : bd f9 06 LDA $06f9,x 
0cd4 : 9d f8 06 STA $06f8,x 
0cd7 : bd f9 da LDA $daf9,x 
0cda : 9d f8 da STA $daf8,x 
0cdd : bd 21 07 LDA $0721,x 
0ce0 : 9d 20 07 STA $0720,x 
0ce3 : bd 21 db LDA $db21,x 
0ce6 : 9d 20 db STA $db20,x 
0ce9 : bd 49 07 LDA $0749,x 
0cec : 9d 48 07 STA $0748,x 
0cef : bd 49 db LDA $db49,x 
0cf2 : 9d 48 db STA $db48,x 
0cf5 : bd 71 07 LDA $0771,x 
0cf8 : 9d 70 07 STA $0770,x 
0cfb : bd 71 db LDA $db71,x 
0cfe : 9d 70 db STA $db70,x 
0d01 : bd 99 07 LDA $0799,x 
0d04 : 9d 98 07 STA $0798,x 
0d07 : bd 99 db LDA $db99,x 
0d0a : 9d 98 db STA $db98,x 
0d0d : bd c1 07 LDA $07c1,x 
0d10 : 9d c0 07 STA $07c0,x 
0d13 : bd c1 db LDA $dbc1,x 
0d16 : 9d c0 db STA $dbc0,x 
0d19 : e8 __ __ INX
0d1a : e0 27 __ CPX #$27
0d1c : f0 03 __ BEQ $0d21 ; (scroll_left.s17 + 0)
0d1e : 4c 7d 0c JMP $0c7d ; (scroll_left.l16 + 0)
.s17:
0d21 : ad b8 13 LDA $13b8 ; (news[0] + 12)
0d24 : 8d 07 06 STA $0607 
0d27 : ad b9 13 LDA $13b9 ; (news[0] + 13)
0d2a : 8d 2f 06 STA $062f 
0d2d : ad ba 13 LDA $13ba ; (news[0] + 14)
0d30 : 8d 57 06 STA $0657 
0d33 : ad bb 13 LDA $13bb ; (news[0] + 15)
0d36 : 8d 7f 06 STA $067f 
0d39 : ad bc 13 LDA $13bc ; (news[0] + 16)
0d3c : 8d a7 06 STA $06a7 
0d3f : ad bd 13 LDA $13bd ; (news[0] + 17)
0d42 : 8d cf 06 STA $06cf 
0d45 : ad be 13 LDA $13be ; (news[0] + 18)
0d48 : 8d f7 06 STA $06f7 
0d4b : ad bf 13 LDA $13bf ; (news[0] + 19)
0d4e : 8d 1f 07 STA $071f 
0d51 : ad c0 13 LDA $13c0 ; (news[0] + 20)
0d54 : 8d 47 07 STA $0747 
0d57 : ad c1 13 LDA $13c1 ; (news[0] + 21)
0d5a : 8d 6f 07 STA $076f 
0d5d : ad c2 13 LDA $13c2 ; (news[0] + 22)
0d60 : 8d 97 07 STA $0797 
0d63 : ad c3 13 LDA $13c3 ; (news[0] + 23)
0d66 : 8d bf 07 STA $07bf 
0d69 : ad c4 13 LDA $13c4 ; (news[0] + 24)
0d6c : 8d e7 07 STA $07e7 
0d6f : ad e0 13 LDA $13e0 ; (newc[0] + 12)
0d72 : 8d 07 da STA $da07 
0d75 : ad e1 13 LDA $13e1 ; (newc[0] + 13)
0d78 : 8d 2f da STA $da2f 
0d7b : ad e2 13 LDA $13e2 ; (newc[0] + 14)
0d7e : 8d 57 da STA $da57 
0d81 : ad e3 13 LDA $13e3 ; (newc[0] + 15)
0d84 : 8d 7f da STA $da7f 
0d87 : ad e4 13 LDA $13e4 ; (newc[0] + 16)
0d8a : 8d a7 da STA $daa7 
0d8d : ad e5 13 LDA $13e5 ; (newc[0] + 17)
0d90 : 8d cf da STA $dacf 
0d93 : ad e6 13 LDA $13e6 ; (newc[0] + 18)
0d96 : 8d f7 da STA $daf7 
0d99 : ad e7 13 LDA $13e7 ; (newc[0] + 19)
0d9c : 8d 1f db STA $db1f 
0d9f : ad e8 13 LDA $13e8 ; (newc[0] + 20)
0da2 : 8d 47 db STA $db47 
0da5 : ad e9 13 LDA $13e9 ; (newc[0] + 21)
0da8 : 8d 6f db STA $db6f 
0dab : ad ea 13 LDA $13ea ; (newc[0] + 22)
0dae : 8d 97 db STA $db97 
0db1 : ad eb 13 LDA $13eb ; (newc[0] + 23)
0db4 : 8d bf db STA $dbbf 
0db7 : ad ec 13 LDA $13ec ; (newc[0] + 24)
0dba : 8d e7 db STA $dbe7 
.l12:
0dbd : 2c 11 d0 BIT $d011 
0dc0 : 10 fb __ BPL $0dbd ; (scroll_left.l12 + 0)
.s13:
0dc2 : a9 04 __ LDA #$04
0dc4 : 8d 16 d0 STA $d016 
.s3:
0dc7 : 60 __ __ RTS
--------------------------------------------------------------------
vic_waitLine: ; vic_waitLine(i16)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0dc8 : 46 0e __ LSR P1 ; (line + 1)
0dca : a9 00 __ LDA #$00
0dcc : 6a __ __ ROR
0dcd : 85 1b __ STA ACCU + 0 
0dcf : a4 0d __ LDY P0 ; (line + 0)
.l5:
0dd1 : 98 __ __ TYA
.l7:
0dd2 : cd 12 d0 CMP $d012 
0dd5 : d0 fb __ BNE $0dd2 ; (vic_waitLine.l7 + 0)
.s6:
0dd7 : ad 11 d0 LDA $d011 
0dda : 29 80 __ AND #$80
0ddc : c5 1b __ CMP ACCU + 0 
0dde : d0 f1 __ BNE $0dd1 ; (vic_waitLine.l5 + 0)
.s3:
0de0 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_right: ; scroll_right()->void
; 166, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/cgrid8way.c"
.l4:
0de1 : 2c 11 d0 BIT $d011 
0de4 : 30 fb __ BMI $0de1 ; (scroll_right.l4 + 0)
.l5:
0de6 : 2c 11 d0 BIT $d011 
0de9 : 10 fb __ BPL $0de6 ; (scroll_right.l5 + 0)
.s6:
0deb : a9 92 __ LDA #$92
0ded : 85 0d __ STA P0 
0def : a9 00 __ LDA #$00
0df1 : 85 0e __ STA P1 
0df3 : a9 06 __ LDA #$06
0df5 : 8d 16 d0 STA $d016 
0df8 : 20 c8 0d JSR $0dc8 ; (vic_waitLine.s4 + 0)
0dfb : a0 27 __ LDY #$27
.l14:
0dfd : b9 ff 03 LDA $03ff,y 
0e00 : 99 00 04 STA $0400,y 
0e03 : b9 ff d7 LDA $d7ff,y 
0e06 : 99 00 d8 STA $d800,y 
0e09 : b9 27 04 LDA $0427,y 
0e0c : 99 28 04 STA $0428,y 
0e0f : b9 27 d8 LDA $d827,y 
0e12 : 99 28 d8 STA $d828,y 
0e15 : b9 4f 04 LDA $044f,y 
0e18 : 99 50 04 STA $0450,y 
0e1b : b9 4f d8 LDA $d84f,y 
0e1e : 99 50 d8 STA $d850,y 
0e21 : b9 77 04 LDA $0477,y 
0e24 : 99 78 04 STA $0478,y 
0e27 : b9 77 d8 LDA $d877,y 
0e2a : 99 78 d8 STA $d878,y 
0e2d : b9 9f 04 LDA $049f,y 
0e30 : 99 a0 04 STA $04a0,y 
0e33 : b9 9f d8 LDA $d89f,y 
0e36 : 99 a0 d8 STA $d8a0,y 
0e39 : b9 c7 04 LDA $04c7,y 
0e3c : 99 c8 04 STA $04c8,y 
0e3f : b9 c7 d8 LDA $d8c7,y 
0e42 : 99 c8 d8 STA $d8c8,y 
0e45 : b9 ef 04 LDA $04ef,y 
0e48 : 99 f0 04 STA $04f0,y 
0e4b : b9 ef d8 LDA $d8ef,y 
0e4e : 99 f0 d8 STA $d8f0,y 
0e51 : b9 17 05 LDA $0517,y 
0e54 : 99 18 05 STA $0518,y 
0e57 : b9 17 d9 LDA $d917,y 
0e5a : 99 18 d9 STA $d918,y 
0e5d : b9 3f 05 LDA $053f,y 
0e60 : 99 40 05 STA $0540,y 
0e63 : b9 3f d9 LDA $d93f,y 
0e66 : 99 40 d9 STA $d940,y 
0e69 : b9 67 05 LDA $0567,y 
0e6c : 99 68 05 STA $0568,y 
0e6f : b9 67 d9 LDA $d967,y 
0e72 : 99 68 d9 STA $d968,y 
0e75 : b9 8f 05 LDA $058f,y 
0e78 : 99 90 05 STA $0590,y 
0e7b : b9 8f d9 LDA $d98f,y 
0e7e : 99 90 d9 STA $d990,y 
0e81 : b9 b7 05 LDA $05b7,y 
0e84 : 99 b8 05 STA $05b8,y 
0e87 : b9 b7 d9 LDA $d9b7,y 
0e8a : 99 b8 d9 STA $d9b8,y 
0e8d : 88 __ __ DEY
0e8e : f0 03 __ BEQ $0e93 ; (scroll_right.s15 + 0)
0e90 : 4c fd 0d JMP $0dfd ; (scroll_right.l14 + 0)
.s15:
0e93 : ad ac 13 LDA $13ac ; (news[0] + 0)
0e96 : 8d 00 04 STA $0400 
0e99 : ad ad 13 LDA $13ad ; (news[0] + 1)
0e9c : 8d 28 04 STA $0428 
0e9f : ad ae 13 LDA $13ae ; (news[0] + 2)
0ea2 : 8d 50 04 STA $0450 
0ea5 : ad af 13 LDA $13af ; (news[0] + 3)
0ea8 : 8d 78 04 STA $0478 
0eab : ad b0 13 LDA $13b0 ; (news[0] + 4)
0eae : 8d a0 04 STA $04a0 
0eb1 : ad b1 13 LDA $13b1 ; (news[0] + 5)
0eb4 : 8d c8 04 STA $04c8 
0eb7 : ad b2 13 LDA $13b2 ; (news[0] + 6)
0eba : 8d f0 04 STA $04f0 
0ebd : ad b3 13 LDA $13b3 ; (news[0] + 7)
0ec0 : 8d 18 05 STA $0518 
0ec3 : ad b4 13 LDA $13b4 ; (news[0] + 8)
0ec6 : 8d 40 05 STA $0540 
0ec9 : ad b5 13 LDA $13b5 ; (news[0] + 9)
0ecc : 8d 68 05 STA $0568 
0ecf : ad b6 13 LDA $13b6 ; (news[0] + 10)
0ed2 : 8d 90 05 STA $0590 
0ed5 : ad b7 13 LDA $13b7 ; (news[0] + 11)
0ed8 : 8d b8 05 STA $05b8 
0edb : ad d4 13 LDA $13d4 ; (newc[0] + 0)
0ede : 8d 00 d8 STA $d800 
0ee1 : ad d5 13 LDA $13d5 ; (newc[0] + 1)
0ee4 : 8d 28 d8 STA $d828 
0ee7 : ad d6 13 LDA $13d6 ; (newc[0] + 2)
0eea : 8d 50 d8 STA $d850 
0eed : ad d7 13 LDA $13d7 ; (newc[0] + 3)
0ef0 : 8d 78 d8 STA $d878 
0ef3 : ad d8 13 LDA $13d8 ; (newc[0] + 4)
0ef6 : 8d a0 d8 STA $d8a0 
0ef9 : ad d9 13 LDA $13d9 ; (newc[0] + 5)
0efc : 8d c8 d8 STA $d8c8 
0eff : ad da 13 LDA $13da ; (newc[0] + 6)
0f02 : 8d f0 d8 STA $d8f0 
0f05 : ad db 13 LDA $13db ; (newc[0] + 7)
0f08 : 8d 18 d9 STA $d918 
0f0b : ad dc 13 LDA $13dc ; (newc[0] + 8)
0f0e : 8d 40 d9 STA $d940 
0f11 : ad dd 13 LDA $13dd ; (newc[0] + 9)
0f14 : 8d 68 d9 STA $d968 
0f17 : ad de 13 LDA $13de ; (newc[0] + 10)
0f1a : 8d 90 d9 STA $d990 
0f1d : ad df 13 LDA $13df ; (newc[0] + 11)
0f20 : 8d b8 d9 STA $d9b8 
.l7:
0f23 : 2c 11 d0 BIT $d011 
0f26 : 10 fb __ BPL $0f23 ; (scroll_right.l7 + 0)
.s8:
0f28 : 8c 16 d0 STY $d016 
0f2b : a2 27 __ LDX #$27
.l16:
0f2d : bd df 05 LDA $05df,x 
0f30 : 9d e0 05 STA $05e0,x 
0f33 : bd df d9 LDA $d9df,x 
0f36 : 9d e0 d9 STA $d9e0,x 
0f39 : bd 07 06 LDA $0607,x 
0f3c : 9d 08 06 STA $0608,x 
0f3f : bd 07 da LDA $da07,x 
0f42 : 9d 08 da STA $da08,x 
0f45 : bd 2f 06 LDA $062f,x 
0f48 : 9d 30 06 STA $0630,x 
0f4b : bd 2f da LDA $da2f,x 
0f4e : 9d 30 da STA $da30,x 
0f51 : bd 57 06 LDA $0657,x 
0f54 : 9d 58 06 STA $0658,x 
0f57 : bd 57 da LDA $da57,x 
0f5a : 9d 58 da STA $da58,x 
0f5d : bd 7f 06 LDA $067f,x 
0f60 : 9d 80 06 STA $0680,x 
0f63 : bd 7f da LDA $da7f,x 
0f66 : 9d 80 da STA $da80,x 
0f69 : bd a7 06 LDA $06a7,x 
0f6c : 9d a8 06 STA $06a8,x 
0f6f : bd a7 da LDA $daa7,x 
0f72 : 9d a8 da STA $daa8,x 
0f75 : bd cf 06 LDA $06cf,x 
0f78 : 9d d0 06 STA $06d0,x 
0f7b : bd cf da LDA $dacf,x 
0f7e : 9d d0 da STA $dad0,x 
0f81 : bd f7 06 LDA $06f7,x 
0f84 : 9d f8 06 STA $06f8,x 
0f87 : bd f7 da LDA $daf7,x 
0f8a : 9d f8 da STA $daf8,x 
0f8d : bd 1f 07 LDA $071f,x 
0f90 : 9d 20 07 STA $0720,x 
0f93 : bd 1f db LDA $db1f,x 
0f96 : 9d 20 db STA $db20,x 
0f99 : bd 47 07 LDA $0747,x 
0f9c : 9d 48 07 STA $0748,x 
0f9f : bd 47 db LDA $db47,x 
0fa2 : 9d 48 db STA $db48,x 
0fa5 : bd 6f 07 LDA $076f,x 
0fa8 : 9d 70 07 STA $0770,x 
0fab : bd 6f db LDA $db6f,x 
0fae : 9d 70 db STA $db70,x 
0fb1 : bd 97 07 LDA $0797,x 
0fb4 : 9d 98 07 STA $0798,x 
0fb7 : bd 97 db LDA $db97,x 
0fba : 9d 98 db STA $db98,x 
0fbd : bd bf 07 LDA $07bf,x 
0fc0 : 9d c0 07 STA $07c0,x 
0fc3 : bd bf db LDA $dbbf,x 
0fc6 : 9d c0 db STA $dbc0,x 
0fc9 : ca __ __ DEX
0fca : f0 03 __ BEQ $0fcf ; (scroll_right.s17 + 0)
0fcc : 4c 2d 0f JMP $0f2d ; (scroll_right.l16 + 0)
.s17:
0fcf : ad b8 13 LDA $13b8 ; (news[0] + 12)
0fd2 : 8d e0 05 STA $05e0 
0fd5 : ad b9 13 LDA $13b9 ; (news[0] + 13)
0fd8 : 8d 08 06 STA $0608 
0fdb : ad ba 13 LDA $13ba ; (news[0] + 14)
0fde : 8d 30 06 STA $0630 
0fe1 : ad bb 13 LDA $13bb ; (news[0] + 15)
0fe4 : 8d 58 06 STA $0658 
0fe7 : ad bc 13 LDA $13bc ; (news[0] + 16)
0fea : 8d 80 06 STA $0680 
0fed : ad bd 13 LDA $13bd ; (news[0] + 17)
0ff0 : 8d a8 06 STA $06a8 
0ff3 : ad be 13 LDA $13be ; (news[0] + 18)
0ff6 : 8d d0 06 STA $06d0 
0ff9 : ad bf 13 LDA $13bf ; (news[0] + 19)
0ffc : 8d f8 06 STA $06f8 
0fff : ad c0 13 LDA $13c0 ; (news[0] + 20)
1002 : 8d 20 07 STA $0720 
1005 : ad c1 13 LDA $13c1 ; (news[0] + 21)
1008 : 8d 48 07 STA $0748 
100b : ad c2 13 LDA $13c2 ; (news[0] + 22)
100e : 8d 70 07 STA $0770 
1011 : ad c3 13 LDA $13c3 ; (news[0] + 23)
1014 : 8d 98 07 STA $0798 
1017 : ad c4 13 LDA $13c4 ; (news[0] + 24)
101a : 8d c0 07 STA $07c0 
101d : ad e0 13 LDA $13e0 ; (newc[0] + 12)
1020 : 8d e0 d9 STA $d9e0 
1023 : ad e1 13 LDA $13e1 ; (newc[0] + 13)
1026 : 8d 08 da STA $da08 
1029 : ad e2 13 LDA $13e2 ; (newc[0] + 14)
102c : 8d 30 da STA $da30 
102f : ad e3 13 LDA $13e3 ; (newc[0] + 15)
1032 : 8d 58 da STA $da58 
1035 : ad e4 13 LDA $13e4 ; (newc[0] + 16)
1038 : 8d 80 da STA $da80 
103b : ad e5 13 LDA $13e5 ; (newc[0] + 17)
103e : 8d a8 da STA $daa8 
1041 : ad e6 13 LDA $13e6 ; (newc[0] + 18)
1044 : 8d d0 da STA $dad0 
1047 : ad e7 13 LDA $13e7 ; (newc[0] + 19)
104a : 8d f8 da STA $daf8 
104d : ad e8 13 LDA $13e8 ; (newc[0] + 20)
1050 : 8d 20 db STA $db20 
1053 : ad e9 13 LDA $13e9 ; (newc[0] + 21)
1056 : 8d 48 db STA $db48 
1059 : ad ea 13 LDA $13ea ; (newc[0] + 22)
105c : 8d 70 db STA $db70 
105f : ad eb 13 LDA $13eb ; (newc[0] + 23)
1062 : 8d 98 db STA $db98 
1065 : ad ec 13 LDA $13ec ; (newc[0] + 24)
1068 : 8d c0 db STA $dbc0 
.l9:
106b : 2c 11 d0 BIT $d011 
106e : 10 fb __ BPL $106b ; (scroll_right.l9 + 0)
.s10:
1070 : a9 02 __ LDA #$02
1072 : 8d 16 d0 STA $d016 
.l11:
1075 : 2c 11 d0 BIT $d011 
1078 : 30 fb __ BMI $1075 ; (scroll_right.l11 + 0)
.l12:
107a : 2c 11 d0 BIT $d011 
107d : 10 fb __ BPL $107a ; (scroll_right.l12 + 0)
.s13:
107f : a9 04 __ LDA #$04
1081 : 8d 16 d0 STA $d016 
.s3:
1084 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_up: ; scroll_up()->void
; 221, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/cgrid8way.c"
.l4:
1085 : 2c 11 d0 BIT $d011 
1088 : 30 fb __ BMI $1085 ; (scroll_up.l4 + 0)
.l5:
108a : 2c 11 d0 BIT $d011 
108d : 10 fb __ BPL $108a ; (scroll_up.l5 + 0)
.s6:
108f : a9 12 __ LDA #$12
1091 : 8d 11 d0 STA $d011 
.l7:
1094 : 2c 11 d0 BIT $d011 
1097 : 30 fb __ BMI $1094 ; (scroll_up.l7 + 0)
.l8:
1099 : 2c 11 d0 BIT $d011 
109c : 10 fb __ BPL $1099 ; (scroll_up.l8 + 0)
.s9:
109e : a9 92 __ LDA #$92
10a0 : 85 0d __ STA P0 
10a2 : a9 00 __ LDA #$00
10a4 : 85 0e __ STA P1 
10a6 : a9 10 __ LDA #$10
10a8 : 8d 11 d0 STA $d011 
10ab : 20 c8 0d JSR $0dc8 ; (vic_waitLine.s4 + 0)
10ae : a2 00 __ LDX #$00
.l14:
10b0 : bd 28 04 LDA $0428,x 
10b3 : 9d 00 04 STA $0400,x 
10b6 : bd 28 d8 LDA $d828,x 
10b9 : 9d 00 d8 STA $d800,x 
10bc : bd 50 04 LDA $0450,x 
10bf : 9d 28 04 STA $0428,x 
10c2 : bd 50 d8 LDA $d850,x 
10c5 : 9d 28 d8 STA $d828,x 
10c8 : bd 78 04 LDA $0478,x 
10cb : 9d 50 04 STA $0450,x 
10ce : bd 78 d8 LDA $d878,x 
10d1 : 9d 50 d8 STA $d850,x 
10d4 : bd a0 04 LDA $04a0,x 
10d7 : 9d 78 04 STA $0478,x 
10da : bd a0 d8 LDA $d8a0,x 
10dd : 9d 78 d8 STA $d878,x 
10e0 : bd c8 04 LDA $04c8,x 
10e3 : 9d a0 04 STA $04a0,x 
10e6 : bd c8 d8 LDA $d8c8,x 
10e9 : 9d a0 d8 STA $d8a0,x 
10ec : bd f0 04 LDA $04f0,x 
10ef : 9d c8 04 STA $04c8,x 
10f2 : bd f0 d8 LDA $d8f0,x 
10f5 : 9d c8 d8 STA $d8c8,x 
10f8 : bd 18 05 LDA $0518,x 
10fb : 9d f0 04 STA $04f0,x 
10fe : bd 18 d9 LDA $d918,x 
1101 : 9d f0 d8 STA $d8f0,x 
1104 : bd 40 05 LDA $0540,x 
1107 : 9d 18 05 STA $0518,x 
110a : bd 40 d9 LDA $d940,x 
110d : 9d 18 d9 STA $d918,x 
1110 : bd 68 05 LDA $0568,x 
1113 : 9d 40 05 STA $0540,x 
1116 : bd 68 d9 LDA $d968,x 
1119 : 9d 40 d9 STA $d940,x 
111c : bd 90 05 LDA $0590,x 
111f : 9d 68 05 STA $0568,x 
1122 : bd 90 d9 LDA $d990,x 
1125 : 9d 68 d9 STA $d968,x 
1128 : bd b8 05 LDA $05b8,x 
112b : 9d 90 05 STA $0590,x 
112e : bd b8 d9 LDA $d9b8,x 
1131 : 9d 90 d9 STA $d990,x 
1134 : bd e0 05 LDA $05e0,x 
1137 : 9d b8 05 STA $05b8,x 
113a : bd e0 d9 LDA $d9e0,x 
113d : 9d b8 d9 STA $d9b8,x 
1140 : e8 __ __ INX
1141 : e0 28 __ CPX #$28
1143 : f0 03 __ BEQ $1148 ; (scroll_up.l10 + 0)
1145 : 4c b0 10 JMP $10b0 ; (scroll_up.l14 + 0)
.l10:
1148 : 2c 11 d0 BIT $d011 
114b : 10 fb __ BPL $1148 ; (scroll_up.l10 + 0)
.s11:
114d : a9 16 __ LDA #$16
114f : 8d 11 d0 STA $d011 
1152 : a2 00 __ LDX #$00
.l15:
1154 : bd 08 06 LDA $0608,x 
1157 : 9d e0 05 STA $05e0,x 
115a : bd 08 da LDA $da08,x 
115d : 9d e0 d9 STA $d9e0,x 
1160 : bd 30 06 LDA $0630,x 
1163 : 9d 08 06 STA $0608,x 
1166 : bd 30 da LDA $da30,x 
1169 : 9d 08 da STA $da08,x 
116c : bd 58 06 LDA $0658,x 
116f : 9d 30 06 STA $0630,x 
1172 : bd 58 da LDA $da58,x 
1175 : 9d 30 da STA $da30,x 
1178 : bd 80 06 LDA $0680,x 
117b : 9d 58 06 STA $0658,x 
117e : bd 80 da LDA $da80,x 
1181 : 9d 58 da STA $da58,x 
1184 : bd a8 06 LDA $06a8,x 
1187 : 9d 80 06 STA $0680,x 
118a : bd a8 da LDA $daa8,x 
118d : 9d 80 da STA $da80,x 
1190 : bd d0 06 LDA $06d0,x 
1193 : 9d a8 06 STA $06a8,x 
1196 : bd d0 da LDA $dad0,x 
1199 : 9d a8 da STA $daa8,x 
119c : bd f8 06 LDA $06f8,x 
119f : 9d d0 06 STA $06d0,x 
11a2 : bd f8 da LDA $daf8,x 
11a5 : 9d d0 da STA $dad0,x 
11a8 : bd 20 07 LDA $0720,x 
11ab : 9d f8 06 STA $06f8,x 
11ae : bd 20 db LDA $db20,x 
11b1 : 9d f8 da STA $daf8,x 
11b4 : bd 48 07 LDA $0748,x 
11b7 : 9d 20 07 STA $0720,x 
11ba : bd 48 db LDA $db48,x 
11bd : 9d 20 db STA $db20,x 
11c0 : bd 70 07 LDA $0770,x 
11c3 : 9d 48 07 STA $0748,x 
11c6 : bd 70 db LDA $db70,x 
11c9 : 9d 48 db STA $db48,x 
11cc : bd 98 07 LDA $0798,x 
11cf : 9d 70 07 STA $0770,x 
11d2 : bd 98 db LDA $db98,x 
11d5 : 9d 70 db STA $db70,x 
11d8 : bd c0 07 LDA $07c0,x 
11db : 9d 98 07 STA $0798,x 
11de : bd c0 db LDA $dbc0,x 
11e1 : 9d 98 db STA $db98,x 
11e4 : bd ac 13 LDA $13ac,x ; (news[0] + 0)
11e7 : 9d c0 07 STA $07c0,x 
11ea : bd d4 13 LDA $13d4,x ; (newc[0] + 0)
11ed : 9d c0 db STA $dbc0,x 
11f0 : e8 __ __ INX
11f1 : e0 28 __ CPX #$28
11f3 : f0 03 __ BEQ $11f8 ; (scroll_up.l12 + 0)
11f5 : 4c 54 11 JMP $1154 ; (scroll_up.l15 + 0)
.l12:
11f8 : 2c 11 d0 BIT $d011 
11fb : 10 fb __ BPL $11f8 ; (scroll_up.l12 + 0)
.s13:
11fd : a9 14 __ LDA #$14
11ff : 8d 11 d0 STA $d011 
.s3:
1202 : 60 __ __ RTS
--------------------------------------------------------------------
scroll_down: ; scroll_down()->void
; 273, "/home/honza/projects/c64/projects/oscar64/samples/scrolling/cgrid8way.c"
.l4:
1203 : 2c 11 d0 BIT $d011 
1206 : 30 fb __ BMI $1203 ; (scroll_down.l4 + 0)
.l5:
1208 : 2c 11 d0 BIT $d011 
120b : 10 fb __ BPL $1208 ; (scroll_down.l5 + 0)
.s6:
120d : a2 00 __ LDX #$00
.l14:
120f : bd e0 05 LDA $05e0,x 
1212 : 9d 40 14 STA $1440,x ; (tmp0[0] + 0)
1215 : bd e0 d9 LDA $d9e0,x 
1218 : 9d 68 14 STA $1468,x ; (tmp1[0] + 0)
121b : bd 20 07 LDA $0720,x 
121e : 9d 90 14 STA $1490,x ; (tmp2[0] + 0)
1221 : bd 20 db LDA $db20,x 
1224 : 9d b8 14 STA $14b8,x ; (tmp3[0] + 0)
1227 : e8 __ __ INX
1228 : e0 28 __ CPX #$28
122a : d0 e3 __ BNE $120f ; (scroll_down.l14 + 0)
.s7:
122c : a9 9a __ LDA #$9a
122e : 85 0d __ STA P0 
1230 : a9 00 __ LDA #$00
1232 : 85 0e __ STA P1 
1234 : a9 16 __ LDA #$16
1236 : 8d 11 d0 STA $d011 
1239 : 20 c8 0d JSR $0dc8 ; (vic_waitLine.s4 + 0)
123c : a2 00 __ LDX #$00
.l15:
123e : bd b8 05 LDA $05b8,x 
1241 : 9d e0 05 STA $05e0,x 
1244 : bd b8 d9 LDA $d9b8,x 
1247 : 9d e0 d9 STA $d9e0,x 
124a : bd 90 05 LDA $0590,x 
124d : 9d b8 05 STA $05b8,x 
1250 : bd 90 d9 LDA $d990,x 
1253 : 9d b8 d9 STA $d9b8,x 
1256 : bd 68 05 LDA $0568,x 
1259 : 9d 90 05 STA $0590,x 
125c : bd 68 d9 LDA $d968,x 
125f : 9d 90 d9 STA $d990,x 
1262 : bd 40 05 LDA $0540,x 
1265 : 9d 68 05 STA $0568,x 
1268 : bd 40 d9 LDA $d940,x 
126b : 9d 68 d9 STA $d968,x 
126e : bd 18 05 LDA $0518,x 
1271 : 9d 40 05 STA $0540,x 
1274 : bd 18 d9 LDA $d918,x 
1277 : 9d 40 d9 STA $d940,x 
127a : bd f0 04 LDA $04f0,x 
127d : 9d 18 05 STA $0518,x 
1280 : bd f0 d8 LDA $d8f0,x 
1283 : 9d 18 d9 STA $d918,x 
1286 : bd c8 04 LDA $04c8,x 
1289 : 9d f0 04 STA $04f0,x 
128c : bd c8 d8 LDA $d8c8,x 
128f : 9d f0 d8 STA $d8f0,x 
1292 : bd a0 04 LDA $04a0,x 
1295 : 9d c8 04 STA $04c8,x 
1298 : bd a0 d8 LDA $d8a0,x 
129b : 9d c8 d8 STA $d8c8,x 
129e : bd 78 04 LDA $0478,x 
12a1 : 9d a0 04 STA $04a0,x 
12a4 : bd 78 d8 LDA $d878,x 
12a7 : 9d a0 d8 STA $d8a0,x 
12aa : bd 50 04 LDA $0450,x 
12ad : 9d 78 04 STA $0478,x 
12b0 : bd 50 d8 LDA $d850,x 
12b3 : 9d 78 d8 STA $d878,x 
12b6 : bd 28 04 LDA $0428,x 
12b9 : 9d 50 04 STA $0450,x 
12bc : bd 28 d8 LDA $d828,x 
12bf : 9d 50 d8 STA $d850,x 
12c2 : bd 00 04 LDA $0400,x 
12c5 : 9d 28 04 STA $0428,x 
12c8 : bd 00 d8 LDA $d800,x 
12cb : 9d 28 d8 STA $d828,x 
12ce : bd ac 13 LDA $13ac,x ; (news[0] + 0)
12d1 : 9d 00 04 STA $0400,x 
12d4 : bd d4 13 LDA $13d4,x ; (newc[0] + 0)
12d7 : 9d 00 d8 STA $d800,x 
12da : e8 __ __ INX
12db : e0 28 __ CPX #$28
12dd : f0 03 __ BEQ $12e2 ; (scroll_down.s16 + 0)
12df : 4c 3e 12 JMP $123e ; (scroll_down.l15 + 0)
.s16:
12e2 : a9 10 __ LDA #$10
12e4 : 8d 11 d0 STA $d011 
12e7 : a2 00 __ LDX #$00
.l17:
12e9 : bd f8 06 LDA $06f8,x 
12ec : 9d 20 07 STA $0720,x 
12ef : bd f8 da LDA $daf8,x 
12f2 : 9d 20 db STA $db20,x 
12f5 : bd d0 06 LDA $06d0,x 
12f8 : 9d f8 06 STA $06f8,x 
12fb : bd d0 da LDA $dad0,x 
12fe : 9d f8 da STA $daf8,x 
1301 : bd a8 06 LDA $06a8,x 
1304 : 9d d0 06 STA $06d0,x 
1307 : bd a8 da LDA $daa8,x 
130a : 9d d0 da STA $dad0,x 
130d : bd 80 06 LDA $0680,x 
1310 : 9d a8 06 STA $06a8,x 
1313 : bd 80 da LDA $da80,x 
1316 : 9d a8 da STA $daa8,x 
1319 : bd 58 06 LDA $0658,x 
131c : 9d 80 06 STA $0680,x 
131f : bd 58 da LDA $da58,x 
1322 : 9d 80 da STA $da80,x 
1325 : bd 30 06 LDA $0630,x 
1328 : 9d 58 06 STA $0658,x 
132b : bd 30 da LDA $da30,x 
132e : 9d 58 da STA $da58,x 
1331 : bd 08 06 LDA $0608,x 
1334 : 9d 30 06 STA $0630,x 
1337 : bd 08 da LDA $da08,x 
133a : 9d 30 da STA $da30,x 
133d : bd 40 14 LDA $1440,x ; (tmp0[0] + 0)
1340 : 9d 08 06 STA $0608,x 
1343 : bd 68 14 LDA $1468,x ; (tmp1[0] + 0)
1346 : 9d 08 da STA $da08,x 
1349 : e8 __ __ INX
134a : e0 28 __ CPX #$28
134c : d0 9b __ BNE $12e9 ; (scroll_down.l17 + 0)
.s8:
134e : a2 00 __ LDX #$00
.l18:
1350 : bd 98 07 LDA $0798,x 
1353 : 9d c0 07 STA $07c0,x 
1356 : bd 98 db LDA $db98,x 
1359 : 9d c0 db STA $dbc0,x 
135c : bd 70 07 LDA $0770,x 
135f : 9d 98 07 STA $0798,x 
1362 : bd 70 db LDA $db70,x 
1365 : 9d 98 db STA $db98,x 
1368 : bd 48 07 LDA $0748,x 
136b : 9d 70 07 STA $0770,x 
136e : bd 48 db LDA $db48,x 
1371 : 9d 70 db STA $db70,x 
1374 : bd 90 14 LDA $1490,x ; (tmp2[0] + 0)
1377 : 9d 48 07 STA $0748,x 
137a : bd b8 14 LDA $14b8,x ; (tmp3[0] + 0)
137d : 9d 48 db STA $db48,x 
1380 : e8 __ __ INX
1381 : e0 28 __ CPX #$28
1383 : d0 cb __ BNE $1350 ; (scroll_down.l18 + 0)
.l9:
1385 : 2c 11 d0 BIT $d011 
1388 : 10 fb __ BPL $1385 ; (scroll_down.l9 + 0)
.s10:
138a : a9 12 __ LDA #$12
138c : 8d 11 d0 STA $d011 
.l11:
138f : 2c 11 d0 BIT $d011 
1392 : 30 fb __ BMI $138f ; (scroll_down.l11 + 0)
.l12:
1394 : 2c 11 d0 BIT $d011 
1397 : 10 fb __ BPL $1394 ; (scroll_down.l12 + 0)
.s13:
1399 : a9 14 __ LDA #$14
139b : 8d 11 d0 STA $d011 
.s3:
139e : 60 __ __ RTS
--------------------------------------------------------------------
__multab16L:
139f : __ __ __ BYT 00 10 20 30                                     : .. 0
--------------------------------------------------------------------
spentry:
13a3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seed:
13a4 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
joyy:
13a6 : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
13a8 : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
13aa : __ __ __ BSS	2
--------------------------------------------------------------------
news:
13ac : __ __ __ BSS	40
--------------------------------------------------------------------
newc:
13d4 : __ __ __ BSS	40
--------------------------------------------------------------------
quad:
1400 : __ __ __ BYT 20 55 6c 4e 20 5d e1 65 20 5d e1 65 20 4a 7c 4d :  UlN ].e ].e J|M
1410 : __ __ __ BYT 20 40 62 77 20 20 a0 20 20 20 a0 20 20 40 e2 6f :  @bw  .   .  @.o
1420 : __ __ __ BYT 20 40 62 77 20 20 a0 20 20 20 a0 20 20 40 e2 6f :  @bw  .   .  @.o
1430 : __ __ __ BYT 20 49 7b 4d 20 5d 61 6a 20 5d 61 6a 20 4b 7e 4e :  I{M ]aj ]aj K~N
--------------------------------------------------------------------
tmp0:
1440 : __ __ __ BSS	40
--------------------------------------------------------------------
tmp1:
1468 : __ __ __ BSS	40
--------------------------------------------------------------------
tmp2:
1490 : __ __ __ BSS	40
--------------------------------------------------------------------
tmp3:
14b8 : __ __ __ BSS	40
--------------------------------------------------------------------
grid:
1500 : __ __ __ BSS	256
