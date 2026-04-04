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
080e : 8e 82 0b STX $0b82 ; (spentry + 0)
0811 : a2 0b __ LDX #$0b
0813 : a0 84 __ LDY #$84
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
082a : c0 84 __ CPY #$84
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
;  35, "/home/honza/projects/c64/projects/oscar64/samples/memmap/charsetcopy.c"
.s4:
0a00 : 20 7b 0a JSR $0a7b ; (mmap_trampoline.s4 + 0)
0a03 : a9 00 __ LDA #$00
0a05 : 85 11 __ STA P4 
0a07 : 85 45 __ STA T1 + 0 
0a09 : 85 0d __ STA P0 
0a0b : a9 30 __ LDA #$30
0a0d : 85 01 __ STA $01 
0a0f : a9 08 __ LDA #$08
0a11 : 85 12 __ STA P5 
0a13 : a9 c0 __ LDA #$c0
0a15 : 85 10 __ STA P3 
0a17 : a9 d0 __ LDA #$d0
0a19 : 85 0e __ STA P1 
0a1b : a9 00 __ LDA #$00
0a1d : 85 0f __ STA P2 
0a1f : 20 c5 0a JSR $0ac5 ; (memcpy.s4 + 0)
0a22 : a9 00 __ LDA #$00
0a24 : 85 44 __ STA T0 + 1 
0a26 : 85 0d __ STA P0 
0a28 : 85 10 __ STA P3 
0a2a : 85 43 __ STA T0 + 0 
0a2c : 85 0e __ STA P1 
0a2e : a9 36 __ LDA #$36
0a30 : 85 01 __ STA $01 
0a32 : a9 cc __ LDA #$cc
0a34 : 85 46 __ STA T1 + 1 
0a36 : 85 0f __ STA P2 
0a38 : a9 d0 __ LDA #$d0
0a3a : 85 11 __ STA P4 
0a3c : 20 f4 0a JSR $0af4 ; (vic_setmode.s4 + 0)
.l5:
0a3f : a9 00 __ LDA #$00
0a41 : a4 45 __ LDY T1 + 0 
0a43 : 85 45 __ STA T1 + 0 
0a45 : a6 43 __ LDX T0 + 0 
.l7:
0a47 : 8a __ __ TXA
0a48 : 91 45 __ STA (T1 + 0),y 
0a4a : c8 __ __ INY
0a4b : d0 02 __ BNE $0a4f ; (main.s10 + 0)
.s9:
0a4d : e6 46 __ INC T1 + 1 
.s10:
0a4f : e8 __ __ INX
0a50 : d0 02 __ BNE $0a54 ; (main.s12 + 0)
.s11:
0a52 : e6 44 __ INC T0 + 1 
.s12:
0a54 : a5 44 __ LDA T0 + 1 
0a56 : c9 03 __ CMP #$03
0a58 : d0 ed __ BNE $0a47 ; (main.l7 + 0)
.s8:
0a5a : 86 43 __ STX T0 + 0 
0a5c : 84 45 __ STY T1 + 0 
0a5e : e0 e8 __ CPX #$e8
0a60 : d0 dd __ BNE $0a3f ; (main.l5 + 0)
.s6:
0a62 : 20 46 0b JSR $0b46 ; (getpch.s4 + 0)
0a65 : a9 04 __ LDA #$04
0a67 : 85 0f __ STA P2 
0a69 : a9 10 __ LDA #$10
0a6b : 85 11 __ STA P4 
0a6d : 20 f4 0a JSR $0af4 ; (vic_setmode.s4 + 0)
0a70 : a9 00 __ LDA #$00
0a72 : 85 1b __ STA ACCU + 0 
0a74 : 85 1c __ STA ACCU + 1 
0a76 : a9 37 __ LDA #$37
0a78 : 85 01 __ STA $01 
.s3:
0a7a : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
0a7b : a9 90 __ LDA #$90
0a7d : 8d fa ff STA $fffa 
0a80 : a9 0a __ LDA #$0a
0a82 : 8d fb ff STA $fffb 
0a85 : a9 ae __ LDA #$ae
0a87 : 8d fe ff STA $fffe 
0a8a : a9 0a __ LDA #$0a
0a8c : 8d ff ff STA $ffff 
.s3:
0a8f : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
0a90 : 48 __ __ PHA
0a91 : 8a __ __ TXA
0a92 : 48 __ __ PHA
0a93 : a9 0a __ LDA #$0a
0a95 : 48 __ __ PHA
0a96 : a9 a7 __ LDA #$a7
0a98 : 48 __ __ PHA
0a99 : ba __ __ TSX
0a9a : bd 05 01 LDA $0105,x 
0a9d : 48 __ __ PHA
0a9e : a6 01 __ LDX $01 
0aa0 : a9 36 __ LDA #$36
0aa2 : 85 01 __ STA $01 
0aa4 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
0aa7 : 86 01 __ STX $01 
0aa9 : 68 __ __ PLA
0aaa : aa __ __ TAX
0aab : 68 __ __ PLA
0aac : 40 __ __ RTI
0aad : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
0aae : 48 __ __ PHA
0aaf : 8a __ __ TXA
0ab0 : 48 __ __ PHA
0ab1 : a9 0a __ LDA #$0a
0ab3 : 48 __ __ PHA
0ab4 : a9 a7 __ LDA #$a7
0ab6 : 48 __ __ PHA
0ab7 : ba __ __ TSX
0ab8 : bd 05 01 LDA $0105,x 
0abb : 48 __ __ PHA
0abc : a6 01 __ LDX $01 
0abe : a9 36 __ LDA #$36
0ac0 : 85 01 __ STA $01 
0ac2 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void*
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
0ac5 : a6 12 __ LDX P5 
0ac7 : f0 10 __ BEQ $0ad9 ; (memcpy.s4 + 20)
0ac9 : a0 00 __ LDY #$00
0acb : b1 0f __ LDA (P2),y 
0acd : 91 0d __ STA (P0),y ; (dst + 0)
0acf : c8 __ __ INY
0ad0 : d0 f9 __ BNE $0acb ; (memcpy.s4 + 6)
0ad2 : e6 10 __ INC P3 
0ad4 : e6 0e __ INC P1 ; (dst + 1)
0ad6 : ca __ __ DEX
0ad7 : d0 f2 __ BNE $0acb ; (memcpy.s4 + 6)
0ad9 : a4 11 __ LDY P4 
0adb : f0 0e __ BEQ $0aeb ; (memcpy.s4 + 38)
0add : 88 __ __ DEY
0ade : f0 07 __ BEQ $0ae7 ; (memcpy.s4 + 34)
0ae0 : b1 0f __ LDA (P2),y 
0ae2 : 91 0d __ STA (P0),y ; (dst + 0)
0ae4 : 88 __ __ DEY
0ae5 : d0 f9 __ BNE $0ae0 ; (memcpy.s4 + 27)
0ae7 : b1 0f __ LDA (P2),y 
0ae9 : 91 0d __ STA (P0),y ; (dst + 0)
0aeb : a5 0d __ LDA P0 ; (dst + 0)
0aed : 85 1b __ STA ACCU + 0 
0aef : a5 0e __ LDA P1 ; (dst + 1)
0af1 : 85 1c __ STA ACCU + 1 
.s3:
0af3 : 60 __ __ RTS
--------------------------------------------------------------------
vic_setmode: ; vic_setmode(enum VicMode,const u8*,const u8*)->void
;  94, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0af4 : a4 0d __ LDY P0 ; (mode + 0)
0af6 : c0 02 __ CPY #$02
0af8 : d0 09 __ BNE $0b03 ; (vic_setmode.s5 + 0)
.s10:
0afa : a9 5b __ LDA #$5b
0afc : 8d 11 d0 STA $d011 
.s8:
0aff : a9 08 __ LDA #$08
0b01 : d0 0c __ BNE $0b0f ; (vic_setmode.s7 + 0)
.s5:
0b03 : b0 36 __ BCS $0b3b ; (vic_setmode.s6 + 0)
.s9:
0b05 : a9 1b __ LDA #$1b
0b07 : 8d 11 d0 STA $d011 
0b0a : 98 __ __ TYA
0b0b : f0 f2 __ BEQ $0aff ; (vic_setmode.s8 + 0)
.s11:
0b0d : a9 18 __ LDA #$18
.s7:
0b0f : 8d 16 d0 STA $d016 
0b12 : ad 00 dd LDA $dd00 
0b15 : 29 fc __ AND #$fc
0b17 : 85 1b __ STA ACCU + 0 
0b19 : a5 0f __ LDA P2 ; (text + 1)
0b1b : 0a __ __ ASL
0b1c : 2a __ __ ROL
0b1d : 29 01 __ AND #$01
0b1f : 2a __ __ ROL
0b20 : 49 03 __ EOR #$03
0b22 : 05 1b __ ORA ACCU + 0 
0b24 : 8d 00 dd STA $dd00 
0b27 : a5 0f __ LDA P2 ; (text + 1)
0b29 : 29 3c __ AND #$3c
0b2b : 0a __ __ ASL
0b2c : 0a __ __ ASL
0b2d : 85 1b __ STA ACCU + 0 
0b2f : a5 11 __ LDA P4 ; (font + 1)
0b31 : 29 38 __ AND #$38
0b33 : 4a __ __ LSR
0b34 : 4a __ __ LSR
0b35 : 05 1b __ ORA ACCU + 0 
0b37 : 8d 18 d0 STA $d018 
.s3:
0b3a : 60 __ __ RTS
.s6:
0b3b : a9 3b __ LDA #$3b
0b3d : 8d 11 d0 STA $d011 
0b40 : c0 03 __ CPY #$03
0b42 : d0 c9 __ BNE $0b0d ; (vic_setmode.s11 + 0)
0b44 : f0 b9 __ BEQ $0aff ; (vic_setmode.s8 + 0)
--------------------------------------------------------------------
getpch: ; getpch()->u8
;  70, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
0b46 : 20 cf ff JSR $ffcf 
0b49 : 85 1b __ STA ACCU + 0 
0b4b : a5 1b __ LDA ACCU + 0 
0b4d : 4c 50 0b JMP $0b50 ; (convch.s4 + 0)
--------------------------------------------------------------------
convch: ; convch(u8)->u8
; 242, "/home/honza/projects/c64/projects/oscar64/include/conio.c"
.s4:
0b50 : a8 __ __ TAY
0b51 : ad 83 0b LDA $0b83 ; (giocharmap + 0)
0b54 : f0 27 __ BEQ $0b7d ; (convch.s5 + 0)
.s6:
0b56 : c0 0d __ CPY #$0d
0b58 : d0 03 __ BNE $0b5d ; (convch.s7 + 0)
.s16:
0b5a : a9 0a __ LDA #$0a
.s3:
0b5c : 60 __ __ RTS
.s7:
0b5d : c9 02 __ CMP #$02
0b5f : 90 1c __ BCC $0b7d ; (convch.s5 + 0)
.s8:
0b61 : 98 __ __ TYA
0b62 : c0 41 __ CPY #$41
0b64 : 90 17 __ BCC $0b7d ; (convch.s5 + 0)
.s9:
0b66 : c9 db __ CMP #$db
0b68 : b0 13 __ BCS $0b7d ; (convch.s5 + 0)
.s10:
0b6a : c9 c1 __ CMP #$c1
0b6c : 90 03 __ BCC $0b71 ; (convch.s11 + 0)
.s15:
0b6e : 49 a0 __ EOR #$a0
0b70 : a8 __ __ TAY
.s11:
0b71 : c9 7b __ CMP #$7b
0b73 : b0 08 __ BCS $0b7d ; (convch.s5 + 0)
.s12:
0b75 : c9 61 __ CMP #$61
0b77 : b0 06 __ BCS $0b7f ; (convch.s14 + 0)
.s13:
0b79 : c9 5b __ CMP #$5b
0b7b : 90 02 __ BCC $0b7f ; (convch.s14 + 0)
.s5:
0b7d : 98 __ __ TYA
0b7e : 60 __ __ RTS
.s14:
0b7f : 49 20 __ EOR #$20
0b81 : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0b82 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
0b83 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
charset:
c000 : __ __ __ BYT 3c 42 5a 5e 40 42 3c 00 00 00 1c 02 3e 46 3a 00 : <BZ^@B<.....>F:.
c010 : __ __ __ BYT 00 40 40 7c 42 62 5c 00 00 00 3c 42 40 42 3c 00 : .@@|Bb\...<B@B<.
c020 : __ __ __ BYT 02 02 3a 46 42 46 3a 00 00 00 3c 42 7e 40 3c 00 : ..:FBF:...<B~@<.
c030 : __ __ __ BYT 00 06 08 3e 08 08 08 00 00 00 3a 46 42 3e 02 3c : ...>......:FB>.<
c040 : __ __ __ BYT 00 40 40 5c 62 42 42 00 08 00 18 08 08 08 1c 00 : .@@\bBB.........
c050 : __ __ __ BYT 00 04 00 0c 04 04 24 18 00 40 44 48 70 4c 42 00 : ......$..@DHpLB.
c060 : __ __ __ BYT 00 30 10 10 10 10 38 00 00 00 76 49 49 49 41 00 : .0....8...vIIIA.
c070 : __ __ __ BYT 00 00 58 64 42 42 42 00 00 00 3c 42 42 42 3c 00 : ..XdBBB...<BBB<.
c080 : __ __ __ BYT 00 00 5c 62 42 7c 40 40 00 00 3a 46 42 3e 02 02 : ..\bB|@@..:FB>..
c090 : __ __ __ BYT 00 00 5c 62 40 40 40 00 00 00 3c 40 3c 02 3c 00 : ..\b@@@...<@<.<.
c0a0 : __ __ __ BYT 00 10 7c 10 10 10 08 00 00 00 42 42 42 46 3a 00 : ..|.......BBBF:.
c0b0 : __ __ __ BYT 00 00 44 44 44 28 10 00 00 00 41 41 49 2a 14 00 : ..DDD(....AAI*..
c0c0 : __ __ __ BYT 00 00 46 28 10 28 44 00 00 00 42 42 46 3a 04 78 : ..F(.(D...BBF:.x
c0d0 : __ __ __ BYT 00 00 7e 04 18 20 7e 00 3c 20 20 20 20 20 3c 00 : ..~.. ~.<     <.
c0e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 3c 04 04 04 04 04 3c 00 : ........<.....<.
c0f0 : __ __ __ BYT 00 18 24 42 00 00 00 00 00 00 00 00 00 00 00 ff : ..$B............
c100 : __ __ __ BYT 00 00 00 00 00 00 00 00 10 10 10 10 00 00 10 00 : ................
c110 : __ __ __ BYT 24 24 48 00 00 00 00 00 12 12 7f 36 7f 24 24 00 : $$H........6.$$.
c120 : __ __ __ BYT 08 3e 68 3c 16 7c 10 00 00 44 08 10 20 44 00 00 : .>h<.|...D.. D..
c130 : __ __ __ BYT 18 24 14 39 46 44 3b 00 04 08 10 00 00 00 00 00 : .$.9FD;.........
c140 : __ __ __ BYT 0c 10 20 20 20 10 0c 00 30 08 04 04 04 08 30 00 : ..   ...0.....0.
c150 : __ __ __ BYT 00 2a 1c 7f 1c 2a 00 00 00 08 08 3e 08 08 00 00 : .*...*.....>....
c160 : __ __ __ BYT 00 00 00 00 00 08 08 10 00 00 00 7e 00 00 00 00 : ...........~....
c170 : __ __ __ BYT 00 00 00 00 00 00 08 00 00 02 04 08 10 20 40 00 : ............. @.
c180 : __ __ __ BYT 3c 46 4a 52 62 42 3c 00 08 18 28 08 08 08 3e 00 : <FJRbB<...(...>.
c190 : __ __ __ BYT 3c 42 02 0c 30 42 7e 00 3c 42 02 1c 02 42 3c 00 : <B..0B~.<B...B<.
c1a0 : __ __ __ BYT 0c 10 24 44 7f 04 04 00 7e 40 7c 02 02 42 3c 00 : ..$D....~@|..B<.
c1b0 : __ __ __ BYT 3c 42 40 7c 42 42 3c 00 7e 42 04 08 10 10 10 00 : <B@|BB<.~B......
c1c0 : __ __ __ BYT 3c 42 42 3c 42 42 3c 00 3c 42 42 3e 02 42 3c 00 : <BB<BB<.<BB>.B<.
c1d0 : __ __ __ BYT 00 00 08 00 00 08 00 00 00 00 08 00 00 08 08 10 : ................
c1e0 : __ __ __ BYT 0c 10 20 40 20 10 0c 00 00 00 7e 00 7e 00 00 00 : .. @ .....~.~...
c1f0 : __ __ __ BYT 30 08 04 02 04 08 30 00 3c 42 02 0c 10 00 10 00 : 0.....0.<B......
c200 : __ __ __ BYT 00 00 00 00 00 00 00 00 18 24 42 7e 42 42 42 00 : .........$B~BBB.
c210 : __ __ __ BYT 7c 42 42 7c 42 42 7c 00 3c 42 40 40 40 42 3c 00 : |BB|BB|.<B@@@B<.
c220 : __ __ __ BYT 78 44 42 42 42 44 78 00 7e 40 40 78 40 40 7e 00 : xDBBBDx.~@@x@@~.
c230 : __ __ __ BYT 7e 40 40 78 40 40 40 00 3c 42 40 4e 42 42 3c 00 : ~@@x@@@.<B@NBB<.
c240 : __ __ __ BYT 42 42 42 7e 42 42 42 00 1c 08 08 08 08 08 1c 00 : BBB~BBB.........
c250 : __ __ __ BYT 3e 02 02 02 02 22 1c 00 44 48 50 70 48 44 42 00 : >...."..DHPpHDB.
c260 : __ __ __ BYT 40 40 40 40 40 42 7e 00 41 63 55 49 41 41 41 00 : @@@@@B~.AcUIAAA.
c270 : __ __ __ BYT 42 62 52 4a 46 42 42 00 3c 42 42 42 42 42 3c 00 : BbRJFBB.<BBBBB<.
c280 : __ __ __ BYT 7c 42 42 7c 40 40 40 00 3c 42 42 42 4a 44 3a 00 : |BB|@@@.<BBBJD:.
c290 : __ __ __ BYT 7c 42 42 7c 48 44 42 00 3c 42 40 3c 02 42 3c 00 : |BB|HDB.<B@<.B<.
c2a0 : __ __ __ BYT 3e 08 08 08 08 08 08 00 42 42 42 42 42 42 3c 00 : >.......BBBBBB<.
c2b0 : __ __ __ BYT 22 22 22 22 14 14 08 00 41 41 41 49 55 63 41 00 : """"....AAAIUcA.
c2c0 : __ __ __ BYT 41 22 14 08 14 22 41 00 22 22 22 14 08 08 08 00 : A"..."A.""".....
c2d0 : __ __ __ BYT 7e 02 04 08 10 20 7e 00 00 00 00 00 00 00 00 00 : ~.... ~.........
c2e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c2f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c300 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c310 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c320 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c330 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c340 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c350 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c360 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c370 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c380 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c390 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c3a0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c3b0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c3c0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c3d0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c3e0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c3f0 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
c400 : __ __ __ BYT c3 bd a5 a1 bf bd c3 ff ff ff e3 fd c1 b9 c5 ff : ................
c410 : __ __ __ BYT ff bf bf 83 bd 9d a3 ff ff ff c3 bd bf bd c3 ff : ................
c420 : __ __ __ BYT ff f9 fd c1 bd b9 c5 ff ff ff c3 bd 81 bf c3 ff : ................
c430 : __ __ __ BYT ff f9 f7 c1 f7 f7 f7 ff ff ff c5 b9 bd c1 fd c3 : ................
c440 : __ __ __ BYT ff bf bf a3 9d bd bd ff ff f7 ff e7 f7 f7 e3 ff : ................
c450 : __ __ __ BYT ff fb ff f3 fb fb db e7 ff bf bb b7 8f b3 bd ff : ................
c460 : __ __ __ BYT ff cf ef ef ef ef c7 ff ff ff 89 b6 b6 b6 be ff : ................
c470 : __ __ __ BYT ff ff 87 bb bd bd bd ff ff ff c5 b9 bd bd c3 ff : ................
c480 : __ __ __ BYT ff ff a3 9d bd 83 bf bf ff ff c5 b9 bd c1 fd fd : ................
c490 : __ __ __ BYT ff ff a3 9d bf bf bf ff ff ff c3 bf c3 fd c3 ff : ................
c4a0 : __ __ __ BYT ff ef 83 ef ef ef f7 ff ff ff bd bd bd b9 c5 ff : ................
c4b0 : __ __ __ BYT ff ff bb bb bb d7 ef ff ff ff be be b6 d5 eb ff : ................
c4c0 : __ __ __ BYT ff ff b9 d7 ef d7 bb ff ff ff bd bd b9 c5 fb 87 : ................
c4d0 : __ __ __ BYT ff ff 81 fb e7 df 81 ff c3 df df df df df c3 ff : ................
c4e0 : __ __ __ BYT ff ff ff ff ff ff ff ff c3 fb fb fb fb fb c3 ff : ................
c4f0 : __ __ __ BYT ff e7 db bd ff ff ff ff ff ff ff ff ff ff ff 00 : ................
c500 : __ __ __ BYT ff ff ff ff ff ff ff ff ef ef ef ef ff ff ef ff : ................
c510 : __ __ __ BYT db db b7 ff ff ff ff ff ed ed 80 c9 80 db db ff : ................
c520 : __ __ __ BYT f7 c1 97 c3 e9 83 ef ff ff bb f7 ef df bb ff ff : ................
c530 : __ __ __ BYT e7 db eb c6 b9 bb c4 ff fb f7 ef ff ff ff ff ff : ................
c540 : __ __ __ BYT f3 ef df df df ef f3 ff cf f7 fb fb fb f7 cf ff : ................
c550 : __ __ __ BYT ff d5 e3 80 e3 d5 ff ff ff f7 f7 c1 f7 f7 ff ff : ................
c560 : __ __ __ BYT ff ff ff ff ff f7 f7 ef ff ff ff 81 ff ff ff ff : ................
c570 : __ __ __ BYT ff ff ff ff ff ff f7 ff ff fd fb f7 ef df bf ff : ................
c580 : __ __ __ BYT c3 b9 b5 ad 9d bd c3 ff f7 e7 d7 f7 f7 f7 c1 ff : ................
c590 : __ __ __ BYT c3 bd fd f3 cf bd 81 ff c3 bd fd e3 fd bd c3 ff : ................
c5a0 : __ __ __ BYT f3 ef db bb 80 fb fb ff 81 bf 83 fd fd bd c3 ff : ................
c5b0 : __ __ __ BYT c3 bd bf 83 bd bd c3 ff 81 bd fb f7 ef ef ef ff : ................
c5c0 : __ __ __ BYT c3 bd bd c3 bd bd c3 ff c3 bd bd c1 fd bd c3 ff : ................
c5d0 : __ __ __ BYT ff ff f7 ff ff f7 ff ff ff ff f7 ff ff f7 f7 ef : ................
c5e0 : __ __ __ BYT f3 ef df bf df ef f3 ff ff ff 81 ff 81 ff ff ff : ................
c5f0 : __ __ __ BYT cf f7 fb fd fb f7 cf ff c3 bd fd f3 ef ff ef ff : ................
c600 : __ __ __ BYT ff ff ff ff ff ff ff ff e7 db bd 81 bd bd bd ff : ................
c610 : __ __ __ BYT 83 bd bd 83 bd bd 83 ff c3 bd bf bf bf bd c3 ff : ................
c620 : __ __ __ BYT 87 bb bd bd bd bb 87 ff 81 bf bf 87 bf bf 81 ff : ................
c630 : __ __ __ BYT 81 bf bf 87 bf bf bf ff c3 bd bf b1 bd bd c3 ff : ................
c640 : __ __ __ BYT bd bd bd 81 bd bd bd ff e3 f7 f7 f7 f7 f7 e3 ff : ................
c650 : __ __ __ BYT c1 fd fd fd fd dd e3 ff bb b7 af 8f b7 bb bd ff : ................
c660 : __ __ __ BYT bf bf bf bf bf bd 81 ff be 9c aa b6 be be be ff : ................
c670 : __ __ __ BYT bd 9d ad b5 b9 bd bd ff c3 bd bd bd bd bd c3 ff : ................
c680 : __ __ __ BYT 83 bd bd 83 bf bf bf ff c3 bd bd bd b5 bb c5 ff : ................
c690 : __ __ __ BYT 83 bd bd 83 b7 bb bd ff c3 bd bf c3 fd bd c3 ff : ................
c6a0 : __ __ __ BYT c1 f7 f7 f7 f7 f7 f7 ff bd bd bd bd bd bd c3 ff : ................
c6b0 : __ __ __ BYT dd dd dd dd eb eb f7 ff be be be b6 aa 9c be ff : ................
c6c0 : __ __ __ BYT be dd eb f7 eb dd be ff dd dd dd eb f7 f7 f7 ff : ................
c6d0 : __ __ __ BYT 81 fd fb f7 ef df 81 ff ff ff ff ff ff ff ff ff : ................
c6e0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c6f0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c700 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c710 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c720 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c730 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c740 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c750 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c760 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c770 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c780 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c790 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c7a0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c7b0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c7c0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c7d0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c7e0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
c7f0 : __ __ __ BYT ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff : ................
