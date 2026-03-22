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
080e : 8e ee 17 STX $17ee ; (spentry + 0)
0811 : a2 18 __ LDX #$18
0813 : a0 20 __ LDY #$20
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1d __ CPX #$1d
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
083b : a9 c8 __ LDA #$c8
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
; 239, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbzoom.c"
.s1:
0880 : a2 15 __ LDX #$15
0882 : b5 53 __ LDA T0 + 0,x 
0884 : 9d ca 9f STA $9fca,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : a9 00 __ LDA #$00
088c : 85 53 __ STA T0 + 0 
088e : 85 57 __ STA T1 + 0 
.l63:
0890 : 85 1b __ STA ACCU + 0 
0892 : a9 00 __ LDA #$00
0894 : 85 1c __ STA ACCU + 1 
0896 : a5 53 __ LDA T0 + 0 
0898 : 20 fa 16 JSR $16fa ; (mul16by8 + 0)
089b : a5 1b __ LDA ACCU + 0 
089d : a6 53 __ LDX T0 + 0 
089f : 9d 00 19 STA $1900,x ; (sqb[0] + 0)
08a2 : a5 1c __ LDA ACCU + 1 
08a4 : 9d 00 1a STA $1a00,x ; (sqb[0] + 1)
08a7 : a5 57 __ LDA T1 + 0 
08a9 : 9d 00 1b STA $1b00,x ; (shlb4[0] + 0)
08ac : 18 __ __ CLC
08ad : 69 10 __ ADC #$10
08af : 85 57 __ STA T1 + 0 
08b1 : 8a __ __ TXA
08b2 : 4a __ __ LSR
08b3 : 4a __ __ LSR
08b4 : 4a __ __ LSR
08b5 : 4a __ __ LSR
08b6 : 9d 00 1c STA $1c00,x ; (shrb4[0] + 0)
08b9 : 8a __ __ TXA
08ba : 18 __ __ CLC
08bb : 69 01 __ ADC #$01
08bd : b0 04 __ BCS $08c3 ; (main.s5 + 0)
.s77:
08bf : 85 53 __ STA T0 + 0 
08c1 : d0 cd __ BNE $0890 ; (main.l63 + 0)
.s5:
08c3 : a9 a0 __ LDA #$a0
08c5 : a2 00 __ LDX #$00
.l7:
08c7 : 9d 00 04 STA $0400,x 
08ca : 9d 00 05 STA $0500,x 
08cd : 9d 00 06 STA $0600,x 
08d0 : 9d 00 07 STA $0700,x 
08d3 : e8 __ __ INX
08d4 : d0 f1 __ BNE $08c7 ; (main.l7 + 0)
.s6:
08d6 : 86 63 __ STX T13 + 0 
08d8 : a9 a4 __ LDA #$a4
08da : 85 65 __ STA T14 + 0 
08dc : 85 10 __ STA P3 
08de : a9 e0 __ LDA #$e0
08e0 : 85 64 __ STA T13 + 1 
08e2 : a9 f0 __ LDA #$f0
08e4 : 85 66 __ STA T14 + 1 
08e6 : 85 11 __ STA P4 
08e8 : a9 47 __ LDA #$47
08ea : 85 67 __ STA T15 + 0 
08ec : 85 12 __ STA P5 
08ee : a9 01 __ LDA #$01
08f0 : 85 68 __ STA T15 + 1 
08f2 : 85 13 __ STA P6 
08f4 : 8a __ __ TXA
.l72:
08f5 : 85 0d __ STA P0 
08f7 : a9 00 __ LDA #$00
08f9 : 85 0e __ STA P1 
08fb : a9 e0 __ LDA #$e0
08fd : 85 0f __ STA P2 
08ff : 20 d4 13 JSR $13d4 ; (fill_row.s1 + 0)
0902 : 18 __ __ CLC
0903 : a5 10 __ LDA P3 
0905 : 69 47 __ ADC #$47
0907 : 85 10 __ STA P3 
0909 : a5 11 __ LDA P4 
090b : 69 01 __ ADC #$01
090d : 85 11 __ STA P4 
090f : 18 __ __ CLC
0910 : a5 0d __ LDA P0 
0912 : 69 01 __ ADC #$01
0914 : c9 19 __ CMP #$19
0916 : 90 dd __ BCC $08f5 ; (main.l72 + 0)
.l8:
0918 : 20 ed 16 JSR $16ed ; (getch.l4 + 0)
091b : c9 44 __ CMP #$44
091d : d0 03 __ BNE $0922 ; (main.s9 + 0)
091f : 4c 0a 10 JMP $100a ; (main.s42 + 0)
.s9:
0922 : b0 03 __ BCS $0927 ; (main.s10 + 0)
0924 : 4c c5 0a JMP $0ac5 ; (main.s15 + 0)
.s10:
0927 : c9 53 __ CMP #$53
0929 : d0 03 __ BNE $092e ; (main.s11 + 0)
092b : 4c f2 09 JMP $09f2 ; (main.s14 + 0)
.s11:
092e : c9 57 __ CMP #$57
0930 : d0 e6 __ BNE $0918 ; (main.l8 + 0)
.s12:
0932 : a5 65 __ LDA T14 + 0 
0934 : e5 67 __ SBC T15 + 0 
0936 : 85 65 __ STA T14 + 0 
0938 : a5 66 __ LDA T14 + 1 
093a : e5 68 __ SBC T15 + 1 
093c : 85 66 __ STA T14 + 1 
093e : a2 00 __ LDX #$00
.l70:
0940 : bd 98 db LDA $db98,x 
0943 : 9d c0 db STA $dbc0,x 
0946 : bd 70 db LDA $db70,x 
0949 : 9d 98 db STA $db98,x 
094c : bd 48 db LDA $db48,x 
094f : 9d 70 db STA $db70,x 
0952 : bd 20 db LDA $db20,x 
0955 : 9d 48 db STA $db48,x 
0958 : bd f8 da LDA $daf8,x 
095b : 9d 20 db STA $db20,x 
095e : bd d0 da LDA $dad0,x 
0961 : 9d f8 da STA $daf8,x 
0964 : bd a8 da LDA $daa8,x 
0967 : 9d d0 da STA $dad0,x 
096a : bd 80 da LDA $da80,x 
096d : 9d a8 da STA $daa8,x 
0970 : bd 58 da LDA $da58,x 
0973 : 9d 80 da STA $da80,x 
0976 : bd 30 da LDA $da30,x 
0979 : 9d 58 da STA $da58,x 
097c : bd 08 da LDA $da08,x 
097f : 9d 30 da STA $da30,x 
0982 : bd e0 d9 LDA $d9e0,x 
0985 : 9d 08 da STA $da08,x 
0988 : bd b8 d9 LDA $d9b8,x 
098b : 9d e0 d9 STA $d9e0,x 
098e : bd 90 d9 LDA $d990,x 
0991 : 9d b8 d9 STA $d9b8,x 
0994 : bd 68 d9 LDA $d968,x 
0997 : 9d 90 d9 STA $d990,x 
099a : bd 40 d9 LDA $d940,x 
099d : 9d 68 d9 STA $d968,x 
09a0 : bd 18 d9 LDA $d918,x 
09a3 : 9d 40 d9 STA $d940,x 
09a6 : bd f0 d8 LDA $d8f0,x 
09a9 : 9d 18 d9 STA $d918,x 
09ac : bd c8 d8 LDA $d8c8,x 
09af : 9d f0 d8 STA $d8f0,x 
09b2 : bd a0 d8 LDA $d8a0,x 
09b5 : 9d c8 d8 STA $d8c8,x 
09b8 : bd 78 d8 LDA $d878,x 
09bb : 9d a0 d8 STA $d8a0,x 
09be : bd 50 d8 LDA $d850,x 
09c1 : 9d 78 d8 STA $d878,x 
09c4 : bd 28 d8 LDA $d828,x 
09c7 : 9d 50 d8 STA $d850,x 
09ca : bd 00 d8 LDA $d800,x 
09cd : 9d 28 d8 STA $d828,x 
09d0 : e8 __ __ INX
09d1 : e0 28 __ CPX #$28
09d3 : f0 03 __ BEQ $09d8 ; (main.s71 + 0)
09d5 : 4c 40 09 JMP $0940 ; (main.l70 + 0)
.s71:
09d8 : a5 65 __ LDA T14 + 0 
09da : 85 10 __ STA P3 
09dc : a9 00 __ LDA #$00
09de : 85 0d __ STA P0 
09e0 : a5 66 __ LDA T14 + 1 
.s13:
09e2 : 85 11 __ STA P4 
09e4 : a5 67 __ LDA T15 + 0 
09e6 : 85 12 __ STA P5 
09e8 : a5 68 __ LDA T15 + 1 
09ea : 85 13 __ STA P6 
09ec : 20 cc 13 JSR $13cc ; (fill_row@proxy + 0)
09ef : 4c 18 09 JMP $0918 ; (main.l8 + 0)
.s14:
09f2 : 18 __ __ CLC
09f3 : a5 65 __ LDA T14 + 0 
09f5 : 65 67 __ ADC T15 + 0 
09f7 : 85 65 __ STA T14 + 0 
09f9 : a5 66 __ LDA T14 + 1 
09fb : 65 68 __ ADC T15 + 1 
09fd : 85 66 __ STA T14 + 1 
09ff : a2 00 __ LDX #$00
.l68:
0a01 : bd 28 d8 LDA $d828,x 
0a04 : 9d 00 d8 STA $d800,x 
0a07 : bd 50 d8 LDA $d850,x 
0a0a : 9d 28 d8 STA $d828,x 
0a0d : bd 78 d8 LDA $d878,x 
0a10 : 9d 50 d8 STA $d850,x 
0a13 : bd a0 d8 LDA $d8a0,x 
0a16 : 9d 78 d8 STA $d878,x 
0a19 : bd c8 d8 LDA $d8c8,x 
0a1c : 9d a0 d8 STA $d8a0,x 
0a1f : bd f0 d8 LDA $d8f0,x 
0a22 : 9d c8 d8 STA $d8c8,x 
0a25 : bd 18 d9 LDA $d918,x 
0a28 : 9d f0 d8 STA $d8f0,x 
0a2b : bd 40 d9 LDA $d940,x 
0a2e : 9d 18 d9 STA $d918,x 
0a31 : bd 68 d9 LDA $d968,x 
0a34 : 9d 40 d9 STA $d940,x 
0a37 : bd 90 d9 LDA $d990,x 
0a3a : 9d 68 d9 STA $d968,x 
0a3d : bd b8 d9 LDA $d9b8,x 
0a40 : 9d 90 d9 STA $d990,x 
0a43 : bd e0 d9 LDA $d9e0,x 
0a46 : 9d b8 d9 STA $d9b8,x 
0a49 : bd 08 da LDA $da08,x 
0a4c : 9d e0 d9 STA $d9e0,x 
0a4f : bd 30 da LDA $da30,x 
0a52 : 9d 08 da STA $da08,x 
0a55 : bd 58 da LDA $da58,x 
0a58 : 9d 30 da STA $da30,x 
0a5b : bd 80 da LDA $da80,x 
0a5e : 9d 58 da STA $da58,x 
0a61 : bd a8 da LDA $daa8,x 
0a64 : 9d 80 da STA $da80,x 
0a67 : bd d0 da LDA $dad0,x 
0a6a : 9d a8 da STA $daa8,x 
0a6d : bd f8 da LDA $daf8,x 
0a70 : 9d d0 da STA $dad0,x 
0a73 : bd 20 db LDA $db20,x 
0a76 : 9d f8 da STA $daf8,x 
0a79 : bd 48 db LDA $db48,x 
0a7c : 9d 20 db STA $db20,x 
0a7f : bd 70 db LDA $db70,x 
0a82 : 9d 48 db STA $db48,x 
0a85 : bd 98 db LDA $db98,x 
0a88 : 9d 70 db STA $db70,x 
0a8b : bd c0 db LDA $dbc0,x 
0a8e : 9d 98 db STA $db98,x 
0a91 : e8 __ __ INX
0a92 : e0 28 __ CPX #$28
0a94 : f0 03 __ BEQ $0a99 ; (main.s69 + 0)
0a96 : 4c 01 0a JMP $0a01 ; (main.l68 + 0)
.s69:
0a99 : a5 67 __ LDA T15 + 0 
0a9b : 0a __ __ ASL
0a9c : a8 __ __ TAY
0a9d : a9 18 __ LDA #$18
0a9f : 85 0d __ STA P0 
0aa1 : a5 68 __ LDA T15 + 1 
0aa3 : 2a __ __ ROL
0aa4 : aa __ __ TAX
0aa5 : 98 __ __ TYA
0aa6 : 18 __ __ CLC
0aa7 : 65 67 __ ADC T15 + 0 
0aa9 : 85 53 __ STA T0 + 0 
0aab : 8a __ __ TXA
0aac : 65 68 __ ADC T15 + 1 
0aae : 06 53 __ ASL T0 + 0 
0ab0 : 2a __ __ ROL
0ab1 : 06 53 __ ASL T0 + 0 
0ab3 : 2a __ __ ROL
0ab4 : 06 53 __ ASL T0 + 0 
0ab6 : 2a __ __ ROL
0ab7 : aa __ __ TAX
0ab8 : 18 __ __ CLC
0ab9 : a5 53 __ LDA T0 + 0 
0abb : 65 65 __ ADC T14 + 0 
0abd : 85 10 __ STA P3 
0abf : 8a __ __ TXA
0ac0 : 65 66 __ ADC T14 + 1 
0ac2 : 4c e2 09 JMP $09e2 ; (main.s13 + 0)
.s15:
0ac5 : c9 2d __ CMP #$2d
0ac7 : f0 03 __ BEQ $0acc ; (main.s41 + 0)
0ac9 : 4c 73 0b JMP $0b73 ; (main.s16 + 0)
.s41:
0acc : a5 67 __ LDA T15 + 0 
0ace : 0a __ __ ASL
0acf : 85 1b __ STA ACCU + 0 
0ad1 : a5 68 __ LDA T15 + 1 
0ad3 : 2a __ __ ROL
0ad4 : 06 1b __ ASL ACCU + 0 
0ad6 : 2a __ __ ROL
0ad7 : aa __ __ TAX
0ad8 : 18 __ __ CLC
0ad9 : a5 1b __ LDA ACCU + 0 
0adb : 65 67 __ ADC T15 + 0 
0add : 85 53 __ STA T0 + 0 
0adf : 8a __ __ TXA
0ae0 : 65 68 __ ADC T15 + 1 
0ae2 : 06 53 __ ASL T0 + 0 
0ae4 : 2a __ __ ROL
0ae5 : 06 53 __ ASL T0 + 0 
0ae7 : 2a __ __ ROL
0ae8 : 85 54 __ STA T0 + 1 
0aea : a5 67 __ LDA T15 + 0 
0aec : 0a __ __ ASL
0aed : a8 __ __ TAY
0aee : a5 68 __ LDA T15 + 1 
0af0 : 2a __ __ ROL
0af1 : aa __ __ TAX
0af2 : 98 __ __ TYA
0af3 : 18 __ __ CLC
0af4 : 65 67 __ ADC T15 + 0 
0af6 : 85 57 __ STA T1 + 0 
0af8 : 8a __ __ TXA
0af9 : 65 68 __ ADC T15 + 1 
0afb : 06 57 __ ASL T1 + 0 
0afd : 2a __ __ ROL
0afe : 06 57 __ ASL T1 + 0 
0b00 : 2a __ __ ROL
0b01 : aa __ __ TAX
0b02 : 18 __ __ CLC
0b03 : a5 57 __ LDA T1 + 0 
0b05 : 65 65 __ ADC T14 + 0 
0b07 : 85 57 __ STA T1 + 0 
0b09 : 8a __ __ TXA
0b0a : 65 66 __ ADC T14 + 1 
0b0c : 85 58 __ STA T1 + 1 
0b0e : a5 67 __ LDA T15 + 0 
0b10 : 0a __ __ ASL
0b11 : a8 __ __ TAY
0b12 : a5 68 __ LDA T15 + 1 
0b14 : 2a __ __ ROL
0b15 : aa __ __ TAX
0b16 : 98 __ __ TYA
0b17 : 18 __ __ CLC
0b18 : 65 67 __ ADC T15 + 0 
0b1a : a8 __ __ TAY
0b1b : 8a __ __ TXA
0b1c : 65 68 __ ADC T15 + 1 
0b1e : aa __ __ TAX
0b1f : 0a __ __ ASL
0b20 : 98 __ __ TYA
0b21 : 69 00 __ ADC #$00
0b23 : 85 67 __ STA T15 + 0 
0b25 : 8a __ __ TXA
0b26 : 69 00 __ ADC #$00
0b28 : c9 80 __ CMP #$80
0b2a : 6a __ __ ROR
0b2b : 66 67 __ ROR T15 + 0 
0b2d : 85 68 __ STA T15 + 1 
0b2f : 85 13 __ STA P6 
0b31 : a5 67 __ LDA T15 + 0 
0b33 : 85 12 __ STA P5 
0b35 : 0a __ __ ASL
0b36 : a8 __ __ TAY
0b37 : a5 13 __ LDA P6 
0b39 : 2a __ __ ROL
0b3a : aa __ __ TAX
0b3b : 98 __ __ TYA
0b3c : 18 __ __ CLC
0b3d : 65 12 __ ADC P5 
0b3f : 85 1b __ STA ACCU + 0 
0b41 : 8a __ __ TXA
0b42 : 65 13 __ ADC P6 
0b44 : 06 1b __ ASL ACCU + 0 
0b46 : 2a __ __ ROL
0b47 : 06 1b __ ASL ACCU + 0 
0b49 : 2a __ __ ROL
0b4a : 85 1c __ STA ACCU + 1 
0b4c : 38 __ __ SEC
0b4d : a5 57 __ LDA T1 + 0 
0b4f : e5 1b __ SBC ACCU + 0 
0b51 : 85 65 __ STA T14 + 0 
0b53 : 85 10 __ STA P3 
0b55 : a5 58 __ LDA T1 + 1 
0b57 : e5 1c __ SBC ACCU + 1 
0b59 : 85 66 __ STA T14 + 1 
0b5b : 85 11 __ STA P4 
0b5d : 18 __ __ CLC
0b5e : a5 53 __ LDA T0 + 0 
0b60 : 65 63 __ ADC T13 + 0 
0b62 : a8 __ __ TAY
0b63 : a5 54 __ LDA T0 + 1 
0b65 : 65 64 __ ADC T13 + 1 
0b67 : 85 54 __ STA T0 + 1 
0b69 : a5 12 __ LDA P5 
0b6b : 0a __ __ ASL
0b6c : 85 1b __ STA ACCU + 0 
0b6e : a5 13 __ LDA P6 
0b70 : 4c 1d 0c JMP $0c1d ; (main.s76 + 0)
.s16:
0b73 : 90 03 __ BCC $0b78 ; (main.s39 + 0)
0b75 : 4c 60 0c JMP $0c60 ; (main.s17 + 0)
.s39:
0b78 : c9 2b __ CMP #$2b
0b7a : f0 03 __ BEQ $0b7f ; (main.s40 + 0)
0b7c : 4c 18 09 JMP $0918 ; (main.l8 + 0)
.s40:
0b7f : a5 67 __ LDA T15 + 0 
0b81 : 0a __ __ ASL
0b82 : 85 1b __ STA ACCU + 0 
0b84 : a5 68 __ LDA T15 + 1 
0b86 : 2a __ __ ROL
0b87 : 06 1b __ ASL ACCU + 0 
0b89 : 2a __ __ ROL
0b8a : aa __ __ TAX
0b8b : 18 __ __ CLC
0b8c : a5 1b __ LDA ACCU + 0 
0b8e : 65 67 __ ADC T15 + 0 
0b90 : 85 53 __ STA T0 + 0 
0b92 : 8a __ __ TXA
0b93 : 65 68 __ ADC T15 + 1 
0b95 : 06 53 __ ASL T0 + 0 
0b97 : 2a __ __ ROL
0b98 : 06 53 __ ASL T0 + 0 
0b9a : 2a __ __ ROL
0b9b : 85 54 __ STA T0 + 1 
0b9d : a5 67 __ LDA T15 + 0 
0b9f : 0a __ __ ASL
0ba0 : a8 __ __ TAY
0ba1 : a5 68 __ LDA T15 + 1 
0ba3 : 2a __ __ ROL
0ba4 : aa __ __ TAX
0ba5 : 98 __ __ TYA
0ba6 : 18 __ __ CLC
0ba7 : 65 67 __ ADC T15 + 0 
0ba9 : 85 57 __ STA T1 + 0 
0bab : 8a __ __ TXA
0bac : 65 68 __ ADC T15 + 1 
0bae : 06 57 __ ASL T1 + 0 
0bb0 : 2a __ __ ROL
0bb1 : 06 57 __ ASL T1 + 0 
0bb3 : 2a __ __ ROL
0bb4 : aa __ __ TAX
0bb5 : 18 __ __ CLC
0bb6 : a5 57 __ LDA T1 + 0 
0bb8 : 65 65 __ ADC T14 + 0 
0bba : 85 57 __ STA T1 + 0 
0bbc : 8a __ __ TXA
0bbd : 65 66 __ ADC T14 + 1 
0bbf : 85 58 __ STA T1 + 1 
0bc1 : a5 67 __ LDA T15 + 0 
0bc3 : 0a __ __ ASL
0bc4 : 85 1b __ STA ACCU + 0 
0bc6 : a5 68 __ LDA T15 + 1 
0bc8 : 2a __ __ ROL
0bc9 : 85 1c __ STA ACCU + 1 
0bcb : a9 03 __ LDA #$03
0bcd : 85 03 __ STA WORK + 0 
0bcf : a9 00 __ LDA #$00
0bd1 : 85 04 __ STA WORK + 1 
0bd3 : 20 32 17 JSR $1732 ; (divs16 + 0)
0bd6 : a5 1b __ LDA ACCU + 0 
0bd8 : 85 67 __ STA T15 + 0 
0bda : 85 12 __ STA P5 
0bdc : a5 1c __ LDA ACCU + 1 
0bde : 85 68 __ STA T15 + 1 
0be0 : 85 13 __ STA P6 
0be2 : 06 1b __ ASL ACCU + 0 
0be4 : 26 1c __ ROL ACCU + 1 
0be6 : 18 __ __ CLC
0be7 : a5 1b __ LDA ACCU + 0 
0be9 : 65 67 __ ADC T15 + 0 
0beb : 85 1b __ STA ACCU + 0 
0bed : a5 1c __ LDA ACCU + 1 
0bef : 65 68 __ ADC T15 + 1 
0bf1 : 06 1b __ ASL ACCU + 0 
0bf3 : 2a __ __ ROL
0bf4 : 06 1b __ ASL ACCU + 0 
0bf6 : 2a __ __ ROL
0bf7 : 85 1c __ STA ACCU + 1 
0bf9 : 38 __ __ SEC
0bfa : a5 57 __ LDA T1 + 0 
0bfc : e5 1b __ SBC ACCU + 0 
0bfe : 85 65 __ STA T14 + 0 
0c00 : 85 10 __ STA P3 
0c02 : a5 58 __ LDA T1 + 1 
0c04 : e5 1c __ SBC ACCU + 1 
0c06 : 85 66 __ STA T14 + 1 
0c08 : 85 11 __ STA P4 
0c0a : 18 __ __ CLC
0c0b : a5 53 __ LDA T0 + 0 
0c0d : 65 63 __ ADC T13 + 0 
0c0f : a8 __ __ TAY
0c10 : a5 54 __ LDA T0 + 1 
0c12 : 65 64 __ ADC T13 + 1 
0c14 : 85 54 __ STA T0 + 1 
0c16 : a5 67 __ LDA T15 + 0 
0c18 : 0a __ __ ASL
0c19 : 85 1b __ STA ACCU + 0 
0c1b : a5 68 __ LDA T15 + 1 
.s76:
0c1d : 2a __ __ ROL
0c1e : 06 1b __ ASL ACCU + 0 
0c20 : 2a __ __ ROL
0c21 : aa __ __ TAX
0c22 : 18 __ __ CLC
0c23 : a5 1b __ LDA ACCU + 0 
0c25 : 65 12 __ ADC P5 
0c27 : 85 57 __ STA T1 + 0 
0c29 : 8a __ __ TXA
0c2a : 65 13 __ ADC P6 
0c2c : 06 57 __ ASL T1 + 0 
0c2e : 2a __ __ ROL
0c2f : 06 57 __ ASL T1 + 0 
0c31 : 2a __ __ ROL
0c32 : 85 58 __ STA T1 + 1 
0c34 : 98 __ __ TYA
0c35 : 38 __ __ SEC
0c36 : e5 57 __ SBC T1 + 0 
0c38 : 85 63 __ STA T13 + 0 
0c3a : a5 54 __ LDA T0 + 1 
0c3c : e5 58 __ SBC T1 + 1 
0c3e : 85 64 __ STA T13 + 1 
0c40 : a9 00 __ LDA #$00
.l73:
0c42 : 85 0d __ STA P0 
0c44 : 20 cc 13 JSR $13cc ; (fill_row@proxy + 0)
0c47 : 18 __ __ CLC
0c48 : a5 10 __ LDA P3 
0c4a : 65 12 __ ADC P5 
0c4c : 85 10 __ STA P3 
0c4e : a5 11 __ LDA P4 
0c50 : 65 13 __ ADC P6 
0c52 : 85 11 __ STA P4 
0c54 : 18 __ __ CLC
0c55 : a5 0d __ LDA P0 
0c57 : 69 01 __ ADC #$01
0c59 : c9 19 __ CMP #$19
0c5b : 90 e5 __ BCC $0c42 ; (main.l73 + 0)
0c5d : 4c 18 09 JMP $0918 ; (main.l8 + 0)
.s17:
0c60 : c9 41 __ CMP #$41
0c62 : d0 f9 __ BNE $0c5d ; (main.l73 + 27)
.s18:
0c64 : a5 63 __ LDA T13 + 0 
0c66 : e5 67 __ SBC T15 + 0 
0c68 : 85 63 __ STA T13 + 0 
0c6a : a5 64 __ LDA T13 + 1 
0c6c : e5 68 __ SBC T15 + 1 
0c6e : 85 64 __ STA T13 + 1 
0c70 : a2 26 __ LDX #$26
.l66:
0c72 : bd 28 d8 LDA $d828,x 
0c75 : 9d 29 d8 STA $d829,x 
0c78 : bd 50 d8 LDA $d850,x 
0c7b : 9d 51 d8 STA $d851,x 
0c7e : bd 78 d8 LDA $d878,x 
0c81 : 9d 79 d8 STA $d879,x 
0c84 : bd a0 d8 LDA $d8a0,x 
0c87 : 9d a1 d8 STA $d8a1,x 
0c8a : bd c8 d8 LDA $d8c8,x 
0c8d : 9d c9 d8 STA $d8c9,x 
0c90 : bd f0 d8 LDA $d8f0,x 
0c93 : 9d f1 d8 STA $d8f1,x 
0c96 : bd 00 d8 LDA $d800,x 
0c99 : 9d 01 d8 STA $d801,x 
0c9c : bd 40 d9 LDA $d940,x 
0c9f : 9d 41 d9 STA $d941,x 
0ca2 : bd 68 d9 LDA $d968,x 
0ca5 : 9d 69 d9 STA $d969,x 
0ca8 : bd 90 d9 LDA $d990,x 
0cab : 9d 91 d9 STA $d991,x 
0cae : bd b8 d9 LDA $d9b8,x 
0cb1 : 9d b9 d9 STA $d9b9,x 
0cb4 : bd e0 d9 LDA $d9e0,x 
0cb7 : 9d e1 d9 STA $d9e1,x 
0cba : bd 08 da LDA $da08,x 
0cbd : 9d 09 da STA $da09,x 
0cc0 : bd 18 d9 LDA $d918,x 
0cc3 : 9d 19 d9 STA $d919,x 
0cc6 : bd 58 da LDA $da58,x 
0cc9 : 9d 59 da STA $da59,x 
0ccc : bd 80 da LDA $da80,x 
0ccf : 9d 81 da STA $da81,x 
0cd2 : bd a8 da LDA $daa8,x 
0cd5 : 9d a9 da STA $daa9,x 
0cd8 : bd d0 da LDA $dad0,x 
0cdb : 9d d1 da STA $dad1,x 
0cde : bd f8 da LDA $daf8,x 
0ce1 : 9d f9 da STA $daf9,x 
0ce4 : bd 20 db LDA $db20,x 
0ce7 : 9d 21 db STA $db21,x 
0cea : bd 30 da LDA $da30,x 
0ced : 9d 31 da STA $da31,x 
0cf0 : bd 70 db LDA $db70,x 
0cf3 : 9d 71 db STA $db71,x 
0cf6 : bd 98 db LDA $db98,x 
0cf9 : 9d 99 db STA $db99,x 
0cfc : bd c0 db LDA $dbc0,x 
0cff : 9d c1 db STA $dbc1,x 
0d02 : bd 48 db LDA $db48,x 
0d05 : 9d 49 db STA $db49,x 
0d08 : ca __ __ DEX
0d09 : 30 03 __ BMI $0d0e ; (main.s67 + 0)
0d0b : 4c 72 0c JMP $0c72 ; (main.l66 + 0)
.s67:
0d0e : a5 65 __ LDA T14 + 0 
0d10 : 85 5b __ STA T7 + 0 
0d12 : a5 66 __ LDA T14 + 1 
0d14 : 85 5c __ STA T7 + 1 
0d16 : a9 00 __ LDA #$00
0d18 : 85 5d __ STA T8 + 0 
.l19:
0d1a : a5 5b __ LDA T7 + 0 
0d1c : 85 4f __ STA T6 + 0 
0d1e : a5 5c __ LDA T7 + 1 
0d20 : 85 50 __ STA T6 + 1 
0d22 : a5 63 __ LDA T13 + 0 
0d24 : 85 5f __ STA T9 + 0 
0d26 : a5 64 __ LDA T13 + 1 
0d28 : a0 00 __ LDY #$00
.l20:
0d2a : 85 60 __ STA T9 + 1 
0d2c : a6 5f __ LDX T9 + 0 
0d2e : 86 53 __ STX T0 + 0 
0d30 : aa __ __ TAX
0d31 : 10 0b __ BPL $0d3e ; (main.s75 + 0)
.s38:
0d33 : 38 __ __ SEC
0d34 : a9 00 __ LDA #$00
0d36 : e5 5f __ SBC T9 + 0 
0d38 : 85 53 __ STA T0 + 0 
0d3a : a9 00 __ LDA #$00
0d3c : e5 60 __ SBC T9 + 1 
.s75:
0d3e : 85 57 __ STA T1 + 0 
0d40 : 18 __ __ CLC
0d41 : 65 53 __ ADC T0 + 0 
0d43 : 85 4b __ STA T5 + 0 
0d45 : aa __ __ TAX
0d46 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0d49 : 85 55 __ STA T0 + 2 
0d4b : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0d4e : 85 54 __ STA T0 + 1 
0d50 : a6 57 __ LDX T1 + 0 
0d52 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0d55 : 85 57 __ STA T1 + 0 
0d57 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0d5a : 85 58 __ STA T1 + 1 
0d5c : 85 1e __ STA ACCU + 3 
0d5e : a9 00 __ LDA #$00
0d60 : 6a __ __ ROR
0d61 : a6 53 __ LDX T0 + 0 
0d63 : 09 00 __ ORA #$00
0d65 : 30 17 __ BMI $0d7e ; (main.s37 + 0)
.s21:
0d67 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0d6a : 85 53 __ STA T0 + 0 
0d6c : a5 54 __ LDA T0 + 1 
0d6e : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
0d71 : 85 54 __ STA T0 + 1 
0d73 : a5 55 __ LDA T0 + 2 
0d75 : 65 57 __ ADC T1 + 0 
0d77 : 85 55 __ STA T0 + 2 
0d79 : a5 58 __ LDA T1 + 1 
0d7b : 4c a9 0d JMP $0da9 ; (main.s22 + 0)
.s37:
0d7e : e6 1e __ INC ACCU + 3 
0d80 : a9 00 __ LDA #$00
0d82 : 85 4a __ STA T4 + 3 
0d84 : a5 4b __ LDA T5 + 0 
0d86 : 0a __ __ ASL
0d87 : 26 4a __ ROL T4 + 3 
0d89 : 18 __ __ CLC
0d8a : 65 57 __ ADC T1 + 0 
0d8c : 85 1d __ STA ACCU + 2 
0d8e : a5 4a __ LDA T4 + 3 
0d90 : 65 1e __ ADC ACCU + 3 
0d92 : 85 1e __ STA ACCU + 3 
0d94 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0d97 : 85 53 __ STA T0 + 0 
0d99 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0d9c : 18 __ __ CLC
0d9d : 65 54 __ ADC T0 + 1 
0d9f : 85 54 __ STA T0 + 1 
0da1 : a5 1d __ LDA ACCU + 2 
0da3 : 65 55 __ ADC T0 + 2 
0da5 : 85 55 __ STA T0 + 2 
0da7 : a5 1e __ LDA ACCU + 3 
.s22:
0da9 : 69 00 __ ADC #$00
0dab : 85 56 __ STA T0 + 3 
0dad : a5 4f __ LDA T6 + 0 
0daf : 85 1b __ STA ACCU + 0 
0db1 : 38 __ __ SEC
0db2 : a5 54 __ LDA T0 + 1 
0db4 : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
0db7 : 85 54 __ STA T0 + 1 
0db9 : a5 55 __ LDA T0 + 2 
0dbb : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
0dbe : aa __ __ TAX
0dbf : b0 02 __ BCS $0dc3 ; (main.s95 + 0)
.s94:
0dc1 : c6 56 __ DEC T0 + 3 
.s95:
0dc3 : 38 __ __ SEC
0dc4 : a5 54 __ LDA T0 + 1 
0dc6 : e5 57 __ SBC T1 + 0 
0dc8 : 85 54 __ STA T0 + 1 
0dca : 8a __ __ TXA
0dcb : e5 58 __ SBC T1 + 1 
0dcd : 85 55 __ STA T0 + 2 
0dcf : b0 02 __ BCS $0dd3 ; (main.s97 + 0)
.s96:
0dd1 : c6 56 __ DEC T0 + 3 
.s97:
0dd3 : a5 50 __ LDA T6 + 1 
0dd5 : 10 0b __ BPL $0de2 ; (main.s23 + 0)
.s36:
0dd7 : 38 __ __ SEC
0dd8 : a9 00 __ LDA #$00
0dda : e5 4f __ SBC T6 + 0 
0ddc : 85 1b __ STA ACCU + 0 
0dde : a9 00 __ LDA #$00
0de0 : e5 50 __ SBC T6 + 1 
.s23:
0de2 : 85 1c __ STA ACCU + 1 
0de4 : a5 1b __ LDA ACCU + 0 
0de6 : 85 47 __ STA T4 + 0 
0de8 : 18 __ __ CLC
0de9 : 65 1c __ ADC ACCU + 1 
0deb : 85 1d __ STA ACCU + 2 
0ded : aa __ __ TAX
0dee : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0df1 : 85 59 __ STA T1 + 2 
0df3 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0df6 : 85 58 __ STA T1 + 1 
0df8 : a6 1c __ LDX ACCU + 1 
0dfa : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0dfd : 85 1b __ STA ACCU + 0 
0dff : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0e02 : 85 1c __ STA ACCU + 1 
0e04 : 85 46 __ STA T3 + 3 
0e06 : a9 00 __ LDA #$00
0e08 : 6a __ __ ROR
0e09 : a6 47 __ LDX T4 + 0 
0e0b : 09 00 __ ORA #$00
0e0d : 30 17 __ BMI $0e26 ; (main.s35 + 0)
.s24:
0e0f : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0e12 : 85 57 __ STA T1 + 0 
0e14 : a5 58 __ LDA T1 + 1 
0e16 : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
0e19 : 85 58 __ STA T1 + 1 
0e1b : a5 59 __ LDA T1 + 2 
0e1d : 65 1b __ ADC ACCU + 0 
0e1f : 85 59 __ STA T1 + 2 
0e21 : a5 1c __ LDA ACCU + 1 
0e23 : 4c 51 0e JMP $0e51 ; (main.s25 + 0)
.s35:
0e26 : e6 46 __ INC T3 + 3 
0e28 : a9 00 __ LDA #$00
0e2a : 85 4e __ STA T5 + 3 
0e2c : a5 1d __ LDA ACCU + 2 
0e2e : 0a __ __ ASL
0e2f : 26 4e __ ROL T5 + 3 
0e31 : 18 __ __ CLC
0e32 : 65 1b __ ADC ACCU + 0 
0e34 : 85 45 __ STA T3 + 2 
0e36 : a5 4e __ LDA T5 + 3 
0e38 : 65 46 __ ADC T3 + 3 
0e3a : 85 46 __ STA T3 + 3 
0e3c : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0e3f : 85 57 __ STA T1 + 0 
0e41 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0e44 : 18 __ __ CLC
0e45 : 65 58 __ ADC T1 + 1 
0e47 : 85 58 __ STA T1 + 1 
0e49 : a5 45 __ LDA T3 + 2 
0e4b : 65 59 __ ADC T1 + 2 
0e4d : 85 59 __ STA T1 + 2 
0e4f : a5 46 __ LDA T3 + 3 
.s25:
0e51 : 69 00 __ ADC #$00
0e53 : 85 5a __ STA T1 + 3 
0e55 : 38 __ __ SEC
0e56 : a5 58 __ LDA T1 + 1 
0e58 : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
0e5b : 85 58 __ STA T1 + 1 
0e5d : a5 59 __ LDA T1 + 2 
0e5f : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
0e62 : aa __ __ TAX
0e63 : b0 02 __ BCS $0e67 ; (main.s99 + 0)
.s98:
0e65 : c6 5a __ DEC T1 + 3 
.s99:
0e67 : 38 __ __ SEC
0e68 : a5 58 __ LDA T1 + 1 
0e6a : e5 1b __ SBC ACCU + 0 
0e6c : 85 58 __ STA T1 + 1 
0e6e : 8a __ __ TXA
0e6f : e5 1c __ SBC ACCU + 1 
0e71 : 85 59 __ STA T1 + 2 
0e73 : b0 02 __ BCS $0e77 ; (main.s101 + 0)
.s100:
0e75 : c6 5a __ DEC T1 + 3 
.s101:
0e77 : 18 __ __ CLC
0e78 : a5 5f __ LDA T9 + 0 
0e7a : 65 4f __ ADC T6 + 0 
0e7c : 85 1b __ STA ACCU + 0 
0e7e : a5 60 __ LDA T9 + 1 
0e80 : 65 50 __ ADC T6 + 1 
0e82 : 10 0d __ BPL $0e91 ; (main.s26 + 0)
.s34:
0e84 : 85 1c __ STA ACCU + 1 
0e86 : 38 __ __ SEC
0e87 : a9 00 __ LDA #$00
0e89 : e5 1b __ SBC ACCU + 0 
0e8b : 85 1b __ STA ACCU + 0 
0e8d : a9 00 __ LDA #$00
0e8f : e5 1c __ SBC ACCU + 1 
.s26:
0e91 : 85 43 __ STA T3 + 0 
0e93 : 18 __ __ CLC
0e94 : 65 1b __ ADC ACCU + 0 
0e96 : 85 5f __ STA T9 + 0 
0e98 : aa __ __ TAX
0e99 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0e9c : 85 1d __ STA ACCU + 2 
0e9e : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0ea1 : 85 1c __ STA ACCU + 1 
0ea3 : a6 43 __ LDX T3 + 0 
0ea5 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0ea8 : 85 43 __ STA T3 + 0 
0eaa : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0ead : 85 44 __ STA T3 + 1 
0eaf : 85 4a __ STA T4 + 3 
0eb1 : a9 00 __ LDA #$00
0eb3 : 6a __ __ ROR
0eb4 : a6 1b __ LDX ACCU + 0 
0eb6 : 09 00 __ ORA #$00
0eb8 : 30 17 __ BMI $0ed1 ; (main.s33 + 0)
.s27:
0eba : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0ebd : 85 1b __ STA ACCU + 0 
0ebf : a5 1c __ LDA ACCU + 1 
0ec1 : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
0ec4 : 85 1c __ STA ACCU + 1 
0ec6 : a5 1d __ LDA ACCU + 2 
0ec8 : 65 43 __ ADC T3 + 0 
0eca : 85 1d __ STA ACCU + 2 
0ecc : a5 44 __ LDA T3 + 1 
0ece : 4c fc 0e JMP $0efc ; (main.s28 + 0)
.s33:
0ed1 : e6 4a __ INC T4 + 3 
0ed3 : a9 00 __ LDA #$00
0ed5 : 85 52 __ STA T6 + 3 
0ed7 : a5 5f __ LDA T9 + 0 
0ed9 : 0a __ __ ASL
0eda : 26 52 __ ROL T6 + 3 
0edc : 18 __ __ CLC
0edd : 65 43 __ ADC T3 + 0 
0edf : 85 49 __ STA T4 + 2 
0ee1 : a5 52 __ LDA T6 + 3 
0ee3 : 65 4a __ ADC T4 + 3 
0ee5 : 85 4a __ STA T4 + 3 
0ee7 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
0eea : 85 1b __ STA ACCU + 0 
0eec : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
0eef : 18 __ __ CLC
0ef0 : 65 1c __ ADC ACCU + 1 
0ef2 : 85 1c __ STA ACCU + 1 
0ef4 : a5 49 __ LDA T4 + 2 
0ef6 : 65 1d __ ADC ACCU + 2 
0ef8 : 85 1d __ STA ACCU + 2 
0efa : a5 4a __ LDA T4 + 3 
.s28:
0efc : 69 00 __ ADC #$00
0efe : 85 1e __ STA ACCU + 3 
0f00 : 18 __ __ CLC
0f01 : a5 53 __ LDA T0 + 0 
0f03 : 65 57 __ ADC T1 + 0 
0f05 : 85 47 __ STA T4 + 0 
0f07 : a5 54 __ LDA T0 + 1 
0f09 : 65 58 __ ADC T1 + 1 
0f0b : 85 48 __ STA T4 + 1 
0f0d : a5 55 __ LDA T0 + 2 
0f0f : 65 59 __ ADC T1 + 2 
0f11 : 85 49 __ STA T4 + 2 
0f13 : a5 56 __ LDA T0 + 3 
0f15 : 65 5a __ ADC T1 + 3 
0f17 : 85 4a __ STA T4 + 3 
0f19 : 30 38 __ BMI $0f53 ; (main.s29 + 0)
.s111:
0f1b : c9 04 __ CMP #$04
0f1d : 90 34 __ BCC $0f53 ; (main.s29 + 0)
.s32:
0f1f : be 00 18 LDX $1800,y ; (colors[0] + 0)
.s31:
0f22 : a5 5d __ LDA T8 + 0 
0f24 : 0a __ __ ASL
0f25 : 0a __ __ ASL
0f26 : 65 5d __ ADC T8 + 0 
0f28 : 0a __ __ ASL
0f29 : 0a __ __ ASL
0f2a : 85 53 __ STA T0 + 0 
0f2c : a9 36 __ LDA #$36
0f2e : 2a __ __ ROL
0f2f : 06 53 __ ASL T0 + 0 
0f31 : 2a __ __ ROL
0f32 : 85 54 __ STA T0 + 1 
0f34 : 8a __ __ TXA
0f35 : a0 00 __ LDY #$00
0f37 : 91 53 __ STA (T0 + 0),y 
0f39 : a5 5b __ LDA T7 + 0 
0f3b : 65 67 __ ADC T15 + 0 
0f3d : 85 5b __ STA T7 + 0 
0f3f : a5 5c __ LDA T7 + 1 
0f41 : 65 68 __ ADC T15 + 1 
0f43 : 85 5c __ STA T7 + 1 
0f45 : e6 5d __ INC T8 + 0 
0f47 : a5 5d __ LDA T8 + 0 
0f49 : c9 19 __ CMP #$19
0f4b : b0 03 __ BCS $0f50 ; (main.s31 + 46)
0f4d : 4c 1a 0d JMP $0d1a ; (main.l19 + 0)
0f50 : 4c 18 09 JMP $0918 ; (main.l8 + 0)
.s29:
0f53 : 38 __ __ SEC
0f54 : a5 1c __ LDA ACCU + 1 
0f56 : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
0f59 : 85 1c __ STA ACCU + 1 
0f5b : a5 1d __ LDA ACCU + 2 
0f5d : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
0f60 : aa __ __ TAX
0f61 : b0 02 __ BCS $0f65 ; (main.s103 + 0)
.s102:
0f63 : c6 1e __ DEC ACCU + 3 
.s103:
0f65 : 38 __ __ SEC
0f66 : a5 1c __ LDA ACCU + 1 
0f68 : e5 43 __ SBC T3 + 0 
0f6a : 85 1c __ STA ACCU + 1 
0f6c : 8a __ __ TXA
0f6d : e5 44 __ SBC T3 + 1 
0f6f : aa __ __ TAX
0f70 : b0 02 __ BCS $0f74 ; (main.s105 + 0)
.s104:
0f72 : c6 1e __ DEC ACCU + 3 
.s105:
0f74 : 38 __ __ SEC
0f75 : a5 1b __ LDA ACCU + 0 
0f77 : e5 47 __ SBC T4 + 0 
0f79 : a5 1c __ LDA ACCU + 1 
0f7b : e5 48 __ SBC T4 + 1 
0f7d : 85 1c __ STA ACCU + 1 
0f7f : 8a __ __ TXA
0f80 : e5 49 __ SBC T4 + 2 
0f82 : aa __ __ TAX
0f83 : a5 1e __ LDA ACCU + 3 
0f85 : e5 4a __ SBC T4 + 3 
0f87 : 85 1e __ STA ACCU + 3 
0f89 : 18 __ __ CLC
0f8a : a5 1c __ LDA ACCU + 1 
0f8c : 69 08 __ ADC #$08
0f8e : 85 1c __ STA ACCU + 1 
0f90 : 8a __ __ TXA
0f91 : 69 00 __ ADC #$00
0f93 : 85 1d __ STA ACCU + 2 
0f95 : 90 03 __ BCC $0f9a ; (main.s107 + 0)
.s106:
0f97 : e6 1e __ INC ACCU + 3 
0f99 : 18 __ __ CLC
.s107:
0f9a : aa __ __ TAX
0f9b : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
0f9e : a6 1e __ LDX ACCU + 3 
0fa0 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
0fa3 : 85 44 __ STA T3 + 1 
0fa5 : a6 1c __ LDX ACCU + 1 
0fa7 : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
0faa : a6 1d __ LDX ACCU + 2 
0fac : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
0faf : 65 5b __ ADC T7 + 0 
0fb1 : 85 4f __ STA T6 + 0 
0fb3 : a5 44 __ LDA T3 + 1 
0fb5 : 65 5c __ ADC T7 + 1 
0fb7 : 85 50 __ STA T6 + 1 
0fb9 : 38 __ __ SEC
0fba : a5 53 __ LDA T0 + 0 
0fbc : e5 57 __ SBC T1 + 0 
0fbe : a5 54 __ LDA T0 + 1 
0fc0 : e5 58 __ SBC T1 + 1 
0fc2 : aa __ __ TAX
0fc3 : a5 55 __ LDA T0 + 2 
0fc5 : e5 59 __ SBC T1 + 2 
0fc7 : 85 55 __ STA T0 + 2 
0fc9 : a5 56 __ LDA T0 + 3 
0fcb : e5 5a __ SBC T1 + 3 
0fcd : 85 56 __ STA T0 + 3 
0fcf : 8a __ __ TXA
0fd0 : 18 __ __ CLC
0fd1 : 69 08 __ ADC #$08
0fd3 : 85 54 __ STA T0 + 1 
0fd5 : a5 55 __ LDA T0 + 2 
0fd7 : 69 00 __ ADC #$00
0fd9 : 85 55 __ STA T0 + 2 
0fdb : 90 03 __ BCC $0fe0 ; (main.s109 + 0)
.s108:
0fdd : e6 56 __ INC T0 + 3 
0fdf : 18 __ __ CLC
.s109:
0fe0 : aa __ __ TAX
0fe1 : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
0fe4 : a6 56 __ LDX T0 + 3 
0fe6 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
0fe9 : 85 58 __ STA T1 + 1 
0feb : a6 54 __ LDX T0 + 1 
0fed : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
0ff0 : a6 55 __ LDX T0 + 2 
0ff2 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
0ff5 : 65 63 __ ADC T13 + 0 
0ff7 : 85 5f __ STA T9 + 0 
0ff9 : a5 58 __ LDA T1 + 1 
0ffb : 65 64 __ ADC T13 + 1 
0ffd : c8 __ __ INY
0ffe : c0 20 __ CPY #$20
1000 : b0 03 __ BCS $1005 ; (main.s30 + 0)
1002 : 4c 2a 0d JMP $0d2a ; (main.l20 + 0)
.s30:
1005 : a2 00 __ LDX #$00
1007 : 4c 22 0f JMP $0f22 ; (main.s31 + 0)
.s42:
100a : 18 __ __ CLC
100b : a5 63 __ LDA T13 + 0 
100d : 65 67 __ ADC T15 + 0 
100f : 85 63 __ STA T13 + 0 
1011 : a5 64 __ LDA T13 + 1 
1013 : 65 68 __ ADC T15 + 1 
1015 : 85 64 __ STA T13 + 1 
1017 : a2 00 __ LDX #$00
.l64:
1019 : bd 01 d8 LDA $d801,x 
101c : 9d 00 d8 STA $d800,x 
101f : bd 29 d8 LDA $d829,x 
1022 : 9d 28 d8 STA $d828,x 
1025 : bd 51 d8 LDA $d851,x 
1028 : 9d 50 d8 STA $d850,x 
102b : bd 79 d8 LDA $d879,x 
102e : 9d 78 d8 STA $d878,x 
1031 : bd a1 d8 LDA $d8a1,x 
1034 : 9d a0 d8 STA $d8a0,x 
1037 : bd c9 d8 LDA $d8c9,x 
103a : 9d c8 d8 STA $d8c8,x 
103d : bd f1 d8 LDA $d8f1,x 
1040 : 9d f0 d8 STA $d8f0,x 
1043 : bd 19 d9 LDA $d919,x 
1046 : 9d 18 d9 STA $d918,x 
1049 : bd 41 d9 LDA $d941,x 
104c : 9d 40 d9 STA $d940,x 
104f : bd 69 d9 LDA $d969,x 
1052 : 9d 68 d9 STA $d968,x 
1055 : bd 91 d9 LDA $d991,x 
1058 : 9d 90 d9 STA $d990,x 
105b : bd b9 d9 LDA $d9b9,x 
105e : 9d b8 d9 STA $d9b8,x 
1061 : bd e1 d9 LDA $d9e1,x 
1064 : 9d e0 d9 STA $d9e0,x 
1067 : bd 09 da LDA $da09,x 
106a : 9d 08 da STA $da08,x 
106d : bd 31 da LDA $da31,x 
1070 : 9d 30 da STA $da30,x 
1073 : bd 59 da LDA $da59,x 
1076 : 9d 58 da STA $da58,x 
1079 : bd 81 da LDA $da81,x 
107c : 9d 80 da STA $da80,x 
107f : bd a9 da LDA $daa9,x 
1082 : 9d a8 da STA $daa8,x 
1085 : bd d1 da LDA $dad1,x 
1088 : 9d d0 da STA $dad0,x 
108b : bd f9 da LDA $daf9,x 
108e : 9d f8 da STA $daf8,x 
1091 : bd 21 db LDA $db21,x 
1094 : 9d 20 db STA $db20,x 
1097 : bd 49 db LDA $db49,x 
109a : 9d 48 db STA $db48,x 
109d : bd 71 db LDA $db71,x 
10a0 : 9d 70 db STA $db70,x 
10a3 : bd 99 db LDA $db99,x 
10a6 : 9d 98 db STA $db98,x 
10a9 : bd c1 db LDA $dbc1,x 
10ac : 9d c0 db STA $dbc0,x 
10af : e8 __ __ INX
10b0 : e0 27 __ CPX #$27
10b2 : f0 03 __ BEQ $10b7 ; (main.s65 + 0)
10b4 : 4c 19 10 JMP $1019 ; (main.l64 + 0)
.s65:
10b7 : a5 65 __ LDA T14 + 0 
10b9 : 85 5b __ STA T7 + 0 
10bb : a5 66 __ LDA T14 + 1 
10bd : 85 5c __ STA T7 + 1 
10bf : a5 67 __ LDA T15 + 0 
10c1 : 85 1b __ STA ACCU + 0 
10c3 : a5 68 __ LDA T15 + 1 
10c5 : 85 1c __ STA ACCU + 1 
10c7 : 8a __ __ TXA
10c8 : 20 fa 16 JSR $16fa ; (mul16by8 + 0)
10cb : 18 __ __ CLC
10cc : a5 1b __ LDA ACCU + 0 
10ce : 65 63 __ ADC T13 + 0 
10d0 : 85 5d __ STA T8 + 0 
10d2 : a5 1c __ LDA ACCU + 1 
10d4 : 65 64 __ ADC T13 + 1 
10d6 : 85 5e __ STA T8 + 1 
10d8 : a9 00 __ LDA #$00
10da : 85 5f __ STA T9 + 0 
.l43:
10dc : a5 5b __ LDA T7 + 0 
10de : 85 4f __ STA T6 + 0 
10e0 : a5 5c __ LDA T7 + 1 
10e2 : 85 50 __ STA T6 + 1 
10e4 : a5 5d __ LDA T8 + 0 
10e6 : 85 61 __ STA T10 + 0 
10e8 : a5 5e __ LDA T8 + 1 
10ea : a0 00 __ LDY #$00
.l44:
10ec : 85 62 __ STA T10 + 1 
10ee : a6 61 __ LDX T10 + 0 
10f0 : 86 53 __ STX T0 + 0 
10f2 : aa __ __ TAX
10f3 : 10 0b __ BPL $1100 ; (main.s74 + 0)
.s62:
10f5 : 38 __ __ SEC
10f6 : a9 00 __ LDA #$00
10f8 : e5 61 __ SBC T10 + 0 
10fa : 85 53 __ STA T0 + 0 
10fc : a9 00 __ LDA #$00
10fe : e5 62 __ SBC T10 + 1 
.s74:
1100 : 85 57 __ STA T1 + 0 
1102 : 18 __ __ CLC
1103 : 65 53 __ ADC T0 + 0 
1105 : 85 4b __ STA T5 + 0 
1107 : aa __ __ TAX
1108 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
110b : 85 55 __ STA T0 + 2 
110d : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1110 : 85 54 __ STA T0 + 1 
1112 : a6 57 __ LDX T1 + 0 
1114 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1117 : 85 57 __ STA T1 + 0 
1119 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
111c : 85 58 __ STA T1 + 1 
111e : 85 1e __ STA ACCU + 3 
1120 : a9 00 __ LDA #$00
1122 : 6a __ __ ROR
1123 : a6 53 __ LDX T0 + 0 
1125 : 09 00 __ ORA #$00
1127 : 30 17 __ BMI $1140 ; (main.s61 + 0)
.s45:
1129 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
112c : 85 53 __ STA T0 + 0 
112e : a5 54 __ LDA T0 + 1 
1130 : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
1133 : 85 54 __ STA T0 + 1 
1135 : a5 55 __ LDA T0 + 2 
1137 : 65 57 __ ADC T1 + 0 
1139 : 85 55 __ STA T0 + 2 
113b : a5 58 __ LDA T1 + 1 
113d : 4c 6b 11 JMP $116b ; (main.s46 + 0)
.s61:
1140 : e6 1e __ INC ACCU + 3 
1142 : a9 00 __ LDA #$00
1144 : 85 4a __ STA T4 + 3 
1146 : a5 4b __ LDA T5 + 0 
1148 : 0a __ __ ASL
1149 : 26 4a __ ROL T4 + 3 
114b : 18 __ __ CLC
114c : 65 57 __ ADC T1 + 0 
114e : 85 1d __ STA ACCU + 2 
1150 : a5 4a __ LDA T4 + 3 
1152 : 65 1e __ ADC ACCU + 3 
1154 : 85 1e __ STA ACCU + 3 
1156 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1159 : 85 53 __ STA T0 + 0 
115b : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
115e : 18 __ __ CLC
115f : 65 54 __ ADC T0 + 1 
1161 : 85 54 __ STA T0 + 1 
1163 : a5 1d __ LDA ACCU + 2 
1165 : 65 55 __ ADC T0 + 2 
1167 : 85 55 __ STA T0 + 2 
1169 : a5 1e __ LDA ACCU + 3 
.s46:
116b : 69 00 __ ADC #$00
116d : 85 56 __ STA T0 + 3 
116f : a5 4f __ LDA T6 + 0 
1171 : 85 1b __ STA ACCU + 0 
1173 : 38 __ __ SEC
1174 : a5 54 __ LDA T0 + 1 
1176 : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
1179 : 85 54 __ STA T0 + 1 
117b : a5 55 __ LDA T0 + 2 
117d : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
1180 : aa __ __ TAX
1181 : b0 02 __ BCS $1185 ; (main.s79 + 0)
.s78:
1183 : c6 56 __ DEC T0 + 3 
.s79:
1185 : 38 __ __ SEC
1186 : a5 54 __ LDA T0 + 1 
1188 : e5 57 __ SBC T1 + 0 
118a : 85 54 __ STA T0 + 1 
118c : 8a __ __ TXA
118d : e5 58 __ SBC T1 + 1 
118f : 85 55 __ STA T0 + 2 
1191 : b0 02 __ BCS $1195 ; (main.s81 + 0)
.s80:
1193 : c6 56 __ DEC T0 + 3 
.s81:
1195 : a5 50 __ LDA T6 + 1 
1197 : 10 0b __ BPL $11a4 ; (main.s47 + 0)
.s60:
1199 : 38 __ __ SEC
119a : a9 00 __ LDA #$00
119c : e5 4f __ SBC T6 + 0 
119e : 85 1b __ STA ACCU + 0 
11a0 : a9 00 __ LDA #$00
11a2 : e5 50 __ SBC T6 + 1 
.s47:
11a4 : 85 1c __ STA ACCU + 1 
11a6 : a5 1b __ LDA ACCU + 0 
11a8 : 85 47 __ STA T4 + 0 
11aa : 18 __ __ CLC
11ab : 65 1c __ ADC ACCU + 1 
11ad : 85 1d __ STA ACCU + 2 
11af : aa __ __ TAX
11b0 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
11b3 : 85 59 __ STA T1 + 2 
11b5 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
11b8 : 85 58 __ STA T1 + 1 
11ba : a6 1c __ LDX ACCU + 1 
11bc : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
11bf : 85 1b __ STA ACCU + 0 
11c1 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
11c4 : 85 1c __ STA ACCU + 1 
11c6 : 85 46 __ STA T3 + 3 
11c8 : a9 00 __ LDA #$00
11ca : 6a __ __ ROR
11cb : a6 47 __ LDX T4 + 0 
11cd : 09 00 __ ORA #$00
11cf : 30 17 __ BMI $11e8 ; (main.s59 + 0)
.s48:
11d1 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
11d4 : 85 57 __ STA T1 + 0 
11d6 : a5 58 __ LDA T1 + 1 
11d8 : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
11db : 85 58 __ STA T1 + 1 
11dd : a5 59 __ LDA T1 + 2 
11df : 65 1b __ ADC ACCU + 0 
11e1 : 85 59 __ STA T1 + 2 
11e3 : a5 1c __ LDA ACCU + 1 
11e5 : 4c 13 12 JMP $1213 ; (main.s49 + 0)
.s59:
11e8 : e6 46 __ INC T3 + 3 
11ea : a9 00 __ LDA #$00
11ec : 85 4e __ STA T5 + 3 
11ee : a5 1d __ LDA ACCU + 2 
11f0 : 0a __ __ ASL
11f1 : 26 4e __ ROL T5 + 3 
11f3 : 18 __ __ CLC
11f4 : 65 1b __ ADC ACCU + 0 
11f6 : 85 45 __ STA T3 + 2 
11f8 : a5 4e __ LDA T5 + 3 
11fa : 65 46 __ ADC T3 + 3 
11fc : 85 46 __ STA T3 + 3 
11fe : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1201 : 85 57 __ STA T1 + 0 
1203 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
1206 : 18 __ __ CLC
1207 : 65 58 __ ADC T1 + 1 
1209 : 85 58 __ STA T1 + 1 
120b : a5 45 __ LDA T3 + 2 
120d : 65 59 __ ADC T1 + 2 
120f : 85 59 __ STA T1 + 2 
1211 : a5 46 __ LDA T3 + 3 
.s49:
1213 : 69 00 __ ADC #$00
1215 : 85 5a __ STA T1 + 3 
1217 : 38 __ __ SEC
1218 : a5 58 __ LDA T1 + 1 
121a : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
121d : 85 58 __ STA T1 + 1 
121f : a5 59 __ LDA T1 + 2 
1221 : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
1224 : aa __ __ TAX
1225 : b0 02 __ BCS $1229 ; (main.s83 + 0)
.s82:
1227 : c6 5a __ DEC T1 + 3 
.s83:
1229 : 38 __ __ SEC
122a : a5 58 __ LDA T1 + 1 
122c : e5 1b __ SBC ACCU + 0 
122e : 85 58 __ STA T1 + 1 
1230 : 8a __ __ TXA
1231 : e5 1c __ SBC ACCU + 1 
1233 : 85 59 __ STA T1 + 2 
1235 : b0 02 __ BCS $1239 ; (main.s85 + 0)
.s84:
1237 : c6 5a __ DEC T1 + 3 
.s85:
1239 : 18 __ __ CLC
123a : a5 61 __ LDA T10 + 0 
123c : 65 4f __ ADC T6 + 0 
123e : 85 1b __ STA ACCU + 0 
1240 : a5 62 __ LDA T10 + 1 
1242 : 65 50 __ ADC T6 + 1 
1244 : 10 0d __ BPL $1253 ; (main.s50 + 0)
.s58:
1246 : 85 1c __ STA ACCU + 1 
1248 : 38 __ __ SEC
1249 : a9 00 __ LDA #$00
124b : e5 1b __ SBC ACCU + 0 
124d : 85 1b __ STA ACCU + 0 
124f : a9 00 __ LDA #$00
1251 : e5 1c __ SBC ACCU + 1 
.s50:
1253 : 85 43 __ STA T3 + 0 
1255 : 18 __ __ CLC
1256 : 65 1b __ ADC ACCU + 0 
1258 : 85 61 __ STA T10 + 0 
125a : aa __ __ TAX
125b : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
125e : 85 1d __ STA ACCU + 2 
1260 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1263 : 85 1c __ STA ACCU + 1 
1265 : a6 43 __ LDX T3 + 0 
1267 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
126a : 85 43 __ STA T3 + 0 
126c : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
126f : 85 44 __ STA T3 + 1 
1271 : 85 4a __ STA T4 + 3 
1273 : a9 00 __ LDA #$00
1275 : 6a __ __ ROR
1276 : a6 1b __ LDX ACCU + 0 
1278 : 09 00 __ ORA #$00
127a : 30 17 __ BMI $1293 ; (main.s57 + 0)
.s51:
127c : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
127f : 85 1b __ STA ACCU + 0 
1281 : a5 1c __ LDA ACCU + 1 
1283 : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
1286 : 85 1c __ STA ACCU + 1 
1288 : a5 1d __ LDA ACCU + 2 
128a : 65 43 __ ADC T3 + 0 
128c : 85 1d __ STA ACCU + 2 
128e : a5 44 __ LDA T3 + 1 
1290 : 4c be 12 JMP $12be ; (main.s52 + 0)
.s57:
1293 : e6 4a __ INC T4 + 3 
1295 : a9 00 __ LDA #$00
1297 : 85 52 __ STA T6 + 3 
1299 : a5 61 __ LDA T10 + 0 
129b : 0a __ __ ASL
129c : 26 52 __ ROL T6 + 3 
129e : 18 __ __ CLC
129f : 65 43 __ ADC T3 + 0 
12a1 : 85 49 __ STA T4 + 2 
12a3 : a5 52 __ LDA T6 + 3 
12a5 : 65 4a __ ADC T4 + 3 
12a7 : 85 4a __ STA T4 + 3 
12a9 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
12ac : 85 1b __ STA ACCU + 0 
12ae : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
12b1 : 18 __ __ CLC
12b2 : 65 1c __ ADC ACCU + 1 
12b4 : 85 1c __ STA ACCU + 1 
12b6 : a5 49 __ LDA T4 + 2 
12b8 : 65 1d __ ADC ACCU + 2 
12ba : 85 1d __ STA ACCU + 2 
12bc : a5 4a __ LDA T4 + 3 
.s52:
12be : 69 00 __ ADC #$00
12c0 : 85 1e __ STA ACCU + 3 
12c2 : 18 __ __ CLC
12c3 : a5 53 __ LDA T0 + 0 
12c5 : 65 57 __ ADC T1 + 0 
12c7 : 85 47 __ STA T4 + 0 
12c9 : a5 54 __ LDA T0 + 1 
12cb : 65 58 __ ADC T1 + 1 
12cd : 85 48 __ STA T4 + 1 
12cf : a5 55 __ LDA T0 + 2 
12d1 : 65 59 __ ADC T1 + 2 
12d3 : 85 49 __ STA T4 + 2 
12d5 : a5 56 __ LDA T0 + 3 
12d7 : 65 5a __ ADC T1 + 3 
12d9 : 85 4a __ STA T4 + 3 
12db : 30 38 __ BMI $1315 ; (main.s53 + 0)
.s110:
12dd : c9 04 __ CMP #$04
12df : 90 34 __ BCC $1315 ; (main.s53 + 0)
.s56:
12e1 : be 00 18 LDX $1800,y ; (colors[0] + 0)
.s55:
12e4 : a5 5f __ LDA T9 + 0 
12e6 : 0a __ __ ASL
12e7 : 0a __ __ ASL
12e8 : 65 5f __ ADC T9 + 0 
12ea : 0a __ __ ASL
12eb : 0a __ __ ASL
12ec : 85 53 __ STA T0 + 0 
12ee : a9 36 __ LDA #$36
12f0 : 2a __ __ ROL
12f1 : 06 53 __ ASL T0 + 0 
12f3 : 2a __ __ ROL
12f4 : 85 54 __ STA T0 + 1 
12f6 : 8a __ __ TXA
12f7 : a0 27 __ LDY #$27
12f9 : 91 53 __ STA (T0 + 0),y 
12fb : a5 5b __ LDA T7 + 0 
12fd : 65 67 __ ADC T15 + 0 
12ff : 85 5b __ STA T7 + 0 
1301 : a5 5c __ LDA T7 + 1 
1303 : 65 68 __ ADC T15 + 1 
1305 : 85 5c __ STA T7 + 1 
1307 : e6 5f __ INC T9 + 0 
1309 : a5 5f __ LDA T9 + 0 
130b : c9 19 __ CMP #$19
130d : b0 03 __ BCS $1312 ; (main.s55 + 46)
130f : 4c dc 10 JMP $10dc ; (main.l43 + 0)
1312 : 4c 18 09 JMP $0918 ; (main.l8 + 0)
.s53:
1315 : 38 __ __ SEC
1316 : a5 1c __ LDA ACCU + 1 
1318 : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
131b : 85 1c __ STA ACCU + 1 
131d : a5 1d __ LDA ACCU + 2 
131f : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
1322 : aa __ __ TAX
1323 : b0 02 __ BCS $1327 ; (main.s87 + 0)
.s86:
1325 : c6 1e __ DEC ACCU + 3 
.s87:
1327 : 38 __ __ SEC
1328 : a5 1c __ LDA ACCU + 1 
132a : e5 43 __ SBC T3 + 0 
132c : 85 1c __ STA ACCU + 1 
132e : 8a __ __ TXA
132f : e5 44 __ SBC T3 + 1 
1331 : aa __ __ TAX
1332 : b0 02 __ BCS $1336 ; (main.s89 + 0)
.s88:
1334 : c6 1e __ DEC ACCU + 3 
.s89:
1336 : 38 __ __ SEC
1337 : a5 1b __ LDA ACCU + 0 
1339 : e5 47 __ SBC T4 + 0 
133b : a5 1c __ LDA ACCU + 1 
133d : e5 48 __ SBC T4 + 1 
133f : 85 1c __ STA ACCU + 1 
1341 : 8a __ __ TXA
1342 : e5 49 __ SBC T4 + 2 
1344 : aa __ __ TAX
1345 : a5 1e __ LDA ACCU + 3 
1347 : e5 4a __ SBC T4 + 3 
1349 : 85 1e __ STA ACCU + 3 
134b : 18 __ __ CLC
134c : a5 1c __ LDA ACCU + 1 
134e : 69 08 __ ADC #$08
1350 : 85 1c __ STA ACCU + 1 
1352 : 8a __ __ TXA
1353 : 69 00 __ ADC #$00
1355 : 85 1d __ STA ACCU + 2 
1357 : 90 03 __ BCC $135c ; (main.s91 + 0)
.s90:
1359 : e6 1e __ INC ACCU + 3 
135b : 18 __ __ CLC
.s91:
135c : aa __ __ TAX
135d : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
1360 : a6 1e __ LDX ACCU + 3 
1362 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
1365 : 85 44 __ STA T3 + 1 
1367 : a6 1c __ LDX ACCU + 1 
1369 : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
136c : a6 1d __ LDX ACCU + 2 
136e : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
1371 : 65 5b __ ADC T7 + 0 
1373 : 85 4f __ STA T6 + 0 
1375 : a5 44 __ LDA T3 + 1 
1377 : 65 5c __ ADC T7 + 1 
1379 : 85 50 __ STA T6 + 1 
137b : 38 __ __ SEC
137c : a5 53 __ LDA T0 + 0 
137e : e5 57 __ SBC T1 + 0 
1380 : a5 54 __ LDA T0 + 1 
1382 : e5 58 __ SBC T1 + 1 
1384 : aa __ __ TAX
1385 : a5 55 __ LDA T0 + 2 
1387 : e5 59 __ SBC T1 + 2 
1389 : 85 55 __ STA T0 + 2 
138b : a5 56 __ LDA T0 + 3 
138d : e5 5a __ SBC T1 + 3 
138f : 85 56 __ STA T0 + 3 
1391 : 8a __ __ TXA
1392 : 18 __ __ CLC
1393 : 69 08 __ ADC #$08
1395 : 85 54 __ STA T0 + 1 
1397 : a5 55 __ LDA T0 + 2 
1399 : 69 00 __ ADC #$00
139b : 85 55 __ STA T0 + 2 
139d : 90 03 __ BCC $13a2 ; (main.s93 + 0)
.s92:
139f : e6 56 __ INC T0 + 3 
13a1 : 18 __ __ CLC
.s93:
13a2 : aa __ __ TAX
13a3 : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
13a6 : a6 56 __ LDX T0 + 3 
13a8 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
13ab : 85 58 __ STA T1 + 1 
13ad : a6 54 __ LDX T0 + 1 
13af : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
13b2 : a6 55 __ LDX T0 + 2 
13b4 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
13b7 : 65 5d __ ADC T8 + 0 
13b9 : 85 61 __ STA T10 + 0 
13bb : a5 58 __ LDA T1 + 1 
13bd : 65 5e __ ADC T8 + 1 
13bf : c8 __ __ INY
13c0 : c0 20 __ CPY #$20
13c2 : b0 03 __ BCS $13c7 ; (main.s54 + 0)
13c4 : 4c ec 10 JMP $10ec ; (main.l44 + 0)
.s54:
13c7 : a2 00 __ LDX #$00
13c9 : 4c e4 12 JMP $12e4 ; (main.s55 + 0)
--------------------------------------------------------------------
fill_row@proxy: ; fill_row@proxy
13cc : a5 63 __ LDA $63 
13ce : 85 0e __ STA P1 
13d0 : a5 64 __ LDA $64 
13d2 : 85 0f __ STA P2 
--------------------------------------------------------------------
fill_row: ; fill_row(u8,i16,i16,i16)->void
; 155, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbzoom.c"
.s1:
13d4 : a2 0b __ LDX #$0b
13d6 : b5 53 __ LDA T5 + 0,x 
13d8 : 9d e8 9f STA $9fe8,x ; (fill_row@stack + 0)
13db : ca __ __ DEX
13dc : 10 f8 __ BPL $13d6 ; (fill_row.s1 + 2)
.s4:
13de : a9 00 __ LDA #$00
13e0 : 85 5b __ STA T7 + 0 
.l5:
13e2 : a5 0e __ LDA P1 ; (cix + 0)
13e4 : 85 57 __ STA T6 + 0 
13e6 : a5 0f __ LDA P2 ; (cix + 1)
13e8 : 85 58 __ STA T6 + 1 
13ea : a5 10 __ LDA P3 ; (yz + 0)
13ec : 85 5c __ STA T9 + 0 
13ee : a5 11 __ LDA P4 ; (yz + 1)
13f0 : 85 5d __ STA T9 + 1 
13f2 : a0 00 __ LDY #$00
.l6:
13f4 : a5 57 __ LDA T6 + 0 
13f6 : 85 1b __ STA ACCU + 0 
13f8 : a5 58 __ LDA T6 + 1 
13fa : 10 0b __ BPL $1407 ; (fill_row.s25 + 0)
.s24:
13fc : 38 __ __ SEC
13fd : a9 00 __ LDA #$00
13ff : e5 57 __ SBC T6 + 0 
1401 : 85 1b __ STA ACCU + 0 
1403 : a9 00 __ LDA #$00
1405 : e5 58 __ SBC T6 + 1 
.s25:
1407 : 85 43 __ STA T1 + 0 
1409 : 18 __ __ CLC
140a : 65 1b __ ADC ACCU + 0 
140c : 85 53 __ STA T5 + 0 
140e : aa __ __ TAX
140f : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
1412 : 85 1d __ STA ACCU + 2 
1414 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1417 : 85 1c __ STA ACCU + 1 
1419 : a6 43 __ LDX T1 + 0 
141b : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
141e : 85 43 __ STA T1 + 0 
1420 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
1423 : 85 44 __ STA T1 + 1 
1425 : 85 4a __ STA T2 + 3 
1427 : a9 00 __ LDA #$00
1429 : 6a __ __ ROR
142a : a6 1b __ LDX ACCU + 0 
142c : 09 00 __ ORA #$00
142e : 30 17 __ BMI $1447 ; (fill_row.s23 + 0)
.s7:
1430 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1433 : 85 1b __ STA ACCU + 0 
1435 : a5 1c __ LDA ACCU + 1 
1437 : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
143a : 85 1c __ STA ACCU + 1 
143c : a5 1d __ LDA ACCU + 2 
143e : 65 43 __ ADC T1 + 0 
1440 : 85 1d __ STA ACCU + 2 
1442 : a5 44 __ LDA T1 + 1 
1444 : 4c 72 14 JMP $1472 ; (fill_row.s8 + 0)
.s23:
1447 : e6 4a __ INC T2 + 3 
1449 : a9 00 __ LDA #$00
144b : 85 52 __ STA T4 + 3 
144d : a5 53 __ LDA T5 + 0 
144f : 0a __ __ ASL
1450 : 26 52 __ ROL T4 + 3 
1452 : 18 __ __ CLC
1453 : 65 43 __ ADC T1 + 0 
1455 : 85 49 __ STA T2 + 2 
1457 : a5 52 __ LDA T4 + 3 
1459 : 65 4a __ ADC T2 + 3 
145b : 85 4a __ STA T2 + 3 
145d : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1460 : 85 1b __ STA ACCU + 0 
1462 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
1465 : 18 __ __ CLC
1466 : 65 1c __ ADC ACCU + 1 
1468 : 85 1c __ STA ACCU + 1 
146a : a5 49 __ LDA T2 + 2 
146c : 65 1d __ ADC ACCU + 2 
146e : 85 1d __ STA ACCU + 2 
1470 : a5 4a __ LDA T2 + 3 
.s8:
1472 : 69 00 __ ADC #$00
1474 : 85 1e __ STA ACCU + 3 
1476 : a5 5c __ LDA T9 + 0 
1478 : 85 47 __ STA T2 + 0 
147a : 38 __ __ SEC
147b : a5 1c __ LDA ACCU + 1 
147d : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
1480 : 85 1c __ STA ACCU + 1 
1482 : a5 1d __ LDA ACCU + 2 
1484 : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
1487 : aa __ __ TAX
1488 : b0 02 __ BCS $148c ; (fill_row.s27 + 0)
.s26:
148a : c6 1e __ DEC ACCU + 3 
.s27:
148c : 38 __ __ SEC
148d : a5 1c __ LDA ACCU + 1 
148f : e5 43 __ SBC T1 + 0 
1491 : 85 1c __ STA ACCU + 1 
1493 : 8a __ __ TXA
1494 : e5 44 __ SBC T1 + 1 
1496 : 85 1d __ STA ACCU + 2 
1498 : b0 02 __ BCS $149c ; (fill_row.s29 + 0)
.s28:
149a : c6 1e __ DEC ACCU + 3 
.s29:
149c : a5 5d __ LDA T9 + 1 
149e : 10 0b __ BPL $14ab ; (fill_row.s9 + 0)
.s22:
14a0 : 38 __ __ SEC
14a1 : a9 00 __ LDA #$00
14a3 : e5 5c __ SBC T9 + 0 
14a5 : 85 47 __ STA T2 + 0 
14a7 : a9 00 __ LDA #$00
14a9 : e5 5d __ SBC T9 + 1 
.s9:
14ab : 85 48 __ STA T2 + 1 
14ad : a5 47 __ LDA T2 + 0 
14af : 85 4f __ STA T4 + 0 
14b1 : 18 __ __ CLC
14b2 : 65 48 __ ADC T2 + 1 
14b4 : 85 5e __ STA T12 + 0 
14b6 : aa __ __ TAX
14b7 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
14ba : 85 45 __ STA T1 + 2 
14bc : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
14bf : 85 44 __ STA T1 + 1 
14c1 : a6 48 __ LDX T2 + 1 
14c3 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
14c6 : 85 47 __ STA T2 + 0 
14c8 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
14cb : 85 48 __ STA T2 + 1 
14cd : 85 4e __ STA T3 + 3 
14cf : a9 00 __ LDA #$00
14d1 : 6a __ __ ROR
14d2 : a6 4f __ LDX T4 + 0 
14d4 : 09 00 __ ORA #$00
14d6 : 30 17 __ BMI $14ef ; (fill_row.s21 + 0)
.s10:
14d8 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
14db : 85 43 __ STA T1 + 0 
14dd : a5 44 __ LDA T1 + 1 
14df : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
14e2 : 85 44 __ STA T1 + 1 
14e4 : a5 45 __ LDA T1 + 2 
14e6 : 65 47 __ ADC T2 + 0 
14e8 : 85 45 __ STA T1 + 2 
14ea : a5 48 __ LDA T2 + 1 
14ec : 4c 1a 15 JMP $151a ; (fill_row.s11 + 0)
.s21:
14ef : e6 4e __ INC T3 + 3 
14f1 : a9 00 __ LDA #$00
14f3 : 85 56 __ STA T5 + 3 
14f5 : a5 5e __ LDA T12 + 0 
14f7 : 0a __ __ ASL
14f8 : 26 56 __ ROL T5 + 3 
14fa : 18 __ __ CLC
14fb : 65 47 __ ADC T2 + 0 
14fd : 85 4d __ STA T3 + 2 
14ff : a5 56 __ LDA T5 + 3 
1501 : 65 4e __ ADC T3 + 3 
1503 : 85 4e __ STA T3 + 3 
1505 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1508 : 85 43 __ STA T1 + 0 
150a : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
150d : 18 __ __ CLC
150e : 65 44 __ ADC T1 + 1 
1510 : 85 44 __ STA T1 + 1 
1512 : a5 4d __ LDA T3 + 2 
1514 : 65 45 __ ADC T1 + 2 
1516 : 85 45 __ STA T1 + 2 
1518 : a5 4e __ LDA T3 + 3 
.s11:
151a : 69 00 __ ADC #$00
151c : 85 46 __ STA T1 + 3 
151e : 38 __ __ SEC
151f : a5 44 __ LDA T1 + 1 
1521 : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
1524 : 85 44 __ STA T1 + 1 
1526 : a5 45 __ LDA T1 + 2 
1528 : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
152b : aa __ __ TAX
152c : b0 02 __ BCS $1530 ; (fill_row.s31 + 0)
.s30:
152e : c6 46 __ DEC T1 + 3 
.s31:
1530 : 38 __ __ SEC
1531 : a5 44 __ LDA T1 + 1 
1533 : e5 47 __ SBC T2 + 0 
1535 : 85 44 __ STA T1 + 1 
1537 : 8a __ __ TXA
1538 : e5 48 __ SBC T2 + 1 
153a : 85 45 __ STA T1 + 2 
153c : b0 02 __ BCS $1540 ; (fill_row.s33 + 0)
.s32:
153e : c6 46 __ DEC T1 + 3 
.s33:
1540 : 18 __ __ CLC
1541 : a5 57 __ LDA T6 + 0 
1543 : 65 5c __ ADC T9 + 0 
1545 : 85 47 __ STA T2 + 0 
1547 : a5 58 __ LDA T6 + 1 
1549 : 65 5d __ ADC T9 + 1 
154b : 10 0d __ BPL $155a ; (fill_row.s12 + 0)
.s20:
154d : 85 48 __ STA T2 + 1 
154f : 38 __ __ SEC
1550 : a9 00 __ LDA #$00
1552 : e5 47 __ SBC T2 + 0 
1554 : 85 47 __ STA T2 + 0 
1556 : a9 00 __ LDA #$00
1558 : e5 48 __ SBC T2 + 1 
.s12:
155a : 85 4b __ STA T3 + 0 
155c : 18 __ __ CLC
155d : 65 47 __ ADC T2 + 0 
155f : 85 5c __ STA T9 + 0 
1561 : aa __ __ TAX
1562 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
1565 : 85 49 __ STA T2 + 2 
1567 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
156a : 85 48 __ STA T2 + 1 
156c : a6 4b __ LDX T3 + 0 
156e : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1571 : 85 4b __ STA T3 + 0 
1573 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
1576 : 85 4c __ STA T3 + 1 
1578 : 85 52 __ STA T4 + 3 
157a : a9 00 __ LDA #$00
157c : 6a __ __ ROR
157d : a6 47 __ LDX T2 + 0 
157f : 09 00 __ ORA #$00
1581 : 30 17 __ BMI $159a ; (fill_row.s19 + 0)
.s13:
1583 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
1586 : 85 47 __ STA T2 + 0 
1588 : a5 48 __ LDA T2 + 1 
158a : 7d 00 1a ADC $1a00,x ; (sqb[0] + 1)
158d : 85 48 __ STA T2 + 1 
158f : a5 49 __ LDA T2 + 2 
1591 : 65 4b __ ADC T3 + 0 
1593 : 85 49 __ STA T2 + 2 
1595 : a5 4c __ LDA T3 + 1 
1597 : 4c c5 15 JMP $15c5 ; (fill_row.s14 + 0)
.s19:
159a : e6 52 __ INC T4 + 3 
159c : a9 00 __ LDA #$00
159e : 85 5a __ STA T6 + 3 
15a0 : a5 5c __ LDA T9 + 0 
15a2 : 0a __ __ ASL
15a3 : 26 5a __ ROL T6 + 3 
15a5 : 18 __ __ CLC
15a6 : 65 4b __ ADC T3 + 0 
15a8 : 85 51 __ STA T4 + 2 
15aa : a5 5a __ LDA T6 + 3 
15ac : 65 52 __ ADC T4 + 3 
15ae : 85 52 __ STA T4 + 3 
15b0 : bd 00 19 LDA $1900,x ; (sqb[0] + 0)
15b3 : 85 47 __ STA T2 + 0 
15b5 : bd 00 1a LDA $1a00,x ; (sqb[0] + 1)
15b8 : 18 __ __ CLC
15b9 : 65 48 __ ADC T2 + 1 
15bb : 85 48 __ STA T2 + 1 
15bd : a5 51 __ LDA T4 + 2 
15bf : 65 49 __ ADC T2 + 2 
15c1 : 85 49 __ STA T2 + 2 
15c3 : a5 52 __ LDA T4 + 3 
.s14:
15c5 : 69 00 __ ADC #$00
15c7 : 85 4a __ STA T2 + 3 
15c9 : 18 __ __ CLC
15ca : a5 1b __ LDA ACCU + 0 
15cc : 65 43 __ ADC T1 + 0 
15ce : 85 4f __ STA T4 + 0 
15d0 : a5 1c __ LDA ACCU + 1 
15d2 : 65 44 __ ADC T1 + 1 
15d4 : 85 50 __ STA T4 + 1 
15d6 : a5 1d __ LDA ACCU + 2 
15d8 : 65 45 __ ADC T1 + 2 
15da : 85 51 __ STA T4 + 2 
15dc : a5 1e __ LDA ACCU + 3 
15de : 65 46 __ ADC T1 + 3 
15e0 : 85 52 __ STA T4 + 3 
15e2 : 30 50 __ BMI $1634 ; (fill_row.s15 + 0)
.s42:
15e4 : c9 04 __ CMP #$04
15e6 : 90 4c __ BCC $1634 ; (fill_row.s15 + 0)
.s18:
15e8 : be 00 18 LDX $1800,y ; (colors[0] + 0)
.s17:
15eb : a5 0d __ LDA P0 ; (py + 0)
15ed : 0a __ __ ASL
15ee : 85 1b __ STA ACCU + 0 
15f0 : a9 00 __ LDA #$00
15f2 : 2a __ __ ROL
15f3 : 06 1b __ ASL ACCU + 0 
15f5 : 2a __ __ ROL
15f6 : a8 __ __ TAY
15f7 : a5 1b __ LDA ACCU + 0 
15f9 : 65 0d __ ADC P0 ; (py + 0)
15fb : 85 1b __ STA ACCU + 0 
15fd : 98 __ __ TYA
15fe : 69 00 __ ADC #$00
1600 : 06 1b __ ASL ACCU + 0 
1602 : 2a __ __ ROL
1603 : 06 1b __ ASL ACCU + 0 
1605 : 2a __ __ ROL
1606 : 06 1b __ ASL ACCU + 0 
1608 : 2a __ __ ROL
1609 : 69 d8 __ ADC #$d8
160b : 85 1c __ STA ACCU + 1 
160d : 8a __ __ TXA
160e : a4 5b __ LDY T7 + 0 
1610 : 91 1b __ STA (ACCU + 0),y 
1612 : 18 __ __ CLC
1613 : a5 12 __ LDA P5 ; (cis + 0)
1615 : 65 0e __ ADC P1 ; (cix + 0)
1617 : 85 0e __ STA P1 ; (cix + 0)
1619 : a5 13 __ LDA P6 ; (cis + 1)
161b : 65 0f __ ADC P2 ; (cix + 1)
161d : 85 0f __ STA P2 ; (cix + 1)
161f : c8 __ __ INY
1620 : 84 5b __ STY T7 + 0 
1622 : c0 28 __ CPY #$28
1624 : b0 03 __ BCS $1629 ; (fill_row.s3 + 0)
1626 : 4c e2 13 JMP $13e2 ; (fill_row.l5 + 0)
.s3:
1629 : a2 0b __ LDX #$0b
162b : bd e8 9f LDA $9fe8,x ; (fill_row@stack + 0)
162e : 95 53 __ STA T5 + 0,x 
1630 : ca __ __ DEX
1631 : 10 f8 __ BPL $162b ; (fill_row.s3 + 2)
1633 : 60 __ __ RTS
.s15:
1634 : 38 __ __ SEC
1635 : a5 48 __ LDA T2 + 1 
1637 : fd 00 19 SBC $1900,x ; (sqb[0] + 0)
163a : 85 48 __ STA T2 + 1 
163c : a5 49 __ LDA T2 + 2 
163e : fd 00 1a SBC $1a00,x ; (sqb[0] + 1)
1641 : aa __ __ TAX
1642 : b0 02 __ BCS $1646 ; (fill_row.s35 + 0)
.s34:
1644 : c6 4a __ DEC T2 + 3 
.s35:
1646 : 38 __ __ SEC
1647 : a5 48 __ LDA T2 + 1 
1649 : e5 4b __ SBC T3 + 0 
164b : 85 48 __ STA T2 + 1 
164d : 8a __ __ TXA
164e : e5 4c __ SBC T3 + 1 
1650 : aa __ __ TAX
1651 : b0 02 __ BCS $1655 ; (fill_row.s37 + 0)
.s36:
1653 : c6 4a __ DEC T2 + 3 
.s37:
1655 : 38 __ __ SEC
1656 : a5 47 __ LDA T2 + 0 
1658 : e5 4f __ SBC T4 + 0 
165a : a5 48 __ LDA T2 + 1 
165c : e5 50 __ SBC T4 + 1 
165e : 85 48 __ STA T2 + 1 
1660 : 8a __ __ TXA
1661 : e5 51 __ SBC T4 + 2 
1663 : aa __ __ TAX
1664 : a5 4a __ LDA T2 + 3 
1666 : e5 52 __ SBC T4 + 3 
1668 : 85 4a __ STA T2 + 3 
166a : 18 __ __ CLC
166b : a5 48 __ LDA T2 + 1 
166d : 69 08 __ ADC #$08
166f : 85 48 __ STA T2 + 1 
1671 : 8a __ __ TXA
1672 : 69 00 __ ADC #$00
1674 : 85 49 __ STA T2 + 2 
1676 : 90 03 __ BCC $167b ; (fill_row.s39 + 0)
.s38:
1678 : e6 4a __ INC T2 + 3 
167a : 18 __ __ CLC
.s39:
167b : aa __ __ TAX
167c : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
167f : a6 4a __ LDX T2 + 3 
1681 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
1684 : 85 4c __ STA T3 + 1 
1686 : a6 48 __ LDX T2 + 1 
1688 : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
168b : a6 49 __ LDX T2 + 2 
168d : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
1690 : 65 10 __ ADC P3 ; (yz + 0)
1692 : 85 5c __ STA T9 + 0 
1694 : a5 4c __ LDA T3 + 1 
1696 : 65 11 __ ADC P4 ; (yz + 1)
1698 : 85 5d __ STA T9 + 1 
169a : 38 __ __ SEC
169b : a5 1b __ LDA ACCU + 0 
169d : e5 43 __ SBC T1 + 0 
169f : a5 1c __ LDA ACCU + 1 
16a1 : e5 44 __ SBC T1 + 1 
16a3 : aa __ __ TAX
16a4 : a5 1d __ LDA ACCU + 2 
16a6 : e5 45 __ SBC T1 + 2 
16a8 : 85 1d __ STA ACCU + 2 
16aa : a5 1e __ LDA ACCU + 3 
16ac : e5 46 __ SBC T1 + 3 
16ae : 85 1e __ STA ACCU + 3 
16b0 : 8a __ __ TXA
16b1 : 18 __ __ CLC
16b2 : 69 08 __ ADC #$08
16b4 : 85 1c __ STA ACCU + 1 
16b6 : a5 1d __ LDA ACCU + 2 
16b8 : 69 00 __ ADC #$00
16ba : 85 1d __ STA ACCU + 2 
16bc : 90 03 __ BCC $16c1 ; (fill_row.s41 + 0)
.s40:
16be : e6 1e __ INC ACCU + 3 
16c0 : 18 __ __ CLC
.s41:
16c1 : aa __ __ TAX
16c2 : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
16c5 : a6 1e __ LDX ACCU + 3 
16c7 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
16ca : 85 44 __ STA T1 + 1 
16cc : a6 1c __ LDX ACCU + 1 
16ce : bd 00 1c LDA $1c00,x ; (shrb4[0] + 0)
16d1 : a6 1d __ LDX ACCU + 2 
16d3 : 1d 00 1b ORA $1b00,x ; (shlb4[0] + 0)
16d6 : 65 0e __ ADC P1 ; (cix + 0)
16d8 : 85 57 __ STA T6 + 0 
16da : a5 44 __ LDA T1 + 1 
16dc : 65 0f __ ADC P2 ; (cix + 1)
16de : 85 58 __ STA T6 + 1 
16e0 : c8 __ __ INY
16e1 : c0 20 __ CPY #$20
16e3 : b0 03 __ BCS $16e8 ; (fill_row.s16 + 0)
16e5 : 4c f4 13 JMP $13f4 ; (fill_row.l6 + 0)
.s16:
16e8 : a2 00 __ LDX #$00
16ea : 4c eb 15 JMP $15eb ; (fill_row.s17 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
16ed : 20 e4 ff JSR $ffe4 
16f0 : aa __ __ TAX
16f1 : f0 fa __ BEQ $16ed ; (getch.l4 + 0)
.s5:
16f3 : c9 0d __ CMP #$0d
16f5 : d0 02 __ BNE $16f9 ; (getch.s3 + 0)
.s6:
16f7 : a9 0a __ LDA #$0a
.s3:
16f9 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
16fa : 4a __ __ LSR
16fb : f0 2e __ BEQ $172b ; (mul16by8 + 49)
16fd : a2 00 __ LDX #$00
16ff : a0 00 __ LDY #$00
1701 : 90 13 __ BCC $1716 ; (mul16by8 + 28)
1703 : a4 1b __ LDY ACCU + 0 
1705 : a6 1c __ LDX ACCU + 1 
1707 : b0 0d __ BCS $1716 ; (mul16by8 + 28)
1709 : 85 02 __ STA $02 
170b : 18 __ __ CLC
170c : 98 __ __ TYA
170d : 65 1b __ ADC ACCU + 0 
170f : a8 __ __ TAY
1710 : 8a __ __ TXA
1711 : 65 1c __ ADC ACCU + 1 
1713 : aa __ __ TAX
1714 : a5 02 __ LDA $02 
1716 : 06 1b __ ASL ACCU + 0 
1718 : 26 1c __ ROL ACCU + 1 
171a : 4a __ __ LSR
171b : 90 f9 __ BCC $1716 ; (mul16by8 + 28)
171d : d0 ea __ BNE $1709 ; (mul16by8 + 15)
171f : 18 __ __ CLC
1720 : 98 __ __ TYA
1721 : 65 1b __ ADC ACCU + 0 
1723 : 85 1b __ STA ACCU + 0 
1725 : 8a __ __ TXA
1726 : 65 1c __ ADC ACCU + 1 
1728 : 85 1c __ STA ACCU + 1 
172a : 60 __ __ RTS
172b : b0 04 __ BCS $1731 ; (mul16by8 + 55)
172d : 85 1b __ STA ACCU + 0 
172f : 85 1c __ STA ACCU + 1 
1731 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
1732 : 24 1c __ BIT ACCU + 1 
1734 : 10 0d __ BPL $1743 ; (divs16 + 17)
1736 : 20 4d 17 JSR $174d ; (negaccu + 0)
1739 : 24 04 __ BIT WORK + 1 
173b : 10 0d __ BPL $174a ; (divs16 + 24)
173d : 20 5b 17 JSR $175b ; (negtmp + 0)
1740 : 4c 69 17 JMP $1769 ; (divmod + 0)
1743 : 24 04 __ BIT WORK + 1 
1745 : 10 f9 __ BPL $1740 ; (divs16 + 14)
1747 : 20 5b 17 JSR $175b ; (negtmp + 0)
174a : 20 69 17 JSR $1769 ; (divmod + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
174d : 38 __ __ SEC
174e : a9 00 __ LDA #$00
1750 : e5 1b __ SBC ACCU + 0 
1752 : 85 1b __ STA ACCU + 0 
1754 : a9 00 __ LDA #$00
1756 : e5 1c __ SBC ACCU + 1 
1758 : 85 1c __ STA ACCU + 1 
175a : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
175b : 38 __ __ SEC
175c : a9 00 __ LDA #$00
175e : e5 03 __ SBC WORK + 0 
1760 : 85 03 __ STA WORK + 0 
1762 : a9 00 __ LDA #$00
1764 : e5 04 __ SBC WORK + 1 
1766 : 85 04 __ STA WORK + 1 
1768 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1769 : a5 1c __ LDA ACCU + 1 
176b : d0 31 __ BNE $179e ; (divmod + 53)
176d : a5 04 __ LDA WORK + 1 
176f : d0 1e __ BNE $178f ; (divmod + 38)
1771 : 85 06 __ STA WORK + 3 
1773 : a2 04 __ LDX #$04
1775 : 06 1b __ ASL ACCU + 0 
1777 : 2a __ __ ROL
1778 : c5 03 __ CMP WORK + 0 
177a : 90 02 __ BCC $177e ; (divmod + 21)
177c : e5 03 __ SBC WORK + 0 
177e : 26 1b __ ROL ACCU + 0 
1780 : 2a __ __ ROL
1781 : c5 03 __ CMP WORK + 0 
1783 : 90 02 __ BCC $1787 ; (divmod + 30)
1785 : e5 03 __ SBC WORK + 0 
1787 : 26 1b __ ROL ACCU + 0 
1789 : ca __ __ DEX
178a : d0 eb __ BNE $1777 ; (divmod + 14)
178c : 85 05 __ STA WORK + 2 
178e : 60 __ __ RTS
178f : a5 1b __ LDA ACCU + 0 
1791 : 85 05 __ STA WORK + 2 
1793 : a5 1c __ LDA ACCU + 1 
1795 : 85 06 __ STA WORK + 3 
1797 : a9 00 __ LDA #$00
1799 : 85 1b __ STA ACCU + 0 
179b : 85 1c __ STA ACCU + 1 
179d : 60 __ __ RTS
179e : a5 04 __ LDA WORK + 1 
17a0 : d0 1f __ BNE $17c1 ; (divmod + 88)
17a2 : a5 03 __ LDA WORK + 0 
17a4 : 30 1b __ BMI $17c1 ; (divmod + 88)
17a6 : a9 00 __ LDA #$00
17a8 : 85 06 __ STA WORK + 3 
17aa : a2 10 __ LDX #$10
17ac : 06 1b __ ASL ACCU + 0 
17ae : 26 1c __ ROL ACCU + 1 
17b0 : 2a __ __ ROL
17b1 : c5 03 __ CMP WORK + 0 
17b3 : 90 02 __ BCC $17b7 ; (divmod + 78)
17b5 : e5 03 __ SBC WORK + 0 
17b7 : 26 1b __ ROL ACCU + 0 
17b9 : 26 1c __ ROL ACCU + 1 
17bb : ca __ __ DEX
17bc : d0 f2 __ BNE $17b0 ; (divmod + 71)
17be : 85 05 __ STA WORK + 2 
17c0 : 60 __ __ RTS
17c1 : a9 00 __ LDA #$00
17c3 : 85 05 __ STA WORK + 2 
17c5 : 85 06 __ STA WORK + 3 
17c7 : 84 02 __ STY $02 
17c9 : a0 10 __ LDY #$10
17cb : 18 __ __ CLC
17cc : 26 1b __ ROL ACCU + 0 
17ce : 26 1c __ ROL ACCU + 1 
17d0 : 26 05 __ ROL WORK + 2 
17d2 : 26 06 __ ROL WORK + 3 
17d4 : 38 __ __ SEC
17d5 : a5 05 __ LDA WORK + 2 
17d7 : e5 03 __ SBC WORK + 0 
17d9 : aa __ __ TAX
17da : a5 06 __ LDA WORK + 3 
17dc : e5 04 __ SBC WORK + 1 
17de : 90 04 __ BCC $17e4 ; (divmod + 123)
17e0 : 86 05 __ STX WORK + 2 
17e2 : 85 06 __ STA WORK + 3 
17e4 : 88 __ __ DEY
17e5 : d0 e5 __ BNE $17cc ; (divmod + 99)
17e7 : 26 1b __ ROL ACCU + 0 
17e9 : 26 1c __ ROL ACCU + 1 
17eb : a4 02 __ LDY $02 
17ed : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
17ee : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
colors:
1800 : __ __ __ BYT 06 0e 01 0d 05 07 08 02 04 06 06 0e 0e 01 01 0d : ................
1810 : __ __ __ BYT 0d 05 05 07 07 08 08 02 02 04 04 0f 0f 0c 0c 0b : ................
--------------------------------------------------------------------
sqb:
1900 : __ __ __ BSS	512
--------------------------------------------------------------------
shlb4:
1b00 : __ __ __ BSS	256
--------------------------------------------------------------------
shrb4:
1c00 : __ __ __ BSS	256
