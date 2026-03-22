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
080e : 8e 5d 0e STX $0e5d ; (spentry + 0)
0811 : a2 0e __ LDX #$0e
0813 : a0 6f __ LDY #$6f
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0e __ CPX #$0e
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 6f __ CPY #$6f
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 ec __ LDA #$ec
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
;  24, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbmulti.c"
.s1:
0880 : a2 0e __ LDX #$0e
0882 : b5 53 __ LDA T4 + 0,x 
0884 : 9d ee 9f STA $9fee,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 17 0b JSR $0b17 ; (mmap_trampoline.s4 + 0)
088d : a9 00 __ LDA #$00
088f : 85 0e __ STA P1 
0891 : 85 10 __ STA P3 
0893 : a9 35 __ LDA #$35
0895 : 85 01 __ STA $01 
0897 : a9 04 __ LDA #$04
0899 : 85 0d __ STA P0 
089b : a9 c8 __ LDA #$c8
089d : 85 0f __ STA P2 
089f : a9 e0 __ LDA #$e0
08a1 : 85 11 __ STA P4 
08a3 : 20 61 0b JSR $0b61 ; (vic_setmode.s4 + 0)
08a6 : a9 00 __ LDA #$00
08a8 : 8d 21 d0 STA $d021 
08ab : 85 0d __ STA P0 
08ad : 85 0f __ STA P2 
08af : a9 e0 __ LDA #$e0
08b1 : 85 0e __ STA P1 
08b3 : a9 1f __ LDA #$1f
08b5 : 85 12 __ STA P5 
08b7 : a9 40 __ LDA #$40
08b9 : 85 11 __ STA P4 
08bb : 20 b3 0b JSR $0bb3 ; (memset.s4 + 0)
08be : a9 27 __ LDA #$27
08c0 : a2 fa __ LDX #$fa
.l6:
08c2 : ca __ __ DEX
08c3 : 9d 00 c8 STA $c800,x 
08c6 : 9d fa c8 STA $c8fa,x 
08c9 : 9d f4 c9 STA $c9f4,x 
08cc : 9d ee ca STA $caee,x 
08cf : d0 f1 __ BNE $08c2 ; (main.l6 + 0)
.s5:
08d1 : a9 03 __ LDA #$03
08d3 : a2 fa __ LDX #$fa
.l8:
08d5 : ca __ __ DEX
08d6 : 9d 00 d8 STA $d800,x 
08d9 : 9d fa d8 STA $d8fa,x 
08dc : 9d f4 d9 STA $d9f4,x 
08df : 9d ee da STA $daee,x 
08e2 : d0 f1 __ BNE $08d5 ; (main.l8 + 0)
.s7:
08e4 : a9 00 __ LDA #$00
08e6 : 85 5f __ STA T7 + 0 
.l9:
08e8 : 85 1b __ STA ACCU + 0 
08ea : a9 00 __ LDA #$00
08ec : 85 1c __ STA ACCU + 1 
08ee : 20 0f 0e JSR $0e0f ; (sint16_to_float + 0)
08f1 : a9 a6 __ LDA #$a6
08f3 : 85 03 __ STA WORK + 0 
08f5 : a9 3c __ LDA #$3c
08f7 : 85 06 __ STA WORK + 3 
08f9 : a9 9b __ LDA #$9b
08fb : 85 04 __ STA WORK + 1 
08fd : a9 c4 __ LDA #$c4
08ff : 85 05 __ STA WORK + 2 
0901 : 20 29 0c JSR $0c29 ; (freg + 20)
0904 : 20 47 0d JSR $0d47 ; (crt_fmul + 0)
0907 : a9 99 __ LDA #$99
0909 : 85 04 __ STA WORK + 1 
090b : 85 05 __ STA WORK + 2 
090d : a9 9a __ LDA #$9a
090f : 85 03 __ STA WORK + 0 
0911 : a9 bf __ LDA #$bf
0913 : 85 06 __ STA WORK + 3 
0915 : 20 29 0c JSR $0c29 ; (freg + 20)
0918 : 20 60 0c JSR $0c60 ; (faddsub + 6)
091b : a5 1b __ LDA ACCU + 0 
091d : 85 43 __ STA T0 + 0 
091f : a5 1c __ LDA ACCU + 1 
0921 : 85 44 __ STA T0 + 1 
0923 : a5 1d __ LDA ACCU + 2 
0925 : 85 45 __ STA T0 + 2 
0927 : a5 1e __ LDA ACCU + 3 
0929 : 85 46 __ STA T0 + 3 
092b : a9 00 __ LDA #$00
092d : 85 60 __ STA T8 + 0 
.l10:
092f : 85 1b __ STA ACCU + 0 
0931 : a9 00 __ LDA #$00
0933 : 85 1c __ STA ACCU + 1 
0935 : 20 0f 0e JSR $0e0f ; (sint16_to_float + 0)
0938 : a9 33 __ LDA #$33
093a : 85 03 __ STA WORK + 0 
093c : 85 04 __ STA WORK + 1 
093e : a9 b3 __ LDA #$b3
0940 : 85 05 __ STA WORK + 2 
0942 : a9 3c __ LDA #$3c
0944 : 85 06 __ STA WORK + 3 
0946 : 20 29 0c JSR $0c29 ; (freg + 20)
0949 : 20 47 0d JSR $0d47 ; (crt_fmul + 0)
094c : a9 00 __ LDA #$00
094e : 85 03 __ STA WORK + 0 
0950 : 85 04 __ STA WORK + 1 
0952 : a9 20 __ LDA #$20
0954 : 85 05 __ STA WORK + 2 
0956 : a9 c0 __ LDA #$c0
0958 : 85 06 __ STA WORK + 3 
095a : 20 29 0c JSR $0c29 ; (freg + 20)
095d : 20 60 0c JSR $0c60 ; (faddsub + 6)
0960 : a5 1b __ LDA ACCU + 0 
0962 : 85 47 __ STA T1 + 0 
0964 : a5 1c __ LDA ACCU + 1 
0966 : 85 48 __ STA T1 + 1 
0968 : a5 1d __ LDA ACCU + 2 
096a : 85 49 __ STA T1 + 2 
096c : a5 1e __ LDA ACCU + 3 
096e : 85 4a __ STA T1 + 3 
0970 : a9 00 __ LDA #$00
0972 : 85 4b __ STA T2 + 0 
0974 : 85 4c __ STA T2 + 1 
0976 : 85 4d __ STA T2 + 2 
0978 : 85 4e __ STA T2 + 3 
097a : 85 4f __ STA T3 + 0 
097c : 85 50 __ STA T3 + 1 
097e : 85 51 __ STA T3 + 2 
0980 : 85 52 __ STA T3 + 3 
0982 : 85 61 __ STA T9 + 0 
.l11:
0984 : a5 4b __ LDA T2 + 0 
0986 : 85 1b __ STA ACCU + 0 
0988 : a5 4c __ LDA T2 + 1 
098a : 85 1c __ STA ACCU + 1 
098c : a5 4d __ LDA T2 + 2 
098e : 85 1d __ STA ACCU + 2 
0990 : a5 4e __ LDA T2 + 3 
0992 : 85 1e __ STA ACCU + 3 
0994 : a2 4b __ LDX #$4b
0996 : 20 19 0c JSR $0c19 ; (freg + 4)
0999 : 20 47 0d JSR $0d47 ; (crt_fmul + 0)
099c : a5 1b __ LDA ACCU + 0 
099e : 85 53 __ STA T4 + 0 
09a0 : a5 1c __ LDA ACCU + 1 
09a2 : 85 54 __ STA T4 + 1 
09a4 : a5 1d __ LDA ACCU + 2 
09a6 : 85 55 __ STA T4 + 2 
09a8 : a5 1e __ LDA ACCU + 3 
09aa : 85 56 __ STA T4 + 3 
09ac : a5 4f __ LDA T3 + 0 
09ae : 85 1b __ STA ACCU + 0 
09b0 : a5 50 __ LDA T3 + 1 
09b2 : 85 1c __ STA ACCU + 1 
09b4 : a5 51 __ LDA T3 + 2 
09b6 : 85 1d __ STA ACCU + 2 
09b8 : a5 52 __ LDA T3 + 3 
09ba : 85 1e __ STA ACCU + 3 
09bc : a2 4f __ LDX #$4f
09be : 20 19 0c JSR $0c19 ; (freg + 4)
09c1 : 20 47 0d JSR $0d47 ; (crt_fmul + 0)
09c4 : a5 1b __ LDA ACCU + 0 
09c6 : 85 57 __ STA T5 + 0 
09c8 : a5 1c __ LDA ACCU + 1 
09ca : 85 58 __ STA T5 + 1 
09cc : a5 1d __ LDA ACCU + 2 
09ce : 85 59 __ STA T5 + 2 
09d0 : a5 1e __ LDA ACCU + 3 
09d2 : 85 5a __ STA T5 + 3 
09d4 : a2 53 __ LDX #$53
09d6 : 20 19 0c JSR $0c19 ; (freg + 4)
09d9 : 20 60 0c JSR $0c60 ; (faddsub + 6)
09dc : a5 1e __ LDA ACCU + 3 
09de : 30 63 __ BMI $0a43 ; (main.s12 + 0)
.s17:
09e0 : c9 40 __ CMP #$40
09e2 : d0 0e __ BNE $09f2 ; (main.s21 + 0)
.s18:
09e4 : a5 1d __ LDA ACCU + 2 
09e6 : c9 80 __ CMP #$80
09e8 : d0 08 __ BNE $09f2 ; (main.s21 + 0)
.s19:
09ea : a5 1c __ LDA ACCU + 1 
09ec : d0 04 __ BNE $09f2 ; (main.s21 + 0)
.s20:
09ee : a5 1b __ LDA ACCU + 0 
09f0 : f0 51 __ BEQ $0a43 ; (main.s12 + 0)
.s21:
09f2 : 90 4f __ BCC $0a43 ; (main.s12 + 0)
.s16:
09f4 : a5 5f __ LDA T7 + 0 
09f6 : 29 03 __ AND #$03
09f8 : 0a __ __ ASL
09f9 : 85 47 __ STA T1 + 0 
09fb : a5 5f __ LDA T7 + 0 
09fd : 29 7c __ AND #$7c
09ff : 85 4b __ STA T2 + 0 
0a01 : 4a __ __ LSR
0a02 : 4a __ __ LSR
0a03 : 65 4b __ ADC T2 + 0 
0a05 : 4a __ __ LSR
0a06 : 6a __ __ ROR
0a07 : aa __ __ TAX
0a08 : 29 80 __ AND #$80
0a0a : 6a __ __ ROR
0a0b : 05 47 __ ORA T1 + 0 
0a0d : 85 4b __ STA T2 + 0 
0a0f : a5 60 __ LDA T8 + 0 
0a11 : 29 fc __ AND #$fc
0a13 : 0a __ __ ASL
0a14 : a8 __ __ TAY
0a15 : 8a __ __ TXA
0a16 : 29 3f __ AND #$3f
0a18 : 69 e0 __ ADC #$e0
0a1a : 85 4c __ STA T2 + 1 
0a1c : a5 60 __ LDA T8 + 0 
0a1e : 29 03 __ AND #$03
0a20 : 0a __ __ ASL
0a21 : aa __ __ TAX
0a22 : bd 56 0e LDA $0e56,x ; (__shrtab192L + 0)
0a25 : 85 4f __ STA T3 + 0 
0a27 : a5 61 __ LDA T9 + 0 
0a29 : 29 07 __ AND #$07
0a2b : 0a __ __ ASL
0a2c : aa __ __ TAX
0a2d : bd 5e 0e LDA $0e5e,x ; (colors[0] + 0)
0a30 : 25 4f __ AND T3 + 0 
0a32 : 11 4b __ ORA (T2 + 0),y 
0a34 : 91 4b __ STA (T2 + 0),y 
0a36 : bd 5f 0e LDA $0e5f,x ; (colors[0] + 1)
0a39 : 25 4f __ AND T3 + 0 
0a3b : c8 __ __ INY
0a3c : 11 4b __ ORA (T2 + 0),y 
0a3e : 91 4b __ STA (T2 + 0),y 
0a40 : 4c d6 0a JMP $0ad6 ; (main.s13 + 0)
.s12:
0a43 : a5 4b __ LDA T2 + 0 
0a45 : 85 1b __ STA ACCU + 0 
0a47 : a5 4c __ LDA T2 + 1 
0a49 : 85 1c __ STA ACCU + 1 
0a4b : a5 4d __ LDA T2 + 2 
0a4d : 85 1d __ STA ACCU + 2 
0a4f : a5 4e __ LDA T2 + 3 
0a51 : 85 1e __ STA ACCU + 3 
0a53 : a2 4b __ LDX #$4b
0a55 : 20 19 0c JSR $0c19 ; (freg + 4)
0a58 : 20 60 0c JSR $0c60 ; (faddsub + 6)
0a5b : a5 1b __ LDA ACCU + 0 
0a5d : 85 5b __ STA T6 + 0 
0a5f : a5 1c __ LDA ACCU + 1 
0a61 : 85 5c __ STA T6 + 1 
0a63 : a5 1d __ LDA ACCU + 2 
0a65 : 85 5d __ STA T6 + 2 
0a67 : a5 1e __ LDA ACCU + 3 
0a69 : 85 5e __ STA T6 + 3 
0a6b : a5 53 __ LDA T4 + 0 
0a6d : 85 1b __ STA ACCU + 0 
0a6f : a5 54 __ LDA T4 + 1 
0a71 : 85 1c __ STA ACCU + 1 
0a73 : a5 55 __ LDA T4 + 2 
0a75 : 85 1d __ STA ACCU + 2 
0a77 : a5 56 __ LDA T4 + 3 
0a79 : 85 1e __ STA ACCU + 3 
0a7b : a2 57 __ LDX #$57
0a7d : 20 19 0c JSR $0c19 ; (freg + 4)
0a80 : 20 5a 0c JSR $0c5a ; (faddsub + 0)
0a83 : a2 47 __ LDX #$47
0a85 : 20 19 0c JSR $0c19 ; (freg + 4)
0a88 : 20 60 0c JSR $0c60 ; (faddsub + 6)
0a8b : a5 1b __ LDA ACCU + 0 
0a8d : 85 4b __ STA T2 + 0 
0a8f : a5 1c __ LDA ACCU + 1 
0a91 : 85 4c __ STA T2 + 1 
0a93 : a5 1d __ LDA ACCU + 2 
0a95 : 85 4d __ STA T2 + 2 
0a97 : a5 1e __ LDA ACCU + 3 
0a99 : 85 4e __ STA T2 + 3 
0a9b : a5 4f __ LDA T3 + 0 
0a9d : 85 1b __ STA ACCU + 0 
0a9f : a5 50 __ LDA T3 + 1 
0aa1 : 85 1c __ STA ACCU + 1 
0aa3 : a5 51 __ LDA T3 + 2 
0aa5 : 85 1d __ STA ACCU + 2 
0aa7 : a5 52 __ LDA T3 + 3 
0aa9 : 85 1e __ STA ACCU + 3 
0aab : a2 5b __ LDX #$5b
0aad : 20 19 0c JSR $0c19 ; (freg + 4)
0ab0 : 20 47 0d JSR $0d47 ; (crt_fmul + 0)
0ab3 : a2 43 __ LDX #$43
0ab5 : 20 19 0c JSR $0c19 ; (freg + 4)
0ab8 : 20 60 0c JSR $0c60 ; (faddsub + 6)
0abb : a5 1b __ LDA ACCU + 0 
0abd : 85 4f __ STA T3 + 0 
0abf : a5 1c __ LDA ACCU + 1 
0ac1 : 85 50 __ STA T3 + 1 
0ac3 : a5 1d __ LDA ACCU + 2 
0ac5 : 85 51 __ STA T3 + 2 
0ac7 : a5 1e __ LDA ACCU + 3 
0ac9 : 85 52 __ STA T3 + 3 
0acb : e6 61 __ INC T9 + 0 
0acd : a5 61 __ LDA T9 + 0 
0acf : c9 20 __ CMP #$20
0ad1 : b0 03 __ BCS $0ad6 ; (main.s13 + 0)
0ad3 : 4c 84 09 JMP $0984 ; (main.l11 + 0)
.s13:
0ad6 : e6 60 __ INC T8 + 0 
0ad8 : a5 60 __ LDA T8 + 0 
0ada : c9 a0 __ CMP #$a0
0adc : b0 03 __ BCS $0ae1 ; (main.s14 + 0)
0ade : 4c 2f 09 JMP $092f ; (main.l10 + 0)
.s14:
0ae1 : e6 5f __ INC T7 + 0 
0ae3 : a5 5f __ LDA T7 + 0 
0ae5 : c9 64 __ CMP #$64
0ae7 : b0 03 __ BCS $0aec ; (main.s15 + 0)
0ae9 : 4c e8 08 JMP $08e8 ; (main.l9 + 0)
.s15:
0aec : a9 36 __ LDA #$36
0aee : 85 01 __ STA $01 
0af0 : 20 d7 0b JSR $0bd7 ; (getch.l4 + 0)
0af3 : a9 00 __ LDA #$00
0af5 : 85 0d __ STA P0 
0af7 : 85 0e __ STA P1 
0af9 : 85 10 __ STA P3 
0afb : a9 04 __ LDA #$04
0afd : 85 0f __ STA P2 
0aff : a9 10 __ LDA #$10
0b01 : 85 11 __ STA P4 
0b03 : 20 61 0b JSR $0b61 ; (vic_setmode.s4 + 0)
0b06 : a9 00 __ LDA #$00
0b08 : 85 1b __ STA ACCU + 0 
0b0a : 85 1c __ STA ACCU + 1 
.s3:
0b0c : a2 0e __ LDX #$0e
0b0e : bd ee 9f LDA $9fee,x ; (main@stack + 0)
0b11 : 95 53 __ STA T4 + 0,x 
0b13 : ca __ __ DEX
0b14 : 10 f8 __ BPL $0b0e ; (main.s3 + 2)
0b16 : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0b17 : a9 2c __ LDA #$2c
0b19 : 8d fa ff STA $fffa 
0b1c : a9 0b __ LDA #$0b
0b1e : 8d fb ff STA $fffb 
0b21 : a9 4a __ LDA #$4a
0b23 : 8d fe ff STA $fffe 
0b26 : a9 0b __ LDA #$0b
0b28 : 8d ff ff STA $ffff 
.s3:
0b2b : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0b2c : 48 __ __ PHA
0b2d : 8a __ __ TXA
0b2e : 48 __ __ PHA
0b2f : a9 0b __ LDA #$0b
0b31 : 48 __ __ PHA
0b32 : a9 43 __ LDA #$43
0b34 : 48 __ __ PHA
0b35 : ba __ __ TSX
0b36 : bd 05 01 LDA $0105,x 
0b39 : 48 __ __ PHA
0b3a : a6 01 __ LDX $01 
0b3c : a9 36 __ LDA #$36
0b3e : 85 01 __ STA $01 
0b40 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0b43 : 86 01 __ STX $01 
0b45 : 68 __ __ PLA
0b46 : aa __ __ TAX
0b47 : 68 __ __ PLA
0b48 : 40 __ __ RTI
0b49 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0b4a : 48 __ __ PHA
0b4b : 8a __ __ TXA
0b4c : 48 __ __ PHA
0b4d : a9 0b __ LDA #$0b
0b4f : 48 __ __ PHA
0b50 : a9 43 __ LDA #$43
0b52 : 48 __ __ PHA
0b53 : ba __ __ TSX
0b54 : bd 05 01 LDA $0105,x 
0b57 : 48 __ __ PHA
0b58 : a6 01 __ LDX $01 
0b5a : a9 36 __ LDA #$36
0b5c : 85 01 __ STA $01 
0b5e : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0b61 : a4 0d __ LDY P0 ; (mode + 0)
0b63 : c0 02 __ CPY #$02
0b65 : d0 09 __ BNE $0b70 ; (vic_setmode.s5 + 0)
.s10:
0b67 : a9 5b __ LDA #$5b
0b69 : 8d 11 d0 STA $d011 
.s8:
0b6c : a9 08 __ LDA #$08
0b6e : d0 0c __ BNE $0b7c ; (vic_setmode.s7 + 0)
.s5:
0b70 : b0 36 __ BCS $0ba8 ; (vic_setmode.s6 + 0)
.s9:
0b72 : a9 1b __ LDA #$1b
0b74 : 8d 11 d0 STA $d011 
0b77 : 98 __ __ TYA
0b78 : f0 f2 __ BEQ $0b6c ; (vic_setmode.s8 + 0)
.s11:
0b7a : a9 18 __ LDA #$18
.s7:
0b7c : 8d 16 d0 STA $d016 
0b7f : ad 00 dd LDA $dd00 
0b82 : 29 fc __ AND #$fc
0b84 : 85 1b __ STA ACCU + 0 
0b86 : a5 0f __ LDA P2 ; (text + 1)
0b88 : 0a __ __ ASL
0b89 : 2a __ __ ROL
0b8a : 29 01 __ AND #$01
0b8c : 2a __ __ ROL
0b8d : 49 03 __ EOR #$03
0b8f : 05 1b __ ORA ACCU + 0 
0b91 : 8d 00 dd STA $dd00 
0b94 : a5 0f __ LDA P2 ; (text + 1)
0b96 : 29 3c __ AND #$3c
0b98 : 0a __ __ ASL
0b99 : 0a __ __ ASL
0b9a : 85 1b __ STA ACCU + 0 
0b9c : a5 11 __ LDA P4 ; (font + 1)
0b9e : 29 38 __ AND #$38
0ba0 : 4a __ __ LSR
0ba1 : 4a __ __ LSR
0ba2 : 05 1b __ ORA ACCU + 0 
0ba4 : 8d 18 d0 STA $d018 
.s3:
0ba7 : 60 __ __ RTS
.s6:
0ba8 : a9 3b __ LDA #$3b
0baa : 8d 11 d0 STA $d011 
0bad : c0 03 __ CPY #$03
0baf : d0 c9 __ BNE $0b7a ; (vic_setmode.s11 + 0)
0bb1 : f0 b9 __ BEQ $0b6c ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0bb3 : a5 0f __ LDA P2 
0bb5 : a6 12 __ LDX P5 
0bb7 : f0 0c __ BEQ $0bc5 ; (memset.s4 + 18)
0bb9 : a0 00 __ LDY #$00
0bbb : 91 0d __ STA (P0),y ; (dst + 0)
0bbd : c8 __ __ INY
0bbe : d0 fb __ BNE $0bbb ; (memset.s4 + 8)
0bc0 : e6 0e __ INC P1 ; (dst + 1)
0bc2 : ca __ __ DEX
0bc3 : d0 f6 __ BNE $0bbb ; (memset.s4 + 8)
0bc5 : a4 11 __ LDY P4 
0bc7 : f0 05 __ BEQ $0bce ; (memset.s4 + 27)
0bc9 : 88 __ __ DEY
0bca : 91 0d __ STA (P0),y ; (dst + 0)
0bcc : d0 fb __ BNE $0bc9 ; (memset.s4 + 22)
0bce : a5 0d __ LDA P0 ; (dst + 0)
0bd0 : 85 1b __ STA ACCU + 0 
0bd2 : a5 0e __ LDA P1 ; (dst + 1)
0bd4 : 85 1c __ STA ACCU + 1 
.s3:
0bd6 : 60 __ __ RTS
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
0bd7 : 20 e4 ff JSR $ffe4 
0bda : 85 1b __ STA ACCU + 0 
0bdc : a5 1b __ LDA ACCU + 0 
0bde : f0 f7 __ BEQ $0bd7 ; (getch.l4 + 0)
.s5:
0be0 : 4c e3 0b JMP $0be3 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
0be3 : a8 __ __ TAY
0be4 : ad 6e 0e LDA $0e6e ; (giocharmap + 0)
0be7 : f0 27 __ BEQ $0c10 ; (convch.s5 + 0)
.s6:
0be9 : c0 0d __ CPY #$0d
0beb : d0 03 __ BNE $0bf0 ; (convch.s7 + 0)
.s16:
0bed : a9 0a __ LDA #$0a
.s3:
0bef : 60 __ __ RTS
.s7:
0bf0 : c9 02 __ CMP #$02
0bf2 : 90 1c __ BCC $0c10 ; (convch.s5 + 0)
.s8:
0bf4 : 98 __ __ TYA
0bf5 : c0 41 __ CPY #$41
0bf7 : 90 17 __ BCC $0c10 ; (convch.s5 + 0)
.s9:
0bf9 : c9 db __ CMP #$db
0bfb : b0 13 __ BCS $0c10 ; (convch.s5 + 0)
.s10:
0bfd : c9 c1 __ CMP #$c1
0bff : 90 03 __ BCC $0c04 ; (convch.s11 + 0)
.s15:
0c01 : 49 a0 __ EOR #$a0
0c03 : a8 __ __ TAY
.s11:
0c04 : c9 7b __ CMP #$7b
0c06 : b0 08 __ BCS $0c10 ; (convch.s5 + 0)
.s12:
0c08 : c9 61 __ CMP #$61
0c0a : b0 06 __ BCS $0c12 ; (convch.s14 + 0)
.s13:
0c0c : c9 5b __ CMP #$5b
0c0e : 90 02 __ BCC $0c12 ; (convch.s14 + 0)
.s5:
0c10 : 98 __ __ TYA
0c11 : 60 __ __ RTS
.s14:
0c12 : 49 20 __ EOR #$20
0c14 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
0c15 : b1 19 __ LDA (IP + 0),y 
0c17 : c8 __ __ INY
0c18 : aa __ __ TAX
0c19 : b5 00 __ LDA $00,x 
0c1b : 85 03 __ STA WORK + 0 
0c1d : b5 01 __ LDA $01,x 
0c1f : 85 04 __ STA WORK + 1 
0c21 : b5 02 __ LDA $02,x 
0c23 : 85 05 __ STA WORK + 2 
0c25 : b5 03 __ LDA WORK + 0,x 
0c27 : 85 06 __ STA WORK + 3 
0c29 : a5 05 __ LDA WORK + 2 
0c2b : 0a __ __ ASL
0c2c : a5 06 __ LDA WORK + 3 
0c2e : 2a __ __ ROL
0c2f : 85 08 __ STA WORK + 5 
0c31 : f0 06 __ BEQ $0c39 ; (freg + 36)
0c33 : a5 05 __ LDA WORK + 2 
0c35 : 09 80 __ ORA #$80
0c37 : 85 05 __ STA WORK + 2 
0c39 : a5 1d __ LDA ACCU + 2 
0c3b : 0a __ __ ASL
0c3c : a5 1e __ LDA ACCU + 3 
0c3e : 2a __ __ ROL
0c3f : 85 07 __ STA WORK + 4 
0c41 : f0 06 __ BEQ $0c49 ; (freg + 52)
0c43 : a5 1d __ LDA ACCU + 2 
0c45 : 09 80 __ ORA #$80
0c47 : 85 1d __ STA ACCU + 2 
0c49 : 60 __ __ RTS
0c4a : 06 1e __ ASL ACCU + 3 
0c4c : a5 07 __ LDA WORK + 4 
0c4e : 6a __ __ ROR
0c4f : 85 1e __ STA ACCU + 3 
0c51 : b0 06 __ BCS $0c59 ; (freg + 68)
0c53 : a5 1d __ LDA ACCU + 2 
0c55 : 29 7f __ AND #$7f
0c57 : 85 1d __ STA ACCU + 2 
0c59 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
0c5a : a5 06 __ LDA WORK + 3 
0c5c : 49 80 __ EOR #$80
0c5e : 85 06 __ STA WORK + 3 
0c60 : a9 ff __ LDA #$ff
0c62 : c5 07 __ CMP WORK + 4 
0c64 : f0 04 __ BEQ $0c6a ; (faddsub + 16)
0c66 : c5 08 __ CMP WORK + 5 
0c68 : d0 11 __ BNE $0c7b ; (faddsub + 33)
0c6a : a5 1e __ LDA ACCU + 3 
0c6c : 09 7f __ ORA #$7f
0c6e : 85 1e __ STA ACCU + 3 
0c70 : a9 80 __ LDA #$80
0c72 : 85 1d __ STA ACCU + 2 
0c74 : a9 00 __ LDA #$00
0c76 : 85 1b __ STA ACCU + 0 
0c78 : 85 1c __ STA ACCU + 1 
0c7a : 60 __ __ RTS
0c7b : 38 __ __ SEC
0c7c : a5 07 __ LDA WORK + 4 
0c7e : e5 08 __ SBC WORK + 5 
0c80 : f0 38 __ BEQ $0cba ; (faddsub + 96)
0c82 : aa __ __ TAX
0c83 : b0 25 __ BCS $0caa ; (faddsub + 80)
0c85 : e0 e9 __ CPX #$e9
0c87 : b0 0e __ BCS $0c97 ; (faddsub + 61)
0c89 : a5 08 __ LDA WORK + 5 
0c8b : 85 07 __ STA WORK + 4 
0c8d : a9 00 __ LDA #$00
0c8f : 85 1b __ STA ACCU + 0 
0c91 : 85 1c __ STA ACCU + 1 
0c93 : 85 1d __ STA ACCU + 2 
0c95 : f0 23 __ BEQ $0cba ; (faddsub + 96)
0c97 : a5 1d __ LDA ACCU + 2 
0c99 : 4a __ __ LSR
0c9a : 66 1c __ ROR ACCU + 1 
0c9c : 66 1b __ ROR ACCU + 0 
0c9e : e8 __ __ INX
0c9f : d0 f8 __ BNE $0c99 ; (faddsub + 63)
0ca1 : 85 1d __ STA ACCU + 2 
0ca3 : a5 08 __ LDA WORK + 5 
0ca5 : 85 07 __ STA WORK + 4 
0ca7 : 4c ba 0c JMP $0cba ; (faddsub + 96)
0caa : e0 18 __ CPX #$18
0cac : b0 33 __ BCS $0ce1 ; (faddsub + 135)
0cae : a5 05 __ LDA WORK + 2 
0cb0 : 4a __ __ LSR
0cb1 : 66 04 __ ROR WORK + 1 
0cb3 : 66 03 __ ROR WORK + 0 
0cb5 : ca __ __ DEX
0cb6 : d0 f8 __ BNE $0cb0 ; (faddsub + 86)
0cb8 : 85 05 __ STA WORK + 2 
0cba : a5 1e __ LDA ACCU + 3 
0cbc : 29 80 __ AND #$80
0cbe : 85 1e __ STA ACCU + 3 
0cc0 : 45 06 __ EOR WORK + 3 
0cc2 : 30 31 __ BMI $0cf5 ; (faddsub + 155)
0cc4 : 18 __ __ CLC
0cc5 : a5 1b __ LDA ACCU + 0 
0cc7 : 65 03 __ ADC WORK + 0 
0cc9 : 85 1b __ STA ACCU + 0 
0ccb : a5 1c __ LDA ACCU + 1 
0ccd : 65 04 __ ADC WORK + 1 
0ccf : 85 1c __ STA ACCU + 1 
0cd1 : a5 1d __ LDA ACCU + 2 
0cd3 : 65 05 __ ADC WORK + 2 
0cd5 : 85 1d __ STA ACCU + 2 
0cd7 : 90 08 __ BCC $0ce1 ; (faddsub + 135)
0cd9 : 66 1d __ ROR ACCU + 2 
0cdb : 66 1c __ ROR ACCU + 1 
0cdd : 66 1b __ ROR ACCU + 0 
0cdf : e6 07 __ INC WORK + 4 
0ce1 : a5 07 __ LDA WORK + 4 
0ce3 : c9 ff __ CMP #$ff
0ce5 : f0 83 __ BEQ $0c6a ; (faddsub + 16)
0ce7 : 4a __ __ LSR
0ce8 : 05 1e __ ORA ACCU + 3 
0cea : 85 1e __ STA ACCU + 3 
0cec : b0 06 __ BCS $0cf4 ; (faddsub + 154)
0cee : a5 1d __ LDA ACCU + 2 
0cf0 : 29 7f __ AND #$7f
0cf2 : 85 1d __ STA ACCU + 2 
0cf4 : 60 __ __ RTS
0cf5 : 38 __ __ SEC
0cf6 : a5 1b __ LDA ACCU + 0 
0cf8 : e5 03 __ SBC WORK + 0 
0cfa : 85 1b __ STA ACCU + 0 
0cfc : a5 1c __ LDA ACCU + 1 
0cfe : e5 04 __ SBC WORK + 1 
0d00 : 85 1c __ STA ACCU + 1 
0d02 : a5 1d __ LDA ACCU + 2 
0d04 : e5 05 __ SBC WORK + 2 
0d06 : 85 1d __ STA ACCU + 2 
0d08 : b0 19 __ BCS $0d23 ; (faddsub + 201)
0d0a : 38 __ __ SEC
0d0b : a9 00 __ LDA #$00
0d0d : e5 1b __ SBC ACCU + 0 
0d0f : 85 1b __ STA ACCU + 0 
0d11 : a9 00 __ LDA #$00
0d13 : e5 1c __ SBC ACCU + 1 
0d15 : 85 1c __ STA ACCU + 1 
0d17 : a9 00 __ LDA #$00
0d19 : e5 1d __ SBC ACCU + 2 
0d1b : 85 1d __ STA ACCU + 2 
0d1d : a5 1e __ LDA ACCU + 3 
0d1f : 49 80 __ EOR #$80
0d21 : 85 1e __ STA ACCU + 3 
0d23 : a5 1d __ LDA ACCU + 2 
0d25 : 30 ba __ BMI $0ce1 ; (faddsub + 135)
0d27 : 05 1c __ ORA ACCU + 1 
0d29 : 05 1b __ ORA ACCU + 0 
0d2b : f0 0f __ BEQ $0d3c ; (faddsub + 226)
0d2d : c6 07 __ DEC WORK + 4 
0d2f : f0 0b __ BEQ $0d3c ; (faddsub + 226)
0d31 : 06 1b __ ASL ACCU + 0 
0d33 : 26 1c __ ROL ACCU + 1 
0d35 : 26 1d __ ROL ACCU + 2 
0d37 : 10 f4 __ BPL $0d2d ; (faddsub + 211)
0d39 : 4c e1 0c JMP $0ce1 ; (faddsub + 135)
0d3c : a9 00 __ LDA #$00
0d3e : 85 1b __ STA ACCU + 0 
0d40 : 85 1c __ STA ACCU + 1 
0d42 : 85 1d __ STA ACCU + 2 
0d44 : 85 1e __ STA ACCU + 3 
0d46 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
0d47 : a5 1b __ LDA ACCU + 0 
0d49 : 05 1c __ ORA ACCU + 1 
0d4b : 05 1d __ ORA ACCU + 2 
0d4d : f0 0e __ BEQ $0d5d ; (crt_fmul + 22)
0d4f : a5 03 __ LDA WORK + 0 
0d51 : 05 04 __ ORA WORK + 1 
0d53 : 05 05 __ ORA WORK + 2 
0d55 : d0 09 __ BNE $0d60 ; (crt_fmul + 25)
0d57 : 85 1b __ STA ACCU + 0 
0d59 : 85 1c __ STA ACCU + 1 
0d5b : 85 1d __ STA ACCU + 2 
0d5d : 85 1e __ STA ACCU + 3 
0d5f : 60 __ __ RTS
0d60 : a5 1e __ LDA ACCU + 3 
0d62 : 45 06 __ EOR WORK + 3 
0d64 : 29 80 __ AND #$80
0d66 : 85 1e __ STA ACCU + 3 
0d68 : a9 ff __ LDA #$ff
0d6a : c5 07 __ CMP WORK + 4 
0d6c : f0 42 __ BEQ $0db0 ; (crt_fmul + 105)
0d6e : c5 08 __ CMP WORK + 5 
0d70 : f0 3e __ BEQ $0db0 ; (crt_fmul + 105)
0d72 : a9 00 __ LDA #$00
0d74 : 85 09 __ STA WORK + 6 
0d76 : 85 0a __ STA WORK + 7 
0d78 : 85 0b __ STA WORK + 8 
0d7a : a4 1b __ LDY ACCU + 0 
0d7c : a5 03 __ LDA WORK + 0 
0d7e : d0 06 __ BNE $0d86 ; (crt_fmul + 63)
0d80 : a5 04 __ LDA WORK + 1 
0d82 : f0 0a __ BEQ $0d8e ; (crt_fmul + 71)
0d84 : d0 05 __ BNE $0d8b ; (crt_fmul + 68)
0d86 : 20 e1 0d JSR $0de1 ; (crt_fmul8 + 0)
0d89 : a5 04 __ LDA WORK + 1 
0d8b : 20 e1 0d JSR $0de1 ; (crt_fmul8 + 0)
0d8e : a5 05 __ LDA WORK + 2 
0d90 : 20 e1 0d JSR $0de1 ; (crt_fmul8 + 0)
0d93 : 38 __ __ SEC
0d94 : a5 0b __ LDA WORK + 8 
0d96 : 30 06 __ BMI $0d9e ; (crt_fmul + 87)
0d98 : 06 09 __ ASL WORK + 6 
0d9a : 26 0a __ ROL WORK + 7 
0d9c : 2a __ __ ROL
0d9d : 18 __ __ CLC
0d9e : 29 7f __ AND #$7f
0da0 : 85 0b __ STA WORK + 8 
0da2 : a5 07 __ LDA WORK + 4 
0da4 : 65 08 __ ADC WORK + 5 
0da6 : 90 19 __ BCC $0dc1 ; (crt_fmul + 122)
0da8 : e9 7f __ SBC #$7f
0daa : b0 04 __ BCS $0db0 ; (crt_fmul + 105)
0dac : c9 ff __ CMP #$ff
0dae : d0 15 __ BNE $0dc5 ; (crt_fmul + 126)
0db0 : a5 1e __ LDA ACCU + 3 
0db2 : 09 7f __ ORA #$7f
0db4 : 85 1e __ STA ACCU + 3 
0db6 : a9 80 __ LDA #$80
0db8 : 85 1d __ STA ACCU + 2 
0dba : a9 00 __ LDA #$00
0dbc : 85 1b __ STA ACCU + 0 
0dbe : 85 1c __ STA ACCU + 1 
0dc0 : 60 __ __ RTS
0dc1 : e9 7e __ SBC #$7e
0dc3 : 90 15 __ BCC $0dda ; (crt_fmul + 147)
0dc5 : 4a __ __ LSR
0dc6 : 05 1e __ ORA ACCU + 3 
0dc8 : 85 1e __ STA ACCU + 3 
0dca : a9 00 __ LDA #$00
0dcc : 6a __ __ ROR
0dcd : 05 0b __ ORA WORK + 8 
0dcf : 85 1d __ STA ACCU + 2 
0dd1 : a5 0a __ LDA WORK + 7 
0dd3 : 85 1c __ STA ACCU + 1 
0dd5 : a5 09 __ LDA WORK + 6 
0dd7 : 85 1b __ STA ACCU + 0 
0dd9 : 60 __ __ RTS
0dda : a9 00 __ LDA #$00
0ddc : 85 1e __ STA ACCU + 3 
0dde : f0 d8 __ BEQ $0db8 ; (crt_fmul + 113)
0de0 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
0de1 : 38 __ __ SEC
0de2 : 6a __ __ ROR
0de3 : 90 1e __ BCC $0e03 ; (crt_fmul8 + 34)
0de5 : aa __ __ TAX
0de6 : 18 __ __ CLC
0de7 : 98 __ __ TYA
0de8 : 65 09 __ ADC WORK + 6 
0dea : 85 09 __ STA WORK + 6 
0dec : a5 0a __ LDA WORK + 7 
0dee : 65 1c __ ADC ACCU + 1 
0df0 : 85 0a __ STA WORK + 7 
0df2 : a5 0b __ LDA WORK + 8 
0df4 : 65 1d __ ADC ACCU + 2 
0df6 : 6a __ __ ROR
0df7 : 85 0b __ STA WORK + 8 
0df9 : 8a __ __ TXA
0dfa : 66 0a __ ROR WORK + 7 
0dfc : 66 09 __ ROR WORK + 6 
0dfe : 4a __ __ LSR
0dff : f0 0d __ BEQ $0e0e ; (crt_fmul8 + 45)
0e01 : b0 e2 __ BCS $0de5 ; (crt_fmul8 + 4)
0e03 : 66 0b __ ROR WORK + 8 
0e05 : 66 0a __ ROR WORK + 7 
0e07 : 66 09 __ ROR WORK + 6 
0e09 : 4a __ __ LSR
0e0a : 90 f7 __ BCC $0e03 ; (crt_fmul8 + 34)
0e0c : d0 d7 __ BNE $0de5 ; (crt_fmul8 + 4)
0e0e : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
0e0f : 24 1c __ BIT ACCU + 1 
0e11 : 30 03 __ BMI $0e16 ; (sint16_to_float + 7)
0e13 : 4c 2d 0e JMP $0e2d ; (uint16_to_float + 0)
0e16 : 38 __ __ SEC
0e17 : a9 00 __ LDA #$00
0e19 : e5 1b __ SBC ACCU + 0 
0e1b : 85 1b __ STA ACCU + 0 
0e1d : a9 00 __ LDA #$00
0e1f : e5 1c __ SBC ACCU + 1 
0e21 : 85 1c __ STA ACCU + 1 
0e23 : 20 2d 0e JSR $0e2d ; (uint16_to_float + 0)
0e26 : a5 1e __ LDA ACCU + 3 
0e28 : 09 80 __ ORA #$80
0e2a : 85 1e __ STA ACCU + 3 
0e2c : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
0e2d : a5 1b __ LDA ACCU + 0 
0e2f : 05 1c __ ORA ACCU + 1 
0e31 : d0 05 __ BNE $0e38 ; (uint16_to_float + 11)
0e33 : 85 1d __ STA ACCU + 2 
0e35 : 85 1e __ STA ACCU + 3 
0e37 : 60 __ __ RTS
0e38 : a2 8e __ LDX #$8e
0e3a : a5 1c __ LDA ACCU + 1 
0e3c : 30 06 __ BMI $0e44 ; (uint16_to_float + 23)
0e3e : ca __ __ DEX
0e3f : 06 1b __ ASL ACCU + 0 
0e41 : 2a __ __ ROL
0e42 : 10 fa __ BPL $0e3e ; (uint16_to_float + 17)
0e44 : 0a __ __ ASL
0e45 : 85 1d __ STA ACCU + 2 
0e47 : a5 1b __ LDA ACCU + 0 
0e49 : 85 1c __ STA ACCU + 1 
0e4b : 8a __ __ TXA
0e4c : 4a __ __ LSR
0e4d : 85 1e __ STA ACCU + 3 
0e4f : a9 00 __ LDA #$00
0e51 : 85 1b __ STA ACCU + 0 
0e53 : 66 1d __ ROR ACCU + 2 
0e55 : 60 __ __ RTS
--------------------------------------------------------------------
__shrtab192L:
0e56 : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
spentry:
0e5d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
colors:
0e5e : __ __ __ BYT ff ff ee bb aa aa 88 22 44 11 55 55 dd 77 33 cc : ......."D.UU.w3.
--------------------------------------------------------------------
giocharmap:
0e6e : __ __ __ BYT 01                                              : .
