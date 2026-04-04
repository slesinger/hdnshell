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
080e : 8e 3a 30 STX $303a ; (spentry + 0)
0811 : a2 32 __ LDX #$32
0813 : a0 d9 __ LDY #$d9
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 36 __ CPX #$36
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
083b : a9 a2 __ LDA #$a2
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
;  96, "/home/honza/projects/c64/projects/oscar64/samples/hires/qsort.c"
.s1:
0880 : a2 04 __ LDX #$04
0882 : b5 53 __ LDA T0 + 0,x 
0884 : 9d a4 9f STA $9fa4,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
088a : 38 __ __ SEC
088b : a5 23 __ LDA SP + 0 
088d : e9 06 __ SBC #$06
088f : 85 23 __ STA SP + 0 
0891 : b0 02 __ BCS $0895 ; (main.s4 + 0)
0893 : c6 24 __ DEC SP + 1 
.s4:
0895 : 20 99 09 JSR $0999 ; (init.s4 + 0)
0898 : 20 f7 0a JSR $0af7 ; (fill.s4 + 0)
089b : 20 03 0b JSR $0b03 ; (shuffle.s4 + 0)
089e : a9 00 __ LDA #$00
08a0 : 85 53 __ STA T0 + 0 
.l6:
08a2 : 8d e6 9f STA $9fe6 ; (sstack + 0)
08a5 : a9 00 __ LDA #$00
08a7 : 8d e7 9f STA $9fe7 ; (sstack + 1)
08aa : 20 5a 0b JSR $0b5a ; (draw.s1 + 0)
08ad : e6 53 __ INC T0 + 0 
08af : a5 53 __ LDA T0 + 0 
08b1 : c9 a0 __ CMP #$a0
08b3 : 90 ed __ BCC $08a2 ; (main.l6 + 0)
.s5:
08b5 : a9 00 __ LDA #$00
08b7 : a0 02 __ LDY #$02
08b9 : 91 23 __ STA (SP + 0),y 
08bb : c8 __ __ INY
08bc : 91 23 __ STA (SP + 0),y 
08be : a9 9f __ LDA #$9f
08c0 : c8 __ __ INY
08c1 : 91 23 __ STA (SP + 0),y 
08c3 : a9 00 __ LDA #$00
08c5 : c8 __ __ INY
08c6 : 91 23 __ STA (SP + 0),y 
08c8 : 20 bf 10 JSR $10bf ; (clock.s4 + 0)
08cb : a5 1b __ LDA ACCU + 0 
08cd : 85 54 __ STA T1 + 0 
08cf : a5 1c __ LDA ACCU + 1 
08d1 : 85 55 __ STA T1 + 1 
08d3 : a5 1d __ LDA ACCU + 2 
08d5 : 85 56 __ STA T1 + 2 
08d7 : a5 1e __ LDA ACCU + 3 
08d9 : 85 57 __ STA T1 + 3 
08db : 20 d0 10 JSR $10d0 ; (partition.s1 + 0)
08de : a9 ae __ LDA #$ae
08e0 : 8d ee 9f STA $9fee ; (sstack + 8)
08e3 : a9 9f __ LDA #$9f
08e5 : 8d ef 9f STA $9fef ; (sstack + 9)
08e8 : a9 df __ LDA #$df
08ea : 8d f0 9f STA $9ff0 ; (sstack + 10)
08ed : a9 1e __ LDA #$1e
08ef : 8d f1 9f STA $9ff1 ; (sstack + 11)
08f2 : 20 bf 10 JSR $10bf ; (clock.s4 + 0)
08f5 : 38 __ __ SEC
08f6 : a5 1b __ LDA ACCU + 0 
08f8 : e5 54 __ SBC T1 + 0 
08fa : 85 1b __ STA ACCU + 0 
08fc : a5 1c __ LDA ACCU + 1 
08fe : e5 55 __ SBC T1 + 1 
0900 : 85 1c __ STA ACCU + 1 
0902 : a5 1d __ LDA ACCU + 2 
0904 : e5 56 __ SBC T1 + 2 
0906 : 85 1d __ STA ACCU + 2 
0908 : a5 1e __ LDA ACCU + 3 
090a : e5 57 __ SBC T1 + 3 
090c : 85 1e __ STA ACCU + 3 
090e : 20 f5 2e JSR $2ef5 ; (sint32_to_float + 0)
0911 : a9 00 __ LDA #$00
0913 : 85 03 __ STA WORK + 0 
0915 : 85 04 __ STA WORK + 1 
0917 : a9 70 __ LDA #$70
0919 : 85 05 __ STA WORK + 2 
091b : a9 42 __ LDA #$42
091d : 85 06 __ STA WORK + 3 
091f : 20 e2 2a JSR $2ae2 ; (freg + 20)
0922 : 20 c8 2c JSR $2cc8 ; (crt_fdiv + 0)
0925 : a5 1b __ LDA ACCU + 0 
0927 : 8d f2 9f STA $9ff2 ; (sstack + 12)
092a : a5 1c __ LDA ACCU + 1 
092c : 8d f3 9f STA $9ff3 ; (sstack + 13)
092f : a5 1d __ LDA ACCU + 2 
0931 : 8d f4 9f STA $9ff4 ; (sstack + 14)
0934 : a5 1e __ LDA ACCU + 3 
0936 : 8d f5 9f STA $9ff5 ; (sstack + 15)
0939 : 20 00 12 JSR $1200 ; (sprintf.s1 + 0)
093c : a9 ae __ LDA #$ae
093e : 85 0d __ STA P0 
0940 : a9 9f __ LDA #$9f
0942 : 85 0e __ STA P1 
0944 : 20 22 2a JSR $2a22 ; (strlen.s4 + 0)
0947 : a9 00 __ LDA #$00
0949 : 8d f9 9f STA $9ff9 ; (sstack + 19)
094c : 8d fb 9f STA $9ffb ; (sstack + 21)
094f : a9 04 __ LDA #$04
0951 : 8d f8 9f STA $9ff8 ; (sstack + 18)
0954 : a9 aa __ LDA #$aa
0956 : 8d fa 9f STA $9ffa ; (sstack + 20)
0959 : a9 ae __ LDA #$ae
095b : 8d fc 9f STA $9ffc ; (sstack + 22)
095e : a9 9f __ LDA #$9f
0960 : 8d fd 9f STA $9ffd ; (sstack + 23)
0963 : a5 1b __ LDA ACCU + 0 
0965 : 8d fe 9f STA $9ffe ; (sstack + 24)
0968 : a9 08 __ LDA #$08
096a : 8d ff 9f STA $9fff ; (sstack + 25)
096d : a9 d9 __ LDA #$d9
096f : 8d f6 9f STA $9ff6 ; (sstack + 16)
0972 : a9 32 __ LDA #$32
0974 : 8d f7 9f STA $9ff7 ; (sstack + 17)
0977 : 20 f1 1e JSR $1ef1 ; (bmu_put_chars.s1 + 0)
097a : 20 3e 2a JSR $2a3e ; (done.s4 + 0)
097d : a9 00 __ LDA #$00
097f : 85 1b __ STA ACCU + 0 
0981 : 85 1c __ STA ACCU + 1 
.s3:
0983 : 18 __ __ CLC
0984 : a5 23 __ LDA SP + 0 
0986 : 69 06 __ ADC #$06
0988 : 85 23 __ STA SP + 0 
098a : 90 02 __ BCC $098e ; (main.s3 + 11)
098c : e6 24 __ INC SP + 1 
098e : a2 04 __ LDX #$04
0990 : bd a4 9f LDA $9fa4,x ; (main@stack + 0)
0993 : 95 53 __ STA T0 + 0,x 
0995 : ca __ __ DEX
0996 : 10 f8 __ BPL $0990 ; (main.s3 + 13)
0998 : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  15, "/home/honza/projects/c64/projects/oscar64/samples/hires/qsort.c"
.s4:
0999 : 20 05 0a JSR $0a05 ; (mmap_trampoline.s4 + 0)
099c : a9 00 __ LDA #$00
099e : 85 0f __ STA P2 
09a0 : 85 10 __ STA P3 
09a2 : a9 30 __ LDA #$30
09a4 : 85 01 __ STA $01 
09a6 : a9 40 __ LDA #$40
09a8 : 85 11 __ STA P4 
09aa : a9 1f __ LDA #$1f
09ac : 85 12 __ STA P5 
09ae : a9 01 __ LDA #$01
09b0 : a2 fa __ LDX #$fa
.l6:
09b2 : ca __ __ DEX
09b3 : 9d 00 d0 STA $d000,x 
09b6 : 9d fa d0 STA $d0fa,x 
09b9 : 9d f4 d1 STA $d1f4,x 
09bc : 9d ee d2 STA $d2ee,x 
09bf : d0 f1 __ BNE $09b2 ; (init.l6 + 0)
.s5:
09c1 : a9 00 __ LDA #$00
09c3 : 85 0d __ STA P0 
09c5 : a9 e0 __ LDA #$e0
09c7 : 85 0e __ STA P1 
09c9 : 20 4f 0a JSR $0a4f ; (memset.s4 + 0)
09cc : a9 00 __ LDA #$00
09ce : 85 10 __ STA P3 
09d0 : 85 0e __ STA P1 
09d2 : a9 35 __ LDA #$35
09d4 : 85 01 __ STA $01 
09d6 : a9 03 __ LDA #$03
09d8 : 85 0d __ STA P0 
09da : a9 e0 __ LDA #$e0
09dc : 85 11 __ STA P4 
09de : a9 d0 __ LDA #$d0
09e0 : 85 0f __ STA P2 
09e2 : 20 73 0a JSR $0a73 ; (vic_setmode.s4 + 0)
09e5 : a9 00 __ LDA #$00
09e7 : 85 0f __ STA P2 
09e9 : a9 e0 __ LDA #$e0
09eb : 85 10 __ STA P3 
09ed : a9 28 __ LDA #$28
09ef : 85 11 __ STA P4 
09f1 : a9 19 __ LDA #$19
09f3 : 85 12 __ STA P5 
09f5 : a9 01 __ LDA #$01
09f7 : 8d 20 d0 STA $d020 
09fa : a9 d9 __ LDA #$d9
09fc : 85 0d __ STA P0 
09fe : a9 32 __ LDA #$32
0a00 : 85 0e __ STA P1 
0a02 : 4c c5 0a JMP $0ac5 ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0a05 : a9 1a __ LDA #$1a
0a07 : 8d fa ff STA $fffa 
0a0a : a9 0a __ LDA #$0a
0a0c : 8d fb ff STA $fffb 
0a0f : a9 38 __ LDA #$38
0a11 : 8d fe ff STA $fffe 
0a14 : a9 0a __ LDA #$0a
0a16 : 8d ff ff STA $ffff 
.s3:
0a19 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0a1a : 48 __ __ PHA
0a1b : 8a __ __ TXA
0a1c : 48 __ __ PHA
0a1d : a9 0a __ LDA #$0a
0a1f : 48 __ __ PHA
0a20 : a9 31 __ LDA #$31
0a22 : 48 __ __ PHA
0a23 : ba __ __ TSX
0a24 : bd 05 01 LDA $0105,x 
0a27 : 48 __ __ PHA
0a28 : a6 01 __ LDX $01 
0a2a : a9 36 __ LDA #$36
0a2c : 85 01 __ STA $01 
0a2e : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0a31 : 86 01 __ STX $01 
0a33 : 68 __ __ PLA
0a34 : aa __ __ TAX
0a35 : 68 __ __ PLA
0a36 : 40 __ __ RTI
0a37 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0a38 : 48 __ __ PHA
0a39 : 8a __ __ TXA
0a3a : 48 __ __ PHA
0a3b : a9 0a __ LDA #$0a
0a3d : 48 __ __ PHA
0a3e : a9 31 __ LDA #$31
0a40 : 48 __ __ PHA
0a41 : ba __ __ TSX
0a42 : bd 05 01 LDA $0105,x 
0a45 : 48 __ __ PHA
0a46 : a6 01 __ LDX $01 
0a48 : a9 36 __ LDA #$36
0a4a : 85 01 __ STA $01 
0a4c : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0a4f : a5 0f __ LDA P2 
0a51 : a6 12 __ LDX P5 
0a53 : f0 0c __ BEQ $0a61 ; (memset.s4 + 18)
0a55 : a0 00 __ LDY #$00
0a57 : 91 0d __ STA (P0),y ; (dst + 0)
0a59 : c8 __ __ INY
0a5a : d0 fb __ BNE $0a57 ; (memset.s4 + 8)
0a5c : e6 0e __ INC P1 ; (dst + 1)
0a5e : ca __ __ DEX
0a5f : d0 f6 __ BNE $0a57 ; (memset.s4 + 8)
0a61 : a4 11 __ LDY P4 
0a63 : f0 05 __ BEQ $0a6a ; (memset.s4 + 27)
0a65 : 88 __ __ DEY
0a66 : 91 0d __ STA (P0),y ; (dst + 0)
0a68 : d0 fb __ BNE $0a65 ; (memset.s4 + 22)
0a6a : a5 0d __ LDA P0 ; (dst + 0)
0a6c : 85 1b __ STA ACCU + 0 
0a6e : a5 0e __ LDA P1 ; (dst + 1)
0a70 : 85 1c __ STA ACCU + 1 
.s3:
0a72 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0a73 : a4 0d __ LDY P0 ; (mode + 0)
0a75 : c0 02 __ CPY #$02
0a77 : d0 09 __ BNE $0a82 ; (vic_setmode.s5 + 0)
.s10:
0a79 : a9 5b __ LDA #$5b
0a7b : 8d 11 d0 STA $d011 
.s8:
0a7e : a9 08 __ LDA #$08
0a80 : d0 0c __ BNE $0a8e ; (vic_setmode.s7 + 0)
.s5:
0a82 : b0 36 __ BCS $0aba ; (vic_setmode.s6 + 0)
.s9:
0a84 : a9 1b __ LDA #$1b
0a86 : 8d 11 d0 STA $d011 
0a89 : 98 __ __ TYA
0a8a : f0 f2 __ BEQ $0a7e ; (vic_setmode.s8 + 0)
.s11:
0a8c : a9 18 __ LDA #$18
.s7:
0a8e : 8d 16 d0 STA $d016 
0a91 : ad 00 dd LDA $dd00 
0a94 : 29 fc __ AND #$fc
0a96 : 85 1b __ STA ACCU + 0 
0a98 : a5 0f __ LDA P2 ; (text + 1)
0a9a : 0a __ __ ASL
0a9b : 2a __ __ ROL
0a9c : 29 01 __ AND #$01
0a9e : 2a __ __ ROL
0a9f : 49 03 __ EOR #$03
0aa1 : 05 1b __ ORA ACCU + 0 
0aa3 : 8d 00 dd STA $dd00 
0aa6 : a5 0f __ LDA P2 ; (text + 1)
0aa8 : 29 3c __ AND #$3c
0aaa : 0a __ __ ASL
0aab : 0a __ __ ASL
0aac : 85 1b __ STA ACCU + 0 
0aae : a5 11 __ LDA P4 ; (font + 1)
0ab0 : 29 38 __ AND #$38
0ab2 : 4a __ __ LSR
0ab3 : 4a __ __ LSR
0ab4 : 05 1b __ ORA ACCU + 0 
0ab6 : 8d 18 d0 STA $d018 
.s3:
0ab9 : 60 __ __ RTS
.s6:
0aba : a9 3b __ LDA #$3b
0abc : 8d 11 d0 STA $d011 
0abf : c0 03 __ CPY #$03
0ac1 : d0 c9 __ BNE $0a8c ; (vic_setmode.s11 + 0)
0ac3 : f0 b9 __ BEQ $0a7e ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0ac5 : a5 0f __ LDA P2 ; (data + 0)
0ac7 : a0 00 __ LDY #$00
0ac9 : 91 0d __ STA (P0),y ; (bm + 0)
0acb : a5 10 __ LDA P3 ; (data + 1)
0acd : c8 __ __ INY
0ace : 91 0d __ STA (P0),y ; (bm + 0)
0ad0 : a9 00 __ LDA #$00
0ad2 : c8 __ __ INY
0ad3 : 91 0d __ STA (P0),y ; (bm + 0)
0ad5 : c8 __ __ INY
0ad6 : 91 0d __ STA (P0),y ; (bm + 0)
0ad8 : a5 11 __ LDA P4 ; (cw + 0)
0ada : c8 __ __ INY
0adb : 91 0d __ STA (P0),y ; (bm + 0)
0add : a5 12 __ LDA P5 ; (ch + 0)
0adf : c8 __ __ INY
0ae0 : 91 0d __ STA (P0),y ; (bm + 0)
0ae2 : a9 00 __ LDA #$00
0ae4 : 06 11 __ ASL P4 ; (cw + 0)
0ae6 : 2a __ __ ROL
0ae7 : 06 11 __ ASL P4 ; (cw + 0)
0ae9 : 2a __ __ ROL
0aea : 06 11 __ ASL P4 ; (cw + 0)
0aec : 2a __ __ ROL
0aed : a0 07 __ LDY #$07
0aef : 91 0d __ STA (P0),y ; (bm + 0)
0af1 : a5 11 __ LDA P4 ; (cw + 0)
0af3 : 88 __ __ DEY
0af4 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0af6 : 60 __ __ RTS
--------------------------------------------------------------------
fill: ; fill()->void
;  43, "/home/honza/projects/c64/projects/oscar64/samples/hires/qsort.c"
.s4:
0af7 : a2 00 __ LDX #$00
.l5:
0af9 : 8a __ __ TXA
0afa : 9d 00 33 STA $3300,x ; (field[0] + 0)
0afd : e8 __ __ INX
0afe : e0 a0 __ CPX #$a0
0b00 : d0 f7 __ BNE $0af9 ; (fill.l5 + 0)
.s3:
0b02 : 60 __ __ RTS
--------------------------------------------------------------------
shuffle: ; shuffle()->void
;  49, "/home/honza/projects/c64/projects/oscar64/samples/hires/qsort.c"
.s4:
0b03 : a9 00 __ LDA #$00
0b05 : 85 43 __ STA T2 + 0 
.l5:
0b07 : 20 33 0b JSR $0b33 ; (rand.s4 + 0)
0b0a : a6 43 __ LDX T2 + 0 
0b0c : bd 00 33 LDA $3300,x ; (field[0] + 0)
0b0f : 85 44 __ STA T3 + 0 
0b11 : a9 a0 __ LDA #$a0
0b13 : 85 03 __ STA WORK + 0 
0b15 : a9 00 __ LDA #$00
0b17 : 85 04 __ STA WORK + 1 
0b19 : 20 b0 2d JSR $2db0 ; (divmod + 0)
0b1c : a4 05 __ LDY WORK + 2 
0b1e : b9 00 33 LDA $3300,y ; (field[0] + 0)
0b21 : a6 43 __ LDX T2 + 0 
0b23 : e8 __ __ INX
0b24 : 86 43 __ STX T2 + 0 
0b26 : 9d ff 32 STA $32ff,x 
0b29 : a5 44 __ LDA T3 + 0 
0b2b : 99 00 33 STA $3300,y ; (field[0] + 0)
0b2e : e0 a0 __ CPX #$a0
0b30 : 90 d5 __ BCC $0b07 ; (shuffle.l5 + 0)
.s3:
0b32 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0b33 : ad 3c 30 LDA $303c ; (seed + 1)
0b36 : 4a __ __ LSR
0b37 : ad 3b 30 LDA $303b ; (seed + 0)
0b3a : 6a __ __ ROR
0b3b : aa __ __ TAX
0b3c : a9 00 __ LDA #$00
0b3e : 6a __ __ ROR
0b3f : 4d 3b 30 EOR $303b ; (seed + 0)
0b42 : 85 1b __ STA ACCU + 0 
0b44 : 8a __ __ TXA
0b45 : 4d 3c 30 EOR $303c ; (seed + 1)
0b48 : 85 1c __ STA ACCU + 1 
0b4a : 4a __ __ LSR
0b4b : 45 1b __ EOR ACCU + 0 
0b4d : 8d 3b 30 STA $303b ; (seed + 0)
0b50 : 85 1b __ STA ACCU + 0 
0b52 : 45 1c __ EOR ACCU + 1 
0b54 : 8d 3c 30 STA $303c ; (seed + 1)
0b57 : 85 1c __ STA ACCU + 1 
.s3:
0b59 : 60 __ __ RTS
--------------------------------------------------------------------
draw: ; draw(u16)->void
;  60, "/home/honza/projects/c64/projects/oscar64/samples/hires/qsort.c"
.s1:
0b5a : a5 53 __ LDA T3 + 0 
0b5c : 8d e0 9f STA $9fe0 ; (draw@stack + 0)
.s4:
0b5f : a9 00 __ LDA #$00
0b61 : 85 11 __ STA P4 
0b63 : 85 12 __ STA P5 
0b65 : 85 17 __ STA P10 
0b67 : 85 18 __ STA P11 
0b69 : ad e6 9f LDA $9fe6 ; (sstack + 0)
0b6c : 85 53 __ STA T3 + 0 
0b6e : aa __ __ TAX
0b6f : 0a __ __ ASL
0b70 : 85 0f __ STA P2 
0b72 : 85 13 __ STA P6 
0b74 : a9 d9 __ LDA #$d9
0b76 : 85 0d __ STA P0 
0b78 : a9 32 __ LDA #$32
0b7a : 85 0e __ STA P1 
0b7c : a9 00 __ LDA #$00
0b7e : 85 16 __ STA P9 
0b80 : 2a __ __ ROL
0b81 : 85 10 __ STA P3 
0b83 : 85 14 __ STA P7 
0b85 : bd 00 33 LDA $3300,x ; (field[0] + 0)
0b88 : 85 15 __ STA P8 
0b8a : 20 a9 0b JSR $0ba9 ; (bmu_line.s4 + 0)
0b8d : a9 a0 __ LDA #$a0
0b8f : 85 15 __ STA P8 
0b91 : a9 ff __ LDA #$ff
0b93 : 85 17 __ STA P10 
0b95 : a9 00 __ LDA #$00
0b97 : 85 18 __ STA P11 
0b99 : a6 53 __ LDX T3 + 0 
0b9b : bd 00 33 LDA $3300,x ; (field[0] + 0)
0b9e : 85 11 __ STA P4 
0ba0 : 20 a9 0b JSR $0ba9 ; (bmu_line.s4 + 0)
.s3:
0ba3 : ad e0 9f LDA $9fe0 ; (draw@stack + 0)
0ba6 : 85 53 __ STA T3 + 0 
0ba8 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0ba9 : a5 17 __ LDA P10 ; (pattern + 0)
0bab : f0 03 __ BEQ $0bb0 ; (bmu_line.s5 + 0)
0bad : 4c af 10 JMP $10af ; (bmu_line.s59 + 0)
.s5:
0bb0 : a5 18 __ LDA P11 ; (op + 0)
0bb2 : f0 01 __ BEQ $0bb5 ; (bmu_line.s6 + 0)
0bb4 : 60 __ __ RTS
.s6:
0bb5 : c6 17 __ DEC P10 ; (pattern + 0)
0bb7 : a9 02 __ LDA #$02
.s63:
0bb9 : 85 18 __ STA P11 ; (op + 0)
.s7:
0bbb : 38 __ __ SEC
0bbc : a5 13 __ LDA P6 ; (x1 + 0)
0bbe : e5 0f __ SBC P2 ; (x0 + 0)
0bc0 : 85 46 __ STA T2 + 0 
0bc2 : a5 14 __ LDA P7 ; (x1 + 1)
0bc4 : e5 10 __ SBC P3 ; (x0 + 1)
0bc6 : 85 47 __ STA T2 + 1 
0bc8 : 10 11 __ BPL $0bdb ; (bmu_line.s8 + 0)
.s58:
0bca : 38 __ __ SEC
0bcb : a9 00 __ LDA #$00
0bcd : e5 46 __ SBC T2 + 0 
0bcf : 85 46 __ STA T2 + 0 
0bd1 : a9 00 __ LDA #$00
0bd3 : e5 47 __ SBC T2 + 1 
0bd5 : 85 47 __ STA T2 + 1 
0bd7 : a9 01 __ LDA #$01
0bd9 : d0 02 __ BNE $0bdd ; (bmu_line.s9 + 0)
.s8:
0bdb : a9 00 __ LDA #$00
.s9:
0bdd : 85 51 __ STA T10 + 0 
0bdf : 38 __ __ SEC
0be0 : a5 15 __ LDA P8 ; (y1 + 0)
0be2 : e5 11 __ SBC P4 ; (y0 + 0)
0be4 : 85 43 __ STA T0 + 0 
0be6 : a5 16 __ LDA P9 ; (y1 + 1)
0be8 : e5 12 __ SBC P5 ; (y0 + 1)
0bea : 85 44 __ STA T0 + 1 
0bec : 10 11 __ BPL $0bff ; (bmu_line.s10 + 0)
.s57:
0bee : 38 __ __ SEC
0bef : a9 00 __ LDA #$00
0bf1 : e5 43 __ SBC T0 + 0 
0bf3 : 85 43 __ STA T0 + 0 
0bf5 : a9 00 __ LDA #$00
0bf7 : e5 44 __ SBC T0 + 1 
0bf9 : 85 44 __ STA T0 + 1 
0bfb : a9 01 __ LDA #$01
0bfd : d0 02 __ BNE $0c01 ; (bmu_line.s11 + 0)
.s10:
0bff : a9 00 __ LDA #$00
.s11:
0c01 : 85 52 __ STA T11 + 0 
0c03 : a5 44 __ LDA T0 + 1 
0c05 : c5 47 __ CMP T2 + 1 
0c07 : d0 04 __ BNE $0c0d ; (bmu_line.s56 + 0)
.s55:
0c09 : a5 43 __ LDA T0 + 0 
0c0b : c5 46 __ CMP T2 + 0 
.s56:
0c0d : b0 06 __ BCS $0c15 ; (bmu_line.s12 + 0)
.s54:
0c0f : a5 47 __ LDA T2 + 1 
0c11 : a6 46 __ LDX T2 + 0 
0c13 : 90 04 __ BCC $0c19 ; (bmu_line.s13 + 0)
.s12:
0c15 : a5 44 __ LDA T0 + 1 
0c17 : a6 43 __ LDX T0 + 0 
.s13:
0c19 : 86 49 __ STX T4 + 0 
0c1b : 85 4a __ STA T4 + 1 
0c1d : 38 __ __ SEC
0c1e : a5 43 __ LDA T0 + 0 
0c20 : e5 46 __ SBC T2 + 0 
0c22 : 85 4b __ STA T5 + 0 
0c24 : a5 44 __ LDA T0 + 1 
0c26 : e5 47 __ SBC T2 + 1 
0c28 : 85 4c __ STA T5 + 1 
0c2a : a5 4b __ LDA T5 + 0 
0c2c : 4a __ __ LSR
0c2d : b0 0c __ BCS $0c3b ; (bmu_line.s53 + 0)
.s14:
0c2f : a5 4c __ LDA T5 + 1 
0c31 : c9 80 __ CMP #$80
0c33 : 6a __ __ ROR
0c34 : 85 4c __ STA T5 + 1 
0c36 : 66 4b __ ROR T5 + 0 
0c38 : 4c 43 0c JMP $0c43 ; (bmu_line.s15 + 0)
.s53:
0c3b : 06 43 __ ASL T0 + 0 
0c3d : 26 44 __ ROL T0 + 1 
0c3f : 06 46 __ ASL T2 + 0 
0c41 : 26 47 __ ROL T2 + 1 
.s15:
0c43 : a0 00 __ LDY #$00
0c45 : b1 0d __ LDA (P0),y ; (bm + 0)
0c47 : 85 4d __ STA T7 + 0 
0c49 : c8 __ __ INY
0c4a : b1 0d __ LDA (P0),y ; (bm + 0)
0c4c : 85 4e __ STA T7 + 1 
0c4e : a0 04 __ LDY #$04
0c50 : b1 0d __ LDA (P0),y ; (bm + 0)
0c52 : aa __ __ TAX
0c53 : 0a __ __ ASL
0c54 : 85 4f __ STA T8 + 0 
0c56 : a9 a0 __ LDA #$a0
0c58 : 8d 00 34 STA $3400 ; (BLIT_CODE[0] + 0)
0c5b : a9 a2 __ LDA #$a2
0c5d : 8d 02 34 STA $3402 ; (BLIT_CODE[0] + 2)
0c60 : a9 a5 __ LDA #$a5
0c62 : 8d 04 34 STA $3404 ; (BLIT_CODE[0] + 4)
0c65 : a9 0a __ LDA #$0a
0c67 : 8d 05 34 STA $3405 ; (BLIT_CODE[0] + 5)
0c6a : a9 00 __ LDA #$00
0c6c : 2a __ __ ROL
0c6d : 06 4f __ ASL T8 + 0 
0c6f : 2a __ __ ROL
0c70 : 06 4f __ ASL T8 + 0 
0c72 : 2a __ __ ROL
0c73 : 85 50 __ STA T8 + 1 
0c75 : a5 52 __ LDA T11 + 0 
0c77 : f0 0d __ BEQ $0c86 ; (bmu_line.s16 + 0)
.s52:
0c79 : 38 __ __ SEC
0c7a : a9 00 __ LDA #$00
0c7c : e5 4f __ SBC T8 + 0 
0c7e : 85 4f __ STA T8 + 0 
0c80 : a9 00 __ LDA #$00
0c82 : e5 50 __ SBC T8 + 1 
0c84 : 85 50 __ STA T8 + 1 
.s16:
0c86 : a5 11 __ LDA P4 ; (y0 + 0)
0c88 : 29 f8 __ AND #$f8
0c8a : 85 1b __ STA ACCU + 0 
0c8c : a5 12 __ LDA P5 ; (y0 + 1)
0c8e : 85 1c __ STA ACCU + 1 
0c90 : 8a __ __ TXA
0c91 : 20 96 2a JSR $2a96 ; (mul16by8 + 0)
0c94 : 18 __ __ CLC
0c95 : a5 4d __ LDA T7 + 0 
0c97 : 65 1b __ ADC ACCU + 0 
0c99 : 85 4d __ STA T7 + 0 
0c9b : a5 4e __ LDA T7 + 1 
0c9d : 65 1c __ ADC ACCU + 1 
0c9f : aa __ __ TAX
0ca0 : a5 0f __ LDA P2 ; (x0 + 0)
0ca2 : 29 f8 __ AND #$f8
0ca4 : 18 __ __ CLC
0ca5 : 65 4d __ ADC T7 + 0 
0ca7 : 85 4d __ STA T7 + 0 
0ca9 : 8a __ __ TXA
0caa : 65 10 __ ADC P3 ; (x0 + 1)
0cac : 85 4e __ STA T7 + 1 
0cae : a5 46 __ LDA T2 + 0 
0cb0 : 05 43 __ ORA T0 + 0 
0cb2 : 29 80 __ AND #$80
0cb4 : 85 1b __ STA ACCU + 0 
0cb6 : a5 47 __ LDA T2 + 1 
0cb8 : 05 44 __ ORA T0 + 1 
0cba : 05 1b __ ORA ACCU + 0 
0cbc : f0 02 __ BEQ $0cc0 ; (bmu_line.s67 + 0)
.s66:
0cbe : a9 01 __ LDA #$01
.s67:
0cc0 : 85 1b __ STA ACCU + 0 
0cc2 : a5 11 __ LDA P4 ; (y0 + 0)
0cc4 : 29 07 __ AND #$07
0cc6 : 8d 01 34 STA $3401 ; (BLIT_CODE[0] + 1)
0cc9 : a6 49 __ LDX T4 + 0 
0ccb : e8 __ __ INX
0ccc : 8e 03 34 STX $3403 ; (BLIT_CODE[0] + 3)
0ccf : a5 0f __ LDA P2 ; (x0 + 0)
0cd1 : 29 07 __ AND #$07
0cd3 : aa __ __ TAX
0cd4 : bd c1 32 LDA $32c1,x ; (bitshift[0] + 32)
0cd7 : 85 48 __ STA T3 + 0 
0cd9 : a2 06 __ LDX #$06
0cdb : 86 45 __ STX T1 + 0 
0cdd : a5 18 __ LDA P11 ; (op + 0)
0cdf : c9 02 __ CMP #$02
0ce1 : d0 03 __ BNE $0ce6 ; (bmu_line.s17 + 0)
0ce3 : 4c 67 10 JMP $1067 ; (bmu_line.s49 + 0)
.s17:
0ce6 : b0 03 __ BCS $0ceb ; (bmu_line.s18 + 0)
0ce8 : 4c f1 0f JMP $0ff1 ; (bmu_line.s44 + 0)
.s18:
0ceb : c9 03 __ CMP #$03
0ced : d0 3d __ BNE $0d2c ; (bmu_line.s19 + 0)
.s40:
0cef : a6 17 __ LDX P10 ; (pattern + 0)
0cf1 : e8 __ __ INX
0cf2 : f0 1e __ BEQ $0d12 ; (bmu_line.s41 + 0)
.s43:
0cf4 : a9 06 __ LDA #$06
0cf6 : 8d 06 34 STA $3406 ; (BLIT_CODE[0] + 6)
0cf9 : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
0cfc : a9 07 __ LDA #$07
0cfe : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
0d01 : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
0d04 : a9 90 __ LDA #$90
0d06 : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
0d09 : a9 e6 __ LDA #$e6
0d0b : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
0d0e : a9 0c __ LDA #$0c
0d10 : 85 45 __ STA T1 + 0 
.s41:
0d12 : a9 51 __ LDA #$51
.s42:
0d14 : a6 45 __ LDX T1 + 0 
0d16 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
0d19 : a9 03 __ LDA #$03
0d1b : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
0d1e : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
0d21 : a9 91 __ LDA #$91
0d23 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
0d26 : 8a __ __ TXA
0d27 : 18 __ __ CLC
0d28 : 69 04 __ ADC #$04
.s64:
0d2a : 85 45 __ STA T1 + 0 
.s19:
0d2c : a5 43 __ LDA T0 + 0 
0d2e : 05 44 __ ORA T0 + 1 
0d30 : f0 03 __ BEQ $0d35 ; (bmu_line.s20 + 0)
0d32 : 4c 0a 0e JMP $0e0a ; (bmu_line.s28 + 0)
.s20:
0d35 : a5 46 __ LDA T2 + 0 
0d37 : 05 47 __ ORA T2 + 1 
0d39 : f0 75 __ BEQ $0db0 ; (bmu_line.s21 + 0)
.s22:
0d3b : a9 0a __ LDA #$0a
0d3d : a6 45 __ LDX T1 + 0 
0d3f : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
0d42 : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
0d45 : a9 90 __ LDA #$90
0d47 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
0d4a : a9 0c __ LDA #$0c
0d4c : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
0d4f : a9 a5 __ LDA #$a5
0d51 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
0d54 : a9 03 __ LDA #$03
0d56 : 9d 07 34 STA $3407,x ; (BLIT_CODE[0] + 7)
0d59 : a9 69 __ LDA #$69
0d5b : 9d 08 34 STA $3408,x ; (BLIT_CODE[0] + 8)
0d5e : a5 51 __ LDA T10 + 0 
0d60 : f0 09 __ BEQ $0d6b ; (bmu_line.s23 + 0)
.s27:
0d62 : a9 06 __ LDA #$06
0d64 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
0d67 : a9 26 __ LDA #$26
0d69 : d0 07 __ BNE $0d72 ; (bmu_line.s62 + 0)
.s23:
0d6b : a9 46 __ LDA #$46
0d6d : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
0d70 : a9 66 __ LDA #$66
.s62:
0d72 : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
0d75 : a9 02 __ LDA #$02
0d77 : 9d 0b 34 STA $340b,x ; (BLIT_CODE[0] + 11)
0d7a : a5 51 __ LDA T10 + 0 
0d7c : f0 0e __ BEQ $0d8c ; (bmu_line.s24 + 0)
.s26:
0d7e : a9 f8 __ LDA #$f8
0d80 : 9d 09 34 STA $3409,x ; (BLIT_CODE[0] + 9)
0d83 : a9 b0 __ LDA #$b0
0d85 : 9d 0a 34 STA $340a,x ; (BLIT_CODE[0] + 10)
0d88 : a9 c6 __ LDA #$c6
0d8a : d0 0c __ BNE $0d98 ; (bmu_line.s25 + 0)
.s24:
0d8c : a9 08 __ LDA #$08
0d8e : 9d 09 34 STA $3409,x ; (BLIT_CODE[0] + 9)
0d91 : a9 90 __ LDA #$90
0d93 : 9d 0a 34 STA $340a,x ; (BLIT_CODE[0] + 10)
0d96 : a9 e6 __ LDA #$e6
.s25:
0d98 : 9d 0c 34 STA $340c,x ; (BLIT_CODE[0] + 12)
0d9b : a9 04 __ LDA #$04
0d9d : 9d 0d 34 STA $340d,x ; (BLIT_CODE[0] + 13)
0da0 : a9 85 __ LDA #$85
0da2 : 9d 0e 34 STA $340e,x ; (BLIT_CODE[0] + 14)
0da5 : a9 03 __ LDA #$03
0da7 : 9d 0f 34 STA $340f,x ; (BLIT_CODE[0] + 15)
0daa : 8a __ __ TXA
0dab : 18 __ __ CLC
0dac : 69 10 __ ADC #$10
0dae : 85 45 __ STA T1 + 0 
.s21:
0db0 : a9 ca __ LDA #$ca
0db2 : a6 45 __ LDX T1 + 0 
0db4 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
0db7 : a9 d0 __ LDA #$d0
0db9 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
0dbc : a9 c6 __ LDA #$c6
0dbe : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
0dc1 : a9 0b __ LDA #$0b
0dc3 : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
0dc6 : a9 10 __ LDA #$10
0dc8 : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
0dcb : a9 60 __ LDA #$60
0dcd : 9d 07 34 STA $3407,x ; (BLIT_CODE[0] + 7)
0dd0 : e6 45 __ INC T1 + 0 
0dd2 : 38 __ __ SEC
0dd3 : a9 02 __ LDA #$02
0dd5 : e5 45 __ SBC T1 + 0 
0dd7 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
0dda : 8a __ __ TXA
0ddb : 18 __ __ CLC
0ddc : 69 05 __ ADC #$05
0dde : 49 ff __ EOR #$ff
0de0 : 18 __ __ CLC
0de1 : 69 03 __ ADC #$03
0de3 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
0de6 : a5 4a __ LDA T4 + 1 
0de8 : 85 49 __ STA T4 + 0 
0dea : a5 4d __ LDA T7 + 0 
0dec : 85 03 __ STA WORK + 0 
0dee : a5 4e __ LDA T7 + 1 
0df0 : 85 04 __ STA WORK + 1 
0df2 : a5 4b __ LDA T5 + 0 
0df4 : 85 05 __ STA WORK + 2 
0df6 : a5 4c __ LDA T5 + 1 
0df8 : 85 06 __ STA WORK + 3 
0dfa : a5 49 __ LDA T4 + 0 
0dfc : 85 0b __ STA WORK + 8 
0dfe : a5 48 __ LDA T3 + 0 
0e00 : 85 0a __ STA WORK + 7 
0e02 : a5 17 __ LDA P10 ; (pattern + 0)
0e04 : 85 07 __ STA WORK + 4 
0e06 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
.s3:
0e09 : 60 __ __ RTS
.s28:
0e0a : a5 46 __ LDA T2 + 0 
0e0c : 05 47 __ ORA T2 + 1 
0e0e : c9 01 __ CMP #$01
0e10 : a9 00 __ LDA #$00
0e12 : 6a __ __ ROR
0e13 : 85 1c __ STA ACCU + 1 
0e15 : f0 03 __ BEQ $0e1a ; (bmu_line.s29 + 0)
0e17 : 4c b1 0f JMP $0fb1 ; (bmu_line.s35 + 0)
.s29:
0e1a : a2 00 __ LDX #$00
0e1c : 86 46 __ STX T2 + 0 
0e1e : 86 47 __ STX T2 + 1 
0e20 : a5 52 __ LDA T11 + 0 
0e22 : f0 03 __ BEQ $0e27 ; (bmu_line.s30 + 0)
0e24 : 4c 47 0f JMP $0f47 ; (bmu_line.s34 + 0)
.s30:
0e27 : a9 c8 __ LDA #$c8
0e29 : a4 45 __ LDY T1 + 0 
0e2b : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
0e2e : a9 c0 __ LDA #$c0
0e30 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
0e33 : a9 08 __ LDA #$08
0e35 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
0e38 : a9 d0 __ LDA #$d0
0e3a : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
0e3d : a9 a0 __ LDA #$a0
0e3f : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
0e42 : a9 00 __ LDA #$00
0e44 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
0e47 : a9 a5 __ LDA #$a5
0e49 : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
0e4c : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
0e4f : a9 03 __ LDA #$03
0e51 : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
0e54 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
0e57 : a9 69 __ LDA #$69
0e59 : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
0e5c : 99 0f 34 STA $340f,y ; (BLIT_CODE[0] + 15)
0e5f : a9 85 __ LDA #$85
0e61 : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
0e64 : 99 11 34 STA $3411,y ; (BLIT_CODE[0] + 17)
0e67 : a9 04 __ LDA #$04
0e69 : 99 0e 34 STA $340e,y ; (BLIT_CODE[0] + 14)
0e6c : 99 12 34 STA $3412,y ; (BLIT_CODE[0] + 18)
0e6f : 8a __ __ TXA
0e70 : f0 04 __ BEQ $0e76 ; (bmu_line.s71 + 0)
.s72:
0e72 : a9 10 __ LDA #$10
0e74 : 90 02 __ BCC $0e78 ; (bmu_line.s73 + 0)
.s71:
0e76 : a9 0e __ LDA #$0e
.s73:
0e78 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
0e7b : 38 __ __ SEC
0e7c : a5 4f __ LDA T8 + 0 
0e7e : e9 01 __ SBC #$01
0e80 : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
0e83 : a5 50 __ LDA T8 + 1 
0e85 : e9 00 __ SBC #$00
0e87 : 99 10 34 STA $3410,y ; (BLIT_CODE[0] + 16)
0e8a : 98 __ __ TYA
0e8b : 18 __ __ CLC
0e8c : 69 13 __ ADC #$13
0e8e : 85 45 __ STA T1 + 0 
0e90 : a8 __ __ TAY
0e91 : 24 1c __ BIT ACCU + 1 
0e93 : 30 03 __ BMI $0e98 ; (bmu_line.s31 + 0)
0e95 : 4c 35 0d JMP $0d35 ; (bmu_line.s20 + 0)
.s31:
0e98 : a9 a5 __ LDA #$a5
0e9a : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
0e9d : a9 05 __ LDA #$05
0e9f : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
0ea2 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
0ea5 : a9 38 __ LDA #$38
0ea7 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
0eaa : a9 e9 __ LDA #$e9
0eac : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
0eaf : a9 85 __ LDA #$85
0eb1 : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
0eb4 : a5 46 __ LDA T2 + 0 
0eb6 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
0eb9 : a5 1b __ LDA ACCU + 0 
0ebb : d0 2a __ BNE $0ee7 ; (bmu_line.s33 + 0)
.s32:
0ebd : a9 10 __ LDA #$10
0ebf : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
0ec2 : a9 15 __ LDA #$15
0ec4 : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
0ec7 : a9 18 __ LDA #$18
0ec9 : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
0ecc : a9 69 __ LDA #$69
0ece : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
0ed1 : a5 43 __ LDA T0 + 0 
0ed3 : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
0ed6 : a9 85 __ LDA #$85
0ed8 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
0edb : a9 05 __ LDA #$05
0edd : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
0ee0 : 98 __ __ TYA
0ee1 : 18 __ __ CLC
0ee2 : 69 0e __ ADC #$0e
0ee4 : 4c 42 0f JMP $0f42 ; (bmu_line.s65 + 0)
.s33:
0ee7 : a9 a5 __ LDA #$a5
0ee9 : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
0eec : 99 10 34 STA $3410,y ; (BLIT_CODE[0] + 16)
0eef : 99 16 34 STA $3416,y ; (BLIT_CODE[0] + 22)
0ef2 : a9 06 __ LDA #$06
0ef4 : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
0ef7 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
0efa : 99 17 34 STA $3417,y ; (BLIT_CODE[0] + 23)
0efd : 99 1b 34 STA $341b,y ; (BLIT_CODE[0] + 27)
0f00 : a9 e9 __ LDA #$e9
0f02 : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
0f05 : a9 85 __ LDA #$85
0f07 : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
0f0a : 99 14 34 STA $3414,y ; (BLIT_CODE[0] + 20)
0f0d : 99 1a 34 STA $341a,y ; (BLIT_CODE[0] + 26)
0f10 : a9 10 __ LDA #$10
0f12 : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
0f15 : a9 1d __ LDA #$1d
0f17 : 99 0e 34 STA $340e,y ; (BLIT_CODE[0] + 14)
0f1a : a9 18 __ LDA #$18
0f1c : 99 0f 34 STA $340f,y ; (BLIT_CODE[0] + 15)
0f1f : a9 05 __ LDA #$05
0f21 : 99 11 34 STA $3411,y ; (BLIT_CODE[0] + 17)
0f24 : 99 15 34 STA $3415,y ; (BLIT_CODE[0] + 21)
0f27 : a9 69 __ LDA #$69
0f29 : 99 12 34 STA $3412,y ; (BLIT_CODE[0] + 18)
0f2c : 99 18 34 STA $3418,y ; (BLIT_CODE[0] + 24)
0f2f : a5 43 __ LDA T0 + 0 
0f31 : 99 13 34 STA $3413,y ; (BLIT_CODE[0] + 19)
0f34 : a5 47 __ LDA T2 + 1 
0f36 : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
0f39 : a5 44 __ LDA T0 + 1 
0f3b : 99 19 34 STA $3419,y ; (BLIT_CODE[0] + 25)
0f3e : 98 __ __ TYA
0f3f : 18 __ __ CLC
0f40 : 69 1c __ ADC #$1c
.s65:
0f42 : 85 45 __ STA T1 + 0 
0f44 : 4c 3b 0d JMP $0d3b ; (bmu_line.s22 + 0)
.s34:
0f47 : a9 88 __ LDA #$88
0f49 : a4 45 __ LDY T1 + 0 
0f4b : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
0f4e : a9 10 __ LDA #$10
0f50 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
0f53 : a9 18 __ LDA #$18
0f55 : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
0f58 : a9 a0 __ LDA #$a0
0f5a : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
0f5d : a9 07 __ LDA #$07
0f5f : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
0f62 : a9 a5 __ LDA #$a5
0f64 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
0f67 : 99 0c 34 STA $340c,y ; (BLIT_CODE[0] + 12)
0f6a : a9 03 __ LDA #$03
0f6c : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
0f6f : 99 0b 34 STA $340b,y ; (BLIT_CODE[0] + 11)
0f72 : a9 69 __ LDA #$69
0f74 : 99 08 34 STA $3408,y ; (BLIT_CODE[0] + 8)
0f77 : 99 0e 34 STA $340e,y ; (BLIT_CODE[0] + 14)
0f7a : a9 85 __ LDA #$85
0f7c : 99 0a 34 STA $340a,y ; (BLIT_CODE[0] + 10)
0f7f : 99 10 34 STA $3410,y ; (BLIT_CODE[0] + 16)
0f82 : a9 04 __ LDA #$04
0f84 : 99 0d 34 STA $340d,y ; (BLIT_CODE[0] + 13)
0f87 : 99 11 34 STA $3411,y ; (BLIT_CODE[0] + 17)
0f8a : 8a __ __ TXA
0f8b : f0 04 __ BEQ $0f91 ; (bmu_line.s68 + 0)
.s69:
0f8d : a9 11 __ LDA #$11
0f8f : 90 02 __ BCC $0f93 ; (bmu_line.s70 + 0)
.s68:
0f91 : a9 0f __ LDA #$0f
.s70:
0f93 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
0f96 : a5 4f __ LDA T8 + 0 
0f98 : 99 09 34 STA $3409,y ; (BLIT_CODE[0] + 9)
0f9b : a5 50 __ LDA T8 + 1 
0f9d : 99 0f 34 STA $340f,y ; (BLIT_CODE[0] + 15)
0fa0 : 98 __ __ TYA
0fa1 : 18 __ __ CLC
0fa2 : 69 12 __ ADC #$12
0fa4 : 85 45 __ STA T1 + 0 
0fa6 : a8 __ __ TAY
0fa7 : 24 1c __ BIT ACCU + 1 
0fa9 : 10 03 __ BPL $0fae ; (bmu_line.s70 + 27)
0fab : 4c 98 0e JMP $0e98 ; (bmu_line.s31 + 0)
0fae : 4c 35 0d JMP $0d35 ; (bmu_line.s20 + 0)
.s35:
0fb1 : a9 a5 __ LDA #$a5
0fb3 : a6 45 __ LDX T1 + 0 
0fb5 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
0fb8 : a9 30 __ LDA #$30
0fba : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
0fbd : a5 1b __ LDA ACCU + 0 
0fbf : 69 05 __ ADC #$05
0fc1 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
0fc4 : a5 1b __ LDA ACCU + 0 
0fc6 : d0 21 __ BNE $0fe9 ; (bmu_line.s39 + 0)
.s36:
0fc8 : a0 1b __ LDY #$1b
0fca : a5 52 __ LDA T11 + 0 
0fcc : d0 01 __ BNE $0fcf ; (bmu_line.s38 + 0)
.s37:
0fce : c8 __ __ INY
.s38:
0fcf : 98 __ __ TYA
0fd0 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
0fd3 : 8a __ __ TXA
0fd4 : 18 __ __ CLC
0fd5 : 69 04 __ ADC #$04
0fd7 : 85 45 __ STA T1 + 0 
0fd9 : a9 00 __ LDA #$00
0fdb : c5 1b __ CMP ACCU + 0 
0fdd : 2a __ __ ROL
0fde : aa __ __ TAX
0fdf : a5 52 __ LDA T11 + 0 
0fe1 : f0 03 __ BEQ $0fe6 ; (bmu_line.s38 + 23)
0fe3 : 4c 47 0f JMP $0f47 ; (bmu_line.s34 + 0)
0fe6 : 4c 27 0e JMP $0e27 ; (bmu_line.s30 + 0)
.s39:
0fe9 : a0 21 __ LDY #$21
0feb : a5 52 __ LDA T11 + 0 
0fed : d0 e0 __ BNE $0fcf ; (bmu_line.s38 + 0)
0fef : f0 dd __ BEQ $0fce ; (bmu_line.s37 + 0)
.s44:
0ff1 : a8 __ __ TAY
0ff2 : d0 4b __ BNE $103f ; (bmu_line.s46 + 0)
.s45:
0ff4 : 8e 06 34 STX $3406 ; (BLIT_CODE[0] + 6)
0ff7 : 8e 09 34 STX $3409 ; (BLIT_CODE[0] + 9)
0ffa : a9 07 __ LDA #$07
0ffc : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
0fff : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
1002 : a9 03 __ LDA #$03
1004 : 8d 0d 34 STA $340d ; (BLIT_CODE[0] + 13)
1007 : 8d 13 34 STA $3413 ; (BLIT_CODE[0] + 19)
100a : 8d 15 34 STA $3415 ; (BLIT_CODE[0] + 21)
100d : a9 90 __ LDA #$90
100f : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
1012 : a9 e6 __ LDA #$e6
1014 : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
1017 : a9 11 __ LDA #$11
1019 : 8d 0c 34 STA $340c ; (BLIT_CODE[0] + 12)
101c : a9 d0 __ LDA #$d0
101e : 8d 0e 34 STA $340e ; (BLIT_CODE[0] + 14)
1021 : a9 04 __ LDA #$04
1023 : 8d 0f 34 STA $340f ; (BLIT_CODE[0] + 15)
1026 : a9 49 __ LDA #$49
1028 : 8d 10 34 STA $3410 ; (BLIT_CODE[0] + 16)
102b : a9 ff __ LDA #$ff
102d : 8d 11 34 STA $3411 ; (BLIT_CODE[0] + 17)
1030 : a9 31 __ LDA #$31
1032 : 8d 12 34 STA $3412 ; (BLIT_CODE[0] + 18)
1035 : a9 91 __ LDA #$91
1037 : 8d 14 34 STA $3414 ; (BLIT_CODE[0] + 20)
103a : a9 16 __ LDA #$16
103c : 4c 2a 0d JMP $0d2a ; (bmu_line.s64 + 0)
.s46:
103f : a6 17 __ LDX P10 ; (pattern + 0)
1041 : e8 __ __ INX
1042 : f0 1e __ BEQ $1062 ; (bmu_line.s47 + 0)
.s48:
1044 : a9 06 __ LDA #$06
1046 : 8d 06 34 STA $3406 ; (BLIT_CODE[0] + 6)
1049 : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
104c : a9 07 __ LDA #$07
104e : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
1051 : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
1054 : a9 90 __ LDA #$90
1056 : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
1059 : a9 e6 __ LDA #$e6
105b : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
105e : a9 0c __ LDA #$0c
1060 : 85 45 __ STA T1 + 0 
.s47:
1062 : a9 11 __ LDA #$11
1064 : 4c 14 0d JMP $0d14 ; (bmu_line.s42 + 0)
.s49:
1067 : a4 17 __ LDY P10 ; (pattern + 0)
1069 : c8 __ __ INY
106a : f0 1e __ BEQ $108a ; (bmu_line.s50 + 0)
.s51:
106c : 8e 06 34 STX $3406 ; (BLIT_CODE[0] + 6)
106f : a9 07 __ LDA #$07
1071 : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
1074 : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
1077 : a9 90 __ LDA #$90
1079 : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
107c : a9 08 __ LDA #$08
107e : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
1081 : a9 e6 __ LDA #$e6
1083 : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
1086 : a9 0c __ LDA #$0c
1088 : 85 45 __ STA T1 + 0 
.s50:
108a : a9 49 __ LDA #$49
108c : a6 45 __ LDX T1 + 0 
108e : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
1091 : a9 ff __ LDA #$ff
1093 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
1096 : a9 31 __ LDA #$31
1098 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
109b : a9 03 __ LDA #$03
109d : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
10a0 : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
10a3 : a9 91 __ LDA #$91
10a5 : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
10a8 : 8a __ __ TXA
10a9 : 18 __ __ CLC
10aa : 69 06 __ ADC #$06
10ac : 4c 2a 0d JMP $0d2a ; (bmu_line.s64 + 0)
.s59:
10af : c9 ff __ CMP #$ff
10b1 : f0 03 __ BEQ $10b6 ; (bmu_line.s60 + 0)
10b3 : 4c bb 0b JMP $0bbb ; (bmu_line.s7 + 0)
.s60:
10b6 : a5 18 __ LDA P11 ; (op + 0)
10b8 : d0 f9 __ BNE $10b3 ; (bmu_line.s59 + 4)
.s61:
10ba : a9 01 __ LDA #$01
10bc : 4c b9 0b JMP $0bb9 ; (bmu_line.s63 + 0)
--------------------------------------------------------------------
clock: ; clock()->i32
;   8, "/home/honza/projects/c64/projects/oscar64/include/time.h"
.s4:
10bf : a5 a2 __ LDA $a2 
10c1 : 85 1b __ STA ACCU + 0 
10c3 : a5 a1 __ LDA $a1 
10c5 : 85 1c __ STA ACCU + 1 
10c7 : a5 a0 __ LDA $a0 
10c9 : 85 1d __ STA ACCU + 2 
10cb : a9 00 __ LDA #$00
10cd : 85 1e __ STA ACCU + 3 
.s3:
10cf : 60 __ __ RTS
--------------------------------------------------------------------
partition: ; partition(i16,i16)->void
;  66, "/home/honza/projects/c64/projects/oscar64/samples/hires/qsort.c"
.s1:
10d0 : 38 __ __ SEC
10d1 : a5 23 __ LDA SP + 0 
10d3 : e9 0f __ SBC #$0f
10d5 : 85 23 __ STA SP + 0 
10d7 : b0 02 __ BCS $10db ; (partition.s1 + 11)
10d9 : c6 24 __ DEC SP + 1 
10db : a0 0e __ LDY #$0e
10dd : a2 08 __ LDX #$08
10df : b5 53 __ LDA T2 + 0,x 
10e1 : 91 23 __ STA (SP + 0),y 
10e3 : 88 __ __ DEY
10e4 : ca __ __ DEX
10e5 : 10 f8 __ BPL $10df ; (partition.s1 + 15)
.s4:
10e7 : a0 13 __ LDY #$13
10e9 : b1 23 __ LDA (SP + 0),y 
10eb : 85 53 __ STA T2 + 0 
10ed : c8 __ __ INY
10ee : b1 23 __ LDA (SP + 0),y 
10f0 : 85 54 __ STA T2 + 1 
10f2 : a0 12 __ LDY #$12
10f4 : b1 23 __ LDA (SP + 0),y 
10f6 : c5 54 __ CMP T2 + 1 
10f8 : d0 06 __ BNE $1100 ; (partition.s9 + 0)
.s22:
10fa : 88 __ __ DEY
10fb : b1 23 __ LDA (SP + 0),y 
10fd : 4c ee 11 JMP $11ee ; (partition.l24 + 0)
.s9:
1100 : 45 54 __ EOR T2 + 1 
1102 : 30 04 __ BMI $1108 ; (partition.s8 + 0)
.l23:
1104 : b0 04 __ BCS $110a ; (partition.s3 + 0)
1106 : 90 1a __ BCC $1122 ; (partition.l5 + 0)
.s8:
1108 : b0 18 __ BCS $1122 ; (partition.l5 + 0)
.s3:
110a : a0 0e __ LDY #$0e
110c : a2 08 __ LDX #$08
110e : b1 23 __ LDA (SP + 0),y 
1110 : 95 53 __ STA T2 + 0,x 
1112 : 88 __ __ DEY
1113 : ca __ __ DEX
1114 : 10 f8 __ BPL $110e ; (partition.s3 + 4)
1116 : 18 __ __ CLC
1117 : a5 23 __ LDA SP + 0 
1119 : 69 0f __ ADC #$0f
111b : 85 23 __ STA SP + 0 
111d : 90 02 __ BCC $1121 ; (partition.s3 + 23)
111f : e6 24 __ INC SP + 1 
1121 : 60 __ __ RTS
.l5:
1122 : a0 11 __ LDY #$11
1124 : b1 23 __ LDA (SP + 0),y 
1126 : 85 55 __ STA T3 + 0 
1128 : 85 59 __ STA T5 + 0 
112a : 18 __ __ CLC
112b : 65 53 __ ADC T2 + 0 
112d : aa __ __ TAX
112e : c8 __ __ INY
112f : b1 23 __ LDA (SP + 0),y 
1131 : 85 56 __ STA T3 + 1 
1133 : 85 5a __ STA T5 + 1 
1135 : 65 54 __ ADC T2 + 1 
1137 : 4a __ __ LSR
1138 : 8a __ __ TXA
1139 : 6a __ __ ROR
113a : aa __ __ TAX
113b : bd 00 33 LDA $3300,x ; (field[0] + 0)
113e : 85 5b __ STA T9 + 0 
1140 : a5 54 __ LDA T2 + 1 
1142 : 85 58 __ STA T4 + 1 
1144 : a6 53 __ LDX T2 + 0 
1146 : 86 57 __ STX T4 + 0 
1148 : c5 56 __ CMP T3 + 1 
114a : d0 06 __ BNE $1152 ; (partition.s21 + 0)
.s18:
114c : e4 55 __ CPX T3 + 0 
.l19:
114e : b0 08 __ BCS $1158 ; (partition.s26 + 0)
1150 : 90 70 __ BCC $11c2 ; (partition.s6 + 0)
.s21:
1152 : 45 56 __ EOR T3 + 1 
1154 : 10 f8 __ BPL $114e ; (partition.l19 + 0)
.s20:
1156 : b0 6a __ BCS $11c2 ; (partition.s6 + 0)
.s26:
1158 : a6 59 __ LDX T5 + 0 
115a : a4 5a __ LDY T5 + 1 
115c : 4c 62 11 JMP $1162 ; (partition.l10 + 0)
.s17:
115f : a0 00 __ LDY #$00
1161 : e8 __ __ INX
.l10:
1162 : bd 00 33 LDA $3300,x ; (field[0] + 0)
1165 : 85 47 __ STA T6 + 0 
1167 : c5 5b __ CMP T9 + 0 
1169 : 90 02 __ BCC $116d ; (partition.s25 + 0)
.s27:
116b : d0 f2 __ BNE $115f ; (partition.s17 + 0)
.s25:
116d : 86 59 __ STX T5 + 0 
116f : 84 5a __ STY T5 + 1 
1171 : a4 57 __ LDY T4 + 0 
1173 : a6 58 __ LDX T4 + 1 
1175 : 4c 80 11 JMP $1180 ; (partition.l11 + 0)
.s16:
1178 : 98 __ __ TYA
1179 : 69 ff __ ADC #$ff
117b : a8 __ __ TAY
117c : 8a __ __ TXA
117d : 69 ff __ ADC #$ff
117f : aa __ __ TAX
.l11:
1180 : b9 00 33 LDA $3300,y ; (field[0] + 0)
1183 : c5 5b __ CMP T9 + 0 
1185 : 90 f1 __ BCC $1178 ; (partition.s16 + 0)
.s12:
1187 : 86 58 __ STX T4 + 1 
1189 : 84 57 __ STY T4 + 0 
118b : c4 59 __ CPY T5 + 0 
118d : 90 33 __ BCC $11c2 ; (partition.s6 + 0)
.s13:
118f : a2 00 __ LDX #$00
1191 : 8e e7 9f STX $9fe7 ; (sstack + 1)
1194 : a6 59 __ LDX T5 + 0 
1196 : 8e e6 9f STX $9fe6 ; (sstack + 0)
1199 : 9d 00 33 STA $3300,x ; (field[0] + 0)
119c : a5 47 __ LDA T6 + 0 
119e : 99 00 33 STA $3300,y ; (field[0] + 0)
11a1 : 20 5a 0b JSR $0b5a ; (draw.s1 + 0)
11a4 : a5 57 __ LDA T4 + 0 
11a6 : 8d e6 9f STA $9fe6 ; (sstack + 0)
11a9 : 18 __ __ CLC
11aa : 69 ff __ ADC #$ff
11ac : 85 57 __ STA T4 + 0 
11ae : b0 02 __ BCS $11b2 ; (partition.s29 + 0)
.s28:
11b0 : c6 58 __ DEC T4 + 1 
.s29:
11b2 : a9 00 __ LDA #$00
11b4 : 85 5a __ STA T5 + 1 
11b6 : 8d e7 9f STA $9fe7 ; (sstack + 1)
11b9 : 20 5a 0b JSR $0b5a ; (draw.s1 + 0)
11bc : e6 59 __ INC T5 + 0 
11be : a5 58 __ LDA T4 + 1 
11c0 : 10 31 __ BPL $11f3 ; (partition.s15 + 0)
.s6:
11c2 : a5 55 __ LDA T3 + 0 
11c4 : a0 02 __ LDY #$02
11c6 : 91 23 __ STA (SP + 0),y 
11c8 : a5 56 __ LDA T3 + 1 
11ca : c8 __ __ INY
11cb : 91 23 __ STA (SP + 0),y 
11cd : a5 57 __ LDA T4 + 0 
11cf : c8 __ __ INY
11d0 : 91 23 __ STA (SP + 0),y 
11d2 : a5 58 __ LDA T4 + 1 
11d4 : c8 __ __ INY
11d5 : 91 23 __ STA (SP + 0),y 
11d7 : 20 d0 10 JSR $10d0 ; (partition.s1 + 0)
11da : a5 59 __ LDA T5 + 0 
11dc : a0 11 __ LDY #$11
11de : 91 23 __ STA (SP + 0),y 
11e0 : a5 5a __ LDA T5 + 1 
11e2 : c8 __ __ INY
11e3 : 91 23 __ STA (SP + 0),y 
11e5 : c5 54 __ CMP T2 + 1 
11e7 : f0 03 __ BEQ $11ec ; (partition.s7 + 0)
11e9 : 4c 00 11 JMP $1100 ; (partition.s9 + 0)
.s7:
11ec : a5 59 __ LDA T5 + 0 
.l24:
11ee : c5 53 __ CMP T2 + 0 
11f0 : 4c 04 11 JMP $1104 ; (partition.l23 + 0)
.s15:
11f3 : 38 __ __ SEC
11f4 : f0 03 __ BEQ $11f9 ; (partition.s14 + 0)
11f6 : 4c 4e 11 JMP $114e ; (partition.l19 + 0)
.s14:
11f9 : a5 57 __ LDA T4 + 0 
11fb : c5 59 __ CMP T5 + 0 
11fd : 4c 4e 11 JMP $114e ; (partition.l19 + 0)
--------------------------------------------------------------------
sprintf: ; sprintf(u8*,const u8*)->i16
;  20, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s1:
1200 : a5 53 __ LDA T1 + 0 
1202 : 8d c2 9f STA $9fc2 ; (sprintf@stack + 0)
1205 : a5 54 __ LDA T1 + 1 
1207 : 8d c3 9f STA $9fc3 ; (sprintf@stack + 1)
.s4:
120a : ad ee 9f LDA $9fee ; (sstack + 8)
120d : 85 53 __ STA T1 + 0 
120f : 8d e7 9f STA $9fe7 ; (sstack + 1)
1212 : a9 00 __ LDA #$00
1214 : 8d ed 9f STA $9fed ; (sstack + 7)
1217 : ad ef 9f LDA $9fef ; (sstack + 9)
121a : 85 54 __ STA T1 + 1 
121c : 8d e8 9f STA $9fe8 ; (sstack + 2)
121f : ad f0 9f LDA $9ff0 ; (sstack + 10)
1222 : 8d e9 9f STA $9fe9 ; (sstack + 3)
1225 : ad f1 9f LDA $9ff1 ; (sstack + 11)
1228 : 8d ea 9f STA $9fea ; (sstack + 4)
122b : a9 f2 __ LDA #$f2
122d : 8d eb 9f STA $9feb ; (sstack + 5)
1230 : a9 9f __ LDA #$9f
1232 : 8d ec 9f STA $9fec ; (sstack + 6)
1235 : 20 50 12 JSR $1250 ; (sformat.s1 + 0)
1238 : 38 __ __ SEC
1239 : a5 1b __ LDA ACCU + 0 
123b : e5 53 __ SBC T1 + 0 
123d : 85 1b __ STA ACCU + 0 
123f : a5 1c __ LDA ACCU + 1 
1241 : e5 54 __ SBC T1 + 1 
1243 : 85 1c __ STA ACCU + 1 
.s3:
1245 : ad c2 9f LDA $9fc2 ; (sprintf@stack + 0)
1248 : 85 53 __ STA T1 + 0 
124a : ad c3 9f LDA $9fc3 ; (sprintf@stack + 1)
124d : 85 54 __ STA T1 + 1 
124f : 60 __ __ RTS
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
1250 : a2 09 __ LDX #$09
1252 : b5 53 __ LDA T1 + 0,x 
1254 : 9d c4 9f STA $9fc4,x ; (sformat@stack + 0)
1257 : ca __ __ DEX
1258 : 10 f8 __ BPL $1252 ; (sformat.s1 + 2)
.s4:
125a : ad e9 9f LDA $9fe9 ; (sstack + 3)
125d : 85 55 __ STA T3 + 0 
125f : a9 00 __ LDA #$00
1261 : 85 5b __ STA T6 + 0 
1263 : ad ea 9f LDA $9fea ; (sstack + 4)
1266 : 85 56 __ STA T3 + 1 
1268 : ad e7 9f LDA $9fe7 ; (sstack + 1)
126b : 85 57 __ STA T4 + 0 
126d : ad e8 9f LDA $9fe8 ; (sstack + 2)
1270 : 85 58 __ STA T4 + 1 
.l5:
1272 : a0 00 __ LDY #$00
1274 : b1 55 __ LDA (T3 + 0),y 
1276 : d0 36 __ BNE $12ae ; (sformat.s10 + 0)
.s6:
1278 : a4 5b __ LDY T6 + 0 
127a : 91 57 __ STA (T4 + 0),y 
127c : 98 __ __ TYA
127d : f0 28 __ BEQ $12a7 ; (sformat.s95 + 0)
.s7:
127f : ad ed 9f LDA $9fed ; (sstack + 7)
1282 : d0 18 __ BNE $129c ; (sformat.s9 + 0)
.s8:
1284 : 98 __ __ TYA
1285 : 18 __ __ CLC
1286 : 65 57 __ ADC T4 + 0 
1288 : aa __ __ TAX
1289 : a5 58 __ LDA T4 + 1 
128b : 69 00 __ ADC #$00
.s3:
128d : 86 1b __ STX ACCU + 0 ; (buff + 1)
128f : 85 1c __ STA ACCU + 1 ; (fmt + 0)
1291 : a2 09 __ LDX #$09
1293 : bd c4 9f LDA $9fc4,x ; (sformat@stack + 0)
1296 : 95 53 __ STA T1 + 0,x 
1298 : ca __ __ DEX
1299 : 10 f8 __ BPL $1293 ; (sformat.s3 + 6)
129b : 60 __ __ RTS
.s9:
129c : a5 57 __ LDA T4 + 0 
129e : 85 0e __ STA P1 
12a0 : a5 58 __ LDA T4 + 1 
12a2 : 85 0f __ STA P2 
12a4 : 20 91 16 JSR $1691 ; (puts.l4 + 0)
.s95:
12a7 : a5 58 __ LDA T4 + 1 
12a9 : a6 57 __ LDX T4 + 0 
12ab : 4c 8d 12 JMP $128d ; (sformat.s3 + 0)
.s10:
12ae : c9 25 __ CMP #$25
12b0 : f0 3e __ BEQ $12f0 ; (sformat.s15 + 0)
.s11:
12b2 : a4 5b __ LDY T6 + 0 
12b4 : 91 57 __ STA (T4 + 0),y 
12b6 : e6 55 __ INC T3 + 0 
12b8 : d0 02 __ BNE $12bc ; (sformat.s117 + 0)
.s116:
12ba : e6 56 __ INC T3 + 1 
.s117:
12bc : c8 __ __ INY
12bd : 84 5b __ STY T6 + 0 
12bf : 98 __ __ TYA
12c0 : c0 28 __ CPY #$28
12c2 : 90 ae __ BCC $1272 ; (sformat.l5 + 0)
.s12:
12c4 : 85 43 __ STA T0 + 0 
12c6 : a9 00 __ LDA #$00
12c8 : 85 5b __ STA T6 + 0 
12ca : ad ed 9f LDA $9fed ; (sstack + 7)
12cd : f0 14 __ BEQ $12e3 ; (sformat.s13 + 0)
.s14:
12cf : a5 57 __ LDA T4 + 0 
12d1 : 85 0e __ STA P1 
12d3 : a5 58 __ LDA T4 + 1 
12d5 : 85 0f __ STA P2 
12d7 : a9 00 __ LDA #$00
12d9 : a4 43 __ LDY T0 + 0 
12db : 91 0e __ STA (P1),y 
12dd : 20 91 16 JSR $1691 ; (puts.l4 + 0)
12e0 : 4c 72 12 JMP $1272 ; (sformat.l5 + 0)
.s13:
12e3 : 18 __ __ CLC
12e4 : a5 57 __ LDA T4 + 0 
12e6 : 65 43 __ ADC T0 + 0 
12e8 : 85 57 __ STA T4 + 0 
12ea : 90 86 __ BCC $1272 ; (sformat.l5 + 0)
.s118:
12ec : e6 58 __ INC T4 + 1 
12ee : b0 82 __ BCS $1272 ; (sformat.l5 + 0)
.s15:
12f0 : a5 5b __ LDA T6 + 0 
12f2 : f0 27 __ BEQ $131b ; (sformat.s16 + 0)
.s89:
12f4 : 84 5b __ STY T6 + 0 
12f6 : 85 43 __ STA T0 + 0 
12f8 : ad ed 9f LDA $9fed ; (sstack + 7)
12fb : f0 13 __ BEQ $1310 ; (sformat.s90 + 0)
.s91:
12fd : a5 57 __ LDA T4 + 0 
12ff : 85 0e __ STA P1 
1301 : a5 58 __ LDA T4 + 1 
1303 : 85 0f __ STA P2 
1305 : 98 __ __ TYA
1306 : a4 43 __ LDY T0 + 0 
1308 : 91 0e __ STA (P1),y 
130a : 20 91 16 JSR $1691 ; (puts.l4 + 0)
130d : 4c 1b 13 JMP $131b ; (sformat.s16 + 0)
.s90:
1310 : 18 __ __ CLC
1311 : a5 57 __ LDA T4 + 0 
1313 : 65 43 __ ADC T0 + 0 
1315 : 85 57 __ STA T4 + 0 
1317 : 90 02 __ BCC $131b ; (sformat.s16 + 0)
.s115:
1319 : e6 58 __ INC T4 + 1 
.s16:
131b : a9 00 __ LDA #$00
131d : 8d d3 9f STA $9fd3 ; (si.sign + 0)
1320 : 8d d4 9f STA $9fd4 ; (si.left + 0)
1323 : 8d d5 9f STA $9fd5 ; (si.prefix + 0)
1326 : a0 01 __ LDY #$01
1328 : b1 55 __ LDA (T3 + 0),y 
132a : a2 20 __ LDX #$20
132c : 8e ce 9f STX $9fce ; (si.fill + 0)
132f : a2 00 __ LDX #$00
1331 : 8e cf 9f STX $9fcf ; (si.width + 0)
1334 : ca __ __ DEX
1335 : 8e d0 9f STX $9fd0 ; (si.precision + 0)
1338 : a2 0a __ LDX #$0a
133a : 8e d2 9f STX $9fd2 ; (si.base + 0)
133d : aa __ __ TAX
133e : a9 02 __ LDA #$02
1340 : d0 07 __ BNE $1349 ; (sformat.l17 + 0)
.s85:
1342 : a0 00 __ LDY #$00
1344 : b1 55 __ LDA (T3 + 0),y 
1346 : aa __ __ TAX
1347 : a9 01 __ LDA #$01
.l17:
1349 : 18 __ __ CLC
134a : 65 55 __ ADC T3 + 0 
134c : 85 55 __ STA T3 + 0 
134e : 90 02 __ BCC $1352 ; (sformat.s106 + 0)
.s105:
1350 : e6 56 __ INC T3 + 1 
.s106:
1352 : 8a __ __ TXA
1353 : e0 2b __ CPX #$2b
1355 : d0 07 __ BNE $135e ; (sformat.s18 + 0)
.s88:
1357 : a9 01 __ LDA #$01
1359 : 8d d3 9f STA $9fd3 ; (si.sign + 0)
135c : d0 e4 __ BNE $1342 ; (sformat.s85 + 0)
.s18:
135e : c9 30 __ CMP #$30
1360 : d0 06 __ BNE $1368 ; (sformat.s19 + 0)
.s87:
1362 : 8d ce 9f STA $9fce ; (si.fill + 0)
1365 : 4c 42 13 JMP $1342 ; (sformat.s85 + 0)
.s19:
1368 : c9 23 __ CMP #$23
136a : d0 07 __ BNE $1373 ; (sformat.s20 + 0)
.s86:
136c : a9 01 __ LDA #$01
136e : 8d d5 9f STA $9fd5 ; (si.prefix + 0)
1371 : d0 cf __ BNE $1342 ; (sformat.s85 + 0)
.s20:
1373 : c9 2d __ CMP #$2d
1375 : d0 07 __ BNE $137e ; (sformat.s21 + 0)
.s84:
1377 : a9 01 __ LDA #$01
1379 : 8d d4 9f STA $9fd4 ; (si.left + 0)
137c : d0 c4 __ BNE $1342 ; (sformat.s85 + 0)
.s21:
137e : 85 47 __ STA T2 + 0 
1380 : c9 30 __ CMP #$30
1382 : 90 3c __ BCC $13c0 ; (sformat.s22 + 0)
.s80:
1384 : c9 3a __ CMP #$3a
1386 : b0 77 __ BCS $13ff ; (sformat.s23 + 0)
.s81:
1388 : a9 00 __ LDA #$00
138a : 85 53 __ STA T1 + 0 
.l82:
138c : a5 53 __ LDA T1 + 0 
138e : 0a __ __ ASL
138f : 85 1b __ STA ACCU + 0 ; (buff + 1)
1391 : a9 00 __ LDA #$00
1393 : 2a __ __ ROL
1394 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
1396 : 2a __ __ ROL
1397 : aa __ __ TAX
1398 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
139a : 65 53 __ ADC T1 + 0 
139c : 0a __ __ ASL
139d : 18 __ __ CLC
139e : 65 47 __ ADC T2 + 0 
13a0 : 38 __ __ SEC
13a1 : e9 30 __ SBC #$30
13a3 : 85 53 __ STA T1 + 0 
13a5 : a0 00 __ LDY #$00
13a7 : b1 55 __ LDA (T3 + 0),y 
13a9 : 85 47 __ STA T2 + 0 
13ab : e6 55 __ INC T3 + 0 
13ad : d0 02 __ BNE $13b1 ; (sformat.s114 + 0)
.s113:
13af : e6 56 __ INC T3 + 1 
.s114:
13b1 : c9 30 __ CMP #$30
13b3 : 90 04 __ BCC $13b9 ; (sformat.s104 + 0)
.s83:
13b5 : c9 3a __ CMP #$3a
13b7 : 90 d3 __ BCC $138c ; (sformat.l82 + 0)
.s104:
13b9 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
13bb : a6 53 __ LDX T1 + 0 
13bd : 8e cf 9f STX $9fcf ; (si.width + 0)
.s22:
13c0 : c9 2e __ CMP #$2e
13c2 : d0 3b __ BNE $13ff ; (sformat.s23 + 0)
.s76:
13c4 : a9 00 __ LDA #$00
13c6 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
13c8 : 4c e2 13 JMP $13e2 ; (sformat.l77 + 0)
.s79:
13cb : a5 43 __ LDA T0 + 0 
13cd : 0a __ __ ASL
13ce : 85 1b __ STA ACCU + 0 ; (buff + 1)
13d0 : 98 __ __ TYA
13d1 : 2a __ __ ROL
13d2 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
13d4 : 2a __ __ ROL
13d5 : aa __ __ TAX
13d6 : 18 __ __ CLC
13d7 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
13d9 : 65 43 __ ADC T0 + 0 
13db : 0a __ __ ASL
13dc : 18 __ __ CLC
13dd : 65 47 __ ADC T2 + 0 
13df : 38 __ __ SEC
13e0 : e9 30 __ SBC #$30
.l77:
13e2 : 85 43 __ STA T0 + 0 
13e4 : a0 00 __ LDY #$00
13e6 : b1 55 __ LDA (T3 + 0),y 
13e8 : 85 47 __ STA T2 + 0 
13ea : e6 55 __ INC T3 + 0 
13ec : d0 02 __ BNE $13f0 ; (sformat.s108 + 0)
.s107:
13ee : e6 56 __ INC T3 + 1 
.s108:
13f0 : c9 30 __ CMP #$30
13f2 : 90 04 __ BCC $13f8 ; (sformat.s103 + 0)
.s78:
13f4 : c9 3a __ CMP #$3a
13f6 : 90 d3 __ BCC $13cb ; (sformat.s79 + 0)
.s103:
13f8 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
13fa : a6 43 __ LDX T0 + 0 
13fc : 8e d0 9f STX $9fd0 ; (si.precision + 0)
.s23:
13ff : c9 64 __ CMP #$64
1401 : f0 0c __ BEQ $140f ; (sformat.s75 + 0)
.s24:
1403 : c9 44 __ CMP #$44
1405 : f0 08 __ BEQ $140f ; (sformat.s75 + 0)
.s25:
1407 : c9 69 __ CMP #$69
1409 : f0 04 __ BEQ $140f ; (sformat.s75 + 0)
.s26:
140b : c9 49 __ CMP #$49
140d : d0 07 __ BNE $1416 ; (sformat.s27 + 0)
.s75:
140f : a9 01 __ LDA #$01
.s93:
1411 : 85 13 __ STA P6 
1413 : 4c 57 16 JMP $1657 ; (sformat.s73 + 0)
.s27:
1416 : c9 75 __ CMP #$75
1418 : f0 04 __ BEQ $141e ; (sformat.s74 + 0)
.s28:
141a : c9 55 __ CMP #$55
141c : d0 04 __ BNE $1422 ; (sformat.s29 + 0)
.s74:
141e : a9 00 __ LDA #$00
1420 : f0 ef __ BEQ $1411 ; (sformat.s93 + 0)
.s29:
1422 : c9 78 __ CMP #$78
1424 : f0 04 __ BEQ $142a ; (sformat.s72 + 0)
.s30:
1426 : c9 58 __ CMP #$58
1428 : d0 15 __ BNE $143f ; (sformat.s31 + 0)
.s72:
142a : a5 47 __ LDA T2 + 0 
142c : 29 e0 __ AND #$e0
142e : 09 01 __ ORA #$01
1430 : 8d d1 9f STA $9fd1 ; (si.cha + 0)
1433 : a9 00 __ LDA #$00
1435 : 85 13 __ STA P6 
1437 : a9 10 __ LDA #$10
1439 : 8d d2 9f STA $9fd2 ; (si.base + 0)
143c : 4c 57 16 JMP $1657 ; (sformat.s73 + 0)
.s31:
143f : c9 6c __ CMP #$6c
1441 : d0 03 __ BNE $1446 ; (sformat.s32 + 0)
1443 : 4c c8 15 JMP $15c8 ; (sformat.s60 + 0)
.s32:
1446 : c9 4c __ CMP #$4c
1448 : f0 f9 __ BEQ $1443 ; (sformat.s31 + 4)
.s33:
144a : c9 66 __ CMP #$66
144c : f0 14 __ BEQ $1462 ; (sformat.s59 + 0)
.s34:
144e : c9 67 __ CMP #$67
1450 : f0 10 __ BEQ $1462 ; (sformat.s59 + 0)
.s35:
1452 : c9 65 __ CMP #$65
1454 : f0 0c __ BEQ $1462 ; (sformat.s59 + 0)
.s36:
1456 : c9 46 __ CMP #$46
1458 : f0 08 __ BEQ $1462 ; (sformat.s59 + 0)
.s37:
145a : c9 47 __ CMP #$47
145c : f0 04 __ BEQ $1462 ; (sformat.s59 + 0)
.s38:
145e : c9 45 __ CMP #$45
1460 : d0 5c __ BNE $14be ; (sformat.s39 + 0)
.s59:
1462 : a5 57 __ LDA T4 + 0 
1464 : 85 13 __ STA P6 
1466 : a5 58 __ LDA T4 + 1 
1468 : 85 14 __ STA P7 
146a : a5 47 __ LDA T2 + 0 
146c : 29 e0 __ AND #$e0
146e : 09 01 __ ORA #$01
1470 : 8d d1 9f STA $9fd1 ; (si.cha + 0)
1473 : ad eb 9f LDA $9feb ; (sstack + 5)
1476 : 85 59 __ STA T5 + 0 
1478 : a9 ce __ LDA #$ce
147a : 85 11 __ STA P4 
147c : a9 9f __ LDA #$9f
147e : 85 12 __ STA P5 
1480 : ad ec 9f LDA $9fec ; (sstack + 6)
1483 : 85 5a __ STA T5 + 1 
1485 : a0 00 __ LDY #$00
1487 : b1 59 __ LDA (T5 + 0),y 
1489 : 85 15 __ STA P8 
148b : c8 __ __ INY
148c : b1 59 __ LDA (T5 + 0),y 
148e : 85 16 __ STA P9 
1490 : c8 __ __ INY
1491 : b1 59 __ LDA (T5 + 0),y 
1493 : 85 17 __ STA P10 
1495 : c8 __ __ INY
1496 : b1 59 __ LDA (T5 + 0),y 
1498 : 85 18 __ STA P11 
149a : a5 47 __ LDA T2 + 0 
149c : ed d1 9f SBC $9fd1 ; (si.cha + 0)
149f : 18 __ __ CLC
14a0 : 69 61 __ ADC #$61
14a2 : 8d e6 9f STA $9fe6 ; (sstack + 0)
14a5 : 20 6c 19 JSR $196c ; (nformf.s1 + 0)
14a8 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
14aa : 85 5b __ STA T6 + 0 
14ac : 18 __ __ CLC
14ad : a5 59 __ LDA T5 + 0 
14af : 69 04 __ ADC #$04
14b1 : 8d eb 9f STA $9feb ; (sstack + 5)
14b4 : a5 5a __ LDA T5 + 1 
14b6 : 69 00 __ ADC #$00
14b8 : 8d ec 9f STA $9fec ; (sstack + 6)
14bb : 4c 72 12 JMP $1272 ; (sformat.l5 + 0)
.s39:
14be : c9 73 __ CMP #$73
14c0 : f0 3b __ BEQ $14fd ; (sformat.s47 + 0)
.s40:
14c2 : c9 53 __ CMP #$53
14c4 : f0 37 __ BEQ $14fd ; (sformat.s47 + 0)
.s41:
14c6 : c9 63 __ CMP #$63
14c8 : f0 12 __ BEQ $14dc ; (sformat.s46 + 0)
.s42:
14ca : c9 43 __ CMP #$43
14cc : f0 0e __ BEQ $14dc ; (sformat.s46 + 0)
.s43:
14ce : aa __ __ TAX
14cf : f0 ea __ BEQ $14bb ; (sformat.s59 + 89)
.s44:
14d1 : a0 00 __ LDY #$00
14d3 : 91 57 __ STA (T4 + 0),y 
.s45:
14d5 : a9 01 __ LDA #$01
.s96:
14d7 : 85 5b __ STA T6 + 0 
14d9 : 4c 72 12 JMP $1272 ; (sformat.l5 + 0)
.s46:
14dc : ad eb 9f LDA $9feb ; (sstack + 5)
14df : 85 43 __ STA T0 + 0 
14e1 : ad ec 9f LDA $9fec ; (sstack + 6)
14e4 : 85 44 __ STA T0 + 1 
14e6 : a0 00 __ LDY #$00
14e8 : b1 43 __ LDA (T0 + 0),y 
14ea : 91 57 __ STA (T4 + 0),y 
14ec : a5 43 __ LDA T0 + 0 
14ee : 69 01 __ ADC #$01
14f0 : 8d eb 9f STA $9feb ; (sstack + 5)
14f3 : a5 44 __ LDA T0 + 1 
14f5 : 69 00 __ ADC #$00
14f7 : 8d ec 9f STA $9fec ; (sstack + 6)
14fa : 4c d5 14 JMP $14d5 ; (sformat.s45 + 0)
.s47:
14fd : ad eb 9f LDA $9feb ; (sstack + 5)
1500 : 85 43 __ STA T0 + 0 
1502 : 69 01 __ ADC #$01
1504 : 8d eb 9f STA $9feb ; (sstack + 5)
1507 : ad ec 9f LDA $9fec ; (sstack + 6)
150a : 85 44 __ STA T0 + 1 
150c : 69 00 __ ADC #$00
150e : 8d ec 9f STA $9fec ; (sstack + 6)
1511 : a0 00 __ LDY #$00
1513 : 84 5c __ STY T7 + 0 
1515 : b1 43 __ LDA (T0 + 0),y 
1517 : 85 1b __ STA ACCU + 0 ; (buff + 1)
1519 : 85 53 __ STA T1 + 0 
151b : c8 __ __ INY
151c : b1 43 __ LDA (T0 + 0),y 
151e : 85 1c __ STA ACCU + 1 ; (fmt + 0)
1520 : 85 54 __ STA T1 + 1 
1522 : ad cf 9f LDA $9fcf ; (si.width + 0)
1525 : f0 0c __ BEQ $1533 ; (sformat.s48 + 0)
.s100:
1527 : 88 __ __ DEY
1528 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
152a : f0 05 __ BEQ $1531 ; (sformat.s101 + 0)
.l58:
152c : c8 __ __ INY
152d : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
152f : d0 fb __ BNE $152c ; (sformat.l58 + 0)
.s101:
1531 : 84 5c __ STY T7 + 0 
.s48:
1533 : ad d4 9f LDA $9fd4 ; (si.left + 0)
1536 : 85 59 __ STA T5 + 0 
1538 : d0 19 __ BNE $1553 ; (sformat.s49 + 0)
.s98:
153a : a6 5c __ LDX T7 + 0 
153c : ec cf 9f CPX $9fcf ; (si.width + 0)
153f : a0 00 __ LDY #$00
1541 : b0 0c __ BCS $154f ; (sformat.s99 + 0)
.l57:
1543 : ad ce 9f LDA $9fce ; (si.fill + 0)
1546 : 91 57 __ STA (T4 + 0),y 
1548 : c8 __ __ INY
1549 : e8 __ __ INX
154a : ec cf 9f CPX $9fcf ; (si.width + 0)
154d : 90 f4 __ BCC $1543 ; (sformat.l57 + 0)
.s99:
154f : 86 5c __ STX T7 + 0 
1551 : 84 5b __ STY T6 + 0 
.s49:
1553 : ac ed 9f LDY $9fed ; (sstack + 7)
1556 : d0 48 __ BNE $15a0 ; (sformat.s54 + 0)
.s50:
1558 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
155a : f0 23 __ BEQ $157f ; (sformat.s51 + 0)
.s53:
155c : 18 __ __ CLC
155d : a5 1b __ LDA ACCU + 0 ; (buff + 1)
155f : 69 01 __ ADC #$01
1561 : 85 43 __ STA T0 + 0 
1563 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
1565 : 69 00 __ ADC #$00
1567 : 85 44 __ STA T0 + 1 
1569 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
156b : a4 5b __ LDY T6 + 0 
156d : 91 57 __ STA (T4 + 0),y 
156f : e6 5b __ INC T6 + 0 
1571 : a0 00 __ LDY #$00
1573 : b1 43 __ LDA (T0 + 0),y 
1575 : a8 __ __ TAY
1576 : e6 43 __ INC T0 + 0 
1578 : d0 02 __ BNE $157c ; (sformat.s112 + 0)
.s111:
157a : e6 44 __ INC T0 + 1 
.s112:
157c : 98 __ __ TYA
157d : d0 ec __ BNE $156b ; (sformat.l92 + 0)
.s51:
157f : a5 59 __ LDA T5 + 0 
1581 : d0 03 __ BNE $1586 ; (sformat.s97 + 0)
1583 : 4c 72 12 JMP $1272 ; (sformat.l5 + 0)
.s97:
1586 : a6 5c __ LDX T7 + 0 
1588 : ec cf 9f CPX $9fcf ; (si.width + 0)
158b : a4 5b __ LDY T6 + 0 
158d : b0 0c __ BCS $159b ; (sformat.s102 + 0)
.l52:
158f : ad ce 9f LDA $9fce ; (si.fill + 0)
1592 : 91 57 __ STA (T4 + 0),y 
1594 : c8 __ __ INY
1595 : e8 __ __ INX
1596 : ec cf 9f CPX $9fcf ; (si.width + 0)
1599 : 90 f4 __ BCC $158f ; (sformat.l52 + 0)
.s102:
159b : 84 5b __ STY T6 + 0 
159d : 4c 72 12 JMP $1272 ; (sformat.l5 + 0)
.s54:
15a0 : a4 5b __ LDY T6 + 0 
15a2 : f0 11 __ BEQ $15b5 ; (sformat.s55 + 0)
.s56:
15a4 : a5 57 __ LDA T4 + 0 
15a6 : 85 0e __ STA P1 
15a8 : a5 58 __ LDA T4 + 1 
15aa : 85 0f __ STA P2 
15ac : a9 00 __ LDA #$00
15ae : 85 5b __ STA T6 + 0 
15b0 : 91 0e __ STA (P1),y 
15b2 : 20 91 16 JSR $1691 ; (puts.l4 + 0)
.s55:
15b5 : a5 53 __ LDA T1 + 0 
15b7 : 85 0e __ STA P1 
15b9 : a5 54 __ LDA T1 + 1 
15bb : 85 0f __ STA P2 
15bd : 20 91 16 JSR $1691 ; (puts.l4 + 0)
15c0 : ad d4 9f LDA $9fd4 ; (si.left + 0)
15c3 : d0 c1 __ BNE $1586 ; (sformat.s97 + 0)
15c5 : 4c 72 12 JMP $1272 ; (sformat.l5 + 0)
.s60:
15c8 : ad eb 9f LDA $9feb ; (sstack + 5)
15cb : 85 43 __ STA T0 + 0 
15cd : 69 03 __ ADC #$03
15cf : 8d eb 9f STA $9feb ; (sstack + 5)
15d2 : ad ec 9f LDA $9fec ; (sstack + 6)
15d5 : 85 44 __ STA T0 + 1 
15d7 : 69 00 __ ADC #$00
15d9 : 8d ec 9f STA $9fec ; (sstack + 6)
15dc : a0 00 __ LDY #$00
15de : b1 55 __ LDA (T3 + 0),y 
15e0 : aa __ __ TAX
15e1 : e6 55 __ INC T3 + 0 
15e3 : d0 02 __ BNE $15e7 ; (sformat.s110 + 0)
.s109:
15e5 : e6 56 __ INC T3 + 1 
.s110:
15e7 : b1 43 __ LDA (T0 + 0),y 
15e9 : 85 1b __ STA ACCU + 0 ; (buff + 1)
15eb : 85 11 __ STA P4 
15ed : a0 01 __ LDY #$01
15ef : b1 43 __ LDA (T0 + 0),y 
15f1 : 85 1c __ STA ACCU + 1 ; (fmt + 0)
15f3 : 85 12 __ STA P5 
15f5 : c8 __ __ INY
15f6 : b1 43 __ LDA (T0 + 0),y 
15f8 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
15fa : 85 13 __ STA P6 
15fc : c8 __ __ INY
15fd : b1 43 __ LDA (T0 + 0),y 
15ff : 85 14 __ STA P7 
1601 : e0 64 __ CPX #$64
1603 : f0 0c __ BEQ $1611 ; (sformat.s71 + 0)
.s61:
1605 : e0 44 __ CPX #$44
1607 : f0 08 __ BEQ $1611 ; (sformat.s71 + 0)
.s62:
1609 : e0 69 __ CPX #$69
160b : f0 04 __ BEQ $1611 ; (sformat.s71 + 0)
.s63:
160d : e0 49 __ CPX #$49
160f : d0 1c __ BNE $162d ; (sformat.s64 + 0)
.s71:
1611 : a9 01 __ LDA #$01
.s94:
1613 : 85 15 __ STA P8 
.s69:
1615 : a5 57 __ LDA T4 + 0 
1617 : 85 0f __ STA P2 
1619 : a5 58 __ LDA T4 + 1 
161b : 85 10 __ STA P3 
161d : a9 ce __ LDA #$ce
161f : 85 0d __ STA P0 
1621 : a9 9f __ LDA #$9f
1623 : 85 0e __ STA P1 
1625 : 20 22 18 JSR $1822 ; (nforml.s4 + 0)
1628 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
162a : 4c d7 14 JMP $14d7 ; (sformat.s96 + 0)
.s64:
162d : e0 75 __ CPX #$75
162f : f0 04 __ BEQ $1635 ; (sformat.s70 + 0)
.s65:
1631 : e0 55 __ CPX #$55
1633 : d0 04 __ BNE $1639 ; (sformat.s66 + 0)
.s70:
1635 : a9 00 __ LDA #$00
1637 : f0 da __ BEQ $1613 ; (sformat.s94 + 0)
.s66:
1639 : e0 78 __ CPX #$78
163b : f0 06 __ BEQ $1643 ; (sformat.s68 + 0)
.s67:
163d : 85 1e __ STA ACCU + 3 ; (fps + 0)
163f : e0 58 __ CPX #$58
1641 : d0 82 __ BNE $15c5 ; (sformat.s55 + 16)
.s68:
1643 : a9 00 __ LDA #$00
1645 : 85 15 __ STA P8 
1647 : a9 10 __ LDA #$10
1649 : 8d d2 9f STA $9fd2 ; (si.base + 0)
164c : 8a __ __ TXA
164d : 29 e0 __ AND #$e0
164f : 09 01 __ ORA #$01
1651 : 8d d1 9f STA $9fd1 ; (si.cha + 0)
1654 : 4c 15 16 JMP $1615 ; (sformat.s69 + 0)
.s73:
1657 : a5 57 __ LDA T4 + 0 
1659 : 85 0f __ STA P2 
165b : a5 58 __ LDA T4 + 1 
165d : 85 10 __ STA P3 
165f : ad eb 9f LDA $9feb ; (sstack + 5)
1662 : 85 43 __ STA T0 + 0 
1664 : ad ec 9f LDA $9fec ; (sstack + 6)
1667 : 85 44 __ STA T0 + 1 
1669 : a0 00 __ LDY #$00
166b : b1 43 __ LDA (T0 + 0),y 
166d : 85 11 __ STA P4 
166f : c8 __ __ INY
1670 : b1 43 __ LDA (T0 + 0),y 
1672 : 85 12 __ STA P5 
1674 : 18 __ __ CLC
1675 : a5 43 __ LDA T0 + 0 
1677 : 69 02 __ ADC #$02
1679 : 8d eb 9f STA $9feb ; (sstack + 5)
167c : a5 44 __ LDA T0 + 1 
167e : 69 00 __ ADC #$00
1680 : 8d ec 9f STA $9fec ; (sstack + 6)
1683 : a9 ce __ LDA #$ce
1685 : 85 0d __ STA P0 
1687 : a9 9f __ LDA #$9f
1689 : 85 0e __ STA P1 
168b : 20 07 17 JSR $1707 ; (nformi.s4 + 0)
168e : 4c d7 14 JMP $14d7 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
1691 : a0 00 __ LDY #$00
1693 : b1 0e __ LDA (P1),y ; (str + 0)
1695 : d0 01 __ BNE $1698 ; (puts.s5 + 0)
.s3:
1697 : 60 __ __ RTS
.s5:
1698 : e6 0e __ INC P1 ; (str + 0)
169a : d0 02 __ BNE $169e ; (puts.s7 + 0)
.s6:
169c : e6 0f __ INC P2 ; (str + 1)
.s7:
169e : 20 a4 16 JSR $16a4 ; (putpch.s4 + 0)
16a1 : 4c 91 16 JMP $1691 ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
16a4 : 85 0d __ STA P0 ; (c + 0)
16a6 : ad 3d 30 LDA $303d ; (giocharmap + 0)
16a9 : f0 32 __ BEQ $16dd ; (putpch.s5 + 0)
.s6:
16ab : a5 0d __ LDA P0 ; (c + 0)
16ad : c9 0a __ CMP #$0a
16af : d0 04 __ BNE $16b5 ; (putpch.s7 + 0)
.s18:
16b1 : a9 0d __ LDA #$0d
16b3 : d0 32 __ BNE $16e7 ; (putpch.s15 + 0)
.s7:
16b5 : c9 09 __ CMP #$09
16b7 : f0 36 __ BEQ $16ef ; (putpch.s16 + 0)
.s8:
16b9 : ad 3d 30 LDA $303d ; (giocharmap + 0)
16bc : c9 02 __ CMP #$02
16be : 90 1d __ BCC $16dd ; (putpch.s5 + 0)
.s9:
16c0 : a5 0d __ LDA P0 ; (c + 0)
16c2 : c9 41 __ CMP #$41
16c4 : 90 17 __ BCC $16dd ; (putpch.s5 + 0)
.s10:
16c6 : c9 7b __ CMP #$7b
16c8 : b0 13 __ BCS $16dd ; (putpch.s5 + 0)
.s11:
16ca : c9 61 __ CMP #$61
16cc : b0 04 __ BCS $16d2 ; (putpch.s13 + 0)
.s12:
16ce : c9 5b __ CMP #$5b
16d0 : b0 0b __ BCS $16dd ; (putpch.s5 + 0)
.s13:
16d2 : 49 20 __ EOR #$20
16d4 : 85 0d __ STA P0 ; (c + 0)
16d6 : ad 3d 30 LDA $303d ; (giocharmap + 0)
16d9 : c9 02 __ CMP #$02
16db : f0 06 __ BEQ $16e3 ; (putpch.s14 + 0)
.s5:
16dd : a5 0d __ LDA P0 ; (c + 0)
16df : 20 d2 ff JSR $ffd2 
.s3:
16e2 : 60 __ __ RTS
.s14:
16e3 : a5 0d __ LDA P0 ; (c + 0)
16e5 : 29 5f __ AND #$5f
.s15:
16e7 : 85 43 __ STA T0 + 0 
16e9 : a5 43 __ LDA T0 + 0 
16eb : 20 d2 ff JSR $ffd2 
16ee : 60 __ __ RTS
.s16:
16ef : a5 d3 __ LDA $d3 
16f1 : 29 03 __ AND #$03
16f3 : 85 43 __ STA T0 + 0 
16f5 : a9 20 __ LDA #$20
16f7 : 85 44 __ STA T1 + 0 
.l17:
16f9 : a5 44 __ LDA T1 + 0 
16fb : 20 d2 ff JSR $ffd2 
16fe : e6 43 __ INC T0 + 0 
1700 : a5 43 __ LDA T0 + 0 
1702 : c9 04 __ CMP #$04
1704 : 90 f3 __ BCC $16f9 ; (putpch.l17 + 0)
1706 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
1707 : a9 00 __ LDA #$00
1709 : 85 43 __ STA T5 + 0 
170b : a0 04 __ LDY #$04
170d : b1 0d __ LDA (P0),y ; (si + 0)
170f : 85 44 __ STA T6 + 0 
1711 : a5 13 __ LDA P6 ; (s + 0)
1713 : f0 13 __ BEQ $1728 ; (nformi.s5 + 0)
.s33:
1715 : 24 12 __ BIT P5 ; (v + 1)
1717 : 10 0f __ BPL $1728 ; (nformi.s5 + 0)
.s34:
1719 : 38 __ __ SEC
171a : a9 00 __ LDA #$00
171c : e5 11 __ SBC P4 ; (v + 0)
171e : 85 11 __ STA P4 ; (v + 0)
1720 : a9 00 __ LDA #$00
1722 : e5 12 __ SBC P5 ; (v + 1)
1724 : 85 12 __ STA P5 ; (v + 1)
1726 : e6 43 __ INC T5 + 0 
.s5:
1728 : a9 10 __ LDA #$10
172a : 85 45 __ STA T7 + 0 
172c : a5 11 __ LDA P4 ; (v + 0)
172e : 05 12 __ ORA P5 ; (v + 1)
1730 : f0 33 __ BEQ $1765 ; (nformi.s6 + 0)
.s28:
1732 : a5 11 __ LDA P4 ; (v + 0)
1734 : 85 1b __ STA ACCU + 0 
1736 : a5 12 __ LDA P5 ; (v + 1)
1738 : 85 1c __ STA ACCU + 1 
.l29:
173a : a5 44 __ LDA T6 + 0 
173c : 85 03 __ STA WORK + 0 
173e : a9 00 __ LDA #$00
1740 : 85 04 __ STA WORK + 1 
1742 : 20 b0 2d JSR $2db0 ; (divmod + 0)
1745 : a5 05 __ LDA WORK + 2 
1747 : c9 0a __ CMP #$0a
1749 : b0 04 __ BCS $174f ; (nformi.s32 + 0)
.s30:
174b : a9 30 __ LDA #$30
174d : 90 06 __ BCC $1755 ; (nformi.s31 + 0)
.s32:
174f : a0 03 __ LDY #$03
1751 : b1 0d __ LDA (P0),y ; (si + 0)
1753 : e9 0a __ SBC #$0a
.s31:
1755 : 18 __ __ CLC
1756 : 65 05 __ ADC WORK + 2 
1758 : a6 45 __ LDX T7 + 0 
175a : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
175d : c6 45 __ DEC T7 + 0 
175f : a5 1b __ LDA ACCU + 0 
1761 : 05 1c __ ORA ACCU + 1 
1763 : d0 d5 __ BNE $173a ; (nformi.l29 + 0)
.s6:
1765 : a0 02 __ LDY #$02
1767 : b1 0d __ LDA (P0),y ; (si + 0)
1769 : c9 ff __ CMP #$ff
176b : d0 04 __ BNE $1771 ; (nformi.s27 + 0)
.s7:
176d : a9 0f __ LDA #$0f
176f : d0 05 __ BNE $1776 ; (nformi.s39 + 0)
.s27:
1771 : 38 __ __ SEC
1772 : a9 10 __ LDA #$10
1774 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
1776 : a8 __ __ TAY
1777 : c4 45 __ CPY T7 + 0 
1779 : b0 0d __ BCS $1788 ; (nformi.s8 + 0)
.s26:
177b : a9 30 __ LDA #$30
.l40:
177d : a6 45 __ LDX T7 + 0 
177f : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
1782 : c6 45 __ DEC T7 + 0 
1784 : c4 45 __ CPY T7 + 0 
1786 : 90 f5 __ BCC $177d ; (nformi.l40 + 0)
.s8:
1788 : a0 07 __ LDY #$07
178a : b1 0d __ LDA (P0),y ; (si + 0)
178c : f0 1c __ BEQ $17aa ; (nformi.s9 + 0)
.s24:
178e : a5 44 __ LDA T6 + 0 
1790 : c9 10 __ CMP #$10
1792 : d0 16 __ BNE $17aa ; (nformi.s9 + 0)
.s25:
1794 : a0 03 __ LDY #$03
1796 : b1 0d __ LDA (P0),y ; (si + 0)
1798 : a8 __ __ TAY
1799 : a9 30 __ LDA #$30
179b : a6 45 __ LDX T7 + 0 
179d : ca __ __ DEX
179e : ca __ __ DEX
179f : 86 45 __ STX T7 + 0 
17a1 : 9d d6 9f STA $9fd6,x ; (buffer[0] + 0)
17a4 : 98 __ __ TYA
17a5 : 69 16 __ ADC #$16
17a7 : 9d d7 9f STA $9fd7,x ; (buffer[0] + 1)
.s9:
17aa : a9 00 __ LDA #$00
17ac : 85 1b __ STA ACCU + 0 
17ae : a5 43 __ LDA T5 + 0 
17b0 : f0 0c __ BEQ $17be ; (nformi.s10 + 0)
.s23:
17b2 : a9 2d __ LDA #$2d
.s22:
17b4 : a6 45 __ LDX T7 + 0 
17b6 : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
17b9 : c6 45 __ DEC T7 + 0 
17bb : 4c c8 17 JMP $17c8 ; (nformi.s11 + 0)
.s10:
17be : a0 05 __ LDY #$05
17c0 : b1 0d __ LDA (P0),y ; (si + 0)
17c2 : f0 04 __ BEQ $17c8 ; (nformi.s11 + 0)
.s21:
17c4 : a9 2b __ LDA #$2b
17c6 : d0 ec __ BNE $17b4 ; (nformi.s22 + 0)
.s11:
17c8 : a6 45 __ LDX T7 + 0 
17ca : a0 06 __ LDY #$06
17cc : b1 0d __ LDA (P0),y ; (si + 0)
17ce : d0 2b __ BNE $17fb ; (nformi.s17 + 0)
.l12:
17d0 : 8a __ __ TXA
17d1 : 18 __ __ CLC
17d2 : a0 01 __ LDY #$01
17d4 : 71 0d __ ADC (P0),y ; (si + 0)
17d6 : b0 04 __ BCS $17dc ; (nformi.s15 + 0)
.s16:
17d8 : c9 11 __ CMP #$11
17da : 90 0a __ BCC $17e6 ; (nformi.s13 + 0)
.s15:
17dc : a0 00 __ LDY #$00
17de : b1 0d __ LDA (P0),y ; (si + 0)
17e0 : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
17e3 : ca __ __ DEX
17e4 : b0 ea __ BCS $17d0 ; (nformi.l12 + 0)
.s13:
17e6 : e0 10 __ CPX #$10
17e8 : b0 0e __ BCS $17f8 ; (nformi.s41 + 0)
.s14:
17ea : 88 __ __ DEY
.l37:
17eb : bd d6 9f LDA $9fd6,x ; (buffer[0] + 0)
17ee : 91 0f __ STA (P2),y ; (str + 0)
17f0 : c8 __ __ INY
17f1 : e8 __ __ INX
17f2 : e0 10 __ CPX #$10
17f4 : 90 f5 __ BCC $17eb ; (nformi.l37 + 0)
.s38:
17f6 : 84 1b __ STY ACCU + 0 
.s41:
17f8 : a5 1b __ LDA ACCU + 0 
.s3:
17fa : 60 __ __ RTS
.s17:
17fb : e0 10 __ CPX #$10
17fd : b0 1a __ BCS $1819 ; (nformi.l18 + 0)
.s20:
17ff : a0 00 __ LDY #$00
.l35:
1801 : bd d6 9f LDA $9fd6,x ; (buffer[0] + 0)
1804 : 91 0f __ STA (P2),y ; (str + 0)
1806 : c8 __ __ INY
1807 : e8 __ __ INX
1808 : e0 10 __ CPX #$10
180a : 90 f5 __ BCC $1801 ; (nformi.l35 + 0)
.s36:
180c : 84 1b __ STY ACCU + 0 
180e : b0 09 __ BCS $1819 ; (nformi.l18 + 0)
.s19:
1810 : 88 __ __ DEY
1811 : b1 0d __ LDA (P0),y ; (si + 0)
1813 : a4 1b __ LDY ACCU + 0 
1815 : 91 0f __ STA (P2),y ; (str + 0)
1817 : e6 1b __ INC ACCU + 0 
.l18:
1819 : a5 1b __ LDA ACCU + 0 
181b : a0 01 __ LDY #$01
181d : d1 0d __ CMP (P0),y ; (si + 0)
181f : 90 ef __ BCC $1810 ; (nformi.s19 + 0)
1821 : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
1822 : a9 00 __ LDA #$00
1824 : 85 43 __ STA T4 + 0 
1826 : a5 15 __ LDA P8 ; (s + 0)
1828 : f0 1f __ BEQ $1849 ; (nforml.s5 + 0)
.s35:
182a : 24 14 __ BIT P7 ; (v + 3)
182c : 10 1b __ BPL $1849 ; (nforml.s5 + 0)
.s36:
182e : 38 __ __ SEC
182f : a9 00 __ LDA #$00
1831 : e5 11 __ SBC P4 ; (v + 0)
1833 : 85 11 __ STA P4 ; (v + 0)
1835 : a9 00 __ LDA #$00
1837 : e5 12 __ SBC P5 ; (v + 1)
1839 : 85 12 __ STA P5 ; (v + 1)
183b : a9 00 __ LDA #$00
183d : e5 13 __ SBC P6 ; (v + 2)
183f : 85 13 __ STA P6 ; (v + 2)
1841 : a9 00 __ LDA #$00
1843 : e5 14 __ SBC P7 ; (v + 3)
1845 : 85 14 __ STA P7 ; (v + 3)
1847 : e6 43 __ INC T4 + 0 
.s5:
1849 : a9 10 __ LDA #$10
184b : 85 44 __ STA T5 + 0 
184d : a5 14 __ LDA P7 ; (v + 3)
184f : f0 03 __ BEQ $1854 ; (nforml.s31 + 0)
1851 : 4c 1c 19 JMP $191c ; (nforml.l28 + 0)
.s31:
1854 : a5 13 __ LDA P6 ; (v + 2)
1856 : d0 f9 __ BNE $1851 ; (nforml.s5 + 8)
.s32:
1858 : a5 12 __ LDA P5 ; (v + 1)
185a : d0 f5 __ BNE $1851 ; (nforml.s5 + 8)
.s33:
185c : c5 11 __ CMP P4 ; (v + 0)
185e : 90 f1 __ BCC $1851 ; (nforml.s5 + 8)
.s6:
1860 : a0 02 __ LDY #$02
1862 : b1 0d __ LDA (P0),y ; (si + 0)
1864 : c9 ff __ CMP #$ff
1866 : d0 04 __ BNE $186c ; (nforml.s27 + 0)
.s7:
1868 : a9 0f __ LDA #$0f
186a : d0 05 __ BNE $1871 ; (nforml.s41 + 0)
.s27:
186c : 38 __ __ SEC
186d : a9 10 __ LDA #$10
186f : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
1871 : a8 __ __ TAY
1872 : c4 44 __ CPY T5 + 0 
1874 : b0 0d __ BCS $1883 ; (nforml.s8 + 0)
.s26:
1876 : a9 30 __ LDA #$30
.l42:
1878 : a6 44 __ LDX T5 + 0 
187a : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
187d : c6 44 __ DEC T5 + 0 
187f : c4 44 __ CPY T5 + 0 
1881 : 90 f5 __ BCC $1878 ; (nforml.l42 + 0)
.s8:
1883 : a0 07 __ LDY #$07
1885 : b1 0d __ LDA (P0),y ; (si + 0)
1887 : f0 1d __ BEQ $18a6 ; (nforml.s9 + 0)
.s24:
1889 : a0 04 __ LDY #$04
188b : b1 0d __ LDA (P0),y ; (si + 0)
188d : c9 10 __ CMP #$10
188f : d0 15 __ BNE $18a6 ; (nforml.s9 + 0)
.s25:
1891 : 88 __ __ DEY
1892 : b1 0d __ LDA (P0),y ; (si + 0)
1894 : a8 __ __ TAY
1895 : a9 30 __ LDA #$30
1897 : a6 44 __ LDX T5 + 0 
1899 : ca __ __ DEX
189a : ca __ __ DEX
189b : 86 44 __ STX T5 + 0 
189d : 9d d6 9f STA $9fd6,x ; (buffer[0] + 0)
18a0 : 98 __ __ TYA
18a1 : 69 16 __ ADC #$16
18a3 : 9d d7 9f STA $9fd7,x ; (buffer[0] + 1)
.s9:
18a6 : a9 00 __ LDA #$00
18a8 : 85 1b __ STA ACCU + 0 
18aa : a5 43 __ LDA T4 + 0 
18ac : f0 0c __ BEQ $18ba ; (nforml.s10 + 0)
.s23:
18ae : a9 2d __ LDA #$2d
.s22:
18b0 : a6 44 __ LDX T5 + 0 
18b2 : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
18b5 : c6 44 __ DEC T5 + 0 
18b7 : 4c c4 18 JMP $18c4 ; (nforml.s11 + 0)
.s10:
18ba : a0 05 __ LDY #$05
18bc : b1 0d __ LDA (P0),y ; (si + 0)
18be : f0 04 __ BEQ $18c4 ; (nforml.s11 + 0)
.s21:
18c0 : a9 2b __ LDA #$2b
18c2 : d0 ec __ BNE $18b0 ; (nforml.s22 + 0)
.s11:
18c4 : a0 06 __ LDY #$06
18c6 : a6 44 __ LDX T5 + 0 
18c8 : b1 0d __ LDA (P0),y ; (si + 0)
18ca : d0 29 __ BNE $18f5 ; (nforml.s17 + 0)
.l12:
18cc : 8a __ __ TXA
18cd : 18 __ __ CLC
18ce : a0 01 __ LDY #$01
18d0 : 71 0d __ ADC (P0),y ; (si + 0)
18d2 : b0 04 __ BCS $18d8 ; (nforml.s15 + 0)
.s16:
18d4 : c9 11 __ CMP #$11
18d6 : 90 0a __ BCC $18e2 ; (nforml.s13 + 0)
.s15:
18d8 : a0 00 __ LDY #$00
18da : b1 0d __ LDA (P0),y ; (si + 0)
18dc : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
18df : ca __ __ DEX
18e0 : b0 ea __ BCS $18cc ; (nforml.l12 + 0)
.s13:
18e2 : e0 10 __ CPX #$10
18e4 : b0 0e __ BCS $18f4 ; (nforml.s3 + 0)
.s14:
18e6 : 88 __ __ DEY
.l39:
18e7 : bd d6 9f LDA $9fd6,x ; (buffer[0] + 0)
18ea : 91 0f __ STA (P2),y ; (str + 0)
18ec : c8 __ __ INY
18ed : e8 __ __ INX
18ee : e0 10 __ CPX #$10
18f0 : 90 f5 __ BCC $18e7 ; (nforml.l39 + 0)
.s40:
18f2 : 84 1b __ STY ACCU + 0 
.s3:
18f4 : 60 __ __ RTS
.s17:
18f5 : e0 10 __ CPX #$10
18f7 : b0 1a __ BCS $1913 ; (nforml.l18 + 0)
.s20:
18f9 : a0 00 __ LDY #$00
.l37:
18fb : bd d6 9f LDA $9fd6,x ; (buffer[0] + 0)
18fe : 91 0f __ STA (P2),y ; (str + 0)
1900 : c8 __ __ INY
1901 : e8 __ __ INX
1902 : e0 10 __ CPX #$10
1904 : 90 f5 __ BCC $18fb ; (nforml.l37 + 0)
.s38:
1906 : 84 1b __ STY ACCU + 0 
1908 : b0 09 __ BCS $1913 ; (nforml.l18 + 0)
.s19:
190a : 88 __ __ DEY
190b : b1 0d __ LDA (P0),y ; (si + 0)
190d : a4 1b __ LDY ACCU + 0 
190f : 91 0f __ STA (P2),y ; (str + 0)
1911 : e6 1b __ INC ACCU + 0 
.l18:
1913 : a5 1b __ LDA ACCU + 0 
1915 : a0 01 __ LDY #$01
1917 : d1 0d __ CMP (P0),y ; (si + 0)
1919 : 90 ef __ BCC $190a ; (nforml.s19 + 0)
191b : 60 __ __ RTS
.l28:
191c : a0 04 __ LDY #$04
191e : b1 0d __ LDA (P0),y ; (si + 0)
1920 : 85 03 __ STA WORK + 0 
1922 : a5 11 __ LDA P4 ; (v + 0)
1924 : 85 1b __ STA ACCU + 0 
1926 : a5 12 __ LDA P5 ; (v + 1)
1928 : 85 1c __ STA ACCU + 1 
192a : a5 13 __ LDA P6 ; (v + 2)
192c : 85 1d __ STA ACCU + 2 
192e : a5 14 __ LDA P7 ; (v + 3)
1930 : 85 1e __ STA ACCU + 3 
1932 : a9 00 __ LDA #$00
1934 : 85 04 __ STA WORK + 1 
1936 : 85 05 __ STA WORK + 2 
1938 : 85 06 __ STA WORK + 3 
193a : 20 63 2f JSR $2f63 ; (divmod32 + 0)
193d : a5 07 __ LDA WORK + 4 
193f : c9 0a __ CMP #$0a
1941 : b0 04 __ BCS $1947 ; (nforml.s34 + 0)
.s29:
1943 : a9 30 __ LDA #$30
1945 : 90 06 __ BCC $194d ; (nforml.s30 + 0)
.s34:
1947 : a0 03 __ LDY #$03
1949 : b1 0d __ LDA (P0),y ; (si + 0)
194b : e9 0a __ SBC #$0a
.s30:
194d : 18 __ __ CLC
194e : 65 07 __ ADC WORK + 4 
1950 : a6 44 __ LDX T5 + 0 
1952 : 9d d5 9f STA $9fd5,x ; (si.prefix + 0)
1955 : c6 44 __ DEC T5 + 0 
1957 : a5 1b __ LDA ACCU + 0 
1959 : 85 11 __ STA P4 ; (v + 0)
195b : a5 1c __ LDA ACCU + 1 
195d : 85 12 __ STA P5 ; (v + 1)
195f : a5 1d __ LDA ACCU + 2 
1961 : 85 13 __ STA P6 ; (v + 2)
1963 : a5 1e __ LDA ACCU + 3 
1965 : 85 14 __ STA P7 ; (v + 3)
1967 : d0 b3 __ BNE $191c ; (nforml.l28 + 0)
1969 : 4c 54 18 JMP $1854 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
196c : a2 03 __ LDX #$03
196e : b5 53 __ LDA T7 + 0,x 
1970 : 9d dd 9f STA $9fdd,x ; (nformf@stack + 0)
1973 : ca __ __ DEX
1974 : 10 f8 __ BPL $196e ; (nformf.s1 + 2)
.s4:
1976 : a5 16 __ LDA P9 ; (f + 1)
1978 : 85 44 __ STA T0 + 1 
197a : a5 17 __ LDA P10 ; (f + 2)
197c : 85 45 __ STA T0 + 2 
197e : a5 18 __ LDA P11 ; (f + 3)
1980 : 29 7f __ AND #$7f
1982 : 05 17 __ ORA P10 ; (f + 2)
1984 : 05 16 __ ORA P9 ; (f + 1)
1986 : 05 15 __ ORA P8 ; (f + 0)
1988 : f0 21 __ BEQ $19ab ; (nformf.s5 + 0)
.s107:
198a : 24 18 __ BIT P11 ; (f + 3)
198c : 10 1d __ BPL $19ab ; (nformf.s5 + 0)
.s106:
198e : a9 2d __ LDA #$2d
1990 : a0 00 __ LDY #$00
1992 : 91 13 __ STA (P6),y ; (str + 0)
1994 : a5 18 __ LDA P11 ; (f + 3)
1996 : 49 80 __ EOR #$80
1998 : 85 10 __ STA P3 
199a : 85 18 __ STA P11 ; (f + 3)
199c : a5 15 __ LDA P8 ; (f + 0)
199e : 85 0d __ STA P0 
19a0 : a5 16 __ LDA P9 ; (f + 1)
19a2 : 85 0e __ STA P1 
19a4 : a5 17 __ LDA P10 ; (f + 2)
19a6 : 85 0f __ STA P2 
19a8 : 4c bf 1e JMP $1ebf ; (nformf.s104 + 0)
.s5:
19ab : a5 15 __ LDA P8 ; (f + 0)
19ad : 85 0d __ STA P0 
19af : a5 16 __ LDA P9 ; (f + 1)
19b1 : 85 0e __ STA P1 
19b3 : a5 17 __ LDA P10 ; (f + 2)
19b5 : 85 0f __ STA P2 
19b7 : a5 18 __ LDA P11 ; (f + 3)
19b9 : 85 10 __ STA P3 
19bb : a0 05 __ LDY #$05
19bd : b1 11 __ LDA (P4),y ; (si + 0)
19bf : f0 09 __ BEQ $19ca ; (nformf.s6 + 0)
.s103:
19c1 : a9 2b __ LDA #$2b
19c3 : a0 00 __ LDY #$00
19c5 : 91 13 __ STA (P6),y ; (str + 0)
19c7 : 4c bf 1e JMP $1ebf ; (nformf.s104 + 0)
.s6:
19ca : 20 d0 1e JSR $1ed0 ; (isinf.s4 + 0)
19cd : a2 00 __ LDX #$00
19cf : 86 54 __ STX T9 + 0 
19d1 : a8 __ __ TAY
19d2 : f0 05 __ BEQ $19d9 ; (nformf.s7 + 0)
.s101:
19d4 : a9 02 __ LDA #$02
19d6 : 4c 8f 1e JMP $1e8f ; (nformf.s102 + 0)
.s7:
19d9 : a5 11 __ LDA P4 ; (si + 0)
19db : 85 4b __ STA T2 + 0 
19dd : a5 12 __ LDA P5 ; (si + 1)
19df : 85 4c __ STA T2 + 1 
19e1 : a0 02 __ LDY #$02
19e3 : b1 11 __ LDA (P4),y ; (si + 0)
19e5 : c9 ff __ CMP #$ff
19e7 : d0 02 __ BNE $19eb ; (nformf.s100 + 0)
.s8:
19e9 : a9 06 __ LDA #$06
.s100:
19eb : 85 4d __ STA T3 + 0 
19ed : 85 52 __ STA T6 + 0 
19ef : a9 00 __ LDA #$00
19f1 : 85 4f __ STA T4 + 0 
19f3 : 85 50 __ STA T4 + 1 
19f5 : a5 18 __ LDA P11 ; (f + 3)
19f7 : 85 46 __ STA T0 + 3 
19f9 : 29 7f __ AND #$7f
19fb : 05 17 __ ORA P10 ; (f + 2)
19fd : 05 16 __ ORA P9 ; (f + 1)
19ff : a6 15 __ LDX P8 ; (f + 0)
1a01 : 86 43 __ STX T0 + 0 
1a03 : 05 15 __ ORA P8 ; (f + 0)
1a05 : d0 03 __ BNE $1a0a ; (nformf.s67 + 0)
1a07 : 4c 3e 1b JMP $1b3e ; (nformf.s9 + 0)
.s67:
1a0a : a5 18 __ LDA P11 ; (f + 3)
1a0c : 10 03 __ BPL $1a11 ; (nformf.s95 + 0)
1a0e : 4c 90 1a JMP $1a90 ; (nformf.l80 + 0)
.s95:
1a11 : c9 44 __ CMP #$44
1a13 : d0 0d __ BNE $1a22 ; (nformf.l99 + 0)
.s96:
1a15 : a5 17 __ LDA P10 ; (f + 2)
1a17 : c9 7a __ CMP #$7a
1a19 : d0 07 __ BNE $1a22 ; (nformf.l99 + 0)
.s97:
1a1b : a5 16 __ LDA P9 ; (f + 1)
1a1d : d0 03 __ BNE $1a22 ; (nformf.l99 + 0)
.s98:
1a1f : 8a __ __ TXA
1a20 : f0 02 __ BEQ $1a24 ; (nformf.l90 + 0)
.l99:
1a22 : 90 54 __ BCC $1a78 ; (nformf.s68 + 0)
.l90:
1a24 : 18 __ __ CLC
1a25 : a5 4f __ LDA T4 + 0 
1a27 : 69 03 __ ADC #$03
1a29 : 85 4f __ STA T4 + 0 
1a2b : 90 02 __ BCC $1a2f ; (nformf.s121 + 0)
.s120:
1a2d : e6 50 __ INC T4 + 1 
.s121:
1a2f : a5 43 __ LDA T0 + 0 
1a31 : 85 1b __ STA ACCU + 0 
1a33 : a5 44 __ LDA T0 + 1 
1a35 : 85 1c __ STA ACCU + 1 
1a37 : a5 45 __ LDA T0 + 2 
1a39 : 85 1d __ STA ACCU + 2 
1a3b : a5 46 __ LDA T0 + 3 
1a3d : 85 1e __ STA ACCU + 3 
1a3f : a9 00 __ LDA #$00
1a41 : 85 03 __ STA WORK + 0 
1a43 : 85 04 __ STA WORK + 1 
1a45 : a9 7a __ LDA #$7a
1a47 : 85 05 __ STA WORK + 2 
1a49 : a9 44 __ LDA #$44
1a4b : 85 06 __ STA WORK + 3 
1a4d : 20 e2 2a JSR $2ae2 ; (freg + 20)
1a50 : 20 c8 2c JSR $2cc8 ; (crt_fdiv + 0)
1a53 : a5 1b __ LDA ACCU + 0 
1a55 : 85 43 __ STA T0 + 0 
1a57 : a5 1c __ LDA ACCU + 1 
1a59 : 85 44 __ STA T0 + 1 
1a5b : a6 1d __ LDX ACCU + 2 
1a5d : 86 45 __ STX T0 + 2 
1a5f : a5 1e __ LDA ACCU + 3 
1a61 : 85 46 __ STA T0 + 3 
1a63 : 30 13 __ BMI $1a78 ; (nformf.s68 + 0)
.s91:
1a65 : c9 44 __ CMP #$44
1a67 : d0 b9 __ BNE $1a22 ; (nformf.l99 + 0)
.s92:
1a69 : e0 7a __ CPX #$7a
1a6b : d0 b5 __ BNE $1a22 ; (nformf.l99 + 0)
.s93:
1a6d : a5 1c __ LDA ACCU + 1 
1a6f : 38 __ __ SEC
1a70 : d0 b0 __ BNE $1a22 ; (nformf.l99 + 0)
.s94:
1a72 : a5 1b __ LDA ACCU + 0 
1a74 : f0 ae __ BEQ $1a24 ; (nformf.l90 + 0)
1a76 : d0 aa __ BNE $1a22 ; (nformf.l99 + 0)
.s68:
1a78 : a5 46 __ LDA T0 + 3 
1a7a : 30 14 __ BMI $1a90 ; (nformf.l80 + 0)
.s86:
1a7c : c9 3f __ CMP #$3f
1a7e : d0 0e __ BNE $1a8e ; (nformf.s85 + 0)
.s87:
1a80 : a5 45 __ LDA T0 + 2 
1a82 : c9 80 __ CMP #$80
1a84 : d0 08 __ BNE $1a8e ; (nformf.s85 + 0)
.s88:
1a86 : a5 44 __ LDA T0 + 1 
1a88 : d0 04 __ BNE $1a8e ; (nformf.s85 + 0)
.s89:
1a8a : a5 43 __ LDA T0 + 0 
1a8c : f0 49 __ BEQ $1ad7 ; (nformf.s69 + 0)
.s85:
1a8e : b0 47 __ BCS $1ad7 ; (nformf.s69 + 0)
.l80:
1a90 : 38 __ __ SEC
1a91 : a5 4f __ LDA T4 + 0 
1a93 : e9 03 __ SBC #$03
1a95 : 85 4f __ STA T4 + 0 
1a97 : b0 02 __ BCS $1a9b ; (nformf.s116 + 0)
.s115:
1a99 : c6 50 __ DEC T4 + 1 
.s116:
1a9b : a9 00 __ LDA #$00
1a9d : 85 1b __ STA ACCU + 0 
1a9f : 85 1c __ STA ACCU + 1 
1aa1 : a9 7a __ LDA #$7a
1aa3 : 85 1d __ STA ACCU + 2 
1aa5 : a9 44 __ LDA #$44
1aa7 : 85 1e __ STA ACCU + 3 
1aa9 : a2 43 __ LDX #$43
1aab : 20 d2 2a JSR $2ad2 ; (freg + 4)
1aae : 20 00 2c JSR $2c00 ; (crt_fmul + 0)
1ab1 : a5 1b __ LDA ACCU + 0 
1ab3 : 85 43 __ STA T0 + 0 
1ab5 : a5 1c __ LDA ACCU + 1 
1ab7 : 85 44 __ STA T0 + 1 
1ab9 : a6 1d __ LDX ACCU + 2 
1abb : 86 45 __ STX T0 + 2 
1abd : a5 1e __ LDA ACCU + 3 
1abf : 85 46 __ STA T0 + 3 
1ac1 : 30 cd __ BMI $1a90 ; (nformf.l80 + 0)
.s81:
1ac3 : c9 3f __ CMP #$3f
1ac5 : 90 c9 __ BCC $1a90 ; (nformf.l80 + 0)
.s122:
1ac7 : d0 0e __ BNE $1ad7 ; (nformf.s69 + 0)
.s82:
1ac9 : e0 80 __ CPX #$80
1acb : 90 c3 __ BCC $1a90 ; (nformf.l80 + 0)
.s123:
1acd : d0 08 __ BNE $1ad7 ; (nformf.s69 + 0)
.s83:
1acf : a5 1c __ LDA ACCU + 1 
1ad1 : d0 bb __ BNE $1a8e ; (nformf.s85 + 0)
.s84:
1ad3 : a5 1b __ LDA ACCU + 0 
1ad5 : d0 b7 __ BNE $1a8e ; (nformf.s85 + 0)
.s69:
1ad7 : a5 46 __ LDA T0 + 3 
1ad9 : 30 63 __ BMI $1b3e ; (nformf.s9 + 0)
.s75:
1adb : c9 41 __ CMP #$41
1add : d0 0e __ BNE $1aed ; (nformf.l79 + 0)
.s76:
1adf : a5 45 __ LDA T0 + 2 
1ae1 : c9 20 __ CMP #$20
1ae3 : d0 08 __ BNE $1aed ; (nformf.l79 + 0)
.s77:
1ae5 : a5 44 __ LDA T0 + 1 
1ae7 : d0 04 __ BNE $1aed ; (nformf.l79 + 0)
.s78:
1ae9 : a5 43 __ LDA T0 + 0 
1aeb : f0 02 __ BEQ $1aef ; (nformf.l70 + 0)
.l79:
1aed : 90 4f __ BCC $1b3e ; (nformf.s9 + 0)
.l70:
1aef : e6 4f __ INC T4 + 0 
1af1 : d0 02 __ BNE $1af5 ; (nformf.s119 + 0)
.s118:
1af3 : e6 50 __ INC T4 + 1 
.s119:
1af5 : a5 43 __ LDA T0 + 0 
1af7 : 85 1b __ STA ACCU + 0 
1af9 : a5 44 __ LDA T0 + 1 
1afb : 85 1c __ STA ACCU + 1 
1afd : a5 45 __ LDA T0 + 2 
1aff : 85 1d __ STA ACCU + 2 
1b01 : a5 46 __ LDA T0 + 3 
1b03 : 85 1e __ STA ACCU + 3 
1b05 : a9 00 __ LDA #$00
1b07 : 85 03 __ STA WORK + 0 
1b09 : 85 04 __ STA WORK + 1 
1b0b : a9 20 __ LDA #$20
1b0d : 85 05 __ STA WORK + 2 
1b0f : a9 41 __ LDA #$41
1b11 : 85 06 __ STA WORK + 3 
1b13 : 20 e2 2a JSR $2ae2 ; (freg + 20)
1b16 : 20 c8 2c JSR $2cc8 ; (crt_fdiv + 0)
1b19 : a5 1b __ LDA ACCU + 0 
1b1b : 85 43 __ STA T0 + 0 
1b1d : a5 1c __ LDA ACCU + 1 
1b1f : 85 44 __ STA T0 + 1 
1b21 : a6 1d __ LDX ACCU + 2 
1b23 : 86 45 __ STX T0 + 2 
1b25 : a5 1e __ LDA ACCU + 3 
1b27 : 85 46 __ STA T0 + 3 
1b29 : 30 13 __ BMI $1b3e ; (nformf.s9 + 0)
.s71:
1b2b : c9 41 __ CMP #$41
1b2d : d0 be __ BNE $1aed ; (nformf.l79 + 0)
.s72:
1b2f : e0 20 __ CPX #$20
1b31 : d0 ba __ BNE $1aed ; (nformf.l79 + 0)
.s73:
1b33 : a5 1c __ LDA ACCU + 1 
1b35 : 38 __ __ SEC
1b36 : d0 b5 __ BNE $1aed ; (nformf.l79 + 0)
.s74:
1b38 : a5 1b __ LDA ACCU + 0 
1b3a : f0 b3 __ BEQ $1aef ; (nformf.l70 + 0)
1b3c : d0 af __ BNE $1aed ; (nformf.l79 + 0)
.s9:
1b3e : ad e6 9f LDA $9fe6 ; (sstack + 0)
1b41 : c9 65 __ CMP #$65
1b43 : d0 04 __ BNE $1b49 ; (nformf.s11 + 0)
.s10:
1b45 : a9 01 __ LDA #$01
1b47 : d0 02 __ BNE $1b4b ; (nformf.s12 + 0)
.s11:
1b49 : a9 00 __ LDA #$00
.s12:
1b4b : 85 55 __ STA T10 + 0 
1b4d : a6 4d __ LDX T3 + 0 
1b4f : e8 __ __ INX
1b50 : 86 51 __ STX T5 + 0 
1b52 : ad e6 9f LDA $9fe6 ; (sstack + 0)
1b55 : c9 67 __ CMP #$67
1b57 : d0 13 __ BNE $1b6c ; (nformf.s13 + 0)
.s63:
1b59 : a5 50 __ LDA T4 + 1 
1b5b : 30 08 __ BMI $1b65 ; (nformf.s64 + 0)
.s66:
1b5d : d0 06 __ BNE $1b65 ; (nformf.s64 + 0)
.s65:
1b5f : a5 4f __ LDA T4 + 0 
1b61 : c9 04 __ CMP #$04
1b63 : 90 07 __ BCC $1b6c ; (nformf.s13 + 0)
.s64:
1b65 : a9 01 __ LDA #$01
1b67 : 85 55 __ STA T10 + 0 
1b69 : 4c f5 1d JMP $1df5 ; (nformf.s53 + 0)
.s13:
1b6c : a5 55 __ LDA T10 + 0 
1b6e : d0 f9 __ BNE $1b69 ; (nformf.s64 + 4)
.s14:
1b70 : 24 50 __ BIT T4 + 1 
1b72 : 10 43 __ BPL $1bb7 ; (nformf.s15 + 0)
.s52:
1b74 : a5 43 __ LDA T0 + 0 
1b76 : 85 1b __ STA ACCU + 0 
1b78 : a5 44 __ LDA T0 + 1 
1b7a : 85 1c __ STA ACCU + 1 
1b7c : a5 45 __ LDA T0 + 2 
1b7e : 85 1d __ STA ACCU + 2 
1b80 : a5 46 __ LDA T0 + 3 
1b82 : 85 1e __ STA ACCU + 3 
.l108:
1b84 : a9 00 __ LDA #$00
1b86 : 85 03 __ STA WORK + 0 
1b88 : 85 04 __ STA WORK + 1 
1b8a : a9 20 __ LDA #$20
1b8c : 85 05 __ STA WORK + 2 
1b8e : a9 41 __ LDA #$41
1b90 : 85 06 __ STA WORK + 3 
1b92 : 20 e2 2a JSR $2ae2 ; (freg + 20)
1b95 : 20 c8 2c JSR $2cc8 ; (crt_fdiv + 0)
1b98 : 18 __ __ CLC
1b99 : a5 4f __ LDA T4 + 0 
1b9b : 69 01 __ ADC #$01
1b9d : 85 4f __ STA T4 + 0 
1b9f : a5 50 __ LDA T4 + 1 
1ba1 : 69 00 __ ADC #$00
1ba3 : 85 50 __ STA T4 + 1 
1ba5 : 30 dd __ BMI $1b84 ; (nformf.l108 + 0)
.s109:
1ba7 : a5 1e __ LDA ACCU + 3 
1ba9 : 85 46 __ STA T0 + 3 
1bab : a5 1d __ LDA ACCU + 2 
1bad : 85 45 __ STA T0 + 2 
1baf : a5 1c __ LDA ACCU + 1 
1bb1 : 85 44 __ STA T0 + 1 
1bb3 : a5 1b __ LDA ACCU + 0 
1bb5 : 85 43 __ STA T0 + 0 
.s15:
1bb7 : 18 __ __ CLC
1bb8 : a5 4d __ LDA T3 + 0 
1bba : 65 4f __ ADC T4 + 0 
1bbc : 18 __ __ CLC
1bbd : 69 01 __ ADC #$01
1bbf : 85 51 __ STA T5 + 0 
1bc1 : c9 07 __ CMP #$07
1bc3 : 90 14 __ BCC $1bd9 ; (nformf.s51 + 0)
.s16:
1bc5 : ad 56 30 LDA $3056 ; (fround5[0] + 24)
1bc8 : 85 47 __ STA T1 + 0 
1bca : ad 57 30 LDA $3057 ; (fround5[0] + 25)
1bcd : 85 48 __ STA T1 + 1 
1bcf : ad 58 30 LDA $3058 ; (fround5[0] + 26)
1bd2 : 85 49 __ STA T1 + 2 
1bd4 : ad 59 30 LDA $3059 ; (fround5[0] + 27)
1bd7 : b0 15 __ BCS $1bee ; (nformf.s17 + 0)
.s51:
1bd9 : 0a __ __ ASL
1bda : 0a __ __ ASL
1bdb : aa __ __ TAX
1bdc : bd 3a 30 LDA $303a,x ; (spentry + 0)
1bdf : 85 47 __ STA T1 + 0 
1be1 : bd 3b 30 LDA $303b,x ; (seed + 0)
1be4 : 85 48 __ STA T1 + 1 
1be6 : bd 3c 30 LDA $303c,x ; (seed + 1)
1be9 : 85 49 __ STA T1 + 2 
1beb : bd 3d 30 LDA $303d,x ; (giocharmap + 0)
.s17:
1bee : 85 4a __ STA T1 + 3 
1bf0 : a5 43 __ LDA T0 + 0 
1bf2 : 85 1b __ STA ACCU + 0 
1bf4 : a5 44 __ LDA T0 + 1 
1bf6 : 85 1c __ STA ACCU + 1 
1bf8 : a5 45 __ LDA T0 + 2 
1bfa : 85 1d __ STA ACCU + 2 
1bfc : a5 46 __ LDA T0 + 3 
1bfe : 85 1e __ STA ACCU + 3 
1c00 : a2 47 __ LDX #$47
1c02 : 20 d2 2a JSR $2ad2 ; (freg + 4)
1c05 : 20 19 2b JSR $2b19 ; (faddsub + 6)
1c08 : a5 1c __ LDA ACCU + 1 
1c0a : 85 16 __ STA P9 ; (f + 1)
1c0c : a5 1d __ LDA ACCU + 2 
1c0e : 85 17 __ STA P10 ; (f + 2)
1c10 : a6 1b __ LDX ACCU + 0 
1c12 : a5 1e __ LDA ACCU + 3 
1c14 : 85 18 __ STA P11 ; (f + 3)
1c16 : 30 3a __ BMI $1c52 ; (nformf.s18 + 0)
.s46:
1c18 : c9 41 __ CMP #$41
1c1a : d0 0d __ BNE $1c29 ; (nformf.s50 + 0)
.s47:
1c1c : a5 17 __ LDA P10 ; (f + 2)
1c1e : c9 20 __ CMP #$20
1c20 : d0 07 __ BNE $1c29 ; (nformf.s50 + 0)
.s48:
1c22 : a5 16 __ LDA P9 ; (f + 1)
1c24 : d0 03 __ BNE $1c29 ; (nformf.s50 + 0)
.s49:
1c26 : 8a __ __ TXA
1c27 : f0 02 __ BEQ $1c2b ; (nformf.s45 + 0)
.s50:
1c29 : 90 27 __ BCC $1c52 ; (nformf.s18 + 0)
.s45:
1c2b : a9 00 __ LDA #$00
1c2d : 85 03 __ STA WORK + 0 
1c2f : 85 04 __ STA WORK + 1 
1c31 : a9 20 __ LDA #$20
1c33 : 85 05 __ STA WORK + 2 
1c35 : a9 41 __ LDA #$41
1c37 : 85 06 __ STA WORK + 3 
1c39 : 20 e2 2a JSR $2ae2 ; (freg + 20)
1c3c : 20 c8 2c JSR $2cc8 ; (crt_fdiv + 0)
1c3f : a5 1c __ LDA ACCU + 1 
1c41 : 85 16 __ STA P9 ; (f + 1)
1c43 : a5 1d __ LDA ACCU + 2 
1c45 : 85 17 __ STA P10 ; (f + 2)
1c47 : a5 1e __ LDA ACCU + 3 
1c49 : 85 18 __ STA P11 ; (f + 3)
1c4b : a6 4d __ LDX T3 + 0 
1c4d : ca __ __ DEX
1c4e : 86 52 __ STX T6 + 0 
1c50 : a6 1b __ LDX ACCU + 0 
.s18:
1c52 : 38 __ __ SEC
1c53 : a5 51 __ LDA T5 + 0 
1c55 : e5 52 __ SBC T6 + 0 
1c57 : 85 4d __ STA T3 + 0 
1c59 : a9 00 __ LDA #$00
1c5b : e9 00 __ SBC #$00
1c5d : 85 4e __ STA T3 + 1 
1c5f : a9 14 __ LDA #$14
1c61 : c5 51 __ CMP T5 + 0 
1c63 : b0 02 __ BCS $1c67 ; (nformf.s19 + 0)
.s44:
1c65 : 85 51 __ STA T5 + 0 
.s19:
1c67 : a5 4d __ LDA T3 + 0 
1c69 : d0 08 __ BNE $1c73 ; (nformf.s21 + 0)
.s20:
1c6b : a9 30 __ LDA #$30
1c6d : a4 54 __ LDY T9 + 0 
1c6f : 91 13 __ STA (P6),y ; (str + 0)
1c71 : e6 54 __ INC T9 + 0 
.s21:
1c73 : a9 00 __ LDA #$00
1c75 : 85 56 __ STA T11 + 0 
1c77 : c5 4d __ CMP T3 + 0 
1c79 : f0 6f __ BEQ $1cea ; (nformf.l43 + 0)
.s23:
1c7b : c9 07 __ CMP #$07
1c7d : 90 04 __ BCC $1c83 ; (nformf.s24 + 0)
.l42:
1c7f : a9 30 __ LDA #$30
1c81 : b0 55 __ BCS $1cd8 ; (nformf.l25 + 0)
.s24:
1c83 : 86 1b __ STX ACCU + 0 
1c85 : 86 43 __ STX T0 + 0 
1c87 : a5 16 __ LDA P9 ; (f + 1)
1c89 : 85 1c __ STA ACCU + 1 
1c8b : 85 44 __ STA T0 + 1 
1c8d : a5 17 __ LDA P10 ; (f + 2)
1c8f : 85 1d __ STA ACCU + 2 
1c91 : 85 45 __ STA T0 + 2 
1c93 : a5 18 __ LDA P11 ; (f + 3)
1c95 : 85 1e __ STA ACCU + 3 
1c97 : 85 46 __ STA T0 + 3 
1c99 : 20 62 2e JSR $2e62 ; (f32_to_i16 + 0)
1c9c : a5 1b __ LDA ACCU + 0 
1c9e : 85 53 __ STA T7 + 0 
1ca0 : 20 ae 2e JSR $2eae ; (sint16_to_float + 0)
1ca3 : a2 43 __ LDX #$43
1ca5 : 20 d2 2a JSR $2ad2 ; (freg + 4)
1ca8 : a5 1e __ LDA ACCU + 3 
1caa : 49 80 __ EOR #$80
1cac : 85 1e __ STA ACCU + 3 
1cae : 20 19 2b JSR $2b19 ; (faddsub + 6)
1cb1 : a9 00 __ LDA #$00
1cb3 : 85 03 __ STA WORK + 0 
1cb5 : 85 04 __ STA WORK + 1 
1cb7 : a9 20 __ LDA #$20
1cb9 : 85 05 __ STA WORK + 2 
1cbb : a9 41 __ LDA #$41
1cbd : 85 06 __ STA WORK + 3 
1cbf : 20 e2 2a JSR $2ae2 ; (freg + 20)
1cc2 : 20 00 2c JSR $2c00 ; (crt_fmul + 0)
1cc5 : a5 1c __ LDA ACCU + 1 
1cc7 : 85 16 __ STA P9 ; (f + 1)
1cc9 : a5 1d __ LDA ACCU + 2 
1ccb : 85 17 __ STA P10 ; (f + 2)
1ccd : a5 1e __ LDA ACCU + 3 
1ccf : 85 18 __ STA P11 ; (f + 3)
1cd1 : 18 __ __ CLC
1cd2 : a5 53 __ LDA T7 + 0 
1cd4 : 69 30 __ ADC #$30
1cd6 : a6 1b __ LDX ACCU + 0 
.l25:
1cd8 : a4 54 __ LDY T9 + 0 
1cda : 91 13 __ STA (P6),y ; (str + 0)
1cdc : e6 54 __ INC T9 + 0 
1cde : e6 56 __ INC T11 + 0 
1ce0 : a5 56 __ LDA T11 + 0 
1ce2 : c5 51 __ CMP T5 + 0 
1ce4 : b0 14 __ BCS $1cfa ; (nformf.s26 + 0)
.s22:
1ce6 : c5 4d __ CMP T3 + 0 
1ce8 : d0 91 __ BNE $1c7b ; (nformf.s23 + 0)
.l43:
1cea : a9 2e __ LDA #$2e
1cec : a4 54 __ LDY T9 + 0 
1cee : 91 13 __ STA (P6),y ; (str + 0)
1cf0 : e6 54 __ INC T9 + 0 
1cf2 : a5 56 __ LDA T11 + 0 
1cf4 : c9 07 __ CMP #$07
1cf6 : 90 8b __ BCC $1c83 ; (nformf.s24 + 0)
1cf8 : b0 85 __ BCS $1c7f ; (nformf.l42 + 0)
.s26:
1cfa : a5 55 __ LDA T10 + 0 
1cfc : f0 66 __ BEQ $1d64 ; (nformf.s27 + 0)
.s38:
1cfe : a0 03 __ LDY #$03
1d00 : b1 4b __ LDA (T2 + 0),y 
1d02 : 69 03 __ ADC #$03
1d04 : a4 54 __ LDY T9 + 0 
1d06 : 91 13 __ STA (P6),y ; (str + 0)
1d08 : c8 __ __ INY
1d09 : 84 54 __ STY T9 + 0 
1d0b : 24 50 __ BIT T4 + 1 
1d0d : 30 06 __ BMI $1d15 ; (nformf.s41 + 0)
.s39:
1d0f : a9 2b __ LDA #$2b
1d11 : 91 13 __ STA (P6),y ; (str + 0)
1d13 : d0 11 __ BNE $1d26 ; (nformf.s40 + 0)
.s41:
1d15 : a9 2d __ LDA #$2d
1d17 : 91 13 __ STA (P6),y ; (str + 0)
1d19 : 38 __ __ SEC
1d1a : a9 00 __ LDA #$00
1d1c : e5 4f __ SBC T4 + 0 
1d1e : 85 4f __ STA T4 + 0 
1d20 : a9 00 __ LDA #$00
1d22 : e5 50 __ SBC T4 + 1 
1d24 : 85 50 __ STA T4 + 1 
.s40:
1d26 : e6 54 __ INC T9 + 0 
1d28 : a5 4f __ LDA T4 + 0 
1d2a : 85 1b __ STA ACCU + 0 
1d2c : a5 50 __ LDA T4 + 1 
1d2e : 85 1c __ STA ACCU + 1 
1d30 : a9 0a __ LDA #$0a
1d32 : 85 03 __ STA WORK + 0 
1d34 : a9 00 __ LDA #$00
1d36 : 85 04 __ STA WORK + 1 
1d38 : 20 76 2d JSR $2d76 ; (divs16 + 0)
1d3b : 18 __ __ CLC
1d3c : a5 1b __ LDA ACCU + 0 
1d3e : 69 30 __ ADC #$30
1d40 : a4 54 __ LDY T9 + 0 
1d42 : 91 13 __ STA (P6),y ; (str + 0)
1d44 : e6 54 __ INC T9 + 0 
1d46 : a5 4f __ LDA T4 + 0 
1d48 : 85 1b __ STA ACCU + 0 
1d4a : a5 50 __ LDA T4 + 1 
1d4c : 85 1c __ STA ACCU + 1 
1d4e : a9 0a __ LDA #$0a
1d50 : 85 03 __ STA WORK + 0 
1d52 : a9 00 __ LDA #$00
1d54 : 85 04 __ STA WORK + 1 
1d56 : 20 35 2e JSR $2e35 ; (mods16 + 0)
1d59 : 18 __ __ CLC
1d5a : a5 05 __ LDA WORK + 2 
1d5c : 69 30 __ ADC #$30
1d5e : a4 54 __ LDY T9 + 0 
1d60 : 91 13 __ STA (P6),y ; (str + 0)
1d62 : e6 54 __ INC T9 + 0 
.s27:
1d64 : a5 54 __ LDA T9 + 0 
1d66 : a0 01 __ LDY #$01
1d68 : d1 11 __ CMP (P4),y ; (si + 0)
1d6a : b0 6d __ BCS $1dd9 ; (nformf.s3 + 0)
.s28:
1d6c : a0 06 __ LDY #$06
1d6e : b1 11 __ LDA (P4),y ; (si + 0)
1d70 : f0 04 __ BEQ $1d76 ; (nformf.s29 + 0)
.s110:
1d72 : a6 54 __ LDX T9 + 0 
1d74 : 90 70 __ BCC $1de6 ; (nformf.l36 + 0)
.s29:
1d76 : a5 54 __ LDA T9 + 0 
1d78 : f0 40 __ BEQ $1dba ; (nformf.s30 + 0)
.s35:
1d7a : e9 00 __ SBC #$00
1d7c : a8 __ __ TAY
1d7d : a9 00 __ LDA #$00
1d7f : e9 00 __ SBC #$00
1d81 : aa __ __ TAX
1d82 : 98 __ __ TYA
1d83 : 18 __ __ CLC
1d84 : 65 13 __ ADC P6 ; (str + 0)
1d86 : 85 47 __ STA T1 + 0 
1d88 : 8a __ __ TXA
1d89 : 65 14 __ ADC P7 ; (str + 1)
1d8b : 85 48 __ STA T1 + 1 
1d8d : a9 01 __ LDA #$01
1d8f : 85 4d __ STA T3 + 0 
1d91 : a6 54 __ LDX T9 + 0 
1d93 : 38 __ __ SEC
.l111:
1d94 : a0 01 __ LDY #$01
1d96 : b1 11 __ LDA (P4),y ; (si + 0)
1d98 : e5 4d __ SBC T3 + 0 
1d9a : 85 4b __ STA T2 + 0 
1d9c : a9 00 __ LDA #$00
1d9e : e5 4e __ SBC T3 + 1 
1da0 : 18 __ __ CLC
1da1 : 65 14 __ ADC P7 ; (str + 1)
1da3 : 85 4c __ STA T2 + 1 
1da5 : 88 __ __ DEY
1da6 : b1 47 __ LDA (T1 + 0),y 
1da8 : a4 13 __ LDY P6 ; (str + 0)
1daa : 91 4b __ STA (T2 + 0),y 
1dac : a5 47 __ LDA T1 + 0 
1dae : d0 02 __ BNE $1db2 ; (nformf.s114 + 0)
.s113:
1db0 : c6 48 __ DEC T1 + 1 
.s114:
1db2 : c6 47 __ DEC T1 + 0 
1db4 : e6 4d __ INC T3 + 0 
1db6 : e4 4d __ CPX T3 + 0 
1db8 : b0 da __ BCS $1d94 ; (nformf.l111 + 0)
.s30:
1dba : a9 00 __ LDA #$00
1dbc : 85 4d __ STA T3 + 0 
1dbe : 90 08 __ BCC $1dc8 ; (nformf.l31 + 0)
.s33:
1dc0 : a9 20 __ LDA #$20
1dc2 : a4 4d __ LDY T3 + 0 
1dc4 : 91 13 __ STA (P6),y ; (str + 0)
1dc6 : e6 4d __ INC T3 + 0 
.l31:
1dc8 : a0 01 __ LDY #$01
1dca : b1 11 __ LDA (P4),y ; (si + 0)
1dcc : 38 __ __ SEC
1dcd : e5 54 __ SBC T9 + 0 
1dcf : 90 ef __ BCC $1dc0 ; (nformf.s33 + 0)
.s34:
1dd1 : c5 4d __ CMP T3 + 0 
1dd3 : 90 02 __ BCC $1dd7 ; (nformf.s32 + 0)
.s112:
1dd5 : d0 e9 __ BNE $1dc0 ; (nformf.s33 + 0)
.s32:
1dd7 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
1dd9 : 85 1b __ STA ACCU + 0 
1ddb : a2 03 __ LDX #$03
1ddd : bd dd 9f LDA $9fdd,x ; (nformf@stack + 0)
1de0 : 95 53 __ STA T7 + 0,x 
1de2 : ca __ __ DEX
1de3 : 10 f8 __ BPL $1ddd ; (nformf.s3 + 4)
1de5 : 60 __ __ RTS
.l36:
1de6 : 8a __ __ TXA
1de7 : a0 01 __ LDY #$01
1de9 : d1 11 __ CMP (P4),y ; (si + 0)
1deb : b0 ea __ BCS $1dd7 ; (nformf.s32 + 0)
.s37:
1ded : a8 __ __ TAY
1dee : a9 20 __ LDA #$20
1df0 : 91 13 __ STA (P6),y ; (str + 0)
1df2 : e8 __ __ INX
1df3 : 90 f1 __ BCC $1de6 ; (nformf.l36 + 0)
.s53:
1df5 : a5 51 __ LDA T5 + 0 
1df7 : c9 07 __ CMP #$07
1df9 : 90 14 __ BCC $1e0f ; (nformf.s62 + 0)
.s54:
1dfb : ad 56 30 LDA $3056 ; (fround5[0] + 24)
1dfe : 85 47 __ STA T1 + 0 
1e00 : ad 57 30 LDA $3057 ; (fround5[0] + 25)
1e03 : 85 48 __ STA T1 + 1 
1e05 : ad 58 30 LDA $3058 ; (fround5[0] + 26)
1e08 : 85 49 __ STA T1 + 2 
1e0a : ad 59 30 LDA $3059 ; (fround5[0] + 27)
1e0d : b0 15 __ BCS $1e24 ; (nformf.s55 + 0)
.s62:
1e0f : 0a __ __ ASL
1e10 : 0a __ __ ASL
1e11 : aa __ __ TAX
1e12 : bd 3a 30 LDA $303a,x ; (spentry + 0)
1e15 : 85 47 __ STA T1 + 0 
1e17 : bd 3b 30 LDA $303b,x ; (seed + 0)
1e1a : 85 48 __ STA T1 + 1 
1e1c : bd 3c 30 LDA $303c,x ; (seed + 1)
1e1f : 85 49 __ STA T1 + 2 
1e21 : bd 3d 30 LDA $303d,x ; (giocharmap + 0)
.s55:
1e24 : 85 4a __ STA T1 + 3 
1e26 : a5 43 __ LDA T0 + 0 
1e28 : 85 1b __ STA ACCU + 0 
1e2a : a5 44 __ LDA T0 + 1 
1e2c : 85 1c __ STA ACCU + 1 
1e2e : a5 45 __ LDA T0 + 2 
1e30 : 85 1d __ STA ACCU + 2 
1e32 : a5 46 __ LDA T0 + 3 
1e34 : 85 1e __ STA ACCU + 3 
1e36 : a2 47 __ LDX #$47
1e38 : 20 d2 2a JSR $2ad2 ; (freg + 4)
1e3b : 20 19 2b JSR $2b19 ; (faddsub + 6)
1e3e : a5 1c __ LDA ACCU + 1 
1e40 : 85 16 __ STA P9 ; (f + 1)
1e42 : a5 1d __ LDA ACCU + 2 
1e44 : 85 17 __ STA P10 ; (f + 2)
1e46 : a6 1b __ LDX ACCU + 0 
1e48 : a5 1e __ LDA ACCU + 3 
1e4a : 85 18 __ STA P11 ; (f + 3)
1e4c : 10 03 __ BPL $1e51 ; (nformf.s57 + 0)
1e4e : 4c 52 1c JMP $1c52 ; (nformf.s18 + 0)
.s57:
1e51 : c9 41 __ CMP #$41
1e53 : d0 0d __ BNE $1e62 ; (nformf.s61 + 0)
.s58:
1e55 : a5 17 __ LDA P10 ; (f + 2)
1e57 : c9 20 __ CMP #$20
1e59 : d0 07 __ BNE $1e62 ; (nformf.s61 + 0)
.s59:
1e5b : a5 16 __ LDA P9 ; (f + 1)
1e5d : d0 03 __ BNE $1e62 ; (nformf.s61 + 0)
.s60:
1e5f : 8a __ __ TXA
1e60 : f0 02 __ BEQ $1e64 ; (nformf.s56 + 0)
.s61:
1e62 : 90 ea __ BCC $1e4e ; (nformf.s55 + 42)
.s56:
1e64 : a9 00 __ LDA #$00
1e66 : 85 03 __ STA WORK + 0 
1e68 : 85 04 __ STA WORK + 1 
1e6a : a9 20 __ LDA #$20
1e6c : 85 05 __ STA WORK + 2 
1e6e : a9 41 __ LDA #$41
1e70 : 85 06 __ STA WORK + 3 
1e72 : 20 e2 2a JSR $2ae2 ; (freg + 20)
1e75 : 20 c8 2c JSR $2cc8 ; (crt_fdiv + 0)
1e78 : a5 1c __ LDA ACCU + 1 
1e7a : 85 16 __ STA P9 ; (f + 1)
1e7c : a5 1d __ LDA ACCU + 2 
1e7e : 85 17 __ STA P10 ; (f + 2)
1e80 : a5 1e __ LDA ACCU + 3 
1e82 : 85 18 __ STA P11 ; (f + 3)
1e84 : a6 1b __ LDX ACCU + 0 
1e86 : e6 4f __ INC T4 + 0 
1e88 : d0 c4 __ BNE $1e4e ; (nformf.s55 + 42)
.s117:
1e8a : e6 50 __ INC T4 + 1 
1e8c : 4c 52 1c JMP $1c52 ; (nformf.s18 + 0)
.s102:
1e8f : 86 43 __ STX T0 + 0 
1e91 : 85 47 __ STA T1 + 0 
1e93 : a0 03 __ LDY #$03
1e95 : b1 11 __ LDA (P4),y ; (si + 0)
1e97 : 18 __ __ CLC
1e98 : 69 08 __ ADC #$08
1e9a : a4 43 __ LDY T0 + 0 
1e9c : 91 13 __ STA (P6),y ; (str + 0)
1e9e : 18 __ __ CLC
1e9f : a0 03 __ LDY #$03
1ea1 : b1 11 __ LDA (P4),y ; (si + 0)
1ea3 : 69 0d __ ADC #$0d
1ea5 : a4 43 __ LDY T0 + 0 
1ea7 : c8 __ __ INY
1ea8 : 91 13 __ STA (P6),y ; (str + 0)
1eaa : a0 03 __ LDY #$03
1eac : b1 11 __ LDA (P4),y ; (si + 0)
1eae : 18 __ __ CLC
1eaf : 69 05 __ ADC #$05
1eb1 : a4 47 __ LDY T1 + 0 
1eb3 : 91 13 __ STA (P6),y ; (str + 0)
1eb5 : 18 __ __ CLC
1eb6 : a5 54 __ LDA T9 + 0 
1eb8 : 69 03 __ ADC #$03
1eba : 85 54 __ STA T9 + 0 
1ebc : 4c 64 1d JMP $1d64 ; (nformf.s27 + 0)
.s104:
1ebf : 20 d0 1e JSR $1ed0 ; (isinf.s4 + 0)
1ec2 : a2 01 __ LDX #$01
1ec4 : 86 54 __ STX T9 + 0 
1ec6 : a8 __ __ TAY
1ec7 : d0 03 __ BNE $1ecc ; (nformf.s105 + 0)
1ec9 : 4c d9 19 JMP $19d9 ; (nformf.s7 + 0)
.s105:
1ecc : a9 03 __ LDA #$03
1ece : d0 bf __ BNE $1e8f ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
1ed0 : 06 0f __ ASL P2 ; (f + 2)
1ed2 : a5 10 __ LDA P3 ; (f + 3)
1ed4 : 2a __ __ ROL
1ed5 : c9 ff __ CMP #$ff
1ed7 : d0 03 __ BNE $1edc ; (isinf.s6 + 0)
.s5:
1ed9 : a9 01 __ LDA #$01
1edb : 60 __ __ RTS
.s6:
1edc : a9 00 __ LDA #$00
.s3:
1ede : 60 __ __ RTS
--------------------------------------------------------------------
1edf : __ __ __ BYT 54 49 4d 45 20 3a 20 25 2e 31 66 20 53 45 43 53 : TIME : %.1f SECS
1eef : __ __ __ BYT 2e 00                                           : ..
--------------------------------------------------------------------
bmu_put_chars: ; bmu_put_chars(const struct Bitmap*,i16,i16,const u8*,u8,enum BlitOp)->i16
; 157, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
1ef1 : a2 04 __ LDX #$04
1ef3 : b5 53 __ LDA T2 + 0,x 
1ef5 : 9d d8 9f STA $9fd8,x ; (bmu_put_chars@stack + 0)
1ef8 : ca __ __ DEX
1ef9 : 10 f8 __ BPL $1ef3 ; (bmu_put_chars.s1 + 2)
.s4:
1efb : ad f9 9f LDA $9ff9 ; (sstack + 19)
1efe : 85 54 __ STA T2 + 1 
1f00 : a9 85 __ LDA #$85
1f02 : 85 0d __ STA P0 
1f04 : a9 32 __ LDA #$32
1f06 : 85 0e __ STA P1 
1f08 : ad f8 9f LDA $9ff8 ; (sstack + 18)
1f0b : 85 53 __ STA T2 + 0 
1f0d : 29 07 __ AND #$07
1f0f : 85 55 __ STA T3 + 0 
1f11 : 85 0f __ STA P2 
1f13 : ad fc 9f LDA $9ffc ; (sstack + 22)
1f16 : 85 10 __ STA P3 
1f18 : ad fd 9f LDA $9ffd ; (sstack + 23)
1f1b : 85 11 __ STA P4 
1f1d : ad fe 9f LDA $9ffe ; (sstack + 24)
1f20 : 85 12 __ STA P5 
1f22 : 20 96 1f JSR $1f96 ; (bmu_text.s4 + 0)
1f25 : a5 1b __ LDA ACCU + 0 
1f27 : 85 56 __ STA T4 + 0 
1f29 : 8d f0 9f STA $9ff0 ; (sstack + 10)
1f2c : a5 1c __ LDA ACCU + 1 
1f2e : 85 57 __ STA T4 + 1 
1f30 : 8d f1 9f STA $9ff1 ; (sstack + 11)
1f33 : ad f6 9f LDA $9ff6 ; (sstack + 16)
1f36 : 85 16 __ STA P9 
1f38 : ad f7 9f LDA $9ff7 ; (sstack + 17)
1f3b : 85 17 __ STA P10 
1f3d : ad ff 9f LDA $9fff ; (sstack + 25)
1f40 : 85 18 __ STA P11 
1f42 : a5 53 __ LDA T2 + 0 
1f44 : 8d e6 9f STA $9fe6 ; (sstack + 0)
1f47 : a5 54 __ LDA T2 + 1 
1f49 : 8d e7 9f STA $9fe7 ; (sstack + 1)
1f4c : ad fa 9f LDA $9ffa ; (sstack + 20)
1f4f : 8d e8 9f STA $9fe8 ; (sstack + 2)
1f52 : ad fb 9f LDA $9ffb ; (sstack + 21)
1f55 : 8d e9 9f STA $9fe9 ; (sstack + 3)
1f58 : a9 85 __ LDA #$85
1f5a : 8d ea 9f STA $9fea ; (sstack + 4)
1f5d : a9 32 __ LDA #$32
1f5f : 8d eb 9f STA $9feb ; (sstack + 5)
1f62 : a5 55 __ LDA T3 + 0 
1f64 : 8d ec 9f STA $9fec ; (sstack + 6)
1f67 : a9 00 __ LDA #$00
1f69 : 8d ed 9f STA $9fed ; (sstack + 7)
1f6c : 8d ee 9f STA $9fee ; (sstack + 8)
1f6f : 8d ef 9f STA $9fef ; (sstack + 9)
1f72 : 8d f3 9f STA $9ff3 ; (sstack + 13)
1f75 : 8d f4 9f STA $9ff4 ; (sstack + 14)
1f78 : 8d f5 9f STA $9ff5 ; (sstack + 15)
1f7b : a9 08 __ LDA #$08
1f7d : 8d f2 9f STA $9ff2 ; (sstack + 12)
1f80 : 20 3d 21 JSR $213d ; (bmu_bitblit.s1 + 0)
1f83 : a5 56 __ LDA T4 + 0 
1f85 : 85 1b __ STA ACCU + 0 
1f87 : a5 57 __ LDA T4 + 1 
1f89 : 85 1c __ STA ACCU + 1 
.s3:
1f8b : a2 04 __ LDX #$04
1f8d : bd d8 9f LDA $9fd8,x ; (bmu_put_chars@stack + 0)
1f90 : 95 53 __ STA T2 + 0,x 
1f92 : ca __ __ DEX
1f93 : 10 f8 __ BPL $1f8d ; (bmu_put_chars.s3 + 2)
1f95 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_text: ; bmu_text(const struct Bitmap*,u8,const u8*,u8)->i16
; 151, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1f96 : a9 00 __ LDA #$00
1f98 : 8d e1 32 STA $32e1 ; (tworks[0] + 0)
1f9b : 8d e2 32 STA $32e2 ; (tworks[0] + 1)
1f9e : 8d e3 32 STA $32e3 ; (tworks[0] + 2)
1fa1 : 8d e4 32 STA $32e4 ; (tworks[0] + 3)
1fa4 : 8d e5 32 STA $32e5 ; (tworks[0] + 4)
1fa7 : 8d e6 32 STA $32e6 ; (tworks[0] + 5)
1faa : 8d e7 32 STA $32e7 ; (tworks[0] + 6)
1fad : 8d e8 32 STA $32e8 ; (tworks[0] + 7)
1fb0 : 85 43 __ STA T0 + 0 
1fb2 : 85 44 __ STA T0 + 1 
1fb4 : a8 __ __ TAY
1fb5 : b1 0d __ LDA (P0),y ; (bm + 0)
1fb7 : 85 45 __ STA T1 + 0 
1fb9 : c8 __ __ INY
1fba : b1 0d __ LDA (P0),y ; (bm + 0)
1fbc : 85 46 __ STA T1 + 1 
1fbe : a5 12 __ LDA P5 ; (len + 0)
1fc0 : d0 03 __ BNE $1fc5 ; (bmu_text.s8 + 0)
1fc2 : 4c db 20 JMP $20db ; (bmu_text.s5 + 0)
.s8:
1fc5 : a9 00 __ LDA #$00
1fc7 : 85 4c __ STA T7 + 0 
1fc9 : 85 47 __ STA T2 + 0 
.l9:
1fcb : a4 47 __ LDY T2 + 0 
1fcd : b1 10 __ LDA (P3),y ; (str + 0)
1fcf : 38 __ __ SEC
1fd0 : e9 20 __ SBC #$20
1fd2 : aa __ __ TAX
1fd3 : 18 __ __ CLC
1fd4 : a9 1a __ LDA #$1a
1fd6 : 7d 5a 30 ADC $305a,x ; (TinyFont[0] + 0)
1fd9 : 85 4a __ STA T6 + 0 
1fdb : bd ba 30 LDA $30ba,x ; (TinyFont[0] + 96)
1fde : 29 03 __ AND #$03
1fe0 : 69 31 __ ADC #$31
1fe2 : 85 4b __ STA T6 + 1 
1fe4 : bd ba 30 LDA $30ba,x ; (TinyFont[0] + 96)
1fe7 : 4a __ __ LSR
1fe8 : 4a __ __ LSR
1fe9 : 85 48 __ STA T4 + 0 
1feb : 38 __ __ SEC
1fec : 65 43 __ ADC T0 + 0 
1fee : 85 43 __ STA T0 + 0 
1ff0 : 90 02 __ BCC $1ff4 ; (bmu_text.s18 + 0)
.s17:
1ff2 : e6 44 __ INC T0 + 1 
.s18:
1ff4 : a9 00 __ LDA #$00
1ff6 : 85 4d __ STA T8 + 0 
1ff8 : a5 48 __ LDA T4 + 0 
1ffa : f0 75 __ BEQ $2071 ; (bmu_text.s10 + 0)
.s16:
1ffc : a0 00 __ LDY #$00
.l13:
1ffe : b1 4a __ LDA (T6 + 0),y 
2000 : 85 49 __ STA T5 + 0 
2002 : a5 49 __ LDA T5 + 0 
2004 : 0a __ __ ASL
2005 : 2e e1 32 ROL $32e1 ; (tworks[0] + 0)
2008 : 0a __ __ ASL
2009 : 2e e2 32 ROL $32e2 ; (tworks[0] + 1)
200c : 0a __ __ ASL
200d : 2e e3 32 ROL $32e3 ; (tworks[0] + 2)
2010 : 0a __ __ ASL
2011 : 2e e4 32 ROL $32e4 ; (tworks[0] + 3)
2014 : 0a __ __ ASL
2015 : 2e e5 32 ROL $32e5 ; (tworks[0] + 4)
2018 : 0a __ __ ASL
2019 : 2e e6 32 ROL $32e6 ; (tworks[0] + 5)
201c : 0a __ __ ASL
201d : 2e e7 32 ROL $32e7 ; (tworks[0] + 6)
2020 : 0a __ __ ASL
2021 : 2e e8 32 ROL $32e8 ; (tworks[0] + 7)
2024 : e6 0f __ INC P2 ; (lx + 0)
2026 : a5 0f __ LDA P2 ; (lx + 0)
2028 : c9 08 __ CMP #$08
202a : d0 3d __ BNE $2069 ; (bmu_text.s14 + 0)
.s15:
202c : ad e1 32 LDA $32e1 ; (tworks[0] + 0)
202f : a0 00 __ LDY #$00
2031 : 84 0f __ STY P2 ; (lx + 0)
2033 : 91 45 __ STA (T1 + 0),y 
2035 : ad e2 32 LDA $32e2 ; (tworks[0] + 1)
2038 : c8 __ __ INY
2039 : 91 45 __ STA (T1 + 0),y 
203b : ad e3 32 LDA $32e3 ; (tworks[0] + 2)
203e : c8 __ __ INY
203f : 91 45 __ STA (T1 + 0),y 
2041 : ad e4 32 LDA $32e4 ; (tworks[0] + 3)
2044 : c8 __ __ INY
2045 : 91 45 __ STA (T1 + 0),y 
2047 : ad e5 32 LDA $32e5 ; (tworks[0] + 4)
204a : c8 __ __ INY
204b : 91 45 __ STA (T1 + 0),y 
204d : ad e6 32 LDA $32e6 ; (tworks[0] + 5)
2050 : c8 __ __ INY
2051 : 91 45 __ STA (T1 + 0),y 
2053 : ad e7 32 LDA $32e7 ; (tworks[0] + 6)
2056 : c8 __ __ INY
2057 : 91 45 __ STA (T1 + 0),y 
2059 : ad e8 32 LDA $32e8 ; (tworks[0] + 7)
205c : c8 __ __ INY
205d : 91 45 __ STA (T1 + 0),y 
205f : a5 45 __ LDA T1 + 0 
2061 : 69 07 __ ADC #$07
2063 : 85 45 __ STA T1 + 0 
2065 : 90 02 __ BCC $2069 ; (bmu_text.s14 + 0)
.s19:
2067 : e6 46 __ INC T1 + 1 
.s14:
2069 : e6 4d __ INC T8 + 0 
206b : a4 4d __ LDY T8 + 0 
206d : c4 48 __ CPY T4 + 0 
206f : 90 8d __ BCC $1ffe ; (bmu_text.l13 + 0)
.s10:
2071 : 0e e1 32 ASL $32e1 ; (tworks[0] + 0)
2074 : 0e e2 32 ASL $32e2 ; (tworks[0] + 1)
2077 : 0e e3 32 ASL $32e3 ; (tworks[0] + 2)
207a : 0e e4 32 ASL $32e4 ; (tworks[0] + 3)
207d : 0e e5 32 ASL $32e5 ; (tworks[0] + 4)
2080 : 0e e6 32 ASL $32e6 ; (tworks[0] + 5)
2083 : 0e e7 32 ASL $32e7 ; (tworks[0] + 6)
2086 : 0e e8 32 ASL $32e8 ; (tworks[0] + 7)
2089 : e6 0f __ INC P2 ; (lx + 0)
208b : a5 0f __ LDA P2 ; (lx + 0)
208d : c9 08 __ CMP #$08
208f : d0 3d __ BNE $20ce ; (bmu_text.s11 + 0)
.s12:
2091 : ad e1 32 LDA $32e1 ; (tworks[0] + 0)
2094 : a0 00 __ LDY #$00
2096 : 84 0f __ STY P2 ; (lx + 0)
2098 : 91 45 __ STA (T1 + 0),y 
209a : ad e2 32 LDA $32e2 ; (tworks[0] + 1)
209d : c8 __ __ INY
209e : 91 45 __ STA (T1 + 0),y 
20a0 : ad e3 32 LDA $32e3 ; (tworks[0] + 2)
20a3 : c8 __ __ INY
20a4 : 91 45 __ STA (T1 + 0),y 
20a6 : ad e4 32 LDA $32e4 ; (tworks[0] + 3)
20a9 : c8 __ __ INY
20aa : 91 45 __ STA (T1 + 0),y 
20ac : ad e5 32 LDA $32e5 ; (tworks[0] + 4)
20af : c8 __ __ INY
20b0 : 91 45 __ STA (T1 + 0),y 
20b2 : ad e6 32 LDA $32e6 ; (tworks[0] + 5)
20b5 : c8 __ __ INY
20b6 : 91 45 __ STA (T1 + 0),y 
20b8 : ad e7 32 LDA $32e7 ; (tworks[0] + 6)
20bb : c8 __ __ INY
20bc : 91 45 __ STA (T1 + 0),y 
20be : ad e8 32 LDA $32e8 ; (tworks[0] + 7)
20c1 : c8 __ __ INY
20c2 : 91 45 __ STA (T1 + 0),y 
20c4 : a5 45 __ LDA T1 + 0 
20c6 : 69 07 __ ADC #$07
20c8 : 85 45 __ STA T1 + 0 
20ca : 90 02 __ BCC $20ce ; (bmu_text.s11 + 0)
.s20:
20cc : e6 46 __ INC T1 + 1 
.s11:
20ce : e6 47 __ INC T2 + 0 
20d0 : e6 4c __ INC T7 + 0 
20d2 : a5 4c __ LDA T7 + 0 
20d4 : c5 12 __ CMP P5 ; (len + 0)
20d6 : b0 03 __ BCS $20db ; (bmu_text.s5 + 0)
20d8 : 4c cb 1f JMP $1fcb ; (bmu_text.l9 + 0)
.s5:
20db : a5 0f __ LDA P2 ; (lx + 0)
20dd : 85 47 __ STA T2 + 0 
20df : c9 08 __ CMP #$08
20e1 : b0 20 __ BCS $2103 ; (bmu_text.s6 + 0)
.l7:
20e3 : 0e e1 32 ASL $32e1 ; (tworks[0] + 0)
20e6 : 0e e2 32 ASL $32e2 ; (tworks[0] + 1)
20e9 : 0e e3 32 ASL $32e3 ; (tworks[0] + 2)
20ec : 0e e4 32 ASL $32e4 ; (tworks[0] + 3)
20ef : 0e e5 32 ASL $32e5 ; (tworks[0] + 4)
20f2 : 0e e6 32 ASL $32e6 ; (tworks[0] + 5)
20f5 : 0e e7 32 ASL $32e7 ; (tworks[0] + 6)
20f8 : 0e e8 32 ASL $32e8 ; (tworks[0] + 7)
20fb : e6 47 __ INC T2 + 0 
20fd : a5 47 __ LDA T2 + 0 
20ff : c9 08 __ CMP #$08
2101 : 90 e0 __ BCC $20e3 ; (bmu_text.l7 + 0)
.s6:
2103 : ad e1 32 LDA $32e1 ; (tworks[0] + 0)
2106 : a0 00 __ LDY #$00
2108 : 91 45 __ STA (T1 + 0),y 
210a : ad e2 32 LDA $32e2 ; (tworks[0] + 1)
210d : c8 __ __ INY
210e : 91 45 __ STA (T1 + 0),y 
2110 : ad e3 32 LDA $32e3 ; (tworks[0] + 2)
2113 : c8 __ __ INY
2114 : 91 45 __ STA (T1 + 0),y 
2116 : ad e4 32 LDA $32e4 ; (tworks[0] + 3)
2119 : c8 __ __ INY
211a : 91 45 __ STA (T1 + 0),y 
211c : ad e5 32 LDA $32e5 ; (tworks[0] + 4)
211f : c8 __ __ INY
2120 : 91 45 __ STA (T1 + 0),y 
2122 : ad e6 32 LDA $32e6 ; (tworks[0] + 5)
2125 : c8 __ __ INY
2126 : 91 45 __ STA (T1 + 0),y 
2128 : ad e7 32 LDA $32e7 ; (tworks[0] + 6)
212b : c8 __ __ INY
212c : 91 45 __ STA (T1 + 0),y 
212e : ad e8 32 LDA $32e8 ; (tworks[0] + 7)
2131 : c8 __ __ INY
2132 : 91 45 __ STA (T1 + 0),y 
2134 : a5 43 __ LDA T0 + 0 
2136 : 85 1b __ STA ACCU + 0 
2138 : a5 44 __ LDA T0 + 1 
213a : 85 1c __ STA ACCU + 1 
.s3:
213c : 60 __ __ RTS
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
213d : a5 53 __ LDA T6 + 0 
213f : 8d e0 9f STA $9fe0 ; (bmu_bitblit@stack + 0)
2142 : a5 54 __ LDA T6 + 1 
2144 : 8d e1 9f STA $9fe1 ; (bmu_bitblit@stack + 1)
2147 : a5 55 __ LDA T8 + 0 
2149 : 8d e2 9f STA $9fe2 ; (bmu_bitblit@stack + 2)
.s4:
214c : ad e6 9f LDA $9fe6 ; (sstack + 0)
214f : 85 4e __ STA T2 + 0 
2151 : 18 __ __ CLC
2152 : 6d f0 9f ADC $9ff0 ; (sstack + 10)
2155 : 85 45 __ STA T1 + 0 
2157 : 29 07 __ AND #$07
2159 : aa __ __ TAX
215a : bd 95 32 LDA $3295,x ; (rmask[0] + 0)
215d : 85 13 __ STA P6 
215f : ad f1 9f LDA $9ff1 ; (sstack + 11)
2162 : 6d e7 9f ADC $9fe7 ; (sstack + 1)
2165 : 4a __ __ LSR
2166 : 66 45 __ ROR T1 + 0 
2168 : 4a __ __ LSR
2169 : 66 45 __ ROR T1 + 0 
216b : 4a __ __ LSR
216c : 66 45 __ ROR T1 + 0 
216e : ad e7 9f LDA $9fe7 ; (sstack + 1)
2171 : 4a __ __ LSR
2172 : 66 4e __ ROR T2 + 0 
2174 : 4a __ __ LSR
2175 : 66 4e __ ROR T2 + 0 
2177 : 4a __ __ LSR
2178 : 66 4e __ ROR T2 + 0 
217a : 38 __ __ SEC
217b : a5 45 __ LDA T1 + 0 
217d : e5 4e __ SBC T2 + 0 
217f : 85 11 __ STA P4 
2181 : ad e6 9f LDA $9fe6 ; (sstack + 0)
2184 : 29 07 __ AND #$07
2186 : 85 4e __ STA T2 + 0 
2188 : aa __ __ TAX
2189 : bd 8d 32 LDA $328d,x ; (lmask[0] + 0)
218c : 85 4c __ STA T10 + 0 
218e : 85 12 __ STA P5 
2190 : ad ea 9f LDA $9fea ; (sstack + 4)
2193 : 85 49 __ STA T4 + 0 
2195 : ad eb 9f LDA $9feb ; (sstack + 5)
2198 : 85 4a __ STA T4 + 1 
219a : a5 16 __ LDA P9 ; (dbm + 0)
219c : c5 49 __ CMP T4 + 0 
219e : d0 78 __ BNE $2218 ; (bmu_bitblit.s5 + 0)
.s52:
21a0 : a5 17 __ LDA P10 ; (dbm + 1)
21a2 : c5 4a __ CMP T4 + 1 
21a4 : d0 72 __ BNE $2218 ; (bmu_bitblit.s5 + 0)
.s38:
21a6 : ad ef 9f LDA $9fef ; (sstack + 9)
21a9 : cd e9 9f CMP $9fe9 ; (sstack + 3)
21ac : d0 0a __ BNE $21b8 ; (bmu_bitblit.s51 + 0)
.s48:
21ae : ad ee 9f LDA $9fee ; (sstack + 8)
21b1 : cd e8 9f CMP $9fe8 ; (sstack + 2)
.s49:
21b4 : b0 09 __ BCS $21bf ; (bmu_bitblit.s39 + 0)
21b6 : 90 30 __ BCC $21e8 ; (bmu_bitblit.s41 + 0)
.s51:
21b8 : 4d e9 9f EOR $9fe9 ; (sstack + 3)
21bb : 10 f7 __ BPL $21b4 ; (bmu_bitblit.s49 + 0)
.s50:
21bd : b0 29 __ BCS $21e8 ; (bmu_bitblit.s41 + 0)
.s39:
21bf : ad e9 9f LDA $9fe9 ; (sstack + 3)
21c2 : cd ef 9f CMP $9fef ; (sstack + 9)
21c5 : d0 51 __ BNE $2218 ; (bmu_bitblit.s5 + 0)
.s47:
21c7 : ad e8 9f LDA $9fe8 ; (sstack + 2)
21ca : cd ee 9f CMP $9fee ; (sstack + 8)
21cd : d0 49 __ BNE $2218 ; (bmu_bitblit.s5 + 0)
.s40:
21cf : ad ed 9f LDA $9fed ; (sstack + 7)
21d2 : cd e7 9f CMP $9fe7 ; (sstack + 1)
21d5 : d0 0a __ BNE $21e1 ; (bmu_bitblit.s46 + 0)
.s43:
21d7 : ad ec 9f LDA $9fec ; (sstack + 6)
21da : cd e6 9f CMP $9fe6 ; (sstack + 0)
.s44:
21dd : 90 09 __ BCC $21e8 ; (bmu_bitblit.s41 + 0)
21df : b0 37 __ BCS $2218 ; (bmu_bitblit.s5 + 0)
.s46:
21e1 : 4d e7 9f EOR $9fe7 ; (sstack + 1)
21e4 : 10 f7 __ BPL $21dd ; (bmu_bitblit.s44 + 0)
.s45:
21e6 : 90 30 __ BCC $2218 ; (bmu_bitblit.s5 + 0)
.s41:
21e8 : a5 18 __ LDA P11 ; (op + 0)
21ea : 29 08 __ AND #$08
21ec : f0 2a __ BEQ $2218 ; (bmu_bitblit.s5 + 0)
.s42:
21ee : ad f2 9f LDA $9ff2 ; (sstack + 12)
21f1 : 18 __ __ CLC
21f2 : 6d ee 9f ADC $9fee ; (sstack + 8)
21f5 : 8d ee 9f STA $9fee ; (sstack + 8)
21f8 : ad f3 9f LDA $9ff3 ; (sstack + 13)
21fb : 6d ef 9f ADC $9fef ; (sstack + 9)
21fe : 8d ef 9f STA $9fef ; (sstack + 9)
2201 : ad f2 9f LDA $9ff2 ; (sstack + 12)
2204 : 18 __ __ CLC
2205 : 6d e8 9f ADC $9fe8 ; (sstack + 2)
2208 : 8d e8 9f STA $9fe8 ; (sstack + 2)
220b : ad f3 9f LDA $9ff3 ; (sstack + 13)
220e : 6d e9 9f ADC $9fe9 ; (sstack + 3)
2211 : 8d e9 9f STA $9fe9 ; (sstack + 3)
2214 : a9 01 __ LDA #$01
2216 : d0 02 __ BNE $221a ; (bmu_bitblit.s6 + 0)
.s5:
2218 : a9 00 __ LDA #$00
.s6:
221a : 85 15 __ STA P8 
221c : ad e9 9f LDA $9fe9 ; (sstack + 3)
221f : 85 1c __ STA ACCU + 1 ; (dy + 1)
2221 : ad e8 9f LDA $9fe8 ; (sstack + 2)
2224 : 29 f8 __ AND #$f8
2226 : 85 1b __ STA ACCU + 0 ; (dy + 0)
2228 : a0 04 __ LDY #$04
222a : b1 16 __ LDA (P9),y ; (dbm + 0)
222c : 85 52 __ STA T7 + 0 
222e : 20 96 2a JSR $2a96 ; (mul16by8 + 0)
2231 : a0 00 __ LDY #$00
2233 : b1 16 __ LDA (P9),y ; (dbm + 0)
2235 : 18 __ __ CLC
2236 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
2238 : 85 02 __ STA $02 
223a : c8 __ __ INY
223b : b1 16 __ LDA (P9),y ; (dbm + 0)
223d : 65 1c __ ADC ACCU + 1 ; (dy + 1)
223f : aa __ __ TAX
2240 : ad e6 9f LDA $9fe6 ; (sstack + 0)
2243 : 29 f8 __ AND #$f8
2245 : 18 __ __ CLC
2246 : 65 02 __ ADC $02 
2248 : 85 47 __ STA T3 + 0 
224a : 8a __ __ TXA
224b : 6d e7 9f ADC $9fe7 ; (sstack + 1)
224e : aa __ __ TAX
224f : ad e8 9f LDA $9fe8 ; (sstack + 2)
2252 : 29 07 __ AND #$07
2254 : 18 __ __ CLC
2255 : 65 47 __ ADC T3 + 0 
2257 : 85 53 __ STA T6 + 0 
2259 : 90 01 __ BCC $225c ; (bmu_bitblit.s54 + 0)
.s53:
225b : e8 __ __ INX
.s54:
225c : 86 54 __ STX T6 + 1 
225e : ad ef 9f LDA $9fef ; (sstack + 9)
2261 : 85 1c __ STA ACCU + 1 ; (dy + 1)
2263 : ad ee 9f LDA $9fee ; (sstack + 8)
2266 : 29 f8 __ AND #$f8
2268 : 85 1b __ STA ACCU + 0 ; (dy + 0)
226a : a0 04 __ LDY #$04
226c : b1 49 __ LDA (T4 + 0),y 
226e : 85 55 __ STA T8 + 0 
2270 : 20 96 2a JSR $2a96 ; (mul16by8 + 0)
2273 : a0 00 __ LDY #$00
2275 : b1 49 __ LDA (T4 + 0),y 
2277 : 18 __ __ CLC
2278 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
227a : 85 02 __ STA $02 
227c : c8 __ __ INY
227d : b1 49 __ LDA (T4 + 0),y 
227f : 65 1c __ ADC ACCU + 1 ; (dy + 1)
2281 : aa __ __ TAX
2282 : ad ec 9f LDA $9fec ; (sstack + 6)
2285 : 29 f8 __ AND #$f8
2287 : 18 __ __ CLC
2288 : 65 02 __ ADC $02 
228a : 85 49 __ STA T4 + 0 
228c : 8a __ __ TXA
228d : 6d ed 9f ADC $9fed ; (sstack + 7)
2290 : aa __ __ TAX
2291 : ad ee 9f LDA $9fee ; (sstack + 8)
2294 : 29 07 __ AND #$07
2296 : 18 __ __ CLC
2297 : 65 49 __ ADC T4 + 0 
2299 : 85 49 __ STA T4 + 0 
229b : 90 01 __ BCC $229e ; (bmu_bitblit.s56 + 0)
.s55:
229d : e8 __ __ INX
.s56:
229e : ad ec 9f LDA $9fec ; (sstack + 6)
22a1 : 29 07 __ AND #$07
22a3 : 49 ff __ EOR #$ff
22a5 : 38 __ __ SEC
22a6 : 65 4e __ ADC T2 + 0 
22a8 : 85 43 __ STA T0 + 0 
22aa : 29 07 __ AND #$07
22ac : 85 10 __ STA P3 
22ae : a5 15 __ LDA P8 
22b0 : f0 03 __ BEQ $22b5 ; (bmu_bitblit.s7 + 0)
22b2 : 4c a4 24 JMP $24a4 ; (bmu_bitblit.s36 + 0)
.s7:
22b5 : 86 51 __ STX T5 + 1 
22b7 : a4 49 __ LDY T4 + 0 
22b9 : 84 50 __ STY T5 + 0 
22bb : a5 43 __ LDA T0 + 0 
22bd : f0 0d __ BEQ $22cc ; (bmu_bitblit.s8 + 0)
.s34:
22bf : 30 0b __ BMI $22cc ; (bmu_bitblit.s8 + 0)
.s35:
22c1 : 98 __ __ TYA
22c2 : 18 __ __ CLC
22c3 : 69 f8 __ ADC #$f8
22c5 : 85 50 __ STA T5 + 0 
22c7 : 8a __ __ TXA
22c8 : 69 ff __ ADC #$ff
22ca : 85 51 __ STA T5 + 1 
.s8:
22cc : a5 18 __ LDA P11 ; (op + 0)
22ce : 85 14 __ STA P7 
22d0 : 20 ef 24 JSR $24ef ; (builddop.s4 + 0)
22d3 : 18 __ __ CLC
22d4 : a5 52 __ LDA T7 + 0 
22d6 : 69 ff __ ADC #$ff
22d8 : 2a __ __ ROL
22d9 : 2a __ __ ROL
22da : 2a __ __ ROL
22db : aa __ __ TAX
22dc : 29 f8 __ AND #$f8
22de : 85 43 __ STA T0 + 0 
22e0 : 8a __ __ TXA
22e1 : 29 07 __ AND #$07
22e3 : 2a __ __ ROL
22e4 : 69 f8 __ ADC #$f8
22e6 : 85 44 __ STA T0 + 1 
22e8 : ad f4 9f LDA $9ff4 ; (sstack + 14)
22eb : 85 45 __ STA T1 + 0 
22ed : 85 47 __ STA T3 + 0 
22ef : ad f5 9f LDA $9ff5 ; (sstack + 15)
22f2 : 85 46 __ STA T1 + 1 
22f4 : a5 18 __ LDA P11 ; (op + 0)
22f6 : 29 08 __ AND #$08
22f8 : f0 03 __ BEQ $22fd ; (bmu_bitblit.s9 + 0)
22fa : 4c 97 23 JMP $2397 ; (bmu_bitblit.s19 + 0)
.s9:
22fd : ad f2 9f LDA $9ff2 ; (sstack + 12)
2300 : 85 47 __ STA T3 + 0 
2302 : a5 18 __ LDA P11 ; (op + 0)
2304 : 29 20 __ AND #$20
2306 : d0 4c __ BNE $2354 ; (bmu_bitblit.s15 + 0)
.s10:
2308 : a5 47 __ LDA T3 + 0 
230a : f0 38 __ BEQ $2344 ; (bmu_bitblit.s3 + 0)
.s11:
230c : a9 00 __ LDA #$00
230e : 85 4e __ STA T2 + 0 
.l12:
2310 : a5 53 __ LDA T6 + 0 
2312 : 85 03 __ STA WORK + 0 
2314 : a5 54 __ LDA T6 + 1 
2316 : 85 04 __ STA WORK + 1 
2318 : a5 53 __ LDA T6 + 0 
231a : 85 05 __ STA WORK + 2 
231c : a5 54 __ LDA T6 + 1 
231e : 85 06 __ STA WORK + 3 
2320 : a5 4e __ LDA T2 + 0 
2322 : 85 07 __ STA WORK + 4 
2324 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
2327 : e6 53 __ INC T6 + 0 
2329 : d0 02 __ BNE $232d ; (bmu_bitblit.s69 + 0)
.s68:
232b : e6 54 __ INC T6 + 1 
.s69:
232d : a5 53 __ LDA T6 + 0 
232f : 29 07 __ AND #$07
2331 : d0 0d __ BNE $2340 ; (bmu_bitblit.s13 + 0)
.s14:
2333 : 18 __ __ CLC
2334 : a5 53 __ LDA T6 + 0 
2336 : 65 43 __ ADC T0 + 0 
2338 : 85 53 __ STA T6 + 0 
233a : a5 54 __ LDA T6 + 1 
233c : 65 44 __ ADC T0 + 1 
233e : 85 54 __ STA T6 + 1 
.s13:
2340 : c6 47 __ DEC T3 + 0 
2342 : d0 cc __ BNE $2310 ; (bmu_bitblit.l12 + 0)
.s3:
2344 : ad e0 9f LDA $9fe0 ; (bmu_bitblit@stack + 0)
2347 : 85 53 __ STA T6 + 0 
2349 : ad e1 9f LDA $9fe1 ; (bmu_bitblit@stack + 1)
234c : 85 54 __ STA T6 + 1 
234e : ad e2 9f LDA $9fe2 ; (bmu_bitblit@stack + 2)
2351 : 85 55 __ STA T8 + 0 
2353 : 60 __ __ RTS
.s15:
2354 : a5 47 __ LDA T3 + 0 
2356 : f0 ec __ BEQ $2344 ; (bmu_bitblit.s3 + 0)
.l16:
2358 : a5 53 __ LDA T6 + 0 
235a : 29 07 __ AND #$07
235c : a8 __ __ TAY
235d : b1 45 __ LDA (T1 + 0),y 
235f : 85 4e __ STA T2 + 0 
2361 : a5 53 __ LDA T6 + 0 
2363 : 85 03 __ STA WORK + 0 
2365 : a5 54 __ LDA T6 + 1 
2367 : 85 04 __ STA WORK + 1 
2369 : a5 53 __ LDA T6 + 0 
236b : 85 05 __ STA WORK + 2 
236d : a5 54 __ LDA T6 + 1 
236f : 85 06 __ STA WORK + 3 
2371 : a5 4e __ LDA T2 + 0 
2373 : 85 07 __ STA WORK + 4 
2375 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
2378 : e6 53 __ INC T6 + 0 
237a : d0 02 __ BNE $237e ; (bmu_bitblit.s67 + 0)
.s66:
237c : e6 54 __ INC T6 + 1 
.s67:
237e : a5 53 __ LDA T6 + 0 
2380 : 29 07 __ AND #$07
2382 : d0 0d __ BNE $2391 ; (bmu_bitblit.s17 + 0)
.s18:
2384 : 18 __ __ CLC
2385 : a5 53 __ LDA T6 + 0 
2387 : 65 43 __ ADC T0 + 0 
2389 : 85 53 __ STA T6 + 0 
238b : a5 54 __ LDA T6 + 1 
238d : 65 44 __ ADC T0 + 1 
238f : 85 54 __ STA T6 + 1 
.s17:
2391 : c6 47 __ DEC T3 + 0 
2393 : d0 c3 __ BNE $2358 ; (bmu_bitblit.l16 + 0)
2395 : f0 ad __ BEQ $2344 ; (bmu_bitblit.s3 + 0)
.s19:
2397 : 18 __ __ CLC
2398 : a5 55 __ LDA T8 + 0 
239a : 69 ff __ ADC #$ff
239c : 2a __ __ ROL
239d : 2a __ __ ROL
239e : 2a __ __ ROL
239f : aa __ __ TAX
23a0 : 29 f8 __ AND #$f8
23a2 : 85 4e __ STA T2 + 0 
23a4 : 8a __ __ TXA
23a5 : 29 07 __ AND #$07
23a7 : 2a __ __ ROL
23a8 : 69 f8 __ ADC #$f8
23aa : 85 4f __ STA T2 + 1 
23ac : a5 46 __ LDA T1 + 1 
23ae : 85 48 __ STA T3 + 1 
23b0 : 05 45 __ ORA T1 + 0 
23b2 : d0 08 __ BNE $23bc ; (bmu_bitblit.s21 + 0)
.s20:
23b4 : a5 50 __ LDA T5 + 0 
23b6 : 85 47 __ STA T3 + 0 
23b8 : a5 51 __ LDA T5 + 1 
23ba : 85 48 __ STA T3 + 1 
.s21:
23bc : ad f2 9f LDA $9ff2 ; (sstack + 12)
23bf : 85 45 __ STA T1 + 0 
23c1 : a5 15 __ LDA P8 
23c3 : d0 03 __ BNE $23c8 ; (bmu_bitblit.s28 + 0)
23c5 : 4c 47 24 JMP $2447 ; (bmu_bitblit.s22 + 0)
.s28:
23c8 : 38 __ __ SEC
23c9 : a9 00 __ LDA #$00
23cb : e5 43 __ SBC T0 + 0 
23cd : 85 43 __ STA T0 + 0 
23cf : a9 00 __ LDA #$00
23d1 : e5 44 __ SBC T0 + 1 
23d3 : 85 44 __ STA T0 + 1 
23d5 : 38 __ __ SEC
23d6 : a9 00 __ LDA #$00
23d8 : e5 4e __ SBC T2 + 0 
23da : 85 4e __ STA T2 + 0 
23dc : a9 00 __ LDA #$00
23de : e5 4f __ SBC T2 + 1 
23e0 : 85 4f __ STA T2 + 1 
23e2 : a5 45 __ LDA T1 + 0 
23e4 : d0 03 __ BNE $23e9 ; (bmu_bitblit.l29 + 0)
23e6 : 4c 44 23 JMP $2344 ; (bmu_bitblit.s3 + 0)
.l29:
23e9 : a5 50 __ LDA T5 + 0 
23eb : 29 07 __ AND #$07
23ed : d0 0d __ BNE $23fc ; (bmu_bitblit.s30 + 0)
.s33:
23ef : 18 __ __ CLC
23f0 : a5 50 __ LDA T5 + 0 
23f2 : 65 4e __ ADC T2 + 0 
23f4 : 85 50 __ STA T5 + 0 
23f6 : a5 51 __ LDA T5 + 1 
23f8 : 65 4f __ ADC T2 + 1 
23fa : 85 51 __ STA T5 + 1 
.s30:
23fc : a5 53 __ LDA T6 + 0 
23fe : 29 07 __ AND #$07
2400 : d0 0d __ BNE $240f ; (bmu_bitblit.s31 + 0)
.s32:
2402 : 18 __ __ CLC
2403 : a5 53 __ LDA T6 + 0 
2405 : 65 43 __ ADC T0 + 0 
2407 : 85 53 __ STA T6 + 0 
2409 : a5 54 __ LDA T6 + 1 
240b : 65 44 __ ADC T0 + 1 
240d : 85 54 __ STA T6 + 1 
.s31:
240f : 18 __ __ CLC
2410 : a5 53 __ LDA T6 + 0 
2412 : 69 ff __ ADC #$ff
2414 : 85 53 __ STA T6 + 0 
2416 : 29 07 __ AND #$07
2418 : a8 __ __ TAY
2419 : b0 02 __ BCS $241d ; (bmu_bitblit.s59 + 0)
.s58:
241b : c6 54 __ DEC T6 + 1 
.s59:
241d : b1 47 __ LDA (T3 + 0),y 
241f : 85 49 __ STA T4 + 0 
2421 : a5 50 __ LDA T5 + 0 
2423 : d0 02 __ BNE $2427 ; (bmu_bitblit.s61 + 0)
.s60:
2425 : c6 51 __ DEC T5 + 1 
.s61:
2427 : c6 50 __ DEC T5 + 0 
2429 : a5 50 __ LDA T5 + 0 
242b : 85 03 __ STA WORK + 0 
242d : a5 51 __ LDA T5 + 1 
242f : 85 04 __ STA WORK + 1 
2431 : a5 53 __ LDA T6 + 0 
2433 : 85 05 __ STA WORK + 2 
2435 : a5 54 __ LDA T6 + 1 
2437 : 85 06 __ STA WORK + 3 
2439 : a5 49 __ LDA T4 + 0 
243b : 85 07 __ STA WORK + 4 
243d : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
2440 : c6 45 __ DEC T1 + 0 
2442 : d0 a5 __ BNE $23e9 ; (bmu_bitblit.l29 + 0)
2444 : 4c 44 23 JMP $2344 ; (bmu_bitblit.s3 + 0)
.s22:
2447 : a5 45 __ LDA T1 + 0 
2449 : f0 f9 __ BEQ $2444 ; (bmu_bitblit.s61 + 29)
.l23:
244b : a5 53 __ LDA T6 + 0 
244d : 29 07 __ AND #$07
244f : a8 __ __ TAY
2450 : b1 47 __ LDA (T3 + 0),y 
2452 : 85 49 __ STA T4 + 0 
2454 : a5 50 __ LDA T5 + 0 
2456 : 85 03 __ STA WORK + 0 
2458 : a5 51 __ LDA T5 + 1 
245a : 85 04 __ STA WORK + 1 
245c : a5 53 __ LDA T6 + 0 
245e : 85 05 __ STA WORK + 2 
2460 : a5 54 __ LDA T6 + 1 
2462 : 85 06 __ STA WORK + 3 
2464 : a5 49 __ LDA T4 + 0 
2466 : 85 07 __ STA WORK + 4 
2468 : 20 00 34 JSR $3400 ; (BLIT_CODE[0] + 0)
246b : e6 50 __ INC T5 + 0 
246d : d0 02 __ BNE $2471 ; (bmu_bitblit.s63 + 0)
.s62:
246f : e6 51 __ INC T5 + 1 
.s63:
2471 : a5 50 __ LDA T5 + 0 
2473 : 29 07 __ AND #$07
2475 : d0 0d __ BNE $2484 ; (bmu_bitblit.s24 + 0)
.s27:
2477 : 18 __ __ CLC
2478 : a5 50 __ LDA T5 + 0 
247a : 65 4e __ ADC T2 + 0 
247c : 85 50 __ STA T5 + 0 
247e : a5 51 __ LDA T5 + 1 
2480 : 65 4f __ ADC T2 + 1 
2482 : 85 51 __ STA T5 + 1 
.s24:
2484 : e6 53 __ INC T6 + 0 
2486 : d0 02 __ BNE $248a ; (bmu_bitblit.s65 + 0)
.s64:
2488 : e6 54 __ INC T6 + 1 
.s65:
248a : a5 53 __ LDA T6 + 0 
248c : 29 07 __ AND #$07
248e : d0 0d __ BNE $249d ; (bmu_bitblit.s25 + 0)
.s26:
2490 : 18 __ __ CLC
2491 : a5 53 __ LDA T6 + 0 
2493 : 65 43 __ ADC T0 + 0 
2495 : 85 53 __ STA T6 + 0 
2497 : a5 54 __ LDA T6 + 1 
2499 : 65 44 __ ADC T0 + 1 
249b : 85 54 __ STA T6 + 1 
.s25:
249d : c6 45 __ DEC T1 + 0 
249f : d0 aa __ BNE $244b ; (bmu_bitblit.l23 + 0)
24a1 : 4c 44 23 JMP $2344 ; (bmu_bitblit.s3 + 0)
.s36:
24a4 : 18 __ __ CLC
24a5 : a5 11 __ LDA P4 
24a7 : 69 e1 __ ADC #$e1
24a9 : 2a __ __ ROL
24aa : 2a __ __ ROL
24ab : 2a __ __ ROL
24ac : a8 __ __ TAY
24ad : 29 f8 __ AND #$f8
24af : 85 45 __ STA T1 + 0 
24b1 : 98 __ __ TYA
24b2 : 29 07 __ AND #$07
24b4 : 2a __ __ ROL
24b5 : 69 f8 __ ADC #$f8
24b7 : 85 46 __ STA T1 + 1 
24b9 : 18 __ __ CLC
24ba : a5 53 __ LDA T6 + 0 
24bc : 65 45 __ ADC T1 + 0 
24be : 85 53 __ STA T6 + 0 
24c0 : a5 54 __ LDA T6 + 1 
24c2 : 65 46 __ ADC T1 + 1 
24c4 : 85 54 __ STA T6 + 1 
24c6 : a5 13 __ LDA P6 
24c8 : 85 12 __ STA P5 
24ca : a5 4c __ LDA T10 + 0 
24cc : 85 13 __ STA P6 
24ce : 18 __ __ CLC
24cf : a5 49 __ LDA T4 + 0 
24d1 : 65 45 __ ADC T1 + 0 
24d3 : 85 50 __ STA T5 + 0 
24d5 : 8a __ __ TXA
24d6 : 65 46 __ ADC T1 + 1 
24d8 : 85 51 __ STA T5 + 1 
24da : 24 43 __ BIT T0 + 0 
24dc : 30 03 __ BMI $24e1 ; (bmu_bitblit.s37 + 0)
24de : 4c cc 22 JMP $22cc ; (bmu_bitblit.s8 + 0)
.s37:
24e1 : 18 __ __ CLC
24e2 : a5 50 __ LDA T5 + 0 
24e4 : 69 08 __ ADC #$08
24e6 : 85 50 __ STA T5 + 0 
24e8 : 90 f4 __ BCC $24de ; (bmu_bitblit.s36 + 58)
.s57:
24ea : e6 51 __ INC T5 + 1 
24ec : 4c cc 22 JMP $22cc ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
24ef : a5 15 __ LDA P8 ; (reverse + 0)
24f1 : f0 16 __ BEQ $2509 ; (builddop.s5 + 0)
.s48:
24f3 : a9 38 __ LDA #$38
24f5 : 85 48 __ STA T9 + 0 
24f7 : a9 e1 __ LDA #$e1
24f9 : 85 49 __ STA T10 + 0 
24fb : a9 b0 __ LDA #$b0
24fd : 85 4a __ STA T11 + 0 
24ff : a9 c2 __ LDA #$c2
2501 : 85 4b __ STA T12 + 0 
2503 : a9 f8 __ LDA #$f8
2505 : 85 44 __ STA T3 + 0 
2507 : d0 16 __ BNE $251f ; (builddop.s6 + 0)
.s5:
2509 : a9 18 __ LDA #$18
250b : 85 48 __ STA T9 + 0 
250d : a9 61 __ LDA #$61
250f : 85 49 __ STA T10 + 0 
2511 : a9 90 __ LDA #$90
2513 : 85 4a __ STA T11 + 0 
2515 : a9 e2 __ LDA #$e2
2517 : 85 4b __ STA T12 + 0 
2519 : a9 00 __ LDA #$00
251b : 85 44 __ STA T3 + 0 
251d : a9 08 __ LDA #$08
.s6:
251f : 85 47 __ STA T6 + 0 
2521 : a5 14 __ LDA P7 ; (op + 0)
2523 : 29 08 __ AND #$08
2525 : 85 45 __ STA T4 + 0 
2527 : a5 14 __ LDA P7 ; (op + 0)
2529 : 29 10 __ AND #$10
252b : 85 46 __ STA T5 + 0 
252d : a5 11 __ LDA P4 ; (w + 0)
252f : d0 06 __ BNE $2537 ; (builddop.s8 + 0)
.s7:
2531 : a5 13 __ LDA P6 ; (rmask + 0)
2533 : 25 12 __ AND P5 ; (lmask + 0)
2535 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
2537 : a9 a0 __ LDA #$a0
2539 : 8d 00 34 STA $3400 ; (BLIT_CODE[0] + 0)
253c : a5 44 __ LDA T3 + 0 
253e : 8d 01 34 STA $3401 ; (BLIT_CODE[0] + 1)
2541 : a9 02 __ LDA #$02
2543 : 85 43 __ STA T0 + 0 
2545 : a6 12 __ LDX P5 ; (lmask + 0)
2547 : e8 __ __ INX
2548 : d0 03 __ BNE $254d ; (builddop.s9 + 0)
254a : 4c 80 27 JMP $2780 ; (builddop.s44 + 0)
.s9:
254d : a5 46 __ LDA T5 + 0 
254f : f0 18 __ BEQ $2569 ; (builddop.s10 + 0)
.s43:
2551 : a9 b1 __ LDA #$b1
2553 : 8d 02 34 STA $3402 ; (BLIT_CODE[0] + 2)
2556 : a9 05 __ LDA #$05
2558 : 8d 03 34 STA $3403 ; (BLIT_CODE[0] + 3)
255b : a9 85 __ LDA #$85
255d : 8d 04 34 STA $3404 ; (BLIT_CODE[0] + 4)
2560 : a9 0a __ LDA #$0a
2562 : 8d 05 34 STA $3405 ; (BLIT_CODE[0] + 5)
2565 : a9 06 __ LDA #$06
2567 : 85 43 __ STA T0 + 0 
.s10:
2569 : a5 45 __ LDA T4 + 0 
256b : d0 05 __ BNE $2572 ; (builddop.s40 + 0)
.s11:
256d : a5 43 __ LDA T0 + 0 
256f : 4c d3 25 JMP $25d3 ; (builddop.s52 + 0)
.s40:
2572 : a5 10 __ LDA P3 ; (shift + 0)
2574 : 85 0e __ STA P1 
2576 : d0 05 __ BNE $257d ; (builddop.s42 + 0)
.s41:
2578 : a5 43 __ LDA T0 + 0 
257a : 4c ca 25 JMP $25ca ; (builddop.s51 + 0)
.s42:
257d : a9 b1 __ LDA #$b1
257f : a6 43 __ LDX T0 + 0 
2581 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2584 : a9 03 __ LDA #$03
2586 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
2589 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
258c : 9d 0a 34 STA $340a,x ; (BLIT_CODE[0] + 10)
258f : a9 85 __ LDA #$85
2591 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
2594 : 9d 09 34 STA $3409,x ; (BLIT_CODE[0] + 9)
2597 : a9 08 __ LDA #$08
2599 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
259c : 9d 08 34 STA $3408,x ; (BLIT_CODE[0] + 8)
259f : a9 a5 __ LDA #$a5
25a1 : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
25a4 : a9 02 __ LDA #$02
25a6 : 9d 0c 34 STA $340c,x ; (BLIT_CODE[0] + 12)
25a9 : a9 04 __ LDA #$04
25ab : 9d 0e 34 STA $340e,x ; (BLIT_CODE[0] + 14)
25ae : a5 48 __ LDA T9 + 0 
25b0 : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
25b3 : a5 49 __ LDA T10 + 0 
25b5 : 09 08 __ ORA #$08
25b7 : 9d 07 34 STA $3407,x ; (BLIT_CODE[0] + 7)
25ba : a5 4a __ LDA T11 + 0 
25bc : 9d 0b 34 STA $340b,x ; (BLIT_CODE[0] + 11)
25bf : a5 4b __ LDA T12 + 0 
25c1 : 09 04 __ ORA #$04
25c3 : 9d 0d 34 STA $340d,x ; (BLIT_CODE[0] + 13)
25c6 : 8a __ __ TXA
25c7 : 18 __ __ CLC
25c8 : 69 0f __ ADC #$0f
.s51:
25ca : 85 0d __ STA P0 
25cc : a5 15 __ LDA P8 ; (reverse + 0)
25ce : 85 0f __ STA P2 
25d0 : 20 e1 27 JSR $27e1 ; (builddop_src.s4 + 0)
.s52:
25d3 : 85 0d __ STA P0 
25d5 : a5 14 __ LDA P7 ; (op + 0)
25d7 : 85 0e __ STA P1 
25d9 : a5 12 __ LDA P5 ; (lmask + 0)
25db : 49 ff __ EOR #$ff
25dd : 85 0f __ STA P2 
25df : 20 21 29 JSR $2921 ; (builddop_op.s4 + 0)
25e2 : 85 43 __ STA T0 + 0 
25e4 : a5 11 __ LDA P4 ; (w + 0)
25e6 : f0 68 __ BEQ $2650 ; (builddop.s12 + 0)
.s13:
25e8 : a9 a0 __ LDA #$a0
25ea : a6 43 __ LDX T0 + 0 
25ec : e8 __ __ INX
25ed : e8 __ __ INX
25ee : 86 43 __ STX T0 + 0 
25f0 : 86 0d __ STX P0 
25f2 : 9d fe 33 STA $33fe,x 
25f5 : 18 __ __ CLC
25f6 : a5 47 __ LDA T6 + 0 
25f8 : 65 44 __ ADC T3 + 0 
25fa : 85 44 __ STA T3 + 0 
25fc : 9d ff 33 STA $33ff,x 
.s14:
25ff : a5 11 __ LDA P4 ; (w + 0)
2601 : c9 02 __ CMP #$02
2603 : b0 53 __ BCS $2658 ; (builddop.s21 + 0)
.s15:
2605 : a5 13 __ LDA P6 ; (rmask + 0)
2607 : f0 47 __ BEQ $2650 ; (builddop.s12 + 0)
.s16:
2609 : a5 46 __ LDA T5 + 0 
260b : f0 1e __ BEQ $262b ; (builddop.s17 + 0)
.s20:
260d : a9 b1 __ LDA #$b1
260f : a6 43 __ LDX T0 + 0 
2611 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2614 : a9 05 __ LDA #$05
2616 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
2619 : a9 85 __ LDA #$85
261b : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
261e : a9 0a __ LDA #$0a
2620 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
2623 : 8a __ __ TXA
2624 : 18 __ __ CLC
2625 : 69 04 __ ADC #$04
2627 : 85 43 __ STA T0 + 0 
2629 : 85 0d __ STA P0 
.s17:
262b : a5 45 __ LDA T4 + 0 
262d : d0 05 __ BNE $2634 ; (builddop.s19 + 0)
.s18:
262f : a5 43 __ LDA T0 + 0 
2631 : 4c 3f 26 JMP $263f ; (builddop.s50 + 0)
.s19:
2634 : a5 10 __ LDA P3 ; (shift + 0)
2636 : 85 0e __ STA P1 
2638 : a5 15 __ LDA P8 ; (reverse + 0)
263a : 85 0f __ STA P2 
263c : 20 e1 27 JSR $27e1 ; (builddop_src.s4 + 0)
.s50:
263f : 85 0d __ STA P0 
2641 : a5 14 __ LDA P7 ; (op + 0)
2643 : 85 0e __ STA P1 
2645 : a5 13 __ LDA P6 ; (rmask + 0)
2647 : 49 ff __ EOR #$ff
2649 : 85 0f __ STA P2 
264b : 20 21 29 JSR $2921 ; (builddop_op.s4 + 0)
264e : 85 43 __ STA T0 + 0 
.s12:
2650 : a9 60 __ LDA #$60
2652 : a6 43 __ LDX T0 + 0 
2654 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
.s3:
2657 : 60 __ __ RTS
.s21:
2658 : a9 02 __ LDA #$02
265a : c5 11 __ CMP P4 ; (w + 0)
265c : a9 00 __ LDA #$00
265e : 6a __ __ ROR
265f : 85 4c __ STA T14 + 0 
2661 : d0 19 __ BNE $267c ; (builddop.s22 + 0)
.s39:
2663 : a9 a2 __ LDA #$a2
2665 : a6 43 __ LDX T0 + 0 
2667 : e8 __ __ INX
2668 : e8 __ __ INX
2669 : 86 43 __ STX T0 + 0 
266b : 9d fe 33 STA $33fe,x 
266e : 38 __ __ SEC
266f : a5 11 __ LDA P4 ; (w + 0)
2671 : e9 01 __ SBC #$01
2673 : 9d ff 33 STA $33ff,x 
2676 : a5 11 __ LDA P4 ; (w + 0)
2678 : c9 20 __ CMP #$20
267a : b0 0d __ BCS $2689 ; (builddop.s24 + 0)
.s22:
267c : a5 10 __ LDA P3 ; (shift + 0)
267e : d0 09 __ BNE $2689 ; (builddop.s24 + 0)
.s23:
2680 : a5 48 __ LDA T9 + 0 
2682 : a6 43 __ LDX T0 + 0 
2684 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2687 : e6 43 __ INC T0 + 0 
.s24:
2689 : a6 43 __ LDX T0 + 0 
268b : 86 4d __ STX T15 + 0 
268d : a5 46 __ LDA T5 + 0 
268f : f0 1a __ BEQ $26ab ; (builddop.s25 + 0)
.s38:
2691 : a9 b1 __ LDA #$b1
2693 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2696 : a9 05 __ LDA #$05
2698 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
269b : a9 85 __ LDA #$85
269d : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
26a0 : a9 0a __ LDA #$0a
26a2 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
26a5 : 8a __ __ TXA
26a6 : 18 __ __ CLC
26a7 : 69 04 __ ADC #$04
26a9 : 85 43 __ STA T0 + 0 
.s25:
26ab : a5 45 __ LDA T4 + 0 
26ad : d0 05 __ BNE $26b4 ; (builddop.s37 + 0)
.s26:
26af : a5 43 __ LDA T0 + 0 
26b1 : 4c c3 26 JMP $26c3 ; (builddop.s49 + 0)
.s37:
26b4 : a5 43 __ LDA T0 + 0 
26b6 : 85 0d __ STA P0 
26b8 : a5 10 __ LDA P3 ; (shift + 0)
26ba : 85 0e __ STA P1 
26bc : a5 15 __ LDA P8 ; (reverse + 0)
26be : 85 0f __ STA P2 
26c0 : 20 e1 27 JSR $27e1 ; (builddop_src.s4 + 0)
.s49:
26c3 : 85 0d __ STA P0 
26c5 : a5 14 __ LDA P7 ; (op + 0)
26c7 : 85 0e __ STA P1 
26c9 : a9 00 __ LDA #$00
26cb : 85 0f __ STA P2 
26cd : 20 21 29 JSR $2921 ; (builddop_op.s4 + 0)
26d0 : 24 4c __ BIT T14 + 0 
26d2 : 10 17 __ BPL $26eb ; (builddop.s28 + 0)
.s27:
26d4 : aa __ __ TAX
26d5 : e8 __ __ INX
26d6 : e8 __ __ INX
26d7 : 86 43 __ STX T0 + 0 
26d9 : 86 0d __ STX P0 
26db : a9 a0 __ LDA #$a0
26dd : 9d fe 33 STA $33fe,x 
26e0 : 18 __ __ CLC
26e1 : a5 47 __ LDA T6 + 0 
26e3 : 65 44 __ ADC T3 + 0 
26e5 : 9d ff 33 STA $33ff,x 
26e8 : 4c 05 26 JMP $2605 ; (builddop.s15 + 0)
.s28:
26eb : a8 __ __ TAY
26ec : a9 1f __ LDA #$1f
26ee : c5 11 __ CMP P4 ; (w + 0)
26f0 : a9 00 __ LDA #$00
26f2 : 6a __ __ ROR
26f3 : 85 47 __ STA T6 + 0 
26f5 : f0 04 __ BEQ $26fb ; (builddop.s36 + 0)
.s29:
26f7 : a5 10 __ LDA P3 ; (shift + 0)
26f9 : f0 06 __ BEQ $2701 ; (builddop.s30 + 0)
.s36:
26fb : a5 48 __ LDA T9 + 0 
26fd : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2700 : c8 __ __ INY
.s30:
2701 : a9 98 __ LDA #$98
2703 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2706 : a9 08 __ LDA #$08
2708 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
270b : a9 a8 __ LDA #$a8
270d : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
2710 : a5 49 __ LDA T10 + 0 
2712 : 09 08 __ ORA #$08
2714 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
2717 : 98 __ __ TYA
2718 : 18 __ __ CLC
2719 : 69 04 __ ADC #$04
271b : 85 43 __ STA T0 + 0 
271d : 24 47 __ BIT T6 + 0 
271f : 30 3a __ BMI $275b ; (builddop.s31 + 0)
.s32:
2721 : a5 4a __ LDA T11 + 0 
2723 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
2726 : a5 4b __ LDA T12 + 0 
2728 : 09 04 __ ORA #$04
272a : aa __ __ TAX
272b : a5 45 __ LDA T4 + 0 
272d : d0 0d __ BNE $273c ; (builddop.s35 + 0)
.s33:
272f : a9 02 __ LDA #$02
2731 : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
2734 : 18 __ __ CLC
2735 : a5 43 __ LDA T0 + 0 
2737 : 69 02 __ ADC #$02
2739 : 4c 4d 27 JMP $274d ; (builddop.s34 + 0)
.s35:
273c : a9 04 __ LDA #$04
273e : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
2741 : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
2744 : 8a __ __ TXA
2745 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
2748 : 18 __ __ CLC
2749 : a5 43 __ LDA T0 + 0 
274b : 69 04 __ ADC #$04
.s34:
274d : a8 __ __ TAY
274e : c8 __ __ INY
274f : c8 __ __ INY
2750 : 84 43 __ STY T0 + 0 
2752 : 8a __ __ TXA
2753 : 99 fe 33 STA $33fe,y 
2756 : a9 06 __ LDA #$06
2758 : 99 ff 33 STA $33ff,y 
.s31:
275b : a9 ca __ LDA #$ca
275d : a4 43 __ LDY T0 + 0 
275f : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2762 : a9 d0 __ LDA #$d0
2764 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
2767 : 98 __ __ TYA
2768 : 18 __ __ CLC
2769 : 69 01 __ ADC #$01
276b : aa __ __ TAX
276c : e8 __ __ INX
276d : e8 __ __ INX
276e : 86 43 __ STX T0 + 0 
2770 : 86 0d __ STX P0 
2772 : 49 ff __ EOR #$ff
2774 : 38 __ __ SEC
2775 : 65 4d __ ADC T15 + 0 
2777 : 38 __ __ SEC
2778 : e9 02 __ SBC #$02
277a : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
277d : 4c 05 26 JMP $2605 ; (builddop.s15 + 0)
.s44:
2780 : 85 0d __ STA P0 
2782 : a5 45 __ LDA T4 + 0 
2784 : f0 51 __ BEQ $27d7 ; (builddop.s45 + 0)
.s46:
2786 : a5 10 __ LDA P3 ; (shift + 0)
2788 : f0 4d __ BEQ $27d7 ; (builddop.s45 + 0)
.s47:
278a : a9 03 __ LDA #$03
278c : 8d 03 34 STA $3403 ; (BLIT_CODE[0] + 3)
278f : 8d 08 34 STA $3408 ; (BLIT_CODE[0] + 8)
2792 : 8d 0c 34 STA $340c ; (BLIT_CODE[0] + 12)
2795 : a9 b1 __ LDA #$b1
2797 : 8d 02 34 STA $3402 ; (BLIT_CODE[0] + 2)
279a : a9 85 __ LDA #$85
279c : 8d 04 34 STA $3404 ; (BLIT_CODE[0] + 4)
279f : 8d 0b 34 STA $340b ; (BLIT_CODE[0] + 11)
27a2 : a9 08 __ LDA #$08
27a4 : 8d 05 34 STA $3405 ; (BLIT_CODE[0] + 5)
27a7 : 8d 0a 34 STA $340a ; (BLIT_CODE[0] + 10)
27aa : a9 a5 __ LDA #$a5
27ac : 8d 07 34 STA $3407 ; (BLIT_CODE[0] + 7)
27af : a9 02 __ LDA #$02
27b1 : 8d 0e 34 STA $340e ; (BLIT_CODE[0] + 14)
27b4 : a9 04 __ LDA #$04
27b6 : 8d 10 34 STA $3410 ; (BLIT_CODE[0] + 16)
27b9 : a5 48 __ LDA T9 + 0 
27bb : 8d 06 34 STA $3406 ; (BLIT_CODE[0] + 6)
27be : a5 49 __ LDA T10 + 0 
27c0 : 09 08 __ ORA #$08
27c2 : 8d 09 34 STA $3409 ; (BLIT_CODE[0] + 9)
27c5 : a5 4a __ LDA T11 + 0 
27c7 : 8d 0d 34 STA $340d ; (BLIT_CODE[0] + 13)
27ca : a5 4b __ LDA T12 + 0 
27cc : 09 04 __ ORA #$04
27ce : 8d 0f 34 STA $340f ; (BLIT_CODE[0] + 15)
27d1 : a9 11 __ LDA #$11
27d3 : 85 43 __ STA T0 + 0 
27d5 : 85 0d __ STA P0 
.s45:
27d7 : e6 11 __ INC P4 ; (w + 0)
27d9 : d0 03 __ BNE $27de ; (builddop.s45 + 7)
27db : 4c 50 26 JMP $2650 ; (builddop.s12 + 0)
27de : 4c ff 25 JMP $25ff ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
27e1 : a6 0d __ LDX P0 ; (ip + 0)
27e3 : e8 __ __ INX
27e4 : a4 0d __ LDY P0 ; (ip + 0)
27e6 : e8 __ __ INX
27e7 : a5 0e __ LDA P1 ; (shift + 0)
27e9 : d0 0c __ BNE $27f7 ; (builddop_src.s6 + 0)
.s5:
27eb : a9 b1 __ LDA #$b1
27ed : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
27f0 : a9 03 __ LDA #$03
27f2 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
27f5 : 8a __ __ TXA
.s3:
27f6 : 60 __ __ RTS
.s6:
27f7 : a9 a5 __ LDA #$a5
27f9 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
27fc : a9 08 __ LDA #$08
27fe : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
2801 : a5 0f __ LDA P2 ; (reverse + 0)
2803 : f0 03 __ BEQ $2808 ; (builddop_src.s7 + 0)
2805 : 4c 13 29 JMP $2913 ; (builddop_src.s26 + 0)
.s7:
2808 : a5 0e __ LDA P1 ; (shift + 0)
280a : c9 05 __ CMP #$05
280c : b0 06 __ BCS $2814 ; (builddop_src.s8 + 0)
.s24:
280e : a9 4a __ LDA #$4a
.s25:
2810 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2813 : e8 __ __ INX
.s8:
2814 : a9 85 __ LDA #$85
2816 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
2819 : 9d 04 34 STA $3404,x ; (BLIT_CODE[0] + 4)
281c : a9 09 __ LDA #$09
281e : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
2821 : a9 b1 __ LDA #$b1
2823 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
2826 : a9 03 __ LDA #$03
2828 : 9d 03 34 STA $3403,x ; (BLIT_CODE[0] + 3)
282b : a9 08 __ LDA #$08
282d : 9d 05 34 STA $3405,x ; (BLIT_CODE[0] + 5)
2830 : 8a __ __ TXA
2831 : 18 __ __ CLC
2832 : 69 06 __ ADC #$06
2834 : 85 1b __ STA ACCU + 0 
2836 : a8 __ __ TAY
2837 : a5 0f __ LDA P2 ; (reverse + 0)
2839 : d0 72 __ BNE $28ad ; (builddop_src.s17 + 0)
.s9:
283b : a5 0e __ LDA P1 ; (shift + 0)
283d : c9 05 __ CMP #$05
283f : 90 0b __ BCC $284c ; (builddop_src.s10 + 0)
.s13:
2841 : a9 0a __ LDA #$0a
2843 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
2846 : e6 1b __ INC ACCU + 0 
2848 : a6 0e __ LDX P1 ; (shift + 0)
284a : b0 25 __ BCS $2871 ; (builddop_src.l14 + 0)
.s10:
284c : c9 02 __ CMP #$02
284e : 90 19 __ BCC $2869 ; (builddop_src.s11 + 0)
.s12:
2850 : c6 0e __ DEC P1 ; (shift + 0)
2852 : a6 0e __ LDX P1 ; (shift + 0)
.l29:
2854 : a9 6a __ LDA #$6a
2856 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2859 : a9 46 __ LDA #$46
285b : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
285e : a9 09 __ LDA #$09
2860 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2863 : c8 __ __ INY
2864 : c8 __ __ INY
2865 : c8 __ __ INY
2866 : ca __ __ DEX
2867 : d0 eb __ BNE $2854 ; (builddop_src.l29 + 0)
.s11:
2869 : a9 6a __ LDA #$6a
.s30:
286b : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
286e : c8 __ __ INY
286f : 98 __ __ TYA
2870 : 60 __ __ RTS
.l14:
2871 : a5 1b __ LDA ACCU + 0 
2873 : 85 1d __ STA ACCU + 2 
2875 : 85 1c __ STA ACCU + 1 
2877 : a8 __ __ TAY
2878 : 18 __ __ CLC
2879 : 69 03 __ ADC #$03
287b : 85 1b __ STA ACCU + 0 
287d : e0 07 __ CPX #$07
287f : b0 16 __ BCS $2897 ; (builddop_src.s15 + 0)
.s16:
2881 : a9 26 __ LDA #$26
2883 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2886 : a9 09 __ LDA #$09
2888 : a4 1d __ LDY ACCU + 2 
288a : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
288d : a9 0a __ LDA #$0a
288f : a4 1c __ LDY ACCU + 1 
2891 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2894 : e8 __ __ INX
2895 : 90 da __ BCC $2871 ; (builddop_src.l14 + 0)
.s15:
2897 : a9 a5 __ LDA #$a5
2899 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
289c : a9 09 __ LDA #$09
289e : a6 1d __ LDX ACCU + 2 
28a0 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
28a3 : a9 2a __ LDA #$2a
28a5 : a6 1c __ LDX ACCU + 1 
28a7 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
28aa : a5 1b __ LDA ACCU + 0 
28ac : 60 __ __ RTS
.s17:
28ad : a5 0e __ LDA P1 ; (shift + 0)
28af : c9 05 __ CMP #$05
28b1 : b0 3e __ BCS $28f1 ; (builddop_src.s21 + 0)
.s18:
28b3 : a9 4a __ LDA #$4a
28b5 : 9d 06 34 STA $3406,x ; (BLIT_CODE[0] + 6)
28b8 : e6 1b __ INC ACCU + 0 
28ba : a6 0e __ LDX P1 ; (shift + 0)
28bc : e0 02 __ CPX #$02
28be : 90 1b __ BCC $28db ; (builddop_src.s19 + 0)
.s20:
28c0 : a4 1b __ LDY ACCU + 0 
.l28:
28c2 : a9 66 __ LDA #$66
28c4 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
28c7 : a9 09 __ LDA #$09
28c9 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
28cc : a9 4a __ LDA #$4a
28ce : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
28d1 : 98 __ __ TYA
28d2 : 18 __ __ CLC
28d3 : 69 03 __ ADC #$03
28d5 : a8 __ __ TAY
28d6 : ca __ __ DEX
28d7 : d0 e9 __ BNE $28c2 ; (builddop_src.l28 + 0)
.s31:
28d9 : 85 1b __ STA ACCU + 0 
.s19:
28db : a9 a5 __ LDA #$a5
28dd : a6 1b __ LDX ACCU + 0 
28df : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
28e2 : a9 09 __ LDA #$09
28e4 : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
28e7 : a9 6a __ LDA #$6a
28e9 : 9d 02 34 STA $3402,x ; (BLIT_CODE[0] + 2)
28ec : 8a __ __ TXA
28ed : 18 __ __ CLC
28ee : 69 03 __ ADC #$03
28f0 : 60 __ __ RTS
.s21:
28f1 : c9 07 __ CMP #$07
28f3 : b0 19 __ BCS $290e ; (builddop_src.s22 + 0)
.s23:
28f5 : aa __ __ TAX
.l32:
28f6 : a9 2a __ LDA #$2a
28f8 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
28fb : a9 06 __ LDA #$06
28fd : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
2900 : a9 09 __ LDA #$09
2902 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2905 : 98 __ __ TYA
2906 : 69 03 __ ADC #$03
2908 : e8 __ __ INX
2909 : e0 07 __ CPX #$07
290b : a8 __ __ TAY
290c : 90 e8 __ BCC $28f6 ; (builddop_src.l32 + 0)
.s22:
290e : a9 2a __ LDA #$2a
2910 : 4c 6b 28 JMP $286b ; (builddop_src.s30 + 0)
.s26:
2913 : a5 0e __ LDA P1 ; (shift + 0)
2915 : c9 05 __ CMP #$05
2917 : b0 03 __ BCS $291c ; (builddop_src.s27 + 0)
2919 : 4c 14 28 JMP $2814 ; (builddop_src.s8 + 0)
.s27:
291c : a9 0a __ LDA #$0a
291e : 4c 10 28 JMP $2810 ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
2921 : a5 0e __ LDA P1 ; (op + 0)
2923 : 29 20 __ AND #$20
2925 : f0 04 __ BEQ $292b ; (builddop_op.s27 + 0)
.s28:
2927 : a9 07 __ LDA #$07
2929 : d0 02 __ BNE $292d ; (builddop_op.s29 + 0)
.s27:
292b : a9 0a __ LDA #$0a
.s29:
292d : 85 1c __ STA ACCU + 1 
292f : a5 0e __ LDA P1 ; (op + 0)
2931 : 29 03 __ AND #$03
2933 : 85 1b __ STA ACCU + 0 
2935 : a5 0e __ LDA P1 ; (op + 0)
2937 : 29 04 __ AND #$04
2939 : f0 03 __ BEQ $293e ; (builddop_op.s5 + 0)
293b : 4c d1 29 JMP $29d1 ; (builddop_op.s18 + 0)
.s5:
293e : a5 0e __ LDA P1 ; (op + 0)
2940 : 29 08 __ AND #$08
2942 : d0 13 __ BNE $2957 ; (builddop_op.s15 + 0)
.s6:
2944 : a9 a5 __ LDA #$a5
2946 : a4 0d __ LDY P0 ; (ip + 0)
2948 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
294b : a5 1c __ LDA ACCU + 1 
.s7:
294d : c8 __ __ INY
294e : c8 __ __ INY
294f : 84 0d __ STY P0 ; (ip + 0)
2951 : 99 ff 33 STA $33ff,y 
2954 : 4c 67 29 JMP $2967 ; (builddop_op.s16 + 0)
.s15:
2957 : a5 0e __ LDA P1 ; (op + 0)
2959 : 0a __ __ ASL
295a : 10 0b __ BPL $2967 ; (builddop_op.s16 + 0)
.s17:
295c : a9 49 __ LDA #$49
295e : a4 0d __ LDY P0 ; (ip + 0)
2960 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2963 : a9 ff __ LDA #$ff
2965 : d0 e6 __ BNE $294d ; (builddop_op.s7 + 0)
.s16:
2967 : a6 1b __ LDX ACCU + 0 
2969 : f0 13 __ BEQ $297e ; (builddop_op.s8 + 0)
.s14:
296b : a5 1c __ LDA ACCU + 1 
296d : a4 0d __ LDY P0 ; (ip + 0)
296f : c8 __ __ INY
2970 : c8 __ __ INY
2971 : 84 0d __ STY P0 ; (ip + 0)
2973 : 99 ff 33 STA $33ff,y 
2976 : bd 9d 32 LDA $329d,x ; (blitops_op[0] + 0)
2979 : 09 04 __ ORA #$04
297b : 99 fe 33 STA $33fe,y 
.s8:
297e : a5 0f __ LDA P2 ; (mask + 0)
2980 : f0 3f __ BEQ $29c1 ; (builddop_op.s9 + 0)
.s10:
2982 : a9 85 __ LDA #$85
2984 : a4 0d __ LDY P0 ; (ip + 0)
2986 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
2989 : a9 09 __ LDA #$09
298b : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
298e : 98 __ __ TYA
298f : 18 __ __ CLC
2990 : 69 08 __ ADC #$08
2992 : 85 0d __ STA P0 ; (ip + 0)
2994 : a5 0e __ LDA P1 ; (op + 0)
2996 : 29 10 __ AND #$10
2998 : f0 09 __ BEQ $29a3 ; (builddop_op.s11 + 0)
.s13:
299a : a9 45 __ LDA #$45
299c : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
299f : a9 0a __ LDA #$0a
29a1 : d0 07 __ BNE $29aa ; (builddop_op.s12 + 0)
.s11:
29a3 : a9 51 __ LDA #$51
29a5 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
29a8 : a9 05 __ LDA #$05
.s12:
29aa : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
29ad : a9 29 __ LDA #$29
29af : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
29b2 : a5 0f __ LDA P2 ; (mask + 0)
29b4 : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
29b7 : a9 45 __ LDA #$45
29b9 : 99 06 34 STA $3406,y ; (BLIT_CODE[0] + 6)
29bc : a9 09 __ LDA #$09
29be : 99 07 34 STA $3407,y ; (BLIT_CODE[0] + 7)
.s9:
29c1 : a9 91 __ LDA #$91
29c3 : a6 0d __ LDX P0 ; (ip + 0)
29c5 : 9d 00 34 STA $3400,x ; (BLIT_CODE[0] + 0)
29c8 : a9 05 __ LDA #$05
29ca : 9d 01 34 STA $3401,x ; (BLIT_CODE[0] + 1)
29cd : e8 __ __ INX
29ce : e8 __ __ INX
29cf : 8a __ __ TXA
.s3:
29d0 : 60 __ __ RTS
.s18:
29d1 : a5 1b __ LDA ACCU + 0 
29d3 : d0 04 __ BNE $29d9 ; (builddop_op.s20 + 0)
.s19:
29d5 : a5 0f __ LDA P2 ; (mask + 0)
29d7 : d0 14 __ BNE $29ed ; (builddop_op.s23 + 0)
.s20:
29d9 : a5 0e __ LDA P1 ; (op + 0)
29db : 29 40 __ AND #$40
29dd : f0 02 __ BEQ $29e1 ; (builddop_op.s21 + 0)
.s22:
29df : a9 ff __ LDA #$ff
.s21:
29e1 : aa __ __ TAX
29e2 : a9 a9 __ LDA #$a9
29e4 : a4 0d __ LDY P0 ; (ip + 0)
29e6 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
29e9 : 8a __ __ TXA
29ea : 4c 4d 29 JMP $294d ; (builddop_op.s7 + 0)
.s23:
29ed : a9 b1 __ LDA #$b1
29ef : a4 0d __ LDY P0 ; (ip + 0)
29f1 : 99 00 34 STA $3400,y ; (BLIT_CODE[0] + 0)
29f4 : a9 05 __ LDA #$05
29f6 : 99 01 34 STA $3401,y ; (BLIT_CODE[0] + 1)
29f9 : 06 0e __ ASL P1 ; (op + 0)
29fb : 30 0a __ BMI $2a07 ; (builddop_op.s26 + 0)
.s24:
29fd : a9 29 __ LDA #$29
29ff : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2a02 : a5 0f __ LDA P2 ; (mask + 0)
2a04 : 4c 10 2a JMP $2a10 ; (builddop_op.s25 + 0)
.s26:
2a07 : a9 09 __ LDA #$09
2a09 : 99 02 34 STA $3402,y ; (BLIT_CODE[0] + 2)
2a0c : a5 0f __ LDA P2 ; (mask + 0)
2a0e : 49 ff __ EOR #$ff
.s25:
2a10 : 99 03 34 STA $3403,y ; (BLIT_CODE[0] + 3)
2a13 : a9 91 __ LDA #$91
2a15 : 99 04 34 STA $3404,y ; (BLIT_CODE[0] + 4)
2a18 : a9 05 __ LDA #$05
2a1a : 99 05 34 STA $3405,y ; (BLIT_CODE[0] + 5)
2a1d : 98 __ __ TYA
2a1e : 18 __ __ CLC
2a1f : 69 06 __ ADC #$06
2a21 : 60 __ __ RTS
--------------------------------------------------------------------
strlen: ; strlen(const u8*)->i16
;  12, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
2a22 : a9 00 __ LDA #$00
2a24 : 85 1b __ STA ACCU + 0 
2a26 : 85 1c __ STA ACCU + 1 
2a28 : a8 __ __ TAY
2a29 : b1 0d __ LDA (P0),y ; (str + 0)
2a2b : f0 10 __ BEQ $2a3d ; (strlen.s3 + 0)
.s6:
2a2d : a2 00 __ LDX #$00
.l7:
2a2f : c8 __ __ INY
2a30 : d0 03 __ BNE $2a35 ; (strlen.s9 + 0)
.s8:
2a32 : e6 0e __ INC P1 ; (str + 1)
2a34 : e8 __ __ INX
.s9:
2a35 : b1 0d __ LDA (P0),y ; (str + 0)
2a37 : d0 f6 __ BNE $2a2f ; (strlen.l7 + 0)
.s5:
2a39 : 86 1c __ STX ACCU + 1 
2a3b : 84 1b __ STY ACCU + 0 
.s3:
2a3d : 60 __ __ RTS
--------------------------------------------------------------------
done: ; done()->void
;  32, "/home/honza/projects/c64/projects/oscar64/samples/hires/qsort.c"
.s4:
2a3e : a9 37 __ LDA #$37
2a40 : 85 01 __ STA $01 
2a42 : 20 58 2a JSR $2a58 ; (getch.l4 + 0)
2a45 : a9 00 __ LDA #$00
2a47 : 85 0d __ STA P0 
2a49 : 85 0e __ STA P1 
2a4b : 85 10 __ STA P3 
2a4d : a9 04 __ LDA #$04
2a4f : 85 0f __ STA P2 
2a51 : a9 10 __ LDA #$10
2a53 : 85 11 __ STA P4 
2a55 : 4c 73 0a JMP $0a73 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
2a58 : 20 e4 ff JSR $ffe4 
2a5b : 85 1b __ STA ACCU + 0 
2a5d : a5 1b __ LDA ACCU + 0 
2a5f : f0 f7 __ BEQ $2a58 ; (getch.l4 + 0)
.s5:
2a61 : 4c 64 2a JMP $2a64 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
2a64 : a8 __ __ TAY
2a65 : ad 3d 30 LDA $303d ; (giocharmap + 0)
2a68 : f0 27 __ BEQ $2a91 ; (convch.s5 + 0)
.s6:
2a6a : c0 0d __ CPY #$0d
2a6c : d0 03 __ BNE $2a71 ; (convch.s7 + 0)
.s16:
2a6e : a9 0a __ LDA #$0a
.s3:
2a70 : 60 __ __ RTS
.s7:
2a71 : c9 02 __ CMP #$02
2a73 : 90 1c __ BCC $2a91 ; (convch.s5 + 0)
.s8:
2a75 : 98 __ __ TYA
2a76 : c0 41 __ CPY #$41
2a78 : 90 17 __ BCC $2a91 ; (convch.s5 + 0)
.s9:
2a7a : c9 db __ CMP #$db
2a7c : b0 13 __ BCS $2a91 ; (convch.s5 + 0)
.s10:
2a7e : c9 c1 __ CMP #$c1
2a80 : 90 03 __ BCC $2a85 ; (convch.s11 + 0)
.s15:
2a82 : 49 a0 __ EOR #$a0
2a84 : a8 __ __ TAY
.s11:
2a85 : c9 7b __ CMP #$7b
2a87 : b0 08 __ BCS $2a91 ; (convch.s5 + 0)
.s12:
2a89 : c9 61 __ CMP #$61
2a8b : b0 06 __ BCS $2a93 ; (convch.s14 + 0)
.s13:
2a8d : c9 5b __ CMP #$5b
2a8f : 90 02 __ BCC $2a93 ; (convch.s14 + 0)
.s5:
2a91 : 98 __ __ TYA
2a92 : 60 __ __ RTS
.s14:
2a93 : 49 20 __ EOR #$20
2a95 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
2a96 : 4a __ __ LSR
2a97 : f0 2e __ BEQ $2ac7 ; (mul16by8 + 49)
2a99 : a2 00 __ LDX #$00
2a9b : a0 00 __ LDY #$00
2a9d : 90 13 __ BCC $2ab2 ; (mul16by8 + 28)
2a9f : a4 1b __ LDY ACCU + 0 
2aa1 : a6 1c __ LDX ACCU + 1 
2aa3 : b0 0d __ BCS $2ab2 ; (mul16by8 + 28)
2aa5 : 85 02 __ STA $02 
2aa7 : 18 __ __ CLC
2aa8 : 98 __ __ TYA
2aa9 : 65 1b __ ADC ACCU + 0 
2aab : a8 __ __ TAY
2aac : 8a __ __ TXA
2aad : 65 1c __ ADC ACCU + 1 
2aaf : aa __ __ TAX
2ab0 : a5 02 __ LDA $02 
2ab2 : 06 1b __ ASL ACCU + 0 
2ab4 : 26 1c __ ROL ACCU + 1 
2ab6 : 4a __ __ LSR
2ab7 : 90 f9 __ BCC $2ab2 ; (mul16by8 + 28)
2ab9 : d0 ea __ BNE $2aa5 ; (mul16by8 + 15)
2abb : 18 __ __ CLC
2abc : 98 __ __ TYA
2abd : 65 1b __ ADC ACCU + 0 
2abf : 85 1b __ STA ACCU + 0 
2ac1 : 8a __ __ TXA
2ac2 : 65 1c __ ADC ACCU + 1 
2ac4 : 85 1c __ STA ACCU + 1 
2ac6 : 60 __ __ RTS
2ac7 : b0 04 __ BCS $2acd ; (mul16by8 + 55)
2ac9 : 85 1b __ STA ACCU + 0 
2acb : 85 1c __ STA ACCU + 1 
2acd : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
2ace : b1 19 __ LDA (IP + 0),y 
2ad0 : c8 __ __ INY
2ad1 : aa __ __ TAX
2ad2 : b5 00 __ LDA $00,x 
2ad4 : 85 03 __ STA WORK + 0 
2ad6 : b5 01 __ LDA $01,x 
2ad8 : 85 04 __ STA WORK + 1 
2ada : b5 02 __ LDA $02,x 
2adc : 85 05 __ STA WORK + 2 
2ade : b5 03 __ LDA WORK + 0,x 
2ae0 : 85 06 __ STA WORK + 3 
2ae2 : a5 05 __ LDA WORK + 2 
2ae4 : 0a __ __ ASL
2ae5 : a5 06 __ LDA WORK + 3 
2ae7 : 2a __ __ ROL
2ae8 : 85 08 __ STA WORK + 5 
2aea : f0 06 __ BEQ $2af2 ; (freg + 36)
2aec : a5 05 __ LDA WORK + 2 
2aee : 09 80 __ ORA #$80
2af0 : 85 05 __ STA WORK + 2 
2af2 : a5 1d __ LDA ACCU + 2 
2af4 : 0a __ __ ASL
2af5 : a5 1e __ LDA ACCU + 3 
2af7 : 2a __ __ ROL
2af8 : 85 07 __ STA WORK + 4 
2afa : f0 06 __ BEQ $2b02 ; (freg + 52)
2afc : a5 1d __ LDA ACCU + 2 
2afe : 09 80 __ ORA #$80
2b00 : 85 1d __ STA ACCU + 2 
2b02 : 60 __ __ RTS
2b03 : 06 1e __ ASL ACCU + 3 
2b05 : a5 07 __ LDA WORK + 4 
2b07 : 6a __ __ ROR
2b08 : 85 1e __ STA ACCU + 3 
2b0a : b0 06 __ BCS $2b12 ; (freg + 68)
2b0c : a5 1d __ LDA ACCU + 2 
2b0e : 29 7f __ AND #$7f
2b10 : 85 1d __ STA ACCU + 2 
2b12 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
2b13 : a5 06 __ LDA WORK + 3 
2b15 : 49 80 __ EOR #$80
2b17 : 85 06 __ STA WORK + 3 
2b19 : a9 ff __ LDA #$ff
2b1b : c5 07 __ CMP WORK + 4 
2b1d : f0 04 __ BEQ $2b23 ; (faddsub + 16)
2b1f : c5 08 __ CMP WORK + 5 
2b21 : d0 11 __ BNE $2b34 ; (faddsub + 33)
2b23 : a5 1e __ LDA ACCU + 3 
2b25 : 09 7f __ ORA #$7f
2b27 : 85 1e __ STA ACCU + 3 
2b29 : a9 80 __ LDA #$80
2b2b : 85 1d __ STA ACCU + 2 
2b2d : a9 00 __ LDA #$00
2b2f : 85 1b __ STA ACCU + 0 
2b31 : 85 1c __ STA ACCU + 1 
2b33 : 60 __ __ RTS
2b34 : 38 __ __ SEC
2b35 : a5 07 __ LDA WORK + 4 
2b37 : e5 08 __ SBC WORK + 5 
2b39 : f0 38 __ BEQ $2b73 ; (faddsub + 96)
2b3b : aa __ __ TAX
2b3c : b0 25 __ BCS $2b63 ; (faddsub + 80)
2b3e : e0 e9 __ CPX #$e9
2b40 : b0 0e __ BCS $2b50 ; (faddsub + 61)
2b42 : a5 08 __ LDA WORK + 5 
2b44 : 85 07 __ STA WORK + 4 
2b46 : a9 00 __ LDA #$00
2b48 : 85 1b __ STA ACCU + 0 
2b4a : 85 1c __ STA ACCU + 1 
2b4c : 85 1d __ STA ACCU + 2 
2b4e : f0 23 __ BEQ $2b73 ; (faddsub + 96)
2b50 : a5 1d __ LDA ACCU + 2 
2b52 : 4a __ __ LSR
2b53 : 66 1c __ ROR ACCU + 1 
2b55 : 66 1b __ ROR ACCU + 0 
2b57 : e8 __ __ INX
2b58 : d0 f8 __ BNE $2b52 ; (faddsub + 63)
2b5a : 85 1d __ STA ACCU + 2 
2b5c : a5 08 __ LDA WORK + 5 
2b5e : 85 07 __ STA WORK + 4 
2b60 : 4c 73 2b JMP $2b73 ; (faddsub + 96)
2b63 : e0 18 __ CPX #$18
2b65 : b0 33 __ BCS $2b9a ; (faddsub + 135)
2b67 : a5 05 __ LDA WORK + 2 
2b69 : 4a __ __ LSR
2b6a : 66 04 __ ROR WORK + 1 
2b6c : 66 03 __ ROR WORK + 0 
2b6e : ca __ __ DEX
2b6f : d0 f8 __ BNE $2b69 ; (faddsub + 86)
2b71 : 85 05 __ STA WORK + 2 
2b73 : a5 1e __ LDA ACCU + 3 
2b75 : 29 80 __ AND #$80
2b77 : 85 1e __ STA ACCU + 3 
2b79 : 45 06 __ EOR WORK + 3 
2b7b : 30 31 __ BMI $2bae ; (faddsub + 155)
2b7d : 18 __ __ CLC
2b7e : a5 1b __ LDA ACCU + 0 
2b80 : 65 03 __ ADC WORK + 0 
2b82 : 85 1b __ STA ACCU + 0 
2b84 : a5 1c __ LDA ACCU + 1 
2b86 : 65 04 __ ADC WORK + 1 
2b88 : 85 1c __ STA ACCU + 1 
2b8a : a5 1d __ LDA ACCU + 2 
2b8c : 65 05 __ ADC WORK + 2 
2b8e : 85 1d __ STA ACCU + 2 
2b90 : 90 08 __ BCC $2b9a ; (faddsub + 135)
2b92 : 66 1d __ ROR ACCU + 2 
2b94 : 66 1c __ ROR ACCU + 1 
2b96 : 66 1b __ ROR ACCU + 0 
2b98 : e6 07 __ INC WORK + 4 
2b9a : a5 07 __ LDA WORK + 4 
2b9c : c9 ff __ CMP #$ff
2b9e : f0 83 __ BEQ $2b23 ; (faddsub + 16)
2ba0 : 4a __ __ LSR
2ba1 : 05 1e __ ORA ACCU + 3 
2ba3 : 85 1e __ STA ACCU + 3 
2ba5 : b0 06 __ BCS $2bad ; (faddsub + 154)
2ba7 : a5 1d __ LDA ACCU + 2 
2ba9 : 29 7f __ AND #$7f
2bab : 85 1d __ STA ACCU + 2 
2bad : 60 __ __ RTS
2bae : 38 __ __ SEC
2baf : a5 1b __ LDA ACCU + 0 
2bb1 : e5 03 __ SBC WORK + 0 
2bb3 : 85 1b __ STA ACCU + 0 
2bb5 : a5 1c __ LDA ACCU + 1 
2bb7 : e5 04 __ SBC WORK + 1 
2bb9 : 85 1c __ STA ACCU + 1 
2bbb : a5 1d __ LDA ACCU + 2 
2bbd : e5 05 __ SBC WORK + 2 
2bbf : 85 1d __ STA ACCU + 2 
2bc1 : b0 19 __ BCS $2bdc ; (faddsub + 201)
2bc3 : 38 __ __ SEC
2bc4 : a9 00 __ LDA #$00
2bc6 : e5 1b __ SBC ACCU + 0 
2bc8 : 85 1b __ STA ACCU + 0 
2bca : a9 00 __ LDA #$00
2bcc : e5 1c __ SBC ACCU + 1 
2bce : 85 1c __ STA ACCU + 1 
2bd0 : a9 00 __ LDA #$00
2bd2 : e5 1d __ SBC ACCU + 2 
2bd4 : 85 1d __ STA ACCU + 2 
2bd6 : a5 1e __ LDA ACCU + 3 
2bd8 : 49 80 __ EOR #$80
2bda : 85 1e __ STA ACCU + 3 
2bdc : a5 1d __ LDA ACCU + 2 
2bde : 30 ba __ BMI $2b9a ; (faddsub + 135)
2be0 : 05 1c __ ORA ACCU + 1 
2be2 : 05 1b __ ORA ACCU + 0 
2be4 : f0 0f __ BEQ $2bf5 ; (faddsub + 226)
2be6 : c6 07 __ DEC WORK + 4 
2be8 : f0 0b __ BEQ $2bf5 ; (faddsub + 226)
2bea : 06 1b __ ASL ACCU + 0 
2bec : 26 1c __ ROL ACCU + 1 
2bee : 26 1d __ ROL ACCU + 2 
2bf0 : 10 f4 __ BPL $2be6 ; (faddsub + 211)
2bf2 : 4c 9a 2b JMP $2b9a ; (faddsub + 135)
2bf5 : a9 00 __ LDA #$00
2bf7 : 85 1b __ STA ACCU + 0 
2bf9 : 85 1c __ STA ACCU + 1 
2bfb : 85 1d __ STA ACCU + 2 
2bfd : 85 1e __ STA ACCU + 3 
2bff : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
2c00 : a5 1b __ LDA ACCU + 0 
2c02 : 05 1c __ ORA ACCU + 1 
2c04 : 05 1d __ ORA ACCU + 2 
2c06 : f0 0e __ BEQ $2c16 ; (crt_fmul + 22)
2c08 : a5 03 __ LDA WORK + 0 
2c0a : 05 04 __ ORA WORK + 1 
2c0c : 05 05 __ ORA WORK + 2 
2c0e : d0 09 __ BNE $2c19 ; (crt_fmul + 25)
2c10 : 85 1b __ STA ACCU + 0 
2c12 : 85 1c __ STA ACCU + 1 
2c14 : 85 1d __ STA ACCU + 2 
2c16 : 85 1e __ STA ACCU + 3 
2c18 : 60 __ __ RTS
2c19 : a5 1e __ LDA ACCU + 3 
2c1b : 45 06 __ EOR WORK + 3 
2c1d : 29 80 __ AND #$80
2c1f : 85 1e __ STA ACCU + 3 
2c21 : a9 ff __ LDA #$ff
2c23 : c5 07 __ CMP WORK + 4 
2c25 : f0 42 __ BEQ $2c69 ; (crt_fmul + 105)
2c27 : c5 08 __ CMP WORK + 5 
2c29 : f0 3e __ BEQ $2c69 ; (crt_fmul + 105)
2c2b : a9 00 __ LDA #$00
2c2d : 85 09 __ STA WORK + 6 
2c2f : 85 0a __ STA WORK + 7 
2c31 : 85 0b __ STA WORK + 8 
2c33 : a4 1b __ LDY ACCU + 0 
2c35 : a5 03 __ LDA WORK + 0 
2c37 : d0 06 __ BNE $2c3f ; (crt_fmul + 63)
2c39 : a5 04 __ LDA WORK + 1 
2c3b : f0 0a __ BEQ $2c47 ; (crt_fmul + 71)
2c3d : d0 05 __ BNE $2c44 ; (crt_fmul + 68)
2c3f : 20 9a 2c JSR $2c9a ; (crt_fmul8 + 0)
2c42 : a5 04 __ LDA WORK + 1 
2c44 : 20 9a 2c JSR $2c9a ; (crt_fmul8 + 0)
2c47 : a5 05 __ LDA WORK + 2 
2c49 : 20 9a 2c JSR $2c9a ; (crt_fmul8 + 0)
2c4c : 38 __ __ SEC
2c4d : a5 0b __ LDA WORK + 8 
2c4f : 30 06 __ BMI $2c57 ; (crt_fmul + 87)
2c51 : 06 09 __ ASL WORK + 6 
2c53 : 26 0a __ ROL WORK + 7 
2c55 : 2a __ __ ROL
2c56 : 18 __ __ CLC
2c57 : 29 7f __ AND #$7f
2c59 : 85 0b __ STA WORK + 8 
2c5b : a5 07 __ LDA WORK + 4 
2c5d : 65 08 __ ADC WORK + 5 
2c5f : 90 19 __ BCC $2c7a ; (crt_fmul + 122)
2c61 : e9 7f __ SBC #$7f
2c63 : b0 04 __ BCS $2c69 ; (crt_fmul + 105)
2c65 : c9 ff __ CMP #$ff
2c67 : d0 15 __ BNE $2c7e ; (crt_fmul + 126)
2c69 : a5 1e __ LDA ACCU + 3 
2c6b : 09 7f __ ORA #$7f
2c6d : 85 1e __ STA ACCU + 3 
2c6f : a9 80 __ LDA #$80
2c71 : 85 1d __ STA ACCU + 2 
2c73 : a9 00 __ LDA #$00
2c75 : 85 1b __ STA ACCU + 0 
2c77 : 85 1c __ STA ACCU + 1 
2c79 : 60 __ __ RTS
2c7a : e9 7e __ SBC #$7e
2c7c : 90 15 __ BCC $2c93 ; (crt_fmul + 147)
2c7e : 4a __ __ LSR
2c7f : 05 1e __ ORA ACCU + 3 
2c81 : 85 1e __ STA ACCU + 3 
2c83 : a9 00 __ LDA #$00
2c85 : 6a __ __ ROR
2c86 : 05 0b __ ORA WORK + 8 
2c88 : 85 1d __ STA ACCU + 2 
2c8a : a5 0a __ LDA WORK + 7 
2c8c : 85 1c __ STA ACCU + 1 
2c8e : a5 09 __ LDA WORK + 6 
2c90 : 85 1b __ STA ACCU + 0 
2c92 : 60 __ __ RTS
2c93 : a9 00 __ LDA #$00
2c95 : 85 1e __ STA ACCU + 3 
2c97 : f0 d8 __ BEQ $2c71 ; (crt_fmul + 113)
2c99 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
2c9a : 38 __ __ SEC
2c9b : 6a __ __ ROR
2c9c : 90 1e __ BCC $2cbc ; (crt_fmul8 + 34)
2c9e : aa __ __ TAX
2c9f : 18 __ __ CLC
2ca0 : 98 __ __ TYA
2ca1 : 65 09 __ ADC WORK + 6 
2ca3 : 85 09 __ STA WORK + 6 
2ca5 : a5 0a __ LDA WORK + 7 
2ca7 : 65 1c __ ADC ACCU + 1 
2ca9 : 85 0a __ STA WORK + 7 
2cab : a5 0b __ LDA WORK + 8 
2cad : 65 1d __ ADC ACCU + 2 
2caf : 6a __ __ ROR
2cb0 : 85 0b __ STA WORK + 8 
2cb2 : 8a __ __ TXA
2cb3 : 66 0a __ ROR WORK + 7 
2cb5 : 66 09 __ ROR WORK + 6 
2cb7 : 4a __ __ LSR
2cb8 : f0 0d __ BEQ $2cc7 ; (crt_fmul8 + 45)
2cba : b0 e2 __ BCS $2c9e ; (crt_fmul8 + 4)
2cbc : 66 0b __ ROR WORK + 8 
2cbe : 66 0a __ ROR WORK + 7 
2cc0 : 66 09 __ ROR WORK + 6 
2cc2 : 4a __ __ LSR
2cc3 : 90 f7 __ BCC $2cbc ; (crt_fmul8 + 34)
2cc5 : d0 d7 __ BNE $2c9e ; (crt_fmul8 + 4)
2cc7 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
2cc8 : a5 1b __ LDA ACCU + 0 
2cca : 05 1c __ ORA ACCU + 1 
2ccc : 05 1d __ ORA ACCU + 2 
2cce : d0 03 __ BNE $2cd3 ; (crt_fdiv + 11)
2cd0 : 85 1e __ STA ACCU + 3 
2cd2 : 60 __ __ RTS
2cd3 : a5 1e __ LDA ACCU + 3 
2cd5 : 45 06 __ EOR WORK + 3 
2cd7 : 29 80 __ AND #$80
2cd9 : 85 1e __ STA ACCU + 3 
2cdb : a5 08 __ LDA WORK + 5 
2cdd : f0 62 __ BEQ $2d41 ; (crt_fdiv + 121)
2cdf : a5 07 __ LDA WORK + 4 
2ce1 : c9 ff __ CMP #$ff
2ce3 : f0 5c __ BEQ $2d41 ; (crt_fdiv + 121)
2ce5 : a9 00 __ LDA #$00
2ce7 : 85 09 __ STA WORK + 6 
2ce9 : 85 0a __ STA WORK + 7 
2ceb : 85 0b __ STA WORK + 8 
2ced : a2 18 __ LDX #$18
2cef : a5 1b __ LDA ACCU + 0 
2cf1 : c5 03 __ CMP WORK + 0 
2cf3 : a5 1c __ LDA ACCU + 1 
2cf5 : e5 04 __ SBC WORK + 1 
2cf7 : a5 1d __ LDA ACCU + 2 
2cf9 : e5 05 __ SBC WORK + 2 
2cfb : 90 13 __ BCC $2d10 ; (crt_fdiv + 72)
2cfd : a5 1b __ LDA ACCU + 0 
2cff : e5 03 __ SBC WORK + 0 
2d01 : 85 1b __ STA ACCU + 0 
2d03 : a5 1c __ LDA ACCU + 1 
2d05 : e5 04 __ SBC WORK + 1 
2d07 : 85 1c __ STA ACCU + 1 
2d09 : a5 1d __ LDA ACCU + 2 
2d0b : e5 05 __ SBC WORK + 2 
2d0d : 85 1d __ STA ACCU + 2 
2d0f : 38 __ __ SEC
2d10 : 26 09 __ ROL WORK + 6 
2d12 : 26 0a __ ROL WORK + 7 
2d14 : 26 0b __ ROL WORK + 8 
2d16 : ca __ __ DEX
2d17 : f0 0a __ BEQ $2d23 ; (crt_fdiv + 91)
2d19 : 06 1b __ ASL ACCU + 0 
2d1b : 26 1c __ ROL ACCU + 1 
2d1d : 26 1d __ ROL ACCU + 2 
2d1f : b0 dc __ BCS $2cfd ; (crt_fdiv + 53)
2d21 : 90 cc __ BCC $2cef ; (crt_fdiv + 39)
2d23 : 38 __ __ SEC
2d24 : a5 0b __ LDA WORK + 8 
2d26 : 30 06 __ BMI $2d2e ; (crt_fdiv + 102)
2d28 : 06 09 __ ASL WORK + 6 
2d2a : 26 0a __ ROL WORK + 7 
2d2c : 2a __ __ ROL
2d2d : 18 __ __ CLC
2d2e : 29 7f __ AND #$7f
2d30 : 85 0b __ STA WORK + 8 
2d32 : a5 07 __ LDA WORK + 4 
2d34 : e5 08 __ SBC WORK + 5 
2d36 : 90 1a __ BCC $2d52 ; (crt_fdiv + 138)
2d38 : 18 __ __ CLC
2d39 : 69 7f __ ADC #$7f
2d3b : b0 04 __ BCS $2d41 ; (crt_fdiv + 121)
2d3d : c9 ff __ CMP #$ff
2d3f : d0 15 __ BNE $2d56 ; (crt_fdiv + 142)
2d41 : a5 1e __ LDA ACCU + 3 
2d43 : 09 7f __ ORA #$7f
2d45 : 85 1e __ STA ACCU + 3 
2d47 : a9 80 __ LDA #$80
2d49 : 85 1d __ STA ACCU + 2 
2d4b : a9 00 __ LDA #$00
2d4d : 85 1c __ STA ACCU + 1 
2d4f : 85 1b __ STA ACCU + 0 
2d51 : 60 __ __ RTS
2d52 : 69 7f __ ADC #$7f
2d54 : 90 15 __ BCC $2d6b ; (crt_fdiv + 163)
2d56 : 4a __ __ LSR
2d57 : 05 1e __ ORA ACCU + 3 
2d59 : 85 1e __ STA ACCU + 3 
2d5b : a9 00 __ LDA #$00
2d5d : 6a __ __ ROR
2d5e : 05 0b __ ORA WORK + 8 
2d60 : 85 1d __ STA ACCU + 2 
2d62 : a5 0a __ LDA WORK + 7 
2d64 : 85 1c __ STA ACCU + 1 
2d66 : a5 09 __ LDA WORK + 6 
2d68 : 85 1b __ STA ACCU + 0 
2d6a : 60 __ __ RTS
2d6b : a9 00 __ LDA #$00
2d6d : 85 1e __ STA ACCU + 3 
2d6f : 85 1d __ STA ACCU + 2 
2d71 : 85 1c __ STA ACCU + 1 
2d73 : 85 1b __ STA ACCU + 0 
2d75 : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
2d76 : 24 1c __ BIT ACCU + 1 
2d78 : 10 0d __ BPL $2d87 ; (divs16 + 17)
2d7a : 20 94 2d JSR $2d94 ; (negaccu + 0)
2d7d : 24 04 __ BIT WORK + 1 
2d7f : 10 0d __ BPL $2d8e ; (divs16 + 24)
2d81 : 20 a2 2d JSR $2da2 ; (negtmp + 0)
2d84 : 4c b0 2d JMP $2db0 ; (divmod + 0)
2d87 : 24 04 __ BIT WORK + 1 
2d89 : 10 f9 __ BPL $2d84 ; (divs16 + 14)
2d8b : 20 a2 2d JSR $2da2 ; (negtmp + 0)
2d8e : 20 b0 2d JSR $2db0 ; (divmod + 0)
2d91 : 4c 94 2d JMP $2d94 ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
2d94 : 38 __ __ SEC
2d95 : a9 00 __ LDA #$00
2d97 : e5 1b __ SBC ACCU + 0 
2d99 : 85 1b __ STA ACCU + 0 
2d9b : a9 00 __ LDA #$00
2d9d : e5 1c __ SBC ACCU + 1 
2d9f : 85 1c __ STA ACCU + 1 
2da1 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
2da2 : 38 __ __ SEC
2da3 : a9 00 __ LDA #$00
2da5 : e5 03 __ SBC WORK + 0 
2da7 : 85 03 __ STA WORK + 0 
2da9 : a9 00 __ LDA #$00
2dab : e5 04 __ SBC WORK + 1 
2dad : 85 04 __ STA WORK + 1 
2daf : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
2db0 : a5 1c __ LDA ACCU + 1 
2db2 : d0 31 __ BNE $2de5 ; (divmod + 53)
2db4 : a5 04 __ LDA WORK + 1 
2db6 : d0 1e __ BNE $2dd6 ; (divmod + 38)
2db8 : 85 06 __ STA WORK + 3 
2dba : a2 04 __ LDX #$04
2dbc : 06 1b __ ASL ACCU + 0 
2dbe : 2a __ __ ROL
2dbf : c5 03 __ CMP WORK + 0 
2dc1 : 90 02 __ BCC $2dc5 ; (divmod + 21)
2dc3 : e5 03 __ SBC WORK + 0 
2dc5 : 26 1b __ ROL ACCU + 0 
2dc7 : 2a __ __ ROL
2dc8 : c5 03 __ CMP WORK + 0 
2dca : 90 02 __ BCC $2dce ; (divmod + 30)
2dcc : e5 03 __ SBC WORK + 0 
2dce : 26 1b __ ROL ACCU + 0 
2dd0 : ca __ __ DEX
2dd1 : d0 eb __ BNE $2dbe ; (divmod + 14)
2dd3 : 85 05 __ STA WORK + 2 
2dd5 : 60 __ __ RTS
2dd6 : a5 1b __ LDA ACCU + 0 
2dd8 : 85 05 __ STA WORK + 2 
2dda : a5 1c __ LDA ACCU + 1 
2ddc : 85 06 __ STA WORK + 3 
2dde : a9 00 __ LDA #$00
2de0 : 85 1b __ STA ACCU + 0 
2de2 : 85 1c __ STA ACCU + 1 
2de4 : 60 __ __ RTS
2de5 : a5 04 __ LDA WORK + 1 
2de7 : d0 1f __ BNE $2e08 ; (divmod + 88)
2de9 : a5 03 __ LDA WORK + 0 
2deb : 30 1b __ BMI $2e08 ; (divmod + 88)
2ded : a9 00 __ LDA #$00
2def : 85 06 __ STA WORK + 3 
2df1 : a2 10 __ LDX #$10
2df3 : 06 1b __ ASL ACCU + 0 
2df5 : 26 1c __ ROL ACCU + 1 
2df7 : 2a __ __ ROL
2df8 : c5 03 __ CMP WORK + 0 
2dfa : 90 02 __ BCC $2dfe ; (divmod + 78)
2dfc : e5 03 __ SBC WORK + 0 
2dfe : 26 1b __ ROL ACCU + 0 
2e00 : 26 1c __ ROL ACCU + 1 
2e02 : ca __ __ DEX
2e03 : d0 f2 __ BNE $2df7 ; (divmod + 71)
2e05 : 85 05 __ STA WORK + 2 
2e07 : 60 __ __ RTS
2e08 : a9 00 __ LDA #$00
2e0a : 85 05 __ STA WORK + 2 
2e0c : 85 06 __ STA WORK + 3 
2e0e : 84 02 __ STY $02 
2e10 : a0 10 __ LDY #$10
2e12 : 18 __ __ CLC
2e13 : 26 1b __ ROL ACCU + 0 
2e15 : 26 1c __ ROL ACCU + 1 
2e17 : 26 05 __ ROL WORK + 2 
2e19 : 26 06 __ ROL WORK + 3 
2e1b : 38 __ __ SEC
2e1c : a5 05 __ LDA WORK + 2 
2e1e : e5 03 __ SBC WORK + 0 
2e20 : aa __ __ TAX
2e21 : a5 06 __ LDA WORK + 3 
2e23 : e5 04 __ SBC WORK + 1 
2e25 : 90 04 __ BCC $2e2b ; (divmod + 123)
2e27 : 86 05 __ STX WORK + 2 
2e29 : 85 06 __ STA WORK + 3 
2e2b : 88 __ __ DEY
2e2c : d0 e5 __ BNE $2e13 ; (divmod + 99)
2e2e : 26 1b __ ROL ACCU + 0 
2e30 : 26 1c __ ROL ACCU + 1 
2e32 : a4 02 __ LDY $02 
2e34 : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
2e35 : 24 1c __ BIT ACCU + 1 
2e37 : 10 10 __ BPL $2e49 ; (mods16 + 20)
2e39 : 20 94 2d JSR $2d94 ; (negaccu + 0)
2e3c : 24 04 __ BIT WORK + 1 
2e3e : 10 03 __ BPL $2e43 ; (mods16 + 14)
2e40 : 20 a2 2d JSR $2da2 ; (negtmp + 0)
2e43 : 20 b0 2d JSR $2db0 ; (divmod + 0)
2e46 : 4c 54 2e JMP $2e54 ; (negtmpb + 0)
2e49 : 24 04 __ BIT WORK + 1 
2e4b : 10 03 __ BPL $2e50 ; (mods16 + 27)
2e4d : 20 a2 2d JSR $2da2 ; (negtmp + 0)
2e50 : 4c b0 2d JMP $2db0 ; (divmod + 0)
2e53 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
2e54 : 38 __ __ SEC
2e55 : a9 00 __ LDA #$00
2e57 : e5 05 __ SBC WORK + 2 
2e59 : 85 05 __ STA WORK + 2 
2e5b : a9 00 __ LDA #$00
2e5d : e5 06 __ SBC WORK + 3 
2e5f : 85 06 __ STA WORK + 3 
2e61 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
2e62 : 20 f2 2a JSR $2af2 ; (freg + 36)
2e65 : a5 07 __ LDA WORK + 4 
2e67 : c9 7f __ CMP #$7f
2e69 : b0 07 __ BCS $2e72 ; (f32_to_i16 + 16)
2e6b : a9 00 __ LDA #$00
2e6d : 85 1b __ STA ACCU + 0 
2e6f : 85 1c __ STA ACCU + 1 
2e71 : 60 __ __ RTS
2e72 : e9 8e __ SBC #$8e
2e74 : 90 16 __ BCC $2e8c ; (f32_to_i16 + 42)
2e76 : 24 1e __ BIT ACCU + 3 
2e78 : 30 09 __ BMI $2e83 ; (f32_to_i16 + 33)
2e7a : a9 ff __ LDA #$ff
2e7c : 85 1b __ STA ACCU + 0 
2e7e : a9 7f __ LDA #$7f
2e80 : 85 1c __ STA ACCU + 1 
2e82 : 60 __ __ RTS
2e83 : a9 00 __ LDA #$00
2e85 : 85 1b __ STA ACCU + 0 
2e87 : a9 80 __ LDA #$80
2e89 : 85 1c __ STA ACCU + 1 
2e8b : 60 __ __ RTS
2e8c : aa __ __ TAX
2e8d : a5 1c __ LDA ACCU + 1 
2e8f : 46 1d __ LSR ACCU + 2 
2e91 : 6a __ __ ROR
2e92 : e8 __ __ INX
2e93 : d0 fa __ BNE $2e8f ; (f32_to_i16 + 45)
2e95 : 24 1e __ BIT ACCU + 3 
2e97 : 10 0e __ BPL $2ea7 ; (f32_to_i16 + 69)
2e99 : 38 __ __ SEC
2e9a : 49 ff __ EOR #$ff
2e9c : 69 00 __ ADC #$00
2e9e : 85 1b __ STA ACCU + 0 
2ea0 : a9 00 __ LDA #$00
2ea2 : e5 1d __ SBC ACCU + 2 
2ea4 : 85 1c __ STA ACCU + 1 
2ea6 : 60 __ __ RTS
2ea7 : 85 1b __ STA ACCU + 0 
2ea9 : a5 1d __ LDA ACCU + 2 
2eab : 85 1c __ STA ACCU + 1 
2ead : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
2eae : 24 1c __ BIT ACCU + 1 
2eb0 : 30 03 __ BMI $2eb5 ; (sint16_to_float + 7)
2eb2 : 4c cc 2e JMP $2ecc ; (uint16_to_float + 0)
2eb5 : 38 __ __ SEC
2eb6 : a9 00 __ LDA #$00
2eb8 : e5 1b __ SBC ACCU + 0 
2eba : 85 1b __ STA ACCU + 0 
2ebc : a9 00 __ LDA #$00
2ebe : e5 1c __ SBC ACCU + 1 
2ec0 : 85 1c __ STA ACCU + 1 
2ec2 : 20 cc 2e JSR $2ecc ; (uint16_to_float + 0)
2ec5 : a5 1e __ LDA ACCU + 3 
2ec7 : 09 80 __ ORA #$80
2ec9 : 85 1e __ STA ACCU + 3 
2ecb : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
2ecc : a5 1b __ LDA ACCU + 0 
2ece : 05 1c __ ORA ACCU + 1 
2ed0 : d0 05 __ BNE $2ed7 ; (uint16_to_float + 11)
2ed2 : 85 1d __ STA ACCU + 2 
2ed4 : 85 1e __ STA ACCU + 3 
2ed6 : 60 __ __ RTS
2ed7 : a2 8e __ LDX #$8e
2ed9 : a5 1c __ LDA ACCU + 1 
2edb : 30 06 __ BMI $2ee3 ; (uint16_to_float + 23)
2edd : ca __ __ DEX
2ede : 06 1b __ ASL ACCU + 0 
2ee0 : 2a __ __ ROL
2ee1 : 10 fa __ BPL $2edd ; (uint16_to_float + 17)
2ee3 : 0a __ __ ASL
2ee4 : 85 1d __ STA ACCU + 2 
2ee6 : a5 1b __ LDA ACCU + 0 
2ee8 : 85 1c __ STA ACCU + 1 
2eea : 8a __ __ TXA
2eeb : 4a __ __ LSR
2eec : 85 1e __ STA ACCU + 3 
2eee : a9 00 __ LDA #$00
2ef0 : 85 1b __ STA ACCU + 0 
2ef2 : 66 1d __ ROR ACCU + 2 
2ef4 : 60 __ __ RTS
--------------------------------------------------------------------
sint32_to_float: ; sint32_to_float
2ef5 : 24 1e __ BIT ACCU + 3 
2ef7 : 30 03 __ BMI $2efc ; (sint32_to_float + 7)
2ef9 : 4c 1f 2f JMP $2f1f ; (uint32_to_float + 0)
2efc : 38 __ __ SEC
2efd : a9 00 __ LDA #$00
2eff : e5 1b __ SBC ACCU + 0 
2f01 : 85 1b __ STA ACCU + 0 
2f03 : a9 00 __ LDA #$00
2f05 : e5 1c __ SBC ACCU + 1 
2f07 : 85 1c __ STA ACCU + 1 
2f09 : a9 00 __ LDA #$00
2f0b : e5 1d __ SBC ACCU + 2 
2f0d : 85 1d __ STA ACCU + 2 
2f0f : a9 00 __ LDA #$00
2f11 : e5 1e __ SBC ACCU + 3 
2f13 : 85 1e __ STA ACCU + 3 
2f15 : 20 1f 2f JSR $2f1f ; (uint32_to_float + 0)
2f18 : a5 1e __ LDA ACCU + 3 
2f1a : 09 80 __ ORA #$80
2f1c : 85 1e __ STA ACCU + 3 
2f1e : 60 __ __ RTS
--------------------------------------------------------------------
uint32_to_float: ; uint32_to_float
2f1f : a5 1b __ LDA ACCU + 0 
2f21 : 05 1c __ ORA ACCU + 1 
2f23 : 05 1d __ ORA ACCU + 2 
2f25 : 05 1e __ ORA ACCU + 3 
2f27 : d0 01 __ BNE $2f2a ; (uint32_to_float + 11)
2f29 : 60 __ __ RTS
2f2a : a2 9e __ LDX #$9e
2f2c : a5 1e __ LDA ACCU + 3 
2f2e : 30 0a __ BMI $2f3a ; (uint32_to_float + 27)
2f30 : ca __ __ DEX
2f31 : 06 1b __ ASL ACCU + 0 
2f33 : 26 1c __ ROL ACCU + 1 
2f35 : 26 1d __ ROL ACCU + 2 
2f37 : 2a __ __ ROL
2f38 : 10 f6 __ BPL $2f30 ; (uint32_to_float + 17)
2f3a : 24 1b __ BIT ACCU + 0 
2f3c : 10 13 __ BPL $2f51 ; (uint32_to_float + 50)
2f3e : e6 1c __ INC ACCU + 1 
2f40 : d0 0f __ BNE $2f51 ; (uint32_to_float + 50)
2f42 : e6 1d __ INC ACCU + 2 
2f44 : d0 0b __ BNE $2f51 ; (uint32_to_float + 50)
2f46 : 18 __ __ CLC
2f47 : 69 01 __ ADC #$01
2f49 : 90 06 __ BCC $2f51 ; (uint32_to_float + 50)
2f4b : 4a __ __ LSR
2f4c : 66 1d __ ROR ACCU + 2 
2f4e : 66 1c __ ROR ACCU + 1 
2f50 : e8 __ __ INX
2f51 : 0a __ __ ASL
2f52 : a4 1c __ LDY ACCU + 1 
2f54 : 84 1b __ STY ACCU + 0 
2f56 : a4 1d __ LDY ACCU + 2 
2f58 : 84 1c __ STY ACCU + 1 
2f5a : 85 1d __ STA ACCU + 2 
2f5c : 8a __ __ TXA
2f5d : 4a __ __ LSR
2f5e : 85 1e __ STA ACCU + 3 
2f60 : 66 1d __ ROR ACCU + 2 
2f62 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
2f63 : 84 02 __ STY $02 
2f65 : a0 20 __ LDY #$20
2f67 : a9 00 __ LDA #$00
2f69 : 85 07 __ STA WORK + 4 
2f6b : 85 08 __ STA WORK + 5 
2f6d : 85 09 __ STA WORK + 6 
2f6f : 85 0a __ STA WORK + 7 
2f71 : a5 05 __ LDA WORK + 2 
2f73 : 05 06 __ ORA WORK + 3 
2f75 : d0 78 __ BNE $2fef ; (divmod32 + 140)
2f77 : a5 04 __ LDA WORK + 1 
2f79 : d0 27 __ BNE $2fa2 ; (divmod32 + 63)
2f7b : 18 __ __ CLC
2f7c : 26 1b __ ROL ACCU + 0 
2f7e : 26 1c __ ROL ACCU + 1 
2f80 : 26 1d __ ROL ACCU + 2 
2f82 : 26 1e __ ROL ACCU + 3 
2f84 : 2a __ __ ROL
2f85 : 90 05 __ BCC $2f8c ; (divmod32 + 41)
2f87 : e5 03 __ SBC WORK + 0 
2f89 : 38 __ __ SEC
2f8a : b0 06 __ BCS $2f92 ; (divmod32 + 47)
2f8c : c5 03 __ CMP WORK + 0 
2f8e : 90 02 __ BCC $2f92 ; (divmod32 + 47)
2f90 : e5 03 __ SBC WORK + 0 
2f92 : 88 __ __ DEY
2f93 : d0 e7 __ BNE $2f7c ; (divmod32 + 25)
2f95 : 85 07 __ STA WORK + 4 
2f97 : 26 1b __ ROL ACCU + 0 
2f99 : 26 1c __ ROL ACCU + 1 
2f9b : 26 1d __ ROL ACCU + 2 
2f9d : 26 1e __ ROL ACCU + 3 
2f9f : a4 02 __ LDY $02 
2fa1 : 60 __ __ RTS
2fa2 : a5 1e __ LDA ACCU + 3 
2fa4 : d0 10 __ BNE $2fb6 ; (divmod32 + 83)
2fa6 : a6 1d __ LDX ACCU + 2 
2fa8 : 86 1e __ STX ACCU + 3 
2faa : a6 1c __ LDX ACCU + 1 
2fac : 86 1d __ STX ACCU + 2 
2fae : a6 1b __ LDX ACCU + 0 
2fb0 : 86 1c __ STX ACCU + 1 
2fb2 : 85 1b __ STA ACCU + 0 
2fb4 : a0 18 __ LDY #$18
2fb6 : 18 __ __ CLC
2fb7 : 26 1b __ ROL ACCU + 0 
2fb9 : 26 1c __ ROL ACCU + 1 
2fbb : 26 1d __ ROL ACCU + 2 
2fbd : 26 1e __ ROL ACCU + 3 
2fbf : 26 07 __ ROL WORK + 4 
2fc1 : 26 08 __ ROL WORK + 5 
2fc3 : 90 0c __ BCC $2fd1 ; (divmod32 + 110)
2fc5 : a5 07 __ LDA WORK + 4 
2fc7 : e5 03 __ SBC WORK + 0 
2fc9 : aa __ __ TAX
2fca : a5 08 __ LDA WORK + 5 
2fcc : e5 04 __ SBC WORK + 1 
2fce : 38 __ __ SEC
2fcf : b0 0c __ BCS $2fdd ; (divmod32 + 122)
2fd1 : 38 __ __ SEC
2fd2 : a5 07 __ LDA WORK + 4 
2fd4 : e5 03 __ SBC WORK + 0 
2fd6 : aa __ __ TAX
2fd7 : a5 08 __ LDA WORK + 5 
2fd9 : e5 04 __ SBC WORK + 1 
2fdb : 90 04 __ BCC $2fe1 ; (divmod32 + 126)
2fdd : 86 07 __ STX WORK + 4 
2fdf : 85 08 __ STA WORK + 5 
2fe1 : 88 __ __ DEY
2fe2 : d0 d3 __ BNE $2fb7 ; (divmod32 + 84)
2fe4 : 26 1b __ ROL ACCU + 0 
2fe6 : 26 1c __ ROL ACCU + 1 
2fe8 : 26 1d __ ROL ACCU + 2 
2fea : 26 1e __ ROL ACCU + 3 
2fec : a4 02 __ LDY $02 
2fee : 60 __ __ RTS
2fef : a0 10 __ LDY #$10
2ff1 : a5 1e __ LDA ACCU + 3 
2ff3 : 85 08 __ STA WORK + 5 
2ff5 : a5 1d __ LDA ACCU + 2 
2ff7 : 85 07 __ STA WORK + 4 
2ff9 : a9 00 __ LDA #$00
2ffb : 85 1d __ STA ACCU + 2 
2ffd : 85 1e __ STA ACCU + 3 
2fff : 18 __ __ CLC
3000 : 26 1b __ ROL ACCU + 0 
3002 : 26 1c __ ROL ACCU + 1 
3004 : 26 07 __ ROL WORK + 4 
3006 : 26 08 __ ROL WORK + 5 
3008 : 26 09 __ ROL WORK + 6 
300a : 26 0a __ ROL WORK + 7 
300c : a5 07 __ LDA WORK + 4 
300e : c5 03 __ CMP WORK + 0 
3010 : a5 08 __ LDA WORK + 5 
3012 : e5 04 __ SBC WORK + 1 
3014 : a5 09 __ LDA WORK + 6 
3016 : e5 05 __ SBC WORK + 2 
3018 : aa __ __ TAX
3019 : a5 0a __ LDA WORK + 7 
301b : e5 06 __ SBC WORK + 3 
301d : 90 11 __ BCC $3030 ; (divmod32 + 205)
301f : 86 09 __ STX WORK + 6 
3021 : 85 0a __ STA WORK + 7 
3023 : a5 07 __ LDA WORK + 4 
3025 : e5 03 __ SBC WORK + 0 
3027 : 85 07 __ STA WORK + 4 
3029 : a5 08 __ LDA WORK + 5 
302b : e5 04 __ SBC WORK + 1 
302d : 85 08 __ STA WORK + 5 
302f : 38 __ __ SEC
3030 : 88 __ __ DEY
3031 : d0 cd __ BNE $3000 ; (divmod32 + 157)
3033 : 26 1b __ ROL ACCU + 0 
3035 : 26 1c __ ROL ACCU + 1 
3037 : a4 02 __ LDY $02 
3039 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
303a : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
seed:
303b : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
giocharmap:
303d : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
303e : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
304e : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
TinyFont:
305a : __ __ __ BYT 00 04 05 08 0d 12 17 1c 1d 21 25 2a 2d 2e 31 32 : .........!%*-.12
306a : __ __ __ BYT 35 39 3d 41 45 49 4d 51 55 59 5d 5e 5f 62 65 68 : 59=AEIMQUY]^_beh
307a : __ __ __ BYT 6c 71 76 7a 7e 82 86 8a 8e 92 95 99 9d a1 a6 ab : lqvz~...........
308a : __ __ __ BYT af b3 b7 bb bf c4 c8 cd d2 d7 dc e1 e5 e8 ec f1 : ................
309a : __ __ __ BYT f5 f9 fd 01 05 09 0d 10 14 18 19 1b 1f 21 26 2a : .............!&*
30aa : __ __ __ BYT 2e 32 36 3a 3e 41 45 49 4e 52 56 5a 5e 5f 63 67 : .26:>AEINRVZ^_cg
30ba : __ __ __ BYT 10 04 0c 14 14 14 14 04 10 10 14 0c 04 0c 04 0c : ................
30ca : __ __ __ BYT 10 10 10 10 10 10 10 10 10 10 04 04 0c 0c 0c 10 : ................
30da : __ __ __ BYT 14 14 10 10 10 10 10 10 10 0c 10 10 10 14 14 10 : ................
30ea : __ __ __ BYT 10 10 10 10 14 10 14 14 14 14 14 10 0c 10 14 10 : ................
30fa : __ __ __ BYT 10 10 10 11 11 11 0d 11 11 05 09 11 09 15 11 11 : ................
310a : __ __ __ BYT 11 11 11 11 0d 11 11 15 11 11 11 11 05 11 11 11 : ................
311a : __ __ __ BYT 00 00 00 00 fa c0 00 c0 28 7c 28 7c 28 20 54 d6 : ........(|(|( T.
312a : __ __ __ BYT 54 08 04 48 10 24 40 6c 92 92 6c 0a c0 38 44 82 : T..H.$@l..l..8D.
313a : __ __ __ BYT 82 82 82 44 38 10 54 38 54 10 10 38 10 03 10 10 : ...D8.T8T..8....
314a : __ __ __ BYT 10 02 06 38 c0 7c 82 82 7c 22 42 fe 02 46 8a 92 : ...8.|..|"B..F..
315a : __ __ __ BYT 62 44 82 92 6c f0 10 3e 10 e4 92 92 8c 7c 92 92 : bD..l..>.....|..
316a : __ __ __ BYT 4c 80 8e 90 e0 6c 92 92 6c 64 92 92 7c 28 0b 10 : L....l..ld..|(..
317a : __ __ __ BYT 28 44 28 28 28 44 28 10 40 80 9a 60 00 00 00 00 : (D(((D(.@..`....
318a : __ __ __ BYT 00 3e 50 90 50 3e fe 92 92 6c 7c 82 82 44 fe 82 : .>P.P>...l|..D..
319a : __ __ __ BYT 82 7c fe 92 92 82 fe 90 90 80 7c 82 92 1c fe 10 : .|........|.....
31aa : __ __ __ BYT 10 fe 82 fe 82 84 82 82 fc fe 10 28 c6 fe 02 02 : ...........(....
31ba : __ __ __ BYT 02 fe 40 20 40 fe fe 40 20 10 fe 7c 82 82 7c fe : ..@ @..@ ..|..|.
31ca : __ __ __ BYT 90 90 60 7c 82 84 7a fe 90 90 6e 64 92 92 4c 80 : ..`|..z...nd..L.
31da : __ __ __ BYT 80 fe 80 80 fc 02 02 fc e0 18 06 18 e0 fe 04 08 : ................
31ea : __ __ __ BYT 04 fe c6 28 10 28 c6 e0 10 1e 10 e0 86 8a 92 a2 : ...(.(..........
31fa : __ __ __ BYT c2 fe 82 82 82 c0 38 06 82 82 82 fe 20 40 80 40 : ......8..... @.@
320a : __ __ __ BYT 20 01 01 01 01 00 00 00 00 04 2a 2a 1e fe 22 22 :  .........**..""
321a : __ __ __ BYT 1c 1c 22 22 14 1c 22 22 fe 1c 2a 2a 18 20 7e a0 : ..""..""..**. ~.
322a : __ __ __ BYT 18 25 25 3e fe 20 20 1e be 01 be fe 10 28 46 fc : .%%>.  ......(F.
323a : __ __ __ BYT 02 3e 20 1e 20 1e 3e 20 20 1e 1c 22 22 1c 3f 24 : .> . .>  .."".?$
324a : __ __ __ BYT 24 18 18 24 24 3f 3e 10 20 10 12 2a 2a 04 20 7c : $..$$?>. ..**. |
325a : __ __ __ BYT 22 3c 02 02 3e 38 04 02 3c 3c 02 1c 02 3c 26 18 : "<..>8..<<...<&.
326a : __ __ __ BYT 0c 32 38 05 05 3e 26 2a 2a 32 10 6c 82 82 fe 82 : .28..>&**2.l....
327a : __ __ __ BYT 82 6c 10 10 20 10 20 00 00 00 00                : .l.. . ....
--------------------------------------------------------------------
tbitmap:
3285 : __ __ __ BYT e0 34 00 00 28 01 40 01                         : .4..(.@.
--------------------------------------------------------------------
lmask:
328d : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
3295 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
blitops_op:
329d : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
bitshift:
32a1 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
32b1 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
32c1 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
32d1 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
Screen:
32d9 : __ __ __ BSS	8
--------------------------------------------------------------------
tworks:
32e1 : __ __ __ BSS	8
--------------------------------------------------------------------
field:
3300 : __ __ __ BSS	160
--------------------------------------------------------------------
BLIT_CODE:
3400 : __ __ __ BSS	224
--------------------------------------------------------------------
tbuffer:
34e0 : __ __ __ BSS	320
