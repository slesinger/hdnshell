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
080e : 8e b8 0c STX $0cb8 ; (spentry + 0)
0811 : a2 0c __ LDX #$0c
0813 : a0 c3 __ LDY #$c3
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 17 __ CPX #$17
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 00 __ CPY #$00
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 fe __ LDA #$fe
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
; 170, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_stripe.c"
.s4:
0880 : a9 36 __ LDA #$36
0882 : 85 01 __ STA $01 
0884 : 20 f9 09 JSR $09f9 ; (mmap_trampoline.s4 + 0)
0887 : a9 00 __ LDA #$00
0889 : 85 0e __ STA P1 
088b : 85 10 __ STA P3 
088d : a9 35 __ LDA #$35
088f : 85 01 __ STA $01 
0891 : a9 04 __ LDA #$04
0893 : 85 0d __ STA P0 
0895 : a9 c8 __ LDA #$c8
0897 : 85 0f __ STA P2 
0899 : a9 e0 __ LDA #$e0
089b : 85 11 __ STA P4 
089d : 20 43 0a JSR $0a43 ; (vic_setmode.s4 + 0)
08a0 : a9 00 __ LDA #$00
08a2 : 85 0d __ STA P0 
08a4 : 85 0f __ STA P2 
08a6 : a9 e0 __ LDA #$e0
08a8 : 85 0e __ STA P1 
08aa : a9 40 __ LDA #$40
08ac : 85 11 __ STA P4 
08ae : a9 1f __ LDA #$1f
08b0 : 85 12 __ STA P5 
08b2 : a9 78 __ LDA #$78
08b4 : a2 fa __ LDX #$fa
.l6:
08b6 : ca __ __ DEX
08b7 : 9d 00 c8 STA $c800,x 
08ba : 9d fa c8 STA $c8fa,x 
08bd : 9d f4 c9 STA $c9f4,x 
08c0 : 9d ee ca STA $caee,x 
08c3 : d0 f1 __ BNE $08b6 ; (main.l6 + 0)
.s5:
08c5 : a9 0e __ LDA #$0e
08c7 : a2 fa __ LDX #$fa
.l8:
08c9 : ca __ __ DEX
08ca : 9d 00 d8 STA $d800,x 
08cd : 9d fa d8 STA $d8fa,x 
08d0 : 9d f4 d9 STA $d9f4,x 
08d3 : 9d ee da STA $daee,x 
08d6 : d0 f1 __ BNE $08c9 ; (main.l8 + 0)
.s7:
08d8 : 20 95 0a JSR $0a95 ; (memset.s4 + 0)
08db : a9 00 __ LDA #$00
08dd : 85 4e __ STA T3 + 0 
08df : 8d 20 d0 STA $d020 
08e2 : 8d 21 d0 STA $d021 
08e5 : 20 b9 0a JSR $0ab9 ; (particle_init.s4 + 0)
08e8 : a9 f0 __ LDA #$f0
08ea : 85 4c __ STA T2 + 0 
08ec : a9 d8 __ LDA #$d8
08ee : 85 4d __ STA T2 + 1 
.l9:
08f0 : 20 ed 0a JSR $0aed ; (particle_move.s4 + 0)
08f3 : a5 4e __ LDA T3 + 0 
08f5 : c9 19 __ CMP #$19
08f7 : b0 31 __ BCS $092a ; (main.s10 + 0)
.s19:
08f9 : 20 4a 0c JSR $0c4a ; (rnorm.s4 + 0)
08fc : a5 1b __ LDA ACCU + 0 
08fe : 85 4a __ STA T1 + 0 
0900 : a5 1c __ LDA ACCU + 1 
0902 : 85 4b __ STA T1 + 1 
0904 : 20 4a 0c JSR $0c4a ; (rnorm.s4 + 0)
0907 : 06 4a __ ASL T1 + 0 
0909 : a9 01 __ LDA #$01
090b : 85 0e __ STA P1 
090d : a9 55 __ LDA #$55
090f : 85 15 __ STA P8 
0911 : 26 4b __ ROL T1 + 1 
0913 : a9 00 __ LDA #$00
0915 : 85 0d __ STA P0 
0917 : 69 ff __ ADC #$ff
0919 : 49 ff __ EOR #$ff
091b : 06 4a __ ASL T1 + 0 
091d : 26 4b __ ROL T1 + 1 
091f : 2a __ __ ROL
0920 : a6 4b __ LDX T1 + 1 
0922 : 86 11 __ STX P4 
0924 : 18 __ __ CLC
0925 : 69 01 __ ADC #$01
0927 : 4c bc 09 JMP $09bc ; (main.s17 + 0)
.s10:
092a : c9 32 __ CMP #$32
092c : b0 3e __ BCS $096c ; (main.s11 + 0)
.s18:
092e : 20 4a 0c JSR $0c4a ; (rnorm.s4 + 0)
0931 : a5 1b __ LDA ACCU + 0 
0933 : 85 4a __ STA T1 + 0 
0935 : a5 1c __ LDA ACCU + 1 
0937 : 85 4b __ STA T1 + 1 
0939 : 20 4a 0c JSR $0c4a ; (rnorm.s4 + 0)
093c : 06 4a __ ASL T1 + 0 
093e : a9 4f __ LDA #$4f
0940 : 85 0e __ STA P1 
0942 : a9 aa __ LDA #$aa
0944 : 85 15 __ STA P8 
0946 : 26 4b __ ROL T1 + 1 
0948 : a9 00 __ LDA #$00
094a : 85 0d __ STA P0 
094c : 69 ff __ ADC #$ff
094e : 49 ff __ EOR #$ff
0950 : 06 4a __ ASL T1 + 0 
0952 : 26 4b __ ROL T1 + 1 
0954 : 2a __ __ ROL
0955 : a6 4b __ LDX T1 + 1 
0957 : 86 4a __ STX T1 + 0 
0959 : 18 __ __ CLC
095a : 69 01 __ ADC #$01
095c : 85 4b __ STA T1 + 1 
095e : 38 __ __ SEC
095f : a9 00 __ LDA #$00
0961 : e5 4a __ SBC T1 + 0 
0963 : 85 11 __ STA P4 
0965 : a9 00 __ LDA #$00
0967 : e5 4b __ SBC T1 + 1 
0969 : 4c bc 09 JMP $09bc ; (main.s17 + 0)
.s11:
096c : c9 4b __ CMP #$4b
096e : b0 2e __ BCS $099e ; (main.s12 + 0)
.s16:
0970 : 20 4a 0c JSR $0c4a ; (rnorm.s4 + 0)
0973 : a5 1b __ LDA ACCU + 0 
0975 : 85 4a __ STA T1 + 0 
0977 : a5 1c __ LDA ACCU + 1 
0979 : 85 4b __ STA T1 + 1 
097b : 20 4a 0c JSR $0c4a ; (rnorm.s4 + 0)
097e : 06 4a __ ASL T1 + 0 
0980 : a9 28 __ LDA #$28
0982 : 85 0e __ STA P1 
0984 : a9 ff __ LDA #$ff
0986 : 85 15 __ STA P8 
0988 : 26 4b __ ROL T1 + 1 
098a : a9 00 __ LDA #$00
098c : 85 0d __ STA P0 
098e : 69 ff __ ADC #$ff
0990 : 49 ff __ EOR #$ff
0992 : 06 4a __ ASL T1 + 0 
0994 : 26 4b __ ROL T1 + 1 
0996 : 2a __ __ ROL
0997 : a6 4b __ LDX T1 + 1 
0999 : 86 11 __ STX P4 
099b : 4c bc 09 JMP $09bc ; (main.s17 + 0)
.s12:
099e : e6 4e __ INC T3 + 0 
09a0 : a5 4e __ LDA T3 + 0 
09a2 : c9 4b __ CMP #$4b
09a4 : d0 04 __ BNE $09aa ; (main.s13 + 0)
.s15:
09a6 : a9 00 __ LDA #$00
09a8 : 85 4e __ STA T3 + 0 
.s13:
09aa : e6 4c __ INC T2 + 0 
09ac : f0 03 __ BEQ $09b1 ; (main.s20 + 0)
09ae : 4c f0 08 JMP $08f0 ; (main.l9 + 0)
.s20:
09b1 : e6 4d __ INC T2 + 1 
09b3 : d0 f9 __ BNE $09ae ; (main.s13 + 4)
.s14:
09b5 : a9 00 __ LDA #$00
09b7 : 85 1b __ STA ACCU + 0 
09b9 : 85 1c __ STA ACCU + 1 
.s3:
09bb : 60 __ __ RTS
.s17:
09bc : 85 12 __ STA P5 
09be : a5 1b __ LDA ACCU + 0 
09c0 : 0a __ __ ASL
09c1 : 85 48 __ STA T0 + 0 
09c3 : a5 1c __ LDA ACCU + 1 
09c5 : 2a __ __ ROL
09c6 : 85 49 __ STA T0 + 1 
09c8 : a9 00 __ LDA #$00
09ca : 85 0f __ STA P2 
09cc : 69 ff __ ADC #$ff
09ce : 49 ff __ EOR #$ff
09d0 : 06 48 __ ASL T0 + 0 
09d2 : 26 49 __ ROL T0 + 1 
09d4 : 2a __ __ ROL
09d5 : aa __ __ TAX
09d6 : a9 31 __ LDA #$31
09d8 : 85 10 __ STA P3 
09da : 18 __ __ CLC
09db : a5 49 __ LDA T0 + 1 
09dd : 69 80 __ ADC #$80
09df : 85 48 __ STA T0 + 0 
09e1 : 8a __ __ TXA
09e2 : 69 01 __ ADC #$01
09e4 : 85 49 __ STA T0 + 1 
09e6 : 38 __ __ SEC
09e7 : a9 00 __ LDA #$00
09e9 : e5 48 __ SBC T0 + 0 
09eb : 85 13 __ STA P6 
09ed : a9 00 __ LDA #$00
09ef : e5 49 __ SBC T0 + 1 
09f1 : 85 14 __ STA P7 
09f3 : 20 08 0c JSR $0c08 ; (particle_add.s4 + 0)
09f6 : 4c 9e 09 JMP $099e ; (main.s12 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
09f9 : a9 0e __ LDA #$0e
09fb : 8d fa ff STA $fffa 
09fe : a9 0a __ LDA #$0a
0a00 : 8d fb ff STA $fffb 
0a03 : a9 2c __ LDA #$2c
0a05 : 8d fe ff STA $fffe 
0a08 : a9 0a __ LDA #$0a
0a0a : 8d ff ff STA $ffff 
.s3:
0a0d : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0a0e : 48 __ __ PHA
0a0f : 8a __ __ TXA
0a10 : 48 __ __ PHA
0a11 : a9 0a __ LDA #$0a
0a13 : 48 __ __ PHA
0a14 : a9 25 __ LDA #$25
0a16 : 48 __ __ PHA
0a17 : ba __ __ TSX
0a18 : bd 05 01 LDA $0105,x 
0a1b : 48 __ __ PHA
0a1c : a6 01 __ LDX $01 
0a1e : a9 36 __ LDA #$36
0a20 : 85 01 __ STA $01 
0a22 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0a25 : 86 01 __ STX $01 
0a27 : 68 __ __ PLA
0a28 : aa __ __ TAX
0a29 : 68 __ __ PLA
0a2a : 40 __ __ RTI
0a2b : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0a2c : 48 __ __ PHA
0a2d : 8a __ __ TXA
0a2e : 48 __ __ PHA
0a2f : a9 0a __ LDA #$0a
0a31 : 48 __ __ PHA
0a32 : a9 25 __ LDA #$25
0a34 : 48 __ __ PHA
0a35 : ba __ __ TSX
0a36 : bd 05 01 LDA $0105,x 
0a39 : 48 __ __ PHA
0a3a : a6 01 __ LDX $01 
0a3c : a9 36 __ LDA #$36
0a3e : 85 01 __ STA $01 
0a40 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0a43 : a4 0d __ LDY P0 ; (mode + 0)
0a45 : c0 02 __ CPY #$02
0a47 : d0 09 __ BNE $0a52 ; (vic_setmode.s5 + 0)
.s10:
0a49 : a9 5b __ LDA #$5b
0a4b : 8d 11 d0 STA $d011 
.s8:
0a4e : a9 08 __ LDA #$08
0a50 : d0 0c __ BNE $0a5e ; (vic_setmode.s7 + 0)
.s5:
0a52 : b0 36 __ BCS $0a8a ; (vic_setmode.s6 + 0)
.s9:
0a54 : a9 1b __ LDA #$1b
0a56 : 8d 11 d0 STA $d011 
0a59 : 98 __ __ TYA
0a5a : f0 f2 __ BEQ $0a4e ; (vic_setmode.s8 + 0)
.s11:
0a5c : a9 18 __ LDA #$18
.s7:
0a5e : 8d 16 d0 STA $d016 
0a61 : ad 00 dd LDA $dd00 
0a64 : 29 fc __ AND #$fc
0a66 : 85 1b __ STA ACCU + 0 
0a68 : a5 0f __ LDA P2 ; (text + 1)
0a6a : 0a __ __ ASL
0a6b : 2a __ __ ROL
0a6c : 29 01 __ AND #$01
0a6e : 2a __ __ ROL
0a6f : 49 03 __ EOR #$03
0a71 : 05 1b __ ORA ACCU + 0 
0a73 : 8d 00 dd STA $dd00 
0a76 : a5 0f __ LDA P2 ; (text + 1)
0a78 : 29 3c __ AND #$3c
0a7a : 0a __ __ ASL
0a7b : 0a __ __ ASL
0a7c : 85 1b __ STA ACCU + 0 
0a7e : a5 11 __ LDA P4 ; (font + 1)
0a80 : 29 38 __ AND #$38
0a82 : 4a __ __ LSR
0a83 : 4a __ __ LSR
0a84 : 05 1b __ ORA ACCU + 0 
0a86 : 8d 18 d0 STA $d018 
.s3:
0a89 : 60 __ __ RTS
.s6:
0a8a : a9 3b __ LDA #$3b
0a8c : 8d 11 d0 STA $d011 
0a8f : c0 03 __ CPY #$03
0a91 : d0 c9 __ BNE $0a5c ; (vic_setmode.s11 + 0)
0a93 : f0 b9 __ BEQ $0a4e ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0a95 : a5 0f __ LDA P2 
0a97 : a6 12 __ LDX P5 
0a99 : f0 0c __ BEQ $0aa7 ; (memset.s4 + 18)
0a9b : a0 00 __ LDY #$00
0a9d : 91 0d __ STA (P0),y ; (dst + 0)
0a9f : c8 __ __ INY
0aa0 : d0 fb __ BNE $0a9d ; (memset.s4 + 8)
0aa2 : e6 0e __ INC P1 ; (dst + 1)
0aa4 : ca __ __ DEX
0aa5 : d0 f6 __ BNE $0a9d ; (memset.s4 + 8)
0aa7 : a4 11 __ LDY P4 
0aa9 : f0 05 __ BEQ $0ab0 ; (memset.s4 + 27)
0aab : 88 __ __ DEY
0aac : 91 0d __ STA (P0),y ; (dst + 0)
0aae : d0 fb __ BNE $0aab ; (memset.s4 + 22)
0ab0 : a5 0d __ LDA P0 ; (dst + 0)
0ab2 : 85 1b __ STA ACCU + 0 
0ab4 : a5 0e __ LDA P1 ; (dst + 1)
0ab6 : 85 1c __ STA ACCU + 1 
.s3:
0ab8 : 60 __ __ RTS
--------------------------------------------------------------------
particle_init: ; particle_init()->void
;  62, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_stripe.c"
.s4:
0ab9 : a9 e0 __ LDA #$e0
0abb : a0 00 __ LDY #$00
0abd : a2 00 __ LDX #$00
.l6:
0abf : 85 1c __ STA ACCU + 1 
0ac1 : 99 c4 0c STA $0cc4,y ; (Hirows[0] + 1)
0ac4 : 8a __ __ TXA
0ac5 : 99 c3 0c STA $0cc3,y ; (Hirows[0] + 0)
0ac8 : 18 __ __ CLC
0ac9 : 69 40 __ ADC #$40
0acb : aa __ __ TAX
0acc : a5 1c __ LDA ACCU + 1 
0ace : 69 01 __ ADC #$01
0ad0 : c8 __ __ INY
0ad1 : c8 __ __ INY
0ad2 : c0 32 __ CPY #$32
0ad4 : d0 e9 __ BNE $0abf ; (particle_init.l6 + 0)
.s5:
0ad6 : a9 00 __ LDA #$00
0ad8 : 8d f5 0c STA $0cf5 ; (pfirst + 0)
0adb : a9 01 __ LDA #$01
0add : 8d f6 0c STA $0cf6 ; (pfree + 0)
0ae0 : aa __ __ TAX
0ae1 : 18 __ __ CLC
.l7:
0ae2 : 69 01 __ ADC #$01
0ae4 : 9d 00 16 STA $1600,x ; (particles[0].next + 0)
0ae7 : c9 ff __ CMP #$ff
0ae9 : aa __ __ TAX
0aea : 90 f6 __ BCC $0ae2 ; (particle_init.l7 + 0)
.s3:
0aec : 60 __ __ RTS
--------------------------------------------------------------------
particle_move: ; particle_move()->void
; 104, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_stripe.c"
.s4:
0aed : ad f5 0c LDA $0cf5 ; (pfirst + 0)
0af0 : d0 01 __ BNE $0af3 ; (particle_move.s5 + 0)
.s3:
0af2 : 60 __ __ RTS
.s5:
0af3 : 85 46 __ STA T6 + 0 
0af5 : a9 00 __ LDA #$00
0af7 : 85 47 __ STA T7 + 0 
.l6:
0af9 : a6 46 __ LDX T6 + 0 
0afb : bd 00 0d LDA $0d00,x ; (particles[0].px + 0)
0afe : 0a __ __ ASL
0aff : bd 00 0e LDA $0e00,x ; (particles[0].px + 0)
0b02 : 2a __ __ ROL
0b03 : 85 0d __ STA P0 
0b05 : bd 00 0f LDA $0f00,x ; (particles[0].py + 0)
0b08 : 0a __ __ ASL
0b09 : bd 00 10 LDA $1000,x ; (particles[0].py + 0)
0b0c : 2a __ __ ROL
0b0d : 85 0e __ STA P1 
0b0f : 20 9e 0b JSR $0b9e ; (pix_clr.s4 + 0)
0b12 : a6 46 __ LDX T6 + 0 
0b14 : bd 00 0d LDA $0d00,x ; (particles[0].px + 0)
0b17 : 18 __ __ CLC
0b18 : 7d 00 11 ADC $1100,x ; (particles[0].vx + 0)
0b1b : 85 43 __ STA T0 + 0 
0b1d : 9d 00 0d STA $0d00,x ; (particles[0].px + 0)
0b20 : bd 00 0e LDA $0e00,x ; (particles[0].px + 0)
0b23 : 7d 00 12 ADC $1200,x ; (particles[0].vx + 0)
0b26 : 9d 00 0e STA $0e00,x ; (particles[0].px + 0)
0b29 : a8 __ __ TAY
0b2a : bd 00 0f LDA $0f00,x ; (particles[0].py + 0)
0b2d : 18 __ __ CLC
0b2e : 7d 00 13 ADC $1300,x ; (particles[0].vy + 0)
0b31 : 85 44 __ STA T3 + 0 
0b33 : 9d 00 0f STA $0f00,x ; (particles[0].py + 0)
0b36 : bd 00 10 LDA $1000,x ; (particles[0].py + 0)
0b39 : 7d 00 14 ADC $1400,x ; (particles[0].vy + 0)
0b3c : 85 45 __ STA T3 + 1 
0b3e : 9d 00 10 STA $1000,x ; (particles[0].py + 0)
0b41 : bd 00 13 LDA $1300,x ; (particles[0].vy + 0)
0b44 : 18 __ __ CLC
0b45 : 69 08 __ ADC #$08
0b47 : 9d 00 13 STA $1300,x ; (particles[0].vy + 0)
0b4a : 90 03 __ BCC $0b4f ; (particle_move.s14 + 0)
.s13:
0b4c : fe 00 14 INC $1400,x ; (particles[0].vy + 0)
.s14:
0b4f : c0 50 __ CPY #$50
0b51 : b0 27 __ BCS $0b7a ; (particle_move.s9 + 0)
.s7:
0b53 : a5 45 __ LDA T3 + 1 
0b55 : c9 32 __ CMP #$32
0b57 : b0 21 __ BCS $0b7a ; (particle_move.s9 + 0)
.s8:
0b59 : bd 00 15 LDA $1500,x ; (particles[0].pat + 0)
0b5c : 85 0f __ STA P2 
0b5e : 98 __ __ TYA
0b5f : 06 43 __ ASL T0 + 0 
0b61 : 2a __ __ ROL
0b62 : 85 0d __ STA P0 
0b64 : a5 45 __ LDA T3 + 1 
0b66 : 06 44 __ ASL T3 + 0 
0b68 : 2a __ __ ROL
0b69 : 85 0e __ STA P1 
0b6b : 20 d2 0b JSR $0bd2 ; (pix_set.s4 + 0)
0b6e : a6 46 __ LDX T6 + 0 
0b70 : 86 47 __ STX T7 + 0 
0b72 : bd 00 16 LDA $1600,x ; (particles[0].next + 0)
0b75 : 85 46 __ STA T6 + 0 
0b77 : d0 80 __ BNE $0af9 ; (particle_move.l6 + 0)
0b79 : 60 __ __ RTS
.s9:
0b7a : bd 00 16 LDA $1600,x ; (particles[0].next + 0)
0b7d : 85 1b __ STA ACCU + 0 
0b7f : a4 47 __ LDY T7 + 0 
0b81 : f0 05 __ BEQ $0b88 ; (particle_move.s10 + 0)
.s12:
0b83 : 99 00 16 STA $1600,y ; (particles[0].next + 0)
0b86 : b0 03 __ BCS $0b8b ; (particle_move.s11 + 0)
.s10:
0b88 : 8d f5 0c STA $0cf5 ; (pfirst + 0)
.s11:
0b8b : ad f6 0c LDA $0cf6 ; (pfree + 0)
0b8e : 8e f6 0c STX $0cf6 ; (pfree + 0)
0b91 : 9d 00 16 STA $1600,x ; (particles[0].next + 0)
0b94 : a5 1b __ LDA ACCU + 0 
0b96 : 85 46 __ STA T6 + 0 
0b98 : f0 03 __ BEQ $0b9d ; (particle_move.s11 + 18)
0b9a : 4c f9 0a JMP $0af9 ; (particle_move.l6 + 0)
0b9d : 60 __ __ RTS
--------------------------------------------------------------------
pix_clr: ; pix_clr(u8,u8)->void
;  48, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_stripe.c"
.s4:
0b9e : a5 0d __ LDA P0 ; (px + 0)
0ba0 : 29 fc __ AND #$fc
0ba2 : 0a __ __ ASL
0ba3 : 85 1b __ STA ACCU + 0 
0ba5 : a9 00 __ LDA #$00
0ba7 : 2a __ __ ROL
0ba8 : a8 __ __ TAY
0ba9 : a5 0e __ LDA P1 ; (py + 0)
0bab : 29 7c __ AND #$7c
0bad : 4a __ __ LSR
0bae : aa __ __ TAX
0baf : bd c3 0c LDA $0cc3,x ; (Hirows[0] + 0)
0bb2 : 65 1b __ ADC ACCU + 0 
0bb4 : 85 1b __ STA ACCU + 0 
0bb6 : 98 __ __ TYA
0bb7 : 7d c4 0c ADC $0cc4,x ; (Hirows[0] + 1)
0bba : 85 1c __ STA ACCU + 1 
0bbc : a5 0e __ LDA P1 ; (py + 0)
0bbe : 29 03 __ AND #$03
0bc0 : 0a __ __ ASL
0bc1 : a8 __ __ TAY
0bc2 : a5 0d __ LDA P0 ; (px + 0)
0bc4 : 29 03 __ AND #$03
0bc6 : aa __ __ TAX
0bc7 : bd b9 0c LDA $0cb9,x ; (clrmask[0] + 0)
0bca : 31 1b __ AND (ACCU + 0),y 
0bcc : 91 1b __ STA (ACCU + 0),y 
0bce : c8 __ __ INY
0bcf : 91 1b __ STA (ACCU + 0),y 
.s3:
0bd1 : 60 __ __ RTS
--------------------------------------------------------------------
pix_set: ; pix_set(u8,u8,u8)->void
;  34, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_stripe.c"
.s4:
0bd2 : a5 0d __ LDA P0 ; (px + 0)
0bd4 : 29 fc __ AND #$fc
0bd6 : 0a __ __ ASL
0bd7 : 85 1b __ STA ACCU + 0 
0bd9 : a9 00 __ LDA #$00
0bdb : 2a __ __ ROL
0bdc : a8 __ __ TAY
0bdd : a5 0e __ LDA P1 ; (py + 0)
0bdf : 29 7c __ AND #$7c
0be1 : 4a __ __ LSR
0be2 : aa __ __ TAX
0be3 : bd c3 0c LDA $0cc3,x ; (Hirows[0] + 0)
0be6 : 65 1b __ ADC ACCU + 0 
0be8 : 85 1b __ STA ACCU + 0 
0bea : 98 __ __ TYA
0beb : 7d c4 0c ADC $0cc4,x ; (Hirows[0] + 1)
0bee : 85 1c __ STA ACCU + 1 
0bf0 : a5 0e __ LDA P1 ; (py + 0)
0bf2 : 29 03 __ AND #$03
0bf4 : 0a __ __ ASL
0bf5 : a8 __ __ TAY
0bf6 : a5 0d __ LDA P0 ; (px + 0)
0bf8 : 29 03 __ AND #$03
0bfa : aa __ __ TAX
0bfb : a5 0f __ LDA P2 ; (pat + 0)
0bfd : 3d bd 0c AND $0cbd,x ; (setmask[0] + 0)
0c00 : 11 1b __ ORA (ACCU + 0),y 
0c02 : 91 1b __ STA (ACCU + 0),y 
0c04 : c8 __ __ INY
0c05 : 91 1b __ STA (ACCU + 0),y 
.s3:
0c07 : 60 __ __ RTS
--------------------------------------------------------------------
particle_add: ; particle_add(i16,i16,i16,i16,u8)->void
;  78, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_stripe.c"
.s4:
0c08 : ac f6 0c LDY $0cf6 ; (pfree + 0)
0c0b : f0 3c __ BEQ $0c49 ; (particle_add.s3 + 0)
.s5:
0c0d : b9 00 16 LDA $1600,y ; (particles[0].next + 0)
0c10 : 8d f6 0c STA $0cf6 ; (pfree + 0)
0c13 : ad f5 0c LDA $0cf5 ; (pfirst + 0)
0c16 : 8c f5 0c STY $0cf5 ; (pfirst + 0)
0c19 : 99 00 16 STA $1600,y ; (particles[0].next + 0)
0c1c : a5 0d __ LDA P0 ; (px + 0)
0c1e : 99 00 0d STA $0d00,y ; (particles[0].px + 0)
0c21 : a5 0e __ LDA P1 ; (px + 1)
0c23 : 99 00 0e STA $0e00,y ; (particles[0].px + 0)
0c26 : a5 0f __ LDA P2 ; (py + 0)
0c28 : 99 00 0f STA $0f00,y ; (particles[0].py + 0)
0c2b : a5 10 __ LDA P3 ; (py + 1)
0c2d : 99 00 10 STA $1000,y ; (particles[0].py + 0)
0c30 : a5 11 __ LDA P4 ; (vx + 0)
0c32 : 99 00 11 STA $1100,y ; (particles[0].vx + 0)
0c35 : a5 12 __ LDA P5 ; (vx + 1)
0c37 : 99 00 12 STA $1200,y ; (particles[0].vx + 0)
0c3a : a5 13 __ LDA P6 ; (vy + 0)
0c3c : 99 00 13 STA $1300,y ; (particles[0].vy + 0)
0c3f : a5 14 __ LDA P7 ; (vy + 1)
0c41 : 99 00 14 STA $1400,y ; (particles[0].vy + 0)
0c44 : a5 15 __ LDA P8 ; (pat + 0)
0c46 : 99 00 15 STA $1500,y ; (particles[0].pat + 0)
.s3:
0c49 : 60 __ __ RTS
--------------------------------------------------------------------
rnorm: ; rnorm()->i16
; 160, "/home/honza/projects/c64/projects/oscar64/samples/particles/fireworks_stripe.c"
.s4:
0c4a : 20 91 0c JSR $0c91 ; (rand.s4 + 0)
0c4d : a5 1b __ LDA ACCU + 0 
0c4f : 85 43 __ STA T1 + 0 
0c51 : a5 1c __ LDA ACCU + 1 
0c53 : 29 0f __ AND #$0f
0c55 : 85 44 __ STA T1 + 1 
0c57 : 20 91 0c JSR $0c91 ; (rand.s4 + 0)
0c5a : 18 __ __ CLC
0c5b : a5 1b __ LDA ACCU + 0 
0c5d : 65 43 __ ADC T1 + 0 
0c5f : 85 43 __ STA T1 + 0 
0c61 : a5 1c __ LDA ACCU + 1 
0c63 : 29 0f __ AND #$0f
0c65 : 65 44 __ ADC T1 + 1 
0c67 : 85 44 __ STA T1 + 1 
0c69 : 20 91 0c JSR $0c91 ; (rand.s4 + 0)
0c6c : 18 __ __ CLC
0c6d : a5 1b __ LDA ACCU + 0 
0c6f : 65 43 __ ADC T1 + 0 
0c71 : 85 43 __ STA T1 + 0 
0c73 : a5 1c __ LDA ACCU + 1 
0c75 : 29 0f __ AND #$0f
0c77 : 65 44 __ ADC T1 + 1 
0c79 : 85 44 __ STA T1 + 1 
0c7b : 20 91 0c JSR $0c91 ; (rand.s4 + 0)
0c7e : 18 __ __ CLC
0c7f : a5 1b __ LDA ACCU + 0 
0c81 : 65 43 __ ADC T1 + 0 
0c83 : 85 1b __ STA ACCU + 0 
0c85 : a5 1c __ LDA ACCU + 1 
0c87 : 29 0f __ AND #$0f
0c89 : 65 44 __ ADC T1 + 1 
0c8b : 38 __ __ SEC
0c8c : e9 20 __ SBC #$20
0c8e : 85 1c __ STA ACCU + 1 
.s3:
0c90 : 60 __ __ RTS
--------------------------------------------------------------------
rand: ; rand()->u16
;  68, "/home/honza/projects/c64/projects/oscar64/include/stdlib.h"
.s4:
0c91 : ad c2 0c LDA $0cc2 ; (seed + 1)
0c94 : 4a __ __ LSR
0c95 : ad c1 0c LDA $0cc1 ; (seed + 0)
0c98 : 6a __ __ ROR
0c99 : aa __ __ TAX
0c9a : a9 00 __ LDA #$00
0c9c : 6a __ __ ROR
0c9d : 4d c1 0c EOR $0cc1 ; (seed + 0)
0ca0 : 85 1b __ STA ACCU + 0 
0ca2 : 8a __ __ TXA
0ca3 : 4d c2 0c EOR $0cc2 ; (seed + 1)
0ca6 : 85 1c __ STA ACCU + 1 
0ca8 : 4a __ __ LSR
0ca9 : 45 1b __ EOR ACCU + 0 
0cab : 8d c1 0c STA $0cc1 ; (seed + 0)
0cae : 85 1b __ STA ACCU + 0 
0cb0 : 45 1c __ EOR ACCU + 1 
0cb2 : 8d c2 0c STA $0cc2 ; (seed + 1)
0cb5 : 85 1c __ STA ACCU + 1 
.s3:
0cb7 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0cb8 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
clrmask:
0cb9 : __ __ __ BYT 3f cf f3 fc                                     : ?...
--------------------------------------------------------------------
setmask:
0cbd : __ __ __ BYT c0 30 0c 03                                     : .0..
--------------------------------------------------------------------
seed:
0cc1 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
Hirows:
0cc3 : __ __ __ BSS	50
--------------------------------------------------------------------
pfirst:
0cf5 : __ __ __ BSS	1
--------------------------------------------------------------------
pfree:
0cf6 : __ __ __ BSS	1
--------------------------------------------------------------------
particles:
0d00 : __ __ __ BSS	2560
