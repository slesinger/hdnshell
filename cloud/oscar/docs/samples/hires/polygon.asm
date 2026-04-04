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
080e : 8e dc 32 STX $32dc ; (spentry + 0)
0811 : a2 33 __ LDX #$33
0813 : a0 80 __ LDY #$80
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 34 __ CPX #$34
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
083b : a9 3e __ LDA #$3e
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
;  39, "/home/honza/projects/c64/projects/oscar64/samples/hires/polygon.c"
.s1:
0880 : a2 19 __ LDX #$19
0882 : b5 53 __ LDA T0 + 0,x 
0884 : 9d 40 9f STA $9f40,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 ce 0e JSR $0ece ; (init.s4 + 0)
088d : a9 00 __ LDA #$00
088f : 8d f0 9f STA $9ff0 ; (sstack + 0)
0892 : 8d f1 9f STA $9ff1 ; (sstack + 1)
0895 : 8d f2 9f STA $9ff2 ; (sstack + 2)
0898 : 8d f3 9f STA $9ff3 ; (sstack + 3)
089b : 8d f6 9f STA $9ff6 ; (sstack + 6)
089e : 8d f7 9f STA $9ff7 ; (sstack + 7)
08a1 : 8d f8 9f STA $9ff8 ; (sstack + 8)
08a4 : 8d f9 9f STA $9ff9 ; (sstack + 9)
08a7 : 8d fd 9f STA $9ffd ; (sstack + 13)
08aa : a9 20 __ LDA #$20
08ac : 85 18 __ STA P11 
08ae : a9 80 __ LDA #$80
08b0 : 85 16 __ STA P9 
08b2 : 8d f4 9f STA $9ff4 ; (sstack + 4)
08b5 : a9 40 __ LDA #$40
08b7 : 8d fa 9f STA $9ffa ; (sstack + 10)
08ba : a9 01 __ LDA #$01
08bc : 8d fb 9f STA $9ffb ; (sstack + 11)
08bf : a9 c8 __ LDA #$c8
08c1 : 8d fc 9f STA $9ffc ; (sstack + 12)
08c4 : a9 33 __ LDA #$33
08c6 : 85 17 __ STA P10 
08c8 : 8d f5 9f STA $9ff5 ; (sstack + 5)
08cb : a9 20 __ LDA #$20
08cd : 8d fe 9f STA $9ffe ; (sstack + 14)
08d0 : a9 33 __ LDA #$33
08d2 : 8d ff 9f STA $9fff ; (sstack + 15)
08d5 : 20 2c 10 JSR $102c ; (bmu_bitblit.s1 + 0)
08d8 : a9 0e __ LDA #$0e
08da : 8d f0 9f STA $9ff0 ; (sstack + 0)
08dd : 8d f2 9f STA $9ff2 ; (sstack + 2)
08e0 : a9 04 __ LDA #$04
08e2 : 85 18 __ STA P11 
08e4 : a9 00 __ LDA #$00
08e6 : 8d f1 9f STA $9ff1 ; (sstack + 1)
08e9 : 8d f3 9f STA $9ff3 ; (sstack + 3)
08ec : a9 0e __ LDA #$0e
08ee : 8d f6 9f STA $9ff6 ; (sstack + 6)
08f1 : 8d f8 9f STA $9ff8 ; (sstack + 8)
08f4 : a9 80 __ LDA #$80
08f6 : 8d f4 9f STA $9ff4 ; (sstack + 4)
08f9 : a9 33 __ LDA #$33
08fb : 8d f5 9f STA $9ff5 ; (sstack + 5)
08fe : a9 00 __ LDA #$00
0900 : 8d f7 9f STA $9ff7 ; (sstack + 7)
0903 : 8d f9 9f STA $9ff9 ; (sstack + 9)
0906 : 8d fd 9f STA $9ffd ; (sstack + 13)
0909 : 8d fe 9f STA $9ffe ; (sstack + 14)
090c : 8d ff 9f STA $9fff ; (sstack + 15)
090f : a9 30 __ LDA #$30
0911 : 8d fa 9f STA $9ffa ; (sstack + 10)
0914 : a9 01 __ LDA #$01
0916 : 8d fb 9f STA $9ffb ; (sstack + 11)
0919 : a9 b8 __ LDA #$b8
091b : 8d fc 9f STA $9ffc ; (sstack + 12)
091e : 20 2c 10 JSR $102c ; (bmu_bitblit.s1 + 0)
0921 : a9 08 __ LDA #$08
0923 : 8d f0 9f STA $9ff0 ; (sstack + 0)
0926 : 8d f2 9f STA $9ff2 ; (sstack + 2)
0929 : a9 44 __ LDA #$44
092b : 85 18 __ STA P11 
092d : a9 00 __ LDA #$00
092f : 8d f1 9f STA $9ff1 ; (sstack + 1)
0932 : 8d f3 9f STA $9ff3 ; (sstack + 3)
0935 : a9 08 __ LDA #$08
0937 : 8d f6 9f STA $9ff6 ; (sstack + 6)
093a : 8d f8 9f STA $9ff8 ; (sstack + 8)
093d : a9 80 __ LDA #$80
093f : 8d f4 9f STA $9ff4 ; (sstack + 4)
0942 : a9 33 __ LDA #$33
0944 : 8d f5 9f STA $9ff5 ; (sstack + 5)
0947 : a9 00 __ LDA #$00
0949 : 8d f7 9f STA $9ff7 ; (sstack + 7)
094c : 8d f9 9f STA $9ff9 ; (sstack + 9)
094f : 8d fd 9f STA $9ffd ; (sstack + 13)
0952 : 8d fe 9f STA $9ffe ; (sstack + 14)
0955 : 8d ff 9f STA $9fff ; (sstack + 15)
0958 : a9 30 __ LDA #$30
095a : 8d fa 9f STA $9ffa ; (sstack + 10)
095d : a9 01 __ LDA #$01
095f : 8d fb 9f STA $9ffb ; (sstack + 11)
0962 : a9 b8 __ LDA #$b8
0964 : 8d fc 9f STA $9ffc ; (sstack + 12)
0967 : 20 2c 10 JSR $102c ; (bmu_bitblit.s1 + 0)
096a : a9 0a __ LDA #$0a
096c : 8d f0 9f STA $9ff0 ; (sstack + 0)
096f : 8d f2 9f STA $9ff2 ; (sstack + 2)
0972 : a9 04 __ LDA #$04
0974 : 85 18 __ STA P11 
0976 : a9 00 __ LDA #$00
0978 : 8d f1 9f STA $9ff1 ; (sstack + 1)
097b : 8d f3 9f STA $9ff3 ; (sstack + 3)
097e : a9 0a __ LDA #$0a
0980 : 8d f6 9f STA $9ff6 ; (sstack + 6)
0983 : 8d f8 9f STA $9ff8 ; (sstack + 8)
0986 : a9 80 __ LDA #$80
0988 : 8d f4 9f STA $9ff4 ; (sstack + 4)
098b : a9 33 __ LDA #$33
098d : 8d f5 9f STA $9ff5 ; (sstack + 5)
0990 : a9 00 __ LDA #$00
0992 : 8d f7 9f STA $9ff7 ; (sstack + 7)
0995 : 8d f9 9f STA $9ff9 ; (sstack + 9)
0998 : 8d fd 9f STA $9ffd ; (sstack + 13)
099b : 8d fe 9f STA $9ffe ; (sstack + 14)
099e : 8d ff 9f STA $9fff ; (sstack + 15)
09a1 : a9 2c __ LDA #$2c
09a3 : 8d fa 9f STA $9ffa ; (sstack + 10)
09a6 : a9 01 __ LDA #$01
09a8 : 8d fb 9f STA $9ffb ; (sstack + 11)
09ab : a9 b4 __ LDA #$b4
09ad : 8d fc 9f STA $9ffc ; (sstack + 12)
09b0 : 20 2c 10 JSR $102c ; (bmu_bitblit.s1 + 0)
09b3 : a2 07 __ LDX #$07
.l5:
09b5 : bd 11 19 LDA $1911,x 
09b8 : 9d d6 9f STA $9fd6,x ; (cr.left + 0)
09bb : ca __ __ DEX
09bc : 10 f7 __ BPL $09b5 ; (main.l5 + 0)
.s6:
09be : a9 00 __ LDA #$00
09c0 : 85 63 __ STA T4 + 0 
09c2 : 85 67 __ STA T5 + 0 
.l7:
09c4 : 85 1b __ STA ACCU + 0 
09c6 : a9 00 __ LDA #$00
09c8 : 85 1c __ STA ACCU + 1 
09ca : 20 04 31 JSR $3104 ; (sint16_to_float + 0)
09cd : a9 db __ LDA #$db
09cf : 85 03 __ STA WORK + 0 
09d1 : a9 40 __ LDA #$40
09d3 : 85 06 __ STA WORK + 3 
09d5 : a9 0f __ LDA #$0f
09d7 : 85 04 __ STA WORK + 1 
09d9 : a9 49 __ LDA #$49
09db : 85 05 __ STA WORK + 2 
09dd : 20 a5 2c JSR $2ca5 ; (freg + 20)
09e0 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
09e3 : a9 00 __ LDA #$00
09e5 : 85 03 __ STA WORK + 0 
09e7 : 85 04 __ STA WORK + 1 
09e9 : a9 a0 __ LDA #$a0
09eb : 85 05 __ STA WORK + 2 
09ed : a9 40 __ LDA #$40
09ef : 85 06 __ STA WORK + 3 
09f1 : 20 a5 2c JSR $2ca5 ; (freg + 20)
09f4 : 20 8b 2e JSR $2e8b ; (crt_fdiv + 0)
09f7 : a5 1b __ LDA ACCU + 0 
09f9 : 85 57 __ STA T1 + 0 
09fb : a5 1c __ LDA ACCU + 1 
09fd : 85 58 __ STA T1 + 1 
09ff : a5 1d __ LDA ACCU + 2 
0a01 : 85 59 __ STA T1 + 2 
0a03 : a5 1e __ LDA ACCU + 3 
0a05 : 85 5a __ STA T1 + 3 
0a07 : a9 db __ LDA #$db
0a09 : 85 03 __ STA WORK + 0 
0a0b : a9 3f __ LDA #$3f
0a0d : 85 06 __ STA WORK + 3 
0a0f : a9 0f __ LDA #$0f
0a11 : 85 04 __ STA WORK + 1 
0a13 : a9 c9 __ LDA #$c9
0a15 : 85 05 __ STA WORK + 2 
0a17 : 20 a5 2c JSR $2ca5 ; (freg + 20)
0a1a : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0a1d : a5 1b __ LDA ACCU + 0 
0a1f : 85 0d __ STA P0 
0a21 : a5 1c __ LDA ACCU + 1 
0a23 : 85 0e __ STA P1 
0a25 : a5 1d __ LDA ACCU + 2 
0a27 : 85 0f __ STA P2 
0a29 : a5 1e __ LDA ACCU + 3 
0a2b : 85 10 __ STA P3 
0a2d : 20 19 19 JSR $1919 ; (sin.s4 + 0)
0a30 : a5 1b __ LDA ACCU + 0 
0a32 : 85 5b __ STA T2 + 0 
0a34 : a5 1c __ LDA ACCU + 1 
0a36 : 85 5c __ STA T2 + 1 
0a38 : a5 1d __ LDA ACCU + 2 
0a3a : 85 5d __ STA T2 + 2 
0a3c : a5 1e __ LDA ACCU + 3 
0a3e : 85 5e __ STA T2 + 3 
0a40 : a5 57 __ LDA T1 + 0 
0a42 : 85 0d __ STA P0 
0a44 : a5 58 __ LDA T1 + 1 
0a46 : 85 0e __ STA P1 
0a48 : a5 59 __ LDA T1 + 2 
0a4a : 85 0f __ STA P2 
0a4c : a5 5a __ LDA T1 + 3 
0a4e : 85 10 __ STA P3 
0a50 : 20 19 19 JSR $1919 ; (sin.s4 + 0)
0a53 : a5 1b __ LDA ACCU + 0 
0a55 : 85 53 __ STA T0 + 0 
0a57 : a5 1c __ LDA ACCU + 1 
0a59 : 85 54 __ STA T0 + 1 
0a5b : a5 1d __ LDA ACCU + 2 
0a5d : 85 55 __ STA T0 + 2 
0a5f : a5 1e __ LDA ACCU + 3 
0a61 : 85 56 __ STA T0 + 3 
0a63 : a5 63 __ LDA T4 + 0 
0a65 : 4a __ __ LSR
0a66 : 90 0e __ BCC $0a76 ; (main.s8 + 0)
.s16:
0a68 : a9 00 __ LDA #$00
0a6a : 85 57 __ STA T1 + 0 
0a6c : 85 58 __ STA T1 + 1 
0a6e : a9 80 __ LDA #$80
0a70 : 85 59 __ STA T1 + 2 
0a72 : a9 3f __ LDA #$3f
0a74 : b0 0c __ BCS $0a82 ; (main.s9 + 0)
.s8:
0a76 : a9 cc __ LDA #$cc
0a78 : 85 58 __ STA T1 + 1 
0a7a : 85 59 __ STA T1 + 2 
0a7c : a9 cd __ LDA #$cd
0a7e : 85 57 __ STA T1 + 0 
0a80 : a9 3e __ LDA #$3e
.s9:
0a82 : 85 5a __ STA T1 + 3 
0a84 : a5 5b __ LDA T2 + 0 
0a86 : 85 1b __ STA ACCU + 0 
0a88 : a5 5c __ LDA T2 + 1 
0a8a : 85 1c __ STA ACCU + 1 
0a8c : a5 5d __ LDA T2 + 2 
0a8e : 85 1d __ STA ACCU + 2 
0a90 : a5 5e __ LDA T2 + 3 
0a92 : 85 1e __ STA ACCU + 3 
0a94 : a2 57 __ LDX #$57
0a96 : 20 95 2c JSR $2c95 ; (freg + 4)
0a99 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0a9c : a5 1b __ LDA ACCU + 0 
0a9e : a6 67 __ LDX T5 + 0 
0aa0 : 9d ac 9f STA $9fac,x ; (px[0] + 0)
0aa3 : a5 1c __ LDA ACCU + 1 
0aa5 : 9d ad 9f STA $9fad,x ; (px[0] + 1)
0aa8 : a5 1d __ LDA ACCU + 2 
0aaa : 9d ae 9f STA $9fae,x ; (px[0] + 2)
0aad : a5 1e __ LDA ACCU + 3 
0aaf : 9d af 9f STA $9faf,x ; (px[0] + 3)
0ab2 : a5 53 __ LDA T0 + 0 
0ab4 : 85 1b __ STA ACCU + 0 
0ab6 : a5 54 __ LDA T0 + 1 
0ab8 : 85 1c __ STA ACCU + 1 
0aba : a5 55 __ LDA T0 + 2 
0abc : 85 1d __ STA ACCU + 2 
0abe : a5 56 __ LDA T0 + 3 
0ac0 : 85 1e __ STA ACCU + 3 
0ac2 : a2 57 __ LDX #$57
0ac4 : 20 95 2c JSR $2c95 ; (freg + 4)
0ac7 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0aca : a5 1b __ LDA ACCU + 0 
0acc : a6 67 __ LDX T5 + 0 
0ace : 9d 84 9f STA $9f84,x ; (py[0] + 0)
0ad1 : a5 1c __ LDA ACCU + 1 
0ad3 : 9d 85 9f STA $9f85,x ; (py[0] + 1)
0ad6 : a5 1d __ LDA ACCU + 2 
0ad8 : 9d 86 9f STA $9f86,x ; (py[0] + 2)
0adb : a5 1e __ LDA ACCU + 3 
0add : 9d 87 9f STA $9f87,x ; (py[0] + 3)
0ae0 : 8a __ __ TXA
0ae1 : 18 __ __ CLC
0ae2 : 69 04 __ ADC #$04
0ae4 : 85 67 __ STA T5 + 0 
0ae6 : e6 63 __ INC T4 + 0 
0ae8 : a5 63 __ LDA T4 + 0 
0aea : c9 0a __ CMP #$0a
0aec : b0 03 __ BCS $0af1 ; (main.s10 + 0)
0aee : 4c c4 09 JMP $09c4 ; (main.l7 + 0)
.s10:
0af1 : a9 00 __ LDA #$00
0af3 : 85 6b __ STA T10 + 0 
0af5 : a9 04 __ LDA #$04
0af7 : 85 6c __ STA T11 + 0 
.l11:
0af9 : a5 6b __ LDA T10 + 0 
0afb : 85 1b __ STA ACCU + 0 
0afd : a9 00 __ LDA #$00
0aff : 85 1c __ STA ACCU + 1 
0b01 : 20 04 31 JSR $3104 ; (sint16_to_float + 0)
0b04 : a9 db __ LDA #$db
0b06 : 85 03 __ STA WORK + 0 
0b08 : a9 40 __ LDA #$40
0b0a : 85 06 __ STA WORK + 3 
0b0c : a9 0f __ LDA #$0f
0b0e : 85 04 __ STA WORK + 1 
0b10 : a9 49 __ LDA #$49
0b12 : 85 05 __ STA WORK + 2 
0b14 : 20 a5 2c JSR $2ca5 ; (freg + 20)
0b17 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0b1a : a9 00 __ LDA #$00
0b1c : 85 03 __ STA WORK + 0 
0b1e : 85 04 __ STA WORK + 1 
0b20 : a9 80 __ LDA #$80
0b22 : 85 05 __ STA WORK + 2 
0b24 : a9 41 __ LDA #$41
0b26 : 85 06 __ STA WORK + 3 
0b28 : 20 a5 2c JSR $2ca5 ; (freg + 20)
0b2b : 20 8b 2e JSR $2e8b ; (crt_fdiv + 0)
0b2e : a5 1b __ LDA ACCU + 0 
0b30 : 85 57 __ STA T1 + 0 
0b32 : a5 1c __ LDA ACCU + 1 
0b34 : 85 58 __ STA T1 + 1 
0b36 : a5 1d __ LDA ACCU + 2 
0b38 : 85 59 __ STA T1 + 2 
0b3a : a5 1e __ LDA ACCU + 3 
0b3c : 85 5a __ STA T1 + 3 
0b3e : a2 1b __ LDX #$1b
0b40 : 20 95 2c JSR $2c95 ; (freg + 4)
0b43 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0b46 : a5 1b __ LDA ACCU + 0 
0b48 : 85 63 __ STA T4 + 0 
0b4a : a5 1c __ LDA ACCU + 1 
0b4c : 85 64 __ STA T4 + 1 
0b4e : a5 1d __ LDA ACCU + 2 
0b50 : 85 65 __ STA T4 + 2 
0b52 : a5 1e __ LDA ACCU + 3 
0b54 : 85 66 __ STA T4 + 3 
0b56 : a9 db __ LDA #$db
0b58 : 85 1b __ STA ACCU + 0 
0b5a : a9 3f __ LDA #$3f
0b5c : 85 1e __ STA ACCU + 3 
0b5e : a9 0f __ LDA #$0f
0b60 : 85 1c __ STA ACCU + 1 
0b62 : a9 c9 __ LDA #$c9
0b64 : 85 1d __ STA ACCU + 2 
0b66 : a2 57 __ LDX #$57
0b68 : 20 95 2c JSR $2c95 ; (freg + 4)
0b6b : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0b6e : a5 1b __ LDA ACCU + 0 
0b70 : 85 0d __ STA P0 
0b72 : a5 1c __ LDA ACCU + 1 
0b74 : 85 0e __ STA P1 
0b76 : a5 1d __ LDA ACCU + 2 
0b78 : 85 0f __ STA P2 
0b7a : a5 1e __ LDA ACCU + 3 
0b7c : 85 10 __ STA P3 
0b7e : 20 19 19 JSR $1919 ; (sin.s4 + 0)
0b81 : a5 1b __ LDA ACCU + 0 
0b83 : 85 5b __ STA T2 + 0 
0b85 : a5 1c __ LDA ACCU + 1 
0b87 : 85 5c __ STA T2 + 1 
0b89 : a5 1d __ LDA ACCU + 2 
0b8b : 85 5d __ STA T2 + 2 
0b8d : a5 1e __ LDA ACCU + 3 
0b8f : 85 5e __ STA T2 + 3 
0b91 : a5 57 __ LDA T1 + 0 
0b93 : 85 0d __ STA P0 
0b95 : a5 58 __ LDA T1 + 1 
0b97 : 85 0e __ STA P1 
0b99 : a5 59 __ LDA T1 + 2 
0b9b : 85 0f __ STA P2 
0b9d : a5 5a __ LDA T1 + 3 
0b9f : 85 10 __ STA P3 
0ba1 : 20 19 19 JSR $1919 ; (sin.s4 + 0)
0ba4 : a5 1b __ LDA ACCU + 0 
0ba6 : 85 5f __ STA T3 + 0 
0ba8 : a5 1c __ LDA ACCU + 1 
0baa : 85 60 __ STA T3 + 1 
0bac : a5 1d __ LDA ACCU + 2 
0bae : 85 61 __ STA T3 + 2 
0bb0 : a5 1e __ LDA ACCU + 3 
0bb2 : 85 62 __ STA T3 + 3 
0bb4 : a9 db __ LDA #$db
0bb6 : 85 1b __ STA ACCU + 0 
0bb8 : a9 3f __ LDA #$3f
0bba : 85 1e __ STA ACCU + 3 
0bbc : a9 0f __ LDA #$0f
0bbe : 85 1c __ STA ACCU + 1 
0bc0 : a9 c9 __ LDA #$c9
0bc2 : 85 1d __ STA ACCU + 2 
0bc4 : a2 63 __ LDX #$63
0bc6 : 20 95 2c JSR $2c95 ; (freg + 4)
0bc9 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0bcc : a5 1b __ LDA ACCU + 0 
0bce : 85 0d __ STA P0 
0bd0 : a5 1c __ LDA ACCU + 1 
0bd2 : 85 0e __ STA P1 
0bd4 : a5 1d __ LDA ACCU + 2 
0bd6 : 85 0f __ STA P2 
0bd8 : a5 1e __ LDA ACCU + 3 
0bda : 85 10 __ STA P3 
0bdc : 20 19 19 JSR $1919 ; (sin.s4 + 0)
0bdf : a5 1b __ LDA ACCU + 0 
0be1 : 85 67 __ STA T5 + 0 
0be3 : a5 1c __ LDA ACCU + 1 
0be5 : 85 68 __ STA T5 + 1 
0be7 : a5 1d __ LDA ACCU + 2 
0be9 : 85 69 __ STA T5 + 2 
0beb : a5 1e __ LDA ACCU + 3 
0bed : 85 6a __ STA T5 + 3 
0bef : a5 63 __ LDA T4 + 0 
0bf1 : 85 0d __ STA P0 
0bf3 : a5 64 __ LDA T4 + 1 
0bf5 : 85 0e __ STA P1 
0bf7 : a5 65 __ LDA T4 + 2 
0bf9 : 85 0f __ STA P2 
0bfb : a5 66 __ LDA T4 + 3 
0bfd : 85 10 __ STA P3 
0bff : 20 19 19 JSR $1919 ; (sin.s4 + 0)
0c02 : a5 1b __ LDA ACCU + 0 
0c04 : 85 53 __ STA T0 + 0 
0c06 : a5 1c __ LDA ACCU + 1 
0c08 : 85 54 __ STA T0 + 1 
0c0a : a5 1d __ LDA ACCU + 2 
0c0c : 85 55 __ STA T0 + 2 
0c0e : a5 1e __ LDA ACCU + 3 
0c10 : 85 56 __ STA T0 + 3 
0c12 : a5 6c __ LDA T11 + 0 
0c14 : 85 1b __ STA ACCU + 0 
0c16 : a9 00 __ LDA #$00
0c18 : 85 1c __ STA ACCU + 1 
0c1a : 20 04 31 JSR $3104 ; (sint16_to_float + 0)
0c1d : a5 1b __ LDA ACCU + 0 
0c1f : 85 57 __ STA T1 + 0 
0c21 : a5 1c __ LDA ACCU + 1 
0c23 : 85 58 __ STA T1 + 1 
0c25 : a5 1d __ LDA ACCU + 2 
0c27 : 85 59 __ STA T1 + 2 
0c29 : a5 1e __ LDA ACCU + 3 
0c2b : 85 5a __ STA T1 + 3 
0c2d : a5 5b __ LDA T2 + 0 
0c2f : 85 1b __ STA ACCU + 0 
0c31 : a5 5c __ LDA T2 + 1 
0c33 : 85 1c __ STA ACCU + 1 
0c35 : a5 5d __ LDA T2 + 2 
0c37 : 85 1d __ STA ACCU + 2 
0c39 : a5 5e __ LDA T2 + 3 
0c3b : 85 1e __ STA ACCU + 3 
0c3d : a2 57 __ LDX #$57
0c3f : 20 95 2c JSR $2c95 ; (freg + 4)
0c42 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0c45 : a5 1b __ LDA ACCU + 0 
0c47 : 85 5b __ STA T2 + 0 
0c49 : a5 1c __ LDA ACCU + 1 
0c4b : 85 5c __ STA T2 + 1 
0c4d : a5 1d __ LDA ACCU + 2 
0c4f : 85 5d __ STA T2 + 2 
0c51 : a5 1e __ LDA ACCU + 3 
0c53 : 85 5e __ STA T2 + 3 
0c55 : a5 5f __ LDA T3 + 0 
0c57 : 85 1b __ STA ACCU + 0 
0c59 : a5 60 __ LDA T3 + 1 
0c5b : 85 1c __ STA ACCU + 1 
0c5d : a5 61 __ LDA T3 + 2 
0c5f : 85 1d __ STA ACCU + 2 
0c61 : a5 62 __ LDA T3 + 3 
0c63 : 85 1e __ STA ACCU + 3 
0c65 : a2 57 __ LDX #$57
0c67 : 20 95 2c JSR $2c95 ; (freg + 4)
0c6a : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0c6d : a5 1b __ LDA ACCU + 0 
0c6f : 85 5f __ STA T3 + 0 
0c71 : a5 1c __ LDA ACCU + 1 
0c73 : 85 60 __ STA T3 + 1 
0c75 : a5 1d __ LDA ACCU + 2 
0c77 : 85 61 __ STA T3 + 2 
0c79 : a5 1e __ LDA ACCU + 3 
0c7b : 85 62 __ STA T3 + 3 
0c7d : a5 57 __ LDA T1 + 0 
0c7f : 85 1b __ STA ACCU + 0 
0c81 : a5 58 __ LDA T1 + 1 
0c83 : 85 1c __ STA ACCU + 1 
0c85 : a5 59 __ LDA T1 + 2 
0c87 : 85 1d __ STA ACCU + 2 
0c89 : a5 5a __ LDA T1 + 3 
0c8b : 85 1e __ STA ACCU + 3 
0c8d : a2 67 __ LDX #$67
0c8f : 20 95 2c JSR $2c95 ; (freg + 4)
0c92 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0c95 : a9 00 __ LDA #$00
0c97 : 85 03 __ STA WORK + 0 
0c99 : 85 04 __ STA WORK + 1 
0c9b : a9 20 __ LDA #$20
0c9d : 85 05 __ STA WORK + 2 
0c9f : a9 43 __ LDA #$43
0ca1 : 85 06 __ STA WORK + 3 
0ca3 : 20 a5 2c JSR $2ca5 ; (freg + 20)
0ca6 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0ca9 : a5 1b __ LDA ACCU + 0 
0cab : 85 63 __ STA T4 + 0 
0cad : a5 1c __ LDA ACCU + 1 
0caf : 85 64 __ STA T4 + 1 
0cb1 : a5 1d __ LDA ACCU + 2 
0cb3 : 85 65 __ STA T4 + 2 
0cb5 : a5 1e __ LDA ACCU + 3 
0cb7 : 85 66 __ STA T4 + 3 
0cb9 : a5 53 __ LDA T0 + 0 
0cbb : 85 1b __ STA ACCU + 0 
0cbd : a5 54 __ LDA T0 + 1 
0cbf : 85 1c __ STA ACCU + 1 
0cc1 : a5 55 __ LDA T0 + 2 
0cc3 : 85 1d __ STA ACCU + 2 
0cc5 : a5 56 __ LDA T0 + 3 
0cc7 : 85 1e __ STA ACCU + 3 
0cc9 : a2 57 __ LDX #$57
0ccb : 20 95 2c JSR $2c95 ; (freg + 4)
0cce : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0cd1 : a9 00 __ LDA #$00
0cd3 : 85 03 __ STA WORK + 0 
0cd5 : 85 04 __ STA WORK + 1 
0cd7 : a9 c8 __ LDA #$c8
0cd9 : 85 05 __ STA WORK + 2 
0cdb : a9 42 __ LDA #$42
0cdd : 85 06 __ STA WORK + 3 
0cdf : 20 a5 2c JSR $2ca5 ; (freg + 20)
0ce2 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0ce5 : a5 1b __ LDA ACCU + 0 
0ce7 : 85 53 __ STA T0 + 0 
0ce9 : a5 1c __ LDA ACCU + 1 
0ceb : 85 54 __ STA T0 + 1 
0ced : a5 1d __ LDA ACCU + 2 
0cef : 85 55 __ STA T0 + 2 
0cf1 : a5 1e __ LDA ACCU + 3 
0cf3 : 85 56 __ STA T0 + 3 
0cf5 : a9 00 __ LDA #$00
0cf7 : 85 4b __ STA T8 + 0 
0cf9 : 85 4d __ STA T9 + 0 
.l12:
0cfb : a6 4b __ LDX T8 + 0 
0cfd : bd 84 9f LDA $9f84,x ; (py[0] + 0)
0d00 : 85 57 __ STA T1 + 0 
0d02 : 85 1b __ STA ACCU + 0 
0d04 : bd 85 9f LDA $9f85,x ; (py[0] + 1)
0d07 : 85 58 __ STA T1 + 1 
0d09 : 85 1c __ STA ACCU + 1 
0d0b : bd 86 9f LDA $9f86,x ; (py[0] + 2)
0d0e : 85 59 __ STA T1 + 2 
0d10 : 85 1d __ STA ACCU + 2 
0d12 : bd 87 9f LDA $9f87,x ; (py[0] + 3)
0d15 : 85 5a __ STA T1 + 3 
0d17 : 85 1e __ STA ACCU + 3 
0d19 : a2 5f __ LDX #$5f
0d1b : 20 95 2c JSR $2c95 ; (freg + 4)
0d1e : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0d21 : a5 1b __ LDA ACCU + 0 
0d23 : 85 67 __ STA T5 + 0 
0d25 : a5 1c __ LDA ACCU + 1 
0d27 : 85 68 __ STA T5 + 1 
0d29 : a5 1d __ LDA ACCU + 2 
0d2b : 85 69 __ STA T5 + 2 
0d2d : a5 1e __ LDA ACCU + 3 
0d2f : 85 6a __ STA T5 + 3 
0d31 : a6 4b __ LDX T8 + 0 
0d33 : bd ac 9f LDA $9fac,x ; (px[0] + 0)
0d36 : 85 43 __ STA T6 + 0 
0d38 : 85 1b __ STA ACCU + 0 
0d3a : bd ad 9f LDA $9fad,x ; (px[0] + 1)
0d3d : 85 44 __ STA T6 + 1 
0d3f : 85 1c __ STA ACCU + 1 
0d41 : bd ae 9f LDA $9fae,x ; (px[0] + 2)
0d44 : 85 45 __ STA T6 + 2 
0d46 : 85 1d __ STA ACCU + 2 
0d48 : bd af 9f LDA $9faf,x ; (px[0] + 3)
0d4b : 85 46 __ STA T6 + 3 
0d4d : 85 1e __ STA ACCU + 3 
0d4f : a2 5b __ LDX #$5b
0d51 : 20 95 2c JSR $2c95 ; (freg + 4)
0d54 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0d57 : a2 63 __ LDX #$63
0d59 : 20 95 2c JSR $2c95 ; (freg + 4)
0d5c : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0d5f : a2 67 __ LDX #$67
0d61 : 20 95 2c JSR $2c95 ; (freg + 4)
0d64 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0d67 : 20 b8 30 JSR $30b8 ; (f32_to_i16 + 0)
0d6a : a5 1b __ LDA ACCU + 0 
0d6c : a6 4d __ LDX T9 + 0 
0d6e : 9d 70 9f STA $9f70,x ; (rpx[0] + 0)
0d71 : a5 1c __ LDA ACCU + 1 
0d73 : 9d 71 9f STA $9f71,x ; (rpx[0] + 1)
0d76 : a5 57 __ LDA T1 + 0 
0d78 : 85 1b __ STA ACCU + 0 
0d7a : a5 58 __ LDA T1 + 1 
0d7c : 85 1c __ STA ACCU + 1 
0d7e : a5 59 __ LDA T1 + 2 
0d80 : 85 1d __ STA ACCU + 2 
0d82 : a5 5a __ LDA T1 + 3 
0d84 : 85 1e __ STA ACCU + 3 
0d86 : a2 5b __ LDX #$5b
0d88 : 20 95 2c JSR $2c95 ; (freg + 4)
0d8b : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0d8e : a5 1b __ LDA ACCU + 0 
0d90 : 85 57 __ STA T1 + 0 
0d92 : a5 1c __ LDA ACCU + 1 
0d94 : 85 58 __ STA T1 + 1 
0d96 : a5 1d __ LDA ACCU + 2 
0d98 : 85 59 __ STA T1 + 2 
0d9a : a5 1e __ LDA ACCU + 3 
0d9c : 85 5a __ STA T1 + 3 
0d9e : a5 43 __ LDA T6 + 0 
0da0 : 85 1b __ STA ACCU + 0 
0da2 : a5 44 __ LDA T6 + 1 
0da4 : 85 1c __ STA ACCU + 1 
0da6 : a5 45 __ LDA T6 + 2 
0da8 : 85 1d __ STA ACCU + 2 
0daa : a5 46 __ LDA T6 + 3 
0dac : 85 1e __ STA ACCU + 3 
0dae : a2 5f __ LDX #$5f
0db0 : 20 95 2c JSR $2c95 ; (freg + 4)
0db3 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
0db6 : a2 53 __ LDX #$53
0db8 : 20 95 2c JSR $2c95 ; (freg + 4)
0dbb : a5 1e __ LDA ACCU + 3 
0dbd : 49 80 __ EOR #$80
0dbf : 85 1e __ STA ACCU + 3 
0dc1 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0dc4 : a2 57 __ LDX #$57
0dc6 : 20 95 2c JSR $2c95 ; (freg + 4)
0dc9 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
0dcc : 20 b8 30 JSR $30b8 ; (f32_to_i16 + 0)
0dcf : a5 1b __ LDA ACCU + 0 
0dd1 : a6 4d __ LDX T9 + 0 
0dd3 : e8 __ __ INX
0dd4 : e8 __ __ INX
0dd5 : 86 4d __ STX T9 + 0 
0dd7 : 9d 5a 9f STA $9f5a,x ; (main@stack + 26)
0dda : a5 1c __ LDA ACCU + 1 
0ddc : 9d 5b 9f STA $9f5b,x ; (main@stack + 27)
0ddf : 18 __ __ CLC
0de0 : a5 4b __ LDA T8 + 0 
0de2 : 69 04 __ ADC #$04
0de4 : 85 4b __ STA T8 + 0 
0de6 : e0 14 __ CPX #$14
0de8 : f0 03 __ BEQ $0ded ; (main.s13 + 0)
0dea : 4c fb 0c JMP $0cfb ; (main.l12 + 0)
.s13:
0ded : a9 0a __ LDA #$0a
0def : 85 18 __ STA P11 
0df1 : a9 70 __ LDA #$70
0df3 : 8d f4 9f STA $9ff4 ; (sstack + 4)
0df6 : a9 9f __ LDA #$9f
0df8 : 8d f5 9f STA $9ff5 ; (sstack + 5)
0dfb : a9 5c __ LDA #$5c
0dfd : 8d f6 9f STA $9ff6 ; (sstack + 6)
0e00 : a9 9f __ LDA #$9f
0e02 : 8d f7 9f STA $9ff7 ; (sstack + 7)
0e05 : a9 80 __ LDA #$80
0e07 : 8d f0 9f STA $9ff0 ; (sstack + 0)
0e0a : a9 33 __ LDA #$33
0e0c : 8d f1 9f STA $9ff1 ; (sstack + 1)
0e0f : a9 d6 __ LDA #$d6
0e11 : 8d f2 9f STA $9ff2 ; (sstack + 2)
0e14 : a9 9f __ LDA #$9f
0e16 : 8d f3 9f STA $9ff3 ; (sstack + 3)
0e19 : a5 6b __ LDA T10 + 0 
0e1b : 85 1b __ STA ACCU + 0 
0e1d : a9 00 __ LDA #$00
0e1f : 85 5b __ STA T2 + 0 
0e21 : 85 1c __ STA ACCU + 1 
0e23 : 85 04 __ STA WORK + 1 
0e25 : a9 09 __ LDA #$09
0e27 : 85 03 __ STA WORK + 0 
0e29 : 20 39 2f JSR $2f39 ; (divmod + 0)
0e2c : a5 05 __ LDA WORK + 2 
0e2e : 0a __ __ ASL
0e2f : 0a __ __ ASL
0e30 : 0a __ __ ASL
0e31 : 18 __ __ CLC
0e32 : 69 00 __ ADC #$00
0e34 : 8d f8 9f STA $9ff8 ; (sstack + 8)
0e37 : a9 33 __ LDA #$33
0e39 : 69 00 __ ADC #$00
0e3b : 8d f9 9f STA $9ff9 ; (sstack + 9)
0e3e : 20 b0 1a JSR $1ab0 ; (bm_polygon_nc_fill.s1 + 0)
0e41 : a9 00 __ LDA #$00
.l17:
0e43 : 0a __ __ ASL
0e44 : aa __ __ TAX
0e45 : a9 80 __ LDA #$80
0e47 : 8d f0 9f STA $9ff0 ; (sstack + 0)
0e4a : a9 33 __ LDA #$33
0e4c : 8d f1 9f STA $9ff1 ; (sstack + 1)
0e4f : a9 d6 __ LDA #$d6
0e51 : 8d f2 9f STA $9ff2 ; (sstack + 2)
0e54 : a9 9f __ LDA #$9f
0e56 : 8d f3 9f STA $9ff3 ; (sstack + 3)
0e59 : a9 ff __ LDA #$ff
0e5b : 8d fc 9f STA $9ffc ; (sstack + 12)
0e5e : bd 70 9f LDA $9f70,x ; (rpx[0] + 0)
0e61 : 8d f4 9f STA $9ff4 ; (sstack + 4)
0e64 : bd 71 9f LDA $9f71,x ; (rpx[0] + 1)
0e67 : 8d f5 9f STA $9ff5 ; (sstack + 5)
0e6a : bd 5c 9f LDA $9f5c,x ; (rpy[0] + 0)
0e6d : 8d f6 9f STA $9ff6 ; (sstack + 6)
0e70 : bd 5d 9f LDA $9f5d,x ; (rpy[0] + 1)
0e73 : 8d f7 9f STA $9ff7 ; (sstack + 7)
0e76 : e6 5b __ INC T2 + 0 
0e78 : a5 5b __ LDA T2 + 0 
0e7a : 85 1b __ STA ACCU + 0 
0e7c : a9 00 __ LDA #$00
0e7e : 8d fd 9f STA $9ffd ; (sstack + 13)
0e81 : 85 1c __ STA ACCU + 1 
0e83 : 85 04 __ STA WORK + 1 
0e85 : a9 0a __ LDA #$0a
0e87 : 85 03 __ STA WORK + 0 
0e89 : 20 39 2f JSR $2f39 ; (divmod + 0)
0e8c : a5 05 __ LDA WORK + 2 
0e8e : 0a __ __ ASL
0e8f : aa __ __ TAX
0e90 : bd 70 9f LDA $9f70,x ; (rpx[0] + 0)
0e93 : 8d f8 9f STA $9ff8 ; (sstack + 8)
0e96 : bd 71 9f LDA $9f71,x ; (rpx[0] + 1)
0e99 : 8d f9 9f STA $9ff9 ; (sstack + 9)
0e9c : bd 5c 9f LDA $9f5c,x ; (rpy[0] + 0)
0e9f : 8d fa 9f STA $9ffa ; (sstack + 10)
0ea2 : bd 5d 9f LDA $9f5d,x ; (rpy[0] + 1)
0ea5 : 8d fb 9f STA $9ffb ; (sstack + 11)
0ea8 : 20 7b 21 JSR $217b ; (bm_line.s1 + 0)
0eab : a5 5b __ LDA T2 + 0 
0ead : c9 0a __ CMP #$0a
0eaf : 90 92 __ BCC $0e43 ; (main.l17 + 0)
.s14:
0eb1 : e6 6c __ INC T11 + 0 
0eb3 : e6 6b __ INC T10 + 0 
0eb5 : 30 03 __ BMI $0eba ; (main.s15 + 0)
0eb7 : 4c f9 0a JMP $0af9 ; (main.l11 + 0)
.s15:
0eba : 20 cb 2b JSR $2bcb ; (done.s4 + 0)
0ebd : a9 00 __ LDA #$00
0ebf : 85 1b __ STA ACCU + 0 
0ec1 : 85 1c __ STA ACCU + 1 
.s3:
0ec3 : a2 19 __ LDX #$19
0ec5 : bd 40 9f LDA $9f40,x ; (main@stack + 0)
0ec8 : 95 53 __ STA T0 + 0,x 
0eca : ca __ __ DEX
0ecb : 10 f8 __ BPL $0ec5 ; (main.s3 + 2)
0ecd : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  13, "/home/honza/projects/c64/projects/oscar64/samples/hires/polygon.c"
.s4:
0ece : 20 3a 0f JSR $0f3a ; (mmap_trampoline.s4 + 0)
0ed1 : a9 00 __ LDA #$00
0ed3 : 85 0f __ STA P2 
0ed5 : 85 10 __ STA P3 
0ed7 : a9 30 __ LDA #$30
0ed9 : 85 01 __ STA $01 
0edb : a9 40 __ LDA #$40
0edd : 85 11 __ STA P4 
0edf : a9 1f __ LDA #$1f
0ee1 : 85 12 __ STA P5 
0ee3 : a9 10 __ LDA #$10
0ee5 : a2 fa __ LDX #$fa
.l6:
0ee7 : ca __ __ DEX
0ee8 : 9d 00 d0 STA $d000,x 
0eeb : 9d fa d0 STA $d0fa,x 
0eee : 9d f4 d1 STA $d1f4,x 
0ef1 : 9d ee d2 STA $d2ee,x 
0ef4 : d0 f1 __ BNE $0ee7 ; (init.l6 + 0)
.s5:
0ef6 : a9 00 __ LDA #$00
0ef8 : 85 0d __ STA P0 
0efa : a9 e0 __ LDA #$e0
0efc : 85 0e __ STA P1 
0efe : 20 84 0f JSR $0f84 ; (memset.s4 + 0)
0f01 : a9 00 __ LDA #$00
0f03 : 85 10 __ STA P3 
0f05 : 85 0e __ STA P1 
0f07 : a9 35 __ LDA #$35
0f09 : 85 01 __ STA $01 
0f0b : a9 03 __ LDA #$03
0f0d : 85 0d __ STA P0 
0f0f : a9 e0 __ LDA #$e0
0f11 : 85 11 __ STA P4 
0f13 : a9 d0 __ LDA #$d0
0f15 : 85 0f __ STA P2 
0f17 : 20 a8 0f JSR $0fa8 ; (vic_setmode.s4 + 0)
0f1a : a9 00 __ LDA #$00
0f1c : 85 0f __ STA P2 
0f1e : a9 e0 __ LDA #$e0
0f20 : 85 10 __ STA P3 
0f22 : a9 28 __ LDA #$28
0f24 : 85 11 __ STA P4 
0f26 : a9 19 __ LDA #$19
0f28 : 85 12 __ STA P5 
0f2a : a9 01 __ LDA #$01
0f2c : 8d 20 d0 STA $d020 
0f2f : a9 80 __ LDA #$80
0f31 : 85 0d __ STA P0 
0f33 : a9 33 __ LDA #$33
0f35 : 85 0e __ STA P1 
0f37 : 4c fa 0f JMP $0ffa ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0f3a : a9 4f __ LDA #$4f
0f3c : 8d fa ff STA $fffa 
0f3f : a9 0f __ LDA #$0f
0f41 : 8d fb ff STA $fffb 
0f44 : a9 6d __ LDA #$6d
0f46 : 8d fe ff STA $fffe 
0f49 : a9 0f __ LDA #$0f
0f4b : 8d ff ff STA $ffff 
.s3:
0f4e : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0f4f : 48 __ __ PHA
0f50 : 8a __ __ TXA
0f51 : 48 __ __ PHA
0f52 : a9 0f __ LDA #$0f
0f54 : 48 __ __ PHA
0f55 : a9 66 __ LDA #$66
0f57 : 48 __ __ PHA
0f58 : ba __ __ TSX
0f59 : bd 05 01 LDA $0105,x 
0f5c : 48 __ __ PHA
0f5d : a6 01 __ LDX $01 
0f5f : a9 36 __ LDA #$36
0f61 : 85 01 __ STA $01 
0f63 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0f66 : 86 01 __ STX $01 
0f68 : 68 __ __ PLA
0f69 : aa __ __ TAX
0f6a : 68 __ __ PLA
0f6b : 40 __ __ RTI
0f6c : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0f6d : 48 __ __ PHA
0f6e : 8a __ __ TXA
0f6f : 48 __ __ PHA
0f70 : a9 0f __ LDA #$0f
0f72 : 48 __ __ PHA
0f73 : a9 66 __ LDA #$66
0f75 : 48 __ __ PHA
0f76 : ba __ __ TSX
0f77 : bd 05 01 LDA $0105,x 
0f7a : 48 __ __ PHA
0f7b : a6 01 __ LDX $01 
0f7d : a9 36 __ LDA #$36
0f7f : 85 01 __ STA $01 
0f81 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0f84 : a5 0f __ LDA P2 
0f86 : a6 12 __ LDX P5 
0f88 : f0 0c __ BEQ $0f96 ; (memset.s4 + 18)
0f8a : a0 00 __ LDY #$00
0f8c : 91 0d __ STA (P0),y ; (dst + 0)
0f8e : c8 __ __ INY
0f8f : d0 fb __ BNE $0f8c ; (memset.s4 + 8)
0f91 : e6 0e __ INC P1 ; (dst + 1)
0f93 : ca __ __ DEX
0f94 : d0 f6 __ BNE $0f8c ; (memset.s4 + 8)
0f96 : a4 11 __ LDY P4 
0f98 : f0 05 __ BEQ $0f9f ; (memset.s4 + 27)
0f9a : 88 __ __ DEY
0f9b : 91 0d __ STA (P0),y ; (dst + 0)
0f9d : d0 fb __ BNE $0f9a ; (memset.s4 + 22)
0f9f : a5 0d __ LDA P0 ; (dst + 0)
0fa1 : 85 1b __ STA ACCU + 0 
0fa3 : a5 0e __ LDA P1 ; (dst + 1)
0fa5 : 85 1c __ STA ACCU + 1 
.s3:
0fa7 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0fa8 : a4 0d __ LDY P0 ; (mode + 0)
0faa : c0 02 __ CPY #$02
0fac : d0 09 __ BNE $0fb7 ; (vic_setmode.s5 + 0)
.s10:
0fae : a9 5b __ LDA #$5b
0fb0 : 8d 11 d0 STA $d011 
.s8:
0fb3 : a9 08 __ LDA #$08
0fb5 : d0 0c __ BNE $0fc3 ; (vic_setmode.s7 + 0)
.s5:
0fb7 : b0 36 __ BCS $0fef ; (vic_setmode.s6 + 0)
.s9:
0fb9 : a9 1b __ LDA #$1b
0fbb : 8d 11 d0 STA $d011 
0fbe : 98 __ __ TYA
0fbf : f0 f2 __ BEQ $0fb3 ; (vic_setmode.s8 + 0)
.s11:
0fc1 : a9 18 __ LDA #$18
.s7:
0fc3 : 8d 16 d0 STA $d016 
0fc6 : ad 00 dd LDA $dd00 
0fc9 : 29 fc __ AND #$fc
0fcb : 85 1b __ STA ACCU + 0 
0fcd : a5 0f __ LDA P2 ; (text + 1)
0fcf : 0a __ __ ASL
0fd0 : 2a __ __ ROL
0fd1 : 29 01 __ AND #$01
0fd3 : 2a __ __ ROL
0fd4 : 49 03 __ EOR #$03
0fd6 : 05 1b __ ORA ACCU + 0 
0fd8 : 8d 00 dd STA $dd00 
0fdb : a5 0f __ LDA P2 ; (text + 1)
0fdd : 29 3c __ AND #$3c
0fdf : 0a __ __ ASL
0fe0 : 0a __ __ ASL
0fe1 : 85 1b __ STA ACCU + 0 
0fe3 : a5 11 __ LDA P4 ; (font + 1)
0fe5 : 29 38 __ AND #$38
0fe7 : 4a __ __ LSR
0fe8 : 4a __ __ LSR
0fe9 : 05 1b __ ORA ACCU + 0 
0feb : 8d 18 d0 STA $d018 
.s3:
0fee : 60 __ __ RTS
.s6:
0fef : a9 3b __ LDA #$3b
0ff1 : 8d 11 d0 STA $d011 
0ff4 : c0 03 __ CPY #$03
0ff6 : d0 c9 __ BNE $0fc1 ; (vic_setmode.s11 + 0)
0ff8 : f0 b9 __ BEQ $0fb3 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0ffa : a5 0f __ LDA P2 ; (data + 0)
0ffc : a0 00 __ LDY #$00
0ffe : 91 0d __ STA (P0),y ; (bm + 0)
1000 : a5 10 __ LDA P3 ; (data + 1)
1002 : c8 __ __ INY
1003 : 91 0d __ STA (P0),y ; (bm + 0)
1005 : a9 00 __ LDA #$00
1007 : c8 __ __ INY
1008 : 91 0d __ STA (P0),y ; (bm + 0)
100a : c8 __ __ INY
100b : 91 0d __ STA (P0),y ; (bm + 0)
100d : a5 11 __ LDA P4 ; (cw + 0)
100f : c8 __ __ INY
1010 : 91 0d __ STA (P0),y ; (bm + 0)
1012 : a5 12 __ LDA P5 ; (ch + 0)
1014 : c8 __ __ INY
1015 : 91 0d __ STA (P0),y ; (bm + 0)
1017 : a9 00 __ LDA #$00
1019 : 06 11 __ ASL P4 ; (cw + 0)
101b : 2a __ __ ROL
101c : 06 11 __ ASL P4 ; (cw + 0)
101e : 2a __ __ ROL
101f : 06 11 __ ASL P4 ; (cw + 0)
1021 : 2a __ __ ROL
1022 : a0 07 __ LDY #$07
1024 : 91 0d __ STA (P0),y ; (bm + 0)
1026 : a5 11 __ LDA P4 ; (cw + 0)
1028 : 88 __ __ DEY
1029 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
102b : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
102c : a5 53 __ LDA T6 + 0 
102e : 8d ea 9f STA $9fea ; (bmu_bitblit@stack + 0)
1031 : a5 54 __ LDA T6 + 1 
1033 : 8d eb 9f STA $9feb ; (bmu_bitblit@stack + 1)
1036 : a5 55 __ LDA T8 + 0 
1038 : 8d ec 9f STA $9fec ; (bmu_bitblit@stack + 2)
.s4:
103b : ad f0 9f LDA $9ff0 ; (sstack + 0)
103e : 85 4e __ STA T2 + 0 
1040 : 18 __ __ CLC
1041 : 6d fa 9f ADC $9ffa ; (sstack + 10)
1044 : 85 45 __ STA T1 + 0 
1046 : 29 07 __ AND #$07
1048 : aa __ __ TAX
1049 : bd e5 32 LDA $32e5,x ; (rmask[0] + 0)
104c : 85 13 __ STA P6 
104e : ad fb 9f LDA $9ffb ; (sstack + 11)
1051 : 6d f1 9f ADC $9ff1 ; (sstack + 1)
1054 : 4a __ __ LSR
1055 : 66 45 __ ROR T1 + 0 
1057 : 4a __ __ LSR
1058 : 66 45 __ ROR T1 + 0 
105a : 4a __ __ LSR
105b : 66 45 __ ROR T1 + 0 
105d : ad f1 9f LDA $9ff1 ; (sstack + 1)
1060 : 4a __ __ LSR
1061 : 66 4e __ ROR T2 + 0 
1063 : 4a __ __ LSR
1064 : 66 4e __ ROR T2 + 0 
1066 : 4a __ __ LSR
1067 : 66 4e __ ROR T2 + 0 
1069 : 38 __ __ SEC
106a : a5 45 __ LDA T1 + 0 
106c : e5 4e __ SBC T2 + 0 
106e : 85 11 __ STA P4 
1070 : ad f0 9f LDA $9ff0 ; (sstack + 0)
1073 : 29 07 __ AND #$07
1075 : 85 4e __ STA T2 + 0 
1077 : aa __ __ TAX
1078 : bd dd 32 LDA $32dd,x ; (lmask[0] + 0)
107b : 85 4c __ STA T10 + 0 
107d : 85 12 __ STA P5 
107f : ad f4 9f LDA $9ff4 ; (sstack + 4)
1082 : 85 49 __ STA T4 + 0 
1084 : ad f5 9f LDA $9ff5 ; (sstack + 5)
1087 : 85 4a __ STA T4 + 1 
1089 : a5 16 __ LDA P9 ; (dbm + 0)
108b : c5 49 __ CMP T4 + 0 
108d : d0 78 __ BNE $1107 ; (bmu_bitblit.s5 + 0)
.s52:
108f : a5 17 __ LDA P10 ; (dbm + 1)
1091 : c5 4a __ CMP T4 + 1 
1093 : d0 72 __ BNE $1107 ; (bmu_bitblit.s5 + 0)
.s38:
1095 : ad f9 9f LDA $9ff9 ; (sstack + 9)
1098 : cd f3 9f CMP $9ff3 ; (sstack + 3)
109b : d0 0a __ BNE $10a7 ; (bmu_bitblit.s51 + 0)
.s48:
109d : ad f8 9f LDA $9ff8 ; (sstack + 8)
10a0 : cd f2 9f CMP $9ff2 ; (sstack + 2)
.s49:
10a3 : b0 09 __ BCS $10ae ; (bmu_bitblit.s39 + 0)
10a5 : 90 30 __ BCC $10d7 ; (bmu_bitblit.s41 + 0)
.s51:
10a7 : 4d f3 9f EOR $9ff3 ; (sstack + 3)
10aa : 10 f7 __ BPL $10a3 ; (bmu_bitblit.s49 + 0)
.s50:
10ac : b0 29 __ BCS $10d7 ; (bmu_bitblit.s41 + 0)
.s39:
10ae : ad f3 9f LDA $9ff3 ; (sstack + 3)
10b1 : cd f9 9f CMP $9ff9 ; (sstack + 9)
10b4 : d0 51 __ BNE $1107 ; (bmu_bitblit.s5 + 0)
.s47:
10b6 : ad f2 9f LDA $9ff2 ; (sstack + 2)
10b9 : cd f8 9f CMP $9ff8 ; (sstack + 8)
10bc : d0 49 __ BNE $1107 ; (bmu_bitblit.s5 + 0)
.s40:
10be : ad f7 9f LDA $9ff7 ; (sstack + 7)
10c1 : cd f1 9f CMP $9ff1 ; (sstack + 1)
10c4 : d0 0a __ BNE $10d0 ; (bmu_bitblit.s46 + 0)
.s43:
10c6 : ad f6 9f LDA $9ff6 ; (sstack + 6)
10c9 : cd f0 9f CMP $9ff0 ; (sstack + 0)
.s44:
10cc : 90 09 __ BCC $10d7 ; (bmu_bitblit.s41 + 0)
10ce : b0 37 __ BCS $1107 ; (bmu_bitblit.s5 + 0)
.s46:
10d0 : 4d f1 9f EOR $9ff1 ; (sstack + 1)
10d3 : 10 f7 __ BPL $10cc ; (bmu_bitblit.s44 + 0)
.s45:
10d5 : 90 30 __ BCC $1107 ; (bmu_bitblit.s5 + 0)
.s41:
10d7 : a5 18 __ LDA P11 ; (op + 0)
10d9 : 29 08 __ AND #$08
10db : f0 2a __ BEQ $1107 ; (bmu_bitblit.s5 + 0)
.s42:
10dd : ad fc 9f LDA $9ffc ; (sstack + 12)
10e0 : 18 __ __ CLC
10e1 : 6d f8 9f ADC $9ff8 ; (sstack + 8)
10e4 : 8d f8 9f STA $9ff8 ; (sstack + 8)
10e7 : ad fd 9f LDA $9ffd ; (sstack + 13)
10ea : 6d f9 9f ADC $9ff9 ; (sstack + 9)
10ed : 8d f9 9f STA $9ff9 ; (sstack + 9)
10f0 : ad fc 9f LDA $9ffc ; (sstack + 12)
10f3 : 18 __ __ CLC
10f4 : 6d f2 9f ADC $9ff2 ; (sstack + 2)
10f7 : 8d f2 9f STA $9ff2 ; (sstack + 2)
10fa : ad fd 9f LDA $9ffd ; (sstack + 13)
10fd : 6d f3 9f ADC $9ff3 ; (sstack + 3)
1100 : 8d f3 9f STA $9ff3 ; (sstack + 3)
1103 : a9 01 __ LDA #$01
1105 : d0 02 __ BNE $1109 ; (bmu_bitblit.s6 + 0)
.s5:
1107 : a9 00 __ LDA #$00
.s6:
1109 : 85 15 __ STA P8 
110b : ad f3 9f LDA $9ff3 ; (sstack + 3)
110e : 85 1c __ STA ACCU + 1 ; (dy + 1)
1110 : ad f2 9f LDA $9ff2 ; (sstack + 2)
1113 : 29 f8 __ AND #$f8
1115 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1117 : a0 04 __ LDY #$04
1119 : b1 16 __ LDA (P9),y ; (dbm + 0)
111b : 85 52 __ STA T7 + 0 
111d : 20 23 2c JSR $2c23 ; (mul16by8 + 0)
1120 : a0 00 __ LDY #$00
1122 : b1 16 __ LDA (P9),y ; (dbm + 0)
1124 : 18 __ __ CLC
1125 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1127 : 85 02 __ STA $02 
1129 : c8 __ __ INY
112a : b1 16 __ LDA (P9),y ; (dbm + 0)
112c : 65 1c __ ADC ACCU + 1 ; (dy + 1)
112e : aa __ __ TAX
112f : ad f0 9f LDA $9ff0 ; (sstack + 0)
1132 : 29 f8 __ AND #$f8
1134 : 18 __ __ CLC
1135 : 65 02 __ ADC $02 
1137 : 85 47 __ STA T3 + 0 
1139 : 8a __ __ TXA
113a : 6d f1 9f ADC $9ff1 ; (sstack + 1)
113d : aa __ __ TAX
113e : ad f2 9f LDA $9ff2 ; (sstack + 2)
1141 : 29 07 __ AND #$07
1143 : 18 __ __ CLC
1144 : 65 47 __ ADC T3 + 0 
1146 : 85 53 __ STA T6 + 0 
1148 : 90 01 __ BCC $114b ; (bmu_bitblit.s54 + 0)
.s53:
114a : e8 __ __ INX
.s54:
114b : 86 54 __ STX T6 + 1 
114d : ad f9 9f LDA $9ff9 ; (sstack + 9)
1150 : 85 1c __ STA ACCU + 1 ; (dy + 1)
1152 : ad f8 9f LDA $9ff8 ; (sstack + 8)
1155 : 29 f8 __ AND #$f8
1157 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1159 : a0 04 __ LDY #$04
115b : b1 49 __ LDA (T4 + 0),y 
115d : 85 55 __ STA T8 + 0 
115f : 20 23 2c JSR $2c23 ; (mul16by8 + 0)
1162 : a0 00 __ LDY #$00
1164 : b1 49 __ LDA (T4 + 0),y 
1166 : 18 __ __ CLC
1167 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1169 : 85 02 __ STA $02 
116b : c8 __ __ INY
116c : b1 49 __ LDA (T4 + 0),y 
116e : 65 1c __ ADC ACCU + 1 ; (dy + 1)
1170 : aa __ __ TAX
1171 : ad f6 9f LDA $9ff6 ; (sstack + 6)
1174 : 29 f8 __ AND #$f8
1176 : 18 __ __ CLC
1177 : 65 02 __ ADC $02 
1179 : 85 49 __ STA T4 + 0 
117b : 8a __ __ TXA
117c : 6d f7 9f ADC $9ff7 ; (sstack + 7)
117f : aa __ __ TAX
1180 : ad f8 9f LDA $9ff8 ; (sstack + 8)
1183 : 29 07 __ AND #$07
1185 : 18 __ __ CLC
1186 : 65 49 __ ADC T4 + 0 
1188 : 85 49 __ STA T4 + 0 
118a : 90 01 __ BCC $118d ; (bmu_bitblit.s56 + 0)
.s55:
118c : e8 __ __ INX
.s56:
118d : ad f6 9f LDA $9ff6 ; (sstack + 6)
1190 : 29 07 __ AND #$07
1192 : 49 ff __ EOR #$ff
1194 : 38 __ __ SEC
1195 : 65 4e __ ADC T2 + 0 
1197 : 85 43 __ STA T0 + 0 
1199 : 29 07 __ AND #$07
119b : 85 10 __ STA P3 
119d : a5 15 __ LDA P8 
119f : f0 03 __ BEQ $11a4 ; (bmu_bitblit.s7 + 0)
11a1 : 4c 93 13 JMP $1393 ; (bmu_bitblit.s36 + 0)
.s7:
11a4 : 86 51 __ STX T5 + 1 
11a6 : a4 49 __ LDY T4 + 0 
11a8 : 84 50 __ STY T5 + 0 
11aa : a5 43 __ LDA T0 + 0 
11ac : f0 0d __ BEQ $11bb ; (bmu_bitblit.s8 + 0)
.s34:
11ae : 30 0b __ BMI $11bb ; (bmu_bitblit.s8 + 0)
.s35:
11b0 : 98 __ __ TYA
11b1 : 18 __ __ CLC
11b2 : 69 f8 __ ADC #$f8
11b4 : 85 50 __ STA T5 + 0 
11b6 : 8a __ __ TXA
11b7 : 69 ff __ ADC #$ff
11b9 : 85 51 __ STA T5 + 1 
.s8:
11bb : a5 18 __ LDA P11 ; (op + 0)
11bd : 85 14 __ STA P7 
11bf : 20 de 13 JSR $13de ; (builddop.s4 + 0)
11c2 : 18 __ __ CLC
11c3 : a5 52 __ LDA T7 + 0 
11c5 : 69 ff __ ADC #$ff
11c7 : 2a __ __ ROL
11c8 : 2a __ __ ROL
11c9 : 2a __ __ ROL
11ca : aa __ __ TAX
11cb : 29 f8 __ AND #$f8
11cd : 85 43 __ STA T0 + 0 
11cf : 8a __ __ TXA
11d0 : 29 07 __ AND #$07
11d2 : 2a __ __ ROL
11d3 : 69 f8 __ ADC #$f8
11d5 : 85 44 __ STA T0 + 1 
11d7 : ad fe 9f LDA $9ffe ; (sstack + 14)
11da : 85 45 __ STA T1 + 0 
11dc : 85 47 __ STA T3 + 0 
11de : ad ff 9f LDA $9fff ; (sstack + 15)
11e1 : 85 46 __ STA T1 + 1 
11e3 : a5 18 __ LDA P11 ; (op + 0)
11e5 : 29 08 __ AND #$08
11e7 : f0 03 __ BEQ $11ec ; (bmu_bitblit.s9 + 0)
11e9 : 4c 86 12 JMP $1286 ; (bmu_bitblit.s19 + 0)
.s9:
11ec : ad fc 9f LDA $9ffc ; (sstack + 12)
11ef : 85 47 __ STA T3 + 0 
11f1 : a5 18 __ LDA P11 ; (op + 0)
11f3 : 29 20 __ AND #$20
11f5 : d0 4c __ BNE $1243 ; (bmu_bitblit.s15 + 0)
.s10:
11f7 : a5 47 __ LDA T3 + 0 
11f9 : f0 38 __ BEQ $1233 ; (bmu_bitblit.s3 + 0)
.s11:
11fb : a9 00 __ LDA #$00
11fd : 85 4e __ STA T2 + 0 
.l12:
11ff : a5 53 __ LDA T6 + 0 
1201 : 85 03 __ STA WORK + 0 
1203 : a5 54 __ LDA T6 + 1 
1205 : 85 04 __ STA WORK + 1 
1207 : a5 53 __ LDA T6 + 0 
1209 : 85 05 __ STA WORK + 2 
120b : a5 54 __ LDA T6 + 1 
120d : 85 06 __ STA WORK + 3 
120f : a5 4e __ LDA T2 + 0 
1211 : 85 07 __ STA WORK + 4 
1213 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
1216 : e6 53 __ INC T6 + 0 
1218 : d0 02 __ BNE $121c ; (bmu_bitblit.s69 + 0)
.s68:
121a : e6 54 __ INC T6 + 1 
.s69:
121c : a5 53 __ LDA T6 + 0 
121e : 29 07 __ AND #$07
1220 : d0 0d __ BNE $122f ; (bmu_bitblit.s13 + 0)
.s14:
1222 : 18 __ __ CLC
1223 : a5 53 __ LDA T6 + 0 
1225 : 65 43 __ ADC T0 + 0 
1227 : 85 53 __ STA T6 + 0 
1229 : a5 54 __ LDA T6 + 1 
122b : 65 44 __ ADC T0 + 1 
122d : 85 54 __ STA T6 + 1 
.s13:
122f : c6 47 __ DEC T3 + 0 
1231 : d0 cc __ BNE $11ff ; (bmu_bitblit.l12 + 0)
.s3:
1233 : ad ea 9f LDA $9fea ; (bmu_bitblit@stack + 0)
1236 : 85 53 __ STA T6 + 0 
1238 : ad eb 9f LDA $9feb ; (bmu_bitblit@stack + 1)
123b : 85 54 __ STA T6 + 1 
123d : ad ec 9f LDA $9fec ; (bmu_bitblit@stack + 2)
1240 : 85 55 __ STA T8 + 0 
1242 : 60 __ __ RTS
.s15:
1243 : a5 47 __ LDA T3 + 0 
1245 : f0 ec __ BEQ $1233 ; (bmu_bitblit.s3 + 0)
.l16:
1247 : a5 53 __ LDA T6 + 0 
1249 : 29 07 __ AND #$07
124b : a8 __ __ TAY
124c : b1 45 __ LDA (T1 + 0),y 
124e : 85 4e __ STA T2 + 0 
1250 : a5 53 __ LDA T6 + 0 
1252 : 85 03 __ STA WORK + 0 
1254 : a5 54 __ LDA T6 + 1 
1256 : 85 04 __ STA WORK + 1 
1258 : a5 53 __ LDA T6 + 0 
125a : 85 05 __ STA WORK + 2 
125c : a5 54 __ LDA T6 + 1 
125e : 85 06 __ STA WORK + 3 
1260 : a5 4e __ LDA T2 + 0 
1262 : 85 07 __ STA WORK + 4 
1264 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
1267 : e6 53 __ INC T6 + 0 
1269 : d0 02 __ BNE $126d ; (bmu_bitblit.s67 + 0)
.s66:
126b : e6 54 __ INC T6 + 1 
.s67:
126d : a5 53 __ LDA T6 + 0 
126f : 29 07 __ AND #$07
1271 : d0 0d __ BNE $1280 ; (bmu_bitblit.s17 + 0)
.s18:
1273 : 18 __ __ CLC
1274 : a5 53 __ LDA T6 + 0 
1276 : 65 43 __ ADC T0 + 0 
1278 : 85 53 __ STA T6 + 0 
127a : a5 54 __ LDA T6 + 1 
127c : 65 44 __ ADC T0 + 1 
127e : 85 54 __ STA T6 + 1 
.s17:
1280 : c6 47 __ DEC T3 + 0 
1282 : d0 c3 __ BNE $1247 ; (bmu_bitblit.l16 + 0)
1284 : f0 ad __ BEQ $1233 ; (bmu_bitblit.s3 + 0)
.s19:
1286 : 18 __ __ CLC
1287 : a5 55 __ LDA T8 + 0 
1289 : 69 ff __ ADC #$ff
128b : 2a __ __ ROL
128c : 2a __ __ ROL
128d : 2a __ __ ROL
128e : aa __ __ TAX
128f : 29 f8 __ AND #$f8
1291 : 85 4e __ STA T2 + 0 
1293 : 8a __ __ TXA
1294 : 29 07 __ AND #$07
1296 : 2a __ __ ROL
1297 : 69 f8 __ ADC #$f8
1299 : 85 4f __ STA T2 + 1 
129b : a5 46 __ LDA T1 + 1 
129d : 85 48 __ STA T3 + 1 
129f : 05 45 __ ORA T1 + 0 
12a1 : d0 08 __ BNE $12ab ; (bmu_bitblit.s21 + 0)
.s20:
12a3 : a5 50 __ LDA T5 + 0 
12a5 : 85 47 __ STA T3 + 0 
12a7 : a5 51 __ LDA T5 + 1 
12a9 : 85 48 __ STA T3 + 1 
.s21:
12ab : ad fc 9f LDA $9ffc ; (sstack + 12)
12ae : 85 45 __ STA T1 + 0 
12b0 : a5 15 __ LDA P8 
12b2 : d0 03 __ BNE $12b7 ; (bmu_bitblit.s28 + 0)
12b4 : 4c 36 13 JMP $1336 ; (bmu_bitblit.s22 + 0)
.s28:
12b7 : 38 __ __ SEC
12b8 : a9 00 __ LDA #$00
12ba : e5 43 __ SBC T0 + 0 
12bc : 85 43 __ STA T0 + 0 
12be : a9 00 __ LDA #$00
12c0 : e5 44 __ SBC T0 + 1 
12c2 : 85 44 __ STA T0 + 1 
12c4 : 38 __ __ SEC
12c5 : a9 00 __ LDA #$00
12c7 : e5 4e __ SBC T2 + 0 
12c9 : 85 4e __ STA T2 + 0 
12cb : a9 00 __ LDA #$00
12cd : e5 4f __ SBC T2 + 1 
12cf : 85 4f __ STA T2 + 1 
12d1 : a5 45 __ LDA T1 + 0 
12d3 : d0 03 __ BNE $12d8 ; (bmu_bitblit.l29 + 0)
12d5 : 4c 33 12 JMP $1233 ; (bmu_bitblit.s3 + 0)
.l29:
12d8 : a5 50 __ LDA T5 + 0 
12da : 29 07 __ AND #$07
12dc : d0 0d __ BNE $12eb ; (bmu_bitblit.s30 + 0)
.s33:
12de : 18 __ __ CLC
12df : a5 50 __ LDA T5 + 0 
12e1 : 65 4e __ ADC T2 + 0 
12e3 : 85 50 __ STA T5 + 0 
12e5 : a5 51 __ LDA T5 + 1 
12e7 : 65 4f __ ADC T2 + 1 
12e9 : 85 51 __ STA T5 + 1 
.s30:
12eb : a5 53 __ LDA T6 + 0 
12ed : 29 07 __ AND #$07
12ef : d0 0d __ BNE $12fe ; (bmu_bitblit.s31 + 0)
.s32:
12f1 : 18 __ __ CLC
12f2 : a5 53 __ LDA T6 + 0 
12f4 : 65 43 __ ADC T0 + 0 
12f6 : 85 53 __ STA T6 + 0 
12f8 : a5 54 __ LDA T6 + 1 
12fa : 65 44 __ ADC T0 + 1 
12fc : 85 54 __ STA T6 + 1 
.s31:
12fe : 18 __ __ CLC
12ff : a5 53 __ LDA T6 + 0 
1301 : 69 ff __ ADC #$ff
1303 : 85 53 __ STA T6 + 0 
1305 : 29 07 __ AND #$07
1307 : a8 __ __ TAY
1308 : b0 02 __ BCS $130c ; (bmu_bitblit.s59 + 0)
.s58:
130a : c6 54 __ DEC T6 + 1 
.s59:
130c : b1 47 __ LDA (T3 + 0),y 
130e : 85 49 __ STA T4 + 0 
1310 : a5 50 __ LDA T5 + 0 
1312 : d0 02 __ BNE $1316 ; (bmu_bitblit.s61 + 0)
.s60:
1314 : c6 51 __ DEC T5 + 1 
.s61:
1316 : c6 50 __ DEC T5 + 0 
1318 : a5 50 __ LDA T5 + 0 
131a : 85 03 __ STA WORK + 0 
131c : a5 51 __ LDA T5 + 1 
131e : 85 04 __ STA WORK + 1 
1320 : a5 53 __ LDA T6 + 0 
1322 : 85 05 __ STA WORK + 2 
1324 : a5 54 __ LDA T6 + 1 
1326 : 85 06 __ STA WORK + 3 
1328 : a5 49 __ LDA T4 + 0 
132a : 85 07 __ STA WORK + 4 
132c : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
132f : c6 45 __ DEC T1 + 0 
1331 : d0 a5 __ BNE $12d8 ; (bmu_bitblit.l29 + 0)
1333 : 4c 33 12 JMP $1233 ; (bmu_bitblit.s3 + 0)
.s22:
1336 : a5 45 __ LDA T1 + 0 
1338 : f0 f9 __ BEQ $1333 ; (bmu_bitblit.s61 + 29)
.l23:
133a : a5 53 __ LDA T6 + 0 
133c : 29 07 __ AND #$07
133e : a8 __ __ TAY
133f : b1 47 __ LDA (T3 + 0),y 
1341 : 85 49 __ STA T4 + 0 
1343 : a5 50 __ LDA T5 + 0 
1345 : 85 03 __ STA WORK + 0 
1347 : a5 51 __ LDA T5 + 1 
1349 : 85 04 __ STA WORK + 1 
134b : a5 53 __ LDA T6 + 0 
134d : 85 05 __ STA WORK + 2 
134f : a5 54 __ LDA T6 + 1 
1351 : 85 06 __ STA WORK + 3 
1353 : a5 49 __ LDA T4 + 0 
1355 : 85 07 __ STA WORK + 4 
1357 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
135a : e6 50 __ INC T5 + 0 
135c : d0 02 __ BNE $1360 ; (bmu_bitblit.s63 + 0)
.s62:
135e : e6 51 __ INC T5 + 1 
.s63:
1360 : a5 50 __ LDA T5 + 0 
1362 : 29 07 __ AND #$07
1364 : d0 0d __ BNE $1373 ; (bmu_bitblit.s24 + 0)
.s27:
1366 : 18 __ __ CLC
1367 : a5 50 __ LDA T5 + 0 
1369 : 65 4e __ ADC T2 + 0 
136b : 85 50 __ STA T5 + 0 
136d : a5 51 __ LDA T5 + 1 
136f : 65 4f __ ADC T2 + 1 
1371 : 85 51 __ STA T5 + 1 
.s24:
1373 : e6 53 __ INC T6 + 0 
1375 : d0 02 __ BNE $1379 ; (bmu_bitblit.s65 + 0)
.s64:
1377 : e6 54 __ INC T6 + 1 
.s65:
1379 : a5 53 __ LDA T6 + 0 
137b : 29 07 __ AND #$07
137d : d0 0d __ BNE $138c ; (bmu_bitblit.s25 + 0)
.s26:
137f : 18 __ __ CLC
1380 : a5 53 __ LDA T6 + 0 
1382 : 65 43 __ ADC T0 + 0 
1384 : 85 53 __ STA T6 + 0 
1386 : a5 54 __ LDA T6 + 1 
1388 : 65 44 __ ADC T0 + 1 
138a : 85 54 __ STA T6 + 1 
.s25:
138c : c6 45 __ DEC T1 + 0 
138e : d0 aa __ BNE $133a ; (bmu_bitblit.l23 + 0)
1390 : 4c 33 12 JMP $1233 ; (bmu_bitblit.s3 + 0)
.s36:
1393 : 18 __ __ CLC
1394 : a5 11 __ LDA P4 
1396 : 69 e1 __ ADC #$e1
1398 : 2a __ __ ROL
1399 : 2a __ __ ROL
139a : 2a __ __ ROL
139b : a8 __ __ TAY
139c : 29 f8 __ AND #$f8
139e : 85 45 __ STA T1 + 0 
13a0 : 98 __ __ TYA
13a1 : 29 07 __ AND #$07
13a3 : 2a __ __ ROL
13a4 : 69 f8 __ ADC #$f8
13a6 : 85 46 __ STA T1 + 1 
13a8 : 18 __ __ CLC
13a9 : a5 53 __ LDA T6 + 0 
13ab : 65 45 __ ADC T1 + 0 
13ad : 85 53 __ STA T6 + 0 
13af : a5 54 __ LDA T6 + 1 
13b1 : 65 46 __ ADC T1 + 1 
13b3 : 85 54 __ STA T6 + 1 
13b5 : a5 13 __ LDA P6 
13b7 : 85 12 __ STA P5 
13b9 : a5 4c __ LDA T10 + 0 
13bb : 85 13 __ STA P6 
13bd : 18 __ __ CLC
13be : a5 49 __ LDA T4 + 0 
13c0 : 65 45 __ ADC T1 + 0 
13c2 : 85 50 __ STA T5 + 0 
13c4 : 8a __ __ TXA
13c5 : 65 46 __ ADC T1 + 1 
13c7 : 85 51 __ STA T5 + 1 
13c9 : 24 43 __ BIT T0 + 0 
13cb : 30 03 __ BMI $13d0 ; (bmu_bitblit.s37 + 0)
13cd : 4c bb 11 JMP $11bb ; (bmu_bitblit.s8 + 0)
.s37:
13d0 : 18 __ __ CLC
13d1 : a5 50 __ LDA T5 + 0 
13d3 : 69 08 __ ADC #$08
13d5 : 85 50 __ STA T5 + 0 
13d7 : 90 f4 __ BCC $13cd ; (bmu_bitblit.s36 + 58)
.s57:
13d9 : e6 51 __ INC T5 + 1 
13db : 4c bb 11 JMP $11bb ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
13de : a5 15 __ LDA P8 ; (reverse + 0)
13e0 : f0 16 __ BEQ $13f8 ; (builddop.s5 + 0)
.s48:
13e2 : a9 38 __ LDA #$38
13e4 : 85 48 __ STA T9 + 0 
13e6 : a9 e1 __ LDA #$e1
13e8 : 85 49 __ STA T10 + 0 
13ea : a9 b0 __ LDA #$b0
13ec : 85 4a __ STA T11 + 0 
13ee : a9 c2 __ LDA #$c2
13f0 : 85 4b __ STA T12 + 0 
13f2 : a9 f8 __ LDA #$f8
13f4 : 85 44 __ STA T3 + 0 
13f6 : d0 16 __ BNE $140e ; (builddop.s6 + 0)
.s5:
13f8 : a9 18 __ LDA #$18
13fa : 85 48 __ STA T9 + 0 
13fc : a9 61 __ LDA #$61
13fe : 85 49 __ STA T10 + 0 
1400 : a9 90 __ LDA #$90
1402 : 85 4a __ STA T11 + 0 
1404 : a9 e2 __ LDA #$e2
1406 : 85 4b __ STA T12 + 0 
1408 : a9 00 __ LDA #$00
140a : 85 44 __ STA T3 + 0 
140c : a9 08 __ LDA #$08
.s6:
140e : 85 47 __ STA T6 + 0 
1410 : a5 14 __ LDA P7 ; (op + 0)
1412 : 29 08 __ AND #$08
1414 : 85 45 __ STA T4 + 0 
1416 : a5 14 __ LDA P7 ; (op + 0)
1418 : 29 10 __ AND #$10
141a : 85 46 __ STA T5 + 0 
141c : a5 11 __ LDA P4 ; (w + 0)
141e : d0 06 __ BNE $1426 ; (builddop.s8 + 0)
.s7:
1420 : a5 13 __ LDA P6 ; (rmask + 0)
1422 : 25 12 __ AND P5 ; (lmask + 0)
1424 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
1426 : a9 a0 __ LDA #$a0
1428 : 8d 00 34 STA $3400 ; (BLIT_CODE[0] + 0)
142b : a5 44 __ LDA T3 + 0 
142d : 8d 01 34 STA $3401 ; (BLIT_CODE[0] + 1)
1430 : a9 02 __ LDA #$02
1432 : 85 43 __ STA T0 + 0 
1434 : a6 12 __ LDX P5 ; (lmask + 0)
1436 : e8 __ __ INX
1437 : d0 03 __ BNE $143c ; (builddop.s9 + 0)
1439 : 4c 6f 16 JMP $166f ; (builddop.s44 + 0)
.s9:
143c : a5 46 __ LDA T5 + 0 
143e : f0 18 __ BEQ $1458 ; (builddop.s10 + 0)
.s43:
1440 : a9 b1 __ LDA #$b1
1442 : 8d 02 34 STA $3402 ; (BLIT_CODE[0] + 2)
1445 : a9 05 __ LDA #$05
1447 : 8d 03 34 STA $3403 ; (BLIT_CODE[0] + 3)
144a : a9 85 __ LDA #$85
144c : 8d 04 34 STA $3404 ; (BLIT_CODE[0] + 4)
144f : a9 0a __ LDA #$0a
1451 : 8d 05 34 STA $3405 ; (BLIT_CODE[0] + 5)
1454 : a9 06 __ LDA #$06
1456 : 85 43 __ STA T0 + 0 
.s10:
1458 : a5 45 __ LDA T4 + 0 
145a : d0 05 __ BNE $1461 ; (builddop.s40 + 0)
.s11:
145c : a5 43 __ LDA T0 + 0 
145e : 4c c2 14 JMP $14c2 ; (builddop.s52 + 0)
.s40:
1461 : a5 10 __ LDA P3 ; (shift + 0)
1463 : 85 0e __ STA P1 
1465 : d0 05 __ BNE $146c ; (builddop.s42 + 0)
.s41:
1467 : a5 43 __ LDA T0 + 0 
1469 : 4c b9 14 JMP $14b9 ; (builddop.s51 + 0)
.s42:
146c : a9 b1 __ LDA #$b1
146e : a6 43 __ LDX T0 + 0 
1470 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
1473 : a9 03 __ LDA #$03
1475 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
1478 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
147b : 9d 0a 34 STA $340a,x ; (BLIT_CODE[0] + 10)
147e : a9 85 __ LDA #$85
1480 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
1483 : 9d 09 34 STA $3409,x ; (BLIT_CODE[0] + 9)
1486 : a9 08 __ LDA #$08
1488 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
148b : 9d 08 34 STA $3408,x ; (BLIT_CODE[0] + 8)
148e : a9 a5 __ LDA #$a5
1490 : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
1493 : a9 02 __ LDA #$02
1495 : 9d 0c 34 STA $340c,x ; (BLIT_CODE[0] + 12)
1498 : a9 04 __ LDA #$04
149a : 9d 0e 34 STA $340e,x ; (BLIT_CODE[0] + 14)
149d : a5 48 __ LDA T9 + 0 
149f : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
14a2 : a5 49 __ LDA T10 + 0 
14a4 : 09 08 __ ORA #$08
14a6 : 9d 07 34 STA $3407,x ; (BLIT_CODE[0] + 7)
14a9 : a5 4a __ LDA T11 + 0 
14ab : 9d 0b 34 STA $340b,x ; (BLIT_CODE[0] + 11)
14ae : a5 4b __ LDA T12 + 0 
14b0 : 09 04 __ ORA #$04
14b2 : 9d 0d 34 STA $340d,x ; (BLIT_CODE[0] + 13)
14b5 : 8a __ __ TXA
14b6 : 18 __ __ CLC
14b7 : 69 0f __ ADC #$0f
.s51:
14b9 : 85 0d __ STA P0 
14bb : a5 15 __ LDA P8 ; (reverse + 0)
14bd : 85 0f __ STA P2 
14bf : 20 d0 16 JSR $16d0 ; (builddop_src.s4 + 0)
.s52:
14c2 : 85 0d __ STA P0 
14c4 : a5 14 __ LDA P7 ; (op + 0)
14c6 : 85 0e __ STA P1 
14c8 : a5 12 __ LDA P5 ; (lmask + 0)
14ca : 49 ff __ EOR #$ff
14cc : 85 0f __ STA P2 
14ce : 20 10 18 JSR $1810 ; (builddop_op.s4 + 0)
14d1 : 85 43 __ STA T0 + 0 
14d3 : a5 11 __ LDA P4 ; (w + 0)
14d5 : f0 68 __ BEQ $153f ; (builddop.s12 + 0)
.s13:
14d7 : a9 a0 __ LDA #$a0
14d9 : a6 43 __ LDX T0 + 0 
14db : e8 __ __ INX
14dc : e8 __ __ INX
14dd : 86 43 __ STX T0 + 0 
14df : 86 0d __ STX P0 
14e1 : 9d fe 33 STA $33fe,x 
14e4 : 18 __ __ CLC
14e5 : a5 47 __ LDA T6 + 0 
14e7 : 65 44 __ ADC T3 + 0 
14e9 : 85 44 __ STA T3 + 0 
14eb : 9d ff 33 STA $33ff,x 
.s14:
14ee : a5 11 __ LDA P4 ; (w + 0)
14f0 : c9 02 __ CMP #$02
14f2 : b0 53 __ BCS $1547 ; (builddop.s21 + 0)
.s15:
14f4 : a5 13 __ LDA P6 ; (rmask + 0)
14f6 : f0 47 __ BEQ $153f ; (builddop.s12 + 0)
.s16:
14f8 : a5 46 __ LDA T5 + 0 
14fa : f0 1e __ BEQ $151a ; (builddop.s17 + 0)
.s20:
14fc : a9 b1 __ LDA #$b1
14fe : a6 43 __ LDX T0 + 0 
1500 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
1503 : a9 05 __ LDA #$05
1505 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
1508 : a9 85 __ LDA #$85
150a : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
150d : a9 0a __ LDA #$0a
150f : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
1512 : 8a __ __ TXA
1513 : 18 __ __ CLC
1514 : 69 04 __ ADC #$04
1516 : 85 43 __ STA T0 + 0 
1518 : 85 0d __ STA P0 
.s17:
151a : a5 45 __ LDA T4 + 0 
151c : d0 05 __ BNE $1523 ; (builddop.s19 + 0)
.s18:
151e : a5 43 __ LDA T0 + 0 
1520 : 4c 2e 15 JMP $152e ; (builddop.s50 + 0)
.s19:
1523 : a5 10 __ LDA P3 ; (shift + 0)
1525 : 85 0e __ STA P1 
1527 : a5 15 __ LDA P8 ; (reverse + 0)
1529 : 85 0f __ STA P2 
152b : 20 d0 16 JSR $16d0 ; (builddop_src.s4 + 0)
.s50:
152e : 85 0d __ STA P0 
1530 : a5 14 __ LDA P7 ; (op + 0)
1532 : 85 0e __ STA P1 
1534 : a5 13 __ LDA P6 ; (rmask + 0)
1536 : 49 ff __ EOR #$ff
1538 : 85 0f __ STA P2 
153a : 20 10 18 JSR $1810 ; (builddop_op.s4 + 0)
153d : 85 43 __ STA T0 + 0 
.s12:
153f : a9 60 __ LDA #$60
1541 : a6 43 __ LDX T0 + 0 
1543 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
.s3:
1546 : 60 __ __ RTS
.s21:
1547 : a9 02 __ LDA #$02
1549 : c5 11 __ CMP P4 ; (w + 0)
154b : a9 00 __ LDA #$00
154d : 6a __ __ ROR
154e : 85 4c __ STA T14 + 0 
1550 : d0 19 __ BNE $156b ; (builddop.s22 + 0)
.s39:
1552 : a9 a2 __ LDA #$a2
1554 : a6 43 __ LDX T0 + 0 
1556 : e8 __ __ INX
1557 : e8 __ __ INX
1558 : 86 43 __ STX T0 + 0 
155a : 9d fe 33 STA $33fe,x 
155d : 38 __ __ SEC
155e : a5 11 __ LDA P4 ; (w + 0)
1560 : e9 01 __ SBC #$01
1562 : 9d ff 33 STA $33ff,x 
1565 : a5 11 __ LDA P4 ; (w + 0)
1567 : c9 20 __ CMP #$20
1569 : b0 0d __ BCS $1578 ; (builddop.s24 + 0)
.s22:
156b : a5 10 __ LDA P3 ; (shift + 0)
156d : d0 09 __ BNE $1578 ; (builddop.s24 + 0)
.s23:
156f : a5 48 __ LDA T9 + 0 
1571 : a6 43 __ LDX T0 + 0 
1573 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
1576 : e6 43 __ INC T0 + 0 
.s24:
1578 : a6 43 __ LDX T0 + 0 
157a : 86 4d __ STX T15 + 0 
157c : a5 46 __ LDA T5 + 0 
157e : f0 1a __ BEQ $159a ; (builddop.s25 + 0)
.s38:
1580 : a9 b1 __ LDA #$b1
1582 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
1585 : a9 05 __ LDA #$05
1587 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
158a : a9 85 __ LDA #$85
158c : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
158f : a9 0a __ LDA #$0a
1591 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
1594 : 8a __ __ TXA
1595 : 18 __ __ CLC
1596 : 69 04 __ ADC #$04
1598 : 85 43 __ STA T0 + 0 
.s25:
159a : a5 45 __ LDA T4 + 0 
159c : d0 05 __ BNE $15a3 ; (builddop.s37 + 0)
.s26:
159e : a5 43 __ LDA T0 + 0 
15a0 : 4c b2 15 JMP $15b2 ; (builddop.s49 + 0)
.s37:
15a3 : a5 43 __ LDA T0 + 0 
15a5 : 85 0d __ STA P0 
15a7 : a5 10 __ LDA P3 ; (shift + 0)
15a9 : 85 0e __ STA P1 
15ab : a5 15 __ LDA P8 ; (reverse + 0)
15ad : 85 0f __ STA P2 
15af : 20 d0 16 JSR $16d0 ; (builddop_src.s4 + 0)
.s49:
15b2 : 85 0d __ STA P0 
15b4 : a5 14 __ LDA P7 ; (op + 0)
15b6 : 85 0e __ STA P1 
15b8 : a9 00 __ LDA #$00
15ba : 85 0f __ STA P2 
15bc : 20 10 18 JSR $1810 ; (builddop_op.s4 + 0)
15bf : 24 4c __ BIT T14 + 0 
15c1 : 10 17 __ BPL $15da ; (builddop.s28 + 0)
.s27:
15c3 : aa __ __ TAX
15c4 : e8 __ __ INX
15c5 : e8 __ __ INX
15c6 : 86 43 __ STX T0 + 0 
15c8 : 86 0d __ STX P0 
15ca : a9 a0 __ LDA #$a0
15cc : 9d fe 33 STA $33fe,x 
15cf : 18 __ __ CLC
15d0 : a5 47 __ LDA T6 + 0 
15d2 : 65 44 __ ADC T3 + 0 
15d4 : 9d ff 33 STA $33ff,x 
15d7 : 4c f4 14 JMP $14f4 ; (builddop.s15 + 0)
.s28:
15da : a8 __ __ TAY
15db : a9 1f __ LDA #$1f
15dd : c5 11 __ CMP P4 ; (w + 0)
15df : a9 00 __ LDA #$00
15e1 : 6a __ __ ROR
15e2 : 85 47 __ STA T6 + 0 
15e4 : f0 04 __ BEQ $15ea ; (builddop.s36 + 0)
.s29:
15e6 : a5 10 __ LDA P3 ; (shift + 0)
15e8 : f0 06 __ BEQ $15f0 ; (builddop.s30 + 0)
.s36:
15ea : a5 48 __ LDA T9 + 0 
15ec : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
15ef : c8 __ __ INY
.s30:
15f0 : a9 98 __ LDA #$98
15f2 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
15f5 : a9 08 __ LDA #$08
15f7 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
15fa : a9 a8 __ LDA #$a8
15fc : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
15ff : a5 49 __ LDA T10 + 0 
1601 : 09 08 __ ORA #$08
1603 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
1606 : 98 __ __ TYA
1607 : 18 __ __ CLC
1608 : 69 04 __ ADC #$04
160a : 85 43 __ STA T0 + 0 
160c : 24 47 __ BIT T6 + 0 
160e : 30 3a __ BMI $164a ; (builddop.s31 + 0)
.s32:
1610 : a5 4a __ LDA T11 + 0 
1612 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
1615 : a5 4b __ LDA T12 + 0 
1617 : 09 04 __ ORA #$04
1619 : aa __ __ TAX
161a : a5 45 __ LDA T4 + 0 
161c : d0 0d __ BNE $162b ; (builddop.s35 + 0)
.s33:
161e : a9 02 __ LDA #$02
1620 : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
1623 : 18 __ __ CLC
1624 : a5 43 __ LDA T0 + 0 
1626 : 69 02 __ ADC #$02
1628 : 4c 3c 16 JMP $163c ; (builddop.s34 + 0)
.s35:
162b : a9 04 __ LDA #$04
162d : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
1630 : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
1633 : 8a __ __ TXA
1634 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
1637 : 18 __ __ CLC
1638 : a5 43 __ LDA T0 + 0 
163a : 69 04 __ ADC #$04
.s34:
163c : a8 __ __ TAY
163d : c8 __ __ INY
163e : c8 __ __ INY
163f : 84 43 __ STY T0 + 0 
1641 : 8a __ __ TXA
1642 : 99 fe 33 STA $33fe,y 
1645 : a9 06 __ LDA #$06
1647 : 99 ff 33 STA $33ff,y 
.s31:
164a : a9 ca __ LDA #$ca
164c : a4 43 __ LDY T0 + 0 
164e : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
1651 : a9 d0 __ LDA #$d0
1653 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
1656 : 98 __ __ TYA
1657 : 18 __ __ CLC
1658 : 69 01 __ ADC #$01
165a : aa __ __ TAX
165b : e8 __ __ INX
165c : e8 __ __ INX
165d : 86 43 __ STX T0 + 0 
165f : 86 0d __ STX P0 
1661 : 49 ff __ EOR #$ff
1663 : 38 __ __ SEC
1664 : 65 4d __ ADC T15 + 0 
1666 : 38 __ __ SEC
1667 : e9 02 __ SBC #$02
1669 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
166c : 4c f4 14 JMP $14f4 ; (builddop.s15 + 0)
.s44:
166f : 85 0d __ STA P0 
1671 : a5 45 __ LDA T4 + 0 
1673 : f0 51 __ BEQ $16c6 ; (builddop.s45 + 0)
.s46:
1675 : a5 10 __ LDA P3 ; (shift + 0)
1677 : f0 4d __ BEQ $16c6 ; (builddop.s45 + 0)
.s47:
1679 : a9 03 __ LDA #$03
167b : 8d 03 34 STA $3403 ; (BLIT_CODE[0] + 3)
167e : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
1681 : 8d 0c 34 STA $340c ; (BLIT_CODE[0] + 12)
1684 : a9 b1 __ LDA #$b1
1686 : 8d 02 34 STA $3402 ; (BLIT_CODE[0] + 2)
1689 : a9 85 __ LDA #$85
168b : 8d 04 34 STA $3404 ; (BLIT_CODE[0] + 4)
168e : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
1691 : a9 08 __ LDA #$08
1693 : 8d 05 34 STA $3405 ; (BLIT_CODE[0] + 5)
1696 : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
1699 : a9 a5 __ LDA #$a5
169b : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
169e : a9 02 __ LDA #$02
16a0 : 8d 0e 34 STA $340e ; (BLIT_CODE[0] + 14)
16a3 : a9 04 __ LDA #$04
16a5 : 8d 10 34 STA $3410 ; (BLIT_CODE[0] + 16)
16a8 : a5 48 __ LDA T9 + 0 
16aa : 8d 06 34 STA $3406 ; (BLIT_CODE[0] + 6)
16ad : a5 49 __ LDA T10 + 0 
16af : 09 08 __ ORA #$08
16b1 : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
16b4 : a5 4a __ LDA T11 + 0 
16b6 : 8d 0d 34 STA $340d ; (BLIT_CODE[0] + 13)
16b9 : a5 4b __ LDA T12 + 0 
16bb : 09 04 __ ORA #$04
16bd : 8d 0f 34 STA $340f ; (BLIT_CODE[0] + 15)
16c0 : a9 11 __ LDA #$11
16c2 : 85 43 __ STA T0 + 0 
16c4 : 85 0d __ STA P0 
.s45:
16c6 : e6 11 __ INC P4 ; (w + 0)
16c8 : d0 03 __ BNE $16cd ; (builddop.s45 + 7)
16ca : 4c 3f 15 JMP $153f ; (builddop.s12 + 0)
16cd : 4c ee 14 JMP $14ee ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
16d0 : a6 0d __ LDX P0 ; (ip + 0)
16d2 : e8 __ __ INX
16d3 : a4 0d __ LDY P0 ; (ip + 0)
16d5 : e8 __ __ INX
16d6 : a5 0e __ LDA P1 ; (shift + 0)
16d8 : d0 0c __ BNE $16e6 ; (builddop_src.s6 + 0)
.s5:
16da : a9 b1 __ LDA #$b1
16dc : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
16df : a9 03 __ LDA #$03
16e1 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
16e4 : 8a __ __ TXA
.s3:
16e5 : 60 __ __ RTS
.s6:
16e6 : a9 a5 __ LDA #$a5
16e8 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
16eb : a9 08 __ LDA #$08
16ed : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
16f0 : a5 0f __ LDA P2 ; (reverse + 0)
16f2 : f0 03 __ BEQ $16f7 ; (builddop_src.s7 + 0)
16f4 : 4c 02 18 JMP $1802 ; (builddop_src.s26 + 0)
.s7:
16f7 : a5 0e __ LDA P1 ; (shift + 0)
16f9 : c9 05 __ CMP #$05
16fb : b0 06 __ BCS $1703 ; (builddop_src.s8 + 0)
.s24:
16fd : a9 4a __ LDA #$4a
.s25:
16ff : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
1702 : e8 __ __ INX
.s8:
1703 : a9 85 __ LDA #$85
1705 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
1708 : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
170b : a9 09 __ LDA #$09
170d : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
1710 : a9 b1 __ LDA #$b1
1712 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
1715 : a9 03 __ LDA #$03
1717 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
171a : a9 08 __ LDA #$08
171c : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
171f : 8a __ __ TXA
1720 : 18 __ __ CLC
1721 : 69 06 __ ADC #$06
1723 : 85 1b __ STA ACCU + 0 
1725 : a8 __ __ TAY
1726 : a5 0f __ LDA P2 ; (reverse + 0)
1728 : d0 72 __ BNE $179c ; (builddop_src.s17 + 0)
.s9:
172a : a5 0e __ LDA P1 ; (shift + 0)
172c : c9 05 __ CMP #$05
172e : 90 0b __ BCC $173b ; (builddop_src.s10 + 0)
.s13:
1730 : a9 0a __ LDA #$0a
1732 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
1735 : e6 1b __ INC ACCU + 0 
1737 : a6 0e __ LDX P1 ; (shift + 0)
1739 : b0 25 __ BCS $1760 ; (builddop_src.l14 + 0)
.s10:
173b : c9 02 __ CMP #$02
173d : 90 19 __ BCC $1758 ; (builddop_src.s11 + 0)
.s12:
173f : c6 0e __ DEC P1 ; (shift + 0)
1741 : a6 0e __ LDX P1 ; (shift + 0)
.l29:
1743 : a9 6a __ LDA #$6a
1745 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
1748 : a9 46 __ LDA #$46
174a : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
174d : a9 09 __ LDA #$09
174f : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
1752 : c8 __ __ INY
1753 : c8 __ __ INY
1754 : c8 __ __ INY
1755 : ca __ __ DEX
1756 : d0 eb __ BNE $1743 ; (builddop_src.l29 + 0)
.s11:
1758 : a9 6a __ LDA #$6a
.s30:
175a : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
175d : c8 __ __ INY
175e : 98 __ __ TYA
175f : 60 __ __ RTS
.l14:
1760 : a5 1b __ LDA ACCU + 0 
1762 : 85 1d __ STA ACCU + 2 
1764 : 85 1c __ STA ACCU + 1 
1766 : a8 __ __ TAY
1767 : 18 __ __ CLC
1768 : 69 03 __ ADC #$03
176a : 85 1b __ STA ACCU + 0 
176c : e0 07 __ CPX #$07
176e : b0 16 __ BCS $1786 ; (builddop_src.s15 + 0)
.s16:
1770 : a9 26 __ LDA #$26
1772 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
1775 : a9 09 __ LDA #$09
1777 : a4 1d __ LDY ACCU + 2 
1779 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
177c : a9 0a __ LDA #$0a
177e : a4 1c __ LDY ACCU + 1 
1780 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
1783 : e8 __ __ INX
1784 : 90 da __ BCC $1760 ; (builddop_src.l14 + 0)
.s15:
1786 : a9 a5 __ LDA #$a5
1788 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
178b : a9 09 __ LDA #$09
178d : a6 1d __ LDX ACCU + 2 
178f : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
1792 : a9 2a __ LDA #$2a
1794 : a6 1c __ LDX ACCU + 1 
1796 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
1799 : a5 1b __ LDA ACCU + 0 
179b : 60 __ __ RTS
.s17:
179c : a5 0e __ LDA P1 ; (shift + 0)
179e : c9 05 __ CMP #$05
17a0 : b0 3e __ BCS $17e0 ; (builddop_src.s21 + 0)
.s18:
17a2 : a9 4a __ LDA #$4a
17a4 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
17a7 : e6 1b __ INC ACCU + 0 
17a9 : a6 0e __ LDX P1 ; (shift + 0)
17ab : e0 02 __ CPX #$02
17ad : 90 1b __ BCC $17ca ; (builddop_src.s19 + 0)
.s20:
17af : a4 1b __ LDY ACCU + 0 
.l28:
17b1 : a9 66 __ LDA #$66
17b3 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
17b6 : a9 09 __ LDA #$09
17b8 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
17bb : a9 4a __ LDA #$4a
17bd : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
17c0 : 98 __ __ TYA
17c1 : 18 __ __ CLC
17c2 : 69 03 __ ADC #$03
17c4 : a8 __ __ TAY
17c5 : ca __ __ DEX
17c6 : d0 e9 __ BNE $17b1 ; (builddop_src.l28 + 0)
.s31:
17c8 : 85 1b __ STA ACCU + 0 
.s19:
17ca : a9 a5 __ LDA #$a5
17cc : a6 1b __ LDX ACCU + 0 
17ce : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
17d1 : a9 09 __ LDA #$09
17d3 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
17d6 : a9 6a __ LDA #$6a
17d8 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
17db : 8a __ __ TXA
17dc : 18 __ __ CLC
17dd : 69 03 __ ADC #$03
17df : 60 __ __ RTS
.s21:
17e0 : c9 07 __ CMP #$07
17e2 : b0 19 __ BCS $17fd ; (builddop_src.s22 + 0)
.s23:
17e4 : aa __ __ TAX
.l32:
17e5 : a9 2a __ LDA #$2a
17e7 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
17ea : a9 06 __ LDA #$06
17ec : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
17ef : a9 09 __ LDA #$09
17f1 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
17f4 : 98 __ __ TYA
17f5 : 69 03 __ ADC #$03
17f7 : e8 __ __ INX
17f8 : e0 07 __ CPX #$07
17fa : a8 __ __ TAY
17fb : 90 e8 __ BCC $17e5 ; (builddop_src.l32 + 0)
.s22:
17fd : a9 2a __ LDA #$2a
17ff : 4c 5a 17 JMP $175a ; (builddop_src.s30 + 0)
.s26:
1802 : a5 0e __ LDA P1 ; (shift + 0)
1804 : c9 05 __ CMP #$05
1806 : b0 03 __ BCS $180b ; (builddop_src.s27 + 0)
1808 : 4c 03 17 JMP $1703 ; (builddop_src.s8 + 0)
.s27:
180b : a9 0a __ LDA #$0a
180d : 4c ff 16 JMP $16ff ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1810 : a5 0e __ LDA P1 ; (op + 0)
1812 : 29 20 __ AND #$20
1814 : f0 04 __ BEQ $181a ; (builddop_op.s27 + 0)
.s28:
1816 : a9 07 __ LDA #$07
1818 : d0 02 __ BNE $181c ; (builddop_op.s29 + 0)
.s27:
181a : a9 0a __ LDA #$0a
.s29:
181c : 85 1c __ STA ACCU + 1 
181e : a5 0e __ LDA P1 ; (op + 0)
1820 : 29 03 __ AND #$03
1822 : 85 1b __ STA ACCU + 0 
1824 : a5 0e __ LDA P1 ; (op + 0)
1826 : 29 04 __ AND #$04
1828 : f0 03 __ BEQ $182d ; (builddop_op.s5 + 0)
182a : 4c c0 18 JMP $18c0 ; (builddop_op.s18 + 0)
.s5:
182d : a5 0e __ LDA P1 ; (op + 0)
182f : 29 08 __ AND #$08
1831 : d0 13 __ BNE $1846 ; (builddop_op.s15 + 0)
.s6:
1833 : a9 a5 __ LDA #$a5
1835 : a4 0d __ LDY P0 ; (ip + 0)
1837 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
183a : a5 1c __ LDA ACCU + 1 
.s7:
183c : c8 __ __ INY
183d : c8 __ __ INY
183e : 84 0d __ STY P0 ; (ip + 0)
1840 : 99 ff 33 STA $33ff,y 
1843 : 4c 56 18 JMP $1856 ; (builddop_op.s16 + 0)
.s15:
1846 : a5 0e __ LDA P1 ; (op + 0)
1848 : 0a __ __ ASL
1849 : 10 0b __ BPL $1856 ; (builddop_op.s16 + 0)
.s17:
184b : a9 49 __ LDA #$49
184d : a4 0d __ LDY P0 ; (ip + 0)
184f : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
1852 : a9 ff __ LDA #$ff
1854 : d0 e6 __ BNE $183c ; (builddop_op.s7 + 0)
.s16:
1856 : a6 1b __ LDX ACCU + 0 
1858 : f0 13 __ BEQ $186d ; (builddop_op.s8 + 0)
.s14:
185a : a5 1c __ LDA ACCU + 1 
185c : a4 0d __ LDY P0 ; (ip + 0)
185e : c8 __ __ INY
185f : c8 __ __ INY
1860 : 84 0d __ STY P0 ; (ip + 0)
1862 : 99 ff 33 STA $33ff,y 
1865 : bd ed 32 LDA $32ed,x ; (blitops_op[0] + 0)
1868 : 09 04 __ ORA #$04
186a : 99 fe 33 STA $33fe,y 
.s8:
186d : a5 0f __ LDA P2 ; (mask + 0)
186f : f0 3f __ BEQ $18b0 ; (builddop_op.s9 + 0)
.s10:
1871 : a9 85 __ LDA #$85
1873 : a4 0d __ LDY P0 ; (ip + 0)
1875 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
1878 : a9 09 __ LDA #$09
187a : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
187d : 98 __ __ TYA
187e : 18 __ __ CLC
187f : 69 08 __ ADC #$08
1881 : 85 0d __ STA P0 ; (ip + 0)
1883 : a5 0e __ LDA P1 ; (op + 0)
1885 : 29 10 __ AND #$10
1887 : f0 09 __ BEQ $1892 ; (builddop_op.s11 + 0)
.s13:
1889 : a9 45 __ LDA #$45
188b : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
188e : a9 0a __ LDA #$0a
1890 : d0 07 __ BNE $1899 ; (builddop_op.s12 + 0)
.s11:
1892 : a9 51 __ LDA #$51
1894 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
1897 : a9 05 __ LDA #$05
.s12:
1899 : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
189c : a9 29 __ LDA #$29
189e : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
18a1 : a5 0f __ LDA P2 ; (mask + 0)
18a3 : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
18a6 : a9 45 __ LDA #$45
18a8 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
18ab : a9 09 __ LDA #$09
18ad : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
.s9:
18b0 : a9 91 __ LDA #$91
18b2 : a6 0d __ LDX P0 ; (ip + 0)
18b4 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
18b7 : a9 05 __ LDA #$05
18b9 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
18bc : e8 __ __ INX
18bd : e8 __ __ INX
18be : 8a __ __ TXA
.s3:
18bf : 60 __ __ RTS
.s18:
18c0 : a5 1b __ LDA ACCU + 0 
18c2 : d0 04 __ BNE $18c8 ; (builddop_op.s20 + 0)
.s19:
18c4 : a5 0f __ LDA P2 ; (mask + 0)
18c6 : d0 14 __ BNE $18dc ; (builddop_op.s23 + 0)
.s20:
18c8 : a5 0e __ LDA P1 ; (op + 0)
18ca : 29 40 __ AND #$40
18cc : f0 02 __ BEQ $18d0 ; (builddop_op.s21 + 0)
.s22:
18ce : a9 ff __ LDA #$ff
.s21:
18d0 : aa __ __ TAX
18d1 : a9 a9 __ LDA #$a9
18d3 : a4 0d __ LDY P0 ; (ip + 0)
18d5 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
18d8 : 8a __ __ TXA
18d9 : 4c 3c 18 JMP $183c ; (builddop_op.s7 + 0)
.s23:
18dc : a9 b1 __ LDA #$b1
18de : a4 0d __ LDY P0 ; (ip + 0)
18e0 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
18e3 : a9 05 __ LDA #$05
18e5 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
18e8 : 06 0e __ ASL P1 ; (op + 0)
18ea : 30 0a __ BMI $18f6 ; (builddop_op.s26 + 0)
.s24:
18ec : a9 29 __ LDA #$29
18ee : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
18f1 : a5 0f __ LDA P2 ; (mask + 0)
18f3 : 4c ff 18 JMP $18ff ; (builddop_op.s25 + 0)
.s26:
18f6 : a9 09 __ LDA #$09
18f8 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
18fb : a5 0f __ LDA P2 ; (mask + 0)
18fd : 49 ff __ EOR #$ff
.s25:
18ff : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
1902 : a9 91 __ LDA #$91
1904 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
1907 : a9 05 __ LDA #$05
1909 : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
190c : 98 __ __ TYA
190d : 18 __ __ CLC
190e : 69 06 __ ADC #$06
1910 : 60 __ __ RTS
--------------------------------------------------------------------
1911 : __ __ __ BYT 0b 00 0b 00 35 01 bd 00                         : ....5...
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
1919 : a5 0d __ LDA P0 ; (f + 0)
191b : 85 43 __ STA T0 + 0 
191d : a5 0e __ LDA P1 ; (f + 1)
191f : 85 44 __ STA T0 + 1 
1921 : a5 0f __ LDA P2 ; (f + 2)
1923 : 85 45 __ STA T0 + 2 
1925 : a5 10 __ LDA P3 ; (f + 3)
1927 : 29 7f __ AND #$7f
1929 : 05 0f __ ORA P2 ; (f + 2)
192b : 05 0e __ ORA P1 ; (f + 1)
192d : 05 0d __ ORA P0 ; (f + 0)
192f : f0 0e __ BEQ $193f ; (sin.s5 + 0)
.s22:
1931 : 24 10 __ BIT P3 ; (f + 3)
1933 : 10 0a __ BPL $193f ; (sin.s5 + 0)
.s21:
1935 : a9 00 __ LDA #$00
1937 : 85 47 __ STA T1 + 0 
1939 : 85 48 __ STA T1 + 1 
193b : a9 bf __ LDA #$bf
193d : d0 08 __ BNE $1947 ; (sin.s6 + 0)
.s5:
193f : a9 00 __ LDA #$00
1941 : 85 47 __ STA T1 + 0 
1943 : 85 48 __ STA T1 + 1 
1945 : a9 3f __ LDA #$3f
.s6:
1947 : 85 4a __ STA T1 + 3 
1949 : a5 10 __ LDA P3 ; (f + 3)
194b : 29 7f __ AND #$7f
194d : 85 46 __ STA T0 + 3 
194f : a9 80 __ LDA #$80
1951 : 85 49 __ STA T1 + 2 
1953 : a9 83 __ LDA #$83
1955 : 85 1b __ STA ACCU + 0 
1957 : a9 3e __ LDA #$3e
1959 : 85 1e __ STA ACCU + 3 
195b : a9 f9 __ LDA #$f9
195d : 85 1c __ STA ACCU + 1 
195f : a9 22 __ LDA #$22
1961 : 85 1d __ STA ACCU + 2 
1963 : a2 43 __ LDX #$43
1965 : 20 95 2c JSR $2c95 ; (freg + 4)
1968 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
196b : a5 1b __ LDA ACCU + 0 
196d : 85 43 __ STA T0 + 0 
196f : a5 1c __ LDA ACCU + 1 
1971 : 85 44 __ STA T0 + 1 
1973 : a5 1d __ LDA ACCU + 2 
1975 : 85 45 __ STA T0 + 2 
1977 : a5 1e __ LDA ACCU + 3 
1979 : 85 46 __ STA T0 + 3 
197b : 20 b5 2c JSR $2cb5 ; (freg + 36)
197e : 20 be 2f JSR $2fbe ; (fround + 0)
1981 : a2 43 __ LDX #$43
1983 : 20 95 2c JSR $2c95 ; (freg + 4)
1986 : a5 1e __ LDA ACCU + 3 
1988 : 49 80 __ EOR #$80
198a : 85 1e __ STA ACCU + 3 
198c : 20 dc 2c JSR $2cdc ; (faddsub + 6)
198f : a5 1b __ LDA ACCU + 0 
1991 : 85 43 __ STA T0 + 0 
1993 : a5 1c __ LDA ACCU + 1 
1995 : 85 44 __ STA T0 + 1 
1997 : a6 1d __ LDX ACCU + 2 
1999 : 86 45 __ STX T0 + 2 
199b : a5 1e __ LDA ACCU + 3 
199d : 85 46 __ STA T0 + 3 
199f : 30 3b __ BMI $19dc ; (sin.s7 + 0)
.s16:
19a1 : c9 3f __ CMP #$3f
19a3 : d0 0b __ BNE $19b0 ; (sin.s20 + 0)
.s17:
19a5 : 8a __ __ TXA
19a6 : d0 08 __ BNE $19b0 ; (sin.s20 + 0)
.s18:
19a8 : a5 1c __ LDA ACCU + 1 
19aa : d0 04 __ BNE $19b0 ; (sin.s20 + 0)
.s19:
19ac : a5 1b __ LDA ACCU + 0 
19ae : f0 02 __ BEQ $19b2 ; (sin.s15 + 0)
.s20:
19b0 : 90 2a __ BCC $19dc ; (sin.s7 + 0)
.s15:
19b2 : a9 00 __ LDA #$00
19b4 : 85 1b __ STA ACCU + 0 
19b6 : 85 1c __ STA ACCU + 1 
19b8 : 85 1d __ STA ACCU + 2 
19ba : a9 bf __ LDA #$bf
19bc : 85 1e __ STA ACCU + 3 
19be : a2 43 __ LDX #$43
19c0 : 20 95 2c JSR $2c95 ; (freg + 4)
19c3 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
19c6 : a5 1b __ LDA ACCU + 0 
19c8 : 85 43 __ STA T0 + 0 
19ca : a5 1c __ LDA ACCU + 1 
19cc : 85 44 __ STA T0 + 1 
19ce : a5 1d __ LDA ACCU + 2 
19d0 : 85 45 __ STA T0 + 2 
19d2 : a5 1e __ LDA ACCU + 3 
19d4 : 85 46 __ STA T0 + 3 
19d6 : a5 4a __ LDA T1 + 3 
19d8 : 49 80 __ EOR #$80
19da : 85 4a __ STA T1 + 3 
.s7:
19dc : a5 1e __ LDA ACCU + 3 
19de : 30 38 __ BMI $1a18 ; (sin.s8 + 0)
.s10:
19e0 : c9 3e __ CMP #$3e
19e2 : d0 0e __ BNE $19f2 ; (sin.s14 + 0)
.s11:
19e4 : a5 1d __ LDA ACCU + 2 
19e6 : c9 80 __ CMP #$80
19e8 : d0 08 __ BNE $19f2 ; (sin.s14 + 0)
.s12:
19ea : a5 1c __ LDA ACCU + 1 
19ec : d0 04 __ BNE $19f2 ; (sin.s14 + 0)
.s13:
19ee : a5 1b __ LDA ACCU + 0 
19f0 : f0 02 __ BEQ $19f4 ; (sin.s9 + 0)
.s14:
19f2 : 90 24 __ BCC $1a18 ; (sin.s8 + 0)
.s9:
19f4 : a9 00 __ LDA #$00
19f6 : 85 1b __ STA ACCU + 0 
19f8 : 85 1c __ STA ACCU + 1 
19fa : 85 1d __ STA ACCU + 2 
19fc : a9 3f __ LDA #$3f
19fe : 85 1e __ STA ACCU + 3 
1a00 : a2 43 __ LDX #$43
1a02 : 20 95 2c JSR $2c95 ; (freg + 4)
1a05 : 20 d6 2c JSR $2cd6 ; (faddsub + 0)
1a08 : a5 1b __ LDA ACCU + 0 
1a0a : 85 43 __ STA T0 + 0 
1a0c : a5 1c __ LDA ACCU + 1 
1a0e : 85 44 __ STA T0 + 1 
1a10 : a5 1d __ LDA ACCU + 2 
1a12 : 85 45 __ STA T0 + 2 
1a14 : a5 1e __ LDA ACCU + 3 
1a16 : 85 46 __ STA T0 + 3 
.s8:
1a18 : a9 98 __ LDA #$98
1a1a : 85 1b __ STA ACCU + 0 
1a1c : a9 42 __ LDA #$42
1a1e : 85 1e __ STA ACCU + 3 
1a20 : a9 ec __ LDA #$ec
1a22 : 85 1c __ STA ACCU + 1 
1a24 : a9 5e __ LDA #$5e
1a26 : 85 1d __ STA ACCU + 2 
1a28 : a2 43 __ LDX #$43
1a2a : 20 95 2c JSR $2c95 ; (freg + 4)
1a2d : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
1a30 : a9 f8 __ LDA #$f8
1a32 : 85 03 __ STA WORK + 0 
1a34 : a9 41 __ LDA #$41
1a36 : 85 06 __ STA WORK + 3 
1a38 : a9 c5 __ LDA #$c5
1a3a : 85 04 __ STA WORK + 1 
1a3c : a9 13 __ LDA #$13
1a3e : 85 05 __ STA WORK + 2 
1a40 : 20 a5 2c JSR $2ca5 ; (freg + 20)
1a43 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
1a46 : a2 43 __ LDX #$43
1a48 : 20 95 2c JSR $2c95 ; (freg + 4)
1a4b : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
1a4e : a9 6e __ LDA #$6e
1a50 : 85 03 __ STA WORK + 0 
1a52 : a9 c2 __ LDA #$c2
1a54 : 85 06 __ STA WORK + 3 
1a56 : a9 27 __ LDA #$27
1a58 : 85 04 __ STA WORK + 1 
1a5a : a9 2a __ LDA #$2a
1a5c : 85 05 __ STA WORK + 2 
1a5e : 20 a5 2c JSR $2ca5 ; (freg + 20)
1a61 : 20 dc 2c JSR $2cdc ; (faddsub + 6)
1a64 : a2 43 __ LDX #$43
1a66 : 20 95 2c JSR $2c95 ; (freg + 4)
1a69 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
1a6c : a9 df __ LDA #$df
1a6e : 85 03 __ STA WORK + 0 
1a70 : a9 3d __ LDA #$3d
1a72 : 85 06 __ STA WORK + 3 
1a74 : a9 af __ LDA #$af
1a76 : 85 04 __ STA WORK + 1 
1a78 : a9 5c __ LDA #$5c
1a7a : 85 05 __ STA WORK + 2 
1a7c : 20 a5 2c JSR $2ca5 ; (freg + 20)
1a7f : 20 dc 2c JSR $2cdc ; (faddsub + 6)
1a82 : a2 43 __ LDX #$43
1a84 : 20 95 2c JSR $2c95 ; (freg + 4)
1a87 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
1a8a : a9 b6 __ LDA #$b6
1a8c : 85 03 __ STA WORK + 0 
1a8e : a9 40 __ LDA #$40
1a90 : 85 06 __ STA WORK + 3 
1a92 : a9 0f __ LDA #$0f
1a94 : 85 04 __ STA WORK + 1 
1a96 : a9 c9 __ LDA #$c9
1a98 : 85 05 __ STA WORK + 2 
1a9a : 20 a5 2c JSR $2ca5 ; (freg + 20)
1a9d : 20 dc 2c JSR $2cdc ; (faddsub + 6)
1aa0 : a2 43 __ LDX #$43
1aa2 : 20 95 2c JSR $2c95 ; (freg + 4)
1aa5 : 20 c3 2d JSR $2dc3 ; (crt_fmul + 0)
1aa8 : a2 47 __ LDX #$47
1aaa : 20 95 2c JSR $2c95 ; (freg + 4)
1aad : 4c c3 2d JMP $2dc3 ; (crt_fmul + 0)
--------------------------------------------------------------------
bm_polygon_nc_fill: ; bm_polygon_nc_fill(const struct Bitmap*,const struct ClipRect*,i16*,i16*,u8,const u8*)->void
;  98, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
1ab0 : a2 0f __ LDX #$0f
1ab2 : b5 53 __ LDA T6 + 0,x 
1ab4 : 9d de 9f STA $9fde,x ; (bm_polygon_nc_fill@stack + 0)
1ab7 : ca __ __ DEX
1ab8 : 10 f8 __ BPL $1ab2 ; (bm_polygon_nc_fill.s1 + 2)
.s4:
1aba : a9 00 __ LDA #$00
1abc : 85 5b __ STA T10 + 0 
1abe : 85 5c __ STA T10 + 1 
1ac0 : 85 5d __ STA T11 + 0 
1ac2 : 85 5e __ STA T11 + 1 
1ac4 : a5 18 __ LDA P11 ; (num + 0)
1ac6 : 85 61 __ STA T13 + 0 
1ac8 : a9 00 __ LDA #$00
1aca : 85 4f __ STA T3 + 0 
1acc : a9 34 __ LDA #$34
1ace : 85 50 __ STA T3 + 1 
1ad0 : a9 10 __ LDA #$10
1ad2 : c5 18 __ CMP P11 ; (num + 0)
1ad4 : b0 02 __ BCS $1ad8 ; (bm_polygon_nc_fill.s5 + 0)
.s94:
1ad6 : 85 61 __ STA T13 + 0 
.s5:
1ad8 : ad f2 9f LDA $9ff2 ; (sstack + 2)
1adb : 85 5f __ STA T12 + 0 
1add : ad f3 9f LDA $9ff3 ; (sstack + 3)
1ae0 : 85 60 __ STA T12 + 1 
1ae2 : a5 61 __ LDA T13 + 0 
1ae4 : d0 03 __ BNE $1ae9 ; (bm_polygon_nc_fill.s50 + 0)
1ae6 : 4c ab 1b JMP $1bab ; (bm_polygon_nc_fill.s6 + 0)
.s50:
1ae9 : a9 00 __ LDA #$00
1aeb : 85 62 __ STA T14 + 0 
1aed : 85 43 __ STA T4 + 0 
1aef : a0 02 __ LDY #$02
1af1 : b1 5f __ LDA (T12 + 0),y 
1af3 : 85 51 __ STA T5 + 0 
1af5 : c8 __ __ INY
1af6 : b1 5f __ LDA (T12 + 0),y 
1af8 : 85 52 __ STA T5 + 1 
1afa : a0 06 __ LDY #$06
1afc : b1 5f __ LDA (T12 + 0),y 
1afe : 85 53 __ STA T6 + 0 
1b00 : c8 __ __ INY
1b01 : b1 5f __ LDA (T12 + 0),y 
1b03 : 85 54 __ STA T6 + 1 
1b05 : a2 00 __ LDX #$00
1b07 : 18 __ __ CLC
.l51:
1b08 : a5 43 __ LDA T4 + 0 
1b0a : 69 01 __ ADC #$01
1b0c : c5 61 __ CMP T13 + 0 
1b0e : 90 02 __ BCC $1b12 ; (bm_polygon_nc_fill.s52 + 0)
.s93:
1b10 : a9 00 __ LDA #$00
.s52:
1b12 : 85 45 __ STA T0 + 0 
1b14 : ad f6 9f LDA $9ff6 ; (sstack + 6)
1b17 : 85 49 __ STA T1 + 0 
1b19 : ad f7 9f LDA $9ff7 ; (sstack + 7)
1b1c : 85 4a __ STA T1 + 1 
1b1e : a5 43 __ LDA T4 + 0 
1b20 : 0a __ __ ASL
1b21 : a8 __ __ TAY
1b22 : b1 49 __ LDA (T1 + 0),y 
1b24 : 85 55 __ STA T7 + 0 
1b26 : c8 __ __ INY
1b27 : b1 49 __ LDA (T1 + 0),y 
1b29 : 85 56 __ STA T7 + 1 
1b2b : a5 45 __ LDA T0 + 0 
1b2d : 0a __ __ ASL
1b2e : a8 __ __ TAY
1b2f : b1 49 __ LDA (T1 + 0),y 
1b31 : 85 4d __ STA T2 + 0 
1b33 : a5 56 __ LDA T7 + 1 
1b35 : c8 __ __ INY
1b36 : d1 49 __ CMP (T1 + 0),y 
1b38 : d0 06 __ BNE $1b40 ; (bm_polygon_nc_fill.s54 + 0)
.s92:
1b3a : a5 55 __ LDA T7 + 0 
1b3c : c5 4d __ CMP T2 + 0 
1b3e : f0 5e __ BEQ $1b9e ; (bm_polygon_nc_fill.s53 + 0)
.s54:
1b40 : b1 49 __ LDA (T1 + 0),y 
1b42 : c5 56 __ CMP T7 + 1 
1b44 : d0 08 __ BNE $1b4e ; (bm_polygon_nc_fill.s91 + 0)
.s88:
1b46 : a5 4d __ LDA T2 + 0 
1b48 : c5 55 __ CMP T7 + 0 
.s89:
1b4a : 90 08 __ BCC $1b54 ; (bm_polygon_nc_fill.s87 + 0)
1b4c : b0 0c __ BCS $1b5a ; (bm_polygon_nc_fill.s55 + 0)
.s91:
1b4e : 45 56 __ EOR T7 + 1 
1b50 : 10 f8 __ BPL $1b4a ; (bm_polygon_nc_fill.s89 + 0)
.s90:
1b52 : 90 06 __ BCC $1b5a ; (bm_polygon_nc_fill.s55 + 0)
.s87:
1b54 : a5 62 __ LDA T14 + 0 
1b56 : a6 45 __ LDX T0 + 0 
1b58 : 85 45 __ STA T0 + 0 
.s55:
1b5a : 8a __ __ TXA
1b5b : 0a __ __ ASL
1b5c : 85 4d __ STA T2 + 0 
1b5e : a8 __ __ TAY
1b5f : b1 49 __ LDA (T1 + 0),y 
1b61 : 85 55 __ STA T7 + 0 
1b63 : c8 __ __ INY
1b64 : b1 49 __ LDA (T1 + 0),y 
1b66 : 85 56 __ STA T7 + 1 
1b68 : c5 54 __ CMP T6 + 1 
1b6a : d0 08 __ BNE $1b74 ; (bm_polygon_nc_fill.s86 + 0)
.s83:
1b6c : a5 55 __ LDA T7 + 0 
1b6e : c5 53 __ CMP T6 + 0 
.s84:
1b70 : 90 08 __ BCC $1b7a ; (bm_polygon_nc_fill.s56 + 0)
1b72 : b0 2a __ BCS $1b9e ; (bm_polygon_nc_fill.s53 + 0)
.s86:
1b74 : 45 54 __ EOR T6 + 1 
1b76 : 10 f8 __ BPL $1b70 ; (bm_polygon_nc_fill.s84 + 0)
.s85:
1b78 : 90 24 __ BCC $1b9e ; (bm_polygon_nc_fill.s53 + 0)
.s56:
1b7a : a5 45 __ LDA T0 + 0 
1b7c : 0a __ __ ASL
1b7d : 85 57 __ STA T8 + 0 
1b7f : a8 __ __ TAY
1b80 : b1 49 __ LDA (T1 + 0),y 
1b82 : 85 59 __ STA T9 + 0 
1b84 : c8 __ __ INY
1b85 : b1 49 __ LDA (T1 + 0),y 
1b87 : 85 5a __ STA T9 + 1 
1b89 : a5 52 __ LDA T5 + 1 
1b8b : c5 5a __ CMP T9 + 1 
1b8d : d0 09 __ BNE $1b98 ; (bm_polygon_nc_fill.s82 + 0)
.s79:
1b8f : a5 51 __ LDA T5 + 0 
1b91 : c5 59 __ CMP T9 + 0 
.s80:
1b93 : b0 09 __ BCS $1b9e ; (bm_polygon_nc_fill.s53 + 0)
1b95 : 4c 64 1e JMP $1e64 ; (bm_polygon_nc_fill.s57 + 0)
.s82:
1b98 : 45 5a __ EOR T9 + 1 
1b9a : 10 f7 __ BPL $1b93 ; (bm_polygon_nc_fill.s80 + 0)
.s81:
1b9c : b0 f7 __ BCS $1b95 ; (bm_polygon_nc_fill.s80 + 2)
.s53:
1b9e : e6 43 __ INC T4 + 0 
1ba0 : e6 62 __ INC T14 + 0 
1ba2 : a6 62 __ LDX T14 + 0 
1ba4 : e4 61 __ CPX T13 + 0 
1ba6 : b0 03 __ BCS $1bab ; (bm_polygon_nc_fill.s6 + 0)
1ba8 : 4c 08 1b JMP $1b08 ; (bm_polygon_nc_fill.l51 + 0)
.s6:
1bab : a5 5b __ LDA T10 + 0 
1bad : 05 5c __ ORA T10 + 1 
1baf : f0 69 __ BEQ $1c1a ; (bm_polygon_nc_fill.s3 + 0)
.s7:
1bb1 : a0 00 __ LDY #$00
1bb3 : 84 1c __ STY ACCU + 1 ; (clip + 1)
1bb5 : ad f0 9f LDA $9ff0 ; (sstack + 0)
1bb8 : 85 4d __ STA T2 + 0 
1bba : ad f1 9f LDA $9ff1 ; (sstack + 1)
1bbd : 85 4e __ STA T2 + 1 
1bbf : b1 5b __ LDA (T10 + 0),y 
1bc1 : 85 59 __ STA T9 + 0 
1bc3 : 29 f8 __ AND #$f8
1bc5 : aa __ __ TAX
1bc6 : a0 04 __ LDY #$04
1bc8 : b1 4d __ LDA (T2 + 0),y 
1bca : 85 4f __ STA T3 + 0 
1bcc : 85 1b __ STA ACCU + 0 ; (clip + 0)
1bce : 8a __ __ TXA
1bcf : 20 23 2c JSR $2c23 ; (mul16by8 + 0)
1bd2 : a0 00 __ LDY #$00
1bd4 : b1 4d __ LDA (T2 + 0),y 
1bd6 : 18 __ __ CLC
1bd7 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
1bd9 : 85 02 __ STA $02 
1bdb : c8 __ __ INY
1bdc : b1 4d __ LDA (T2 + 0),y 
1bde : 65 1c __ ADC ACCU + 1 ; (clip + 1)
1be0 : aa __ __ TAX
1be1 : a5 59 __ LDA T9 + 0 
1be3 : 29 07 __ AND #$07
1be5 : 18 __ __ CLC
1be6 : 65 02 __ ADC $02 
1be8 : 85 53 __ STA T6 + 0 
1bea : 90 02 __ BCC $1bee ; (bm_polygon_nc_fill.s102 + 0)
.s101:
1bec : e8 __ __ INX
1bed : 18 __ __ CLC
.s102:
1bee : 86 54 __ STX T6 + 1 
1bf0 : a5 4f __ LDA T3 + 0 
1bf2 : 69 ff __ ADC #$ff
1bf4 : 2a __ __ ROL
1bf5 : 2a __ __ ROL
1bf6 : 2a __ __ ROL
1bf7 : aa __ __ TAX
1bf8 : 29 f8 __ AND #$f8
1bfa : 85 55 __ STA T7 + 0 
1bfc : 8a __ __ TXA
1bfd : 29 07 __ AND #$07
1bff : 2a __ __ ROL
1c00 : 69 f8 __ ADC #$f8
1c02 : 85 56 __ STA T7 + 1 
1c04 : ad f8 9f LDA $9ff8 ; (sstack + 8)
1c07 : 85 57 __ STA T8 + 0 
1c09 : ad f9 9f LDA $9ff9 ; (sstack + 9)
1c0c : 85 58 __ STA T8 + 1 
1c0e : a5 5b __ LDA T10 + 0 
1c10 : 05 5c __ ORA T10 + 1 
1c12 : d0 1a __ BNE $1c2e ; (bm_polygon_nc_fill.l15 + 0)
.s8:
1c14 : a5 5d __ LDA T11 + 0 
1c16 : 05 5e __ ORA T11 + 1 
1c18 : d0 0b __ BNE $1c25 ; (bm_polygon_nc_fill.s9 + 0)
.s3:
1c1a : a2 0f __ LDX #$0f
1c1c : bd de 9f LDA $9fde,x ; (bm_polygon_nc_fill@stack + 0)
1c1f : 95 53 __ STA T6 + 0,x 
1c21 : ca __ __ DEX
1c22 : 10 f8 __ BPL $1c1c ; (bm_polygon_nc_fill.s3 + 2)
1c24 : 60 __ __ RTS
.s9:
1c25 : a5 5b __ LDA T10 + 0 
1c27 : 05 5c __ ORA T10 + 1 
1c29 : d0 03 __ BNE $1c2e ; (bm_polygon_nc_fill.l15 + 0)
1c2b : 4c e3 1c JMP $1ce3 ; (bm_polygon_nc_fill.l10 + 0)
.l15:
1c2e : a5 59 __ LDA T9 + 0 
1c30 : a0 00 __ LDY #$00
1c32 : d1 5b __ CMP (T10 + 0),y 
1c34 : d0 f5 __ BNE $1c2b ; (bm_polygon_nc_fill.s9 + 6)
.l16:
1c36 : 84 43 __ STY T4 + 0 
1c38 : 84 44 __ STY T4 + 1 
1c3a : a5 5e __ LDA T11 + 1 
1c3c : 85 50 __ STA T3 + 1 
1c3e : a0 0a __ LDY #$0a
1c40 : b1 5b __ LDA (T10 + 0),y 
1c42 : 85 51 __ STA T5 + 0 
1c44 : c8 __ __ INY
1c45 : b1 5b __ LDA (T10 + 0),y 
1c47 : 85 52 __ STA T5 + 1 
1c49 : a5 5d __ LDA T11 + 0 
1c4b : 85 4f __ STA T3 + 0 
1c4d : 05 5e __ ORA T11 + 1 
1c4f : f0 56 __ BEQ $1ca7 ; (bm_polygon_nc_fill.s17 + 0)
.s22:
1c51 : a0 02 __ LDY #$02
1c53 : b1 5b __ LDA (T10 + 0),y 
1c55 : 85 45 __ STA T0 + 0 
1c57 : c8 __ __ INY
1c58 : b1 5b __ LDA (T10 + 0),y 
1c5a : 85 46 __ STA T0 + 1 
1c5c : c8 __ __ INY
1c5d : b1 5b __ LDA (T10 + 0),y 
1c5f : 85 47 __ STA T0 + 2 
1c61 : c8 __ __ INY
1c62 : b1 5b __ LDA (T10 + 0),y 
1c64 : 85 48 __ STA T0 + 3 
1c66 : a6 02 __ LDX $02 
.l23:
1c68 : a0 02 __ LDY #$02
1c6a : b1 4f __ LDA (T3 + 0),y 
1c6c : 85 49 __ STA T1 + 0 
1c6e : c8 __ __ INY
1c6f : b1 4f __ LDA (T3 + 0),y 
1c71 : 85 4a __ STA T1 + 1 
1c73 : c8 __ __ INY
1c74 : b1 4f __ LDA (T3 + 0),y 
1c76 : 85 4b __ STA T1 + 2 
1c78 : c8 __ __ INY
1c79 : b1 4f __ LDA (T3 + 0),y 
1c7b : c5 48 __ CMP T0 + 3 
1c7d : d0 03 __ BNE $1c82 ; (bm_polygon_nc_fill.s41 + 0)
1c7f : 4c 4e 1e JMP $1e4e ; (bm_polygon_nc_fill.s36 + 0)
.s41:
1c82 : 45 48 __ EOR T0 + 3 
1c84 : 30 05 __ BMI $1c8b ; (bm_polygon_nc_fill.s40 + 0)
.s39:
1c86 : 90 05 __ BCC $1c8d ; (bm_polygon_nc_fill.s26 + 0)
1c88 : 4c 07 1e JMP $1e07 ; (bm_polygon_nc_fill.s24 + 0)
.s40:
1c8b : 90 fb __ BCC $1c88 ; (bm_polygon_nc_fill.s39 + 2)
.s26:
1c8d : a5 4f __ LDA T3 + 0 
1c8f : 85 43 __ STA T4 + 0 
1c91 : a5 50 __ LDA T3 + 1 
1c93 : 85 44 __ STA T4 + 1 
1c95 : a0 0a __ LDY #$0a
1c97 : b1 4f __ LDA (T3 + 0),y 
1c99 : aa __ __ TAX
1c9a : c8 __ __ INY
1c9b : b1 4f __ LDA (T3 + 0),y 
1c9d : 86 4f __ STX T3 + 0 
1c9f : 85 50 __ STA T3 + 1 
1ca1 : 05 4f __ ORA T3 + 0 
1ca3 : d0 c3 __ BNE $1c68 ; (bm_polygon_nc_fill.l23 + 0)
.s98:
1ca5 : 86 02 __ STX $02 
.s17:
1ca7 : a5 4f __ LDA T3 + 0 
1ca9 : a0 0a __ LDY #$0a
1cab : 91 5b __ STA (T10 + 0),y 
1cad : a5 50 __ LDA T3 + 1 
1caf : c8 __ __ INY
1cb0 : 91 5b __ STA (T10 + 0),y 
1cb2 : a5 43 __ LDA T4 + 0 
1cb4 : 05 44 __ ORA T4 + 1 
1cb6 : f0 0c __ BEQ $1cc4 ; (bm_polygon_nc_fill.s18 + 0)
.s21:
1cb8 : a5 5b __ LDA T10 + 0 
1cba : 88 __ __ DEY
1cbb : 91 43 __ STA (T4 + 0),y 
1cbd : a5 5c __ LDA T10 + 1 
1cbf : c8 __ __ INY
1cc0 : 91 43 __ STA (T4 + 0),y 
1cc2 : d0 08 __ BNE $1ccc ; (bm_polygon_nc_fill.s19 + 0)
.s18:
1cc4 : a5 5b __ LDA T10 + 0 
1cc6 : 85 5d __ STA T11 + 0 
1cc8 : a5 5c __ LDA T10 + 1 
1cca : 85 5e __ STA T11 + 1 
.s19:
1ccc : a5 51 __ LDA T5 + 0 
1cce : 85 5b __ STA T10 + 0 
1cd0 : a5 52 __ LDA T5 + 1 
1cd2 : 85 5c __ STA T10 + 1 
1cd4 : 05 51 __ ORA T5 + 0 
1cd6 : f0 0b __ BEQ $1ce3 ; (bm_polygon_nc_fill.l10 + 0)
.s20:
1cd8 : a5 59 __ LDA T9 + 0 
1cda : a0 00 __ LDY #$00
1cdc : d1 51 __ CMP (T5 + 0),y 
1cde : d0 03 __ BNE $1ce3 ; (bm_polygon_nc_fill.l10 + 0)
1ce0 : 4c 36 1c JMP $1c36 ; (bm_polygon_nc_fill.l16 + 0)
.l10:
1ce3 : a5 5d __ LDA T11 + 0 
1ce5 : 05 5e __ ORA T11 + 1 
1ce7 : f0 03 __ BEQ $1cec ; (bm_polygon_nc_fill.s11 + 0)
1ce9 : 4c 9b 1d JMP $1d9b ; (bm_polygon_nc_fill.s49 + 0)
.s11:
1cec : e6 53 __ INC T6 + 0 
1cee : d0 02 __ BNE $1cf2 ; (bm_polygon_nc_fill.s104 + 0)
.s103:
1cf0 : e6 54 __ INC T6 + 1 
.s104:
1cf2 : a5 53 __ LDA T6 + 0 
1cf4 : 29 07 __ AND #$07
1cf6 : d0 0d __ BNE $1d05 ; (bm_polygon_nc_fill.s13 + 0)
.s12:
1cf8 : 18 __ __ CLC
1cf9 : a5 53 __ LDA T6 + 0 
1cfb : 65 55 __ ADC T7 + 0 
1cfd : 85 53 __ STA T6 + 0 
1cff : a5 54 __ LDA T6 + 1 
1d01 : 65 56 __ ADC T7 + 1 
1d03 : 85 54 __ STA T6 + 1 
.s13:
1d05 : e6 59 __ INC T9 + 0 
1d07 : a5 5d __ LDA T11 + 0 
1d09 : 05 5e __ ORA T11 + 1 
1d0b : f0 67 __ BEQ $1d74 ; (bm_polygon_nc_fill.s14 + 0)
.s42:
1d0d : a5 5d __ LDA T11 + 0 
1d0f : 85 4d __ STA T2 + 0 
1d11 : a5 5e __ LDA T11 + 1 
1d13 : 85 4e __ STA T2 + 1 
1d15 : a9 00 __ LDA #$00
1d17 : 85 45 __ STA T0 + 0 
1d19 : 85 46 __ STA T0 + 1 
.l43:
1d1b : a5 59 __ LDA T9 + 0 
1d1d : a0 01 __ LDY #$01
1d1f : d1 4d __ CMP (T2 + 0),y 
1d21 : f0 34 __ BEQ $1d57 ; (bm_polygon_nc_fill.s46 + 0)
.s44:
1d23 : 18 __ __ CLC
1d24 : a0 06 __ LDY #$06
1d26 : b1 4d __ LDA (T2 + 0),y 
1d28 : a0 02 __ LDY #$02
1d2a : 71 4d __ ADC (T2 + 0),y 
1d2c : 91 4d __ STA (T2 + 0),y 
1d2e : a0 07 __ LDY #$07
1d30 : b1 4d __ LDA (T2 + 0),y 
1d32 : a0 03 __ LDY #$03
1d34 : 71 4d __ ADC (T2 + 0),y 
1d36 : 91 4d __ STA (T2 + 0),y 
1d38 : a0 08 __ LDY #$08
1d3a : b1 4d __ LDA (T2 + 0),y 
1d3c : a0 04 __ LDY #$04
1d3e : 71 4d __ ADC (T2 + 0),y 
1d40 : 91 4d __ STA (T2 + 0),y 
1d42 : a0 09 __ LDY #$09
1d44 : b1 4d __ LDA (T2 + 0),y 
1d46 : a0 05 __ LDY #$05
1d48 : 71 4d __ ADC (T2 + 0),y 
1d4a : 91 4d __ STA (T2 + 0),y 
1d4c : a5 4d __ LDA T2 + 0 
1d4e : 85 45 __ STA T0 + 0 
1d50 : a5 4e __ LDA T2 + 1 
1d52 : 85 46 __ STA T0 + 1 
1d54 : 4c 89 1d JMP $1d89 ; (bm_polygon_nc_fill.s45 + 0)
.s46:
1d57 : a5 45 __ LDA T0 + 0 
1d59 : a0 0a __ LDY #$0a
1d5b : 05 46 __ ORA T0 + 1 
1d5d : d0 21 __ BNE $1d80 ; (bm_polygon_nc_fill.s48 + 0)
.s47:
1d5f : b1 4d __ LDA (T2 + 0),y 
1d61 : aa __ __ TAX
1d62 : c8 __ __ INY
1d63 : b1 4d __ LDA (T2 + 0),y 
1d65 : 86 4d __ STX T2 + 0 
1d67 : 86 5d __ STX T11 + 0 
1d69 : 85 4e __ STA T2 + 1 
1d6b : 85 5e __ STA T11 + 1 
1d6d : 8a __ __ TXA
1d6e : 05 4e __ ORA T2 + 1 
1d70 : d0 a9 __ BNE $1d1b ; (bm_polygon_nc_fill.l43 + 0)
.s99:
1d72 : 86 02 __ STX $02 
.s14:
1d74 : a5 5b __ LDA T10 + 0 
1d76 : 05 5c __ ORA T10 + 1 
1d78 : f0 03 __ BEQ $1d7d ; (bm_polygon_nc_fill.s14 + 9)
1d7a : 4c 2e 1c JMP $1c2e ; (bm_polygon_nc_fill.l15 + 0)
1d7d : 4c 14 1c JMP $1c14 ; (bm_polygon_nc_fill.s8 + 0)
.s48:
1d80 : b1 4d __ LDA (T2 + 0),y 
1d82 : 91 45 __ STA (T0 + 0),y 
1d84 : c8 __ __ INY
1d85 : b1 4d __ LDA (T2 + 0),y 
1d87 : 91 45 __ STA (T0 + 0),y 
.s45:
1d89 : a0 0a __ LDY #$0a
1d8b : b1 4d __ LDA (T2 + 0),y 
1d8d : aa __ __ TAX
1d8e : c8 __ __ INY
1d8f : b1 4d __ LDA (T2 + 0),y 
1d91 : 86 4d __ STX T2 + 0 
1d93 : 85 4e __ STA T2 + 1 
1d95 : 05 4d __ ORA T2 + 0 
1d97 : f0 d9 __ BEQ $1d72 ; (bm_polygon_nc_fill.s99 + 0)
1d99 : d0 80 __ BNE $1d1b ; (bm_polygon_nc_fill.l43 + 0)
.s49:
1d9b : a5 59 __ LDA T9 + 0 
1d9d : 29 07 __ AND #$07
1d9f : 85 4f __ STA T3 + 0 
1da1 : a5 5d __ LDA T11 + 0 
1da3 : 85 49 __ STA T1 + 0 
1da5 : a5 5e __ LDA T11 + 1 
1da7 : 85 4a __ STA T1 + 1 
1da9 : a5 53 __ LDA T6 + 0 
1dab : 85 11 __ STA P4 
1dad : a5 54 __ LDA T6 + 1 
1daf : 85 12 __ STA P5 
.l95:
1db1 : a4 4f __ LDY T3 + 0 
1db3 : b1 57 __ LDA (T8 + 0),y 
1db5 : 85 17 __ STA P10 
1db7 : a0 00 __ LDY #$00
1db9 : b1 5f __ LDA (T12 + 0),y 
1dbb : 85 0d __ STA P0 
1dbd : c8 __ __ INY
1dbe : b1 5f __ LDA (T12 + 0),y 
1dc0 : 85 0e __ STA P1 
1dc2 : a0 04 __ LDY #$04
1dc4 : b1 5f __ LDA (T12 + 0),y 
1dc6 : 85 0f __ STA P2 
1dc8 : c8 __ __ INY
1dc9 : b1 5f __ LDA (T12 + 0),y 
1dcb : 85 10 __ STA P3 
1dcd : 88 __ __ DEY
1dce : b1 49 __ LDA (T1 + 0),y 
1dd0 : 85 13 __ STA P6 
1dd2 : c8 __ __ INY
1dd3 : b1 49 __ LDA (T1 + 0),y 
1dd5 : 85 14 __ STA P7 
1dd7 : a0 0a __ LDY #$0a
1dd9 : b1 49 __ LDA (T1 + 0),y 
1ddb : aa __ __ TAX
1ddc : c8 __ __ INY
1ddd : b1 49 __ LDA (T1 + 0),y 
1ddf : 86 49 __ STX T1 + 0 
1de1 : 85 4a __ STA T1 + 1 
1de3 : a0 04 __ LDY #$04
1de5 : b1 49 __ LDA (T1 + 0),y 
1de7 : 85 15 __ STA P8 
1de9 : c8 __ __ INY
1dea : b1 49 __ LDA (T1 + 0),y 
1dec : 85 16 __ STA P9 
1dee : 20 d8 1f JSR $1fd8 ; (bm_scan_fill.s4 + 0)
1df1 : a0 0a __ LDY #$0a
1df3 : b1 49 __ LDA (T1 + 0),y 
1df5 : 85 02 __ STA $02 
1df7 : c8 __ __ INY
1df8 : b1 49 __ LDA (T1 + 0),y 
1dfa : 85 4a __ STA T1 + 1 
1dfc : a5 02 __ LDA $02 
1dfe : 85 49 __ STA T1 + 0 
1e00 : 05 4a __ ORA T1 + 1 
1e02 : d0 ad __ BNE $1db1 ; (bm_polygon_nc_fill.l95 + 0)
1e04 : 4c ec 1c JMP $1cec ; (bm_polygon_nc_fill.s11 + 0)
.s24:
1e07 : a5 48 __ LDA T0 + 3 
1e09 : d1 4f __ CMP (T3 + 0),y 
1e0b : f0 03 __ BEQ $1e10 ; (bm_polygon_nc_fill.s33 + 0)
1e0d : 4c a5 1c JMP $1ca5 ; (bm_polygon_nc_fill.s98 + 0)
.s33:
1e10 : a5 47 __ LDA T0 + 2 
1e12 : c5 4b __ CMP T1 + 2 
1e14 : d0 f7 __ BNE $1e0d ; (bm_polygon_nc_fill.s24 + 6)
.s34:
1e16 : a5 46 __ LDA T0 + 1 
1e18 : c5 4a __ CMP T1 + 1 
1e1a : d0 f1 __ BNE $1e0d ; (bm_polygon_nc_fill.s24 + 6)
.s35:
1e1c : a5 45 __ LDA T0 + 0 
1e1e : c5 49 __ CMP T1 + 0 
1e20 : d0 eb __ BNE $1e0d ; (bm_polygon_nc_fill.s24 + 6)
.s25:
1e22 : a0 09 __ LDY #$09
1e24 : b1 4f __ LDA (T3 + 0),y 
1e26 : d1 5b __ CMP (T10 + 0),y 
1e28 : f0 0e __ BEQ $1e38 ; (bm_polygon_nc_fill.s27 + 0)
.s32:
1e2a : 51 5b __ EOR (T10 + 0),y 
1e2c : 30 05 __ BMI $1e33 ; (bm_polygon_nc_fill.s31 + 0)
.s30:
1e2e : b0 dd __ BCS $1e0d ; (bm_polygon_nc_fill.s24 + 6)
1e30 : 4c 8d 1c JMP $1c8d ; (bm_polygon_nc_fill.s26 + 0)
.s31:
1e33 : 90 d8 __ BCC $1e0d ; (bm_polygon_nc_fill.s24 + 6)
1e35 : 4c 8d 1c JMP $1c8d ; (bm_polygon_nc_fill.s26 + 0)
.s27:
1e38 : 88 __ __ DEY
1e39 : b1 4f __ LDA (T3 + 0),y 
1e3b : d1 5b __ CMP (T10 + 0),y 
1e3d : d0 ef __ BNE $1e2e ; (bm_polygon_nc_fill.s30 + 0)
.s28:
1e3f : 88 __ __ DEY
1e40 : b1 4f __ LDA (T3 + 0),y 
1e42 : d1 5b __ CMP (T10 + 0),y 
1e44 : d0 e8 __ BNE $1e2e ; (bm_polygon_nc_fill.s30 + 0)
.s29:
1e46 : 88 __ __ DEY
1e47 : b1 4f __ LDA (T3 + 0),y 
1e49 : d1 5b __ CMP (T10 + 0),y 
1e4b : 4c 2e 1e JMP $1e2e ; (bm_polygon_nc_fill.s30 + 0)
.s36:
1e4e : a5 4b __ LDA T1 + 2 
1e50 : c5 47 __ CMP T0 + 2 
1e52 : f0 03 __ BEQ $1e57 ; (bm_polygon_nc_fill.s37 + 0)
1e54 : 4c 86 1c JMP $1c86 ; (bm_polygon_nc_fill.s39 + 0)
.s37:
1e57 : a5 4a __ LDA T1 + 1 
1e59 : c5 46 __ CMP T0 + 1 
1e5b : d0 f7 __ BNE $1e54 ; (bm_polygon_nc_fill.s36 + 6)
.s38:
1e5d : a5 49 __ LDA T1 + 0 
1e5f : c5 45 __ CMP T0 + 0 
1e61 : 4c 86 1c JMP $1c86 ; (bm_polygon_nc_fill.s39 + 0)
.s57:
1e64 : ad f4 9f LDA $9ff4 ; (sstack + 4)
1e67 : 85 49 __ STA T1 + 0 
1e69 : ad f5 9f LDA $9ff5 ; (sstack + 5)
1e6c : 85 4a __ STA T1 + 1 
1e6e : a4 4d __ LDY T2 + 0 
1e70 : b1 49 __ LDA (T1 + 0),y 
1e72 : 85 47 __ STA T0 + 2 
1e74 : c8 __ __ INY
1e75 : b1 49 __ LDA (T1 + 0),y 
1e77 : 85 48 __ STA T0 + 3 
1e79 : a0 05 __ LDY #$05
1e7b : 91 4f __ STA (T3 + 0),y 
1e7d : a9 00 __ LDA #$00
1e7f : a0 02 __ LDY #$02
1e81 : 91 4f __ STA (T3 + 0),y 
1e83 : a9 80 __ LDA #$80
1e85 : 85 1c __ STA ACCU + 1 ; (clip + 1)
1e87 : c8 __ __ INY
1e88 : 91 4f __ STA (T3 + 0),y 
1e8a : a5 47 __ LDA T0 + 2 
1e8c : c8 __ __ INY
1e8d : 91 4f __ STA (T3 + 0),y 
1e8f : a4 57 __ LDY T8 + 0 
1e91 : b1 49 __ LDA (T1 + 0),y 
1e93 : 18 __ __ CLC
1e94 : e5 47 __ SBC T0 + 2 
1e96 : 85 1d __ STA ACCU + 2 ; (px + 0)
1e98 : c8 __ __ INY
1e99 : b1 49 __ LDA (T1 + 0),y 
1e9b : e5 48 __ SBC T0 + 3 
1e9d : 85 1e __ STA ACCU + 3 ; (px + 1)
1e9f : 38 __ __ SEC
1ea0 : a5 59 __ LDA T9 + 0 
1ea2 : e5 55 __ SBC T7 + 0 
1ea4 : 85 03 __ STA WORK + 0 
1ea6 : a5 5a __ LDA T9 + 1 
1ea8 : e5 56 __ SBC T7 + 1 
1eaa : 85 04 __ STA WORK + 1 
1eac : 0a __ __ ASL
1ead : a9 00 __ LDA #$00
1eaf : 85 1b __ STA ACCU + 0 ; (clip + 0)
1eb1 : 69 ff __ ADC #$ff
1eb3 : 49 ff __ EOR #$ff
1eb5 : 85 06 __ STA WORK + 3 
1eb7 : 85 05 __ STA WORK + 2 
1eb9 : 20 b3 31 JSR $31b3 ; (divs32 + 0)
1ebc : a5 1b __ LDA ACCU + 0 ; (clip + 0)
1ebe : a0 06 __ LDY #$06
1ec0 : 91 4f __ STA (T3 + 0),y 
1ec2 : aa __ __ TAX
1ec3 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
1ec5 : 85 4a __ STA T1 + 1 
1ec7 : c8 __ __ INY
1ec8 : 91 4f __ STA (T3 + 0),y 
1eca : a5 1d __ LDA ACCU + 2 ; (px + 0)
1ecc : 85 4b __ STA T1 + 2 
1ece : c8 __ __ INY
1ecf : 91 4f __ STA (T3 + 0),y 
1ed1 : a5 1e __ LDA ACCU + 3 ; (px + 1)
1ed3 : 85 4c __ STA T1 + 3 
1ed5 : c8 __ __ INY
1ed6 : 91 4f __ STA (T3 + 0),y 
1ed8 : a5 56 __ LDA T7 + 1 
1eda : c5 52 __ CMP T5 + 1 
1edc : d0 08 __ BNE $1ee6 ; (bm_polygon_nc_fill.s78 + 0)
.s75:
1ede : a5 55 __ LDA T7 + 0 
1ee0 : c5 51 __ CMP T5 + 0 
.s76:
1ee2 : b0 08 __ BCS $1eec ; (bm_polygon_nc_fill.s58 + 0)
1ee4 : 90 0d __ BCC $1ef3 ; (bm_polygon_nc_fill.s74 + 0)
.s78:
1ee6 : 45 52 __ EOR T5 + 1 
1ee8 : 10 f8 __ BPL $1ee2 ; (bm_polygon_nc_fill.s76 + 0)
.s77:
1eea : b0 07 __ BCS $1ef3 ; (bm_polygon_nc_fill.s74 + 0)
.s58:
1eec : a5 56 __ LDA T7 + 1 
1eee : a6 55 __ LDX T7 + 0 
1ef0 : 4c 3c 1f JMP $1f3c ; (bm_polygon_nc_fill.s59 + 0)
.s74:
1ef3 : 86 03 __ STX WORK + 0 
1ef5 : 38 __ __ SEC
1ef6 : a5 51 __ LDA T5 + 0 
1ef8 : e5 55 __ SBC T7 + 0 
1efa : 85 1b __ STA ACCU + 0 ; (clip + 0)
1efc : a5 52 __ LDA T5 + 1 
1efe : e5 56 __ SBC T7 + 1 
1f00 : 85 1c __ STA ACCU + 1 ; (clip + 1)
1f02 : 29 80 __ AND #$80
1f04 : 10 02 __ BPL $1f08 ; (bm_polygon_nc_fill.s74 + 21)
1f06 : a9 ff __ LDA #$ff
1f08 : 85 1d __ STA ACCU + 2 ; (px + 0)
1f0a : 85 1e __ STA ACCU + 3 ; (px + 1)
1f0c : a5 4a __ LDA T1 + 1 
1f0e : 85 04 __ STA WORK + 1 
1f10 : a5 4b __ LDA T1 + 2 
1f12 : 85 05 __ STA WORK + 2 
1f14 : a5 4c __ LDA T1 + 3 
1f16 : 85 06 __ STA WORK + 3 
1f18 : 20 4b 31 JSR $314b ; (mul32 + 0)
1f1b : 18 __ __ CLC
1f1c : a5 08 __ LDA WORK + 5 
1f1e : 69 80 __ ADC #$80
1f20 : a0 03 __ LDY #$03
1f22 : 91 4f __ STA (T3 + 0),y 
1f24 : a5 09 __ LDA WORK + 6 
1f26 : 65 47 __ ADC T0 + 2 
1f28 : c8 __ __ INY
1f29 : 91 4f __ STA (T3 + 0),y 
1f2b : a5 0a __ LDA WORK + 7 
1f2d : 65 48 __ ADC T0 + 3 
1f2f : c8 __ __ INY
1f30 : 91 4f __ STA (T3 + 0),y 
1f32 : a5 07 __ LDA WORK + 4 
1f34 : a0 02 __ LDY #$02
1f36 : 91 4f __ STA (T3 + 0),y 
1f38 : a5 52 __ LDA T5 + 1 
1f3a : a6 51 __ LDX T5 + 0 
.s59:
1f3c : 86 45 __ STX T0 + 0 
1f3e : 85 46 __ STA T0 + 1 
1f40 : a5 54 __ LDA T6 + 1 
1f42 : c5 5a __ CMP T9 + 1 
1f44 : d0 08 __ BNE $1f4e ; (bm_polygon_nc_fill.s73 + 0)
.s70:
1f46 : a5 53 __ LDA T6 + 0 
1f48 : c5 59 __ CMP T9 + 0 
.s71:
1f4a : 90 08 __ BCC $1f54 ; (bm_polygon_nc_fill.s69 + 0)
1f4c : b0 0a __ BCS $1f58 ; (bm_polygon_nc_fill.s60 + 0)
.s73:
1f4e : 45 5a __ EOR T9 + 1 
1f50 : 10 f8 __ BPL $1f4a ; (bm_polygon_nc_fill.s71 + 0)
.s72:
1f52 : 90 04 __ BCC $1f58 ; (bm_polygon_nc_fill.s60 + 0)
.s69:
1f54 : a5 53 __ LDA T6 + 0 
1f56 : 85 59 __ STA T9 + 0 
.s60:
1f58 : 8a __ __ TXA
1f59 : a0 00 __ LDY #$00
1f5b : 91 4f __ STA (T3 + 0),y 
1f5d : a5 59 __ LDA T9 + 0 
1f5f : c8 __ __ INY
1f60 : 91 4f __ STA (T3 + 0),y 
1f62 : a5 5c __ LDA T10 + 1 
1f64 : 85 4a __ STA T1 + 1 
1f66 : a9 00 __ LDA #$00
1f68 : 85 4d __ STA T2 + 0 
1f6a : 85 4e __ STA T2 + 1 
1f6c : a5 5b __ LDA T10 + 0 
1f6e : 85 49 __ STA T1 + 0 
1f70 : 05 5c __ ORA T10 + 1 
1f72 : f0 2e __ BEQ $1fa2 ; (bm_polygon_nc_fill.s61 + 0)
.s96:
1f74 : a6 02 __ LDX $02 
1f76 : a5 46 __ LDA T0 + 1 
1f78 : 30 26 __ BMI $1fa0 ; (bm_polygon_nc_fill.s97 + 0)
.l68:
1f7a : d0 08 __ BNE $1f84 ; (bm_polygon_nc_fill.s66 + 0)
.s67:
1f7c : a5 45 __ LDA T0 + 0 
1f7e : a0 00 __ LDY #$00
1f80 : d1 49 __ CMP (T1 + 0),y 
1f82 : 90 1c __ BCC $1fa0 ; (bm_polygon_nc_fill.s97 + 0)
.s66:
1f84 : a5 49 __ LDA T1 + 0 
1f86 : 85 4d __ STA T2 + 0 
1f88 : a5 4a __ LDA T1 + 1 
1f8a : 85 4e __ STA T2 + 1 
1f8c : a0 0a __ LDY #$0a
1f8e : b1 49 __ LDA (T1 + 0),y 
1f90 : aa __ __ TAX
1f91 : c8 __ __ INY
1f92 : b1 49 __ LDA (T1 + 0),y 
1f94 : 86 49 __ STX T1 + 0 
1f96 : 85 4a __ STA T1 + 1 
1f98 : 05 49 __ ORA T1 + 0 
1f9a : f0 04 __ BEQ $1fa0 ; (bm_polygon_nc_fill.s97 + 0)
.s65:
1f9c : a5 46 __ LDA T0 + 1 
1f9e : 10 da __ BPL $1f7a ; (bm_polygon_nc_fill.l68 + 0)
.s97:
1fa0 : 86 02 __ STX $02 
.s61:
1fa2 : a5 49 __ LDA T1 + 0 
1fa4 : a0 0a __ LDY #$0a
1fa6 : 91 4f __ STA (T3 + 0),y 
1fa8 : a5 4a __ LDA T1 + 1 
1faa : c8 __ __ INY
1fab : 91 4f __ STA (T3 + 0),y 
1fad : a5 4d __ LDA T2 + 0 
1faf : 05 4e __ ORA T2 + 1 
1fb1 : f0 0c __ BEQ $1fbf ; (bm_polygon_nc_fill.s62 + 0)
.s64:
1fb3 : a5 4f __ LDA T3 + 0 
1fb5 : 88 __ __ DEY
1fb6 : 91 4d __ STA (T2 + 0),y 
1fb8 : a5 50 __ LDA T3 + 1 
1fba : c8 __ __ INY
1fbb : 91 4d __ STA (T2 + 0),y 
1fbd : d0 08 __ BNE $1fc7 ; (bm_polygon_nc_fill.s63 + 0)
.s62:
1fbf : a5 4f __ LDA T3 + 0 
1fc1 : 85 5b __ STA T10 + 0 
1fc3 : a5 50 __ LDA T3 + 1 
1fc5 : 85 5c __ STA T10 + 1 
.s63:
1fc7 : 18 __ __ CLC
1fc8 : a5 4f __ LDA T3 + 0 
1fca : 69 0c __ ADC #$0c
1fcc : 85 4f __ STA T3 + 0 
1fce : b0 03 __ BCS $1fd3 ; (bm_polygon_nc_fill.s100 + 0)
1fd0 : 4c 9e 1b JMP $1b9e ; (bm_polygon_nc_fill.s53 + 0)
.s100:
1fd3 : e6 50 __ INC T3 + 1 
1fd5 : 4c 9e 1b JMP $1b9e ; (bm_polygon_nc_fill.s53 + 0)
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1fd8 : a5 14 __ LDA P7 ; (x0 + 1)
1fda : 30 0a __ BMI $1fe6 ; (bm_scan_fill.s24 + 0)
.s27:
1fdc : c5 0e __ CMP P1 ; (left + 1)
1fde : d0 04 __ BNE $1fe4 ; (bm_scan_fill.s26 + 0)
.s25:
1fe0 : a5 13 __ LDA P6 ; (x0 + 0)
1fe2 : c5 0d __ CMP P0 ; (left + 0)
.s26:
1fe4 : b0 08 __ BCS $1fee ; (bm_scan_fill.s5 + 0)
.s24:
1fe6 : a5 0d __ LDA P0 ; (left + 0)
1fe8 : 85 13 __ STA P6 ; (x0 + 0)
1fea : a5 0e __ LDA P1 ; (left + 1)
1fec : 85 14 __ STA P7 ; (x0 + 1)
.s5:
1fee : 24 16 __ BIT P9 ; (x1 + 1)
1ff0 : 30 64 __ BMI $2056 ; (bm_scan_fill.s3 + 0)
.s23:
1ff2 : a5 10 __ LDA P3 ; (right + 1)
1ff4 : c5 16 __ CMP P9 ; (x1 + 1)
1ff6 : f0 03 __ BEQ $1ffb ; (bm_scan_fill.s21 + 0)
1ff8 : 4c 72 21 JMP $2172 ; (bm_scan_fill.s22 + 0)
.s21:
1ffb : a5 0f __ LDA P2 ; (right + 0)
1ffd : c5 15 __ CMP P8 ; (x1 + 0)
1fff : b0 03 __ BCS $2004 ; (bm_scan_fill.s17 + 0)
2001 : 4c 5c 21 JMP $215c ; (bm_scan_fill.s18 + 0)
.s17:
2004 : a5 14 __ LDA P7 ; (x0 + 1)
2006 : c5 16 __ CMP P9 ; (x1 + 1)
2008 : d0 04 __ BNE $200e ; (bm_scan_fill.s20 + 0)
.s16:
200a : a5 13 __ LDA P6 ; (x0 + 0)
200c : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
200e : b0 46 __ BCS $2056 ; (bm_scan_fill.s3 + 0)
.s6:
2010 : a5 13 __ LDA P6 ; (x0 + 0)
2012 : 29 f8 __ AND #$f8
2014 : 85 1b __ STA ACCU + 0 
2016 : 65 11 __ ADC P4 ; (lp + 0)
2018 : 85 43 __ STA T1 + 0 
201a : a5 12 __ LDA P5 ; (lp + 1)
201c : 65 14 __ ADC P7 ; (x0 + 1)
201e : 85 44 __ STA T1 + 1 
2020 : a5 15 __ LDA P8 ; (x1 + 0)
2022 : 29 07 __ AND #$07
2024 : aa __ __ TAX
2025 : a5 13 __ LDA P6 ; (x0 + 0)
2027 : 29 07 __ AND #$07
2029 : bc e5 32 LDY $32e5,x ; (rmask[0] + 0)
202c : aa __ __ TAX
202d : a5 15 __ LDA P8 ; (x1 + 0)
202f : 29 f8 __ AND #$f8
2031 : 38 __ __ SEC
2032 : e5 1b __ SBC ACCU + 0 
2034 : 85 1b __ STA ACCU + 0 
2036 : a5 16 __ LDA P9 ; (x1 + 1)
2038 : e5 14 __ SBC P7 ; (x0 + 1)
203a : 85 1c __ STA ACCU + 1 
203c : 05 1b __ ORA ACCU + 0 
203e : d0 17 __ BNE $2057 ; (bm_scan_fill.s7 + 0)
.s15:
2040 : 98 __ __ TYA
2041 : 3d dd 32 AND $32dd,x ; (lmask[0] + 0)
2044 : 85 1e __ STA ACCU + 3 
2046 : a0 00 __ LDY #$00
.s11:
2048 : 49 ff __ EOR #$ff
204a : 31 43 __ AND (T1 + 0),y 
204c : 85 1b __ STA ACCU + 0 
204e : a5 17 __ LDA P10 ; (pat + 0)
2050 : 25 1e __ AND ACCU + 3 
2052 : 05 1b __ ORA ACCU + 0 
2054 : 91 43 __ STA (T1 + 0),y 
.s3:
2056 : 60 __ __ RTS
.s7:
2057 : 84 1e __ STY ACCU + 3 
2059 : bd dd 32 LDA $32dd,x ; (lmask[0] + 0)
205c : 49 ff __ EOR #$ff
205e : a0 00 __ LDY #$00
2060 : 31 43 __ AND (T1 + 0),y 
2062 : 85 1d __ STA ACCU + 2 
2064 : a5 17 __ LDA P10 ; (pat + 0)
2066 : 3d dd 32 AND $32dd,x ; (lmask[0] + 0)
2069 : 05 1d __ ORA ACCU + 2 
206b : 91 43 __ STA (T1 + 0),y 
206d : a5 1c __ LDA ACCU + 1 
206f : d0 03 __ BNE $2074 ; (bm_scan_fill.s14 + 0)
2071 : 4c ff 20 JMP $20ff ; (bm_scan_fill.s8 + 0)
.s14:
2074 : a5 17 __ LDA P10 ; (pat + 0)
2076 : a0 08 __ LDY #$08
2078 : 91 43 __ STA (T1 + 0),y 
207a : a0 10 __ LDY #$10
207c : 91 43 __ STA (T1 + 0),y 
207e : a0 18 __ LDY #$18
2080 : 91 43 __ STA (T1 + 0),y 
2082 : a0 20 __ LDY #$20
2084 : 91 43 __ STA (T1 + 0),y 
2086 : a0 28 __ LDY #$28
2088 : 91 43 __ STA (T1 + 0),y 
208a : a0 30 __ LDY #$30
208c : 91 43 __ STA (T1 + 0),y 
208e : a0 38 __ LDY #$38
2090 : 91 43 __ STA (T1 + 0),y 
2092 : a0 40 __ LDY #$40
2094 : 91 43 __ STA (T1 + 0),y 
2096 : a0 48 __ LDY #$48
2098 : 91 43 __ STA (T1 + 0),y 
209a : a0 50 __ LDY #$50
209c : 91 43 __ STA (T1 + 0),y 
209e : a0 58 __ LDY #$58
20a0 : 91 43 __ STA (T1 + 0),y 
20a2 : a0 60 __ LDY #$60
20a4 : 91 43 __ STA (T1 + 0),y 
20a6 : a0 68 __ LDY #$68
20a8 : 91 43 __ STA (T1 + 0),y 
20aa : a0 70 __ LDY #$70
20ac : 91 43 __ STA (T1 + 0),y 
20ae : a0 78 __ LDY #$78
20b0 : 91 43 __ STA (T1 + 0),y 
20b2 : a0 80 __ LDY #$80
20b4 : 91 43 __ STA (T1 + 0),y 
20b6 : a0 88 __ LDY #$88
20b8 : 91 43 __ STA (T1 + 0),y 
20ba : a0 90 __ LDY #$90
20bc : 91 43 __ STA (T1 + 0),y 
20be : a0 98 __ LDY #$98
20c0 : 91 43 __ STA (T1 + 0),y 
20c2 : a0 a0 __ LDY #$a0
20c4 : 91 43 __ STA (T1 + 0),y 
20c6 : a0 a8 __ LDY #$a8
20c8 : 91 43 __ STA (T1 + 0),y 
20ca : a0 b0 __ LDY #$b0
20cc : 91 43 __ STA (T1 + 0),y 
20ce : a0 b8 __ LDY #$b8
20d0 : 91 43 __ STA (T1 + 0),y 
20d2 : a0 c0 __ LDY #$c0
20d4 : 91 43 __ STA (T1 + 0),y 
20d6 : a0 c8 __ LDY #$c8
20d8 : 91 43 __ STA (T1 + 0),y 
20da : a0 d0 __ LDY #$d0
20dc : 91 43 __ STA (T1 + 0),y 
20de : a0 d8 __ LDY #$d8
20e0 : 91 43 __ STA (T1 + 0),y 
20e2 : a0 e0 __ LDY #$e0
20e4 : 91 43 __ STA (T1 + 0),y 
20e6 : a0 e8 __ LDY #$e8
20e8 : 91 43 __ STA (T1 + 0),y 
20ea : a0 f0 __ LDY #$f0
20ec : 91 43 __ STA (T1 + 0),y 
20ee : a0 f8 __ LDY #$f8
20f0 : 91 43 __ STA (T1 + 0),y 
20f2 : 38 __ __ SEC
20f3 : a5 1b __ LDA ACCU + 0 
20f5 : e9 f8 __ SBC #$f8
20f7 : 85 1b __ STA ACCU + 0 
20f9 : e6 44 __ INC T1 + 1 
20fb : a9 00 __ LDA #$00
20fd : f0 48 __ BEQ $2147 ; (bm_scan_fill.s28 + 0)
.s8:
20ff : 24 1b __ BIT ACCU + 0 
2101 : 30 04 __ BMI $2107 ; (bm_scan_fill.s13 + 0)
.s9:
2103 : a9 08 __ LDA #$08
2105 : d0 40 __ BNE $2147 ; (bm_scan_fill.s28 + 0)
.s13:
2107 : a5 17 __ LDA P10 ; (pat + 0)
2109 : a0 08 __ LDY #$08
210b : 91 43 __ STA (T1 + 0),y 
210d : a0 10 __ LDY #$10
210f : 91 43 __ STA (T1 + 0),y 
2111 : a0 18 __ LDY #$18
2113 : 91 43 __ STA (T1 + 0),y 
2115 : a0 20 __ LDY #$20
2117 : 91 43 __ STA (T1 + 0),y 
2119 : a0 28 __ LDY #$28
211b : 91 43 __ STA (T1 + 0),y 
211d : a0 30 __ LDY #$30
211f : 91 43 __ STA (T1 + 0),y 
2121 : a0 38 __ LDY #$38
2123 : 91 43 __ STA (T1 + 0),y 
2125 : a0 40 __ LDY #$40
2127 : 91 43 __ STA (T1 + 0),y 
2129 : a0 48 __ LDY #$48
212b : 91 43 __ STA (T1 + 0),y 
212d : a0 50 __ LDY #$50
212f : 91 43 __ STA (T1 + 0),y 
2131 : a0 58 __ LDY #$58
2133 : 91 43 __ STA (T1 + 0),y 
2135 : a0 60 __ LDY #$60
2137 : 91 43 __ STA (T1 + 0),y 
2139 : a0 68 __ LDY #$68
213b : 91 43 __ STA (T1 + 0),y 
213d : a0 70 __ LDY #$70
213f : 91 43 __ STA (T1 + 0),y 
2141 : a0 78 __ LDY #$78
2143 : 91 43 __ STA (T1 + 0),y 
2145 : a9 80 __ LDA #$80
.s28:
2147 : a6 17 __ LDX P10 ; (pat + 0)
2149 : 4c 52 21 JMP $2152 ; (bm_scan_fill.l10 + 0)
.s12:
214c : 8a __ __ TXA
214d : 91 43 __ STA (T1 + 0),y 
214f : 98 __ __ TYA
2150 : 69 08 __ ADC #$08
.l10:
2152 : a8 __ __ TAY
2153 : c4 1b __ CPY ACCU + 0 
2155 : 90 f5 __ BCC $214c ; (bm_scan_fill.s12 + 0)
.s29:
2157 : a5 1e __ LDA ACCU + 3 
2159 : 4c 48 20 JMP $2048 ; (bm_scan_fill.s11 + 0)
.s18:
215c : 85 15 __ STA P8 ; (x1 + 0)
215e : a5 10 __ LDA P3 ; (right + 1)
2160 : 85 16 __ STA P9 ; (x1 + 1)
2162 : a5 14 __ LDA P7 ; (x0 + 1)
2164 : c5 10 __ CMP P3 ; (right + 1)
2166 : f0 03 __ BEQ $216b ; (bm_scan_fill.s19 + 0)
2168 : 4c 0e 20 JMP $200e ; (bm_scan_fill.s20 + 0)
.s19:
216b : a5 13 __ LDA P6 ; (x0 + 0)
216d : c5 0f __ CMP P2 ; (right + 0)
216f : 4c 0e 20 JMP $200e ; (bm_scan_fill.s20 + 0)
.s22:
2172 : 90 03 __ BCC $2177 ; (bm_scan_fill.s30 + 0)
2174 : 4c 04 20 JMP $2004 ; (bm_scan_fill.s17 + 0)
.s30:
2177 : a5 0f __ LDA P2 ; (right + 0)
2179 : 90 e1 __ BCC $215c ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
217b : a2 0d __ LDX #$0d
217d : b5 53 __ LDA T2 + 0,x 
217f : 9d e2 9f STA $9fe2,x ; (bm_line@stack + 0)
2182 : ca __ __ DEX
2183 : 10 f8 __ BPL $217d ; (bm_line.s1 + 2)
.s4:
2185 : ad f6 9f LDA $9ff6 ; (sstack + 6)
2188 : 85 55 __ STA T3 + 0 
218a : ad f7 9f LDA $9ff7 ; (sstack + 7)
218d : 85 56 __ STA T3 + 1 
218f : ad fa 9f LDA $9ffa ; (sstack + 10)
2192 : 85 53 __ STA T2 + 0 
2194 : 38 __ __ SEC
2195 : e5 55 __ SBC T3 + 0 
2197 : 85 57 __ STA T4 + 0 
2199 : ad fb 9f LDA $9ffb ; (sstack + 11)
219c : 85 54 __ STA T2 + 1 
219e : e5 56 __ SBC T3 + 1 
21a0 : 85 58 __ STA T4 + 1 
21a2 : ad f2 9f LDA $9ff2 ; (sstack + 2)
21a5 : 85 59 __ STA T5 + 0 
21a7 : ad f3 9f LDA $9ff3 ; (sstack + 3)
21aa : 85 5a __ STA T5 + 1 
21ac : a0 00 __ LDY #$00
21ae : b1 59 __ LDA (T5 + 0),y 
21b0 : 85 43 __ STA T0 + 0 
21b2 : c8 __ __ INY
21b3 : b1 59 __ LDA (T5 + 0),y 
21b5 : 85 44 __ STA T0 + 1 
21b7 : a0 04 __ LDY #$04
21b9 : b1 59 __ LDA (T5 + 0),y 
21bb : 85 45 __ STA T1 + 0 
21bd : ad f4 9f LDA $9ff4 ; (sstack + 4)
21c0 : 85 5d __ STA T7 + 0 
21c2 : ad f5 9f LDA $9ff5 ; (sstack + 5)
21c5 : 85 5e __ STA T7 + 1 
21c7 : ad f8 9f LDA $9ff8 ; (sstack + 8)
21ca : 85 5b __ STA T6 + 0 
21cc : 38 __ __ SEC
21cd : e5 5d __ SBC T7 + 0 
21cf : 85 5f __ STA T8 + 0 
21d1 : ad f9 9f LDA $9ff9 ; (sstack + 9)
21d4 : 85 5c __ STA T6 + 1 
21d6 : c8 __ __ INY
21d7 : e5 5e __ SBC T7 + 1 
21d9 : 85 60 __ STA T8 + 1 
21db : 30 07 __ BMI $21e4 ; (bm_line.s5 + 0)
.s82:
21dd : 05 5f __ ORA T8 + 0 
21df : f0 03 __ BEQ $21e4 ; (bm_line.s5 + 0)
21e1 : 4c 14 25 JMP $2514 ; (bm_line.s64 + 0)
.s5:
21e4 : a5 5e __ LDA T7 + 1 
21e6 : 10 03 __ BPL $21eb ; (bm_line.s63 + 0)
21e8 : 4c 60 23 JMP $2360 ; (bm_line.s3 + 0)
.s63:
21eb : c5 44 __ CMP T0 + 1 
21ed : d0 04 __ BNE $21f3 ; (bm_line.s62 + 0)
.s61:
21ef : a5 5d __ LDA T7 + 0 
21f1 : c5 43 __ CMP T0 + 0 
.s62:
21f3 : 90 f3 __ BCC $21e8 ; (bm_line.s5 + 4)
.s6:
21f5 : a5 5c __ LDA T6 + 1 
21f7 : 10 03 __ BPL $21fc ; (bm_line.s60 + 0)
21f9 : 4c bd 24 JMP $24bd ; (bm_line.s52 + 0)
.s60:
21fc : d1 59 __ CMP (T5 + 0),y 
21fe : d0 04 __ BNE $2204 ; (bm_line.s59 + 0)
.s58:
2200 : a5 5b __ LDA T6 + 0 
2202 : c5 45 __ CMP T1 + 0 
.s59:
2204 : b0 e2 __ BCS $21e8 ; (bm_line.s5 + 4)
.s7:
2206 : a5 5c __ LDA T6 + 1 
2208 : c5 44 __ CMP T0 + 1 
220a : d0 04 __ BNE $2210 ; (bm_line.s57 + 0)
.s56:
220c : a5 5b __ LDA T6 + 0 
220e : c5 43 __ CMP T0 + 0 
.s57:
2210 : 90 e7 __ BCC $21f9 ; (bm_line.s6 + 4)
.s8:
2212 : a5 5e __ LDA T7 + 1 
2214 : d1 59 __ CMP (T5 + 0),y 
2216 : d0 04 __ BNE $221c ; (bm_line.s54 + 0)
.s51:
2218 : a5 5d __ LDA T7 + 0 
221a : c5 45 __ CMP T1 + 0 
.s54:
221c : 90 4e __ BCC $226c ; (bm_line.s9 + 0)
.s50:
221e : a5 57 __ LDA T4 + 0 
2220 : 85 0f __ STA P2 
2222 : a5 58 __ LDA T4 + 1 
2224 : 85 10 __ STA P3 
2226 : a5 5f __ LDA T8 + 0 
2228 : 85 11 __ STA P4 
222a : a5 60 __ LDA T8 + 1 
222c : 85 12 __ STA P5 
222e : 18 __ __ CLC
222f : a5 5d __ LDA T7 + 0 
2231 : 69 01 __ ADC #$01
2233 : a8 __ __ TAY
2234 : a5 5e __ LDA T7 + 1 
2236 : 69 00 __ ADC #$00
2238 : aa __ __ TAX
2239 : 98 __ __ TYA
223a : 38 __ __ SEC
223b : a0 04 __ LDY #$04
223d : f1 59 __ SBC (T5 + 0),y 
223f : 85 0d __ STA P0 
2241 : 8a __ __ TXA
2242 : c8 __ __ INY
2243 : f1 59 __ SBC (T5 + 0),y 
2245 : 85 0e __ STA P1 
2247 : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
224a : 38 __ __ SEC
224b : a5 55 __ LDA T3 + 0 
224d : e5 1b __ SBC ACCU + 0 ; (clip + 0)
224f : 8d f6 9f STA $9ff6 ; (sstack + 6)
2252 : a5 56 __ LDA T3 + 1 
2254 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
2256 : 8d f7 9f STA $9ff7 ; (sstack + 7)
2259 : a0 04 __ LDY #$04
225b : b1 59 __ LDA (T5 + 0),y 
225d : 38 __ __ SEC
225e : e9 01 __ SBC #$01
2260 : aa __ __ TAX
2261 : c8 __ __ INY
2262 : b1 59 __ LDA (T5 + 0),y 
2264 : 8e f4 9f STX $9ff4 ; (sstack + 4)
2267 : e9 00 __ SBC #$00
2269 : 8d f5 9f STA $9ff5 ; (sstack + 5)
.s9:
226c : a0 02 __ LDY #$02
226e : b1 59 __ LDA (T5 + 0),y 
2270 : 85 43 __ STA T0 + 0 
2272 : c8 __ __ INY
2273 : b1 59 __ LDA (T5 + 0),y 
2275 : 85 44 __ STA T0 + 1 
2277 : a0 06 __ LDY #$06
2279 : b1 59 __ LDA (T5 + 0),y 
227b : 85 45 __ STA T1 + 0 
227d : c8 __ __ INY
227e : a5 58 __ LDA T4 + 1 
2280 : 30 07 __ BMI $2289 ; (bm_line.s10 + 0)
.s49:
2282 : 05 57 __ ORA T4 + 0 
2284 : f0 03 __ BEQ $2289 ; (bm_line.s10 + 0)
2286 : 4c c5 23 JMP $23c5 ; (bm_line.s30 + 0)
.s10:
2289 : ad f6 9f LDA $9ff6 ; (sstack + 6)
228c : 85 55 __ STA T3 + 0 
228e : ad f7 9f LDA $9ff7 ; (sstack + 7)
2291 : 10 03 __ BPL $2296 ; (bm_line.s29 + 0)
2293 : 4c 60 23 JMP $2360 ; (bm_line.s3 + 0)
.s29:
2296 : 85 56 __ STA T3 + 1 
2298 : c5 44 __ CMP T0 + 1 
229a : d0 04 __ BNE $22a0 ; (bm_line.s28 + 0)
.s27:
229c : a5 55 __ LDA T3 + 0 
229e : c5 43 __ CMP T0 + 0 
.s28:
22a0 : 90 f1 __ BCC $2293 ; (bm_line.s10 + 10)
.s11:
22a2 : ad fb 9f LDA $9ffb ; (sstack + 11)
22a5 : 10 03 __ BPL $22aa ; (bm_line.s26 + 0)
22a7 : 4c 6b 23 JMP $236b ; (bm_line.s17 + 0)
.s26:
22aa : d1 59 __ CMP (T5 + 0),y 
22ac : d0 05 __ BNE $22b3 ; (bm_line.s25 + 0)
.s24:
22ae : ad fa 9f LDA $9ffa ; (sstack + 10)
22b1 : c5 45 __ CMP T1 + 0 
.s25:
22b3 : b0 de __ BCS $2293 ; (bm_line.s10 + 10)
.s12:
22b5 : ad fb 9f LDA $9ffb ; (sstack + 11)
22b8 : 30 ed __ BMI $22a7 ; (bm_line.s11 + 5)
.s23:
22ba : c5 44 __ CMP T0 + 1 
22bc : d0 05 __ BNE $22c3 ; (bm_line.s22 + 0)
.s21:
22be : ad fa 9f LDA $9ffa ; (sstack + 10)
22c1 : c5 43 __ CMP T0 + 0 
.s22:
22c3 : 90 e2 __ BCC $22a7 ; (bm_line.s11 + 5)
.s13:
22c5 : a5 56 __ LDA T3 + 1 
22c7 : d1 59 __ CMP (T5 + 0),y 
22c9 : d0 04 __ BNE $22cf ; (bm_line.s19 + 0)
.s16:
22cb : a5 55 __ LDA T3 + 0 
22cd : c5 45 __ CMP T1 + 0 
.s19:
22cf : 90 50 __ BCC $2321 ; (bm_line.s14 + 0)
.s15:
22d1 : a5 5f __ LDA T8 + 0 
22d3 : 85 0f __ STA P2 
22d5 : a5 60 __ LDA T8 + 1 
22d7 : 85 10 __ STA P3 
22d9 : a5 57 __ LDA T4 + 0 
22db : 85 11 __ STA P4 
22dd : a5 58 __ LDA T4 + 1 
22df : 85 12 __ STA P5 
22e1 : 18 __ __ CLC
22e2 : a5 55 __ LDA T3 + 0 
22e4 : 69 01 __ ADC #$01
22e6 : a8 __ __ TAY
22e7 : a5 56 __ LDA T3 + 1 
22e9 : 69 00 __ ADC #$00
22eb : aa __ __ TAX
22ec : 98 __ __ TYA
22ed : 38 __ __ SEC
22ee : a0 06 __ LDY #$06
22f0 : f1 59 __ SBC (T5 + 0),y 
22f2 : 85 0d __ STA P0 
22f4 : 8a __ __ TXA
22f5 : c8 __ __ INY
22f6 : f1 59 __ SBC (T5 + 0),y 
22f8 : 85 0e __ STA P1 
22fa : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
22fd : ad f4 9f LDA $9ff4 ; (sstack + 4)
2300 : 38 __ __ SEC
2301 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
2303 : 8d f4 9f STA $9ff4 ; (sstack + 4)
2306 : ad f5 9f LDA $9ff5 ; (sstack + 5)
2309 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
230b : 8d f5 9f STA $9ff5 ; (sstack + 5)
230e : a0 06 __ LDY #$06
2310 : b1 59 __ LDA (T5 + 0),y 
2312 : 38 __ __ SEC
2313 : e9 01 __ SBC #$01
2315 : aa __ __ TAX
2316 : c8 __ __ INY
2317 : b1 59 __ LDA (T5 + 0),y 
2319 : 8e f6 9f STX $9ff6 ; (sstack + 6)
231c : e9 00 __ SBC #$00
231e : 8d f7 9f STA $9ff7 ; (sstack + 7)
.s14:
2321 : ad f0 9f LDA $9ff0 ; (sstack + 0)
2324 : 85 0d __ STA P0 
2326 : ad f1 9f LDA $9ff1 ; (sstack + 1)
2329 : 85 0e __ STA P1 
232b : ad f4 9f LDA $9ff4 ; (sstack + 4)
232e : 85 0f __ STA P2 
2330 : ad f5 9f LDA $9ff5 ; (sstack + 5)
2333 : 85 10 __ STA P3 
2335 : ad f6 9f LDA $9ff6 ; (sstack + 6)
2338 : 85 11 __ STA P4 
233a : ad f7 9f LDA $9ff7 ; (sstack + 7)
233d : 85 12 __ STA P5 
233f : ad f8 9f LDA $9ff8 ; (sstack + 8)
2342 : 85 13 __ STA P6 
2344 : ad f9 9f LDA $9ff9 ; (sstack + 9)
2347 : 85 14 __ STA P7 
2349 : ad fa 9f LDA $9ffa ; (sstack + 10)
234c : 85 15 __ STA P8 
234e : ad fb 9f LDA $9ffb ; (sstack + 11)
2351 : 85 16 __ STA P9 
2353 : ad fc 9f LDA $9ffc ; (sstack + 12)
2356 : 85 17 __ STA P10 
2358 : ad fd 9f LDA $9ffd ; (sstack + 13)
235b : 85 18 __ STA P11 
235d : 20 b5 26 JSR $26b5 ; (bmu_line.s4 + 0)
.s3:
2360 : a2 0d __ LDX #$0d
2362 : bd e2 9f LDA $9fe2,x ; (bm_line@stack + 0)
2365 : 95 53 __ STA T2 + 0,x 
2367 : ca __ __ DEX
2368 : 10 f8 __ BPL $2362 ; (bm_line.s3 + 2)
236a : 60 __ __ RTS
.s17:
236b : a5 5f __ LDA T8 + 0 
236d : 85 0f __ STA P2 
236f : a5 60 __ LDA T8 + 1 
2371 : 85 10 __ STA P3 
2373 : a5 57 __ LDA T4 + 0 
2375 : 85 11 __ STA P4 
2377 : a5 58 __ LDA T4 + 1 
2379 : 85 12 __ STA P5 
237b : 38 __ __ SEC
237c : a5 43 __ LDA T0 + 0 
237e : ed fa 9f SBC $9ffa ; (sstack + 10)
2381 : 85 0d __ STA P0 
2383 : a5 44 __ LDA T0 + 1 
2385 : ed fb 9f SBC $9ffb ; (sstack + 11)
2388 : 85 0e __ STA P1 
238a : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
238d : a0 02 __ LDY #$02
238f : b1 59 __ LDA (T5 + 0),y 
2391 : 8d fa 9f STA $9ffa ; (sstack + 10)
2394 : c8 __ __ INY
2395 : b1 59 __ LDA (T5 + 0),y 
2397 : 8d fb 9f STA $9ffb ; (sstack + 11)
239a : ad f8 9f LDA $9ff8 ; (sstack + 8)
239d : 18 __ __ CLC
239e : 65 1b __ ADC ACCU + 0 ; (clip + 0)
23a0 : 8d f8 9f STA $9ff8 ; (sstack + 8)
23a3 : ad f9 9f LDA $9ff9 ; (sstack + 9)
23a6 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
23a8 : 8d f9 9f STA $9ff9 ; (sstack + 9)
23ab : a0 07 __ LDY #$07
23ad : b1 59 __ LDA (T5 + 0),y 
23af : 10 03 __ BPL $23b4 ; (bm_line.s20 + 0)
23b1 : 4c d1 22 JMP $22d1 ; (bm_line.s15 + 0)
.s20:
23b4 : a5 56 __ LDA T3 + 1 
23b6 : d1 59 __ CMP (T5 + 0),y 
23b8 : f0 03 __ BEQ $23bd ; (bm_line.s18 + 0)
23ba : 4c cf 22 JMP $22cf ; (bm_line.s19 + 0)
.s18:
23bd : a5 55 __ LDA T3 + 0 
23bf : 88 __ __ DEY
23c0 : d1 59 __ CMP (T5 + 0),y 
23c2 : 4c cf 22 JMP $22cf ; (bm_line.s19 + 0)
.s30:
23c5 : ad fa 9f LDA $9ffa ; (sstack + 10)
23c8 : 85 55 __ STA T3 + 0 
23ca : ad fb 9f LDA $9ffb ; (sstack + 11)
23cd : 30 91 __ BMI $2360 ; (bm_line.s3 + 0)
.s48:
23cf : 85 56 __ STA T3 + 1 
23d1 : c5 44 __ CMP T0 + 1 
23d3 : d0 04 __ BNE $23d9 ; (bm_line.s47 + 0)
.s46:
23d5 : a5 55 __ LDA T3 + 0 
23d7 : c5 43 __ CMP T0 + 0 
.s47:
23d9 : 90 85 __ BCC $2360 ; (bm_line.s3 + 0)
.s31:
23db : ad f7 9f LDA $9ff7 ; (sstack + 7)
23de : 10 03 __ BPL $23e3 ; (bm_line.s45 + 0)
23e0 : 4c 63 24 JMP $2463 ; (bm_line.s36 + 0)
.s45:
23e3 : d1 59 __ CMP (T5 + 0),y 
23e5 : d0 05 __ BNE $23ec ; (bm_line.s44 + 0)
.s43:
23e7 : ad f6 9f LDA $9ff6 ; (sstack + 6)
23ea : c5 45 __ CMP T1 + 0 
.s44:
23ec : 90 03 __ BCC $23f1 ; (bm_line.s32 + 0)
23ee : 4c 60 23 JMP $2360 ; (bm_line.s3 + 0)
.s32:
23f1 : ad f7 9f LDA $9ff7 ; (sstack + 7)
23f4 : 30 6d __ BMI $2463 ; (bm_line.s36 + 0)
.s42:
23f6 : c5 44 __ CMP T0 + 1 
23f8 : d0 05 __ BNE $23ff ; (bm_line.s41 + 0)
.s40:
23fa : ad f6 9f LDA $9ff6 ; (sstack + 6)
23fd : c5 43 __ CMP T0 + 0 
.s41:
23ff : 90 62 __ BCC $2463 ; (bm_line.s36 + 0)
.s33:
2401 : a5 56 __ LDA T3 + 1 
2403 : d1 59 __ CMP (T5 + 0),y 
2405 : d0 04 __ BNE $240b ; (bm_line.s38 + 0)
.s35:
2407 : a5 55 __ LDA T3 + 0 
2409 : c5 45 __ CMP T1 + 0 
.s38:
240b : b0 03 __ BCS $2410 ; (bm_line.s34 + 0)
240d : 4c 21 23 JMP $2321 ; (bm_line.s14 + 0)
.s34:
2410 : a5 5f __ LDA T8 + 0 
2412 : 85 0f __ STA P2 
2414 : a5 60 __ LDA T8 + 1 
2416 : 85 10 __ STA P3 
2418 : a5 57 __ LDA T4 + 0 
241a : 85 11 __ STA P4 
241c : a5 58 __ LDA T4 + 1 
241e : 85 12 __ STA P5 
2420 : 18 __ __ CLC
2421 : a5 55 __ LDA T3 + 0 
2423 : 69 01 __ ADC #$01
2425 : a8 __ __ TAY
2426 : a5 56 __ LDA T3 + 1 
2428 : 69 00 __ ADC #$00
242a : aa __ __ TAX
242b : 98 __ __ TYA
242c : 38 __ __ SEC
242d : a0 06 __ LDY #$06
242f : f1 59 __ SBC (T5 + 0),y 
2431 : 85 0d __ STA P0 
2433 : 8a __ __ TXA
2434 : c8 __ __ INY
2435 : f1 59 __ SBC (T5 + 0),y 
2437 : 85 0e __ STA P1 
2439 : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
243c : ad f8 9f LDA $9ff8 ; (sstack + 8)
243f : 38 __ __ SEC
2440 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
2442 : 8d f8 9f STA $9ff8 ; (sstack + 8)
2445 : ad f9 9f LDA $9ff9 ; (sstack + 9)
2448 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
244a : 8d f9 9f STA $9ff9 ; (sstack + 9)
244d : a0 06 __ LDY #$06
244f : b1 59 __ LDA (T5 + 0),y 
2451 : 38 __ __ SEC
2452 : e9 01 __ SBC #$01
2454 : aa __ __ TAX
2455 : c8 __ __ INY
2456 : b1 59 __ LDA (T5 + 0),y 
2458 : 8e fa 9f STX $9ffa ; (sstack + 10)
245b : e9 00 __ SBC #$00
245d : 8d fb 9f STA $9ffb ; (sstack + 11)
2460 : 4c 21 23 JMP $2321 ; (bm_line.s14 + 0)
.s36:
2463 : a5 5f __ LDA T8 + 0 
2465 : 85 0f __ STA P2 
2467 : a5 60 __ LDA T8 + 1 
2469 : 85 10 __ STA P3 
246b : a5 57 __ LDA T4 + 0 
246d : 85 11 __ STA P4 
246f : a5 58 __ LDA T4 + 1 
2471 : 85 12 __ STA P5 
2473 : 38 __ __ SEC
2474 : a5 43 __ LDA T0 + 0 
2476 : ed f6 9f SBC $9ff6 ; (sstack + 6)
2479 : 85 0d __ STA P0 
247b : a5 44 __ LDA T0 + 1 
247d : ed f7 9f SBC $9ff7 ; (sstack + 7)
2480 : 85 0e __ STA P1 
2482 : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
2485 : a0 02 __ LDY #$02
2487 : b1 59 __ LDA (T5 + 0),y 
2489 : 8d f6 9f STA $9ff6 ; (sstack + 6)
248c : c8 __ __ INY
248d : b1 59 __ LDA (T5 + 0),y 
248f : 8d f7 9f STA $9ff7 ; (sstack + 7)
2492 : ad f4 9f LDA $9ff4 ; (sstack + 4)
2495 : 18 __ __ CLC
2496 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
2498 : 8d f4 9f STA $9ff4 ; (sstack + 4)
249b : ad f5 9f LDA $9ff5 ; (sstack + 5)
249e : 65 1c __ ADC ACCU + 1 ; (clip + 1)
24a0 : 8d f5 9f STA $9ff5 ; (sstack + 5)
24a3 : a0 07 __ LDY #$07
24a5 : b1 59 __ LDA (T5 + 0),y 
24a7 : 10 03 __ BPL $24ac ; (bm_line.s39 + 0)
24a9 : 4c 10 24 JMP $2410 ; (bm_line.s34 + 0)
.s39:
24ac : a5 56 __ LDA T3 + 1 
24ae : d1 59 __ CMP (T5 + 0),y 
24b0 : f0 03 __ BEQ $24b5 ; (bm_line.s37 + 0)
24b2 : 4c 0b 24 JMP $240b ; (bm_line.s38 + 0)
.s37:
24b5 : a5 55 __ LDA T3 + 0 
24b7 : 88 __ __ DEY
24b8 : d1 59 __ CMP (T5 + 0),y 
24ba : 4c 0b 24 JMP $240b ; (bm_line.s38 + 0)
.s52:
24bd : a5 57 __ LDA T4 + 0 
24bf : 85 0f __ STA P2 
24c1 : a5 58 __ LDA T4 + 1 
24c3 : 85 10 __ STA P3 
24c5 : a5 5f __ LDA T8 + 0 
24c7 : 85 11 __ STA P4 
24c9 : a5 60 __ LDA T8 + 1 
24cb : 85 12 __ STA P5 
24cd : 38 __ __ SEC
24ce : a5 43 __ LDA T0 + 0 
24d0 : e5 5b __ SBC T6 + 0 
24d2 : 85 0d __ STA P0 
24d4 : a5 44 __ LDA T0 + 1 
24d6 : e5 5c __ SBC T6 + 1 
24d8 : 85 0e __ STA P1 
24da : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
24dd : 18 __ __ CLC
24de : a5 1b __ LDA ACCU + 0 ; (clip + 0)
24e0 : 65 53 __ ADC T2 + 0 
24e2 : aa __ __ TAX
24e3 : a0 00 __ LDY #$00
24e5 : b1 59 __ LDA (T5 + 0),y 
24e7 : 8d f8 9f STA $9ff8 ; (sstack + 8)
24ea : c8 __ __ INY
24eb : b1 59 __ LDA (T5 + 0),y 
24ed : 8e fa 9f STX $9ffa ; (sstack + 10)
24f0 : 8d f9 9f STA $9ff9 ; (sstack + 9)
24f3 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
24f5 : 65 54 __ ADC T2 + 1 
24f7 : 8d fb 9f STA $9ffb ; (sstack + 11)
24fa : a0 05 __ LDY #$05
24fc : b1 59 __ LDA (T5 + 0),y 
24fe : 10 03 __ BPL $2503 ; (bm_line.s55 + 0)
2500 : 4c 1e 22 JMP $221e ; (bm_line.s50 + 0)
.s55:
2503 : a5 5e __ LDA T7 + 1 
2505 : d1 59 __ CMP (T5 + 0),y 
2507 : f0 03 __ BEQ $250c ; (bm_line.s53 + 0)
2509 : 4c 1c 22 JMP $221c ; (bm_line.s54 + 0)
.s53:
250c : a5 5d __ LDA T7 + 0 
250e : 88 __ __ DEY
250f : d1 59 __ CMP (T5 + 0),y 
2511 : 4c 1c 22 JMP $221c ; (bm_line.s54 + 0)
.s64:
2514 : a5 5c __ LDA T6 + 1 
2516 : 10 03 __ BPL $251b ; (bm_line.s81 + 0)
2518 : 4c 60 23 JMP $2360 ; (bm_line.s3 + 0)
.s81:
251b : c5 44 __ CMP T0 + 1 
251d : d0 04 __ BNE $2523 ; (bm_line.s80 + 0)
.s79:
251f : a5 5b __ LDA T6 + 0 
2521 : c5 43 __ CMP T0 + 0 
.s80:
2523 : 90 f3 __ BCC $2518 ; (bm_line.s64 + 4)
.s65:
2525 : a5 5e __ LDA T7 + 1 
2527 : 30 76 __ BMI $259f ; (bm_line.s70 + 0)
.s78:
2529 : d1 59 __ CMP (T5 + 0),y 
252b : d0 04 __ BNE $2531 ; (bm_line.s77 + 0)
.s76:
252d : a5 5d __ LDA T7 + 0 
252f : c5 45 __ CMP T1 + 0 
.s77:
2531 : b0 e5 __ BCS $2518 ; (bm_line.s64 + 4)
.s66:
2533 : a5 5e __ LDA T7 + 1 
2535 : c5 44 __ CMP T0 + 1 
2537 : d0 04 __ BNE $253d ; (bm_line.s75 + 0)
.s74:
2539 : a5 5d __ LDA T7 + 0 
253b : c5 43 __ CMP T0 + 0 
.s75:
253d : 90 60 __ BCC $259f ; (bm_line.s70 + 0)
.s67:
253f : a5 5c __ LDA T6 + 1 
2541 : d1 59 __ CMP (T5 + 0),y 
2543 : d0 04 __ BNE $2549 ; (bm_line.s72 + 0)
.s69:
2545 : a5 5b __ LDA T6 + 0 
2547 : c5 45 __ CMP T1 + 0 
.s72:
2549 : b0 03 __ BCS $254e ; (bm_line.s68 + 0)
254b : 4c 6c 22 JMP $226c ; (bm_line.s9 + 0)
.s68:
254e : a5 57 __ LDA T4 + 0 
2550 : 85 0f __ STA P2 
2552 : a5 58 __ LDA T4 + 1 
2554 : 85 10 __ STA P3 
2556 : a5 5f __ LDA T8 + 0 
2558 : 85 11 __ STA P4 
255a : a5 60 __ LDA T8 + 1 
255c : 85 12 __ STA P5 
255e : 18 __ __ CLC
255f : a5 5b __ LDA T6 + 0 
2561 : 69 01 __ ADC #$01
2563 : a8 __ __ TAY
2564 : a5 5c __ LDA T6 + 1 
2566 : 69 00 __ ADC #$00
2568 : aa __ __ TAX
2569 : 98 __ __ TYA
256a : 38 __ __ SEC
256b : a0 04 __ LDY #$04
256d : f1 59 __ SBC (T5 + 0),y 
256f : 85 0d __ STA P0 
2571 : 8a __ __ TXA
2572 : c8 __ __ INY
2573 : f1 59 __ SBC (T5 + 0),y 
2575 : 85 0e __ STA P1 
2577 : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
257a : 38 __ __ SEC
257b : a5 53 __ LDA T2 + 0 
257d : e5 1b __ SBC ACCU + 0 ; (clip + 0)
257f : 8d fa 9f STA $9ffa ; (sstack + 10)
2582 : a5 54 __ LDA T2 + 1 
2584 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
2586 : 8d fb 9f STA $9ffb ; (sstack + 11)
2589 : a0 04 __ LDY #$04
258b : b1 59 __ LDA (T5 + 0),y 
258d : 38 __ __ SEC
258e : e9 01 __ SBC #$01
2590 : aa __ __ TAX
2591 : c8 __ __ INY
2592 : b1 59 __ LDA (T5 + 0),y 
2594 : 8e f8 9f STX $9ff8 ; (sstack + 8)
2597 : e9 00 __ SBC #$00
2599 : 8d f9 9f STA $9ff9 ; (sstack + 9)
259c : 4c 6c 22 JMP $226c ; (bm_line.s9 + 0)
.s70:
259f : a5 57 __ LDA T4 + 0 
25a1 : 85 0f __ STA P2 
25a3 : a5 58 __ LDA T4 + 1 
25a5 : 85 10 __ STA P3 
25a7 : a5 5f __ LDA T8 + 0 
25a9 : 85 11 __ STA P4 
25ab : a5 60 __ LDA T8 + 1 
25ad : 85 12 __ STA P5 
25af : 38 __ __ SEC
25b0 : a5 43 __ LDA T0 + 0 
25b2 : e5 5d __ SBC T7 + 0 
25b4 : 85 0d __ STA P0 
25b6 : a5 44 __ LDA T0 + 1 
25b8 : e5 5e __ SBC T7 + 1 
25ba : 85 0e __ STA P1 
25bc : 20 f6 25 JSR $25f6 ; (lmuldiv16s.s4 + 0)
25bf : 18 __ __ CLC
25c0 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
25c2 : 65 55 __ ADC T3 + 0 
25c4 : aa __ __ TAX
25c5 : a0 00 __ LDY #$00
25c7 : b1 59 __ LDA (T5 + 0),y 
25c9 : 8d f4 9f STA $9ff4 ; (sstack + 4)
25cc : c8 __ __ INY
25cd : b1 59 __ LDA (T5 + 0),y 
25cf : 8e f6 9f STX $9ff6 ; (sstack + 6)
25d2 : 8d f5 9f STA $9ff5 ; (sstack + 5)
25d5 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
25d7 : 65 56 __ ADC T3 + 1 
25d9 : 8d f7 9f STA $9ff7 ; (sstack + 7)
25dc : a0 05 __ LDY #$05
25de : b1 59 __ LDA (T5 + 0),y 
25e0 : 10 03 __ BPL $25e5 ; (bm_line.s73 + 0)
25e2 : 4c 4e 25 JMP $254e ; (bm_line.s68 + 0)
.s73:
25e5 : a5 5c __ LDA T6 + 1 
25e7 : d1 59 __ CMP (T5 + 0),y 
25e9 : f0 03 __ BEQ $25ee ; (bm_line.s71 + 0)
25eb : 4c 49 25 JMP $2549 ; (bm_line.s72 + 0)
.s71:
25ee : a5 5b __ LDA T6 + 0 
25f0 : 88 __ __ DEY
25f1 : d1 59 __ CMP (T5 + 0),y 
25f3 : 4c 49 25 JMP $2549 ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
25f6 : a9 00 __ LDA #$00
25f8 : 24 0e __ BIT P1 ; (a + 1)
25fa : 10 0d __ BPL $2609 ; (lmuldiv16s.s5 + 0)
.s10:
25fc : 38 __ __ SEC
25fd : e5 0d __ SBC P0 ; (a + 0)
25ff : 85 0d __ STA P0 ; (a + 0)
2601 : a9 00 __ LDA #$00
2603 : e5 0e __ SBC P1 ; (a + 1)
2605 : 85 0e __ STA P1 ; (a + 1)
2607 : a9 01 __ LDA #$01
.s5:
2609 : 85 43 __ STA T1 + 0 
260b : 24 10 __ BIT P3 ; (b + 1)
260d : 10 14 __ BPL $2623 ; (lmuldiv16s.s6 + 0)
.s9:
260f : 38 __ __ SEC
2610 : a9 00 __ LDA #$00
2612 : e5 0f __ SBC P2 ; (b + 0)
2614 : 85 0f __ STA P2 ; (b + 0)
2616 : a9 00 __ LDA #$00
2618 : e5 10 __ SBC P3 ; (b + 1)
261a : 85 10 __ STA P3 ; (b + 1)
261c : a9 00 __ LDA #$00
261e : c5 43 __ CMP T1 + 0 
2620 : 2a __ __ ROL
2621 : 85 43 __ STA T1 + 0 
.s6:
2623 : 24 12 __ BIT P5 ; (c + 1)
2625 : 10 14 __ BPL $263b ; (lmuldiv16s.s7 + 0)
.s8:
2627 : 38 __ __ SEC
2628 : a9 00 __ LDA #$00
262a : e5 11 __ SBC P4 ; (c + 0)
262c : 85 11 __ STA P4 ; (c + 0)
262e : a9 00 __ LDA #$00
2630 : e5 12 __ SBC P5 ; (c + 1)
2632 : 85 12 __ STA P5 ; (c + 1)
2634 : a9 00 __ LDA #$00
2636 : c5 43 __ CMP T1 + 0 
2638 : 2a __ __ ROL
2639 : 85 43 __ STA T1 + 0 
.s7:
263b : a9 00 __ LDA #$00
263d : 85 05 __ STA WORK + 2 
263f : 85 06 __ STA WORK + 3 
2641 : a5 0d __ LDA P0 ; (a + 0)
2643 : 38 __ __ SEC
2644 : a0 08 __ LDY #$08
2646 : 6a __ __ ROR
2647 : 90 0f __ BCC $2658 ; (lmuldiv16s.s7 + 29)
2649 : aa __ __ TAX
264a : 18 __ __ CLC
264b : a5 05 __ LDA WORK + 2 
264d : 65 0f __ ADC P2 ; (b + 0)
264f : 85 05 __ STA WORK + 2 
2651 : a5 06 __ LDA WORK + 3 
2653 : 65 10 __ ADC P3 ; (b + 1)
2655 : 85 06 __ STA WORK + 3 
2657 : 8a __ __ TXA
2658 : 66 06 __ ROR WORK + 3 
265a : 66 05 __ ROR WORK + 2 
265c : 88 __ __ DEY
265d : d0 e7 __ BNE $2646 ; (lmuldiv16s.s7 + 11)
265f : 6a __ __ ROR
2660 : 90 07 __ BCC $2669 ; (lmuldiv16s.s7 + 46)
2662 : 85 03 __ STA WORK + 0 
2664 : a5 0e __ LDA P1 ; (a + 1)
2666 : 18 __ __ CLC
2667 : 90 db __ BCC $2644 ; (lmuldiv16s.s7 + 9)
2669 : 38 __ __ SEC
266a : 85 04 __ STA WORK + 1 
266c : a2 08 __ LDX #$08
266e : 26 04 __ ROL WORK + 1 
2670 : 26 05 __ ROL WORK + 2 
2672 : 26 06 __ ROL WORK + 3 
2674 : 90 0c __ BCC $2682 ; (lmuldiv16s.s7 + 71)
2676 : a5 05 __ LDA WORK + 2 
2678 : e5 11 __ SBC P4 ; (c + 0)
267a : a8 __ __ TAY
267b : a5 06 __ LDA WORK + 3 
267d : e5 12 __ SBC P5 ; (c + 1)
267f : 38 __ __ SEC
2680 : b0 0c __ BCS $268e ; (lmuldiv16s.s7 + 83)
2682 : 38 __ __ SEC
2683 : a5 05 __ LDA WORK + 2 
2685 : e5 11 __ SBC P4 ; (c + 0)
2687 : a8 __ __ TAY
2688 : a5 06 __ LDA WORK + 3 
268a : e5 12 __ SBC P5 ; (c + 1)
268c : 90 04 __ BCC $2692 ; (lmuldiv16s.s7 + 87)
268e : 85 06 __ STA WORK + 3 
2690 : 84 05 __ STY WORK + 2 
2692 : ca __ __ DEX
2693 : d0 d9 __ BNE $266e ; (lmuldiv16s.s7 + 51)
2695 : a5 04 __ LDA WORK + 1 
2697 : 2a __ __ ROL
2698 : 90 07 __ BCC $26a1 ; (lmuldiv16s.s7 + 102)
269a : 85 1c __ STA ACCU + 1 
269c : a5 03 __ LDA WORK + 0 
269e : 18 __ __ CLC
269f : 90 c9 __ BCC $266a ; (lmuldiv16s.s7 + 47)
26a1 : 85 1b __ STA ACCU + 0 
26a3 : a5 43 __ LDA T1 + 0 
26a5 : f0 0d __ BEQ $26b4 ; (lmuldiv16s.s3 + 0)
26a7 : 38 __ __ SEC
26a8 : a9 00 __ LDA #$00
26aa : e5 1b __ SBC ACCU + 0 
26ac : 85 1b __ STA ACCU + 0 
26ae : a9 00 __ LDA #$00
26b0 : e5 1c __ SBC ACCU + 1 
26b2 : 85 1c __ STA ACCU + 1 
.s3:
26b4 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
26b5 : a5 17 __ LDA P10 ; (pattern + 0)
26b7 : f0 03 __ BEQ $26bc ; (bmu_line.s5 + 0)
26b9 : 4c bb 2b JMP $2bbb ; (bmu_line.s59 + 0)
.s5:
26bc : a5 18 __ LDA P11 ; (op + 0)
26be : f0 01 __ BEQ $26c1 ; (bmu_line.s6 + 0)
26c0 : 60 __ __ RTS
.s6:
26c1 : c6 17 __ DEC P10 ; (pattern + 0)
26c3 : a9 02 __ LDA #$02
.s63:
26c5 : 85 18 __ STA P11 ; (op + 0)
.s7:
26c7 : 38 __ __ SEC
26c8 : a5 13 __ LDA P6 ; (x1 + 0)
26ca : e5 0f __ SBC P2 ; (x0 + 0)
26cc : 85 46 __ STA T2 + 0 
26ce : a5 14 __ LDA P7 ; (x1 + 1)
26d0 : e5 10 __ SBC P3 ; (x0 + 1)
26d2 : 85 47 __ STA T2 + 1 
26d4 : 10 11 __ BPL $26e7 ; (bmu_line.s8 + 0)
.s58:
26d6 : 38 __ __ SEC
26d7 : a9 00 __ LDA #$00
26d9 : e5 46 __ SBC T2 + 0 
26db : 85 46 __ STA T2 + 0 
26dd : a9 00 __ LDA #$00
26df : e5 47 __ SBC T2 + 1 
26e1 : 85 47 __ STA T2 + 1 
26e3 : a9 01 __ LDA #$01
26e5 : d0 02 __ BNE $26e9 ; (bmu_line.s9 + 0)
.s8:
26e7 : a9 00 __ LDA #$00
.s9:
26e9 : 85 51 __ STA T10 + 0 
26eb : 38 __ __ SEC
26ec : a5 15 __ LDA P8 ; (y1 + 0)
26ee : e5 11 __ SBC P4 ; (y0 + 0)
26f0 : 85 43 __ STA T0 + 0 
26f2 : a5 16 __ LDA P9 ; (y1 + 1)
26f4 : e5 12 __ SBC P5 ; (y0 + 1)
26f6 : 85 44 __ STA T0 + 1 
26f8 : 10 11 __ BPL $270b ; (bmu_line.s10 + 0)
.s57:
26fa : 38 __ __ SEC
26fb : a9 00 __ LDA #$00
26fd : e5 43 __ SBC T0 + 0 
26ff : 85 43 __ STA T0 + 0 
2701 : a9 00 __ LDA #$00
2703 : e5 44 __ SBC T0 + 1 
2705 : 85 44 __ STA T0 + 1 
2707 : a9 01 __ LDA #$01
2709 : d0 02 __ BNE $270d ; (bmu_line.s11 + 0)
.s10:
270b : a9 00 __ LDA #$00
.s11:
270d : 85 52 __ STA T11 + 0 
270f : a5 44 __ LDA T0 + 1 
2711 : c5 47 __ CMP T2 + 1 
2713 : d0 04 __ BNE $2719 ; (bmu_line.s56 + 0)
.s55:
2715 : a5 43 __ LDA T0 + 0 
2717 : c5 46 __ CMP T2 + 0 
.s56:
2719 : b0 06 __ BCS $2721 ; (bmu_line.s12 + 0)
.s54:
271b : a5 47 __ LDA T2 + 1 
271d : a6 46 __ LDX T2 + 0 
271f : 90 04 __ BCC $2725 ; (bmu_line.s13 + 0)
.s12:
2721 : a5 44 __ LDA T0 + 1 
2723 : a6 43 __ LDX T0 + 0 
.s13:
2725 : 86 49 __ STX T4 + 0 
2727 : 85 4a __ STA T4 + 1 
2729 : 38 __ __ SEC
272a : a5 43 __ LDA T0 + 0 
272c : e5 46 __ SBC T2 + 0 
272e : 85 4b __ STA T5 + 0 
2730 : a5 44 __ LDA T0 + 1 
2732 : e5 47 __ SBC T2 + 1 
2734 : 85 4c __ STA T5 + 1 
2736 : a5 4b __ LDA T5 + 0 
2738 : 4a __ __ LSR
2739 : b0 0c __ BCS $2747 ; (bmu_line.s53 + 0)
.s14:
273b : a5 4c __ LDA T5 + 1 
273d : c9 80 __ CMP #$80
273f : 6a __ __ ROR
2740 : 85 4c __ STA T5 + 1 
2742 : 66 4b __ ROR T5 + 0 
2744 : 4c 4f 27 JMP $274f ; (bmu_line.s15 + 0)
.s53:
2747 : 06 43 __ ASL T0 + 0 
2749 : 26 44 __ ROL T0 + 1 
274b : 06 46 __ ASL T2 + 0 
274d : 26 47 __ ROL T2 + 1 
.s15:
274f : a0 00 __ LDY #$00
2751 : b1 0d __ LDA (P0),y ; (bm + 0)
2753 : 85 4d __ STA T7 + 0 
2755 : c8 __ __ INY
2756 : b1 0d __ LDA (P0),y ; (bm + 0)
2758 : 85 4e __ STA T7 + 1 
275a : a0 04 __ LDY #$04
275c : b1 0d __ LDA (P0),y ; (bm + 0)
275e : aa __ __ TAX
275f : 0a __ __ ASL
2760 : 85 4f __ STA T8 + 0 
2762 : a9 a0 __ LDA #$a0
2764 : 8d 00 34 STA $3400 ; (BLIT_CODE[0] + 0)
2767 : a9 a2 __ LDA #$a2
2769 : 8d 02 34 STA $3402 ; (BLIT_CODE[0] + 2)
276c : a9 a5 __ LDA #$a5
276e : 8d 04 34 STA $3404 ; (BLIT_CODE[0] + 4)
2771 : a9 0a __ LDA #$0a
2773 : 8d 05 34 STA $3405 ; (BLIT_CODE[0] + 5)
2776 : a9 00 __ LDA #$00
2778 : 2a __ __ ROL
2779 : 06 4f __ ASL T8 + 0 
277b : 2a __ __ ROL
277c : 06 4f __ ASL T8 + 0 
277e : 2a __ __ ROL
277f : 85 50 __ STA T8 + 1 
2781 : a5 52 __ LDA T11 + 0 
2783 : f0 0d __ BEQ $2792 ; (bmu_line.s16 + 0)
.s52:
2785 : 38 __ __ SEC
2786 : a9 00 __ LDA #$00
2788 : e5 4f __ SBC T8 + 0 
278a : 85 4f __ STA T8 + 0 
278c : a9 00 __ LDA #$00
278e : e5 50 __ SBC T8 + 1 
2790 : 85 50 __ STA T8 + 1 
.s16:
2792 : a5 11 __ LDA P4 ; (y0 + 0)
2794 : 29 f8 __ AND #$f8
2796 : 85 1b __ STA ACCU + 0 
2798 : a5 12 __ LDA P5 ; (y0 + 1)
279a : 85 1c __ STA ACCU + 1 
279c : 8a __ __ TXA
279d : 20 23 2c JSR $2c23 ; (mul16by8 + 0)
27a0 : 18 __ __ CLC
27a1 : a5 4d __ LDA T7 + 0 
27a3 : 65 1b __ ADC ACCU + 0 
27a5 : 85 4d __ STA T7 + 0 
27a7 : a5 4e __ LDA T7 + 1 
27a9 : 65 1c __ ADC ACCU + 1 
27ab : aa __ __ TAX
27ac : a5 0f __ LDA P2 ; (x0 + 0)
27ae : 29 f8 __ AND #$f8
27b0 : 18 __ __ CLC
27b1 : 65 4d __ ADC T7 + 0 
27b3 : 85 4d __ STA T7 + 0 
27b5 : 8a __ __ TXA
27b6 : 65 10 __ ADC P3 ; (x0 + 1)
27b8 : 85 4e __ STA T7 + 1 
27ba : a5 46 __ LDA T2 + 0 
27bc : 05 43 __ ORA T0 + 0 
27be : 29 80 __ AND #$80
27c0 : 85 1b __ STA ACCU + 0 
27c2 : a5 47 __ LDA T2 + 1 
27c4 : 05 44 __ ORA T0 + 1 
27c6 : 05 1b __ ORA ACCU + 0 
27c8 : f0 02 __ BEQ $27cc ; (bmu_line.s67 + 0)
.s66:
27ca : a9 01 __ LDA #$01
.s67:
27cc : 85 1b __ STA ACCU + 0 
27ce : a5 11 __ LDA P4 ; (y0 + 0)
27d0 : 29 07 __ AND #$07
27d2 : 8d 01 34 STA $3401 ; (BLIT_CODE[0] + 1)
27d5 : a6 49 __ LDX T4 + 0 
27d7 : e8 __ __ INX
27d8 : 8e 03 34 STX $3403 ; (BLIT_CODE[0] + 3)
27db : a5 0f __ LDA P2 ; (x0 + 0)
27dd : 29 07 __ AND #$07
27df : aa __ __ TAX
27e0 : bd 68 33 LDA $3368,x ; (bitshift[0] + 32)
27e3 : 85 48 __ STA T3 + 0 
27e5 : a2 06 __ LDX #$06
27e7 : 86 45 __ STX T1 + 0 
27e9 : a5 18 __ LDA P11 ; (op + 0)
27eb : c9 02 __ CMP #$02
27ed : d0 03 __ BNE $27f2 ; (bmu_line.s17 + 0)
27ef : 4c 73 2b JMP $2b73 ; (bmu_line.s49 + 0)
.s17:
27f2 : b0 03 __ BCS $27f7 ; (bmu_line.s18 + 0)
27f4 : 4c fd 2a JMP $2afd ; (bmu_line.s44 + 0)
.s18:
27f7 : c9 03 __ CMP #$03
27f9 : d0 3d __ BNE $2838 ; (bmu_line.s19 + 0)
.s40:
27fb : a6 17 __ LDX P10 ; (pattern + 0)
27fd : e8 __ __ INX
27fe : f0 1e __ BEQ $281e ; (bmu_line.s41 + 0)
.s43:
2800 : a9 06 __ LDA #$06
2802 : 8d 06 34 STA $3406 ; (BLIT_CODE[0] + 6)
2805 : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
2808 : a9 07 __ LDA #$07
280a : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
280d : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
2810 : a9 90 __ LDA #$90
2812 : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
2815 : a9 e6 __ LDA #$e6
2817 : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
281a : a9 0c __ LDA #$0c
281c : 85 45 __ STA T1 + 0 
.s41:
281e : a9 51 __ LDA #$51
.s42:
2820 : a6 45 __ LDX T1 + 0 
2822 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2825 : a9 03 __ LDA #$03
2827 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
282a : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
282d : a9 91 __ LDA #$91
282f : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
2832 : 8a __ __ TXA
2833 : 18 __ __ CLC
2834 : 69 04 __ ADC #$04
.s64:
2836 : 85 45 __ STA T1 + 0 
.s19:
2838 : a5 43 __ LDA T0 + 0 
283a : 05 44 __ ORA T0 + 1 
283c : f0 03 __ BEQ $2841 ; (bmu_line.s20 + 0)
283e : 4c 16 29 JMP $2916 ; (bmu_line.s28 + 0)
.s20:
2841 : a5 46 __ LDA T2 + 0 
2843 : 05 47 __ ORA T2 + 1 
2845 : f0 75 __ BEQ $28bc ; (bmu_line.s21 + 0)
.s22:
2847 : a9 0a __ LDA #$0a
2849 : a6 45 __ LDX T1 + 0 
284b : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
284e : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
2851 : a9 90 __ LDA #$90
2853 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
2856 : a9 0c __ LDA #$0c
2858 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
285b : a9 a5 __ LDA #$a5
285d : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
2860 : a9 03 __ LDA #$03
2862 : 9d 07 34 STA $3407,x ; (BLIT_CODE[0] + 7)
2865 : a9 69 __ LDA #$69
2867 : 9d 08 34 STA $3408,x ; (BLIT_CODE[0] + 8)
286a : a5 51 __ LDA T10 + 0 
286c : f0 09 __ BEQ $2877 ; (bmu_line.s23 + 0)
.s27:
286e : a9 06 __ LDA #$06
2870 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2873 : a9 26 __ LDA #$26
2875 : d0 07 __ BNE $287e ; (bmu_line.s62 + 0)
.s23:
2877 : a9 46 __ LDA #$46
2879 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
287c : a9 66 __ LDA #$66
.s62:
287e : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
2881 : a9 02 __ LDA #$02
2883 : 9d 0b 34 STA $340b,x ; (BLIT_CODE[0] + 11)
2886 : a5 51 __ LDA T10 + 0 
2888 : f0 0e __ BEQ $2898 ; (bmu_line.s24 + 0)
.s26:
288a : a9 f8 __ LDA #$f8
288c : 9d 09 34 STA $3409,x ; (BLIT_CODE[0] + 9)
288f : a9 b0 __ LDA #$b0
2891 : 9d 0a 34 STA $340a,x ; (BLIT_CODE[0] + 10)
2894 : a9 c6 __ LDA #$c6
2896 : d0 0c __ BNE $28a4 ; (bmu_line.s25 + 0)
.s24:
2898 : a9 08 __ LDA #$08
289a : 9d 09 34 STA $3409,x ; (BLIT_CODE[0] + 9)
289d : a9 90 __ LDA #$90
289f : 9d 0a 34 STA $340a,x ; (BLIT_CODE[0] + 10)
28a2 : a9 e6 __ LDA #$e6
.s25:
28a4 : 9d 0c 34 STA $340c,x ; (BLIT_CODE[0] + 12)
28a7 : a9 04 __ LDA #$04
28a9 : 9d 0d 34 STA $340d,x ; (BLIT_CODE[0] + 13)
28ac : a9 85 __ LDA #$85
28ae : 9d 0e 34 STA $340e,x ; (BLIT_CODE[0] + 14)
28b1 : a9 03 __ LDA #$03
28b3 : 9d 0f 34 STA $340f,x ; (BLIT_CODE[0] + 15)
28b6 : 8a __ __ TXA
28b7 : 18 __ __ CLC
28b8 : 69 10 __ ADC #$10
28ba : 85 45 __ STA T1 + 0 
.s21:
28bc : a9 ca __ LDA #$ca
28be : a6 45 __ LDX T1 + 0 
28c0 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
28c3 : a9 d0 __ LDA #$d0
28c5 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
28c8 : a9 c6 __ LDA #$c6
28ca : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
28cd : a9 0b __ LDA #$0b
28cf : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
28d2 : a9 10 __ LDA #$10
28d4 : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
28d7 : a9 60 __ LDA #$60
28d9 : 9d 07 34 STA $3407,x ; (BLIT_CODE[0] + 7)
28dc : e6 45 __ INC T1 + 0 
28de : 38 __ __ SEC
28df : a9 02 __ LDA #$02
28e1 : e5 45 __ SBC T1 + 0 
28e3 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
28e6 : 8a __ __ TXA
28e7 : 18 __ __ CLC
28e8 : 69 05 __ ADC #$05
28ea : 49 ff __ EOR #$ff
28ec : 18 __ __ CLC
28ed : 69 03 __ ADC #$03
28ef : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
28f2 : a5 4a __ LDA T4 + 1 
28f4 : 85 49 __ STA T4 + 0 
28f6 : a5 4d __ LDA T7 + 0 
28f8 : 85 03 __ STA WORK + 0 
28fa : a5 4e __ LDA T7 + 1 
28fc : 85 04 __ STA WORK + 1 
28fe : a5 4b __ LDA T5 + 0 
2900 : 85 05 __ STA WORK + 2 
2902 : a5 4c __ LDA T5 + 1 
2904 : 85 06 __ STA WORK + 3 
2906 : a5 49 __ LDA T4 + 0 
2908 : 85 0b __ STA WORK + 8 
290a : a5 48 __ LDA T3 + 0 
290c : 85 0a __ STA WORK + 7 
290e : a5 17 __ LDA P10 ; (pattern + 0)
2910 : 85 07 __ STA WORK + 4 
2912 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
.s3:
2915 : 60 __ __ RTS
.s28:
2916 : a5 46 __ LDA T2 + 0 
2918 : 05 47 __ ORA T2 + 1 
291a : c9 01 __ CMP #$01
291c : a9 00 __ LDA #$00
291e : 6a __ __ ROR
291f : 85 1c __ STA ACCU + 1 
2921 : f0 03 __ BEQ $2926 ; (bmu_line.s29 + 0)
2923 : 4c bd 2a JMP $2abd ; (bmu_line.s35 + 0)
.s29:
2926 : a2 00 __ LDX #$00
2928 : 86 46 __ STX T2 + 0 
292a : 86 47 __ STX T2 + 1 
292c : a5 52 __ LDA T11 + 0 
292e : f0 03 __ BEQ $2933 ; (bmu_line.s30 + 0)
2930 : 4c 53 2a JMP $2a53 ; (bmu_line.s34 + 0)
.s30:
2933 : a9 c8 __ LDA #$c8
2935 : a4 45 __ LDY T1 + 0 
2937 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
293a : a9 c0 __ LDA #$c0
293c : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
293f : a9 08 __ LDA #$08
2941 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2944 : a9 d0 __ LDA #$d0
2946 : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
2949 : a9 a0 __ LDA #$a0
294b : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
294e : a9 00 __ LDA #$00
2950 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
2953 : a9 a5 __ LDA #$a5
2955 : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
2958 : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
295b : a9 03 __ LDA #$03
295d : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
2960 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
2963 : a9 69 __ LDA #$69
2965 : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
2968 : 99 0f 34 STA $340f,y ; (BLIT_CODE[0] + 15)
296b : a9 85 __ LDA #$85
296d : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
2970 : 99 11 34 STA $3411,y ; (BLIT_CODE[0] + 17)
2973 : a9 04 __ LDA #$04
2975 : 99 0e 34 STA $340e,y ; (BLIT_CODE[0] + 14)
2978 : 99 12 34 STA $3412,y ; (BLIT_CODE[0] + 18)
297b : 8a __ __ TXA
297c : f0 04 __ BEQ $2982 ; (bmu_line.s71 + 0)
.s72:
297e : a9 10 __ LDA #$10
2980 : 90 02 __ BCC $2984 ; (bmu_line.s73 + 0)
.s71:
2982 : a9 0e __ LDA #$0e
.s73:
2984 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
2987 : 38 __ __ SEC
2988 : a5 4f __ LDA T8 + 0 
298a : e9 01 __ SBC #$01
298c : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
298f : a5 50 __ LDA T8 + 1 
2991 : e9 00 __ SBC #$00
2993 : 99 10 34 STA $3410,y ; (BLIT_CODE[0] + 16)
2996 : 98 __ __ TYA
2997 : 18 __ __ CLC
2998 : 69 13 __ ADC #$13
299a : 85 45 __ STA T1 + 0 
299c : a8 __ __ TAY
299d : 24 1c __ BIT ACCU + 1 
299f : 30 03 __ BMI $29a4 ; (bmu_line.s31 + 0)
29a1 : 4c 41 28 JMP $2841 ; (bmu_line.s20 + 0)
.s31:
29a4 : a9 a5 __ LDA #$a5
29a6 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
29a9 : a9 05 __ LDA #$05
29ab : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
29ae : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
29b1 : a9 38 __ LDA #$38
29b3 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
29b6 : a9 e9 __ LDA #$e9
29b8 : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
29bb : a9 85 __ LDA #$85
29bd : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
29c0 : a5 46 __ LDA T2 + 0 
29c2 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
29c5 : a5 1b __ LDA ACCU + 0 
29c7 : d0 2a __ BNE $29f3 ; (bmu_line.s33 + 0)
.s32:
29c9 : a9 10 __ LDA #$10
29cb : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
29ce : a9 15 __ LDA #$15
29d0 : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
29d3 : a9 18 __ LDA #$18
29d5 : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
29d8 : a9 69 __ LDA #$69
29da : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
29dd : a5 43 __ LDA T0 + 0 
29df : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
29e2 : a9 85 __ LDA #$85
29e4 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
29e7 : a9 05 __ LDA #$05
29e9 : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
29ec : 98 __ __ TYA
29ed : 18 __ __ CLC
29ee : 69 0e __ ADC #$0e
29f0 : 4c 4e 2a JMP $2a4e ; (bmu_line.s65 + 0)
.s33:
29f3 : a9 a5 __ LDA #$a5
29f5 : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
29f8 : 99 10 34 STA $3410,y ; (BLIT_CODE[0] + 16)
29fb : 99 16 34 STA $3416,y ; (BLIT_CODE[0] + 22)
29fe : a9 06 __ LDA #$06
2a00 : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
2a03 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
2a06 : 99 17 34 STA $3417,y ; (BLIT_CODE[0] + 23)
2a09 : 99 1b 34 STA $341b,y ; (BLIT_CODE[0] + 27)
2a0c : a9 e9 __ LDA #$e9
2a0e : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
2a11 : a9 85 __ LDA #$85
2a13 : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
2a16 : 99 14 34 STA $3414,y ; (BLIT_CODE[0] + 20)
2a19 : 99 1a 34 STA $341a,y ; (BLIT_CODE[0] + 26)
2a1c : a9 10 __ LDA #$10
2a1e : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
2a21 : a9 1d __ LDA #$1d
2a23 : 99 0e 34 STA $340e,y ; (BLIT_CODE[0] + 14)
2a26 : a9 18 __ LDA #$18
2a28 : 99 0f 34 STA $340f,y ; (BLIT_CODE[0] + 15)
2a2b : a9 05 __ LDA #$05
2a2d : 99 11 34 STA $3411,y ; (BLIT_CODE[0] + 17)
2a30 : 99 15 34 STA $3415,y ; (BLIT_CODE[0] + 21)
2a33 : a9 69 __ LDA #$69
2a35 : 99 12 34 STA $3412,y ; (BLIT_CODE[0] + 18)
2a38 : 99 18 34 STA $3418,y ; (BLIT_CODE[0] + 24)
2a3b : a5 43 __ LDA T0 + 0 
2a3d : 99 13 34 STA $3413,y ; (BLIT_CODE[0] + 19)
2a40 : a5 47 __ LDA T2 + 1 
2a42 : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
2a45 : a5 44 __ LDA T0 + 1 
2a47 : 99 19 34 STA $3419,y ; (BLIT_CODE[0] + 25)
2a4a : 98 __ __ TYA
2a4b : 18 __ __ CLC
2a4c : 69 1c __ ADC #$1c
.s65:
2a4e : 85 45 __ STA T1 + 0 
2a50 : 4c 47 28 JMP $2847 ; (bmu_line.s22 + 0)
.s34:
2a53 : a9 88 __ LDA #$88
2a55 : a4 45 __ LDY T1 + 0 
2a57 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2a5a : a9 10 __ LDA #$10
2a5c : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
2a5f : a9 18 __ LDA #$18
2a61 : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
2a64 : a9 a0 __ LDA #$a0
2a66 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
2a69 : a9 07 __ LDA #$07
2a6b : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
2a6e : a9 a5 __ LDA #$a5
2a70 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
2a73 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
2a76 : a9 03 __ LDA #$03
2a78 : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
2a7b : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
2a7e : a9 69 __ LDA #$69
2a80 : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
2a83 : 99 0e 34 STA $340e,y ; (BLIT_CODE[0] + 14)
2a86 : a9 85 __ LDA #$85
2a88 : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
2a8b : 99 10 34 STA $3410,y ; (BLIT_CODE[0] + 16)
2a8e : a9 04 __ LDA #$04
2a90 : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
2a93 : 99 11 34 STA $3411,y ; (BLIT_CODE[0] + 17)
2a96 : 8a __ __ TXA
2a97 : f0 04 __ BEQ $2a9d ; (bmu_line.s68 + 0)
.s69:
2a99 : a9 11 __ LDA #$11
2a9b : 90 02 __ BCC $2a9f ; (bmu_line.s70 + 0)
.s68:
2a9d : a9 0f __ LDA #$0f
.s70:
2a9f : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2aa2 : a5 4f __ LDA T8 + 0 
2aa4 : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
2aa7 : a5 50 __ LDA T8 + 1 
2aa9 : 99 0f 34 STA $340f,y ; (BLIT_CODE[0] + 15)
2aac : 98 __ __ TYA
2aad : 18 __ __ CLC
2aae : 69 12 __ ADC #$12
2ab0 : 85 45 __ STA T1 + 0 
2ab2 : a8 __ __ TAY
2ab3 : 24 1c __ BIT ACCU + 1 
2ab5 : 10 03 __ BPL $2aba ; (bmu_line.s70 + 27)
2ab7 : 4c a4 29 JMP $29a4 ; (bmu_line.s31 + 0)
2aba : 4c 41 28 JMP $2841 ; (bmu_line.s20 + 0)
.s35:
2abd : a9 a5 __ LDA #$a5
2abf : a6 45 __ LDX T1 + 0 
2ac1 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2ac4 : a9 30 __ LDA #$30
2ac6 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
2ac9 : a5 1b __ LDA ACCU + 0 
2acb : 69 05 __ ADC #$05
2acd : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
2ad0 : a5 1b __ LDA ACCU + 0 
2ad2 : d0 21 __ BNE $2af5 ; (bmu_line.s39 + 0)
.s36:
2ad4 : a0 1b __ LDY #$1b
2ad6 : a5 52 __ LDA T11 + 0 
2ad8 : d0 01 __ BNE $2adb ; (bmu_line.s38 + 0)
.s37:
2ada : c8 __ __ INY
.s38:
2adb : 98 __ __ TYA
2adc : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
2adf : 8a __ __ TXA
2ae0 : 18 __ __ CLC
2ae1 : 69 04 __ ADC #$04
2ae3 : 85 45 __ STA T1 + 0 
2ae5 : a9 00 __ LDA #$00
2ae7 : c5 1b __ CMP ACCU + 0 
2ae9 : 2a __ __ ROL
2aea : aa __ __ TAX
2aeb : a5 52 __ LDA T11 + 0 
2aed : f0 03 __ BEQ $2af2 ; (bmu_line.s38 + 23)
2aef : 4c 53 2a JMP $2a53 ; (bmu_line.s34 + 0)
2af2 : 4c 33 29 JMP $2933 ; (bmu_line.s30 + 0)
.s39:
2af5 : a0 21 __ LDY #$21
2af7 : a5 52 __ LDA T11 + 0 
2af9 : d0 e0 __ BNE $2adb ; (bmu_line.s38 + 0)
2afb : f0 dd __ BEQ $2ada ; (bmu_line.s37 + 0)
.s44:
2afd : a8 __ __ TAY
2afe : d0 4b __ BNE $2b4b ; (bmu_line.s46 + 0)
.s45:
2b00 : 8e 06 34 STX $3406 ; (BLIT_CODE[0] + 6)
2b03 : 8e 09 34 STX $3409 ; (BLIT_CODE[0] + 9)
2b06 : a9 07 __ LDA #$07
2b08 : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
2b0b : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
2b0e : a9 03 __ LDA #$03
2b10 : 8d 0d 34 STA $340d ; (BLIT_CODE[0] + 13)
2b13 : 8d 13 34 STA $3413 ; (BLIT_CODE[0] + 19)
2b16 : 8d 15 34 STA $3415 ; (BLIT_CODE[0] + 21)
2b19 : a9 90 __ LDA #$90
2b1b : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
2b1e : a9 e6 __ LDA #$e6
2b20 : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
2b23 : a9 11 __ LDA #$11
2b25 : 8d 0c 34 STA $340c ; (BLIT_CODE[0] + 12)
2b28 : a9 d0 __ LDA #$d0
2b2a : 8d 0e 34 STA $340e ; (BLIT_CODE[0] + 14)
2b2d : a9 04 __ LDA #$04
2b2f : 8d 0f 34 STA $340f ; (BLIT_CODE[0] + 15)
2b32 : a9 49 __ LDA #$49
2b34 : 8d 10 34 STA $3410 ; (BLIT_CODE[0] + 16)
2b37 : a9 ff __ LDA #$ff
2b39 : 8d 11 34 STA $3411 ; (BLIT_CODE[0] + 17)
2b3c : a9 31 __ LDA #$31
2b3e : 8d 12 34 STA $3412 ; (BLIT_CODE[0] + 18)
2b41 : a9 91 __ LDA #$91
2b43 : 8d 14 34 STA $3414 ; (BLIT_CODE[0] + 20)
2b46 : a9 16 __ LDA #$16
2b48 : 4c 36 28 JMP $2836 ; (bmu_line.s64 + 0)
.s46:
2b4b : a6 17 __ LDX P10 ; (pattern + 0)
2b4d : e8 __ __ INX
2b4e : f0 1e __ BEQ $2b6e ; (bmu_line.s47 + 0)
.s48:
2b50 : a9 06 __ LDA #$06
2b52 : 8d 06 34 STA $3406 ; (BLIT_CODE[0] + 6)
2b55 : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
2b58 : a9 07 __ LDA #$07
2b5a : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
2b5d : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
2b60 : a9 90 __ LDA #$90
2b62 : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
2b65 : a9 e6 __ LDA #$e6
2b67 : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
2b6a : a9 0c __ LDA #$0c
2b6c : 85 45 __ STA T1 + 0 
.s47:
2b6e : a9 11 __ LDA #$11
2b70 : 4c 20 28 JMP $2820 ; (bmu_line.s42 + 0)
.s49:
2b73 : a4 17 __ LDY P10 ; (pattern + 0)
2b75 : c8 __ __ INY
2b76 : f0 1e __ BEQ $2b96 ; (bmu_line.s50 + 0)
.s51:
2b78 : 8e 06 34 STX $3406 ; (BLIT_CODE[0] + 6)
2b7b : a9 07 __ LDA #$07
2b7d : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
2b80 : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
2b83 : a9 90 __ LDA #$90
2b85 : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
2b88 : a9 08 __ LDA #$08
2b8a : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
2b8d : a9 e6 __ LDA #$e6
2b8f : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
2b92 : a9 0c __ LDA #$0c
2b94 : 85 45 __ STA T1 + 0 
.s50:
2b96 : a9 49 __ LDA #$49
2b98 : a6 45 __ LDX T1 + 0 
2b9a : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2b9d : a9 ff __ LDA #$ff
2b9f : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
2ba2 : a9 31 __ LDA #$31
2ba4 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
2ba7 : a9 03 __ LDA #$03
2ba9 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
2bac : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
2baf : a9 91 __ LDA #$91
2bb1 : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
2bb4 : 8a __ __ TXA
2bb5 : 18 __ __ CLC
2bb6 : 69 06 __ ADC #$06
2bb8 : 4c 36 28 JMP $2836 ; (bmu_line.s64 + 0)
.s59:
2bbb : c9 ff __ CMP #$ff
2bbd : f0 03 __ BEQ $2bc2 ; (bmu_line.s60 + 0)
2bbf : 4c c7 26 JMP $26c7 ; (bmu_line.s7 + 0)
.s60:
2bc2 : a5 18 __ LDA P11 ; (op + 0)
2bc4 : d0 f9 __ BNE $2bbf ; (bmu_line.s59 + 4)
.s61:
2bc6 : a9 01 __ LDA #$01
2bc8 : 4c c5 26 JMP $26c5 ; (bmu_line.s63 + 0)
--------------------------------------------------------------------
done: ; done()->void
;  30, "/home/honza/projects/c64/projects/oscar64/samples/hires/polygon.c"
.s4:
2bcb : a9 37 __ LDA #$37
2bcd : 85 01 __ STA $01 
2bcf : 20 e5 2b JSR $2be5 ; (getch.l4 + 0)
2bd2 : a9 00 __ LDA #$00
2bd4 : 85 0d __ STA P0 
2bd6 : 85 0e __ STA P1 
2bd8 : 85 10 __ STA P3 
2bda : a9 04 __ LDA #$04
2bdc : 85 0f __ STA P2 
2bde : a9 10 __ LDA #$10
2be0 : 85 11 __ STA P4 
2be2 : 4c a8 0f JMP $0fa8 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
2be5 : 20 e4 ff JSR $ffe4 
2be8 : 85 1b __ STA ACCU + 0 
2bea : a5 1b __ LDA ACCU + 0 
2bec : f0 f7 __ BEQ $2be5 ; (getch.l4 + 0)
.s5:
2bee : 4c f1 2b JMP $2bf1 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
2bf1 : a8 __ __ TAY
2bf2 : ad f1 32 LDA $32f1 ; (giocharmap + 0)
2bf5 : f0 27 __ BEQ $2c1e ; (convch.s5 + 0)
.s6:
2bf7 : c0 0d __ CPY #$0d
2bf9 : d0 03 __ BNE $2bfe ; (convch.s7 + 0)
.s16:
2bfb : a9 0a __ LDA #$0a
.s3:
2bfd : 60 __ __ RTS
.s7:
2bfe : c9 02 __ CMP #$02
2c00 : 90 1c __ BCC $2c1e ; (convch.s5 + 0)
.s8:
2c02 : 98 __ __ TYA
2c03 : c0 41 __ CPY #$41
2c05 : 90 17 __ BCC $2c1e ; (convch.s5 + 0)
.s9:
2c07 : c9 db __ CMP #$db
2c09 : b0 13 __ BCS $2c1e ; (convch.s5 + 0)
.s10:
2c0b : c9 c1 __ CMP #$c1
2c0d : 90 03 __ BCC $2c12 ; (convch.s11 + 0)
.s15:
2c0f : 49 a0 __ EOR #$a0
2c11 : a8 __ __ TAY
.s11:
2c12 : c9 7b __ CMP #$7b
2c14 : b0 08 __ BCS $2c1e ; (convch.s5 + 0)
.s12:
2c16 : c9 61 __ CMP #$61
2c18 : b0 06 __ BCS $2c20 ; (convch.s14 + 0)
.s13:
2c1a : c9 5b __ CMP #$5b
2c1c : 90 02 __ BCC $2c20 ; (convch.s14 + 0)
.s5:
2c1e : 98 __ __ TYA
2c1f : 60 __ __ RTS
.s14:
2c20 : 49 20 __ EOR #$20
2c22 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
2c23 : 4a __ __ LSR
2c24 : f0 2e __ BEQ $2c54 ; (mul16by8 + 49)
2c26 : a2 00 __ LDX #$00
2c28 : a0 00 __ LDY #$00
2c2a : 90 13 __ BCC $2c3f ; (mul16by8 + 28)
2c2c : a4 1b __ LDY ACCU + 0 
2c2e : a6 1c __ LDX ACCU + 1 
2c30 : b0 0d __ BCS $2c3f ; (mul16by8 + 28)
2c32 : 85 02 __ STA $02 
2c34 : 18 __ __ CLC
2c35 : 98 __ __ TYA
2c36 : 65 1b __ ADC ACCU + 0 
2c38 : a8 __ __ TAY
2c39 : 8a __ __ TXA
2c3a : 65 1c __ ADC ACCU + 1 
2c3c : aa __ __ TAX
2c3d : a5 02 __ LDA $02 
2c3f : 06 1b __ ASL ACCU + 0 
2c41 : 26 1c __ ROL ACCU + 1 
2c43 : 4a __ __ LSR
2c44 : 90 f9 __ BCC $2c3f ; (mul16by8 + 28)
2c46 : d0 ea __ BNE $2c32 ; (mul16by8 + 15)
2c48 : 18 __ __ CLC
2c49 : 98 __ __ TYA
2c4a : 65 1b __ ADC ACCU + 0 
2c4c : 85 1b __ STA ACCU + 0 
2c4e : 8a __ __ TXA
2c4f : 65 1c __ ADC ACCU + 1 
2c51 : 85 1c __ STA ACCU + 1 
2c53 : 60 __ __ RTS
2c54 : b0 04 __ BCS $2c5a ; (mul16by8 + 55)
2c56 : 85 1b __ STA ACCU + 0 
2c58 : 85 1c __ STA ACCU + 1 
2c5a : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
2c5b : a0 00 __ LDY #$00
2c5d : 84 07 __ STY WORK + 4 
2c5f : 84 08 __ STY WORK + 5 
2c61 : 84 09 __ STY WORK + 6 
2c63 : 4a __ __ LSR
2c64 : b0 0d __ BCS $2c73 ; (mul32by8 + 24)
2c66 : f0 26 __ BEQ $2c8e ; (mul32by8 + 51)
2c68 : 06 1b __ ASL ACCU + 0 
2c6a : 26 1c __ ROL ACCU + 1 
2c6c : 26 1d __ ROL ACCU + 2 
2c6e : 26 1e __ ROL ACCU + 3 
2c70 : 4a __ __ LSR
2c71 : 90 f5 __ BCC $2c68 ; (mul32by8 + 13)
2c73 : aa __ __ TAX
2c74 : 18 __ __ CLC
2c75 : a5 07 __ LDA WORK + 4 
2c77 : 65 1b __ ADC ACCU + 0 
2c79 : 85 07 __ STA WORK + 4 
2c7b : a5 08 __ LDA WORK + 5 
2c7d : 65 1c __ ADC ACCU + 1 
2c7f : 85 08 __ STA WORK + 5 
2c81 : a5 09 __ LDA WORK + 6 
2c83 : 65 1d __ ADC ACCU + 2 
2c85 : 85 09 __ STA WORK + 6 
2c87 : 98 __ __ TYA
2c88 : 65 1e __ ADC ACCU + 3 
2c8a : a8 __ __ TAY
2c8b : 8a __ __ TXA
2c8c : d0 da __ BNE $2c68 ; (mul32by8 + 13)
2c8e : 84 0a __ STY WORK + 7 
2c90 : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
2c91 : b1 19 __ LDA (IP + 0),y 
2c93 : c8 __ __ INY
2c94 : aa __ __ TAX
2c95 : b5 00 __ LDA $00,x 
2c97 : 85 03 __ STA WORK + 0 
2c99 : b5 01 __ LDA $01,x 
2c9b : 85 04 __ STA WORK + 1 
2c9d : b5 02 __ LDA $02,x 
2c9f : 85 05 __ STA WORK + 2 
2ca1 : b5 03 __ LDA WORK + 0,x 
2ca3 : 85 06 __ STA WORK + 3 
2ca5 : a5 05 __ LDA WORK + 2 
2ca7 : 0a __ __ ASL
2ca8 : a5 06 __ LDA WORK + 3 
2caa : 2a __ __ ROL
2cab : 85 08 __ STA WORK + 5 
2cad : f0 06 __ BEQ $2cb5 ; (freg + 36)
2caf : a5 05 __ LDA WORK + 2 
2cb1 : 09 80 __ ORA #$80
2cb3 : 85 05 __ STA WORK + 2 
2cb5 : a5 1d __ LDA ACCU + 2 
2cb7 : 0a __ __ ASL
2cb8 : a5 1e __ LDA ACCU + 3 
2cba : 2a __ __ ROL
2cbb : 85 07 __ STA WORK + 4 
2cbd : f0 06 __ BEQ $2cc5 ; (freg + 52)
2cbf : a5 1d __ LDA ACCU + 2 
2cc1 : 09 80 __ ORA #$80
2cc3 : 85 1d __ STA ACCU + 2 
2cc5 : 60 __ __ RTS
2cc6 : 06 1e __ ASL ACCU + 3 
2cc8 : a5 07 __ LDA WORK + 4 
2cca : 6a __ __ ROR
2ccb : 85 1e __ STA ACCU + 3 
2ccd : b0 06 __ BCS $2cd5 ; (freg + 68)
2ccf : a5 1d __ LDA ACCU + 2 
2cd1 : 29 7f __ AND #$7f
2cd3 : 85 1d __ STA ACCU + 2 
2cd5 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
2cd6 : a5 06 __ LDA WORK + 3 
2cd8 : 49 80 __ EOR #$80
2cda : 85 06 __ STA WORK + 3 
2cdc : a9 ff __ LDA #$ff
2cde : c5 07 __ CMP WORK + 4 
2ce0 : f0 04 __ BEQ $2ce6 ; (faddsub + 16)
2ce2 : c5 08 __ CMP WORK + 5 
2ce4 : d0 11 __ BNE $2cf7 ; (faddsub + 33)
2ce6 : a5 1e __ LDA ACCU + 3 
2ce8 : 09 7f __ ORA #$7f
2cea : 85 1e __ STA ACCU + 3 
2cec : a9 80 __ LDA #$80
2cee : 85 1d __ STA ACCU + 2 
2cf0 : a9 00 __ LDA #$00
2cf2 : 85 1b __ STA ACCU + 0 
2cf4 : 85 1c __ STA ACCU + 1 
2cf6 : 60 __ __ RTS
2cf7 : 38 __ __ SEC
2cf8 : a5 07 __ LDA WORK + 4 
2cfa : e5 08 __ SBC WORK + 5 
2cfc : f0 38 __ BEQ $2d36 ; (faddsub + 96)
2cfe : aa __ __ TAX
2cff : b0 25 __ BCS $2d26 ; (faddsub + 80)
2d01 : e0 e9 __ CPX #$e9
2d03 : b0 0e __ BCS $2d13 ; (faddsub + 61)
2d05 : a5 08 __ LDA WORK + 5 
2d07 : 85 07 __ STA WORK + 4 
2d09 : a9 00 __ LDA #$00
2d0b : 85 1b __ STA ACCU + 0 
2d0d : 85 1c __ STA ACCU + 1 
2d0f : 85 1d __ STA ACCU + 2 
2d11 : f0 23 __ BEQ $2d36 ; (faddsub + 96)
2d13 : a5 1d __ LDA ACCU + 2 
2d15 : 4a __ __ LSR
2d16 : 66 1c __ ROR ACCU + 1 
2d18 : 66 1b __ ROR ACCU + 0 
2d1a : e8 __ __ INX
2d1b : d0 f8 __ BNE $2d15 ; (faddsub + 63)
2d1d : 85 1d __ STA ACCU + 2 
2d1f : a5 08 __ LDA WORK + 5 
2d21 : 85 07 __ STA WORK + 4 
2d23 : 4c 36 2d JMP $2d36 ; (faddsub + 96)
2d26 : e0 18 __ CPX #$18
2d28 : b0 33 __ BCS $2d5d ; (faddsub + 135)
2d2a : a5 05 __ LDA WORK + 2 
2d2c : 4a __ __ LSR
2d2d : 66 04 __ ROR WORK + 1 
2d2f : 66 03 __ ROR WORK + 0 
2d31 : ca __ __ DEX
2d32 : d0 f8 __ BNE $2d2c ; (faddsub + 86)
2d34 : 85 05 __ STA WORK + 2 
2d36 : a5 1e __ LDA ACCU + 3 
2d38 : 29 80 __ AND #$80
2d3a : 85 1e __ STA ACCU + 3 
2d3c : 45 06 __ EOR WORK + 3 
2d3e : 30 31 __ BMI $2d71 ; (faddsub + 155)
2d40 : 18 __ __ CLC
2d41 : a5 1b __ LDA ACCU + 0 
2d43 : 65 03 __ ADC WORK + 0 
2d45 : 85 1b __ STA ACCU + 0 
2d47 : a5 1c __ LDA ACCU + 1 
2d49 : 65 04 __ ADC WORK + 1 
2d4b : 85 1c __ STA ACCU + 1 
2d4d : a5 1d __ LDA ACCU + 2 
2d4f : 65 05 __ ADC WORK + 2 
2d51 : 85 1d __ STA ACCU + 2 
2d53 : 90 08 __ BCC $2d5d ; (faddsub + 135)
2d55 : 66 1d __ ROR ACCU + 2 
2d57 : 66 1c __ ROR ACCU + 1 
2d59 : 66 1b __ ROR ACCU + 0 
2d5b : e6 07 __ INC WORK + 4 
2d5d : a5 07 __ LDA WORK + 4 
2d5f : c9 ff __ CMP #$ff
2d61 : f0 83 __ BEQ $2ce6 ; (faddsub + 16)
2d63 : 4a __ __ LSR
2d64 : 05 1e __ ORA ACCU + 3 
2d66 : 85 1e __ STA ACCU + 3 
2d68 : b0 06 __ BCS $2d70 ; (faddsub + 154)
2d6a : a5 1d __ LDA ACCU + 2 
2d6c : 29 7f __ AND #$7f
2d6e : 85 1d __ STA ACCU + 2 
2d70 : 60 __ __ RTS
2d71 : 38 __ __ SEC
2d72 : a5 1b __ LDA ACCU + 0 
2d74 : e5 03 __ SBC WORK + 0 
2d76 : 85 1b __ STA ACCU + 0 
2d78 : a5 1c __ LDA ACCU + 1 
2d7a : e5 04 __ SBC WORK + 1 
2d7c : 85 1c __ STA ACCU + 1 
2d7e : a5 1d __ LDA ACCU + 2 
2d80 : e5 05 __ SBC WORK + 2 
2d82 : 85 1d __ STA ACCU + 2 
2d84 : b0 19 __ BCS $2d9f ; (faddsub + 201)
2d86 : 38 __ __ SEC
2d87 : a9 00 __ LDA #$00
2d89 : e5 1b __ SBC ACCU + 0 
2d8b : 85 1b __ STA ACCU + 0 
2d8d : a9 00 __ LDA #$00
2d8f : e5 1c __ SBC ACCU + 1 
2d91 : 85 1c __ STA ACCU + 1 
2d93 : a9 00 __ LDA #$00
2d95 : e5 1d __ SBC ACCU + 2 
2d97 : 85 1d __ STA ACCU + 2 
2d99 : a5 1e __ LDA ACCU + 3 
2d9b : 49 80 __ EOR #$80
2d9d : 85 1e __ STA ACCU + 3 
2d9f : a5 1d __ LDA ACCU + 2 
2da1 : 30 ba __ BMI $2d5d ; (faddsub + 135)
2da3 : 05 1c __ ORA ACCU + 1 
2da5 : 05 1b __ ORA ACCU + 0 
2da7 : f0 0f __ BEQ $2db8 ; (faddsub + 226)
2da9 : c6 07 __ DEC WORK + 4 
2dab : f0 0b __ BEQ $2db8 ; (faddsub + 226)
2dad : 06 1b __ ASL ACCU + 0 
2daf : 26 1c __ ROL ACCU + 1 
2db1 : 26 1d __ ROL ACCU + 2 
2db3 : 10 f4 __ BPL $2da9 ; (faddsub + 211)
2db5 : 4c 5d 2d JMP $2d5d ; (faddsub + 135)
2db8 : a9 00 __ LDA #$00
2dba : 85 1b __ STA ACCU + 0 
2dbc : 85 1c __ STA ACCU + 1 
2dbe : 85 1d __ STA ACCU + 2 
2dc0 : 85 1e __ STA ACCU + 3 
2dc2 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
2dc3 : a5 1b __ LDA ACCU + 0 
2dc5 : 05 1c __ ORA ACCU + 1 
2dc7 : 05 1d __ ORA ACCU + 2 
2dc9 : f0 0e __ BEQ $2dd9 ; (crt_fmul + 22)
2dcb : a5 03 __ LDA WORK + 0 
2dcd : 05 04 __ ORA WORK + 1 
2dcf : 05 05 __ ORA WORK + 2 
2dd1 : d0 09 __ BNE $2ddc ; (crt_fmul + 25)
2dd3 : 85 1b __ STA ACCU + 0 
2dd5 : 85 1c __ STA ACCU + 1 
2dd7 : 85 1d __ STA ACCU + 2 
2dd9 : 85 1e __ STA ACCU + 3 
2ddb : 60 __ __ RTS
2ddc : a5 1e __ LDA ACCU + 3 
2dde : 45 06 __ EOR WORK + 3 
2de0 : 29 80 __ AND #$80
2de2 : 85 1e __ STA ACCU + 3 
2de4 : a9 ff __ LDA #$ff
2de6 : c5 07 __ CMP WORK + 4 
2de8 : f0 42 __ BEQ $2e2c ; (crt_fmul + 105)
2dea : c5 08 __ CMP WORK + 5 
2dec : f0 3e __ BEQ $2e2c ; (crt_fmul + 105)
2dee : a9 00 __ LDA #$00
2df0 : 85 09 __ STA WORK + 6 
2df2 : 85 0a __ STA WORK + 7 
2df4 : 85 0b __ STA WORK + 8 
2df6 : a4 1b __ LDY ACCU + 0 
2df8 : a5 03 __ LDA WORK + 0 
2dfa : d0 06 __ BNE $2e02 ; (crt_fmul + 63)
2dfc : a5 04 __ LDA WORK + 1 
2dfe : f0 0a __ BEQ $2e0a ; (crt_fmul + 71)
2e00 : d0 05 __ BNE $2e07 ; (crt_fmul + 68)
2e02 : 20 5d 2e JSR $2e5d ; (crt_fmul8 + 0)
2e05 : a5 04 __ LDA WORK + 1 
2e07 : 20 5d 2e JSR $2e5d ; (crt_fmul8 + 0)
2e0a : a5 05 __ LDA WORK + 2 
2e0c : 20 5d 2e JSR $2e5d ; (crt_fmul8 + 0)
2e0f : 38 __ __ SEC
2e10 : a5 0b __ LDA WORK + 8 
2e12 : 30 06 __ BMI $2e1a ; (crt_fmul + 87)
2e14 : 06 09 __ ASL WORK + 6 
2e16 : 26 0a __ ROL WORK + 7 
2e18 : 2a __ __ ROL
2e19 : 18 __ __ CLC
2e1a : 29 7f __ AND #$7f
2e1c : 85 0b __ STA WORK + 8 
2e1e : a5 07 __ LDA WORK + 4 
2e20 : 65 08 __ ADC WORK + 5 
2e22 : 90 19 __ BCC $2e3d ; (crt_fmul + 122)
2e24 : e9 7f __ SBC #$7f
2e26 : b0 04 __ BCS $2e2c ; (crt_fmul + 105)
2e28 : c9 ff __ CMP #$ff
2e2a : d0 15 __ BNE $2e41 ; (crt_fmul + 126)
2e2c : a5 1e __ LDA ACCU + 3 
2e2e : 09 7f __ ORA #$7f
2e30 : 85 1e __ STA ACCU + 3 
2e32 : a9 80 __ LDA #$80
2e34 : 85 1d __ STA ACCU + 2 
2e36 : a9 00 __ LDA #$00
2e38 : 85 1b __ STA ACCU + 0 
2e3a : 85 1c __ STA ACCU + 1 
2e3c : 60 __ __ RTS
2e3d : e9 7e __ SBC #$7e
2e3f : 90 15 __ BCC $2e56 ; (crt_fmul + 147)
2e41 : 4a __ __ LSR
2e42 : 05 1e __ ORA ACCU + 3 
2e44 : 85 1e __ STA ACCU + 3 
2e46 : a9 00 __ LDA #$00
2e48 : 6a __ __ ROR
2e49 : 05 0b __ ORA WORK + 8 
2e4b : 85 1d __ STA ACCU + 2 
2e4d : a5 0a __ LDA WORK + 7 
2e4f : 85 1c __ STA ACCU + 1 
2e51 : a5 09 __ LDA WORK + 6 
2e53 : 85 1b __ STA ACCU + 0 
2e55 : 60 __ __ RTS
2e56 : a9 00 __ LDA #$00
2e58 : 85 1e __ STA ACCU + 3 
2e5a : f0 d8 __ BEQ $2e34 ; (crt_fmul + 113)
2e5c : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
2e5d : 38 __ __ SEC
2e5e : 6a __ __ ROR
2e5f : 90 1e __ BCC $2e7f ; (crt_fmul8 + 34)
2e61 : aa __ __ TAX
2e62 : 18 __ __ CLC
2e63 : 98 __ __ TYA
2e64 : 65 09 __ ADC WORK + 6 
2e66 : 85 09 __ STA WORK + 6 
2e68 : a5 0a __ LDA WORK + 7 
2e6a : 65 1c __ ADC ACCU + 1 
2e6c : 85 0a __ STA WORK + 7 
2e6e : a5 0b __ LDA WORK + 8 
2e70 : 65 1d __ ADC ACCU + 2 
2e72 : 6a __ __ ROR
2e73 : 85 0b __ STA WORK + 8 
2e75 : 8a __ __ TXA
2e76 : 66 0a __ ROR WORK + 7 
2e78 : 66 09 __ ROR WORK + 6 
2e7a : 4a __ __ LSR
2e7b : f0 0d __ BEQ $2e8a ; (crt_fmul8 + 45)
2e7d : b0 e2 __ BCS $2e61 ; (crt_fmul8 + 4)
2e7f : 66 0b __ ROR WORK + 8 
2e81 : 66 0a __ ROR WORK + 7 
2e83 : 66 09 __ ROR WORK + 6 
2e85 : 4a __ __ LSR
2e86 : 90 f7 __ BCC $2e7f ; (crt_fmul8 + 34)
2e88 : d0 d7 __ BNE $2e61 ; (crt_fmul8 + 4)
2e8a : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
2e8b : a5 1b __ LDA ACCU + 0 
2e8d : 05 1c __ ORA ACCU + 1 
2e8f : 05 1d __ ORA ACCU + 2 
2e91 : d0 03 __ BNE $2e96 ; (crt_fdiv + 11)
2e93 : 85 1e __ STA ACCU + 3 
2e95 : 60 __ __ RTS
2e96 : a5 1e __ LDA ACCU + 3 
2e98 : 45 06 __ EOR WORK + 3 
2e9a : 29 80 __ AND #$80
2e9c : 85 1e __ STA ACCU + 3 
2e9e : a5 08 __ LDA WORK + 5 
2ea0 : f0 62 __ BEQ $2f04 ; (crt_fdiv + 121)
2ea2 : a5 07 __ LDA WORK + 4 
2ea4 : c9 ff __ CMP #$ff
2ea6 : f0 5c __ BEQ $2f04 ; (crt_fdiv + 121)
2ea8 : a9 00 __ LDA #$00
2eaa : 85 09 __ STA WORK + 6 
2eac : 85 0a __ STA WORK + 7 
2eae : 85 0b __ STA WORK + 8 
2eb0 : a2 18 __ LDX #$18
2eb2 : a5 1b __ LDA ACCU + 0 
2eb4 : c5 03 __ CMP WORK + 0 
2eb6 : a5 1c __ LDA ACCU + 1 
2eb8 : e5 04 __ SBC WORK + 1 
2eba : a5 1d __ LDA ACCU + 2 
2ebc : e5 05 __ SBC WORK + 2 
2ebe : 90 13 __ BCC $2ed3 ; (crt_fdiv + 72)
2ec0 : a5 1b __ LDA ACCU + 0 
2ec2 : e5 03 __ SBC WORK + 0 
2ec4 : 85 1b __ STA ACCU + 0 
2ec6 : a5 1c __ LDA ACCU + 1 
2ec8 : e5 04 __ SBC WORK + 1 
2eca : 85 1c __ STA ACCU + 1 
2ecc : a5 1d __ LDA ACCU + 2 
2ece : e5 05 __ SBC WORK + 2 
2ed0 : 85 1d __ STA ACCU + 2 
2ed2 : 38 __ __ SEC
2ed3 : 26 09 __ ROL WORK + 6 
2ed5 : 26 0a __ ROL WORK + 7 
2ed7 : 26 0b __ ROL WORK + 8 
2ed9 : ca __ __ DEX
2eda : f0 0a __ BEQ $2ee6 ; (crt_fdiv + 91)
2edc : 06 1b __ ASL ACCU + 0 
2ede : 26 1c __ ROL ACCU + 1 
2ee0 : 26 1d __ ROL ACCU + 2 
2ee2 : b0 dc __ BCS $2ec0 ; (crt_fdiv + 53)
2ee4 : 90 cc __ BCC $2eb2 ; (crt_fdiv + 39)
2ee6 : 38 __ __ SEC
2ee7 : a5 0b __ LDA WORK + 8 
2ee9 : 30 06 __ BMI $2ef1 ; (crt_fdiv + 102)
2eeb : 06 09 __ ASL WORK + 6 
2eed : 26 0a __ ROL WORK + 7 
2eef : 2a __ __ ROL
2ef0 : 18 __ __ CLC
2ef1 : 29 7f __ AND #$7f
2ef3 : 85 0b __ STA WORK + 8 
2ef5 : a5 07 __ LDA WORK + 4 
2ef7 : e5 08 __ SBC WORK + 5 
2ef9 : 90 1a __ BCC $2f15 ; (crt_fdiv + 138)
2efb : 18 __ __ CLC
2efc : 69 7f __ ADC #$7f
2efe : b0 04 __ BCS $2f04 ; (crt_fdiv + 121)
2f00 : c9 ff __ CMP #$ff
2f02 : d0 15 __ BNE $2f19 ; (crt_fdiv + 142)
2f04 : a5 1e __ LDA ACCU + 3 
2f06 : 09 7f __ ORA #$7f
2f08 : 85 1e __ STA ACCU + 3 
2f0a : a9 80 __ LDA #$80
2f0c : 85 1d __ STA ACCU + 2 
2f0e : a9 00 __ LDA #$00
2f10 : 85 1c __ STA ACCU + 1 
2f12 : 85 1b __ STA ACCU + 0 
2f14 : 60 __ __ RTS
2f15 : 69 7f __ ADC #$7f
2f17 : 90 15 __ BCC $2f2e ; (crt_fdiv + 163)
2f19 : 4a __ __ LSR
2f1a : 05 1e __ ORA ACCU + 3 
2f1c : 85 1e __ STA ACCU + 3 
2f1e : a9 00 __ LDA #$00
2f20 : 6a __ __ ROR
2f21 : 05 0b __ ORA WORK + 8 
2f23 : 85 1d __ STA ACCU + 2 
2f25 : a5 0a __ LDA WORK + 7 
2f27 : 85 1c __ STA ACCU + 1 
2f29 : a5 09 __ LDA WORK + 6 
2f2b : 85 1b __ STA ACCU + 0 
2f2d : 60 __ __ RTS
2f2e : a9 00 __ LDA #$00
2f30 : 85 1e __ STA ACCU + 3 
2f32 : 85 1d __ STA ACCU + 2 
2f34 : 85 1c __ STA ACCU + 1 
2f36 : 85 1b __ STA ACCU + 0 
2f38 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
2f39 : a5 1c __ LDA ACCU + 1 
2f3b : d0 31 __ BNE $2f6e ; (divmod + 53)
2f3d : a5 04 __ LDA WORK + 1 
2f3f : d0 1e __ BNE $2f5f ; (divmod + 38)
2f41 : 85 06 __ STA WORK + 3 
2f43 : a2 04 __ LDX #$04
2f45 : 06 1b __ ASL ACCU + 0 
2f47 : 2a __ __ ROL
2f48 : c5 03 __ CMP WORK + 0 
2f4a : 90 02 __ BCC $2f4e ; (divmod + 21)
2f4c : e5 03 __ SBC WORK + 0 
2f4e : 26 1b __ ROL ACCU + 0 
2f50 : 2a __ __ ROL
2f51 : c5 03 __ CMP WORK + 0 
2f53 : 90 02 __ BCC $2f57 ; (divmod + 30)
2f55 : e5 03 __ SBC WORK + 0 
2f57 : 26 1b __ ROL ACCU + 0 
2f59 : ca __ __ DEX
2f5a : d0 eb __ BNE $2f47 ; (divmod + 14)
2f5c : 85 05 __ STA WORK + 2 
2f5e : 60 __ __ RTS
2f5f : a5 1b __ LDA ACCU + 0 
2f61 : 85 05 __ STA WORK + 2 
2f63 : a5 1c __ LDA ACCU + 1 
2f65 : 85 06 __ STA WORK + 3 
2f67 : a9 00 __ LDA #$00
2f69 : 85 1b __ STA ACCU + 0 
2f6b : 85 1c __ STA ACCU + 1 
2f6d : 60 __ __ RTS
2f6e : a5 04 __ LDA WORK + 1 
2f70 : d0 1f __ BNE $2f91 ; (divmod + 88)
2f72 : a5 03 __ LDA WORK + 0 
2f74 : 30 1b __ BMI $2f91 ; (divmod + 88)
2f76 : a9 00 __ LDA #$00
2f78 : 85 06 __ STA WORK + 3 
2f7a : a2 10 __ LDX #$10
2f7c : 06 1b __ ASL ACCU + 0 
2f7e : 26 1c __ ROL ACCU + 1 
2f80 : 2a __ __ ROL
2f81 : c5 03 __ CMP WORK + 0 
2f83 : 90 02 __ BCC $2f87 ; (divmod + 78)
2f85 : e5 03 __ SBC WORK + 0 
2f87 : 26 1b __ ROL ACCU + 0 
2f89 : 26 1c __ ROL ACCU + 1 
2f8b : ca __ __ DEX
2f8c : d0 f2 __ BNE $2f80 ; (divmod + 71)
2f8e : 85 05 __ STA WORK + 2 
2f90 : 60 __ __ RTS
2f91 : a9 00 __ LDA #$00
2f93 : 85 05 __ STA WORK + 2 
2f95 : 85 06 __ STA WORK + 3 
2f97 : 84 02 __ STY $02 
2f99 : a0 10 __ LDY #$10
2f9b : 18 __ __ CLC
2f9c : 26 1b __ ROL ACCU + 0 
2f9e : 26 1c __ ROL ACCU + 1 
2fa0 : 26 05 __ ROL WORK + 2 
2fa2 : 26 06 __ ROL WORK + 3 
2fa4 : 38 __ __ SEC
2fa5 : a5 05 __ LDA WORK + 2 
2fa7 : e5 03 __ SBC WORK + 0 
2fa9 : aa __ __ TAX
2faa : a5 06 __ LDA WORK + 3 
2fac : e5 04 __ SBC WORK + 1 
2fae : 90 04 __ BCC $2fb4 ; (divmod + 123)
2fb0 : 86 05 __ STX WORK + 2 
2fb2 : 85 06 __ STA WORK + 3 
2fb4 : 88 __ __ DEY
2fb5 : d0 e5 __ BNE $2f9c ; (divmod + 99)
2fb7 : 26 1b __ ROL ACCU + 0 
2fb9 : 26 1c __ ROL ACCU + 1 
2fbb : a4 02 __ LDY $02 
2fbd : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
2fbe : 24 1e __ BIT ACCU + 3 
2fc0 : 10 13 __ BPL $2fd5 ; (fround + 23)
2fc2 : 30 6b __ BMI $302f ; (fround + 113)
2fc4 : 24 1e __ BIT ACCU + 3 
2fc6 : 30 0d __ BMI $2fd5 ; (fround + 23)
2fc8 : 10 65 __ BPL $302f ; (fround + 113)
2fca : a9 00 __ LDA #$00
2fcc : 85 1b __ STA ACCU + 0 
2fce : 85 1c __ STA ACCU + 1 
2fd0 : 85 1d __ STA ACCU + 2 
2fd2 : 85 1e __ STA ACCU + 3 
2fd4 : 60 __ __ RTS
2fd5 : a5 07 __ LDA WORK + 4 
2fd7 : c9 7f __ CMP #$7f
2fd9 : 90 ef __ BCC $2fca ; (fround + 12)
2fdb : c9 87 __ CMP #$87
2fdd : 90 16 __ BCC $2ff5 ; (fround + 55)
2fdf : c9 8f __ CMP #$8f
2fe1 : 90 26 __ BCC $3009 ; (fround + 75)
2fe3 : c9 97 __ CMP #$97
2fe5 : b0 34 __ BCS $301b ; (fround + 93)
2fe7 : 38 __ __ SEC
2fe8 : e9 8f __ SBC #$8f
2fea : aa __ __ TAX
2feb : a5 1b __ LDA ACCU + 0 
2fed : 3d f2 32 AND $32f2,x ; (ubitmask[0] + 0)
2ff0 : 85 1b __ STA ACCU + 0 
2ff2 : 4c 1b 30 JMP $301b ; (fround + 93)
2ff5 : 38 __ __ SEC
2ff6 : e9 7f __ SBC #$7f
2ff8 : aa __ __ TAX
2ff9 : a5 1d __ LDA ACCU + 2 
2ffb : 3d f2 32 AND $32f2,x ; (ubitmask[0] + 0)
2ffe : 85 1d __ STA ACCU + 2 
3000 : a9 00 __ LDA #$00
3002 : 85 1b __ STA ACCU + 0 
3004 : 85 1c __ STA ACCU + 1 
3006 : 4c 1b 30 JMP $301b ; (fround + 93)
3009 : 38 __ __ SEC
300a : e9 87 __ SBC #$87
300c : aa __ __ TAX
300d : a5 1c __ LDA ACCU + 1 
300f : 3d f2 32 AND $32f2,x ; (ubitmask[0] + 0)
3012 : 85 1c __ STA ACCU + 1 
3014 : a9 00 __ LDA #$00
3016 : 85 1b __ STA ACCU + 0 
3018 : 4c 1b 30 JMP $301b ; (fround + 93)
301b : 4c c6 2c JMP $2cc6 ; (freg + 53)
301e : a9 7f __ LDA #$7f
3020 : 85 07 __ STA WORK + 4 
3022 : a9 00 __ LDA #$00
3024 : 85 1b __ STA ACCU + 0 
3026 : 85 1c __ STA ACCU + 1 
3028 : a9 80 __ LDA #$80
302a : 85 1d __ STA ACCU + 2 
302c : 4c c6 2c JMP $2cc6 ; (freg + 53)
302f : a5 1b __ LDA ACCU + 0 
3031 : 05 1c __ ORA ACCU + 1 
3033 : 05 1d __ ORA ACCU + 2 
3035 : f0 93 __ BEQ $2fca ; (fround + 12)
3037 : a5 07 __ LDA WORK + 4 
3039 : c9 7f __ CMP #$7f
303b : 90 e1 __ BCC $301e ; (fround + 96)
303d : c9 87 __ CMP #$87
303f : 90 2e __ BCC $306f ; (fround + 177)
3041 : c9 8f __ CMP #$8f
3043 : 90 4c __ BCC $3091 ; (fround + 211)
3045 : c9 97 __ CMP #$97
3047 : b0 6c __ BCS $30b5 ; (fround + 247)
3049 : 38 __ __ SEC
304a : e9 8f __ SBC #$8f
304c : aa __ __ TAX
304d : 18 __ __ CLC
304e : bd f2 32 LDA $32f2,x ; (ubitmask[0] + 0)
3051 : 49 ff __ EOR #$ff
3053 : 65 1b __ ADC ACCU + 0 
3055 : 85 1b __ STA ACCU + 0 
3057 : a9 00 __ LDA #$00
3059 : 65 1c __ ADC ACCU + 1 
305b : 85 1c __ STA ACCU + 1 
305d : a9 00 __ LDA #$00
305f : 65 1d __ ADC ACCU + 2 
3061 : 90 07 __ BCC $306a ; (fround + 172)
3063 : 6a __ __ ROR
3064 : 66 1c __ ROR ACCU + 1 
3066 : 66 1b __ ROR ACCU + 0 
3068 : e6 07 __ INC WORK + 4 
306a : 85 1d __ STA ACCU + 2 
306c : 4c d5 2f JMP $2fd5 ; (fround + 23)
306f : 38 __ __ SEC
3070 : e9 7f __ SBC #$7f
3072 : aa __ __ TAX
3073 : 18 __ __ CLC
3074 : a9 ff __ LDA #$ff
3076 : 65 1b __ ADC ACCU + 0 
3078 : a9 ff __ LDA #$ff
307a : 65 1c __ ADC ACCU + 1 
307c : bd f2 32 LDA $32f2,x ; (ubitmask[0] + 0)
307f : 49 ff __ EOR #$ff
3081 : 65 1d __ ADC ACCU + 2 
3083 : 90 07 __ BCC $308c ; (fround + 206)
3085 : 6a __ __ ROR
3086 : 66 1c __ ROR ACCU + 1 
3088 : 66 1b __ ROR ACCU + 0 
308a : e6 07 __ INC WORK + 4 
308c : 85 1d __ STA ACCU + 2 
308e : 4c d5 2f JMP $2fd5 ; (fround + 23)
3091 : 38 __ __ SEC
3092 : e9 87 __ SBC #$87
3094 : aa __ __ TAX
3095 : 18 __ __ CLC
3096 : a9 ff __ LDA #$ff
3098 : 65 1b __ ADC ACCU + 0 
309a : bd f2 32 LDA $32f2,x ; (ubitmask[0] + 0)
309d : 49 ff __ EOR #$ff
309f : 65 1c __ ADC ACCU + 1 
30a1 : 85 1c __ STA ACCU + 1 
30a3 : a9 00 __ LDA #$00
30a5 : 65 1d __ ADC ACCU + 2 
30a7 : 90 07 __ BCC $30b0 ; (fround + 242)
30a9 : 6a __ __ ROR
30aa : 66 1c __ ROR ACCU + 1 
30ac : 66 1b __ ROR ACCU + 0 
30ae : e6 07 __ INC WORK + 4 
30b0 : 85 1d __ STA ACCU + 2 
30b2 : 4c d5 2f JMP $2fd5 ; (fround + 23)
30b5 : 4c c6 2c JMP $2cc6 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
30b8 : 20 b5 2c JSR $2cb5 ; (freg + 36)
30bb : a5 07 __ LDA WORK + 4 
30bd : c9 7f __ CMP #$7f
30bf : b0 07 __ BCS $30c8 ; (f32_to_i16 + 16)
30c1 : a9 00 __ LDA #$00
30c3 : 85 1b __ STA ACCU + 0 
30c5 : 85 1c __ STA ACCU + 1 
30c7 : 60 __ __ RTS
30c8 : e9 8e __ SBC #$8e
30ca : 90 16 __ BCC $30e2 ; (f32_to_i16 + 42)
30cc : 24 1e __ BIT ACCU + 3 
30ce : 30 09 __ BMI $30d9 ; (f32_to_i16 + 33)
30d0 : a9 ff __ LDA #$ff
30d2 : 85 1b __ STA ACCU + 0 
30d4 : a9 7f __ LDA #$7f
30d6 : 85 1c __ STA ACCU + 1 
30d8 : 60 __ __ RTS
30d9 : a9 00 __ LDA #$00
30db : 85 1b __ STA ACCU + 0 
30dd : a9 80 __ LDA #$80
30df : 85 1c __ STA ACCU + 1 
30e1 : 60 __ __ RTS
30e2 : aa __ __ TAX
30e3 : a5 1c __ LDA ACCU + 1 
30e5 : 46 1d __ LSR ACCU + 2 
30e7 : 6a __ __ ROR
30e8 : e8 __ __ INX
30e9 : d0 fa __ BNE $30e5 ; (f32_to_i16 + 45)
30eb : 24 1e __ BIT ACCU + 3 
30ed : 10 0e __ BPL $30fd ; (f32_to_i16 + 69)
30ef : 38 __ __ SEC
30f0 : 49 ff __ EOR #$ff
30f2 : 69 00 __ ADC #$00
30f4 : 85 1b __ STA ACCU + 0 
30f6 : a9 00 __ LDA #$00
30f8 : e5 1d __ SBC ACCU + 2 
30fa : 85 1c __ STA ACCU + 1 
30fc : 60 __ __ RTS
30fd : 85 1b __ STA ACCU + 0 
30ff : a5 1d __ LDA ACCU + 2 
3101 : 85 1c __ STA ACCU + 1 
3103 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
3104 : 24 1c __ BIT ACCU + 1 
3106 : 30 03 __ BMI $310b ; (sint16_to_float + 7)
3108 : 4c 22 31 JMP $3122 ; (uint16_to_float + 0)
310b : 38 __ __ SEC
310c : a9 00 __ LDA #$00
310e : e5 1b __ SBC ACCU + 0 
3110 : 85 1b __ STA ACCU + 0 
3112 : a9 00 __ LDA #$00
3114 : e5 1c __ SBC ACCU + 1 
3116 : 85 1c __ STA ACCU + 1 
3118 : 20 22 31 JSR $3122 ; (uint16_to_float + 0)
311b : a5 1e __ LDA ACCU + 3 
311d : 09 80 __ ORA #$80
311f : 85 1e __ STA ACCU + 3 
3121 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
3122 : a5 1b __ LDA ACCU + 0 
3124 : 05 1c __ ORA ACCU + 1 
3126 : d0 05 __ BNE $312d ; (uint16_to_float + 11)
3128 : 85 1d __ STA ACCU + 2 
312a : 85 1e __ STA ACCU + 3 
312c : 60 __ __ RTS
312d : a2 8e __ LDX #$8e
312f : a5 1c __ LDA ACCU + 1 
3131 : 30 06 __ BMI $3139 ; (uint16_to_float + 23)
3133 : ca __ __ DEX
3134 : 06 1b __ ASL ACCU + 0 
3136 : 2a __ __ ROL
3137 : 10 fa __ BPL $3133 ; (uint16_to_float + 17)
3139 : 0a __ __ ASL
313a : 85 1d __ STA ACCU + 2 
313c : a5 1b __ LDA ACCU + 0 
313e : 85 1c __ STA ACCU + 1 
3140 : 8a __ __ TXA
3141 : 4a __ __ LSR
3142 : 85 1e __ STA ACCU + 3 
3144 : a9 00 __ LDA #$00
3146 : 85 1b __ STA ACCU + 0 
3148 : 66 1d __ ROR ACCU + 2 
314a : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
314b : a5 04 __ LDA WORK + 1 
314d : 05 05 __ ORA WORK + 2 
314f : 05 06 __ ORA WORK + 3 
3151 : d0 05 __ BNE $3158 ; (mul32 + 13)
3153 : a5 03 __ LDA WORK + 0 
3155 : 4c 5b 2c JMP $2c5b ; (mul32by8 + 0)
3158 : a0 00 __ LDY #$00
315a : 84 07 __ STY WORK + 4 
315c : 84 08 __ STY WORK + 5 
315e : 98 __ __ TYA
315f : 38 __ __ SEC
3160 : 66 03 __ ROR WORK + 0 
3162 : 90 15 __ BCC $3179 ; (mul32 + 46)
3164 : aa __ __ TAX
3165 : 18 __ __ CLC
3166 : a5 07 __ LDA WORK + 4 
3168 : 65 1b __ ADC ACCU + 0 
316a : 85 07 __ STA WORK + 4 
316c : a5 08 __ LDA WORK + 5 
316e : 65 1c __ ADC ACCU + 1 
3170 : 85 08 __ STA WORK + 5 
3172 : 98 __ __ TYA
3173 : 65 1d __ ADC ACCU + 2 
3175 : a8 __ __ TAY
3176 : 8a __ __ TXA
3177 : 65 1e __ ADC ACCU + 3 
3179 : 46 04 __ LSR WORK + 1 
317b : 90 0f __ BCC $318c ; (mul32 + 65)
317d : aa __ __ TAX
317e : 18 __ __ CLC
317f : a5 08 __ LDA WORK + 5 
3181 : 65 1b __ ADC ACCU + 0 
3183 : 85 08 __ STA WORK + 5 
3185 : 98 __ __ TYA
3186 : 65 1c __ ADC ACCU + 1 
3188 : a8 __ __ TAY
3189 : 8a __ __ TXA
318a : 65 1d __ ADC ACCU + 2 
318c : 46 05 __ LSR WORK + 2 
318e : 90 09 __ BCC $3199 ; (mul32 + 78)
3190 : aa __ __ TAX
3191 : 18 __ __ CLC
3192 : 98 __ __ TYA
3193 : 65 1b __ ADC ACCU + 0 
3195 : a8 __ __ TAY
3196 : 8a __ __ TXA
3197 : 65 1c __ ADC ACCU + 1 
3199 : 46 06 __ LSR WORK + 3 
319b : 90 03 __ BCC $31a0 ; (mul32 + 85)
319d : 18 __ __ CLC
319e : 65 1b __ ADC ACCU + 0 
31a0 : 06 1b __ ASL ACCU + 0 
31a2 : 26 1c __ ROL ACCU + 1 
31a4 : 26 1d __ ROL ACCU + 2 
31a6 : 26 1e __ ROL ACCU + 3 
31a8 : 46 03 __ LSR WORK + 0 
31aa : 90 cd __ BCC $3179 ; (mul32 + 46)
31ac : d0 b6 __ BNE $3164 ; (mul32 + 25)
31ae : 84 09 __ STY WORK + 6 
31b0 : 85 0a __ STA WORK + 7 
31b2 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
31b3 : 24 1e __ BIT ACCU + 3 
31b5 : 10 0d __ BPL $31c4 ; (divs32 + 17)
31b7 : 20 d1 31 JSR $31d1 ; (negaccu32 + 0)
31ba : 24 06 __ BIT WORK + 3 
31bc : 10 0d __ BPL $31cb ; (divs32 + 24)
31be : 20 eb 31 JSR $31eb ; (negtmp32 + 0)
31c1 : 4c 05 32 JMP $3205 ; (divmod32 + 0)
31c4 : 24 06 __ BIT WORK + 3 
31c6 : 10 f9 __ BPL $31c1 ; (divs32 + 14)
31c8 : 20 eb 31 JSR $31eb ; (negtmp32 + 0)
31cb : 20 05 32 JSR $3205 ; (divmod32 + 0)
31ce : 4c d1 31 JMP $31d1 ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
31d1 : 38 __ __ SEC
31d2 : a9 00 __ LDA #$00
31d4 : e5 1b __ SBC ACCU + 0 
31d6 : 85 1b __ STA ACCU + 0 
31d8 : a9 00 __ LDA #$00
31da : e5 1c __ SBC ACCU + 1 
31dc : 85 1c __ STA ACCU + 1 
31de : a9 00 __ LDA #$00
31e0 : e5 1d __ SBC ACCU + 2 
31e2 : 85 1d __ STA ACCU + 2 
31e4 : a9 00 __ LDA #$00
31e6 : e5 1e __ SBC ACCU + 3 
31e8 : 85 1e __ STA ACCU + 3 
31ea : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
31eb : 38 __ __ SEC
31ec : a9 00 __ LDA #$00
31ee : e5 03 __ SBC WORK + 0 
31f0 : 85 03 __ STA WORK + 0 
31f2 : a9 00 __ LDA #$00
31f4 : e5 04 __ SBC WORK + 1 
31f6 : 85 04 __ STA WORK + 1 
31f8 : a9 00 __ LDA #$00
31fa : e5 05 __ SBC WORK + 2 
31fc : 85 05 __ STA WORK + 2 
31fe : a9 00 __ LDA #$00
3200 : e5 06 __ SBC WORK + 3 
3202 : 85 06 __ STA WORK + 3 
3204 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
3205 : 84 02 __ STY $02 
3207 : a0 20 __ LDY #$20
3209 : a9 00 __ LDA #$00
320b : 85 07 __ STA WORK + 4 
320d : 85 08 __ STA WORK + 5 
320f : 85 09 __ STA WORK + 6 
3211 : 85 0a __ STA WORK + 7 
3213 : a5 05 __ LDA WORK + 2 
3215 : 05 06 __ ORA WORK + 3 
3217 : d0 78 __ BNE $3291 ; (divmod32 + 140)
3219 : a5 04 __ LDA WORK + 1 
321b : d0 27 __ BNE $3244 ; (divmod32 + 63)
321d : 18 __ __ CLC
321e : 26 1b __ ROL ACCU + 0 
3220 : 26 1c __ ROL ACCU + 1 
3222 : 26 1d __ ROL ACCU + 2 
3224 : 26 1e __ ROL ACCU + 3 
3226 : 2a __ __ ROL
3227 : 90 05 __ BCC $322e ; (divmod32 + 41)
3229 : e5 03 __ SBC WORK + 0 
322b : 38 __ __ SEC
322c : b0 06 __ BCS $3234 ; (divmod32 + 47)
322e : c5 03 __ CMP WORK + 0 
3230 : 90 02 __ BCC $3234 ; (divmod32 + 47)
3232 : e5 03 __ SBC WORK + 0 
3234 : 88 __ __ DEY
3235 : d0 e7 __ BNE $321e ; (divmod32 + 25)
3237 : 85 07 __ STA WORK + 4 
3239 : 26 1b __ ROL ACCU + 0 
323b : 26 1c __ ROL ACCU + 1 
323d : 26 1d __ ROL ACCU + 2 
323f : 26 1e __ ROL ACCU + 3 
3241 : a4 02 __ LDY $02 
3243 : 60 __ __ RTS
3244 : a5 1e __ LDA ACCU + 3 
3246 : d0 10 __ BNE $3258 ; (divmod32 + 83)
3248 : a6 1d __ LDX ACCU + 2 
324a : 86 1e __ STX ACCU + 3 
324c : a6 1c __ LDX ACCU + 1 
324e : 86 1d __ STX ACCU + 2 
3250 : a6 1b __ LDX ACCU + 0 
3252 : 86 1c __ STX ACCU + 1 
3254 : 85 1b __ STA ACCU + 0 
3256 : a0 18 __ LDY #$18
3258 : 18 __ __ CLC
3259 : 26 1b __ ROL ACCU + 0 
325b : 26 1c __ ROL ACCU + 1 
325d : 26 1d __ ROL ACCU + 2 
325f : 26 1e __ ROL ACCU + 3 
3261 : 26 07 __ ROL WORK + 4 
3263 : 26 08 __ ROL WORK + 5 
3265 : 90 0c __ BCC $3273 ; (divmod32 + 110)
3267 : a5 07 __ LDA WORK + 4 
3269 : e5 03 __ SBC WORK + 0 
326b : aa __ __ TAX
326c : a5 08 __ LDA WORK + 5 
326e : e5 04 __ SBC WORK + 1 
3270 : 38 __ __ SEC
3271 : b0 0c __ BCS $327f ; (divmod32 + 122)
3273 : 38 __ __ SEC
3274 : a5 07 __ LDA WORK + 4 
3276 : e5 03 __ SBC WORK + 0 
3278 : aa __ __ TAX
3279 : a5 08 __ LDA WORK + 5 
327b : e5 04 __ SBC WORK + 1 
327d : 90 04 __ BCC $3283 ; (divmod32 + 126)
327f : 86 07 __ STX WORK + 4 
3281 : 85 08 __ STA WORK + 5 
3283 : 88 __ __ DEY
3284 : d0 d3 __ BNE $3259 ; (divmod32 + 84)
3286 : 26 1b __ ROL ACCU + 0 
3288 : 26 1c __ ROL ACCU + 1 
328a : 26 1d __ ROL ACCU + 2 
328c : 26 1e __ ROL ACCU + 3 
328e : a4 02 __ LDY $02 
3290 : 60 __ __ RTS
3291 : a0 10 __ LDY #$10
3293 : a5 1e __ LDA ACCU + 3 
3295 : 85 08 __ STA WORK + 5 
3297 : a5 1d __ LDA ACCU + 2 
3299 : 85 07 __ STA WORK + 4 
329b : a9 00 __ LDA #$00
329d : 85 1d __ STA ACCU + 2 
329f : 85 1e __ STA ACCU + 3 
32a1 : 18 __ __ CLC
32a2 : 26 1b __ ROL ACCU + 0 
32a4 : 26 1c __ ROL ACCU + 1 
32a6 : 26 07 __ ROL WORK + 4 
32a8 : 26 08 __ ROL WORK + 5 
32aa : 26 09 __ ROL WORK + 6 
32ac : 26 0a __ ROL WORK + 7 
32ae : a5 07 __ LDA WORK + 4 
32b0 : c5 03 __ CMP WORK + 0 
32b2 : a5 08 __ LDA WORK + 5 
32b4 : e5 04 __ SBC WORK + 1 
32b6 : a5 09 __ LDA WORK + 6 
32b8 : e5 05 __ SBC WORK + 2 
32ba : aa __ __ TAX
32bb : a5 0a __ LDA WORK + 7 
32bd : e5 06 __ SBC WORK + 3 
32bf : 90 11 __ BCC $32d2 ; (divmod32 + 205)
32c1 : 86 09 __ STX WORK + 6 
32c3 : 85 0a __ STA WORK + 7 
32c5 : a5 07 __ LDA WORK + 4 
32c7 : e5 03 __ SBC WORK + 0 
32c9 : 85 07 __ STA WORK + 4 
32cb : a5 08 __ LDA WORK + 5 
32cd : e5 04 __ SBC WORK + 1 
32cf : 85 08 __ STA WORK + 5 
32d1 : 38 __ __ SEC
32d2 : 88 __ __ DEY
32d3 : d0 cd __ BNE $32a2 ; (divmod32 + 157)
32d5 : 26 1b __ ROL ACCU + 0 
32d7 : 26 1c __ ROL ACCU + 1 
32d9 : a4 02 __ LDY $02 
32db : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
32dc : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
lmask:
32dd : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
32e5 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
32ed : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
giocharmap:
32f1 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
ubitmask:
32f2 : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
NineShadesOfGrey:
3300 : __ __ __ BYT 00 00 00 00 00 00 00 00 22 00 88 00 22 00 88 00 : ........"..."...
3310 : __ __ __ BYT 22 88 22 88 22 88 22 88 88 55 22 55 88 55 22 55 : "."."."..U"U.U"U
3320 : __ __ __ BYT aa 55 aa 55 aa 55 aa 55 bb 55 ee 55 bb 55 ee 55 : .U.U.U.U.U.U.U.U
3330 : __ __ __ BYT dd 77 dd 77 dd 77 dd 77 ff ee ff bb ff ee ff bb : .w.w.w.w........
3340 : __ __ __ BYT ff ff ff ff ff ff ff ff                         : ........
--------------------------------------------------------------------
bitshift:
3348 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
3358 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3368 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
3378 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
Screen:
3380 : __ __ __ BSS	8
--------------------------------------------------------------------
BLIT_CODE:
3400 : __ __ __ BSS	224
