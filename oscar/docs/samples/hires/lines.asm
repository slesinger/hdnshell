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
080e : 8e cb 16 STX $16cb ; (spentry + 0)
0811 : a2 17 __ LDX #$17
0813 : a0 38 __ LDY #$38
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 18 __ CPX #$18
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
083b : a9 ca __ LDA #$ca
083d : 85 23 __ STA SP + 0 
083f : a9 9f __ LDA #$9f
0841 : 85 24 __ STA SP + 1 
0843 : 20 80 08 JSR $0880 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  50, "/home/honza/projects/c64/projects/oscar64/samples/hires/lines.c"
.s4:
0880 : 20 16 09 JSR $0916 ; (init.s4 + 0)
0883 : a9 ff __ LDA #$ff
0885 : 8d ff 9f STA $9fff ; (sstack + 16)
0888 : a2 07 __ LDX #$07
.l5:
088a : bd 74 0a LDA $0a74,x 
088d : 9d cc 9f STA $9fcc,x ; (cr.left + 0)
0890 : ca __ __ DEX
0891 : 10 f7 __ BPL $088a ; (main.l5 + 0)
.s6:
0893 : a9 cc __ LDA #$cc
0895 : 8d fd 9f STA $9ffd ; (sstack + 14)
0898 : a9 9f __ LDA #$9f
089a : 8d fe 9f STA $9ffe ; (sstack + 15)
089d : 20 7c 0a JSR $0a7c ; (draw.s1 + 0)
08a0 : a9 cc __ LDA #$cc
08a2 : 8d fd 9f STA $9ffd ; (sstack + 14)
08a5 : a9 9f __ LDA #$9f
08a7 : 8d fe 9f STA $9ffe ; (sstack + 15)
08aa : a9 00 __ LDA #$00
08ac : 8d ff 9f STA $9fff ; (sstack + 16)
08af : 20 7c 0a JSR $0a7c ; (draw.s1 + 0)
08b2 : a9 cc __ LDA #$cc
08b4 : 8d fd 9f STA $9ffd ; (sstack + 14)
08b7 : a9 9f __ LDA #$9f
08b9 : 8d fe 9f STA $9ffe ; (sstack + 15)
08bc : a9 ff __ LDA #$ff
08be : 8d ff 9f STA $9fff ; (sstack + 16)
08c1 : 20 7c 0a JSR $0a7c ; (draw.s1 + 0)
08c4 : a9 cc __ LDA #$cc
08c6 : 8d fd 9f STA $9ffd ; (sstack + 14)
08c9 : a9 9f __ LDA #$9f
08cb : 8d fe 9f STA $9ffe ; (sstack + 15)
08ce : a9 aa __ LDA #$aa
08d0 : 8d ff 9f STA $9fff ; (sstack + 16)
08d3 : 20 7c 0a JSR $0a7c ; (draw.s1 + 0)
08d6 : a9 cc __ LDA #$cc
08d8 : 8d fd 9f STA $9ffd ; (sstack + 14)
08db : a9 9f __ LDA #$9f
08dd : 8d fe 9f STA $9ffe ; (sstack + 15)
08e0 : a9 88 __ LDA #$88
08e2 : 8d ff 9f STA $9fff ; (sstack + 16)
08e5 : 20 7c 0a JSR $0a7c ; (draw.s1 + 0)
08e8 : a9 cc __ LDA #$cc
08ea : 8d fd 9f STA $9ffd ; (sstack + 14)
08ed : a9 9f __ LDA #$9f
08ef : 8d fe 9f STA $9ffe ; (sstack + 15)
08f2 : a9 80 __ LDA #$80
08f4 : 8d ff 9f STA $9fff ; (sstack + 16)
08f7 : 20 7c 0a JSR $0a7c ; (draw.s1 + 0)
08fa : a9 cc __ LDA #$cc
08fc : 8d fd 9f STA $9ffd ; (sstack + 14)
08ff : a9 9f __ LDA #$9f
0901 : 8d fe 9f STA $9ffe ; (sstack + 15)
0904 : a9 00 __ LDA #$00
0906 : 8d ff 9f STA $9fff ; (sstack + 16)
0909 : 20 7c 0a JSR $0a7c ; (draw.s1 + 0)
090c : 20 3b 16 JSR $163b ; (done.s4 + 0)
090f : a9 00 __ LDA #$00
0911 : 85 1b __ STA ACCU + 0 
0913 : 85 1c __ STA ACCU + 1 
.s3:
0915 : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  13, "/home/honza/projects/c64/projects/oscar64/samples/hires/lines.c"
.s4:
0916 : 20 82 09 JSR $0982 ; (mmap_trampoline.s4 + 0)
0919 : a9 00 __ LDA #$00
091b : 85 0f __ STA P2 
091d : 85 10 __ STA P3 
091f : a9 30 __ LDA #$30
0921 : 85 01 __ STA $01 
0923 : a9 40 __ LDA #$40
0925 : 85 11 __ STA P4 
0927 : a9 1f __ LDA #$1f
0929 : 85 12 __ STA P5 
092b : a9 01 __ LDA #$01
092d : a2 fa __ LDX #$fa
.l6:
092f : ca __ __ DEX
0930 : 9d 00 d0 STA $d000,x 
0933 : 9d fa d0 STA $d0fa,x 
0936 : 9d f4 d1 STA $d1f4,x 
0939 : 9d ee d2 STA $d2ee,x 
093c : d0 f1 __ BNE $092f ; (init.l6 + 0)
.s5:
093e : a9 00 __ LDA #$00
0940 : 85 0d __ STA P0 
0942 : a9 e0 __ LDA #$e0
0944 : 85 0e __ STA P1 
0946 : 20 cc 09 JSR $09cc ; (memset.s4 + 0)
0949 : a9 00 __ LDA #$00
094b : 85 10 __ STA P3 
094d : 85 0e __ STA P1 
094f : a9 35 __ LDA #$35
0951 : 85 01 __ STA $01 
0953 : a9 03 __ LDA #$03
0955 : 85 0d __ STA P0 
0957 : a9 e0 __ LDA #$e0
0959 : 85 11 __ STA P4 
095b : a9 d0 __ LDA #$d0
095d : 85 0f __ STA P2 
095f : 20 f0 09 JSR $09f0 ; (vic_setmode.s4 + 0)
0962 : a9 00 __ LDA #$00
0964 : 85 0f __ STA P2 
0966 : a9 e0 __ LDA #$e0
0968 : 85 10 __ STA P3 
096a : a9 28 __ LDA #$28
096c : 85 11 __ STA P4 
096e : a9 19 __ LDA #$19
0970 : 85 12 __ STA P5 
0972 : a9 01 __ LDA #$01
0974 : 8d 20 d0 STA $d020 
0977 : a9 cd __ LDA #$cd
0979 : 85 0d __ STA P0 
097b : a9 16 __ LDA #$16
097d : 85 0e __ STA P1 
097f : 4c 42 0a JMP $0a42 ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0982 : a9 97 __ LDA #$97
0984 : 8d fa ff STA $fffa 
0987 : a9 09 __ LDA #$09
0989 : 8d fb ff STA $fffb 
098c : a9 b5 __ LDA #$b5
098e : 8d fe ff STA $fffe 
0991 : a9 09 __ LDA #$09
0993 : 8d ff ff STA $ffff 
.s3:
0996 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0997 : 48 __ __ PHA
0998 : 8a __ __ TXA
0999 : 48 __ __ PHA
099a : a9 09 __ LDA #$09
099c : 48 __ __ PHA
099d : a9 ae __ LDA #$ae
099f : 48 __ __ PHA
09a0 : ba __ __ TSX
09a1 : bd 05 01 LDA $0105,x 
09a4 : 48 __ __ PHA
09a5 : a6 01 __ LDX $01 
09a7 : a9 36 __ LDA #$36
09a9 : 85 01 __ STA $01 
09ab : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
09ae : 86 01 __ STX $01 
09b0 : 68 __ __ PLA
09b1 : aa __ __ TAX
09b2 : 68 __ __ PLA
09b3 : 40 __ __ RTI
09b4 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
09b5 : 48 __ __ PHA
09b6 : 8a __ __ TXA
09b7 : 48 __ __ PHA
09b8 : a9 09 __ LDA #$09
09ba : 48 __ __ PHA
09bb : a9 ae __ LDA #$ae
09bd : 48 __ __ PHA
09be : ba __ __ TSX
09bf : bd 05 01 LDA $0105,x 
09c2 : 48 __ __ PHA
09c3 : a6 01 __ LDX $01 
09c5 : a9 36 __ LDA #$36
09c7 : 85 01 __ STA $01 
09c9 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
09cc : a5 0f __ LDA P2 
09ce : a6 12 __ LDX P5 
09d0 : f0 0c __ BEQ $09de ; (memset.s4 + 18)
09d2 : a0 00 __ LDY #$00
09d4 : 91 0d __ STA (P0),y ; (dst + 0)
09d6 : c8 __ __ INY
09d7 : d0 fb __ BNE $09d4 ; (memset.s4 + 8)
09d9 : e6 0e __ INC P1 ; (dst + 1)
09db : ca __ __ DEX
09dc : d0 f6 __ BNE $09d4 ; (memset.s4 + 8)
09de : a4 11 __ LDY P4 
09e0 : f0 05 __ BEQ $09e7 ; (memset.s4 + 27)
09e2 : 88 __ __ DEY
09e3 : 91 0d __ STA (P0),y ; (dst + 0)
09e5 : d0 fb __ BNE $09e2 ; (memset.s4 + 22)
09e7 : a5 0d __ LDA P0 ; (dst + 0)
09e9 : 85 1b __ STA ACCU + 0 
09eb : a5 0e __ LDA P1 ; (dst + 1)
09ed : 85 1c __ STA ACCU + 1 
.s3:
09ef : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
09f0 : a4 0d __ LDY P0 ; (mode + 0)
09f2 : c0 02 __ CPY #$02
09f4 : d0 09 __ BNE $09ff ; (vic_setmode.s5 + 0)
.s10:
09f6 : a9 5b __ LDA #$5b
09f8 : 8d 11 d0 STA $d011 
.s8:
09fb : a9 08 __ LDA #$08
09fd : d0 0c __ BNE $0a0b ; (vic_setmode.s7 + 0)
.s5:
09ff : b0 36 __ BCS $0a37 ; (vic_setmode.s6 + 0)
.s9:
0a01 : a9 1b __ LDA #$1b
0a03 : 8d 11 d0 STA $d011 
0a06 : 98 __ __ TYA
0a07 : f0 f2 __ BEQ $09fb ; (vic_setmode.s8 + 0)
.s11:
0a09 : a9 18 __ LDA #$18
.s7:
0a0b : 8d 16 d0 STA $d016 
0a0e : ad 00 dd LDA $dd00 
0a11 : 29 fc __ AND #$fc
0a13 : 85 1b __ STA ACCU + 0 
0a15 : a5 0f __ LDA P2 ; (text + 1)
0a17 : 0a __ __ ASL
0a18 : 2a __ __ ROL
0a19 : 29 01 __ AND #$01
0a1b : 2a __ __ ROL
0a1c : 49 03 __ EOR #$03
0a1e : 05 1b __ ORA ACCU + 0 
0a20 : 8d 00 dd STA $dd00 
0a23 : a5 0f __ LDA P2 ; (text + 1)
0a25 : 29 3c __ AND #$3c
0a27 : 0a __ __ ASL
0a28 : 0a __ __ ASL
0a29 : 85 1b __ STA ACCU + 0 
0a2b : a5 11 __ LDA P4 ; (font + 1)
0a2d : 29 38 __ AND #$38
0a2f : 4a __ __ LSR
0a30 : 4a __ __ LSR
0a31 : 05 1b __ ORA ACCU + 0 
0a33 : 8d 18 d0 STA $d018 
.s3:
0a36 : 60 __ __ RTS
.s6:
0a37 : a9 3b __ LDA #$3b
0a39 : 8d 11 d0 STA $d011 
0a3c : c0 03 __ CPY #$03
0a3e : d0 c9 __ BNE $0a09 ; (vic_setmode.s11 + 0)
0a40 : f0 b9 __ BEQ $09fb ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0a42 : a5 0f __ LDA P2 ; (data + 0)
0a44 : a0 00 __ LDY #$00
0a46 : 91 0d __ STA (P0),y ; (bm + 0)
0a48 : a5 10 __ LDA P3 ; (data + 1)
0a4a : c8 __ __ INY
0a4b : 91 0d __ STA (P0),y ; (bm + 0)
0a4d : a9 00 __ LDA #$00
0a4f : c8 __ __ INY
0a50 : 91 0d __ STA (P0),y ; (bm + 0)
0a52 : c8 __ __ INY
0a53 : 91 0d __ STA (P0),y ; (bm + 0)
0a55 : a5 11 __ LDA P4 ; (cw + 0)
0a57 : c8 __ __ INY
0a58 : 91 0d __ STA (P0),y ; (bm + 0)
0a5a : a5 12 __ LDA P5 ; (ch + 0)
0a5c : c8 __ __ INY
0a5d : 91 0d __ STA (P0),y ; (bm + 0)
0a5f : a9 00 __ LDA #$00
0a61 : 06 11 __ ASL P4 ; (cw + 0)
0a63 : 2a __ __ ROL
0a64 : 06 11 __ ASL P4 ; (cw + 0)
0a66 : 2a __ __ ROL
0a67 : 06 11 __ ASL P4 ; (cw + 0)
0a69 : 2a __ __ ROL
0a6a : a0 07 __ LDY #$07
0a6c : 91 0d __ STA (P0),y ; (bm + 0)
0a6e : a5 11 __ LDA P4 ; (cw + 0)
0a70 : 88 __ __ DEY
0a71 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0a73 : 60 __ __ RTS
--------------------------------------------------------------------
0a74 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
draw: ; draw(struct ClipRect*,u8)->void
;  39, "/home/honza/projects/c64/projects/oscar64/samples/hires/lines.c"
.s1:
0a7c : a2 08 __ LDX #$08
0a7e : b5 53 __ LDA T0 + 0,x 
0a80 : 9d d4 9f STA $9fd4,x ; (draw@stack + 0)
0a83 : ca __ __ DEX
0a84 : 10 f8 __ BPL $0a7e ; (draw.s1 + 2)
.s4:
0a86 : a9 00 __ LDA #$00
0a88 : 85 53 __ STA T0 + 0 
0a8a : 85 55 __ STA T2 + 0 
0a8c : 85 56 __ STA T2 + 1 
0a8e : ad fd 9f LDA $9ffd ; (sstack + 14)
0a91 : 85 59 __ STA T5 + 0 
0a93 : a9 c7 __ LDA #$c7
0a95 : 85 54 __ STA T1 + 0 
0a97 : a9 3f __ LDA #$3f
0a99 : 85 57 __ STA T3 + 0 
0a9b : a9 01 __ LDA #$01
0a9d : 85 58 __ STA T3 + 1 
0a9f : ad fe 9f LDA $9ffe ; (sstack + 15)
0aa2 : 85 5a __ STA T5 + 1 
0aa4 : ad ff 9f LDA $9fff ; (sstack + 16)
0aa7 : 85 5b __ STA T7 + 0 
.l5:
0aa9 : a9 cd __ LDA #$cd
0aab : 8d ef 9f STA $9fef ; (sstack + 0)
0aae : a9 16 __ LDA #$16
0ab0 : 8d f0 9f STA $9ff0 ; (sstack + 1)
0ab3 : a5 59 __ LDA T5 + 0 
0ab5 : 8d f1 9f STA $9ff1 ; (sstack + 2)
0ab8 : a5 5a __ LDA T5 + 1 
0aba : 8d f2 9f STA $9ff2 ; (sstack + 3)
0abd : a5 55 __ LDA T2 + 0 
0abf : 8d f3 9f STA $9ff3 ; (sstack + 4)
0ac2 : a5 56 __ LDA T2 + 1 
0ac4 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0ac7 : a9 00 __ LDA #$00
0ac9 : 8d f5 9f STA $9ff5 ; (sstack + 6)
0acc : 8d f6 9f STA $9ff6 ; (sstack + 7)
0acf : 8d fa 9f STA $9ffa ; (sstack + 11)
0ad2 : 8d fc 9f STA $9ffc ; (sstack + 13)
0ad5 : a9 3f __ LDA #$3f
0ad7 : 8d f7 9f STA $9ff7 ; (sstack + 8)
0ada : a9 01 __ LDA #$01
0adc : 8d f8 9f STA $9ff8 ; (sstack + 9)
0adf : a5 53 __ LDA T0 + 0 
0ae1 : 8d f9 9f STA $9ff9 ; (sstack + 10)
0ae4 : a5 5b __ LDA T7 + 0 
0ae6 : 8d fb 9f STA $9ffb ; (sstack + 12)
0ae9 : 20 eb 0b JSR $0beb ; (bm_line.s1 + 0)
0aec : a9 cd __ LDA #$cd
0aee : 8d ef 9f STA $9fef ; (sstack + 0)
0af1 : a9 16 __ LDA #$16
0af3 : 8d f0 9f STA $9ff0 ; (sstack + 1)
0af6 : a5 59 __ LDA T5 + 0 
0af8 : 8d f1 9f STA $9ff1 ; (sstack + 2)
0afb : a5 5a __ LDA T5 + 1 
0afd : 8d f2 9f STA $9ff2 ; (sstack + 3)
0b00 : a5 53 __ LDA T0 + 0 
0b02 : 8d f5 9f STA $9ff5 ; (sstack + 6)
0b05 : 18 __ __ CLC
0b06 : 69 05 __ ADC #$05
0b08 : 85 53 __ STA T0 + 0 
0b0a : a9 3f __ LDA #$3f
0b0c : 8d f3 9f STA $9ff3 ; (sstack + 4)
0b0f : a9 01 __ LDA #$01
0b11 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0b14 : a9 00 __ LDA #$00
0b16 : 8d f6 9f STA $9ff6 ; (sstack + 7)
0b19 : 8d fa 9f STA $9ffa ; (sstack + 11)
0b1c : 8d fc 9f STA $9ffc ; (sstack + 13)
0b1f : a5 57 __ LDA T3 + 0 
0b21 : 8d f7 9f STA $9ff7 ; (sstack + 8)
0b24 : a5 58 __ LDA T3 + 1 
0b26 : 8d f8 9f STA $9ff8 ; (sstack + 9)
0b29 : a9 c7 __ LDA #$c7
0b2b : 8d f9 9f STA $9ff9 ; (sstack + 10)
0b2e : a5 5b __ LDA T7 + 0 
0b30 : 8d fb 9f STA $9ffb ; (sstack + 12)
0b33 : 20 eb 0b JSR $0beb ; (bm_line.s1 + 0)
0b36 : a9 cd __ LDA #$cd
0b38 : 8d ef 9f STA $9fef ; (sstack + 0)
0b3b : a9 16 __ LDA #$16
0b3d : 8d f0 9f STA $9ff0 ; (sstack + 1)
0b40 : a5 59 __ LDA T5 + 0 
0b42 : 8d f1 9f STA $9ff1 ; (sstack + 2)
0b45 : a5 5a __ LDA T5 + 1 
0b47 : 8d f2 9f STA $9ff2 ; (sstack + 3)
0b4a : a5 57 __ LDA T3 + 0 
0b4c : 8d f3 9f STA $9ff3 ; (sstack + 4)
0b4f : a5 58 __ LDA T3 + 1 
0b51 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0b54 : a9 00 __ LDA #$00
0b56 : 8d f6 9f STA $9ff6 ; (sstack + 7)
0b59 : 8d f7 9f STA $9ff7 ; (sstack + 8)
0b5c : 8d f8 9f STA $9ff8 ; (sstack + 9)
0b5f : 8d fa 9f STA $9ffa ; (sstack + 11)
0b62 : 8d fc 9f STA $9ffc ; (sstack + 13)
0b65 : a9 c7 __ LDA #$c7
0b67 : 8d f5 9f STA $9ff5 ; (sstack + 6)
0b6a : a5 54 __ LDA T1 + 0 
0b6c : 8d f9 9f STA $9ff9 ; (sstack + 10)
0b6f : a5 5b __ LDA T7 + 0 
0b71 : 8d fb 9f STA $9ffb ; (sstack + 12)
0b74 : 20 eb 0b JSR $0beb ; (bm_line.s1 + 0)
0b77 : a9 cd __ LDA #$cd
0b79 : 8d ef 9f STA $9fef ; (sstack + 0)
0b7c : a9 16 __ LDA #$16
0b7e : 8d f0 9f STA $9ff0 ; (sstack + 1)
0b81 : a5 59 __ LDA T5 + 0 
0b83 : 8d f1 9f STA $9ff1 ; (sstack + 2)
0b86 : a5 5a __ LDA T5 + 1 
0b88 : 8d f2 9f STA $9ff2 ; (sstack + 3)
0b8b : a9 00 __ LDA #$00
0b8d : 8d f3 9f STA $9ff3 ; (sstack + 4)
0b90 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0b93 : 8d f6 9f STA $9ff6 ; (sstack + 7)
0b96 : 8d f9 9f STA $9ff9 ; (sstack + 10)
0b99 : 8d fa 9f STA $9ffa ; (sstack + 11)
0b9c : 8d fc 9f STA $9ffc ; (sstack + 13)
0b9f : a5 54 __ LDA T1 + 0 
0ba1 : 8d f5 9f STA $9ff5 ; (sstack + 6)
0ba4 : 38 __ __ SEC
0ba5 : e9 05 __ SBC #$05
0ba7 : 85 54 __ STA T1 + 0 
0ba9 : a5 55 __ LDA T2 + 0 
0bab : 8d f7 9f STA $9ff7 ; (sstack + 8)
0bae : a5 56 __ LDA T2 + 1 
0bb0 : 8d f8 9f STA $9ff8 ; (sstack + 9)
0bb3 : a5 5b __ LDA T7 + 0 
0bb5 : 8d fb 9f STA $9ffb ; (sstack + 12)
0bb8 : 20 eb 0b JSR $0beb ; (bm_line.s1 + 0)
0bbb : 38 __ __ SEC
0bbc : a5 57 __ LDA T3 + 0 
0bbe : e9 08 __ SBC #$08
0bc0 : 85 57 __ STA T3 + 0 
0bc2 : b0 02 __ BCS $0bc6 ; (draw.s8 + 0)
.s7:
0bc4 : c6 58 __ DEC T3 + 1 
.s8:
0bc6 : 18 __ __ CLC
0bc7 : a5 55 __ LDA T2 + 0 
0bc9 : 69 08 __ ADC #$08
0bcb : 85 55 __ STA T2 + 0 
0bcd : a5 56 __ LDA T2 + 1 
0bcf : 69 00 __ ADC #$00
0bd1 : 85 56 __ STA T2 + 1 
0bd3 : c9 01 __ CMP #$01
0bd5 : f0 03 __ BEQ $0bda ; (draw.s6 + 0)
0bd7 : 4c a9 0a JMP $0aa9 ; (draw.l5 + 0)
.s6:
0bda : a5 55 __ LDA T2 + 0 
0bdc : c9 40 __ CMP #$40
0bde : d0 f7 __ BNE $0bd7 ; (draw.s8 + 17)
.s3:
0be0 : a2 08 __ LDX #$08
0be2 : bd d4 9f LDA $9fd4,x ; (draw@stack + 0)
0be5 : 95 53 __ STA T0 + 0,x 
0be7 : ca __ __ DEX
0be8 : 10 f8 __ BPL $0be2 ; (draw.s3 + 2)
0bea : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
0beb : a2 0d __ LDX #$0d
0bed : b5 53 __ LDA T2 + 0,x 
0bef : 9d e1 9f STA $9fe1,x ; (bm_line@stack + 0)
0bf2 : ca __ __ DEX
0bf3 : 10 f8 __ BPL $0bed ; (bm_line.s1 + 2)
.s4:
0bf5 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0bf8 : 85 55 __ STA T3 + 0 
0bfa : ad f6 9f LDA $9ff6 ; (sstack + 7)
0bfd : 85 56 __ STA T3 + 1 
0bff : ad f9 9f LDA $9ff9 ; (sstack + 10)
0c02 : 85 53 __ STA T2 + 0 
0c04 : 38 __ __ SEC
0c05 : e5 55 __ SBC T3 + 0 
0c07 : 85 57 __ STA T4 + 0 
0c09 : ad fa 9f LDA $9ffa ; (sstack + 11)
0c0c : 85 54 __ STA T2 + 1 
0c0e : e5 56 __ SBC T3 + 1 
0c10 : 85 58 __ STA T4 + 1 
0c12 : ad f1 9f LDA $9ff1 ; (sstack + 2)
0c15 : 85 59 __ STA T5 + 0 
0c17 : ad f2 9f LDA $9ff2 ; (sstack + 3)
0c1a : 85 5a __ STA T5 + 1 
0c1c : a0 00 __ LDY #$00
0c1e : b1 59 __ LDA (T5 + 0),y 
0c20 : 85 43 __ STA T0 + 0 
0c22 : c8 __ __ INY
0c23 : b1 59 __ LDA (T5 + 0),y 
0c25 : 85 44 __ STA T0 + 1 
0c27 : a0 04 __ LDY #$04
0c29 : b1 59 __ LDA (T5 + 0),y 
0c2b : 85 45 __ STA T1 + 0 
0c2d : ad f3 9f LDA $9ff3 ; (sstack + 4)
0c30 : 85 5d __ STA T7 + 0 
0c32 : ad f4 9f LDA $9ff4 ; (sstack + 5)
0c35 : 85 5e __ STA T7 + 1 
0c37 : ad f7 9f LDA $9ff7 ; (sstack + 8)
0c3a : 85 5b __ STA T6 + 0 
0c3c : 38 __ __ SEC
0c3d : e5 5d __ SBC T7 + 0 
0c3f : 85 5f __ STA T8 + 0 
0c41 : ad f8 9f LDA $9ff8 ; (sstack + 9)
0c44 : 85 5c __ STA T6 + 1 
0c46 : c8 __ __ INY
0c47 : e5 5e __ SBC T7 + 1 
0c49 : 85 60 __ STA T8 + 1 
0c4b : 30 07 __ BMI $0c54 ; (bm_line.s5 + 0)
.s82:
0c4d : 05 5f __ ORA T8 + 0 
0c4f : f0 03 __ BEQ $0c54 ; (bm_line.s5 + 0)
0c51 : 4c 84 0f JMP $0f84 ; (bm_line.s64 + 0)
.s5:
0c54 : a5 5e __ LDA T7 + 1 
0c56 : 10 03 __ BPL $0c5b ; (bm_line.s63 + 0)
0c58 : 4c d0 0d JMP $0dd0 ; (bm_line.s3 + 0)
.s63:
0c5b : c5 44 __ CMP T0 + 1 
0c5d : d0 04 __ BNE $0c63 ; (bm_line.s62 + 0)
.s61:
0c5f : a5 5d __ LDA T7 + 0 
0c61 : c5 43 __ CMP T0 + 0 
.s62:
0c63 : 90 f3 __ BCC $0c58 ; (bm_line.s5 + 4)
.s6:
0c65 : a5 5c __ LDA T6 + 1 
0c67 : 10 03 __ BPL $0c6c ; (bm_line.s60 + 0)
0c69 : 4c 2d 0f JMP $0f2d ; (bm_line.s52 + 0)
.s60:
0c6c : d1 59 __ CMP (T5 + 0),y 
0c6e : d0 04 __ BNE $0c74 ; (bm_line.s59 + 0)
.s58:
0c70 : a5 5b __ LDA T6 + 0 
0c72 : c5 45 __ CMP T1 + 0 
.s59:
0c74 : b0 e2 __ BCS $0c58 ; (bm_line.s5 + 4)
.s7:
0c76 : a5 5c __ LDA T6 + 1 
0c78 : c5 44 __ CMP T0 + 1 
0c7a : d0 04 __ BNE $0c80 ; (bm_line.s57 + 0)
.s56:
0c7c : a5 5b __ LDA T6 + 0 
0c7e : c5 43 __ CMP T0 + 0 
.s57:
0c80 : 90 e7 __ BCC $0c69 ; (bm_line.s6 + 4)
.s8:
0c82 : a5 5e __ LDA T7 + 1 
0c84 : d1 59 __ CMP (T5 + 0),y 
0c86 : d0 04 __ BNE $0c8c ; (bm_line.s54 + 0)
.s51:
0c88 : a5 5d __ LDA T7 + 0 
0c8a : c5 45 __ CMP T1 + 0 
.s54:
0c8c : 90 4e __ BCC $0cdc ; (bm_line.s9 + 0)
.s50:
0c8e : a5 57 __ LDA T4 + 0 
0c90 : 85 0f __ STA P2 
0c92 : a5 58 __ LDA T4 + 1 
0c94 : 85 10 __ STA P3 
0c96 : a5 5f __ LDA T8 + 0 
0c98 : 85 11 __ STA P4 
0c9a : a5 60 __ LDA T8 + 1 
0c9c : 85 12 __ STA P5 
0c9e : 18 __ __ CLC
0c9f : a5 5d __ LDA T7 + 0 
0ca1 : 69 01 __ ADC #$01
0ca3 : a8 __ __ TAY
0ca4 : a5 5e __ LDA T7 + 1 
0ca6 : 69 00 __ ADC #$00
0ca8 : aa __ __ TAX
0ca9 : 98 __ __ TYA
0caa : 38 __ __ SEC
0cab : a0 04 __ LDY #$04
0cad : f1 59 __ SBC (T5 + 0),y 
0caf : 85 0d __ STA P0 
0cb1 : 8a __ __ TXA
0cb2 : c8 __ __ INY
0cb3 : f1 59 __ SBC (T5 + 0),y 
0cb5 : 85 0e __ STA P1 
0cb7 : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
0cba : 38 __ __ SEC
0cbb : a5 55 __ LDA T3 + 0 
0cbd : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0cbf : 8d f5 9f STA $9ff5 ; (sstack + 6)
0cc2 : a5 56 __ LDA T3 + 1 
0cc4 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0cc6 : 8d f6 9f STA $9ff6 ; (sstack + 7)
0cc9 : a0 04 __ LDY #$04
0ccb : b1 59 __ LDA (T5 + 0),y 
0ccd : 38 __ __ SEC
0cce : e9 01 __ SBC #$01
0cd0 : aa __ __ TAX
0cd1 : c8 __ __ INY
0cd2 : b1 59 __ LDA (T5 + 0),y 
0cd4 : 8e f3 9f STX $9ff3 ; (sstack + 4)
0cd7 : e9 00 __ SBC #$00
0cd9 : 8d f4 9f STA $9ff4 ; (sstack + 5)
.s9:
0cdc : a0 02 __ LDY #$02
0cde : b1 59 __ LDA (T5 + 0),y 
0ce0 : 85 43 __ STA T0 + 0 
0ce2 : c8 __ __ INY
0ce3 : b1 59 __ LDA (T5 + 0),y 
0ce5 : 85 44 __ STA T0 + 1 
0ce7 : a0 06 __ LDY #$06
0ce9 : b1 59 __ LDA (T5 + 0),y 
0ceb : 85 45 __ STA T1 + 0 
0ced : c8 __ __ INY
0cee : a5 58 __ LDA T4 + 1 
0cf0 : 30 07 __ BMI $0cf9 ; (bm_line.s10 + 0)
.s49:
0cf2 : 05 57 __ ORA T4 + 0 
0cf4 : f0 03 __ BEQ $0cf9 ; (bm_line.s10 + 0)
0cf6 : 4c 35 0e JMP $0e35 ; (bm_line.s30 + 0)
.s10:
0cf9 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0cfc : 85 55 __ STA T3 + 0 
0cfe : ad f6 9f LDA $9ff6 ; (sstack + 7)
0d01 : 10 03 __ BPL $0d06 ; (bm_line.s29 + 0)
0d03 : 4c d0 0d JMP $0dd0 ; (bm_line.s3 + 0)
.s29:
0d06 : 85 56 __ STA T3 + 1 
0d08 : c5 44 __ CMP T0 + 1 
0d0a : d0 04 __ BNE $0d10 ; (bm_line.s28 + 0)
.s27:
0d0c : a5 55 __ LDA T3 + 0 
0d0e : c5 43 __ CMP T0 + 0 
.s28:
0d10 : 90 f1 __ BCC $0d03 ; (bm_line.s10 + 10)
.s11:
0d12 : ad fa 9f LDA $9ffa ; (sstack + 11)
0d15 : 10 03 __ BPL $0d1a ; (bm_line.s26 + 0)
0d17 : 4c db 0d JMP $0ddb ; (bm_line.s17 + 0)
.s26:
0d1a : d1 59 __ CMP (T5 + 0),y 
0d1c : d0 05 __ BNE $0d23 ; (bm_line.s25 + 0)
.s24:
0d1e : ad f9 9f LDA $9ff9 ; (sstack + 10)
0d21 : c5 45 __ CMP T1 + 0 
.s25:
0d23 : b0 de __ BCS $0d03 ; (bm_line.s10 + 10)
.s12:
0d25 : ad fa 9f LDA $9ffa ; (sstack + 11)
0d28 : 30 ed __ BMI $0d17 ; (bm_line.s11 + 5)
.s23:
0d2a : c5 44 __ CMP T0 + 1 
0d2c : d0 05 __ BNE $0d33 ; (bm_line.s22 + 0)
.s21:
0d2e : ad f9 9f LDA $9ff9 ; (sstack + 10)
0d31 : c5 43 __ CMP T0 + 0 
.s22:
0d33 : 90 e2 __ BCC $0d17 ; (bm_line.s11 + 5)
.s13:
0d35 : a5 56 __ LDA T3 + 1 
0d37 : d1 59 __ CMP (T5 + 0),y 
0d39 : d0 04 __ BNE $0d3f ; (bm_line.s19 + 0)
.s16:
0d3b : a5 55 __ LDA T3 + 0 
0d3d : c5 45 __ CMP T1 + 0 
.s19:
0d3f : 90 50 __ BCC $0d91 ; (bm_line.s14 + 0)
.s15:
0d41 : a5 5f __ LDA T8 + 0 
0d43 : 85 0f __ STA P2 
0d45 : a5 60 __ LDA T8 + 1 
0d47 : 85 10 __ STA P3 
0d49 : a5 57 __ LDA T4 + 0 
0d4b : 85 11 __ STA P4 
0d4d : a5 58 __ LDA T4 + 1 
0d4f : 85 12 __ STA P5 
0d51 : 18 __ __ CLC
0d52 : a5 55 __ LDA T3 + 0 
0d54 : 69 01 __ ADC #$01
0d56 : a8 __ __ TAY
0d57 : a5 56 __ LDA T3 + 1 
0d59 : 69 00 __ ADC #$00
0d5b : aa __ __ TAX
0d5c : 98 __ __ TYA
0d5d : 38 __ __ SEC
0d5e : a0 06 __ LDY #$06
0d60 : f1 59 __ SBC (T5 + 0),y 
0d62 : 85 0d __ STA P0 
0d64 : 8a __ __ TXA
0d65 : c8 __ __ INY
0d66 : f1 59 __ SBC (T5 + 0),y 
0d68 : 85 0e __ STA P1 
0d6a : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
0d6d : ad f3 9f LDA $9ff3 ; (sstack + 4)
0d70 : 38 __ __ SEC
0d71 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0d73 : 8d f3 9f STA $9ff3 ; (sstack + 4)
0d76 : ad f4 9f LDA $9ff4 ; (sstack + 5)
0d79 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0d7b : 8d f4 9f STA $9ff4 ; (sstack + 5)
0d7e : a0 06 __ LDY #$06
0d80 : b1 59 __ LDA (T5 + 0),y 
0d82 : 38 __ __ SEC
0d83 : e9 01 __ SBC #$01
0d85 : aa __ __ TAX
0d86 : c8 __ __ INY
0d87 : b1 59 __ LDA (T5 + 0),y 
0d89 : 8e f5 9f STX $9ff5 ; (sstack + 6)
0d8c : e9 00 __ SBC #$00
0d8e : 8d f6 9f STA $9ff6 ; (sstack + 7)
.s14:
0d91 : ad ef 9f LDA $9fef ; (sstack + 0)
0d94 : 85 0d __ STA P0 
0d96 : ad f0 9f LDA $9ff0 ; (sstack + 1)
0d99 : 85 0e __ STA P1 
0d9b : ad f3 9f LDA $9ff3 ; (sstack + 4)
0d9e : 85 0f __ STA P2 
0da0 : ad f4 9f LDA $9ff4 ; (sstack + 5)
0da3 : 85 10 __ STA P3 
0da5 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0da8 : 85 11 __ STA P4 
0daa : ad f6 9f LDA $9ff6 ; (sstack + 7)
0dad : 85 12 __ STA P5 
0daf : ad f7 9f LDA $9ff7 ; (sstack + 8)
0db2 : 85 13 __ STA P6 
0db4 : ad f8 9f LDA $9ff8 ; (sstack + 9)
0db7 : 85 14 __ STA P7 
0db9 : ad f9 9f LDA $9ff9 ; (sstack + 10)
0dbc : 85 15 __ STA P8 
0dbe : ad fa 9f LDA $9ffa ; (sstack + 11)
0dc1 : 85 16 __ STA P9 
0dc3 : ad fb 9f LDA $9ffb ; (sstack + 12)
0dc6 : 85 17 __ STA P10 
0dc8 : ad fc 9f LDA $9ffc ; (sstack + 13)
0dcb : 85 18 __ STA P11 
0dcd : 20 25 11 JSR $1125 ; (bmu_line.s4 + 0)
.s3:
0dd0 : a2 0d __ LDX #$0d
0dd2 : bd e1 9f LDA $9fe1,x ; (bm_line@stack + 0)
0dd5 : 95 53 __ STA T2 + 0,x 
0dd7 : ca __ __ DEX
0dd8 : 10 f8 __ BPL $0dd2 ; (bm_line.s3 + 2)
0dda : 60 __ __ RTS
.s17:
0ddb : a5 5f __ LDA T8 + 0 
0ddd : 85 0f __ STA P2 
0ddf : a5 60 __ LDA T8 + 1 
0de1 : 85 10 __ STA P3 
0de3 : a5 57 __ LDA T4 + 0 
0de5 : 85 11 __ STA P4 
0de7 : a5 58 __ LDA T4 + 1 
0de9 : 85 12 __ STA P5 
0deb : 38 __ __ SEC
0dec : a5 43 __ LDA T0 + 0 
0dee : ed f9 9f SBC $9ff9 ; (sstack + 10)
0df1 : 85 0d __ STA P0 
0df3 : a5 44 __ LDA T0 + 1 
0df5 : ed fa 9f SBC $9ffa ; (sstack + 11)
0df8 : 85 0e __ STA P1 
0dfa : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
0dfd : a0 02 __ LDY #$02
0dff : b1 59 __ LDA (T5 + 0),y 
0e01 : 8d f9 9f STA $9ff9 ; (sstack + 10)
0e04 : c8 __ __ INY
0e05 : b1 59 __ LDA (T5 + 0),y 
0e07 : 8d fa 9f STA $9ffa ; (sstack + 11)
0e0a : ad f7 9f LDA $9ff7 ; (sstack + 8)
0e0d : 18 __ __ CLC
0e0e : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0e10 : 8d f7 9f STA $9ff7 ; (sstack + 8)
0e13 : ad f8 9f LDA $9ff8 ; (sstack + 9)
0e16 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0e18 : 8d f8 9f STA $9ff8 ; (sstack + 9)
0e1b : a0 07 __ LDY #$07
0e1d : b1 59 __ LDA (T5 + 0),y 
0e1f : 10 03 __ BPL $0e24 ; (bm_line.s20 + 0)
0e21 : 4c 41 0d JMP $0d41 ; (bm_line.s15 + 0)
.s20:
0e24 : a5 56 __ LDA T3 + 1 
0e26 : d1 59 __ CMP (T5 + 0),y 
0e28 : f0 03 __ BEQ $0e2d ; (bm_line.s18 + 0)
0e2a : 4c 3f 0d JMP $0d3f ; (bm_line.s19 + 0)
.s18:
0e2d : a5 55 __ LDA T3 + 0 
0e2f : 88 __ __ DEY
0e30 : d1 59 __ CMP (T5 + 0),y 
0e32 : 4c 3f 0d JMP $0d3f ; (bm_line.s19 + 0)
.s30:
0e35 : ad f9 9f LDA $9ff9 ; (sstack + 10)
0e38 : 85 55 __ STA T3 + 0 
0e3a : ad fa 9f LDA $9ffa ; (sstack + 11)
0e3d : 30 91 __ BMI $0dd0 ; (bm_line.s3 + 0)
.s48:
0e3f : 85 56 __ STA T3 + 1 
0e41 : c5 44 __ CMP T0 + 1 
0e43 : d0 04 __ BNE $0e49 ; (bm_line.s47 + 0)
.s46:
0e45 : a5 55 __ LDA T3 + 0 
0e47 : c5 43 __ CMP T0 + 0 
.s47:
0e49 : 90 85 __ BCC $0dd0 ; (bm_line.s3 + 0)
.s31:
0e4b : ad f6 9f LDA $9ff6 ; (sstack + 7)
0e4e : 10 03 __ BPL $0e53 ; (bm_line.s45 + 0)
0e50 : 4c d3 0e JMP $0ed3 ; (bm_line.s36 + 0)
.s45:
0e53 : d1 59 __ CMP (T5 + 0),y 
0e55 : d0 05 __ BNE $0e5c ; (bm_line.s44 + 0)
.s43:
0e57 : ad f5 9f LDA $9ff5 ; (sstack + 6)
0e5a : c5 45 __ CMP T1 + 0 
.s44:
0e5c : 90 03 __ BCC $0e61 ; (bm_line.s32 + 0)
0e5e : 4c d0 0d JMP $0dd0 ; (bm_line.s3 + 0)
.s32:
0e61 : ad f6 9f LDA $9ff6 ; (sstack + 7)
0e64 : 30 6d __ BMI $0ed3 ; (bm_line.s36 + 0)
.s42:
0e66 : c5 44 __ CMP T0 + 1 
0e68 : d0 05 __ BNE $0e6f ; (bm_line.s41 + 0)
.s40:
0e6a : ad f5 9f LDA $9ff5 ; (sstack + 6)
0e6d : c5 43 __ CMP T0 + 0 
.s41:
0e6f : 90 62 __ BCC $0ed3 ; (bm_line.s36 + 0)
.s33:
0e71 : a5 56 __ LDA T3 + 1 
0e73 : d1 59 __ CMP (T5 + 0),y 
0e75 : d0 04 __ BNE $0e7b ; (bm_line.s38 + 0)
.s35:
0e77 : a5 55 __ LDA T3 + 0 
0e79 : c5 45 __ CMP T1 + 0 
.s38:
0e7b : b0 03 __ BCS $0e80 ; (bm_line.s34 + 0)
0e7d : 4c 91 0d JMP $0d91 ; (bm_line.s14 + 0)
.s34:
0e80 : a5 5f __ LDA T8 + 0 
0e82 : 85 0f __ STA P2 
0e84 : a5 60 __ LDA T8 + 1 
0e86 : 85 10 __ STA P3 
0e88 : a5 57 __ LDA T4 + 0 
0e8a : 85 11 __ STA P4 
0e8c : a5 58 __ LDA T4 + 1 
0e8e : 85 12 __ STA P5 
0e90 : 18 __ __ CLC
0e91 : a5 55 __ LDA T3 + 0 
0e93 : 69 01 __ ADC #$01
0e95 : a8 __ __ TAY
0e96 : a5 56 __ LDA T3 + 1 
0e98 : 69 00 __ ADC #$00
0e9a : aa __ __ TAX
0e9b : 98 __ __ TYA
0e9c : 38 __ __ SEC
0e9d : a0 06 __ LDY #$06
0e9f : f1 59 __ SBC (T5 + 0),y 
0ea1 : 85 0d __ STA P0 
0ea3 : 8a __ __ TXA
0ea4 : c8 __ __ INY
0ea5 : f1 59 __ SBC (T5 + 0),y 
0ea7 : 85 0e __ STA P1 
0ea9 : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
0eac : ad f7 9f LDA $9ff7 ; (sstack + 8)
0eaf : 38 __ __ SEC
0eb0 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0eb2 : 8d f7 9f STA $9ff7 ; (sstack + 8)
0eb5 : ad f8 9f LDA $9ff8 ; (sstack + 9)
0eb8 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0eba : 8d f8 9f STA $9ff8 ; (sstack + 9)
0ebd : a0 06 __ LDY #$06
0ebf : b1 59 __ LDA (T5 + 0),y 
0ec1 : 38 __ __ SEC
0ec2 : e9 01 __ SBC #$01
0ec4 : aa __ __ TAX
0ec5 : c8 __ __ INY
0ec6 : b1 59 __ LDA (T5 + 0),y 
0ec8 : 8e f9 9f STX $9ff9 ; (sstack + 10)
0ecb : e9 00 __ SBC #$00
0ecd : 8d fa 9f STA $9ffa ; (sstack + 11)
0ed0 : 4c 91 0d JMP $0d91 ; (bm_line.s14 + 0)
.s36:
0ed3 : a5 5f __ LDA T8 + 0 
0ed5 : 85 0f __ STA P2 
0ed7 : a5 60 __ LDA T8 + 1 
0ed9 : 85 10 __ STA P3 
0edb : a5 57 __ LDA T4 + 0 
0edd : 85 11 __ STA P4 
0edf : a5 58 __ LDA T4 + 1 
0ee1 : 85 12 __ STA P5 
0ee3 : 38 __ __ SEC
0ee4 : a5 43 __ LDA T0 + 0 
0ee6 : ed f5 9f SBC $9ff5 ; (sstack + 6)
0ee9 : 85 0d __ STA P0 
0eeb : a5 44 __ LDA T0 + 1 
0eed : ed f6 9f SBC $9ff6 ; (sstack + 7)
0ef0 : 85 0e __ STA P1 
0ef2 : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
0ef5 : a0 02 __ LDY #$02
0ef7 : b1 59 __ LDA (T5 + 0),y 
0ef9 : 8d f5 9f STA $9ff5 ; (sstack + 6)
0efc : c8 __ __ INY
0efd : b1 59 __ LDA (T5 + 0),y 
0eff : 8d f6 9f STA $9ff6 ; (sstack + 7)
0f02 : ad f3 9f LDA $9ff3 ; (sstack + 4)
0f05 : 18 __ __ CLC
0f06 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0f08 : 8d f3 9f STA $9ff3 ; (sstack + 4)
0f0b : ad f4 9f LDA $9ff4 ; (sstack + 5)
0f0e : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0f10 : 8d f4 9f STA $9ff4 ; (sstack + 5)
0f13 : a0 07 __ LDY #$07
0f15 : b1 59 __ LDA (T5 + 0),y 
0f17 : 10 03 __ BPL $0f1c ; (bm_line.s39 + 0)
0f19 : 4c 80 0e JMP $0e80 ; (bm_line.s34 + 0)
.s39:
0f1c : a5 56 __ LDA T3 + 1 
0f1e : d1 59 __ CMP (T5 + 0),y 
0f20 : f0 03 __ BEQ $0f25 ; (bm_line.s37 + 0)
0f22 : 4c 7b 0e JMP $0e7b ; (bm_line.s38 + 0)
.s37:
0f25 : a5 55 __ LDA T3 + 0 
0f27 : 88 __ __ DEY
0f28 : d1 59 __ CMP (T5 + 0),y 
0f2a : 4c 7b 0e JMP $0e7b ; (bm_line.s38 + 0)
.s52:
0f2d : a5 57 __ LDA T4 + 0 
0f2f : 85 0f __ STA P2 
0f31 : a5 58 __ LDA T4 + 1 
0f33 : 85 10 __ STA P3 
0f35 : a5 5f __ LDA T8 + 0 
0f37 : 85 11 __ STA P4 
0f39 : a5 60 __ LDA T8 + 1 
0f3b : 85 12 __ STA P5 
0f3d : 38 __ __ SEC
0f3e : a5 43 __ LDA T0 + 0 
0f40 : e5 5b __ SBC T6 + 0 
0f42 : 85 0d __ STA P0 
0f44 : a5 44 __ LDA T0 + 1 
0f46 : e5 5c __ SBC T6 + 1 
0f48 : 85 0e __ STA P1 
0f4a : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
0f4d : 18 __ __ CLC
0f4e : a5 1b __ LDA ACCU + 0 ; (clip + 0)
0f50 : 65 53 __ ADC T2 + 0 
0f52 : aa __ __ TAX
0f53 : a0 00 __ LDY #$00
0f55 : b1 59 __ LDA (T5 + 0),y 
0f57 : 8d f7 9f STA $9ff7 ; (sstack + 8)
0f5a : c8 __ __ INY
0f5b : b1 59 __ LDA (T5 + 0),y 
0f5d : 8e f9 9f STX $9ff9 ; (sstack + 10)
0f60 : 8d f8 9f STA $9ff8 ; (sstack + 9)
0f63 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
0f65 : 65 54 __ ADC T2 + 1 
0f67 : 8d fa 9f STA $9ffa ; (sstack + 11)
0f6a : a0 05 __ LDY #$05
0f6c : b1 59 __ LDA (T5 + 0),y 
0f6e : 10 03 __ BPL $0f73 ; (bm_line.s55 + 0)
0f70 : 4c 8e 0c JMP $0c8e ; (bm_line.s50 + 0)
.s55:
0f73 : a5 5e __ LDA T7 + 1 
0f75 : d1 59 __ CMP (T5 + 0),y 
0f77 : f0 03 __ BEQ $0f7c ; (bm_line.s53 + 0)
0f79 : 4c 8c 0c JMP $0c8c ; (bm_line.s54 + 0)
.s53:
0f7c : a5 5d __ LDA T7 + 0 
0f7e : 88 __ __ DEY
0f7f : d1 59 __ CMP (T5 + 0),y 
0f81 : 4c 8c 0c JMP $0c8c ; (bm_line.s54 + 0)
.s64:
0f84 : a5 5c __ LDA T6 + 1 
0f86 : 10 03 __ BPL $0f8b ; (bm_line.s81 + 0)
0f88 : 4c d0 0d JMP $0dd0 ; (bm_line.s3 + 0)
.s81:
0f8b : c5 44 __ CMP T0 + 1 
0f8d : d0 04 __ BNE $0f93 ; (bm_line.s80 + 0)
.s79:
0f8f : a5 5b __ LDA T6 + 0 
0f91 : c5 43 __ CMP T0 + 0 
.s80:
0f93 : 90 f3 __ BCC $0f88 ; (bm_line.s64 + 4)
.s65:
0f95 : a5 5e __ LDA T7 + 1 
0f97 : 30 76 __ BMI $100f ; (bm_line.s70 + 0)
.s78:
0f99 : d1 59 __ CMP (T5 + 0),y 
0f9b : d0 04 __ BNE $0fa1 ; (bm_line.s77 + 0)
.s76:
0f9d : a5 5d __ LDA T7 + 0 
0f9f : c5 45 __ CMP T1 + 0 
.s77:
0fa1 : b0 e5 __ BCS $0f88 ; (bm_line.s64 + 4)
.s66:
0fa3 : a5 5e __ LDA T7 + 1 
0fa5 : c5 44 __ CMP T0 + 1 
0fa7 : d0 04 __ BNE $0fad ; (bm_line.s75 + 0)
.s74:
0fa9 : a5 5d __ LDA T7 + 0 
0fab : c5 43 __ CMP T0 + 0 
.s75:
0fad : 90 60 __ BCC $100f ; (bm_line.s70 + 0)
.s67:
0faf : a5 5c __ LDA T6 + 1 
0fb1 : d1 59 __ CMP (T5 + 0),y 
0fb3 : d0 04 __ BNE $0fb9 ; (bm_line.s72 + 0)
.s69:
0fb5 : a5 5b __ LDA T6 + 0 
0fb7 : c5 45 __ CMP T1 + 0 
.s72:
0fb9 : b0 03 __ BCS $0fbe ; (bm_line.s68 + 0)
0fbb : 4c dc 0c JMP $0cdc ; (bm_line.s9 + 0)
.s68:
0fbe : a5 57 __ LDA T4 + 0 
0fc0 : 85 0f __ STA P2 
0fc2 : a5 58 __ LDA T4 + 1 
0fc4 : 85 10 __ STA P3 
0fc6 : a5 5f __ LDA T8 + 0 
0fc8 : 85 11 __ STA P4 
0fca : a5 60 __ LDA T8 + 1 
0fcc : 85 12 __ STA P5 
0fce : 18 __ __ CLC
0fcf : a5 5b __ LDA T6 + 0 
0fd1 : 69 01 __ ADC #$01
0fd3 : a8 __ __ TAY
0fd4 : a5 5c __ LDA T6 + 1 
0fd6 : 69 00 __ ADC #$00
0fd8 : aa __ __ TAX
0fd9 : 98 __ __ TYA
0fda : 38 __ __ SEC
0fdb : a0 04 __ LDY #$04
0fdd : f1 59 __ SBC (T5 + 0),y 
0fdf : 85 0d __ STA P0 
0fe1 : 8a __ __ TXA
0fe2 : c8 __ __ INY
0fe3 : f1 59 __ SBC (T5 + 0),y 
0fe5 : 85 0e __ STA P1 
0fe7 : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
0fea : 38 __ __ SEC
0feb : a5 53 __ LDA T2 + 0 
0fed : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0fef : 8d f9 9f STA $9ff9 ; (sstack + 10)
0ff2 : a5 54 __ LDA T2 + 1 
0ff4 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0ff6 : 8d fa 9f STA $9ffa ; (sstack + 11)
0ff9 : a0 04 __ LDY #$04
0ffb : b1 59 __ LDA (T5 + 0),y 
0ffd : 38 __ __ SEC
0ffe : e9 01 __ SBC #$01
1000 : aa __ __ TAX
1001 : c8 __ __ INY
1002 : b1 59 __ LDA (T5 + 0),y 
1004 : 8e f7 9f STX $9ff7 ; (sstack + 8)
1007 : e9 00 __ SBC #$00
1009 : 8d f8 9f STA $9ff8 ; (sstack + 9)
100c : 4c dc 0c JMP $0cdc ; (bm_line.s9 + 0)
.s70:
100f : a5 57 __ LDA T4 + 0 
1011 : 85 0f __ STA P2 
1013 : a5 58 __ LDA T4 + 1 
1015 : 85 10 __ STA P3 
1017 : a5 5f __ LDA T8 + 0 
1019 : 85 11 __ STA P4 
101b : a5 60 __ LDA T8 + 1 
101d : 85 12 __ STA P5 
101f : 38 __ __ SEC
1020 : a5 43 __ LDA T0 + 0 
1022 : e5 5d __ SBC T7 + 0 
1024 : 85 0d __ STA P0 
1026 : a5 44 __ LDA T0 + 1 
1028 : e5 5e __ SBC T7 + 1 
102a : 85 0e __ STA P1 
102c : 20 66 10 JSR $1066 ; (lmuldiv16s.s4 + 0)
102f : 18 __ __ CLC
1030 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
1032 : 65 55 __ ADC T3 + 0 
1034 : aa __ __ TAX
1035 : a0 00 __ LDY #$00
1037 : b1 59 __ LDA (T5 + 0),y 
1039 : 8d f3 9f STA $9ff3 ; (sstack + 4)
103c : c8 __ __ INY
103d : b1 59 __ LDA (T5 + 0),y 
103f : 8e f5 9f STX $9ff5 ; (sstack + 6)
1042 : 8d f4 9f STA $9ff4 ; (sstack + 5)
1045 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
1047 : 65 56 __ ADC T3 + 1 
1049 : 8d f6 9f STA $9ff6 ; (sstack + 7)
104c : a0 05 __ LDY #$05
104e : b1 59 __ LDA (T5 + 0),y 
1050 : 10 03 __ BPL $1055 ; (bm_line.s73 + 0)
1052 : 4c be 0f JMP $0fbe ; (bm_line.s68 + 0)
.s73:
1055 : a5 5c __ LDA T6 + 1 
1057 : d1 59 __ CMP (T5 + 0),y 
1059 : f0 03 __ BEQ $105e ; (bm_line.s71 + 0)
105b : 4c b9 0f JMP $0fb9 ; (bm_line.s72 + 0)
.s71:
105e : a5 5b __ LDA T6 + 0 
1060 : 88 __ __ DEY
1061 : d1 59 __ CMP (T5 + 0),y 
1063 : 4c b9 0f JMP $0fb9 ; (bm_line.s72 + 0)
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
1066 : a9 00 __ LDA #$00
1068 : 24 0e __ BIT P1 ; (a + 1)
106a : 10 0d __ BPL $1079 ; (lmuldiv16s.s5 + 0)
.s10:
106c : 38 __ __ SEC
106d : e5 0d __ SBC P0 ; (a + 0)
106f : 85 0d __ STA P0 ; (a + 0)
1071 : a9 00 __ LDA #$00
1073 : e5 0e __ SBC P1 ; (a + 1)
1075 : 85 0e __ STA P1 ; (a + 1)
1077 : a9 01 __ LDA #$01
.s5:
1079 : 85 43 __ STA T1 + 0 
107b : 24 10 __ BIT P3 ; (b + 1)
107d : 10 14 __ BPL $1093 ; (lmuldiv16s.s6 + 0)
.s9:
107f : 38 __ __ SEC
1080 : a9 00 __ LDA #$00
1082 : e5 0f __ SBC P2 ; (b + 0)
1084 : 85 0f __ STA P2 ; (b + 0)
1086 : a9 00 __ LDA #$00
1088 : e5 10 __ SBC P3 ; (b + 1)
108a : 85 10 __ STA P3 ; (b + 1)
108c : a9 00 __ LDA #$00
108e : c5 43 __ CMP T1 + 0 
1090 : 2a __ __ ROL
1091 : 85 43 __ STA T1 + 0 
.s6:
1093 : 24 12 __ BIT P5 ; (c + 1)
1095 : 10 14 __ BPL $10ab ; (lmuldiv16s.s7 + 0)
.s8:
1097 : 38 __ __ SEC
1098 : a9 00 __ LDA #$00
109a : e5 11 __ SBC P4 ; (c + 0)
109c : 85 11 __ STA P4 ; (c + 0)
109e : a9 00 __ LDA #$00
10a0 : e5 12 __ SBC P5 ; (c + 1)
10a2 : 85 12 __ STA P5 ; (c + 1)
10a4 : a9 00 __ LDA #$00
10a6 : c5 43 __ CMP T1 + 0 
10a8 : 2a __ __ ROL
10a9 : 85 43 __ STA T1 + 0 
.s7:
10ab : a9 00 __ LDA #$00
10ad : 85 05 __ STA WORK + 2 
10af : 85 06 __ STA WORK + 3 
10b1 : a5 0d __ LDA P0 ; (a + 0)
10b3 : 38 __ __ SEC
10b4 : a0 08 __ LDY #$08
10b6 : 6a __ __ ROR
10b7 : 90 0f __ BCC $10c8 ; (lmuldiv16s.s7 + 29)
10b9 : aa __ __ TAX
10ba : 18 __ __ CLC
10bb : a5 05 __ LDA WORK + 2 
10bd : 65 0f __ ADC P2 ; (b + 0)
10bf : 85 05 __ STA WORK + 2 
10c1 : a5 06 __ LDA WORK + 3 
10c3 : 65 10 __ ADC P3 ; (b + 1)
10c5 : 85 06 __ STA WORK + 3 
10c7 : 8a __ __ TXA
10c8 : 66 06 __ ROR WORK + 3 
10ca : 66 05 __ ROR WORK + 2 
10cc : 88 __ __ DEY
10cd : d0 e7 __ BNE $10b6 ; (lmuldiv16s.s7 + 11)
10cf : 6a __ __ ROR
10d0 : 90 07 __ BCC $10d9 ; (lmuldiv16s.s7 + 46)
10d2 : 85 03 __ STA WORK + 0 
10d4 : a5 0e __ LDA P1 ; (a + 1)
10d6 : 18 __ __ CLC
10d7 : 90 db __ BCC $10b4 ; (lmuldiv16s.s7 + 9)
10d9 : 38 __ __ SEC
10da : 85 04 __ STA WORK + 1 
10dc : a2 08 __ LDX #$08
10de : 26 04 __ ROL WORK + 1 
10e0 : 26 05 __ ROL WORK + 2 
10e2 : 26 06 __ ROL WORK + 3 
10e4 : 90 0c __ BCC $10f2 ; (lmuldiv16s.s7 + 71)
10e6 : a5 05 __ LDA WORK + 2 
10e8 : e5 11 __ SBC P4 ; (c + 0)
10ea : a8 __ __ TAY
10eb : a5 06 __ LDA WORK + 3 
10ed : e5 12 __ SBC P5 ; (c + 1)
10ef : 38 __ __ SEC
10f0 : b0 0c __ BCS $10fe ; (lmuldiv16s.s7 + 83)
10f2 : 38 __ __ SEC
10f3 : a5 05 __ LDA WORK + 2 
10f5 : e5 11 __ SBC P4 ; (c + 0)
10f7 : a8 __ __ TAY
10f8 : a5 06 __ LDA WORK + 3 
10fa : e5 12 __ SBC P5 ; (c + 1)
10fc : 90 04 __ BCC $1102 ; (lmuldiv16s.s7 + 87)
10fe : 85 06 __ STA WORK + 3 
1100 : 84 05 __ STY WORK + 2 
1102 : ca __ __ DEX
1103 : d0 d9 __ BNE $10de ; (lmuldiv16s.s7 + 51)
1105 : a5 04 __ LDA WORK + 1 
1107 : 2a __ __ ROL
1108 : 90 07 __ BCC $1111 ; (lmuldiv16s.s7 + 102)
110a : 85 1c __ STA ACCU + 1 
110c : a5 03 __ LDA WORK + 0 
110e : 18 __ __ CLC
110f : 90 c9 __ BCC $10da ; (lmuldiv16s.s7 + 47)
1111 : 85 1b __ STA ACCU + 0 
1113 : a5 43 __ LDA T1 + 0 
1115 : f0 0d __ BEQ $1124 ; (lmuldiv16s.s3 + 0)
1117 : 38 __ __ SEC
1118 : a9 00 __ LDA #$00
111a : e5 1b __ SBC ACCU + 0 
111c : 85 1b __ STA ACCU + 0 
111e : a9 00 __ LDA #$00
1120 : e5 1c __ SBC ACCU + 1 
1122 : 85 1c __ STA ACCU + 1 
.s3:
1124 : 60 __ __ RTS
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1125 : a5 17 __ LDA P10 ; (pattern + 0)
1127 : f0 03 __ BEQ $112c ; (bmu_line.s5 + 0)
1129 : 4c 2b 16 JMP $162b ; (bmu_line.s59 + 0)
.s5:
112c : a5 18 __ LDA P11 ; (op + 0)
112e : f0 01 __ BEQ $1131 ; (bmu_line.s6 + 0)
1130 : 60 __ __ RTS
.s6:
1131 : c6 17 __ DEC P10 ; (pattern + 0)
1133 : a9 02 __ LDA #$02
.s63:
1135 : 85 18 __ STA P11 ; (op + 0)
.s7:
1137 : 38 __ __ SEC
1138 : a5 13 __ LDA P6 ; (x1 + 0)
113a : e5 0f __ SBC P2 ; (x0 + 0)
113c : 85 46 __ STA T2 + 0 
113e : a5 14 __ LDA P7 ; (x1 + 1)
1140 : e5 10 __ SBC P3 ; (x0 + 1)
1142 : 85 47 __ STA T2 + 1 
1144 : 10 11 __ BPL $1157 ; (bmu_line.s8 + 0)
.s58:
1146 : 38 __ __ SEC
1147 : a9 00 __ LDA #$00
1149 : e5 46 __ SBC T2 + 0 
114b : 85 46 __ STA T2 + 0 
114d : a9 00 __ LDA #$00
114f : e5 47 __ SBC T2 + 1 
1151 : 85 47 __ STA T2 + 1 
1153 : a9 01 __ LDA #$01
1155 : d0 02 __ BNE $1159 ; (bmu_line.s9 + 0)
.s8:
1157 : a9 00 __ LDA #$00
.s9:
1159 : 85 51 __ STA T10 + 0 
115b : 38 __ __ SEC
115c : a5 15 __ LDA P8 ; (y1 + 0)
115e : e5 11 __ SBC P4 ; (y0 + 0)
1160 : 85 43 __ STA T0 + 0 
1162 : a5 16 __ LDA P9 ; (y1 + 1)
1164 : e5 12 __ SBC P5 ; (y0 + 1)
1166 : 85 44 __ STA T0 + 1 
1168 : 10 11 __ BPL $117b ; (bmu_line.s10 + 0)
.s57:
116a : 38 __ __ SEC
116b : a9 00 __ LDA #$00
116d : e5 43 __ SBC T0 + 0 
116f : 85 43 __ STA T0 + 0 
1171 : a9 00 __ LDA #$00
1173 : e5 44 __ SBC T0 + 1 
1175 : 85 44 __ STA T0 + 1 
1177 : a9 01 __ LDA #$01
1179 : d0 02 __ BNE $117d ; (bmu_line.s11 + 0)
.s10:
117b : a9 00 __ LDA #$00
.s11:
117d : 85 52 __ STA T11 + 0 
117f : a5 44 __ LDA T0 + 1 
1181 : c5 47 __ CMP T2 + 1 
1183 : d0 04 __ BNE $1189 ; (bmu_line.s56 + 0)
.s55:
1185 : a5 43 __ LDA T0 + 0 
1187 : c5 46 __ CMP T2 + 0 
.s56:
1189 : b0 06 __ BCS $1191 ; (bmu_line.s12 + 0)
.s54:
118b : a5 47 __ LDA T2 + 1 
118d : a6 46 __ LDX T2 + 0 
118f : 90 04 __ BCC $1195 ; (bmu_line.s13 + 0)
.s12:
1191 : a5 44 __ LDA T0 + 1 
1193 : a6 43 __ LDX T0 + 0 
.s13:
1195 : 86 49 __ STX T4 + 0 
1197 : 85 4a __ STA T4 + 1 
1199 : 38 __ __ SEC
119a : a5 43 __ LDA T0 + 0 
119c : e5 46 __ SBC T2 + 0 
119e : 85 4b __ STA T5 + 0 
11a0 : a5 44 __ LDA T0 + 1 
11a2 : e5 47 __ SBC T2 + 1 
11a4 : 85 4c __ STA T5 + 1 
11a6 : a5 4b __ LDA T5 + 0 
11a8 : 4a __ __ LSR
11a9 : b0 0c __ BCS $11b7 ; (bmu_line.s53 + 0)
.s14:
11ab : a5 4c __ LDA T5 + 1 
11ad : c9 80 __ CMP #$80
11af : 6a __ __ ROR
11b0 : 85 4c __ STA T5 + 1 
11b2 : 66 4b __ ROR T5 + 0 
11b4 : 4c bf 11 JMP $11bf ; (bmu_line.s15 + 0)
.s53:
11b7 : 06 43 __ ASL T0 + 0 
11b9 : 26 44 __ ROL T0 + 1 
11bb : 06 46 __ ASL T2 + 0 
11bd : 26 47 __ ROL T2 + 1 
.s15:
11bf : a0 00 __ LDY #$00
11c1 : b1 0d __ LDA (P0),y ; (bm + 0)
11c3 : 85 4d __ STA T7 + 0 
11c5 : c8 __ __ INY
11c6 : b1 0d __ LDA (P0),y ; (bm + 0)
11c8 : 85 4e __ STA T7 + 1 
11ca : a0 04 __ LDY #$04
11cc : b1 0d __ LDA (P0),y ; (bm + 0)
11ce : aa __ __ TAX
11cf : 0a __ __ ASL
11d0 : 85 4f __ STA T8 + 0 
11d2 : a9 a0 __ LDA #$a0
11d4 : 8d 00 18 STA $1800 ; (BLIT_CODE[0] + 0)
11d7 : a9 a2 __ LDA #$a2
11d9 : 8d 02 18 STA $1802 ; (BLIT_CODE[0] + 2)
11dc : a9 a5 __ LDA #$a5
11de : 8d 04 18 STA $1804 ; (BLIT_CODE[0] + 4)
11e1 : a9 0a __ LDA #$0a
11e3 : 8d 05 18 STA $1805 ; (BLIT_CODE[0] + 5)
11e6 : a9 00 __ LDA #$00
11e8 : 2a __ __ ROL
11e9 : 06 4f __ ASL T8 + 0 
11eb : 2a __ __ ROL
11ec : 06 4f __ ASL T8 + 0 
11ee : 2a __ __ ROL
11ef : 85 50 __ STA T8 + 1 
11f1 : a5 52 __ LDA T11 + 0 
11f3 : f0 0d __ BEQ $1202 ; (bmu_line.s16 + 0)
.s52:
11f5 : 38 __ __ SEC
11f6 : a9 00 __ LDA #$00
11f8 : e5 4f __ SBC T8 + 0 
11fa : 85 4f __ STA T8 + 0 
11fc : a9 00 __ LDA #$00
11fe : e5 50 __ SBC T8 + 1 
1200 : 85 50 __ STA T8 + 1 
.s16:
1202 : a5 11 __ LDA P4 ; (y0 + 0)
1204 : 29 f8 __ AND #$f8
1206 : 85 1b __ STA ACCU + 0 
1208 : a5 12 __ LDA P5 ; (y0 + 1)
120a : 85 1c __ STA ACCU + 1 
120c : 8a __ __ TXA
120d : 20 93 16 JSR $1693 ; (mul16by8 + 0)
1210 : 18 __ __ CLC
1211 : a5 4d __ LDA T7 + 0 
1213 : 65 1b __ ADC ACCU + 0 
1215 : 85 4d __ STA T7 + 0 
1217 : a5 4e __ LDA T7 + 1 
1219 : 65 1c __ ADC ACCU + 1 
121b : aa __ __ TAX
121c : a5 0f __ LDA P2 ; (x0 + 0)
121e : 29 f8 __ AND #$f8
1220 : 18 __ __ CLC
1221 : 65 4d __ ADC T7 + 0 
1223 : 85 4d __ STA T7 + 0 
1225 : 8a __ __ TXA
1226 : 65 10 __ ADC P3 ; (x0 + 1)
1228 : 85 4e __ STA T7 + 1 
122a : a5 46 __ LDA T2 + 0 
122c : 05 43 __ ORA T0 + 0 
122e : 29 80 __ AND #$80
1230 : 85 1b __ STA ACCU + 0 
1232 : a5 47 __ LDA T2 + 1 
1234 : 05 44 __ ORA T0 + 1 
1236 : 05 1b __ ORA ACCU + 0 
1238 : f0 02 __ BEQ $123c ; (bmu_line.s67 + 0)
.s66:
123a : a9 01 __ LDA #$01
.s67:
123c : 85 1b __ STA ACCU + 0 
123e : a5 11 __ LDA P4 ; (y0 + 0)
1240 : 29 07 __ AND #$07
1242 : 8d 01 18 STA $1801 ; (BLIT_CODE[0] + 1)
1245 : a6 49 __ LDX T4 + 0 
1247 : e8 __ __ INX
1248 : 8e 03 18 STX $1803 ; (BLIT_CODE[0] + 3)
124b : a5 0f __ LDA P2 ; (x0 + 0)
124d : 29 07 __ AND #$07
124f : aa __ __ TAX
1250 : bd 20 17 LDA $1720,x ; (bitshift[0] + 32)
1253 : 85 48 __ STA T3 + 0 
1255 : a2 06 __ LDX #$06
1257 : 86 45 __ STX T1 + 0 
1259 : a5 18 __ LDA P11 ; (op + 0)
125b : c9 02 __ CMP #$02
125d : d0 03 __ BNE $1262 ; (bmu_line.s17 + 0)
125f : 4c e3 15 JMP $15e3 ; (bmu_line.s49 + 0)
.s17:
1262 : b0 03 __ BCS $1267 ; (bmu_line.s18 + 0)
1264 : 4c 6d 15 JMP $156d ; (bmu_line.s44 + 0)
.s18:
1267 : c9 03 __ CMP #$03
1269 : d0 3d __ BNE $12a8 ; (bmu_line.s19 + 0)
.s40:
126b : a6 17 __ LDX P10 ; (pattern + 0)
126d : e8 __ __ INX
126e : f0 1e __ BEQ $128e ; (bmu_line.s41 + 0)
.s43:
1270 : a9 06 __ LDA #$06
1272 : 8d 06 18 STA $1806 ; (BLIT_CODE[0] + 6)
1275 : 8d 09 18 STA $1809 ; (BLIT_CODE[0] + 9)
1278 : a9 07 __ LDA #$07
127a : 8d 07 18 STA $1807 ; (BLIT_CODE[0] + 7)
127d : 8d 0b 18 STA $180b ; (BLIT_CODE[0] + 11)
1280 : a9 90 __ LDA #$90
1282 : 8d 08 18 STA $1808 ; (BLIT_CODE[0] + 8)
1285 : a9 e6 __ LDA #$e6
1287 : 8d 0a 18 STA $180a ; (BLIT_CODE[0] + 10)
128a : a9 0c __ LDA #$0c
128c : 85 45 __ STA T1 + 0 
.s41:
128e : a9 51 __ LDA #$51
.s42:
1290 : a6 45 __ LDX T1 + 0 
1292 : 9d 00 18 STA $1800,x ; (BLIT_CODE[0] + 0)
1295 : a9 03 __ LDA #$03
1297 : 9d 01 18 STA $1801,x ; (BLIT_CODE[0] + 1)
129a : 9d 03 18 STA $1803,x ; (BLIT_CODE[0] + 3)
129d : a9 91 __ LDA #$91
129f : 9d 02 18 STA $1802,x ; (BLIT_CODE[0] + 2)
12a2 : 8a __ __ TXA
12a3 : 18 __ __ CLC
12a4 : 69 04 __ ADC #$04
.s64:
12a6 : 85 45 __ STA T1 + 0 
.s19:
12a8 : a5 43 __ LDA T0 + 0 
12aa : 05 44 __ ORA T0 + 1 
12ac : f0 03 __ BEQ $12b1 ; (bmu_line.s20 + 0)
12ae : 4c 86 13 JMP $1386 ; (bmu_line.s28 + 0)
.s20:
12b1 : a5 46 __ LDA T2 + 0 
12b3 : 05 47 __ ORA T2 + 1 
12b5 : f0 75 __ BEQ $132c ; (bmu_line.s21 + 0)
.s22:
12b7 : a9 0a __ LDA #$0a
12b9 : a6 45 __ LDX T1 + 0 
12bb : 9d 01 18 STA $1801,x ; (BLIT_CODE[0] + 1)
12be : 9d 05 18 STA $1805,x ; (BLIT_CODE[0] + 5)
12c1 : a9 90 __ LDA #$90
12c3 : 9d 02 18 STA $1802,x ; (BLIT_CODE[0] + 2)
12c6 : a9 0c __ LDA #$0c
12c8 : 9d 03 18 STA $1803,x ; (BLIT_CODE[0] + 3)
12cb : a9 a5 __ LDA #$a5
12cd : 9d 06 18 STA $1806,x ; (BLIT_CODE[0] + 6)
12d0 : a9 03 __ LDA #$03
12d2 : 9d 07 18 STA $1807,x ; (BLIT_CODE[0] + 7)
12d5 : a9 69 __ LDA #$69
12d7 : 9d 08 18 STA $1808,x ; (BLIT_CODE[0] + 8)
12da : a5 51 __ LDA T10 + 0 
12dc : f0 09 __ BEQ $12e7 ; (bmu_line.s23 + 0)
.s27:
12de : a9 06 __ LDA #$06
12e0 : 9d 00 18 STA $1800,x ; (BLIT_CODE[0] + 0)
12e3 : a9 26 __ LDA #$26
12e5 : d0 07 __ BNE $12ee ; (bmu_line.s62 + 0)
.s23:
12e7 : a9 46 __ LDA #$46
12e9 : 9d 00 18 STA $1800,x ; (BLIT_CODE[0] + 0)
12ec : a9 66 __ LDA #$66
.s62:
12ee : 9d 04 18 STA $1804,x ; (BLIT_CODE[0] + 4)
12f1 : a9 02 __ LDA #$02
12f3 : 9d 0b 18 STA $180b,x ; (BLIT_CODE[0] + 11)
12f6 : a5 51 __ LDA T10 + 0 
12f8 : f0 0e __ BEQ $1308 ; (bmu_line.s24 + 0)
.s26:
12fa : a9 f8 __ LDA #$f8
12fc : 9d 09 18 STA $1809,x ; (BLIT_CODE[0] + 9)
12ff : a9 b0 __ LDA #$b0
1301 : 9d 0a 18 STA $180a,x ; (BLIT_CODE[0] + 10)
1304 : a9 c6 __ LDA #$c6
1306 : d0 0c __ BNE $1314 ; (bmu_line.s25 + 0)
.s24:
1308 : a9 08 __ LDA #$08
130a : 9d 09 18 STA $1809,x ; (BLIT_CODE[0] + 9)
130d : a9 90 __ LDA #$90
130f : 9d 0a 18 STA $180a,x ; (BLIT_CODE[0] + 10)
1312 : a9 e6 __ LDA #$e6
.s25:
1314 : 9d 0c 18 STA $180c,x ; (BLIT_CODE[0] + 12)
1317 : a9 04 __ LDA #$04
1319 : 9d 0d 18 STA $180d,x ; (BLIT_CODE[0] + 13)
131c : a9 85 __ LDA #$85
131e : 9d 0e 18 STA $180e,x ; (BLIT_CODE[0] + 14)
1321 : a9 03 __ LDA #$03
1323 : 9d 0f 18 STA $180f,x ; (BLIT_CODE[0] + 15)
1326 : 8a __ __ TXA
1327 : 18 __ __ CLC
1328 : 69 10 __ ADC #$10
132a : 85 45 __ STA T1 + 0 
.s21:
132c : a9 ca __ LDA #$ca
132e : a6 45 __ LDX T1 + 0 
1330 : 9d 00 18 STA $1800,x ; (BLIT_CODE[0] + 0)
1333 : a9 d0 __ LDA #$d0
1335 : 9d 01 18 STA $1801,x ; (BLIT_CODE[0] + 1)
1338 : a9 c6 __ LDA #$c6
133a : 9d 03 18 STA $1803,x ; (BLIT_CODE[0] + 3)
133d : a9 0b __ LDA #$0b
133f : 9d 04 18 STA $1804,x ; (BLIT_CODE[0] + 4)
1342 : a9 10 __ LDA #$10
1344 : 9d 05 18 STA $1805,x ; (BLIT_CODE[0] + 5)
1347 : a9 60 __ LDA #$60
1349 : 9d 07 18 STA $1807,x ; (BLIT_CODE[0] + 7)
134c : e6 45 __ INC T1 + 0 
134e : 38 __ __ SEC
134f : a9 02 __ LDA #$02
1351 : e5 45 __ SBC T1 + 0 
1353 : 9d 02 18 STA $1802,x ; (BLIT_CODE[0] + 2)
1356 : 8a __ __ TXA
1357 : 18 __ __ CLC
1358 : 69 05 __ ADC #$05
135a : 49 ff __ EOR #$ff
135c : 18 __ __ CLC
135d : 69 03 __ ADC #$03
135f : 9d 06 18 STA $1806,x ; (BLIT_CODE[0] + 6)
1362 : a5 4a __ LDA T4 + 1 
1364 : 85 49 __ STA T4 + 0 
1366 : a5 4d __ LDA T7 + 0 
1368 : 85 03 __ STA WORK + 0 
136a : a5 4e __ LDA T7 + 1 
136c : 85 04 __ STA WORK + 1 
136e : a5 4b __ LDA T5 + 0 
1370 : 85 05 __ STA WORK + 2 
1372 : a5 4c __ LDA T5 + 1 
1374 : 85 06 __ STA WORK + 3 
1376 : a5 49 __ LDA T4 + 0 
1378 : 85 0b __ STA WORK + 8 
137a : a5 48 __ LDA T3 + 0 
137c : 85 0a __ STA WORK + 7 
137e : a5 17 __ LDA P10 ; (pattern + 0)
1380 : 85 07 __ STA WORK + 4 
1382 : 20 00 18 JSR $1800 ; (BLIT_CODE[0] + 0)
.s3:
1385 : 60 __ __ RTS
.s28:
1386 : a5 46 __ LDA T2 + 0 
1388 : 05 47 __ ORA T2 + 1 
138a : c9 01 __ CMP #$01
138c : a9 00 __ LDA #$00
138e : 6a __ __ ROR
138f : 85 1c __ STA ACCU + 1 
1391 : f0 03 __ BEQ $1396 ; (bmu_line.s29 + 0)
1393 : 4c 2d 15 JMP $152d ; (bmu_line.s35 + 0)
.s29:
1396 : a2 00 __ LDX #$00
1398 : 86 46 __ STX T2 + 0 
139a : 86 47 __ STX T2 + 1 
139c : a5 52 __ LDA T11 + 0 
139e : f0 03 __ BEQ $13a3 ; (bmu_line.s30 + 0)
13a0 : 4c c3 14 JMP $14c3 ; (bmu_line.s34 + 0)
.s30:
13a3 : a9 c8 __ LDA #$c8
13a5 : a4 45 __ LDY T1 + 0 
13a7 : 99 00 18 STA $1800,y ; (BLIT_CODE[0] + 0)
13aa : a9 c0 __ LDA #$c0
13ac : 99 01 18 STA $1801,y ; (BLIT_CODE[0] + 1)
13af : a9 08 __ LDA #$08
13b1 : 99 02 18 STA $1802,y ; (BLIT_CODE[0] + 2)
13b4 : a9 d0 __ LDA #$d0
13b6 : 99 03 18 STA $1803,y ; (BLIT_CODE[0] + 3)
13b9 : a9 a0 __ LDA #$a0
13bb : 99 05 18 STA $1805,y ; (BLIT_CODE[0] + 5)
13be : a9 00 __ LDA #$00
13c0 : 99 06 18 STA $1806,y ; (BLIT_CODE[0] + 6)
13c3 : a9 a5 __ LDA #$a5
13c5 : 99 07 18 STA $1807,y ; (BLIT_CODE[0] + 7)
13c8 : 99 0d 18 STA $180d,y ; (BLIT_CODE[0] + 13)
13cb : a9 03 __ LDA #$03
13cd : 99 08 18 STA $1808,y ; (BLIT_CODE[0] + 8)
13d0 : 99 0c 18 STA $180c,y ; (BLIT_CODE[0] + 12)
13d3 : a9 69 __ LDA #$69
13d5 : 99 09 18 STA $1809,y ; (BLIT_CODE[0] + 9)
13d8 : 99 0f 18 STA $180f,y ; (BLIT_CODE[0] + 15)
13db : a9 85 __ LDA #$85
13dd : 99 0b 18 STA $180b,y ; (BLIT_CODE[0] + 11)
13e0 : 99 11 18 STA $1811,y ; (BLIT_CODE[0] + 17)
13e3 : a9 04 __ LDA #$04
13e5 : 99 0e 18 STA $180e,y ; (BLIT_CODE[0] + 14)
13e8 : 99 12 18 STA $1812,y ; (BLIT_CODE[0] + 18)
13eb : 8a __ __ TXA
13ec : f0 04 __ BEQ $13f2 ; (bmu_line.s71 + 0)
.s72:
13ee : a9 10 __ LDA #$10
13f0 : 90 02 __ BCC $13f4 ; (bmu_line.s73 + 0)
.s71:
13f2 : a9 0e __ LDA #$0e
.s73:
13f4 : 99 04 18 STA $1804,y ; (BLIT_CODE[0] + 4)
13f7 : 38 __ __ SEC
13f8 : a5 4f __ LDA T8 + 0 
13fa : e9 01 __ SBC #$01
13fc : 99 0a 18 STA $180a,y ; (BLIT_CODE[0] + 10)
13ff : a5 50 __ LDA T8 + 1 
1401 : e9 00 __ SBC #$00
1403 : 99 10 18 STA $1810,y ; (BLIT_CODE[0] + 16)
1406 : 98 __ __ TYA
1407 : 18 __ __ CLC
1408 : 69 13 __ ADC #$13
140a : 85 45 __ STA T1 + 0 
140c : a8 __ __ TAY
140d : 24 1c __ BIT ACCU + 1 
140f : 30 03 __ BMI $1414 ; (bmu_line.s31 + 0)
1411 : 4c b1 12 JMP $12b1 ; (bmu_line.s20 + 0)
.s31:
1414 : a9 a5 __ LDA #$a5
1416 : 99 00 18 STA $1800,y ; (BLIT_CODE[0] + 0)
1419 : a9 05 __ LDA #$05
141b : 99 01 18 STA $1801,y ; (BLIT_CODE[0] + 1)
141e : 99 06 18 STA $1806,y ; (BLIT_CODE[0] + 6)
1421 : a9 38 __ LDA #$38
1423 : 99 02 18 STA $1802,y ; (BLIT_CODE[0] + 2)
1426 : a9 e9 __ LDA #$e9
1428 : 99 03 18 STA $1803,y ; (BLIT_CODE[0] + 3)
142b : a9 85 __ LDA #$85
142d : 99 05 18 STA $1805,y ; (BLIT_CODE[0] + 5)
1430 : a5 46 __ LDA T2 + 0 
1432 : 99 04 18 STA $1804,y ; (BLIT_CODE[0] + 4)
1435 : a5 1b __ LDA ACCU + 0 
1437 : d0 2a __ BNE $1463 ; (bmu_line.s33 + 0)
.s32:
1439 : a9 10 __ LDA #$10
143b : 99 07 18 STA $1807,y ; (BLIT_CODE[0] + 7)
143e : a9 15 __ LDA #$15
1440 : 99 08 18 STA $1808,y ; (BLIT_CODE[0] + 8)
1443 : a9 18 __ LDA #$18
1445 : 99 09 18 STA $1809,y ; (BLIT_CODE[0] + 9)
1448 : a9 69 __ LDA #$69
144a : 99 0a 18 STA $180a,y ; (BLIT_CODE[0] + 10)
144d : a5 43 __ LDA T0 + 0 
144f : 99 0b 18 STA $180b,y ; (BLIT_CODE[0] + 11)
1452 : a9 85 __ LDA #$85
1454 : 99 0c 18 STA $180c,y ; (BLIT_CODE[0] + 12)
1457 : a9 05 __ LDA #$05
1459 : 99 0d 18 STA $180d,y ; (BLIT_CODE[0] + 13)
145c : 98 __ __ TYA
145d : 18 __ __ CLC
145e : 69 0e __ ADC #$0e
1460 : 4c be 14 JMP $14be ; (bmu_line.s65 + 0)
.s33:
1463 : a9 a5 __ LDA #$a5
1465 : 99 07 18 STA $1807,y ; (BLIT_CODE[0] + 7)
1468 : 99 10 18 STA $1810,y ; (BLIT_CODE[0] + 16)
146b : 99 16 18 STA $1816,y ; (BLIT_CODE[0] + 22)
146e : a9 06 __ LDA #$06
1470 : 99 08 18 STA $1808,y ; (BLIT_CODE[0] + 8)
1473 : 99 0c 18 STA $180c,y ; (BLIT_CODE[0] + 12)
1476 : 99 17 18 STA $1817,y ; (BLIT_CODE[0] + 23)
1479 : 99 1b 18 STA $181b,y ; (BLIT_CODE[0] + 27)
147c : a9 e9 __ LDA #$e9
147e : 99 09 18 STA $1809,y ; (BLIT_CODE[0] + 9)
1481 : a9 85 __ LDA #$85
1483 : 99 0b 18 STA $180b,y ; (BLIT_CODE[0] + 11)
1486 : 99 14 18 STA $1814,y ; (BLIT_CODE[0] + 20)
1489 : 99 1a 18 STA $181a,y ; (BLIT_CODE[0] + 26)
148c : a9 10 __ LDA #$10
148e : 99 0d 18 STA $180d,y ; (BLIT_CODE[0] + 13)
1491 : a9 1d __ LDA #$1d
1493 : 99 0e 18 STA $180e,y ; (BLIT_CODE[0] + 14)
1496 : a9 18 __ LDA #$18
1498 : 99 0f 18 STA $180f,y ; (BLIT_CODE[0] + 15)
149b : a9 05 __ LDA #$05
149d : 99 11 18 STA $1811,y ; (BLIT_CODE[0] + 17)
14a0 : 99 15 18 STA $1815,y ; (BLIT_CODE[0] + 21)
14a3 : a9 69 __ LDA #$69
14a5 : 99 12 18 STA $1812,y ; (BLIT_CODE[0] + 18)
14a8 : 99 18 18 STA $1818,y ; (BLIT_CODE[0] + 24)
14ab : a5 43 __ LDA T0 + 0 
14ad : 99 13 18 STA $1813,y ; (BLIT_CODE[0] + 19)
14b0 : a5 47 __ LDA T2 + 1 
14b2 : 99 0a 18 STA $180a,y ; (BLIT_CODE[0] + 10)
14b5 : a5 44 __ LDA T0 + 1 
14b7 : 99 19 18 STA $1819,y ; (BLIT_CODE[0] + 25)
14ba : 98 __ __ TYA
14bb : 18 __ __ CLC
14bc : 69 1c __ ADC #$1c
.s65:
14be : 85 45 __ STA T1 + 0 
14c0 : 4c b7 12 JMP $12b7 ; (bmu_line.s22 + 0)
.s34:
14c3 : a9 88 __ LDA #$88
14c5 : a4 45 __ LDY T1 + 0 
14c7 : 99 00 18 STA $1800,y ; (BLIT_CODE[0] + 0)
14ca : a9 10 __ LDA #$10
14cc : 99 01 18 STA $1801,y ; (BLIT_CODE[0] + 1)
14cf : a9 18 __ LDA #$18
14d1 : 99 03 18 STA $1803,y ; (BLIT_CODE[0] + 3)
14d4 : a9 a0 __ LDA #$a0
14d6 : 99 04 18 STA $1804,y ; (BLIT_CODE[0] + 4)
14d9 : a9 07 __ LDA #$07
14db : 99 05 18 STA $1805,y ; (BLIT_CODE[0] + 5)
14de : a9 a5 __ LDA #$a5
14e0 : 99 06 18 STA $1806,y ; (BLIT_CODE[0] + 6)
14e3 : 99 0c 18 STA $180c,y ; (BLIT_CODE[0] + 12)
14e6 : a9 03 __ LDA #$03
14e8 : 99 07 18 STA $1807,y ; (BLIT_CODE[0] + 7)
14eb : 99 0b 18 STA $180b,y ; (BLIT_CODE[0] + 11)
14ee : a9 69 __ LDA #$69
14f0 : 99 08 18 STA $1808,y ; (BLIT_CODE[0] + 8)
14f3 : 99 0e 18 STA $180e,y ; (BLIT_CODE[0] + 14)
14f6 : a9 85 __ LDA #$85
14f8 : 99 0a 18 STA $180a,y ; (BLIT_CODE[0] + 10)
14fb : 99 10 18 STA $1810,y ; (BLIT_CODE[0] + 16)
14fe : a9 04 __ LDA #$04
1500 : 99 0d 18 STA $180d,y ; (BLIT_CODE[0] + 13)
1503 : 99 11 18 STA $1811,y ; (BLIT_CODE[0] + 17)
1506 : 8a __ __ TXA
1507 : f0 04 __ BEQ $150d ; (bmu_line.s68 + 0)
.s69:
1509 : a9 11 __ LDA #$11
150b : 90 02 __ BCC $150f ; (bmu_line.s70 + 0)
.s68:
150d : a9 0f __ LDA #$0f
.s70:
150f : 99 02 18 STA $1802,y ; (BLIT_CODE[0] + 2)
1512 : a5 4f __ LDA T8 + 0 
1514 : 99 09 18 STA $1809,y ; (BLIT_CODE[0] + 9)
1517 : a5 50 __ LDA T8 + 1 
1519 : 99 0f 18 STA $180f,y ; (BLIT_CODE[0] + 15)
151c : 98 __ __ TYA
151d : 18 __ __ CLC
151e : 69 12 __ ADC #$12
1520 : 85 45 __ STA T1 + 0 
1522 : a8 __ __ TAY
1523 : 24 1c __ BIT ACCU + 1 
1525 : 10 03 __ BPL $152a ; (bmu_line.s70 + 27)
1527 : 4c 14 14 JMP $1414 ; (bmu_line.s31 + 0)
152a : 4c b1 12 JMP $12b1 ; (bmu_line.s20 + 0)
.s35:
152d : a9 a5 __ LDA #$a5
152f : a6 45 __ LDX T1 + 0 
1531 : 9d 00 18 STA $1800,x ; (BLIT_CODE[0] + 0)
1534 : a9 30 __ LDA #$30
1536 : 9d 02 18 STA $1802,x ; (BLIT_CODE[0] + 2)
1539 : a5 1b __ LDA ACCU + 0 
153b : 69 05 __ ADC #$05
153d : 9d 01 18 STA $1801,x ; (BLIT_CODE[0] + 1)
1540 : a5 1b __ LDA ACCU + 0 
1542 : d0 21 __ BNE $1565 ; (bmu_line.s39 + 0)
.s36:
1544 : a0 1b __ LDY #$1b
1546 : a5 52 __ LDA T11 + 0 
1548 : d0 01 __ BNE $154b ; (bmu_line.s38 + 0)
.s37:
154a : c8 __ __ INY
.s38:
154b : 98 __ __ TYA
154c : 9d 03 18 STA $1803,x ; (BLIT_CODE[0] + 3)
154f : 8a __ __ TXA
1550 : 18 __ __ CLC
1551 : 69 04 __ ADC #$04
1553 : 85 45 __ STA T1 + 0 
1555 : a9 00 __ LDA #$00
1557 : c5 1b __ CMP ACCU + 0 
1559 : 2a __ __ ROL
155a : aa __ __ TAX
155b : a5 52 __ LDA T11 + 0 
155d : f0 03 __ BEQ $1562 ; (bmu_line.s38 + 23)
155f : 4c c3 14 JMP $14c3 ; (bmu_line.s34 + 0)
1562 : 4c a3 13 JMP $13a3 ; (bmu_line.s30 + 0)
.s39:
1565 : a0 21 __ LDY #$21
1567 : a5 52 __ LDA T11 + 0 
1569 : d0 e0 __ BNE $154b ; (bmu_line.s38 + 0)
156b : f0 dd __ BEQ $154a ; (bmu_line.s37 + 0)
.s44:
156d : a8 __ __ TAY
156e : d0 4b __ BNE $15bb ; (bmu_line.s46 + 0)
.s45:
1570 : 8e 06 18 STX $1806 ; (BLIT_CODE[0] + 6)
1573 : 8e 09 18 STX $1809 ; (BLIT_CODE[0] + 9)
1576 : a9 07 __ LDA #$07
1578 : 8d 07 18 STA $1807 ; (BLIT_CODE[0] + 7)
157b : 8d 0b 18 STA $180b ; (BLIT_CODE[0] + 11)
157e : a9 03 __ LDA #$03
1580 : 8d 0d 18 STA $180d ; (BLIT_CODE[0] + 13)
1583 : 8d 13 18 STA $1813 ; (BLIT_CODE[0] + 19)
1586 : 8d 15 18 STA $1815 ; (BLIT_CODE[0] + 21)
1589 : a9 90 __ LDA #$90
158b : 8d 08 18 STA $1808 ; (BLIT_CODE[0] + 8)
158e : a9 e6 __ LDA #$e6
1590 : 8d 0a 18 STA $180a ; (BLIT_CODE[0] + 10)
1593 : a9 11 __ LDA #$11
1595 : 8d 0c 18 STA $180c ; (BLIT_CODE[0] + 12)
1598 : a9 d0 __ LDA #$d0
159a : 8d 0e 18 STA $180e ; (BLIT_CODE[0] + 14)
159d : a9 04 __ LDA #$04
159f : 8d 0f 18 STA $180f ; (BLIT_CODE[0] + 15)
15a2 : a9 49 __ LDA #$49
15a4 : 8d 10 18 STA $1810 ; (BLIT_CODE[0] + 16)
15a7 : a9 ff __ LDA #$ff
15a9 : 8d 11 18 STA $1811 ; (BLIT_CODE[0] + 17)
15ac : a9 31 __ LDA #$31
15ae : 8d 12 18 STA $1812 ; (BLIT_CODE[0] + 18)
15b1 : a9 91 __ LDA #$91
15b3 : 8d 14 18 STA $1814 ; (BLIT_CODE[0] + 20)
15b6 : a9 16 __ LDA #$16
15b8 : 4c a6 12 JMP $12a6 ; (bmu_line.s64 + 0)
.s46:
15bb : a6 17 __ LDX P10 ; (pattern + 0)
15bd : e8 __ __ INX
15be : f0 1e __ BEQ $15de ; (bmu_line.s47 + 0)
.s48:
15c0 : a9 06 __ LDA #$06
15c2 : 8d 06 18 STA $1806 ; (BLIT_CODE[0] + 6)
15c5 : 8d 09 18 STA $1809 ; (BLIT_CODE[0] + 9)
15c8 : a9 07 __ LDA #$07
15ca : 8d 07 18 STA $1807 ; (BLIT_CODE[0] + 7)
15cd : 8d 0b 18 STA $180b ; (BLIT_CODE[0] + 11)
15d0 : a9 90 __ LDA #$90
15d2 : 8d 08 18 STA $1808 ; (BLIT_CODE[0] + 8)
15d5 : a9 e6 __ LDA #$e6
15d7 : 8d 0a 18 STA $180a ; (BLIT_CODE[0] + 10)
15da : a9 0c __ LDA #$0c
15dc : 85 45 __ STA T1 + 0 
.s47:
15de : a9 11 __ LDA #$11
15e0 : 4c 90 12 JMP $1290 ; (bmu_line.s42 + 0)
.s49:
15e3 : a4 17 __ LDY P10 ; (pattern + 0)
15e5 : c8 __ __ INY
15e6 : f0 1e __ BEQ $1606 ; (bmu_line.s50 + 0)
.s51:
15e8 : 8e 06 18 STX $1806 ; (BLIT_CODE[0] + 6)
15eb : a9 07 __ LDA #$07
15ed : 8d 07 18 STA $1807 ; (BLIT_CODE[0] + 7)
15f0 : 8d 0b 18 STA $180b ; (BLIT_CODE[0] + 11)
15f3 : a9 90 __ LDA #$90
15f5 : 8d 08 18 STA $1808 ; (BLIT_CODE[0] + 8)
15f8 : a9 08 __ LDA #$08
15fa : 8d 09 18 STA $1809 ; (BLIT_CODE[0] + 9)
15fd : a9 e6 __ LDA #$e6
15ff : 8d 0a 18 STA $180a ; (BLIT_CODE[0] + 10)
1602 : a9 0c __ LDA #$0c
1604 : 85 45 __ STA T1 + 0 
.s50:
1606 : a9 49 __ LDA #$49
1608 : a6 45 __ LDX T1 + 0 
160a : 9d 00 18 STA $1800,x ; (BLIT_CODE[0] + 0)
160d : a9 ff __ LDA #$ff
160f : 9d 01 18 STA $1801,x ; (BLIT_CODE[0] + 1)
1612 : a9 31 __ LDA #$31
1614 : 9d 02 18 STA $1802,x ; (BLIT_CODE[0] + 2)
1617 : a9 03 __ LDA #$03
1619 : 9d 03 18 STA $1803,x ; (BLIT_CODE[0] + 3)
161c : 9d 05 18 STA $1805,x ; (BLIT_CODE[0] + 5)
161f : a9 91 __ LDA #$91
1621 : 9d 04 18 STA $1804,x ; (BLIT_CODE[0] + 4)
1624 : 8a __ __ TXA
1625 : 18 __ __ CLC
1626 : 69 06 __ ADC #$06
1628 : 4c a6 12 JMP $12a6 ; (bmu_line.s64 + 0)
.s59:
162b : c9 ff __ CMP #$ff
162d : f0 03 __ BEQ $1632 ; (bmu_line.s60 + 0)
162f : 4c 37 11 JMP $1137 ; (bmu_line.s7 + 0)
.s60:
1632 : a5 18 __ LDA P11 ; (op + 0)
1634 : d0 f9 __ BNE $162f ; (bmu_line.s59 + 4)
.s61:
1636 : a9 01 __ LDA #$01
1638 : 4c 35 11 JMP $1135 ; (bmu_line.s63 + 0)
--------------------------------------------------------------------
done: ; done()->void
;  30, "/home/honza/projects/c64/projects/oscar64/samples/hires/lines.c"
.s4:
163b : a9 37 __ LDA #$37
163d : 85 01 __ STA $01 
163f : 20 55 16 JSR $1655 ; (getch.l4 + 0)
1642 : a9 00 __ LDA #$00
1644 : 85 0d __ STA P0 
1646 : 85 0e __ STA P1 
1648 : 85 10 __ STA P3 
164a : a9 04 __ LDA #$04
164c : 85 0f __ STA P2 
164e : a9 10 __ LDA #$10
1650 : 85 11 __ STA P4 
1652 : 4c f0 09 JMP $09f0 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
getch: ; getch()->u8
;  83, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.l4:
1655 : 20 e4 ff JSR $ffe4 
1658 : 85 1b __ STA ACCU + 0 
165a : a5 1b __ LDA ACCU + 0 
165c : f0 f7 __ BEQ $1655 ; (getch.l4 + 0)
.s5:
165e : 4c 61 16 JMP $1661 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
1661 : a8 __ __ TAY
1662 : ad cc 16 LDA $16cc ; (giocharmap + 0)
1665 : f0 27 __ BEQ $168e ; (convch.s5 + 0)
.s6:
1667 : c0 0d __ CPY #$0d
1669 : d0 03 __ BNE $166e ; (convch.s7 + 0)
.s16:
166b : a9 0a __ LDA #$0a
.s3:
166d : 60 __ __ RTS
.s7:
166e : c9 02 __ CMP #$02
1670 : 90 1c __ BCC $168e ; (convch.s5 + 0)
.s8:
1672 : 98 __ __ TYA
1673 : c0 41 __ CPY #$41
1675 : 90 17 __ BCC $168e ; (convch.s5 + 0)
.s9:
1677 : c9 db __ CMP #$db
1679 : b0 13 __ BCS $168e ; (convch.s5 + 0)
.s10:
167b : c9 c1 __ CMP #$c1
167d : 90 03 __ BCC $1682 ; (convch.s11 + 0)
.s15:
167f : 49 a0 __ EOR #$a0
1681 : a8 __ __ TAY
.s11:
1682 : c9 7b __ CMP #$7b
1684 : b0 08 __ BCS $168e ; (convch.s5 + 0)
.s12:
1686 : c9 61 __ CMP #$61
1688 : b0 06 __ BCS $1690 ; (convch.s14 + 0)
.s13:
168a : c9 5b __ CMP #$5b
168c : 90 02 __ BCC $1690 ; (convch.s14 + 0)
.s5:
168e : 98 __ __ TYA
168f : 60 __ __ RTS
.s14:
1690 : 49 20 __ EOR #$20
1692 : 60 __ __ RTS
--------------------------------------------------------------------
mul16by8: ; mul16by8
1693 : 4a __ __ LSR
1694 : f0 2e __ BEQ $16c4 ; (mul16by8 + 49)
1696 : a2 00 __ LDX #$00
1698 : a0 00 __ LDY #$00
169a : 90 13 __ BCC $16af ; (mul16by8 + 28)
169c : a4 1b __ LDY ACCU + 0 
169e : a6 1c __ LDX ACCU + 1 
16a0 : b0 0d __ BCS $16af ; (mul16by8 + 28)
16a2 : 85 02 __ STA $02 
16a4 : 18 __ __ CLC
16a5 : 98 __ __ TYA
16a6 : 65 1b __ ADC ACCU + 0 
16a8 : a8 __ __ TAY
16a9 : 8a __ __ TXA
16aa : 65 1c __ ADC ACCU + 1 
16ac : aa __ __ TAX
16ad : a5 02 __ LDA $02 
16af : 06 1b __ ASL ACCU + 0 
16b1 : 26 1c __ ROL ACCU + 1 
16b3 : 4a __ __ LSR
16b4 : 90 f9 __ BCC $16af ; (mul16by8 + 28)
16b6 : d0 ea __ BNE $16a2 ; (mul16by8 + 15)
16b8 : 18 __ __ CLC
16b9 : 98 __ __ TYA
16ba : 65 1b __ ADC ACCU + 0 
16bc : 85 1b __ STA ACCU + 0 
16be : 8a __ __ TXA
16bf : 65 1c __ ADC ACCU + 1 
16c1 : 85 1c __ STA ACCU + 1 
16c3 : 60 __ __ RTS
16c4 : b0 04 __ BCS $16ca ; (mul16by8 + 55)
16c6 : 85 1b __ STA ACCU + 0 
16c8 : 85 1c __ STA ACCU + 1 
16ca : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
16cb : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
16cc : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
Screen:
16cd : __ __ __ BSS	8
--------------------------------------------------------------------
bitshift:
1700 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
1710 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
1720 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
1730 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
BLIT_CODE:
1800 : __ __ __ BSS	224
