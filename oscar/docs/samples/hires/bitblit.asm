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
080e : 8e 2b 25 STX $252b ; (spentry + 0)
0811 : a2 28 __ LDX #$28
0813 : a0 15 __ LDY #$15
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 2b __ CPX #$2b
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 20 __ CPY #$20
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 94 __ LDA #$94
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
;  68, "/home/honza/projects/c64/projects/oscar64/samples/hires/bitblit.c"
.s1:
0880 : a2 04 __ LDX #$04
0882 : b5 53 __ LDA T0 + 0,x 
0884 : 9d 96 9f STA $9f96,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 2c 0a JSR $0a2c ; (init.s4 + 0)
088d : a9 08 __ LDA #$08
088f : 85 0f __ STA P2 
0891 : 85 10 __ STA P3 
0893 : a9 1d __ LDA #$1d
0895 : 85 0d __ STA P0 
0897 : a9 28 __ LDA #$28
0899 : 85 0e __ STA P1 
089b : 20 8a 0b JSR $0b8a ; (bm_alloc.s4 + 0)
089e : a9 1d __ LDA #$1d
08a0 : 85 13 __ STA P6 
08a2 : a9 00 __ LDA #$00
08a4 : 85 15 __ STA P8 
08a6 : a9 28 __ LDA #$28
08a8 : 85 14 __ STA P7 
08aa : 20 03 0c JSR $0c03 ; (bm_fill.s4 + 0)
08ad : a9 0c __ LDA #$0c
08af : 85 18 __ STA P11 
08b1 : a9 1d __ LDA #$1d
08b3 : 8d cf 9f STA $9fcf ; (sstack + 0)
08b6 : a9 28 __ LDA #$28
08b8 : 8d d0 9f STA $9fd0 ; (sstack + 1)
08bb : a2 07 __ LDX #$07
.l5:
08bd : bd 37 0c LDA $0c37,x 
08c0 : 9d b0 9f STA $9fb0,x ; (bcr.left + 0)
08c3 : ca __ __ DEX
08c4 : 10 f7 __ BPL $08bd ; (main.l5 + 0)
.s6:
08c6 : a9 b0 __ LDA #$b0
08c8 : 8d d1 9f STA $9fd1 ; (sstack + 2)
08cb : a9 9f __ LDA #$9f
08cd : 8d d2 9f STA $9fd2 ; (sstack + 3)
08d0 : a9 3c __ LDA #$3c
08d2 : 8d d3 9f STA $9fd3 ; (sstack + 4)
08d5 : a9 25 __ LDA #$25
08d7 : 8d d4 9f STA $9fd4 ; (sstack + 5)
08da : a9 54 __ LDA #$54
08dc : 8d d5 9f STA $9fd5 ; (sstack + 6)
08df : a9 25 __ LDA #$25
08e1 : 8d d6 9f STA $9fd6 ; (sstack + 7)
08e4 : a9 ac __ LDA #$ac
08e6 : 8d d7 9f STA $9fd7 ; (sstack + 8)
08e9 : a9 25 __ LDA #$25
08eb : 8d d8 9f STA $9fd8 ; (sstack + 9)
08ee : 20 3f 0c JSR $0c3f ; (bm_polygon_nc_fill.s1 + 0)
08f1 : a9 00 __ LDA #$00
08f3 : 8d cf 9f STA $9fcf ; (sstack + 0)
08f6 : 8d d0 9f STA $9fd0 ; (sstack + 1)
08f9 : 8d d1 9f STA $9fd1 ; (sstack + 2)
08fc : 8d d2 9f STA $9fd2 ; (sstack + 3)
08ff : 8d d5 9f STA $9fd5 ; (sstack + 6)
0902 : 8d d6 9f STA $9fd6 ; (sstack + 7)
0905 : 8d d7 9f STA $9fd7 ; (sstack + 8)
0908 : 8d d8 9f STA $9fd8 ; (sstack + 9)
090b : 8d dc 9f STA $9fdc ; (sstack + 13)
090e : a9 20 __ LDA #$20
0910 : 85 18 __ STA P11 
0912 : a9 15 __ LDA #$15
0914 : 85 16 __ STA P9 
0916 : 8d d3 9f STA $9fd3 ; (sstack + 4)
0919 : a9 40 __ LDA #$40
091b : 8d d9 9f STA $9fd9 ; (sstack + 10)
091e : a9 01 __ LDA #$01
0920 : 8d da 9f STA $9fda ; (sstack + 11)
0923 : a9 c8 __ LDA #$c8
0925 : 8d db 9f STA $9fdb ; (sstack + 12)
0928 : a9 28 __ LDA #$28
092a : 85 17 __ STA P10 
092c : 8d d4 9f STA $9fd4 ; (sstack + 5)
092f : a9 7c __ LDA #$7c
0931 : 8d dd 9f STA $9fdd ; (sstack + 14)
0934 : a9 25 __ LDA #$25
0936 : 8d de 9f STA $9fde ; (sstack + 15)
0939 : 20 0a 13 JSR $130a ; (bmu_bitblit.s1 + 0)
093c : a2 07 __ LDX #$07
.l7:
093e : bd ef 1b LDA $1bef,x 
0941 : 9d a8 9f STA $9fa8,x ; (scr.left + 0)
0944 : ca __ __ DEX
0945 : 10 f7 __ BPL $093e ; (main.l7 + 0)
.s8:
0947 : a9 00 __ LDA #$00
0949 : 85 53 __ STA T0 + 0 
094b : 18 __ __ CLC
.l10:
094c : a9 00 __ LDA #$00
094e : 8d d5 9f STA $9fd5 ; (sstack + 6)
0951 : 8d d6 9f STA $9fd6 ; (sstack + 7)
0954 : 8d d7 9f STA $9fd7 ; (sstack + 8)
0957 : 8d d8 9f STA $9fd8 ; (sstack + 9)
095a : 8d da 9f STA $9fda ; (sstack + 11)
095d : 8d dc 9f STA $9fdc ; (sstack + 13)
0960 : a9 15 __ LDA #$15
0962 : 85 16 __ STA P9 
0964 : a9 28 __ LDA #$28
0966 : 85 17 __ STA P10 
0968 : a9 1d __ LDA #$1d
096a : 8d d3 9f STA $9fd3 ; (sstack + 4)
096d : a9 28 __ LDA #$28
096f : 8d d4 9f STA $9fd4 ; (sstack + 5)
0972 : a9 40 __ LDA #$40
0974 : 8d d9 9f STA $9fd9 ; (sstack + 10)
0977 : 8d db 9f STA $9fdb ; (sstack + 12)
097a : a5 53 __ LDA T0 + 0 
097c : 69 01 __ ADC #$01
097e : 85 53 __ STA T0 + 0 
0980 : 29 03 __ AND #$03
0982 : aa __ __ TAX
0983 : a9 b8 __ LDA #$b8
0985 : 8d dd 9f STA $9fdd ; (sstack + 14)
0988 : a9 25 __ LDA #$25
098a : 8d de 9f STA $9fde ; (sstack + 15)
098d : bd 19 25 LDA $2519,x ; (__multab80L + 0)
0990 : 09 08 __ ORA #$08
0992 : 85 55 __ STA T7 + 0 
0994 : 8d cf 9f STA $9fcf ; (sstack + 0)
0997 : a5 53 __ LDA T0 + 0 
0999 : 4a __ __ LSR
099a : 4a __ __ LSR
099b : aa __ __ TAX
099c : bd 1d 25 LDA $251d,x ; (__multab66L + 0)
099f : 09 01 __ ORA #$01
09a1 : 85 54 __ STA T1 + 0 
09a3 : 8d d1 9f STA $9fd1 ; (sstack + 2)
09a6 : a9 00 __ LDA #$00
09a8 : 8d d0 9f STA $9fd0 ; (sstack + 1)
09ab : 8d d2 9f STA $9fd2 ; (sstack + 3)
09ae : a6 53 __ LDX T0 + 0 
09b0 : bd 20 25 LDA $2520,x ; (__multab3L + 0)
09b3 : 85 56 __ STA T8 + 0 
09b5 : aa __ __ TAX
09b6 : bd c2 25 LDA $25c2,x ; (blitDemos[0].op + 0)
09b9 : 85 18 __ STA P11 
09bb : 20 0a 13 JSR $130a ; (bmu_bitblit.s1 + 0)
09be : a6 56 __ LDX T8 + 0 
09c0 : bd c0 25 LDA $25c0,x ; (blitDemos[0].name + 0)
09c3 : 85 0d __ STA P0 
09c5 : bd c1 25 LDA $25c1,x ; (blitDemos[0].name + 1)
09c8 : 85 57 __ STA T8 + 1 
09ca : 85 0e __ STA P1 
09cc : 20 d8 21 JSR $21d8 ; (strlen.s4 + 0)
09cf : a9 15 __ LDA #$15
09d1 : 8d f4 9f STA $9ff4 ; (sstack + 37)
09d4 : a9 28 __ LDA #$28
09d6 : 8d f5 9f STA $9ff5 ; (sstack + 38)
09d9 : a9 a8 __ LDA #$a8
09db : 8d f6 9f STA $9ff6 ; (sstack + 39)
09de : a9 9f __ LDA #$9f
09e0 : 8d f7 9f STA $9ff7 ; (sstack + 40)
09e3 : a5 55 __ LDA T7 + 0 
09e5 : 8d f8 9f STA $9ff8 ; (sstack + 41)
09e8 : a5 0d __ LDA P0 
09ea : 8d fc 9f STA $9ffc ; (sstack + 45)
09ed : a5 57 __ LDA T8 + 1 
09ef : 8d fd 9f STA $9ffd ; (sstack + 46)
09f2 : a5 1b __ LDA ACCU + 0 
09f4 : 8d fe 9f STA $9ffe ; (sstack + 47)
09f7 : a9 08 __ LDA #$08
09f9 : 8d ff 9f STA $9fff ; (sstack + 48)
09fc : 18 __ __ CLC
09fd : a5 54 __ LDA T1 + 0 
09ff : 69 13 __ ADC #$13
0a01 : 8d fa 9f STA $9ffa ; (sstack + 43)
0a04 : a9 00 __ LDA #$00
0a06 : 8d f9 9f STA $9ff9 ; (sstack + 42)
0a09 : 8d fb 9f STA $9ffb ; (sstack + 44)
0a0c : 20 30 1c JSR $1c30 ; (bm_put_chars.s1 + 0)
0a0f : a5 53 __ LDA T0 + 0 
0a11 : c9 0b __ CMP #$0b
0a13 : b0 03 __ BCS $0a18 ; (main.s9 + 0)
0a15 : 4c 4c 09 JMP $094c ; (main.l10 + 0)
.s9:
0a18 : 20 f4 21 JSR $21f4 ; (done.s4 + 0)
0a1b : a9 00 __ LDA #$00
0a1d : 85 1b __ STA ACCU + 0 
0a1f : 85 1c __ STA ACCU + 1 
.s3:
0a21 : a2 04 __ LDX #$04
0a23 : bd 96 9f LDA $9f96,x ; (main@stack + 0)
0a26 : 95 53 __ STA T0 + 0,x 
0a28 : ca __ __ DEX
0a29 : 10 f8 __ BPL $0a23 ; (main.s3 + 2)
0a2b : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  13, "/home/honza/projects/c64/projects/oscar64/samples/hires/bitblit.c"
.s4:
0a2c : 20 98 0a JSR $0a98 ; (mmap_trampoline.s4 + 0)
0a2f : a9 00 __ LDA #$00
0a31 : 85 0f __ STA P2 
0a33 : 85 10 __ STA P3 
0a35 : a9 30 __ LDA #$30
0a37 : 85 01 __ STA $01 
0a39 : a9 40 __ LDA #$40
0a3b : 85 11 __ STA P4 
0a3d : a9 1f __ LDA #$1f
0a3f : 85 12 __ STA P5 
0a41 : a9 10 __ LDA #$10
0a43 : a2 fa __ LDX #$fa
.l6:
0a45 : ca __ __ DEX
0a46 : 9d 00 d0 STA $d000,x 
0a49 : 9d fa d0 STA $d0fa,x 
0a4c : 9d f4 d1 STA $d1f4,x 
0a4f : 9d ee d2 STA $d2ee,x 
0a52 : d0 f1 __ BNE $0a45 ; (init.l6 + 0)
.s5:
0a54 : a9 00 __ LDA #$00
0a56 : 85 0d __ STA P0 
0a58 : a9 e0 __ LDA #$e0
0a5a : 85 0e __ STA P1 
0a5c : 20 e2 0a JSR $0ae2 ; (memset.s4 + 0)
0a5f : a9 00 __ LDA #$00
0a61 : 85 10 __ STA P3 
0a63 : 85 0e __ STA P1 
0a65 : a9 35 __ LDA #$35
0a67 : 85 01 __ STA $01 
0a69 : a9 03 __ LDA #$03
0a6b : 85 0d __ STA P0 
0a6d : a9 e0 __ LDA #$e0
0a6f : 85 11 __ STA P4 
0a71 : a9 d0 __ LDA #$d0
0a73 : 85 0f __ STA P2 
0a75 : 20 06 0b JSR $0b06 ; (vic_setmode.s4 + 0)
0a78 : a9 00 __ LDA #$00
0a7a : 85 0f __ STA P2 
0a7c : a9 e0 __ LDA #$e0
0a7e : 85 10 __ STA P3 
0a80 : a9 28 __ LDA #$28
0a82 : 85 11 __ STA P4 
0a84 : a9 19 __ LDA #$19
0a86 : 85 12 __ STA P5 
0a88 : a9 01 __ LDA #$01
0a8a : 8d 20 d0 STA $d020 
0a8d : a9 15 __ LDA #$15
0a8f : 85 0d __ STA P0 
0a91 : a9 28 __ LDA #$28
0a93 : 85 0e __ STA P1 
0a95 : 4c 58 0b JMP $0b58 ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0a98 : a9 ad __ LDA #$ad
0a9a : 8d fa ff STA $fffa 
0a9d : a9 0a __ LDA #$0a
0a9f : 8d fb ff STA $fffb 
0aa2 : a9 cb __ LDA #$cb
0aa4 : 8d fe ff STA $fffe 
0aa7 : a9 0a __ LDA #$0a
0aa9 : 8d ff ff STA $ffff 
.s3:
0aac : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0aad : 48 __ __ PHA
0aae : 8a __ __ TXA
0aaf : 48 __ __ PHA
0ab0 : a9 0a __ LDA #$0a
0ab2 : 48 __ __ PHA
0ab3 : a9 c4 __ LDA #$c4
0ab5 : 48 __ __ PHA
0ab6 : ba __ __ TSX
0ab7 : bd 05 01 LDA $0105,x 
0aba : 48 __ __ PHA
0abb : a6 01 __ LDX $01 
0abd : a9 36 __ LDA #$36
0abf : 85 01 __ STA $01 
0ac1 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0ac4 : 86 01 __ STX $01 
0ac6 : 68 __ __ PLA
0ac7 : aa __ __ TAX
0ac8 : 68 __ __ PLA
0ac9 : 40 __ __ RTI
0aca : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0acb : 48 __ __ PHA
0acc : 8a __ __ TXA
0acd : 48 __ __ PHA
0ace : a9 0a __ LDA #$0a
0ad0 : 48 __ __ PHA
0ad1 : a9 c4 __ LDA #$c4
0ad3 : 48 __ __ PHA
0ad4 : ba __ __ TSX
0ad5 : bd 05 01 LDA $0105,x 
0ad8 : 48 __ __ PHA
0ad9 : a6 01 __ LDX $01 
0adb : a9 36 __ LDA #$36
0add : 85 01 __ STA $01 
0adf : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0ae2 : a5 0f __ LDA P2 
0ae4 : a6 12 __ LDX P5 
0ae6 : f0 0c __ BEQ $0af4 ; (memset.s4 + 18)
0ae8 : a0 00 __ LDY #$00
0aea : 91 0d __ STA (P0),y ; (dst + 0)
0aec : c8 __ __ INY
0aed : d0 fb __ BNE $0aea ; (memset.s4 + 8)
0aef : e6 0e __ INC P1 ; (dst + 1)
0af1 : ca __ __ DEX
0af2 : d0 f6 __ BNE $0aea ; (memset.s4 + 8)
0af4 : a4 11 __ LDY P4 
0af6 : f0 05 __ BEQ $0afd ; (memset.s4 + 27)
0af8 : 88 __ __ DEY
0af9 : 91 0d __ STA (P0),y ; (dst + 0)
0afb : d0 fb __ BNE $0af8 ; (memset.s4 + 22)
0afd : a5 0d __ LDA P0 ; (dst + 0)
0aff : 85 1b __ STA ACCU + 0 
0b01 : a5 0e __ LDA P1 ; (dst + 1)
0b03 : 85 1c __ STA ACCU + 1 
.s3:
0b05 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0b06 : a4 0d __ LDY P0 ; (mode + 0)
0b08 : c0 02 __ CPY #$02
0b0a : d0 09 __ BNE $0b15 ; (vic_setmode.s5 + 0)
.s10:
0b0c : a9 5b __ LDA #$5b
0b0e : 8d 11 d0 STA $d011 
.s8:
0b11 : a9 08 __ LDA #$08
0b13 : d0 0c __ BNE $0b21 ; (vic_setmode.s7 + 0)
.s5:
0b15 : b0 36 __ BCS $0b4d ; (vic_setmode.s6 + 0)
.s9:
0b17 : a9 1b __ LDA #$1b
0b19 : 8d 11 d0 STA $d011 
0b1c : 98 __ __ TYA
0b1d : f0 f2 __ BEQ $0b11 ; (vic_setmode.s8 + 0)
.s11:
0b1f : a9 18 __ LDA #$18
.s7:
0b21 : 8d 16 d0 STA $d016 
0b24 : ad 00 dd LDA $dd00 
0b27 : 29 fc __ AND #$fc
0b29 : 85 1b __ STA ACCU + 0 
0b2b : a5 0f __ LDA P2 ; (text + 1)
0b2d : 0a __ __ ASL
0b2e : 2a __ __ ROL
0b2f : 29 01 __ AND #$01
0b31 : 2a __ __ ROL
0b32 : 49 03 __ EOR #$03
0b34 : 05 1b __ ORA ACCU + 0 
0b36 : 8d 00 dd STA $dd00 
0b39 : a5 0f __ LDA P2 ; (text + 1)
0b3b : 29 3c __ AND #$3c
0b3d : 0a __ __ ASL
0b3e : 0a __ __ ASL
0b3f : 85 1b __ STA ACCU + 0 
0b41 : a5 11 __ LDA P4 ; (font + 1)
0b43 : 29 38 __ AND #$38
0b45 : 4a __ __ LSR
0b46 : 4a __ __ LSR
0b47 : 05 1b __ ORA ACCU + 0 
0b49 : 8d 18 d0 STA $d018 
.s3:
0b4c : 60 __ __ RTS
.s6:
0b4d : a9 3b __ LDA #$3b
0b4f : 8d 11 d0 STA $d011 
0b52 : c0 03 __ CPY #$03
0b54 : d0 c9 __ BNE $0b1f ; (vic_setmode.s11 + 0)
0b56 : f0 b9 __ BEQ $0b11 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0b58 : a5 0f __ LDA P2 ; (data + 0)
0b5a : a0 00 __ LDY #$00
0b5c : 91 0d __ STA (P0),y ; (bm + 0)
0b5e : a5 10 __ LDA P3 ; (data + 1)
0b60 : c8 __ __ INY
0b61 : 91 0d __ STA (P0),y ; (bm + 0)
0b63 : a9 00 __ LDA #$00
0b65 : c8 __ __ INY
0b66 : 91 0d __ STA (P0),y ; (bm + 0)
0b68 : c8 __ __ INY
0b69 : 91 0d __ STA (P0),y ; (bm + 0)
0b6b : a5 11 __ LDA P4 ; (cw + 0)
0b6d : c8 __ __ INY
0b6e : 91 0d __ STA (P0),y ; (bm + 0)
0b70 : a5 12 __ LDA P5 ; (ch + 0)
0b72 : c8 __ __ INY
0b73 : 91 0d __ STA (P0),y ; (bm + 0)
0b75 : a9 00 __ LDA #$00
0b77 : 06 11 __ ASL P4 ; (cw + 0)
0b79 : 2a __ __ ROL
0b7a : 06 11 __ ASL P4 ; (cw + 0)
0b7c : 2a __ __ ROL
0b7d : 06 11 __ ASL P4 ; (cw + 0)
0b7f : 2a __ __ ROL
0b80 : a0 07 __ LDY #$07
0b82 : 91 0d __ STA (P0),y ; (bm + 0)
0b84 : a5 11 __ LDA P4 ; (cw + 0)
0b86 : 88 __ __ DEY
0b87 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0b89 : 60 __ __ RTS
--------------------------------------------------------------------
bm_alloc: ; bm_alloc(struct Bitmap*,u8,u8)->void
;  68, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0b8a : a5 10 __ LDA P3 ; (ch + 0)
0b8c : 85 1b __ STA ACCU + 0 
0b8e : a0 05 __ LDY #$05
0b90 : 91 0d __ STA (P0),y ; (bm + 0)
0b92 : a5 0f __ LDA P2 ; (cw + 0)
0b94 : 88 __ __ DEY
0b95 : 91 0d __ STA (P0),y ; (bm + 0)
0b97 : a2 00 __ LDX #$00
0b99 : 86 1c __ STX ACCU + 1 
0b9b : 20 4c 22 JSR $224c ; (mul16by8 + 0)
0b9e : 06 1b __ ASL ACCU + 0 
0ba0 : a5 1c __ LDA ACCU + 1 
0ba2 : 2a __ __ ROL
0ba3 : 06 1b __ ASL ACCU + 0 
0ba5 : 2a __ __ ROL
0ba6 : 06 1b __ ASL ACCU + 0 
0ba8 : 2a __ __ ROL
0ba9 : aa __ __ TAX
0baa : 18 __ __ CLC
0bab : a5 1b __ LDA ACCU + 0 
0bad : 69 08 __ ADC #$08
0baf : 85 1b __ STA ACCU + 0 
0bb1 : 90 01 __ BCC $0bb4 ; (bm_alloc.s6 + 0)
.s5:
0bb3 : e8 __ __ INX
.s6:
0bb4 : 86 1c __ STX ACCU + 1 
0bb6 : 20 4b 24 JSR $244b ; (crt_malloc + 0)
0bb9 : a5 1b __ LDA ACCU + 0 
0bbb : a0 02 __ LDY #$02
0bbd : 91 0d __ STA (P0),y ; (bm + 0)
0bbf : a5 1c __ LDA ACCU + 1 
0bc1 : c8 __ __ INY
0bc2 : 91 0d __ STA (P0),y ; (bm + 0)
0bc4 : a5 1b __ LDA ACCU + 0 
0bc6 : 29 07 __ AND #$07
0bc8 : 49 ff __ EOR #$ff
0bca : 38 __ __ SEC
0bcb : 69 00 __ ADC #$00
0bcd : 85 43 __ STA T3 + 0 
0bcf : a9 00 __ LDA #$00
0bd1 : e9 00 __ SBC #$00
0bd3 : 85 44 __ STA T3 + 1 
0bd5 : 18 __ __ CLC
0bd6 : a5 1b __ LDA ACCU + 0 
0bd8 : 69 08 __ ADC #$08
0bda : a8 __ __ TAY
0bdb : a5 1c __ LDA ACCU + 1 
0bdd : 69 00 __ ADC #$00
0bdf : aa __ __ TAX
0be0 : 98 __ __ TYA
0be1 : 18 __ __ CLC
0be2 : 65 43 __ ADC T3 + 0 
0be4 : a0 00 __ LDY #$00
0be6 : 91 0d __ STA (P0),y ; (bm + 0)
0be8 : 8a __ __ TXA
0be9 : 65 44 __ ADC T3 + 1 
0beb : c8 __ __ INY
0bec : 91 0d __ STA (P0),y ; (bm + 0)
0bee : a9 00 __ LDA #$00
0bf0 : 06 0f __ ASL P2 ; (cw + 0)
0bf2 : 2a __ __ ROL
0bf3 : 06 0f __ ASL P2 ; (cw + 0)
0bf5 : 2a __ __ ROL
0bf6 : 06 0f __ ASL P2 ; (cw + 0)
0bf8 : 2a __ __ ROL
0bf9 : a0 07 __ LDY #$07
0bfb : 91 0d __ STA (P0),y ; (bm + 0)
0bfd : a5 0f __ LDA P2 ; (cw + 0)
0bff : 88 __ __ DEY
0c00 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0c02 : 60 __ __ RTS
--------------------------------------------------------------------
bm_fill: ; bm_fill(const struct Bitmap*,u8)->void
;  74, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0c03 : a0 00 __ LDY #$00
0c05 : b1 13 __ LDA (P6),y ; (bm + 0)
0c07 : 85 0d __ STA P0 
0c09 : c8 __ __ INY
0c0a : b1 13 __ LDA (P6),y ; (bm + 0)
0c0c : 85 0e __ STA P1 
0c0e : a5 15 __ LDA P8 ; (data + 0)
0c10 : 85 0f __ STA P2 
0c12 : a0 05 __ LDY #$05
0c14 : b1 13 __ LDA (P6),y ; (bm + 0)
0c16 : 85 1b __ STA ACCU + 0 
0c18 : a9 00 __ LDA #$00
0c1a : 85 10 __ STA P3 
0c1c : 85 1c __ STA ACCU + 1 
0c1e : 88 __ __ DEY
0c1f : b1 13 __ LDA (P6),y ; (bm + 0)
0c21 : 20 4c 22 JSR $224c ; (mul16by8 + 0)
0c24 : a5 1b __ LDA ACCU + 0 
0c26 : 0a __ __ ASL
0c27 : 85 11 __ STA P4 
0c29 : a5 1c __ LDA ACCU + 1 
0c2b : 2a __ __ ROL
0c2c : 06 11 __ ASL P4 
0c2e : 2a __ __ ROL
0c2f : 06 11 __ ASL P4 
0c31 : 2a __ __ ROL
0c32 : 85 12 __ STA P5 
0c34 : 4c e2 0a JMP $0ae2 ; (memset.s4 + 0)
--------------------------------------------------------------------
0c37 : __ __ __ BYT 00 00 00 00 40 00 40 00                         : ....@.@.
--------------------------------------------------------------------
bm_polygon_nc_fill: ; bm_polygon_nc_fill(const struct Bitmap*,const struct ClipRect*,i16*,i16*,u8,const u8*)->void
;  98, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
0c3f : a2 0f __ LDX #$0f
0c41 : b5 53 __ LDA T6 + 0,x 
0c43 : 9d bd 9f STA $9fbd,x ; (bm_polygon_nc_fill@stack + 0)
0c46 : ca __ __ DEX
0c47 : 10 f8 __ BPL $0c41 ; (bm_polygon_nc_fill.s1 + 2)
.s4:
0c49 : a9 00 __ LDA #$00
0c4b : 85 5b __ STA T10 + 0 
0c4d : 85 5c __ STA T10 + 1 
0c4f : 85 5d __ STA T11 + 0 
0c51 : 85 5e __ STA T11 + 1 
0c53 : a5 18 __ LDA P11 ; (num + 0)
0c55 : 85 61 __ STA T13 + 0 
0c57 : a9 00 __ LDA #$00
0c59 : 85 4f __ STA T3 + 0 
0c5b : a9 29 __ LDA #$29
0c5d : 85 50 __ STA T3 + 1 
0c5f : a9 10 __ LDA #$10
0c61 : c5 18 __ CMP P11 ; (num + 0)
0c63 : b0 02 __ BCS $0c67 ; (bm_polygon_nc_fill.s5 + 0)
.s94:
0c65 : 85 61 __ STA T13 + 0 
.s5:
0c67 : ad d1 9f LDA $9fd1 ; (sstack + 2)
0c6a : 85 5f __ STA T12 + 0 
0c6c : ad d2 9f LDA $9fd2 ; (sstack + 3)
0c6f : 85 60 __ STA T12 + 1 
0c71 : a5 61 __ LDA T13 + 0 
0c73 : d0 03 __ BNE $0c78 ; (bm_polygon_nc_fill.s50 + 0)
0c75 : 4c 3a 0d JMP $0d3a ; (bm_polygon_nc_fill.s6 + 0)
.s50:
0c78 : a9 00 __ LDA #$00
0c7a : 85 62 __ STA T14 + 0 
0c7c : 85 43 __ STA T4 + 0 
0c7e : a0 02 __ LDY #$02
0c80 : b1 5f __ LDA (T12 + 0),y 
0c82 : 85 51 __ STA T5 + 0 
0c84 : c8 __ __ INY
0c85 : b1 5f __ LDA (T12 + 0),y 
0c87 : 85 52 __ STA T5 + 1 
0c89 : a0 06 __ LDY #$06
0c8b : b1 5f __ LDA (T12 + 0),y 
0c8d : 85 53 __ STA T6 + 0 
0c8f : c8 __ __ INY
0c90 : b1 5f __ LDA (T12 + 0),y 
0c92 : 85 54 __ STA T6 + 1 
0c94 : a2 00 __ LDX #$00
0c96 : 18 __ __ CLC
.l51:
0c97 : a5 43 __ LDA T4 + 0 
0c99 : 69 01 __ ADC #$01
0c9b : c5 61 __ CMP T13 + 0 
0c9d : 90 02 __ BCC $0ca1 ; (bm_polygon_nc_fill.s52 + 0)
.s93:
0c9f : a9 00 __ LDA #$00
.s52:
0ca1 : 85 45 __ STA T0 + 0 
0ca3 : ad d5 9f LDA $9fd5 ; (sstack + 6)
0ca6 : 85 49 __ STA T1 + 0 
0ca8 : ad d6 9f LDA $9fd6 ; (sstack + 7)
0cab : 85 4a __ STA T1 + 1 
0cad : a5 43 __ LDA T4 + 0 
0caf : 0a __ __ ASL
0cb0 : a8 __ __ TAY
0cb1 : b1 49 __ LDA (T1 + 0),y 
0cb3 : 85 55 __ STA T7 + 0 
0cb5 : c8 __ __ INY
0cb6 : b1 49 __ LDA (T1 + 0),y 
0cb8 : 85 56 __ STA T7 + 1 
0cba : a5 45 __ LDA T0 + 0 
0cbc : 0a __ __ ASL
0cbd : a8 __ __ TAY
0cbe : b1 49 __ LDA (T1 + 0),y 
0cc0 : 85 4d __ STA T2 + 0 
0cc2 : a5 56 __ LDA T7 + 1 
0cc4 : c8 __ __ INY
0cc5 : d1 49 __ CMP (T1 + 0),y 
0cc7 : d0 06 __ BNE $0ccf ; (bm_polygon_nc_fill.s54 + 0)
.s92:
0cc9 : a5 55 __ LDA T7 + 0 
0ccb : c5 4d __ CMP T2 + 0 
0ccd : f0 5e __ BEQ $0d2d ; (bm_polygon_nc_fill.s53 + 0)
.s54:
0ccf : b1 49 __ LDA (T1 + 0),y 
0cd1 : c5 56 __ CMP T7 + 1 
0cd3 : d0 08 __ BNE $0cdd ; (bm_polygon_nc_fill.s91 + 0)
.s88:
0cd5 : a5 4d __ LDA T2 + 0 
0cd7 : c5 55 __ CMP T7 + 0 
.s89:
0cd9 : 90 08 __ BCC $0ce3 ; (bm_polygon_nc_fill.s87 + 0)
0cdb : b0 0c __ BCS $0ce9 ; (bm_polygon_nc_fill.s55 + 0)
.s91:
0cdd : 45 56 __ EOR T7 + 1 
0cdf : 10 f8 __ BPL $0cd9 ; (bm_polygon_nc_fill.s89 + 0)
.s90:
0ce1 : 90 06 __ BCC $0ce9 ; (bm_polygon_nc_fill.s55 + 0)
.s87:
0ce3 : a5 62 __ LDA T14 + 0 
0ce5 : a6 45 __ LDX T0 + 0 
0ce7 : 85 45 __ STA T0 + 0 
.s55:
0ce9 : 8a __ __ TXA
0cea : 0a __ __ ASL
0ceb : 85 4d __ STA T2 + 0 
0ced : a8 __ __ TAY
0cee : b1 49 __ LDA (T1 + 0),y 
0cf0 : 85 55 __ STA T7 + 0 
0cf2 : c8 __ __ INY
0cf3 : b1 49 __ LDA (T1 + 0),y 
0cf5 : 85 56 __ STA T7 + 1 
0cf7 : c5 54 __ CMP T6 + 1 
0cf9 : d0 08 __ BNE $0d03 ; (bm_polygon_nc_fill.s86 + 0)
.s83:
0cfb : a5 55 __ LDA T7 + 0 
0cfd : c5 53 __ CMP T6 + 0 
.s84:
0cff : 90 08 __ BCC $0d09 ; (bm_polygon_nc_fill.s56 + 0)
0d01 : b0 2a __ BCS $0d2d ; (bm_polygon_nc_fill.s53 + 0)
.s86:
0d03 : 45 54 __ EOR T6 + 1 
0d05 : 10 f8 __ BPL $0cff ; (bm_polygon_nc_fill.s84 + 0)
.s85:
0d07 : 90 24 __ BCC $0d2d ; (bm_polygon_nc_fill.s53 + 0)
.s56:
0d09 : a5 45 __ LDA T0 + 0 
0d0b : 0a __ __ ASL
0d0c : 85 57 __ STA T8 + 0 
0d0e : a8 __ __ TAY
0d0f : b1 49 __ LDA (T1 + 0),y 
0d11 : 85 59 __ STA T9 + 0 
0d13 : c8 __ __ INY
0d14 : b1 49 __ LDA (T1 + 0),y 
0d16 : 85 5a __ STA T9 + 1 
0d18 : a5 52 __ LDA T5 + 1 
0d1a : c5 5a __ CMP T9 + 1 
0d1c : d0 09 __ BNE $0d27 ; (bm_polygon_nc_fill.s82 + 0)
.s79:
0d1e : a5 51 __ LDA T5 + 0 
0d20 : c5 59 __ CMP T9 + 0 
.s80:
0d22 : b0 09 __ BCS $0d2d ; (bm_polygon_nc_fill.s53 + 0)
0d24 : 4c f3 0f JMP $0ff3 ; (bm_polygon_nc_fill.s57 + 0)
.s82:
0d27 : 45 5a __ EOR T9 + 1 
0d29 : 10 f7 __ BPL $0d22 ; (bm_polygon_nc_fill.s80 + 0)
.s81:
0d2b : b0 f7 __ BCS $0d24 ; (bm_polygon_nc_fill.s80 + 2)
.s53:
0d2d : e6 43 __ INC T4 + 0 
0d2f : e6 62 __ INC T14 + 0 
0d31 : a6 62 __ LDX T14 + 0 
0d33 : e4 61 __ CPX T13 + 0 
0d35 : b0 03 __ BCS $0d3a ; (bm_polygon_nc_fill.s6 + 0)
0d37 : 4c 97 0c JMP $0c97 ; (bm_polygon_nc_fill.l51 + 0)
.s6:
0d3a : a5 5b __ LDA T10 + 0 
0d3c : 05 5c __ ORA T10 + 1 
0d3e : f0 69 __ BEQ $0da9 ; (bm_polygon_nc_fill.s3 + 0)
.s7:
0d40 : a0 00 __ LDY #$00
0d42 : 84 1c __ STY ACCU + 1 ; (clip + 1)
0d44 : ad cf 9f LDA $9fcf ; (sstack + 0)
0d47 : 85 4d __ STA T2 + 0 
0d49 : ad d0 9f LDA $9fd0 ; (sstack + 1)
0d4c : 85 4e __ STA T2 + 1 
0d4e : b1 5b __ LDA (T10 + 0),y 
0d50 : 85 59 __ STA T9 + 0 
0d52 : 29 f8 __ AND #$f8
0d54 : aa __ __ TAX
0d55 : a0 04 __ LDY #$04
0d57 : b1 4d __ LDA (T2 + 0),y 
0d59 : 85 4f __ STA T3 + 0 
0d5b : 85 1b __ STA ACCU + 0 ; (clip + 0)
0d5d : 8a __ __ TXA
0d5e : 20 4c 22 JSR $224c ; (mul16by8 + 0)
0d61 : a0 00 __ LDY #$00
0d63 : b1 4d __ LDA (T2 + 0),y 
0d65 : 18 __ __ CLC
0d66 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0d68 : 85 02 __ STA $02 
0d6a : c8 __ __ INY
0d6b : b1 4d __ LDA (T2 + 0),y 
0d6d : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0d6f : aa __ __ TAX
0d70 : a5 59 __ LDA T9 + 0 
0d72 : 29 07 __ AND #$07
0d74 : 18 __ __ CLC
0d75 : 65 02 __ ADC $02 
0d77 : 85 53 __ STA T6 + 0 
0d79 : 90 02 __ BCC $0d7d ; (bm_polygon_nc_fill.s102 + 0)
.s101:
0d7b : e8 __ __ INX
0d7c : 18 __ __ CLC
.s102:
0d7d : 86 54 __ STX T6 + 1 
0d7f : a5 4f __ LDA T3 + 0 
0d81 : 69 ff __ ADC #$ff
0d83 : 2a __ __ ROL
0d84 : 2a __ __ ROL
0d85 : 2a __ __ ROL
0d86 : aa __ __ TAX
0d87 : 29 f8 __ AND #$f8
0d89 : 85 55 __ STA T7 + 0 
0d8b : 8a __ __ TXA
0d8c : 29 07 __ AND #$07
0d8e : 2a __ __ ROL
0d8f : 69 f8 __ ADC #$f8
0d91 : 85 56 __ STA T7 + 1 
0d93 : ad d7 9f LDA $9fd7 ; (sstack + 8)
0d96 : 85 57 __ STA T8 + 0 
0d98 : ad d8 9f LDA $9fd8 ; (sstack + 9)
0d9b : 85 58 __ STA T8 + 1 
0d9d : a5 5b __ LDA T10 + 0 
0d9f : 05 5c __ ORA T10 + 1 
0da1 : d0 1a __ BNE $0dbd ; (bm_polygon_nc_fill.l15 + 0)
.s8:
0da3 : a5 5d __ LDA T11 + 0 
0da5 : 05 5e __ ORA T11 + 1 
0da7 : d0 0b __ BNE $0db4 ; (bm_polygon_nc_fill.s9 + 0)
.s3:
0da9 : a2 0f __ LDX #$0f
0dab : bd bd 9f LDA $9fbd,x ; (bm_polygon_nc_fill@stack + 0)
0dae : 95 53 __ STA T6 + 0,x 
0db0 : ca __ __ DEX
0db1 : 10 f8 __ BPL $0dab ; (bm_polygon_nc_fill.s3 + 2)
0db3 : 60 __ __ RTS
.s9:
0db4 : a5 5b __ LDA T10 + 0 
0db6 : 05 5c __ ORA T10 + 1 
0db8 : d0 03 __ BNE $0dbd ; (bm_polygon_nc_fill.l15 + 0)
0dba : 4c 72 0e JMP $0e72 ; (bm_polygon_nc_fill.l10 + 0)
.l15:
0dbd : a5 59 __ LDA T9 + 0 
0dbf : a0 00 __ LDY #$00
0dc1 : d1 5b __ CMP (T10 + 0),y 
0dc3 : d0 f5 __ BNE $0dba ; (bm_polygon_nc_fill.s9 + 6)
.l16:
0dc5 : 84 43 __ STY T4 + 0 
0dc7 : 84 44 __ STY T4 + 1 
0dc9 : a5 5e __ LDA T11 + 1 
0dcb : 85 50 __ STA T3 + 1 
0dcd : a0 0a __ LDY #$0a
0dcf : b1 5b __ LDA (T10 + 0),y 
0dd1 : 85 51 __ STA T5 + 0 
0dd3 : c8 __ __ INY
0dd4 : b1 5b __ LDA (T10 + 0),y 
0dd6 : 85 52 __ STA T5 + 1 
0dd8 : a5 5d __ LDA T11 + 0 
0dda : 85 4f __ STA T3 + 0 
0ddc : 05 5e __ ORA T11 + 1 
0dde : f0 56 __ BEQ $0e36 ; (bm_polygon_nc_fill.s17 + 0)
.s22:
0de0 : a0 02 __ LDY #$02
0de2 : b1 5b __ LDA (T10 + 0),y 
0de4 : 85 45 __ STA T0 + 0 
0de6 : c8 __ __ INY
0de7 : b1 5b __ LDA (T10 + 0),y 
0de9 : 85 46 __ STA T0 + 1 
0deb : c8 __ __ INY
0dec : b1 5b __ LDA (T10 + 0),y 
0dee : 85 47 __ STA T0 + 2 
0df0 : c8 __ __ INY
0df1 : b1 5b __ LDA (T10 + 0),y 
0df3 : 85 48 __ STA T0 + 3 
0df5 : a6 02 __ LDX $02 
.l23:
0df7 : a0 02 __ LDY #$02
0df9 : b1 4f __ LDA (T3 + 0),y 
0dfb : 85 49 __ STA T1 + 0 
0dfd : c8 __ __ INY
0dfe : b1 4f __ LDA (T3 + 0),y 
0e00 : 85 4a __ STA T1 + 1 
0e02 : c8 __ __ INY
0e03 : b1 4f __ LDA (T3 + 0),y 
0e05 : 85 4b __ STA T1 + 2 
0e07 : c8 __ __ INY
0e08 : b1 4f __ LDA (T3 + 0),y 
0e0a : c5 48 __ CMP T0 + 3 
0e0c : d0 03 __ BNE $0e11 ; (bm_polygon_nc_fill.s41 + 0)
0e0e : 4c dd 0f JMP $0fdd ; (bm_polygon_nc_fill.s36 + 0)
.s41:
0e11 : 45 48 __ EOR T0 + 3 
0e13 : 30 05 __ BMI $0e1a ; (bm_polygon_nc_fill.s40 + 0)
.s39:
0e15 : 90 05 __ BCC $0e1c ; (bm_polygon_nc_fill.s26 + 0)
0e17 : 4c 96 0f JMP $0f96 ; (bm_polygon_nc_fill.s24 + 0)
.s40:
0e1a : 90 fb __ BCC $0e17 ; (bm_polygon_nc_fill.s39 + 2)
.s26:
0e1c : a5 4f __ LDA T3 + 0 
0e1e : 85 43 __ STA T4 + 0 
0e20 : a5 50 __ LDA T3 + 1 
0e22 : 85 44 __ STA T4 + 1 
0e24 : a0 0a __ LDY #$0a
0e26 : b1 4f __ LDA (T3 + 0),y 
0e28 : aa __ __ TAX
0e29 : c8 __ __ INY
0e2a : b1 4f __ LDA (T3 + 0),y 
0e2c : 86 4f __ STX T3 + 0 
0e2e : 85 50 __ STA T3 + 1 
0e30 : 05 4f __ ORA T3 + 0 
0e32 : d0 c3 __ BNE $0df7 ; (bm_polygon_nc_fill.l23 + 0)
.s98:
0e34 : 86 02 __ STX $02 
.s17:
0e36 : a5 4f __ LDA T3 + 0 
0e38 : a0 0a __ LDY #$0a
0e3a : 91 5b __ STA (T10 + 0),y 
0e3c : a5 50 __ LDA T3 + 1 
0e3e : c8 __ __ INY
0e3f : 91 5b __ STA (T10 + 0),y 
0e41 : a5 43 __ LDA T4 + 0 
0e43 : 05 44 __ ORA T4 + 1 
0e45 : f0 0c __ BEQ $0e53 ; (bm_polygon_nc_fill.s18 + 0)
.s21:
0e47 : a5 5b __ LDA T10 + 0 
0e49 : 88 __ __ DEY
0e4a : 91 43 __ STA (T4 + 0),y 
0e4c : a5 5c __ LDA T10 + 1 
0e4e : c8 __ __ INY
0e4f : 91 43 __ STA (T4 + 0),y 
0e51 : d0 08 __ BNE $0e5b ; (bm_polygon_nc_fill.s19 + 0)
.s18:
0e53 : a5 5b __ LDA T10 + 0 
0e55 : 85 5d __ STA T11 + 0 
0e57 : a5 5c __ LDA T10 + 1 
0e59 : 85 5e __ STA T11 + 1 
.s19:
0e5b : a5 51 __ LDA T5 + 0 
0e5d : 85 5b __ STA T10 + 0 
0e5f : a5 52 __ LDA T5 + 1 
0e61 : 85 5c __ STA T10 + 1 
0e63 : 05 51 __ ORA T5 + 0 
0e65 : f0 0b __ BEQ $0e72 ; (bm_polygon_nc_fill.l10 + 0)
.s20:
0e67 : a5 59 __ LDA T9 + 0 
0e69 : a0 00 __ LDY #$00
0e6b : d1 51 __ CMP (T5 + 0),y 
0e6d : d0 03 __ BNE $0e72 ; (bm_polygon_nc_fill.l10 + 0)
0e6f : 4c c5 0d JMP $0dc5 ; (bm_polygon_nc_fill.l16 + 0)
.l10:
0e72 : a5 5d __ LDA T11 + 0 
0e74 : 05 5e __ ORA T11 + 1 
0e76 : f0 03 __ BEQ $0e7b ; (bm_polygon_nc_fill.s11 + 0)
0e78 : 4c 2a 0f JMP $0f2a ; (bm_polygon_nc_fill.s49 + 0)
.s11:
0e7b : e6 53 __ INC T6 + 0 
0e7d : d0 02 __ BNE $0e81 ; (bm_polygon_nc_fill.s104 + 0)
.s103:
0e7f : e6 54 __ INC T6 + 1 
.s104:
0e81 : a5 53 __ LDA T6 + 0 
0e83 : 29 07 __ AND #$07
0e85 : d0 0d __ BNE $0e94 ; (bm_polygon_nc_fill.s13 + 0)
.s12:
0e87 : 18 __ __ CLC
0e88 : a5 53 __ LDA T6 + 0 
0e8a : 65 55 __ ADC T7 + 0 
0e8c : 85 53 __ STA T6 + 0 
0e8e : a5 54 __ LDA T6 + 1 
0e90 : 65 56 __ ADC T7 + 1 
0e92 : 85 54 __ STA T6 + 1 
.s13:
0e94 : e6 59 __ INC T9 + 0 
0e96 : a5 5d __ LDA T11 + 0 
0e98 : 05 5e __ ORA T11 + 1 
0e9a : f0 67 __ BEQ $0f03 ; (bm_polygon_nc_fill.s14 + 0)
.s42:
0e9c : a5 5d __ LDA T11 + 0 
0e9e : 85 4d __ STA T2 + 0 
0ea0 : a5 5e __ LDA T11 + 1 
0ea2 : 85 4e __ STA T2 + 1 
0ea4 : a9 00 __ LDA #$00
0ea6 : 85 45 __ STA T0 + 0 
0ea8 : 85 46 __ STA T0 + 1 
.l43:
0eaa : a5 59 __ LDA T9 + 0 
0eac : a0 01 __ LDY #$01
0eae : d1 4d __ CMP (T2 + 0),y 
0eb0 : f0 34 __ BEQ $0ee6 ; (bm_polygon_nc_fill.s46 + 0)
.s44:
0eb2 : 18 __ __ CLC
0eb3 : a0 06 __ LDY #$06
0eb5 : b1 4d __ LDA (T2 + 0),y 
0eb7 : a0 02 __ LDY #$02
0eb9 : 71 4d __ ADC (T2 + 0),y 
0ebb : 91 4d __ STA (T2 + 0),y 
0ebd : a0 07 __ LDY #$07
0ebf : b1 4d __ LDA (T2 + 0),y 
0ec1 : a0 03 __ LDY #$03
0ec3 : 71 4d __ ADC (T2 + 0),y 
0ec5 : 91 4d __ STA (T2 + 0),y 
0ec7 : a0 08 __ LDY #$08
0ec9 : b1 4d __ LDA (T2 + 0),y 
0ecb : a0 04 __ LDY #$04
0ecd : 71 4d __ ADC (T2 + 0),y 
0ecf : 91 4d __ STA (T2 + 0),y 
0ed1 : a0 09 __ LDY #$09
0ed3 : b1 4d __ LDA (T2 + 0),y 
0ed5 : a0 05 __ LDY #$05
0ed7 : 71 4d __ ADC (T2 + 0),y 
0ed9 : 91 4d __ STA (T2 + 0),y 
0edb : a5 4d __ LDA T2 + 0 
0edd : 85 45 __ STA T0 + 0 
0edf : a5 4e __ LDA T2 + 1 
0ee1 : 85 46 __ STA T0 + 1 
0ee3 : 4c 18 0f JMP $0f18 ; (bm_polygon_nc_fill.s45 + 0)
.s46:
0ee6 : a5 45 __ LDA T0 + 0 
0ee8 : a0 0a __ LDY #$0a
0eea : 05 46 __ ORA T0 + 1 
0eec : d0 21 __ BNE $0f0f ; (bm_polygon_nc_fill.s48 + 0)
.s47:
0eee : b1 4d __ LDA (T2 + 0),y 
0ef0 : aa __ __ TAX
0ef1 : c8 __ __ INY
0ef2 : b1 4d __ LDA (T2 + 0),y 
0ef4 : 86 4d __ STX T2 + 0 
0ef6 : 86 5d __ STX T11 + 0 
0ef8 : 85 4e __ STA T2 + 1 
0efa : 85 5e __ STA T11 + 1 
0efc : 8a __ __ TXA
0efd : 05 4e __ ORA T2 + 1 
0eff : d0 a9 __ BNE $0eaa ; (bm_polygon_nc_fill.l43 + 0)
.s99:
0f01 : 86 02 __ STX $02 
.s14:
0f03 : a5 5b __ LDA T10 + 0 
0f05 : 05 5c __ ORA T10 + 1 
0f07 : f0 03 __ BEQ $0f0c ; (bm_polygon_nc_fill.s14 + 9)
0f09 : 4c bd 0d JMP $0dbd ; (bm_polygon_nc_fill.l15 + 0)
0f0c : 4c a3 0d JMP $0da3 ; (bm_polygon_nc_fill.s8 + 0)
.s48:
0f0f : b1 4d __ LDA (T2 + 0),y 
0f11 : 91 45 __ STA (T0 + 0),y 
0f13 : c8 __ __ INY
0f14 : b1 4d __ LDA (T2 + 0),y 
0f16 : 91 45 __ STA (T0 + 0),y 
.s45:
0f18 : a0 0a __ LDY #$0a
0f1a : b1 4d __ LDA (T2 + 0),y 
0f1c : aa __ __ TAX
0f1d : c8 __ __ INY
0f1e : b1 4d __ LDA (T2 + 0),y 
0f20 : 86 4d __ STX T2 + 0 
0f22 : 85 4e __ STA T2 + 1 
0f24 : 05 4d __ ORA T2 + 0 
0f26 : f0 d9 __ BEQ $0f01 ; (bm_polygon_nc_fill.s99 + 0)
0f28 : d0 80 __ BNE $0eaa ; (bm_polygon_nc_fill.l43 + 0)
.s49:
0f2a : a5 59 __ LDA T9 + 0 
0f2c : 29 07 __ AND #$07
0f2e : 85 4f __ STA T3 + 0 
0f30 : a5 5d __ LDA T11 + 0 
0f32 : 85 49 __ STA T1 + 0 
0f34 : a5 5e __ LDA T11 + 1 
0f36 : 85 4a __ STA T1 + 1 
0f38 : a5 53 __ LDA T6 + 0 
0f3a : 85 11 __ STA P4 
0f3c : a5 54 __ LDA T6 + 1 
0f3e : 85 12 __ STA P5 
.l95:
0f40 : a4 4f __ LDY T3 + 0 
0f42 : b1 57 __ LDA (T8 + 0),y 
0f44 : 85 17 __ STA P10 
0f46 : a0 00 __ LDY #$00
0f48 : b1 5f __ LDA (T12 + 0),y 
0f4a : 85 0d __ STA P0 
0f4c : c8 __ __ INY
0f4d : b1 5f __ LDA (T12 + 0),y 
0f4f : 85 0e __ STA P1 
0f51 : a0 04 __ LDY #$04
0f53 : b1 5f __ LDA (T12 + 0),y 
0f55 : 85 0f __ STA P2 
0f57 : c8 __ __ INY
0f58 : b1 5f __ LDA (T12 + 0),y 
0f5a : 85 10 __ STA P3 
0f5c : 88 __ __ DEY
0f5d : b1 49 __ LDA (T1 + 0),y 
0f5f : 85 13 __ STA P6 
0f61 : c8 __ __ INY
0f62 : b1 49 __ LDA (T1 + 0),y 
0f64 : 85 14 __ STA P7 
0f66 : a0 0a __ LDY #$0a
0f68 : b1 49 __ LDA (T1 + 0),y 
0f6a : aa __ __ TAX
0f6b : c8 __ __ INY
0f6c : b1 49 __ LDA (T1 + 0),y 
0f6e : 86 49 __ STX T1 + 0 
0f70 : 85 4a __ STA T1 + 1 
0f72 : a0 04 __ LDY #$04
0f74 : b1 49 __ LDA (T1 + 0),y 
0f76 : 85 15 __ STA P8 
0f78 : c8 __ __ INY
0f79 : b1 49 __ LDA (T1 + 0),y 
0f7b : 85 16 __ STA P9 
0f7d : 20 67 11 JSR $1167 ; (bm_scan_fill.s4 + 0)
0f80 : a0 0a __ LDY #$0a
0f82 : b1 49 __ LDA (T1 + 0),y 
0f84 : 85 02 __ STA $02 
0f86 : c8 __ __ INY
0f87 : b1 49 __ LDA (T1 + 0),y 
0f89 : 85 4a __ STA T1 + 1 
0f8b : a5 02 __ LDA $02 
0f8d : 85 49 __ STA T1 + 0 
0f8f : 05 4a __ ORA T1 + 1 
0f91 : d0 ad __ BNE $0f40 ; (bm_polygon_nc_fill.l95 + 0)
0f93 : 4c 7b 0e JMP $0e7b ; (bm_polygon_nc_fill.s11 + 0)
.s24:
0f96 : a5 48 __ LDA T0 + 3 
0f98 : d1 4f __ CMP (T3 + 0),y 
0f9a : f0 03 __ BEQ $0f9f ; (bm_polygon_nc_fill.s33 + 0)
0f9c : 4c 34 0e JMP $0e34 ; (bm_polygon_nc_fill.s98 + 0)
.s33:
0f9f : a5 47 __ LDA T0 + 2 
0fa1 : c5 4b __ CMP T1 + 2 
0fa3 : d0 f7 __ BNE $0f9c ; (bm_polygon_nc_fill.s24 + 6)
.s34:
0fa5 : a5 46 __ LDA T0 + 1 
0fa7 : c5 4a __ CMP T1 + 1 
0fa9 : d0 f1 __ BNE $0f9c ; (bm_polygon_nc_fill.s24 + 6)
.s35:
0fab : a5 45 __ LDA T0 + 0 
0fad : c5 49 __ CMP T1 + 0 
0faf : d0 eb __ BNE $0f9c ; (bm_polygon_nc_fill.s24 + 6)
.s25:
0fb1 : a0 09 __ LDY #$09
0fb3 : b1 4f __ LDA (T3 + 0),y 
0fb5 : d1 5b __ CMP (T10 + 0),y 
0fb7 : f0 0e __ BEQ $0fc7 ; (bm_polygon_nc_fill.s27 + 0)
.s32:
0fb9 : 51 5b __ EOR (T10 + 0),y 
0fbb : 30 05 __ BMI $0fc2 ; (bm_polygon_nc_fill.s31 + 0)
.s30:
0fbd : b0 dd __ BCS $0f9c ; (bm_polygon_nc_fill.s24 + 6)
0fbf : 4c 1c 0e JMP $0e1c ; (bm_polygon_nc_fill.s26 + 0)
.s31:
0fc2 : 90 d8 __ BCC $0f9c ; (bm_polygon_nc_fill.s24 + 6)
0fc4 : 4c 1c 0e JMP $0e1c ; (bm_polygon_nc_fill.s26 + 0)
.s27:
0fc7 : 88 __ __ DEY
0fc8 : b1 4f __ LDA (T3 + 0),y 
0fca : d1 5b __ CMP (T10 + 0),y 
0fcc : d0 ef __ BNE $0fbd ; (bm_polygon_nc_fill.s30 + 0)
.s28:
0fce : 88 __ __ DEY
0fcf : b1 4f __ LDA (T3 + 0),y 
0fd1 : d1 5b __ CMP (T10 + 0),y 
0fd3 : d0 e8 __ BNE $0fbd ; (bm_polygon_nc_fill.s30 + 0)
.s29:
0fd5 : 88 __ __ DEY
0fd6 : b1 4f __ LDA (T3 + 0),y 
0fd8 : d1 5b __ CMP (T10 + 0),y 
0fda : 4c bd 0f JMP $0fbd ; (bm_polygon_nc_fill.s30 + 0)
.s36:
0fdd : a5 4b __ LDA T1 + 2 
0fdf : c5 47 __ CMP T0 + 2 
0fe1 : f0 03 __ BEQ $0fe6 ; (bm_polygon_nc_fill.s37 + 0)
0fe3 : 4c 15 0e JMP $0e15 ; (bm_polygon_nc_fill.s39 + 0)
.s37:
0fe6 : a5 4a __ LDA T1 + 1 
0fe8 : c5 46 __ CMP T0 + 1 
0fea : d0 f7 __ BNE $0fe3 ; (bm_polygon_nc_fill.s36 + 6)
.s38:
0fec : a5 49 __ LDA T1 + 0 
0fee : c5 45 __ CMP T0 + 0 
0ff0 : 4c 15 0e JMP $0e15 ; (bm_polygon_nc_fill.s39 + 0)
.s57:
0ff3 : ad d3 9f LDA $9fd3 ; (sstack + 4)
0ff6 : 85 49 __ STA T1 + 0 
0ff8 : ad d4 9f LDA $9fd4 ; (sstack + 5)
0ffb : 85 4a __ STA T1 + 1 
0ffd : a4 4d __ LDY T2 + 0 
0fff : b1 49 __ LDA (T1 + 0),y 
1001 : 85 47 __ STA T0 + 2 
1003 : c8 __ __ INY
1004 : b1 49 __ LDA (T1 + 0),y 
1006 : 85 48 __ STA T0 + 3 
1008 : a0 05 __ LDY #$05
100a : 91 4f __ STA (T3 + 0),y 
100c : a9 00 __ LDA #$00
100e : a0 02 __ LDY #$02
1010 : 91 4f __ STA (T3 + 0),y 
1012 : a9 80 __ LDA #$80
1014 : 85 1c __ STA ACCU + 1 ; (clip + 1)
1016 : c8 __ __ INY
1017 : 91 4f __ STA (T3 + 0),y 
1019 : a5 47 __ LDA T0 + 2 
101b : c8 __ __ INY
101c : 91 4f __ STA (T3 + 0),y 
101e : a4 57 __ LDY T8 + 0 
1020 : b1 49 __ LDA (T1 + 0),y 
1022 : 18 __ __ CLC
1023 : e5 47 __ SBC T0 + 2 
1025 : 85 1d __ STA ACCU + 2 ; (px + 0)
1027 : c8 __ __ INY
1028 : b1 49 __ LDA (T1 + 0),y 
102a : e5 48 __ SBC T0 + 3 
102c : 85 1e __ STA ACCU + 3 ; (px + 1)
102e : 38 __ __ SEC
102f : a5 59 __ LDA T9 + 0 
1031 : e5 55 __ SBC T7 + 0 
1033 : 85 03 __ STA WORK + 0 
1035 : a5 5a __ LDA T9 + 1 
1037 : e5 56 __ SBC T7 + 1 
1039 : 85 04 __ STA WORK + 1 
103b : 0a __ __ ASL
103c : a9 00 __ LDA #$00
103e : 85 1b __ STA ACCU + 0 ; (clip + 0)
1040 : 69 ff __ ADC #$ff
1042 : 49 ff __ EOR #$ff
1044 : 85 06 __ STA WORK + 3 
1046 : 85 05 __ STA WORK + 2 
1048 : 20 22 23 JSR $2322 ; (divs32 + 0)
104b : a5 1b __ LDA ACCU + 0 ; (clip + 0)
104d : a0 06 __ LDY #$06
104f : 91 4f __ STA (T3 + 0),y 
1051 : aa __ __ TAX
1052 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
1054 : 85 4a __ STA T1 + 1 
1056 : c8 __ __ INY
1057 : 91 4f __ STA (T3 + 0),y 
1059 : a5 1d __ LDA ACCU + 2 ; (px + 0)
105b : 85 4b __ STA T1 + 2 
105d : c8 __ __ INY
105e : 91 4f __ STA (T3 + 0),y 
1060 : a5 1e __ LDA ACCU + 3 ; (px + 1)
1062 : 85 4c __ STA T1 + 3 
1064 : c8 __ __ INY
1065 : 91 4f __ STA (T3 + 0),y 
1067 : a5 56 __ LDA T7 + 1 
1069 : c5 52 __ CMP T5 + 1 
106b : d0 08 __ BNE $1075 ; (bm_polygon_nc_fill.s78 + 0)
.s75:
106d : a5 55 __ LDA T7 + 0 
106f : c5 51 __ CMP T5 + 0 
.s76:
1071 : b0 08 __ BCS $107b ; (bm_polygon_nc_fill.s58 + 0)
1073 : 90 0d __ BCC $1082 ; (bm_polygon_nc_fill.s74 + 0)
.s78:
1075 : 45 52 __ EOR T5 + 1 
1077 : 10 f8 __ BPL $1071 ; (bm_polygon_nc_fill.s76 + 0)
.s77:
1079 : b0 07 __ BCS $1082 ; (bm_polygon_nc_fill.s74 + 0)
.s58:
107b : a5 56 __ LDA T7 + 1 
107d : a6 55 __ LDX T7 + 0 
107f : 4c cb 10 JMP $10cb ; (bm_polygon_nc_fill.s59 + 0)
.s74:
1082 : 86 03 __ STX WORK + 0 
1084 : 38 __ __ SEC
1085 : a5 51 __ LDA T5 + 0 
1087 : e5 55 __ SBC T7 + 0 
1089 : 85 1b __ STA ACCU + 0 ; (clip + 0)
108b : a5 52 __ LDA T5 + 1 
108d : e5 56 __ SBC T7 + 1 
108f : 85 1c __ STA ACCU + 1 ; (clip + 1)
1091 : 29 80 __ AND #$80
1093 : 10 02 __ BPL $1097 ; (bm_polygon_nc_fill.s74 + 21)
1095 : a9 ff __ LDA #$ff
1097 : 85 1d __ STA ACCU + 2 ; (px + 0)
1099 : 85 1e __ STA ACCU + 3 ; (px + 1)
109b : a5 4a __ LDA T1 + 1 
109d : 85 04 __ STA WORK + 1 
109f : a5 4b __ LDA T1 + 2 
10a1 : 85 05 __ STA WORK + 2 
10a3 : a5 4c __ LDA T1 + 3 
10a5 : 85 06 __ STA WORK + 3 
10a7 : 20 ba 22 JSR $22ba ; (mul32 + 0)
10aa : 18 __ __ CLC
10ab : a5 08 __ LDA WORK + 5 
10ad : 69 80 __ ADC #$80
10af : a0 03 __ LDY #$03
10b1 : 91 4f __ STA (T3 + 0),y 
10b3 : a5 09 __ LDA WORK + 6 
10b5 : 65 47 __ ADC T0 + 2 
10b7 : c8 __ __ INY
10b8 : 91 4f __ STA (T3 + 0),y 
10ba : a5 0a __ LDA WORK + 7 
10bc : 65 48 __ ADC T0 + 3 
10be : c8 __ __ INY
10bf : 91 4f __ STA (T3 + 0),y 
10c1 : a5 07 __ LDA WORK + 4 
10c3 : a0 02 __ LDY #$02
10c5 : 91 4f __ STA (T3 + 0),y 
10c7 : a5 52 __ LDA T5 + 1 
10c9 : a6 51 __ LDX T5 + 0 
.s59:
10cb : 86 45 __ STX T0 + 0 
10cd : 85 46 __ STA T0 + 1 
10cf : a5 54 __ LDA T6 + 1 
10d1 : c5 5a __ CMP T9 + 1 
10d3 : d0 08 __ BNE $10dd ; (bm_polygon_nc_fill.s73 + 0)
.s70:
10d5 : a5 53 __ LDA T6 + 0 
10d7 : c5 59 __ CMP T9 + 0 
.s71:
10d9 : 90 08 __ BCC $10e3 ; (bm_polygon_nc_fill.s69 + 0)
10db : b0 0a __ BCS $10e7 ; (bm_polygon_nc_fill.s60 + 0)
.s73:
10dd : 45 5a __ EOR T9 + 1 
10df : 10 f8 __ BPL $10d9 ; (bm_polygon_nc_fill.s71 + 0)
.s72:
10e1 : 90 04 __ BCC $10e7 ; (bm_polygon_nc_fill.s60 + 0)
.s69:
10e3 : a5 53 __ LDA T6 + 0 
10e5 : 85 59 __ STA T9 + 0 
.s60:
10e7 : 8a __ __ TXA
10e8 : a0 00 __ LDY #$00
10ea : 91 4f __ STA (T3 + 0),y 
10ec : a5 59 __ LDA T9 + 0 
10ee : c8 __ __ INY
10ef : 91 4f __ STA (T3 + 0),y 
10f1 : a5 5c __ LDA T10 + 1 
10f3 : 85 4a __ STA T1 + 1 
10f5 : a9 00 __ LDA #$00
10f7 : 85 4d __ STA T2 + 0 
10f9 : 85 4e __ STA T2 + 1 
10fb : a5 5b __ LDA T10 + 0 
10fd : 85 49 __ STA T1 + 0 
10ff : 05 5c __ ORA T10 + 1 
1101 : f0 2e __ BEQ $1131 ; (bm_polygon_nc_fill.s61 + 0)
.s96:
1103 : a6 02 __ LDX $02 
1105 : a5 46 __ LDA T0 + 1 
1107 : 30 26 __ BMI $112f ; (bm_polygon_nc_fill.s97 + 0)
.l68:
1109 : d0 08 __ BNE $1113 ; (bm_polygon_nc_fill.s66 + 0)
.s67:
110b : a5 45 __ LDA T0 + 0 
110d : a0 00 __ LDY #$00
110f : d1 49 __ CMP (T1 + 0),y 
1111 : 90 1c __ BCC $112f ; (bm_polygon_nc_fill.s97 + 0)
.s66:
1113 : a5 49 __ LDA T1 + 0 
1115 : 85 4d __ STA T2 + 0 
1117 : a5 4a __ LDA T1 + 1 
1119 : 85 4e __ STA T2 + 1 
111b : a0 0a __ LDY #$0a
111d : b1 49 __ LDA (T1 + 0),y 
111f : aa __ __ TAX
1120 : c8 __ __ INY
1121 : b1 49 __ LDA (T1 + 0),y 
1123 : 86 49 __ STX T1 + 0 
1125 : 85 4a __ STA T1 + 1 
1127 : 05 49 __ ORA T1 + 0 
1129 : f0 04 __ BEQ $112f ; (bm_polygon_nc_fill.s97 + 0)
.s65:
112b : a5 46 __ LDA T0 + 1 
112d : 10 da __ BPL $1109 ; (bm_polygon_nc_fill.l68 + 0)
.s97:
112f : 86 02 __ STX $02 
.s61:
1131 : a5 49 __ LDA T1 + 0 
1133 : a0 0a __ LDY #$0a
1135 : 91 4f __ STA (T3 + 0),y 
1137 : a5 4a __ LDA T1 + 1 
1139 : c8 __ __ INY
113a : 91 4f __ STA (T3 + 0),y 
113c : a5 4d __ LDA T2 + 0 
113e : 05 4e __ ORA T2 + 1 
1140 : f0 0c __ BEQ $114e ; (bm_polygon_nc_fill.s62 + 0)
.s64:
1142 : a5 4f __ LDA T3 + 0 
1144 : 88 __ __ DEY
1145 : 91 4d __ STA (T2 + 0),y 
1147 : a5 50 __ LDA T3 + 1 
1149 : c8 __ __ INY
114a : 91 4d __ STA (T2 + 0),y 
114c : d0 08 __ BNE $1156 ; (bm_polygon_nc_fill.s63 + 0)
.s62:
114e : a5 4f __ LDA T3 + 0 
1150 : 85 5b __ STA T10 + 0 
1152 : a5 50 __ LDA T3 + 1 
1154 : 85 5c __ STA T10 + 1 
.s63:
1156 : 18 __ __ CLC
1157 : a5 4f __ LDA T3 + 0 
1159 : 69 0c __ ADC #$0c
115b : 85 4f __ STA T3 + 0 
115d : b0 03 __ BCS $1162 ; (bm_polygon_nc_fill.s100 + 0)
115f : 4c 2d 0d JMP $0d2d ; (bm_polygon_nc_fill.s53 + 0)
.s100:
1162 : e6 50 __ INC T3 + 1 
1164 : 4c 2d 0d JMP $0d2d ; (bm_polygon_nc_fill.s53 + 0)
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1167 : a5 14 __ LDA P7 ; (x0 + 1)
1169 : 30 0a __ BMI $1175 ; (bm_scan_fill.s24 + 0)
.s27:
116b : c5 0e __ CMP P1 ; (left + 1)
116d : d0 04 __ BNE $1173 ; (bm_scan_fill.s26 + 0)
.s25:
116f : a5 13 __ LDA P6 ; (x0 + 0)
1171 : c5 0d __ CMP P0 ; (left + 0)
.s26:
1173 : b0 08 __ BCS $117d ; (bm_scan_fill.s5 + 0)
.s24:
1175 : a5 0d __ LDA P0 ; (left + 0)
1177 : 85 13 __ STA P6 ; (x0 + 0)
1179 : a5 0e __ LDA P1 ; (left + 1)
117b : 85 14 __ STA P7 ; (x0 + 1)
.s5:
117d : 24 16 __ BIT P9 ; (x1 + 1)
117f : 30 64 __ BMI $11e5 ; (bm_scan_fill.s3 + 0)
.s23:
1181 : a5 10 __ LDA P3 ; (right + 1)
1183 : c5 16 __ CMP P9 ; (x1 + 1)
1185 : f0 03 __ BEQ $118a ; (bm_scan_fill.s21 + 0)
1187 : 4c 01 13 JMP $1301 ; (bm_scan_fill.s22 + 0)
.s21:
118a : a5 0f __ LDA P2 ; (right + 0)
118c : c5 15 __ CMP P8 ; (x1 + 0)
118e : b0 03 __ BCS $1193 ; (bm_scan_fill.s17 + 0)
1190 : 4c eb 12 JMP $12eb ; (bm_scan_fill.s18 + 0)
.s17:
1193 : a5 14 __ LDA P7 ; (x0 + 1)
1195 : c5 16 __ CMP P9 ; (x1 + 1)
1197 : d0 04 __ BNE $119d ; (bm_scan_fill.s20 + 0)
.s16:
1199 : a5 13 __ LDA P6 ; (x0 + 0)
119b : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
119d : b0 46 __ BCS $11e5 ; (bm_scan_fill.s3 + 0)
.s6:
119f : a5 13 __ LDA P6 ; (x0 + 0)
11a1 : 29 f8 __ AND #$f8
11a3 : 85 1b __ STA ACCU + 0 
11a5 : 65 11 __ ADC P4 ; (lp + 0)
11a7 : 85 43 __ STA T1 + 0 
11a9 : a5 12 __ LDA P5 ; (lp + 1)
11ab : 65 14 __ ADC P7 ; (x0 + 1)
11ad : 85 44 __ STA T1 + 1 
11af : a5 15 __ LDA P8 ; (x1 + 0)
11b1 : 29 07 __ AND #$07
11b3 : aa __ __ TAX
11b4 : a5 13 __ LDA P6 ; (x0 + 0)
11b6 : 29 07 __ AND #$07
11b8 : bc 34 25 LDY $2534,x ; (rmask[0] + 0)
11bb : aa __ __ TAX
11bc : a5 15 __ LDA P8 ; (x1 + 0)
11be : 29 f8 __ AND #$f8
11c0 : 38 __ __ SEC
11c1 : e5 1b __ SBC ACCU + 0 
11c3 : 85 1b __ STA ACCU + 0 
11c5 : a5 16 __ LDA P9 ; (x1 + 1)
11c7 : e5 14 __ SBC P7 ; (x0 + 1)
11c9 : 85 1c __ STA ACCU + 1 
11cb : 05 1b __ ORA ACCU + 0 
11cd : d0 17 __ BNE $11e6 ; (bm_scan_fill.s7 + 0)
.s15:
11cf : 98 __ __ TYA
11d0 : 3d 2c 25 AND $252c,x ; (lmask[0] + 0)
11d3 : 85 1e __ STA ACCU + 3 
11d5 : a0 00 __ LDY #$00
.s11:
11d7 : 49 ff __ EOR #$ff
11d9 : 31 43 __ AND (T1 + 0),y 
11db : 85 1b __ STA ACCU + 0 
11dd : a5 17 __ LDA P10 ; (pat + 0)
11df : 25 1e __ AND ACCU + 3 
11e1 : 05 1b __ ORA ACCU + 0 
11e3 : 91 43 __ STA (T1 + 0),y 
.s3:
11e5 : 60 __ __ RTS
.s7:
11e6 : 84 1e __ STY ACCU + 3 
11e8 : bd 2c 25 LDA $252c,x ; (lmask[0] + 0)
11eb : 49 ff __ EOR #$ff
11ed : a0 00 __ LDY #$00
11ef : 31 43 __ AND (T1 + 0),y 
11f1 : 85 1d __ STA ACCU + 2 
11f3 : a5 17 __ LDA P10 ; (pat + 0)
11f5 : 3d 2c 25 AND $252c,x ; (lmask[0] + 0)
11f8 : 05 1d __ ORA ACCU + 2 
11fa : 91 43 __ STA (T1 + 0),y 
11fc : a5 1c __ LDA ACCU + 1 
11fe : d0 03 __ BNE $1203 ; (bm_scan_fill.s14 + 0)
1200 : 4c 8e 12 JMP $128e ; (bm_scan_fill.s8 + 0)
.s14:
1203 : a5 17 __ LDA P10 ; (pat + 0)
1205 : a0 08 __ LDY #$08
1207 : 91 43 __ STA (T1 + 0),y 
1209 : a0 10 __ LDY #$10
120b : 91 43 __ STA (T1 + 0),y 
120d : a0 18 __ LDY #$18
120f : 91 43 __ STA (T1 + 0),y 
1211 : a0 20 __ LDY #$20
1213 : 91 43 __ STA (T1 + 0),y 
1215 : a0 28 __ LDY #$28
1217 : 91 43 __ STA (T1 + 0),y 
1219 : a0 30 __ LDY #$30
121b : 91 43 __ STA (T1 + 0),y 
121d : a0 38 __ LDY #$38
121f : 91 43 __ STA (T1 + 0),y 
1221 : a0 40 __ LDY #$40
1223 : 91 43 __ STA (T1 + 0),y 
1225 : a0 48 __ LDY #$48
1227 : 91 43 __ STA (T1 + 0),y 
1229 : a0 50 __ LDY #$50
122b : 91 43 __ STA (T1 + 0),y 
122d : a0 58 __ LDY #$58
122f : 91 43 __ STA (T1 + 0),y 
1231 : a0 60 __ LDY #$60
1233 : 91 43 __ STA (T1 + 0),y 
1235 : a0 68 __ LDY #$68
1237 : 91 43 __ STA (T1 + 0),y 
1239 : a0 70 __ LDY #$70
123b : 91 43 __ STA (T1 + 0),y 
123d : a0 78 __ LDY #$78
123f : 91 43 __ STA (T1 + 0),y 
1241 : a0 80 __ LDY #$80
1243 : 91 43 __ STA (T1 + 0),y 
1245 : a0 88 __ LDY #$88
1247 : 91 43 __ STA (T1 + 0),y 
1249 : a0 90 __ LDY #$90
124b : 91 43 __ STA (T1 + 0),y 
124d : a0 98 __ LDY #$98
124f : 91 43 __ STA (T1 + 0),y 
1251 : a0 a0 __ LDY #$a0
1253 : 91 43 __ STA (T1 + 0),y 
1255 : a0 a8 __ LDY #$a8
1257 : 91 43 __ STA (T1 + 0),y 
1259 : a0 b0 __ LDY #$b0
125b : 91 43 __ STA (T1 + 0),y 
125d : a0 b8 __ LDY #$b8
125f : 91 43 __ STA (T1 + 0),y 
1261 : a0 c0 __ LDY #$c0
1263 : 91 43 __ STA (T1 + 0),y 
1265 : a0 c8 __ LDY #$c8
1267 : 91 43 __ STA (T1 + 0),y 
1269 : a0 d0 __ LDY #$d0
126b : 91 43 __ STA (T1 + 0),y 
126d : a0 d8 __ LDY #$d8
126f : 91 43 __ STA (T1 + 0),y 
1271 : a0 e0 __ LDY #$e0
1273 : 91 43 __ STA (T1 + 0),y 
1275 : a0 e8 __ LDY #$e8
1277 : 91 43 __ STA (T1 + 0),y 
1279 : a0 f0 __ LDY #$f0
127b : 91 43 __ STA (T1 + 0),y 
127d : a0 f8 __ LDY #$f8
127f : 91 43 __ STA (T1 + 0),y 
1281 : 38 __ __ SEC
1282 : a5 1b __ LDA ACCU + 0 
1284 : e9 f8 __ SBC #$f8
1286 : 85 1b __ STA ACCU + 0 
1288 : e6 44 __ INC T1 + 1 
128a : a9 00 __ LDA #$00
128c : f0 48 __ BEQ $12d6 ; (bm_scan_fill.s28 + 0)
.s8:
128e : 24 1b __ BIT ACCU + 0 
1290 : 30 04 __ BMI $1296 ; (bm_scan_fill.s13 + 0)
.s9:
1292 : a9 08 __ LDA #$08
1294 : d0 40 __ BNE $12d6 ; (bm_scan_fill.s28 + 0)
.s13:
1296 : a5 17 __ LDA P10 ; (pat + 0)
1298 : a0 08 __ LDY #$08
129a : 91 43 __ STA (T1 + 0),y 
129c : a0 10 __ LDY #$10
129e : 91 43 __ STA (T1 + 0),y 
12a0 : a0 18 __ LDY #$18
12a2 : 91 43 __ STA (T1 + 0),y 
12a4 : a0 20 __ LDY #$20
12a6 : 91 43 __ STA (T1 + 0),y 
12a8 : a0 28 __ LDY #$28
12aa : 91 43 __ STA (T1 + 0),y 
12ac : a0 30 __ LDY #$30
12ae : 91 43 __ STA (T1 + 0),y 
12b0 : a0 38 __ LDY #$38
12b2 : 91 43 __ STA (T1 + 0),y 
12b4 : a0 40 __ LDY #$40
12b6 : 91 43 __ STA (T1 + 0),y 
12b8 : a0 48 __ LDY #$48
12ba : 91 43 __ STA (T1 + 0),y 
12bc : a0 50 __ LDY #$50
12be : 91 43 __ STA (T1 + 0),y 
12c0 : a0 58 __ LDY #$58
12c2 : 91 43 __ STA (T1 + 0),y 
12c4 : a0 60 __ LDY #$60
12c6 : 91 43 __ STA (T1 + 0),y 
12c8 : a0 68 __ LDY #$68
12ca : 91 43 __ STA (T1 + 0),y 
12cc : a0 70 __ LDY #$70
12ce : 91 43 __ STA (T1 + 0),y 
12d0 : a0 78 __ LDY #$78
12d2 : 91 43 __ STA (T1 + 0),y 
12d4 : a9 80 __ LDA #$80
.s28:
12d6 : a6 17 __ LDX P10 ; (pat + 0)
12d8 : 4c e1 12 JMP $12e1 ; (bm_scan_fill.l10 + 0)
.s12:
12db : 8a __ __ TXA
12dc : 91 43 __ STA (T1 + 0),y 
12de : 98 __ __ TYA
12df : 69 08 __ ADC #$08
.l10:
12e1 : a8 __ __ TAY
12e2 : c4 1b __ CPY ACCU + 0 
12e4 : 90 f5 __ BCC $12db ; (bm_scan_fill.s12 + 0)
.s29:
12e6 : a5 1e __ LDA ACCU + 3 
12e8 : 4c d7 11 JMP $11d7 ; (bm_scan_fill.s11 + 0)
.s18:
12eb : 85 15 __ STA P8 ; (x1 + 0)
12ed : a5 10 __ LDA P3 ; (right + 1)
12ef : 85 16 __ STA P9 ; (x1 + 1)
12f1 : a5 14 __ LDA P7 ; (x0 + 1)
12f3 : c5 10 __ CMP P3 ; (right + 1)
12f5 : f0 03 __ BEQ $12fa ; (bm_scan_fill.s19 + 0)
12f7 : 4c 9d 11 JMP $119d ; (bm_scan_fill.s20 + 0)
.s19:
12fa : a5 13 __ LDA P6 ; (x0 + 0)
12fc : c5 0f __ CMP P2 ; (right + 0)
12fe : 4c 9d 11 JMP $119d ; (bm_scan_fill.s20 + 0)
.s22:
1301 : 90 03 __ BCC $1306 ; (bm_scan_fill.s30 + 0)
1303 : 4c 93 11 JMP $1193 ; (bm_scan_fill.s17 + 0)
.s30:
1306 : a5 0f __ LDA P2 ; (right + 0)
1308 : 90 e1 __ BCC $12eb ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
130a : a5 53 __ LDA T6 + 0 
130c : 8d c9 9f STA $9fc9 ; (bmu_bitblit@stack + 0)
130f : a5 54 __ LDA T6 + 1 
1311 : 8d ca 9f STA $9fca ; (bmu_bitblit@stack + 1)
1314 : a5 55 __ LDA T8 + 0 
1316 : 8d cb 9f STA $9fcb ; (bmu_bitblit@stack + 2)
.s4:
1319 : ad cf 9f LDA $9fcf ; (sstack + 0)
131c : 85 4e __ STA T2 + 0 
131e : 18 __ __ CLC
131f : 6d d9 9f ADC $9fd9 ; (sstack + 10)
1322 : 85 45 __ STA T1 + 0 
1324 : 29 07 __ AND #$07
1326 : aa __ __ TAX
1327 : bd 34 25 LDA $2534,x ; (rmask[0] + 0)
132a : 85 13 __ STA P6 
132c : ad da 9f LDA $9fda ; (sstack + 11)
132f : 6d d0 9f ADC $9fd0 ; (sstack + 1)
1332 : 4a __ __ LSR
1333 : 66 45 __ ROR T1 + 0 
1335 : 4a __ __ LSR
1336 : 66 45 __ ROR T1 + 0 
1338 : 4a __ __ LSR
1339 : 66 45 __ ROR T1 + 0 
133b : ad d0 9f LDA $9fd0 ; (sstack + 1)
133e : 4a __ __ LSR
133f : 66 4e __ ROR T2 + 0 
1341 : 4a __ __ LSR
1342 : 66 4e __ ROR T2 + 0 
1344 : 4a __ __ LSR
1345 : 66 4e __ ROR T2 + 0 
1347 : 38 __ __ SEC
1348 : a5 45 __ LDA T1 + 0 
134a : e5 4e __ SBC T2 + 0 
134c : 85 11 __ STA P4 
134e : ad cf 9f LDA $9fcf ; (sstack + 0)
1351 : 29 07 __ AND #$07
1353 : 85 4e __ STA T2 + 0 
1355 : aa __ __ TAX
1356 : bd 2c 25 LDA $252c,x ; (lmask[0] + 0)
1359 : 85 4c __ STA T10 + 0 
135b : 85 12 __ STA P5 
135d : ad d3 9f LDA $9fd3 ; (sstack + 4)
1360 : 85 49 __ STA T4 + 0 
1362 : ad d4 9f LDA $9fd4 ; (sstack + 5)
1365 : 85 4a __ STA T4 + 1 
1367 : a5 16 __ LDA P9 ; (dbm + 0)
1369 : c5 49 __ CMP T4 + 0 
136b : d0 78 __ BNE $13e5 ; (bmu_bitblit.s5 + 0)
.s52:
136d : a5 17 __ LDA P10 ; (dbm + 1)
136f : c5 4a __ CMP T4 + 1 
1371 : d0 72 __ BNE $13e5 ; (bmu_bitblit.s5 + 0)
.s38:
1373 : ad d8 9f LDA $9fd8 ; (sstack + 9)
1376 : cd d2 9f CMP $9fd2 ; (sstack + 3)
1379 : d0 0a __ BNE $1385 ; (bmu_bitblit.s51 + 0)
.s48:
137b : ad d7 9f LDA $9fd7 ; (sstack + 8)
137e : cd d1 9f CMP $9fd1 ; (sstack + 2)
.s49:
1381 : b0 09 __ BCS $138c ; (bmu_bitblit.s39 + 0)
1383 : 90 30 __ BCC $13b5 ; (bmu_bitblit.s41 + 0)
.s51:
1385 : 4d d2 9f EOR $9fd2 ; (sstack + 3)
1388 : 10 f7 __ BPL $1381 ; (bmu_bitblit.s49 + 0)
.s50:
138a : b0 29 __ BCS $13b5 ; (bmu_bitblit.s41 + 0)
.s39:
138c : ad d2 9f LDA $9fd2 ; (sstack + 3)
138f : cd d8 9f CMP $9fd8 ; (sstack + 9)
1392 : d0 51 __ BNE $13e5 ; (bmu_bitblit.s5 + 0)
.s47:
1394 : ad d1 9f LDA $9fd1 ; (sstack + 2)
1397 : cd d7 9f CMP $9fd7 ; (sstack + 8)
139a : d0 49 __ BNE $13e5 ; (bmu_bitblit.s5 + 0)
.s40:
139c : ad d6 9f LDA $9fd6 ; (sstack + 7)
139f : cd d0 9f CMP $9fd0 ; (sstack + 1)
13a2 : d0 0a __ BNE $13ae ; (bmu_bitblit.s46 + 0)
.s43:
13a4 : ad d5 9f LDA $9fd5 ; (sstack + 6)
13a7 : cd cf 9f CMP $9fcf ; (sstack + 0)
.s44:
13aa : 90 09 __ BCC $13b5 ; (bmu_bitblit.s41 + 0)
13ac : b0 37 __ BCS $13e5 ; (bmu_bitblit.s5 + 0)
.s46:
13ae : 4d d0 9f EOR $9fd0 ; (sstack + 1)
13b1 : 10 f7 __ BPL $13aa ; (bmu_bitblit.s44 + 0)
.s45:
13b3 : 90 30 __ BCC $13e5 ; (bmu_bitblit.s5 + 0)
.s41:
13b5 : a5 18 __ LDA P11 ; (op + 0)
13b7 : 29 08 __ AND #$08
13b9 : f0 2a __ BEQ $13e5 ; (bmu_bitblit.s5 + 0)
.s42:
13bb : ad db 9f LDA $9fdb ; (sstack + 12)
13be : 18 __ __ CLC
13bf : 6d d7 9f ADC $9fd7 ; (sstack + 8)
13c2 : 8d d7 9f STA $9fd7 ; (sstack + 8)
13c5 : ad dc 9f LDA $9fdc ; (sstack + 13)
13c8 : 6d d8 9f ADC $9fd8 ; (sstack + 9)
13cb : 8d d8 9f STA $9fd8 ; (sstack + 9)
13ce : ad db 9f LDA $9fdb ; (sstack + 12)
13d1 : 18 __ __ CLC
13d2 : 6d d1 9f ADC $9fd1 ; (sstack + 2)
13d5 : 8d d1 9f STA $9fd1 ; (sstack + 2)
13d8 : ad dc 9f LDA $9fdc ; (sstack + 13)
13db : 6d d2 9f ADC $9fd2 ; (sstack + 3)
13de : 8d d2 9f STA $9fd2 ; (sstack + 3)
13e1 : a9 01 __ LDA #$01
13e3 : d0 02 __ BNE $13e7 ; (bmu_bitblit.s6 + 0)
.s5:
13e5 : a9 00 __ LDA #$00
.s6:
13e7 : 85 15 __ STA P8 
13e9 : ad d2 9f LDA $9fd2 ; (sstack + 3)
13ec : 85 1c __ STA ACCU + 1 ; (dy + 1)
13ee : ad d1 9f LDA $9fd1 ; (sstack + 2)
13f1 : 29 f8 __ AND #$f8
13f3 : 85 1b __ STA ACCU + 0 ; (dy + 0)
13f5 : a0 04 __ LDY #$04
13f7 : b1 16 __ LDA (P9),y ; (dbm + 0)
13f9 : 85 52 __ STA T7 + 0 
13fb : 20 4c 22 JSR $224c ; (mul16by8 + 0)
13fe : a0 00 __ LDY #$00
1400 : b1 16 __ LDA (P9),y ; (dbm + 0)
1402 : 18 __ __ CLC
1403 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1405 : 85 02 __ STA $02 
1407 : c8 __ __ INY
1408 : b1 16 __ LDA (P9),y ; (dbm + 0)
140a : 65 1c __ ADC ACCU + 1 ; (dy + 1)
140c : aa __ __ TAX
140d : ad cf 9f LDA $9fcf ; (sstack + 0)
1410 : 29 f8 __ AND #$f8
1412 : 18 __ __ CLC
1413 : 65 02 __ ADC $02 
1415 : 85 47 __ STA T3 + 0 
1417 : 8a __ __ TXA
1418 : 6d d0 9f ADC $9fd0 ; (sstack + 1)
141b : aa __ __ TAX
141c : ad d1 9f LDA $9fd1 ; (sstack + 2)
141f : 29 07 __ AND #$07
1421 : 18 __ __ CLC
1422 : 65 47 __ ADC T3 + 0 
1424 : 85 53 __ STA T6 + 0 
1426 : 90 01 __ BCC $1429 ; (bmu_bitblit.s54 + 0)
.s53:
1428 : e8 __ __ INX
.s54:
1429 : 86 54 __ STX T6 + 1 
142b : ad d8 9f LDA $9fd8 ; (sstack + 9)
142e : 85 1c __ STA ACCU + 1 ; (dy + 1)
1430 : ad d7 9f LDA $9fd7 ; (sstack + 8)
1433 : 29 f8 __ AND #$f8
1435 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1437 : a0 04 __ LDY #$04
1439 : b1 49 __ LDA (T4 + 0),y 
143b : 85 55 __ STA T8 + 0 
143d : 20 4c 22 JSR $224c ; (mul16by8 + 0)
1440 : a0 00 __ LDY #$00
1442 : b1 49 __ LDA (T4 + 0),y 
1444 : 18 __ __ CLC
1445 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1447 : 85 02 __ STA $02 
1449 : c8 __ __ INY
144a : b1 49 __ LDA (T4 + 0),y 
144c : 65 1c __ ADC ACCU + 1 ; (dy + 1)
144e : aa __ __ TAX
144f : ad d5 9f LDA $9fd5 ; (sstack + 6)
1452 : 29 f8 __ AND #$f8
1454 : 18 __ __ CLC
1455 : 65 02 __ ADC $02 
1457 : 85 49 __ STA T4 + 0 
1459 : 8a __ __ TXA
145a : 6d d6 9f ADC $9fd6 ; (sstack + 7)
145d : aa __ __ TAX
145e : ad d7 9f LDA $9fd7 ; (sstack + 8)
1461 : 29 07 __ AND #$07
1463 : 18 __ __ CLC
1464 : 65 49 __ ADC T4 + 0 
1466 : 85 49 __ STA T4 + 0 
1468 : 90 01 __ BCC $146b ; (bmu_bitblit.s56 + 0)
.s55:
146a : e8 __ __ INX
.s56:
146b : ad d5 9f LDA $9fd5 ; (sstack + 6)
146e : 29 07 __ AND #$07
1470 : 49 ff __ EOR #$ff
1472 : 38 __ __ SEC
1473 : 65 4e __ ADC T2 + 0 
1475 : 85 43 __ STA T0 + 0 
1477 : 29 07 __ AND #$07
1479 : 85 10 __ STA P3 
147b : a5 15 __ LDA P8 
147d : f0 03 __ BEQ $1482 ; (bmu_bitblit.s7 + 0)
147f : 4c 71 16 JMP $1671 ; (bmu_bitblit.s36 + 0)
.s7:
1482 : 86 51 __ STX T5 + 1 
1484 : a4 49 __ LDY T4 + 0 
1486 : 84 50 __ STY T5 + 0 
1488 : a5 43 __ LDA T0 + 0 
148a : f0 0d __ BEQ $1499 ; (bmu_bitblit.s8 + 0)
.s34:
148c : 30 0b __ BMI $1499 ; (bmu_bitblit.s8 + 0)
.s35:
148e : 98 __ __ TYA
148f : 18 __ __ CLC
1490 : 69 f8 __ ADC #$f8
1492 : 85 50 __ STA T5 + 0 
1494 : 8a __ __ TXA
1495 : 69 ff __ ADC #$ff
1497 : 85 51 __ STA T5 + 1 
.s8:
1499 : a5 18 __ LDA P11 ; (op + 0)
149b : 85 14 __ STA P7 
149d : 20 bc 16 JSR $16bc ; (builddop.s4 + 0)
14a0 : 18 __ __ CLC
14a1 : a5 52 __ LDA T7 + 0 
14a3 : 69 ff __ ADC #$ff
14a5 : 2a __ __ ROL
14a6 : 2a __ __ ROL
14a7 : 2a __ __ ROL
14a8 : aa __ __ TAX
14a9 : 29 f8 __ AND #$f8
14ab : 85 43 __ STA T0 + 0 
14ad : 8a __ __ TXA
14ae : 29 07 __ AND #$07
14b0 : 2a __ __ ROL
14b1 : 69 f8 __ ADC #$f8
14b3 : 85 44 __ STA T0 + 1 
14b5 : ad dd 9f LDA $9fdd ; (sstack + 14)
14b8 : 85 45 __ STA T1 + 0 
14ba : 85 47 __ STA T3 + 0 
14bc : ad de 9f LDA $9fde ; (sstack + 15)
14bf : 85 46 __ STA T1 + 1 
14c1 : a5 18 __ LDA P11 ; (op + 0)
14c3 : 29 08 __ AND #$08
14c5 : f0 03 __ BEQ $14ca ; (bmu_bitblit.s9 + 0)
14c7 : 4c 64 15 JMP $1564 ; (bmu_bitblit.s19 + 0)
.s9:
14ca : ad db 9f LDA $9fdb ; (sstack + 12)
14cd : 85 47 __ STA T3 + 0 
14cf : a5 18 __ LDA P11 ; (op + 0)
14d1 : 29 20 __ AND #$20
14d3 : d0 4c __ BNE $1521 ; (bmu_bitblit.s15 + 0)
.s10:
14d5 : a5 47 __ LDA T3 + 0 
14d7 : f0 38 __ BEQ $1511 ; (bmu_bitblit.s3 + 0)
.s11:
14d9 : a9 00 __ LDA #$00
14db : 85 4e __ STA T2 + 0 
.l12:
14dd : a5 53 __ LDA T6 + 0 
14df : 85 03 __ STA WORK + 0 
14e1 : a5 54 __ LDA T6 + 1 
14e3 : 85 04 __ STA WORK + 1 
14e5 : a5 53 __ LDA T6 + 0 
14e7 : 85 05 __ STA WORK + 2 
14e9 : a5 54 __ LDA T6 + 1 
14eb : 85 06 __ STA WORK + 3 
14ed : a5 4e __ LDA T2 + 0 
14ef : 85 07 __ STA WORK + 4 
14f1 : 20 00 29 JSR $2900 ; (BLIT_CODE[0] + 0)
14f4 : e6 53 __ INC T6 + 0 
14f6 : d0 02 __ BNE $14fa ; (bmu_bitblit.s69 + 0)
.s68:
14f8 : e6 54 __ INC T6 + 1 
.s69:
14fa : a5 53 __ LDA T6 + 0 
14fc : 29 07 __ AND #$07
14fe : d0 0d __ BNE $150d ; (bmu_bitblit.s13 + 0)
.s14:
1500 : 18 __ __ CLC
1501 : a5 53 __ LDA T6 + 0 
1503 : 65 43 __ ADC T0 + 0 
1505 : 85 53 __ STA T6 + 0 
1507 : a5 54 __ LDA T6 + 1 
1509 : 65 44 __ ADC T0 + 1 
150b : 85 54 __ STA T6 + 1 
.s13:
150d : c6 47 __ DEC T3 + 0 
150f : d0 cc __ BNE $14dd ; (bmu_bitblit.l12 + 0)
.s3:
1511 : ad c9 9f LDA $9fc9 ; (bmu_bitblit@stack + 0)
1514 : 85 53 __ STA T6 + 0 
1516 : ad ca 9f LDA $9fca ; (bmu_bitblit@stack + 1)
1519 : 85 54 __ STA T6 + 1 
151b : ad cb 9f LDA $9fcb ; (bmu_bitblit@stack + 2)
151e : 85 55 __ STA T8 + 0 
1520 : 60 __ __ RTS
.s15:
1521 : a5 47 __ LDA T3 + 0 
1523 : f0 ec __ BEQ $1511 ; (bmu_bitblit.s3 + 0)
.l16:
1525 : a5 53 __ LDA T6 + 0 
1527 : 29 07 __ AND #$07
1529 : a8 __ __ TAY
152a : b1 45 __ LDA (T1 + 0),y 
152c : 85 4e __ STA T2 + 0 
152e : a5 53 __ LDA T6 + 0 
1530 : 85 03 __ STA WORK + 0 
1532 : a5 54 __ LDA T6 + 1 
1534 : 85 04 __ STA WORK + 1 
1536 : a5 53 __ LDA T6 + 0 
1538 : 85 05 __ STA WORK + 2 
153a : a5 54 __ LDA T6 + 1 
153c : 85 06 __ STA WORK + 3 
153e : a5 4e __ LDA T2 + 0 
1540 : 85 07 __ STA WORK + 4 
1542 : 20 00 29 JSR $2900 ; (BLIT_CODE[0] + 0)
1545 : e6 53 __ INC T6 + 0 
1547 : d0 02 __ BNE $154b ; (bmu_bitblit.s67 + 0)
.s66:
1549 : e6 54 __ INC T6 + 1 
.s67:
154b : a5 53 __ LDA T6 + 0 
154d : 29 07 __ AND #$07
154f : d0 0d __ BNE $155e ; (bmu_bitblit.s17 + 0)
.s18:
1551 : 18 __ __ CLC
1552 : a5 53 __ LDA T6 + 0 
1554 : 65 43 __ ADC T0 + 0 
1556 : 85 53 __ STA T6 + 0 
1558 : a5 54 __ LDA T6 + 1 
155a : 65 44 __ ADC T0 + 1 
155c : 85 54 __ STA T6 + 1 
.s17:
155e : c6 47 __ DEC T3 + 0 
1560 : d0 c3 __ BNE $1525 ; (bmu_bitblit.l16 + 0)
1562 : f0 ad __ BEQ $1511 ; (bmu_bitblit.s3 + 0)
.s19:
1564 : 18 __ __ CLC
1565 : a5 55 __ LDA T8 + 0 
1567 : 69 ff __ ADC #$ff
1569 : 2a __ __ ROL
156a : 2a __ __ ROL
156b : 2a __ __ ROL
156c : aa __ __ TAX
156d : 29 f8 __ AND #$f8
156f : 85 4e __ STA T2 + 0 
1571 : 8a __ __ TXA
1572 : 29 07 __ AND #$07
1574 : 2a __ __ ROL
1575 : 69 f8 __ ADC #$f8
1577 : 85 4f __ STA T2 + 1 
1579 : a5 46 __ LDA T1 + 1 
157b : 85 48 __ STA T3 + 1 
157d : 05 45 __ ORA T1 + 0 
157f : d0 08 __ BNE $1589 ; (bmu_bitblit.s21 + 0)
.s20:
1581 : a5 50 __ LDA T5 + 0 
1583 : 85 47 __ STA T3 + 0 
1585 : a5 51 __ LDA T5 + 1 
1587 : 85 48 __ STA T3 + 1 
.s21:
1589 : ad db 9f LDA $9fdb ; (sstack + 12)
158c : 85 45 __ STA T1 + 0 
158e : a5 15 __ LDA P8 
1590 : d0 03 __ BNE $1595 ; (bmu_bitblit.s28 + 0)
1592 : 4c 14 16 JMP $1614 ; (bmu_bitblit.s22 + 0)
.s28:
1595 : 38 __ __ SEC
1596 : a9 00 __ LDA #$00
1598 : e5 43 __ SBC T0 + 0 
159a : 85 43 __ STA T0 + 0 
159c : a9 00 __ LDA #$00
159e : e5 44 __ SBC T0 + 1 
15a0 : 85 44 __ STA T0 + 1 
15a2 : 38 __ __ SEC
15a3 : a9 00 __ LDA #$00
15a5 : e5 4e __ SBC T2 + 0 
15a7 : 85 4e __ STA T2 + 0 
15a9 : a9 00 __ LDA #$00
15ab : e5 4f __ SBC T2 + 1 
15ad : 85 4f __ STA T2 + 1 
15af : a5 45 __ LDA T1 + 0 
15b1 : d0 03 __ BNE $15b6 ; (bmu_bitblit.l29 + 0)
15b3 : 4c 11 15 JMP $1511 ; (bmu_bitblit.s3 + 0)
.l29:
15b6 : a5 50 __ LDA T5 + 0 
15b8 : 29 07 __ AND #$07
15ba : d0 0d __ BNE $15c9 ; (bmu_bitblit.s30 + 0)
.s33:
15bc : 18 __ __ CLC
15bd : a5 50 __ LDA T5 + 0 
15bf : 65 4e __ ADC T2 + 0 
15c1 : 85 50 __ STA T5 + 0 
15c3 : a5 51 __ LDA T5 + 1 
15c5 : 65 4f __ ADC T2 + 1 
15c7 : 85 51 __ STA T5 + 1 
.s30:
15c9 : a5 53 __ LDA T6 + 0 
15cb : 29 07 __ AND #$07
15cd : d0 0d __ BNE $15dc ; (bmu_bitblit.s31 + 0)
.s32:
15cf : 18 __ __ CLC
15d0 : a5 53 __ LDA T6 + 0 
15d2 : 65 43 __ ADC T0 + 0 
15d4 : 85 53 __ STA T6 + 0 
15d6 : a5 54 __ LDA T6 + 1 
15d8 : 65 44 __ ADC T0 + 1 
15da : 85 54 __ STA T6 + 1 
.s31:
15dc : 18 __ __ CLC
15dd : a5 53 __ LDA T6 + 0 
15df : 69 ff __ ADC #$ff
15e1 : 85 53 __ STA T6 + 0 
15e3 : 29 07 __ AND #$07
15e5 : a8 __ __ TAY
15e6 : b0 02 __ BCS $15ea ; (bmu_bitblit.s59 + 0)
.s58:
15e8 : c6 54 __ DEC T6 + 1 
.s59:
15ea : b1 47 __ LDA (T3 + 0),y 
15ec : 85 49 __ STA T4 + 0 
15ee : a5 50 __ LDA T5 + 0 
15f0 : d0 02 __ BNE $15f4 ; (bmu_bitblit.s61 + 0)
.s60:
15f2 : c6 51 __ DEC T5 + 1 
.s61:
15f4 : c6 50 __ DEC T5 + 0 
15f6 : a5 50 __ LDA T5 + 0 
15f8 : 85 03 __ STA WORK + 0 
15fa : a5 51 __ LDA T5 + 1 
15fc : 85 04 __ STA WORK + 1 
15fe : a5 53 __ LDA T6 + 0 
1600 : 85 05 __ STA WORK + 2 
1602 : a5 54 __ LDA T6 + 1 
1604 : 85 06 __ STA WORK + 3 
1606 : a5 49 __ LDA T4 + 0 
1608 : 85 07 __ STA WORK + 4 
160a : 20 00 29 JSR $2900 ; (BLIT_CODE[0] + 0)
160d : c6 45 __ DEC T1 + 0 
160f : d0 a5 __ BNE $15b6 ; (bmu_bitblit.l29 + 0)
1611 : 4c 11 15 JMP $1511 ; (bmu_bitblit.s3 + 0)
.s22:
1614 : a5 45 __ LDA T1 + 0 
1616 : f0 f9 __ BEQ $1611 ; (bmu_bitblit.s61 + 29)
.l23:
1618 : a5 53 __ LDA T6 + 0 
161a : 29 07 __ AND #$07
161c : a8 __ __ TAY
161d : b1 47 __ LDA (T3 + 0),y 
161f : 85 49 __ STA T4 + 0 
1621 : a5 50 __ LDA T5 + 0 
1623 : 85 03 __ STA WORK + 0 
1625 : a5 51 __ LDA T5 + 1 
1627 : 85 04 __ STA WORK + 1 
1629 : a5 53 __ LDA T6 + 0 
162b : 85 05 __ STA WORK + 2 
162d : a5 54 __ LDA T6 + 1 
162f : 85 06 __ STA WORK + 3 
1631 : a5 49 __ LDA T4 + 0 
1633 : 85 07 __ STA WORK + 4 
1635 : 20 00 29 JSR $2900 ; (BLIT_CODE[0] + 0)
1638 : e6 50 __ INC T5 + 0 
163a : d0 02 __ BNE $163e ; (bmu_bitblit.s63 + 0)
.s62:
163c : e6 51 __ INC T5 + 1 
.s63:
163e : a5 50 __ LDA T5 + 0 
1640 : 29 07 __ AND #$07
1642 : d0 0d __ BNE $1651 ; (bmu_bitblit.s24 + 0)
.s27:
1644 : 18 __ __ CLC
1645 : a5 50 __ LDA T5 + 0 
1647 : 65 4e __ ADC T2 + 0 
1649 : 85 50 __ STA T5 + 0 
164b : a5 51 __ LDA T5 + 1 
164d : 65 4f __ ADC T2 + 1 
164f : 85 51 __ STA T5 + 1 
.s24:
1651 : e6 53 __ INC T6 + 0 
1653 : d0 02 __ BNE $1657 ; (bmu_bitblit.s65 + 0)
.s64:
1655 : e6 54 __ INC T6 + 1 
.s65:
1657 : a5 53 __ LDA T6 + 0 
1659 : 29 07 __ AND #$07
165b : d0 0d __ BNE $166a ; (bmu_bitblit.s25 + 0)
.s26:
165d : 18 __ __ CLC
165e : a5 53 __ LDA T6 + 0 
1660 : 65 43 __ ADC T0 + 0 
1662 : 85 53 __ STA T6 + 0 
1664 : a5 54 __ LDA T6 + 1 
1666 : 65 44 __ ADC T0 + 1 
1668 : 85 54 __ STA T6 + 1 
.s25:
166a : c6 45 __ DEC T1 + 0 
166c : d0 aa __ BNE $1618 ; (bmu_bitblit.l23 + 0)
166e : 4c 11 15 JMP $1511 ; (bmu_bitblit.s3 + 0)
.s36:
1671 : 18 __ __ CLC
1672 : a5 11 __ LDA P4 
1674 : 69 e1 __ ADC #$e1
1676 : 2a __ __ ROL
1677 : 2a __ __ ROL
1678 : 2a __ __ ROL
1679 : a8 __ __ TAY
167a : 29 f8 __ AND #$f8
167c : 85 45 __ STA T1 + 0 
167e : 98 __ __ TYA
167f : 29 07 __ AND #$07
1681 : 2a __ __ ROL
1682 : 69 f8 __ ADC #$f8
1684 : 85 46 __ STA T1 + 1 
1686 : 18 __ __ CLC
1687 : a5 53 __ LDA T6 + 0 
1689 : 65 45 __ ADC T1 + 0 
168b : 85 53 __ STA T6 + 0 
168d : a5 54 __ LDA T6 + 1 
168f : 65 46 __ ADC T1 + 1 
1691 : 85 54 __ STA T6 + 1 
1693 : a5 13 __ LDA P6 
1695 : 85 12 __ STA P5 
1697 : a5 4c __ LDA T10 + 0 
1699 : 85 13 __ STA P6 
169b : 18 __ __ CLC
169c : a5 49 __ LDA T4 + 0 
169e : 65 45 __ ADC T1 + 0 
16a0 : 85 50 __ STA T5 + 0 
16a2 : 8a __ __ TXA
16a3 : 65 46 __ ADC T1 + 1 
16a5 : 85 51 __ STA T5 + 1 
16a7 : 24 43 __ BIT T0 + 0 
16a9 : 30 03 __ BMI $16ae ; (bmu_bitblit.s37 + 0)
16ab : 4c 99 14 JMP $1499 ; (bmu_bitblit.s8 + 0)
.s37:
16ae : 18 __ __ CLC
16af : a5 50 __ LDA T5 + 0 
16b1 : 69 08 __ ADC #$08
16b3 : 85 50 __ STA T5 + 0 
16b5 : 90 f4 __ BCC $16ab ; (bmu_bitblit.s36 + 58)
.s57:
16b7 : e6 51 __ INC T5 + 1 
16b9 : 4c 99 14 JMP $1499 ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
16bc : a5 15 __ LDA P8 ; (reverse + 0)
16be : f0 16 __ BEQ $16d6 ; (builddop.s5 + 0)
.s48:
16c0 : a9 38 __ LDA #$38
16c2 : 85 48 __ STA T9 + 0 
16c4 : a9 e1 __ LDA #$e1
16c6 : 85 49 __ STA T10 + 0 
16c8 : a9 b0 __ LDA #$b0
16ca : 85 4a __ STA T11 + 0 
16cc : a9 c2 __ LDA #$c2
16ce : 85 4b __ STA T12 + 0 
16d0 : a9 f8 __ LDA #$f8
16d2 : 85 44 __ STA T3 + 0 
16d4 : d0 16 __ BNE $16ec ; (builddop.s6 + 0)
.s5:
16d6 : a9 18 __ LDA #$18
16d8 : 85 48 __ STA T9 + 0 
16da : a9 61 __ LDA #$61
16dc : 85 49 __ STA T10 + 0 
16de : a9 90 __ LDA #$90
16e0 : 85 4a __ STA T11 + 0 
16e2 : a9 e2 __ LDA #$e2
16e4 : 85 4b __ STA T12 + 0 
16e6 : a9 00 __ LDA #$00
16e8 : 85 44 __ STA T3 + 0 
16ea : a9 08 __ LDA #$08
.s6:
16ec : 85 47 __ STA T6 + 0 
16ee : a5 14 __ LDA P7 ; (op + 0)
16f0 : 29 08 __ AND #$08
16f2 : 85 45 __ STA T4 + 0 
16f4 : a5 14 __ LDA P7 ; (op + 0)
16f6 : 29 10 __ AND #$10
16f8 : 85 46 __ STA T5 + 0 
16fa : a5 11 __ LDA P4 ; (w + 0)
16fc : d0 06 __ BNE $1704 ; (builddop.s8 + 0)
.s7:
16fe : a5 13 __ LDA P6 ; (rmask + 0)
1700 : 25 12 __ AND P5 ; (lmask + 0)
1702 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
1704 : a9 a0 __ LDA #$a0
1706 : 8d 00 29 STA $2900 ; (BLIT_CODE[0] + 0)
1709 : a5 44 __ LDA T3 + 0 
170b : 8d 01 29 STA $2901 ; (BLIT_CODE[0] + 1)
170e : a9 02 __ LDA #$02
1710 : 85 43 __ STA T0 + 0 
1712 : a6 12 __ LDX P5 ; (lmask + 0)
1714 : e8 __ __ INX
1715 : d0 03 __ BNE $171a ; (builddop.s9 + 0)
1717 : 4c 4d 19 JMP $194d ; (builddop.s44 + 0)
.s9:
171a : a5 46 __ LDA T5 + 0 
171c : f0 18 __ BEQ $1736 ; (builddop.s10 + 0)
.s43:
171e : a9 b1 __ LDA #$b1
1720 : 8d 02 29 STA $2902 ; (BLIT_CODE[0] + 2)
1723 : a9 05 __ LDA #$05
1725 : 8d 03 29 STA $2903 ; (BLIT_CODE[0] + 3)
1728 : a9 85 __ LDA #$85
172a : 8d 04 29 STA $2904 ; (BLIT_CODE[0] + 4)
172d : a9 0a __ LDA #$0a
172f : 8d 05 29 STA $2905 ; (BLIT_CODE[0] + 5)
1732 : a9 06 __ LDA #$06
1734 : 85 43 __ STA T0 + 0 
.s10:
1736 : a5 45 __ LDA T4 + 0 
1738 : d0 05 __ BNE $173f ; (builddop.s40 + 0)
.s11:
173a : a5 43 __ LDA T0 + 0 
173c : 4c a0 17 JMP $17a0 ; (builddop.s52 + 0)
.s40:
173f : a5 10 __ LDA P3 ; (shift + 0)
1741 : 85 0e __ STA P1 
1743 : d0 05 __ BNE $174a ; (builddop.s42 + 0)
.s41:
1745 : a5 43 __ LDA T0 + 0 
1747 : 4c 97 17 JMP $1797 ; (builddop.s51 + 0)
.s42:
174a : a9 b1 __ LDA #$b1
174c : a6 43 __ LDX T0 + 0 
174e : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
1751 : a9 03 __ LDA #$03
1753 : 9d 01 29 STA $2901,x ; (BLIT_CODE[0] + 1)
1756 : 9d 06 29 STA $2906,x ; (BLIT_CODE[0] + 6)
1759 : 9d 0a 29 STA $290a,x ; (BLIT_CODE[0] + 10)
175c : a9 85 __ LDA #$85
175e : 9d 02 29 STA $2902,x ; (BLIT_CODE[0] + 2)
1761 : 9d 09 29 STA $2909,x ; (BLIT_CODE[0] + 9)
1764 : a9 08 __ LDA #$08
1766 : 9d 03 29 STA $2903,x ; (BLIT_CODE[0] + 3)
1769 : 9d 08 29 STA $2908,x ; (BLIT_CODE[0] + 8)
176c : a9 a5 __ LDA #$a5
176e : 9d 05 29 STA $2905,x ; (BLIT_CODE[0] + 5)
1771 : a9 02 __ LDA #$02
1773 : 9d 0c 29 STA $290c,x ; (BLIT_CODE[0] + 12)
1776 : a9 04 __ LDA #$04
1778 : 9d 0e 29 STA $290e,x ; (BLIT_CODE[0] + 14)
177b : a5 48 __ LDA T9 + 0 
177d : 9d 04 29 STA $2904,x ; (BLIT_CODE[0] + 4)
1780 : a5 49 __ LDA T10 + 0 
1782 : 09 08 __ ORA #$08
1784 : 9d 07 29 STA $2907,x ; (BLIT_CODE[0] + 7)
1787 : a5 4a __ LDA T11 + 0 
1789 : 9d 0b 29 STA $290b,x ; (BLIT_CODE[0] + 11)
178c : a5 4b __ LDA T12 + 0 
178e : 09 04 __ ORA #$04
1790 : 9d 0d 29 STA $290d,x ; (BLIT_CODE[0] + 13)
1793 : 8a __ __ TXA
1794 : 18 __ __ CLC
1795 : 69 0f __ ADC #$0f
.s51:
1797 : 85 0d __ STA P0 
1799 : a5 15 __ LDA P8 ; (reverse + 0)
179b : 85 0f __ STA P2 
179d : 20 ae 19 JSR $19ae ; (builddop_src.s4 + 0)
.s52:
17a0 : 85 0d __ STA P0 
17a2 : a5 14 __ LDA P7 ; (op + 0)
17a4 : 85 0e __ STA P1 
17a6 : a5 12 __ LDA P5 ; (lmask + 0)
17a8 : 49 ff __ EOR #$ff
17aa : 85 0f __ STA P2 
17ac : 20 ee 1a JSR $1aee ; (builddop_op.s4 + 0)
17af : 85 43 __ STA T0 + 0 
17b1 : a5 11 __ LDA P4 ; (w + 0)
17b3 : f0 68 __ BEQ $181d ; (builddop.s12 + 0)
.s13:
17b5 : a9 a0 __ LDA #$a0
17b7 : a6 43 __ LDX T0 + 0 
17b9 : e8 __ __ INX
17ba : e8 __ __ INX
17bb : 86 43 __ STX T0 + 0 
17bd : 86 0d __ STX P0 
17bf : 9d fe 28 STA $28fe,x 
17c2 : 18 __ __ CLC
17c3 : a5 47 __ LDA T6 + 0 
17c5 : 65 44 __ ADC T3 + 0 
17c7 : 85 44 __ STA T3 + 0 
17c9 : 9d ff 28 STA $28ff,x 
.s14:
17cc : a5 11 __ LDA P4 ; (w + 0)
17ce : c9 02 __ CMP #$02
17d0 : b0 53 __ BCS $1825 ; (builddop.s21 + 0)
.s15:
17d2 : a5 13 __ LDA P6 ; (rmask + 0)
17d4 : f0 47 __ BEQ $181d ; (builddop.s12 + 0)
.s16:
17d6 : a5 46 __ LDA T5 + 0 
17d8 : f0 1e __ BEQ $17f8 ; (builddop.s17 + 0)
.s20:
17da : a9 b1 __ LDA #$b1
17dc : a6 43 __ LDX T0 + 0 
17de : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
17e1 : a9 05 __ LDA #$05
17e3 : 9d 01 29 STA $2901,x ; (BLIT_CODE[0] + 1)
17e6 : a9 85 __ LDA #$85
17e8 : 9d 02 29 STA $2902,x ; (BLIT_CODE[0] + 2)
17eb : a9 0a __ LDA #$0a
17ed : 9d 03 29 STA $2903,x ; (BLIT_CODE[0] + 3)
17f0 : 8a __ __ TXA
17f1 : 18 __ __ CLC
17f2 : 69 04 __ ADC #$04
17f4 : 85 43 __ STA T0 + 0 
17f6 : 85 0d __ STA P0 
.s17:
17f8 : a5 45 __ LDA T4 + 0 
17fa : d0 05 __ BNE $1801 ; (builddop.s19 + 0)
.s18:
17fc : a5 43 __ LDA T0 + 0 
17fe : 4c 0c 18 JMP $180c ; (builddop.s50 + 0)
.s19:
1801 : a5 10 __ LDA P3 ; (shift + 0)
1803 : 85 0e __ STA P1 
1805 : a5 15 __ LDA P8 ; (reverse + 0)
1807 : 85 0f __ STA P2 
1809 : 20 ae 19 JSR $19ae ; (builddop_src.s4 + 0)
.s50:
180c : 85 0d __ STA P0 
180e : a5 14 __ LDA P7 ; (op + 0)
1810 : 85 0e __ STA P1 
1812 : a5 13 __ LDA P6 ; (rmask + 0)
1814 : 49 ff __ EOR #$ff
1816 : 85 0f __ STA P2 
1818 : 20 ee 1a JSR $1aee ; (builddop_op.s4 + 0)
181b : 85 43 __ STA T0 + 0 
.s12:
181d : a9 60 __ LDA #$60
181f : a6 43 __ LDX T0 + 0 
1821 : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
.s3:
1824 : 60 __ __ RTS
.s21:
1825 : a9 02 __ LDA #$02
1827 : c5 11 __ CMP P4 ; (w + 0)
1829 : a9 00 __ LDA #$00
182b : 6a __ __ ROR
182c : 85 4c __ STA T14 + 0 
182e : d0 19 __ BNE $1849 ; (builddop.s22 + 0)
.s39:
1830 : a9 a2 __ LDA #$a2
1832 : a6 43 __ LDX T0 + 0 
1834 : e8 __ __ INX
1835 : e8 __ __ INX
1836 : 86 43 __ STX T0 + 0 
1838 : 9d fe 28 STA $28fe,x 
183b : 38 __ __ SEC
183c : a5 11 __ LDA P4 ; (w + 0)
183e : e9 01 __ SBC #$01
1840 : 9d ff 28 STA $28ff,x 
1843 : a5 11 __ LDA P4 ; (w + 0)
1845 : c9 20 __ CMP #$20
1847 : b0 0d __ BCS $1856 ; (builddop.s24 + 0)
.s22:
1849 : a5 10 __ LDA P3 ; (shift + 0)
184b : d0 09 __ BNE $1856 ; (builddop.s24 + 0)
.s23:
184d : a5 48 __ LDA T9 + 0 
184f : a6 43 __ LDX T0 + 0 
1851 : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
1854 : e6 43 __ INC T0 + 0 
.s24:
1856 : a6 43 __ LDX T0 + 0 
1858 : 86 4d __ STX T15 + 0 
185a : a5 46 __ LDA T5 + 0 
185c : f0 1a __ BEQ $1878 ; (builddop.s25 + 0)
.s38:
185e : a9 b1 __ LDA #$b1
1860 : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
1863 : a9 05 __ LDA #$05
1865 : 9d 01 29 STA $2901,x ; (BLIT_CODE[0] + 1)
1868 : a9 85 __ LDA #$85
186a : 9d 02 29 STA $2902,x ; (BLIT_CODE[0] + 2)
186d : a9 0a __ LDA #$0a
186f : 9d 03 29 STA $2903,x ; (BLIT_CODE[0] + 3)
1872 : 8a __ __ TXA
1873 : 18 __ __ CLC
1874 : 69 04 __ ADC #$04
1876 : 85 43 __ STA T0 + 0 
.s25:
1878 : a5 45 __ LDA T4 + 0 
187a : d0 05 __ BNE $1881 ; (builddop.s37 + 0)
.s26:
187c : a5 43 __ LDA T0 + 0 
187e : 4c 90 18 JMP $1890 ; (builddop.s49 + 0)
.s37:
1881 : a5 43 __ LDA T0 + 0 
1883 : 85 0d __ STA P0 
1885 : a5 10 __ LDA P3 ; (shift + 0)
1887 : 85 0e __ STA P1 
1889 : a5 15 __ LDA P8 ; (reverse + 0)
188b : 85 0f __ STA P2 
188d : 20 ae 19 JSR $19ae ; (builddop_src.s4 + 0)
.s49:
1890 : 85 0d __ STA P0 
1892 : a5 14 __ LDA P7 ; (op + 0)
1894 : 85 0e __ STA P1 
1896 : a9 00 __ LDA #$00
1898 : 85 0f __ STA P2 
189a : 20 ee 1a JSR $1aee ; (builddop_op.s4 + 0)
189d : 24 4c __ BIT T14 + 0 
189f : 10 17 __ BPL $18b8 ; (builddop.s28 + 0)
.s27:
18a1 : aa __ __ TAX
18a2 : e8 __ __ INX
18a3 : e8 __ __ INX
18a4 : 86 43 __ STX T0 + 0 
18a6 : 86 0d __ STX P0 
18a8 : a9 a0 __ LDA #$a0
18aa : 9d fe 28 STA $28fe,x 
18ad : 18 __ __ CLC
18ae : a5 47 __ LDA T6 + 0 
18b0 : 65 44 __ ADC T3 + 0 
18b2 : 9d ff 28 STA $28ff,x 
18b5 : 4c d2 17 JMP $17d2 ; (builddop.s15 + 0)
.s28:
18b8 : a8 __ __ TAY
18b9 : a9 1f __ LDA #$1f
18bb : c5 11 __ CMP P4 ; (w + 0)
18bd : a9 00 __ LDA #$00
18bf : 6a __ __ ROR
18c0 : 85 47 __ STA T6 + 0 
18c2 : f0 04 __ BEQ $18c8 ; (builddop.s36 + 0)
.s29:
18c4 : a5 10 __ LDA P3 ; (shift + 0)
18c6 : f0 06 __ BEQ $18ce ; (builddop.s30 + 0)
.s36:
18c8 : a5 48 __ LDA T9 + 0 
18ca : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
18cd : c8 __ __ INY
.s30:
18ce : a9 98 __ LDA #$98
18d0 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
18d3 : a9 08 __ LDA #$08
18d5 : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
18d8 : a9 a8 __ LDA #$a8
18da : 99 03 29 STA $2903,y ; (BLIT_CODE[0] + 3)
18dd : a5 49 __ LDA T10 + 0 
18df : 09 08 __ ORA #$08
18e1 : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
18e4 : 98 __ __ TYA
18e5 : 18 __ __ CLC
18e6 : 69 04 __ ADC #$04
18e8 : 85 43 __ STA T0 + 0 
18ea : 24 47 __ BIT T6 + 0 
18ec : 30 3a __ BMI $1928 ; (builddop.s31 + 0)
.s32:
18ee : a5 4a __ LDA T11 + 0 
18f0 : 99 04 29 STA $2904,y ; (BLIT_CODE[0] + 4)
18f3 : a5 4b __ LDA T12 + 0 
18f5 : 09 04 __ ORA #$04
18f7 : aa __ __ TAX
18f8 : a5 45 __ LDA T4 + 0 
18fa : d0 0d __ BNE $1909 ; (builddop.s35 + 0)
.s33:
18fc : a9 02 __ LDA #$02
18fe : 99 05 29 STA $2905,y ; (BLIT_CODE[0] + 5)
1901 : 18 __ __ CLC
1902 : a5 43 __ LDA T0 + 0 
1904 : 69 02 __ ADC #$02
1906 : 4c 1a 19 JMP $191a ; (builddop.s34 + 0)
.s35:
1909 : a9 04 __ LDA #$04
190b : 99 05 29 STA $2905,y ; (BLIT_CODE[0] + 5)
190e : 99 07 29 STA $2907,y ; (BLIT_CODE[0] + 7)
1911 : 8a __ __ TXA
1912 : 99 06 29 STA $2906,y ; (BLIT_CODE[0] + 6)
1915 : 18 __ __ CLC
1916 : a5 43 __ LDA T0 + 0 
1918 : 69 04 __ ADC #$04
.s34:
191a : a8 __ __ TAY
191b : c8 __ __ INY
191c : c8 __ __ INY
191d : 84 43 __ STY T0 + 0 
191f : 8a __ __ TXA
1920 : 99 fe 28 STA $28fe,y 
1923 : a9 06 __ LDA #$06
1925 : 99 ff 28 STA $28ff,y 
.s31:
1928 : a9 ca __ LDA #$ca
192a : a4 43 __ LDY T0 + 0 
192c : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
192f : a9 d0 __ LDA #$d0
1931 : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
1934 : 98 __ __ TYA
1935 : 18 __ __ CLC
1936 : 69 01 __ ADC #$01
1938 : aa __ __ TAX
1939 : e8 __ __ INX
193a : e8 __ __ INX
193b : 86 43 __ STX T0 + 0 
193d : 86 0d __ STX P0 
193f : 49 ff __ EOR #$ff
1941 : 38 __ __ SEC
1942 : 65 4d __ ADC T15 + 0 
1944 : 38 __ __ SEC
1945 : e9 02 __ SBC #$02
1947 : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
194a : 4c d2 17 JMP $17d2 ; (builddop.s15 + 0)
.s44:
194d : 85 0d __ STA P0 
194f : a5 45 __ LDA T4 + 0 
1951 : f0 51 __ BEQ $19a4 ; (builddop.s45 + 0)
.s46:
1953 : a5 10 __ LDA P3 ; (shift + 0)
1955 : f0 4d __ BEQ $19a4 ; (builddop.s45 + 0)
.s47:
1957 : a9 03 __ LDA #$03
1959 : 8d 03 29 STA $2903 ; (BLIT_CODE[0] + 3)
195c : 8d 08 29 STA $2908 ; (BLIT_CODE[0] + 8)
195f : 8d 0c 29 STA $290c ; (BLIT_CODE[0] + 12)
1962 : a9 b1 __ LDA #$b1
1964 : 8d 02 29 STA $2902 ; (BLIT_CODE[0] + 2)
1967 : a9 85 __ LDA #$85
1969 : 8d 04 29 STA $2904 ; (BLIT_CODE[0] + 4)
196c : 8d 0b 29 STA $290b ; (BLIT_CODE[0] + 11)
196f : a9 08 __ LDA #$08
1971 : 8d 05 29 STA $2905 ; (BLIT_CODE[0] + 5)
1974 : 8d 0a 29 STA $290a ; (BLIT_CODE[0] + 10)
1977 : a9 a5 __ LDA #$a5
1979 : 8d 07 29 STA $2907 ; (BLIT_CODE[0] + 7)
197c : a9 02 __ LDA #$02
197e : 8d 0e 29 STA $290e ; (BLIT_CODE[0] + 14)
1981 : a9 04 __ LDA #$04
1983 : 8d 10 29 STA $2910 ; (BLIT_CODE[0] + 16)
1986 : a5 48 __ LDA T9 + 0 
1988 : 8d 06 29 STA $2906 ; (BLIT_CODE[0] + 6)
198b : a5 49 __ LDA T10 + 0 
198d : 09 08 __ ORA #$08
198f : 8d 09 29 STA $2909 ; (BLIT_CODE[0] + 9)
1992 : a5 4a __ LDA T11 + 0 
1994 : 8d 0d 29 STA $290d ; (BLIT_CODE[0] + 13)
1997 : a5 4b __ LDA T12 + 0 
1999 : 09 04 __ ORA #$04
199b : 8d 0f 29 STA $290f ; (BLIT_CODE[0] + 15)
199e : a9 11 __ LDA #$11
19a0 : 85 43 __ STA T0 + 0 
19a2 : 85 0d __ STA P0 
.s45:
19a4 : e6 11 __ INC P4 ; (w + 0)
19a6 : d0 03 __ BNE $19ab ; (builddop.s45 + 7)
19a8 : 4c 1d 18 JMP $181d ; (builddop.s12 + 0)
19ab : 4c cc 17 JMP $17cc ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
19ae : a6 0d __ LDX P0 ; (ip + 0)
19b0 : e8 __ __ INX
19b1 : a4 0d __ LDY P0 ; (ip + 0)
19b3 : e8 __ __ INX
19b4 : a5 0e __ LDA P1 ; (shift + 0)
19b6 : d0 0c __ BNE $19c4 ; (builddop_src.s6 + 0)
.s5:
19b8 : a9 b1 __ LDA #$b1
19ba : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
19bd : a9 03 __ LDA #$03
19bf : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
19c2 : 8a __ __ TXA
.s3:
19c3 : 60 __ __ RTS
.s6:
19c4 : a9 a5 __ LDA #$a5
19c6 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
19c9 : a9 08 __ LDA #$08
19cb : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
19ce : a5 0f __ LDA P2 ; (reverse + 0)
19d0 : f0 03 __ BEQ $19d5 ; (builddop_src.s7 + 0)
19d2 : 4c e0 1a JMP $1ae0 ; (builddop_src.s26 + 0)
.s7:
19d5 : a5 0e __ LDA P1 ; (shift + 0)
19d7 : c9 05 __ CMP #$05
19d9 : b0 06 __ BCS $19e1 ; (builddop_src.s8 + 0)
.s24:
19db : a9 4a __ LDA #$4a
.s25:
19dd : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
19e0 : e8 __ __ INX
.s8:
19e1 : a9 85 __ LDA #$85
19e3 : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
19e6 : 9d 04 29 STA $2904,x ; (BLIT_CODE[0] + 4)
19e9 : a9 09 __ LDA #$09
19eb : 9d 01 29 STA $2901,x ; (BLIT_CODE[0] + 1)
19ee : a9 b1 __ LDA #$b1
19f0 : 9d 02 29 STA $2902,x ; (BLIT_CODE[0] + 2)
19f3 : a9 03 __ LDA #$03
19f5 : 9d 03 29 STA $2903,x ; (BLIT_CODE[0] + 3)
19f8 : a9 08 __ LDA #$08
19fa : 9d 05 29 STA $2905,x ; (BLIT_CODE[0] + 5)
19fd : 8a __ __ TXA
19fe : 18 __ __ CLC
19ff : 69 06 __ ADC #$06
1a01 : 85 1b __ STA ACCU + 0 
1a03 : a8 __ __ TAY
1a04 : a5 0f __ LDA P2 ; (reverse + 0)
1a06 : d0 72 __ BNE $1a7a ; (builddop_src.s17 + 0)
.s9:
1a08 : a5 0e __ LDA P1 ; (shift + 0)
1a0a : c9 05 __ CMP #$05
1a0c : 90 0b __ BCC $1a19 ; (builddop_src.s10 + 0)
.s13:
1a0e : a9 0a __ LDA #$0a
1a10 : 9d 06 29 STA $2906,x ; (BLIT_CODE[0] + 6)
1a13 : e6 1b __ INC ACCU + 0 
1a15 : a6 0e __ LDX P1 ; (shift + 0)
1a17 : b0 25 __ BCS $1a3e ; (builddop_src.l14 + 0)
.s10:
1a19 : c9 02 __ CMP #$02
1a1b : 90 19 __ BCC $1a36 ; (builddop_src.s11 + 0)
.s12:
1a1d : c6 0e __ DEC P1 ; (shift + 0)
1a1f : a6 0e __ LDX P1 ; (shift + 0)
.l29:
1a21 : a9 6a __ LDA #$6a
1a23 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1a26 : a9 46 __ LDA #$46
1a28 : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
1a2b : a9 09 __ LDA #$09
1a2d : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1a30 : c8 __ __ INY
1a31 : c8 __ __ INY
1a32 : c8 __ __ INY
1a33 : ca __ __ DEX
1a34 : d0 eb __ BNE $1a21 ; (builddop_src.l29 + 0)
.s11:
1a36 : a9 6a __ LDA #$6a
.s30:
1a38 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1a3b : c8 __ __ INY
1a3c : 98 __ __ TYA
1a3d : 60 __ __ RTS
.l14:
1a3e : a5 1b __ LDA ACCU + 0 
1a40 : 85 1d __ STA ACCU + 2 
1a42 : 85 1c __ STA ACCU + 1 
1a44 : a8 __ __ TAY
1a45 : 18 __ __ CLC
1a46 : 69 03 __ ADC #$03
1a48 : 85 1b __ STA ACCU + 0 
1a4a : e0 07 __ CPX #$07
1a4c : b0 16 __ BCS $1a64 ; (builddop_src.s15 + 0)
.s16:
1a4e : a9 26 __ LDA #$26
1a50 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1a53 : a9 09 __ LDA #$09
1a55 : a4 1d __ LDY ACCU + 2 
1a57 : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
1a5a : a9 0a __ LDA #$0a
1a5c : a4 1c __ LDY ACCU + 1 
1a5e : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1a61 : e8 __ __ INX
1a62 : 90 da __ BCC $1a3e ; (builddop_src.l14 + 0)
.s15:
1a64 : a9 a5 __ LDA #$a5
1a66 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1a69 : a9 09 __ LDA #$09
1a6b : a6 1d __ LDX ACCU + 2 
1a6d : 9d 01 29 STA $2901,x ; (BLIT_CODE[0] + 1)
1a70 : a9 2a __ LDA #$2a
1a72 : a6 1c __ LDX ACCU + 1 
1a74 : 9d 02 29 STA $2902,x ; (BLIT_CODE[0] + 2)
1a77 : a5 1b __ LDA ACCU + 0 
1a79 : 60 __ __ RTS
.s17:
1a7a : a5 0e __ LDA P1 ; (shift + 0)
1a7c : c9 05 __ CMP #$05
1a7e : b0 3e __ BCS $1abe ; (builddop_src.s21 + 0)
.s18:
1a80 : a9 4a __ LDA #$4a
1a82 : 9d 06 29 STA $2906,x ; (BLIT_CODE[0] + 6)
1a85 : e6 1b __ INC ACCU + 0 
1a87 : a6 0e __ LDX P1 ; (shift + 0)
1a89 : e0 02 __ CPX #$02
1a8b : 90 1b __ BCC $1aa8 ; (builddop_src.s19 + 0)
.s20:
1a8d : a4 1b __ LDY ACCU + 0 
.l28:
1a8f : a9 66 __ LDA #$66
1a91 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1a94 : a9 09 __ LDA #$09
1a96 : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
1a99 : a9 4a __ LDA #$4a
1a9b : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1a9e : 98 __ __ TYA
1a9f : 18 __ __ CLC
1aa0 : 69 03 __ ADC #$03
1aa2 : a8 __ __ TAY
1aa3 : ca __ __ DEX
1aa4 : d0 e9 __ BNE $1a8f ; (builddop_src.l28 + 0)
.s31:
1aa6 : 85 1b __ STA ACCU + 0 
.s19:
1aa8 : a9 a5 __ LDA #$a5
1aaa : a6 1b __ LDX ACCU + 0 
1aac : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
1aaf : a9 09 __ LDA #$09
1ab1 : 9d 01 29 STA $2901,x ; (BLIT_CODE[0] + 1)
1ab4 : a9 6a __ LDA #$6a
1ab6 : 9d 02 29 STA $2902,x ; (BLIT_CODE[0] + 2)
1ab9 : 8a __ __ TXA
1aba : 18 __ __ CLC
1abb : 69 03 __ ADC #$03
1abd : 60 __ __ RTS
.s21:
1abe : c9 07 __ CMP #$07
1ac0 : b0 19 __ BCS $1adb ; (builddop_src.s22 + 0)
.s23:
1ac2 : aa __ __ TAX
.l32:
1ac3 : a9 2a __ LDA #$2a
1ac5 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1ac8 : a9 06 __ LDA #$06
1aca : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
1acd : a9 09 __ LDA #$09
1acf : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1ad2 : 98 __ __ TYA
1ad3 : 69 03 __ ADC #$03
1ad5 : e8 __ __ INX
1ad6 : e0 07 __ CPX #$07
1ad8 : a8 __ __ TAY
1ad9 : 90 e8 __ BCC $1ac3 ; (builddop_src.l32 + 0)
.s22:
1adb : a9 2a __ LDA #$2a
1add : 4c 38 1a JMP $1a38 ; (builddop_src.s30 + 0)
.s26:
1ae0 : a5 0e __ LDA P1 ; (shift + 0)
1ae2 : c9 05 __ CMP #$05
1ae4 : b0 03 __ BCS $1ae9 ; (builddop_src.s27 + 0)
1ae6 : 4c e1 19 JMP $19e1 ; (builddop_src.s8 + 0)
.s27:
1ae9 : a9 0a __ LDA #$0a
1aeb : 4c dd 19 JMP $19dd ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1aee : a5 0e __ LDA P1 ; (op + 0)
1af0 : 29 20 __ AND #$20
1af2 : f0 04 __ BEQ $1af8 ; (builddop_op.s27 + 0)
.s28:
1af4 : a9 07 __ LDA #$07
1af6 : d0 02 __ BNE $1afa ; (builddop_op.s29 + 0)
.s27:
1af8 : a9 0a __ LDA #$0a
.s29:
1afa : 85 1c __ STA ACCU + 1 
1afc : a5 0e __ LDA P1 ; (op + 0)
1afe : 29 03 __ AND #$03
1b00 : 85 1b __ STA ACCU + 0 
1b02 : a5 0e __ LDA P1 ; (op + 0)
1b04 : 29 04 __ AND #$04
1b06 : f0 03 __ BEQ $1b0b ; (builddop_op.s5 + 0)
1b08 : 4c 9e 1b JMP $1b9e ; (builddop_op.s18 + 0)
.s5:
1b0b : a5 0e __ LDA P1 ; (op + 0)
1b0d : 29 08 __ AND #$08
1b0f : d0 13 __ BNE $1b24 ; (builddop_op.s15 + 0)
.s6:
1b11 : a9 a5 __ LDA #$a5
1b13 : a4 0d __ LDY P0 ; (ip + 0)
1b15 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1b18 : a5 1c __ LDA ACCU + 1 
.s7:
1b1a : c8 __ __ INY
1b1b : c8 __ __ INY
1b1c : 84 0d __ STY P0 ; (ip + 0)
1b1e : 99 ff 28 STA $28ff,y 
1b21 : 4c 34 1b JMP $1b34 ; (builddop_op.s16 + 0)
.s15:
1b24 : a5 0e __ LDA P1 ; (op + 0)
1b26 : 0a __ __ ASL
1b27 : 10 0b __ BPL $1b34 ; (builddop_op.s16 + 0)
.s17:
1b29 : a9 49 __ LDA #$49
1b2b : a4 0d __ LDY P0 ; (ip + 0)
1b2d : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1b30 : a9 ff __ LDA #$ff
1b32 : d0 e6 __ BNE $1b1a ; (builddop_op.s7 + 0)
.s16:
1b34 : a6 1b __ LDX ACCU + 0 
1b36 : f0 13 __ BEQ $1b4b ; (builddop_op.s8 + 0)
.s14:
1b38 : a5 1c __ LDA ACCU + 1 
1b3a : a4 0d __ LDY P0 ; (ip + 0)
1b3c : c8 __ __ INY
1b3d : c8 __ __ INY
1b3e : 84 0d __ STY P0 ; (ip + 0)
1b40 : 99 ff 28 STA $28ff,y 
1b43 : bd b4 25 LDA $25b4,x ; (blitops_op[0] + 0)
1b46 : 09 04 __ ORA #$04
1b48 : 99 fe 28 STA $28fe,y 
.s8:
1b4b : a5 0f __ LDA P2 ; (mask + 0)
1b4d : f0 3f __ BEQ $1b8e ; (builddop_op.s9 + 0)
.s10:
1b4f : a9 85 __ LDA #$85
1b51 : a4 0d __ LDY P0 ; (ip + 0)
1b53 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1b56 : a9 09 __ LDA #$09
1b58 : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
1b5b : 98 __ __ TYA
1b5c : 18 __ __ CLC
1b5d : 69 08 __ ADC #$08
1b5f : 85 0d __ STA P0 ; (ip + 0)
1b61 : a5 0e __ LDA P1 ; (op + 0)
1b63 : 29 10 __ AND #$10
1b65 : f0 09 __ BEQ $1b70 ; (builddop_op.s11 + 0)
.s13:
1b67 : a9 45 __ LDA #$45
1b69 : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1b6c : a9 0a __ LDA #$0a
1b6e : d0 07 __ BNE $1b77 ; (builddop_op.s12 + 0)
.s11:
1b70 : a9 51 __ LDA #$51
1b72 : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1b75 : a9 05 __ LDA #$05
.s12:
1b77 : 99 03 29 STA $2903,y ; (BLIT_CODE[0] + 3)
1b7a : a9 29 __ LDA #$29
1b7c : 99 04 29 STA $2904,y ; (BLIT_CODE[0] + 4)
1b7f : a5 0f __ LDA P2 ; (mask + 0)
1b81 : 99 05 29 STA $2905,y ; (BLIT_CODE[0] + 5)
1b84 : a9 45 __ LDA #$45
1b86 : 99 06 29 STA $2906,y ; (BLIT_CODE[0] + 6)
1b89 : a9 09 __ LDA #$09
1b8b : 99 07 29 STA $2907,y ; (BLIT_CODE[0] + 7)
.s9:
1b8e : a9 91 __ LDA #$91
1b90 : a6 0d __ LDX P0 ; (ip + 0)
1b92 : 9d 00 29 STA $2900,x ; (BLIT_CODE[0] + 0)
1b95 : a9 05 __ LDA #$05
1b97 : 9d 01 29 STA $2901,x ; (BLIT_CODE[0] + 1)
1b9a : e8 __ __ INX
1b9b : e8 __ __ INX
1b9c : 8a __ __ TXA
.s3:
1b9d : 60 __ __ RTS
.s18:
1b9e : a5 1b __ LDA ACCU + 0 
1ba0 : d0 04 __ BNE $1ba6 ; (builddop_op.s20 + 0)
.s19:
1ba2 : a5 0f __ LDA P2 ; (mask + 0)
1ba4 : d0 14 __ BNE $1bba ; (builddop_op.s23 + 0)
.s20:
1ba6 : a5 0e __ LDA P1 ; (op + 0)
1ba8 : 29 40 __ AND #$40
1baa : f0 02 __ BEQ $1bae ; (builddop_op.s21 + 0)
.s22:
1bac : a9 ff __ LDA #$ff
.s21:
1bae : aa __ __ TAX
1baf : a9 a9 __ LDA #$a9
1bb1 : a4 0d __ LDY P0 ; (ip + 0)
1bb3 : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1bb6 : 8a __ __ TXA
1bb7 : 4c 1a 1b JMP $1b1a ; (builddop_op.s7 + 0)
.s23:
1bba : a9 b1 __ LDA #$b1
1bbc : a4 0d __ LDY P0 ; (ip + 0)
1bbe : 99 00 29 STA $2900,y ; (BLIT_CODE[0] + 0)
1bc1 : a9 05 __ LDA #$05
1bc3 : 99 01 29 STA $2901,y ; (BLIT_CODE[0] + 1)
1bc6 : 06 0e __ ASL P1 ; (op + 0)
1bc8 : 30 0a __ BMI $1bd4 ; (builddop_op.s26 + 0)
.s24:
1bca : a9 29 __ LDA #$29
1bcc : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1bcf : a5 0f __ LDA P2 ; (mask + 0)
1bd1 : 4c dd 1b JMP $1bdd ; (builddop_op.s25 + 0)
.s26:
1bd4 : a9 09 __ LDA #$09
1bd6 : 99 02 29 STA $2902,y ; (BLIT_CODE[0] + 2)
1bd9 : a5 0f __ LDA P2 ; (mask + 0)
1bdb : 49 ff __ EOR #$ff
.s25:
1bdd : 99 03 29 STA $2903,y ; (BLIT_CODE[0] + 3)
1be0 : a9 91 __ LDA #$91
1be2 : 99 04 29 STA $2904,y ; (BLIT_CODE[0] + 4)
1be5 : a9 05 __ LDA #$05
1be7 : 99 05 29 STA $2905,y ; (BLIT_CODE[0] + 5)
1bea : 98 __ __ TYA
1beb : 18 __ __ CLC
1bec : 69 06 __ ADC #$06
1bee : 60 __ __ RTS
--------------------------------------------------------------------
1bef : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
1bf7 : __ __ __ BYT 53 45 54 00                                     : SET.
--------------------------------------------------------------------
1bfb : __ __ __ BYT 52 45 53 45 54 00                               : RESET.
--------------------------------------------------------------------
1c01 : __ __ __ BYT 4e 4f 54 00                                     : NOT.
--------------------------------------------------------------------
1c05 : __ __ __ BYT 58 4f 52 00                                     : XOR.
--------------------------------------------------------------------
1c09 : __ __ __ BYT 4f 52 00                                        : OR.
--------------------------------------------------------------------
1c0c : __ __ __ BYT 41 4e 44 00                                     : AND.
--------------------------------------------------------------------
1c10 : __ __ __ BYT 4e 41 4e 44 00                                  : NAND.
--------------------------------------------------------------------
1c15 : __ __ __ BYT 43 4f 50 59 00                                  : COPY.
--------------------------------------------------------------------
1c1a : __ __ __ BYT 4e 43 4f 50 59 00                               : NCOPY.
--------------------------------------------------------------------
1c20 : __ __ __ BYT 50 41 54 54 45 52 4e 00                         : PATTERN.
--------------------------------------------------------------------
1c28 : __ __ __ BYT 4d 41 53 4b 50 41 54 00                         : MASKPAT.
--------------------------------------------------------------------
bm_put_chars: ; bm_put_chars(const struct Bitmap*,const struct ClipRect*,i16,i16,const u8*,u8,enum BlitOp)->i16
; 160, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
1c30 : a2 0d __ LDX #$0d
1c32 : b5 53 __ LDA T3 + 0,x 
1c34 : 9d b9 9f STA $9fb9,x ; (bm_put_chars@stack + 0)
1c37 : ca __ __ DEX
1c38 : 10 f8 __ BPL $1c32 ; (bm_put_chars.s1 + 2)
.s4:
1c3a : a9 00 __ LDA #$00
1c3c : 85 57 __ STA T5 + 0 
1c3e : 85 58 __ STA T5 + 1 
1c40 : ad fa 9f LDA $9ffa ; (sstack + 43)
1c43 : 85 59 __ STA T6 + 0 
1c45 : ad f6 9f LDA $9ff6 ; (sstack + 39)
1c48 : 85 5b __ STA T7 + 0 
1c4a : ad f7 9f LDA $9ff7 ; (sstack + 40)
1c4d : 85 5c __ STA T7 + 1 
1c4f : ad fb 9f LDA $9ffb ; (sstack + 44)
1c52 : 85 5a __ STA T6 + 1 
1c54 : a0 07 __ LDY #$07
1c56 : d1 5b __ CMP (T7 + 0),y 
1c58 : d0 09 __ BNE $1c63 ; (bm_put_chars.s51 + 0)
.s48:
1c5a : a5 59 __ LDA T6 + 0 
1c5c : 88 __ __ DEY
1c5d : d1 5b __ CMP (T7 + 0),y 
.s49:
1c5f : 90 08 __ BCC $1c69 ; (bm_put_chars.s5 + 0)
1c61 : b0 51 __ BCS $1cb4 ; (bm_put_chars.s38 + 0)
.s51:
1c63 : 51 5b __ EOR (T7 + 0),y 
1c65 : 10 f8 __ BPL $1c5f ; (bm_put_chars.s49 + 0)
.s50:
1c67 : 90 4b __ BCC $1cb4 ; (bm_put_chars.s38 + 0)
.s5:
1c69 : ad f8 9f LDA $9ff8 ; (sstack + 41)
1c6c : 85 43 __ STA T0 + 0 ; (x + 1)
1c6e : a0 04 __ LDY #$04
1c70 : b1 5b __ LDA (T7 + 0),y 
1c72 : 85 45 __ STA T1 + 0 ; (y + 1)
1c74 : c8 __ __ INY
1c75 : b1 5b __ LDA (T7 + 0),y 
1c77 : 85 46 __ STA T1 + 1 ; (str + 0)
1c79 : ad f9 9f LDA $9ff9 ; (sstack + 42)
1c7c : 85 44 __ STA T0 + 1 ; (y + 0)
1c7e : c5 46 __ CMP T1 + 1 ; (str + 0)
1c80 : d0 08 __ BNE $1c8a ; (bm_put_chars.s47 + 0)
.s44:
1c82 : a5 43 __ LDA T0 + 0 ; (x + 1)
1c84 : c5 45 __ CMP T1 + 0 ; (y + 1)
.s45:
1c86 : 90 08 __ BCC $1c90 ; (bm_put_chars.s6 + 0)
1c88 : b0 2a __ BCS $1cb4 ; (bm_put_chars.s38 + 0)
.s47:
1c8a : 45 46 __ EOR T1 + 1 ; (str + 0)
1c8c : 10 f8 __ BPL $1c86 ; (bm_put_chars.s45 + 0)
.s46:
1c8e : 90 24 __ BCC $1cb4 ; (bm_put_chars.s38 + 0)
.s6:
1c90 : 18 __ __ CLC
1c91 : a5 59 __ LDA T6 + 0 
1c93 : 69 08 __ ADC #$08
1c95 : 85 1b __ STA ACCU + 0 
1c97 : a5 5a __ LDA T6 + 1 
1c99 : 69 00 __ ADC #$00
1c9b : 85 1c __ STA ACCU + 1 
1c9d : a0 03 __ LDY #$03
1c9f : b1 5b __ LDA (T7 + 0),y 
1ca1 : c5 1c __ CMP ACCU + 1 
1ca3 : d0 09 __ BNE $1cae ; (bm_put_chars.s43 + 0)
.s40:
1ca5 : 88 __ __ DEY
1ca6 : b1 5b __ LDA (T7 + 0),y 
1ca8 : c5 1b __ CMP ACCU + 0 
.s41:
1caa : b0 08 __ BCS $1cb4 ; (bm_put_chars.s38 + 0)
1cac : 90 44 __ BCC $1cf2 ; (bm_put_chars.s7 + 0)
.s43:
1cae : 45 1c __ EOR ACCU + 1 
1cb0 : 10 f8 __ BPL $1caa ; (bm_put_chars.s41 + 0)
.s42:
1cb2 : b0 3e __ BCS $1cf2 ; (bm_put_chars.s7 + 0)
.s38:
1cb4 : ad fe 9f LDA $9ffe ; (sstack + 47)
1cb7 : f0 26 __ BEQ $1cdf ; (bm_put_chars.s11 + 0)
.s39:
1cb9 : ad fc 9f LDA $9ffc ; (sstack + 45)
1cbc : 85 43 __ STA T0 + 0 ; (x + 1)
1cbe : ad fd 9f LDA $9ffd ; (sstack + 46)
1cc1 : 85 44 __ STA T0 + 1 ; (y + 0)
1cc3 : a0 00 __ LDY #$00
.l52:
1cc5 : b1 43 __ LDA (T0 + 0),y ; (x + 1)
1cc7 : 38 __ __ SEC
1cc8 : e9 20 __ SBC #$20
1cca : aa __ __ TAX
1ccb : bd 41 26 LDA $2641,x ; (TinyFont[0] + 96)
1cce : 4a __ __ LSR
1ccf : 4a __ __ LSR
1cd0 : 38 __ __ SEC
1cd1 : 65 57 __ ADC T5 + 0 
1cd3 : 85 57 __ STA T5 + 0 
1cd5 : 90 02 __ BCC $1cd9 ; (bm_put_chars.s63 + 0)
.s62:
1cd7 : e6 58 __ INC T5 + 1 
.s63:
1cd9 : c8 __ __ INY
1cda : cc fe 9f CPY $9ffe ; (sstack + 47)
1cdd : 90 e6 __ BCC $1cc5 ; (bm_put_chars.l52 + 0)
.s11:
1cdf : a5 57 __ LDA T5 + 0 
1ce1 : 85 1b __ STA ACCU + 0 
1ce3 : a5 58 __ LDA T5 + 1 
1ce5 : 85 1c __ STA ACCU + 1 
.s3:
1ce7 : a2 0d __ LDX #$0d
1ce9 : bd b9 9f LDA $9fb9,x ; (bm_put_chars@stack + 0)
1cec : 95 53 __ STA T3 + 0,x 
1cee : ca __ __ DEX
1cef : 10 f8 __ BPL $1ce9 ; (bm_put_chars.s3 + 2)
1cf1 : 60 __ __ RTS
.s7:
1cf2 : a0 00 __ LDY #$00
1cf4 : b1 5b __ LDA (T7 + 0),y 
1cf6 : 85 1b __ STA ACCU + 0 
1cf8 : c8 __ __ INY
1cf9 : b1 5b __ LDA (T7 + 0),y 
1cfb : 85 1c __ STA ACCU + 1 
1cfd : a5 44 __ LDA T0 + 1 ; (y + 0)
1cff : c5 1c __ CMP ACCU + 1 
1d01 : d0 09 __ BNE $1d0c ; (bm_put_chars.s37 + 0)
.s34:
1d03 : a5 43 __ LDA T0 + 0 ; (x + 1)
1d05 : c5 1b __ CMP ACCU + 0 
.s35:
1d07 : 90 09 __ BCC $1d12 ; (bm_put_chars.s25 + 0)
1d09 : 4c 8e 1d JMP $1d8e ; (bm_put_chars.s8 + 0)
.s37:
1d0c : 45 1c __ EOR ACCU + 1 
1d0e : 10 f7 __ BPL $1d07 ; (bm_put_chars.s35 + 0)
.s36:
1d10 : 90 7c __ BCC $1d8e ; (bm_put_chars.s8 + 0)
.s25:
1d12 : a9 00 __ LDA #$00
1d14 : 85 5d __ STA T8 + 0 
1d16 : ad fe 9f LDA $9ffe ; (sstack + 47)
1d19 : 85 5f __ STA T9 + 0 
1d1b : f0 51 __ BEQ $1d6e ; (bm_put_chars.s26 + 0)
.s27:
1d1d : ad fc 9f LDA $9ffc ; (sstack + 45)
1d20 : 85 43 __ STA T0 + 0 ; (x + 1)
1d22 : ad fd 9f LDA $9ffd ; (sstack + 46)
1d25 : 85 44 __ STA T0 + 1 ; (y + 0)
1d27 : a0 00 __ LDY #$00
.l28:
1d29 : b1 43 __ LDA (T0 + 0),y ; (x + 1)
1d2b : 38 __ __ SEC
1d2c : e9 20 __ SBC #$20
1d2e : aa __ __ TAX
1d2f : bd 41 26 LDA $2641,x ; (TinyFont[0] + 96)
1d32 : 4a __ __ LSR
1d33 : 4a __ __ LSR
1d34 : 18 __ __ CLC
1d35 : 69 01 __ ADC #$01
1d37 : 85 53 __ STA T3 + 0 
1d39 : 6d f8 9f ADC $9ff8 ; (sstack + 41)
1d3c : aa __ __ TAX
1d3d : ad f9 9f LDA $9ff9 ; (sstack + 42)
1d40 : 69 00 __ ADC #$00
1d42 : 85 56 __ STA T4 + 1 
1d44 : c5 1c __ CMP ACCU + 1 
1d46 : d0 06 __ BNE $1d4e ; (bm_put_chars.s33 + 0)
.s30:
1d48 : e4 1b __ CPX ACCU + 0 
.s31:
1d4a : 90 08 __ BCC $1d54 ; (bm_put_chars.s29 + 0)
1d4c : b0 1e __ BCS $1d6c ; (bm_put_chars.s53 + 0)
.s33:
1d4e : 45 1c __ EOR ACCU + 1 
1d50 : 10 f8 __ BPL $1d4a ; (bm_put_chars.s31 + 0)
.s32:
1d52 : 90 18 __ BCC $1d6c ; (bm_put_chars.s53 + 0)
.s29:
1d54 : 8e f8 9f STX $9ff8 ; (sstack + 41)
1d57 : 18 __ __ CLC
1d58 : a5 57 __ LDA T5 + 0 
1d5a : 65 53 __ ADC T3 + 0 
1d5c : 85 57 __ STA T5 + 0 
1d5e : 90 02 __ BCC $1d62 ; (bm_put_chars.s56 + 0)
.s55:
1d60 : e6 58 __ INC T5 + 1 
.s56:
1d62 : a5 56 __ LDA T4 + 1 
1d64 : 8d f9 9f STA $9ff9 ; (sstack + 42)
1d67 : c8 __ __ INY
1d68 : c4 5f __ CPY T9 + 0 
1d6a : 90 bd __ BCC $1d29 ; (bm_put_chars.l28 + 0)
.s53:
1d6c : 84 5d __ STY T8 + 0 
.s26:
1d6e : ad fc 9f LDA $9ffc ; (sstack + 45)
1d71 : 18 __ __ CLC
1d72 : 65 5d __ ADC T8 + 0 
1d74 : 8d fc 9f STA $9ffc ; (sstack + 45)
1d77 : 90 03 __ BCC $1d7c ; (bm_put_chars.s58 + 0)
.s57:
1d79 : ee fd 9f INC $9ffd ; (sstack + 46)
.s58:
1d7c : a5 5f __ LDA T9 + 0 
1d7e : 38 __ __ SEC
1d7f : e5 5d __ SBC T8 + 0 
1d81 : 8d fe 9f STA $9ffe ; (sstack + 47)
1d84 : ad f8 9f LDA $9ff8 ; (sstack + 41)
1d87 : 85 43 __ STA T0 + 0 ; (x + 1)
1d89 : ad f9 9f LDA $9ff9 ; (sstack + 42)
1d8c : 85 44 __ STA T0 + 1 ; (y + 0)
.s8:
1d8e : a9 00 __ LDA #$00
1d90 : 85 5f __ STA T9 + 0 
1d92 : ad fe 9f LDA $9ffe ; (sstack + 47)
1d95 : 85 60 __ STA T10 + 0 
1d97 : f0 5d __ BEQ $1df6 ; (bm_put_chars.s9 + 0)
.s13:
1d99 : a5 44 __ LDA T0 + 1 ; (y + 0)
1d9b : c5 46 __ CMP T1 + 1 ; (str + 0)
1d9d : d0 08 __ BNE $1da7 ; (bm_put_chars.s24 + 0)
.s21:
1d9f : a5 43 __ LDA T0 + 0 ; (x + 1)
1da1 : c5 45 __ CMP T1 + 0 ; (y + 1)
.s22:
1da3 : 90 08 __ BCC $1dad ; (bm_put_chars.s14 + 0)
1da5 : b0 4f __ BCS $1df6 ; (bm_put_chars.s9 + 0)
.s24:
1da7 : 45 46 __ EOR T1 + 1 ; (str + 0)
1da9 : 10 f8 __ BPL $1da3 ; (bm_put_chars.s22 + 0)
.s23:
1dab : 90 49 __ BCC $1df6 ; (bm_put_chars.s9 + 0)
.s14:
1dad : ad fc 9f LDA $9ffc ; (sstack + 45)
1db0 : 85 1b __ STA ACCU + 0 
1db2 : ad fd 9f LDA $9ffd ; (sstack + 46)
1db5 : 85 1c __ STA ACCU + 1 
1db7 : a0 00 __ LDY #$00
.l15:
1db9 : b1 1b __ LDA (ACCU + 0),y 
1dbb : 38 __ __ SEC
1dbc : e9 20 __ SBC #$20
1dbe : aa __ __ TAX
1dbf : bd 41 26 LDA $2641,x ; (TinyFont[0] + 96)
1dc2 : 4a __ __ LSR
1dc3 : 4a __ __ LSR
1dc4 : 18 __ __ CLC
1dc5 : 69 01 __ ADC #$01
1dc7 : aa __ __ TAX
1dc8 : 65 57 __ ADC T5 + 0 
1dca : 85 57 __ STA T5 + 0 
1dcc : 90 02 __ BCC $1dd0 ; (bm_put_chars.s60 + 0)
.s59:
1dce : e6 58 __ INC T5 + 1 
.s60:
1dd0 : c8 __ __ INY
1dd1 : c4 60 __ CPY T10 + 0 
1dd3 : b0 1f __ BCS $1df4 ; (bm_put_chars.s54 + 0)
.s16:
1dd5 : 8a __ __ TXA
1dd6 : 65 43 __ ADC T0 + 0 ; (x + 1)
1dd8 : 85 43 __ STA T0 + 0 ; (x + 1)
1dda : a5 44 __ LDA T0 + 1 ; (y + 0)
1ddc : 69 00 __ ADC #$00
1dde : 85 44 __ STA T0 + 1 ; (y + 0)
1de0 : c5 46 __ CMP T1 + 1 ; (str + 0)
1de2 : d0 07 __ BNE $1deb ; (bm_put_chars.s20 + 0)
.s17:
1de4 : a5 43 __ LDA T0 + 0 ; (x + 1)
1de6 : c5 45 __ CMP T1 + 0 ; (y + 1)
1de8 : 4c f2 1d JMP $1df2 ; (bm_put_chars.s18 + 0)
.s20:
1deb : 45 46 __ EOR T1 + 1 ; (str + 0)
1ded : 10 03 __ BPL $1df2 ; (bm_put_chars.s18 + 0)
1def : 4c a8 1e JMP $1ea8 ; (bm_put_chars.s19 + 0)
.s18:
1df2 : 90 c5 __ BCC $1db9 ; (bm_put_chars.l15 + 0)
.s54:
1df4 : 84 5f __ STY T9 + 0 
.s9:
1df6 : a5 5f __ LDA T9 + 0 
1df8 : 85 12 __ STA P5 
1dfa : ad f9 9f LDA $9ff9 ; (sstack + 42)
1dfd : 85 54 __ STA T3 + 1 
1dff : a9 0c __ LDA #$0c
1e01 : 85 0d __ STA P0 
1e03 : a9 28 __ LDA #$28
1e05 : 85 0e __ STA P1 
1e07 : ad f8 9f LDA $9ff8 ; (sstack + 41)
1e0a : 85 53 __ STA T3 + 0 
1e0c : 29 07 __ AND #$07
1e0e : 85 55 __ STA T4 + 0 
1e10 : 85 0f __ STA P2 
1e12 : ad fc 9f LDA $9ffc ; (sstack + 45)
1e15 : 85 5d __ STA T8 + 0 
1e17 : 85 10 __ STA P3 
1e19 : ad fd 9f LDA $9ffd ; (sstack + 46)
1e1c : 85 5e __ STA T8 + 1 
1e1e : 85 11 __ STA P4 
1e20 : 20 b0 1e JSR $1eb0 ; (bmu_text.s4 + 0)
1e23 : ad f4 9f LDA $9ff4 ; (sstack + 37)
1e26 : 8d df 9f STA $9fdf ; (sstack + 16)
1e29 : ad f5 9f LDA $9ff5 ; (sstack + 38)
1e2c : 8d e0 9f STA $9fe0 ; (sstack + 17)
1e2f : a5 5b __ LDA T7 + 0 
1e31 : 8d e1 9f STA $9fe1 ; (sstack + 18)
1e34 : a5 5c __ LDA T7 + 1 
1e36 : 8d e2 9f STA $9fe2 ; (sstack + 19)
1e39 : a5 53 __ LDA T3 + 0 
1e3b : 8d e3 9f STA $9fe3 ; (sstack + 20)
1e3e : a5 54 __ LDA T3 + 1 
1e40 : 8d e4 9f STA $9fe4 ; (sstack + 21)
1e43 : a5 59 __ LDA T6 + 0 
1e45 : 8d e5 9f STA $9fe5 ; (sstack + 22)
1e48 : a5 5a __ LDA T6 + 1 
1e4a : 8d e6 9f STA $9fe6 ; (sstack + 23)
1e4d : a9 0c __ LDA #$0c
1e4f : 8d e7 9f STA $9fe7 ; (sstack + 24)
1e52 : a9 28 __ LDA #$28
1e54 : 8d e8 9f STA $9fe8 ; (sstack + 25)
1e57 : a5 55 __ LDA T4 + 0 
1e59 : 8d e9 9f STA $9fe9 ; (sstack + 26)
1e5c : a9 00 __ LDA #$00
1e5e : 8d ea 9f STA $9fea ; (sstack + 27)
1e61 : 8d eb 9f STA $9feb ; (sstack + 28)
1e64 : 8d ec 9f STA $9fec ; (sstack + 29)
1e67 : 8d f0 9f STA $9ff0 ; (sstack + 33)
1e6a : 8d f1 9f STA $9ff1 ; (sstack + 34)
1e6d : 8d f2 9f STA $9ff2 ; (sstack + 35)
1e70 : a5 1b __ LDA ACCU + 0 
1e72 : 8d ed 9f STA $9fed ; (sstack + 30)
1e75 : a5 1c __ LDA ACCU + 1 
1e77 : 8d ee 9f STA $9fee ; (sstack + 31)
1e7a : a9 08 __ LDA #$08
1e7c : 8d ef 9f STA $9fef ; (sstack + 32)
1e7f : ad ff 9f LDA $9fff ; (sstack + 48)
1e82 : 8d f3 9f STA $9ff3 ; (sstack + 36)
1e85 : 20 57 20 JSR $2057 ; (bm_bitblit.s4 + 0)
.l10:
1e88 : a4 5f __ LDY T9 + 0 
1e8a : c4 60 __ CPY T10 + 0 
1e8c : 90 03 __ BCC $1e91 ; (bm_put_chars.s12 + 0)
1e8e : 4c df 1c JMP $1cdf ; (bm_put_chars.s11 + 0)
.s12:
1e91 : e6 5f __ INC T9 + 0 
1e93 : b1 5d __ LDA (T8 + 0),y 
1e95 : e9 1f __ SBC #$1f
1e97 : aa __ __ TAX
1e98 : bd 41 26 LDA $2641,x ; (TinyFont[0] + 96)
1e9b : 4a __ __ LSR
1e9c : 4a __ __ LSR
1e9d : 38 __ __ SEC
1e9e : 65 57 __ ADC T5 + 0 
1ea0 : 85 57 __ STA T5 + 0 
1ea2 : 90 e4 __ BCC $1e88 ; (bm_put_chars.l10 + 0)
.s61:
1ea4 : e6 58 __ INC T5 + 1 
1ea6 : b0 e0 __ BCS $1e88 ; (bm_put_chars.l10 + 0)
.s19:
1ea8 : b0 03 __ BCS $1ead ; (bm_put_chars.s19 + 5)
1eaa : 4c f4 1d JMP $1df4 ; (bm_put_chars.s54 + 0)
1ead : 4c b9 1d JMP $1db9 ; (bm_put_chars.l15 + 0)
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1eb0 : a9 00 __ LDA #$00
1eb2 : 8d 25 28 STA $2825 ; (tworks[0] + 0)
1eb5 : 8d 26 28 STA $2826 ; (tworks[0] + 1)
1eb8 : 8d 27 28 STA $2827 ; (tworks[0] + 2)
1ebb : 8d 28 28 STA $2828 ; (tworks[0] + 3)
1ebe : 8d 29 28 STA $2829 ; (tworks[0] + 4)
1ec1 : 8d 2a 28 STA $282a ; (tworks[0] + 5)
1ec4 : 8d 2b 28 STA $282b ; (tworks[0] + 6)
1ec7 : 8d 2c 28 STA $282c ; (tworks[0] + 7)
1eca : 85 43 __ STA T0 + 0 
1ecc : 85 44 __ STA T0 + 1 
1ece : a8 __ __ TAY
1ecf : b1 0d __ LDA (P0),y ; (bm + 0)
1ed1 : 85 45 __ STA T1 + 0 
1ed3 : c8 __ __ INY
1ed4 : b1 0d __ LDA (P0),y ; (bm + 0)
1ed6 : 85 46 __ STA T1 + 1 
1ed8 : a5 12 __ LDA P5 ; (len + 0)
1eda : d0 03 __ BNE $1edf ; (bmu_text.s8 + 0)
1edc : 4c f5 1f JMP $1ff5 ; (bmu_text.s5 + 0)
.s8:
1edf : a9 00 __ LDA #$00
1ee1 : 85 4c __ STA T7 + 0 
1ee3 : 85 47 __ STA T2 + 0 
.l9:
1ee5 : a4 47 __ LDY T2 + 0 
1ee7 : b1 10 __ LDA (P3),y ; (str + 0)
1ee9 : 38 __ __ SEC
1eea : e9 20 __ SBC #$20
1eec : aa __ __ TAX
1eed : 18 __ __ CLC
1eee : a9 a1 __ LDA #$a1
1ef0 : 7d e1 25 ADC $25e1,x ; (TinyFont[0] + 0)
1ef3 : 85 4a __ STA T6 + 0 
1ef5 : bd 41 26 LDA $2641,x ; (TinyFont[0] + 96)
1ef8 : 29 03 __ AND #$03
1efa : 69 26 __ ADC #$26
1efc : 85 4b __ STA T6 + 1 
1efe : bd 41 26 LDA $2641,x ; (TinyFont[0] + 96)
1f01 : 4a __ __ LSR
1f02 : 4a __ __ LSR
1f03 : 85 48 __ STA T4 + 0 
1f05 : 38 __ __ SEC
1f06 : 65 43 __ ADC T0 + 0 
1f08 : 85 43 __ STA T0 + 0 
1f0a : 90 02 __ BCC $1f0e ; (bmu_text.s18 + 0)
.s17:
1f0c : e6 44 __ INC T0 + 1 
.s18:
1f0e : a9 00 __ LDA #$00
1f10 : 85 4d __ STA T8 + 0 
1f12 : a5 48 __ LDA T4 + 0 
1f14 : f0 75 __ BEQ $1f8b ; (bmu_text.s10 + 0)
.s16:
1f16 : a0 00 __ LDY #$00
.l13:
1f18 : b1 4a __ LDA (T6 + 0),y 
1f1a : 85 49 __ STA T5 + 0 
1f1c : a5 49 __ LDA T5 + 0 
1f1e : 0a __ __ ASL
1f1f : 2e 25 28 ROL $2825 ; (tworks[0] + 0)
1f22 : 0a __ __ ASL
1f23 : 2e 26 28 ROL $2826 ; (tworks[0] + 1)
1f26 : 0a __ __ ASL
1f27 : 2e 27 28 ROL $2827 ; (tworks[0] + 2)
1f2a : 0a __ __ ASL
1f2b : 2e 28 28 ROL $2828 ; (tworks[0] + 3)
1f2e : 0a __ __ ASL
1f2f : 2e 29 28 ROL $2829 ; (tworks[0] + 4)
1f32 : 0a __ __ ASL
1f33 : 2e 2a 28 ROL $282a ; (tworks[0] + 5)
1f36 : 0a __ __ ASL
1f37 : 2e 2b 28 ROL $282b ; (tworks[0] + 6)
1f3a : 0a __ __ ASL
1f3b : 2e 2c 28 ROL $282c ; (tworks[0] + 7)
1f3e : e6 0f __ INC P2 ; (lx + 0)
1f40 : a5 0f __ LDA P2 ; (lx + 0)
1f42 : c9 08 __ CMP #$08
1f44 : d0 3d __ BNE $1f83 ; (bmu_text.s14 + 0)
.s15:
1f46 : ad 25 28 LDA $2825 ; (tworks[0] + 0)
1f49 : a0 00 __ LDY #$00
1f4b : 84 0f __ STY P2 ; (lx + 0)
1f4d : 91 45 __ STA (T1 + 0),y 
1f4f : ad 26 28 LDA $2826 ; (tworks[0] + 1)
1f52 : c8 __ __ INY
1f53 : 91 45 __ STA (T1 + 0),y 
1f55 : ad 27 28 LDA $2827 ; (tworks[0] + 2)
1f58 : c8 __ __ INY
1f59 : 91 45 __ STA (T1 + 0),y 
1f5b : ad 28 28 LDA $2828 ; (tworks[0] + 3)
1f5e : c8 __ __ INY
1f5f : 91 45 __ STA (T1 + 0),y 
1f61 : ad 29 28 LDA $2829 ; (tworks[0] + 4)
1f64 : c8 __ __ INY
1f65 : 91 45 __ STA (T1 + 0),y 
1f67 : ad 2a 28 LDA $282a ; (tworks[0] + 5)
1f6a : c8 __ __ INY
1f6b : 91 45 __ STA (T1 + 0),y 
1f6d : ad 2b 28 LDA $282b ; (tworks[0] + 6)
1f70 : c8 __ __ INY
1f71 : 91 45 __ STA (T1 + 0),y 
1f73 : ad 2c 28 LDA $282c ; (tworks[0] + 7)
1f76 : c8 __ __ INY
1f77 : 91 45 __ STA (T1 + 0),y 
1f79 : a5 45 __ LDA T1 + 0 
1f7b : 69 07 __ ADC #$07
1f7d : 85 45 __ STA T1 + 0 
1f7f : 90 02 __ BCC $1f83 ; (bmu_text.s14 + 0)
.s19:
1f81 : e6 46 __ INC T1 + 1 
.s14:
1f83 : e6 4d __ INC T8 + 0 
1f85 : a4 4d __ LDY T8 + 0 
1f87 : c4 48 __ CPY T4 + 0 
1f89 : 90 8d __ BCC $1f18 ; (bmu_text.l13 + 0)
.s10:
1f8b : 0e 25 28 ASL $2825 ; (tworks[0] + 0)
1f8e : 0e 26 28 ASL $2826 ; (tworks[0] + 1)
1f91 : 0e 27 28 ASL $2827 ; (tworks[0] + 2)
1f94 : 0e 28 28 ASL $2828 ; (tworks[0] + 3)
1f97 : 0e 29 28 ASL $2829 ; (tworks[0] + 4)
1f9a : 0e 2a 28 ASL $282a ; (tworks[0] + 5)
1f9d : 0e 2b 28 ASL $282b ; (tworks[0] + 6)
1fa0 : 0e 2c 28 ASL $282c ; (tworks[0] + 7)
1fa3 : e6 0f __ INC P2 ; (lx + 0)
1fa5 : a5 0f __ LDA P2 ; (lx + 0)
1fa7 : c9 08 __ CMP #$08
1fa9 : d0 3d __ BNE $1fe8 ; (bmu_text.s11 + 0)
.s12:
1fab : ad 25 28 LDA $2825 ; (tworks[0] + 0)
1fae : a0 00 __ LDY #$00
1fb0 : 84 0f __ STY P2 ; (lx + 0)
1fb2 : 91 45 __ STA (T1 + 0),y 
1fb4 : ad 26 28 LDA $2826 ; (tworks[0] + 1)
1fb7 : c8 __ __ INY
1fb8 : 91 45 __ STA (T1 + 0),y 
1fba : ad 27 28 LDA $2827 ; (tworks[0] + 2)
1fbd : c8 __ __ INY
1fbe : 91 45 __ STA (T1 + 0),y 
1fc0 : ad 28 28 LDA $2828 ; (tworks[0] + 3)
1fc3 : c8 __ __ INY
1fc4 : 91 45 __ STA (T1 + 0),y 
1fc6 : ad 29 28 LDA $2829 ; (tworks[0] + 4)
1fc9 : c8 __ __ INY
1fca : 91 45 __ STA (T1 + 0),y 
1fcc : ad 2a 28 LDA $282a ; (tworks[0] + 5)
1fcf : c8 __ __ INY
1fd0 : 91 45 __ STA (T1 + 0),y 
1fd2 : ad 2b 28 LDA $282b ; (tworks[0] + 6)
1fd5 : c8 __ __ INY
1fd6 : 91 45 __ STA (T1 + 0),y 
1fd8 : ad 2c 28 LDA $282c ; (tworks[0] + 7)
1fdb : c8 __ __ INY
1fdc : 91 45 __ STA (T1 + 0),y 
1fde : a5 45 __ LDA T1 + 0 
1fe0 : 69 07 __ ADC #$07
1fe2 : 85 45 __ STA T1 + 0 
1fe4 : 90 02 __ BCC $1fe8 ; (bmu_text.s11 + 0)
.s20:
1fe6 : e6 46 __ INC T1 + 1 
.s11:
1fe8 : e6 47 __ INC T2 + 0 
1fea : e6 4c __ INC T7 + 0 
1fec : a5 4c __ LDA T7 + 0 
1fee : c5 12 __ CMP P5 ; (len + 0)
1ff0 : b0 03 __ BCS $1ff5 ; (bmu_text.s5 + 0)
1ff2 : 4c e5 1e JMP $1ee5 ; (bmu_text.l9 + 0)
.s5:
1ff5 : a5 0f __ LDA P2 ; (lx + 0)
1ff7 : 85 47 __ STA T2 + 0 
1ff9 : c9 08 __ CMP #$08
1ffb : b0 20 __ BCS $201d ; (bmu_text.s6 + 0)
.l7:
1ffd : 0e 25 28 ASL $2825 ; (tworks[0] + 0)
2000 : 0e 26 28 ASL $2826 ; (tworks[0] + 1)
2003 : 0e 27 28 ASL $2827 ; (tworks[0] + 2)
2006 : 0e 28 28 ASL $2828 ; (tworks[0] + 3)
2009 : 0e 29 28 ASL $2829 ; (tworks[0] + 4)
200c : 0e 2a 28 ASL $282a ; (tworks[0] + 5)
200f : 0e 2b 28 ASL $282b ; (tworks[0] + 6)
2012 : 0e 2c 28 ASL $282c ; (tworks[0] + 7)
2015 : e6 47 __ INC T2 + 0 
2017 : a5 47 __ LDA T2 + 0 
2019 : c9 08 __ CMP #$08
201b : 90 e0 __ BCC $1ffd ; (bmu_text.l7 + 0)
.s6:
201d : ad 25 28 LDA $2825 ; (tworks[0] + 0)
2020 : a0 00 __ LDY #$00
2022 : 91 45 __ STA (T1 + 0),y 
2024 : ad 26 28 LDA $2826 ; (tworks[0] + 1)
2027 : c8 __ __ INY
2028 : 91 45 __ STA (T1 + 0),y 
202a : ad 27 28 LDA $2827 ; (tworks[0] + 2)
202d : c8 __ __ INY
202e : 91 45 __ STA (T1 + 0),y 
2030 : ad 28 28 LDA $2828 ; (tworks[0] + 3)
2033 : c8 __ __ INY
2034 : 91 45 __ STA (T1 + 0),y 
2036 : ad 29 28 LDA $2829 ; (tworks[0] + 4)
2039 : c8 __ __ INY
203a : 91 45 __ STA (T1 + 0),y 
203c : ad 2a 28 LDA $282a ; (tworks[0] + 5)
203f : c8 __ __ INY
2040 : 91 45 __ STA (T1 + 0),y 
2042 : ad 2b 28 LDA $282b ; (tworks[0] + 6)
2045 : c8 __ __ INY
2046 : 91 45 __ STA (T1 + 0),y 
2048 : ad 2c 28 LDA $282c ; (tworks[0] + 7)
204b : c8 __ __ INY
204c : 91 45 __ STA (T1 + 0),y 
204e : a5 43 __ LDA T0 + 0 
2050 : 85 1b __ STA ACCU + 0 
2052 : a5 44 __ LDA T0 + 1 
2054 : 85 1c __ STA ACCU + 1 
.s3:
2056 : 60 __ __ RTS
--------------------------------------------------------------------
bm_bitblit: ; bm_bitblit(const struct Bitmap*,const struct ClipRect*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 135, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
2057 : ad e1 9f LDA $9fe1 ; (sstack + 18)
205a : 85 43 __ STA T0 + 0 
205c : ad e2 9f LDA $9fe2 ; (sstack + 19)
205f : 85 44 __ STA T0 + 1 
2061 : ad e3 9f LDA $9fe3 ; (sstack + 20)
2064 : 38 __ __ SEC
2065 : a0 00 __ LDY #$00
2067 : f1 43 __ SBC (T0 + 0),y 
2069 : 85 45 __ STA T1 + 0 
206b : ad e4 9f LDA $9fe4 ; (sstack + 21)
206e : c8 __ __ INY
206f : f1 43 __ SBC (T0 + 0),y 
2071 : 10 35 __ BPL $20a8 ; (bm_bitblit.s5 + 0)
.s16:
2073 : 85 46 __ STA T1 + 1 
2075 : ad e3 9f LDA $9fe3 ; (sstack + 20)
2078 : 38 __ __ SEC
2079 : e5 45 __ SBC T1 + 0 
207b : 8d e3 9f STA $9fe3 ; (sstack + 20)
207e : ad e4 9f LDA $9fe4 ; (sstack + 21)
2081 : e5 46 __ SBC T1 + 1 
2083 : 8d e4 9f STA $9fe4 ; (sstack + 21)
2086 : ad e9 9f LDA $9fe9 ; (sstack + 26)
2089 : 38 __ __ SEC
208a : e5 45 __ SBC T1 + 0 
208c : 8d e9 9f STA $9fe9 ; (sstack + 26)
208f : ad ea 9f LDA $9fea ; (sstack + 27)
2092 : e5 46 __ SBC T1 + 1 
2094 : 8d ea 9f STA $9fea ; (sstack + 27)
2097 : ad ed 9f LDA $9fed ; (sstack + 30)
209a : 18 __ __ CLC
209b : 65 45 __ ADC T1 + 0 
209d : 8d ed 9f STA $9fed ; (sstack + 30)
20a0 : ad ee 9f LDA $9fee ; (sstack + 31)
20a3 : 65 46 __ ADC T1 + 1 
20a5 : 8d ee 9f STA $9fee ; (sstack + 31)
.s5:
20a8 : ad e5 9f LDA $9fe5 ; (sstack + 22)
20ab : 38 __ __ SEC
20ac : a0 02 __ LDY #$02
20ae : f1 43 __ SBC (T0 + 0),y 
20b0 : 85 47 __ STA T2 + 0 
20b2 : ad e6 9f LDA $9fe6 ; (sstack + 23)
20b5 : c8 __ __ INY
20b6 : f1 43 __ SBC (T0 + 0),y 
20b8 : 10 35 __ BPL $20ef ; (bm_bitblit.s6 + 0)
.s15:
20ba : 85 48 __ STA T2 + 1 
20bc : ad e5 9f LDA $9fe5 ; (sstack + 22)
20bf : 38 __ __ SEC
20c0 : e5 47 __ SBC T2 + 0 
20c2 : 8d e5 9f STA $9fe5 ; (sstack + 22)
20c5 : ad e6 9f LDA $9fe6 ; (sstack + 23)
20c8 : e5 48 __ SBC T2 + 1 
20ca : 8d e6 9f STA $9fe6 ; (sstack + 23)
20cd : ad eb 9f LDA $9feb ; (sstack + 28)
20d0 : 38 __ __ SEC
20d1 : e5 47 __ SBC T2 + 0 
20d3 : 8d eb 9f STA $9feb ; (sstack + 28)
20d6 : ad ec 9f LDA $9fec ; (sstack + 29)
20d9 : e5 48 __ SBC T2 + 1 
20db : 8d ec 9f STA $9fec ; (sstack + 29)
20de : ad ef 9f LDA $9fef ; (sstack + 32)
20e1 : 18 __ __ CLC
20e2 : 65 47 __ ADC T2 + 0 
20e4 : 8d ef 9f STA $9fef ; (sstack + 32)
20e7 : ad f0 9f LDA $9ff0 ; (sstack + 33)
20ea : 65 48 __ ADC T2 + 1 
20ec : 8d f0 9f STA $9ff0 ; (sstack + 33)
.s6:
20ef : a0 04 __ LDY #$04
20f1 : b1 43 __ LDA (T0 + 0),y 
20f3 : 38 __ __ SEC
20f4 : ed e3 9f SBC $9fe3 ; (sstack + 20)
20f7 : aa __ __ TAX
20f8 : c8 __ __ INY
20f9 : b1 43 __ LDA (T0 + 0),y 
20fb : ed e4 9f SBC $9fe4 ; (sstack + 21)
20fe : a8 __ __ TAY
20ff : 8a __ __ TXA
2100 : 38 __ __ SEC
2101 : ed ed 9f SBC $9fed ; (sstack + 30)
2104 : 85 45 __ STA T1 + 0 
2106 : 98 __ __ TYA
2107 : ed ee 9f SBC $9fee ; (sstack + 31)
210a : 10 11 __ BPL $211d ; (bm_bitblit.s7 + 0)
.s14:
210c : aa __ __ TAX
210d : ad ed 9f LDA $9fed ; (sstack + 30)
2110 : 18 __ __ CLC
2111 : 65 45 __ ADC T1 + 0 
2113 : 8d ed 9f STA $9fed ; (sstack + 30)
2116 : 8a __ __ TXA
2117 : 6d ee 9f ADC $9fee ; (sstack + 31)
211a : 8d ee 9f STA $9fee ; (sstack + 31)
.s7:
211d : a0 07 __ LDY #$07
211f : b1 43 __ LDA (T0 + 0),y 
2121 : 85 1c __ STA ACCU + 1 
2123 : 38 __ __ SEC
2124 : 88 __ __ DEY
2125 : b1 43 __ LDA (T0 + 0),y 
2127 : 85 1b __ STA ACCU + 0 
2129 : ed e5 9f SBC $9fe5 ; (sstack + 22)
212c : a8 __ __ TAY
212d : a5 1c __ LDA ACCU + 1 
212f : ed e6 9f SBC $9fe6 ; (sstack + 23)
2132 : aa __ __ TAX
2133 : 98 __ __ TYA
2134 : 38 __ __ SEC
2135 : ed ef 9f SBC $9fef ; (sstack + 32)
2138 : 85 43 __ STA T0 + 0 
213a : 8a __ __ TXA
213b : ed f0 9f SBC $9ff0 ; (sstack + 33)
213e : 10 11 __ BPL $2151 ; (bm_bitblit.s8 + 0)
.s13:
2140 : aa __ __ TAX
2141 : ad ef 9f LDA $9fef ; (sstack + 32)
2144 : 18 __ __ CLC
2145 : 65 43 __ ADC T0 + 0 
2147 : 8d ef 9f STA $9fef ; (sstack + 32)
214a : 8a __ __ TXA
214b : 6d f0 9f ADC $9ff0 ; (sstack + 33)
214e : 8d f0 9f STA $9ff0 ; (sstack + 33)
.s8:
2151 : ad ee 9f LDA $9fee ; (sstack + 31)
2154 : 30 0f __ BMI $2165 ; (bm_bitblit.s3 + 0)
.s12:
2156 : 0d ed 9f ORA $9fed ; (sstack + 30)
2159 : f0 0a __ BEQ $2165 ; (bm_bitblit.s3 + 0)
.s9:
215b : ad f0 9f LDA $9ff0 ; (sstack + 33)
215e : 30 05 __ BMI $2165 ; (bm_bitblit.s3 + 0)
.s11:
2160 : 0d ef 9f ORA $9fef ; (sstack + 32)
2163 : d0 01 __ BNE $2166 ; (bm_bitblit.s10 + 0)
.s3:
2165 : 60 __ __ RTS
.s10:
2166 : ad df 9f LDA $9fdf ; (sstack + 16)
2169 : 85 16 __ STA P9 
216b : ad e0 9f LDA $9fe0 ; (sstack + 17)
216e : 85 17 __ STA P10 
2170 : ad f3 9f LDA $9ff3 ; (sstack + 36)
2173 : 85 18 __ STA P11 
2175 : ad e3 9f LDA $9fe3 ; (sstack + 20)
2178 : 8d cf 9f STA $9fcf ; (sstack + 0)
217b : ad e4 9f LDA $9fe4 ; (sstack + 21)
217e : 8d d0 9f STA $9fd0 ; (sstack + 1)
2181 : ad e5 9f LDA $9fe5 ; (sstack + 22)
2184 : 8d d1 9f STA $9fd1 ; (sstack + 2)
2187 : ad e6 9f LDA $9fe6 ; (sstack + 23)
218a : 8d d2 9f STA $9fd2 ; (sstack + 3)
218d : ad e7 9f LDA $9fe7 ; (sstack + 24)
2190 : 8d d3 9f STA $9fd3 ; (sstack + 4)
2193 : ad e8 9f LDA $9fe8 ; (sstack + 25)
2196 : 8d d4 9f STA $9fd4 ; (sstack + 5)
2199 : ad e9 9f LDA $9fe9 ; (sstack + 26)
219c : 8d d5 9f STA $9fd5 ; (sstack + 6)
219f : ad ea 9f LDA $9fea ; (sstack + 27)
21a2 : 8d d6 9f STA $9fd6 ; (sstack + 7)
21a5 : ad eb 9f LDA $9feb ; (sstack + 28)
21a8 : 8d d7 9f STA $9fd7 ; (sstack + 8)
21ab : ad ec 9f LDA $9fec ; (sstack + 29)
21ae : 8d d8 9f STA $9fd8 ; (sstack + 9)
21b1 : ad ed 9f LDA $9fed ; (sstack + 30)
21b4 : 8d d9 9f STA $9fd9 ; (sstack + 10)
21b7 : ad ee 9f LDA $9fee ; (sstack + 31)
21ba : 8d da 9f STA $9fda ; (sstack + 11)
21bd : ad ef 9f LDA $9fef ; (sstack + 32)
21c0 : 8d db 9f STA $9fdb ; (sstack + 12)
21c3 : ad f0 9f LDA $9ff0 ; (sstack + 33)
21c6 : 8d dc 9f STA $9fdc ; (sstack + 13)
21c9 : ad f1 9f LDA $9ff1 ; (sstack + 34)
21cc : 8d dd 9f STA $9fdd ; (sstack + 14)
21cf : ad f2 9f LDA $9ff2 ; (sstack + 35)
21d2 : 8d de 9f STA $9fde ; (sstack + 15)
21d5 : 4c 0a 13 JMP $130a ; (bmu_bitblit.s1 + 0)
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
21d8 : a9 00 __ LDA #$00
21da : 85 1b __ STA ACCU + 0 
21dc : 85 1c __ STA ACCU + 1 
21de : a8 __ __ TAY
21df : b1 0d __ LDA (P0),y ; (str + 0)
21e1 : f0 10 __ BEQ $21f3 ; (strlen.s3 + 0)
.s6:
21e3 : a2 00 __ LDX #$00
.l7:
21e5 : c8 __ __ INY
21e6 : d0 03 __ BNE $21eb ; (strlen.s9 + 0)
.s8:
21e8 : e6 0e __ INC P1 ; (str + 1)
21ea : e8 __ __ INX
.s9:
21eb : b1 0d __ LDA (P0),y ; (str + 0)
21ed : d0 f6 __ BNE $21e5 ; (strlen.l7 + 0)
.s5:
21ef : 86 1c __ STX ACCU + 1 
21f1 : 84 1b __ STY ACCU + 0 
.s3:
21f3 : 60 __ __ RTS
--------------------------------------------------------------------
done: ; done()->void
;  30, "/home/honza/projects/c64/projects/oscar64/samples/hires/bitblit.c"
.s4:
21f4 : a9 37 __ LDA #$37
21f6 : 85 01 __ STA $01 
21f8 : 20 0e 22 JSR $220e ; (getch.l4 + 0)
21fb : a9 00 __ LDA #$00
21fd : 85 0d __ STA P0 
21ff : 85 0e __ STA P1 
2201 : 85 10 __ STA P3 
2203 : a9 04 __ LDA #$04
2205 : 85 0f __ STA P2 
2207 : a9 10 __ LDA #$10
2209 : 85 11 __ STA P4 
220b : 4c 06 0b JMP $0b06 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
220e : 20 e4 ff JSR $ffe4 
2211 : 85 1b __ STA ACCU + 0 
2213 : a5 1b __ LDA ACCU + 0 
2215 : f0 f7 __ BEQ $220e ; (getch.l4 + 0)
.s5:
2217 : 4c 1a 22 JMP $221a ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
221a : a8 __ __ TAY
221b : ad 14 28 LDA $2814 ; (giocharmap + 0)
221e : f0 27 __ BEQ $2247 ; (convch.s5 + 0)
.s6:
2220 : c0 0d __ CPY #$0d
2222 : d0 03 __ BNE $2227 ; (convch.s7 + 0)
.s16:
2224 : a9 0a __ LDA #$0a
.s3:
2226 : 60 __ __ RTS
.s7:
2227 : c9 02 __ CMP #$02
2229 : 90 1c __ BCC $2247 ; (convch.s5 + 0)
.s8:
222b : 98 __ __ TYA
222c : c0 41 __ CPY #$41
222e : 90 17 __ BCC $2247 ; (convch.s5 + 0)
.s9:
2230 : c9 db __ CMP #$db
2232 : b0 13 __ BCS $2247 ; (convch.s5 + 0)
.s10:
2234 : c9 c1 __ CMP #$c1
2236 : 90 03 __ BCC $223b ; (convch.s11 + 0)
.s15:
2238 : 49 a0 __ EOR #$a0
223a : a8 __ __ TAY
.s11:
223b : c9 7b __ CMP #$7b
223d : b0 08 __ BCS $2247 ; (convch.s5 + 0)
.s12:
223f : c9 61 __ CMP #$61
2241 : b0 06 __ BCS $2249 ; (convch.s14 + 0)
.s13:
2243 : c9 5b __ CMP #$5b
2245 : 90 02 __ BCC $2249 ; (convch.s14 + 0)
.s5:
2247 : 98 __ __ TYA
2248 : 60 __ __ RTS
.s14:
2249 : 49 20 __ EOR #$20
224b : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
224c : 4a __ __ LSR
224d : f0 2e __ BEQ $227d ; (mul16by8 + 49)
224f : a2 00 __ LDX #$00
2251 : a0 00 __ LDY #$00
2253 : 90 13 __ BCC $2268 ; (mul16by8 + 28)
2255 : a4 1b __ LDY ACCU + 0 
2257 : a6 1c __ LDX ACCU + 1 
2259 : b0 0d __ BCS $2268 ; (mul16by8 + 28)
225b : 85 02 __ STA $02 
225d : 18 __ __ CLC
225e : 98 __ __ TYA
225f : 65 1b __ ADC ACCU + 0 
2261 : a8 __ __ TAY
2262 : 8a __ __ TXA
2263 : 65 1c __ ADC ACCU + 1 
2265 : aa __ __ TAX
2266 : a5 02 __ LDA $02 
2268 : 06 1b __ ASL ACCU + 0 
226a : 26 1c __ ROL ACCU + 1 
226c : 4a __ __ LSR
226d : 90 f9 __ BCC $2268 ; (mul16by8 + 28)
226f : d0 ea __ BNE $225b ; (mul16by8 + 15)
2271 : 18 __ __ CLC
2272 : 98 __ __ TYA
2273 : 65 1b __ ADC ACCU + 0 
2275 : 85 1b __ STA ACCU + 0 
2277 : 8a __ __ TXA
2278 : 65 1c __ ADC ACCU + 1 
227a : 85 1c __ STA ACCU + 1 
227c : 60 __ __ RTS
227d : b0 04 __ BCS $2283 ; (mul16by8 + 55)
227f : 85 1b __ STA ACCU + 0 
2281 : 85 1c __ STA ACCU + 1 
2283 : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
2284 : a0 00 __ LDY #$00
2286 : 84 07 __ STY WORK + 4 
2288 : 84 08 __ STY WORK + 5 
228a : 84 09 __ STY WORK + 6 
228c : 4a __ __ LSR
228d : b0 0d __ BCS $229c ; (mul32by8 + 24)
228f : f0 26 __ BEQ $22b7 ; (mul32by8 + 51)
2291 : 06 1b __ ASL ACCU + 0 
2293 : 26 1c __ ROL ACCU + 1 
2295 : 26 1d __ ROL ACCU + 2 
2297 : 26 1e __ ROL ACCU + 3 
2299 : 4a __ __ LSR
229a : 90 f5 __ BCC $2291 ; (mul32by8 + 13)
229c : aa __ __ TAX
229d : 18 __ __ CLC
229e : a5 07 __ LDA WORK + 4 
22a0 : 65 1b __ ADC ACCU + 0 
22a2 : 85 07 __ STA WORK + 4 
22a4 : a5 08 __ LDA WORK + 5 
22a6 : 65 1c __ ADC ACCU + 1 
22a8 : 85 08 __ STA WORK + 5 
22aa : a5 09 __ LDA WORK + 6 
22ac : 65 1d __ ADC ACCU + 2 
22ae : 85 09 __ STA WORK + 6 
22b0 : 98 __ __ TYA
22b1 : 65 1e __ ADC ACCU + 3 
22b3 : a8 __ __ TAY
22b4 : 8a __ __ TXA
22b5 : d0 da __ BNE $2291 ; (mul32by8 + 13)
22b7 : 84 0a __ STY WORK + 7 
22b9 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
22ba : a5 04 __ LDA WORK + 1 
22bc : 05 05 __ ORA WORK + 2 
22be : 05 06 __ ORA WORK + 3 
22c0 : d0 05 __ BNE $22c7 ; (mul32 + 13)
22c2 : a5 03 __ LDA WORK + 0 
22c4 : 4c 84 22 JMP $2284 ; (mul32by8 + 0)
22c7 : a0 00 __ LDY #$00
22c9 : 84 07 __ STY WORK + 4 
22cb : 84 08 __ STY WORK + 5 
22cd : 98 __ __ TYA
22ce : 38 __ __ SEC
22cf : 66 03 __ ROR WORK + 0 
22d1 : 90 15 __ BCC $22e8 ; (mul32 + 46)
22d3 : aa __ __ TAX
22d4 : 18 __ __ CLC
22d5 : a5 07 __ LDA WORK + 4 
22d7 : 65 1b __ ADC ACCU + 0 
22d9 : 85 07 __ STA WORK + 4 
22db : a5 08 __ LDA WORK + 5 
22dd : 65 1c __ ADC ACCU + 1 
22df : 85 08 __ STA WORK + 5 
22e1 : 98 __ __ TYA
22e2 : 65 1d __ ADC ACCU + 2 
22e4 : a8 __ __ TAY
22e5 : 8a __ __ TXA
22e6 : 65 1e __ ADC ACCU + 3 
22e8 : 46 04 __ LSR WORK + 1 
22ea : 90 0f __ BCC $22fb ; (mul32 + 65)
22ec : aa __ __ TAX
22ed : 18 __ __ CLC
22ee : a5 08 __ LDA WORK + 5 
22f0 : 65 1b __ ADC ACCU + 0 
22f2 : 85 08 __ STA WORK + 5 
22f4 : 98 __ __ TYA
22f5 : 65 1c __ ADC ACCU + 1 
22f7 : a8 __ __ TAY
22f8 : 8a __ __ TXA
22f9 : 65 1d __ ADC ACCU + 2 
22fb : 46 05 __ LSR WORK + 2 
22fd : 90 09 __ BCC $2308 ; (mul32 + 78)
22ff : aa __ __ TAX
2300 : 18 __ __ CLC
2301 : 98 __ __ TYA
2302 : 65 1b __ ADC ACCU + 0 
2304 : a8 __ __ TAY
2305 : 8a __ __ TXA
2306 : 65 1c __ ADC ACCU + 1 
2308 : 46 06 __ LSR WORK + 3 
230a : 90 03 __ BCC $230f ; (mul32 + 85)
230c : 18 __ __ CLC
230d : 65 1b __ ADC ACCU + 0 
230f : 06 1b __ ASL ACCU + 0 
2311 : 26 1c __ ROL ACCU + 1 
2313 : 26 1d __ ROL ACCU + 2 
2315 : 26 1e __ ROL ACCU + 3 
2317 : 46 03 __ LSR WORK + 0 
2319 : 90 cd __ BCC $22e8 ; (mul32 + 46)
231b : d0 b6 __ BNE $22d3 ; (mul32 + 25)
231d : 84 09 __ STY WORK + 6 
231f : 85 0a __ STA WORK + 7 
2321 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
2322 : 24 1e __ BIT ACCU + 3 
2324 : 10 0d __ BPL $2333 ; (divs32 + 17)
2326 : 20 40 23 JSR $2340 ; (negaccu32 + 0)
2329 : 24 06 __ BIT WORK + 3 
232b : 10 0d __ BPL $233a ; (divs32 + 24)
232d : 20 5a 23 JSR $235a ; (negtmp32 + 0)
2330 : 4c 74 23 JMP $2374 ; (divmod32 + 0)
2333 : 24 06 __ BIT WORK + 3 
2335 : 10 f9 __ BPL $2330 ; (divs32 + 14)
2337 : 20 5a 23 JSR $235a ; (negtmp32 + 0)
233a : 20 74 23 JSR $2374 ; (divmod32 + 0)
233d : 4c 40 23 JMP $2340 ; (negaccu32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
2340 : 38 __ __ SEC
2341 : a9 00 __ LDA #$00
2343 : e5 1b __ SBC ACCU + 0 
2345 : 85 1b __ STA ACCU + 0 
2347 : a9 00 __ LDA #$00
2349 : e5 1c __ SBC ACCU + 1 
234b : 85 1c __ STA ACCU + 1 
234d : a9 00 __ LDA #$00
234f : e5 1d __ SBC ACCU + 2 
2351 : 85 1d __ STA ACCU + 2 
2353 : a9 00 __ LDA #$00
2355 : e5 1e __ SBC ACCU + 3 
2357 : 85 1e __ STA ACCU + 3 
2359 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
235a : 38 __ __ SEC
235b : a9 00 __ LDA #$00
235d : e5 03 __ SBC WORK + 0 
235f : 85 03 __ STA WORK + 0 
2361 : a9 00 __ LDA #$00
2363 : e5 04 __ SBC WORK + 1 
2365 : 85 04 __ STA WORK + 1 
2367 : a9 00 __ LDA #$00
2369 : e5 05 __ SBC WORK + 2 
236b : 85 05 __ STA WORK + 2 
236d : a9 00 __ LDA #$00
236f : e5 06 __ SBC WORK + 3 
2371 : 85 06 __ STA WORK + 3 
2373 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2374 : 84 02 __ STY $02 
2376 : a0 20 __ LDY #$20
2378 : a9 00 __ LDA #$00
237a : 85 07 __ STA WORK + 4 
237c : 85 08 __ STA WORK + 5 
237e : 85 09 __ STA WORK + 6 
2380 : 85 0a __ STA WORK + 7 
2382 : a5 05 __ LDA WORK + 2 
2384 : 05 06 __ ORA WORK + 3 
2386 : d0 78 __ BNE $2400 ; (divmod32 + 140)
2388 : a5 04 __ LDA WORK + 1 
238a : d0 27 __ BNE $23b3 ; (divmod32 + 63)
238c : 18 __ __ CLC
238d : 26 1b __ ROL ACCU + 0 
238f : 26 1c __ ROL ACCU + 1 
2391 : 26 1d __ ROL ACCU + 2 
2393 : 26 1e __ ROL ACCU + 3 
2395 : 2a __ __ ROL
2396 : 90 05 __ BCC $239d ; (divmod32 + 41)
2398 : e5 03 __ SBC WORK + 0 
239a : 38 __ __ SEC
239b : b0 06 __ BCS $23a3 ; (divmod32 + 47)
239d : c5 03 __ CMP WORK + 0 
239f : 90 02 __ BCC $23a3 ; (divmod32 + 47)
23a1 : e5 03 __ SBC WORK + 0 
23a3 : 88 __ __ DEY
23a4 : d0 e7 __ BNE $238d ; (divmod32 + 25)
23a6 : 85 07 __ STA WORK + 4 
23a8 : 26 1b __ ROL ACCU + 0 
23aa : 26 1c __ ROL ACCU + 1 
23ac : 26 1d __ ROL ACCU + 2 
23ae : 26 1e __ ROL ACCU + 3 
23b0 : a4 02 __ LDY $02 
23b2 : 60 __ __ RTS
23b3 : a5 1e __ LDA ACCU + 3 
23b5 : d0 10 __ BNE $23c7 ; (divmod32 + 83)
23b7 : a6 1d __ LDX ACCU + 2 
23b9 : 86 1e __ STX ACCU + 3 
23bb : a6 1c __ LDX ACCU + 1 
23bd : 86 1d __ STX ACCU + 2 
23bf : a6 1b __ LDX ACCU + 0 
23c1 : 86 1c __ STX ACCU + 1 
23c3 : 85 1b __ STA ACCU + 0 
23c5 : a0 18 __ LDY #$18
23c7 : 18 __ __ CLC
23c8 : 26 1b __ ROL ACCU + 0 
23ca : 26 1c __ ROL ACCU + 1 
23cc : 26 1d __ ROL ACCU + 2 
23ce : 26 1e __ ROL ACCU + 3 
23d0 : 26 07 __ ROL WORK + 4 
23d2 : 26 08 __ ROL WORK + 5 
23d4 : 90 0c __ BCC $23e2 ; (divmod32 + 110)
23d6 : a5 07 __ LDA WORK + 4 
23d8 : e5 03 __ SBC WORK + 0 
23da : aa __ __ TAX
23db : a5 08 __ LDA WORK + 5 
23dd : e5 04 __ SBC WORK + 1 
23df : 38 __ __ SEC
23e0 : b0 0c __ BCS $23ee ; (divmod32 + 122)
23e2 : 38 __ __ SEC
23e3 : a5 07 __ LDA WORK + 4 
23e5 : e5 03 __ SBC WORK + 0 
23e7 : aa __ __ TAX
23e8 : a5 08 __ LDA WORK + 5 
23ea : e5 04 __ SBC WORK + 1 
23ec : 90 04 __ BCC $23f2 ; (divmod32 + 126)
23ee : 86 07 __ STX WORK + 4 
23f0 : 85 08 __ STA WORK + 5 
23f2 : 88 __ __ DEY
23f3 : d0 d3 __ BNE $23c8 ; (divmod32 + 84)
23f5 : 26 1b __ ROL ACCU + 0 
23f7 : 26 1c __ ROL ACCU + 1 
23f9 : 26 1d __ ROL ACCU + 2 
23fb : 26 1e __ ROL ACCU + 3 
23fd : a4 02 __ LDY $02 
23ff : 60 __ __ RTS
2400 : a0 10 __ LDY #$10
2402 : a5 1e __ LDA ACCU + 3 
2404 : 85 08 __ STA WORK + 5 
2406 : a5 1d __ LDA ACCU + 2 
2408 : 85 07 __ STA WORK + 4 
240a : a9 00 __ LDA #$00
240c : 85 1d __ STA ACCU + 2 
240e : 85 1e __ STA ACCU + 3 
2410 : 18 __ __ CLC
2411 : 26 1b __ ROL ACCU + 0 
2413 : 26 1c __ ROL ACCU + 1 
2415 : 26 07 __ ROL WORK + 4 
2417 : 26 08 __ ROL WORK + 5 
2419 : 26 09 __ ROL WORK + 6 
241b : 26 0a __ ROL WORK + 7 
241d : a5 07 __ LDA WORK + 4 
241f : c5 03 __ CMP WORK + 0 
2421 : a5 08 __ LDA WORK + 5 
2423 : e5 04 __ SBC WORK + 1 
2425 : a5 09 __ LDA WORK + 6 
2427 : e5 05 __ SBC WORK + 2 
2429 : aa __ __ TAX
242a : a5 0a __ LDA WORK + 7 
242c : e5 06 __ SBC WORK + 3 
242e : 90 11 __ BCC $2441 ; (divmod32 + 205)
2430 : 86 09 __ STX WORK + 6 
2432 : 85 0a __ STA WORK + 7 
2434 : a5 07 __ LDA WORK + 4 
2436 : e5 03 __ SBC WORK + 0 
2438 : 85 07 __ STA WORK + 4 
243a : a5 08 __ LDA WORK + 5 
243c : e5 04 __ SBC WORK + 1 
243e : 85 08 __ STA WORK + 5 
2440 : 38 __ __ SEC
2441 : 88 __ __ DEY
2442 : d0 cd __ BNE $2411 ; (divmod32 + 157)
2444 : 26 1b __ ROL ACCU + 0 
2446 : 26 1c __ ROL ACCU + 1 
2448 : a4 02 __ LDY $02 
244a : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
244b : 18 __ __ CLC
244c : a5 1b __ LDA ACCU + 0 
244e : 69 05 __ ADC #$05
2450 : 29 fc __ AND #$fc
2452 : 85 03 __ STA WORK + 0 
2454 : a5 1c __ LDA ACCU + 1 
2456 : 69 00 __ ADC #$00
2458 : 85 04 __ STA WORK + 1 
245a : ad 2f 28 LDA $282f ; (HeapNode.end + 0)
245d : d0 26 __ BNE $2485 ; (crt_malloc + 58)
245f : a9 00 __ LDA #$00
2461 : 8d 22 2b STA $2b22 
2464 : 8d 23 2b STA $2b23 
2467 : ee 2f 28 INC $282f ; (HeapNode.end + 0)
246a : a9 20 __ LDA #$20
246c : 09 02 __ ORA #$02
246e : 8d 2d 28 STA $282d ; (HeapNode.next + 0)
2471 : a9 2b __ LDA #$2b
2473 : 8d 2e 28 STA $282e ; (HeapNode.next + 1)
2476 : 38 __ __ SEC
2477 : a9 00 __ LDA #$00
2479 : e9 02 __ SBC #$02
247b : 8d 24 2b STA $2b24 
247e : a9 90 __ LDA #$90
2480 : e9 00 __ SBC #$00
2482 : 8d 25 2b STA $2b25 
2485 : a9 2d __ LDA #$2d
2487 : a2 28 __ LDX #$28
2489 : 85 1d __ STA ACCU + 2 
248b : 86 1e __ STX ACCU + 3 
248d : 18 __ __ CLC
248e : a0 00 __ LDY #$00
2490 : b1 1d __ LDA (ACCU + 2),y 
2492 : 85 1b __ STA ACCU + 0 
2494 : 65 03 __ ADC WORK + 0 
2496 : 85 05 __ STA WORK + 2 
2498 : c8 __ __ INY
2499 : b1 1d __ LDA (ACCU + 2),y 
249b : 85 1c __ STA ACCU + 1 
249d : f0 20 __ BEQ $24bf ; (crt_malloc + 116)
249f : 65 04 __ ADC WORK + 1 
24a1 : 85 06 __ STA WORK + 3 
24a3 : b0 14 __ BCS $24b9 ; (crt_malloc + 110)
24a5 : a0 02 __ LDY #$02
24a7 : b1 1b __ LDA (ACCU + 0),y 
24a9 : c5 05 __ CMP WORK + 2 
24ab : c8 __ __ INY
24ac : b1 1b __ LDA (ACCU + 0),y 
24ae : e5 06 __ SBC WORK + 3 
24b0 : b0 0e __ BCS $24c0 ; (crt_malloc + 117)
24b2 : a5 1b __ LDA ACCU + 0 
24b4 : a6 1c __ LDX ACCU + 1 
24b6 : 4c 89 24 JMP $2489 ; (crt_malloc + 62)
24b9 : a9 00 __ LDA #$00
24bb : 85 1b __ STA ACCU + 0 
24bd : 85 1c __ STA ACCU + 1 
24bf : 60 __ __ RTS
24c0 : a5 05 __ LDA WORK + 2 
24c2 : 85 07 __ STA WORK + 4 
24c4 : a5 06 __ LDA WORK + 3 
24c6 : 85 08 __ STA WORK + 5 
24c8 : a0 02 __ LDY #$02
24ca : a5 07 __ LDA WORK + 4 
24cc : d1 1b __ CMP (ACCU + 0),y 
24ce : d0 15 __ BNE $24e5 ; (crt_malloc + 154)
24d0 : c8 __ __ INY
24d1 : a5 08 __ LDA WORK + 5 
24d3 : d1 1b __ CMP (ACCU + 0),y 
24d5 : d0 0e __ BNE $24e5 ; (crt_malloc + 154)
24d7 : a0 00 __ LDY #$00
24d9 : b1 1b __ LDA (ACCU + 0),y 
24db : 91 1d __ STA (ACCU + 2),y 
24dd : c8 __ __ INY
24de : b1 1b __ LDA (ACCU + 0),y 
24e0 : 91 1d __ STA (ACCU + 2),y 
24e2 : 4c 02 25 JMP $2502 ; (crt_malloc + 183)
24e5 : a0 00 __ LDY #$00
24e7 : b1 1b __ LDA (ACCU + 0),y 
24e9 : 91 07 __ STA (WORK + 4),y 
24eb : a5 07 __ LDA WORK + 4 
24ed : 91 1d __ STA (ACCU + 2),y 
24ef : c8 __ __ INY
24f0 : b1 1b __ LDA (ACCU + 0),y 
24f2 : 91 07 __ STA (WORK + 4),y 
24f4 : a5 08 __ LDA WORK + 5 
24f6 : 91 1d __ STA (ACCU + 2),y 
24f8 : c8 __ __ INY
24f9 : b1 1b __ LDA (ACCU + 0),y 
24fb : 91 07 __ STA (WORK + 4),y 
24fd : c8 __ __ INY
24fe : b1 1b __ LDA (ACCU + 0),y 
2500 : 91 07 __ STA (WORK + 4),y 
2502 : a0 00 __ LDY #$00
2504 : a5 05 __ LDA WORK + 2 
2506 : 91 1b __ STA (ACCU + 0),y 
2508 : c8 __ __ INY
2509 : a5 06 __ LDA WORK + 3 
250b : 91 1b __ STA (ACCU + 0),y 
250d : 18 __ __ CLC
250e : a5 1b __ LDA ACCU + 0 
2510 : 69 02 __ ADC #$02
2512 : 85 1b __ STA ACCU + 0 
2514 : 90 02 __ BCC $2518 ; (crt_malloc + 205)
2516 : e6 1c __ INC ACCU + 1 
2518 : 60 __ __ RTS
--------------------------------------------------------------------
__multab80L:
2519 : __ __ __ BYT 00 50 a0 f0                                     : .P..
--------------------------------------------------------------------
__multab66L:
251d : __ __ __ BYT 00 42 84                                        : .B.
--------------------------------------------------------------------
__multab3L:
2520 : __ __ __ BYT 00 03 06 09 0c 0f 12 15 18 1b 1e                : ...........
--------------------------------------------------------------------
spentry:
252b : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
lmask:
252c : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
2534 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
poly_x:
253c : __ __ __ BYT 00 00 20 00 20 00 18 00 28 00 20 00 20 00 40 00 : .. . ...(. . .@.
254c : __ __ __ BYT 34 00 2a 00 16 00 0c 00                         : 4.*.....
--------------------------------------------------------------------
poly_y:
2554 : __ __ __ BYT 40 00 00 00 14 00 24 00 24 00 14 00 00 00 40 00 : @.....$.$.....@.
2564 : __ __ __ BYT 40 00 2c 00 2c 00 40 00                         : @.,.,.@.
--------------------------------------------------------------------
NineShadesOfGrey:
256c : __ __ __ BYT 00 00 00 00 00 00 00 00 22 00 88 00 22 00 88 00 : ........"..."...
257c : __ __ __ BYT 22 88 22 88 22 88 22 88 88 55 22 55 88 55 22 55 : "."."."..U"U.U"U
258c : __ __ __ BYT aa 55 aa 55 aa 55 aa 55 bb 55 ee 55 bb 55 ee 55 : .U.U.U.U.U.U.U.U
259c : __ __ __ BYT dd 77 dd 77 dd 77 dd 77 ff ee ff bb ff ee ff bb : .w.w.w.w........
25ac : __ __ __ BYT ff ff ff ff ff ff ff ff                         : ........
--------------------------------------------------------------------
blitops_op:
25b4 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
pat:
25b8 : __ __ __ BYT 6c fe fe fe 7c 38 10 00                         : l...|8..
--------------------------------------------------------------------
blitDemos:
25c0 : __ __ __ BYT f7 1b 44 fb 1b 04 01 1c 57 05 1c 1b 09 1c 1a 0c : ..D.....W.......
25d0 : __ __ __ BYT 1c 19 10 1c 59 15 1c 08 1a 1c 48 20 1c 20 28 1c : ....Y.....H . (.
25e0 : __ __ __ BYT 29                                              : )
--------------------------------------------------------------------
TinyFont:
25e1 : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
25f1 : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
2601 : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
2611 : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
2621 : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
2631 : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
2641 : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
2651 : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
2661 : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
2671 : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
2681 : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
2691 : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
26a1 : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
26b1 : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
26c1 : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
26d1 : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
26e1 : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
26f1 : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
2701 : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
2711 : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
2721 : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
2731 : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
2741 : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
2751 : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
2761 : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
2771 : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
2781 : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
2791 : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
27a1 : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
27b1 : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
27c1 : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
27d1 : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
27e1 : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
27f1 : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
2801 : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
280c : __ __ __ BYT e0 29 00 00 28 01 40 01                         : .)..(.@.
--------------------------------------------------------------------
giocharmap:
2814 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
Screen:
2815 : __ __ __ BSS	8
--------------------------------------------------------------------
Brush:
281d : __ __ __ BSS	8
--------------------------------------------------------------------
tworks:
2825 : __ __ __ BSS	8
--------------------------------------------------------------------
HeapNode:
282d : __ __ __ BSS	4
--------------------------------------------------------------------
BLIT_CODE:
2900 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
29e0 : __ __ __ BSS	320
