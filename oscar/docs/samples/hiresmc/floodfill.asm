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
080e : 8e eb 14 STX $14eb ; (spentry + 0)
0811 : a2 15 __ LDX #$15
0813 : a0 94 __ LDY #$94
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
082a : c0 e0 __ CPY #$e0
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 d6 __ LDA #$d6
083d : 85 23 __ STA SP + 0 
083f : a9 c7 __ LDA #$c7
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 0a JSR $0a00 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  17, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/floodfill.c"
.s1:
0a00 : a5 53 __ LDA T4 + 0 
0a02 : 8d d8 c7 STA $c7d8 ; (main@stack + 0)
.s4:
0a05 : a9 04 __ LDA #$04
0a07 : 85 0d __ STA P0 
0a09 : 20 9d 0b JSR $0b9d ; (mmap_trampoline.s4 + 0)
0a0c : a9 00 __ LDA #$00
0a0e : 85 0e __ STA P1 
0a10 : 85 10 __ STA P3 
0a12 : a9 c8 __ LDA #$c8
0a14 : 85 0f __ STA P2 
0a16 : a9 e0 __ LDA #$e0
0a18 : 85 11 __ STA P4 
0a1a : 20 e7 0b JSR $0be7 ; (vic_setmode.s4 + 0)
0a1d : a9 35 __ LDA #$35
0a1f : 85 01 __ STA $01 
0a21 : a9 00 __ LDA #$00
0a23 : 85 0d __ STA P0 
0a25 : 85 0f __ STA P2 
0a27 : 8d 21 d0 STA $d021 
0a2a : 8d 20 d0 STA $d020 
0a2d : a9 e0 __ LDA #$e0
0a2f : 85 0e __ STA P1 
0a31 : a9 40 __ LDA #$40
0a33 : 85 11 __ STA P4 
0a35 : a9 1f __ LDA #$1f
0a37 : 85 12 __ STA P5 
0a39 : a9 67 __ LDA #$67
0a3b : a2 fa __ LDX #$fa
.l6:
0a3d : ca __ __ DEX
0a3e : 9d 00 c8 STA $c800,x 
0a41 : 9d fa c8 STA $c8fa,x 
0a44 : 9d f4 c9 STA $c9f4,x 
0a47 : 9d ee ca STA $caee,x 
0a4a : d0 f1 __ BNE $0a3d ; (main.l6 + 0)
.s5:
0a4c : a9 02 __ LDA #$02
0a4e : a2 fa __ LDX #$fa
.l8:
0a50 : ca __ __ DEX
0a51 : 9d 00 d8 STA $d800,x 
0a54 : 9d fa d8 STA $d8fa,x 
0a57 : 9d f4 d9 STA $d9f4,x 
0a5a : 9d ee da STA $daee,x 
0a5d : d0 f1 __ BNE $0a50 ; (main.l8 + 0)
.s7:
0a5f : 20 39 0c JSR $0c39 ; (memset.s4 + 0)
0a62 : a9 00 __ LDA #$00
0a64 : 85 0f __ STA P2 
0a66 : a9 15 __ LDA #$15
0a68 : 85 0e __ STA P1 
0a6a : a9 e0 __ LDA #$e0
0a6c : 85 10 __ STA P3 
0a6e : a9 28 __ LDA #$28
0a70 : 85 11 __ STA P4 
0a72 : a9 19 __ LDA #$19
0a74 : 85 12 __ STA P5 
0a76 : a9 94 __ LDA #$94
0a78 : 85 0d __ STA P0 
0a7a : 20 5d 0c JSR $0c5d ; (bm_init.s4 + 0)
0a7d : a2 07 __ LDX #$07
.l9:
0a7f : bd 8f 0c LDA $0c8f,x 
0a82 : 9d e2 c7 STA $c7e2,x ; (scr.left + 0)
0a85 : ca __ __ DEX
0a86 : 10 f7 __ BPL $0a7f ; (main.l9 + 0)
.l10:
0a88 : a9 14 __ LDA #$14
0a8a : 85 53 __ STA T4 + 0 
.l11:
0a8c : a9 94 __ LDA #$94
0a8e : 8d f6 c7 STA $c7f6 ; (sstack + 0)
0a91 : a9 15 __ LDA #$15
0a93 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
0a96 : a9 e2 __ LDA #$e2
0a98 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
0a9b : a9 c7 __ LDA #$c7
0a9d : 8d f9 c7 STA $c7f9 ; (sstack + 3)
0aa0 : a9 28 __ LDA #$28
0aa2 : 8d fe c7 STA $c7fe ; (sstack + 8)
0aa5 : a9 15 __ LDA #$15
0aa7 : 8d ff c7 STA $c7ff ; (sstack + 9)
0aaa : 20 f4 10 JSR $10f4 ; (rand.s4 + 0)
0aad : a9 40 __ LDA #$40
0aaf : 85 03 __ STA WORK + 0 
0ab1 : a9 01 __ LDA #$01
0ab3 : 85 04 __ STA WORK + 1 
0ab5 : 20 66 14 JSR $1466 ; (divmod + 0)
0ab8 : a5 05 __ LDA WORK + 2 
0aba : 8d fa c7 STA $c7fa ; (sstack + 4)
0abd : a5 06 __ LDA WORK + 3 
0abf : 8d fb c7 STA $c7fb ; (sstack + 5)
0ac2 : 20 f4 10 JSR $10f4 ; (rand.s4 + 0)
0ac5 : a9 c8 __ LDA #$c8
0ac7 : 85 03 __ STA WORK + 0 
0ac9 : a9 00 __ LDA #$00
0acb : 85 04 __ STA WORK + 1 
0acd : 20 66 14 JSR $1466 ; (divmod + 0)
0ad0 : a5 05 __ LDA WORK + 2 
0ad2 : 8d fc c7 STA $c7fc ; (sstack + 6)
0ad5 : a9 00 __ LDA #$00
0ad7 : 8d fd c7 STA $c7fd ; (sstack + 7)
0ada : 20 f4 10 JSR $10f4 ; (rand.s4 + 0)
0add : a9 28 __ LDA #$28
0adf : 85 03 __ STA WORK + 0 
0ae1 : a9 00 __ LDA #$00
0ae3 : 85 04 __ STA WORK + 1 
0ae5 : 20 66 14 JSR $1466 ; (divmod + 0)
0ae8 : 18 __ __ CLC
0ae9 : a5 05 __ LDA WORK + 2 
0aeb : 69 05 __ ADC #$05
0aed : 85 18 __ STA P11 
0aef : 20 97 0c JSR $0c97 ; (bmmc_circle_fill.s1 + 0)
0af2 : c6 53 __ DEC T4 + 0 
0af4 : d0 96 __ BNE $0a8c ; (main.l11 + 0)
.s12:
0af6 : a9 14 __ LDA #$14
0af8 : 85 53 __ STA T4 + 0 
.l13:
0afa : a9 94 __ LDA #$94
0afc : 8d f6 c7 STA $c7f6 ; (sstack + 0)
0aff : a9 15 __ LDA #$15
0b01 : 8d f7 c7 STA $c7f7 ; (sstack + 1)
0b04 : a9 e2 __ LDA #$e2
0b06 : 8d f8 c7 STA $c7f8 ; (sstack + 2)
0b09 : a9 c7 __ LDA #$c7
0b0b : 8d f9 c7 STA $c7f9 ; (sstack + 3)
0b0e : a9 00 __ LDA #$00
0b10 : 8d fe c7 STA $c7fe ; (sstack + 8)
0b13 : a9 15 __ LDA #$15
0b15 : 8d ff c7 STA $c7ff ; (sstack + 9)
0b18 : 20 f4 10 JSR $10f4 ; (rand.s4 + 0)
0b1b : a9 40 __ LDA #$40
0b1d : 85 03 __ STA WORK + 0 
0b1f : a9 01 __ LDA #$01
0b21 : 85 04 __ STA WORK + 1 
0b23 : 20 66 14 JSR $1466 ; (divmod + 0)
0b26 : a5 05 __ LDA WORK + 2 
0b28 : 8d fa c7 STA $c7fa ; (sstack + 4)
0b2b : a5 06 __ LDA WORK + 3 
0b2d : 8d fb c7 STA $c7fb ; (sstack + 5)
0b30 : 20 f4 10 JSR $10f4 ; (rand.s4 + 0)
0b33 : a9 c8 __ LDA #$c8
0b35 : 85 03 __ STA WORK + 0 
0b37 : a9 00 __ LDA #$00
0b39 : 85 04 __ STA WORK + 1 
0b3b : 20 66 14 JSR $1466 ; (divmod + 0)
0b3e : a5 05 __ LDA WORK + 2 
0b40 : 8d fc c7 STA $c7fc ; (sstack + 6)
0b43 : a9 00 __ LDA #$00
0b45 : 8d fd c7 STA $c7fd ; (sstack + 7)
0b48 : 20 f4 10 JSR $10f4 ; (rand.s4 + 0)
0b4b : a9 28 __ LDA #$28
0b4d : 85 03 __ STA WORK + 0 
0b4f : a9 00 __ LDA #$00
0b51 : 85 04 __ STA WORK + 1 
0b53 : 20 66 14 JSR $1466 ; (divmod + 0)
0b56 : 18 __ __ CLC
0b57 : a5 05 __ LDA WORK + 2 
0b59 : 69 05 __ ADC #$05
0b5b : 85 18 __ STA P11 
0b5d : 20 97 0c JSR $0c97 ; (bmmc_circle_fill.s1 + 0)
0b60 : c6 53 __ DEC T4 + 0 
0b62 : d0 96 __ BNE $0afa ; (main.l13 + 0)
.s14:
0b64 : a9 00 __ LDA #$00
0b66 : 85 12 __ STA P5 
0b68 : 85 14 __ STA P7 
0b6a : a9 94 __ LDA #$94
0b6c : 85 0d __ STA P0 
0b6e : a9 15 __ LDA #$15
0b70 : 85 0e __ STA P1 
0b72 : a9 e2 __ LDA #$e2
0b74 : 85 0f __ STA P2 
0b76 : a9 c7 __ LDA #$c7
0b78 : 85 10 __ STA P3 
0b7a : a9 d2 __ LDA #$d2
0b7c : 85 11 __ STA P4 
0b7e : a9 64 __ LDA #$64
0b80 : 85 13 __ STA P6 
0b82 : a9 02 __ LDA #$02
0b84 : 85 15 __ STA P8 
0b86 : 20 1b 11 JSR $111b ; (bmmc_flood_fill.s1 + 0)
0b89 : e6 15 __ INC P8 
0b8b : a9 3c __ LDA #$3c
0b8d : 85 11 __ STA P4 
0b8f : a9 00 __ LDA #$00
0b91 : 85 12 __ STA P5 
0b93 : a9 8c __ LDA #$8c
0b95 : 85 13 __ STA P6 
0b97 : 20 1b 11 JSR $111b ; (bmmc_flood_fill.s1 + 0)
0b9a : 4c 88 0a JMP $0a88 ; (main.l10 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0b9d : a9 b2 __ LDA #$b2
0b9f : 8d fa ff STA $fffa 
0ba2 : a9 0b __ LDA #$0b
0ba4 : 8d fb ff STA $fffb 
0ba7 : a9 d0 __ LDA #$d0
0ba9 : 8d fe ff STA $fffe 
0bac : a9 0b __ LDA #$0b
0bae : 8d ff ff STA $ffff 
.s3:
0bb1 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0bb2 : 48 __ __ PHA
0bb3 : 8a __ __ TXA
0bb4 : 48 __ __ PHA
0bb5 : a9 0b __ LDA #$0b
0bb7 : 48 __ __ PHA
0bb8 : a9 c9 __ LDA #$c9
0bba : 48 __ __ PHA
0bbb : ba __ __ TSX
0bbc : bd 05 01 LDA $0105,x 
0bbf : 48 __ __ PHA
0bc0 : a6 01 __ LDX $01 
0bc2 : a9 36 __ LDA #$36
0bc4 : 85 01 __ STA $01 
0bc6 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0bc9 : 86 01 __ STX $01 
0bcb : 68 __ __ PLA
0bcc : aa __ __ TAX
0bcd : 68 __ __ PLA
0bce : 40 __ __ RTI
0bcf : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0bd0 : 48 __ __ PHA
0bd1 : 8a __ __ TXA
0bd2 : 48 __ __ PHA
0bd3 : a9 0b __ LDA #$0b
0bd5 : 48 __ __ PHA
0bd6 : a9 c9 __ LDA #$c9
0bd8 : 48 __ __ PHA
0bd9 : ba __ __ TSX
0bda : bd 05 01 LDA $0105,x 
0bdd : 48 __ __ PHA
0bde : a6 01 __ LDX $01 
0be0 : a9 36 __ LDA #$36
0be2 : 85 01 __ STA $01 
0be4 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0be7 : a4 0d __ LDY P0 ; (mode + 0)
0be9 : c0 02 __ CPY #$02
0beb : d0 09 __ BNE $0bf6 ; (vic_setmode.s5 + 0)
.s10:
0bed : a9 5b __ LDA #$5b
0bef : 8d 11 d0 STA $d011 
.s8:
0bf2 : a9 08 __ LDA #$08
0bf4 : d0 0c __ BNE $0c02 ; (vic_setmode.s7 + 0)
.s5:
0bf6 : b0 36 __ BCS $0c2e ; (vic_setmode.s6 + 0)
.s9:
0bf8 : a9 1b __ LDA #$1b
0bfa : 8d 11 d0 STA $d011 
0bfd : 98 __ __ TYA
0bfe : f0 f2 __ BEQ $0bf2 ; (vic_setmode.s8 + 0)
.s11:
0c00 : a9 18 __ LDA #$18
.s7:
0c02 : 8d 16 d0 STA $d016 
0c05 : ad 00 dd LDA $dd00 
0c08 : 29 fc __ AND #$fc
0c0a : 85 1b __ STA ACCU + 0 
0c0c : a5 0f __ LDA P2 ; (text + 1)
0c0e : 0a __ __ ASL
0c0f : 2a __ __ ROL
0c10 : 29 01 __ AND #$01
0c12 : 2a __ __ ROL
0c13 : 49 03 __ EOR #$03
0c15 : 05 1b __ ORA ACCU + 0 
0c17 : 8d 00 dd STA $dd00 
0c1a : a5 0f __ LDA P2 ; (text + 1)
0c1c : 29 3c __ AND #$3c
0c1e : 0a __ __ ASL
0c1f : 0a __ __ ASL
0c20 : 85 1b __ STA ACCU + 0 
0c22 : a5 11 __ LDA P4 ; (font + 1)
0c24 : 29 38 __ AND #$38
0c26 : 4a __ __ LSR
0c27 : 4a __ __ LSR
0c28 : 05 1b __ ORA ACCU + 0 
0c2a : 8d 18 d0 STA $d018 
.s3:
0c2d : 60 __ __ RTS
.s6:
0c2e : a9 3b __ LDA #$3b
0c30 : 8d 11 d0 STA $d011 
0c33 : c0 03 __ CPY #$03
0c35 : d0 c9 __ BNE $0c00 ; (vic_setmode.s11 + 0)
0c37 : f0 b9 __ BEQ $0bf2 ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0c39 : a5 0f __ LDA P2 
0c3b : a6 12 __ LDX P5 
0c3d : f0 0c __ BEQ $0c4b ; (memset.s4 + 18)
0c3f : a0 00 __ LDY #$00
0c41 : 91 0d __ STA (P0),y ; (dst + 0)
0c43 : c8 __ __ INY
0c44 : d0 fb __ BNE $0c41 ; (memset.s4 + 8)
0c46 : e6 0e __ INC P1 ; (dst + 1)
0c48 : ca __ __ DEX
0c49 : d0 f6 __ BNE $0c41 ; (memset.s4 + 8)
0c4b : a4 11 __ LDY P4 
0c4d : f0 05 __ BEQ $0c54 ; (memset.s4 + 27)
0c4f : 88 __ __ DEY
0c50 : 91 0d __ STA (P0),y ; (dst + 0)
0c52 : d0 fb __ BNE $0c4f ; (memset.s4 + 22)
0c54 : a5 0d __ LDA P0 ; (dst + 0)
0c56 : 85 1b __ STA ACCU + 0 
0c58 : a5 0e __ LDA P1 ; (dst + 1)
0c5a : 85 1c __ STA ACCU + 1 
.s3:
0c5c : 60 __ __ RTS
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0c5d : a5 0f __ LDA P2 ; (data + 0)
0c5f : a0 00 __ LDY #$00
0c61 : 91 0d __ STA (P0),y ; (bm + 0)
0c63 : a5 10 __ LDA P3 ; (data + 1)
0c65 : c8 __ __ INY
0c66 : 91 0d __ STA (P0),y ; (bm + 0)
0c68 : a9 00 __ LDA #$00
0c6a : c8 __ __ INY
0c6b : 91 0d __ STA (P0),y ; (bm + 0)
0c6d : c8 __ __ INY
0c6e : 91 0d __ STA (P0),y ; (bm + 0)
0c70 : a5 11 __ LDA P4 ; (cw + 0)
0c72 : c8 __ __ INY
0c73 : 91 0d __ STA (P0),y ; (bm + 0)
0c75 : a5 12 __ LDA P5 ; (ch + 0)
0c77 : c8 __ __ INY
0c78 : 91 0d __ STA (P0),y ; (bm + 0)
0c7a : a9 00 __ LDA #$00
0c7c : 06 11 __ ASL P4 ; (cw + 0)
0c7e : 2a __ __ ROL
0c7f : 06 11 __ ASL P4 ; (cw + 0)
0c81 : 2a __ __ ROL
0c82 : 06 11 __ ASL P4 ; (cw + 0)
0c84 : 2a __ __ ROL
0c85 : a0 07 __ LDY #$07
0c87 : 91 0d __ STA (P0),y ; (bm + 0)
0c89 : a5 11 __ LDA P4 ; (cw + 0)
0c8b : 88 __ __ DEY
0c8c : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0c8e : 60 __ __ RTS
--------------------------------------------------------------------
0c8f : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
bmmc_circle_fill: ; bmmc_circle_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,u8,const u8*)->void
;  32, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
0c97 : a2 05 __ LDX #$05
0c99 : b5 53 __ LDA T9 + 0,x 
0c9b : 9d ee c7 STA $c7ee,x ; (bmmc_circle_fill@stack + 0)
0c9e : ca __ __ DEX
0c9f : 10 f8 __ BPL $0c99 ; (bmmc_circle_fill.s1 + 2)
.s4:
0ca1 : 18 __ __ CLC
0ca2 : a5 18 __ LDA P11 ; (r + 0)
0ca4 : 6d fc c7 ADC $c7fc ; (sstack + 6)
0ca7 : ae fd c7 LDX $c7fd ; (sstack + 7)
0caa : 90 02 __ BCC $0cae ; (bmmc_circle_fill.s22 + 0)
.s21:
0cac : e8 __ __ INX
0cad : 18 __ __ CLC
.s22:
0cae : 69 01 __ ADC #$01
0cb0 : 85 4b __ STA T5 + 0 
0cb2 : 90 01 __ BCC $0cb5 ; (bmmc_circle_fill.s24 + 0)
.s23:
0cb4 : e8 __ __ INX
.s24:
0cb5 : 86 4c __ STX T5 + 1 
0cb7 : ad f8 c7 LDA $c7f8 ; (sstack + 2)
0cba : 85 4d __ STA T6 + 0 
0cbc : ad f9 c7 LDA $c7f9 ; (sstack + 3)
0cbf : 85 4e __ STA T6 + 1 
0cc1 : a0 06 __ LDY #$06
0cc3 : b1 4d __ LDA (T6 + 0),y 
0cc5 : aa __ __ TAX
0cc6 : c8 __ __ INY
0cc7 : b1 4d __ LDA (T6 + 0),y 
0cc9 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0ccb : ad fc c7 LDA $c7fc ; (sstack + 6)
0cce : 38 __ __ SEC
0ccf : e5 18 __ SBC P11 ; (r + 0)
0cd1 : 85 4f __ STA T7 + 0 
0cd3 : a0 02 __ LDY #$02
0cd5 : b1 4d __ LDA (T6 + 0),y 
0cd7 : 85 47 __ STA T3 + 0 
0cd9 : ad fd c7 LDA $c7fd ; (sstack + 7)
0cdc : e9 00 __ SBC #$00
0cde : 85 50 __ STA T7 + 1 
0ce0 : c8 __ __ INY
0ce1 : d1 4d __ CMP (T6 + 0),y 
0ce3 : d0 08 __ BNE $0ced ; (bmmc_circle_fill.s20 + 0)
.s17:
0ce5 : a5 4f __ LDA T7 + 0 
0ce7 : c5 47 __ CMP T3 + 0 
.s18:
0ce9 : 90 08 __ BCC $0cf3 ; (bmmc_circle_fill.s16 + 0)
0ceb : b0 0e __ BCS $0cfb ; (bmmc_circle_fill.s5 + 0)
.s20:
0ced : 51 4d __ EOR (T6 + 0),y 
0cef : 10 f8 __ BPL $0ce9 ; (bmmc_circle_fill.s18 + 0)
.s19:
0cf1 : 90 08 __ BCC $0cfb ; (bmmc_circle_fill.s5 + 0)
.s16:
0cf3 : a5 47 __ LDA T3 + 0 
0cf5 : 85 4f __ STA T7 + 0 
0cf7 : b1 4d __ LDA (T6 + 0),y 
0cf9 : 85 50 __ STA T7 + 1 
.s5:
0cfb : a5 1c __ LDA ACCU + 1 ; (clip + 1)
0cfd : c5 4c __ CMP T5 + 1 
0cff : d0 06 __ BNE $0d07 ; (bmmc_circle_fill.s15 + 0)
.s12:
0d01 : e4 4b __ CPX T5 + 0 
.s13:
0d03 : 90 08 __ BCC $0d0d ; (bmmc_circle_fill.s11 + 0)
0d05 : b0 08 __ BCS $0d0f ; (bmmc_circle_fill.s6 + 0)
.s15:
0d07 : 45 4c __ EOR T5 + 1 
0d09 : 10 f8 __ BPL $0d03 ; (bmmc_circle_fill.s13 + 0)
.s14:
0d0b : 90 02 __ BCC $0d0f ; (bmmc_circle_fill.s6 + 0)
.s11:
0d0d : 86 4b __ STX T5 + 0 
.s6:
0d0f : a5 4f __ LDA T7 + 0 
0d11 : c5 4b __ CMP T5 + 0 
0d13 : 90 0b __ BCC $0d20 ; (bmmc_circle_fill.s7 + 0)
.s3:
0d15 : a2 05 __ LDX #$05
0d17 : bd ee c7 LDA $c7ee,x ; (bmmc_circle_fill@stack + 0)
0d1a : 95 53 __ STA T9 + 0,x 
0d1c : ca __ __ DEX
0d1d : 10 f8 __ BPL $0d17 ; (bmmc_circle_fill.s3 + 2)
0d1f : 60 __ __ RTS
.s7:
0d20 : 29 f8 __ AND #$f8
0d22 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0d24 : ad f6 c7 LDA $c7f6 ; (sstack + 0)
0d27 : 85 47 __ STA T3 + 0 
0d29 : ad f7 c7 LDA $c7f7 ; (sstack + 1)
0d2c : 85 48 __ STA T3 + 1 
0d2e : a5 50 __ LDA T7 + 1 
0d30 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0d32 : a0 04 __ LDY #$04
0d34 : b1 47 __ LDA (T3 + 0),y 
0d36 : 85 49 __ STA T4 + 0 
0d38 : 20 ec 13 JSR $13ec ; (mul16by8 + 0)
0d3b : a0 00 __ LDY #$00
0d3d : b1 47 __ LDA (T3 + 0),y 
0d3f : 18 __ __ CLC
0d40 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0d42 : 85 02 __ STA $02 
0d44 : c8 __ __ INY
0d45 : b1 47 __ LDA (T3 + 0),y 
0d47 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0d49 : aa __ __ TAX
0d4a : a5 4f __ LDA T7 + 0 
0d4c : 29 07 __ AND #$07
0d4e : 18 __ __ CLC
0d4f : 65 02 __ ADC $02 
0d51 : 85 47 __ STA T3 + 0 
0d53 : 90 01 __ BCC $0d56 ; (bmmc_circle_fill.s26 + 0)
.s25:
0d55 : e8 __ __ INX
.s26:
0d56 : 86 48 __ STX T3 + 1 
0d58 : 38 __ __ SEC
0d59 : a5 4f __ LDA T7 + 0 
0d5b : ed fc c7 SBC $c7fc ; (sstack + 6)
0d5e : 85 45 __ STA T1 + 0 
0d60 : a5 50 __ LDA T7 + 1 
0d62 : ed fd c7 SBC $c7fd ; (sstack + 7)
0d65 : 85 46 __ STA T1 + 1 
0d67 : a5 45 __ LDA T1 + 0 
0d69 : 0a __ __ ASL
0d6a : 09 01 __ ORA #$01
0d6c : 85 51 __ STA T8 + 0 
0d6e : a5 46 __ LDA T1 + 1 
0d70 : 2a __ __ ROL
0d71 : 85 52 __ STA T8 + 1 
0d73 : a9 00 __ LDA #$00
0d75 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0d77 : a5 18 __ LDA P11 ; (r + 0)
0d79 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0d7b : 20 ec 13 JSR $13ec ; (mul16by8 + 0)
0d7e : 18 __ __ CLC
0d7f : a5 1b __ LDA ACCU + 0 ; (clip + 0)
0d81 : 65 18 __ ADC P11 ; (r + 0)
0d83 : 85 43 __ STA T0 + 0 
0d85 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
0d87 : 69 00 __ ADC #$00
0d89 : 85 44 __ STA T0 + 1 
0d8b : a5 45 __ LDA T1 + 0 
0d8d : 85 03 __ STA WORK + 0 
0d8f : 85 1b __ STA ACCU + 0 ; (clip + 0)
0d91 : a5 46 __ LDA T1 + 1 
0d93 : 85 04 __ STA WORK + 1 
0d95 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0d97 : 20 24 14 JSR $1424 ; (mul16 + 0)
0d9a : 38 __ __ SEC
0d9b : a5 43 __ LDA T0 + 0 
0d9d : e5 05 __ SBC WORK + 2 
0d9f : 85 53 __ STA T9 + 0 
0da1 : a5 44 __ LDA T0 + 1 
0da3 : e5 06 __ SBC WORK + 3 
0da5 : 85 54 __ STA T9 + 1 
0da7 : 18 __ __ CLC
0da8 : a5 49 __ LDA T4 + 0 
0daa : 69 ff __ ADC #$ff
0dac : 2a __ __ ROL
0dad : 2a __ __ ROL
0dae : 2a __ __ ROL
0daf : aa __ __ TAX
0db0 : 29 f8 __ AND #$f8
0db2 : 85 49 __ STA T4 + 0 
0db4 : 8a __ __ TXA
0db5 : 29 07 __ AND #$07
0db7 : 2a __ __ ROL
0db8 : 69 f8 __ ADC #$f8
0dba : 85 4a __ STA T4 + 1 
0dbc : ad fe c7 LDA $c7fe ; (sstack + 8)
0dbf : 85 55 __ STA T10 + 0 
0dc1 : ad ff c7 LDA $c7ff ; (sstack + 9)
0dc4 : 85 56 __ STA T10 + 1 
0dc6 : ad fa c7 LDA $c7fa ; (sstack + 4)
0dc9 : 85 57 __ STA T11 + 0 
0dcb : ad fb c7 LDA $c7fb ; (sstack + 5)
0dce : 85 58 __ STA T11 + 1 
.l8:
0dd0 : a5 53 __ LDA T9 + 0 
0dd2 : 85 0d __ STA P0 
0dd4 : a5 54 __ LDA T9 + 1 
0dd6 : 85 0e __ STA P1 
0dd8 : 20 72 0e JSR $0e72 ; (bm_usqrt.s4 + 0)
0ddb : a0 00 __ LDY #$00
0ddd : b1 4d __ LDA (T6 + 0),y 
0ddf : 85 0d __ STA P0 
0de1 : c8 __ __ INY
0de2 : b1 4d __ LDA (T6 + 0),y 
0de4 : 85 0e __ STA P1 
0de6 : a0 04 __ LDY #$04
0de8 : b1 4d __ LDA (T6 + 0),y 
0dea : 85 0f __ STA P2 
0dec : c8 __ __ INY
0ded : b1 4d __ LDA (T6 + 0),y 
0def : 85 10 __ STA P3 
0df1 : a5 47 __ LDA T3 + 0 
0df3 : 85 11 __ STA P4 
0df5 : a5 48 __ LDA T3 + 1 
0df7 : 85 12 __ STA P5 
0df9 : a5 4f __ LDA T7 + 0 
0dfb : 29 07 __ AND #$07
0dfd : a8 __ __ TAY
0dfe : b1 55 __ LDA (T10 + 0),y 
0e00 : 85 17 __ STA P10 
0e02 : 38 __ __ SEC
0e03 : a5 57 __ LDA T11 + 0 
0e05 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0e07 : 29 fe __ AND #$fe
0e09 : 85 13 __ STA P6 
0e0b : a5 58 __ LDA T11 + 1 
0e0d : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0e0f : 85 14 __ STA P7 
0e11 : 18 __ __ CLC
0e12 : a5 57 __ LDA T11 + 0 
0e14 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0e16 : aa __ __ TAX
0e17 : a5 58 __ LDA T11 + 1 
0e19 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0e1b : a8 __ __ TAY
0e1c : 8a __ __ TXA
0e1d : 18 __ __ CLC
0e1e : 69 02 __ ADC #$02
0e20 : 29 fe __ AND #$fe
0e22 : 85 15 __ STA P8 
0e24 : 90 01 __ BCC $0e27 ; (bmmc_circle_fill.s28 + 0)
.s27:
0e26 : c8 __ __ INY
.s28:
0e27 : 84 16 __ STY P9 
0e29 : 20 51 0f JSR $0f51 ; (bm_scan_fill.s4 + 0)
0e2c : 18 __ __ CLC
0e2d : a5 11 __ LDA P4 
0e2f : 69 01 __ ADC #$01
0e31 : 85 47 __ STA T3 + 0 
0e33 : a5 12 __ LDA P5 
0e35 : 69 00 __ ADC #$00
0e37 : 85 48 __ STA T3 + 1 
0e39 : a5 47 __ LDA T3 + 0 
0e3b : 29 07 __ AND #$07
0e3d : d0 0d __ BNE $0e4c ; (bmmc_circle_fill.s10 + 0)
.s9:
0e3f : 18 __ __ CLC
0e40 : a5 47 __ LDA T3 + 0 
0e42 : 65 49 __ ADC T4 + 0 
0e44 : 85 47 __ STA T3 + 0 
0e46 : a5 48 __ LDA T3 + 1 
0e48 : 65 4a __ ADC T4 + 1 
0e4a : 85 48 __ STA T3 + 1 
.s10:
0e4c : 38 __ __ SEC
0e4d : a5 53 __ LDA T9 + 0 
0e4f : e5 51 __ SBC T8 + 0 
0e51 : 85 53 __ STA T9 + 0 
0e53 : a5 54 __ LDA T9 + 1 
0e55 : e5 52 __ SBC T8 + 1 
0e57 : 85 54 __ STA T9 + 1 
0e59 : 18 __ __ CLC
0e5a : a5 51 __ LDA T8 + 0 
0e5c : 69 02 __ ADC #$02
0e5e : 85 51 __ STA T8 + 0 
0e60 : 90 02 __ BCC $0e64 ; (bmmc_circle_fill.s30 + 0)
.s29:
0e62 : e6 52 __ INC T8 + 1 
.s30:
0e64 : e6 4f __ INC T7 + 0 
0e66 : a5 4f __ LDA T7 + 0 
0e68 : c5 4b __ CMP T5 + 0 
0e6a : b0 03 __ BCS $0e6f ; (bmmc_circle_fill.s30 + 11)
0e6c : 4c d0 0d JMP $0dd0 ; (bmmc_circle_fill.l8 + 0)
0e6f : 4c 15 0d JMP $0d15 ; (bmmc_circle_fill.s3 + 0)
--------------------------------------------------------------------
bm_usqrt: ; bm_usqrt(u16)->u16
;  62, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0e72 : a4 0e __ LDY P1 ; (n + 1)
0e74 : 98 __ __ TYA
0e75 : c0 40 __ CPY #$40
0e77 : 90 09 __ BCC $0e82 ; (bm_usqrt.s5 + 0)
.s29:
0e79 : e9 40 __ SBC #$40
0e7b : a8 __ __ TAY
0e7c : a9 50 __ LDA #$50
0e7e : a2 20 __ LDX #$20
0e80 : d0 04 __ BNE $0e86 ; (bm_usqrt.s6 + 0)
.s5:
0e82 : a9 10 __ LDA #$10
0e84 : a2 00 __ LDX #$00
.s6:
0e86 : 85 44 __ STA T2 + 1 
0e88 : c4 44 __ CPY T2 + 1 
0e8a : 90 08 __ BCC $0e94 ; (bm_usqrt.s7 + 0)
.s28:
0e8c : 98 __ __ TYA
0e8d : e5 44 __ SBC T2 + 1 
0e8f : a8 __ __ TAY
0e90 : 8a __ __ TXA
0e91 : 09 10 __ ORA #$10
0e93 : aa __ __ TAX
.s7:
0e94 : 8a __ __ TXA
0e95 : 4a __ __ LSR
0e96 : 85 44 __ STA T2 + 1 
0e98 : 8a __ __ TXA
0e99 : 09 04 __ ORA #$04
0e9b : 85 1c __ STA ACCU + 1 
0e9d : c4 1c __ CPY ACCU + 1 
0e9f : 90 0a __ BCC $0eab ; (bm_usqrt.s8 + 0)
.s27:
0ea1 : 98 __ __ TYA
0ea2 : e5 1c __ SBC ACCU + 1 
0ea4 : a8 __ __ TAY
0ea5 : a5 44 __ LDA T2 + 1 
0ea7 : 09 04 __ ORA #$04
0ea9 : 85 44 __ STA T2 + 1 
.s8:
0eab : a5 44 __ LDA T2 + 1 
0ead : 4a __ __ LSR
0eae : 85 1c __ STA ACCU + 1 
0eb0 : a5 44 __ LDA T2 + 1 
0eb2 : 09 01 __ ORA #$01
0eb4 : 85 44 __ STA T2 + 1 
0eb6 : c4 44 __ CPY T2 + 1 
0eb8 : 90 0a __ BCC $0ec4 ; (bm_usqrt.s9 + 0)
.s26:
0eba : 98 __ __ TYA
0ebb : e5 44 __ SBC T2 + 1 
0ebd : a8 __ __ TAY
0ebe : a5 1c __ LDA ACCU + 1 
0ec0 : 09 01 __ ORA #$01
0ec2 : 85 1c __ STA ACCU + 1 
.s9:
0ec4 : a5 1c __ LDA ACCU + 1 
0ec6 : 4a __ __ LSR
0ec7 : 85 44 __ STA T2 + 1 
0ec9 : a9 00 __ LDA #$00
0ecb : 6a __ __ ROR
0ecc : 85 43 __ STA T2 + 0 
0ece : a6 0d __ LDX P0 ; (n + 0)
0ed0 : c4 1c __ CPY ACCU + 1 
0ed2 : d0 02 __ BNE $0ed6 ; (bm_usqrt.s25 + 0)
.s24:
0ed4 : e0 40 __ CPX #$40
.s25:
0ed6 : 90 0e __ BCC $0ee6 ; (bm_usqrt.s10 + 0)
.s23:
0ed8 : 8a __ __ TXA
0ed9 : e9 40 __ SBC #$40
0edb : aa __ __ TAX
0edc : 98 __ __ TYA
0edd : e5 1c __ SBC ACCU + 1 
0edf : a8 __ __ TAY
0ee0 : a5 43 __ LDA T2 + 0 
0ee2 : 09 40 __ ORA #$40
0ee4 : 85 43 __ STA T2 + 0 
.s10:
0ee6 : a5 44 __ LDA T2 + 1 
0ee8 : 4a __ __ LSR
0ee9 : 85 1c __ STA ACCU + 1 
0eeb : a5 43 __ LDA T2 + 0 
0eed : 6a __ __ ROR
0eee : 85 1b __ STA ACCU + 0 
0ef0 : a5 43 __ LDA T2 + 0 
0ef2 : 09 10 __ ORA #$10
0ef4 : 85 43 __ STA T2 + 0 
0ef6 : c4 44 __ CPY T2 + 1 
0ef8 : d0 02 __ BNE $0efc ; (bm_usqrt.s22 + 0)
.s21:
0efa : e4 43 __ CPX T2 + 0 
.s22:
0efc : 90 0e __ BCC $0f0c ; (bm_usqrt.s11 + 0)
.s20:
0efe : 8a __ __ TXA
0eff : e5 43 __ SBC T2 + 0 
0f01 : aa __ __ TAX
0f02 : 98 __ __ TYA
0f03 : e5 44 __ SBC T2 + 1 
0f05 : a8 __ __ TAY
0f06 : a5 1b __ LDA ACCU + 0 
0f08 : 09 10 __ ORA #$10
0f0a : 85 1b __ STA ACCU + 0 
.s11:
0f0c : a5 1c __ LDA ACCU + 1 
0f0e : 4a __ __ LSR
0f0f : 85 44 __ STA T2 + 1 
0f11 : a5 1b __ LDA ACCU + 0 
0f13 : 6a __ __ ROR
0f14 : 85 43 __ STA T2 + 0 
0f16 : a5 1b __ LDA ACCU + 0 
0f18 : 09 04 __ ORA #$04
0f1a : 85 1b __ STA ACCU + 0 
0f1c : c4 1c __ CPY ACCU + 1 
0f1e : d0 02 __ BNE $0f22 ; (bm_usqrt.s19 + 0)
.s18:
0f20 : e4 1b __ CPX ACCU + 0 
.s19:
0f22 : 90 0e __ BCC $0f32 ; (bm_usqrt.s12 + 0)
.s17:
0f24 : 8a __ __ TXA
0f25 : e5 1b __ SBC ACCU + 0 
0f27 : aa __ __ TAX
0f28 : 98 __ __ TYA
0f29 : e5 1c __ SBC ACCU + 1 
0f2b : a8 __ __ TAY
0f2c : a5 43 __ LDA T2 + 0 
0f2e : 09 04 __ ORA #$04
0f30 : 85 43 __ STA T2 + 0 
.s12:
0f32 : a5 44 __ LDA T2 + 1 
0f34 : 4a __ __ LSR
0f35 : a5 43 __ LDA T2 + 0 
0f37 : 6a __ __ ROR
0f38 : c4 44 __ CPY T2 + 1 
0f3a : d0 0a __ BNE $0f46 ; (bm_usqrt.s16 + 0)
.s15:
0f3c : a8 __ __ TAY
0f3d : a5 43 __ LDA T2 + 0 
0f3f : 09 01 __ ORA #$01
0f41 : 85 43 __ STA T2 + 0 
0f43 : e4 43 __ CPX T2 + 0 
0f45 : 98 __ __ TYA
.s16:
0f46 : 90 02 __ BCC $0f4a ; (bm_usqrt.s13 + 0)
.s14:
0f48 : 09 01 __ ORA #$01
.s13:
0f4a : 85 1b __ STA ACCU + 0 
0f4c : a9 00 __ LDA #$00
.s3:
0f4e : 85 1c __ STA ACCU + 1 
0f50 : 60 __ __ RTS
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0f51 : a5 14 __ LDA P7 ; (x0 + 1)
0f53 : 30 0a __ BMI $0f5f ; (bm_scan_fill.s24 + 0)
.s27:
0f55 : c5 0e __ CMP P1 ; (left + 1)
0f57 : d0 04 __ BNE $0f5d ; (bm_scan_fill.s26 + 0)
.s25:
0f59 : a5 13 __ LDA P6 ; (x0 + 0)
0f5b : c5 0d __ CMP P0 ; (left + 0)
.s26:
0f5d : b0 08 __ BCS $0f67 ; (bm_scan_fill.s5 + 0)
.s24:
0f5f : a5 0d __ LDA P0 ; (left + 0)
0f61 : 85 13 __ STA P6 ; (x0 + 0)
0f63 : a5 0e __ LDA P1 ; (left + 1)
0f65 : 85 14 __ STA P7 ; (x0 + 1)
.s5:
0f67 : 24 16 __ BIT P9 ; (x1 + 1)
0f69 : 30 64 __ BMI $0fcf ; (bm_scan_fill.s3 + 0)
.s23:
0f6b : a5 10 __ LDA P3 ; (right + 1)
0f6d : c5 16 __ CMP P9 ; (x1 + 1)
0f6f : f0 03 __ BEQ $0f74 ; (bm_scan_fill.s21 + 0)
0f71 : 4c eb 10 JMP $10eb ; (bm_scan_fill.s22 + 0)
.s21:
0f74 : a5 0f __ LDA P2 ; (right + 0)
0f76 : c5 15 __ CMP P8 ; (x1 + 0)
0f78 : b0 03 __ BCS $0f7d ; (bm_scan_fill.s17 + 0)
0f7a : 4c d5 10 JMP $10d5 ; (bm_scan_fill.s18 + 0)
.s17:
0f7d : a5 14 __ LDA P7 ; (x0 + 1)
0f7f : c5 16 __ CMP P9 ; (x1 + 1)
0f81 : d0 04 __ BNE $0f87 ; (bm_scan_fill.s20 + 0)
.s16:
0f83 : a5 13 __ LDA P6 ; (x0 + 0)
0f85 : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
0f87 : b0 46 __ BCS $0fcf ; (bm_scan_fill.s3 + 0)
.s6:
0f89 : a5 13 __ LDA P6 ; (x0 + 0)
0f8b : 29 f8 __ AND #$f8
0f8d : 85 1b __ STA ACCU + 0 
0f8f : 65 11 __ ADC P4 ; (lp + 0)
0f91 : 85 43 __ STA T1 + 0 
0f93 : a5 12 __ LDA P5 ; (lp + 1)
0f95 : 65 14 __ ADC P7 ; (x0 + 1)
0f97 : 85 44 __ STA T1 + 1 
0f99 : a5 15 __ LDA P8 ; (x1 + 0)
0f9b : 29 07 __ AND #$07
0f9d : aa __ __ TAX
0f9e : a5 13 __ LDA P6 ; (x0 + 0)
0fa0 : 29 07 __ AND #$07
0fa2 : bc f4 14 LDY $14f4,x ; (rmask[0] + 0)
0fa5 : aa __ __ TAX
0fa6 : a5 15 __ LDA P8 ; (x1 + 0)
0fa8 : 29 f8 __ AND #$f8
0faa : 38 __ __ SEC
0fab : e5 1b __ SBC ACCU + 0 
0fad : 85 1b __ STA ACCU + 0 
0faf : a5 16 __ LDA P9 ; (x1 + 1)
0fb1 : e5 14 __ SBC P7 ; (x0 + 1)
0fb3 : 85 1c __ STA ACCU + 1 
0fb5 : 05 1b __ ORA ACCU + 0 
0fb7 : d0 17 __ BNE $0fd0 ; (bm_scan_fill.s7 + 0)
.s15:
0fb9 : 98 __ __ TYA
0fba : 3d ec 14 AND $14ec,x ; (lmask[0] + 0)
0fbd : 85 1e __ STA ACCU + 3 
0fbf : a0 00 __ LDY #$00
.s11:
0fc1 : 49 ff __ EOR #$ff
0fc3 : 31 43 __ AND (T1 + 0),y 
0fc5 : 85 1b __ STA ACCU + 0 
0fc7 : a5 17 __ LDA P10 ; (pat + 0)
0fc9 : 25 1e __ AND ACCU + 3 
0fcb : 05 1b __ ORA ACCU + 0 
0fcd : 91 43 __ STA (T1 + 0),y 
.s3:
0fcf : 60 __ __ RTS
.s7:
0fd0 : 84 1e __ STY ACCU + 3 
0fd2 : bd ec 14 LDA $14ec,x ; (lmask[0] + 0)
0fd5 : 49 ff __ EOR #$ff
0fd7 : a0 00 __ LDY #$00
0fd9 : 31 43 __ AND (T1 + 0),y 
0fdb : 85 1d __ STA ACCU + 2 
0fdd : a5 17 __ LDA P10 ; (pat + 0)
0fdf : 3d ec 14 AND $14ec,x ; (lmask[0] + 0)
0fe2 : 05 1d __ ORA ACCU + 2 
0fe4 : 91 43 __ STA (T1 + 0),y 
0fe6 : a5 1c __ LDA ACCU + 1 
0fe8 : d0 03 __ BNE $0fed ; (bm_scan_fill.s14 + 0)
0fea : 4c 78 10 JMP $1078 ; (bm_scan_fill.s8 + 0)
.s14:
0fed : a5 17 __ LDA P10 ; (pat + 0)
0fef : a0 08 __ LDY #$08
0ff1 : 91 43 __ STA (T1 + 0),y 
0ff3 : a0 10 __ LDY #$10
0ff5 : 91 43 __ STA (T1 + 0),y 
0ff7 : a0 18 __ LDY #$18
0ff9 : 91 43 __ STA (T1 + 0),y 
0ffb : a0 20 __ LDY #$20
0ffd : 91 43 __ STA (T1 + 0),y 
0fff : a0 28 __ LDY #$28
1001 : 91 43 __ STA (T1 + 0),y 
1003 : a0 30 __ LDY #$30
1005 : 91 43 __ STA (T1 + 0),y 
1007 : a0 38 __ LDY #$38
1009 : 91 43 __ STA (T1 + 0),y 
100b : a0 40 __ LDY #$40
100d : 91 43 __ STA (T1 + 0),y 
100f : a0 48 __ LDY #$48
1011 : 91 43 __ STA (T1 + 0),y 
1013 : a0 50 __ LDY #$50
1015 : 91 43 __ STA (T1 + 0),y 
1017 : a0 58 __ LDY #$58
1019 : 91 43 __ STA (T1 + 0),y 
101b : a0 60 __ LDY #$60
101d : 91 43 __ STA (T1 + 0),y 
101f : a0 68 __ LDY #$68
1021 : 91 43 __ STA (T1 + 0),y 
1023 : a0 70 __ LDY #$70
1025 : 91 43 __ STA (T1 + 0),y 
1027 : a0 78 __ LDY #$78
1029 : 91 43 __ STA (T1 + 0),y 
102b : a0 80 __ LDY #$80
102d : 91 43 __ STA (T1 + 0),y 
102f : a0 88 __ LDY #$88
1031 : 91 43 __ STA (T1 + 0),y 
1033 : a0 90 __ LDY #$90
1035 : 91 43 __ STA (T1 + 0),y 
1037 : a0 98 __ LDY #$98
1039 : 91 43 __ STA (T1 + 0),y 
103b : a0 a0 __ LDY #$a0
103d : 91 43 __ STA (T1 + 0),y 
103f : a0 a8 __ LDY #$a8
1041 : 91 43 __ STA (T1 + 0),y 
1043 : a0 b0 __ LDY #$b0
1045 : 91 43 __ STA (T1 + 0),y 
1047 : a0 b8 __ LDY #$b8
1049 : 91 43 __ STA (T1 + 0),y 
104b : a0 c0 __ LDY #$c0
104d : 91 43 __ STA (T1 + 0),y 
104f : a0 c8 __ LDY #$c8
1051 : 91 43 __ STA (T1 + 0),y 
1053 : a0 d0 __ LDY #$d0
1055 : 91 43 __ STA (T1 + 0),y 
1057 : a0 d8 __ LDY #$d8
1059 : 91 43 __ STA (T1 + 0),y 
105b : a0 e0 __ LDY #$e0
105d : 91 43 __ STA (T1 + 0),y 
105f : a0 e8 __ LDY #$e8
1061 : 91 43 __ STA (T1 + 0),y 
1063 : a0 f0 __ LDY #$f0
1065 : 91 43 __ STA (T1 + 0),y 
1067 : a0 f8 __ LDY #$f8
1069 : 91 43 __ STA (T1 + 0),y 
106b : 38 __ __ SEC
106c : a5 1b __ LDA ACCU + 0 
106e : e9 f8 __ SBC #$f8
1070 : 85 1b __ STA ACCU + 0 
1072 : e6 44 __ INC T1 + 1 
1074 : a9 00 __ LDA #$00
1076 : f0 48 __ BEQ $10c0 ; (bm_scan_fill.s28 + 0)
.s8:
1078 : 24 1b __ BIT ACCU + 0 
107a : 30 04 __ BMI $1080 ; (bm_scan_fill.s13 + 0)
.s9:
107c : a9 08 __ LDA #$08
107e : d0 40 __ BNE $10c0 ; (bm_scan_fill.s28 + 0)
.s13:
1080 : a5 17 __ LDA P10 ; (pat + 0)
1082 : a0 08 __ LDY #$08
1084 : 91 43 __ STA (T1 + 0),y 
1086 : a0 10 __ LDY #$10
1088 : 91 43 __ STA (T1 + 0),y 
108a : a0 18 __ LDY #$18
108c : 91 43 __ STA (T1 + 0),y 
108e : a0 20 __ LDY #$20
1090 : 91 43 __ STA (T1 + 0),y 
1092 : a0 28 __ LDY #$28
1094 : 91 43 __ STA (T1 + 0),y 
1096 : a0 30 __ LDY #$30
1098 : 91 43 __ STA (T1 + 0),y 
109a : a0 38 __ LDY #$38
109c : 91 43 __ STA (T1 + 0),y 
109e : a0 40 __ LDY #$40
10a0 : 91 43 __ STA (T1 + 0),y 
10a2 : a0 48 __ LDY #$48
10a4 : 91 43 __ STA (T1 + 0),y 
10a6 : a0 50 __ LDY #$50
10a8 : 91 43 __ STA (T1 + 0),y 
10aa : a0 58 __ LDY #$58
10ac : 91 43 __ STA (T1 + 0),y 
10ae : a0 60 __ LDY #$60
10b0 : 91 43 __ STA (T1 + 0),y 
10b2 : a0 68 __ LDY #$68
10b4 : 91 43 __ STA (T1 + 0),y 
10b6 : a0 70 __ LDY #$70
10b8 : 91 43 __ STA (T1 + 0),y 
10ba : a0 78 __ LDY #$78
10bc : 91 43 __ STA (T1 + 0),y 
10be : a9 80 __ LDA #$80
.s28:
10c0 : a6 17 __ LDX P10 ; (pat + 0)
10c2 : 4c cb 10 JMP $10cb ; (bm_scan_fill.l10 + 0)
.s12:
10c5 : 8a __ __ TXA
10c6 : 91 43 __ STA (T1 + 0),y 
10c8 : 98 __ __ TYA
10c9 : 69 08 __ ADC #$08
.l10:
10cb : a8 __ __ TAY
10cc : c4 1b __ CPY ACCU + 0 
10ce : 90 f5 __ BCC $10c5 ; (bm_scan_fill.s12 + 0)
.s29:
10d0 : a5 1e __ LDA ACCU + 3 
10d2 : 4c c1 0f JMP $0fc1 ; (bm_scan_fill.s11 + 0)
.s18:
10d5 : 85 15 __ STA P8 ; (x1 + 0)
10d7 : a5 10 __ LDA P3 ; (right + 1)
10d9 : 85 16 __ STA P9 ; (x1 + 1)
10db : a5 14 __ LDA P7 ; (x0 + 1)
10dd : c5 10 __ CMP P3 ; (right + 1)
10df : f0 03 __ BEQ $10e4 ; (bm_scan_fill.s19 + 0)
10e1 : 4c 87 0f JMP $0f87 ; (bm_scan_fill.s20 + 0)
.s19:
10e4 : a5 13 __ LDA P6 ; (x0 + 0)
10e6 : c5 0f __ CMP P2 ; (right + 0)
10e8 : 4c 87 0f JMP $0f87 ; (bm_scan_fill.s20 + 0)
.s22:
10eb : 90 03 __ BCC $10f0 ; (bm_scan_fill.s30 + 0)
10ed : 4c 7d 0f JMP $0f7d ; (bm_scan_fill.s17 + 0)
.s30:
10f0 : a5 0f __ LDA P2 ; (right + 0)
10f2 : 90 e1 __ BCC $10d5 ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
10f4 : ad fd 14 LDA $14fd ; (seed + 1)
10f7 : 4a __ __ LSR
10f8 : ad fc 14 LDA $14fc ; (seed + 0)
10fb : 6a __ __ ROR
10fc : aa __ __ TAX
10fd : a9 00 __ LDA #$00
10ff : 6a __ __ ROR
1100 : 4d fc 14 EOR $14fc ; (seed + 0)
1103 : 85 1b __ STA ACCU + 0 
1105 : 8a __ __ TXA
1106 : 4d fd 14 EOR $14fd ; (seed + 1)
1109 : 85 1c __ STA ACCU + 1 
110b : 4a __ __ LSR
110c : 45 1b __ EOR ACCU + 0 
110e : 8d fc 14 STA $14fc ; (seed + 0)
1111 : 85 1b __ STA ACCU + 0 
1113 : 45 1c __ EOR ACCU + 1 
1115 : 8d fd 14 STA $14fd ; (seed + 1)
1118 : 85 1c __ STA ACCU + 1 
.s3:
111a : 60 __ __ RTS
--------------------------------------------------------------------
bmmc_flood_fill: ; bmmc_flood_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,u8)->void
;  72, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
111b : a5 53 __ LDA T16 + 0 
111d : 8d eb c7 STA $c7eb ; (bmmc_flood_fill@stack + 0)
.s4:
1120 : a6 15 __ LDX P8 ; (color + 0)
1122 : bd 80 15 LDA $1580,x ; (cbytes[0] + 0)
1125 : 85 4f __ STA T11 + 0 
1127 : 46 12 __ LSR P5 ; (x + 1)
1129 : a5 11 __ LDA P4 ; (x + 0)
112b : 6a __ __ ROR
112c : 85 43 __ STA T0 + 0 
112e : 29 03 __ AND #$03
1130 : 49 03 __ EOR #$03
1132 : 0a __ __ ASL
1133 : 85 44 __ STA T2 + 0 
1135 : a0 04 __ LDY #$04
1137 : b1 0d __ LDA (P0),y ; (bm + 0)
1139 : 85 1b __ STA ACCU + 0 
113b : a9 00 __ LDA #$00
113d : 85 1c __ STA ACCU + 1 
113f : a5 13 __ LDA P6 ; (y + 0)
1141 : 29 f8 __ AND #$f8
1143 : 20 ec 13 JSR $13ec ; (mul16by8 + 0)
1146 : a0 00 __ LDY #$00
1148 : b1 0d __ LDA (P0),y ; (bm + 0)
114a : 18 __ __ CLC
114b : 65 1b __ ADC ACCU + 0 
114d : 85 1b __ STA ACCU + 0 
114f : c8 __ __ INY
1150 : b1 0d __ LDA (P0),y ; (bm + 0)
1152 : 65 1c __ ADC ACCU + 1 
1154 : aa __ __ TAX
1155 : a5 13 __ LDA P6 ; (y + 0)
1157 : 29 07 __ AND #$07
1159 : 18 __ __ CLC
115a : 65 1b __ ADC ACCU + 0 
115c : 85 1b __ STA ACCU + 0 
115e : 90 01 __ BCC $1161 ; (bmmc_flood_fill.s41 + 0)
.s40:
1160 : e8 __ __ INX
.s41:
1161 : a5 43 __ LDA T0 + 0 
1163 : 29 fc __ AND #$fc
1165 : 0a __ __ ASL
1166 : a8 __ __ TAY
1167 : 90 01 __ BCC $116a ; (bmmc_flood_fill.s43 + 0)
.s42:
1169 : e8 __ __ INX
.s43:
116a : 86 1c __ STX ACCU + 1 
116c : b1 1b __ LDA (ACCU + 0),y 
116e : a6 44 __ LDX T2 + 0 
1170 : f0 04 __ BEQ $1176 ; (bmmc_flood_fill.s6 + 0)
.l5:
1172 : 4a __ __ LSR
1173 : ca __ __ DEX
1174 : d0 fc __ BNE $1172 ; (bmmc_flood_fill.l5 + 0)
.s6:
1176 : 29 03 __ AND #$03
1178 : aa __ __ TAX
1179 : bd 80 15 LDA $1580,x ; (cbytes[0] + 0)
117c : c5 4f __ CMP T11 + 0 
117e : d0 03 __ BNE $1183 ; (bmmc_flood_fill.s7 + 0)
1180 : 4c bd 13 JMP $13bd ; (bmmc_flood_fill.s3 + 0)
.s7:
1183 : 85 4e __ STA T10 + 0 
1185 : a0 00 __ LDY #$00
1187 : b1 0f __ LDA (P2),y ; (clip + 0)
1189 : 85 44 __ STA T2 + 0 
118b : c8 __ __ INY
118c : b1 0f __ LDA (P2),y ; (clip + 0)
118e : 4a __ __ LSR
118f : 66 44 __ ROR T2 + 0 
1191 : a0 04 __ LDY #$04
1193 : b1 0f __ LDA (P2),y ; (clip + 0)
1195 : 85 47 __ STA T4 + 0 
1197 : c8 __ __ INY
1198 : b1 0f __ LDA (P2),y ; (clip + 0)
119a : 4a __ __ LSR
119b : 66 47 __ ROR T4 + 0 
119d : a5 43 __ LDA T0 + 0 
119f : 8d 00 16 STA $1600 ; (BLIT_CODE[0] + 0)
11a2 : a5 13 __ LDA P6 ; (y + 0)
11a4 : 8d 01 16 STA $1601 ; (BLIT_CODE[0] + 1)
11a7 : a2 02 __ LDX #$02
11a9 : 86 50 __ STX T12 + 0 
.l8:
11ab : bd ff 15 LDA $15ff,x 
11ae : 85 43 __ STA T0 + 0 
11b0 : 29 f8 __ AND #$f8
11b2 : aa __ __ TAX
11b3 : a0 04 __ LDY #$04
11b5 : b1 0d __ LDA (P0),y ; (bm + 0)
11b7 : 85 1b __ STA ACCU + 0 
11b9 : a9 00 __ LDA #$00
11bb : 85 1c __ STA ACCU + 1 
11bd : 8a __ __ TXA
11be : 20 ec 13 JSR $13ec ; (mul16by8 + 0)
11c1 : a0 00 __ LDY #$00
11c3 : b1 0d __ LDA (P0),y ; (bm + 0)
11c5 : 85 48 __ STA T5 + 0 
11c7 : 18 __ __ CLC
11c8 : 65 1b __ ADC ACCU + 0 
11ca : 85 45 __ STA T3 + 0 
11cc : c8 __ __ INY
11cd : b1 0d __ LDA (P0),y ; (bm + 0)
11cf : 85 49 __ STA T5 + 1 
11d1 : 65 1c __ ADC ACCU + 1 
11d3 : aa __ __ TAX
11d4 : a5 43 __ LDA T0 + 0 
11d6 : 29 07 __ AND #$07
11d8 : 18 __ __ CLC
11d9 : 65 45 __ ADC T3 + 0 
11db : a8 __ __ TAY
11dc : 90 02 __ BCC $11e0 ; (bmmc_flood_fill.s45 + 0)
.s44:
11de : e8 __ __ INX
11df : 18 __ __ CLC
.s45:
11e0 : 86 46 __ STX T3 + 1 
11e2 : a5 50 __ LDA T12 + 0 
11e4 : 69 fe __ ADC #$fe
11e6 : 85 50 __ STA T12 + 0 
11e8 : aa __ __ TAX
11e9 : bd 00 16 LDA $1600,x ; (BLIT_CODE[0] + 0)
11ec : 85 51 __ STA T13 + 0 
11ee : 29 fc __ AND #$fc
11f0 : 0a __ __ ASL
11f1 : 85 4a __ STA T8 + 0 
11f3 : a5 46 __ LDA T3 + 1 
11f5 : 69 00 __ ADC #$00
11f7 : 85 4b __ STA T8 + 1 
11f9 : a5 51 __ LDA T13 + 0 
11fb : 29 03 __ AND #$03
11fd : 0a __ __ ASL
11fe : aa __ __ TAX
11ff : b1 4a __ LDA (T8 + 0),y 
1201 : 45 4e __ EOR T10 + 0 
1203 : 3d 84 15 AND $1584,x ; (ormask[0] + 0)
1206 : f0 03 __ BEQ $120b ; (bmmc_flood_fill.s9 + 0)
1208 : 4c b6 13 JMP $13b6 ; (bmmc_flood_fill.s13 + 0)
.s9:
120b : a5 4f __ LDA T11 + 0 
120d : 3d 84 15 AND $1584,x ; (ormask[0] + 0)
1210 : 85 4c __ STA T9 + 0 
1212 : bd 8c 15 LDA $158c,x ; (andmask[0] + 0)
1215 : 31 4a __ AND (T8 + 0),y 
1217 : 05 4c __ ORA T9 + 0 
1219 : 91 4a __ STA (T8 + 0),y 
121b : a5 51 __ LDA T13 + 0 
121d : 85 52 __ STA T14 + 0 
121f : a5 44 __ LDA T2 + 0 
1221 : c5 51 __ CMP T13 + 0 
1223 : b0 49 __ BCS $126e ; (bmmc_flood_fill.l10 + 0)
.l36:
1225 : a5 52 __ LDA T14 + 0 
1227 : e9 00 __ SBC #$00
1229 : aa __ __ TAX
122a : 29 fc __ AND #$fc
122c : 0a __ __ ASL
122d : 85 4a __ STA T8 + 0 
122f : a5 46 __ LDA T3 + 1 
1231 : 69 00 __ ADC #$00
1233 : 85 4b __ STA T8 + 1 
1235 : 8a __ __ TXA
1236 : 29 03 __ AND #$03
1238 : 0a __ __ ASL
1239 : aa __ __ TAX
123a : b1 4a __ LDA (T8 + 0),y 
123c : 45 4e __ EOR T10 + 0 
123e : 3d 84 15 AND $1584,x ; (ormask[0] + 0)
1241 : d0 2b __ BNE $126e ; (bmmc_flood_fill.l10 + 0)
.s37:
1243 : c6 52 __ DEC T14 + 0 
1245 : a5 52 __ LDA T14 + 0 
1247 : 29 03 __ AND #$03
1249 : 0a __ __ ASL
124a : aa __ __ TAX
124b : bd 84 15 LDA $1584,x ; (ormask[0] + 0)
124e : 25 4f __ AND T11 + 0 
1250 : 85 4c __ STA T9 + 0 
1252 : a5 52 __ LDA T14 + 0 
1254 : 29 fc __ AND #$fc
1256 : 0a __ __ ASL
1257 : 85 1b __ STA ACCU + 0 
1259 : a5 46 __ LDA T3 + 1 
125b : 69 00 __ ADC #$00
125d : 85 1c __ STA ACCU + 1 
125f : b1 1b __ LDA (ACCU + 0),y 
1261 : 3d 8c 15 AND $158c,x ; (andmask[0] + 0)
1264 : 05 4c __ ORA T9 + 0 
1266 : 91 1b __ STA (ACCU + 0),y 
1268 : a5 44 __ LDA T2 + 0 
126a : c5 52 __ CMP T14 + 0 
126c : 90 b7 __ BCC $1225 ; (bmmc_flood_fill.l36 + 0)
.l10:
126e : 18 __ __ CLC
126f : a5 51 __ LDA T13 + 0 
1271 : 69 01 __ ADC #$01
1273 : b0 46 __ BCS $12bb ; (bmmc_flood_fill.s11 + 0)
.s35:
1275 : aa __ __ TAX
1276 : e4 47 __ CPX T4 + 0 
1278 : b0 41 __ BCS $12bb ; (bmmc_flood_fill.s11 + 0)
.s33:
127a : 29 fc __ AND #$fc
127c : 0a __ __ ASL
127d : 85 1b __ STA ACCU + 0 
127f : a5 46 __ LDA T3 + 1 
1281 : 69 00 __ ADC #$00
1283 : 85 1c __ STA ACCU + 1 
1285 : 8a __ __ TXA
1286 : 29 03 __ AND #$03
1288 : 0a __ __ ASL
1289 : aa __ __ TAX
128a : b1 1b __ LDA (ACCU + 0),y 
128c : 45 4e __ EOR T10 + 0 
128e : 3d 84 15 AND $1584,x ; (ormask[0] + 0)
1291 : d0 28 __ BNE $12bb ; (bmmc_flood_fill.s11 + 0)
.s34:
1293 : e6 51 __ INC T13 + 0 
1295 : a5 51 __ LDA T13 + 0 
1297 : 29 03 __ AND #$03
1299 : 0a __ __ ASL
129a : aa __ __ TAX
129b : bd 84 15 LDA $1584,x ; (ormask[0] + 0)
129e : 25 4f __ AND T11 + 0 
12a0 : 85 4c __ STA T9 + 0 
12a2 : a5 51 __ LDA T13 + 0 
12a4 : 29 fc __ AND #$fc
12a6 : 0a __ __ ASL
12a7 : 85 1b __ STA ACCU + 0 
12a9 : a5 46 __ LDA T3 + 1 
12ab : 69 00 __ ADC #$00
12ad : 85 1c __ STA ACCU + 1 
12af : b1 1b __ LDA (ACCU + 0),y 
12b1 : 3d 8c 15 AND $158c,x ; (andmask[0] + 0)
12b4 : 05 4c __ ORA T9 + 0 
12b6 : 91 1b __ STA (ACCU + 0),y 
12b8 : 4c 6e 12 JMP $126e ; (bmmc_flood_fill.l10 + 0)
.s11:
12bb : a0 03 __ LDY #$03
12bd : b1 0f __ LDA (P2),y ; (clip + 0)
12bf : 30 09 __ BMI $12ca ; (bmmc_flood_fill.s24 + 0)
.s32:
12c1 : d0 75 __ BNE $1338 ; (bmmc_flood_fill.s12 + 0)
.s31:
12c3 : 88 __ __ DEY
12c4 : b1 0f __ LDA (P2),y ; (clip + 0)
12c6 : c5 43 __ CMP T0 + 0 
12c8 : b0 6e __ BCS $1338 ; (bmmc_flood_fill.s12 + 0)
.s24:
12ca : a5 51 __ LDA T13 + 0 
12cc : c5 52 __ CMP T14 + 0 
12ce : 90 68 __ BCC $1338 ; (bmmc_flood_fill.s12 + 0)
.s25:
12d0 : a5 43 __ LDA T0 + 0 
12d2 : e9 01 __ SBC #$01
12d4 : 85 45 __ STA T3 + 0 
12d6 : 29 f8 __ AND #$f8
12d8 : 85 1b __ STA ACCU + 0 
12da : a9 00 __ LDA #$00
12dc : 85 53 __ STA T16 + 0 
12de : e9 00 __ SBC #$00
12e0 : 85 1c __ STA ACCU + 1 
12e2 : a0 04 __ LDY #$04
12e4 : b1 0d __ LDA (P0),y ; (bm + 0)
12e6 : 20 ec 13 JSR $13ec ; (mul16by8 + 0)
12e9 : 18 __ __ CLC
12ea : a5 48 __ LDA T5 + 0 
12ec : 65 1b __ ADC ACCU + 0 
12ee : 85 1b __ STA ACCU + 0 
12f0 : a5 49 __ LDA T5 + 1 
12f2 : 65 1c __ ADC ACCU + 1 
12f4 : aa __ __ TAX
12f5 : a5 45 __ LDA T3 + 0 
12f7 : 29 07 __ AND #$07
12f9 : 18 __ __ CLC
12fa : 65 1b __ ADC ACCU + 0 
12fc : a8 __ __ TAY
12fd : 90 01 __ BCC $1300 ; (bmmc_flood_fill.s49 + 0)
.s48:
12ff : e8 __ __ INX
.s49:
1300 : 86 1c __ STX ACCU + 1 
1302 : a5 52 __ LDA T14 + 0 
1304 : 85 1b __ STA ACCU + 0 
.l26:
1306 : a5 1b __ LDA ACCU + 0 
1308 : 29 fc __ AND #$fc
130a : 0a __ __ ASL
130b : 85 4c __ STA T9 + 0 
130d : a5 1c __ LDA ACCU + 1 
130f : 69 00 __ ADC #$00
1311 : 85 4d __ STA T9 + 1 
1313 : a5 1b __ LDA ACCU + 0 
1315 : 29 03 __ AND #$03
1317 : 0a __ __ ASL
1318 : aa __ __ TAX
1319 : b1 4c __ LDA (T9 + 0),y 
131b : 45 4e __ EOR T10 + 0 
131d : 3d 84 15 AND $1584,x ; (ormask[0] + 0)
1320 : f0 07 __ BEQ $1329 ; (bmmc_flood_fill.s27 + 0)
.s30:
1322 : a9 00 __ LDA #$00
.s39:
1324 : 85 53 __ STA T16 + 0 
1326 : 4c 30 13 JMP $1330 ; (bmmc_flood_fill.s29 + 0)
.s27:
1329 : a5 53 __ LDA T16 + 0 
132b : d0 03 __ BNE $1330 ; (bmmc_flood_fill.s29 + 0)
132d : 4c d7 13 JMP $13d7 ; (bmmc_flood_fill.s28 + 0)
.s29:
1330 : e6 1b __ INC ACCU + 0 
1332 : a5 51 __ LDA T13 + 0 
1334 : c5 1b __ CMP ACCU + 0 
1336 : b0 ce __ BCS $1306 ; (bmmc_flood_fill.l26 + 0)
.s12:
1338 : 18 __ __ CLC
1339 : a5 43 __ LDA T0 + 0 
133b : 69 01 __ ADC #$01
133d : 85 43 __ STA T0 + 0 
133f : a9 00 __ LDA #$00
1341 : 2a __ __ ROL
1342 : 85 1c __ STA ACCU + 1 
1344 : a0 07 __ LDY #$07
1346 : b1 0f __ LDA (P2),y ; (clip + 0)
1348 : 30 6c __ BMI $13b6 ; (bmmc_flood_fill.s13 + 0)
.s23:
134a : a5 1c __ LDA ACCU + 1 
134c : d1 0f __ CMP (P2),y ; (clip + 0)
134e : d0 05 __ BNE $1355 ; (bmmc_flood_fill.s22 + 0)
.s21:
1350 : a5 43 __ LDA T0 + 0 
1352 : 88 __ __ DEY
1353 : d1 0f __ CMP (P2),y ; (clip + 0)
.s22:
1355 : b0 5f __ BCS $13b6 ; (bmmc_flood_fill.s13 + 0)
.s14:
1357 : a5 51 __ LDA T13 + 0 
1359 : c5 52 __ CMP T14 + 0 
135b : 90 59 __ BCC $13b6 ; (bmmc_flood_fill.s13 + 0)
.s15:
135d : a5 43 __ LDA T0 + 0 
135f : 29 f8 __ AND #$f8
1361 : 85 1b __ STA ACCU + 0 
1363 : a0 04 __ LDY #$04
1365 : b1 0d __ LDA (P0),y ; (bm + 0)
1367 : 20 ec 13 JSR $13ec ; (mul16by8 + 0)
136a : 18 __ __ CLC
136b : a5 48 __ LDA T5 + 0 
136d : 65 1b __ ADC ACCU + 0 
136f : 85 48 __ STA T5 + 0 
1371 : a5 49 __ LDA T5 + 1 
1373 : 65 1c __ ADC ACCU + 1 
1375 : aa __ __ TAX
1376 : a5 43 __ LDA T0 + 0 
1378 : 29 07 __ AND #$07
137a : 18 __ __ CLC
137b : 65 48 __ ADC T5 + 0 
137d : a8 __ __ TAY
137e : 90 01 __ BCC $1381 ; (bmmc_flood_fill.s47 + 0)
.s46:
1380 : e8 __ __ INX
.s47:
1381 : 86 49 __ STX T5 + 1 
1383 : a9 00 __ LDA #$00
1385 : 85 4a __ STA T8 + 0 
.l16:
1387 : a5 52 __ LDA T14 + 0 
1389 : 29 fc __ AND #$fc
138b : 0a __ __ ASL
138c : 85 1b __ STA ACCU + 0 
138e : a5 49 __ LDA T5 + 1 
1390 : 69 00 __ ADC #$00
1392 : 85 1c __ STA ACCU + 1 
1394 : a5 52 __ LDA T14 + 0 
1396 : 29 03 __ AND #$03
1398 : 0a __ __ ASL
1399 : aa __ __ TAX
139a : b1 1b __ LDA (ACCU + 0),y 
139c : 45 4e __ EOR T10 + 0 
139e : 3d 84 15 AND $1584,x ; (ormask[0] + 0)
13a1 : f0 07 __ BEQ $13aa ; (bmmc_flood_fill.s17 + 0)
.s20:
13a3 : a9 00 __ LDA #$00
.s38:
13a5 : 85 4a __ STA T8 + 0 
13a7 : 4c ae 13 JMP $13ae ; (bmmc_flood_fill.s19 + 0)
.s17:
13aa : a5 4a __ LDA T8 + 0 
13ac : f0 15 __ BEQ $13c3 ; (bmmc_flood_fill.s18 + 0)
.s19:
13ae : e6 52 __ INC T14 + 0 
13b0 : a5 51 __ LDA T13 + 0 
13b2 : c5 52 __ CMP T14 + 0 
13b4 : b0 d1 __ BCS $1387 ; (bmmc_flood_fill.l16 + 0)
.s13:
13b6 : a6 50 __ LDX T12 + 0 
13b8 : f0 03 __ BEQ $13bd ; (bmmc_flood_fill.s3 + 0)
13ba : 4c ab 11 JMP $11ab ; (bmmc_flood_fill.l8 + 0)
.s3:
13bd : ad eb c7 LDA $c7eb ; (bmmc_flood_fill@stack + 0)
13c0 : 85 53 __ STA T16 + 0 
13c2 : 60 __ __ RTS
.s18:
13c3 : a5 52 __ LDA T14 + 0 
13c5 : a6 50 __ LDX T12 + 0 
13c7 : e8 __ __ INX
13c8 : e8 __ __ INX
13c9 : 86 50 __ STX T12 + 0 
13cb : 9d fe 15 STA $15fe,x 
13ce : a5 43 __ LDA T0 + 0 
13d0 : 9d ff 15 STA $15ff,x 
13d3 : a9 01 __ LDA #$01
13d5 : d0 ce __ BNE $13a5 ; (bmmc_flood_fill.s38 + 0)
.s28:
13d7 : a5 1b __ LDA ACCU + 0 
13d9 : a6 50 __ LDX T12 + 0 
13db : e8 __ __ INX
13dc : e8 __ __ INX
13dd : 86 50 __ STX T12 + 0 
13df : 9d fe 15 STA $15fe,x 
13e2 : a5 45 __ LDA T3 + 0 
13e4 : 9d ff 15 STA $15ff,x 
13e7 : a9 01 __ LDA #$01
13e9 : 4c 24 13 JMP $1324 ; (bmmc_flood_fill.s39 + 0)
--------------------------------------------------------------------
mul16by8: ; mul16by8
13ec : 4a __ __ LSR
13ed : f0 2e __ BEQ $141d ; (mul16by8 + 49)
13ef : a2 00 __ LDX #$00
13f1 : a0 00 __ LDY #$00
13f3 : 90 13 __ BCC $1408 ; (mul16by8 + 28)
13f5 : a4 1b __ LDY ACCU + 0 
13f7 : a6 1c __ LDX ACCU + 1 
13f9 : b0 0d __ BCS $1408 ; (mul16by8 + 28)
13fb : 85 02 __ STA $02 
13fd : 18 __ __ CLC
13fe : 98 __ __ TYA
13ff : 65 1b __ ADC ACCU + 0 
1401 : a8 __ __ TAY
1402 : 8a __ __ TXA
1403 : 65 1c __ ADC ACCU + 1 
1405 : aa __ __ TAX
1406 : a5 02 __ LDA $02 
1408 : 06 1b __ ASL ACCU + 0 
140a : 26 1c __ ROL ACCU + 1 
140c : 4a __ __ LSR
140d : 90 f9 __ BCC $1408 ; (mul16by8 + 28)
140f : d0 ea __ BNE $13fb ; (mul16by8 + 15)
1411 : 18 __ __ CLC
1412 : 98 __ __ TYA
1413 : 65 1b __ ADC ACCU + 0 
1415 : 85 1b __ STA ACCU + 0 
1417 : 8a __ __ TXA
1418 : 65 1c __ ADC ACCU + 1 
141a : 85 1c __ STA ACCU + 1 
141c : 60 __ __ RTS
141d : b0 04 __ BCS $1423 ; (mul16by8 + 55)
141f : 85 1b __ STA ACCU + 0 
1421 : 85 1c __ STA ACCU + 1 
1423 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
1424 : a0 00 __ LDY #$00
1426 : 84 06 __ STY WORK + 3 
1428 : a5 03 __ LDA WORK + 0 
142a : a6 04 __ LDX WORK + 1 
142c : f0 1c __ BEQ $144a ; (mul16 + 38)
142e : 38 __ __ SEC
142f : 6a __ __ ROR
1430 : 90 0d __ BCC $143f ; (mul16 + 27)
1432 : aa __ __ TAX
1433 : 18 __ __ CLC
1434 : 98 __ __ TYA
1435 : 65 1b __ ADC ACCU + 0 
1437 : a8 __ __ TAY
1438 : a5 06 __ LDA WORK + 3 
143a : 65 1c __ ADC ACCU + 1 
143c : 85 06 __ STA WORK + 3 
143e : 8a __ __ TXA
143f : 06 1b __ ASL ACCU + 0 
1441 : 26 1c __ ROL ACCU + 1 
1443 : 4a __ __ LSR
1444 : 90 f9 __ BCC $143f ; (mul16 + 27)
1446 : d0 ea __ BNE $1432 ; (mul16 + 14)
1448 : a5 04 __ LDA WORK + 1 
144a : 4a __ __ LSR
144b : 90 0d __ BCC $145a ; (mul16 + 54)
144d : aa __ __ TAX
144e : 18 __ __ CLC
144f : 98 __ __ TYA
1450 : 65 1b __ ADC ACCU + 0 
1452 : a8 __ __ TAY
1453 : a5 06 __ LDA WORK + 3 
1455 : 65 1c __ ADC ACCU + 1 
1457 : 85 06 __ STA WORK + 3 
1459 : 8a __ __ TXA
145a : 06 1b __ ASL ACCU + 0 
145c : 26 1c __ ROL ACCU + 1 
145e : 4a __ __ LSR
145f : b0 ec __ BCS $144d ; (mul16 + 41)
1461 : d0 f7 __ BNE $145a ; (mul16 + 54)
1463 : 84 05 __ STY WORK + 2 
1465 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
1466 : a5 1c __ LDA ACCU + 1 
1468 : d0 31 __ BNE $149b ; (divmod + 53)
146a : a5 04 __ LDA WORK + 1 
146c : d0 1e __ BNE $148c ; (divmod + 38)
146e : 85 06 __ STA WORK + 3 
1470 : a2 04 __ LDX #$04
1472 : 06 1b __ ASL ACCU + 0 
1474 : 2a __ __ ROL
1475 : c5 03 __ CMP WORK + 0 
1477 : 90 02 __ BCC $147b ; (divmod + 21)
1479 : e5 03 __ SBC WORK + 0 
147b : 26 1b __ ROL ACCU + 0 
147d : 2a __ __ ROL
147e : c5 03 __ CMP WORK + 0 
1480 : 90 02 __ BCC $1484 ; (divmod + 30)
1482 : e5 03 __ SBC WORK + 0 
1484 : 26 1b __ ROL ACCU + 0 
1486 : ca __ __ DEX
1487 : d0 eb __ BNE $1474 ; (divmod + 14)
1489 : 85 05 __ STA WORK + 2 
148b : 60 __ __ RTS
148c : a5 1b __ LDA ACCU + 0 
148e : 85 05 __ STA WORK + 2 
1490 : a5 1c __ LDA ACCU + 1 
1492 : 85 06 __ STA WORK + 3 
1494 : a9 00 __ LDA #$00
1496 : 85 1b __ STA ACCU + 0 
1498 : 85 1c __ STA ACCU + 1 
149a : 60 __ __ RTS
149b : a5 04 __ LDA WORK + 1 
149d : d0 1f __ BNE $14be ; (divmod + 88)
149f : a5 03 __ LDA WORK + 0 
14a1 : 30 1b __ BMI $14be ; (divmod + 88)
14a3 : a9 00 __ LDA #$00
14a5 : 85 06 __ STA WORK + 3 
14a7 : a2 10 __ LDX #$10
14a9 : 06 1b __ ASL ACCU + 0 
14ab : 26 1c __ ROL ACCU + 1 
14ad : 2a __ __ ROL
14ae : c5 03 __ CMP WORK + 0 
14b0 : 90 02 __ BCC $14b4 ; (divmod + 78)
14b2 : e5 03 __ SBC WORK + 0 
14b4 : 26 1b __ ROL ACCU + 0 
14b6 : 26 1c __ ROL ACCU + 1 
14b8 : ca __ __ DEX
14b9 : d0 f2 __ BNE $14ad ; (divmod + 71)
14bb : 85 05 __ STA WORK + 2 
14bd : 60 __ __ RTS
14be : a9 00 __ LDA #$00
14c0 : 85 05 __ STA WORK + 2 
14c2 : 85 06 __ STA WORK + 3 
14c4 : 84 02 __ STY $02 
14c6 : a0 10 __ LDY #$10
14c8 : 18 __ __ CLC
14c9 : 26 1b __ ROL ACCU + 0 
14cb : 26 1c __ ROL ACCU + 1 
14cd : 26 05 __ ROL WORK + 2 
14cf : 26 06 __ ROL WORK + 3 
14d1 : 38 __ __ SEC
14d2 : a5 05 __ LDA WORK + 2 
14d4 : e5 03 __ SBC WORK + 0 
14d6 : aa __ __ TAX
14d7 : a5 06 __ LDA WORK + 3 
14d9 : e5 04 __ SBC WORK + 1 
14db : 90 04 __ BCC $14e1 ; (divmod + 123)
14dd : 86 05 __ STX WORK + 2 
14df : 85 06 __ STA WORK + 3 
14e1 : 88 __ __ DEY
14e2 : d0 e5 __ BNE $14c9 ; (divmod + 99)
14e4 : 26 1b __ ROL ACCU + 0 
14e6 : 26 1c __ ROL ACCU + 1 
14e8 : a4 02 __ LDY $02 
14ea : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
14eb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
lmask:
14ec : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
14f4 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
seed:
14fc : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
MixedColors:
1500 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 44 11 44 11 44 11 44 : .........D.D.D.D
1510 : __ __ __ BYT 22 88 22 88 22 88 22 88 33 cc 33 cc 33 cc 33 cc : ".".".".3.3.3.3.
1520 : __ __ __ BYT 44 11 44 11 44 11 44 11 55 55 55 55 55 55 55 55 : D.D.D.D.UUUUUUUU
1530 : __ __ __ BYT 66 99 66 99 66 99 66 99 77 dd 77 dd 77 dd 77 dd : f.f.f.f.w.w.w.w.
1540 : __ __ __ BYT 88 22 88 22 88 22 88 22 99 66 99 66 99 66 99 66 : .".".".".f.f.f.f
1550 : __ __ __ BYT aa aa aa aa aa aa aa aa bb ee bb ee bb ee bb ee : ................
1560 : __ __ __ BYT cc 33 cc 33 cc 33 cc 33 dd 77 dd 77 dd 77 dd 77 : .3.3.3.3.w.w.w.w
1570 : __ __ __ BYT ee bb ee bb ee bb ee bb ff ff ff ff ff ff ff ff : ................
--------------------------------------------------------------------
cbytes:
1580 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
ormask:
1584 : __ __ __ BYT c0 c0 30 30 0c 0c 03 03                         : ..00....
--------------------------------------------------------------------
andmask:
158c : __ __ __ BYT 3f 3f cf cf f3 f3 fc fc                         : ??......
--------------------------------------------------------------------
sbm:
1594 : __ __ __ BSS	8
--------------------------------------------------------------------
BLIT_CODE:
1600 : __ __ __ BSS	224
