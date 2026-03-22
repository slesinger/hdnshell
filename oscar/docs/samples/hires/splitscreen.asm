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
080e : 8e fe 28 STX $28fe ; (spentry + 0)
0811 : a2 40 __ LDX #$40
0813 : a0 c2 __ LDY #$c2
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 42 __ CPX #$42
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 e0 __ CPY #$e0
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 88 __ LDA #$88
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
;  27, "/home/honza/projects/c64/projects/oscar64/samples/hires/splitscreen.c"
.s1:
0880 : a5 53 __ LDA T2 + 0 
0882 : 8d 8a 9f STA $9f8a ; (main@stack + 0)
0885 : a5 54 __ LDA T2 + 1 
0887 : 8d 8b 9f STA $9f8b ; (main@stack + 1)
.s4:
088a : 20 61 0c JSR $0c61 ; (mmap_trampoline.s4 + 0)
088d : a9 00 __ LDA #$00
088f : 85 11 __ STA P4 
0891 : 85 0d __ STA P0 
0893 : 85 0f __ STA P2 
0895 : a9 31 __ LDA #$31
0897 : 85 01 __ STA $01 
0899 : a9 d0 __ LDA #$d0
089b : 85 0e __ STA P1 
089d : 85 10 __ STA P3 
089f : a9 10 __ LDA #$10
08a1 : 85 12 __ STA P5 
08a3 : 20 ab 0c JSR $0cab ; (memcpy.s4 + 0)
08a6 : a9 35 __ LDA #$35
08a8 : 85 01 __ STA $01 
08aa : 20 da 0c JSR $0cda ; (rirq_init_kernal.s4 + 0)
08ad : a9 00 __ LDA #$00
08af : 8d 21 d0 STA $d021 
08b2 : 85 0f __ STA P2 
08b4 : 85 10 __ STA P3 
08b6 : a9 40 __ LDA #$40
08b8 : 85 11 __ STA P4 
08ba : a9 1f __ LDA #$1f
08bc : 85 12 __ STA P5 
08be : a9 10 __ LDA #$10
08c0 : a2 fa __ LDX #$fa
.l6:
08c2 : ca __ __ DEX
08c3 : 9d 00 c8 STA $c800,x 
08c6 : 9d fa c8 STA $c8fa,x 
08c9 : 9d f4 c9 STA $c9f4,x 
08cc : 9d ee ca STA $caee,x 
08cf : d0 f1 __ BNE $08c2 ; (main.l6 + 0)
.s5:
08d1 : a9 00 __ LDA #$00
08d3 : 85 0d __ STA P0 
08d5 : a9 e0 __ LDA #$e0
08d7 : 85 0e __ STA P1 
08d9 : 20 76 0d JSR $0d76 ; (memset.s4 + 0)
08dc : a9 00 __ LDA #$00
08de : 85 10 __ STA P3 
08e0 : 85 0e __ STA P1 
08e2 : a9 03 __ LDA #$03
08e4 : 85 0d __ STA P0 
08e6 : a9 e0 __ LDA #$e0
08e8 : 85 11 __ STA P4 
08ea : a9 c8 __ LDA #$c8
08ec : 85 0f __ STA P2 
08ee : 20 9a 0d JSR $0d9a ; (vic_setmode.s4 + 0)
08f1 : a9 02 __ LDA #$02
08f3 : 85 0f __ STA P2 
08f5 : a9 41 __ LDA #$41
08f7 : 85 0e __ STA P1 
08f9 : a9 20 __ LDA #$20
08fb : 85 0d __ STA P0 
08fd : 20 ec 0d JSR $0dec ; (rirq_build.s4 + 0)
0900 : e6 0f __ INC P2 
0902 : a9 d0 __ LDA #$d0
0904 : 8d 2c 41 STA $412c ; (rirqtop.code[0] + 11)
0907 : 8d 2f 41 STA $412f ; (rirqtop.code[0] + 14)
090a : a9 28 __ LDA #$28
090c : 8d 22 41 STA $4122 ; (rirqtop.code[0] + 1)
090f : a9 3b __ LDA #$3b
0911 : 8d 24 41 STA $4124 ; (rirqtop.code[0] + 3)
0914 : a9 18 __ LDA #$18
0916 : 8d 2b 41 STA $412b ; (rirqtop.code[0] + 10)
0919 : a9 11 __ LDA #$11
091b : 8d 2e 41 STA $412e ; (rirqtop.code[0] + 13)
091e : a9 40 __ LDA #$40
0920 : 85 0d __ STA P0 
0922 : a9 41 __ LDA #$41
0924 : 85 0e __ STA P1 
0926 : 20 ec 0d JSR $0dec ; (rirq_build.s4 + 0)
0929 : a9 0a __ LDA #$0a
092b : 8d c2 40 STA $40c2 ; (rasterIRQRows[0] + 0)
092e : 8d 42 41 STA $4142 ; (rirqbottom.code[0] + 1)
0931 : a9 d0 __ LDA #$d0
0933 : 8d 4b 41 STA $414b ; (rirqbottom.code[0] + 10)
0936 : 8d 4f 41 STA $414f ; (rirqbottom.code[0] + 14)
0939 : 8d 54 41 STA $4154 ; (rirqbottom.code[0] + 19)
093c : a9 d1 __ LDA #$d1
093e : 8d c3 40 STA $40c3 ; (rasterIRQRows[0] + 1)
0941 : a9 1b __ LDA #$1b
0943 : 8d 44 41 STA $4144 ; (rirqbottom.code[0] + 3)
0946 : a9 88 __ LDA #$88
0948 : 8d 4a 41 STA $414a ; (rirqbottom.code[0] + 9)
094b : a9 fd __ LDA #$fd
094d : 8d 4c 41 STA $414c ; (rirqbottom.code[0] + 11)
0950 : a9 11 __ LDA #$11
0952 : 8d 4e 41 STA $414e ; (rirqbottom.code[0] + 13)
0955 : a9 26 __ LDA #$26
0957 : 8d 51 41 STA $4151 ; (rirqbottom.code[0] + 16)
095a : a9 18 __ LDA #$18
095c : 8d 53 41 STA $4153 ; (rirqbottom.code[0] + 18)
095f : a9 21 __ LDA #$21
0961 : 8d f5 40 STA $40f5 ; (rasterIRQLow[0] + 0)
0964 : a9 41 __ LDA #$41
0966 : 8d 05 41 STA $4105 ; (rasterIRQHigh[0] + 0)
0969 : a9 41 __ LDA #$41
096b : 8d f6 40 STA $40f6 ; (rasterIRQLow[0] + 1)
096e : a9 41 __ LDA #$41
0970 : 8d 06 41 STA $4106 ; (rasterIRQHigh[0] + 1)
0973 : a9 00 __ LDA #$00
0975 : 20 90 0e JSR $0e90 ; (rirq_sort.s4 + 0)
0978 : a9 00 __ LDA #$00
097a : 85 0f __ STA P2 
097c : a9 19 __ LDA #$19
097e : 85 12 __ STA P5 
0980 : a9 e0 __ LDA #$e0
0982 : 85 10 __ STA P3 
0984 : a9 28 __ LDA #$28
0986 : 85 11 __ STA P4 
0988 : 20 19 0f JSR $0f19 ; (rirq_start.s4 + 0)
098b : a9 15 __ LDA #$15
098d : 85 0d __ STA P0 
098f : a9 41 __ LDA #$41
0991 : 85 0e __ STA P1 
0993 : 20 2b 0f JSR $0f2b ; (bm_init.s4 + 0)
0996 : a9 00 __ LDA #$00
0998 : 8d ec 9f STA $9fec ; (sstack + 0)
099b : 8d ed 9f STA $9fed ; (sstack + 1)
099e : 8d ee 9f STA $9fee ; (sstack + 2)
09a1 : 8d ef 9f STA $9fef ; (sstack + 3)
09a4 : a9 20 __ LDA #$20
09a6 : 85 18 __ STA P11 
09a8 : a9 15 __ LDA #$15
09aa : 85 16 __ STA P9 
09ac : 8d f0 9f STA $9ff0 ; (sstack + 4)
09af : a9 41 __ LDA #$41
09b1 : 85 17 __ STA P10 
09b3 : 8d f1 9f STA $9ff1 ; (sstack + 5)
09b6 : a9 00 __ LDA #$00
09b8 : 8d f2 9f STA $9ff2 ; (sstack + 6)
09bb : 8d f3 9f STA $9ff3 ; (sstack + 7)
09be : 8d f4 9f STA $9ff4 ; (sstack + 8)
09c1 : 8d f5 9f STA $9ff5 ; (sstack + 9)
09c4 : 8d f9 9f STA $9ff9 ; (sstack + 13)
09c7 : a9 40 __ LDA #$40
09c9 : 8d f6 9f STA $9ff6 ; (sstack + 10)
09cc : a9 01 __ LDA #$01
09ce : 8d f7 9f STA $9ff7 ; (sstack + 11)
09d1 : a9 a0 __ LDA #$a0
09d3 : 8d f8 9f STA $9ff8 ; (sstack + 12)
09d6 : a9 e4 __ LDA #$e4
09d8 : 8d fa 9f STA $9ffa ; (sstack + 14)
09db : a9 3f __ LDA #$3f
09dd : 8d fb 9f STA $9ffb ; (sstack + 15)
09e0 : 20 5d 0f JSR $0f5d ; (bmu_bitblit.s1 + 0)
09e3 : a9 00 __ LDA #$00
09e5 : 8d ec 9f STA $9fec ; (sstack + 0)
09e8 : 8d ed 9f STA $9fed ; (sstack + 1)
09eb : 8d ef 9f STA $9fef ; (sstack + 3)
09ee : 8d f2 9f STA $9ff2 ; (sstack + 6)
09f1 : 8d f3 9f STA $9ff3 ; (sstack + 7)
09f4 : 8d f5 9f STA $9ff5 ; (sstack + 9)
09f7 : 8d f9 9f STA $9ff9 ; (sstack + 13)
09fa : 8d fa 9f STA $9ffa ; (sstack + 14)
09fd : 8d fb 9f STA $9ffb ; (sstack + 15)
0a00 : a9 44 __ LDA #$44
0a02 : 85 18 __ STA P11 
0a04 : a9 15 __ LDA #$15
0a06 : 8d f0 9f STA $9ff0 ; (sstack + 4)
0a09 : a9 41 __ LDA #$41
0a0b : 8d f1 9f STA $9ff1 ; (sstack + 5)
0a0e : a9 9f __ LDA #$9f
0a10 : 8d ee 9f STA $9fee ; (sstack + 2)
0a13 : 8d f4 9f STA $9ff4 ; (sstack + 8)
0a16 : a9 01 __ LDA #$01
0a18 : 8d f7 9f STA $9ff7 ; (sstack + 11)
0a1b : 8d f8 9f STA $9ff8 ; (sstack + 12)
0a1e : a9 40 __ LDA #$40
0a20 : 8d f6 9f STA $9ff6 ; (sstack + 10)
0a23 : 20 5d 0f JSR $0f5d ; (bmu_bitblit.s1 + 0)
0a26 : a9 00 __ LDA #$00
0a28 : 8d ec 9f STA $9fec ; (sstack + 0)
0a2b : 8d ed 9f STA $9fed ; (sstack + 1)
0a2e : 8d ef 9f STA $9fef ; (sstack + 3)
0a31 : 8d f2 9f STA $9ff2 ; (sstack + 6)
0a34 : 8d f3 9f STA $9ff3 ; (sstack + 7)
0a37 : 8d f5 9f STA $9ff5 ; (sstack + 9)
0a3a : 8d f9 9f STA $9ff9 ; (sstack + 13)
0a3d : 8d fa 9f STA $9ffa ; (sstack + 14)
0a40 : 8d fb 9f STA $9ffb ; (sstack + 15)
0a43 : a9 04 __ LDA #$04
0a45 : 85 18 __ STA P11 
0a47 : a9 15 __ LDA #$15
0a49 : 8d f0 9f STA $9ff0 ; (sstack + 4)
0a4c : a9 41 __ LDA #$41
0a4e : 8d f1 9f STA $9ff1 ; (sstack + 5)
0a51 : a9 9e __ LDA #$9e
0a53 : 8d ee 9f STA $9fee ; (sstack + 2)
0a56 : 8d f4 9f STA $9ff4 ; (sstack + 8)
0a59 : a9 01 __ LDA #$01
0a5b : 8d f7 9f STA $9ff7 ; (sstack + 11)
0a5e : 8d f8 9f STA $9ff8 ; (sstack + 12)
0a61 : a9 40 __ LDA #$40
0a63 : 8d f6 9f STA $9ff6 ; (sstack + 10)
0a66 : 20 5d 0f JSR $0f5d ; (bmu_bitblit.s1 + 0)
0a69 : a9 00 __ LDA #$00
0a6b : 85 0f __ STA P2 
0a6d : 85 11 __ STA P4 
0a6f : a9 c8 __ LDA #$c8
0a71 : 85 10 __ STA P3 
0a73 : a9 41 __ LDA #$41
0a75 : 85 0e __ STA P1 
0a77 : a9 14 __ LDA #$14
0a79 : 85 12 __ STA P5 
0a7b : a9 28 __ LDA #$28
0a7d : 85 13 __ STA P6 
0a7f : a9 04 __ LDA #$04
0a81 : 85 14 __ STA P7 
0a83 : a9 60 __ LDA #$60
0a85 : 85 0d __ STA P0 
0a87 : 20 42 18 JSR $1842 ; (cwin_init.s4 + 0)
0a8a : a9 18 __ LDA #$18
0a8c : 85 12 __ STA P5 
0a8e : a9 41 __ LDA #$41
0a90 : 85 0e __ STA P1 
0a92 : a9 01 __ LDA #$01
0a94 : 85 14 __ STA P7 
0a96 : a9 6c __ LDA #$6c
0a98 : 85 0d __ STA P0 
0a9a : 20 42 18 JSR $1842 ; (cwin_init.s4 + 0)
0a9d : a9 60 __ LDA #$60
0a9f : 85 0d __ STA P0 
0aa1 : a9 41 __ LDA #$41
0aa3 : 85 0e __ STA P1 
0aa5 : a9 20 __ LDA #$20
0aa7 : 85 0f __ STA P2 
0aa9 : a9 01 __ LDA #$01
0aab : 85 10 __ STA P3 
0aad : a2 07 __ LDX #$07
.l7:
0aaf : bd 91 18 LDA $1891,x 
0ab2 : 9d c0 9f STA $9fc0,x ; (rect.left + 0)
0ab5 : ca __ __ DEX
0ab6 : 10 f7 __ BPL $0aaf ; (main.l7 + 0)
.s8:
0ab8 : 20 99 18 JSR $1899 ; (cwin_fill.s4 + 0)
0abb : c6 10 __ DEC P3 
0abd : a9 00 __ LDA #$00
0abf : 85 0f __ STA P2 
0ac1 : a9 07 __ LDA #$07
0ac3 : 85 13 __ STA P6 
0ac5 : a9 19 __ LDA #$19
0ac7 : 85 12 __ STA P5 
0ac9 : a9 3a __ LDA #$3a
0acb : 85 11 __ STA P4 
0acd : 20 ec 18 JSR $18ec ; (cwin_putat_string.s4 + 0)
.l9:
0ad0 : a9 20 __ LDA #$20
0ad2 : 85 0f __ STA P2 
0ad4 : a9 41 __ LDA #$41
0ad6 : 85 0e __ STA P1 
0ad8 : a9 01 __ LDA #$01
0ada : 85 10 __ STA P3 
0adc : a9 6c __ LDA #$6c
0ade : 85 0d __ STA P0 
0ae0 : 20 99 18 JSR $1899 ; (cwin_fill.s4 + 0)
0ae3 : a9 00 __ LDA #$00
0ae5 : 8d 70 41 STA $4170 ; (ewin.cx + 0)
0ae8 : 8d 71 41 STA $4171 ; (ewin.cy + 0)
0aeb : a9 36 __ LDA #$36
0aed : 85 01 __ STA $01 
0aef : a9 6c __ LDA #$6c
0af1 : 8d ec 9f STA $9fec ; (sstack + 0)
0af4 : a9 41 __ LDA #$41
0af6 : 8d ed 9f STA $9fed ; (sstack + 1)
0af9 : 20 5b 19 JSR $195b ; (cwin_edit.s4 + 0)
0afc : a9 30 __ LDA #$30
0afe : 85 01 __ STA $01 
0b00 : a9 6c __ LDA #$6c
0b02 : 85 0d __ STA P0 
0b04 : a9 9f __ LDA #$9f
0b06 : 85 10 __ STA P3 
0b08 : a9 41 __ LDA #$41
0b0a : 85 0e __ STA P1 
0b0c : a9 98 __ LDA #$98
0b0e : 85 0f __ STA P2 
0b10 : 20 4f 1d JSR $1d4f ; (cwin_read_string.s4 + 0)
0b13 : a9 98 __ LDA #$98
0b15 : 8d ec 9f STA $9fec ; (sstack + 0)
0b18 : a9 9f __ LDA #$9f
0b1a : 8d ed 9f STA $9fed ; (sstack + 1)
0b1d : a9 d0 __ LDA #$d0
0b1f : 8d ee 9f STA $9fee ; (sstack + 2)
0b22 : a9 28 __ LDA #$28
0b24 : 8d ef 9f STA $9fef ; (sstack + 3)
0b27 : a9 96 __ LDA #$96
0b29 : 8d f0 9f STA $9ff0 ; (sstack + 4)
0b2c : a9 9f __ LDA #$9f
0b2e : 8d f1 9f STA $9ff1 ; (sstack + 5)
0b31 : a9 94 __ LDA #$94
0b33 : 8d f2 9f STA $9ff2 ; (sstack + 6)
0b36 : a9 9f __ LDA #$9f
0b38 : 8d f3 9f STA $9ff3 ; (sstack + 7)
0b3b : a9 92 __ LDA #$92
0b3d : 8d f4 9f STA $9ff4 ; (sstack + 8)
0b40 : a9 9f __ LDA #$9f
0b42 : 8d f5 9f STA $9ff5 ; (sstack + 9)
0b45 : 20 b7 1d JSR $1db7 ; (sscanf.s4 + 0)
0b48 : a5 1b __ LDA ACCU + 0 
0b4a : 85 53 __ STA T2 + 0 
0b4c : a5 1c __ LDA ACCU + 1 
0b4e : 85 54 __ STA T2 + 1 
0b50 : a9 00 __ LDA #$00
0b52 : 85 0f __ STA P2 
0b54 : a9 41 __ LDA #$41
0b56 : 85 0e __ STA P1 
0b58 : a9 01 __ LDA #$01
0b5a : 85 10 __ STA P3 
0b5c : a9 98 __ LDA #$98
0b5e : 85 11 __ STA P4 
0b60 : a9 9f __ LDA #$9f
0b62 : 85 12 __ STA P5 
0b64 : a9 0e __ LDA #$0e
0b66 : 85 13 __ STA P6 
0b68 : a9 60 __ LDA #$60
0b6a : 85 0d __ STA P0 
0b6c : 20 ec 18 JSR $18ec ; (cwin_putat_string.s4 + 0)
0b6f : a9 98 __ LDA #$98
0b71 : 8d f4 9f STA $9ff4 ; (sstack + 8)
0b74 : a9 9f __ LDA #$9f
0b76 : 8d f5 9f STA $9ff5 ; (sstack + 9)
0b79 : a5 53 __ LDA T2 + 0 
0b7b : 8d f8 9f STA $9ff8 ; (sstack + 12)
0b7e : a5 54 __ LDA T2 + 1 
0b80 : 8d f9 9f STA $9ff9 ; (sstack + 13)
0b83 : a9 00 __ LDA #$00
0b85 : 8d f6 9f STA $9ff6 ; (sstack + 10)
0b88 : a9 36 __ LDA #$36
0b8a : 8d f7 9f STA $9ff7 ; (sstack + 11)
0b8d : ad 96 9f LDA $9f96 ; (x + 0)
0b90 : 8d fa 9f STA $9ffa ; (sstack + 14)
0b93 : ad 97 9f LDA $9f97 ; (x + 1)
0b96 : 8d fb 9f STA $9ffb ; (sstack + 15)
0b99 : ad 94 9f LDA $9f94 ; (y + 0)
0b9c : 8d fc 9f STA $9ffc ; (sstack + 16)
0b9f : ad 95 9f LDA $9f95 ; (y + 1)
0ba2 : 8d fd 9f STA $9ffd ; (sstack + 17)
0ba5 : ad 92 9f LDA $9f92 ; (r + 0)
0ba8 : 8d fe 9f STA $9ffe ; (sstack + 18)
0bab : ad 93 9f LDA $9f93 ; (r + 1)
0bae : 8d ff 9f STA $9fff ; (sstack + 19)
0bb1 : 20 32 29 JSR $2932 ; (sprintf.s1 + 0)
0bb4 : a9 60 __ LDA #$60
0bb6 : 85 0d __ STA P0 
0bb8 : a9 07 __ LDA #$07
0bba : 85 13 __ STA P6 
0bbc : a9 41 __ LDA #$41
0bbe : 85 0e __ STA P1 
0bc0 : a9 00 __ LDA #$00
0bc2 : 85 0f __ STA P2 
0bc4 : a9 02 __ LDA #$02
0bc6 : 85 10 __ STA P3 
0bc8 : a9 98 __ LDA #$98
0bca : 85 11 __ STA P4 
0bcc : a9 9f __ LDA #$9f
0bce : 85 12 __ STA P5 
0bd0 : 20 ec 18 JSR $18ec ; (cwin_putat_string.s4 + 0)
0bd3 : a5 54 __ LDA T2 + 1 
0bd5 : f0 03 __ BEQ $0bda ; (main.s11 + 0)
0bd7 : 4c d0 0a JMP $0ad0 ; (main.l9 + 0)
.s11:
0bda : a5 53 __ LDA T2 + 0 
0bdc : c9 03 __ CMP #$03
0bde : d0 f7 __ BNE $0bd7 ; (main.l9 + 263)
.s10:
0be0 : a9 15 __ LDA #$15
0be2 : 8d ec 9f STA $9fec ; (sstack + 0)
0be5 : a9 41 __ LDA #$41
0be7 : 8d ed 9f STA $9fed ; (sstack + 1)
0bea : a9 c0 __ LDA #$c0
0bec : 8d ee 9f STA $9fee ; (sstack + 2)
0bef : a9 9f __ LDA #$9f
0bf1 : 8d ef 9f STA $9fef ; (sstack + 3)
0bf4 : ad 96 9f LDA $9f96 ; (x + 0)
0bf7 : 8d f0 9f STA $9ff0 ; (sstack + 4)
0bfa : ad 97 9f LDA $9f97 ; (x + 1)
0bfd : 8d f1 9f STA $9ff1 ; (sstack + 5)
0c00 : ad 94 9f LDA $9f94 ; (y + 0)
0c03 : 8d f2 9f STA $9ff2 ; (sstack + 6)
0c06 : ad 95 9f LDA $9f95 ; (y + 1)
0c09 : 8d f3 9f STA $9ff3 ; (sstack + 7)
0c0c : ae 92 9f LDX $9f92 ; (r + 0)
0c0f : e8 __ __ INX
0c10 : 86 18 __ STX P11 
0c12 : a9 7a __ LDA #$7a
0c14 : 8d f4 9f STA $9ff4 ; (sstack + 8)
0c17 : a9 40 __ LDA #$40
0c19 : 8d f5 9f STA $9ff5 ; (sstack + 9)
0c1c : 20 1b 36 JSR $361b ; (bm_circle_fill.s1 + 0)
0c1f : a9 15 __ LDA #$15
0c21 : 8d ec 9f STA $9fec ; (sstack + 0)
0c24 : a9 41 __ LDA #$41
0c26 : 8d ed 9f STA $9fed ; (sstack + 1)
0c29 : a9 c0 __ LDA #$c0
0c2b : 8d ee 9f STA $9fee ; (sstack + 2)
0c2e : a9 9f __ LDA #$9f
0c30 : 8d ef 9f STA $9fef ; (sstack + 3)
0c33 : ad 96 9f LDA $9f96 ; (x + 0)
0c36 : 8d f0 9f STA $9ff0 ; (sstack + 4)
0c39 : ad 97 9f LDA $9f97 ; (x + 1)
0c3c : 8d f1 9f STA $9ff1 ; (sstack + 5)
0c3f : ad 94 9f LDA $9f94 ; (y + 0)
0c42 : 8d f2 9f STA $9ff2 ; (sstack + 6)
0c45 : ad 95 9f LDA $9f95 ; (y + 1)
0c48 : 8d f3 9f STA $9ff3 ; (sstack + 7)
0c4b : ae 92 9f LDX $9f92 ; (r + 0)
0c4e : ca __ __ DEX
0c4f : 86 18 __ STX P11 
0c51 : a9 82 __ LDA #$82
0c53 : 8d f4 9f STA $9ff4 ; (sstack + 8)
0c56 : a9 40 __ LDA #$40
0c58 : 8d f5 9f STA $9ff5 ; (sstack + 9)
0c5b : 20 1b 36 JSR $361b ; (bm_circle_fill.s1 + 0)
0c5e : 4c d0 0a JMP $0ad0 ; (main.l9 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0c61 : a9 76 __ LDA #$76
0c63 : 8d fa ff STA $fffa 
0c66 : a9 0c __ LDA #$0c
0c68 : 8d fb ff STA $fffb 
0c6b : a9 94 __ LDA #$94
0c6d : 8d fe ff STA $fffe 
0c70 : a9 0c __ LDA #$0c
0c72 : 8d ff ff STA $ffff 
.s3:
0c75 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0c76 : 48 __ __ PHA
0c77 : 8a __ __ TXA
0c78 : 48 __ __ PHA
0c79 : a9 0c __ LDA #$0c
0c7b : 48 __ __ PHA
0c7c : a9 8d __ LDA #$8d
0c7e : 48 __ __ PHA
0c7f : ba __ __ TSX
0c80 : bd 05 01 LDA $0105,x 
0c83 : 48 __ __ PHA
0c84 : a6 01 __ LDX $01 
0c86 : a9 36 __ LDA #$36
0c88 : 85 01 __ STA $01 
0c8a : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0c8d : 86 01 __ STX $01 
0c8f : 68 __ __ PLA
0c90 : aa __ __ TAX
0c91 : 68 __ __ PLA
0c92 : 40 __ __ RTI
0c93 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0c94 : 48 __ __ PHA
0c95 : 8a __ __ TXA
0c96 : 48 __ __ PHA
0c97 : a9 0c __ LDA #$0c
0c99 : 48 __ __ PHA
0c9a : a9 8d __ LDA #$8d
0c9c : 48 __ __ PHA
0c9d : ba __ __ TSX
0c9e : bd 05 01 LDA $0105,x 
0ca1 : 48 __ __ PHA
0ca2 : a6 01 __ LDX $01 
0ca4 : a9 36 __ LDA #$36
0ca6 : 85 01 __ STA $01 
0ca8 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void*
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0cab : a6 12 __ LDX P5 
0cad : f0 10 __ BEQ $0cbf ; (memcpy.s4 + 20)
0caf : a0 00 __ LDY #$00
0cb1 : b1 0f __ LDA (P2),y 
0cb3 : 91 0d __ STA (P0),y ; (dst + 0)
0cb5 : c8 __ __ INY
0cb6 : d0 f9 __ BNE $0cb1 ; (memcpy.s4 + 6)
0cb8 : e6 10 __ INC P3 
0cba : e6 0e __ INC P1 ; (dst + 1)
0cbc : ca __ __ DEX
0cbd : d0 f2 __ BNE $0cb1 ; (memcpy.s4 + 6)
0cbf : a4 11 __ LDY P4 
0cc1 : f0 0e __ BEQ $0cd1 ; (memcpy.s4 + 38)
0cc3 : 88 __ __ DEY
0cc4 : f0 07 __ BEQ $0ccd ; (memcpy.s4 + 34)
0cc6 : b1 0f __ LDA (P2),y 
0cc8 : 91 0d __ STA (P0),y ; (dst + 0)
0cca : 88 __ __ DEY
0ccb : d0 f9 __ BNE $0cc6 ; (memcpy.s4 + 27)
0ccd : b1 0f __ LDA (P2),y 
0ccf : 91 0d __ STA (P0),y ; (dst + 0)
0cd1 : a5 0d __ LDA P0 ; (dst + 0)
0cd3 : 85 1b __ STA ACCU + 0 
0cd5 : a5 0e __ LDA P1 ; (dst + 1)
0cd7 : 85 1c __ STA ACCU + 1 
.s3:
0cd9 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0cda : 20 fb 0c JSR $0cfb ; (rirq_init_tables.s4 + 0)
0cdd : 78 __ __ SEI
0cde : a9 01 __ LDA #$01
0ce0 : 8d 1a d0 STA $d01a 
0ce3 : a9 19 __ LDA #$19
0ce5 : 8d 14 03 STA $0314 
0ce8 : a9 0d __ LDA #$0d
0cea : 8d 15 03 STA $0315 
0ced : ad 11 d0 LDA $d011 
0cf0 : 29 7f __ AND #$7f
0cf2 : 8d 11 d0 STA $d011 
0cf5 : a9 ff __ LDA #$ff
0cf7 : 8d 12 d0 STA $d012 
.s3:
0cfa : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0cfb : a2 00 __ LDX #$00
.l5:
0cfd : a9 ff __ LDA #$ff
0cff : 9d c2 40 STA $40c2,x ; (rasterIRQRows[0] + 0)
0d02 : 8a __ __ TXA
0d03 : 9d d4 40 STA $40d4,x ; (rasterIRQIndex[0] + 1)
0d06 : e8 __ __ INX
0d07 : e0 10 __ CPX #$10
0d09 : d0 f2 __ BNE $0cfd ; (rirq_init_tables.l5 + 0)
.s6:
0d0b : 8e d3 40 STX $40d3 ; (rasterIRQIndex[0] + 0)
0d0e : a9 ff __ LDA #$ff
0d10 : 8d f4 40 STA $40f4 ; (rasterIRQNext[0] + 16)
0d13 : a9 00 __ LDA #$00
0d15 : 8d d2 40 STA $40d2 ; (rasterIRQRows[0] + 16)
.s3:
0d18 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0d19 : ad 19 d0 LDA $d019 
0d1c : 10 51 __ BPL $0d6f ; (rirq_isr_kernal_io + 86)
0d1e : ae fd 35 LDX $35fd ; (nextIRQ + 0)
0d21 : 30 33 __ BMI $0d56 ; (rirq_isr_kernal_io + 61)
0d23 : bd e4 40 LDA $40e4,x ; (rasterIRQNext[0] + 0)
0d26 : bc d4 40 LDY $40d4,x ; (rasterIRQIndex[0] + 1)
0d29 : be f5 40 LDX $40f5,y ; (rasterIRQLow[0] + 0)
0d2c : 8e 36 0d STX $0d36 ; (rirq_isr_kernal_io + 29)
0d2f : be 05 41 LDX $4105,y ; (rasterIRQHigh[0] + 0)
0d32 : 8e 37 0d STX $0d37 ; (rirq_isr_kernal_io + 30)
0d35 : 20 00 00 JSR $0000 
0d38 : ee fd 35 INC $35fd ; (nextIRQ + 0)
0d3b : ae fd 35 LDX $35fd ; (nextIRQ + 0)
0d3e : bc e4 40 LDY $40e4,x ; (rasterIRQNext[0] + 0)
0d41 : 0e 19 d0 ASL $d019 
0d44 : c0 ff __ CPY #$ff
0d46 : f0 14 __ BEQ $0d5c ; (rirq_isr_kernal_io + 67)
0d48 : 88 __ __ DEY
0d49 : 88 __ __ DEY
0d4a : 8c 12 d0 STY $d012 
0d4d : 88 __ __ DEY
0d4e : cc 12 d0 CPY $d012 
0d51 : 90 d0 __ BCC $0d23 ; (rirq_isr_kernal_io + 10)
0d53 : 4c 81 ea JMP $ea81 
0d56 : 0e 19 d0 ASL $d019 
0d59 : 4c 81 ea JMP $ea81 
0d5c : ee fe 35 INC $35fe ; (rirq_count + 0)
0d5f : ac e4 40 LDY $40e4 ; (rasterIRQNext[0] + 0)
0d62 : 88 __ __ DEY
0d63 : 88 __ __ DEY
0d64 : 8c 12 d0 STY $d012 
0d67 : a2 00 __ LDX #$00
0d69 : 8e fd 35 STX $35fd ; (nextIRQ + 0)
0d6c : 4c 81 ea JMP $ea81 
0d6f : ad 0d dc LDA $dc0d 
0d72 : 58 __ __ CLI
0d73 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0d76 : a5 0f __ LDA P2 
0d78 : a6 12 __ LDX P5 
0d7a : f0 0c __ BEQ $0d88 ; (memset.s4 + 18)
0d7c : a0 00 __ LDY #$00
0d7e : 91 0d __ STA (P0),y ; (dst + 0)
0d80 : c8 __ __ INY
0d81 : d0 fb __ BNE $0d7e ; (memset.s4 + 8)
0d83 : e6 0e __ INC P1 ; (dst + 1)
0d85 : ca __ __ DEX
0d86 : d0 f6 __ BNE $0d7e ; (memset.s4 + 8)
0d88 : a4 11 __ LDY P4 
0d8a : f0 05 __ BEQ $0d91 ; (memset.s4 + 27)
0d8c : 88 __ __ DEY
0d8d : 91 0d __ STA (P0),y ; (dst + 0)
0d8f : d0 fb __ BNE $0d8c ; (memset.s4 + 22)
0d91 : a5 0d __ LDA P0 ; (dst + 0)
0d93 : 85 1b __ STA ACCU + 0 
0d95 : a5 0e __ LDA P1 ; (dst + 1)
0d97 : 85 1c __ STA ACCU + 1 
.s3:
0d99 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0d9a : a4 0d __ LDY P0 ; (mode + 0)
0d9c : c0 02 __ CPY #$02
0d9e : d0 09 __ BNE $0da9 ; (vic_setmode.s5 + 0)
.s10:
0da0 : a9 5b __ LDA #$5b
0da2 : 8d 11 d0 STA $d011 
.s8:
0da5 : a9 08 __ LDA #$08
0da7 : d0 0c __ BNE $0db5 ; (vic_setmode.s7 + 0)
.s5:
0da9 : b0 36 __ BCS $0de1 ; (vic_setmode.s6 + 0)
.s9:
0dab : a9 1b __ LDA #$1b
0dad : 8d 11 d0 STA $d011 
0db0 : 98 __ __ TYA
0db1 : f0 f2 __ BEQ $0da5 ; (vic_setmode.s8 + 0)
.s11:
0db3 : a9 18 __ LDA #$18
.s7:
0db5 : 8d 16 d0 STA $d016 
0db8 : ad 00 dd LDA $dd00 
0dbb : 29 fc __ AND #$fc
0dbd : 85 1b __ STA ACCU + 0 
0dbf : a5 0f __ LDA P2 ; (text + 1)
0dc1 : 0a __ __ ASL
0dc2 : 2a __ __ ROL
0dc3 : 29 01 __ AND #$01
0dc5 : 2a __ __ ROL
0dc6 : 49 03 __ EOR #$03
0dc8 : 05 1b __ ORA ACCU + 0 
0dca : 8d 00 dd STA $dd00 
0dcd : a5 0f __ LDA P2 ; (text + 1)
0dcf : 29 3c __ AND #$3c
0dd1 : 0a __ __ ASL
0dd2 : 0a __ __ ASL
0dd3 : 85 1b __ STA ACCU + 0 
0dd5 : a5 11 __ LDA P4 ; (font + 1)
0dd7 : 29 38 __ AND #$38
0dd9 : 4a __ __ LSR
0dda : 4a __ __ LSR
0ddb : 05 1b __ ORA ACCU + 0 
0ddd : 8d 18 d0 STA $d018 
.s3:
0de0 : 60 __ __ RTS
.s6:
0de1 : a9 3b __ LDA #$3b
0de3 : 8d 11 d0 STA $d011 
0de6 : c0 03 __ CPY #$03
0de8 : d0 c9 __ BNE $0db3 ; (vic_setmode.s11 + 0)
0dea : f0 b9 __ BEQ $0da5 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0dec : a5 0d __ LDA P0 ; (ic + 0)
0dee : 85 1b __ STA ACCU + 0 
0df0 : a5 0e __ LDA P1 ; (ic + 1)
0df2 : 85 1c __ STA ACCU + 1 
0df4 : a9 a0 __ LDA #$a0
0df6 : a0 01 __ LDY #$01
0df8 : 91 0d __ STA (P0),y ; (ic + 0)
0dfa : a9 00 __ LDA #$00
0dfc : c8 __ __ INY
0dfd : 91 0d __ STA (P0),y ; (ic + 0)
0dff : a9 a2 __ LDA #$a2
0e01 : c8 __ __ INY
0e02 : 91 0d __ STA (P0),y ; (ic + 0)
0e04 : a9 00 __ LDA #$00
0e06 : c8 __ __ INY
0e07 : 91 0d __ STA (P0),y ; (ic + 0)
0e09 : a9 cd __ LDA #$cd
0e0b : c8 __ __ INY
0e0c : 91 0d __ STA (P0),y ; (ic + 0)
0e0e : a9 12 __ LDA #$12
0e10 : c8 __ __ INY
0e11 : 91 0d __ STA (P0),y ; (ic + 0)
0e13 : a9 d0 __ LDA #$d0
0e15 : c8 __ __ INY
0e16 : 91 0d __ STA (P0),y ; (ic + 0)
0e18 : a9 b0 __ LDA #$b0
0e1a : c8 __ __ INY
0e1b : 91 0d __ STA (P0),y ; (ic + 0)
0e1d : a9 fb __ LDA #$fb
0e1f : c8 __ __ INY
0e20 : 91 0d __ STA (P0),y ; (ic + 0)
0e22 : a9 8c __ LDA #$8c
0e24 : c8 __ __ INY
0e25 : 91 0d __ STA (P0),y ; (ic + 0)
0e27 : a9 00 __ LDA #$00
0e29 : c8 __ __ INY
0e2a : 91 0d __ STA (P0),y ; (ic + 0)
0e2c : c8 __ __ INY
0e2d : 91 0d __ STA (P0),y ; (ic + 0)
0e2f : a8 __ __ TAY
0e30 : a5 0f __ LDA P2 ; (size + 0)
0e32 : 91 0d __ STA (P0),y ; (ic + 0)
0e34 : f0 53 __ BEQ $0e89 ; (rirq_build.s5 + 0)
.s6:
0e36 : a0 0d __ LDY #$0d
0e38 : c9 01 __ CMP #$01
0e3a : d0 05 __ BNE $0e41 ; (rirq_build.s7 + 0)
.s10:
0e3c : a9 60 __ LDA #$60
0e3e : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0e40 : 60 __ __ RTS
.s7:
0e41 : a9 8e __ LDA #$8e
0e43 : 91 0d __ STA (P0),y ; (ic + 0)
0e45 : a9 00 __ LDA #$00
0e47 : c8 __ __ INY
0e48 : 91 0d __ STA (P0),y ; (ic + 0)
0e4a : c8 __ __ INY
0e4b : 91 0d __ STA (P0),y ; (ic + 0)
0e4d : a5 0f __ LDA P2 ; (size + 0)
0e4f : c9 03 __ CMP #$03
0e51 : 90 2a __ BCC $0e7d ; (rirq_build.s8 + 0)
.s9:
0e53 : e9 02 __ SBC #$02
0e55 : aa __ __ TAX
0e56 : 18 __ __ CLC
0e57 : a5 0d __ LDA P0 ; (ic + 0)
0e59 : 69 01 __ ADC #$01
0e5b : 85 1b __ STA ACCU + 0 
0e5d : a5 0e __ LDA P1 ; (ic + 1)
0e5f : 69 00 __ ADC #$00
0e61 : 85 1c __ STA ACCU + 1 
.l11:
0e63 : a9 a9 __ LDA #$a9
0e65 : 91 1b __ STA (ACCU + 0),y 
0e67 : a9 00 __ LDA #$00
0e69 : c8 __ __ INY
0e6a : 91 1b __ STA (ACCU + 0),y 
0e6c : a9 8d __ LDA #$8d
0e6e : c8 __ __ INY
0e6f : 91 1b __ STA (ACCU + 0),y 
0e71 : a9 00 __ LDA #$00
0e73 : c8 __ __ INY
0e74 : 91 1b __ STA (ACCU + 0),y 
0e76 : c8 __ __ INY
0e77 : 91 1b __ STA (ACCU + 0),y 
0e79 : c8 __ __ INY
0e7a : ca __ __ DEX
0e7b : d0 e6 __ BNE $0e63 ; (rirq_build.l11 + 0)
.s8:
0e7d : 98 __ __ TYA
0e7e : 18 __ __ CLC
0e7f : 65 0d __ ADC P0 ; (ic + 0)
0e81 : 85 1b __ STA ACCU + 0 
0e83 : a5 0e __ LDA P1 ; (ic + 1)
0e85 : 69 00 __ ADC #$00
0e87 : 85 1c __ STA ACCU + 1 
.s5:
0e89 : a9 60 __ LDA #$60
0e8b : a0 01 __ LDY #$01
0e8d : 91 1b __ STA (ACCU + 0),y 
0e8f : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0e90 : 85 0d __ STA P0 ; (inirq + 0)
0e92 : a9 ff __ LDA #$ff
0e94 : 8d fd 35 STA $35fd ; (nextIRQ + 0)
0e97 : ae d4 40 LDX $40d4 ; (rasterIRQIndex[0] + 1)
0e9a : bd c2 40 LDA $40c2,x ; (rasterIRQRows[0] + 0)
0e9d : 85 1c __ STA ACCU + 1 
0e9f : a2 02 __ LDX #$02
.l5:
0ea1 : bc d3 40 LDY $40d3,x ; (rasterIRQIndex[0] + 0)
0ea4 : b9 c2 40 LDA $40c2,y ; (rasterIRQRows[0] + 0)
0ea7 : c5 1c __ CMP ACCU + 1 
0ea9 : 90 04 __ BCC $0eaf ; (rirq_sort.s12 + 0)
.s6:
0eab : 85 1c __ STA ACCU + 1 
0ead : b0 24 __ BCS $0ed3 ; (rirq_sort.s7 + 0)
.s12:
0eaf : 86 1d __ STX ACCU + 2 
0eb1 : 84 1e __ STY ACCU + 3 
0eb3 : 85 1b __ STA ACCU + 0 
0eb5 : bd d2 40 LDA $40d2,x ; (rasterIRQRows[0] + 16)
0eb8 : 9d d3 40 STA $40d3,x ; (rasterIRQIndex[0] + 0)
0ebb : 90 05 __ BCC $0ec2 ; (rirq_sort.l13 + 0)
.s15:
0ebd : 98 __ __ TYA
0ebe : 9d d2 40 STA $40d2,x ; (rasterIRQRows[0] + 16)
0ec1 : ca __ __ DEX
.l13:
0ec2 : a5 1b __ LDA ACCU + 0 
0ec4 : bc d1 40 LDY $40d1,x ; (rasterIRQRows[0] + 15)
0ec7 : d9 c2 40 CMP $40c2,y ; (rasterIRQRows[0] + 0)
0eca : 90 f1 __ BCC $0ebd ; (rirq_sort.s15 + 0)
.s14:
0ecc : a5 1e __ LDA ACCU + 3 
0ece : 9d d2 40 STA $40d2,x ; (rasterIRQRows[0] + 16)
0ed1 : a6 1d __ LDX ACCU + 2 
.s7:
0ed3 : e8 __ __ INX
0ed4 : e0 11 __ CPX #$11
0ed6 : 90 c9 __ BCC $0ea1 ; (rirq_sort.l5 + 0)
.s8:
0ed8 : a2 03 __ LDX #$03
.l17:
0eda : bc d4 40 LDY $40d4,x ; (rasterIRQIndex[0] + 1)
0edd : b9 c2 40 LDA $40c2,y ; (rasterIRQRows[0] + 0)
0ee0 : 9d e4 40 STA $40e4,x ; (rasterIRQNext[0] + 0)
0ee3 : bc d8 40 LDY $40d8,x ; (rasterIRQIndex[0] + 5)
0ee6 : b9 c2 40 LDA $40c2,y ; (rasterIRQRows[0] + 0)
0ee9 : 9d e8 40 STA $40e8,x ; (rasterIRQNext[0] + 4)
0eec : bc dc 40 LDY $40dc,x ; (rasterIRQIndex[0] + 9)
0eef : b9 c2 40 LDA $40c2,y ; (rasterIRQRows[0] + 0)
0ef2 : 9d ec 40 STA $40ec,x ; (rasterIRQNext[0] + 8)
0ef5 : bc e0 40 LDY $40e0,x ; (rasterIRQIndex[0] + 13)
0ef8 : b9 c2 40 LDA $40c2,y ; (rasterIRQRows[0] + 0)
0efb : 9d f0 40 STA $40f0,x ; (rasterIRQNext[0] + 12)
0efe : ca __ __ DEX
0eff : 10 d9 __ BPL $0eda ; (rirq_sort.l17 + 0)
.s18:
0f01 : a5 0d __ LDA P0 ; (inirq + 0)
0f03 : f0 06 __ BEQ $0f0b ; (rirq_sort.s9 + 0)
.s11:
0f05 : a9 0f __ LDA #$0f
.s16:
0f07 : 8d fd 35 STA $35fd ; (nextIRQ + 0)
.s3:
0f0a : 60 __ __ RTS
.s9:
0f0b : ac e4 40 LDY $40e4 ; (rasterIRQNext[0] + 0)
0f0e : c0 ff __ CPY #$ff
0f10 : f0 f8 __ BEQ $0f0a ; (rirq_sort.s3 + 0)
.s10:
0f12 : 88 __ __ DEY
0f13 : 8c 12 d0 STY $d012 
0f16 : 4c 07 0f JMP $0f07 ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0f19 : ad 11 d0 LDA $d011 
0f1c : 29 7f __ AND #$7f
0f1e : 8d 11 d0 STA $d011 
0f21 : a9 64 __ LDA #$64
0f23 : 8d 12 d0 STA $d012 
0f26 : 0e 19 d0 ASL $d019 
0f29 : 58 __ __ CLI
.s3:
0f2a : 60 __ __ RTS
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0f2b : a5 0f __ LDA P2 ; (data + 0)
0f2d : a0 00 __ LDY #$00
0f2f : 91 0d __ STA (P0),y ; (bm + 0)
0f31 : a5 10 __ LDA P3 ; (data + 1)
0f33 : c8 __ __ INY
0f34 : 91 0d __ STA (P0),y ; (bm + 0)
0f36 : a9 00 __ LDA #$00
0f38 : c8 __ __ INY
0f39 : 91 0d __ STA (P0),y ; (bm + 0)
0f3b : c8 __ __ INY
0f3c : 91 0d __ STA (P0),y ; (bm + 0)
0f3e : a5 11 __ LDA P4 ; (cw + 0)
0f40 : c8 __ __ INY
0f41 : 91 0d __ STA (P0),y ; (bm + 0)
0f43 : a5 12 __ LDA P5 ; (ch + 0)
0f45 : c8 __ __ INY
0f46 : 91 0d __ STA (P0),y ; (bm + 0)
0f48 : a9 00 __ LDA #$00
0f4a : 06 11 __ ASL P4 ; (cw + 0)
0f4c : 2a __ __ ROL
0f4d : 06 11 __ ASL P4 ; (cw + 0)
0f4f : 2a __ __ ROL
0f50 : 06 11 __ ASL P4 ; (cw + 0)
0f52 : 2a __ __ ROL
0f53 : a0 07 __ LDY #$07
0f55 : 91 0d __ STA (P0),y ; (bm + 0)
0f57 : a5 11 __ LDA P4 ; (cw + 0)
0f59 : 88 __ __ DEY
0f5a : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0f5c : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
0f5d : a5 53 __ LDA T6 + 0 
0f5f : 8d e6 9f STA $9fe6 ; (bmu_bitblit@stack + 0)
0f62 : a5 54 __ LDA T6 + 1 
0f64 : 8d e7 9f STA $9fe7 ; (bmu_bitblit@stack + 1)
0f67 : a5 55 __ LDA T8 + 0 
0f69 : 8d e8 9f STA $9fe8 ; (bmu_bitblit@stack + 2)
.s4:
0f6c : ad ec 9f LDA $9fec ; (sstack + 0)
0f6f : 85 4e __ STA T2 + 0 
0f71 : 18 __ __ CLC
0f72 : 6d f6 9f ADC $9ff6 ; (sstack + 10)
0f75 : 85 45 __ STA T1 + 0 
0f77 : 29 07 __ AND #$07
0f79 : aa __ __ TAX
0f7a : bd f4 3f LDA $3ff4,x ; (rmask[0] + 0)
0f7d : 85 13 __ STA P6 
0f7f : ad f7 9f LDA $9ff7 ; (sstack + 11)
0f82 : 6d ed 9f ADC $9fed ; (sstack + 1)
0f85 : 4a __ __ LSR
0f86 : 66 45 __ ROR T1 + 0 
0f88 : 4a __ __ LSR
0f89 : 66 45 __ ROR T1 + 0 
0f8b : 4a __ __ LSR
0f8c : 66 45 __ ROR T1 + 0 
0f8e : ad ed 9f LDA $9fed ; (sstack + 1)
0f91 : 4a __ __ LSR
0f92 : 66 4e __ ROR T2 + 0 
0f94 : 4a __ __ LSR
0f95 : 66 4e __ ROR T2 + 0 
0f97 : 4a __ __ LSR
0f98 : 66 4e __ ROR T2 + 0 
0f9a : 38 __ __ SEC
0f9b : a5 45 __ LDA T1 + 0 
0f9d : e5 4e __ SBC T2 + 0 
0f9f : 85 11 __ STA P4 
0fa1 : ad ec 9f LDA $9fec ; (sstack + 0)
0fa4 : 29 07 __ AND #$07
0fa6 : 85 4e __ STA T2 + 0 
0fa8 : aa __ __ TAX
0fa9 : bd ec 3f LDA $3fec,x ; (lmask[0] + 0)
0fac : 85 4c __ STA T10 + 0 
0fae : 85 12 __ STA P5 
0fb0 : ad f0 9f LDA $9ff0 ; (sstack + 4)
0fb3 : 85 49 __ STA T4 + 0 
0fb5 : ad f1 9f LDA $9ff1 ; (sstack + 5)
0fb8 : 85 4a __ STA T4 + 1 
0fba : a5 16 __ LDA P9 ; (dbm + 0)
0fbc : c5 49 __ CMP T4 + 0 
0fbe : d0 78 __ BNE $1038 ; (bmu_bitblit.s5 + 0)
.s52:
0fc0 : a5 17 __ LDA P10 ; (dbm + 1)
0fc2 : c5 4a __ CMP T4 + 1 
0fc4 : d0 72 __ BNE $1038 ; (bmu_bitblit.s5 + 0)
.s38:
0fc6 : ad f5 9f LDA $9ff5 ; (sstack + 9)
0fc9 : cd ef 9f CMP $9fef ; (sstack + 3)
0fcc : d0 0a __ BNE $0fd8 ; (bmu_bitblit.s51 + 0)
.s48:
0fce : ad f4 9f LDA $9ff4 ; (sstack + 8)
0fd1 : cd ee 9f CMP $9fee ; (sstack + 2)
.s49:
0fd4 : b0 09 __ BCS $0fdf ; (bmu_bitblit.s39 + 0)
0fd6 : 90 30 __ BCC $1008 ; (bmu_bitblit.s41 + 0)
.s51:
0fd8 : 4d ef 9f EOR $9fef ; (sstack + 3)
0fdb : 10 f7 __ BPL $0fd4 ; (bmu_bitblit.s49 + 0)
.s50:
0fdd : b0 29 __ BCS $1008 ; (bmu_bitblit.s41 + 0)
.s39:
0fdf : ad ef 9f LDA $9fef ; (sstack + 3)
0fe2 : cd f5 9f CMP $9ff5 ; (sstack + 9)
0fe5 : d0 51 __ BNE $1038 ; (bmu_bitblit.s5 + 0)
.s47:
0fe7 : ad ee 9f LDA $9fee ; (sstack + 2)
0fea : cd f4 9f CMP $9ff4 ; (sstack + 8)
0fed : d0 49 __ BNE $1038 ; (bmu_bitblit.s5 + 0)
.s40:
0fef : ad f3 9f LDA $9ff3 ; (sstack + 7)
0ff2 : cd ed 9f CMP $9fed ; (sstack + 1)
0ff5 : d0 0a __ BNE $1001 ; (bmu_bitblit.s46 + 0)
.s43:
0ff7 : ad f2 9f LDA $9ff2 ; (sstack + 6)
0ffa : cd ec 9f CMP $9fec ; (sstack + 0)
.s44:
0ffd : 90 09 __ BCC $1008 ; (bmu_bitblit.s41 + 0)
0fff : b0 37 __ BCS $1038 ; (bmu_bitblit.s5 + 0)
.s46:
1001 : 4d ed 9f EOR $9fed ; (sstack + 1)
1004 : 10 f7 __ BPL $0ffd ; (bmu_bitblit.s44 + 0)
.s45:
1006 : 90 30 __ BCC $1038 ; (bmu_bitblit.s5 + 0)
.s41:
1008 : a5 18 __ LDA P11 ; (op + 0)
100a : 29 08 __ AND #$08
100c : f0 2a __ BEQ $1038 ; (bmu_bitblit.s5 + 0)
.s42:
100e : ad f8 9f LDA $9ff8 ; (sstack + 12)
1011 : 18 __ __ CLC
1012 : 6d f4 9f ADC $9ff4 ; (sstack + 8)
1015 : 8d f4 9f STA $9ff4 ; (sstack + 8)
1018 : ad f9 9f LDA $9ff9 ; (sstack + 13)
101b : 6d f5 9f ADC $9ff5 ; (sstack + 9)
101e : 8d f5 9f STA $9ff5 ; (sstack + 9)
1021 : ad f8 9f LDA $9ff8 ; (sstack + 12)
1024 : 18 __ __ CLC
1025 : 6d ee 9f ADC $9fee ; (sstack + 2)
1028 : 8d ee 9f STA $9fee ; (sstack + 2)
102b : ad f9 9f LDA $9ff9 ; (sstack + 13)
102e : 6d ef 9f ADC $9fef ; (sstack + 3)
1031 : 8d ef 9f STA $9fef ; (sstack + 3)
1034 : a9 01 __ LDA #$01
1036 : d0 02 __ BNE $103a ; (bmu_bitblit.s6 + 0)
.s5:
1038 : a9 00 __ LDA #$00
.s6:
103a : 85 15 __ STA P8 
103c : ad ef 9f LDA $9fef ; (sstack + 3)
103f : 85 1c __ STA ACCU + 1 ; (dy + 1)
1041 : ad ee 9f LDA $9fee ; (sstack + 2)
1044 : 29 f8 __ AND #$f8
1046 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1048 : a0 04 __ LDY #$04
104a : b1 16 __ LDA (P9),y ; (dbm + 0)
104c : 85 52 __ STA T7 + 0 
104e : 20 44 3a JSR $3a44 ; (mul16by8 + 0)
1051 : a0 00 __ LDY #$00
1053 : b1 16 __ LDA (P9),y ; (dbm + 0)
1055 : 18 __ __ CLC
1056 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1058 : 85 02 __ STA $02 
105a : c8 __ __ INY
105b : b1 16 __ LDA (P9),y ; (dbm + 0)
105d : 65 1c __ ADC ACCU + 1 ; (dy + 1)
105f : aa __ __ TAX
1060 : ad ec 9f LDA $9fec ; (sstack + 0)
1063 : 29 f8 __ AND #$f8
1065 : 18 __ __ CLC
1066 : 65 02 __ ADC $02 
1068 : 85 47 __ STA T3 + 0 
106a : 8a __ __ TXA
106b : 6d ed 9f ADC $9fed ; (sstack + 1)
106e : aa __ __ TAX
106f : ad ee 9f LDA $9fee ; (sstack + 2)
1072 : 29 07 __ AND #$07
1074 : 18 __ __ CLC
1075 : 65 47 __ ADC T3 + 0 
1077 : 85 53 __ STA T6 + 0 
1079 : 90 01 __ BCC $107c ; (bmu_bitblit.s54 + 0)
.s53:
107b : e8 __ __ INX
.s54:
107c : 86 54 __ STX T6 + 1 
107e : ad f5 9f LDA $9ff5 ; (sstack + 9)
1081 : 85 1c __ STA ACCU + 1 ; (dy + 1)
1083 : ad f4 9f LDA $9ff4 ; (sstack + 8)
1086 : 29 f8 __ AND #$f8
1088 : 85 1b __ STA ACCU + 0 ; (dy + 0)
108a : a0 04 __ LDY #$04
108c : b1 49 __ LDA (T4 + 0),y 
108e : 85 55 __ STA T8 + 0 
1090 : 20 44 3a JSR $3a44 ; (mul16by8 + 0)
1093 : a0 00 __ LDY #$00
1095 : b1 49 __ LDA (T4 + 0),y 
1097 : 18 __ __ CLC
1098 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
109a : 85 02 __ STA $02 
109c : c8 __ __ INY
109d : b1 49 __ LDA (T4 + 0),y 
109f : 65 1c __ ADC ACCU + 1 ; (dy + 1)
10a1 : aa __ __ TAX
10a2 : ad f2 9f LDA $9ff2 ; (sstack + 6)
10a5 : 29 f8 __ AND #$f8
10a7 : 18 __ __ CLC
10a8 : 65 02 __ ADC $02 
10aa : 85 49 __ STA T4 + 0 
10ac : 8a __ __ TXA
10ad : 6d f3 9f ADC $9ff3 ; (sstack + 7)
10b0 : aa __ __ TAX
10b1 : ad f4 9f LDA $9ff4 ; (sstack + 8)
10b4 : 29 07 __ AND #$07
10b6 : 18 __ __ CLC
10b7 : 65 49 __ ADC T4 + 0 
10b9 : 85 49 __ STA T4 + 0 
10bb : 90 01 __ BCC $10be ; (bmu_bitblit.s56 + 0)
.s55:
10bd : e8 __ __ INX
.s56:
10be : ad f2 9f LDA $9ff2 ; (sstack + 6)
10c1 : 29 07 __ AND #$07
10c3 : 49 ff __ EOR #$ff
10c5 : 38 __ __ SEC
10c6 : 65 4e __ ADC T2 + 0 
10c8 : 85 43 __ STA T0 + 0 
10ca : 29 07 __ AND #$07
10cc : 85 10 __ STA P3 
10ce : a5 15 __ LDA P8 
10d0 : f0 03 __ BEQ $10d5 ; (bmu_bitblit.s7 + 0)
10d2 : 4c c4 12 JMP $12c4 ; (bmu_bitblit.s36 + 0)
.s7:
10d5 : 86 51 __ STX T5 + 1 
10d7 : a4 49 __ LDY T4 + 0 
10d9 : 84 50 __ STY T5 + 0 
10db : a5 43 __ LDA T0 + 0 
10dd : f0 0d __ BEQ $10ec ; (bmu_bitblit.s8 + 0)
.s34:
10df : 30 0b __ BMI $10ec ; (bmu_bitblit.s8 + 0)
.s35:
10e1 : 98 __ __ TYA
10e2 : 18 __ __ CLC
10e3 : 69 f8 __ ADC #$f8
10e5 : 85 50 __ STA T5 + 0 
10e7 : 8a __ __ TXA
10e8 : 69 ff __ ADC #$ff
10ea : 85 51 __ STA T5 + 1 
.s8:
10ec : a5 18 __ LDA P11 ; (op + 0)
10ee : 85 14 __ STA P7 
10f0 : 20 0f 13 JSR $130f ; (builddop.s4 + 0)
10f3 : 18 __ __ CLC
10f4 : a5 52 __ LDA T7 + 0 
10f6 : 69 ff __ ADC #$ff
10f8 : 2a __ __ ROL
10f9 : 2a __ __ ROL
10fa : 2a __ __ ROL
10fb : aa __ __ TAX
10fc : 29 f8 __ AND #$f8
10fe : 85 43 __ STA T0 + 0 
1100 : 8a __ __ TXA
1101 : 29 07 __ AND #$07
1103 : 2a __ __ ROL
1104 : 69 f8 __ ADC #$f8
1106 : 85 44 __ STA T0 + 1 
1108 : ad fa 9f LDA $9ffa ; (sstack + 14)
110b : 85 45 __ STA T1 + 0 
110d : 85 47 __ STA T3 + 0 
110f : ad fb 9f LDA $9ffb ; (sstack + 15)
1112 : 85 46 __ STA T1 + 1 
1114 : a5 18 __ LDA P11 ; (op + 0)
1116 : 29 08 __ AND #$08
1118 : f0 03 __ BEQ $111d ; (bmu_bitblit.s9 + 0)
111a : 4c b7 11 JMP $11b7 ; (bmu_bitblit.s19 + 0)
.s9:
111d : ad f8 9f LDA $9ff8 ; (sstack + 12)
1120 : 85 47 __ STA T3 + 0 
1122 : a5 18 __ LDA P11 ; (op + 0)
1124 : 29 20 __ AND #$20
1126 : d0 4c __ BNE $1174 ; (bmu_bitblit.s15 + 0)
.s10:
1128 : a5 47 __ LDA T3 + 0 
112a : f0 38 __ BEQ $1164 ; (bmu_bitblit.s3 + 0)
.s11:
112c : a9 00 __ LDA #$00
112e : 85 4e __ STA T2 + 0 
.l12:
1130 : a5 53 __ LDA T6 + 0 
1132 : 85 03 __ STA WORK + 0 
1134 : a5 54 __ LDA T6 + 1 
1136 : 85 04 __ STA WORK + 1 
1138 : a5 53 __ LDA T6 + 0 
113a : 85 05 __ STA WORK + 2 
113c : a5 54 __ LDA T6 + 1 
113e : 85 06 __ STA WORK + 3 
1140 : a5 4e __ LDA T2 + 0 
1142 : 85 07 __ STA WORK + 4 
1144 : 20 00 42 JSR $4200 ; (BLIT_CODE[0] + 0)
1147 : e6 53 __ INC T6 + 0 
1149 : d0 02 __ BNE $114d ; (bmu_bitblit.s69 + 0)
.s68:
114b : e6 54 __ INC T6 + 1 
.s69:
114d : a5 53 __ LDA T6 + 0 
114f : 29 07 __ AND #$07
1151 : d0 0d __ BNE $1160 ; (bmu_bitblit.s13 + 0)
.s14:
1153 : 18 __ __ CLC
1154 : a5 53 __ LDA T6 + 0 
1156 : 65 43 __ ADC T0 + 0 
1158 : 85 53 __ STA T6 + 0 
115a : a5 54 __ LDA T6 + 1 
115c : 65 44 __ ADC T0 + 1 
115e : 85 54 __ STA T6 + 1 
.s13:
1160 : c6 47 __ DEC T3 + 0 
1162 : d0 cc __ BNE $1130 ; (bmu_bitblit.l12 + 0)
.s3:
1164 : ad e6 9f LDA $9fe6 ; (bmu_bitblit@stack + 0)
1167 : 85 53 __ STA T6 + 0 
1169 : ad e7 9f LDA $9fe7 ; (bmu_bitblit@stack + 1)
116c : 85 54 __ STA T6 + 1 
116e : ad e8 9f LDA $9fe8 ; (bmu_bitblit@stack + 2)
1171 : 85 55 __ STA T8 + 0 
1173 : 60 __ __ RTS
.s15:
1174 : a5 47 __ LDA T3 + 0 
1176 : f0 ec __ BEQ $1164 ; (bmu_bitblit.s3 + 0)
.l16:
1178 : a5 53 __ LDA T6 + 0 
117a : 29 07 __ AND #$07
117c : a8 __ __ TAY
117d : b1 45 __ LDA (T1 + 0),y 
117f : 85 4e __ STA T2 + 0 
1181 : a5 53 __ LDA T6 + 0 
1183 : 85 03 __ STA WORK + 0 
1185 : a5 54 __ LDA T6 + 1 
1187 : 85 04 __ STA WORK + 1 
1189 : a5 53 __ LDA T6 + 0 
118b : 85 05 __ STA WORK + 2 
118d : a5 54 __ LDA T6 + 1 
118f : 85 06 __ STA WORK + 3 
1191 : a5 4e __ LDA T2 + 0 
1193 : 85 07 __ STA WORK + 4 
1195 : 20 00 42 JSR $4200 ; (BLIT_CODE[0] + 0)
1198 : e6 53 __ INC T6 + 0 
119a : d0 02 __ BNE $119e ; (bmu_bitblit.s67 + 0)
.s66:
119c : e6 54 __ INC T6 + 1 
.s67:
119e : a5 53 __ LDA T6 + 0 
11a0 : 29 07 __ AND #$07
11a2 : d0 0d __ BNE $11b1 ; (bmu_bitblit.s17 + 0)
.s18:
11a4 : 18 __ __ CLC
11a5 : a5 53 __ LDA T6 + 0 
11a7 : 65 43 __ ADC T0 + 0 
11a9 : 85 53 __ STA T6 + 0 
11ab : a5 54 __ LDA T6 + 1 
11ad : 65 44 __ ADC T0 + 1 
11af : 85 54 __ STA T6 + 1 
.s17:
11b1 : c6 47 __ DEC T3 + 0 
11b3 : d0 c3 __ BNE $1178 ; (bmu_bitblit.l16 + 0)
11b5 : f0 ad __ BEQ $1164 ; (bmu_bitblit.s3 + 0)
.s19:
11b7 : 18 __ __ CLC
11b8 : a5 55 __ LDA T8 + 0 
11ba : 69 ff __ ADC #$ff
11bc : 2a __ __ ROL
11bd : 2a __ __ ROL
11be : 2a __ __ ROL
11bf : aa __ __ TAX
11c0 : 29 f8 __ AND #$f8
11c2 : 85 4e __ STA T2 + 0 
11c4 : 8a __ __ TXA
11c5 : 29 07 __ AND #$07
11c7 : 2a __ __ ROL
11c8 : 69 f8 __ ADC #$f8
11ca : 85 4f __ STA T2 + 1 
11cc : a5 46 __ LDA T1 + 1 
11ce : 85 48 __ STA T3 + 1 
11d0 : 05 45 __ ORA T1 + 0 
11d2 : d0 08 __ BNE $11dc ; (bmu_bitblit.s21 + 0)
.s20:
11d4 : a5 50 __ LDA T5 + 0 
11d6 : 85 47 __ STA T3 + 0 
11d8 : a5 51 __ LDA T5 + 1 
11da : 85 48 __ STA T3 + 1 
.s21:
11dc : ad f8 9f LDA $9ff8 ; (sstack + 12)
11df : 85 45 __ STA T1 + 0 
11e1 : a5 15 __ LDA P8 
11e3 : d0 03 __ BNE $11e8 ; (bmu_bitblit.s28 + 0)
11e5 : 4c 67 12 JMP $1267 ; (bmu_bitblit.s22 + 0)
.s28:
11e8 : 38 __ __ SEC
11e9 : a9 00 __ LDA #$00
11eb : e5 43 __ SBC T0 + 0 
11ed : 85 43 __ STA T0 + 0 
11ef : a9 00 __ LDA #$00
11f1 : e5 44 __ SBC T0 + 1 
11f3 : 85 44 __ STA T0 + 1 
11f5 : 38 __ __ SEC
11f6 : a9 00 __ LDA #$00
11f8 : e5 4e __ SBC T2 + 0 
11fa : 85 4e __ STA T2 + 0 
11fc : a9 00 __ LDA #$00
11fe : e5 4f __ SBC T2 + 1 
1200 : 85 4f __ STA T2 + 1 
1202 : a5 45 __ LDA T1 + 0 
1204 : d0 03 __ BNE $1209 ; (bmu_bitblit.l29 + 0)
1206 : 4c 64 11 JMP $1164 ; (bmu_bitblit.s3 + 0)
.l29:
1209 : a5 50 __ LDA T5 + 0 
120b : 29 07 __ AND #$07
120d : d0 0d __ BNE $121c ; (bmu_bitblit.s30 + 0)
.s33:
120f : 18 __ __ CLC
1210 : a5 50 __ LDA T5 + 0 
1212 : 65 4e __ ADC T2 + 0 
1214 : 85 50 __ STA T5 + 0 
1216 : a5 51 __ LDA T5 + 1 
1218 : 65 4f __ ADC T2 + 1 
121a : 85 51 __ STA T5 + 1 
.s30:
121c : a5 53 __ LDA T6 + 0 
121e : 29 07 __ AND #$07
1220 : d0 0d __ BNE $122f ; (bmu_bitblit.s31 + 0)
.s32:
1222 : 18 __ __ CLC
1223 : a5 53 __ LDA T6 + 0 
1225 : 65 43 __ ADC T0 + 0 
1227 : 85 53 __ STA T6 + 0 
1229 : a5 54 __ LDA T6 + 1 
122b : 65 44 __ ADC T0 + 1 
122d : 85 54 __ STA T6 + 1 
.s31:
122f : 18 __ __ CLC
1230 : a5 53 __ LDA T6 + 0 
1232 : 69 ff __ ADC #$ff
1234 : 85 53 __ STA T6 + 0 
1236 : 29 07 __ AND #$07
1238 : a8 __ __ TAY
1239 : b0 02 __ BCS $123d ; (bmu_bitblit.s59 + 0)
.s58:
123b : c6 54 __ DEC T6 + 1 
.s59:
123d : b1 47 __ LDA (T3 + 0),y 
123f : 85 49 __ STA T4 + 0 
1241 : a5 50 __ LDA T5 + 0 
1243 : d0 02 __ BNE $1247 ; (bmu_bitblit.s61 + 0)
.s60:
1245 : c6 51 __ DEC T5 + 1 
.s61:
1247 : c6 50 __ DEC T5 + 0 
1249 : a5 50 __ LDA T5 + 0 
124b : 85 03 __ STA WORK + 0 
124d : a5 51 __ LDA T5 + 1 
124f : 85 04 __ STA WORK + 1 
1251 : a5 53 __ LDA T6 + 0 
1253 : 85 05 __ STA WORK + 2 
1255 : a5 54 __ LDA T6 + 1 
1257 : 85 06 __ STA WORK + 3 
1259 : a5 49 __ LDA T4 + 0 
125b : 85 07 __ STA WORK + 4 
125d : 20 00 42 JSR $4200 ; (BLIT_CODE[0] + 0)
1260 : c6 45 __ DEC T1 + 0 
1262 : d0 a5 __ BNE $1209 ; (bmu_bitblit.l29 + 0)
1264 : 4c 64 11 JMP $1164 ; (bmu_bitblit.s3 + 0)
.s22:
1267 : a5 45 __ LDA T1 + 0 
1269 : f0 f9 __ BEQ $1264 ; (bmu_bitblit.s61 + 29)
.l23:
126b : a5 53 __ LDA T6 + 0 
126d : 29 07 __ AND #$07
126f : a8 __ __ TAY
1270 : b1 47 __ LDA (T3 + 0),y 
1272 : 85 49 __ STA T4 + 0 
1274 : a5 50 __ LDA T5 + 0 
1276 : 85 03 __ STA WORK + 0 
1278 : a5 51 __ LDA T5 + 1 
127a : 85 04 __ STA WORK + 1 
127c : a5 53 __ LDA T6 + 0 
127e : 85 05 __ STA WORK + 2 
1280 : a5 54 __ LDA T6 + 1 
1282 : 85 06 __ STA WORK + 3 
1284 : a5 49 __ LDA T4 + 0 
1286 : 85 07 __ STA WORK + 4 
1288 : 20 00 42 JSR $4200 ; (BLIT_CODE[0] + 0)
128b : e6 50 __ INC T5 + 0 
128d : d0 02 __ BNE $1291 ; (bmu_bitblit.s63 + 0)
.s62:
128f : e6 51 __ INC T5 + 1 
.s63:
1291 : a5 50 __ LDA T5 + 0 
1293 : 29 07 __ AND #$07
1295 : d0 0d __ BNE $12a4 ; (bmu_bitblit.s24 + 0)
.s27:
1297 : 18 __ __ CLC
1298 : a5 50 __ LDA T5 + 0 
129a : 65 4e __ ADC T2 + 0 
129c : 85 50 __ STA T5 + 0 
129e : a5 51 __ LDA T5 + 1 
12a0 : 65 4f __ ADC T2 + 1 
12a2 : 85 51 __ STA T5 + 1 
.s24:
12a4 : e6 53 __ INC T6 + 0 
12a6 : d0 02 __ BNE $12aa ; (bmu_bitblit.s65 + 0)
.s64:
12a8 : e6 54 __ INC T6 + 1 
.s65:
12aa : a5 53 __ LDA T6 + 0 
12ac : 29 07 __ AND #$07
12ae : d0 0d __ BNE $12bd ; (bmu_bitblit.s25 + 0)
.s26:
12b0 : 18 __ __ CLC
12b1 : a5 53 __ LDA T6 + 0 
12b3 : 65 43 __ ADC T0 + 0 
12b5 : 85 53 __ STA T6 + 0 
12b7 : a5 54 __ LDA T6 + 1 
12b9 : 65 44 __ ADC T0 + 1 
12bb : 85 54 __ STA T6 + 1 
.s25:
12bd : c6 45 __ DEC T1 + 0 
12bf : d0 aa __ BNE $126b ; (bmu_bitblit.l23 + 0)
12c1 : 4c 64 11 JMP $1164 ; (bmu_bitblit.s3 + 0)
.s36:
12c4 : 18 __ __ CLC
12c5 : a5 11 __ LDA P4 
12c7 : 69 e1 __ ADC #$e1
12c9 : 2a __ __ ROL
12ca : 2a __ __ ROL
12cb : 2a __ __ ROL
12cc : a8 __ __ TAY
12cd : 29 f8 __ AND #$f8
12cf : 85 45 __ STA T1 + 0 
12d1 : 98 __ __ TYA
12d2 : 29 07 __ AND #$07
12d4 : 2a __ __ ROL
12d5 : 69 f8 __ ADC #$f8
12d7 : 85 46 __ STA T1 + 1 
12d9 : 18 __ __ CLC
12da : a5 53 __ LDA T6 + 0 
12dc : 65 45 __ ADC T1 + 0 
12de : 85 53 __ STA T6 + 0 
12e0 : a5 54 __ LDA T6 + 1 
12e2 : 65 46 __ ADC T1 + 1 
12e4 : 85 54 __ STA T6 + 1 
12e6 : a5 13 __ LDA P6 
12e8 : 85 12 __ STA P5 
12ea : a5 4c __ LDA T10 + 0 
12ec : 85 13 __ STA P6 
12ee : 18 __ __ CLC
12ef : a5 49 __ LDA T4 + 0 
12f1 : 65 45 __ ADC T1 + 0 
12f3 : 85 50 __ STA T5 + 0 
12f5 : 8a __ __ TXA
12f6 : 65 46 __ ADC T1 + 1 
12f8 : 85 51 __ STA T5 + 1 
12fa : 24 43 __ BIT T0 + 0 
12fc : 30 03 __ BMI $1301 ; (bmu_bitblit.s37 + 0)
12fe : 4c ec 10 JMP $10ec ; (bmu_bitblit.s8 + 0)
.s37:
1301 : 18 __ __ CLC
1302 : a5 50 __ LDA T5 + 0 
1304 : 69 08 __ ADC #$08
1306 : 85 50 __ STA T5 + 0 
1308 : 90 f4 __ BCC $12fe ; (bmu_bitblit.s36 + 58)
.s57:
130a : e6 51 __ INC T5 + 1 
130c : 4c ec 10 JMP $10ec ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
130f : a5 15 __ LDA P8 ; (reverse + 0)
1311 : f0 16 __ BEQ $1329 ; (builddop.s5 + 0)
.s48:
1313 : a9 38 __ LDA #$38
1315 : 85 48 __ STA T9 + 0 
1317 : a9 e1 __ LDA #$e1
1319 : 85 49 __ STA T10 + 0 
131b : a9 b0 __ LDA #$b0
131d : 85 4a __ STA T11 + 0 
131f : a9 c2 __ LDA #$c2
1321 : 85 4b __ STA T12 + 0 
1323 : a9 f8 __ LDA #$f8
1325 : 85 44 __ STA T3 + 0 
1327 : d0 16 __ BNE $133f ; (builddop.s6 + 0)
.s5:
1329 : a9 18 __ LDA #$18
132b : 85 48 __ STA T9 + 0 
132d : a9 61 __ LDA #$61
132f : 85 49 __ STA T10 + 0 
1331 : a9 90 __ LDA #$90
1333 : 85 4a __ STA T11 + 0 
1335 : a9 e2 __ LDA #$e2
1337 : 85 4b __ STA T12 + 0 
1339 : a9 00 __ LDA #$00
133b : 85 44 __ STA T3 + 0 
133d : a9 08 __ LDA #$08
.s6:
133f : 85 47 __ STA T6 + 0 
1341 : a5 14 __ LDA P7 ; (op + 0)
1343 : 29 08 __ AND #$08
1345 : 85 45 __ STA T4 + 0 
1347 : a5 14 __ LDA P7 ; (op + 0)
1349 : 29 10 __ AND #$10
134b : 85 46 __ STA T5 + 0 
134d : a5 11 __ LDA P4 ; (w + 0)
134f : d0 06 __ BNE $1357 ; (builddop.s8 + 0)
.s7:
1351 : a5 13 __ LDA P6 ; (rmask + 0)
1353 : 25 12 __ AND P5 ; (lmask + 0)
1355 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
1357 : a9 a0 __ LDA #$a0
1359 : 8d 00 42 STA $4200 ; (BLIT_CODE[0] + 0)
135c : a5 44 __ LDA T3 + 0 
135e : 8d 01 42 STA $4201 ; (BLIT_CODE[0] + 1)
1361 : a9 02 __ LDA #$02
1363 : 85 43 __ STA T0 + 0 
1365 : a6 12 __ LDX P5 ; (lmask + 0)
1367 : e8 __ __ INX
1368 : d0 03 __ BNE $136d ; (builddop.s9 + 0)
136a : 4c a0 15 JMP $15a0 ; (builddop.s44 + 0)
.s9:
136d : a5 46 __ LDA T5 + 0 
136f : f0 18 __ BEQ $1389 ; (builddop.s10 + 0)
.s43:
1371 : a9 b1 __ LDA #$b1
1373 : 8d 02 42 STA $4202 ; (BLIT_CODE[0] + 2)
1376 : a9 05 __ LDA #$05
1378 : 8d 03 42 STA $4203 ; (BLIT_CODE[0] + 3)
137b : a9 85 __ LDA #$85
137d : 8d 04 42 STA $4204 ; (BLIT_CODE[0] + 4)
1380 : a9 0a __ LDA #$0a
1382 : 8d 05 42 STA $4205 ; (BLIT_CODE[0] + 5)
1385 : a9 06 __ LDA #$06
1387 : 85 43 __ STA T0 + 0 
.s10:
1389 : a5 45 __ LDA T4 + 0 
138b : d0 05 __ BNE $1392 ; (builddop.s40 + 0)
.s11:
138d : a5 43 __ LDA T0 + 0 
138f : 4c f3 13 JMP $13f3 ; (builddop.s52 + 0)
.s40:
1392 : a5 10 __ LDA P3 ; (shift + 0)
1394 : 85 0e __ STA P1 
1396 : d0 05 __ BNE $139d ; (builddop.s42 + 0)
.s41:
1398 : a5 43 __ LDA T0 + 0 
139a : 4c ea 13 JMP $13ea ; (builddop.s51 + 0)
.s42:
139d : a9 b1 __ LDA #$b1
139f : a6 43 __ LDX T0 + 0 
13a1 : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
13a4 : a9 03 __ LDA #$03
13a6 : 9d 01 42 STA $4201,x ; (BLIT_CODE[0] + 1)
13a9 : 9d 06 42 STA $4206,x ; (BLIT_CODE[0] + 6)
13ac : 9d 0a 42 STA $420a,x ; (BLIT_CODE[0] + 10)
13af : a9 85 __ LDA #$85
13b1 : 9d 02 42 STA $4202,x ; (BLIT_CODE[0] + 2)
13b4 : 9d 09 42 STA $4209,x ; (BLIT_CODE[0] + 9)
13b7 : a9 08 __ LDA #$08
13b9 : 9d 03 42 STA $4203,x ; (BLIT_CODE[0] + 3)
13bc : 9d 08 42 STA $4208,x ; (BLIT_CODE[0] + 8)
13bf : a9 a5 __ LDA #$a5
13c1 : 9d 05 42 STA $4205,x ; (BLIT_CODE[0] + 5)
13c4 : a9 02 __ LDA #$02
13c6 : 9d 0c 42 STA $420c,x ; (BLIT_CODE[0] + 12)
13c9 : a9 04 __ LDA #$04
13cb : 9d 0e 42 STA $420e,x ; (BLIT_CODE[0] + 14)
13ce : a5 48 __ LDA T9 + 0 
13d0 : 9d 04 42 STA $4204,x ; (BLIT_CODE[0] + 4)
13d3 : a5 49 __ LDA T10 + 0 
13d5 : 09 08 __ ORA #$08
13d7 : 9d 07 42 STA $4207,x ; (BLIT_CODE[0] + 7)
13da : a5 4a __ LDA T11 + 0 
13dc : 9d 0b 42 STA $420b,x ; (BLIT_CODE[0] + 11)
13df : a5 4b __ LDA T12 + 0 
13e1 : 09 04 __ ORA #$04
13e3 : 9d 0d 42 STA $420d,x ; (BLIT_CODE[0] + 13)
13e6 : 8a __ __ TXA
13e7 : 18 __ __ CLC
13e8 : 69 0f __ ADC #$0f
.s51:
13ea : 85 0d __ STA P0 
13ec : a5 15 __ LDA P8 ; (reverse + 0)
13ee : 85 0f __ STA P2 
13f0 : 20 01 16 JSR $1601 ; (builddop_src.s4 + 0)
.s52:
13f3 : 85 0d __ STA P0 
13f5 : a5 14 __ LDA P7 ; (op + 0)
13f7 : 85 0e __ STA P1 
13f9 : a5 12 __ LDA P5 ; (lmask + 0)
13fb : 49 ff __ EOR #$ff
13fd : 85 0f __ STA P2 
13ff : 20 41 17 JSR $1741 ; (builddop_op.s4 + 0)
1402 : 85 43 __ STA T0 + 0 
1404 : a5 11 __ LDA P4 ; (w + 0)
1406 : f0 68 __ BEQ $1470 ; (builddop.s12 + 0)
.s13:
1408 : a9 a0 __ LDA #$a0
140a : a6 43 __ LDX T0 + 0 
140c : e8 __ __ INX
140d : e8 __ __ INX
140e : 86 43 __ STX T0 + 0 
1410 : 86 0d __ STX P0 
1412 : 9d fe 41 STA $41fe,x 
1415 : 18 __ __ CLC
1416 : a5 47 __ LDA T6 + 0 
1418 : 65 44 __ ADC T3 + 0 
141a : 85 44 __ STA T3 + 0 
141c : 9d ff 41 STA $41ff,x 
.s14:
141f : a5 11 __ LDA P4 ; (w + 0)
1421 : c9 02 __ CMP #$02
1423 : b0 53 __ BCS $1478 ; (builddop.s21 + 0)
.s15:
1425 : a5 13 __ LDA P6 ; (rmask + 0)
1427 : f0 47 __ BEQ $1470 ; (builddop.s12 + 0)
.s16:
1429 : a5 46 __ LDA T5 + 0 
142b : f0 1e __ BEQ $144b ; (builddop.s17 + 0)
.s20:
142d : a9 b1 __ LDA #$b1
142f : a6 43 __ LDX T0 + 0 
1431 : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
1434 : a9 05 __ LDA #$05
1436 : 9d 01 42 STA $4201,x ; (BLIT_CODE[0] + 1)
1439 : a9 85 __ LDA #$85
143b : 9d 02 42 STA $4202,x ; (BLIT_CODE[0] + 2)
143e : a9 0a __ LDA #$0a
1440 : 9d 03 42 STA $4203,x ; (BLIT_CODE[0] + 3)
1443 : 8a __ __ TXA
1444 : 18 __ __ CLC
1445 : 69 04 __ ADC #$04
1447 : 85 43 __ STA T0 + 0 
1449 : 85 0d __ STA P0 
.s17:
144b : a5 45 __ LDA T4 + 0 
144d : d0 05 __ BNE $1454 ; (builddop.s19 + 0)
.s18:
144f : a5 43 __ LDA T0 + 0 
1451 : 4c 5f 14 JMP $145f ; (builddop.s50 + 0)
.s19:
1454 : a5 10 __ LDA P3 ; (shift + 0)
1456 : 85 0e __ STA P1 
1458 : a5 15 __ LDA P8 ; (reverse + 0)
145a : 85 0f __ STA P2 
145c : 20 01 16 JSR $1601 ; (builddop_src.s4 + 0)
.s50:
145f : 85 0d __ STA P0 
1461 : a5 14 __ LDA P7 ; (op + 0)
1463 : 85 0e __ STA P1 
1465 : a5 13 __ LDA P6 ; (rmask + 0)
1467 : 49 ff __ EOR #$ff
1469 : 85 0f __ STA P2 
146b : 20 41 17 JSR $1741 ; (builddop_op.s4 + 0)
146e : 85 43 __ STA T0 + 0 
.s12:
1470 : a9 60 __ LDA #$60
1472 : a6 43 __ LDX T0 + 0 
1474 : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
.s3:
1477 : 60 __ __ RTS
.s21:
1478 : a9 02 __ LDA #$02
147a : c5 11 __ CMP P4 ; (w + 0)
147c : a9 00 __ LDA #$00
147e : 6a __ __ ROR
147f : 85 4c __ STA T14 + 0 
1481 : d0 19 __ BNE $149c ; (builddop.s22 + 0)
.s39:
1483 : a9 a2 __ LDA #$a2
1485 : a6 43 __ LDX T0 + 0 
1487 : e8 __ __ INX
1488 : e8 __ __ INX
1489 : 86 43 __ STX T0 + 0 
148b : 9d fe 41 STA $41fe,x 
148e : 38 __ __ SEC
148f : a5 11 __ LDA P4 ; (w + 0)
1491 : e9 01 __ SBC #$01
1493 : 9d ff 41 STA $41ff,x 
1496 : a5 11 __ LDA P4 ; (w + 0)
1498 : c9 20 __ CMP #$20
149a : b0 0d __ BCS $14a9 ; (builddop.s24 + 0)
.s22:
149c : a5 10 __ LDA P3 ; (shift + 0)
149e : d0 09 __ BNE $14a9 ; (builddop.s24 + 0)
.s23:
14a0 : a5 48 __ LDA T9 + 0 
14a2 : a6 43 __ LDX T0 + 0 
14a4 : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
14a7 : e6 43 __ INC T0 + 0 
.s24:
14a9 : a6 43 __ LDX T0 + 0 
14ab : 86 4d __ STX T15 + 0 
14ad : a5 46 __ LDA T5 + 0 
14af : f0 1a __ BEQ $14cb ; (builddop.s25 + 0)
.s38:
14b1 : a9 b1 __ LDA #$b1
14b3 : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
14b6 : a9 05 __ LDA #$05
14b8 : 9d 01 42 STA $4201,x ; (BLIT_CODE[0] + 1)
14bb : a9 85 __ LDA #$85
14bd : 9d 02 42 STA $4202,x ; (BLIT_CODE[0] + 2)
14c0 : a9 0a __ LDA #$0a
14c2 : 9d 03 42 STA $4203,x ; (BLIT_CODE[0] + 3)
14c5 : 8a __ __ TXA
14c6 : 18 __ __ CLC
14c7 : 69 04 __ ADC #$04
14c9 : 85 43 __ STA T0 + 0 
.s25:
14cb : a5 45 __ LDA T4 + 0 
14cd : d0 05 __ BNE $14d4 ; (builddop.s37 + 0)
.s26:
14cf : a5 43 __ LDA T0 + 0 
14d1 : 4c e3 14 JMP $14e3 ; (builddop.s49 + 0)
.s37:
14d4 : a5 43 __ LDA T0 + 0 
14d6 : 85 0d __ STA P0 
14d8 : a5 10 __ LDA P3 ; (shift + 0)
14da : 85 0e __ STA P1 
14dc : a5 15 __ LDA P8 ; (reverse + 0)
14de : 85 0f __ STA P2 
14e0 : 20 01 16 JSR $1601 ; (builddop_src.s4 + 0)
.s49:
14e3 : 85 0d __ STA P0 
14e5 : a5 14 __ LDA P7 ; (op + 0)
14e7 : 85 0e __ STA P1 
14e9 : a9 00 __ LDA #$00
14eb : 85 0f __ STA P2 
14ed : 20 41 17 JSR $1741 ; (builddop_op.s4 + 0)
14f0 : 24 4c __ BIT T14 + 0 
14f2 : 10 17 __ BPL $150b ; (builddop.s28 + 0)
.s27:
14f4 : aa __ __ TAX
14f5 : e8 __ __ INX
14f6 : e8 __ __ INX
14f7 : 86 43 __ STX T0 + 0 
14f9 : 86 0d __ STX P0 
14fb : a9 a0 __ LDA #$a0
14fd : 9d fe 41 STA $41fe,x 
1500 : 18 __ __ CLC
1501 : a5 47 __ LDA T6 + 0 
1503 : 65 44 __ ADC T3 + 0 
1505 : 9d ff 41 STA $41ff,x 
1508 : 4c 25 14 JMP $1425 ; (builddop.s15 + 0)
.s28:
150b : a8 __ __ TAY
150c : a9 1f __ LDA #$1f
150e : c5 11 __ CMP P4 ; (w + 0)
1510 : a9 00 __ LDA #$00
1512 : 6a __ __ ROR
1513 : 85 47 __ STA T6 + 0 
1515 : f0 04 __ BEQ $151b ; (builddop.s36 + 0)
.s29:
1517 : a5 10 __ LDA P3 ; (shift + 0)
1519 : f0 06 __ BEQ $1521 ; (builddop.s30 + 0)
.s36:
151b : a5 48 __ LDA T9 + 0 
151d : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1520 : c8 __ __ INY
.s30:
1521 : a9 98 __ LDA #$98
1523 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1526 : a9 08 __ LDA #$08
1528 : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
152b : a9 a8 __ LDA #$a8
152d : 99 03 42 STA $4203,y ; (BLIT_CODE[0] + 3)
1530 : a5 49 __ LDA T10 + 0 
1532 : 09 08 __ ORA #$08
1534 : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
1537 : 98 __ __ TYA
1538 : 18 __ __ CLC
1539 : 69 04 __ ADC #$04
153b : 85 43 __ STA T0 + 0 
153d : 24 47 __ BIT T6 + 0 
153f : 30 3a __ BMI $157b ; (builddop.s31 + 0)
.s32:
1541 : a5 4a __ LDA T11 + 0 
1543 : 99 04 42 STA $4204,y ; (BLIT_CODE[0] + 4)
1546 : a5 4b __ LDA T12 + 0 
1548 : 09 04 __ ORA #$04
154a : aa __ __ TAX
154b : a5 45 __ LDA T4 + 0 
154d : d0 0d __ BNE $155c ; (builddop.s35 + 0)
.s33:
154f : a9 02 __ LDA #$02
1551 : 99 05 42 STA $4205,y ; (BLIT_CODE[0] + 5)
1554 : 18 __ __ CLC
1555 : a5 43 __ LDA T0 + 0 
1557 : 69 02 __ ADC #$02
1559 : 4c 6d 15 JMP $156d ; (builddop.s34 + 0)
.s35:
155c : a9 04 __ LDA #$04
155e : 99 05 42 STA $4205,y ; (BLIT_CODE[0] + 5)
1561 : 99 07 42 STA $4207,y ; (BLIT_CODE[0] + 7)
1564 : 8a __ __ TXA
1565 : 99 06 42 STA $4206,y ; (BLIT_CODE[0] + 6)
1568 : 18 __ __ CLC
1569 : a5 43 __ LDA T0 + 0 
156b : 69 04 __ ADC #$04
.s34:
156d : a8 __ __ TAY
156e : c8 __ __ INY
156f : c8 __ __ INY
1570 : 84 43 __ STY T0 + 0 
1572 : 8a __ __ TXA
1573 : 99 fe 41 STA $41fe,y 
1576 : a9 06 __ LDA #$06
1578 : 99 ff 41 STA $41ff,y 
.s31:
157b : a9 ca __ LDA #$ca
157d : a4 43 __ LDY T0 + 0 
157f : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1582 : a9 d0 __ LDA #$d0
1584 : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
1587 : 98 __ __ TYA
1588 : 18 __ __ CLC
1589 : 69 01 __ ADC #$01
158b : aa __ __ TAX
158c : e8 __ __ INX
158d : e8 __ __ INX
158e : 86 43 __ STX T0 + 0 
1590 : 86 0d __ STX P0 
1592 : 49 ff __ EOR #$ff
1594 : 38 __ __ SEC
1595 : 65 4d __ ADC T15 + 0 
1597 : 38 __ __ SEC
1598 : e9 02 __ SBC #$02
159a : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
159d : 4c 25 14 JMP $1425 ; (builddop.s15 + 0)
.s44:
15a0 : 85 0d __ STA P0 
15a2 : a5 45 __ LDA T4 + 0 
15a4 : f0 51 __ BEQ $15f7 ; (builddop.s45 + 0)
.s46:
15a6 : a5 10 __ LDA P3 ; (shift + 0)
15a8 : f0 4d __ BEQ $15f7 ; (builddop.s45 + 0)
.s47:
15aa : a9 03 __ LDA #$03
15ac : 8d 03 42 STA $4203 ; (BLIT_CODE[0] + 3)
15af : 8d 08 42 STA $4208 ; (BLIT_CODE[0] + 8)
15b2 : 8d 0c 42 STA $420c ; (BLIT_CODE[0] + 12)
15b5 : a9 b1 __ LDA #$b1
15b7 : 8d 02 42 STA $4202 ; (BLIT_CODE[0] + 2)
15ba : a9 85 __ LDA #$85
15bc : 8d 04 42 STA $4204 ; (BLIT_CODE[0] + 4)
15bf : 8d 0b 42 STA $420b ; (BLIT_CODE[0] + 11)
15c2 : a9 08 __ LDA #$08
15c4 : 8d 05 42 STA $4205 ; (BLIT_CODE[0] + 5)
15c7 : 8d 0a 42 STA $420a ; (BLIT_CODE[0] + 10)
15ca : a9 a5 __ LDA #$a5
15cc : 8d 07 42 STA $4207 ; (BLIT_CODE[0] + 7)
15cf : a9 02 __ LDA #$02
15d1 : 8d 0e 42 STA $420e ; (BLIT_CODE[0] + 14)
15d4 : a9 04 __ LDA #$04
15d6 : 8d 10 42 STA $4210 ; (BLIT_CODE[0] + 16)
15d9 : a5 48 __ LDA T9 + 0 
15db : 8d 06 42 STA $4206 ; (BLIT_CODE[0] + 6)
15de : a5 49 __ LDA T10 + 0 
15e0 : 09 08 __ ORA #$08
15e2 : 8d 09 42 STA $4209 ; (BLIT_CODE[0] + 9)
15e5 : a5 4a __ LDA T11 + 0 
15e7 : 8d 0d 42 STA $420d ; (BLIT_CODE[0] + 13)
15ea : a5 4b __ LDA T12 + 0 
15ec : 09 04 __ ORA #$04
15ee : 8d 0f 42 STA $420f ; (BLIT_CODE[0] + 15)
15f1 : a9 11 __ LDA #$11
15f3 : 85 43 __ STA T0 + 0 
15f5 : 85 0d __ STA P0 
.s45:
15f7 : e6 11 __ INC P4 ; (w + 0)
15f9 : d0 03 __ BNE $15fe ; (builddop.s45 + 7)
15fb : 4c 70 14 JMP $1470 ; (builddop.s12 + 0)
15fe : 4c 1f 14 JMP $141f ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1601 : a6 0d __ LDX P0 ; (ip + 0)
1603 : e8 __ __ INX
1604 : a4 0d __ LDY P0 ; (ip + 0)
1606 : e8 __ __ INX
1607 : a5 0e __ LDA P1 ; (shift + 0)
1609 : d0 0c __ BNE $1617 ; (builddop_src.s6 + 0)
.s5:
160b : a9 b1 __ LDA #$b1
160d : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1610 : a9 03 __ LDA #$03
1612 : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
1615 : 8a __ __ TXA
.s3:
1616 : 60 __ __ RTS
.s6:
1617 : a9 a5 __ LDA #$a5
1619 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
161c : a9 08 __ LDA #$08
161e : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
1621 : a5 0f __ LDA P2 ; (reverse + 0)
1623 : f0 03 __ BEQ $1628 ; (builddop_src.s7 + 0)
1625 : 4c 33 17 JMP $1733 ; (builddop_src.s26 + 0)
.s7:
1628 : a5 0e __ LDA P1 ; (shift + 0)
162a : c9 05 __ CMP #$05
162c : b0 06 __ BCS $1634 ; (builddop_src.s8 + 0)
.s24:
162e : a9 4a __ LDA #$4a
.s25:
1630 : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
1633 : e8 __ __ INX
.s8:
1634 : a9 85 __ LDA #$85
1636 : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
1639 : 9d 04 42 STA $4204,x ; (BLIT_CODE[0] + 4)
163c : a9 09 __ LDA #$09
163e : 9d 01 42 STA $4201,x ; (BLIT_CODE[0] + 1)
1641 : a9 b1 __ LDA #$b1
1643 : 9d 02 42 STA $4202,x ; (BLIT_CODE[0] + 2)
1646 : a9 03 __ LDA #$03
1648 : 9d 03 42 STA $4203,x ; (BLIT_CODE[0] + 3)
164b : a9 08 __ LDA #$08
164d : 9d 05 42 STA $4205,x ; (BLIT_CODE[0] + 5)
1650 : 8a __ __ TXA
1651 : 18 __ __ CLC
1652 : 69 06 __ ADC #$06
1654 : 85 1b __ STA ACCU + 0 
1656 : a8 __ __ TAY
1657 : a5 0f __ LDA P2 ; (reverse + 0)
1659 : d0 72 __ BNE $16cd ; (builddop_src.s17 + 0)
.s9:
165b : a5 0e __ LDA P1 ; (shift + 0)
165d : c9 05 __ CMP #$05
165f : 90 0b __ BCC $166c ; (builddop_src.s10 + 0)
.s13:
1661 : a9 0a __ LDA #$0a
1663 : 9d 06 42 STA $4206,x ; (BLIT_CODE[0] + 6)
1666 : e6 1b __ INC ACCU + 0 
1668 : a6 0e __ LDX P1 ; (shift + 0)
166a : b0 25 __ BCS $1691 ; (builddop_src.l14 + 0)
.s10:
166c : c9 02 __ CMP #$02
166e : 90 19 __ BCC $1689 ; (builddop_src.s11 + 0)
.s12:
1670 : c6 0e __ DEC P1 ; (shift + 0)
1672 : a6 0e __ LDX P1 ; (shift + 0)
.l29:
1674 : a9 6a __ LDA #$6a
1676 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1679 : a9 46 __ LDA #$46
167b : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
167e : a9 09 __ LDA #$09
1680 : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
1683 : c8 __ __ INY
1684 : c8 __ __ INY
1685 : c8 __ __ INY
1686 : ca __ __ DEX
1687 : d0 eb __ BNE $1674 ; (builddop_src.l29 + 0)
.s11:
1689 : a9 6a __ LDA #$6a
.s30:
168b : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
168e : c8 __ __ INY
168f : 98 __ __ TYA
1690 : 60 __ __ RTS
.l14:
1691 : a5 1b __ LDA ACCU + 0 
1693 : 85 1d __ STA ACCU + 2 
1695 : 85 1c __ STA ACCU + 1 
1697 : a8 __ __ TAY
1698 : 18 __ __ CLC
1699 : 69 03 __ ADC #$03
169b : 85 1b __ STA ACCU + 0 
169d : e0 07 __ CPX #$07
169f : b0 16 __ BCS $16b7 ; (builddop_src.s15 + 0)
.s16:
16a1 : a9 26 __ LDA #$26
16a3 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
16a6 : a9 09 __ LDA #$09
16a8 : a4 1d __ LDY ACCU + 2 
16aa : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
16ad : a9 0a __ LDA #$0a
16af : a4 1c __ LDY ACCU + 1 
16b1 : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
16b4 : e8 __ __ INX
16b5 : 90 da __ BCC $1691 ; (builddop_src.l14 + 0)
.s15:
16b7 : a9 a5 __ LDA #$a5
16b9 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
16bc : a9 09 __ LDA #$09
16be : a6 1d __ LDX ACCU + 2 
16c0 : 9d 01 42 STA $4201,x ; (BLIT_CODE[0] + 1)
16c3 : a9 2a __ LDA #$2a
16c5 : a6 1c __ LDX ACCU + 1 
16c7 : 9d 02 42 STA $4202,x ; (BLIT_CODE[0] + 2)
16ca : a5 1b __ LDA ACCU + 0 
16cc : 60 __ __ RTS
.s17:
16cd : a5 0e __ LDA P1 ; (shift + 0)
16cf : c9 05 __ CMP #$05
16d1 : b0 3e __ BCS $1711 ; (builddop_src.s21 + 0)
.s18:
16d3 : a9 4a __ LDA #$4a
16d5 : 9d 06 42 STA $4206,x ; (BLIT_CODE[0] + 6)
16d8 : e6 1b __ INC ACCU + 0 
16da : a6 0e __ LDX P1 ; (shift + 0)
16dc : e0 02 __ CPX #$02
16de : 90 1b __ BCC $16fb ; (builddop_src.s19 + 0)
.s20:
16e0 : a4 1b __ LDY ACCU + 0 
.l28:
16e2 : a9 66 __ LDA #$66
16e4 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
16e7 : a9 09 __ LDA #$09
16e9 : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
16ec : a9 4a __ LDA #$4a
16ee : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
16f1 : 98 __ __ TYA
16f2 : 18 __ __ CLC
16f3 : 69 03 __ ADC #$03
16f5 : a8 __ __ TAY
16f6 : ca __ __ DEX
16f7 : d0 e9 __ BNE $16e2 ; (builddop_src.l28 + 0)
.s31:
16f9 : 85 1b __ STA ACCU + 0 
.s19:
16fb : a9 a5 __ LDA #$a5
16fd : a6 1b __ LDX ACCU + 0 
16ff : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
1702 : a9 09 __ LDA #$09
1704 : 9d 01 42 STA $4201,x ; (BLIT_CODE[0] + 1)
1707 : a9 6a __ LDA #$6a
1709 : 9d 02 42 STA $4202,x ; (BLIT_CODE[0] + 2)
170c : 8a __ __ TXA
170d : 18 __ __ CLC
170e : 69 03 __ ADC #$03
1710 : 60 __ __ RTS
.s21:
1711 : c9 07 __ CMP #$07
1713 : b0 19 __ BCS $172e ; (builddop_src.s22 + 0)
.s23:
1715 : aa __ __ TAX
.l32:
1716 : a9 2a __ LDA #$2a
1718 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
171b : a9 06 __ LDA #$06
171d : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
1720 : a9 09 __ LDA #$09
1722 : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
1725 : 98 __ __ TYA
1726 : 69 03 __ ADC #$03
1728 : e8 __ __ INX
1729 : e0 07 __ CPX #$07
172b : a8 __ __ TAY
172c : 90 e8 __ BCC $1716 ; (builddop_src.l32 + 0)
.s22:
172e : a9 2a __ LDA #$2a
1730 : 4c 8b 16 JMP $168b ; (builddop_src.s30 + 0)
.s26:
1733 : a5 0e __ LDA P1 ; (shift + 0)
1735 : c9 05 __ CMP #$05
1737 : b0 03 __ BCS $173c ; (builddop_src.s27 + 0)
1739 : 4c 34 16 JMP $1634 ; (builddop_src.s8 + 0)
.s27:
173c : a9 0a __ LDA #$0a
173e : 4c 30 16 JMP $1630 ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1741 : a5 0e __ LDA P1 ; (op + 0)
1743 : 29 20 __ AND #$20
1745 : f0 04 __ BEQ $174b ; (builddop_op.s27 + 0)
.s28:
1747 : a9 07 __ LDA #$07
1749 : d0 02 __ BNE $174d ; (builddop_op.s29 + 0)
.s27:
174b : a9 0a __ LDA #$0a
.s29:
174d : 85 1c __ STA ACCU + 1 
174f : a5 0e __ LDA P1 ; (op + 0)
1751 : 29 03 __ AND #$03
1753 : 85 1b __ STA ACCU + 0 
1755 : a5 0e __ LDA P1 ; (op + 0)
1757 : 29 04 __ AND #$04
1759 : f0 03 __ BEQ $175e ; (builddop_op.s5 + 0)
175b : 4c f1 17 JMP $17f1 ; (builddop_op.s18 + 0)
.s5:
175e : a5 0e __ LDA P1 ; (op + 0)
1760 : 29 08 __ AND #$08
1762 : d0 13 __ BNE $1777 ; (builddop_op.s15 + 0)
.s6:
1764 : a9 a5 __ LDA #$a5
1766 : a4 0d __ LDY P0 ; (ip + 0)
1768 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
176b : a5 1c __ LDA ACCU + 1 
.s7:
176d : c8 __ __ INY
176e : c8 __ __ INY
176f : 84 0d __ STY P0 ; (ip + 0)
1771 : 99 ff 41 STA $41ff,y 
1774 : 4c 87 17 JMP $1787 ; (builddop_op.s16 + 0)
.s15:
1777 : a5 0e __ LDA P1 ; (op + 0)
1779 : 0a __ __ ASL
177a : 10 0b __ BPL $1787 ; (builddop_op.s16 + 0)
.s17:
177c : a9 49 __ LDA #$49
177e : a4 0d __ LDY P0 ; (ip + 0)
1780 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1783 : a9 ff __ LDA #$ff
1785 : d0 e6 __ BNE $176d ; (builddop_op.s7 + 0)
.s16:
1787 : a6 1b __ LDX ACCU + 0 
1789 : f0 13 __ BEQ $179e ; (builddop_op.s8 + 0)
.s14:
178b : a5 1c __ LDA ACCU + 1 
178d : a4 0d __ LDY P0 ; (ip + 0)
178f : c8 __ __ INY
1790 : c8 __ __ INY
1791 : 84 0d __ STY P0 ; (ip + 0)
1793 : 99 ff 41 STA $41ff,y 
1796 : bd fc 3f LDA $3ffc,x ; (blitops_op[0] + 0)
1799 : 09 04 __ ORA #$04
179b : 99 fe 41 STA $41fe,y 
.s8:
179e : a5 0f __ LDA P2 ; (mask + 0)
17a0 : f0 3f __ BEQ $17e1 ; (builddop_op.s9 + 0)
.s10:
17a2 : a9 85 __ LDA #$85
17a4 : a4 0d __ LDY P0 ; (ip + 0)
17a6 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
17a9 : a9 09 __ LDA #$09
17ab : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
17ae : 98 __ __ TYA
17af : 18 __ __ CLC
17b0 : 69 08 __ ADC #$08
17b2 : 85 0d __ STA P0 ; (ip + 0)
17b4 : a5 0e __ LDA P1 ; (op + 0)
17b6 : 29 10 __ AND #$10
17b8 : f0 09 __ BEQ $17c3 ; (builddop_op.s11 + 0)
.s13:
17ba : a9 45 __ LDA #$45
17bc : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
17bf : a9 0a __ LDA #$0a
17c1 : d0 07 __ BNE $17ca ; (builddop_op.s12 + 0)
.s11:
17c3 : a9 51 __ LDA #$51
17c5 : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
17c8 : a9 05 __ LDA #$05
.s12:
17ca : 99 03 42 STA $4203,y ; (BLIT_CODE[0] + 3)
17cd : a9 29 __ LDA #$29
17cf : 99 04 42 STA $4204,y ; (BLIT_CODE[0] + 4)
17d2 : a5 0f __ LDA P2 ; (mask + 0)
17d4 : 99 05 42 STA $4205,y ; (BLIT_CODE[0] + 5)
17d7 : a9 45 __ LDA #$45
17d9 : 99 06 42 STA $4206,y ; (BLIT_CODE[0] + 6)
17dc : a9 09 __ LDA #$09
17de : 99 07 42 STA $4207,y ; (BLIT_CODE[0] + 7)
.s9:
17e1 : a9 91 __ LDA #$91
17e3 : a6 0d __ LDX P0 ; (ip + 0)
17e5 : 9d 00 42 STA $4200,x ; (BLIT_CODE[0] + 0)
17e8 : a9 05 __ LDA #$05
17ea : 9d 01 42 STA $4201,x ; (BLIT_CODE[0] + 1)
17ed : e8 __ __ INX
17ee : e8 __ __ INX
17ef : 8a __ __ TXA
.s3:
17f0 : 60 __ __ RTS
.s18:
17f1 : a5 1b __ LDA ACCU + 0 
17f3 : d0 04 __ BNE $17f9 ; (builddop_op.s20 + 0)
.s19:
17f5 : a5 0f __ LDA P2 ; (mask + 0)
17f7 : d0 14 __ BNE $180d ; (builddop_op.s23 + 0)
.s20:
17f9 : a5 0e __ LDA P1 ; (op + 0)
17fb : 29 40 __ AND #$40
17fd : f0 02 __ BEQ $1801 ; (builddop_op.s21 + 0)
.s22:
17ff : a9 ff __ LDA #$ff
.s21:
1801 : aa __ __ TAX
1802 : a9 a9 __ LDA #$a9
1804 : a4 0d __ LDY P0 ; (ip + 0)
1806 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1809 : 8a __ __ TXA
180a : 4c 6d 17 JMP $176d ; (builddop_op.s7 + 0)
.s23:
180d : a9 b1 __ LDA #$b1
180f : a4 0d __ LDY P0 ; (ip + 0)
1811 : 99 00 42 STA $4200,y ; (BLIT_CODE[0] + 0)
1814 : a9 05 __ LDA #$05
1816 : 99 01 42 STA $4201,y ; (BLIT_CODE[0] + 1)
1819 : 06 0e __ ASL P1 ; (op + 0)
181b : 30 0a __ BMI $1827 ; (builddop_op.s26 + 0)
.s24:
181d : a9 29 __ LDA #$29
181f : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
1822 : a5 0f __ LDA P2 ; (mask + 0)
1824 : 4c 30 18 JMP $1830 ; (builddop_op.s25 + 0)
.s26:
1827 : a9 09 __ LDA #$09
1829 : 99 02 42 STA $4202,y ; (BLIT_CODE[0] + 2)
182c : a5 0f __ LDA P2 ; (mask + 0)
182e : 49 ff __ EOR #$ff
.s25:
1830 : 99 03 42 STA $4203,y ; (BLIT_CODE[0] + 3)
1833 : a9 91 __ LDA #$91
1835 : 99 04 42 STA $4204,y ; (BLIT_CODE[0] + 4)
1838 : a9 05 __ LDA #$05
183a : 99 05 42 STA $4205,y ; (BLIT_CODE[0] + 5)
183d : 98 __ __ TYA
183e : 18 __ __ CLC
183f : 69 06 __ ADC #$06
1841 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_init: ; cwin_init(struct CharWin*,u8*,u8,u8,u8,u8)->void
;  15, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1842 : a5 11 __ LDA P4 ; (sx + 0)
1844 : a0 00 __ LDY #$00
1846 : 91 0d __ STA (P0),y ; (win + 0)
1848 : a5 12 __ LDA P5 ; (sy + 0)
184a : c8 __ __ INY
184b : 91 0d __ STA (P0),y ; (win + 0)
184d : a5 13 __ LDA P6 ; (wx + 0)
184f : c8 __ __ INY
1850 : 91 0d __ STA (P0),y ; (win + 0)
1852 : a5 14 __ LDA P7 ; (wy + 0)
1854 : c8 __ __ INY
1855 : 91 0d __ STA (P0),y ; (win + 0)
1857 : a9 00 __ LDA #$00
1859 : c8 __ __ INY
185a : 91 0d __ STA (P0),y ; (win + 0)
185c : c8 __ __ INY
185d : 91 0d __ STA (P0),y ; (win + 0)
185f : 06 12 __ ASL P5 ; (sy + 0)
1861 : a6 12 __ LDX P5 ; (sy + 0)
1863 : bd 00 40 LDA $4000,x ; (mul40[0] + 0)
1866 : 85 12 __ STA P5 ; (sy + 0)
1868 : 18 __ __ CLC
1869 : 65 11 __ ADC P4 ; (sx + 0)
186b : a0 0a __ LDY #$0a
186d : 91 0d __ STA (P0),y ; (win + 0)
186f : bd 01 40 LDA $4001,x ; (mul40[0] + 1)
1872 : aa __ __ TAX
1873 : 69 d8 __ ADC #$d8
1875 : c8 __ __ INY
1876 : 91 0d __ STA (P0),y ; (win + 0)
1878 : 18 __ __ CLC
1879 : a5 0f __ LDA P2 ; (screen + 0)
187b : 65 12 __ ADC P5 ; (sy + 0)
187d : a8 __ __ TAY
187e : 8a __ __ TXA
187f : 65 10 __ ADC P3 ; (screen + 1)
1881 : aa __ __ TAX
1882 : 98 __ __ TYA
1883 : 18 __ __ CLC
1884 : 65 11 __ ADC P4 ; (sx + 0)
1886 : a0 08 __ LDY #$08
1888 : 91 0d __ STA (P0),y ; (win + 0)
188a : 8a __ __ TXA
188b : 69 00 __ ADC #$00
188d : c8 __ __ INY
188e : 91 0d __ STA (P0),y ; (win + 0)
.s3:
1890 : 60 __ __ RTS
--------------------------------------------------------------------
1891 : __ __ __ BYT 00 00 00 00 40 01 9e 00                         : ....@...
--------------------------------------------------------------------
cwin_fill: ; cwin_fill(struct CharWin*,u8,u8)->void
;  24, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1899 : a0 03 __ LDY #$03
189b : b1 0d __ LDA (P0),y ; (win + 0)
189d : f0 4c __ BEQ $18eb ; (cwin_fill.s3 + 0)
.s5:
189f : a0 08 __ LDY #$08
18a1 : b1 0d __ LDA (P0),y ; (win + 0)
18a3 : 85 1b __ STA ACCU + 0 
18a5 : c8 __ __ INY
18a6 : b1 0d __ LDA (P0),y ; (win + 0)
18a8 : 85 1c __ STA ACCU + 1 
18aa : c8 __ __ INY
18ab : b1 0d __ LDA (P0),y ; (win + 0)
18ad : 85 43 __ STA T2 + 0 
18af : c8 __ __ INY
18b0 : b1 0d __ LDA (P0),y ; (win + 0)
18b2 : 85 44 __ STA T2 + 1 
18b4 : a2 00 __ LDX #$00
.l6:
18b6 : a0 02 __ LDY #$02
18b8 : b1 0d __ LDA (P0),y ; (win + 0)
18ba : f0 11 __ BEQ $18cd ; (cwin_fill.s7 + 0)
.s8:
18bc : 85 1d __ STA ACCU + 2 
18be : a0 00 __ LDY #$00
.l9:
18c0 : a5 0f __ LDA P2 ; (ch + 0)
18c2 : 91 1b __ STA (ACCU + 0),y 
18c4 : a5 10 __ LDA P3 ; (color + 0)
18c6 : 91 43 __ STA (T2 + 0),y 
18c8 : c8 __ __ INY
18c9 : c4 1d __ CPY ACCU + 2 
18cb : 90 f3 __ BCC $18c0 ; (cwin_fill.l9 + 0)
.s7:
18cd : 18 __ __ CLC
18ce : a5 43 __ LDA T2 + 0 
18d0 : 69 28 __ ADC #$28
18d2 : 85 43 __ STA T2 + 0 
18d4 : 90 03 __ BCC $18d9 ; (cwin_fill.s11 + 0)
.s10:
18d6 : e6 44 __ INC T2 + 1 
18d8 : 18 __ __ CLC
.s11:
18d9 : a5 1b __ LDA ACCU + 0 
18db : 69 28 __ ADC #$28
18dd : 85 1b __ STA ACCU + 0 
18df : 90 02 __ BCC $18e3 ; (cwin_fill.s13 + 0)
.s12:
18e1 : e6 1c __ INC ACCU + 1 
.s13:
18e3 : e8 __ __ INX
18e4 : 8a __ __ TXA
18e5 : a0 03 __ LDY #$03
18e7 : d1 0d __ CMP (P0),y ; (win + 0)
18e9 : 90 cb __ BCC $18b6 ; (cwin_fill.l6 + 0)
.s3:
18eb : 60 __ __ RTS
--------------------------------------------------------------------
cwin_putat_string: ; cwin_putat_string(struct CharWin*,u8,u8,const u8*,u8)->u8
;  90, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
18ec : a5 10 __ LDA P3 ; (y + 0)
18ee : 0a __ __ ASL
18ef : aa __ __ TAX
18f0 : bd 00 40 LDA $4000,x ; (mul40[0] + 0)
18f3 : 65 0f __ ADC P2 ; (x + 0)
18f5 : 85 1b __ STA ACCU + 0 
18f7 : bd 01 40 LDA $4001,x ; (mul40[0] + 1)
18fa : 69 00 __ ADC #$00
18fc : 85 1c __ STA ACCU + 1 
18fe : a0 08 __ LDY #$08
1900 : b1 0d __ LDA (P0),y ; (win + 0)
1902 : 65 1b __ ADC ACCU + 0 
1904 : 85 43 __ STA T2 + 0 
1906 : c8 __ __ INY
1907 : b1 0d __ LDA (P0),y ; (win + 0)
1909 : 65 1c __ ADC ACCU + 1 
190b : 85 44 __ STA T2 + 1 
190d : c8 __ __ INY
190e : b1 0d __ LDA (P0),y ; (win + 0)
1910 : 18 __ __ CLC
1911 : 65 1b __ ADC ACCU + 0 
1913 : 85 1b __ STA ACCU + 0 
1915 : c8 __ __ INY
1916 : b1 0d __ LDA (P0),y ; (win + 0)
1918 : 65 1c __ ADC ACCU + 1 
191a : 85 1c __ STA ACCU + 1 
191c : a0 00 __ LDY #$00
191e : b1 11 __ LDA (P4),y ; (str + 0)
1920 : f0 16 __ BEQ $1938 ; (cwin_putat_string.s5 + 0)
.l6:
1922 : 4a __ __ LSR
1923 : 4a __ __ LSR
1924 : 4a __ __ LSR
1925 : 4a __ __ LSR
1926 : 4a __ __ LSR
1927 : aa __ __ TAX
1928 : bd 32 40 LDA $4032,x ; (p2smap[0] + 0)
192b : 51 11 __ EOR (P4),y ; (str + 0)
192d : 91 43 __ STA (T2 + 0),y 
192f : a5 13 __ LDA P6 ; (color + 0)
1931 : 91 1b __ STA (ACCU + 0),y 
1933 : c8 __ __ INY
1934 : b1 11 __ LDA (P4),y ; (str + 0)
1936 : d0 ea __ BNE $1922 ; (cwin_putat_string.l6 + 0)
.s5:
1938 : 98 __ __ TYA
.s3:
1939 : 60 __ __ RTS
--------------------------------------------------------------------
193a : __ __ __ BYT c5 4e 54 45 52 20 58 2c 20 59 20 41 4e 44 20 52 : .NTER X, Y AND R
194a : __ __ __ BYT 41 44 49 55 53 20 46 4f 52 20 43 49 52 43 4c 45 : ADIUS FOR CIRCLE
195a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
cwin_edit: ; cwin_edit(struct CharWin*)->u8
; 158, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
195b : ad ec 9f LDA $9fec ; (sstack + 0)
195e : 85 4f __ STA T0 + 0 
1960 : 85 15 __ STA P8 
1962 : ad ed 9f LDA $9fed ; (sstack + 1)
1965 : 85 50 __ STA T0 + 1 
1967 : 85 16 __ STA P9 
.l6:
1969 : a5 4f __ LDA T0 + 0 
196b : 85 0d __ STA P0 
196d : a5 50 __ LDA T0 + 1 
196f : 85 0e __ STA P1 
1971 : a9 01 __ LDA #$01
1973 : 85 0f __ STA P2 
1975 : 20 92 19 JSR $1992 ; (cwin_cursor_show.s4 + 0)
1978 : c6 0f __ DEC P2 
197a : 20 c0 19 JSR $19c0 ; (cwin_getch.s4 + 0)
197d : a5 1b __ LDA ACCU + 0 
197f : 85 51 __ STA T1 + 0 
1981 : 20 92 19 JSR $1992 ; (cwin_cursor_show.s4 + 0)
1984 : a5 51 __ LDA T1 + 0 
1986 : 85 17 __ STA P10 
1988 : 20 ce 19 JSR $19ce ; (cwin_edit_char.s4 + 0)
198b : a5 1b __ LDA ACCU + 0 
198d : f0 da __ BEQ $1969 ; (cwin_edit.l6 + 0)
.s5:
198f : a5 17 __ LDA P10 
.s3:
1991 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_cursor_show: ; cwin_cursor_show(struct CharWin*,bool)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1992 : a0 05 __ LDY #$05
1994 : b1 0d __ LDA (P0),y ; (win + 0)
1996 : 0a __ __ ASL
1997 : aa __ __ TAX
1998 : a0 08 __ LDY #$08
199a : b1 0d __ LDA (P0),y ; (win + 0)
199c : 7d 00 40 ADC $4000,x ; (mul40[0] + 0)
199f : 85 1b __ STA ACCU + 0 
19a1 : c8 __ __ INY
19a2 : b1 0d __ LDA (P0),y ; (win + 0)
19a4 : 7d 01 40 ADC $4001,x ; (mul40[0] + 1)
19a7 : 85 1c __ STA ACCU + 1 
19a9 : a0 04 __ LDY #$04
19ab : b1 0d __ LDA (P0),y ; (win + 0)
19ad : a8 __ __ TAY
19ae : a5 0f __ LDA P2 ; (show + 0)
19b0 : d0 07 __ BNE $19b9 ; (cwin_cursor_show.s7 + 0)
.s5:
19b2 : b1 1b __ LDA (ACCU + 0),y 
19b4 : 29 7f __ AND #$7f
19b6 : 91 1b __ STA (ACCU + 0),y 
19b8 : 60 __ __ RTS
.s7:
19b9 : b1 1b __ LDA (ACCU + 0),y 
19bb : 09 80 __ ORA #$80
.s6:
19bd : 91 1b __ STA (ACCU + 0),y 
.s3:
19bf : 60 __ __ RTS
--------------------------------------------------------------------
cwin_getch: ; cwin_getch()->i16
; 147, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
19c0 : 20 e4 ff JSR $ffe4 
19c3 : c9 00 __ CMP #$00
19c5 : f0 f9 __ BEQ $19c0 ; (cwin_getch.s4 + 0)
19c7 : 85 1b __ STA ACCU + 0 
19c9 : a9 00 __ LDA #$00
19cb : 85 1c __ STA ACCU + 1 
.s3:
19cd : 60 __ __ RTS
--------------------------------------------------------------------
cwin_edit_char: ; cwin_edit_char(struct CharWin*,u8)->bool
; 153, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
19ce : a5 17 __ LDA P10 ; (ch + 0)
19d0 : c9 14 __ CMP #$14
19d2 : d0 03 __ BNE $19d7 ; (cwin_edit_char.s5 + 0)
19d4 : 4c a3 1a JMP $1aa3 ; (cwin_edit_char.s30 + 0)
.s5:
19d7 : b0 03 __ BCS $19dc ; (cwin_edit_char.s6 + 0)
19d9 : 4c 7b 1a JMP $1a7b ; (cwin_edit_char.s23 + 0)
.s6:
19dc : c9 93 __ CMP #$93
19de : d0 16 __ BNE $19f6 ; (cwin_edit_char.s7 + 0)
.s22:
19e0 : a5 15 __ LDA P8 ; (win + 0)
19e2 : 85 0d __ STA P0 
19e4 : a9 20 __ LDA #$20
19e6 : 85 0f __ STA P2 
19e8 : a9 01 __ LDA #$01
19ea : 85 10 __ STA P3 
19ec : a5 16 __ LDA P9 ; (win + 1)
19ee : 85 0e __ STA P1 
19f0 : 20 99 18 JSR $1899 ; (cwin_fill.s4 + 0)
19f3 : 4c 70 1a JMP $1a70 ; (cwin_edit_char.s34 + 0)
.s7:
19f6 : 90 5d __ BCC $1a55 ; (cwin_edit_char.s18 + 0)
.s8:
19f8 : c9 9d __ CMP #$9d
19fa : d0 10 __ BNE $1a0c ; (cwin_edit_char.s9 + 0)
.s17:
19fc : a5 15 __ LDA P8 ; (win + 0)
19fe : 85 0d __ STA P0 
1a00 : a5 16 __ LDA P9 ; (win + 1)
1a02 : 85 0e __ STA P1 
1a04 : 20 1e 1b JSR $1b1e ; (cwin_cursor_backward.s4 + 0)
.s32:
1a07 : a9 00 __ LDA #$00
.s3:
1a09 : 85 1b __ STA ACCU + 0 
1a0b : 60 __ __ RTS
.s9:
1a0c : c9 20 __ CMP #$20
1a0e : 90 f7 __ BCC $1a07 ; (cwin_edit_char.s32 + 0)
.s16:
1a10 : aa __ __ TAX
1a11 : 10 04 __ BPL $1a17 ; (cwin_edit_char.s11 + 0)
.s10:
1a13 : c9 a0 __ CMP #$a0
1a15 : 90 f0 __ BCC $1a07 ; (cwin_edit_char.s32 + 0)
.s11:
1a17 : a0 05 __ LDY #$05
1a19 : b1 15 __ LDA (P8),y ; (win + 0)
1a1b : 18 __ __ CLC
1a1c : 69 01 __ ADC #$01
1a1e : b0 06 __ BCS $1a26 ; (cwin_edit_char.s12 + 0)
.s15:
1a20 : a0 03 __ LDY #$03
1a22 : d1 15 __ CMP (P8),y ; (win + 0)
1a24 : 90 0e __ BCC $1a34 ; (cwin_edit_char.s13 + 0)
.s12:
1a26 : a0 04 __ LDY #$04
1a28 : b1 15 __ LDA (P8),y ; (win + 0)
1a2a : 69 00 __ ADC #$00
1a2c : b0 d9 __ BCS $1a07 ; (cwin_edit_char.s32 + 0)
.s14:
1a2e : a0 02 __ LDY #$02
1a30 : d1 15 __ CMP (P8),y ; (win + 0)
1a32 : b0 d3 __ BCS $1a07 ; (cwin_edit_char.s32 + 0)
.s13:
1a34 : a5 15 __ LDA P8 ; (win + 0)
1a36 : 85 11 __ STA P4 
1a38 : a5 16 __ LDA P9 ; (win + 1)
1a3a : 85 12 __ STA P5 
1a3c : a5 17 __ LDA P10 ; (ch + 0)
1a3e : 85 13 __ STA P6 
1a40 : a9 01 __ LDA #$01
1a42 : 85 14 __ STA P7 
1a44 : 20 3d 1c JSR $1c3d ; (cwin_insert_char.s4 + 0)
1a47 : a5 12 __ LDA P5 
.s33:
1a49 : 85 0e __ STA P1 
1a4b : a5 15 __ LDA P8 ; (win + 0)
1a4d : 85 0d __ STA P0 
1a4f : 20 e3 1a JSR $1ae3 ; (cwin_cursor_forward.s4 + 0)
1a52 : 4c 07 1a JMP $1a07 ; (cwin_edit_char.s32 + 0)
.s18:
1a55 : c9 1d __ CMP #$1d
1a57 : d0 05 __ BNE $1a5e ; (cwin_edit_char.s19 + 0)
.s21:
1a59 : a5 16 __ LDA P9 ; (win + 1)
1a5b : 4c 49 1a JMP $1a49 ; (cwin_edit_char.s33 + 0)
.s19:
1a5e : c9 91 __ CMP #$91
1a60 : d0 aa __ BNE $1a0c ; (cwin_edit_char.s9 + 0)
.s20:
1a62 : a5 15 __ LDA P8 ; (win + 0)
1a64 : 85 0d __ STA P0 
1a66 : a5 16 __ LDA P9 ; (win + 1)
1a68 : 85 0e __ STA P1 
1a6a : 20 d5 1a JSR $1ad5 ; (cwin_cursor_up.s4 + 0)
1a6d : 4c 07 1a JMP $1a07 ; (cwin_edit_char.s32 + 0)
.s34:
1a70 : a9 00 __ LDA #$00
1a72 : a0 04 __ LDY #$04
1a74 : 91 15 __ STA (P8),y ; (win + 0)
1a76 : c8 __ __ INY
1a77 : 91 15 __ STA (P8),y ; (win + 0)
1a79 : d0 8e __ BNE $1a09 ; (cwin_edit_char.s3 + 0)
.s23:
1a7b : c9 11 __ CMP #$11
1a7d : d0 0e __ BNE $1a8d ; (cwin_edit_char.s24 + 0)
.s29:
1a7f : a5 15 __ LDA P8 ; (win + 0)
1a81 : 85 0d __ STA P0 
1a83 : a5 16 __ LDA P9 ; (win + 1)
1a85 : 85 0e __ STA P1 
1a87 : 20 b7 1a JSR $1ab7 ; (cwin_cursor_down.s4 + 0)
1a8a : 4c 07 1a JMP $1a07 ; (cwin_edit_char.s32 + 0)
.s24:
1a8d : 90 07 __ BCC $1a96 ; (cwin_edit_char.s26 + 0)
.s25:
1a8f : c9 13 __ CMP #$13
1a91 : f0 dd __ BEQ $1a70 ; (cwin_edit_char.s34 + 0)
1a93 : 4c 0c 1a JMP $1a0c ; (cwin_edit_char.s9 + 0)
.s26:
1a96 : c9 03 __ CMP #$03
1a98 : f0 04 __ BEQ $1a9e ; (cwin_edit_char.s28 + 0)
.s27:
1a9a : c9 0d __ CMP #$0d
1a9c : d0 f5 __ BNE $1a93 ; (cwin_edit_char.s25 + 4)
.s28:
1a9e : a9 01 __ LDA #$01
1aa0 : 4c 09 1a JMP $1a09 ; (cwin_edit_char.s3 + 0)
.s30:
1aa3 : a5 15 __ LDA P8 ; (win + 0)
1aa5 : 85 0d __ STA P0 
1aa7 : a5 16 __ LDA P9 ; (win + 1)
1aa9 : 85 0e __ STA P1 
1aab : 20 1e 1b JSR $1b1e ; (cwin_cursor_backward.s4 + 0)
1aae : aa __ __ TAX
1aaf : f0 d9 __ BEQ $1a8a ; (cwin_edit_char.s29 + 11)
.s31:
1ab1 : 20 42 1b JSR $1b42 ; (cwin_delete_char.s4 + 0)
1ab4 : 4c 07 1a JMP $1a07 ; (cwin_edit_char.s32 + 0)
--------------------------------------------------------------------
cwin_cursor_down: ; cwin_cursor_down(struct CharWin*)->bool
;  41, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1ab7 : a0 03 __ LDY #$03
1ab9 : b1 0d __ LDA (P0),y ; (win + 0)
1abb : 85 1b __ STA ACCU + 0 
1abd : a0 05 __ LDY #$05
1abf : b1 0d __ LDA (P0),y ; (win + 0)
1ac1 : aa __ __ TAX
1ac2 : 18 __ __ CLC
1ac3 : 69 01 __ ADC #$01
1ac5 : b0 0b __ BCS $1ad2 ; (cwin_cursor_down.s5 + 0)
.s7:
1ac7 : c5 1b __ CMP ACCU + 0 
1ac9 : b0 07 __ BCS $1ad2 ; (cwin_cursor_down.s5 + 0)
.s6:
1acb : e8 __ __ INX
1acc : 8a __ __ TXA
1acd : 91 0d __ STA (P0),y ; (win + 0)
1acf : a9 01 __ LDA #$01
1ad1 : 60 __ __ RTS
.s5:
1ad2 : a9 00 __ LDA #$00
.s3:
1ad4 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_cursor_up: ; cwin_cursor_up(struct CharWin*)->bool
;  40, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1ad5 : a0 05 __ LDY #$05
1ad7 : b1 0d __ LDA (P0),y ; (win + 0)
1ad9 : f0 07 __ BEQ $1ae2 ; (cwin_cursor_up.s3 + 0)
.s5:
1adb : 38 __ __ SEC
1adc : e9 01 __ SBC #$01
1ade : 91 0d __ STA (P0),y ; (win + 0)
1ae0 : a9 01 __ LDA #$01
.s3:
1ae2 : 60 __ __ RTS
--------------------------------------------------------------------
cwin_cursor_forward: ; cwin_cursor_forward(struct CharWin*)->bool
;  42, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1ae3 : a0 02 __ LDY #$02
1ae5 : b1 0d __ LDA (P0),y ; (win + 0)
1ae7 : 85 1b __ STA ACCU + 0 
1ae9 : a0 04 __ LDY #$04
1aeb : b1 0d __ LDA (P0),y ; (win + 0)
1aed : aa __ __ TAX
1aee : 18 __ __ CLC
1aef : 69 01 __ ADC #$01
1af1 : b0 0b __ BCS $1afe ; (cwin_cursor_forward.s5 + 0)
.s10:
1af3 : c5 1b __ CMP ACCU + 0 
1af5 : b0 07 __ BCS $1afe ; (cwin_cursor_forward.s5 + 0)
.s9:
1af7 : e8 __ __ INX
1af8 : 8a __ __ TXA
.s11:
1af9 : 91 0d __ STA (P0),y ; (win + 0)
1afb : a9 01 __ LDA #$01
.s3:
1afd : 60 __ __ RTS
.s5:
1afe : a0 05 __ LDY #$05
1b00 : b1 0d __ LDA (P0),y ; (win + 0)
1b02 : aa __ __ TAX
1b03 : 69 00 __ ADC #$00
1b05 : a8 __ __ TAY
1b06 : a9 00 __ LDA #$00
1b08 : 2a __ __ ROL
1b09 : 38 __ __ SEC
1b0a : d0 05 __ BNE $1b11 ; (cwin_cursor_forward.s8 + 0)
.s7:
1b0c : 98 __ __ TYA
1b0d : a0 03 __ LDY #$03
1b0f : d1 0d __ CMP (P0),y ; (win + 0)
.s8:
1b11 : a9 00 __ LDA #$00
1b13 : b0 e8 __ BCS $1afd ; (cwin_cursor_forward.s3 + 0)
.s6:
1b15 : a0 04 __ LDY #$04
1b17 : 91 0d __ STA (P0),y ; (win + 0)
1b19 : e8 __ __ INX
1b1a : 8a __ __ TXA
1b1b : c8 __ __ INY
1b1c : 90 db __ BCC $1af9 ; (cwin_cursor_forward.s11 + 0)
--------------------------------------------------------------------
cwin_cursor_backward: ; cwin_cursor_backward(struct CharWin*)->bool
;  43, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1b1e : a0 04 __ LDY #$04
1b20 : b1 0d __ LDA (P0),y ; (win + 0)
1b22 : f0 08 __ BEQ $1b2c ; (cwin_cursor_backward.s5 + 0)
.s7:
1b24 : 38 __ __ SEC
1b25 : e9 01 __ SBC #$01
.s8:
1b27 : 91 0d __ STA (P0),y ; (win + 0)
1b29 : a9 01 __ LDA #$01
.s3:
1b2b : 60 __ __ RTS
.s5:
1b2c : c8 __ __ INY
1b2d : b1 0d __ LDA (P0),y ; (win + 0)
1b2f : f0 fa __ BEQ $1b2b ; (cwin_cursor_backward.s3 + 0)
.s6:
1b31 : aa __ __ TAX
1b32 : 38 __ __ SEC
1b33 : a0 02 __ LDY #$02
1b35 : b1 0d __ LDA (P0),y ; (win + 0)
1b37 : e9 01 __ SBC #$01
1b39 : a0 04 __ LDY #$04
1b3b : 91 0d __ STA (P0),y ; (win + 0)
1b3d : ca __ __ DEX
1b3e : 8a __ __ TXA
1b3f : c8 __ __ INY
1b40 : d0 e5 __ BNE $1b27 ; (cwin_cursor_backward.s8 + 0)
--------------------------------------------------------------------
cwin_delete_char: ; cwin_delete_char(struct CharWin*)->void
; 145, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1b42 : a0 05 __ LDY #$05
1b44 : b1 0d __ LDA (P0),y ; (win + 0)
1b46 : 0a __ __ ASL
1b47 : aa __ __ TAX
1b48 : a0 0a __ LDY #$0a
1b4a : b1 0d __ LDA (P0),y ; (win + 0)
1b4c : 7d 00 40 ADC $4000,x ; (mul40[0] + 0)
1b4f : 85 43 __ STA T2 + 0 
1b51 : c8 __ __ INY
1b52 : b1 0d __ LDA (P0),y ; (win + 0)
1b54 : 7d 01 40 ADC $4001,x ; (mul40[0] + 1)
1b57 : 85 44 __ STA T2 + 1 
1b59 : a0 08 __ LDY #$08
1b5b : b1 0d __ LDA (P0),y ; (win + 0)
1b5d : 18 __ __ CLC
1b5e : 7d 00 40 ADC $4000,x ; (mul40[0] + 0)
1b61 : 85 45 __ STA T3 + 0 
1b63 : c8 __ __ INY
1b64 : b1 0d __ LDA (P0),y ; (win + 0)
1b66 : 7d 01 40 ADC $4001,x ; (mul40[0] + 1)
1b69 : 85 46 __ STA T3 + 1 
1b6b : a0 04 __ LDY #$04
1b6d : b1 0d __ LDA (P0),y ; (win + 0)
1b6f : 85 1b __ STA ACCU + 0 
1b71 : a0 02 __ LDY #$02
1b73 : b1 0d __ LDA (P0),y ; (win + 0)
1b75 : 38 __ __ SEC
1b76 : e9 01 __ SBC #$01
1b78 : 85 1d __ STA ACCU + 2 
1b7a : 38 __ __ SEC
1b7b : e5 1b __ SBC ACCU + 0 
1b7d : f0 45 __ BEQ $1bc4 ; (cwin_delete_char.s5 + 0)
.s11:
1b7f : 85 47 __ STA T6 + 0 
1b81 : 18 __ __ CLC
1b82 : a5 43 __ LDA T2 + 0 
1b84 : 65 1b __ ADC ACCU + 0 
1b86 : 85 49 __ STA T7 + 0 
1b88 : a5 44 __ LDA T2 + 1 
1b8a : 69 00 __ ADC #$00
1b8c : 85 4a __ STA T7 + 1 
1b8e : 18 __ __ CLC
1b8f : a5 49 __ LDA T7 + 0 
1b91 : 69 01 __ ADC #$01
1b93 : 85 4b __ STA T8 + 0 
1b95 : a5 4a __ LDA T7 + 1 
1b97 : 69 00 __ ADC #$00
1b99 : 85 4c __ STA T8 + 1 
1b9b : 18 __ __ CLC
1b9c : a5 45 __ LDA T3 + 0 
1b9e : 65 1b __ ADC ACCU + 0 
1ba0 : 85 1b __ STA ACCU + 0 
1ba2 : a5 46 __ LDA T3 + 1 
1ba4 : 69 00 __ ADC #$00
1ba6 : 85 1c __ STA ACCU + 1 
1ba8 : 18 __ __ CLC
1ba9 : a5 1b __ LDA ACCU + 0 
1bab : 69 01 __ ADC #$01
1bad : 85 4d __ STA T9 + 0 
1baf : a5 1c __ LDA ACCU + 1 
1bb1 : 69 00 __ ADC #$00
1bb3 : 85 4e __ STA T9 + 1 
1bb5 : a0 00 __ LDY #$00
.l12:
1bb7 : b1 4d __ LDA (T9 + 0),y 
1bb9 : 91 1b __ STA (ACCU + 0),y 
1bbb : b1 4b __ LDA (T8 + 0),y 
1bbd : 91 49 __ STA (T7 + 0),y 
1bbf : c8 __ __ INY
1bc0 : c4 47 __ CPY T6 + 0 
1bc2 : 90 f3 __ BCC $1bb7 ; (cwin_delete_char.l12 + 0)
.s5:
1bc4 : a0 05 __ LDY #$05
1bc6 : b1 0d __ LDA (P0),y ; (win + 0)
1bc8 : 18 __ __ CLC
1bc9 : 69 01 __ ADC #$01
1bcb : a0 03 __ LDY #$03
1bcd : d1 0d __ CMP (P0),y ; (win + 0)
1bcf : b0 65 __ BCS $1c36 ; (cwin_delete_char.s6 + 0)
.s7:
1bd1 : aa __ __ TAX
1bd2 : a5 1d __ LDA ACCU + 2 
1bd4 : c9 01 __ CMP #$01
1bd6 : a9 00 __ LDA #$00
1bd8 : 6a __ __ ROR
1bd9 : 85 1b __ STA ACCU + 0 
.l8:
1bdb : a0 28 __ LDY #$28
1bdd : b1 45 __ LDA (T3 + 0),y 
1bdf : a4 1d __ LDY ACCU + 2 
1be1 : 91 45 __ STA (T3 + 0),y 
1be3 : a0 28 __ LDY #$28
1be5 : b1 43 __ LDA (T2 + 0),y 
1be7 : a4 1d __ LDY ACCU + 2 
1be9 : 91 43 __ STA (T2 + 0),y 
1beb : 18 __ __ CLC
1bec : a5 45 __ LDA T3 + 0 
1bee : 69 29 __ ADC #$29
1bf0 : 85 47 __ STA T6 + 0 
1bf2 : a5 46 __ LDA T3 + 1 
1bf4 : 69 00 __ ADC #$00
1bf6 : 85 48 __ STA T6 + 1 
1bf8 : 18 __ __ CLC
1bf9 : a5 45 __ LDA T3 + 0 
1bfb : 69 28 __ ADC #$28
1bfd : 85 45 __ STA T3 + 0 
1bff : 90 03 __ BCC $1c04 ; (cwin_delete_char.s15 + 0)
.s14:
1c01 : e6 46 __ INC T3 + 1 
1c03 : 18 __ __ CLC
.s15:
1c04 : a5 43 __ LDA T2 + 0 
1c06 : 69 29 __ ADC #$29
1c08 : 85 49 __ STA T7 + 0 
1c0a : a5 44 __ LDA T2 + 1 
1c0c : 69 00 __ ADC #$00
1c0e : 85 4a __ STA T7 + 1 
1c10 : 18 __ __ CLC
1c11 : a5 43 __ LDA T2 + 0 
1c13 : 69 28 __ ADC #$28
1c15 : 85 43 __ STA T2 + 0 
1c17 : 90 02 __ BCC $1c1b ; (cwin_delete_char.s17 + 0)
.s16:
1c19 : e6 44 __ INC T2 + 1 
.s17:
1c1b : 24 1b __ BIT ACCU + 0 
1c1d : 10 0f __ BPL $1c2e ; (cwin_delete_char.s9 + 0)
.s10:
1c1f : a0 00 __ LDY #$00
.l13:
1c21 : b1 47 __ LDA (T6 + 0),y 
1c23 : 91 45 __ STA (T3 + 0),y 
1c25 : b1 49 __ LDA (T7 + 0),y 
1c27 : 91 43 __ STA (T2 + 0),y 
1c29 : c8 __ __ INY
1c2a : c4 1d __ CPY ACCU + 2 
1c2c : 90 f3 __ BCC $1c21 ; (cwin_delete_char.l13 + 0)
.s9:
1c2e : e8 __ __ INX
1c2f : 8a __ __ TXA
1c30 : a0 03 __ LDY #$03
1c32 : d1 0d __ CMP (P0),y ; (win + 0)
1c34 : 90 a5 __ BCC $1bdb ; (cwin_delete_char.l8 + 0)
.s6:
1c36 : a9 20 __ LDA #$20
1c38 : a4 1d __ LDY ACCU + 2 
1c3a : 91 45 __ STA (T3 + 0),y 
.s3:
1c3c : 60 __ __ RTS
--------------------------------------------------------------------
cwin_insert_char: ; cwin_insert_char(struct CharWin*,u8,u8)->void
; 141, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1c3d : a5 13 __ LDA P6 ; (ch + 0)
1c3f : 4a __ __ LSR
1c40 : 4a __ __ LSR
1c41 : 4a __ __ LSR
1c42 : 4a __ __ LSR
1c43 : 4a __ __ LSR
1c44 : aa __ __ TAX
1c45 : bd 32 40 LDA $4032,x ; (p2smap[0] + 0)
1c48 : 45 13 __ EOR P6 ; (ch + 0)
1c4a : 85 0f __ STA P2 
1c4c : a5 11 __ LDA P4 ; (win + 0)
1c4e : 85 0d __ STA P0 
1c50 : a5 12 __ LDA P5 ; (win + 1)
1c52 : 85 0e __ STA P1 
1c54 : a5 14 __ LDA P7 ; (color + 0)
1c56 : 85 10 __ STA P3 
1c58 : 4c 5b 1c JMP $1c5b ; (cwin_insert_char_raw.s4 + 0)
--------------------------------------------------------------------
cwin_insert_char_raw: ; cwin_insert_char_raw(struct CharWin*,u8,u8)->void
; 139, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1c5b : a0 03 __ LDY #$03
1c5d : b1 0d __ LDA (P0),y ; (win + 0)
1c5f : 38 __ __ SEC
1c60 : e9 01 __ SBC #$01
1c62 : 85 1c __ STA ACCU + 1 
1c64 : 0a __ __ ASL
1c65 : aa __ __ TAX
1c66 : a0 08 __ LDY #$08
1c68 : b1 0d __ LDA (P0),y ; (win + 0)
1c6a : 18 __ __ CLC
1c6b : 7d 00 40 ADC $4000,x ; (mul40[0] + 0)
1c6e : 85 45 __ STA T3 + 0 
1c70 : c8 __ __ INY
1c71 : b1 0d __ LDA (P0),y ; (win + 0)
1c73 : 7d 01 40 ADC $4001,x ; (mul40[0] + 1)
1c76 : 85 46 __ STA T3 + 1 
1c78 : c8 __ __ INY
1c79 : b1 0d __ LDA (P0),y ; (win + 0)
1c7b : 18 __ __ CLC
1c7c : 7d 00 40 ADC $4000,x ; (mul40[0] + 0)
1c7f : 85 43 __ STA T2 + 0 
1c81 : c8 __ __ INY
1c82 : b1 0d __ LDA (P0),y ; (win + 0)
1c84 : 7d 01 40 ADC $4001,x ; (mul40[0] + 1)
1c87 : 85 44 __ STA T2 + 1 
1c89 : a0 02 __ LDY #$02
1c8b : b1 0d __ LDA (P0),y ; (win + 0)
1c8d : 38 __ __ SEC
1c8e : e9 01 __ SBC #$01
1c90 : 85 1b __ STA ACCU + 0 
.l5:
1c92 : a0 05 __ LDY #$05
1c94 : b1 0d __ LDA (P0),y ; (win + 0)
1c96 : c5 1c __ CMP ACCU + 1 
1c98 : 90 4c __ BCC $1ce6 ; (cwin_insert_char_raw.s9 + 0)
.s6:
1c9a : 88 __ __ DEY
1c9b : b1 0d __ LDA (P0),y ; (win + 0)
1c9d : 18 __ __ CLC
1c9e : 65 43 __ ADC T2 + 0 
1ca0 : 85 43 __ STA T2 + 0 
1ca2 : 90 03 __ BCC $1ca7 ; (cwin_insert_char_raw.s15 + 0)
.s14:
1ca4 : e6 44 __ INC T2 + 1 
1ca6 : 18 __ __ CLC
.s15:
1ca7 : 69 01 __ ADC #$01
1ca9 : 85 47 __ STA T4 + 0 
1cab : a5 44 __ LDA T2 + 1 
1cad : 69 00 __ ADC #$00
1caf : 85 48 __ STA T4 + 1 
1cb1 : 18 __ __ CLC
1cb2 : a5 45 __ LDA T3 + 0 
1cb4 : 71 0d __ ADC (P0),y ; (win + 0)
1cb6 : 85 45 __ STA T3 + 0 
1cb8 : 90 03 __ BCC $1cbd ; (cwin_insert_char_raw.s17 + 0)
.s16:
1cba : e6 46 __ INC T3 + 1 
1cbc : 18 __ __ CLC
.s17:
1cbd : 69 01 __ ADC #$01
1cbf : 85 49 __ STA T5 + 0 
1cc1 : a5 46 __ LDA T3 + 1 
1cc3 : 69 00 __ ADC #$00
1cc5 : 85 4a __ STA T5 + 1 
1cc7 : 38 __ __ SEC
1cc8 : a5 1b __ LDA ACCU + 0 
1cca : f1 0d __ SBC (P0),y ; (win + 0)
1ccc : f0 0d __ BEQ $1cdb ; (cwin_insert_char_raw.s7 + 0)
.s8:
1cce : a8 __ __ TAY
.l13:
1ccf : 88 __ __ DEY
1cd0 : b1 45 __ LDA (T3 + 0),y 
1cd2 : 91 49 __ STA (T5 + 0),y 
1cd4 : b1 43 __ LDA (T2 + 0),y 
1cd6 : 91 47 __ STA (T4 + 0),y 
1cd8 : 98 __ __ TYA
1cd9 : d0 f4 __ BNE $1ccf ; (cwin_insert_char_raw.l13 + 0)
.s7:
1cdb : a5 0f __ LDA P2 ; (ch + 0)
1cdd : a0 00 __ LDY #$00
1cdf : 91 45 __ STA (T3 + 0),y 
1ce1 : a5 10 __ LDA P3 ; (color + 0)
1ce3 : 91 43 __ STA (T2 + 0),y 
.s3:
1ce5 : 60 __ __ RTS
.s9:
1ce6 : a5 1b __ LDA ACCU + 0 
1ce8 : f0 27 __ BEQ $1d11 ; (cwin_insert_char_raw.s10 + 0)
.s11:
1cea : a5 45 __ LDA T3 + 0 
1cec : 69 01 __ ADC #$01
1cee : 85 49 __ STA T5 + 0 
1cf0 : a5 46 __ LDA T3 + 1 
1cf2 : 69 00 __ ADC #$00
1cf4 : 85 4a __ STA T5 + 1 
1cf6 : 18 __ __ CLC
1cf7 : a5 43 __ LDA T2 + 0 
1cf9 : 69 01 __ ADC #$01
1cfb : 85 47 __ STA T4 + 0 
1cfd : a5 44 __ LDA T2 + 1 
1cff : 69 00 __ ADC #$00
1d01 : 85 48 __ STA T4 + 1 
1d03 : a4 1b __ LDY ACCU + 0 
.l12:
1d05 : 88 __ __ DEY
1d06 : b1 45 __ LDA (T3 + 0),y 
1d08 : 91 49 __ STA (T5 + 0),y 
1d0a : b1 43 __ LDA (T2 + 0),y 
1d0c : 91 47 __ STA (T4 + 0),y 
1d0e : 98 __ __ TYA
1d0f : d0 f4 __ BNE $1d05 ; (cwin_insert_char_raw.l12 + 0)
.s10:
1d11 : 18 __ __ CLC
1d12 : a5 45 __ LDA T3 + 0 
1d14 : 69 d8 __ ADC #$d8
1d16 : 85 49 __ STA T5 + 0 
1d18 : a5 46 __ LDA T3 + 1 
1d1a : 69 ff __ ADC #$ff
1d1c : 85 4a __ STA T5 + 1 
1d1e : a4 1b __ LDY ACCU + 0 
1d20 : b1 49 __ LDA (T5 + 0),y 
1d22 : a0 00 __ LDY #$00
1d24 : 91 45 __ STA (T3 + 0),y 
1d26 : 18 __ __ CLC
1d27 : a5 43 __ LDA T2 + 0 
1d29 : 69 d8 __ ADC #$d8
1d2b : 85 45 __ STA T3 + 0 
1d2d : aa __ __ TAX
1d2e : a5 44 __ LDA T2 + 1 
1d30 : 69 ff __ ADC #$ff
1d32 : 85 46 __ STA T3 + 1 
1d34 : a4 1b __ LDY ACCU + 0 
1d36 : b1 45 __ LDA (T3 + 0),y 
1d38 : a0 00 __ LDY #$00
1d3a : 91 43 __ STA (T2 + 0),y 
1d3c : 86 43 __ STX T2 + 0 
1d3e : a5 46 __ LDA T3 + 1 
1d40 : 85 44 __ STA T2 + 1 
1d42 : a5 49 __ LDA T5 + 0 
1d44 : 85 45 __ STA T3 + 0 
1d46 : a5 4a __ LDA T5 + 1 
1d48 : 85 46 __ STA T3 + 1 
1d4a : c6 1c __ DEC ACCU + 1 
1d4c : 4c 92 1c JMP $1c92 ; (cwin_insert_char_raw.l5 + 0)
--------------------------------------------------------------------
cwin_read_string: ; cwin_read_string(struct CharWin*,u8*)->void
;  48, "/home/honza/projects/c64/projects/oscar64/include/c64/charwin.h"
.s4:
1d4f : a2 00 __ LDX #$00
1d51 : 86 1d __ STX ACCU + 2 
1d53 : a0 03 __ LDY #$03
1d55 : b1 0d __ LDA (P0),y ; (win + 0)
1d57 : f0 46 __ BEQ $1d9f ; (cwin_read_string.s5 + 0)
.s9:
1d59 : 86 1e __ STX ACCU + 3 
1d5b : a0 08 __ LDY #$08
1d5d : b1 0d __ LDA (P0),y ; (win + 0)
1d5f : 85 1b __ STA ACCU + 0 
1d61 : c8 __ __ INY
1d62 : b1 0d __ LDA (P0),y ; (win + 0)
1d64 : 85 1c __ STA ACCU + 1 
.l10:
1d66 : a9 00 __ LDA #$00
1d68 : 85 43 __ STA T6 + 0 
1d6a : f0 19 __ BEQ $1d85 ; (cwin_read_string.l11 + 0)
.s13:
1d6c : a4 43 __ LDY T6 + 0 
1d6e : b1 1b __ LDA (ACCU + 0),y 
1d70 : 4a __ __ LSR
1d71 : 4a __ __ LSR
1d72 : 4a __ __ LSR
1d73 : 4a __ __ LSR
1d74 : 4a __ __ LSR
1d75 : aa __ __ TAX
1d76 : bd 3a 40 LDA $403a,x ; (s2pmap[0] + 0)
1d79 : 51 1b __ EOR (ACCU + 0),y 
1d7b : a4 1d __ LDY ACCU + 2 
1d7d : 91 0f __ STA (P2),y ; (buffer + 0)
1d7f : e6 43 __ INC T6 + 0 
1d81 : e6 1d __ INC ACCU + 2 
1d83 : a5 43 __ LDA T6 + 0 
.l11:
1d85 : a0 02 __ LDY #$02
1d87 : d1 0d __ CMP (P0),y ; (win + 0)
1d89 : 90 e1 __ BCC $1d6c ; (cwin_read_string.s13 + 0)
.s12:
1d8b : a5 1b __ LDA ACCU + 0 
1d8d : 69 27 __ ADC #$27
1d8f : 85 1b __ STA ACCU + 0 
1d91 : 90 02 __ BCC $1d95 ; (cwin_read_string.s15 + 0)
.s14:
1d93 : e6 1c __ INC ACCU + 1 
.s15:
1d95 : e6 1e __ INC ACCU + 3 
1d97 : a5 1e __ LDA ACCU + 3 
1d99 : a0 03 __ LDY #$03
1d9b : d1 0d __ CMP (P0),y ; (win + 0)
1d9d : 90 c7 __ BCC $1d66 ; (cwin_read_string.l10 + 0)
.s5:
1d9f : a5 1d __ LDA ACCU + 2 
1da1 : f0 0d __ BEQ $1db0 ; (cwin_read_string.s6 + 0)
.l7:
1da3 : a4 1d __ LDY ACCU + 2 
1da5 : 88 __ __ DEY
1da6 : b1 0f __ LDA (P2),y ; (buffer + 0)
1da8 : c9 20 __ CMP #$20
1daa : d0 04 __ BNE $1db0 ; (cwin_read_string.s6 + 0)
.s8:
1dac : c6 1d __ DEC ACCU + 2 
1dae : d0 f3 __ BNE $1da3 ; (cwin_read_string.l7 + 0)
.s6:
1db0 : a9 00 __ LDA #$00
1db2 : a4 1d __ LDY ACCU + 2 
1db4 : 91 0f __ STA (P2),y ; (buffer + 0)
.s3:
1db6 : 60 __ __ RTS
--------------------------------------------------------------------
sscanf: ; sscanf(const u8*,const u8*)->i16
;  28, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
1db7 : ad ee 9f LDA $9fee ; (sstack + 2)
1dba : 85 11 __ STA P4 
1dbc : ad ef 9f LDA $9fef ; (sstack + 3)
1dbf : 85 12 __ STA P5 
1dc1 : a9 00 __ LDA #$00
1dc3 : 85 13 __ STA P6 
1dc5 : a9 9f __ LDA #$9f
1dc7 : 85 18 __ STA P11 
1dc9 : a9 29 __ LDA #$29
1dcb : 85 14 __ STA P7 
1dcd : a9 ec __ LDA #$ec
1dcf : 85 15 __ STA P8 
1dd1 : a9 9f __ LDA #$9f
1dd3 : 85 16 __ STA P9 
1dd5 : a9 f0 __ LDA #$f0
1dd7 : 85 17 __ STA P10 
1dd9 : 4c dc 1d JMP $1ddc ; (fpscanf.s1 + 0)
--------------------------------------------------------------------
fpscanf: ; fpscanf(const u8*,i16(*)(void*)*,void*,void**)->i16
; 645, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
1ddc : 38 __ __ SEC
1ddd : a5 23 __ LDA SP + 0 
1ddf : e9 3f __ SBC #$3f
1de1 : 85 23 __ STA SP + 0 
1de3 : b0 02 __ BCS $1de7 ; (fpscanf.s1 + 11)
1de5 : c6 24 __ DEC SP + 1 
1de7 : a0 1c __ LDY #$1c
1de9 : a2 18 __ LDX #$18
1deb : b5 53 __ LDA T0 + 0,x 
1ded : 91 23 __ STA (SP + 0),y 
1def : 88 __ __ DEY
1df0 : ca __ __ DEX
1df1 : 10 f8 __ BPL $1deb ; (fpscanf.s1 + 15)
.s4:
1df3 : a5 15 __ LDA P8 ; (fparam + 0)
1df5 : a0 02 __ LDY #$02
1df7 : 91 23 __ STA (SP + 0),y 
1df9 : a5 16 __ LDA P9 ; (fparam + 1)
1dfb : c8 __ __ INY
1dfc : 91 23 __ STA (SP + 0),y 
1dfe : a9 00 __ LDA #$00
1e00 : 85 61 __ STA T4 + 0 
1e02 : 85 62 __ STA T4 + 1 
1e04 : a5 13 __ LDA P6 ; (ffunc + 0)
1e06 : 85 1b __ STA ACCU + 0 
1e08 : a5 14 __ LDA P7 ; (ffunc + 1)
1e0a : 85 1c __ STA ACCU + 1 
1e0c : 20 fb 28 JSR $28fb ; (bcexec + 0)
1e0f : a5 1b __ LDA ACCU + 0 
1e11 : f0 56 __ BEQ $1e69 ; (fpscanf.s5 + 0)
.s6:
1e13 : 85 63 __ STA T5 + 0 
1e15 : a9 01 __ LDA #$01
1e17 : 85 64 __ STA T6 + 0 
1e19 : a9 00 __ LDA #$00
1e1b : 85 65 __ STA T6 + 1 
.l7:
1e1d : a5 11 __ LDA P4 ; (fmt + 0)
1e1f : 85 53 __ STA T0 + 0 
1e21 : 18 __ __ CLC
1e22 : 69 01 __ ADC #$01
1e24 : 85 11 __ STA P4 ; (fmt + 0)
1e26 : a5 12 __ LDA P5 ; (fmt + 1)
1e28 : 85 54 __ STA T0 + 1 
1e2a : 69 00 __ ADC #$00
1e2c : 85 12 __ STA P5 ; (fmt + 1)
1e2e : a0 00 __ LDY #$00
1e30 : b1 53 __ LDA (T0 + 0),y 
1e32 : f0 35 __ BEQ $1e69 ; (fpscanf.s5 + 0)
.s8:
1e34 : c9 20 __ CMP #$20
1e36 : d0 03 __ BNE $1e3b ; (fpscanf.s9 + 0)
1e38 : 4c a7 27 JMP $27a7 ; (fpscanf.s148 + 0)
.s9:
1e3b : c9 25 __ CMP #$25
1e3d : f0 4a __ BEQ $1e89 ; (fpscanf.s13 + 0)
.s10:
1e3f : a5 63 __ LDA T5 + 0 
1e41 : d1 53 __ CMP (T0 + 0),y 
1e43 : d0 24 __ BNE $1e69 ; (fpscanf.s5 + 0)
.s11:
1e45 : a5 15 __ LDA P8 ; (fparam + 0)
1e47 : a0 02 __ LDY #$02
1e49 : 91 23 __ STA (SP + 0),y 
1e4b : a5 16 __ LDA P9 ; (fparam + 1)
1e4d : c8 __ __ INY
1e4e : 91 23 __ STA (SP + 0),y 
1e50 : a5 13 __ LDA P6 ; (ffunc + 0)
1e52 : 85 1b __ STA ACCU + 0 
1e54 : a5 14 __ LDA P7 ; (ffunc + 1)
1e56 : 85 1c __ STA ACCU + 1 
1e58 : 20 fb 28 JSR $28fb ; (bcexec + 0)
1e5b : a5 1b __ LDA ACCU + 0 
1e5d : 85 63 __ STA T5 + 0 
1e5f : e6 64 __ INC T6 + 0 
1e61 : d0 02 __ BNE $1e65 ; (fpscanf.s12 + 0)
.s206:
1e63 : e6 65 __ INC T6 + 1 
.s12:
1e65 : a5 63 __ LDA T5 + 0 
1e67 : d0 b4 __ BNE $1e1d ; (fpscanf.l7 + 0)
.s5:
1e69 : a5 61 __ LDA T4 + 0 
1e6b : 85 1b __ STA ACCU + 0 
1e6d : a5 62 __ LDA T4 + 1 
1e6f : 85 1c __ STA ACCU + 1 
.s3:
1e71 : a0 1c __ LDY #$1c
1e73 : a2 18 __ LDX #$18
1e75 : b1 23 __ LDA (SP + 0),y 
1e77 : 95 53 __ STA T0 + 0,x 
1e79 : 88 __ __ DEY
1e7a : ca __ __ DEX
1e7b : 10 f8 __ BPL $1e75 ; (fpscanf.s3 + 4)
1e7d : 18 __ __ CLC
1e7e : a5 23 __ LDA SP + 0 
1e80 : 69 3f __ ADC #$3f
1e82 : 85 23 __ STA SP + 0 
1e84 : 90 02 __ BCC $1e88 ; (fpscanf.s3 + 23)
1e86 : e6 24 __ INC SP + 1 
1e88 : 60 __ __ RTS
.s13:
1e89 : 84 69 __ STY T9 + 0 
1e8b : a5 53 __ LDA T0 + 0 
1e8d : 69 01 __ ADC #$01
1e8f : 85 11 __ STA P4 ; (fmt + 0)
1e91 : a5 54 __ LDA T0 + 1 
1e93 : 69 00 __ ADC #$00
1e95 : 85 12 __ STA P5 ; (fmt + 1)
1e97 : c8 __ __ INY
1e98 : 84 68 __ STY T8 + 0 
1e9a : a9 ff __ LDA #$ff
1e9c : 85 5b __ STA T2 + 0 
1e9e : a9 7f __ LDA #$7f
1ea0 : 85 5c __ STA T2 + 1 
1ea2 : a9 0a __ LDA #$0a
1ea4 : 85 5f __ STA T3 + 0 
1ea6 : b1 53 __ LDA (T0 + 0),y 
1ea8 : c9 2a __ CMP #$2a
1eaa : d0 03 __ BNE $1eaf ; (fpscanf.s14 + 0)
1eac : 4c 8b 27 JMP $278b ; (fpscanf.s147 + 0)
.s14:
1eaf : a2 00 __ LDX #$00
1eb1 : 86 6a __ STX T10 + 0 
1eb3 : c9 30 __ CMP #$30
1eb5 : aa __ __ TAX
1eb6 : 90 5c __ BCC $1f14 ; (fpscanf.s15 + 0)
.s142:
1eb8 : c9 3a __ CMP #$3a
1eba : b0 58 __ BCS $1f14 ; (fpscanf.s15 + 0)
.s143:
1ebc : a0 00 __ LDY #$00
1ebe : b1 11 __ LDA (P4),y ; (fmt + 0)
1ec0 : a8 __ __ TAY
1ec1 : 8a __ __ TXA
1ec2 : e9 2f __ SBC #$2f
1ec4 : 85 5b __ STA T2 + 0 
1ec6 : a9 00 __ LDA #$00
1ec8 : a6 1c __ LDX ACCU + 1 
.l144:
1eca : 84 66 __ STY T7 + 0 
1ecc : 85 5c __ STA T2 + 1 
1ece : e6 11 __ INC P4 ; (fmt + 0)
1ed0 : d0 02 __ BNE $1ed4 ; (fpscanf.s205 + 0)
.s204:
1ed2 : e6 12 __ INC P5 ; (fmt + 1)
.s205:
1ed4 : 98 __ __ TYA
1ed5 : c0 30 __ CPY #$30
1ed7 : b0 04 __ BCS $1edd ; (fpscanf.s145 + 0)
.s170:
1ed9 : 86 1c __ STX ACCU + 1 
1edb : 90 3e __ BCC $1f1b ; (fpscanf.s16 + 0)
.s145:
1edd : c9 3a __ CMP #$3a
1edf : b0 31 __ BCS $1f12 ; (fpscanf.s171 + 0)
.s146:
1ee1 : a0 00 __ LDY #$00
1ee3 : b1 11 __ LDA (P4),y ; (fmt + 0)
1ee5 : a8 __ __ TAY
1ee6 : a5 5b __ LDA T2 + 0 
1ee8 : 0a __ __ ASL
1ee9 : 85 1b __ STA ACCU + 0 
1eeb : a5 5c __ LDA T2 + 1 
1eed : 2a __ __ ROL
1eee : 06 1b __ ASL ACCU + 0 
1ef0 : 2a __ __ ROL
1ef1 : aa __ __ TAX
1ef2 : 18 __ __ CLC
1ef3 : a5 1b __ LDA ACCU + 0 
1ef5 : 65 5b __ ADC T2 + 0 
1ef7 : 85 53 __ STA T0 + 0 
1ef9 : 8a __ __ TXA
1efa : 65 5c __ ADC T2 + 1 
1efc : 06 53 __ ASL T0 + 0 
1efe : 2a __ __ ROL
1eff : 85 54 __ STA T0 + 1 
1f01 : 38 __ __ SEC
1f02 : a5 66 __ LDA T7 + 0 
1f04 : e9 30 __ SBC #$30
1f06 : 18 __ __ CLC
1f07 : 65 53 __ ADC T0 + 0 
1f09 : 85 5b __ STA T2 + 0 
1f0b : a5 54 __ LDA T0 + 1 
1f0d : 69 00 __ ADC #$00
1f0f : 4c ca 1e JMP $1eca ; (fpscanf.l144 + 0)
.s171:
1f12 : 86 1c __ STX ACCU + 1 
.s15:
1f14 : c9 6c __ CMP #$6c
1f16 : d0 03 __ BNE $1f1b ; (fpscanf.s16 + 0)
1f18 : 4c 75 27 JMP $2775 ; (fpscanf.s140 + 0)
.s16:
1f1b : c9 4c __ CMP #$4c
1f1d : f0 f9 __ BEQ $1f18 ; (fpscanf.s15 + 4)
.s17:
1f1f : c9 5b __ CMP #$5b
1f21 : d0 03 __ BNE $1f26 ; (fpscanf.s18 + 0)
1f23 : 4c ea 26 JMP $26ea ; (fpscanf.s134 + 0)
.s18:
1f26 : c9 5b __ CMP #$5b
1f28 : b0 03 __ BCS $1f2d ; (fpscanf.s19 + 0)
1f2a : 4c a7 26 JMP $26a7 ; (fpscanf.s123 + 0)
.s19:
1f2d : c9 6e __ CMP #$6e
1f2f : d0 18 __ BNE $1f49 ; (fpscanf.s20 + 0)
.s122:
1f31 : a0 00 __ LDY #$00
1f33 : b1 17 __ LDA (P10),y ; (params + 0)
1f35 : 85 57 __ STA T1 + 0 
1f37 : c8 __ __ INY
1f38 : b1 17 __ LDA (P10),y ; (params + 0)
1f3a : 85 58 __ STA T1 + 1 
1f3c : a5 64 __ LDA T6 + 0 
1f3e : 88 __ __ DEY
1f3f : 91 57 __ STA (T1 + 0),y 
1f41 : a5 65 __ LDA T6 + 1 
1f43 : c8 __ __ INY
1f44 : 91 57 __ STA (T1 + 0),y 
1f46 : 4c cd 1f JMP $1fcd ; (fpscanf.s35 + 0)
.s20:
1f49 : b0 03 __ BCS $1f4e ; (fpscanf.s21 + 0)
1f4b : 4c ee 21 JMP $21ee ; (fpscanf.s64 + 0)
.s21:
1f4e : c9 75 __ CMP #$75
1f50 : d0 03 __ BNE $1f55 ; (fpscanf.s22 + 0)
1f52 : 4c e9 1f JMP $1fe9 ; (fpscanf.s25 + 0)
.s22:
1f55 : 90 03 __ BCC $1f5a ; (fpscanf.s51 + 0)
1f57 : 4c e1 1f JMP $1fe1 ; (fpscanf.s23 + 0)
.s51:
1f5a : c9 73 __ CMP #$73
1f5c : f0 03 __ BEQ $1f61 ; (fpscanf.s52 + 0)
1f5e : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s52:
1f61 : a0 00 __ LDY #$00
1f63 : b1 17 __ LDA (P10),y ; (params + 0)
1f65 : 85 5f __ STA T3 + 0 
1f67 : c8 __ __ INY
1f68 : b1 17 __ LDA (P10),y ; (params + 0)
1f6a : 85 60 __ STA T3 + 1 
1f6c : a5 5c __ LDA T2 + 1 
1f6e : 30 56 __ BMI $1fc6 ; (fpscanf.s53 + 0)
.s63:
1f70 : 05 5b __ ORA T2 + 0 
1f72 : f0 52 __ BEQ $1fc6 ; (fpscanf.s53 + 0)
.l55:
1f74 : a5 63 __ LDA T5 + 0 
1f76 : f0 4e __ BEQ $1fc6 ; (fpscanf.s53 + 0)
.s56:
1f78 : c9 20 __ CMP #$20
1f7a : f0 4a __ BEQ $1fc6 ; (fpscanf.s53 + 0)
.s57:
1f7c : c9 09 __ CMP #$09
1f7e : f0 46 __ BEQ $1fc6 ; (fpscanf.s53 + 0)
.s58:
1f80 : c9 0a __ CMP #$0a
1f82 : f0 42 __ BEQ $1fc6 ; (fpscanf.s53 + 0)
.s59:
1f84 : c9 0d __ CMP #$0d
1f86 : f0 3e __ BEQ $1fc6 ; (fpscanf.s53 + 0)
.s60:
1f88 : a5 15 __ LDA P8 ; (fparam + 0)
1f8a : a0 02 __ LDY #$02
1f8c : 91 23 __ STA (SP + 0),y 
1f8e : a5 16 __ LDA P9 ; (fparam + 1)
1f90 : c8 __ __ INY
1f91 : 91 23 __ STA (SP + 0),y 
1f93 : a5 6a __ LDA T10 + 0 
1f95 : d0 0c __ BNE $1fa3 ; (fpscanf.s62 + 0)
.s61:
1f97 : a5 63 __ LDA T5 + 0 
1f99 : a0 00 __ LDY #$00
1f9b : 91 5f __ STA (T3 + 0),y 
1f9d : e6 5f __ INC T3 + 0 
1f9f : d0 02 __ BNE $1fa3 ; (fpscanf.s62 + 0)
.s203:
1fa1 : e6 60 __ INC T3 + 1 
.s62:
1fa3 : a5 13 __ LDA P6 ; (ffunc + 0)
1fa5 : 85 1b __ STA ACCU + 0 
1fa7 : a5 14 __ LDA P7 ; (ffunc + 1)
1fa9 : 85 1c __ STA ACCU + 1 
1fab : 20 fb 28 JSR $28fb ; (bcexec + 0)
1fae : a5 1b __ LDA ACCU + 0 
1fb0 : 85 63 __ STA T5 + 0 
1fb2 : e6 64 __ INC T6 + 0 
1fb4 : d0 02 __ BNE $1fb8 ; (fpscanf.s202 + 0)
.s201:
1fb6 : e6 65 __ INC T6 + 1 
.s202:
1fb8 : a5 5b __ LDA T2 + 0 
1fba : d0 02 __ BNE $1fbe ; (fpscanf.s168 + 0)
.s167:
1fbc : c6 5c __ DEC T2 + 1 
.s168:
1fbe : c6 5b __ DEC T2 + 0 
1fc0 : d0 b2 __ BNE $1f74 ; (fpscanf.l55 + 0)
.s169:
1fc2 : a5 5c __ LDA T2 + 1 
1fc4 : d0 ae __ BNE $1f74 ; (fpscanf.l55 + 0)
.s53:
1fc6 : a5 6a __ LDA T10 + 0 
1fc8 : d0 94 __ BNE $1f5e ; (fpscanf.s51 + 4)
.s54:
1fca : a8 __ __ TAY
1fcb : 91 5f __ STA (T3 + 0),y 
.s35:
1fcd : 18 __ __ CLC
1fce : a5 17 __ LDA P10 ; (params + 0)
1fd0 : 69 02 __ ADC #$02
1fd2 : 85 17 __ STA P10 ; (params + 0)
1fd4 : 90 02 __ BCC $1fd8 ; (fpscanf.s179 + 0)
.s178:
1fd6 : e6 18 __ INC P11 ; (params + 1)
.s179:
1fd8 : e6 61 __ INC T4 + 0 
1fda : d0 82 __ BNE $1f5e ; (fpscanf.s51 + 4)
.s180:
1fdc : e6 62 __ INC T4 + 1 
1fde : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s23:
1fe1 : c9 78 __ CMP #$78
1fe3 : d0 f9 __ BNE $1fde ; (fpscanf.s180 + 2)
.s24:
1fe5 : a9 10 __ LDA #$10
1fe7 : 85 5f __ STA T3 + 0 
.s25:
1fe9 : c6 68 __ DEC T8 + 0 
.s26:
1feb : a5 63 __ LDA T5 + 0 
1fed : c9 2d __ CMP #$2d
1fef : d0 1c __ BNE $200d ; (fpscanf.s27 + 0)
.s50:
1ff1 : a5 15 __ LDA P8 ; (fparam + 0)
1ff3 : a0 02 __ LDY #$02
1ff5 : 91 23 __ STA (SP + 0),y 
1ff7 : a5 16 __ LDA P9 ; (fparam + 1)
1ff9 : c8 __ __ INY
1ffa : 91 23 __ STA (SP + 0),y 
1ffc : a5 13 __ LDA P6 ; (ffunc + 0)
1ffe : 85 1b __ STA ACCU + 0 
2000 : a5 14 __ LDA P7 ; (ffunc + 1)
2002 : 85 1c __ STA ACCU + 1 
2004 : 20 fb 28 JSR $28fb ; (bcexec + 0)
2007 : a9 ff __ LDA #$ff
2009 : 85 66 __ STA T7 + 0 
200b : d0 1e __ BNE $202b ; (fpscanf.s159 + 0)
.s27:
200d : a2 00 __ LDX #$00
200f : 86 66 __ STX T7 + 0 
2011 : c9 2b __ CMP #$2b
2013 : d0 1e __ BNE $2033 ; (fpscanf.s28 + 0)
.s49:
2015 : a5 15 __ LDA P8 ; (fparam + 0)
2017 : a0 02 __ LDY #$02
2019 : 91 23 __ STA (SP + 0),y 
201b : a5 16 __ LDA P9 ; (fparam + 1)
201d : c8 __ __ INY
201e : 91 23 __ STA (SP + 0),y 
2020 : a5 13 __ LDA P6 ; (ffunc + 0)
2022 : 85 1b __ STA ACCU + 0 
2024 : a5 14 __ LDA P7 ; (ffunc + 1)
2026 : 85 1c __ STA ACCU + 1 
2028 : 20 fb 28 JSR $28fb ; (bcexec + 0)
.s159:
202b : e6 64 __ INC T6 + 0 
202d : d0 02 __ BNE $2031 ; (fpscanf.s186 + 0)
.s185:
202f : e6 65 __ INC T6 + 1 
.s186:
2031 : a5 1b __ LDA ACCU + 0 
.s28:
2033 : 85 0d __ STA P0 
2035 : 20 e6 27 JSR $27e6 ; (hexch.s4 + 0)
2038 : a5 1c __ LDA ACCU + 1 
203a : 10 03 __ BPL $203f ; (fpscanf.s29 + 0)
203c : 4c 69 1e JMP $1e69 ; (fpscanf.s5 + 0)
.s29:
203f : 85 58 __ STA T1 + 1 
2041 : a5 1b __ LDA ACCU + 0 
2043 : 85 57 __ STA T1 + 0 
2045 : a5 15 __ LDA P8 ; (fparam + 0)
2047 : a0 02 __ LDY #$02
2049 : 91 23 __ STA (SP + 0),y 
204b : a5 16 __ LDA P9 ; (fparam + 1)
204d : c8 __ __ INY
204e : 91 23 __ STA (SP + 0),y 
2050 : a5 13 __ LDA P6 ; (ffunc + 0)
2052 : 85 1b __ STA ACCU + 0 
2054 : a5 14 __ LDA P7 ; (ffunc + 1)
2056 : 85 1c __ STA ACCU + 1 
2058 : 20 fb 28 JSR $28fb ; (bcexec + 0)
205b : a5 64 __ LDA T6 + 0 
205d : 85 5b __ STA T2 + 0 
205f : 18 __ __ CLC
2060 : 69 01 __ ADC #$01
2062 : 85 64 __ STA T6 + 0 
2064 : a5 65 __ LDA T6 + 1 
2066 : 85 5c __ STA T2 + 1 
2068 : 69 00 __ ADC #$00
206a : 85 65 __ STA T6 + 1 
206c : a5 57 __ LDA T1 + 0 
206e : a6 1b __ LDX ACCU + 0 
2070 : 86 63 __ STX T5 + 0 
2072 : 05 58 __ ORA T1 + 1 
2074 : d0 0b __ BNE $2081 ; (fpscanf.s30 + 0)
.s47:
2076 : 85 57 __ STA T1 + 0 
2078 : 85 58 __ STA T1 + 1 
207a : e0 78 __ CPX #$78
207c : d0 03 __ BNE $2081 ; (fpscanf.s30 + 0)
207e : 4c b9 21 JMP $21b9 ; (fpscanf.s48 + 0)
.s30:
2081 : a5 69 __ LDA T9 + 0 
2083 : f0 07 __ BEQ $208c ; (fpscanf.l31 + 0)
.s39:
2085 : a9 00 __ LDA #$00
2087 : 85 59 __ STA T1 + 2 
2089 : 4c 0e 21 JMP $210e ; (fpscanf.l40 + 0)
.l31:
208c : a5 63 __ LDA T5 + 0 
208e : 85 0d __ STA P0 
2090 : 20 e6 27 JSR $27e6 ; (hexch.s4 + 0)
2093 : a5 1c __ LDA ACCU + 1 
2095 : 10 34 __ BPL $20cb ; (fpscanf.s38 + 0)
.s32:
2097 : a5 6a __ LDA T10 + 0 
2099 : f0 03 __ BEQ $209e ; (fpscanf.s33 + 0)
209b : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s33:
209e : 24 66 __ BIT T7 + 0 
20a0 : 10 11 __ BPL $20b3 ; (fpscanf.s34 + 0)
.s36:
20a2 : a5 68 __ LDA T8 + 0 
20a4 : f0 0d __ BEQ $20b3 ; (fpscanf.s34 + 0)
.s37:
20a6 : 38 __ __ SEC
20a7 : a9 00 __ LDA #$00
20a9 : e5 57 __ SBC T1 + 0 
20ab : 85 57 __ STA T1 + 0 
20ad : a9 00 __ LDA #$00
20af : e5 58 __ SBC T1 + 1 
20b1 : 85 58 __ STA T1 + 1 
.s34:
20b3 : a0 00 __ LDY #$00
20b5 : b1 17 __ LDA (P10),y ; (params + 0)
20b7 : 85 53 __ STA T0 + 0 
20b9 : c8 __ __ INY
20ba : b1 17 __ LDA (P10),y ; (params + 0)
20bc : 85 54 __ STA T0 + 1 
20be : a5 57 __ LDA T1 + 0 
20c0 : 88 __ __ DEY
20c1 : 91 53 __ STA (T0 + 0),y 
20c3 : a5 58 __ LDA T1 + 1 
20c5 : c8 __ __ INY
.s156:
20c6 : 91 53 __ STA (T0 + 0),y 
20c8 : 4c cd 1f JMP $1fcd ; (fpscanf.s35 + 0)
.s38:
20cb : 85 5c __ STA T2 + 1 
20cd : a5 1b __ LDA ACCU + 0 
20cf : 85 5b __ STA T2 + 0 
20d1 : a5 15 __ LDA P8 ; (fparam + 0)
20d3 : a0 02 __ LDY #$02
20d5 : 91 23 __ STA (SP + 0),y 
20d7 : a5 16 __ LDA P9 ; (fparam + 1)
20d9 : c8 __ __ INY
20da : 91 23 __ STA (SP + 0),y 
20dc : a5 13 __ LDA P6 ; (ffunc + 0)
20de : 85 1b __ STA ACCU + 0 
20e0 : a5 14 __ LDA P7 ; (ffunc + 1)
20e2 : 85 1c __ STA ACCU + 1 
20e4 : 20 fb 28 JSR $28fb ; (bcexec + 0)
20e7 : a5 1b __ LDA ACCU + 0 
20e9 : 85 63 __ STA T5 + 0 
20eb : e6 64 __ INC T6 + 0 
20ed : d0 02 __ BNE $20f1 ; (fpscanf.s190 + 0)
.s189:
20ef : e6 65 __ INC T6 + 1 
.s190:
20f1 : a5 57 __ LDA T1 + 0 
20f3 : 85 1b __ STA ACCU + 0 
20f5 : a5 58 __ LDA T1 + 1 
20f7 : 85 1c __ STA ACCU + 1 
20f9 : a5 5f __ LDA T3 + 0 
20fb : 20 44 3a JSR $3a44 ; (mul16by8 + 0)
20fe : 18 __ __ CLC
20ff : a5 1b __ LDA ACCU + 0 
2101 : 65 5b __ ADC T2 + 0 
2103 : 85 57 __ STA T1 + 0 
2105 : a5 1c __ LDA ACCU + 1 
2107 : 65 5c __ ADC T2 + 1 
2109 : 85 58 __ STA T1 + 1 
210b : 4c 8c 20 JMP $208c ; (fpscanf.l31 + 0)
.l40:
210e : 85 5a __ STA T1 + 3 
2110 : a5 63 __ LDA T5 + 0 
2112 : 85 0d __ STA P0 
2114 : 20 e6 27 JSR $27e6 ; (hexch.s4 + 0)
2117 : a5 1c __ LDA ACCU + 1 
2119 : 10 49 __ BPL $2164 ; (fpscanf.s46 + 0)
.s41:
211b : a5 6a __ LDA T10 + 0 
211d : f0 03 __ BEQ $2122 ; (fpscanf.s42 + 0)
211f : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s42:
2122 : 24 66 __ BIT T7 + 0 
2124 : 10 1d __ BPL $2143 ; (fpscanf.s43 + 0)
.s44:
2126 : a5 68 __ LDA T8 + 0 
2128 : f0 19 __ BEQ $2143 ; (fpscanf.s43 + 0)
.s45:
212a : 38 __ __ SEC
212b : a9 00 __ LDA #$00
212d : e5 57 __ SBC T1 + 0 
212f : 85 57 __ STA T1 + 0 
2131 : a9 00 __ LDA #$00
2133 : e5 58 __ SBC T1 + 1 
2135 : 85 58 __ STA T1 + 1 
2137 : a9 00 __ LDA #$00
2139 : e5 59 __ SBC T1 + 2 
213b : 85 59 __ STA T1 + 2 
213d : a9 00 __ LDA #$00
213f : e5 5a __ SBC T1 + 3 
2141 : 85 5a __ STA T1 + 3 
.s43:
2143 : a0 00 __ LDY #$00
2145 : b1 17 __ LDA (P10),y ; (params + 0)
2147 : 85 53 __ STA T0 + 0 
2149 : c8 __ __ INY
214a : b1 17 __ LDA (P10),y ; (params + 0)
214c : 85 54 __ STA T0 + 1 
.s157:
214e : a5 57 __ LDA T1 + 0 
2150 : a0 00 __ LDY #$00
2152 : 91 53 __ STA (T0 + 0),y 
2154 : a5 58 __ LDA T1 + 1 
2156 : c8 __ __ INY
2157 : 91 53 __ STA (T0 + 0),y 
2159 : a5 59 __ LDA T1 + 2 
215b : c8 __ __ INY
215c : 91 53 __ STA (T0 + 0),y 
215e : a5 5a __ LDA T1 + 3 
2160 : c8 __ __ INY
2161 : 4c c6 20 JMP $20c6 ; (fpscanf.s156 + 0)
.s46:
2164 : 85 5c __ STA T2 + 1 
2166 : a5 1b __ LDA ACCU + 0 
2168 : 85 5b __ STA T2 + 0 
216a : a5 15 __ LDA P8 ; (fparam + 0)
216c : a0 02 __ LDY #$02
216e : 91 23 __ STA (SP + 0),y 
2170 : a5 16 __ LDA P9 ; (fparam + 1)
2172 : c8 __ __ INY
2173 : 91 23 __ STA (SP + 0),y 
2175 : a5 13 __ LDA P6 ; (ffunc + 0)
2177 : 85 1b __ STA ACCU + 0 
2179 : a5 14 __ LDA P7 ; (ffunc + 1)
217b : 85 1c __ STA ACCU + 1 
217d : 20 fb 28 JSR $28fb ; (bcexec + 0)
2180 : a5 1b __ LDA ACCU + 0 
2182 : 85 63 __ STA T5 + 0 
2184 : e6 64 __ INC T6 + 0 
2186 : d0 02 __ BNE $218a ; (fpscanf.s188 + 0)
.s187:
2188 : e6 65 __ INC T6 + 1 
.s188:
218a : a5 57 __ LDA T1 + 0 
218c : 85 1b __ STA ACCU + 0 
218e : a5 58 __ LDA T1 + 1 
2190 : 85 1c __ STA ACCU + 1 
2192 : a5 59 __ LDA T1 + 2 
2194 : 85 1d __ STA ACCU + 2 
2196 : a5 5a __ LDA T1 + 3 
2198 : 85 1e __ STA ACCU + 3 
219a : a5 5f __ LDA T3 + 0 
219c : 20 7c 3a JSR $3a7c ; (mul32by8 + 0)
219f : 18 __ __ CLC
21a0 : a5 5b __ LDA T2 + 0 
21a2 : 65 07 __ ADC WORK + 4 
21a4 : 85 57 __ STA T1 + 0 
21a6 : a5 5c __ LDA T2 + 1 
21a8 : 65 08 __ ADC WORK + 5 
21aa : 85 58 __ STA T1 + 1 
21ac : a5 09 __ LDA WORK + 6 
21ae : 69 00 __ ADC #$00
21b0 : 85 59 __ STA T1 + 2 
21b2 : a5 0a __ LDA WORK + 7 
21b4 : 69 00 __ ADC #$00
21b6 : 4c 0e 21 JMP $210e ; (fpscanf.l40 + 0)
.s48:
21b9 : a5 15 __ LDA P8 ; (fparam + 0)
21bb : a0 02 __ LDY #$02
21bd : 91 23 __ STA (SP + 0),y 
21bf : a5 16 __ LDA P9 ; (fparam + 1)
21c1 : c8 __ __ INY
21c2 : 91 23 __ STA (SP + 0),y 
21c4 : a5 13 __ LDA P6 ; (ffunc + 0)
21c6 : 85 1b __ STA ACCU + 0 
21c8 : a5 14 __ LDA P7 ; (ffunc + 1)
21ca : 85 1c __ STA ACCU + 1 
21cc : 20 fb 28 JSR $28fb ; (bcexec + 0)
21cf : a5 1b __ LDA ACCU + 0 
21d1 : 85 63 __ STA T5 + 0 
21d3 : 18 __ __ CLC
21d4 : a5 5b __ LDA T2 + 0 
21d6 : 69 02 __ ADC #$02
21d8 : 85 64 __ STA T6 + 0 
21da : a5 5c __ LDA T2 + 1 
21dc : 69 00 __ ADC #$00
21de : 85 65 __ STA T6 + 1 
21e0 : a9 10 __ LDA #$10
21e2 : 85 5f __ STA T3 + 0 
21e4 : a5 69 __ LDA T9 + 0 
21e6 : d0 03 __ BNE $21eb ; (fpscanf.s48 + 50)
21e8 : 4c 8c 20 JMP $208c ; (fpscanf.l31 + 0)
21eb : 4c 85 20 JMP $2085 ; (fpscanf.s39 + 0)
.s64:
21ee : c9 65 __ CMP #$65
21f0 : b0 03 __ BCS $21f5 ; (fpscanf.s65 + 0)
21f2 : 4c 19 26 JMP $2619 ; (fpscanf.s108 + 0)
.s65:
21f5 : c9 68 __ CMP #$68
21f7 : 90 0a __ BCC $2203 ; (fpscanf.s67 + 0)
.s66:
21f9 : c9 69 __ CMP #$69
21fb : d0 03 __ BNE $2200 ; (fpscanf.s66 + 7)
21fd : 4c eb 1f JMP $1feb ; (fpscanf.s26 + 0)
2200 : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s67:
2203 : a5 63 __ LDA T5 + 0 
2205 : c9 2d __ CMP #$2d
2207 : d0 11 __ BNE $221a ; (fpscanf.s68 + 0)
.s107:
2209 : a5 15 __ LDA P8 ; (fparam + 0)
220b : a0 02 __ LDY #$02
220d : 91 23 __ STA (SP + 0),y 
220f : a5 16 __ LDA P9 ; (fparam + 1)
2211 : c8 __ __ INY
2212 : 91 23 __ STA (SP + 0),y 
2214 : a9 ff __ LDA #$ff
2216 : 85 69 __ STA T9 + 0 
2218 : d0 13 __ BNE $222d ; (fpscanf.s106 + 0)
.s68:
221a : a2 00 __ LDX #$00
221c : 86 69 __ STX T9 + 0 
221e : c9 2b __ CMP #$2b
2220 : d0 20 __ BNE $2242 ; (fpscanf.s69 + 0)
.s105:
2222 : a5 15 __ LDA P8 ; (fparam + 0)
2224 : a0 02 __ LDY #$02
2226 : 91 23 __ STA (SP + 0),y 
2228 : a5 16 __ LDA P9 ; (fparam + 1)
222a : c8 __ __ INY
222b : 91 23 __ STA (SP + 0),y 
.s106:
222d : a5 13 __ LDA P6 ; (ffunc + 0)
222f : 85 1b __ STA ACCU + 0 
2231 : a5 14 __ LDA P7 ; (ffunc + 1)
2233 : 85 1c __ STA ACCU + 1 
2235 : 20 fb 28 JSR $28fb ; (bcexec + 0)
2238 : e6 64 __ INC T6 + 0 
223a : d0 02 __ BNE $223e ; (fpscanf.s192 + 0)
.s191:
223c : e6 65 __ INC T6 + 1 
.s192:
223e : a5 1b __ LDA ACCU + 0 
2240 : 85 63 __ STA T5 + 0 
.s69:
2242 : c9 30 __ CMP #$30
2244 : a9 00 __ LDA #$00
2246 : 6a __ __ ROR
2247 : 85 53 __ STA T0 + 0 
2249 : d0 04 __ BNE $224f ; (fpscanf.s104 + 0)
.s207:
224b : a5 63 __ LDA T5 + 0 
224d : 90 06 __ BCC $2255 ; (fpscanf.s70 + 0)
.s104:
224f : a5 63 __ LDA T5 + 0 
2251 : c9 3a __ CMP #$3a
2253 : 90 07 __ BCC $225c ; (fpscanf.s71 + 0)
.s70:
2255 : c9 2e __ CMP #$2e
2257 : f0 03 __ BEQ $225c ; (fpscanf.s71 + 0)
2259 : 4c 69 1e JMP $1e69 ; (fpscanf.s5 + 0)
.s71:
225c : a9 00 __ LDA #$00
225e : 85 57 __ STA T1 + 0 
2260 : 85 58 __ STA T1 + 1 
2262 : 85 59 __ STA T1 + 2 
2264 : 85 5a __ STA T1 + 3 
2266 : 24 53 __ BIT T0 + 0 
2268 : 10 17 __ BPL $2281 ; (fpscanf.s72 + 0)
.s101:
226a : a5 63 __ LDA T5 + 0 
226c : 85 5b __ STA T2 + 0 
226e : a5 15 __ LDA P8 ; (fparam + 0)
2270 : 85 5f __ STA T3 + 0 
2272 : a5 16 __ LDA P9 ; (fparam + 1)
2274 : 85 60 __ STA T3 + 1 
2276 : a5 13 __ LDA P6 ; (ffunc + 0)
2278 : 85 66 __ STA T7 + 0 
227a : a5 14 __ LDA P7 ; (ffunc + 1)
227c : 85 67 __ STA T7 + 1 
227e : 4c 9b 25 JMP $259b ; (fpscanf.l102 + 0)
.s72:
2281 : a5 63 __ LDA T5 + 0 
2283 : c9 2e __ CMP #$2e
2285 : f0 03 __ BEQ $228a ; (fpscanf.s95 + 0)
2287 : 4c 94 23 JMP $2394 ; (fpscanf.s73 + 0)
.s95:
228a : a5 15 __ LDA P8 ; (fparam + 0)
228c : a0 02 __ LDY #$02
228e : 91 23 __ STA (SP + 0),y 
2290 : a5 16 __ LDA P9 ; (fparam + 1)
2292 : c8 __ __ INY
2293 : 91 23 __ STA (SP + 0),y 
2295 : a9 00 __ LDA #$00
2297 : 85 5b __ STA T2 + 0 
2299 : 85 5c __ STA T2 + 1 
229b : a5 13 __ LDA P6 ; (ffunc + 0)
229d : 85 1b __ STA ACCU + 0 
229f : a9 80 __ LDA #$80
22a1 : 85 5d __ STA T2 + 2 
22a3 : a9 3f __ LDA #$3f
22a5 : 85 5e __ STA T2 + 3 
22a7 : a5 14 __ LDA P7 ; (ffunc + 1)
22a9 : 85 1c __ STA ACCU + 1 
22ab : 20 fb 28 JSR $28fb ; (bcexec + 0)
22ae : a5 1b __ LDA ACCU + 0 
22b0 : 85 63 __ STA T5 + 0 
22b2 : c9 30 __ CMP #$30
22b4 : b0 03 __ BCS $22b9 ; (fpscanf.s97 + 0)
22b6 : 4c 6c 23 JMP $236c ; (fpscanf.s96 + 0)
.s97:
22b9 : c9 3a __ CMP #$3a
22bb : b0 f9 __ BCS $22b6 ; (fpscanf.s95 + 44)
.s98:
22bd : 85 5f __ STA T3 + 0 
22bf : a5 15 __ LDA P8 ; (fparam + 0)
22c1 : 85 66 __ STA T7 + 0 
22c3 : a5 16 __ LDA P9 ; (fparam + 1)
22c5 : 85 67 __ STA T7 + 1 
22c7 : a5 13 __ LDA P6 ; (ffunc + 0)
22c9 : 85 68 __ STA T8 + 0 
.l99:
22cb : a5 66 __ LDA T7 + 0 
22cd : a0 02 __ LDY #$02
22cf : 91 23 __ STA (SP + 0),y 
22d1 : a5 67 __ LDA T7 + 1 
22d3 : c8 __ __ INY
22d4 : 91 23 __ STA (SP + 0),y 
22d6 : e6 64 __ INC T6 + 0 
22d8 : d0 02 __ BNE $22dc ; (fpscanf.s200 + 0)
.s199:
22da : e6 65 __ INC T6 + 1 
.s200:
22dc : a9 00 __ LDA #$00
22de : 85 1b __ STA ACCU + 0 
22e0 : 85 1c __ STA ACCU + 1 
22e2 : a9 20 __ LDA #$20
22e4 : 85 1d __ STA ACCU + 2 
22e6 : a9 41 __ LDA #$41
22e8 : 85 1e __ STA ACCU + 3 
22ea : a2 5b __ LDX #$5b
22ec : 20 b6 3a JSR $3ab6 ; (freg + 4)
22ef : 20 e4 3b JSR $3be4 ; (crt_fmul + 0)
22f2 : a5 1b __ LDA ACCU + 0 
22f4 : 85 5b __ STA T2 + 0 
22f6 : a5 1c __ LDA ACCU + 1 
22f8 : 85 5c __ STA T2 + 1 
22fa : a5 1d __ LDA ACCU + 2 
22fc : 85 5d __ STA T2 + 2 
22fe : a5 1e __ LDA ACCU + 3 
2300 : 85 5e __ STA T2 + 3 
2302 : a9 00 __ LDA #$00
2304 : 85 1b __ STA ACCU + 0 
2306 : 85 1c __ STA ACCU + 1 
2308 : a9 20 __ LDA #$20
230a : 85 1d __ STA ACCU + 2 
230c : a9 41 __ LDA #$41
230e : 85 1e __ STA ACCU + 3 
2310 : a2 57 __ LDX #$57
2312 : 20 b6 3a JSR $3ab6 ; (freg + 4)
2315 : 20 e4 3b JSR $3be4 ; (crt_fmul + 0)
2318 : a5 1b __ LDA ACCU + 0 
231a : 85 53 __ STA T0 + 0 
231c : a5 1c __ LDA ACCU + 1 
231e : 85 54 __ STA T0 + 1 
2320 : a5 1d __ LDA ACCU + 2 
2322 : 85 55 __ STA T0 + 2 
2324 : a5 1e __ LDA ACCU + 3 
2326 : 85 56 __ STA T0 + 3 
2328 : 38 __ __ SEC
2329 : a5 5f __ LDA T3 + 0 
232b : e9 30 __ SBC #$30
232d : 85 1b __ STA ACCU + 0 
232f : a9 00 __ LDA #$00
2331 : 85 1c __ STA ACCU + 1 
2333 : 20 c6 3e JSR $3ec6 ; (sint16_to_float + 0)
2336 : a2 53 __ LDX #$53
2338 : 20 b6 3a JSR $3ab6 ; (freg + 4)
233b : 20 fd 3a JSR $3afd ; (faddsub + 6)
233e : a5 1b __ LDA ACCU + 0 
2340 : 85 57 __ STA T1 + 0 
2342 : a5 1c __ LDA ACCU + 1 
2344 : 85 58 __ STA T1 + 1 
2346 : a5 1d __ LDA ACCU + 2 
2348 : 85 59 __ STA T1 + 2 
234a : a5 1e __ LDA ACCU + 3 
234c : 85 5a __ STA T1 + 3 
234e : a5 68 __ LDA T8 + 0 
2350 : 85 1b __ STA ACCU + 0 
2352 : a5 14 __ LDA P7 ; (ffunc + 1)
2354 : 85 1c __ STA ACCU + 1 
2356 : 20 fb 28 JSR $28fb ; (bcexec + 0)
2359 : a5 1b __ LDA ACCU + 0 
235b : 85 63 __ STA T5 + 0 
235d : c9 30 __ CMP #$30
235f : 90 0b __ BCC $236c ; (fpscanf.s96 + 0)
.s100:
2361 : 85 5f __ STA T3 + 0 
2363 : a9 39 __ LDA #$39
2365 : c5 1b __ CMP ACCU + 0 
2367 : 90 03 __ BCC $236c ; (fpscanf.s96 + 0)
2369 : 4c cb 22 JMP $22cb ; (fpscanf.l99 + 0)
.s96:
236c : a5 57 __ LDA T1 + 0 
236e : 85 1b __ STA ACCU + 0 
2370 : a5 58 __ LDA T1 + 1 
2372 : 85 1c __ STA ACCU + 1 
2374 : a5 59 __ LDA T1 + 2 
2376 : 85 1d __ STA ACCU + 2 
2378 : a5 5a __ LDA T1 + 3 
237a : 85 1e __ STA ACCU + 3 
237c : a2 5b __ LDX #$5b
237e : 20 b6 3a JSR $3ab6 ; (freg + 4)
2381 : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
2384 : a5 1b __ LDA ACCU + 0 
2386 : 85 57 __ STA T1 + 0 
2388 : a5 1c __ LDA ACCU + 1 
238a : 85 58 __ STA T1 + 1 
238c : a5 1d __ LDA ACCU + 2 
238e : 85 59 __ STA T1 + 2 
2390 : a5 1e __ LDA ACCU + 3 
2392 : 85 5a __ STA T1 + 3 
.s73:
2394 : a9 00 __ LDA #$00
2396 : 85 5b __ STA T2 + 0 
2398 : 85 6b __ STA T11 + 0 
239a : a5 63 __ LDA T5 + 0 
239c : c9 65 __ CMP #$65
239e : f0 07 __ BEQ $23a7 ; (fpscanf.s86 + 0)
.s74:
23a0 : c9 45 __ CMP #$45
23a2 : f0 03 __ BEQ $23a7 ; (fpscanf.s86 + 0)
23a4 : 4c 56 24 JMP $2456 ; (fpscanf.s75 + 0)
.s86:
23a7 : a5 15 __ LDA P8 ; (fparam + 0)
23a9 : a0 02 __ LDY #$02
23ab : 91 23 __ STA (SP + 0),y 
23ad : a5 16 __ LDA P9 ; (fparam + 1)
23af : c8 __ __ INY
23b0 : 91 23 __ STA (SP + 0),y 
23b2 : a5 13 __ LDA P6 ; (ffunc + 0)
23b4 : 85 1b __ STA ACCU + 0 
23b6 : a5 14 __ LDA P7 ; (ffunc + 1)
23b8 : 85 1c __ STA ACCU + 1 
23ba : 20 fb 28 JSR $28fb ; (bcexec + 0)
23bd : a5 1b __ LDA ACCU + 0 
23bf : c9 2d __ CMP #$2d
23c1 : d0 03 __ BNE $23c6 ; (fpscanf.s87 + 0)
23c3 : 4c 75 25 JMP $2575 ; (fpscanf.s94 + 0)
.s87:
23c6 : 85 63 __ STA T5 + 0 
23c8 : a5 64 __ LDA T6 + 0 
23ca : 85 5f __ STA T3 + 0 
23cc : 18 __ __ CLC
23cd : 69 01 __ ADC #$01
23cf : 85 64 __ STA T6 + 0 
23d1 : a5 65 __ LDA T6 + 1 
23d3 : 85 60 __ STA T3 + 1 
23d5 : 69 00 __ ADC #$00
23d7 : 85 65 __ STA T6 + 1 
23d9 : a5 1b __ LDA ACCU + 0 
23db : c9 2b __ CMP #$2b
23dd : d0 27 __ BNE $2406 ; (fpscanf.s88 + 0)
.s93:
23df : a5 15 __ LDA P8 ; (fparam + 0)
23e1 : a0 02 __ LDY #$02
23e3 : 91 23 __ STA (SP + 0),y 
23e5 : a5 16 __ LDA P9 ; (fparam + 1)
23e7 : c8 __ __ INY
23e8 : 91 23 __ STA (SP + 0),y 
23ea : a5 13 __ LDA P6 ; (ffunc + 0)
23ec : 85 1b __ STA ACCU + 0 
23ee : a5 14 __ LDA P7 ; (ffunc + 1)
23f0 : 85 1c __ STA ACCU + 1 
23f2 : 20 fb 28 JSR $28fb ; (bcexec + 0)
23f5 : 18 __ __ CLC
23f6 : a5 5f __ LDA T3 + 0 
23f8 : 69 02 __ ADC #$02
23fa : 85 64 __ STA T6 + 0 
23fc : a5 60 __ LDA T3 + 1 
23fe : 69 00 __ ADC #$00
2400 : 85 65 __ STA T6 + 1 
.s160:
2402 : a5 1b __ LDA ACCU + 0 
2404 : 85 63 __ STA T5 + 0 
.s88:
2406 : c9 30 __ CMP #$30
2408 : 90 4c __ BCC $2456 ; (fpscanf.s75 + 0)
.s89:
240a : c9 3a __ CMP #$3a
240c : b0 48 __ BCS $2456 ; (fpscanf.s75 + 0)
.s90:
240e : a5 15 __ LDA P8 ; (fparam + 0)
2410 : 85 5f __ STA T3 + 0 
2412 : a5 16 __ LDA P9 ; (fparam + 1)
2414 : 85 60 __ STA T3 + 1 
2416 : a5 13 __ LDA P6 ; (ffunc + 0)
2418 : 85 66 __ STA T7 + 0 
241a : a5 14 __ LDA P7 ; (ffunc + 1)
241c : 85 67 __ STA T7 + 1 
.l91:
241e : a5 5f __ LDA T3 + 0 
2420 : a0 02 __ LDY #$02
2422 : 91 23 __ STA (SP + 0),y 
2424 : a5 60 __ LDA T3 + 1 
2426 : c8 __ __ INY
2427 : 91 23 __ STA (SP + 0),y 
2429 : e6 64 __ INC T6 + 0 
242b : d0 02 __ BNE $242f ; (fpscanf.s198 + 0)
.s197:
242d : e6 65 __ INC T6 + 1 
.s198:
242f : a5 5b __ LDA T2 + 0 
2431 : 0a __ __ ASL
2432 : 0a __ __ ASL
2433 : 18 __ __ CLC
2434 : 65 5b __ ADC T2 + 0 
2436 : 0a __ __ ASL
2437 : 18 __ __ CLC
2438 : 65 1b __ ADC ACCU + 0 
243a : 38 __ __ SEC
243b : e9 30 __ SBC #$30
243d : 85 5b __ STA T2 + 0 
243f : a5 66 __ LDA T7 + 0 
2441 : 85 1b __ STA ACCU + 0 
2443 : a5 67 __ LDA T7 + 1 
2445 : 85 1c __ STA ACCU + 1 
2447 : 20 fb 28 JSR $28fb ; (bcexec + 0)
244a : a5 1b __ LDA ACCU + 0 
244c : 85 63 __ STA T5 + 0 
244e : c9 30 __ CMP #$30
2450 : 90 04 __ BCC $2456 ; (fpscanf.s75 + 0)
.s92:
2452 : c9 3a __ CMP #$3a
2454 : 90 c8 __ BCC $241e ; (fpscanf.l91 + 0)
.s75:
2456 : a5 6a __ LDA T10 + 0 
2458 : f0 03 __ BEQ $245d ; (fpscanf.s76 + 0)
245a : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s76:
245d : a5 5b __ LDA T2 + 0 
245f : d0 03 __ BNE $2464 ; (fpscanf.s79 + 0)
2461 : 4c e2 24 JMP $24e2 ; (fpscanf.s77 + 0)
.s79:
2464 : a5 6b __ LDA T11 + 0 
2466 : f0 03 __ BEQ $246b ; (fpscanf.s80 + 0)
2468 : 4c fd 24 JMP $24fd ; (fpscanf.s83 + 0)
.s80:
246b : a5 5b __ LDA T2 + 0 
246d : c9 07 __ CMP #$07
246f : 90 33 __ BCC $24a4 ; (fpscanf.s81 + 0)
.l82:
2471 : a9 00 __ LDA #$00
2473 : 85 1b __ STA ACCU + 0 
2475 : a9 49 __ LDA #$49
2477 : 85 1e __ STA ACCU + 3 
2479 : a9 24 __ LDA #$24
247b : 85 1c __ STA ACCU + 1 
247d : a9 74 __ LDA #$74
247f : 85 1d __ STA ACCU + 2 
2481 : a2 57 __ LDX #$57
2483 : 20 b6 3a JSR $3ab6 ; (freg + 4)
2486 : 20 e4 3b JSR $3be4 ; (crt_fmul + 0)
2489 : a5 1b __ LDA ACCU + 0 
248b : 85 57 __ STA T1 + 0 
248d : a5 1c __ LDA ACCU + 1 
248f : 85 58 __ STA T1 + 1 
2491 : a5 1d __ LDA ACCU + 2 
2493 : 85 59 __ STA T1 + 2 
2495 : a5 1e __ LDA ACCU + 3 
2497 : 85 5a __ STA T1 + 3 
2499 : 38 __ __ SEC
249a : a5 5b __ LDA T2 + 0 
249c : e9 06 __ SBC #$06
249e : 85 5b __ STA T2 + 0 
24a0 : c9 07 __ CMP #$07
24a2 : b0 cd __ BCS $2471 ; (fpscanf.l82 + 0)
.s81:
24a4 : 0a __ __ ASL
24a5 : 0a __ __ ASL
24a6 : aa __ __ TAX
24a7 : bd 43 40 LDA $4043,x ; (tpow10[0] + 1)
24aa : 85 54 __ STA T0 + 1 
24ac : a9 00 __ LDA #$00
24ae : 85 53 __ STA T0 + 0 
24b0 : bd 44 40 LDA $4044,x ; (tpow10[0] + 2)
24b3 : 85 55 __ STA T0 + 2 
24b5 : bd 45 40 LDA $4045,x ; (tpow10[0] + 3)
24b8 : 85 56 __ STA T0 + 3 
24ba : a5 57 __ LDA T1 + 0 
24bc : 85 1b __ STA ACCU + 0 
24be : a5 58 __ LDA T1 + 1 
24c0 : 85 1c __ STA ACCU + 1 
24c2 : a5 59 __ LDA T1 + 2 
24c4 : 85 1d __ STA ACCU + 2 
24c6 : a5 5a __ LDA T1 + 3 
24c8 : 85 1e __ STA ACCU + 3 
24ca : a2 53 __ LDX #$53
24cc : 20 b6 3a JSR $3ab6 ; (freg + 4)
24cf : 20 e4 3b JSR $3be4 ; (crt_fmul + 0)
.s158:
24d2 : a5 1b __ LDA ACCU + 0 
24d4 : 85 57 __ STA T1 + 0 
24d6 : a5 1c __ LDA ACCU + 1 
24d8 : 85 58 __ STA T1 + 1 
24da : a5 1d __ LDA ACCU + 2 
24dc : 85 59 __ STA T1 + 2 
24de : a5 1e __ LDA ACCU + 3 
24e0 : 85 5a __ STA T1 + 3 
.s77:
24e2 : a0 00 __ LDY #$00
24e4 : b1 17 __ LDA (P10),y ; (params + 0)
24e6 : 85 53 __ STA T0 + 0 
24e8 : c8 __ __ INY
24e9 : b1 17 __ LDA (P10),y ; (params + 0)
24eb : 85 54 __ STA T0 + 1 
24ed : 24 69 __ BIT T9 + 0 
24ef : 30 03 __ BMI $24f4 ; (fpscanf.s78 + 0)
24f1 : 4c 4e 21 JMP $214e ; (fpscanf.s157 + 0)
.s78:
24f4 : a5 5a __ LDA T1 + 3 
24f6 : 49 80 __ EOR #$80
24f8 : 85 5a __ STA T1 + 3 
24fa : 4c 4e 21 JMP $214e ; (fpscanf.s157 + 0)
.s83:
24fd : a5 5b __ LDA T2 + 0 
24ff : c9 07 __ CMP #$07
2501 : 90 41 __ BCC $2544 ; (fpscanf.s84 + 0)
.s85:
2503 : a5 57 __ LDA T1 + 0 
2505 : 85 1b __ STA ACCU + 0 
2507 : a5 58 __ LDA T1 + 1 
2509 : 85 1c __ STA ACCU + 1 
250b : a5 59 __ LDA T1 + 2 
250d : 85 1d __ STA ACCU + 2 
250f : a5 5a __ LDA T1 + 3 
2511 : 85 1e __ STA ACCU + 3 
.l154:
2513 : a9 00 __ LDA #$00
2515 : 85 03 __ STA WORK + 0 
2517 : a9 49 __ LDA #$49
2519 : 85 06 __ STA WORK + 3 
251b : a9 24 __ LDA #$24
251d : 85 04 __ STA WORK + 1 
251f : a9 74 __ LDA #$74
2521 : 85 05 __ STA WORK + 2 
2523 : 20 c6 3a JSR $3ac6 ; (freg + 20)
2526 : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
2529 : 38 __ __ SEC
252a : a5 5b __ LDA T2 + 0 
252c : e9 06 __ SBC #$06
252e : 85 5b __ STA T2 + 0 
2530 : c9 07 __ CMP #$07
2532 : b0 df __ BCS $2513 ; (fpscanf.l154 + 0)
.s155:
2534 : a6 1e __ LDX ACCU + 3 
2536 : 86 5a __ STX T1 + 3 
2538 : a6 1d __ LDX ACCU + 2 
253a : 86 59 __ STX T1 + 2 
253c : a6 1c __ LDX ACCU + 1 
253e : 86 58 __ STX T1 + 1 
2540 : a6 1b __ LDX ACCU + 0 
2542 : 86 57 __ STX T1 + 0 
.s84:
2544 : 0a __ __ ASL
2545 : 0a __ __ ASL
2546 : aa __ __ TAX
2547 : bd 43 40 LDA $4043,x ; (tpow10[0] + 1)
254a : 85 54 __ STA T0 + 1 
254c : a9 00 __ LDA #$00
254e : 85 53 __ STA T0 + 0 
2550 : bd 44 40 LDA $4044,x ; (tpow10[0] + 2)
2553 : 85 55 __ STA T0 + 2 
2555 : bd 45 40 LDA $4045,x ; (tpow10[0] + 3)
2558 : 85 56 __ STA T0 + 3 
255a : a5 57 __ LDA T1 + 0 
255c : 85 1b __ STA ACCU + 0 
255e : a5 58 __ LDA T1 + 1 
2560 : 85 1c __ STA ACCU + 1 
2562 : a5 59 __ LDA T1 + 2 
2564 : 85 1d __ STA ACCU + 2 
2566 : a5 5a __ LDA T1 + 3 
2568 : 85 1e __ STA ACCU + 3 
256a : a2 53 __ LDX #$53
256c : 20 b6 3a JSR $3ab6 ; (freg + 4)
256f : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
2572 : 4c d2 24 JMP $24d2 ; (fpscanf.s158 + 0)
.s94:
2575 : a5 15 __ LDA P8 ; (fparam + 0)
2577 : a0 02 __ LDY #$02
2579 : 91 23 __ STA (SP + 0),y 
257b : a5 16 __ LDA P9 ; (fparam + 1)
257d : c8 __ __ INY
257e : 91 23 __ STA (SP + 0),y 
2580 : a5 13 __ LDA P6 ; (ffunc + 0)
2582 : 85 1b __ STA ACCU + 0 
2584 : a5 14 __ LDA P7 ; (ffunc + 1)
2586 : 85 1c __ STA ACCU + 1 
2588 : 20 fb 28 JSR $28fb ; (bcexec + 0)
258b : 18 __ __ CLC
258c : a5 64 __ LDA T6 + 0 
258e : 69 02 __ ADC #$02
2590 : 85 64 __ STA T6 + 0 
2592 : 90 02 __ BCC $2596 ; (fpscanf.s196 + 0)
.s195:
2594 : e6 65 __ INC T6 + 1 
.s196:
2596 : e6 6b __ INC T11 + 0 
2598 : 4c 02 24 JMP $2402 ; (fpscanf.s160 + 0)
.l102:
259b : a5 5f __ LDA T3 + 0 
259d : a0 02 __ LDY #$02
259f : 91 23 __ STA (SP + 0),y 
25a1 : a5 60 __ LDA T3 + 1 
25a3 : c8 __ __ INY
25a4 : 91 23 __ STA (SP + 0),y 
25a6 : e6 64 __ INC T6 + 0 
25a8 : d0 02 __ BNE $25ac ; (fpscanf.s194 + 0)
.s193:
25aa : e6 65 __ INC T6 + 1 
.s194:
25ac : a9 00 __ LDA #$00
25ae : 85 1b __ STA ACCU + 0 
25b0 : 85 1c __ STA ACCU + 1 
25b2 : a9 20 __ LDA #$20
25b4 : 85 1d __ STA ACCU + 2 
25b6 : a9 41 __ LDA #$41
25b8 : 85 1e __ STA ACCU + 3 
25ba : a2 57 __ LDX #$57
25bc : 20 b6 3a JSR $3ab6 ; (freg + 4)
25bf : 20 e4 3b JSR $3be4 ; (crt_fmul + 0)
25c2 : a5 1b __ LDA ACCU + 0 
25c4 : 85 53 __ STA T0 + 0 
25c6 : a5 1c __ LDA ACCU + 1 
25c8 : 85 54 __ STA T0 + 1 
25ca : a5 1d __ LDA ACCU + 2 
25cc : 85 55 __ STA T0 + 2 
25ce : a5 1e __ LDA ACCU + 3 
25d0 : 85 56 __ STA T0 + 3 
25d2 : 38 __ __ SEC
25d3 : a5 5b __ LDA T2 + 0 
25d5 : e9 30 __ SBC #$30
25d7 : 85 1b __ STA ACCU + 0 
25d9 : a9 00 __ LDA #$00
25db : 85 1c __ STA ACCU + 1 
25dd : 20 c6 3e JSR $3ec6 ; (sint16_to_float + 0)
25e0 : a2 53 __ LDX #$53
25e2 : 20 b6 3a JSR $3ab6 ; (freg + 4)
25e5 : 20 fd 3a JSR $3afd ; (faddsub + 6)
25e8 : a5 1b __ LDA ACCU + 0 
25ea : 85 57 __ STA T1 + 0 
25ec : a5 1c __ LDA ACCU + 1 
25ee : 85 58 __ STA T1 + 1 
25f0 : a5 1d __ LDA ACCU + 2 
25f2 : 85 59 __ STA T1 + 2 
25f4 : a5 1e __ LDA ACCU + 3 
25f6 : 85 5a __ STA T1 + 3 
25f8 : a5 66 __ LDA T7 + 0 
25fa : 85 1b __ STA ACCU + 0 
25fc : a5 67 __ LDA T7 + 1 
25fe : 85 1c __ STA ACCU + 1 
2600 : 20 fb 28 JSR $28fb ; (bcexec + 0)
2603 : a5 1b __ LDA ACCU + 0 
2605 : 85 63 __ STA T5 + 0 
2607 : c9 30 __ CMP #$30
2609 : b0 03 __ BCS $260e ; (fpscanf.s103 + 0)
260b : 4c 81 22 JMP $2281 ; (fpscanf.s72 + 0)
.s103:
260e : 85 5b __ STA T2 + 0 
2610 : a9 39 __ LDA #$39
2612 : c5 1b __ CMP ACCU + 0 
2614 : b0 85 __ BCS $259b ; (fpscanf.l102 + 0)
2616 : 4c 81 22 JMP $2281 ; (fpscanf.s72 + 0)
.s108:
2619 : c9 63 __ CMP #$63
261b : f0 0a __ BEQ $2627 ; (fpscanf.s110 + 0)
.s109:
261d : c9 64 __ CMP #$64
261f : d0 03 __ BNE $2624 ; (fpscanf.s109 + 7)
2621 : 4c eb 1f JMP $1feb ; (fpscanf.s26 + 0)
2624 : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s110:
2627 : a0 00 __ LDY #$00
2629 : b1 17 __ LDA (P10),y ; (params + 0)
262b : 85 53 __ STA T0 + 0 
262d : c8 __ __ INY
262e : b1 17 __ LDA (P10),y ; (params + 0)
2630 : 85 54 __ STA T0 + 1 
2632 : a5 5c __ LDA T2 + 1 
2634 : c9 7f __ CMP #$7f
2636 : d0 0c __ BNE $2644 ; (fpscanf.s111 + 0)
.s121:
2638 : a6 5b __ LDX T2 + 0 
263a : e8 __ __ INX
263b : d0 07 __ BNE $2644 ; (fpscanf.s111 + 0)
.s120:
263d : 86 5c __ STX T2 + 1 
263f : 84 5b __ STY T2 + 0 
2641 : 4c 4b 26 JMP $264b ; (fpscanf.s113 + 0)
.s111:
2644 : aa __ __ TAX
2645 : 30 59 __ BMI $26a0 ; (fpscanf.s112 + 0)
.s119:
2647 : 05 5b __ ORA T2 + 0 
2649 : f0 55 __ BEQ $26a0 ; (fpscanf.s112 + 0)
.s113:
264b : a5 63 __ LDA T5 + 0 
264d : f0 51 __ BEQ $26a0 ; (fpscanf.s112 + 0)
.s114:
264f : a5 15 __ LDA P8 ; (fparam + 0)
2651 : 85 57 __ STA T1 + 0 
2653 : a5 16 __ LDA P9 ; (fparam + 1)
2655 : 85 58 __ STA T1 + 1 
2657 : a5 13 __ LDA P6 ; (ffunc + 0)
2659 : 85 5f __ STA T3 + 0 
265b : a5 14 __ LDA P7 ; (ffunc + 1)
265d : 85 60 __ STA T3 + 1 
.l115:
265f : a5 57 __ LDA T1 + 0 
2661 : a0 02 __ LDY #$02
2663 : 91 23 __ STA (SP + 0),y 
2665 : a5 58 __ LDA T1 + 1 
2667 : c8 __ __ INY
2668 : 91 23 __ STA (SP + 0),y 
266a : a5 6a __ LDA T10 + 0 
266c : d0 0c __ BNE $267a ; (fpscanf.s117 + 0)
.s116:
266e : a5 63 __ LDA T5 + 0 
2670 : a0 00 __ LDY #$00
2672 : 91 53 __ STA (T0 + 0),y 
2674 : e6 53 __ INC T0 + 0 
2676 : d0 02 __ BNE $267a ; (fpscanf.s117 + 0)
.s184:
2678 : e6 54 __ INC T0 + 1 
.s117:
267a : a5 5f __ LDA T3 + 0 
267c : 85 1b __ STA ACCU + 0 
267e : a5 60 __ LDA T3 + 1 
2680 : 85 1c __ STA ACCU + 1 
2682 : 20 fb 28 JSR $28fb ; (bcexec + 0)
2685 : a6 1b __ LDX ACCU + 0 
2687 : 86 63 __ STX T5 + 0 
2689 : e6 64 __ INC T6 + 0 
268b : d0 02 __ BNE $268f ; (fpscanf.s183 + 0)
.s182:
268d : e6 65 __ INC T6 + 1 
.s183:
268f : a5 5b __ LDA T2 + 0 
2691 : d0 02 __ BNE $2695 ; (fpscanf.s165 + 0)
.s164:
2693 : c6 5c __ DEC T2 + 1 
.s165:
2695 : c6 5b __ DEC T2 + 0 
2697 : d0 04 __ BNE $269d ; (fpscanf.s118 + 0)
.s166:
2699 : a5 5c __ LDA T2 + 1 
269b : f0 03 __ BEQ $26a0 ; (fpscanf.s112 + 0)
.s118:
269d : 8a __ __ TXA
269e : d0 bf __ BNE $265f ; (fpscanf.l115 + 0)
.s112:
26a0 : a5 6a __ LDA T10 + 0 
26a2 : d0 80 __ BNE $2624 ; (fpscanf.s109 + 7)
26a4 : 4c cd 1f JMP $1fcd ; (fpscanf.s35 + 0)
.s123:
26a7 : c9 4e __ CMP #$4e
26a9 : d0 03 __ BNE $26ae ; (fpscanf.s124 + 0)
26ab : 4c 31 1f JMP $1f31 ; (fpscanf.s122 + 0)
.s124:
26ae : 90 1a __ BCC $26ca ; (fpscanf.s129 + 0)
.s125:
26b0 : c9 55 __ CMP #$55
26b2 : d0 03 __ BNE $26b7 ; (fpscanf.s126 + 0)
26b4 : 4c e9 1f JMP $1fe9 ; (fpscanf.s25 + 0)
.s126:
26b7 : b0 0a __ BCS $26c3 ; (fpscanf.s127 + 0)
.s128:
26b9 : c9 53 __ CMP #$53
26bb : d0 03 __ BNE $26c0 ; (fpscanf.s128 + 7)
26bd : 4c 61 1f JMP $1f61 ; (fpscanf.s52 + 0)
26c0 : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s127:
26c3 : c9 58 __ CMP #$58
26c5 : d0 f9 __ BNE $26c0 ; (fpscanf.s128 + 7)
26c7 : 4c e5 1f JMP $1fe5 ; (fpscanf.s24 + 0)
.s129:
26ca : c9 45 __ CMP #$45
26cc : b0 0e __ BCS $26dc ; (fpscanf.s130 + 0)
.s132:
26ce : c9 43 __ CMP #$43
26d0 : d0 03 __ BNE $26d5 ; (fpscanf.s133 + 0)
26d2 : 4c 27 26 JMP $2627 ; (fpscanf.s110 + 0)
.s133:
26d5 : c9 44 __ CMP #$44
26d7 : d0 e7 __ BNE $26c0 ; (fpscanf.s128 + 7)
26d9 : 4c eb 1f JMP $1feb ; (fpscanf.s26 + 0)
.s130:
26dc : c9 48 __ CMP #$48
26de : b0 03 __ BCS $26e3 ; (fpscanf.s131 + 0)
26e0 : 4c 03 22 JMP $2203 ; (fpscanf.s67 + 0)
.s131:
26e3 : c9 49 __ CMP #$49
26e5 : f0 f2 __ BEQ $26d9 ; (fpscanf.s133 + 4)
26e7 : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s134:
26ea : a5 11 __ LDA P4 ; (fmt + 0)
26ec : 85 0d __ STA P0 
26ee : a5 12 __ LDA P5 ; (fmt + 1)
26f0 : 85 0e __ STA P1 
26f2 : a5 23 __ LDA SP + 0 
26f4 : 69 1e __ ADC #$1e
26f6 : 85 0f __ STA P2 
26f8 : a5 24 __ LDA SP + 1 
26fa : 69 00 __ ADC #$00
26fc : 85 10 __ STA P3 
26fe : 20 23 28 JSR $2823 ; (scanpat.s4 + 0)
2701 : a5 1b __ LDA ACCU + 0 
2703 : 85 11 __ STA P4 ; (fmt + 0)
2705 : a5 1c __ LDA ACCU + 1 
2707 : 85 12 __ STA P5 ; (fmt + 1)
2709 : a0 00 __ LDY #$00
270b : b1 17 __ LDA (P10),y ; (params + 0)
270d : 85 5f __ STA T3 + 0 
270f : c8 __ __ INY
2710 : b1 17 __ LDA (P10),y ; (params + 0)
2712 : 85 60 __ STA T3 + 1 
2714 : a5 5c __ LDA T2 + 1 
2716 : 10 03 __ BPL $271b ; (fpscanf.s139 + 0)
2718 : 4c c6 1f JMP $1fc6 ; (fpscanf.s53 + 0)
.s139:
271b : 05 5b __ ORA T2 + 0 
271d : f0 f9 __ BEQ $2718 ; (fpscanf.s134 + 46)
.l135:
271f : a5 63 __ LDA T5 + 0 
2721 : 4a __ __ LSR
2722 : 4a __ __ LSR
2723 : 4a __ __ LSR
2724 : 18 __ __ CLC
2725 : 69 1f __ ADC #$1f
2727 : a8 __ __ TAY
2728 : a5 63 __ LDA T5 + 0 
272a : 29 07 __ AND #$07
272c : aa __ __ TAX
272d : bd 92 40 LDA $4092,x ; (bitshift[0] + 8)
2730 : 31 23 __ AND (SP + 0),y 
2732 : f0 e4 __ BEQ $2718 ; (fpscanf.s134 + 46)
.s136:
2734 : a5 15 __ LDA P8 ; (fparam + 0)
2736 : a0 02 __ LDY #$02
2738 : 91 23 __ STA (SP + 0),y 
273a : a5 16 __ LDA P9 ; (fparam + 1)
273c : c8 __ __ INY
273d : 91 23 __ STA (SP + 0),y 
273f : a5 6a __ LDA T10 + 0 
2741 : d0 0c __ BNE $274f ; (fpscanf.s138 + 0)
.s137:
2743 : a5 63 __ LDA T5 + 0 
2745 : a0 00 __ LDY #$00
2747 : 91 5f __ STA (T3 + 0),y 
2749 : e6 5f __ INC T3 + 0 
274b : d0 02 __ BNE $274f ; (fpscanf.s138 + 0)
.s181:
274d : e6 60 __ INC T3 + 1 
.s138:
274f : a5 13 __ LDA P6 ; (ffunc + 0)
2751 : 85 1b __ STA ACCU + 0 
2753 : a5 14 __ LDA P7 ; (ffunc + 1)
2755 : 85 1c __ STA ACCU + 1 
2757 : 20 fb 28 JSR $28fb ; (bcexec + 0)
275a : a5 1b __ LDA ACCU + 0 
275c : 85 63 __ STA T5 + 0 
275e : e6 64 __ INC T6 + 0 
2760 : d0 02 __ BNE $2764 ; (fpscanf.s177 + 0)
.s176:
2762 : e6 65 __ INC T6 + 1 
.s177:
2764 : a5 5b __ LDA T2 + 0 
2766 : d0 02 __ BNE $276a ; (fpscanf.s162 + 0)
.s161:
2768 : c6 5c __ DEC T2 + 1 
.s162:
276a : c6 5b __ DEC T2 + 0 
276c : d0 b1 __ BNE $271f ; (fpscanf.l135 + 0)
.s163:
276e : a5 5c __ LDA T2 + 1 
2770 : d0 ad __ BNE $271f ; (fpscanf.l135 + 0)
2772 : 4c c6 1f JMP $1fc6 ; (fpscanf.s53 + 0)
.s140:
2775 : a0 00 __ LDY #$00
2777 : b1 11 __ LDA (P4),y ; (fmt + 0)
2779 : e6 11 __ INC P4 ; (fmt + 0)
277b : d0 02 __ BNE $277f ; (fpscanf.s175 + 0)
.s174:
277d : e6 12 __ INC P5 ; (fmt + 1)
.s175:
277f : c9 5b __ CMP #$5b
2781 : d0 03 __ BNE $2786 ; (fpscanf.s141 + 0)
2783 : 4c ea 26 JMP $26ea ; (fpscanf.s134 + 0)
.s141:
2786 : e6 69 __ INC T9 + 0 
2788 : 4c 26 1f JMP $1f26 ; (fpscanf.s18 + 0)
.s147:
278b : 84 6a __ STY T10 + 0 
278d : a5 53 __ LDA T0 + 0 
278f : 69 02 __ ADC #$02
2791 : 85 11 __ STA P4 ; (fmt + 0)
2793 : a5 54 __ LDA T0 + 1 
2795 : 69 00 __ ADC #$00
2797 : 85 12 __ STA P5 ; (fmt + 1)
2799 : c8 __ __ INY
279a : b1 53 __ LDA (T0 + 0),y 
279c : c9 30 __ CMP #$30
279e : aa __ __ TAX
279f : b0 03 __ BCS $27a4 ; (fpscanf.s147 + 25)
27a1 : 4c 1b 1f JMP $1f1b ; (fpscanf.s16 + 0)
27a4 : 4c b8 1e JMP $1eb8 ; (fpscanf.s142 + 0)
.s148:
27a7 : a5 63 __ LDA T5 + 0 
27a9 : d0 03 __ BNE $27ae ; (fpscanf.l149 + 0)
27ab : 4c 69 1e JMP $1e69 ; (fpscanf.s5 + 0)
.l149:
27ae : c9 20 __ CMP #$20
27b0 : f0 0f __ BEQ $27c1 ; (fpscanf.s153 + 0)
.s150:
27b2 : c9 09 __ CMP #$09
27b4 : f0 0b __ BEQ $27c1 ; (fpscanf.s153 + 0)
.s151:
27b6 : c9 0a __ CMP #$0a
27b8 : f0 07 __ BEQ $27c1 ; (fpscanf.s153 + 0)
.s152:
27ba : c9 0d __ CMP #$0d
27bc : f0 03 __ BEQ $27c1 ; (fpscanf.s153 + 0)
27be : 4c 65 1e JMP $1e65 ; (fpscanf.s12 + 0)
.s153:
27c1 : a5 15 __ LDA P8 ; (fparam + 0)
27c3 : a0 02 __ LDY #$02
27c5 : 91 23 __ STA (SP + 0),y 
27c7 : a5 16 __ LDA P9 ; (fparam + 1)
27c9 : c8 __ __ INY
27ca : 91 23 __ STA (SP + 0),y 
27cc : a5 13 __ LDA P6 ; (ffunc + 0)
27ce : 85 1b __ STA ACCU + 0 
27d0 : a5 14 __ LDA P7 ; (ffunc + 1)
27d2 : 85 1c __ STA ACCU + 1 
27d4 : 20 fb 28 JSR $28fb ; (bcexec + 0)
27d7 : e6 64 __ INC T6 + 0 
27d9 : d0 02 __ BNE $27dd ; (fpscanf.s173 + 0)
.s172:
27db : e6 65 __ INC T6 + 1 
.s173:
27dd : a5 1b __ LDA ACCU + 0 
27df : 85 63 __ STA T5 + 0 
27e1 : d0 cb __ BNE $27ae ; (fpscanf.l149 + 0)
27e3 : 4c 69 1e JMP $1e69 ; (fpscanf.s5 + 0)
--------------------------------------------------------------------
hexch: ; hexch(u8)->i16
; 584, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
27e6 : c9 30 __ CMP #$30
27e8 : 90 2f __ BCC $2819 ; (hexch.s7 + 0)
.s12:
27ea : c9 3a __ CMP #$3a
27ec : b0 0b __ BCS $27f9 ; (hexch.s5 + 0)
.s13:
27ee : e9 2f __ SBC #$2f
27f0 : 85 1b __ STA ACCU + 0 
27f2 : a9 00 __ LDA #$00
27f4 : e9 00 __ SBC #$00
.s3:
27f6 : 85 1c __ STA ACCU + 1 
27f8 : 60 __ __ RTS
.s5:
27f9 : 85 1b __ STA ACCU + 0 
27fb : c9 61 __ CMP #$61
27fd : 90 12 __ BCC $2811 ; (hexch.s6 + 0)
.s10:
27ff : c9 67 __ CMP #$67
2801 : b0 0e __ BCS $2811 ; (hexch.s6 + 0)
.s11:
2803 : a9 a9 __ LDA #$a9
.s14:
2805 : 18 __ __ CLC
2806 : 65 1b __ ADC ACCU + 0 
2808 : 85 1b __ STA ACCU + 0 
280a : a9 00 __ LDA #$00
280c : 69 ff __ ADC #$ff
280e : 4c f6 27 JMP $27f6 ; (hexch.s3 + 0)
.s6:
2811 : c9 41 __ CMP #$41
2813 : 90 04 __ BCC $2819 ; (hexch.s7 + 0)
.s8:
2815 : c9 47 __ CMP #$47
2817 : 90 06 __ BCC $281f ; (hexch.s9 + 0)
.s7:
2819 : a9 ff __ LDA #$ff
281b : 85 1b __ STA ACCU + 0 
281d : d0 d7 __ BNE $27f6 ; (hexch.s3 + 0)
.s9:
281f : a9 c9 __ LDA #$c9
2821 : 90 e2 __ BCC $2805 ; (hexch.s14 + 0)
--------------------------------------------------------------------
scanpat: ; scanpat(const u8*,u8*)->const u8*
; 596, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
2823 : a9 00 __ LDA #$00
2825 : a0 1f __ LDY #$1f
.l16:
2827 : 91 0f __ STA (P2),y ; (mask + 0)
2829 : 88 __ __ DEY
282a : 10 fb __ BPL $2827 ; (scanpat.l16 + 0)
.s17:
282c : a5 0d __ LDA P0 ; (fmt + 0)
282e : 85 1b __ STA ACCU + 0 
2830 : 18 __ __ CLC
2831 : 69 01 __ ADC #$01
2833 : 85 0d __ STA P0 ; (fmt + 0)
2835 : a5 0e __ LDA P1 ; (fmt + 1)
2837 : 85 1c __ STA ACCU + 1 
2839 : 69 00 __ ADC #$00
283b : 85 0e __ STA P1 ; (fmt + 1)
283d : a0 00 __ LDY #$00
283f : b1 1b __ LDA (ACCU + 0),y 
2841 : c9 5e __ CMP #$5e
2843 : d0 0f __ BNE $2854 ; (scanpat.s19 + 0)
.s15:
2845 : a5 1b __ LDA ACCU + 0 
2847 : 69 01 __ ADC #$01
2849 : 85 0d __ STA P0 ; (fmt + 0)
284b : a5 1c __ LDA ACCU + 1 
284d : 69 00 __ ADC #$00
284f : 85 0e __ STA P1 ; (fmt + 1)
2851 : c8 __ __ INY
2852 : b1 1b __ LDA (ACCU + 0),y 
.s19:
2854 : 84 1e __ STY ACCU + 3 
.l5:
2856 : 85 1d __ STA ACCU + 2 
2858 : 85 43 __ STA T6 + 0 
285a : a5 0d __ LDA P0 ; (fmt + 0)
285c : 85 1b __ STA ACCU + 0 
285e : 18 __ __ CLC
285f : 69 01 __ ADC #$01
2861 : 85 0d __ STA P0 ; (fmt + 0)
2863 : a5 0e __ LDA P1 ; (fmt + 1)
2865 : 85 1c __ STA ACCU + 1 
2867 : 69 00 __ ADC #$00
2869 : 85 0e __ STA P1 ; (fmt + 1)
286b : a0 00 __ LDY #$00
286d : b1 1b __ LDA (ACCU + 0),y 
286f : c9 2d __ CMP #$2d
2871 : d0 19 __ BNE $288c ; (scanpat.s6 + 0)
.s13:
2873 : c8 __ __ INY
2874 : b1 1b __ LDA (ACCU + 0),y 
2876 : c9 5d __ CMP #$5d
2878 : f0 12 __ BEQ $288c ; (scanpat.s6 + 0)
.s14:
287a : 85 43 __ STA T6 + 0 
287c : 18 __ __ CLC
287d : a5 1b __ LDA ACCU + 0 
287f : 69 03 __ ADC #$03
2881 : 85 0d __ STA P0 ; (fmt + 0)
2883 : a5 1c __ LDA ACCU + 1 
2885 : 69 00 __ ADC #$00
2887 : 85 0e __ STA P1 ; (fmt + 1)
2889 : c8 __ __ INY
288a : b1 1b __ LDA (ACCU + 0),y 
.s6:
288c : 85 1b __ STA ACCU + 0 
288e : a5 43 __ LDA T6 + 0 
2890 : c5 1d __ CMP ACCU + 2 
2892 : 90 1a __ BCC $28ae ; (scanpat.s7 + 0)
.l12:
2894 : a5 1d __ LDA ACCU + 2 
2896 : 29 07 __ AND #$07
2898 : aa __ __ TAX
2899 : a5 1d __ LDA ACCU + 2 
289b : 4a __ __ LSR
289c : 4a __ __ LSR
289d : 4a __ __ LSR
289e : a8 __ __ TAY
289f : b1 0f __ LDA (P2),y ; (mask + 0)
28a1 : 1d 92 40 ORA $4092,x ; (bitshift[0] + 8)
28a4 : 91 0f __ STA (P2),y ; (mask + 0)
28a6 : e6 1d __ INC ACCU + 2 
28a8 : a5 43 __ LDA T6 + 0 
28aa : c5 1d __ CMP ACCU + 2 
28ac : b0 e6 __ BCS $2894 ; (scanpat.l12 + 0)
.s7:
28ae : a5 1b __ LDA ACCU + 0 
28b0 : f0 04 __ BEQ $28b6 ; (scanpat.s8 + 0)
.s11:
28b2 : c9 5d __ CMP #$5d
28b4 : d0 a0 __ BNE $2856 ; (scanpat.l5 + 0)
.s8:
28b6 : a5 1e __ LDA ACCU + 3 
28b8 : f0 0d __ BEQ $28c7 ; (scanpat.s9 + 0)
.s10:
28ba : a0 04 __ LDY #$04
.l18:
28bc : b1 0f __ LDA (P2),y ; (mask + 0)
28be : 49 ff __ EOR #$ff
28c0 : 91 0f __ STA (P2),y ; (mask + 0)
28c2 : c8 __ __ INY
28c3 : c0 20 __ CPY #$20
28c5 : d0 f5 __ BNE $28bc ; (scanpat.l18 + 0)
.s9:
28c7 : a5 0d __ LDA P0 ; (fmt + 0)
28c9 : 85 1b __ STA ACCU + 0 
28cb : a5 0e __ LDA P1 ; (fmt + 1)
28cd : 85 1c __ STA ACCU + 1 
.s3:
28cf : 60 __ __ RTS
--------------------------------------------------------------------
28d0 : __ __ __ BYT 25 64 20 25 64 20 25 64 00                      : %d %d %d.
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
28d9 : a0 00 __ LDY #$00
28db : b1 0e __ LDA (P1),y ; (str + 0)
28dd : d0 01 __ BNE $28e0 ; (puts.s5 + 0)
.s3:
28df : 60 __ __ RTS
.s5:
28e0 : e6 0e __ INC P1 ; (str + 0)
28e2 : d0 02 __ BNE $28e6 ; (puts.s7 + 0)
.s6:
28e4 : e6 0f __ INC P2 ; (str + 1)
.s7:
28e6 : 20 c3 2d JSR $2dc3 ; (putpch.s4 + 0)
28e9 : 4c d9 28 JMP $28d9 ; (puts.l4 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
28ec : 06 0f __ ASL P2 ; (f + 2)
28ee : a5 10 __ LDA P3 ; (f + 3)
28f0 : 2a __ __ ROL
28f1 : c9 ff __ CMP #$ff
28f3 : d0 03 __ BNE $28f8 ; (isinf.s6 + 0)
.s5:
28f5 : a9 01 __ LDA #$01
28f7 : 60 __ __ RTS
.s6:
28f8 : a9 00 __ LDA #$00
.s3:
28fa : 60 __ __ RTS
--------------------------------------------------------------------
bcexec: ; bcexec
28fb : 6c 1b 00 JMP ($001b)
--------------------------------------------------------------------
spentry:
28fe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
28ff : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
sscanf_func: ; sscanf_func(void*)->i16
;1008, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
2900 : a0 02 __ LDY #$02
2902 : b1 23 __ LDA (SP + 0),y 
2904 : 85 1b __ STA ACCU + 0 
2906 : c8 __ __ INY
2907 : b1 23 __ LDA (SP + 0),y 
2909 : 85 1c __ STA ACCU + 1 
290b : a0 00 __ LDY #$00
290d : b1 1b __ LDA (ACCU + 0),y 
290f : 85 43 __ STA T1 + 0 
2911 : c8 __ __ INY
2912 : b1 1b __ LDA (ACCU + 0),y 
2914 : 85 44 __ STA T1 + 1 
2916 : 88 __ __ DEY
2917 : b1 43 __ LDA (T1 + 0),y 
2919 : f0 10 __ BEQ $292b ; (sscanf_func.s5 + 0)
.s6:
291b : aa __ __ TAX
291c : 18 __ __ CLC
291d : a5 43 __ LDA T1 + 0 
291f : 69 01 __ ADC #$01
2921 : 91 1b __ STA (ACCU + 0),y 
2923 : a5 44 __ LDA T1 + 1 
2925 : 69 00 __ ADC #$00
2927 : c8 __ __ INY
2928 : 91 1b __ STA (ACCU + 0),y 
292a : 8a __ __ TXA
.s5:
292b : 85 1b __ STA ACCU + 0 
292d : a9 00 __ LDA #$00
292f : 85 1c __ STA ACCU + 1 
.s3:
2931 : 60 __ __ RTS
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->i16
;  20, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s1:
2932 : a5 53 __ LDA T1 + 0 
2934 : 8d c8 9f STA $9fc8 ; (sprintf@stack + 0)
2937 : a5 54 __ LDA T1 + 1 
2939 : 8d c9 9f STA $9fc9 ; (sprintf@stack + 1)
.s4:
293c : ad f4 9f LDA $9ff4 ; (sstack + 8)
293f : 85 53 __ STA T1 + 0 
2941 : 8d ed 9f STA $9fed ; (sstack + 1)
2944 : a9 00 __ LDA #$00
2946 : 8d f3 9f STA $9ff3 ; (sstack + 7)
2949 : ad f5 9f LDA $9ff5 ; (sstack + 9)
294c : 85 54 __ STA T1 + 1 
294e : 8d ee 9f STA $9fee ; (sstack + 2)
2951 : ad f6 9f LDA $9ff6 ; (sstack + 10)
2954 : 8d ef 9f STA $9fef ; (sstack + 3)
2957 : ad f7 9f LDA $9ff7 ; (sstack + 11)
295a : 8d f0 9f STA $9ff0 ; (sstack + 4)
295d : a9 f8 __ LDA #$f8
295f : 8d f1 9f STA $9ff1 ; (sstack + 5)
2962 : a9 9f __ LDA #$9f
2964 : 8d f2 9f STA $9ff2 ; (sstack + 6)
2967 : 20 82 29 JSR $2982 ; (sformat.s1 + 0)
296a : 38 __ __ SEC
296b : a5 1b __ LDA ACCU + 0 
296d : e5 53 __ SBC T1 + 0 
296f : 85 1b __ STA ACCU + 0 
2971 : a5 1c __ LDA ACCU + 1 
2973 : e5 54 __ SBC T1 + 1 
2975 : 85 1c __ STA ACCU + 1 
.s3:
2977 : ad c8 9f LDA $9fc8 ; (sprintf@stack + 0)
297a : 85 53 __ STA T1 + 0 
297c : ad c9 9f LDA $9fc9 ; (sprintf@stack + 1)
297f : 85 54 __ STA T1 + 1 
2981 : 60 __ __ RTS
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
2982 : a2 09 __ LDX #$09
2984 : b5 53 __ LDA T1 + 0,x 
2986 : 9d ca 9f STA $9fca,x ; (sformat@stack + 0)
2989 : ca __ __ DEX
298a : 10 f8 __ BPL $2984 ; (sformat.s1 + 2)
.s4:
298c : ad ef 9f LDA $9fef ; (sstack + 3)
298f : 85 55 __ STA T3 + 0 
2991 : a9 00 __ LDA #$00
2993 : 85 5b __ STA T6 + 0 
2995 : ad f0 9f LDA $9ff0 ; (sstack + 4)
2998 : 85 56 __ STA T3 + 1 
299a : ad ed 9f LDA $9fed ; (sstack + 1)
299d : 85 57 __ STA T4 + 0 
299f : ad ee 9f LDA $9fee ; (sstack + 2)
29a2 : 85 58 __ STA T4 + 1 
.l5:
29a4 : a0 00 __ LDY #$00
29a6 : b1 55 __ LDA (T3 + 0),y 
29a8 : d0 36 __ BNE $29e0 ; (sformat.s10 + 0)
.s6:
29aa : a4 5b __ LDY T6 + 0 
29ac : 91 57 __ STA (T4 + 0),y 
29ae : 98 __ __ TYA
29af : f0 28 __ BEQ $29d9 ; (sformat.s95 + 0)
.s7:
29b1 : ad f3 9f LDA $9ff3 ; (sstack + 7)
29b4 : d0 18 __ BNE $29ce ; (sformat.s9 + 0)
.s8:
29b6 : 98 __ __ TYA
29b7 : 18 __ __ CLC
29b8 : 65 57 __ ADC T4 + 0 
29ba : aa __ __ TAX
29bb : a5 58 __ LDA T4 + 1 
29bd : 69 00 __ ADC #$00
.s3:
29bf : 86 1b __ STX ACCU + 0 ; (buff + 1)
29c1 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
29c3 : a2 09 __ LDX #$09
29c5 : bd ca 9f LDA $9fca,x ; (sformat@stack + 0)
29c8 : 95 53 __ STA T1 + 0,x 
29ca : ca __ __ DEX
29cb : 10 f8 __ BPL $29c5 ; (sformat.s3 + 6)
29cd : 60 __ __ RTS
.s9:
29ce : a5 57 __ LDA T4 + 0 
29d0 : 85 0e __ STA P1 
29d2 : a5 58 __ LDA T4 + 1 
29d4 : 85 0f __ STA P2 
29d6 : 20 d9 28 JSR $28d9 ; (puts.l4 + 0)
.s95:
29d9 : a5 58 __ LDA T4 + 1 
29db : a6 57 __ LDX T4 + 0 
29dd : 4c bf 29 JMP $29bf ; (sformat.s3 + 0)
.s10:
29e0 : c9 25 __ CMP #$25
29e2 : f0 3e __ BEQ $2a22 ; (sformat.s15 + 0)
.s11:
29e4 : a4 5b __ LDY T6 + 0 
29e6 : 91 57 __ STA (T4 + 0),y 
29e8 : e6 55 __ INC T3 + 0 
29ea : d0 02 __ BNE $29ee ; (sformat.s117 + 0)
.s116:
29ec : e6 56 __ INC T3 + 1 
.s117:
29ee : c8 __ __ INY
29ef : 84 5b __ STY T6 + 0 
29f1 : 98 __ __ TYA
29f2 : c0 28 __ CPY #$28
29f4 : 90 ae __ BCC $29a4 ; (sformat.l5 + 0)
.s12:
29f6 : 85 43 __ STA T0 + 0 
29f8 : a9 00 __ LDA #$00
29fa : 85 5b __ STA T6 + 0 
29fc : ad f3 9f LDA $9ff3 ; (sstack + 7)
29ff : f0 14 __ BEQ $2a15 ; (sformat.s13 + 0)
.s14:
2a01 : a5 57 __ LDA T4 + 0 
2a03 : 85 0e __ STA P1 
2a05 : a5 58 __ LDA T4 + 1 
2a07 : 85 0f __ STA P2 
2a09 : a9 00 __ LDA #$00
2a0b : a4 43 __ LDY T0 + 0 
2a0d : 91 0e __ STA (P1),y 
2a0f : 20 d9 28 JSR $28d9 ; (puts.l4 + 0)
2a12 : 4c a4 29 JMP $29a4 ; (sformat.l5 + 0)
.s13:
2a15 : 18 __ __ CLC
2a16 : a5 57 __ LDA T4 + 0 
2a18 : 65 43 __ ADC T0 + 0 
2a1a : 85 57 __ STA T4 + 0 
2a1c : 90 86 __ BCC $29a4 ; (sformat.l5 + 0)
.s118:
2a1e : e6 58 __ INC T4 + 1 
2a20 : b0 82 __ BCS $29a4 ; (sformat.l5 + 0)
.s15:
2a22 : a5 5b __ LDA T6 + 0 
2a24 : f0 27 __ BEQ $2a4d ; (sformat.s16 + 0)
.s89:
2a26 : 84 5b __ STY T6 + 0 
2a28 : 85 43 __ STA T0 + 0 
2a2a : ad f3 9f LDA $9ff3 ; (sstack + 7)
2a2d : f0 13 __ BEQ $2a42 ; (sformat.s90 + 0)
.s91:
2a2f : a5 57 __ LDA T4 + 0 
2a31 : 85 0e __ STA P1 
2a33 : a5 58 __ LDA T4 + 1 
2a35 : 85 0f __ STA P2 
2a37 : 98 __ __ TYA
2a38 : a4 43 __ LDY T0 + 0 
2a3a : 91 0e __ STA (P1),y 
2a3c : 20 d9 28 JSR $28d9 ; (puts.l4 + 0)
2a3f : 4c 4d 2a JMP $2a4d ; (sformat.s16 + 0)
.s90:
2a42 : 18 __ __ CLC
2a43 : a5 57 __ LDA T4 + 0 
2a45 : 65 43 __ ADC T0 + 0 
2a47 : 85 57 __ STA T4 + 0 
2a49 : 90 02 __ BCC $2a4d ; (sformat.s16 + 0)
.s115:
2a4b : e6 58 __ INC T4 + 1 
.s16:
2a4d : a9 00 __ LDA #$00
2a4f : 8d d9 9f STA $9fd9 ; (si.sign + 0)
2a52 : 8d da 9f STA $9fda ; (si.left + 0)
2a55 : 8d db 9f STA $9fdb ; (si.prefix + 0)
2a58 : a0 01 __ LDY #$01
2a5a : b1 55 __ LDA (T3 + 0),y 
2a5c : a2 20 __ LDX #$20
2a5e : 8e d4 9f STX $9fd4 ; (si.fill + 0)
2a61 : a2 00 __ LDX #$00
2a63 : 8e d5 9f STX $9fd5 ; (si.width + 0)
2a66 : ca __ __ DEX
2a67 : 8e d6 9f STX $9fd6 ; (si.precision + 0)
2a6a : a2 0a __ LDX #$0a
2a6c : 8e d8 9f STX $9fd8 ; (si.base + 0)
2a6f : aa __ __ TAX
2a70 : a9 02 __ LDA #$02
2a72 : d0 07 __ BNE $2a7b ; (sformat.l17 + 0)
.s85:
2a74 : a0 00 __ LDY #$00
2a76 : b1 55 __ LDA (T3 + 0),y 
2a78 : aa __ __ TAX
2a79 : a9 01 __ LDA #$01
.l17:
2a7b : 18 __ __ CLC
2a7c : 65 55 __ ADC T3 + 0 
2a7e : 85 55 __ STA T3 + 0 
2a80 : 90 02 __ BCC $2a84 ; (sformat.s106 + 0)
.s105:
2a82 : e6 56 __ INC T3 + 1 
.s106:
2a84 : 8a __ __ TXA
2a85 : e0 2b __ CPX #$2b
2a87 : d0 07 __ BNE $2a90 ; (sformat.s18 + 0)
.s88:
2a89 : a9 01 __ LDA #$01
2a8b : 8d d9 9f STA $9fd9 ; (si.sign + 0)
2a8e : d0 e4 __ BNE $2a74 ; (sformat.s85 + 0)
.s18:
2a90 : c9 30 __ CMP #$30
2a92 : d0 06 __ BNE $2a9a ; (sformat.s19 + 0)
.s87:
2a94 : 8d d4 9f STA $9fd4 ; (si.fill + 0)
2a97 : 4c 74 2a JMP $2a74 ; (sformat.s85 + 0)
.s19:
2a9a : c9 23 __ CMP #$23
2a9c : d0 07 __ BNE $2aa5 ; (sformat.s20 + 0)
.s86:
2a9e : a9 01 __ LDA #$01
2aa0 : 8d db 9f STA $9fdb ; (si.prefix + 0)
2aa3 : d0 cf __ BNE $2a74 ; (sformat.s85 + 0)
.s20:
2aa5 : c9 2d __ CMP #$2d
2aa7 : d0 07 __ BNE $2ab0 ; (sformat.s21 + 0)
.s84:
2aa9 : a9 01 __ LDA #$01
2aab : 8d da 9f STA $9fda ; (si.left + 0)
2aae : d0 c4 __ BNE $2a74 ; (sformat.s85 + 0)
.s21:
2ab0 : 85 47 __ STA T2 + 0 
2ab2 : c9 30 __ CMP #$30
2ab4 : 90 3c __ BCC $2af2 ; (sformat.s22 + 0)
.s80:
2ab6 : c9 3a __ CMP #$3a
2ab8 : b0 77 __ BCS $2b31 ; (sformat.s23 + 0)
.s81:
2aba : a9 00 __ LDA #$00
2abc : 85 53 __ STA T1 + 0 
.l82:
2abe : a5 53 __ LDA T1 + 0 
2ac0 : 0a __ __ ASL
2ac1 : 85 1b __ STA ACCU + 0 ; (buff + 1)
2ac3 : a9 00 __ LDA #$00
2ac5 : 2a __ __ ROL
2ac6 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
2ac8 : 2a __ __ ROL
2ac9 : aa __ __ TAX
2aca : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2acc : 65 53 __ ADC T1 + 0 
2ace : 0a __ __ ASL
2acf : 18 __ __ CLC
2ad0 : 65 47 __ ADC T2 + 0 
2ad2 : 38 __ __ SEC
2ad3 : e9 30 __ SBC #$30
2ad5 : 85 53 __ STA T1 + 0 
2ad7 : a0 00 __ LDY #$00
2ad9 : b1 55 __ LDA (T3 + 0),y 
2adb : 85 47 __ STA T2 + 0 
2add : e6 55 __ INC T3 + 0 
2adf : d0 02 __ BNE $2ae3 ; (sformat.s114 + 0)
.s113:
2ae1 : e6 56 __ INC T3 + 1 
.s114:
2ae3 : c9 30 __ CMP #$30
2ae5 : 90 04 __ BCC $2aeb ; (sformat.s104 + 0)
.s83:
2ae7 : c9 3a __ CMP #$3a
2ae9 : 90 d3 __ BCC $2abe ; (sformat.l82 + 0)
.s104:
2aeb : 86 1c __ STX ACCU + 1 ; (fmt + 0)
2aed : a6 53 __ LDX T1 + 0 
2aef : 8e d5 9f STX $9fd5 ; (si.width + 0)
.s22:
2af2 : c9 2e __ CMP #$2e
2af4 : d0 3b __ BNE $2b31 ; (sformat.s23 + 0)
.s76:
2af6 : a9 00 __ LDA #$00
2af8 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
2afa : 4c 14 2b JMP $2b14 ; (sformat.l77 + 0)
.s79:
2afd : a5 43 __ LDA T0 + 0 
2aff : 0a __ __ ASL
2b00 : 85 1b __ STA ACCU + 0 ; (buff + 1)
2b02 : 98 __ __ TYA
2b03 : 2a __ __ ROL
2b04 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
2b06 : 2a __ __ ROL
2b07 : aa __ __ TAX
2b08 : 18 __ __ CLC
2b09 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2b0b : 65 43 __ ADC T0 + 0 
2b0d : 0a __ __ ASL
2b0e : 18 __ __ CLC
2b0f : 65 47 __ ADC T2 + 0 
2b11 : 38 __ __ SEC
2b12 : e9 30 __ SBC #$30
.l77:
2b14 : 85 43 __ STA T0 + 0 
2b16 : a0 00 __ LDY #$00
2b18 : b1 55 __ LDA (T3 + 0),y 
2b1a : 85 47 __ STA T2 + 0 
2b1c : e6 55 __ INC T3 + 0 
2b1e : d0 02 __ BNE $2b22 ; (sformat.s108 + 0)
.s107:
2b20 : e6 56 __ INC T3 + 1 
.s108:
2b22 : c9 30 __ CMP #$30
2b24 : 90 04 __ BCC $2b2a ; (sformat.s103 + 0)
.s78:
2b26 : c9 3a __ CMP #$3a
2b28 : 90 d3 __ BCC $2afd ; (sformat.s79 + 0)
.s103:
2b2a : 86 1c __ STX ACCU + 1 ; (fmt + 0)
2b2c : a6 43 __ LDX T0 + 0 
2b2e : 8e d6 9f STX $9fd6 ; (si.precision + 0)
.s23:
2b31 : c9 64 __ CMP #$64
2b33 : f0 0c __ BEQ $2b41 ; (sformat.s75 + 0)
.s24:
2b35 : c9 44 __ CMP #$44
2b37 : f0 08 __ BEQ $2b41 ; (sformat.s75 + 0)
.s25:
2b39 : c9 69 __ CMP #$69
2b3b : f0 04 __ BEQ $2b41 ; (sformat.s75 + 0)
.s26:
2b3d : c9 49 __ CMP #$49
2b3f : d0 07 __ BNE $2b48 ; (sformat.s27 + 0)
.s75:
2b41 : a9 01 __ LDA #$01
.s93:
2b43 : 85 13 __ STA P6 
2b45 : 4c 89 2d JMP $2d89 ; (sformat.s73 + 0)
.s27:
2b48 : c9 75 __ CMP #$75
2b4a : f0 04 __ BEQ $2b50 ; (sformat.s74 + 0)
.s28:
2b4c : c9 55 __ CMP #$55
2b4e : d0 04 __ BNE $2b54 ; (sformat.s29 + 0)
.s74:
2b50 : a9 00 __ LDA #$00
2b52 : f0 ef __ BEQ $2b43 ; (sformat.s93 + 0)
.s29:
2b54 : c9 78 __ CMP #$78
2b56 : f0 04 __ BEQ $2b5c ; (sformat.s72 + 0)
.s30:
2b58 : c9 58 __ CMP #$58
2b5a : d0 15 __ BNE $2b71 ; (sformat.s31 + 0)
.s72:
2b5c : a5 47 __ LDA T2 + 0 
2b5e : 29 e0 __ AND #$e0
2b60 : 09 01 __ ORA #$01
2b62 : 8d d7 9f STA $9fd7 ; (si.cha + 0)
2b65 : a9 00 __ LDA #$00
2b67 : 85 13 __ STA P6 
2b69 : a9 10 __ LDA #$10
2b6b : 8d d8 9f STA $9fd8 ; (si.base + 0)
2b6e : 4c 89 2d JMP $2d89 ; (sformat.s73 + 0)
.s31:
2b71 : c9 6c __ CMP #$6c
2b73 : d0 03 __ BNE $2b78 ; (sformat.s32 + 0)
2b75 : 4c fa 2c JMP $2cfa ; (sformat.s60 + 0)
.s32:
2b78 : c9 4c __ CMP #$4c
2b7a : f0 f9 __ BEQ $2b75 ; (sformat.s31 + 4)
.s33:
2b7c : c9 66 __ CMP #$66
2b7e : f0 14 __ BEQ $2b94 ; (sformat.s59 + 0)
.s34:
2b80 : c9 67 __ CMP #$67
2b82 : f0 10 __ BEQ $2b94 ; (sformat.s59 + 0)
.s35:
2b84 : c9 65 __ CMP #$65
2b86 : f0 0c __ BEQ $2b94 ; (sformat.s59 + 0)
.s36:
2b88 : c9 46 __ CMP #$46
2b8a : f0 08 __ BEQ $2b94 ; (sformat.s59 + 0)
.s37:
2b8c : c9 47 __ CMP #$47
2b8e : f0 04 __ BEQ $2b94 ; (sformat.s59 + 0)
.s38:
2b90 : c9 45 __ CMP #$45
2b92 : d0 5c __ BNE $2bf0 ; (sformat.s39 + 0)
.s59:
2b94 : a5 57 __ LDA T4 + 0 
2b96 : 85 13 __ STA P6 
2b98 : a5 58 __ LDA T4 + 1 
2b9a : 85 14 __ STA P7 
2b9c : a5 47 __ LDA T2 + 0 
2b9e : 29 e0 __ AND #$e0
2ba0 : 09 01 __ ORA #$01
2ba2 : 8d d7 9f STA $9fd7 ; (si.cha + 0)
2ba5 : ad f1 9f LDA $9ff1 ; (sstack + 5)
2ba8 : 85 59 __ STA T5 + 0 
2baa : a9 d4 __ LDA #$d4
2bac : 85 11 __ STA P4 
2bae : a9 9f __ LDA #$9f
2bb0 : 85 12 __ STA P5 
2bb2 : ad f2 9f LDA $9ff2 ; (sstack + 6)
2bb5 : 85 5a __ STA T5 + 1 
2bb7 : a0 00 __ LDY #$00
2bb9 : b1 59 __ LDA (T5 + 0),y 
2bbb : 85 15 __ STA P8 
2bbd : c8 __ __ INY
2bbe : b1 59 __ LDA (T5 + 0),y 
2bc0 : 85 16 __ STA P9 
2bc2 : c8 __ __ INY
2bc3 : b1 59 __ LDA (T5 + 0),y 
2bc5 : 85 17 __ STA P10 
2bc7 : c8 __ __ INY
2bc8 : b1 59 __ LDA (T5 + 0),y 
2bca : 85 18 __ STA P11 
2bcc : a5 47 __ LDA T2 + 0 
2bce : ed d7 9f SBC $9fd7 ; (si.cha + 0)
2bd1 : 18 __ __ CLC
2bd2 : 69 61 __ ADC #$61
2bd4 : 8d ec 9f STA $9fec ; (sstack + 0)
2bd7 : 20 8b 30 JSR $308b ; (nformf.s1 + 0)
2bda : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2bdc : 85 5b __ STA T6 + 0 
2bde : 18 __ __ CLC
2bdf : a5 59 __ LDA T5 + 0 
2be1 : 69 04 __ ADC #$04
2be3 : 8d f1 9f STA $9ff1 ; (sstack + 5)
2be6 : a5 5a __ LDA T5 + 1 
2be8 : 69 00 __ ADC #$00
2bea : 8d f2 9f STA $9ff2 ; (sstack + 6)
2bed : 4c a4 29 JMP $29a4 ; (sformat.l5 + 0)
.s39:
2bf0 : c9 73 __ CMP #$73
2bf2 : f0 3b __ BEQ $2c2f ; (sformat.s47 + 0)
.s40:
2bf4 : c9 53 __ CMP #$53
2bf6 : f0 37 __ BEQ $2c2f ; (sformat.s47 + 0)
.s41:
2bf8 : c9 63 __ CMP #$63
2bfa : f0 12 __ BEQ $2c0e ; (sformat.s46 + 0)
.s42:
2bfc : c9 43 __ CMP #$43
2bfe : f0 0e __ BEQ $2c0e ; (sformat.s46 + 0)
.s43:
2c00 : aa __ __ TAX
2c01 : f0 ea __ BEQ $2bed ; (sformat.s59 + 89)
.s44:
2c03 : a0 00 __ LDY #$00
2c05 : 91 57 __ STA (T4 + 0),y 
.s45:
2c07 : a9 01 __ LDA #$01
.s96:
2c09 : 85 5b __ STA T6 + 0 
2c0b : 4c a4 29 JMP $29a4 ; (sformat.l5 + 0)
.s46:
2c0e : ad f1 9f LDA $9ff1 ; (sstack + 5)
2c11 : 85 43 __ STA T0 + 0 
2c13 : ad f2 9f LDA $9ff2 ; (sstack + 6)
2c16 : 85 44 __ STA T0 + 1 
2c18 : a0 00 __ LDY #$00
2c1a : b1 43 __ LDA (T0 + 0),y 
2c1c : 91 57 __ STA (T4 + 0),y 
2c1e : a5 43 __ LDA T0 + 0 
2c20 : 69 01 __ ADC #$01
2c22 : 8d f1 9f STA $9ff1 ; (sstack + 5)
2c25 : a5 44 __ LDA T0 + 1 
2c27 : 69 00 __ ADC #$00
2c29 : 8d f2 9f STA $9ff2 ; (sstack + 6)
2c2c : 4c 07 2c JMP $2c07 ; (sformat.s45 + 0)
.s47:
2c2f : ad f1 9f LDA $9ff1 ; (sstack + 5)
2c32 : 85 43 __ STA T0 + 0 
2c34 : 69 01 __ ADC #$01
2c36 : 8d f1 9f STA $9ff1 ; (sstack + 5)
2c39 : ad f2 9f LDA $9ff2 ; (sstack + 6)
2c3c : 85 44 __ STA T0 + 1 
2c3e : 69 00 __ ADC #$00
2c40 : 8d f2 9f STA $9ff2 ; (sstack + 6)
2c43 : a0 00 __ LDY #$00
2c45 : 84 5c __ STY T7 + 0 
2c47 : b1 43 __ LDA (T0 + 0),y 
2c49 : 85 1b __ STA ACCU + 0 ; (buff + 1)
2c4b : 85 53 __ STA T1 + 0 
2c4d : c8 __ __ INY
2c4e : b1 43 __ LDA (T0 + 0),y 
2c50 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
2c52 : 85 54 __ STA T1 + 1 
2c54 : ad d5 9f LDA $9fd5 ; (si.width + 0)
2c57 : f0 0c __ BEQ $2c65 ; (sformat.s48 + 0)
.s100:
2c59 : 88 __ __ DEY
2c5a : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
2c5c : f0 05 __ BEQ $2c63 ; (sformat.s101 + 0)
.l58:
2c5e : c8 __ __ INY
2c5f : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
2c61 : d0 fb __ BNE $2c5e ; (sformat.l58 + 0)
.s101:
2c63 : 84 5c __ STY T7 + 0 
.s48:
2c65 : ad da 9f LDA $9fda ; (si.left + 0)
2c68 : 85 59 __ STA T5 + 0 
2c6a : d0 19 __ BNE $2c85 ; (sformat.s49 + 0)
.s98:
2c6c : a6 5c __ LDX T7 + 0 
2c6e : ec d5 9f CPX $9fd5 ; (si.width + 0)
2c71 : a0 00 __ LDY #$00
2c73 : b0 0c __ BCS $2c81 ; (sformat.s99 + 0)
.l57:
2c75 : ad d4 9f LDA $9fd4 ; (si.fill + 0)
2c78 : 91 57 __ STA (T4 + 0),y 
2c7a : c8 __ __ INY
2c7b : e8 __ __ INX
2c7c : ec d5 9f CPX $9fd5 ; (si.width + 0)
2c7f : 90 f4 __ BCC $2c75 ; (sformat.l57 + 0)
.s99:
2c81 : 86 5c __ STX T7 + 0 
2c83 : 84 5b __ STY T6 + 0 
.s49:
2c85 : ac f3 9f LDY $9ff3 ; (sstack + 7)
2c88 : d0 48 __ BNE $2cd2 ; (sformat.s54 + 0)
.s50:
2c8a : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
2c8c : f0 23 __ BEQ $2cb1 ; (sformat.s51 + 0)
.s53:
2c8e : 18 __ __ CLC
2c8f : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2c91 : 69 01 __ ADC #$01
2c93 : 85 43 __ STA T0 + 0 
2c95 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
2c97 : 69 00 __ ADC #$00
2c99 : 85 44 __ STA T0 + 1 
2c9b : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
2c9d : a4 5b __ LDY T6 + 0 
2c9f : 91 57 __ STA (T4 + 0),y 
2ca1 : e6 5b __ INC T6 + 0 
2ca3 : a0 00 __ LDY #$00
2ca5 : b1 43 __ LDA (T0 + 0),y 
2ca7 : a8 __ __ TAY
2ca8 : e6 43 __ INC T0 + 0 
2caa : d0 02 __ BNE $2cae ; (sformat.s112 + 0)
.s111:
2cac : e6 44 __ INC T0 + 1 
.s112:
2cae : 98 __ __ TYA
2caf : d0 ec __ BNE $2c9d ; (sformat.l92 + 0)
.s51:
2cb1 : a5 59 __ LDA T5 + 0 
2cb3 : d0 03 __ BNE $2cb8 ; (sformat.s97 + 0)
2cb5 : 4c a4 29 JMP $29a4 ; (sformat.l5 + 0)
.s97:
2cb8 : a6 5c __ LDX T7 + 0 
2cba : ec d5 9f CPX $9fd5 ; (si.width + 0)
2cbd : a4 5b __ LDY T6 + 0 
2cbf : b0 0c __ BCS $2ccd ; (sformat.s102 + 0)
.l52:
2cc1 : ad d4 9f LDA $9fd4 ; (si.fill + 0)
2cc4 : 91 57 __ STA (T4 + 0),y 
2cc6 : c8 __ __ INY
2cc7 : e8 __ __ INX
2cc8 : ec d5 9f CPX $9fd5 ; (si.width + 0)
2ccb : 90 f4 __ BCC $2cc1 ; (sformat.l52 + 0)
.s102:
2ccd : 84 5b __ STY T6 + 0 
2ccf : 4c a4 29 JMP $29a4 ; (sformat.l5 + 0)
.s54:
2cd2 : a4 5b __ LDY T6 + 0 
2cd4 : f0 11 __ BEQ $2ce7 ; (sformat.s55 + 0)
.s56:
2cd6 : a5 57 __ LDA T4 + 0 
2cd8 : 85 0e __ STA P1 
2cda : a5 58 __ LDA T4 + 1 
2cdc : 85 0f __ STA P2 
2cde : a9 00 __ LDA #$00
2ce0 : 85 5b __ STA T6 + 0 
2ce2 : 91 0e __ STA (P1),y 
2ce4 : 20 d9 28 JSR $28d9 ; (puts.l4 + 0)
.s55:
2ce7 : a5 53 __ LDA T1 + 0 
2ce9 : 85 0e __ STA P1 
2ceb : a5 54 __ LDA T1 + 1 
2ced : 85 0f __ STA P2 
2cef : 20 d9 28 JSR $28d9 ; (puts.l4 + 0)
2cf2 : ad da 9f LDA $9fda ; (si.left + 0)
2cf5 : d0 c1 __ BNE $2cb8 ; (sformat.s97 + 0)
2cf7 : 4c a4 29 JMP $29a4 ; (sformat.l5 + 0)
.s60:
2cfa : ad f1 9f LDA $9ff1 ; (sstack + 5)
2cfd : 85 43 __ STA T0 + 0 
2cff : 69 03 __ ADC #$03
2d01 : 8d f1 9f STA $9ff1 ; (sstack + 5)
2d04 : ad f2 9f LDA $9ff2 ; (sstack + 6)
2d07 : 85 44 __ STA T0 + 1 
2d09 : 69 00 __ ADC #$00
2d0b : 8d f2 9f STA $9ff2 ; (sstack + 6)
2d0e : a0 00 __ LDY #$00
2d10 : b1 55 __ LDA (T3 + 0),y 
2d12 : aa __ __ TAX
2d13 : e6 55 __ INC T3 + 0 
2d15 : d0 02 __ BNE $2d19 ; (sformat.s110 + 0)
.s109:
2d17 : e6 56 __ INC T3 + 1 
.s110:
2d19 : b1 43 __ LDA (T0 + 0),y 
2d1b : 85 1b __ STA ACCU + 0 ; (buff + 1)
2d1d : 85 11 __ STA P4 
2d1f : a0 01 __ LDY #$01
2d21 : b1 43 __ LDA (T0 + 0),y 
2d23 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
2d25 : 85 12 __ STA P5 
2d27 : c8 __ __ INY
2d28 : b1 43 __ LDA (T0 + 0),y 
2d2a : 85 1d __ STA ACCU + 2 ; (fmt + 1)
2d2c : 85 13 __ STA P6 
2d2e : c8 __ __ INY
2d2f : b1 43 __ LDA (T0 + 0),y 
2d31 : 85 14 __ STA P7 
2d33 : e0 64 __ CPX #$64
2d35 : f0 0c __ BEQ $2d43 ; (sformat.s71 + 0)
.s61:
2d37 : e0 44 __ CPX #$44
2d39 : f0 08 __ BEQ $2d43 ; (sformat.s71 + 0)
.s62:
2d3b : e0 69 __ CPX #$69
2d3d : f0 04 __ BEQ $2d43 ; (sformat.s71 + 0)
.s63:
2d3f : e0 49 __ CPX #$49
2d41 : d0 1c __ BNE $2d5f ; (sformat.s64 + 0)
.s71:
2d43 : a9 01 __ LDA #$01
.s94:
2d45 : 85 15 __ STA P8 
.s69:
2d47 : a5 57 __ LDA T4 + 0 
2d49 : 85 0f __ STA P2 
2d4b : a5 58 __ LDA T4 + 1 
2d4d : 85 10 __ STA P3 
2d4f : a9 d4 __ LDA #$d4
2d51 : 85 0d __ STA P0 
2d53 : a9 9f __ LDA #$9f
2d55 : 85 0e __ STA P1 
2d57 : 20 41 2f JSR $2f41 ; (nforml.s4 + 0)
2d5a : a5 1b __ LDA ACCU + 0 ; (buff + 1)
2d5c : 4c 09 2c JMP $2c09 ; (sformat.s96 + 0)
.s64:
2d5f : e0 75 __ CPX #$75
2d61 : f0 04 __ BEQ $2d67 ; (sformat.s70 + 0)
.s65:
2d63 : e0 55 __ CPX #$55
2d65 : d0 04 __ BNE $2d6b ; (sformat.s66 + 0)
.s70:
2d67 : a9 00 __ LDA #$00
2d69 : f0 da __ BEQ $2d45 ; (sformat.s94 + 0)
.s66:
2d6b : e0 78 __ CPX #$78
2d6d : f0 06 __ BEQ $2d75 ; (sformat.s68 + 0)
.s67:
2d6f : 85 1e __ STA ACCU + 3 ; (fps + 0)
2d71 : e0 58 __ CPX #$58
2d73 : d0 82 __ BNE $2cf7 ; (sformat.s55 + 16)
.s68:
2d75 : a9 00 __ LDA #$00
2d77 : 85 15 __ STA P8 
2d79 : a9 10 __ LDA #$10
2d7b : 8d d8 9f STA $9fd8 ; (si.base + 0)
2d7e : 8a __ __ TXA
2d7f : 29 e0 __ AND #$e0
2d81 : 09 01 __ ORA #$01
2d83 : 8d d7 9f STA $9fd7 ; (si.cha + 0)
2d86 : 4c 47 2d JMP $2d47 ; (sformat.s69 + 0)
.s73:
2d89 : a5 57 __ LDA T4 + 0 
2d8b : 85 0f __ STA P2 
2d8d : a5 58 __ LDA T4 + 1 
2d8f : 85 10 __ STA P3 
2d91 : ad f1 9f LDA $9ff1 ; (sstack + 5)
2d94 : 85 43 __ STA T0 + 0 
2d96 : ad f2 9f LDA $9ff2 ; (sstack + 6)
2d99 : 85 44 __ STA T0 + 1 
2d9b : a0 00 __ LDY #$00
2d9d : b1 43 __ LDA (T0 + 0),y 
2d9f : 85 11 __ STA P4 
2da1 : c8 __ __ INY
2da2 : b1 43 __ LDA (T0 + 0),y 
2da4 : 85 12 __ STA P5 
2da6 : 18 __ __ CLC
2da7 : a5 43 __ LDA T0 + 0 
2da9 : 69 02 __ ADC #$02
2dab : 8d f1 9f STA $9ff1 ; (sstack + 5)
2dae : a5 44 __ LDA T0 + 1 
2db0 : 69 00 __ ADC #$00
2db2 : 8d f2 9f STA $9ff2 ; (sstack + 6)
2db5 : a9 d4 __ LDA #$d4
2db7 : 85 0d __ STA P0 
2db9 : a9 9f __ LDA #$9f
2dbb : 85 0e __ STA P1 
2dbd : 20 26 2e JSR $2e26 ; (nformi.s4 + 0)
2dc0 : 4c 09 2c JMP $2c09 ; (sformat.s96 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
2dc3 : 85 0d __ STA P0 ; (c + 0)
2dc5 : ad ff 28 LDA $28ff ; (giocharmap + 0)
2dc8 : f0 32 __ BEQ $2dfc ; (putpch.s5 + 0)
.s6:
2dca : a5 0d __ LDA P0 ; (c + 0)
2dcc : c9 0a __ CMP #$0a
2dce : d0 04 __ BNE $2dd4 ; (putpch.s7 + 0)
.s18:
2dd0 : a9 0d __ LDA #$0d
2dd2 : d0 32 __ BNE $2e06 ; (putpch.s15 + 0)
.s7:
2dd4 : c9 09 __ CMP #$09
2dd6 : f0 36 __ BEQ $2e0e ; (putpch.s16 + 0)
.s8:
2dd8 : ad ff 28 LDA $28ff ; (giocharmap + 0)
2ddb : c9 02 __ CMP #$02
2ddd : 90 1d __ BCC $2dfc ; (putpch.s5 + 0)
.s9:
2ddf : a5 0d __ LDA P0 ; (c + 0)
2de1 : c9 41 __ CMP #$41
2de3 : 90 17 __ BCC $2dfc ; (putpch.s5 + 0)
.s10:
2de5 : c9 7b __ CMP #$7b
2de7 : b0 13 __ BCS $2dfc ; (putpch.s5 + 0)
.s11:
2de9 : c9 61 __ CMP #$61
2deb : b0 04 __ BCS $2df1 ; (putpch.s13 + 0)
.s12:
2ded : c9 5b __ CMP #$5b
2def : b0 0b __ BCS $2dfc ; (putpch.s5 + 0)
.s13:
2df1 : 49 20 __ EOR #$20
2df3 : 85 0d __ STA P0 ; (c + 0)
2df5 : ad ff 28 LDA $28ff ; (giocharmap + 0)
2df8 : c9 02 __ CMP #$02
2dfa : f0 06 __ BEQ $2e02 ; (putpch.s14 + 0)
.s5:
2dfc : a5 0d __ LDA P0 ; (c + 0)
2dfe : 20 d2 ff JSR $ffd2 
.s3:
2e01 : 60 __ __ RTS
.s14:
2e02 : a5 0d __ LDA P0 ; (c + 0)
2e04 : 29 5f __ AND #$5f
.s15:
2e06 : 85 43 __ STA T0 + 0 
2e08 : a5 43 __ LDA T0 + 0 
2e0a : 20 d2 ff JSR $ffd2 
2e0d : 60 __ __ RTS
.s16:
2e0e : a5 d3 __ LDA $d3 
2e10 : 29 03 __ AND #$03
2e12 : 85 43 __ STA T0 + 0 
2e14 : a9 20 __ LDA #$20
2e16 : 85 44 __ STA T1 + 0 
.l17:
2e18 : a5 44 __ LDA T1 + 0 
2e1a : 20 d2 ff JSR $ffd2 
2e1d : e6 43 __ INC T0 + 0 
2e1f : a5 43 __ LDA T0 + 0 
2e21 : c9 04 __ CMP #$04
2e23 : 90 f3 __ BCC $2e18 ; (putpch.l17 + 0)
2e25 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
2e26 : a9 00 __ LDA #$00
2e28 : 85 43 __ STA T5 + 0 
2e2a : a0 04 __ LDY #$04
2e2c : b1 0d __ LDA (P0),y ; (si + 0)
2e2e : 85 44 __ STA T6 + 0 
2e30 : a5 13 __ LDA P6 ; (s + 0)
2e32 : f0 13 __ BEQ $2e47 ; (nformi.s5 + 0)
.s33:
2e34 : 24 12 __ BIT P5 ; (v + 1)
2e36 : 10 0f __ BPL $2e47 ; (nformi.s5 + 0)
.s34:
2e38 : 38 __ __ SEC
2e39 : a9 00 __ LDA #$00
2e3b : e5 11 __ SBC P4 ; (v + 0)
2e3d : 85 11 __ STA P4 ; (v + 0)
2e3f : a9 00 __ LDA #$00
2e41 : e5 12 __ SBC P5 ; (v + 1)
2e43 : 85 12 __ STA P5 ; (v + 1)
2e45 : e6 43 __ INC T5 + 0 
.s5:
2e47 : a9 10 __ LDA #$10
2e49 : 85 45 __ STA T7 + 0 
2e4b : a5 11 __ LDA P4 ; (v + 0)
2e4d : 05 12 __ ORA P5 ; (v + 1)
2e4f : f0 33 __ BEQ $2e84 ; (nformi.s6 + 0)
.s28:
2e51 : a5 11 __ LDA P4 ; (v + 0)
2e53 : 85 1b __ STA ACCU + 0 
2e55 : a5 12 __ LDA P5 ; (v + 1)
2e57 : 85 1c __ STA ACCU + 1 
.l29:
2e59 : a5 44 __ LDA T6 + 0 
2e5b : 85 03 __ STA WORK + 0 
2e5d : a9 00 __ LDA #$00
2e5f : 85 04 __ STA WORK + 1 
2e61 : 20 c8 3d JSR $3dc8 ; (divmod + 0)
2e64 : a5 05 __ LDA WORK + 2 
2e66 : c9 0a __ CMP #$0a
2e68 : b0 04 __ BCS $2e6e ; (nformi.s32 + 0)
.s30:
2e6a : a9 30 __ LDA #$30
2e6c : 90 06 __ BCC $2e74 ; (nformi.s31 + 0)
.s32:
2e6e : a0 03 __ LDY #$03
2e70 : b1 0d __ LDA (P0),y ; (si + 0)
2e72 : e9 0a __ SBC #$0a
.s31:
2e74 : 18 __ __ CLC
2e75 : 65 05 __ ADC WORK + 2 
2e77 : a6 45 __ LDX T7 + 0 
2e79 : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
2e7c : c6 45 __ DEC T7 + 0 
2e7e : a5 1b __ LDA ACCU + 0 
2e80 : 05 1c __ ORA ACCU + 1 
2e82 : d0 d5 __ BNE $2e59 ; (nformi.l29 + 0)
.s6:
2e84 : a0 02 __ LDY #$02
2e86 : b1 0d __ LDA (P0),y ; (si + 0)
2e88 : c9 ff __ CMP #$ff
2e8a : d0 04 __ BNE $2e90 ; (nformi.s27 + 0)
.s7:
2e8c : a9 0f __ LDA #$0f
2e8e : d0 05 __ BNE $2e95 ; (nformi.s39 + 0)
.s27:
2e90 : 38 __ __ SEC
2e91 : a9 10 __ LDA #$10
2e93 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
2e95 : a8 __ __ TAY
2e96 : c4 45 __ CPY T7 + 0 
2e98 : b0 0d __ BCS $2ea7 ; (nformi.s8 + 0)
.s26:
2e9a : a9 30 __ LDA #$30
.l40:
2e9c : a6 45 __ LDX T7 + 0 
2e9e : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
2ea1 : c6 45 __ DEC T7 + 0 
2ea3 : c4 45 __ CPY T7 + 0 
2ea5 : 90 f5 __ BCC $2e9c ; (nformi.l40 + 0)
.s8:
2ea7 : a0 07 __ LDY #$07
2ea9 : b1 0d __ LDA (P0),y ; (si + 0)
2eab : f0 1c __ BEQ $2ec9 ; (nformi.s9 + 0)
.s24:
2ead : a5 44 __ LDA T6 + 0 
2eaf : c9 10 __ CMP #$10
2eb1 : d0 16 __ BNE $2ec9 ; (nformi.s9 + 0)
.s25:
2eb3 : a0 03 __ LDY #$03
2eb5 : b1 0d __ LDA (P0),y ; (si + 0)
2eb7 : a8 __ __ TAY
2eb8 : a9 30 __ LDA #$30
2eba : a6 45 __ LDX T7 + 0 
2ebc : ca __ __ DEX
2ebd : ca __ __ DEX
2ebe : 86 45 __ STX T7 + 0 
2ec0 : 9d dc 9f STA $9fdc,x ; (buffer[0] + 0)
2ec3 : 98 __ __ TYA
2ec4 : 69 16 __ ADC #$16
2ec6 : 9d dd 9f STA $9fdd,x ; (buffer[0] + 1)
.s9:
2ec9 : a9 00 __ LDA #$00
2ecb : 85 1b __ STA ACCU + 0 
2ecd : a5 43 __ LDA T5 + 0 
2ecf : f0 0c __ BEQ $2edd ; (nformi.s10 + 0)
.s23:
2ed1 : a9 2d __ LDA #$2d
.s22:
2ed3 : a6 45 __ LDX T7 + 0 
2ed5 : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
2ed8 : c6 45 __ DEC T7 + 0 
2eda : 4c e7 2e JMP $2ee7 ; (nformi.s11 + 0)
.s10:
2edd : a0 05 __ LDY #$05
2edf : b1 0d __ LDA (P0),y ; (si + 0)
2ee1 : f0 04 __ BEQ $2ee7 ; (nformi.s11 + 0)
.s21:
2ee3 : a9 2b __ LDA #$2b
2ee5 : d0 ec __ BNE $2ed3 ; (nformi.s22 + 0)
.s11:
2ee7 : a6 45 __ LDX T7 + 0 
2ee9 : a0 06 __ LDY #$06
2eeb : b1 0d __ LDA (P0),y ; (si + 0)
2eed : d0 2b __ BNE $2f1a ; (nformi.s17 + 0)
.l12:
2eef : 8a __ __ TXA
2ef0 : 18 __ __ CLC
2ef1 : a0 01 __ LDY #$01
2ef3 : 71 0d __ ADC (P0),y ; (si + 0)
2ef5 : b0 04 __ BCS $2efb ; (nformi.s15 + 0)
.s16:
2ef7 : c9 11 __ CMP #$11
2ef9 : 90 0a __ BCC $2f05 ; (nformi.s13 + 0)
.s15:
2efb : a0 00 __ LDY #$00
2efd : b1 0d __ LDA (P0),y ; (si + 0)
2eff : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
2f02 : ca __ __ DEX
2f03 : b0 ea __ BCS $2eef ; (nformi.l12 + 0)
.s13:
2f05 : e0 10 __ CPX #$10
2f07 : b0 0e __ BCS $2f17 ; (nformi.s41 + 0)
.s14:
2f09 : 88 __ __ DEY
.l37:
2f0a : bd dc 9f LDA $9fdc,x ; (buffer[0] + 0)
2f0d : 91 0f __ STA (P2),y ; (str + 0)
2f0f : c8 __ __ INY
2f10 : e8 __ __ INX
2f11 : e0 10 __ CPX #$10
2f13 : 90 f5 __ BCC $2f0a ; (nformi.l37 + 0)
.s38:
2f15 : 84 1b __ STY ACCU + 0 
.s41:
2f17 : a5 1b __ LDA ACCU + 0 
.s3:
2f19 : 60 __ __ RTS
.s17:
2f1a : e0 10 __ CPX #$10
2f1c : b0 1a __ BCS $2f38 ; (nformi.l18 + 0)
.s20:
2f1e : a0 00 __ LDY #$00
.l35:
2f20 : bd dc 9f LDA $9fdc,x ; (buffer[0] + 0)
2f23 : 91 0f __ STA (P2),y ; (str + 0)
2f25 : c8 __ __ INY
2f26 : e8 __ __ INX
2f27 : e0 10 __ CPX #$10
2f29 : 90 f5 __ BCC $2f20 ; (nformi.l35 + 0)
.s36:
2f2b : 84 1b __ STY ACCU + 0 
2f2d : b0 09 __ BCS $2f38 ; (nformi.l18 + 0)
.s19:
2f2f : 88 __ __ DEY
2f30 : b1 0d __ LDA (P0),y ; (si + 0)
2f32 : a4 1b __ LDY ACCU + 0 
2f34 : 91 0f __ STA (P2),y ; (str + 0)
2f36 : e6 1b __ INC ACCU + 0 
.l18:
2f38 : a5 1b __ LDA ACCU + 0 
2f3a : a0 01 __ LDY #$01
2f3c : d1 0d __ CMP (P0),y ; (si + 0)
2f3e : 90 ef __ BCC $2f2f ; (nformi.s19 + 0)
2f40 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
2f41 : a9 00 __ LDA #$00
2f43 : 85 43 __ STA T4 + 0 
2f45 : a5 15 __ LDA P8 ; (s + 0)
2f47 : f0 1f __ BEQ $2f68 ; (nforml.s5 + 0)
.s35:
2f49 : 24 14 __ BIT P7 ; (v + 3)
2f4b : 10 1b __ BPL $2f68 ; (nforml.s5 + 0)
.s36:
2f4d : 38 __ __ SEC
2f4e : a9 00 __ LDA #$00
2f50 : e5 11 __ SBC P4 ; (v + 0)
2f52 : 85 11 __ STA P4 ; (v + 0)
2f54 : a9 00 __ LDA #$00
2f56 : e5 12 __ SBC P5 ; (v + 1)
2f58 : 85 12 __ STA P5 ; (v + 1)
2f5a : a9 00 __ LDA #$00
2f5c : e5 13 __ SBC P6 ; (v + 2)
2f5e : 85 13 __ STA P6 ; (v + 2)
2f60 : a9 00 __ LDA #$00
2f62 : e5 14 __ SBC P7 ; (v + 3)
2f64 : 85 14 __ STA P7 ; (v + 3)
2f66 : e6 43 __ INC T4 + 0 
.s5:
2f68 : a9 10 __ LDA #$10
2f6a : 85 44 __ STA T5 + 0 
2f6c : a5 14 __ LDA P7 ; (v + 3)
2f6e : f0 03 __ BEQ $2f73 ; (nforml.s31 + 0)
2f70 : 4c 3b 30 JMP $303b ; (nforml.l28 + 0)
.s31:
2f73 : a5 13 __ LDA P6 ; (v + 2)
2f75 : d0 f9 __ BNE $2f70 ; (nforml.s5 + 8)
.s32:
2f77 : a5 12 __ LDA P5 ; (v + 1)
2f79 : d0 f5 __ BNE $2f70 ; (nforml.s5 + 8)
.s33:
2f7b : c5 11 __ CMP P4 ; (v + 0)
2f7d : 90 f1 __ BCC $2f70 ; (nforml.s5 + 8)
.s6:
2f7f : a0 02 __ LDY #$02
2f81 : b1 0d __ LDA (P0),y ; (si + 0)
2f83 : c9 ff __ CMP #$ff
2f85 : d0 04 __ BNE $2f8b ; (nforml.s27 + 0)
.s7:
2f87 : a9 0f __ LDA #$0f
2f89 : d0 05 __ BNE $2f90 ; (nforml.s41 + 0)
.s27:
2f8b : 38 __ __ SEC
2f8c : a9 10 __ LDA #$10
2f8e : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
2f90 : a8 __ __ TAY
2f91 : c4 44 __ CPY T5 + 0 
2f93 : b0 0d __ BCS $2fa2 ; (nforml.s8 + 0)
.s26:
2f95 : a9 30 __ LDA #$30
.l42:
2f97 : a6 44 __ LDX T5 + 0 
2f99 : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
2f9c : c6 44 __ DEC T5 + 0 
2f9e : c4 44 __ CPY T5 + 0 
2fa0 : 90 f5 __ BCC $2f97 ; (nforml.l42 + 0)
.s8:
2fa2 : a0 07 __ LDY #$07
2fa4 : b1 0d __ LDA (P0),y ; (si + 0)
2fa6 : f0 1d __ BEQ $2fc5 ; (nforml.s9 + 0)
.s24:
2fa8 : a0 04 __ LDY #$04
2faa : b1 0d __ LDA (P0),y ; (si + 0)
2fac : c9 10 __ CMP #$10
2fae : d0 15 __ BNE $2fc5 ; (nforml.s9 + 0)
.s25:
2fb0 : 88 __ __ DEY
2fb1 : b1 0d __ LDA (P0),y ; (si + 0)
2fb3 : a8 __ __ TAY
2fb4 : a9 30 __ LDA #$30
2fb6 : a6 44 __ LDX T5 + 0 
2fb8 : ca __ __ DEX
2fb9 : ca __ __ DEX
2fba : 86 44 __ STX T5 + 0 
2fbc : 9d dc 9f STA $9fdc,x ; (buffer[0] + 0)
2fbf : 98 __ __ TYA
2fc0 : 69 16 __ ADC #$16
2fc2 : 9d dd 9f STA $9fdd,x ; (buffer[0] + 1)
.s9:
2fc5 : a9 00 __ LDA #$00
2fc7 : 85 1b __ STA ACCU + 0 
2fc9 : a5 43 __ LDA T4 + 0 
2fcb : f0 0c __ BEQ $2fd9 ; (nforml.s10 + 0)
.s23:
2fcd : a9 2d __ LDA #$2d
.s22:
2fcf : a6 44 __ LDX T5 + 0 
2fd1 : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
2fd4 : c6 44 __ DEC T5 + 0 
2fd6 : 4c e3 2f JMP $2fe3 ; (nforml.s11 + 0)
.s10:
2fd9 : a0 05 __ LDY #$05
2fdb : b1 0d __ LDA (P0),y ; (si + 0)
2fdd : f0 04 __ BEQ $2fe3 ; (nforml.s11 + 0)
.s21:
2fdf : a9 2b __ LDA #$2b
2fe1 : d0 ec __ BNE $2fcf ; (nforml.s22 + 0)
.s11:
2fe3 : a0 06 __ LDY #$06
2fe5 : a6 44 __ LDX T5 + 0 
2fe7 : b1 0d __ LDA (P0),y ; (si + 0)
2fe9 : d0 29 __ BNE $3014 ; (nforml.s17 + 0)
.l12:
2feb : 8a __ __ TXA
2fec : 18 __ __ CLC
2fed : a0 01 __ LDY #$01
2fef : 71 0d __ ADC (P0),y ; (si + 0)
2ff1 : b0 04 __ BCS $2ff7 ; (nforml.s15 + 0)
.s16:
2ff3 : c9 11 __ CMP #$11
2ff5 : 90 0a __ BCC $3001 ; (nforml.s13 + 0)
.s15:
2ff7 : a0 00 __ LDY #$00
2ff9 : b1 0d __ LDA (P0),y ; (si + 0)
2ffb : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
2ffe : ca __ __ DEX
2fff : b0 ea __ BCS $2feb ; (nforml.l12 + 0)
.s13:
3001 : e0 10 __ CPX #$10
3003 : b0 0e __ BCS $3013 ; (nforml.s3 + 0)
.s14:
3005 : 88 __ __ DEY
.l39:
3006 : bd dc 9f LDA $9fdc,x ; (buffer[0] + 0)
3009 : 91 0f __ STA (P2),y ; (str + 0)
300b : c8 __ __ INY
300c : e8 __ __ INX
300d : e0 10 __ CPX #$10
300f : 90 f5 __ BCC $3006 ; (nforml.l39 + 0)
.s40:
3011 : 84 1b __ STY ACCU + 0 
.s3:
3013 : 60 __ __ RTS
.s17:
3014 : e0 10 __ CPX #$10
3016 : b0 1a __ BCS $3032 ; (nforml.l18 + 0)
.s20:
3018 : a0 00 __ LDY #$00
.l37:
301a : bd dc 9f LDA $9fdc,x ; (buffer[0] + 0)
301d : 91 0f __ STA (P2),y ; (str + 0)
301f : c8 __ __ INY
3020 : e8 __ __ INX
3021 : e0 10 __ CPX #$10
3023 : 90 f5 __ BCC $301a ; (nforml.l37 + 0)
.s38:
3025 : 84 1b __ STY ACCU + 0 
3027 : b0 09 __ BCS $3032 ; (nforml.l18 + 0)
.s19:
3029 : 88 __ __ DEY
302a : b1 0d __ LDA (P0),y ; (si + 0)
302c : a4 1b __ LDY ACCU + 0 
302e : 91 0f __ STA (P2),y ; (str + 0)
3030 : e6 1b __ INC ACCU + 0 
.l18:
3032 : a5 1b __ LDA ACCU + 0 
3034 : a0 01 __ LDY #$01
3036 : d1 0d __ CMP (P0),y ; (si + 0)
3038 : 90 ef __ BCC $3029 ; (nforml.s19 + 0)
303a : 60 __ __ RTS
.l28:
303b : a0 04 __ LDY #$04
303d : b1 0d __ LDA (P0),y ; (si + 0)
303f : 85 03 __ STA WORK + 0 
3041 : a5 11 __ LDA P4 ; (v + 0)
3043 : 85 1b __ STA ACCU + 0 
3045 : a5 12 __ LDA P5 ; (v + 1)
3047 : 85 1c __ STA ACCU + 1 
3049 : a5 13 __ LDA P6 ; (v + 2)
304b : 85 1d __ STA ACCU + 2 
304d : a5 14 __ LDA P7 ; (v + 3)
304f : 85 1e __ STA ACCU + 3 
3051 : a9 00 __ LDA #$00
3053 : 85 04 __ STA WORK + 1 
3055 : 85 05 __ STA WORK + 2 
3057 : 85 06 __ STA WORK + 3 
3059 : 20 0d 3f JSR $3f0d ; (divmod32 + 0)
305c : a5 07 __ LDA WORK + 4 
305e : c9 0a __ CMP #$0a
3060 : b0 04 __ BCS $3066 ; (nforml.s34 + 0)
.s29:
3062 : a9 30 __ LDA #$30
3064 : 90 06 __ BCC $306c ; (nforml.s30 + 0)
.s34:
3066 : a0 03 __ LDY #$03
3068 : b1 0d __ LDA (P0),y ; (si + 0)
306a : e9 0a __ SBC #$0a
.s30:
306c : 18 __ __ CLC
306d : 65 07 __ ADC WORK + 4 
306f : a6 44 __ LDX T5 + 0 
3071 : 9d db 9f STA $9fdb,x ; (si.prefix + 0)
3074 : c6 44 __ DEC T5 + 0 
3076 : a5 1b __ LDA ACCU + 0 
3078 : 85 11 __ STA P4 ; (v + 0)
307a : a5 1c __ LDA ACCU + 1 
307c : 85 12 __ STA P5 ; (v + 1)
307e : a5 1d __ LDA ACCU + 2 
3080 : 85 13 __ STA P6 ; (v + 2)
3082 : a5 1e __ LDA ACCU + 3 
3084 : 85 14 __ STA P7 ; (v + 3)
3086 : d0 b3 __ BNE $303b ; (nforml.l28 + 0)
3088 : 4c 73 2f JMP $2f73 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
308b : a2 03 __ LDX #$03
308d : b5 53 __ LDA T7 + 0,x 
308f : 9d e3 9f STA $9fe3,x ; (nformf@stack + 0)
3092 : ca __ __ DEX
3093 : 10 f8 __ BPL $308d ; (nformf.s1 + 2)
.s4:
3095 : a5 16 __ LDA P9 ; (f + 1)
3097 : 85 44 __ STA T0 + 1 
3099 : a5 17 __ LDA P10 ; (f + 2)
309b : 85 45 __ STA T0 + 2 
309d : a5 18 __ LDA P11 ; (f + 3)
309f : 29 7f __ AND #$7f
30a1 : 05 17 __ ORA P10 ; (f + 2)
30a3 : 05 16 __ ORA P9 ; (f + 1)
30a5 : 05 15 __ ORA P8 ; (f + 0)
30a7 : f0 21 __ BEQ $30ca ; (nformf.s5 + 0)
.s107:
30a9 : 24 18 __ BIT P11 ; (f + 3)
30ab : 10 1d __ BPL $30ca ; (nformf.s5 + 0)
.s106:
30ad : a9 2d __ LDA #$2d
30af : a0 00 __ LDY #$00
30b1 : 91 13 __ STA (P6),y ; (str + 0)
30b3 : a5 18 __ LDA P11 ; (f + 3)
30b5 : 49 80 __ EOR #$80
30b7 : 85 10 __ STA P3 
30b9 : 85 18 __ STA P11 ; (f + 3)
30bb : a5 15 __ LDA P8 ; (f + 0)
30bd : 85 0d __ STA P0 
30bf : a5 16 __ LDA P9 ; (f + 1)
30c1 : 85 0e __ STA P1 
30c3 : a5 17 __ LDA P10 ; (f + 2)
30c5 : 85 0f __ STA P2 
30c7 : 4c de 35 JMP $35de ; (nformf.s104 + 0)
.s5:
30ca : a5 15 __ LDA P8 ; (f + 0)
30cc : 85 0d __ STA P0 
30ce : a5 16 __ LDA P9 ; (f + 1)
30d0 : 85 0e __ STA P1 
30d2 : a5 17 __ LDA P10 ; (f + 2)
30d4 : 85 0f __ STA P2 
30d6 : a5 18 __ LDA P11 ; (f + 3)
30d8 : 85 10 __ STA P3 
30da : a0 05 __ LDY #$05
30dc : b1 11 __ LDA (P4),y ; (si + 0)
30de : f0 09 __ BEQ $30e9 ; (nformf.s6 + 0)
.s103:
30e0 : a9 2b __ LDA #$2b
30e2 : a0 00 __ LDY #$00
30e4 : 91 13 __ STA (P6),y ; (str + 0)
30e6 : 4c de 35 JMP $35de ; (nformf.s104 + 0)
.s6:
30e9 : 20 ec 28 JSR $28ec ; (isinf.s4 + 0)
30ec : a2 00 __ LDX #$00
30ee : 86 54 __ STX T9 + 0 
30f0 : a8 __ __ TAY
30f1 : f0 05 __ BEQ $30f8 ; (nformf.s7 + 0)
.s101:
30f3 : a9 02 __ LDA #$02
30f5 : 4c ae 35 JMP $35ae ; (nformf.s102 + 0)
.s7:
30f8 : a5 11 __ LDA P4 ; (si + 0)
30fa : 85 4b __ STA T2 + 0 
30fc : a5 12 __ LDA P5 ; (si + 1)
30fe : 85 4c __ STA T2 + 1 
3100 : a0 02 __ LDY #$02
3102 : b1 11 __ LDA (P4),y ; (si + 0)
3104 : c9 ff __ CMP #$ff
3106 : d0 02 __ BNE $310a ; (nformf.s100 + 0)
.s8:
3108 : a9 06 __ LDA #$06
.s100:
310a : 85 4d __ STA T3 + 0 
310c : 85 52 __ STA T6 + 0 
310e : a9 00 __ LDA #$00
3110 : 85 4f __ STA T4 + 0 
3112 : 85 50 __ STA T4 + 1 
3114 : a5 18 __ LDA P11 ; (f + 3)
3116 : 85 46 __ STA T0 + 3 
3118 : 29 7f __ AND #$7f
311a : 05 17 __ ORA P10 ; (f + 2)
311c : 05 16 __ ORA P9 ; (f + 1)
311e : a6 15 __ LDX P8 ; (f + 0)
3120 : 86 43 __ STX T0 + 0 
3122 : 05 15 __ ORA P8 ; (f + 0)
3124 : d0 03 __ BNE $3129 ; (nformf.s67 + 0)
3126 : 4c 5d 32 JMP $325d ; (nformf.s9 + 0)
.s67:
3129 : a5 18 __ LDA P11 ; (f + 3)
312b : 10 03 __ BPL $3130 ; (nformf.s95 + 0)
312d : 4c af 31 JMP $31af ; (nformf.l80 + 0)
.s95:
3130 : c9 44 __ CMP #$44
3132 : d0 0d __ BNE $3141 ; (nformf.l99 + 0)
.s96:
3134 : a5 17 __ LDA P10 ; (f + 2)
3136 : c9 7a __ CMP #$7a
3138 : d0 07 __ BNE $3141 ; (nformf.l99 + 0)
.s97:
313a : a5 16 __ LDA P9 ; (f + 1)
313c : d0 03 __ BNE $3141 ; (nformf.l99 + 0)
.s98:
313e : 8a __ __ TXA
313f : f0 02 __ BEQ $3143 ; (nformf.l90 + 0)
.l99:
3141 : 90 54 __ BCC $3197 ; (nformf.s68 + 0)
.l90:
3143 : 18 __ __ CLC
3144 : a5 4f __ LDA T4 + 0 
3146 : 69 03 __ ADC #$03
3148 : 85 4f __ STA T4 + 0 
314a : 90 02 __ BCC $314e ; (nformf.s121 + 0)
.s120:
314c : e6 50 __ INC T4 + 1 
.s121:
314e : a5 43 __ LDA T0 + 0 
3150 : 85 1b __ STA ACCU + 0 
3152 : a5 44 __ LDA T0 + 1 
3154 : 85 1c __ STA ACCU + 1 
3156 : a5 45 __ LDA T0 + 2 
3158 : 85 1d __ STA ACCU + 2 
315a : a5 46 __ LDA T0 + 3 
315c : 85 1e __ STA ACCU + 3 
315e : a9 00 __ LDA #$00
3160 : 85 03 __ STA WORK + 0 
3162 : 85 04 __ STA WORK + 1 
3164 : a9 7a __ LDA #$7a
3166 : 85 05 __ STA WORK + 2 
3168 : a9 44 __ LDA #$44
316a : 85 06 __ STA WORK + 3 
316c : 20 c6 3a JSR $3ac6 ; (freg + 20)
316f : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
3172 : a5 1b __ LDA ACCU + 0 
3174 : 85 43 __ STA T0 + 0 
3176 : a5 1c __ LDA ACCU + 1 
3178 : 85 44 __ STA T0 + 1 
317a : a6 1d __ LDX ACCU + 2 
317c : 86 45 __ STX T0 + 2 
317e : a5 1e __ LDA ACCU + 3 
3180 : 85 46 __ STA T0 + 3 
3182 : 30 13 __ BMI $3197 ; (nformf.s68 + 0)
.s91:
3184 : c9 44 __ CMP #$44
3186 : d0 b9 __ BNE $3141 ; (nformf.l99 + 0)
.s92:
3188 : e0 7a __ CPX #$7a
318a : d0 b5 __ BNE $3141 ; (nformf.l99 + 0)
.s93:
318c : a5 1c __ LDA ACCU + 1 
318e : 38 __ __ SEC
318f : d0 b0 __ BNE $3141 ; (nformf.l99 + 0)
.s94:
3191 : a5 1b __ LDA ACCU + 0 
3193 : f0 ae __ BEQ $3143 ; (nformf.l90 + 0)
3195 : d0 aa __ BNE $3141 ; (nformf.l99 + 0)
.s68:
3197 : a5 46 __ LDA T0 + 3 
3199 : 30 14 __ BMI $31af ; (nformf.l80 + 0)
.s86:
319b : c9 3f __ CMP #$3f
319d : d0 0e __ BNE $31ad ; (nformf.s85 + 0)
.s87:
319f : a5 45 __ LDA T0 + 2 
31a1 : c9 80 __ CMP #$80
31a3 : d0 08 __ BNE $31ad ; (nformf.s85 + 0)
.s88:
31a5 : a5 44 __ LDA T0 + 1 
31a7 : d0 04 __ BNE $31ad ; (nformf.s85 + 0)
.s89:
31a9 : a5 43 __ LDA T0 + 0 
31ab : f0 49 __ BEQ $31f6 ; (nformf.s69 + 0)
.s85:
31ad : b0 47 __ BCS $31f6 ; (nformf.s69 + 0)
.l80:
31af : 38 __ __ SEC
31b0 : a5 4f __ LDA T4 + 0 
31b2 : e9 03 __ SBC #$03
31b4 : 85 4f __ STA T4 + 0 
31b6 : b0 02 __ BCS $31ba ; (nformf.s116 + 0)
.s115:
31b8 : c6 50 __ DEC T4 + 1 
.s116:
31ba : a9 00 __ LDA #$00
31bc : 85 1b __ STA ACCU + 0 
31be : 85 1c __ STA ACCU + 1 
31c0 : a9 7a __ LDA #$7a
31c2 : 85 1d __ STA ACCU + 2 
31c4 : a9 44 __ LDA #$44
31c6 : 85 1e __ STA ACCU + 3 
31c8 : a2 43 __ LDX #$43
31ca : 20 b6 3a JSR $3ab6 ; (freg + 4)
31cd : 20 e4 3b JSR $3be4 ; (crt_fmul + 0)
31d0 : a5 1b __ LDA ACCU + 0 
31d2 : 85 43 __ STA T0 + 0 
31d4 : a5 1c __ LDA ACCU + 1 
31d6 : 85 44 __ STA T0 + 1 
31d8 : a6 1d __ LDX ACCU + 2 
31da : 86 45 __ STX T0 + 2 
31dc : a5 1e __ LDA ACCU + 3 
31de : 85 46 __ STA T0 + 3 
31e0 : 30 cd __ BMI $31af ; (nformf.l80 + 0)
.s81:
31e2 : c9 3f __ CMP #$3f
31e4 : 90 c9 __ BCC $31af ; (nformf.l80 + 0)
.s122:
31e6 : d0 0e __ BNE $31f6 ; (nformf.s69 + 0)
.s82:
31e8 : e0 80 __ CPX #$80
31ea : 90 c3 __ BCC $31af ; (nformf.l80 + 0)
.s123:
31ec : d0 08 __ BNE $31f6 ; (nformf.s69 + 0)
.s83:
31ee : a5 1c __ LDA ACCU + 1 
31f0 : d0 bb __ BNE $31ad ; (nformf.s85 + 0)
.s84:
31f2 : a5 1b __ LDA ACCU + 0 
31f4 : d0 b7 __ BNE $31ad ; (nformf.s85 + 0)
.s69:
31f6 : a5 46 __ LDA T0 + 3 
31f8 : 30 63 __ BMI $325d ; (nformf.s9 + 0)
.s75:
31fa : c9 41 __ CMP #$41
31fc : d0 0e __ BNE $320c ; (nformf.l79 + 0)
.s76:
31fe : a5 45 __ LDA T0 + 2 
3200 : c9 20 __ CMP #$20
3202 : d0 08 __ BNE $320c ; (nformf.l79 + 0)
.s77:
3204 : a5 44 __ LDA T0 + 1 
3206 : d0 04 __ BNE $320c ; (nformf.l79 + 0)
.s78:
3208 : a5 43 __ LDA T0 + 0 
320a : f0 02 __ BEQ $320e ; (nformf.l70 + 0)
.l79:
320c : 90 4f __ BCC $325d ; (nformf.s9 + 0)
.l70:
320e : e6 4f __ INC T4 + 0 
3210 : d0 02 __ BNE $3214 ; (nformf.s119 + 0)
.s118:
3212 : e6 50 __ INC T4 + 1 
.s119:
3214 : a5 43 __ LDA T0 + 0 
3216 : 85 1b __ STA ACCU + 0 
3218 : a5 44 __ LDA T0 + 1 
321a : 85 1c __ STA ACCU + 1 
321c : a5 45 __ LDA T0 + 2 
321e : 85 1d __ STA ACCU + 2 
3220 : a5 46 __ LDA T0 + 3 
3222 : 85 1e __ STA ACCU + 3 
3224 : a9 00 __ LDA #$00
3226 : 85 03 __ STA WORK + 0 
3228 : 85 04 __ STA WORK + 1 
322a : a9 20 __ LDA #$20
322c : 85 05 __ STA WORK + 2 
322e : a9 41 __ LDA #$41
3230 : 85 06 __ STA WORK + 3 
3232 : 20 c6 3a JSR $3ac6 ; (freg + 20)
3235 : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
3238 : a5 1b __ LDA ACCU + 0 
323a : 85 43 __ STA T0 + 0 
323c : a5 1c __ LDA ACCU + 1 
323e : 85 44 __ STA T0 + 1 
3240 : a6 1d __ LDX ACCU + 2 
3242 : 86 45 __ STX T0 + 2 
3244 : a5 1e __ LDA ACCU + 3 
3246 : 85 46 __ STA T0 + 3 
3248 : 30 13 __ BMI $325d ; (nformf.s9 + 0)
.s71:
324a : c9 41 __ CMP #$41
324c : d0 be __ BNE $320c ; (nformf.l79 + 0)
.s72:
324e : e0 20 __ CPX #$20
3250 : d0 ba __ BNE $320c ; (nformf.l79 + 0)
.s73:
3252 : a5 1c __ LDA ACCU + 1 
3254 : 38 __ __ SEC
3255 : d0 b5 __ BNE $320c ; (nformf.l79 + 0)
.s74:
3257 : a5 1b __ LDA ACCU + 0 
3259 : f0 b3 __ BEQ $320e ; (nformf.l70 + 0)
325b : d0 af __ BNE $320c ; (nformf.l79 + 0)
.s9:
325d : ad ec 9f LDA $9fec ; (sstack + 0)
3260 : c9 65 __ CMP #$65
3262 : d0 04 __ BNE $3268 ; (nformf.s11 + 0)
.s10:
3264 : a9 01 __ LDA #$01
3266 : d0 02 __ BNE $326a ; (nformf.s12 + 0)
.s11:
3268 : a9 00 __ LDA #$00
.s12:
326a : 85 55 __ STA T10 + 0 
326c : a6 4d __ LDX T3 + 0 
326e : e8 __ __ INX
326f : 86 51 __ STX T5 + 0 
3271 : ad ec 9f LDA $9fec ; (sstack + 0)
3274 : c9 67 __ CMP #$67
3276 : d0 13 __ BNE $328b ; (nformf.s13 + 0)
.s63:
3278 : a5 50 __ LDA T4 + 1 
327a : 30 08 __ BMI $3284 ; (nformf.s64 + 0)
.s66:
327c : d0 06 __ BNE $3284 ; (nformf.s64 + 0)
.s65:
327e : a5 4f __ LDA T4 + 0 
3280 : c9 04 __ CMP #$04
3282 : 90 07 __ BCC $328b ; (nformf.s13 + 0)
.s64:
3284 : a9 01 __ LDA #$01
3286 : 85 55 __ STA T10 + 0 
3288 : 4c 14 35 JMP $3514 ; (nformf.s53 + 0)
.s13:
328b : a5 55 __ LDA T10 + 0 
328d : d0 f9 __ BNE $3288 ; (nformf.s64 + 4)
.s14:
328f : 24 50 __ BIT T4 + 1 
3291 : 10 43 __ BPL $32d6 ; (nformf.s15 + 0)
.s52:
3293 : a5 43 __ LDA T0 + 0 
3295 : 85 1b __ STA ACCU + 0 
3297 : a5 44 __ LDA T0 + 1 
3299 : 85 1c __ STA ACCU + 1 
329b : a5 45 __ LDA T0 + 2 
329d : 85 1d __ STA ACCU + 2 
329f : a5 46 __ LDA T0 + 3 
32a1 : 85 1e __ STA ACCU + 3 
.l108:
32a3 : a9 00 __ LDA #$00
32a5 : 85 03 __ STA WORK + 0 
32a7 : 85 04 __ STA WORK + 1 
32a9 : a9 20 __ LDA #$20
32ab : 85 05 __ STA WORK + 2 
32ad : a9 41 __ LDA #$41
32af : 85 06 __ STA WORK + 3 
32b1 : 20 c6 3a JSR $3ac6 ; (freg + 20)
32b4 : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
32b7 : 18 __ __ CLC
32b8 : a5 4f __ LDA T4 + 0 
32ba : 69 01 __ ADC #$01
32bc : 85 4f __ STA T4 + 0 
32be : a5 50 __ LDA T4 + 1 
32c0 : 69 00 __ ADC #$00
32c2 : 85 50 __ STA T4 + 1 
32c4 : 30 dd __ BMI $32a3 ; (nformf.l108 + 0)
.s109:
32c6 : a5 1e __ LDA ACCU + 3 
32c8 : 85 46 __ STA T0 + 3 
32ca : a5 1d __ LDA ACCU + 2 
32cc : 85 45 __ STA T0 + 2 
32ce : a5 1c __ LDA ACCU + 1 
32d0 : 85 44 __ STA T0 + 1 
32d2 : a5 1b __ LDA ACCU + 0 
32d4 : 85 43 __ STA T0 + 0 
.s15:
32d6 : 18 __ __ CLC
32d7 : a5 4d __ LDA T3 + 0 
32d9 : 65 4f __ ADC T4 + 0 
32db : 18 __ __ CLC
32dc : 69 01 __ ADC #$01
32de : 85 51 __ STA T5 + 0 
32e0 : c9 07 __ CMP #$07
32e2 : 90 14 __ BCC $32f8 ; (nformf.s51 + 0)
.s16:
32e4 : ad 76 40 LDA $4076 ; (fround5[0] + 24)
32e7 : 85 47 __ STA T1 + 0 
32e9 : ad 77 40 LDA $4077 ; (fround5[0] + 25)
32ec : 85 48 __ STA T1 + 1 
32ee : ad 78 40 LDA $4078 ; (fround5[0] + 26)
32f1 : 85 49 __ STA T1 + 2 
32f3 : ad 79 40 LDA $4079 ; (fround5[0] + 27)
32f6 : b0 15 __ BCS $330d ; (nformf.s17 + 0)
.s51:
32f8 : 0a __ __ ASL
32f9 : 0a __ __ ASL
32fa : aa __ __ TAX
32fb : bd 5a 40 LDA $405a,x ; (tpow10[0] + 24)
32fe : 85 47 __ STA T1 + 0 
3300 : bd 5b 40 LDA $405b,x ; (tpow10[0] + 25)
3303 : 85 48 __ STA T1 + 1 
3305 : bd 5c 40 LDA $405c,x ; (tpow10[0] + 26)
3308 : 85 49 __ STA T1 + 2 
330a : bd 5d 40 LDA $405d,x ; (tpow10[0] + 27)
.s17:
330d : 85 4a __ STA T1 + 3 
330f : a5 43 __ LDA T0 + 0 
3311 : 85 1b __ STA ACCU + 0 
3313 : a5 44 __ LDA T0 + 1 
3315 : 85 1c __ STA ACCU + 1 
3317 : a5 45 __ LDA T0 + 2 
3319 : 85 1d __ STA ACCU + 2 
331b : a5 46 __ LDA T0 + 3 
331d : 85 1e __ STA ACCU + 3 
331f : a2 47 __ LDX #$47
3321 : 20 b6 3a JSR $3ab6 ; (freg + 4)
3324 : 20 fd 3a JSR $3afd ; (faddsub + 6)
3327 : a5 1c __ LDA ACCU + 1 
3329 : 85 16 __ STA P9 ; (f + 1)
332b : a5 1d __ LDA ACCU + 2 
332d : 85 17 __ STA P10 ; (f + 2)
332f : a6 1b __ LDX ACCU + 0 
3331 : a5 1e __ LDA ACCU + 3 
3333 : 85 18 __ STA P11 ; (f + 3)
3335 : 30 3a __ BMI $3371 ; (nformf.s18 + 0)
.s46:
3337 : c9 41 __ CMP #$41
3339 : d0 0d __ BNE $3348 ; (nformf.s50 + 0)
.s47:
333b : a5 17 __ LDA P10 ; (f + 2)
333d : c9 20 __ CMP #$20
333f : d0 07 __ BNE $3348 ; (nformf.s50 + 0)
.s48:
3341 : a5 16 __ LDA P9 ; (f + 1)
3343 : d0 03 __ BNE $3348 ; (nformf.s50 + 0)
.s49:
3345 : 8a __ __ TXA
3346 : f0 02 __ BEQ $334a ; (nformf.s45 + 0)
.s50:
3348 : 90 27 __ BCC $3371 ; (nformf.s18 + 0)
.s45:
334a : a9 00 __ LDA #$00
334c : 85 03 __ STA WORK + 0 
334e : 85 04 __ STA WORK + 1 
3350 : a9 20 __ LDA #$20
3352 : 85 05 __ STA WORK + 2 
3354 : a9 41 __ LDA #$41
3356 : 85 06 __ STA WORK + 3 
3358 : 20 c6 3a JSR $3ac6 ; (freg + 20)
335b : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
335e : a5 1c __ LDA ACCU + 1 
3360 : 85 16 __ STA P9 ; (f + 1)
3362 : a5 1d __ LDA ACCU + 2 
3364 : 85 17 __ STA P10 ; (f + 2)
3366 : a5 1e __ LDA ACCU + 3 
3368 : 85 18 __ STA P11 ; (f + 3)
336a : a6 4d __ LDX T3 + 0 
336c : ca __ __ DEX
336d : 86 52 __ STX T6 + 0 
336f : a6 1b __ LDX ACCU + 0 
.s18:
3371 : 38 __ __ SEC
3372 : a5 51 __ LDA T5 + 0 
3374 : e5 52 __ SBC T6 + 0 
3376 : 85 4d __ STA T3 + 0 
3378 : a9 00 __ LDA #$00
337a : e9 00 __ SBC #$00
337c : 85 4e __ STA T3 + 1 
337e : a9 14 __ LDA #$14
3380 : c5 51 __ CMP T5 + 0 
3382 : b0 02 __ BCS $3386 ; (nformf.s19 + 0)
.s44:
3384 : 85 51 __ STA T5 + 0 
.s19:
3386 : a5 4d __ LDA T3 + 0 
3388 : d0 08 __ BNE $3392 ; (nformf.s21 + 0)
.s20:
338a : a9 30 __ LDA #$30
338c : a4 54 __ LDY T9 + 0 
338e : 91 13 __ STA (P6),y ; (str + 0)
3390 : e6 54 __ INC T9 + 0 
.s21:
3392 : a9 00 __ LDA #$00
3394 : 85 56 __ STA T11 + 0 
3396 : c5 4d __ CMP T3 + 0 
3398 : f0 6f __ BEQ $3409 ; (nformf.l43 + 0)
.s23:
339a : c9 07 __ CMP #$07
339c : 90 04 __ BCC $33a2 ; (nformf.s24 + 0)
.l42:
339e : a9 30 __ LDA #$30
33a0 : b0 55 __ BCS $33f7 ; (nformf.l25 + 0)
.s24:
33a2 : 86 1b __ STX ACCU + 0 
33a4 : 86 43 __ STX T0 + 0 
33a6 : a5 16 __ LDA P9 ; (f + 1)
33a8 : 85 1c __ STA ACCU + 1 
33aa : 85 44 __ STA T0 + 1 
33ac : a5 17 __ LDA P10 ; (f + 2)
33ae : 85 1d __ STA ACCU + 2 
33b0 : 85 45 __ STA T0 + 2 
33b2 : a5 18 __ LDA P11 ; (f + 3)
33b4 : 85 1e __ STA ACCU + 3 
33b6 : 85 46 __ STA T0 + 3 
33b8 : 20 7a 3e JSR $3e7a ; (f32_to_i16 + 0)
33bb : a5 1b __ LDA ACCU + 0 
33bd : 85 53 __ STA T7 + 0 
33bf : 20 c6 3e JSR $3ec6 ; (sint16_to_float + 0)
33c2 : a2 43 __ LDX #$43
33c4 : 20 b6 3a JSR $3ab6 ; (freg + 4)
33c7 : a5 1e __ LDA ACCU + 3 
33c9 : 49 80 __ EOR #$80
33cb : 85 1e __ STA ACCU + 3 
33cd : 20 fd 3a JSR $3afd ; (faddsub + 6)
33d0 : a9 00 __ LDA #$00
33d2 : 85 03 __ STA WORK + 0 
33d4 : 85 04 __ STA WORK + 1 
33d6 : a9 20 __ LDA #$20
33d8 : 85 05 __ STA WORK + 2 
33da : a9 41 __ LDA #$41
33dc : 85 06 __ STA WORK + 3 
33de : 20 c6 3a JSR $3ac6 ; (freg + 20)
33e1 : 20 e4 3b JSR $3be4 ; (crt_fmul + 0)
33e4 : a5 1c __ LDA ACCU + 1 
33e6 : 85 16 __ STA P9 ; (f + 1)
33e8 : a5 1d __ LDA ACCU + 2 
33ea : 85 17 __ STA P10 ; (f + 2)
33ec : a5 1e __ LDA ACCU + 3 
33ee : 85 18 __ STA P11 ; (f + 3)
33f0 : 18 __ __ CLC
33f1 : a5 53 __ LDA T7 + 0 
33f3 : 69 30 __ ADC #$30
33f5 : a6 1b __ LDX ACCU + 0 
.l25:
33f7 : a4 54 __ LDY T9 + 0 
33f9 : 91 13 __ STA (P6),y ; (str + 0)
33fb : e6 54 __ INC T9 + 0 
33fd : e6 56 __ INC T11 + 0 
33ff : a5 56 __ LDA T11 + 0 
3401 : c5 51 __ CMP T5 + 0 
3403 : b0 14 __ BCS $3419 ; (nformf.s26 + 0)
.s22:
3405 : c5 4d __ CMP T3 + 0 
3407 : d0 91 __ BNE $339a ; (nformf.s23 + 0)
.l43:
3409 : a9 2e __ LDA #$2e
340b : a4 54 __ LDY T9 + 0 
340d : 91 13 __ STA (P6),y ; (str + 0)
340f : e6 54 __ INC T9 + 0 
3411 : a5 56 __ LDA T11 + 0 
3413 : c9 07 __ CMP #$07
3415 : 90 8b __ BCC $33a2 ; (nformf.s24 + 0)
3417 : b0 85 __ BCS $339e ; (nformf.l42 + 0)
.s26:
3419 : a5 55 __ LDA T10 + 0 
341b : f0 66 __ BEQ $3483 ; (nformf.s27 + 0)
.s38:
341d : a0 03 __ LDY #$03
341f : b1 4b __ LDA (T2 + 0),y 
3421 : 69 03 __ ADC #$03
3423 : a4 54 __ LDY T9 + 0 
3425 : 91 13 __ STA (P6),y ; (str + 0)
3427 : c8 __ __ INY
3428 : 84 54 __ STY T9 + 0 
342a : 24 50 __ BIT T4 + 1 
342c : 30 06 __ BMI $3434 ; (nformf.s41 + 0)
.s39:
342e : a9 2b __ LDA #$2b
3430 : 91 13 __ STA (P6),y ; (str + 0)
3432 : d0 11 __ BNE $3445 ; (nformf.s40 + 0)
.s41:
3434 : a9 2d __ LDA #$2d
3436 : 91 13 __ STA (P6),y ; (str + 0)
3438 : 38 __ __ SEC
3439 : a9 00 __ LDA #$00
343b : e5 4f __ SBC T4 + 0 
343d : 85 4f __ STA T4 + 0 
343f : a9 00 __ LDA #$00
3441 : e5 50 __ SBC T4 + 1 
3443 : 85 50 __ STA T4 + 1 
.s40:
3445 : e6 54 __ INC T9 + 0 
3447 : a5 4f __ LDA T4 + 0 
3449 : 85 1b __ STA ACCU + 0 
344b : a5 50 __ LDA T4 + 1 
344d : 85 1c __ STA ACCU + 1 
344f : a9 0a __ LDA #$0a
3451 : 85 03 __ STA WORK + 0 
3453 : a9 00 __ LDA #$00
3455 : 85 04 __ STA WORK + 1 
3457 : 20 9c 3d JSR $3d9c ; (divs16 + 0)
345a : 18 __ __ CLC
345b : a5 1b __ LDA ACCU + 0 
345d : 69 30 __ ADC #$30
345f : a4 54 __ LDY T9 + 0 
3461 : 91 13 __ STA (P6),y ; (str + 0)
3463 : e6 54 __ INC T9 + 0 
3465 : a5 4f __ LDA T4 + 0 
3467 : 85 1b __ STA ACCU + 0 
3469 : a5 50 __ LDA T4 + 1 
346b : 85 1c __ STA ACCU + 1 
346d : a9 0a __ LDA #$0a
346f : 85 03 __ STA WORK + 0 
3471 : a9 00 __ LDA #$00
3473 : 85 04 __ STA WORK + 1 
3475 : 20 4d 3e JSR $3e4d ; (mods16 + 0)
3478 : 18 __ __ CLC
3479 : a5 05 __ LDA WORK + 2 
347b : 69 30 __ ADC #$30
347d : a4 54 __ LDY T9 + 0 
347f : 91 13 __ STA (P6),y ; (str + 0)
3481 : e6 54 __ INC T9 + 0 
.s27:
3483 : a5 54 __ LDA T9 + 0 
3485 : a0 01 __ LDY #$01
3487 : d1 11 __ CMP (P4),y ; (si + 0)
3489 : b0 6d __ BCS $34f8 ; (nformf.s3 + 0)
.s28:
348b : a0 06 __ LDY #$06
348d : b1 11 __ LDA (P4),y ; (si + 0)
348f : f0 04 __ BEQ $3495 ; (nformf.s29 + 0)
.s110:
3491 : a6 54 __ LDX T9 + 0 
3493 : 90 70 __ BCC $3505 ; (nformf.l36 + 0)
.s29:
3495 : a5 54 __ LDA T9 + 0 
3497 : f0 40 __ BEQ $34d9 ; (nformf.s30 + 0)
.s35:
3499 : e9 00 __ SBC #$00
349b : a8 __ __ TAY
349c : a9 00 __ LDA #$00
349e : e9 00 __ SBC #$00
34a0 : aa __ __ TAX
34a1 : 98 __ __ TYA
34a2 : 18 __ __ CLC
34a3 : 65 13 __ ADC P6 ; (str + 0)
34a5 : 85 47 __ STA T1 + 0 
34a7 : 8a __ __ TXA
34a8 : 65 14 __ ADC P7 ; (str + 1)
34aa : 85 48 __ STA T1 + 1 
34ac : a9 01 __ LDA #$01
34ae : 85 4d __ STA T3 + 0 
34b0 : a6 54 __ LDX T9 + 0 
34b2 : 38 __ __ SEC
.l111:
34b3 : a0 01 __ LDY #$01
34b5 : b1 11 __ LDA (P4),y ; (si + 0)
34b7 : e5 4d __ SBC T3 + 0 
34b9 : 85 4b __ STA T2 + 0 
34bb : a9 00 __ LDA #$00
34bd : e5 4e __ SBC T3 + 1 
34bf : 18 __ __ CLC
34c0 : 65 14 __ ADC P7 ; (str + 1)
34c2 : 85 4c __ STA T2 + 1 
34c4 : 88 __ __ DEY
34c5 : b1 47 __ LDA (T1 + 0),y 
34c7 : a4 13 __ LDY P6 ; (str + 0)
34c9 : 91 4b __ STA (T2 + 0),y 
34cb : a5 47 __ LDA T1 + 0 
34cd : d0 02 __ BNE $34d1 ; (nformf.s114 + 0)
.s113:
34cf : c6 48 __ DEC T1 + 1 
.s114:
34d1 : c6 47 __ DEC T1 + 0 
34d3 : e6 4d __ INC T3 + 0 
34d5 : e4 4d __ CPX T3 + 0 
34d7 : b0 da __ BCS $34b3 ; (nformf.l111 + 0)
.s30:
34d9 : a9 00 __ LDA #$00
34db : 85 4d __ STA T3 + 0 
34dd : 90 08 __ BCC $34e7 ; (nformf.l31 + 0)
.s33:
34df : a9 20 __ LDA #$20
34e1 : a4 4d __ LDY T3 + 0 
34e3 : 91 13 __ STA (P6),y ; (str + 0)
34e5 : e6 4d __ INC T3 + 0 
.l31:
34e7 : a0 01 __ LDY #$01
34e9 : b1 11 __ LDA (P4),y ; (si + 0)
34eb : 38 __ __ SEC
34ec : e5 54 __ SBC T9 + 0 
34ee : 90 ef __ BCC $34df ; (nformf.s33 + 0)
.s34:
34f0 : c5 4d __ CMP T3 + 0 
34f2 : 90 02 __ BCC $34f6 ; (nformf.s32 + 0)
.s112:
34f4 : d0 e9 __ BNE $34df ; (nformf.s33 + 0)
.s32:
34f6 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
34f8 : 85 1b __ STA ACCU + 0 
34fa : a2 03 __ LDX #$03
34fc : bd e3 9f LDA $9fe3,x ; (nformf@stack + 0)
34ff : 95 53 __ STA T7 + 0,x 
3501 : ca __ __ DEX
3502 : 10 f8 __ BPL $34fc ; (nformf.s3 + 4)
3504 : 60 __ __ RTS
.l36:
3505 : 8a __ __ TXA
3506 : a0 01 __ LDY #$01
3508 : d1 11 __ CMP (P4),y ; (si + 0)
350a : b0 ea __ BCS $34f6 ; (nformf.s32 + 0)
.s37:
350c : a8 __ __ TAY
350d : a9 20 __ LDA #$20
350f : 91 13 __ STA (P6),y ; (str + 0)
3511 : e8 __ __ INX
3512 : 90 f1 __ BCC $3505 ; (nformf.l36 + 0)
.s53:
3514 : a5 51 __ LDA T5 + 0 
3516 : c9 07 __ CMP #$07
3518 : 90 14 __ BCC $352e ; (nformf.s62 + 0)
.s54:
351a : ad 76 40 LDA $4076 ; (fround5[0] + 24)
351d : 85 47 __ STA T1 + 0 
351f : ad 77 40 LDA $4077 ; (fround5[0] + 25)
3522 : 85 48 __ STA T1 + 1 
3524 : ad 78 40 LDA $4078 ; (fround5[0] + 26)
3527 : 85 49 __ STA T1 + 2 
3529 : ad 79 40 LDA $4079 ; (fround5[0] + 27)
352c : b0 15 __ BCS $3543 ; (nformf.s55 + 0)
.s62:
352e : 0a __ __ ASL
352f : 0a __ __ ASL
3530 : aa __ __ TAX
3531 : bd 5a 40 LDA $405a,x ; (tpow10[0] + 24)
3534 : 85 47 __ STA T1 + 0 
3536 : bd 5b 40 LDA $405b,x ; (tpow10[0] + 25)
3539 : 85 48 __ STA T1 + 1 
353b : bd 5c 40 LDA $405c,x ; (tpow10[0] + 26)
353e : 85 49 __ STA T1 + 2 
3540 : bd 5d 40 LDA $405d,x ; (tpow10[0] + 27)
.s55:
3543 : 85 4a __ STA T1 + 3 
3545 : a5 43 __ LDA T0 + 0 
3547 : 85 1b __ STA ACCU + 0 
3549 : a5 44 __ LDA T0 + 1 
354b : 85 1c __ STA ACCU + 1 
354d : a5 45 __ LDA T0 + 2 
354f : 85 1d __ STA ACCU + 2 
3551 : a5 46 __ LDA T0 + 3 
3553 : 85 1e __ STA ACCU + 3 
3555 : a2 47 __ LDX #$47
3557 : 20 b6 3a JSR $3ab6 ; (freg + 4)
355a : 20 fd 3a JSR $3afd ; (faddsub + 6)
355d : a5 1c __ LDA ACCU + 1 
355f : 85 16 __ STA P9 ; (f + 1)
3561 : a5 1d __ LDA ACCU + 2 
3563 : 85 17 __ STA P10 ; (f + 2)
3565 : a6 1b __ LDX ACCU + 0 
3567 : a5 1e __ LDA ACCU + 3 
3569 : 85 18 __ STA P11 ; (f + 3)
356b : 10 03 __ BPL $3570 ; (nformf.s57 + 0)
356d : 4c 71 33 JMP $3371 ; (nformf.s18 + 0)
.s57:
3570 : c9 41 __ CMP #$41
3572 : d0 0d __ BNE $3581 ; (nformf.s61 + 0)
.s58:
3574 : a5 17 __ LDA P10 ; (f + 2)
3576 : c9 20 __ CMP #$20
3578 : d0 07 __ BNE $3581 ; (nformf.s61 + 0)
.s59:
357a : a5 16 __ LDA P9 ; (f + 1)
357c : d0 03 __ BNE $3581 ; (nformf.s61 + 0)
.s60:
357e : 8a __ __ TXA
357f : f0 02 __ BEQ $3583 ; (nformf.s56 + 0)
.s61:
3581 : 90 ea __ BCC $356d ; (nformf.s55 + 42)
.s56:
3583 : a9 00 __ LDA #$00
3585 : 85 03 __ STA WORK + 0 
3587 : 85 04 __ STA WORK + 1 
3589 : a9 20 __ LDA #$20
358b : 85 05 __ STA WORK + 2 
358d : a9 41 __ LDA #$41
358f : 85 06 __ STA WORK + 3 
3591 : 20 c6 3a JSR $3ac6 ; (freg + 20)
3594 : 20 ac 3c JSR $3cac ; (crt_fdiv + 0)
3597 : a5 1c __ LDA ACCU + 1 
3599 : 85 16 __ STA P9 ; (f + 1)
359b : a5 1d __ LDA ACCU + 2 
359d : 85 17 __ STA P10 ; (f + 2)
359f : a5 1e __ LDA ACCU + 3 
35a1 : 85 18 __ STA P11 ; (f + 3)
35a3 : a6 1b __ LDX ACCU + 0 
35a5 : e6 4f __ INC T4 + 0 
35a7 : d0 c4 __ BNE $356d ; (nformf.s55 + 42)
.s117:
35a9 : e6 50 __ INC T4 + 1 
35ab : 4c 71 33 JMP $3371 ; (nformf.s18 + 0)
.s102:
35ae : 86 43 __ STX T0 + 0 
35b0 : 85 47 __ STA T1 + 0 
35b2 : a0 03 __ LDY #$03
35b4 : b1 11 __ LDA (P4),y ; (si + 0)
35b6 : 18 __ __ CLC
35b7 : 69 08 __ ADC #$08
35b9 : a4 43 __ LDY T0 + 0 
35bb : 91 13 __ STA (P6),y ; (str + 0)
35bd : 18 __ __ CLC
35be : a0 03 __ LDY #$03
35c0 : b1 11 __ LDA (P4),y ; (si + 0)
35c2 : 69 0d __ ADC #$0d
35c4 : a4 43 __ LDY T0 + 0 
35c6 : c8 __ __ INY
35c7 : 91 13 __ STA (P6),y ; (str + 0)
35c9 : a0 03 __ LDY #$03
35cb : b1 11 __ LDA (P4),y ; (si + 0)
35cd : 18 __ __ CLC
35ce : 69 05 __ ADC #$05
35d0 : a4 47 __ LDY T1 + 0 
35d2 : 91 13 __ STA (P6),y ; (str + 0)
35d4 : 18 __ __ CLC
35d5 : a5 54 __ LDA T9 + 0 
35d7 : 69 03 __ ADC #$03
35d9 : 85 54 __ STA T9 + 0 
35db : 4c 83 34 JMP $3483 ; (nformf.s27 + 0)
.s104:
35de : 20 ec 28 JSR $28ec ; (isinf.s4 + 0)
35e1 : a2 01 __ LDX #$01
35e3 : 86 54 __ STX T9 + 0 
35e5 : a8 __ __ TAY
35e6 : d0 03 __ BNE $35eb ; (nformf.s105 + 0)
35e8 : 4c f8 30 JMP $30f8 ; (nformf.s7 + 0)
.s105:
35eb : a9 03 __ LDA #$03
35ed : d0 bf __ BNE $35ae ; (nformf.s102 + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
35ef : 38 __ __ SEC
35f0 : a9 00 __ LDA #$00
35f2 : e5 1b __ SBC ACCU + 0 
35f4 : 85 1b __ STA ACCU + 0 
35f6 : a9 00 __ LDA #$00
35f8 : e5 1c __ SBC ACCU + 1 
35fa : 85 1c __ STA ACCU + 1 
35fc : 60 __ __ RTS
--------------------------------------------------------------------
nextIRQ:
35fd : __ __ __ BSS	1
--------------------------------------------------------------------
rirq_count:
35fe : __ __ __ BSS	1
--------------------------------------------------------------------
3600 : __ __ __ BYT ce 3a 20 25 44 20 d8 3a 20 25 33 44 20 d9 3a 20 : .: %D .: %3D .: 
3610 : __ __ __ BYT 25 33 44 20 d2 3a 20 25 32 44 00                : %3D .: %2D.
--------------------------------------------------------------------
bm_circle_fill: ; bm_circle_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,u8,const u8*)->void
;  80, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
361b : a2 04 __ LDX #$04
361d : b5 53 __ LDA T9 + 0,x 
361f : 9d e3 9f STA $9fe3,x ; (bm_circle_fill@stack + 0)
3622 : ca __ __ DEX
3623 : 10 f8 __ BPL $361d ; (bm_circle_fill.s1 + 2)
.s4:
3625 : ad f2 9f LDA $9ff2 ; (sstack + 6)
3628 : 85 4b __ STA T5 + 0 
362a : 18 __ __ CLC
362b : 65 18 __ ADC P11 ; (r + 0)
362d : aa __ __ TAX
362e : ad f3 9f LDA $9ff3 ; (sstack + 7)
3631 : 85 4c __ STA T5 + 1 
3633 : 69 00 __ ADC #$00
3635 : a8 __ __ TAY
3636 : 8a __ __ TXA
3637 : 18 __ __ CLC
3638 : 69 01 __ ADC #$01
363a : 85 4d __ STA T6 + 0 
363c : 90 01 __ BCC $363f ; (bm_circle_fill.s22 + 0)
.s21:
363e : c8 __ __ INY
.s22:
363f : 84 4e __ STY T6 + 1 
3641 : ad ee 9f LDA $9fee ; (sstack + 2)
3644 : 85 4f __ STA T7 + 0 
3646 : ad ef 9f LDA $9fef ; (sstack + 3)
3649 : 85 50 __ STA T7 + 1 
364b : a0 06 __ LDY #$06
364d : b1 4f __ LDA (T7 + 0),y 
364f : aa __ __ TAX
3650 : c8 __ __ INY
3651 : b1 4f __ LDA (T7 + 0),y 
3653 : 85 1c __ STA ACCU + 1 ; (clip + 1)
3655 : 38 __ __ SEC
3656 : a5 4b __ LDA T5 + 0 
3658 : e5 18 __ SBC P11 ; (r + 0)
365a : 85 45 __ STA T2 + 0 
365c : a0 02 __ LDY #$02
365e : b1 4f __ LDA (T7 + 0),y 
3660 : 85 47 __ STA T3 + 0 
3662 : a5 4c __ LDA T5 + 1 
3664 : e9 00 __ SBC #$00
3666 : 85 46 __ STA T2 + 1 
3668 : c8 __ __ INY
3669 : d1 4f __ CMP (T7 + 0),y 
366b : d0 08 __ BNE $3675 ; (bm_circle_fill.s20 + 0)
.s17:
366d : a5 45 __ LDA T2 + 0 
366f : c5 47 __ CMP T3 + 0 
.s18:
3671 : 90 08 __ BCC $367b ; (bm_circle_fill.s16 + 0)
3673 : b0 0e __ BCS $3683 ; (bm_circle_fill.s5 + 0)
.s20:
3675 : 51 4f __ EOR (T7 + 0),y 
3677 : 10 f8 __ BPL $3671 ; (bm_circle_fill.s18 + 0)
.s19:
3679 : 90 08 __ BCC $3683 ; (bm_circle_fill.s5 + 0)
.s16:
367b : a5 47 __ LDA T3 + 0 
367d : 85 45 __ STA T2 + 0 
367f : b1 4f __ LDA (T7 + 0),y 
3681 : 85 46 __ STA T2 + 1 
.s5:
3683 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
3685 : c5 4e __ CMP T6 + 1 
3687 : d0 06 __ BNE $368f ; (bm_circle_fill.s15 + 0)
.s12:
3689 : e4 4d __ CPX T6 + 0 
.s13:
368b : 90 08 __ BCC $3695 ; (bm_circle_fill.s11 + 0)
368d : b0 08 __ BCS $3697 ; (bm_circle_fill.s6 + 0)
.s15:
368f : 45 4e __ EOR T6 + 1 
3691 : 10 f8 __ BPL $368b ; (bm_circle_fill.s13 + 0)
.s14:
3693 : 90 02 __ BCC $3697 ; (bm_circle_fill.s6 + 0)
.s11:
3695 : 86 4d __ STX T6 + 0 
.s6:
3697 : a5 45 __ LDA T2 + 0 
3699 : c5 4d __ CMP T6 + 0 
369b : 90 0b __ BCC $36a8 ; (bm_circle_fill.s7 + 0)
.s3:
369d : a2 04 __ LDX #$04
369f : bd e3 9f LDA $9fe3,x ; (bm_circle_fill@stack + 0)
36a2 : 95 53 __ STA T9 + 0,x 
36a4 : ca __ __ DEX
36a5 : 10 f8 __ BPL $369f ; (bm_circle_fill.s3 + 2)
36a7 : 60 __ __ RTS
.s7:
36a8 : 29 f8 __ AND #$f8
36aa : 85 1b __ STA ACCU + 0 ; (clip + 0)
36ac : ad ec 9f LDA $9fec ; (sstack + 0)
36af : 85 47 __ STA T3 + 0 
36b1 : ad ed 9f LDA $9fed ; (sstack + 1)
36b4 : 85 48 __ STA T3 + 1 
36b6 : a5 46 __ LDA T2 + 1 
36b8 : 85 1c __ STA ACCU + 1 ; (clip + 1)
36ba : a0 04 __ LDY #$04
36bc : b1 47 __ LDA (T3 + 0),y 
36be : 85 49 __ STA T4 + 0 
36c0 : 20 44 3a JSR $3a44 ; (mul16by8 + 0)
36c3 : a0 00 __ LDY #$00
36c5 : b1 47 __ LDA (T3 + 0),y 
36c7 : 18 __ __ CLC
36c8 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
36ca : 85 02 __ STA $02 
36cc : c8 __ __ INY
36cd : b1 47 __ LDA (T3 + 0),y 
36cf : 65 1c __ ADC ACCU + 1 ; (clip + 1)
36d1 : aa __ __ TAX
36d2 : a5 45 __ LDA T2 + 0 
36d4 : 85 57 __ STA T12 + 0 
36d6 : 29 07 __ AND #$07
36d8 : 18 __ __ CLC
36d9 : 65 02 __ ADC $02 
36db : 85 47 __ STA T3 + 0 
36dd : 90 01 __ BCC $36e0 ; (bm_circle_fill.s24 + 0)
.s23:
36df : e8 __ __ INX
.s24:
36e0 : 86 48 __ STX T3 + 1 
36e2 : a9 00 __ LDA #$00
36e4 : 85 1c __ STA ACCU + 1 ; (clip + 1)
36e6 : a5 18 __ LDA P11 ; (r + 0)
36e8 : 85 1b __ STA ACCU + 0 ; (clip + 0)
36ea : 20 44 3a JSR $3a44 ; (mul16by8 + 0)
36ed : 18 __ __ CLC
36ee : a5 1b __ LDA ACCU + 0 ; (clip + 0)
36f0 : 65 18 __ ADC P11 ; (r + 0)
36f2 : 85 51 __ STA T8 + 0 
36f4 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
36f6 : 69 00 __ ADC #$00
36f8 : 85 52 __ STA T8 + 1 
36fa : 18 __ __ CLC
36fb : a5 49 __ LDA T4 + 0 
36fd : 69 ff __ ADC #$ff
36ff : 2a __ __ ROL
3700 : 2a __ __ ROL
3701 : 2a __ __ ROL
3702 : aa __ __ TAX
3703 : 29 f8 __ AND #$f8
3705 : 85 49 __ STA T4 + 0 
3707 : 8a __ __ TXA
3708 : 29 07 __ AND #$07
370a : 2a __ __ ROL
370b : 69 f8 __ ADC #$f8
370d : 85 4a __ STA T4 + 1 
370f : ad f4 9f LDA $9ff4 ; (sstack + 8)
3712 : 85 53 __ STA T9 + 0 
3714 : ad f5 9f LDA $9ff5 ; (sstack + 9)
3717 : 85 54 __ STA T9 + 1 
3719 : ad f0 9f LDA $9ff0 ; (sstack + 4)
371c : 85 55 __ STA T10 + 0 
371e : ad f1 9f LDA $9ff1 ; (sstack + 5)
3721 : 85 56 __ STA T10 + 1 
.l8:
3723 : 38 __ __ SEC
3724 : a5 57 __ LDA T12 + 0 
3726 : e5 4b __ SBC T5 + 0 
3728 : 85 03 __ STA WORK + 0 
372a : 85 1b __ STA ACCU + 0 ; (clip + 0)
372c : a9 00 __ LDA #$00
372e : e5 4c __ SBC T5 + 1 
3730 : 85 04 __ STA WORK + 1 
3732 : 85 1c __ STA ACCU + 1 ; (clip + 1)
3734 : 20 5a 3d JSR $3d5a ; (mul16 + 0)
3737 : 38 __ __ SEC
3738 : a5 51 __ LDA T8 + 0 
373a : e5 05 __ SBC WORK + 2 
373c : 85 0d __ STA P0 
373e : a5 52 __ LDA T8 + 1 
3740 : e5 06 __ SBC WORK + 3 
3742 : 85 0e __ STA P1 
3744 : 20 c2 37 JSR $37c2 ; (bm_usqrt.s4 + 0)
3747 : a0 00 __ LDY #$00
3749 : b1 4f __ LDA (T7 + 0),y 
374b : 85 0d __ STA P0 
374d : c8 __ __ INY
374e : b1 4f __ LDA (T7 + 0),y 
3750 : 85 0e __ STA P1 
3752 : a0 04 __ LDY #$04
3754 : b1 4f __ LDA (T7 + 0),y 
3756 : 85 0f __ STA P2 
3758 : c8 __ __ INY
3759 : b1 4f __ LDA (T7 + 0),y 
375b : 85 10 __ STA P3 
375d : a5 47 __ LDA T3 + 0 
375f : 85 11 __ STA P4 
3761 : a5 48 __ LDA T3 + 1 
3763 : 85 12 __ STA P5 
3765 : a5 57 __ LDA T12 + 0 
3767 : 29 07 __ AND #$07
3769 : a8 __ __ TAY
376a : b1 53 __ LDA (T9 + 0),y 
376c : 85 17 __ STA P10 
376e : 38 __ __ SEC
376f : a5 55 __ LDA T10 + 0 
3771 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
3773 : 85 13 __ STA P6 
3775 : a5 56 __ LDA T10 + 1 
3777 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
3779 : 85 14 __ STA P7 
377b : 18 __ __ CLC
377c : a5 55 __ LDA T10 + 0 
377e : 65 1b __ ADC ACCU + 0 ; (clip + 0)
3780 : aa __ __ TAX
3781 : a5 56 __ LDA T10 + 1 
3783 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
3785 : a8 __ __ TAY
3786 : 8a __ __ TXA
3787 : 18 __ __ CLC
3788 : 69 01 __ ADC #$01
378a : 85 15 __ STA P8 
378c : 90 01 __ BCC $378f ; (bm_circle_fill.s26 + 0)
.s25:
378e : c8 __ __ INY
.s26:
378f : 84 16 __ STY P9 
3791 : 20 a1 38 JSR $38a1 ; (bm_scan_fill.s4 + 0)
3794 : 18 __ __ CLC
3795 : a5 11 __ LDA P4 
3797 : 69 01 __ ADC #$01
3799 : 85 47 __ STA T3 + 0 
379b : a5 12 __ LDA P5 
379d : 69 00 __ ADC #$00
379f : 85 48 __ STA T3 + 1 
37a1 : a5 47 __ LDA T3 + 0 
37a3 : 29 07 __ AND #$07
37a5 : d0 0d __ BNE $37b4 ; (bm_circle_fill.s10 + 0)
.s9:
37a7 : 18 __ __ CLC
37a8 : a5 47 __ LDA T3 + 0 
37aa : 65 49 __ ADC T4 + 0 
37ac : 85 47 __ STA T3 + 0 
37ae : a5 48 __ LDA T3 + 1 
37b0 : 65 4a __ ADC T4 + 1 
37b2 : 85 48 __ STA T3 + 1 
.s10:
37b4 : e6 57 __ INC T12 + 0 
37b6 : a5 57 __ LDA T12 + 0 
37b8 : c5 4d __ CMP T6 + 0 
37ba : b0 03 __ BCS $37bf ; (bm_circle_fill.s10 + 11)
37bc : 4c 23 37 JMP $3723 ; (bm_circle_fill.l8 + 0)
37bf : 4c 9d 36 JMP $369d ; (bm_circle_fill.s3 + 0)
--------------------------------------------------------------------
bm_usqrt: ; bm_usqrt(u16)->u16
;  62, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
37c2 : a4 0e __ LDY P1 ; (n + 1)
37c4 : 98 __ __ TYA
37c5 : c0 40 __ CPY #$40
37c7 : 90 09 __ BCC $37d2 ; (bm_usqrt.s5 + 0)
.s29:
37c9 : e9 40 __ SBC #$40
37cb : a8 __ __ TAY
37cc : a9 50 __ LDA #$50
37ce : a2 20 __ LDX #$20
37d0 : d0 04 __ BNE $37d6 ; (bm_usqrt.s6 + 0)
.s5:
37d2 : a9 10 __ LDA #$10
37d4 : a2 00 __ LDX #$00
.s6:
37d6 : 85 44 __ STA T2 + 1 
37d8 : c4 44 __ CPY T2 + 1 
37da : 90 08 __ BCC $37e4 ; (bm_usqrt.s7 + 0)
.s28:
37dc : 98 __ __ TYA
37dd : e5 44 __ SBC T2 + 1 
37df : a8 __ __ TAY
37e0 : 8a __ __ TXA
37e1 : 09 10 __ ORA #$10
37e3 : aa __ __ TAX
.s7:
37e4 : 8a __ __ TXA
37e5 : 4a __ __ LSR
37e6 : 85 44 __ STA T2 + 1 
37e8 : 8a __ __ TXA
37e9 : 09 04 __ ORA #$04
37eb : 85 1c __ STA ACCU + 1 
37ed : c4 1c __ CPY ACCU + 1 
37ef : 90 0a __ BCC $37fb ; (bm_usqrt.s8 + 0)
.s27:
37f1 : 98 __ __ TYA
37f2 : e5 1c __ SBC ACCU + 1 
37f4 : a8 __ __ TAY
37f5 : a5 44 __ LDA T2 + 1 
37f7 : 09 04 __ ORA #$04
37f9 : 85 44 __ STA T2 + 1 
.s8:
37fb : a5 44 __ LDA T2 + 1 
37fd : 4a __ __ LSR
37fe : 85 1c __ STA ACCU + 1 
3800 : a5 44 __ LDA T2 + 1 
3802 : 09 01 __ ORA #$01
3804 : 85 44 __ STA T2 + 1 
3806 : c4 44 __ CPY T2 + 1 
3808 : 90 0a __ BCC $3814 ; (bm_usqrt.s9 + 0)
.s26:
380a : 98 __ __ TYA
380b : e5 44 __ SBC T2 + 1 
380d : a8 __ __ TAY
380e : a5 1c __ LDA ACCU + 1 
3810 : 09 01 __ ORA #$01
3812 : 85 1c __ STA ACCU + 1 
.s9:
3814 : a5 1c __ LDA ACCU + 1 
3816 : 4a __ __ LSR
3817 : 85 44 __ STA T2 + 1 
3819 : a9 00 __ LDA #$00
381b : 6a __ __ ROR
381c : 85 43 __ STA T2 + 0 
381e : a6 0d __ LDX P0 ; (n + 0)
3820 : c4 1c __ CPY ACCU + 1 
3822 : d0 02 __ BNE $3826 ; (bm_usqrt.s25 + 0)
.s24:
3824 : e0 40 __ CPX #$40
.s25:
3826 : 90 0e __ BCC $3836 ; (bm_usqrt.s10 + 0)
.s23:
3828 : 8a __ __ TXA
3829 : e9 40 __ SBC #$40
382b : aa __ __ TAX
382c : 98 __ __ TYA
382d : e5 1c __ SBC ACCU + 1 
382f : a8 __ __ TAY
3830 : a5 43 __ LDA T2 + 0 
3832 : 09 40 __ ORA #$40
3834 : 85 43 __ STA T2 + 0 
.s10:
3836 : a5 44 __ LDA T2 + 1 
3838 : 4a __ __ LSR
3839 : 85 1c __ STA ACCU + 1 
383b : a5 43 __ LDA T2 + 0 
383d : 6a __ __ ROR
383e : 85 1b __ STA ACCU + 0 
3840 : a5 43 __ LDA T2 + 0 
3842 : 09 10 __ ORA #$10
3844 : 85 43 __ STA T2 + 0 
3846 : c4 44 __ CPY T2 + 1 
3848 : d0 02 __ BNE $384c ; (bm_usqrt.s22 + 0)
.s21:
384a : e4 43 __ CPX T2 + 0 
.s22:
384c : 90 0e __ BCC $385c ; (bm_usqrt.s11 + 0)
.s20:
384e : 8a __ __ TXA
384f : e5 43 __ SBC T2 + 0 
3851 : aa __ __ TAX
3852 : 98 __ __ TYA
3853 : e5 44 __ SBC T2 + 1 
3855 : a8 __ __ TAY
3856 : a5 1b __ LDA ACCU + 0 
3858 : 09 10 __ ORA #$10
385a : 85 1b __ STA ACCU + 0 
.s11:
385c : a5 1c __ LDA ACCU + 1 
385e : 4a __ __ LSR
385f : 85 44 __ STA T2 + 1 
3861 : a5 1b __ LDA ACCU + 0 
3863 : 6a __ __ ROR
3864 : 85 43 __ STA T2 + 0 
3866 : a5 1b __ LDA ACCU + 0 
3868 : 09 04 __ ORA #$04
386a : 85 1b __ STA ACCU + 0 
386c : c4 1c __ CPY ACCU + 1 
386e : d0 02 __ BNE $3872 ; (bm_usqrt.s19 + 0)
.s18:
3870 : e4 1b __ CPX ACCU + 0 
.s19:
3872 : 90 0e __ BCC $3882 ; (bm_usqrt.s12 + 0)
.s17:
3874 : 8a __ __ TXA
3875 : e5 1b __ SBC ACCU + 0 
3877 : aa __ __ TAX
3878 : 98 __ __ TYA
3879 : e5 1c __ SBC ACCU + 1 
387b : a8 __ __ TAY
387c : a5 43 __ LDA T2 + 0 
387e : 09 04 __ ORA #$04
3880 : 85 43 __ STA T2 + 0 
.s12:
3882 : a5 44 __ LDA T2 + 1 
3884 : 4a __ __ LSR
3885 : a5 43 __ LDA T2 + 0 
3887 : 6a __ __ ROR
3888 : c4 44 __ CPY T2 + 1 
388a : d0 0a __ BNE $3896 ; (bm_usqrt.s16 + 0)
.s15:
388c : a8 __ __ TAY
388d : a5 43 __ LDA T2 + 0 
388f : 09 01 __ ORA #$01
3891 : 85 43 __ STA T2 + 0 
3893 : e4 43 __ CPX T2 + 0 
3895 : 98 __ __ TYA
.s16:
3896 : 90 02 __ BCC $389a ; (bm_usqrt.s13 + 0)
.s14:
3898 : 09 01 __ ORA #$01
.s13:
389a : 85 1b __ STA ACCU + 0 
389c : a9 00 __ LDA #$00
.s3:
389e : 85 1c __ STA ACCU + 1 
38a0 : 60 __ __ RTS
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
38a1 : a5 14 __ LDA P7 ; (x0 + 1)
38a3 : 30 0a __ BMI $38af ; (bm_scan_fill.s24 + 0)
.s27:
38a5 : c5 0e __ CMP P1 ; (left + 1)
38a7 : d0 04 __ BNE $38ad ; (bm_scan_fill.s26 + 0)
.s25:
38a9 : a5 13 __ LDA P6 ; (x0 + 0)
38ab : c5 0d __ CMP P0 ; (left + 0)
.s26:
38ad : b0 08 __ BCS $38b7 ; (bm_scan_fill.s5 + 0)
.s24:
38af : a5 0d __ LDA P0 ; (left + 0)
38b1 : 85 13 __ STA P6 ; (x0 + 0)
38b3 : a5 0e __ LDA P1 ; (left + 1)
38b5 : 85 14 __ STA P7 ; (x0 + 1)
.s5:
38b7 : 24 16 __ BIT P9 ; (x1 + 1)
38b9 : 30 64 __ BMI $391f ; (bm_scan_fill.s3 + 0)
.s23:
38bb : a5 10 __ LDA P3 ; (right + 1)
38bd : c5 16 __ CMP P9 ; (x1 + 1)
38bf : f0 03 __ BEQ $38c4 ; (bm_scan_fill.s21 + 0)
38c1 : 4c 3b 3a JMP $3a3b ; (bm_scan_fill.s22 + 0)
.s21:
38c4 : a5 0f __ LDA P2 ; (right + 0)
38c6 : c5 15 __ CMP P8 ; (x1 + 0)
38c8 : b0 03 __ BCS $38cd ; (bm_scan_fill.s17 + 0)
38ca : 4c 25 3a JMP $3a25 ; (bm_scan_fill.s18 + 0)
.s17:
38cd : a5 14 __ LDA P7 ; (x0 + 1)
38cf : c5 16 __ CMP P9 ; (x1 + 1)
38d1 : d0 04 __ BNE $38d7 ; (bm_scan_fill.s20 + 0)
.s16:
38d3 : a5 13 __ LDA P6 ; (x0 + 0)
38d5 : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
38d7 : b0 46 __ BCS $391f ; (bm_scan_fill.s3 + 0)
.s6:
38d9 : a5 13 __ LDA P6 ; (x0 + 0)
38db : 29 f8 __ AND #$f8
38dd : 85 1b __ STA ACCU + 0 
38df : 65 11 __ ADC P4 ; (lp + 0)
38e1 : 85 43 __ STA T1 + 0 
38e3 : a5 12 __ LDA P5 ; (lp + 1)
38e5 : 65 14 __ ADC P7 ; (x0 + 1)
38e7 : 85 44 __ STA T1 + 1 
38e9 : a5 15 __ LDA P8 ; (x1 + 0)
38eb : 29 07 __ AND #$07
38ed : aa __ __ TAX
38ee : a5 13 __ LDA P6 ; (x0 + 0)
38f0 : 29 07 __ AND #$07
38f2 : bc f4 3f LDY $3ff4,x ; (rmask[0] + 0)
38f5 : aa __ __ TAX
38f6 : a5 15 __ LDA P8 ; (x1 + 0)
38f8 : 29 f8 __ AND #$f8
38fa : 38 __ __ SEC
38fb : e5 1b __ SBC ACCU + 0 
38fd : 85 1b __ STA ACCU + 0 
38ff : a5 16 __ LDA P9 ; (x1 + 1)
3901 : e5 14 __ SBC P7 ; (x0 + 1)
3903 : 85 1c __ STA ACCU + 1 
3905 : 05 1b __ ORA ACCU + 0 
3907 : d0 17 __ BNE $3920 ; (bm_scan_fill.s7 + 0)
.s15:
3909 : 98 __ __ TYA
390a : 3d ec 3f AND $3fec,x ; (lmask[0] + 0)
390d : 85 1e __ STA ACCU + 3 
390f : a0 00 __ LDY #$00
.s11:
3911 : 49 ff __ EOR #$ff
3913 : 31 43 __ AND (T1 + 0),y 
3915 : 85 1b __ STA ACCU + 0 
3917 : a5 17 __ LDA P10 ; (pat + 0)
3919 : 25 1e __ AND ACCU + 3 
391b : 05 1b __ ORA ACCU + 0 
391d : 91 43 __ STA (T1 + 0),y 
.s3:
391f : 60 __ __ RTS
.s7:
3920 : 84 1e __ STY ACCU + 3 
3922 : bd ec 3f LDA $3fec,x ; (lmask[0] + 0)
3925 : 49 ff __ EOR #$ff
3927 : a0 00 __ LDY #$00
3929 : 31 43 __ AND (T1 + 0),y 
392b : 85 1d __ STA ACCU + 2 
392d : a5 17 __ LDA P10 ; (pat + 0)
392f : 3d ec 3f AND $3fec,x ; (lmask[0] + 0)
3932 : 05 1d __ ORA ACCU + 2 
3934 : 91 43 __ STA (T1 + 0),y 
3936 : a5 1c __ LDA ACCU + 1 
3938 : d0 03 __ BNE $393d ; (bm_scan_fill.s14 + 0)
393a : 4c c8 39 JMP $39c8 ; (bm_scan_fill.s8 + 0)
.s14:
393d : a5 17 __ LDA P10 ; (pat + 0)
393f : a0 08 __ LDY #$08
3941 : 91 43 __ STA (T1 + 0),y 
3943 : a0 10 __ LDY #$10
3945 : 91 43 __ STA (T1 + 0),y 
3947 : a0 18 __ LDY #$18
3949 : 91 43 __ STA (T1 + 0),y 
394b : a0 20 __ LDY #$20
394d : 91 43 __ STA (T1 + 0),y 
394f : a0 28 __ LDY #$28
3951 : 91 43 __ STA (T1 + 0),y 
3953 : a0 30 __ LDY #$30
3955 : 91 43 __ STA (T1 + 0),y 
3957 : a0 38 __ LDY #$38
3959 : 91 43 __ STA (T1 + 0),y 
395b : a0 40 __ LDY #$40
395d : 91 43 __ STA (T1 + 0),y 
395f : a0 48 __ LDY #$48
3961 : 91 43 __ STA (T1 + 0),y 
3963 : a0 50 __ LDY #$50
3965 : 91 43 __ STA (T1 + 0),y 
3967 : a0 58 __ LDY #$58
3969 : 91 43 __ STA (T1 + 0),y 
396b : a0 60 __ LDY #$60
396d : 91 43 __ STA (T1 + 0),y 
396f : a0 68 __ LDY #$68
3971 : 91 43 __ STA (T1 + 0),y 
3973 : a0 70 __ LDY #$70
3975 : 91 43 __ STA (T1 + 0),y 
3977 : a0 78 __ LDY #$78
3979 : 91 43 __ STA (T1 + 0),y 
397b : a0 80 __ LDY #$80
397d : 91 43 __ STA (T1 + 0),y 
397f : a0 88 __ LDY #$88
3981 : 91 43 __ STA (T1 + 0),y 
3983 : a0 90 __ LDY #$90
3985 : 91 43 __ STA (T1 + 0),y 
3987 : a0 98 __ LDY #$98
3989 : 91 43 __ STA (T1 + 0),y 
398b : a0 a0 __ LDY #$a0
398d : 91 43 __ STA (T1 + 0),y 
398f : a0 a8 __ LDY #$a8
3991 : 91 43 __ STA (T1 + 0),y 
3993 : a0 b0 __ LDY #$b0
3995 : 91 43 __ STA (T1 + 0),y 
3997 : a0 b8 __ LDY #$b8
3999 : 91 43 __ STA (T1 + 0),y 
399b : a0 c0 __ LDY #$c0
399d : 91 43 __ STA (T1 + 0),y 
399f : a0 c8 __ LDY #$c8
39a1 : 91 43 __ STA (T1 + 0),y 
39a3 : a0 d0 __ LDY #$d0
39a5 : 91 43 __ STA (T1 + 0),y 
39a7 : a0 d8 __ LDY #$d8
39a9 : 91 43 __ STA (T1 + 0),y 
39ab : a0 e0 __ LDY #$e0
39ad : 91 43 __ STA (T1 + 0),y 
39af : a0 e8 __ LDY #$e8
39b1 : 91 43 __ STA (T1 + 0),y 
39b3 : a0 f0 __ LDY #$f0
39b5 : 91 43 __ STA (T1 + 0),y 
39b7 : a0 f8 __ LDY #$f8
39b9 : 91 43 __ STA (T1 + 0),y 
39bb : 38 __ __ SEC
39bc : a5 1b __ LDA ACCU + 0 
39be : e9 f8 __ SBC #$f8
39c0 : 85 1b __ STA ACCU + 0 
39c2 : e6 44 __ INC T1 + 1 
39c4 : a9 00 __ LDA #$00
39c6 : f0 48 __ BEQ $3a10 ; (bm_scan_fill.s28 + 0)
.s8:
39c8 : 24 1b __ BIT ACCU + 0 
39ca : 30 04 __ BMI $39d0 ; (bm_scan_fill.s13 + 0)
.s9:
39cc : a9 08 __ LDA #$08
39ce : d0 40 __ BNE $3a10 ; (bm_scan_fill.s28 + 0)
.s13:
39d0 : a5 17 __ LDA P10 ; (pat + 0)
39d2 : a0 08 __ LDY #$08
39d4 : 91 43 __ STA (T1 + 0),y 
39d6 : a0 10 __ LDY #$10
39d8 : 91 43 __ STA (T1 + 0),y 
39da : a0 18 __ LDY #$18
39dc : 91 43 __ STA (T1 + 0),y 
39de : a0 20 __ LDY #$20
39e0 : 91 43 __ STA (T1 + 0),y 
39e2 : a0 28 __ LDY #$28
39e4 : 91 43 __ STA (T1 + 0),y 
39e6 : a0 30 __ LDY #$30
39e8 : 91 43 __ STA (T1 + 0),y 
39ea : a0 38 __ LDY #$38
39ec : 91 43 __ STA (T1 + 0),y 
39ee : a0 40 __ LDY #$40
39f0 : 91 43 __ STA (T1 + 0),y 
39f2 : a0 48 __ LDY #$48
39f4 : 91 43 __ STA (T1 + 0),y 
39f6 : a0 50 __ LDY #$50
39f8 : 91 43 __ STA (T1 + 0),y 
39fa : a0 58 __ LDY #$58
39fc : 91 43 __ STA (T1 + 0),y 
39fe : a0 60 __ LDY #$60
3a00 : 91 43 __ STA (T1 + 0),y 
3a02 : a0 68 __ LDY #$68
3a04 : 91 43 __ STA (T1 + 0),y 
3a06 : a0 70 __ LDY #$70
3a08 : 91 43 __ STA (T1 + 0),y 
3a0a : a0 78 __ LDY #$78
3a0c : 91 43 __ STA (T1 + 0),y 
3a0e : a9 80 __ LDA #$80
.s28:
3a10 : a6 17 __ LDX P10 ; (pat + 0)
3a12 : 4c 1b 3a JMP $3a1b ; (bm_scan_fill.l10 + 0)
.s12:
3a15 : 8a __ __ TXA
3a16 : 91 43 __ STA (T1 + 0),y 
3a18 : 98 __ __ TYA
3a19 : 69 08 __ ADC #$08
.l10:
3a1b : a8 __ __ TAY
3a1c : c4 1b __ CPY ACCU + 0 
3a1e : 90 f5 __ BCC $3a15 ; (bm_scan_fill.s12 + 0)
.s29:
3a20 : a5 1e __ LDA ACCU + 3 
3a22 : 4c 11 39 JMP $3911 ; (bm_scan_fill.s11 + 0)
.s18:
3a25 : 85 15 __ STA P8 ; (x1 + 0)
3a27 : a5 10 __ LDA P3 ; (right + 1)
3a29 : 85 16 __ STA P9 ; (x1 + 1)
3a2b : a5 14 __ LDA P7 ; (x0 + 1)
3a2d : c5 10 __ CMP P3 ; (right + 1)
3a2f : f0 03 __ BEQ $3a34 ; (bm_scan_fill.s19 + 0)
3a31 : 4c d7 38 JMP $38d7 ; (bm_scan_fill.s20 + 0)
.s19:
3a34 : a5 13 __ LDA P6 ; (x0 + 0)
3a36 : c5 0f __ CMP P2 ; (right + 0)
3a38 : 4c d7 38 JMP $38d7 ; (bm_scan_fill.s20 + 0)
.s22:
3a3b : 90 03 __ BCC $3a40 ; (bm_scan_fill.s30 + 0)
3a3d : 4c cd 38 JMP $38cd ; (bm_scan_fill.s17 + 0)
.s30:
3a40 : a5 0f __ LDA P2 ; (right + 0)
3a42 : 90 e1 __ BCC $3a25 ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
mul16by8: ; mul16by8
3a44 : 4a __ __ LSR
3a45 : f0 2e __ BEQ $3a75 ; (mul16by8 + 49)
3a47 : a2 00 __ LDX #$00
3a49 : a0 00 __ LDY #$00
3a4b : 90 13 __ BCC $3a60 ; (mul16by8 + 28)
3a4d : a4 1b __ LDY ACCU + 0 
3a4f : a6 1c __ LDX ACCU + 1 
3a51 : b0 0d __ BCS $3a60 ; (mul16by8 + 28)
3a53 : 85 02 __ STA $02 
3a55 : 18 __ __ CLC
3a56 : 98 __ __ TYA
3a57 : 65 1b __ ADC ACCU + 0 
3a59 : a8 __ __ TAY
3a5a : 8a __ __ TXA
3a5b : 65 1c __ ADC ACCU + 1 
3a5d : aa __ __ TAX
3a5e : a5 02 __ LDA $02 
3a60 : 06 1b __ ASL ACCU + 0 
3a62 : 26 1c __ ROL ACCU + 1 
3a64 : 4a __ __ LSR
3a65 : 90 f9 __ BCC $3a60 ; (mul16by8 + 28)
3a67 : d0 ea __ BNE $3a53 ; (mul16by8 + 15)
3a69 : 18 __ __ CLC
3a6a : 98 __ __ TYA
3a6b : 65 1b __ ADC ACCU + 0 
3a6d : 85 1b __ STA ACCU + 0 
3a6f : 8a __ __ TXA
3a70 : 65 1c __ ADC ACCU + 1 
3a72 : 85 1c __ STA ACCU + 1 
3a74 : 60 __ __ RTS
3a75 : b0 04 __ BCS $3a7b ; (mul16by8 + 55)
3a77 : 85 1b __ STA ACCU + 0 
3a79 : 85 1c __ STA ACCU + 1 
3a7b : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
3a7c : a0 00 __ LDY #$00
3a7e : 84 07 __ STY WORK + 4 
3a80 : 84 08 __ STY WORK + 5 
3a82 : 84 09 __ STY WORK + 6 
3a84 : 4a __ __ LSR
3a85 : b0 0d __ BCS $3a94 ; (mul32by8 + 24)
3a87 : f0 26 __ BEQ $3aaf ; (mul32by8 + 51)
3a89 : 06 1b __ ASL ACCU + 0 
3a8b : 26 1c __ ROL ACCU + 1 
3a8d : 26 1d __ ROL ACCU + 2 
3a8f : 26 1e __ ROL ACCU + 3 
3a91 : 4a __ __ LSR
3a92 : 90 f5 __ BCC $3a89 ; (mul32by8 + 13)
3a94 : aa __ __ TAX
3a95 : 18 __ __ CLC
3a96 : a5 07 __ LDA WORK + 4 
3a98 : 65 1b __ ADC ACCU + 0 
3a9a : 85 07 __ STA WORK + 4 
3a9c : a5 08 __ LDA WORK + 5 
3a9e : 65 1c __ ADC ACCU + 1 
3aa0 : 85 08 __ STA WORK + 5 
3aa2 : a5 09 __ LDA WORK + 6 
3aa4 : 65 1d __ ADC ACCU + 2 
3aa6 : 85 09 __ STA WORK + 6 
3aa8 : 98 __ __ TYA
3aa9 : 65 1e __ ADC ACCU + 3 
3aab : a8 __ __ TAY
3aac : 8a __ __ TXA
3aad : d0 da __ BNE $3a89 ; (mul32by8 + 13)
3aaf : 84 0a __ STY WORK + 7 
3ab1 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
3ab2 : b1 19 __ LDA (IP + 0),y 
3ab4 : c8 __ __ INY
3ab5 : aa __ __ TAX
3ab6 : b5 00 __ LDA $00,x 
3ab8 : 85 03 __ STA WORK + 0 
3aba : b5 01 __ LDA $01,x 
3abc : 85 04 __ STA WORK + 1 
3abe : b5 02 __ LDA $02,x 
3ac0 : 85 05 __ STA WORK + 2 
3ac2 : b5 03 __ LDA WORK + 0,x 
3ac4 : 85 06 __ STA WORK + 3 
3ac6 : a5 05 __ LDA WORK + 2 
3ac8 : 0a __ __ ASL
3ac9 : a5 06 __ LDA WORK + 3 
3acb : 2a __ __ ROL
3acc : 85 08 __ STA WORK + 5 
3ace : f0 06 __ BEQ $3ad6 ; (freg + 36)
3ad0 : a5 05 __ LDA WORK + 2 
3ad2 : 09 80 __ ORA #$80
3ad4 : 85 05 __ STA WORK + 2 
3ad6 : a5 1d __ LDA ACCU + 2 
3ad8 : 0a __ __ ASL
3ad9 : a5 1e __ LDA ACCU + 3 
3adb : 2a __ __ ROL
3adc : 85 07 __ STA WORK + 4 
3ade : f0 06 __ BEQ $3ae6 ; (freg + 52)
3ae0 : a5 1d __ LDA ACCU + 2 
3ae2 : 09 80 __ ORA #$80
3ae4 : 85 1d __ STA ACCU + 2 
3ae6 : 60 __ __ RTS
3ae7 : 06 1e __ ASL ACCU + 3 
3ae9 : a5 07 __ LDA WORK + 4 
3aeb : 6a __ __ ROR
3aec : 85 1e __ STA ACCU + 3 
3aee : b0 06 __ BCS $3af6 ; (freg + 68)
3af0 : a5 1d __ LDA ACCU + 2 
3af2 : 29 7f __ AND #$7f
3af4 : 85 1d __ STA ACCU + 2 
3af6 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
3af7 : a5 06 __ LDA WORK + 3 
3af9 : 49 80 __ EOR #$80
3afb : 85 06 __ STA WORK + 3 
3afd : a9 ff __ LDA #$ff
3aff : c5 07 __ CMP WORK + 4 
3b01 : f0 04 __ BEQ $3b07 ; (faddsub + 16)
3b03 : c5 08 __ CMP WORK + 5 
3b05 : d0 11 __ BNE $3b18 ; (faddsub + 33)
3b07 : a5 1e __ LDA ACCU + 3 
3b09 : 09 7f __ ORA #$7f
3b0b : 85 1e __ STA ACCU + 3 
3b0d : a9 80 __ LDA #$80
3b0f : 85 1d __ STA ACCU + 2 
3b11 : a9 00 __ LDA #$00
3b13 : 85 1b __ STA ACCU + 0 
3b15 : 85 1c __ STA ACCU + 1 
3b17 : 60 __ __ RTS
3b18 : 38 __ __ SEC
3b19 : a5 07 __ LDA WORK + 4 
3b1b : e5 08 __ SBC WORK + 5 
3b1d : f0 38 __ BEQ $3b57 ; (faddsub + 96)
3b1f : aa __ __ TAX
3b20 : b0 25 __ BCS $3b47 ; (faddsub + 80)
3b22 : e0 e9 __ CPX #$e9
3b24 : b0 0e __ BCS $3b34 ; (faddsub + 61)
3b26 : a5 08 __ LDA WORK + 5 
3b28 : 85 07 __ STA WORK + 4 
3b2a : a9 00 __ LDA #$00
3b2c : 85 1b __ STA ACCU + 0 
3b2e : 85 1c __ STA ACCU + 1 
3b30 : 85 1d __ STA ACCU + 2 
3b32 : f0 23 __ BEQ $3b57 ; (faddsub + 96)
3b34 : a5 1d __ LDA ACCU + 2 
3b36 : 4a __ __ LSR
3b37 : 66 1c __ ROR ACCU + 1 
3b39 : 66 1b __ ROR ACCU + 0 
3b3b : e8 __ __ INX
3b3c : d0 f8 __ BNE $3b36 ; (faddsub + 63)
3b3e : 85 1d __ STA ACCU + 2 
3b40 : a5 08 __ LDA WORK + 5 
3b42 : 85 07 __ STA WORK + 4 
3b44 : 4c 57 3b JMP $3b57 ; (faddsub + 96)
3b47 : e0 18 __ CPX #$18
3b49 : b0 33 __ BCS $3b7e ; (faddsub + 135)
3b4b : a5 05 __ LDA WORK + 2 
3b4d : 4a __ __ LSR
3b4e : 66 04 __ ROR WORK + 1 
3b50 : 66 03 __ ROR WORK + 0 
3b52 : ca __ __ DEX
3b53 : d0 f8 __ BNE $3b4d ; (faddsub + 86)
3b55 : 85 05 __ STA WORK + 2 
3b57 : a5 1e __ LDA ACCU + 3 
3b59 : 29 80 __ AND #$80
3b5b : 85 1e __ STA ACCU + 3 
3b5d : 45 06 __ EOR WORK + 3 
3b5f : 30 31 __ BMI $3b92 ; (faddsub + 155)
3b61 : 18 __ __ CLC
3b62 : a5 1b __ LDA ACCU + 0 
3b64 : 65 03 __ ADC WORK + 0 
3b66 : 85 1b __ STA ACCU + 0 
3b68 : a5 1c __ LDA ACCU + 1 
3b6a : 65 04 __ ADC WORK + 1 
3b6c : 85 1c __ STA ACCU + 1 
3b6e : a5 1d __ LDA ACCU + 2 
3b70 : 65 05 __ ADC WORK + 2 
3b72 : 85 1d __ STA ACCU + 2 
3b74 : 90 08 __ BCC $3b7e ; (faddsub + 135)
3b76 : 66 1d __ ROR ACCU + 2 
3b78 : 66 1c __ ROR ACCU + 1 
3b7a : 66 1b __ ROR ACCU + 0 
3b7c : e6 07 __ INC WORK + 4 
3b7e : a5 07 __ LDA WORK + 4 
3b80 : c9 ff __ CMP #$ff
3b82 : f0 83 __ BEQ $3b07 ; (faddsub + 16)
3b84 : 4a __ __ LSR
3b85 : 05 1e __ ORA ACCU + 3 
3b87 : 85 1e __ STA ACCU + 3 
3b89 : b0 06 __ BCS $3b91 ; (faddsub + 154)
3b8b : a5 1d __ LDA ACCU + 2 
3b8d : 29 7f __ AND #$7f
3b8f : 85 1d __ STA ACCU + 2 
3b91 : 60 __ __ RTS
3b92 : 38 __ __ SEC
3b93 : a5 1b __ LDA ACCU + 0 
3b95 : e5 03 __ SBC WORK + 0 
3b97 : 85 1b __ STA ACCU + 0 
3b99 : a5 1c __ LDA ACCU + 1 
3b9b : e5 04 __ SBC WORK + 1 
3b9d : 85 1c __ STA ACCU + 1 
3b9f : a5 1d __ LDA ACCU + 2 
3ba1 : e5 05 __ SBC WORK + 2 
3ba3 : 85 1d __ STA ACCU + 2 
3ba5 : b0 19 __ BCS $3bc0 ; (faddsub + 201)
3ba7 : 38 __ __ SEC
3ba8 : a9 00 __ LDA #$00
3baa : e5 1b __ SBC ACCU + 0 
3bac : 85 1b __ STA ACCU + 0 
3bae : a9 00 __ LDA #$00
3bb0 : e5 1c __ SBC ACCU + 1 
3bb2 : 85 1c __ STA ACCU + 1 
3bb4 : a9 00 __ LDA #$00
3bb6 : e5 1d __ SBC ACCU + 2 
3bb8 : 85 1d __ STA ACCU + 2 
3bba : a5 1e __ LDA ACCU + 3 
3bbc : 49 80 __ EOR #$80
3bbe : 85 1e __ STA ACCU + 3 
3bc0 : a5 1d __ LDA ACCU + 2 
3bc2 : 30 ba __ BMI $3b7e ; (faddsub + 135)
3bc4 : 05 1c __ ORA ACCU + 1 
3bc6 : 05 1b __ ORA ACCU + 0 
3bc8 : f0 0f __ BEQ $3bd9 ; (faddsub + 226)
3bca : c6 07 __ DEC WORK + 4 
3bcc : f0 0b __ BEQ $3bd9 ; (faddsub + 226)
3bce : 06 1b __ ASL ACCU + 0 
3bd0 : 26 1c __ ROL ACCU + 1 
3bd2 : 26 1d __ ROL ACCU + 2 
3bd4 : 10 f4 __ BPL $3bca ; (faddsub + 211)
3bd6 : 4c 7e 3b JMP $3b7e ; (faddsub + 135)
3bd9 : a9 00 __ LDA #$00
3bdb : 85 1b __ STA ACCU + 0 
3bdd : 85 1c __ STA ACCU + 1 
3bdf : 85 1d __ STA ACCU + 2 
3be1 : 85 1e __ STA ACCU + 3 
3be3 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
3be4 : a5 1b __ LDA ACCU + 0 
3be6 : 05 1c __ ORA ACCU + 1 
3be8 : 05 1d __ ORA ACCU + 2 
3bea : f0 0e __ BEQ $3bfa ; (crt_fmul + 22)
3bec : a5 03 __ LDA WORK + 0 
3bee : 05 04 __ ORA WORK + 1 
3bf0 : 05 05 __ ORA WORK + 2 
3bf2 : d0 09 __ BNE $3bfd ; (crt_fmul + 25)
3bf4 : 85 1b __ STA ACCU + 0 
3bf6 : 85 1c __ STA ACCU + 1 
3bf8 : 85 1d __ STA ACCU + 2 
3bfa : 85 1e __ STA ACCU + 3 
3bfc : 60 __ __ RTS
3bfd : a5 1e __ LDA ACCU + 3 
3bff : 45 06 __ EOR WORK + 3 
3c01 : 29 80 __ AND #$80
3c03 : 85 1e __ STA ACCU + 3 
3c05 : a9 ff __ LDA #$ff
3c07 : c5 07 __ CMP WORK + 4 
3c09 : f0 42 __ BEQ $3c4d ; (crt_fmul + 105)
3c0b : c5 08 __ CMP WORK + 5 
3c0d : f0 3e __ BEQ $3c4d ; (crt_fmul + 105)
3c0f : a9 00 __ LDA #$00
3c11 : 85 09 __ STA WORK + 6 
3c13 : 85 0a __ STA WORK + 7 
3c15 : 85 0b __ STA WORK + 8 
3c17 : a4 1b __ LDY ACCU + 0 
3c19 : a5 03 __ LDA WORK + 0 
3c1b : d0 06 __ BNE $3c23 ; (crt_fmul + 63)
3c1d : a5 04 __ LDA WORK + 1 
3c1f : f0 0a __ BEQ $3c2b ; (crt_fmul + 71)
3c21 : d0 05 __ BNE $3c28 ; (crt_fmul + 68)
3c23 : 20 7e 3c JSR $3c7e ; (crt_fmul8 + 0)
3c26 : a5 04 __ LDA WORK + 1 
3c28 : 20 7e 3c JSR $3c7e ; (crt_fmul8 + 0)
3c2b : a5 05 __ LDA WORK + 2 
3c2d : 20 7e 3c JSR $3c7e ; (crt_fmul8 + 0)
3c30 : 38 __ __ SEC
3c31 : a5 0b __ LDA WORK + 8 
3c33 : 30 06 __ BMI $3c3b ; (crt_fmul + 87)
3c35 : 06 09 __ ASL WORK + 6 
3c37 : 26 0a __ ROL WORK + 7 
3c39 : 2a __ __ ROL
3c3a : 18 __ __ CLC
3c3b : 29 7f __ AND #$7f
3c3d : 85 0b __ STA WORK + 8 
3c3f : a5 07 __ LDA WORK + 4 
3c41 : 65 08 __ ADC WORK + 5 
3c43 : 90 19 __ BCC $3c5e ; (crt_fmul + 122)
3c45 : e9 7f __ SBC #$7f
3c47 : b0 04 __ BCS $3c4d ; (crt_fmul + 105)
3c49 : c9 ff __ CMP #$ff
3c4b : d0 15 __ BNE $3c62 ; (crt_fmul + 126)
3c4d : a5 1e __ LDA ACCU + 3 
3c4f : 09 7f __ ORA #$7f
3c51 : 85 1e __ STA ACCU + 3 
3c53 : a9 80 __ LDA #$80
3c55 : 85 1d __ STA ACCU + 2 
3c57 : a9 00 __ LDA #$00
3c59 : 85 1b __ STA ACCU + 0 
3c5b : 85 1c __ STA ACCU + 1 
3c5d : 60 __ __ RTS
3c5e : e9 7e __ SBC #$7e
3c60 : 90 15 __ BCC $3c77 ; (crt_fmul + 147)
3c62 : 4a __ __ LSR
3c63 : 05 1e __ ORA ACCU + 3 
3c65 : 85 1e __ STA ACCU + 3 
3c67 : a9 00 __ LDA #$00
3c69 : 6a __ __ ROR
3c6a : 05 0b __ ORA WORK + 8 
3c6c : 85 1d __ STA ACCU + 2 
3c6e : a5 0a __ LDA WORK + 7 
3c70 : 85 1c __ STA ACCU + 1 
3c72 : a5 09 __ LDA WORK + 6 
3c74 : 85 1b __ STA ACCU + 0 
3c76 : 60 __ __ RTS
3c77 : a9 00 __ LDA #$00
3c79 : 85 1e __ STA ACCU + 3 
3c7b : f0 d8 __ BEQ $3c55 ; (crt_fmul + 113)
3c7d : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
3c7e : 38 __ __ SEC
3c7f : 6a __ __ ROR
3c80 : 90 1e __ BCC $3ca0 ; (crt_fmul8 + 34)
3c82 : aa __ __ TAX
3c83 : 18 __ __ CLC
3c84 : 98 __ __ TYA
3c85 : 65 09 __ ADC WORK + 6 
3c87 : 85 09 __ STA WORK + 6 
3c89 : a5 0a __ LDA WORK + 7 
3c8b : 65 1c __ ADC ACCU + 1 
3c8d : 85 0a __ STA WORK + 7 
3c8f : a5 0b __ LDA WORK + 8 
3c91 : 65 1d __ ADC ACCU + 2 
3c93 : 6a __ __ ROR
3c94 : 85 0b __ STA WORK + 8 
3c96 : 8a __ __ TXA
3c97 : 66 0a __ ROR WORK + 7 
3c99 : 66 09 __ ROR WORK + 6 
3c9b : 4a __ __ LSR
3c9c : f0 0d __ BEQ $3cab ; (crt_fmul8 + 45)
3c9e : b0 e2 __ BCS $3c82 ; (crt_fmul8 + 4)
3ca0 : 66 0b __ ROR WORK + 8 
3ca2 : 66 0a __ ROR WORK + 7 
3ca4 : 66 09 __ ROR WORK + 6 
3ca6 : 4a __ __ LSR
3ca7 : 90 f7 __ BCC $3ca0 ; (crt_fmul8 + 34)
3ca9 : d0 d7 __ BNE $3c82 ; (crt_fmul8 + 4)
3cab : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
3cac : a5 1b __ LDA ACCU + 0 
3cae : 05 1c __ ORA ACCU + 1 
3cb0 : 05 1d __ ORA ACCU + 2 
3cb2 : d0 03 __ BNE $3cb7 ; (crt_fdiv + 11)
3cb4 : 85 1e __ STA ACCU + 3 
3cb6 : 60 __ __ RTS
3cb7 : a5 1e __ LDA ACCU + 3 
3cb9 : 45 06 __ EOR WORK + 3 
3cbb : 29 80 __ AND #$80
3cbd : 85 1e __ STA ACCU + 3 
3cbf : a5 08 __ LDA WORK + 5 
3cc1 : f0 62 __ BEQ $3d25 ; (crt_fdiv + 121)
3cc3 : a5 07 __ LDA WORK + 4 
3cc5 : c9 ff __ CMP #$ff
3cc7 : f0 5c __ BEQ $3d25 ; (crt_fdiv + 121)
3cc9 : a9 00 __ LDA #$00
3ccb : 85 09 __ STA WORK + 6 
3ccd : 85 0a __ STA WORK + 7 
3ccf : 85 0b __ STA WORK + 8 
3cd1 : a2 18 __ LDX #$18
3cd3 : a5 1b __ LDA ACCU + 0 
3cd5 : c5 03 __ CMP WORK + 0 
3cd7 : a5 1c __ LDA ACCU + 1 
3cd9 : e5 04 __ SBC WORK + 1 
3cdb : a5 1d __ LDA ACCU + 2 
3cdd : e5 05 __ SBC WORK + 2 
3cdf : 90 13 __ BCC $3cf4 ; (crt_fdiv + 72)
3ce1 : a5 1b __ LDA ACCU + 0 
3ce3 : e5 03 __ SBC WORK + 0 
3ce5 : 85 1b __ STA ACCU + 0 
3ce7 : a5 1c __ LDA ACCU + 1 
3ce9 : e5 04 __ SBC WORK + 1 
3ceb : 85 1c __ STA ACCU + 1 
3ced : a5 1d __ LDA ACCU + 2 
3cef : e5 05 __ SBC WORK + 2 
3cf1 : 85 1d __ STA ACCU + 2 
3cf3 : 38 __ __ SEC
3cf4 : 26 09 __ ROL WORK + 6 
3cf6 : 26 0a __ ROL WORK + 7 
3cf8 : 26 0b __ ROL WORK + 8 
3cfa : ca __ __ DEX
3cfb : f0 0a __ BEQ $3d07 ; (crt_fdiv + 91)
3cfd : 06 1b __ ASL ACCU + 0 
3cff : 26 1c __ ROL ACCU + 1 
3d01 : 26 1d __ ROL ACCU + 2 
3d03 : b0 dc __ BCS $3ce1 ; (crt_fdiv + 53)
3d05 : 90 cc __ BCC $3cd3 ; (crt_fdiv + 39)
3d07 : 38 __ __ SEC
3d08 : a5 0b __ LDA WORK + 8 
3d0a : 30 06 __ BMI $3d12 ; (crt_fdiv + 102)
3d0c : 06 09 __ ASL WORK + 6 
3d0e : 26 0a __ ROL WORK + 7 
3d10 : 2a __ __ ROL
3d11 : 18 __ __ CLC
3d12 : 29 7f __ AND #$7f
3d14 : 85 0b __ STA WORK + 8 
3d16 : a5 07 __ LDA WORK + 4 
3d18 : e5 08 __ SBC WORK + 5 
3d1a : 90 1a __ BCC $3d36 ; (crt_fdiv + 138)
3d1c : 18 __ __ CLC
3d1d : 69 7f __ ADC #$7f
3d1f : b0 04 __ BCS $3d25 ; (crt_fdiv + 121)
3d21 : c9 ff __ CMP #$ff
3d23 : d0 15 __ BNE $3d3a ; (crt_fdiv + 142)
3d25 : a5 1e __ LDA ACCU + 3 
3d27 : 09 7f __ ORA #$7f
3d29 : 85 1e __ STA ACCU + 3 
3d2b : a9 80 __ LDA #$80
3d2d : 85 1d __ STA ACCU + 2 
3d2f : a9 00 __ LDA #$00
3d31 : 85 1c __ STA ACCU + 1 
3d33 : 85 1b __ STA ACCU + 0 
3d35 : 60 __ __ RTS
3d36 : 69 7f __ ADC #$7f
3d38 : 90 15 __ BCC $3d4f ; (crt_fdiv + 163)
3d3a : 4a __ __ LSR
3d3b : 05 1e __ ORA ACCU + 3 
3d3d : 85 1e __ STA ACCU + 3 
3d3f : a9 00 __ LDA #$00
3d41 : 6a __ __ ROR
3d42 : 05 0b __ ORA WORK + 8 
3d44 : 85 1d __ STA ACCU + 2 
3d46 : a5 0a __ LDA WORK + 7 
3d48 : 85 1c __ STA ACCU + 1 
3d4a : a5 09 __ LDA WORK + 6 
3d4c : 85 1b __ STA ACCU + 0 
3d4e : 60 __ __ RTS
3d4f : a9 00 __ LDA #$00
3d51 : 85 1e __ STA ACCU + 3 
3d53 : 85 1d __ STA ACCU + 2 
3d55 : 85 1c __ STA ACCU + 1 
3d57 : 85 1b __ STA ACCU + 0 
3d59 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
3d5a : a0 00 __ LDY #$00
3d5c : 84 06 __ STY WORK + 3 
3d5e : a5 03 __ LDA WORK + 0 
3d60 : a6 04 __ LDX WORK + 1 
3d62 : f0 1c __ BEQ $3d80 ; (mul16 + 38)
3d64 : 38 __ __ SEC
3d65 : 6a __ __ ROR
3d66 : 90 0d __ BCC $3d75 ; (mul16 + 27)
3d68 : aa __ __ TAX
3d69 : 18 __ __ CLC
3d6a : 98 __ __ TYA
3d6b : 65 1b __ ADC ACCU + 0 
3d6d : a8 __ __ TAY
3d6e : a5 06 __ LDA WORK + 3 
3d70 : 65 1c __ ADC ACCU + 1 
3d72 : 85 06 __ STA WORK + 3 
3d74 : 8a __ __ TXA
3d75 : 06 1b __ ASL ACCU + 0 
3d77 : 26 1c __ ROL ACCU + 1 
3d79 : 4a __ __ LSR
3d7a : 90 f9 __ BCC $3d75 ; (mul16 + 27)
3d7c : d0 ea __ BNE $3d68 ; (mul16 + 14)
3d7e : a5 04 __ LDA WORK + 1 
3d80 : 4a __ __ LSR
3d81 : 90 0d __ BCC $3d90 ; (mul16 + 54)
3d83 : aa __ __ TAX
3d84 : 18 __ __ CLC
3d85 : 98 __ __ TYA
3d86 : 65 1b __ ADC ACCU + 0 
3d88 : a8 __ __ TAY
3d89 : a5 06 __ LDA WORK + 3 
3d8b : 65 1c __ ADC ACCU + 1 
3d8d : 85 06 __ STA WORK + 3 
3d8f : 8a __ __ TXA
3d90 : 06 1b __ ASL ACCU + 0 
3d92 : 26 1c __ ROL ACCU + 1 
3d94 : 4a __ __ LSR
3d95 : b0 ec __ BCS $3d83 ; (mul16 + 41)
3d97 : d0 f7 __ BNE $3d90 ; (mul16 + 54)
3d99 : 84 05 __ STY WORK + 2 
3d9b : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
3d9c : 24 1c __ BIT ACCU + 1 
3d9e : 10 0d __ BPL $3dad ; (divs16 + 17)
3da0 : 20 ef 35 JSR $35ef ; (negaccu + 0)
3da3 : 24 04 __ BIT WORK + 1 
3da5 : 10 0d __ BPL $3db4 ; (divs16 + 24)
3da7 : 20 ba 3d JSR $3dba ; (negtmp + 0)
3daa : 4c c8 3d JMP $3dc8 ; (divmod + 0)
3dad : 24 04 __ BIT WORK + 1 
3daf : 10 f9 __ BPL $3daa ; (divs16 + 14)
3db1 : 20 ba 3d JSR $3dba ; (negtmp + 0)
3db4 : 20 c8 3d JSR $3dc8 ; (divmod + 0)
3db7 : 4c ef 35 JMP $35ef ; (negaccu + 0)
--------------------------------------------------------------------
negtmp: ; negtmp
3dba : 38 __ __ SEC
3dbb : a9 00 __ LDA #$00
3dbd : e5 03 __ SBC WORK + 0 
3dbf : 85 03 __ STA WORK + 0 
3dc1 : a9 00 __ LDA #$00
3dc3 : e5 04 __ SBC WORK + 1 
3dc5 : 85 04 __ STA WORK + 1 
3dc7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
3dc8 : a5 1c __ LDA ACCU + 1 
3dca : d0 31 __ BNE $3dfd ; (divmod + 53)
3dcc : a5 04 __ LDA WORK + 1 
3dce : d0 1e __ BNE $3dee ; (divmod + 38)
3dd0 : 85 06 __ STA WORK + 3 
3dd2 : a2 04 __ LDX #$04
3dd4 : 06 1b __ ASL ACCU + 0 
3dd6 : 2a __ __ ROL
3dd7 : c5 03 __ CMP WORK + 0 
3dd9 : 90 02 __ BCC $3ddd ; (divmod + 21)
3ddb : e5 03 __ SBC WORK + 0 
3ddd : 26 1b __ ROL ACCU + 0 
3ddf : 2a __ __ ROL
3de0 : c5 03 __ CMP WORK + 0 
3de2 : 90 02 __ BCC $3de6 ; (divmod + 30)
3de4 : e5 03 __ SBC WORK + 0 
3de6 : 26 1b __ ROL ACCU + 0 
3de8 : ca __ __ DEX
3de9 : d0 eb __ BNE $3dd6 ; (divmod + 14)
3deb : 85 05 __ STA WORK + 2 
3ded : 60 __ __ RTS
3dee : a5 1b __ LDA ACCU + 0 
3df0 : 85 05 __ STA WORK + 2 
3df2 : a5 1c __ LDA ACCU + 1 
3df4 : 85 06 __ STA WORK + 3 
3df6 : a9 00 __ LDA #$00
3df8 : 85 1b __ STA ACCU + 0 
3dfa : 85 1c __ STA ACCU + 1 
3dfc : 60 __ __ RTS
3dfd : a5 04 __ LDA WORK + 1 
3dff : d0 1f __ BNE $3e20 ; (divmod + 88)
3e01 : a5 03 __ LDA WORK + 0 
3e03 : 30 1b __ BMI $3e20 ; (divmod + 88)
3e05 : a9 00 __ LDA #$00
3e07 : 85 06 __ STA WORK + 3 
3e09 : a2 10 __ LDX #$10
3e0b : 06 1b __ ASL ACCU + 0 
3e0d : 26 1c __ ROL ACCU + 1 
3e0f : 2a __ __ ROL
3e10 : c5 03 __ CMP WORK + 0 
3e12 : 90 02 __ BCC $3e16 ; (divmod + 78)
3e14 : e5 03 __ SBC WORK + 0 
3e16 : 26 1b __ ROL ACCU + 0 
3e18 : 26 1c __ ROL ACCU + 1 
3e1a : ca __ __ DEX
3e1b : d0 f2 __ BNE $3e0f ; (divmod + 71)
3e1d : 85 05 __ STA WORK + 2 
3e1f : 60 __ __ RTS
3e20 : a9 00 __ LDA #$00
3e22 : 85 05 __ STA WORK + 2 
3e24 : 85 06 __ STA WORK + 3 
3e26 : 84 02 __ STY $02 
3e28 : a0 10 __ LDY #$10
3e2a : 18 __ __ CLC
3e2b : 26 1b __ ROL ACCU + 0 
3e2d : 26 1c __ ROL ACCU + 1 
3e2f : 26 05 __ ROL WORK + 2 
3e31 : 26 06 __ ROL WORK + 3 
3e33 : 38 __ __ SEC
3e34 : a5 05 __ LDA WORK + 2 
3e36 : e5 03 __ SBC WORK + 0 
3e38 : aa __ __ TAX
3e39 : a5 06 __ LDA WORK + 3 
3e3b : e5 04 __ SBC WORK + 1 
3e3d : 90 04 __ BCC $3e43 ; (divmod + 123)
3e3f : 86 05 __ STX WORK + 2 
3e41 : 85 06 __ STA WORK + 3 
3e43 : 88 __ __ DEY
3e44 : d0 e5 __ BNE $3e2b ; (divmod + 99)
3e46 : 26 1b __ ROL ACCU + 0 
3e48 : 26 1c __ ROL ACCU + 1 
3e4a : a4 02 __ LDY $02 
3e4c : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
3e4d : 24 1c __ BIT ACCU + 1 
3e4f : 10 10 __ BPL $3e61 ; (mods16 + 20)
3e51 : 20 ef 35 JSR $35ef ; (negaccu + 0)
3e54 : 24 04 __ BIT WORK + 1 
3e56 : 10 03 __ BPL $3e5b ; (mods16 + 14)
3e58 : 20 ba 3d JSR $3dba ; (negtmp + 0)
3e5b : 20 c8 3d JSR $3dc8 ; (divmod + 0)
3e5e : 4c 6c 3e JMP $3e6c ; (negtmpb + 0)
3e61 : 24 04 __ BIT WORK + 1 
3e63 : 10 03 __ BPL $3e68 ; (mods16 + 27)
3e65 : 20 ba 3d JSR $3dba ; (negtmp + 0)
3e68 : 4c c8 3d JMP $3dc8 ; (divmod + 0)
3e6b : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
3e6c : 38 __ __ SEC
3e6d : a9 00 __ LDA #$00
3e6f : e5 05 __ SBC WORK + 2 
3e71 : 85 05 __ STA WORK + 2 
3e73 : a9 00 __ LDA #$00
3e75 : e5 06 __ SBC WORK + 3 
3e77 : 85 06 __ STA WORK + 3 
3e79 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
3e7a : 20 d6 3a JSR $3ad6 ; (freg + 36)
3e7d : a5 07 __ LDA WORK + 4 
3e7f : c9 7f __ CMP #$7f
3e81 : b0 07 __ BCS $3e8a ; (f32_to_i16 + 16)
3e83 : a9 00 __ LDA #$00
3e85 : 85 1b __ STA ACCU + 0 
3e87 : 85 1c __ STA ACCU + 1 
3e89 : 60 __ __ RTS
3e8a : e9 8e __ SBC #$8e
3e8c : 90 16 __ BCC $3ea4 ; (f32_to_i16 + 42)
3e8e : 24 1e __ BIT ACCU + 3 
3e90 : 30 09 __ BMI $3e9b ; (f32_to_i16 + 33)
3e92 : a9 ff __ LDA #$ff
3e94 : 85 1b __ STA ACCU + 0 
3e96 : a9 7f __ LDA #$7f
3e98 : 85 1c __ STA ACCU + 1 
3e9a : 60 __ __ RTS
3e9b : a9 00 __ LDA #$00
3e9d : 85 1b __ STA ACCU + 0 
3e9f : a9 80 __ LDA #$80
3ea1 : 85 1c __ STA ACCU + 1 
3ea3 : 60 __ __ RTS
3ea4 : aa __ __ TAX
3ea5 : a5 1c __ LDA ACCU + 1 
3ea7 : 46 1d __ LSR ACCU + 2 
3ea9 : 6a __ __ ROR
3eaa : e8 __ __ INX
3eab : d0 fa __ BNE $3ea7 ; (f32_to_i16 + 45)
3ead : 24 1e __ BIT ACCU + 3 
3eaf : 10 0e __ BPL $3ebf ; (f32_to_i16 + 69)
3eb1 : 38 __ __ SEC
3eb2 : 49 ff __ EOR #$ff
3eb4 : 69 00 __ ADC #$00
3eb6 : 85 1b __ STA ACCU + 0 
3eb8 : a9 00 __ LDA #$00
3eba : e5 1d __ SBC ACCU + 2 
3ebc : 85 1c __ STA ACCU + 1 
3ebe : 60 __ __ RTS
3ebf : 85 1b __ STA ACCU + 0 
3ec1 : a5 1d __ LDA ACCU + 2 
3ec3 : 85 1c __ STA ACCU + 1 
3ec5 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
3ec6 : 24 1c __ BIT ACCU + 1 
3ec8 : 30 03 __ BMI $3ecd ; (sint16_to_float + 7)
3eca : 4c e4 3e JMP $3ee4 ; (uint16_to_float + 0)
3ecd : 38 __ __ SEC
3ece : a9 00 __ LDA #$00
3ed0 : e5 1b __ SBC ACCU + 0 
3ed2 : 85 1b __ STA ACCU + 0 
3ed4 : a9 00 __ LDA #$00
3ed6 : e5 1c __ SBC ACCU + 1 
3ed8 : 85 1c __ STA ACCU + 1 
3eda : 20 e4 3e JSR $3ee4 ; (uint16_to_float + 0)
3edd : a5 1e __ LDA ACCU + 3 
3edf : 09 80 __ ORA #$80
3ee1 : 85 1e __ STA ACCU + 3 
3ee3 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
3ee4 : a5 1b __ LDA ACCU + 0 
3ee6 : 05 1c __ ORA ACCU + 1 
3ee8 : d0 05 __ BNE $3eef ; (uint16_to_float + 11)
3eea : 85 1d __ STA ACCU + 2 
3eec : 85 1e __ STA ACCU + 3 
3eee : 60 __ __ RTS
3eef : a2 8e __ LDX #$8e
3ef1 : a5 1c __ LDA ACCU + 1 
3ef3 : 30 06 __ BMI $3efb ; (uint16_to_float + 23)
3ef5 : ca __ __ DEX
3ef6 : 06 1b __ ASL ACCU + 0 
3ef8 : 2a __ __ ROL
3ef9 : 10 fa __ BPL $3ef5 ; (uint16_to_float + 17)
3efb : 0a __ __ ASL
3efc : 85 1d __ STA ACCU + 2 
3efe : a5 1b __ LDA ACCU + 0 
3f00 : 85 1c __ STA ACCU + 1 
3f02 : 8a __ __ TXA
3f03 : 4a __ __ LSR
3f04 : 85 1e __ STA ACCU + 3 
3f06 : a9 00 __ LDA #$00
3f08 : 85 1b __ STA ACCU + 0 
3f0a : 66 1d __ ROR ACCU + 2 
3f0c : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
3f0d : 84 02 __ STY $02 
3f0f : a0 20 __ LDY #$20
3f11 : a9 00 __ LDA #$00
3f13 : 85 07 __ STA WORK + 4 
3f15 : 85 08 __ STA WORK + 5 
3f17 : 85 09 __ STA WORK + 6 
3f19 : 85 0a __ STA WORK + 7 
3f1b : a5 05 __ LDA WORK + 2 
3f1d : 05 06 __ ORA WORK + 3 
3f1f : d0 78 __ BNE $3f99 ; (divmod32 + 140)
3f21 : a5 04 __ LDA WORK + 1 
3f23 : d0 27 __ BNE $3f4c ; (divmod32 + 63)
3f25 : 18 __ __ CLC
3f26 : 26 1b __ ROL ACCU + 0 
3f28 : 26 1c __ ROL ACCU + 1 
3f2a : 26 1d __ ROL ACCU + 2 
3f2c : 26 1e __ ROL ACCU + 3 
3f2e : 2a __ __ ROL
3f2f : 90 05 __ BCC $3f36 ; (divmod32 + 41)
3f31 : e5 03 __ SBC WORK + 0 
3f33 : 38 __ __ SEC
3f34 : b0 06 __ BCS $3f3c ; (divmod32 + 47)
3f36 : c5 03 __ CMP WORK + 0 
3f38 : 90 02 __ BCC $3f3c ; (divmod32 + 47)
3f3a : e5 03 __ SBC WORK + 0 
3f3c : 88 __ __ DEY
3f3d : d0 e7 __ BNE $3f26 ; (divmod32 + 25)
3f3f : 85 07 __ STA WORK + 4 
3f41 : 26 1b __ ROL ACCU + 0 
3f43 : 26 1c __ ROL ACCU + 1 
3f45 : 26 1d __ ROL ACCU + 2 
3f47 : 26 1e __ ROL ACCU + 3 
3f49 : a4 02 __ LDY $02 
3f4b : 60 __ __ RTS
3f4c : a5 1e __ LDA ACCU + 3 
3f4e : d0 10 __ BNE $3f60 ; (divmod32 + 83)
3f50 : a6 1d __ LDX ACCU + 2 
3f52 : 86 1e __ STX ACCU + 3 
3f54 : a6 1c __ LDX ACCU + 1 
3f56 : 86 1d __ STX ACCU + 2 
3f58 : a6 1b __ LDX ACCU + 0 
3f5a : 86 1c __ STX ACCU + 1 
3f5c : 85 1b __ STA ACCU + 0 
3f5e : a0 18 __ LDY #$18
3f60 : 18 __ __ CLC
3f61 : 26 1b __ ROL ACCU + 0 
3f63 : 26 1c __ ROL ACCU + 1 
3f65 : 26 1d __ ROL ACCU + 2 
3f67 : 26 1e __ ROL ACCU + 3 
3f69 : 26 07 __ ROL WORK + 4 
3f6b : 26 08 __ ROL WORK + 5 
3f6d : 90 0c __ BCC $3f7b ; (divmod32 + 110)
3f6f : a5 07 __ LDA WORK + 4 
3f71 : e5 03 __ SBC WORK + 0 
3f73 : aa __ __ TAX
3f74 : a5 08 __ LDA WORK + 5 
3f76 : e5 04 __ SBC WORK + 1 
3f78 : 38 __ __ SEC
3f79 : b0 0c __ BCS $3f87 ; (divmod32 + 122)
3f7b : 38 __ __ SEC
3f7c : a5 07 __ LDA WORK + 4 
3f7e : e5 03 __ SBC WORK + 0 
3f80 : aa __ __ TAX
3f81 : a5 08 __ LDA WORK + 5 
3f83 : e5 04 __ SBC WORK + 1 
3f85 : 90 04 __ BCC $3f8b ; (divmod32 + 126)
3f87 : 86 07 __ STX WORK + 4 
3f89 : 85 08 __ STA WORK + 5 
3f8b : 88 __ __ DEY
3f8c : d0 d3 __ BNE $3f61 ; (divmod32 + 84)
3f8e : 26 1b __ ROL ACCU + 0 
3f90 : 26 1c __ ROL ACCU + 1 
3f92 : 26 1d __ ROL ACCU + 2 
3f94 : 26 1e __ ROL ACCU + 3 
3f96 : a4 02 __ LDY $02 
3f98 : 60 __ __ RTS
3f99 : a0 10 __ LDY #$10
3f9b : a5 1e __ LDA ACCU + 3 
3f9d : 85 08 __ STA WORK + 5 
3f9f : a5 1d __ LDA ACCU + 2 
3fa1 : 85 07 __ STA WORK + 4 
3fa3 : a9 00 __ LDA #$00
3fa5 : 85 1d __ STA ACCU + 2 
3fa7 : 85 1e __ STA ACCU + 3 
3fa9 : 18 __ __ CLC
3faa : 26 1b __ ROL ACCU + 0 
3fac : 26 1c __ ROL ACCU + 1 
3fae : 26 07 __ ROL WORK + 4 
3fb0 : 26 08 __ ROL WORK + 5 
3fb2 : 26 09 __ ROL WORK + 6 
3fb4 : 26 0a __ ROL WORK + 7 
3fb6 : a5 07 __ LDA WORK + 4 
3fb8 : c5 03 __ CMP WORK + 0 
3fba : a5 08 __ LDA WORK + 5 
3fbc : e5 04 __ SBC WORK + 1 
3fbe : a5 09 __ LDA WORK + 6 
3fc0 : e5 05 __ SBC WORK + 2 
3fc2 : aa __ __ TAX
3fc3 : a5 0a __ LDA WORK + 7 
3fc5 : e5 06 __ SBC WORK + 3 
3fc7 : 90 11 __ BCC $3fda ; (divmod32 + 205)
3fc9 : 86 09 __ STX WORK + 6 
3fcb : 85 0a __ STA WORK + 7 
3fcd : a5 07 __ LDA WORK + 4 
3fcf : e5 03 __ SBC WORK + 0 
3fd1 : 85 07 __ STA WORK + 4 
3fd3 : a5 08 __ LDA WORK + 5 
3fd5 : e5 04 __ SBC WORK + 1 
3fd7 : 85 08 __ STA WORK + 5 
3fd9 : 38 __ __ SEC
3fda : 88 __ __ DEY
3fdb : d0 cd __ BNE $3faa ; (divmod32 + 157)
3fdd : 26 1b __ ROL ACCU + 0 
3fdf : 26 1c __ ROL ACCU + 1 
3fe1 : a4 02 __ LDY $02 
3fe3 : 60 __ __ RTS
--------------------------------------------------------------------
check:
3fe4 : __ __ __ BYT 55 aa 55 aa 55 aa 55 aa                         : U.U.U.U.
--------------------------------------------------------------------
lmask:
3fec : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
3ff4 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
3ffc : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
mul40:
4000 : __ __ __ BYT 00 00 28 00 50 00 78 00 a0 00 c8 00 f0 00 18 01 : ..(.P.x.........
4010 : __ __ __ BYT 40 01 68 01 90 01 b8 01 e0 01 08 02 30 02 58 02 : @.h.........0.X.
4020 : __ __ __ BYT 80 02 a8 02 d0 02 f8 02 20 03 48 03 70 03 98 03 : ........ .H.p...
4030 : __ __ __ BYT c0 03                                           : ..
--------------------------------------------------------------------
p2smap:
4032 : __ __ __ BYT 00 00 40 20 80 c0 80 80                         : ..@ ....
--------------------------------------------------------------------
s2pmap:
403a : __ __ __ BYT 40 00 20 c0 c0 80 a0 40                         : @. ....@
--------------------------------------------------------------------
tpow10:
4042 : __ __ __ BYT 00 00 80 3f 00 00 20 41 00 00 c8 42 00 00 7a 44 : ...?.. A...B..zD
4052 : __ __ __ BYT 00 40 1c 46 00 50 c3 47 00 24 74 49             : .@.F.P.G.$tI
--------------------------------------------------------------------
fround5:
405e : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
406e : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
black:
407a : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
white:
4082 : __ __ __ BYT ff ff ff ff ff ff ff ff                         : ........
--------------------------------------------------------------------
bitshift:
408a : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
409a : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
40aa : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
40ba : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
rasterIRQRows:
40c2 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
40d3 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
40e4 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQLow:
40f5 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
4105 : __ __ __ BSS	16
--------------------------------------------------------------------
Screen:
4115 : __ __ __ BSS	8
--------------------------------------------------------------------
rirqtop:
4120 : __ __ __ BSS	32
--------------------------------------------------------------------
rirqbottom:
4140 : __ __ __ BSS	32
--------------------------------------------------------------------
twin:
4160 : __ __ __ BSS	12
--------------------------------------------------------------------
ewin:
416c : __ __ __ BSS	12
--------------------------------------------------------------------
BLIT_CODE:
4200 : __ __ __ BSS	224
