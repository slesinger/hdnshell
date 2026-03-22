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
080e : 8e a7 1b STX $1ba7 ; (spentry + 0)
0811 : a2 1b __ LDX #$1b
0813 : a0 d3 __ LDY #$d3
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1b __ CPX #$1b
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 d3 __ CPY #$d3
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 a6 __ LDA #$a6
083d : 85 23 __ STA SP + 0 
083f : a9 9c __ LDA #$9c
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
;  99, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbmulti3d.c"
.s1:
0880 : a2 24 __ LDX #$24
0882 : b5 53 __ LDA T0 + 0,x 
0884 : 9d a8 9c STA $9ca8,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 b0 0c JSR $0cb0 ; (mmap_trampoline.s4 + 0)
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
08a3 : 20 fa 0c JSR $0cfa ; (vic_setmode.s4 + 0)
08a6 : a9 00 __ LDA #$00
08a8 : 85 0d __ STA P0 
08aa : 85 0f __ STA P2 
08ac : 8d 21 d0 STA $d021 
08af : 8d 20 d0 STA $d020 
08b2 : a9 e0 __ LDA #$e0
08b4 : 85 0e __ STA P1 
08b6 : a9 40 __ LDA #$40
08b8 : 85 11 __ STA P4 
08ba : a9 1f __ LDA #$1f
08bc : 85 12 __ STA P5 
08be : 20 4c 0d JSR $0d4c ; (memset.s4 + 0)
08c1 : a9 26 __ LDA #$26
08c3 : a2 fa __ LDX #$fa
.l6:
08c5 : ca __ __ DEX
08c6 : 9d 00 c8 STA $c800,x 
08c9 : 9d fa c8 STA $c8fa,x 
08cc : 9d f4 c9 STA $c9f4,x 
08cf : 9d ee ca STA $caee,x 
08d2 : d0 f1 __ BNE $08c5 ; (main.l6 + 0)
.s5:
08d4 : a9 0f __ LDA #$0f
08d6 : a2 fa __ LDX #$fa
.l8:
08d8 : ca __ __ DEX
08d9 : 9d 00 d8 STA $d800,x 
08dc : 9d fa d8 STA $d8fa,x 
08df : 9d f4 d9 STA $d9f4,x 
08e2 : 9d ee da STA $daee,x 
08e5 : d0 f1 __ BNE $08d8 ; (main.l8 + 0)
.s7:
08e7 : a9 82 __ LDA #$82
08e9 : 85 0d __ STA P0 
08eb : a9 3f __ LDA #$3f
08ed : 85 10 __ STA P3 
08ef : a9 ec __ LDA #$ec
08f1 : 85 0e __ STA P1 
08f3 : a9 5e __ LDA #$5e
08f5 : 85 0f __ STA P2 
08f7 : 20 70 0d JSR $0d70 ; (sin.s4 + 0)
08fa : a5 1b __ LDA ACCU + 0 
08fc : 85 5d __ STA T4 + 0 
08fe : a5 1c __ LDA ACCU + 1 
0900 : 85 5e __ STA T4 + 1 
0902 : a5 1d __ LDA ACCU + 2 
0904 : 85 5f __ STA T4 + 2 
0906 : a5 1e __ LDA ACCU + 3 
0908 : 85 60 __ STA T4 + 3 
090a : a9 33 __ LDA #$33
090c : 85 0d __ STA P0 
090e : 85 0e __ STA P1 
0910 : 85 0f __ STA P2 
0912 : a9 bf __ LDA #$bf
0914 : 85 10 __ STA P3 
0916 : 20 70 0d JSR $0d70 ; (sin.s4 + 0)
0919 : a5 1b __ LDA ACCU + 0 
091b : 85 61 __ STA T5 + 0 
091d : a5 1c __ LDA ACCU + 1 
091f : 85 62 __ STA T5 + 1 
0921 : a5 1d __ LDA ACCU + 2 
0923 : 85 63 __ STA T5 + 2 
0925 : a5 1e __ LDA ACCU + 3 
0927 : 85 64 __ STA T5 + 3 
0929 : a9 ff __ LDA #$ff
092b : 85 71 __ STA T9 + 0 
092d : 85 72 __ STA T9 + 1 
092f : 85 74 __ STA T10 + 1 
0931 : a9 af __ LDA #$af
0933 : 85 73 __ STA T10 + 0 
.l9:
0935 : a5 73 __ LDA T10 + 0 
0937 : 85 1b __ STA ACCU + 0 
0939 : a5 74 __ LDA T10 + 1 
093b : 85 1c __ STA ACCU + 1 
093d : 20 59 1b JSR $1b59 ; (sint16_to_float + 0)
0940 : a5 1b __ LDA ACCU + 0 
0942 : 85 65 __ STA T6 + 0 
0944 : a5 1c __ LDA ACCU + 1 
0946 : 85 66 __ STA T6 + 1 
0948 : a5 1d __ LDA ACCU + 2 
094a : 85 67 __ STA T6 + 2 
094c : a5 1e __ LDA ACCU + 3 
094e : 85 68 __ STA T6 + 3 
0950 : a9 00 __ LDA #$00
0952 : 85 76 __ STA T11 + 1 
0954 : 85 69 __ STA T7 + 0 
0956 : 85 6a __ STA T7 + 1 
0958 : 85 6b __ STA T7 + 2 
095a : 85 6c __ STA T7 + 3 
095c : a9 14 __ LDA #$14
095e : 85 75 __ STA T11 + 0 
0960 : a9 01 __ LDA #$01
0962 : 85 77 __ STA T12 + 0 
.l10:
0964 : 85 1b __ STA ACCU + 0 
0966 : a9 00 __ LDA #$00
0968 : 85 1c __ STA ACCU + 1 
096a : 20 59 1b JSR $1b59 ; (sint16_to_float + 0)
096d : a5 1b __ LDA ACCU + 0 
096f : 85 53 __ STA T0 + 0 
0971 : a5 1c __ LDA ACCU + 1 
0973 : 85 54 __ STA T0 + 1 
0975 : a5 1d __ LDA ACCU + 2 
0977 : 85 55 __ STA T0 + 2 
0979 : a5 1e __ LDA ACCU + 3 
097b : 85 56 __ STA T0 + 3 
097d : a9 00 __ LDA #$00
097f : 85 1b __ STA ACCU + 0 
0981 : 85 1c __ STA ACCU + 1 
0983 : 85 1d __ STA ACCU + 2 
0985 : a9 40 __ LDA #$40
0987 : 85 1e __ STA ACCU + 3 
0989 : a2 53 __ LDX #$53
098b : 20 6f 17 JSR $176f ; (freg + 4)
098e : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
0991 : a5 1b __ LDA ACCU + 0 
0993 : 85 6d __ STA T8 + 0 
0995 : a5 1c __ LDA ACCU + 1 
0997 : 85 6e __ STA T8 + 1 
0999 : a5 1d __ LDA ACCU + 2 
099b : 85 6f __ STA T8 + 2 
099d : a5 1e __ LDA ACCU + 3 
099f : 85 70 __ STA T8 + 3 
09a1 : a9 00 __ LDA #$00
09a3 : 85 03 __ STA WORK + 0 
09a5 : 85 04 __ STA WORK + 1 
09a7 : a9 c8 __ LDA #$c8
09a9 : 85 05 __ STA WORK + 2 
09ab : a9 42 __ LDA #$42
09ad : 85 06 __ STA WORK + 3 
09af : 20 7f 17 JSR $177f ; (freg + 20)
09b2 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
09b5 : a9 00 __ LDA #$00
09b7 : 85 03 __ STA WORK + 0 
09b9 : 85 04 __ STA WORK + 1 
09bb : a9 40 __ LDA #$40
09bd : 85 05 __ STA WORK + 2 
09bf : a9 c0 __ LDA #$c0
09c1 : 85 06 __ STA WORK + 3 
09c3 : 20 7f 17 JSR $177f ; (freg + 20)
09c6 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
09c9 : a5 1b __ LDA ACCU + 0 
09cb : 85 53 __ STA T0 + 0 
09cd : a5 1c __ LDA ACCU + 1 
09cf : 85 54 __ STA T0 + 1 
09d1 : a5 1d __ LDA ACCU + 2 
09d3 : 85 55 __ STA T0 + 2 
09d5 : a5 1e __ LDA ACCU + 3 
09d7 : 85 56 __ STA T0 + 3 
09d9 : a2 61 __ LDX #$61
09db : 20 6f 17 JSR $176f ; (freg + 4)
09de : 20 9d 18 JSR $189d ; (crt_fmul + 0)
09e1 : a5 1b __ LDA ACCU + 0 
09e3 : 85 57 __ STA T1 + 0 
09e5 : a5 1c __ LDA ACCU + 1 
09e7 : 85 58 __ STA T1 + 1 
09e9 : a5 1d __ LDA ACCU + 2 
09eb : 85 59 __ STA T1 + 2 
09ed : a5 1e __ LDA ACCU + 3 
09ef : 85 5a __ STA T1 + 3 
09f1 : a5 6d __ LDA T8 + 0 
09f3 : 85 1b __ STA ACCU + 0 
09f5 : a5 6e __ LDA T8 + 1 
09f7 : 85 1c __ STA ACCU + 1 
09f9 : a5 6f __ LDA T8 + 2 
09fb : 85 1d __ STA ACCU + 2 
09fd : a5 70 __ LDA T8 + 3 
09ff : 85 1e __ STA ACCU + 3 
0a01 : a2 65 __ LDX #$65
0a03 : 20 6f 17 JSR $176f ; (freg + 4)
0a06 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0a09 : a9 00 __ LDA #$00
0a0b : 85 03 __ STA WORK + 0 
0a0d : 85 04 __ STA WORK + 1 
0a0f : a9 c8 __ LDA #$c8
0a11 : 85 05 __ STA WORK + 2 
0a13 : a9 42 __ LDA #$42
0a15 : 85 06 __ STA WORK + 3 
0a17 : 20 7f 17 JSR $177f ; (freg + 20)
0a1a : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
0a1d : a9 00 __ LDA #$00
0a1f : 85 03 __ STA WORK + 0 
0a21 : 85 04 __ STA WORK + 1 
0a23 : a9 c8 __ LDA #$c8
0a25 : 85 05 __ STA WORK + 2 
0a27 : a9 42 __ LDA #$42
0a29 : 85 06 __ STA WORK + 3 
0a2b : 20 7f 17 JSR $177f ; (freg + 20)
0a2e : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0a31 : a5 1b __ LDA ACCU + 0 
0a33 : 85 43 __ STA T2 + 0 
0a35 : a5 1c __ LDA ACCU + 1 
0a37 : 85 44 __ STA T2 + 1 
0a39 : a5 1d __ LDA ACCU + 2 
0a3b : 85 45 __ STA T2 + 2 
0a3d : a5 1e __ LDA ACCU + 3 
0a3f : 85 46 __ STA T2 + 3 
0a41 : a2 5d __ LDX #$5d
0a43 : 20 6f 17 JSR $176f ; (freg + 4)
0a46 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0a49 : a2 57 __ LDX #$57
0a4b : 20 6f 17 JSR $176f ; (freg + 4)
0a4e : 20 b0 17 JSR $17b0 ; (faddsub + 0)
0a51 : a5 1b __ LDA ACCU + 0 
0a53 : 85 11 __ STA P4 
0a55 : a5 1c __ LDA ACCU + 1 
0a57 : 85 12 __ STA P5 
0a59 : a5 1d __ LDA ACCU + 2 
0a5b : 85 13 __ STA P6 
0a5d : a5 1e __ LDA ACCU + 3 
0a5f : 85 14 __ STA P7 
0a61 : a5 53 __ LDA T0 + 0 
0a63 : 85 1b __ STA ACCU + 0 
0a65 : a5 54 __ LDA T0 + 1 
0a67 : 85 1c __ STA ACCU + 1 
0a69 : a5 55 __ LDA T0 + 2 
0a6b : 85 1d __ STA ACCU + 2 
0a6d : a5 56 __ LDA T0 + 3 
0a6f : 85 1e __ STA ACCU + 3 
0a71 : a2 5d __ LDX #$5d
0a73 : 20 6f 17 JSR $176f ; (freg + 4)
0a76 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0a79 : a5 1b __ LDA ACCU + 0 
0a7b : 85 53 __ STA T0 + 0 
0a7d : a5 1c __ LDA ACCU + 1 
0a7f : 85 54 __ STA T0 + 1 
0a81 : a5 1d __ LDA ACCU + 2 
0a83 : 85 55 __ STA T0 + 2 
0a85 : a5 1e __ LDA ACCU + 3 
0a87 : 85 56 __ STA T0 + 3 
0a89 : a5 43 __ LDA T2 + 0 
0a8b : 85 1b __ STA ACCU + 0 
0a8d : a5 44 __ LDA T2 + 1 
0a8f : 85 1c __ STA ACCU + 1 
0a91 : a5 45 __ LDA T2 + 2 
0a93 : 85 1d __ STA ACCU + 2 
0a95 : a5 46 __ LDA T2 + 3 
0a97 : 85 1e __ STA ACCU + 3 
0a99 : a2 61 __ LDX #$61
0a9b : 20 6f 17 JSR $176f ; (freg + 4)
0a9e : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0aa1 : a2 53 __ LDX #$53
0aa3 : 20 6f 17 JSR $176f ; (freg + 4)
0aa6 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0aa9 : a5 1b __ LDA ACCU + 0 
0aab : 85 15 __ STA P8 
0aad : a5 1c __ LDA ACCU + 1 
0aaf : 85 16 __ STA P9 
0ab1 : a5 1d __ LDA ACCU + 2 
0ab3 : 85 17 __ STA P10 
0ab5 : a5 1e __ LDA ACCU + 3 
0ab7 : 85 18 __ STA P11 
0ab9 : 20 07 0f JSR $0f07 ; (iter.s1 + 0)
0abc : a5 1b __ LDA ACCU + 0 
0abe : 85 57 __ STA T1 + 0 
0ac0 : a5 1c __ LDA ACCU + 1 
0ac2 : 85 58 __ STA T1 + 1 
0ac4 : a5 1d __ LDA ACCU + 2 
0ac6 : 85 59 __ STA T1 + 2 
0ac8 : a5 1e __ LDA ACCU + 3 
0aca : 85 5a __ STA T1 + 3 
0acc : a9 00 __ LDA #$00
0ace : 85 11 __ STA P4 
0ad0 : 85 12 __ STA P5 
0ad2 : 85 13 __ STA P6 
0ad4 : a9 40 __ LDA #$40
0ad6 : 85 14 __ STA P7 
0ad8 : a2 57 __ LDX #$57
0ada : 20 6f 17 JSR $176f ; (freg + 4)
0add : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0ae0 : a5 1e __ LDA ACCU + 3 
0ae2 : 30 1e __ BMI $0b02 ; (main.s21 + 0)
.s22:
0ae4 : a6 1b __ LDX ACCU + 0 
0ae6 : 86 53 __ STX T0 + 0 
0ae8 : a4 1c __ LDY ACCU + 1 
0aea : 84 54 __ STY T0 + 1 
0aec : a6 1d __ LDX ACCU + 2 
0aee : 86 55 __ STX T0 + 2 
0af0 : c9 3f __ CMP #$3f
0af2 : d0 0c __ BNE $0b00 ; (main.s26 + 0)
.s23:
0af4 : e0 80 __ CPX #$80
0af6 : d0 08 __ BNE $0b00 ; (main.s26 + 0)
.s24:
0af8 : 98 __ __ TYA
0af9 : 38 __ __ SEC
0afa : d0 04 __ BNE $0b00 ; (main.s26 + 0)
.s25:
0afc : a5 1b __ LDA ACCU + 0 
0afe : f0 10 __ BEQ $0b10 ; (main.s11 + 0)
.s26:
0b00 : b0 0e __ BCS $0b10 ; (main.s11 + 0)
.s21:
0b02 : a9 00 __ LDA #$00
0b04 : 85 53 __ STA T0 + 0 
0b06 : 85 54 __ STA T0 + 1 
0b08 : a9 80 __ LDA #$80
0b0a : 85 55 __ STA T0 + 2 
0b0c : a9 3f __ LDA #$3f
0b0e : d0 02 __ BNE $0b12 ; (main.s27 + 0)
.s11:
0b10 : a5 1e __ LDA ACCU + 3 
.s27:
0b12 : 49 80 __ EOR #$80
0b14 : 85 56 __ STA T0 + 3 
0b16 : a9 cc __ LDA #$cc
0b18 : 85 1c __ STA ACCU + 1 
0b1a : 85 1d __ STA ACCU + 2 
0b1c : a9 cd __ LDA #$cd
0b1e : 85 1b __ STA ACCU + 0 
0b20 : a9 3e __ LDA #$3e
0b22 : 85 1e __ STA ACCU + 3 
0b24 : a2 53 __ LDX #$53
0b26 : 20 6f 17 JSR $176f ; (freg + 4)
0b29 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0b2c : a5 1b __ LDA ACCU + 0 
0b2e : 85 15 __ STA P8 
0b30 : a5 1c __ LDA ACCU + 1 
0b32 : 85 16 __ STA P9 
0b34 : a5 1d __ LDA ACCU + 2 
0b36 : 85 17 __ STA P10 
0b38 : a5 1e __ LDA ACCU + 3 
0b3a : 85 18 __ STA P11 
0b3c : 20 0c 12 JSR $120c ; (pow.s4 + 0)
0b3f : a5 1b __ LDA ACCU + 0 
0b41 : 85 53 __ STA T0 + 0 
0b43 : a5 1c __ LDA ACCU + 1 
0b45 : 85 54 __ STA T0 + 1 
0b47 : a5 1d __ LDA ACCU + 2 
0b49 : 85 55 __ STA T0 + 2 
0b4b : a5 1e __ LDA ACCU + 3 
0b4d : 85 56 __ STA T0 + 3 
0b4f : a5 69 __ LDA T7 + 0 
0b51 : 85 15 __ STA P8 
0b53 : a5 6a __ LDA T7 + 1 
0b55 : 85 16 __ STA P9 
0b57 : a5 6b __ LDA T7 + 2 
0b59 : 85 17 __ STA P10 
0b5b : a5 6c __ LDA T7 + 3 
0b5d : 85 18 __ STA P11 
0b5f : a9 00 __ LDA #$00
0b61 : 85 1b __ STA ACCU + 0 
0b63 : 85 1c __ STA ACCU + 1 
0b65 : a9 a0 __ LDA #$a0
0b67 : 85 1d __ STA ACCU + 2 
0b69 : a9 40 __ LDA #$40
0b6b : 85 1e __ STA ACCU + 3 
0b6d : a2 53 __ LDX #$53
0b6f : 20 6f 17 JSR $176f ; (freg + 4)
0b72 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0b75 : a5 1b __ LDA ACCU + 0 
0b77 : 85 69 __ STA T7 + 0 
0b79 : 8d fc 9f STA $9ffc ; (sstack + 0)
0b7c : a5 1c __ LDA ACCU + 1 
0b7e : 85 6a __ STA T7 + 1 
0b80 : 8d fd 9f STA $9ffd ; (sstack + 1)
0b83 : a5 1d __ LDA ACCU + 2 
0b85 : 85 6b __ STA T7 + 2 
0b87 : 8d fe 9f STA $9ffe ; (sstack + 2)
0b8a : a5 1e __ LDA ACCU + 3 
0b8c : 85 6c __ STA T7 + 3 
0b8e : 8d ff 9f STA $9fff ; (sstack + 3)
0b91 : a5 77 __ LDA T12 + 0 
0b93 : 0a __ __ ASL
0b94 : 85 53 __ STA T0 + 0 
0b96 : a9 00 __ LDA #$00
0b98 : 2a __ __ ROL
0b99 : 06 53 __ ASL T0 + 0 
0b9b : 2a __ __ ROL
0b9c : 69 9c __ ADC #$9c
0b9e : 85 5c __ STA T3 + 1 
0ba0 : a9 d0 __ LDA #$d0
0ba2 : 85 5b __ STA T3 + 0 
0ba4 : a4 53 __ LDY T0 + 0 
0ba6 : b1 5b __ LDA (T3 + 0),y 
0ba8 : 85 11 __ STA P4 
0baa : c8 __ __ INY
0bab : b1 5b __ LDA (T3 + 0),y 
0bad : 85 12 __ STA P5 
0baf : c8 __ __ INY
0bb0 : b1 5b __ LDA (T3 + 0),y 
0bb2 : 85 13 __ STA P6 
0bb4 : c8 __ __ INY
0bb5 : b1 5b __ LDA (T3 + 0),y 
0bb7 : 85 14 __ STA P7 
0bb9 : 20 99 13 JSR $1399 ; (light.s4 + 0)
0bbc : a5 1b __ LDA ACCU + 0 
0bbe : 85 43 __ STA T2 + 0 
0bc0 : a5 69 __ LDA T7 + 0 
0bc2 : 85 1b __ STA ACCU + 0 
0bc4 : a4 53 __ LDY T0 + 0 
0bc6 : 91 5b __ STA (T3 + 0),y 
0bc8 : a5 6a __ LDA T7 + 1 
0bca : 85 1c __ STA ACCU + 1 
0bcc : c8 __ __ INY
0bcd : 91 5b __ STA (T3 + 0),y 
0bcf : a5 6b __ LDA T7 + 2 
0bd1 : 85 1d __ STA ACCU + 2 
0bd3 : c8 __ __ INY
0bd4 : 91 5b __ STA (T3 + 0),y 
0bd6 : a5 6c __ LDA T7 + 3 
0bd8 : 85 1e __ STA ACCU + 3 
0bda : c8 __ __ INY
0bdb : 91 5b __ STA (T3 + 0),y 
0bdd : a5 77 __ LDA T12 + 0 
0bdf : 4a __ __ LSR
0be0 : 18 __ __ CLC
0be1 : 69 14 __ ADC #$14
0be3 : 85 5b __ STA T3 + 0 
0be5 : a2 6d __ LDX #$6d
0be7 : 20 6f 17 JSR $176f ; (freg + 4)
0bea : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
0bed : 20 8f 17 JSR $178f ; (freg + 36)
0bf0 : 20 13 1a JSR $1a13 ; (fround + 0)
0bf3 : 20 0d 1b JSR $1b0d ; (f32_to_i16 + 0)
0bf6 : 18 __ __ CLC
0bf7 : a5 1b __ LDA ACCU + 0 
0bf9 : 65 5b __ ADC T3 + 0 
0bfb : 85 5b __ STA T3 + 0 
0bfd : a5 1c __ LDA ACCU + 1 
0bff : 69 00 __ ADC #$00
0c01 : 85 5c __ STA T3 + 1 
0c03 : a5 5a __ LDA T1 + 3 
0c05 : c9 42 __ CMP #$42
0c07 : d0 08 __ BNE $0c11 ; (main.s30 + 0)
.s18:
0c09 : a5 59 __ LDA T1 + 2 
0c0b : d0 04 __ BNE $0c11 ; (main.s30 + 0)
.s19:
0c0d : a5 58 __ LDA T1 + 1 
0c0f : f0 05 __ BEQ $0c16 ; (main.s20 + 0)
.s30:
0c11 : a5 57 __ LDA T1 + 0 
0c13 : 4c 1a 0c JMP $0c1a ; (main.s17 + 0)
.s20:
0c16 : a5 57 __ LDA T1 + 0 
0c18 : f0 22 __ BEQ $0c3c ; (main.s12 + 0)
.s17:
0c1a : e6 43 __ INC T2 + 0 
0c1c : 85 1b __ STA ACCU + 0 
0c1e : a5 58 __ LDA T1 + 1 
0c20 : 85 1c __ STA ACCU + 1 
0c22 : a5 59 __ LDA T1 + 2 
0c24 : 85 1d __ STA ACCU + 2 
0c26 : a5 5a __ LDA T1 + 3 
0c28 : 85 1e __ STA ACCU + 3 
0c2a : 20 8f 17 JSR $178f ; (freg + 36)
0c2d : 20 13 1a JSR $1a13 ; (fround + 0)
0c30 : 20 0d 1b JSR $1b0d ; (f32_to_i16 + 0)
0c33 : a5 1b __ LDA ACCU + 0 
0c35 : 29 01 __ AND #$01
0c37 : 0a __ __ ASL
0c38 : 0a __ __ ASL
0c39 : 0a __ __ ASL
0c3a : 65 43 __ ADC T2 + 0 
.s12:
0c3c : 24 72 __ BIT T9 + 1 
0c3e : 30 1d __ BMI $0c5d ; (main.s13 + 0)
.s16:
0c40 : 85 13 __ STA P6 
0c42 : a5 71 __ LDA T9 + 0 
0c44 : 85 0d __ STA P0 
0c46 : a5 75 __ LDA T11 + 0 
0c48 : 85 0f __ STA P2 
0c4a : a9 00 __ LDA #$00
0c4c : 85 0e __ STA P1 
0c4e : a5 76 __ LDA T11 + 1 
0c50 : 85 10 __ STA P3 
0c52 : a5 5b __ LDA T3 + 0 
0c54 : 85 11 __ STA P4 
0c56 : a5 5c __ LDA T3 + 1 
0c58 : 85 12 __ STA P5 
0c5a : 20 56 16 JSR $1656 ; (VLine.s4 + 0)
.s13:
0c5d : a5 5b __ LDA T3 + 0 
0c5f : 85 75 __ STA T11 + 0 
0c61 : a5 5c __ LDA T3 + 1 
0c63 : 85 76 __ STA T11 + 1 
0c65 : e6 77 __ INC T12 + 0 
0c67 : a5 77 __ LDA T12 + 0 
0c69 : c9 c8 __ CMP #$c8
0c6b : b0 03 __ BCS $0c70 ; (main.s14 + 0)
0c6d : 4c 64 09 JMP $0964 ; (main.l10 + 0)
.s14:
0c70 : e6 73 __ INC T10 + 0 
0c72 : d0 02 __ BNE $0c76 ; (main.s29 + 0)
.s28:
0c74 : e6 74 __ INC T10 + 1 
.s29:
0c76 : e6 71 __ INC T9 + 0 
0c78 : a5 71 __ LDA T9 + 0 
0c7a : c9 a0 __ CMP #$a0
0c7c : a9 00 __ LDA #$00
0c7e : 85 72 __ STA T9 + 1 
0c80 : b0 03 __ BCS $0c85 ; (main.s15 + 0)
0c82 : 4c 35 09 JMP $0935 ; (main.l9 + 0)
.s15:
0c85 : a9 36 __ LDA #$36
0c87 : 85 01 __ STA $01 
0c89 : 20 2d 17 JSR $172d ; (getch.l4 + 0)
0c8c : a9 00 __ LDA #$00
0c8e : 85 0d __ STA P0 
0c90 : 85 0e __ STA P1 
0c92 : 85 10 __ STA P3 
0c94 : a9 04 __ LDA #$04
0c96 : 85 0f __ STA P2 
0c98 : a9 10 __ LDA #$10
0c9a : 85 11 __ STA P4 
0c9c : 20 fa 0c JSR $0cfa ; (vic_setmode.s4 + 0)
0c9f : a9 00 __ LDA #$00
0ca1 : 85 1b __ STA ACCU + 0 
0ca3 : 85 1c __ STA ACCU + 1 
.s3:
0ca5 : a2 24 __ LDX #$24
0ca7 : bd a8 9c LDA $9ca8,x ; (main@stack + 0)
0caa : 95 53 __ STA T0 + 0,x 
0cac : ca __ __ DEX
0cad : 10 f8 __ BPL $0ca7 ; (main.s3 + 2)
0caf : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0cb0 : a9 c5 __ LDA #$c5
0cb2 : 8d fa ff STA $fffa 
0cb5 : a9 0c __ LDA #$0c
0cb7 : 8d fb ff STA $fffb 
0cba : a9 e3 __ LDA #$e3
0cbc : 8d fe ff STA $fffe 
0cbf : a9 0c __ LDA #$0c
0cc1 : 8d ff ff STA $ffff 
.s3:
0cc4 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0cc5 : 48 __ __ PHA
0cc6 : 8a __ __ TXA
0cc7 : 48 __ __ PHA
0cc8 : a9 0c __ LDA #$0c
0cca : 48 __ __ PHA
0ccb : a9 dc __ LDA #$dc
0ccd : 48 __ __ PHA
0cce : ba __ __ TSX
0ccf : bd 05 01 LDA $0105,x 
0cd2 : 48 __ __ PHA
0cd3 : a6 01 __ LDX $01 
0cd5 : a9 36 __ LDA #$36
0cd7 : 85 01 __ STA $01 
0cd9 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0cdc : 86 01 __ STX $01 
0cde : 68 __ __ PLA
0cdf : aa __ __ TAX
0ce0 : 68 __ __ PLA
0ce1 : 40 __ __ RTI
0ce2 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0ce3 : 48 __ __ PHA
0ce4 : 8a __ __ TXA
0ce5 : 48 __ __ PHA
0ce6 : a9 0c __ LDA #$0c
0ce8 : 48 __ __ PHA
0ce9 : a9 dc __ LDA #$dc
0ceb : 48 __ __ PHA
0cec : ba __ __ TSX
0ced : bd 05 01 LDA $0105,x 
0cf0 : 48 __ __ PHA
0cf1 : a6 01 __ LDX $01 
0cf3 : a9 36 __ LDA #$36
0cf5 : 85 01 __ STA $01 
0cf7 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0cfa : a4 0d __ LDY P0 ; (mode + 0)
0cfc : c0 02 __ CPY #$02
0cfe : d0 09 __ BNE $0d09 ; (vic_setmode.s5 + 0)
.s10:
0d00 : a9 5b __ LDA #$5b
0d02 : 8d 11 d0 STA $d011 
.s8:
0d05 : a9 08 __ LDA #$08
0d07 : d0 0c __ BNE $0d15 ; (vic_setmode.s7 + 0)
.s5:
0d09 : b0 36 __ BCS $0d41 ; (vic_setmode.s6 + 0)
.s9:
0d0b : a9 1b __ LDA #$1b
0d0d : 8d 11 d0 STA $d011 
0d10 : 98 __ __ TYA
0d11 : f0 f2 __ BEQ $0d05 ; (vic_setmode.s8 + 0)
.s11:
0d13 : a9 18 __ LDA #$18
.s7:
0d15 : 8d 16 d0 STA $d016 
0d18 : ad 00 dd LDA $dd00 
0d1b : 29 fc __ AND #$fc
0d1d : 85 1b __ STA ACCU + 0 
0d1f : a5 0f __ LDA P2 ; (text + 1)
0d21 : 0a __ __ ASL
0d22 : 2a __ __ ROL
0d23 : 29 01 __ AND #$01
0d25 : 2a __ __ ROL
0d26 : 49 03 __ EOR #$03
0d28 : 05 1b __ ORA ACCU + 0 
0d2a : 8d 00 dd STA $dd00 
0d2d : a5 0f __ LDA P2 ; (text + 1)
0d2f : 29 3c __ AND #$3c
0d31 : 0a __ __ ASL
0d32 : 0a __ __ ASL
0d33 : 85 1b __ STA ACCU + 0 
0d35 : a5 11 __ LDA P4 ; (font + 1)
0d37 : 29 38 __ AND #$38
0d39 : 4a __ __ LSR
0d3a : 4a __ __ LSR
0d3b : 05 1b __ ORA ACCU + 0 
0d3d : 8d 18 d0 STA $d018 
.s3:
0d40 : 60 __ __ RTS
.s6:
0d41 : a9 3b __ LDA #$3b
0d43 : 8d 11 d0 STA $d011 
0d46 : c0 03 __ CPY #$03
0d48 : d0 c9 __ BNE $0d13 ; (vic_setmode.s11 + 0)
0d4a : f0 b9 __ BEQ $0d05 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0d4c : a5 0f __ LDA P2 
0d4e : a6 12 __ LDX P5 
0d50 : f0 0c __ BEQ $0d5e ; (memset.s4 + 18)
0d52 : a0 00 __ LDY #$00
0d54 : 91 0d __ STA (P0),y ; (dst + 0)
0d56 : c8 __ __ INY
0d57 : d0 fb __ BNE $0d54 ; (memset.s4 + 8)
0d59 : e6 0e __ INC P1 ; (dst + 1)
0d5b : ca __ __ DEX
0d5c : d0 f6 __ BNE $0d54 ; (memset.s4 + 8)
0d5e : a4 11 __ LDY P4 
0d60 : f0 05 __ BEQ $0d67 ; (memset.s4 + 27)
0d62 : 88 __ __ DEY
0d63 : 91 0d __ STA (P0),y ; (dst + 0)
0d65 : d0 fb __ BNE $0d62 ; (memset.s4 + 22)
0d67 : a5 0d __ LDA P0 ; (dst + 0)
0d69 : 85 1b __ STA ACCU + 0 
0d6b : a5 0e __ LDA P1 ; (dst + 1)
0d6d : 85 1c __ STA ACCU + 1 
.s3:
0d6f : 60 __ __ RTS
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
0d70 : a5 0d __ LDA P0 ; (f + 0)
0d72 : 85 43 __ STA T0 + 0 
0d74 : a5 0e __ LDA P1 ; (f + 1)
0d76 : 85 44 __ STA T0 + 1 
0d78 : a5 0f __ LDA P2 ; (f + 2)
0d7a : 85 45 __ STA T0 + 2 
0d7c : a5 10 __ LDA P3 ; (f + 3)
0d7e : 29 7f __ AND #$7f
0d80 : 05 0f __ ORA P2 ; (f + 2)
0d82 : 05 0e __ ORA P1 ; (f + 1)
0d84 : 05 0d __ ORA P0 ; (f + 0)
0d86 : f0 0e __ BEQ $0d96 ; (sin.s5 + 0)
.s22:
0d88 : 24 10 __ BIT P3 ; (f + 3)
0d8a : 10 0a __ BPL $0d96 ; (sin.s5 + 0)
.s21:
0d8c : a9 00 __ LDA #$00
0d8e : 85 47 __ STA T1 + 0 
0d90 : 85 48 __ STA T1 + 1 
0d92 : a9 bf __ LDA #$bf
0d94 : d0 08 __ BNE $0d9e ; (sin.s6 + 0)
.s5:
0d96 : a9 00 __ LDA #$00
0d98 : 85 47 __ STA T1 + 0 
0d9a : 85 48 __ STA T1 + 1 
0d9c : a9 3f __ LDA #$3f
.s6:
0d9e : 85 4a __ STA T1 + 3 
0da0 : a5 10 __ LDA P3 ; (f + 3)
0da2 : 29 7f __ AND #$7f
0da4 : 85 46 __ STA T0 + 3 
0da6 : a9 80 __ LDA #$80
0da8 : 85 49 __ STA T1 + 2 
0daa : a9 83 __ LDA #$83
0dac : 85 1b __ STA ACCU + 0 
0dae : a9 3e __ LDA #$3e
0db0 : 85 1e __ STA ACCU + 3 
0db2 : a9 f9 __ LDA #$f9
0db4 : 85 1c __ STA ACCU + 1 
0db6 : a9 22 __ LDA #$22
0db8 : 85 1d __ STA ACCU + 2 
0dba : a2 43 __ LDX #$43
0dbc : 20 6f 17 JSR $176f ; (freg + 4)
0dbf : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0dc2 : a5 1b __ LDA ACCU + 0 
0dc4 : 85 43 __ STA T0 + 0 
0dc6 : a5 1c __ LDA ACCU + 1 
0dc8 : 85 44 __ STA T0 + 1 
0dca : a5 1d __ LDA ACCU + 2 
0dcc : 85 45 __ STA T0 + 2 
0dce : a5 1e __ LDA ACCU + 3 
0dd0 : 85 46 __ STA T0 + 3 
0dd2 : 20 8f 17 JSR $178f ; (freg + 36)
0dd5 : 20 13 1a JSR $1a13 ; (fround + 0)
0dd8 : a2 43 __ LDX #$43
0dda : 20 6f 17 JSR $176f ; (freg + 4)
0ddd : a5 1e __ LDA ACCU + 3 
0ddf : 49 80 __ EOR #$80
0de1 : 85 1e __ STA ACCU + 3 
0de3 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0de6 : a5 1b __ LDA ACCU + 0 
0de8 : 85 43 __ STA T0 + 0 
0dea : a5 1c __ LDA ACCU + 1 
0dec : 85 44 __ STA T0 + 1 
0dee : a6 1d __ LDX ACCU + 2 
0df0 : 86 45 __ STX T0 + 2 
0df2 : a5 1e __ LDA ACCU + 3 
0df4 : 85 46 __ STA T0 + 3 
0df6 : 30 3b __ BMI $0e33 ; (sin.s7 + 0)
.s16:
0df8 : c9 3f __ CMP #$3f
0dfa : d0 0b __ BNE $0e07 ; (sin.s20 + 0)
.s17:
0dfc : 8a __ __ TXA
0dfd : d0 08 __ BNE $0e07 ; (sin.s20 + 0)
.s18:
0dff : a5 1c __ LDA ACCU + 1 
0e01 : d0 04 __ BNE $0e07 ; (sin.s20 + 0)
.s19:
0e03 : a5 1b __ LDA ACCU + 0 
0e05 : f0 02 __ BEQ $0e09 ; (sin.s15 + 0)
.s20:
0e07 : 90 2a __ BCC $0e33 ; (sin.s7 + 0)
.s15:
0e09 : a9 00 __ LDA #$00
0e0b : 85 1b __ STA ACCU + 0 
0e0d : 85 1c __ STA ACCU + 1 
0e0f : 85 1d __ STA ACCU + 2 
0e11 : a9 bf __ LDA #$bf
0e13 : 85 1e __ STA ACCU + 3 
0e15 : a2 43 __ LDX #$43
0e17 : 20 6f 17 JSR $176f ; (freg + 4)
0e1a : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0e1d : a5 1b __ LDA ACCU + 0 
0e1f : 85 43 __ STA T0 + 0 
0e21 : a5 1c __ LDA ACCU + 1 
0e23 : 85 44 __ STA T0 + 1 
0e25 : a5 1d __ LDA ACCU + 2 
0e27 : 85 45 __ STA T0 + 2 
0e29 : a5 1e __ LDA ACCU + 3 
0e2b : 85 46 __ STA T0 + 3 
0e2d : a5 4a __ LDA T1 + 3 
0e2f : 49 80 __ EOR #$80
0e31 : 85 4a __ STA T1 + 3 
.s7:
0e33 : a5 1e __ LDA ACCU + 3 
0e35 : 30 38 __ BMI $0e6f ; (sin.s8 + 0)
.s10:
0e37 : c9 3e __ CMP #$3e
0e39 : d0 0e __ BNE $0e49 ; (sin.s14 + 0)
.s11:
0e3b : a5 1d __ LDA ACCU + 2 
0e3d : c9 80 __ CMP #$80
0e3f : d0 08 __ BNE $0e49 ; (sin.s14 + 0)
.s12:
0e41 : a5 1c __ LDA ACCU + 1 
0e43 : d0 04 __ BNE $0e49 ; (sin.s14 + 0)
.s13:
0e45 : a5 1b __ LDA ACCU + 0 
0e47 : f0 02 __ BEQ $0e4b ; (sin.s9 + 0)
.s14:
0e49 : 90 24 __ BCC $0e6f ; (sin.s8 + 0)
.s9:
0e4b : a9 00 __ LDA #$00
0e4d : 85 1b __ STA ACCU + 0 
0e4f : 85 1c __ STA ACCU + 1 
0e51 : 85 1d __ STA ACCU + 2 
0e53 : a9 3f __ LDA #$3f
0e55 : 85 1e __ STA ACCU + 3 
0e57 : a2 43 __ LDX #$43
0e59 : 20 6f 17 JSR $176f ; (freg + 4)
0e5c : 20 b0 17 JSR $17b0 ; (faddsub + 0)
0e5f : a5 1b __ LDA ACCU + 0 
0e61 : 85 43 __ STA T0 + 0 
0e63 : a5 1c __ LDA ACCU + 1 
0e65 : 85 44 __ STA T0 + 1 
0e67 : a5 1d __ LDA ACCU + 2 
0e69 : 85 45 __ STA T0 + 2 
0e6b : a5 1e __ LDA ACCU + 3 
0e6d : 85 46 __ STA T0 + 3 
.s8:
0e6f : a9 98 __ LDA #$98
0e71 : 85 1b __ STA ACCU + 0 
0e73 : a9 42 __ LDA #$42
0e75 : 85 1e __ STA ACCU + 3 
0e77 : a9 ec __ LDA #$ec
0e79 : 85 1c __ STA ACCU + 1 
0e7b : a9 5e __ LDA #$5e
0e7d : 85 1d __ STA ACCU + 2 
0e7f : a2 43 __ LDX #$43
0e81 : 20 6f 17 JSR $176f ; (freg + 4)
0e84 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0e87 : a9 f8 __ LDA #$f8
0e89 : 85 03 __ STA WORK + 0 
0e8b : a9 41 __ LDA #$41
0e8d : 85 06 __ STA WORK + 3 
0e8f : a9 c5 __ LDA #$c5
0e91 : 85 04 __ STA WORK + 1 
0e93 : a9 13 __ LDA #$13
0e95 : 85 05 __ STA WORK + 2 
0e97 : 20 7f 17 JSR $177f ; (freg + 20)
0e9a : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0e9d : a2 43 __ LDX #$43
0e9f : 20 6f 17 JSR $176f ; (freg + 4)
0ea2 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0ea5 : a9 6e __ LDA #$6e
0ea7 : 85 03 __ STA WORK + 0 
0ea9 : a9 c2 __ LDA #$c2
0eab : 85 06 __ STA WORK + 3 
0ead : a9 27 __ LDA #$27
0eaf : 85 04 __ STA WORK + 1 
0eb1 : a9 2a __ LDA #$2a
0eb3 : 85 05 __ STA WORK + 2 
0eb5 : 20 7f 17 JSR $177f ; (freg + 20)
0eb8 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0ebb : a2 43 __ LDX #$43
0ebd : 20 6f 17 JSR $176f ; (freg + 4)
0ec0 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0ec3 : a9 df __ LDA #$df
0ec5 : 85 03 __ STA WORK + 0 
0ec7 : a9 3d __ LDA #$3d
0ec9 : 85 06 __ STA WORK + 3 
0ecb : a9 af __ LDA #$af
0ecd : 85 04 __ STA WORK + 1 
0ecf : a9 5c __ LDA #$5c
0ed1 : 85 05 __ STA WORK + 2 
0ed3 : 20 7f 17 JSR $177f ; (freg + 20)
0ed6 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0ed9 : a2 43 __ LDX #$43
0edb : 20 6f 17 JSR $176f ; (freg + 4)
0ede : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0ee1 : a9 b6 __ LDA #$b6
0ee3 : 85 03 __ STA WORK + 0 
0ee5 : a9 40 __ LDA #$40
0ee7 : 85 06 __ STA WORK + 3 
0ee9 : a9 0f __ LDA #$0f
0eeb : 85 04 __ STA WORK + 1 
0eed : a9 c9 __ LDA #$c9
0eef : 85 05 __ STA WORK + 2 
0ef1 : 20 7f 17 JSR $177f ; (freg + 20)
0ef4 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0ef7 : a2 43 __ LDX #$43
0ef9 : 20 6f 17 JSR $176f ; (freg + 4)
0efc : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0eff : a2 47 __ LDX #$47
0f01 : 20 6f 17 JSR $176f ; (freg + 4)
0f04 : 4c 9d 18 JMP $189d ; (crt_fmul + 0)
--------------------------------------------------------------------
iter: ; iter(float,float)->float
;  66, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbmulti3d.c"
.s1:
0f07 : a2 04 __ LDX #$04
0f09 : b5 53 __ LDA T4 + 0,x 
0f0b : 9d f1 9f STA $9ff1,x ; (iter@stack + 0)
0f0e : ca __ __ DEX
0f0f : 10 f8 __ BPL $0f09 ; (iter.s1 + 2)
.s4:
0f11 : a9 00 __ LDA #$00
0f13 : 85 43 __ STA T0 + 0 
0f15 : 85 44 __ STA T0 + 1 
0f17 : 85 45 __ STA T0 + 2 
0f19 : 85 46 __ STA T0 + 3 
0f1b : 85 47 __ STA T1 + 0 
0f1d : 85 48 __ STA T1 + 1 
0f1f : 85 49 __ STA T1 + 2 
0f21 : 85 4a __ STA T1 + 3 
0f23 : 85 57 __ STA T5 + 0 
.l5:
0f25 : a5 43 __ LDA T0 + 0 
0f27 : 85 1b __ STA ACCU + 0 
0f29 : a5 44 __ LDA T0 + 1 
0f2b : 85 1c __ STA ACCU + 1 
0f2d : a5 45 __ LDA T0 + 2 
0f2f : 85 1d __ STA ACCU + 2 
0f31 : a5 46 __ LDA T0 + 3 
0f33 : 85 1e __ STA ACCU + 3 
0f35 : a2 43 __ LDX #$43
0f37 : 20 6f 17 JSR $176f ; (freg + 4)
0f3a : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0f3d : a5 1b __ LDA ACCU + 0 
0f3f : 85 4b __ STA T2 + 0 
0f41 : a5 1c __ LDA ACCU + 1 
0f43 : 85 4c __ STA T2 + 1 
0f45 : a5 1d __ LDA ACCU + 2 
0f47 : 85 4d __ STA T2 + 2 
0f49 : a5 1e __ LDA ACCU + 3 
0f4b : 85 4e __ STA T2 + 3 
0f4d : a5 47 __ LDA T1 + 0 
0f4f : 85 1b __ STA ACCU + 0 
0f51 : a5 48 __ LDA T1 + 1 
0f53 : 85 1c __ STA ACCU + 1 
0f55 : a5 49 __ LDA T1 + 2 
0f57 : 85 1d __ STA ACCU + 2 
0f59 : a5 4a __ LDA T1 + 3 
0f5b : 85 1e __ STA ACCU + 3 
0f5d : a2 47 __ LDX #$47
0f5f : 20 6f 17 JSR $176f ; (freg + 4)
0f62 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
0f65 : a5 1b __ LDA ACCU + 0 
0f67 : 85 4f __ STA T3 + 0 
0f69 : a5 1c __ LDA ACCU + 1 
0f6b : 85 50 __ STA T3 + 1 
0f6d : a5 1d __ LDA ACCU + 2 
0f6f : 85 51 __ STA T3 + 2 
0f71 : a5 1e __ LDA ACCU + 3 
0f73 : 85 52 __ STA T3 + 3 
0f75 : a2 4b __ LDX #$4b
0f77 : 20 6f 17 JSR $176f ; (freg + 4)
0f7a : 20 b6 17 JSR $17b6 ; (faddsub + 6)
0f7d : a5 1e __ LDA ACCU + 3 
0f7f : 10 03 __ BPL $0f84 ; (iter.s9 + 0)
0f81 : 4c 10 10 JMP $1010 ; (iter.s6 + 0)
.s9:
0f84 : c9 42 __ CMP #$42
0f86 : d0 0e __ BNE $0f96 ; (iter.s13 + 0)
.s10:
0f88 : a5 1d __ LDA ACCU + 2 
0f8a : c9 80 __ CMP #$80
0f8c : d0 08 __ BNE $0f96 ; (iter.s13 + 0)
.s11:
0f8e : a5 1c __ LDA ACCU + 1 
0f90 : d0 04 __ BNE $0f96 ; (iter.s13 + 0)
.s12:
0f92 : a5 1b __ LDA ACCU + 0 
0f94 : f0 7a __ BEQ $1010 ; (iter.s6 + 0)
.s13:
0f96 : 90 78 __ BCC $1010 ; (iter.s6 + 0)
.s8:
0f98 : a5 1b __ LDA ACCU + 0 
0f9a : 85 0d __ STA P0 
0f9c : a5 1c __ LDA ACCU + 1 
0f9e : 85 0e __ STA P1 
0fa0 : a5 1d __ LDA ACCU + 2 
0fa2 : 85 0f __ STA P2 
0fa4 : a5 1e __ LDA ACCU + 3 
0fa6 : 85 10 __ STA P3 
0fa8 : 20 d6 10 JSR $10d6 ; (log.s4 + 0)
0fab : a9 92 __ LDA #$92
0fad : 85 03 __ STA WORK + 0 
0faf : a9 40 __ LDA #$40
0fb1 : 85 06 __ STA WORK + 3 
0fb3 : a9 15 __ LDA #$15
0fb5 : 85 04 __ STA WORK + 1 
0fb7 : a9 85 __ LDA #$85
0fb9 : 85 05 __ STA WORK + 2 
0fbb : 20 7f 17 JSR $177f ; (freg + 20)
0fbe : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
0fc1 : a5 1b __ LDA ACCU + 0 
0fc3 : 85 0d __ STA P0 
0fc5 : a5 1c __ LDA ACCU + 1 
0fc7 : 85 0e __ STA P1 
0fc9 : a5 1d __ LDA ACCU + 2 
0fcb : 85 0f __ STA P2 
0fcd : a5 1e __ LDA ACCU + 3 
0fcf : 85 10 __ STA P3 
0fd1 : 20 d6 10 JSR $10d6 ; (log.s4 + 0)
0fd4 : a9 18 __ LDA #$18
0fd6 : 85 03 __ STA WORK + 0 
0fd8 : a9 3f __ LDA #$3f
0fda : 85 06 __ STA WORK + 3 
0fdc : a9 72 __ LDA #$72
0fde : 85 04 __ STA WORK + 1 
0fe0 : a9 31 __ LDA #$31
0fe2 : 85 05 __ STA WORK + 2 
0fe4 : 20 7f 17 JSR $177f ; (freg + 20)
0fe7 : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
0fea : a5 1b __ LDA ACCU + 0 
0fec : 85 43 __ STA T0 + 0 
0fee : a5 1c __ LDA ACCU + 1 
0ff0 : 85 44 __ STA T0 + 1 
0ff2 : a5 1d __ LDA ACCU + 2 
0ff4 : 85 45 __ STA T0 + 2 
0ff6 : a5 1e __ LDA ACCU + 3 
0ff8 : 85 46 __ STA T0 + 3 
0ffa : a5 57 __ LDA T5 + 0 
0ffc : 85 1b __ STA ACCU + 0 
0ffe : a9 00 __ LDA #$00
1000 : 85 1c __ STA ACCU + 1 
1002 : 20 59 1b JSR $1b59 ; (sint16_to_float + 0)
1005 : a2 43 __ LDX #$43
1007 : 20 6f 17 JSR $176f ; (freg + 4)
100a : 20 b0 17 JSR $17b0 ; (faddsub + 0)
100d : 4c cb 10 JMP $10cb ; (iter.s3 + 0)
.s6:
1010 : a5 43 __ LDA T0 + 0 
1012 : 85 1b __ STA ACCU + 0 
1014 : a5 44 __ LDA T0 + 1 
1016 : 85 1c __ STA ACCU + 1 
1018 : a5 45 __ LDA T0 + 2 
101a : 85 1d __ STA ACCU + 2 
101c : a5 46 __ LDA T0 + 3 
101e : 85 1e __ STA ACCU + 3 
1020 : a2 43 __ LDX #$43
1022 : 20 6f 17 JSR $176f ; (freg + 4)
1025 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1028 : a5 1b __ LDA ACCU + 0 
102a : 85 53 __ STA T4 + 0 
102c : a5 1c __ LDA ACCU + 1 
102e : 85 54 __ STA T4 + 1 
1030 : a5 1d __ LDA ACCU + 2 
1032 : 85 55 __ STA T4 + 2 
1034 : a5 1e __ LDA ACCU + 3 
1036 : 85 56 __ STA T4 + 3 
1038 : a5 4b __ LDA T2 + 0 
103a : 85 1b __ STA ACCU + 0 
103c : a5 4c __ LDA T2 + 1 
103e : 85 1c __ STA ACCU + 1 
1040 : a5 4d __ LDA T2 + 2 
1042 : 85 1d __ STA ACCU + 2 
1044 : a5 4e __ LDA T2 + 3 
1046 : 85 1e __ STA ACCU + 3 
1048 : a2 4f __ LDX #$4f
104a : 20 6f 17 JSR $176f ; (freg + 4)
104d : 20 b0 17 JSR $17b0 ; (faddsub + 0)
1050 : a5 11 __ LDA P4 ; (xz + 0)
1052 : 85 03 __ STA WORK + 0 
1054 : a5 12 __ LDA P5 ; (xz + 1)
1056 : 85 04 __ STA WORK + 1 
1058 : a5 13 __ LDA P6 ; (xz + 2)
105a : 85 05 __ STA WORK + 2 
105c : a5 14 __ LDA P7 ; (xz + 3)
105e : 85 06 __ STA WORK + 3 
1060 : 20 7f 17 JSR $177f ; (freg + 20)
1063 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1066 : a5 1b __ LDA ACCU + 0 
1068 : 85 43 __ STA T0 + 0 
106a : a5 1c __ LDA ACCU + 1 
106c : 85 44 __ STA T0 + 1 
106e : a5 1d __ LDA ACCU + 2 
1070 : 85 45 __ STA T0 + 2 
1072 : a5 1e __ LDA ACCU + 3 
1074 : 85 46 __ STA T0 + 3 
1076 : a5 47 __ LDA T1 + 0 
1078 : 85 1b __ STA ACCU + 0 
107a : a5 48 __ LDA T1 + 1 
107c : 85 1c __ STA ACCU + 1 
107e : a5 49 __ LDA T1 + 2 
1080 : 85 1d __ STA ACCU + 2 
1082 : a5 4a __ LDA T1 + 3 
1084 : 85 1e __ STA ACCU + 3 
1086 : a2 53 __ LDX #$53
1088 : 20 6f 17 JSR $176f ; (freg + 4)
108b : 20 9d 18 JSR $189d ; (crt_fmul + 0)
108e : a5 15 __ LDA P8 ; (yz + 0)
1090 : 85 03 __ STA WORK + 0 
1092 : a5 16 __ LDA P9 ; (yz + 1)
1094 : 85 04 __ STA WORK + 1 
1096 : a5 17 __ LDA P10 ; (yz + 2)
1098 : 85 05 __ STA WORK + 2 
109a : a5 18 __ LDA P11 ; (yz + 3)
109c : 85 06 __ STA WORK + 3 
109e : 20 7f 17 JSR $177f ; (freg + 20)
10a1 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
10a4 : a5 1b __ LDA ACCU + 0 
10a6 : 85 47 __ STA T1 + 0 
10a8 : a5 1c __ LDA ACCU + 1 
10aa : 85 48 __ STA T1 + 1 
10ac : a5 1d __ LDA ACCU + 2 
10ae : 85 49 __ STA T1 + 2 
10b0 : a5 1e __ LDA ACCU + 3 
10b2 : 85 4a __ STA T1 + 3 
10b4 : e6 57 __ INC T5 + 0 
10b6 : a5 57 __ LDA T5 + 0 
10b8 : c9 20 __ CMP #$20
10ba : b0 03 __ BCS $10bf ; (iter.s7 + 0)
10bc : 4c 25 0f JMP $0f25 ; (iter.l5 + 0)
.s7:
10bf : a9 00 __ LDA #$00
10c1 : 85 1b __ STA ACCU + 0 
10c3 : 85 1c __ STA ACCU + 1 
10c5 : 85 1d __ STA ACCU + 2 
10c7 : a9 42 __ LDA #$42
10c9 : 85 1e __ STA ACCU + 3 
.s3:
10cb : a2 04 __ LDX #$04
10cd : bd f1 9f LDA $9ff1,x ; (iter@stack + 0)
10d0 : 95 53 __ STA T4 + 0,x 
10d2 : ca __ __ DEX
10d3 : 10 f8 __ BPL $10cd ; (iter.s3 + 2)
10d5 : 60 __ __ RTS
--------------------------------------------------------------------
log: ; log(float)->float
;  20, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
10d6 : a5 10 __ LDA P3 ; (f + 3)
10d8 : 29 7f __ AND #$7f
10da : 05 0f __ ORA P2 ; (f + 2)
10dc : 05 0e __ ORA P1 ; (f + 1)
10de : 05 0d __ ORA P0 ; (f + 0)
10e0 : d0 03 __ BNE $10e5 ; (log.s5 + 0)
10e2 : 4c ff 11 JMP $11ff ; (log.s6 + 0)
.s5:
10e5 : a5 0d __ LDA P0 ; (f + 0)
10e7 : 8d f8 9f STA $9ff8 ; (x + 0)
10ea : a5 0e __ LDA P1 ; (f + 1)
10ec : 8d f9 9f STA $9ff9 ; (x + 1)
10ef : a5 0f __ LDA P2 ; (f + 2)
10f1 : 8d fa 9f STA $9ffa ; (x + 2)
10f4 : 85 43 __ STA T0 + 0 
10f6 : 29 7f __ AND #$7f
10f8 : 8d fa 9f STA $9ffa ; (x + 2)
10fb : 06 43 __ ASL T0 + 0 
10fd : a9 3f __ LDA #$3f
10ff : 8d fb 9f STA $9ffb ; (x + 3)
1102 : a5 10 __ LDA P3 ; (f + 3)
1104 : 2a __ __ ROL
1105 : a2 00 __ LDX #$00
1107 : 90 01 __ BCC $110a ; (log.s8 + 0)
.s7:
1109 : ca __ __ DEX
.s8:
110a : 38 __ __ SEC
110b : e9 7e __ SBC #$7e
110d : 85 1b __ STA ACCU + 0 
110f : 8a __ __ TXA
1110 : e9 00 __ SBC #$00
1112 : 85 1c __ STA ACCU + 1 
1114 : 20 59 1b JSR $1b59 ; (sint16_to_float + 0)
1117 : a5 1b __ LDA ACCU + 0 
1119 : 85 43 __ STA T0 + 0 
111b : a5 1c __ LDA ACCU + 1 
111d : 85 44 __ STA T0 + 1 
111f : a5 1d __ LDA ACCU + 2 
1121 : 85 45 __ STA T0 + 2 
1123 : a5 1e __ LDA ACCU + 3 
1125 : 85 46 __ STA T0 + 3 
1127 : ad f8 9f LDA $9ff8 ; (x + 0)
112a : 85 47 __ STA T1 + 0 
112c : ad f9 9f LDA $9ff9 ; (x + 1)
112f : 85 48 __ STA T1 + 1 
1131 : ad fa 9f LDA $9ffa ; (x + 2)
1134 : 85 49 __ STA T1 + 2 
1136 : ad fb 9f LDA $9ffb ; (x + 3)
1139 : 85 4a __ STA T1 + 3 
113b : a9 be __ LDA #$be
113d : 85 1b __ STA ACCU + 0 
113f : a9 3f __ LDA #$3f
1141 : 85 1e __ STA ACCU + 3 
1143 : a9 00 __ LDA #$00
1145 : 85 1c __ STA ACCU + 1 
1147 : a9 b2 __ LDA #$b2
1149 : 85 1d __ STA ACCU + 2 
114b : a2 47 __ LDX #$47
114d : 20 6f 17 JSR $176f ; (freg + 4)
1150 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1153 : a9 c9 __ LDA #$c9
1155 : 85 03 __ STA WORK + 0 
1157 : a9 c0 __ LDA #$c0
1159 : 85 06 __ STA WORK + 3 
115b : a9 6b __ LDA #$6b
115d : 85 04 __ STA WORK + 1 
115f : a9 cf __ LDA #$cf
1161 : 85 05 __ STA WORK + 2 
1163 : 20 7f 17 JSR $177f ; (freg + 20)
1166 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1169 : a2 47 __ LDX #$47
116b : 20 6f 17 JSR $176f ; (freg + 4)
116e : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1171 : a9 05 __ LDA #$05
1173 : 85 03 __ STA WORK + 0 
1175 : a9 41 __ LDA #$41
1177 : 85 06 __ STA WORK + 3 
1179 : a9 21 __ LDA #$21
117b : 85 04 __ STA WORK + 1 
117d : a9 4c __ LDA #$4c
117f : 85 05 __ STA WORK + 2 
1181 : 20 7f 17 JSR $177f ; (freg + 20)
1184 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1187 : a2 47 __ LDX #$47
1189 : 20 6f 17 JSR $176f ; (freg + 4)
118c : 20 9d 18 JSR $189d ; (crt_fmul + 0)
118f : a9 47 __ LDA #$47
1191 : 85 03 __ STA WORK + 0 
1193 : a9 c1 __ LDA #$c1
1195 : 85 06 __ STA WORK + 3 
1197 : a9 9c __ LDA #$9c
1199 : 85 04 __ STA WORK + 1 
119b : a9 5f __ LDA #$5f
119d : 85 05 __ STA WORK + 2 
119f : 20 7f 17 JSR $177f ; (freg + 20)
11a2 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
11a5 : a2 47 __ LDX #$47
11a7 : 20 6f 17 JSR $176f ; (freg + 4)
11aa : 20 9d 18 JSR $189d ; (crt_fmul + 0)
11ad : a9 6c __ LDA #$6c
11af : 85 03 __ STA WORK + 0 
11b1 : a9 41 __ LDA #$41
11b3 : 85 06 __ STA WORK + 3 
11b5 : a9 89 __ LDA #$89
11b7 : 85 04 __ STA WORK + 1 
11b9 : a9 21 __ LDA #$21
11bb : 85 05 __ STA WORK + 2 
11bd : 20 7f 17 JSR $177f ; (freg + 20)
11c0 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
11c3 : a2 47 __ LDX #$47
11c5 : 20 6f 17 JSR $176f ; (freg + 4)
11c8 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
11cb : a9 1c __ LDA #$1c
11cd : 85 03 __ STA WORK + 0 
11cf : a9 c0 __ LDA #$c0
11d1 : 85 06 __ STA WORK + 3 
11d3 : a9 61 __ LDA #$61
11d5 : 85 04 __ STA WORK + 1 
11d7 : a9 72 __ LDA #$72
11d9 : 85 05 __ STA WORK + 2 
11db : 20 7f 17 JSR $177f ; (freg + 20)
11de : 20 b6 17 JSR $17b6 ; (faddsub + 6)
11e1 : a2 43 __ LDX #$43
11e3 : 20 6f 17 JSR $176f ; (freg + 4)
11e6 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
11e9 : a9 18 __ LDA #$18
11eb : 85 03 __ STA WORK + 0 
11ed : a9 3f __ LDA #$3f
11ef : 85 06 __ STA WORK + 3 
11f1 : a9 72 __ LDA #$72
11f3 : 85 04 __ STA WORK + 1 
11f5 : a9 31 __ LDA #$31
11f7 : 85 05 __ STA WORK + 2 
11f9 : 20 7f 17 JSR $177f ; (freg + 20)
11fc : 4c 9d 18 JMP $189d ; (crt_fmul + 0)
.s6:
11ff : 85 1b __ STA ACCU + 0 
1201 : 85 1c __ STA ACCU + 1 
1203 : a9 80 __ LDA #$80
1205 : 85 1d __ STA ACCU + 2 
1207 : a9 3f __ LDA #$3f
1209 : 85 1e __ STA ACCU + 3 
.s3:
120b : 60 __ __ RTS
--------------------------------------------------------------------
pow: ; pow(float,float)->float
;  23, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
120c : a5 11 __ LDA P4 ; (p + 0)
120e : 85 0d __ STA P0 
1210 : a5 12 __ LDA P5 ; (p + 1)
1212 : 85 0e __ STA P1 
1214 : a5 13 __ LDA P6 ; (p + 2)
1216 : 85 0f __ STA P2 
1218 : a5 14 __ LDA P7 ; (p + 3)
121a : 85 10 __ STA P3 
121c : 20 d6 10 JSR $10d6 ; (log.s4 + 0)
121f : a5 15 __ LDA P8 ; (q + 0)
1221 : 85 03 __ STA WORK + 0 
1223 : a5 16 __ LDA P9 ; (q + 1)
1225 : 85 04 __ STA WORK + 1 
1227 : a5 17 __ LDA P10 ; (q + 2)
1229 : 85 05 __ STA WORK + 2 
122b : a5 18 __ LDA P11 ; (q + 3)
122d : 85 06 __ STA WORK + 3 
122f : 20 7f 17 JSR $177f ; (freg + 20)
1232 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1235 : a5 1b __ LDA ACCU + 0 
1237 : 85 0d __ STA P0 
1239 : a5 1c __ LDA ACCU + 1 
123b : 85 0e __ STA P1 
123d : a5 1d __ LDA ACCU + 2 
123f : 85 0f __ STA P2 
1241 : a5 1e __ LDA ACCU + 3 
1243 : 85 10 __ STA P3 
1245 : 4c 48 12 JMP $1248 ; (exp.s4 + 0)
--------------------------------------------------------------------
exp: ; exp(float)->float
;  19, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
1248 : a9 00 __ LDA #$00
124a : 8d f8 9f STA $9ff8 ; (x + 0)
124d : 8d f9 9f STA $9ff9 ; (x + 1)
1250 : a5 0d __ LDA P0 ; (f + 0)
1252 : 85 1b __ STA ACCU + 0 
1254 : a5 0e __ LDA P1 ; (f + 1)
1256 : 85 1c __ STA ACCU + 1 
1258 : a5 0f __ LDA P2 ; (f + 2)
125a : 85 1d __ STA ACCU + 2 
125c : a5 10 __ LDA P3 ; (f + 3)
125e : 85 1e __ STA ACCU + 3 
1260 : a9 3b __ LDA #$3b
1262 : 85 03 __ STA WORK + 0 
1264 : a9 3f __ LDA #$3f
1266 : 85 06 __ STA WORK + 3 
1268 : a9 aa __ LDA #$aa
126a : 85 04 __ STA WORK + 1 
126c : a9 b8 __ LDA #$b8
126e : 85 05 __ STA WORK + 2 
1270 : 20 7f 17 JSR $177f ; (freg + 20)
1273 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1276 : a5 1b __ LDA ACCU + 0 
1278 : 85 43 __ STA T0 + 0 
127a : a5 1c __ LDA ACCU + 1 
127c : 85 44 __ STA T0 + 1 
127e : a5 1d __ LDA ACCU + 2 
1280 : 85 45 __ STA T0 + 2 
1282 : a5 1e __ LDA ACCU + 3 
1284 : 85 46 __ STA T0 + 3 
1286 : 20 8f 17 JSR $178f ; (freg + 36)
1289 : 20 13 1a JSR $1a13 ; (fround + 0)
128c : a5 1b __ LDA ACCU + 0 
128e : 85 47 __ STA T1 + 0 
1290 : a5 1c __ LDA ACCU + 1 
1292 : 85 48 __ STA T1 + 1 
1294 : a5 1d __ LDA ACCU + 2 
1296 : 85 49 __ STA T1 + 2 
1298 : a5 1e __ LDA ACCU + 3 
129a : 85 4a __ STA T1 + 3 
129c : 20 0d 1b JSR $1b0d ; (f32_to_i16 + 0)
129f : 18 __ __ CLC
12a0 : a5 1b __ LDA ACCU + 0 
12a2 : 69 7f __ ADC #$7f
12a4 : aa __ __ TAX
12a5 : a5 1c __ LDA ACCU + 1 
12a7 : 69 00 __ ADC #$00
12a9 : 4a __ __ LSR
12aa : 8a __ __ TXA
12ab : 6a __ __ ROR
12ac : 8d fb 9f STA $9ffb ; (x + 3)
12af : a9 00 __ LDA #$00
12b1 : 6a __ __ ROR
12b2 : 8d fa 9f STA $9ffa ; (x + 2)
12b5 : a5 43 __ LDA T0 + 0 
12b7 : 85 1b __ STA ACCU + 0 
12b9 : a5 44 __ LDA T0 + 1 
12bb : 85 1c __ STA ACCU + 1 
12bd : a5 45 __ LDA T0 + 2 
12bf : 85 1d __ STA ACCU + 2 
12c1 : a5 46 __ LDA T0 + 3 
12c3 : 85 1e __ STA ACCU + 3 
12c5 : a2 47 __ LDX #$47
12c7 : 20 6f 17 JSR $176f ; (freg + 4)
12ca : 20 b0 17 JSR $17b0 ; (faddsub + 0)
12cd : a5 1b __ LDA ACCU + 0 
12cf : 85 43 __ STA T0 + 0 
12d1 : a5 1c __ LDA ACCU + 1 
12d3 : 85 44 __ STA T0 + 1 
12d5 : a5 1d __ LDA ACCU + 2 
12d7 : 85 45 __ STA T0 + 2 
12d9 : a5 1e __ LDA ACCU + 3 
12db : 85 46 __ STA T0 + 3 
12dd : a9 fc __ LDA #$fc
12df : 85 03 __ STA WORK + 0 
12e1 : a9 3a __ LDA #$3a
12e3 : 85 06 __ STA WORK + 3 
12e5 : a9 4d __ LDA #$4d
12e7 : 85 04 __ STA WORK + 1 
12e9 : a9 f8 __ LDA #$f8
12eb : 85 05 __ STA WORK + 2 
12ed : 20 7f 17 JSR $177f ; (freg + 20)
12f0 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
12f3 : a9 70 __ LDA #$70
12f5 : 85 03 __ STA WORK + 0 
12f7 : a9 3c __ LDA #$3c
12f9 : 85 06 __ STA WORK + 3 
12fb : a9 7c __ LDA #$7c
12fd : 85 04 __ STA WORK + 1 
12ff : a9 12 __ LDA #$12
1301 : 85 05 __ STA WORK + 2 
1303 : 20 7f 17 JSR $177f ; (freg + 20)
1306 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1309 : a2 43 __ LDX #$43
130b : 20 6f 17 JSR $176f ; (freg + 4)
130e : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1311 : a9 42 __ LDA #$42
1313 : 85 03 __ STA WORK + 0 
1315 : a9 3d __ LDA #$3d
1317 : 85 06 __ STA WORK + 3 
1319 : a9 de __ LDA #$de
131b : 85 04 __ STA WORK + 1 
131d : a9 64 __ LDA #$64
131f : 85 05 __ STA WORK + 2 
1321 : 20 7f 17 JSR $177f ; (freg + 20)
1324 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1327 : a2 43 __ LDX #$43
1329 : 20 6f 17 JSR $176f ; (freg + 4)
132c : 20 9d 18 JSR $189d ; (crt_fmul + 0)
132f : a9 2e __ LDA #$2e
1331 : 85 03 __ STA WORK + 0 
1333 : a9 3e __ LDA #$3e
1335 : 85 06 __ STA WORK + 3 
1337 : a9 e5 __ LDA #$e5
1339 : 85 04 __ STA WORK + 1 
133b : a9 75 __ LDA #$75
133d : 85 05 __ STA WORK + 2 
133f : 20 7f 17 JSR $177f ; (freg + 20)
1342 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1345 : a2 43 __ LDX #$43
1347 : 20 6f 17 JSR $176f ; (freg + 4)
134a : 20 9d 18 JSR $189d ; (crt_fmul + 0)
134d : a9 b7 __ LDA #$b7
134f : 85 03 __ STA WORK + 0 
1351 : a9 3f __ LDA #$3f
1353 : 85 06 __ STA WORK + 3 
1355 : a9 72 __ LDA #$72
1357 : 85 04 __ STA WORK + 1 
1359 : a9 31 __ LDA #$31
135b : 85 05 __ STA WORK + 2 
135d : 20 7f 17 JSR $177f ; (freg + 20)
1360 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1363 : a2 43 __ LDX #$43
1365 : 20 6f 17 JSR $176f ; (freg + 4)
1368 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
136b : a9 00 __ LDA #$00
136d : 85 03 __ STA WORK + 0 
136f : 85 04 __ STA WORK + 1 
1371 : a9 80 __ LDA #$80
1373 : 85 05 __ STA WORK + 2 
1375 : a9 3f __ LDA #$3f
1377 : 85 06 __ STA WORK + 3 
1379 : 20 7f 17 JSR $177f ; (freg + 20)
137c : 20 b6 17 JSR $17b6 ; (faddsub + 6)
137f : ad f8 9f LDA $9ff8 ; (x + 0)
1382 : 85 03 __ STA WORK + 0 
1384 : ad f9 9f LDA $9ff9 ; (x + 1)
1387 : 85 04 __ STA WORK + 1 
1389 : ad fa 9f LDA $9ffa ; (x + 2)
138c : 85 05 __ STA WORK + 2 
138e : ad fb 9f LDA $9ffb ; (x + 3)
1391 : 85 06 __ STA WORK + 3 
1393 : 20 7f 17 JSR $177f ; (freg + 20)
1396 : 4c 9d 18 JMP $189d ; (crt_fmul + 0)
--------------------------------------------------------------------
light: ; light(float,float,float)->i16
;  88, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbmulti3d.c"
.s4:
1399 : ad fc 9f LDA $9ffc ; (sstack + 0)
139c : 85 1b __ STA ACCU + 0 ; (h + 2)
139e : ad fd 9f LDA $9ffd ; (sstack + 1)
13a1 : 85 1c __ STA ACCU + 1 ; (h + 3)
13a3 : ad fe 9f LDA $9ffe ; (sstack + 2)
13a6 : 85 1d __ STA ACCU + 2 
13a8 : ad ff 9f LDA $9fff ; (sstack + 3)
13ab : 85 1e __ STA ACCU + 3 
13ad : a5 15 __ LDA P8 ; (hu + 0)
13af : 85 03 __ STA WORK + 0 
13b1 : a5 16 __ LDA P9 ; (hu + 1)
13b3 : 85 04 __ STA WORK + 1 
13b5 : a5 17 __ LDA P10 ; (hu + 2)
13b7 : 85 05 __ STA WORK + 2 
13b9 : a5 18 __ LDA P11 ; (hu + 3)
13bb : 85 06 __ STA WORK + 3 
13bd : 20 7f 17 JSR $177f ; (freg + 20)
13c0 : 20 b0 17 JSR $17b0 ; (faddsub + 0)
13c3 : a5 1b __ LDA ACCU + 0 ; (h + 2)
13c5 : 85 4f __ STA T3 + 0 
13c7 : a5 1c __ LDA ACCU + 1 ; (h + 3)
13c9 : 85 50 __ STA T3 + 1 
13cb : a5 1d __ LDA ACCU + 2 
13cd : 85 51 __ STA T3 + 2 
13cf : a5 1e __ LDA ACCU + 3 
13d1 : 85 52 __ STA T3 + 3 
13d3 : a2 1b __ LDX #$1b
13d5 : 20 6f 17 JSR $176f ; (freg + 4)
13d8 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
13db : a5 1b __ LDA ACCU + 0 ; (h + 2)
13dd : 85 47 __ STA T1 + 0 
13df : a5 1c __ LDA ACCU + 1 ; (h + 3)
13e1 : 85 48 __ STA T1 + 1 
13e3 : a5 1d __ LDA ACCU + 2 
13e5 : 85 49 __ STA T1 + 2 
13e7 : a5 1e __ LDA ACCU + 3 
13e9 : 85 4a __ STA T1 + 3 
13eb : ad fc 9f LDA $9ffc ; (sstack + 0)
13ee : 85 1b __ STA ACCU + 0 ; (h + 2)
13f0 : ad fd 9f LDA $9ffd ; (sstack + 1)
13f3 : 85 1c __ STA ACCU + 1 ; (h + 3)
13f5 : ad fe 9f LDA $9ffe ; (sstack + 2)
13f8 : 85 1d __ STA ACCU + 2 
13fa : ad ff 9f LDA $9fff ; (sstack + 3)
13fd : 85 1e __ STA ACCU + 3 
13ff : a5 11 __ LDA P4 ; (hl + 0)
1401 : 85 03 __ STA WORK + 0 
1403 : a5 12 __ LDA P5 ; (hl + 1)
1405 : 85 04 __ STA WORK + 1 
1407 : a5 13 __ LDA P6 ; (hl + 2)
1409 : 85 05 __ STA WORK + 2 
140b : a5 14 __ LDA P7 ; (hl + 3)
140d : 85 06 __ STA WORK + 3 
140f : 20 7f 17 JSR $177f ; (freg + 20)
1412 : 20 b0 17 JSR $17b0 ; (faddsub + 0)
1415 : a5 1b __ LDA ACCU + 0 ; (h + 2)
1417 : 85 4b __ STA T2 + 0 
1419 : a5 1c __ LDA ACCU + 1 ; (h + 3)
141b : 85 4c __ STA T2 + 1 
141d : a5 1d __ LDA ACCU + 2 
141f : 85 4d __ STA T2 + 2 
1421 : a5 1e __ LDA ACCU + 3 
1423 : 85 4e __ STA T2 + 3 
1425 : a2 1b __ LDX #$1b
1427 : 20 6f 17 JSR $176f ; (freg + 4)
142a : 20 9d 18 JSR $189d ; (crt_fmul + 0)
142d : a9 0a __ LDA #$0a
142f : 85 03 __ STA WORK + 0 
1431 : a9 3c __ LDA #$3c
1433 : 85 06 __ STA WORK + 3 
1435 : a9 d7 __ LDA #$d7
1437 : 85 04 __ STA WORK + 1 
1439 : a9 23 __ LDA #$23
143b : 85 05 __ STA WORK + 2 
143d : 20 7f 17 JSR $177f ; (freg + 20)
1440 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1443 : a2 47 __ LDX #$47
1445 : 20 6f 17 JSR $176f ; (freg + 4)
1448 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
144b : a5 1b __ LDA ACCU + 0 ; (h + 2)
144d : 85 0d __ STA P0 
144f : a5 1c __ LDA ACCU + 1 ; (h + 3)
1451 : 85 0e __ STA P1 
1453 : a5 1d __ LDA ACCU + 2 
1455 : 85 0f __ STA P2 
1457 : a5 1e __ LDA ACCU + 3 
1459 : 85 10 __ STA P3 
145b : 20 f2 14 JSR $14f2 ; (sqrt.s4 + 0)
145e : a5 1b __ LDA ACCU + 0 ; (h + 2)
1460 : 85 43 __ STA T0 + 0 
1462 : a5 1c __ LDA ACCU + 1 ; (h + 3)
1464 : 85 44 __ STA T0 + 1 
1466 : a5 1d __ LDA ACCU + 2 
1468 : 85 45 __ STA T0 + 2 
146a : a5 1e __ LDA ACCU + 3 
146c : 85 46 __ STA T0 + 3 
146e : a9 00 __ LDA #$00
1470 : 85 1b __ STA ACCU + 0 ; (h + 2)
1472 : 85 1c __ STA ACCU + 1 ; (h + 3)
1474 : 85 1d __ STA ACCU + 2 
1476 : a9 c0 __ LDA #$c0
1478 : 85 1e __ STA ACCU + 3 
147a : a2 4b __ LDX #$4b
147c : 20 6f 17 JSR $176f ; (freg + 4)
147f : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1482 : a9 cc __ LDA #$cc
1484 : 85 04 __ STA WORK + 1 
1486 : 85 05 __ STA WORK + 2 
1488 : a9 cd __ LDA #$cd
148a : 85 03 __ STA WORK + 0 
148c : a9 3d __ LDA #$3d
148e : 85 06 __ STA WORK + 3 
1490 : 20 7f 17 JSR $177f ; (freg + 20)
1493 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1496 : a2 4f __ LDX #$4f
1498 : 20 6f 17 JSR $176f ; (freg + 4)
149b : 20 b6 17 JSR $17b6 ; (faddsub + 6)
149e : a2 43 __ LDX #$43
14a0 : 20 6f 17 JSR $176f ; (freg + 4)
14a3 : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
14a6 : a9 60 __ LDA #$60
14a8 : 85 03 __ STA WORK + 0 
14aa : a9 3e __ LDA #$3e
14ac : 85 06 __ STA WORK + 3 
14ae : a9 e5 __ LDA #$e5
14b0 : 85 04 __ STA WORK + 1 
14b2 : a9 d0 __ LDA #$d0
14b4 : 85 05 __ STA WORK + 2 
14b6 : 20 7f 17 JSR $177f ; (freg + 20)
14b9 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
14bc : a9 00 __ LDA #$00
14be : 85 03 __ STA WORK + 0 
14c0 : 85 04 __ STA WORK + 1 
14c2 : 85 05 __ STA WORK + 2 
14c4 : a9 41 __ LDA #$41
14c6 : 85 06 __ STA WORK + 3 
14c8 : 20 7f 17 JSR $177f ; (freg + 20)
14cb : 20 9d 18 JSR $189d ; (crt_fmul + 0)
14ce : 20 8f 17 JSR $178f ; (freg + 36)
14d1 : 20 13 1a JSR $1a13 ; (fround + 0)
14d4 : 20 0d 1b JSR $1b0d ; (f32_to_i16 + 0)
14d7 : a5 1c __ LDA ACCU + 1 ; (h + 3)
14d9 : 10 07 __ BPL $14e2 ; (light.s5 + 0)
.s8:
14db : a9 00 __ LDA #$00
14dd : 85 1b __ STA ACCU + 0 ; (h + 2)
.s9:
14df : 85 1c __ STA ACCU + 1 ; (h + 3)
.s3:
14e1 : 60 __ __ RTS
.s5:
14e2 : d0 06 __ BNE $14ea ; (light.s6 + 0)
.s7:
14e4 : a5 1b __ LDA ACCU + 0 ; (h + 2)
14e6 : c9 08 __ CMP #$08
14e8 : 90 f7 __ BCC $14e1 ; (light.s3 + 0)
.s6:
14ea : a9 07 __ LDA #$07
14ec : 85 1b __ STA ACCU + 0 ; (h + 2)
14ee : a9 00 __ LDA #$00
14f0 : f0 ed __ BEQ $14df ; (light.s9 + 0)
--------------------------------------------------------------------
sqrt: ; sqrt(float)->float
;  24, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
14f2 : a5 10 __ LDA P3 ; (f + 3)
14f4 : 29 7f __ AND #$7f
14f6 : 05 0f __ ORA P2 ; (f + 2)
14f8 : 05 0e __ ORA P1 ; (f + 1)
14fa : 05 0d __ ORA P0 ; (f + 0)
14fc : f0 0f __ BEQ $150d ; (sqrt.s6 + 0)
.s7:
14fe : 24 10 __ BIT P3 ; (f + 3)
1500 : 10 0b __ BPL $150d ; (sqrt.s6 + 0)
.s5:
1502 : a9 00 __ LDA #$00
1504 : 85 1b __ STA ACCU + 0 
1506 : 85 1c __ STA ACCU + 1 
1508 : 85 1d __ STA ACCU + 2 
150a : 85 1e __ STA ACCU + 3 
.s3:
150c : 60 __ __ RTS
.s6:
150d : a5 0d __ LDA P0 ; (f + 0)
150f : 85 1b __ STA ACCU + 0 
1511 : 8d f8 9f STA $9ff8 ; (x + 0)
1514 : a5 0e __ LDA P1 ; (f + 1)
1516 : 85 1c __ STA ACCU + 1 
1518 : 8d f9 9f STA $9ff9 ; (x + 1)
151b : a5 0f __ LDA P2 ; (f + 2)
151d : 85 1d __ STA ACCU + 2 
151f : 0a __ __ ASL
1520 : a5 10 __ LDA P3 ; (f + 3)
1522 : 85 1e __ STA ACCU + 3 
1524 : 2a __ __ ROL
1525 : aa __ __ TAX
1526 : a9 00 __ LDA #$00
1528 : 69 ff __ ADC #$ff
152a : 49 ff __ EOR #$ff
152c : a8 __ __ TAY
152d : 8a __ __ TXA
152e : 38 __ __ SEC
152f : e9 7f __ SBC #$7f
1531 : aa __ __ TAX
1532 : b0 01 __ BCS $1535 ; (sqrt.s9 + 0)
.s8:
1534 : 88 __ __ DEY
.s9:
1535 : 98 __ __ TYA
1536 : 0a __ __ ASL
1537 : 8a __ __ TXA
1538 : 69 00 __ ADC #$00
153a : 85 43 __ STA T1 + 0 
153c : 98 __ __ TYA
153d : 69 00 __ ADC #$00
153f : c9 80 __ CMP #$80
1541 : 6a __ __ ROR
1542 : 66 43 __ ROR T1 + 0 
1544 : a8 __ __ TAY
1545 : 18 __ __ CLC
1546 : a5 43 __ LDA T1 + 0 
1548 : 69 7f __ ADC #$7f
154a : aa __ __ TAX
154b : 98 __ __ TYA
154c : 69 00 __ ADC #$00
154e : 4a __ __ LSR
154f : 8a __ __ TXA
1550 : 6a __ __ ROR
1551 : 8d fb 9f STA $9ffb ; (x + 3)
1554 : a9 00 __ LDA #$00
1556 : 6a __ __ ROR
1557 : 8d fa 9f STA $9ffa ; (x + 2)
155a : ad f8 9f LDA $9ff8 ; (x + 0)
155d : 85 43 __ STA T1 + 0 
155f : ad f9 9f LDA $9ff9 ; (x + 1)
1562 : 85 44 __ STA T1 + 1 
1564 : ad fa 9f LDA $9ffa ; (x + 2)
1567 : 85 45 __ STA T1 + 2 
1569 : ad fb 9f LDA $9ffb ; (x + 3)
156c : 85 46 __ STA T1 + 3 
156e : a2 43 __ LDX #$43
1570 : 20 6f 17 JSR $176f ; (freg + 4)
1573 : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
1576 : a2 43 __ LDX #$43
1578 : 20 6f 17 JSR $176f ; (freg + 4)
157b : 20 b6 17 JSR $17b6 ; (faddsub + 6)
157e : a9 00 __ LDA #$00
1580 : 85 03 __ STA WORK + 0 
1582 : 85 04 __ STA WORK + 1 
1584 : 85 05 __ STA WORK + 2 
1586 : a9 3f __ LDA #$3f
1588 : 85 06 __ STA WORK + 3 
158a : 20 7f 17 JSR $177f ; (freg + 20)
158d : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1590 : a5 1b __ LDA ACCU + 0 
1592 : 85 43 __ STA T1 + 0 
1594 : a5 1c __ LDA ACCU + 1 
1596 : 85 44 __ STA T1 + 1 
1598 : a5 1d __ LDA ACCU + 2 
159a : 85 45 __ STA T1 + 2 
159c : a5 1e __ LDA ACCU + 3 
159e : 85 46 __ STA T1 + 3 
15a0 : a5 0d __ LDA P0 ; (f + 0)
15a2 : 85 1b __ STA ACCU + 0 
15a4 : a5 0e __ LDA P1 ; (f + 1)
15a6 : 85 1c __ STA ACCU + 1 
15a8 : a5 0f __ LDA P2 ; (f + 2)
15aa : 85 1d __ STA ACCU + 2 
15ac : a5 10 __ LDA P3 ; (f + 3)
15ae : 85 1e __ STA ACCU + 3 
15b0 : a2 43 __ LDX #$43
15b2 : 20 6f 17 JSR $176f ; (freg + 4)
15b5 : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
15b8 : a2 43 __ LDX #$43
15ba : 20 6f 17 JSR $176f ; (freg + 4)
15bd : 20 b6 17 JSR $17b6 ; (faddsub + 6)
15c0 : a9 00 __ LDA #$00
15c2 : 85 03 __ STA WORK + 0 
15c4 : 85 04 __ STA WORK + 1 
15c6 : 85 05 __ STA WORK + 2 
15c8 : a9 3f __ LDA #$3f
15ca : 85 06 __ STA WORK + 3 
15cc : 20 7f 17 JSR $177f ; (freg + 20)
15cf : 20 9d 18 JSR $189d ; (crt_fmul + 0)
15d2 : a5 1b __ LDA ACCU + 0 
15d4 : 85 43 __ STA T1 + 0 
15d6 : a5 1c __ LDA ACCU + 1 
15d8 : 85 44 __ STA T1 + 1 
15da : a5 1d __ LDA ACCU + 2 
15dc : 85 45 __ STA T1 + 2 
15de : a5 1e __ LDA ACCU + 3 
15e0 : 85 46 __ STA T1 + 3 
15e2 : a5 0d __ LDA P0 ; (f + 0)
15e4 : 85 1b __ STA ACCU + 0 
15e6 : a5 0e __ LDA P1 ; (f + 1)
15e8 : 85 1c __ STA ACCU + 1 
15ea : a5 0f __ LDA P2 ; (f + 2)
15ec : 85 1d __ STA ACCU + 2 
15ee : a5 10 __ LDA P3 ; (f + 3)
15f0 : 85 1e __ STA ACCU + 3 
15f2 : a2 43 __ LDX #$43
15f4 : 20 6f 17 JSR $176f ; (freg + 4)
15f7 : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
15fa : a2 43 __ LDX #$43
15fc : 20 6f 17 JSR $176f ; (freg + 4)
15ff : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1602 : a9 00 __ LDA #$00
1604 : 85 03 __ STA WORK + 0 
1606 : 85 04 __ STA WORK + 1 
1608 : 85 05 __ STA WORK + 2 
160a : a9 3f __ LDA #$3f
160c : 85 06 __ STA WORK + 3 
160e : 20 7f 17 JSR $177f ; (freg + 20)
1611 : 20 9d 18 JSR $189d ; (crt_fmul + 0)
1614 : a5 1b __ LDA ACCU + 0 
1616 : 85 43 __ STA T1 + 0 
1618 : a5 1c __ LDA ACCU + 1 
161a : 85 44 __ STA T1 + 1 
161c : a5 1d __ LDA ACCU + 2 
161e : 85 45 __ STA T1 + 2 
1620 : a5 1e __ LDA ACCU + 3 
1622 : 85 46 __ STA T1 + 3 
1624 : a5 0d __ LDA P0 ; (f + 0)
1626 : 85 1b __ STA ACCU + 0 
1628 : a5 0e __ LDA P1 ; (f + 1)
162a : 85 1c __ STA ACCU + 1 
162c : a5 0f __ LDA P2 ; (f + 2)
162e : 85 1d __ STA ACCU + 2 
1630 : a5 10 __ LDA P3 ; (f + 3)
1632 : 85 1e __ STA ACCU + 3 
1634 : a2 43 __ LDX #$43
1636 : 20 6f 17 JSR $176f ; (freg + 4)
1639 : 20 65 19 JSR $1965 ; (crt_fdiv + 0)
163c : a2 43 __ LDX #$43
163e : 20 6f 17 JSR $176f ; (freg + 4)
1641 : 20 b6 17 JSR $17b6 ; (faddsub + 6)
1644 : a9 00 __ LDA #$00
1646 : 85 03 __ STA WORK + 0 
1648 : 85 04 __ STA WORK + 1 
164a : 85 05 __ STA WORK + 2 
164c : a9 3f __ LDA #$3f
164e : 85 06 __ STA WORK + 3 
1650 : 20 7f 17 JSR $177f ; (freg + 20)
1653 : 4c 9d 18 JMP $189d ; (crt_fmul + 0)
--------------------------------------------------------------------
VLine: ; VLine(i16,i16,i16,u8)->void
;  26, "/home/honza/projects/c64/projects/oscar64/samples/fractals/mbmulti3d.c"
.s4:
1656 : 24 10 __ BIT P3 ; (py + 1)
1658 : 10 06 __ BPL $1660 ; (VLine.s5 + 0)
.s17:
165a : a9 00 __ LDA #$00
165c : 85 0f __ STA P2 ; (py + 0)
165e : 85 10 __ STA P3 ; (py + 1)
.s5:
1660 : a5 12 __ LDA P5 ; (ty + 1)
1662 : 10 01 __ BPL $1665 ; (VLine.s16 + 0)
1664 : 60 __ __ RTS
.s16:
1665 : f0 03 __ BEQ $166a ; (VLine.s15 + 0)
1667 : 4c 1e 17 JMP $171e ; (VLine.s13 + 0)
.s15:
166a : a5 11 __ LDA P4 ; (ty + 0)
166c : c9 65 __ CMP #$65
166e : b0 f7 __ BCS $1667 ; (VLine.s16 + 2)
.s12:
1670 : a5 10 __ LDA P3 ; (py + 1)
1672 : c5 12 __ CMP P5 ; (ty + 1)
1674 : f0 03 __ BEQ $1679 ; (VLine.s10 + 0)
1676 : 4c 17 17 JMP $1717 ; (VLine.s11 + 0)
.s10:
1679 : a5 0f __ LDA P2 ; (py + 0)
167b : c5 11 __ CMP P4 ; (ty + 0)
167d : 90 01 __ BCC $1680 ; (VLine.s6 + 0)
167f : 60 __ __ RTS
.s6:
1680 : 29 03 __ AND #$03
1682 : 0a __ __ ASL
1683 : 85 1b __ STA ACCU + 0 
1685 : a5 0f __ LDA P2 ; (py + 0)
1687 : 29 7c __ AND #$7c
1689 : 85 43 __ STA T2 + 0 
168b : 4a __ __ LSR
168c : 4a __ __ LSR
168d : 65 43 __ ADC T2 + 0 
168f : 4a __ __ LSR
1690 : 6a __ __ ROR
1691 : aa __ __ TAX
1692 : 29 80 __ AND #$80
1694 : 6a __ __ ROR
1695 : 05 1b __ ORA ACCU + 0 
1697 : a8 __ __ TAY
1698 : 8a __ __ TXA
1699 : 29 3f __ AND #$3f
169b : 69 e0 __ ADC #$e0
169d : 85 44 __ STA T2 + 1 
169f : a5 0d __ LDA P0 ; (x + 0)
16a1 : 29 fc __ AND #$fc
16a3 : 0a __ __ ASL
16a4 : 85 1c __ STA ACCU + 1 
16a6 : a5 0e __ LDA P1 ; (x + 1)
16a8 : 2a __ __ ROL
16a9 : aa __ __ TAX
16aa : 98 __ __ TYA
16ab : 18 __ __ CLC
16ac : 65 1c __ ADC ACCU + 1 
16ae : 85 43 __ STA T2 + 0 
16b0 : 8a __ __ TXA
16b1 : 65 44 __ ADC T2 + 1 
16b3 : 85 44 __ STA T2 + 1 
16b5 : a5 11 __ LDA P4 ; (ty + 0)
16b7 : 38 __ __ SEC
16b8 : e5 0f __ SBC P2 ; (py + 0)
16ba : 85 1b __ STA ACCU + 0 
16bc : a6 13 __ LDX P6 ; (c + 0)
16be : bd a8 1b LDA $1ba8,x ; (colors[0][0] + 0)
16c1 : 85 1d __ STA ACCU + 2 
16c3 : a5 0d __ LDA P0 ; (x + 0)
16c5 : 29 03 __ AND #$03
16c7 : 0a __ __ ASL
16c8 : aa __ __ TAX
16c9 : bd a0 1b LDA $1ba0,x ; (__shrtab192L + 0)
16cc : a8 __ __ TAY
16cd : 25 1d __ AND ACCU + 2 
16cf : 85 1e __ STA ACCU + 3 
16d1 : bd a0 1b LDA $1ba0,x ; (__shrtab192L + 0)
16d4 : 49 ff __ EOR #$ff
16d6 : 85 1d __ STA ACCU + 2 
16d8 : 98 __ __ TYA
16d9 : a6 13 __ LDX P6 ; (c + 0)
16db : 3d b9 1b AND $1bb9,x ; (colors[0][0] + 17)
16de : 85 1c __ STA ACCU + 1 
16e0 : a6 1b __ LDX ACCU + 0 
16e2 : f0 32 __ BEQ $1716 ; (VLine.s3 + 0)
.l7:
16e4 : a0 00 __ LDY #$00
16e6 : b1 43 __ LDA (T2 + 0),y 
16e8 : 25 1d __ AND ACCU + 2 
16ea : 05 1e __ ORA ACCU + 3 
16ec : 91 43 __ STA (T2 + 0),y 
16ee : c8 __ __ INY
16ef : b1 43 __ LDA (T2 + 0),y 
16f1 : 25 1d __ AND ACCU + 2 
16f3 : 05 1c __ ORA ACCU + 1 
16f5 : 91 43 __ STA (T2 + 0),y 
16f7 : 18 __ __ CLC
16f8 : a5 43 __ LDA T2 + 0 
16fa : 69 02 __ ADC #$02
16fc : 85 43 __ STA T2 + 0 
16fe : 90 02 __ BCC $1702 ; (VLine.s19 + 0)
.s18:
1700 : e6 44 __ INC T2 + 1 
.s19:
1702 : 29 07 __ AND #$07
1704 : d0 0d __ BNE $1713 ; (VLine.s9 + 0)
.s8:
1706 : 18 __ __ CLC
1707 : a5 43 __ LDA T2 + 0 
1709 : 69 38 __ ADC #$38
170b : 85 43 __ STA T2 + 0 
170d : a5 44 __ LDA T2 + 1 
170f : 69 01 __ ADC #$01
1711 : 85 44 __ STA T2 + 1 
.s9:
1713 : ca __ __ DEX
1714 : d0 ce __ BNE $16e4 ; (VLine.l7 + 0)
.s3:
1716 : 60 __ __ RTS
.s11:
1717 : b0 fd __ BCS $1716 ; (VLine.s3 + 0)
.s20:
1719 : a5 0f __ LDA P2 ; (py + 0)
171b : 4c 80 16 JMP $1680 ; (VLine.s6 + 0)
.s13:
171e : a9 64 __ LDA #$64
1720 : 85 11 __ STA P4 ; (ty + 0)
1722 : a5 10 __ LDA P3 ; (py + 1)
1724 : d0 f0 __ BNE $1716 ; (VLine.s3 + 0)
.s14:
1726 : a5 0f __ LDA P2 ; (py + 0)
1728 : c9 64 __ CMP #$64
172a : 90 ef __ BCC $171b ; (VLine.s20 + 2)
172c : 60 __ __ RTS
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
172d : 20 e4 ff JSR $ffe4 
1730 : 85 1b __ STA ACCU + 0 
1732 : a5 1b __ LDA ACCU + 0 
1734 : f0 f7 __ BEQ $172d ; (getch.l4 + 0)
.s5:
1736 : 4c 39 17 JMP $1739 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
1739 : a8 __ __ TAY
173a : ad ca 1b LDA $1bca ; (giocharmap + 0)
173d : f0 27 __ BEQ $1766 ; (convch.s5 + 0)
.s6:
173f : c0 0d __ CPY #$0d
1741 : d0 03 __ BNE $1746 ; (convch.s7 + 0)
.s16:
1743 : a9 0a __ LDA #$0a
.s3:
1745 : 60 __ __ RTS
.s7:
1746 : c9 02 __ CMP #$02
1748 : 90 1c __ BCC $1766 ; (convch.s5 + 0)
.s8:
174a : 98 __ __ TYA
174b : c0 41 __ CPY #$41
174d : 90 17 __ BCC $1766 ; (convch.s5 + 0)
.s9:
174f : c9 db __ CMP #$db
1751 : b0 13 __ BCS $1766 ; (convch.s5 + 0)
.s10:
1753 : c9 c1 __ CMP #$c1
1755 : 90 03 __ BCC $175a ; (convch.s11 + 0)
.s15:
1757 : 49 a0 __ EOR #$a0
1759 : a8 __ __ TAY
.s11:
175a : c9 7b __ CMP #$7b
175c : b0 08 __ BCS $1766 ; (convch.s5 + 0)
.s12:
175e : c9 61 __ CMP #$61
1760 : b0 06 __ BCS $1768 ; (convch.s14 + 0)
.s13:
1762 : c9 5b __ CMP #$5b
1764 : 90 02 __ BCC $1768 ; (convch.s14 + 0)
.s5:
1766 : 98 __ __ TYA
1767 : 60 __ __ RTS
.s14:
1768 : 49 20 __ EOR #$20
176a : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
176b : b1 19 __ LDA (IP + 0),y 
176d : c8 __ __ INY
176e : aa __ __ TAX
176f : b5 00 __ LDA $00,x 
1771 : 85 03 __ STA WORK + 0 
1773 : b5 01 __ LDA $01,x 
1775 : 85 04 __ STA WORK + 1 
1777 : b5 02 __ LDA $02,x 
1779 : 85 05 __ STA WORK + 2 
177b : b5 03 __ LDA WORK + 0,x 
177d : 85 06 __ STA WORK + 3 
177f : a5 05 __ LDA WORK + 2 
1781 : 0a __ __ ASL
1782 : a5 06 __ LDA WORK + 3 
1784 : 2a __ __ ROL
1785 : 85 08 __ STA WORK + 5 
1787 : f0 06 __ BEQ $178f ; (freg + 36)
1789 : a5 05 __ LDA WORK + 2 
178b : 09 80 __ ORA #$80
178d : 85 05 __ STA WORK + 2 
178f : a5 1d __ LDA ACCU + 2 
1791 : 0a __ __ ASL
1792 : a5 1e __ LDA ACCU + 3 
1794 : 2a __ __ ROL
1795 : 85 07 __ STA WORK + 4 
1797 : f0 06 __ BEQ $179f ; (freg + 52)
1799 : a5 1d __ LDA ACCU + 2 
179b : 09 80 __ ORA #$80
179d : 85 1d __ STA ACCU + 2 
179f : 60 __ __ RTS
17a0 : 06 1e __ ASL ACCU + 3 
17a2 : a5 07 __ LDA WORK + 4 
17a4 : 6a __ __ ROR
17a5 : 85 1e __ STA ACCU + 3 
17a7 : b0 06 __ BCS $17af ; (freg + 68)
17a9 : a5 1d __ LDA ACCU + 2 
17ab : 29 7f __ AND #$7f
17ad : 85 1d __ STA ACCU + 2 
17af : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
17b0 : a5 06 __ LDA WORK + 3 
17b2 : 49 80 __ EOR #$80
17b4 : 85 06 __ STA WORK + 3 
17b6 : a9 ff __ LDA #$ff
17b8 : c5 07 __ CMP WORK + 4 
17ba : f0 04 __ BEQ $17c0 ; (faddsub + 16)
17bc : c5 08 __ CMP WORK + 5 
17be : d0 11 __ BNE $17d1 ; (faddsub + 33)
17c0 : a5 1e __ LDA ACCU + 3 
17c2 : 09 7f __ ORA #$7f
17c4 : 85 1e __ STA ACCU + 3 
17c6 : a9 80 __ LDA #$80
17c8 : 85 1d __ STA ACCU + 2 
17ca : a9 00 __ LDA #$00
17cc : 85 1b __ STA ACCU + 0 
17ce : 85 1c __ STA ACCU + 1 
17d0 : 60 __ __ RTS
17d1 : 38 __ __ SEC
17d2 : a5 07 __ LDA WORK + 4 
17d4 : e5 08 __ SBC WORK + 5 
17d6 : f0 38 __ BEQ $1810 ; (faddsub + 96)
17d8 : aa __ __ TAX
17d9 : b0 25 __ BCS $1800 ; (faddsub + 80)
17db : e0 e9 __ CPX #$e9
17dd : b0 0e __ BCS $17ed ; (faddsub + 61)
17df : a5 08 __ LDA WORK + 5 
17e1 : 85 07 __ STA WORK + 4 
17e3 : a9 00 __ LDA #$00
17e5 : 85 1b __ STA ACCU + 0 
17e7 : 85 1c __ STA ACCU + 1 
17e9 : 85 1d __ STA ACCU + 2 
17eb : f0 23 __ BEQ $1810 ; (faddsub + 96)
17ed : a5 1d __ LDA ACCU + 2 
17ef : 4a __ __ LSR
17f0 : 66 1c __ ROR ACCU + 1 
17f2 : 66 1b __ ROR ACCU + 0 
17f4 : e8 __ __ INX
17f5 : d0 f8 __ BNE $17ef ; (faddsub + 63)
17f7 : 85 1d __ STA ACCU + 2 
17f9 : a5 08 __ LDA WORK + 5 
17fb : 85 07 __ STA WORK + 4 
17fd : 4c 10 18 JMP $1810 ; (faddsub + 96)
1800 : e0 18 __ CPX #$18
1802 : b0 33 __ BCS $1837 ; (faddsub + 135)
1804 : a5 05 __ LDA WORK + 2 
1806 : 4a __ __ LSR
1807 : 66 04 __ ROR WORK + 1 
1809 : 66 03 __ ROR WORK + 0 
180b : ca __ __ DEX
180c : d0 f8 __ BNE $1806 ; (faddsub + 86)
180e : 85 05 __ STA WORK + 2 
1810 : a5 1e __ LDA ACCU + 3 
1812 : 29 80 __ AND #$80
1814 : 85 1e __ STA ACCU + 3 
1816 : 45 06 __ EOR WORK + 3 
1818 : 30 31 __ BMI $184b ; (faddsub + 155)
181a : 18 __ __ CLC
181b : a5 1b __ LDA ACCU + 0 
181d : 65 03 __ ADC WORK + 0 
181f : 85 1b __ STA ACCU + 0 
1821 : a5 1c __ LDA ACCU + 1 
1823 : 65 04 __ ADC WORK + 1 
1825 : 85 1c __ STA ACCU + 1 
1827 : a5 1d __ LDA ACCU + 2 
1829 : 65 05 __ ADC WORK + 2 
182b : 85 1d __ STA ACCU + 2 
182d : 90 08 __ BCC $1837 ; (faddsub + 135)
182f : 66 1d __ ROR ACCU + 2 
1831 : 66 1c __ ROR ACCU + 1 
1833 : 66 1b __ ROR ACCU + 0 
1835 : e6 07 __ INC WORK + 4 
1837 : a5 07 __ LDA WORK + 4 
1839 : c9 ff __ CMP #$ff
183b : f0 83 __ BEQ $17c0 ; (faddsub + 16)
183d : 4a __ __ LSR
183e : 05 1e __ ORA ACCU + 3 
1840 : 85 1e __ STA ACCU + 3 
1842 : b0 06 __ BCS $184a ; (faddsub + 154)
1844 : a5 1d __ LDA ACCU + 2 
1846 : 29 7f __ AND #$7f
1848 : 85 1d __ STA ACCU + 2 
184a : 60 __ __ RTS
184b : 38 __ __ SEC
184c : a5 1b __ LDA ACCU + 0 
184e : e5 03 __ SBC WORK + 0 
1850 : 85 1b __ STA ACCU + 0 
1852 : a5 1c __ LDA ACCU + 1 
1854 : e5 04 __ SBC WORK + 1 
1856 : 85 1c __ STA ACCU + 1 
1858 : a5 1d __ LDA ACCU + 2 
185a : e5 05 __ SBC WORK + 2 
185c : 85 1d __ STA ACCU + 2 
185e : b0 19 __ BCS $1879 ; (faddsub + 201)
1860 : 38 __ __ SEC
1861 : a9 00 __ LDA #$00
1863 : e5 1b __ SBC ACCU + 0 
1865 : 85 1b __ STA ACCU + 0 
1867 : a9 00 __ LDA #$00
1869 : e5 1c __ SBC ACCU + 1 
186b : 85 1c __ STA ACCU + 1 
186d : a9 00 __ LDA #$00
186f : e5 1d __ SBC ACCU + 2 
1871 : 85 1d __ STA ACCU + 2 
1873 : a5 1e __ LDA ACCU + 3 
1875 : 49 80 __ EOR #$80
1877 : 85 1e __ STA ACCU + 3 
1879 : a5 1d __ LDA ACCU + 2 
187b : 30 ba __ BMI $1837 ; (faddsub + 135)
187d : 05 1c __ ORA ACCU + 1 
187f : 05 1b __ ORA ACCU + 0 
1881 : f0 0f __ BEQ $1892 ; (faddsub + 226)
1883 : c6 07 __ DEC WORK + 4 
1885 : f0 0b __ BEQ $1892 ; (faddsub + 226)
1887 : 06 1b __ ASL ACCU + 0 
1889 : 26 1c __ ROL ACCU + 1 
188b : 26 1d __ ROL ACCU + 2 
188d : 10 f4 __ BPL $1883 ; (faddsub + 211)
188f : 4c 37 18 JMP $1837 ; (faddsub + 135)
1892 : a9 00 __ LDA #$00
1894 : 85 1b __ STA ACCU + 0 
1896 : 85 1c __ STA ACCU + 1 
1898 : 85 1d __ STA ACCU + 2 
189a : 85 1e __ STA ACCU + 3 
189c : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
189d : a5 1b __ LDA ACCU + 0 
189f : 05 1c __ ORA ACCU + 1 
18a1 : 05 1d __ ORA ACCU + 2 
18a3 : f0 0e __ BEQ $18b3 ; (crt_fmul + 22)
18a5 : a5 03 __ LDA WORK + 0 
18a7 : 05 04 __ ORA WORK + 1 
18a9 : 05 05 __ ORA WORK + 2 
18ab : d0 09 __ BNE $18b6 ; (crt_fmul + 25)
18ad : 85 1b __ STA ACCU + 0 
18af : 85 1c __ STA ACCU + 1 
18b1 : 85 1d __ STA ACCU + 2 
18b3 : 85 1e __ STA ACCU + 3 
18b5 : 60 __ __ RTS
18b6 : a5 1e __ LDA ACCU + 3 
18b8 : 45 06 __ EOR WORK + 3 
18ba : 29 80 __ AND #$80
18bc : 85 1e __ STA ACCU + 3 
18be : a9 ff __ LDA #$ff
18c0 : c5 07 __ CMP WORK + 4 
18c2 : f0 42 __ BEQ $1906 ; (crt_fmul + 105)
18c4 : c5 08 __ CMP WORK + 5 
18c6 : f0 3e __ BEQ $1906 ; (crt_fmul + 105)
18c8 : a9 00 __ LDA #$00
18ca : 85 09 __ STA WORK + 6 
18cc : 85 0a __ STA WORK + 7 
18ce : 85 0b __ STA WORK + 8 
18d0 : a4 1b __ LDY ACCU + 0 
18d2 : a5 03 __ LDA WORK + 0 
18d4 : d0 06 __ BNE $18dc ; (crt_fmul + 63)
18d6 : a5 04 __ LDA WORK + 1 
18d8 : f0 0a __ BEQ $18e4 ; (crt_fmul + 71)
18da : d0 05 __ BNE $18e1 ; (crt_fmul + 68)
18dc : 20 37 19 JSR $1937 ; (crt_fmul8 + 0)
18df : a5 04 __ LDA WORK + 1 
18e1 : 20 37 19 JSR $1937 ; (crt_fmul8 + 0)
18e4 : a5 05 __ LDA WORK + 2 
18e6 : 20 37 19 JSR $1937 ; (crt_fmul8 + 0)
18e9 : 38 __ __ SEC
18ea : a5 0b __ LDA WORK + 8 
18ec : 30 06 __ BMI $18f4 ; (crt_fmul + 87)
18ee : 06 09 __ ASL WORK + 6 
18f0 : 26 0a __ ROL WORK + 7 
18f2 : 2a __ __ ROL
18f3 : 18 __ __ CLC
18f4 : 29 7f __ AND #$7f
18f6 : 85 0b __ STA WORK + 8 
18f8 : a5 07 __ LDA WORK + 4 
18fa : 65 08 __ ADC WORK + 5 
18fc : 90 19 __ BCC $1917 ; (crt_fmul + 122)
18fe : e9 7f __ SBC #$7f
1900 : b0 04 __ BCS $1906 ; (crt_fmul + 105)
1902 : c9 ff __ CMP #$ff
1904 : d0 15 __ BNE $191b ; (crt_fmul + 126)
1906 : a5 1e __ LDA ACCU + 3 
1908 : 09 7f __ ORA #$7f
190a : 85 1e __ STA ACCU + 3 
190c : a9 80 __ LDA #$80
190e : 85 1d __ STA ACCU + 2 
1910 : a9 00 __ LDA #$00
1912 : 85 1b __ STA ACCU + 0 
1914 : 85 1c __ STA ACCU + 1 
1916 : 60 __ __ RTS
1917 : e9 7e __ SBC #$7e
1919 : 90 15 __ BCC $1930 ; (crt_fmul + 147)
191b : 4a __ __ LSR
191c : 05 1e __ ORA ACCU + 3 
191e : 85 1e __ STA ACCU + 3 
1920 : a9 00 __ LDA #$00
1922 : 6a __ __ ROR
1923 : 05 0b __ ORA WORK + 8 
1925 : 85 1d __ STA ACCU + 2 
1927 : a5 0a __ LDA WORK + 7 
1929 : 85 1c __ STA ACCU + 1 
192b : a5 09 __ LDA WORK + 6 
192d : 85 1b __ STA ACCU + 0 
192f : 60 __ __ RTS
1930 : a9 00 __ LDA #$00
1932 : 85 1e __ STA ACCU + 3 
1934 : f0 d8 __ BEQ $190e ; (crt_fmul + 113)
1936 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1937 : 38 __ __ SEC
1938 : 6a __ __ ROR
1939 : 90 1e __ BCC $1959 ; (crt_fmul8 + 34)
193b : aa __ __ TAX
193c : 18 __ __ CLC
193d : 98 __ __ TYA
193e : 65 09 __ ADC WORK + 6 
1940 : 85 09 __ STA WORK + 6 
1942 : a5 0a __ LDA WORK + 7 
1944 : 65 1c __ ADC ACCU + 1 
1946 : 85 0a __ STA WORK + 7 
1948 : a5 0b __ LDA WORK + 8 
194a : 65 1d __ ADC ACCU + 2 
194c : 6a __ __ ROR
194d : 85 0b __ STA WORK + 8 
194f : 8a __ __ TXA
1950 : 66 0a __ ROR WORK + 7 
1952 : 66 09 __ ROR WORK + 6 
1954 : 4a __ __ LSR
1955 : f0 0d __ BEQ $1964 ; (crt_fmul8 + 45)
1957 : b0 e2 __ BCS $193b ; (crt_fmul8 + 4)
1959 : 66 0b __ ROR WORK + 8 
195b : 66 0a __ ROR WORK + 7 
195d : 66 09 __ ROR WORK + 6 
195f : 4a __ __ LSR
1960 : 90 f7 __ BCC $1959 ; (crt_fmul8 + 34)
1962 : d0 d7 __ BNE $193b ; (crt_fmul8 + 4)
1964 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1965 : a5 1b __ LDA ACCU + 0 
1967 : 05 1c __ ORA ACCU + 1 
1969 : 05 1d __ ORA ACCU + 2 
196b : d0 03 __ BNE $1970 ; (crt_fdiv + 11)
196d : 85 1e __ STA ACCU + 3 
196f : 60 __ __ RTS
1970 : a5 1e __ LDA ACCU + 3 
1972 : 45 06 __ EOR WORK + 3 
1974 : 29 80 __ AND #$80
1976 : 85 1e __ STA ACCU + 3 
1978 : a5 08 __ LDA WORK + 5 
197a : f0 62 __ BEQ $19de ; (crt_fdiv + 121)
197c : a5 07 __ LDA WORK + 4 
197e : c9 ff __ CMP #$ff
1980 : f0 5c __ BEQ $19de ; (crt_fdiv + 121)
1982 : a9 00 __ LDA #$00
1984 : 85 09 __ STA WORK + 6 
1986 : 85 0a __ STA WORK + 7 
1988 : 85 0b __ STA WORK + 8 
198a : a2 18 __ LDX #$18
198c : a5 1b __ LDA ACCU + 0 
198e : c5 03 __ CMP WORK + 0 
1990 : a5 1c __ LDA ACCU + 1 
1992 : e5 04 __ SBC WORK + 1 
1994 : a5 1d __ LDA ACCU + 2 
1996 : e5 05 __ SBC WORK + 2 
1998 : 90 13 __ BCC $19ad ; (crt_fdiv + 72)
199a : a5 1b __ LDA ACCU + 0 
199c : e5 03 __ SBC WORK + 0 
199e : 85 1b __ STA ACCU + 0 
19a0 : a5 1c __ LDA ACCU + 1 
19a2 : e5 04 __ SBC WORK + 1 
19a4 : 85 1c __ STA ACCU + 1 
19a6 : a5 1d __ LDA ACCU + 2 
19a8 : e5 05 __ SBC WORK + 2 
19aa : 85 1d __ STA ACCU + 2 
19ac : 38 __ __ SEC
19ad : 26 09 __ ROL WORK + 6 
19af : 26 0a __ ROL WORK + 7 
19b1 : 26 0b __ ROL WORK + 8 
19b3 : ca __ __ DEX
19b4 : f0 0a __ BEQ $19c0 ; (crt_fdiv + 91)
19b6 : 06 1b __ ASL ACCU + 0 
19b8 : 26 1c __ ROL ACCU + 1 
19ba : 26 1d __ ROL ACCU + 2 
19bc : b0 dc __ BCS $199a ; (crt_fdiv + 53)
19be : 90 cc __ BCC $198c ; (crt_fdiv + 39)
19c0 : 38 __ __ SEC
19c1 : a5 0b __ LDA WORK + 8 
19c3 : 30 06 __ BMI $19cb ; (crt_fdiv + 102)
19c5 : 06 09 __ ASL WORK + 6 
19c7 : 26 0a __ ROL WORK + 7 
19c9 : 2a __ __ ROL
19ca : 18 __ __ CLC
19cb : 29 7f __ AND #$7f
19cd : 85 0b __ STA WORK + 8 
19cf : a5 07 __ LDA WORK + 4 
19d1 : e5 08 __ SBC WORK + 5 
19d3 : 90 1a __ BCC $19ef ; (crt_fdiv + 138)
19d5 : 18 __ __ CLC
19d6 : 69 7f __ ADC #$7f
19d8 : b0 04 __ BCS $19de ; (crt_fdiv + 121)
19da : c9 ff __ CMP #$ff
19dc : d0 15 __ BNE $19f3 ; (crt_fdiv + 142)
19de : a5 1e __ LDA ACCU + 3 
19e0 : 09 7f __ ORA #$7f
19e2 : 85 1e __ STA ACCU + 3 
19e4 : a9 80 __ LDA #$80
19e6 : 85 1d __ STA ACCU + 2 
19e8 : a9 00 __ LDA #$00
19ea : 85 1c __ STA ACCU + 1 
19ec : 85 1b __ STA ACCU + 0 
19ee : 60 __ __ RTS
19ef : 69 7f __ ADC #$7f
19f1 : 90 15 __ BCC $1a08 ; (crt_fdiv + 163)
19f3 : 4a __ __ LSR
19f4 : 05 1e __ ORA ACCU + 3 
19f6 : 85 1e __ STA ACCU + 3 
19f8 : a9 00 __ LDA #$00
19fa : 6a __ __ ROR
19fb : 05 0b __ ORA WORK + 8 
19fd : 85 1d __ STA ACCU + 2 
19ff : a5 0a __ LDA WORK + 7 
1a01 : 85 1c __ STA ACCU + 1 
1a03 : a5 09 __ LDA WORK + 6 
1a05 : 85 1b __ STA ACCU + 0 
1a07 : 60 __ __ RTS
1a08 : a9 00 __ LDA #$00
1a0a : 85 1e __ STA ACCU + 3 
1a0c : 85 1d __ STA ACCU + 2 
1a0e : 85 1c __ STA ACCU + 1 
1a10 : 85 1b __ STA ACCU + 0 
1a12 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
1a13 : 24 1e __ BIT ACCU + 3 
1a15 : 10 13 __ BPL $1a2a ; (fround + 23)
1a17 : 30 6b __ BMI $1a84 ; (fround + 113)
1a19 : 24 1e __ BIT ACCU + 3 
1a1b : 30 0d __ BMI $1a2a ; (fround + 23)
1a1d : 10 65 __ BPL $1a84 ; (fround + 113)
1a1f : a9 00 __ LDA #$00
1a21 : 85 1b __ STA ACCU + 0 
1a23 : 85 1c __ STA ACCU + 1 
1a25 : 85 1d __ STA ACCU + 2 
1a27 : 85 1e __ STA ACCU + 3 
1a29 : 60 __ __ RTS
1a2a : a5 07 __ LDA WORK + 4 
1a2c : c9 7f __ CMP #$7f
1a2e : 90 ef __ BCC $1a1f ; (fround + 12)
1a30 : c9 87 __ CMP #$87
1a32 : 90 16 __ BCC $1a4a ; (fround + 55)
1a34 : c9 8f __ CMP #$8f
1a36 : 90 26 __ BCC $1a5e ; (fround + 75)
1a38 : c9 97 __ CMP #$97
1a3a : b0 34 __ BCS $1a70 ; (fround + 93)
1a3c : 38 __ __ SEC
1a3d : e9 8f __ SBC #$8f
1a3f : aa __ __ TAX
1a40 : a5 1b __ LDA ACCU + 0 
1a42 : 3d cb 1b AND $1bcb,x ; (ubitmask[0] + 0)
1a45 : 85 1b __ STA ACCU + 0 
1a47 : 4c 70 1a JMP $1a70 ; (fround + 93)
1a4a : 38 __ __ SEC
1a4b : e9 7f __ SBC #$7f
1a4d : aa __ __ TAX
1a4e : a5 1d __ LDA ACCU + 2 
1a50 : 3d cb 1b AND $1bcb,x ; (ubitmask[0] + 0)
1a53 : 85 1d __ STA ACCU + 2 
1a55 : a9 00 __ LDA #$00
1a57 : 85 1b __ STA ACCU + 0 
1a59 : 85 1c __ STA ACCU + 1 
1a5b : 4c 70 1a JMP $1a70 ; (fround + 93)
1a5e : 38 __ __ SEC
1a5f : e9 87 __ SBC #$87
1a61 : aa __ __ TAX
1a62 : a5 1c __ LDA ACCU + 1 
1a64 : 3d cb 1b AND $1bcb,x ; (ubitmask[0] + 0)
1a67 : 85 1c __ STA ACCU + 1 
1a69 : a9 00 __ LDA #$00
1a6b : 85 1b __ STA ACCU + 0 
1a6d : 4c 70 1a JMP $1a70 ; (fround + 93)
1a70 : 4c a0 17 JMP $17a0 ; (freg + 53)
1a73 : a9 7f __ LDA #$7f
1a75 : 85 07 __ STA WORK + 4 
1a77 : a9 00 __ LDA #$00
1a79 : 85 1b __ STA ACCU + 0 
1a7b : 85 1c __ STA ACCU + 1 
1a7d : a9 80 __ LDA #$80
1a7f : 85 1d __ STA ACCU + 2 
1a81 : 4c a0 17 JMP $17a0 ; (freg + 53)
1a84 : a5 1b __ LDA ACCU + 0 
1a86 : 05 1c __ ORA ACCU + 1 
1a88 : 05 1d __ ORA ACCU + 2 
1a8a : f0 93 __ BEQ $1a1f ; (fround + 12)
1a8c : a5 07 __ LDA WORK + 4 
1a8e : c9 7f __ CMP #$7f
1a90 : 90 e1 __ BCC $1a73 ; (fround + 96)
1a92 : c9 87 __ CMP #$87
1a94 : 90 2e __ BCC $1ac4 ; (fround + 177)
1a96 : c9 8f __ CMP #$8f
1a98 : 90 4c __ BCC $1ae6 ; (fround + 211)
1a9a : c9 97 __ CMP #$97
1a9c : b0 6c __ BCS $1b0a ; (fround + 247)
1a9e : 38 __ __ SEC
1a9f : e9 8f __ SBC #$8f
1aa1 : aa __ __ TAX
1aa2 : 18 __ __ CLC
1aa3 : bd cb 1b LDA $1bcb,x ; (ubitmask[0] + 0)
1aa6 : 49 ff __ EOR #$ff
1aa8 : 65 1b __ ADC ACCU + 0 
1aaa : 85 1b __ STA ACCU + 0 
1aac : a9 00 __ LDA #$00
1aae : 65 1c __ ADC ACCU + 1 
1ab0 : 85 1c __ STA ACCU + 1 
1ab2 : a9 00 __ LDA #$00
1ab4 : 65 1d __ ADC ACCU + 2 
1ab6 : 90 07 __ BCC $1abf ; (fround + 172)
1ab8 : 6a __ __ ROR
1ab9 : 66 1c __ ROR ACCU + 1 
1abb : 66 1b __ ROR ACCU + 0 
1abd : e6 07 __ INC WORK + 4 
1abf : 85 1d __ STA ACCU + 2 
1ac1 : 4c 2a 1a JMP $1a2a ; (fround + 23)
1ac4 : 38 __ __ SEC
1ac5 : e9 7f __ SBC #$7f
1ac7 : aa __ __ TAX
1ac8 : 18 __ __ CLC
1ac9 : a9 ff __ LDA #$ff
1acb : 65 1b __ ADC ACCU + 0 
1acd : a9 ff __ LDA #$ff
1acf : 65 1c __ ADC ACCU + 1 
1ad1 : bd cb 1b LDA $1bcb,x ; (ubitmask[0] + 0)
1ad4 : 49 ff __ EOR #$ff
1ad6 : 65 1d __ ADC ACCU + 2 
1ad8 : 90 07 __ BCC $1ae1 ; (fround + 206)
1ada : 6a __ __ ROR
1adb : 66 1c __ ROR ACCU + 1 
1add : 66 1b __ ROR ACCU + 0 
1adf : e6 07 __ INC WORK + 4 
1ae1 : 85 1d __ STA ACCU + 2 
1ae3 : 4c 2a 1a JMP $1a2a ; (fround + 23)
1ae6 : 38 __ __ SEC
1ae7 : e9 87 __ SBC #$87
1ae9 : aa __ __ TAX
1aea : 18 __ __ CLC
1aeb : a9 ff __ LDA #$ff
1aed : 65 1b __ ADC ACCU + 0 
1aef : bd cb 1b LDA $1bcb,x ; (ubitmask[0] + 0)
1af2 : 49 ff __ EOR #$ff
1af4 : 65 1c __ ADC ACCU + 1 
1af6 : 85 1c __ STA ACCU + 1 
1af8 : a9 00 __ LDA #$00
1afa : 65 1d __ ADC ACCU + 2 
1afc : 90 07 __ BCC $1b05 ; (fround + 242)
1afe : 6a __ __ ROR
1aff : 66 1c __ ROR ACCU + 1 
1b01 : 66 1b __ ROR ACCU + 0 
1b03 : e6 07 __ INC WORK + 4 
1b05 : 85 1d __ STA ACCU + 2 
1b07 : 4c 2a 1a JMP $1a2a ; (fround + 23)
1b0a : 4c a0 17 JMP $17a0 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
1b0d : 20 8f 17 JSR $178f ; (freg + 36)
1b10 : a5 07 __ LDA WORK + 4 
1b12 : c9 7f __ CMP #$7f
1b14 : b0 07 __ BCS $1b1d ; (f32_to_i16 + 16)
1b16 : a9 00 __ LDA #$00
1b18 : 85 1b __ STA ACCU + 0 
1b1a : 85 1c __ STA ACCU + 1 
1b1c : 60 __ __ RTS
1b1d : e9 8e __ SBC #$8e
1b1f : 90 16 __ BCC $1b37 ; (f32_to_i16 + 42)
1b21 : 24 1e __ BIT ACCU + 3 
1b23 : 30 09 __ BMI $1b2e ; (f32_to_i16 + 33)
1b25 : a9 ff __ LDA #$ff
1b27 : 85 1b __ STA ACCU + 0 
1b29 : a9 7f __ LDA #$7f
1b2b : 85 1c __ STA ACCU + 1 
1b2d : 60 __ __ RTS
1b2e : a9 00 __ LDA #$00
1b30 : 85 1b __ STA ACCU + 0 
1b32 : a9 80 __ LDA #$80
1b34 : 85 1c __ STA ACCU + 1 
1b36 : 60 __ __ RTS
1b37 : aa __ __ TAX
1b38 : a5 1c __ LDA ACCU + 1 
1b3a : 46 1d __ LSR ACCU + 2 
1b3c : 6a __ __ ROR
1b3d : e8 __ __ INX
1b3e : d0 fa __ BNE $1b3a ; (f32_to_i16 + 45)
1b40 : 24 1e __ BIT ACCU + 3 
1b42 : 10 0e __ BPL $1b52 ; (f32_to_i16 + 69)
1b44 : 38 __ __ SEC
1b45 : 49 ff __ EOR #$ff
1b47 : 69 00 __ ADC #$00
1b49 : 85 1b __ STA ACCU + 0 
1b4b : a9 00 __ LDA #$00
1b4d : e5 1d __ SBC ACCU + 2 
1b4f : 85 1c __ STA ACCU + 1 
1b51 : 60 __ __ RTS
1b52 : 85 1b __ STA ACCU + 0 
1b54 : a5 1d __ LDA ACCU + 2 
1b56 : 85 1c __ STA ACCU + 1 
1b58 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
1b59 : 24 1c __ BIT ACCU + 1 
1b5b : 30 03 __ BMI $1b60 ; (sint16_to_float + 7)
1b5d : 4c 77 1b JMP $1b77 ; (uint16_to_float + 0)
1b60 : 38 __ __ SEC
1b61 : a9 00 __ LDA #$00
1b63 : e5 1b __ SBC ACCU + 0 
1b65 : 85 1b __ STA ACCU + 0 
1b67 : a9 00 __ LDA #$00
1b69 : e5 1c __ SBC ACCU + 1 
1b6b : 85 1c __ STA ACCU + 1 
1b6d : 20 77 1b JSR $1b77 ; (uint16_to_float + 0)
1b70 : a5 1e __ LDA ACCU + 3 
1b72 : 09 80 __ ORA #$80
1b74 : 85 1e __ STA ACCU + 3 
1b76 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
1b77 : a5 1b __ LDA ACCU + 0 
1b79 : 05 1c __ ORA ACCU + 1 
1b7b : d0 05 __ BNE $1b82 ; (uint16_to_float + 11)
1b7d : 85 1d __ STA ACCU + 2 
1b7f : 85 1e __ STA ACCU + 3 
1b81 : 60 __ __ RTS
1b82 : a2 8e __ LDX #$8e
1b84 : a5 1c __ LDA ACCU + 1 
1b86 : 30 06 __ BMI $1b8e ; (uint16_to_float + 23)
1b88 : ca __ __ DEX
1b89 : 06 1b __ ASL ACCU + 0 
1b8b : 2a __ __ ROL
1b8c : 10 fa __ BPL $1b88 ; (uint16_to_float + 17)
1b8e : 0a __ __ ASL
1b8f : 85 1d __ STA ACCU + 2 
1b91 : a5 1b __ LDA ACCU + 0 
1b93 : 85 1c __ STA ACCU + 1 
1b95 : 8a __ __ TXA
1b96 : 4a __ __ LSR
1b97 : 85 1e __ STA ACCU + 3 
1b99 : a9 00 __ LDA #$00
1b9b : 85 1b __ STA ACCU + 0 
1b9d : 66 1d __ ROR ACCU + 2 
1b9f : 60 __ __ RTS
--------------------------------------------------------------------
__shrtab192L:
1ba0 : __ __ __ BYT c0 60 30 18 0c 06 03                            : .`0....
--------------------------------------------------------------------
spentry:
1ba7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
colors:
1ba8 : __ __ __ BYT 00 44 44 55 55 dd dd ff ff 88 88 aa aa ee ee ff : .DDUU...........
1bb8 : __ __ __ BYT ff 00 00 11 11 55 55 77 77 ff 00 22 22 aa aa bb : .....UUww..""...
1bc8 : __ __ __ BYT bb ff                                           : ..
--------------------------------------------------------------------
giocharmap:
1bca : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
ubitmask:
1bcb : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
