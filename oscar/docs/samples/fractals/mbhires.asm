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
080e : 8e 32 0e STX $0e32 ; (spentry + 0)
0811 : a2 0e __ LDX #$0e
0813 : a0 6c __ LDY #$6c
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
082a : c0 6c __ CPY #$6c
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
;  10, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbhires.c"
.s1:
0880 : a2 0f __ LDX #$0f
0882 : b5 53 __ LDA T4 + 0,x 
0884 : 9d ee 9f STA $9fee,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 f3 0a JSR $0af3 ; (mmap_trampoline.s4 + 0)
088d : a9 00 __ LDA #$00
088f : 85 0e __ STA P1 
0891 : 85 10 __ STA P3 
0893 : a9 35 __ LDA #$35
0895 : 85 01 __ STA $01 
0897 : a9 03 __ LDA #$03
0899 : 85 0d __ STA P0 
089b : a9 c8 __ LDA #$c8
089d : 85 0f __ STA P2 
089f : a9 e0 __ LDA #$e0
08a1 : 85 11 __ STA P4 
08a3 : 20 3d 0b JSR $0b3d ; (vic_setmode.s4 + 0)
08a6 : a9 00 __ LDA #$00
08a8 : 85 0d __ STA P0 
08aa : 85 0f __ STA P2 
08ac : a9 e0 __ LDA #$e0
08ae : 85 0e __ STA P1 
08b0 : a9 1f __ LDA #$1f
08b2 : 85 12 __ STA P5 
08b4 : a9 40 __ LDA #$40
08b6 : 85 11 __ STA P4 
08b8 : 20 8f 0b JSR $0b8f ; (memset.s4 + 0)
08bb : a9 10 __ LDA #$10
08bd : a2 fa __ LDX #$fa
.l6:
08bf : ca __ __ DEX
08c0 : 9d 00 c8 STA $c800,x 
08c3 : 9d fa c8 STA $c8fa,x 
08c6 : 9d f4 c9 STA $c9f4,x 
08c9 : 9d ee ca STA $caee,x 
08cc : d0 f1 __ BNE $08bf ; (main.l6 + 0)
.s5:
08ce : a9 00 __ LDA #$00
08d0 : 85 5f __ STA T7 + 0 
.l7:
08d2 : 85 1b __ STA ACCU + 0 
08d4 : a9 00 __ LDA #$00
08d6 : 85 1c __ STA ACCU + 1 
08d8 : 20 eb 0d JSR $0deb ; (sint16_to_float + 0)
08db : a9 0a __ LDA #$0a
08dd : 85 03 __ STA WORK + 0 
08df : a9 3c __ LDA #$3c
08e1 : 85 06 __ STA WORK + 3 
08e3 : a9 d7 __ LDA #$d7
08e5 : 85 04 __ STA WORK + 1 
08e7 : a9 23 __ LDA #$23
08e9 : 85 05 __ STA WORK + 2 
08eb : 20 05 0c JSR $0c05 ; (freg + 20)
08ee : 20 23 0d JSR $0d23 ; (crt_fmul + 0)
08f1 : a9 00 __ LDA #$00
08f3 : 85 03 __ STA WORK + 0 
08f5 : 85 04 __ STA WORK + 1 
08f7 : a9 80 __ LDA #$80
08f9 : 85 05 __ STA WORK + 2 
08fb : a9 bf __ LDA #$bf
08fd : 85 06 __ STA WORK + 3 
08ff : 20 05 0c JSR $0c05 ; (freg + 20)
0902 : 20 3c 0c JSR $0c3c ; (faddsub + 6)
0905 : a5 1b __ LDA ACCU + 0 
0907 : 85 43 __ STA T0 + 0 
0909 : a5 1c __ LDA ACCU + 1 
090b : 85 44 __ STA T0 + 1 
090d : a5 1d __ LDA ACCU + 2 
090f : 85 45 __ STA T0 + 2 
0911 : a5 1e __ LDA ACCU + 3 
0913 : 85 46 __ STA T0 + 3 
0915 : a9 00 __ LDA #$00
0917 : 85 60 __ STA T8 + 0 
0919 : 85 61 __ STA T8 + 1 
.l8:
091b : a5 60 __ LDA T8 + 0 
091d : 85 1b __ STA ACCU + 0 
091f : a5 61 __ LDA T8 + 1 
0921 : 85 1c __ STA ACCU + 1 
0923 : 20 eb 0d JSR $0deb ; (sint16_to_float + 0)
0926 : a9 33 __ LDA #$33
0928 : 85 03 __ STA WORK + 0 
092a : 85 04 __ STA WORK + 1 
092c : 85 05 __ STA WORK + 2 
092e : a9 3c __ LDA #$3c
0930 : 85 06 __ STA WORK + 3 
0932 : 20 05 0c JSR $0c05 ; (freg + 20)
0935 : 20 23 0d JSR $0d23 ; (crt_fmul + 0)
0938 : a9 00 __ LDA #$00
093a : 85 03 __ STA WORK + 0 
093c : 85 04 __ STA WORK + 1 
093e : a9 20 __ LDA #$20
0940 : 85 62 __ STA T9 + 0 
0942 : 85 05 __ STA WORK + 2 
0944 : a9 c0 __ LDA #$c0
0946 : 85 06 __ STA WORK + 3 
0948 : 20 05 0c JSR $0c05 ; (freg + 20)
094b : 20 3c 0c JSR $0c3c ; (faddsub + 6)
094e : a5 1b __ LDA ACCU + 0 
0950 : 85 47 __ STA T1 + 0 
0952 : a5 1c __ LDA ACCU + 1 
0954 : 85 48 __ STA T1 + 1 
0956 : a5 1d __ LDA ACCU + 2 
0958 : 85 49 __ STA T1 + 2 
095a : a5 1e __ LDA ACCU + 3 
095c : 85 4a __ STA T1 + 3 
095e : a9 00 __ LDA #$00
0960 : 85 4b __ STA T2 + 0 
0962 : 85 4c __ STA T2 + 1 
0964 : 85 4d __ STA T2 + 2 
0966 : 85 4e __ STA T2 + 3 
0968 : 85 4f __ STA T3 + 0 
096a : 85 50 __ STA T3 + 1 
096c : 85 51 __ STA T3 + 2 
.l9:
096e : 85 52 __ STA T3 + 3 
0970 : a5 4b __ LDA T2 + 0 
0972 : 85 1b __ STA ACCU + 0 
0974 : a5 4c __ LDA T2 + 1 
0976 : 85 1c __ STA ACCU + 1 
0978 : a5 4d __ LDA T2 + 2 
097a : 85 1d __ STA ACCU + 2 
097c : a5 4e __ LDA T2 + 3 
097e : 85 1e __ STA ACCU + 3 
0980 : a2 4b __ LDX #$4b
0982 : 20 f5 0b JSR $0bf5 ; (freg + 4)
0985 : 20 23 0d JSR $0d23 ; (crt_fmul + 0)
0988 : a5 1b __ LDA ACCU + 0 
098a : 85 53 __ STA T4 + 0 
098c : a5 1c __ LDA ACCU + 1 
098e : 85 54 __ STA T4 + 1 
0990 : a5 1d __ LDA ACCU + 2 
0992 : 85 55 __ STA T4 + 2 
0994 : a5 1e __ LDA ACCU + 3 
0996 : 85 56 __ STA T4 + 3 
0998 : a5 4f __ LDA T3 + 0 
099a : 85 1b __ STA ACCU + 0 
099c : a5 50 __ LDA T3 + 1 
099e : 85 1c __ STA ACCU + 1 
09a0 : a5 51 __ LDA T3 + 2 
09a2 : 85 1d __ STA ACCU + 2 
09a4 : a5 52 __ LDA T3 + 3 
09a6 : 85 1e __ STA ACCU + 3 
09a8 : a2 4f __ LDX #$4f
09aa : 20 f5 0b JSR $0bf5 ; (freg + 4)
09ad : 20 23 0d JSR $0d23 ; (crt_fmul + 0)
09b0 : a5 1b __ LDA ACCU + 0 
09b2 : 85 57 __ STA T5 + 0 
09b4 : a5 1c __ LDA ACCU + 1 
09b6 : 85 58 __ STA T5 + 1 
09b8 : a5 1d __ LDA ACCU + 2 
09ba : 85 59 __ STA T5 + 2 
09bc : a5 1e __ LDA ACCU + 3 
09be : 85 5a __ STA T5 + 3 
09c0 : a2 53 __ LDX #$53
09c2 : 20 f5 0b JSR $0bf5 ; (freg + 4)
09c5 : 20 3c 0c JSR $0c3c ; (faddsub + 6)
09c8 : a5 1e __ LDA ACCU + 3 
09ca : 30 50 __ BMI $0a1c ; (main.s10 + 0)
.s16:
09cc : c9 40 __ CMP #$40
09ce : d0 0e __ BNE $09de ; (main.s20 + 0)
.s17:
09d0 : a5 1d __ LDA ACCU + 2 
09d2 : c9 80 __ CMP #$80
09d4 : d0 08 __ BNE $09de ; (main.s20 + 0)
.s18:
09d6 : a5 1c __ LDA ACCU + 1 
09d8 : d0 04 __ BNE $09de ; (main.s20 + 0)
.s19:
09da : a5 1b __ LDA ACCU + 0 
09dc : f0 3e __ BEQ $0a1c ; (main.s10 + 0)
.s20:
09de : 90 3c __ BCC $0a1c ; (main.s10 + 0)
.s15:
09e0 : a5 60 __ LDA T8 + 0 
09e2 : 29 07 __ AND #$07
09e4 : a8 __ __ TAY
09e5 : a5 5f __ LDA T7 + 0 
09e7 : 29 f8 __ AND #$f8
09e9 : 85 4b __ STA T2 + 0 
09eb : 4a __ __ LSR
09ec : 4a __ __ LSR
09ed : 65 4b __ ADC T2 + 0 
09ef : 4a __ __ LSR
09f0 : 6a __ __ ROR
09f1 : 6a __ __ ROR
09f2 : be 54 0e LDX $0e54,y ; (bitshift[0] + 32)
09f5 : a8 __ __ TAY
09f6 : 29 c0 __ AND #$c0
09f8 : 6a __ __ ROR
09f9 : 45 5f __ EOR T7 + 0 
09fb : 29 f8 __ AND #$f8
09fd : 45 5f __ EOR T7 + 0 
09ff : 85 4b __ STA T2 + 0 
0a01 : a5 60 __ LDA T8 + 0 
0a03 : 29 f8 __ AND #$f8
0a05 : 65 4b __ ADC T2 + 0 
0a07 : 85 4b __ STA T2 + 0 
0a09 : 98 __ __ TYA
0a0a : 29 1f __ AND #$1f
0a0c : 09 e0 __ ORA #$e0
0a0e : 65 61 __ ADC T8 + 1 
0a10 : 85 4c __ STA T2 + 1 
0a12 : 8a __ __ TXA
0a13 : a0 00 __ LDY #$00
0a15 : 11 4b __ ORA (T2 + 0),y 
0a17 : 91 4b __ STA (T2 + 0),y 
0a19 : 4c a9 0a JMP $0aa9 ; (main.s11 + 0)
.s10:
0a1c : a5 4b __ LDA T2 + 0 
0a1e : 85 1b __ STA ACCU + 0 
0a20 : a5 4c __ LDA T2 + 1 
0a22 : 85 1c __ STA ACCU + 1 
0a24 : a5 4d __ LDA T2 + 2 
0a26 : 85 1d __ STA ACCU + 2 
0a28 : a5 4e __ LDA T2 + 3 
0a2a : 85 1e __ STA ACCU + 3 
0a2c : a2 4b __ LDX #$4b
0a2e : 20 f5 0b JSR $0bf5 ; (freg + 4)
0a31 : 20 3c 0c JSR $0c3c ; (faddsub + 6)
0a34 : a5 1b __ LDA ACCU + 0 
0a36 : 85 5b __ STA T6 + 0 
0a38 : a5 1c __ LDA ACCU + 1 
0a3a : 85 5c __ STA T6 + 1 
0a3c : a5 1d __ LDA ACCU + 2 
0a3e : 85 5d __ STA T6 + 2 
0a40 : a5 1e __ LDA ACCU + 3 
0a42 : 85 5e __ STA T6 + 3 
0a44 : a5 53 __ LDA T4 + 0 
0a46 : 85 1b __ STA ACCU + 0 
0a48 : a5 54 __ LDA T4 + 1 
0a4a : 85 1c __ STA ACCU + 1 
0a4c : a5 55 __ LDA T4 + 2 
0a4e : 85 1d __ STA ACCU + 2 
0a50 : a5 56 __ LDA T4 + 3 
0a52 : 85 1e __ STA ACCU + 3 
0a54 : a2 57 __ LDX #$57
0a56 : 20 f5 0b JSR $0bf5 ; (freg + 4)
0a59 : 20 36 0c JSR $0c36 ; (faddsub + 0)
0a5c : a2 47 __ LDX #$47
0a5e : 20 f5 0b JSR $0bf5 ; (freg + 4)
0a61 : 20 3c 0c JSR $0c3c ; (faddsub + 6)
0a64 : a5 1b __ LDA ACCU + 0 
0a66 : 85 4b __ STA T2 + 0 
0a68 : a5 1c __ LDA ACCU + 1 
0a6a : 85 4c __ STA T2 + 1 
0a6c : a5 1d __ LDA ACCU + 2 
0a6e : 85 4d __ STA T2 + 2 
0a70 : a5 1e __ LDA ACCU + 3 
0a72 : 85 4e __ STA T2 + 3 
0a74 : a5 4f __ LDA T3 + 0 
0a76 : 85 1b __ STA ACCU + 0 
0a78 : a5 50 __ LDA T3 + 1 
0a7a : 85 1c __ STA ACCU + 1 
0a7c : a5 51 __ LDA T3 + 2 
0a7e : 85 1d __ STA ACCU + 2 
0a80 : a5 52 __ LDA T3 + 3 
0a82 : 85 1e __ STA ACCU + 3 
0a84 : a2 5b __ LDX #$5b
0a86 : 20 f5 0b JSR $0bf5 ; (freg + 4)
0a89 : 20 23 0d JSR $0d23 ; (crt_fmul + 0)
0a8c : a2 43 __ LDX #$43
0a8e : 20 f5 0b JSR $0bf5 ; (freg + 4)
0a91 : 20 3c 0c JSR $0c3c ; (faddsub + 6)
0a94 : a5 1b __ LDA ACCU + 0 
0a96 : 85 4f __ STA T3 + 0 
0a98 : a5 1c __ LDA ACCU + 1 
0a9a : 85 50 __ STA T3 + 1 
0a9c : a5 1d __ LDA ACCU + 2 
0a9e : 85 51 __ STA T3 + 2 
0aa0 : a5 1e __ LDA ACCU + 3 
0aa2 : c6 62 __ DEC T9 + 0 
0aa4 : f0 03 __ BEQ $0aa9 ; (main.s11 + 0)
0aa6 : 4c 6e 09 JMP $096e ; (main.l9 + 0)
.s11:
0aa9 : e6 60 __ INC T8 + 0 
0aab : d0 02 __ BNE $0aaf ; (main.s22 + 0)
.s21:
0aad : e6 61 __ INC T8 + 1 
.s22:
0aaf : a6 61 __ LDX T8 + 1 
0ab1 : ca __ __ DEX
0ab2 : f0 03 __ BEQ $0ab7 ; (main.s14 + 0)
0ab4 : 4c 1b 09 JMP $091b ; (main.l8 + 0)
.s14:
0ab7 : a5 60 __ LDA T8 + 0 
0ab9 : c9 40 __ CMP #$40
0abb : d0 f7 __ BNE $0ab4 ; (main.s22 + 5)
.s12:
0abd : e6 5f __ INC T7 + 0 
0abf : a5 5f __ LDA T7 + 0 
0ac1 : c9 c8 __ CMP #$c8
0ac3 : b0 03 __ BCS $0ac8 ; (main.s13 + 0)
0ac5 : 4c d2 08 JMP $08d2 ; (main.l7 + 0)
.s13:
0ac8 : a9 36 __ LDA #$36
0aca : 85 01 __ STA $01 
0acc : 20 b3 0b JSR $0bb3 ; (getch.l4 + 0)
0acf : a9 00 __ LDA #$00
0ad1 : 85 0d __ STA P0 
0ad3 : 85 0e __ STA P1 
0ad5 : 85 10 __ STA P3 
0ad7 : a9 04 __ LDA #$04
0ad9 : 85 0f __ STA P2 
0adb : a9 10 __ LDA #$10
0add : 85 11 __ STA P4 
0adf : 20 3d 0b JSR $0b3d ; (vic_setmode.s4 + 0)
0ae2 : a9 00 __ LDA #$00
0ae4 : 85 1b __ STA ACCU + 0 
0ae6 : 85 1c __ STA ACCU + 1 
.s3:
0ae8 : a2 0f __ LDX #$0f
0aea : bd ee 9f LDA $9fee,x ; (main@stack + 0)
0aed : 95 53 __ STA T4 + 0,x 
0aef : ca __ __ DEX
0af0 : 10 f8 __ BPL $0aea ; (main.s3 + 2)
0af2 : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0af3 : a9 08 __ LDA #$08
0af5 : 8d fa ff STA $fffa 
0af8 : a9 0b __ LDA #$0b
0afa : 8d fb ff STA $fffb 
0afd : a9 26 __ LDA #$26
0aff : 8d fe ff STA $fffe 
0b02 : a9 0b __ LDA #$0b
0b04 : 8d ff ff STA $ffff 
.s3:
0b07 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0b08 : 48 __ __ PHA
0b09 : 8a __ __ TXA
0b0a : 48 __ __ PHA
0b0b : a9 0b __ LDA #$0b
0b0d : 48 __ __ PHA
0b0e : a9 1f __ LDA #$1f
0b10 : 48 __ __ PHA
0b11 : ba __ __ TSX
0b12 : bd 05 01 LDA $0105,x 
0b15 : 48 __ __ PHA
0b16 : a6 01 __ LDX $01 
0b18 : a9 36 __ LDA #$36
0b1a : 85 01 __ STA $01 
0b1c : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0b1f : 86 01 __ STX $01 
0b21 : 68 __ __ PLA
0b22 : aa __ __ TAX
0b23 : 68 __ __ PLA
0b24 : 40 __ __ RTI
0b25 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0b26 : 48 __ __ PHA
0b27 : 8a __ __ TXA
0b28 : 48 __ __ PHA
0b29 : a9 0b __ LDA #$0b
0b2b : 48 __ __ PHA
0b2c : a9 1f __ LDA #$1f
0b2e : 48 __ __ PHA
0b2f : ba __ __ TSX
0b30 : bd 05 01 LDA $0105,x 
0b33 : 48 __ __ PHA
0b34 : a6 01 __ LDX $01 
0b36 : a9 36 __ LDA #$36
0b38 : 85 01 __ STA $01 
0b3a : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0b3d : a4 0d __ LDY P0 ; (mode + 0)
0b3f : c0 02 __ CPY #$02
0b41 : d0 09 __ BNE $0b4c ; (vic_setmode.s5 + 0)
.s10:
0b43 : a9 5b __ LDA #$5b
0b45 : 8d 11 d0 STA $d011 
.s8:
0b48 : a9 08 __ LDA #$08
0b4a : d0 0c __ BNE $0b58 ; (vic_setmode.s7 + 0)
.s5:
0b4c : b0 36 __ BCS $0b84 ; (vic_setmode.s6 + 0)
.s9:
0b4e : a9 1b __ LDA #$1b
0b50 : 8d 11 d0 STA $d011 
0b53 : 98 __ __ TYA
0b54 : f0 f2 __ BEQ $0b48 ; (vic_setmode.s8 + 0)
.s11:
0b56 : a9 18 __ LDA #$18
.s7:
0b58 : 8d 16 d0 STA $d016 
0b5b : ad 00 dd LDA $dd00 
0b5e : 29 fc __ AND #$fc
0b60 : 85 1b __ STA ACCU + 0 
0b62 : a5 0f __ LDA P2 ; (text + 1)
0b64 : 0a __ __ ASL
0b65 : 2a __ __ ROL
0b66 : 29 01 __ AND #$01
0b68 : 2a __ __ ROL
0b69 : 49 03 __ EOR #$03
0b6b : 05 1b __ ORA ACCU + 0 
0b6d : 8d 00 dd STA $dd00 
0b70 : a5 0f __ LDA P2 ; (text + 1)
0b72 : 29 3c __ AND #$3c
0b74 : 0a __ __ ASL
0b75 : 0a __ __ ASL
0b76 : 85 1b __ STA ACCU + 0 
0b78 : a5 11 __ LDA P4 ; (font + 1)
0b7a : 29 38 __ AND #$38
0b7c : 4a __ __ LSR
0b7d : 4a __ __ LSR
0b7e : 05 1b __ ORA ACCU + 0 
0b80 : 8d 18 d0 STA $d018 
.s3:
0b83 : 60 __ __ RTS
.s6:
0b84 : a9 3b __ LDA #$3b
0b86 : 8d 11 d0 STA $d011 
0b89 : c0 03 __ CPY #$03
0b8b : d0 c9 __ BNE $0b56 ; (vic_setmode.s11 + 0)
0b8d : f0 b9 __ BEQ $0b48 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0b8f : a5 0f __ LDA P2 
0b91 : a6 12 __ LDX P5 
0b93 : f0 0c __ BEQ $0ba1 ; (memset.s4 + 18)
0b95 : a0 00 __ LDY #$00
0b97 : 91 0d __ STA (P0),y ; (dst + 0)
0b99 : c8 __ __ INY
0b9a : d0 fb __ BNE $0b97 ; (memset.s4 + 8)
0b9c : e6 0e __ INC P1 ; (dst + 1)
0b9e : ca __ __ DEX
0b9f : d0 f6 __ BNE $0b97 ; (memset.s4 + 8)
0ba1 : a4 11 __ LDY P4 
0ba3 : f0 05 __ BEQ $0baa ; (memset.s4 + 27)
0ba5 : 88 __ __ DEY
0ba6 : 91 0d __ STA (P0),y ; (dst + 0)
0ba8 : d0 fb __ BNE $0ba5 ; (memset.s4 + 22)
0baa : a5 0d __ LDA P0 ; (dst + 0)
0bac : 85 1b __ STA ACCU + 0 
0bae : a5 0e __ LDA P1 ; (dst + 1)
0bb0 : 85 1c __ STA ACCU + 1 
.s3:
0bb2 : 60 __ __ RTS
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
0bb3 : 20 e4 ff JSR $ffe4 
0bb6 : 85 1b __ STA ACCU + 0 
0bb8 : a5 1b __ LDA ACCU + 0 
0bba : f0 f7 __ BEQ $0bb3 ; (getch.l4 + 0)
.s5:
0bbc : 4c bf 0b JMP $0bbf ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
0bbf : a8 __ __ TAY
0bc0 : ad 33 0e LDA $0e33 ; (giocharmap + 0)
0bc3 : f0 27 __ BEQ $0bec ; (convch.s5 + 0)
.s6:
0bc5 : c0 0d __ CPY #$0d
0bc7 : d0 03 __ BNE $0bcc ; (convch.s7 + 0)
.s16:
0bc9 : a9 0a __ LDA #$0a
.s3:
0bcb : 60 __ __ RTS
.s7:
0bcc : c9 02 __ CMP #$02
0bce : 90 1c __ BCC $0bec ; (convch.s5 + 0)
.s8:
0bd0 : 98 __ __ TYA
0bd1 : c0 41 __ CPY #$41
0bd3 : 90 17 __ BCC $0bec ; (convch.s5 + 0)
.s9:
0bd5 : c9 db __ CMP #$db
0bd7 : b0 13 __ BCS $0bec ; (convch.s5 + 0)
.s10:
0bd9 : c9 c1 __ CMP #$c1
0bdb : 90 03 __ BCC $0be0 ; (convch.s11 + 0)
.s15:
0bdd : 49 a0 __ EOR #$a0
0bdf : a8 __ __ TAY
.s11:
0be0 : c9 7b __ CMP #$7b
0be2 : b0 08 __ BCS $0bec ; (convch.s5 + 0)
.s12:
0be4 : c9 61 __ CMP #$61
0be6 : b0 06 __ BCS $0bee ; (convch.s14 + 0)
.s13:
0be8 : c9 5b __ CMP #$5b
0bea : 90 02 __ BCC $0bee ; (convch.s14 + 0)
.s5:
0bec : 98 __ __ TYA
0bed : 60 __ __ RTS
.s14:
0bee : 49 20 __ EOR #$20
0bf0 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
0bf1 : b1 19 __ LDA (IP + 0),y 
0bf3 : c8 __ __ INY
0bf4 : aa __ __ TAX
0bf5 : b5 00 __ LDA $00,x 
0bf7 : 85 03 __ STA WORK + 0 
0bf9 : b5 01 __ LDA $01,x 
0bfb : 85 04 __ STA WORK + 1 
0bfd : b5 02 __ LDA $02,x 
0bff : 85 05 __ STA WORK + 2 
0c01 : b5 03 __ LDA WORK + 0,x 
0c03 : 85 06 __ STA WORK + 3 
0c05 : a5 05 __ LDA WORK + 2 
0c07 : 0a __ __ ASL
0c08 : a5 06 __ LDA WORK + 3 
0c0a : 2a __ __ ROL
0c0b : 85 08 __ STA WORK + 5 
0c0d : f0 06 __ BEQ $0c15 ; (freg + 36)
0c0f : a5 05 __ LDA WORK + 2 
0c11 : 09 80 __ ORA #$80
0c13 : 85 05 __ STA WORK + 2 
0c15 : a5 1d __ LDA ACCU + 2 
0c17 : 0a __ __ ASL
0c18 : a5 1e __ LDA ACCU + 3 
0c1a : 2a __ __ ROL
0c1b : 85 07 __ STA WORK + 4 
0c1d : f0 06 __ BEQ $0c25 ; (freg + 52)
0c1f : a5 1d __ LDA ACCU + 2 
0c21 : 09 80 __ ORA #$80
0c23 : 85 1d __ STA ACCU + 2 
0c25 : 60 __ __ RTS
0c26 : 06 1e __ ASL ACCU + 3 
0c28 : a5 07 __ LDA WORK + 4 
0c2a : 6a __ __ ROR
0c2b : 85 1e __ STA ACCU + 3 
0c2d : b0 06 __ BCS $0c35 ; (freg + 68)
0c2f : a5 1d __ LDA ACCU + 2 
0c31 : 29 7f __ AND #$7f
0c33 : 85 1d __ STA ACCU + 2 
0c35 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
0c36 : a5 06 __ LDA WORK + 3 
0c38 : 49 80 __ EOR #$80
0c3a : 85 06 __ STA WORK + 3 
0c3c : a9 ff __ LDA #$ff
0c3e : c5 07 __ CMP WORK + 4 
0c40 : f0 04 __ BEQ $0c46 ; (faddsub + 16)
0c42 : c5 08 __ CMP WORK + 5 
0c44 : d0 11 __ BNE $0c57 ; (faddsub + 33)
0c46 : a5 1e __ LDA ACCU + 3 
0c48 : 09 7f __ ORA #$7f
0c4a : 85 1e __ STA ACCU + 3 
0c4c : a9 80 __ LDA #$80
0c4e : 85 1d __ STA ACCU + 2 
0c50 : a9 00 __ LDA #$00
0c52 : 85 1b __ STA ACCU + 0 
0c54 : 85 1c __ STA ACCU + 1 
0c56 : 60 __ __ RTS
0c57 : 38 __ __ SEC
0c58 : a5 07 __ LDA WORK + 4 
0c5a : e5 08 __ SBC WORK + 5 
0c5c : f0 38 __ BEQ $0c96 ; (faddsub + 96)
0c5e : aa __ __ TAX
0c5f : b0 25 __ BCS $0c86 ; (faddsub + 80)
0c61 : e0 e9 __ CPX #$e9
0c63 : b0 0e __ BCS $0c73 ; (faddsub + 61)
0c65 : a5 08 __ LDA WORK + 5 
0c67 : 85 07 __ STA WORK + 4 
0c69 : a9 00 __ LDA #$00
0c6b : 85 1b __ STA ACCU + 0 
0c6d : 85 1c __ STA ACCU + 1 
0c6f : 85 1d __ STA ACCU + 2 
0c71 : f0 23 __ BEQ $0c96 ; (faddsub + 96)
0c73 : a5 1d __ LDA ACCU + 2 
0c75 : 4a __ __ LSR
0c76 : 66 1c __ ROR ACCU + 1 
0c78 : 66 1b __ ROR ACCU + 0 
0c7a : e8 __ __ INX
0c7b : d0 f8 __ BNE $0c75 ; (faddsub + 63)
0c7d : 85 1d __ STA ACCU + 2 
0c7f : a5 08 __ LDA WORK + 5 
0c81 : 85 07 __ STA WORK + 4 
0c83 : 4c 96 0c JMP $0c96 ; (faddsub + 96)
0c86 : e0 18 __ CPX #$18
0c88 : b0 33 __ BCS $0cbd ; (faddsub + 135)
0c8a : a5 05 __ LDA WORK + 2 
0c8c : 4a __ __ LSR
0c8d : 66 04 __ ROR WORK + 1 
0c8f : 66 03 __ ROR WORK + 0 
0c91 : ca __ __ DEX
0c92 : d0 f8 __ BNE $0c8c ; (faddsub + 86)
0c94 : 85 05 __ STA WORK + 2 
0c96 : a5 1e __ LDA ACCU + 3 
0c98 : 29 80 __ AND #$80
0c9a : 85 1e __ STA ACCU + 3 
0c9c : 45 06 __ EOR WORK + 3 
0c9e : 30 31 __ BMI $0cd1 ; (faddsub + 155)
0ca0 : 18 __ __ CLC
0ca1 : a5 1b __ LDA ACCU + 0 
0ca3 : 65 03 __ ADC WORK + 0 
0ca5 : 85 1b __ STA ACCU + 0 
0ca7 : a5 1c __ LDA ACCU + 1 
0ca9 : 65 04 __ ADC WORK + 1 
0cab : 85 1c __ STA ACCU + 1 
0cad : a5 1d __ LDA ACCU + 2 
0caf : 65 05 __ ADC WORK + 2 
0cb1 : 85 1d __ STA ACCU + 2 
0cb3 : 90 08 __ BCC $0cbd ; (faddsub + 135)
0cb5 : 66 1d __ ROR ACCU + 2 
0cb7 : 66 1c __ ROR ACCU + 1 
0cb9 : 66 1b __ ROR ACCU + 0 
0cbb : e6 07 __ INC WORK + 4 
0cbd : a5 07 __ LDA WORK + 4 
0cbf : c9 ff __ CMP #$ff
0cc1 : f0 83 __ BEQ $0c46 ; (faddsub + 16)
0cc3 : 4a __ __ LSR
0cc4 : 05 1e __ ORA ACCU + 3 
0cc6 : 85 1e __ STA ACCU + 3 
0cc8 : b0 06 __ BCS $0cd0 ; (faddsub + 154)
0cca : a5 1d __ LDA ACCU + 2 
0ccc : 29 7f __ AND #$7f
0cce : 85 1d __ STA ACCU + 2 
0cd0 : 60 __ __ RTS
0cd1 : 38 __ __ SEC
0cd2 : a5 1b __ LDA ACCU + 0 
0cd4 : e5 03 __ SBC WORK + 0 
0cd6 : 85 1b __ STA ACCU + 0 
0cd8 : a5 1c __ LDA ACCU + 1 
0cda : e5 04 __ SBC WORK + 1 
0cdc : 85 1c __ STA ACCU + 1 
0cde : a5 1d __ LDA ACCU + 2 
0ce0 : e5 05 __ SBC WORK + 2 
0ce2 : 85 1d __ STA ACCU + 2 
0ce4 : b0 19 __ BCS $0cff ; (faddsub + 201)
0ce6 : 38 __ __ SEC
0ce7 : a9 00 __ LDA #$00
0ce9 : e5 1b __ SBC ACCU + 0 
0ceb : 85 1b __ STA ACCU + 0 
0ced : a9 00 __ LDA #$00
0cef : e5 1c __ SBC ACCU + 1 
0cf1 : 85 1c __ STA ACCU + 1 
0cf3 : a9 00 __ LDA #$00
0cf5 : e5 1d __ SBC ACCU + 2 
0cf7 : 85 1d __ STA ACCU + 2 
0cf9 : a5 1e __ LDA ACCU + 3 
0cfb : 49 80 __ EOR #$80
0cfd : 85 1e __ STA ACCU + 3 
0cff : a5 1d __ LDA ACCU + 2 
0d01 : 30 ba __ BMI $0cbd ; (faddsub + 135)
0d03 : 05 1c __ ORA ACCU + 1 
0d05 : 05 1b __ ORA ACCU + 0 
0d07 : f0 0f __ BEQ $0d18 ; (faddsub + 226)
0d09 : c6 07 __ DEC WORK + 4 
0d0b : f0 0b __ BEQ $0d18 ; (faddsub + 226)
0d0d : 06 1b __ ASL ACCU + 0 
0d0f : 26 1c __ ROL ACCU + 1 
0d11 : 26 1d __ ROL ACCU + 2 
0d13 : 10 f4 __ BPL $0d09 ; (faddsub + 211)
0d15 : 4c bd 0c JMP $0cbd ; (faddsub + 135)
0d18 : a9 00 __ LDA #$00
0d1a : 85 1b __ STA ACCU + 0 
0d1c : 85 1c __ STA ACCU + 1 
0d1e : 85 1d __ STA ACCU + 2 
0d20 : 85 1e __ STA ACCU + 3 
0d22 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
0d23 : a5 1b __ LDA ACCU + 0 
0d25 : 05 1c __ ORA ACCU + 1 
0d27 : 05 1d __ ORA ACCU + 2 
0d29 : f0 0e __ BEQ $0d39 ; (crt_fmul + 22)
0d2b : a5 03 __ LDA WORK + 0 
0d2d : 05 04 __ ORA WORK + 1 
0d2f : 05 05 __ ORA WORK + 2 
0d31 : d0 09 __ BNE $0d3c ; (crt_fmul + 25)
0d33 : 85 1b __ STA ACCU + 0 
0d35 : 85 1c __ STA ACCU + 1 
0d37 : 85 1d __ STA ACCU + 2 
0d39 : 85 1e __ STA ACCU + 3 
0d3b : 60 __ __ RTS
0d3c : a5 1e __ LDA ACCU + 3 
0d3e : 45 06 __ EOR WORK + 3 
0d40 : 29 80 __ AND #$80
0d42 : 85 1e __ STA ACCU + 3 
0d44 : a9 ff __ LDA #$ff
0d46 : c5 07 __ CMP WORK + 4 
0d48 : f0 42 __ BEQ $0d8c ; (crt_fmul + 105)
0d4a : c5 08 __ CMP WORK + 5 
0d4c : f0 3e __ BEQ $0d8c ; (crt_fmul + 105)
0d4e : a9 00 __ LDA #$00
0d50 : 85 09 __ STA WORK + 6 
0d52 : 85 0a __ STA WORK + 7 
0d54 : 85 0b __ STA WORK + 8 
0d56 : a4 1b __ LDY ACCU + 0 
0d58 : a5 03 __ LDA WORK + 0 
0d5a : d0 06 __ BNE $0d62 ; (crt_fmul + 63)
0d5c : a5 04 __ LDA WORK + 1 
0d5e : f0 0a __ BEQ $0d6a ; (crt_fmul + 71)
0d60 : d0 05 __ BNE $0d67 ; (crt_fmul + 68)
0d62 : 20 bd 0d JSR $0dbd ; (crt_fmul8 + 0)
0d65 : a5 04 __ LDA WORK + 1 
0d67 : 20 bd 0d JSR $0dbd ; (crt_fmul8 + 0)
0d6a : a5 05 __ LDA WORK + 2 
0d6c : 20 bd 0d JSR $0dbd ; (crt_fmul8 + 0)
0d6f : 38 __ __ SEC
0d70 : a5 0b __ LDA WORK + 8 
0d72 : 30 06 __ BMI $0d7a ; (crt_fmul + 87)
0d74 : 06 09 __ ASL WORK + 6 
0d76 : 26 0a __ ROL WORK + 7 
0d78 : 2a __ __ ROL
0d79 : 18 __ __ CLC
0d7a : 29 7f __ AND #$7f
0d7c : 85 0b __ STA WORK + 8 
0d7e : a5 07 __ LDA WORK + 4 
0d80 : 65 08 __ ADC WORK + 5 
0d82 : 90 19 __ BCC $0d9d ; (crt_fmul + 122)
0d84 : e9 7f __ SBC #$7f
0d86 : b0 04 __ BCS $0d8c ; (crt_fmul + 105)
0d88 : c9 ff __ CMP #$ff
0d8a : d0 15 __ BNE $0da1 ; (crt_fmul + 126)
0d8c : a5 1e __ LDA ACCU + 3 
0d8e : 09 7f __ ORA #$7f
0d90 : 85 1e __ STA ACCU + 3 
0d92 : a9 80 __ LDA #$80
0d94 : 85 1d __ STA ACCU + 2 
0d96 : a9 00 __ LDA #$00
0d98 : 85 1b __ STA ACCU + 0 
0d9a : 85 1c __ STA ACCU + 1 
0d9c : 60 __ __ RTS
0d9d : e9 7e __ SBC #$7e
0d9f : 90 15 __ BCC $0db6 ; (crt_fmul + 147)
0da1 : 4a __ __ LSR
0da2 : 05 1e __ ORA ACCU + 3 
0da4 : 85 1e __ STA ACCU + 3 
0da6 : a9 00 __ LDA #$00
0da8 : 6a __ __ ROR
0da9 : 05 0b __ ORA WORK + 8 
0dab : 85 1d __ STA ACCU + 2 
0dad : a5 0a __ LDA WORK + 7 
0daf : 85 1c __ STA ACCU + 1 
0db1 : a5 09 __ LDA WORK + 6 
0db3 : 85 1b __ STA ACCU + 0 
0db5 : 60 __ __ RTS
0db6 : a9 00 __ LDA #$00
0db8 : 85 1e __ STA ACCU + 3 
0dba : f0 d8 __ BEQ $0d94 ; (crt_fmul + 113)
0dbc : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
0dbd : 38 __ __ SEC
0dbe : 6a __ __ ROR
0dbf : 90 1e __ BCC $0ddf ; (crt_fmul8 + 34)
0dc1 : aa __ __ TAX
0dc2 : 18 __ __ CLC
0dc3 : 98 __ __ TYA
0dc4 : 65 09 __ ADC WORK + 6 
0dc6 : 85 09 __ STA WORK + 6 
0dc8 : a5 0a __ LDA WORK + 7 
0dca : 65 1c __ ADC ACCU + 1 
0dcc : 85 0a __ STA WORK + 7 
0dce : a5 0b __ LDA WORK + 8 
0dd0 : 65 1d __ ADC ACCU + 2 
0dd2 : 6a __ __ ROR
0dd3 : 85 0b __ STA WORK + 8 
0dd5 : 8a __ __ TXA
0dd6 : 66 0a __ ROR WORK + 7 
0dd8 : 66 09 __ ROR WORK + 6 
0dda : 4a __ __ LSR
0ddb : f0 0d __ BEQ $0dea ; (crt_fmul8 + 45)
0ddd : b0 e2 __ BCS $0dc1 ; (crt_fmul8 + 4)
0ddf : 66 0b __ ROR WORK + 8 
0de1 : 66 0a __ ROR WORK + 7 
0de3 : 66 09 __ ROR WORK + 6 
0de5 : 4a __ __ LSR
0de6 : 90 f7 __ BCC $0ddf ; (crt_fmul8 + 34)
0de8 : d0 d7 __ BNE $0dc1 ; (crt_fmul8 + 4)
0dea : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
0deb : 24 1c __ BIT ACCU + 1 
0ded : 30 03 __ BMI $0df2 ; (sint16_to_float + 7)
0def : 4c 09 0e JMP $0e09 ; (uint16_to_float + 0)
0df2 : 38 __ __ SEC
0df3 : a9 00 __ LDA #$00
0df5 : e5 1b __ SBC ACCU + 0 
0df7 : 85 1b __ STA ACCU + 0 
0df9 : a9 00 __ LDA #$00
0dfb : e5 1c __ SBC ACCU + 1 
0dfd : 85 1c __ STA ACCU + 1 
0dff : 20 09 0e JSR $0e09 ; (uint16_to_float + 0)
0e02 : a5 1e __ LDA ACCU + 3 
0e04 : 09 80 __ ORA #$80
0e06 : 85 1e __ STA ACCU + 3 
0e08 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
0e09 : a5 1b __ LDA ACCU + 0 
0e0b : 05 1c __ ORA ACCU + 1 
0e0d : d0 05 __ BNE $0e14 ; (uint16_to_float + 11)
0e0f : 85 1d __ STA ACCU + 2 
0e11 : 85 1e __ STA ACCU + 3 
0e13 : 60 __ __ RTS
0e14 : a2 8e __ LDX #$8e
0e16 : a5 1c __ LDA ACCU + 1 
0e18 : 30 06 __ BMI $0e20 ; (uint16_to_float + 23)
0e1a : ca __ __ DEX
0e1b : 06 1b __ ASL ACCU + 0 
0e1d : 2a __ __ ROL
0e1e : 10 fa __ BPL $0e1a ; (uint16_to_float + 17)
0e20 : 0a __ __ ASL
0e21 : 85 1d __ STA ACCU + 2 
0e23 : a5 1b __ LDA ACCU + 0 
0e25 : 85 1c __ STA ACCU + 1 
0e27 : 8a __ __ TXA
0e28 : 4a __ __ LSR
0e29 : 85 1e __ STA ACCU + 3 
0e2b : a9 00 __ LDA #$00
0e2d : 85 1b __ STA ACCU + 0 
0e2f : 66 1d __ ROR ACCU + 2 
0e31 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0e32 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
0e33 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
bitshift:
0e34 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
0e44 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
0e54 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
0e64 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
