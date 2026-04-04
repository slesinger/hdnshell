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
080e : 8e c6 23 STX $23c6 ; (spentry + 0)
0811 : a2 24 __ LDX #$24
0813 : a0 38 __ LDY #$38
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 25 __ CPX #$25
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
083b : a9 c1 __ LDA #$c1
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
; 127, "/home/honza/projects/c64/projects/oscar64/samples/hires/cube3d.c"
.s1:
0880 : a2 06 __ LDX #$06
0882 : b5 53 __ LDA T1 + 0,x 
0884 : 9d c3 9f STA $9fc3,x ; (main@stack + 0)
0887 : ca __ __ DEX
0888 : 10 f8 __ BPL $0882 ; (main.s1 + 2)
.s4:
088a : 20 36 0a JSR $0a36 ; (init.s4 + 0)
088d : a9 00 __ LDA #$00
088f : a8 __ __ TAY
0890 : aa __ __ TAX
.l5:
0891 : 4a __ __ LSR
0892 : a9 00 __ LDA #$00
0894 : 69 ff __ ADC #$ff
0896 : 29 e0 __ AND #$e0
0898 : 49 f0 __ EOR #$f0
089a : 9d 39 24 STA $2439,x ; (corners[0].v[0] + 1)
089d : 98 __ __ TYA
089e : 29 02 __ AND #$02
08a0 : c9 01 __ CMP #$01
08a2 : a9 00 __ LDA #$00
08a4 : 9d 38 24 STA $2438,x ; (corners[0].v[0] + 0)
08a7 : 69 ff __ ADC #$ff
08a9 : 29 e0 __ AND #$e0
08ab : 49 f0 __ EOR #$f0
08ad : 9d 3b 24 STA $243b,x ; (corners[0].v[0] + 3)
08b0 : 98 __ __ TYA
08b1 : 29 04 __ AND #$04
08b3 : c9 01 __ CMP #$01
08b5 : a9 00 __ LDA #$00
08b7 : 9d 3a 24 STA $243a,x ; (corners[0].v[0] + 2)
08ba : 69 ff __ ADC #$ff
08bc : 29 e0 __ AND #$e0
08be : 49 f0 __ EOR #$f0
08c0 : 9d 3d 24 STA $243d,x ; (corners[0].v[0] + 5)
08c3 : a9 00 __ LDA #$00
08c5 : 9d 3c 24 STA $243c,x ; (corners[0].v[0] + 4)
08c8 : 8a __ __ TXA
08c9 : 18 __ __ CLC
08ca : 69 06 __ ADC #$06
08cc : aa __ __ TAX
08cd : c8 __ __ INY
08ce : 98 __ __ TYA
08cf : c0 08 __ CPY #$08
08d1 : d0 be __ BNE $0891 ; (main.l5 + 0)
.s6:
08d3 : a9 00 __ LDA #$00
08d5 : 85 57 __ STA T2 + 0 
.l7:
08d7 : 85 1b __ STA ACCU + 0 
08d9 : a9 df __ LDA #$df
08db : 85 15 __ STA P8 
08dd : a9 23 __ LDA #$23
08df : 85 16 __ STA P9 
08e1 : a9 00 __ LDA #$00
08e3 : 85 1c __ STA ACCU + 1 
08e5 : 20 7f 23 JSR $237f ; (sint16_to_float + 0)
08e8 : a5 1b __ LDA ACCU + 0 
08ea : 85 53 __ STA T1 + 0 
08ec : a5 1c __ LDA ACCU + 1 
08ee : 85 54 __ STA T1 + 1 
08f0 : a5 1d __ LDA ACCU + 2 
08f2 : 85 55 __ STA T1 + 2 
08f4 : a5 1e __ LDA ACCU + 3 
08f6 : 85 56 __ STA T1 + 3 
08f8 : a9 cc __ LDA #$cc
08fa : 85 04 __ STA WORK + 1 
08fc : 85 05 __ STA WORK + 2 
08fe : a9 cd __ LDA #$cd
0900 : 85 03 __ STA WORK + 0 
0902 : a9 3d __ LDA #$3d
0904 : 85 06 __ STA WORK + 3 
0906 : 20 53 20 JSR $2053 ; (freg + 20)
0909 : 20 71 21 JSR $2171 ; (crt_fmul + 0)
090c : a5 1b __ LDA ACCU + 0 
090e : 8d f2 9f STA $9ff2 ; (sstack + 0)
0911 : a5 1c __ LDA ACCU + 1 
0913 : 8d f3 9f STA $9ff3 ; (sstack + 1)
0916 : a5 1d __ LDA ACCU + 2 
0918 : 8d f4 9f STA $9ff4 ; (sstack + 2)
091b : a5 1e __ LDA ACCU + 3 
091d : 8d f5 9f STA $9ff5 ; (sstack + 3)
0920 : 20 94 0b JSR $0b94 ; (f12mat3_set_rotate_x.s4 + 0)
0923 : a9 8f __ LDA #$8f
0925 : 85 1b __ STA ACCU + 0 
0927 : a9 3d __ LDA #$3d
0929 : 85 1e __ STA ACCU + 3 
092b : a9 c2 __ LDA #$c2
092d : 85 1c __ STA ACCU + 1 
092f : a9 75 __ LDA #$75
0931 : 85 1d __ STA ACCU + 2 
0933 : a2 53 __ LDX #$53
0935 : 20 43 20 JSR $2043 ; (freg + 4)
0938 : 20 71 21 JSR $2171 ; (crt_fmul + 0)
093b : a5 1b __ LDA ACCU + 0 
093d : 8d f2 9f STA $9ff2 ; (sstack + 0)
0940 : a9 68 __ LDA #$68
0942 : 85 15 __ STA P8 
0944 : a9 24 __ LDA #$24
0946 : 85 16 __ STA P9 
0948 : a5 1c __ LDA ACCU + 1 
094a : 8d f3 9f STA $9ff3 ; (sstack + 1)
094d : a5 1d __ LDA ACCU + 2 
094f : 8d f4 9f STA $9ff4 ; (sstack + 2)
0952 : a5 1e __ LDA ACCU + 3 
0954 : 8d f5 9f STA $9ff5 ; (sstack + 3)
0957 : 20 48 0e JSR $0e48 ; (f12mat3_set_rotate_y.s4 + 0)
095a : a9 df __ LDA #$df
095c : 85 11 __ STA P4 
095e : a9 24 __ LDA #$24
0960 : 85 14 __ STA P7 
0962 : a9 23 __ LDA #$23
0964 : 85 12 __ STA P5 
0966 : a9 68 __ LDA #$68
0968 : 85 13 __ STA P6 
096a : 20 67 0f JSR $0f67 ; (f12mat3_mmul.s4 + 0)
096d : a9 00 __ LDA #$00
096f : 85 59 __ STA T9 + 0 
0971 : 85 58 __ STA T7 + 0 
0973 : a9 df __ LDA #$df
0975 : 85 13 __ STA P6 
0977 : a9 23 __ LDA #$23
0979 : 85 14 __ STA P7 
097b : 18 __ __ CLC
.l13:
097c : a9 38 __ LDA #$38
097e : 65 58 __ ADC T7 + 0 
0980 : 85 15 __ STA P8 
0982 : a9 d6 __ LDA #$d6
0984 : 85 11 __ STA P4 
0986 : a9 9f __ LDA #$9f
0988 : 85 12 __ STA P5 
098a : a9 24 __ LDA #$24
098c : 69 00 __ ADC #$00
098e : 85 16 __ STA P9 
0990 : 20 57 11 JSR $1157 ; (f12vec3_mmul.s4 + 0)
0993 : ad d6 9f LDA $9fd6 ; (vd.v[0] + 0)
0996 : 85 0d __ STA P0 
0998 : ad d7 9f LDA $9fd7 ; (vd.v[0] + 1)
099b : 85 0e __ STA P1 
099d : ad da 9f LDA $9fda ; (vd.v[0] + 4)
09a0 : 85 11 __ STA P4 
09a2 : a9 8c __ LDA #$8c
09a4 : 85 0f __ STA P2 
09a6 : a9 00 __ LDA #$00
09a8 : 85 10 __ STA P3 
09aa : ad db 9f LDA $9fdb ; (vd.v[0] + 5)
09ad : 18 __ __ CLC
09ae : 69 40 __ ADC #$40
09b0 : 85 12 __ STA P5 
09b2 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
09b5 : a9 8c __ LDA #$8c
09b7 : 85 0f __ STA P2 
09b9 : a9 00 __ LDA #$00
09bb : 85 10 __ STA P3 
09bd : 18 __ __ CLC
09be : a5 1b __ LDA ACCU + 0 
09c0 : 69 a0 __ ADC #$a0
09c2 : a6 59 __ LDX T9 + 0 
09c4 : 9d 7a 24 STA $247a,x ; (tcorners[0].x + 0)
09c7 : a5 1c __ LDA ACCU + 1 
09c9 : 69 00 __ ADC #$00
09cb : 9d 82 24 STA $2482,x ; (tcorners[0].x + 0)
09ce : ad d8 9f LDA $9fd8 ; (vd.v[0] + 2)
09d1 : 85 0d __ STA P0 
09d3 : ad d9 9f LDA $9fd9 ; (vd.v[0] + 3)
09d6 : 85 0e __ STA P1 
09d8 : ad da 9f LDA $9fda ; (vd.v[0] + 4)
09db : 85 11 __ STA P4 
09dd : ad db 9f LDA $9fdb ; (vd.v[0] + 5)
09e0 : 18 __ __ CLC
09e1 : 69 40 __ ADC #$40
09e3 : 85 12 __ STA P5 
09e5 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
09e8 : 18 __ __ CLC
09e9 : a5 1b __ LDA ACCU + 0 
09eb : 69 64 __ ADC #$64
09ed : a6 59 __ LDX T9 + 0 
09ef : e8 __ __ INX
09f0 : 86 59 __ STX T9 + 0 
09f2 : 9d 89 24 STA $2489,x ; (tcorners[7].x + 0)
09f5 : a5 1c __ LDA ACCU + 1 
09f7 : 69 00 __ ADC #$00
09f9 : 9d 91 24 STA $2491,x ; (tcorners[7].y + 0)
09fc : 18 __ __ CLC
09fd : a5 58 __ LDA T7 + 0 
09ff : 69 06 __ ADC #$06
0a01 : 85 58 __ STA T7 + 0 
0a03 : e0 08 __ CPX #$08
0a05 : b0 03 __ BCS $0a0a ; (main.s8 + 0)
0a07 : 4c 7c 09 JMP $097c ; (main.l13 + 0)
.s8:
0a0a : a5 57 __ LDA T2 + 0 
0a0c : d0 06 __ BNE $0a14 ; (main.s12 + 0)
.s9:
0a0e : 20 a5 1e JSR $1ea5 ; (xorCube.s1 + 0)
0a11 : 4c 17 0a JMP $0a17 ; (main.s10 + 0)
.s12:
0a14 : 20 af 12 JSR $12af ; (xor2Cube.s1 + 0)
.s10:
0a17 : e6 57 __ INC T2 + 0 
0a19 : a5 57 __ LDA T2 + 0 
0a1b : c9 64 __ CMP #$64
0a1d : b0 03 __ BCS $0a22 ; (main.s11 + 0)
0a1f : 4c d7 08 JMP $08d7 ; (main.l7 + 0)
.s11:
0a22 : 20 f0 1f JSR $1ff0 ; (done.s4 + 0)
0a25 : a9 00 __ LDA #$00
0a27 : 85 1b __ STA ACCU + 0 
0a29 : 85 1c __ STA ACCU + 1 
.s3:
0a2b : a2 06 __ LDX #$06
0a2d : bd c3 9f LDA $9fc3,x ; (main@stack + 0)
0a30 : 95 53 __ STA T1 + 0,x 
0a32 : ca __ __ DEX
0a33 : 10 f8 __ BPL $0a2d ; (main.s3 + 2)
0a35 : 60 __ __ RTS
--------------------------------------------------------------------
init: ; init()->void
;  16, "/home/honza/projects/c64/projects/oscar64/samples/hires/cube3d.c"
.s4:
0a36 : 20 a2 0a JSR $0aa2 ; (mmap_trampoline.s4 + 0)
0a39 : a9 00 __ LDA #$00
0a3b : 85 0f __ STA P2 
0a3d : 85 10 __ STA P3 
0a3f : a9 30 __ LDA #$30
0a41 : 85 01 __ STA $01 
0a43 : a9 40 __ LDA #$40
0a45 : 85 11 __ STA P4 
0a47 : a9 1f __ LDA #$1f
0a49 : 85 12 __ STA P5 
0a4b : a9 01 __ LDA #$01
0a4d : a2 fa __ LDX #$fa
.l6:
0a4f : ca __ __ DEX
0a50 : 9d 00 d0 STA $d000,x 
0a53 : 9d fa d0 STA $d0fa,x 
0a56 : 9d f4 d1 STA $d1f4,x 
0a59 : 9d ee d2 STA $d2ee,x 
0a5c : d0 f1 __ BNE $0a4f ; (init.l6 + 0)
.s5:
0a5e : a9 00 __ LDA #$00
0a60 : 85 0d __ STA P0 
0a62 : a9 e0 __ LDA #$e0
0a64 : 85 0e __ STA P1 
0a66 : 20 ec 0a JSR $0aec ; (memset.s4 + 0)
0a69 : a9 00 __ LDA #$00
0a6b : 85 10 __ STA P3 
0a6d : 85 0e __ STA P1 
0a6f : a9 35 __ LDA #$35
0a71 : 85 01 __ STA $01 
0a73 : a9 03 __ LDA #$03
0a75 : 85 0d __ STA P0 
0a77 : a9 e0 __ LDA #$e0
0a79 : 85 11 __ STA P4 
0a7b : a9 d0 __ LDA #$d0
0a7d : 85 0f __ STA P2 
0a7f : 20 10 0b JSR $0b10 ; (vic_setmode.s4 + 0)
0a82 : a9 00 __ LDA #$00
0a84 : 85 0f __ STA P2 
0a86 : a9 e0 __ LDA #$e0
0a88 : 85 10 __ STA P3 
0a8a : a9 28 __ LDA #$28
0a8c : 85 11 __ STA P4 
0a8e : a9 19 __ LDA #$19
0a90 : 85 12 __ STA P5 
0a92 : a9 01 __ LDA #$01
0a94 : 8d 20 d0 STA $d020 
0a97 : a9 d7 __ LDA #$d7
0a99 : 85 0d __ STA P0 
0a9b : a9 23 __ LDA #$23
0a9d : 85 0e __ STA P1 
0a9f : 4c 62 0b JMP $0b62 ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0aa2 : a9 b7 __ LDA #$b7
0aa4 : 8d fa ff STA $fffa 
0aa7 : a9 0a __ LDA #$0a
0aa9 : 8d fb ff STA $fffb 
0aac : a9 d5 __ LDA #$d5
0aae : 8d fe ff STA $fffe 
0ab1 : a9 0a __ LDA #$0a
0ab3 : 8d ff ff STA $ffff 
.s3:
0ab6 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0ab7 : 48 __ __ PHA
0ab8 : 8a __ __ TXA
0ab9 : 48 __ __ PHA
0aba : a9 0a __ LDA #$0a
0abc : 48 __ __ PHA
0abd : a9 ce __ LDA #$ce
0abf : 48 __ __ PHA
0ac0 : ba __ __ TSX
0ac1 : bd 05 01 LDA $0105,x 
0ac4 : 48 __ __ PHA
0ac5 : a6 01 __ LDX $01 
0ac7 : a9 36 __ LDA #$36
0ac9 : 85 01 __ STA $01 
0acb : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0ace : 86 01 __ STX $01 
0ad0 : 68 __ __ PLA
0ad1 : aa __ __ TAX
0ad2 : 68 __ __ PLA
0ad3 : 40 __ __ RTI
0ad4 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0ad5 : 48 __ __ PHA
0ad6 : 8a __ __ TXA
0ad7 : 48 __ __ PHA
0ad8 : a9 0a __ LDA #$0a
0ada : 48 __ __ PHA
0adb : a9 ce __ LDA #$ce
0add : 48 __ __ PHA
0ade : ba __ __ TSX
0adf : bd 05 01 LDA $0105,x 
0ae2 : 48 __ __ PHA
0ae3 : a6 01 __ LDX $01 
0ae5 : a9 36 __ LDA #$36
0ae7 : 85 01 __ STA $01 
0ae9 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0aec : a5 0f __ LDA P2 
0aee : a6 12 __ LDX P5 
0af0 : f0 0c __ BEQ $0afe ; (memset.s4 + 18)
0af2 : a0 00 __ LDY #$00
0af4 : 91 0d __ STA (P0),y ; (dst + 0)
0af6 : c8 __ __ INY
0af7 : d0 fb __ BNE $0af4 ; (memset.s4 + 8)
0af9 : e6 0e __ INC P1 ; (dst + 1)
0afb : ca __ __ DEX
0afc : d0 f6 __ BNE $0af4 ; (memset.s4 + 8)
0afe : a4 11 __ LDY P4 
0b00 : f0 05 __ BEQ $0b07 ; (memset.s4 + 27)
0b02 : 88 __ __ DEY
0b03 : 91 0d __ STA (P0),y ; (dst + 0)
0b05 : d0 fb __ BNE $0b02 ; (memset.s4 + 22)
0b07 : a5 0d __ LDA P0 ; (dst + 0)
0b09 : 85 1b __ STA ACCU + 0 
0b0b : a5 0e __ LDA P1 ; (dst + 1)
0b0d : 85 1c __ STA ACCU + 1 
.s3:
0b0f : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0b10 : a4 0d __ LDY P0 ; (mode + 0)
0b12 : c0 02 __ CPY #$02
0b14 : d0 09 __ BNE $0b1f ; (vic_setmode.s5 + 0)
.s10:
0b16 : a9 5b __ LDA #$5b
0b18 : 8d 11 d0 STA $d011 
.s8:
0b1b : a9 08 __ LDA #$08
0b1d : d0 0c __ BNE $0b2b ; (vic_setmode.s7 + 0)
.s5:
0b1f : b0 36 __ BCS $0b57 ; (vic_setmode.s6 + 0)
.s9:
0b21 : a9 1b __ LDA #$1b
0b23 : 8d 11 d0 STA $d011 
0b26 : 98 __ __ TYA
0b27 : f0 f2 __ BEQ $0b1b ; (vic_setmode.s8 + 0)
.s11:
0b29 : a9 18 __ LDA #$18
.s7:
0b2b : 8d 16 d0 STA $d016 
0b2e : ad 00 dd LDA $dd00 
0b31 : 29 fc __ AND #$fc
0b33 : 85 1b __ STA ACCU + 0 
0b35 : a5 0f __ LDA P2 ; (text + 1)
0b37 : 0a __ __ ASL
0b38 : 2a __ __ ROL
0b39 : 29 01 __ AND #$01
0b3b : 2a __ __ ROL
0b3c : 49 03 __ EOR #$03
0b3e : 05 1b __ ORA ACCU + 0 
0b40 : 8d 00 dd STA $dd00 
0b43 : a5 0f __ LDA P2 ; (text + 1)
0b45 : 29 3c __ AND #$3c
0b47 : 0a __ __ ASL
0b48 : 0a __ __ ASL
0b49 : 85 1b __ STA ACCU + 0 
0b4b : a5 11 __ LDA P4 ; (font + 1)
0b4d : 29 38 __ AND #$38
0b4f : 4a __ __ LSR
0b50 : 4a __ __ LSR
0b51 : 05 1b __ ORA ACCU + 0 
0b53 : 8d 18 d0 STA $d018 
.s3:
0b56 : 60 __ __ RTS
.s6:
0b57 : a9 3b __ LDA #$3b
0b59 : 8d 11 d0 STA $d011 
0b5c : c0 03 __ CPY #$03
0b5e : d0 c9 __ BNE $0b29 ; (vic_setmode.s11 + 0)
0b60 : f0 b9 __ BEQ $0b1b ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0b62 : a5 0f __ LDA P2 ; (data + 0)
0b64 : a0 00 __ LDY #$00
0b66 : 91 0d __ STA (P0),y ; (bm + 0)
0b68 : a5 10 __ LDA P3 ; (data + 1)
0b6a : c8 __ __ INY
0b6b : 91 0d __ STA (P0),y ; (bm + 0)
0b6d : a9 00 __ LDA #$00
0b6f : c8 __ __ INY
0b70 : 91 0d __ STA (P0),y ; (bm + 0)
0b72 : c8 __ __ INY
0b73 : 91 0d __ STA (P0),y ; (bm + 0)
0b75 : a5 11 __ LDA P4 ; (cw + 0)
0b77 : c8 __ __ INY
0b78 : 91 0d __ STA (P0),y ; (bm + 0)
0b7a : a5 12 __ LDA P5 ; (ch + 0)
0b7c : c8 __ __ INY
0b7d : 91 0d __ STA (P0),y ; (bm + 0)
0b7f : a9 00 __ LDA #$00
0b81 : 06 11 __ ASL P4 ; (cw + 0)
0b83 : 2a __ __ ROL
0b84 : 06 11 __ ASL P4 ; (cw + 0)
0b86 : 2a __ __ ROL
0b87 : 06 11 __ ASL P4 ; (cw + 0)
0b89 : 2a __ __ ROL
0b8a : a0 07 __ LDY #$07
0b8c : 91 0d __ STA (P0),y ; (bm + 0)
0b8e : a5 11 __ LDA P4 ; (cw + 0)
0b90 : 88 __ __ DEY
0b91 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0b93 : 60 __ __ RTS
--------------------------------------------------------------------
f12mat3_set_rotate_x: ; f12mat3_set_rotate_x(struct F12Matrix3*,float)->void
; 281, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
0b94 : ad f2 9f LDA $9ff2 ; (sstack + 0)
0b97 : 85 4b __ STA T1 + 0 
0b99 : ad f3 9f LDA $9ff3 ; (sstack + 1)
0b9c : 85 4c __ STA T1 + 1 
0b9e : ad f4 9f LDA $9ff4 ; (sstack + 2)
0ba1 : 85 4d __ STA T1 + 2 
0ba3 : ad f5 9f LDA $9ff5 ; (sstack + 3)
0ba6 : 85 4e __ STA T1 + 3 
0ba8 : a9 db __ LDA #$db
0baa : 85 1b __ STA ACCU + 0 ; (a + 2)
0bac : a9 3f __ LDA #$3f
0bae : 85 1e __ STA ACCU + 3 
0bb0 : a9 0f __ LDA #$0f
0bb2 : 85 1c __ STA ACCU + 1 ; (a + 3)
0bb4 : a9 c9 __ LDA #$c9
0bb6 : 85 1d __ STA ACCU + 2 
0bb8 : a2 4b __ LDX #$4b
0bba : 20 43 20 JSR $2043 ; (freg + 4)
0bbd : 20 8a 20 JSR $208a ; (faddsub + 6)
0bc0 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0bc2 : 85 0d __ STA P0 
0bc4 : a5 1c __ LDA ACCU + 1 ; (a + 3)
0bc6 : 85 0e __ STA P1 
0bc8 : a5 1d __ LDA ACCU + 2 
0bca : 85 0f __ STA P2 
0bcc : a5 1e __ LDA ACCU + 3 
0bce : 85 10 __ STA P3 
0bd0 : 20 b1 0c JSR $0cb1 ; (sin.s4 + 0)
0bd3 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0bd5 : 85 4f __ STA T2 + 0 
0bd7 : a5 1c __ LDA ACCU + 1 ; (a + 3)
0bd9 : 85 50 __ STA T2 + 1 
0bdb : a5 1d __ LDA ACCU + 2 
0bdd : 85 51 __ STA T2 + 2 
0bdf : a5 1e __ LDA ACCU + 3 
0be1 : 85 52 __ STA T2 + 3 
0be3 : a5 4b __ LDA T1 + 0 
0be5 : 85 0d __ STA P0 
0be7 : a5 4c __ LDA T1 + 1 
0be9 : 85 0e __ STA P1 
0beb : a5 4d __ LDA T1 + 2 
0bed : 85 0f __ STA P2 
0bef : a5 4e __ LDA T1 + 3 
0bf1 : 85 10 __ STA P3 
0bf3 : 20 b1 0c JSR $0cb1 ; (sin.s4 + 0)
0bf6 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0bf8 : 85 43 __ STA T0 + 0 
0bfa : a5 1c __ LDA ACCU + 1 ; (a + 3)
0bfc : 85 44 __ STA T0 + 1 
0bfe : a5 1d __ LDA ACCU + 2 
0c00 : 85 45 __ STA T0 + 2 
0c02 : a5 1e __ LDA ACCU + 3 
0c04 : 85 46 __ STA T0 + 3 
0c06 : a9 00 __ LDA #$00
0c08 : a8 __ __ TAY
0c09 : 91 15 __ STA (P8),y ; (m + 0)
0c0b : a9 10 __ LDA #$10
0c0d : c8 __ __ INY
0c0e : 91 15 __ STA (P8),y ; (m + 0)
0c10 : a9 00 __ LDA #$00
0c12 : c8 __ __ INY
0c13 : 91 15 __ STA (P8),y ; (m + 0)
0c15 : c8 __ __ INY
0c16 : 91 15 __ STA (P8),y ; (m + 0)
0c18 : c8 __ __ INY
0c19 : 91 15 __ STA (P8),y ; (m + 0)
0c1b : c8 __ __ INY
0c1c : 91 15 __ STA (P8),y ; (m + 0)
0c1e : c8 __ __ INY
0c1f : 91 15 __ STA (P8),y ; (m + 0)
0c21 : c8 __ __ INY
0c22 : 91 15 __ STA (P8),y ; (m + 0)
0c24 : a0 0c __ LDY #$0c
0c26 : 91 15 __ STA (P8),y ; (m + 0)
0c28 : c8 __ __ INY
0c29 : 91 15 __ STA (P8),y ; (m + 0)
0c2b : 85 1b __ STA ACCU + 0 ; (a + 2)
0c2d : 85 1c __ STA ACCU + 1 ; (a + 3)
0c2f : a9 80 __ LDA #$80
0c31 : 85 1d __ STA ACCU + 2 
0c33 : a9 45 __ LDA #$45
0c35 : 85 1e __ STA ACCU + 3 
0c37 : a2 4f __ LDX #$4f
0c39 : 20 43 20 JSR $2043 ; (freg + 4)
0c3c : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0c3f : a9 00 __ LDA #$00
0c41 : 85 03 __ STA WORK + 0 
0c43 : 85 04 __ STA WORK + 1 
0c45 : 85 05 __ STA WORK + 2 
0c47 : a9 3f __ LDA #$3f
0c49 : 85 06 __ STA WORK + 3 
0c4b : 20 53 20 JSR $2053 ; (freg + 20)
0c4e : 20 8a 20 JSR $208a ; (faddsub + 6)
0c51 : 20 33 23 JSR $2333 ; (f32_to_i16 + 0)
0c54 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0c56 : a0 08 __ LDY #$08
0c58 : 91 15 __ STA (P8),y ; (m + 0)
0c5a : a5 1c __ LDA ACCU + 1 ; (a + 3)
0c5c : c8 __ __ INY
0c5d : 91 15 __ STA (P8),y ; (m + 0)
0c5f : a5 1b __ LDA ACCU + 0 ; (a + 2)
0c61 : a0 10 __ LDY #$10
0c63 : 91 15 __ STA (P8),y ; (m + 0)
0c65 : a5 1c __ LDA ACCU + 1 ; (a + 3)
0c67 : c8 __ __ INY
0c68 : 91 15 __ STA (P8),y ; (m + 0)
0c6a : a9 00 __ LDA #$00
0c6c : 85 1b __ STA ACCU + 0 ; (a + 2)
0c6e : 85 1c __ STA ACCU + 1 ; (a + 3)
0c70 : a9 80 __ LDA #$80
0c72 : 85 1d __ STA ACCU + 2 
0c74 : a9 45 __ LDA #$45
0c76 : 85 1e __ STA ACCU + 3 
0c78 : a2 43 __ LDX #$43
0c7a : 20 43 20 JSR $2043 ; (freg + 4)
0c7d : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0c80 : a9 00 __ LDA #$00
0c82 : 85 03 __ STA WORK + 0 
0c84 : 85 04 __ STA WORK + 1 
0c86 : 85 05 __ STA WORK + 2 
0c88 : a9 3f __ LDA #$3f
0c8a : 85 06 __ STA WORK + 3 
0c8c : 20 53 20 JSR $2053 ; (freg + 20)
0c8f : 20 8a 20 JSR $208a ; (faddsub + 6)
0c92 : 20 33 23 JSR $2333 ; (f32_to_i16 + 0)
0c95 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0c97 : a0 0e __ LDY #$0e
0c99 : 91 15 __ STA (P8),y ; (m + 0)
0c9b : a5 1c __ LDA ACCU + 1 ; (a + 3)
0c9d : c8 __ __ INY
0c9e : 91 15 __ STA (P8),y ; (m + 0)
0ca0 : 38 __ __ SEC
0ca1 : a9 00 __ LDA #$00
0ca3 : e5 1b __ SBC ACCU + 0 ; (a + 2)
0ca5 : a0 0a __ LDY #$0a
0ca7 : 91 15 __ STA (P8),y ; (m + 0)
0ca9 : a9 00 __ LDA #$00
0cab : e5 1c __ SBC ACCU + 1 ; (a + 3)
0cad : c8 __ __ INY
0cae : 91 15 __ STA (P8),y ; (m + 0)
.s3:
0cb0 : 60 __ __ RTS
--------------------------------------------------------------------
sin: ; sin(float)->float
;  12, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
0cb1 : a5 0d __ LDA P0 ; (f + 0)
0cb3 : 85 43 __ STA T0 + 0 
0cb5 : a5 0e __ LDA P1 ; (f + 1)
0cb7 : 85 44 __ STA T0 + 1 
0cb9 : a5 0f __ LDA P2 ; (f + 2)
0cbb : 85 45 __ STA T0 + 2 
0cbd : a5 10 __ LDA P3 ; (f + 3)
0cbf : 29 7f __ AND #$7f
0cc1 : 05 0f __ ORA P2 ; (f + 2)
0cc3 : 05 0e __ ORA P1 ; (f + 1)
0cc5 : 05 0d __ ORA P0 ; (f + 0)
0cc7 : f0 0e __ BEQ $0cd7 ; (sin.s5 + 0)
.s22:
0cc9 : 24 10 __ BIT P3 ; (f + 3)
0ccb : 10 0a __ BPL $0cd7 ; (sin.s5 + 0)
.s21:
0ccd : a9 00 __ LDA #$00
0ccf : 85 47 __ STA T1 + 0 
0cd1 : 85 48 __ STA T1 + 1 
0cd3 : a9 bf __ LDA #$bf
0cd5 : d0 08 __ BNE $0cdf ; (sin.s6 + 0)
.s5:
0cd7 : a9 00 __ LDA #$00
0cd9 : 85 47 __ STA T1 + 0 
0cdb : 85 48 __ STA T1 + 1 
0cdd : a9 3f __ LDA #$3f
.s6:
0cdf : 85 4a __ STA T1 + 3 
0ce1 : a5 10 __ LDA P3 ; (f + 3)
0ce3 : 29 7f __ AND #$7f
0ce5 : 85 46 __ STA T0 + 3 
0ce7 : a9 80 __ LDA #$80
0ce9 : 85 49 __ STA T1 + 2 
0ceb : a9 83 __ LDA #$83
0ced : 85 1b __ STA ACCU + 0 
0cef : a9 3e __ LDA #$3e
0cf1 : 85 1e __ STA ACCU + 3 
0cf3 : a9 f9 __ LDA #$f9
0cf5 : 85 1c __ STA ACCU + 1 
0cf7 : a9 22 __ LDA #$22
0cf9 : 85 1d __ STA ACCU + 2 
0cfb : a2 43 __ LDX #$43
0cfd : 20 43 20 JSR $2043 ; (freg + 4)
0d00 : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0d03 : a5 1b __ LDA ACCU + 0 
0d05 : 85 43 __ STA T0 + 0 
0d07 : a5 1c __ LDA ACCU + 1 
0d09 : 85 44 __ STA T0 + 1 
0d0b : a5 1d __ LDA ACCU + 2 
0d0d : 85 45 __ STA T0 + 2 
0d0f : a5 1e __ LDA ACCU + 3 
0d11 : 85 46 __ STA T0 + 3 
0d13 : 20 63 20 JSR $2063 ; (freg + 36)
0d16 : 20 39 22 JSR $2239 ; (fround + 0)
0d19 : a2 43 __ LDX #$43
0d1b : 20 43 20 JSR $2043 ; (freg + 4)
0d1e : a5 1e __ LDA ACCU + 3 
0d20 : 49 80 __ EOR #$80
0d22 : 85 1e __ STA ACCU + 3 
0d24 : 20 8a 20 JSR $208a ; (faddsub + 6)
0d27 : a5 1b __ LDA ACCU + 0 
0d29 : 85 43 __ STA T0 + 0 
0d2b : a5 1c __ LDA ACCU + 1 
0d2d : 85 44 __ STA T0 + 1 
0d2f : a6 1d __ LDX ACCU + 2 
0d31 : 86 45 __ STX T0 + 2 
0d33 : a5 1e __ LDA ACCU + 3 
0d35 : 85 46 __ STA T0 + 3 
0d37 : 30 3b __ BMI $0d74 ; (sin.s7 + 0)
.s16:
0d39 : c9 3f __ CMP #$3f
0d3b : d0 0b __ BNE $0d48 ; (sin.s20 + 0)
.s17:
0d3d : 8a __ __ TXA
0d3e : d0 08 __ BNE $0d48 ; (sin.s20 + 0)
.s18:
0d40 : a5 1c __ LDA ACCU + 1 
0d42 : d0 04 __ BNE $0d48 ; (sin.s20 + 0)
.s19:
0d44 : a5 1b __ LDA ACCU + 0 
0d46 : f0 02 __ BEQ $0d4a ; (sin.s15 + 0)
.s20:
0d48 : 90 2a __ BCC $0d74 ; (sin.s7 + 0)
.s15:
0d4a : a9 00 __ LDA #$00
0d4c : 85 1b __ STA ACCU + 0 
0d4e : 85 1c __ STA ACCU + 1 
0d50 : 85 1d __ STA ACCU + 2 
0d52 : a9 bf __ LDA #$bf
0d54 : 85 1e __ STA ACCU + 3 
0d56 : a2 43 __ LDX #$43
0d58 : 20 43 20 JSR $2043 ; (freg + 4)
0d5b : 20 8a 20 JSR $208a ; (faddsub + 6)
0d5e : a5 1b __ LDA ACCU + 0 
0d60 : 85 43 __ STA T0 + 0 
0d62 : a5 1c __ LDA ACCU + 1 
0d64 : 85 44 __ STA T0 + 1 
0d66 : a5 1d __ LDA ACCU + 2 
0d68 : 85 45 __ STA T0 + 2 
0d6a : a5 1e __ LDA ACCU + 3 
0d6c : 85 46 __ STA T0 + 3 
0d6e : a5 4a __ LDA T1 + 3 
0d70 : 49 80 __ EOR #$80
0d72 : 85 4a __ STA T1 + 3 
.s7:
0d74 : a5 1e __ LDA ACCU + 3 
0d76 : 30 38 __ BMI $0db0 ; (sin.s8 + 0)
.s10:
0d78 : c9 3e __ CMP #$3e
0d7a : d0 0e __ BNE $0d8a ; (sin.s14 + 0)
.s11:
0d7c : a5 1d __ LDA ACCU + 2 
0d7e : c9 80 __ CMP #$80
0d80 : d0 08 __ BNE $0d8a ; (sin.s14 + 0)
.s12:
0d82 : a5 1c __ LDA ACCU + 1 
0d84 : d0 04 __ BNE $0d8a ; (sin.s14 + 0)
.s13:
0d86 : a5 1b __ LDA ACCU + 0 
0d88 : f0 02 __ BEQ $0d8c ; (sin.s9 + 0)
.s14:
0d8a : 90 24 __ BCC $0db0 ; (sin.s8 + 0)
.s9:
0d8c : a9 00 __ LDA #$00
0d8e : 85 1b __ STA ACCU + 0 
0d90 : 85 1c __ STA ACCU + 1 
0d92 : 85 1d __ STA ACCU + 2 
0d94 : a9 3f __ LDA #$3f
0d96 : 85 1e __ STA ACCU + 3 
0d98 : a2 43 __ LDX #$43
0d9a : 20 43 20 JSR $2043 ; (freg + 4)
0d9d : 20 84 20 JSR $2084 ; (faddsub + 0)
0da0 : a5 1b __ LDA ACCU + 0 
0da2 : 85 43 __ STA T0 + 0 
0da4 : a5 1c __ LDA ACCU + 1 
0da6 : 85 44 __ STA T0 + 1 
0da8 : a5 1d __ LDA ACCU + 2 
0daa : 85 45 __ STA T0 + 2 
0dac : a5 1e __ LDA ACCU + 3 
0dae : 85 46 __ STA T0 + 3 
.s8:
0db0 : a9 98 __ LDA #$98
0db2 : 85 1b __ STA ACCU + 0 
0db4 : a9 42 __ LDA #$42
0db6 : 85 1e __ STA ACCU + 3 
0db8 : a9 ec __ LDA #$ec
0dba : 85 1c __ STA ACCU + 1 
0dbc : a9 5e __ LDA #$5e
0dbe : 85 1d __ STA ACCU + 2 
0dc0 : a2 43 __ LDX #$43
0dc2 : 20 43 20 JSR $2043 ; (freg + 4)
0dc5 : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0dc8 : a9 f8 __ LDA #$f8
0dca : 85 03 __ STA WORK + 0 
0dcc : a9 41 __ LDA #$41
0dce : 85 06 __ STA WORK + 3 
0dd0 : a9 c5 __ LDA #$c5
0dd2 : 85 04 __ STA WORK + 1 
0dd4 : a9 13 __ LDA #$13
0dd6 : 85 05 __ STA WORK + 2 
0dd8 : 20 53 20 JSR $2053 ; (freg + 20)
0ddb : 20 8a 20 JSR $208a ; (faddsub + 6)
0dde : a2 43 __ LDX #$43
0de0 : 20 43 20 JSR $2043 ; (freg + 4)
0de3 : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0de6 : a9 6e __ LDA #$6e
0de8 : 85 03 __ STA WORK + 0 
0dea : a9 c2 __ LDA #$c2
0dec : 85 06 __ STA WORK + 3 
0dee : a9 27 __ LDA #$27
0df0 : 85 04 __ STA WORK + 1 
0df2 : a9 2a __ LDA #$2a
0df4 : 85 05 __ STA WORK + 2 
0df6 : 20 53 20 JSR $2053 ; (freg + 20)
0df9 : 20 8a 20 JSR $208a ; (faddsub + 6)
0dfc : a2 43 __ LDX #$43
0dfe : 20 43 20 JSR $2043 ; (freg + 4)
0e01 : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0e04 : a9 df __ LDA #$df
0e06 : 85 03 __ STA WORK + 0 
0e08 : a9 3d __ LDA #$3d
0e0a : 85 06 __ STA WORK + 3 
0e0c : a9 af __ LDA #$af
0e0e : 85 04 __ STA WORK + 1 
0e10 : a9 5c __ LDA #$5c
0e12 : 85 05 __ STA WORK + 2 
0e14 : 20 53 20 JSR $2053 ; (freg + 20)
0e17 : 20 8a 20 JSR $208a ; (faddsub + 6)
0e1a : a2 43 __ LDX #$43
0e1c : 20 43 20 JSR $2043 ; (freg + 4)
0e1f : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0e22 : a9 b6 __ LDA #$b6
0e24 : 85 03 __ STA WORK + 0 
0e26 : a9 40 __ LDA #$40
0e28 : 85 06 __ STA WORK + 3 
0e2a : a9 0f __ LDA #$0f
0e2c : 85 04 __ STA WORK + 1 
0e2e : a9 c9 __ LDA #$c9
0e30 : 85 05 __ STA WORK + 2 
0e32 : 20 53 20 JSR $2053 ; (freg + 20)
0e35 : 20 8a 20 JSR $208a ; (faddsub + 6)
0e38 : a2 43 __ LDX #$43
0e3a : 20 43 20 JSR $2043 ; (freg + 4)
0e3d : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0e40 : a2 47 __ LDX #$47
0e42 : 20 43 20 JSR $2043 ; (freg + 4)
0e45 : 4c 71 21 JMP $2171 ; (crt_fmul + 0)
--------------------------------------------------------------------
f12mat3_set_rotate_y: ; f12mat3_set_rotate_y(struct F12Matrix3*,float)->void
; 283, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
0e48 : ad f2 9f LDA $9ff2 ; (sstack + 0)
0e4b : 85 4b __ STA T1 + 0 
0e4d : ad f3 9f LDA $9ff3 ; (sstack + 1)
0e50 : 85 4c __ STA T1 + 1 
0e52 : ad f4 9f LDA $9ff4 ; (sstack + 2)
0e55 : 85 4d __ STA T1 + 2 
0e57 : ad f5 9f LDA $9ff5 ; (sstack + 3)
0e5a : 85 4e __ STA T1 + 3 
0e5c : a9 db __ LDA #$db
0e5e : 85 1b __ STA ACCU + 0 ; (a + 2)
0e60 : a9 3f __ LDA #$3f
0e62 : 85 1e __ STA ACCU + 3 
0e64 : a9 0f __ LDA #$0f
0e66 : 85 1c __ STA ACCU + 1 ; (a + 3)
0e68 : a9 c9 __ LDA #$c9
0e6a : 85 1d __ STA ACCU + 2 
0e6c : a2 4b __ LDX #$4b
0e6e : 20 43 20 JSR $2043 ; (freg + 4)
0e71 : 20 8a 20 JSR $208a ; (faddsub + 6)
0e74 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0e76 : 85 0d __ STA P0 
0e78 : a5 1c __ LDA ACCU + 1 ; (a + 3)
0e7a : 85 0e __ STA P1 
0e7c : a5 1d __ LDA ACCU + 2 
0e7e : 85 0f __ STA P2 
0e80 : a5 1e __ LDA ACCU + 3 
0e82 : 85 10 __ STA P3 
0e84 : 20 b1 0c JSR $0cb1 ; (sin.s4 + 0)
0e87 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0e89 : 85 4f __ STA T2 + 0 
0e8b : a5 1c __ LDA ACCU + 1 ; (a + 3)
0e8d : 85 50 __ STA T2 + 1 
0e8f : a5 1d __ LDA ACCU + 2 
0e91 : 85 51 __ STA T2 + 2 
0e93 : a5 1e __ LDA ACCU + 3 
0e95 : 85 52 __ STA T2 + 3 
0e97 : a5 4b __ LDA T1 + 0 
0e99 : 85 0d __ STA P0 
0e9b : a5 4c __ LDA T1 + 1 
0e9d : 85 0e __ STA P1 
0e9f : a5 4d __ LDA T1 + 2 
0ea1 : 85 0f __ STA P2 
0ea3 : a5 4e __ LDA T1 + 3 
0ea5 : 85 10 __ STA P3 
0ea7 : 20 b1 0c JSR $0cb1 ; (sin.s4 + 0)
0eaa : a5 1b __ LDA ACCU + 0 ; (a + 2)
0eac : 85 43 __ STA T0 + 0 
0eae : a5 1c __ LDA ACCU + 1 ; (a + 3)
0eb0 : 85 44 __ STA T0 + 1 
0eb2 : a5 1d __ LDA ACCU + 2 
0eb4 : 85 45 __ STA T0 + 2 
0eb6 : a5 1e __ LDA ACCU + 3 
0eb8 : 85 46 __ STA T0 + 3 
0eba : a9 00 __ LDA #$00
0ebc : 85 1b __ STA ACCU + 0 ; (a + 2)
0ebe : 85 1c __ STA ACCU + 1 ; (a + 3)
0ec0 : a9 80 __ LDA #$80
0ec2 : 85 1d __ STA ACCU + 2 
0ec4 : a9 45 __ LDA #$45
0ec6 : 85 1e __ STA ACCU + 3 
0ec8 : a2 4f __ LDX #$4f
0eca : 20 43 20 JSR $2043 ; (freg + 4)
0ecd : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0ed0 : a9 00 __ LDA #$00
0ed2 : 85 03 __ STA WORK + 0 
0ed4 : 85 04 __ STA WORK + 1 
0ed6 : 85 05 __ STA WORK + 2 
0ed8 : a9 3f __ LDA #$3f
0eda : 85 06 __ STA WORK + 3 
0edc : 20 53 20 JSR $2053 ; (freg + 20)
0edf : 20 8a 20 JSR $208a ; (faddsub + 6)
0ee2 : 20 33 23 JSR $2333 ; (f32_to_i16 + 0)
0ee5 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0ee7 : a0 00 __ LDY #$00
0ee9 : 91 15 __ STA (P8),y ; (m + 0)
0eeb : a5 1c __ LDA ACCU + 1 ; (a + 3)
0eed : c8 __ __ INY
0eee : 91 15 __ STA (P8),y ; (m + 0)
0ef0 : a9 00 __ LDA #$00
0ef2 : c8 __ __ INY
0ef3 : 91 15 __ STA (P8),y ; (m + 0)
0ef5 : c8 __ __ INY
0ef6 : 91 15 __ STA (P8),y ; (m + 0)
0ef8 : a0 06 __ LDY #$06
0efa : 91 15 __ STA (P8),y ; (m + 0)
0efc : c8 __ __ INY
0efd : 91 15 __ STA (P8),y ; (m + 0)
0eff : c8 __ __ INY
0f00 : 91 15 __ STA (P8),y ; (m + 0)
0f02 : a9 10 __ LDA #$10
0f04 : c8 __ __ INY
0f05 : 91 15 __ STA (P8),y ; (m + 0)
0f07 : a9 00 __ LDA #$00
0f09 : c8 __ __ INY
0f0a : 91 15 __ STA (P8),y ; (m + 0)
0f0c : c8 __ __ INY
0f0d : 91 15 __ STA (P8),y ; (m + 0)
0f0f : a0 0e __ LDY #$0e
0f11 : 91 15 __ STA (P8),y ; (m + 0)
0f13 : c8 __ __ INY
0f14 : 91 15 __ STA (P8),y ; (m + 0)
0f16 : a5 1b __ LDA ACCU + 0 ; (a + 2)
0f18 : c8 __ __ INY
0f19 : 91 15 __ STA (P8),y ; (m + 0)
0f1b : a5 1c __ LDA ACCU + 1 ; (a + 3)
0f1d : c8 __ __ INY
0f1e : 91 15 __ STA (P8),y ; (m + 0)
0f20 : a9 00 __ LDA #$00
0f22 : 85 1b __ STA ACCU + 0 ; (a + 2)
0f24 : 85 1c __ STA ACCU + 1 ; (a + 3)
0f26 : a9 80 __ LDA #$80
0f28 : 85 1d __ STA ACCU + 2 
0f2a : a9 45 __ LDA #$45
0f2c : 85 1e __ STA ACCU + 3 
0f2e : a2 43 __ LDX #$43
0f30 : 20 43 20 JSR $2043 ; (freg + 4)
0f33 : 20 71 21 JSR $2171 ; (crt_fmul + 0)
0f36 : a9 00 __ LDA #$00
0f38 : 85 03 __ STA WORK + 0 
0f3a : 85 04 __ STA WORK + 1 
0f3c : 85 05 __ STA WORK + 2 
0f3e : a9 3f __ LDA #$3f
0f40 : 85 06 __ STA WORK + 3 
0f42 : 20 53 20 JSR $2053 ; (freg + 20)
0f45 : 20 8a 20 JSR $208a ; (faddsub + 6)
0f48 : 20 33 23 JSR $2333 ; (f32_to_i16 + 0)
0f4b : a5 1b __ LDA ACCU + 0 ; (a + 2)
0f4d : a0 0c __ LDY #$0c
0f4f : 91 15 __ STA (P8),y ; (m + 0)
0f51 : a5 1c __ LDA ACCU + 1 ; (a + 3)
0f53 : c8 __ __ INY
0f54 : 91 15 __ STA (P8),y ; (m + 0)
0f56 : 38 __ __ SEC
0f57 : a9 00 __ LDA #$00
0f59 : e5 1b __ SBC ACCU + 0 ; (a + 2)
0f5b : a0 04 __ LDY #$04
0f5d : 91 15 __ STA (P8),y ; (m + 0)
0f5f : a9 00 __ LDA #$00
0f61 : e5 1c __ SBC ACCU + 1 ; (a + 3)
0f63 : c8 __ __ INY
0f64 : 91 15 __ STA (P8),y ; (m + 0)
.s3:
0f66 : 60 __ __ RTS
--------------------------------------------------------------------
f12mat3_mmul: ; f12mat3_mmul(struct F12Matrix3*,const struct F12Matrix3*)->void
; 277, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
0f67 : a9 00 __ LDA #$00
0f69 : 85 43 __ STA T2 + 0 
.l5:
0f6b : a0 00 __ LDY #$00
0f6d : b1 13 __ LDA (P6),y ; (ms + 0)
0f6f : 85 0f __ STA P2 
0f71 : c8 __ __ INY
0f72 : b1 13 __ LDA (P6),y ; (ms + 0)
0f74 : 85 10 __ STA P3 
0f76 : 18 __ __ CLC
0f77 : a5 11 __ LDA P4 ; (md + 0)
0f79 : 65 43 __ ADC T2 + 0 
0f7b : 85 44 __ STA T5 + 0 
0f7d : a5 12 __ LDA P5 ; (md + 1)
0f7f : 69 00 __ ADC #$00
0f81 : 85 45 __ STA T5 + 1 
0f83 : a4 43 __ LDY T2 + 0 
0f85 : b1 11 __ LDA (P4),y ; (md + 0)
0f87 : 85 0d __ STA P0 
0f89 : a0 01 __ LDY #$01
0f8b : b1 44 __ LDA (T5 + 0),y 
0f8d : 85 0e __ STA P1 
0f8f : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
0f92 : a5 1b __ LDA ACCU + 0 
0f94 : 85 46 __ STA T6 + 0 
0f96 : a5 1c __ LDA ACCU + 1 
0f98 : 85 47 __ STA T6 + 1 
0f9a : a0 02 __ LDY #$02
0f9c : b1 13 __ LDA (P6),y ; (ms + 0)
0f9e : 85 0f __ STA P2 
0fa0 : c8 __ __ INY
0fa1 : b1 13 __ LDA (P6),y ; (ms + 0)
0fa3 : 85 10 __ STA P3 
0fa5 : a0 06 __ LDY #$06
0fa7 : b1 44 __ LDA (T5 + 0),y 
0fa9 : 85 0d __ STA P0 
0fab : c8 __ __ INY
0fac : b1 44 __ LDA (T5 + 0),y 
0fae : 85 0e __ STA P1 
0fb0 : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
0fb3 : 18 __ __ CLC
0fb4 : a5 1b __ LDA ACCU + 0 
0fb6 : 65 46 __ ADC T6 + 0 
0fb8 : 85 46 __ STA T6 + 0 
0fba : a5 1c __ LDA ACCU + 1 
0fbc : 65 47 __ ADC T6 + 1 
0fbe : 85 47 __ STA T6 + 1 
0fc0 : a0 04 __ LDY #$04
0fc2 : b1 13 __ LDA (P6),y ; (ms + 0)
0fc4 : 85 0f __ STA P2 
0fc6 : c8 __ __ INY
0fc7 : b1 13 __ LDA (P6),y ; (ms + 0)
0fc9 : 85 10 __ STA P3 
0fcb : a0 0c __ LDY #$0c
0fcd : b1 44 __ LDA (T5 + 0),y 
0fcf : 85 0d __ STA P0 
0fd1 : c8 __ __ INY
0fd2 : b1 44 __ LDA (T5 + 0),y 
0fd4 : 85 0e __ STA P1 
0fd6 : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
0fd9 : 18 __ __ CLC
0fda : a5 46 __ LDA T6 + 0 
0fdc : 65 1b __ ADC ACCU + 0 
0fde : 85 4a __ STA T8 + 0 
0fe0 : a5 47 __ LDA T6 + 1 
0fe2 : 65 1c __ ADC ACCU + 1 
0fe4 : 85 4b __ STA T8 + 1 
0fe6 : a0 06 __ LDY #$06
0fe8 : b1 13 __ LDA (P6),y ; (ms + 0)
0fea : 85 0f __ STA P2 
0fec : c8 __ __ INY
0fed : b1 13 __ LDA (P6),y ; (ms + 0)
0fef : 85 10 __ STA P3 
0ff1 : a4 43 __ LDY T2 + 0 
0ff3 : b1 11 __ LDA (P4),y ; (md + 0)
0ff5 : 85 0d __ STA P0 
0ff7 : a0 01 __ LDY #$01
0ff9 : b1 44 __ LDA (T5 + 0),y 
0ffb : 85 0e __ STA P1 
0ffd : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
1000 : a5 1b __ LDA ACCU + 0 
1002 : 85 46 __ STA T6 + 0 
1004 : a5 1c __ LDA ACCU + 1 
1006 : 85 47 __ STA T6 + 1 
1008 : a0 08 __ LDY #$08
100a : b1 13 __ LDA (P6),y ; (ms + 0)
100c : 85 0f __ STA P2 
100e : c8 __ __ INY
100f : b1 13 __ LDA (P6),y ; (ms + 0)
1011 : 85 10 __ STA P3 
1013 : a0 06 __ LDY #$06
1015 : b1 44 __ LDA (T5 + 0),y 
1017 : 85 0d __ STA P0 
1019 : c8 __ __ INY
101a : b1 44 __ LDA (T5 + 0),y 
101c : 85 0e __ STA P1 
101e : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
1021 : 18 __ __ CLC
1022 : a5 1b __ LDA ACCU + 0 
1024 : 65 46 __ ADC T6 + 0 
1026 : 85 46 __ STA T6 + 0 
1028 : a5 1c __ LDA ACCU + 1 
102a : 65 47 __ ADC T6 + 1 
102c : 85 47 __ STA T6 + 1 
102e : a0 0a __ LDY #$0a
1030 : b1 13 __ LDA (P6),y ; (ms + 0)
1032 : 85 0f __ STA P2 
1034 : c8 __ __ INY
1035 : b1 13 __ LDA (P6),y ; (ms + 0)
1037 : 85 10 __ STA P3 
1039 : c8 __ __ INY
103a : b1 44 __ LDA (T5 + 0),y 
103c : 85 0d __ STA P0 
103e : c8 __ __ INY
103f : b1 44 __ LDA (T5 + 0),y 
1041 : 85 0e __ STA P1 
1043 : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
1046 : 18 __ __ CLC
1047 : a5 46 __ LDA T6 + 0 
1049 : 65 1b __ ADC ACCU + 0 
104b : 85 48 __ STA T7 + 0 
104d : a5 47 __ LDA T6 + 1 
104f : 65 1c __ ADC ACCU + 1 
1051 : 85 49 __ STA T7 + 1 
1053 : a0 0c __ LDY #$0c
1055 : b1 13 __ LDA (P6),y ; (ms + 0)
1057 : 85 0f __ STA P2 
1059 : c8 __ __ INY
105a : b1 13 __ LDA (P6),y ; (ms + 0)
105c : 85 10 __ STA P3 
105e : a4 43 __ LDY T2 + 0 
1060 : b1 11 __ LDA (P4),y ; (md + 0)
1062 : 85 0d __ STA P0 
1064 : a0 01 __ LDY #$01
1066 : b1 44 __ LDA (T5 + 0),y 
1068 : 85 0e __ STA P1 
106a : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
106d : a5 1b __ LDA ACCU + 0 
106f : 85 46 __ STA T6 + 0 
1071 : a5 1c __ LDA ACCU + 1 
1073 : 85 47 __ STA T6 + 1 
1075 : a0 0e __ LDY #$0e
1077 : b1 13 __ LDA (P6),y ; (ms + 0)
1079 : 85 0f __ STA P2 
107b : c8 __ __ INY
107c : b1 13 __ LDA (P6),y ; (ms + 0)
107e : 85 10 __ STA P3 
1080 : a0 06 __ LDY #$06
1082 : b1 44 __ LDA (T5 + 0),y 
1084 : 85 0d __ STA P0 
1086 : c8 __ __ INY
1087 : b1 44 __ LDA (T5 + 0),y 
1089 : 85 0e __ STA P1 
108b : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
108e : 18 __ __ CLC
108f : a5 1b __ LDA ACCU + 0 
1091 : 65 46 __ ADC T6 + 0 
1093 : 85 46 __ STA T6 + 0 
1095 : a5 1c __ LDA ACCU + 1 
1097 : 65 47 __ ADC T6 + 1 
1099 : 85 47 __ STA T6 + 1 
109b : a0 10 __ LDY #$10
109d : b1 13 __ LDA (P6),y ; (ms + 0)
109f : 85 0f __ STA P2 
10a1 : c8 __ __ INY
10a2 : b1 13 __ LDA (P6),y ; (ms + 0)
10a4 : 85 10 __ STA P3 
10a6 : a0 0c __ LDY #$0c
10a8 : b1 44 __ LDA (T5 + 0),y 
10aa : 85 0d __ STA P0 
10ac : c8 __ __ INY
10ad : b1 44 __ LDA (T5 + 0),y 
10af : 85 0e __ STA P1 
10b1 : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
10b4 : 18 __ __ CLC
10b5 : a5 46 __ LDA T6 + 0 
10b7 : 65 1b __ ADC ACCU + 0 
10b9 : a0 0c __ LDY #$0c
10bb : 91 44 __ STA (T5 + 0),y 
10bd : a5 47 __ LDA T6 + 1 
10bf : 65 1c __ ADC ACCU + 1 
10c1 : c8 __ __ INY
10c2 : 91 44 __ STA (T5 + 0),y 
10c4 : a5 48 __ LDA T7 + 0 
10c6 : a0 06 __ LDY #$06
10c8 : 91 44 __ STA (T5 + 0),y 
10ca : a5 49 __ LDA T7 + 1 
10cc : c8 __ __ INY
10cd : 91 44 __ STA (T5 + 0),y 
10cf : a5 4a __ LDA T8 + 0 
10d1 : a4 43 __ LDY T2 + 0 
10d3 : 91 11 __ STA (P4),y ; (md + 0)
10d5 : a5 4b __ LDA T8 + 1 
10d7 : c8 __ __ INY
10d8 : 91 11 __ STA (P4),y ; (md + 0)
10da : c8 __ __ INY
10db : 84 43 __ STY T2 + 0 
10dd : c0 06 __ CPY #$06
10df : f0 03 __ BEQ $10e4 ; (f12mat3_mmul.s3 + 0)
10e1 : 4c 6b 0f JMP $0f6b ; (f12mat3_mmul.l5 + 0)
.s3:
10e4 : 60 __ __ RTS
--------------------------------------------------------------------
lmul4f12s: ; lmul4f12s(i16,i16)->i16
;  18, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
10e5 : 38 __ __ SEC
10e6 : a5 0d __ LDA P0 
10e8 : 6a __ __ ROR
10e9 : 85 1b __ STA ACCU + 0 
10eb : a9 00 __ LDA #$00
10ed : 85 1c __ STA ACCU + 1 
10ef : 90 0b __ BCC $10fc ; (lmul4f12s.s4 + 23)
10f1 : a8 __ __ TAY
10f2 : 18 __ __ CLC
10f3 : a5 1c __ LDA ACCU + 1 
10f5 : 65 0f __ ADC P2 
10f7 : 85 1c __ STA ACCU + 1 
10f9 : 98 __ __ TYA
10fa : 65 10 __ ADC P3 
10fc : 6a __ __ ROR
10fd : 66 1c __ ROR ACCU + 1 
10ff : 46 1b __ LSR ACCU + 0 
1101 : 90 f9 __ BCC $10fc ; (lmul4f12s.s4 + 23)
1103 : d0 ec __ BNE $10f1 ; (lmul4f12s.s4 + 12)
1105 : a6 0e __ LDX P1 
1107 : 86 1b __ STX ACCU + 0 
1109 : a2 07 __ LDX #$07
110b : 46 1b __ LSR ACCU + 0 
110d : 90 0b __ BCC $111a ; (lmul4f12s.s4 + 53)
110f : a8 __ __ TAY
1110 : 18 __ __ CLC
1111 : a5 1c __ LDA ACCU + 1 
1113 : 65 0f __ ADC P2 
1115 : 85 1c __ STA ACCU + 1 
1117 : 98 __ __ TYA
1118 : 65 10 __ ADC P3 
111a : 6a __ __ ROR
111b : 66 1c __ ROR ACCU + 1 
111d : 66 1b __ ROR ACCU + 0 
111f : ca __ __ DEX
1120 : d0 eb __ BNE $110d ; (lmul4f12s.s4 + 40)
1122 : 90 0a __ BCC $112e ; (lmul4f12s.s4 + 73)
1124 : a8 __ __ TAY
1125 : a5 1c __ LDA ACCU + 1 
1127 : e5 0f __ SBC P2 
1129 : 85 1c __ STA ACCU + 1 
112b : 98 __ __ TYA
112c : e5 10 __ SBC P3 
112e : 6a __ __ ROR
112f : 66 1c __ ROR ACCU + 1 
1131 : 66 1b __ ROR ACCU + 0 
1133 : 24 10 __ BIT P3 
1135 : 10 0b __ BPL $1142 ; (lmul4f12s.s4 + 93)
1137 : aa __ __ TAX
1138 : 38 __ __ SEC
1139 : a5 1c __ LDA ACCU + 1 
113b : e5 0d __ SBC P0 
113d : 85 1c __ STA ACCU + 1 
113f : 8a __ __ TXA
1140 : e5 0e __ SBC P1 
1142 : 4a __ __ LSR
1143 : 66 1c __ ROR ACCU + 1 
1145 : 66 1b __ ROR ACCU + 0 
1147 : 4a __ __ LSR
1148 : 66 1c __ ROR ACCU + 1 
114a : 66 1b __ ROR ACCU + 0 
114c : 4a __ __ LSR
114d : 66 1c __ ROR ACCU + 1 
114f : 66 1b __ ROR ACCU + 0 
1151 : 4a __ __ LSR
1152 : 66 1c __ ROR ACCU + 1 
1154 : 66 1b __ ROR ACCU + 0 
.s3:
1156 : 60 __ __ RTS
--------------------------------------------------------------------
f12vec3_mmul: ; f12vec3_mmul(struct F12Vector3*,const struct F12Matrix3*,const struct F12Vector3*)->void
; 288, "/home/honza/projects/c64/projects/oscar64/include/gfx/vector3d.h"
.s4:
1157 : a9 00 __ LDA #$00
1159 : 85 43 __ STA T2 + 0 
.l5:
115b : a0 00 __ LDY #$00
115d : b1 15 __ LDA (P8),y ; (vs + 0)
115f : 85 0f __ STA P2 
1161 : c8 __ __ INY
1162 : b1 15 __ LDA (P8),y ; (vs + 0)
1164 : 85 10 __ STA P3 
1166 : 18 __ __ CLC
1167 : a5 13 __ LDA P6 ; (m + 0)
1169 : 65 43 __ ADC T2 + 0 
116b : 85 44 __ STA T5 + 0 
116d : a5 14 __ LDA P7 ; (m + 1)
116f : 69 00 __ ADC #$00
1171 : 85 45 __ STA T5 + 1 
1173 : a4 43 __ LDY T2 + 0 
1175 : b1 13 __ LDA (P6),y ; (m + 0)
1177 : 85 0d __ STA P0 
1179 : a0 01 __ LDY #$01
117b : b1 44 __ LDA (T5 + 0),y 
117d : 85 0e __ STA P1 
117f : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
1182 : a5 1b __ LDA ACCU + 0 
1184 : 85 46 __ STA T6 + 0 
1186 : a5 1c __ LDA ACCU + 1 
1188 : 85 47 __ STA T6 + 1 
118a : a0 02 __ LDY #$02
118c : b1 15 __ LDA (P8),y ; (vs + 0)
118e : 85 0f __ STA P2 
1190 : c8 __ __ INY
1191 : b1 15 __ LDA (P8),y ; (vs + 0)
1193 : 85 10 __ STA P3 
1195 : a0 06 __ LDY #$06
1197 : b1 44 __ LDA (T5 + 0),y 
1199 : 85 0d __ STA P0 
119b : c8 __ __ INY
119c : b1 44 __ LDA (T5 + 0),y 
119e : 85 0e __ STA P1 
11a0 : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
11a3 : 18 __ __ CLC
11a4 : a5 1b __ LDA ACCU + 0 
11a6 : 65 46 __ ADC T6 + 0 
11a8 : 85 46 __ STA T6 + 0 
11aa : a5 1c __ LDA ACCU + 1 
11ac : 65 47 __ ADC T6 + 1 
11ae : 85 47 __ STA T6 + 1 
11b0 : a0 04 __ LDY #$04
11b2 : b1 15 __ LDA (P8),y ; (vs + 0)
11b4 : 85 0f __ STA P2 
11b6 : c8 __ __ INY
11b7 : b1 15 __ LDA (P8),y ; (vs + 0)
11b9 : 85 10 __ STA P3 
11bb : a0 0c __ LDY #$0c
11bd : b1 44 __ LDA (T5 + 0),y 
11bf : 85 0d __ STA P0 
11c1 : c8 __ __ INY
11c2 : b1 44 __ LDA (T5 + 0),y 
11c4 : 85 0e __ STA P1 
11c6 : 20 e5 10 JSR $10e5 ; (lmul4f12s.s4 + 0)
11c9 : 18 __ __ CLC
11ca : a5 46 __ LDA T6 + 0 
11cc : 65 1b __ ADC ACCU + 0 
11ce : a6 43 __ LDX T2 + 0 
11d0 : e8 __ __ INX
11d1 : e8 __ __ INX
11d2 : 86 43 __ STX T2 + 0 
11d4 : 9d ea 9f STA $9fea,x ; (bm_line@stack + 6)
11d7 : a5 47 __ LDA T6 + 1 
11d9 : 65 1c __ ADC ACCU + 1 
11db : 9d eb 9f STA $9feb,x ; (bm_line@stack + 7)
11de : e0 06 __ CPX #$06
11e0 : f0 03 __ BEQ $11e5 ; (f12vec3_mmul.s6 + 0)
11e2 : 4c 5b 11 JMP $115b ; (f12vec3_mmul.l5 + 0)
.s6:
11e5 : a0 05 __ LDY #$05
.l7:
11e7 : b9 ec 9f LDA $9fec,y ; (vt.v[0] + 0)
11ea : 91 11 __ STA (P4),y ; (vd + 0)
11ec : 88 __ __ DEY
11ed : 10 f8 __ BPL $11e7 ; (f12vec3_mmul.l7 + 0)
.s3:
11ef : 60 __ __ RTS
--------------------------------------------------------------------
lmuldiv16s: ; lmuldiv16s(i16,i16,i16)->i16
;  42, "/home/honza/projects/c64/projects/oscar64/include/fixmath.h"
.s4:
11f0 : a9 00 __ LDA #$00
11f2 : 24 0e __ BIT P1 ; (a + 1)
11f4 : 10 0d __ BPL $1203 ; (lmuldiv16s.s5 + 0)
.s10:
11f6 : 38 __ __ SEC
11f7 : e5 0d __ SBC P0 ; (a + 0)
11f9 : 85 0d __ STA P0 ; (a + 0)
11fb : a9 00 __ LDA #$00
11fd : e5 0e __ SBC P1 ; (a + 1)
11ff : 85 0e __ STA P1 ; (a + 1)
1201 : a9 01 __ LDA #$01
.s5:
1203 : 85 43 __ STA T1 + 0 
1205 : 24 10 __ BIT P3 ; (b + 1)
1207 : 10 14 __ BPL $121d ; (lmuldiv16s.s6 + 0)
.s9:
1209 : 38 __ __ SEC
120a : a9 00 __ LDA #$00
120c : e5 0f __ SBC P2 ; (b + 0)
120e : 85 0f __ STA P2 ; (b + 0)
1210 : a9 00 __ LDA #$00
1212 : e5 10 __ SBC P3 ; (b + 1)
1214 : 85 10 __ STA P3 ; (b + 1)
1216 : a9 00 __ LDA #$00
1218 : c5 43 __ CMP T1 + 0 
121a : 2a __ __ ROL
121b : 85 43 __ STA T1 + 0 
.s6:
121d : 24 12 __ BIT P5 ; (c + 1)
121f : 10 14 __ BPL $1235 ; (lmuldiv16s.s7 + 0)
.s8:
1221 : 38 __ __ SEC
1222 : a9 00 __ LDA #$00
1224 : e5 11 __ SBC P4 ; (c + 0)
1226 : 85 11 __ STA P4 ; (c + 0)
1228 : a9 00 __ LDA #$00
122a : e5 12 __ SBC P5 ; (c + 1)
122c : 85 12 __ STA P5 ; (c + 1)
122e : a9 00 __ LDA #$00
1230 : c5 43 __ CMP T1 + 0 
1232 : 2a __ __ ROL
1233 : 85 43 __ STA T1 + 0 
.s7:
1235 : a9 00 __ LDA #$00
1237 : 85 05 __ STA WORK + 2 
1239 : 85 06 __ STA WORK + 3 
123b : a5 0d __ LDA P0 ; (a + 0)
123d : 38 __ __ SEC
123e : a0 08 __ LDY #$08
1240 : 6a __ __ ROR
1241 : 90 0f __ BCC $1252 ; (lmuldiv16s.s7 + 29)
1243 : aa __ __ TAX
1244 : 18 __ __ CLC
1245 : a5 05 __ LDA WORK + 2 
1247 : 65 0f __ ADC P2 ; (b + 0)
1249 : 85 05 __ STA WORK + 2 
124b : a5 06 __ LDA WORK + 3 
124d : 65 10 __ ADC P3 ; (b + 1)
124f : 85 06 __ STA WORK + 3 
1251 : 8a __ __ TXA
1252 : 66 06 __ ROR WORK + 3 
1254 : 66 05 __ ROR WORK + 2 
1256 : 88 __ __ DEY
1257 : d0 e7 __ BNE $1240 ; (lmuldiv16s.s7 + 11)
1259 : 6a __ __ ROR
125a : 90 07 __ BCC $1263 ; (lmuldiv16s.s7 + 46)
125c : 85 03 __ STA WORK + 0 
125e : a5 0e __ LDA P1 ; (a + 1)
1260 : 18 __ __ CLC
1261 : 90 db __ BCC $123e ; (lmuldiv16s.s7 + 9)
1263 : 38 __ __ SEC
1264 : 85 04 __ STA WORK + 1 
1266 : a2 08 __ LDX #$08
1268 : 26 04 __ ROL WORK + 1 
126a : 26 05 __ ROL WORK + 2 
126c : 26 06 __ ROL WORK + 3 
126e : 90 0c __ BCC $127c ; (lmuldiv16s.s7 + 71)
1270 : a5 05 __ LDA WORK + 2 
1272 : e5 11 __ SBC P4 ; (c + 0)
1274 : a8 __ __ TAY
1275 : a5 06 __ LDA WORK + 3 
1277 : e5 12 __ SBC P5 ; (c + 1)
1279 : 38 __ __ SEC
127a : b0 0c __ BCS $1288 ; (lmuldiv16s.s7 + 83)
127c : 38 __ __ SEC
127d : a5 05 __ LDA WORK + 2 
127f : e5 11 __ SBC P4 ; (c + 0)
1281 : a8 __ __ TAY
1282 : a5 06 __ LDA WORK + 3 
1284 : e5 12 __ SBC P5 ; (c + 1)
1286 : 90 04 __ BCC $128c ; (lmuldiv16s.s7 + 87)
1288 : 85 06 __ STA WORK + 3 
128a : 84 05 __ STY WORK + 2 
128c : ca __ __ DEX
128d : d0 d9 __ BNE $1268 ; (lmuldiv16s.s7 + 51)
128f : a5 04 __ LDA WORK + 1 
1291 : 2a __ __ ROL
1292 : 90 07 __ BCC $129b ; (lmuldiv16s.s7 + 102)
1294 : 85 1c __ STA ACCU + 1 
1296 : a5 03 __ LDA WORK + 0 
1298 : 18 __ __ CLC
1299 : 90 c9 __ BCC $1264 ; (lmuldiv16s.s7 + 47)
129b : 85 1b __ STA ACCU + 0 
129d : a5 43 __ LDA T1 + 0 
129f : f0 0d __ BEQ $12ae ; (lmuldiv16s.s3 + 0)
12a1 : 38 __ __ SEC
12a2 : a9 00 __ LDA #$00
12a4 : e5 1b __ SBC ACCU + 0 
12a6 : 85 1b __ STA ACCU + 0 
12a8 : a9 00 __ LDA #$00
12aa : e5 1c __ SBC ACCU + 1 
12ac : 85 1c __ STA ACCU + 1 
.s3:
12ae : 60 __ __ RTS
--------------------------------------------------------------------
xor2Cube: ; xor2Cube()->void
;  94, "/home/honza/projects/c64/projects/oscar64/samples/hires/cube3d.c"
.s1:
12af : a5 53 __ LDA T1 + 0 
12b1 : 8d dc 9f STA $9fdc ; (xor2Cube@stack + 0)
12b4 : a5 54 __ LDA T4 + 0 
12b6 : 8d dd 9f STA $9fdd ; (xor2Cube@stack + 1)
.s4:
12b9 : a9 00 __ LDA #$00
12bb : 85 53 __ STA T1 + 0 
.l6:
12bd : a9 ff __ LDA #$ff
12bf : 8d fe 9f STA $9ffe ; (sstack + 12)
12c2 : a9 03 __ LDA #$03
12c4 : 8d ff 9f STA $9fff ; (sstack + 13)
12c7 : a9 d7 __ LDA #$d7
12c9 : 8d f2 9f STA $9ff2 ; (sstack + 0)
12cc : a9 23 __ LDA #$23
12ce : 8d f3 9f STA $9ff3 ; (sstack + 1)
12d1 : a9 c7 __ LDA #$c7
12d3 : 8d f4 9f STA $9ff4 ; (sstack + 2)
12d6 : a9 23 __ LDA #$23
12d8 : 8d f5 9f STA $9ff5 ; (sstack + 3)
12db : a6 53 __ LDX T1 + 0 
12dd : bd 9a 24 LDA $249a,x ; (pcorners[0].x + 0)
12e0 : 8d f6 9f STA $9ff6 ; (sstack + 4)
12e3 : bd a2 24 LDA $24a2,x ; (pcorners[0].x + 0)
12e6 : 8d f7 9f STA $9ff7 ; (sstack + 5)
12e9 : bd aa 24 LDA $24aa,x ; (pcorners[0].y + 0)
12ec : 8d f8 9f STA $9ff8 ; (sstack + 6)
12ef : bd b2 24 LDA $24b2,x ; (pcorners[0].y + 0)
12f2 : 8d f9 9f STA $9ff9 ; (sstack + 7)
12f5 : 8a __ __ TXA
12f6 : 09 01 __ ORA #$01
12f8 : 85 54 __ STA T4 + 0 
12fa : aa __ __ TAX
12fb : bd 9a 24 LDA $249a,x ; (pcorners[0].x + 0)
12fe : 8d fa 9f STA $9ffa ; (sstack + 8)
1301 : bd a2 24 LDA $24a2,x ; (pcorners[0].x + 0)
1304 : 8d fb 9f STA $9ffb ; (sstack + 9)
1307 : bd aa 24 LDA $24aa,x ; (pcorners[0].y + 0)
130a : 8d fc 9f STA $9ffc ; (sstack + 10)
130d : bd b2 24 LDA $24b2,x ; (pcorners[0].y + 0)
1310 : 8d fd 9f STA $9ffd ; (sstack + 11)
1313 : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
1316 : a9 d7 __ LDA #$d7
1318 : 8d f2 9f STA $9ff2 ; (sstack + 0)
131b : a9 23 __ LDA #$23
131d : 8d f3 9f STA $9ff3 ; (sstack + 1)
1320 : a9 c7 __ LDA #$c7
1322 : 8d f4 9f STA $9ff4 ; (sstack + 2)
1325 : a9 23 __ LDA #$23
1327 : 8d f5 9f STA $9ff5 ; (sstack + 3)
132a : a9 ff __ LDA #$ff
132c : 8d fe 9f STA $9ffe ; (sstack + 12)
132f : a9 03 __ LDA #$03
1331 : 8d ff 9f STA $9fff ; (sstack + 13)
1334 : a6 53 __ LDX T1 + 0 
1336 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1339 : 8d f6 9f STA $9ff6 ; (sstack + 4)
133c : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
133f : 8d f7 9f STA $9ff7 ; (sstack + 5)
1342 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1345 : 8d f8 9f STA $9ff8 ; (sstack + 6)
1348 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
134b : 8d f9 9f STA $9ff9 ; (sstack + 7)
134e : a6 54 __ LDX T4 + 0 
1350 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1353 : 8d fa 9f STA $9ffa ; (sstack + 8)
1356 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1359 : 8d fb 9f STA $9ffb ; (sstack + 9)
135c : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
135f : 8d fc 9f STA $9ffc ; (sstack + 10)
1362 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1365 : 8d fd 9f STA $9ffd ; (sstack + 11)
1368 : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
.l7:
136b : a5 53 __ LDA T1 + 0 
136d : 29 02 __ AND #$02
136f : f0 03 __ BEQ $1374 ; (xor2Cube.s8 + 0)
1371 : 4c 22 14 JMP $1422 ; (xor2Cube.s9 + 0)
.s8:
1374 : a9 ff __ LDA #$ff
1376 : 8d fe 9f STA $9ffe ; (sstack + 12)
1379 : a9 03 __ LDA #$03
137b : 8d ff 9f STA $9fff ; (sstack + 13)
137e : a9 d7 __ LDA #$d7
1380 : 8d f2 9f STA $9ff2 ; (sstack + 0)
1383 : a9 23 __ LDA #$23
1385 : 8d f3 9f STA $9ff3 ; (sstack + 1)
1388 : a9 c7 __ LDA #$c7
138a : 8d f4 9f STA $9ff4 ; (sstack + 2)
138d : a9 23 __ LDA #$23
138f : 8d f5 9f STA $9ff5 ; (sstack + 3)
1392 : a6 53 __ LDX T1 + 0 
1394 : bd 9a 24 LDA $249a,x ; (pcorners[0].x + 0)
1397 : 8d f6 9f STA $9ff6 ; (sstack + 4)
139a : bd a2 24 LDA $24a2,x ; (pcorners[0].x + 0)
139d : 8d f7 9f STA $9ff7 ; (sstack + 5)
13a0 : bd aa 24 LDA $24aa,x ; (pcorners[0].y + 0)
13a3 : 8d f8 9f STA $9ff8 ; (sstack + 6)
13a6 : bd b2 24 LDA $24b2,x ; (pcorners[0].y + 0)
13a9 : 8d f9 9f STA $9ff9 ; (sstack + 7)
13ac : 8a __ __ TXA
13ad : 09 02 __ ORA #$02
13af : 85 54 __ STA T4 + 0 
13b1 : aa __ __ TAX
13b2 : bd 9a 24 LDA $249a,x ; (pcorners[0].x + 0)
13b5 : 8d fa 9f STA $9ffa ; (sstack + 8)
13b8 : bd a2 24 LDA $24a2,x ; (pcorners[0].x + 0)
13bb : 8d fb 9f STA $9ffb ; (sstack + 9)
13be : bd aa 24 LDA $24aa,x ; (pcorners[0].y + 0)
13c1 : 8d fc 9f STA $9ffc ; (sstack + 10)
13c4 : bd b2 24 LDA $24b2,x ; (pcorners[0].y + 0)
13c7 : 8d fd 9f STA $9ffd ; (sstack + 11)
13ca : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
13cd : a9 d7 __ LDA #$d7
13cf : 8d f2 9f STA $9ff2 ; (sstack + 0)
13d2 : a9 23 __ LDA #$23
13d4 : 8d f3 9f STA $9ff3 ; (sstack + 1)
13d7 : a9 c7 __ LDA #$c7
13d9 : 8d f4 9f STA $9ff4 ; (sstack + 2)
13dc : a9 23 __ LDA #$23
13de : 8d f5 9f STA $9ff5 ; (sstack + 3)
13e1 : a9 ff __ LDA #$ff
13e3 : 8d fe 9f STA $9ffe ; (sstack + 12)
13e6 : a9 03 __ LDA #$03
13e8 : 8d ff 9f STA $9fff ; (sstack + 13)
13eb : a6 53 __ LDX T1 + 0 
13ed : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
13f0 : 8d f6 9f STA $9ff6 ; (sstack + 4)
13f3 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
13f6 : 8d f7 9f STA $9ff7 ; (sstack + 5)
13f9 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
13fc : 8d f8 9f STA $9ff8 ; (sstack + 6)
13ff : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1402 : 8d f9 9f STA $9ff9 ; (sstack + 7)
1405 : a6 54 __ LDX T4 + 0 
1407 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
140a : 8d fa 9f STA $9ffa ; (sstack + 8)
140d : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1410 : 8d fb 9f STA $9ffb ; (sstack + 9)
1413 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1416 : 8d fc 9f STA $9ffc ; (sstack + 10)
1419 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
141c : 8d fd 9f STA $9ffd ; (sstack + 11)
141f : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
.s9:
1422 : a5 53 __ LDA T1 + 0 
1424 : 29 04 __ AND #$04
1426 : f0 03 __ BEQ $142b ; (xor2Cube.s10 + 0)
1428 : 4c d9 14 JMP $14d9 ; (xor2Cube.s11 + 0)
.s10:
142b : a9 ff __ LDA #$ff
142d : 8d fe 9f STA $9ffe ; (sstack + 12)
1430 : a9 03 __ LDA #$03
1432 : 8d ff 9f STA $9fff ; (sstack + 13)
1435 : a9 d7 __ LDA #$d7
1437 : 8d f2 9f STA $9ff2 ; (sstack + 0)
143a : a9 23 __ LDA #$23
143c : 8d f3 9f STA $9ff3 ; (sstack + 1)
143f : a9 c7 __ LDA #$c7
1441 : 8d f4 9f STA $9ff4 ; (sstack + 2)
1444 : a9 23 __ LDA #$23
1446 : 8d f5 9f STA $9ff5 ; (sstack + 3)
1449 : a6 53 __ LDX T1 + 0 
144b : bd 9a 24 LDA $249a,x ; (pcorners[0].x + 0)
144e : 8d f6 9f STA $9ff6 ; (sstack + 4)
1451 : bd a2 24 LDA $24a2,x ; (pcorners[0].x + 0)
1454 : 8d f7 9f STA $9ff7 ; (sstack + 5)
1457 : bd aa 24 LDA $24aa,x ; (pcorners[0].y + 0)
145a : 8d f8 9f STA $9ff8 ; (sstack + 6)
145d : bd b2 24 LDA $24b2,x ; (pcorners[0].y + 0)
1460 : 8d f9 9f STA $9ff9 ; (sstack + 7)
1463 : 8a __ __ TXA
1464 : 09 04 __ ORA #$04
1466 : 85 54 __ STA T4 + 0 
1468 : aa __ __ TAX
1469 : bd 9a 24 LDA $249a,x ; (pcorners[0].x + 0)
146c : 8d fa 9f STA $9ffa ; (sstack + 8)
146f : bd a2 24 LDA $24a2,x ; (pcorners[0].x + 0)
1472 : 8d fb 9f STA $9ffb ; (sstack + 9)
1475 : bd aa 24 LDA $24aa,x ; (pcorners[0].y + 0)
1478 : 8d fc 9f STA $9ffc ; (sstack + 10)
147b : bd b2 24 LDA $24b2,x ; (pcorners[0].y + 0)
147e : 8d fd 9f STA $9ffd ; (sstack + 11)
1481 : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
1484 : a9 d7 __ LDA #$d7
1486 : 8d f2 9f STA $9ff2 ; (sstack + 0)
1489 : a9 23 __ LDA #$23
148b : 8d f3 9f STA $9ff3 ; (sstack + 1)
148e : a9 c7 __ LDA #$c7
1490 : 8d f4 9f STA $9ff4 ; (sstack + 2)
1493 : a9 23 __ LDA #$23
1495 : 8d f5 9f STA $9ff5 ; (sstack + 3)
1498 : a9 ff __ LDA #$ff
149a : 8d fe 9f STA $9ffe ; (sstack + 12)
149d : a9 03 __ LDA #$03
149f : 8d ff 9f STA $9fff ; (sstack + 13)
14a2 : a6 53 __ LDX T1 + 0 
14a4 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
14a7 : 8d f6 9f STA $9ff6 ; (sstack + 4)
14aa : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
14ad : 8d f7 9f STA $9ff7 ; (sstack + 5)
14b0 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
14b3 : 8d f8 9f STA $9ff8 ; (sstack + 6)
14b6 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
14b9 : 8d f9 9f STA $9ff9 ; (sstack + 7)
14bc : a6 54 __ LDX T4 + 0 
14be : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
14c1 : 8d fa 9f STA $9ffa ; (sstack + 8)
14c4 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
14c7 : 8d fb 9f STA $9ffb ; (sstack + 9)
14ca : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
14cd : 8d fc 9f STA $9ffc ; (sstack + 10)
14d0 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
14d3 : 8d fd 9f STA $9ffd ; (sstack + 11)
14d6 : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
.s11:
14d9 : e6 53 __ INC T1 + 0 
14db : a5 53 __ LDA T1 + 0 
14dd : c9 08 __ CMP #$08
14df : f0 09 __ BEQ $14ea ; (xor2Cube.s12 + 0)
.s5:
14e1 : 4a __ __ LSR
14e2 : 90 03 __ BCC $14e7 ; (xor2Cube.s5 + 6)
14e4 : 4c 6b 13 JMP $136b ; (xor2Cube.l7 + 0)
14e7 : 4c bd 12 JMP $12bd ; (xor2Cube.l6 + 0)
.s12:
14ea : a2 00 __ LDX #$00
.l13:
14ec : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
14ef : 9d 9a 24 STA $249a,x ; (pcorners[0].x + 0)
14f2 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
14f5 : 9d a2 24 STA $24a2,x ; (pcorners[0].x + 0)
14f8 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
14fb : 9d aa 24 STA $24aa,x ; (pcorners[0].y + 0)
14fe : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1501 : 9d b2 24 STA $24b2,x ; (pcorners[0].y + 0)
1504 : e8 __ __ INX
1505 : e0 08 __ CPX #$08
1507 : d0 e3 __ BNE $14ec ; (xor2Cube.l13 + 0)
.s3:
1509 : ad dc 9f LDA $9fdc ; (xor2Cube@stack + 0)
150c : 85 53 __ STA T1 + 0 
150e : ad dd 9f LDA $9fdd ; (xor2Cube@stack + 1)
1511 : 85 54 __ STA T4 + 0 
1513 : 60 __ __ RTS
--------------------------------------------------------------------
bm_line: ; bm_line(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,u8,enum LineOp)->void
; 116, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
1514 : a2 0d __ LDX #$0d
1516 : b5 53 __ LDA T2 + 0,x 
1518 : 9d e4 9f STA $9fe4,x ; (bm_line@stack + 0)
151b : ca __ __ DEX
151c : 10 f8 __ BPL $1516 ; (bm_line.s1 + 2)
.s4:
151e : ad f8 9f LDA $9ff8 ; (sstack + 6)
1521 : 85 55 __ STA T3 + 0 
1523 : ad f9 9f LDA $9ff9 ; (sstack + 7)
1526 : 85 56 __ STA T3 + 1 
1528 : ad fc 9f LDA $9ffc ; (sstack + 10)
152b : 85 53 __ STA T2 + 0 
152d : 38 __ __ SEC
152e : e5 55 __ SBC T3 + 0 
1530 : 85 57 __ STA T4 + 0 
1532 : ad fd 9f LDA $9ffd ; (sstack + 11)
1535 : 85 54 __ STA T2 + 1 
1537 : e5 56 __ SBC T3 + 1 
1539 : 85 58 __ STA T4 + 1 
153b : ad f4 9f LDA $9ff4 ; (sstack + 2)
153e : 85 59 __ STA T5 + 0 
1540 : ad f5 9f LDA $9ff5 ; (sstack + 3)
1543 : 85 5a __ STA T5 + 1 
1545 : a0 00 __ LDY #$00
1547 : b1 59 __ LDA (T5 + 0),y 
1549 : 85 43 __ STA T0 + 0 
154b : c8 __ __ INY
154c : b1 59 __ LDA (T5 + 0),y 
154e : 85 44 __ STA T0 + 1 
1550 : a0 04 __ LDY #$04
1552 : b1 59 __ LDA (T5 + 0),y 
1554 : 85 45 __ STA T1 + 0 
1556 : ad f6 9f LDA $9ff6 ; (sstack + 4)
1559 : 85 5d __ STA T7 + 0 
155b : ad f7 9f LDA $9ff7 ; (sstack + 5)
155e : 85 5e __ STA T7 + 1 
1560 : ad fa 9f LDA $9ffa ; (sstack + 8)
1563 : 85 5b __ STA T6 + 0 
1565 : 38 __ __ SEC
1566 : e5 5d __ SBC T7 + 0 
1568 : 85 5f __ STA T8 + 0 
156a : ad fb 9f LDA $9ffb ; (sstack + 9)
156d : 85 5c __ STA T6 + 1 
156f : c8 __ __ INY
1570 : e5 5e __ SBC T7 + 1 
1572 : 85 60 __ STA T8 + 1 
1574 : 30 07 __ BMI $157d ; (bm_line.s5 + 0)
.s82:
1576 : 05 5f __ ORA T8 + 0 
1578 : f0 03 __ BEQ $157d ; (bm_line.s5 + 0)
157a : 4c ad 18 JMP $18ad ; (bm_line.s64 + 0)
.s5:
157d : a5 5e __ LDA T7 + 1 
157f : 10 03 __ BPL $1584 ; (bm_line.s63 + 0)
1581 : 4c f9 16 JMP $16f9 ; (bm_line.s3 + 0)
.s63:
1584 : c5 44 __ CMP T0 + 1 
1586 : d0 04 __ BNE $158c ; (bm_line.s62 + 0)
.s61:
1588 : a5 5d __ LDA T7 + 0 
158a : c5 43 __ CMP T0 + 0 
.s62:
158c : 90 f3 __ BCC $1581 ; (bm_line.s5 + 4)
.s6:
158e : a5 5c __ LDA T6 + 1 
1590 : 10 03 __ BPL $1595 ; (bm_line.s60 + 0)
1592 : 4c 56 18 JMP $1856 ; (bm_line.s52 + 0)
.s60:
1595 : d1 59 __ CMP (T5 + 0),y 
1597 : d0 04 __ BNE $159d ; (bm_line.s59 + 0)
.s58:
1599 : a5 5b __ LDA T6 + 0 
159b : c5 45 __ CMP T1 + 0 
.s59:
159d : b0 e2 __ BCS $1581 ; (bm_line.s5 + 4)
.s7:
159f : a5 5c __ LDA T6 + 1 
15a1 : c5 44 __ CMP T0 + 1 
15a3 : d0 04 __ BNE $15a9 ; (bm_line.s57 + 0)
.s56:
15a5 : a5 5b __ LDA T6 + 0 
15a7 : c5 43 __ CMP T0 + 0 
.s57:
15a9 : 90 e7 __ BCC $1592 ; (bm_line.s6 + 4)
.s8:
15ab : a5 5e __ LDA T7 + 1 
15ad : d1 59 __ CMP (T5 + 0),y 
15af : d0 04 __ BNE $15b5 ; (bm_line.s54 + 0)
.s51:
15b1 : a5 5d __ LDA T7 + 0 
15b3 : c5 45 __ CMP T1 + 0 
.s54:
15b5 : 90 4e __ BCC $1605 ; (bm_line.s9 + 0)
.s50:
15b7 : a5 57 __ LDA T4 + 0 
15b9 : 85 0f __ STA P2 
15bb : a5 58 __ LDA T4 + 1 
15bd : 85 10 __ STA P3 
15bf : a5 5f __ LDA T8 + 0 
15c1 : 85 11 __ STA P4 
15c3 : a5 60 __ LDA T8 + 1 
15c5 : 85 12 __ STA P5 
15c7 : 18 __ __ CLC
15c8 : a5 5d __ LDA T7 + 0 
15ca : 69 01 __ ADC #$01
15cc : a8 __ __ TAY
15cd : a5 5e __ LDA T7 + 1 
15cf : 69 00 __ ADC #$00
15d1 : aa __ __ TAX
15d2 : 98 __ __ TYA
15d3 : 38 __ __ SEC
15d4 : a0 04 __ LDY #$04
15d6 : f1 59 __ SBC (T5 + 0),y 
15d8 : 85 0d __ STA P0 
15da : 8a __ __ TXA
15db : c8 __ __ INY
15dc : f1 59 __ SBC (T5 + 0),y 
15de : 85 0e __ STA P1 
15e0 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
15e3 : 38 __ __ SEC
15e4 : a5 55 __ LDA T3 + 0 
15e6 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
15e8 : 8d f8 9f STA $9ff8 ; (sstack + 6)
15eb : a5 56 __ LDA T3 + 1 
15ed : e5 1c __ SBC ACCU + 1 ; (clip + 1)
15ef : 8d f9 9f STA $9ff9 ; (sstack + 7)
15f2 : a0 04 __ LDY #$04
15f4 : b1 59 __ LDA (T5 + 0),y 
15f6 : 38 __ __ SEC
15f7 : e9 01 __ SBC #$01
15f9 : aa __ __ TAX
15fa : c8 __ __ INY
15fb : b1 59 __ LDA (T5 + 0),y 
15fd : 8e f6 9f STX $9ff6 ; (sstack + 4)
1600 : e9 00 __ SBC #$00
1602 : 8d f7 9f STA $9ff7 ; (sstack + 5)
.s9:
1605 : a0 02 __ LDY #$02
1607 : b1 59 __ LDA (T5 + 0),y 
1609 : 85 43 __ STA T0 + 0 
160b : c8 __ __ INY
160c : b1 59 __ LDA (T5 + 0),y 
160e : 85 44 __ STA T0 + 1 
1610 : a0 06 __ LDY #$06
1612 : b1 59 __ LDA (T5 + 0),y 
1614 : 85 45 __ STA T1 + 0 
1616 : c8 __ __ INY
1617 : a5 58 __ LDA T4 + 1 
1619 : 30 07 __ BMI $1622 ; (bm_line.s10 + 0)
.s49:
161b : 05 57 __ ORA T4 + 0 
161d : f0 03 __ BEQ $1622 ; (bm_line.s10 + 0)
161f : 4c 5e 17 JMP $175e ; (bm_line.s30 + 0)
.s10:
1622 : ad f8 9f LDA $9ff8 ; (sstack + 6)
1625 : 85 55 __ STA T3 + 0 
1627 : ad f9 9f LDA $9ff9 ; (sstack + 7)
162a : 10 03 __ BPL $162f ; (bm_line.s29 + 0)
162c : 4c f9 16 JMP $16f9 ; (bm_line.s3 + 0)
.s29:
162f : 85 56 __ STA T3 + 1 
1631 : c5 44 __ CMP T0 + 1 
1633 : d0 04 __ BNE $1639 ; (bm_line.s28 + 0)
.s27:
1635 : a5 55 __ LDA T3 + 0 
1637 : c5 43 __ CMP T0 + 0 
.s28:
1639 : 90 f1 __ BCC $162c ; (bm_line.s10 + 10)
.s11:
163b : ad fd 9f LDA $9ffd ; (sstack + 11)
163e : 10 03 __ BPL $1643 ; (bm_line.s26 + 0)
1640 : 4c 04 17 JMP $1704 ; (bm_line.s17 + 0)
.s26:
1643 : d1 59 __ CMP (T5 + 0),y 
1645 : d0 05 __ BNE $164c ; (bm_line.s25 + 0)
.s24:
1647 : ad fc 9f LDA $9ffc ; (sstack + 10)
164a : c5 45 __ CMP T1 + 0 
.s25:
164c : b0 de __ BCS $162c ; (bm_line.s10 + 10)
.s12:
164e : ad fd 9f LDA $9ffd ; (sstack + 11)
1651 : 30 ed __ BMI $1640 ; (bm_line.s11 + 5)
.s23:
1653 : c5 44 __ CMP T0 + 1 
1655 : d0 05 __ BNE $165c ; (bm_line.s22 + 0)
.s21:
1657 : ad fc 9f LDA $9ffc ; (sstack + 10)
165a : c5 43 __ CMP T0 + 0 
.s22:
165c : 90 e2 __ BCC $1640 ; (bm_line.s11 + 5)
.s13:
165e : a5 56 __ LDA T3 + 1 
1660 : d1 59 __ CMP (T5 + 0),y 
1662 : d0 04 __ BNE $1668 ; (bm_line.s19 + 0)
.s16:
1664 : a5 55 __ LDA T3 + 0 
1666 : c5 45 __ CMP T1 + 0 
.s19:
1668 : 90 50 __ BCC $16ba ; (bm_line.s14 + 0)
.s15:
166a : a5 5f __ LDA T8 + 0 
166c : 85 0f __ STA P2 
166e : a5 60 __ LDA T8 + 1 
1670 : 85 10 __ STA P3 
1672 : a5 57 __ LDA T4 + 0 
1674 : 85 11 __ STA P4 
1676 : a5 58 __ LDA T4 + 1 
1678 : 85 12 __ STA P5 
167a : 18 __ __ CLC
167b : a5 55 __ LDA T3 + 0 
167d : 69 01 __ ADC #$01
167f : a8 __ __ TAY
1680 : a5 56 __ LDA T3 + 1 
1682 : 69 00 __ ADC #$00
1684 : aa __ __ TAX
1685 : 98 __ __ TYA
1686 : 38 __ __ SEC
1687 : a0 06 __ LDY #$06
1689 : f1 59 __ SBC (T5 + 0),y 
168b : 85 0d __ STA P0 
168d : 8a __ __ TXA
168e : c8 __ __ INY
168f : f1 59 __ SBC (T5 + 0),y 
1691 : 85 0e __ STA P1 
1693 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
1696 : ad f6 9f LDA $9ff6 ; (sstack + 4)
1699 : 38 __ __ SEC
169a : e5 1b __ SBC ACCU + 0 ; (clip + 0)
169c : 8d f6 9f STA $9ff6 ; (sstack + 4)
169f : ad f7 9f LDA $9ff7 ; (sstack + 5)
16a2 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
16a4 : 8d f7 9f STA $9ff7 ; (sstack + 5)
16a7 : a0 06 __ LDY #$06
16a9 : b1 59 __ LDA (T5 + 0),y 
16ab : 38 __ __ SEC
16ac : e9 01 __ SBC #$01
16ae : aa __ __ TAX
16af : c8 __ __ INY
16b0 : b1 59 __ LDA (T5 + 0),y 
16b2 : 8e f8 9f STX $9ff8 ; (sstack + 6)
16b5 : e9 00 __ SBC #$00
16b7 : 8d f9 9f STA $9ff9 ; (sstack + 7)
.s14:
16ba : ad f2 9f LDA $9ff2 ; (sstack + 0)
16bd : 85 0d __ STA P0 
16bf : ad f3 9f LDA $9ff3 ; (sstack + 1)
16c2 : 85 0e __ STA P1 
16c4 : ad f6 9f LDA $9ff6 ; (sstack + 4)
16c7 : 85 0f __ STA P2 
16c9 : ad f7 9f LDA $9ff7 ; (sstack + 5)
16cc : 85 10 __ STA P3 
16ce : ad f8 9f LDA $9ff8 ; (sstack + 6)
16d1 : 85 11 __ STA P4 
16d3 : ad f9 9f LDA $9ff9 ; (sstack + 7)
16d6 : 85 12 __ STA P5 
16d8 : ad fa 9f LDA $9ffa ; (sstack + 8)
16db : 85 13 __ STA P6 
16dd : ad fb 9f LDA $9ffb ; (sstack + 9)
16e0 : 85 14 __ STA P7 
16e2 : ad fc 9f LDA $9ffc ; (sstack + 10)
16e5 : 85 15 __ STA P8 
16e7 : ad fd 9f LDA $9ffd ; (sstack + 11)
16ea : 85 16 __ STA P9 
16ec : ad fe 9f LDA $9ffe ; (sstack + 12)
16ef : 85 17 __ STA P10 
16f1 : ad ff 9f LDA $9fff ; (sstack + 13)
16f4 : 85 18 __ STA P11 
16f6 : 20 8f 19 JSR $198f ; (bmu_line.s4 + 0)
.s3:
16f9 : a2 0d __ LDX #$0d
16fb : bd e4 9f LDA $9fe4,x ; (bm_line@stack + 0)
16fe : 95 53 __ STA T2 + 0,x 
1700 : ca __ __ DEX
1701 : 10 f8 __ BPL $16fb ; (bm_line.s3 + 2)
1703 : 60 __ __ RTS
.s17:
1704 : a5 5f __ LDA T8 + 0 
1706 : 85 0f __ STA P2 
1708 : a5 60 __ LDA T8 + 1 
170a : 85 10 __ STA P3 
170c : a5 57 __ LDA T4 + 0 
170e : 85 11 __ STA P4 
1710 : a5 58 __ LDA T4 + 1 
1712 : 85 12 __ STA P5 
1714 : 38 __ __ SEC
1715 : a5 43 __ LDA T0 + 0 
1717 : ed fc 9f SBC $9ffc ; (sstack + 10)
171a : 85 0d __ STA P0 
171c : a5 44 __ LDA T0 + 1 
171e : ed fd 9f SBC $9ffd ; (sstack + 11)
1721 : 85 0e __ STA P1 
1723 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
1726 : a0 02 __ LDY #$02
1728 : b1 59 __ LDA (T5 + 0),y 
172a : 8d fc 9f STA $9ffc ; (sstack + 10)
172d : c8 __ __ INY
172e : b1 59 __ LDA (T5 + 0),y 
1730 : 8d fd 9f STA $9ffd ; (sstack + 11)
1733 : ad fa 9f LDA $9ffa ; (sstack + 8)
1736 : 18 __ __ CLC
1737 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
1739 : 8d fa 9f STA $9ffa ; (sstack + 8)
173c : ad fb 9f LDA $9ffb ; (sstack + 9)
173f : 65 1c __ ADC ACCU + 1 ; (clip + 1)
1741 : 8d fb 9f STA $9ffb ; (sstack + 9)
1744 : a0 07 __ LDY #$07
1746 : b1 59 __ LDA (T5 + 0),y 
1748 : 10 03 __ BPL $174d ; (bm_line.s20 + 0)
174a : 4c 6a 16 JMP $166a ; (bm_line.s15 + 0)
.s20:
174d : a5 56 __ LDA T3 + 1 
174f : d1 59 __ CMP (T5 + 0),y 
1751 : f0 03 __ BEQ $1756 ; (bm_line.s18 + 0)
1753 : 4c 68 16 JMP $1668 ; (bm_line.s19 + 0)
.s18:
1756 : a5 55 __ LDA T3 + 0 
1758 : 88 __ __ DEY
1759 : d1 59 __ CMP (T5 + 0),y 
175b : 4c 68 16 JMP $1668 ; (bm_line.s19 + 0)
.s30:
175e : ad fc 9f LDA $9ffc ; (sstack + 10)
1761 : 85 55 __ STA T3 + 0 
1763 : ad fd 9f LDA $9ffd ; (sstack + 11)
1766 : 30 91 __ BMI $16f9 ; (bm_line.s3 + 0)
.s48:
1768 : 85 56 __ STA T3 + 1 
176a : c5 44 __ CMP T0 + 1 
176c : d0 04 __ BNE $1772 ; (bm_line.s47 + 0)
.s46:
176e : a5 55 __ LDA T3 + 0 
1770 : c5 43 __ CMP T0 + 0 
.s47:
1772 : 90 85 __ BCC $16f9 ; (bm_line.s3 + 0)
.s31:
1774 : ad f9 9f LDA $9ff9 ; (sstack + 7)
1777 : 10 03 __ BPL $177c ; (bm_line.s45 + 0)
1779 : 4c fc 17 JMP $17fc ; (bm_line.s36 + 0)
.s45:
177c : d1 59 __ CMP (T5 + 0),y 
177e : d0 05 __ BNE $1785 ; (bm_line.s44 + 0)
.s43:
1780 : ad f8 9f LDA $9ff8 ; (sstack + 6)
1783 : c5 45 __ CMP T1 + 0 
.s44:
1785 : 90 03 __ BCC $178a ; (bm_line.s32 + 0)
1787 : 4c f9 16 JMP $16f9 ; (bm_line.s3 + 0)
.s32:
178a : ad f9 9f LDA $9ff9 ; (sstack + 7)
178d : 30 6d __ BMI $17fc ; (bm_line.s36 + 0)
.s42:
178f : c5 44 __ CMP T0 + 1 
1791 : d0 05 __ BNE $1798 ; (bm_line.s41 + 0)
.s40:
1793 : ad f8 9f LDA $9ff8 ; (sstack + 6)
1796 : c5 43 __ CMP T0 + 0 
.s41:
1798 : 90 62 __ BCC $17fc ; (bm_line.s36 + 0)
.s33:
179a : a5 56 __ LDA T3 + 1 
179c : d1 59 __ CMP (T5 + 0),y 
179e : d0 04 __ BNE $17a4 ; (bm_line.s38 + 0)
.s35:
17a0 : a5 55 __ LDA T3 + 0 
17a2 : c5 45 __ CMP T1 + 0 
.s38:
17a4 : b0 03 __ BCS $17a9 ; (bm_line.s34 + 0)
17a6 : 4c ba 16 JMP $16ba ; (bm_line.s14 + 0)
.s34:
17a9 : a5 5f __ LDA T8 + 0 
17ab : 85 0f __ STA P2 
17ad : a5 60 __ LDA T8 + 1 
17af : 85 10 __ STA P3 
17b1 : a5 57 __ LDA T4 + 0 
17b3 : 85 11 __ STA P4 
17b5 : a5 58 __ LDA T4 + 1 
17b7 : 85 12 __ STA P5 
17b9 : 18 __ __ CLC
17ba : a5 55 __ LDA T3 + 0 
17bc : 69 01 __ ADC #$01
17be : a8 __ __ TAY
17bf : a5 56 __ LDA T3 + 1 
17c1 : 69 00 __ ADC #$00
17c3 : aa __ __ TAX
17c4 : 98 __ __ TYA
17c5 : 38 __ __ SEC
17c6 : a0 06 __ LDY #$06
17c8 : f1 59 __ SBC (T5 + 0),y 
17ca : 85 0d __ STA P0 
17cc : 8a __ __ TXA
17cd : c8 __ __ INY
17ce : f1 59 __ SBC (T5 + 0),y 
17d0 : 85 0e __ STA P1 
17d2 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
17d5 : ad fa 9f LDA $9ffa ; (sstack + 8)
17d8 : 38 __ __ SEC
17d9 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
17db : 8d fa 9f STA $9ffa ; (sstack + 8)
17de : ad fb 9f LDA $9ffb ; (sstack + 9)
17e1 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
17e3 : 8d fb 9f STA $9ffb ; (sstack + 9)
17e6 : a0 06 __ LDY #$06
17e8 : b1 59 __ LDA (T5 + 0),y 
17ea : 38 __ __ SEC
17eb : e9 01 __ SBC #$01
17ed : aa __ __ TAX
17ee : c8 __ __ INY
17ef : b1 59 __ LDA (T5 + 0),y 
17f1 : 8e fc 9f STX $9ffc ; (sstack + 10)
17f4 : e9 00 __ SBC #$00
17f6 : 8d fd 9f STA $9ffd ; (sstack + 11)
17f9 : 4c ba 16 JMP $16ba ; (bm_line.s14 + 0)
.s36:
17fc : a5 5f __ LDA T8 + 0 
17fe : 85 0f __ STA P2 
1800 : a5 60 __ LDA T8 + 1 
1802 : 85 10 __ STA P3 
1804 : a5 57 __ LDA T4 + 0 
1806 : 85 11 __ STA P4 
1808 : a5 58 __ LDA T4 + 1 
180a : 85 12 __ STA P5 
180c : 38 __ __ SEC
180d : a5 43 __ LDA T0 + 0 
180f : ed f8 9f SBC $9ff8 ; (sstack + 6)
1812 : 85 0d __ STA P0 
1814 : a5 44 __ LDA T0 + 1 
1816 : ed f9 9f SBC $9ff9 ; (sstack + 7)
1819 : 85 0e __ STA P1 
181b : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
181e : a0 02 __ LDY #$02
1820 : b1 59 __ LDA (T5 + 0),y 
1822 : 8d f8 9f STA $9ff8 ; (sstack + 6)
1825 : c8 __ __ INY
1826 : b1 59 __ LDA (T5 + 0),y 
1828 : 8d f9 9f STA $9ff9 ; (sstack + 7)
182b : ad f6 9f LDA $9ff6 ; (sstack + 4)
182e : 18 __ __ CLC
182f : 65 1b __ ADC ACCU + 0 ; (clip + 0)
1831 : 8d f6 9f STA $9ff6 ; (sstack + 4)
1834 : ad f7 9f LDA $9ff7 ; (sstack + 5)
1837 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
1839 : 8d f7 9f STA $9ff7 ; (sstack + 5)
183c : a0 07 __ LDY #$07
183e : b1 59 __ LDA (T5 + 0),y 
1840 : 10 03 __ BPL $1845 ; (bm_line.s39 + 0)
1842 : 4c a9 17 JMP $17a9 ; (bm_line.s34 + 0)
.s39:
1845 : a5 56 __ LDA T3 + 1 
1847 : d1 59 __ CMP (T5 + 0),y 
1849 : f0 03 __ BEQ $184e ; (bm_line.s37 + 0)
184b : 4c a4 17 JMP $17a4 ; (bm_line.s38 + 0)
.s37:
184e : a5 55 __ LDA T3 + 0 
1850 : 88 __ __ DEY
1851 : d1 59 __ CMP (T5 + 0),y 
1853 : 4c a4 17 JMP $17a4 ; (bm_line.s38 + 0)
.s52:
1856 : a5 57 __ LDA T4 + 0 
1858 : 85 0f __ STA P2 
185a : a5 58 __ LDA T4 + 1 
185c : 85 10 __ STA P3 
185e : a5 5f __ LDA T8 + 0 
1860 : 85 11 __ STA P4 
1862 : a5 60 __ LDA T8 + 1 
1864 : 85 12 __ STA P5 
1866 : 38 __ __ SEC
1867 : a5 43 __ LDA T0 + 0 
1869 : e5 5b __ SBC T6 + 0 
186b : 85 0d __ STA P0 
186d : a5 44 __ LDA T0 + 1 
186f : e5 5c __ SBC T6 + 1 
1871 : 85 0e __ STA P1 
1873 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
1876 : 18 __ __ CLC
1877 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
1879 : 65 53 __ ADC T2 + 0 
187b : aa __ __ TAX
187c : a0 00 __ LDY #$00
187e : b1 59 __ LDA (T5 + 0),y 
1880 : 8d fa 9f STA $9ffa ; (sstack + 8)
1883 : c8 __ __ INY
1884 : b1 59 __ LDA (T5 + 0),y 
1886 : 8e fc 9f STX $9ffc ; (sstack + 10)
1889 : 8d fb 9f STA $9ffb ; (sstack + 9)
188c : a5 1c __ LDA ACCU + 1 ; (clip + 1)
188e : 65 54 __ ADC T2 + 1 
1890 : 8d fd 9f STA $9ffd ; (sstack + 11)
1893 : a0 05 __ LDY #$05
1895 : b1 59 __ LDA (T5 + 0),y 
1897 : 10 03 __ BPL $189c ; (bm_line.s55 + 0)
1899 : 4c b7 15 JMP $15b7 ; (bm_line.s50 + 0)
.s55:
189c : a5 5e __ LDA T7 + 1 
189e : d1 59 __ CMP (T5 + 0),y 
18a0 : f0 03 __ BEQ $18a5 ; (bm_line.s53 + 0)
18a2 : 4c b5 15 JMP $15b5 ; (bm_line.s54 + 0)
.s53:
18a5 : a5 5d __ LDA T7 + 0 
18a7 : 88 __ __ DEY
18a8 : d1 59 __ CMP (T5 + 0),y 
18aa : 4c b5 15 JMP $15b5 ; (bm_line.s54 + 0)
.s64:
18ad : a5 5c __ LDA T6 + 1 
18af : 10 03 __ BPL $18b4 ; (bm_line.s81 + 0)
18b1 : 4c f9 16 JMP $16f9 ; (bm_line.s3 + 0)
.s81:
18b4 : c5 44 __ CMP T0 + 1 
18b6 : d0 04 __ BNE $18bc ; (bm_line.s80 + 0)
.s79:
18b8 : a5 5b __ LDA T6 + 0 
18ba : c5 43 __ CMP T0 + 0 
.s80:
18bc : 90 f3 __ BCC $18b1 ; (bm_line.s64 + 4)
.s65:
18be : a5 5e __ LDA T7 + 1 
18c0 : 30 76 __ BMI $1938 ; (bm_line.s70 + 0)
.s78:
18c2 : d1 59 __ CMP (T5 + 0),y 
18c4 : d0 04 __ BNE $18ca ; (bm_line.s77 + 0)
.s76:
18c6 : a5 5d __ LDA T7 + 0 
18c8 : c5 45 __ CMP T1 + 0 
.s77:
18ca : b0 e5 __ BCS $18b1 ; (bm_line.s64 + 4)
.s66:
18cc : a5 5e __ LDA T7 + 1 
18ce : c5 44 __ CMP T0 + 1 
18d0 : d0 04 __ BNE $18d6 ; (bm_line.s75 + 0)
.s74:
18d2 : a5 5d __ LDA T7 + 0 
18d4 : c5 43 __ CMP T0 + 0 
.s75:
18d6 : 90 60 __ BCC $1938 ; (bm_line.s70 + 0)
.s67:
18d8 : a5 5c __ LDA T6 + 1 
18da : d1 59 __ CMP (T5 + 0),y 
18dc : d0 04 __ BNE $18e2 ; (bm_line.s72 + 0)
.s69:
18de : a5 5b __ LDA T6 + 0 
18e0 : c5 45 __ CMP T1 + 0 
.s72:
18e2 : b0 03 __ BCS $18e7 ; (bm_line.s68 + 0)
18e4 : 4c 05 16 JMP $1605 ; (bm_line.s9 + 0)
.s68:
18e7 : a5 57 __ LDA T4 + 0 
18e9 : 85 0f __ STA P2 
18eb : a5 58 __ LDA T4 + 1 
18ed : 85 10 __ STA P3 
18ef : a5 5f __ LDA T8 + 0 
18f1 : 85 11 __ STA P4 
18f3 : a5 60 __ LDA T8 + 1 
18f5 : 85 12 __ STA P5 
18f7 : 18 __ __ CLC
18f8 : a5 5b __ LDA T6 + 0 
18fa : 69 01 __ ADC #$01
18fc : a8 __ __ TAY
18fd : a5 5c __ LDA T6 + 1 
18ff : 69 00 __ ADC #$00
1901 : aa __ __ TAX
1902 : 98 __ __ TYA
1903 : 38 __ __ SEC
1904 : a0 04 __ LDY #$04
1906 : f1 59 __ SBC (T5 + 0),y 
1908 : 85 0d __ STA P0 
190a : 8a __ __ TXA
190b : c8 __ __ INY
190c : f1 59 __ SBC (T5 + 0),y 
190e : 85 0e __ STA P1 
1910 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
1913 : 38 __ __ SEC
1914 : a5 53 __ LDA T2 + 0 
1916 : e5 1b __ SBC ACCU + 0 ; (clip + 0)
1918 : 8d fc 9f STA $9ffc ; (sstack + 10)
191b : a5 54 __ LDA T2 + 1 
191d : e5 1c __ SBC ACCU + 1 ; (clip + 1)
191f : 8d fd 9f STA $9ffd ; (sstack + 11)
1922 : a0 04 __ LDY #$04
1924 : b1 59 __ LDA (T5 + 0),y 
1926 : 38 __ __ SEC
1927 : e9 01 __ SBC #$01
1929 : aa __ __ TAX
192a : c8 __ __ INY
192b : b1 59 __ LDA (T5 + 0),y 
192d : 8e fa 9f STX $9ffa ; (sstack + 8)
1930 : e9 00 __ SBC #$00
1932 : 8d fb 9f STA $9ffb ; (sstack + 9)
1935 : 4c 05 16 JMP $1605 ; (bm_line.s9 + 0)
.s70:
1938 : a5 57 __ LDA T4 + 0 
193a : 85 0f __ STA P2 
193c : a5 58 __ LDA T4 + 1 
193e : 85 10 __ STA P3 
1940 : a5 5f __ LDA T8 + 0 
1942 : 85 11 __ STA P4 
1944 : a5 60 __ LDA T8 + 1 
1946 : 85 12 __ STA P5 
1948 : 38 __ __ SEC
1949 : a5 43 __ LDA T0 + 0 
194b : e5 5d __ SBC T7 + 0 
194d : 85 0d __ STA P0 
194f : a5 44 __ LDA T0 + 1 
1951 : e5 5e __ SBC T7 + 1 
1953 : 85 0e __ STA P1 
1955 : 20 f0 11 JSR $11f0 ; (lmuldiv16s.s4 + 0)
1958 : 18 __ __ CLC
1959 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
195b : 65 55 __ ADC T3 + 0 
195d : aa __ __ TAX
195e : a0 00 __ LDY #$00
1960 : b1 59 __ LDA (T5 + 0),y 
1962 : 8d f6 9f STA $9ff6 ; (sstack + 4)
1965 : c8 __ __ INY
1966 : b1 59 __ LDA (T5 + 0),y 
1968 : 8e f8 9f STX $9ff8 ; (sstack + 6)
196b : 8d f7 9f STA $9ff7 ; (sstack + 5)
196e : a5 1c __ LDA ACCU + 1 ; (clip + 1)
1970 : 65 56 __ ADC T3 + 1 
1972 : 8d f9 9f STA $9ff9 ; (sstack + 7)
1975 : a0 05 __ LDY #$05
1977 : b1 59 __ LDA (T5 + 0),y 
1979 : 10 03 __ BPL $197e ; (bm_line.s73 + 0)
197b : 4c e7 18 JMP $18e7 ; (bm_line.s68 + 0)
.s73:
197e : a5 5c __ LDA T6 + 1 
1980 : d1 59 __ CMP (T5 + 0),y 
1982 : f0 03 __ BEQ $1987 ; (bm_line.s71 + 0)
1984 : 4c e2 18 JMP $18e2 ; (bm_line.s72 + 0)
.s71:
1987 : a5 5b __ LDA T6 + 0 
1989 : 88 __ __ DEY
198a : d1 59 __ CMP (T5 + 0),y 
198c : 4c e2 18 JMP $18e2 ; (bm_line.s72 + 0)
--------------------------------------------------------------------
bmu_line: ; bmu_line(const struct Bitmap*,i16,i16,i16,i16,u8,enum LineOp)->void
; 113, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
198f : a5 17 __ LDA P10 ; (pattern + 0)
1991 : f0 03 __ BEQ $1996 ; (bmu_line.s5 + 0)
1993 : 4c 95 1e JMP $1e95 ; (bmu_line.s59 + 0)
.s5:
1996 : a5 18 __ LDA P11 ; (op + 0)
1998 : f0 01 __ BEQ $199b ; (bmu_line.s6 + 0)
199a : 60 __ __ RTS
.s6:
199b : c6 17 __ DEC P10 ; (pattern + 0)
199d : a9 02 __ LDA #$02
.s63:
199f : 85 18 __ STA P11 ; (op + 0)
.s7:
19a1 : 38 __ __ SEC
19a2 : a5 13 __ LDA P6 ; (x1 + 0)
19a4 : e5 0f __ SBC P2 ; (x0 + 0)
19a6 : 85 46 __ STA T2 + 0 
19a8 : a5 14 __ LDA P7 ; (x1 + 1)
19aa : e5 10 __ SBC P3 ; (x0 + 1)
19ac : 85 47 __ STA T2 + 1 
19ae : 10 11 __ BPL $19c1 ; (bmu_line.s8 + 0)
.s58:
19b0 : 38 __ __ SEC
19b1 : a9 00 __ LDA #$00
19b3 : e5 46 __ SBC T2 + 0 
19b5 : 85 46 __ STA T2 + 0 
19b7 : a9 00 __ LDA #$00
19b9 : e5 47 __ SBC T2 + 1 
19bb : 85 47 __ STA T2 + 1 
19bd : a9 01 __ LDA #$01
19bf : d0 02 __ BNE $19c3 ; (bmu_line.s9 + 0)
.s8:
19c1 : a9 00 __ LDA #$00
.s9:
19c3 : 85 51 __ STA T10 + 0 
19c5 : 38 __ __ SEC
19c6 : a5 15 __ LDA P8 ; (y1 + 0)
19c8 : e5 11 __ SBC P4 ; (y0 + 0)
19ca : 85 43 __ STA T0 + 0 
19cc : a5 16 __ LDA P9 ; (y1 + 1)
19ce : e5 12 __ SBC P5 ; (y0 + 1)
19d0 : 85 44 __ STA T0 + 1 
19d2 : 10 11 __ BPL $19e5 ; (bmu_line.s10 + 0)
.s57:
19d4 : 38 __ __ SEC
19d5 : a9 00 __ LDA #$00
19d7 : e5 43 __ SBC T0 + 0 
19d9 : 85 43 __ STA T0 + 0 
19db : a9 00 __ LDA #$00
19dd : e5 44 __ SBC T0 + 1 
19df : 85 44 __ STA T0 + 1 
19e1 : a9 01 __ LDA #$01
19e3 : d0 02 __ BNE $19e7 ; (bmu_line.s11 + 0)
.s10:
19e5 : a9 00 __ LDA #$00
.s11:
19e7 : 85 52 __ STA T11 + 0 
19e9 : a5 44 __ LDA T0 + 1 
19eb : c5 47 __ CMP T2 + 1 
19ed : d0 04 __ BNE $19f3 ; (bmu_line.s56 + 0)
.s55:
19ef : a5 43 __ LDA T0 + 0 
19f1 : c5 46 __ CMP T2 + 0 
.s56:
19f3 : b0 06 __ BCS $19fb ; (bmu_line.s12 + 0)
.s54:
19f5 : a5 47 __ LDA T2 + 1 
19f7 : a6 46 __ LDX T2 + 0 
19f9 : 90 04 __ BCC $19ff ; (bmu_line.s13 + 0)
.s12:
19fb : a5 44 __ LDA T0 + 1 
19fd : a6 43 __ LDX T0 + 0 
.s13:
19ff : 86 49 __ STX T4 + 0 
1a01 : 85 4a __ STA T4 + 1 
1a03 : 38 __ __ SEC
1a04 : a5 43 __ LDA T0 + 0 
1a06 : e5 46 __ SBC T2 + 0 
1a08 : 85 4b __ STA T5 + 0 
1a0a : a5 44 __ LDA T0 + 1 
1a0c : e5 47 __ SBC T2 + 1 
1a0e : 85 4c __ STA T5 + 1 
1a10 : a5 4b __ LDA T5 + 0 
1a12 : 4a __ __ LSR
1a13 : b0 0c __ BCS $1a21 ; (bmu_line.s53 + 0)
.s14:
1a15 : a5 4c __ LDA T5 + 1 
1a17 : c9 80 __ CMP #$80
1a19 : 6a __ __ ROR
1a1a : 85 4c __ STA T5 + 1 
1a1c : 66 4b __ ROR T5 + 0 
1a1e : 4c 29 1a JMP $1a29 ; (bmu_line.s15 + 0)
.s53:
1a21 : 06 43 __ ASL T0 + 0 
1a23 : 26 44 __ ROL T0 + 1 
1a25 : 06 46 __ ASL T2 + 0 
1a27 : 26 47 __ ROL T2 + 1 
.s15:
1a29 : a0 00 __ LDY #$00
1a2b : b1 0d __ LDA (P0),y ; (bm + 0)
1a2d : 85 4d __ STA T7 + 0 
1a2f : c8 __ __ INY
1a30 : b1 0d __ LDA (P0),y ; (bm + 0)
1a32 : 85 4e __ STA T7 + 1 
1a34 : a0 04 __ LDY #$04
1a36 : b1 0d __ LDA (P0),y ; (bm + 0)
1a38 : aa __ __ TAX
1a39 : 0a __ __ ASL
1a3a : 85 4f __ STA T8 + 0 
1a3c : a9 a0 __ LDA #$a0
1a3e : 8d 00 25 STA $2500 ; (BLIT_CODE[0] + 0)
1a41 : a9 a2 __ LDA #$a2
1a43 : 8d 02 25 STA $2502 ; (BLIT_CODE[0] + 2)
1a46 : a9 a5 __ LDA #$a5
1a48 : 8d 04 25 STA $2504 ; (BLIT_CODE[0] + 4)
1a4b : a9 0a __ LDA #$0a
1a4d : 8d 05 25 STA $2505 ; (BLIT_CODE[0] + 5)
1a50 : a9 00 __ LDA #$00
1a52 : 2a __ __ ROL
1a53 : 06 4f __ ASL T8 + 0 
1a55 : 2a __ __ ROL
1a56 : 06 4f __ ASL T8 + 0 
1a58 : 2a __ __ ROL
1a59 : 85 50 __ STA T8 + 1 
1a5b : a5 52 __ LDA T11 + 0 
1a5d : f0 0d __ BEQ $1a6c ; (bmu_line.s16 + 0)
.s52:
1a5f : 38 __ __ SEC
1a60 : a9 00 __ LDA #$00
1a62 : e5 4f __ SBC T8 + 0 
1a64 : 85 4f __ STA T8 + 0 
1a66 : a9 00 __ LDA #$00
1a68 : e5 50 __ SBC T8 + 1 
1a6a : 85 50 __ STA T8 + 1 
.s16:
1a6c : a5 11 __ LDA P4 ; (y0 + 0)
1a6e : 29 f8 __ AND #$f8
1a70 : 85 1b __ STA ACCU + 0 
1a72 : a5 12 __ LDA P5 ; (y0 + 1)
1a74 : 85 1c __ STA ACCU + 1 
1a76 : 8a __ __ TXA
1a77 : 20 07 20 JSR $2007 ; (mul16by8 + 0)
1a7a : 18 __ __ CLC
1a7b : a5 4d __ LDA T7 + 0 
1a7d : 65 1b __ ADC ACCU + 0 
1a7f : 85 4d __ STA T7 + 0 
1a81 : a5 4e __ LDA T7 + 1 
1a83 : 65 1c __ ADC ACCU + 1 
1a85 : aa __ __ TAX
1a86 : a5 0f __ LDA P2 ; (x0 + 0)
1a88 : 29 f8 __ AND #$f8
1a8a : 18 __ __ CLC
1a8b : 65 4d __ ADC T7 + 0 
1a8d : 85 4d __ STA T7 + 0 
1a8f : 8a __ __ TXA
1a90 : 65 10 __ ADC P3 ; (x0 + 1)
1a92 : 85 4e __ STA T7 + 1 
1a94 : a5 46 __ LDA T2 + 0 
1a96 : 05 43 __ ORA T0 + 0 
1a98 : 29 80 __ AND #$80
1a9a : 85 1b __ STA ACCU + 0 
1a9c : a5 47 __ LDA T2 + 1 
1a9e : 05 44 __ ORA T0 + 1 
1aa0 : 05 1b __ ORA ACCU + 0 
1aa2 : f0 02 __ BEQ $1aa6 ; (bmu_line.s67 + 0)
.s66:
1aa4 : a9 01 __ LDA #$01
.s67:
1aa6 : 85 1b __ STA ACCU + 0 
1aa8 : a5 11 __ LDA P4 ; (y0 + 0)
1aaa : 29 07 __ AND #$07
1aac : 8d 01 25 STA $2501 ; (BLIT_CODE[0] + 1)
1aaf : a6 49 __ LDX T4 + 0 
1ab1 : e8 __ __ INX
1ab2 : 8e 03 25 STX $2503 ; (BLIT_CODE[0] + 3)
1ab5 : a5 0f __ LDA P2 ; (x0 + 0)
1ab7 : 29 07 __ AND #$07
1ab9 : aa __ __ TAX
1aba : bd 20 24 LDA $2420,x ; (bitshift[0] + 32)
1abd : 85 48 __ STA T3 + 0 
1abf : a2 06 __ LDX #$06
1ac1 : 86 45 __ STX T1 + 0 
1ac3 : a5 18 __ LDA P11 ; (op + 0)
1ac5 : c9 02 __ CMP #$02
1ac7 : d0 03 __ BNE $1acc ; (bmu_line.s17 + 0)
1ac9 : 4c 4d 1e JMP $1e4d ; (bmu_line.s49 + 0)
.s17:
1acc : b0 03 __ BCS $1ad1 ; (bmu_line.s18 + 0)
1ace : 4c d7 1d JMP $1dd7 ; (bmu_line.s44 + 0)
.s18:
1ad1 : c9 03 __ CMP #$03
1ad3 : d0 3d __ BNE $1b12 ; (bmu_line.s19 + 0)
.s40:
1ad5 : a6 17 __ LDX P10 ; (pattern + 0)
1ad7 : e8 __ __ INX
1ad8 : f0 1e __ BEQ $1af8 ; (bmu_line.s41 + 0)
.s43:
1ada : a9 06 __ LDA #$06
1adc : 8d 06 25 STA $2506 ; (BLIT_CODE[0] + 6)
1adf : 8d 09 25 STA $2509 ; (BLIT_CODE[0] + 9)
1ae2 : a9 07 __ LDA #$07
1ae4 : 8d 07 25 STA $2507 ; (BLIT_CODE[0] + 7)
1ae7 : 8d 0b 25 STA $250b ; (BLIT_CODE[0] + 11)
1aea : a9 90 __ LDA #$90
1aec : 8d 08 25 STA $2508 ; (BLIT_CODE[0] + 8)
1aef : a9 e6 __ LDA #$e6
1af1 : 8d 0a 25 STA $250a ; (BLIT_CODE[0] + 10)
1af4 : a9 0c __ LDA #$0c
1af6 : 85 45 __ STA T1 + 0 
.s41:
1af8 : a9 51 __ LDA #$51
.s42:
1afa : a6 45 __ LDX T1 + 0 
1afc : 9d 00 25 STA $2500,x ; (BLIT_CODE[0] + 0)
1aff : a9 03 __ LDA #$03
1b01 : 9d 01 25 STA $2501,x ; (BLIT_CODE[0] + 1)
1b04 : 9d 03 25 STA $2503,x ; (BLIT_CODE[0] + 3)
1b07 : a9 91 __ LDA #$91
1b09 : 9d 02 25 STA $2502,x ; (BLIT_CODE[0] + 2)
1b0c : 8a __ __ TXA
1b0d : 18 __ __ CLC
1b0e : 69 04 __ ADC #$04
.s64:
1b10 : 85 45 __ STA T1 + 0 
.s19:
1b12 : a5 43 __ LDA T0 + 0 
1b14 : 05 44 __ ORA T0 + 1 
1b16 : f0 03 __ BEQ $1b1b ; (bmu_line.s20 + 0)
1b18 : 4c f0 1b JMP $1bf0 ; (bmu_line.s28 + 0)
.s20:
1b1b : a5 46 __ LDA T2 + 0 
1b1d : 05 47 __ ORA T2 + 1 
1b1f : f0 75 __ BEQ $1b96 ; (bmu_line.s21 + 0)
.s22:
1b21 : a9 0a __ LDA #$0a
1b23 : a6 45 __ LDX T1 + 0 
1b25 : 9d 01 25 STA $2501,x ; (BLIT_CODE[0] + 1)
1b28 : 9d 05 25 STA $2505,x ; (BLIT_CODE[0] + 5)
1b2b : a9 90 __ LDA #$90
1b2d : 9d 02 25 STA $2502,x ; (BLIT_CODE[0] + 2)
1b30 : a9 0c __ LDA #$0c
1b32 : 9d 03 25 STA $2503,x ; (BLIT_CODE[0] + 3)
1b35 : a9 a5 __ LDA #$a5
1b37 : 9d 06 25 STA $2506,x ; (BLIT_CODE[0] + 6)
1b3a : a9 03 __ LDA #$03
1b3c : 9d 07 25 STA $2507,x ; (BLIT_CODE[0] + 7)
1b3f : a9 69 __ LDA #$69
1b41 : 9d 08 25 STA $2508,x ; (BLIT_CODE[0] + 8)
1b44 : a5 51 __ LDA T10 + 0 
1b46 : f0 09 __ BEQ $1b51 ; (bmu_line.s23 + 0)
.s27:
1b48 : a9 06 __ LDA #$06
1b4a : 9d 00 25 STA $2500,x ; (BLIT_CODE[0] + 0)
1b4d : a9 26 __ LDA #$26
1b4f : d0 07 __ BNE $1b58 ; (bmu_line.s62 + 0)
.s23:
1b51 : a9 46 __ LDA #$46
1b53 : 9d 00 25 STA $2500,x ; (BLIT_CODE[0] + 0)
1b56 : a9 66 __ LDA #$66
.s62:
1b58 : 9d 04 25 STA $2504,x ; (BLIT_CODE[0] + 4)
1b5b : a9 02 __ LDA #$02
1b5d : 9d 0b 25 STA $250b,x ; (BLIT_CODE[0] + 11)
1b60 : a5 51 __ LDA T10 + 0 
1b62 : f0 0e __ BEQ $1b72 ; (bmu_line.s24 + 0)
.s26:
1b64 : a9 f8 __ LDA #$f8
1b66 : 9d 09 25 STA $2509,x ; (BLIT_CODE[0] + 9)
1b69 : a9 b0 __ LDA #$b0
1b6b : 9d 0a 25 STA $250a,x ; (BLIT_CODE[0] + 10)
1b6e : a9 c6 __ LDA #$c6
1b70 : d0 0c __ BNE $1b7e ; (bmu_line.s25 + 0)
.s24:
1b72 : a9 08 __ LDA #$08
1b74 : 9d 09 25 STA $2509,x ; (BLIT_CODE[0] + 9)
1b77 : a9 90 __ LDA #$90
1b79 : 9d 0a 25 STA $250a,x ; (BLIT_CODE[0] + 10)
1b7c : a9 e6 __ LDA #$e6
.s25:
1b7e : 9d 0c 25 STA $250c,x ; (BLIT_CODE[0] + 12)
1b81 : a9 04 __ LDA #$04
1b83 : 9d 0d 25 STA $250d,x ; (BLIT_CODE[0] + 13)
1b86 : a9 85 __ LDA #$85
1b88 : 9d 0e 25 STA $250e,x ; (BLIT_CODE[0] + 14)
1b8b : a9 03 __ LDA #$03
1b8d : 9d 0f 25 STA $250f,x ; (BLIT_CODE[0] + 15)
1b90 : 8a __ __ TXA
1b91 : 18 __ __ CLC
1b92 : 69 10 __ ADC #$10
1b94 : 85 45 __ STA T1 + 0 
.s21:
1b96 : a9 ca __ LDA #$ca
1b98 : a6 45 __ LDX T1 + 0 
1b9a : 9d 00 25 STA $2500,x ; (BLIT_CODE[0] + 0)
1b9d : a9 d0 __ LDA #$d0
1b9f : 9d 01 25 STA $2501,x ; (BLIT_CODE[0] + 1)
1ba2 : a9 c6 __ LDA #$c6
1ba4 : 9d 03 25 STA $2503,x ; (BLIT_CODE[0] + 3)
1ba7 : a9 0b __ LDA #$0b
1ba9 : 9d 04 25 STA $2504,x ; (BLIT_CODE[0] + 4)
1bac : a9 10 __ LDA #$10
1bae : 9d 05 25 STA $2505,x ; (BLIT_CODE[0] + 5)
1bb1 : a9 60 __ LDA #$60
1bb3 : 9d 07 25 STA $2507,x ; (BLIT_CODE[0] + 7)
1bb6 : e6 45 __ INC T1 + 0 
1bb8 : 38 __ __ SEC
1bb9 : a9 02 __ LDA #$02
1bbb : e5 45 __ SBC T1 + 0 
1bbd : 9d 02 25 STA $2502,x ; (BLIT_CODE[0] + 2)
1bc0 : 8a __ __ TXA
1bc1 : 18 __ __ CLC
1bc2 : 69 05 __ ADC #$05
1bc4 : 49 ff __ EOR #$ff
1bc6 : 18 __ __ CLC
1bc7 : 69 03 __ ADC #$03
1bc9 : 9d 06 25 STA $2506,x ; (BLIT_CODE[0] + 6)
1bcc : a5 4a __ LDA T4 + 1 
1bce : 85 49 __ STA T4 + 0 
1bd0 : a5 4d __ LDA T7 + 0 
1bd2 : 85 03 __ STA WORK + 0 
1bd4 : a5 4e __ LDA T7 + 1 
1bd6 : 85 04 __ STA WORK + 1 
1bd8 : a5 4b __ LDA T5 + 0 
1bda : 85 05 __ STA WORK + 2 
1bdc : a5 4c __ LDA T5 + 1 
1bde : 85 06 __ STA WORK + 3 
1be0 : a5 49 __ LDA T4 + 0 
1be2 : 85 0b __ STA WORK + 8 
1be4 : a5 48 __ LDA T3 + 0 
1be6 : 85 0a __ STA WORK + 7 
1be8 : a5 17 __ LDA P10 ; (pattern + 0)
1bea : 85 07 __ STA WORK + 4 
1bec : 20 00 25 JSR $2500 ; (BLIT_CODE[0] + 0)
.s3:
1bef : 60 __ __ RTS
.s28:
1bf0 : a5 46 __ LDA T2 + 0 
1bf2 : 05 47 __ ORA T2 + 1 
1bf4 : c9 01 __ CMP #$01
1bf6 : a9 00 __ LDA #$00
1bf8 : 6a __ __ ROR
1bf9 : 85 1c __ STA ACCU + 1 
1bfb : f0 03 __ BEQ $1c00 ; (bmu_line.s29 + 0)
1bfd : 4c 97 1d JMP $1d97 ; (bmu_line.s35 + 0)
.s29:
1c00 : a2 00 __ LDX #$00
1c02 : 86 46 __ STX T2 + 0 
1c04 : 86 47 __ STX T2 + 1 
1c06 : a5 52 __ LDA T11 + 0 
1c08 : f0 03 __ BEQ $1c0d ; (bmu_line.s30 + 0)
1c0a : 4c 2d 1d JMP $1d2d ; (bmu_line.s34 + 0)
.s30:
1c0d : a9 c8 __ LDA #$c8
1c0f : a4 45 __ LDY T1 + 0 
1c11 : 99 00 25 STA $2500,y ; (BLIT_CODE[0] + 0)
1c14 : a9 c0 __ LDA #$c0
1c16 : 99 01 25 STA $2501,y ; (BLIT_CODE[0] + 1)
1c19 : a9 08 __ LDA #$08
1c1b : 99 02 25 STA $2502,y ; (BLIT_CODE[0] + 2)
1c1e : a9 d0 __ LDA #$d0
1c20 : 99 03 25 STA $2503,y ; (BLIT_CODE[0] + 3)
1c23 : a9 a0 __ LDA #$a0
1c25 : 99 05 25 STA $2505,y ; (BLIT_CODE[0] + 5)
1c28 : a9 00 __ LDA #$00
1c2a : 99 06 25 STA $2506,y ; (BLIT_CODE[0] + 6)
1c2d : a9 a5 __ LDA #$a5
1c2f : 99 07 25 STA $2507,y ; (BLIT_CODE[0] + 7)
1c32 : 99 0d 25 STA $250d,y ; (BLIT_CODE[0] + 13)
1c35 : a9 03 __ LDA #$03
1c37 : 99 08 25 STA $2508,y ; (BLIT_CODE[0] + 8)
1c3a : 99 0c 25 STA $250c,y ; (BLIT_CODE[0] + 12)
1c3d : a9 69 __ LDA #$69
1c3f : 99 09 25 STA $2509,y ; (BLIT_CODE[0] + 9)
1c42 : 99 0f 25 STA $250f,y ; (BLIT_CODE[0] + 15)
1c45 : a9 85 __ LDA #$85
1c47 : 99 0b 25 STA $250b,y ; (BLIT_CODE[0] + 11)
1c4a : 99 11 25 STA $2511,y ; (BLIT_CODE[0] + 17)
1c4d : a9 04 __ LDA #$04
1c4f : 99 0e 25 STA $250e,y ; (BLIT_CODE[0] + 14)
1c52 : 99 12 25 STA $2512,y ; (BLIT_CODE[0] + 18)
1c55 : 8a __ __ TXA
1c56 : f0 04 __ BEQ $1c5c ; (bmu_line.s71 + 0)
.s72:
1c58 : a9 10 __ LDA #$10
1c5a : 90 02 __ BCC $1c5e ; (bmu_line.s73 + 0)
.s71:
1c5c : a9 0e __ LDA #$0e
.s73:
1c5e : 99 04 25 STA $2504,y ; (BLIT_CODE[0] + 4)
1c61 : 38 __ __ SEC
1c62 : a5 4f __ LDA T8 + 0 
1c64 : e9 01 __ SBC #$01
1c66 : 99 0a 25 STA $250a,y ; (BLIT_CODE[0] + 10)
1c69 : a5 50 __ LDA T8 + 1 
1c6b : e9 00 __ SBC #$00
1c6d : 99 10 25 STA $2510,y ; (BLIT_CODE[0] + 16)
1c70 : 98 __ __ TYA
1c71 : 18 __ __ CLC
1c72 : 69 13 __ ADC #$13
1c74 : 85 45 __ STA T1 + 0 
1c76 : a8 __ __ TAY
1c77 : 24 1c __ BIT ACCU + 1 
1c79 : 30 03 __ BMI $1c7e ; (bmu_line.s31 + 0)
1c7b : 4c 1b 1b JMP $1b1b ; (bmu_line.s20 + 0)
.s31:
1c7e : a9 a5 __ LDA #$a5
1c80 : 99 00 25 STA $2500,y ; (BLIT_CODE[0] + 0)
1c83 : a9 05 __ LDA #$05
1c85 : 99 01 25 STA $2501,y ; (BLIT_CODE[0] + 1)
1c88 : 99 06 25 STA $2506,y ; (BLIT_CODE[0] + 6)
1c8b : a9 38 __ LDA #$38
1c8d : 99 02 25 STA $2502,y ; (BLIT_CODE[0] + 2)
1c90 : a9 e9 __ LDA #$e9
1c92 : 99 03 25 STA $2503,y ; (BLIT_CODE[0] + 3)
1c95 : a9 85 __ LDA #$85
1c97 : 99 05 25 STA $2505,y ; (BLIT_CODE[0] + 5)
1c9a : a5 46 __ LDA T2 + 0 
1c9c : 99 04 25 STA $2504,y ; (BLIT_CODE[0] + 4)
1c9f : a5 1b __ LDA ACCU + 0 
1ca1 : d0 2a __ BNE $1ccd ; (bmu_line.s33 + 0)
.s32:
1ca3 : a9 10 __ LDA #$10
1ca5 : 99 07 25 STA $2507,y ; (BLIT_CODE[0] + 7)
1ca8 : a9 15 __ LDA #$15
1caa : 99 08 25 STA $2508,y ; (BLIT_CODE[0] + 8)
1cad : a9 18 __ LDA #$18
1caf : 99 09 25 STA $2509,y ; (BLIT_CODE[0] + 9)
1cb2 : a9 69 __ LDA #$69
1cb4 : 99 0a 25 STA $250a,y ; (BLIT_CODE[0] + 10)
1cb7 : a5 43 __ LDA T0 + 0 
1cb9 : 99 0b 25 STA $250b,y ; (BLIT_CODE[0] + 11)
1cbc : a9 85 __ LDA #$85
1cbe : 99 0c 25 STA $250c,y ; (BLIT_CODE[0] + 12)
1cc1 : a9 05 __ LDA #$05
1cc3 : 99 0d 25 STA $250d,y ; (BLIT_CODE[0] + 13)
1cc6 : 98 __ __ TYA
1cc7 : 18 __ __ CLC
1cc8 : 69 0e __ ADC #$0e
1cca : 4c 28 1d JMP $1d28 ; (bmu_line.s65 + 0)
.s33:
1ccd : a9 a5 __ LDA #$a5
1ccf : 99 07 25 STA $2507,y ; (BLIT_CODE[0] + 7)
1cd2 : 99 10 25 STA $2510,y ; (BLIT_CODE[0] + 16)
1cd5 : 99 16 25 STA $2516,y ; (BLIT_CODE[0] + 22)
1cd8 : a9 06 __ LDA #$06
1cda : 99 08 25 STA $2508,y ; (BLIT_CODE[0] + 8)
1cdd : 99 0c 25 STA $250c,y ; (BLIT_CODE[0] + 12)
1ce0 : 99 17 25 STA $2517,y ; (BLIT_CODE[0] + 23)
1ce3 : 99 1b 25 STA $251b,y ; (BLIT_CODE[0] + 27)
1ce6 : a9 e9 __ LDA #$e9
1ce8 : 99 09 25 STA $2509,y ; (BLIT_CODE[0] + 9)
1ceb : a9 85 __ LDA #$85
1ced : 99 0b 25 STA $250b,y ; (BLIT_CODE[0] + 11)
1cf0 : 99 14 25 STA $2514,y ; (BLIT_CODE[0] + 20)
1cf3 : 99 1a 25 STA $251a,y ; (BLIT_CODE[0] + 26)
1cf6 : a9 10 __ LDA #$10
1cf8 : 99 0d 25 STA $250d,y ; (BLIT_CODE[0] + 13)
1cfb : a9 1d __ LDA #$1d
1cfd : 99 0e 25 STA $250e,y ; (BLIT_CODE[0] + 14)
1d00 : a9 18 __ LDA #$18
1d02 : 99 0f 25 STA $250f,y ; (BLIT_CODE[0] + 15)
1d05 : a9 05 __ LDA #$05
1d07 : 99 11 25 STA $2511,y ; (BLIT_CODE[0] + 17)
1d0a : 99 15 25 STA $2515,y ; (BLIT_CODE[0] + 21)
1d0d : a9 69 __ LDA #$69
1d0f : 99 12 25 STA $2512,y ; (BLIT_CODE[0] + 18)
1d12 : 99 18 25 STA $2518,y ; (BLIT_CODE[0] + 24)
1d15 : a5 43 __ LDA T0 + 0 
1d17 : 99 13 25 STA $2513,y ; (BLIT_CODE[0] + 19)
1d1a : a5 47 __ LDA T2 + 1 
1d1c : 99 0a 25 STA $250a,y ; (BLIT_CODE[0] + 10)
1d1f : a5 44 __ LDA T0 + 1 
1d21 : 99 19 25 STA $2519,y ; (BLIT_CODE[0] + 25)
1d24 : 98 __ __ TYA
1d25 : 18 __ __ CLC
1d26 : 69 1c __ ADC #$1c
.s65:
1d28 : 85 45 __ STA T1 + 0 
1d2a : 4c 21 1b JMP $1b21 ; (bmu_line.s22 + 0)
.s34:
1d2d : a9 88 __ LDA #$88
1d2f : a4 45 __ LDY T1 + 0 
1d31 : 99 00 25 STA $2500,y ; (BLIT_CODE[0] + 0)
1d34 : a9 10 __ LDA #$10
1d36 : 99 01 25 STA $2501,y ; (BLIT_CODE[0] + 1)
1d39 : a9 18 __ LDA #$18
1d3b : 99 03 25 STA $2503,y ; (BLIT_CODE[0] + 3)
1d3e : a9 a0 __ LDA #$a0
1d40 : 99 04 25 STA $2504,y ; (BLIT_CODE[0] + 4)
1d43 : a9 07 __ LDA #$07
1d45 : 99 05 25 STA $2505,y ; (BLIT_CODE[0] + 5)
1d48 : a9 a5 __ LDA #$a5
1d4a : 99 06 25 STA $2506,y ; (BLIT_CODE[0] + 6)
1d4d : 99 0c 25 STA $250c,y ; (BLIT_CODE[0] + 12)
1d50 : a9 03 __ LDA #$03
1d52 : 99 07 25 STA $2507,y ; (BLIT_CODE[0] + 7)
1d55 : 99 0b 25 STA $250b,y ; (BLIT_CODE[0] + 11)
1d58 : a9 69 __ LDA #$69
1d5a : 99 08 25 STA $2508,y ; (BLIT_CODE[0] + 8)
1d5d : 99 0e 25 STA $250e,y ; (BLIT_CODE[0] + 14)
1d60 : a9 85 __ LDA #$85
1d62 : 99 0a 25 STA $250a,y ; (BLIT_CODE[0] + 10)
1d65 : 99 10 25 STA $2510,y ; (BLIT_CODE[0] + 16)
1d68 : a9 04 __ LDA #$04
1d6a : 99 0d 25 STA $250d,y ; (BLIT_CODE[0] + 13)
1d6d : 99 11 25 STA $2511,y ; (BLIT_CODE[0] + 17)
1d70 : 8a __ __ TXA
1d71 : f0 04 __ BEQ $1d77 ; (bmu_line.s68 + 0)
.s69:
1d73 : a9 11 __ LDA #$11
1d75 : 90 02 __ BCC $1d79 ; (bmu_line.s70 + 0)
.s68:
1d77 : a9 0f __ LDA #$0f
.s70:
1d79 : 99 02 25 STA $2502,y ; (BLIT_CODE[0] + 2)
1d7c : a5 4f __ LDA T8 + 0 
1d7e : 99 09 25 STA $2509,y ; (BLIT_CODE[0] + 9)
1d81 : a5 50 __ LDA T8 + 1 
1d83 : 99 0f 25 STA $250f,y ; (BLIT_CODE[0] + 15)
1d86 : 98 __ __ TYA
1d87 : 18 __ __ CLC
1d88 : 69 12 __ ADC #$12
1d8a : 85 45 __ STA T1 + 0 
1d8c : a8 __ __ TAY
1d8d : 24 1c __ BIT ACCU + 1 
1d8f : 10 03 __ BPL $1d94 ; (bmu_line.s70 + 27)
1d91 : 4c 7e 1c JMP $1c7e ; (bmu_line.s31 + 0)
1d94 : 4c 1b 1b JMP $1b1b ; (bmu_line.s20 + 0)
.s35:
1d97 : a9 a5 __ LDA #$a5
1d99 : a6 45 __ LDX T1 + 0 
1d9b : 9d 00 25 STA $2500,x ; (BLIT_CODE[0] + 0)
1d9e : a9 30 __ LDA #$30
1da0 : 9d 02 25 STA $2502,x ; (BLIT_CODE[0] + 2)
1da3 : a5 1b __ LDA ACCU + 0 
1da5 : 69 05 __ ADC #$05
1da7 : 9d 01 25 STA $2501,x ; (BLIT_CODE[0] + 1)
1daa : a5 1b __ LDA ACCU + 0 
1dac : d0 21 __ BNE $1dcf ; (bmu_line.s39 + 0)
.s36:
1dae : a0 1b __ LDY #$1b
1db0 : a5 52 __ LDA T11 + 0 
1db2 : d0 01 __ BNE $1db5 ; (bmu_line.s38 + 0)
.s37:
1db4 : c8 __ __ INY
.s38:
1db5 : 98 __ __ TYA
1db6 : 9d 03 25 STA $2503,x ; (BLIT_CODE[0] + 3)
1db9 : 8a __ __ TXA
1dba : 18 __ __ CLC
1dbb : 69 04 __ ADC #$04
1dbd : 85 45 __ STA T1 + 0 
1dbf : a9 00 __ LDA #$00
1dc1 : c5 1b __ CMP ACCU + 0 
1dc3 : 2a __ __ ROL
1dc4 : aa __ __ TAX
1dc5 : a5 52 __ LDA T11 + 0 
1dc7 : f0 03 __ BEQ $1dcc ; (bmu_line.s38 + 23)
1dc9 : 4c 2d 1d JMP $1d2d ; (bmu_line.s34 + 0)
1dcc : 4c 0d 1c JMP $1c0d ; (bmu_line.s30 + 0)
.s39:
1dcf : a0 21 __ LDY #$21
1dd1 : a5 52 __ LDA T11 + 0 
1dd3 : d0 e0 __ BNE $1db5 ; (bmu_line.s38 + 0)
1dd5 : f0 dd __ BEQ $1db4 ; (bmu_line.s37 + 0)
.s44:
1dd7 : a8 __ __ TAY
1dd8 : d0 4b __ BNE $1e25 ; (bmu_line.s46 + 0)
.s45:
1dda : 8e 06 25 STX $2506 ; (BLIT_CODE[0] + 6)
1ddd : 8e 09 25 STX $2509 ; (BLIT_CODE[0] + 9)
1de0 : a9 07 __ LDA #$07
1de2 : 8d 07 25 STA $2507 ; (BLIT_CODE[0] + 7)
1de5 : 8d 0b 25 STA $250b ; (BLIT_CODE[0] + 11)
1de8 : a9 03 __ LDA #$03
1dea : 8d 0d 25 STA $250d ; (BLIT_CODE[0] + 13)
1ded : 8d 13 25 STA $2513 ; (BLIT_CODE[0] + 19)
1df0 : 8d 15 25 STA $2515 ; (BLIT_CODE[0] + 21)
1df3 : a9 90 __ LDA #$90
1df5 : 8d 08 25 STA $2508 ; (BLIT_CODE[0] + 8)
1df8 : a9 e6 __ LDA #$e6
1dfa : 8d 0a 25 STA $250a ; (BLIT_CODE[0] + 10)
1dfd : a9 11 __ LDA #$11
1dff : 8d 0c 25 STA $250c ; (BLIT_CODE[0] + 12)
1e02 : a9 d0 __ LDA #$d0
1e04 : 8d 0e 25 STA $250e ; (BLIT_CODE[0] + 14)
1e07 : a9 04 __ LDA #$04
1e09 : 8d 0f 25 STA $250f ; (BLIT_CODE[0] + 15)
1e0c : a9 49 __ LDA #$49
1e0e : 8d 10 25 STA $2510 ; (BLIT_CODE[0] + 16)
1e11 : a9 ff __ LDA #$ff
1e13 : 8d 11 25 STA $2511 ; (BLIT_CODE[0] + 17)
1e16 : a9 31 __ LDA #$31
1e18 : 8d 12 25 STA $2512 ; (BLIT_CODE[0] + 18)
1e1b : a9 91 __ LDA #$91
1e1d : 8d 14 25 STA $2514 ; (BLIT_CODE[0] + 20)
1e20 : a9 16 __ LDA #$16
1e22 : 4c 10 1b JMP $1b10 ; (bmu_line.s64 + 0)
.s46:
1e25 : a6 17 __ LDX P10 ; (pattern + 0)
1e27 : e8 __ __ INX
1e28 : f0 1e __ BEQ $1e48 ; (bmu_line.s47 + 0)
.s48:
1e2a : a9 06 __ LDA #$06
1e2c : 8d 06 25 STA $2506 ; (BLIT_CODE[0] + 6)
1e2f : 8d 09 25 STA $2509 ; (BLIT_CODE[0] + 9)
1e32 : a9 07 __ LDA #$07
1e34 : 8d 07 25 STA $2507 ; (BLIT_CODE[0] + 7)
1e37 : 8d 0b 25 STA $250b ; (BLIT_CODE[0] + 11)
1e3a : a9 90 __ LDA #$90
1e3c : 8d 08 25 STA $2508 ; (BLIT_CODE[0] + 8)
1e3f : a9 e6 __ LDA #$e6
1e41 : 8d 0a 25 STA $250a ; (BLIT_CODE[0] + 10)
1e44 : a9 0c __ LDA #$0c
1e46 : 85 45 __ STA T1 + 0 
.s47:
1e48 : a9 11 __ LDA #$11
1e4a : 4c fa 1a JMP $1afa ; (bmu_line.s42 + 0)
.s49:
1e4d : a4 17 __ LDY P10 ; (pattern + 0)
1e4f : c8 __ __ INY
1e50 : f0 1e __ BEQ $1e70 ; (bmu_line.s50 + 0)
.s51:
1e52 : 8e 06 25 STX $2506 ; (BLIT_CODE[0] + 6)
1e55 : a9 07 __ LDA #$07
1e57 : 8d 07 25 STA $2507 ; (BLIT_CODE[0] + 7)
1e5a : 8d 0b 25 STA $250b ; (BLIT_CODE[0] + 11)
1e5d : a9 90 __ LDA #$90
1e5f : 8d 08 25 STA $2508 ; (BLIT_CODE[0] + 8)
1e62 : a9 08 __ LDA #$08
1e64 : 8d 09 25 STA $2509 ; (BLIT_CODE[0] + 9)
1e67 : a9 e6 __ LDA #$e6
1e69 : 8d 0a 25 STA $250a ; (BLIT_CODE[0] + 10)
1e6c : a9 0c __ LDA #$0c
1e6e : 85 45 __ STA T1 + 0 
.s50:
1e70 : a9 49 __ LDA #$49
1e72 : a6 45 __ LDX T1 + 0 
1e74 : 9d 00 25 STA $2500,x ; (BLIT_CODE[0] + 0)
1e77 : a9 ff __ LDA #$ff
1e79 : 9d 01 25 STA $2501,x ; (BLIT_CODE[0] + 1)
1e7c : a9 31 __ LDA #$31
1e7e : 9d 02 25 STA $2502,x ; (BLIT_CODE[0] + 2)
1e81 : a9 03 __ LDA #$03
1e83 : 9d 03 25 STA $2503,x ; (BLIT_CODE[0] + 3)
1e86 : 9d 05 25 STA $2505,x ; (BLIT_CODE[0] + 5)
1e89 : a9 91 __ LDA #$91
1e8b : 9d 04 25 STA $2504,x ; (BLIT_CODE[0] + 4)
1e8e : 8a __ __ TXA
1e8f : 18 __ __ CLC
1e90 : 69 06 __ ADC #$06
1e92 : 4c 10 1b JMP $1b10 ; (bmu_line.s64 + 0)
.s59:
1e95 : c9 ff __ CMP #$ff
1e97 : f0 03 __ BEQ $1e9c ; (bmu_line.s60 + 0)
1e99 : 4c a1 19 JMP $19a1 ; (bmu_line.s7 + 0)
.s60:
1e9c : a5 18 __ LDA P11 ; (op + 0)
1e9e : d0 f9 __ BNE $1e99 ; (bmu_line.s59 + 4)
.s61:
1ea0 : a9 01 __ LDA #$01
1ea2 : 4c 9f 19 JMP $199f ; (bmu_line.s63 + 0)
--------------------------------------------------------------------
xorCube: ; xorCube()->void
;  80, "/home/honza/projects/c64/projects/oscar64/samples/hires/cube3d.c"
.s1:
1ea5 : a5 53 __ LDA T2 + 0 
1ea7 : 8d e2 9f STA $9fe2 ; (xorCube@stack + 0)
.s4:
1eaa : a9 00 __ LDA #$00
1eac : 85 53 __ STA T2 + 0 
.l6:
1eae : a9 ff __ LDA #$ff
1eb0 : 8d fe 9f STA $9ffe ; (sstack + 12)
1eb3 : a9 03 __ LDA #$03
1eb5 : 8d ff 9f STA $9fff ; (sstack + 13)
1eb8 : a9 d7 __ LDA #$d7
1eba : 8d f2 9f STA $9ff2 ; (sstack + 0)
1ebd : a9 23 __ LDA #$23
1ebf : 8d f3 9f STA $9ff3 ; (sstack + 1)
1ec2 : a9 c7 __ LDA #$c7
1ec4 : 8d f4 9f STA $9ff4 ; (sstack + 2)
1ec7 : a9 23 __ LDA #$23
1ec9 : 8d f5 9f STA $9ff5 ; (sstack + 3)
1ecc : a6 53 __ LDX T2 + 0 
1ece : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1ed1 : 8d f6 9f STA $9ff6 ; (sstack + 4)
1ed4 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1ed7 : 8d f7 9f STA $9ff7 ; (sstack + 5)
1eda : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1edd : 8d f8 9f STA $9ff8 ; (sstack + 6)
1ee0 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1ee3 : 8d f9 9f STA $9ff9 ; (sstack + 7)
1ee6 : 8a __ __ TXA
1ee7 : 09 01 __ ORA #$01
1ee9 : aa __ __ TAX
1eea : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1eed : 8d fa 9f STA $9ffa ; (sstack + 8)
1ef0 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1ef3 : 8d fb 9f STA $9ffb ; (sstack + 9)
1ef6 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1ef9 : 8d fc 9f STA $9ffc ; (sstack + 10)
1efc : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1eff : 8d fd 9f STA $9ffd ; (sstack + 11)
1f02 : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
.l7:
1f05 : a5 53 __ LDA T2 + 0 
1f07 : 29 02 __ AND #$02
1f09 : d0 57 __ BNE $1f62 ; (xorCube.s9 + 0)
.s8:
1f0b : a9 ff __ LDA #$ff
1f0d : 8d fe 9f STA $9ffe ; (sstack + 12)
1f10 : a9 03 __ LDA #$03
1f12 : 8d ff 9f STA $9fff ; (sstack + 13)
1f15 : a9 d7 __ LDA #$d7
1f17 : 8d f2 9f STA $9ff2 ; (sstack + 0)
1f1a : a9 23 __ LDA #$23
1f1c : 8d f3 9f STA $9ff3 ; (sstack + 1)
1f1f : a9 c7 __ LDA #$c7
1f21 : 8d f4 9f STA $9ff4 ; (sstack + 2)
1f24 : a9 23 __ LDA #$23
1f26 : 8d f5 9f STA $9ff5 ; (sstack + 3)
1f29 : a6 53 __ LDX T2 + 0 
1f2b : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1f2e : 8d f6 9f STA $9ff6 ; (sstack + 4)
1f31 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1f34 : 8d f7 9f STA $9ff7 ; (sstack + 5)
1f37 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1f3a : 8d f8 9f STA $9ff8 ; (sstack + 6)
1f3d : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1f40 : 8d f9 9f STA $9ff9 ; (sstack + 7)
1f43 : 8a __ __ TXA
1f44 : 09 02 __ ORA #$02
1f46 : aa __ __ TAX
1f47 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1f4a : 8d fa 9f STA $9ffa ; (sstack + 8)
1f4d : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1f50 : 8d fb 9f STA $9ffb ; (sstack + 9)
1f53 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1f56 : 8d fc 9f STA $9ffc ; (sstack + 10)
1f59 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1f5c : 8d fd 9f STA $9ffd ; (sstack + 11)
1f5f : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
.s9:
1f62 : a5 53 __ LDA T2 + 0 
1f64 : 29 04 __ AND #$04
1f66 : d0 57 __ BNE $1fbf ; (xorCube.s11 + 0)
.s10:
1f68 : a9 ff __ LDA #$ff
1f6a : 8d fe 9f STA $9ffe ; (sstack + 12)
1f6d : a9 03 __ LDA #$03
1f6f : 8d ff 9f STA $9fff ; (sstack + 13)
1f72 : a9 d7 __ LDA #$d7
1f74 : 8d f2 9f STA $9ff2 ; (sstack + 0)
1f77 : a9 23 __ LDA #$23
1f79 : 8d f3 9f STA $9ff3 ; (sstack + 1)
1f7c : a9 c7 __ LDA #$c7
1f7e : 8d f4 9f STA $9ff4 ; (sstack + 2)
1f81 : a9 23 __ LDA #$23
1f83 : 8d f5 9f STA $9ff5 ; (sstack + 3)
1f86 : a6 53 __ LDX T2 + 0 
1f88 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1f8b : 8d f6 9f STA $9ff6 ; (sstack + 4)
1f8e : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1f91 : 8d f7 9f STA $9ff7 ; (sstack + 5)
1f94 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1f97 : 8d f8 9f STA $9ff8 ; (sstack + 6)
1f9a : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1f9d : 8d f9 9f STA $9ff9 ; (sstack + 7)
1fa0 : 8a __ __ TXA
1fa1 : 09 04 __ ORA #$04
1fa3 : aa __ __ TAX
1fa4 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1fa7 : 8d fa 9f STA $9ffa ; (sstack + 8)
1faa : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1fad : 8d fb 9f STA $9ffb ; (sstack + 9)
1fb0 : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1fb3 : 8d fc 9f STA $9ffc ; (sstack + 10)
1fb6 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1fb9 : 8d fd 9f STA $9ffd ; (sstack + 11)
1fbc : 20 14 15 JSR $1514 ; (bm_line.s1 + 0)
.s11:
1fbf : a6 53 __ LDX T2 + 0 
1fc1 : bd 7a 24 LDA $247a,x ; (tcorners[0].x + 0)
1fc4 : 9d 9a 24 STA $249a,x ; (pcorners[0].x + 0)
1fc7 : bd 82 24 LDA $2482,x ; (tcorners[0].x + 0)
1fca : 9d a2 24 STA $24a2,x ; (pcorners[0].x + 0)
1fcd : bd 8a 24 LDA $248a,x ; (tcorners[0].y + 0)
1fd0 : 9d aa 24 STA $24aa,x ; (pcorners[0].y + 0)
1fd3 : bd 92 24 LDA $2492,x ; (tcorners[0].y + 0)
1fd6 : 9d b2 24 STA $24b2,x ; (pcorners[0].y + 0)
1fd9 : e8 __ __ INX
1fda : 8a __ __ TXA
1fdb : e0 08 __ CPX #$08
1fdd : f0 0b __ BEQ $1fea ; (xorCube.s3 + 0)
.s5:
1fdf : 85 53 __ STA T2 + 0 
1fe1 : 4a __ __ LSR
1fe2 : 90 03 __ BCC $1fe7 ; (xorCube.s5 + 8)
1fe4 : 4c 05 1f JMP $1f05 ; (xorCube.l7 + 0)
1fe7 : 4c ae 1e JMP $1eae ; (xorCube.l6 + 0)
.s3:
1fea : ad e2 9f LDA $9fe2 ; (xorCube@stack + 0)
1fed : 85 53 __ STA T2 + 0 
1fef : 60 __ __ RTS
--------------------------------------------------------------------
done: ; done()->void
;  33, "/home/honza/projects/c64/projects/oscar64/samples/hires/cube3d.c"
.s4:
1ff0 : a9 00 __ LDA #$00
1ff2 : 85 0d __ STA P0 
1ff4 : 85 0e __ STA P1 
1ff6 : 85 10 __ STA P3 
1ff8 : a9 37 __ LDA #$37
1ffa : 85 01 __ STA $01 
1ffc : a9 04 __ LDA #$04
1ffe : 85 0f __ STA P2 
2000 : a9 10 __ LDA #$10
2002 : 85 11 __ STA P4 
2004 : 4c 10 0b JMP $0b10 ; (vic_setmode.s4 + 0)
--------------------------------------------------------------------
mul16by8: ; mul16by8
2007 : 4a __ __ LSR
2008 : f0 2e __ BEQ $2038 ; (mul16by8 + 49)
200a : a2 00 __ LDX #$00
200c : a0 00 __ LDY #$00
200e : 90 13 __ BCC $2023 ; (mul16by8 + 28)
2010 : a4 1b __ LDY ACCU + 0 
2012 : a6 1c __ LDX ACCU + 1 
2014 : b0 0d __ BCS $2023 ; (mul16by8 + 28)
2016 : 85 02 __ STA $02 
2018 : 18 __ __ CLC
2019 : 98 __ __ TYA
201a : 65 1b __ ADC ACCU + 0 
201c : a8 __ __ TAY
201d : 8a __ __ TXA
201e : 65 1c __ ADC ACCU + 1 
2020 : aa __ __ TAX
2021 : a5 02 __ LDA $02 
2023 : 06 1b __ ASL ACCU + 0 
2025 : 26 1c __ ROL ACCU + 1 
2027 : 4a __ __ LSR
2028 : 90 f9 __ BCC $2023 ; (mul16by8 + 28)
202a : d0 ea __ BNE $2016 ; (mul16by8 + 15)
202c : 18 __ __ CLC
202d : 98 __ __ TYA
202e : 65 1b __ ADC ACCU + 0 
2030 : 85 1b __ STA ACCU + 0 
2032 : 8a __ __ TXA
2033 : 65 1c __ ADC ACCU + 1 
2035 : 85 1c __ STA ACCU + 1 
2037 : 60 __ __ RTS
2038 : b0 04 __ BCS $203e ; (mul16by8 + 55)
203a : 85 1b __ STA ACCU + 0 
203c : 85 1c __ STA ACCU + 1 
203e : 60 __ __ RTS
--------------------------------------------------------------------
freg: ; freg
203f : b1 19 __ LDA (IP + 0),y 
2041 : c8 __ __ INY
2042 : aa __ __ TAX
2043 : b5 00 __ LDA $00,x 
2045 : 85 03 __ STA WORK + 0 
2047 : b5 01 __ LDA $01,x 
2049 : 85 04 __ STA WORK + 1 
204b : b5 02 __ LDA $02,x 
204d : 85 05 __ STA WORK + 2 
204f : b5 03 __ LDA WORK + 0,x 
2051 : 85 06 __ STA WORK + 3 
2053 : a5 05 __ LDA WORK + 2 
2055 : 0a __ __ ASL
2056 : a5 06 __ LDA WORK + 3 
2058 : 2a __ __ ROL
2059 : 85 08 __ STA WORK + 5 
205b : f0 06 __ BEQ $2063 ; (freg + 36)
205d : a5 05 __ LDA WORK + 2 
205f : 09 80 __ ORA #$80
2061 : 85 05 __ STA WORK + 2 
2063 : a5 1d __ LDA ACCU + 2 
2065 : 0a __ __ ASL
2066 : a5 1e __ LDA ACCU + 3 
2068 : 2a __ __ ROL
2069 : 85 07 __ STA WORK + 4 
206b : f0 06 __ BEQ $2073 ; (freg + 52)
206d : a5 1d __ LDA ACCU + 2 
206f : 09 80 __ ORA #$80
2071 : 85 1d __ STA ACCU + 2 
2073 : 60 __ __ RTS
2074 : 06 1e __ ASL ACCU + 3 
2076 : a5 07 __ LDA WORK + 4 
2078 : 6a __ __ ROR
2079 : 85 1e __ STA ACCU + 3 
207b : b0 06 __ BCS $2083 ; (freg + 68)
207d : a5 1d __ LDA ACCU + 2 
207f : 29 7f __ AND #$7f
2081 : 85 1d __ STA ACCU + 2 
2083 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
2084 : a5 06 __ LDA WORK + 3 
2086 : 49 80 __ EOR #$80
2088 : 85 06 __ STA WORK + 3 
208a : a9 ff __ LDA #$ff
208c : c5 07 __ CMP WORK + 4 
208e : f0 04 __ BEQ $2094 ; (faddsub + 16)
2090 : c5 08 __ CMP WORK + 5 
2092 : d0 11 __ BNE $20a5 ; (faddsub + 33)
2094 : a5 1e __ LDA ACCU + 3 
2096 : 09 7f __ ORA #$7f
2098 : 85 1e __ STA ACCU + 3 
209a : a9 80 __ LDA #$80
209c : 85 1d __ STA ACCU + 2 
209e : a9 00 __ LDA #$00
20a0 : 85 1b __ STA ACCU + 0 
20a2 : 85 1c __ STA ACCU + 1 
20a4 : 60 __ __ RTS
20a5 : 38 __ __ SEC
20a6 : a5 07 __ LDA WORK + 4 
20a8 : e5 08 __ SBC WORK + 5 
20aa : f0 38 __ BEQ $20e4 ; (faddsub + 96)
20ac : aa __ __ TAX
20ad : b0 25 __ BCS $20d4 ; (faddsub + 80)
20af : e0 e9 __ CPX #$e9
20b1 : b0 0e __ BCS $20c1 ; (faddsub + 61)
20b3 : a5 08 __ LDA WORK + 5 
20b5 : 85 07 __ STA WORK + 4 
20b7 : a9 00 __ LDA #$00
20b9 : 85 1b __ STA ACCU + 0 
20bb : 85 1c __ STA ACCU + 1 
20bd : 85 1d __ STA ACCU + 2 
20bf : f0 23 __ BEQ $20e4 ; (faddsub + 96)
20c1 : a5 1d __ LDA ACCU + 2 
20c3 : 4a __ __ LSR
20c4 : 66 1c __ ROR ACCU + 1 
20c6 : 66 1b __ ROR ACCU + 0 
20c8 : e8 __ __ INX
20c9 : d0 f8 __ BNE $20c3 ; (faddsub + 63)
20cb : 85 1d __ STA ACCU + 2 
20cd : a5 08 __ LDA WORK + 5 
20cf : 85 07 __ STA WORK + 4 
20d1 : 4c e4 20 JMP $20e4 ; (faddsub + 96)
20d4 : e0 18 __ CPX #$18
20d6 : b0 33 __ BCS $210b ; (faddsub + 135)
20d8 : a5 05 __ LDA WORK + 2 
20da : 4a __ __ LSR
20db : 66 04 __ ROR WORK + 1 
20dd : 66 03 __ ROR WORK + 0 
20df : ca __ __ DEX
20e0 : d0 f8 __ BNE $20da ; (faddsub + 86)
20e2 : 85 05 __ STA WORK + 2 
20e4 : a5 1e __ LDA ACCU + 3 
20e6 : 29 80 __ AND #$80
20e8 : 85 1e __ STA ACCU + 3 
20ea : 45 06 __ EOR WORK + 3 
20ec : 30 31 __ BMI $211f ; (faddsub + 155)
20ee : 18 __ __ CLC
20ef : a5 1b __ LDA ACCU + 0 
20f1 : 65 03 __ ADC WORK + 0 
20f3 : 85 1b __ STA ACCU + 0 
20f5 : a5 1c __ LDA ACCU + 1 
20f7 : 65 04 __ ADC WORK + 1 
20f9 : 85 1c __ STA ACCU + 1 
20fb : a5 1d __ LDA ACCU + 2 
20fd : 65 05 __ ADC WORK + 2 
20ff : 85 1d __ STA ACCU + 2 
2101 : 90 08 __ BCC $210b ; (faddsub + 135)
2103 : 66 1d __ ROR ACCU + 2 
2105 : 66 1c __ ROR ACCU + 1 
2107 : 66 1b __ ROR ACCU + 0 
2109 : e6 07 __ INC WORK + 4 
210b : a5 07 __ LDA WORK + 4 
210d : c9 ff __ CMP #$ff
210f : f0 83 __ BEQ $2094 ; (faddsub + 16)
2111 : 4a __ __ LSR
2112 : 05 1e __ ORA ACCU + 3 
2114 : 85 1e __ STA ACCU + 3 
2116 : b0 06 __ BCS $211e ; (faddsub + 154)
2118 : a5 1d __ LDA ACCU + 2 
211a : 29 7f __ AND #$7f
211c : 85 1d __ STA ACCU + 2 
211e : 60 __ __ RTS
211f : 38 __ __ SEC
2120 : a5 1b __ LDA ACCU + 0 
2122 : e5 03 __ SBC WORK + 0 
2124 : 85 1b __ STA ACCU + 0 
2126 : a5 1c __ LDA ACCU + 1 
2128 : e5 04 __ SBC WORK + 1 
212a : 85 1c __ STA ACCU + 1 
212c : a5 1d __ LDA ACCU + 2 
212e : e5 05 __ SBC WORK + 2 
2130 : 85 1d __ STA ACCU + 2 
2132 : b0 19 __ BCS $214d ; (faddsub + 201)
2134 : 38 __ __ SEC
2135 : a9 00 __ LDA #$00
2137 : e5 1b __ SBC ACCU + 0 
2139 : 85 1b __ STA ACCU + 0 
213b : a9 00 __ LDA #$00
213d : e5 1c __ SBC ACCU + 1 
213f : 85 1c __ STA ACCU + 1 
2141 : a9 00 __ LDA #$00
2143 : e5 1d __ SBC ACCU + 2 
2145 : 85 1d __ STA ACCU + 2 
2147 : a5 1e __ LDA ACCU + 3 
2149 : 49 80 __ EOR #$80
214b : 85 1e __ STA ACCU + 3 
214d : a5 1d __ LDA ACCU + 2 
214f : 30 ba __ BMI $210b ; (faddsub + 135)
2151 : 05 1c __ ORA ACCU + 1 
2153 : 05 1b __ ORA ACCU + 0 
2155 : f0 0f __ BEQ $2166 ; (faddsub + 226)
2157 : c6 07 __ DEC WORK + 4 
2159 : f0 0b __ BEQ $2166 ; (faddsub + 226)
215b : 06 1b __ ASL ACCU + 0 
215d : 26 1c __ ROL ACCU + 1 
215f : 26 1d __ ROL ACCU + 2 
2161 : 10 f4 __ BPL $2157 ; (faddsub + 211)
2163 : 4c 0b 21 JMP $210b ; (faddsub + 135)
2166 : a9 00 __ LDA #$00
2168 : 85 1b __ STA ACCU + 0 
216a : 85 1c __ STA ACCU + 1 
216c : 85 1d __ STA ACCU + 2 
216e : 85 1e __ STA ACCU + 3 
2170 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
2171 : a5 1b __ LDA ACCU + 0 
2173 : 05 1c __ ORA ACCU + 1 
2175 : 05 1d __ ORA ACCU + 2 
2177 : f0 0e __ BEQ $2187 ; (crt_fmul + 22)
2179 : a5 03 __ LDA WORK + 0 
217b : 05 04 __ ORA WORK + 1 
217d : 05 05 __ ORA WORK + 2 
217f : d0 09 __ BNE $218a ; (crt_fmul + 25)
2181 : 85 1b __ STA ACCU + 0 
2183 : 85 1c __ STA ACCU + 1 
2185 : 85 1d __ STA ACCU + 2 
2187 : 85 1e __ STA ACCU + 3 
2189 : 60 __ __ RTS
218a : a5 1e __ LDA ACCU + 3 
218c : 45 06 __ EOR WORK + 3 
218e : 29 80 __ AND #$80
2190 : 85 1e __ STA ACCU + 3 
2192 : a9 ff __ LDA #$ff
2194 : c5 07 __ CMP WORK + 4 
2196 : f0 42 __ BEQ $21da ; (crt_fmul + 105)
2198 : c5 08 __ CMP WORK + 5 
219a : f0 3e __ BEQ $21da ; (crt_fmul + 105)
219c : a9 00 __ LDA #$00
219e : 85 09 __ STA WORK + 6 
21a0 : 85 0a __ STA WORK + 7 
21a2 : 85 0b __ STA WORK + 8 
21a4 : a4 1b __ LDY ACCU + 0 
21a6 : a5 03 __ LDA WORK + 0 
21a8 : d0 06 __ BNE $21b0 ; (crt_fmul + 63)
21aa : a5 04 __ LDA WORK + 1 
21ac : f0 0a __ BEQ $21b8 ; (crt_fmul + 71)
21ae : d0 05 __ BNE $21b5 ; (crt_fmul + 68)
21b0 : 20 0b 22 JSR $220b ; (crt_fmul8 + 0)
21b3 : a5 04 __ LDA WORK + 1 
21b5 : 20 0b 22 JSR $220b ; (crt_fmul8 + 0)
21b8 : a5 05 __ LDA WORK + 2 
21ba : 20 0b 22 JSR $220b ; (crt_fmul8 + 0)
21bd : 38 __ __ SEC
21be : a5 0b __ LDA WORK + 8 
21c0 : 30 06 __ BMI $21c8 ; (crt_fmul + 87)
21c2 : 06 09 __ ASL WORK + 6 
21c4 : 26 0a __ ROL WORK + 7 
21c6 : 2a __ __ ROL
21c7 : 18 __ __ CLC
21c8 : 29 7f __ AND #$7f
21ca : 85 0b __ STA WORK + 8 
21cc : a5 07 __ LDA WORK + 4 
21ce : 65 08 __ ADC WORK + 5 
21d0 : 90 19 __ BCC $21eb ; (crt_fmul + 122)
21d2 : e9 7f __ SBC #$7f
21d4 : b0 04 __ BCS $21da ; (crt_fmul + 105)
21d6 : c9 ff __ CMP #$ff
21d8 : d0 15 __ BNE $21ef ; (crt_fmul + 126)
21da : a5 1e __ LDA ACCU + 3 
21dc : 09 7f __ ORA #$7f
21de : 85 1e __ STA ACCU + 3 
21e0 : a9 80 __ LDA #$80
21e2 : 85 1d __ STA ACCU + 2 
21e4 : a9 00 __ LDA #$00
21e6 : 85 1b __ STA ACCU + 0 
21e8 : 85 1c __ STA ACCU + 1 
21ea : 60 __ __ RTS
21eb : e9 7e __ SBC #$7e
21ed : 90 15 __ BCC $2204 ; (crt_fmul + 147)
21ef : 4a __ __ LSR
21f0 : 05 1e __ ORA ACCU + 3 
21f2 : 85 1e __ STA ACCU + 3 
21f4 : a9 00 __ LDA #$00
21f6 : 6a __ __ ROR
21f7 : 05 0b __ ORA WORK + 8 
21f9 : 85 1d __ STA ACCU + 2 
21fb : a5 0a __ LDA WORK + 7 
21fd : 85 1c __ STA ACCU + 1 
21ff : a5 09 __ LDA WORK + 6 
2201 : 85 1b __ STA ACCU + 0 
2203 : 60 __ __ RTS
2204 : a9 00 __ LDA #$00
2206 : 85 1e __ STA ACCU + 3 
2208 : f0 d8 __ BEQ $21e2 ; (crt_fmul + 113)
220a : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
220b : 38 __ __ SEC
220c : 6a __ __ ROR
220d : 90 1e __ BCC $222d ; (crt_fmul8 + 34)
220f : aa __ __ TAX
2210 : 18 __ __ CLC
2211 : 98 __ __ TYA
2212 : 65 09 __ ADC WORK + 6 
2214 : 85 09 __ STA WORK + 6 
2216 : a5 0a __ LDA WORK + 7 
2218 : 65 1c __ ADC ACCU + 1 
221a : 85 0a __ STA WORK + 7 
221c : a5 0b __ LDA WORK + 8 
221e : 65 1d __ ADC ACCU + 2 
2220 : 6a __ __ ROR
2221 : 85 0b __ STA WORK + 8 
2223 : 8a __ __ TXA
2224 : 66 0a __ ROR WORK + 7 
2226 : 66 09 __ ROR WORK + 6 
2228 : 4a __ __ LSR
2229 : f0 0d __ BEQ $2238 ; (crt_fmul8 + 45)
222b : b0 e2 __ BCS $220f ; (crt_fmul8 + 4)
222d : 66 0b __ ROR WORK + 8 
222f : 66 0a __ ROR WORK + 7 
2231 : 66 09 __ ROR WORK + 6 
2233 : 4a __ __ LSR
2234 : 90 f7 __ BCC $222d ; (crt_fmul8 + 34)
2236 : d0 d7 __ BNE $220f ; (crt_fmul8 + 4)
2238 : 60 __ __ RTS
--------------------------------------------------------------------
fround: ; fround
2239 : 24 1e __ BIT ACCU + 3 
223b : 10 13 __ BPL $2250 ; (fround + 23)
223d : 30 6b __ BMI $22aa ; (fround + 113)
223f : 24 1e __ BIT ACCU + 3 
2241 : 30 0d __ BMI $2250 ; (fround + 23)
2243 : 10 65 __ BPL $22aa ; (fround + 113)
2245 : a9 00 __ LDA #$00
2247 : 85 1b __ STA ACCU + 0 
2249 : 85 1c __ STA ACCU + 1 
224b : 85 1d __ STA ACCU + 2 
224d : 85 1e __ STA ACCU + 3 
224f : 60 __ __ RTS
2250 : a5 07 __ LDA WORK + 4 
2252 : c9 7f __ CMP #$7f
2254 : 90 ef __ BCC $2245 ; (fround + 12)
2256 : c9 87 __ CMP #$87
2258 : 90 16 __ BCC $2270 ; (fround + 55)
225a : c9 8f __ CMP #$8f
225c : 90 26 __ BCC $2284 ; (fround + 75)
225e : c9 97 __ CMP #$97
2260 : b0 34 __ BCS $2296 ; (fround + 93)
2262 : 38 __ __ SEC
2263 : e9 8f __ SBC #$8f
2265 : aa __ __ TAX
2266 : a5 1b __ LDA ACCU + 0 
2268 : 3d cf 23 AND $23cf,x ; (ubitmask[0] + 0)
226b : 85 1b __ STA ACCU + 0 
226d : 4c 96 22 JMP $2296 ; (fround + 93)
2270 : 38 __ __ SEC
2271 : e9 7f __ SBC #$7f
2273 : aa __ __ TAX
2274 : a5 1d __ LDA ACCU + 2 
2276 : 3d cf 23 AND $23cf,x ; (ubitmask[0] + 0)
2279 : 85 1d __ STA ACCU + 2 
227b : a9 00 __ LDA #$00
227d : 85 1b __ STA ACCU + 0 
227f : 85 1c __ STA ACCU + 1 
2281 : 4c 96 22 JMP $2296 ; (fround + 93)
2284 : 38 __ __ SEC
2285 : e9 87 __ SBC #$87
2287 : aa __ __ TAX
2288 : a5 1c __ LDA ACCU + 1 
228a : 3d cf 23 AND $23cf,x ; (ubitmask[0] + 0)
228d : 85 1c __ STA ACCU + 1 
228f : a9 00 __ LDA #$00
2291 : 85 1b __ STA ACCU + 0 
2293 : 4c 96 22 JMP $2296 ; (fround + 93)
2296 : 4c 74 20 JMP $2074 ; (freg + 53)
2299 : a9 7f __ LDA #$7f
229b : 85 07 __ STA WORK + 4 
229d : a9 00 __ LDA #$00
229f : 85 1b __ STA ACCU + 0 
22a1 : 85 1c __ STA ACCU + 1 
22a3 : a9 80 __ LDA #$80
22a5 : 85 1d __ STA ACCU + 2 
22a7 : 4c 74 20 JMP $2074 ; (freg + 53)
22aa : a5 1b __ LDA ACCU + 0 
22ac : 05 1c __ ORA ACCU + 1 
22ae : 05 1d __ ORA ACCU + 2 
22b0 : f0 93 __ BEQ $2245 ; (fround + 12)
22b2 : a5 07 __ LDA WORK + 4 
22b4 : c9 7f __ CMP #$7f
22b6 : 90 e1 __ BCC $2299 ; (fround + 96)
22b8 : c9 87 __ CMP #$87
22ba : 90 2e __ BCC $22ea ; (fround + 177)
22bc : c9 8f __ CMP #$8f
22be : 90 4c __ BCC $230c ; (fround + 211)
22c0 : c9 97 __ CMP #$97
22c2 : b0 6c __ BCS $2330 ; (fround + 247)
22c4 : 38 __ __ SEC
22c5 : e9 8f __ SBC #$8f
22c7 : aa __ __ TAX
22c8 : 18 __ __ CLC
22c9 : bd cf 23 LDA $23cf,x ; (ubitmask[0] + 0)
22cc : 49 ff __ EOR #$ff
22ce : 65 1b __ ADC ACCU + 0 
22d0 : 85 1b __ STA ACCU + 0 
22d2 : a9 00 __ LDA #$00
22d4 : 65 1c __ ADC ACCU + 1 
22d6 : 85 1c __ STA ACCU + 1 
22d8 : a9 00 __ LDA #$00
22da : 65 1d __ ADC ACCU + 2 
22dc : 90 07 __ BCC $22e5 ; (fround + 172)
22de : 6a __ __ ROR
22df : 66 1c __ ROR ACCU + 1 
22e1 : 66 1b __ ROR ACCU + 0 
22e3 : e6 07 __ INC WORK + 4 
22e5 : 85 1d __ STA ACCU + 2 
22e7 : 4c 50 22 JMP $2250 ; (fround + 23)
22ea : 38 __ __ SEC
22eb : e9 7f __ SBC #$7f
22ed : aa __ __ TAX
22ee : 18 __ __ CLC
22ef : a9 ff __ LDA #$ff
22f1 : 65 1b __ ADC ACCU + 0 
22f3 : a9 ff __ LDA #$ff
22f5 : 65 1c __ ADC ACCU + 1 
22f7 : bd cf 23 LDA $23cf,x ; (ubitmask[0] + 0)
22fa : 49 ff __ EOR #$ff
22fc : 65 1d __ ADC ACCU + 2 
22fe : 90 07 __ BCC $2307 ; (fround + 206)
2300 : 6a __ __ ROR
2301 : 66 1c __ ROR ACCU + 1 
2303 : 66 1b __ ROR ACCU + 0 
2305 : e6 07 __ INC WORK + 4 
2307 : 85 1d __ STA ACCU + 2 
2309 : 4c 50 22 JMP $2250 ; (fround + 23)
230c : 38 __ __ SEC
230d : e9 87 __ SBC #$87
230f : aa __ __ TAX
2310 : 18 __ __ CLC
2311 : a9 ff __ LDA #$ff
2313 : 65 1b __ ADC ACCU + 0 
2315 : bd cf 23 LDA $23cf,x ; (ubitmask[0] + 0)
2318 : 49 ff __ EOR #$ff
231a : 65 1c __ ADC ACCU + 1 
231c : 85 1c __ STA ACCU + 1 
231e : a9 00 __ LDA #$00
2320 : 65 1d __ ADC ACCU + 2 
2322 : 90 07 __ BCC $232b ; (fround + 242)
2324 : 6a __ __ ROR
2325 : 66 1c __ ROR ACCU + 1 
2327 : 66 1b __ ROR ACCU + 0 
2329 : e6 07 __ INC WORK + 4 
232b : 85 1d __ STA ACCU + 2 
232d : 4c 50 22 JMP $2250 ; (fround + 23)
2330 : 4c 74 20 JMP $2074 ; (freg + 53)
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
2333 : 20 63 20 JSR $2063 ; (freg + 36)
2336 : a5 07 __ LDA WORK + 4 
2338 : c9 7f __ CMP #$7f
233a : b0 07 __ BCS $2343 ; (f32_to_i16 + 16)
233c : a9 00 __ LDA #$00
233e : 85 1b __ STA ACCU + 0 
2340 : 85 1c __ STA ACCU + 1 
2342 : 60 __ __ RTS
2343 : e9 8e __ SBC #$8e
2345 : 90 16 __ BCC $235d ; (f32_to_i16 + 42)
2347 : 24 1e __ BIT ACCU + 3 
2349 : 30 09 __ BMI $2354 ; (f32_to_i16 + 33)
234b : a9 ff __ LDA #$ff
234d : 85 1b __ STA ACCU + 0 
234f : a9 7f __ LDA #$7f
2351 : 85 1c __ STA ACCU + 1 
2353 : 60 __ __ RTS
2354 : a9 00 __ LDA #$00
2356 : 85 1b __ STA ACCU + 0 
2358 : a9 80 __ LDA #$80
235a : 85 1c __ STA ACCU + 1 
235c : 60 __ __ RTS
235d : aa __ __ TAX
235e : a5 1c __ LDA ACCU + 1 
2360 : 46 1d __ LSR ACCU + 2 
2362 : 6a __ __ ROR
2363 : e8 __ __ INX
2364 : d0 fa __ BNE $2360 ; (f32_to_i16 + 45)
2366 : 24 1e __ BIT ACCU + 3 
2368 : 10 0e __ BPL $2378 ; (f32_to_i16 + 69)
236a : 38 __ __ SEC
236b : 49 ff __ EOR #$ff
236d : 69 00 __ ADC #$00
236f : 85 1b __ STA ACCU + 0 
2371 : a9 00 __ LDA #$00
2373 : e5 1d __ SBC ACCU + 2 
2375 : 85 1c __ STA ACCU + 1 
2377 : 60 __ __ RTS
2378 : 85 1b __ STA ACCU + 0 
237a : a5 1d __ LDA ACCU + 2 
237c : 85 1c __ STA ACCU + 1 
237e : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
237f : 24 1c __ BIT ACCU + 1 
2381 : 30 03 __ BMI $2386 ; (sint16_to_float + 7)
2383 : 4c 9d 23 JMP $239d ; (uint16_to_float + 0)
2386 : 38 __ __ SEC
2387 : a9 00 __ LDA #$00
2389 : e5 1b __ SBC ACCU + 0 
238b : 85 1b __ STA ACCU + 0 
238d : a9 00 __ LDA #$00
238f : e5 1c __ SBC ACCU + 1 
2391 : 85 1c __ STA ACCU + 1 
2393 : 20 9d 23 JSR $239d ; (uint16_to_float + 0)
2396 : a5 1e __ LDA ACCU + 3 
2398 : 09 80 __ ORA #$80
239a : 85 1e __ STA ACCU + 3 
239c : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
239d : a5 1b __ LDA ACCU + 0 
239f : 05 1c __ ORA ACCU + 1 
23a1 : d0 05 __ BNE $23a8 ; (uint16_to_float + 11)
23a3 : 85 1d __ STA ACCU + 2 
23a5 : 85 1e __ STA ACCU + 3 
23a7 : 60 __ __ RTS
23a8 : a2 8e __ LDX #$8e
23aa : a5 1c __ LDA ACCU + 1 
23ac : 30 06 __ BMI $23b4 ; (uint16_to_float + 23)
23ae : ca __ __ DEX
23af : 06 1b __ ASL ACCU + 0 
23b1 : 2a __ __ ROL
23b2 : 10 fa __ BPL $23ae ; (uint16_to_float + 17)
23b4 : 0a __ __ ASL
23b5 : 85 1d __ STA ACCU + 2 
23b7 : a5 1b __ LDA ACCU + 0 
23b9 : 85 1c __ STA ACCU + 1 
23bb : 8a __ __ TXA
23bc : 4a __ __ LSR
23bd : 85 1e __ STA ACCU + 3 
23bf : a9 00 __ LDA #$00
23c1 : 85 1b __ STA ACCU + 0 
23c3 : 66 1d __ ROR ACCU + 2 
23c5 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
23c6 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
cr:
23c7 : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
ubitmask:
23cf : __ __ __ BYT 80 c0 e0 f0 f8 fc fe ff                         : ........
--------------------------------------------------------------------
Screen:
23d7 : __ __ __ BSS	8
--------------------------------------------------------------------
rmat:
23df : __ __ __ BSS	18
--------------------------------------------------------------------
bitshift:
2400 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
2410 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
2420 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
2430 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
corners:
2438 : __ __ __ BSS	48
--------------------------------------------------------------------
tmat:
2468 : __ __ __ BSS	18
--------------------------------------------------------------------
tcorners:
247a : __ __ __ BSS	32
--------------------------------------------------------------------
pcorners:
249a : __ __ __ BSS	32
--------------------------------------------------------------------
BLIT_CODE:
2500 : __ __ __ BSS	224
