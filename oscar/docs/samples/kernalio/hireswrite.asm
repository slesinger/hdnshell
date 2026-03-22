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
080e : 8e 8c 1d STX $1d8c ; (spentry + 0)
0811 : a2 1d __ LDX #$1d
0813 : a0 e9 __ LDY #$e9
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 1f __ CPX #$1f
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 c8 __ CPY #$c8
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 b2 __ LDA #$b2
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
;  14, "/home/honza/projects/c64/projects/oscar64/samples/kernalio/hireswrite.c"
.s1:
0880 : a2 04 __ LDX #$04
0882 : b5 53 __ LDA T0 + 0,x 
0884 : 9d b4 9f STA $9fb4,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : a9 28 __ LDA #$28
088c : 85 11 __ STA P4 
088e : a9 19 __ LDA #$19
0890 : 85 12 __ STA P5 
0892 : 20 32 0b JSR $0b32 ; (mmap_trampoline.s4 + 0)
0895 : a9 e9 __ LDA #$e9
0897 : 85 0d __ STA P0 
0899 : a9 e0 __ LDA #$e0
089b : 85 10 __ STA P3 
089d : a9 1d __ LDA #$1d
089f : 85 0e __ STA P1 
08a1 : a9 00 __ LDA #$00
08a3 : 85 0f __ STA P2 
08a5 : 20 7c 0b JSR $0b7c ; (bm_init.s4 + 0)
08a8 : a9 02 __ LDA #$02
08aa : 85 0f __ STA P2 
08ac : 85 10 __ STA P3 
08ae : a9 f1 __ LDA #$f1
08b0 : 85 0d __ STA P0 
08b2 : a9 1d __ LDA #$1d
08b4 : 85 0e __ STA P1 
08b6 : 20 ae 0b JSR $0bae ; (bm_alloc.s4 + 0)
08b9 : a9 00 __ LDA #$00
08bb : 85 0d __ STA P0 
08bd : 85 0f __ STA P2 
08bf : 85 10 __ STA P3 
08c1 : a9 30 __ LDA #$30
08c3 : 85 01 __ STA $01 
08c5 : a9 e0 __ LDA #$e0
08c7 : 85 0e __ STA P1 
08c9 : a9 1f __ LDA #$1f
08cb : 85 12 __ STA P5 
08cd : a9 40 __ LDA #$40
08cf : 85 11 __ STA P4 
08d1 : 20 27 0c JSR $0c27 ; (memset.s4 + 0)
08d4 : a9 70 __ LDA #$70
08d6 : a2 fa __ LDX #$fa
.l6:
08d8 : ca __ __ DEX
08d9 : 9d 00 d0 STA $d000,x 
08dc : 9d fa d0 STA $d0fa,x 
08df : 9d f4 d1 STA $d1f4,x 
08e2 : 9d ee d2 STA $d2ee,x 
08e5 : d0 f1 __ BNE $08d8 ; (main.l6 + 0)
.s5:
08e7 : a9 00 __ LDA #$00
08e9 : 85 10 __ STA P3 
08eb : 85 0e __ STA P1 
08ed : a9 35 __ LDA #$35
08ef : 85 01 __ STA $01 
08f1 : a9 03 __ LDA #$03
08f3 : 85 0d __ STA P0 
08f5 : a9 e0 __ LDA #$e0
08f7 : 85 11 __ STA P4 
08f9 : a9 d0 __ LDA #$d0
08fb : 85 0f __ STA P2 
08fd : 20 4b 0c JSR $0c4b ; (vic_setmode.s4 + 0)
0900 : a9 f1 __ LDA #$f1
0902 : 85 13 __ STA P6 
0904 : a9 1d __ LDA #$1d
0906 : 85 14 __ STA P7 
0908 : a9 00 __ LDA #$00
090a : 85 15 __ STA P8 
090c : a2 07 __ LDX #$07
.l7:
090e : bd 9d 0c LDA $0c9d,x 
0911 : 9d ca 9f STA $9fca,x ; (crb.left + 0)
0914 : ca __ __ DEX
0915 : 10 f7 __ BPL $090e ; (main.l7 + 0)
.s8:
0917 : 20 a5 0c JSR $0ca5 ; (bm_fill.s4 + 0)
091a : a9 07 __ LDA #$07
091c : 8d df 9f STA $9fdf ; (sstack + 4)
091f : 8d e1 9f STA $9fe1 ; (sstack + 6)
0922 : a9 06 __ LDA #$06
0924 : 85 18 __ STA P11 
0926 : a9 f1 __ LDA #$f1
0928 : 8d db 9f STA $9fdb ; (sstack + 0)
092b : a9 1d __ LDA #$1d
092d : 8d dc 9f STA $9fdc ; (sstack + 1)
0930 : a9 00 __ LDA #$00
0932 : 8d e0 9f STA $9fe0 ; (sstack + 5)
0935 : 8d e2 9f STA $9fe2 ; (sstack + 7)
0938 : a9 ca __ LDA #$ca
093a : 8d dd 9f STA $9fdd ; (sstack + 2)
093d : a9 9f __ LDA #$9f
093f : 8d de 9f STA $9fde ; (sstack + 3)
0942 : a9 dd __ LDA #$dd
0944 : 8d e3 9f STA $9fe3 ; (sstack + 8)
0947 : a9 1d __ LDA #$1d
0949 : 8d e4 9f STA $9fe4 ; (sstack + 9)
094c : 20 d9 0c JSR $0cd9 ; (bm_circle_fill.s1 + 0)
094f : a9 00 __ LDA #$00
0951 : 8d e0 9f STA $9fe0 ; (sstack + 5)
0954 : 8d e2 9f STA $9fe2 ; (sstack + 7)
0957 : a9 5a __ LDA #$5a
0959 : 85 18 __ STA P11 
095b : a9 e9 __ LDA #$e9
095d : 8d db 9f STA $9fdb ; (sstack + 0)
0960 : a9 1d __ LDA #$1d
0962 : 8d dc 9f STA $9fdc ; (sstack + 1)
0965 : a9 a0 __ LDA #$a0
0967 : 8d df 9f STA $9fdf ; (sstack + 4)
096a : a9 64 __ LDA #$64
096c : 8d e1 9f STA $9fe1 ; (sstack + 6)
096f : a9 dd __ LDA #$dd
0971 : 8d e3 9f STA $9fe3 ; (sstack + 8)
0974 : a9 1d __ LDA #$1d
0976 : 8d e4 9f STA $9fe4 ; (sstack + 9)
0979 : a2 07 __ LDX #$07
.l9:
097b : bd 02 11 LDA $1102,x 
097e : 9d c2 9f STA $9fc2,x ; (crr.left + 0)
0981 : ca __ __ DEX
0982 : 10 f7 __ BPL $097b ; (main.l9 + 0)
.s10:
0984 : a9 c2 __ LDA #$c2
0986 : 8d dd 9f STA $9fdd ; (sstack + 2)
0989 : a9 9f __ LDA #$9f
098b : 8d de 9f STA $9fde ; (sstack + 3)
098e : 20 d9 0c JSR $0cd9 ; (bm_circle_fill.s1 + 0)
0991 : a9 00 __ LDA #$00
0993 : 8d e0 9f STA $9fe0 ; (sstack + 5)
0996 : 8d e2 9f STA $9fe2 ; (sstack + 7)
0999 : a9 14 __ LDA #$14
099b : 85 18 __ STA P11 
099d : a9 e9 __ LDA #$e9
099f : 8d db 9f STA $9fdb ; (sstack + 0)
09a2 : a9 1d __ LDA #$1d
09a4 : 8d dc 9f STA $9fdc ; (sstack + 1)
09a7 : a9 c2 __ LDA #$c2
09a9 : 8d dd 9f STA $9fdd ; (sstack + 2)
09ac : a9 9f __ LDA #$9f
09ae : 8d de 9f STA $9fde ; (sstack + 3)
09b1 : a9 78 __ LDA #$78
09b3 : 8d df 9f STA $9fdf ; (sstack + 4)
09b6 : a9 50 __ LDA #$50
09b8 : 8d e1 9f STA $9fe1 ; (sstack + 6)
09bb : a9 9d __ LDA #$9d
09bd : 8d e3 9f STA $9fe3 ; (sstack + 8)
09c0 : a9 1d __ LDA #$1d
09c2 : 8d e4 9f STA $9fe4 ; (sstack + 9)
09c5 : 20 d9 0c JSR $0cd9 ; (bm_circle_fill.s1 + 0)
09c8 : a9 00 __ LDA #$00
09ca : 8d e0 9f STA $9fe0 ; (sstack + 5)
09cd : 8d e2 9f STA $9fe2 ; (sstack + 7)
09d0 : a9 e9 __ LDA #$e9
09d2 : 8d db 9f STA $9fdb ; (sstack + 0)
09d5 : a9 1d __ LDA #$1d
09d7 : 8d dc 9f STA $9fdc ; (sstack + 1)
09da : a9 c2 __ LDA #$c2
09dc : 8d dd 9f STA $9fdd ; (sstack + 2)
09df : a9 9f __ LDA #$9f
09e1 : 8d de 9f STA $9fde ; (sstack + 3)
09e4 : a9 c8 __ LDA #$c8
09e6 : 8d df 9f STA $9fdf ; (sstack + 4)
09e9 : a9 50 __ LDA #$50
09eb : 8d e1 9f STA $9fe1 ; (sstack + 6)
09ee : a9 9d __ LDA #$9d
09f0 : 8d e3 9f STA $9fe3 ; (sstack + 8)
09f3 : a9 1d __ LDA #$1d
09f5 : 8d e4 9f STA $9fe4 ; (sstack + 9)
09f8 : 20 d9 0c JSR $0cd9 ; (bm_circle_fill.s1 + 0)
09fb : a9 d8 __ LDA #$d8
09fd : 85 55 __ STA T1 + 0 
09ff : a9 ff __ LDA #$ff
0a01 : 85 56 __ STA T1 + 1 
0a03 : a9 71 __ LDA #$71
0a05 : 85 57 __ STA T2 + 0 
.l11:
0a07 : a5 55 __ LDA T1 + 0 
0a09 : 85 03 __ STA WORK + 0 
0a0b : 85 1b __ STA ACCU + 0 
0a0d : a5 56 __ LDA T1 + 1 
0a0f : 85 04 __ STA WORK + 1 
0a11 : 85 1c __ STA ACCU + 1 
0a13 : 20 7c 1c JSR $1c7c ; (mul16 + 0)
0a16 : 38 __ __ SEC
0a17 : a9 c4 __ LDA #$c4
0a19 : e5 05 __ SBC WORK + 2 
0a1b : 85 0d __ STA P0 
0a1d : a9 09 __ LDA #$09
0a1f : e5 06 __ SBC WORK + 3 
0a21 : 85 0e __ STA P1 
0a23 : 20 80 0e JSR $0e80 ; (bm_usqrt.s4 + 0)
0a26 : a5 57 __ LDA T2 + 0 
0a28 : 8d ef 9f STA $9fef ; (sstack + 20)
0a2b : 18 __ __ CLC
0a2c : 69 04 __ ADC #$04
0a2e : 85 57 __ STA T2 + 0 
0a30 : a9 e9 __ LDA #$e9
0a32 : 8d eb 9f STA $9feb ; (sstack + 16)
0a35 : a9 1d __ LDA #$1d
0a37 : 8d ec 9f STA $9fec ; (sstack + 17)
0a3a : a9 c2 __ LDA #$c2
0a3c : 8d ed 9f STA $9fed ; (sstack + 18)
0a3f : a9 9f __ LDA #$9f
0a41 : 8d ee 9f STA $9fee ; (sstack + 19)
0a44 : a9 00 __ LDA #$00
0a46 : 8d f0 9f STA $9ff0 ; (sstack + 21)
0a49 : 8d f5 9f STA $9ff5 ; (sstack + 26)
0a4c : 8d f6 9f STA $9ff6 ; (sstack + 27)
0a4f : 8d f7 9f STA $9ff7 ; (sstack + 28)
0a52 : 8d f8 9f STA $9ff8 ; (sstack + 29)
0a55 : 8d fa 9f STA $9ffa ; (sstack + 31)
0a58 : 8d fc 9f STA $9ffc ; (sstack + 33)
0a5b : 8d fd 9f STA $9ffd ; (sstack + 34)
0a5e : 8d fe 9f STA $9ffe ; (sstack + 35)
0a61 : a9 f1 __ LDA #$f1
0a63 : 8d f3 9f STA $9ff3 ; (sstack + 24)
0a66 : a9 1d __ LDA #$1d
0a68 : 8d f4 9f STA $9ff4 ; (sstack + 25)
0a6b : a9 0f __ LDA #$0f
0a6d : 8d f9 9f STA $9ff9 ; (sstack + 30)
0a70 : 8d fb 9f STA $9ffb ; (sstack + 32)
0a73 : a9 59 __ LDA #$59
0a75 : 8d ff 9f STA $9fff ; (sstack + 36)
0a78 : 18 __ __ CLC
0a79 : a5 1b __ LDA ACCU + 0 
0a7b : 69 64 __ ADC #$64
0a7d : 8d f1 9f STA $9ff1 ; (sstack + 22)
0a80 : a5 1c __ LDA ACCU + 1 
0a82 : 69 00 __ ADC #$00
0a84 : 8d f2 9f STA $9ff2 ; (sstack + 23)
0a87 : 20 0a 11 JSR $110a ; (bm_bitblit.s4 + 0)
0a8a : 18 __ __ CLC
0a8b : a5 55 __ LDA T1 + 0 
0a8d : 69 04 __ ADC #$04
0a8f : 85 55 __ STA T1 + 0 
0a91 : 90 02 __ BCC $0a95 ; (main.s21 + 0)
.s20:
0a93 : e6 56 __ INC T1 + 1 
.s21:
0a95 : aa __ __ TAX
0a96 : 10 03 __ BPL $0a9b ; (main.s22 + 0)
0a98 : 4c 07 0a JMP $0a07 ; (main.l11 + 0)
.s22:
0a9b : c9 29 __ CMP #$29
0a9d : 90 f9 __ BCC $0a98 ; (main.s21 + 3)
.s12:
0a9f : a9 37 __ LDA #$37
0aa1 : 85 01 __ STA $01 
0aa3 : a9 86 __ LDA #$86
0aa5 : 85 0d __ STA P0 
0aa7 : a9 1b __ LDA #$1b
0aa9 : 85 0e __ STA P1 
0aab : 20 70 1b JSR $1b70 ; (krnio_setnam.s4 + 0)
0aae : a9 02 __ LDA #$02
0ab0 : 85 0d __ STA P0 
0ab2 : 85 0f __ STA P2 
0ab4 : a9 09 __ LDA #$09
0ab6 : 85 0e __ STA P1 
0ab8 : 20 97 1b JSR $1b97 ; (krnio_open.s4 + 0)
0abb : aa __ __ TAX
0abc : d0 24 __ BNE $0ae2 ; (main.s14 + 0)
.s13:
0abe : a9 00 __ LDA #$00
0ac0 : 85 0d __ STA P0 
0ac2 : 85 0e __ STA P1 
0ac4 : 85 10 __ STA P3 
0ac6 : a9 04 __ LDA #$04
0ac8 : 85 0f __ STA P2 
0aca : a9 10 __ LDA #$10
0acc : 85 11 __ STA P4 
0ace : 20 4b 0c JSR $0c4b ; (vic_setmode.s4 + 0)
0ad1 : a9 00 __ LDA #$00
0ad3 : 85 1b __ STA ACCU + 0 
0ad5 : 85 1c __ STA ACCU + 1 
.s3:
0ad7 : a2 04 __ LDX #$04
0ad9 : bd b4 9f LDA $9fb4,x ; (main@stack + 0)
0adc : 95 53 __ STA T0 + 0,x 
0ade : ca __ __ DEX
0adf : 10 f8 __ BPL $0ad9 ; (main.s3 + 2)
0ae1 : 60 __ __ RTS
.s14:
0ae2 : a9 00 __ LDA #$00
0ae4 : 85 53 __ STA T0 + 0 
0ae6 : a9 e0 __ LDA #$e0
0ae8 : 85 54 __ STA T0 + 1 
0aea : a9 00 __ LDA #$00
0aec : 85 0f __ STA P2 
0aee : a9 1f __ LDA #$1f
0af0 : 85 10 __ STA P3 
0af2 : a9 c8 __ LDA #$c8
0af4 : 85 11 __ STA P4 
.l15:
0af6 : a9 35 __ LDA #$35
0af8 : 85 01 __ STA $01 
0afa : a0 c7 __ LDY #$c7
.l16:
0afc : b1 53 __ LDA (T0 + 0),y 
0afe : 99 00 1f STA $1f00,y ; (Buffer[0] + 0)
0b01 : 88 __ __ DEY
0b02 : d0 f8 __ BNE $0afc ; (main.l16 + 0)
.s17:
0b04 : 84 12 __ STY P5 
0b06 : b1 53 __ LDA (T0 + 0),y 
0b08 : 8d 00 1f STA $1f00 ; (Buffer[0] + 0)
0b0b : a9 37 __ LDA #$37
0b0d : 85 01 __ STA $01 
0b0f : a9 02 __ LDA #$02
0b11 : 85 0e __ STA P1 
0b13 : 20 c5 1b JSR $1bc5 ; (krnio_write.s4 + 0)
0b16 : 18 __ __ CLC
0b17 : a5 53 __ LDA T0 + 0 
0b19 : 69 c8 __ ADC #$c8
0b1b : 85 53 __ STA T0 + 0 
0b1d : 90 02 __ BCC $0b21 ; (main.s24 + 0)
.s23:
0b1f : e6 54 __ INC T0 + 1 
.s24:
0b21 : c9 40 __ CMP #$40
0b23 : d0 d1 __ BNE $0af6 ; (main.l15 + 0)
.s19:
0b25 : a6 54 __ LDX T0 + 1 
0b27 : e8 __ __ INX
0b28 : d0 cc __ BNE $0af6 ; (main.l15 + 0)
.s18:
0b2a : a9 02 __ LDA #$02
0b2c : 20 3c 1c JSR $1c3c ; (krnio_close.s4 + 0)
0b2f : 4c be 0a JMP $0abe ; (main.s13 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0b32 : a9 47 __ LDA #$47
0b34 : 8d fa ff STA $fffa 
0b37 : a9 0b __ LDA #$0b
0b39 : 8d fb ff STA $fffb 
0b3c : a9 65 __ LDA #$65
0b3e : 8d fe ff STA $fffe 
0b41 : a9 0b __ LDA #$0b
0b43 : 8d ff ff STA $ffff 
.s3:
0b46 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0b47 : 48 __ __ PHA
0b48 : 8a __ __ TXA
0b49 : 48 __ __ PHA
0b4a : a9 0b __ LDA #$0b
0b4c : 48 __ __ PHA
0b4d : a9 5e __ LDA #$5e
0b4f : 48 __ __ PHA
0b50 : ba __ __ TSX
0b51 : bd 05 01 LDA $0105,x 
0b54 : 48 __ __ PHA
0b55 : a6 01 __ LDX $01 
0b57 : a9 36 __ LDA #$36
0b59 : 85 01 __ STA $01 
0b5b : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0b5e : 86 01 __ STX $01 
0b60 : 68 __ __ PLA
0b61 : aa __ __ TAX
0b62 : 68 __ __ PLA
0b63 : 40 __ __ RTI
0b64 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0b65 : 48 __ __ PHA
0b66 : 8a __ __ TXA
0b67 : 48 __ __ PHA
0b68 : a9 0b __ LDA #$0b
0b6a : 48 __ __ PHA
0b6b : a9 5e __ LDA #$5e
0b6d : 48 __ __ PHA
0b6e : ba __ __ TSX
0b6f : bd 05 01 LDA $0105,x 
0b72 : 48 __ __ PHA
0b73 : a6 01 __ LDX $01 
0b75 : a9 36 __ LDA #$36
0b77 : 85 01 __ STA $01 
0b79 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0b7c : a5 0f __ LDA P2 ; (data + 0)
0b7e : a0 00 __ LDY #$00
0b80 : 91 0d __ STA (P0),y ; (bm + 0)
0b82 : a5 10 __ LDA P3 ; (data + 1)
0b84 : c8 __ __ INY
0b85 : 91 0d __ STA (P0),y ; (bm + 0)
0b87 : a9 00 __ LDA #$00
0b89 : c8 __ __ INY
0b8a : 91 0d __ STA (P0),y ; (bm + 0)
0b8c : c8 __ __ INY
0b8d : 91 0d __ STA (P0),y ; (bm + 0)
0b8f : a5 11 __ LDA P4 ; (cw + 0)
0b91 : c8 __ __ INY
0b92 : 91 0d __ STA (P0),y ; (bm + 0)
0b94 : a5 12 __ LDA P5 ; (ch + 0)
0b96 : c8 __ __ INY
0b97 : 91 0d __ STA (P0),y ; (bm + 0)
0b99 : a9 00 __ LDA #$00
0b9b : 06 11 __ ASL P4 ; (cw + 0)
0b9d : 2a __ __ ROL
0b9e : 06 11 __ ASL P4 ; (cw + 0)
0ba0 : 2a __ __ ROL
0ba1 : 06 11 __ ASL P4 ; (cw + 0)
0ba3 : 2a __ __ ROL
0ba4 : a0 07 __ LDY #$07
0ba6 : 91 0d __ STA (P0),y ; (bm + 0)
0ba8 : a5 11 __ LDA P4 ; (cw + 0)
0baa : 88 __ __ DEY
0bab : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0bad : 60 __ __ RTS
--------------------------------------------------------------------
bm_alloc: ; bm_alloc(struct Bitmap*,u8,u8)->void
;  68, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0bae : a5 10 __ LDA P3 ; (ch + 0)
0bb0 : 85 1b __ STA ACCU + 0 
0bb2 : a0 05 __ LDY #$05
0bb4 : 91 0d __ STA (P0),y ; (bm + 0)
0bb6 : a5 0f __ LDA P2 ; (cw + 0)
0bb8 : 88 __ __ DEY
0bb9 : 91 0d __ STA (P0),y ; (bm + 0)
0bbb : a2 00 __ LDX #$00
0bbd : 86 1c __ STX ACCU + 1 
0bbf : 20 44 1c JSR $1c44 ; (mul16by8 + 0)
0bc2 : 06 1b __ ASL ACCU + 0 
0bc4 : a5 1c __ LDA ACCU + 1 
0bc6 : 2a __ __ ROL
0bc7 : 06 1b __ ASL ACCU + 0 
0bc9 : 2a __ __ ROL
0bca : 06 1b __ ASL ACCU + 0 
0bcc : 2a __ __ ROL
0bcd : aa __ __ TAX
0bce : 18 __ __ CLC
0bcf : a5 1b __ LDA ACCU + 0 
0bd1 : 69 08 __ ADC #$08
0bd3 : 85 1b __ STA ACCU + 0 
0bd5 : 90 01 __ BCC $0bd8 ; (bm_alloc.s6 + 0)
.s5:
0bd7 : e8 __ __ INX
.s6:
0bd8 : 86 1c __ STX ACCU + 1 
0bda : 20 be 1c JSR $1cbe ; (crt_malloc + 0)
0bdd : a5 1b __ LDA ACCU + 0 
0bdf : a0 02 __ LDY #$02
0be1 : 91 0d __ STA (P0),y ; (bm + 0)
0be3 : a5 1c __ LDA ACCU + 1 
0be5 : c8 __ __ INY
0be6 : 91 0d __ STA (P0),y ; (bm + 0)
0be8 : a5 1b __ LDA ACCU + 0 
0bea : 29 07 __ AND #$07
0bec : 49 ff __ EOR #$ff
0bee : 38 __ __ SEC
0bef : 69 00 __ ADC #$00
0bf1 : 85 43 __ STA T3 + 0 
0bf3 : a9 00 __ LDA #$00
0bf5 : e9 00 __ SBC #$00
0bf7 : 85 44 __ STA T3 + 1 
0bf9 : 18 __ __ CLC
0bfa : a5 1b __ LDA ACCU + 0 
0bfc : 69 08 __ ADC #$08
0bfe : a8 __ __ TAY
0bff : a5 1c __ LDA ACCU + 1 
0c01 : 69 00 __ ADC #$00
0c03 : aa __ __ TAX
0c04 : 98 __ __ TYA
0c05 : 18 __ __ CLC
0c06 : 65 43 __ ADC T3 + 0 
0c08 : a0 00 __ LDY #$00
0c0a : 91 0d __ STA (P0),y ; (bm + 0)
0c0c : 8a __ __ TXA
0c0d : 65 44 __ ADC T3 + 1 
0c0f : c8 __ __ INY
0c10 : 91 0d __ STA (P0),y ; (bm + 0)
0c12 : a9 00 __ LDA #$00
0c14 : 06 0f __ ASL P2 ; (cw + 0)
0c16 : 2a __ __ ROL
0c17 : 06 0f __ ASL P2 ; (cw + 0)
0c19 : 2a __ __ ROL
0c1a : 06 0f __ ASL P2 ; (cw + 0)
0c1c : 2a __ __ ROL
0c1d : a0 07 __ LDY #$07
0c1f : 91 0d __ STA (P0),y ; (bm + 0)
0c21 : a5 0f __ LDA P2 ; (cw + 0)
0c23 : 88 __ __ DEY
0c24 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0c26 : 60 __ __ RTS
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0c27 : a5 0f __ LDA P2 
0c29 : a6 12 __ LDX P5 
0c2b : f0 0c __ BEQ $0c39 ; (memset.s4 + 18)
0c2d : a0 00 __ LDY #$00
0c2f : 91 0d __ STA (P0),y ; (dst + 0)
0c31 : c8 __ __ INY
0c32 : d0 fb __ BNE $0c2f ; (memset.s4 + 8)
0c34 : e6 0e __ INC P1 ; (dst + 1)
0c36 : ca __ __ DEX
0c37 : d0 f6 __ BNE $0c2f ; (memset.s4 + 8)
0c39 : a4 11 __ LDY P4 
0c3b : f0 05 __ BEQ $0c42 ; (memset.s4 + 27)
0c3d : 88 __ __ DEY
0c3e : 91 0d __ STA (P0),y ; (dst + 0)
0c40 : d0 fb __ BNE $0c3d ; (memset.s4 + 22)
0c42 : a5 0d __ LDA P0 ; (dst + 0)
0c44 : 85 1b __ STA ACCU + 0 
0c46 : a5 0e __ LDA P1 ; (dst + 1)
0c48 : 85 1c __ STA ACCU + 1 
.s3:
0c4a : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0c4b : a4 0d __ LDY P0 ; (mode + 0)
0c4d : c0 02 __ CPY #$02
0c4f : d0 09 __ BNE $0c5a ; (vic_setmode.s5 + 0)
.s10:
0c51 : a9 5b __ LDA #$5b
0c53 : 8d 11 d0 STA $d011 
.s8:
0c56 : a9 08 __ LDA #$08
0c58 : d0 0c __ BNE $0c66 ; (vic_setmode.s7 + 0)
.s5:
0c5a : b0 36 __ BCS $0c92 ; (vic_setmode.s6 + 0)
.s9:
0c5c : a9 1b __ LDA #$1b
0c5e : 8d 11 d0 STA $d011 
0c61 : 98 __ __ TYA
0c62 : f0 f2 __ BEQ $0c56 ; (vic_setmode.s8 + 0)
.s11:
0c64 : a9 18 __ LDA #$18
.s7:
0c66 : 8d 16 d0 STA $d016 
0c69 : ad 00 dd LDA $dd00 
0c6c : 29 fc __ AND #$fc
0c6e : 85 1b __ STA ACCU + 0 
0c70 : a5 0f __ LDA P2 ; (text + 1)
0c72 : 0a __ __ ASL
0c73 : 2a __ __ ROL
0c74 : 29 01 __ AND #$01
0c76 : 2a __ __ ROL
0c77 : 49 03 __ EOR #$03
0c79 : 05 1b __ ORA ACCU + 0 
0c7b : 8d 00 dd STA $dd00 
0c7e : a5 0f __ LDA P2 ; (text + 1)
0c80 : 29 3c __ AND #$3c
0c82 : 0a __ __ ASL
0c83 : 0a __ __ ASL
0c84 : 85 1b __ STA ACCU + 0 
0c86 : a5 11 __ LDA P4 ; (font + 1)
0c88 : 29 38 __ AND #$38
0c8a : 4a __ __ LSR
0c8b : 4a __ __ LSR
0c8c : 05 1b __ ORA ACCU + 0 
0c8e : 8d 18 d0 STA $d018 
.s3:
0c91 : 60 __ __ RTS
.s6:
0c92 : a9 3b __ LDA #$3b
0c94 : 8d 11 d0 STA $d011 
0c97 : c0 03 __ CPY #$03
0c99 : d0 c9 __ BNE $0c64 ; (vic_setmode.s11 + 0)
0c9b : f0 b9 __ BEQ $0c56 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
0c9d : __ __ __ BYT 00 00 00 00 10 00 10 00                         : ........
--------------------------------------------------------------------
bm_fill: ; bm_fill(const struct Bitmap*,u8)->void
;  74, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0ca5 : a0 00 __ LDY #$00
0ca7 : b1 13 __ LDA (P6),y ; (bm + 0)
0ca9 : 85 0d __ STA P0 
0cab : c8 __ __ INY
0cac : b1 13 __ LDA (P6),y ; (bm + 0)
0cae : 85 0e __ STA P1 
0cb0 : a5 15 __ LDA P8 ; (data + 0)
0cb2 : 85 0f __ STA P2 
0cb4 : a0 05 __ LDY #$05
0cb6 : b1 13 __ LDA (P6),y ; (bm + 0)
0cb8 : 85 1b __ STA ACCU + 0 
0cba : a9 00 __ LDA #$00
0cbc : 85 10 __ STA P3 
0cbe : 85 1c __ STA ACCU + 1 
0cc0 : 88 __ __ DEY
0cc1 : b1 13 __ LDA (P6),y ; (bm + 0)
0cc3 : 20 44 1c JSR $1c44 ; (mul16by8 + 0)
0cc6 : a5 1b __ LDA ACCU + 0 
0cc8 : 0a __ __ ASL
0cc9 : 85 11 __ STA P4 
0ccb : a5 1c __ LDA ACCU + 1 
0ccd : 2a __ __ ROL
0cce : 06 11 __ ASL P4 
0cd0 : 2a __ __ ROL
0cd1 : 06 11 __ ASL P4 
0cd3 : 2a __ __ ROL
0cd4 : 85 12 __ STA P5 
0cd6 : 4c 27 0c JMP $0c27 ; (memset.s4 + 0)
--------------------------------------------------------------------
bm_circle_fill: ; bm_circle_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,u8,const u8*)->void
;  80, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
0cd9 : a2 04 __ LDX #$04
0cdb : b5 53 __ LDA T9 + 0,x 
0cdd : 9d d2 9f STA $9fd2,x ; (bm_circle_fill@stack + 0)
0ce0 : ca __ __ DEX
0ce1 : 10 f8 __ BPL $0cdb ; (bm_circle_fill.s1 + 2)
.s4:
0ce3 : ad e1 9f LDA $9fe1 ; (sstack + 6)
0ce6 : 85 4b __ STA T5 + 0 
0ce8 : 18 __ __ CLC
0ce9 : 65 18 __ ADC P11 ; (r + 0)
0ceb : aa __ __ TAX
0cec : ad e2 9f LDA $9fe2 ; (sstack + 7)
0cef : 85 4c __ STA T5 + 1 
0cf1 : 69 00 __ ADC #$00
0cf3 : a8 __ __ TAY
0cf4 : 8a __ __ TXA
0cf5 : 18 __ __ CLC
0cf6 : 69 01 __ ADC #$01
0cf8 : 85 4d __ STA T6 + 0 
0cfa : 90 01 __ BCC $0cfd ; (bm_circle_fill.s22 + 0)
.s21:
0cfc : c8 __ __ INY
.s22:
0cfd : 84 4e __ STY T6 + 1 
0cff : ad dd 9f LDA $9fdd ; (sstack + 2)
0d02 : 85 4f __ STA T7 + 0 
0d04 : ad de 9f LDA $9fde ; (sstack + 3)
0d07 : 85 50 __ STA T7 + 1 
0d09 : a0 06 __ LDY #$06
0d0b : b1 4f __ LDA (T7 + 0),y 
0d0d : aa __ __ TAX
0d0e : c8 __ __ INY
0d0f : b1 4f __ LDA (T7 + 0),y 
0d11 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0d13 : 38 __ __ SEC
0d14 : a5 4b __ LDA T5 + 0 
0d16 : e5 18 __ SBC P11 ; (r + 0)
0d18 : 85 45 __ STA T2 + 0 
0d1a : a0 02 __ LDY #$02
0d1c : b1 4f __ LDA (T7 + 0),y 
0d1e : 85 47 __ STA T3 + 0 
0d20 : a5 4c __ LDA T5 + 1 
0d22 : e9 00 __ SBC #$00
0d24 : 85 46 __ STA T2 + 1 
0d26 : c8 __ __ INY
0d27 : d1 4f __ CMP (T7 + 0),y 
0d29 : d0 08 __ BNE $0d33 ; (bm_circle_fill.s20 + 0)
.s17:
0d2b : a5 45 __ LDA T2 + 0 
0d2d : c5 47 __ CMP T3 + 0 
.s18:
0d2f : 90 08 __ BCC $0d39 ; (bm_circle_fill.s16 + 0)
0d31 : b0 0e __ BCS $0d41 ; (bm_circle_fill.s5 + 0)
.s20:
0d33 : 51 4f __ EOR (T7 + 0),y 
0d35 : 10 f8 __ BPL $0d2f ; (bm_circle_fill.s18 + 0)
.s19:
0d37 : 90 08 __ BCC $0d41 ; (bm_circle_fill.s5 + 0)
.s16:
0d39 : a5 47 __ LDA T3 + 0 
0d3b : 85 45 __ STA T2 + 0 
0d3d : b1 4f __ LDA (T7 + 0),y 
0d3f : 85 46 __ STA T2 + 1 
.s5:
0d41 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
0d43 : c5 4e __ CMP T6 + 1 
0d45 : d0 06 __ BNE $0d4d ; (bm_circle_fill.s15 + 0)
.s12:
0d47 : e4 4d __ CPX T6 + 0 
.s13:
0d49 : 90 08 __ BCC $0d53 ; (bm_circle_fill.s11 + 0)
0d4b : b0 08 __ BCS $0d55 ; (bm_circle_fill.s6 + 0)
.s15:
0d4d : 45 4e __ EOR T6 + 1 
0d4f : 10 f8 __ BPL $0d49 ; (bm_circle_fill.s13 + 0)
.s14:
0d51 : 90 02 __ BCC $0d55 ; (bm_circle_fill.s6 + 0)
.s11:
0d53 : 86 4d __ STX T6 + 0 
.s6:
0d55 : a5 45 __ LDA T2 + 0 
0d57 : c5 4d __ CMP T6 + 0 
0d59 : 90 0b __ BCC $0d66 ; (bm_circle_fill.s7 + 0)
.s3:
0d5b : a2 04 __ LDX #$04
0d5d : bd d2 9f LDA $9fd2,x ; (bm_circle_fill@stack + 0)
0d60 : 95 53 __ STA T9 + 0,x 
0d62 : ca __ __ DEX
0d63 : 10 f8 __ BPL $0d5d ; (bm_circle_fill.s3 + 2)
0d65 : 60 __ __ RTS
.s7:
0d66 : 29 f8 __ AND #$f8
0d68 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0d6a : ad db 9f LDA $9fdb ; (sstack + 0)
0d6d : 85 47 __ STA T3 + 0 
0d6f : ad dc 9f LDA $9fdc ; (sstack + 1)
0d72 : 85 48 __ STA T3 + 1 
0d74 : a5 46 __ LDA T2 + 1 
0d76 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0d78 : a0 04 __ LDY #$04
0d7a : b1 47 __ LDA (T3 + 0),y 
0d7c : 85 49 __ STA T4 + 0 
0d7e : 20 44 1c JSR $1c44 ; (mul16by8 + 0)
0d81 : a0 00 __ LDY #$00
0d83 : b1 47 __ LDA (T3 + 0),y 
0d85 : 18 __ __ CLC
0d86 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0d88 : 85 02 __ STA $02 
0d8a : c8 __ __ INY
0d8b : b1 47 __ LDA (T3 + 0),y 
0d8d : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0d8f : aa __ __ TAX
0d90 : a5 45 __ LDA T2 + 0 
0d92 : 85 57 __ STA T12 + 0 
0d94 : 29 07 __ AND #$07
0d96 : 18 __ __ CLC
0d97 : 65 02 __ ADC $02 
0d99 : 85 47 __ STA T3 + 0 
0d9b : 90 01 __ BCC $0d9e ; (bm_circle_fill.s24 + 0)
.s23:
0d9d : e8 __ __ INX
.s24:
0d9e : 86 48 __ STX T3 + 1 
0da0 : a9 00 __ LDA #$00
0da2 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0da4 : a5 18 __ LDA P11 ; (r + 0)
0da6 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0da8 : 20 44 1c JSR $1c44 ; (mul16by8 + 0)
0dab : 18 __ __ CLC
0dac : a5 1b __ LDA ACCU + 0 ; (clip + 0)
0dae : 65 18 __ ADC P11 ; (r + 0)
0db0 : 85 51 __ STA T8 + 0 
0db2 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
0db4 : 69 00 __ ADC #$00
0db6 : 85 52 __ STA T8 + 1 
0db8 : 18 __ __ CLC
0db9 : a5 49 __ LDA T4 + 0 
0dbb : 69 ff __ ADC #$ff
0dbd : 2a __ __ ROL
0dbe : 2a __ __ ROL
0dbf : 2a __ __ ROL
0dc0 : aa __ __ TAX
0dc1 : 29 f8 __ AND #$f8
0dc3 : 85 49 __ STA T4 + 0 
0dc5 : 8a __ __ TXA
0dc6 : 29 07 __ AND #$07
0dc8 : 2a __ __ ROL
0dc9 : 69 f8 __ ADC #$f8
0dcb : 85 4a __ STA T4 + 1 
0dcd : ad e3 9f LDA $9fe3 ; (sstack + 8)
0dd0 : 85 53 __ STA T9 + 0 
0dd2 : ad e4 9f LDA $9fe4 ; (sstack + 9)
0dd5 : 85 54 __ STA T9 + 1 
0dd7 : ad df 9f LDA $9fdf ; (sstack + 4)
0dda : 85 55 __ STA T10 + 0 
0ddc : ad e0 9f LDA $9fe0 ; (sstack + 5)
0ddf : 85 56 __ STA T10 + 1 
.l8:
0de1 : 38 __ __ SEC
0de2 : a5 57 __ LDA T12 + 0 
0de4 : e5 4b __ SBC T5 + 0 
0de6 : 85 03 __ STA WORK + 0 
0de8 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0dea : a9 00 __ LDA #$00
0dec : e5 4c __ SBC T5 + 1 
0dee : 85 04 __ STA WORK + 1 
0df0 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0df2 : 20 7c 1c JSR $1c7c ; (mul16 + 0)
0df5 : 38 __ __ SEC
0df6 : a5 51 __ LDA T8 + 0 
0df8 : e5 05 __ SBC WORK + 2 
0dfa : 85 0d __ STA P0 
0dfc : a5 52 __ LDA T8 + 1 
0dfe : e5 06 __ SBC WORK + 3 
0e00 : 85 0e __ STA P1 
0e02 : 20 80 0e JSR $0e80 ; (bm_usqrt.s4 + 0)
0e05 : a0 00 __ LDY #$00
0e07 : b1 4f __ LDA (T7 + 0),y 
0e09 : 85 0d __ STA P0 
0e0b : c8 __ __ INY
0e0c : b1 4f __ LDA (T7 + 0),y 
0e0e : 85 0e __ STA P1 
0e10 : a0 04 __ LDY #$04
0e12 : b1 4f __ LDA (T7 + 0),y 
0e14 : 85 0f __ STA P2 
0e16 : c8 __ __ INY
0e17 : b1 4f __ LDA (T7 + 0),y 
0e19 : 85 10 __ STA P3 
0e1b : a5 47 __ LDA T3 + 0 
0e1d : 85 11 __ STA P4 
0e1f : a5 48 __ LDA T3 + 1 
0e21 : 85 12 __ STA P5 
0e23 : a5 57 __ LDA T12 + 0 
0e25 : 29 07 __ AND #$07
0e27 : a8 __ __ TAY
0e28 : b1 53 __ LDA (T9 + 0),y 
0e2a : 85 17 __ STA P10 
0e2c : 38 __ __ SEC
0e2d : a5 55 __ LDA T10 + 0 
0e2f : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0e31 : 85 13 __ STA P6 
0e33 : a5 56 __ LDA T10 + 1 
0e35 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0e37 : 85 14 __ STA P7 
0e39 : 18 __ __ CLC
0e3a : a5 55 __ LDA T10 + 0 
0e3c : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0e3e : aa __ __ TAX
0e3f : a5 56 __ LDA T10 + 1 
0e41 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0e43 : a8 __ __ TAY
0e44 : 8a __ __ TXA
0e45 : 18 __ __ CLC
0e46 : 69 01 __ ADC #$01
0e48 : 85 15 __ STA P8 
0e4a : 90 01 __ BCC $0e4d ; (bm_circle_fill.s26 + 0)
.s25:
0e4c : c8 __ __ INY
.s26:
0e4d : 84 16 __ STY P9 
0e4f : 20 5f 0f JSR $0f5f ; (bm_scan_fill.s4 + 0)
0e52 : 18 __ __ CLC
0e53 : a5 11 __ LDA P4 
0e55 : 69 01 __ ADC #$01
0e57 : 85 47 __ STA T3 + 0 
0e59 : a5 12 __ LDA P5 
0e5b : 69 00 __ ADC #$00
0e5d : 85 48 __ STA T3 + 1 
0e5f : a5 47 __ LDA T3 + 0 
0e61 : 29 07 __ AND #$07
0e63 : d0 0d __ BNE $0e72 ; (bm_circle_fill.s10 + 0)
.s9:
0e65 : 18 __ __ CLC
0e66 : a5 47 __ LDA T3 + 0 
0e68 : 65 49 __ ADC T4 + 0 
0e6a : 85 47 __ STA T3 + 0 
0e6c : a5 48 __ LDA T3 + 1 
0e6e : 65 4a __ ADC T4 + 1 
0e70 : 85 48 __ STA T3 + 1 
.s10:
0e72 : e6 57 __ INC T12 + 0 
0e74 : a5 57 __ LDA T12 + 0 
0e76 : c5 4d __ CMP T6 + 0 
0e78 : b0 03 __ BCS $0e7d ; (bm_circle_fill.s10 + 11)
0e7a : 4c e1 0d JMP $0de1 ; (bm_circle_fill.l8 + 0)
0e7d : 4c 5b 0d JMP $0d5b ; (bm_circle_fill.s3 + 0)
--------------------------------------------------------------------
bm_usqrt: ; bm_usqrt(u16)->u16
;  62, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0e80 : a4 0e __ LDY P1 ; (n + 1)
0e82 : 98 __ __ TYA
0e83 : c0 40 __ CPY #$40
0e85 : 90 09 __ BCC $0e90 ; (bm_usqrt.s5 + 0)
.s29:
0e87 : e9 40 __ SBC #$40
0e89 : a8 __ __ TAY
0e8a : a9 50 __ LDA #$50
0e8c : a2 20 __ LDX #$20
0e8e : d0 04 __ BNE $0e94 ; (bm_usqrt.s6 + 0)
.s5:
0e90 : a9 10 __ LDA #$10
0e92 : a2 00 __ LDX #$00
.s6:
0e94 : 85 44 __ STA T2 + 1 
0e96 : c4 44 __ CPY T2 + 1 
0e98 : 90 08 __ BCC $0ea2 ; (bm_usqrt.s7 + 0)
.s28:
0e9a : 98 __ __ TYA
0e9b : e5 44 __ SBC T2 + 1 
0e9d : a8 __ __ TAY
0e9e : 8a __ __ TXA
0e9f : 09 10 __ ORA #$10
0ea1 : aa __ __ TAX
.s7:
0ea2 : 8a __ __ TXA
0ea3 : 4a __ __ LSR
0ea4 : 85 44 __ STA T2 + 1 
0ea6 : 8a __ __ TXA
0ea7 : 09 04 __ ORA #$04
0ea9 : 85 1c __ STA ACCU + 1 
0eab : c4 1c __ CPY ACCU + 1 
0ead : 90 0a __ BCC $0eb9 ; (bm_usqrt.s8 + 0)
.s27:
0eaf : 98 __ __ TYA
0eb0 : e5 1c __ SBC ACCU + 1 
0eb2 : a8 __ __ TAY
0eb3 : a5 44 __ LDA T2 + 1 
0eb5 : 09 04 __ ORA #$04
0eb7 : 85 44 __ STA T2 + 1 
.s8:
0eb9 : a5 44 __ LDA T2 + 1 
0ebb : 4a __ __ LSR
0ebc : 85 1c __ STA ACCU + 1 
0ebe : a5 44 __ LDA T2 + 1 
0ec0 : 09 01 __ ORA #$01
0ec2 : 85 44 __ STA T2 + 1 
0ec4 : c4 44 __ CPY T2 + 1 
0ec6 : 90 0a __ BCC $0ed2 ; (bm_usqrt.s9 + 0)
.s26:
0ec8 : 98 __ __ TYA
0ec9 : e5 44 __ SBC T2 + 1 
0ecb : a8 __ __ TAY
0ecc : a5 1c __ LDA ACCU + 1 
0ece : 09 01 __ ORA #$01
0ed0 : 85 1c __ STA ACCU + 1 
.s9:
0ed2 : a5 1c __ LDA ACCU + 1 
0ed4 : 4a __ __ LSR
0ed5 : 85 44 __ STA T2 + 1 
0ed7 : a9 00 __ LDA #$00
0ed9 : 6a __ __ ROR
0eda : 85 43 __ STA T2 + 0 
0edc : a6 0d __ LDX P0 ; (n + 0)
0ede : c4 1c __ CPY ACCU + 1 
0ee0 : d0 02 __ BNE $0ee4 ; (bm_usqrt.s25 + 0)
.s24:
0ee2 : e0 40 __ CPX #$40
.s25:
0ee4 : 90 0e __ BCC $0ef4 ; (bm_usqrt.s10 + 0)
.s23:
0ee6 : 8a __ __ TXA
0ee7 : e9 40 __ SBC #$40
0ee9 : aa __ __ TAX
0eea : 98 __ __ TYA
0eeb : e5 1c __ SBC ACCU + 1 
0eed : a8 __ __ TAY
0eee : a5 43 __ LDA T2 + 0 
0ef0 : 09 40 __ ORA #$40
0ef2 : 85 43 __ STA T2 + 0 
.s10:
0ef4 : a5 44 __ LDA T2 + 1 
0ef6 : 4a __ __ LSR
0ef7 : 85 1c __ STA ACCU + 1 
0ef9 : a5 43 __ LDA T2 + 0 
0efb : 6a __ __ ROR
0efc : 85 1b __ STA ACCU + 0 
0efe : a5 43 __ LDA T2 + 0 
0f00 : 09 10 __ ORA #$10
0f02 : 85 43 __ STA T2 + 0 
0f04 : c4 44 __ CPY T2 + 1 
0f06 : d0 02 __ BNE $0f0a ; (bm_usqrt.s22 + 0)
.s21:
0f08 : e4 43 __ CPX T2 + 0 
.s22:
0f0a : 90 0e __ BCC $0f1a ; (bm_usqrt.s11 + 0)
.s20:
0f0c : 8a __ __ TXA
0f0d : e5 43 __ SBC T2 + 0 
0f0f : aa __ __ TAX
0f10 : 98 __ __ TYA
0f11 : e5 44 __ SBC T2 + 1 
0f13 : a8 __ __ TAY
0f14 : a5 1b __ LDA ACCU + 0 
0f16 : 09 10 __ ORA #$10
0f18 : 85 1b __ STA ACCU + 0 
.s11:
0f1a : a5 1c __ LDA ACCU + 1 
0f1c : 4a __ __ LSR
0f1d : 85 44 __ STA T2 + 1 
0f1f : a5 1b __ LDA ACCU + 0 
0f21 : 6a __ __ ROR
0f22 : 85 43 __ STA T2 + 0 
0f24 : a5 1b __ LDA ACCU + 0 
0f26 : 09 04 __ ORA #$04
0f28 : 85 1b __ STA ACCU + 0 
0f2a : c4 1c __ CPY ACCU + 1 
0f2c : d0 02 __ BNE $0f30 ; (bm_usqrt.s19 + 0)
.s18:
0f2e : e4 1b __ CPX ACCU + 0 
.s19:
0f30 : 90 0e __ BCC $0f40 ; (bm_usqrt.s12 + 0)
.s17:
0f32 : 8a __ __ TXA
0f33 : e5 1b __ SBC ACCU + 0 
0f35 : aa __ __ TAX
0f36 : 98 __ __ TYA
0f37 : e5 1c __ SBC ACCU + 1 
0f39 : a8 __ __ TAY
0f3a : a5 43 __ LDA T2 + 0 
0f3c : 09 04 __ ORA #$04
0f3e : 85 43 __ STA T2 + 0 
.s12:
0f40 : a5 44 __ LDA T2 + 1 
0f42 : 4a __ __ LSR
0f43 : a5 43 __ LDA T2 + 0 
0f45 : 6a __ __ ROR
0f46 : c4 44 __ CPY T2 + 1 
0f48 : d0 0a __ BNE $0f54 ; (bm_usqrt.s16 + 0)
.s15:
0f4a : a8 __ __ TAY
0f4b : a5 43 __ LDA T2 + 0 
0f4d : 09 01 __ ORA #$01
0f4f : 85 43 __ STA T2 + 0 
0f51 : e4 43 __ CPX T2 + 0 
0f53 : 98 __ __ TYA
.s16:
0f54 : 90 02 __ BCC $0f58 ; (bm_usqrt.s13 + 0)
.s14:
0f56 : 09 01 __ ORA #$01
.s13:
0f58 : 85 1b __ STA ACCU + 0 
0f5a : a9 00 __ LDA #$00
.s3:
0f5c : 85 1c __ STA ACCU + 1 
0f5e : 60 __ __ RTS
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0f5f : a5 14 __ LDA P7 ; (x0 + 1)
0f61 : 30 0a __ BMI $0f6d ; (bm_scan_fill.s24 + 0)
.s27:
0f63 : c5 0e __ CMP P1 ; (left + 1)
0f65 : d0 04 __ BNE $0f6b ; (bm_scan_fill.s26 + 0)
.s25:
0f67 : a5 13 __ LDA P6 ; (x0 + 0)
0f69 : c5 0d __ CMP P0 ; (left + 0)
.s26:
0f6b : b0 08 __ BCS $0f75 ; (bm_scan_fill.s5 + 0)
.s24:
0f6d : a5 0d __ LDA P0 ; (left + 0)
0f6f : 85 13 __ STA P6 ; (x0 + 0)
0f71 : a5 0e __ LDA P1 ; (left + 1)
0f73 : 85 14 __ STA P7 ; (x0 + 1)
.s5:
0f75 : 24 16 __ BIT P9 ; (x1 + 1)
0f77 : 30 64 __ BMI $0fdd ; (bm_scan_fill.s3 + 0)
.s23:
0f79 : a5 10 __ LDA P3 ; (right + 1)
0f7b : c5 16 __ CMP P9 ; (x1 + 1)
0f7d : f0 03 __ BEQ $0f82 ; (bm_scan_fill.s21 + 0)
0f7f : 4c f9 10 JMP $10f9 ; (bm_scan_fill.s22 + 0)
.s21:
0f82 : a5 0f __ LDA P2 ; (right + 0)
0f84 : c5 15 __ CMP P8 ; (x1 + 0)
0f86 : b0 03 __ BCS $0f8b ; (bm_scan_fill.s17 + 0)
0f88 : 4c e3 10 JMP $10e3 ; (bm_scan_fill.s18 + 0)
.s17:
0f8b : a5 14 __ LDA P7 ; (x0 + 1)
0f8d : c5 16 __ CMP P9 ; (x1 + 1)
0f8f : d0 04 __ BNE $0f95 ; (bm_scan_fill.s20 + 0)
.s16:
0f91 : a5 13 __ LDA P6 ; (x0 + 0)
0f93 : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
0f95 : b0 46 __ BCS $0fdd ; (bm_scan_fill.s3 + 0)
.s6:
0f97 : a5 13 __ LDA P6 ; (x0 + 0)
0f99 : 29 f8 __ AND #$f8
0f9b : 85 1b __ STA ACCU + 0 
0f9d : 65 11 __ ADC P4 ; (lp + 0)
0f9f : 85 43 __ STA T1 + 0 
0fa1 : a5 12 __ LDA P5 ; (lp + 1)
0fa3 : 65 14 __ ADC P7 ; (x0 + 1)
0fa5 : 85 44 __ STA T1 + 1 
0fa7 : a5 15 __ LDA P8 ; (x1 + 0)
0fa9 : 29 07 __ AND #$07
0fab : aa __ __ TAX
0fac : a5 13 __ LDA P6 ; (x0 + 0)
0fae : 29 07 __ AND #$07
0fb0 : bc 95 1d LDY $1d95,x ; (rmask[0] + 0)
0fb3 : aa __ __ TAX
0fb4 : a5 15 __ LDA P8 ; (x1 + 0)
0fb6 : 29 f8 __ AND #$f8
0fb8 : 38 __ __ SEC
0fb9 : e5 1b __ SBC ACCU + 0 
0fbb : 85 1b __ STA ACCU + 0 
0fbd : a5 16 __ LDA P9 ; (x1 + 1)
0fbf : e5 14 __ SBC P7 ; (x0 + 1)
0fc1 : 85 1c __ STA ACCU + 1 
0fc3 : 05 1b __ ORA ACCU + 0 
0fc5 : d0 17 __ BNE $0fde ; (bm_scan_fill.s7 + 0)
.s15:
0fc7 : 98 __ __ TYA
0fc8 : 3d 8d 1d AND $1d8d,x ; (lmask[0] + 0)
0fcb : 85 1e __ STA ACCU + 3 
0fcd : a0 00 __ LDY #$00
.s11:
0fcf : 49 ff __ EOR #$ff
0fd1 : 31 43 __ AND (T1 + 0),y 
0fd3 : 85 1b __ STA ACCU + 0 
0fd5 : a5 17 __ LDA P10 ; (pat + 0)
0fd7 : 25 1e __ AND ACCU + 3 
0fd9 : 05 1b __ ORA ACCU + 0 
0fdb : 91 43 __ STA (T1 + 0),y 
.s3:
0fdd : 60 __ __ RTS
.s7:
0fde : 84 1e __ STY ACCU + 3 
0fe0 : bd 8d 1d LDA $1d8d,x ; (lmask[0] + 0)
0fe3 : 49 ff __ EOR #$ff
0fe5 : a0 00 __ LDY #$00
0fe7 : 31 43 __ AND (T1 + 0),y 
0fe9 : 85 1d __ STA ACCU + 2 
0feb : a5 17 __ LDA P10 ; (pat + 0)
0fed : 3d 8d 1d AND $1d8d,x ; (lmask[0] + 0)
0ff0 : 05 1d __ ORA ACCU + 2 
0ff2 : 91 43 __ STA (T1 + 0),y 
0ff4 : a5 1c __ LDA ACCU + 1 
0ff6 : d0 03 __ BNE $0ffb ; (bm_scan_fill.s14 + 0)
0ff8 : 4c 86 10 JMP $1086 ; (bm_scan_fill.s8 + 0)
.s14:
0ffb : a5 17 __ LDA P10 ; (pat + 0)
0ffd : a0 08 __ LDY #$08
0fff : 91 43 __ STA (T1 + 0),y 
1001 : a0 10 __ LDY #$10
1003 : 91 43 __ STA (T1 + 0),y 
1005 : a0 18 __ LDY #$18
1007 : 91 43 __ STA (T1 + 0),y 
1009 : a0 20 __ LDY #$20
100b : 91 43 __ STA (T1 + 0),y 
100d : a0 28 __ LDY #$28
100f : 91 43 __ STA (T1 + 0),y 
1011 : a0 30 __ LDY #$30
1013 : 91 43 __ STA (T1 + 0),y 
1015 : a0 38 __ LDY #$38
1017 : 91 43 __ STA (T1 + 0),y 
1019 : a0 40 __ LDY #$40
101b : 91 43 __ STA (T1 + 0),y 
101d : a0 48 __ LDY #$48
101f : 91 43 __ STA (T1 + 0),y 
1021 : a0 50 __ LDY #$50
1023 : 91 43 __ STA (T1 + 0),y 
1025 : a0 58 __ LDY #$58
1027 : 91 43 __ STA (T1 + 0),y 
1029 : a0 60 __ LDY #$60
102b : 91 43 __ STA (T1 + 0),y 
102d : a0 68 __ LDY #$68
102f : 91 43 __ STA (T1 + 0),y 
1031 : a0 70 __ LDY #$70
1033 : 91 43 __ STA (T1 + 0),y 
1035 : a0 78 __ LDY #$78
1037 : 91 43 __ STA (T1 + 0),y 
1039 : a0 80 __ LDY #$80
103b : 91 43 __ STA (T1 + 0),y 
103d : a0 88 __ LDY #$88
103f : 91 43 __ STA (T1 + 0),y 
1041 : a0 90 __ LDY #$90
1043 : 91 43 __ STA (T1 + 0),y 
1045 : a0 98 __ LDY #$98
1047 : 91 43 __ STA (T1 + 0),y 
1049 : a0 a0 __ LDY #$a0
104b : 91 43 __ STA (T1 + 0),y 
104d : a0 a8 __ LDY #$a8
104f : 91 43 __ STA (T1 + 0),y 
1051 : a0 b0 __ LDY #$b0
1053 : 91 43 __ STA (T1 + 0),y 
1055 : a0 b8 __ LDY #$b8
1057 : 91 43 __ STA (T1 + 0),y 
1059 : a0 c0 __ LDY #$c0
105b : 91 43 __ STA (T1 + 0),y 
105d : a0 c8 __ LDY #$c8
105f : 91 43 __ STA (T1 + 0),y 
1061 : a0 d0 __ LDY #$d0
1063 : 91 43 __ STA (T1 + 0),y 
1065 : a0 d8 __ LDY #$d8
1067 : 91 43 __ STA (T1 + 0),y 
1069 : a0 e0 __ LDY #$e0
106b : 91 43 __ STA (T1 + 0),y 
106d : a0 e8 __ LDY #$e8
106f : 91 43 __ STA (T1 + 0),y 
1071 : a0 f0 __ LDY #$f0
1073 : 91 43 __ STA (T1 + 0),y 
1075 : a0 f8 __ LDY #$f8
1077 : 91 43 __ STA (T1 + 0),y 
1079 : 38 __ __ SEC
107a : a5 1b __ LDA ACCU + 0 
107c : e9 f8 __ SBC #$f8
107e : 85 1b __ STA ACCU + 0 
1080 : e6 44 __ INC T1 + 1 
1082 : a9 00 __ LDA #$00
1084 : f0 48 __ BEQ $10ce ; (bm_scan_fill.s28 + 0)
.s8:
1086 : 24 1b __ BIT ACCU + 0 
1088 : 30 04 __ BMI $108e ; (bm_scan_fill.s13 + 0)
.s9:
108a : a9 08 __ LDA #$08
108c : d0 40 __ BNE $10ce ; (bm_scan_fill.s28 + 0)
.s13:
108e : a5 17 __ LDA P10 ; (pat + 0)
1090 : a0 08 __ LDY #$08
1092 : 91 43 __ STA (T1 + 0),y 
1094 : a0 10 __ LDY #$10
1096 : 91 43 __ STA (T1 + 0),y 
1098 : a0 18 __ LDY #$18
109a : 91 43 __ STA (T1 + 0),y 
109c : a0 20 __ LDY #$20
109e : 91 43 __ STA (T1 + 0),y 
10a0 : a0 28 __ LDY #$28
10a2 : 91 43 __ STA (T1 + 0),y 
10a4 : a0 30 __ LDY #$30
10a6 : 91 43 __ STA (T1 + 0),y 
10a8 : a0 38 __ LDY #$38
10aa : 91 43 __ STA (T1 + 0),y 
10ac : a0 40 __ LDY #$40
10ae : 91 43 __ STA (T1 + 0),y 
10b0 : a0 48 __ LDY #$48
10b2 : 91 43 __ STA (T1 + 0),y 
10b4 : a0 50 __ LDY #$50
10b6 : 91 43 __ STA (T1 + 0),y 
10b8 : a0 58 __ LDY #$58
10ba : 91 43 __ STA (T1 + 0),y 
10bc : a0 60 __ LDY #$60
10be : 91 43 __ STA (T1 + 0),y 
10c0 : a0 68 __ LDY #$68
10c2 : 91 43 __ STA (T1 + 0),y 
10c4 : a0 70 __ LDY #$70
10c6 : 91 43 __ STA (T1 + 0),y 
10c8 : a0 78 __ LDY #$78
10ca : 91 43 __ STA (T1 + 0),y 
10cc : a9 80 __ LDA #$80
.s28:
10ce : a6 17 __ LDX P10 ; (pat + 0)
10d0 : 4c d9 10 JMP $10d9 ; (bm_scan_fill.l10 + 0)
.s12:
10d3 : 8a __ __ TXA
10d4 : 91 43 __ STA (T1 + 0),y 
10d6 : 98 __ __ TYA
10d7 : 69 08 __ ADC #$08
.l10:
10d9 : a8 __ __ TAY
10da : c4 1b __ CPY ACCU + 0 
10dc : 90 f5 __ BCC $10d3 ; (bm_scan_fill.s12 + 0)
.s29:
10de : a5 1e __ LDA ACCU + 3 
10e0 : 4c cf 0f JMP $0fcf ; (bm_scan_fill.s11 + 0)
.s18:
10e3 : 85 15 __ STA P8 ; (x1 + 0)
10e5 : a5 10 __ LDA P3 ; (right + 1)
10e7 : 85 16 __ STA P9 ; (x1 + 1)
10e9 : a5 14 __ LDA P7 ; (x0 + 1)
10eb : c5 10 __ CMP P3 ; (right + 1)
10ed : f0 03 __ BEQ $10f2 ; (bm_scan_fill.s19 + 0)
10ef : 4c 95 0f JMP $0f95 ; (bm_scan_fill.s20 + 0)
.s19:
10f2 : a5 13 __ LDA P6 ; (x0 + 0)
10f4 : c5 0f __ CMP P2 ; (right + 0)
10f6 : 4c 95 0f JMP $0f95 ; (bm_scan_fill.s20 + 0)
.s22:
10f9 : 90 03 __ BCC $10fe ; (bm_scan_fill.s30 + 0)
10fb : 4c 8b 0f JMP $0f8b ; (bm_scan_fill.s17 + 0)
.s30:
10fe : a5 0f __ LDA P2 ; (right + 0)
1100 : 90 e1 __ BCC $10e3 ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
1102 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
bm_bitblit: ; bm_bitblit(const struct Bitmap*,const struct ClipRect*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 135, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
110a : ad ed 9f LDA $9fed ; (sstack + 18)
110d : 85 43 __ STA T0 + 0 
110f : ad ee 9f LDA $9fee ; (sstack + 19)
1112 : 85 44 __ STA T0 + 1 
1114 : ad ef 9f LDA $9fef ; (sstack + 20)
1117 : 38 __ __ SEC
1118 : a0 00 __ LDY #$00
111a : f1 43 __ SBC (T0 + 0),y 
111c : 85 45 __ STA T1 + 0 
111e : ad f0 9f LDA $9ff0 ; (sstack + 21)
1121 : c8 __ __ INY
1122 : f1 43 __ SBC (T0 + 0),y 
1124 : 10 35 __ BPL $115b ; (bm_bitblit.s5 + 0)
.s16:
1126 : 85 46 __ STA T1 + 1 
1128 : ad ef 9f LDA $9fef ; (sstack + 20)
112b : 38 __ __ SEC
112c : e5 45 __ SBC T1 + 0 
112e : 8d ef 9f STA $9fef ; (sstack + 20)
1131 : ad f0 9f LDA $9ff0 ; (sstack + 21)
1134 : e5 46 __ SBC T1 + 1 
1136 : 8d f0 9f STA $9ff0 ; (sstack + 21)
1139 : ad f5 9f LDA $9ff5 ; (sstack + 26)
113c : 38 __ __ SEC
113d : e5 45 __ SBC T1 + 0 
113f : 8d f5 9f STA $9ff5 ; (sstack + 26)
1142 : ad f6 9f LDA $9ff6 ; (sstack + 27)
1145 : e5 46 __ SBC T1 + 1 
1147 : 8d f6 9f STA $9ff6 ; (sstack + 27)
114a : ad f9 9f LDA $9ff9 ; (sstack + 30)
114d : 18 __ __ CLC
114e : 65 45 __ ADC T1 + 0 
1150 : 8d f9 9f STA $9ff9 ; (sstack + 30)
1153 : ad fa 9f LDA $9ffa ; (sstack + 31)
1156 : 65 46 __ ADC T1 + 1 
1158 : 8d fa 9f STA $9ffa ; (sstack + 31)
.s5:
115b : ad f1 9f LDA $9ff1 ; (sstack + 22)
115e : 38 __ __ SEC
115f : a0 02 __ LDY #$02
1161 : f1 43 __ SBC (T0 + 0),y 
1163 : 85 47 __ STA T2 + 0 
1165 : ad f2 9f LDA $9ff2 ; (sstack + 23)
1168 : c8 __ __ INY
1169 : f1 43 __ SBC (T0 + 0),y 
116b : 10 35 __ BPL $11a2 ; (bm_bitblit.s6 + 0)
.s15:
116d : 85 48 __ STA T2 + 1 
116f : ad f1 9f LDA $9ff1 ; (sstack + 22)
1172 : 38 __ __ SEC
1173 : e5 47 __ SBC T2 + 0 
1175 : 8d f1 9f STA $9ff1 ; (sstack + 22)
1178 : ad f2 9f LDA $9ff2 ; (sstack + 23)
117b : e5 48 __ SBC T2 + 1 
117d : 8d f2 9f STA $9ff2 ; (sstack + 23)
1180 : ad f7 9f LDA $9ff7 ; (sstack + 28)
1183 : 38 __ __ SEC
1184 : e5 47 __ SBC T2 + 0 
1186 : 8d f7 9f STA $9ff7 ; (sstack + 28)
1189 : ad f8 9f LDA $9ff8 ; (sstack + 29)
118c : e5 48 __ SBC T2 + 1 
118e : 8d f8 9f STA $9ff8 ; (sstack + 29)
1191 : ad fb 9f LDA $9ffb ; (sstack + 32)
1194 : 18 __ __ CLC
1195 : 65 47 __ ADC T2 + 0 
1197 : 8d fb 9f STA $9ffb ; (sstack + 32)
119a : ad fc 9f LDA $9ffc ; (sstack + 33)
119d : 65 48 __ ADC T2 + 1 
119f : 8d fc 9f STA $9ffc ; (sstack + 33)
.s6:
11a2 : a0 04 __ LDY #$04
11a4 : b1 43 __ LDA (T0 + 0),y 
11a6 : 38 __ __ SEC
11a7 : ed ef 9f SBC $9fef ; (sstack + 20)
11aa : aa __ __ TAX
11ab : c8 __ __ INY
11ac : b1 43 __ LDA (T0 + 0),y 
11ae : ed f0 9f SBC $9ff0 ; (sstack + 21)
11b1 : a8 __ __ TAY
11b2 : 8a __ __ TXA
11b3 : 38 __ __ SEC
11b4 : ed f9 9f SBC $9ff9 ; (sstack + 30)
11b7 : 85 45 __ STA T1 + 0 
11b9 : 98 __ __ TYA
11ba : ed fa 9f SBC $9ffa ; (sstack + 31)
11bd : 10 11 __ BPL $11d0 ; (bm_bitblit.s7 + 0)
.s14:
11bf : aa __ __ TAX
11c0 : ad f9 9f LDA $9ff9 ; (sstack + 30)
11c3 : 18 __ __ CLC
11c4 : 65 45 __ ADC T1 + 0 
11c6 : 8d f9 9f STA $9ff9 ; (sstack + 30)
11c9 : 8a __ __ TXA
11ca : 6d fa 9f ADC $9ffa ; (sstack + 31)
11cd : 8d fa 9f STA $9ffa ; (sstack + 31)
.s7:
11d0 : a0 07 __ LDY #$07
11d2 : b1 43 __ LDA (T0 + 0),y 
11d4 : 85 1c __ STA ACCU + 1 
11d6 : 38 __ __ SEC
11d7 : 88 __ __ DEY
11d8 : b1 43 __ LDA (T0 + 0),y 
11da : 85 1b __ STA ACCU + 0 
11dc : ed f1 9f SBC $9ff1 ; (sstack + 22)
11df : a8 __ __ TAY
11e0 : a5 1c __ LDA ACCU + 1 
11e2 : ed f2 9f SBC $9ff2 ; (sstack + 23)
11e5 : aa __ __ TAX
11e6 : 98 __ __ TYA
11e7 : 38 __ __ SEC
11e8 : ed fb 9f SBC $9ffb ; (sstack + 32)
11eb : 85 43 __ STA T0 + 0 
11ed : 8a __ __ TXA
11ee : ed fc 9f SBC $9ffc ; (sstack + 33)
11f1 : 10 11 __ BPL $1204 ; (bm_bitblit.s8 + 0)
.s13:
11f3 : aa __ __ TAX
11f4 : ad fb 9f LDA $9ffb ; (sstack + 32)
11f7 : 18 __ __ CLC
11f8 : 65 43 __ ADC T0 + 0 
11fa : 8d fb 9f STA $9ffb ; (sstack + 32)
11fd : 8a __ __ TXA
11fe : 6d fc 9f ADC $9ffc ; (sstack + 33)
1201 : 8d fc 9f STA $9ffc ; (sstack + 33)
.s8:
1204 : ad fa 9f LDA $9ffa ; (sstack + 31)
1207 : 30 0f __ BMI $1218 ; (bm_bitblit.s3 + 0)
.s12:
1209 : 0d f9 9f ORA $9ff9 ; (sstack + 30)
120c : f0 0a __ BEQ $1218 ; (bm_bitblit.s3 + 0)
.s9:
120e : ad fc 9f LDA $9ffc ; (sstack + 33)
1211 : 30 05 __ BMI $1218 ; (bm_bitblit.s3 + 0)
.s11:
1213 : 0d fb 9f ORA $9ffb ; (sstack + 32)
1216 : d0 01 __ BNE $1219 ; (bm_bitblit.s10 + 0)
.s3:
1218 : 60 __ __ RTS
.s10:
1219 : ad eb 9f LDA $9feb ; (sstack + 16)
121c : 85 16 __ STA P9 
121e : ad ec 9f LDA $9fec ; (sstack + 17)
1221 : 85 17 __ STA P10 
1223 : ad ff 9f LDA $9fff ; (sstack + 36)
1226 : 85 18 __ STA P11 
1228 : ad ef 9f LDA $9fef ; (sstack + 20)
122b : 8d db 9f STA $9fdb ; (sstack + 0)
122e : ad f0 9f LDA $9ff0 ; (sstack + 21)
1231 : 8d dc 9f STA $9fdc ; (sstack + 1)
1234 : ad f1 9f LDA $9ff1 ; (sstack + 22)
1237 : 8d dd 9f STA $9fdd ; (sstack + 2)
123a : ad f2 9f LDA $9ff2 ; (sstack + 23)
123d : 8d de 9f STA $9fde ; (sstack + 3)
1240 : ad f3 9f LDA $9ff3 ; (sstack + 24)
1243 : 8d df 9f STA $9fdf ; (sstack + 4)
1246 : ad f4 9f LDA $9ff4 ; (sstack + 25)
1249 : 8d e0 9f STA $9fe0 ; (sstack + 5)
124c : ad f5 9f LDA $9ff5 ; (sstack + 26)
124f : 8d e1 9f STA $9fe1 ; (sstack + 6)
1252 : ad f6 9f LDA $9ff6 ; (sstack + 27)
1255 : 8d e2 9f STA $9fe2 ; (sstack + 7)
1258 : ad f7 9f LDA $9ff7 ; (sstack + 28)
125b : 8d e3 9f STA $9fe3 ; (sstack + 8)
125e : ad f8 9f LDA $9ff8 ; (sstack + 29)
1261 : 8d e4 9f STA $9fe4 ; (sstack + 9)
1264 : ad f9 9f LDA $9ff9 ; (sstack + 30)
1267 : 8d e5 9f STA $9fe5 ; (sstack + 10)
126a : ad fa 9f LDA $9ffa ; (sstack + 31)
126d : 8d e6 9f STA $9fe6 ; (sstack + 11)
1270 : ad fb 9f LDA $9ffb ; (sstack + 32)
1273 : 8d e7 9f STA $9fe7 ; (sstack + 12)
1276 : ad fc 9f LDA $9ffc ; (sstack + 33)
1279 : 8d e8 9f STA $9fe8 ; (sstack + 13)
127c : ad fd 9f LDA $9ffd ; (sstack + 34)
127f : 8d e9 9f STA $9fe9 ; (sstack + 14)
1282 : ad fe 9f LDA $9ffe ; (sstack + 35)
1285 : 8d ea 9f STA $9fea ; (sstack + 15)
1288 : 4c 8b 12 JMP $128b ; (bmu_bitblit.s1 + 0)
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
128b : a5 53 __ LDA T6 + 0 
128d : 8d d5 9f STA $9fd5 ; (bmu_bitblit@stack + 0)
1290 : a5 54 __ LDA T6 + 1 
1292 : 8d d6 9f STA $9fd6 ; (bmu_bitblit@stack + 1)
1295 : a5 55 __ LDA T8 + 0 
1297 : 8d d7 9f STA $9fd7 ; (bmu_bitblit@stack + 2)
.s4:
129a : ad db 9f LDA $9fdb ; (sstack + 0)
129d : 85 4e __ STA T2 + 0 
129f : 18 __ __ CLC
12a0 : 6d e5 9f ADC $9fe5 ; (sstack + 10)
12a3 : 85 45 __ STA T1 + 0 
12a5 : 29 07 __ AND #$07
12a7 : aa __ __ TAX
12a8 : bd 95 1d LDA $1d95,x ; (rmask[0] + 0)
12ab : 85 13 __ STA P6 
12ad : ad e6 9f LDA $9fe6 ; (sstack + 11)
12b0 : 6d dc 9f ADC $9fdc ; (sstack + 1)
12b3 : 4a __ __ LSR
12b4 : 66 45 __ ROR T1 + 0 
12b6 : 4a __ __ LSR
12b7 : 66 45 __ ROR T1 + 0 
12b9 : 4a __ __ LSR
12ba : 66 45 __ ROR T1 + 0 
12bc : ad dc 9f LDA $9fdc ; (sstack + 1)
12bf : 4a __ __ LSR
12c0 : 66 4e __ ROR T2 + 0 
12c2 : 4a __ __ LSR
12c3 : 66 4e __ ROR T2 + 0 
12c5 : 4a __ __ LSR
12c6 : 66 4e __ ROR T2 + 0 
12c8 : 38 __ __ SEC
12c9 : a5 45 __ LDA T1 + 0 
12cb : e5 4e __ SBC T2 + 0 
12cd : 85 11 __ STA P4 
12cf : ad db 9f LDA $9fdb ; (sstack + 0)
12d2 : 29 07 __ AND #$07
12d4 : 85 4e __ STA T2 + 0 
12d6 : aa __ __ TAX
12d7 : bd 8d 1d LDA $1d8d,x ; (lmask[0] + 0)
12da : 85 4c __ STA T10 + 0 
12dc : 85 12 __ STA P5 
12de : ad df 9f LDA $9fdf ; (sstack + 4)
12e1 : 85 49 __ STA T4 + 0 
12e3 : ad e0 9f LDA $9fe0 ; (sstack + 5)
12e6 : 85 4a __ STA T4 + 1 
12e8 : a5 16 __ LDA P9 ; (dbm + 0)
12ea : c5 49 __ CMP T4 + 0 
12ec : d0 78 __ BNE $1366 ; (bmu_bitblit.s5 + 0)
.s52:
12ee : a5 17 __ LDA P10 ; (dbm + 1)
12f0 : c5 4a __ CMP T4 + 1 
12f2 : d0 72 __ BNE $1366 ; (bmu_bitblit.s5 + 0)
.s38:
12f4 : ad e4 9f LDA $9fe4 ; (sstack + 9)
12f7 : cd de 9f CMP $9fde ; (sstack + 3)
12fa : d0 0a __ BNE $1306 ; (bmu_bitblit.s51 + 0)
.s48:
12fc : ad e3 9f LDA $9fe3 ; (sstack + 8)
12ff : cd dd 9f CMP $9fdd ; (sstack + 2)
.s49:
1302 : b0 09 __ BCS $130d ; (bmu_bitblit.s39 + 0)
1304 : 90 30 __ BCC $1336 ; (bmu_bitblit.s41 + 0)
.s51:
1306 : 4d de 9f EOR $9fde ; (sstack + 3)
1309 : 10 f7 __ BPL $1302 ; (bmu_bitblit.s49 + 0)
.s50:
130b : b0 29 __ BCS $1336 ; (bmu_bitblit.s41 + 0)
.s39:
130d : ad de 9f LDA $9fde ; (sstack + 3)
1310 : cd e4 9f CMP $9fe4 ; (sstack + 9)
1313 : d0 51 __ BNE $1366 ; (bmu_bitblit.s5 + 0)
.s47:
1315 : ad dd 9f LDA $9fdd ; (sstack + 2)
1318 : cd e3 9f CMP $9fe3 ; (sstack + 8)
131b : d0 49 __ BNE $1366 ; (bmu_bitblit.s5 + 0)
.s40:
131d : ad e2 9f LDA $9fe2 ; (sstack + 7)
1320 : cd dc 9f CMP $9fdc ; (sstack + 1)
1323 : d0 0a __ BNE $132f ; (bmu_bitblit.s46 + 0)
.s43:
1325 : ad e1 9f LDA $9fe1 ; (sstack + 6)
1328 : cd db 9f CMP $9fdb ; (sstack + 0)
.s44:
132b : 90 09 __ BCC $1336 ; (bmu_bitblit.s41 + 0)
132d : b0 37 __ BCS $1366 ; (bmu_bitblit.s5 + 0)
.s46:
132f : 4d dc 9f EOR $9fdc ; (sstack + 1)
1332 : 10 f7 __ BPL $132b ; (bmu_bitblit.s44 + 0)
.s45:
1334 : 90 30 __ BCC $1366 ; (bmu_bitblit.s5 + 0)
.s41:
1336 : a5 18 __ LDA P11 ; (op + 0)
1338 : 29 08 __ AND #$08
133a : f0 2a __ BEQ $1366 ; (bmu_bitblit.s5 + 0)
.s42:
133c : ad e7 9f LDA $9fe7 ; (sstack + 12)
133f : 18 __ __ CLC
1340 : 6d e3 9f ADC $9fe3 ; (sstack + 8)
1343 : 8d e3 9f STA $9fe3 ; (sstack + 8)
1346 : ad e8 9f LDA $9fe8 ; (sstack + 13)
1349 : 6d e4 9f ADC $9fe4 ; (sstack + 9)
134c : 8d e4 9f STA $9fe4 ; (sstack + 9)
134f : ad e7 9f LDA $9fe7 ; (sstack + 12)
1352 : 18 __ __ CLC
1353 : 6d dd 9f ADC $9fdd ; (sstack + 2)
1356 : 8d dd 9f STA $9fdd ; (sstack + 2)
1359 : ad e8 9f LDA $9fe8 ; (sstack + 13)
135c : 6d de 9f ADC $9fde ; (sstack + 3)
135f : 8d de 9f STA $9fde ; (sstack + 3)
1362 : a9 01 __ LDA #$01
1364 : d0 02 __ BNE $1368 ; (bmu_bitblit.s6 + 0)
.s5:
1366 : a9 00 __ LDA #$00
.s6:
1368 : 85 15 __ STA P8 
136a : ad de 9f LDA $9fde ; (sstack + 3)
136d : 85 1c __ STA ACCU + 1 ; (dy + 1)
136f : ad dd 9f LDA $9fdd ; (sstack + 2)
1372 : 29 f8 __ AND #$f8
1374 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1376 : a0 04 __ LDY #$04
1378 : b1 16 __ LDA (P9),y ; (dbm + 0)
137a : 85 52 __ STA T7 + 0 
137c : 20 44 1c JSR $1c44 ; (mul16by8 + 0)
137f : a0 00 __ LDY #$00
1381 : b1 16 __ LDA (P9),y ; (dbm + 0)
1383 : 18 __ __ CLC
1384 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1386 : 85 02 __ STA $02 
1388 : c8 __ __ INY
1389 : b1 16 __ LDA (P9),y ; (dbm + 0)
138b : 65 1c __ ADC ACCU + 1 ; (dy + 1)
138d : aa __ __ TAX
138e : ad db 9f LDA $9fdb ; (sstack + 0)
1391 : 29 f8 __ AND #$f8
1393 : 18 __ __ CLC
1394 : 65 02 __ ADC $02 
1396 : 85 47 __ STA T3 + 0 
1398 : 8a __ __ TXA
1399 : 6d dc 9f ADC $9fdc ; (sstack + 1)
139c : aa __ __ TAX
139d : ad dd 9f LDA $9fdd ; (sstack + 2)
13a0 : 29 07 __ AND #$07
13a2 : 18 __ __ CLC
13a3 : 65 47 __ ADC T3 + 0 
13a5 : 85 53 __ STA T6 + 0 
13a7 : 90 01 __ BCC $13aa ; (bmu_bitblit.s54 + 0)
.s53:
13a9 : e8 __ __ INX
.s54:
13aa : 86 54 __ STX T6 + 1 
13ac : ad e4 9f LDA $9fe4 ; (sstack + 9)
13af : 85 1c __ STA ACCU + 1 ; (dy + 1)
13b1 : ad e3 9f LDA $9fe3 ; (sstack + 8)
13b4 : 29 f8 __ AND #$f8
13b6 : 85 1b __ STA ACCU + 0 ; (dy + 0)
13b8 : a0 04 __ LDY #$04
13ba : b1 49 __ LDA (T4 + 0),y 
13bc : 85 55 __ STA T8 + 0 
13be : 20 44 1c JSR $1c44 ; (mul16by8 + 0)
13c1 : a0 00 __ LDY #$00
13c3 : b1 49 __ LDA (T4 + 0),y 
13c5 : 18 __ __ CLC
13c6 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
13c8 : 85 02 __ STA $02 
13ca : c8 __ __ INY
13cb : b1 49 __ LDA (T4 + 0),y 
13cd : 65 1c __ ADC ACCU + 1 ; (dy + 1)
13cf : aa __ __ TAX
13d0 : ad e1 9f LDA $9fe1 ; (sstack + 6)
13d3 : 29 f8 __ AND #$f8
13d5 : 18 __ __ CLC
13d6 : 65 02 __ ADC $02 
13d8 : 85 49 __ STA T4 + 0 
13da : 8a __ __ TXA
13db : 6d e2 9f ADC $9fe2 ; (sstack + 7)
13de : aa __ __ TAX
13df : ad e3 9f LDA $9fe3 ; (sstack + 8)
13e2 : 29 07 __ AND #$07
13e4 : 18 __ __ CLC
13e5 : 65 49 __ ADC T4 + 0 
13e7 : 85 49 __ STA T4 + 0 
13e9 : 90 01 __ BCC $13ec ; (bmu_bitblit.s56 + 0)
.s55:
13eb : e8 __ __ INX
.s56:
13ec : ad e1 9f LDA $9fe1 ; (sstack + 6)
13ef : 29 07 __ AND #$07
13f1 : 49 ff __ EOR #$ff
13f3 : 38 __ __ SEC
13f4 : 65 4e __ ADC T2 + 0 
13f6 : 85 43 __ STA T0 + 0 
13f8 : 29 07 __ AND #$07
13fa : 85 10 __ STA P3 
13fc : a5 15 __ LDA P8 
13fe : f0 03 __ BEQ $1403 ; (bmu_bitblit.s7 + 0)
1400 : 4c f2 15 JMP $15f2 ; (bmu_bitblit.s36 + 0)
.s7:
1403 : 86 51 __ STX T5 + 1 
1405 : a4 49 __ LDY T4 + 0 
1407 : 84 50 __ STY T5 + 0 
1409 : a5 43 __ LDA T0 + 0 
140b : f0 0d __ BEQ $141a ; (bmu_bitblit.s8 + 0)
.s34:
140d : 30 0b __ BMI $141a ; (bmu_bitblit.s8 + 0)
.s35:
140f : 98 __ __ TYA
1410 : 18 __ __ CLC
1411 : 69 f8 __ ADC #$f8
1413 : 85 50 __ STA T5 + 0 
1415 : 8a __ __ TXA
1416 : 69 ff __ ADC #$ff
1418 : 85 51 __ STA T5 + 1 
.s8:
141a : a5 18 __ LDA P11 ; (op + 0)
141c : 85 14 __ STA P7 
141e : 20 3d 16 JSR $163d ; (builddop.s4 + 0)
1421 : 18 __ __ CLC
1422 : a5 52 __ LDA T7 + 0 
1424 : 69 ff __ ADC #$ff
1426 : 2a __ __ ROL
1427 : 2a __ __ ROL
1428 : 2a __ __ ROL
1429 : aa __ __ TAX
142a : 29 f8 __ AND #$f8
142c : 85 43 __ STA T0 + 0 
142e : 8a __ __ TXA
142f : 29 07 __ AND #$07
1431 : 2a __ __ ROL
1432 : 69 f8 __ ADC #$f8
1434 : 85 44 __ STA T0 + 1 
1436 : ad e9 9f LDA $9fe9 ; (sstack + 14)
1439 : 85 45 __ STA T1 + 0 
143b : 85 47 __ STA T3 + 0 
143d : ad ea 9f LDA $9fea ; (sstack + 15)
1440 : 85 46 __ STA T1 + 1 
1442 : a5 18 __ LDA P11 ; (op + 0)
1444 : 29 08 __ AND #$08
1446 : f0 03 __ BEQ $144b ; (bmu_bitblit.s9 + 0)
1448 : 4c e5 14 JMP $14e5 ; (bmu_bitblit.s19 + 0)
.s9:
144b : ad e7 9f LDA $9fe7 ; (sstack + 12)
144e : 85 47 __ STA T3 + 0 
1450 : a5 18 __ LDA P11 ; (op + 0)
1452 : 29 20 __ AND #$20
1454 : d0 4c __ BNE $14a2 ; (bmu_bitblit.s15 + 0)
.s10:
1456 : a5 47 __ LDA T3 + 0 
1458 : f0 38 __ BEQ $1492 ; (bmu_bitblit.s3 + 0)
.s11:
145a : a9 00 __ LDA #$00
145c : 85 4e __ STA T2 + 0 
.l12:
145e : a5 53 __ LDA T6 + 0 
1460 : 85 03 __ STA WORK + 0 
1462 : a5 54 __ LDA T6 + 1 
1464 : 85 04 __ STA WORK + 1 
1466 : a5 53 __ LDA T6 + 0 
1468 : 85 05 __ STA WORK + 2 
146a : a5 54 __ LDA T6 + 1 
146c : 85 06 __ STA WORK + 3 
146e : a5 4e __ LDA T2 + 0 
1470 : 85 07 __ STA WORK + 4 
1472 : 20 00 1e JSR $1e00 ; (BLIT_CODE[0] + 0)
1475 : e6 53 __ INC T6 + 0 
1477 : d0 02 __ BNE $147b ; (bmu_bitblit.s69 + 0)
.s68:
1479 : e6 54 __ INC T6 + 1 
.s69:
147b : a5 53 __ LDA T6 + 0 
147d : 29 07 __ AND #$07
147f : d0 0d __ BNE $148e ; (bmu_bitblit.s13 + 0)
.s14:
1481 : 18 __ __ CLC
1482 : a5 53 __ LDA T6 + 0 
1484 : 65 43 __ ADC T0 + 0 
1486 : 85 53 __ STA T6 + 0 
1488 : a5 54 __ LDA T6 + 1 
148a : 65 44 __ ADC T0 + 1 
148c : 85 54 __ STA T6 + 1 
.s13:
148e : c6 47 __ DEC T3 + 0 
1490 : d0 cc __ BNE $145e ; (bmu_bitblit.l12 + 0)
.s3:
1492 : ad d5 9f LDA $9fd5 ; (bmu_bitblit@stack + 0)
1495 : 85 53 __ STA T6 + 0 
1497 : ad d6 9f LDA $9fd6 ; (bmu_bitblit@stack + 1)
149a : 85 54 __ STA T6 + 1 
149c : ad d7 9f LDA $9fd7 ; (bmu_bitblit@stack + 2)
149f : 85 55 __ STA T8 + 0 
14a1 : 60 __ __ RTS
.s15:
14a2 : a5 47 __ LDA T3 + 0 
14a4 : f0 ec __ BEQ $1492 ; (bmu_bitblit.s3 + 0)
.l16:
14a6 : a5 53 __ LDA T6 + 0 
14a8 : 29 07 __ AND #$07
14aa : a8 __ __ TAY
14ab : b1 45 __ LDA (T1 + 0),y 
14ad : 85 4e __ STA T2 + 0 
14af : a5 53 __ LDA T6 + 0 
14b1 : 85 03 __ STA WORK + 0 
14b3 : a5 54 __ LDA T6 + 1 
14b5 : 85 04 __ STA WORK + 1 
14b7 : a5 53 __ LDA T6 + 0 
14b9 : 85 05 __ STA WORK + 2 
14bb : a5 54 __ LDA T6 + 1 
14bd : 85 06 __ STA WORK + 3 
14bf : a5 4e __ LDA T2 + 0 
14c1 : 85 07 __ STA WORK + 4 
14c3 : 20 00 1e JSR $1e00 ; (BLIT_CODE[0] + 0)
14c6 : e6 53 __ INC T6 + 0 
14c8 : d0 02 __ BNE $14cc ; (bmu_bitblit.s67 + 0)
.s66:
14ca : e6 54 __ INC T6 + 1 
.s67:
14cc : a5 53 __ LDA T6 + 0 
14ce : 29 07 __ AND #$07
14d0 : d0 0d __ BNE $14df ; (bmu_bitblit.s17 + 0)
.s18:
14d2 : 18 __ __ CLC
14d3 : a5 53 __ LDA T6 + 0 
14d5 : 65 43 __ ADC T0 + 0 
14d7 : 85 53 __ STA T6 + 0 
14d9 : a5 54 __ LDA T6 + 1 
14db : 65 44 __ ADC T0 + 1 
14dd : 85 54 __ STA T6 + 1 
.s17:
14df : c6 47 __ DEC T3 + 0 
14e1 : d0 c3 __ BNE $14a6 ; (bmu_bitblit.l16 + 0)
14e3 : f0 ad __ BEQ $1492 ; (bmu_bitblit.s3 + 0)
.s19:
14e5 : 18 __ __ CLC
14e6 : a5 55 __ LDA T8 + 0 
14e8 : 69 ff __ ADC #$ff
14ea : 2a __ __ ROL
14eb : 2a __ __ ROL
14ec : 2a __ __ ROL
14ed : aa __ __ TAX
14ee : 29 f8 __ AND #$f8
14f0 : 85 4e __ STA T2 + 0 
14f2 : 8a __ __ TXA
14f3 : 29 07 __ AND #$07
14f5 : 2a __ __ ROL
14f6 : 69 f8 __ ADC #$f8
14f8 : 85 4f __ STA T2 + 1 
14fa : a5 46 __ LDA T1 + 1 
14fc : 85 48 __ STA T3 + 1 
14fe : 05 45 __ ORA T1 + 0 
1500 : d0 08 __ BNE $150a ; (bmu_bitblit.s21 + 0)
.s20:
1502 : a5 50 __ LDA T5 + 0 
1504 : 85 47 __ STA T3 + 0 
1506 : a5 51 __ LDA T5 + 1 
1508 : 85 48 __ STA T3 + 1 
.s21:
150a : ad e7 9f LDA $9fe7 ; (sstack + 12)
150d : 85 45 __ STA T1 + 0 
150f : a5 15 __ LDA P8 
1511 : d0 03 __ BNE $1516 ; (bmu_bitblit.s28 + 0)
1513 : 4c 95 15 JMP $1595 ; (bmu_bitblit.s22 + 0)
.s28:
1516 : 38 __ __ SEC
1517 : a9 00 __ LDA #$00
1519 : e5 43 __ SBC T0 + 0 
151b : 85 43 __ STA T0 + 0 
151d : a9 00 __ LDA #$00
151f : e5 44 __ SBC T0 + 1 
1521 : 85 44 __ STA T0 + 1 
1523 : 38 __ __ SEC
1524 : a9 00 __ LDA #$00
1526 : e5 4e __ SBC T2 + 0 
1528 : 85 4e __ STA T2 + 0 
152a : a9 00 __ LDA #$00
152c : e5 4f __ SBC T2 + 1 
152e : 85 4f __ STA T2 + 1 
1530 : a5 45 __ LDA T1 + 0 
1532 : d0 03 __ BNE $1537 ; (bmu_bitblit.l29 + 0)
1534 : 4c 92 14 JMP $1492 ; (bmu_bitblit.s3 + 0)
.l29:
1537 : a5 50 __ LDA T5 + 0 
1539 : 29 07 __ AND #$07
153b : d0 0d __ BNE $154a ; (bmu_bitblit.s30 + 0)
.s33:
153d : 18 __ __ CLC
153e : a5 50 __ LDA T5 + 0 
1540 : 65 4e __ ADC T2 + 0 
1542 : 85 50 __ STA T5 + 0 
1544 : a5 51 __ LDA T5 + 1 
1546 : 65 4f __ ADC T2 + 1 
1548 : 85 51 __ STA T5 + 1 
.s30:
154a : a5 53 __ LDA T6 + 0 
154c : 29 07 __ AND #$07
154e : d0 0d __ BNE $155d ; (bmu_bitblit.s31 + 0)
.s32:
1550 : 18 __ __ CLC
1551 : a5 53 __ LDA T6 + 0 
1553 : 65 43 __ ADC T0 + 0 
1555 : 85 53 __ STA T6 + 0 
1557 : a5 54 __ LDA T6 + 1 
1559 : 65 44 __ ADC T0 + 1 
155b : 85 54 __ STA T6 + 1 
.s31:
155d : 18 __ __ CLC
155e : a5 53 __ LDA T6 + 0 
1560 : 69 ff __ ADC #$ff
1562 : 85 53 __ STA T6 + 0 
1564 : 29 07 __ AND #$07
1566 : a8 __ __ TAY
1567 : b0 02 __ BCS $156b ; (bmu_bitblit.s59 + 0)
.s58:
1569 : c6 54 __ DEC T6 + 1 
.s59:
156b : b1 47 __ LDA (T3 + 0),y 
156d : 85 49 __ STA T4 + 0 
156f : a5 50 __ LDA T5 + 0 
1571 : d0 02 __ BNE $1575 ; (bmu_bitblit.s61 + 0)
.s60:
1573 : c6 51 __ DEC T5 + 1 
.s61:
1575 : c6 50 __ DEC T5 + 0 
1577 : a5 50 __ LDA T5 + 0 
1579 : 85 03 __ STA WORK + 0 
157b : a5 51 __ LDA T5 + 1 
157d : 85 04 __ STA WORK + 1 
157f : a5 53 __ LDA T6 + 0 
1581 : 85 05 __ STA WORK + 2 
1583 : a5 54 __ LDA T6 + 1 
1585 : 85 06 __ STA WORK + 3 
1587 : a5 49 __ LDA T4 + 0 
1589 : 85 07 __ STA WORK + 4 
158b : 20 00 1e JSR $1e00 ; (BLIT_CODE[0] + 0)
158e : c6 45 __ DEC T1 + 0 
1590 : d0 a5 __ BNE $1537 ; (bmu_bitblit.l29 + 0)
1592 : 4c 92 14 JMP $1492 ; (bmu_bitblit.s3 + 0)
.s22:
1595 : a5 45 __ LDA T1 + 0 
1597 : f0 f9 __ BEQ $1592 ; (bmu_bitblit.s61 + 29)
.l23:
1599 : a5 53 __ LDA T6 + 0 
159b : 29 07 __ AND #$07
159d : a8 __ __ TAY
159e : b1 47 __ LDA (T3 + 0),y 
15a0 : 85 49 __ STA T4 + 0 
15a2 : a5 50 __ LDA T5 + 0 
15a4 : 85 03 __ STA WORK + 0 
15a6 : a5 51 __ LDA T5 + 1 
15a8 : 85 04 __ STA WORK + 1 
15aa : a5 53 __ LDA T6 + 0 
15ac : 85 05 __ STA WORK + 2 
15ae : a5 54 __ LDA T6 + 1 
15b0 : 85 06 __ STA WORK + 3 
15b2 : a5 49 __ LDA T4 + 0 
15b4 : 85 07 __ STA WORK + 4 
15b6 : 20 00 1e JSR $1e00 ; (BLIT_CODE[0] + 0)
15b9 : e6 50 __ INC T5 + 0 
15bb : d0 02 __ BNE $15bf ; (bmu_bitblit.s63 + 0)
.s62:
15bd : e6 51 __ INC T5 + 1 
.s63:
15bf : a5 50 __ LDA T5 + 0 
15c1 : 29 07 __ AND #$07
15c3 : d0 0d __ BNE $15d2 ; (bmu_bitblit.s24 + 0)
.s27:
15c5 : 18 __ __ CLC
15c6 : a5 50 __ LDA T5 + 0 
15c8 : 65 4e __ ADC T2 + 0 
15ca : 85 50 __ STA T5 + 0 
15cc : a5 51 __ LDA T5 + 1 
15ce : 65 4f __ ADC T2 + 1 
15d0 : 85 51 __ STA T5 + 1 
.s24:
15d2 : e6 53 __ INC T6 + 0 
15d4 : d0 02 __ BNE $15d8 ; (bmu_bitblit.s65 + 0)
.s64:
15d6 : e6 54 __ INC T6 + 1 
.s65:
15d8 : a5 53 __ LDA T6 + 0 
15da : 29 07 __ AND #$07
15dc : d0 0d __ BNE $15eb ; (bmu_bitblit.s25 + 0)
.s26:
15de : 18 __ __ CLC
15df : a5 53 __ LDA T6 + 0 
15e1 : 65 43 __ ADC T0 + 0 
15e3 : 85 53 __ STA T6 + 0 
15e5 : a5 54 __ LDA T6 + 1 
15e7 : 65 44 __ ADC T0 + 1 
15e9 : 85 54 __ STA T6 + 1 
.s25:
15eb : c6 45 __ DEC T1 + 0 
15ed : d0 aa __ BNE $1599 ; (bmu_bitblit.l23 + 0)
15ef : 4c 92 14 JMP $1492 ; (bmu_bitblit.s3 + 0)
.s36:
15f2 : 18 __ __ CLC
15f3 : a5 11 __ LDA P4 
15f5 : 69 e1 __ ADC #$e1
15f7 : 2a __ __ ROL
15f8 : 2a __ __ ROL
15f9 : 2a __ __ ROL
15fa : a8 __ __ TAY
15fb : 29 f8 __ AND #$f8
15fd : 85 45 __ STA T1 + 0 
15ff : 98 __ __ TYA
1600 : 29 07 __ AND #$07
1602 : 2a __ __ ROL
1603 : 69 f8 __ ADC #$f8
1605 : 85 46 __ STA T1 + 1 
1607 : 18 __ __ CLC
1608 : a5 53 __ LDA T6 + 0 
160a : 65 45 __ ADC T1 + 0 
160c : 85 53 __ STA T6 + 0 
160e : a5 54 __ LDA T6 + 1 
1610 : 65 46 __ ADC T1 + 1 
1612 : 85 54 __ STA T6 + 1 
1614 : a5 13 __ LDA P6 
1616 : 85 12 __ STA P5 
1618 : a5 4c __ LDA T10 + 0 
161a : 85 13 __ STA P6 
161c : 18 __ __ CLC
161d : a5 49 __ LDA T4 + 0 
161f : 65 45 __ ADC T1 + 0 
1621 : 85 50 __ STA T5 + 0 
1623 : 8a __ __ TXA
1624 : 65 46 __ ADC T1 + 1 
1626 : 85 51 __ STA T5 + 1 
1628 : 24 43 __ BIT T0 + 0 
162a : 30 03 __ BMI $162f ; (bmu_bitblit.s37 + 0)
162c : 4c 1a 14 JMP $141a ; (bmu_bitblit.s8 + 0)
.s37:
162f : 18 __ __ CLC
1630 : a5 50 __ LDA T5 + 0 
1632 : 69 08 __ ADC #$08
1634 : 85 50 __ STA T5 + 0 
1636 : 90 f4 __ BCC $162c ; (bmu_bitblit.s36 + 58)
.s57:
1638 : e6 51 __ INC T5 + 1 
163a : 4c 1a 14 JMP $141a ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
163d : a5 15 __ LDA P8 ; (reverse + 0)
163f : f0 16 __ BEQ $1657 ; (builddop.s5 + 0)
.s48:
1641 : a9 38 __ LDA #$38
1643 : 85 48 __ STA T9 + 0 
1645 : a9 e1 __ LDA #$e1
1647 : 85 49 __ STA T10 + 0 
1649 : a9 b0 __ LDA #$b0
164b : 85 4a __ STA T11 + 0 
164d : a9 c2 __ LDA #$c2
164f : 85 4b __ STA T12 + 0 
1651 : a9 f8 __ LDA #$f8
1653 : 85 44 __ STA T3 + 0 
1655 : d0 16 __ BNE $166d ; (builddop.s6 + 0)
.s5:
1657 : a9 18 __ LDA #$18
1659 : 85 48 __ STA T9 + 0 
165b : a9 61 __ LDA #$61
165d : 85 49 __ STA T10 + 0 
165f : a9 90 __ LDA #$90
1661 : 85 4a __ STA T11 + 0 
1663 : a9 e2 __ LDA #$e2
1665 : 85 4b __ STA T12 + 0 
1667 : a9 00 __ LDA #$00
1669 : 85 44 __ STA T3 + 0 
166b : a9 08 __ LDA #$08
.s6:
166d : 85 47 __ STA T6 + 0 
166f : a5 14 __ LDA P7 ; (op + 0)
1671 : 29 08 __ AND #$08
1673 : 85 45 __ STA T4 + 0 
1675 : a5 14 __ LDA P7 ; (op + 0)
1677 : 29 10 __ AND #$10
1679 : 85 46 __ STA T5 + 0 
167b : a5 11 __ LDA P4 ; (w + 0)
167d : d0 06 __ BNE $1685 ; (builddop.s8 + 0)
.s7:
167f : a5 13 __ LDA P6 ; (rmask + 0)
1681 : 25 12 __ AND P5 ; (lmask + 0)
1683 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
1685 : a9 a0 __ LDA #$a0
1687 : 8d 00 1e STA $1e00 ; (BLIT_CODE[0] + 0)
168a : a5 44 __ LDA T3 + 0 
168c : 8d 01 1e STA $1e01 ; (BLIT_CODE[0] + 1)
168f : a9 02 __ LDA #$02
1691 : 85 43 __ STA T0 + 0 
1693 : a6 12 __ LDX P5 ; (lmask + 0)
1695 : e8 __ __ INX
1696 : d0 03 __ BNE $169b ; (builddop.s9 + 0)
1698 : 4c ce 18 JMP $18ce ; (builddop.s44 + 0)
.s9:
169b : a5 46 __ LDA T5 + 0 
169d : f0 18 __ BEQ $16b7 ; (builddop.s10 + 0)
.s43:
169f : a9 b1 __ LDA #$b1
16a1 : 8d 02 1e STA $1e02 ; (BLIT_CODE[0] + 2)
16a4 : a9 05 __ LDA #$05
16a6 : 8d 03 1e STA $1e03 ; (BLIT_CODE[0] + 3)
16a9 : a9 85 __ LDA #$85
16ab : 8d 04 1e STA $1e04 ; (BLIT_CODE[0] + 4)
16ae : a9 0a __ LDA #$0a
16b0 : 8d 05 1e STA $1e05 ; (BLIT_CODE[0] + 5)
16b3 : a9 06 __ LDA #$06
16b5 : 85 43 __ STA T0 + 0 
.s10:
16b7 : a5 45 __ LDA T4 + 0 
16b9 : d0 05 __ BNE $16c0 ; (builddop.s40 + 0)
.s11:
16bb : a5 43 __ LDA T0 + 0 
16bd : 4c 21 17 JMP $1721 ; (builddop.s52 + 0)
.s40:
16c0 : a5 10 __ LDA P3 ; (shift + 0)
16c2 : 85 0e __ STA P1 
16c4 : d0 05 __ BNE $16cb ; (builddop.s42 + 0)
.s41:
16c6 : a5 43 __ LDA T0 + 0 
16c8 : 4c 18 17 JMP $1718 ; (builddop.s51 + 0)
.s42:
16cb : a9 b1 __ LDA #$b1
16cd : a6 43 __ LDX T0 + 0 
16cf : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
16d2 : a9 03 __ LDA #$03
16d4 : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
16d7 : 9d 06 1e STA $1e06,x ; (BLIT_CODE[0] + 6)
16da : 9d 0a 1e STA $1e0a,x ; (BLIT_CODE[0] + 10)
16dd : a9 85 __ LDA #$85
16df : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
16e2 : 9d 09 1e STA $1e09,x ; (BLIT_CODE[0] + 9)
16e5 : a9 08 __ LDA #$08
16e7 : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
16ea : 9d 08 1e STA $1e08,x ; (BLIT_CODE[0] + 8)
16ed : a9 a5 __ LDA #$a5
16ef : 9d 05 1e STA $1e05,x ; (BLIT_CODE[0] + 5)
16f2 : a9 02 __ LDA #$02
16f4 : 9d 0c 1e STA $1e0c,x ; (BLIT_CODE[0] + 12)
16f7 : a9 04 __ LDA #$04
16f9 : 9d 0e 1e STA $1e0e,x ; (BLIT_CODE[0] + 14)
16fc : a5 48 __ LDA T9 + 0 
16fe : 9d 04 1e STA $1e04,x ; (BLIT_CODE[0] + 4)
1701 : a5 49 __ LDA T10 + 0 
1703 : 09 08 __ ORA #$08
1705 : 9d 07 1e STA $1e07,x ; (BLIT_CODE[0] + 7)
1708 : a5 4a __ LDA T11 + 0 
170a : 9d 0b 1e STA $1e0b,x ; (BLIT_CODE[0] + 11)
170d : a5 4b __ LDA T12 + 0 
170f : 09 04 __ ORA #$04
1711 : 9d 0d 1e STA $1e0d,x ; (BLIT_CODE[0] + 13)
1714 : 8a __ __ TXA
1715 : 18 __ __ CLC
1716 : 69 0f __ ADC #$0f
.s51:
1718 : 85 0d __ STA P0 
171a : a5 15 __ LDA P8 ; (reverse + 0)
171c : 85 0f __ STA P2 
171e : 20 2f 19 JSR $192f ; (builddop_src.s4 + 0)
.s52:
1721 : 85 0d __ STA P0 
1723 : a5 14 __ LDA P7 ; (op + 0)
1725 : 85 0e __ STA P1 
1727 : a5 12 __ LDA P5 ; (lmask + 0)
1729 : 49 ff __ EOR #$ff
172b : 85 0f __ STA P2 
172d : 20 6f 1a JSR $1a6f ; (builddop_op.s4 + 0)
1730 : 85 43 __ STA T0 + 0 
1732 : a5 11 __ LDA P4 ; (w + 0)
1734 : f0 68 __ BEQ $179e ; (builddop.s12 + 0)
.s13:
1736 : a9 a0 __ LDA #$a0
1738 : a6 43 __ LDX T0 + 0 
173a : e8 __ __ INX
173b : e8 __ __ INX
173c : 86 43 __ STX T0 + 0 
173e : 86 0d __ STX P0 
1740 : 9d fe 1d STA $1dfe,x 
1743 : 18 __ __ CLC
1744 : a5 47 __ LDA T6 + 0 
1746 : 65 44 __ ADC T3 + 0 
1748 : 85 44 __ STA T3 + 0 
174a : 9d ff 1d STA $1dff,x 
.s14:
174d : a5 11 __ LDA P4 ; (w + 0)
174f : c9 02 __ CMP #$02
1751 : b0 53 __ BCS $17a6 ; (builddop.s21 + 0)
.s15:
1753 : a5 13 __ LDA P6 ; (rmask + 0)
1755 : f0 47 __ BEQ $179e ; (builddop.s12 + 0)
.s16:
1757 : a5 46 __ LDA T5 + 0 
1759 : f0 1e __ BEQ $1779 ; (builddop.s17 + 0)
.s20:
175b : a9 b1 __ LDA #$b1
175d : a6 43 __ LDX T0 + 0 
175f : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
1762 : a9 05 __ LDA #$05
1764 : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
1767 : a9 85 __ LDA #$85
1769 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
176c : a9 0a __ LDA #$0a
176e : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
1771 : 8a __ __ TXA
1772 : 18 __ __ CLC
1773 : 69 04 __ ADC #$04
1775 : 85 43 __ STA T0 + 0 
1777 : 85 0d __ STA P0 
.s17:
1779 : a5 45 __ LDA T4 + 0 
177b : d0 05 __ BNE $1782 ; (builddop.s19 + 0)
.s18:
177d : a5 43 __ LDA T0 + 0 
177f : 4c 8d 17 JMP $178d ; (builddop.s50 + 0)
.s19:
1782 : a5 10 __ LDA P3 ; (shift + 0)
1784 : 85 0e __ STA P1 
1786 : a5 15 __ LDA P8 ; (reverse + 0)
1788 : 85 0f __ STA P2 
178a : 20 2f 19 JSR $192f ; (builddop_src.s4 + 0)
.s50:
178d : 85 0d __ STA P0 
178f : a5 14 __ LDA P7 ; (op + 0)
1791 : 85 0e __ STA P1 
1793 : a5 13 __ LDA P6 ; (rmask + 0)
1795 : 49 ff __ EOR #$ff
1797 : 85 0f __ STA P2 
1799 : 20 6f 1a JSR $1a6f ; (builddop_op.s4 + 0)
179c : 85 43 __ STA T0 + 0 
.s12:
179e : a9 60 __ LDA #$60
17a0 : a6 43 __ LDX T0 + 0 
17a2 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
.s3:
17a5 : 60 __ __ RTS
.s21:
17a6 : a9 02 __ LDA #$02
17a8 : c5 11 __ CMP P4 ; (w + 0)
17aa : a9 00 __ LDA #$00
17ac : 6a __ __ ROR
17ad : 85 4c __ STA T14 + 0 
17af : d0 19 __ BNE $17ca ; (builddop.s22 + 0)
.s39:
17b1 : a9 a2 __ LDA #$a2
17b3 : a6 43 __ LDX T0 + 0 
17b5 : e8 __ __ INX
17b6 : e8 __ __ INX
17b7 : 86 43 __ STX T0 + 0 
17b9 : 9d fe 1d STA $1dfe,x 
17bc : 38 __ __ SEC
17bd : a5 11 __ LDA P4 ; (w + 0)
17bf : e9 01 __ SBC #$01
17c1 : 9d ff 1d STA $1dff,x 
17c4 : a5 11 __ LDA P4 ; (w + 0)
17c6 : c9 20 __ CMP #$20
17c8 : b0 0d __ BCS $17d7 ; (builddop.s24 + 0)
.s22:
17ca : a5 10 __ LDA P3 ; (shift + 0)
17cc : d0 09 __ BNE $17d7 ; (builddop.s24 + 0)
.s23:
17ce : a5 48 __ LDA T9 + 0 
17d0 : a6 43 __ LDX T0 + 0 
17d2 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
17d5 : e6 43 __ INC T0 + 0 
.s24:
17d7 : a6 43 __ LDX T0 + 0 
17d9 : 86 4d __ STX T15 + 0 
17db : a5 46 __ LDA T5 + 0 
17dd : f0 1a __ BEQ $17f9 ; (builddop.s25 + 0)
.s38:
17df : a9 b1 __ LDA #$b1
17e1 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
17e4 : a9 05 __ LDA #$05
17e6 : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
17e9 : a9 85 __ LDA #$85
17eb : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
17ee : a9 0a __ LDA #$0a
17f0 : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
17f3 : 8a __ __ TXA
17f4 : 18 __ __ CLC
17f5 : 69 04 __ ADC #$04
17f7 : 85 43 __ STA T0 + 0 
.s25:
17f9 : a5 45 __ LDA T4 + 0 
17fb : d0 05 __ BNE $1802 ; (builddop.s37 + 0)
.s26:
17fd : a5 43 __ LDA T0 + 0 
17ff : 4c 11 18 JMP $1811 ; (builddop.s49 + 0)
.s37:
1802 : a5 43 __ LDA T0 + 0 
1804 : 85 0d __ STA P0 
1806 : a5 10 __ LDA P3 ; (shift + 0)
1808 : 85 0e __ STA P1 
180a : a5 15 __ LDA P8 ; (reverse + 0)
180c : 85 0f __ STA P2 
180e : 20 2f 19 JSR $192f ; (builddop_src.s4 + 0)
.s49:
1811 : 85 0d __ STA P0 
1813 : a5 14 __ LDA P7 ; (op + 0)
1815 : 85 0e __ STA P1 
1817 : a9 00 __ LDA #$00
1819 : 85 0f __ STA P2 
181b : 20 6f 1a JSR $1a6f ; (builddop_op.s4 + 0)
181e : 24 4c __ BIT T14 + 0 
1820 : 10 17 __ BPL $1839 ; (builddop.s28 + 0)
.s27:
1822 : aa __ __ TAX
1823 : e8 __ __ INX
1824 : e8 __ __ INX
1825 : 86 43 __ STX T0 + 0 
1827 : 86 0d __ STX P0 
1829 : a9 a0 __ LDA #$a0
182b : 9d fe 1d STA $1dfe,x 
182e : 18 __ __ CLC
182f : a5 47 __ LDA T6 + 0 
1831 : 65 44 __ ADC T3 + 0 
1833 : 9d ff 1d STA $1dff,x 
1836 : 4c 53 17 JMP $1753 ; (builddop.s15 + 0)
.s28:
1839 : a8 __ __ TAY
183a : a9 1f __ LDA #$1f
183c : c5 11 __ CMP P4 ; (w + 0)
183e : a9 00 __ LDA #$00
1840 : 6a __ __ ROR
1841 : 85 47 __ STA T6 + 0 
1843 : f0 04 __ BEQ $1849 ; (builddop.s36 + 0)
.s29:
1845 : a5 10 __ LDA P3 ; (shift + 0)
1847 : f0 06 __ BEQ $184f ; (builddop.s30 + 0)
.s36:
1849 : a5 48 __ LDA T9 + 0 
184b : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
184e : c8 __ __ INY
.s30:
184f : a9 98 __ LDA #$98
1851 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1854 : a9 08 __ LDA #$08
1856 : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1859 : a9 a8 __ LDA #$a8
185b : 99 03 1e STA $1e03,y ; (BLIT_CODE[0] + 3)
185e : a5 49 __ LDA T10 + 0 
1860 : 09 08 __ ORA #$08
1862 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
1865 : 98 __ __ TYA
1866 : 18 __ __ CLC
1867 : 69 04 __ ADC #$04
1869 : 85 43 __ STA T0 + 0 
186b : 24 47 __ BIT T6 + 0 
186d : 30 3a __ BMI $18a9 ; (builddop.s31 + 0)
.s32:
186f : a5 4a __ LDA T11 + 0 
1871 : 99 04 1e STA $1e04,y ; (BLIT_CODE[0] + 4)
1874 : a5 4b __ LDA T12 + 0 
1876 : 09 04 __ ORA #$04
1878 : aa __ __ TAX
1879 : a5 45 __ LDA T4 + 0 
187b : d0 0d __ BNE $188a ; (builddop.s35 + 0)
.s33:
187d : a9 02 __ LDA #$02
187f : 99 05 1e STA $1e05,y ; (BLIT_CODE[0] + 5)
1882 : 18 __ __ CLC
1883 : a5 43 __ LDA T0 + 0 
1885 : 69 02 __ ADC #$02
1887 : 4c 9b 18 JMP $189b ; (builddop.s34 + 0)
.s35:
188a : a9 04 __ LDA #$04
188c : 99 05 1e STA $1e05,y ; (BLIT_CODE[0] + 5)
188f : 99 07 1e STA $1e07,y ; (BLIT_CODE[0] + 7)
1892 : 8a __ __ TXA
1893 : 99 06 1e STA $1e06,y ; (BLIT_CODE[0] + 6)
1896 : 18 __ __ CLC
1897 : a5 43 __ LDA T0 + 0 
1899 : 69 04 __ ADC #$04
.s34:
189b : a8 __ __ TAY
189c : c8 __ __ INY
189d : c8 __ __ INY
189e : 84 43 __ STY T0 + 0 
18a0 : 8a __ __ TXA
18a1 : 99 fe 1d STA $1dfe,y 
18a4 : a9 06 __ LDA #$06
18a6 : 99 ff 1d STA $1dff,y 
.s31:
18a9 : a9 ca __ LDA #$ca
18ab : a4 43 __ LDY T0 + 0 
18ad : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
18b0 : a9 d0 __ LDA #$d0
18b2 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
18b5 : 98 __ __ TYA
18b6 : 18 __ __ CLC
18b7 : 69 01 __ ADC #$01
18b9 : aa __ __ TAX
18ba : e8 __ __ INX
18bb : e8 __ __ INX
18bc : 86 43 __ STX T0 + 0 
18be : 86 0d __ STX P0 
18c0 : 49 ff __ EOR #$ff
18c2 : 38 __ __ SEC
18c3 : 65 4d __ ADC T15 + 0 
18c5 : 38 __ __ SEC
18c6 : e9 02 __ SBC #$02
18c8 : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
18cb : 4c 53 17 JMP $1753 ; (builddop.s15 + 0)
.s44:
18ce : 85 0d __ STA P0 
18d0 : a5 45 __ LDA T4 + 0 
18d2 : f0 51 __ BEQ $1925 ; (builddop.s45 + 0)
.s46:
18d4 : a5 10 __ LDA P3 ; (shift + 0)
18d6 : f0 4d __ BEQ $1925 ; (builddop.s45 + 0)
.s47:
18d8 : a9 03 __ LDA #$03
18da : 8d 03 1e STA $1e03 ; (BLIT_CODE[0] + 3)
18dd : 8d 08 1e STA $1e08 ; (BLIT_CODE[0] + 8)
18e0 : 8d 0c 1e STA $1e0c ; (BLIT_CODE[0] + 12)
18e3 : a9 b1 __ LDA #$b1
18e5 : 8d 02 1e STA $1e02 ; (BLIT_CODE[0] + 2)
18e8 : a9 85 __ LDA #$85
18ea : 8d 04 1e STA $1e04 ; (BLIT_CODE[0] + 4)
18ed : 8d 0b 1e STA $1e0b ; (BLIT_CODE[0] + 11)
18f0 : a9 08 __ LDA #$08
18f2 : 8d 05 1e STA $1e05 ; (BLIT_CODE[0] + 5)
18f5 : 8d 0a 1e STA $1e0a ; (BLIT_CODE[0] + 10)
18f8 : a9 a5 __ LDA #$a5
18fa : 8d 07 1e STA $1e07 ; (BLIT_CODE[0] + 7)
18fd : a9 02 __ LDA #$02
18ff : 8d 0e 1e STA $1e0e ; (BLIT_CODE[0] + 14)
1902 : a9 04 __ LDA #$04
1904 : 8d 10 1e STA $1e10 ; (BLIT_CODE[0] + 16)
1907 : a5 48 __ LDA T9 + 0 
1909 : 8d 06 1e STA $1e06 ; (BLIT_CODE[0] + 6)
190c : a5 49 __ LDA T10 + 0 
190e : 09 08 __ ORA #$08
1910 : 8d 09 1e STA $1e09 ; (BLIT_CODE[0] + 9)
1913 : a5 4a __ LDA T11 + 0 
1915 : 8d 0d 1e STA $1e0d ; (BLIT_CODE[0] + 13)
1918 : a5 4b __ LDA T12 + 0 
191a : 09 04 __ ORA #$04
191c : 8d 0f 1e STA $1e0f ; (BLIT_CODE[0] + 15)
191f : a9 11 __ LDA #$11
1921 : 85 43 __ STA T0 + 0 
1923 : 85 0d __ STA P0 
.s45:
1925 : e6 11 __ INC P4 ; (w + 0)
1927 : d0 03 __ BNE $192c ; (builddop.s45 + 7)
1929 : 4c 9e 17 JMP $179e ; (builddop.s12 + 0)
192c : 4c 4d 17 JMP $174d ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
192f : a6 0d __ LDX P0 ; (ip + 0)
1931 : e8 __ __ INX
1932 : a4 0d __ LDY P0 ; (ip + 0)
1934 : e8 __ __ INX
1935 : a5 0e __ LDA P1 ; (shift + 0)
1937 : d0 0c __ BNE $1945 ; (builddop_src.s6 + 0)
.s5:
1939 : a9 b1 __ LDA #$b1
193b : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
193e : a9 03 __ LDA #$03
1940 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
1943 : 8a __ __ TXA
.s3:
1944 : 60 __ __ RTS
.s6:
1945 : a9 a5 __ LDA #$a5
1947 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
194a : a9 08 __ LDA #$08
194c : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
194f : a5 0f __ LDA P2 ; (reverse + 0)
1951 : f0 03 __ BEQ $1956 ; (builddop_src.s7 + 0)
1953 : 4c 61 1a JMP $1a61 ; (builddop_src.s26 + 0)
.s7:
1956 : a5 0e __ LDA P1 ; (shift + 0)
1958 : c9 05 __ CMP #$05
195a : b0 06 __ BCS $1962 ; (builddop_src.s8 + 0)
.s24:
195c : a9 4a __ LDA #$4a
.s25:
195e : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1961 : e8 __ __ INX
.s8:
1962 : a9 85 __ LDA #$85
1964 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
1967 : 9d 04 1e STA $1e04,x ; (BLIT_CODE[0] + 4)
196a : a9 09 __ LDA #$09
196c : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
196f : a9 b1 __ LDA #$b1
1971 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
1974 : a9 03 __ LDA #$03
1976 : 9d 03 1e STA $1e03,x ; (BLIT_CODE[0] + 3)
1979 : a9 08 __ LDA #$08
197b : 9d 05 1e STA $1e05,x ; (BLIT_CODE[0] + 5)
197e : 8a __ __ TXA
197f : 18 __ __ CLC
1980 : 69 06 __ ADC #$06
1982 : 85 1b __ STA ACCU + 0 
1984 : a8 __ __ TAY
1985 : a5 0f __ LDA P2 ; (reverse + 0)
1987 : d0 72 __ BNE $19fb ; (builddop_src.s17 + 0)
.s9:
1989 : a5 0e __ LDA P1 ; (shift + 0)
198b : c9 05 __ CMP #$05
198d : 90 0b __ BCC $199a ; (builddop_src.s10 + 0)
.s13:
198f : a9 0a __ LDA #$0a
1991 : 9d 06 1e STA $1e06,x ; (BLIT_CODE[0] + 6)
1994 : e6 1b __ INC ACCU + 0 
1996 : a6 0e __ LDX P1 ; (shift + 0)
1998 : b0 25 __ BCS $19bf ; (builddop_src.l14 + 0)
.s10:
199a : c9 02 __ CMP #$02
199c : 90 19 __ BCC $19b7 ; (builddop_src.s11 + 0)
.s12:
199e : c6 0e __ DEC P1 ; (shift + 0)
19a0 : a6 0e __ LDX P1 ; (shift + 0)
.l29:
19a2 : a9 6a __ LDA #$6a
19a4 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
19a7 : a9 46 __ LDA #$46
19a9 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
19ac : a9 09 __ LDA #$09
19ae : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
19b1 : c8 __ __ INY
19b2 : c8 __ __ INY
19b3 : c8 __ __ INY
19b4 : ca __ __ DEX
19b5 : d0 eb __ BNE $19a2 ; (builddop_src.l29 + 0)
.s11:
19b7 : a9 6a __ LDA #$6a
.s30:
19b9 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
19bc : c8 __ __ INY
19bd : 98 __ __ TYA
19be : 60 __ __ RTS
.l14:
19bf : a5 1b __ LDA ACCU + 0 
19c1 : 85 1d __ STA ACCU + 2 
19c3 : 85 1c __ STA ACCU + 1 
19c5 : a8 __ __ TAY
19c6 : 18 __ __ CLC
19c7 : 69 03 __ ADC #$03
19c9 : 85 1b __ STA ACCU + 0 
19cb : e0 07 __ CPX #$07
19cd : b0 16 __ BCS $19e5 ; (builddop_src.s15 + 0)
.s16:
19cf : a9 26 __ LDA #$26
19d1 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
19d4 : a9 09 __ LDA #$09
19d6 : a4 1d __ LDY ACCU + 2 
19d8 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
19db : a9 0a __ LDA #$0a
19dd : a4 1c __ LDY ACCU + 1 
19df : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
19e2 : e8 __ __ INX
19e3 : 90 da __ BCC $19bf ; (builddop_src.l14 + 0)
.s15:
19e5 : a9 a5 __ LDA #$a5
19e7 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
19ea : a9 09 __ LDA #$09
19ec : a6 1d __ LDX ACCU + 2 
19ee : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
19f1 : a9 2a __ LDA #$2a
19f3 : a6 1c __ LDX ACCU + 1 
19f5 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
19f8 : a5 1b __ LDA ACCU + 0 
19fa : 60 __ __ RTS
.s17:
19fb : a5 0e __ LDA P1 ; (shift + 0)
19fd : c9 05 __ CMP #$05
19ff : b0 3e __ BCS $1a3f ; (builddop_src.s21 + 0)
.s18:
1a01 : a9 4a __ LDA #$4a
1a03 : 9d 06 1e STA $1e06,x ; (BLIT_CODE[0] + 6)
1a06 : e6 1b __ INC ACCU + 0 
1a08 : a6 0e __ LDX P1 ; (shift + 0)
1a0a : e0 02 __ CPX #$02
1a0c : 90 1b __ BCC $1a29 ; (builddop_src.s19 + 0)
.s20:
1a0e : a4 1b __ LDY ACCU + 0 
.l28:
1a10 : a9 66 __ LDA #$66
1a12 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1a15 : a9 09 __ LDA #$09
1a17 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
1a1a : a9 4a __ LDA #$4a
1a1c : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1a1f : 98 __ __ TYA
1a20 : 18 __ __ CLC
1a21 : 69 03 __ ADC #$03
1a23 : a8 __ __ TAY
1a24 : ca __ __ DEX
1a25 : d0 e9 __ BNE $1a10 ; (builddop_src.l28 + 0)
.s31:
1a27 : 85 1b __ STA ACCU + 0 
.s19:
1a29 : a9 a5 __ LDA #$a5
1a2b : a6 1b __ LDX ACCU + 0 
1a2d : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
1a30 : a9 09 __ LDA #$09
1a32 : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
1a35 : a9 6a __ LDA #$6a
1a37 : 9d 02 1e STA $1e02,x ; (BLIT_CODE[0] + 2)
1a3a : 8a __ __ TXA
1a3b : 18 __ __ CLC
1a3c : 69 03 __ ADC #$03
1a3e : 60 __ __ RTS
.s21:
1a3f : c9 07 __ CMP #$07
1a41 : b0 19 __ BCS $1a5c ; (builddop_src.s22 + 0)
.s23:
1a43 : aa __ __ TAX
.l32:
1a44 : a9 2a __ LDA #$2a
1a46 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1a49 : a9 06 __ LDA #$06
1a4b : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
1a4e : a9 09 __ LDA #$09
1a50 : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1a53 : 98 __ __ TYA
1a54 : 69 03 __ ADC #$03
1a56 : e8 __ __ INX
1a57 : e0 07 __ CPX #$07
1a59 : a8 __ __ TAY
1a5a : 90 e8 __ BCC $1a44 ; (builddop_src.l32 + 0)
.s22:
1a5c : a9 2a __ LDA #$2a
1a5e : 4c b9 19 JMP $19b9 ; (builddop_src.s30 + 0)
.s26:
1a61 : a5 0e __ LDA P1 ; (shift + 0)
1a63 : c9 05 __ CMP #$05
1a65 : b0 03 __ BCS $1a6a ; (builddop_src.s27 + 0)
1a67 : 4c 62 19 JMP $1962 ; (builddop_src.s8 + 0)
.s27:
1a6a : a9 0a __ LDA #$0a
1a6c : 4c 5e 19 JMP $195e ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1a6f : a5 0e __ LDA P1 ; (op + 0)
1a71 : 29 20 __ AND #$20
1a73 : f0 04 __ BEQ $1a79 ; (builddop_op.s27 + 0)
.s28:
1a75 : a9 07 __ LDA #$07
1a77 : d0 02 __ BNE $1a7b ; (builddop_op.s29 + 0)
.s27:
1a79 : a9 0a __ LDA #$0a
.s29:
1a7b : 85 1c __ STA ACCU + 1 
1a7d : a5 0e __ LDA P1 ; (op + 0)
1a7f : 29 03 __ AND #$03
1a81 : 85 1b __ STA ACCU + 0 
1a83 : a5 0e __ LDA P1 ; (op + 0)
1a85 : 29 04 __ AND #$04
1a87 : f0 03 __ BEQ $1a8c ; (builddop_op.s5 + 0)
1a89 : 4c 1f 1b JMP $1b1f ; (builddop_op.s18 + 0)
.s5:
1a8c : a5 0e __ LDA P1 ; (op + 0)
1a8e : 29 08 __ AND #$08
1a90 : d0 13 __ BNE $1aa5 ; (builddop_op.s15 + 0)
.s6:
1a92 : a9 a5 __ LDA #$a5
1a94 : a4 0d __ LDY P0 ; (ip + 0)
1a96 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1a99 : a5 1c __ LDA ACCU + 1 
.s7:
1a9b : c8 __ __ INY
1a9c : c8 __ __ INY
1a9d : 84 0d __ STY P0 ; (ip + 0)
1a9f : 99 ff 1d STA $1dff,y 
1aa2 : 4c b5 1a JMP $1ab5 ; (builddop_op.s16 + 0)
.s15:
1aa5 : a5 0e __ LDA P1 ; (op + 0)
1aa7 : 0a __ __ ASL
1aa8 : 10 0b __ BPL $1ab5 ; (builddop_op.s16 + 0)
.s17:
1aaa : a9 49 __ LDA #$49
1aac : a4 0d __ LDY P0 ; (ip + 0)
1aae : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1ab1 : a9 ff __ LDA #$ff
1ab3 : d0 e6 __ BNE $1a9b ; (builddop_op.s7 + 0)
.s16:
1ab5 : a6 1b __ LDX ACCU + 0 
1ab7 : f0 13 __ BEQ $1acc ; (builddop_op.s8 + 0)
.s14:
1ab9 : a5 1c __ LDA ACCU + 1 
1abb : a4 0d __ LDY P0 ; (ip + 0)
1abd : c8 __ __ INY
1abe : c8 __ __ INY
1abf : 84 0d __ STY P0 ; (ip + 0)
1ac1 : 99 ff 1d STA $1dff,y 
1ac4 : bd e5 1d LDA $1de5,x ; (blitops_op[0] + 0)
1ac7 : 09 04 __ ORA #$04
1ac9 : 99 fe 1d STA $1dfe,y 
.s8:
1acc : a5 0f __ LDA P2 ; (mask + 0)
1ace : f0 3f __ BEQ $1b0f ; (builddop_op.s9 + 0)
.s10:
1ad0 : a9 85 __ LDA #$85
1ad2 : a4 0d __ LDY P0 ; (ip + 0)
1ad4 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1ad7 : a9 09 __ LDA #$09
1ad9 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
1adc : 98 __ __ TYA
1add : 18 __ __ CLC
1ade : 69 08 __ ADC #$08
1ae0 : 85 0d __ STA P0 ; (ip + 0)
1ae2 : a5 0e __ LDA P1 ; (op + 0)
1ae4 : 29 10 __ AND #$10
1ae6 : f0 09 __ BEQ $1af1 ; (builddop_op.s11 + 0)
.s13:
1ae8 : a9 45 __ LDA #$45
1aea : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1aed : a9 0a __ LDA #$0a
1aef : d0 07 __ BNE $1af8 ; (builddop_op.s12 + 0)
.s11:
1af1 : a9 51 __ LDA #$51
1af3 : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1af6 : a9 05 __ LDA #$05
.s12:
1af8 : 99 03 1e STA $1e03,y ; (BLIT_CODE[0] + 3)
1afb : a9 29 __ LDA #$29
1afd : 99 04 1e STA $1e04,y ; (BLIT_CODE[0] + 4)
1b00 : a5 0f __ LDA P2 ; (mask + 0)
1b02 : 99 05 1e STA $1e05,y ; (BLIT_CODE[0] + 5)
1b05 : a9 45 __ LDA #$45
1b07 : 99 06 1e STA $1e06,y ; (BLIT_CODE[0] + 6)
1b0a : a9 09 __ LDA #$09
1b0c : 99 07 1e STA $1e07,y ; (BLIT_CODE[0] + 7)
.s9:
1b0f : a9 91 __ LDA #$91
1b11 : a6 0d __ LDX P0 ; (ip + 0)
1b13 : 9d 00 1e STA $1e00,x ; (BLIT_CODE[0] + 0)
1b16 : a9 05 __ LDA #$05
1b18 : 9d 01 1e STA $1e01,x ; (BLIT_CODE[0] + 1)
1b1b : e8 __ __ INX
1b1c : e8 __ __ INX
1b1d : 8a __ __ TXA
.s3:
1b1e : 60 __ __ RTS
.s18:
1b1f : a5 1b __ LDA ACCU + 0 
1b21 : d0 04 __ BNE $1b27 ; (builddop_op.s20 + 0)
.s19:
1b23 : a5 0f __ LDA P2 ; (mask + 0)
1b25 : d0 14 __ BNE $1b3b ; (builddop_op.s23 + 0)
.s20:
1b27 : a5 0e __ LDA P1 ; (op + 0)
1b29 : 29 40 __ AND #$40
1b2b : f0 02 __ BEQ $1b2f ; (builddop_op.s21 + 0)
.s22:
1b2d : a9 ff __ LDA #$ff
.s21:
1b2f : aa __ __ TAX
1b30 : a9 a9 __ LDA #$a9
1b32 : a4 0d __ LDY P0 ; (ip + 0)
1b34 : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1b37 : 8a __ __ TXA
1b38 : 4c 9b 1a JMP $1a9b ; (builddop_op.s7 + 0)
.s23:
1b3b : a9 b1 __ LDA #$b1
1b3d : a4 0d __ LDY P0 ; (ip + 0)
1b3f : 99 00 1e STA $1e00,y ; (BLIT_CODE[0] + 0)
1b42 : a9 05 __ LDA #$05
1b44 : 99 01 1e STA $1e01,y ; (BLIT_CODE[0] + 1)
1b47 : 06 0e __ ASL P1 ; (op + 0)
1b49 : 30 0a __ BMI $1b55 ; (builddop_op.s26 + 0)
.s24:
1b4b : a9 29 __ LDA #$29
1b4d : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1b50 : a5 0f __ LDA P2 ; (mask + 0)
1b52 : 4c 5e 1b JMP $1b5e ; (builddop_op.s25 + 0)
.s26:
1b55 : a9 09 __ LDA #$09
1b57 : 99 02 1e STA $1e02,y ; (BLIT_CODE[0] + 2)
1b5a : a5 0f __ LDA P2 ; (mask + 0)
1b5c : 49 ff __ EOR #$ff
.s25:
1b5e : 99 03 1e STA $1e03,y ; (BLIT_CODE[0] + 3)
1b61 : a9 91 __ LDA #$91
1b63 : 99 04 1e STA $1e04,y ; (BLIT_CODE[0] + 4)
1b66 : a9 05 __ LDA #$05
1b68 : 99 05 1e STA $1e05,y ; (BLIT_CODE[0] + 5)
1b6b : 98 __ __ TYA
1b6c : 18 __ __ CLC
1b6d : 69 06 __ ADC #$06
1b6f : 60 __ __ RTS
--------------------------------------------------------------------
krnio_setnam: ; krnio_setnam(const u8*)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1b70 : a5 0d __ LDA P0 
1b72 : 05 0e __ ORA P1 
1b74 : f0 08 __ BEQ $1b7e ; (krnio_setnam.s4 + 14)
1b76 : a0 ff __ LDY #$ff
1b78 : c8 __ __ INY
1b79 : b1 0d __ LDA (P0),y 
1b7b : d0 fb __ BNE $1b78 ; (krnio_setnam.s4 + 8)
1b7d : 98 __ __ TYA
1b7e : a6 0d __ LDX P0 
1b80 : a4 0e __ LDY P1 
1b82 : 20 bd ff JSR $ffbd 
.s3:
1b85 : 60 __ __ RTS
--------------------------------------------------------------------
1b86 : __ __ __ BYT 40 30 3a 54 45 53 54 49 4d 41 47 45 2c 50 2c 57 : @0:TESTIMAGE,P,W
1b96 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
krnio_open: ; krnio_open(u8,u8,u8)->bool
;  35, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1b97 : a9 00 __ LDA #$00
1b99 : a6 0d __ LDX P0 ; (fnum + 0)
1b9b : 9d e0 1e STA $1ee0,x ; (krnio_pstatus[0] + 0)
1b9e : a9 00 __ LDA #$00
1ba0 : 85 1b __ STA ACCU + 0 
1ba2 : 85 1c __ STA ACCU + 1 
1ba4 : a5 0d __ LDA P0 ; (fnum + 0)
1ba6 : a6 0e __ LDX P1 
1ba8 : a4 0f __ LDY P2 
1baa : 20 ba ff JSR $ffba 
1bad : 20 c0 ff JSR $ffc0 
1bb0 : 90 08 __ BCC $1bba ; (krnio_open.s4 + 35)
1bb2 : a5 0d __ LDA P0 ; (fnum + 0)
1bb4 : 20 c3 ff JSR $ffc3 
1bb7 : 4c be 1b JMP $1bbe ; (krnio_open.s4 + 39)
1bba : a9 01 __ LDA #$01
1bbc : 85 1b __ STA ACCU + 0 
1bbe : a5 1b __ LDA ACCU + 0 
1bc0 : f0 02 __ BEQ $1bc4 ; (krnio_open.s3 + 0)
.s5:
1bc2 : a9 01 __ LDA #$01
.s3:
1bc4 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_write: ; krnio_write(u8,const u8*,i16)->i16
;  82, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1bc5 : a5 0e __ LDA P1 ; (fnum + 0)
1bc7 : 20 13 1c JSR $1c13 ; (krnio_chkout.s4 + 0)
1bca : aa __ __ TAX
1bcb : d0 07 __ BNE $1bd4 ; (krnio_write.s6 + 0)
.s5:
1bcd : a9 ff __ LDA #$ff
1bcf : 85 1b __ STA ACCU + 0 
.s3:
1bd1 : 85 1c __ STA ACCU + 1 
1bd3 : 60 __ __ RTS
.s6:
1bd4 : a5 12 __ LDA P5 ; (num + 1)
1bd6 : 30 2f __ BMI $1c07 ; (krnio_write.s7 + 0)
.s10:
1bd8 : 05 11 __ ORA P4 ; (num + 0)
1bda : f0 2b __ BEQ $1c07 ; (krnio_write.s7 + 0)
.s8:
1bdc : a5 11 __ LDA P4 ; (num + 0)
1bde : 85 43 __ STA T1 + 0 
1be0 : a5 12 __ LDA P5 ; (num + 1)
1be2 : 85 44 __ STA T1 + 1 
1be4 : a5 0f __ LDA P2 ; (data + 0)
1be6 : 85 45 __ STA T2 + 0 
1be8 : a5 10 __ LDA P3 ; (data + 1)
1bea : 85 46 __ STA T2 + 1 
.l9:
1bec : a0 00 __ LDY #$00
1bee : b1 45 __ LDA (T2 + 0),y 
1bf0 : 20 28 1c JSR $1c28 ; (krnio_chrout.s4 + 0)
1bf3 : e6 45 __ INC T2 + 0 
1bf5 : d0 02 __ BNE $1bf9 ; (krnio_write.s15 + 0)
.s14:
1bf7 : e6 46 __ INC T2 + 1 
.s15:
1bf9 : a5 43 __ LDA T1 + 0 
1bfb : d0 02 __ BNE $1bff ; (krnio_write.s12 + 0)
.s11:
1bfd : c6 44 __ DEC T1 + 1 
.s12:
1bff : c6 43 __ DEC T1 + 0 
1c01 : d0 e9 __ BNE $1bec ; (krnio_write.l9 + 0)
.s13:
1c03 : a5 44 __ LDA T1 + 1 
1c05 : d0 e5 __ BNE $1bec ; (krnio_write.l9 + 0)
.s7:
1c07 : 20 38 1c JSR $1c38 ; (krnio_clrchn.s4 + 0)
1c0a : a5 11 __ LDA P4 ; (num + 0)
1c0c : 85 1b __ STA ACCU + 0 
1c0e : a5 12 __ LDA P5 ; (num + 1)
1c10 : 4c d1 1b JMP $1bd1 ; (krnio_write.s3 + 0)
--------------------------------------------------------------------
krnio_chkout: ; krnio_chkout(u8)->bool
;  51, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1c13 : 85 0d __ STA P0 
1c15 : a6 0d __ LDX P0 
1c17 : 20 c9 ff JSR $ffc9 
1c1a : a9 00 __ LDA #$00
1c1c : 2a __ __ ROL
1c1d : 49 01 __ EOR #$01
1c1f : 85 1b __ STA ACCU + 0 
1c21 : a5 1b __ LDA ACCU + 0 
1c23 : f0 02 __ BEQ $1c27 ; (krnio_chkout.s3 + 0)
.s5:
1c25 : a9 01 __ LDA #$01
.s3:
1c27 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_chrout: ; krnio_chrout(u8)->bool
;  63, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1c28 : 85 0d __ STA P0 
1c2a : a5 0d __ LDA P0 
1c2c : 20 d2 ff JSR $ffd2 
1c2f : 85 1b __ STA ACCU + 0 
1c31 : a5 1b __ LDA ACCU + 0 
1c33 : f0 02 __ BEQ $1c37 ; (krnio_chrout.s3 + 0)
.s5:
1c35 : a9 01 __ LDA #$01
.s3:
1c37 : 60 __ __ RTS
--------------------------------------------------------------------
krnio_clrchn: ; krnio_clrchn()->void
;  59, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1c38 : 20 cc ff JSR $ffcc 
.s3:
1c3b : 60 __ __ RTS
--------------------------------------------------------------------
krnio_close: ; krnio_close(u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/include/c64/kernalio.h"
.s4:
1c3c : 85 0d __ STA P0 
1c3e : a5 0d __ LDA P0 
1c40 : 20 c3 ff JSR $ffc3 
.s3:
1c43 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
1c44 : 4a __ __ LSR
1c45 : f0 2e __ BEQ $1c75 ; (mul16by8 + 49)
1c47 : a2 00 __ LDX #$00
1c49 : a0 00 __ LDY #$00
1c4b : 90 13 __ BCC $1c60 ; (mul16by8 + 28)
1c4d : a4 1b __ LDY ACCU + 0 
1c4f : a6 1c __ LDX ACCU + 1 
1c51 : b0 0d __ BCS $1c60 ; (mul16by8 + 28)
1c53 : 85 02 __ STA $02 
1c55 : 18 __ __ CLC
1c56 : 98 __ __ TYA
1c57 : 65 1b __ ADC ACCU + 0 
1c59 : a8 __ __ TAY
1c5a : 8a __ __ TXA
1c5b : 65 1c __ ADC ACCU + 1 
1c5d : aa __ __ TAX
1c5e : a5 02 __ LDA $02 
1c60 : 06 1b __ ASL ACCU + 0 
1c62 : 26 1c __ ROL ACCU + 1 
1c64 : 4a __ __ LSR
1c65 : 90 f9 __ BCC $1c60 ; (mul16by8 + 28)
1c67 : d0 ea __ BNE $1c53 ; (mul16by8 + 15)
1c69 : 18 __ __ CLC
1c6a : 98 __ __ TYA
1c6b : 65 1b __ ADC ACCU + 0 
1c6d : 85 1b __ STA ACCU + 0 
1c6f : 8a __ __ TXA
1c70 : 65 1c __ ADC ACCU + 1 
1c72 : 85 1c __ STA ACCU + 1 
1c74 : 60 __ __ RTS
1c75 : b0 04 __ BCS $1c7b ; (mul16by8 + 55)
1c77 : 85 1b __ STA ACCU + 0 
1c79 : 85 1c __ STA ACCU + 1 
1c7b : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
1c7c : a0 00 __ LDY #$00
1c7e : 84 06 __ STY WORK + 3 
1c80 : a5 03 __ LDA WORK + 0 
1c82 : a6 04 __ LDX WORK + 1 
1c84 : f0 1c __ BEQ $1ca2 ; (mul16 + 38)
1c86 : 38 __ __ SEC
1c87 : 6a __ __ ROR
1c88 : 90 0d __ BCC $1c97 ; (mul16 + 27)
1c8a : aa __ __ TAX
1c8b : 18 __ __ CLC
1c8c : 98 __ __ TYA
1c8d : 65 1b __ ADC ACCU + 0 
1c8f : a8 __ __ TAY
1c90 : a5 06 __ LDA WORK + 3 
1c92 : 65 1c __ ADC ACCU + 1 
1c94 : 85 06 __ STA WORK + 3 
1c96 : 8a __ __ TXA
1c97 : 06 1b __ ASL ACCU + 0 
1c99 : 26 1c __ ROL ACCU + 1 
1c9b : 4a __ __ LSR
1c9c : 90 f9 __ BCC $1c97 ; (mul16 + 27)
1c9e : d0 ea __ BNE $1c8a ; (mul16 + 14)
1ca0 : a5 04 __ LDA WORK + 1 
1ca2 : 4a __ __ LSR
1ca3 : 90 0d __ BCC $1cb2 ; (mul16 + 54)
1ca5 : aa __ __ TAX
1ca6 : 18 __ __ CLC
1ca7 : 98 __ __ TYA
1ca8 : 65 1b __ ADC ACCU + 0 
1caa : a8 __ __ TAY
1cab : a5 06 __ LDA WORK + 3 
1cad : 65 1c __ ADC ACCU + 1 
1caf : 85 06 __ STA WORK + 3 
1cb1 : 8a __ __ TXA
1cb2 : 06 1b __ ASL ACCU + 0 
1cb4 : 26 1c __ ROL ACCU + 1 
1cb6 : 4a __ __ LSR
1cb7 : b0 ec __ BCS $1ca5 ; (mul16 + 41)
1cb9 : d0 f7 __ BNE $1cb2 ; (mul16 + 54)
1cbb : 84 05 __ STY WORK + 2 
1cbd : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
1cbe : 18 __ __ CLC
1cbf : a5 1b __ LDA ACCU + 0 
1cc1 : 69 05 __ ADC #$05
1cc3 : 29 fc __ AND #$fc
1cc5 : 85 03 __ STA WORK + 0 
1cc7 : a5 1c __ LDA ACCU + 1 
1cc9 : 69 00 __ ADC #$00
1ccb : 85 04 __ STA WORK + 1 
1ccd : ad fb 1d LDA $1dfb ; (HeapNode.end + 0)
1cd0 : d0 26 __ BNE $1cf8 ; (crt_malloc + 58)
1cd2 : a9 00 __ LDA #$00
1cd4 : 8d ca 1f STA $1fca 
1cd7 : 8d cb 1f STA $1fcb 
1cda : ee fb 1d INC $1dfb ; (HeapNode.end + 0)
1cdd : a9 c8 __ LDA #$c8
1cdf : 09 02 __ ORA #$02
1ce1 : 8d f9 1d STA $1df9 ; (HeapNode.next + 0)
1ce4 : a9 1f __ LDA #$1f
1ce6 : 8d fa 1d STA $1dfa ; (HeapNode.next + 1)
1ce9 : 38 __ __ SEC
1cea : a9 00 __ LDA #$00
1cec : e9 02 __ SBC #$02
1cee : 8d cc 1f STA $1fcc 
1cf1 : a9 90 __ LDA #$90
1cf3 : e9 00 __ SBC #$00
1cf5 : 8d cd 1f STA $1fcd 
1cf8 : a9 f9 __ LDA #$f9
1cfa : a2 1d __ LDX #$1d
1cfc : 85 1d __ STA ACCU + 2 
1cfe : 86 1e __ STX ACCU + 3 
1d00 : 18 __ __ CLC
1d01 : a0 00 __ LDY #$00
1d03 : b1 1d __ LDA (ACCU + 2),y 
1d05 : 85 1b __ STA ACCU + 0 
1d07 : 65 03 __ ADC WORK + 0 
1d09 : 85 05 __ STA WORK + 2 
1d0b : c8 __ __ INY
1d0c : b1 1d __ LDA (ACCU + 2),y 
1d0e : 85 1c __ STA ACCU + 1 
1d10 : f0 20 __ BEQ $1d32 ; (crt_malloc + 116)
1d12 : 65 04 __ ADC WORK + 1 
1d14 : 85 06 __ STA WORK + 3 
1d16 : b0 14 __ BCS $1d2c ; (crt_malloc + 110)
1d18 : a0 02 __ LDY #$02
1d1a : b1 1b __ LDA (ACCU + 0),y 
1d1c : c5 05 __ CMP WORK + 2 
1d1e : c8 __ __ INY
1d1f : b1 1b __ LDA (ACCU + 0),y 
1d21 : e5 06 __ SBC WORK + 3 
1d23 : b0 0e __ BCS $1d33 ; (crt_malloc + 117)
1d25 : a5 1b __ LDA ACCU + 0 
1d27 : a6 1c __ LDX ACCU + 1 
1d29 : 4c fc 1c JMP $1cfc ; (crt_malloc + 62)
1d2c : a9 00 __ LDA #$00
1d2e : 85 1b __ STA ACCU + 0 
1d30 : 85 1c __ STA ACCU + 1 
1d32 : 60 __ __ RTS
1d33 : a5 05 __ LDA WORK + 2 
1d35 : 85 07 __ STA WORK + 4 
1d37 : a5 06 __ LDA WORK + 3 
1d39 : 85 08 __ STA WORK + 5 
1d3b : a0 02 __ LDY #$02
1d3d : a5 07 __ LDA WORK + 4 
1d3f : d1 1b __ CMP (ACCU + 0),y 
1d41 : d0 15 __ BNE $1d58 ; (crt_malloc + 154)
1d43 : c8 __ __ INY
1d44 : a5 08 __ LDA WORK + 5 
1d46 : d1 1b __ CMP (ACCU + 0),y 
1d48 : d0 0e __ BNE $1d58 ; (crt_malloc + 154)
1d4a : a0 00 __ LDY #$00
1d4c : b1 1b __ LDA (ACCU + 0),y 
1d4e : 91 1d __ STA (ACCU + 2),y 
1d50 : c8 __ __ INY
1d51 : b1 1b __ LDA (ACCU + 0),y 
1d53 : 91 1d __ STA (ACCU + 2),y 
1d55 : 4c 75 1d JMP $1d75 ; (crt_malloc + 183)
1d58 : a0 00 __ LDY #$00
1d5a : b1 1b __ LDA (ACCU + 0),y 
1d5c : 91 07 __ STA (WORK + 4),y 
1d5e : a5 07 __ LDA WORK + 4 
1d60 : 91 1d __ STA (ACCU + 2),y 
1d62 : c8 __ __ INY
1d63 : b1 1b __ LDA (ACCU + 0),y 
1d65 : 91 07 __ STA (WORK + 4),y 
1d67 : a5 08 __ LDA WORK + 5 
1d69 : 91 1d __ STA (ACCU + 2),y 
1d6b : c8 __ __ INY
1d6c : b1 1b __ LDA (ACCU + 0),y 
1d6e : 91 07 __ STA (WORK + 4),y 
1d70 : c8 __ __ INY
1d71 : b1 1b __ LDA (ACCU + 0),y 
1d73 : 91 07 __ STA (WORK + 4),y 
1d75 : a0 00 __ LDY #$00
1d77 : a5 05 __ LDA WORK + 2 
1d79 : 91 1b __ STA (ACCU + 0),y 
1d7b : c8 __ __ INY
1d7c : a5 06 __ LDA WORK + 3 
1d7e : 91 1b __ STA (ACCU + 0),y 
1d80 : 18 __ __ CLC
1d81 : a5 1b __ LDA ACCU + 0 
1d83 : 69 02 __ ADC #$02
1d85 : 85 1b __ STA ACCU + 0 
1d87 : 90 02 __ BCC $1d8b ; (crt_malloc + 205)
1d89 : e6 1c __ INC ACCU + 1 
1d8b : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
1d8c : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
lmask:
1d8d : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
1d95 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
NineShadesOfGrey:
1d9d : __ __ __ BYT 00 00 00 00 00 00 00 00 22 00 88 00 22 00 88 00 : ........"..."...
1dad : __ __ __ BYT 22 88 22 88 22 88 22 88 88 55 22 55 88 55 22 55 : "."."."..U"U.U"U
1dbd : __ __ __ BYT aa 55 aa 55 aa 55 aa 55 bb 55 ee 55 bb 55 ee 55 : .U.U.U.U.U.U.U.U
1dcd : __ __ __ BYT dd 77 dd 77 dd 77 dd 77 ff ee ff bb ff ee ff bb : .w.w.w.w........
1ddd : __ __ __ BYT ff ff ff ff ff ff ff ff                         : ........
--------------------------------------------------------------------
blitops_op:
1de5 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
Screen:
1de9 : __ __ __ BSS	8
--------------------------------------------------------------------
Brush:
1df1 : __ __ __ BSS	8
--------------------------------------------------------------------
HeapNode:
1df9 : __ __ __ BSS	4
--------------------------------------------------------------------
BLIT_CODE:
1e00 : __ __ __ BSS	224
--------------------------------------------------------------------
krnio_pstatus:
1ee0 : __ __ __ BSS	16
--------------------------------------------------------------------
Buffer:
1f00 : __ __ __ BSS	200
