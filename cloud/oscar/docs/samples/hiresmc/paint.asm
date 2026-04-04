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
080e : 8e 80 1f STX $1f80 ; (spentry + 0)
0811 : a2 20 __ LDX #$20
0813 : a0 90 __ LDY #$90
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 21 __ CPX #$21
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
083b : a9 e1 __ LDA #$e1
083d : 85 23 __ STA SP + 0 
083f : a9 cf __ LDA #$cf
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
; 108, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/paint.c"
.s1:
0880 : a5 53 __ LDA T2 + 0 
0882 : 8d e3 cf STA $cfe3 ; (main@stack + 0)
0885 : a5 54 __ LDA T3 + 0 
0887 : 8d e4 cf STA $cfe4 ; (main@stack + 1)
.s4:
088a : 20 1e 0a JSR $0a1e ; (init.s4 + 0)
088d : a9 01 __ LDA #$01
088f : 85 53 __ STA T2 + 0 
0891 : 85 54 __ STA T3 + 0 
.l5:
0893 : 20 13 0d JSR $0d13 ; (mouse_move.s4 + 0)
0896 : a5 1b __ LDA ACCU + 0 
0898 : f0 7b __ BEQ $0915 ; (main.s6 + 0)
.s39:
089a : ad 90 20 LDA $2090 ; (mouse_lb + 0)
089d : d0 05 __ BNE $08a4 ; (main.s44 + 0)
.s40:
089f : ad a1 20 LDA $20a1 ; (joyb[0] + 0)
08a2 : f0 2f __ BEQ $08d3 ; (main.s41 + 0)
.s44:
08a4 : a5 54 __ LDA T3 + 0 
08a6 : 0a __ __ ASL
08a7 : 0a __ __ ASL
08a8 : 0a __ __ ASL
08a9 : a6 53 __ LDX T2 + 0 
08ab : 18 __ __ CLC
08ac : 7d 7c 1f ADC $1f7c,x ; (__multab32L + 0)
08af : 18 __ __ CLC
08b0 : 69 00 __ ADC #$00
08b2 : 8d f8 cf STA $cff8 ; (sstack + 8)
08b5 : a9 20 __ LDA #$20
08b7 : 69 00 __ ADC #$00
08b9 : 8d f9 cf STA $cff9 ; (sstack + 9)
08bc : a9 95 __ LDA #$95
08be : 8d f0 cf STA $cff0 ; (sstack + 0)
08c1 : a9 20 __ LDA #$20
08c3 : 8d f1 cf STA $cff1 ; (sstack + 1)
08c6 : a9 ed __ LDA #$ed
08c8 : 8d f2 cf STA $cff2 ; (sstack + 2)
08cb : a9 1f __ LDA #$1f
08cd : 8d f3 cf STA $cff3 ; (sstack + 3)
08d0 : 4c f6 08 JMP $08f6 ; (main.s43 + 0)
.s41:
08d3 : ad ff 1f LDA $1fff ; (mouse_rb + 0)
08d6 : f0 3d __ BEQ $0915 ; (main.s6 + 0)
.s42:
08d8 : a9 95 __ LDA #$95
08da : 8d f0 cf STA $cff0 ; (sstack + 0)
08dd : a9 20 __ LDA #$20
08df : 8d f1 cf STA $cff1 ; (sstack + 1)
08e2 : a9 ed __ LDA #$ed
08e4 : 8d f2 cf STA $cff2 ; (sstack + 2)
08e7 : a9 1f __ LDA #$1f
08e9 : 8d f3 cf STA $cff3 ; (sstack + 3)
08ec : a9 00 __ LDA #$00
08ee : 8d f8 cf STA $cff8 ; (sstack + 8)
08f1 : a9 20 __ LDA #$20
08f3 : 8d f9 cf STA $cff9 ; (sstack + 9)
.s43:
08f6 : ad a3 20 LDA $20a3 ; (mouse_x + 0)
08f9 : 8d f4 cf STA $cff4 ; (sstack + 4)
08fc : ad a4 20 LDA $20a4 ; (mouse_x + 1)
08ff : 8d f5 cf STA $cff5 ; (sstack + 5)
0902 : ad a5 20 LDA $20a5 ; (mouse_y + 0)
0905 : 8d f6 cf STA $cff6 ; (sstack + 6)
0908 : ad a6 20 LDA $20a6 ; (mouse_y + 1)
090b : 8d f7 cf STA $cff7 ; (sstack + 7)
090e : a9 05 __ LDA #$05
0910 : 85 18 __ STA P11 
0912 : 20 3e 0e JSR $0e3e ; (bmmc_circle_fill.s1 + 0)
.s6:
0915 : 20 9b 12 JSR $129b ; (keyb_poll.s4 + 0)
0918 : ad a7 20 LDA $20a7 ; (keyb_key + 0)
091b : c9 9b __ CMP #$9b
091d : d0 0b __ BNE $092a ; (main.s7 + 0)
.s38:
091f : a9 02 __ LDA #$02
.s35:
0921 : 85 53 __ STA T2 + 0 
0923 : a9 03 __ LDA #$03
.s45:
0925 : 85 54 __ STA T3 + 0 
0927 : 4c 95 09 JMP $0995 ; (main.l12 + 0)
.s7:
092a : b0 03 __ BCS $092f ; (main.s8 + 0)
092c : 4c be 09 JMP $09be ; (main.s23 + 0)
.s8:
092f : c9 b3 __ CMP #$b3
0931 : d0 4e __ BNE $0981 ; (main.s9 + 0)
.s22:
0933 : a9 00 __ LDA #$00
0935 : 8d f0 cf STA $cff0 ; (sstack + 0)
0938 : 8d f1 cf STA $cff1 ; (sstack + 1)
093b : 8d f2 cf STA $cff2 ; (sstack + 2)
093e : 8d f3 cf STA $cff3 ; (sstack + 3)
0941 : 8d f6 cf STA $cff6 ; (sstack + 6)
0944 : 8d f7 cf STA $cff7 ; (sstack + 7)
0947 : 8d f8 cf STA $cff8 ; (sstack + 8)
094a : 8d f9 cf STA $cff9 ; (sstack + 9)
094d : 8d fd cf STA $cffd ; (sstack + 13)
0950 : a9 20 __ LDA #$20
0952 : 85 18 __ STA P11 
0954 : a9 95 __ LDA #$95
0956 : 85 16 __ STA P9 
0958 : 8d f4 cf STA $cff4 ; (sstack + 4)
095b : a9 40 __ LDA #$40
095d : 8d fa cf STA $cffa ; (sstack + 10)
0960 : a9 01 __ LDA #$01
0962 : 8d fb cf STA $cffb ; (sstack + 11)
0965 : a9 c8 __ LDA #$c8
0967 : 8d fc cf STA $cffc ; (sstack + 12)
096a : a9 20 __ LDA #$20
096c : 85 17 __ STA P10 
096e : 8d f5 cf STA $cff5 ; (sstack + 5)
0971 : a9 00 __ LDA #$00
0973 : 8d fe cf STA $cffe ; (sstack + 14)
0976 : a9 20 __ LDA #$20
0978 : 8d ff cf STA $cfff ; (sstack + 15)
097b : 20 4c 13 JSR $134c ; (bmu_bitblit.s1 + 0)
097e : 4c 95 09 JMP $0995 ; (main.l12 + 0)
.s9:
0981 : 90 26 __ BCC $09a9 ; (main.s17 + 0)
.s10:
0983 : c9 b8 __ CMP #$b8
0985 : d0 06 __ BNE $098d ; (main.s11 + 0)
.s16:
0987 : a9 01 __ LDA #$01
0989 : 85 53 __ STA T2 + 0 
098b : d0 98 __ BNE $0925 ; (main.s45 + 0)
.s11:
098d : c9 bb __ CMP #$bb
098f : d0 04 __ BNE $0995 ; (main.l12 + 0)
.s14:
0991 : a9 02 __ LDA #$02
0993 : d0 0d __ BNE $09a2 ; (main.s15 + 0)
.l12:
0995 : 2c 11 d0 BIT $d011 
0998 : 30 fb __ BMI $0995 ; (main.l12 + 0)
.l13:
099a : 2c 11 d0 BIT $d011 
099d : 10 fb __ BPL $099a ; (main.l13 + 0)
099f : 4c 93 08 JMP $0893 ; (main.l5 + 0)
.s15:
09a2 : 85 53 __ STA T2 + 0 
09a4 : a9 02 __ LDA #$02
09a6 : 4c 25 09 JMP $0925 ; (main.s45 + 0)
.s17:
09a9 : c9 a0 __ CMP #$a0
09ab : f0 0d __ BEQ $09ba ; (main.s21 + 0)
.s18:
09ad : c9 a3 __ CMP #$a3
09af : d0 e4 __ BNE $0995 ; (main.l12 + 0)
.s19:
09b1 : a9 00 __ LDA #$00
.s20:
09b3 : 85 53 __ STA T2 + 0 
09b5 : a9 00 __ LDA #$00
09b7 : 4c 25 09 JMP $0925 ; (main.s45 + 0)
.s21:
09ba : a9 03 __ LDA #$03
09bc : d0 f5 __ BNE $09b3 ; (main.s20 + 0)
.s23:
09be : c9 93 __ CMP #$93
09c0 : d0 05 __ BNE $09c7 ; (main.s24 + 0)
.s37:
09c2 : a9 01 __ LDA #$01
09c4 : 4c 21 09 JMP $0921 ; (main.s35 + 0)
.s24:
09c7 : 90 3a __ BCC $0a03 ; (main.s29 + 0)
.s25:
09c9 : c9 95 __ CMP #$95
09cb : f0 08 __ BEQ $09d5 ; (main.s28 + 0)
.s26:
09cd : c9 98 __ CMP #$98
09cf : d0 c4 __ BNE $0995 ; (main.l12 + 0)
.s27:
09d1 : a9 02 __ LDA #$02
09d3 : d0 de __ BNE $09b3 ; (main.s20 + 0)
.s28:
09d5 : a5 53 __ LDA T2 + 0 
09d7 : 85 15 __ STA P8 
09d9 : ad a3 20 LDA $20a3 ; (mouse_x + 0)
09dc : 85 11 __ STA P4 
09de : a9 95 __ LDA #$95
09e0 : 85 0d __ STA P0 
09e2 : a9 20 __ LDA #$20
09e4 : 85 0e __ STA P1 
09e6 : a9 ed __ LDA #$ed
09e8 : 85 0f __ STA P2 
09ea : a9 1f __ LDA #$1f
09ec : 85 10 __ STA P3 
09ee : ad a4 20 LDA $20a4 ; (mouse_x + 1)
09f1 : 85 12 __ STA P5 
09f3 : ad a5 20 LDA $20a5 ; (mouse_y + 0)
09f6 : 85 13 __ STA P6 
09f8 : ad a6 20 LDA $20a6 ; (mouse_y + 1)
09fb : 85 14 __ STA P7 
09fd : 20 31 1c JSR $1c31 ; (bmmc_flood_fill.s1 + 0)
0a00 : 4c 95 09 JMP $0995 ; (main.l12 + 0)
.s29:
0a03 : c9 8b __ CMP #$8b
0a05 : d0 04 __ BNE $0a0b ; (main.s30 + 0)
.s36:
0a07 : a9 01 __ LDA #$01
0a09 : d0 a8 __ BNE $09b3 ; (main.s20 + 0)
.s30:
0a0b : b0 09 __ BCS $0a16 ; (main.s31 + 0)
.s33:
0a0d : c9 88 __ CMP #$88
0a0f : d0 84 __ BNE $0995 ; (main.l12 + 0)
.s34:
0a11 : a9 03 __ LDA #$03
0a13 : 4c 21 09 JMP $0921 ; (main.s35 + 0)
.s31:
0a16 : c9 90 __ CMP #$90
0a18 : d0 e6 __ BNE $0a00 ; (main.s28 + 43)
.s32:
0a1a : a9 01 __ LDA #$01
0a1c : d0 84 __ BNE $09a2 ; (main.s15 + 0)
--------------------------------------------------------------------
init: ; init()->void
;  26, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/paint.c"
.s4:
0a1e : 20 f9 0a JSR $0af9 ; (mmap_trampoline.s4 + 0)
0a21 : 20 43 0b JSR $0b43 ; (cia_init.s4 + 0)
0a24 : a9 00 __ LDA #$00
0a26 : 85 0f __ STA P2 
0a28 : 85 10 __ STA P3 
0a2a : a9 30 __ LDA #$30
0a2c : 85 01 __ STA $01 
0a2e : a9 40 __ LDA #$40
0a30 : 85 11 __ STA P4 
0a32 : a9 1f __ LDA #$1f
0a34 : 85 12 __ STA P5 
0a36 : a9 67 __ LDA #$67
0a38 : a2 fa __ LDX #$fa
.l6:
0a3a : ca __ __ DEX
0a3b : 9d 00 d0 STA $d000,x 
0a3e : 9d fa d0 STA $d0fa,x 
0a41 : 9d f4 d1 STA $d1f4,x 
0a44 : 9d ee d2 STA $d2ee,x 
0a47 : d0 f1 __ BNE $0a3a ; (init.l6 + 0)
.s5:
0a49 : a9 00 __ LDA #$00
0a4b : 85 0d __ STA P0 
0a4d : a9 e0 __ LDA #$e0
0a4f : 85 0e __ STA P1 
0a51 : 20 7d 0b JSR $0b7d ; (memset.s4 + 0)
0a54 : a9 00 __ LDA #$00
0a56 : 85 0d __ STA P0 
0a58 : a9 1f __ LDA #$1f
0a5a : 85 10 __ STA P3 
0a5c : a9 d8 __ LDA #$d8
0a5e : 85 0e __ STA P1 
0a60 : a9 81 __ LDA #$81
0a62 : 85 0f __ STA P2 
0a64 : 20 a1 0b JSR $0ba1 ; (oscar_expand_lzo.s4 + 0)
0a67 : a9 61 __ LDA #$61
0a69 : 8d f8 d3 STA $d3f8 
0a6c : a9 60 __ LDA #$60
0a6e : 8d f9 d3 STA $d3f9 
0a71 : a9 35 __ LDA #$35
0a73 : 85 01 __ STA $01 
0a75 : a9 00 __ LDA #$00
0a77 : 85 10 __ STA P3 
0a79 : 8d 21 d0 STA $d021 
0a7c : 8d 20 d0 STA $d020 
0a7f : a9 04 __ LDA #$04
0a81 : 85 0d __ STA P0 
0a83 : a9 e0 __ LDA #$e0
0a85 : 85 11 __ STA P4 
0a87 : a9 02 __ LDA #$02
0a89 : a2 fa __ LDX #$fa
.l8:
0a8b : ca __ __ DEX
0a8c : 9d 00 d8 STA $d800,x 
0a8f : 9d fa d8 STA $d8fa,x 
0a92 : 9d f4 d9 STA $d9f4,x 
0a95 : 9d ee da STA $daee,x 
0a98 : d0 f1 __ BNE $0a8b ; (init.l8 + 0)
.s7:
0a9a : a9 00 __ LDA #$00
0a9c : 85 0e __ STA P1 
0a9e : a9 d0 __ LDA #$d0
0aa0 : 85 0f __ STA P2 
0aa2 : 20 11 0c JSR $0c11 ; (vic_setmode.s4 + 0)
0aa5 : ad 10 d0 LDA $d010 
0aa8 : 29 fc __ AND #$fc
0aaa : 8d 10 d0 STA $d010 
0aad : ad 15 d0 LDA $d015 
0ab0 : 09 01 __ ORA #$01
0ab2 : 8d 15 d0 STA $d015 
0ab5 : ad 15 d0 LDA $d015 
0ab8 : 09 02 __ ORA #$02
0aba : 8d 15 d0 STA $d015 
0abd : a9 00 __ LDA #$00
0abf : 8d 27 d0 STA $d027 
0ac2 : a9 01 __ LDA #$01
0ac4 : 8d 28 d0 STA $d028 
0ac7 : a9 32 __ LDA #$32
0ac9 : 8d 01 d0 STA $d001 
0acc : a9 18 __ LDA #$18
0ace : 8d 00 d0 STA $d000 
0ad1 : a9 32 __ LDA #$32
0ad3 : 8d 03 d0 STA $d003 
0ad6 : a9 18 __ LDA #$18
0ad8 : 8d 02 d0 STA $d002 
0adb : 20 63 0c JSR $0c63 ; (mouse_init.s4 + 0)
0ade : a9 00 __ LDA #$00
0ae0 : 85 0f __ STA P2 
0ae2 : a9 20 __ LDA #$20
0ae4 : 85 0e __ STA P1 
0ae6 : a9 e0 __ LDA #$e0
0ae8 : 85 10 __ STA P3 
0aea : a9 28 __ LDA #$28
0aec : 85 11 __ STA P4 
0aee : a9 19 __ LDA #$19
0af0 : 85 12 __ STA P5 
0af2 : a9 95 __ LDA #$95
0af4 : 85 0d __ STA P0 
0af6 : 4c e1 0c JMP $0ce1 ; (bm_init.s4 + 0)
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0af9 : a9 0e __ LDA #$0e
0afb : 8d fa ff STA $fffa 
0afe : a9 0b __ LDA #$0b
0b00 : 8d fb ff STA $fffb 
0b03 : a9 2c __ LDA #$2c
0b05 : 8d fe ff STA $fffe 
0b08 : a9 0b __ LDA #$0b
0b0a : 8d ff ff STA $ffff 
.s3:
0b0d : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0b0e : 48 __ __ PHA
0b0f : 8a __ __ TXA
0b10 : 48 __ __ PHA
0b11 : a9 0b __ LDA #$0b
0b13 : 48 __ __ PHA
0b14 : a9 25 __ LDA #$25
0b16 : 48 __ __ PHA
0b17 : ba __ __ TSX
0b18 : bd 05 01 LDA $0105,x 
0b1b : 48 __ __ PHA
0b1c : a6 01 __ LDX $01 
0b1e : a9 36 __ LDA #$36
0b20 : 85 01 __ STA $01 
0b22 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0b25 : 86 01 __ STX $01 
0b27 : 68 __ __ PLA
0b28 : aa __ __ TAX
0b29 : 68 __ __ PLA
0b2a : 40 __ __ RTI
0b2b : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0b2c : 48 __ __ PHA
0b2d : 8a __ __ TXA
0b2e : 48 __ __ PHA
0b2f : a9 0b __ LDA #$0b
0b31 : 48 __ __ PHA
0b32 : a9 25 __ LDA #$25
0b34 : 48 __ __ PHA
0b35 : ba __ __ TSX
0b36 : bd 05 01 LDA $0105,x 
0b39 : 48 __ __ PHA
0b3a : a6 01 __ LDX $01 
0b3c : a9 36 __ LDA #$36
0b3e : 85 01 __ STA $01 
0b40 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
cia_init: ; cia_init()->void
;  22, "/home/honza/projects/c64/projects/oscar64/include/c64/cia.h"
.s4:
0b43 : a9 7f __ LDA #$7f
0b45 : 8d fd 1f STA $1ffd ; (ciaa_pra_def + 0)
0b48 : 8d 0d dc STA $dc0d 
0b4b : 8d 0d dd STA $dd0d 
0b4e : 8d 00 dc STA $dc00 
0b51 : a9 08 __ LDA #$08
0b53 : 8d 0e dc STA $dc0e 
0b56 : 8d 0f dc STA $dc0f 
0b59 : 8d 0e dd STA $dd0e 
0b5c : 8d 0f dd STA $dd0f 
0b5f : a9 00 __ LDA #$00
0b61 : 8d 03 dc STA $dc03 
0b64 : 8d 03 dd STA $dd03 
0b67 : a9 ff __ LDA #$ff
0b69 : 8d 02 dc STA $dc02 
0b6c : a9 07 __ LDA #$07
0b6e : 8d 00 dd STA $dd00 
0b71 : a9 3f __ LDA #$3f
0b73 : 8d 02 dd STA $dd02 
0b76 : ad 0d dc LDA $dc0d 
0b79 : ad 0d dd LDA $dd0d 
.s3:
0b7c : 60 __ __ RTS
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void*
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0b7d : a5 0f __ LDA P2 
0b7f : a6 12 __ LDX P5 
0b81 : f0 0c __ BEQ $0b8f ; (memset.s4 + 18)
0b83 : a0 00 __ LDY #$00
0b85 : 91 0d __ STA (P0),y ; (dst + 0)
0b87 : c8 __ __ INY
0b88 : d0 fb __ BNE $0b85 ; (memset.s4 + 8)
0b8a : e6 0e __ INC P1 ; (dst + 1)
0b8c : ca __ __ DEX
0b8d : d0 f6 __ BNE $0b85 ; (memset.s4 + 8)
0b8f : a4 11 __ LDY P4 
0b91 : f0 05 __ BEQ $0b98 ; (memset.s4 + 27)
0b93 : 88 __ __ DEY
0b94 : 91 0d __ STA (P0),y ; (dst + 0)
0b96 : d0 fb __ BNE $0b93 ; (memset.s4 + 22)
0b98 : a5 0d __ LDA P0 ; (dst + 0)
0b9a : 85 1b __ STA ACCU + 0 
0b9c : a5 0e __ LDA P1 ; (dst + 1)
0b9e : 85 1c __ STA ACCU + 1 
.s3:
0ba0 : 60 __ __ RTS
--------------------------------------------------------------------
oscar_expand_lzo: ; oscar_expand_lzo(u8*,const u8*)->const u8*
;   5, "/home/honza/projects/c64/projects/oscar64/include/oscar.h"
.s4:
0ba1 : a0 00 __ LDY #$00
0ba3 : b1 0f __ LDA (P2),y ; (sp + 0)
.l5:
0ba5 : 85 1d __ STA ACCU + 2 
0ba7 : 30 1e __ BMI $0bc7 ; (oscar_expand_lzo.s9 + 0)
.s6:
0ba9 : 18 __ __ CLC
0baa : a5 0f __ LDA P2 ; (sp + 0)
0bac : 69 01 __ ADC #$01
0bae : 85 1b __ STA ACCU + 0 
0bb0 : aa __ __ TAX
0bb1 : a5 10 __ LDA P3 ; (sp + 1)
0bb3 : 69 00 __ ADC #$00
0bb5 : 85 1c __ STA ACCU + 1 
0bb7 : 8a __ __ TXA
0bb8 : 18 __ __ CLC
0bb9 : 65 1d __ ADC ACCU + 2 
0bbb : 85 0f __ STA P2 ; (sp + 0)
0bbd : a5 1c __ LDA ACCU + 1 
0bbf : 69 00 __ ADC #$00
0bc1 : 85 10 __ STA P3 ; (sp + 1)
.s7:
0bc3 : a0 00 __ LDY #$00
0bc5 : f0 22 __ BEQ $0be9 ; (oscar_expand_lzo.l10 + 0)
.s9:
0bc7 : a5 0d __ LDA P0 ; (dp + 0)
0bc9 : 38 __ __ SEC
0bca : a0 01 __ LDY #$01
0bcc : f1 0f __ SBC (P2),y ; (sp + 0)
0bce : 85 1b __ STA ACCU + 0 
0bd0 : a5 0e __ LDA P1 ; (dp + 1)
0bd2 : e9 00 __ SBC #$00
0bd4 : 85 1c __ STA ACCU + 1 
0bd6 : 18 __ __ CLC
0bd7 : a5 0f __ LDA P2 ; (sp + 0)
0bd9 : 69 02 __ ADC #$02
0bdb : 85 0f __ STA P2 ; (sp + 0)
0bdd : 90 02 __ BCC $0be1 ; (oscar_expand_lzo.s13 + 0)
.s12:
0bdf : e6 10 __ INC P3 ; (sp + 1)
.s13:
0be1 : a5 1d __ LDA ACCU + 2 
0be3 : 29 7f __ AND #$7f
0be5 : 85 1d __ STA ACCU + 2 
0be7 : a0 00 __ LDY #$00
.l10:
0be9 : b1 1b __ LDA (ACCU + 0),y 
0beb : 91 0d __ STA (P0),y ; (dp + 0)
0bed : c8 __ __ INY
0bee : c4 1d __ CPY ACCU + 2 
0bf0 : d0 f7 __ BNE $0be9 ; (oscar_expand_lzo.l10 + 0)
.s11:
0bf2 : 18 __ __ CLC
0bf3 : a5 0d __ LDA P0 ; (dp + 0)
0bf5 : 65 1d __ ADC ACCU + 2 
0bf7 : 85 0d __ STA P0 ; (dp + 0)
0bf9 : 90 02 __ BCC $0bfd ; (oscar_expand_lzo.s15 + 0)
.s14:
0bfb : e6 0e __ INC P1 ; (dp + 1)
.s15:
0bfd : a0 00 __ LDY #$00
0bff : b1 0f __ LDA (P2),y ; (sp + 0)
0c01 : d0 a2 __ BNE $0ba5 ; (oscar_expand_lzo.l5 + 0)
.s8:
0c03 : 18 __ __ CLC
0c04 : a5 0f __ LDA P2 ; (sp + 0)
0c06 : 69 01 __ ADC #$01
0c08 : 85 1b __ STA ACCU + 0 
0c0a : a5 10 __ LDA P3 ; (sp + 1)
0c0c : 69 00 __ ADC #$00
0c0e : 85 1c __ STA ACCU + 1 
.s3:
0c10 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0c11 : a4 0d __ LDY P0 ; (mode + 0)
0c13 : c0 02 __ CPY #$02
0c15 : d0 09 __ BNE $0c20 ; (vic_setmode.s5 + 0)
.s10:
0c17 : a9 5b __ LDA #$5b
0c19 : 8d 11 d0 STA $d011 
.s8:
0c1c : a9 08 __ LDA #$08
0c1e : d0 0c __ BNE $0c2c ; (vic_setmode.s7 + 0)
.s5:
0c20 : b0 36 __ BCS $0c58 ; (vic_setmode.s6 + 0)
.s9:
0c22 : a9 1b __ LDA #$1b
0c24 : 8d 11 d0 STA $d011 
0c27 : 98 __ __ TYA
0c28 : f0 f2 __ BEQ $0c1c ; (vic_setmode.s8 + 0)
.s11:
0c2a : a9 18 __ LDA #$18
.s7:
0c2c : 8d 16 d0 STA $d016 
0c2f : ad 00 dd LDA $dd00 
0c32 : 29 fc __ AND #$fc
0c34 : 85 1b __ STA ACCU + 0 
0c36 : a5 0f __ LDA P2 ; (text + 1)
0c38 : 0a __ __ ASL
0c39 : 2a __ __ ROL
0c3a : 29 01 __ AND #$01
0c3c : 2a __ __ ROL
0c3d : 49 03 __ EOR #$03
0c3f : 05 1b __ ORA ACCU + 0 
0c41 : 8d 00 dd STA $dd00 
0c44 : a5 0f __ LDA P2 ; (text + 1)
0c46 : 29 3c __ AND #$3c
0c48 : 0a __ __ ASL
0c49 : 0a __ __ ASL
0c4a : 85 1b __ STA ACCU + 0 
0c4c : a5 11 __ LDA P4 ; (font + 1)
0c4e : 29 38 __ AND #$38
0c50 : 4a __ __ LSR
0c51 : 4a __ __ LSR
0c52 : 05 1b __ ORA ACCU + 0 
0c54 : 8d 18 d0 STA $d018 
.s3:
0c57 : 60 __ __ RTS
.s6:
0c58 : a9 3b __ LDA #$3b
0c5a : 8d 11 d0 STA $d011 
0c5d : c0 03 __ CPY #$03
0c5f : d0 c9 __ BNE $0c2a ; (vic_setmode.s11 + 0)
0c61 : f0 b9 __ BEQ $0c1c ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
mouse_init: ; mouse_init()->void
;  10, "/home/honza/projects/c64/projects/oscar64/include/c64/mouse.h"
.s4:
0c63 : a9 01 __ LDA #$01
0c65 : 20 6b 0c JSR $0c6b ; (mouse_arm.s4 + 0)
0c68 : 4c 7f 0c JMP $0c7f ; (mouse_poll.s4 + 0)
--------------------------------------------------------------------
mouse_arm: ; mouse_arm(u8)->void
;  15, "/home/honza/projects/c64/projects/oscar64/include/c64/mouse.h"
.s4:
0c6b : 8d fe 1f STA $1ffe ; (mouse_port + 0)
0c6e : c9 01 __ CMP #$01
0c70 : a9 00 __ LDA #$00
0c72 : 69 ff __ ADC #$ff
0c74 : 29 c0 __ AND #$c0
0c76 : 49 7f __ EOR #$7f
.s3:
0c78 : 8d 00 dc STA $dc00 
0c7b : 8d fd 1f STA $1ffd ; (ciaa_pra_def + 0)
0c7e : 60 __ __ RTS
--------------------------------------------------------------------
mouse_poll: ; mouse_poll()->void
;  21, "/home/honza/projects/c64/projects/oscar64/include/c64/mouse.h"
.s4:
0c7f : ae fe 1f LDX $1ffe ; (mouse_port + 0)
0c82 : bd 00 dc LDA $dc00,x 
0c85 : aa __ __ TAX
0c86 : 4a __ __ LSR
0c87 : a9 00 __ LDA #$00
0c89 : 69 ff __ ADC #$ff
0c8b : 29 01 __ AND #$01
0c8d : 8d ff 1f STA $1fff ; (mouse_rb + 0)
0c90 : 8a __ __ TXA
0c91 : 29 10 __ AND #$10
0c93 : f0 04 __ BEQ $0c99 ; (mouse_poll.s13 + 0)
.s14:
0c95 : a9 00 __ LDA #$00
0c97 : f0 02 __ BEQ $0c9b ; (mouse_poll.s15 + 0)
.s13:
0c99 : a9 01 __ LDA #$01
.s15:
0c9b : 8d 90 20 STA $2090 ; (mouse_lb + 0)
0c9e : ad 19 d4 LDA $d419 
0ca1 : 29 7f __ AND #$7f
0ca3 : 4a __ __ LSR
0ca4 : aa __ __ TAX
0ca5 : 38 __ __ SEC
0ca6 : ed 91 20 SBC $2091 ; (mouse_px + 0)
0ca9 : 29 3f __ AND #$3f
0cab : c9 20 __ CMP #$20
0cad : 90 07 __ BCC $0cb6 ; (mouse_poll.s5 + 0)
.s10:
0caf : 8e 91 20 STX $2091 ; (mouse_px + 0)
0cb2 : 09 e0 __ ORA #$e0
0cb4 : b0 06 __ BCS $0cbc ; (mouse_poll.s11 + 0)
.s5:
0cb6 : a8 __ __ TAY
0cb7 : f0 03 __ BEQ $0cbc ; (mouse_poll.s11 + 0)
.s9:
0cb9 : 8e 91 20 STX $2091 ; (mouse_px + 0)
.s11:
0cbc : 8d 92 20 STA $2092 ; (mouse_dx + 0)
0cbf : ad 1a d4 LDA $d41a 
0cc2 : 29 7f __ AND #$7f
0cc4 : 4a __ __ LSR
0cc5 : aa __ __ TAX
0cc6 : 38 __ __ SEC
0cc7 : ed 93 20 SBC $2093 ; (mouse_py + 0)
0cca : 29 3f __ AND #$3f
0ccc : c9 20 __ CMP #$20
0cce : 90 09 __ BCC $0cd9 ; (mouse_poll.s6 + 0)
.s8:
0cd0 : 8e 93 20 STX $2093 ; (mouse_py + 0)
0cd3 : 09 e0 __ ORA #$e0
.s12:
0cd5 : 8d 94 20 STA $2094 ; (mouse_dy + 0)
.s3:
0cd8 : 60 __ __ RTS
.s6:
0cd9 : a8 __ __ TAY
0cda : f0 f9 __ BEQ $0cd5 ; (mouse_poll.s12 + 0)
.s7:
0cdc : 8e 93 20 STX $2093 ; (mouse_py + 0)
0cdf : 90 f4 __ BCC $0cd5 ; (mouse_poll.s12 + 0)
--------------------------------------------------------------------
bm_init: ; bm_init(struct Bitmap*,u8*,u8,u8)->void
;  65, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
0ce1 : a5 0f __ LDA P2 ; (data + 0)
0ce3 : a0 00 __ LDY #$00
0ce5 : 91 0d __ STA (P0),y ; (bm + 0)
0ce7 : a5 10 __ LDA P3 ; (data + 1)
0ce9 : c8 __ __ INY
0cea : 91 0d __ STA (P0),y ; (bm + 0)
0cec : a9 00 __ LDA #$00
0cee : c8 __ __ INY
0cef : 91 0d __ STA (P0),y ; (bm + 0)
0cf1 : c8 __ __ INY
0cf2 : 91 0d __ STA (P0),y ; (bm + 0)
0cf4 : a5 11 __ LDA P4 ; (cw + 0)
0cf6 : c8 __ __ INY
0cf7 : 91 0d __ STA (P0),y ; (bm + 0)
0cf9 : a5 12 __ LDA P5 ; (ch + 0)
0cfb : c8 __ __ INY
0cfc : 91 0d __ STA (P0),y ; (bm + 0)
0cfe : a9 00 __ LDA #$00
0d00 : 06 11 __ ASL P4 ; (cw + 0)
0d02 : 2a __ __ ROL
0d03 : 06 11 __ ASL P4 ; (cw + 0)
0d05 : 2a __ __ ROL
0d06 : 06 11 __ ASL P4 ; (cw + 0)
0d08 : 2a __ __ ROL
0d09 : a0 07 __ LDY #$07
0d0b : 91 0d __ STA (P0),y ; (bm + 0)
0d0d : a5 11 __ LDA P4 ; (cw + 0)
0d0f : 88 __ __ DEY
0d10 : 91 0d __ STA (P0),y ; (bm + 0)
.s3:
0d12 : 60 __ __ RTS
--------------------------------------------------------------------
mouse_move: ; mouse_move()->bool
;  72, "/home/honza/projects/c64/projects/oscar64/samples/hiresmc/paint.c"
.s4:
0d13 : a9 00 __ LDA #$00
0d15 : 20 fe 0d JSR $0dfe ; (joy_poll.s4 + 0)
0d18 : 20 7f 0c JSR $0c7f ; (mouse_poll.s4 + 0)
0d1b : ad 9d 20 LDA $209d ; (joyy[0] + 0)
0d1e : 38 __ __ SEC
0d1f : ed 94 20 SBC $2094 ; (mouse_dy + 0)
0d22 : 85 1b __ STA ACCU + 0 
0d24 : 0a __ __ ASL
0d25 : a0 00 __ LDY #$00
0d27 : 90 01 __ BCC $0d2a ; (mouse_move.s30 + 0)
.s29:
0d29 : 88 __ __ DEY
.s30:
0d2a : ad a5 20 LDA $20a5 ; (mouse_y + 0)
0d2d : 18 __ __ CLC
0d2e : 65 1b __ ADC ACCU + 0 
0d30 : aa __ __ TAX
0d31 : 98 __ __ TYA
0d32 : 6d a6 20 ADC $20a6 ; (mouse_y + 1)
0d35 : 85 1c __ STA ACCU + 1 
0d37 : ad 92 20 LDA $2092 ; (mouse_dx + 0)
0d3a : 18 __ __ CLC
0d3b : 6d 9f 20 ADC $209f ; (joyx[0] + 0)
0d3e : 85 43 __ STA T2 + 0 
0d40 : 0a __ __ ASL
0d41 : a0 00 __ LDY #$00
0d43 : 90 01 __ BCC $0d46 ; (mouse_move.s32 + 0)
.s31:
0d45 : 88 __ __ DEY
.s32:
0d46 : ad a3 20 LDA $20a3 ; (mouse_x + 0)
0d49 : 18 __ __ CLC
0d4a : 65 43 __ ADC T2 + 0 
0d4c : 85 43 __ STA T2 + 0 
0d4e : 98 __ __ TYA
0d4f : 6d a4 20 ADC $20a4 ; (mouse_x + 1)
0d52 : 10 09 __ BPL $0d5d ; (mouse_move.s5 + 0)
.s25:
0d54 : a9 00 __ LDA #$00
0d56 : 85 43 __ STA T2 + 0 
.s26:
0d58 : 85 44 __ STA T2 + 1 
0d5a : 4c 77 0d JMP $0d77 ; (mouse_move.s6 + 0)
.s5:
0d5d : 85 44 __ STA T2 + 1 
0d5f : a9 01 __ LDA #$01
0d61 : c5 44 __ CMP T2 + 1 
0d63 : f0 04 __ BEQ $0d69 ; (mouse_move.s23 + 0)
.s24:
0d65 : 90 08 __ BCC $0d6f ; (mouse_move.s22 + 0)
0d67 : b0 0e __ BCS $0d77 ; (mouse_move.s6 + 0)
.s23:
0d69 : a5 43 __ LDA T2 + 0 
0d6b : c9 40 __ CMP #$40
0d6d : 90 08 __ BCC $0d77 ; (mouse_move.s6 + 0)
.s22:
0d6f : a9 3f __ LDA #$3f
0d71 : 85 43 __ STA T2 + 0 
0d73 : a9 01 __ LDA #$01
0d75 : 85 44 __ STA T2 + 1 
.s6:
0d77 : a5 1c __ LDA ACCU + 1 
0d79 : 10 08 __ BPL $0d83 ; (mouse_move.s7 + 0)
.s21:
0d7b : a9 00 __ LDA #$00
0d7d : aa __ __ TAX
.s27:
0d7e : 85 1c __ STA ACCU + 1 
0d80 : 4c 8f 0d JMP $0d8f ; (mouse_move.s8 + 0)
.s7:
0d83 : d0 04 __ BNE $0d89 ; (mouse_move.s19 + 0)
.s20:
0d85 : e0 c8 __ CPX #$c8
0d87 : 90 06 __ BCC $0d8f ; (mouse_move.s8 + 0)
.s19:
0d89 : a9 00 __ LDA #$00
0d8b : a2 c7 __ LDX #$c7
0d8d : 85 1c __ STA ACCU + 1 
.s8:
0d8f : a5 44 __ LDA T2 + 1 
0d91 : cd a4 20 CMP $20a4 ; (mouse_x + 1)
0d94 : d0 18 __ BNE $0dae ; (mouse_move.s11 + 0)
.s18:
0d96 : a5 43 __ LDA T2 + 0 
0d98 : cd a3 20 CMP $20a3 ; (mouse_x + 0)
0d9b : d0 11 __ BNE $0dae ; (mouse_move.s11 + 0)
.s9:
0d9d : a5 1c __ LDA ACCU + 1 
0d9f : cd a6 20 CMP $20a6 ; (mouse_y + 1)
0da2 : d0 0a __ BNE $0dae ; (mouse_move.s11 + 0)
.s17:
0da4 : ec a5 20 CPX $20a5 ; (mouse_y + 0)
0da7 : d0 05 __ BNE $0dae ; (mouse_move.s11 + 0)
.s10:
0da9 : a9 00 __ LDA #$00
.s3:
0dab : 85 1b __ STA ACCU + 0 
0dad : 60 __ __ RTS
.s11:
0dae : 8e a5 20 STX $20a5 ; (mouse_y + 0)
0db1 : 8a __ __ TXA
0db2 : 18 __ __ CLC
0db3 : 69 32 __ ADC #$32
0db5 : 8d 01 d0 STA $d001 
0db8 : a8 __ __ TAY
0db9 : a5 43 __ LDA T2 + 0 
0dbb : 8d a3 20 STA $20a3 ; (mouse_x + 0)
0dbe : 18 __ __ CLC
0dbf : 69 18 __ ADC #$18
0dc1 : 8d 00 d0 STA $d000 
0dc4 : aa __ __ TAX
0dc5 : a5 44 __ LDA T2 + 1 
0dc7 : 8d a4 20 STA $20a4 ; (mouse_x + 1)
0dca : 69 00 __ ADC #$00
0dcc : c9 01 __ CMP #$01
0dce : a9 00 __ LDA #$00
0dd0 : 8d a6 20 STA $20a6 ; (mouse_y + 1)
0dd3 : 6a __ __ ROR
0dd4 : 85 1b __ STA ACCU + 0 
0dd6 : f0 07 __ BEQ $0ddf ; (mouse_move.s12 + 0)
.s16:
0dd8 : ad 10 d0 LDA $d010 
0ddb : 09 01 __ ORA #$01
0ddd : 90 05 __ BCC $0de4 ; (mouse_move.s13 + 0)
.s12:
0ddf : ad 10 d0 LDA $d010 
0de2 : 29 fe __ AND #$fe
.s13:
0de4 : 8d 10 d0 STA $d010 
0de7 : 8c 03 d0 STY $d003 
0dea : 8e 02 d0 STX $d002 
0ded : 24 1b __ BIT ACCU + 0 
0def : 10 04 __ BPL $0df5 ; (mouse_move.s14 + 0)
.s15:
0df1 : 09 02 __ ORA #$02
0df3 : 90 02 __ BCC $0df7 ; (mouse_move.s28 + 0)
.s14:
0df5 : 29 fd __ AND #$fd
.s28:
0df7 : 8d 10 d0 STA $d010 
0dfa : a9 01 __ LDA #$01
0dfc : 90 ad __ BCC $0dab ; (mouse_move.s3 + 0)
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
0dfe : aa __ __ TAX
0dff : bd 00 dc LDA $dc00,x 
0e02 : a8 __ __ TAY
0e03 : 29 10 __ AND #$10
0e05 : f0 04 __ BEQ $0e0b ; (joy_poll.s10 + 0)
.s11:
0e07 : a9 00 __ LDA #$00
0e09 : f0 02 __ BEQ $0e0d ; (joy_poll.s12 + 0)
.s10:
0e0b : a9 01 __ LDA #$01
.s12:
0e0d : 9d a1 20 STA $20a1,x ; (joyb[0] + 0)
0e10 : 98 __ __ TYA
0e11 : 4a __ __ LSR
0e12 : b0 04 __ BCS $0e18 ; (joy_poll.s9 + 0)
.s5:
0e14 : a9 ff __ LDA #$ff
0e16 : 90 0b __ BCC $0e23 ; (joy_poll.s6 + 0)
.s9:
0e18 : 98 __ __ TYA
0e19 : 29 02 __ AND #$02
0e1b : f0 04 __ BEQ $0e21 ; (joy_poll.s13 + 0)
.s14:
0e1d : a9 00 __ LDA #$00
0e1f : b0 02 __ BCS $0e23 ; (joy_poll.s6 + 0)
.s13:
0e21 : a9 01 __ LDA #$01
.s6:
0e23 : 9d 9d 20 STA $209d,x ; (joyy[0] + 0)
0e26 : 98 __ __ TYA
0e27 : 29 04 __ AND #$04
0e29 : d0 06 __ BNE $0e31 ; (joy_poll.s8 + 0)
.s7:
0e2b : a9 ff __ LDA #$ff
.s3:
0e2d : 9d 9f 20 STA $209f,x ; (joyx[0] + 0)
0e30 : 60 __ __ RTS
.s8:
0e31 : 98 __ __ TYA
0e32 : 29 08 __ AND #$08
0e34 : f0 04 __ BEQ $0e3a ; (joy_poll.s15 + 0)
.s16:
0e36 : a9 00 __ LDA #$00
0e38 : f0 f3 __ BEQ $0e2d ; (joy_poll.s3 + 0)
.s15:
0e3a : a9 01 __ LDA #$01
0e3c : d0 ef __ BNE $0e2d ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
bmmc_circle_fill: ; bmmc_circle_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,u8,const u8*)->void
;  32, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
0e3e : a2 05 __ LDX #$05
0e40 : b5 53 __ LDA T9 + 0,x 
0e42 : 9d e8 cf STA $cfe8,x ; (bmmc_circle_fill@stack + 0)
0e45 : ca __ __ DEX
0e46 : 10 f8 __ BPL $0e40 ; (bmmc_circle_fill.s1 + 2)
.s4:
0e48 : 18 __ __ CLC
0e49 : a5 18 __ LDA P11 ; (r + 0)
0e4b : 6d f6 cf ADC $cff6 ; (sstack + 6)
0e4e : ae f7 cf LDX $cff7 ; (sstack + 7)
0e51 : 90 02 __ BCC $0e55 ; (bmmc_circle_fill.s22 + 0)
.s21:
0e53 : e8 __ __ INX
0e54 : 18 __ __ CLC
.s22:
0e55 : 69 01 __ ADC #$01
0e57 : 85 4b __ STA T5 + 0 
0e59 : 90 01 __ BCC $0e5c ; (bmmc_circle_fill.s24 + 0)
.s23:
0e5b : e8 __ __ INX
.s24:
0e5c : 86 4c __ STX T5 + 1 
0e5e : ad f2 cf LDA $cff2 ; (sstack + 2)
0e61 : 85 4d __ STA T6 + 0 
0e63 : ad f3 cf LDA $cff3 ; (sstack + 3)
0e66 : 85 4e __ STA T6 + 1 
0e68 : a0 06 __ LDY #$06
0e6a : b1 4d __ LDA (T6 + 0),y 
0e6c : aa __ __ TAX
0e6d : c8 __ __ INY
0e6e : b1 4d __ LDA (T6 + 0),y 
0e70 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0e72 : ad f6 cf LDA $cff6 ; (sstack + 6)
0e75 : 38 __ __ SEC
0e76 : e5 18 __ SBC P11 ; (r + 0)
0e78 : 85 4f __ STA T7 + 0 
0e7a : a0 02 __ LDY #$02
0e7c : b1 4d __ LDA (T6 + 0),y 
0e7e : 85 47 __ STA T3 + 0 
0e80 : ad f7 cf LDA $cff7 ; (sstack + 7)
0e83 : e9 00 __ SBC #$00
0e85 : 85 50 __ STA T7 + 1 
0e87 : c8 __ __ INY
0e88 : d1 4d __ CMP (T6 + 0),y 
0e8a : d0 08 __ BNE $0e94 ; (bmmc_circle_fill.s20 + 0)
.s17:
0e8c : a5 4f __ LDA T7 + 0 
0e8e : c5 47 __ CMP T3 + 0 
.s18:
0e90 : 90 08 __ BCC $0e9a ; (bmmc_circle_fill.s16 + 0)
0e92 : b0 0e __ BCS $0ea2 ; (bmmc_circle_fill.s5 + 0)
.s20:
0e94 : 51 4d __ EOR (T6 + 0),y 
0e96 : 10 f8 __ BPL $0e90 ; (bmmc_circle_fill.s18 + 0)
.s19:
0e98 : 90 08 __ BCC $0ea2 ; (bmmc_circle_fill.s5 + 0)
.s16:
0e9a : a5 47 __ LDA T3 + 0 
0e9c : 85 4f __ STA T7 + 0 
0e9e : b1 4d __ LDA (T6 + 0),y 
0ea0 : 85 50 __ STA T7 + 1 
.s5:
0ea2 : a5 1c __ LDA ACCU + 1 ; (clip + 1)
0ea4 : c5 4c __ CMP T5 + 1 
0ea6 : d0 06 __ BNE $0eae ; (bmmc_circle_fill.s15 + 0)
.s12:
0ea8 : e4 4b __ CPX T5 + 0 
.s13:
0eaa : 90 08 __ BCC $0eb4 ; (bmmc_circle_fill.s11 + 0)
0eac : b0 08 __ BCS $0eb6 ; (bmmc_circle_fill.s6 + 0)
.s15:
0eae : 45 4c __ EOR T5 + 1 
0eb0 : 10 f8 __ BPL $0eaa ; (bmmc_circle_fill.s13 + 0)
.s14:
0eb2 : 90 02 __ BCC $0eb6 ; (bmmc_circle_fill.s6 + 0)
.s11:
0eb4 : 86 4b __ STX T5 + 0 
.s6:
0eb6 : a5 4f __ LDA T7 + 0 
0eb8 : c5 4b __ CMP T5 + 0 
0eba : 90 0b __ BCC $0ec7 ; (bmmc_circle_fill.s7 + 0)
.s3:
0ebc : a2 05 __ LDX #$05
0ebe : bd e8 cf LDA $cfe8,x ; (bmmc_circle_fill@stack + 0)
0ec1 : 95 53 __ STA T9 + 0,x 
0ec3 : ca __ __ DEX
0ec4 : 10 f8 __ BPL $0ebe ; (bmmc_circle_fill.s3 + 2)
0ec6 : 60 __ __ RTS
.s7:
0ec7 : 29 f8 __ AND #$f8
0ec9 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0ecb : ad f0 cf LDA $cff0 ; (sstack + 0)
0ece : 85 47 __ STA T3 + 0 
0ed0 : ad f1 cf LDA $cff1 ; (sstack + 1)
0ed3 : 85 48 __ STA T3 + 1 
0ed5 : a5 50 __ LDA T7 + 1 
0ed7 : 85 1c __ STA ACCU + 1 ; (clip + 1)
0ed9 : a0 04 __ LDY #$04
0edb : b1 47 __ LDA (T3 + 0),y 
0edd : 85 49 __ STA T4 + 0 
0edf : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
0ee2 : a0 00 __ LDY #$00
0ee4 : b1 47 __ LDA (T3 + 0),y 
0ee6 : 18 __ __ CLC
0ee7 : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0ee9 : 85 02 __ STA $02 
0eeb : c8 __ __ INY
0eec : b1 47 __ LDA (T3 + 0),y 
0eee : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0ef0 : aa __ __ TAX
0ef1 : a5 4f __ LDA T7 + 0 
0ef3 : 29 07 __ AND #$07
0ef5 : 18 __ __ CLC
0ef6 : 65 02 __ ADC $02 
0ef8 : 85 47 __ STA T3 + 0 
0efa : 90 01 __ BCC $0efd ; (bmmc_circle_fill.s26 + 0)
.s25:
0efc : e8 __ __ INX
.s26:
0efd : 86 48 __ STX T3 + 1 
0eff : 38 __ __ SEC
0f00 : a5 4f __ LDA T7 + 0 
0f02 : ed f6 cf SBC $cff6 ; (sstack + 6)
0f05 : 85 45 __ STA T1 + 0 
0f07 : a5 50 __ LDA T7 + 1 
0f09 : ed f7 cf SBC $cff7 ; (sstack + 7)
0f0c : 85 46 __ STA T1 + 1 
0f0e : a5 45 __ LDA T1 + 0 
0f10 : 0a __ __ ASL
0f11 : 09 01 __ ORA #$01
0f13 : 85 51 __ STA T8 + 0 
0f15 : a5 46 __ LDA T1 + 1 
0f17 : 2a __ __ ROL
0f18 : 85 52 __ STA T8 + 1 
0f1a : a9 00 __ LDA #$00
0f1c : 85 1c __ STA ACCU + 1 ; (clip + 1)
0f1e : a5 18 __ LDA P11 ; (r + 0)
0f20 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0f22 : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
0f25 : 18 __ __ CLC
0f26 : a5 1b __ LDA ACCU + 0 ; (clip + 0)
0f28 : 65 18 __ ADC P11 ; (r + 0)
0f2a : 85 43 __ STA T0 + 0 
0f2c : a5 1c __ LDA ACCU + 1 ; (clip + 1)
0f2e : 69 00 __ ADC #$00
0f30 : 85 44 __ STA T0 + 1 
0f32 : a5 45 __ LDA T1 + 0 
0f34 : 85 03 __ STA WORK + 0 
0f36 : 85 1b __ STA ACCU + 0 ; (clip + 0)
0f38 : a5 46 __ LDA T1 + 1 
0f3a : 85 04 __ STA WORK + 1 
0f3c : 85 1c __ STA ACCU + 1 ; (clip + 1)
0f3e : 20 3a 1f JSR $1f3a ; (mul16 + 0)
0f41 : 38 __ __ SEC
0f42 : a5 43 __ LDA T0 + 0 
0f44 : e5 05 __ SBC WORK + 2 
0f46 : 85 53 __ STA T9 + 0 
0f48 : a5 44 __ LDA T0 + 1 
0f4a : e5 06 __ SBC WORK + 3 
0f4c : 85 54 __ STA T9 + 1 
0f4e : 18 __ __ CLC
0f4f : a5 49 __ LDA T4 + 0 
0f51 : 69 ff __ ADC #$ff
0f53 : 2a __ __ ROL
0f54 : 2a __ __ ROL
0f55 : 2a __ __ ROL
0f56 : aa __ __ TAX
0f57 : 29 f8 __ AND #$f8
0f59 : 85 49 __ STA T4 + 0 
0f5b : 8a __ __ TXA
0f5c : 29 07 __ AND #$07
0f5e : 2a __ __ ROL
0f5f : 69 f8 __ ADC #$f8
0f61 : 85 4a __ STA T4 + 1 
0f63 : ad f8 cf LDA $cff8 ; (sstack + 8)
0f66 : 85 55 __ STA T10 + 0 
0f68 : ad f9 cf LDA $cff9 ; (sstack + 9)
0f6b : 85 56 __ STA T10 + 1 
0f6d : ad f4 cf LDA $cff4 ; (sstack + 4)
0f70 : 85 57 __ STA T11 + 0 
0f72 : ad f5 cf LDA $cff5 ; (sstack + 5)
0f75 : 85 58 __ STA T11 + 1 
.l8:
0f77 : a5 53 __ LDA T9 + 0 
0f79 : 85 0d __ STA P0 
0f7b : a5 54 __ LDA T9 + 1 
0f7d : 85 0e __ STA P1 
0f7f : 20 19 10 JSR $1019 ; (bm_usqrt.s4 + 0)
0f82 : a0 00 __ LDY #$00
0f84 : b1 4d __ LDA (T6 + 0),y 
0f86 : 85 0d __ STA P0 
0f88 : c8 __ __ INY
0f89 : b1 4d __ LDA (T6 + 0),y 
0f8b : 85 0e __ STA P1 
0f8d : a0 04 __ LDY #$04
0f8f : b1 4d __ LDA (T6 + 0),y 
0f91 : 85 0f __ STA P2 
0f93 : c8 __ __ INY
0f94 : b1 4d __ LDA (T6 + 0),y 
0f96 : 85 10 __ STA P3 
0f98 : a5 47 __ LDA T3 + 0 
0f9a : 85 11 __ STA P4 
0f9c : a5 48 __ LDA T3 + 1 
0f9e : 85 12 __ STA P5 
0fa0 : a5 4f __ LDA T7 + 0 
0fa2 : 29 07 __ AND #$07
0fa4 : a8 __ __ TAY
0fa5 : b1 55 __ LDA (T10 + 0),y 
0fa7 : 85 17 __ STA P10 
0fa9 : 38 __ __ SEC
0faa : a5 57 __ LDA T11 + 0 
0fac : e5 1b __ SBC ACCU + 0 ; (clip + 0)
0fae : 29 fe __ AND #$fe
0fb0 : 85 13 __ STA P6 
0fb2 : a5 58 __ LDA T11 + 1 
0fb4 : e5 1c __ SBC ACCU + 1 ; (clip + 1)
0fb6 : 85 14 __ STA P7 
0fb8 : 18 __ __ CLC
0fb9 : a5 57 __ LDA T11 + 0 
0fbb : 65 1b __ ADC ACCU + 0 ; (clip + 0)
0fbd : aa __ __ TAX
0fbe : a5 58 __ LDA T11 + 1 
0fc0 : 65 1c __ ADC ACCU + 1 ; (clip + 1)
0fc2 : a8 __ __ TAY
0fc3 : 8a __ __ TXA
0fc4 : 18 __ __ CLC
0fc5 : 69 02 __ ADC #$02
0fc7 : 29 fe __ AND #$fe
0fc9 : 85 15 __ STA P8 
0fcb : 90 01 __ BCC $0fce ; (bmmc_circle_fill.s28 + 0)
.s27:
0fcd : c8 __ __ INY
.s28:
0fce : 84 16 __ STY P9 
0fd0 : 20 f8 10 JSR $10f8 ; (bm_scan_fill.s4 + 0)
0fd3 : 18 __ __ CLC
0fd4 : a5 11 __ LDA P4 
0fd6 : 69 01 __ ADC #$01
0fd8 : 85 47 __ STA T3 + 0 
0fda : a5 12 __ LDA P5 
0fdc : 69 00 __ ADC #$00
0fde : 85 48 __ STA T3 + 1 
0fe0 : a5 47 __ LDA T3 + 0 
0fe2 : 29 07 __ AND #$07
0fe4 : d0 0d __ BNE $0ff3 ; (bmmc_circle_fill.s10 + 0)
.s9:
0fe6 : 18 __ __ CLC
0fe7 : a5 47 __ LDA T3 + 0 
0fe9 : 65 49 __ ADC T4 + 0 
0feb : 85 47 __ STA T3 + 0 
0fed : a5 48 __ LDA T3 + 1 
0fef : 65 4a __ ADC T4 + 1 
0ff1 : 85 48 __ STA T3 + 1 
.s10:
0ff3 : 38 __ __ SEC
0ff4 : a5 53 __ LDA T9 + 0 
0ff6 : e5 51 __ SBC T8 + 0 
0ff8 : 85 53 __ STA T9 + 0 
0ffa : a5 54 __ LDA T9 + 1 
0ffc : e5 52 __ SBC T8 + 1 
0ffe : 85 54 __ STA T9 + 1 
1000 : 18 __ __ CLC
1001 : a5 51 __ LDA T8 + 0 
1003 : 69 02 __ ADC #$02
1005 : 85 51 __ STA T8 + 0 
1007 : 90 02 __ BCC $100b ; (bmmc_circle_fill.s30 + 0)
.s29:
1009 : e6 52 __ INC T8 + 1 
.s30:
100b : e6 4f __ INC T7 + 0 
100d : a5 4f __ LDA T7 + 0 
100f : c5 4b __ CMP T5 + 0 
1011 : b0 03 __ BCS $1016 ; (bmmc_circle_fill.s30 + 11)
1013 : 4c 77 0f JMP $0f77 ; (bmmc_circle_fill.l8 + 0)
1016 : 4c bc 0e JMP $0ebc ; (bmmc_circle_fill.s3 + 0)
--------------------------------------------------------------------
bm_usqrt: ; bm_usqrt(u16)->u16
;  62, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
1019 : a4 0e __ LDY P1 ; (n + 1)
101b : 98 __ __ TYA
101c : c0 40 __ CPY #$40
101e : 90 09 __ BCC $1029 ; (bm_usqrt.s5 + 0)
.s29:
1020 : e9 40 __ SBC #$40
1022 : a8 __ __ TAY
1023 : a9 50 __ LDA #$50
1025 : a2 20 __ LDX #$20
1027 : d0 04 __ BNE $102d ; (bm_usqrt.s6 + 0)
.s5:
1029 : a9 10 __ LDA #$10
102b : a2 00 __ LDX #$00
.s6:
102d : 85 44 __ STA T2 + 1 
102f : c4 44 __ CPY T2 + 1 
1031 : 90 08 __ BCC $103b ; (bm_usqrt.s7 + 0)
.s28:
1033 : 98 __ __ TYA
1034 : e5 44 __ SBC T2 + 1 
1036 : a8 __ __ TAY
1037 : 8a __ __ TXA
1038 : 09 10 __ ORA #$10
103a : aa __ __ TAX
.s7:
103b : 8a __ __ TXA
103c : 4a __ __ LSR
103d : 85 44 __ STA T2 + 1 
103f : 8a __ __ TXA
1040 : 09 04 __ ORA #$04
1042 : 85 1c __ STA ACCU + 1 
1044 : c4 1c __ CPY ACCU + 1 
1046 : 90 0a __ BCC $1052 ; (bm_usqrt.s8 + 0)
.s27:
1048 : 98 __ __ TYA
1049 : e5 1c __ SBC ACCU + 1 
104b : a8 __ __ TAY
104c : a5 44 __ LDA T2 + 1 
104e : 09 04 __ ORA #$04
1050 : 85 44 __ STA T2 + 1 
.s8:
1052 : a5 44 __ LDA T2 + 1 
1054 : 4a __ __ LSR
1055 : 85 1c __ STA ACCU + 1 
1057 : a5 44 __ LDA T2 + 1 
1059 : 09 01 __ ORA #$01
105b : 85 44 __ STA T2 + 1 
105d : c4 44 __ CPY T2 + 1 
105f : 90 0a __ BCC $106b ; (bm_usqrt.s9 + 0)
.s26:
1061 : 98 __ __ TYA
1062 : e5 44 __ SBC T2 + 1 
1064 : a8 __ __ TAY
1065 : a5 1c __ LDA ACCU + 1 
1067 : 09 01 __ ORA #$01
1069 : 85 1c __ STA ACCU + 1 
.s9:
106b : a5 1c __ LDA ACCU + 1 
106d : 4a __ __ LSR
106e : 85 44 __ STA T2 + 1 
1070 : a9 00 __ LDA #$00
1072 : 6a __ __ ROR
1073 : 85 43 __ STA T2 + 0 
1075 : a6 0d __ LDX P0 ; (n + 0)
1077 : c4 1c __ CPY ACCU + 1 
1079 : d0 02 __ BNE $107d ; (bm_usqrt.s25 + 0)
.s24:
107b : e0 40 __ CPX #$40
.s25:
107d : 90 0e __ BCC $108d ; (bm_usqrt.s10 + 0)
.s23:
107f : 8a __ __ TXA
1080 : e9 40 __ SBC #$40
1082 : aa __ __ TAX
1083 : 98 __ __ TYA
1084 : e5 1c __ SBC ACCU + 1 
1086 : a8 __ __ TAY
1087 : a5 43 __ LDA T2 + 0 
1089 : 09 40 __ ORA #$40
108b : 85 43 __ STA T2 + 0 
.s10:
108d : a5 44 __ LDA T2 + 1 
108f : 4a __ __ LSR
1090 : 85 1c __ STA ACCU + 1 
1092 : a5 43 __ LDA T2 + 0 
1094 : 6a __ __ ROR
1095 : 85 1b __ STA ACCU + 0 
1097 : a5 43 __ LDA T2 + 0 
1099 : 09 10 __ ORA #$10
109b : 85 43 __ STA T2 + 0 
109d : c4 44 __ CPY T2 + 1 
109f : d0 02 __ BNE $10a3 ; (bm_usqrt.s22 + 0)
.s21:
10a1 : e4 43 __ CPX T2 + 0 
.s22:
10a3 : 90 0e __ BCC $10b3 ; (bm_usqrt.s11 + 0)
.s20:
10a5 : 8a __ __ TXA
10a6 : e5 43 __ SBC T2 + 0 
10a8 : aa __ __ TAX
10a9 : 98 __ __ TYA
10aa : e5 44 __ SBC T2 + 1 
10ac : a8 __ __ TAY
10ad : a5 1b __ LDA ACCU + 0 
10af : 09 10 __ ORA #$10
10b1 : 85 1b __ STA ACCU + 0 
.s11:
10b3 : a5 1c __ LDA ACCU + 1 
10b5 : 4a __ __ LSR
10b6 : 85 44 __ STA T2 + 1 
10b8 : a5 1b __ LDA ACCU + 0 
10ba : 6a __ __ ROR
10bb : 85 43 __ STA T2 + 0 
10bd : a5 1b __ LDA ACCU + 0 
10bf : 09 04 __ ORA #$04
10c1 : 85 1b __ STA ACCU + 0 
10c3 : c4 1c __ CPY ACCU + 1 
10c5 : d0 02 __ BNE $10c9 ; (bm_usqrt.s19 + 0)
.s18:
10c7 : e4 1b __ CPX ACCU + 0 
.s19:
10c9 : 90 0e __ BCC $10d9 ; (bm_usqrt.s12 + 0)
.s17:
10cb : 8a __ __ TXA
10cc : e5 1b __ SBC ACCU + 0 
10ce : aa __ __ TAX
10cf : 98 __ __ TYA
10d0 : e5 1c __ SBC ACCU + 1 
10d2 : a8 __ __ TAY
10d3 : a5 43 __ LDA T2 + 0 
10d5 : 09 04 __ ORA #$04
10d7 : 85 43 __ STA T2 + 0 
.s12:
10d9 : a5 44 __ LDA T2 + 1 
10db : 4a __ __ LSR
10dc : a5 43 __ LDA T2 + 0 
10de : 6a __ __ ROR
10df : c4 44 __ CPY T2 + 1 
10e1 : d0 0a __ BNE $10ed ; (bm_usqrt.s16 + 0)
.s15:
10e3 : a8 __ __ TAY
10e4 : a5 43 __ LDA T2 + 0 
10e6 : 09 01 __ ORA #$01
10e8 : 85 43 __ STA T2 + 0 
10ea : e4 43 __ CPX T2 + 0 
10ec : 98 __ __ TYA
.s16:
10ed : 90 02 __ BCC $10f1 ; (bm_usqrt.s13 + 0)
.s14:
10ef : 09 01 __ ORA #$01
.s13:
10f1 : 85 1b __ STA ACCU + 0 
10f3 : a9 00 __ LDA #$00
.s3:
10f5 : 85 1c __ STA ACCU + 1 
10f7 : 60 __ __ RTS
--------------------------------------------------------------------
bm_scan_fill: ; bm_scan_fill(i16,i16,u8*,i16,i16,u8)->void
;  77, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
10f8 : a5 14 __ LDA P7 ; (x0 + 1)
10fa : 30 0a __ BMI $1106 ; (bm_scan_fill.s24 + 0)
.s27:
10fc : c5 0e __ CMP P1 ; (left + 1)
10fe : d0 04 __ BNE $1104 ; (bm_scan_fill.s26 + 0)
.s25:
1100 : a5 13 __ LDA P6 ; (x0 + 0)
1102 : c5 0d __ CMP P0 ; (left + 0)
.s26:
1104 : b0 08 __ BCS $110e ; (bm_scan_fill.s5 + 0)
.s24:
1106 : a5 0d __ LDA P0 ; (left + 0)
1108 : 85 13 __ STA P6 ; (x0 + 0)
110a : a5 0e __ LDA P1 ; (left + 1)
110c : 85 14 __ STA P7 ; (x0 + 1)
.s5:
110e : 24 16 __ BIT P9 ; (x1 + 1)
1110 : 30 64 __ BMI $1176 ; (bm_scan_fill.s3 + 0)
.s23:
1112 : a5 10 __ LDA P3 ; (right + 1)
1114 : c5 16 __ CMP P9 ; (x1 + 1)
1116 : f0 03 __ BEQ $111b ; (bm_scan_fill.s21 + 0)
1118 : 4c 92 12 JMP $1292 ; (bm_scan_fill.s22 + 0)
.s21:
111b : a5 0f __ LDA P2 ; (right + 0)
111d : c5 15 __ CMP P8 ; (x1 + 0)
111f : b0 03 __ BCS $1124 ; (bm_scan_fill.s17 + 0)
1121 : 4c 7c 12 JMP $127c ; (bm_scan_fill.s18 + 0)
.s17:
1124 : a5 14 __ LDA P7 ; (x0 + 1)
1126 : c5 16 __ CMP P9 ; (x1 + 1)
1128 : d0 04 __ BNE $112e ; (bm_scan_fill.s20 + 0)
.s16:
112a : a5 13 __ LDA P6 ; (x0 + 0)
112c : c5 15 __ CMP P8 ; (x1 + 0)
.s20:
112e : b0 46 __ BCS $1176 ; (bm_scan_fill.s3 + 0)
.s6:
1130 : a5 13 __ LDA P6 ; (x0 + 0)
1132 : 29 f8 __ AND #$f8
1134 : 85 1b __ STA ACCU + 0 
1136 : 65 11 __ ADC P4 ; (lp + 0)
1138 : 85 43 __ STA T1 + 0 
113a : a5 12 __ LDA P5 ; (lp + 1)
113c : 65 14 __ ADC P7 ; (x0 + 1)
113e : 85 44 __ STA T1 + 1 
1140 : a5 15 __ LDA P8 ; (x1 + 0)
1142 : 29 07 __ AND #$07
1144 : aa __ __ TAX
1145 : a5 13 __ LDA P6 ; (x0 + 0)
1147 : 29 07 __ AND #$07
1149 : bc e5 1f LDY $1fe5,x ; (rmask[0] + 0)
114c : aa __ __ TAX
114d : a5 15 __ LDA P8 ; (x1 + 0)
114f : 29 f8 __ AND #$f8
1151 : 38 __ __ SEC
1152 : e5 1b __ SBC ACCU + 0 
1154 : 85 1b __ STA ACCU + 0 
1156 : a5 16 __ LDA P9 ; (x1 + 1)
1158 : e5 14 __ SBC P7 ; (x0 + 1)
115a : 85 1c __ STA ACCU + 1 
115c : 05 1b __ ORA ACCU + 0 
115e : d0 17 __ BNE $1177 ; (bm_scan_fill.s7 + 0)
.s15:
1160 : 98 __ __ TYA
1161 : 3d dd 1f AND $1fdd,x ; (lmask[0] + 0)
1164 : 85 1e __ STA ACCU + 3 
1166 : a0 00 __ LDY #$00
.s11:
1168 : 49 ff __ EOR #$ff
116a : 31 43 __ AND (T1 + 0),y 
116c : 85 1b __ STA ACCU + 0 
116e : a5 17 __ LDA P10 ; (pat + 0)
1170 : 25 1e __ AND ACCU + 3 
1172 : 05 1b __ ORA ACCU + 0 
1174 : 91 43 __ STA (T1 + 0),y 
.s3:
1176 : 60 __ __ RTS
.s7:
1177 : 84 1e __ STY ACCU + 3 
1179 : bd dd 1f LDA $1fdd,x ; (lmask[0] + 0)
117c : 49 ff __ EOR #$ff
117e : a0 00 __ LDY #$00
1180 : 31 43 __ AND (T1 + 0),y 
1182 : 85 1d __ STA ACCU + 2 
1184 : a5 17 __ LDA P10 ; (pat + 0)
1186 : 3d dd 1f AND $1fdd,x ; (lmask[0] + 0)
1189 : 05 1d __ ORA ACCU + 2 
118b : 91 43 __ STA (T1 + 0),y 
118d : a5 1c __ LDA ACCU + 1 
118f : d0 03 __ BNE $1194 ; (bm_scan_fill.s14 + 0)
1191 : 4c 1f 12 JMP $121f ; (bm_scan_fill.s8 + 0)
.s14:
1194 : a5 17 __ LDA P10 ; (pat + 0)
1196 : a0 08 __ LDY #$08
1198 : 91 43 __ STA (T1 + 0),y 
119a : a0 10 __ LDY #$10
119c : 91 43 __ STA (T1 + 0),y 
119e : a0 18 __ LDY #$18
11a0 : 91 43 __ STA (T1 + 0),y 
11a2 : a0 20 __ LDY #$20
11a4 : 91 43 __ STA (T1 + 0),y 
11a6 : a0 28 __ LDY #$28
11a8 : 91 43 __ STA (T1 + 0),y 
11aa : a0 30 __ LDY #$30
11ac : 91 43 __ STA (T1 + 0),y 
11ae : a0 38 __ LDY #$38
11b0 : 91 43 __ STA (T1 + 0),y 
11b2 : a0 40 __ LDY #$40
11b4 : 91 43 __ STA (T1 + 0),y 
11b6 : a0 48 __ LDY #$48
11b8 : 91 43 __ STA (T1 + 0),y 
11ba : a0 50 __ LDY #$50
11bc : 91 43 __ STA (T1 + 0),y 
11be : a0 58 __ LDY #$58
11c0 : 91 43 __ STA (T1 + 0),y 
11c2 : a0 60 __ LDY #$60
11c4 : 91 43 __ STA (T1 + 0),y 
11c6 : a0 68 __ LDY #$68
11c8 : 91 43 __ STA (T1 + 0),y 
11ca : a0 70 __ LDY #$70
11cc : 91 43 __ STA (T1 + 0),y 
11ce : a0 78 __ LDY #$78
11d0 : 91 43 __ STA (T1 + 0),y 
11d2 : a0 80 __ LDY #$80
11d4 : 91 43 __ STA (T1 + 0),y 
11d6 : a0 88 __ LDY #$88
11d8 : 91 43 __ STA (T1 + 0),y 
11da : a0 90 __ LDY #$90
11dc : 91 43 __ STA (T1 + 0),y 
11de : a0 98 __ LDY #$98
11e0 : 91 43 __ STA (T1 + 0),y 
11e2 : a0 a0 __ LDY #$a0
11e4 : 91 43 __ STA (T1 + 0),y 
11e6 : a0 a8 __ LDY #$a8
11e8 : 91 43 __ STA (T1 + 0),y 
11ea : a0 b0 __ LDY #$b0
11ec : 91 43 __ STA (T1 + 0),y 
11ee : a0 b8 __ LDY #$b8
11f0 : 91 43 __ STA (T1 + 0),y 
11f2 : a0 c0 __ LDY #$c0
11f4 : 91 43 __ STA (T1 + 0),y 
11f6 : a0 c8 __ LDY #$c8
11f8 : 91 43 __ STA (T1 + 0),y 
11fa : a0 d0 __ LDY #$d0
11fc : 91 43 __ STA (T1 + 0),y 
11fe : a0 d8 __ LDY #$d8
1200 : 91 43 __ STA (T1 + 0),y 
1202 : a0 e0 __ LDY #$e0
1204 : 91 43 __ STA (T1 + 0),y 
1206 : a0 e8 __ LDY #$e8
1208 : 91 43 __ STA (T1 + 0),y 
120a : a0 f0 __ LDY #$f0
120c : 91 43 __ STA (T1 + 0),y 
120e : a0 f8 __ LDY #$f8
1210 : 91 43 __ STA (T1 + 0),y 
1212 : 38 __ __ SEC
1213 : a5 1b __ LDA ACCU + 0 
1215 : e9 f8 __ SBC #$f8
1217 : 85 1b __ STA ACCU + 0 
1219 : e6 44 __ INC T1 + 1 
121b : a9 00 __ LDA #$00
121d : f0 48 __ BEQ $1267 ; (bm_scan_fill.s28 + 0)
.s8:
121f : 24 1b __ BIT ACCU + 0 
1221 : 30 04 __ BMI $1227 ; (bm_scan_fill.s13 + 0)
.s9:
1223 : a9 08 __ LDA #$08
1225 : d0 40 __ BNE $1267 ; (bm_scan_fill.s28 + 0)
.s13:
1227 : a5 17 __ LDA P10 ; (pat + 0)
1229 : a0 08 __ LDY #$08
122b : 91 43 __ STA (T1 + 0),y 
122d : a0 10 __ LDY #$10
122f : 91 43 __ STA (T1 + 0),y 
1231 : a0 18 __ LDY #$18
1233 : 91 43 __ STA (T1 + 0),y 
1235 : a0 20 __ LDY #$20
1237 : 91 43 __ STA (T1 + 0),y 
1239 : a0 28 __ LDY #$28
123b : 91 43 __ STA (T1 + 0),y 
123d : a0 30 __ LDY #$30
123f : 91 43 __ STA (T1 + 0),y 
1241 : a0 38 __ LDY #$38
1243 : 91 43 __ STA (T1 + 0),y 
1245 : a0 40 __ LDY #$40
1247 : 91 43 __ STA (T1 + 0),y 
1249 : a0 48 __ LDY #$48
124b : 91 43 __ STA (T1 + 0),y 
124d : a0 50 __ LDY #$50
124f : 91 43 __ STA (T1 + 0),y 
1251 : a0 58 __ LDY #$58
1253 : 91 43 __ STA (T1 + 0),y 
1255 : a0 60 __ LDY #$60
1257 : 91 43 __ STA (T1 + 0),y 
1259 : a0 68 __ LDY #$68
125b : 91 43 __ STA (T1 + 0),y 
125d : a0 70 __ LDY #$70
125f : 91 43 __ STA (T1 + 0),y 
1261 : a0 78 __ LDY #$78
1263 : 91 43 __ STA (T1 + 0),y 
1265 : a9 80 __ LDA #$80
.s28:
1267 : a6 17 __ LDX P10 ; (pat + 0)
1269 : 4c 72 12 JMP $1272 ; (bm_scan_fill.l10 + 0)
.s12:
126c : 8a __ __ TXA
126d : 91 43 __ STA (T1 + 0),y 
126f : 98 __ __ TYA
1270 : 69 08 __ ADC #$08
.l10:
1272 : a8 __ __ TAY
1273 : c4 1b __ CPY ACCU + 0 
1275 : 90 f5 __ BCC $126c ; (bm_scan_fill.s12 + 0)
.s29:
1277 : a5 1e __ LDA ACCU + 3 
1279 : 4c 68 11 JMP $1168 ; (bm_scan_fill.s11 + 0)
.s18:
127c : 85 15 __ STA P8 ; (x1 + 0)
127e : a5 10 __ LDA P3 ; (right + 1)
1280 : 85 16 __ STA P9 ; (x1 + 1)
1282 : a5 14 __ LDA P7 ; (x0 + 1)
1284 : c5 10 __ CMP P3 ; (right + 1)
1286 : f0 03 __ BEQ $128b ; (bm_scan_fill.s19 + 0)
1288 : 4c 2e 11 JMP $112e ; (bm_scan_fill.s20 + 0)
.s19:
128b : a5 13 __ LDA P6 ; (x0 + 0)
128d : c5 0f __ CMP P2 ; (right + 0)
128f : 4c 2e 11 JMP $112e ; (bm_scan_fill.s20 + 0)
.s22:
1292 : 90 03 __ BCC $1297 ; (bm_scan_fill.s30 + 0)
1294 : 4c 24 11 JMP $1124 ; (bm_scan_fill.s17 + 0)
.s30:
1297 : a5 0f __ LDA P2 ; (right + 0)
1299 : 90 e1 __ BCC $127c ; (bm_scan_fill.s18 + 0)
--------------------------------------------------------------------
keyb_poll: ; keyb_poll()->void
; 126, "/home/honza/projects/c64/projects/oscar64/include/c64/keyboard.h"
.s4:
129b : a9 00 __ LDA #$00
129d : 8d a7 20 STA $20a7 ; (keyb_key + 0)
12a0 : a9 ff __ LDA #$ff
12a2 : 8d 02 dc STA $dc02 
12a5 : 8d 00 dc STA $dc00 
12a8 : ae 01 dc LDX $dc01 
12ab : e8 __ __ INX
12ac : d0 25 __ BNE $12d3 ; (keyb_poll.s3 + 0)
.s5:
12ae : 8e 03 dc STX $dc03 
12b1 : 8e 00 dc STX $dc00 
12b4 : ad 01 dc LDA $dc01 
12b7 : c9 ff __ CMP #$ff
12b9 : d0 1f __ BNE $12da ; (keyb_poll.s7 + 0)
.s6:
12bb : 8d a8 20 STA $20a8 ; (keyb_matrix[0] + 0)
12be : 8d a9 20 STA $20a9 ; (keyb_matrix[0] + 1)
12c1 : 8d aa 20 STA $20aa ; (keyb_matrix[0] + 2)
12c4 : 8d ab 20 STA $20ab ; (keyb_matrix[0] + 3)
12c7 : 8d ac 20 STA $20ac ; (keyb_matrix[0] + 4)
12ca : 8d ad 20 STA $20ad ; (keyb_matrix[0] + 5)
12cd : 8d ae 20 STA $20ae ; (keyb_matrix[0] + 6)
12d0 : 8d af 20 STA $20af ; (keyb_matrix[0] + 7)
.s3:
12d3 : ad fd 1f LDA $1ffd ; (ciaa_pra_def + 0)
12d6 : 8d 00 dc STA $dc00 
12d9 : 60 __ __ RTS
.s7:
12da : ad ae 20 LDA $20ae ; (keyb_matrix[0] + 6)
12dd : 29 ef __ AND #$ef
12df : 8d ae 20 STA $20ae ; (keyb_matrix[0] + 6)
12e2 : ad a9 20 LDA $20a9 ; (keyb_matrix[0] + 1)
12e5 : 29 7f __ AND #$7f
12e7 : 8d a9 20 STA $20a9 ; (keyb_matrix[0] + 1)
12ea : a9 fe __ LDA #$fe
12ec : 85 1b __ STA ACCU + 0 
.l20:
12ee : a5 1b __ LDA ACCU + 0 
12f0 : 8d 00 dc STA $dc00 
12f3 : bd a8 20 LDA $20a8,x ; (keyb_matrix[0] + 0)
12f6 : 85 1c __ STA ACCU + 1 
12f8 : ad 01 dc LDA $dc01 
12fb : 9d a8 20 STA $20a8,x ; (keyb_matrix[0] + 0)
12fe : 38 __ __ SEC
12ff : 26 1b __ ROL ACCU + 0 
1301 : 49 ff __ EOR #$ff
1303 : 25 1c __ AND ACCU + 1 
1305 : f0 25 __ BEQ $132c ; (keyb_poll.s8 + 0)
.s13:
1307 : 85 1c __ STA ACCU + 1 
1309 : 8a __ __ TXA
130a : 0a __ __ ASL
130b : 0a __ __ ASL
130c : 0a __ __ ASL
130d : 09 80 __ ORA #$80
130f : a8 __ __ TAY
1310 : a5 1c __ LDA ACCU + 1 
1312 : 29 f0 __ AND #$f0
1314 : f0 04 __ BEQ $131a ; (keyb_poll.s14 + 0)
.s19:
1316 : 98 __ __ TYA
1317 : 09 04 __ ORA #$04
1319 : a8 __ __ TAY
.s14:
131a : a5 1c __ LDA ACCU + 1 
131c : 29 cc __ AND #$cc
131e : f0 02 __ BEQ $1322 ; (keyb_poll.s15 + 0)
.s18:
1320 : c8 __ __ INY
1321 : c8 __ __ INY
.s15:
1322 : a5 1c __ LDA ACCU + 1 
1324 : 29 aa __ AND #$aa
1326 : f0 01 __ BEQ $1329 ; (keyb_poll.s16 + 0)
.s17:
1328 : c8 __ __ INY
.s16:
1329 : 8c a7 20 STY $20a7 ; (keyb_key + 0)
.s8:
132c : e8 __ __ INX
132d : e0 08 __ CPX #$08
132f : 90 bd __ BCC $12ee ; (keyb_poll.l20 + 0)
.s9:
1331 : ad a7 20 LDA $20a7 ; (keyb_key + 0)
1334 : f0 9d __ BEQ $12d3 ; (keyb_poll.s3 + 0)
.s10:
1336 : 2c a9 20 BIT $20a9 ; (keyb_matrix[0] + 1)
1339 : 10 07 __ BPL $1342 ; (keyb_poll.s11 + 0)
.s12:
133b : ad ae 20 LDA $20ae ; (keyb_matrix[0] + 6)
133e : 29 10 __ AND #$10
1340 : d0 91 __ BNE $12d3 ; (keyb_poll.s3 + 0)
.s11:
1342 : ad a7 20 LDA $20a7 ; (keyb_key + 0)
1345 : 09 40 __ ORA #$40
1347 : 8d a7 20 STA $20a7 ; (keyb_key + 0)
134a : b0 87 __ BCS $12d3 ; (keyb_poll.s3 + 0)
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s1:
134c : a5 53 __ LDA T6 + 0 
134e : 8d ea cf STA $cfea ; (bmu_bitblit@stack + 0)
1351 : a5 54 __ LDA T6 + 1 
1353 : 8d eb cf STA $cfeb ; (bmu_bitblit@stack + 1)
1356 : a5 55 __ LDA T8 + 0 
1358 : 8d ec cf STA $cfec ; (bmu_bitblit@stack + 2)
.s4:
135b : ad f0 cf LDA $cff0 ; (sstack + 0)
135e : 85 4e __ STA T2 + 0 
1360 : 18 __ __ CLC
1361 : 6d fa cf ADC $cffa ; (sstack + 10)
1364 : 85 45 __ STA T1 + 0 
1366 : 29 07 __ AND #$07
1368 : aa __ __ TAX
1369 : bd e5 1f LDA $1fe5,x ; (rmask[0] + 0)
136c : 85 13 __ STA P6 
136e : ad fb cf LDA $cffb ; (sstack + 11)
1371 : 6d f1 cf ADC $cff1 ; (sstack + 1)
1374 : 4a __ __ LSR
1375 : 66 45 __ ROR T1 + 0 
1377 : 4a __ __ LSR
1378 : 66 45 __ ROR T1 + 0 
137a : 4a __ __ LSR
137b : 66 45 __ ROR T1 + 0 
137d : ad f1 cf LDA $cff1 ; (sstack + 1)
1380 : 4a __ __ LSR
1381 : 66 4e __ ROR T2 + 0 
1383 : 4a __ __ LSR
1384 : 66 4e __ ROR T2 + 0 
1386 : 4a __ __ LSR
1387 : 66 4e __ ROR T2 + 0 
1389 : 38 __ __ SEC
138a : a5 45 __ LDA T1 + 0 
138c : e5 4e __ SBC T2 + 0 
138e : 85 11 __ STA P4 
1390 : ad f0 cf LDA $cff0 ; (sstack + 0)
1393 : 29 07 __ AND #$07
1395 : 85 4e __ STA T2 + 0 
1397 : aa __ __ TAX
1398 : bd dd 1f LDA $1fdd,x ; (lmask[0] + 0)
139b : 85 4c __ STA T10 + 0 
139d : 85 12 __ STA P5 
139f : ad f4 cf LDA $cff4 ; (sstack + 4)
13a2 : 85 49 __ STA T4 + 0 
13a4 : ad f5 cf LDA $cff5 ; (sstack + 5)
13a7 : 85 4a __ STA T4 + 1 
13a9 : a5 16 __ LDA P9 ; (dbm + 0)
13ab : c5 49 __ CMP T4 + 0 
13ad : d0 78 __ BNE $1427 ; (bmu_bitblit.s5 + 0)
.s52:
13af : a5 17 __ LDA P10 ; (dbm + 1)
13b1 : c5 4a __ CMP T4 + 1 
13b3 : d0 72 __ BNE $1427 ; (bmu_bitblit.s5 + 0)
.s38:
13b5 : ad f9 cf LDA $cff9 ; (sstack + 9)
13b8 : cd f3 cf CMP $cff3 ; (sstack + 3)
13bb : d0 0a __ BNE $13c7 ; (bmu_bitblit.s51 + 0)
.s48:
13bd : ad f8 cf LDA $cff8 ; (sstack + 8)
13c0 : cd f2 cf CMP $cff2 ; (sstack + 2)
.s49:
13c3 : b0 09 __ BCS $13ce ; (bmu_bitblit.s39 + 0)
13c5 : 90 30 __ BCC $13f7 ; (bmu_bitblit.s41 + 0)
.s51:
13c7 : 4d f3 cf EOR $cff3 ; (sstack + 3)
13ca : 10 f7 __ BPL $13c3 ; (bmu_bitblit.s49 + 0)
.s50:
13cc : b0 29 __ BCS $13f7 ; (bmu_bitblit.s41 + 0)
.s39:
13ce : ad f3 cf LDA $cff3 ; (sstack + 3)
13d1 : cd f9 cf CMP $cff9 ; (sstack + 9)
13d4 : d0 51 __ BNE $1427 ; (bmu_bitblit.s5 + 0)
.s47:
13d6 : ad f2 cf LDA $cff2 ; (sstack + 2)
13d9 : cd f8 cf CMP $cff8 ; (sstack + 8)
13dc : d0 49 __ BNE $1427 ; (bmu_bitblit.s5 + 0)
.s40:
13de : ad f7 cf LDA $cff7 ; (sstack + 7)
13e1 : cd f1 cf CMP $cff1 ; (sstack + 1)
13e4 : d0 0a __ BNE $13f0 ; (bmu_bitblit.s46 + 0)
.s43:
13e6 : ad f6 cf LDA $cff6 ; (sstack + 6)
13e9 : cd f0 cf CMP $cff0 ; (sstack + 0)
.s44:
13ec : 90 09 __ BCC $13f7 ; (bmu_bitblit.s41 + 0)
13ee : b0 37 __ BCS $1427 ; (bmu_bitblit.s5 + 0)
.s46:
13f0 : 4d f1 cf EOR $cff1 ; (sstack + 1)
13f3 : 10 f7 __ BPL $13ec ; (bmu_bitblit.s44 + 0)
.s45:
13f5 : 90 30 __ BCC $1427 ; (bmu_bitblit.s5 + 0)
.s41:
13f7 : a5 18 __ LDA P11 ; (op + 0)
13f9 : 29 08 __ AND #$08
13fb : f0 2a __ BEQ $1427 ; (bmu_bitblit.s5 + 0)
.s42:
13fd : ad fc cf LDA $cffc ; (sstack + 12)
1400 : 18 __ __ CLC
1401 : 6d f8 cf ADC $cff8 ; (sstack + 8)
1404 : 8d f8 cf STA $cff8 ; (sstack + 8)
1407 : ad fd cf LDA $cffd ; (sstack + 13)
140a : 6d f9 cf ADC $cff9 ; (sstack + 9)
140d : 8d f9 cf STA $cff9 ; (sstack + 9)
1410 : ad fc cf LDA $cffc ; (sstack + 12)
1413 : 18 __ __ CLC
1414 : 6d f2 cf ADC $cff2 ; (sstack + 2)
1417 : 8d f2 cf STA $cff2 ; (sstack + 2)
141a : ad fd cf LDA $cffd ; (sstack + 13)
141d : 6d f3 cf ADC $cff3 ; (sstack + 3)
1420 : 8d f3 cf STA $cff3 ; (sstack + 3)
1423 : a9 01 __ LDA #$01
1425 : d0 02 __ BNE $1429 ; (bmu_bitblit.s6 + 0)
.s5:
1427 : a9 00 __ LDA #$00
.s6:
1429 : 85 15 __ STA P8 
142b : ad f3 cf LDA $cff3 ; (sstack + 3)
142e : 85 1c __ STA ACCU + 1 ; (dy + 1)
1430 : ad f2 cf LDA $cff2 ; (sstack + 2)
1433 : 29 f8 __ AND #$f8
1435 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1437 : a0 04 __ LDY #$04
1439 : b1 16 __ LDA (P9),y ; (dbm + 0)
143b : 85 52 __ STA T7 + 0 
143d : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
1440 : a0 00 __ LDY #$00
1442 : b1 16 __ LDA (P9),y ; (dbm + 0)
1444 : 18 __ __ CLC
1445 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1447 : 85 02 __ STA $02 
1449 : c8 __ __ INY
144a : b1 16 __ LDA (P9),y ; (dbm + 0)
144c : 65 1c __ ADC ACCU + 1 ; (dy + 1)
144e : aa __ __ TAX
144f : ad f0 cf LDA $cff0 ; (sstack + 0)
1452 : 29 f8 __ AND #$f8
1454 : 18 __ __ CLC
1455 : 65 02 __ ADC $02 
1457 : 85 47 __ STA T3 + 0 
1459 : 8a __ __ TXA
145a : 6d f1 cf ADC $cff1 ; (sstack + 1)
145d : aa __ __ TAX
145e : ad f2 cf LDA $cff2 ; (sstack + 2)
1461 : 29 07 __ AND #$07
1463 : 18 __ __ CLC
1464 : 65 47 __ ADC T3 + 0 
1466 : 85 53 __ STA T6 + 0 
1468 : 90 01 __ BCC $146b ; (bmu_bitblit.s54 + 0)
.s53:
146a : e8 __ __ INX
.s54:
146b : 86 54 __ STX T6 + 1 
146d : ad f9 cf LDA $cff9 ; (sstack + 9)
1470 : 85 1c __ STA ACCU + 1 ; (dy + 1)
1472 : ad f8 cf LDA $cff8 ; (sstack + 8)
1475 : 29 f8 __ AND #$f8
1477 : 85 1b __ STA ACCU + 0 ; (dy + 0)
1479 : a0 04 __ LDY #$04
147b : b1 49 __ LDA (T4 + 0),y 
147d : 85 55 __ STA T8 + 0 
147f : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
1482 : a0 00 __ LDY #$00
1484 : b1 49 __ LDA (T4 + 0),y 
1486 : 18 __ __ CLC
1487 : 65 1b __ ADC ACCU + 0 ; (dy + 0)
1489 : 85 02 __ STA $02 
148b : c8 __ __ INY
148c : b1 49 __ LDA (T4 + 0),y 
148e : 65 1c __ ADC ACCU + 1 ; (dy + 1)
1490 : aa __ __ TAX
1491 : ad f6 cf LDA $cff6 ; (sstack + 6)
1494 : 29 f8 __ AND #$f8
1496 : 18 __ __ CLC
1497 : 65 02 __ ADC $02 
1499 : 85 49 __ STA T4 + 0 
149b : 8a __ __ TXA
149c : 6d f7 cf ADC $cff7 ; (sstack + 7)
149f : aa __ __ TAX
14a0 : ad f8 cf LDA $cff8 ; (sstack + 8)
14a3 : 29 07 __ AND #$07
14a5 : 18 __ __ CLC
14a6 : 65 49 __ ADC T4 + 0 
14a8 : 85 49 __ STA T4 + 0 
14aa : 90 01 __ BCC $14ad ; (bmu_bitblit.s56 + 0)
.s55:
14ac : e8 __ __ INX
.s56:
14ad : ad f6 cf LDA $cff6 ; (sstack + 6)
14b0 : 29 07 __ AND #$07
14b2 : 49 ff __ EOR #$ff
14b4 : 38 __ __ SEC
14b5 : 65 4e __ ADC T2 + 0 
14b7 : 85 43 __ STA T0 + 0 
14b9 : 29 07 __ AND #$07
14bb : 85 10 __ STA P3 
14bd : a5 15 __ LDA P8 
14bf : f0 03 __ BEQ $14c4 ; (bmu_bitblit.s7 + 0)
14c1 : 4c b3 16 JMP $16b3 ; (bmu_bitblit.s36 + 0)
.s7:
14c4 : 86 51 __ STX T5 + 1 
14c6 : a4 49 __ LDY T4 + 0 
14c8 : 84 50 __ STY T5 + 0 
14ca : a5 43 __ LDA T0 + 0 
14cc : f0 0d __ BEQ $14db ; (bmu_bitblit.s8 + 0)
.s34:
14ce : 30 0b __ BMI $14db ; (bmu_bitblit.s8 + 0)
.s35:
14d0 : 98 __ __ TYA
14d1 : 18 __ __ CLC
14d2 : 69 f8 __ ADC #$f8
14d4 : 85 50 __ STA T5 + 0 
14d6 : 8a __ __ TXA
14d7 : 69 ff __ ADC #$ff
14d9 : 85 51 __ STA T5 + 1 
.s8:
14db : a5 18 __ LDA P11 ; (op + 0)
14dd : 85 14 __ STA P7 
14df : 20 fe 16 JSR $16fe ; (builddop.s4 + 0)
14e2 : 18 __ __ CLC
14e3 : a5 52 __ LDA T7 + 0 
14e5 : 69 ff __ ADC #$ff
14e7 : 2a __ __ ROL
14e8 : 2a __ __ ROL
14e9 : 2a __ __ ROL
14ea : aa __ __ TAX
14eb : 29 f8 __ AND #$f8
14ed : 85 43 __ STA T0 + 0 
14ef : 8a __ __ TXA
14f0 : 29 07 __ AND #$07
14f2 : 2a __ __ ROL
14f3 : 69 f8 __ ADC #$f8
14f5 : 85 44 __ STA T0 + 1 
14f7 : ad fe cf LDA $cffe ; (sstack + 14)
14fa : 85 45 __ STA T1 + 0 
14fc : 85 47 __ STA T3 + 0 
14fe : ad ff cf LDA $cfff ; (sstack + 15)
1501 : 85 46 __ STA T1 + 1 
1503 : a5 18 __ LDA P11 ; (op + 0)
1505 : 29 08 __ AND #$08
1507 : f0 03 __ BEQ $150c ; (bmu_bitblit.s9 + 0)
1509 : 4c a6 15 JMP $15a6 ; (bmu_bitblit.s19 + 0)
.s9:
150c : ad fc cf LDA $cffc ; (sstack + 12)
150f : 85 47 __ STA T3 + 0 
1511 : a5 18 __ LDA P11 ; (op + 0)
1513 : 29 20 __ AND #$20
1515 : d0 4c __ BNE $1563 ; (bmu_bitblit.s15 + 0)
.s10:
1517 : a5 47 __ LDA T3 + 0 
1519 : f0 38 __ BEQ $1553 ; (bmu_bitblit.s3 + 0)
.s11:
151b : a9 00 __ LDA #$00
151d : 85 4e __ STA T2 + 0 
.l12:
151f : a5 53 __ LDA T6 + 0 
1521 : 85 03 __ STA WORK + 0 
1523 : a5 54 __ LDA T6 + 1 
1525 : 85 04 __ STA WORK + 1 
1527 : a5 53 __ LDA T6 + 0 
1529 : 85 05 __ STA WORK + 2 
152b : a5 54 __ LDA T6 + 1 
152d : 85 06 __ STA WORK + 3 
152f : a5 4e __ LDA T2 + 0 
1531 : 85 07 __ STA WORK + 4 
1533 : 20 00 21 JSR $2100 ; (BLIT_CODE[0] + 0)
1536 : e6 53 __ INC T6 + 0 
1538 : d0 02 __ BNE $153c ; (bmu_bitblit.s69 + 0)
.s68:
153a : e6 54 __ INC T6 + 1 
.s69:
153c : a5 53 __ LDA T6 + 0 
153e : 29 07 __ AND #$07
1540 : d0 0d __ BNE $154f ; (bmu_bitblit.s13 + 0)
.s14:
1542 : 18 __ __ CLC
1543 : a5 53 __ LDA T6 + 0 
1545 : 65 43 __ ADC T0 + 0 
1547 : 85 53 __ STA T6 + 0 
1549 : a5 54 __ LDA T6 + 1 
154b : 65 44 __ ADC T0 + 1 
154d : 85 54 __ STA T6 + 1 
.s13:
154f : c6 47 __ DEC T3 + 0 
1551 : d0 cc __ BNE $151f ; (bmu_bitblit.l12 + 0)
.s3:
1553 : ad ea cf LDA $cfea ; (bmu_bitblit@stack + 0)
1556 : 85 53 __ STA T6 + 0 
1558 : ad eb cf LDA $cfeb ; (bmu_bitblit@stack + 1)
155b : 85 54 __ STA T6 + 1 
155d : ad ec cf LDA $cfec ; (bmu_bitblit@stack + 2)
1560 : 85 55 __ STA T8 + 0 
1562 : 60 __ __ RTS
.s15:
1563 : a5 47 __ LDA T3 + 0 
1565 : f0 ec __ BEQ $1553 ; (bmu_bitblit.s3 + 0)
.l16:
1567 : a5 53 __ LDA T6 + 0 
1569 : 29 07 __ AND #$07
156b : a8 __ __ TAY
156c : b1 45 __ LDA (T1 + 0),y 
156e : 85 4e __ STA T2 + 0 
1570 : a5 53 __ LDA T6 + 0 
1572 : 85 03 __ STA WORK + 0 
1574 : a5 54 __ LDA T6 + 1 
1576 : 85 04 __ STA WORK + 1 
1578 : a5 53 __ LDA T6 + 0 
157a : 85 05 __ STA WORK + 2 
157c : a5 54 __ LDA T6 + 1 
157e : 85 06 __ STA WORK + 3 
1580 : a5 4e __ LDA T2 + 0 
1582 : 85 07 __ STA WORK + 4 
1584 : 20 00 21 JSR $2100 ; (BLIT_CODE[0] + 0)
1587 : e6 53 __ INC T6 + 0 
1589 : d0 02 __ BNE $158d ; (bmu_bitblit.s67 + 0)
.s66:
158b : e6 54 __ INC T6 + 1 
.s67:
158d : a5 53 __ LDA T6 + 0 
158f : 29 07 __ AND #$07
1591 : d0 0d __ BNE $15a0 ; (bmu_bitblit.s17 + 0)
.s18:
1593 : 18 __ __ CLC
1594 : a5 53 __ LDA T6 + 0 
1596 : 65 43 __ ADC T0 + 0 
1598 : 85 53 __ STA T6 + 0 
159a : a5 54 __ LDA T6 + 1 
159c : 65 44 __ ADC T0 + 1 
159e : 85 54 __ STA T6 + 1 
.s17:
15a0 : c6 47 __ DEC T3 + 0 
15a2 : d0 c3 __ BNE $1567 ; (bmu_bitblit.l16 + 0)
15a4 : f0 ad __ BEQ $1553 ; (bmu_bitblit.s3 + 0)
.s19:
15a6 : 18 __ __ CLC
15a7 : a5 55 __ LDA T8 + 0 
15a9 : 69 ff __ ADC #$ff
15ab : 2a __ __ ROL
15ac : 2a __ __ ROL
15ad : 2a __ __ ROL
15ae : aa __ __ TAX
15af : 29 f8 __ AND #$f8
15b1 : 85 4e __ STA T2 + 0 
15b3 : 8a __ __ TXA
15b4 : 29 07 __ AND #$07
15b6 : 2a __ __ ROL
15b7 : 69 f8 __ ADC #$f8
15b9 : 85 4f __ STA T2 + 1 
15bb : a5 46 __ LDA T1 + 1 
15bd : 85 48 __ STA T3 + 1 
15bf : 05 45 __ ORA T1 + 0 
15c1 : d0 08 __ BNE $15cb ; (bmu_bitblit.s21 + 0)
.s20:
15c3 : a5 50 __ LDA T5 + 0 
15c5 : 85 47 __ STA T3 + 0 
15c7 : a5 51 __ LDA T5 + 1 
15c9 : 85 48 __ STA T3 + 1 
.s21:
15cb : ad fc cf LDA $cffc ; (sstack + 12)
15ce : 85 45 __ STA T1 + 0 
15d0 : a5 15 __ LDA P8 
15d2 : d0 03 __ BNE $15d7 ; (bmu_bitblit.s28 + 0)
15d4 : 4c 56 16 JMP $1656 ; (bmu_bitblit.s22 + 0)
.s28:
15d7 : 38 __ __ SEC
15d8 : a9 00 __ LDA #$00
15da : e5 43 __ SBC T0 + 0 
15dc : 85 43 __ STA T0 + 0 
15de : a9 00 __ LDA #$00
15e0 : e5 44 __ SBC T0 + 1 
15e2 : 85 44 __ STA T0 + 1 
15e4 : 38 __ __ SEC
15e5 : a9 00 __ LDA #$00
15e7 : e5 4e __ SBC T2 + 0 
15e9 : 85 4e __ STA T2 + 0 
15eb : a9 00 __ LDA #$00
15ed : e5 4f __ SBC T2 + 1 
15ef : 85 4f __ STA T2 + 1 
15f1 : a5 45 __ LDA T1 + 0 
15f3 : d0 03 __ BNE $15f8 ; (bmu_bitblit.l29 + 0)
15f5 : 4c 53 15 JMP $1553 ; (bmu_bitblit.s3 + 0)
.l29:
15f8 : a5 50 __ LDA T5 + 0 
15fa : 29 07 __ AND #$07
15fc : d0 0d __ BNE $160b ; (bmu_bitblit.s30 + 0)
.s33:
15fe : 18 __ __ CLC
15ff : a5 50 __ LDA T5 + 0 
1601 : 65 4e __ ADC T2 + 0 
1603 : 85 50 __ STA T5 + 0 
1605 : a5 51 __ LDA T5 + 1 
1607 : 65 4f __ ADC T2 + 1 
1609 : 85 51 __ STA T5 + 1 
.s30:
160b : a5 53 __ LDA T6 + 0 
160d : 29 07 __ AND #$07
160f : d0 0d __ BNE $161e ; (bmu_bitblit.s31 + 0)
.s32:
1611 : 18 __ __ CLC
1612 : a5 53 __ LDA T6 + 0 
1614 : 65 43 __ ADC T0 + 0 
1616 : 85 53 __ STA T6 + 0 
1618 : a5 54 __ LDA T6 + 1 
161a : 65 44 __ ADC T0 + 1 
161c : 85 54 __ STA T6 + 1 
.s31:
161e : 18 __ __ CLC
161f : a5 53 __ LDA T6 + 0 
1621 : 69 ff __ ADC #$ff
1623 : 85 53 __ STA T6 + 0 
1625 : 29 07 __ AND #$07
1627 : a8 __ __ TAY
1628 : b0 02 __ BCS $162c ; (bmu_bitblit.s59 + 0)
.s58:
162a : c6 54 __ DEC T6 + 1 
.s59:
162c : b1 47 __ LDA (T3 + 0),y 
162e : 85 49 __ STA T4 + 0 
1630 : a5 50 __ LDA T5 + 0 
1632 : d0 02 __ BNE $1636 ; (bmu_bitblit.s61 + 0)
.s60:
1634 : c6 51 __ DEC T5 + 1 
.s61:
1636 : c6 50 __ DEC T5 + 0 
1638 : a5 50 __ LDA T5 + 0 
163a : 85 03 __ STA WORK + 0 
163c : a5 51 __ LDA T5 + 1 
163e : 85 04 __ STA WORK + 1 
1640 : a5 53 __ LDA T6 + 0 
1642 : 85 05 __ STA WORK + 2 
1644 : a5 54 __ LDA T6 + 1 
1646 : 85 06 __ STA WORK + 3 
1648 : a5 49 __ LDA T4 + 0 
164a : 85 07 __ STA WORK + 4 
164c : 20 00 21 JSR $2100 ; (BLIT_CODE[0] + 0)
164f : c6 45 __ DEC T1 + 0 
1651 : d0 a5 __ BNE $15f8 ; (bmu_bitblit.l29 + 0)
1653 : 4c 53 15 JMP $1553 ; (bmu_bitblit.s3 + 0)
.s22:
1656 : a5 45 __ LDA T1 + 0 
1658 : f0 f9 __ BEQ $1653 ; (bmu_bitblit.s61 + 29)
.l23:
165a : a5 53 __ LDA T6 + 0 
165c : 29 07 __ AND #$07
165e : a8 __ __ TAY
165f : b1 47 __ LDA (T3 + 0),y 
1661 : 85 49 __ STA T4 + 0 
1663 : a5 50 __ LDA T5 + 0 
1665 : 85 03 __ STA WORK + 0 
1667 : a5 51 __ LDA T5 + 1 
1669 : 85 04 __ STA WORK + 1 
166b : a5 53 __ LDA T6 + 0 
166d : 85 05 __ STA WORK + 2 
166f : a5 54 __ LDA T6 + 1 
1671 : 85 06 __ STA WORK + 3 
1673 : a5 49 __ LDA T4 + 0 
1675 : 85 07 __ STA WORK + 4 
1677 : 20 00 21 JSR $2100 ; (BLIT_CODE[0] + 0)
167a : e6 50 __ INC T5 + 0 
167c : d0 02 __ BNE $1680 ; (bmu_bitblit.s63 + 0)
.s62:
167e : e6 51 __ INC T5 + 1 
.s63:
1680 : a5 50 __ LDA T5 + 0 
1682 : 29 07 __ AND #$07
1684 : d0 0d __ BNE $1693 ; (bmu_bitblit.s24 + 0)
.s27:
1686 : 18 __ __ CLC
1687 : a5 50 __ LDA T5 + 0 
1689 : 65 4e __ ADC T2 + 0 
168b : 85 50 __ STA T5 + 0 
168d : a5 51 __ LDA T5 + 1 
168f : 65 4f __ ADC T2 + 1 
1691 : 85 51 __ STA T5 + 1 
.s24:
1693 : e6 53 __ INC T6 + 0 
1695 : d0 02 __ BNE $1699 ; (bmu_bitblit.s65 + 0)
.s64:
1697 : e6 54 __ INC T6 + 1 
.s65:
1699 : a5 53 __ LDA T6 + 0 
169b : 29 07 __ AND #$07
169d : d0 0d __ BNE $16ac ; (bmu_bitblit.s25 + 0)
.s26:
169f : 18 __ __ CLC
16a0 : a5 53 __ LDA T6 + 0 
16a2 : 65 43 __ ADC T0 + 0 
16a4 : 85 53 __ STA T6 + 0 
16a6 : a5 54 __ LDA T6 + 1 
16a8 : 65 44 __ ADC T0 + 1 
16aa : 85 54 __ STA T6 + 1 
.s25:
16ac : c6 45 __ DEC T1 + 0 
16ae : d0 aa __ BNE $165a ; (bmu_bitblit.l23 + 0)
16b0 : 4c 53 15 JMP $1553 ; (bmu_bitblit.s3 + 0)
.s36:
16b3 : 18 __ __ CLC
16b4 : a5 11 __ LDA P4 
16b6 : 69 e1 __ ADC #$e1
16b8 : 2a __ __ ROL
16b9 : 2a __ __ ROL
16ba : 2a __ __ ROL
16bb : a8 __ __ TAY
16bc : 29 f8 __ AND #$f8
16be : 85 45 __ STA T1 + 0 
16c0 : 98 __ __ TYA
16c1 : 29 07 __ AND #$07
16c3 : 2a __ __ ROL
16c4 : 69 f8 __ ADC #$f8
16c6 : 85 46 __ STA T1 + 1 
16c8 : 18 __ __ CLC
16c9 : a5 53 __ LDA T6 + 0 
16cb : 65 45 __ ADC T1 + 0 
16cd : 85 53 __ STA T6 + 0 
16cf : a5 54 __ LDA T6 + 1 
16d1 : 65 46 __ ADC T1 + 1 
16d3 : 85 54 __ STA T6 + 1 
16d5 : a5 13 __ LDA P6 
16d7 : 85 12 __ STA P5 
16d9 : a5 4c __ LDA T10 + 0 
16db : 85 13 __ STA P6 
16dd : 18 __ __ CLC
16de : a5 49 __ LDA T4 + 0 
16e0 : 65 45 __ ADC T1 + 0 
16e2 : 85 50 __ STA T5 + 0 
16e4 : 8a __ __ TXA
16e5 : 65 46 __ ADC T1 + 1 
16e7 : 85 51 __ STA T5 + 1 
16e9 : 24 43 __ BIT T0 + 0 
16eb : 30 03 __ BMI $16f0 ; (bmu_bitblit.s37 + 0)
16ed : 4c db 14 JMP $14db ; (bmu_bitblit.s8 + 0)
.s37:
16f0 : 18 __ __ CLC
16f1 : a5 50 __ LDA T5 + 0 
16f3 : 69 08 __ ADC #$08
16f5 : 85 50 __ STA T5 + 0 
16f7 : 90 f4 __ BCC $16ed ; (bmu_bitblit.s36 + 58)
.s57:
16f9 : e6 51 __ INC T5 + 1 
16fb : 4c db 14 JMP $14db ; (bmu_bitblit.s8 + 0)
--------------------------------------------------------------------
builddop: ; builddop(u8,u8,u8,u8,enum BlitOp,bool)->void
;1015, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
16fe : a5 15 __ LDA P8 ; (reverse + 0)
1700 : f0 16 __ BEQ $1718 ; (builddop.s5 + 0)
.s48:
1702 : a9 38 __ LDA #$38
1704 : 85 48 __ STA T9 + 0 
1706 : a9 e1 __ LDA #$e1
1708 : 85 49 __ STA T10 + 0 
170a : a9 b0 __ LDA #$b0
170c : 85 4a __ STA T11 + 0 
170e : a9 c2 __ LDA #$c2
1710 : 85 4b __ STA T12 + 0 
1712 : a9 f8 __ LDA #$f8
1714 : 85 44 __ STA T3 + 0 
1716 : d0 16 __ BNE $172e ; (builddop.s6 + 0)
.s5:
1718 : a9 18 __ LDA #$18
171a : 85 48 __ STA T9 + 0 
171c : a9 61 __ LDA #$61
171e : 85 49 __ STA T10 + 0 
1720 : a9 90 __ LDA #$90
1722 : 85 4a __ STA T11 + 0 
1724 : a9 e2 __ LDA #$e2
1726 : 85 4b __ STA T12 + 0 
1728 : a9 00 __ LDA #$00
172a : 85 44 __ STA T3 + 0 
172c : a9 08 __ LDA #$08
.s6:
172e : 85 47 __ STA T6 + 0 
1730 : a5 14 __ LDA P7 ; (op + 0)
1732 : 29 08 __ AND #$08
1734 : 85 45 __ STA T4 + 0 
1736 : a5 14 __ LDA P7 ; (op + 0)
1738 : 29 10 __ AND #$10
173a : 85 46 __ STA T5 + 0 
173c : a5 11 __ LDA P4 ; (w + 0)
173e : d0 06 __ BNE $1746 ; (builddop.s8 + 0)
.s7:
1740 : a5 13 __ LDA P6 ; (rmask + 0)
1742 : 25 12 __ AND P5 ; (lmask + 0)
1744 : 85 12 __ STA P5 ; (lmask + 0)
.s8:
1746 : a9 a0 __ LDA #$a0
1748 : 8d 00 21 STA $2100 ; (BLIT_CODE[0] + 0)
174b : a5 44 __ LDA T3 + 0 
174d : 8d 01 21 STA $2101 ; (BLIT_CODE[0] + 1)
1750 : a9 02 __ LDA #$02
1752 : 85 43 __ STA T0 + 0 
1754 : a6 12 __ LDX P5 ; (lmask + 0)
1756 : e8 __ __ INX
1757 : d0 03 __ BNE $175c ; (builddop.s9 + 0)
1759 : 4c 8f 19 JMP $198f ; (builddop.s44 + 0)
.s9:
175c : a5 46 __ LDA T5 + 0 
175e : f0 18 __ BEQ $1778 ; (builddop.s10 + 0)
.s43:
1760 : a9 b1 __ LDA #$b1
1762 : 8d 02 21 STA $2102 ; (BLIT_CODE[0] + 2)
1765 : a9 05 __ LDA #$05
1767 : 8d 03 21 STA $2103 ; (BLIT_CODE[0] + 3)
176a : a9 85 __ LDA #$85
176c : 8d 04 21 STA $2104 ; (BLIT_CODE[0] + 4)
176f : a9 0a __ LDA #$0a
1771 : 8d 05 21 STA $2105 ; (BLIT_CODE[0] + 5)
1774 : a9 06 __ LDA #$06
1776 : 85 43 __ STA T0 + 0 
.s10:
1778 : a5 45 __ LDA T4 + 0 
177a : d0 05 __ BNE $1781 ; (builddop.s40 + 0)
.s11:
177c : a5 43 __ LDA T0 + 0 
177e : 4c e2 17 JMP $17e2 ; (builddop.s52 + 0)
.s40:
1781 : a5 10 __ LDA P3 ; (shift + 0)
1783 : 85 0e __ STA P1 
1785 : d0 05 __ BNE $178c ; (builddop.s42 + 0)
.s41:
1787 : a5 43 __ LDA T0 + 0 
1789 : 4c d9 17 JMP $17d9 ; (builddop.s51 + 0)
.s42:
178c : a9 b1 __ LDA #$b1
178e : a6 43 __ LDX T0 + 0 
1790 : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
1793 : a9 03 __ LDA #$03
1795 : 9d 01 21 STA $2101,x ; (BLIT_CODE[0] + 1)
1798 : 9d 06 21 STA $2106,x ; (BLIT_CODE[0] + 6)
179b : 9d 0a 21 STA $210a,x ; (BLIT_CODE[0] + 10)
179e : a9 85 __ LDA #$85
17a0 : 9d 02 21 STA $2102,x ; (BLIT_CODE[0] + 2)
17a3 : 9d 09 21 STA $2109,x ; (BLIT_CODE[0] + 9)
17a6 : a9 08 __ LDA #$08
17a8 : 9d 03 21 STA $2103,x ; (BLIT_CODE[0] + 3)
17ab : 9d 08 21 STA $2108,x ; (BLIT_CODE[0] + 8)
17ae : a9 a5 __ LDA #$a5
17b0 : 9d 05 21 STA $2105,x ; (BLIT_CODE[0] + 5)
17b3 : a9 02 __ LDA #$02
17b5 : 9d 0c 21 STA $210c,x ; (BLIT_CODE[0] + 12)
17b8 : a9 04 __ LDA #$04
17ba : 9d 0e 21 STA $210e,x ; (BLIT_CODE[0] + 14)
17bd : a5 48 __ LDA T9 + 0 
17bf : 9d 04 21 STA $2104,x ; (BLIT_CODE[0] + 4)
17c2 : a5 49 __ LDA T10 + 0 
17c4 : 09 08 __ ORA #$08
17c6 : 9d 07 21 STA $2107,x ; (BLIT_CODE[0] + 7)
17c9 : a5 4a __ LDA T11 + 0 
17cb : 9d 0b 21 STA $210b,x ; (BLIT_CODE[0] + 11)
17ce : a5 4b __ LDA T12 + 0 
17d0 : 09 04 __ ORA #$04
17d2 : 9d 0d 21 STA $210d,x ; (BLIT_CODE[0] + 13)
17d5 : 8a __ __ TXA
17d6 : 18 __ __ CLC
17d7 : 69 0f __ ADC #$0f
.s51:
17d9 : 85 0d __ STA P0 
17db : a5 15 __ LDA P8 ; (reverse + 0)
17dd : 85 0f __ STA P2 
17df : 20 f0 19 JSR $19f0 ; (builddop_src.s4 + 0)
.s52:
17e2 : 85 0d __ STA P0 
17e4 : a5 14 __ LDA P7 ; (op + 0)
17e6 : 85 0e __ STA P1 
17e8 : a5 12 __ LDA P5 ; (lmask + 0)
17ea : 49 ff __ EOR #$ff
17ec : 85 0f __ STA P2 
17ee : 20 30 1b JSR $1b30 ; (builddop_op.s4 + 0)
17f1 : 85 43 __ STA T0 + 0 
17f3 : a5 11 __ LDA P4 ; (w + 0)
17f5 : f0 68 __ BEQ $185f ; (builddop.s12 + 0)
.s13:
17f7 : a9 a0 __ LDA #$a0
17f9 : a6 43 __ LDX T0 + 0 
17fb : e8 __ __ INX
17fc : e8 __ __ INX
17fd : 86 43 __ STX T0 + 0 
17ff : 86 0d __ STX P0 
1801 : 9d fe 20 STA $20fe,x 
1804 : 18 __ __ CLC
1805 : a5 47 __ LDA T6 + 0 
1807 : 65 44 __ ADC T3 + 0 
1809 : 85 44 __ STA T3 + 0 
180b : 9d ff 20 STA $20ff,x 
.s14:
180e : a5 11 __ LDA P4 ; (w + 0)
1810 : c9 02 __ CMP #$02
1812 : b0 53 __ BCS $1867 ; (builddop.s21 + 0)
.s15:
1814 : a5 13 __ LDA P6 ; (rmask + 0)
1816 : f0 47 __ BEQ $185f ; (builddop.s12 + 0)
.s16:
1818 : a5 46 __ LDA T5 + 0 
181a : f0 1e __ BEQ $183a ; (builddop.s17 + 0)
.s20:
181c : a9 b1 __ LDA #$b1
181e : a6 43 __ LDX T0 + 0 
1820 : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
1823 : a9 05 __ LDA #$05
1825 : 9d 01 21 STA $2101,x ; (BLIT_CODE[0] + 1)
1828 : a9 85 __ LDA #$85
182a : 9d 02 21 STA $2102,x ; (BLIT_CODE[0] + 2)
182d : a9 0a __ LDA #$0a
182f : 9d 03 21 STA $2103,x ; (BLIT_CODE[0] + 3)
1832 : 8a __ __ TXA
1833 : 18 __ __ CLC
1834 : 69 04 __ ADC #$04
1836 : 85 43 __ STA T0 + 0 
1838 : 85 0d __ STA P0 
.s17:
183a : a5 45 __ LDA T4 + 0 
183c : d0 05 __ BNE $1843 ; (builddop.s19 + 0)
.s18:
183e : a5 43 __ LDA T0 + 0 
1840 : 4c 4e 18 JMP $184e ; (builddop.s50 + 0)
.s19:
1843 : a5 10 __ LDA P3 ; (shift + 0)
1845 : 85 0e __ STA P1 
1847 : a5 15 __ LDA P8 ; (reverse + 0)
1849 : 85 0f __ STA P2 
184b : 20 f0 19 JSR $19f0 ; (builddop_src.s4 + 0)
.s50:
184e : 85 0d __ STA P0 
1850 : a5 14 __ LDA P7 ; (op + 0)
1852 : 85 0e __ STA P1 
1854 : a5 13 __ LDA P6 ; (rmask + 0)
1856 : 49 ff __ EOR #$ff
1858 : 85 0f __ STA P2 
185a : 20 30 1b JSR $1b30 ; (builddop_op.s4 + 0)
185d : 85 43 __ STA T0 + 0 
.s12:
185f : a9 60 __ LDA #$60
1861 : a6 43 __ LDX T0 + 0 
1863 : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
.s3:
1866 : 60 __ __ RTS
.s21:
1867 : a9 02 __ LDA #$02
1869 : c5 11 __ CMP P4 ; (w + 0)
186b : a9 00 __ LDA #$00
186d : 6a __ __ ROR
186e : 85 4c __ STA T14 + 0 
1870 : d0 19 __ BNE $188b ; (builddop.s22 + 0)
.s39:
1872 : a9 a2 __ LDA #$a2
1874 : a6 43 __ LDX T0 + 0 
1876 : e8 __ __ INX
1877 : e8 __ __ INX
1878 : 86 43 __ STX T0 + 0 
187a : 9d fe 20 STA $20fe,x 
187d : 38 __ __ SEC
187e : a5 11 __ LDA P4 ; (w + 0)
1880 : e9 01 __ SBC #$01
1882 : 9d ff 20 STA $20ff,x 
1885 : a5 11 __ LDA P4 ; (w + 0)
1887 : c9 20 __ CMP #$20
1889 : b0 0d __ BCS $1898 ; (builddop.s24 + 0)
.s22:
188b : a5 10 __ LDA P3 ; (shift + 0)
188d : d0 09 __ BNE $1898 ; (builddop.s24 + 0)
.s23:
188f : a5 48 __ LDA T9 + 0 
1891 : a6 43 __ LDX T0 + 0 
1893 : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
1896 : e6 43 __ INC T0 + 0 
.s24:
1898 : a6 43 __ LDX T0 + 0 
189a : 86 4d __ STX T15 + 0 
189c : a5 46 __ LDA T5 + 0 
189e : f0 1a __ BEQ $18ba ; (builddop.s25 + 0)
.s38:
18a0 : a9 b1 __ LDA #$b1
18a2 : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
18a5 : a9 05 __ LDA #$05
18a7 : 9d 01 21 STA $2101,x ; (BLIT_CODE[0] + 1)
18aa : a9 85 __ LDA #$85
18ac : 9d 02 21 STA $2102,x ; (BLIT_CODE[0] + 2)
18af : a9 0a __ LDA #$0a
18b1 : 9d 03 21 STA $2103,x ; (BLIT_CODE[0] + 3)
18b4 : 8a __ __ TXA
18b5 : 18 __ __ CLC
18b6 : 69 04 __ ADC #$04
18b8 : 85 43 __ STA T0 + 0 
.s25:
18ba : a5 45 __ LDA T4 + 0 
18bc : d0 05 __ BNE $18c3 ; (builddop.s37 + 0)
.s26:
18be : a5 43 __ LDA T0 + 0 
18c0 : 4c d2 18 JMP $18d2 ; (builddop.s49 + 0)
.s37:
18c3 : a5 43 __ LDA T0 + 0 
18c5 : 85 0d __ STA P0 
18c7 : a5 10 __ LDA P3 ; (shift + 0)
18c9 : 85 0e __ STA P1 
18cb : a5 15 __ LDA P8 ; (reverse + 0)
18cd : 85 0f __ STA P2 
18cf : 20 f0 19 JSR $19f0 ; (builddop_src.s4 + 0)
.s49:
18d2 : 85 0d __ STA P0 
18d4 : a5 14 __ LDA P7 ; (op + 0)
18d6 : 85 0e __ STA P1 
18d8 : a9 00 __ LDA #$00
18da : 85 0f __ STA P2 
18dc : 20 30 1b JSR $1b30 ; (builddop_op.s4 + 0)
18df : 24 4c __ BIT T14 + 0 
18e1 : 10 17 __ BPL $18fa ; (builddop.s28 + 0)
.s27:
18e3 : aa __ __ TAX
18e4 : e8 __ __ INX
18e5 : e8 __ __ INX
18e6 : 86 43 __ STX T0 + 0 
18e8 : 86 0d __ STX P0 
18ea : a9 a0 __ LDA #$a0
18ec : 9d fe 20 STA $20fe,x 
18ef : 18 __ __ CLC
18f0 : a5 47 __ LDA T6 + 0 
18f2 : 65 44 __ ADC T3 + 0 
18f4 : 9d ff 20 STA $20ff,x 
18f7 : 4c 14 18 JMP $1814 ; (builddop.s15 + 0)
.s28:
18fa : a8 __ __ TAY
18fb : a9 1f __ LDA #$1f
18fd : c5 11 __ CMP P4 ; (w + 0)
18ff : a9 00 __ LDA #$00
1901 : 6a __ __ ROR
1902 : 85 47 __ STA T6 + 0 
1904 : f0 04 __ BEQ $190a ; (builddop.s36 + 0)
.s29:
1906 : a5 10 __ LDA P3 ; (shift + 0)
1908 : f0 06 __ BEQ $1910 ; (builddop.s30 + 0)
.s36:
190a : a5 48 __ LDA T9 + 0 
190c : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
190f : c8 __ __ INY
.s30:
1910 : a9 98 __ LDA #$98
1912 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1915 : a9 08 __ LDA #$08
1917 : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
191a : a9 a8 __ LDA #$a8
191c : 99 03 21 STA $2103,y ; (BLIT_CODE[0] + 3)
191f : a5 49 __ LDA T10 + 0 
1921 : 09 08 __ ORA #$08
1923 : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1926 : 98 __ __ TYA
1927 : 18 __ __ CLC
1928 : 69 04 __ ADC #$04
192a : 85 43 __ STA T0 + 0 
192c : 24 47 __ BIT T6 + 0 
192e : 30 3a __ BMI $196a ; (builddop.s31 + 0)
.s32:
1930 : a5 4a __ LDA T11 + 0 
1932 : 99 04 21 STA $2104,y ; (BLIT_CODE[0] + 4)
1935 : a5 4b __ LDA T12 + 0 
1937 : 09 04 __ ORA #$04
1939 : aa __ __ TAX
193a : a5 45 __ LDA T4 + 0 
193c : d0 0d __ BNE $194b ; (builddop.s35 + 0)
.s33:
193e : a9 02 __ LDA #$02
1940 : 99 05 21 STA $2105,y ; (BLIT_CODE[0] + 5)
1943 : 18 __ __ CLC
1944 : a5 43 __ LDA T0 + 0 
1946 : 69 02 __ ADC #$02
1948 : 4c 5c 19 JMP $195c ; (builddop.s34 + 0)
.s35:
194b : a9 04 __ LDA #$04
194d : 99 05 21 STA $2105,y ; (BLIT_CODE[0] + 5)
1950 : 99 07 21 STA $2107,y ; (BLIT_CODE[0] + 7)
1953 : 8a __ __ TXA
1954 : 99 06 21 STA $2106,y ; (BLIT_CODE[0] + 6)
1957 : 18 __ __ CLC
1958 : a5 43 __ LDA T0 + 0 
195a : 69 04 __ ADC #$04
.s34:
195c : a8 __ __ TAY
195d : c8 __ __ INY
195e : c8 __ __ INY
195f : 84 43 __ STY T0 + 0 
1961 : 8a __ __ TXA
1962 : 99 fe 20 STA $20fe,y 
1965 : a9 06 __ LDA #$06
1967 : 99 ff 20 STA $20ff,y 
.s31:
196a : a9 ca __ LDA #$ca
196c : a4 43 __ LDY T0 + 0 
196e : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1971 : a9 d0 __ LDA #$d0
1973 : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1976 : 98 __ __ TYA
1977 : 18 __ __ CLC
1978 : 69 01 __ ADC #$01
197a : aa __ __ TAX
197b : e8 __ __ INX
197c : e8 __ __ INX
197d : 86 43 __ STX T0 + 0 
197f : 86 0d __ STX P0 
1981 : 49 ff __ EOR #$ff
1983 : 38 __ __ SEC
1984 : 65 4d __ ADC T15 + 0 
1986 : 38 __ __ SEC
1987 : e9 02 __ SBC #$02
1989 : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
198c : 4c 14 18 JMP $1814 ; (builddop.s15 + 0)
.s44:
198f : 85 0d __ STA P0 
1991 : a5 45 __ LDA T4 + 0 
1993 : f0 51 __ BEQ $19e6 ; (builddop.s45 + 0)
.s46:
1995 : a5 10 __ LDA P3 ; (shift + 0)
1997 : f0 4d __ BEQ $19e6 ; (builddop.s45 + 0)
.s47:
1999 : a9 03 __ LDA #$03
199b : 8d 03 21 STA $2103 ; (BLIT_CODE[0] + 3)
199e : 8d 08 21 STA $2108 ; (BLIT_CODE[0] + 8)
19a1 : 8d 0c 21 STA $210c ; (BLIT_CODE[0] + 12)
19a4 : a9 b1 __ LDA #$b1
19a6 : 8d 02 21 STA $2102 ; (BLIT_CODE[0] + 2)
19a9 : a9 85 __ LDA #$85
19ab : 8d 04 21 STA $2104 ; (BLIT_CODE[0] + 4)
19ae : 8d 0b 21 STA $210b ; (BLIT_CODE[0] + 11)
19b1 : a9 08 __ LDA #$08
19b3 : 8d 05 21 STA $2105 ; (BLIT_CODE[0] + 5)
19b6 : 8d 0a 21 STA $210a ; (BLIT_CODE[0] + 10)
19b9 : a9 a5 __ LDA #$a5
19bb : 8d 07 21 STA $2107 ; (BLIT_CODE[0] + 7)
19be : a9 02 __ LDA #$02
19c0 : 8d 0e 21 STA $210e ; (BLIT_CODE[0] + 14)
19c3 : a9 04 __ LDA #$04
19c5 : 8d 10 21 STA $2110 ; (BLIT_CODE[0] + 16)
19c8 : a5 48 __ LDA T9 + 0 
19ca : 8d 06 21 STA $2106 ; (BLIT_CODE[0] + 6)
19cd : a5 49 __ LDA T10 + 0 
19cf : 09 08 __ ORA #$08
19d1 : 8d 09 21 STA $2109 ; (BLIT_CODE[0] + 9)
19d4 : a5 4a __ LDA T11 + 0 
19d6 : 8d 0d 21 STA $210d ; (BLIT_CODE[0] + 13)
19d9 : a5 4b __ LDA T12 + 0 
19db : 09 04 __ ORA #$04
19dd : 8d 0f 21 STA $210f ; (BLIT_CODE[0] + 15)
19e0 : a9 11 __ LDA #$11
19e2 : 85 43 __ STA T0 + 0 
19e4 : 85 0d __ STA P0 
.s45:
19e6 : e6 11 __ INC P4 ; (w + 0)
19e8 : d0 03 __ BNE $19ed ; (builddop.s45 + 7)
19ea : 4c 5f 18 JMP $185f ; (builddop.s12 + 0)
19ed : 4c 0e 18 JMP $180e ; (builddop.s14 + 0)
--------------------------------------------------------------------
builddop_src: ; builddop_src(u8,u8,bool)->u8
; 888, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
19f0 : a6 0d __ LDX P0 ; (ip + 0)
19f2 : e8 __ __ INX
19f3 : a4 0d __ LDY P0 ; (ip + 0)
19f5 : e8 __ __ INX
19f6 : a5 0e __ LDA P1 ; (shift + 0)
19f8 : d0 0c __ BNE $1a06 ; (builddop_src.s6 + 0)
.s5:
19fa : a9 b1 __ LDA #$b1
19fc : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
19ff : a9 03 __ LDA #$03
1a01 : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1a04 : 8a __ __ TXA
.s3:
1a05 : 60 __ __ RTS
.s6:
1a06 : a9 a5 __ LDA #$a5
1a08 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1a0b : a9 08 __ LDA #$08
1a0d : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1a10 : a5 0f __ LDA P2 ; (reverse + 0)
1a12 : f0 03 __ BEQ $1a17 ; (builddop_src.s7 + 0)
1a14 : 4c 22 1b JMP $1b22 ; (builddop_src.s26 + 0)
.s7:
1a17 : a5 0e __ LDA P1 ; (shift + 0)
1a19 : c9 05 __ CMP #$05
1a1b : b0 06 __ BCS $1a23 ; (builddop_src.s8 + 0)
.s24:
1a1d : a9 4a __ LDA #$4a
.s25:
1a1f : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1a22 : e8 __ __ INX
.s8:
1a23 : a9 85 __ LDA #$85
1a25 : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
1a28 : 9d 04 21 STA $2104,x ; (BLIT_CODE[0] + 4)
1a2b : a9 09 __ LDA #$09
1a2d : 9d 01 21 STA $2101,x ; (BLIT_CODE[0] + 1)
1a30 : a9 b1 __ LDA #$b1
1a32 : 9d 02 21 STA $2102,x ; (BLIT_CODE[0] + 2)
1a35 : a9 03 __ LDA #$03
1a37 : 9d 03 21 STA $2103,x ; (BLIT_CODE[0] + 3)
1a3a : a9 08 __ LDA #$08
1a3c : 9d 05 21 STA $2105,x ; (BLIT_CODE[0] + 5)
1a3f : 8a __ __ TXA
1a40 : 18 __ __ CLC
1a41 : 69 06 __ ADC #$06
1a43 : 85 1b __ STA ACCU + 0 
1a45 : a8 __ __ TAY
1a46 : a5 0f __ LDA P2 ; (reverse + 0)
1a48 : d0 72 __ BNE $1abc ; (builddop_src.s17 + 0)
.s9:
1a4a : a5 0e __ LDA P1 ; (shift + 0)
1a4c : c9 05 __ CMP #$05
1a4e : 90 0b __ BCC $1a5b ; (builddop_src.s10 + 0)
.s13:
1a50 : a9 0a __ LDA #$0a
1a52 : 9d 06 21 STA $2106,x ; (BLIT_CODE[0] + 6)
1a55 : e6 1b __ INC ACCU + 0 
1a57 : a6 0e __ LDX P1 ; (shift + 0)
1a59 : b0 25 __ BCS $1a80 ; (builddop_src.l14 + 0)
.s10:
1a5b : c9 02 __ CMP #$02
1a5d : 90 19 __ BCC $1a78 ; (builddop_src.s11 + 0)
.s12:
1a5f : c6 0e __ DEC P1 ; (shift + 0)
1a61 : a6 0e __ LDX P1 ; (shift + 0)
.l29:
1a63 : a9 6a __ LDA #$6a
1a65 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1a68 : a9 46 __ LDA #$46
1a6a : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1a6d : a9 09 __ LDA #$09
1a6f : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1a72 : c8 __ __ INY
1a73 : c8 __ __ INY
1a74 : c8 __ __ INY
1a75 : ca __ __ DEX
1a76 : d0 eb __ BNE $1a63 ; (builddop_src.l29 + 0)
.s11:
1a78 : a9 6a __ LDA #$6a
.s30:
1a7a : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1a7d : c8 __ __ INY
1a7e : 98 __ __ TYA
1a7f : 60 __ __ RTS
.l14:
1a80 : a5 1b __ LDA ACCU + 0 
1a82 : 85 1d __ STA ACCU + 2 
1a84 : 85 1c __ STA ACCU + 1 
1a86 : a8 __ __ TAY
1a87 : 18 __ __ CLC
1a88 : 69 03 __ ADC #$03
1a8a : 85 1b __ STA ACCU + 0 
1a8c : e0 07 __ CPX #$07
1a8e : b0 16 __ BCS $1aa6 ; (builddop_src.s15 + 0)
.s16:
1a90 : a9 26 __ LDA #$26
1a92 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1a95 : a9 09 __ LDA #$09
1a97 : a4 1d __ LDY ACCU + 2 
1a99 : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1a9c : a9 0a __ LDA #$0a
1a9e : a4 1c __ LDY ACCU + 1 
1aa0 : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1aa3 : e8 __ __ INX
1aa4 : 90 da __ BCC $1a80 ; (builddop_src.l14 + 0)
.s15:
1aa6 : a9 a5 __ LDA #$a5
1aa8 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1aab : a9 09 __ LDA #$09
1aad : a6 1d __ LDX ACCU + 2 
1aaf : 9d 01 21 STA $2101,x ; (BLIT_CODE[0] + 1)
1ab2 : a9 2a __ LDA #$2a
1ab4 : a6 1c __ LDX ACCU + 1 
1ab6 : 9d 02 21 STA $2102,x ; (BLIT_CODE[0] + 2)
1ab9 : a5 1b __ LDA ACCU + 0 
1abb : 60 __ __ RTS
.s17:
1abc : a5 0e __ LDA P1 ; (shift + 0)
1abe : c9 05 __ CMP #$05
1ac0 : b0 3e __ BCS $1b00 ; (builddop_src.s21 + 0)
.s18:
1ac2 : a9 4a __ LDA #$4a
1ac4 : 9d 06 21 STA $2106,x ; (BLIT_CODE[0] + 6)
1ac7 : e6 1b __ INC ACCU + 0 
1ac9 : a6 0e __ LDX P1 ; (shift + 0)
1acb : e0 02 __ CPX #$02
1acd : 90 1b __ BCC $1aea ; (builddop_src.s19 + 0)
.s20:
1acf : a4 1b __ LDY ACCU + 0 
.l28:
1ad1 : a9 66 __ LDA #$66
1ad3 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1ad6 : a9 09 __ LDA #$09
1ad8 : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1adb : a9 4a __ LDA #$4a
1add : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1ae0 : 98 __ __ TYA
1ae1 : 18 __ __ CLC
1ae2 : 69 03 __ ADC #$03
1ae4 : a8 __ __ TAY
1ae5 : ca __ __ DEX
1ae6 : d0 e9 __ BNE $1ad1 ; (builddop_src.l28 + 0)
.s31:
1ae8 : 85 1b __ STA ACCU + 0 
.s19:
1aea : a9 a5 __ LDA #$a5
1aec : a6 1b __ LDX ACCU + 0 
1aee : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
1af1 : a9 09 __ LDA #$09
1af3 : 9d 01 21 STA $2101,x ; (BLIT_CODE[0] + 1)
1af6 : a9 6a __ LDA #$6a
1af8 : 9d 02 21 STA $2102,x ; (BLIT_CODE[0] + 2)
1afb : 8a __ __ TXA
1afc : 18 __ __ CLC
1afd : 69 03 __ ADC #$03
1aff : 60 __ __ RTS
.s21:
1b00 : c9 07 __ CMP #$07
1b02 : b0 19 __ BCS $1b1d ; (builddop_src.s22 + 0)
.s23:
1b04 : aa __ __ TAX
.l32:
1b05 : a9 2a __ LDA #$2a
1b07 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1b0a : a9 06 __ LDA #$06
1b0c : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1b0f : a9 09 __ LDA #$09
1b11 : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1b14 : 98 __ __ TYA
1b15 : 69 03 __ ADC #$03
1b17 : e8 __ __ INX
1b18 : e0 07 __ CPX #$07
1b1a : a8 __ __ TAY
1b1b : 90 e8 __ BCC $1b05 ; (builddop_src.l32 + 0)
.s22:
1b1d : a9 2a __ LDA #$2a
1b1f : 4c 7a 1a JMP $1a7a ; (builddop_src.s30 + 0)
.s26:
1b22 : a5 0e __ LDA P1 ; (shift + 0)
1b24 : c9 05 __ CMP #$05
1b26 : b0 03 __ BCS $1b2b ; (builddop_src.s27 + 0)
1b28 : 4c 23 1a JMP $1a23 ; (builddop_src.s8 + 0)
.s27:
1b2b : a9 0a __ LDA #$0a
1b2d : 4c 1f 1a JMP $1a1f ; (builddop_src.s25 + 0)
--------------------------------------------------------------------
builddop_op: ; builddop_op(u8,enum BlitOp,u8)->u8
; 965, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.c"
.s4:
1b30 : a5 0e __ LDA P1 ; (op + 0)
1b32 : 29 20 __ AND #$20
1b34 : f0 04 __ BEQ $1b3a ; (builddop_op.s27 + 0)
.s28:
1b36 : a9 07 __ LDA #$07
1b38 : d0 02 __ BNE $1b3c ; (builddop_op.s29 + 0)
.s27:
1b3a : a9 0a __ LDA #$0a
.s29:
1b3c : 85 1c __ STA ACCU + 1 
1b3e : a5 0e __ LDA P1 ; (op + 0)
1b40 : 29 03 __ AND #$03
1b42 : 85 1b __ STA ACCU + 0 
1b44 : a5 0e __ LDA P1 ; (op + 0)
1b46 : 29 04 __ AND #$04
1b48 : f0 03 __ BEQ $1b4d ; (builddop_op.s5 + 0)
1b4a : 4c e0 1b JMP $1be0 ; (builddop_op.s18 + 0)
.s5:
1b4d : a5 0e __ LDA P1 ; (op + 0)
1b4f : 29 08 __ AND #$08
1b51 : d0 13 __ BNE $1b66 ; (builddop_op.s15 + 0)
.s6:
1b53 : a9 a5 __ LDA #$a5
1b55 : a4 0d __ LDY P0 ; (ip + 0)
1b57 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1b5a : a5 1c __ LDA ACCU + 1 
.s7:
1b5c : c8 __ __ INY
1b5d : c8 __ __ INY
1b5e : 84 0d __ STY P0 ; (ip + 0)
1b60 : 99 ff 20 STA $20ff,y 
1b63 : 4c 76 1b JMP $1b76 ; (builddop_op.s16 + 0)
.s15:
1b66 : a5 0e __ LDA P1 ; (op + 0)
1b68 : 0a __ __ ASL
1b69 : 10 0b __ BPL $1b76 ; (builddop_op.s16 + 0)
.s17:
1b6b : a9 49 __ LDA #$49
1b6d : a4 0d __ LDY P0 ; (ip + 0)
1b6f : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1b72 : a9 ff __ LDA #$ff
1b74 : d0 e6 __ BNE $1b5c ; (builddop_op.s7 + 0)
.s16:
1b76 : a6 1b __ LDX ACCU + 0 
1b78 : f0 13 __ BEQ $1b8d ; (builddop_op.s8 + 0)
.s14:
1b7a : a5 1c __ LDA ACCU + 1 
1b7c : a4 0d __ LDY P0 ; (ip + 0)
1b7e : c8 __ __ INY
1b7f : c8 __ __ INY
1b80 : 84 0d __ STY P0 ; (ip + 0)
1b82 : 99 ff 20 STA $20ff,y 
1b85 : bd f5 1f LDA $1ff5,x ; (blitops_op[0] + 0)
1b88 : 09 04 __ ORA #$04
1b8a : 99 fe 20 STA $20fe,y 
.s8:
1b8d : a5 0f __ LDA P2 ; (mask + 0)
1b8f : f0 3f __ BEQ $1bd0 ; (builddop_op.s9 + 0)
.s10:
1b91 : a9 85 __ LDA #$85
1b93 : a4 0d __ LDY P0 ; (ip + 0)
1b95 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1b98 : a9 09 __ LDA #$09
1b9a : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1b9d : 98 __ __ TYA
1b9e : 18 __ __ CLC
1b9f : 69 08 __ ADC #$08
1ba1 : 85 0d __ STA P0 ; (ip + 0)
1ba3 : a5 0e __ LDA P1 ; (op + 0)
1ba5 : 29 10 __ AND #$10
1ba7 : f0 09 __ BEQ $1bb2 ; (builddop_op.s11 + 0)
.s13:
1ba9 : a9 45 __ LDA #$45
1bab : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1bae : a9 0a __ LDA #$0a
1bb0 : d0 07 __ BNE $1bb9 ; (builddop_op.s12 + 0)
.s11:
1bb2 : a9 51 __ LDA #$51
1bb4 : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1bb7 : a9 05 __ LDA #$05
.s12:
1bb9 : 99 03 21 STA $2103,y ; (BLIT_CODE[0] + 3)
1bbc : a9 29 __ LDA #$29
1bbe : 99 04 21 STA $2104,y ; (BLIT_CODE[0] + 4)
1bc1 : a5 0f __ LDA P2 ; (mask + 0)
1bc3 : 99 05 21 STA $2105,y ; (BLIT_CODE[0] + 5)
1bc6 : a9 45 __ LDA #$45
1bc8 : 99 06 21 STA $2106,y ; (BLIT_CODE[0] + 6)
1bcb : a9 09 __ LDA #$09
1bcd : 99 07 21 STA $2107,y ; (BLIT_CODE[0] + 7)
.s9:
1bd0 : a9 91 __ LDA #$91
1bd2 : a6 0d __ LDX P0 ; (ip + 0)
1bd4 : 9d 00 21 STA $2100,x ; (BLIT_CODE[0] + 0)
1bd7 : a9 05 __ LDA #$05
1bd9 : 9d 01 21 STA $2101,x ; (BLIT_CODE[0] + 1)
1bdc : e8 __ __ INX
1bdd : e8 __ __ INX
1bde : 8a __ __ TXA
.s3:
1bdf : 60 __ __ RTS
.s18:
1be0 : a5 1b __ LDA ACCU + 0 
1be2 : d0 04 __ BNE $1be8 ; (builddop_op.s20 + 0)
.s19:
1be4 : a5 0f __ LDA P2 ; (mask + 0)
1be6 : d0 14 __ BNE $1bfc ; (builddop_op.s23 + 0)
.s20:
1be8 : a5 0e __ LDA P1 ; (op + 0)
1bea : 29 40 __ AND #$40
1bec : f0 02 __ BEQ $1bf0 ; (builddop_op.s21 + 0)
.s22:
1bee : a9 ff __ LDA #$ff
.s21:
1bf0 : aa __ __ TAX
1bf1 : a9 a9 __ LDA #$a9
1bf3 : a4 0d __ LDY P0 ; (ip + 0)
1bf5 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1bf8 : 8a __ __ TXA
1bf9 : 4c 5c 1b JMP $1b5c ; (builddop_op.s7 + 0)
.s23:
1bfc : a9 b1 __ LDA #$b1
1bfe : a4 0d __ LDY P0 ; (ip + 0)
1c00 : 99 00 21 STA $2100,y ; (BLIT_CODE[0] + 0)
1c03 : a9 05 __ LDA #$05
1c05 : 99 01 21 STA $2101,y ; (BLIT_CODE[0] + 1)
1c08 : 06 0e __ ASL P1 ; (op + 0)
1c0a : 30 0a __ BMI $1c16 ; (builddop_op.s26 + 0)
.s24:
1c0c : a9 29 __ LDA #$29
1c0e : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1c11 : a5 0f __ LDA P2 ; (mask + 0)
1c13 : 4c 1f 1c JMP $1c1f ; (builddop_op.s25 + 0)
.s26:
1c16 : a9 09 __ LDA #$09
1c18 : 99 02 21 STA $2102,y ; (BLIT_CODE[0] + 2)
1c1b : a5 0f __ LDA P2 ; (mask + 0)
1c1d : 49 ff __ EOR #$ff
.s25:
1c1f : 99 03 21 STA $2103,y ; (BLIT_CODE[0] + 3)
1c22 : a9 91 __ LDA #$91
1c24 : 99 04 21 STA $2104,y ; (BLIT_CODE[0] + 4)
1c27 : a9 05 __ LDA #$05
1c29 : 99 05 21 STA $2105,y ; (BLIT_CODE[0] + 5)
1c2c : 98 __ __ TYA
1c2d : 18 __ __ CLC
1c2e : 69 06 __ ADC #$06
1c30 : 60 __ __ RTS
--------------------------------------------------------------------
bmmc_flood_fill: ; bmmc_flood_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,u8)->void
;  72, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
1c31 : a5 53 __ LDA T16 + 0 
1c33 : 8d e5 cf STA $cfe5 ; (bmmc_flood_fill@stack + 0)
.s4:
1c36 : a6 15 __ LDX P8 ; (color + 0)
1c38 : bd f9 1f LDA $1ff9,x ; (cbytes[0] + 0)
1c3b : 85 4f __ STA T11 + 0 
1c3d : 46 12 __ LSR P5 ; (x + 1)
1c3f : a5 11 __ LDA P4 ; (x + 0)
1c41 : 6a __ __ ROR
1c42 : 85 43 __ STA T0 + 0 
1c44 : 29 03 __ AND #$03
1c46 : 49 03 __ EOR #$03
1c48 : 0a __ __ ASL
1c49 : 85 44 __ STA T2 + 0 
1c4b : a0 04 __ LDY #$04
1c4d : b1 0d __ LDA (P0),y ; (bm + 0)
1c4f : 85 1b __ STA ACCU + 0 
1c51 : a9 00 __ LDA #$00
1c53 : 85 1c __ STA ACCU + 1 
1c55 : a5 13 __ LDA P6 ; (y + 0)
1c57 : 29 f8 __ AND #$f8
1c59 : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
1c5c : a0 00 __ LDY #$00
1c5e : b1 0d __ LDA (P0),y ; (bm + 0)
1c60 : 18 __ __ CLC
1c61 : 65 1b __ ADC ACCU + 0 
1c63 : 85 1b __ STA ACCU + 0 
1c65 : c8 __ __ INY
1c66 : b1 0d __ LDA (P0),y ; (bm + 0)
1c68 : 65 1c __ ADC ACCU + 1 
1c6a : aa __ __ TAX
1c6b : a5 13 __ LDA P6 ; (y + 0)
1c6d : 29 07 __ AND #$07
1c6f : 18 __ __ CLC
1c70 : 65 1b __ ADC ACCU + 0 
1c72 : 85 1b __ STA ACCU + 0 
1c74 : 90 01 __ BCC $1c77 ; (bmmc_flood_fill.s41 + 0)
.s40:
1c76 : e8 __ __ INX
.s41:
1c77 : a5 43 __ LDA T0 + 0 
1c79 : 29 fc __ AND #$fc
1c7b : 0a __ __ ASL
1c7c : a8 __ __ TAY
1c7d : 90 01 __ BCC $1c80 ; (bmmc_flood_fill.s43 + 0)
.s42:
1c7f : e8 __ __ INX
.s43:
1c80 : 86 1c __ STX ACCU + 1 
1c82 : b1 1b __ LDA (ACCU + 0),y 
1c84 : a6 44 __ LDX T2 + 0 
1c86 : f0 04 __ BEQ $1c8c ; (bmmc_flood_fill.s6 + 0)
.l5:
1c88 : 4a __ __ LSR
1c89 : ca __ __ DEX
1c8a : d0 fc __ BNE $1c88 ; (bmmc_flood_fill.l5 + 0)
.s6:
1c8c : 29 03 __ AND #$03
1c8e : aa __ __ TAX
1c8f : bd f9 1f LDA $1ff9,x ; (cbytes[0] + 0)
1c92 : c5 4f __ CMP T11 + 0 
1c94 : d0 03 __ BNE $1c99 ; (bmmc_flood_fill.s7 + 0)
1c96 : 4c d3 1e JMP $1ed3 ; (bmmc_flood_fill.s3 + 0)
.s7:
1c99 : 85 4e __ STA T10 + 0 
1c9b : a0 00 __ LDY #$00
1c9d : b1 0f __ LDA (P2),y ; (clip + 0)
1c9f : 85 44 __ STA T2 + 0 
1ca1 : c8 __ __ INY
1ca2 : b1 0f __ LDA (P2),y ; (clip + 0)
1ca4 : 4a __ __ LSR
1ca5 : 66 44 __ ROR T2 + 0 
1ca7 : a0 04 __ LDY #$04
1ca9 : b1 0f __ LDA (P2),y ; (clip + 0)
1cab : 85 47 __ STA T4 + 0 
1cad : c8 __ __ INY
1cae : b1 0f __ LDA (P2),y ; (clip + 0)
1cb0 : 4a __ __ LSR
1cb1 : 66 47 __ ROR T4 + 0 
1cb3 : a5 43 __ LDA T0 + 0 
1cb5 : 8d 00 21 STA $2100 ; (BLIT_CODE[0] + 0)
1cb8 : a5 13 __ LDA P6 ; (y + 0)
1cba : 8d 01 21 STA $2101 ; (BLIT_CODE[0] + 1)
1cbd : a2 02 __ LDX #$02
1cbf : 86 50 __ STX T12 + 0 
.l8:
1cc1 : bd ff 20 LDA $20ff,x 
1cc4 : 85 43 __ STA T0 + 0 
1cc6 : 29 f8 __ AND #$f8
1cc8 : aa __ __ TAX
1cc9 : a0 04 __ LDY #$04
1ccb : b1 0d __ LDA (P0),y ; (bm + 0)
1ccd : 85 1b __ STA ACCU + 0 
1ccf : a9 00 __ LDA #$00
1cd1 : 85 1c __ STA ACCU + 1 
1cd3 : 8a __ __ TXA
1cd4 : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
1cd7 : a0 00 __ LDY #$00
1cd9 : b1 0d __ LDA (P0),y ; (bm + 0)
1cdb : 85 48 __ STA T5 + 0 
1cdd : 18 __ __ CLC
1cde : 65 1b __ ADC ACCU + 0 
1ce0 : 85 45 __ STA T3 + 0 
1ce2 : c8 __ __ INY
1ce3 : b1 0d __ LDA (P0),y ; (bm + 0)
1ce5 : 85 49 __ STA T5 + 1 
1ce7 : 65 1c __ ADC ACCU + 1 
1ce9 : aa __ __ TAX
1cea : a5 43 __ LDA T0 + 0 
1cec : 29 07 __ AND #$07
1cee : 18 __ __ CLC
1cef : 65 45 __ ADC T3 + 0 
1cf1 : a8 __ __ TAY
1cf2 : 90 02 __ BCC $1cf6 ; (bmmc_flood_fill.s45 + 0)
.s44:
1cf4 : e8 __ __ INX
1cf5 : 18 __ __ CLC
.s45:
1cf6 : 86 46 __ STX T3 + 1 
1cf8 : a5 50 __ LDA T12 + 0 
1cfa : 69 fe __ ADC #$fe
1cfc : 85 50 __ STA T12 + 0 
1cfe : aa __ __ TAX
1cff : bd 00 21 LDA $2100,x ; (BLIT_CODE[0] + 0)
1d02 : 85 51 __ STA T13 + 0 
1d04 : 29 fc __ AND #$fc
1d06 : 0a __ __ ASL
1d07 : 85 4a __ STA T8 + 0 
1d09 : a5 46 __ LDA T3 + 1 
1d0b : 69 00 __ ADC #$00
1d0d : 85 4b __ STA T8 + 1 
1d0f : a5 51 __ LDA T13 + 0 
1d11 : 29 03 __ AND #$03
1d13 : 0a __ __ ASL
1d14 : aa __ __ TAX
1d15 : b1 4a __ LDA (T8 + 0),y 
1d17 : 45 4e __ EOR T10 + 0 
1d19 : 3d 80 20 AND $2080,x ; (ormask[0] + 0)
1d1c : f0 03 __ BEQ $1d21 ; (bmmc_flood_fill.s9 + 0)
1d1e : 4c cc 1e JMP $1ecc ; (bmmc_flood_fill.s13 + 0)
.s9:
1d21 : a5 4f __ LDA T11 + 0 
1d23 : 3d 80 20 AND $2080,x ; (ormask[0] + 0)
1d26 : 85 4c __ STA T9 + 0 
1d28 : bd 88 20 LDA $2088,x ; (andmask[0] + 0)
1d2b : 31 4a __ AND (T8 + 0),y 
1d2d : 05 4c __ ORA T9 + 0 
1d2f : 91 4a __ STA (T8 + 0),y 
1d31 : a5 51 __ LDA T13 + 0 
1d33 : 85 52 __ STA T14 + 0 
1d35 : a5 44 __ LDA T2 + 0 
1d37 : c5 51 __ CMP T13 + 0 
1d39 : b0 49 __ BCS $1d84 ; (bmmc_flood_fill.l10 + 0)
.l36:
1d3b : a5 52 __ LDA T14 + 0 
1d3d : e9 00 __ SBC #$00
1d3f : aa __ __ TAX
1d40 : 29 fc __ AND #$fc
1d42 : 0a __ __ ASL
1d43 : 85 4a __ STA T8 + 0 
1d45 : a5 46 __ LDA T3 + 1 
1d47 : 69 00 __ ADC #$00
1d49 : 85 4b __ STA T8 + 1 
1d4b : 8a __ __ TXA
1d4c : 29 03 __ AND #$03
1d4e : 0a __ __ ASL
1d4f : aa __ __ TAX
1d50 : b1 4a __ LDA (T8 + 0),y 
1d52 : 45 4e __ EOR T10 + 0 
1d54 : 3d 80 20 AND $2080,x ; (ormask[0] + 0)
1d57 : d0 2b __ BNE $1d84 ; (bmmc_flood_fill.l10 + 0)
.s37:
1d59 : c6 52 __ DEC T14 + 0 
1d5b : a5 52 __ LDA T14 + 0 
1d5d : 29 03 __ AND #$03
1d5f : 0a __ __ ASL
1d60 : aa __ __ TAX
1d61 : bd 80 20 LDA $2080,x ; (ormask[0] + 0)
1d64 : 25 4f __ AND T11 + 0 
1d66 : 85 4c __ STA T9 + 0 
1d68 : a5 52 __ LDA T14 + 0 
1d6a : 29 fc __ AND #$fc
1d6c : 0a __ __ ASL
1d6d : 85 1b __ STA ACCU + 0 
1d6f : a5 46 __ LDA T3 + 1 
1d71 : 69 00 __ ADC #$00
1d73 : 85 1c __ STA ACCU + 1 
1d75 : b1 1b __ LDA (ACCU + 0),y 
1d77 : 3d 88 20 AND $2088,x ; (andmask[0] + 0)
1d7a : 05 4c __ ORA T9 + 0 
1d7c : 91 1b __ STA (ACCU + 0),y 
1d7e : a5 44 __ LDA T2 + 0 
1d80 : c5 52 __ CMP T14 + 0 
1d82 : 90 b7 __ BCC $1d3b ; (bmmc_flood_fill.l36 + 0)
.l10:
1d84 : 18 __ __ CLC
1d85 : a5 51 __ LDA T13 + 0 
1d87 : 69 01 __ ADC #$01
1d89 : b0 46 __ BCS $1dd1 ; (bmmc_flood_fill.s11 + 0)
.s35:
1d8b : aa __ __ TAX
1d8c : e4 47 __ CPX T4 + 0 
1d8e : b0 41 __ BCS $1dd1 ; (bmmc_flood_fill.s11 + 0)
.s33:
1d90 : 29 fc __ AND #$fc
1d92 : 0a __ __ ASL
1d93 : 85 1b __ STA ACCU + 0 
1d95 : a5 46 __ LDA T3 + 1 
1d97 : 69 00 __ ADC #$00
1d99 : 85 1c __ STA ACCU + 1 
1d9b : 8a __ __ TXA
1d9c : 29 03 __ AND #$03
1d9e : 0a __ __ ASL
1d9f : aa __ __ TAX
1da0 : b1 1b __ LDA (ACCU + 0),y 
1da2 : 45 4e __ EOR T10 + 0 
1da4 : 3d 80 20 AND $2080,x ; (ormask[0] + 0)
1da7 : d0 28 __ BNE $1dd1 ; (bmmc_flood_fill.s11 + 0)
.s34:
1da9 : e6 51 __ INC T13 + 0 
1dab : a5 51 __ LDA T13 + 0 
1dad : 29 03 __ AND #$03
1daf : 0a __ __ ASL
1db0 : aa __ __ TAX
1db1 : bd 80 20 LDA $2080,x ; (ormask[0] + 0)
1db4 : 25 4f __ AND T11 + 0 
1db6 : 85 4c __ STA T9 + 0 
1db8 : a5 51 __ LDA T13 + 0 
1dba : 29 fc __ AND #$fc
1dbc : 0a __ __ ASL
1dbd : 85 1b __ STA ACCU + 0 
1dbf : a5 46 __ LDA T3 + 1 
1dc1 : 69 00 __ ADC #$00
1dc3 : 85 1c __ STA ACCU + 1 
1dc5 : b1 1b __ LDA (ACCU + 0),y 
1dc7 : 3d 88 20 AND $2088,x ; (andmask[0] + 0)
1dca : 05 4c __ ORA T9 + 0 
1dcc : 91 1b __ STA (ACCU + 0),y 
1dce : 4c 84 1d JMP $1d84 ; (bmmc_flood_fill.l10 + 0)
.s11:
1dd1 : a0 03 __ LDY #$03
1dd3 : b1 0f __ LDA (P2),y ; (clip + 0)
1dd5 : 30 09 __ BMI $1de0 ; (bmmc_flood_fill.s24 + 0)
.s32:
1dd7 : d0 75 __ BNE $1e4e ; (bmmc_flood_fill.s12 + 0)
.s31:
1dd9 : 88 __ __ DEY
1dda : b1 0f __ LDA (P2),y ; (clip + 0)
1ddc : c5 43 __ CMP T0 + 0 
1dde : b0 6e __ BCS $1e4e ; (bmmc_flood_fill.s12 + 0)
.s24:
1de0 : a5 51 __ LDA T13 + 0 
1de2 : c5 52 __ CMP T14 + 0 
1de4 : 90 68 __ BCC $1e4e ; (bmmc_flood_fill.s12 + 0)
.s25:
1de6 : a5 43 __ LDA T0 + 0 
1de8 : e9 01 __ SBC #$01
1dea : 85 45 __ STA T3 + 0 
1dec : 29 f8 __ AND #$f8
1dee : 85 1b __ STA ACCU + 0 
1df0 : a9 00 __ LDA #$00
1df2 : 85 53 __ STA T16 + 0 
1df4 : e9 00 __ SBC #$00
1df6 : 85 1c __ STA ACCU + 1 
1df8 : a0 04 __ LDY #$04
1dfa : b1 0d __ LDA (P0),y ; (bm + 0)
1dfc : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
1dff : 18 __ __ CLC
1e00 : a5 48 __ LDA T5 + 0 
1e02 : 65 1b __ ADC ACCU + 0 
1e04 : 85 1b __ STA ACCU + 0 
1e06 : a5 49 __ LDA T5 + 1 
1e08 : 65 1c __ ADC ACCU + 1 
1e0a : aa __ __ TAX
1e0b : a5 45 __ LDA T3 + 0 
1e0d : 29 07 __ AND #$07
1e0f : 18 __ __ CLC
1e10 : 65 1b __ ADC ACCU + 0 
1e12 : a8 __ __ TAY
1e13 : 90 01 __ BCC $1e16 ; (bmmc_flood_fill.s49 + 0)
.s48:
1e15 : e8 __ __ INX
.s49:
1e16 : 86 1c __ STX ACCU + 1 
1e18 : a5 52 __ LDA T14 + 0 
1e1a : 85 1b __ STA ACCU + 0 
.l26:
1e1c : a5 1b __ LDA ACCU + 0 
1e1e : 29 fc __ AND #$fc
1e20 : 0a __ __ ASL
1e21 : 85 4c __ STA T9 + 0 
1e23 : a5 1c __ LDA ACCU + 1 
1e25 : 69 00 __ ADC #$00
1e27 : 85 4d __ STA T9 + 1 
1e29 : a5 1b __ LDA ACCU + 0 
1e2b : 29 03 __ AND #$03
1e2d : 0a __ __ ASL
1e2e : aa __ __ TAX
1e2f : b1 4c __ LDA (T9 + 0),y 
1e31 : 45 4e __ EOR T10 + 0 
1e33 : 3d 80 20 AND $2080,x ; (ormask[0] + 0)
1e36 : f0 07 __ BEQ $1e3f ; (bmmc_flood_fill.s27 + 0)
.s30:
1e38 : a9 00 __ LDA #$00
.s39:
1e3a : 85 53 __ STA T16 + 0 
1e3c : 4c 46 1e JMP $1e46 ; (bmmc_flood_fill.s29 + 0)
.s27:
1e3f : a5 53 __ LDA T16 + 0 
1e41 : d0 03 __ BNE $1e46 ; (bmmc_flood_fill.s29 + 0)
1e43 : 4c ed 1e JMP $1eed ; (bmmc_flood_fill.s28 + 0)
.s29:
1e46 : e6 1b __ INC ACCU + 0 
1e48 : a5 51 __ LDA T13 + 0 
1e4a : c5 1b __ CMP ACCU + 0 
1e4c : b0 ce __ BCS $1e1c ; (bmmc_flood_fill.l26 + 0)
.s12:
1e4e : 18 __ __ CLC
1e4f : a5 43 __ LDA T0 + 0 
1e51 : 69 01 __ ADC #$01
1e53 : 85 43 __ STA T0 + 0 
1e55 : a9 00 __ LDA #$00
1e57 : 2a __ __ ROL
1e58 : 85 1c __ STA ACCU + 1 
1e5a : a0 07 __ LDY #$07
1e5c : b1 0f __ LDA (P2),y ; (clip + 0)
1e5e : 30 6c __ BMI $1ecc ; (bmmc_flood_fill.s13 + 0)
.s23:
1e60 : a5 1c __ LDA ACCU + 1 
1e62 : d1 0f __ CMP (P2),y ; (clip + 0)
1e64 : d0 05 __ BNE $1e6b ; (bmmc_flood_fill.s22 + 0)
.s21:
1e66 : a5 43 __ LDA T0 + 0 
1e68 : 88 __ __ DEY
1e69 : d1 0f __ CMP (P2),y ; (clip + 0)
.s22:
1e6b : b0 5f __ BCS $1ecc ; (bmmc_flood_fill.s13 + 0)
.s14:
1e6d : a5 51 __ LDA T13 + 0 
1e6f : c5 52 __ CMP T14 + 0 
1e71 : 90 59 __ BCC $1ecc ; (bmmc_flood_fill.s13 + 0)
.s15:
1e73 : a5 43 __ LDA T0 + 0 
1e75 : 29 f8 __ AND #$f8
1e77 : 85 1b __ STA ACCU + 0 
1e79 : a0 04 __ LDY #$04
1e7b : b1 0d __ LDA (P0),y ; (bm + 0)
1e7d : 20 02 1f JSR $1f02 ; (mul16by8 + 0)
1e80 : 18 __ __ CLC
1e81 : a5 48 __ LDA T5 + 0 
1e83 : 65 1b __ ADC ACCU + 0 
1e85 : 85 48 __ STA T5 + 0 
1e87 : a5 49 __ LDA T5 + 1 
1e89 : 65 1c __ ADC ACCU + 1 
1e8b : aa __ __ TAX
1e8c : a5 43 __ LDA T0 + 0 
1e8e : 29 07 __ AND #$07
1e90 : 18 __ __ CLC
1e91 : 65 48 __ ADC T5 + 0 
1e93 : a8 __ __ TAY
1e94 : 90 01 __ BCC $1e97 ; (bmmc_flood_fill.s47 + 0)
.s46:
1e96 : e8 __ __ INX
.s47:
1e97 : 86 49 __ STX T5 + 1 
1e99 : a9 00 __ LDA #$00
1e9b : 85 4a __ STA T8 + 0 
.l16:
1e9d : a5 52 __ LDA T14 + 0 
1e9f : 29 fc __ AND #$fc
1ea1 : 0a __ __ ASL
1ea2 : 85 1b __ STA ACCU + 0 
1ea4 : a5 49 __ LDA T5 + 1 
1ea6 : 69 00 __ ADC #$00
1ea8 : 85 1c __ STA ACCU + 1 
1eaa : a5 52 __ LDA T14 + 0 
1eac : 29 03 __ AND #$03
1eae : 0a __ __ ASL
1eaf : aa __ __ TAX
1eb0 : b1 1b __ LDA (ACCU + 0),y 
1eb2 : 45 4e __ EOR T10 + 0 
1eb4 : 3d 80 20 AND $2080,x ; (ormask[0] + 0)
1eb7 : f0 07 __ BEQ $1ec0 ; (bmmc_flood_fill.s17 + 0)
.s20:
1eb9 : a9 00 __ LDA #$00
.s38:
1ebb : 85 4a __ STA T8 + 0 
1ebd : 4c c4 1e JMP $1ec4 ; (bmmc_flood_fill.s19 + 0)
.s17:
1ec0 : a5 4a __ LDA T8 + 0 
1ec2 : f0 15 __ BEQ $1ed9 ; (bmmc_flood_fill.s18 + 0)
.s19:
1ec4 : e6 52 __ INC T14 + 0 
1ec6 : a5 51 __ LDA T13 + 0 
1ec8 : c5 52 __ CMP T14 + 0 
1eca : b0 d1 __ BCS $1e9d ; (bmmc_flood_fill.l16 + 0)
.s13:
1ecc : a6 50 __ LDX T12 + 0 
1ece : f0 03 __ BEQ $1ed3 ; (bmmc_flood_fill.s3 + 0)
1ed0 : 4c c1 1c JMP $1cc1 ; (bmmc_flood_fill.l8 + 0)
.s3:
1ed3 : ad e5 cf LDA $cfe5 ; (bmmc_flood_fill@stack + 0)
1ed6 : 85 53 __ STA T16 + 0 
1ed8 : 60 __ __ RTS
.s18:
1ed9 : a5 52 __ LDA T14 + 0 
1edb : a6 50 __ LDX T12 + 0 
1edd : e8 __ __ INX
1ede : e8 __ __ INX
1edf : 86 50 __ STX T12 + 0 
1ee1 : 9d fe 20 STA $20fe,x 
1ee4 : a5 43 __ LDA T0 + 0 
1ee6 : 9d ff 20 STA $20ff,x 
1ee9 : a9 01 __ LDA #$01
1eeb : d0 ce __ BNE $1ebb ; (bmmc_flood_fill.s38 + 0)
.s28:
1eed : a5 1b __ LDA ACCU + 0 
1eef : a6 50 __ LDX T12 + 0 
1ef1 : e8 __ __ INX
1ef2 : e8 __ __ INX
1ef3 : 86 50 __ STX T12 + 0 
1ef5 : 9d fe 20 STA $20fe,x 
1ef8 : a5 45 __ LDA T3 + 0 
1efa : 9d ff 20 STA $20ff,x 
1efd : a9 01 __ LDA #$01
1eff : 4c 3a 1e JMP $1e3a ; (bmmc_flood_fill.s39 + 0)
--------------------------------------------------------------------
mul16by8: ; mul16by8
1f02 : 4a __ __ LSR
1f03 : f0 2e __ BEQ $1f33 ; (mul16by8 + 49)
1f05 : a2 00 __ LDX #$00
1f07 : a0 00 __ LDY #$00
1f09 : 90 13 __ BCC $1f1e ; (mul16by8 + 28)
1f0b : a4 1b __ LDY ACCU + 0 
1f0d : a6 1c __ LDX ACCU + 1 
1f0f : b0 0d __ BCS $1f1e ; (mul16by8 + 28)
1f11 : 85 02 __ STA $02 
1f13 : 18 __ __ CLC
1f14 : 98 __ __ TYA
1f15 : 65 1b __ ADC ACCU + 0 
1f17 : a8 __ __ TAY
1f18 : 8a __ __ TXA
1f19 : 65 1c __ ADC ACCU + 1 
1f1b : aa __ __ TAX
1f1c : a5 02 __ LDA $02 
1f1e : 06 1b __ ASL ACCU + 0 
1f20 : 26 1c __ ROL ACCU + 1 
1f22 : 4a __ __ LSR
1f23 : 90 f9 __ BCC $1f1e ; (mul16by8 + 28)
1f25 : d0 ea __ BNE $1f11 ; (mul16by8 + 15)
1f27 : 18 __ __ CLC
1f28 : 98 __ __ TYA
1f29 : 65 1b __ ADC ACCU + 0 
1f2b : 85 1b __ STA ACCU + 0 
1f2d : 8a __ __ TXA
1f2e : 65 1c __ ADC ACCU + 1 
1f30 : 85 1c __ STA ACCU + 1 
1f32 : 60 __ __ RTS
1f33 : b0 04 __ BCS $1f39 ; (mul16by8 + 55)
1f35 : 85 1b __ STA ACCU + 0 
1f37 : 85 1c __ STA ACCU + 1 
1f39 : 60 __ __ RTS
--------------------------------------------------------------------
mul16: ; mul16
1f3a : a0 00 __ LDY #$00
1f3c : 84 06 __ STY WORK + 3 
1f3e : a5 03 __ LDA WORK + 0 
1f40 : a6 04 __ LDX WORK + 1 
1f42 : f0 1c __ BEQ $1f60 ; (mul16 + 38)
1f44 : 38 __ __ SEC
1f45 : 6a __ __ ROR
1f46 : 90 0d __ BCC $1f55 ; (mul16 + 27)
1f48 : aa __ __ TAX
1f49 : 18 __ __ CLC
1f4a : 98 __ __ TYA
1f4b : 65 1b __ ADC ACCU + 0 
1f4d : a8 __ __ TAY
1f4e : a5 06 __ LDA WORK + 3 
1f50 : 65 1c __ ADC ACCU + 1 
1f52 : 85 06 __ STA WORK + 3 
1f54 : 8a __ __ TXA
1f55 : 06 1b __ ASL ACCU + 0 
1f57 : 26 1c __ ROL ACCU + 1 
1f59 : 4a __ __ LSR
1f5a : 90 f9 __ BCC $1f55 ; (mul16 + 27)
1f5c : d0 ea __ BNE $1f48 ; (mul16 + 14)
1f5e : a5 04 __ LDA WORK + 1 
1f60 : 4a __ __ LSR
1f61 : 90 0d __ BCC $1f70 ; (mul16 + 54)
1f63 : aa __ __ TAX
1f64 : 18 __ __ CLC
1f65 : 98 __ __ TYA
1f66 : 65 1b __ ADC ACCU + 0 
1f68 : a8 __ __ TAY
1f69 : a5 06 __ LDA WORK + 3 
1f6b : 65 1c __ ADC ACCU + 1 
1f6d : 85 06 __ STA WORK + 3 
1f6f : 8a __ __ TXA
1f70 : 06 1b __ ASL ACCU + 0 
1f72 : 26 1c __ ROL ACCU + 1 
1f74 : 4a __ __ LSR
1f75 : b0 ec __ BCS $1f63 ; (mul16 + 41)
1f77 : d0 f7 __ BNE $1f70 ; (mul16 + 54)
1f79 : 84 05 __ STY WORK + 2 
1f7b : 60 __ __ RTS
--------------------------------------------------------------------
__multab32L:
1f7c : __ __ __ BYT 00 20 40 60                                     : . @`
--------------------------------------------------------------------
spentry:
1f80 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
MouseSpriteData:
1f81 : __ __ __ BYT 0b 00 00 00 f0 00 00 fc 00 00 3f c0 8e 03 0b f0 : ..........?.....
1f91 : __ __ __ BYT 00 0f f0 00 03 f0 00 00 c0 00 9b 01 2a 95 e0 00 : ............*...
1fa1 : __ __ __ BYT 00 9c 00 00 83 80 00 c0 70 00 40 30 00 40 60 00 : ........p.@0.@`.
1fb1 : __ __ __ BYT 60 40 00 20 20 00 20 10 00 36 08 00 1f 18 00 19 : `@.  . ..6......
1fc1 : __ __ __ BYT b0 00 10 e0 00 00 40 9c 46 ba 01 01 85 ff 40 ff : ......@.F.....@.
1fd1 : __ __ __ BYT 40 ff 40 ff 40 ff 40 ff 40 c6 40 00             : @.@.@.@.@.@.
--------------------------------------------------------------------
lmask:
1fdd : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
1fe5 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
scr:
1fed : __ __ __ BYT 00 00 00 00 40 01 c8 00                         : ....@...
--------------------------------------------------------------------
blitops_op:
1ff5 : __ __ __ BYT 00 21 01 41                                     : .!.A
--------------------------------------------------------------------
cbytes:
1ff9 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
ciaa_pra_def:
1ffd : __ __ __ BSS	1
--------------------------------------------------------------------
mouse_port:
1ffe : __ __ __ BSS	1
--------------------------------------------------------------------
mouse_rb:
1fff : __ __ __ BSS	1
--------------------------------------------------------------------
MixedColors:
2000 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 44 11 44 11 44 11 44 : .........D.D.D.D
2010 : __ __ __ BYT 22 88 22 88 22 88 22 88 33 cc 33 cc 33 cc 33 cc : ".".".".3.3.3.3.
2020 : __ __ __ BYT 44 11 44 11 44 11 44 11 55 55 55 55 55 55 55 55 : D.D.D.D.UUUUUUUU
2030 : __ __ __ BYT 66 99 66 99 66 99 66 99 77 dd 77 dd 77 dd 77 dd : f.f.f.f.w.w.w.w.
2040 : __ __ __ BYT 88 22 88 22 88 22 88 22 99 66 99 66 99 66 99 66 : .".".".".f.f.f.f
2050 : __ __ __ BYT aa aa aa aa aa aa aa aa bb ee bb ee bb ee bb ee : ................
2060 : __ __ __ BYT cc 33 cc 33 cc 33 cc 33 dd 77 dd 77 dd 77 dd 77 : .3.3.3.3.w.w.w.w
2070 : __ __ __ BYT ee bb ee bb ee bb ee bb ff ff ff ff ff ff ff ff : ................
--------------------------------------------------------------------
ormask:
2080 : __ __ __ BYT c0 c0 30 30 0c 0c 03 03                         : ..00....
--------------------------------------------------------------------
andmask:
2088 : __ __ __ BYT 3f 3f cf cf f3 f3 fc fc                         : ??......
--------------------------------------------------------------------
mouse_lb:
2090 : __ __ __ BSS	1
--------------------------------------------------------------------
mouse_px:
2091 : __ __ __ BSS	1
--------------------------------------------------------------------
mouse_dx:
2092 : __ __ __ BSS	1
--------------------------------------------------------------------
mouse_py:
2093 : __ __ __ BSS	1
--------------------------------------------------------------------
mouse_dy:
2094 : __ __ __ BSS	1
--------------------------------------------------------------------
sbm:
2095 : __ __ __ BSS	8
--------------------------------------------------------------------
joyy:
209d : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
209f : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
20a1 : __ __ __ BSS	2
--------------------------------------------------------------------
mouse_x:
20a3 : __ __ __ BSS	2
--------------------------------------------------------------------
mouse_y:
20a5 : __ __ __ BSS	2
--------------------------------------------------------------------
keyb_key:
20a7 : __ __ __ BSS	1
--------------------------------------------------------------------
keyb_matrix:
20a8 : __ __ __ BSS	8
--------------------------------------------------------------------
BLIT_CODE:
2100 : __ __ __ BSS	224
