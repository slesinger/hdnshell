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
080e : 8e 9f 26 STX $269f ; (spentry + 0)
0811 : a2 28 __ LDX #$28
0813 : a0 3c __ LDY #$3c
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 31 __ CPX #$31
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
083b : a9 82 __ LDA #$82
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
; 246, "/home/honza/projects/c64/projects/hdnsh/oscar/hodiny/hodiny.c"
.s1:
0880 : a2 11 __ LDX #$11
0882 : b5 53 __ LDA T2 + 0,x 
0884 : 9d 84 9f STA $9f84,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : a9 0e __ LDA #$0e
088c : 20 76 0c JSR $0c76 ; (putpch.s4 + 0)
088f : a9 00 __ LDA #$00
0891 : 85 0d __ STA P0 
0893 : 85 0e __ STA P1 
0895 : 8d 21 d0 STA $d021 
0898 : a9 0b __ LDA #$0b
089a : 8d 20 d0 STA $d020 
089d : 20 d9 0c JSR $0cd9 ; (clrscr.s4 + 0)
08a0 : a9 01 __ LDA #$01
08a2 : 8d 86 02 STA $0286 
08a5 : 20 e3 0c JSR $0ce3 ; (gotoxy.s4 + 0)
08a8 : a9 03 __ LDA #$03
08aa : 8d 86 02 STA $0286 
08ad : a9 40 __ LDA #$40
08af : 8d f8 9f STA $9ff8 ; (sstack + 8)
08b2 : a9 19 __ LDA #$19
08b4 : 8d f9 9f STA $9ff9 ; (sstack + 9)
08b7 : 20 ec 0c JSR $0cec ; (printf.s4 + 0)
08ba : 20 65 19 JSR $1965 ; (draw_poem.s1 + 0)
08bd : 20 64 1b JSR $1b64 ; (draw_divider.s4 + 0)
08c0 : 20 83 1b JSR $1b83 ; (draw_clock_bg.s4 + 0)
08c3 : a9 ff __ LDA #$ff
08c5 : 85 55 __ STA T3 + 0 
08c7 : 85 56 __ STA T3 + 1 
.l5:
08c9 : 20 3a 1c JSR $1c3a ; (uii_get_time.s4 + 0)
08cc : ad 3c 28 LDA $283c ; (uii_data[0] + 0)
08cf : f0 f8 __ BEQ $08c9 ; (main.l5 + 0)
.s6:
08d1 : 85 53 __ STA T2 + 0 
08d3 : ad 40 28 LDA $2840 ; (uii_data[0] + 4)
08d6 : c9 2f __ CMP #$2f
08d8 : d0 ef __ BNE $08c9 ; (main.l5 + 0)
.s7:
08da : ad 43 28 LDA $2843 ; (uii_data[0] + 7)
08dd : c9 2f __ CMP #$2f
08df : d0 e8 __ BNE $08c9 ; (main.l5 + 0)
.s8:
08e1 : ad 46 28 LDA $2846 ; (uii_data[0] + 10)
08e4 : c9 20 __ CMP #$20
08e6 : d0 e1 __ BNE $08c9 ; (main.l5 + 0)
.s9:
08e8 : ad 49 28 LDA $2849 ; (uii_data[0] + 13)
08eb : c9 3a __ CMP #$3a
08ed : d0 da __ BNE $08c9 ; (main.l5 + 0)
.s10:
08ef : ad 4c 28 LDA $284c ; (uii_data[0] + 16)
08f2 : c9 3a __ CMP #$3a
08f4 : d0 d3 __ BNE $08c9 ; (main.l5 + 0)
.s11:
08f6 : ad 4d 28 LDA $284d ; (uii_data[0] + 17)
08f9 : 0a __ __ ASL
08fa : 85 1b __ STA ACCU + 0 
08fc : a9 00 __ LDA #$00
08fe : 2a __ __ ROL
08ff : 06 1b __ ASL ACCU + 0 
0901 : 2a __ __ ROL
0902 : aa __ __ TAX
0903 : a5 1b __ LDA ACCU + 0 
0905 : 6d 4d 28 ADC $284d ; (uii_data[0] + 17)
0908 : 85 43 __ STA T0 + 0 
090a : 8a __ __ TXA
090b : 69 00 __ ADC #$00
090d : 06 43 __ ASL T0 + 0 
090f : 2a __ __ ROL
0910 : a8 __ __ TAY
0911 : ad 4e 28 LDA $284e ; (uii_data[0] + 18)
0914 : 65 43 __ ADC T0 + 0 
0916 : 90 01 __ BCC $0919 ; (main.s21 + 0)
.s20:
0918 : c8 __ __ INY
.s21:
0919 : 38 __ __ SEC
091a : e9 10 __ SBC #$10
091c : 85 57 __ STA T4 + 0 
091e : 98 __ __ TYA
091f : e9 02 __ SBC #$02
0921 : 85 58 __ STA T4 + 1 
0923 : c5 56 __ CMP T3 + 1 
0925 : f0 03 __ BEQ $092a ; (main.s17 + 0)
0927 : 4c 71 0c JMP $0c71 ; (main.s18 + 0)
.s17:
092a : a5 57 __ LDA T4 + 0 
092c : c5 55 __ CMP T3 + 0 
092e : f0 99 __ BEQ $08c9 ; (main.l5 + 0)
.s12:
0930 : 85 55 __ STA T3 + 0 
0932 : a5 58 __ LDA T4 + 1 
0934 : 85 56 __ STA T3 + 1 
0936 : ad 47 28 LDA $2847 ; (uii_data[0] + 11)
0939 : 0a __ __ ASL
093a : 85 1b __ STA ACCU + 0 
093c : a9 00 __ LDA #$00
093e : 85 04 __ STA WORK + 1 
0940 : 2a __ __ ROL
0941 : 06 1b __ ASL ACCU + 0 
0943 : 2a __ __ ROL
0944 : aa __ __ TAX
0945 : a5 1b __ LDA ACCU + 0 
0947 : 6d 47 28 ADC $2847 ; (uii_data[0] + 11)
094a : 85 43 __ STA T0 + 0 
094c : 8a __ __ TXA
094d : 69 00 __ ADC #$00
094f : 06 43 __ ASL T0 + 0 
0951 : 2a __ __ ROL
0952 : a8 __ __ TAY
0953 : ad 48 28 LDA $2848 ; (uii_data[0] + 12)
0956 : 65 43 __ ADC T0 + 0 
0958 : 90 01 __ BCC $095b ; (main.s23 + 0)
.s22:
095a : c8 __ __ INY
.s23:
095b : 38 __ __ SEC
095c : e9 10 __ SBC #$10
095e : 85 59 __ STA T5 + 0 
0960 : 85 1b __ STA ACCU + 0 
0962 : 98 __ __ TYA
0963 : e9 02 __ SBC #$02
0965 : 85 5a __ STA T5 + 1 
0967 : 85 1c __ STA ACCU + 1 
0969 : a9 0c __ LDA #$0c
096b : 85 03 __ STA WORK + 0 
096d : 20 4e 24 JSR $244e ; (mods16 + 0)
0970 : a5 05 __ LDA WORK + 2 
0972 : 85 5b __ STA T6 + 0 
0974 : a5 06 __ LDA WORK + 3 
0976 : 85 5c __ STA T6 + 1 
0978 : ad 3e 28 LDA $283e ; (uii_data[0] + 2)
097b : 0a __ __ ASL
097c : 85 1b __ STA ACCU + 0 
097e : a9 00 __ LDA #$00
0980 : 2a __ __ ROL
0981 : 06 1b __ ASL ACCU + 0 
0983 : 2a __ __ ROL
0984 : aa __ __ TAX
0985 : a5 1b __ LDA ACCU + 0 
0987 : 6d 3e 28 ADC $283e ; (uii_data[0] + 2)
098a : 85 43 __ STA T0 + 0 
098c : 8a __ __ TXA
098d : 69 00 __ ADC #$00
098f : 06 43 __ ASL T0 + 0 
0991 : 2a __ __ ROL
0992 : a8 __ __ TAY
0993 : ad 3f 28 LDA $283f ; (uii_data[0] + 3)
0996 : 65 43 __ ADC T0 + 0 
0998 : 90 01 __ BCC $099b ; (main.s25 + 0)
.s24:
099a : c8 __ __ INY
.s25:
099b : 38 __ __ SEC
099c : e9 10 __ SBC #$10
099e : 85 43 __ STA T0 + 0 
09a0 : 98 __ __ TYA
09a1 : e9 02 __ SBC #$02
09a3 : 85 44 __ STA T0 + 1 
09a5 : a5 53 __ LDA T2 + 0 
09a7 : 0a __ __ ASL
09a8 : 85 1b __ STA ACCU + 0 
09aa : a9 00 __ LDA #$00
09ac : 2a __ __ ROL
09ad : 06 1b __ ASL ACCU + 0 
09af : 2a __ __ ROL
09b0 : aa __ __ TAX
09b1 : a5 1b __ LDA ACCU + 0 
09b3 : 65 53 __ ADC T2 + 0 
09b5 : 85 45 __ STA T1 + 0 
09b7 : 8a __ __ TXA
09b8 : 69 00 __ ADC #$00
09ba : 06 45 __ ASL T1 + 0 
09bc : 2a __ __ ROL
09bd : a8 __ __ TAY
09be : ad 3d 28 LDA $283d ; (uii_data[0] + 1)
09c1 : 65 45 __ ADC T1 + 0 
09c3 : 90 01 __ BCC $09c6 ; (main.s27 + 0)
.s26:
09c5 : c8 __ __ INY
.s27:
09c6 : 38 __ __ SEC
09c7 : e9 10 __ SBC #$10
09c9 : 85 45 __ STA T1 + 0 
09cb : 98 __ __ TYA
09cc : e9 02 __ SBC #$02
09ce : 85 46 __ STA T1 + 1 
09d0 : a5 45 __ LDA T1 + 0 
09d2 : 0a __ __ ASL
09d3 : aa __ __ TAX
09d4 : a5 46 __ LDA T1 + 1 
09d6 : 2a __ __ ROL
09d7 : a8 __ __ TAY
09d8 : 8a __ __ TXA
09d9 : 18 __ __ CLC
09da : 65 45 __ ADC T1 + 0 
09dc : aa __ __ TAX
09dd : 98 __ __ TYA
09de : 65 46 __ ADC T1 + 1 
09e0 : 85 1b __ STA ACCU + 0 
09e2 : 8a __ __ TXA
09e3 : 0a __ __ ASL
09e4 : 26 1b __ ROL ACCU + 0 
09e6 : 0a __ __ ASL
09e7 : 26 1b __ ROL ACCU + 0 
09e9 : 0a __ __ ASL
09ea : 26 1b __ ROL ACCU + 0 
09ec : 18 __ __ CLC
09ed : 65 45 __ ADC T1 + 0 
09ef : 85 45 __ STA T1 + 0 
09f1 : a5 1b __ LDA ACCU + 0 
09f3 : 65 46 __ ADC T1 + 1 
09f5 : 06 45 __ ASL T1 + 0 
09f7 : 2a __ __ ROL
09f8 : 06 45 __ ASL T1 + 0 
09fa : 2a __ __ ROL
09fb : aa __ __ TAX
09fc : 18 __ __ CLC
09fd : a5 45 __ LDA T1 + 0 
09ff : 65 43 __ ADC T0 + 0 
0a01 : 85 53 __ STA T2 + 0 
0a03 : 8a __ __ TXA
0a04 : 65 44 __ ADC T0 + 1 
0a06 : 85 54 __ STA T2 + 1 
0a08 : ad 41 28 LDA $2841 ; (uii_data[0] + 5)
0a0b : 0a __ __ ASL
0a0c : 85 1b __ STA ACCU + 0 
0a0e : a9 00 __ LDA #$00
0a10 : 2a __ __ ROL
0a11 : 06 1b __ ASL ACCU + 0 
0a13 : 2a __ __ ROL
0a14 : aa __ __ TAX
0a15 : a5 1b __ LDA ACCU + 0 
0a17 : 6d 41 28 ADC $2841 ; (uii_data[0] + 5)
0a1a : 85 43 __ STA T0 + 0 
0a1c : 8a __ __ TXA
0a1d : 69 00 __ ADC #$00
0a1f : 06 43 __ ASL T0 + 0 
0a21 : 2a __ __ ROL
0a22 : a8 __ __ TAY
0a23 : ad 42 28 LDA $2842 ; (uii_data[0] + 6)
0a26 : 65 43 __ ADC T0 + 0 
0a28 : 90 01 __ BCC $0a2b ; (main.s29 + 0)
.s28:
0a2a : c8 __ __ INY
.s29:
0a2b : 38 __ __ SEC
0a2c : e9 10 __ SBC #$10
0a2e : 85 5d __ STA T7 + 0 
0a30 : 98 __ __ TYA
0a31 : e9 02 __ SBC #$02
0a33 : 85 5e __ STA T7 + 1 
0a35 : ad 44 28 LDA $2844 ; (uii_data[0] + 8)
0a38 : 0a __ __ ASL
0a39 : 85 1b __ STA ACCU + 0 
0a3b : a9 00 __ LDA #$00
0a3d : 2a __ __ ROL
0a3e : 06 1b __ ASL ACCU + 0 
0a40 : 2a __ __ ROL
0a41 : aa __ __ TAX
0a42 : a5 1b __ LDA ACCU + 0 
0a44 : 6d 44 28 ADC $2844 ; (uii_data[0] + 8)
0a47 : 85 43 __ STA T0 + 0 
0a49 : 8a __ __ TXA
0a4a : 69 00 __ ADC #$00
0a4c : 06 43 __ ASL T0 + 0 
0a4e : 2a __ __ ROL
0a4f : a8 __ __ TAY
0a50 : ad 45 28 LDA $2845 ; (uii_data[0] + 9)
0a53 : 65 43 __ ADC T0 + 0 
0a55 : 90 01 __ BCC $0a58 ; (main.s31 + 0)
.s30:
0a57 : c8 __ __ INY
.s31:
0a58 : 38 __ __ SEC
0a59 : e9 10 __ SBC #$10
0a5b : 85 5f __ STA T8 + 0 
0a5d : 98 __ __ TYA
0a5e : e9 02 __ SBC #$02
0a60 : 85 60 __ STA T8 + 1 
0a62 : ad 4a 28 LDA $284a ; (uii_data[0] + 14)
0a65 : 0a __ __ ASL
0a66 : 85 1b __ STA ACCU + 0 
0a68 : a9 00 __ LDA #$00
0a6a : 2a __ __ ROL
0a6b : 06 1b __ ASL ACCU + 0 
0a6d : 2a __ __ ROL
0a6e : aa __ __ TAX
0a6f : a5 1b __ LDA ACCU + 0 
0a71 : 6d 4a 28 ADC $284a ; (uii_data[0] + 14)
0a74 : 85 43 __ STA T0 + 0 
0a76 : 8a __ __ TXA
0a77 : 69 00 __ ADC #$00
0a79 : 06 43 __ ASL T0 + 0 
0a7b : 2a __ __ ROL
0a7c : a8 __ __ TAY
0a7d : ad 4b 28 LDA $284b ; (uii_data[0] + 15)
0a80 : 65 43 __ ADC T0 + 0 
0a82 : 90 01 __ BCC $0a85 ; (main.s33 + 0)
.s32:
0a84 : c8 __ __ INY
.s33:
0a85 : 38 __ __ SEC
0a86 : e9 10 __ SBC #$10
0a88 : 85 61 __ STA T9 + 0 
0a8a : 98 __ __ TYA
0a8b : e9 02 __ SBC #$02
0a8d : 85 62 __ STA T9 + 1 
0a8f : ad a2 27 LDA $27a2 ; (old_valid + 0)
0a92 : 0d a3 27 ORA $27a3 ; (old_valid + 1)
0a95 : f0 3b __ BEQ $0ad2 ; (main.s13 + 0)
.s14:
0a97 : a9 00 __ LDA #$00
.l15:
0a99 : 85 63 __ STA T10 + 0 
0a9b : a9 00 __ LDA #$00
0a9d : 85 64 __ STA T11 + 0 
0a9f : 18 __ __ CLC
.l19:
0aa0 : a5 63 __ LDA T10 + 0 
0aa2 : 65 64 __ ADC T11 + 0 
0aa4 : aa __ __ TAX
0aa5 : bd e0 27 LDA $27e0,x ; (old_hx[0][0] + 0)
0aa8 : 85 0d __ STA P0 
0aaa : 29 80 __ AND #$80
0aac : 10 02 __ BPL $0ab0 ; (main.l19 + 16)
0aae : a9 ff __ LDA #$ff
0ab0 : 85 0e __ STA P1 
0ab2 : bd 3c 2f LDA $2f3c,x ; (old_hy[0][0] + 0)
0ab5 : 85 0f __ STA P2 
0ab7 : 29 80 __ AND #$80
0ab9 : 10 02 __ BPL $0abd ; (main.l19 + 29)
0abb : a9 ff __ LDA #$ff
0abd : 85 10 __ STA P3 
0abf : 20 ef 1d JSR $1def ; (restore_bg.s4 + 0)
0ac2 : e6 64 __ INC T11 + 0 
0ac4 : a5 64 __ LDA T11 + 0 
0ac6 : c9 0a __ CMP #$0a
0ac8 : 90 d6 __ BCC $0aa0 ; (main.l19 + 0)
.s16:
0aca : a5 63 __ LDA T10 + 0 
0acc : 69 09 __ ADC #$09
0ace : c9 1e __ CMP #$1e
0ad0 : d0 c7 __ BNE $0a99 ; (main.l15 + 0)
.s13:
0ad2 : a9 00 __ LDA #$00
0ad4 : 85 04 __ STA WORK + 1 
0ad6 : 85 10 __ STA P3 
0ad8 : 85 12 __ STA P5 
0ada : 85 14 __ STA P7 
0adc : a9 5f __ LDA #$5f
0ade : 85 0f __ STA P2 
0ae0 : a9 2e __ LDA #$2e
0ae2 : 85 11 __ STA P4 
0ae4 : a9 02 __ LDA #$02
0ae6 : 85 13 __ STA P6 
0ae8 : 18 __ __ CLC
0ae9 : a5 57 __ LDA T4 + 0 
0aeb : 69 2d __ ADC #$2d
0aed : 85 1b __ STA ACCU + 0 
0aef : a5 58 __ LDA T4 + 1 
0af1 : 69 00 __ ADC #$00
0af3 : 85 1c __ STA ACCU + 1 
0af5 : a9 3c __ LDA #$3c
0af7 : 85 03 __ STA WORK + 0 
0af9 : 20 4e 24 JSR $244e ; (mods16 + 0)
0afc : a5 05 __ LDA WORK + 2 
0afe : 85 0d __ STA P0 
0b00 : a5 06 __ LDA WORK + 3 
0b02 : 85 0e __ STA P1 
0b04 : a9 e0 __ LDA #$e0
0b06 : 85 15 __ STA P8 
0b08 : a9 2f __ LDA #$2f
0b0a : 85 18 __ STA P11 
0b0c : a9 27 __ LDA #$27
0b0e : 85 16 __ STA P9 
0b10 : a9 3c __ LDA #$3c
0b12 : 85 17 __ STA P10 
0b14 : 20 fd 1e JSR $1efd ; (draw_hand.s1 + 0)
0b17 : a9 55 __ LDA #$55
0b19 : 85 0f __ STA P2 
0b1b : a9 23 __ LDA #$23
0b1d : 85 11 __ STA P4 
0b1f : a9 07 __ LDA #$07
0b21 : 85 13 __ STA P6 
0b23 : 18 __ __ CLC
0b24 : a5 61 __ LDA T9 + 0 
0b26 : 69 2d __ ADC #$2d
0b28 : 85 1b __ STA ACCU + 0 
0b2a : a5 62 __ LDA T9 + 1 
0b2c : 69 00 __ ADC #$00
0b2e : 85 1c __ STA ACCU + 1 
0b30 : a9 3c __ LDA #$3c
0b32 : 85 03 __ STA WORK + 0 
0b34 : a9 00 __ LDA #$00
0b36 : 85 04 __ STA WORK + 1 
0b38 : 20 4e 24 JSR $244e ; (mods16 + 0)
0b3b : a5 05 __ LDA WORK + 2 
0b3d : 85 0d __ STA P0 
0b3f : a5 06 __ LDA WORK + 3 
0b41 : 85 0e __ STA P1 
0b43 : a9 ea __ LDA #$ea
0b45 : 85 15 __ STA P8 
0b47 : a9 2f __ LDA #$2f
0b49 : 85 18 __ STA P11 
0b4b : a9 27 __ LDA #$27
0b4d : 85 16 __ STA P9 
0b4f : a9 46 __ LDA #$46
0b51 : 85 17 __ STA P10 
0b53 : 20 fd 1e JSR $1efd ; (draw_hand.s1 + 0)
0b56 : a5 5b __ LDA T6 + 0 
0b58 : 0a __ __ ASL
0b59 : 85 1b __ STA ACCU + 0 
0b5b : a9 e0 __ LDA #$e0
0b5d : 85 11 __ STA P4 
0b5f : a9 01 __ LDA #$01
0b61 : 85 13 __ STA P6 
0b63 : a5 5c __ LDA T6 + 1 
0b65 : 2a __ __ ROL
0b66 : 06 1b __ ASL ACCU + 0 
0b68 : 2a __ __ ROL
0b69 : a8 __ __ TAY
0b6a : 18 __ __ CLC
0b6b : a5 1b __ LDA ACCU + 0 
0b6d : 65 5b __ ADC T6 + 0 
0b6f : aa __ __ TAX
0b70 : 98 __ __ TYA
0b71 : 65 5c __ ADC T6 + 1 
0b73 : a8 __ __ TAY
0b74 : 8a __ __ TXA
0b75 : 18 __ __ CLC
0b76 : 69 2d __ ADC #$2d
0b78 : 85 43 __ STA T0 + 0 
0b7a : 90 01 __ BCC $0b7d ; (main.s35 + 0)
.s34:
0b7c : c8 __ __ INY
.s35:
0b7d : 84 44 __ STY T0 + 1 
0b7f : a5 61 __ LDA T9 + 0 
0b81 : 85 1b __ STA ACCU + 0 
0b83 : a5 62 __ LDA T9 + 1 
0b85 : 85 1c __ STA ACCU + 1 
0b87 : a9 0c __ LDA #$0c
0b89 : 85 03 __ STA WORK + 0 
0b8b : a9 00 __ LDA #$00
0b8d : 85 04 __ STA WORK + 1 
0b8f : 20 8f 23 JSR $238f ; (divs16 + 0)
0b92 : 18 __ __ CLC
0b93 : a5 1b __ LDA ACCU + 0 
0b95 : 65 43 __ ADC T0 + 0 
0b97 : 85 1b __ STA ACCU + 0 
0b99 : a5 1c __ LDA ACCU + 1 
0b9b : 65 44 __ ADC T0 + 1 
0b9d : 85 1c __ STA ACCU + 1 
0b9f : a9 3c __ LDA #$3c
0ba1 : 85 0f __ STA P2 
0ba3 : 85 03 __ STA WORK + 0 
0ba5 : a9 00 __ LDA #$00
0ba7 : 85 04 __ STA WORK + 1 
0ba9 : 20 4e 24 JSR $244e ; (mods16 + 0)
0bac : a5 05 __ LDA WORK + 2 
0bae : 85 0d __ STA P0 
0bb0 : a5 06 __ LDA WORK + 3 
0bb2 : 85 0e __ STA P1 
0bb4 : a9 f4 __ LDA #$f4
0bb6 : 85 15 __ STA P8 
0bb8 : a9 2f __ LDA #$2f
0bba : 85 18 __ STA P11 
0bbc : a9 27 __ LDA #$27
0bbe : 85 16 __ STA P9 
0bc0 : a9 50 __ LDA #$50
0bc2 : 85 17 __ STA P10 
0bc4 : 20 fd 1e JSR $1efd ; (draw_hand.s1 + 0)
0bc7 : a9 19 __ LDA #$19
0bc9 : 85 0d __ STA P0 
0bcb : a9 2a __ LDA #$2a
0bcd : 8d fc 05 STA $05fc 
0bd0 : a9 09 __ LDA #$09
0bd2 : 85 0e __ STA P1 
0bd4 : a9 07 __ LDA #$07
0bd6 : 8d fc d9 STA $d9fc 
0bd9 : a9 01 __ LDA #$01
0bdb : 8d a2 27 STA $27a2 ; (old_valid + 0)
0bde : a9 00 __ LDA #$00
0be0 : 8d a3 27 STA $27a3 ; (old_valid + 1)
0be3 : 20 e3 0c JSR $0ce3 ; (gotoxy.s4 + 0)
0be6 : a9 08 __ LDA #$08
0be8 : 8d 86 02 STA $0286 
0beb : a9 8b __ LDA #$8b
0bed : 8d f8 9f STA $9ff8 ; (sstack + 8)
0bf0 : a9 20 __ LDA #$20
0bf2 : 8d f9 9f STA $9ff9 ; (sstack + 9)
0bf5 : 20 ec 0c JSR $0cec ; (printf.s4 + 0)
0bf8 : a9 17 __ LDA #$17
0bfa : 85 0d __ STA P0 
0bfc : a9 10 __ LDA #$10
0bfe : 85 0e __ STA P1 
0c00 : 20 e3 0c JSR $0ce3 ; (gotoxy.s4 + 0)
0c03 : a5 5f __ LDA T8 + 0 
0c05 : 8d fa 9f STA $9ffa ; (sstack + 10)
0c08 : a5 60 __ LDA T8 + 1 
0c0a : 8d fb 9f STA $9ffb ; (sstack + 11)
0c0d : a5 5d __ LDA T7 + 0 
0c0f : 8d fc 9f STA $9ffc ; (sstack + 12)
0c12 : a5 5e __ LDA T7 + 1 
0c14 : 8d fd 9f STA $9ffd ; (sstack + 13)
0c17 : a5 53 __ LDA T2 + 0 
0c19 : 8d fe 9f STA $9ffe ; (sstack + 14)
0c1c : a5 54 __ LDA T2 + 1 
0c1e : 8d ff 9f STA $9fff ; (sstack + 15)
0c21 : a9 03 __ LDA #$03
0c23 : 8d 86 02 STA $0286 
0c26 : a9 93 __ LDA #$93
0c28 : 8d f8 9f STA $9ff8 ; (sstack + 8)
0c2b : a9 20 __ LDA #$20
0c2d : 8d f9 9f STA $9ff9 ; (sstack + 9)
0c30 : 20 ec 0c JSR $0cec ; (printf.s4 + 0)
0c33 : a9 18 __ LDA #$18
0c35 : 85 0d __ STA P0 
0c37 : a9 11 __ LDA #$11
0c39 : 85 0e __ STA P1 
0c3b : 20 e3 0c JSR $0ce3 ; (gotoxy.s4 + 0)
0c3e : a5 59 __ LDA T5 + 0 
0c40 : 8d fa 9f STA $9ffa ; (sstack + 10)
0c43 : a5 5a __ LDA T5 + 1 
0c45 : 8d fb 9f STA $9ffb ; (sstack + 11)
0c48 : a5 61 __ LDA T9 + 0 
0c4a : 8d fc 9f STA $9ffc ; (sstack + 12)
0c4d : a5 62 __ LDA T9 + 1 
0c4f : 8d fd 9f STA $9ffd ; (sstack + 13)
0c52 : a5 57 __ LDA T4 + 0 
0c54 : 8d fe 9f STA $9ffe ; (sstack + 14)
0c57 : a5 58 __ LDA T4 + 1 
0c59 : 8d ff 9f STA $9fff ; (sstack + 15)
0c5c : a9 01 __ LDA #$01
0c5e : 8d 86 02 STA $0286 
0c61 : a9 a2 __ LDA #$a2
0c63 : 8d f8 9f STA $9ff8 ; (sstack + 8)
0c66 : a9 20 __ LDA #$20
0c68 : 8d f9 9f STA $9ff9 ; (sstack + 9)
0c6b : 20 ec 0c JSR $0cec ; (printf.s4 + 0)
0c6e : 4c c9 08 JMP $08c9 ; (main.l5 + 0)
.s18:
0c71 : a5 57 __ LDA T4 + 0 
0c73 : 4c 30 09 JMP $0930 ; (main.s12 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/hdnsh/oscar/include/conio.h"
.s4:
0c76 : 85 0d __ STA P0 ; (c + 0)
0c78 : ad a0 26 LDA $26a0 ; (giocharmap + 0)
0c7b : f0 32 __ BEQ $0caf ; (putpch.s5 + 0)
.s6:
0c7d : a5 0d __ LDA P0 ; (c + 0)
0c7f : c9 0a __ CMP #$0a
0c81 : d0 04 __ BNE $0c87 ; (putpch.s7 + 0)
.s18:
0c83 : a9 0d __ LDA #$0d
0c85 : d0 32 __ BNE $0cb9 ; (putpch.s15 + 0)
.s7:
0c87 : c9 09 __ CMP #$09
0c89 : f0 36 __ BEQ $0cc1 ; (putpch.s16 + 0)
.s8:
0c8b : ad a0 26 LDA $26a0 ; (giocharmap + 0)
0c8e : c9 02 __ CMP #$02
0c90 : 90 1d __ BCC $0caf ; (putpch.s5 + 0)
.s9:
0c92 : a5 0d __ LDA P0 ; (c + 0)
0c94 : c9 41 __ CMP #$41
0c96 : 90 17 __ BCC $0caf ; (putpch.s5 + 0)
.s10:
0c98 : c9 7b __ CMP #$7b
0c9a : b0 13 __ BCS $0caf ; (putpch.s5 + 0)
.s11:
0c9c : c9 61 __ CMP #$61
0c9e : b0 04 __ BCS $0ca4 ; (putpch.s13 + 0)
.s12:
0ca0 : c9 5b __ CMP #$5b
0ca2 : b0 0b __ BCS $0caf ; (putpch.s5 + 0)
.s13:
0ca4 : 49 20 __ EOR #$20
0ca6 : 85 0d __ STA P0 ; (c + 0)
0ca8 : ad a0 26 LDA $26a0 ; (giocharmap + 0)
0cab : c9 02 __ CMP #$02
0cad : f0 06 __ BEQ $0cb5 ; (putpch.s14 + 0)
.s5:
0caf : a5 0d __ LDA P0 ; (c + 0)
0cb1 : 20 d2 ff JSR $ffd2 
.s3:
0cb4 : 60 __ __ RTS
.s14:
0cb5 : a5 0d __ LDA P0 ; (c + 0)
0cb7 : 29 5f __ AND #$5f
.s15:
0cb9 : 85 43 __ STA T0 + 0 
0cbb : a5 43 __ LDA T0 + 0 
0cbd : 20 d2 ff JSR $ffd2 
0cc0 : 60 __ __ RTS
.s16:
0cc1 : a5 d3 __ LDA $d3 
0cc3 : 29 03 __ AND #$03
0cc5 : 85 43 __ STA T0 + 0 
0cc7 : a9 20 __ LDA #$20
0cc9 : 85 44 __ STA T1 + 0 
.l17:
0ccb : a5 44 __ LDA T1 + 0 
0ccd : 20 d2 ff JSR $ffd2 
0cd0 : e6 43 __ INC T0 + 0 
0cd2 : a5 43 __ LDA T0 + 0 
0cd4 : c9 04 __ CMP #$04
0cd6 : 90 f3 __ BCC $0ccb ; (putpch.l17 + 0)
0cd8 : 60 __ __ RTS
--------------------------------------------------------------------
clrscr: ; clrscr()->void
;  91, "/home/honza/projects/c64/projects/hdnsh/oscar/include/conio.h"
.s4:
0cd9 : a9 93 __ LDA #$93
0cdb : 85 43 __ STA T0 + 0 
0cdd : a5 43 __ LDA T0 + 0 
0cdf : 20 d2 ff JSR $ffd2 
.s3:
0ce2 : 60 __ __ RTS
--------------------------------------------------------------------
gotoxy: ; gotoxy(u8,u8)->void
;  93, "/home/honza/projects/c64/projects/hdnsh/oscar/include/conio.h"
.s4:
0ce3 : a6 0e __ LDX P1 
0ce5 : a4 0d __ LDY P0 
0ce7 : 18 __ __ CLC
0ce8 : 20 f0 ff JSR $fff0 
.s3:
0ceb : 60 __ __ RTS
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.h"
.s4:
0cec : a9 01 __ LDA #$01
0cee : 8d f7 9f STA $9ff7 ; (sstack + 7)
0cf1 : a9 9c __ LDA #$9c
0cf3 : 8d f1 9f STA $9ff1 ; (sstack + 1)
0cf6 : a9 9f __ LDA #$9f
0cf8 : 8d f2 9f STA $9ff2 ; (sstack + 2)
0cfb : ad f8 9f LDA $9ff8 ; (sstack + 8)
0cfe : 8d f3 9f STA $9ff3 ; (sstack + 3)
0d01 : ad f9 9f LDA $9ff9 ; (sstack + 9)
0d04 : 8d f4 9f STA $9ff4 ; (sstack + 4)
0d07 : a9 fa __ LDA #$fa
0d09 : 8d f5 9f STA $9ff5 ; (sstack + 5)
0d0c : a9 9f __ LDA #$9f
0d0e : 8d f6 9f STA $9ff6 ; (sstack + 6)
0d11 : 4c 14 0d JMP $0d14 ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s1:
0d14 : a2 09 __ LDX #$09
0d16 : b5 53 __ LDA T1 + 0,x 
0d18 : 9d ce 9f STA $9fce,x ; (sformat@stack + 0)
0d1b : ca __ __ DEX
0d1c : 10 f8 __ BPL $0d16 ; (sformat.s1 + 2)
.s4:
0d1e : ad f3 9f LDA $9ff3 ; (sstack + 3)
0d21 : 85 55 __ STA T3 + 0 
0d23 : a9 00 __ LDA #$00
0d25 : 85 5b __ STA T6 + 0 
0d27 : ad f4 9f LDA $9ff4 ; (sstack + 4)
0d2a : 85 56 __ STA T3 + 1 
0d2c : ad f1 9f LDA $9ff1 ; (sstack + 1)
0d2f : 85 57 __ STA T4 + 0 
0d31 : ad f2 9f LDA $9ff2 ; (sstack + 2)
0d34 : 85 58 __ STA T4 + 1 
.l5:
0d36 : a0 00 __ LDY #$00
0d38 : b1 55 __ LDA (T3 + 0),y 
0d3a : d0 36 __ BNE $0d72 ; (sformat.s10 + 0)
.s6:
0d3c : a4 5b __ LDY T6 + 0 
0d3e : 91 57 __ STA (T4 + 0),y 
0d40 : 98 __ __ TYA
0d41 : f0 28 __ BEQ $0d6b ; (sformat.s95 + 0)
.s7:
0d43 : ad f7 9f LDA $9ff7 ; (sstack + 7)
0d46 : d0 18 __ BNE $0d60 ; (sformat.s9 + 0)
.s8:
0d48 : 98 __ __ TYA
0d49 : 18 __ __ CLC
0d4a : 65 57 __ ADC T4 + 0 
0d4c : aa __ __ TAX
0d4d : a5 58 __ LDA T4 + 1 
0d4f : 69 00 __ ADC #$00
.s3:
0d51 : 86 1b __ STX ACCU + 0 ; (buff + 1)
0d53 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0d55 : a2 09 __ LDX #$09
0d57 : bd ce 9f LDA $9fce,x ; (sformat@stack + 0)
0d5a : 95 53 __ STA T1 + 0,x 
0d5c : ca __ __ DEX
0d5d : 10 f8 __ BPL $0d57 ; (sformat.s3 + 6)
0d5f : 60 __ __ RTS
.s9:
0d60 : a5 57 __ LDA T4 + 0 
0d62 : 85 0e __ STA P1 
0d64 : a5 58 __ LDA T4 + 1 
0d66 : 85 0f __ STA P2 
0d68 : 20 55 11 JSR $1155 ; (puts.l4 + 0)
.s95:
0d6b : a5 58 __ LDA T4 + 1 
0d6d : a6 57 __ LDX T4 + 0 
0d6f : 4c 51 0d JMP $0d51 ; (sformat.s3 + 0)
.s10:
0d72 : c9 25 __ CMP #$25
0d74 : f0 3e __ BEQ $0db4 ; (sformat.s15 + 0)
.s11:
0d76 : a4 5b __ LDY T6 + 0 
0d78 : 91 57 __ STA (T4 + 0),y 
0d7a : e6 55 __ INC T3 + 0 
0d7c : d0 02 __ BNE $0d80 ; (sformat.s117 + 0)
.s116:
0d7e : e6 56 __ INC T3 + 1 
.s117:
0d80 : c8 __ __ INY
0d81 : 84 5b __ STY T6 + 0 
0d83 : 98 __ __ TYA
0d84 : c0 28 __ CPY #$28
0d86 : 90 ae __ BCC $0d36 ; (sformat.l5 + 0)
.s12:
0d88 : 85 43 __ STA T0 + 0 
0d8a : a9 00 __ LDA #$00
0d8c : 85 5b __ STA T6 + 0 
0d8e : ad f7 9f LDA $9ff7 ; (sstack + 7)
0d91 : f0 14 __ BEQ $0da7 ; (sformat.s13 + 0)
.s14:
0d93 : a5 57 __ LDA T4 + 0 
0d95 : 85 0e __ STA P1 
0d97 : a5 58 __ LDA T4 + 1 
0d99 : 85 0f __ STA P2 
0d9b : a9 00 __ LDA #$00
0d9d : a4 43 __ LDY T0 + 0 
0d9f : 91 0e __ STA (P1),y 
0da1 : 20 55 11 JSR $1155 ; (puts.l4 + 0)
0da4 : 4c 36 0d JMP $0d36 ; (sformat.l5 + 0)
.s13:
0da7 : 18 __ __ CLC
0da8 : a5 57 __ LDA T4 + 0 
0daa : 65 43 __ ADC T0 + 0 
0dac : 85 57 __ STA T4 + 0 
0dae : 90 86 __ BCC $0d36 ; (sformat.l5 + 0)
.s118:
0db0 : e6 58 __ INC T4 + 1 
0db2 : b0 82 __ BCS $0d36 ; (sformat.l5 + 0)
.s15:
0db4 : a5 5b __ LDA T6 + 0 
0db6 : f0 27 __ BEQ $0ddf ; (sformat.s16 + 0)
.s89:
0db8 : 84 5b __ STY T6 + 0 
0dba : 85 43 __ STA T0 + 0 
0dbc : ad f7 9f LDA $9ff7 ; (sstack + 7)
0dbf : f0 13 __ BEQ $0dd4 ; (sformat.s90 + 0)
.s91:
0dc1 : a5 57 __ LDA T4 + 0 
0dc3 : 85 0e __ STA P1 
0dc5 : a5 58 __ LDA T4 + 1 
0dc7 : 85 0f __ STA P2 
0dc9 : 98 __ __ TYA
0dca : a4 43 __ LDY T0 + 0 
0dcc : 91 0e __ STA (P1),y 
0dce : 20 55 11 JSR $1155 ; (puts.l4 + 0)
0dd1 : 4c df 0d JMP $0ddf ; (sformat.s16 + 0)
.s90:
0dd4 : 18 __ __ CLC
0dd5 : a5 57 __ LDA T4 + 0 
0dd7 : 65 43 __ ADC T0 + 0 
0dd9 : 85 57 __ STA T4 + 0 
0ddb : 90 02 __ BCC $0ddf ; (sformat.s16 + 0)
.s115:
0ddd : e6 58 __ INC T4 + 1 
.s16:
0ddf : a9 00 __ LDA #$00
0de1 : 8d dd 9f STA $9fdd ; (si.sign + 0)
0de4 : 8d de 9f STA $9fde ; (si.left + 0)
0de7 : 8d df 9f STA $9fdf ; (si.prefix + 0)
0dea : a0 01 __ LDY #$01
0dec : b1 55 __ LDA (T3 + 0),y 
0dee : a2 20 __ LDX #$20
0df0 : 8e d8 9f STX $9fd8 ; (si.fill + 0)
0df3 : a2 00 __ LDX #$00
0df5 : 8e d9 9f STX $9fd9 ; (si.width + 0)
0df8 : ca __ __ DEX
0df9 : 8e da 9f STX $9fda ; (si.precision + 0)
0dfc : a2 0a __ LDX #$0a
0dfe : 8e dc 9f STX $9fdc ; (si.base + 0)
0e01 : aa __ __ TAX
0e02 : a9 02 __ LDA #$02
0e04 : d0 07 __ BNE $0e0d ; (sformat.l17 + 0)
.s85:
0e06 : a0 00 __ LDY #$00
0e08 : b1 55 __ LDA (T3 + 0),y 
0e0a : aa __ __ TAX
0e0b : a9 01 __ LDA #$01
.l17:
0e0d : 18 __ __ CLC
0e0e : 65 55 __ ADC T3 + 0 
0e10 : 85 55 __ STA T3 + 0 
0e12 : 90 02 __ BCC $0e16 ; (sformat.s106 + 0)
.s105:
0e14 : e6 56 __ INC T3 + 1 
.s106:
0e16 : 8a __ __ TXA
0e17 : e0 2b __ CPX #$2b
0e19 : d0 07 __ BNE $0e22 ; (sformat.s18 + 0)
.s88:
0e1b : a9 01 __ LDA #$01
0e1d : 8d dd 9f STA $9fdd ; (si.sign + 0)
0e20 : d0 e4 __ BNE $0e06 ; (sformat.s85 + 0)
.s18:
0e22 : c9 30 __ CMP #$30
0e24 : d0 06 __ BNE $0e2c ; (sformat.s19 + 0)
.s87:
0e26 : 8d d8 9f STA $9fd8 ; (si.fill + 0)
0e29 : 4c 06 0e JMP $0e06 ; (sformat.s85 + 0)
.s19:
0e2c : c9 23 __ CMP #$23
0e2e : d0 07 __ BNE $0e37 ; (sformat.s20 + 0)
.s86:
0e30 : a9 01 __ LDA #$01
0e32 : 8d df 9f STA $9fdf ; (si.prefix + 0)
0e35 : d0 cf __ BNE $0e06 ; (sformat.s85 + 0)
.s20:
0e37 : c9 2d __ CMP #$2d
0e39 : d0 07 __ BNE $0e42 ; (sformat.s21 + 0)
.s84:
0e3b : a9 01 __ LDA #$01
0e3d : 8d de 9f STA $9fde ; (si.left + 0)
0e40 : d0 c4 __ BNE $0e06 ; (sformat.s85 + 0)
.s21:
0e42 : 85 47 __ STA T2 + 0 
0e44 : c9 30 __ CMP #$30
0e46 : 90 3c __ BCC $0e84 ; (sformat.s22 + 0)
.s80:
0e48 : c9 3a __ CMP #$3a
0e4a : b0 77 __ BCS $0ec3 ; (sformat.s23 + 0)
.s81:
0e4c : a9 00 __ LDA #$00
0e4e : 85 53 __ STA T1 + 0 
.l82:
0e50 : a5 53 __ LDA T1 + 0 
0e52 : 0a __ __ ASL
0e53 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0e55 : a9 00 __ LDA #$00
0e57 : 2a __ __ ROL
0e58 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0e5a : 2a __ __ ROL
0e5b : aa __ __ TAX
0e5c : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0e5e : 65 53 __ ADC T1 + 0 
0e60 : 0a __ __ ASL
0e61 : 18 __ __ CLC
0e62 : 65 47 __ ADC T2 + 0 
0e64 : 38 __ __ SEC
0e65 : e9 30 __ SBC #$30
0e67 : 85 53 __ STA T1 + 0 
0e69 : a0 00 __ LDY #$00
0e6b : b1 55 __ LDA (T3 + 0),y 
0e6d : 85 47 __ STA T2 + 0 
0e6f : e6 55 __ INC T3 + 0 
0e71 : d0 02 __ BNE $0e75 ; (sformat.s114 + 0)
.s113:
0e73 : e6 56 __ INC T3 + 1 
.s114:
0e75 : c9 30 __ CMP #$30
0e77 : 90 04 __ BCC $0e7d ; (sformat.s104 + 0)
.s83:
0e79 : c9 3a __ CMP #$3a
0e7b : 90 d3 __ BCC $0e50 ; (sformat.l82 + 0)
.s104:
0e7d : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0e7f : a6 53 __ LDX T1 + 0 
0e81 : 8e d9 9f STX $9fd9 ; (si.width + 0)
.s22:
0e84 : c9 2e __ CMP #$2e
0e86 : d0 3b __ BNE $0ec3 ; (sformat.s23 + 0)
.s76:
0e88 : a9 00 __ LDA #$00
0e8a : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
0e8c : 4c a6 0e JMP $0ea6 ; (sformat.l77 + 0)
.s79:
0e8f : a5 43 __ LDA T0 + 0 
0e91 : 0a __ __ ASL
0e92 : 85 1b __ STA ACCU + 0 ; (buff + 1)
0e94 : 98 __ __ TYA
0e95 : 2a __ __ ROL
0e96 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
0e98 : 2a __ __ ROL
0e99 : aa __ __ TAX
0e9a : 18 __ __ CLC
0e9b : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0e9d : 65 43 __ ADC T0 + 0 
0e9f : 0a __ __ ASL
0ea0 : 18 __ __ CLC
0ea1 : 65 47 __ ADC T2 + 0 
0ea3 : 38 __ __ SEC
0ea4 : e9 30 __ SBC #$30
.l77:
0ea6 : 85 43 __ STA T0 + 0 
0ea8 : a0 00 __ LDY #$00
0eaa : b1 55 __ LDA (T3 + 0),y 
0eac : 85 47 __ STA T2 + 0 
0eae : e6 55 __ INC T3 + 0 
0eb0 : d0 02 __ BNE $0eb4 ; (sformat.s108 + 0)
.s107:
0eb2 : e6 56 __ INC T3 + 1 
.s108:
0eb4 : c9 30 __ CMP #$30
0eb6 : 90 04 __ BCC $0ebc ; (sformat.s103 + 0)
.s78:
0eb8 : c9 3a __ CMP #$3a
0eba : 90 d3 __ BCC $0e8f ; (sformat.s79 + 0)
.s103:
0ebc : 86 1c __ STX ACCU + 1 ; (fmt + 0)
0ebe : a6 43 __ LDX T0 + 0 
0ec0 : 8e da 9f STX $9fda ; (si.precision + 0)
.s23:
0ec3 : c9 64 __ CMP #$64
0ec5 : f0 0c __ BEQ $0ed3 ; (sformat.s75 + 0)
.s24:
0ec7 : c9 44 __ CMP #$44
0ec9 : f0 08 __ BEQ $0ed3 ; (sformat.s75 + 0)
.s25:
0ecb : c9 69 __ CMP #$69
0ecd : f0 04 __ BEQ $0ed3 ; (sformat.s75 + 0)
.s26:
0ecf : c9 49 __ CMP #$49
0ed1 : d0 07 __ BNE $0eda ; (sformat.s27 + 0)
.s75:
0ed3 : a9 01 __ LDA #$01
.s93:
0ed5 : 85 13 __ STA P6 
0ed7 : 4c 1b 11 JMP $111b ; (sformat.s73 + 0)
.s27:
0eda : c9 75 __ CMP #$75
0edc : f0 04 __ BEQ $0ee2 ; (sformat.s74 + 0)
.s28:
0ede : c9 55 __ CMP #$55
0ee0 : d0 04 __ BNE $0ee6 ; (sformat.s29 + 0)
.s74:
0ee2 : a9 00 __ LDA #$00
0ee4 : f0 ef __ BEQ $0ed5 ; (sformat.s93 + 0)
.s29:
0ee6 : c9 78 __ CMP #$78
0ee8 : f0 04 __ BEQ $0eee ; (sformat.s72 + 0)
.s30:
0eea : c9 58 __ CMP #$58
0eec : d0 15 __ BNE $0f03 ; (sformat.s31 + 0)
.s72:
0eee : a5 47 __ LDA T2 + 0 
0ef0 : 29 e0 __ AND #$e0
0ef2 : 09 01 __ ORA #$01
0ef4 : 8d db 9f STA $9fdb ; (si.cha + 0)
0ef7 : a9 00 __ LDA #$00
0ef9 : 85 13 __ STA P6 
0efb : a9 10 __ LDA #$10
0efd : 8d dc 9f STA $9fdc ; (si.base + 0)
0f00 : 4c 1b 11 JMP $111b ; (sformat.s73 + 0)
.s31:
0f03 : c9 6c __ CMP #$6c
0f05 : d0 03 __ BNE $0f0a ; (sformat.s32 + 0)
0f07 : 4c 8c 10 JMP $108c ; (sformat.s60 + 0)
.s32:
0f0a : c9 4c __ CMP #$4c
0f0c : f0 f9 __ BEQ $0f07 ; (sformat.s31 + 4)
.s33:
0f0e : c9 66 __ CMP #$66
0f10 : f0 14 __ BEQ $0f26 ; (sformat.s59 + 0)
.s34:
0f12 : c9 67 __ CMP #$67
0f14 : f0 10 __ BEQ $0f26 ; (sformat.s59 + 0)
.s35:
0f16 : c9 65 __ CMP #$65
0f18 : f0 0c __ BEQ $0f26 ; (sformat.s59 + 0)
.s36:
0f1a : c9 46 __ CMP #$46
0f1c : f0 08 __ BEQ $0f26 ; (sformat.s59 + 0)
.s37:
0f1e : c9 47 __ CMP #$47
0f20 : f0 04 __ BEQ $0f26 ; (sformat.s59 + 0)
.s38:
0f22 : c9 45 __ CMP #$45
0f24 : d0 5c __ BNE $0f82 ; (sformat.s39 + 0)
.s59:
0f26 : a5 57 __ LDA T4 + 0 
0f28 : 85 13 __ STA P6 
0f2a : a5 58 __ LDA T4 + 1 
0f2c : 85 14 __ STA P7 
0f2e : a5 47 __ LDA T2 + 0 
0f30 : 29 e0 __ AND #$e0
0f32 : 09 01 __ ORA #$01
0f34 : 8d db 9f STA $9fdb ; (si.cha + 0)
0f37 : ad f5 9f LDA $9ff5 ; (sstack + 5)
0f3a : 85 59 __ STA T5 + 0 
0f3c : a9 d8 __ LDA #$d8
0f3e : 85 11 __ STA P4 
0f40 : a9 9f __ LDA #$9f
0f42 : 85 12 __ STA P5 
0f44 : ad f6 9f LDA $9ff6 ; (sstack + 6)
0f47 : 85 5a __ STA T5 + 1 
0f49 : a0 00 __ LDY #$00
0f4b : b1 59 __ LDA (T5 + 0),y 
0f4d : 85 15 __ STA P8 
0f4f : c8 __ __ INY
0f50 : b1 59 __ LDA (T5 + 0),y 
0f52 : 85 16 __ STA P9 
0f54 : c8 __ __ INY
0f55 : b1 59 __ LDA (T5 + 0),y 
0f57 : 85 17 __ STA P10 
0f59 : c8 __ __ INY
0f5a : b1 59 __ LDA (T5 + 0),y 
0f5c : 85 18 __ STA P11 
0f5e : a5 47 __ LDA T2 + 0 
0f60 : ed db 9f SBC $9fdb ; (si.cha + 0)
0f63 : 18 __ __ CLC
0f64 : 69 61 __ ADC #$61
0f66 : 8d f0 9f STA $9ff0 ; (sstack + 0)
0f69 : 20 cd 13 JSR $13cd ; (nformf.s1 + 0)
0f6c : a5 1b __ LDA ACCU + 0 ; (buff + 1)
0f6e : 85 5b __ STA T6 + 0 
0f70 : 18 __ __ CLC
0f71 : a5 59 __ LDA T5 + 0 
0f73 : 69 04 __ ADC #$04
0f75 : 8d f5 9f STA $9ff5 ; (sstack + 5)
0f78 : a5 5a __ LDA T5 + 1 
0f7a : 69 00 __ ADC #$00
0f7c : 8d f6 9f STA $9ff6 ; (sstack + 6)
0f7f : 4c 36 0d JMP $0d36 ; (sformat.l5 + 0)
.s39:
0f82 : c9 73 __ CMP #$73
0f84 : f0 3b __ BEQ $0fc1 ; (sformat.s47 + 0)
.s40:
0f86 : c9 53 __ CMP #$53
0f88 : f0 37 __ BEQ $0fc1 ; (sformat.s47 + 0)
.s41:
0f8a : c9 63 __ CMP #$63
0f8c : f0 12 __ BEQ $0fa0 ; (sformat.s46 + 0)
.s42:
0f8e : c9 43 __ CMP #$43
0f90 : f0 0e __ BEQ $0fa0 ; (sformat.s46 + 0)
.s43:
0f92 : aa __ __ TAX
0f93 : f0 ea __ BEQ $0f7f ; (sformat.s59 + 89)
.s44:
0f95 : a0 00 __ LDY #$00
0f97 : 91 57 __ STA (T4 + 0),y 
.s45:
0f99 : a9 01 __ LDA #$01
.s96:
0f9b : 85 5b __ STA T6 + 0 
0f9d : 4c 36 0d JMP $0d36 ; (sformat.l5 + 0)
.s46:
0fa0 : ad f5 9f LDA $9ff5 ; (sstack + 5)
0fa3 : 85 43 __ STA T0 + 0 
0fa5 : ad f6 9f LDA $9ff6 ; (sstack + 6)
0fa8 : 85 44 __ STA T0 + 1 
0faa : a0 00 __ LDY #$00
0fac : b1 43 __ LDA (T0 + 0),y 
0fae : 91 57 __ STA (T4 + 0),y 
0fb0 : a5 43 __ LDA T0 + 0 
0fb2 : 69 01 __ ADC #$01
0fb4 : 8d f5 9f STA $9ff5 ; (sstack + 5)
0fb7 : a5 44 __ LDA T0 + 1 
0fb9 : 69 00 __ ADC #$00
0fbb : 8d f6 9f STA $9ff6 ; (sstack + 6)
0fbe : 4c 99 0f JMP $0f99 ; (sformat.s45 + 0)
.s47:
0fc1 : ad f5 9f LDA $9ff5 ; (sstack + 5)
0fc4 : 85 43 __ STA T0 + 0 
0fc6 : 69 01 __ ADC #$01
0fc8 : 8d f5 9f STA $9ff5 ; (sstack + 5)
0fcb : ad f6 9f LDA $9ff6 ; (sstack + 6)
0fce : 85 44 __ STA T0 + 1 
0fd0 : 69 00 __ ADC #$00
0fd2 : 8d f6 9f STA $9ff6 ; (sstack + 6)
0fd5 : a0 00 __ LDY #$00
0fd7 : 84 5c __ STY T7 + 0 
0fd9 : b1 43 __ LDA (T0 + 0),y 
0fdb : 85 1b __ STA ACCU + 0 ; (buff + 1)
0fdd : 85 53 __ STA T1 + 0 
0fdf : c8 __ __ INY
0fe0 : b1 43 __ LDA (T0 + 0),y 
0fe2 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
0fe4 : 85 54 __ STA T1 + 1 
0fe6 : ad d9 9f LDA $9fd9 ; (si.width + 0)
0fe9 : f0 0c __ BEQ $0ff7 ; (sformat.s48 + 0)
.s100:
0feb : 88 __ __ DEY
0fec : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0fee : f0 05 __ BEQ $0ff5 ; (sformat.s101 + 0)
.l58:
0ff0 : c8 __ __ INY
0ff1 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
0ff3 : d0 fb __ BNE $0ff0 ; (sformat.l58 + 0)
.s101:
0ff5 : 84 5c __ STY T7 + 0 
.s48:
0ff7 : ad de 9f LDA $9fde ; (si.left + 0)
0ffa : 85 59 __ STA T5 + 0 
0ffc : d0 19 __ BNE $1017 ; (sformat.s49 + 0)
.s98:
0ffe : a6 5c __ LDX T7 + 0 
1000 : ec d9 9f CPX $9fd9 ; (si.width + 0)
1003 : a0 00 __ LDY #$00
1005 : b0 0c __ BCS $1013 ; (sformat.s99 + 0)
.l57:
1007 : ad d8 9f LDA $9fd8 ; (si.fill + 0)
100a : 91 57 __ STA (T4 + 0),y 
100c : c8 __ __ INY
100d : e8 __ __ INX
100e : ec d9 9f CPX $9fd9 ; (si.width + 0)
1011 : 90 f4 __ BCC $1007 ; (sformat.l57 + 0)
.s99:
1013 : 86 5c __ STX T7 + 0 
1015 : 84 5b __ STY T6 + 0 
.s49:
1017 : ac f7 9f LDY $9ff7 ; (sstack + 7)
101a : d0 48 __ BNE $1064 ; (sformat.s54 + 0)
.s50:
101c : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
101e : f0 23 __ BEQ $1043 ; (sformat.s51 + 0)
.s53:
1020 : 18 __ __ CLC
1021 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
1023 : 69 01 __ ADC #$01
1025 : 85 43 __ STA T0 + 0 
1027 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
1029 : 69 00 __ ADC #$00
102b : 85 44 __ STA T0 + 1 
102d : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
102f : a4 5b __ LDY T6 + 0 
1031 : 91 57 __ STA (T4 + 0),y 
1033 : e6 5b __ INC T6 + 0 
1035 : a0 00 __ LDY #$00
1037 : b1 43 __ LDA (T0 + 0),y 
1039 : a8 __ __ TAY
103a : e6 43 __ INC T0 + 0 
103c : d0 02 __ BNE $1040 ; (sformat.s112 + 0)
.s111:
103e : e6 44 __ INC T0 + 1 
.s112:
1040 : 98 __ __ TYA
1041 : d0 ec __ BNE $102f ; (sformat.l92 + 0)
.s51:
1043 : a5 59 __ LDA T5 + 0 
1045 : d0 03 __ BNE $104a ; (sformat.s97 + 0)
1047 : 4c 36 0d JMP $0d36 ; (sformat.l5 + 0)
.s97:
104a : a6 5c __ LDX T7 + 0 
104c : ec d9 9f CPX $9fd9 ; (si.width + 0)
104f : a4 5b __ LDY T6 + 0 
1051 : b0 0c __ BCS $105f ; (sformat.s102 + 0)
.l52:
1053 : ad d8 9f LDA $9fd8 ; (si.fill + 0)
1056 : 91 57 __ STA (T4 + 0),y 
1058 : c8 __ __ INY
1059 : e8 __ __ INX
105a : ec d9 9f CPX $9fd9 ; (si.width + 0)
105d : 90 f4 __ BCC $1053 ; (sformat.l52 + 0)
.s102:
105f : 84 5b __ STY T6 + 0 
1061 : 4c 36 0d JMP $0d36 ; (sformat.l5 + 0)
.s54:
1064 : a4 5b __ LDY T6 + 0 
1066 : f0 11 __ BEQ $1079 ; (sformat.s55 + 0)
.s56:
1068 : a5 57 __ LDA T4 + 0 
106a : 85 0e __ STA P1 
106c : a5 58 __ LDA T4 + 1 
106e : 85 0f __ STA P2 
1070 : a9 00 __ LDA #$00
1072 : 85 5b __ STA T6 + 0 
1074 : 91 0e __ STA (P1),y 
1076 : 20 55 11 JSR $1155 ; (puts.l4 + 0)
.s55:
1079 : a5 53 __ LDA T1 + 0 
107b : 85 0e __ STA P1 
107d : a5 54 __ LDA T1 + 1 
107f : 85 0f __ STA P2 
1081 : 20 55 11 JSR $1155 ; (puts.l4 + 0)
1084 : ad de 9f LDA $9fde ; (si.left + 0)
1087 : d0 c1 __ BNE $104a ; (sformat.s97 + 0)
1089 : 4c 36 0d JMP $0d36 ; (sformat.l5 + 0)
.s60:
108c : ad f5 9f LDA $9ff5 ; (sstack + 5)
108f : 85 43 __ STA T0 + 0 
1091 : 69 03 __ ADC #$03
1093 : 8d f5 9f STA $9ff5 ; (sstack + 5)
1096 : ad f6 9f LDA $9ff6 ; (sstack + 6)
1099 : 85 44 __ STA T0 + 1 
109b : 69 00 __ ADC #$00
109d : 8d f6 9f STA $9ff6 ; (sstack + 6)
10a0 : a0 00 __ LDY #$00
10a2 : b1 55 __ LDA (T3 + 0),y 
10a4 : aa __ __ TAX
10a5 : e6 55 __ INC T3 + 0 
10a7 : d0 02 __ BNE $10ab ; (sformat.s110 + 0)
.s109:
10a9 : e6 56 __ INC T3 + 1 
.s110:
10ab : b1 43 __ LDA (T0 + 0),y 
10ad : 85 1b __ STA ACCU + 0 ; (buff + 1)
10af : 85 11 __ STA P4 
10b1 : a0 01 __ LDY #$01
10b3 : b1 43 __ LDA (T0 + 0),y 
10b5 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
10b7 : 85 12 __ STA P5 
10b9 : c8 __ __ INY
10ba : b1 43 __ LDA (T0 + 0),y 
10bc : 85 1d __ STA ACCU + 2 ; (fmt + 1)
10be : 85 13 __ STA P6 
10c0 : c8 __ __ INY
10c1 : b1 43 __ LDA (T0 + 0),y 
10c3 : 85 14 __ STA P7 
10c5 : e0 64 __ CPX #$64
10c7 : f0 0c __ BEQ $10d5 ; (sformat.s71 + 0)
.s61:
10c9 : e0 44 __ CPX #$44
10cb : f0 08 __ BEQ $10d5 ; (sformat.s71 + 0)
.s62:
10cd : e0 69 __ CPX #$69
10cf : f0 04 __ BEQ $10d5 ; (sformat.s71 + 0)
.s63:
10d1 : e0 49 __ CPX #$49
10d3 : d0 1c __ BNE $10f1 ; (sformat.s64 + 0)
.s71:
10d5 : a9 01 __ LDA #$01
.s94:
10d7 : 85 15 __ STA P8 
.s69:
10d9 : a5 57 __ LDA T4 + 0 
10db : 85 0f __ STA P2 
10dd : a5 58 __ LDA T4 + 1 
10df : 85 10 __ STA P3 
10e1 : a9 d8 __ LDA #$d8
10e3 : 85 0d __ STA P0 
10e5 : a9 9f __ LDA #$9f
10e7 : 85 0e __ STA P1 
10e9 : 20 83 12 JSR $1283 ; (nforml.s4 + 0)
10ec : a5 1b __ LDA ACCU + 0 ; (buff + 1)
10ee : 4c 9b 0f JMP $0f9b ; (sformat.s96 + 0)
.s64:
10f1 : e0 75 __ CPX #$75
10f3 : f0 04 __ BEQ $10f9 ; (sformat.s70 + 0)
.s65:
10f5 : e0 55 __ CPX #$55
10f7 : d0 04 __ BNE $10fd ; (sformat.s66 + 0)
.s70:
10f9 : a9 00 __ LDA #$00
10fb : f0 da __ BEQ $10d7 ; (sformat.s94 + 0)
.s66:
10fd : e0 78 __ CPX #$78
10ff : f0 06 __ BEQ $1107 ; (sformat.s68 + 0)
.s67:
1101 : 85 1e __ STA ACCU + 3 ; (fps + 0)
1103 : e0 58 __ CPX #$58
1105 : d0 82 __ BNE $1089 ; (sformat.s55 + 16)
.s68:
1107 : a9 00 __ LDA #$00
1109 : 85 15 __ STA P8 
110b : a9 10 __ LDA #$10
110d : 8d dc 9f STA $9fdc ; (si.base + 0)
1110 : 8a __ __ TXA
1111 : 29 e0 __ AND #$e0
1113 : 09 01 __ ORA #$01
1115 : 8d db 9f STA $9fdb ; (si.cha + 0)
1118 : 4c d9 10 JMP $10d9 ; (sformat.s69 + 0)
.s73:
111b : a5 57 __ LDA T4 + 0 
111d : 85 0f __ STA P2 
111f : a5 58 __ LDA T4 + 1 
1121 : 85 10 __ STA P3 
1123 : ad f5 9f LDA $9ff5 ; (sstack + 5)
1126 : 85 43 __ STA T0 + 0 
1128 : ad f6 9f LDA $9ff6 ; (sstack + 6)
112b : 85 44 __ STA T0 + 1 
112d : a0 00 __ LDY #$00
112f : b1 43 __ LDA (T0 + 0),y 
1131 : 85 11 __ STA P4 
1133 : c8 __ __ INY
1134 : b1 43 __ LDA (T0 + 0),y 
1136 : 85 12 __ STA P5 
1138 : 18 __ __ CLC
1139 : a5 43 __ LDA T0 + 0 
113b : 69 02 __ ADC #$02
113d : 8d f5 9f STA $9ff5 ; (sstack + 5)
1140 : a5 44 __ LDA T0 + 1 
1142 : 69 00 __ ADC #$00
1144 : 8d f6 9f STA $9ff6 ; (sstack + 6)
1147 : a9 d8 __ LDA #$d8
1149 : 85 0d __ STA P0 
114b : a9 9f __ LDA #$9f
114d : 85 0e __ STA P1 
114f : 20 68 11 JSR $1168 ; (nformi.s4 + 0)
1152 : 4c 9b 0f JMP $0f9b ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.h"
.l4:
1155 : a0 00 __ LDY #$00
1157 : b1 0e __ LDA (P1),y ; (str + 0)
1159 : d0 01 __ BNE $115c ; (puts.s5 + 0)
.s3:
115b : 60 __ __ RTS
.s5:
115c : e6 0e __ INC P1 ; (str + 0)
115e : d0 02 __ BNE $1162 ; (puts.s7 + 0)
.s6:
1160 : e6 0f __ INC P2 ; (str + 1)
.s7:
1162 : 20 76 0c JSR $0c76 ; (putpch.s4 + 0)
1165 : 4c 55 11 JMP $1155 ; (puts.l4 + 0)
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s4:
1168 : a9 00 __ LDA #$00
116a : 85 43 __ STA T5 + 0 
116c : a0 04 __ LDY #$04
116e : b1 0d __ LDA (P0),y ; (si + 0)
1170 : 85 44 __ STA T6 + 0 
1172 : a5 13 __ LDA P6 ; (s + 0)
1174 : f0 13 __ BEQ $1189 ; (nformi.s5 + 0)
.s33:
1176 : 24 12 __ BIT P5 ; (v + 1)
1178 : 10 0f __ BPL $1189 ; (nformi.s5 + 0)
.s34:
117a : 38 __ __ SEC
117b : a9 00 __ LDA #$00
117d : e5 11 __ SBC P4 ; (v + 0)
117f : 85 11 __ STA P4 ; (v + 0)
1181 : a9 00 __ LDA #$00
1183 : e5 12 __ SBC P5 ; (v + 1)
1185 : 85 12 __ STA P5 ; (v + 1)
1187 : e6 43 __ INC T5 + 0 
.s5:
1189 : a9 10 __ LDA #$10
118b : 85 45 __ STA T7 + 0 
118d : a5 11 __ LDA P4 ; (v + 0)
118f : 05 12 __ ORA P5 ; (v + 1)
1191 : f0 33 __ BEQ $11c6 ; (nformi.s6 + 0)
.s28:
1193 : a5 11 __ LDA P4 ; (v + 0)
1195 : 85 1b __ STA ACCU + 0 
1197 : a5 12 __ LDA P5 ; (v + 1)
1199 : 85 1c __ STA ACCU + 1 
.l29:
119b : a5 44 __ LDA T6 + 0 
119d : 85 03 __ STA WORK + 0 
119f : a9 00 __ LDA #$00
11a1 : 85 04 __ STA WORK + 1 
11a3 : 20 c9 23 JSR $23c9 ; (divmod + 0)
11a6 : a5 05 __ LDA WORK + 2 
11a8 : c9 0a __ CMP #$0a
11aa : b0 04 __ BCS $11b0 ; (nformi.s32 + 0)
.s30:
11ac : a9 30 __ LDA #$30
11ae : 90 06 __ BCC $11b6 ; (nformi.s31 + 0)
.s32:
11b0 : a0 03 __ LDY #$03
11b2 : b1 0d __ LDA (P0),y ; (si + 0)
11b4 : e9 0a __ SBC #$0a
.s31:
11b6 : 18 __ __ CLC
11b7 : 65 05 __ ADC WORK + 2 
11b9 : a6 45 __ LDX T7 + 0 
11bb : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
11be : c6 45 __ DEC T7 + 0 
11c0 : a5 1b __ LDA ACCU + 0 
11c2 : 05 1c __ ORA ACCU + 1 
11c4 : d0 d5 __ BNE $119b ; (nformi.l29 + 0)
.s6:
11c6 : a0 02 __ LDY #$02
11c8 : b1 0d __ LDA (P0),y ; (si + 0)
11ca : c9 ff __ CMP #$ff
11cc : d0 04 __ BNE $11d2 ; (nformi.s27 + 0)
.s7:
11ce : a9 0f __ LDA #$0f
11d0 : d0 05 __ BNE $11d7 ; (nformi.s39 + 0)
.s27:
11d2 : 38 __ __ SEC
11d3 : a9 10 __ LDA #$10
11d5 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
11d7 : a8 __ __ TAY
11d8 : c4 45 __ CPY T7 + 0 
11da : b0 0d __ BCS $11e9 ; (nformi.s8 + 0)
.s26:
11dc : a9 30 __ LDA #$30
.l40:
11de : a6 45 __ LDX T7 + 0 
11e0 : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
11e3 : c6 45 __ DEC T7 + 0 
11e5 : c4 45 __ CPY T7 + 0 
11e7 : 90 f5 __ BCC $11de ; (nformi.l40 + 0)
.s8:
11e9 : a0 07 __ LDY #$07
11eb : b1 0d __ LDA (P0),y ; (si + 0)
11ed : f0 1c __ BEQ $120b ; (nformi.s9 + 0)
.s24:
11ef : a5 44 __ LDA T6 + 0 
11f1 : c9 10 __ CMP #$10
11f3 : d0 16 __ BNE $120b ; (nformi.s9 + 0)
.s25:
11f5 : a0 03 __ LDY #$03
11f7 : b1 0d __ LDA (P0),y ; (si + 0)
11f9 : a8 __ __ TAY
11fa : a9 30 __ LDA #$30
11fc : a6 45 __ LDX T7 + 0 
11fe : ca __ __ DEX
11ff : ca __ __ DEX
1200 : 86 45 __ STX T7 + 0 
1202 : 9d e0 9f STA $9fe0,x ; (buffer[0] + 0)
1205 : 98 __ __ TYA
1206 : 69 16 __ ADC #$16
1208 : 9d e1 9f STA $9fe1,x ; (buffer[0] + 1)
.s9:
120b : a9 00 __ LDA #$00
120d : 85 1b __ STA ACCU + 0 
120f : a5 43 __ LDA T5 + 0 
1211 : f0 0c __ BEQ $121f ; (nformi.s10 + 0)
.s23:
1213 : a9 2d __ LDA #$2d
.s22:
1215 : a6 45 __ LDX T7 + 0 
1217 : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
121a : c6 45 __ DEC T7 + 0 
121c : 4c 29 12 JMP $1229 ; (nformi.s11 + 0)
.s10:
121f : a0 05 __ LDY #$05
1221 : b1 0d __ LDA (P0),y ; (si + 0)
1223 : f0 04 __ BEQ $1229 ; (nformi.s11 + 0)
.s21:
1225 : a9 2b __ LDA #$2b
1227 : d0 ec __ BNE $1215 ; (nformi.s22 + 0)
.s11:
1229 : a6 45 __ LDX T7 + 0 
122b : a0 06 __ LDY #$06
122d : b1 0d __ LDA (P0),y ; (si + 0)
122f : d0 2b __ BNE $125c ; (nformi.s17 + 0)
.l12:
1231 : 8a __ __ TXA
1232 : 18 __ __ CLC
1233 : a0 01 __ LDY #$01
1235 : 71 0d __ ADC (P0),y ; (si + 0)
1237 : b0 04 __ BCS $123d ; (nformi.s15 + 0)
.s16:
1239 : c9 11 __ CMP #$11
123b : 90 0a __ BCC $1247 ; (nformi.s13 + 0)
.s15:
123d : a0 00 __ LDY #$00
123f : b1 0d __ LDA (P0),y ; (si + 0)
1241 : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
1244 : ca __ __ DEX
1245 : b0 ea __ BCS $1231 ; (nformi.l12 + 0)
.s13:
1247 : e0 10 __ CPX #$10
1249 : b0 0e __ BCS $1259 ; (nformi.s41 + 0)
.s14:
124b : 88 __ __ DEY
.l37:
124c : bd e0 9f LDA $9fe0,x ; (buffer[0] + 0)
124f : 91 0f __ STA (P2),y ; (str + 0)
1251 : c8 __ __ INY
1252 : e8 __ __ INX
1253 : e0 10 __ CPX #$10
1255 : 90 f5 __ BCC $124c ; (nformi.l37 + 0)
.s38:
1257 : 84 1b __ STY ACCU + 0 
.s41:
1259 : a5 1b __ LDA ACCU + 0 
.s3:
125b : 60 __ __ RTS
.s17:
125c : e0 10 __ CPX #$10
125e : b0 1a __ BCS $127a ; (nformi.l18 + 0)
.s20:
1260 : a0 00 __ LDY #$00
.l35:
1262 : bd e0 9f LDA $9fe0,x ; (buffer[0] + 0)
1265 : 91 0f __ STA (P2),y ; (str + 0)
1267 : c8 __ __ INY
1268 : e8 __ __ INX
1269 : e0 10 __ CPX #$10
126b : 90 f5 __ BCC $1262 ; (nformi.l35 + 0)
.s36:
126d : 84 1b __ STY ACCU + 0 
126f : b0 09 __ BCS $127a ; (nformi.l18 + 0)
.s19:
1271 : 88 __ __ DEY
1272 : b1 0d __ LDA (P0),y ; (si + 0)
1274 : a4 1b __ LDY ACCU + 0 
1276 : 91 0f __ STA (P2),y ; (str + 0)
1278 : e6 1b __ INC ACCU + 0 
.l18:
127a : a5 1b __ LDA ACCU + 0 
127c : a0 01 __ LDY #$01
127e : d1 0d __ CMP (P0),y ; (si + 0)
1280 : 90 ef __ BCC $1271 ; (nformi.s19 + 0)
1282 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s4:
1283 : a9 00 __ LDA #$00
1285 : 85 43 __ STA T4 + 0 
1287 : a5 15 __ LDA P8 ; (s + 0)
1289 : f0 1f __ BEQ $12aa ; (nforml.s5 + 0)
.s35:
128b : 24 14 __ BIT P7 ; (v + 3)
128d : 10 1b __ BPL $12aa ; (nforml.s5 + 0)
.s36:
128f : 38 __ __ SEC
1290 : a9 00 __ LDA #$00
1292 : e5 11 __ SBC P4 ; (v + 0)
1294 : 85 11 __ STA P4 ; (v + 0)
1296 : a9 00 __ LDA #$00
1298 : e5 12 __ SBC P5 ; (v + 1)
129a : 85 12 __ STA P5 ; (v + 1)
129c : a9 00 __ LDA #$00
129e : e5 13 __ SBC P6 ; (v + 2)
12a0 : 85 13 __ STA P6 ; (v + 2)
12a2 : a9 00 __ LDA #$00
12a4 : e5 14 __ SBC P7 ; (v + 3)
12a6 : 85 14 __ STA P7 ; (v + 3)
12a8 : e6 43 __ INC T4 + 0 
.s5:
12aa : a9 10 __ LDA #$10
12ac : 85 44 __ STA T5 + 0 
12ae : a5 14 __ LDA P7 ; (v + 3)
12b0 : f0 03 __ BEQ $12b5 ; (nforml.s31 + 0)
12b2 : 4c 7d 13 JMP $137d ; (nforml.l28 + 0)
.s31:
12b5 : a5 13 __ LDA P6 ; (v + 2)
12b7 : d0 f9 __ BNE $12b2 ; (nforml.s5 + 8)
.s32:
12b9 : a5 12 __ LDA P5 ; (v + 1)
12bb : d0 f5 __ BNE $12b2 ; (nforml.s5 + 8)
.s33:
12bd : c5 11 __ CMP P4 ; (v + 0)
12bf : 90 f1 __ BCC $12b2 ; (nforml.s5 + 8)
.s6:
12c1 : a0 02 __ LDY #$02
12c3 : b1 0d __ LDA (P0),y ; (si + 0)
12c5 : c9 ff __ CMP #$ff
12c7 : d0 04 __ BNE $12cd ; (nforml.s27 + 0)
.s7:
12c9 : a9 0f __ LDA #$0f
12cb : d0 05 __ BNE $12d2 ; (nforml.s41 + 0)
.s27:
12cd : 38 __ __ SEC
12ce : a9 10 __ LDA #$10
12d0 : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
12d2 : a8 __ __ TAY
12d3 : c4 44 __ CPY T5 + 0 
12d5 : b0 0d __ BCS $12e4 ; (nforml.s8 + 0)
.s26:
12d7 : a9 30 __ LDA #$30
.l42:
12d9 : a6 44 __ LDX T5 + 0 
12db : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
12de : c6 44 __ DEC T5 + 0 
12e0 : c4 44 __ CPY T5 + 0 
12e2 : 90 f5 __ BCC $12d9 ; (nforml.l42 + 0)
.s8:
12e4 : a0 07 __ LDY #$07
12e6 : b1 0d __ LDA (P0),y ; (si + 0)
12e8 : f0 1d __ BEQ $1307 ; (nforml.s9 + 0)
.s24:
12ea : a0 04 __ LDY #$04
12ec : b1 0d __ LDA (P0),y ; (si + 0)
12ee : c9 10 __ CMP #$10
12f0 : d0 15 __ BNE $1307 ; (nforml.s9 + 0)
.s25:
12f2 : 88 __ __ DEY
12f3 : b1 0d __ LDA (P0),y ; (si + 0)
12f5 : a8 __ __ TAY
12f6 : a9 30 __ LDA #$30
12f8 : a6 44 __ LDX T5 + 0 
12fa : ca __ __ DEX
12fb : ca __ __ DEX
12fc : 86 44 __ STX T5 + 0 
12fe : 9d e0 9f STA $9fe0,x ; (buffer[0] + 0)
1301 : 98 __ __ TYA
1302 : 69 16 __ ADC #$16
1304 : 9d e1 9f STA $9fe1,x ; (buffer[0] + 1)
.s9:
1307 : a9 00 __ LDA #$00
1309 : 85 1b __ STA ACCU + 0 
130b : a5 43 __ LDA T4 + 0 
130d : f0 0c __ BEQ $131b ; (nforml.s10 + 0)
.s23:
130f : a9 2d __ LDA #$2d
.s22:
1311 : a6 44 __ LDX T5 + 0 
1313 : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
1316 : c6 44 __ DEC T5 + 0 
1318 : 4c 25 13 JMP $1325 ; (nforml.s11 + 0)
.s10:
131b : a0 05 __ LDY #$05
131d : b1 0d __ LDA (P0),y ; (si + 0)
131f : f0 04 __ BEQ $1325 ; (nforml.s11 + 0)
.s21:
1321 : a9 2b __ LDA #$2b
1323 : d0 ec __ BNE $1311 ; (nforml.s22 + 0)
.s11:
1325 : a0 06 __ LDY #$06
1327 : a6 44 __ LDX T5 + 0 
1329 : b1 0d __ LDA (P0),y ; (si + 0)
132b : d0 29 __ BNE $1356 ; (nforml.s17 + 0)
.l12:
132d : 8a __ __ TXA
132e : 18 __ __ CLC
132f : a0 01 __ LDY #$01
1331 : 71 0d __ ADC (P0),y ; (si + 0)
1333 : b0 04 __ BCS $1339 ; (nforml.s15 + 0)
.s16:
1335 : c9 11 __ CMP #$11
1337 : 90 0a __ BCC $1343 ; (nforml.s13 + 0)
.s15:
1339 : a0 00 __ LDY #$00
133b : b1 0d __ LDA (P0),y ; (si + 0)
133d : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
1340 : ca __ __ DEX
1341 : b0 ea __ BCS $132d ; (nforml.l12 + 0)
.s13:
1343 : e0 10 __ CPX #$10
1345 : b0 0e __ BCS $1355 ; (nforml.s3 + 0)
.s14:
1347 : 88 __ __ DEY
.l39:
1348 : bd e0 9f LDA $9fe0,x ; (buffer[0] + 0)
134b : 91 0f __ STA (P2),y ; (str + 0)
134d : c8 __ __ INY
134e : e8 __ __ INX
134f : e0 10 __ CPX #$10
1351 : 90 f5 __ BCC $1348 ; (nforml.l39 + 0)
.s40:
1353 : 84 1b __ STY ACCU + 0 
.s3:
1355 : 60 __ __ RTS
.s17:
1356 : e0 10 __ CPX #$10
1358 : b0 1a __ BCS $1374 ; (nforml.l18 + 0)
.s20:
135a : a0 00 __ LDY #$00
.l37:
135c : bd e0 9f LDA $9fe0,x ; (buffer[0] + 0)
135f : 91 0f __ STA (P2),y ; (str + 0)
1361 : c8 __ __ INY
1362 : e8 __ __ INX
1363 : e0 10 __ CPX #$10
1365 : 90 f5 __ BCC $135c ; (nforml.l37 + 0)
.s38:
1367 : 84 1b __ STY ACCU + 0 
1369 : b0 09 __ BCS $1374 ; (nforml.l18 + 0)
.s19:
136b : 88 __ __ DEY
136c : b1 0d __ LDA (P0),y ; (si + 0)
136e : a4 1b __ LDY ACCU + 0 
1370 : 91 0f __ STA (P2),y ; (str + 0)
1372 : e6 1b __ INC ACCU + 0 
.l18:
1374 : a5 1b __ LDA ACCU + 0 
1376 : a0 01 __ LDY #$01
1378 : d1 0d __ CMP (P0),y ; (si + 0)
137a : 90 ef __ BCC $136b ; (nforml.s19 + 0)
137c : 60 __ __ RTS
.l28:
137d : a0 04 __ LDY #$04
137f : b1 0d __ LDA (P0),y ; (si + 0)
1381 : 85 03 __ STA WORK + 0 
1383 : a5 11 __ LDA P4 ; (v + 0)
1385 : 85 1b __ STA ACCU + 0 
1387 : a5 12 __ LDA P5 ; (v + 1)
1389 : 85 1c __ STA ACCU + 1 
138b : a5 13 __ LDA P6 ; (v + 2)
138d : 85 1d __ STA ACCU + 2 
138f : a5 14 __ LDA P7 ; (v + 3)
1391 : 85 1e __ STA ACCU + 3 
1393 : a9 00 __ LDA #$00
1395 : 85 04 __ STA WORK + 1 
1397 : 85 05 __ STA WORK + 2 
1399 : 85 06 __ STA WORK + 3 
139b : 20 c8 25 JSR $25c8 ; (divmod32 + 0)
139e : a5 07 __ LDA WORK + 4 
13a0 : c9 0a __ CMP #$0a
13a2 : b0 04 __ BCS $13a8 ; (nforml.s34 + 0)
.s29:
13a4 : a9 30 __ LDA #$30
13a6 : 90 06 __ BCC $13ae ; (nforml.s30 + 0)
.s34:
13a8 : a0 03 __ LDY #$03
13aa : b1 0d __ LDA (P0),y ; (si + 0)
13ac : e9 0a __ SBC #$0a
.s30:
13ae : 18 __ __ CLC
13af : 65 07 __ ADC WORK + 4 
13b1 : a6 44 __ LDX T5 + 0 
13b3 : 9d df 9f STA $9fdf,x ; (draw_hand@stack + 7)
13b6 : c6 44 __ DEC T5 + 0 
13b8 : a5 1b __ LDA ACCU + 0 
13ba : 85 11 __ STA P4 ; (v + 0)
13bc : a5 1c __ LDA ACCU + 1 
13be : 85 12 __ STA P5 ; (v + 1)
13c0 : a5 1d __ LDA ACCU + 2 
13c2 : 85 13 __ STA P6 ; (v + 2)
13c4 : a5 1e __ LDA ACCU + 3 
13c6 : 85 14 __ STA P7 ; (v + 3)
13c8 : d0 b3 __ BNE $137d ; (nforml.l28 + 0)
13ca : 4c b5 12 JMP $12b5 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/hdnsh/oscar/include/stdio.c"
.s1:
13cd : a2 03 __ LDX #$03
13cf : b5 53 __ LDA T7 + 0,x 
13d1 : 9d e7 9f STA $9fe7,x ; (nformf@stack + 0)
13d4 : ca __ __ DEX
13d5 : 10 f8 __ BPL $13cf ; (nformf.s1 + 2)
.s4:
13d7 : a5 16 __ LDA P9 ; (f + 1)
13d9 : 85 44 __ STA T0 + 1 
13db : a5 17 __ LDA P10 ; (f + 2)
13dd : 85 45 __ STA T0 + 2 
13df : a5 18 __ LDA P11 ; (f + 3)
13e1 : 29 7f __ AND #$7f
13e3 : 05 17 __ ORA P10 ; (f + 2)
13e5 : 05 16 __ ORA P9 ; (f + 1)
13e7 : 05 15 __ ORA P8 ; (f + 0)
13e9 : f0 21 __ BEQ $140c ; (nformf.s5 + 0)
.s107:
13eb : 24 18 __ BIT P11 ; (f + 3)
13ed : 10 1d __ BPL $140c ; (nformf.s5 + 0)
.s106:
13ef : a9 2d __ LDA #$2d
13f1 : a0 00 __ LDY #$00
13f3 : 91 13 __ STA (P6),y ; (str + 0)
13f5 : a5 18 __ LDA P11 ; (f + 3)
13f7 : 49 80 __ EOR #$80
13f9 : 85 10 __ STA P3 
13fb : 85 18 __ STA P11 ; (f + 3)
13fd : a5 15 __ LDA P8 ; (f + 0)
13ff : 85 0d __ STA P0 
1401 : a5 16 __ LDA P9 ; (f + 1)
1403 : 85 0e __ STA P1 
1405 : a5 17 __ LDA P10 ; (f + 2)
1407 : 85 0f __ STA P2 
1409 : 4c 20 19 JMP $1920 ; (nformf.s104 + 0)
.s5:
140c : a5 15 __ LDA P8 ; (f + 0)
140e : 85 0d __ STA P0 
1410 : a5 16 __ LDA P9 ; (f + 1)
1412 : 85 0e __ STA P1 
1414 : a5 17 __ LDA P10 ; (f + 2)
1416 : 85 0f __ STA P2 
1418 : a5 18 __ LDA P11 ; (f + 3)
141a : 85 10 __ STA P3 
141c : a0 05 __ LDY #$05
141e : b1 11 __ LDA (P4),y ; (si + 0)
1420 : f0 09 __ BEQ $142b ; (nformf.s6 + 0)
.s103:
1422 : a9 2b __ LDA #$2b
1424 : a0 00 __ LDY #$00
1426 : 91 13 __ STA (P6),y ; (str + 0)
1428 : 4c 20 19 JMP $1920 ; (nformf.s104 + 0)
.s6:
142b : 20 31 19 JSR $1931 ; (isinf.s4 + 0)
142e : a2 00 __ LDX #$00
1430 : 86 54 __ STX T9 + 0 
1432 : a8 __ __ TAY
1433 : f0 05 __ BEQ $143a ; (nformf.s7 + 0)
.s101:
1435 : a9 02 __ LDA #$02
1437 : 4c f0 18 JMP $18f0 ; (nformf.s102 + 0)
.s7:
143a : a5 11 __ LDA P4 ; (si + 0)
143c : 85 4b __ STA T2 + 0 
143e : a5 12 __ LDA P5 ; (si + 1)
1440 : 85 4c __ STA T2 + 1 
1442 : a0 02 __ LDY #$02
1444 : b1 11 __ LDA (P4),y ; (si + 0)
1446 : c9 ff __ CMP #$ff
1448 : d0 02 __ BNE $144c ; (nformf.s100 + 0)
.s8:
144a : a9 06 __ LDA #$06
.s100:
144c : 85 4d __ STA T3 + 0 
144e : 85 52 __ STA T6 + 0 
1450 : a9 00 __ LDA #$00
1452 : 85 4f __ STA T4 + 0 
1454 : 85 50 __ STA T4 + 1 
1456 : a5 18 __ LDA P11 ; (f + 3)
1458 : 85 46 __ STA T0 + 3 
145a : 29 7f __ AND #$7f
145c : 05 17 __ ORA P10 ; (f + 2)
145e : 05 16 __ ORA P9 ; (f + 1)
1460 : a6 15 __ LDX P8 ; (f + 0)
1462 : 86 43 __ STX T0 + 0 
1464 : 05 15 __ ORA P8 ; (f + 0)
1466 : d0 03 __ BNE $146b ; (nformf.s67 + 0)
1468 : 4c 9f 15 JMP $159f ; (nformf.s9 + 0)
.s67:
146b : a5 18 __ LDA P11 ; (f + 3)
146d : 10 03 __ BPL $1472 ; (nformf.s95 + 0)
146f : 4c f1 14 JMP $14f1 ; (nformf.l80 + 0)
.s95:
1472 : c9 44 __ CMP #$44
1474 : d0 0d __ BNE $1483 ; (nformf.l99 + 0)
.s96:
1476 : a5 17 __ LDA P10 ; (f + 2)
1478 : c9 7a __ CMP #$7a
147a : d0 07 __ BNE $1483 ; (nformf.l99 + 0)
.s97:
147c : a5 16 __ LDA P9 ; (f + 1)
147e : d0 03 __ BNE $1483 ; (nformf.l99 + 0)
.s98:
1480 : 8a __ __ TXA
1481 : f0 02 __ BEQ $1485 ; (nformf.l90 + 0)
.l99:
1483 : 90 54 __ BCC $14d9 ; (nformf.s68 + 0)
.l90:
1485 : 18 __ __ CLC
1486 : a5 4f __ LDA T4 + 0 
1488 : 69 03 __ ADC #$03
148a : 85 4f __ STA T4 + 0 
148c : 90 02 __ BCC $1490 ; (nformf.s121 + 0)
.s120:
148e : e6 50 __ INC T4 + 1 
.s121:
1490 : a5 43 __ LDA T0 + 0 
1492 : 85 1b __ STA ACCU + 0 
1494 : a5 44 __ LDA T0 + 1 
1496 : 85 1c __ STA ACCU + 1 
1498 : a5 45 __ LDA T0 + 2 
149a : 85 1d __ STA ACCU + 2 
149c : a5 46 __ LDA T0 + 3 
149e : 85 1e __ STA ACCU + 3 
14a0 : a9 00 __ LDA #$00
14a2 : 85 03 __ STA WORK + 0 
14a4 : 85 04 __ STA WORK + 1 
14a6 : a9 7a __ LDA #$7a
14a8 : 85 05 __ STA WORK + 2 
14aa : a9 44 __ LDA #$44
14ac : 85 06 __ STA WORK + 3 
14ae : 20 fb 20 JSR $20fb ; (freg + 20)
14b1 : 20 e1 22 JSR $22e1 ; (crt_fdiv + 0)
14b4 : a5 1b __ LDA ACCU + 0 
14b6 : 85 43 __ STA T0 + 0 
14b8 : a5 1c __ LDA ACCU + 1 
14ba : 85 44 __ STA T0 + 1 
14bc : a6 1d __ LDX ACCU + 2 
14be : 86 45 __ STX T0 + 2 
14c0 : a5 1e __ LDA ACCU + 3 
14c2 : 85 46 __ STA T0 + 3 
14c4 : 30 13 __ BMI $14d9 ; (nformf.s68 + 0)
.s91:
14c6 : c9 44 __ CMP #$44
14c8 : d0 b9 __ BNE $1483 ; (nformf.l99 + 0)
.s92:
14ca : e0 7a __ CPX #$7a
14cc : d0 b5 __ BNE $1483 ; (nformf.l99 + 0)
.s93:
14ce : a5 1c __ LDA ACCU + 1 
14d0 : 38 __ __ SEC
14d1 : d0 b0 __ BNE $1483 ; (nformf.l99 + 0)
.s94:
14d3 : a5 1b __ LDA ACCU + 0 
14d5 : f0 ae __ BEQ $1485 ; (nformf.l90 + 0)
14d7 : d0 aa __ BNE $1483 ; (nformf.l99 + 0)
.s68:
14d9 : a5 46 __ LDA T0 + 3 
14db : 30 14 __ BMI $14f1 ; (nformf.l80 + 0)
.s86:
14dd : c9 3f __ CMP #$3f
14df : d0 0e __ BNE $14ef ; (nformf.s85 + 0)
.s87:
14e1 : a5 45 __ LDA T0 + 2 
14e3 : c9 80 __ CMP #$80
14e5 : d0 08 __ BNE $14ef ; (nformf.s85 + 0)
.s88:
14e7 : a5 44 __ LDA T0 + 1 
14e9 : d0 04 __ BNE $14ef ; (nformf.s85 + 0)
.s89:
14eb : a5 43 __ LDA T0 + 0 
14ed : f0 49 __ BEQ $1538 ; (nformf.s69 + 0)
.s85:
14ef : b0 47 __ BCS $1538 ; (nformf.s69 + 0)
.l80:
14f1 : 38 __ __ SEC
14f2 : a5 4f __ LDA T4 + 0 
14f4 : e9 03 __ SBC #$03
14f6 : 85 4f __ STA T4 + 0 
14f8 : b0 02 __ BCS $14fc ; (nformf.s116 + 0)
.s115:
14fa : c6 50 __ DEC T4 + 1 
.s116:
14fc : a9 00 __ LDA #$00
14fe : 85 1b __ STA ACCU + 0 
1500 : 85 1c __ STA ACCU + 1 
1502 : a9 7a __ LDA #$7a
1504 : 85 1d __ STA ACCU + 2 
1506 : a9 44 __ LDA #$44
1508 : 85 1e __ STA ACCU + 3 
150a : a2 43 __ LDX #$43
150c : 20 eb 20 JSR $20eb ; (freg + 4)
150f : 20 19 22 JSR $2219 ; (crt_fmul + 0)
1512 : a5 1b __ LDA ACCU + 0 
1514 : 85 43 __ STA T0 + 0 
1516 : a5 1c __ LDA ACCU + 1 
1518 : 85 44 __ STA T0 + 1 
151a : a6 1d __ LDX ACCU + 2 
151c : 86 45 __ STX T0 + 2 
151e : a5 1e __ LDA ACCU + 3 
1520 : 85 46 __ STA T0 + 3 
1522 : 30 cd __ BMI $14f1 ; (nformf.l80 + 0)
.s81:
1524 : c9 3f __ CMP #$3f
1526 : 90 c9 __ BCC $14f1 ; (nformf.l80 + 0)
.s122:
1528 : d0 0e __ BNE $1538 ; (nformf.s69 + 0)
.s82:
152a : e0 80 __ CPX #$80
152c : 90 c3 __ BCC $14f1 ; (nformf.l80 + 0)
.s123:
152e : d0 08 __ BNE $1538 ; (nformf.s69 + 0)
.s83:
1530 : a5 1c __ LDA ACCU + 1 
1532 : d0 bb __ BNE $14ef ; (nformf.s85 + 0)
.s84:
1534 : a5 1b __ LDA ACCU + 0 
1536 : d0 b7 __ BNE $14ef ; (nformf.s85 + 0)
.s69:
1538 : a5 46 __ LDA T0 + 3 
153a : 30 63 __ BMI $159f ; (nformf.s9 + 0)
.s75:
153c : c9 41 __ CMP #$41
153e : d0 0e __ BNE $154e ; (nformf.l79 + 0)
.s76:
1540 : a5 45 __ LDA T0 + 2 
1542 : c9 20 __ CMP #$20
1544 : d0 08 __ BNE $154e ; (nformf.l79 + 0)
.s77:
1546 : a5 44 __ LDA T0 + 1 
1548 : d0 04 __ BNE $154e ; (nformf.l79 + 0)
.s78:
154a : a5 43 __ LDA T0 + 0 
154c : f0 02 __ BEQ $1550 ; (nformf.l70 + 0)
.l79:
154e : 90 4f __ BCC $159f ; (nformf.s9 + 0)
.l70:
1550 : e6 4f __ INC T4 + 0 
1552 : d0 02 __ BNE $1556 ; (nformf.s119 + 0)
.s118:
1554 : e6 50 __ INC T4 + 1 
.s119:
1556 : a5 43 __ LDA T0 + 0 
1558 : 85 1b __ STA ACCU + 0 
155a : a5 44 __ LDA T0 + 1 
155c : 85 1c __ STA ACCU + 1 
155e : a5 45 __ LDA T0 + 2 
1560 : 85 1d __ STA ACCU + 2 
1562 : a5 46 __ LDA T0 + 3 
1564 : 85 1e __ STA ACCU + 3 
1566 : a9 00 __ LDA #$00
1568 : 85 03 __ STA WORK + 0 
156a : 85 04 __ STA WORK + 1 
156c : a9 20 __ LDA #$20
156e : 85 05 __ STA WORK + 2 
1570 : a9 41 __ LDA #$41
1572 : 85 06 __ STA WORK + 3 
1574 : 20 fb 20 JSR $20fb ; (freg + 20)
1577 : 20 e1 22 JSR $22e1 ; (crt_fdiv + 0)
157a : a5 1b __ LDA ACCU + 0 
157c : 85 43 __ STA T0 + 0 
157e : a5 1c __ LDA ACCU + 1 
1580 : 85 44 __ STA T0 + 1 
1582 : a6 1d __ LDX ACCU + 2 
1584 : 86 45 __ STX T0 + 2 
1586 : a5 1e __ LDA ACCU + 3 
1588 : 85 46 __ STA T0 + 3 
158a : 30 13 __ BMI $159f ; (nformf.s9 + 0)
.s71:
158c : c9 41 __ CMP #$41
158e : d0 be __ BNE $154e ; (nformf.l79 + 0)
.s72:
1590 : e0 20 __ CPX #$20
1592 : d0 ba __ BNE $154e ; (nformf.l79 + 0)
.s73:
1594 : a5 1c __ LDA ACCU + 1 
1596 : 38 __ __ SEC
1597 : d0 b5 __ BNE $154e ; (nformf.l79 + 0)
.s74:
1599 : a5 1b __ LDA ACCU + 0 
159b : f0 b3 __ BEQ $1550 ; (nformf.l70 + 0)
159d : d0 af __ BNE $154e ; (nformf.l79 + 0)
.s9:
159f : ad f0 9f LDA $9ff0 ; (sstack + 0)
15a2 : c9 65 __ CMP #$65
15a4 : d0 04 __ BNE $15aa ; (nformf.s11 + 0)
.s10:
15a6 : a9 01 __ LDA #$01
15a8 : d0 02 __ BNE $15ac ; (nformf.s12 + 0)
.s11:
15aa : a9 00 __ LDA #$00
.s12:
15ac : 85 55 __ STA T10 + 0 
15ae : a6 4d __ LDX T3 + 0 
15b0 : e8 __ __ INX
15b1 : 86 51 __ STX T5 + 0 
15b3 : ad f0 9f LDA $9ff0 ; (sstack + 0)
15b6 : c9 67 __ CMP #$67
15b8 : d0 13 __ BNE $15cd ; (nformf.s13 + 0)
.s63:
15ba : a5 50 __ LDA T4 + 1 
15bc : 30 08 __ BMI $15c6 ; (nformf.s64 + 0)
.s66:
15be : d0 06 __ BNE $15c6 ; (nformf.s64 + 0)
.s65:
15c0 : a5 4f __ LDA T4 + 0 
15c2 : c9 04 __ CMP #$04
15c4 : 90 07 __ BCC $15cd ; (nformf.s13 + 0)
.s64:
15c6 : a9 01 __ LDA #$01
15c8 : 85 55 __ STA T10 + 0 
15ca : 4c 56 18 JMP $1856 ; (nformf.s53 + 0)
.s13:
15cd : a5 55 __ LDA T10 + 0 
15cf : d0 f9 __ BNE $15ca ; (nformf.s64 + 4)
.s14:
15d1 : 24 50 __ BIT T4 + 1 
15d3 : 10 43 __ BPL $1618 ; (nformf.s15 + 0)
.s52:
15d5 : a5 43 __ LDA T0 + 0 
15d7 : 85 1b __ STA ACCU + 0 
15d9 : a5 44 __ LDA T0 + 1 
15db : 85 1c __ STA ACCU + 1 
15dd : a5 45 __ LDA T0 + 2 
15df : 85 1d __ STA ACCU + 2 
15e1 : a5 46 __ LDA T0 + 3 
15e3 : 85 1e __ STA ACCU + 3 
.l108:
15e5 : a9 00 __ LDA #$00
15e7 : 85 03 __ STA WORK + 0 
15e9 : 85 04 __ STA WORK + 1 
15eb : a9 20 __ LDA #$20
15ed : 85 05 __ STA WORK + 2 
15ef : a9 41 __ LDA #$41
15f1 : 85 06 __ STA WORK + 3 
15f3 : 20 fb 20 JSR $20fb ; (freg + 20)
15f6 : 20 e1 22 JSR $22e1 ; (crt_fdiv + 0)
15f9 : 18 __ __ CLC
15fa : a5 4f __ LDA T4 + 0 
15fc : 69 01 __ ADC #$01
15fe : 85 4f __ STA T4 + 0 
1600 : a5 50 __ LDA T4 + 1 
1602 : 69 00 __ ADC #$00
1604 : 85 50 __ STA T4 + 1 
1606 : 30 dd __ BMI $15e5 ; (nformf.l108 + 0)
.s109:
1608 : a5 1e __ LDA ACCU + 3 
160a : 85 46 __ STA T0 + 3 
160c : a5 1d __ LDA ACCU + 2 
160e : 85 45 __ STA T0 + 2 
1610 : a5 1c __ LDA ACCU + 1 
1612 : 85 44 __ STA T0 + 1 
1614 : a5 1b __ LDA ACCU + 0 
1616 : 85 43 __ STA T0 + 0 
.s15:
1618 : 18 __ __ CLC
1619 : a5 4d __ LDA T3 + 0 
161b : 65 4f __ ADC T4 + 0 
161d : 18 __ __ CLC
161e : 69 01 __ ADC #$01
1620 : 85 51 __ STA T5 + 0 
1622 : c9 07 __ CMP #$07
1624 : 90 14 __ BCC $163a ; (nformf.s51 + 0)
.s16:
1626 : ad b9 26 LDA $26b9 ; (fround5[0] + 24)
1629 : 85 47 __ STA T1 + 0 
162b : ad ba 26 LDA $26ba ; (fround5[0] + 25)
162e : 85 48 __ STA T1 + 1 
1630 : ad bb 26 LDA $26bb ; (fround5[0] + 26)
1633 : 85 49 __ STA T1 + 2 
1635 : ad bc 26 LDA $26bc ; (fround5[0] + 27)
1638 : b0 15 __ BCS $164f ; (nformf.s17 + 0)
.s51:
163a : 0a __ __ ASL
163b : 0a __ __ ASL
163c : aa __ __ TAX
163d : bd 9d 26 LDA $269d,x ; (divmod32 + 213)
1640 : 85 47 __ STA T1 + 0 
1642 : bd 9e 26 LDA $269e,x ; (divmod32 + 214)
1645 : 85 48 __ STA T1 + 1 
1647 : bd 9f 26 LDA $269f,x ; (spentry + 0)
164a : 85 49 __ STA T1 + 2 
164c : bd a0 26 LDA $26a0,x ; (giocharmap + 0)
.s17:
164f : 85 4a __ STA T1 + 3 
1651 : a5 43 __ LDA T0 + 0 
1653 : 85 1b __ STA ACCU + 0 
1655 : a5 44 __ LDA T0 + 1 
1657 : 85 1c __ STA ACCU + 1 
1659 : a5 45 __ LDA T0 + 2 
165b : 85 1d __ STA ACCU + 2 
165d : a5 46 __ LDA T0 + 3 
165f : 85 1e __ STA ACCU + 3 
1661 : a2 47 __ LDX #$47
1663 : 20 eb 20 JSR $20eb ; (freg + 4)
1666 : 20 32 21 JSR $2132 ; (faddsub + 6)
1669 : a5 1c __ LDA ACCU + 1 
166b : 85 16 __ STA P9 ; (f + 1)
166d : a5 1d __ LDA ACCU + 2 
166f : 85 17 __ STA P10 ; (f + 2)
1671 : a6 1b __ LDX ACCU + 0 
1673 : a5 1e __ LDA ACCU + 3 
1675 : 85 18 __ STA P11 ; (f + 3)
1677 : 30 3a __ BMI $16b3 ; (nformf.s18 + 0)
.s46:
1679 : c9 41 __ CMP #$41
167b : d0 0d __ BNE $168a ; (nformf.s50 + 0)
.s47:
167d : a5 17 __ LDA P10 ; (f + 2)
167f : c9 20 __ CMP #$20
1681 : d0 07 __ BNE $168a ; (nformf.s50 + 0)
.s48:
1683 : a5 16 __ LDA P9 ; (f + 1)
1685 : d0 03 __ BNE $168a ; (nformf.s50 + 0)
.s49:
1687 : 8a __ __ TXA
1688 : f0 02 __ BEQ $168c ; (nformf.s45 + 0)
.s50:
168a : 90 27 __ BCC $16b3 ; (nformf.s18 + 0)
.s45:
168c : a9 00 __ LDA #$00
168e : 85 03 __ STA WORK + 0 
1690 : 85 04 __ STA WORK + 1 
1692 : a9 20 __ LDA #$20
1694 : 85 05 __ STA WORK + 2 
1696 : a9 41 __ LDA #$41
1698 : 85 06 __ STA WORK + 3 
169a : 20 fb 20 JSR $20fb ; (freg + 20)
169d : 20 e1 22 JSR $22e1 ; (crt_fdiv + 0)
16a0 : a5 1c __ LDA ACCU + 1 
16a2 : 85 16 __ STA P9 ; (f + 1)
16a4 : a5 1d __ LDA ACCU + 2 
16a6 : 85 17 __ STA P10 ; (f + 2)
16a8 : a5 1e __ LDA ACCU + 3 
16aa : 85 18 __ STA P11 ; (f + 3)
16ac : a6 4d __ LDX T3 + 0 
16ae : ca __ __ DEX
16af : 86 52 __ STX T6 + 0 
16b1 : a6 1b __ LDX ACCU + 0 
.s18:
16b3 : 38 __ __ SEC
16b4 : a5 51 __ LDA T5 + 0 
16b6 : e5 52 __ SBC T6 + 0 
16b8 : 85 4d __ STA T3 + 0 
16ba : a9 00 __ LDA #$00
16bc : e9 00 __ SBC #$00
16be : 85 4e __ STA T3 + 1 
16c0 : a9 14 __ LDA #$14
16c2 : c5 51 __ CMP T5 + 0 
16c4 : b0 02 __ BCS $16c8 ; (nformf.s19 + 0)
.s44:
16c6 : 85 51 __ STA T5 + 0 
.s19:
16c8 : a5 4d __ LDA T3 + 0 
16ca : d0 08 __ BNE $16d4 ; (nformf.s21 + 0)
.s20:
16cc : a9 30 __ LDA #$30
16ce : a4 54 __ LDY T9 + 0 
16d0 : 91 13 __ STA (P6),y ; (str + 0)
16d2 : e6 54 __ INC T9 + 0 
.s21:
16d4 : a9 00 __ LDA #$00
16d6 : 85 56 __ STA T11 + 0 
16d8 : c5 4d __ CMP T3 + 0 
16da : f0 6f __ BEQ $174b ; (nformf.l43 + 0)
.s23:
16dc : c9 07 __ CMP #$07
16de : 90 04 __ BCC $16e4 ; (nformf.s24 + 0)
.l42:
16e0 : a9 30 __ LDA #$30
16e2 : b0 55 __ BCS $1739 ; (nformf.l25 + 0)
.s24:
16e4 : 86 1b __ STX ACCU + 0 
16e6 : 86 43 __ STX T0 + 0 
16e8 : a5 16 __ LDA P9 ; (f + 1)
16ea : 85 1c __ STA ACCU + 1 
16ec : 85 44 __ STA T0 + 1 
16ee : a5 17 __ LDA P10 ; (f + 2)
16f0 : 85 1d __ STA ACCU + 2 
16f2 : 85 45 __ STA T0 + 2 
16f4 : a5 18 __ LDA P11 ; (f + 3)
16f6 : 85 1e __ STA ACCU + 3 
16f8 : 85 46 __ STA T0 + 3 
16fa : 20 7b 24 JSR $247b ; (f32_to_i16 + 0)
16fd : a5 1b __ LDA ACCU + 0 
16ff : 85 53 __ STA T7 + 0 
1701 : 20 c7 24 JSR $24c7 ; (sint16_to_float + 0)
1704 : a2 43 __ LDX #$43
1706 : 20 eb 20 JSR $20eb ; (freg + 4)
1709 : a5 1e __ LDA ACCU + 3 
170b : 49 80 __ EOR #$80
170d : 85 1e __ STA ACCU + 3 
170f : 20 32 21 JSR $2132 ; (faddsub + 6)
1712 : a9 00 __ LDA #$00
1714 : 85 03 __ STA WORK + 0 
1716 : 85 04 __ STA WORK + 1 
1718 : a9 20 __ LDA #$20
171a : 85 05 __ STA WORK + 2 
171c : a9 41 __ LDA #$41
171e : 85 06 __ STA WORK + 3 
1720 : 20 fb 20 JSR $20fb ; (freg + 20)
1723 : 20 19 22 JSR $2219 ; (crt_fmul + 0)
1726 : a5 1c __ LDA ACCU + 1 
1728 : 85 16 __ STA P9 ; (f + 1)
172a : a5 1d __ LDA ACCU + 2 
172c : 85 17 __ STA P10 ; (f + 2)
172e : a5 1e __ LDA ACCU + 3 
1730 : 85 18 __ STA P11 ; (f + 3)
1732 : 18 __ __ CLC
1733 : a5 53 __ LDA T7 + 0 
1735 : 69 30 __ ADC #$30
1737 : a6 1b __ LDX ACCU + 0 
.l25:
1739 : a4 54 __ LDY T9 + 0 
173b : 91 13 __ STA (P6),y ; (str + 0)
173d : e6 54 __ INC T9 + 0 
173f : e6 56 __ INC T11 + 0 
1741 : a5 56 __ LDA T11 + 0 
1743 : c5 51 __ CMP T5 + 0 
1745 : b0 14 __ BCS $175b ; (nformf.s26 + 0)
.s22:
1747 : c5 4d __ CMP T3 + 0 
1749 : d0 91 __ BNE $16dc ; (nformf.s23 + 0)
.l43:
174b : a9 2e __ LDA #$2e
174d : a4 54 __ LDY T9 + 0 
174f : 91 13 __ STA (P6),y ; (str + 0)
1751 : e6 54 __ INC T9 + 0 
1753 : a5 56 __ LDA T11 + 0 
1755 : c9 07 __ CMP #$07
1757 : 90 8b __ BCC $16e4 ; (nformf.s24 + 0)
1759 : b0 85 __ BCS $16e0 ; (nformf.l42 + 0)
.s26:
175b : a5 55 __ LDA T10 + 0 
175d : f0 66 __ BEQ $17c5 ; (nformf.s27 + 0)
.s38:
175f : a0 03 __ LDY #$03
1761 : b1 4b __ LDA (T2 + 0),y 
1763 : 69 03 __ ADC #$03
1765 : a4 54 __ LDY T9 + 0 
1767 : 91 13 __ STA (P6),y ; (str + 0)
1769 : c8 __ __ INY
176a : 84 54 __ STY T9 + 0 
176c : 24 50 __ BIT T4 + 1 
176e : 30 06 __ BMI $1776 ; (nformf.s41 + 0)
.s39:
1770 : a9 2b __ LDA #$2b
1772 : 91 13 __ STA (P6),y ; (str + 0)
1774 : d0 11 __ BNE $1787 ; (nformf.s40 + 0)
.s41:
1776 : a9 2d __ LDA #$2d
1778 : 91 13 __ STA (P6),y ; (str + 0)
177a : 38 __ __ SEC
177b : a9 00 __ LDA #$00
177d : e5 4f __ SBC T4 + 0 
177f : 85 4f __ STA T4 + 0 
1781 : a9 00 __ LDA #$00
1783 : e5 50 __ SBC T4 + 1 
1785 : 85 50 __ STA T4 + 1 
.s40:
1787 : e6 54 __ INC T9 + 0 
1789 : a5 4f __ LDA T4 + 0 
178b : 85 1b __ STA ACCU + 0 
178d : a5 50 __ LDA T4 + 1 
178f : 85 1c __ STA ACCU + 1 
1791 : a9 0a __ LDA #$0a
1793 : 85 03 __ STA WORK + 0 
1795 : a9 00 __ LDA #$00
1797 : 85 04 __ STA WORK + 1 
1799 : 20 8f 23 JSR $238f ; (divs16 + 0)
179c : 18 __ __ CLC
179d : a5 1b __ LDA ACCU + 0 
179f : 69 30 __ ADC #$30
17a1 : a4 54 __ LDY T9 + 0 
17a3 : 91 13 __ STA (P6),y ; (str + 0)
17a5 : e6 54 __ INC T9 + 0 
17a7 : a5 4f __ LDA T4 + 0 
17a9 : 85 1b __ STA ACCU + 0 
17ab : a5 50 __ LDA T4 + 1 
17ad : 85 1c __ STA ACCU + 1 
17af : a9 0a __ LDA #$0a
17b1 : 85 03 __ STA WORK + 0 
17b3 : a9 00 __ LDA #$00
17b5 : 85 04 __ STA WORK + 1 
17b7 : 20 4e 24 JSR $244e ; (mods16 + 0)
17ba : 18 __ __ CLC
17bb : a5 05 __ LDA WORK + 2 
17bd : 69 30 __ ADC #$30
17bf : a4 54 __ LDY T9 + 0 
17c1 : 91 13 __ STA (P6),y ; (str + 0)
17c3 : e6 54 __ INC T9 + 0 
.s27:
17c5 : a5 54 __ LDA T9 + 0 
17c7 : a0 01 __ LDY #$01
17c9 : d1 11 __ CMP (P4),y ; (si + 0)
17cb : b0 6d __ BCS $183a ; (nformf.s3 + 0)
.s28:
17cd : a0 06 __ LDY #$06
17cf : b1 11 __ LDA (P4),y ; (si + 0)
17d1 : f0 04 __ BEQ $17d7 ; (nformf.s29 + 0)
.s110:
17d3 : a6 54 __ LDX T9 + 0 
17d5 : 90 70 __ BCC $1847 ; (nformf.l36 + 0)
.s29:
17d7 : a5 54 __ LDA T9 + 0 
17d9 : f0 40 __ BEQ $181b ; (nformf.s30 + 0)
.s35:
17db : e9 00 __ SBC #$00
17dd : a8 __ __ TAY
17de : a9 00 __ LDA #$00
17e0 : e9 00 __ SBC #$00
17e2 : aa __ __ TAX
17e3 : 98 __ __ TYA
17e4 : 18 __ __ CLC
17e5 : 65 13 __ ADC P6 ; (str + 0)
17e7 : 85 47 __ STA T1 + 0 
17e9 : 8a __ __ TXA
17ea : 65 14 __ ADC P7 ; (str + 1)
17ec : 85 48 __ STA T1 + 1 
17ee : a9 01 __ LDA #$01
17f0 : 85 4d __ STA T3 + 0 
17f2 : a6 54 __ LDX T9 + 0 
17f4 : 38 __ __ SEC
.l111:
17f5 : a0 01 __ LDY #$01
17f7 : b1 11 __ LDA (P4),y ; (si + 0)
17f9 : e5 4d __ SBC T3 + 0 
17fb : 85 4b __ STA T2 + 0 
17fd : a9 00 __ LDA #$00
17ff : e5 4e __ SBC T3 + 1 
1801 : 18 __ __ CLC
1802 : 65 14 __ ADC P7 ; (str + 1)
1804 : 85 4c __ STA T2 + 1 
1806 : 88 __ __ DEY
1807 : b1 47 __ LDA (T1 + 0),y 
1809 : a4 13 __ LDY P6 ; (str + 0)
180b : 91 4b __ STA (T2 + 0),y 
180d : a5 47 __ LDA T1 + 0 
180f : d0 02 __ BNE $1813 ; (nformf.s114 + 0)
.s113:
1811 : c6 48 __ DEC T1 + 1 
.s114:
1813 : c6 47 __ DEC T1 + 0 
1815 : e6 4d __ INC T3 + 0 
1817 : e4 4d __ CPX T3 + 0 
1819 : b0 da __ BCS $17f5 ; (nformf.l111 + 0)
.s30:
181b : a9 00 __ LDA #$00
181d : 85 4d __ STA T3 + 0 
181f : 90 08 __ BCC $1829 ; (nformf.l31 + 0)
.s33:
1821 : a9 20 __ LDA #$20
1823 : a4 4d __ LDY T3 + 0 
1825 : 91 13 __ STA (P6),y ; (str + 0)
1827 : e6 4d __ INC T3 + 0 
.l31:
1829 : a0 01 __ LDY #$01
182b : b1 11 __ LDA (P4),y ; (si + 0)
182d : 38 __ __ SEC
182e : e5 54 __ SBC T9 + 0 
1830 : 90 ef __ BCC $1821 ; (nformf.s33 + 0)
.s34:
1832 : c5 4d __ CMP T3 + 0 
1834 : 90 02 __ BCC $1838 ; (nformf.s32 + 0)
.s112:
1836 : d0 e9 __ BNE $1821 ; (nformf.s33 + 0)
.s32:
1838 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
183a : 85 1b __ STA ACCU + 0 
183c : a2 03 __ LDX #$03
183e : bd e7 9f LDA $9fe7,x ; (nformf@stack + 0)
1841 : 95 53 __ STA T7 + 0,x 
1843 : ca __ __ DEX
1844 : 10 f8 __ BPL $183e ; (nformf.s3 + 4)
1846 : 60 __ __ RTS
.l36:
1847 : 8a __ __ TXA
1848 : a0 01 __ LDY #$01
184a : d1 11 __ CMP (P4),y ; (si + 0)
184c : b0 ea __ BCS $1838 ; (nformf.s32 + 0)
.s37:
184e : a8 __ __ TAY
184f : a9 20 __ LDA #$20
1851 : 91 13 __ STA (P6),y ; (str + 0)
1853 : e8 __ __ INX
1854 : 90 f1 __ BCC $1847 ; (nformf.l36 + 0)
.s53:
1856 : a5 51 __ LDA T5 + 0 
1858 : c9 07 __ CMP #$07
185a : 90 14 __ BCC $1870 ; (nformf.s62 + 0)
.s54:
185c : ad b9 26 LDA $26b9 ; (fround5[0] + 24)
185f : 85 47 __ STA T1 + 0 
1861 : ad ba 26 LDA $26ba ; (fround5[0] + 25)
1864 : 85 48 __ STA T1 + 1 
1866 : ad bb 26 LDA $26bb ; (fround5[0] + 26)
1869 : 85 49 __ STA T1 + 2 
186b : ad bc 26 LDA $26bc ; (fround5[0] + 27)
186e : b0 15 __ BCS $1885 ; (nformf.s55 + 0)
.s62:
1870 : 0a __ __ ASL
1871 : 0a __ __ ASL
1872 : aa __ __ TAX
1873 : bd 9d 26 LDA $269d,x ; (divmod32 + 213)
1876 : 85 47 __ STA T1 + 0 
1878 : bd 9e 26 LDA $269e,x ; (divmod32 + 214)
187b : 85 48 __ STA T1 + 1 
187d : bd 9f 26 LDA $269f,x ; (spentry + 0)
1880 : 85 49 __ STA T1 + 2 
1882 : bd a0 26 LDA $26a0,x ; (giocharmap + 0)
.s55:
1885 : 85 4a __ STA T1 + 3 
1887 : a5 43 __ LDA T0 + 0 
1889 : 85 1b __ STA ACCU + 0 
188b : a5 44 __ LDA T0 + 1 
188d : 85 1c __ STA ACCU + 1 
188f : a5 45 __ LDA T0 + 2 
1891 : 85 1d __ STA ACCU + 2 
1893 : a5 46 __ LDA T0 + 3 
1895 : 85 1e __ STA ACCU + 3 
1897 : a2 47 __ LDX #$47
1899 : 20 eb 20 JSR $20eb ; (freg + 4)
189c : 20 32 21 JSR $2132 ; (faddsub + 6)
189f : a5 1c __ LDA ACCU + 1 
18a1 : 85 16 __ STA P9 ; (f + 1)
18a3 : a5 1d __ LDA ACCU + 2 
18a5 : 85 17 __ STA P10 ; (f + 2)
18a7 : a6 1b __ LDX ACCU + 0 
18a9 : a5 1e __ LDA ACCU + 3 
18ab : 85 18 __ STA P11 ; (f + 3)
18ad : 10 03 __ BPL $18b2 ; (nformf.s57 + 0)
18af : 4c b3 16 JMP $16b3 ; (nformf.s18 + 0)
.s57:
18b2 : c9 41 __ CMP #$41
18b4 : d0 0d __ BNE $18c3 ; (nformf.s61 + 0)
.s58:
18b6 : a5 17 __ LDA P10 ; (f + 2)
18b8 : c9 20 __ CMP #$20
18ba : d0 07 __ BNE $18c3 ; (nformf.s61 + 0)
.s59:
18bc : a5 16 __ LDA P9 ; (f + 1)
18be : d0 03 __ BNE $18c3 ; (nformf.s61 + 0)
.s60:
18c0 : 8a __ __ TXA
18c1 : f0 02 __ BEQ $18c5 ; (nformf.s56 + 0)
.s61:
18c3 : 90 ea __ BCC $18af ; (nformf.s55 + 42)
.s56:
18c5 : a9 00 __ LDA #$00
18c7 : 85 03 __ STA WORK + 0 
18c9 : 85 04 __ STA WORK + 1 
18cb : a9 20 __ LDA #$20
18cd : 85 05 __ STA WORK + 2 
18cf : a9 41 __ LDA #$41
18d1 : 85 06 __ STA WORK + 3 
18d3 : 20 fb 20 JSR $20fb ; (freg + 20)
18d6 : 20 e1 22 JSR $22e1 ; (crt_fdiv + 0)
18d9 : a5 1c __ LDA ACCU + 1 
18db : 85 16 __ STA P9 ; (f + 1)
18dd : a5 1d __ LDA ACCU + 2 
18df : 85 17 __ STA P10 ; (f + 2)
18e1 : a5 1e __ LDA ACCU + 3 
18e3 : 85 18 __ STA P11 ; (f + 3)
18e5 : a6 1b __ LDX ACCU + 0 
18e7 : e6 4f __ INC T4 + 0 
18e9 : d0 c4 __ BNE $18af ; (nformf.s55 + 42)
.s117:
18eb : e6 50 __ INC T4 + 1 
18ed : 4c b3 16 JMP $16b3 ; (nformf.s18 + 0)
.s102:
18f0 : 86 43 __ STX T0 + 0 
18f2 : 85 47 __ STA T1 + 0 
18f4 : a0 03 __ LDY #$03
18f6 : b1 11 __ LDA (P4),y ; (si + 0)
18f8 : 18 __ __ CLC
18f9 : 69 08 __ ADC #$08
18fb : a4 43 __ LDY T0 + 0 
18fd : 91 13 __ STA (P6),y ; (str + 0)
18ff : 18 __ __ CLC
1900 : a0 03 __ LDY #$03
1902 : b1 11 __ LDA (P4),y ; (si + 0)
1904 : 69 0d __ ADC #$0d
1906 : a4 43 __ LDY T0 + 0 
1908 : c8 __ __ INY
1909 : 91 13 __ STA (P6),y ; (str + 0)
190b : a0 03 __ LDY #$03
190d : b1 11 __ LDA (P4),y ; (si + 0)
190f : 18 __ __ CLC
1910 : 69 05 __ ADC #$05
1912 : a4 47 __ LDY T1 + 0 
1914 : 91 13 __ STA (P6),y ; (str + 0)
1916 : 18 __ __ CLC
1917 : a5 54 __ LDA T9 + 0 
1919 : 69 03 __ ADC #$03
191b : 85 54 __ STA T9 + 0 
191d : 4c c5 17 JMP $17c5 ; (nformf.s27 + 0)
.s104:
1920 : 20 31 19 JSR $1931 ; (isinf.s4 + 0)
1923 : a2 01 __ LDX #$01
1925 : 86 54 __ STX T9 + 0 
1927 : a8 __ __ TAY
1928 : d0 03 __ BNE $192d ; (nformf.s105 + 0)
192a : 4c 3a 14 JMP $143a ; (nformf.s7 + 0)
.s105:
192d : a9 03 __ LDA #$03
192f : d0 bf __ BNE $18f0 ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/hdnsh/oscar/include/math.h"
.s4:
1931 : 06 0f __ ASL P2 ; (f + 2)
1933 : a5 10 __ LDA P3 ; (f + 3)
1935 : 2a __ __ ROL
1936 : c9 ff __ CMP #$ff
1938 : d0 03 __ BNE $193d ; (isinf.s6 + 0)
.s5:
193a : a9 01 __ LDA #$01
193c : 60 __ __ RTS
.s6:
193d : a9 00 __ LDA #$00
.s3:
193f : 60 __ __ RTS
--------------------------------------------------------------------
1940 : __ __ __ BYT 20 20 68 6f 6e 64 61 6e 69 20 20 20 20 2a 2a 2a :   hondani    ***
1950 : __ __ __ BYT 20 20 70 65 74 73 63 69 69 20 63 6c 6f 63 6b 20 :   petscii clock 
1960 : __ __ __ BYT 20 2a 2a 2a 00                                  :  ***.
--------------------------------------------------------------------
draw_poem: ; draw_poem()->void
; 192, "/home/honza/projects/c64/projects/hdnsh/oscar/hodiny/hodiny.c"
.s1:
1965 : a5 53 __ LDA T0 + 0 
1967 : 8d 98 9f STA $9f98 ; (draw_poem@stack + 0)
196a : a5 54 __ LDA T0 + 1 
196c : 8d 99 9f STA $9f99 ; (draw_poem@stack + 1)
196f : a5 55 __ LDA T1 + 0 
1971 : 8d 9a 9f STA $9f9a ; (draw_poem@stack + 2)
.s4:
1974 : a9 01 __ LDA #$01
1976 : 85 55 __ STA T1 + 0 
.l5:
1978 : 0a __ __ ASL
1979 : aa __ __ TAX
197a : bd bb 26 LDA $26bb,x ; (fround5[0] + 26)
197d : 85 53 __ STA T0 + 0 
197f : bd bc 26 LDA $26bc,x ; (fround5[0] + 27)
1982 : 85 54 __ STA T0 + 1 
1984 : 05 53 __ ORA T0 + 0 
1986 : f0 2f __ BEQ $19b7 ; (draw_poem.s3 + 0)
.s6:
1988 : a5 55 __ LDA T1 + 0 
198a : 85 0e __ STA P1 
198c : a9 00 __ LDA #$00
198e : 85 0d __ STA P0 
1990 : 20 e3 0c JSR $0ce3 ; (gotoxy.s4 + 0)
1993 : a5 53 __ LDA T0 + 0 
1995 : 8d fa 9f STA $9ffa ; (sstack + 10)
1998 : a5 54 __ LDA T0 + 1 
199a : 8d fb 9f STA $9ffb ; (sstack + 11)
199d : a9 0d __ LDA #$0d
199f : 8d 86 02 STA $0286 
19a2 : a9 5e __ LDA #$5e
19a4 : 8d f8 9f STA $9ff8 ; (sstack + 8)
19a7 : a9 1b __ LDA #$1b
19a9 : 8d f9 9f STA $9ff9 ; (sstack + 9)
19ac : 20 ec 0c JSR $0cec ; (printf.s4 + 0)
19af : e6 55 __ INC T1 + 0 
19b1 : a5 55 __ LDA T1 + 0 
19b3 : c9 19 __ CMP #$19
19b5 : 90 c1 __ BCC $1978 ; (draw_poem.l5 + 0)
.s3:
19b7 : ad 98 9f LDA $9f98 ; (draw_poem@stack + 0)
19ba : 85 53 __ STA T0 + 0 
19bc : ad 99 9f LDA $9f99 ; (draw_poem@stack + 1)
19bf : 85 54 __ STA T0 + 1 
19c1 : ad 9a 9f LDA $9f9a ; (draw_poem@stack + 2)
19c4 : 85 55 __ STA T1 + 0 
19c6 : 60 __ __ RTS
--------------------------------------------------------------------
19c7 : __ __ __ BYT 20 68 6f 6e 64 61 6e 69 20 63 36 34 20 20 20 20 :  hondani c64    
19d7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
19d8 : __ __ __ BYT 20 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 7e 00 :  ~~~~~~~~~~~~~~.
--------------------------------------------------------------------
19e8 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
19f8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
19f9 : __ __ __ BYT 20 6d 61 73 74 65 72 73 20 6f 66 20 20 20 20 20 :  masters of     
1a09 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a0a : __ __ __ BYT 20 74 68 65 20 73 63 65 6e 65 21 20 20 20 20 20 :  the scene!     
1a1a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a1b : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1a2b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a2c : __ __ __ BYT 20 68 6f 6e 7a 61 20 20 20 20 20 20 20 20 20 20 :  honza          
1a3c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a3d : __ __ __ BYT 20 20 63 6f 64 65 20 77 69 7a 61 72 64 20 20 20 :   code wizard   
1a4d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a4e : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1a5e : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a5f : __ __ __ BYT 20 64 61 6e 20 20 20 20 20 20 20 20 20 20 20 20 :  dan            
1a6f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a70 : __ __ __ BYT 20 20 73 69 64 20 6d 61 67 69 63 6b 20 20 20 20 :   sid magick    
1a80 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a81 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1a91 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1a92 : __ __ __ BYT 20 6f 6e 64 72 61 20 20 20 20 20 20 20 20 20 20 :  ondra          
1aa2 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1aa3 : __ __ __ BYT 20 20 70 69 78 65 6c 20 6c 6f 72 64 20 20 20 20 :   pixel lord    
1ab3 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1ab4 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1ac4 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1ac5 : __ __ __ BYT 20 74 6f 67 65 74 68 65 72 20 20 20 20 20 20 20 :  together       
1ad5 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1ad6 : __ __ __ BYT 20 20 77 65 20 72 75 6c 65 20 20 20 20 20 20 20 :   we rule       
1ae6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1ae7 : __ __ __ BYT 20 20 74 68 65 20 63 36 34 21 20 20 20 20 20 20 :   the c64!      
1af7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1af8 : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1b08 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1b09 : __ __ __ BYT 20 68 6f 6e 64 61 6e 69 20 20 20 20 20 20 20 20 :  hondani        
1b19 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1b1a : __ __ __ BYT 20 20 66 6f 72 65 76 65 72 21 20 20 20 20 20 20 :   forever!      
1b2a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1b2b : __ __ __ BYT 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 20 :                 
1b3b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1b3c : __ __ __ BYT 20 66 61 6d 65 20 26 20 20 20 20 20 20 20 20 20 :  fame &         
1b4c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1b4d : __ __ __ BYT 20 20 67 6c 6f 72 79 20 69 73 20 6f 75 72 73 21 :   glory is ours!
1b5d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
1b5e : __ __ __ BYT 25 2e 31 36 73 00                               : %.16s.
--------------------------------------------------------------------
draw_divider: ; draw_divider()->void
; 202, "/home/honza/projects/c64/projects/hdnsh/oscar/hodiny/hodiny.c"
.s4:
1b64 : a2 00 __ LDX #$00
.l5:
1b66 : 86 45 __ STX T0 + 0 
1b68 : 86 0e __ STX P1 
1b6a : a9 10 __ LDA #$10
1b6c : 85 0d __ STA P0 
1b6e : 20 e3 0c JSR $0ce3 ; (gotoxy.s4 + 0)
1b71 : a9 0b __ LDA #$0b
1b73 : 8d 86 02 STA $0286 
1b76 : a9 7c __ LDA #$7c
1b78 : 20 76 0c JSR $0c76 ; (putpch.s4 + 0)
1b7b : a6 45 __ LDX T0 + 0 
1b7d : e8 __ __ INX
1b7e : e0 19 __ CPX #$19
1b80 : 90 e4 __ BCC $1b66 ; (draw_divider.l5 + 0)
.s3:
1b82 : 60 __ __ RTS
--------------------------------------------------------------------
draw_clock_bg: ; draw_clock_bg()->void
; 212, "/home/honza/projects/c64/projects/hdnsh/oscar/hodiny/hodiny.c"
.s4:
1b83 : a9 00 __ LDA #$00
1b85 : 85 1f __ STA ADDR + 0 
1b87 : 85 43 __ STA T2 + 0 
1b89 : a9 50 __ LDA #$50
1b8b : 85 1b __ STA ACCU + 0 
1b8d : a9 04 __ LDA #$04
1b8f : 85 1c __ STA ACCU + 1 
.l5:
1b91 : 18 __ __ CLC
1b92 : a5 1b __ LDA ACCU + 0 
1b94 : 69 11 __ ADC #$11
1b96 : a8 __ __ TAY
1b97 : a5 1c __ LDA ACCU + 1 
1b99 : 69 00 __ ADC #$00
1b9b : 85 44 __ STA T2 + 1 
1b9d : a2 17 __ LDX #$17
.l11:
1b9f : a9 20 __ LDA #$20
1ba1 : 91 43 __ STA (T2 + 0),y 
1ba3 : 18 __ __ CLC
1ba4 : a5 44 __ LDA T2 + 1 
1ba6 : 69 d4 __ ADC #$d4
1ba8 : 85 20 __ STA ADDR + 1 
1baa : a9 00 __ LDA #$00
1bac : 91 1f __ STA (ADDR + 0),y 
1bae : c8 __ __ INY
1baf : d0 02 __ BNE $1bb3 ; (draw_clock_bg.s14 + 0)
.s13:
1bb1 : e6 44 __ INC T2 + 1 
.s14:
1bb3 : ca __ __ DEX
1bb4 : d0 e9 __ BNE $1b9f ; (draw_clock_bg.l11 + 0)
.s12:
1bb6 : 18 __ __ CLC
1bb7 : a5 1b __ LDA ACCU + 0 
1bb9 : 69 28 __ ADC #$28
1bbb : 85 1b __ STA ACCU + 0 
1bbd : 90 02 __ BCC $1bc1 ; (draw_clock_bg.s16 + 0)
.s15:
1bbf : e6 1c __ INC ACCU + 1 
.s16:
1bc1 : c9 98 __ CMP #$98
1bc3 : d0 cc __ BNE $1b91 ; (draw_clock_bg.l5 + 0)
.s8:
1bc5 : a5 1c __ LDA ACCU + 1 
1bc7 : c9 07 __ CMP #$07
1bc9 : d0 c6 __ BNE $1b91 ; (draw_clock_bg.l5 + 0)
.s6:
1bcb : a0 00 __ LDY #$00
.l9:
1bcd : bd 48 27 LDA $2748,x ; (ring_y[0] + 0)
1bd0 : 0a __ __ ASL
1bd1 : 0a __ __ ASL
1bd2 : 7d 48 27 ADC $2748,x ; (ring_y[0] + 0)
1bd5 : 0a __ __ ASL
1bd6 : 0a __ __ ASL
1bd7 : 85 43 __ STA T2 + 0 
1bd9 : 98 __ __ TYA
1bda : 2a __ __ ROL
1bdb : 06 43 __ ASL T2 + 0 
1bdd : 2a __ __ ROL
1bde : 85 44 __ STA T2 + 1 
1be0 : 18 __ __ CLC
1be1 : a5 43 __ LDA T2 + 0 
1be3 : 7d 00 27 ADC $2700,x ; (ring_x[0] + 0)
1be6 : 85 43 __ STA T2 + 0 
1be8 : 85 1f __ STA ADDR + 0 
1bea : a5 44 __ LDA T2 + 1 
1bec : 69 04 __ ADC #$04
1bee : 85 44 __ STA T2 + 1 
1bf0 : 18 __ __ CLC
1bf1 : 69 d4 __ ADC #$d4
1bf3 : 85 20 __ STA ADDR + 1 
1bf5 : a9 5e __ LDA #$5e
1bf7 : 91 43 __ STA (T2 + 0),y 
1bf9 : a9 08 __ LDA #$08
1bfb : 91 1f __ STA (ADDR + 0),y 
1bfd : e8 __ __ INX
1bfe : e0 48 __ CPX #$48
1c00 : 90 cb __ BCC $1bcd ; (draw_clock_bg.l9 + 0)
.s7:
1c02 : a2 00 __ LDX #$00
.l10:
1c04 : bd 90 27 LDA $2790,x ; (tick_y[0] + 0)
1c07 : 0a __ __ ASL
1c08 : 0a __ __ ASL
1c09 : 7d 90 27 ADC $2790,x ; (tick_y[0] + 0)
1c0c : 0a __ __ ASL
1c0d : 0a __ __ ASL
1c0e : 85 43 __ STA T2 + 0 
1c10 : 98 __ __ TYA
1c11 : 2a __ __ ROL
1c12 : 06 43 __ ASL T2 + 0 
1c14 : 2a __ __ ROL
1c15 : 85 44 __ STA T2 + 1 
1c17 : 18 __ __ CLC
1c18 : a5 43 __ LDA T2 + 0 
1c1a : 7d ef 26 ADC $26ef,x ; (tick_x[0] + 0)
1c1d : 85 43 __ STA T2 + 0 
1c1f : 85 1f __ STA ADDR + 0 
1c21 : a5 44 __ LDA T2 + 1 
1c23 : 69 04 __ ADC #$04
1c25 : 85 44 __ STA T2 + 1 
1c27 : 18 __ __ CLC
1c28 : 69 d4 __ ADC #$d4
1c2a : 85 20 __ STA ADDR + 1 
1c2c : a9 5b __ LDA #$5b
1c2e : 91 43 __ STA (T2 + 0),y 
1c30 : a9 07 __ LDA #$07
1c32 : 91 1f __ STA (ADDR + 0),y 
1c34 : e8 __ __ INX
1c35 : e0 0c __ CPX #$0c
1c37 : d0 cb __ BNE $1c04 ; (draw_clock_bg.l10 + 0)
.s3:
1c39 : 60 __ __ RTS
--------------------------------------------------------------------
uii_get_time: ; uii_get_time()->void
; 162, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1c3a : a9 00 __ LDA #$00
1c3c : 85 10 __ STA P3 
1c3e : 8d ee 9f STA $9fee ; (cmd[0] + 0)
1c41 : a9 02 __ LDA #$02
1c43 : 85 0f __ STA P2 
1c45 : a9 01 __ LDA #$01
1c47 : 8d fb 26 STA $26fb ; (uii_target + 0)
1c4a : a9 26 __ LDA #$26
1c4c : 8d ef 9f STA $9fef ; (cmd[0] + 1)
1c4f : a9 ee __ LDA #$ee
1c51 : 85 0d __ STA P0 
1c53 : a9 9f __ LDA #$9f
1c55 : 85 0e __ STA P1 
1c57 : 20 63 1c JSR $1c63 ; (uii_sendcommand.s4 + 0)
1c5a : 20 fd 1c JSR $1cfd ; (uii_readdata.s4 + 0)
1c5d : 20 71 1d JSR $1d71 ; (uii_readstatus.s4 + 0)
1c60 : 4c cc 1d JMP $1dcc ; (uii_accept.s4 + 0)
--------------------------------------------------------------------
uii_sendcommand: ; uii_sendcommand(u8*,i16)->void
; 142, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1c63 : ad fb 26 LDA $26fb ; (uii_target + 0)
1c66 : a0 00 __ LDY #$00
1c68 : 84 1b __ STY ACCU + 0 
1c6a : 84 1c __ STY ACCU + 1 
1c6c : 91 0d __ STA (P0),y ; (bytes + 0)
.l5:
1c6e : ad fc 26 LDA $26fc ; (statusreg + 0)
1c71 : 85 43 __ STA T2 + 0 
1c73 : ad fd 26 LDA $26fd ; (statusreg + 1)
1c76 : 85 44 __ STA T2 + 1 
.l6:
1c78 : a0 00 __ LDY #$00
.l20:
1c7a : b1 43 __ LDA (T2 + 0),y 
1c7c : 29 20 __ AND #$20
1c7e : d0 fa __ BNE $1c7a ; (uii_sendcommand.l20 + 0)
.s7:
1c80 : b1 43 __ LDA (T2 + 0),y 
1c82 : 29 10 __ AND #$10
1c84 : d0 f2 __ BNE $1c78 ; (uii_sendcommand.l6 + 0)
.s8:
1c86 : a5 10 __ LDA P3 ; (count + 1)
1c88 : 30 47 __ BMI $1cd1 ; (uii_sendcommand.s9 + 0)
.s19:
1c8a : 85 46 __ STA T3 + 1 
1c8c : a5 1c __ LDA ACCU + 1 
1c8e : c5 10 __ CMP P3 ; (count + 1)
1c90 : d0 04 __ BNE $1c96 ; (uii_sendcommand.s18 + 0)
.s17:
1c92 : a5 1b __ LDA ACCU + 0 
1c94 : c5 0f __ CMP P2 ; (count + 0)
.s18:
1c96 : b0 39 __ BCS $1cd1 ; (uii_sendcommand.s9 + 0)
.s13:
1c98 : a5 0d __ LDA P0 ; (bytes + 0)
1c9a : 65 1b __ ADC ACCU + 0 
1c9c : 85 47 __ STA T4 + 0 
1c9e : a5 0e __ LDA P1 ; (bytes + 1)
1ca0 : 65 1c __ ADC ACCU + 1 
1ca2 : 85 48 __ STA T4 + 1 
1ca4 : ad fe 26 LDA $26fe ; (cmddatareg + 0)
1ca7 : 85 49 __ STA T5 + 0 
1ca9 : ad ff 26 LDA $26ff ; (cmddatareg + 1)
1cac : 85 4a __ STA T5 + 1 
1cae : a6 1b __ LDX ACCU + 0 
.l14:
1cb0 : b1 47 __ LDA (T4 + 0),y 
1cb2 : 91 49 __ STA (T5 + 0),y 
1cb4 : e8 __ __ INX
1cb5 : d0 02 __ BNE $1cb9 ; (uii_sendcommand.s23 + 0)
.s22:
1cb7 : e6 1c __ INC ACCU + 1 
.s23:
1cb9 : 24 46 __ BIT T3 + 1 
1cbb : 30 12 __ BMI $1ccf ; (uii_sendcommand.s21 + 0)
.s16:
1cbd : e6 47 __ INC T4 + 0 
1cbf : d0 02 __ BNE $1cc3 ; (uii_sendcommand.s25 + 0)
.s24:
1cc1 : e6 48 __ INC T4 + 1 
.s25:
1cc3 : a5 1c __ LDA ACCU + 1 
1cc5 : c5 10 __ CMP P3 ; (count + 1)
1cc7 : 90 e7 __ BCC $1cb0 ; (uii_sendcommand.l14 + 0)
.s26:
1cc9 : d0 04 __ BNE $1ccf ; (uii_sendcommand.s21 + 0)
.s15:
1ccb : e4 0f __ CPX P2 ; (count + 0)
1ccd : 90 e1 __ BCC $1cb0 ; (uii_sendcommand.l14 + 0)
.s21:
1ccf : 86 1b __ STX ACCU + 0 
.s9:
1cd1 : ad 9c 27 LDA $279c ; (controlreg + 0)
1cd4 : 85 45 __ STA T3 + 0 
1cd6 : ad 9d 27 LDA $279d ; (controlreg + 1)
1cd9 : 85 46 __ STA T3 + 1 
1cdb : b1 45 __ LDA (T3 + 0),y 
1cdd : aa __ __ TAX
1cde : 09 01 __ ORA #$01
1ce0 : 91 45 __ STA (T3 + 0),y 
1ce2 : b1 43 __ LDA (T2 + 0),y 
1ce4 : 29 04 __ AND #$04
1ce6 : f0 08 __ BEQ $1cf0 ; (uii_sendcommand.l10 + 0)
.s12:
1ce8 : 8a __ __ TXA
1ce9 : 09 09 __ ORA #$09
1ceb : 91 45 __ STA (T3 + 0),y 
1ced : 4c 6e 1c JMP $1c6e ; (uii_sendcommand.l5 + 0)
.l10:
1cf0 : b1 43 __ LDA (T2 + 0),y 
1cf2 : 29 20 __ AND #$20
1cf4 : d0 06 __ BNE $1cfc ; (uii_sendcommand.s3 + 0)
.s11:
1cf6 : b1 43 __ LDA (T2 + 0),y 
1cf8 : 29 10 __ AND #$10
1cfa : d0 f4 __ BNE $1cf0 ; (uii_sendcommand.l10 + 0)
.s3:
1cfc : 60 __ __ RTS
--------------------------------------------------------------------
uii_readdata: ; uii_readdata()->i16
; 143, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1cfd : a9 00 __ LDA #$00
1cff : 8d 3c 28 STA $283c ; (uii_data[0] + 0)
1d02 : 20 56 1d JSR $1d56 ; (uii_isdataavailable.s4 + 0)
1d05 : a9 00 __ LDA #$00
1d07 : 85 45 __ STA T1 + 0 
1d09 : 85 46 __ STA T1 + 1 
1d0b : a5 1b __ LDA ACCU + 0 
1d0d : 05 1c __ ORA ACCU + 1 
1d0f : f0 2d __ BEQ $1d3e ; (uii_readdata.s5 + 0)
.s6:
1d11 : a9 3c __ LDA #$3c
1d13 : 85 47 __ STA T2 + 0 
1d15 : a9 28 __ LDA #$28
1d17 : 85 48 __ STA T2 + 1 
.l7:
1d19 : ad 9e 27 LDA $279e ; (respdatareg + 0)
1d1c : 85 43 __ STA T0 + 0 
1d1e : ad 9f 27 LDA $279f ; (respdatareg + 1)
1d21 : 85 44 __ STA T0 + 1 
1d23 : a0 00 __ LDY #$00
1d25 : b1 43 __ LDA (T0 + 0),y 
1d27 : 91 47 __ STA (T2 + 0),y 
1d29 : e6 45 __ INC T1 + 0 
1d2b : d0 02 __ BNE $1d2f ; (uii_readdata.s9 + 0)
.s8:
1d2d : e6 46 __ INC T1 + 1 
.s9:
1d2f : e6 47 __ INC T2 + 0 
1d31 : d0 02 __ BNE $1d35 ; (uii_readdata.s11 + 0)
.s10:
1d33 : e6 48 __ INC T2 + 1 
.s11:
1d35 : 20 56 1d JSR $1d56 ; (uii_isdataavailable.s4 + 0)
1d38 : a5 1b __ LDA ACCU + 0 
1d3a : 05 1c __ ORA ACCU + 1 
1d3c : d0 db __ BNE $1d19 ; (uii_readdata.l7 + 0)
.s5:
1d3e : a9 3c __ LDA #$3c
1d40 : 85 43 __ STA T0 + 0 
1d42 : 18 __ __ CLC
1d43 : a9 28 __ LDA #$28
1d45 : 65 46 __ ADC T1 + 1 
1d47 : 85 44 __ STA T0 + 1 
1d49 : a9 00 __ LDA #$00
1d4b : a4 45 __ LDY T1 + 0 
1d4d : 84 1b __ STY ACCU + 0 
1d4f : 91 43 __ STA (T0 + 0),y 
1d51 : a5 46 __ LDA T1 + 1 
1d53 : 85 1c __ STA ACCU + 1 
.s3:
1d55 : 60 __ __ RTS
--------------------------------------------------------------------
uii_isdataavailable: ; uii_isdataavailable()->i16
; 147, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1d56 : ad fc 26 LDA $26fc ; (statusreg + 0)
1d59 : 85 1b __ STA ACCU + 0 
1d5b : ad fd 26 LDA $26fd ; (statusreg + 1)
1d5e : 85 1c __ STA ACCU + 1 
1d60 : a0 00 __ LDY #$00
1d62 : b1 1b __ LDA (ACCU + 0),y 
1d64 : 10 06 __ BPL $1d6c ; (uii_isdataavailable.s5 + 0)
.s6:
1d66 : a9 01 __ LDA #$01
1d68 : 85 1b __ STA ACCU + 0 
1d6a : d0 02 __ BNE $1d6e ; (uii_isdataavailable.s3 + 0)
.s5:
1d6c : 84 1b __ STY ACCU + 0 
.s3:
1d6e : 84 1c __ STY ACCU + 1 
1d70 : 60 __ __ RTS
--------------------------------------------------------------------
uii_readstatus: ; uii_readstatus()->i16
; 144, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1d71 : a9 00 __ LDA #$00
1d73 : 8d 00 30 STA $3000 ; (uii_status[0] + 0)
1d76 : 85 43 __ STA T2 + 0 
1d78 : 85 44 __ STA T2 + 1 
.l7:
1d7a : 20 ae 1d JSR $1dae ; (uii_isstatusdataavailable.s4 + 0)
1d7d : a5 1b __ LDA ACCU + 0 
1d7f : 05 1c __ ORA ACCU + 1 
1d81 : f0 1f __ BEQ $1da2 ; (uii_readstatus.s5 + 0)
.s6:
1d83 : ad a0 27 LDA $27a0 ; (statusdatareg + 0)
1d86 : 85 1b __ STA ACCU + 0 
1d88 : ad a1 27 LDA $27a1 ; (statusdatareg + 1)
1d8b : 85 1c __ STA ACCU + 1 
1d8d : a0 00 __ LDY #$00
1d8f : b1 1b __ LDA (ACCU + 0),y 
1d91 : a6 43 __ LDX T2 + 0 
1d93 : 9d 00 30 STA $3000,x ; (uii_status[0] + 0)
1d96 : 8a __ __ TXA
1d97 : 18 __ __ CLC
1d98 : 69 01 __ ADC #$01
1d9a : 85 43 __ STA T2 + 0 
1d9c : 90 dc __ BCC $1d7a ; (uii_readstatus.l7 + 0)
.s8:
1d9e : e6 44 __ INC T2 + 1 
1da0 : b0 d8 __ BCS $1d7a ; (uii_readstatus.l7 + 0)
.s5:
1da2 : a6 43 __ LDX T2 + 0 
1da4 : 86 1b __ STX ACCU + 0 
1da6 : 9d 00 30 STA $3000,x ; (uii_status[0] + 0)
1da9 : a5 44 __ LDA T2 + 1 
1dab : 85 1c __ STA ACCU + 1 
.s3:
1dad : 60 __ __ RTS
--------------------------------------------------------------------
uii_isstatusdataavailable: ; uii_isstatusdataavailable()->i16
; 148, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1dae : ad fc 26 LDA $26fc ; (statusreg + 0)
1db1 : 85 1b __ STA ACCU + 0 
1db3 : ad fd 26 LDA $26fd ; (statusreg + 1)
1db6 : 85 1c __ STA ACCU + 1 
1db8 : a0 00 __ LDY #$00
1dba : b1 1b __ LDA (ACCU + 0),y 
1dbc : 29 40 __ AND #$40
1dbe : f0 07 __ BEQ $1dc7 ; (uii_isstatusdataavailable.s5 + 0)
.s6:
1dc0 : a9 01 __ LDA #$01
1dc2 : 85 1b __ STA ACCU + 0 
1dc4 : 98 __ __ TYA
1dc5 : f0 02 __ BEQ $1dc9 ; (uii_isstatusdataavailable.s3 + 0)
.s5:
1dc7 : 85 1b __ STA ACCU + 0 
.s3:
1dc9 : 85 1c __ STA ACCU + 1 
1dcb : 60 __ __ RTS
--------------------------------------------------------------------
uii_accept: ; uii_accept()->void
; 145, "/home/honza/projects/c64/projects/hdnsh/oscar/include/ultimate_lib.h"
.s4:
1dcc : ad 9c 27 LDA $279c ; (controlreg + 0)
1dcf : 85 1b __ STA ACCU + 0 
1dd1 : ad 9d 27 LDA $279d ; (controlreg + 1)
1dd4 : 85 1c __ STA ACCU + 1 
1dd6 : a0 00 __ LDY #$00
1dd8 : b1 1b __ LDA (ACCU + 0),y 
1dda : 09 02 __ ORA #$02
1ddc : 91 1b __ STA (ACCU + 0),y 
1dde : ad fc 26 LDA $26fc ; (statusreg + 0)
1de1 : 85 1b __ STA ACCU + 0 
1de3 : ad fd 26 LDA $26fd ; (statusreg + 1)
1de6 : 85 1c __ STA ACCU + 1 
.l5:
1de8 : b1 1b __ LDA (ACCU + 0),y 
1dea : 29 02 __ AND #$02
1dec : d0 fa __ BNE $1de8 ; (uii_accept.l5 + 0)
.s3:
1dee : 60 __ __ RTS
--------------------------------------------------------------------
restore_bg: ; restore_bg(i16,i16)->void
; 172, "/home/honza/projects/c64/projects/hdnsh/oscar/hodiny/hodiny.c"
.s4:
1def : a2 00 __ LDX #$00
1df1 : a4 0d __ LDY P0 ; (x + 0)
1df3 : a5 0e __ LDA P1 ; (x + 1)
1df5 : d0 14 __ BNE $1e0b ; (restore_bg.l6 + 0)
.s36:
1df7 : 98 __ __ TYA
1df8 : dd ef 26 CMP $26ef,x ; (tick_x[0] + 0)
1dfb : d0 0e __ BNE $1e0b ; (restore_bg.l6 + 0)
.s29:
1dfd : a5 10 __ LDA P3 ; (y + 1)
1dff : d0 0a __ BNE $1e0b ; (restore_bg.l6 + 0)
.s35:
1e01 : a5 0f __ LDA P2 ; (y + 0)
1e03 : dd 90 27 CMP $2790,x ; (tick_y[0] + 0)
1e06 : d0 03 __ BNE $1e0b ; (restore_bg.l6 + 0)
1e08 : 4c c1 1e JMP $1ec1 ; (restore_bg.s34 + 0)
.l6:
1e0b : e8 __ __ INX
1e0c : e0 0c __ CPX #$0c
1e0e : b0 06 __ BCS $1e16 ; (restore_bg.s7 + 0)
.s5:
1e10 : a5 0e __ LDA P1 ; (x + 1)
1e12 : d0 f7 __ BNE $1e0b ; (restore_bg.l6 + 0)
1e14 : f0 e1 __ BEQ $1df7 ; (restore_bg.s36 + 0)
.s7:
1e16 : a2 00 __ LDX #$00
1e18 : a5 0e __ LDA P1 ; (x + 1)
.l8:
1e1a : d0 11 __ BNE $1e2d ; (restore_bg.s9 + 0)
.s28:
1e1c : 98 __ __ TYA
1e1d : dd 00 27 CMP $2700,x ; (ring_x[0] + 0)
1e20 : d0 0b __ BNE $1e2d ; (restore_bg.s9 + 0)
.s21:
1e22 : a5 10 __ LDA P3 ; (y + 1)
1e24 : d0 07 __ BNE $1e2d ; (restore_bg.s9 + 0)
.s27:
1e26 : a5 0f __ LDA P2 ; (y + 0)
1e28 : dd 48 27 CMP $2748,x ; (ring_y[0] + 0)
1e2b : f0 58 __ BEQ $1e85 ; (restore_bg.s26 + 0)
.s9:
1e2d : e8 __ __ INX
1e2e : e0 48 __ CPX #$48
1e30 : a5 0e __ LDA P1 ; (x + 1)
1e32 : 90 e6 __ BCC $1e1a ; (restore_bg.l8 + 0)
.s10:
1e34 : 30 4e __ BMI $1e84 ; (restore_bg.s3 + 0)
.s20:
1e36 : 84 0d __ STY P0 ; (x + 0)
1e38 : d0 04 __ BNE $1e3e ; (restore_bg.s11 + 0)
.s19:
1e3a : c0 11 __ CPY #$11
1e3c : 90 46 __ BCC $1e84 ; (restore_bg.s3 + 0)
.s11:
1e3e : aa __ __ TAX
1e3f : d0 43 __ BNE $1e84 ; (restore_bg.s3 + 0)
.s18:
1e41 : c0 28 __ CPY #$28
1e43 : b0 3f __ BCS $1e84 ; (restore_bg.s3 + 0)
.s12:
1e45 : a5 10 __ LDA P3 ; (y + 1)
1e47 : 30 3b __ BMI $1e84 ; (restore_bg.s3 + 0)
.s17:
1e49 : d0 06 __ BNE $1e51 ; (restore_bg.s13 + 0)
.s16:
1e4b : a5 0f __ LDA P2 ; (y + 0)
1e4d : c9 02 __ CMP #$02
1e4f : 90 33 __ BCC $1e84 ; (restore_bg.s3 + 0)
.s13:
1e51 : a5 10 __ LDA P3 ; (y + 1)
1e53 : d0 2f __ BNE $1e84 ; (restore_bg.s3 + 0)
.s15:
1e55 : a5 0f __ LDA P2 ; (y + 0)
1e57 : c9 17 __ CMP #$17
1e59 : b0 29 __ BCS $1e84 ; (restore_bg.s3 + 0)
.s14:
1e5b : 0a __ __ ASL
1e5c : 0a __ __ ASL
1e5d : 65 0f __ ADC P2 ; (y + 0)
1e5f : 0a __ __ ASL
1e60 : 0a __ __ ASL
1e61 : 85 1b __ STA ACCU + 0 
1e63 : a9 00 __ LDA #$00
1e65 : 2a __ __ ROL
1e66 : 06 1b __ ASL ACCU + 0 
1e68 : 2a __ __ ROL
1e69 : aa __ __ TAX
1e6a : a5 1b __ LDA ACCU + 0 
1e6c : 65 0d __ ADC P0 ; (x + 0)
1e6e : 85 1b __ STA ACCU + 0 
1e70 : 85 1f __ STA ADDR + 0 
1e72 : 8a __ __ TXA
1e73 : 69 04 __ ADC #$04
1e75 : 85 1c __ STA ACCU + 1 
1e77 : 69 d4 __ ADC #$d4
1e79 : 85 20 __ STA ADDR + 1 
1e7b : a9 20 __ LDA #$20
1e7d : a0 00 __ LDY #$00
1e7f : 91 1b __ STA (ACCU + 0),y 
1e81 : 98 __ __ TYA
.s37:
1e82 : 91 1f __ STA (ADDR + 0),y 
.s3:
1e84 : 60 __ __ RTS
.s26:
1e85 : c0 11 __ CPY #$11
1e87 : 90 fb __ BCC $1e84 ; (restore_bg.s3 + 0)
.s25:
1e89 : c0 28 __ CPY #$28
1e8b : b0 f7 __ BCS $1e84 ; (restore_bg.s3 + 0)
.s24:
1e8d : c9 02 __ CMP #$02
1e8f : 90 f3 __ BCC $1e84 ; (restore_bg.s3 + 0)
.s23:
1e91 : c9 17 __ CMP #$17
1e93 : b0 ef __ BCS $1e84 ; (restore_bg.s3 + 0)
.s22:
1e95 : 84 0d __ STY P0 ; (x + 0)
1e97 : 0a __ __ ASL
1e98 : 0a __ __ ASL
1e99 : 65 0f __ ADC P2 ; (y + 0)
1e9b : 0a __ __ ASL
1e9c : 0a __ __ ASL
1e9d : 85 1b __ STA ACCU + 0 
1e9f : a9 00 __ LDA #$00
1ea1 : 2a __ __ ROL
1ea2 : 06 1b __ ASL ACCU + 0 
1ea4 : 2a __ __ ROL
1ea5 : aa __ __ TAX
1ea6 : a5 1b __ LDA ACCU + 0 
1ea8 : 65 0d __ ADC P0 ; (x + 0)
1eaa : 85 1b __ STA ACCU + 0 
1eac : 85 1f __ STA ADDR + 0 
1eae : 8a __ __ TXA
1eaf : 69 04 __ ADC #$04
1eb1 : 85 1c __ STA ACCU + 1 
1eb3 : 69 d4 __ ADC #$d4
1eb5 : 85 20 __ STA ADDR + 1 
1eb7 : a9 5e __ LDA #$5e
1eb9 : a0 00 __ LDY #$00
1ebb : 91 1b __ STA (ACCU + 0),y 
1ebd : a9 08 __ LDA #$08
1ebf : d0 c1 __ BNE $1e82 ; (restore_bg.s37 + 0)
.s34:
1ec1 : c0 11 __ CPY #$11
1ec3 : 90 bf __ BCC $1e84 ; (restore_bg.s3 + 0)
.s33:
1ec5 : c0 28 __ CPY #$28
1ec7 : b0 bb __ BCS $1e84 ; (restore_bg.s3 + 0)
.s32:
1ec9 : c9 02 __ CMP #$02
1ecb : 90 b7 __ BCC $1e84 ; (restore_bg.s3 + 0)
.s31:
1ecd : c9 17 __ CMP #$17
1ecf : b0 b3 __ BCS $1e84 ; (restore_bg.s3 + 0)
.s30:
1ed1 : 84 0d __ STY P0 ; (x + 0)
1ed3 : 0a __ __ ASL
1ed4 : 0a __ __ ASL
1ed5 : 65 0f __ ADC P2 ; (y + 0)
1ed7 : 0a __ __ ASL
1ed8 : 0a __ __ ASL
1ed9 : 85 1b __ STA ACCU + 0 
1edb : a9 00 __ LDA #$00
1edd : 2a __ __ ROL
1ede : 06 1b __ ASL ACCU + 0 
1ee0 : 2a __ __ ROL
1ee1 : aa __ __ TAX
1ee2 : a5 1b __ LDA ACCU + 0 
1ee4 : 65 0d __ ADC P0 ; (x + 0)
1ee6 : 85 1b __ STA ACCU + 0 
1ee8 : 85 1f __ STA ADDR + 0 
1eea : 8a __ __ TXA
1eeb : 69 04 __ ADC #$04
1eed : 85 1c __ STA ACCU + 1 
1eef : 69 d4 __ ADC #$d4
1ef1 : 85 20 __ STA ADDR + 1 
1ef3 : a9 5b __ LDA #$5b
1ef5 : a0 00 __ LDY #$00
1ef7 : 91 1b __ STA (ACCU + 0),y 
1ef9 : a9 07 __ LDA #$07
1efb : d0 85 __ BNE $1e82 ; (restore_bg.s37 + 0)
--------------------------------------------------------------------
draw_hand: ; draw_hand(i16,i16,i16,i16,i8*,i8*)->void
; 228, "/home/honza/projects/c64/projects/hdnsh/oscar/hodiny/hodiny.c"
.s1:
1efd : a5 53 __ LDA T12 + 0 
1eff : 8d d8 9f STA $9fd8 ; (draw_hand@stack + 0)
.s4:
1f02 : a5 10 __ LDA P3 ; (frac + 1)
1f04 : 29 80 __ AND #$80
1f06 : 10 02 __ BPL $1f0a ; (draw_hand.s4 + 8)
1f08 : a9 ff __ LDA #$ff
1f0a : 85 45 __ STA T0 + 2 
1f0c : a6 0d __ LDX P0 ; (idx + 0)
1f0e : bd 00 28 LDA $2800,x ; (sin60[0] + 0)
1f11 : 85 46 __ STA T1 + 0 
1f13 : 29 80 __ AND #$80
1f15 : 10 02 __ BPL $1f19 ; (draw_hand.s4 + 23)
1f17 : a9 ff __ LDA #$ff
1f19 : 85 47 __ STA T1 + 1 
1f1b : bd a4 27 LDA $27a4,x ; (cos60[0] + 0)
1f1e : 85 48 __ STA T2 + 0 
1f20 : 29 80 __ AND #$80
1f22 : 10 02 __ BPL $1f26 ; (draw_hand.s4 + 36)
1f24 : a9 ff __ LDA #$ff
1f26 : 85 49 __ STA T2 + 1 
1f28 : a9 00 __ LDA #$00
.l5:
1f2a : 85 52 __ STA T7 + 0 
1f2c : 18 __ __ CLC
1f2d : 69 01 __ ADC #$01
1f2f : 85 53 __ STA T12 + 0 
1f31 : a5 0f __ LDA P2 ; (frac + 0)
1f33 : 85 1b __ STA ACCU + 0 
1f35 : a5 10 __ LDA P3 ; (frac + 1)
1f37 : 85 1c __ STA ACCU + 1 
1f39 : a5 45 __ LDA T0 + 2 
1f3b : 85 1d __ STA ACCU + 2 
1f3d : 85 1e __ STA ACCU + 3 
1f3f : a5 53 __ LDA T12 + 0 
1f41 : 20 b1 20 JSR $20b1 ; (mul32by8 + 0)
1f44 : a5 07 __ LDA WORK + 4 
1f46 : 85 1b __ STA ACCU + 0 
1f48 : 85 4a __ STA T3 + 0 
1f4a : a5 08 __ LDA WORK + 5 
1f4c : 85 1c __ STA ACCU + 1 
1f4e : 85 4b __ STA T3 + 1 
1f50 : a5 09 __ LDA WORK + 6 
1f52 : 85 1d __ STA ACCU + 2 
1f54 : 85 4c __ STA T3 + 2 
1f56 : a5 0a __ LDA WORK + 7 
1f58 : 85 1e __ STA ACCU + 3 
1f5a : 85 4d __ STA T3 + 3 
1f5c : a5 48 __ LDA T2 + 0 
1f5e : 85 03 __ STA WORK + 0 
1f60 : a5 49 __ LDA T2 + 1 
1f62 : 85 04 __ STA WORK + 1 
1f64 : 85 05 __ STA WORK + 2 
1f66 : 85 06 __ STA WORK + 3 
1f68 : 20 0e 25 JSR $250e ; (mul32 + 0)
1f6b : a5 07 __ LDA WORK + 4 
1f6d : 85 1b __ STA ACCU + 0 
1f6f : a5 08 __ LDA WORK + 5 
1f71 : 85 1c __ STA ACCU + 1 
1f73 : a5 09 __ LDA WORK + 6 
1f75 : 85 1d __ STA ACCU + 2 
1f77 : a5 0a __ LDA WORK + 7 
1f79 : 85 1e __ STA ACCU + 3 
1f7b : a9 09 __ LDA #$09
1f7d : 20 b1 20 JSR $20b1 ; (mul32by8 + 0)
1f80 : a5 07 __ LDA WORK + 4 
1f82 : 85 1b __ STA ACCU + 0 
1f84 : a5 08 __ LDA WORK + 5 
1f86 : 85 1c __ STA ACCU + 1 
1f88 : a5 09 __ LDA WORK + 6 
1f8a : 85 1d __ STA ACCU + 2 
1f8c : a5 0a __ LDA WORK + 7 
1f8e : 85 1e __ STA ACCU + 3 
1f90 : a9 a0 __ LDA #$a0
1f92 : 85 03 __ STA WORK + 0 
1f94 : a9 00 __ LDA #$00
1f96 : 85 06 __ STA WORK + 3 
1f98 : a9 86 __ LDA #$86
1f9a : 85 04 __ STA WORK + 1 
1f9c : a9 01 __ LDA #$01
1f9e : 85 05 __ STA WORK + 2 
1fa0 : 20 76 25 JSR $2576 ; (divs32 + 0)
1fa3 : a5 1b __ LDA ACCU + 0 
1fa5 : 85 4e __ STA T4 + 0 
1fa7 : 18 __ __ CLC
1fa8 : 69 1c __ ADC #$1c
1faa : 85 50 __ STA T5 + 0 
1fac : a4 52 __ LDY T7 + 0 
1fae : 91 15 __ STA (P8),y ; (hx + 0)
1fb0 : a5 1c __ LDA ACCU + 1 
1fb2 : 85 4f __ STA T4 + 1 
1fb4 : 69 00 __ ADC #$00
1fb6 : 85 51 __ STA T5 + 1 
1fb8 : a5 46 __ LDA T1 + 0 
1fba : 85 1b __ STA ACCU + 0 
1fbc : a5 47 __ LDA T1 + 1 
1fbe : 85 1c __ STA ACCU + 1 
1fc0 : 85 1d __ STA ACCU + 2 
1fc2 : 85 1e __ STA ACCU + 3 
1fc4 : a5 4a __ LDA T3 + 0 
1fc6 : 85 03 __ STA WORK + 0 
1fc8 : a5 4b __ LDA T3 + 1 
1fca : 85 04 __ STA WORK + 1 
1fcc : a5 4c __ LDA T3 + 2 
1fce : 85 05 __ STA WORK + 2 
1fd0 : a5 4d __ LDA T3 + 3 
1fd2 : 85 06 __ STA WORK + 3 
1fd4 : 20 0e 25 JSR $250e ; (mul32 + 0)
1fd7 : a5 07 __ LDA WORK + 4 
1fd9 : 85 1b __ STA ACCU + 0 
1fdb : a5 08 __ LDA WORK + 5 
1fdd : 85 1c __ STA ACCU + 1 
1fdf : a5 09 __ LDA WORK + 6 
1fe1 : 85 1d __ STA ACCU + 2 
1fe3 : a5 0a __ LDA WORK + 7 
1fe5 : 85 1e __ STA ACCU + 3 
1fe7 : a9 00 __ LDA #$00
1fe9 : 85 05 __ STA WORK + 2 
1feb : 85 06 __ STA WORK + 3 
1fed : a9 10 __ LDA #$10
1fef : 85 03 __ STA WORK + 0 
1ff1 : a9 27 __ LDA #$27
1ff3 : 85 04 __ STA WORK + 1 
1ff5 : 20 76 25 JSR $2576 ; (divs32 + 0)
1ff8 : a5 1b __ LDA ACCU + 0 
1ffa : 85 4a __ STA T3 + 0 
1ffc : 18 __ __ CLC
1ffd : 69 0c __ ADC #$0c
1fff : 85 1d __ STA ACCU + 2 
2001 : a4 52 __ LDY T7 + 0 
2003 : 91 17 __ STA (P10),y ; (hy + 0)
2005 : a5 1c __ LDA ACCU + 1 
2007 : 69 00 __ ADC #$00
2009 : aa __ __ TAX
200a : a5 4f __ LDA T4 + 1 
200c : 49 80 __ EOR #$80
200e : c9 7f __ CMP #$7f
2010 : d0 04 __ BNE $2016 ; (draw_hand.s16 + 0)
.s15:
2012 : a5 4e __ LDA T4 + 0 
2014 : c9 f5 __ CMP #$f5
.s16:
2016 : 90 64 __ BCC $207c ; (draw_hand.s10 + 0)
.s6:
2018 : a5 51 __ LDA T5 + 1 
201a : d0 60 __ BNE $207c ; (draw_hand.s10 + 0)
.s14:
201c : a5 50 __ LDA T5 + 0 
201e : c9 28 __ CMP #$28
2020 : b0 5a __ BCS $207c ; (draw_hand.s10 + 0)
.s7:
2022 : a5 1c __ LDA ACCU + 1 
2024 : 49 80 __ EOR #$80
2026 : c9 7f __ CMP #$7f
2028 : d0 04 __ BNE $202e ; (draw_hand.s13 + 0)
.s12:
202a : a5 1b __ LDA ACCU + 0 
202c : c9 f6 __ CMP #$f6
.s13:
202e : 90 4c __ BCC $207c ; (draw_hand.s10 + 0)
.s8:
2030 : 8a __ __ TXA
2031 : d0 49 __ BNE $207c ; (draw_hand.s10 + 0)
.s11:
2033 : a9 16 __ LDA #$16
2035 : c5 1d __ CMP ACCU + 2 
2037 : 90 43 __ BCC $207c ; (draw_hand.s10 + 0)
.s9:
2039 : 06 1b __ ASL ACCU + 0 
203b : a5 1c __ LDA ACCU + 1 
203d : 2a __ __ ROL
203e : 06 1b __ ASL ACCU + 0 
2040 : 2a __ __ ROL
2041 : aa __ __ TAX
2042 : 18 __ __ CLC
2043 : a5 1b __ LDA ACCU + 0 
2045 : 65 4a __ ADC T3 + 0 
2047 : 85 4a __ STA T3 + 0 
2049 : 8a __ __ TXA
204a : 65 1c __ ADC ACCU + 1 
204c : 06 4a __ ASL T3 + 0 
204e : 2a __ __ ROL
204f : 06 4a __ ASL T3 + 0 
2051 : 2a __ __ ROL
2052 : 06 4a __ ASL T3 + 0 
2054 : 2a __ __ ROL
2055 : a8 __ __ TAY
2056 : 18 __ __ CLC
2057 : a5 4a __ LDA T3 + 0 
2059 : 69 e0 __ ADC #$e0
205b : aa __ __ TAX
205c : 98 __ __ TYA
205d : 69 05 __ ADC #$05
205f : a8 __ __ TAY
2060 : 8a __ __ TXA
2061 : 18 __ __ CLC
2062 : 65 50 __ ADC T5 + 0 
2064 : 85 4a __ STA T3 + 0 
2066 : 85 1f __ STA ADDR + 0 
2068 : 98 __ __ TYA
2069 : 69 00 __ ADC #$00
206b : 85 4b __ STA T3 + 1 
206d : 18 __ __ CLC
206e : 69 d4 __ ADC #$d4
2070 : 85 20 __ STA ADDR + 1 
2072 : a5 11 __ LDA P4 ; (sc + 0)
2074 : a0 00 __ LDY #$00
2076 : 91 4a __ STA (T3 + 0),y 
2078 : a5 13 __ LDA P6 ; (color + 0)
207a : 91 1f __ STA (ADDR + 0),y 
.s10:
207c : a5 53 __ LDA T12 + 0 
207e : c9 0a __ CMP #$0a
2080 : b0 03 __ BCS $2085 ; (draw_hand.s3 + 0)
2082 : 4c 2a 1f JMP $1f2a ; (draw_hand.l5 + 0)
.s3:
2085 : ad d8 9f LDA $9fd8 ; (draw_hand@stack + 0)
2088 : 85 53 __ STA T12 + 0 
208a : 60 __ __ RTS
--------------------------------------------------------------------
208b : __ __ __ BYT 68 6f 6e 64 61 6e 69 00                         : hondani.
--------------------------------------------------------------------
2093 : __ __ __ BYT 25 30 32 64 2f 25 30 32 64 2f 25 30 34 64 00    : %02d/%02d/%04d.
--------------------------------------------------------------------
20a2 : __ __ __ BYT 25 30 32 64 3a 25 30 32 64 3a 25 30 32 64 00    : %02d:%02d:%02d.
--------------------------------------------------------------------
mul32by8: ; mul32by8
20b1 : a0 00 __ LDY #$00
20b3 : 84 07 __ STY WORK + 4 
20b5 : 84 08 __ STY WORK + 5 
20b7 : 84 09 __ STY WORK + 6 
20b9 : 4a __ __ LSR
20ba : b0 0d __ BCS $20c9 ; (mul32by8 + 24)
20bc : f0 26 __ BEQ $20e4 ; (mul32by8 + 51)
20be : 06 1b __ ASL ACCU + 0 
20c0 : 26 1c __ ROL ACCU + 1 
20c2 : 26 1d __ ROL ACCU + 2 
20c4 : 26 1e __ ROL ACCU + 3 
20c6 : 4a __ __ LSR
20c7 : 90 f5 __ BCC $20be ; (mul32by8 + 13)
20c9 : aa __ __ TAX
20ca : 18 __ __ CLC
20cb : a5 07 __ LDA WORK + 4 
20cd : 65 1b __ ADC ACCU + 0 
20cf : 85 07 __ STA WORK + 4 
20d1 : a5 08 __ LDA WORK + 5 
20d3 : 65 1c __ ADC ACCU + 1 
20d5 : 85 08 __ STA WORK + 5 
20d7 : a5 09 __ LDA WORK + 6 
20d9 : 65 1d __ ADC ACCU + 2 
20db : 85 09 __ STA WORK + 6 
20dd : 98 __ __ TYA
20de : 65 1e __ ADC ACCU + 3 
20e0 : a8 __ __ TAY
20e1 : 8a __ __ TXA
20e2 : d0 da __ BNE $20be ; (mul32by8 + 13)
20e4 : 84 0a __ STY WORK + 7 
20e6 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
20e7 : b1 19 __ LDA (IP + 0),y 
20e9 : c8 __ __ INY
20ea : aa __ __ TAX
20eb : b5 00 __ LDA $00,x 
20ed : 85 03 __ STA WORK + 0 
20ef : b5 01 __ LDA $01,x 
20f1 : 85 04 __ STA WORK + 1 
20f3 : b5 02 __ LDA $02,x 
20f5 : 85 05 __ STA WORK + 2 
20f7 : b5 03 __ LDA WORK + 0,x 
20f9 : 85 06 __ STA WORK + 3 
20fb : a5 05 __ LDA WORK + 2 
20fd : 0a __ __ ASL
20fe : a5 06 __ LDA WORK + 3 
2100 : 2a __ __ ROL
2101 : 85 08 __ STA WORK + 5 
2103 : f0 06 __ BEQ $210b ; (freg + 36)
2105 : a5 05 __ LDA WORK + 2 
2107 : 09 80 __ ORA #$80
2109 : 85 05 __ STA WORK + 2 
210b : a5 1d __ LDA ACCU + 2 
210d : 0a __ __ ASL
210e : a5 1e __ LDA ACCU + 3 
2110 : 2a __ __ ROL
2111 : 85 07 __ STA WORK + 4 
2113 : f0 06 __ BEQ $211b ; (freg + 52)
2115 : a5 1d __ LDA ACCU + 2 
2117 : 09 80 __ ORA #$80
2119 : 85 1d __ STA ACCU + 2 
211b : 60 __ __ RTS
211c : 06 1e __ ASL ACCU + 3 
211e : a5 07 __ LDA WORK + 4 
2120 : 6a __ __ ROR
2121 : 85 1e __ STA ACCU + 3 
2123 : b0 06 __ BCS $212b ; (freg + 68)
2125 : a5 1d __ LDA ACCU + 2 
2127 : 29 7f __ AND #$7f
2129 : 85 1d __ STA ACCU + 2 
212b : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
212c : a5 06 __ LDA WORK + 3 
212e : 49 80 __ EOR #$80
2130 : 85 06 __ STA WORK + 3 
2132 : a9 ff __ LDA #$ff
2134 : c5 07 __ CMP WORK + 4 
2136 : f0 04 __ BEQ $213c ; (faddsub + 16)
2138 : c5 08 __ CMP WORK + 5 
213a : d0 11 __ BNE $214d ; (faddsub + 33)
213c : a5 1e __ LDA ACCU + 3 
213e : 09 7f __ ORA #$7f
2140 : 85 1e __ STA ACCU + 3 
2142 : a9 80 __ LDA #$80
2144 : 85 1d __ STA ACCU + 2 
2146 : a9 00 __ LDA #$00
2148 : 85 1b __ STA ACCU + 0 
214a : 85 1c __ STA ACCU + 1 
214c : 60 __ __ RTS
214d : 38 __ __ SEC
214e : a5 07 __ LDA WORK + 4 
2150 : e5 08 __ SBC WORK + 5 
2152 : f0 38 __ BEQ $218c ; (faddsub + 96)
2154 : aa __ __ TAX
2155 : b0 25 __ BCS $217c ; (faddsub + 80)
2157 : e0 e9 __ CPX #$e9
2159 : b0 0e __ BCS $2169 ; (faddsub + 61)
215b : a5 08 __ LDA WORK + 5 
215d : 85 07 __ STA WORK + 4 
215f : a9 00 __ LDA #$00
2161 : 85 1b __ STA ACCU + 0 
2163 : 85 1c __ STA ACCU + 1 
2165 : 85 1d __ STA ACCU + 2 
2167 : f0 23 __ BEQ $218c ; (faddsub + 96)
2169 : a5 1d __ LDA ACCU + 2 
216b : 4a __ __ LSR
216c : 66 1c __ ROR ACCU + 1 
216e : 66 1b __ ROR ACCU + 0 
2170 : e8 __ __ INX
2171 : d0 f8 __ BNE $216b ; (faddsub + 63)
2173 : 85 1d __ STA ACCU + 2 
2175 : a5 08 __ LDA WORK + 5 
2177 : 85 07 __ STA WORK + 4 
2179 : 4c 8c 21 JMP $218c ; (faddsub + 96)
217c : e0 18 __ CPX #$18
217e : b0 33 __ BCS $21b3 ; (faddsub + 135)
2180 : a5 05 __ LDA WORK + 2 
2182 : 4a __ __ LSR
2183 : 66 04 __ ROR WORK + 1 
2185 : 66 03 __ ROR WORK + 0 
2187 : ca __ __ DEX
2188 : d0 f8 __ BNE $2182 ; (faddsub + 86)
218a : 85 05 __ STA WORK + 2 
218c : a5 1e __ LDA ACCU + 3 
218e : 29 80 __ AND #$80
2190 : 85 1e __ STA ACCU + 3 
2192 : 45 06 __ EOR WORK + 3 
2194 : 30 31 __ BMI $21c7 ; (faddsub + 155)
2196 : 18 __ __ CLC
2197 : a5 1b __ LDA ACCU + 0 
2199 : 65 03 __ ADC WORK + 0 
219b : 85 1b __ STA ACCU + 0 
219d : a5 1c __ LDA ACCU + 1 
219f : 65 04 __ ADC WORK + 1 
21a1 : 85 1c __ STA ACCU + 1 
21a3 : a5 1d __ LDA ACCU + 2 
21a5 : 65 05 __ ADC WORK + 2 
21a7 : 85 1d __ STA ACCU + 2 
21a9 : 90 08 __ BCC $21b3 ; (faddsub + 135)
21ab : 66 1d __ ROR ACCU + 2 
21ad : 66 1c __ ROR ACCU + 1 
21af : 66 1b __ ROR ACCU + 0 
21b1 : e6 07 __ INC WORK + 4 
21b3 : a5 07 __ LDA WORK + 4 
21b5 : c9 ff __ CMP #$ff
21b7 : f0 83 __ BEQ $213c ; (faddsub + 16)
21b9 : 4a __ __ LSR
21ba : 05 1e __ ORA ACCU + 3 
21bc : 85 1e __ STA ACCU + 3 
21be : b0 06 __ BCS $21c6 ; (faddsub + 154)
21c0 : a5 1d __ LDA ACCU + 2 
21c2 : 29 7f __ AND #$7f
21c4 : 85 1d __ STA ACCU + 2 
21c6 : 60 __ __ RTS
21c7 : 38 __ __ SEC
21c8 : a5 1b __ LDA ACCU + 0 
21ca : e5 03 __ SBC WORK + 0 
21cc : 85 1b __ STA ACCU + 0 
21ce : a5 1c __ LDA ACCU + 1 
21d0 : e5 04 __ SBC WORK + 1 
21d2 : 85 1c __ STA ACCU + 1 
21d4 : a5 1d __ LDA ACCU + 2 
21d6 : e5 05 __ SBC WORK + 2 
21d8 : 85 1d __ STA ACCU + 2 
21da : b0 19 __ BCS $21f5 ; (faddsub + 201)
21dc : 38 __ __ SEC
21dd : a9 00 __ LDA #$00
21df : e5 1b __ SBC ACCU + 0 
21e1 : 85 1b __ STA ACCU + 0 
21e3 : a9 00 __ LDA #$00
21e5 : e5 1c __ SBC ACCU + 1 
21e7 : 85 1c __ STA ACCU + 1 
21e9 : a9 00 __ LDA #$00
21eb : e5 1d __ SBC ACCU + 2 
21ed : 85 1d __ STA ACCU + 2 
21ef : a5 1e __ LDA ACCU + 3 
21f1 : 49 80 __ EOR #$80
21f3 : 85 1e __ STA ACCU + 3 
21f5 : a5 1d __ LDA ACCU + 2 
21f7 : 30 ba __ BMI $21b3 ; (faddsub + 135)
21f9 : 05 1c __ ORA ACCU + 1 
21fb : 05 1b __ ORA ACCU + 0 
21fd : f0 0f __ BEQ $220e ; (faddsub + 226)
21ff : c6 07 __ DEC WORK + 4 
2201 : f0 0b __ BEQ $220e ; (faddsub + 226)
2203 : 06 1b __ ASL ACCU + 0 
2205 : 26 1c __ ROL ACCU + 1 
2207 : 26 1d __ ROL ACCU + 2 
2209 : 10 f4 __ BPL $21ff ; (faddsub + 211)
220b : 4c b3 21 JMP $21b3 ; (faddsub + 135)
220e : a9 00 __ LDA #$00
2210 : 85 1b __ STA ACCU + 0 
2212 : 85 1c __ STA ACCU + 1 
2214 : 85 1d __ STA ACCU + 2 
2216 : 85 1e __ STA ACCU + 3 
2218 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
2219 : a5 1b __ LDA ACCU + 0 
221b : 05 1c __ ORA ACCU + 1 
221d : 05 1d __ ORA ACCU + 2 
221f : f0 0e __ BEQ $222f ; (crt_fmul + 22)
2221 : a5 03 __ LDA WORK + 0 
2223 : 05 04 __ ORA WORK + 1 
2225 : 05 05 __ ORA WORK + 2 
2227 : d0 09 __ BNE $2232 ; (crt_fmul + 25)
2229 : 85 1b __ STA ACCU + 0 
222b : 85 1c __ STA ACCU + 1 
222d : 85 1d __ STA ACCU + 2 
222f : 85 1e __ STA ACCU + 3 
2231 : 60 __ __ RTS
2232 : a5 1e __ LDA ACCU + 3 
2234 : 45 06 __ EOR WORK + 3 
2236 : 29 80 __ AND #$80
2238 : 85 1e __ STA ACCU + 3 
223a : a9 ff __ LDA #$ff
223c : c5 07 __ CMP WORK + 4 
223e : f0 42 __ BEQ $2282 ; (crt_fmul + 105)
2240 : c5 08 __ CMP WORK + 5 
2242 : f0 3e __ BEQ $2282 ; (crt_fmul + 105)
2244 : a9 00 __ LDA #$00
2246 : 85 09 __ STA WORK + 6 
2248 : 85 0a __ STA WORK + 7 
224a : 85 0b __ STA WORK + 8 
224c : a4 1b __ LDY ACCU + 0 
224e : a5 03 __ LDA WORK + 0 
2250 : d0 06 __ BNE $2258 ; (crt_fmul + 63)
2252 : a5 04 __ LDA WORK + 1 
2254 : f0 0a __ BEQ $2260 ; (crt_fmul + 71)
2256 : d0 05 __ BNE $225d ; (crt_fmul + 68)
2258 : 20 b3 22 JSR $22b3 ; (crt_fmul8 + 0)
225b : a5 04 __ LDA WORK + 1 
225d : 20 b3 22 JSR $22b3 ; (crt_fmul8 + 0)
2260 : a5 05 __ LDA WORK + 2 
2262 : 20 b3 22 JSR $22b3 ; (crt_fmul8 + 0)
2265 : 38 __ __ SEC
2266 : a5 0b __ LDA WORK + 8 
2268 : 30 06 __ BMI $2270 ; (crt_fmul + 87)
226a : 06 09 __ ASL WORK + 6 
226c : 26 0a __ ROL WORK + 7 
226e : 2a __ __ ROL
226f : 18 __ __ CLC
2270 : 29 7f __ AND #$7f
2272 : 85 0b __ STA WORK + 8 
2274 : a5 07 __ LDA WORK + 4 
2276 : 65 08 __ ADC WORK + 5 
2278 : 90 19 __ BCC $2293 ; (crt_fmul + 122)
227a : e9 7f __ SBC #$7f
227c : b0 04 __ BCS $2282 ; (crt_fmul + 105)
227e : c9 ff __ CMP #$ff
2280 : d0 15 __ BNE $2297 ; (crt_fmul + 126)
2282 : a5 1e __ LDA ACCU + 3 
2284 : 09 7f __ ORA #$7f
2286 : 85 1e __ STA ACCU + 3 
2288 : a9 80 __ LDA #$80
228a : 85 1d __ STA ACCU + 2 
228c : a9 00 __ LDA #$00
228e : 85 1b __ STA ACCU + 0 
2290 : 85 1c __ STA ACCU + 1 
2292 : 60 __ __ RTS
2293 : e9 7e __ SBC #$7e
2295 : 90 15 __ BCC $22ac ; (crt_fmul + 147)
2297 : 4a __ __ LSR
2298 : 05 1e __ ORA ACCU + 3 
229a : 85 1e __ STA ACCU + 3 
229c : a9 00 __ LDA #$00
229e : 6a __ __ ROR
229f : 05 0b __ ORA WORK + 8 
22a1 : 85 1d __ STA ACCU + 2 
22a3 : a5 0a __ LDA WORK + 7 
22a5 : 85 1c __ STA ACCU + 1 
22a7 : a5 09 __ LDA WORK + 6 
22a9 : 85 1b __ STA ACCU + 0 
22ab : 60 __ __ RTS
22ac : a9 00 __ LDA #$00
22ae : 85 1e __ STA ACCU + 3 
22b0 : f0 d8 __ BEQ $228a ; (crt_fmul + 113)
22b2 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
22b3 : 38 __ __ SEC
22b4 : 6a __ __ ROR
22b5 : 90 1e __ BCC $22d5 ; (crt_fmul8 + 34)
22b7 : aa __ __ TAX
22b8 : 18 __ __ CLC
22b9 : 98 __ __ TYA
22ba : 65 09 __ ADC WORK + 6 
22bc : 85 09 __ STA WORK + 6 
22be : a5 0a __ LDA WORK + 7 
22c0 : 65 1c __ ADC ACCU + 1 
22c2 : 85 0a __ STA WORK + 7 
22c4 : a5 0b __ LDA WORK + 8 
22c6 : 65 1d __ ADC ACCU + 2 
22c8 : 6a __ __ ROR
22c9 : 85 0b __ STA WORK + 8 
22cb : 8a __ __ TXA
22cc : 66 0a __ ROR WORK + 7 
22ce : 66 09 __ ROR WORK + 6 
22d0 : 4a __ __ LSR
22d1 : f0 0d __ BEQ $22e0 ; (crt_fmul8 + 45)
22d3 : b0 e2 __ BCS $22b7 ; (crt_fmul8 + 4)
22d5 : 66 0b __ ROR WORK + 8 
22d7 : 66 0a __ ROR WORK + 7 
22d9 : 66 09 __ ROR WORK + 6 
22db : 4a __ __ LSR
22dc : 90 f7 __ BCC $22d5 ; (crt_fmul8 + 34)
22de : d0 d7 __ BNE $22b7 ; (crt_fmul8 + 4)
22e0 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
22e1 : a5 1b __ LDA ACCU + 0 
22e3 : 05 1c __ ORA ACCU + 1 
22e5 : 05 1d __ ORA ACCU + 2 
22e7 : d0 03 __ BNE $22ec ; (crt_fdiv + 11)
22e9 : 85 1e __ STA ACCU + 3 
22eb : 60 __ __ RTS
22ec : a5 1e __ LDA ACCU + 3 
22ee : 45 06 __ EOR WORK + 3 
22f0 : 29 80 __ AND #$80
22f2 : 85 1e __ STA ACCU + 3 
22f4 : a5 08 __ LDA WORK + 5 
22f6 : f0 62 __ BEQ $235a ; (crt_fdiv + 121)
22f8 : a5 07 __ LDA WORK + 4 
22fa : c9 ff __ CMP #$ff
22fc : f0 5c __ BEQ $235a ; (crt_fdiv + 121)
22fe : a9 00 __ LDA #$00
2300 : 85 09 __ STA WORK + 6 
2302 : 85 0a __ STA WORK + 7 
2304 : 85 0b __ STA WORK + 8 
2306 : a2 18 __ LDX #$18
2308 : a5 1b __ LDA ACCU + 0 
230a : c5 03 __ CMP WORK + 0 
230c : a5 1c __ LDA ACCU + 1 
230e : e5 04 __ SBC WORK + 1 
2310 : a5 1d __ LDA ACCU + 2 
2312 : e5 05 __ SBC WORK + 2 
2314 : 90 13 __ BCC $2329 ; (crt_fdiv + 72)
2316 : a5 1b __ LDA ACCU + 0 
2318 : e5 03 __ SBC WORK + 0 
231a : 85 1b __ STA ACCU + 0 
231c : a5 1c __ LDA ACCU + 1 
231e : e5 04 __ SBC WORK + 1 
2320 : 85 1c __ STA ACCU + 1 
2322 : a5 1d __ LDA ACCU + 2 
2324 : e5 05 __ SBC WORK + 2 
2326 : 85 1d __ STA ACCU + 2 
2328 : 38 __ __ SEC
2329 : 26 09 __ ROL WORK + 6 
232b : 26 0a __ ROL WORK + 7 
232d : 26 0b __ ROL WORK + 8 
232f : ca __ __ DEX
2330 : f0 0a __ BEQ $233c ; (crt_fdiv + 91)
2332 : 06 1b __ ASL ACCU + 0 
2334 : 26 1c __ ROL ACCU + 1 
2336 : 26 1d __ ROL ACCU + 2 
2338 : b0 dc __ BCS $2316 ; (crt_fdiv + 53)
233a : 90 cc __ BCC $2308 ; (crt_fdiv + 39)
233c : 38 __ __ SEC
233d : a5 0b __ LDA WORK + 8 
233f : 30 06 __ BMI $2347 ; (crt_fdiv + 102)
2341 : 06 09 __ ASL WORK + 6 
2343 : 26 0a __ ROL WORK + 7 
2345 : 2a __ __ ROL
2346 : 18 __ __ CLC
2347 : 29 7f __ AND #$7f
2349 : 85 0b __ STA WORK + 8 
234b : a5 07 __ LDA WORK + 4 
234d : e5 08 __ SBC WORK + 5 
234f : 90 1a __ BCC $236b ; (crt_fdiv + 138)
2351 : 18 __ __ CLC
2352 : 69 7f __ ADC #$7f
2354 : b0 04 __ BCS $235a ; (crt_fdiv + 121)
2356 : c9 ff __ CMP #$ff
2358 : d0 15 __ BNE $236f ; (crt_fdiv + 142)
235a : a5 1e __ LDA ACCU + 3 
235c : 09 7f __ ORA #$7f
235e : 85 1e __ STA ACCU + 3 
2360 : a9 80 __ LDA #$80
2362 : 85 1d __ STA ACCU + 2 
2364 : a9 00 __ LDA #$00
2366 : 85 1c __ STA ACCU + 1 
2368 : 85 1b __ STA ACCU + 0 
236a : 60 __ __ RTS
236b : 69 7f __ ADC #$7f
236d : 90 15 __ BCC $2384 ; (crt_fdiv + 163)
236f : 4a __ __ LSR
2370 : 05 1e __ ORA ACCU + 3 
2372 : 85 1e __ STA ACCU + 3 
2374 : a9 00 __ LDA #$00
2376 : 6a __ __ ROR
2377 : 05 0b __ ORA WORK + 8 
2379 : 85 1d __ STA ACCU + 2 
237b : a5 0a __ LDA WORK + 7 
237d : 85 1c __ STA ACCU + 1 
237f : a5 09 __ LDA WORK + 6 
2381 : 85 1b __ STA ACCU + 0 
2383 : 60 __ __ RTS
2384 : a9 00 __ LDA #$00
2386 : 85 1e __ STA ACCU + 3 
2388 : 85 1d __ STA ACCU + 2 
238a : 85 1c __ STA ACCU + 1 
238c : 85 1b __ STA ACCU + 0 
238e : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
238f : 24 1c __ BIT ACCU + 1 
2391 : 10 0d __ BPL $23a0 ; (divs16 + 17)
2393 : 20 ad 23 JSR $23ad ; (negaccu + 0)
2396 : 24 04 __ BIT WORK + 1 
2398 : 10 0d __ BPL $23a7 ; (divs16 + 24)
239a : 20 bb 23 JSR $23bb ; (negtmp + 0)
239d : 4c c9 23 JMP $23c9 ; (divmod + 0)
23a0 : 24 04 __ BIT WORK + 1 
23a2 : 10 f9 __ BPL $239d ; (divs16 + 14)
23a4 : 20 bb 23 JSR $23bb ; (negtmp + 0)
23a7 : 20 c9 23 JSR $23c9 ; (divmod + 0)
23aa : 4c ad 23 JMP $23ad ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
23ad : 38 __ __ SEC
23ae : a9 00 __ LDA #$00
23b0 : e5 1b __ SBC ACCU + 0 
23b2 : 85 1b __ STA ACCU + 0 
23b4 : a9 00 __ LDA #$00
23b6 : e5 1c __ SBC ACCU + 1 
23b8 : 85 1c __ STA ACCU + 1 
23ba : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
23bb : 38 __ __ SEC
23bc : a9 00 __ LDA #$00
23be : e5 03 __ SBC WORK + 0 
23c0 : 85 03 __ STA WORK + 0 
23c2 : a9 00 __ LDA #$00
23c4 : e5 04 __ SBC WORK + 1 
23c6 : 85 04 __ STA WORK + 1 
23c8 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
23c9 : a5 1c __ LDA ACCU + 1 
23cb : d0 31 __ BNE $23fe ; (divmod + 53)
23cd : a5 04 __ LDA WORK + 1 
23cf : d0 1e __ BNE $23ef ; (divmod + 38)
23d1 : 85 06 __ STA WORK + 3 
23d3 : a2 04 __ LDX #$04
23d5 : 06 1b __ ASL ACCU + 0 
23d7 : 2a __ __ ROL
23d8 : c5 03 __ CMP WORK + 0 
23da : 90 02 __ BCC $23de ; (divmod + 21)
23dc : e5 03 __ SBC WORK + 0 
23de : 26 1b __ ROL ACCU + 0 
23e0 : 2a __ __ ROL
23e1 : c5 03 __ CMP WORK + 0 
23e3 : 90 02 __ BCC $23e7 ; (divmod + 30)
23e5 : e5 03 __ SBC WORK + 0 
23e7 : 26 1b __ ROL ACCU + 0 
23e9 : ca __ __ DEX
23ea : d0 eb __ BNE $23d7 ; (divmod + 14)
23ec : 85 05 __ STA WORK + 2 
23ee : 60 __ __ RTS
23ef : a5 1b __ LDA ACCU + 0 
23f1 : 85 05 __ STA WORK + 2 
23f3 : a5 1c __ LDA ACCU + 1 
23f5 : 85 06 __ STA WORK + 3 
23f7 : a9 00 __ LDA #$00
23f9 : 85 1b __ STA ACCU + 0 
23fb : 85 1c __ STA ACCU + 1 
23fd : 60 __ __ RTS
23fe : a5 04 __ LDA WORK + 1 
2400 : d0 1f __ BNE $2421 ; (divmod + 88)
2402 : a5 03 __ LDA WORK + 0 
2404 : 30 1b __ BMI $2421 ; (divmod + 88)
2406 : a9 00 __ LDA #$00
2408 : 85 06 __ STA WORK + 3 
240a : a2 10 __ LDX #$10
240c : 06 1b __ ASL ACCU + 0 
240e : 26 1c __ ROL ACCU + 1 
2410 : 2a __ __ ROL
2411 : c5 03 __ CMP WORK + 0 
2413 : 90 02 __ BCC $2417 ; (divmod + 78)
2415 : e5 03 __ SBC WORK + 0 
2417 : 26 1b __ ROL ACCU + 0 
2419 : 26 1c __ ROL ACCU + 1 
241b : ca __ __ DEX
241c : d0 f2 __ BNE $2410 ; (divmod + 71)
241e : 85 05 __ STA WORK + 2 
2420 : 60 __ __ RTS
2421 : a9 00 __ LDA #$00
2423 : 85 05 __ STA WORK + 2 
2425 : 85 06 __ STA WORK + 3 
2427 : 84 02 __ STY $02 
2429 : a0 10 __ LDY #$10
242b : 18 __ __ CLC
242c : 26 1b __ ROL ACCU + 0 
242e : 26 1c __ ROL ACCU + 1 
2430 : 26 05 __ ROL WORK + 2 
2432 : 26 06 __ ROL WORK + 3 
2434 : 38 __ __ SEC
2435 : a5 05 __ LDA WORK + 2 
2437 : e5 03 __ SBC WORK + 0 
2439 : aa __ __ TAX
243a : a5 06 __ LDA WORK + 3 
243c : e5 04 __ SBC WORK + 1 
243e : 90 04 __ BCC $2444 ; (divmod + 123)
2440 : 86 05 __ STX WORK + 2 
2442 : 85 06 __ STA WORK + 3 
2444 : 88 __ __ DEY
2445 : d0 e5 __ BNE $242c ; (divmod + 99)
2447 : 26 1b __ ROL ACCU + 0 
2449 : 26 1c __ ROL ACCU + 1 
244b : a4 02 __ LDY $02 
244d : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
244e : 24 1c __ BIT ACCU + 1 
2450 : 10 10 __ BPL $2462 ; (mods16 + 20)
2452 : 20 ad 23 JSR $23ad ; (negaccu + 0)
2455 : 24 04 __ BIT WORK + 1 
2457 : 10 03 __ BPL $245c ; (mods16 + 14)
2459 : 20 bb 23 JSR $23bb ; (negtmp + 0)
245c : 20 c9 23 JSR $23c9 ; (divmod + 0)
245f : 4c 6d 24 JMP $246d ; (negtmpb + 0)
2462 : 24 04 __ BIT WORK + 1 
2464 : 10 03 __ BPL $2469 ; (mods16 + 27)
2466 : 20 bb 23 JSR $23bb ; (negtmp + 0)
2469 : 4c c9 23 JMP $23c9 ; (divmod + 0)
246c : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
246d : 38 __ __ SEC
246e : a9 00 __ LDA #$00
2470 : e5 05 __ SBC WORK + 2 
2472 : 85 05 __ STA WORK + 2 
2474 : a9 00 __ LDA #$00
2476 : e5 06 __ SBC WORK + 3 
2478 : 85 06 __ STA WORK + 3 
247a : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
247b : 20 0b 21 JSR $210b ; (freg + 36)
247e : a5 07 __ LDA WORK + 4 
2480 : c9 7f __ CMP #$7f
2482 : b0 07 __ BCS $248b ; (f32_to_i16 + 16)
2484 : a9 00 __ LDA #$00
2486 : 85 1b __ STA ACCU + 0 
2488 : 85 1c __ STA ACCU + 1 
248a : 60 __ __ RTS
248b : e9 8e __ SBC #$8e
248d : 90 16 __ BCC $24a5 ; (f32_to_i16 + 42)
248f : 24 1e __ BIT ACCU + 3 
2491 : 30 09 __ BMI $249c ; (f32_to_i16 + 33)
2493 : a9 ff __ LDA #$ff
2495 : 85 1b __ STA ACCU + 0 
2497 : a9 7f __ LDA #$7f
2499 : 85 1c __ STA ACCU + 1 
249b : 60 __ __ RTS
249c : a9 00 __ LDA #$00
249e : 85 1b __ STA ACCU + 0 
24a0 : a9 80 __ LDA #$80
24a2 : 85 1c __ STA ACCU + 1 
24a4 : 60 __ __ RTS
24a5 : aa __ __ TAX
24a6 : a5 1c __ LDA ACCU + 1 
24a8 : 46 1d __ LSR ACCU + 2 
24aa : 6a __ __ ROR
24ab : e8 __ __ INX
24ac : d0 fa __ BNE $24a8 ; (f32_to_i16 + 45)
24ae : 24 1e __ BIT ACCU + 3 
24b0 : 10 0e __ BPL $24c0 ; (f32_to_i16 + 69)
24b2 : 38 __ __ SEC
24b3 : 49 ff __ EOR #$ff
24b5 : 69 00 __ ADC #$00
24b7 : 85 1b __ STA ACCU + 0 
24b9 : a9 00 __ LDA #$00
24bb : e5 1d __ SBC ACCU + 2 
24bd : 85 1c __ STA ACCU + 1 
24bf : 60 __ __ RTS
24c0 : 85 1b __ STA ACCU + 0 
24c2 : a5 1d __ LDA ACCU + 2 
24c4 : 85 1c __ STA ACCU + 1 
24c6 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
24c7 : 24 1c __ BIT ACCU + 1 
24c9 : 30 03 __ BMI $24ce ; (sint16_to_float + 7)
24cb : 4c e5 24 JMP $24e5 ; (uint16_to_float + 0)
24ce : 38 __ __ SEC
24cf : a9 00 __ LDA #$00
24d1 : e5 1b __ SBC ACCU + 0 
24d3 : 85 1b __ STA ACCU + 0 
24d5 : a9 00 __ LDA #$00
24d7 : e5 1c __ SBC ACCU + 1 
24d9 : 85 1c __ STA ACCU + 1 
24db : 20 e5 24 JSR $24e5 ; (uint16_to_float + 0)
24de : a5 1e __ LDA ACCU + 3 
24e0 : 09 80 __ ORA #$80
24e2 : 85 1e __ STA ACCU + 3 
24e4 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
24e5 : a5 1b __ LDA ACCU + 0 
24e7 : 05 1c __ ORA ACCU + 1 
24e9 : d0 05 __ BNE $24f0 ; (uint16_to_float + 11)
24eb : 85 1d __ STA ACCU + 2 
24ed : 85 1e __ STA ACCU + 3 
24ef : 60 __ __ RTS
24f0 : a2 8e __ LDX #$8e
24f2 : a5 1c __ LDA ACCU + 1 
24f4 : 30 06 __ BMI $24fc ; (uint16_to_float + 23)
24f6 : ca __ __ DEX
24f7 : 06 1b __ ASL ACCU + 0 
24f9 : 2a __ __ ROL
24fa : 10 fa __ BPL $24f6 ; (uint16_to_float + 17)
24fc : 0a __ __ ASL
24fd : 85 1d __ STA ACCU + 2 
24ff : a5 1b __ LDA ACCU + 0 
2501 : 85 1c __ STA ACCU + 1 
2503 : 8a __ __ TXA
2504 : 4a __ __ LSR
2505 : 85 1e __ STA ACCU + 3 
2507 : a9 00 __ LDA #$00
2509 : 85 1b __ STA ACCU + 0 
250b : 66 1d __ ROR ACCU + 2 
250d : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
250e : a5 04 __ LDA WORK + 1 
2510 : 05 05 __ ORA WORK + 2 
2512 : 05 06 __ ORA WORK + 3 
2514 : d0 05 __ BNE $251b ; (mul32 + 13)
2516 : a5 03 __ LDA WORK + 0 
2518 : 4c b1 20 JMP $20b1 ; (mul32by8 + 0)
251b : a0 00 __ LDY #$00
251d : 84 07 __ STY WORK + 4 
251f : 84 08 __ STY WORK + 5 
2521 : 98 __ __ TYA
2522 : 38 __ __ SEC
2523 : 66 03 __ ROR WORK + 0 
2525 : 90 15 __ BCC $253c ; (mul32 + 46)
2527 : aa __ __ TAX
2528 : 18 __ __ CLC
2529 : a5 07 __ LDA WORK + 4 
252b : 65 1b __ ADC ACCU + 0 
252d : 85 07 __ STA WORK + 4 
252f : a5 08 __ LDA WORK + 5 
2531 : 65 1c __ ADC ACCU + 1 
2533 : 85 08 __ STA WORK + 5 
2535 : 98 __ __ TYA
2536 : 65 1d __ ADC ACCU + 2 
2538 : a8 __ __ TAY
2539 : 8a __ __ TXA
253a : 65 1e __ ADC ACCU + 3 
253c : 46 04 __ LSR WORK + 1 
253e : 90 0f __ BCC $254f ; (mul32 + 65)
2540 : aa __ __ TAX
2541 : 18 __ __ CLC
2542 : a5 08 __ LDA WORK + 5 
2544 : 65 1b __ ADC ACCU + 0 
2546 : 85 08 __ STA WORK + 5 
2548 : 98 __ __ TYA
2549 : 65 1c __ ADC ACCU + 1 
254b : a8 __ __ TAY
254c : 8a __ __ TXA
254d : 65 1d __ ADC ACCU + 2 
254f : 46 05 __ LSR WORK + 2 
2551 : 90 09 __ BCC $255c ; (mul32 + 78)
2553 : aa __ __ TAX
2554 : 18 __ __ CLC
2555 : 98 __ __ TYA
2556 : 65 1b __ ADC ACCU + 0 
2558 : a8 __ __ TAY
2559 : 8a __ __ TXA
255a : 65 1c __ ADC ACCU + 1 
255c : 46 06 __ LSR WORK + 3 
255e : 90 03 __ BCC $2563 ; (mul32 + 85)
2560 : 18 __ __ CLC
2561 : 65 1b __ ADC ACCU + 0 
2563 : 06 1b __ ASL ACCU + 0 
2565 : 26 1c __ ROL ACCU + 1 
2567 : 26 1d __ ROL ACCU + 2 
2569 : 26 1e __ ROL ACCU + 3 
256b : 46 03 __ LSR WORK + 0 
256d : 90 cd __ BCC $253c ; (mul32 + 46)
256f : d0 b6 __ BNE $2527 ; (mul32 + 25)
2571 : 84 09 __ STY WORK + 6 
2573 : 85 0a __ STA WORK + 7 
2575 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
2576 : 24 1e __ BIT ACCU + 3 
2578 : 10 0d __ BPL $2587 ; (divs32 + 17)
257a : 20 94 25 JSR $2594 ; (negaccu32 + 0)
257d : 24 06 __ BIT WORK + 3 
257f : 10 0d __ BPL $258e ; (divs32 + 24)
2581 : 20 ae 25 JSR $25ae ; (negtmp32 + 0)
2584 : 4c c8 25 JMP $25c8 ; (divmod32 + 0)
2587 : 24 06 __ BIT WORK + 3 
2589 : 10 f9 __ BPL $2584 ; (divs32 + 14)
258b : 20 ae 25 JSR $25ae ; (negtmp32 + 0)
258e : 20 c8 25 JSR $25c8 ; (divmod32 + 0)
2591 : 4c 94 25 JMP $2594 ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
2594 : 38 __ __ SEC
2595 : a9 00 __ LDA #$00
2597 : e5 1b __ SBC ACCU + 0 
2599 : 85 1b __ STA ACCU + 0 
259b : a9 00 __ LDA #$00
259d : e5 1c __ SBC ACCU + 1 
259f : 85 1c __ STA ACCU + 1 
25a1 : a9 00 __ LDA #$00
25a3 : e5 1d __ SBC ACCU + 2 
25a5 : 85 1d __ STA ACCU + 2 
25a7 : a9 00 __ LDA #$00
25a9 : e5 1e __ SBC ACCU + 3 
25ab : 85 1e __ STA ACCU + 3 
25ad : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
25ae : 38 __ __ SEC
25af : a9 00 __ LDA #$00
25b1 : e5 03 __ SBC WORK + 0 
25b3 : 85 03 __ STA WORK + 0 
25b5 : a9 00 __ LDA #$00
25b7 : e5 04 __ SBC WORK + 1 
25b9 : 85 04 __ STA WORK + 1 
25bb : a9 00 __ LDA #$00
25bd : e5 05 __ SBC WORK + 2 
25bf : 85 05 __ STA WORK + 2 
25c1 : a9 00 __ LDA #$00
25c3 : e5 06 __ SBC WORK + 3 
25c5 : 85 06 __ STA WORK + 3 
25c7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
25c8 : 84 02 __ STY $02 
25ca : a0 20 __ LDY #$20
25cc : a9 00 __ LDA #$00
25ce : 85 07 __ STA WORK + 4 
25d0 : 85 08 __ STA WORK + 5 
25d2 : 85 09 __ STA WORK + 6 
25d4 : 85 0a __ STA WORK + 7 
25d6 : a5 05 __ LDA WORK + 2 
25d8 : 05 06 __ ORA WORK + 3 
25da : d0 78 __ BNE $2654 ; (divmod32 + 140)
25dc : a5 04 __ LDA WORK + 1 
25de : d0 27 __ BNE $2607 ; (divmod32 + 63)
25e0 : 18 __ __ CLC
25e1 : 26 1b __ ROL ACCU + 0 
25e3 : 26 1c __ ROL ACCU + 1 
25e5 : 26 1d __ ROL ACCU + 2 
25e7 : 26 1e __ ROL ACCU + 3 
25e9 : 2a __ __ ROL
25ea : 90 05 __ BCC $25f1 ; (divmod32 + 41)
25ec : e5 03 __ SBC WORK + 0 
25ee : 38 __ __ SEC
25ef : b0 06 __ BCS $25f7 ; (divmod32 + 47)
25f1 : c5 03 __ CMP WORK + 0 
25f3 : 90 02 __ BCC $25f7 ; (divmod32 + 47)
25f5 : e5 03 __ SBC WORK + 0 
25f7 : 88 __ __ DEY
25f8 : d0 e7 __ BNE $25e1 ; (divmod32 + 25)
25fa : 85 07 __ STA WORK + 4 
25fc : 26 1b __ ROL ACCU + 0 
25fe : 26 1c __ ROL ACCU + 1 
2600 : 26 1d __ ROL ACCU + 2 
2602 : 26 1e __ ROL ACCU + 3 
2604 : a4 02 __ LDY $02 
2606 : 60 __ __ RTS
2607 : a5 1e __ LDA ACCU + 3 
2609 : d0 10 __ BNE $261b ; (divmod32 + 83)
260b : a6 1d __ LDX ACCU + 2 
260d : 86 1e __ STX ACCU + 3 
260f : a6 1c __ LDX ACCU + 1 
2611 : 86 1d __ STX ACCU + 2 
2613 : a6 1b __ LDX ACCU + 0 
2615 : 86 1c __ STX ACCU + 1 
2617 : 85 1b __ STA ACCU + 0 
2619 : a0 18 __ LDY #$18
261b : 18 __ __ CLC
261c : 26 1b __ ROL ACCU + 0 
261e : 26 1c __ ROL ACCU + 1 
2620 : 26 1d __ ROL ACCU + 2 
2622 : 26 1e __ ROL ACCU + 3 
2624 : 26 07 __ ROL WORK + 4 
2626 : 26 08 __ ROL WORK + 5 
2628 : 90 0c __ BCC $2636 ; (divmod32 + 110)
262a : a5 07 __ LDA WORK + 4 
262c : e5 03 __ SBC WORK + 0 
262e : aa __ __ TAX
262f : a5 08 __ LDA WORK + 5 
2631 : e5 04 __ SBC WORK + 1 
2633 : 38 __ __ SEC
2634 : b0 0c __ BCS $2642 ; (divmod32 + 122)
2636 : 38 __ __ SEC
2637 : a5 07 __ LDA WORK + 4 
2639 : e5 03 __ SBC WORK + 0 
263b : aa __ __ TAX
263c : a5 08 __ LDA WORK + 5 
263e : e5 04 __ SBC WORK + 1 
2640 : 90 04 __ BCC $2646 ; (divmod32 + 126)
2642 : 86 07 __ STX WORK + 4 
2644 : 85 08 __ STA WORK + 5 
2646 : 88 __ __ DEY
2647 : d0 d3 __ BNE $261c ; (divmod32 + 84)
2649 : 26 1b __ ROL ACCU + 0 
264b : 26 1c __ ROL ACCU + 1 
264d : 26 1d __ ROL ACCU + 2 
264f : 26 1e __ ROL ACCU + 3 
2651 : a4 02 __ LDY $02 
2653 : 60 __ __ RTS
2654 : a0 10 __ LDY #$10
2656 : a5 1e __ LDA ACCU + 3 
2658 : 85 08 __ STA WORK + 5 
265a : a5 1d __ LDA ACCU + 2 
265c : 85 07 __ STA WORK + 4 
265e : a9 00 __ LDA #$00
2660 : 85 1d __ STA ACCU + 2 
2662 : 85 1e __ STA ACCU + 3 
2664 : 18 __ __ CLC
2665 : 26 1b __ ROL ACCU + 0 
2667 : 26 1c __ ROL ACCU + 1 
2669 : 26 07 __ ROL WORK + 4 
266b : 26 08 __ ROL WORK + 5 
266d : 26 09 __ ROL WORK + 6 
266f : 26 0a __ ROL WORK + 7 
2671 : a5 07 __ LDA WORK + 4 
2673 : c5 03 __ CMP WORK + 0 
2675 : a5 08 __ LDA WORK + 5 
2677 : e5 04 __ SBC WORK + 1 
2679 : a5 09 __ LDA WORK + 6 
267b : e5 05 __ SBC WORK + 2 
267d : aa __ __ TAX
267e : a5 0a __ LDA WORK + 7 
2680 : e5 06 __ SBC WORK + 3 
2682 : 90 11 __ BCC $2695 ; (divmod32 + 205)
2684 : 86 09 __ STX WORK + 6 
2686 : 85 0a __ STA WORK + 7 
2688 : a5 07 __ LDA WORK + 4 
268a : e5 03 __ SBC WORK + 0 
268c : 85 07 __ STA WORK + 4 
268e : a5 08 __ LDA WORK + 5 
2690 : e5 04 __ SBC WORK + 1 
2692 : 85 08 __ STA WORK + 5 
2694 : 38 __ __ SEC
2695 : 88 __ __ DEY
2696 : d0 cd __ BNE $2665 ; (divmod32 + 157)
2698 : 26 1b __ ROL ACCU + 0 
269a : 26 1c __ ROL ACCU + 1 
269c : a4 02 __ LDY $02 
269e : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
269f : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
26a0 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
26a1 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
26b1 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
poem:
26bd : __ __ __ BYT c7 19 d8 19 e8 19 f9 19 0a 1a 1b 1a 2c 1a 3d 1a : ............,.=.
26cd : __ __ __ BYT 4e 1a 5f 1a 70 1a 81 1a 92 1a a3 1a b4 1a c5 1a : N._.p...........
26dd : __ __ __ BYT d6 1a e7 1a f8 1a 09 1b 1a 1b 2b 1b 3c 1b 4d 1b : ..........+.<.M.
26ed : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
tick_x:
26ef : __ __ __ BYT 1c 20 24 25 24 20 1c 18 14 13 14 17             : . $%$ ......
--------------------------------------------------------------------
uii_target:
26fb : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
statusreg:
26fc : __ __ __ BYT 1c df                                           : ..
--------------------------------------------------------------------
cmddatareg:
26fe : __ __ __ BYT 1d df                                           : ..
--------------------------------------------------------------------
ring_x:
2700 : __ __ __ BYT 25 25 25 25 24 24 24 23 23 22 22 21 20 20 1f 1e : %%%%$$$##""!  ..
2710 : __ __ __ BYT 1e 1d 1c 1b 1a 1a 19 18 18 17 16 16 15 15 14 14 : ................
2720 : __ __ __ BYT 14 13 13 13 13 13 13 13 14 14 14 15 15 16 16 17 : ................
2730 : __ __ __ BYT 17 18 19 1a 1a 1b 1c 1d 1e 1e 1f 20 20 21 22 22 : ...........  !""
2740 : __ __ __ BYT 23 23 24 24 24 25 25 25                         : ##$$$%%%
--------------------------------------------------------------------
ring_y:
2748 : __ __ __ BYT 0c 0d 0e 0f 0f 10 11 12 12 13 14 14 15 15 15 16 : ................
2758 : __ __ __ BYT 16 16 16 16 16 16 15 15 15 14 14 13 12 12 11 10 : ................
2768 : __ __ __ BYT 0f 0f 0e 0d 0c 0b 0a 09 09 08 07 06 06 05 04 04 : ................
2778 : __ __ __ BYT 03 03 03 02 02 02 02 02 02 02 03 03 03 04 04 05 : ................
2788 : __ __ __ BYT 06 06 07 08 09 09 0a 0b                         : ........
--------------------------------------------------------------------
tick_y:
2790 : __ __ __ BYT 02 03 07 0c 11 15 16 15 11 0c 07 03             : ............
--------------------------------------------------------------------
controlreg:
279c : __ __ __ BYT 1c df                                           : ..
--------------------------------------------------------------------
respdatareg:
279e : __ __ __ BYT 1e df                                           : ..
--------------------------------------------------------------------
statusdatareg:
27a0 : __ __ __ BYT 1f df                                           : ..
--------------------------------------------------------------------
old_valid:
27a2 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
cos60:
27a4 : __ __ __ BYT 64 63 62 5f 5b 57 51 4a 43 3b 32 29 1f 15 0a 00 : dcb_[WQJC;2)....
27b4 : __ __ __ BYT f6 eb e1 d7 ce c5 bd b6 af a9 a5 a1 9e 9d 9c 9d : ................
27c4 : __ __ __ BYT 9e a1 a5 a9 af b6 bd c5 ce d7 e1 eb f6 00 0a 15 : ................
27d4 : __ __ __ BYT 1f 29 32 3b 43 4a 51 57 5b 5f 62 63             : .)2;CJQW[_bc
--------------------------------------------------------------------
old_hx:
27e0 : __ __ __ BSS	30
--------------------------------------------------------------------
sin60:
2800 : __ __ __ BYT 00 0a 15 1f 29 32 3b 43 4a 51 57 5b 5f 62 63 64 : ....)2;CJQW[_bcd
2810 : __ __ __ BYT 63 62 5f 5b 57 51 4a 43 3b 32 29 1f 15 0a 00 f6 : cb_[WQJC;2).....
2820 : __ __ __ BYT eb e1 d7 ce c5 bd b6 af a9 a5 a1 9e 9d 9c 9d 9e : ................
2830 : __ __ __ BYT a1 a5 a9 af b6 bd c5 ce d7 e1 eb f6             : ............
--------------------------------------------------------------------
uii_data:
283c : __ __ __ BSS	1792
--------------------------------------------------------------------
old_hy:
2f3c : __ __ __ BSS	30
--------------------------------------------------------------------
uii_status:
3000 : __ __ __ BSS	256
