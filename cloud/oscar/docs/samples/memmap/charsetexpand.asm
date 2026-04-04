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
080e : 8e bd 0b STX $0bbd ; (spentry + 0)
0811 : a2 0b __ LDX #$0b
0813 : a0 bf __ LDY #$bf
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0b __ CPX #$0b
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 bf __ CPY #$bf
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
083f : a9 cb __ LDA #$cb
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 0a JSR $0a00 ; (main.s4 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  37, "/home/honza/projects/c64/projects/oscar64/samples/memmap/charsetexpand.c"
.s4:
0a00 : 20 75 0a JSR $0a75 ; (mmap_trampoline.s4 + 0)
0a03 : a9 00 __ LDA #$00
0a05 : 85 45 __ STA T1 + 0 
0a07 : 85 0d __ STA P0 
0a09 : a9 30 __ LDA #$30
0a0b : 85 01 __ STA $01 
0a0d : a9 d0 __ LDA #$d0
0a0f : 85 0e __ STA P1 
0a11 : a9 c0 __ LDA #$c0
0a13 : 85 10 __ STA P3 
0a15 : a9 00 __ LDA #$00
0a17 : 85 0f __ STA P2 
0a19 : 20 bf 0a JSR $0abf ; (oscar_expand_lzo.s4 + 0)
0a1c : a9 00 __ LDA #$00
0a1e : 85 44 __ STA T0 + 1 
0a20 : 85 0d __ STA P0 
0a22 : 85 10 __ STA P3 
0a24 : 85 43 __ STA T0 + 0 
0a26 : 85 0e __ STA P1 
0a28 : a9 36 __ LDA #$36
0a2a : 85 01 __ STA $01 
0a2c : a9 cc __ LDA #$cc
0a2e : 85 46 __ STA T1 + 1 
0a30 : 85 0f __ STA P2 
0a32 : a9 d0 __ LDA #$d0
0a34 : 85 11 __ STA P4 
0a36 : 20 2f 0b JSR $0b2f ; (vic_setmode.s4 + 0)
.l5:
0a39 : a9 00 __ LDA #$00
0a3b : a4 45 __ LDY T1 + 0 
0a3d : 85 45 __ STA T1 + 0 
0a3f : a6 43 __ LDX T0 + 0 
.l7:
0a41 : 8a __ __ TXA
0a42 : 91 45 __ STA (T1 + 0),y 
0a44 : c8 __ __ INY
0a45 : d0 02 __ BNE $0a49 ; (main.s10 + 0)
.s9:
0a47 : e6 46 __ INC T1 + 1 
.s10:
0a49 : e8 __ __ INX
0a4a : d0 02 __ BNE $0a4e ; (main.s12 + 0)
.s11:
0a4c : e6 44 __ INC T0 + 1 
.s12:
0a4e : a5 44 __ LDA T0 + 1 
0a50 : c9 03 __ CMP #$03
0a52 : d0 ed __ BNE $0a41 ; (main.l7 + 0)
.s8:
0a54 : 86 43 __ STX T0 + 0 
0a56 : 84 45 __ STY T1 + 0 
0a58 : e0 e8 __ CPX #$e8
0a5a : d0 dd __ BNE $0a39 ; (main.l5 + 0)
.s6:
0a5c : 20 81 0b JSR $0b81 ; (getpch.s4 + 0)
0a5f : a9 04 __ LDA #$04
0a61 : 85 0f __ STA P2 
0a63 : a9 10 __ LDA #$10
0a65 : 85 11 __ STA P4 
0a67 : 20 2f 0b JSR $0b2f ; (vic_setmode.s4 + 0)
0a6a : a9 00 __ LDA #$00
0a6c : 85 1b __ STA ACCU + 0 
0a6e : 85 1c __ STA ACCU + 1 
0a70 : a9 37 __ LDA #$37
0a72 : 85 01 __ STA $01 
.s3:
0a74 : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0a75 : a9 8a __ LDA #$8a
0a77 : 8d fa ff STA $fffa 
0a7a : a9 0a __ LDA #$0a
0a7c : 8d fb ff STA $fffb 
0a7f : a9 a8 __ LDA #$a8
0a81 : 8d fe ff STA $fffe 
0a84 : a9 0a __ LDA #$0a
0a86 : 8d ff ff STA $ffff 
.s3:
0a89 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0a8a : 48 __ __ PHA
0a8b : 8a __ __ TXA
0a8c : 48 __ __ PHA
0a8d : a9 0a __ LDA #$0a
0a8f : 48 __ __ PHA
0a90 : a9 a1 __ LDA #$a1
0a92 : 48 __ __ PHA
0a93 : ba __ __ TSX
0a94 : bd 05 01 LDA $0105,x 
0a97 : 48 __ __ PHA
0a98 : a6 01 __ LDX $01 
0a9a : a9 36 __ LDA #$36
0a9c : 85 01 __ STA $01 
0a9e : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0aa1 : 86 01 __ STX $01 
0aa3 : 68 __ __ PLA
0aa4 : aa __ __ TAX
0aa5 : 68 __ __ PLA
0aa6 : 40 __ __ RTI
0aa7 : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0aa8 : 48 __ __ PHA
0aa9 : 8a __ __ TXA
0aaa : 48 __ __ PHA
0aab : a9 0a __ LDA #$0a
0aad : 48 __ __ PHA
0aae : a9 a1 __ LDA #$a1
0ab0 : 48 __ __ PHA
0ab1 : ba __ __ TSX
0ab2 : bd 05 01 LDA $0105,x 
0ab5 : 48 __ __ PHA
0ab6 : a6 01 __ LDX $01 
0ab8 : a9 36 __ LDA #$36
0aba : 85 01 __ STA $01 
0abc : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
oscar_expand_lzo: ; oscar_expand_lzo(u8*,const u8*)->const u8*
;   5, "/home/honza/projects/c64/projects/oscar64/include/oscar.h"
.s4:
0abf : a0 00 __ LDY #$00
0ac1 : b1 0f __ LDA (P2),y ; (sp + 0)
.l5:
0ac3 : 85 1d __ STA ACCU + 2 
0ac5 : 30 1e __ BMI $0ae5 ; (oscar_expand_lzo.s9 + 0)
.s6:
0ac7 : 18 __ __ CLC
0ac8 : a5 0f __ LDA P2 ; (sp + 0)
0aca : 69 01 __ ADC #$01
0acc : 85 1b __ STA ACCU + 0 
0ace : aa __ __ TAX
0acf : a5 10 __ LDA P3 ; (sp + 1)
0ad1 : 69 00 __ ADC #$00
0ad3 : 85 1c __ STA ACCU + 1 
0ad5 : 8a __ __ TXA
0ad6 : 18 __ __ CLC
0ad7 : 65 1d __ ADC ACCU + 2 
0ad9 : 85 0f __ STA P2 ; (sp + 0)
0adb : a5 1c __ LDA ACCU + 1 
0add : 69 00 __ ADC #$00
0adf : 85 10 __ STA P3 ; (sp + 1)
.s7:
0ae1 : a0 00 __ LDY #$00
0ae3 : f0 22 __ BEQ $0b07 ; (oscar_expand_lzo.l10 + 0)
.s9:
0ae5 : a5 0d __ LDA P0 ; (dp + 0)
0ae7 : 38 __ __ SEC
0ae8 : a0 01 __ LDY #$01
0aea : f1 0f __ SBC (P2),y ; (sp + 0)
0aec : 85 1b __ STA ACCU + 0 
0aee : a5 0e __ LDA P1 ; (dp + 1)
0af0 : e9 00 __ SBC #$00
0af2 : 85 1c __ STA ACCU + 1 
0af4 : 18 __ __ CLC
0af5 : a5 0f __ LDA P2 ; (sp + 0)
0af7 : 69 02 __ ADC #$02
0af9 : 85 0f __ STA P2 ; (sp + 0)
0afb : 90 02 __ BCC $0aff ; (oscar_expand_lzo.s13 + 0)
.s12:
0afd : e6 10 __ INC P3 ; (sp + 1)
.s13:
0aff : a5 1d __ LDA ACCU + 2 
0b01 : 29 7f __ AND #$7f
0b03 : 85 1d __ STA ACCU + 2 
0b05 : a0 00 __ LDY #$00
.l10:
0b07 : b1 1b __ LDA (ACCU + 0),y 
0b09 : 91 0d __ STA (P0),y ; (dp + 0)
0b0b : c8 __ __ INY
0b0c : c4 1d __ CPY ACCU + 2 
0b0e : d0 f7 __ BNE $0b07 ; (oscar_expand_lzo.l10 + 0)
.s11:
0b10 : 18 __ __ CLC
0b11 : a5 0d __ LDA P0 ; (dp + 0)
0b13 : 65 1d __ ADC ACCU + 2 
0b15 : 85 0d __ STA P0 ; (dp + 0)
0b17 : 90 02 __ BCC $0b1b ; (oscar_expand_lzo.s15 + 0)
.s14:
0b19 : e6 0e __ INC P1 ; (dp + 1)
.s15:
0b1b : a0 00 __ LDY #$00
0b1d : b1 0f __ LDA (P2),y ; (sp + 0)
0b1f : d0 a2 __ BNE $0ac3 ; (oscar_expand_lzo.l5 + 0)
.s8:
0b21 : 18 __ __ CLC
0b22 : a5 0f __ LDA P2 ; (sp + 0)
0b24 : 69 01 __ ADC #$01
0b26 : 85 1b __ STA ACCU + 0 
0b28 : a5 10 __ LDA P3 ; (sp + 1)
0b2a : 69 00 __ ADC #$00
0b2c : 85 1c __ STA ACCU + 1 
.s3:
0b2e : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0b2f : a4 0d __ LDY P0 ; (mode + 0)
0b31 : c0 02 __ CPY #$02
0b33 : d0 09 __ BNE $0b3e ; (vic_setmode.s5 + 0)
.s10:
0b35 : a9 5b __ LDA #$5b
0b37 : 8d 11 d0 STA $d011 
.s8:
0b3a : a9 08 __ LDA #$08
0b3c : d0 0c __ BNE $0b4a ; (vic_setmode.s7 + 0)
.s5:
0b3e : b0 36 __ BCS $0b76 ; (vic_setmode.s6 + 0)
.s9:
0b40 : a9 1b __ LDA #$1b
0b42 : 8d 11 d0 STA $d011 
0b45 : 98 __ __ TYA
0b46 : f0 f2 __ BEQ $0b3a ; (vic_setmode.s8 + 0)
.s11:
0b48 : a9 18 __ LDA #$18
.s7:
0b4a : 8d 16 d0 STA $d016 
0b4d : ad 00 dd LDA $dd00 
0b50 : 29 fc __ AND #$fc
0b52 : 85 1b __ STA ACCU + 0 
0b54 : a5 0f __ LDA P2 ; (text + 1)
0b56 : 0a __ __ ASL
0b57 : 2a __ __ ROL
0b58 : 29 01 __ AND #$01
0b5a : 2a __ __ ROL
0b5b : 49 03 __ EOR #$03
0b5d : 05 1b __ ORA ACCU + 0 
0b5f : 8d 00 dd STA $dd00 
0b62 : a5 0f __ LDA P2 ; (text + 1)
0b64 : 29 3c __ AND #$3c
0b66 : 0a __ __ ASL
0b67 : 0a __ __ ASL
0b68 : 85 1b __ STA ACCU + 0 
0b6a : a5 11 __ LDA P4 ; (font + 1)
0b6c : 29 38 __ AND #$38
0b6e : 4a __ __ LSR
0b6f : 4a __ __ LSR
0b70 : 05 1b __ ORA ACCU + 0 
0b72 : 8d 18 d0 STA $d018 
.s3:
0b75 : 60 __ __ RTS
.s6:
0b76 : a9 3b __ LDA #$3b
0b78 : 8d 11 d0 STA $d011 
0b7b : c0 03 __ CPY #$03
0b7d : d0 c9 __ BNE $0b48 ; (vic_setmode.s11 + 0)
0b7f : f0 b9 __ BEQ $0b3a ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
getpch: ; getpch()->u8
;  70, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0b81 : 20 cf ff JSR $ffcf 
0b84 : 85 1b __ STA ACCU + 0 
0b86 : a5 1b __ LDA ACCU + 0 
0b88 : 4c 8b 0b JMP $0b8b ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
0b8b : a8 __ __ TAY
0b8c : ad be 0b LDA $0bbe ; (giocharmap + 0)
0b8f : f0 27 __ BEQ $0bb8 ; (convch.s5 + 0)
.s6:
0b91 : c0 0d __ CPY #$0d
0b93 : d0 03 __ BNE $0b98 ; (convch.s7 + 0)
.s16:
0b95 : a9 0a __ LDA #$0a
.s3:
0b97 : 60 __ __ RTS
.s7:
0b98 : c9 02 __ CMP #$02
0b9a : 90 1c __ BCC $0bb8 ; (convch.s5 + 0)
.s8:
0b9c : 98 __ __ TYA
0b9d : c0 41 __ CPY #$41
0b9f : 90 17 __ BCC $0bb8 ; (convch.s5 + 0)
.s9:
0ba1 : c9 db __ CMP #$db
0ba3 : b0 13 __ BCS $0bb8 ; (convch.s5 + 0)
.s10:
0ba5 : c9 c1 __ CMP #$c1
0ba7 : 90 03 __ BCC $0bac ; (convch.s11 + 0)
.s15:
0ba9 : 49 a0 __ EOR #$a0
0bab : a8 __ __ TAY
.s11:
0bac : c9 7b __ CMP #$7b
0bae : b0 08 __ BCS $0bb8 ; (convch.s5 + 0)
.s12:
0bb0 : c9 61 __ CMP #$61
0bb2 : b0 06 __ BCS $0bba ; (convch.s14 + 0)
.s13:
0bb4 : c9 5b __ CMP #$5b
0bb6 : 90 02 __ BCC $0bba ; (convch.s14 + 0)
.s5:
0bb8 : 98 __ __ TYA
0bb9 : 60 __ __ RTS
.s14:
0bba : 49 20 __ EOR #$20
0bbc : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0bbd : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
0bbe : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
charset:
c000 : __ __ __ BYT 1c 3c 42 5a 5e 40 42 3c 00 00 00 1c 02 3e 46 3a : .<BZ^@B<.....>F:
c010 : __ __ __ BYT 00 00 40 40 7c 42 62 5c 00 00 00 3c 42 84 18 05 : ..@@|Bb\...<B...
c020 : __ __ __ BYT 02 02 3a 46 42 84 18 4e 00 3c 42 7e 40 3c 00 00 : ..:FB..N.<B~@<..
c030 : __ __ __ BYT 06 08 3e 08 08 08 00 00 00 3a 46 42 3e 02 3c 00 : ..>......:FB>.<.
c040 : __ __ __ BYT 40 40 5c 62 42 42 00 08 00 18 08 08 08 1c 00 00 : @@\bBB..........
c050 : __ __ __ BYT 04 00 0c 04 04 24 18 00 40 44 48 70 4c 42 00 00 : .....$..@DHpLB..
c060 : __ __ __ BYT 30 10 10 10 10 38 00 00 00 76 49 49 49 41 00 00 : 0....8...vIIIA..
c070 : __ __ __ BYT 00 58 64 42 42 42 85 50 01 42 85 78 06 5c 62 42 : .XdBBB.P.B.x.\bB
c080 : __ __ __ BYT 7c 40 40 87 50 01 02 84 10 01 40 84 0f 0d 00 3c : |@@.P.....@....<
c090 : __ __ __ BYT 40 3c 02 3c 00 00 10 7c 10 10 10 84 70 02 42 42 : @<.<...|....p.BB
c0a0 : __ __ __ BYT 86 88 15 44 44 44 28 10 00 00 00 41 41 49 2a 14 : ...DDD(....AAI*.
c0b0 : __ __ __ BYT 00 00 00 46 28 10 28 44 85 20 0e 46 3a 04 78 00 : ...F(.(D. .F:.x.
c0c0 : __ __ __ BYT 00 7e 04 18 20 7e 00 3c 20 84 01 84 60 86 01 02 : .~.. ~.< ...`...
c0d0 : __ __ __ BYT 3c 04 84 01 05 3c 00 00 18 24 84 7d 88 01 01 ff : <....<...$.}....
c0e0 : __ __ __ BYT 88 09 84 a6 07 00 00 10 00 24 24 48 85 10 16 12 : .........$$H....
c0f0 : __ __ __ BYT 12 7f 36 7f 24 24 00 08 3e 68 3c 16 7c 10 00 00 : ..6.$$..>h<.|...
c100 : __ __ __ BYT 44 08 10 20 44 84 3f 08 14 39 46 44 3b 00 04 08 : D.. D.?..9FD;...
c110 : __ __ __ BYT 84 84 1f 00 00 0c 10 20 20 20 10 0c 00 30 08 04 : .......   ...0..
c120 : __ __ __ BYT 04 04 08 30 00 00 2a 1c 7f 1c 2a 00 00 00 08 08 : ...0..*...*.....
c130 : __ __ __ BYT 3e 08 84 b7 84 01 01 08 85 2d 01 7e 8a 77 21 08 : >........-.~.w!.
c140 : __ __ __ BYT 00 00 02 04 08 10 20 40 00 3c 46 4a 52 62 42 3c : ...... @.<FJRbB<
c150 : __ __ __ BYT 00 08 18 28 08 08 08 3e 00 3c 42 02 0c 30 42 7e : ...(...>.<B..0B~
c160 : __ __ __ BYT 84 08 11 1c 02 42 3c 00 0c 10 24 44 7f 04 04 00 : .....B<...$D....
c170 : __ __ __ BYT 7e 40 7c 02 84 10 0c 3c 42 40 7c 42 42 3c 00 7e : ~@|....<B@|BB<.~
c180 : __ __ __ BYT 42 04 08 84 b3 03 3c 42 42 84 03 84 08 01 3e 84 : B.....<BB.....>.
c190 : __ __ __ BYT 20 85 5c 85 78 84 08 06 08 10 0c 10 20 40 84 a0 :  .\.x....... @..
c1a0 : __ __ __ BYT 84 7f 84 81 04 30 08 04 02 84 a8 84 68 02 10 00 : .....0......h...
c1b0 : __ __ __ BYT 86 c4 84 01 0b 18 24 42 7e 42 42 42 00 7c 42 42 : ......$B~BBB.|BB
c1c0 : __ __ __ BYT 84 03 84 68 14 40 40 42 3c 00 78 44 42 42 42 44 : ...h.@@B<.xDBBBD
c1d0 : __ __ __ BYT 78 00 7e 40 40 78 40 40 7e 87 08 01 40 84 20 01 : x.~@@x@@~...@. .
c1e0 : __ __ __ BYT 4e 84 78 02 42 42 86 38 02 1c 08 84 01 13 1c 00 : N.x.BB.8........
c1f0 : __ __ __ BYT 3e 02 02 02 02 22 1c 00 44 48 50 70 48 44 42 00 : >...."..DHPpHDB.
c200 : __ __ __ BYT 40 84 01 12 42 7e 00 41 63 55 49 41 41 41 00 42 : @...B~.AcUIAAA.B
c210 : __ __ __ BYT 62 52 4a 46 42 42 84 b0 01 42 84 40 84 6d 86 50 : bRJFBB...B.@.m.P
c220 : __ __ __ BYT 05 42 42 4a 44 3a 85 10 84 38 04 3c 42 40 3c 84 : .BBJD:...8.<B@<.
c230 : __ __ __ BYT d0 01 3e 85 58 01 08 84 68 85 30 17 22 22 22 22 : ..>.X...h.0.""""
c240 : __ __ __ BYT 14 14 08 00 41 41 41 49 55 63 41 00 41 22 14 08 : ....AAAIUcA.A"..
c250 : __ __ __ BYT 14 22 41 84 18 01 14 84 28 06 7e 02 04 08 10 20 : ."A.....(.~.... 
c260 : __ __ __ BYT 84 ea ff 01 ff 01 a8 01 1c c3 bd a5 a1 bf bd c3 : ................
c270 : __ __ __ BYT ff ff ff e3 fd c1 b9 c5 ff ff bf bf 83 bd 9d a3 : ................
c280 : __ __ __ BYT ff ff ff c3 bd 85 18 04 f9 fd c1 bd 84 18 05 ff : ................
c290 : __ __ __ BYT c3 bd 81 bf 84 10 43 f7 c1 f7 f7 f7 ff ff ff c5 : ......C.........
c2a0 : __ __ __ BYT b9 bd c1 fd c3 ff bf bf a3 9d bd bd ff ff f7 ff : ................
c2b0 : __ __ __ BYT e7 f7 f7 e3 ff ff fb ff f3 fb fb db e7 ff bf bb : ................
c2c0 : __ __ __ BYT b7 8f b3 bd ff ff cf ef ef ef ef c7 ff ff ff 89 : ................
c2d0 : __ __ __ BYT b6 b6 b6 be ff ff ff 87 bb bd 84 30 84 40 85 78 : ...........0.@.x
c2e0 : __ __ __ BYT 06 a3 9d bd 83 bf bf 87 50 01 fd 84 10 01 bf 84 : ........P.......
c2f0 : __ __ __ BYT 0f 0d ff c3 bf c3 fd c3 ff ff ef 83 ef ef ef 84 : ................
c300 : __ __ __ BYT 70 02 bd bd 86 88 15 bb bb bb d7 ef ff ff ff be : p...............
c310 : __ __ __ BYT be b6 d5 eb ff ff ff b9 d7 ef d7 bb 85 20 0e b9 : ............. ..
c320 : __ __ __ BYT c5 fb 87 ff ff 81 fb e7 df 81 ff c3 df 84 01 84 : ................
c330 : __ __ __ BYT 60 86 01 02 c3 fb 84 01 05 c3 ff ff e7 db 84 7d : `..............}
c340 : __ __ __ BYT 88 01 01 00 88 09 84 a6 07 ff ff ef ff db db b7 : ................
c350 : __ __ __ BYT 85 10 16 ed ed 80 c9 80 db db ff f7 c1 97 c3 e9 : ................
c360 : __ __ __ BYT 83 ef ff ff bb f7 ef df bb 84 3f 08 eb c6 b9 bb : ..........?.....
c370 : __ __ __ BYT c4 ff fb f7 84 84 1f ff ff f3 ef df df df ef f3 : ................
c380 : __ __ __ BYT ff cf f7 fb fb fb f7 cf ff ff d5 e3 80 e3 d5 ff : ................
c390 : __ __ __ BYT ff ff f7 f7 c1 f7 84 b7 84 01 01 f7 85 2d 01 81 : .............-..
c3a0 : __ __ __ BYT 8a 77 21 f7 ff ff fd fb f7 ef df bf ff c3 b9 b5 : .w!.............
c3b0 : __ __ __ BYT ad 9d bd c3 ff f7 e7 d7 f7 f7 f7 c1 ff c3 bd fd : ................
c3c0 : __ __ __ BYT f3 cf bd 81 84 08 11 e3 fd bd c3 ff f3 ef db bb : ................
c3d0 : __ __ __ BYT 80 fb fb ff 81 bf 83 fd 84 10 0c c3 bd bf 83 bd : ................
c3e0 : __ __ __ BYT bd c3 ff 81 bd fb f7 84 b3 03 c3 bd bd 84 03 84 : ................
c3f0 : __ __ __ BYT 08 01 c1 84 20 85 5c 85 78 84 08 06 f7 ef f3 ef : .... .\.x.......
c400 : __ __ __ BYT df bf 84 a0 84 7f 84 81 04 cf f7 fb fd 84 a8 84 : ................
c410 : __ __ __ BYT 68 02 ef ff 86 c4 84 01 0b e7 db bd 81 bd bd bd : h...............
c420 : __ __ __ BYT ff 83 bd bd 84 03 84 68 14 bf bf bd c3 ff 87 bb : .......h........
c430 : __ __ __ BYT bd bd bd bb 87 ff 81 bf bf 87 bf bf 81 87 08 01 : ................
c440 : __ __ __ BYT bf 84 20 01 b1 84 78 02 bd bd 86 38 02 e3 f7 84 : .. ...x....8....
c450 : __ __ __ BYT 01 13 e3 ff c1 fd fd fd fd dd e3 ff bb b7 af 8f : ................
c460 : __ __ __ BYT b7 bb bd ff bf 84 01 12 bd 81 ff be 9c aa b6 be : ................
c470 : __ __ __ BYT be be ff bd 9d ad b5 b9 bd bd 84 b0 01 bd 84 40 : ...............@
c480 : __ __ __ BYT 84 6d 86 50 05 bd bd b5 bb c5 85 10 84 38 04 c3 : .m.P.........8..
c490 : __ __ __ BYT bd bf c3 84 d0 01 c1 85 58 01 f7 84 68 85 30 17 : ........X...h.0.
c4a0 : __ __ __ BYT dd dd dd dd eb eb f7 ff be be be b6 aa 9c be ff : ................
c4b0 : __ __ __ BYT be dd eb f7 eb dd be 84 18 01 eb 84 28 06 81 fd : ............(...
c4c0 : __ __ __ BYT fb f7 ef df 84 ea ff 01 ff 01 a8 01 00          : .............
