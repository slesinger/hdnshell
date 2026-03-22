; Compiled with 1.32.268
--------------------------------------------------------------------
eused:
00f7 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
efree:
00f9 : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
iused:
00fb : __ __ __ BYT 00 00                                           : ..
--------------------------------------------------------------------
ifree:
00fd : __ __ __ BYT 00 00                                           : ..
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
080e : 8e fe 1d STX $1dfe ; (spentry + 0)
0811 : a2 42 __ LDX #$42
0813 : a0 b8 __ LDY #$b8
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 47 __ CPX #$47
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 10 __ CPY #$10
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 ff __ CPX #$ff
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 b0 __ LDA #$b0
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
; 799, "/home/honza/projects/c64/projects/oscar64/samples/games/missile.c"
.s1:
0a00 : a2 09 __ LDX #$09
0a02 : b5 53 __ LDA T0 + 0,x 
0a04 : 9d b2 c7 STA $c7b2,x ; (main@stack + 0)
0a07 : ca __ __ DEX
0a08 : 10 f8 __ BPL $0a02 ; (main.s1 + 2)
.s4:
0a0a : a9 7f __ LDA #$7f
0a0c : 8d 0d dc STA $dc0d 
0a0f : 8d 0d dd STA $dd0d 
0a12 : 8d 00 dc STA $dc00 
0a15 : a9 08 __ LDA #$08
0a17 : 8d 0e dc STA $dc0e 
0a1a : 8d 0f dc STA $dc0f 
0a1d : 8d 0e dd STA $dd0e 
0a20 : 8d 0f dd STA $dd0f 
0a23 : a9 00 __ LDA #$00
0a25 : 8d 03 dc STA $dc03 
0a28 : 8d 03 dd STA $dd03 
0a2b : a9 ff __ LDA #$ff
0a2d : 8d 02 dc STA $dc02 
0a30 : a9 07 __ LDA #$07
0a32 : 8d 00 dd STA $dd00 
0a35 : a9 3f __ LDA #$3f
0a37 : 8d 02 dd STA $dd02 
0a3a : a9 0f __ LDA #$0f
0a3c : 8d fa ff STA $fffa 
0a3f : a9 1d __ LDA #$1d
0a41 : 8d fb ff STA $fffb 
0a44 : a9 2d __ LDA #$2d
0a46 : 8d fe ff STA $fffe 
0a49 : a9 1d __ LDA #$1d
0a4b : 8d ff ff STA $ffff 
0a4e : ad 0d dc LDA $dc0d 
0a51 : ad 0d dd LDA $dd0d 
0a54 : a9 00 __ LDA #$00
0a56 : 85 11 __ STA P4 
0a58 : 85 0d __ STA P0 
0a5a : a9 30 __ LDA #$30
0a5c : 85 01 __ STA $01 
0a5e : a9 04 __ LDA #$04
0a60 : 85 12 __ STA P5 
0a62 : a9 3a __ LDA #$3a
0a64 : 85 10 __ STA P3 
0a66 : a9 d0 __ LDA #$d0
0a68 : 85 0e __ STA P1 
0a6a : a9 c3 __ LDA #$c3
0a6c : 85 0f __ STA P2 
0a6e : 20 44 1d JSR $1d44 ; (memcpy.s4 + 0)
0a71 : a9 00 __ LDA #$00
0a73 : 85 11 __ STA P4 
0a75 : 85 0d __ STA P0 
0a77 : a9 08 __ LDA #$08
0a79 : 85 12 __ STA P5 
0a7b : a9 3e __ LDA #$3e
0a7d : 85 10 __ STA P3 
0a7f : a9 d8 __ LDA #$d8
0a81 : 85 0e __ STA P1 
0a83 : a9 c3 __ LDA #$c3
0a85 : 85 0f __ STA P2 
0a87 : 20 44 1d JSR $1d44 ; (memcpy.s4 + 0)
0a8a : a9 00 __ LDA #$00
0a8c : 85 0f __ STA P2 
0a8e : 85 10 __ STA P3 
0a90 : a9 35 __ LDA #$35
0a92 : 85 01 __ STA $01 
0a94 : a9 40 __ LDA #$40
0a96 : 85 11 __ STA P4 
0a98 : a9 1f __ LDA #$1f
0a9a : 85 12 __ STA P5 
0a9c : a9 18 __ LDA #$18
0a9e : a2 fa __ LDX #$fa
.l6:
0aa0 : ca __ __ DEX
0aa1 : 9d 00 c8 STA $c800,x 
0aa4 : 9d fa c8 STA $c8fa,x 
0aa7 : 9d f4 c9 STA $c9f4,x 
0aaa : 9d ee ca STA $caee,x 
0aad : d0 f1 __ BNE $0aa0 ; (main.l6 + 0)
.s5:
0aaf : a9 06 __ LDA #$06
0ab1 : a2 fa __ LDX #$fa
.l8:
0ab3 : ca __ __ DEX
0ab4 : 9d 00 d8 STA $d800,x 
0ab7 : 9d fa d8 STA $d8fa,x 
0aba : 9d f4 d9 STA $d9f4,x 
0abd : 9d ee da STA $daee,x 
0ac0 : d0 f1 __ BNE $0ab3 ; (main.l8 + 0)
.s7:
0ac2 : a9 00 __ LDA #$00
0ac4 : 85 0d __ STA P0 
0ac6 : a9 e0 __ LDA #$e0
0ac8 : 85 0e __ STA P1 
0aca : 20 6b 1d JSR $1d6b ; (memset.s4 + 0)
0acd : a9 07 __ LDA #$07
0acf : a2 50 __ LDX #$50
.l9:
0ad1 : ca __ __ DEX
0ad2 : 9d 98 db STA $db98,x 
0ad5 : d0 fa __ BNE $0ad1 ; (main.l9 + 0)
.s10:
0ad7 : 20 87 1d JSR $1d87 ; (rirq_init_kernal.s4 + 0)
0ada : a9 00 __ LDA #$00
0adc : 8d fd 42 STA $42fd ; (sbm.data + 0)
0adf : 8d 29 43 STA $4329 ; (bottom.code[0] + 3)
0ae2 : 8d 34 43 STA $4334 ; (bottom.code[0] + 14)
0ae5 : 8d 09 43 STA $4309 ; (top.code[0] + 3)
0ae8 : 8d 14 43 STA $4314 ; (top.code[0] + 14)
0aeb : a9 03 __ LDA #$03
0aed : 8d 25 43 STA $4325 ; (bottom.size + 0)
0af0 : 8d 05 43 STA $4305 ; (top.size + 0)
0af3 : a9 e0 __ LDA #$e0
0af5 : 8d fe 42 STA $42fe ; (sbm.data + 1)
0af8 : a9 19 __ LDA #$19
0afa : 8d 02 43 STA $4302 ; (sbm.cheight + 0)
0afd : a9 40 __ LDA #$40
0aff : 8d 03 43 STA $4303 ; (sbm.width + 0)
0b02 : a9 01 __ LDA #$01
0b04 : 8d 04 43 STA $4304 ; (sbm.width + 1)
0b07 : a9 fc __ LDA #$fc
0b09 : 8d ef 41 STA $41ef ; (rasterIRQRows[0] + 1)
0b0c : a9 a0 __ LDA #$a0
0b0e : 8d 26 43 STA $4326 ; (bottom.code[0] + 0)
0b11 : 8d 06 43 STA $4306 ; (top.code[0] + 0)
0b14 : a9 a2 __ LDA #$a2
0b16 : 8d 28 43 STA $4328 ; (bottom.code[0] + 2)
0b19 : 8d 08 43 STA $4308 ; (top.code[0] + 2)
0b1c : a9 cd __ LDA #$cd
0b1e : 8d 2a 43 STA $432a ; (bottom.code[0] + 4)
0b21 : 8d 0a 43 STA $430a ; (top.code[0] + 4)
0b24 : a9 12 __ LDA #$12
0b26 : 8d 2b 43 STA $432b ; (bottom.code[0] + 5)
0b29 : 8d 0b 43 STA $430b ; (top.code[0] + 5)
0b2c : a9 d0 __ LDA #$d0
0b2e : 8d 2c 43 STA $432c ; (bottom.code[0] + 6)
0b31 : 8d 0c 43 STA $430c ; (top.code[0] + 6)
0b34 : a9 b0 __ LDA #$b0
0b36 : 8d 2d 43 STA $432d ; (bottom.code[0] + 7)
0b39 : 8d 0d 43 STA $430d ; (top.code[0] + 7)
0b3c : a9 fb __ LDA #$fb
0b3e : 8d 2e 43 STA $432e ; (bottom.code[0] + 8)
0b41 : 8d 0e 43 STA $430e ; (top.code[0] + 8)
0b44 : a9 8c __ LDA #$8c
0b46 : 8d 2f 43 STA $432f ; (bottom.code[0] + 9)
0b49 : 8d 0f 43 STA $430f ; (top.code[0] + 9)
0b4c : a9 8e __ LDA #$8e
0b4e : 8d 32 43 STA $4332 ; (bottom.code[0] + 12)
0b51 : 8d 12 43 STA $4312 ; (top.code[0] + 12)
0b54 : a9 39 __ LDA #$39
0b56 : 8d ee 41 STA $41ee ; (rasterIRQRows[0] + 0)
0b59 : ad 10 d0 LDA $d010 
0b5c : 85 55 __ STA T3 + 0 
0b5e : a9 3b __ LDA #$3b
0b60 : 8d 11 d0 STA $d011 
0b63 : a9 18 __ LDA #$18
0b65 : 8d 16 d0 STA $d016 
0b68 : ad 00 dd LDA $dd00 
0b6b : 29 fc __ AND #$fc
0b6d : 8d 00 dd STA $dd00 
0b70 : a9 28 __ LDA #$28
0b72 : 8d 01 43 STA $4301 ; (sbm.cwidth + 0)
0b75 : 8d 18 d0 STA $d018 
0b78 : a9 00 __ LDA #$00
0b7a : 8d 21 d0 STA $d021 
0b7d : 8d 20 d0 STA $d020 
0b80 : 8d ff 42 STA $42ff ; (sbm.rdata + 0)
0b83 : 8d 00 43 STA $4300 ; (sbm.rdata + 1)
0b86 : a9 f8 __ LDA #$f8
0b88 : 8d fb 42 STA $42fb ; (vspriteScreen + 0)
0b8b : a9 cb __ LDA #$cb
0b8d : 8d fc 42 STA $42fc ; (vspriteScreen + 1)
0b90 : a9 20 __ LDA #$20
0b92 : a2 28 __ LDX #$28
.l11:
0b94 : ca __ __ DEX
0b95 : 9d 00 c8 STA $c800,x 
0b98 : d0 fa __ BNE $0b94 ; (main.l11 + 0)
.s12:
0b9a : a9 30 __ LDA #$30
0b9c : 8d 02 c8 STA $c802 
0b9f : 8d 03 c8 STA $c803 
0ba2 : 8d 04 c8 STA $c804 
0ba5 : 8d 05 c8 STA $c805 
0ba8 : 8d 06 c8 STA $c806 
0bab : 8d 07 c8 STA $c807 
0bae : 8d 08 c8 STA $c808 
0bb1 : 8d 09 c8 STA $c809 
0bb4 : 8d 0c c8 STA $c80c 
0bb7 : 8d 0d c8 STA $c80d 
0bba : 8d 0e c8 STA $c80e 
0bbd : 8d 0f c8 STA $c80f 
0bc0 : 8d 10 c8 STA $c810 
0bc3 : 8d 11 c8 STA $c811 
0bc6 : 8d 12 c8 STA $c812 
0bc9 : 8d 13 c8 STA $c813 
0bcc : a9 01 __ LDA #$01
0bce : a2 28 __ LDX #$28
.l13:
0bd0 : ca __ __ DEX
0bd1 : 9d 00 d8 STA $d800,x 
0bd4 : d0 fa __ BNE $0bd0 ; (main.l13 + 0)
.s14:
0bd6 : a9 07 __ LDA #$07
0bd8 : 8d 0c d8 STA $d80c 
0bdb : 8d 0d d8 STA $d80d 
0bde : 8d 0e d8 STA $d80e 
0be1 : 8d 0f d8 STA $d80f 
0be4 : 8d 10 d8 STA $d810 
0be7 : 8d 11 d8 STA $d811 
0bea : 8d 12 d8 STA $d812 
0bed : 8d 13 d8 STA $d813 
0bf0 : ae c3 41 LDX $41c3 ; (CrossX + 0)
0bf3 : ac c4 41 LDY $41c4 ; (CrossX + 1)
0bf6 : ad c5 41 LDA $41c5 ; (CrossY + 0)
0bf9 : 18 __ __ CLC
0bfa : 69 28 __ ADC #$28
0bfc : 8d 01 d0 STA $d001 
0bff : ad 15 d0 LDA $d015 
0c02 : 09 01 __ ORA #$01
0c04 : 8d 15 d0 STA $d015 
0c07 : ad 1c d0 LDA $d01c 
0c0a : 29 fe __ AND #$fe
0c0c : 8d 1c d0 STA $d01c 
0c0f : ad 1d d0 LDA $d01d 
0c12 : 29 fe __ AND #$fe
0c14 : 8d 1d d0 STA $d01d 
0c17 : ad 17 d0 LDA $d017 
0c1a : 29 fe __ AND #$fe
0c1c : 8d 17 d0 STA $d017 
0c1f : 8a __ __ TXA
0c20 : 18 __ __ CLC
0c21 : 69 0e __ ADC #$0e
0c23 : 8d 00 d0 STA $d000 
0c26 : 98 __ __ TYA
0c27 : 69 00 __ ADC #$00
0c29 : 4a __ __ LSR
0c2a : a9 40 __ LDA #$40
0c2c : 8d f8 cb STA $cbf8 
0c2f : a9 01 __ LDA #$01
0c31 : 8d 27 d0 STA $d027 
0c34 : a9 06 __ LDA #$06
0c36 : 8d da 42 STA $42da ; (rasterIRQLow[0] + 0)
0c39 : a9 43 __ LDA #$43
0c3b : 8d ea 42 STA $42ea ; (rasterIRQHigh[0] + 0)
0c3e : a9 26 __ LDA #$26
0c40 : 8d db 42 STA $42db ; (rasterIRQLow[0] + 1)
0c43 : a9 43 __ LDA #$43
0c45 : 8d eb 42 STA $42eb ; (rasterIRQHigh[0] + 1)
0c48 : a5 55 __ LDA T3 + 0 
0c4a : 09 01 __ ORA #$01
0c4c : b0 02 __ BCS $0c50 ; (main.s16 + 0)
.s15:
0c4e : 29 fe __ AND #$fe
.s16:
0c50 : 8d 10 d0 STA $d010 
0c53 : a9 18 __ LDA #$18
0c55 : 8d 30 43 STA $4330 ; (bottom.code[0] + 10)
0c58 : 8d 18 43 STA $4318 ; (top.code[0] + 18)
0c5b : a9 27 __ LDA #$27
0c5d : 8d 27 43 STA $4327 ; (bottom.code[0] + 1)
0c60 : a9 1b __ LDA #$1b
0c62 : 8d 29 43 STA $4329 ; (bottom.code[0] + 3)
0c65 : a9 d0 __ LDA #$d0
0c67 : 8d 31 43 STA $4331 ; (bottom.code[0] + 11)
0c6a : 8d 34 43 STA $4334 ; (bottom.code[0] + 14)
0c6d : 8d 10 43 STA $4310 ; (top.code[0] + 10)
0c70 : 8d 14 43 STA $4314 ; (top.code[0] + 14)
0c73 : 8d 19 43 STA $4319 ; (top.code[0] + 19)
0c76 : a9 11 __ LDA #$11
0c78 : 8d 33 43 STA $4333 ; (bottom.code[0] + 13)
0c7b : 8d 13 43 STA $4313 ; (top.code[0] + 13)
0c7e : a9 a9 __ LDA #$a9
0c80 : 8d 35 43 STA $4335 ; (bottom.code[0] + 15)
0c83 : 8d 15 43 STA $4315 ; (top.code[0] + 15)
0c86 : a9 60 __ LDA #$60
0c88 : 8d 3a 43 STA $433a ; (bottom.code[0] + 20)
0c8b : 8d 1a 43 STA $431a ; (top.code[0] + 20)
0c8e : a9 00 __ LDA #$00
0c90 : 8d 36 43 STA $4336 ; (bottom.code[0] + 16)
0c93 : a9 20 __ LDA #$20
0c95 : 8d 37 43 STA $4337 ; (bottom.code[0] + 17)
0c98 : a9 0a __ LDA #$0a
0c9a : 8d 07 43 STA $4307 ; (top.code[0] + 1)
0c9d : a9 3b __ LDA #$3b
0c9f : 8d 09 43 STA $4309 ; (top.code[0] + 3)
0ca2 : a9 88 __ LDA #$88
0ca4 : 8d 0f 43 STA $430f ; (top.code[0] + 9)
0ca7 : a9 fd __ LDA #$fd
0ca9 : 8d 11 43 STA $4311 ; (top.code[0] + 11)
0cac : a9 28 __ LDA #$28
0cae : 8d 16 43 STA $4316 ; (top.code[0] + 16)
0cb1 : a9 8d __ LDA #$8d
0cb3 : 8d 17 43 STA $4317 ; (top.code[0] + 17)
0cb6 : a9 5d __ LDA #$5d
0cb8 : 8d 38 43 STA $4338 ; (bottom.code[0] + 18)
0cbb : a9 1e __ LDA #$1e
0cbd : 8d 39 43 STA $4339 ; (bottom.code[0] + 19)
0cc0 : a9 ff __ LDA #$ff
0cc2 : 8d ff 41 STA $41ff ; (nextIRQ + 0)
0cc5 : ae b9 42 LDX $42b9 ; (rasterIRQIndex[0] + 1)
0cc8 : bd ee 41 LDA $41ee,x ; (rasterIRQRows[0] + 0)
0ccb : 85 55 __ STA T3 + 0 
0ccd : a0 02 __ LDY #$02
.l17:
0ccf : be b8 42 LDX $42b8,y ; (rasterIRQIndex[0] + 0)
0cd2 : bd ee 41 LDA $41ee,x ; (rasterIRQRows[0] + 0)
0cd5 : c5 55 __ CMP T3 + 0 
0cd7 : 90 04 __ BCC $0cdd ; (main.s199 + 0)
.s18:
0cd9 : 85 55 __ STA T3 + 0 
0cdb : b0 24 __ BCS $0d01 ; (main.s19 + 0)
.s199:
0cdd : 86 59 __ STX T5 + 0 
0cdf : 84 57 __ STY T4 + 0 
0ce1 : 85 45 __ STA T2 + 0 
0ce3 : b9 b7 42 LDA $42b7,y ; (bitshift[0] + 55)
0ce6 : 99 b8 42 STA $42b8,y ; (rasterIRQIndex[0] + 0)
0ce9 : 90 05 __ BCC $0cf0 ; (main.l200 + 0)
.s202:
0ceb : 8a __ __ TXA
0cec : 99 b7 42 STA $42b7,y ; (bitshift[0] + 55)
0cef : 88 __ __ DEY
.l200:
0cf0 : a5 45 __ LDA T2 + 0 
0cf2 : be b6 42 LDX $42b6,y ; (bitshift[0] + 54)
0cf5 : dd ee 41 CMP $41ee,x ; (rasterIRQRows[0] + 0)
0cf8 : 90 f1 __ BCC $0ceb ; (main.s202 + 0)
.s201:
0cfa : a5 59 __ LDA T5 + 0 
0cfc : 99 b7 42 STA $42b7,y ; (bitshift[0] + 55)
0cff : a4 57 __ LDY T4 + 0 
.s19:
0d01 : c8 __ __ INY
0d02 : c0 11 __ CPY #$11
0d04 : 90 c9 __ BCC $0ccf ; (main.l17 + 0)
.s20:
0d06 : a2 03 __ LDX #$03
.l218:
0d08 : bc b9 42 LDY $42b9,x ; (rasterIRQIndex[0] + 1)
0d0b : b9 ee 41 LDA $41ee,y ; (rasterIRQRows[0] + 0)
0d0e : 9d c9 42 STA $42c9,x ; (rasterIRQNext[0] + 0)
0d11 : bc bd 42 LDY $42bd,x ; (rasterIRQIndex[0] + 5)
0d14 : b9 ee 41 LDA $41ee,y ; (rasterIRQRows[0] + 0)
0d17 : 9d cd 42 STA $42cd,x ; (rasterIRQNext[0] + 4)
0d1a : bc c1 42 LDY $42c1,x ; (rasterIRQIndex[0] + 9)
0d1d : b9 ee 41 LDA $41ee,y ; (rasterIRQRows[0] + 0)
0d20 : 9d d1 42 STA $42d1,x ; (rasterIRQNext[0] + 8)
0d23 : bc c5 42 LDY $42c5,x ; (rasterIRQIndex[0] + 13)
0d26 : b9 ee 41 LDA $41ee,y ; (rasterIRQRows[0] + 0)
0d29 : 9d d5 42 STA $42d5,x ; (rasterIRQNext[0] + 12)
0d2c : ca __ __ DEX
0d2d : 10 d9 __ BPL $0d08 ; (main.l218 + 0)
.s219:
0d2f : a9 00 __ LDA #$00
0d31 : 8d ff c7 STA $c7ff ; (sstack + 20)
0d34 : ad fa 42 LDA $42fa ; (rirq_count + 0)
0d37 : 8d 49 43 STA $4349 ; (rirq_pcount + 0)
0d3a : ac c9 42 LDY $42c9 ; (rasterIRQNext[0] + 0)
0d3d : c0 ff __ CPY #$ff
0d3f : f0 09 __ BEQ $0d4a ; (main.s21 + 0)
.s198:
0d41 : 88 __ __ DEY
0d42 : 8c 12 d0 STY $d012 
0d45 : a9 00 __ LDA #$00
0d47 : 8d ff 41 STA $41ff ; (nextIRQ + 0)
.s21:
0d4a : 20 c2 1d JSR $1dc2 ; (rirq_start.s4 + 0)
0d4d : 20 7f 1f JSR $1f7f ; (game_state.s1 + 0)
0d50 : 4c 56 0d JMP $0d56 ; (main.l22 + 0)
.s27:
0d53 : 8d 49 43 STA $4349 ; (rirq_pcount + 0)
.l22:
0d56 : ad 4a 43 LDA $434a ; (TheGame.state + 0)
0d59 : c9 03 __ CMP #$03
0d5b : d0 03 __ BNE $0d60 ; (main.s23 + 0)
0d5d : 4c 7e 0e JMP $0e7e ; (main.s194 + 0)
.s23:
0d60 : b0 03 __ BCS $0d65 ; (main.s24 + 0)
0d62 : 4c 6d 0e JMP $0e6d ; (main.s47 + 0)
.s24:
0d65 : c9 04 __ CMP #$04
0d67 : f0 1c __ BEQ $0d85 ; (main.s31 + 0)
.s25:
0d69 : c9 05 __ CMP #$05
0d6b : d0 0e __ BNE $0d7b ; (main.l26 + 0)
.s28:
0d6d : ce 4b 43 DEC $434b ; (TheGame.count + 0)
0d70 : d0 09 __ BNE $0d7b ; (main.l26 + 0)
.s29:
0d72 : ad 4b 43 LDA $434b ; (TheGame.count + 0)
.s30:
0d75 : 8d ff c7 STA $c7ff ; (sstack + 20)
0d78 : 20 7f 1f JSR $1f7f ; (game_state.s1 + 0)
.l26:
0d7b : ad fa 42 LDA $42fa ; (rirq_count + 0)
0d7e : cd 49 43 CMP $4349 ; (rirq_pcount + 0)
0d81 : f0 f8 __ BEQ $0d7b ; (main.l26 + 0)
0d83 : d0 ce __ BNE $0d53 ; (main.s27 + 0)
.s31:
0d85 : a9 00 __ LDA #$00
0d87 : 85 0e __ STA P1 
0d89 : 85 10 __ STA P3 
0d8b : a9 a0 __ LDA #$a0
0d8d : 85 0d __ STA P0 
0d8f : ad 4b 43 LDA $434b ; (TheGame.count + 0)
0d92 : 69 00 __ ADC #$00
0d94 : 85 5b __ STA T7 + 0 
0d96 : 85 11 __ STA P4 
0d98 : 8d 4b 43 STA $434b ; (TheGame.count + 0)
0d9b : a9 64 __ LDA #$64
0d9d : 85 0f __ STA P2 
0d9f : a9 01 __ LDA #$01
0da1 : 85 12 __ STA P5 
0da3 : 20 e0 33 JSR $33e0 ; (bmmc_circle.s1 + 0)
0da6 : a5 f8 __ LDA $f8 ; (eused + 1)
0da8 : 85 56 __ STA T3 + 1 
0daa : a5 f7 __ LDA $f7 ; (eused + 0)
0dac : 85 55 __ STA T3 + 0 
0dae : 05 f8 __ ORA $f8 ; (eused + 1)
0db0 : d0 03 __ BNE $0db5 ; (main.s34 + 0)
0db2 : 4c 5f 0e JMP $0e5f ; (main.s32 + 0)
.s34:
0db5 : a9 00 __ LDA #$00
0db7 : 85 57 __ STA T4 + 0 
0db9 : 85 58 __ STA T4 + 1 
.l35:
0dbb : 18 __ __ CLC
0dbc : a0 04 __ LDY #$04
0dbe : b1 55 __ LDA (T3 + 0),y 
0dc0 : 69 01 __ ADC #$01
0dc2 : 91 55 __ STA (T3 + 0),y 
0dc4 : aa __ __ TAX
0dc5 : c8 __ __ INY
0dc6 : b1 55 __ LDA (T3 + 0),y 
0dc8 : 85 59 __ STA T5 + 0 
0dca : c8 __ __ INY
0dcb : b1 55 __ LDA (T3 + 0),y 
0dcd : 85 5a __ STA T5 + 1 
0dcf : 8a __ __ TXA
0dd0 : 29 03 __ AND #$03
0dd2 : f0 04 __ BEQ $0dd8 ; (main.s36 + 0)
.s39:
0dd4 : 8a __ __ TXA
0dd5 : 4c 0d 0e JMP $0e0d ; (main.s208 + 0)
.s36:
0dd8 : a8 __ __ TAY
0dd9 : b1 55 __ LDA (T3 + 0),y 
0ddb : 85 0d __ STA P0 
0ddd : a0 01 __ LDY #$01
0ddf : b1 55 __ LDA (T3 + 0),y 
0de1 : 85 0e __ STA P1 
0de3 : c8 __ __ INY
0de4 : b1 55 __ LDA (T3 + 0),y 
0de6 : 85 0f __ STA P2 
0de8 : c8 __ __ INY
0de9 : b1 55 __ LDA (T3 + 0),y 
0deb : 85 10 __ STA P3 
0ded : 8a __ __ TXA
0dee : 4a __ __ LSR
0def : 4a __ __ LSR
0df0 : 85 11 __ STA P4 
0df2 : e0 41 __ CPX #$41
0df4 : b0 06 __ BCS $0dfc ; (main.s37 + 0)
.s46:
0df6 : a9 01 __ LDA #$01
0df8 : 85 12 __ STA P5 
0dfa : 90 0a __ BCC $0e06 ; (main.s38 + 0)
.s37:
0dfc : a9 00 __ LDA #$00
0dfe : 85 12 __ STA P5 
0e00 : a9 21 __ LDA #$21
0e02 : e5 11 __ SBC P4 
0e04 : 85 11 __ STA P4 
.s38:
0e06 : 20 e0 33 JSR $33e0 ; (bmmc_circle.s1 + 0)
0e09 : a0 04 __ LDY #$04
0e0b : b1 55 __ LDA (T3 + 0),y 
.s208:
0e0d : c9 80 __ CMP #$80
0e0f : f0 0b __ BEQ $0e1c ; (main.s42 + 0)
.s40:
0e11 : a5 55 __ LDA T3 + 0 
0e13 : 85 57 __ STA T4 + 0 
0e15 : a5 56 __ LDA T3 + 1 
0e17 : 85 58 __ STA T4 + 1 
0e19 : 4c 50 0e JMP $0e50 ; (main.s41 + 0)
.s42:
0e1c : a0 05 __ LDY #$05
0e1e : b1 55 __ LDA (T3 + 0),y 
0e20 : aa __ __ TAX
0e21 : c8 __ __ INY
0e22 : b1 55 __ LDA (T3 + 0),y 
0e24 : 85 54 __ STA T0 + 1 
0e26 : a5 57 __ LDA T4 + 0 
0e28 : 05 58 __ ORA T4 + 1 
0e2a : f0 0b __ BEQ $0e37 ; (main.s43 + 0)
.s45:
0e2c : 8a __ __ TXA
0e2d : 88 __ __ DEY
0e2e : 91 57 __ STA (T4 + 0),y 
0e30 : a5 54 __ LDA T0 + 1 
0e32 : c8 __ __ INY
0e33 : 91 57 __ STA (T4 + 0),y 
0e35 : d0 06 __ BNE $0e3d ; (main.s44 + 0)
.s43:
0e37 : 86 f7 __ STX $f7 ; (eused + 0)
0e39 : a5 54 __ LDA T0 + 1 
0e3b : 85 f8 __ STA $f8 ; (eused + 1)
.s44:
0e3d : a5 f9 __ LDA $f9 ; (efree + 0)
0e3f : a0 05 __ LDY #$05
0e41 : 91 55 __ STA (T3 + 0),y 
0e43 : a5 fa __ LDA $fa ; (efree + 1)
0e45 : c8 __ __ INY
0e46 : 91 55 __ STA (T3 + 0),y 
0e48 : a5 55 __ LDA T3 + 0 
0e4a : 85 f9 __ STA $f9 ; (efree + 0)
0e4c : a5 56 __ LDA T3 + 1 
0e4e : 85 fa __ STA $fa ; (efree + 1)
.s41:
0e50 : a5 59 __ LDA T5 + 0 
0e52 : 85 55 __ STA T3 + 0 
0e54 : a5 5a __ LDA T5 + 1 
0e56 : 85 56 __ STA T3 + 1 
0e58 : 05 59 __ ORA T5 + 0 
0e5a : f0 03 __ BEQ $0e5f ; (main.s32 + 0)
0e5c : 4c bb 0d JMP $0dbb ; (main.l35 + 0)
.s32:
0e5f : a5 5b __ LDA T7 + 0 
0e61 : c9 5a __ CMP #$5a
0e63 : f0 03 __ BEQ $0e68 ; (main.s33 + 0)
0e65 : 4c 7b 0d JMP $0d7b ; (main.l26 + 0)
.s33:
0e68 : a9 05 __ LDA #$05
0e6a : 4c 75 0d JMP $0d75 ; (main.s30 + 0)
.s47:
0e6d : c9 01 __ CMP #$01
0e6f : d0 0a __ BNE $0e7b ; (main.s48 + 0)
.s196:
0e71 : ce 4b 43 DEC $434b ; (TheGame.count + 0)
0e74 : d0 ef __ BNE $0e65 ; (main.s32 + 6)
.s197:
0e76 : a9 02 __ LDA #$02
0e78 : 4c 75 0d JMP $0d75 ; (main.s30 + 0)
.s48:
0e7b : aa __ __ TAX
0e7c : d0 0a __ BNE $0e88 ; (main.s49 + 0)
.s194:
0e7e : ce 4b 43 DEC $434b ; (TheGame.count + 0)
0e81 : d0 e2 __ BNE $0e65 ; (main.s32 + 6)
.s195:
0e83 : a9 01 __ LDA #$01
0e85 : 4c 75 0d JMP $0d75 ; (main.s30 + 0)
.s49:
0e88 : ad c7 41 LDA $41c7 ; (CrossP + 0)
0e8b : f0 55 __ BEQ $0ee2 ; (main.s50 + 0)
.s172:
0e8d : ad c3 41 LDA $41c3 ; (CrossX + 0)
0e90 : 85 53 __ STA T0 + 0 
0e92 : ad c4 41 LDA $41c4 ; (CrossX + 1)
0e95 : 85 54 __ STA T0 + 1 
0e97 : ad c5 41 LDA $41c5 ; (CrossY + 0)
0e9a : 85 43 __ STA T1 + 0 
0e9c : ad c6 41 LDA $41c6 ; (CrossY + 1)
0e9f : 85 44 __ STA T1 + 1 
0ea1 : a5 54 __ LDA T0 + 1 
0ea3 : 30 08 __ BMI $0ead ; (main.s191 + 0)
.s193:
0ea5 : d0 0c __ BNE $0eb3 ; (main.s173 + 0)
.s192:
0ea7 : a5 53 __ LDA T0 + 0 
0ea9 : c9 78 __ CMP #$78
0eab : b0 06 __ BCS $0eb3 ; (main.s173 + 0)
.s191:
0ead : a2 18 __ LDX #$18
.s209:
0eaf : a9 00 __ LDA #$00
0eb1 : f0 12 __ BEQ $0ec5 ; (main.s175 + 0)
.s173:
0eb3 : a5 54 __ LDA T0 + 1 
0eb5 : d0 0a __ BNE $0ec1 ; (main.s189 + 0)
.s190:
0eb7 : a5 53 __ LDA T0 + 0 
0eb9 : c9 c9 __ CMP #$c9
0ebb : b0 04 __ BCS $0ec1 ; (main.s189 + 0)
.s174:
0ebd : a2 a0 __ LDX #$a0
0ebf : 90 ee __ BCC $0eaf ; (main.s209 + 0)
.s189:
0ec1 : a9 01 __ LDA #$01
0ec3 : a2 28 __ LDX #$28
.s175:
0ec5 : 85 46 __ STA T2 + 1 
0ec7 : ad 61 43 LDA $4361 ; (mfree + 1)
0eca : 85 56 __ STA T3 + 1 
0ecc : ad 60 43 LDA $4360 ; (mfree + 0)
0ecf : 85 55 __ STA T3 + 0 
0ed1 : 05 56 __ ORA T3 + 1 
0ed3 : f0 08 __ BEQ $0edd ; (main.s176 + 0)
.s177:
0ed5 : ad d2 43 LDA $43d2 ; (nmissiles + 0)
0ed8 : f0 03 __ BEQ $0edd ; (main.s176 + 0)
0eda : 4c f9 1b JMP $1bf9 ; (main.s178 + 0)
.s176:
0edd : a9 00 __ LDA #$00
0edf : 8d c7 41 STA $41c7 ; (CrossP + 0)
.s50:
0ee2 : ce 4b 43 DEC $434b ; (TheGame.count + 0)
0ee5 : f0 07 __ BEQ $0eee ; (main.l51 + 0)
.s57:
0ee7 : a9 04 __ LDA #$04
0ee9 : 85 51 __ STA T12 + 0 
0eeb : 4c 68 10 JMP $1068 ; (main.l58 + 0)
.l51:
0eee : ad e5 41 LDA $41e5 ; (seed + 1)
0ef1 : 4a __ __ LSR
0ef2 : ad e4 41 LDA $41e4 ; (seed + 0)
0ef5 : 6a __ __ ROR
0ef6 : aa __ __ TAX
0ef7 : a9 00 __ LDA #$00
0ef9 : 6a __ __ ROR
0efa : 4d e4 41 EOR $41e4 ; (seed + 0)
0efd : 85 53 __ STA T0 + 0 
0eff : 8a __ __ TXA
0f00 : 4d e5 41 EOR $41e5 ; (seed + 1)
0f03 : 85 54 __ STA T0 + 1 
0f05 : 4a __ __ LSR
0f06 : 45 53 __ EOR T0 + 0 
0f08 : 85 53 __ STA T0 + 0 
0f0a : 8d e4 41 STA $41e4 ; (seed + 0)
0f0d : 45 54 __ EOR T0 + 1 
0f0f : 85 54 __ STA T0 + 1 
0f11 : 8d e5 41 STA $41e5 ; (seed + 1)
0f14 : a5 53 __ LDA T0 + 0 
0f16 : 29 07 __ AND #$07
0f18 : c9 06 __ CMP #$06
0f1a : b0 d2 __ BCS $0eee ; (main.l51 + 0)
.s52:
0f1c : aa __ __ TAX
0f1d : bd 4d 43 LDA $434d,x ; (cities[0] + 0)
0f20 : f0 cc __ BEQ $0eee ; (main.l51 + 0)
.s53:
0f22 : e0 03 __ CPX #$03
0f24 : bd bd 3a LDA $3abd,x ; (__multab32L + 0)
0f27 : b0 08 __ BCS $0f31 ; (main.s54 + 0)
.s171:
0f29 : 69 3a __ ADC #$3a
0f2b : 85 43 __ STA T1 + 0 
0f2d : a9 00 __ LDA #$00
0f2f : f0 07 __ BEQ $0f38 ; (main.s55 + 0)
.s54:
0f31 : 69 69 __ ADC #$69
0f33 : 85 43 __ STA T1 + 0 
0f35 : a9 00 __ LDA #$00
0f37 : 2a __ __ ROL
.s55:
0f38 : 85 44 __ STA T1 + 1 
0f3a : a5 54 __ LDA T0 + 1 
0f3c : 4a __ __ LSR
0f3d : a5 53 __ LDA T0 + 0 
0f3f : 6a __ __ ROR
0f40 : aa __ __ TAX
0f41 : a9 00 __ LDA #$00
0f43 : 6a __ __ ROR
0f44 : 45 53 __ EOR T0 + 0 
0f46 : 85 53 __ STA T0 + 0 
0f48 : 8a __ __ TXA
0f49 : 45 54 __ EOR T0 + 1 
0f4b : 85 54 __ STA T0 + 1 
0f4d : 4a __ __ LSR
0f4e : 45 53 __ EOR T0 + 0 
0f50 : 85 53 __ STA T0 + 0 
0f52 : 45 54 __ EOR T0 + 1 
0f54 : 85 54 __ STA T0 + 1 
0f56 : ae d4 43 LDX $43d4 ; (icbmcount + 0)
0f59 : f0 0c __ BEQ $0f67 ; (main.s56 + 0)
.s167:
0f5b : a5 fe __ LDA $fe ; (ifree + 1)
0f5d : 85 46 __ STA T2 + 1 
0f5f : a5 fd __ LDA $fd ; (ifree + 0)
0f61 : 85 45 __ STA T2 + 0 
0f63 : 05 fe __ ORA $fe ; (ifree + 1)
0f65 : d0 2c __ BNE $0f93 ; (main.s168 + 0)
.s56:
0f67 : a5 54 __ LDA T0 + 1 
0f69 : 4a __ __ LSR
0f6a : a5 53 __ LDA T0 + 0 
0f6c : 6a __ __ ROR
0f6d : aa __ __ TAX
0f6e : a9 00 __ LDA #$00
0f70 : 6a __ __ ROR
0f71 : 45 53 __ EOR T0 + 0 
0f73 : 85 53 __ STA T0 + 0 
0f75 : 8a __ __ TXA
0f76 : 45 54 __ EOR T0 + 1 
0f78 : 85 54 __ STA T0 + 1 
0f7a : 4a __ __ LSR
0f7b : 45 53 __ EOR T0 + 0 
0f7d : 8d e4 41 STA $41e4 ; (seed + 0)
0f80 : 45 54 __ EOR T0 + 1 
0f82 : 8d e5 41 STA $41e5 ; (seed + 1)
0f85 : ad e4 41 LDA $41e4 ; (seed + 0)
0f88 : 29 3f __ AND #$3f
0f8a : 18 __ __ CLC
0f8b : 69 08 __ ADC #$08
0f8d : 8d 4b 43 STA $434b ; (TheGame.count + 0)
0f90 : 4c e7 0e JMP $0ee7 ; (main.s57 + 0)
.s168:
0f93 : ca __ __ DEX
0f94 : 8e d4 43 STX $43d4 ; (icbmcount + 0)
0f97 : a9 00 __ LDA #$00
0f99 : a0 02 __ LDY #$02
0f9b : 91 fd __ STA ($fd),y ; (ifree + 0)
0f9d : c8 __ __ INY
0f9e : 91 fd __ STA ($fd),y ; (ifree + 0)
0fa0 : a9 b8 __ LDA #$b8
0fa2 : a0 06 __ LDY #$06
0fa4 : 91 fd __ STA ($fd),y ; (ifree + 0)
0fa6 : a9 00 __ LDA #$00
0fa8 : c8 __ __ INY
0fa9 : 91 fd __ STA ($fd),y ; (ifree + 0)
0fab : a0 0a __ LDY #$0a
0fad : 91 fd __ STA ($fd),y ; (ifree + 0)
0faf : c8 __ __ INY
0fb0 : 91 fd __ STA ($fd),y ; (ifree + 0)
0fb2 : a9 70 __ LDA #$70
0fb4 : a0 0e __ LDY #$0e
0fb6 : 91 fd __ STA ($fd),y ; (ifree + 0)
0fb8 : a9 01 __ LDA #$01
0fba : c8 __ __ INY
0fbb : 91 fd __ STA ($fd),y ; (ifree + 0)
0fbd : a0 12 __ LDY #$12
0fbf : 91 fd __ STA ($fd),y ; (ifree + 0)
0fc1 : a9 00 __ LDA #$00
0fc3 : c8 __ __ INY
0fc4 : 91 fd __ STA ($fd),y ; (ifree + 0)
0fc6 : c8 __ __ INY
0fc7 : b1 fd __ LDA ($fd),y ; (ifree + 0)
0fc9 : 85 fd __ STA $fd ; (ifree + 0)
0fcb : c8 __ __ INY
0fcc : b1 45 __ LDA (T2 + 0),y 
0fce : 85 fe __ STA $fe ; (ifree + 1)
0fd0 : a5 fb __ LDA $fb ; (iused + 0)
0fd2 : 88 __ __ DEY
0fd3 : 91 45 __ STA (T2 + 0),y 
0fd5 : a5 fc __ LDA $fc ; (iused + 1)
0fd7 : c8 __ __ INY
0fd8 : 91 45 __ STA (T2 + 0),y 
0fda : a5 45 __ LDA T2 + 0 
0fdc : 85 fb __ STA $fb ; (iused + 0)
0fde : a5 46 __ LDA T2 + 1 
0fe0 : 85 fc __ STA $fc ; (iused + 1)
0fe2 : 18 __ __ CLC
0fe3 : a5 53 __ LDA T0 + 0 
0fe5 : 69 20 __ ADC #$20
0fe7 : 85 55 __ STA T3 + 0 
0fe9 : a9 00 __ LDA #$00
0feb : 2a __ __ ROL
0fec : 4a __ __ LSR
0fed : 85 56 __ STA T3 + 1 
0fef : a0 09 __ LDY #$09
0ff1 : 91 45 __ STA (T2 + 0),y 
0ff3 : a0 01 __ LDY #$01
0ff5 : 91 45 __ STA (T2 + 0),y 
0ff7 : 66 55 __ ROR T3 + 0 
0ff9 : a5 55 __ LDA T3 + 0 
0ffb : 88 __ __ DEY
0ffc : 91 45 __ STA (T2 + 0),y 
0ffe : a0 08 __ LDY #$08
1000 : 91 45 __ STA (T2 + 0),y 
1002 : 46 44 __ LSR T1 + 1 
1004 : 66 43 __ ROR T1 + 0 
1006 : 38 __ __ SEC
1007 : a5 43 __ LDA T1 + 0 
1009 : e5 55 __ SBC T3 + 0 
100b : 85 55 __ STA T3 + 0 
100d : a0 0c __ LDY #$0c
100f : 91 45 __ STA (T2 + 0),y 
1011 : a9 00 __ LDA #$00
1013 : e5 56 __ SBC T3 + 1 
1015 : 85 56 __ STA T3 + 1 
1017 : c8 __ __ INY
1018 : 91 45 __ STA (T2 + 0),y 
101a : a5 43 __ LDA T1 + 0 
101c : a0 04 __ LDY #$04
101e : 91 45 __ STA (T2 + 0),y 
1020 : a9 00 __ LDA #$00
1022 : c8 __ __ INY
1023 : 91 45 __ STA (T2 + 0),y 
1025 : 24 55 __ BIT T3 + 0 
1027 : 10 14 __ BPL $103d ; (main.s169 + 0)
.s170:
1029 : 38 __ __ SEC
102a : e5 55 __ SBC T3 + 0 
102c : a0 0c __ LDY #$0c
102e : 91 45 __ STA (T2 + 0),y 
1030 : a9 00 __ LDA #$00
1032 : e5 56 __ SBC T3 + 1 
1034 : c8 __ __ INY
1035 : 91 45 __ STA (T2 + 0),y 
1037 : a9 ff __ LDA #$ff
1039 : a0 12 __ LDY #$12
103b : 91 45 __ STA (T2 + 0),y 
.s169:
103d : a0 0c __ LDY #$0c
103f : b1 45 __ LDA (T2 + 0),y 
1041 : 85 43 __ STA T1 + 0 
1043 : c8 __ __ INY
1044 : b1 45 __ LDA (T2 + 0),y 
1046 : 85 44 __ STA T1 + 1 
1048 : 38 __ __ SEC
1049 : a9 b8 __ LDA #$b8
104b : e5 43 __ SBC T1 + 0 
104d : a0 10 __ LDY #$10
104f : 91 45 __ STA (T2 + 0),y 
1051 : a9 00 __ LDA #$00
1053 : e5 44 __ SBC T1 + 1 
1055 : c8 __ __ INY
1056 : 91 45 __ STA (T2 + 0),y 
1058 : a5 43 __ LDA T1 + 0 
105a : 0a __ __ ASL
105b : a0 0c __ LDY #$0c
105d : 91 45 __ STA (T2 + 0),y 
105f : a5 44 __ LDA T1 + 1 
1061 : 2a __ __ ROL
1062 : c8 __ __ INY
1063 : 91 45 __ STA (T2 + 0),y 
1065 : 4c 67 0f JMP $0f67 ; (main.s56 + 0)
.l58:
1068 : a9 00 __ LDA #$00
106a : 85 53 __ STA T0 + 0 
106c : 85 54 __ STA T0 + 1 
106e : ad 5f 43 LDA $435f ; (mused + 1)
1071 : 85 44 __ STA T1 + 1 
1073 : ad 5e 43 LDA $435e ; (mused + 0)
1076 : 85 43 __ STA T1 + 0 
1078 : 05 44 __ ORA T1 + 1 
107a : f0 03 __ BEQ $107f ; (main.s59 + 0)
107c : 4c 95 17 JMP $1795 ; (main.l134 + 0)
.s59:
107f : c6 51 __ DEC T12 + 0 
1081 : d0 e5 __ BNE $1068 ; (main.l58 + 0)
.s60:
1083 : a5 fc __ LDA $fc ; (iused + 1)
1085 : 85 54 __ STA T0 + 1 
1087 : a5 fb __ LDA $fb ; (iused + 0)
1089 : 85 53 __ STA T0 + 0 
108b : 05 fc __ ORA $fc ; (iused + 1)
108d : d0 03 __ BNE $1092 ; (main.s81 + 0)
108f : 4c 31 11 JMP $1131 ; (main.s61 + 0)
.s81:
1092 : ad d3 43 LDA $43d3 ; (icbmspeed + 0)
1095 : 85 43 __ STA T1 + 0 
1097 : a9 00 __ LDA #$00
1099 : 85 45 __ STA T2 + 0 
109b : 85 46 __ STA T2 + 1 
.l82:
109d : a0 13 __ LDY #$13
109f : b1 53 __ LDA (T0 + 0),y 
10a1 : 18 __ __ CLC
10a2 : 65 43 __ ADC T1 + 0 
10a4 : 91 53 __ STA (T0 + 0),y 
10a6 : aa __ __ TAX
10a7 : c8 __ __ INY
10a8 : b1 53 __ LDA (T0 + 0),y 
10aa : 85 57 __ STA T4 + 0 
10ac : c8 __ __ INY
10ad : b1 53 __ LDA (T0 + 0),y 
10af : 85 58 __ STA T4 + 1 
10b1 : 8a __ __ TXA
10b2 : 30 05 __ BMI $10b9 ; (main.s83 + 0)
.l133:
10b4 : f0 03 __ BEQ $10b9 ; (main.s83 + 0)
10b6 : 4c 0d 12 JMP $120d ; (main.s86 + 0)
.s83:
10b9 : a5 53 __ LDA T0 + 0 
10bb : 05 54 __ ORA T0 + 1 
10bd : f0 63 __ BEQ $1122 ; (main.s84 + 0)
.s85:
10bf : a0 08 __ LDY #$08
10c1 : b1 53 __ LDA (T0 + 0),y 
10c3 : 0a __ __ ASL
10c4 : 85 45 __ STA T2 + 0 
10c6 : 29 f8 __ AND #$f8
10c8 : 85 55 __ STA T3 + 0 
10ca : c8 __ __ INY
10cb : b1 53 __ LDA (T0 + 0),y 
10cd : 2a __ __ ROL
10ce : 85 46 __ STA T2 + 1 
10d0 : c8 __ __ INY
10d1 : b1 53 __ LDA (T0 + 0),y 
10d3 : 85 59 __ STA T5 + 0 
10d5 : 29 f8 __ AND #$f8
10d7 : 85 1b __ STA ACCU + 0 
10d9 : c8 __ __ INY
10da : b1 53 __ LDA (T0 + 0),y 
10dc : 85 1c __ STA ACCU + 1 
10de : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
10e1 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
10e4 : ad fd 42 LDA $42fd ; (sbm.data + 0)
10e7 : 18 __ __ CLC
10e8 : 65 1b __ ADC ACCU + 0 
10ea : 85 47 __ STA T6 + 0 
10ec : ad fe 42 LDA $42fe ; (sbm.data + 1)
10ef : 65 1c __ ADC ACCU + 1 
10f1 : aa __ __ TAX
10f2 : a5 59 __ LDA T5 + 0 
10f4 : 29 07 __ AND #$07
10f6 : 05 55 __ ORA T3 + 0 
10f8 : 18 __ __ CLC
10f9 : 65 47 __ ADC T6 + 0 
10fb : 85 47 __ STA T6 + 0 
10fd : 8a __ __ TXA
10fe : 65 46 __ ADC T2 + 1 
1100 : 85 48 __ STA T6 + 1 
1102 : ad d9 41 LDA $41d9 ; (cbytes[0] + 1)
1105 : a0 00 __ LDY #$00
1107 : 51 47 __ EOR (T6 + 0),y 
1109 : 85 55 __ STA T3 + 0 
110b : a5 45 __ LDA T2 + 0 
110d : 29 07 __ AND #$07
110f : aa __ __ TAX
1110 : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
1113 : 25 55 __ AND T3 + 0 
1115 : 4d d9 41 EOR $41d9 ; (cbytes[0] + 1)
1118 : 91 47 __ STA (T6 + 0),y 
111a : a5 53 __ LDA T0 + 0 
111c : 85 45 __ STA T2 + 0 
111e : a5 54 __ LDA T0 + 1 
1120 : 85 46 __ STA T2 + 1 
.s84:
1122 : a5 57 __ LDA T4 + 0 
1124 : 85 53 __ STA T0 + 0 
1126 : a5 58 __ LDA T4 + 1 
1128 : 85 54 __ STA T0 + 1 
112a : 05 57 __ ORA T4 + 0 
112c : f0 03 __ BEQ $1131 ; (main.s61 + 0)
112e : 4c 9d 10 JMP $109d ; (main.l82 + 0)
.s61:
1131 : a5 f8 __ LDA $f8 ; (eused + 1)
1133 : 85 56 __ STA T3 + 1 
1135 : a5 f7 __ LDA $f7 ; (eused + 0)
1137 : 85 55 __ STA T3 + 0 
1139 : 05 f8 __ ORA $f8 ; (eused + 1)
113b : d0 03 __ BNE $1140 ; (main.s68 + 0)
113d : 4c ea 11 JMP $11ea ; (main.s62 + 0)
.s68:
1140 : a9 00 __ LDA #$00
1142 : 85 57 __ STA T4 + 0 
1144 : 85 58 __ STA T4 + 1 
.l69:
1146 : 18 __ __ CLC
1147 : a0 04 __ LDY #$04
1149 : b1 55 __ LDA (T3 + 0),y 
114b : 69 01 __ ADC #$01
114d : 91 55 __ STA (T3 + 0),y 
114f : aa __ __ TAX
1150 : c8 __ __ INY
1151 : b1 55 __ LDA (T3 + 0),y 
1153 : 85 59 __ STA T5 + 0 
1155 : c8 __ __ INY
1156 : b1 55 __ LDA (T3 + 0),y 
1158 : 85 5a __ STA T5 + 1 
115a : 8a __ __ TXA
115b : 29 03 __ AND #$03
115d : f0 04 __ BEQ $1163 ; (main.s70 + 0)
.s73:
115f : 8a __ __ TXA
1160 : 4c 98 11 JMP $1198 ; (main.s205 + 0)
.s70:
1163 : a8 __ __ TAY
1164 : b1 55 __ LDA (T3 + 0),y 
1166 : 85 0d __ STA P0 
1168 : a0 01 __ LDY #$01
116a : b1 55 __ LDA (T3 + 0),y 
116c : 85 0e __ STA P1 
116e : c8 __ __ INY
116f : b1 55 __ LDA (T3 + 0),y 
1171 : 85 0f __ STA P2 
1173 : c8 __ __ INY
1174 : b1 55 __ LDA (T3 + 0),y 
1176 : 85 10 __ STA P3 
1178 : 8a __ __ TXA
1179 : 4a __ __ LSR
117a : 4a __ __ LSR
117b : 85 11 __ STA P4 
117d : e0 41 __ CPX #$41
117f : b0 06 __ BCS $1187 ; (main.s71 + 0)
.s80:
1181 : a9 01 __ LDA #$01
1183 : 85 12 __ STA P5 
1185 : 90 0a __ BCC $1191 ; (main.s72 + 0)
.s71:
1187 : a9 00 __ LDA #$00
1189 : 85 12 __ STA P5 
118b : a9 21 __ LDA #$21
118d : e5 11 __ SBC P4 
118f : 85 11 __ STA P4 
.s72:
1191 : 20 e0 33 JSR $33e0 ; (bmmc_circle.s1 + 0)
1194 : a0 04 __ LDY #$04
1196 : b1 55 __ LDA (T3 + 0),y 
.s205:
1198 : c9 80 __ CMP #$80
119a : f0 0b __ BEQ $11a7 ; (main.s76 + 0)
.s74:
119c : a5 55 __ LDA T3 + 0 
119e : 85 57 __ STA T4 + 0 
11a0 : a5 56 __ LDA T3 + 1 
11a2 : 85 58 __ STA T4 + 1 
11a4 : 4c db 11 JMP $11db ; (main.s75 + 0)
.s76:
11a7 : a0 05 __ LDY #$05
11a9 : b1 55 __ LDA (T3 + 0),y 
11ab : aa __ __ TAX
11ac : c8 __ __ INY
11ad : b1 55 __ LDA (T3 + 0),y 
11af : 85 54 __ STA T0 + 1 
11b1 : a5 57 __ LDA T4 + 0 
11b3 : 05 58 __ ORA T4 + 1 
11b5 : f0 0b __ BEQ $11c2 ; (main.s77 + 0)
.s79:
11b7 : 8a __ __ TXA
11b8 : 88 __ __ DEY
11b9 : 91 57 __ STA (T4 + 0),y 
11bb : a5 54 __ LDA T0 + 1 
11bd : c8 __ __ INY
11be : 91 57 __ STA (T4 + 0),y 
11c0 : d0 06 __ BNE $11c8 ; (main.s78 + 0)
.s77:
11c2 : 86 f7 __ STX $f7 ; (eused + 0)
11c4 : a5 54 __ LDA T0 + 1 
11c6 : 85 f8 __ STA $f8 ; (eused + 1)
.s78:
11c8 : a5 f9 __ LDA $f9 ; (efree + 0)
11ca : a0 05 __ LDY #$05
11cc : 91 55 __ STA (T3 + 0),y 
11ce : a5 fa __ LDA $fa ; (efree + 1)
11d0 : c8 __ __ INY
11d1 : 91 55 __ STA (T3 + 0),y 
11d3 : a5 55 __ LDA T3 + 0 
11d5 : 85 f9 __ STA $f9 ; (efree + 0)
11d7 : a5 56 __ LDA T3 + 1 
11d9 : 85 fa __ STA $fa ; (efree + 1)
.s75:
11db : a5 59 __ LDA T5 + 0 
11dd : 85 55 __ STA T3 + 0 
11df : a5 5a __ LDA T5 + 1 
11e1 : 85 56 __ STA T3 + 1 
11e3 : 05 59 __ ORA T5 + 0 
11e5 : f0 03 __ BEQ $11ea ; (main.s62 + 0)
11e7 : 4c 46 11 JMP $1146 ; (main.l69 + 0)
.s62:
11ea : ad d4 43 LDA $43d4 ; (icbmcount + 0)
11ed : d0 0c __ BNE $11fb ; (main.s66 + 0)
.s63:
11ef : a5 fb __ LDA $fb ; (iused + 0)
11f1 : 05 fc __ ORA $fc ; (iused + 1)
11f3 : d0 06 __ BNE $11fb ; (main.s66 + 0)
.s64:
11f5 : a5 f7 __ LDA $f7 ; (eused + 0)
11f7 : 05 f8 __ ORA $f8 ; (eused + 1)
11f9 : f0 0d __ BEQ $1208 ; (main.s65 + 0)
.s66:
11fb : ad 53 43 LDA $4353 ; (ncities + 0)
11fe : f0 03 __ BEQ $1203 ; (main.s67 + 0)
1200 : 4c 7b 0d JMP $0d7b ; (main.l26 + 0)
.s67:
1203 : a9 04 __ LDA #$04
1205 : 4c 75 0d JMP $0d75 ; (main.s30 + 0)
.s65:
1208 : a9 03 __ LDA #$03
120a : 4c 75 0d JMP $0d75 ; (main.s30 + 0)
.s86:
120d : 38 __ __ SEC
120e : a0 13 __ LDY #$13
1210 : b1 53 __ LDA (T0 + 0),y 
1212 : e9 20 __ SBC #$20
1214 : 91 53 __ STA (T0 + 0),y 
1216 : a0 08 __ LDY #$08
1218 : b1 53 __ LDA (T0 + 0),y 
121a : 85 55 __ STA T3 + 0 
121c : 0a __ __ ASL
121d : 85 59 __ STA T5 + 0 
121f : 29 f8 __ AND #$f8
1221 : 85 47 __ STA T6 + 0 
1223 : c8 __ __ INY
1224 : b1 53 __ LDA (T0 + 0),y 
1226 : 85 56 __ STA T3 + 1 
1228 : 2a __ __ ROL
1229 : 85 5a __ STA T5 + 1 
122b : c8 __ __ INY
122c : b1 53 __ LDA (T0 + 0),y 
122e : 85 5b __ STA T7 + 0 
1230 : 29 f8 __ AND #$f8
1232 : 85 1b __ STA ACCU + 0 
1234 : c8 __ __ INY
1235 : b1 53 __ LDA (T0 + 0),y 
1237 : 85 5c __ STA T7 + 1 
1239 : 85 1c __ STA ACCU + 1 
123b : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
123e : 20 16 38 JSR $3816 ; (mul16by8 + 0)
1241 : ad fd 42 LDA $42fd ; (sbm.data + 0)
1244 : 18 __ __ CLC
1245 : 65 1b __ ADC ACCU + 0 
1247 : 85 4b __ STA T9 + 0 
1249 : ad fe 42 LDA $42fe ; (sbm.data + 1)
124c : 65 1c __ ADC ACCU + 1 
124e : aa __ __ TAX
124f : a5 5b __ LDA T7 + 0 
1251 : 29 07 __ AND #$07
1253 : 05 47 __ ORA T6 + 0 
1255 : 18 __ __ CLC
1256 : 65 4b __ ADC T9 + 0 
1258 : 85 4b __ STA T9 + 0 
125a : 8a __ __ TXA
125b : 65 5a __ ADC T5 + 1 
125d : 85 4c __ STA T9 + 1 
125f : ad da 41 LDA $41da ; (cbytes[0] + 2)
1262 : a0 00 __ LDY #$00
1264 : 51 4b __ EOR (T9 + 0),y 
1266 : 85 47 __ STA T6 + 0 
1268 : a5 59 __ LDA T5 + 0 
126a : 29 07 __ AND #$07
126c : aa __ __ TAX
126d : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
1270 : 25 47 __ AND T6 + 0 
1272 : 4d da 41 EOR $41da ; (cbytes[0] + 2)
1275 : 91 4b __ STA (T9 + 0),y 
1277 : a0 10 __ LDY #$10
1279 : b1 53 __ LDA (T0 + 0),y 
127b : 85 59 __ STA T5 + 0 
127d : c8 __ __ INY
127e : b1 53 __ LDA (T0 + 0),y 
1280 : 30 27 __ BMI $12a9 ; (main.s87 + 0)
.s132:
1282 : aa __ __ TAX
1283 : 18 __ __ CLC
1284 : a5 5b __ LDA T7 + 0 
1286 : 69 01 __ ADC #$01
1288 : a0 0a __ LDY #$0a
128a : 91 53 __ STA (T0 + 0),y 
128c : a5 5c __ LDA T7 + 1 
128e : 69 00 __ ADC #$00
1290 : c8 __ __ INY
1291 : 91 53 __ STA (T0 + 0),y 
1293 : a5 59 __ LDA T5 + 0 
1295 : 38 __ __ SEC
1296 : c8 __ __ INY
1297 : f1 53 __ SBC (T0 + 0),y 
1299 : a0 10 __ LDY #$10
129b : 91 53 __ STA (T0 + 0),y 
129d : 8a __ __ TXA
129e : a0 0d __ LDY #$0d
12a0 : f1 53 __ SBC (T0 + 0),y 
12a2 : a0 11 __ LDY #$11
12a4 : 91 53 __ STA (T0 + 0),y 
12a6 : aa __ __ TAX
12a7 : 10 2a __ BPL $12d3 ; (main.s88 + 0)
.s87:
12a9 : a2 00 __ LDX #$00
12ab : a0 12 __ LDY #$12
12ad : b1 53 __ LDA (T0 + 0),y 
12af : 10 01 __ BPL $12b2 ; (main.s213 + 0)
.s212:
12b1 : ca __ __ DEX
.s213:
12b2 : 18 __ __ CLC
12b3 : 65 55 __ ADC T3 + 0 
12b5 : a0 08 __ LDY #$08
12b7 : 91 53 __ STA (T0 + 0),y 
12b9 : 8a __ __ TXA
12ba : 65 56 __ ADC T3 + 1 
12bc : c8 __ __ INY
12bd : 91 53 __ STA (T0 + 0),y 
12bf : 18 __ __ CLC
12c0 : a0 0e __ LDY #$0e
12c2 : b1 53 __ LDA (T0 + 0),y 
12c4 : a0 10 __ LDY #$10
12c6 : 71 53 __ ADC (T0 + 0),y 
12c8 : 91 53 __ STA (T0 + 0),y 
12ca : 88 __ __ DEY
12cb : b1 53 __ LDA (T0 + 0),y 
12cd : a0 11 __ LDY #$11
12cf : 71 53 __ ADC (T0 + 0),y 
12d1 : 91 53 __ STA (T0 + 0),y 
.s88:
12d3 : a0 08 __ LDY #$08
12d5 : b1 53 __ LDA (T0 + 0),y 
12d7 : 0a __ __ ASL
12d8 : 85 55 __ STA T3 + 0 
12da : 29 06 __ AND #$06
12dc : 85 59 __ STA T5 + 0 
12de : c8 __ __ INY
12df : b1 53 __ LDA (T0 + 0),y 
12e1 : 2a __ __ ROL
12e2 : 85 56 __ STA T3 + 1 
12e4 : 38 __ __ SEC
12e5 : a9 06 __ LDA #$06
12e7 : e5 59 __ SBC T5 + 0 
12e9 : 85 59 __ STA T5 + 0 
12eb : c8 __ __ INY
12ec : b1 53 __ LDA (T0 + 0),y 
12ee : 85 47 __ STA T6 + 0 
12f0 : 29 f8 __ AND #$f8
12f2 : 85 1b __ STA ACCU + 0 
12f4 : c8 __ __ INY
12f5 : b1 53 __ LDA (T0 + 0),y 
12f7 : 85 48 __ STA T6 + 1 
12f9 : 85 1c __ STA ACCU + 1 
12fb : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
12fe : 85 49 __ STA T8 + 0 
1300 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
1303 : ad fd 42 LDA $42fd ; (sbm.data + 0)
1306 : 85 4b __ STA T9 + 0 
1308 : 18 __ __ CLC
1309 : 65 1b __ ADC ACCU + 0 
130b : 85 5b __ STA T7 + 0 
130d : ad fe 42 LDA $42fe ; (sbm.data + 1)
1310 : 85 4c __ STA T9 + 1 
1312 : 65 1c __ ADC ACCU + 1 
1314 : aa __ __ TAX
1315 : a5 55 __ LDA T3 + 0 
1317 : 29 f8 __ AND #$f8
1319 : 18 __ __ CLC
131a : 65 5b __ ADC T7 + 0 
131c : 85 5b __ STA T7 + 0 
131e : 8a __ __ TXA
131f : 65 56 __ ADC T3 + 1 
1321 : 85 5c __ STA T7 + 1 
1323 : a5 47 __ LDA T6 + 0 
1325 : 29 07 __ AND #$07
1327 : a8 __ __ TAY
1328 : b1 5b __ LDA (T7 + 0),y 
132a : a6 59 __ LDX T5 + 0 
132c : f0 04 __ BEQ $1332 ; (main.s90 + 0)
.l89:
132e : 4a __ __ LSR
132f : ca __ __ DEX
1330 : d0 fc __ BNE $132e ; (main.l89 + 0)
.s90:
1332 : 29 03 __ AND #$03
1334 : c9 01 __ CMP #$01
1336 : f0 1b __ BEQ $1353 ; (main.s93 + 0)
.s91:
1338 : a5 48 __ LDA T6 + 1 
133a : a0 07 __ LDY #$07
133c : d1 53 __ CMP (T0 + 0),y 
133e : d0 07 __ BNE $1347 ; (main.s92 + 0)
.s131:
1340 : a5 47 __ LDA T6 + 0 
1342 : 88 __ __ DEY
1343 : d1 53 __ CMP (T0 + 0),y 
1345 : f0 0c __ BEQ $1353 ; (main.s93 + 0)
.s92:
1347 : a0 13 __ LDY #$13
1349 : b1 53 __ LDA (T0 + 0),y 
134b : 10 03 __ BPL $1350 ; (main.s92 + 9)
134d : 4c b9 10 JMP $10b9 ; (main.s83 + 0)
1350 : 4c b4 10 JMP $10b4 ; (main.l133 + 0)
.s93:
1353 : a0 00 __ LDY #$00
1355 : b1 53 __ LDA (T0 + 0),y 
1357 : 85 55 __ STA T3 + 0 
1359 : c8 __ __ INY
135a : b1 53 __ LDA (T0 + 0),y 
135c : aa __ __ TAX
135d : c8 __ __ INY
135e : b1 53 __ LDA (T0 + 0),y 
1360 : 85 59 __ STA T5 + 0 
1362 : c8 __ __ INY
1363 : b1 53 __ LDA (T0 + 0),y 
1365 : 85 5a __ STA T5 + 1 
1367 : c8 __ __ INY
1368 : b1 53 __ LDA (T0 + 0),y 
136a : 0a __ __ ASL
136b : 85 47 __ STA T6 + 0 
136d : c8 __ __ INY
136e : b1 53 __ LDA (T0 + 0),y 
1370 : 2a __ __ ROL
1371 : c9 80 __ CMP #$80
1373 : 6a __ __ ROR
1374 : 85 48 __ STA T6 + 1 
1376 : 66 47 __ ROR T6 + 0 
1378 : c8 __ __ INY
1379 : b1 53 __ LDA (T0 + 0),y 
137b : 85 5b __ STA T7 + 0 
137d : c8 __ __ INY
137e : b1 53 __ LDA (T0 + 0),y 
1380 : 85 5c __ STA T7 + 1 
1382 : a9 a2 __ LDA #$a2
1384 : 8d 02 44 STA $4402 ; (BLIT_CODE[0] + 2)
1387 : a9 b1 __ LDA #$b1
1389 : 8d 04 44 STA $4404 ; (BLIT_CODE[0] + 4)
138c : a9 49 __ LDA #$49
138e : 8d 0a 44 STA $440a ; (BLIT_CODE[0] + 10)
1391 : a9 91 __ LDA #$91
1393 : 8d 0c 44 STA $440c ; (BLIT_CODE[0] + 12)
1396 : a9 30 __ LDA #$30
1398 : 8d 10 44 STA $4410 ; (BLIT_CODE[0] + 16)
139b : a9 21 __ LDA #$21
139d : 8d 11 44 STA $4411 ; (BLIT_CODE[0] + 17)
13a0 : a9 c0 __ LDA #$c0
13a2 : 8d 13 44 STA $4413 ; (BLIT_CODE[0] + 19)
13a5 : a9 38 __ LDA #$38
13a7 : 8d 26 44 STA $4426 ; (BLIT_CODE[0] + 38)
13aa : a9 e9 __ LDA #$e9
13ac : 8d 2f 44 STA $442f ; (BLIT_CODE[0] + 47)
13af : a9 20 __ LDA #$20
13b1 : 8d 36 44 STA $4436 ; (BLIT_CODE[0] + 54)
13b4 : a9 90 __ LDA #$90
13b6 : 8d 3b 44 STA $443b ; (BLIT_CODE[0] + 59)
13b9 : a9 0f __ LDA #$0f
13bb : 8d 3c 44 STA $443c ; (BLIT_CODE[0] + 60)
13be : a9 0a __ LDA #$0a
13c0 : 8d 3e 44 STA $443e ; (BLIT_CODE[0] + 62)
13c3 : a9 03 __ LDA #$03
13c5 : 8d 45 44 STA $4445 ; (BLIT_CODE[0] + 69)
13c8 : a9 04 __ LDA #$04
13ca : 8d 4b 44 STA $444b ; (BLIT_CODE[0] + 75)
13cd : a9 18 __ LDA #$18
13cf : 8d 4c 44 STA $444c ; (BLIT_CODE[0] + 76)
13d2 : a9 05 __ LDA #$05
13d4 : 8d 52 44 STA $4452 ; (BLIT_CODE[0] + 82)
13d7 : a9 a5 __ LDA #$a5
13d9 : 8d 53 44 STA $4453 ; (BLIT_CODE[0] + 83)
13dc : a9 69 __ LDA #$69
13de : 8d 55 44 STA $4455 ; (BLIT_CODE[0] + 85)
13e1 : a9 85 __ LDA #$85
13e3 : 8d 57 44 STA $4457 ; (BLIT_CODE[0] + 87)
13e6 : a9 06 __ LDA #$06
13e8 : 8d 58 44 STA $4458 ; (BLIT_CODE[0] + 88)
13eb : a9 d0 __ LDA #$d0
13ed : 8d 5a 44 STA $445a ; (BLIT_CODE[0] + 90)
13f0 : a9 a8 __ LDA #$a8
13f2 : 8d 5b 44 STA $445b ; (BLIT_CODE[0] + 91)
13f5 : a9 c6 __ LDA #$c6
13f7 : 8d 5c 44 STA $445c ; (BLIT_CODE[0] + 92)
13fa : a9 0b __ LDA #$0b
13fc : 8d 5d 44 STA $445d ; (BLIT_CODE[0] + 93)
13ff : a9 10 __ LDA #$10
1401 : 8d 5e 44 STA $445e ; (BLIT_CODE[0] + 94)
1404 : a9 a4 __ LDA #$a4
1406 : 8d 5f 44 STA $445f ; (BLIT_CODE[0] + 95)
1409 : a9 60 __ LDA #$60
140b : 8d 60 44 STA $4460 ; (BLIT_CODE[0] + 96)
140e : a5 59 __ LDA T5 + 0 
1410 : 29 07 __ AND #$07
1412 : 8d 01 44 STA $4401 ; (BLIT_CODE[0] + 1)
1415 : 06 55 __ ASL T3 + 0 
1417 : 8a __ __ TXA
1418 : 2a __ __ ROL
1419 : c9 80 __ CMP #$80
141b : 6a __ __ ROR
141c : 85 56 __ STA T3 + 1 
141e : 66 55 __ ROR T3 + 0 
1420 : 38 __ __ SEC
1421 : a5 47 __ LDA T6 + 0 
1423 : e5 55 __ SBC T3 + 0 
1425 : 85 47 __ STA T6 + 0 
1427 : a5 48 __ LDA T6 + 1 
1429 : e5 56 __ SBC T3 + 1 
142b : 85 48 __ STA T6 + 1 
142d : 10 11 __ BPL $1440 ; (main.s94 + 0)
.s130:
142f : 38 __ __ SEC
1430 : a9 00 __ LDA #$00
1432 : e5 47 __ SBC T6 + 0 
1434 : 85 47 __ STA T6 + 0 
1436 : a9 00 __ LDA #$00
1438 : e5 48 __ SBC T6 + 1 
143a : 85 48 __ STA T6 + 1 
143c : a9 01 __ LDA #$01
143e : d0 02 __ BNE $1442 ; (main.s95 + 0)
.s94:
1440 : a9 00 __ LDA #$00
.s95:
1442 : 85 51 __ STA T12 + 0 
1444 : 38 __ __ SEC
1445 : a5 5b __ LDA T7 + 0 
1447 : e5 59 __ SBC T5 + 0 
1449 : 85 5b __ STA T7 + 0 
144b : a5 5c __ LDA T7 + 1 
144d : e5 5a __ SBC T5 + 1 
144f : 85 5c __ STA T7 + 1 
1451 : 10 17 __ BPL $146a ; (main.s96 + 0)
.s127:
1453 : a5 51 __ LDA T12 + 0 
1455 : 09 02 __ ORA #$02
1457 : 85 51 __ STA T12 + 0 
1459 : 38 __ __ SEC
145a : a9 00 __ LDA #$00
145c : e5 5b __ SBC T7 + 0 
145e : 85 5b __ STA T7 + 0 
1460 : a9 00 __ LDA #$00
1462 : e5 5c __ SBC T7 + 1 
1464 : 85 5c __ STA T7 + 1 
1466 : 24 48 __ BIT T6 + 1 
1468 : 30 10 __ BMI $147a ; (main.s97 + 0)
.s96:
146a : c5 48 __ CMP T6 + 1 
146c : d0 04 __ BNE $1472 ; (main.s129 + 0)
.s128:
146e : a5 5b __ LDA T7 + 0 
1470 : c5 47 __ CMP T6 + 0 
.s129:
1472 : b0 06 __ BCS $147a ; (main.s97 + 0)
.s126:
1474 : a5 48 __ LDA T6 + 1 
1476 : a6 47 __ LDX T6 + 0 
1478 : 90 04 __ BCC $147e ; (main.s98 + 0)
.s97:
147a : a5 5c __ LDA T7 + 1 
147c : a6 5b __ LDX T7 + 0 
.s98:
147e : e8 __ __ INX
147f : 8e 03 44 STX $4403 ; (BLIT_CODE[0] + 3)
1482 : 85 4e __ STA T10 + 1 
1484 : a9 a0 __ LDA #$a0
1486 : 8d 00 44 STA $4400 ; (BLIT_CODE[0] + 0)
1489 : 8d 24 44 STA $4424 ; (BLIT_CODE[0] + 36)
148c : a9 03 __ LDA #$03
148e : 8d 05 44 STA $4405 ; (BLIT_CODE[0] + 5)
1491 : 8d 0d 44 STA $440d ; (BLIT_CODE[0] + 13)
1494 : 8d 19 44 STA $4419 ; (BLIT_CODE[0] + 25)
1497 : 8d 1d 44 STA $441d ; (BLIT_CODE[0] + 29)
149a : 8d 41 44 STA $4441 ; (BLIT_CODE[0] + 65)
149d : a9 05 __ LDA #$05
149f : 8d 08 44 STA $4408 ; (BLIT_CODE[0] + 8)
14a2 : 8d 28 44 STA $4428 ; (BLIT_CODE[0] + 40)
14a5 : 8d 2c 44 STA $442c ; (BLIT_CODE[0] + 44)
14a8 : 8d 4e 44 STA $444e ; (BLIT_CODE[0] + 78)
14ab : a9 49 __ LDA #$49
14ad : 8d 06 44 STA $4406 ; (BLIT_CODE[0] + 6)
14b0 : a9 0a __ LDA #$0a
14b2 : 8d 09 44 STA $4409 ; (BLIT_CODE[0] + 9)
14b5 : 8d 38 44 STA $4438 ; (BLIT_CODE[0] + 56)
14b8 : 8d 3a 44 STA $443a ; (BLIT_CODE[0] + 58)
14bb : a9 a5 __ LDA #$a5
14bd : 8d 0e 44 STA $440e ; (BLIT_CODE[0] + 14)
14c0 : 8d 18 44 STA $4418 ; (BLIT_CODE[0] + 24)
14c3 : 8d 1e 44 STA $441e ; (BLIT_CODE[0] + 30)
14c6 : 8d 27 44 STA $4427 ; (BLIT_CODE[0] + 39)
14c9 : 8d 2d 44 STA $442d ; (BLIT_CODE[0] + 45)
14cc : 8d 33 44 STA $4433 ; (BLIT_CODE[0] + 51)
14cf : 8d 40 44 STA $4440 ; (BLIT_CODE[0] + 64)
14d2 : 8d 46 44 STA $4446 ; (BLIT_CODE[0] + 70)
14d5 : 8d 4d 44 STA $444d ; (BLIT_CODE[0] + 77)
14d8 : a9 06 __ LDA #$06
14da : 8d 0f 44 STA $440f ; (BLIT_CODE[0] + 15)
14dd : 8d 2e 44 STA $442e ; (BLIT_CODE[0] + 46)
14e0 : 8d 32 44 STA $4432 ; (BLIT_CODE[0] + 50)
14e3 : 8d 34 44 STA $4434 ; (BLIT_CODE[0] + 52)
14e6 : 8d 54 44 STA $4454 ; (BLIT_CODE[0] + 84)
14e9 : a9 18 __ LDA #$18
14eb : 8d 17 44 STA $4417 ; (BLIT_CODE[0] + 23)
14ee : 8d 3f 44 STA $443f ; (BLIT_CODE[0] + 63)
14f1 : a9 d0 __ LDA #$d0
14f3 : 8d 15 44 STA $4415 ; (BLIT_CODE[0] + 21)
14f6 : a9 0f __ LDA #$0f
14f8 : 8d 16 44 STA $4416 ; (BLIT_CODE[0] + 22)
14fb : a9 69 __ LDA #$69
14fd : 8d 1a 44 STA $441a ; (BLIT_CODE[0] + 26)
1500 : 8d 20 44 STA $4420 ; (BLIT_CODE[0] + 32)
1503 : 8d 42 44 STA $4442 ; (BLIT_CODE[0] + 66)
1506 : 8d 48 44 STA $4448 ; (BLIT_CODE[0] + 72)
1509 : 8d 4f 44 STA $444f ; (BLIT_CODE[0] + 79)
150c : a9 85 __ LDA #$85
150e : 8d 1c 44 STA $441c ; (BLIT_CODE[0] + 28)
1511 : 8d 22 44 STA $4422 ; (BLIT_CODE[0] + 34)
1514 : 8d 2b 44 STA $442b ; (BLIT_CODE[0] + 43)
1517 : 8d 31 44 STA $4431 ; (BLIT_CODE[0] + 49)
151a : 8d 44 44 STA $4444 ; (BLIT_CODE[0] + 68)
151d : 8d 4a 44 STA $444a ; (BLIT_CODE[0] + 74)
1520 : 8d 51 44 STA $4451 ; (BLIT_CODE[0] + 81)
1523 : a9 04 __ LDA #$04
1525 : 8d 1f 44 STA $441f ; (BLIT_CODE[0] + 31)
1528 : 8d 23 44 STA $4423 ; (BLIT_CODE[0] + 35)
152b : 8d 47 44 STA $4447 ; (BLIT_CODE[0] + 71)
152e : ad d8 41 LDA $41d8 ; (cbytes[0] + 0)
1531 : 49 ff __ EOR #$ff
1533 : 8d 07 44 STA $4407 ; (BLIT_CODE[0] + 7)
1536 : 8d 0b 44 STA $440b ; (BLIT_CODE[0] + 11)
1539 : a9 e9 __ LDA #$e9
153b : 8d 29 44 STA $4429 ; (BLIT_CODE[0] + 41)
153e : a9 10 __ LDA #$10
1540 : 8d 35 44 STA $4435 ; (BLIT_CODE[0] + 53)
1543 : a9 ca __ LDA #$ca
1545 : 8d 59 44 STA $4459 ; (BLIT_CODE[0] + 89)
1548 : a5 51 __ LDA T12 + 0 
154a : aa __ __ TAX
154b : 29 02 __ AND #$02
154d : f0 02 __ BEQ $1551 ; (main.s215 + 0)
.s214:
154f : a9 01 __ LDA #$01
.s215:
1551 : 85 1b __ STA ACCU + 0 
1553 : f0 09 __ BEQ $155e ; (main.s99 + 0)
.s125:
1555 : a9 88 __ LDA #$88
1557 : 8d 12 44 STA $4412 ; (BLIT_CODE[0] + 18)
155a : a9 ff __ LDA #$ff
155c : d0 07 __ BNE $1565 ; (main.s100 + 0)
.s99:
155e : a9 c8 __ LDA #$c8
1560 : 8d 12 44 STA $4412 ; (BLIT_CODE[0] + 18)
1563 : a9 08 __ LDA #$08
.s100:
1565 : 8d 14 44 STA $4414 ; (BLIT_CODE[0] + 20)
1568 : a5 49 __ LDA T8 + 0 
156a : 0a __ __ ASL
156b : 85 51 __ STA T12 + 0 
156d : a9 00 __ LDA #$00
156f : 2a __ __ ROL
1570 : 06 51 __ ASL T12 + 0 
1572 : 2a __ __ ROL
1573 : 06 51 __ ASL T12 + 0 
1575 : 2a __ __ ROL
1576 : 85 52 __ STA T12 + 1 
1578 : a5 1b __ LDA ACCU + 0 
157a : d0 0d __ BNE $1589 ; (main.s124 + 0)
.s101:
157c : 8d 25 44 STA $4425 ; (BLIT_CODE[0] + 37)
157f : a5 51 __ LDA T12 + 0 
1581 : 8d 1b 44 STA $441b ; (BLIT_CODE[0] + 27)
1584 : a5 52 __ LDA T12 + 1 
1586 : 4c 98 15 JMP $1598 ; (main.s203 + 0)
.s124:
1589 : 8c 25 44 STY $4425 ; (BLIT_CODE[0] + 37)
158c : 38 __ __ SEC
158d : a9 00 __ LDA #$00
158f : e5 51 __ SBC T12 + 0 
1591 : 8d 1b 44 STA $441b ; (BLIT_CODE[0] + 27)
1594 : a9 00 __ LDA #$00
1596 : e5 52 __ SBC T12 + 1 
.s203:
1598 : 8d 21 44 STA $4421 ; (BLIT_CODE[0] + 33)
159b : a5 47 __ LDA T6 + 0 
159d : 0a __ __ ASL
159e : 8d 2a 44 STA $442a ; (BLIT_CODE[0] + 42)
15a1 : a5 48 __ LDA T6 + 1 
15a3 : 2a __ __ ROL
15a4 : 8d 30 44 STA $4430 ; (BLIT_CODE[0] + 48)
15a7 : 8a __ __ TXA
15a8 : 29 01 __ AND #$01
15aa : 85 51 __ STA T12 + 0 
15ac : f0 09 __ BEQ $15b7 ; (main.s102 + 0)
.s123:
15ae : a9 06 __ LDA #$06
15b0 : 8d 37 44 STA $4437 ; (BLIT_CODE[0] + 55)
15b3 : a9 26 __ LDA #$26
15b5 : d0 07 __ BNE $15be ; (main.s204 + 0)
.s102:
15b7 : a9 46 __ LDA #$46
15b9 : 8d 37 44 STA $4437 ; (BLIT_CODE[0] + 55)
15bc : a9 66 __ LDA #$66
.s204:
15be : 8d 39 44 STA $4439 ; (BLIT_CODE[0] + 57)
15c1 : a5 51 __ LDA T12 + 0 
15c3 : f0 0e __ BEQ $15d3 ; (main.s103 + 0)
.s122:
15c5 : a9 26 __ LDA #$26
15c7 : 8d 3d 44 STA $443d ; (BLIT_CODE[0] + 61)
15ca : a9 f8 __ LDA #$f8
15cc : 8d 43 44 STA $4443 ; (BLIT_CODE[0] + 67)
15cf : a9 ff __ LDA #$ff
15d1 : d0 0a __ BNE $15dd ; (main.s104 + 0)
.s103:
15d3 : a2 66 __ LDX #$66
15d5 : 8e 3d 44 STX $443d ; (BLIT_CODE[0] + 61)
15d8 : a2 08 __ LDX #$08
15da : 8e 43 44 STX $4443 ; (BLIT_CODE[0] + 67)
.s104:
15dd : 8d 49 44 STA $4449 ; (BLIT_CODE[0] + 73)
15e0 : a5 5b __ LDA T7 + 0 
15e2 : 0a __ __ ASL
15e3 : 8d 50 44 STA $4450 ; (BLIT_CODE[0] + 80)
15e6 : a5 5c __ LDA T7 + 1 
15e8 : 2a __ __ ROL
15e9 : 8d 56 44 STA $4456 ; (BLIT_CODE[0] + 86)
15ec : a5 59 __ LDA T5 + 0 
15ee : 29 f8 __ AND #$f8
15f0 : 85 1b __ STA ACCU + 0 
15f2 : a5 5a __ LDA T5 + 1 
15f4 : 85 1c __ STA ACCU + 1 
15f6 : a5 49 __ LDA T8 + 0 
15f8 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
15fb : 18 __ __ CLC
15fc : a5 4b __ LDA T9 + 0 
15fe : 65 1b __ ADC ACCU + 0 
1600 : aa __ __ TAX
1601 : a5 4c __ LDA T9 + 1 
1603 : 65 1c __ ADC ACCU + 1 
1605 : 85 4c __ STA T9 + 1 
1607 : a5 55 __ LDA T3 + 0 
1609 : 29 fc __ AND #$fc
160b : 0a __ __ ASL
160c : 85 59 __ STA T5 + 0 
160e : a5 56 __ LDA T3 + 1 
1610 : 2a __ __ ROL
1611 : a8 __ __ TAY
1612 : 8a __ __ TXA
1613 : 18 __ __ CLC
1614 : 65 59 __ ADC T5 + 0 
1616 : 85 03 __ STA WORK + 0 
1618 : 98 __ __ TYA
1619 : 65 4c __ ADC T9 + 1 
161b : 85 04 __ STA WORK + 1 
161d : 38 __ __ SEC
161e : a5 5b __ LDA T7 + 0 
1620 : e5 47 __ SBC T6 + 0 
1622 : 85 05 __ STA WORK + 2 
1624 : a5 5c __ LDA T7 + 1 
1626 : e5 48 __ SBC T6 + 1 
1628 : 85 06 __ STA WORK + 3 
162a : a5 4e __ LDA T10 + 1 
162c : 85 0b __ STA WORK + 8 
162e : a5 55 __ LDA T3 + 0 
1630 : 29 03 __ AND #$03
1632 : 0a __ __ ASL
1633 : aa __ __ TAX
1634 : bd e6 41 LDA $41e6,x ; (ormask[0] + 0)
1637 : 85 0a __ STA WORK + 7 
1639 : 20 00 44 JSR $4400 ; (BLIT_CODE[0] + 0)
163c : a5 fa __ LDA $fa ; (efree + 1)
163e : 85 56 __ STA T3 + 1 
1640 : a5 f9 __ LDA $f9 ; (efree + 0)
1642 : 85 55 __ STA T3 + 0 
1644 : 05 fa __ ORA $fa ; (efree + 1)
1646 : f0 48 __ BEQ $1690 ; (main.s105 + 0)
.s121:
1648 : a9 00 __ LDA #$00
164a : a0 04 __ LDY #$04
164c : 91 f9 __ STA ($f9),y ; (efree + 0)
164e : c8 __ __ INY
164f : b1 f9 __ LDA ($f9),y ; (efree + 0)
1651 : 85 f9 __ STA $f9 ; (efree + 0)
1653 : c8 __ __ INY
1654 : b1 55 __ LDA (T3 + 0),y 
1656 : 85 fa __ STA $fa ; (efree + 1)
1658 : a0 08 __ LDY #$08
165a : b1 53 __ LDA (T0 + 0),y 
165c : 0a __ __ ASL
165d : aa __ __ TAX
165e : c8 __ __ INY
165f : b1 53 __ LDA (T0 + 0),y 
1661 : 2a __ __ ROL
1662 : 85 5a __ STA T5 + 1 
1664 : c8 __ __ INY
1665 : b1 53 __ LDA (T0 + 0),y 
1667 : a0 02 __ LDY #$02
1669 : 91 55 __ STA (T3 + 0),y 
166b : a0 0b __ LDY #$0b
166d : b1 53 __ LDA (T0 + 0),y 
166f : a0 03 __ LDY #$03
1671 : 91 55 __ STA (T3 + 0),y 
1673 : 8a __ __ TXA
1674 : a0 00 __ LDY #$00
1676 : 91 55 __ STA (T3 + 0),y 
1678 : a5 5a __ LDA T5 + 1 
167a : c8 __ __ INY
167b : 91 55 __ STA (T3 + 0),y 
167d : a5 f7 __ LDA $f7 ; (eused + 0)
167f : a0 05 __ LDY #$05
1681 : 91 55 __ STA (T3 + 0),y 
1683 : a5 f8 __ LDA $f8 ; (eused + 1)
1685 : c8 __ __ INY
1686 : 91 55 __ STA (T3 + 0),y 
1688 : a5 55 __ LDA T3 + 0 
168a : 85 f7 __ STA $f7 ; (eused + 0)
168c : a5 56 __ LDA T3 + 1 
168e : 85 f8 __ STA $f8 ; (eused + 1)
.s105:
1690 : a0 0b __ LDY #$0b
1692 : b1 53 __ LDA (T0 + 0),y 
1694 : a0 07 __ LDY #$07
1696 : d1 53 __ CMP (T0 + 0),y 
1698 : d0 54 __ BNE $16ee ; (main.s106 + 0)
.s120:
169a : a0 0a __ LDY #$0a
169c : b1 53 __ LDA (T0 + 0),y 
169e : a0 06 __ LDY #$06
16a0 : d1 53 __ CMP (T0 + 0),y 
16a2 : d0 4a __ BNE $16ee ; (main.s106 + 0)
.s114:
16a4 : a0 08 __ LDY #$08
16a6 : b1 53 __ LDA (T0 + 0),y 
16a8 : 0a __ __ ASL
16a9 : aa __ __ TAX
16aa : c8 __ __ INY
16ab : b1 53 __ LDA (T0 + 0),y 
16ad : 2a __ __ ROL
16ae : 85 56 __ STA T3 + 1 
16b0 : 30 09 __ BMI $16bb ; (main.s115 + 0)
.s119:
16b2 : f0 03 __ BEQ $16b7 ; (main.s118 + 0)
16b4 : 4c 6c 17 JMP $176c ; (main.s117 + 0)
.s118:
16b7 : e0 a1 __ CPX #$a1
16b9 : b0 f9 __ BCS $16b4 ; (main.s119 + 2)
.s115:
16bb : 8a __ __ TXA
16bc : 38 __ __ SEC
16bd : e9 3a __ SBC #$3a
16bf : 85 59 __ STA T5 + 0 
16c1 : a5 56 __ LDA T3 + 1 
16c3 : e9 00 __ SBC #$00
16c5 : 4a __ __ LSR
16c6 : 66 59 __ ROR T5 + 0 
16c8 : 4a __ __ LSR
16c9 : 66 59 __ ROR T5 + 0 
16cb : 4a __ __ LSR
16cc : 66 59 __ ROR T5 + 0 
16ce : 4a __ __ LSR
16cf : 66 59 __ ROR T5 + 0 
16d1 : 4a __ __ LSR
16d2 : 66 59 __ ROR T5 + 0 
16d4 : a6 59 __ LDX T5 + 0 
16d6 : bd 4d 43 LDA $434d,x ; (cities[0] + 0)
16d9 : f0 13 __ BEQ $16ee ; (main.s106 + 0)
.s116:
16db : ce 53 43 DEC $4353 ; (ncities + 0)
16de : a9 00 __ LDA #$00
16e0 : 9d 4d 43 STA $434d,x ; (cities[0] + 0)
16e3 : bd 89 42 LDA $4289,x ; (bitshift[0] + 9)
16e6 : 49 ff __ EOR #$ff
16e8 : 2d 15 d0 AND $d015 
16eb : 8d 15 d0 STA $d015 
.s106:
16ee : a9 19 __ LDA #$19
16f0 : 85 55 __ STA T3 + 0 
16f2 : a9 00 __ LDA #$00
16f4 : 85 56 __ STA T3 + 1 
16f6 : a9 09 __ LDA #$09
16f8 : 85 49 __ STA T8 + 0 
.l107:
16fa : a5 55 __ LDA T3 + 0 
16fc : 85 1b __ STA ACCU + 0 
16fe : a5 56 __ LDA T3 + 1 
1700 : 85 1c __ STA ACCU + 1 
1702 : 20 84 38 JSR $3884 ; (divmod@proxy + 0)
1705 : a5 1b __ LDA ACCU + 0 
1707 : 85 55 __ STA T3 + 0 
1709 : a5 1c __ LDA ACCU + 1 
170b : 85 56 __ STA T3 + 1 
170d : a4 49 __ LDY T8 + 0 
170f : b9 00 c8 LDA $c800,y 
1712 : 18 __ __ CLC
1713 : 65 05 __ ADC WORK + 2 
1715 : c9 3a __ CMP #$3a
1717 : 90 11 __ BCC $172a ; (main.s108 + 0)
.s113:
1719 : aa __ __ TAX
171a : a5 1b __ LDA ACCU + 0 
171c : 69 00 __ ADC #$00
171e : 85 55 __ STA T3 + 0 
1720 : a5 1c __ LDA ACCU + 1 
1722 : 69 00 __ ADC #$00
1724 : 85 56 __ STA T3 + 1 
1726 : 8a __ __ TXA
1727 : 38 __ __ SEC
1728 : e9 0a __ SBC #$0a
.s108:
172a : 99 00 c8 STA $c800,y 
172d : c6 49 __ DEC T8 + 0 
172f : a5 55 __ LDA T3 + 0 
1731 : 05 56 __ ORA T3 + 1 
1733 : d0 c5 __ BNE $16fa ; (main.l107 + 0)
.s109:
1735 : a0 14 __ LDY #$14
1737 : b1 53 __ LDA (T0 + 0),y 
1739 : aa __ __ TAX
173a : c8 __ __ INY
173b : b1 53 __ LDA (T0 + 0),y 
173d : 85 56 __ STA T3 + 1 
173f : a5 45 __ LDA T2 + 0 
1741 : 05 46 __ ORA T2 + 1 
1743 : f0 0b __ BEQ $1750 ; (main.s110 + 0)
.s112:
1745 : 8a __ __ TXA
1746 : 88 __ __ DEY
1747 : 91 45 __ STA (T2 + 0),y 
1749 : a5 56 __ LDA T3 + 1 
174b : c8 __ __ INY
174c : 91 45 __ STA (T2 + 0),y 
174e : d0 06 __ BNE $1756 ; (main.s111 + 0)
.s110:
1750 : 86 fb __ STX $fb ; (iused + 0)
1752 : a5 56 __ LDA T3 + 1 
1754 : 85 fc __ STA $fc ; (iused + 1)
.s111:
1756 : a5 fd __ LDA $fd ; (ifree + 0)
1758 : a0 14 __ LDY #$14
175a : 91 53 __ STA (T0 + 0),y 
175c : a5 fe __ LDA $fe ; (ifree + 1)
175e : c8 __ __ INY
175f : 91 53 __ STA (T0 + 0),y 
1761 : a5 53 __ LDA T0 + 0 
1763 : 85 fd __ STA $fd ; (ifree + 0)
1765 : a5 54 __ LDA T0 + 1 
1767 : 85 fe __ STA $fe ; (ifree + 1)
1769 : 4c 22 11 JMP $1122 ; (main.s84 + 0)
.s117:
176c : 8a __ __ TXA
176d : 38 __ __ SEC
176e : e9 ca __ SBC #$ca
1770 : 85 55 __ STA T3 + 0 
1772 : a5 56 __ LDA T3 + 1 
1774 : e9 00 __ SBC #$00
1776 : 4a __ __ LSR
1777 : 66 55 __ ROR T3 + 0 
1779 : 4a __ __ LSR
177a : 66 55 __ ROR T3 + 0 
177c : 4a __ __ LSR
177d : 66 55 __ ROR T3 + 0 
177f : 4a __ __ LSR
1780 : 66 55 __ ROR T3 + 0 
1782 : 4a __ __ LSR
1783 : a5 55 __ LDA T3 + 0 
1785 : 6a __ __ ROR
1786 : 18 __ __ CLC
1787 : 69 03 __ ADC #$03
1789 : aa __ __ TAX
178a : bd 4d 43 LDA $434d,x ; (cities[0] + 0)
178d : d0 03 __ BNE $1792 ; (main.s117 + 38)
178f : 4c ee 16 JMP $16ee ; (main.s106 + 0)
1792 : 4c db 16 JMP $16db ; (main.s116 + 0)
.l134:
1795 : a0 10 __ LDY #$10
1797 : b1 43 __ LDA (T1 + 0),y 
1799 : 85 45 __ STA T2 + 0 
179b : a0 14 __ LDY #$14
179d : b1 43 __ LDA (T1 + 0),y 
179f : 85 55 __ STA T3 + 0 
17a1 : c8 __ __ INY
17a2 : b1 43 __ LDA (T1 + 0),y 
17a4 : 85 56 __ STA T3 + 1 
17a6 : a0 11 __ LDY #$11
17a8 : b1 43 __ LDA (T1 + 0),y 
17aa : 30 27 __ BMI $17d3 ; (main.s135 + 0)
.s166:
17ac : aa __ __ TAX
17ad : 18 __ __ CLC
17ae : a0 0a __ LDY #$0a
17b0 : b1 43 __ LDA (T1 + 0),y 
17b2 : 69 ff __ ADC #$ff
17b4 : 91 43 __ STA (T1 + 0),y 
17b6 : c8 __ __ INY
17b7 : b1 43 __ LDA (T1 + 0),y 
17b9 : 69 ff __ ADC #$ff
17bb : 91 43 __ STA (T1 + 0),y 
17bd : a5 45 __ LDA T2 + 0 
17bf : 38 __ __ SEC
17c0 : c8 __ __ INY
17c1 : f1 43 __ SBC (T1 + 0),y 
17c3 : a0 10 __ LDY #$10
17c5 : 91 43 __ STA (T1 + 0),y 
17c7 : 8a __ __ TXA
17c8 : a0 0d __ LDY #$0d
17ca : f1 43 __ SBC (T1 + 0),y 
17cc : a0 11 __ LDY #$11
17ce : 91 43 __ STA (T1 + 0),y 
17d0 : aa __ __ TAX
17d1 : 10 2a __ BPL $17fd ; (main.s136 + 0)
.s135:
17d3 : a2 00 __ LDX #$00
17d5 : a0 12 __ LDY #$12
17d7 : b1 43 __ LDA (T1 + 0),y 
17d9 : 10 01 __ BPL $17dc ; (main.s211 + 0)
.s210:
17db : ca __ __ DEX
.s211:
17dc : 18 __ __ CLC
17dd : a0 08 __ LDY #$08
17df : 71 43 __ ADC (T1 + 0),y 
17e1 : 91 43 __ STA (T1 + 0),y 
17e3 : 8a __ __ TXA
17e4 : c8 __ __ INY
17e5 : 71 43 __ ADC (T1 + 0),y 
17e7 : 91 43 __ STA (T1 + 0),y 
17e9 : 18 __ __ CLC
17ea : a0 0e __ LDY #$0e
17ec : b1 43 __ LDA (T1 + 0),y 
17ee : a0 10 __ LDY #$10
17f0 : 71 43 __ ADC (T1 + 0),y 
17f2 : 91 43 __ STA (T1 + 0),y 
17f4 : 88 __ __ DEY
17f5 : b1 43 __ LDA (T1 + 0),y 
17f7 : a0 11 __ LDY #$11
17f9 : 71 43 __ ADC (T1 + 0),y 
17fb : 91 43 __ STA (T1 + 0),y 
.s136:
17fd : a0 06 __ LDY #$06
17ff : b1 43 __ LDA (T1 + 0),y 
1801 : 85 45 __ STA T2 + 0 
1803 : c8 __ __ INY
1804 : b1 43 __ LDA (T1 + 0),y 
1806 : 85 46 __ STA T2 + 1 
1808 : a0 0a __ LDY #$0a
180a : b1 43 __ LDA (T1 + 0),y 
180c : 85 57 __ STA T4 + 0 
180e : c8 __ __ INY
180f : b1 43 __ LDA (T1 + 0),y 
1811 : 85 1c __ STA ACCU + 1 
1813 : c5 46 __ CMP T2 + 1 
1815 : d0 06 __ BNE $181d ; (main.s137 + 0)
.s165:
1817 : a5 57 __ LDA T4 + 0 
1819 : c5 45 __ CMP T2 + 0 
181b : f0 6d __ BEQ $188a ; (main.s139 + 0)
.s137:
181d : a0 08 __ LDY #$08
181f : b1 43 __ LDA (T1 + 0),y 
1821 : 0a __ __ ASL
1822 : 85 53 __ STA T0 + 0 
1824 : 29 f8 __ AND #$f8
1826 : 85 45 __ STA T2 + 0 
1828 : c8 __ __ INY
1829 : b1 43 __ LDA (T1 + 0),y 
182b : 2a __ __ ROL
182c : 85 54 __ STA T0 + 1 
182e : a5 57 __ LDA T4 + 0 
1830 : 29 f8 __ AND #$f8
1832 : 85 1b __ STA ACCU + 0 
1834 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
1837 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
183a : ad fd 42 LDA $42fd ; (sbm.data + 0)
183d : 18 __ __ CLC
183e : 65 1b __ ADC ACCU + 0 
1840 : 85 59 __ STA T5 + 0 
1842 : ad fe 42 LDA $42fe ; (sbm.data + 1)
1845 : 65 1c __ ADC ACCU + 1 
1847 : aa __ __ TAX
1848 : a5 57 __ LDA T4 + 0 
184a : 29 07 __ AND #$07
184c : 05 45 __ ORA T2 + 0 
184e : 18 __ __ CLC
184f : 65 59 __ ADC T5 + 0 
1851 : 85 59 __ STA T5 + 0 
1853 : 8a __ __ TXA
1854 : 65 54 __ ADC T0 + 1 
1856 : 85 5a __ STA T5 + 1 
1858 : ad db 41 LDA $41db ; (cbytes[0] + 3)
185b : a0 00 __ LDY #$00
185d : 51 59 __ EOR (T5 + 0),y 
185f : 85 45 __ STA T2 + 0 
1861 : a5 53 __ LDA T0 + 0 
1863 : 29 07 __ AND #$07
1865 : aa __ __ TAX
1866 : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
1869 : 25 45 __ AND T2 + 0 
186b : 4d db 41 EOR $41db ; (cbytes[0] + 3)
186e : 91 59 __ STA (T5 + 0),y 
1870 : a5 43 __ LDA T1 + 0 
1872 : 85 53 __ STA T0 + 0 
1874 : a5 44 __ LDA T1 + 1 
1876 : 85 54 __ STA T0 + 1 
.s138:
1878 : a5 55 __ LDA T3 + 0 
187a : 85 43 __ STA T1 + 0 
187c : a5 56 __ LDA T3 + 1 
187e : 85 44 __ STA T1 + 1 
1880 : 05 55 __ ORA T3 + 0 
1882 : f0 03 __ BEQ $1887 ; (main.s138 + 15)
1884 : 4c 95 17 JMP $1795 ; (main.l134 + 0)
1887 : 4c 7f 10 JMP $107f ; (main.s59 + 0)
.s139:
188a : a0 00 __ LDY #$00
188c : b1 43 __ LDA (T1 + 0),y 
188e : 85 57 __ STA T4 + 0 
1890 : c8 __ __ INY
1891 : b1 43 __ LDA (T1 + 0),y 
1893 : aa __ __ TAX
1894 : c8 __ __ INY
1895 : b1 43 __ LDA (T1 + 0),y 
1897 : 85 59 __ STA T5 + 0 
1899 : c8 __ __ INY
189a : b1 43 __ LDA (T1 + 0),y 
189c : 85 5a __ STA T5 + 1 
189e : c8 __ __ INY
189f : b1 43 __ LDA (T1 + 0),y 
18a1 : 0a __ __ ASL
18a2 : 85 47 __ STA T6 + 0 
18a4 : c8 __ __ INY
18a5 : b1 43 __ LDA (T1 + 0),y 
18a7 : 2a __ __ ROL
18a8 : c9 80 __ CMP #$80
18aa : 6a __ __ ROR
18ab : 66 47 __ ROR T6 + 0 
18ad : a0 a2 __ LDY #$a2
18af : 8c 02 44 STY $4402 ; (BLIT_CODE[0] + 2)
18b2 : a0 b1 __ LDY #$b1
18b4 : 8c 04 44 STY $4404 ; (BLIT_CODE[0] + 4)
18b7 : a0 49 __ LDY #$49
18b9 : 8c 0a 44 STY $440a ; (BLIT_CODE[0] + 10)
18bc : a0 91 __ LDY #$91
18be : 8c 0c 44 STY $440c ; (BLIT_CODE[0] + 12)
18c1 : a0 21 __ LDY #$21
18c3 : 8c 11 44 STY $4411 ; (BLIT_CODE[0] + 17)
18c6 : a0 c0 __ LDY #$c0
18c8 : 8c 13 44 STY $4413 ; (BLIT_CODE[0] + 19)
18cb : a0 a0 __ LDY #$a0
18cd : 8c 24 44 STY $4424 ; (BLIT_CODE[0] + 36)
18d0 : a0 e9 __ LDY #$e9
18d2 : 8c 2f 44 STY $442f ; (BLIT_CODE[0] + 47)
18d5 : a0 20 __ LDY #$20
18d7 : 8c 36 44 STY $4436 ; (BLIT_CODE[0] + 54)
18da : a0 90 __ LDY #$90
18dc : 8c 3b 44 STY $443b ; (BLIT_CODE[0] + 59)
18df : a0 0f __ LDY #$0f
18e1 : 8c 3c 44 STY $443c ; (BLIT_CODE[0] + 60)
18e4 : a0 0a __ LDY #$0a
18e6 : 8c 3e 44 STY $443e ; (BLIT_CODE[0] + 62)
18e9 : a0 03 __ LDY #$03
18eb : 8c 45 44 STY $4445 ; (BLIT_CODE[0] + 69)
18ee : c8 __ __ INY
18ef : 8c 4b 44 STY $444b ; (BLIT_CODE[0] + 75)
18f2 : a0 18 __ LDY #$18
18f4 : 8c 4c 44 STY $444c ; (BLIT_CODE[0] + 76)
18f7 : a0 05 __ LDY #$05
18f9 : 8c 52 44 STY $4452 ; (BLIT_CODE[0] + 82)
18fc : a0 a5 __ LDY #$a5
18fe : 8c 53 44 STY $4453 ; (BLIT_CODE[0] + 83)
1901 : a0 69 __ LDY #$69
1903 : 8c 55 44 STY $4455 ; (BLIT_CODE[0] + 85)
1906 : a0 85 __ LDY #$85
1908 : 8c 57 44 STY $4457 ; (BLIT_CODE[0] + 87)
190b : a0 06 __ LDY #$06
190d : 8c 58 44 STY $4458 ; (BLIT_CODE[0] + 88)
1910 : a0 ca __ LDY #$ca
1912 : 8c 59 44 STY $4459 ; (BLIT_CODE[0] + 89)
1915 : a0 d0 __ LDY #$d0
1917 : 8c 5a 44 STY $445a ; (BLIT_CODE[0] + 90)
191a : a0 a8 __ LDY #$a8
191c : 8c 5b 44 STY $445b ; (BLIT_CODE[0] + 91)
191f : a0 c6 __ LDY #$c6
1921 : 8c 5c 44 STY $445c ; (BLIT_CODE[0] + 92)
1924 : a0 0b __ LDY #$0b
1926 : 8c 5d 44 STY $445d ; (BLIT_CODE[0] + 93)
1929 : a0 10 __ LDY #$10
192b : 8c 5e 44 STY $445e ; (BLIT_CODE[0] + 94)
192e : a0 a4 __ LDY #$a4
1930 : 8c 5f 44 STY $445f ; (BLIT_CODE[0] + 95)
1933 : a0 60 __ LDY #$60
1935 : 8c 60 44 STY $4460 ; (BLIT_CODE[0] + 96)
1938 : a8 __ __ TAY
1939 : a5 59 __ LDA T5 + 0 
193b : 29 07 __ AND #$07
193d : 8d 01 44 STA $4401 ; (BLIT_CODE[0] + 1)
1940 : 06 57 __ ASL T4 + 0 
1942 : 8a __ __ TXA
1943 : 2a __ __ ROL
1944 : c9 80 __ CMP #$80
1946 : 6a __ __ ROR
1947 : 85 58 __ STA T4 + 1 
1949 : 66 57 __ ROR T4 + 0 
194b : 38 __ __ SEC
194c : a5 47 __ LDA T6 + 0 
194e : e5 57 __ SBC T4 + 0 
1950 : 85 47 __ STA T6 + 0 
1952 : 98 __ __ TYA
1953 : e5 58 __ SBC T4 + 1 
1955 : 85 48 __ STA T6 + 1 
1957 : 10 11 __ BPL $196a ; (main.s140 + 0)
.s164:
1959 : 38 __ __ SEC
195a : a9 00 __ LDA #$00
195c : e5 47 __ SBC T6 + 0 
195e : 85 47 __ STA T6 + 0 
1960 : a9 00 __ LDA #$00
1962 : e5 48 __ SBC T6 + 1 
1964 : 85 48 __ STA T6 + 1 
1966 : a0 01 __ LDY #$01
1968 : d0 02 __ BNE $196c ; (main.s141 + 0)
.s140:
196a : a0 00 __ LDY #$00
.s141:
196c : 38 __ __ SEC
196d : a5 45 __ LDA T2 + 0 
196f : e5 59 __ SBC T5 + 0 
1971 : 85 45 __ STA T2 + 0 
1973 : a5 46 __ LDA T2 + 1 
1975 : e5 5a __ SBC T5 + 1 
1977 : 85 46 __ STA T2 + 1 
1979 : 10 15 __ BPL $1990 ; (main.s142 + 0)
.s161:
197b : 98 __ __ TYA
197c : 09 02 __ ORA #$02
197e : a8 __ __ TAY
197f : 38 __ __ SEC
1980 : a9 00 __ LDA #$00
1982 : e5 45 __ SBC T2 + 0 
1984 : 85 45 __ STA T2 + 0 
1986 : a9 00 __ LDA #$00
1988 : e5 46 __ SBC T2 + 1 
198a : 85 46 __ STA T2 + 1 
198c : 24 48 __ BIT T6 + 1 
198e : 30 10 __ BMI $19a0 ; (main.s143 + 0)
.s142:
1990 : c5 48 __ CMP T6 + 1 
1992 : d0 04 __ BNE $1998 ; (main.s163 + 0)
.s162:
1994 : a5 45 __ LDA T2 + 0 
1996 : c5 47 __ CMP T6 + 0 
.s163:
1998 : b0 06 __ BCS $19a0 ; (main.s143 + 0)
.s160:
199a : a5 48 __ LDA T6 + 1 
199c : a6 47 __ LDX T6 + 0 
199e : 90 04 __ BCC $19a4 ; (main.s144 + 0)
.s143:
19a0 : a5 46 __ LDA T2 + 1 
19a2 : a6 45 __ LDX T2 + 0 
.s144:
19a4 : e8 __ __ INX
19a5 : 8e 03 44 STX $4403 ; (BLIT_CODE[0] + 3)
19a8 : 85 5c __ STA T7 + 1 
19aa : a9 03 __ LDA #$03
19ac : 8d 05 44 STA $4405 ; (BLIT_CODE[0] + 5)
19af : 8d 0d 44 STA $440d ; (BLIT_CODE[0] + 13)
19b2 : 8d 19 44 STA $4419 ; (BLIT_CODE[0] + 25)
19b5 : 8d 1d 44 STA $441d ; (BLIT_CODE[0] + 29)
19b8 : 8d 41 44 STA $4441 ; (BLIT_CODE[0] + 65)
19bb : a9 a0 __ LDA #$a0
19bd : 8d 00 44 STA $4400 ; (BLIT_CODE[0] + 0)
19c0 : a9 05 __ LDA #$05
19c2 : 8d 08 44 STA $4408 ; (BLIT_CODE[0] + 8)
19c5 : 8d 28 44 STA $4428 ; (BLIT_CODE[0] + 40)
19c8 : 8d 2c 44 STA $442c ; (BLIT_CODE[0] + 44)
19cb : 8d 4e 44 STA $444e ; (BLIT_CODE[0] + 78)
19ce : a9 49 __ LDA #$49
19d0 : 8d 06 44 STA $4406 ; (BLIT_CODE[0] + 6)
19d3 : a9 0a __ LDA #$0a
19d5 : 8d 09 44 STA $4409 ; (BLIT_CODE[0] + 9)
19d8 : 8d 38 44 STA $4438 ; (BLIT_CODE[0] + 56)
19db : 8d 3a 44 STA $443a ; (BLIT_CODE[0] + 58)
19de : a9 a5 __ LDA #$a5
19e0 : 8d 0e 44 STA $440e ; (BLIT_CODE[0] + 14)
19e3 : 8d 18 44 STA $4418 ; (BLIT_CODE[0] + 24)
19e6 : 8d 1e 44 STA $441e ; (BLIT_CODE[0] + 30)
19e9 : 8d 27 44 STA $4427 ; (BLIT_CODE[0] + 39)
19ec : 8d 2d 44 STA $442d ; (BLIT_CODE[0] + 45)
19ef : 8d 33 44 STA $4433 ; (BLIT_CODE[0] + 51)
19f2 : 8d 40 44 STA $4440 ; (BLIT_CODE[0] + 64)
19f5 : 8d 46 44 STA $4446 ; (BLIT_CODE[0] + 70)
19f8 : 8d 4d 44 STA $444d ; (BLIT_CODE[0] + 77)
19fb : a9 06 __ LDA #$06
19fd : 8d 0f 44 STA $440f ; (BLIT_CODE[0] + 15)
1a00 : 8d 2e 44 STA $442e ; (BLIT_CODE[0] + 46)
1a03 : 8d 32 44 STA $4432 ; (BLIT_CODE[0] + 50)
1a06 : 8d 34 44 STA $4434 ; (BLIT_CODE[0] + 52)
1a09 : 8d 54 44 STA $4454 ; (BLIT_CODE[0] + 84)
1a0c : a9 18 __ LDA #$18
1a0e : 8d 17 44 STA $4417 ; (BLIT_CODE[0] + 23)
1a11 : 8d 3f 44 STA $443f ; (BLIT_CODE[0] + 63)
1a14 : a9 30 __ LDA #$30
1a16 : 8d 10 44 STA $4410 ; (BLIT_CODE[0] + 16)
1a19 : a9 d0 __ LDA #$d0
1a1b : 8d 15 44 STA $4415 ; (BLIT_CODE[0] + 21)
1a1e : a9 0f __ LDA #$0f
1a20 : 8d 16 44 STA $4416 ; (BLIT_CODE[0] + 22)
1a23 : a9 69 __ LDA #$69
1a25 : 8d 1a 44 STA $441a ; (BLIT_CODE[0] + 26)
1a28 : 8d 20 44 STA $4420 ; (BLIT_CODE[0] + 32)
1a2b : 8d 42 44 STA $4442 ; (BLIT_CODE[0] + 66)
1a2e : 8d 48 44 STA $4448 ; (BLIT_CODE[0] + 72)
1a31 : 8d 4f 44 STA $444f ; (BLIT_CODE[0] + 79)
1a34 : a9 85 __ LDA #$85
1a36 : 8d 1c 44 STA $441c ; (BLIT_CODE[0] + 28)
1a39 : 8d 22 44 STA $4422 ; (BLIT_CODE[0] + 34)
1a3c : 8d 2b 44 STA $442b ; (BLIT_CODE[0] + 43)
1a3f : 8d 31 44 STA $4431 ; (BLIT_CODE[0] + 49)
1a42 : 8d 44 44 STA $4444 ; (BLIT_CODE[0] + 68)
1a45 : 8d 4a 44 STA $444a ; (BLIT_CODE[0] + 74)
1a48 : 8d 51 44 STA $4451 ; (BLIT_CODE[0] + 81)
1a4b : a9 04 __ LDA #$04
1a4d : 8d 1f 44 STA $441f ; (BLIT_CODE[0] + 31)
1a50 : 8d 23 44 STA $4423 ; (BLIT_CODE[0] + 35)
1a53 : 8d 47 44 STA $4447 ; (BLIT_CODE[0] + 71)
1a56 : ad d8 41 LDA $41d8 ; (cbytes[0] + 0)
1a59 : 49 ff __ EOR #$ff
1a5b : 8d 07 44 STA $4407 ; (BLIT_CODE[0] + 7)
1a5e : 8d 0b 44 STA $440b ; (BLIT_CODE[0] + 11)
1a61 : a9 38 __ LDA #$38
1a63 : 8d 26 44 STA $4426 ; (BLIT_CODE[0] + 38)
1a66 : a9 e9 __ LDA #$e9
1a68 : 8d 29 44 STA $4429 ; (BLIT_CODE[0] + 41)
1a6b : a9 10 __ LDA #$10
1a6d : 8d 35 44 STA $4435 ; (BLIT_CODE[0] + 53)
1a70 : 98 __ __ TYA
1a71 : 29 02 __ AND #$02
1a73 : f0 02 __ BEQ $1a77 ; (main.s217 + 0)
.s216:
1a75 : a9 01 __ LDA #$01
.s217:
1a77 : 85 4f __ STA T11 + 0 
1a79 : f0 09 __ BEQ $1a84 ; (main.s145 + 0)
.s159:
1a7b : a9 88 __ LDA #$88
1a7d : 8d 12 44 STA $4412 ; (BLIT_CODE[0] + 18)
1a80 : a9 ff __ LDA #$ff
1a82 : d0 07 __ BNE $1a8b ; (main.s146 + 0)
.s145:
1a84 : a9 c8 __ LDA #$c8
1a86 : 8d 12 44 STA $4412 ; (BLIT_CODE[0] + 18)
1a89 : a9 08 __ LDA #$08
.s146:
1a8b : 8d 14 44 STA $4414 ; (BLIT_CODE[0] + 20)
1a8e : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
1a91 : 0a __ __ ASL
1a92 : 85 4d __ STA T10 + 0 
1a94 : a9 00 __ LDA #$00
1a96 : 2a __ __ ROL
1a97 : 06 4d __ ASL T10 + 0 
1a99 : 2a __ __ ROL
1a9a : 06 4d __ ASL T10 + 0 
1a9c : 2a __ __ ROL
1a9d : 85 4e __ STA T10 + 1 
1a9f : a5 4f __ LDA T11 + 0 
1aa1 : d0 0d __ BNE $1ab0 ; (main.s158 + 0)
.s147:
1aa3 : 8d 25 44 STA $4425 ; (BLIT_CODE[0] + 37)
1aa6 : a5 4d __ LDA T10 + 0 
1aa8 : 8d 1b 44 STA $441b ; (BLIT_CODE[0] + 27)
1aab : a5 4e __ LDA T10 + 1 
1aad : 4c c1 1a JMP $1ac1 ; (main.s206 + 0)
.s158:
1ab0 : a9 07 __ LDA #$07
1ab2 : 8d 25 44 STA $4425 ; (BLIT_CODE[0] + 37)
1ab5 : 38 __ __ SEC
1ab6 : a9 00 __ LDA #$00
1ab8 : e5 4d __ SBC T10 + 0 
1aba : 8d 1b 44 STA $441b ; (BLIT_CODE[0] + 27)
1abd : a9 00 __ LDA #$00
1abf : e5 4e __ SBC T10 + 1 
.s206:
1ac1 : 8d 21 44 STA $4421 ; (BLIT_CODE[0] + 33)
1ac4 : a5 47 __ LDA T6 + 0 
1ac6 : 0a __ __ ASL
1ac7 : 8d 2a 44 STA $442a ; (BLIT_CODE[0] + 42)
1aca : a5 48 __ LDA T6 + 1 
1acc : 2a __ __ ROL
1acd : 8d 30 44 STA $4430 ; (BLIT_CODE[0] + 48)
1ad0 : 98 __ __ TYA
1ad1 : 29 01 __ AND #$01
1ad3 : 85 4d __ STA T10 + 0 
1ad5 : f0 09 __ BEQ $1ae0 ; (main.s148 + 0)
.s157:
1ad7 : a9 06 __ LDA #$06
1ad9 : 8d 37 44 STA $4437 ; (BLIT_CODE[0] + 55)
1adc : a9 26 __ LDA #$26
1ade : d0 07 __ BNE $1ae7 ; (main.s207 + 0)
.s148:
1ae0 : a9 46 __ LDA #$46
1ae2 : 8d 37 44 STA $4437 ; (BLIT_CODE[0] + 55)
1ae5 : a9 66 __ LDA #$66
.s207:
1ae7 : 8d 39 44 STA $4439 ; (BLIT_CODE[0] + 57)
1aea : a5 4d __ LDA T10 + 0 
1aec : f0 0e __ BEQ $1afc ; (main.s149 + 0)
.s156:
1aee : a9 26 __ LDA #$26
1af0 : 8d 3d 44 STA $443d ; (BLIT_CODE[0] + 61)
1af3 : a9 f8 __ LDA #$f8
1af5 : 8d 43 44 STA $4443 ; (BLIT_CODE[0] + 67)
1af8 : a9 ff __ LDA #$ff
1afa : d0 0a __ BNE $1b06 ; (main.s150 + 0)
.s149:
1afc : a2 66 __ LDX #$66
1afe : 8e 3d 44 STX $443d ; (BLIT_CODE[0] + 61)
1b01 : a2 08 __ LDX #$08
1b03 : 8e 43 44 STX $4443 ; (BLIT_CODE[0] + 67)
.s150:
1b06 : 8d 49 44 STA $4449 ; (BLIT_CODE[0] + 73)
1b09 : a5 45 __ LDA T2 + 0 
1b0b : 0a __ __ ASL
1b0c : 8d 50 44 STA $4450 ; (BLIT_CODE[0] + 80)
1b0f : a5 46 __ LDA T2 + 1 
1b11 : 2a __ __ ROL
1b12 : 8d 56 44 STA $4456 ; (BLIT_CODE[0] + 86)
1b15 : a5 59 __ LDA T5 + 0 
1b17 : 29 f8 __ AND #$f8
1b19 : 85 1b __ STA ACCU + 0 
1b1b : a5 5a __ LDA T5 + 1 
1b1d : 85 1c __ STA ACCU + 1 
1b1f : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
1b22 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
1b25 : ad fd 42 LDA $42fd ; (sbm.data + 0)
1b28 : 18 __ __ CLC
1b29 : 65 1b __ ADC ACCU + 0 
1b2b : aa __ __ TAX
1b2c : ad fe 42 LDA $42fe ; (sbm.data + 1)
1b2f : 65 1c __ ADC ACCU + 1 
1b31 : 85 4a __ STA T8 + 1 
1b33 : a5 57 __ LDA T4 + 0 
1b35 : 29 fc __ AND #$fc
1b37 : 0a __ __ ASL
1b38 : 85 59 __ STA T5 + 0 
1b3a : a5 58 __ LDA T4 + 1 
1b3c : 2a __ __ ROL
1b3d : a8 __ __ TAY
1b3e : 8a __ __ TXA
1b3f : 18 __ __ CLC
1b40 : 65 59 __ ADC T5 + 0 
1b42 : 85 03 __ STA WORK + 0 
1b44 : 98 __ __ TYA
1b45 : 65 4a __ ADC T8 + 1 
1b47 : 85 04 __ STA WORK + 1 
1b49 : 38 __ __ SEC
1b4a : a5 45 __ LDA T2 + 0 
1b4c : e5 47 __ SBC T6 + 0 
1b4e : 85 05 __ STA WORK + 2 
1b50 : a5 46 __ LDA T2 + 1 
1b52 : e5 48 __ SBC T6 + 1 
1b54 : 85 06 __ STA WORK + 3 
1b56 : a5 5c __ LDA T7 + 1 
1b58 : 85 0b __ STA WORK + 8 
1b5a : a5 57 __ LDA T4 + 0 
1b5c : 29 03 __ AND #$03
1b5e : 0a __ __ ASL
1b5f : aa __ __ TAX
1b60 : bd e6 41 LDA $41e6,x ; (ormask[0] + 0)
1b63 : 85 0a __ STA WORK + 7 
1b65 : 20 00 44 JSR $4400 ; (BLIT_CODE[0] + 0)
1b68 : a5 fa __ LDA $fa ; (efree + 1)
1b6a : 85 46 __ STA T2 + 1 
1b6c : a5 f9 __ LDA $f9 ; (efree + 0)
1b6e : 85 45 __ STA T2 + 0 
1b70 : 05 fa __ ORA $fa ; (efree + 1)
1b72 : f0 48 __ BEQ $1bbc ; (main.s151 + 0)
.s155:
1b74 : a9 00 __ LDA #$00
1b76 : a0 04 __ LDY #$04
1b78 : 91 f9 __ STA ($f9),y ; (efree + 0)
1b7a : c8 __ __ INY
1b7b : b1 f9 __ LDA ($f9),y ; (efree + 0)
1b7d : 85 f9 __ STA $f9 ; (efree + 0)
1b7f : c8 __ __ INY
1b80 : b1 45 __ LDA (T2 + 0),y 
1b82 : 85 fa __ STA $fa ; (efree + 1)
1b84 : a0 08 __ LDY #$08
1b86 : b1 43 __ LDA (T1 + 0),y 
1b88 : 0a __ __ ASL
1b89 : aa __ __ TAX
1b8a : c8 __ __ INY
1b8b : b1 43 __ LDA (T1 + 0),y 
1b8d : 2a __ __ ROL
1b8e : 85 58 __ STA T4 + 1 
1b90 : c8 __ __ INY
1b91 : b1 43 __ LDA (T1 + 0),y 
1b93 : a0 02 __ LDY #$02
1b95 : 91 45 __ STA (T2 + 0),y 
1b97 : a0 0b __ LDY #$0b
1b99 : b1 43 __ LDA (T1 + 0),y 
1b9b : a0 03 __ LDY #$03
1b9d : 91 45 __ STA (T2 + 0),y 
1b9f : 8a __ __ TXA
1ba0 : a0 00 __ LDY #$00
1ba2 : 91 45 __ STA (T2 + 0),y 
1ba4 : a5 58 __ LDA T4 + 1 
1ba6 : c8 __ __ INY
1ba7 : 91 45 __ STA (T2 + 0),y 
1ba9 : a5 f7 __ LDA $f7 ; (eused + 0)
1bab : a0 05 __ LDY #$05
1bad : 91 45 __ STA (T2 + 0),y 
1baf : a5 f8 __ LDA $f8 ; (eused + 1)
1bb1 : c8 __ __ INY
1bb2 : 91 45 __ STA (T2 + 0),y 
1bb4 : a5 45 __ LDA T2 + 0 
1bb6 : 85 f7 __ STA $f7 ; (eused + 0)
1bb8 : a5 46 __ LDA T2 + 1 
1bba : 85 f8 __ STA $f8 ; (eused + 1)
.s151:
1bbc : a0 14 __ LDY #$14
1bbe : b1 43 __ LDA (T1 + 0),y 
1bc0 : aa __ __ TAX
1bc1 : c8 __ __ INY
1bc2 : b1 43 __ LDA (T1 + 0),y 
1bc4 : 85 46 __ STA T2 + 1 
1bc6 : a5 53 __ LDA T0 + 0 
1bc8 : 05 54 __ ORA T0 + 1 
1bca : f0 0b __ BEQ $1bd7 ; (main.s152 + 0)
.s154:
1bcc : 8a __ __ TXA
1bcd : 88 __ __ DEY
1bce : 91 53 __ STA (T0 + 0),y 
1bd0 : a5 46 __ LDA T2 + 1 
1bd2 : c8 __ __ INY
1bd3 : 91 53 __ STA (T0 + 0),y 
1bd5 : d0 08 __ BNE $1bdf ; (main.s153 + 0)
.s152:
1bd7 : 8e 5e 43 STX $435e ; (mused + 0)
1bda : a5 46 __ LDA T2 + 1 
1bdc : 8d 5f 43 STA $435f ; (mused + 1)
.s153:
1bdf : ad 60 43 LDA $4360 ; (mfree + 0)
1be2 : a0 14 __ LDY #$14
1be4 : 91 43 __ STA (T1 + 0),y 
1be6 : ad 61 43 LDA $4361 ; (mfree + 1)
1be9 : c8 __ __ INY
1bea : 91 43 __ STA (T1 + 0),y 
1bec : a5 43 __ LDA T1 + 0 
1bee : 8d 60 43 STA $4360 ; (mfree + 0)
1bf1 : a5 44 __ LDA T1 + 1 
1bf3 : 8d 61 43 STA $4361 ; (mfree + 1)
1bf6 : 4c 78 18 JMP $1878 ; (main.s138 + 0)
.s178:
1bf9 : 86 45 __ STX T2 + 0 
1bfb : 85 59 __ STA T5 + 0 
1bfd : a9 b8 __ LDA #$b8
1bff : a0 02 __ LDY #$02
1c01 : 91 55 __ STA (T3 + 0),y 
1c03 : a9 00 __ LDA #$00
1c05 : c8 __ __ INY
1c06 : 91 55 __ STA (T3 + 0),y 
1c08 : a5 43 __ LDA T1 + 0 
1c0a : a0 06 __ LDY #$06
1c0c : 91 55 __ STA (T3 + 0),y 
1c0e : a5 44 __ LDA T1 + 1 
1c10 : c8 __ __ INY
1c11 : 91 55 __ STA (T3 + 0),y 
1c13 : a9 b8 __ LDA #$b8
1c15 : a0 0a __ LDY #$0a
1c17 : 91 55 __ STA (T3 + 0),y 
1c19 : a9 00 __ LDA #$00
1c1b : c8 __ __ INY
1c1c : 91 55 __ STA (T3 + 0),y 
1c1e : a9 01 __ LDA #$01
1c20 : a0 12 __ LDY #$12
1c22 : 91 55 __ STA (T3 + 0),y 
1c24 : a0 14 __ LDY #$14
1c26 : b1 55 __ LDA (T3 + 0),y 
1c28 : 8d 60 43 STA $4360 ; (mfree + 0)
1c2b : c8 __ __ INY
1c2c : b1 55 __ LDA (T3 + 0),y 
1c2e : 8d 61 43 STA $4361 ; (mfree + 1)
1c31 : ad 5e 43 LDA $435e ; (mused + 0)
1c34 : 88 __ __ DEY
1c35 : 91 55 __ STA (T3 + 0),y 
1c37 : ad 5f 43 LDA $435f ; (mused + 1)
1c3a : c8 __ __ INY
1c3b : 91 55 __ STA (T3 + 0),y 
1c3d : a5 55 __ LDA T3 + 0 
1c3f : 8d 5e 43 STA $435e ; (mused + 0)
1c42 : a5 56 __ LDA T3 + 1 
1c44 : 8d 5f 43 STA $435f ; (mused + 1)
1c47 : 46 46 __ LSR T2 + 1 
1c49 : 66 45 __ ROR T2 + 0 
1c4b : a5 45 __ LDA T2 + 0 
1c4d : a0 00 __ LDY #$00
1c4f : 91 55 __ STA (T3 + 0),y 
1c51 : 98 __ __ TYA
1c52 : c8 __ __ INY
1c53 : 91 55 __ STA (T3 + 0),y 
1c55 : a5 45 __ LDA T2 + 0 
1c57 : a0 08 __ LDY #$08
1c59 : 91 55 __ STA (T3 + 0),y 
1c5b : a9 00 __ LDA #$00
1c5d : c8 __ __ INY
1c5e : 91 55 __ STA (T3 + 0),y 
1c60 : a5 54 __ LDA T0 + 1 
1c62 : c9 80 __ CMP #$80
1c64 : 6a __ __ ROR
1c65 : a0 05 __ LDY #$05
1c67 : 91 55 __ STA (T3 + 0),y 
1c69 : aa __ __ TAX
1c6a : a5 53 __ LDA T0 + 0 
1c6c : 6a __ __ ROR
1c6d : 88 __ __ DEY
1c6e : 91 55 __ STA (T3 + 0),y 
1c70 : 38 __ __ SEC
1c71 : e5 45 __ SBC T2 + 0 
1c73 : 85 45 __ STA T2 + 0 
1c75 : a0 0c __ LDY #$0c
1c77 : 91 55 __ STA (T3 + 0),y 
1c79 : 8a __ __ TXA
1c7a : e5 46 __ SBC T2 + 1 
1c7c : 85 46 __ STA T2 + 1 
1c7e : c8 __ __ INY
1c7f : 91 55 __ STA (T3 + 0),y 
1c81 : 38 __ __ SEC
1c82 : a9 b8 __ LDA #$b8
1c84 : e5 43 __ SBC T1 + 0 
1c86 : aa __ __ TAX
1c87 : a9 00 __ LDA #$00
1c89 : e5 44 __ SBC T1 + 1 
1c8b : 85 44 __ STA T1 + 1 
1c8d : 8a __ __ TXA
1c8e : 0a __ __ ASL
1c8f : c8 __ __ INY
1c90 : 91 55 __ STA (T3 + 0),y 
1c92 : a5 44 __ LDA T1 + 1 
1c94 : 2a __ __ ROL
1c95 : c8 __ __ INY
1c96 : 91 55 __ STA (T3 + 0),y 
1c98 : 24 46 __ BIT T2 + 1 
1c9a : 10 16 __ BPL $1cb2 ; (main.s179 + 0)
.s188:
1c9c : 38 __ __ SEC
1c9d : a9 00 __ LDA #$00
1c9f : e5 45 __ SBC T2 + 0 
1ca1 : a0 0c __ LDY #$0c
1ca3 : 91 55 __ STA (T3 + 0),y 
1ca5 : a9 00 __ LDA #$00
1ca7 : e5 46 __ SBC T2 + 1 
1ca9 : c8 __ __ INY
1caa : 91 55 __ STA (T3 + 0),y 
1cac : a9 ff __ LDA #$ff
1cae : a0 12 __ LDY #$12
1cb0 : 91 55 __ STA (T3 + 0),y 
.s179:
1cb2 : a0 0c __ LDY #$0c
1cb4 : b1 55 __ LDA (T3 + 0),y 
1cb6 : 85 53 __ STA T0 + 0 
1cb8 : c8 __ __ INY
1cb9 : b1 55 __ LDA (T3 + 0),y 
1cbb : 85 54 __ STA T0 + 1 
1cbd : 8a __ __ TXA
1cbe : 38 __ __ SEC
1cbf : e5 53 __ SBC T0 + 0 
1cc1 : a0 10 __ LDY #$10
1cc3 : 91 55 __ STA (T3 + 0),y 
1cc5 : a5 44 __ LDA T1 + 1 
1cc7 : e5 54 __ SBC T0 + 1 
1cc9 : c8 __ __ INY
1cca : 91 55 __ STA (T3 + 0),y 
1ccc : a5 53 __ LDA T0 + 0 
1cce : 0a __ __ ASL
1ccf : a0 0c __ LDY #$0c
1cd1 : 91 55 __ STA (T3 + 0),y 
1cd3 : a5 54 __ LDA T0 + 1 
1cd5 : 2a __ __ ROL
1cd6 : c8 __ __ INY
1cd7 : 91 55 __ STA (T3 + 0),y 
1cd9 : c6 59 __ DEC T5 + 0 
1cdb : a5 59 __ LDA T5 + 0 
1cdd : 8d d2 43 STA $43d2 ; (nmissiles + 0)
1ce0 : a9 00 __ LDA #$00
1ce2 : aa __ __ TAX
1ce3 : f0 07 __ BEQ $1cec ; (main.l180 + 0)
.s186:
1ce5 : a9 5c __ LDA #$5c
1ce7 : 9d 19 c8 STA $c819,x 
1cea : e8 __ __ INX
1ceb : 8a __ __ TXA
.l180:
1cec : 0a __ __ ASL
1ced : b0 06 __ BCS $1cf5 ; (main.s181 + 0)
.s187:
1cef : 09 01 __ ORA #$01
1cf1 : c5 59 __ CMP T5 + 0 
1cf3 : 90 f0 __ BCC $1ce5 ; (main.s186 + 0)
.s181:
1cf5 : 86 55 __ STX T3 + 0 
1cf7 : 46 59 __ LSR T5 + 0 
1cf9 : 90 09 __ BCC $1d04 ; (main.s182 + 0)
.s185:
1cfb : a9 5d __ LDA #$5d
.l184:
1cfd : 9d 19 c8 STA $c819,x 
1d00 : e6 55 __ INC T3 + 0 
1d02 : a6 55 __ LDX T3 + 0 
.s182:
1d04 : e0 0f __ CPX #$0f
1d06 : 90 03 __ BCC $1d0b ; (main.s183 + 0)
1d08 : 4c dd 0e JMP $0edd ; (main.s176 + 0)
.s183:
1d0b : a9 5e __ LDA #$5e
1d0d : 90 ee __ BCC $1cfd ; (main.l184 + 0)
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
1d0f : 48 __ __ PHA
1d10 : 8a __ __ TXA
1d11 : 48 __ __ PHA
1d12 : a9 1d __ LDA #$1d
1d14 : 48 __ __ PHA
1d15 : a9 26 __ LDA #$26
1d17 : 48 __ __ PHA
1d18 : ba __ __ TSX
1d19 : bd 05 01 LDA $0105,x 
1d1c : 48 __ __ PHA
1d1d : a6 01 __ LDX $01 
1d1f : a9 36 __ LDA #$36
1d21 : 85 01 __ STA $01 
1d23 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
1d26 : 86 01 __ STX $01 
1d28 : 68 __ __ PLA
1d29 : aa __ __ TAX
1d2a : 68 __ __ PLA
1d2b : 40 __ __ RTI
1d2c : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
1d2d : 48 __ __ PHA
1d2e : 8a __ __ TXA
1d2f : 48 __ __ PHA
1d30 : a9 1d __ LDA #$1d
1d32 : 48 __ __ PHA
1d33 : a9 26 __ LDA #$26
1d35 : 48 __ __ PHA
1d36 : ba __ __ TSX
1d37 : bd 05 01 LDA $0105,x 
1d3a : 48 __ __ PHA
1d3b : a6 01 __ LDX $01 
1d3d : a9 36 __ LDA #$36
1d3f : 85 01 __ STA $01 
1d41 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
memcpy: ; memcpy(void*,const void*,i16)->void
;  30, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
1d44 : a6 12 __ LDX P5 
1d46 : f0 10 __ BEQ $1d58 ; (memcpy.s4 + 20)
1d48 : a0 00 __ LDY #$00
1d4a : b1 0f __ LDA (P2),y 
1d4c : 91 0d __ STA (P0),y 
1d4e : c8 __ __ INY
1d4f : d0 f9 __ BNE $1d4a ; (memcpy.s4 + 6)
1d51 : e6 10 __ INC P3 
1d53 : e6 0e __ INC P1 
1d55 : ca __ __ DEX
1d56 : d0 f2 __ BNE $1d4a ; (memcpy.s4 + 6)
1d58 : a4 11 __ LDY P4 
1d5a : f0 0e __ BEQ $1d6a ; (memcpy.s3 + 0)
1d5c : 88 __ __ DEY
1d5d : f0 07 __ BEQ $1d66 ; (memcpy.s4 + 34)
1d5f : b1 0f __ LDA (P2),y 
1d61 : 91 0d __ STA (P0),y 
1d63 : 88 __ __ DEY
1d64 : d0 f9 __ BNE $1d5f ; (memcpy.s4 + 27)
1d66 : b1 0f __ LDA (P2),y 
1d68 : 91 0d __ STA (P0),y 
.s3:
1d6a : 60 __ __ RTS
--------------------------------------------------------------------
memset: ; memset(void*,i16,i16)->void
;  28, "/home/honza/projects/c64/projects/oscar64/include/string.h"
.s4:
1d6b : a5 0f __ LDA P2 
1d6d : a6 12 __ LDX P5 
1d6f : f0 0c __ BEQ $1d7d ; (memset.s4 + 18)
1d71 : a0 00 __ LDY #$00
1d73 : 91 0d __ STA (P0),y 
1d75 : c8 __ __ INY
1d76 : d0 fb __ BNE $1d73 ; (memset.s4 + 8)
1d78 : e6 0e __ INC P1 
1d7a : ca __ __ DEX
1d7b : d0 f6 __ BNE $1d73 ; (memset.s4 + 8)
1d7d : a4 11 __ LDY P4 
1d7f : f0 05 __ BEQ $1d86 ; (memset.s3 + 0)
1d81 : 88 __ __ DEY
1d82 : 91 0d __ STA (P0),y 
1d84 : d0 fb __ BNE $1d81 ; (memset.s4 + 22)
.s3:
1d86 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
1d87 : a2 00 __ LDX #$00
.l5:
1d89 : a9 ff __ LDA #$ff
1d8b : 9d ee 41 STA $41ee,x ; (rasterIRQRows[0] + 0)
1d8e : 8a __ __ TXA
1d8f : 9d b9 42 STA $42b9,x ; (rasterIRQIndex[0] + 1)
1d92 : e8 __ __ INX
1d93 : e0 10 __ CPX #$10
1d95 : d0 f2 __ BNE $1d89 ; (rirq_init_kernal.l5 + 0)
.s6:
1d97 : 8e b8 42 STX $42b8 ; (rasterIRQIndex[0] + 0)
1d9a : a9 ff __ LDA #$ff
1d9c : 8d d9 42 STA $42d9 ; (rasterIRQNext[0] + 16)
1d9f : a9 00 __ LDA #$00
1da1 : 8d fe 41 STA $41fe ; (rasterIRQRows[0] + 16)
1da4 : 78 __ __ SEI
1da5 : a9 01 __ LDA #$01
1da7 : 8d 1a d0 STA $d01a 
1daa : a9 00 __ LDA #$00
1dac : 8d 14 03 STA $0314 
1daf : a9 1e __ LDA #$1e
1db1 : 8d 15 03 STA $0315 
1db4 : ad 11 d0 LDA $d011 
1db7 : 29 7f __ AND #$7f
1db9 : 8d 11 d0 STA $d011 
1dbc : a9 ff __ LDA #$ff
1dbe : 8d 12 d0 STA $d012 
.s3:
1dc1 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
1dc2 : ad 11 d0 LDA $d011 
1dc5 : 29 7f __ AND #$7f
1dc7 : 8d 11 d0 STA $d011 
1dca : a9 64 __ LDA #$64
1dcc : 8d 12 d0 STA $d012 
1dcf : 0e 19 d0 ASL $d019 
1dd2 : 58 __ __ CLI
.s3:
1dd3 : 60 __ __ RTS
--------------------------------------------------------------------
1dd4 : __ __ __ BYT 52 45 41 44 59 20 50 4c 41 59 45 52 20 31 00    : READY PLAYER 1.
--------------------------------------------------------------------
1de3 : __ __ __ BYT 4c 45 56 45 4c 00                               : LEVEL.
--------------------------------------------------------------------
1de9 : __ __ __ BYT 42 4f 4e 55 53 00                               : BONUS.
--------------------------------------------------------------------
1def : __ __ __ BYT 54 48 45 20 45 4e 44 00                         : THE END.
--------------------------------------------------------------------
divs32@proxy: ; divs32@proxy
1df7 : a9 08 __ LDA #$08
1df9 : 85 03 __ STA WORK + 0 
1dfb : 4c 79 39 JMP $3979 ; (divs32 + 0)
--------------------------------------------------------------------
spentry:
1dfe : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
CrossDelay:
1dff : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
1e00 : ad 19 d0 LDA $d019 
1e03 : 10 51 __ BPL $1e56 ; (rirq_isr_kernal_io + 86)
1e05 : ae ff 41 LDX $41ff ; (nextIRQ + 0)
1e08 : 30 33 __ BMI $1e3d ; (rirq_isr_kernal_io + 61)
1e0a : bd c9 42 LDA $42c9,x ; (rasterIRQNext[0] + 0)
1e0d : bc b9 42 LDY $42b9,x ; (rasterIRQIndex[0] + 1)
1e10 : be da 42 LDX $42da,y ; (rasterIRQLow[0] + 0)
1e13 : 8e 1d 1e STX $1e1d ; (rirq_isr_kernal_io + 29)
1e16 : be ea 42 LDX $42ea,y ; (rasterIRQHigh[0] + 0)
1e19 : 8e 1e 1e STX $1e1e ; (rirq_isr_kernal_io + 30)
1e1c : 20 00 00 JSR $0000 
1e1f : ee ff 41 INC $41ff ; (nextIRQ + 0)
1e22 : ae ff 41 LDX $41ff ; (nextIRQ + 0)
1e25 : bc c9 42 LDY $42c9,x ; (rasterIRQNext[0] + 0)
1e28 : 0e 19 d0 ASL $d019 
1e2b : c0 ff __ CPY #$ff
1e2d : f0 14 __ BEQ $1e43 ; (rirq_isr_kernal_io + 67)
1e2f : 88 __ __ DEY
1e30 : 88 __ __ DEY
1e31 : 8c 12 d0 STY $d012 
1e34 : 88 __ __ DEY
1e35 : cc 12 d0 CPY $d012 
1e38 : 90 d0 __ BCC $1e0a ; (rirq_isr_kernal_io + 10)
1e3a : 4c 81 ea JMP $ea81 
1e3d : 0e 19 d0 ASL $d019 
1e40 : 4c 81 ea JMP $ea81 
1e43 : ee fa 42 INC $42fa ; (rirq_count + 0)
1e46 : ac c9 42 LDY $42c9 ; (rasterIRQNext[0] + 0)
1e49 : 88 __ __ DEY
1e4a : 88 __ __ DEY
1e4b : 8c 12 d0 STY $d012 
1e4e : a2 00 __ LDX #$00
1e50 : 8e ff 41 STX $41ff ; (nextIRQ + 0)
1e53 : 4c 81 ea JMP $ea81 
1e56 : ad 0d dc LDA $dc0d 
1e59 : 58 __ __ CLI
1e5a : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
joy_interrupt: ; joy_interrupt()->void
; 549, "/home/honza/projects/c64/projects/oscar64/samples/games/missile.c"
.s1:
1e5d : a5 1b __ LDA ACCU + 0 
1e5f : 48 __ __ PHA
1e60 : a5 1c __ LDA ACCU + 1 
1e62 : 48 __ __ PHA
1e63 : a5 43 __ LDA T1 + 0 
1e65 : 48 __ __ PHA
1e66 : a5 44 __ LDA T1 + 1 
1e68 : 48 __ __ PHA
.s4:
1e69 : ad 00 dc LDA $dc00 
1e6c : a8 __ __ TAY
1e6d : 4a __ __ LSR
1e6e : b0 04 __ BCS $1e74 ; (joy_interrupt.s31 + 0)
.s5:
1e70 : a9 ff __ LDA #$ff
1e72 : 90 0b __ BCC $1e7f ; (joy_interrupt.s6 + 0)
.s31:
1e74 : 98 __ __ TYA
1e75 : 29 02 __ AND #$02
1e77 : f0 04 __ BEQ $1e7d ; (joy_interrupt.s34 + 0)
.s35:
1e79 : a9 00 __ LDA #$00
1e7b : b0 02 __ BCS $1e7f ; (joy_interrupt.s6 + 0)
.s34:
1e7d : a9 01 __ LDA #$01
.s6:
1e7f : 8d 45 43 STA $4345 ; (joyy[0] + 0)
1e82 : 98 __ __ TYA
1e83 : 29 04 __ AND #$04
1e85 : d0 04 __ BNE $1e8b ; (joy_interrupt.s30 + 0)
.s7:
1e87 : a9 ff __ LDA #$ff
1e89 : d0 0b __ BNE $1e96 ; (joy_interrupt.s8 + 0)
.s30:
1e8b : 98 __ __ TYA
1e8c : 29 08 __ AND #$08
1e8e : f0 04 __ BEQ $1e94 ; (joy_interrupt.s36 + 0)
.s37:
1e90 : a9 00 __ LDA #$00
1e92 : f0 02 __ BEQ $1e96 ; (joy_interrupt.s8 + 0)
.s36:
1e94 : a9 01 __ LDA #$01
.s8:
1e96 : 8d 47 43 STA $4347 ; (joyx[0] + 0)
1e99 : 98 __ __ TYA
1e9a : 29 10 __ AND #$10
1e9c : f0 04 __ BEQ $1ea2 ; (joy_interrupt.s38 + 0)
.s39:
1e9e : a2 00 __ LDX #$00
1ea0 : f0 02 __ BEQ $1ea4 ; (joy_interrupt.s40 + 0)
.s38:
1ea2 : a2 01 __ LDX #$01
.s40:
1ea4 : ad c3 41 LDA $41c3 ; (CrossX + 0)
1ea7 : 85 1b __ STA ACCU + 0 
1ea9 : ad c4 41 LDA $41c4 ; (CrossX + 1)
1eac : 85 1c __ STA ACCU + 1 
1eae : ad 45 43 LDA $4345 ; (joyy[0] + 0)
1eb1 : 0a __ __ ASL
1eb2 : 90 04 __ BCC $1eb8 ; (joy_interrupt.s41 + 0)
.s42:
1eb4 : a0 ff __ LDY #$ff
1eb6 : b0 02 __ BCS $1eba ; (joy_interrupt.s43 + 0)
.s41:
1eb8 : a0 00 __ LDY #$00
.s43:
1eba : 18 __ __ CLC
1ebb : 6d c5 41 ADC $41c5 ; (CrossY + 0)
1ebe : 85 43 __ STA T1 + 0 
1ec0 : 98 __ __ TYA
1ec1 : 6d c6 41 ADC $41c6 ; (CrossY + 1)
1ec4 : 85 44 __ STA T1 + 1 
1ec6 : ad 47 43 LDA $4347 ; (joyx[0] + 0)
1ec9 : 0a __ __ ASL
1eca : 90 04 __ BCC $1ed0 ; (joy_interrupt.s44 + 0)
.s45:
1ecc : a0 ff __ LDY #$ff
1ece : b0 02 __ BCS $1ed2 ; (joy_interrupt.s46 + 0)
.s44:
1ed0 : a0 00 __ LDY #$00
.s46:
1ed2 : 18 __ __ CLC
1ed3 : 65 1b __ ADC ACCU + 0 
1ed5 : 85 1b __ STA ACCU + 0 
1ed7 : 98 __ __ TYA
1ed8 : 65 1c __ ADC ACCU + 1 
1eda : 30 0a __ BMI $1ee6 ; (joy_interrupt.s27 + 0)
.s29:
1edc : 85 1c __ STA ACCU + 1 
1ede : d0 11 __ BNE $1ef1 ; (joy_interrupt.s9 + 0)
.s28:
1ee0 : a5 1b __ LDA ACCU + 0 
1ee2 : c9 08 __ CMP #$08
1ee4 : b0 0b __ BCS $1ef1 ; (joy_interrupt.s9 + 0)
.s27:
1ee6 : a9 00 __ LDA #$00
1ee8 : a0 08 __ LDY #$08
.s33:
1eea : 84 1b __ STY ACCU + 0 
1eec : 85 1c __ STA ACCU + 1 
1eee : 4c 07 1f JMP $1f07 ; (joy_interrupt.s10 + 0)
.s9:
1ef1 : a9 01 __ LDA #$01
1ef3 : c5 1c __ CMP ACCU + 1 
1ef5 : f0 04 __ BEQ $1efb ; (joy_interrupt.s25 + 0)
.s26:
1ef7 : 90 08 __ BCC $1f01 ; (joy_interrupt.s24 + 0)
1ef9 : b0 0c __ BCS $1f07 ; (joy_interrupt.s10 + 0)
.s25:
1efb : a5 1b __ LDA ACCU + 0 
1efd : c9 39 __ CMP #$39
1eff : 90 06 __ BCC $1f07 ; (joy_interrupt.s10 + 0)
.s24:
1f01 : a9 01 __ LDA #$01
1f03 : a0 38 __ LDY #$38
1f05 : d0 e3 __ BNE $1eea ; (joy_interrupt.s33 + 0)
.s10:
1f07 : a5 44 __ LDA T1 + 1 
1f09 : 30 08 __ BMI $1f13 ; (joy_interrupt.s21 + 0)
.s23:
1f0b : d0 0a __ BNE $1f17 ; (joy_interrupt.s11 + 0)
.s22:
1f0d : a5 43 __ LDA T1 + 0 
1f0f : c9 14 __ CMP #$14
1f11 : b0 04 __ BCS $1f17 ; (joy_interrupt.s11 + 0)
.s21:
1f13 : a9 14 __ LDA #$14
1f15 : d0 0c __ BNE $1f23 ; (joy_interrupt.s32 + 0)
.s11:
1f17 : a5 44 __ LDA T1 + 1 
1f19 : d0 06 __ BNE $1f21 ; (joy_interrupt.s19 + 0)
.s20:
1f1b : a5 43 __ LDA T1 + 0 
1f1d : c9 ad __ CMP #$ad
1f1f : 90 02 __ BCC $1f23 ; (joy_interrupt.s32 + 0)
.s19:
1f21 : a9 ac __ LDA #$ac
.s32:
1f23 : 8d c5 41 STA $41c5 ; (CrossY + 0)
1f26 : 18 __ __ CLC
1f27 : 69 28 __ ADC #$28
1f29 : 8d 01 d0 STA $d001 
1f2c : a5 1b __ LDA ACCU + 0 
1f2e : 8d c3 41 STA $41c3 ; (CrossX + 0)
1f31 : 18 __ __ CLC
1f32 : 69 0e __ ADC #$0e
1f34 : 8d 00 d0 STA $d000 
1f37 : a5 1c __ LDA ACCU + 1 
1f39 : 8d c4 41 STA $41c4 ; (CrossX + 1)
1f3c : 69 00 __ ADC #$00
1f3e : a0 00 __ LDY #$00
1f40 : 8c c6 41 STY $41c6 ; (CrossY + 1)
1f43 : a8 __ __ TAY
1f44 : d0 08 __ BNE $1f4e ; (joy_interrupt.s18 + 0)
.s12:
1f46 : ad 10 d0 LDA $d010 
1f49 : 29 fe __ AND #$fe
1f4b : 4c 53 1f JMP $1f53 ; (joy_interrupt.s13 + 0)
.s18:
1f4e : ad 10 d0 LDA $d010 
1f51 : 09 01 __ ORA #$01
.s13:
1f53 : 8d 10 d0 STA $d010 
1f56 : 8a __ __ TXA
1f57 : d0 15 __ BNE $1f6e ; (joy_interrupt.s16 + 0)
.s14:
1f59 : ad ff 1d LDA $1dff ; (CrossDelay + 0)
1f5c : f0 03 __ BEQ $1f61 ; (joy_interrupt.s3 + 0)
.s15:
1f5e : ce ff 1d DEC $1dff ; (CrossDelay + 0)
.s3:
1f61 : 68 __ __ PLA
1f62 : 85 44 __ STA T1 + 1 
1f64 : 68 __ __ PLA
1f65 : 85 43 __ STA T1 + 0 
1f67 : 68 __ __ PLA
1f68 : 85 1c __ STA ACCU + 1 
1f6a : 68 __ __ PLA
1f6b : 85 1b __ STA ACCU + 0 
1f6d : 60 __ __ RTS
.s16:
1f6e : ad ff 1d LDA $1dff ; (CrossDelay + 0)
1f71 : d0 ee __ BNE $1f61 ; (joy_interrupt.s3 + 0)
.s17:
1f73 : a9 04 __ LDA #$04
1f75 : 8d ff 1d STA $1dff ; (CrossDelay + 0)
1f78 : a9 01 __ LDA #$01
1f7a : 8d c7 41 STA $41c7 ; (CrossP + 0)
1f7d : d0 e2 __ BNE $1f61 ; (joy_interrupt.s3 + 0)
--------------------------------------------------------------------
game_state: ; game_state(enum GameState)->void
; 610, "/home/honza/projects/c64/projects/oscar64/samples/games/missile.c"
.s1:
1f7f : a2 0b __ LDX #$0b
1f81 : b5 53 __ LDA T0 + 0,x 
1f83 : 9d be c7 STA $c7be,x ; (game_state@stack + 0)
1f86 : ca __ __ DEX
1f87 : 10 f8 __ BPL $1f81 ; (game_state.s1 + 2)
.s4:
1f89 : ad ff c7 LDA $c7ff ; (sstack + 20)
1f8c : 8d 4a 43 STA $434a ; (TheGame.state + 0)
1f8f : c9 03 __ CMP #$03
1f91 : d0 03 __ BNE $1f96 ; (game_state.s5 + 0)
1f93 : 4c 06 29 JMP $2906 ; (game_state.s81 + 0)
.s5:
1f96 : b0 03 __ BCS $1f9b ; (game_state.s6 + 0)
1f98 : 4c bc 20 JMP $20bc ; (game_state.s18 + 0)
.s6:
1f9b : c9 04 __ CMP #$04
1f9d : d0 05 __ BNE $1fa4 ; (game_state.s7 + 0)
.s17:
1f9f : a9 00 __ LDA #$00
1fa1 : 4c b6 20 JMP $20b6 ; (game_state.s117 + 0)
.s7:
1fa4 : c9 05 __ CMP #$05
1fa6 : f0 0b __ BEQ $1fb3 ; (game_state.s8 + 0)
.s3:
1fa8 : a2 0b __ LDX #$0b
1faa : bd be c7 LDA $c7be,x ; (game_state@stack + 0)
1fad : 95 53 __ STA T0 + 0,x 
1faf : ca __ __ DEX
1fb0 : 10 f8 __ BPL $1faa ; (game_state.s3 + 2)
1fb2 : 60 __ __ RTS
.s8:
1fb3 : a2 00 __ LDX #$00
1fb5 : 86 5b __ STX T12 + 0 
1fb7 : a9 68 __ LDA #$68
1fb9 : 85 59 __ STA T11 + 0 
.l9:
1fbb : bd ef 1d LDA $1def,x 
1fbe : 0a __ __ ASL
1fbf : 0a __ __ ASL
1fc0 : 85 53 __ STA T0 + 0 
1fc2 : a9 00 __ LDA #$00
1fc4 : 2a __ __ ROL
1fc5 : 06 53 __ ASL T0 + 0 
1fc7 : 2a __ __ ROL
1fc8 : aa __ __ TAX
1fc9 : a9 c3 __ LDA #$c3
1fcb : 65 53 __ ADC T0 + 0 
1fcd : 85 53 __ STA T0 + 0 
1fcf : 8a __ __ TXA
1fd0 : 69 3e __ ADC #$3e
1fd2 : 85 54 __ STA T0 + 1 
1fd4 : a0 00 __ LDY #$00
.l10:
1fd6 : 84 5c __ STY T13 + 0 
1fd8 : 98 __ __ TYA
1fd9 : 18 __ __ CLC
1fda : 69 2e __ ADC #$2e
1fdc : 0a __ __ ASL
1fdd : aa __ __ TAX
1fde : 29 07 __ AND #$07
1fe0 : 85 47 __ STA T3 + 0 
1fe2 : 8a __ __ TXA
1fe3 : 29 78 __ AND #$78
1fe5 : 85 49 __ STA T4 + 0 
1fe7 : e8 __ __ INX
1fe8 : 8a __ __ TXA
1fe9 : 29 07 __ AND #$07
1feb : 85 4b __ STA T5 + 0 
1fed : 8a __ __ TXA
1fee : 29 78 __ AND #$78
1ff0 : 85 43 __ STA T1 + 0 
1ff2 : a9 00 __ LDA #$00
1ff4 : 85 5d __ STA T14 + 0 
1ff6 : b1 53 __ LDA (T0 + 0),y 
1ff8 : 85 45 __ STA T2 + 0 
1ffa : 30 11 __ BMI $200d ; (game_state.l16 + 0)
.l12:
1ffc : e6 5d __ INC T14 + 0 
1ffe : a5 5d __ LDA T14 + 0 
2000 : c9 08 __ CMP #$08
2002 : 90 03 __ BCC $2007 ; (game_state.s11 + 0)
2004 : 4c 98 20 JMP $2098 ; (game_state.s13 + 0)
.s11:
2007 : 06 45 __ ASL T2 + 0 
2009 : 24 45 __ BIT T2 + 0 
200b : 10 ef __ BPL $1ffc ; (game_state.l12 + 0)
.l16:
200d : a5 5d __ LDA T14 + 0 
200f : 0a __ __ ASL
2010 : 18 __ __ CLC
2011 : 65 59 __ ADC T11 + 0 
2013 : 85 4d __ STA T6 + 0 
2015 : 29 f8 __ AND #$f8
2017 : 85 4f __ STA T7 + 0 
2019 : 05 47 __ ORA T3 + 0 
201b : 85 51 __ STA T8 + 0 
201d : a9 00 __ LDA #$00
201f : 85 1c __ STA ACCU + 1 
2021 : 2a __ __ ROL
2022 : 85 4e __ STA T6 + 1 
2024 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
2027 : 85 1b __ STA ACCU + 0 
2029 : a5 49 __ LDA T4 + 0 
202b : 20 16 38 JSR $3816 ; (mul16by8 + 0)
202e : ad fd 42 LDA $42fd ; (sbm.data + 0)
2031 : 18 __ __ CLC
2032 : 65 1b __ ADC ACCU + 0 
2034 : a8 __ __ TAY
2035 : ad fe 42 LDA $42fe ; (sbm.data + 1)
2038 : 65 1c __ ADC ACCU + 1 
203a : aa __ __ TAX
203b : 98 __ __ TYA
203c : 18 __ __ CLC
203d : 65 51 __ ADC T8 + 0 
203f : 85 57 __ STA T10 + 0 
2041 : 8a __ __ TXA
2042 : 65 4e __ ADC T6 + 1 
2044 : 85 58 __ STA T10 + 1 
2046 : ad d8 41 LDA $41d8 ; (cbytes[0] + 0)
2049 : a0 00 __ LDY #$00
204b : 84 1c __ STY ACCU + 1 
204d : 51 57 __ EOR (T10 + 0),y 
204f : 85 51 __ STA T8 + 0 
2051 : a5 4d __ LDA T6 + 0 
2053 : 29 07 __ AND #$07
2055 : 85 4d __ STA T6 + 0 
2057 : aa __ __ TAX
2058 : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
205b : 25 51 __ AND T8 + 0 
205d : 4d d8 41 EOR $41d8 ; (cbytes[0] + 0)
2060 : 91 57 __ STA (T10 + 0),y 
2062 : a5 4b __ LDA T5 + 0 
2064 : 05 4f __ ORA T7 + 0 
2066 : 85 4f __ STA T7 + 0 
2068 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
206b : 85 1b __ STA ACCU + 0 
206d : a5 43 __ LDA T1 + 0 
206f : 20 16 38 JSR $3816 ; (mul16by8 + 0)
2072 : ad fd 42 LDA $42fd ; (sbm.data + 0)
2075 : 18 __ __ CLC
2076 : 65 1b __ ADC ACCU + 0 
2078 : 85 55 __ STA T9 + 0 
207a : ad fe 42 LDA $42fe ; (sbm.data + 1)
207d : 65 1c __ ADC ACCU + 1 
207f : 18 __ __ CLC
2080 : 65 4e __ ADC T6 + 1 
2082 : 85 56 __ STA T9 + 1 
2084 : ad d8 41 LDA $41d8 ; (cbytes[0] + 0)
2087 : a4 4f __ LDY T7 + 0 
2089 : 51 55 __ EOR (T9 + 0),y 
208b : a6 4d __ LDX T6 + 0 
208d : 3d dc 41 AND $41dc,x ; (andmask[0] + 0)
2090 : 4d d8 41 EOR $41d8 ; (cbytes[0] + 0)
2093 : 91 55 __ STA (T9 + 0),y 
2095 : 4c fc 1f JMP $1ffc ; (game_state.l12 + 0)
.s13:
2098 : a4 5c __ LDY T13 + 0 
209a : c8 __ __ INY
209b : c0 08 __ CPY #$08
209d : b0 03 __ BCS $20a2 ; (game_state.s14 + 0)
209f : 4c d6 1f JMP $1fd6 ; (game_state.l10 + 0)
.s14:
20a2 : a5 59 __ LDA T11 + 0 
20a4 : 69 0f __ ADC #$0f
20a6 : 85 59 __ STA T11 + 0 
20a8 : e6 5b __ INC T12 + 0 
20aa : a6 5b __ LDX T12 + 0 
20ac : bd ef 1d LDA $1def,x 
20af : f0 03 __ BEQ $20b4 ; (game_state.s15 + 0)
20b1 : 4c bb 1f JMP $1fbb ; (game_state.l9 + 0)
.s15:
20b4 : a9 78 __ LDA #$78
.s117:
20b6 : 8d 4b 43 STA $434b ; (TheGame.count + 0)
20b9 : 4c a8 1f JMP $1fa8 ; (game_state.s3 + 0)
.s18:
20bc : c9 01 __ CMP #$01
20be : d0 03 __ BNE $20c3 ; (game_state.s19 + 0)
20c0 : 4c 79 26 JMP $2679 ; (game_state.s60 + 0)
.s19:
20c3 : aa __ __ TAX
20c4 : d0 04 __ BNE $20ca ; (game_state.s20 + 0)
.s119:
20c6 : a8 __ __ TAY
20c7 : 4c 63 23 JMP $2363 ; (game_state.l39 + 0)
.s20:
20ca : a9 00 __ LDA #$00
20cc : 8d c7 41 STA $41c7 ; (CrossP + 0)
20cf : 85 0d __ STA P0 
20d1 : 85 0e __ STA P1 
20d3 : 85 10 __ STA P3 
20d5 : 85 11 __ STA P4 
20d7 : 85 12 __ STA P5 
20d9 : 85 14 __ STA P7 
20db : 85 18 __ STA P11 
20dd : a9 08 __ LDA #$08
20df : 85 0f __ STA P2 
20e1 : 85 13 __ STA P6 
20e3 : a9 40 __ LDA #$40
20e5 : 85 15 __ STA P8 
20e7 : a9 00 __ LDA #$00
20e9 : 8d eb c7 STA $c7eb ; (sstack + 0)
20ec : a9 01 __ LDA #$01
20ee : 85 16 __ STA P9 
20f0 : a9 b8 __ LDA #$b8
20f2 : 85 17 __ STA P10 
20f4 : a9 42 __ LDA #$42
20f6 : 8d ec c7 STA $c7ec ; (sstack + 1)
20f9 : 20 eb 2b JSR $2beb ; (bmu_bitblit.s4 + 0)
20fc : a9 c0 __ LDA #$c0
20fe : 85 0f __ STA P2 
2100 : 85 13 __ STA P6 
2102 : a9 08 __ LDA #$08
2104 : 85 17 __ STA P10 
2106 : a9 78 __ LDA #$78
2108 : 8d eb c7 STA $c7eb ; (sstack + 0)
210b : a9 42 __ LDA #$42
210d : 8d ec c7 STA $c7ec ; (sstack + 1)
2110 : 20 eb 2b JSR $2beb ; (bmu_bitblit.s4 + 0)
2113 : a9 00 __ LDA #$00
2115 : 8d f5 c7 STA $c7f5 ; (sstack + 10)
2118 : 8d f6 c7 STA $c7f6 ; (sstack + 11)
211b : 8d f8 c7 STA $c7f8 ; (sstack + 13)
211e : 8d fa c7 STA $c7fa ; (sstack + 15)
2121 : 8d fc c7 STA $c7fc ; (sstack + 17)
2124 : a9 10 __ LDA #$10
2126 : 8d f7 c7 STA $c7f7 ; (sstack + 12)
2129 : a9 20 __ LDA #$20
212b : 8d f9 c7 STA $c7f9 ; (sstack + 14)
212e : a9 30 __ LDA #$30
2130 : 8d fb c7 STA $c7fb ; (sstack + 16)
2133 : a9 78 __ LDA #$78
2135 : 8d fd c7 STA $c7fd ; (sstack + 18)
2138 : a9 42 __ LDA #$42
213a : 8d fe c7 STA $c7fe ; (sstack + 19)
213d : 20 a9 2e JSR $2ea9 ; (bmmc_quad_fill.s1 + 0)
2140 : a9 00 __ LDA #$00
2142 : 8d f6 c7 STA $c7f6 ; (sstack + 11)
2145 : 8d f8 c7 STA $c7f8 ; (sstack + 13)
2148 : 8d fa c7 STA $c7fa ; (sstack + 15)
214b : 8d fc c7 STA $c7fc ; (sstack + 17)
214e : a9 88 __ LDA #$88
2150 : 8d f5 c7 STA $c7f5 ; (sstack + 10)
2153 : a9 98 __ LDA #$98
2155 : 8d f7 c7 STA $c7f7 ; (sstack + 12)
2158 : a9 b0 __ LDA #$b0
215a : 8d f9 c7 STA $c7f9 ; (sstack + 14)
215d : a9 c0 __ LDA #$c0
215f : 8d fb c7 STA $c7fb ; (sstack + 16)
2162 : a9 78 __ LDA #$78
2164 : 8d fd c7 STA $c7fd ; (sstack + 18)
2167 : a9 42 __ LDA #$42
2169 : 8d fe c7 STA $c7fe ; (sstack + 19)
216c : 20 a9 2e JSR $2ea9 ; (bmmc_quad_fill.s1 + 0)
216f : a9 01 __ LDA #$01
2171 : 8d f6 c7 STA $c7f6 ; (sstack + 11)
2174 : 8d f8 c7 STA $c7f8 ; (sstack + 13)
2177 : 8d fa c7 STA $c7fa ; (sstack + 15)
217a : 8d fc c7 STA $c7fc ; (sstack + 17)
217d : a9 10 __ LDA #$10
217f : 8d f5 c7 STA $c7f5 ; (sstack + 10)
2182 : a9 20 __ LDA #$20
2184 : 8d f7 c7 STA $c7f7 ; (sstack + 12)
2187 : a9 30 __ LDA #$30
2189 : 8d f9 c7 STA $c7f9 ; (sstack + 14)
218c : a9 40 __ LDA #$40
218e : 8d fb c7 STA $c7fb ; (sstack + 16)
2191 : a9 78 __ LDA #$78
2193 : 8d fd c7 STA $c7fd ; (sstack + 18)
2196 : a9 42 __ LDA #$42
2198 : 8d fe c7 STA $c7fe ; (sstack + 19)
219b : 20 a9 2e JSR $2ea9 ; (bmmc_quad_fill.s1 + 0)
219e : a2 00 __ LDX #$00
21a0 : ad 4d 43 LDA $434d ; (cities[0] + 0)
21a3 : d0 72 __ BNE $2217 ; (game_state.l38 + 0)
.s22:
21a5 : bd 50 43 LDA $4350,x ; (cities[0] + 3)
21a8 : f0 63 __ BEQ $220d ; (game_state.l23 + 0)
.l34:
21aa : 8a __ __ TXA
21ab : 18 __ __ CLC
21ac : 69 04 __ ADC #$04
21ae : 85 45 __ STA T2 + 0 
21b0 : a8 __ __ TAY
21b1 : b9 88 42 LDA $4288,y ; (bitshift[0] + 8)
21b4 : 85 47 __ STA T3 + 0 
21b6 : 0d 15 d0 ORA $d015 
21b9 : 8d 15 d0 STA $d015 
21bc : b9 88 42 LDA $4288,y ; (bitshift[0] + 8)
21bf : 49 ff __ EOR #$ff
21c1 : 85 43 __ STA T1 + 0 
21c3 : 2d 1c d0 AND $d01c 
21c6 : 8d 1c d0 STA $d01c 
21c9 : ad 1d d0 LDA $d01d 
21cc : 25 43 __ AND T1 + 0 
21ce : 8d 1d d0 STA $d01d 
21d1 : ad 17 d0 LDA $d017 
21d4 : 25 43 __ AND T1 + 0 
21d6 : 8d 17 d0 STA $d017 
21d9 : 98 __ __ TYA
21da : 0a __ __ ASL
21db : a8 __ __ TAY
21dc : a9 de __ LDA #$de
21de : 99 01 d0 STA $d001,y 
21e1 : bd bd 3a LDA $3abd,x ; (__multab32L + 0)
21e4 : 18 __ __ CLC
21e5 : 69 d6 __ ADC #$d6
21e7 : 99 00 d0 STA $d000,y 
21ea : ad 10 d0 LDA $d010 
21ed : 90 04 __ BCC $21f3 ; (game_state.s35 + 0)
.s37:
21ef : 05 47 __ ORA T3 + 0 
21f1 : b0 02 __ BCS $21f5 ; (game_state.s36 + 0)
.s35:
21f3 : 25 43 __ AND T1 + 0 
.s36:
21f5 : 8d 10 d0 STA $d010 
21f8 : ad fb 42 LDA $42fb ; (vspriteScreen + 0)
21fb : 85 43 __ STA T1 + 0 
21fd : ad fc 42 LDA $42fc ; (vspriteScreen + 1)
2200 : 85 44 __ STA T1 + 1 
2202 : a9 41 __ LDA #$41
2204 : a4 45 __ LDY T2 + 0 
2206 : 91 43 __ STA (T1 + 0),y 
2208 : a9 0f __ LDA #$0f
220a : 9d 2b d0 STA $d02b,x 
.l23:
220d : e8 __ __ INX
220e : e0 03 __ CPX #$03
2210 : b0 65 __ BCS $2277 ; (game_state.s24 + 0)
.s21:
2212 : bd 4d 43 LDA $434d,x ; (cities[0] + 0)
2215 : f0 8e __ BEQ $21a5 ; (game_state.s22 + 0)
.l38:
2217 : e8 __ __ INX
2218 : 86 45 __ STX T2 + 0 
221a : bd 88 42 LDA $4288,x ; (bitshift[0] + 8)
221d : 0d 15 d0 ORA $d015 
2220 : 8d 15 d0 STA $d015 
2223 : bd 88 42 LDA $4288,x ; (bitshift[0] + 8)
2226 : 49 ff __ EOR #$ff
2228 : 85 47 __ STA T3 + 0 
222a : 2d 1c d0 AND $d01c 
222d : 8d 1c d0 STA $d01c 
2230 : ad 1d d0 LDA $d01d 
2233 : 25 47 __ AND T3 + 0 
2235 : 8d 1d d0 STA $d01d 
2238 : ad 17 d0 LDA $d017 
223b : 25 47 __ AND T3 + 0 
223d : 8d 17 d0 STA $d017 
2240 : ad fb 42 LDA $42fb ; (vspriteScreen + 0)
2243 : 85 43 __ STA T1 + 0 
2245 : ad fc 42 LDA $42fc ; (vspriteScreen + 1)
2248 : 85 44 __ STA T1 + 1 
224a : 8a __ __ TXA
224b : 0a __ __ ASL
224c : a8 __ __ TAY
224d : a9 de __ LDA #$de
224f : 99 01 d0 STA $d001,y 
2252 : bd bc 3a LDA $3abc,x ; (divmod32 + 214)
2255 : 18 __ __ CLC
2256 : 69 46 __ ADC #$46
2258 : 99 00 d0 STA $d000,y 
225b : ad 10 d0 LDA $d010 
225e : 25 47 __ AND T3 + 0 
2260 : 8d 10 d0 STA $d010 
2263 : a9 41 __ LDA #$41
2265 : a4 45 __ LDY T2 + 0 
2267 : 91 43 __ STA (T1 + 0),y 
2269 : a9 0f __ LDA #$0f
226b : 9d 27 d0 STA $d027,x 
226e : ca __ __ DEX
226f : bd 50 43 LDA $4350,x ; (cities[0] + 3)
2272 : f0 99 __ BEQ $220d ; (game_state.l23 + 0)
2274 : 4c aa 21 JMP $21aa ; (game_state.l34 + 0)
.s24:
2277 : a9 00 __ LDA #$00
2279 : 8d 5e 43 STA $435e ; (mused + 0)
227c : 8d 5f 43 STA $435f ; (mused + 1)
227f : a9 00 __ LDA #$00
2281 : 85 53 __ STA T0 + 0 
2283 : 8d 60 43 STA $4360 ; (mfree + 0)
2286 : a9 45 __ LDA #$45
2288 : 8d 61 43 STA $4361 ; (mfree + 1)
228b : a2 07 __ LDX #$07
.l111:
228d : 85 54 __ STA T0 + 1 
228f : 18 __ __ CLC
2290 : a5 53 __ LDA T0 + 0 
2292 : 69 16 __ ADC #$16
2294 : 85 43 __ STA T1 + 0 
2296 : a0 14 __ LDY #$14
2298 : 91 53 __ STA (T0 + 0),y 
229a : a5 54 __ LDA T0 + 1 
229c : 69 00 __ ADC #$00
229e : c8 __ __ INY
229f : 91 53 __ STA (T0 + 0),y 
22a1 : a4 43 __ LDY T1 + 0 
22a3 : 84 53 __ STY T0 + 0 
22a5 : ca __ __ DEX
22a6 : d0 e5 __ BNE $228d ; (game_state.l111 + 0)
.s112:
22a8 : 86 f7 __ STX $f7 ; (eused + 0)
22aa : 86 f8 __ STX $f8 ; (eused + 1)
22ac : 8e ae 45 STX $45ae ; (missiles[0] + 174)
22af : 8e af 45 STX $45af ; (missiles[0] + 175)
22b2 : a9 62 __ LDA #$62
22b4 : 85 53 __ STA T0 + 0 
22b6 : 85 f9 __ STA $f9 ; (efree + 0)
22b8 : a9 43 __ LDA #$43
22ba : 85 fa __ STA $fa ; (efree + 1)
22bc : a2 0f __ LDX #$0f
.l113:
22be : 85 54 __ STA T0 + 1 
22c0 : 18 __ __ CLC
22c1 : a5 53 __ LDA T0 + 0 
22c3 : 69 07 __ ADC #$07
22c5 : 85 43 __ STA T1 + 0 
22c7 : a0 05 __ LDY #$05
22c9 : 91 53 __ STA (T0 + 0),y 
22cb : a5 54 __ LDA T0 + 1 
22cd : 69 00 __ ADC #$00
22cf : c8 __ __ INY
22d0 : 91 53 __ STA (T0 + 0),y 
22d2 : a4 43 __ LDY T1 + 0 
22d4 : 84 53 __ STY T0 + 0 
22d6 : ca __ __ DEX
22d7 : d0 e5 __ BNE $22be ; (game_state.l113 + 0)
.s114:
22d9 : 86 fb __ STX $fb ; (iused + 0)
22db : 86 fc __ STX $fc ; (iused + 1)
22dd : 8e d0 43 STX $43d0 ; (explosions[0] + 110)
22e0 : 8e d1 43 STX $43d1 ; (explosions[0] + 111)
22e3 : a9 b0 __ LDA #$b0
22e5 : 85 53 __ STA T0 + 0 
22e7 : 85 fd __ STA $fd ; (ifree + 0)
22e9 : a9 45 __ LDA #$45
22eb : 85 fe __ STA $fe ; (ifree + 1)
22ed : a2 0f __ LDX #$0f
.l115:
22ef : 85 54 __ STA T0 + 1 
22f1 : 18 __ __ CLC
22f2 : a5 53 __ LDA T0 + 0 
22f4 : 69 16 __ ADC #$16
22f6 : 85 43 __ STA T1 + 0 
22f8 : a0 14 __ LDY #$14
22fa : 91 53 __ STA (T0 + 0),y 
22fc : a5 54 __ LDA T0 + 1 
22fe : 69 00 __ ADC #$00
2300 : c8 __ __ INY
2301 : 91 53 __ STA (T0 + 0),y 
2303 : a4 43 __ LDY T1 + 0 
2305 : 84 53 __ STY T0 + 0 
2307 : ca __ __ DEX
2308 : d0 e5 __ BNE $22ef ; (game_state.l115 + 0)
.s116:
230a : 8e 0e 47 STX $470e ; (icbms[0] + 350)
230d : 8e 0f 47 STX $470f ; (icbms[0] + 351)
2310 : a9 1e __ LDA #$1e
2312 : 8d d2 43 STA $43d2 ; (nmissiles + 0)
2315 : 8a __ __ TXA
.l33:
2316 : 0a __ __ ASL
2317 : c9 1d __ CMP #$1d
2319 : b0 09 __ BCS $2324 ; (game_state.s25 + 0)
.s32:
231b : a9 5c __ LDA #$5c
231d : 9d 19 c8 STA $c819,x 
2320 : e8 __ __ INX
2321 : 8a __ __ TXA
2322 : 10 f2 __ BPL $2316 ; (game_state.l33 + 0)
.s25:
2324 : e0 0f __ CPX #$0f
2326 : b0 0a __ BCS $2332 ; (game_state.s26 + 0)
.s31:
2328 : a9 5e __ LDA #$5e
.l121:
232a : 9d 19 c8 STA $c819,x 
232d : e8 __ __ INX
232e : e0 0f __ CPX #$0f
2330 : 90 f8 __ BCC $232a ; (game_state.l121 + 0)
.s26:
2332 : ad 4c 43 LDA $434c ; (TheGame.level + 0)
2335 : c9 70 __ CMP #$70
2337 : 90 12 __ BCC $234b ; (game_state.s29 + 0)
.s27:
2339 : a9 78 __ LDA #$78
233b : 8d d3 43 STA $43d3 ; (icbmspeed + 0)
.s28:
233e : a9 0f __ LDA #$0f
2340 : 8d 4b 43 STA $434b ; (TheGame.count + 0)
2343 : a9 1e __ LDA #$1e
.s118:
2345 : 8d d4 43 STA $43d4 ; (icbmcount + 0)
2348 : 4c a8 1f JMP $1fa8 ; (game_state.s3 + 0)
.s29:
234b : 69 08 __ ADC #$08
234d : 8d d3 43 STA $43d3 ; (icbmspeed + 0)
2350 : ad 4c 43 LDA $434c ; (TheGame.level + 0)
2353 : c9 32 __ CMP #$32
2355 : b0 e7 __ BCS $233e ; (game_state.s28 + 0)
.s30:
2357 : a2 0f __ LDX #$0f
2359 : 8e 4b 43 STX $434b ; (TheGame.count + 0)
235c : 4a __ __ LSR
235d : 18 __ __ CLC
235e : 69 05 __ ADC #$05
2360 : 4c 45 23 JMP $2345 ; (game_state.s118 + 0)
.l39:
2363 : b9 0c c8 LDA $c80c,y 
2366 : aa __ __ TAX
2367 : d9 02 c8 CMP $c802,y 
236a : f0 03 __ BEQ $236f ; (game_state.s59 + 0)
236c : 4c 61 26 JMP $2661 ; (game_state.s40 + 0)
.s59:
236f : c8 __ __ INY
2370 : c0 08 __ CPY #$08
2372 : 90 ef __ BCC $2363 ; (game_state.l39 + 0)
.s120:
2374 : 85 1b __ STA ACCU + 0 
.s41:
2376 : a9 00 __ LDA #$00
2378 : 85 0d __ STA P0 
237a : 85 0e __ STA P1 
237c : 85 10 __ STA P3 
237e : 85 11 __ STA P4 
2380 : 85 12 __ STA P5 
2382 : 85 14 __ STA P7 
2384 : 85 18 __ STA P11 
2386 : a9 08 __ LDA #$08
2388 : 85 0f __ STA P2 
238a : 85 13 __ STA P6 
238c : a9 30 __ LDA #$30
238e : 8d 02 c8 STA $c802 
2391 : 8d 03 c8 STA $c803 
2394 : 8d 04 c8 STA $c804 
2397 : 8d 05 c8 STA $c805 
239a : 8d 06 c8 STA $c806 
239d : 8d 07 c8 STA $c807 
23a0 : 8d 08 c8 STA $c808 
23a3 : 8d 09 c8 STA $c809 
23a6 : a9 40 __ LDA #$40
23a8 : 85 15 __ STA P8 
23aa : a9 01 __ LDA #$01
23ac : 85 16 __ STA P9 
23ae : a9 b8 __ LDA #$b8
23b0 : 85 17 __ STA P10 
23b2 : a9 00 __ LDA #$00
23b4 : 8d eb c7 STA $c7eb ; (sstack + 0)
23b7 : a9 42 __ LDA #$42
23b9 : 8d ec c7 STA $c7ec ; (sstack + 1)
23bc : 20 eb 2b JSR $2beb ; (bmu_bitblit.s4 + 0)
23bf : a9 c0 __ LDA #$c0
23c1 : 85 0f __ STA P2 
23c3 : 85 13 __ STA P6 
23c5 : a9 08 __ LDA #$08
23c7 : 85 17 __ STA P10 
23c9 : a9 78 __ LDA #$78
23cb : 8d eb c7 STA $c7eb ; (sstack + 0)
23ce : a9 42 __ LDA #$42
23d0 : 8d ec c7 STA $c7ec ; (sstack + 1)
23d3 : 20 eb 2b JSR $2beb ; (bmu_bitblit.s4 + 0)
23d6 : a9 00 __ LDA #$00
23d8 : 8d f5 c7 STA $c7f5 ; (sstack + 10)
23db : 8d f6 c7 STA $c7f6 ; (sstack + 11)
23de : 8d f8 c7 STA $c7f8 ; (sstack + 13)
23e1 : 8d fa c7 STA $c7fa ; (sstack + 15)
23e4 : 8d fc c7 STA $c7fc ; (sstack + 17)
23e7 : a9 10 __ LDA #$10
23e9 : 8d f7 c7 STA $c7f7 ; (sstack + 12)
23ec : a9 20 __ LDA #$20
23ee : 8d f9 c7 STA $c7f9 ; (sstack + 14)
23f1 : a9 30 __ LDA #$30
23f3 : 8d fb c7 STA $c7fb ; (sstack + 16)
23f6 : a9 78 __ LDA #$78
23f8 : 8d fd c7 STA $c7fd ; (sstack + 18)
23fb : a9 42 __ LDA #$42
23fd : 8d fe c7 STA $c7fe ; (sstack + 19)
2400 : 20 a9 2e JSR $2ea9 ; (bmmc_quad_fill.s1 + 0)
2403 : a9 00 __ LDA #$00
2405 : 8d f6 c7 STA $c7f6 ; (sstack + 11)
2408 : 8d f8 c7 STA $c7f8 ; (sstack + 13)
240b : 8d fa c7 STA $c7fa ; (sstack + 15)
240e : 8d fc c7 STA $c7fc ; (sstack + 17)
2411 : a9 88 __ LDA #$88
2413 : 8d f5 c7 STA $c7f5 ; (sstack + 10)
2416 : a9 98 __ LDA #$98
2418 : 8d f7 c7 STA $c7f7 ; (sstack + 12)
241b : a9 b0 __ LDA #$b0
241d : 8d f9 c7 STA $c7f9 ; (sstack + 14)
2420 : a9 c0 __ LDA #$c0
2422 : 8d fb c7 STA $c7fb ; (sstack + 16)
2425 : a9 78 __ LDA #$78
2427 : 8d fd c7 STA $c7fd ; (sstack + 18)
242a : a9 42 __ LDA #$42
242c : 8d fe c7 STA $c7fe ; (sstack + 19)
242f : 20 a9 2e JSR $2ea9 ; (bmmc_quad_fill.s1 + 0)
2432 : a9 01 __ LDA #$01
2434 : 8d f6 c7 STA $c7f6 ; (sstack + 11)
2437 : 8d f8 c7 STA $c7f8 ; (sstack + 13)
243a : 8d fa c7 STA $c7fa ; (sstack + 15)
243d : 8d fc c7 STA $c7fc ; (sstack + 17)
2440 : a9 10 __ LDA #$10
2442 : 8d f5 c7 STA $c7f5 ; (sstack + 10)
2445 : a9 20 __ LDA #$20
2447 : 8d f7 c7 STA $c7f7 ; (sstack + 12)
244a : a9 30 __ LDA #$30
244c : 8d f9 c7 STA $c7f9 ; (sstack + 14)
244f : a9 40 __ LDA #$40
2451 : 8d fb c7 STA $c7fb ; (sstack + 16)
2454 : a9 78 __ LDA #$78
2456 : 8d fd c7 STA $c7fd ; (sstack + 18)
2459 : a9 42 __ LDA #$42
245b : 8d fe c7 STA $c7fe ; (sstack + 19)
245e : 20 a9 2e JSR $2ea9 ; (bmmc_quad_fill.s1 + 0)
2461 : a2 00 __ LDX #$00
2463 : ad 4d 43 LDA $434d ; (cities[0] + 0)
2466 : d0 72 __ BNE $24da ; (game_state.l58 + 0)
.s43:
2468 : bd 50 43 LDA $4350,x ; (cities[0] + 3)
246b : f0 63 __ BEQ $24d0 ; (game_state.l44 + 0)
.l54:
246d : 8a __ __ TXA
246e : 18 __ __ CLC
246f : 69 04 __ ADC #$04
2471 : 85 45 __ STA T2 + 0 
2473 : a8 __ __ TAY
2474 : b9 88 42 LDA $4288,y ; (bitshift[0] + 8)
2477 : 85 47 __ STA T3 + 0 
2479 : 0d 15 d0 ORA $d015 
247c : 8d 15 d0 STA $d015 
247f : b9 88 42 LDA $4288,y ; (bitshift[0] + 8)
2482 : 49 ff __ EOR #$ff
2484 : 85 43 __ STA T1 + 0 
2486 : 2d 1c d0 AND $d01c 
2489 : 8d 1c d0 STA $d01c 
248c : ad 1d d0 LDA $d01d 
248f : 25 43 __ AND T1 + 0 
2491 : 8d 1d d0 STA $d01d 
2494 : ad 17 d0 LDA $d017 
2497 : 25 43 __ AND T1 + 0 
2499 : 8d 17 d0 STA $d017 
249c : 98 __ __ TYA
249d : 0a __ __ ASL
249e : a8 __ __ TAY
249f : a9 de __ LDA #$de
24a1 : 99 01 d0 STA $d001,y 
24a4 : bd bd 3a LDA $3abd,x ; (__multab32L + 0)
24a7 : 18 __ __ CLC
24a8 : 69 d6 __ ADC #$d6
24aa : 99 00 d0 STA $d000,y 
24ad : ad 10 d0 LDA $d010 
24b0 : 90 04 __ BCC $24b6 ; (game_state.s55 + 0)
.s57:
24b2 : 05 47 __ ORA T3 + 0 
24b4 : b0 02 __ BCS $24b8 ; (game_state.s56 + 0)
.s55:
24b6 : 25 43 __ AND T1 + 0 
.s56:
24b8 : 8d 10 d0 STA $d010 
24bb : ad fb 42 LDA $42fb ; (vspriteScreen + 0)
24be : 85 43 __ STA T1 + 0 
24c0 : ad fc 42 LDA $42fc ; (vspriteScreen + 1)
24c3 : 85 44 __ STA T1 + 1 
24c5 : a9 41 __ LDA #$41
24c7 : a4 45 __ LDY T2 + 0 
24c9 : 91 43 __ STA (T1 + 0),y 
24cb : a9 0f __ LDA #$0f
24cd : 9d 2b d0 STA $d02b,x 
.l44:
24d0 : e8 __ __ INX
24d1 : e0 03 __ CPX #$03
24d3 : b0 65 __ BCS $253a ; (game_state.s45 + 0)
.s42:
24d5 : bd 4d 43 LDA $434d,x ; (cities[0] + 0)
24d8 : f0 8e __ BEQ $2468 ; (game_state.s43 + 0)
.l58:
24da : e8 __ __ INX
24db : 86 45 __ STX T2 + 0 
24dd : bd 88 42 LDA $4288,x ; (bitshift[0] + 8)
24e0 : 0d 15 d0 ORA $d015 
24e3 : 8d 15 d0 STA $d015 
24e6 : bd 88 42 LDA $4288,x ; (bitshift[0] + 8)
24e9 : 49 ff __ EOR #$ff
24eb : 85 47 __ STA T3 + 0 
24ed : 2d 1c d0 AND $d01c 
24f0 : 8d 1c d0 STA $d01c 
24f3 : ad 1d d0 LDA $d01d 
24f6 : 25 47 __ AND T3 + 0 
24f8 : 8d 1d d0 STA $d01d 
24fb : ad 17 d0 LDA $d017 
24fe : 25 47 __ AND T3 + 0 
2500 : 8d 17 d0 STA $d017 
2503 : ad fb 42 LDA $42fb ; (vspriteScreen + 0)
2506 : 85 43 __ STA T1 + 0 
2508 : ad fc 42 LDA $42fc ; (vspriteScreen + 1)
250b : 85 44 __ STA T1 + 1 
250d : 8a __ __ TXA
250e : 0a __ __ ASL
250f : a8 __ __ TAY
2510 : a9 de __ LDA #$de
2512 : 99 01 d0 STA $d001,y 
2515 : bd bc 3a LDA $3abc,x ; (divmod32 + 214)
2518 : 18 __ __ CLC
2519 : 69 46 __ ADC #$46
251b : 99 00 d0 STA $d000,y 
251e : ad 10 d0 LDA $d010 
2521 : 25 47 __ AND T3 + 0 
2523 : 8d 10 d0 STA $d010 
2526 : a9 41 __ LDA #$41
2528 : a4 45 __ LDY T2 + 0 
252a : 91 43 __ STA (T1 + 0),y 
252c : a9 0f __ LDA #$0f
252e : 9d 27 d0 STA $d027,x 
2531 : ca __ __ DEX
2532 : bd 50 43 LDA $4350,x ; (cities[0] + 3)
2535 : f0 99 __ BEQ $24d0 ; (game_state.l44 + 0)
2537 : 4c 6d 24 JMP $246d ; (game_state.l54 + 0)
.s45:
253a : a2 00 __ LDX #$00
253c : 86 5b __ STX T12 + 0 
253e : a9 28 __ LDA #$28
2540 : 85 59 __ STA T11 + 0 
.l46:
2542 : bd d4 1d LDA $1dd4,x 
2545 : 0a __ __ ASL
2546 : 0a __ __ ASL
2547 : 85 53 __ STA T0 + 0 
2549 : a9 00 __ LDA #$00
254b : 2a __ __ ROL
254c : 06 53 __ ASL T0 + 0 
254e : 2a __ __ ROL
254f : aa __ __ TAX
2550 : a9 c3 __ LDA #$c3
2552 : 65 53 __ ADC T0 + 0 
2554 : 85 53 __ STA T0 + 0 
2556 : 8a __ __ TXA
2557 : 69 3e __ ADC #$3e
2559 : 85 54 __ STA T0 + 1 
255b : a0 00 __ LDY #$00
.l47:
255d : 84 5c __ STY T13 + 0 
255f : 98 __ __ TYA
2560 : 18 __ __ CLC
2561 : 69 32 __ ADC #$32
2563 : 0a __ __ ASL
2564 : aa __ __ TAX
2565 : 29 07 __ AND #$07
2567 : 85 47 __ STA T3 + 0 
2569 : 8a __ __ TXA
256a : 29 78 __ AND #$78
256c : 85 49 __ STA T4 + 0 
256e : e8 __ __ INX
256f : 8a __ __ TXA
2570 : 29 07 __ AND #$07
2572 : 85 4b __ STA T5 + 0 
2574 : 8a __ __ TXA
2575 : 29 78 __ AND #$78
2577 : 85 43 __ STA T1 + 0 
2579 : a9 00 __ LDA #$00
257b : 85 5d __ STA T14 + 0 
257d : b1 53 __ LDA (T0 + 0),y 
257f : 85 45 __ STA T2 + 0 
2581 : 30 11 __ BMI $2594 ; (game_state.l53 + 0)
.l49:
2583 : e6 5d __ INC T14 + 0 
2585 : a5 5d __ LDA T14 + 0 
2587 : c9 08 __ CMP #$08
2589 : 90 03 __ BCC $258e ; (game_state.s48 + 0)
258b : 4c 1f 26 JMP $261f ; (game_state.s50 + 0)
.s48:
258e : 06 45 __ ASL T2 + 0 
2590 : 24 45 __ BIT T2 + 0 
2592 : 10 ef __ BPL $2583 ; (game_state.l49 + 0)
.l53:
2594 : a5 5d __ LDA T14 + 0 
2596 : 0a __ __ ASL
2597 : 18 __ __ CLC
2598 : 65 59 __ ADC T11 + 0 
259a : 85 4d __ STA T6 + 0 
259c : 29 f8 __ AND #$f8
259e : 85 4f __ STA T7 + 0 
25a0 : 05 47 __ ORA T3 + 0 
25a2 : 85 51 __ STA T8 + 0 
25a4 : a9 00 __ LDA #$00
25a6 : 85 1c __ STA ACCU + 1 
25a8 : 2a __ __ ROL
25a9 : 85 4e __ STA T6 + 1 
25ab : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
25ae : 85 1b __ STA ACCU + 0 
25b0 : a5 49 __ LDA T4 + 0 
25b2 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
25b5 : ad fd 42 LDA $42fd ; (sbm.data + 0)
25b8 : 18 __ __ CLC
25b9 : 65 1b __ ADC ACCU + 0 
25bb : a8 __ __ TAY
25bc : ad fe 42 LDA $42fe ; (sbm.data + 1)
25bf : 65 1c __ ADC ACCU + 1 
25c1 : aa __ __ TAX
25c2 : 98 __ __ TYA
25c3 : 18 __ __ CLC
25c4 : 65 51 __ ADC T8 + 0 
25c6 : 85 57 __ STA T10 + 0 
25c8 : 8a __ __ TXA
25c9 : 65 4e __ ADC T6 + 1 
25cb : 85 58 __ STA T10 + 1 
25cd : ad db 41 LDA $41db ; (cbytes[0] + 3)
25d0 : a0 00 __ LDY #$00
25d2 : 84 1c __ STY ACCU + 1 
25d4 : 51 57 __ EOR (T10 + 0),y 
25d6 : 85 51 __ STA T8 + 0 
25d8 : a5 4d __ LDA T6 + 0 
25da : 29 07 __ AND #$07
25dc : 85 4d __ STA T6 + 0 
25de : aa __ __ TAX
25df : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
25e2 : 25 51 __ AND T8 + 0 
25e4 : 4d db 41 EOR $41db ; (cbytes[0] + 3)
25e7 : 91 57 __ STA (T10 + 0),y 
25e9 : a5 4b __ LDA T5 + 0 
25eb : 05 4f __ ORA T7 + 0 
25ed : 85 4f __ STA T7 + 0 
25ef : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
25f2 : 85 1b __ STA ACCU + 0 
25f4 : a5 43 __ LDA T1 + 0 
25f6 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
25f9 : ad fd 42 LDA $42fd ; (sbm.data + 0)
25fc : 18 __ __ CLC
25fd : 65 1b __ ADC ACCU + 0 
25ff : 85 55 __ STA T9 + 0 
2601 : ad fe 42 LDA $42fe ; (sbm.data + 1)
2604 : 65 1c __ ADC ACCU + 1 
2606 : 18 __ __ CLC
2607 : 65 4e __ ADC T6 + 1 
2609 : 85 56 __ STA T9 + 1 
260b : ad db 41 LDA $41db ; (cbytes[0] + 3)
260e : a4 4f __ LDY T7 + 0 
2610 : 51 55 __ EOR (T9 + 0),y 
2612 : a6 4d __ LDX T6 + 0 
2614 : 3d dc 41 AND $41dc,x ; (andmask[0] + 0)
2617 : 4d db 41 EOR $41db ; (cbytes[0] + 3)
261a : 91 55 __ STA (T9 + 0),y 
261c : 4c 83 25 JMP $2583 ; (game_state.l49 + 0)
.s50:
261f : a4 5c __ LDY T13 + 0 
2621 : c8 __ __ INY
2622 : c0 08 __ CPY #$08
2624 : b0 03 __ BCS $2629 ; (game_state.s51 + 0)
2626 : 4c 5d 25 JMP $255d ; (game_state.l47 + 0)
.s51:
2629 : a5 59 __ LDA T11 + 0 
262b : 69 0f __ ADC #$0f
262d : 85 59 __ STA T11 + 0 
262f : e6 5b __ INC T12 + 0 
2631 : a6 5b __ LDX T12 + 0 
2633 : bd d4 1d LDA $1dd4,x 
2636 : f0 03 __ BEQ $263b ; (game_state.s52 + 0)
2638 : 4c 42 25 JMP $2542 ; (game_state.l46 + 0)
.s52:
263b : a9 01 __ LDA #$01
263d : 8d 4d 43 STA $434d ; (cities[0] + 0)
2640 : 8d 4e 43 STA $434e ; (cities[0] + 1)
2643 : 8d 4f 43 STA $434f ; (cities[0] + 2)
2646 : 8d 50 43 STA $4350 ; (cities[0] + 3)
2649 : 8d 51 43 STA $4351 ; (cities[0] + 4)
264c : 8d 52 43 STA $4352 ; (cities[0] + 5)
264f : a9 3c __ LDA #$3c
2651 : 8d 4b 43 STA $434b ; (TheGame.count + 0)
2654 : a9 00 __ LDA #$00
2656 : 8d 4c 43 STA $434c ; (TheGame.level + 0)
2659 : a9 06 __ LDA #$06
265b : 8d 53 43 STA $4353 ; (ncities + 0)
265e : 4c a8 1f JMP $1fa8 ; (game_state.s3 + 0)
.s40:
2661 : 86 1b __ STX ACCU + 0 
2663 : d9 02 c8 CMP $c802,y 
2666 : 90 03 __ BCC $266b ; (game_state.l110 + 0)
2668 : 4c 76 23 JMP $2376 ; (game_state.s41 + 0)
.l110:
266b : b9 02 c8 LDA $c802,y 
266e : 99 0c c8 STA $c80c,y 
2671 : c8 __ __ INY
2672 : c0 08 __ CPY #$08
2674 : 90 f5 __ BCC $266b ; (game_state.l110 + 0)
2676 : 4c 76 23 JMP $2376 ; (game_state.s41 + 0)
.s60:
2679 : ad 4c 43 LDA $434c ; (TheGame.level + 0)
267c : 69 00 __ ADC #$00
267e : 85 1b __ STA ACCU + 0 
2680 : 8d 4c 43 STA $434c ; (TheGame.level + 0)
2683 : a9 00 __ LDA #$00
2685 : 85 47 __ STA T3 + 0 
2687 : 85 1c __ STA ACCU + 1 
.l108:
2689 : 20 84 38 JSR $3884 ; (divmod@proxy + 0)
268c : 18 __ __ CLC
268d : a5 05 __ LDA WORK + 2 
268f : 69 30 __ ADC #$30
2691 : a6 47 __ LDX T3 + 0 
2693 : 9d 54 43 STA $4354,x ; (cbuffer[0] + 0)
2696 : e6 47 __ INC T3 + 0 
2698 : a5 1b __ LDA ACCU + 0 
269a : d0 ed __ BNE $2689 ; (game_state.l108 + 0)
.s109:
269c : a6 47 __ LDX T3 + 0 
269e : 9d 54 43 STA $4354,x ; (cbuffer[0] + 0)
26a1 : 85 45 __ STA T2 + 0 
26a3 : 4c bf 26 JMP $26bf ; (game_state.l61 + 0)
.s80:
26a6 : a4 45 __ LDY T2 + 0 
26a8 : be 54 43 LDX $4354,y ; (cbuffer[0] + 0)
26ab : a4 47 __ LDY T3 + 0 
26ad : b9 53 43 LDA $4353,y ; (ncities + 0)
26b0 : a4 45 __ LDY T2 + 0 
26b2 : 99 54 43 STA $4354,y ; (cbuffer[0] + 0)
26b5 : 8a __ __ TXA
26b6 : a6 47 __ LDX T3 + 0 
26b8 : 9d 53 43 STA $4353,x ; (ncities + 0)
26bb : c6 47 __ DEC T3 + 0 
26bd : e6 45 __ INC T2 + 0 
.l61:
26bf : 18 __ __ CLC
26c0 : a5 45 __ LDA T2 + 0 
26c2 : 69 01 __ ADC #$01
26c4 : c5 47 __ CMP T3 + 0 
26c6 : 90 de __ BCC $26a6 ; (game_state.s80 + 0)
.s62:
26c8 : a9 00 __ LDA #$00
26ca : 85 0d __ STA P0 
26cc : 85 0e __ STA P1 
26ce : 85 10 __ STA P3 
26d0 : 85 11 __ STA P4 
26d2 : 85 12 __ STA P5 
26d4 : 85 14 __ STA P7 
26d6 : 85 18 __ STA P11 
26d8 : a9 08 __ LDA #$08
26da : 85 0f __ STA P2 
26dc : 85 13 __ STA P6 
26de : a9 40 __ LDA #$40
26e0 : 85 15 __ STA P8 
26e2 : a9 00 __ LDA #$00
26e4 : 8d eb c7 STA $c7eb ; (sstack + 0)
26e7 : a9 01 __ LDA #$01
26e9 : 85 16 __ STA P9 
26eb : a9 b0 __ LDA #$b0
26ed : 85 17 __ STA P10 
26ef : a9 42 __ LDA #$42
26f1 : 8d ec c7 STA $c7ec ; (sstack + 1)
26f4 : 20 eb 2b JSR $2beb ; (bmu_bitblit.s4 + 0)
26f7 : a2 00 __ LDX #$00
26f9 : 86 5b __ STX T12 + 0 
26fb : a9 60 __ LDA #$60
26fd : 85 59 __ STA T11 + 0 
.l63:
26ff : bd e3 1d LDA $1de3,x 
2702 : 0a __ __ ASL
2703 : 0a __ __ ASL
2704 : 85 53 __ STA T0 + 0 
2706 : a9 00 __ LDA #$00
2708 : 2a __ __ ROL
2709 : 06 53 __ ASL T0 + 0 
270b : 2a __ __ ROL
270c : aa __ __ TAX
270d : a9 c3 __ LDA #$c3
270f : 65 53 __ ADC T0 + 0 
2711 : 85 53 __ STA T0 + 0 
2713 : 8a __ __ TXA
2714 : 69 3e __ ADC #$3e
2716 : 85 54 __ STA T0 + 1 
2718 : a0 00 __ LDY #$00
.l64:
271a : 84 5c __ STY T13 + 0 
271c : 98 __ __ TYA
271d : 18 __ __ CLC
271e : 69 32 __ ADC #$32
2720 : 0a __ __ ASL
2721 : aa __ __ TAX
2722 : 29 07 __ AND #$07
2724 : 85 47 __ STA T3 + 0 
2726 : 8a __ __ TXA
2727 : 29 78 __ AND #$78
2729 : 85 49 __ STA T4 + 0 
272b : e8 __ __ INX
272c : 8a __ __ TXA
272d : 29 07 __ AND #$07
272f : 85 4b __ STA T5 + 0 
2731 : 8a __ __ TXA
2732 : 29 78 __ AND #$78
2734 : 85 43 __ STA T1 + 0 
2736 : a9 00 __ LDA #$00
2738 : 85 5d __ STA T14 + 0 
273a : b1 53 __ LDA (T0 + 0),y 
273c : 85 45 __ STA T2 + 0 
273e : 30 11 __ BMI $2751 ; (game_state.l79 + 0)
.l66:
2740 : e6 5d __ INC T14 + 0 
2742 : a5 5d __ LDA T14 + 0 
2744 : c9 08 __ CMP #$08
2746 : 90 03 __ BCC $274b ; (game_state.s65 + 0)
2748 : 4c dc 27 JMP $27dc ; (game_state.s67 + 0)
.s65:
274b : 06 45 __ ASL T2 + 0 
274d : 24 45 __ BIT T2 + 0 
274f : 10 ef __ BPL $2740 ; (game_state.l66 + 0)
.l79:
2751 : a5 5d __ LDA T14 + 0 
2753 : 0a __ __ ASL
2754 : 18 __ __ CLC
2755 : 65 59 __ ADC T11 + 0 
2757 : 85 4d __ STA T6 + 0 
2759 : 29 f8 __ AND #$f8
275b : 85 4f __ STA T7 + 0 
275d : 05 47 __ ORA T3 + 0 
275f : 85 51 __ STA T8 + 0 
2761 : a9 00 __ LDA #$00
2763 : 85 1c __ STA ACCU + 1 
2765 : 2a __ __ ROL
2766 : 85 4e __ STA T6 + 1 
2768 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
276b : 85 1b __ STA ACCU + 0 
276d : a5 49 __ LDA T4 + 0 
276f : 20 16 38 JSR $3816 ; (mul16by8 + 0)
2772 : ad fd 42 LDA $42fd ; (sbm.data + 0)
2775 : 18 __ __ CLC
2776 : 65 1b __ ADC ACCU + 0 
2778 : a8 __ __ TAY
2779 : ad fe 42 LDA $42fe ; (sbm.data + 1)
277c : 65 1c __ ADC ACCU + 1 
277e : aa __ __ TAX
277f : 98 __ __ TYA
2780 : 18 __ __ CLC
2781 : 65 51 __ ADC T8 + 0 
2783 : 85 57 __ STA T10 + 0 
2785 : 8a __ __ TXA
2786 : 65 4e __ ADC T6 + 1 
2788 : 85 58 __ STA T10 + 1 
278a : ad db 41 LDA $41db ; (cbytes[0] + 3)
278d : a0 00 __ LDY #$00
278f : 84 1c __ STY ACCU + 1 
2791 : 51 57 __ EOR (T10 + 0),y 
2793 : 85 51 __ STA T8 + 0 
2795 : a5 4d __ LDA T6 + 0 
2797 : 29 07 __ AND #$07
2799 : 85 4d __ STA T6 + 0 
279b : aa __ __ TAX
279c : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
279f : 25 51 __ AND T8 + 0 
27a1 : 4d db 41 EOR $41db ; (cbytes[0] + 3)
27a4 : 91 57 __ STA (T10 + 0),y 
27a6 : a5 4b __ LDA T5 + 0 
27a8 : 05 4f __ ORA T7 + 0 
27aa : 85 4f __ STA T7 + 0 
27ac : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
27af : 85 1b __ STA ACCU + 0 
27b1 : a5 43 __ LDA T1 + 0 
27b3 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
27b6 : ad fd 42 LDA $42fd ; (sbm.data + 0)
27b9 : 18 __ __ CLC
27ba : 65 1b __ ADC ACCU + 0 
27bc : 85 55 __ STA T9 + 0 
27be : ad fe 42 LDA $42fe ; (sbm.data + 1)
27c1 : 65 1c __ ADC ACCU + 1 
27c3 : 18 __ __ CLC
27c4 : 65 4e __ ADC T6 + 1 
27c6 : 85 56 __ STA T9 + 1 
27c8 : ad db 41 LDA $41db ; (cbytes[0] + 3)
27cb : a4 4f __ LDY T7 + 0 
27cd : 51 55 __ EOR (T9 + 0),y 
27cf : a6 4d __ LDX T6 + 0 
27d1 : 3d dc 41 AND $41dc,x ; (andmask[0] + 0)
27d4 : 4d db 41 EOR $41db ; (cbytes[0] + 3)
27d7 : 91 55 __ STA (T9 + 0),y 
27d9 : 4c 40 27 JMP $2740 ; (game_state.l66 + 0)
.s67:
27dc : a4 5c __ LDY T13 + 0 
27de : c8 __ __ INY
27df : c0 08 __ CPY #$08
27e1 : b0 03 __ BCS $27e6 ; (game_state.s68 + 0)
27e3 : 4c 1a 27 JMP $271a ; (game_state.l64 + 0)
.s68:
27e6 : a5 59 __ LDA T11 + 0 
27e8 : 69 0f __ ADC #$0f
27ea : 85 59 __ STA T11 + 0 
27ec : e6 5b __ INC T12 + 0 
27ee : a6 5b __ LDX T12 + 0 
27f0 : bd e3 1d LDA $1de3,x 
27f3 : f0 03 __ BEQ $27f8 ; (game_state.s69 + 0)
27f5 : 4c ff 26 JMP $26ff ; (game_state.l63 + 0)
.s69:
27f8 : ad 54 43 LDA $4354 ; (cbuffer[0] + 0)
27fb : d0 03 __ BNE $2800 ; (game_state.s71 + 0)
27fd : 4c 01 29 JMP $2901 ; (game_state.s70 + 0)
.s71:
2800 : a2 00 __ LDX #$00
2802 : 86 59 __ STX T11 + 0 
2804 : a9 c0 __ LDA #$c0
2806 : 85 5b __ STA T12 + 0 
.l72:
2808 : bd 54 43 LDA $4354,x ; (cbuffer[0] + 0)
280b : 0a __ __ ASL
280c : 0a __ __ ASL
280d : 85 53 __ STA T0 + 0 
280f : a9 00 __ LDA #$00
2811 : 2a __ __ ROL
2812 : 06 53 __ ASL T0 + 0 
2814 : 2a __ __ ROL
2815 : aa __ __ TAX
2816 : a9 c3 __ LDA #$c3
2818 : 65 53 __ ADC T0 + 0 
281a : 85 53 __ STA T0 + 0 
281c : 8a __ __ TXA
281d : 69 3e __ ADC #$3e
281f : 85 54 __ STA T0 + 1 
2821 : a0 00 __ LDY #$00
.l73:
2823 : 84 5c __ STY T13 + 0 
2825 : 98 __ __ TYA
2826 : 18 __ __ CLC
2827 : 69 32 __ ADC #$32
2829 : 0a __ __ ASL
282a : aa __ __ TAX
282b : 29 07 __ AND #$07
282d : 85 47 __ STA T3 + 0 
282f : 8a __ __ TXA
2830 : 29 78 __ AND #$78
2832 : 85 49 __ STA T4 + 0 
2834 : e8 __ __ INX
2835 : 8a __ __ TXA
2836 : 29 07 __ AND #$07
2838 : 85 4b __ STA T5 + 0 
283a : 8a __ __ TXA
283b : 29 78 __ AND #$78
283d : 85 43 __ STA T1 + 0 
283f : a9 00 __ LDA #$00
2841 : 85 5d __ STA T14 + 0 
2843 : b1 53 __ LDA (T0 + 0),y 
2845 : 85 45 __ STA T2 + 0 
2847 : 30 11 __ BMI $285a ; (game_state.l78 + 0)
.l75:
2849 : e6 5d __ INC T14 + 0 
284b : a5 5d __ LDA T14 + 0 
284d : c9 08 __ CMP #$08
284f : 90 03 __ BCC $2854 ; (game_state.s74 + 0)
2851 : 4c e5 28 JMP $28e5 ; (game_state.s76 + 0)
.s74:
2854 : 06 45 __ ASL T2 + 0 
2856 : 24 45 __ BIT T2 + 0 
2858 : 10 ef __ BPL $2849 ; (game_state.l75 + 0)
.l78:
285a : a5 5d __ LDA T14 + 0 
285c : 0a __ __ ASL
285d : 18 __ __ CLC
285e : 65 5b __ ADC T12 + 0 
2860 : 85 4d __ STA T6 + 0 
2862 : 29 f8 __ AND #$f8
2864 : 85 4f __ STA T7 + 0 
2866 : 05 47 __ ORA T3 + 0 
2868 : 85 51 __ STA T8 + 0 
286a : a9 00 __ LDA #$00
286c : 85 1c __ STA ACCU + 1 
286e : 2a __ __ ROL
286f : 85 4e __ STA T6 + 1 
2871 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
2874 : 85 1b __ STA ACCU + 0 
2876 : a5 49 __ LDA T4 + 0 
2878 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
287b : ad fd 42 LDA $42fd ; (sbm.data + 0)
287e : 18 __ __ CLC
287f : 65 1b __ ADC ACCU + 0 
2881 : a8 __ __ TAY
2882 : ad fe 42 LDA $42fe ; (sbm.data + 1)
2885 : 65 1c __ ADC ACCU + 1 
2887 : aa __ __ TAX
2888 : 98 __ __ TYA
2889 : 18 __ __ CLC
288a : 65 51 __ ADC T8 + 0 
288c : 85 57 __ STA T10 + 0 
288e : 8a __ __ TXA
288f : 65 4e __ ADC T6 + 1 
2891 : 85 58 __ STA T10 + 1 
2893 : ad db 41 LDA $41db ; (cbytes[0] + 3)
2896 : a0 00 __ LDY #$00
2898 : 84 1c __ STY ACCU + 1 
289a : 51 57 __ EOR (T10 + 0),y 
289c : 85 51 __ STA T8 + 0 
289e : a5 4d __ LDA T6 + 0 
28a0 : 29 07 __ AND #$07
28a2 : 85 4d __ STA T6 + 0 
28a4 : aa __ __ TAX
28a5 : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
28a8 : 25 51 __ AND T8 + 0 
28aa : 4d db 41 EOR $41db ; (cbytes[0] + 3)
28ad : 91 57 __ STA (T10 + 0),y 
28af : a5 4b __ LDA T5 + 0 
28b1 : 05 4f __ ORA T7 + 0 
28b3 : 85 4f __ STA T7 + 0 
28b5 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
28b8 : 85 1b __ STA ACCU + 0 
28ba : a5 43 __ LDA T1 + 0 
28bc : 20 16 38 JSR $3816 ; (mul16by8 + 0)
28bf : ad fd 42 LDA $42fd ; (sbm.data + 0)
28c2 : 18 __ __ CLC
28c3 : 65 1b __ ADC ACCU + 0 
28c5 : 85 55 __ STA T9 + 0 
28c7 : ad fe 42 LDA $42fe ; (sbm.data + 1)
28ca : 65 1c __ ADC ACCU + 1 
28cc : 18 __ __ CLC
28cd : 65 4e __ ADC T6 + 1 
28cf : 85 56 __ STA T9 + 1 
28d1 : ad db 41 LDA $41db ; (cbytes[0] + 3)
28d4 : a4 4f __ LDY T7 + 0 
28d6 : 51 55 __ EOR (T9 + 0),y 
28d8 : a6 4d __ LDX T6 + 0 
28da : 3d dc 41 AND $41dc,x ; (andmask[0] + 0)
28dd : 4d db 41 EOR $41db ; (cbytes[0] + 3)
28e0 : 91 55 __ STA (T9 + 0),y 
28e2 : 4c 49 28 JMP $2849 ; (game_state.l75 + 0)
.s76:
28e5 : a4 5c __ LDY T13 + 0 
28e7 : c8 __ __ INY
28e8 : c0 08 __ CPY #$08
28ea : b0 03 __ BCS $28ef ; (game_state.s77 + 0)
28ec : 4c 23 28 JMP $2823 ; (game_state.l73 + 0)
.s77:
28ef : a5 5b __ LDA T12 + 0 
28f1 : 69 0f __ ADC #$0f
28f3 : 85 5b __ STA T12 + 0 
28f5 : e6 59 __ INC T11 + 0 
28f7 : a6 59 __ LDX T11 + 0 
28f9 : bd 54 43 LDA $4354,x ; (cbuffer[0] + 0)
28fc : f0 03 __ BEQ $2901 ; (game_state.s70 + 0)
28fe : 4c 08 28 JMP $2808 ; (game_state.l72 + 0)
.s70:
2901 : a9 1e __ LDA #$1e
2903 : 4c b6 20 JMP $20b6 ; (game_state.s117 + 0)
.s81:
2906 : ad 53 43 LDA $4353 ; (ncities + 0)
2909 : 0a __ __ ASL
290a : a2 00 __ LDX #$00
290c : 90 02 __ BCC $2910 ; (game_state.s123 + 0)
.s122:
290e : e8 __ __ INX
290f : 18 __ __ CLC
.s123:
2910 : 6d 53 43 ADC $4353 ; (ncities + 0)
2913 : 90 01 __ BCC $2916 ; (game_state.s125 + 0)
.s124:
2915 : e8 __ __ INX
.s125:
2916 : 86 1b __ STX ACCU + 0 
2918 : 0a __ __ ASL
2919 : 26 1b __ ROL ACCU + 0 
291b : 0a __ __ ASL
291c : 26 1b __ ROL ACCU + 0 
291e : 0a __ __ ASL
291f : 26 1b __ ROL ACCU + 0 
2921 : 18 __ __ CLC
2922 : 6d 53 43 ADC $4353 ; (ncities + 0)
2925 : 85 53 __ STA T0 + 0 
2927 : a5 1b __ LDA ACCU + 0 
2929 : 69 00 __ ADC #$00
292b : 06 53 __ ASL T0 + 0 
292d : 2a __ __ ROL
292e : 85 54 __ STA T0 + 1 
2930 : ad d2 43 LDA $43d2 ; (nmissiles + 0)
2933 : 0a __ __ ASL
2934 : 85 1b __ STA ACCU + 0 
2936 : a9 00 __ LDA #$00
2938 : 85 49 __ STA T4 + 0 
293a : 2a __ __ ROL
293b : 06 1b __ ASL ACCU + 0 
293d : 2a __ __ ROL
293e : aa __ __ TAX
293f : a5 1b __ LDA ACCU + 0 
2941 : 6d d2 43 ADC $43d2 ; (nmissiles + 0)
2944 : 90 02 __ BCC $2948 ; (game_state.s127 + 0)
.s126:
2946 : e8 __ __ INX
2947 : 18 __ __ CLC
.s127:
2948 : 65 53 __ ADC T0 + 0 
294a : 85 1b __ STA ACCU + 0 
294c : 85 43 __ STA T1 + 0 
294e : 8a __ __ TXA
294f : 65 54 __ ADC T0 + 1 
2951 : 85 1c __ STA ACCU + 1 
2953 : 85 44 __ STA T1 + 1 
.l106:
2955 : 20 84 38 JSR $3884 ; (divmod@proxy + 0)
2958 : 18 __ __ CLC
2959 : a5 05 __ LDA WORK + 2 
295b : 69 30 __ ADC #$30
295d : a6 49 __ LDX T4 + 0 
295f : 9d 54 43 STA $4354,x ; (cbuffer[0] + 0)
2962 : e6 49 __ INC T4 + 0 
2964 : a5 1b __ LDA ACCU + 0 
2966 : 05 1c __ ORA ACCU + 1 
2968 : d0 eb __ BNE $2955 ; (game_state.l106 + 0)
.s107:
296a : a6 49 __ LDX T4 + 0 
296c : 9d 54 43 STA $4354,x ; (cbuffer[0] + 0)
296f : 85 47 __ STA T3 + 0 
2971 : 4c 8d 29 JMP $298d ; (game_state.l82 + 0)
.s105:
2974 : a4 47 __ LDY T3 + 0 
2976 : be 54 43 LDX $4354,y ; (cbuffer[0] + 0)
2979 : a4 49 __ LDY T4 + 0 
297b : b9 53 43 LDA $4353,y ; (ncities + 0)
297e : a4 47 __ LDY T3 + 0 
2980 : 99 54 43 STA $4354,y ; (cbuffer[0] + 0)
2983 : 8a __ __ TXA
2984 : a6 49 __ LDX T4 + 0 
2986 : 9d 53 43 STA $4353,x ; (ncities + 0)
2989 : c6 49 __ DEC T4 + 0 
298b : e6 47 __ INC T3 + 0 
.l82:
298d : 18 __ __ CLC
298e : a5 47 __ LDA T3 + 0 
2990 : 69 01 __ ADC #$01
2992 : c5 49 __ CMP T4 + 0 
2994 : 90 de __ BCC $2974 ; (game_state.s105 + 0)
.s83:
2996 : a2 00 __ LDX #$00
2998 : 86 5c __ STX T13 + 0 
299a : a9 60 __ LDA #$60
299c : 85 5b __ STA T12 + 0 
.l84:
299e : bd e9 1d LDA $1de9,x 
29a1 : 0a __ __ ASL
29a2 : 0a __ __ ASL
29a3 : 85 53 __ STA T0 + 0 
29a5 : a9 00 __ LDA #$00
29a7 : 2a __ __ ROL
29a8 : 06 53 __ ASL T0 + 0 
29aa : 2a __ __ ROL
29ab : aa __ __ TAX
29ac : a9 c3 __ LDA #$c3
29ae : 65 53 __ ADC T0 + 0 
29b0 : 85 53 __ STA T0 + 0 
29b2 : 8a __ __ TXA
29b3 : 69 3e __ ADC #$3e
29b5 : 85 54 __ STA T0 + 1 
29b7 : a0 00 __ LDY #$00
.l85:
29b9 : 84 5d __ STY T14 + 0 
29bb : 98 __ __ TYA
29bc : 18 __ __ CLC
29bd : 69 32 __ ADC #$32
29bf : 0a __ __ ASL
29c0 : aa __ __ TAX
29c1 : 29 07 __ AND #$07
29c3 : 85 49 __ STA T4 + 0 
29c5 : 8a __ __ TXA
29c6 : 29 78 __ AND #$78
29c8 : 85 4b __ STA T5 + 0 
29ca : e8 __ __ INX
29cb : 8a __ __ TXA
29cc : 29 07 __ AND #$07
29ce : 85 4d __ STA T6 + 0 
29d0 : 8a __ __ TXA
29d1 : 29 78 __ AND #$78
29d3 : 85 45 __ STA T2 + 0 
29d5 : a9 00 __ LDA #$00
29d7 : 85 5e __ STA T15 + 0 
29d9 : b1 53 __ LDA (T0 + 0),y 
29db : 85 47 __ STA T3 + 0 
29dd : 30 11 __ BMI $29f0 ; (game_state.l104 + 0)
.l87:
29df : e6 5e __ INC T15 + 0 
29e1 : a5 5e __ LDA T15 + 0 
29e3 : c9 08 __ CMP #$08
29e5 : 90 03 __ BCC $29ea ; (game_state.s86 + 0)
29e7 : 4c 7b 2a JMP $2a7b ; (game_state.s88 + 0)
.s86:
29ea : 06 47 __ ASL T3 + 0 
29ec : 24 47 __ BIT T3 + 0 
29ee : 10 ef __ BPL $29df ; (game_state.l87 + 0)
.l104:
29f0 : a5 5e __ LDA T15 + 0 
29f2 : 0a __ __ ASL
29f3 : 18 __ __ CLC
29f4 : 65 5b __ ADC T12 + 0 
29f6 : 85 4f __ STA T7 + 0 
29f8 : 29 f8 __ AND #$f8
29fa : 85 51 __ STA T8 + 0 
29fc : 05 49 __ ORA T4 + 0 
29fe : 85 55 __ STA T9 + 0 
2a00 : a9 00 __ LDA #$00
2a02 : 85 1c __ STA ACCU + 1 
2a04 : 2a __ __ ROL
2a05 : 85 50 __ STA T7 + 1 
2a07 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
2a0a : 85 1b __ STA ACCU + 0 
2a0c : a5 4b __ LDA T5 + 0 
2a0e : 20 16 38 JSR $3816 ; (mul16by8 + 0)
2a11 : ad fd 42 LDA $42fd ; (sbm.data + 0)
2a14 : 18 __ __ CLC
2a15 : 65 1b __ ADC ACCU + 0 
2a17 : a8 __ __ TAY
2a18 : ad fe 42 LDA $42fe ; (sbm.data + 1)
2a1b : 65 1c __ ADC ACCU + 1 
2a1d : aa __ __ TAX
2a1e : 98 __ __ TYA
2a1f : 18 __ __ CLC
2a20 : 65 55 __ ADC T9 + 0 
2a22 : 85 59 __ STA T11 + 0 
2a24 : 8a __ __ TXA
2a25 : 65 50 __ ADC T7 + 1 
2a27 : 85 5a __ STA T11 + 1 
2a29 : ad db 41 LDA $41db ; (cbytes[0] + 3)
2a2c : a0 00 __ LDY #$00
2a2e : 84 1c __ STY ACCU + 1 
2a30 : 51 59 __ EOR (T11 + 0),y 
2a32 : 85 55 __ STA T9 + 0 
2a34 : a5 4f __ LDA T7 + 0 
2a36 : 29 07 __ AND #$07
2a38 : 85 4f __ STA T7 + 0 
2a3a : aa __ __ TAX
2a3b : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
2a3e : 25 55 __ AND T9 + 0 
2a40 : 4d db 41 EOR $41db ; (cbytes[0] + 3)
2a43 : 91 59 __ STA (T11 + 0),y 
2a45 : a5 4d __ LDA T6 + 0 
2a47 : 05 51 __ ORA T8 + 0 
2a49 : 85 51 __ STA T8 + 0 
2a4b : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
2a4e : 85 1b __ STA ACCU + 0 
2a50 : a5 45 __ LDA T2 + 0 
2a52 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
2a55 : ad fd 42 LDA $42fd ; (sbm.data + 0)
2a58 : 18 __ __ CLC
2a59 : 65 1b __ ADC ACCU + 0 
2a5b : 85 57 __ STA T10 + 0 
2a5d : ad fe 42 LDA $42fe ; (sbm.data + 1)
2a60 : 65 1c __ ADC ACCU + 1 
2a62 : 18 __ __ CLC
2a63 : 65 50 __ ADC T7 + 1 
2a65 : 85 58 __ STA T10 + 1 
2a67 : ad db 41 LDA $41db ; (cbytes[0] + 3)
2a6a : a4 51 __ LDY T8 + 0 
2a6c : 51 57 __ EOR (T10 + 0),y 
2a6e : a6 4f __ LDX T7 + 0 
2a70 : 3d dc 41 AND $41dc,x ; (andmask[0] + 0)
2a73 : 4d db 41 EOR $41db ; (cbytes[0] + 3)
2a76 : 91 57 __ STA (T10 + 0),y 
2a78 : 4c df 29 JMP $29df ; (game_state.l87 + 0)
.s88:
2a7b : a4 5d __ LDY T14 + 0 
2a7d : c8 __ __ INY
2a7e : c0 08 __ CPY #$08
2a80 : b0 03 __ BCS $2a85 ; (game_state.s89 + 0)
2a82 : 4c b9 29 JMP $29b9 ; (game_state.l85 + 0)
.s89:
2a85 : a5 5b __ LDA T12 + 0 
2a87 : 69 0f __ ADC #$0f
2a89 : 85 5b __ STA T12 + 0 
2a8b : e6 5c __ INC T13 + 0 
2a8d : a6 5c __ LDX T13 + 0 
2a8f : bd e9 1d LDA $1de9,x 
2a92 : f0 03 __ BEQ $2a97 ; (game_state.s90 + 0)
2a94 : 4c 9e 29 JMP $299e ; (game_state.l84 + 0)
.s90:
2a97 : ad 54 43 LDA $4354 ; (cbuffer[0] + 0)
2a9a : d0 03 __ BNE $2a9f ; (game_state.s96 + 0)
2a9c : 4c a0 2b JMP $2ba0 ; (game_state.s91 + 0)
.s96:
2a9f : a2 00 __ LDX #$00
2aa1 : 86 5b __ STX T12 + 0 
2aa3 : a9 c0 __ LDA #$c0
2aa5 : 85 5c __ STA T13 + 0 
.l97:
2aa7 : bd 54 43 LDA $4354,x ; (cbuffer[0] + 0)
2aaa : 0a __ __ ASL
2aab : 0a __ __ ASL
2aac : 85 53 __ STA T0 + 0 
2aae : a9 00 __ LDA #$00
2ab0 : 2a __ __ ROL
2ab1 : 06 53 __ ASL T0 + 0 
2ab3 : 2a __ __ ROL
2ab4 : aa __ __ TAX
2ab5 : a9 c3 __ LDA #$c3
2ab7 : 65 53 __ ADC T0 + 0 
2ab9 : 85 53 __ STA T0 + 0 
2abb : 8a __ __ TXA
2abc : 69 3e __ ADC #$3e
2abe : 85 54 __ STA T0 + 1 
2ac0 : a0 00 __ LDY #$00
.l98:
2ac2 : 84 5d __ STY T14 + 0 
2ac4 : 98 __ __ TYA
2ac5 : 18 __ __ CLC
2ac6 : 69 32 __ ADC #$32
2ac8 : 0a __ __ ASL
2ac9 : aa __ __ TAX
2aca : 29 07 __ AND #$07
2acc : 85 49 __ STA T4 + 0 
2ace : 8a __ __ TXA
2acf : 29 78 __ AND #$78
2ad1 : 85 4b __ STA T5 + 0 
2ad3 : e8 __ __ INX
2ad4 : 8a __ __ TXA
2ad5 : 29 07 __ AND #$07
2ad7 : 85 4d __ STA T6 + 0 
2ad9 : 8a __ __ TXA
2ada : 29 78 __ AND #$78
2adc : 85 45 __ STA T2 + 0 
2ade : a9 00 __ LDA #$00
2ae0 : 85 5e __ STA T15 + 0 
2ae2 : b1 53 __ LDA (T0 + 0),y 
2ae4 : 85 47 __ STA T3 + 0 
2ae6 : 30 11 __ BMI $2af9 ; (game_state.l103 + 0)
.l100:
2ae8 : e6 5e __ INC T15 + 0 
2aea : a5 5e __ LDA T15 + 0 
2aec : c9 08 __ CMP #$08
2aee : 90 03 __ BCC $2af3 ; (game_state.s99 + 0)
2af0 : 4c 84 2b JMP $2b84 ; (game_state.s101 + 0)
.s99:
2af3 : 06 47 __ ASL T3 + 0 
2af5 : 24 47 __ BIT T3 + 0 
2af7 : 10 ef __ BPL $2ae8 ; (game_state.l100 + 0)
.l103:
2af9 : a5 5e __ LDA T15 + 0 
2afb : 0a __ __ ASL
2afc : 18 __ __ CLC
2afd : 65 5c __ ADC T13 + 0 
2aff : 85 4f __ STA T7 + 0 
2b01 : 29 f8 __ AND #$f8
2b03 : 85 51 __ STA T8 + 0 
2b05 : 05 49 __ ORA T4 + 0 
2b07 : 85 55 __ STA T9 + 0 
2b09 : a9 00 __ LDA #$00
2b0b : 85 1c __ STA ACCU + 1 
2b0d : 2a __ __ ROL
2b0e : 85 50 __ STA T7 + 1 
2b10 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
2b13 : 85 1b __ STA ACCU + 0 
2b15 : a5 4b __ LDA T5 + 0 
2b17 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
2b1a : ad fd 42 LDA $42fd ; (sbm.data + 0)
2b1d : 18 __ __ CLC
2b1e : 65 1b __ ADC ACCU + 0 
2b20 : a8 __ __ TAY
2b21 : ad fe 42 LDA $42fe ; (sbm.data + 1)
2b24 : 65 1c __ ADC ACCU + 1 
2b26 : aa __ __ TAX
2b27 : 98 __ __ TYA
2b28 : 18 __ __ CLC
2b29 : 65 55 __ ADC T9 + 0 
2b2b : 85 59 __ STA T11 + 0 
2b2d : 8a __ __ TXA
2b2e : 65 50 __ ADC T7 + 1 
2b30 : 85 5a __ STA T11 + 1 
2b32 : ad db 41 LDA $41db ; (cbytes[0] + 3)
2b35 : a0 00 __ LDY #$00
2b37 : 84 1c __ STY ACCU + 1 
2b39 : 51 59 __ EOR (T11 + 0),y 
2b3b : 85 55 __ STA T9 + 0 
2b3d : a5 4f __ LDA T7 + 0 
2b3f : 29 07 __ AND #$07
2b41 : 85 4f __ STA T7 + 0 
2b43 : aa __ __ TAX
2b44 : bd dc 41 LDA $41dc,x ; (andmask[0] + 0)
2b47 : 25 55 __ AND T9 + 0 
2b49 : 4d db 41 EOR $41db ; (cbytes[0] + 3)
2b4c : 91 59 __ STA (T11 + 0),y 
2b4e : a5 4d __ LDA T6 + 0 
2b50 : 05 51 __ ORA T8 + 0 
2b52 : 85 51 __ STA T8 + 0 
2b54 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
2b57 : 85 1b __ STA ACCU + 0 
2b59 : a5 45 __ LDA T2 + 0 
2b5b : 20 16 38 JSR $3816 ; (mul16by8 + 0)
2b5e : ad fd 42 LDA $42fd ; (sbm.data + 0)
2b61 : 18 __ __ CLC
2b62 : 65 1b __ ADC ACCU + 0 
2b64 : 85 57 __ STA T10 + 0 
2b66 : ad fe 42 LDA $42fe ; (sbm.data + 1)
2b69 : 65 1c __ ADC ACCU + 1 
2b6b : 18 __ __ CLC
2b6c : 65 50 __ ADC T7 + 1 
2b6e : 85 58 __ STA T10 + 1 
2b70 : ad db 41 LDA $41db ; (cbytes[0] + 3)
2b73 : a4 51 __ LDY T8 + 0 
2b75 : 51 57 __ EOR (T10 + 0),y 
2b77 : a6 4f __ LDX T7 + 0 
2b79 : 3d dc 41 AND $41dc,x ; (andmask[0] + 0)
2b7c : 4d db 41 EOR $41db ; (cbytes[0] + 3)
2b7f : 91 57 __ STA (T10 + 0),y 
2b81 : 4c e8 2a JMP $2ae8 ; (game_state.l100 + 0)
.s101:
2b84 : a4 5d __ LDY T14 + 0 
2b86 : c8 __ __ INY
2b87 : c0 08 __ CPY #$08
2b89 : b0 03 __ BCS $2b8e ; (game_state.s102 + 0)
2b8b : 4c c2 2a JMP $2ac2 ; (game_state.l98 + 0)
.s102:
2b8e : a5 5c __ LDA T13 + 0 
2b90 : 69 0f __ ADC #$0f
2b92 : 85 5c __ STA T13 + 0 
2b94 : e6 5b __ INC T12 + 0 
2b96 : a6 5b __ LDX T12 + 0 
2b98 : bd 54 43 LDA $4354,x ; (cbuffer[0] + 0)
2b9b : f0 03 __ BEQ $2ba0 ; (game_state.s91 + 0)
2b9d : 4c a7 2a JMP $2aa7 ; (game_state.l97 + 0)
.s91:
2ba0 : a5 43 __ LDA T1 + 0 
2ba2 : 05 44 __ ORA T1 + 1 
2ba4 : d0 03 __ BNE $2ba9 ; (game_state.s92 + 0)
2ba6 : 4c 01 29 JMP $2901 ; (game_state.s70 + 0)
.s92:
2ba9 : a9 09 __ LDA #$09
2bab : 85 49 __ STA T4 + 0 
.l93:
2bad : a5 43 __ LDA T1 + 0 
2baf : 85 1b __ STA ACCU + 0 
2bb1 : a5 44 __ LDA T1 + 1 
2bb3 : 85 1c __ STA ACCU + 1 
2bb5 : 20 84 38 JSR $3884 ; (divmod@proxy + 0)
2bb8 : a5 1b __ LDA ACCU + 0 
2bba : 85 43 __ STA T1 + 0 
2bbc : a5 1c __ LDA ACCU + 1 
2bbe : 85 44 __ STA T1 + 1 
2bc0 : a4 49 __ LDY T4 + 0 
2bc2 : b9 00 c8 LDA $c800,y 
2bc5 : 18 __ __ CLC
2bc6 : 65 05 __ ADC WORK + 2 
2bc8 : c9 3a __ CMP #$3a
2bca : 90 11 __ BCC $2bdd ; (game_state.s94 + 0)
.s95:
2bcc : aa __ __ TAX
2bcd : a5 1b __ LDA ACCU + 0 
2bcf : 69 00 __ ADC #$00
2bd1 : 85 43 __ STA T1 + 0 
2bd3 : a5 1c __ LDA ACCU + 1 
2bd5 : 69 00 __ ADC #$00
2bd7 : 85 44 __ STA T1 + 1 
2bd9 : 8a __ __ TXA
2bda : 38 __ __ SEC
2bdb : e9 0a __ SBC #$0a
.s94:
2bdd : 99 00 c8 STA $c800,y 
2be0 : c6 49 __ DEC T4 + 0 
2be2 : a5 43 __ LDA T1 + 0 
2be4 : 05 44 __ ORA T1 + 1 
2be6 : d0 c5 __ BNE $2bad ; (game_state.l93 + 0)
2be8 : 4c 01 29 JMP $2901 ; (game_state.s70 + 0)
--------------------------------------------------------------------
bmu_bitblit: ; bmu_bitblit(const struct Bitmap*,i16,i16,const struct Bitmap*,i16,i16,i16,i16,const u8*,enum BlitOp)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/gfx/bitmap.h"
.s4:
2beb : a5 0f __ LDA P2 ; (dy + 0)
2bed : 29 f8 __ AND #$f8
2bef : 85 1b __ STA ACCU + 0 
2bf1 : a5 10 __ LDA P3 ; (dy + 1)
2bf3 : 85 1c __ STA ACCU + 1 
2bf5 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
2bf8 : 85 46 __ STA T2 + 0 
2bfa : 20 16 38 JSR $3816 ; (mul16by8 + 0)
2bfd : ad fd 42 LDA $42fd ; (sbm.data + 0)
2c00 : 18 __ __ CLC
2c01 : 65 1b __ ADC ACCU + 0 
2c03 : 85 48 __ STA T3 + 0 
2c05 : ad fe 42 LDA $42fe ; (sbm.data + 1)
2c08 : 65 1c __ ADC ACCU + 1 
2c0a : aa __ __ TAX
2c0b : a5 0d __ LDA P0 ; (dx + 0)
2c0d : 85 45 __ STA T1 + 0 
2c0f : 29 f8 __ AND #$f8
2c11 : 18 __ __ CLC
2c12 : 65 48 __ ADC T3 + 0 
2c14 : 85 48 __ STA T3 + 0 
2c16 : 8a __ __ TXA
2c17 : 65 0e __ ADC P1 ; (dx + 1)
2c19 : aa __ __ TAX
2c1a : a5 0f __ LDA P2 ; (dy + 0)
2c1c : 29 07 __ AND #$07
2c1e : 18 __ __ CLC
2c1f : 65 48 __ ADC T3 + 0 
2c21 : 85 48 __ STA T3 + 0 
2c23 : 90 02 __ BCC $2c27 ; (bmu_bitblit.s36 + 0)
.s35:
2c25 : e8 __ __ INX
2c26 : 18 __ __ CLC
.s36:
2c27 : 86 49 __ STX T3 + 1 
2c29 : a5 0d __ LDA P0 ; (dx + 0)
2c2b : 29 07 __ AND #$07
2c2d : 85 4b __ STA T5 + 0 
2c2f : aa __ __ TAX
2c30 : bd c8 41 LDA $41c8,x ; (lmask[0] + 0)
2c33 : 85 4d __ STA T6 + 0 
2c35 : a5 15 __ LDA P8 ; (w + 0)
2c37 : 65 0d __ ADC P0 ; (dx + 0)
2c39 : 85 43 __ STA T0 + 0 
2c3b : a5 16 __ LDA P9 ; (w + 1)
2c3d : 65 0e __ ADC P1 ; (dx + 1)
2c3f : aa __ __ TAX
2c40 : a5 43 __ LDA T0 + 0 
2c42 : 29 07 __ AND #$07
2c44 : a8 __ __ TAY
2c45 : b9 d0 41 LDA $41d0,y ; (rmask[0] + 0)
2c48 : 85 4e __ STA T7 + 0 
2c4a : a5 11 __ LDA P4 ; (sx + 0)
2c4c : 29 07 __ AND #$07
2c4e : 49 ff __ EOR #$ff
2c50 : 38 __ __ SEC
2c51 : 65 4b __ ADC T5 + 0 
2c53 : a8 __ __ TAY
2c54 : a9 00 __ LDA #$00
2c56 : 85 4f __ STA T8 + 0 
2c58 : a5 0e __ LDA P1 ; (dx + 1)
2c5a : 4a __ __ LSR
2c5b : 66 45 __ ROR T1 + 0 
2c5d : 4a __ __ LSR
2c5e : 66 45 __ ROR T1 + 0 
2c60 : 4a __ __ LSR
2c61 : 66 45 __ ROR T1 + 0 
2c63 : 8a __ __ TXA
2c64 : 4a __ __ LSR
2c65 : 66 43 __ ROR T0 + 0 
2c67 : 4a __ __ LSR
2c68 : 66 43 __ ROR T0 + 0 
2c6a : 4a __ __ LSR
2c6b : a5 43 __ LDA T0 + 0 
2c6d : 6a __ __ ROR
2c6e : 38 __ __ SEC
2c6f : e5 45 __ SBC T1 + 0 
2c71 : 85 43 __ STA T0 + 0 
2c73 : d0 06 __ BNE $2c7b ; (bmu_bitblit.s6 + 0)
.s5:
2c75 : a5 4e __ LDA T7 + 0 
2c77 : 25 4d __ AND T6 + 0 
2c79 : 85 4d __ STA T6 + 0 
.s6:
2c7b : 98 __ __ TYA
2c7c : 29 07 __ AND #$07
2c7e : 85 1b __ STA ACCU + 0 
2c80 : a9 a0 __ LDA #$a0
2c82 : 8d 00 44 STA $4400 ; (BLIT_CODE[0] + 0)
2c85 : a9 00 __ LDA #$00
2c87 : 8d 01 44 STA $4401 ; (BLIT_CODE[0] + 1)
2c8a : a6 4d __ LDX T6 + 0 
2c8c : e8 __ __ INX
2c8d : d0 03 __ BNE $2c92 ; (bmu_bitblit.s7 + 0)
2c8f : 4c 9e 2e JMP $2e9e ; (bmu_bitblit.s33 + 0)
.s7:
2c92 : a9 a5 __ LDA #$a5
2c94 : 8d 02 44 STA $4402 ; (BLIT_CODE[0] + 2)
2c97 : a9 07 __ LDA #$07
2c99 : 8d 03 44 STA $4403 ; (BLIT_CODE[0] + 3)
2c9c : a5 4d __ LDA T6 + 0 
2c9e : 49 ff __ EOR #$ff
2ca0 : d0 19 __ BNE $2cbb ; (bmu_bitblit.s32 + 0)
.s8:
2ca2 : a9 91 __ LDA #$91
2ca4 : 8d 04 44 STA $4404 ; (BLIT_CODE[0] + 4)
2ca7 : a9 05 __ LDA #$05
2ca9 : 8d 05 44 STA $4405 ; (BLIT_CODE[0] + 5)
2cac : a9 04 __ LDA #$04
2cae : 85 4a __ STA T4 + 0 
2cb0 : a9 06 __ LDA #$06
2cb2 : 85 45 __ STA T1 + 0 
2cb4 : a9 44 __ LDA #$44
2cb6 : a2 04 __ LDX #$04
2cb8 : 4c f3 2c JMP $2cf3 ; (bmu_bitblit.s9 + 0)
.s32:
2cbb : 8d 09 44 STA $4409 ; (BLIT_CODE[0] + 9)
2cbe : a9 09 __ LDA #$09
2cc0 : 8d 05 44 STA $4405 ; (BLIT_CODE[0] + 5)
2cc3 : 8d 0b 44 STA $440b ; (BLIT_CODE[0] + 11)
2cc6 : a9 85 __ LDA #$85
2cc8 : 8d 04 44 STA $4404 ; (BLIT_CODE[0] + 4)
2ccb : a9 05 __ LDA #$05
2ccd : 8d 07 44 STA $4407 ; (BLIT_CODE[0] + 7)
2cd0 : 8d 0d 44 STA $440d ; (BLIT_CODE[0] + 13)
2cd3 : a9 51 __ LDA #$51
2cd5 : 8d 06 44 STA $4406 ; (BLIT_CODE[0] + 6)
2cd8 : a9 29 __ LDA #$29
2cda : 8d 08 44 STA $4408 ; (BLIT_CODE[0] + 8)
2cdd : a9 45 __ LDA #$45
2cdf : 8d 0a 44 STA $440a ; (BLIT_CODE[0] + 10)
2ce2 : a9 91 __ LDA #$91
2ce4 : 8d 0c 44 STA $440c ; (BLIT_CODE[0] + 12)
2ce7 : a9 0c __ LDA #$0c
2ce9 : 85 4a __ STA T4 + 0 
2ceb : a9 0e __ LDA #$0e
2ced : 85 45 __ STA T1 + 0 
2cef : a9 44 __ LDA #$44
2cf1 : a2 0c __ LDX #$0c
.s9:
2cf3 : 85 4c __ STA T5 + 1 
2cf5 : a5 43 __ LDA T0 + 0 
2cf7 : d0 03 __ BNE $2cfc ; (bmu_bitblit.s14 + 0)
2cf9 : 4c 3e 2e JMP $2e3e ; (bmu_bitblit.s10 + 0)
.s14:
2cfc : 86 4b __ STX T5 + 0 
2cfe : a9 a0 __ LDA #$a0
2d00 : a0 02 __ LDY #$02
2d02 : 91 4b __ STA (T5 + 0),y 
2d04 : a9 08 __ LDA #$08
2d06 : 85 4f __ STA T8 + 0 
2d08 : c8 __ __ INY
2d09 : 91 4b __ STA (T5 + 0),y 
2d0b : 18 __ __ CLC
2d0c : a5 4a __ LDA T4 + 0 
2d0e : 69 04 __ ADC #$04
2d10 : 85 45 __ STA T1 + 0 
.s15:
2d12 : a5 43 __ LDA T0 + 0 
2d14 : c9 02 __ CMP #$02
2d16 : b0 03 __ BCS $2d1b ; (bmu_bitblit.s20 + 0)
2d18 : 4c ed 2d JMP $2ded ; (bmu_bitblit.s16 + 0)
.s20:
2d1b : a9 02 __ LDA #$02
2d1d : c5 43 __ CMP T0 + 0 
2d1f : a9 00 __ LDA #$00
2d21 : 6a __ __ ROR
2d22 : 85 4d __ STA T6 + 0 
2d24 : d0 19 __ BNE $2d3f ; (bmu_bitblit.s21 + 0)
.s31:
2d26 : a9 a2 __ LDA #$a2
2d28 : a6 45 __ LDX T1 + 0 
2d2a : e8 __ __ INX
2d2b : e8 __ __ INX
2d2c : 86 45 __ STX T1 + 0 
2d2e : 9d fe 43 STA $43fe,x 
2d31 : 38 __ __ SEC
2d32 : a5 43 __ LDA T0 + 0 
2d34 : e9 01 __ SBC #$01
2d36 : 9d ff 43 STA $43ff,x 
2d39 : a5 43 __ LDA T0 + 0 
2d3b : c9 20 __ CMP #$20
2d3d : b0 0d __ BCS $2d4c ; (bmu_bitblit.s23 + 0)
.s21:
2d3f : a5 1b __ LDA ACCU + 0 
2d41 : d0 09 __ BNE $2d4c ; (bmu_bitblit.s23 + 0)
.s22:
2d43 : a9 18 __ LDA #$18
2d45 : a6 45 __ LDX T1 + 0 
2d47 : 9d 00 44 STA $4400,x ; (BLIT_CODE[0] + 0)
2d4a : e6 45 __ INC T1 + 0 
.s23:
2d4c : a9 a5 __ LDA #$a5
2d4e : a4 45 __ LDY T1 + 0 
2d50 : 99 00 44 STA $4400,y ; (BLIT_CODE[0] + 0)
2d53 : a9 07 __ LDA #$07
2d55 : 99 01 44 STA $4401,y ; (BLIT_CODE[0] + 1)
2d58 : a9 91 __ LDA #$91
2d5a : 99 02 44 STA $4402,y ; (BLIT_CODE[0] + 2)
2d5d : a9 05 __ LDA #$05
2d5f : 99 03 44 STA $4403,y ; (BLIT_CODE[0] + 3)
2d62 : 24 4d __ BIT T6 + 0 
2d64 : 10 16 __ BPL $2d7c ; (bmu_bitblit.s25 + 0)
.s24:
2d66 : a9 a0 __ LDA #$a0
2d68 : 99 04 44 STA $4404,y ; (BLIT_CODE[0] + 4)
2d6b : 18 __ __ CLC
2d6c : a5 4f __ LDA T8 + 0 
2d6e : 69 08 __ ADC #$08
2d70 : 99 05 44 STA $4405,y ; (BLIT_CODE[0] + 5)
2d73 : 98 __ __ TYA
2d74 : 18 __ __ CLC
2d75 : 69 06 __ ADC #$06
2d77 : 85 45 __ STA T1 + 0 
2d79 : 4c ed 2d JMP $2ded ; (bmu_bitblit.s16 + 0)
.s25:
2d7c : a9 1f __ LDA #$1f
2d7e : c5 43 __ CMP T0 + 0 
2d80 : a9 00 __ LDA #$00
2d82 : 6a __ __ ROR
2d83 : 85 4d __ STA T6 + 0 
2d85 : f0 08 __ BEQ $2d8f ; (bmu_bitblit.s30 + 0)
.s26:
2d87 : 98 __ __ TYA
2d88 : 69 04 __ ADC #$04
2d8a : aa __ __ TAX
2d8b : a5 1b __ LDA ACCU + 0 
2d8d : f0 0a __ BEQ $2d99 ; (bmu_bitblit.s27 + 0)
.s30:
2d8f : a9 18 __ LDA #$18
2d91 : 99 04 44 STA $4404,y ; (BLIT_CODE[0] + 4)
2d94 : 98 __ __ TYA
2d95 : 18 __ __ CLC
2d96 : 69 05 __ ADC #$05
2d98 : aa __ __ TAX
.s27:
2d99 : a9 98 __ LDA #$98
2d9b : 9d 00 44 STA $4400,x ; (BLIT_CODE[0] + 0)
2d9e : a9 69 __ LDA #$69
2da0 : 9d 01 44 STA $4401,x ; (BLIT_CODE[0] + 1)
2da3 : a9 08 __ LDA #$08
2da5 : 9d 02 44 STA $4402,x ; (BLIT_CODE[0] + 2)
2da8 : a9 a8 __ LDA #$a8
2daa : 9d 03 44 STA $4403,x ; (BLIT_CODE[0] + 3)
2dad : 8a __ __ TXA
2dae : 18 __ __ CLC
2daf : 69 04 __ ADC #$04
2db1 : 24 4d __ BIT T6 + 0 
2db3 : 30 19 __ BMI $2dce ; (bmu_bitblit.s28 + 0)
.s29:
2db5 : a8 __ __ TAY
2db6 : a9 90 __ LDA #$90
2db8 : 9d 04 44 STA $4404,x ; (BLIT_CODE[0] + 4)
2dbb : a9 02 __ LDA #$02
2dbd : 9d 05 44 STA $4405,x ; (BLIT_CODE[0] + 5)
2dc0 : a9 e6 __ LDA #$e6
2dc2 : 9d 06 44 STA $4406,x ; (BLIT_CODE[0] + 6)
2dc5 : a9 06 __ LDA #$06
2dc7 : 9d 07 44 STA $4407,x ; (BLIT_CODE[0] + 7)
2dca : 98 __ __ TYA
2dcb : 18 __ __ CLC
2dcc : 69 04 __ ADC #$04
.s28:
2dce : a8 __ __ TAY
2dcf : a9 ca __ LDA #$ca
2dd1 : 99 00 44 STA $4400,y ; (BLIT_CODE[0] + 0)
2dd4 : a9 d0 __ LDA #$d0
2dd6 : 99 01 44 STA $4401,y ; (BLIT_CODE[0] + 1)
2dd9 : 98 __ __ TYA
2dda : 18 __ __ CLC
2ddb : 69 01 __ ADC #$01
2ddd : aa __ __ TAX
2dde : 49 ff __ EOR #$ff
2de0 : 38 __ __ SEC
2de1 : 65 45 __ ADC T1 + 0 
2de3 : e8 __ __ INX
2de4 : e8 __ __ INX
2de5 : 86 45 __ STX T1 + 0 
2de7 : 38 __ __ SEC
2de8 : e9 02 __ SBC #$02
2dea : 99 02 44 STA $4402,y ; (BLIT_CODE[0] + 2)
.s16:
2ded : a5 4e __ LDA T7 + 0 
2def : f0 4d __ BEQ $2e3e ; (bmu_bitblit.s10 + 0)
.s17:
2df1 : a9 a5 __ LDA #$a5
2df3 : a4 45 __ LDY T1 + 0 
2df5 : 99 00 44 STA $4400,y ; (BLIT_CODE[0] + 0)
2df8 : a9 07 __ LDA #$07
2dfa : 99 01 44 STA $4401,y ; (BLIT_CODE[0] + 1)
2dfd : a9 ff __ LDA #$ff
2dff : a6 45 __ LDX T1 + 0 
2e01 : e8 __ __ INX
2e02 : e8 __ __ INX
2e03 : 45 4e __ EOR T7 + 0 
2e05 : f0 29 __ BEQ $2e30 ; (bmu_bitblit.s18 + 0)
.s19:
2e07 : 99 07 44 STA $4407,y ; (BLIT_CODE[0] + 7)
2e0a : a9 85 __ LDA #$85
2e0c : 99 02 44 STA $4402,y ; (BLIT_CODE[0] + 2)
2e0f : a9 09 __ LDA #$09
2e11 : 99 03 44 STA $4403,y ; (BLIT_CODE[0] + 3)
2e14 : 99 09 44 STA $4409,y ; (BLIT_CODE[0] + 9)
2e17 : a9 51 __ LDA #$51
2e19 : 99 04 44 STA $4404,y ; (BLIT_CODE[0] + 4)
2e1c : a9 05 __ LDA #$05
2e1e : 99 05 44 STA $4405,y ; (BLIT_CODE[0] + 5)
2e21 : a9 29 __ LDA #$29
2e23 : 99 06 44 STA $4406,y ; (BLIT_CODE[0] + 6)
2e26 : a9 45 __ LDA #$45
2e28 : 99 08 44 STA $4408,y ; (BLIT_CODE[0] + 8)
2e2b : 8a __ __ TXA
2e2c : 18 __ __ CLC
2e2d : 69 08 __ ADC #$08
2e2f : aa __ __ TAX
.s18:
2e30 : e8 __ __ INX
2e31 : e8 __ __ INX
2e32 : 86 45 __ STX T1 + 0 
2e34 : a9 91 __ LDA #$91
2e36 : 9d fe 43 STA $43fe,x 
2e39 : a9 05 __ LDA #$05
2e3b : 9d ff 43 STA $43ff,x 
.s10:
2e3e : a9 60 __ LDA #$60
2e40 : a6 45 __ LDX T1 + 0 
2e42 : 9d 00 44 STA $4400,x ; (BLIT_CODE[0] + 0)
2e45 : 18 __ __ CLC
2e46 : a5 46 __ LDA T2 + 0 
2e48 : 69 ff __ ADC #$ff
2e4a : 2a __ __ ROL
2e4b : 2a __ __ ROL
2e4c : 2a __ __ ROL
2e4d : aa __ __ TAX
2e4e : 29 f8 __ AND #$f8
2e50 : 85 46 __ STA T2 + 0 
2e52 : 8a __ __ TXA
2e53 : 29 07 __ AND #$07
2e55 : 2a __ __ ROL
2e56 : 69 f8 __ ADC #$f8
2e58 : 85 47 __ STA T2 + 1 
2e5a : ad eb c7 LDA $c7eb ; (sstack + 0)
2e5d : 85 43 __ STA T0 + 0 
2e5f : ad ec c7 LDA $c7ec ; (sstack + 1)
2e62 : 85 44 __ STA T0 + 1 
2e64 : a5 17 __ LDA P10 ; (h + 0)
2e66 : 85 45 __ STA T1 + 0 
2e68 : f0 33 __ BEQ $2e9d ; (bmu_bitblit.s3 + 0)
.l11:
2e6a : a5 48 __ LDA T3 + 0 
2e6c : 85 05 __ STA WORK + 2 
2e6e : 85 03 __ STA WORK + 0 
2e70 : 29 07 __ AND #$07
2e72 : a8 __ __ TAY
2e73 : a5 49 __ LDA T3 + 1 
2e75 : 85 06 __ STA WORK + 3 
2e77 : 85 04 __ STA WORK + 1 
2e79 : b1 43 __ LDA (T0 + 0),y 
2e7b : 85 07 __ STA WORK + 4 
2e7d : 20 00 44 JSR $4400 ; (BLIT_CODE[0] + 0)
2e80 : e6 48 __ INC T3 + 0 
2e82 : d0 02 __ BNE $2e86 ; (bmu_bitblit.s38 + 0)
.s37:
2e84 : e6 49 __ INC T3 + 1 
.s38:
2e86 : a5 48 __ LDA T3 + 0 
2e88 : 29 07 __ AND #$07
2e8a : d0 0d __ BNE $2e99 ; (bmu_bitblit.s12 + 0)
.s13:
2e8c : 18 __ __ CLC
2e8d : a5 48 __ LDA T3 + 0 
2e8f : 65 46 __ ADC T2 + 0 
2e91 : 85 48 __ STA T3 + 0 
2e93 : a5 49 __ LDA T3 + 1 
2e95 : 65 47 __ ADC T2 + 1 
2e97 : 85 49 __ STA T3 + 1 
.s12:
2e99 : c6 45 __ DEC T1 + 0 
2e9b : d0 cd __ BNE $2e6a ; (bmu_bitblit.l11 + 0)
.s3:
2e9d : 60 __ __ RTS
.s33:
2e9e : a9 02 __ LDA #$02
2ea0 : 85 45 __ STA T1 + 0 
2ea2 : e6 43 __ INC T0 + 0 
2ea4 : f0 98 __ BEQ $2e3e ; (bmu_bitblit.s10 + 0)
2ea6 : 4c 12 2d JMP $2d12 ; (bmu_bitblit.s15 + 0)
--------------------------------------------------------------------
bmmc_quad_fill: ; bmmc_quad_fill(const struct Bitmap*,const struct ClipRect*,i16,i16,i16,i16,i16,i16,i16,i16,const u8*)->void
;  43, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
2ea9 : a2 09 __ LDX #$09
2eab : b5 53 __ LDA T0 + 0,x 
2ead : 9d cb c7 STA $c7cb,x ; (bmmc_quad_fill@stack + 0)
2eb0 : ca __ __ DEX
2eb1 : 10 f8 __ BPL $2eab ; (bmmc_quad_fill.s1 + 2)
.s4:
2eb3 : ad f5 c7 LDA $c7f5 ; (sstack + 10)
2eb6 : 38 __ __ SEC
2eb7 : ed f7 c7 SBC $c7f7 ; (sstack + 12)
2eba : 85 1d __ STA ACCU + 2 
2ebc : a9 b8 __ LDA #$b8
2ebe : 8d ef c7 STA $c7ef ; (sstack + 4)
2ec1 : ad f6 c7 LDA $c7f6 ; (sstack + 11)
2ec4 : ed f8 c7 SBC $c7f8 ; (sstack + 13)
2ec7 : 85 1e __ STA ACCU + 3 
2ec9 : a9 00 __ LDA #$00
2ecb : 8d f0 c7 STA $c7f0 ; (sstack + 5)
2ece : 85 1b __ STA ACCU + 0 
2ed0 : 85 1c __ STA ACCU + 1 
2ed2 : 85 04 __ STA WORK + 1 
2ed4 : 85 05 __ STA WORK + 2 
2ed6 : 85 06 __ STA WORK + 3 
2ed8 : 20 f7 1d JSR $1df7 ; (divs32@proxy + 0)
2edb : a5 1b __ LDA ACCU + 0 
2edd : 85 53 __ STA T0 + 0 
2edf : 85 15 __ STA P8 
2ee1 : a5 1c __ LDA ACCU + 1 
2ee3 : 85 54 __ STA T0 + 1 
2ee5 : 85 16 __ STA P9 
2ee7 : a5 1d __ LDA ACCU + 2 
2ee9 : 85 55 __ STA T0 + 2 
2eeb : 85 17 __ STA P10 
2eed : a5 1e __ LDA ACCU + 3 
2eef : 85 56 __ STA T0 + 3 
2ef1 : 85 18 __ STA P11 
2ef3 : ad f9 c7 LDA $c7f9 ; (sstack + 14)
2ef6 : 85 5b __ STA T5 + 0 
2ef8 : ad fa c7 LDA $c7fa ; (sstack + 15)
2efb : 85 5c __ STA T5 + 1 
2efd : ad f5 c7 LDA $c7f5 ; (sstack + 10)
2f00 : 38 __ __ SEC
2f01 : e5 5b __ SBC T5 + 0 
2f03 : 85 1d __ STA ACCU + 2 
2f05 : ad f6 c7 LDA $c7f6 ; (sstack + 11)
2f08 : e5 5c __ SBC T5 + 1 
2f0a : 85 1e __ STA ACCU + 3 
2f0c : a9 00 __ LDA #$00
2f0e : 85 1b __ STA ACCU + 0 
2f10 : 85 1c __ STA ACCU + 1 
2f12 : 85 04 __ STA WORK + 1 
2f14 : 85 05 __ STA WORK + 2 
2f16 : 85 06 __ STA WORK + 3 
2f18 : 20 f7 1d JSR $1df7 ; (divs32@proxy + 0)
2f1b : a5 1b __ LDA ACCU + 0 
2f1d : 85 57 __ STA T2 + 0 
2f1f : a5 1c __ LDA ACCU + 1 
2f21 : 85 58 __ STA T2 + 1 
2f23 : a5 1d __ LDA ACCU + 2 
2f25 : 85 59 __ STA T2 + 2 
2f27 : a5 1e __ LDA ACCU + 3 
2f29 : 85 5a __ STA T2 + 3 
2f2b : ad f8 c7 LDA $c7f8 ; (sstack + 13)
2f2e : c5 5c __ CMP T5 + 1 
2f30 : d0 07 __ BNE $2f39 ; (bmmc_quad_fill.s18 + 0)
.s17:
2f32 : ad f7 c7 LDA $c7f7 ; (sstack + 12)
2f35 : c5 5b __ CMP T5 + 0 
2f37 : f0 31 __ BEQ $2f6a ; (bmmc_quad_fill.s5 + 0)
.s18:
2f39 : b0 2f __ BCS $2f6a ; (bmmc_quad_fill.s5 + 0)
.s16:
2f3b : a9 00 __ LDA #$00
2f3d : 85 0d __ STA P0 
2f3f : 85 0e __ STA P1 
2f41 : 85 11 __ STA P4 
2f43 : 85 12 __ STA P5 
2f45 : ad f7 c7 LDA $c7f7 ; (sstack + 12)
2f48 : 85 0f __ STA P2 
2f4a : ad f8 c7 LDA $c7f8 ; (sstack + 13)
2f4d : 85 10 __ STA P3 
2f4f : a5 5b __ LDA T5 + 0 
2f51 : 85 13 __ STA P6 
2f53 : a5 5c __ LDA T5 + 1 
2f55 : 85 14 __ STA P7 
2f57 : a5 1b __ LDA ACCU + 0 
2f59 : 8d eb c7 STA $c7eb ; (sstack + 0)
2f5c : a5 1c __ LDA ACCU + 1 
2f5e : 8d ec c7 STA $c7ec ; (sstack + 1)
2f61 : a5 1d __ LDA ACCU + 2 
2f63 : 8d ed c7 STA $c7ed ; (sstack + 2)
2f66 : a5 1e __ LDA ACCU + 3 
2f68 : 90 3d __ BCC $2fa7 ; (bmmc_quad_fill.s6 + 0)
.s5:
2f6a : a9 00 __ LDA #$00
2f6c : 85 0d __ STA P0 
2f6e : 85 0e __ STA P1 
2f70 : 85 11 __ STA P4 
2f72 : 85 12 __ STA P5 
2f74 : a5 5b __ LDA T5 + 0 
2f76 : 85 0f __ STA P2 
2f78 : a5 5c __ LDA T5 + 1 
2f7a : 85 10 __ STA P3 
2f7c : ad f7 c7 LDA $c7f7 ; (sstack + 12)
2f7f : 85 13 __ STA P6 
2f81 : ad f8 c7 LDA $c7f8 ; (sstack + 13)
2f84 : 85 14 __ STA P7 
2f86 : a5 1b __ LDA ACCU + 0 
2f88 : 85 15 __ STA P8 
2f8a : a5 1c __ LDA ACCU + 1 
2f8c : 85 16 __ STA P9 
2f8e : a5 1d __ LDA ACCU + 2 
2f90 : 85 17 __ STA P10 
2f92 : a5 1e __ LDA ACCU + 3 
2f94 : 85 18 __ STA P11 
2f96 : a5 53 __ LDA T0 + 0 
2f98 : 8d eb c7 STA $c7eb ; (sstack + 0)
2f9b : a5 54 __ LDA T0 + 1 
2f9d : 8d ec c7 STA $c7ec ; (sstack + 1)
2fa0 : a5 55 __ LDA T0 + 2 
2fa2 : 8d ed c7 STA $c7ed ; (sstack + 2)
2fa5 : a5 56 __ LDA T0 + 3 
.s6:
2fa7 : 8d ee c7 STA $c7ee ; (sstack + 3)
2faa : ad fd c7 LDA $c7fd ; (sstack + 18)
2fad : 85 53 __ STA T0 + 0 
2faf : 8d f3 c7 STA $c7f3 ; (sstack + 8)
2fb2 : a9 c0 __ LDA #$c0
2fb4 : 8d f1 c7 STA $c7f1 ; (sstack + 6)
2fb7 : a9 00 __ LDA #$00
2fb9 : 8d f2 c7 STA $c7f2 ; (sstack + 7)
2fbc : ad fe c7 LDA $c7fe ; (sstack + 19)
2fbf : 85 54 __ STA T0 + 1 
2fc1 : 8d f4 c7 STA $c7f4 ; (sstack + 9)
2fc4 : 20 86 30 JSR $3086 ; (bmmc_trapezoid_fill.s1 + 0)
2fc7 : a5 5b __ LDA T5 + 0 
2fc9 : 85 0f __ STA P2 
2fcb : 85 13 __ STA P6 
2fcd : a5 5c __ LDA T5 + 1 
2fcf : 85 10 __ STA P3 
2fd1 : 85 14 __ STA P7 
2fd3 : a9 00 __ LDA #$00
2fd5 : 8d f0 c7 STA $c7f0 ; (sstack + 5)
2fd8 : 8d f2 c7 STA $c7f2 ; (sstack + 7)
2fdb : a9 b8 __ LDA #$b8
2fdd : 8d ef c7 STA $c7ef ; (sstack + 4)
2fe0 : a9 c0 __ LDA #$c0
2fe2 : 8d f1 c7 STA $c7f1 ; (sstack + 6)
2fe5 : a5 53 __ LDA T0 + 0 
2fe7 : 8d f3 c7 STA $c7f3 ; (sstack + 8)
2fea : a5 54 __ LDA T0 + 1 
2fec : 8d f4 c7 STA $c7f4 ; (sstack + 9)
2fef : ad fb c7 LDA $c7fb ; (sstack + 16)
2ff2 : 38 __ __ SEC
2ff3 : e5 0f __ SBC P2 
2ff5 : 85 1d __ STA ACCU + 2 
2ff7 : ad fc c7 LDA $c7fc ; (sstack + 17)
2ffa : e5 10 __ SBC P3 
2ffc : 85 1e __ STA ACCU + 3 
2ffe : a9 00 __ LDA #$00
3000 : 85 1b __ STA ACCU + 0 
3002 : 85 1c __ STA ACCU + 1 
3004 : 85 04 __ STA WORK + 1 
3006 : 85 05 __ STA WORK + 2 
3008 : 85 06 __ STA WORK + 3 
300a : 20 f7 1d JSR $1df7 ; (divs32@proxy + 0)
300d : a5 5a __ LDA T2 + 3 
300f : c5 1e __ CMP ACCU + 3 
3011 : f0 60 __ BEQ $3073 ; (bmmc_quad_fill.s10 + 0)
.s15:
3013 : 45 1e __ EOR ACCU + 3 
3015 : 30 04 __ BMI $301b ; (bmmc_quad_fill.s14 + 0)
.s13:
3017 : b0 04 __ BCS $301d ; (bmmc_quad_fill.s7 + 0)
3019 : 90 26 __ BCC $3041 ; (bmmc_quad_fill.s9 + 0)
.s14:
301b : b0 24 __ BCS $3041 ; (bmmc_quad_fill.s9 + 0)
.s7:
301d : a5 1b __ LDA ACCU + 0 
301f : 85 15 __ STA P8 
3021 : a5 1c __ LDA ACCU + 1 
3023 : 85 16 __ STA P9 
3025 : a5 1d __ LDA ACCU + 2 
3027 : 85 17 __ STA P10 
3029 : a5 1e __ LDA ACCU + 3 
302b : 85 18 __ STA P11 
302d : a5 57 __ LDA T2 + 0 
302f : 8d eb c7 STA $c7eb ; (sstack + 0)
3032 : a5 58 __ LDA T2 + 1 
3034 : 8d ec c7 STA $c7ec ; (sstack + 1)
3037 : a5 59 __ LDA T2 + 2 
3039 : 8d ed c7 STA $c7ed ; (sstack + 2)
303c : a5 5a __ LDA T2 + 3 
303e : 4c 62 30 JMP $3062 ; (bmmc_quad_fill.s8 + 0)
.s9:
3041 : a5 57 __ LDA T2 + 0 
3043 : 85 15 __ STA P8 
3045 : a5 58 __ LDA T2 + 1 
3047 : 85 16 __ STA P9 
3049 : a5 59 __ LDA T2 + 2 
304b : 85 17 __ STA P10 
304d : a5 5a __ LDA T2 + 3 
304f : 85 18 __ STA P11 
3051 : a5 1b __ LDA ACCU + 0 
3053 : 8d eb c7 STA $c7eb ; (sstack + 0)
3056 : a5 1c __ LDA ACCU + 1 
3058 : 8d ec c7 STA $c7ec ; (sstack + 1)
305b : a5 1d __ LDA ACCU + 2 
305d : 8d ed c7 STA $c7ed ; (sstack + 2)
3060 : a5 1e __ LDA ACCU + 3 
.s8:
3062 : 8d ee c7 STA $c7ee ; (sstack + 3)
3065 : 20 86 30 JSR $3086 ; (bmmc_trapezoid_fill.s1 + 0)
.s3:
3068 : a2 09 __ LDX #$09
306a : bd cb c7 LDA $c7cb,x ; (bmmc_quad_fill@stack + 0)
306d : 95 53 __ STA T0 + 0,x 
306f : ca __ __ DEX
3070 : 10 f8 __ BPL $306a ; (bmmc_quad_fill.s3 + 2)
3072 : 60 __ __ RTS
.s10:
3073 : a5 59 __ LDA T2 + 2 
3075 : c5 1d __ CMP ACCU + 2 
3077 : d0 9e __ BNE $3017 ; (bmmc_quad_fill.s13 + 0)
.s11:
3079 : a5 58 __ LDA T2 + 1 
307b : c5 1c __ CMP ACCU + 1 
307d : d0 98 __ BNE $3017 ; (bmmc_quad_fill.s13 + 0)
.s12:
307f : a5 57 __ LDA T2 + 0 
3081 : c5 1b __ CMP ACCU + 0 
3083 : 4c 17 30 JMP $3017 ; (bmmc_quad_fill.s13 + 0)
--------------------------------------------------------------------
bmmc_trapezoid_fill: ; bmmc_trapezoid_fill(const struct Bitmap*,const struct ClipRect*,i32,i32,i32,i32,i16,i16,const u8*)->void
;  37, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
3086 : a2 05 __ LDX #$05
3088 : b5 53 __ LDA T6 + 0,x 
308a : 9d d9 c7 STA $c7d9,x ; (bmmc_trapezoid_fill@stack + 0)
308d : ca __ __ DEX
308e : 10 f8 __ BPL $3088 ; (bmmc_trapezoid_fill.s1 + 2)
.s4:
3090 : ad f2 c7 LDA $c7f2 ; (sstack + 7)
3093 : 30 19 __ BMI $30ae ; (bmmc_trapezoid_fill.s3 + 0)
.s41:
3095 : 0d f1 c7 ORA $c7f1 ; (sstack + 6)
3098 : f0 14 __ BEQ $30ae ; (bmmc_trapezoid_fill.s3 + 0)
.s5:
309a : ad ef c7 LDA $c7ef ; (sstack + 4)
309d : 85 4e __ STA T3 + 0 
309f : ad f0 c7 LDA $c7f0 ; (sstack + 5)
30a2 : 85 4f __ STA T3 + 1 
30a4 : 30 13 __ BMI $30b9 ; (bmmc_trapezoid_fill.s6 + 0)
.s40:
30a6 : d0 06 __ BNE $30ae ; (bmmc_trapezoid_fill.s3 + 0)
.s39:
30a8 : a5 4e __ LDA T3 + 0 
30aa : c9 c8 __ CMP #$c8
30ac : 90 0b __ BCC $30b9 ; (bmmc_trapezoid_fill.s6 + 0)
.s3:
30ae : a2 05 __ LDX #$05
30b0 : bd d9 c7 LDA $c7d9,x ; (bmmc_trapezoid_fill@stack + 0)
30b3 : 95 53 __ STA T6 + 0,x 
30b5 : ca __ __ DEX
30b6 : 10 f8 __ BPL $30b0 ; (bmmc_trapezoid_fill.s3 + 2)
30b8 : 60 __ __ RTS
.s6:
30b9 : a5 0d __ LDA P0 ; (x0 + 0)
30bb : 85 43 __ STA T0 + 0 
30bd : a5 0e __ LDA P1 ; (x0 + 1)
30bf : 85 44 __ STA T0 + 1 
30c1 : a5 0f __ LDA P2 ; (x0 + 2)
30c3 : 85 45 __ STA T0 + 2 
30c5 : a5 10 __ LDA P3 ; (x0 + 3)
30c7 : 85 46 __ STA T0 + 3 
30c9 : a5 11 __ LDA P4 ; (x1 + 0)
30cb : 85 47 __ STA T1 + 0 
30cd : a5 12 __ LDA P5 ; (x1 + 1)
30cf : 85 48 __ STA T1 + 1 
30d1 : a5 13 __ LDA P6 ; (x1 + 2)
30d3 : 85 49 __ STA T1 + 2 
30d5 : a5 14 __ LDA P7 ; (x1 + 3)
30d7 : 85 4a __ STA T1 + 3 
30d9 : ad f2 c7 LDA $c7f2 ; (sstack + 7)
30dc : f0 0c __ BEQ $30ea ; (bmmc_trapezoid_fill.s38 + 0)
.s48:
30de : a9 c8 __ LDA #$c8
.s37:
30e0 : 8d f1 c7 STA $c7f1 ; (sstack + 6)
30e3 : a9 00 __ LDA #$00
30e5 : 8d f2 c7 STA $c7f2 ; (sstack + 7)
30e8 : f0 07 __ BEQ $30f1 ; (bmmc_trapezoid_fill.s7 + 0)
.s38:
30ea : a9 c8 __ LDA #$c8
30ec : cd f1 c7 CMP $c7f1 ; (sstack + 6)
30ef : 90 ef __ BCC $30e0 ; (bmmc_trapezoid_fill.s37 + 0)
.s7:
30f1 : 24 4f __ BIT T3 + 1 
30f3 : 30 03 __ BMI $30f8 ; (bmmc_trapezoid_fill.s36 + 0)
30f5 : 4c 85 31 JMP $3185 ; (bmmc_trapezoid_fill.s8 + 0)
.s36:
30f8 : a9 00 __ LDA #$00
30fa : 8d ef c7 STA $c7ef ; (sstack + 4)
30fd : 8d f0 c7 STA $c7f0 ; (sstack + 5)
3100 : 38 __ __ SEC
3101 : e5 4e __ SBC T3 + 0 
3103 : 85 4e __ STA T3 + 0 
3105 : 85 03 __ STA WORK + 0 
3107 : a9 00 __ LDA #$00
3109 : e5 4f __ SBC T3 + 1 
310b : 85 4f __ STA T3 + 1 
310d : 85 04 __ STA WORK + 1 
310f : 29 80 __ AND #$80
3111 : 10 02 __ BPL $3115 ; (bmmc_trapezoid_fill.s36 + 29)
3113 : a9 ff __ LDA #$ff
3115 : 85 4d __ STA T2 + 2 
3117 : 85 06 __ STA WORK + 3 
3119 : 85 05 __ STA WORK + 2 
311b : ad eb c7 LDA $c7eb ; (sstack + 0)
311e : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
3120 : ad ec c7 LDA $c7ec ; (sstack + 1)
3123 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
3125 : ad ed c7 LDA $c7ed ; (sstack + 2)
3128 : 85 1d __ STA ACCU + 2 ; (y0 + 0)
312a : ad ee c7 LDA $c7ee ; (sstack + 3)
312d : 85 1e __ STA ACCU + 3 ; (y0 + 1)
312f : 20 11 39 JSR $3911 ; (mul32 + 0)
3132 : 18 __ __ CLC
3133 : a5 07 __ LDA WORK + 4 
3135 : 65 11 __ ADC P4 ; (x1 + 0)
3137 : 85 47 __ STA T1 + 0 
3139 : a5 08 __ LDA WORK + 5 
313b : 65 12 __ ADC P5 ; (x1 + 1)
313d : 85 48 __ STA T1 + 1 
313f : a5 09 __ LDA WORK + 6 
3141 : 65 13 __ ADC P6 ; (x1 + 2)
3143 : 85 49 __ STA T1 + 2 
3145 : a5 0a __ LDA WORK + 7 
3147 : 65 14 __ ADC P7 ; (x1 + 3)
3149 : 85 4a __ STA T1 + 3 
314b : a5 15 __ LDA P8 ; (dx0 + 0)
314d : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
314f : a5 16 __ LDA P9 ; (dx0 + 1)
3151 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
3153 : a5 17 __ LDA P10 ; (dx0 + 2)
3155 : 85 1d __ STA ACCU + 2 ; (y0 + 0)
3157 : a5 18 __ LDA P11 ; (dx0 + 3)
3159 : 85 1e __ STA ACCU + 3 ; (y0 + 1)
315b : a5 4e __ LDA T3 + 0 
315d : 85 03 __ STA WORK + 0 
315f : a5 4f __ LDA T3 + 1 
3161 : 85 04 __ STA WORK + 1 
3163 : a5 4d __ LDA T2 + 2 
3165 : 85 05 __ STA WORK + 2 
3167 : 85 06 __ STA WORK + 3 
3169 : 20 11 39 JSR $3911 ; (mul32 + 0)
316c : 18 __ __ CLC
316d : a5 07 __ LDA WORK + 4 
316f : 65 0d __ ADC P0 ; (x0 + 0)
3171 : 85 43 __ STA T0 + 0 
3173 : a5 08 __ LDA WORK + 5 
3175 : 65 0e __ ADC P1 ; (x0 + 1)
3177 : 85 44 __ STA T0 + 1 
3179 : a5 09 __ LDA WORK + 6 
317b : 65 0f __ ADC P2 ; (x0 + 2)
317d : 85 45 __ STA T0 + 2 
317f : a5 0a __ LDA WORK + 7 
3181 : 65 10 __ ADC P3 ; (x0 + 3)
3183 : 85 46 __ STA T0 + 3 
.s8:
3185 : ad ef c7 LDA $c7ef ; (sstack + 4)
3188 : 85 4e __ STA T3 + 0 
318a : 29 f8 __ AND #$f8
318c : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
318e : ad f0 c7 LDA $c7f0 ; (sstack + 5)
3191 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
3193 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
3196 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
3199 : ad fd 42 LDA $42fd ; (sbm.data + 0)
319c : 18 __ __ CLC
319d : 65 1b __ ADC ACCU + 0 ; (dx1 + 2)
319f : 85 50 __ STA T5 + 0 
31a1 : ad fe 42 LDA $42fe ; (sbm.data + 1)
31a4 : 65 1c __ ADC ACCU + 1 ; (dx1 + 3)
31a6 : aa __ __ TAX
31a7 : a5 4e __ LDA T3 + 0 
31a9 : 29 07 __ AND #$07
31ab : 18 __ __ CLC
31ac : 65 50 __ ADC T5 + 0 
31ae : 85 50 __ STA T5 + 0 
31b0 : 90 02 __ BCC $31b4 ; (bmmc_trapezoid_fill.s45 + 0)
.s44:
31b2 : e8 __ __ INX
31b3 : 18 __ __ CLC
.s45:
31b4 : 86 51 __ STX T5 + 1 
31b6 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
31b9 : 69 ff __ ADC #$ff
31bb : 2a __ __ ROL
31bc : 2a __ __ ROL
31bd : 2a __ __ ROL
31be : aa __ __ TAX
31bf : 29 f8 __ AND #$f8
31c1 : 85 1b __ STA ACCU + 0 ; (dx1 + 2)
31c3 : 8a __ __ TXA
31c4 : 29 07 __ AND #$07
31c6 : 2a __ __ ROL
31c7 : 69 f8 __ ADC #$f8
31c9 : 85 1c __ STA ACCU + 1 ; (dx1 + 3)
31cb : ad f3 c7 LDA $c7f3 ; (sstack + 8)
31ce : 85 53 __ STA T6 + 0 
31d0 : ad f4 c7 LDA $c7f4 ; (sstack + 9)
31d3 : 85 54 __ STA T6 + 1 
31d5 : ad f1 c7 LDA $c7f1 ; (sstack + 6)
31d8 : 85 1d __ STA ACCU + 2 ; (y0 + 0)
.l9:
31da : a5 4e __ LDA T3 + 0 
31dc : c5 1d __ CMP ACCU + 2 ; (y0 + 0)
31de : 90 03 __ BCC $31e3 ; (bmmc_trapezoid_fill.s10 + 0)
31e0 : 4c ae 30 JMP $30ae ; (bmmc_trapezoid_fill.s3 + 0)
.s10:
31e3 : 29 07 __ AND #$07
31e5 : a8 __ __ TAY
31e6 : b1 53 __ LDA (T6 + 0),y 
31e8 : 85 52 __ STA T12 + 0 
31ea : a5 49 __ LDA T1 + 2 
31ec : 69 01 __ ADC #$01
31ee : 29 fe __ AND #$fe
31f0 : 85 55 __ STA T8 + 0 
31f2 : a5 4a __ LDA T1 + 3 
31f4 : 69 00 __ ADC #$00
31f6 : 85 56 __ STA T8 + 1 
31f8 : a5 45 __ LDA T0 + 2 
31fa : 29 fe __ AND #$fe
31fc : aa __ __ TAX
31fd : a5 46 __ LDA T0 + 3 
31ff : 10 03 __ BPL $3204 ; (bmmc_trapezoid_fill.s11 + 0)
.s35:
3201 : a9 00 __ LDA #$00
3203 : aa __ __ TAX
.s11:
3204 : 85 4c __ STA T2 + 1 
3206 : a5 56 __ LDA T8 + 1 
3208 : 49 80 __ EOR #$80
320a : c9 81 __ CMP #$81
320c : d0 04 __ BNE $3212 ; (bmmc_trapezoid_fill.s34 + 0)
.s33:
320e : a5 55 __ LDA T8 + 0 
3210 : c9 41 __ CMP #$41
.s34:
3212 : b0 03 __ BCS $3217 ; (bmmc_trapezoid_fill.s29 + 0)
3214 : 4c cf 33 JMP $33cf ; (bmmc_trapezoid_fill.s12 + 0)
.s29:
3217 : a5 4c __ LDA T2 + 1 
3219 : c9 01 __ CMP #$01
321b : d0 02 __ BNE $321f ; (bmmc_trapezoid_fill.s32 + 0)
.s31:
321d : e0 40 __ CPX #$40
.s32:
321f : 90 03 __ BCC $3224 ; (bmmc_trapezoid_fill.s30 + 0)
3221 : 4c 7b 33 JMP $337b ; (bmmc_trapezoid_fill.s13 + 0)
.s30:
3224 : a9 40 __ LDA #$40
3226 : 85 55 __ STA T8 + 0 
3228 : a9 01 __ LDA #$01
322a : 85 56 __ STA T8 + 1 
.s16:
322c : 8a __ __ TXA
322d : 29 f8 __ AND #$f8
322f : 85 1e __ STA ACCU + 3 ; (y0 + 1)
3231 : 18 __ __ CLC
3232 : 65 50 __ ADC T5 + 0 
3234 : 85 57 __ STA T10 + 0 
3236 : a5 51 __ LDA T5 + 1 
3238 : 65 4c __ ADC T2 + 1 
323a : 85 58 __ STA T10 + 1 
323c : a5 55 __ LDA T8 + 0 
323e : 29 07 __ AND #$07
3240 : a8 __ __ TAY
3241 : 8a __ __ TXA
3242 : 29 07 __ AND #$07
3244 : aa __ __ TAX
3245 : a5 55 __ LDA T8 + 0 
3247 : 29 f8 __ AND #$f8
3249 : 38 __ __ SEC
324a : e5 1e __ SBC ACCU + 3 ; (y0 + 1)
324c : 85 55 __ STA T8 + 0 
324e : a5 56 __ LDA T8 + 1 
3250 : e5 4c __ SBC T2 + 1 
3252 : 85 56 __ STA T8 + 1 
3254 : 05 55 __ ORA T8 + 0 
3256 : d0 1b __ BNE $3273 ; (bmmc_trapezoid_fill.s17 + 0)
.s25:
3258 : b9 d0 41 LDA $41d0,y ; (rmask[0] + 0)
325b : 3d c8 41 AND $41c8,x ; (lmask[0] + 0)
325e : 85 1e __ STA ACCU + 3 ; (y0 + 1)
3260 : a0 00 __ LDY #$00
.s21:
3262 : 49 ff __ EOR #$ff
3264 : 31 57 __ AND (T10 + 0),y 
3266 : 85 4b __ STA T2 + 0 
3268 : a5 52 __ LDA T12 + 0 
326a : 25 1e __ AND ACCU + 3 ; (y0 + 1)
326c : 05 4b __ ORA T2 + 0 
326e : 91 57 __ STA (T10 + 0),y 
3270 : 4c 7b 33 JMP $337b ; (bmmc_trapezoid_fill.s13 + 0)
.s17:
3273 : b9 d0 41 LDA $41d0,y ; (rmask[0] + 0)
3276 : 85 1e __ STA ACCU + 3 ; (y0 + 1)
3278 : bd c8 41 LDA $41c8,x ; (lmask[0] + 0)
327b : 49 ff __ EOR #$ff
327d : a0 00 __ LDY #$00
327f : 31 57 __ AND (T10 + 0),y 
3281 : 85 4b __ STA T2 + 0 
3283 : a5 52 __ LDA T12 + 0 
3285 : 3d c8 41 AND $41c8,x ; (lmask[0] + 0)
3288 : 05 4b __ ORA T2 + 0 
328a : 91 57 __ STA (T10 + 0),y 
328c : a5 56 __ LDA T8 + 1 
328e : d0 03 __ BNE $3293 ; (bmmc_trapezoid_fill.s24 + 0)
3290 : 4c 1e 33 JMP $331e ; (bmmc_trapezoid_fill.s18 + 0)
.s24:
3293 : a5 52 __ LDA T12 + 0 
3295 : a0 08 __ LDY #$08
3297 : 91 57 __ STA (T10 + 0),y 
3299 : a0 10 __ LDY #$10
329b : 91 57 __ STA (T10 + 0),y 
329d : a0 18 __ LDY #$18
329f : 91 57 __ STA (T10 + 0),y 
32a1 : a0 20 __ LDY #$20
32a3 : 91 57 __ STA (T10 + 0),y 
32a5 : a0 28 __ LDY #$28
32a7 : 91 57 __ STA (T10 + 0),y 
32a9 : a0 30 __ LDY #$30
32ab : 91 57 __ STA (T10 + 0),y 
32ad : a0 38 __ LDY #$38
32af : 91 57 __ STA (T10 + 0),y 
32b1 : a0 40 __ LDY #$40
32b3 : 91 57 __ STA (T10 + 0),y 
32b5 : a0 48 __ LDY #$48
32b7 : 91 57 __ STA (T10 + 0),y 
32b9 : a0 50 __ LDY #$50
32bb : 91 57 __ STA (T10 + 0),y 
32bd : a0 58 __ LDY #$58
32bf : 91 57 __ STA (T10 + 0),y 
32c1 : a0 60 __ LDY #$60
32c3 : 91 57 __ STA (T10 + 0),y 
32c5 : a0 68 __ LDY #$68
32c7 : 91 57 __ STA (T10 + 0),y 
32c9 : a0 70 __ LDY #$70
32cb : 91 57 __ STA (T10 + 0),y 
32cd : a0 78 __ LDY #$78
32cf : 91 57 __ STA (T10 + 0),y 
32d1 : a0 80 __ LDY #$80
32d3 : 91 57 __ STA (T10 + 0),y 
32d5 : a0 88 __ LDY #$88
32d7 : 91 57 __ STA (T10 + 0),y 
32d9 : a0 90 __ LDY #$90
32db : 91 57 __ STA (T10 + 0),y 
32dd : a0 98 __ LDY #$98
32df : 91 57 __ STA (T10 + 0),y 
32e1 : a0 a0 __ LDY #$a0
32e3 : 91 57 __ STA (T10 + 0),y 
32e5 : a0 a8 __ LDY #$a8
32e7 : 91 57 __ STA (T10 + 0),y 
32e9 : a0 b0 __ LDY #$b0
32eb : 91 57 __ STA (T10 + 0),y 
32ed : a0 b8 __ LDY #$b8
32ef : 91 57 __ STA (T10 + 0),y 
32f1 : a0 c0 __ LDY #$c0
32f3 : 91 57 __ STA (T10 + 0),y 
32f5 : a0 c8 __ LDY #$c8
32f7 : 91 57 __ STA (T10 + 0),y 
32f9 : a0 d0 __ LDY #$d0
32fb : 91 57 __ STA (T10 + 0),y 
32fd : a0 d8 __ LDY #$d8
32ff : 91 57 __ STA (T10 + 0),y 
3301 : a0 e0 __ LDY #$e0
3303 : 91 57 __ STA (T10 + 0),y 
3305 : a0 e8 __ LDY #$e8
3307 : 91 57 __ STA (T10 + 0),y 
3309 : a0 f0 __ LDY #$f0
330b : 91 57 __ STA (T10 + 0),y 
330d : a0 f8 __ LDY #$f8
330f : 91 57 __ STA (T10 + 0),y 
3311 : 38 __ __ SEC
3312 : a5 55 __ LDA T8 + 0 
3314 : e9 f8 __ SBC #$f8
3316 : 85 55 __ STA T8 + 0 
3318 : e6 58 __ INC T10 + 1 
331a : a9 00 __ LDA #$00
331c : f0 48 __ BEQ $3366 ; (bmmc_trapezoid_fill.s42 + 0)
.s18:
331e : 24 55 __ BIT T8 + 0 
3320 : 30 04 __ BMI $3326 ; (bmmc_trapezoid_fill.s23 + 0)
.s19:
3322 : a9 08 __ LDA #$08
3324 : d0 40 __ BNE $3366 ; (bmmc_trapezoid_fill.s42 + 0)
.s23:
3326 : a5 52 __ LDA T12 + 0 
3328 : a0 08 __ LDY #$08
332a : 91 57 __ STA (T10 + 0),y 
332c : a0 10 __ LDY #$10
332e : 91 57 __ STA (T10 + 0),y 
3330 : a0 18 __ LDY #$18
3332 : 91 57 __ STA (T10 + 0),y 
3334 : a0 20 __ LDY #$20
3336 : 91 57 __ STA (T10 + 0),y 
3338 : a0 28 __ LDY #$28
333a : 91 57 __ STA (T10 + 0),y 
333c : a0 30 __ LDY #$30
333e : 91 57 __ STA (T10 + 0),y 
3340 : a0 38 __ LDY #$38
3342 : 91 57 __ STA (T10 + 0),y 
3344 : a0 40 __ LDY #$40
3346 : 91 57 __ STA (T10 + 0),y 
3348 : a0 48 __ LDY #$48
334a : 91 57 __ STA (T10 + 0),y 
334c : a0 50 __ LDY #$50
334e : 91 57 __ STA (T10 + 0),y 
3350 : a0 58 __ LDY #$58
3352 : 91 57 __ STA (T10 + 0),y 
3354 : a0 60 __ LDY #$60
3356 : 91 57 __ STA (T10 + 0),y 
3358 : a0 68 __ LDY #$68
335a : 91 57 __ STA (T10 + 0),y 
335c : a0 70 __ LDY #$70
335e : 91 57 __ STA (T10 + 0),y 
3360 : a0 78 __ LDY #$78
3362 : 91 57 __ STA (T10 + 0),y 
3364 : a9 80 __ LDA #$80
.s42:
3366 : a6 52 __ LDX T12 + 0 
3368 : 4c 71 33 JMP $3371 ; (bmmc_trapezoid_fill.l20 + 0)
.s22:
336b : 8a __ __ TXA
336c : 91 57 __ STA (T10 + 0),y 
336e : 98 __ __ TYA
336f : 69 08 __ ADC #$08
.l20:
3371 : a8 __ __ TAY
3372 : c4 55 __ CPY T8 + 0 
3374 : 90 f5 __ BCC $336b ; (bmmc_trapezoid_fill.s22 + 0)
.s43:
3376 : a5 1e __ LDA ACCU + 3 ; (y0 + 1)
3378 : 4c 62 32 JMP $3262 ; (bmmc_trapezoid_fill.s21 + 0)
.s13:
337b : e6 50 __ INC T5 + 0 
337d : d0 02 __ BNE $3381 ; (bmmc_trapezoid_fill.s47 + 0)
.s46:
337f : e6 51 __ INC T5 + 1 
.s47:
3381 : a5 50 __ LDA T5 + 0 
3383 : 29 07 __ AND #$07
3385 : d0 0d __ BNE $3394 ; (bmmc_trapezoid_fill.s15 + 0)
.s14:
3387 : 18 __ __ CLC
3388 : a5 50 __ LDA T5 + 0 
338a : 65 1b __ ADC ACCU + 0 ; (dx1 + 2)
338c : 85 50 __ STA T5 + 0 
338e : a5 51 __ LDA T5 + 1 
3390 : 65 1c __ ADC ACCU + 1 ; (dx1 + 3)
3392 : 85 51 __ STA T5 + 1 
.s15:
3394 : e6 4e __ INC T3 + 0 
3396 : 18 __ __ CLC
3397 : a5 15 __ LDA P8 ; (dx0 + 0)
3399 : 65 43 __ ADC T0 + 0 
339b : 85 43 __ STA T0 + 0 
339d : a5 16 __ LDA P9 ; (dx0 + 1)
339f : 65 44 __ ADC T0 + 1 
33a1 : 85 44 __ STA T0 + 1 
33a3 : a5 17 __ LDA P10 ; (dx0 + 2)
33a5 : 65 45 __ ADC T0 + 2 
33a7 : 85 45 __ STA T0 + 2 
33a9 : a5 18 __ LDA P11 ; (dx0 + 3)
33ab : 65 46 __ ADC T0 + 3 
33ad : 85 46 __ STA T0 + 3 
33af : ad eb c7 LDA $c7eb ; (sstack + 0)
33b2 : 18 __ __ CLC
33b3 : 65 47 __ ADC T1 + 0 
33b5 : 85 47 __ STA T1 + 0 
33b7 : ad ec c7 LDA $c7ec ; (sstack + 1)
33ba : 65 48 __ ADC T1 + 1 
33bc : 85 48 __ STA T1 + 1 
33be : ad ed c7 LDA $c7ed ; (sstack + 2)
33c1 : 65 49 __ ADC T1 + 2 
33c3 : 85 49 __ STA T1 + 2 
33c5 : ad ee c7 LDA $c7ee ; (sstack + 3)
33c8 : 65 4a __ ADC T1 + 3 
33ca : 85 4a __ STA T1 + 3 
33cc : 4c da 31 JMP $31da ; (bmmc_trapezoid_fill.l9 + 0)
.s12:
33cf : 24 56 __ BIT T8 + 1 
33d1 : 30 a8 __ BMI $337b ; (bmmc_trapezoid_fill.s13 + 0)
.s28:
33d3 : a5 4c __ LDA T2 + 1 
33d5 : c5 56 __ CMP T8 + 1 
33d7 : d0 02 __ BNE $33db ; (bmmc_trapezoid_fill.s27 + 0)
.s26:
33d9 : e4 55 __ CPX T8 + 0 
.s27:
33db : b0 9e __ BCS $337b ; (bmmc_trapezoid_fill.s13 + 0)
33dd : 4c 2c 32 JMP $322c ; (bmmc_trapezoid_fill.s16 + 0)
--------------------------------------------------------------------
bmmc_circle: ; bmmc_circle(const struct Bitmap*,const struct ClipRect*,i16,i16,u8,u8)->void
;  29, "/home/honza/projects/c64/projects/oscar64/include/gfx/mcbitmap.h"
.s1:
33e0 : a2 04 __ LDX #$04
33e2 : b5 53 __ LDA T10 + 0,x 
33e4 : 9d dc c7 STA $c7dc,x ; (bmmc_circle@stack + 0)
33e7 : ca __ __ DEX
33e8 : 10 f8 __ BPL $33e2 ; (bmmc_circle.s1 + 2)
.s4:
33ea : a5 11 __ LDA P4 ; (r + 0)
33ec : 85 52 __ STA T13 + 0 
33ee : 85 44 __ STA T1 + 0 
33f0 : 38 __ __ SEC
33f1 : a5 0d __ LDA P0 ; (x + 0)
33f3 : e5 11 __ SBC P4 ; (r + 0)
33f5 : aa __ __ TAX
33f6 : a5 0e __ LDA P1 ; (x + 1)
33f8 : e9 00 __ SBC #$00
33fa : 85 47 __ STA T3 + 1 
33fc : 30 34 __ BMI $3432 ; (bmmc_circle.s5 + 0)
.s49:
33fe : 18 __ __ CLC
33ff : a5 0d __ LDA P0 ; (x + 0)
3401 : 65 11 __ ADC P4 ; (r + 0)
3403 : a8 __ __ TAY
3404 : a5 0e __ LDA P1 ; (x + 1)
3406 : 69 00 __ ADC #$00
3408 : 49 80 __ EOR #$80
340a : c9 81 __ CMP #$81
340c : d0 02 __ BNE $3410 ; (bmmc_circle.s66 + 0)
.s65:
340e : c0 40 __ CPY #$40
.s66:
3410 : b0 20 __ BCS $3432 ; (bmmc_circle.s5 + 0)
.s50:
3412 : 38 __ __ SEC
3413 : a5 0f __ LDA P2 ; (y + 0)
3415 : e5 11 __ SBC P4 ; (r + 0)
3417 : a5 10 __ LDA P3 ; (y + 1)
3419 : e9 00 __ SBC #$00
341b : 30 15 __ BMI $3432 ; (bmmc_circle.s5 + 0)
.s51:
341d : 18 __ __ CLC
341e : a5 0f __ LDA P2 ; (y + 0)
3420 : 65 11 __ ADC P4 ; (r + 0)
3422 : a8 __ __ TAY
3423 : a5 10 __ LDA P3 ; (y + 1)
3425 : 69 00 __ ADC #$00
3427 : 10 03 __ BPL $342c ; (bmmc_circle.s64 + 0)
3429 : 4c 97 36 JMP $3697 ; (bmmc_circle.s52 + 0)
.s64:
342c : d0 04 __ BNE $3432 ; (bmmc_circle.s5 + 0)
.s63:
342e : c0 c8 __ CPY #$c8
3430 : 90 f7 __ BCC $3429 ; (bmmc_circle.s51 + 12)
.s5:
3432 : a5 47 __ LDA T3 + 1 
3434 : 49 80 __ EOR #$80
3436 : c9 81 __ CMP #$81
3438 : d0 02 __ BNE $343c ; (bmmc_circle.s48 + 0)
.s47:
343a : e0 40 __ CPX #$40
.s48:
343c : 90 03 __ BCC $3441 ; (bmmc_circle.s6 + 0)
343e : 4c 43 35 JMP $3543 ; (bmmc_circle.s3 + 0)
.s6:
3441 : a5 0d __ LDA P0 ; (x + 0)
3443 : 65 11 __ ADC P4 ; (r + 0)
3445 : a5 0e __ LDA P1 ; (x + 1)
3447 : 69 00 __ ADC #$00
3449 : 30 f3 __ BMI $343e ; (bmmc_circle.s48 + 2)
.s7:
344b : a5 0f __ LDA P2 ; (y + 0)
344d : 85 46 __ STA T3 + 0 
344f : 38 __ __ SEC
3450 : e5 11 __ SBC P4 ; (r + 0)
3452 : aa __ __ TAX
3453 : a5 10 __ LDA P3 ; (y + 1)
3455 : 85 47 __ STA T3 + 1 
3457 : e9 00 __ SBC #$00
3459 : 30 06 __ BMI $3461 ; (bmmc_circle.s8 + 0)
.s46:
345b : d0 e1 __ BNE $343e ; (bmmc_circle.s48 + 2)
.s45:
345d : e0 c8 __ CPX #$c8
345f : b0 dd __ BCS $343e ; (bmmc_circle.s48 + 2)
.s8:
3461 : 18 __ __ CLC
3462 : a5 0f __ LDA P2 ; (y + 0)
3464 : 65 11 __ ADC P4 ; (r + 0)
3466 : a5 10 __ LDA P3 ; (y + 1)
3468 : 69 00 __ ADC #$00
346a : 30 d2 __ BMI $343e ; (bmmc_circle.s48 + 2)
.s9:
346c : a5 10 __ LDA P3 ; (y + 1)
346e : 85 1c __ STA ACCU + 1 
3470 : 85 49 __ STA T4 + 1 
3472 : a6 12 __ LDX P5 ; (color + 0)
3474 : bd d8 41 LDA $41d8,x ; (cbytes[0] + 0)
3477 : 49 ff __ EOR #$ff
3479 : 85 43 __ STA T0 + 0 
347b : a5 0f __ LDA P2 ; (y + 0)
347d : 85 48 __ STA T4 + 0 
347f : 29 f8 __ AND #$f8
3481 : 85 1b __ STA ACCU + 0 
3483 : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
3486 : 20 16 38 JSR $3816 ; (mul16by8 + 0)
3489 : ad fd 42 LDA $42fd ; (sbm.data + 0)
348c : 18 __ __ CLC
348d : 65 1b __ ADC ACCU + 0 
348f : 85 4c __ STA T7 + 0 
3491 : ad fe 42 LDA $42fe ; (sbm.data + 1)
3494 : 65 1c __ ADC ACCU + 1 
3496 : aa __ __ TAX
3497 : a5 0f __ LDA P2 ; (y + 0)
3499 : 29 07 __ AND #$07
349b : 18 __ __ CLC
349c : 65 4c __ ADC T7 + 0 
349e : 85 4c __ STA T7 + 0 
34a0 : 85 4a __ STA T6 + 0 
34a2 : 8a __ __ TXA
34a3 : 69 00 __ ADC #$00
34a5 : 85 4d __ STA T7 + 1 
34a7 : 85 4b __ STA T6 + 1 
34a9 : a5 11 __ LDA P4 ; (r + 0)
34ab : f0 2d __ BEQ $34da ; (bmmc_circle.s10 + 0)
.s20:
34ad : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
34b0 : 18 __ __ CLC
34b1 : 69 ff __ ADC #$ff
34b3 : 2a __ __ ROL
34b4 : 2a __ __ ROL
34b5 : 2a __ __ ROL
34b6 : aa __ __ TAX
34b7 : 29 f8 __ AND #$f8
34b9 : 85 1b __ STA ACCU + 0 
34bb : 8a __ __ TXA
34bc : 29 07 __ AND #$07
34be : 2a __ __ ROL
34bf : 69 f8 __ ADC #$f8
34c1 : 85 1c __ STA ACCU + 1 
34c3 : 38 __ __ SEC
34c4 : a9 00 __ LDA #$00
34c6 : e5 1b __ SBC ACCU + 0 
34c8 : 85 4e __ STA T8 + 0 
34ca : a9 00 __ LDA #$00
34cc : e5 1c __ SBC ACCU + 1 
34ce : 85 4f __ STA T8 + 1 
34d0 : 46 44 __ LSR T1 + 0 
34d2 : a9 00 __ LDA #$00
34d4 : 85 45 __ STA T1 + 1 
34d6 : 85 1d __ STA ACCU + 2 
34d8 : f0 74 __ BEQ $354e ; (bmmc_circle.l21 + 0)
.s10:
34da : a5 0e __ LDA P1 ; (x + 1)
34dc : c9 01 __ CMP #$01
34de : d0 04 __ BNE $34e4 ; (bmmc_circle.s19 + 0)
.s18:
34e0 : a5 0d __ LDA P0 ; (x + 0)
34e2 : c9 40 __ CMP #$40
.s19:
34e4 : b0 5d __ BCS $3543 ; (bmmc_circle.s3 + 0)
.s11:
34e6 : a5 49 __ LDA T4 + 1 
34e8 : d0 26 __ BNE $3510 ; (bmmc_circle.s12 + 0)
.s17:
34ea : a5 48 __ LDA T4 + 0 
34ec : c9 c8 __ CMP #$c8
34ee : b0 20 __ BCS $3510 ; (bmmc_circle.s12 + 0)
.s16:
34f0 : a5 0d __ LDA P0 ; (x + 0)
34f2 : 29 f8 __ AND #$f8
34f4 : 65 4a __ ADC T6 + 0 
34f6 : 85 4a __ STA T6 + 0 
34f8 : a5 4b __ LDA T6 + 1 
34fa : 65 0e __ ADC P1 ; (x + 1)
34fc : 85 4b __ STA T6 + 1 
34fe : a5 0d __ LDA P0 ; (x + 0)
3500 : 29 07 __ AND #$07
3502 : aa __ __ TAX
3503 : a0 00 __ LDY #$00
3505 : b1 4a __ LDA (T6 + 0),y 
3507 : 45 43 __ EOR T0 + 0 
3509 : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
350c : 45 43 __ EOR T0 + 0 
350e : 91 4a __ STA (T6 + 0),y 
.s12:
3510 : a5 47 __ LDA T3 + 1 
3512 : d0 2f __ BNE $3543 ; (bmmc_circle.s3 + 0)
.s15:
3514 : a5 46 __ LDA T3 + 0 
3516 : c9 c8 __ CMP #$c8
3518 : b0 29 __ BCS $3543 ; (bmmc_circle.s3 + 0)
.s13:
351a : a5 0d __ LDA P0 ; (x + 0)
351c : 29 f8 __ AND #$f8
351e : 65 4c __ ADC T7 + 0 
3520 : 85 44 __ STA T1 + 0 
3522 : a5 4d __ LDA T7 + 1 
3524 : 65 0e __ ADC P1 ; (x + 1)
3526 : 85 45 __ STA T1 + 1 
3528 : a5 0d __ LDA P0 ; (x + 0)
352a : 29 07 __ AND #$07
352c : 18 __ __ CLC
352d : 69 e6 __ ADC #$e6
352f : 85 0d __ STA P0 ; (x + 0)
3531 : a9 41 __ LDA #$41
3533 : 69 00 __ ADC #$00
3535 : 85 0e __ STA P1 ; (x + 1)
.s14:
3537 : a0 00 __ LDY #$00
3539 : b1 44 __ LDA (T1 + 0),y 
353b : 45 43 __ EOR T0 + 0 
353d : 11 0d __ ORA (P0),y ; (x + 0)
353f : 45 43 __ EOR T0 + 0 
3541 : 91 44 __ STA (T1 + 0),y 
.s3:
3543 : a2 04 __ LDX #$04
3545 : bd dc c7 LDA $c7dc,x ; (bmmc_circle@stack + 0)
3548 : 95 53 __ STA T10 + 0,x 
354a : ca __ __ DEX
354b : 10 f8 __ BPL $3545 ; (bmmc_circle.s3 + 2)
354d : 60 __ __ RTS
.l21:
354e : 38 __ __ SEC
354f : a5 0d __ LDA P0 ; (x + 0)
3551 : e5 52 __ SBC T13 + 0 
3553 : 85 53 __ STA T10 + 0 
3555 : a5 0e __ LDA P1 ; (x + 1)
3557 : e9 00 __ SBC #$00
3559 : 85 54 __ STA T10 + 1 
355b : c9 01 __ CMP #$01
355d : d0 04 __ BNE $3563 ; (bmmc_circle.s44 + 0)
.s43:
355f : a5 53 __ LDA T10 + 0 
3561 : c9 40 __ CMP #$40
.s44:
3563 : a9 00 __ LDA #$00
3565 : 6a __ __ ROR
3566 : 85 1e __ STA ACCU + 3 
3568 : a5 52 __ LDA T13 + 0 
356a : 65 0d __ ADC P0 ; (x + 0)
356c : 85 50 __ STA T9 + 0 
356e : a5 0e __ LDA P1 ; (x + 1)
3570 : 69 00 __ ADC #$00
3572 : 85 51 __ STA T9 + 1 
3574 : c9 01 __ CMP #$01
3576 : d0 04 __ BNE $357c ; (bmmc_circle.s42 + 0)
.s41:
3578 : a5 50 __ LDA T9 + 0 
357a : c9 40 __ CMP #$40
.s42:
357c : a9 00 __ LDA #$00
357e : 6a __ __ ROR
357f : 85 57 __ STA T16 + 0 
3581 : a5 49 __ LDA T4 + 1 
3583 : d0 4f __ BNE $35d4 ; (bmmc_circle.s22 + 0)
.s40:
3585 : a5 48 __ LDA T4 + 0 
3587 : c9 c8 __ CMP #$c8
3589 : b0 49 __ BCS $35d4 ; (bmmc_circle.s22 + 0)
.s36:
358b : 24 1e __ BIT ACCU + 3 
358d : 30 20 __ BMI $35af ; (bmmc_circle.s37 + 0)
.s39:
358f : a5 53 __ LDA T10 + 0 
3591 : 29 f8 __ AND #$f8
3593 : 65 4a __ ADC T6 + 0 
3595 : 85 55 __ STA T11 + 0 
3597 : a5 4b __ LDA T6 + 1 
3599 : 65 54 __ ADC T10 + 1 
359b : 85 56 __ STA T11 + 1 
359d : a5 53 __ LDA T10 + 0 
359f : 29 07 __ AND #$07
35a1 : aa __ __ TAX
35a2 : a0 00 __ LDY #$00
35a4 : b1 55 __ LDA (T11 + 0),y 
35a6 : 45 43 __ EOR T0 + 0 
35a8 : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
35ab : 45 43 __ EOR T0 + 0 
35ad : 91 55 __ STA (T11 + 0),y 
.s37:
35af : 24 57 __ BIT T16 + 0 
35b1 : 30 21 __ BMI $35d4 ; (bmmc_circle.s22 + 0)
.s38:
35b3 : a5 50 __ LDA T9 + 0 
35b5 : 29 f8 __ AND #$f8
35b7 : 18 __ __ CLC
35b8 : 65 4a __ ADC T6 + 0 
35ba : 85 55 __ STA T11 + 0 
35bc : a5 4b __ LDA T6 + 1 
35be : 65 51 __ ADC T9 + 1 
35c0 : 85 56 __ STA T11 + 1 
35c2 : a5 50 __ LDA T9 + 0 
35c4 : 29 07 __ AND #$07
35c6 : aa __ __ TAX
35c7 : a0 00 __ LDY #$00
35c9 : b1 55 __ LDA (T11 + 0),y 
35cb : 45 43 __ EOR T0 + 0 
35cd : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
35d0 : 45 43 __ EOR T0 + 0 
35d2 : 91 55 __ STA (T11 + 0),y 
.s22:
35d4 : a5 47 __ LDA T3 + 1 
35d6 : d0 4f __ BNE $3627 ; (bmmc_circle.s23 + 0)
.s35:
35d8 : a5 46 __ LDA T3 + 0 
35da : c9 c8 __ CMP #$c8
35dc : b0 49 __ BCS $3627 ; (bmmc_circle.s23 + 0)
.s31:
35de : 24 1e __ BIT ACCU + 3 
35e0 : 30 20 __ BMI $3602 ; (bmmc_circle.s32 + 0)
.s34:
35e2 : a5 53 __ LDA T10 + 0 
35e4 : 29 f8 __ AND #$f8
35e6 : 65 4c __ ADC T7 + 0 
35e8 : 85 55 __ STA T11 + 0 
35ea : a5 4d __ LDA T7 + 1 
35ec : 65 54 __ ADC T10 + 1 
35ee : 85 56 __ STA T11 + 1 
35f0 : a5 53 __ LDA T10 + 0 
35f2 : 29 07 __ AND #$07
35f4 : aa __ __ TAX
35f5 : a0 00 __ LDY #$00
35f7 : b1 55 __ LDA (T11 + 0),y 
35f9 : 45 43 __ EOR T0 + 0 
35fb : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
35fe : 45 43 __ EOR T0 + 0 
3600 : 91 55 __ STA (T11 + 0),y 
.s32:
3602 : 24 57 __ BIT T16 + 0 
3604 : 30 21 __ BMI $3627 ; (bmmc_circle.s23 + 0)
.s33:
3606 : a5 50 __ LDA T9 + 0 
3608 : 29 f8 __ AND #$f8
360a : 18 __ __ CLC
360b : 65 4c __ ADC T7 + 0 
360d : 85 53 __ STA T10 + 0 
360f : a5 4d __ LDA T7 + 1 
3611 : 65 51 __ ADC T9 + 1 
3613 : 85 54 __ STA T10 + 1 
3615 : a5 50 __ LDA T9 + 0 
3617 : 29 07 __ AND #$07
3619 : aa __ __ TAX
361a : a0 00 __ LDY #$00
361c : b1 53 __ LDA (T10 + 0),y 
361e : 45 43 __ EOR T0 + 0 
3620 : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
3623 : 45 43 __ EOR T0 + 0 
3625 : 91 53 __ STA (T10 + 0),y 
.s23:
3627 : 24 45 __ BIT T1 + 1 
3629 : 10 17 __ BPL $3642 ; (bmmc_circle.s26 + 0)
.s24:
362b : c6 52 __ DEC T13 + 0 
362d : 18 __ __ CLC
362e : a5 52 __ LDA T13 + 0 
3630 : 65 44 __ ADC T1 + 0 
3632 : 85 44 __ STA T1 + 0 
3634 : 90 02 __ BCC $3638 ; (bmmc_circle.s25 + 0)
.s84:
3636 : e6 45 __ INC T1 + 1 
.s25:
3638 : a5 52 __ LDA T13 + 0 
363a : f0 03 __ BEQ $363f ; (bmmc_circle.s25 + 7)
363c : 4c 4e 35 JMP $354e ; (bmmc_circle.l21 + 0)
363f : 4c da 34 JMP $34da ; (bmmc_circle.s10 + 0)
.s26:
3642 : e6 1d __ INC ACCU + 2 
3644 : 38 __ __ SEC
3645 : a5 44 __ LDA T1 + 0 
3647 : e5 1d __ SBC ACCU + 2 
3649 : 85 44 __ STA T1 + 0 
364b : b0 02 __ BCS $364f ; (bmmc_circle.s75 + 0)
.s74:
364d : c6 45 __ DEC T1 + 1 
.s75:
364f : e6 46 __ INC T3 + 0 
3651 : d0 02 __ BNE $3655 ; (bmmc_circle.s77 + 0)
.s76:
3653 : e6 47 __ INC T3 + 1 
.s77:
3655 : a5 48 __ LDA T4 + 0 
3657 : d0 02 __ BNE $365b ; (bmmc_circle.s79 + 0)
.s78:
3659 : c6 49 __ DEC T4 + 1 
.s79:
365b : c6 48 __ DEC T4 + 0 
365d : e6 4c __ INC T7 + 0 
365f : d0 02 __ BNE $3663 ; (bmmc_circle.s81 + 0)
.s80:
3661 : e6 4d __ INC T7 + 1 
.s81:
3663 : a5 4c __ LDA T7 + 0 
3665 : 29 07 __ AND #$07
3667 : d0 0d __ BNE $3676 ; (bmmc_circle.s28 + 0)
.s27:
3669 : 18 __ __ CLC
366a : a5 4c __ LDA T7 + 0 
366c : 65 1b __ ADC ACCU + 0 
366e : 85 4c __ STA T7 + 0 
3670 : a5 4d __ LDA T7 + 1 
3672 : 65 1c __ ADC ACCU + 1 
3674 : 85 4d __ STA T7 + 1 
.s28:
3676 : a5 4a __ LDA T6 + 0 
3678 : 29 07 __ AND #$07
367a : d0 0d __ BNE $3689 ; (bmmc_circle.s30 + 0)
.s29:
367c : 18 __ __ CLC
367d : a5 4a __ LDA T6 + 0 
367f : 65 4e __ ADC T8 + 0 
3681 : 85 4a __ STA T6 + 0 
3683 : a5 4b __ LDA T6 + 1 
3685 : 65 4f __ ADC T8 + 1 
3687 : 85 4b __ STA T6 + 1 
.s30:
3689 : a5 4a __ LDA T6 + 0 
368b : d0 02 __ BNE $368f ; (bmmc_circle.s83 + 0)
.s82:
368d : c6 4b __ DEC T6 + 1 
.s83:
368f : c6 4a __ DEC T6 + 0 
3691 : 24 45 __ BIT T1 + 1 
3693 : 10 a3 __ BPL $3638 ; (bmmc_circle.s25 + 0)
3695 : 30 94 __ BMI $362b ; (bmmc_circle.s24 + 0)
.s52:
3697 : a6 12 __ LDX P5 ; (color + 0)
3699 : bd d8 41 LDA $41d8,x ; (cbytes[0] + 0)
369c : 49 ff __ EOR #$ff
369e : 85 43 __ STA T0 + 0 
36a0 : a5 0f __ LDA P2 ; (y + 0)
36a2 : 29 f8 __ AND #$f8
36a4 : 85 1b __ STA ACCU + 0 
36a6 : a5 10 __ LDA P3 ; (y + 1)
36a8 : 85 1c __ STA ACCU + 1 
36aa : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
36ad : 20 16 38 JSR $3816 ; (mul16by8 + 0)
36b0 : ad fd 42 LDA $42fd ; (sbm.data + 0)
36b3 : 18 __ __ CLC
36b4 : 65 1b __ ADC ACCU + 0 
36b6 : 85 4a __ STA T6 + 0 
36b8 : ad fe 42 LDA $42fe ; (sbm.data + 1)
36bb : 65 1c __ ADC ACCU + 1 
36bd : aa __ __ TAX
36be : a5 0f __ LDA P2 ; (y + 0)
36c0 : 29 07 __ AND #$07
36c2 : 18 __ __ CLC
36c3 : 65 4a __ ADC T6 + 0 
36c5 : 85 4a __ STA T6 + 0 
36c7 : 85 48 __ STA T4 + 0 
36c9 : 8a __ __ TXA
36ca : 69 00 __ ADC #$00
36cc : 85 4b __ STA T6 + 1 
36ce : 85 49 __ STA T4 + 1 
36d0 : a5 11 __ LDA P4 ; (r + 0)
36d2 : d0 38 __ BNE $370c ; (bmmc_circle.s54 + 0)
.s53:
36d4 : a5 0d __ LDA P0 ; (x + 0)
36d6 : 29 f8 __ AND #$f8
36d8 : a8 __ __ TAY
36d9 : a5 0e __ LDA P1 ; (x + 1)
36db : 85 45 __ STA T1 + 1 
36dd : 18 __ __ CLC
36de : 65 49 __ ADC T4 + 1 
36e0 : 85 49 __ STA T4 + 1 
36e2 : a5 0d __ LDA P0 ; (x + 0)
36e4 : 29 07 __ AND #$07
36e6 : aa __ __ TAX
36e7 : 18 __ __ CLC
36e8 : 69 e6 __ ADC #$e6
36ea : 85 0d __ STA P0 ; (x + 0)
36ec : a9 41 __ LDA #$41
36ee : 69 00 __ ADC #$00
36f0 : 85 0e __ STA P1 ; (x + 1)
36f2 : b1 48 __ LDA (T4 + 0),y 
36f4 : 45 43 __ EOR T0 + 0 
36f6 : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
36f9 : 45 43 __ EOR T0 + 0 
36fb : 91 48 __ STA (T4 + 0),y 
36fd : 98 __ __ TYA
36fe : 18 __ __ CLC
36ff : 65 4a __ ADC T6 + 0 
3701 : 85 44 __ STA T1 + 0 
3703 : a5 4b __ LDA T6 + 1 
3705 : 65 45 __ ADC T1 + 1 
3707 : 85 45 __ STA T1 + 1 
3709 : 4c 37 35 JMP $3537 ; (bmmc_circle.s14 + 0)
.s54:
370c : ad 01 43 LDA $4301 ; (sbm.cwidth + 0)
370f : 18 __ __ CLC
3710 : 69 ff __ ADC #$ff
3712 : 2a __ __ ROL
3713 : 2a __ __ ROL
3714 : 2a __ __ ROL
3715 : aa __ __ TAX
3716 : 29 f8 __ AND #$f8
3718 : 85 46 __ STA T3 + 0 
371a : 8a __ __ TXA
371b : 29 07 __ AND #$07
371d : 2a __ __ ROL
371e : 69 f8 __ ADC #$f8
3720 : 85 47 __ STA T3 + 1 
3722 : 38 __ __ SEC
3723 : a9 00 __ LDA #$00
3725 : e5 46 __ SBC T3 + 0 
3727 : 85 1b __ STA ACCU + 0 
3729 : a9 00 __ LDA #$00
372b : e5 47 __ SBC T3 + 1 
372d : 85 1c __ STA ACCU + 1 
372f : 46 44 __ LSR T1 + 0 
3731 : a9 00 __ LDA #$00
3733 : 85 45 __ STA T1 + 1 
3735 : 85 1d __ STA ACCU + 2 
.l55:
3737 : 18 __ __ CLC
3738 : a5 52 __ LDA T13 + 0 
373a : 65 0d __ ADC P0 ; (x + 0)
373c : a8 __ __ TAY
373d : 29 f8 __ AND #$f8
373f : 85 50 __ STA T9 + 0 
3741 : a5 0e __ LDA P1 ; (x + 1)
3743 : 69 00 __ ADC #$00
3745 : aa __ __ TAX
3746 : 18 __ __ CLC
3747 : 65 4b __ ADC T6 + 1 
3749 : 85 51 __ STA T9 + 1 
374b : a5 48 __ LDA T4 + 0 
374d : 85 55 __ STA T11 + 0 
374f : 85 53 __ STA T10 + 0 
3751 : 8a __ __ TXA
3752 : 18 __ __ CLC
3753 : 65 49 __ ADC T4 + 1 
3755 : 85 54 __ STA T10 + 1 
3757 : 98 __ __ TYA
3758 : 29 07 __ AND #$07
375a : 85 4e __ STA T8 + 0 
375c : aa __ __ TAX
375d : a4 50 __ LDY T9 + 0 
375f : b1 53 __ LDA (T10 + 0),y 
3761 : 45 43 __ EOR T0 + 0 
3763 : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
3766 : 45 43 __ EOR T0 + 0 
3768 : 91 53 __ STA (T10 + 0),y 
376a : 38 __ __ SEC
376b : a5 0d __ LDA P0 ; (x + 0)
376d : e5 52 __ SBC T13 + 0 
376f : aa __ __ TAX
3770 : 29 f8 __ AND #$f8
3772 : 85 53 __ STA T10 + 0 
3774 : a8 __ __ TAY
3775 : a5 0e __ LDA P1 ; (x + 1)
3777 : e9 00 __ SBC #$00
3779 : 85 4d __ STA T7 + 1 
377b : 18 __ __ CLC
377c : 65 49 __ ADC T4 + 1 
377e : 85 56 __ STA T11 + 1 
3780 : 8a __ __ TXA
3781 : 29 07 __ AND #$07
3783 : aa __ __ TAX
3784 : b1 55 __ LDA (T11 + 0),y 
3786 : 45 43 __ EOR T0 + 0 
3788 : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
378b : 45 43 __ EOR T0 + 0 
378d : 91 55 __ STA (T11 + 0),y 
378f : a4 4a __ LDY T6 + 0 
3791 : b1 50 __ LDA (T9 + 0),y 
3793 : 45 43 __ EOR T0 + 0 
3795 : a4 4e __ LDY T8 + 0 
3797 : 19 e6 41 ORA $41e6,y ; (ormask[0] + 0)
379a : 45 43 __ EOR T0 + 0 
379c : a4 4a __ LDY T6 + 0 
379e : 84 4e __ STY T8 + 0 
37a0 : 91 50 __ STA (T9 + 0),y 
37a2 : 18 __ __ CLC
37a3 : a5 4b __ LDA T6 + 1 
37a5 : 65 4d __ ADC T7 + 1 
37a7 : 85 4f __ STA T8 + 1 
37a9 : a4 53 __ LDY T10 + 0 
37ab : b1 4e __ LDA (T8 + 0),y 
37ad : 45 43 __ EOR T0 + 0 
37af : 1d e6 41 ORA $41e6,x ; (ormask[0] + 0)
37b2 : 45 43 __ EOR T0 + 0 
37b4 : 91 4e __ STA (T8 + 0),y 
37b6 : 24 45 __ BIT T1 + 1 
37b8 : 30 45 __ BMI $37ff ; (bmmc_circle.s56 + 0)
.s58:
37ba : e6 1d __ INC ACCU + 2 
37bc : 38 __ __ SEC
37bd : a5 44 __ LDA T1 + 0 
37bf : e5 1d __ SBC ACCU + 2 
37c1 : 85 44 __ STA T1 + 0 
37c3 : b0 02 __ BCS $37c7 ; (bmmc_circle.s68 + 0)
.s67:
37c5 : c6 45 __ DEC T1 + 1 
.s68:
37c7 : e6 4a __ INC T6 + 0 
37c9 : d0 02 __ BNE $37cd ; (bmmc_circle.s70 + 0)
.s69:
37cb : e6 4b __ INC T6 + 1 
.s70:
37cd : a5 4a __ LDA T6 + 0 
37cf : 29 07 __ AND #$07
37d1 : d0 0d __ BNE $37e0 ; (bmmc_circle.s60 + 0)
.s59:
37d3 : 18 __ __ CLC
37d4 : a5 4a __ LDA T6 + 0 
37d6 : 65 46 __ ADC T3 + 0 
37d8 : 85 4a __ STA T6 + 0 
37da : a5 4b __ LDA T6 + 1 
37dc : 65 47 __ ADC T3 + 1 
37de : 85 4b __ STA T6 + 1 
.s60:
37e0 : a5 48 __ LDA T4 + 0 
37e2 : 29 07 __ AND #$07
37e4 : d0 0d __ BNE $37f3 ; (bmmc_circle.s62 + 0)
.s61:
37e6 : 18 __ __ CLC
37e7 : a5 48 __ LDA T4 + 0 
37e9 : 65 1b __ ADC ACCU + 0 
37eb : 85 48 __ STA T4 + 0 
37ed : a5 49 __ LDA T4 + 1 
37ef : 65 1c __ ADC ACCU + 1 
37f1 : 85 49 __ STA T4 + 1 
.s62:
37f3 : a5 48 __ LDA T4 + 0 
37f5 : d0 02 __ BNE $37f9 ; (bmmc_circle.s72 + 0)
.s71:
37f7 : c6 49 __ DEC T4 + 1 
.s72:
37f9 : c6 48 __ DEC T4 + 0 
37fb : 24 45 __ BIT T1 + 1 
37fd : 10 0d __ BPL $380c ; (bmmc_circle.s57 + 0)
.s56:
37ff : c6 52 __ DEC T13 + 0 
3801 : 18 __ __ CLC
3802 : a5 52 __ LDA T13 + 0 
3804 : 65 44 __ ADC T1 + 0 
3806 : 85 44 __ STA T1 + 0 
3808 : 90 02 __ BCC $380c ; (bmmc_circle.s57 + 0)
.s73:
380a : e6 45 __ INC T1 + 1 
.s57:
380c : a5 52 __ LDA T13 + 0 
380e : f0 03 __ BEQ $3813 ; (bmmc_circle.s57 + 7)
3810 : 4c 37 37 JMP $3737 ; (bmmc_circle.l55 + 0)
3813 : 4c d4 36 JMP $36d4 ; (bmmc_circle.s53 + 0)
--------------------------------------------------------------------
mul16by8: ; mul16by8
3816 : 4a __ __ LSR
3817 : f0 2e __ BEQ $3847 ; (mul16by8 + 49)
3819 : a2 00 __ LDX #$00
381b : a0 00 __ LDY #$00
381d : 90 13 __ BCC $3832 ; (mul16by8 + 28)
381f : a4 1b __ LDY ACCU + 0 
3821 : a6 1c __ LDX ACCU + 1 
3823 : b0 0d __ BCS $3832 ; (mul16by8 + 28)
3825 : 85 02 __ STA $02 
3827 : 18 __ __ CLC
3828 : 98 __ __ TYA
3829 : 65 1b __ ADC ACCU + 0 
382b : a8 __ __ TAY
382c : 8a __ __ TXA
382d : 65 1c __ ADC ACCU + 1 
382f : aa __ __ TAX
3830 : a5 02 __ LDA $02 
3832 : 06 1b __ ASL ACCU + 0 
3834 : 26 1c __ ROL ACCU + 1 
3836 : 4a __ __ LSR
3837 : 90 f9 __ BCC $3832 ; (mul16by8 + 28)
3839 : d0 ea __ BNE $3825 ; (mul16by8 + 15)
383b : 18 __ __ CLC
383c : 98 __ __ TYA
383d : 65 1b __ ADC ACCU + 0 
383f : 85 1b __ STA ACCU + 0 
3841 : 8a __ __ TXA
3842 : 65 1c __ ADC ACCU + 1 
3844 : 85 1c __ STA ACCU + 1 
3846 : 60 __ __ RTS
3847 : b0 04 __ BCS $384d ; (mul16by8 + 55)
3849 : 85 1b __ STA ACCU + 0 
384b : 85 1c __ STA ACCU + 1 
384d : 60 __ __ RTS
--------------------------------------------------------------------
mul32by8: ; mul32by8
384e : a0 00 __ LDY #$00
3850 : 84 07 __ STY WORK + 4 
3852 : 84 08 __ STY WORK + 5 
3854 : 84 09 __ STY WORK + 6 
3856 : 4a __ __ LSR
3857 : b0 0d __ BCS $3866 ; (mul32by8 + 24)
3859 : f0 26 __ BEQ $3881 ; (mul32by8 + 51)
385b : 06 1b __ ASL ACCU + 0 
385d : 26 1c __ ROL ACCU + 1 
385f : 26 1d __ ROL ACCU + 2 
3861 : 26 1e __ ROL ACCU + 3 
3863 : 4a __ __ LSR
3864 : 90 f5 __ BCC $385b ; (mul32by8 + 13)
3866 : aa __ __ TAX
3867 : 18 __ __ CLC
3868 : a5 07 __ LDA WORK + 4 
386a : 65 1b __ ADC ACCU + 0 
386c : 85 07 __ STA WORK + 4 
386e : a5 08 __ LDA WORK + 5 
3870 : 65 1c __ ADC ACCU + 1 
3872 : 85 08 __ STA WORK + 5 
3874 : a5 09 __ LDA WORK + 6 
3876 : 65 1d __ ADC ACCU + 2 
3878 : 85 09 __ STA WORK + 6 
387a : 98 __ __ TYA
387b : 65 1e __ ADC ACCU + 3 
387d : a8 __ __ TAY
387e : 8a __ __ TXA
387f : d0 da __ BNE $385b ; (mul32by8 + 13)
3881 : 84 0a __ STY WORK + 7 
3883 : 60 __ __ RTS
--------------------------------------------------------------------
divmod@proxy: ; divmod@proxy
3884 : a9 0a __ LDA #$0a
3886 : 85 03 __ STA WORK + 0 
3888 : a9 00 __ LDA #$00
388a : 85 04 __ STA WORK + 1 
--------------------------------------------------------------------
divmod: ; divmod
388c : a5 1c __ LDA ACCU + 1 
388e : d0 31 __ BNE $38c1 ; (divmod + 53)
3890 : a5 04 __ LDA WORK + 1 
3892 : d0 1e __ BNE $38b2 ; (divmod + 38)
3894 : 85 06 __ STA WORK + 3 
3896 : a2 04 __ LDX #$04
3898 : 06 1b __ ASL ACCU + 0 
389a : 2a __ __ ROL
389b : c5 03 __ CMP WORK + 0 
389d : 90 02 __ BCC $38a1 ; (divmod + 21)
389f : e5 03 __ SBC WORK + 0 
38a1 : 26 1b __ ROL ACCU + 0 
38a3 : 2a __ __ ROL
38a4 : c5 03 __ CMP WORK + 0 
38a6 : 90 02 __ BCC $38aa ; (divmod + 30)
38a8 : e5 03 __ SBC WORK + 0 
38aa : 26 1b __ ROL ACCU + 0 
38ac : ca __ __ DEX
38ad : d0 eb __ BNE $389a ; (divmod + 14)
38af : 85 05 __ STA WORK + 2 
38b1 : 60 __ __ RTS
38b2 : a5 1b __ LDA ACCU + 0 
38b4 : 85 05 __ STA WORK + 2 
38b6 : a5 1c __ LDA ACCU + 1 
38b8 : 85 06 __ STA WORK + 3 
38ba : a9 00 __ LDA #$00
38bc : 85 1b __ STA ACCU + 0 
38be : 85 1c __ STA ACCU + 1 
38c0 : 60 __ __ RTS
38c1 : a5 04 __ LDA WORK + 1 
38c3 : d0 1f __ BNE $38e4 ; (divmod + 88)
38c5 : a5 03 __ LDA WORK + 0 
38c7 : 30 1b __ BMI $38e4 ; (divmod + 88)
38c9 : a9 00 __ LDA #$00
38cb : 85 06 __ STA WORK + 3 
38cd : a2 10 __ LDX #$10
38cf : 06 1b __ ASL ACCU + 0 
38d1 : 26 1c __ ROL ACCU + 1 
38d3 : 2a __ __ ROL
38d4 : c5 03 __ CMP WORK + 0 
38d6 : 90 02 __ BCC $38da ; (divmod + 78)
38d8 : e5 03 __ SBC WORK + 0 
38da : 26 1b __ ROL ACCU + 0 
38dc : 26 1c __ ROL ACCU + 1 
38de : ca __ __ DEX
38df : d0 f2 __ BNE $38d3 ; (divmod + 71)
38e1 : 85 05 __ STA WORK + 2 
38e3 : 60 __ __ RTS
38e4 : a9 00 __ LDA #$00
38e6 : 85 05 __ STA WORK + 2 
38e8 : 85 06 __ STA WORK + 3 
38ea : 84 02 __ STY $02 
38ec : a0 10 __ LDY #$10
38ee : 18 __ __ CLC
38ef : 26 1b __ ROL ACCU + 0 
38f1 : 26 1c __ ROL ACCU + 1 
38f3 : 26 05 __ ROL WORK + 2 
38f5 : 26 06 __ ROL WORK + 3 
38f7 : 38 __ __ SEC
38f8 : a5 05 __ LDA WORK + 2 
38fa : e5 03 __ SBC WORK + 0 
38fc : aa __ __ TAX
38fd : a5 06 __ LDA WORK + 3 
38ff : e5 04 __ SBC WORK + 1 
3901 : 90 04 __ BCC $3907 ; (divmod + 123)
3903 : 86 05 __ STX WORK + 2 
3905 : 85 06 __ STA WORK + 3 
3907 : 88 __ __ DEY
3908 : d0 e5 __ BNE $38ef ; (divmod + 99)
390a : 26 1b __ ROL ACCU + 0 
390c : 26 1c __ ROL ACCU + 1 
390e : a4 02 __ LDY $02 
3910 : 60 __ __ RTS
--------------------------------------------------------------------
mul32: ; mul32
3911 : a5 04 __ LDA WORK + 1 
3913 : 05 05 __ ORA WORK + 2 
3915 : 05 06 __ ORA WORK + 3 
3917 : d0 05 __ BNE $391e ; (mul32 + 13)
3919 : a5 03 __ LDA WORK + 0 
391b : 4c 4e 38 JMP $384e ; (mul32by8 + 0)
391e : a0 00 __ LDY #$00
3920 : 84 07 __ STY WORK + 4 
3922 : 84 08 __ STY WORK + 5 
3924 : 98 __ __ TYA
3925 : 38 __ __ SEC
3926 : 66 03 __ ROR WORK + 0 
3928 : 90 15 __ BCC $393f ; (mul32 + 46)
392a : aa __ __ TAX
392b : 18 __ __ CLC
392c : a5 07 __ LDA WORK + 4 
392e : 65 1b __ ADC ACCU + 0 
3930 : 85 07 __ STA WORK + 4 
3932 : a5 08 __ LDA WORK + 5 
3934 : 65 1c __ ADC ACCU + 1 
3936 : 85 08 __ STA WORK + 5 
3938 : 98 __ __ TYA
3939 : 65 1d __ ADC ACCU + 2 
393b : a8 __ __ TAY
393c : 8a __ __ TXA
393d : 65 1e __ ADC ACCU + 3 
393f : 46 04 __ LSR WORK + 1 
3941 : 90 0f __ BCC $3952 ; (mul32 + 65)
3943 : aa __ __ TAX
3944 : 18 __ __ CLC
3945 : a5 08 __ LDA WORK + 5 
3947 : 65 1b __ ADC ACCU + 0 
3949 : 85 08 __ STA WORK + 5 
394b : 98 __ __ TYA
394c : 65 1c __ ADC ACCU + 1 
394e : a8 __ __ TAY
394f : 8a __ __ TXA
3950 : 65 1d __ ADC ACCU + 2 
3952 : 46 05 __ LSR WORK + 2 
3954 : 90 09 __ BCC $395f ; (mul32 + 78)
3956 : aa __ __ TAX
3957 : 18 __ __ CLC
3958 : 98 __ __ TYA
3959 : 65 1b __ ADC ACCU + 0 
395b : a8 __ __ TAY
395c : 8a __ __ TXA
395d : 65 1c __ ADC ACCU + 1 
395f : 46 06 __ LSR WORK + 3 
3961 : 90 03 __ BCC $3966 ; (mul32 + 85)
3963 : 18 __ __ CLC
3964 : 65 1b __ ADC ACCU + 0 
3966 : 06 1b __ ASL ACCU + 0 
3968 : 26 1c __ ROL ACCU + 1 
396a : 26 1d __ ROL ACCU + 2 
396c : 26 1e __ ROL ACCU + 3 
396e : 46 03 __ LSR WORK + 0 
3970 : 90 cd __ BCC $393f ; (mul32 + 46)
3972 : d0 b6 __ BNE $392a ; (mul32 + 25)
3974 : 84 09 __ STY WORK + 6 
3976 : 85 0a __ STA WORK + 7 
3978 : 60 __ __ RTS
--------------------------------------------------------------------
divs32: ; divs32
3979 : 24 1e __ BIT ACCU + 3 
397b : 10 0d __ BPL $398a ; (divs32 + 17)
397d : 20 94 39 JSR $3994 ; (negaccu32 + 0)
3980 : 24 06 __ BIT WORK + 3 
3982 : 10 0d __ BPL $3991 ; (divs32 + 24)
3984 : 20 ae 39 JSR $39ae ; (negtmp32 + 0)
3987 : 4c e6 39 JMP $39e6 ; (divmod32 + 0)
398a : 24 06 __ BIT WORK + 3 
398c : 10 f9 __ BPL $3987 ; (divs32 + 14)
398e : 20 ae 39 JSR $39ae ; (negtmp32 + 0)
3991 : 20 e6 39 JSR $39e6 ; (divmod32 + 0)
--------------------------------------------------------------------
negaccu32: ; negaccu32
3994 : 38 __ __ SEC
3995 : a9 00 __ LDA #$00
3997 : e5 1b __ SBC ACCU + 0 
3999 : 85 1b __ STA ACCU + 0 
399b : a9 00 __ LDA #$00
399d : e5 1c __ SBC ACCU + 1 
399f : 85 1c __ STA ACCU + 1 
39a1 : a9 00 __ LDA #$00
39a3 : e5 1d __ SBC ACCU + 2 
39a5 : 85 1d __ STA ACCU + 2 
39a7 : a9 00 __ LDA #$00
39a9 : e5 1e __ SBC ACCU + 3 
39ab : 85 1e __ STA ACCU + 3 
39ad : 60 __ __ RTS
--------------------------------------------------------------------
negtmp32: ; negtmp32
39ae : 38 __ __ SEC
39af : a9 00 __ LDA #$00
39b1 : e5 03 __ SBC WORK + 0 
39b3 : 85 03 __ STA WORK + 0 
39b5 : a9 00 __ LDA #$00
39b7 : e5 04 __ SBC WORK + 1 
39b9 : 85 04 __ STA WORK + 1 
39bb : a9 00 __ LDA #$00
39bd : e5 05 __ SBC WORK + 2 
39bf : 85 05 __ STA WORK + 2 
39c1 : a9 00 __ LDA #$00
39c3 : e5 06 __ SBC WORK + 3 
39c5 : 85 06 __ STA WORK + 3 
39c7 : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
39e6 : 84 02 __ STY $02 
39e8 : a0 20 __ LDY #$20
39ea : a9 00 __ LDA #$00
39ec : 85 07 __ STA WORK + 4 
39ee : 85 08 __ STA WORK + 5 
39f0 : 85 09 __ STA WORK + 6 
39f2 : 85 0a __ STA WORK + 7 
39f4 : a5 05 __ LDA WORK + 2 
39f6 : 05 06 __ ORA WORK + 3 
39f8 : d0 78 __ BNE $3a72 ; (divmod32 + 140)
39fa : a5 04 __ LDA WORK + 1 
39fc : d0 27 __ BNE $3a25 ; (divmod32 + 63)
39fe : 18 __ __ CLC
39ff : 26 1b __ ROL ACCU + 0 
3a01 : 26 1c __ ROL ACCU + 1 
3a03 : 26 1d __ ROL ACCU + 2 
3a05 : 26 1e __ ROL ACCU + 3 
3a07 : 2a __ __ ROL
3a08 : 90 05 __ BCC $3a0f ; (divmod32 + 41)
3a0a : e5 03 __ SBC WORK + 0 
3a0c : 38 __ __ SEC
3a0d : b0 06 __ BCS $3a15 ; (divmod32 + 47)
3a0f : c5 03 __ CMP WORK + 0 
3a11 : 90 02 __ BCC $3a15 ; (divmod32 + 47)
3a13 : e5 03 __ SBC WORK + 0 
3a15 : 88 __ __ DEY
3a16 : d0 e7 __ BNE $39ff ; (divmod32 + 25)
3a18 : 85 07 __ STA WORK + 4 
3a1a : 26 1b __ ROL ACCU + 0 
3a1c : 26 1c __ ROL ACCU + 1 
3a1e : 26 1d __ ROL ACCU + 2 
3a20 : 26 1e __ ROL ACCU + 3 
3a22 : a4 02 __ LDY $02 
3a24 : 60 __ __ RTS
3a25 : a5 1e __ LDA ACCU + 3 
3a27 : d0 10 __ BNE $3a39 ; (divmod32 + 83)
3a29 : a6 1d __ LDX ACCU + 2 
3a2b : 86 1e __ STX ACCU + 3 
3a2d : a6 1c __ LDX ACCU + 1 
3a2f : 86 1d __ STX ACCU + 2 
3a31 : a6 1b __ LDX ACCU + 0 
3a33 : 86 1c __ STX ACCU + 1 
3a35 : 85 1b __ STA ACCU + 0 
3a37 : a0 18 __ LDY #$18
3a39 : 18 __ __ CLC
3a3a : 26 1b __ ROL ACCU + 0 
3a3c : 26 1c __ ROL ACCU + 1 
3a3e : 26 1d __ ROL ACCU + 2 
3a40 : 26 1e __ ROL ACCU + 3 
3a42 : 26 07 __ ROL WORK + 4 
3a44 : 26 08 __ ROL WORK + 5 
3a46 : 90 0c __ BCC $3a54 ; (divmod32 + 110)
3a48 : a5 07 __ LDA WORK + 4 
3a4a : e5 03 __ SBC WORK + 0 
3a4c : aa __ __ TAX
3a4d : a5 08 __ LDA WORK + 5 
3a4f : e5 04 __ SBC WORK + 1 
3a51 : 38 __ __ SEC
3a52 : b0 0c __ BCS $3a60 ; (divmod32 + 122)
3a54 : 38 __ __ SEC
3a55 : a5 07 __ LDA WORK + 4 
3a57 : e5 03 __ SBC WORK + 0 
3a59 : aa __ __ TAX
3a5a : a5 08 __ LDA WORK + 5 
3a5c : e5 04 __ SBC WORK + 1 
3a5e : 90 04 __ BCC $3a64 ; (divmod32 + 126)
3a60 : 86 07 __ STX WORK + 4 
3a62 : 85 08 __ STA WORK + 5 
3a64 : 88 __ __ DEY
3a65 : d0 d3 __ BNE $3a3a ; (divmod32 + 84)
3a67 : 26 1b __ ROL ACCU + 0 
3a69 : 26 1c __ ROL ACCU + 1 
3a6b : 26 1d __ ROL ACCU + 2 
3a6d : 26 1e __ ROL ACCU + 3 
3a6f : a4 02 __ LDY $02 
3a71 : 60 __ __ RTS
3a72 : a0 10 __ LDY #$10
3a74 : a5 1e __ LDA ACCU + 3 
3a76 : 85 08 __ STA WORK + 5 
3a78 : a5 1d __ LDA ACCU + 2 
3a7a : 85 07 __ STA WORK + 4 
3a7c : a9 00 __ LDA #$00
3a7e : 85 1d __ STA ACCU + 2 
3a80 : 85 1e __ STA ACCU + 3 
3a82 : 18 __ __ CLC
3a83 : 26 1b __ ROL ACCU + 0 
3a85 : 26 1c __ ROL ACCU + 1 
3a87 : 26 07 __ ROL WORK + 4 
3a89 : 26 08 __ ROL WORK + 5 
3a8b : 26 09 __ ROL WORK + 6 
3a8d : 26 0a __ ROL WORK + 7 
3a8f : a5 07 __ LDA WORK + 4 
3a91 : c5 03 __ CMP WORK + 0 
3a93 : a5 08 __ LDA WORK + 5 
3a95 : e5 04 __ SBC WORK + 1 
3a97 : a5 09 __ LDA WORK + 6 
3a99 : e5 05 __ SBC WORK + 2 
3a9b : aa __ __ TAX
3a9c : a5 0a __ LDA WORK + 7 
3a9e : e5 06 __ SBC WORK + 3 
3aa0 : 90 11 __ BCC $3ab3 ; (divmod32 + 205)
3aa2 : 86 09 __ STX WORK + 6 
3aa4 : 85 0a __ STA WORK + 7 
3aa6 : a5 07 __ LDA WORK + 4 
3aa8 : e5 03 __ SBC WORK + 0 
3aaa : 85 07 __ STA WORK + 4 
3aac : a5 08 __ LDA WORK + 5 
3aae : e5 04 __ SBC WORK + 1 
3ab0 : 85 08 __ STA WORK + 5 
3ab2 : 38 __ __ SEC
3ab3 : 88 __ __ DEY
3ab4 : d0 cd __ BNE $3a83 ; (divmod32 + 157)
3ab6 : 26 1b __ ROL ACCU + 0 
3ab8 : 26 1c __ ROL ACCU + 1 
3aba : a4 02 __ LDY $02 
3abc : 60 __ __ RTS
--------------------------------------------------------------------
__multab32L:
3abd : __ __ __ BYT 00 20 40 60 80 a0                               : . @`..
--------------------------------------------------------------------
MissileSprites:
3ac3 : __ __ __ BYT 00 60 00 00 60 00 00 60 00 00 60 00 00 60 00 00 : .`..`..`..`..`..
3ad3 : __ __ __ BYT 60 00 00 60 00 00 60 00 00 00 00 ff 0f f0 ff 0f : `..`..`.........
3ae3 : __ __ __ BYT f0 00 00 00 00 60 00 00 60 00 00 60 00 00 60 00 : .....`..`..`..`.
3af3 : __ __ __ BYT 00 60 00 00 60 00 00 60 00 00 60 00 00 00 00 01 : .`..`..`..`.....
3b03 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b13 : __ __ __ BYT 00 00 00 00 40 00 00 40 00 00 40 20 00 c0 20 00 : ....@..@..@ .. .
3b23 : __ __ __ BYT c4 30 72 e4 30 fa e4 31 fe ec 7b ff fc 7b ff fe : .0r.0..1..{..{..
3b33 : __ __ __ BYT ff ff fe ff ff ff ff ff ff ff ff ff ff ff ff 01 : ................
3b43 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b53 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b63 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b73 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3b83 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3b93 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ba3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bb3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3bc3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bd3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3be3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3bf3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3c03 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c13 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c23 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c33 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3c43 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c53 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c63 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c73 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3c83 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3c93 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ca3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cb3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3cc3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cd3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ce3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3cf3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3d03 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d13 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d23 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d33 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3d43 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d53 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d63 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d73 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3d83 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3d93 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3da3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3db3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3dc3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3dd3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3de3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3df3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3e03 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e13 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e23 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e33 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3e43 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e53 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e63 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e73 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
3e83 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3e93 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3ea3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
3eb3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 85 : ................
--------------------------------------------------------------------
MissileChars:
3ec3 : __ __ __ BYT 3c 66 6e 6e 60 62 3c 00 00 00 3c 06 3e 66 3e 00 : <fnn`b<...<.>f>.
3ed3 : __ __ __ BYT 00 60 60 7c 66 66 7c 00 00 00 3c 60 60 60 3c 00 : .``|ff|...<```<.
3ee3 : __ __ __ BYT 00 06 06 3e 66 66 3e 00 00 00 3c 66 7e 60 3c 00 : ...>ff>...<f~`<.
3ef3 : __ __ __ BYT 00 0e 18 3e 18 18 18 00 00 00 3e 66 66 3e 06 7c : ...>......>ff>.|
3f03 : __ __ __ BYT 00 60 60 7c 66 66 66 00 00 18 00 38 18 18 3c 00 : .``|fff....8..<.
3f13 : __ __ __ BYT 00 06 00 06 06 06 06 3c 00 60 60 6c 78 6c 66 00 : .......<.``lxlf.
3f23 : __ __ __ BYT 00 38 18 18 18 18 3c 00 00 00 66 7f 7f 6b 63 00 : .8....<...f..kc.
3f33 : __ __ __ BYT 00 00 7c 66 66 66 66 00 00 00 3c 66 66 66 3c 00 : ..|ffff...<fff<.
3f43 : __ __ __ BYT 00 00 7c 66 66 7c 60 60 00 00 3e 66 66 3e 06 06 : ..|ff|``..>ff>..
3f53 : __ __ __ BYT 00 00 7c 66 60 60 60 00 00 00 3e 60 3c 06 7c 00 : ..|f```...>`<.|.
3f63 : __ __ __ BYT 00 18 7e 18 18 18 0e 00 00 00 66 66 66 66 3e 00 : ..~.......ffff>.
3f73 : __ __ __ BYT 00 00 66 66 66 3c 18 00 00 00 63 6b 7f 3e 36 00 : ..fff<....ck.>6.
3f83 : __ __ __ BYT 00 00 66 3c 18 3c 66 00 00 00 66 66 66 3e 0c 78 : ..f<.<f...fff>.x
3f93 : __ __ __ BYT 00 00 7e 0c 18 30 7e 00 3c 30 30 30 30 30 3c 00 : ..~..0~.<00000<.
3fa3 : __ __ __ BYT 0c 12 30 7c 30 62 fc 00 3c 0c 0c 0c 0c 0c 3c 00 : ..0|0b..<.....<.
3fb3 : __ __ __ BYT 00 18 3c 7e 18 18 18 18 00 10 30 7f 7f 30 10 00 : ..<~......0..0..
3fc3 : __ __ __ BYT 00 00 00 00 00 00 00 00 18 18 18 18 00 00 18 00 : ................
3fd3 : __ __ __ BYT 66 66 66 00 00 00 00 00 66 66 ff 66 ff 66 66 00 : fff.....ff.f.ff.
3fe3 : __ __ __ BYT 18 3e 60 3c 06 7c 18 00 62 66 0c 18 30 66 46 00 : .>`<.|..bf..0fF.
3ff3 : __ __ __ BYT 3c 66 3c 38 67 66 3f 00 06 0c 18 00 00 00 00 00 : <f<8gf?.........
4003 : __ __ __ BYT 0c 18 30 30 30 18 0c 00 30 18 0c 0c 0c 18 30 00 : ..000...0.....0.
4013 : __ __ __ BYT 00 66 3c ff 3c 66 00 00 00 18 18 7e 18 18 00 00 : .f<.<f.....~....
4023 : __ __ __ BYT 00 00 00 00 00 18 18 30 00 00 00 7e 00 00 00 00 : .......0...~....
4033 : __ __ __ BYT 00 00 00 00 00 18 18 00 00 03 06 0c 18 30 60 00 : .............0`.
4043 : __ __ __ BYT 3c 66 6e 76 66 66 3c 00 18 18 38 18 18 18 7e 00 : <fnvff<...8...~.
4053 : __ __ __ BYT 3c 66 06 0c 30 60 7e 00 3c 66 06 1c 06 66 3c 00 : <f..0`~.<f...f<.
4063 : __ __ __ BYT 06 0e 1e 66 7f 06 06 00 7e 60 7c 06 06 66 3c 00 : ...f....~`|..f<.
4073 : __ __ __ BYT 3c 66 60 7c 66 66 3c 00 7e 66 0c 18 18 18 18 00 : <f`|ff<.~f......
4083 : __ __ __ BYT 3c 66 66 3c 66 66 3c 00 3c 66 66 3e 06 66 3c 00 : <ff<ff<.<ff>.f<.
4093 : __ __ __ BYT 00 00 18 00 00 18 00 00 00 00 18 00 00 18 18 30 : ...............0
40a3 : __ __ __ BYT 0e 18 30 60 30 18 0e 00 00 00 7e 00 7e 00 00 00 : ..0`0.....~.~...
40b3 : __ __ __ BYT 70 18 0c 06 0c 18 70 00 3c 66 06 0c 18 00 18 00 : p.....p.<f......
40c3 : __ __ __ BYT 00 00 00 ff ff 00 00 00 18 3c 66 7e 66 66 66 00 : .........<f~fff.
40d3 : __ __ __ BYT 7c 66 66 7c 66 66 7c 00 3c 66 60 60 60 66 3c 00 : |ff|ff|.<f```f<.
40e3 : __ __ __ BYT 78 6c 66 66 66 6c 78 00 7e 60 60 78 60 60 7e 00 : xlffflx.~``x``~.
40f3 : __ __ __ BYT 7e 60 60 78 60 60 60 00 3c 66 60 6e 66 66 3c 00 : ~``x```.<f`nff<.
4103 : __ __ __ BYT 66 66 66 7e 66 66 66 00 3c 18 18 18 18 18 3c 00 : fff~fff.<.....<.
4113 : __ __ __ BYT 1e 0c 0c 0c 0c 6c 38 00 66 6c 78 70 78 6c 66 00 : .....l8.flxpxlf.
4123 : __ __ __ BYT 60 60 60 60 60 60 7e 00 63 77 7f 6b 63 63 63 00 : ``````~.cw.kccc.
4133 : __ __ __ BYT 66 76 7e 7e 6e 66 66 00 3c 66 66 66 66 66 3c 00 : fv~~nff.<fffff<.
4143 : __ __ __ BYT 7c 66 66 7c 60 60 60 00 3c 66 66 66 66 3c 0e 00 : |ff|```.<ffff<..
4153 : __ __ __ BYT 7c 66 66 7c 78 6c 66 00 3c 66 60 3c 06 66 3c 00 : |ff|xlf.<f`<.f<.
4163 : __ __ __ BYT 7e 18 18 18 18 18 18 00 66 66 66 66 66 66 3c 00 : ~.......ffffff<.
4173 : __ __ __ BYT 66 66 66 66 66 3c 18 00 63 63 63 6b 7f 77 63 00 : fffff<..ccck.wc.
4183 : __ __ __ BYT 66 66 3c 18 3c 66 66 00 66 66 66 3c 18 18 18 00 : ff<.<ff.fff<....
4193 : __ __ __ BYT 7e 06 0c 18 30 60 7e 00 18 18 18 ff ff 18 18 18 : ~...0`~.........
41a3 : __ __ __ BYT 44 aa ee ee ee 44 ee aa 40 a0 e0 e0 e0 40 e0 a0 : D....D..@....@..
41b3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
--------------------------------------------------------------------
CrossX:
41c3 : __ __ __ BYT a0 00                                           : ..
--------------------------------------------------------------------
CrossY:
41c5 : __ __ __ BYT 64 00                                           : d.
--------------------------------------------------------------------
CrossP:
41c7 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
lmask:
41c8 : __ __ __ BYT ff 7f 3f 1f 0f 07 03 01                         : ..?.....
--------------------------------------------------------------------
rmask:
41d0 : __ __ __ BYT 00 80 c0 e0 f0 f8 fc fe                         : ........
--------------------------------------------------------------------
cbytes:
41d8 : __ __ __ BYT 00 55 aa ff                                     : .U..
--------------------------------------------------------------------
andmask:
41dc : __ __ __ BYT 3f 3f cf cf f3 f3 fc fc                         : ??......
--------------------------------------------------------------------
seed:
41e4 : __ __ __ BYT 00 7a                                           : .z
--------------------------------------------------------------------
ormask:
41e6 : __ __ __ BYT c0 c0 30 30 0c 0c 03 03                         : ..00....
--------------------------------------------------------------------
rasterIRQRows:
41ee : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
41ff : __ __ __ BSS	1
--------------------------------------------------------------------
MixedColors:
4200 : __ __ __ BYT 00 00 00 00 00 00 00 00 11 44 11 44 11 44 11 44 : .........D.D.D.D
4210 : __ __ __ BYT 22 88 22 88 22 88 22 88 33 cc 33 cc 33 cc 33 cc : ".".".".3.3.3.3.
4220 : __ __ __ BYT 44 11 44 11 44 11 44 11 55 55 55 55 55 55 55 55 : D.D.D.D.UUUUUUUU
4230 : __ __ __ BYT 66 99 66 99 66 99 66 99 77 dd 77 dd 77 dd 77 dd : f.f.f.f.w.w.w.w.
4240 : __ __ __ BYT 88 22 88 22 88 22 88 22 99 66 99 66 99 66 99 66 : .".".".".f.f.f.f
4250 : __ __ __ BYT aa aa aa aa aa aa aa aa bb ee bb ee bb ee bb ee : ................
4260 : __ __ __ BYT cc 33 cc 33 cc 33 cc 33 dd 77 dd 77 dd 77 dd 77 : .3.3.3.3.w.w.w.w
4270 : __ __ __ BYT ee bb ee bb ee bb ee bb ff ff ff ff ff ff ff ff : ................
--------------------------------------------------------------------
bitshift:
4280 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
4290 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
42a0 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
42b0 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
rasterIRQIndex:
42b8 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
42c9 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQLow:
42da : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
42ea : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_count:
42fa : __ __ __ BSS	1
--------------------------------------------------------------------
vspriteScreen:
42fb : __ __ __ BSS	2
--------------------------------------------------------------------
sbm:
42fd : __ __ __ BSS	8
--------------------------------------------------------------------
top:
4305 : __ __ __ BSS	32
--------------------------------------------------------------------
bottom:
4325 : __ __ __ BSS	32
--------------------------------------------------------------------
joyy:
4345 : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
4347 : __ __ __ BSS	2
--------------------------------------------------------------------
rirq_pcount:
4349 : __ __ __ BSS	1
--------------------------------------------------------------------
TheGame:
434a : __ __ __ BSS	3
--------------------------------------------------------------------
cities:
434d : __ __ __ BSS	6
--------------------------------------------------------------------
ncities:
4353 : __ __ __ BSS	1
--------------------------------------------------------------------
cbuffer:
4354 : __ __ __ BSS	10
--------------------------------------------------------------------
mused:
435e : __ __ __ BSS	2
--------------------------------------------------------------------
mfree:
4360 : __ __ __ BSS	2
--------------------------------------------------------------------
explosions:
4362 : __ __ __ BSS	112
--------------------------------------------------------------------
nmissiles:
43d2 : __ __ __ BSS	1
--------------------------------------------------------------------
icbmspeed:
43d3 : __ __ __ BSS	1
--------------------------------------------------------------------
icbmcount:
43d4 : __ __ __ BSS	1
--------------------------------------------------------------------
BLIT_CODE:
4400 : __ __ __ BSS	224
--------------------------------------------------------------------
missiles:
4500 : __ __ __ BSS	176
--------------------------------------------------------------------
icbms:
45b0 : __ __ __ BSS	352
