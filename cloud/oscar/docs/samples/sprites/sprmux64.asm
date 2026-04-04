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
080e : 8e 6d 0e STX $0e6d ; (spentry + 0)
0811 : a2 28 __ LDX #$28
0813 : a0 00 __ LDY #$00
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 2a __ CPX #$2a
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
; 136, "/home/honza/projects/c64/projects/oscar64/samples/sprites/sprmux64.c"
.s4:
0a00 : 20 ca 0a JSR $0aca ; (rirq_init_kernal.s4 + 0)
0a03 : a9 80 __ LDA #$80
0a05 : a2 07 __ LDX #$07
.l8:
0a07 : 9d f8 07 STA $07f8,x 
0a0a : ca __ __ DEX
0a0b : 10 fa __ BPL $0a07 ; (main.l8 + 0)
.s9:
0a0d : a9 ff __ LDA #$ff
0a0f : 8d 15 d0 STA $d015 
0a12 : 8d 1c d0 STA $d01c 
0a15 : a9 00 __ LDA #$00
0a17 : 8d 1d d0 STA $d01d 
0a1a : 8d 17 d0 STA $d017 
0a1d : 8d 25 d0 STA $d025 
0a20 : 85 46 __ STA T14 + 0 
0a22 : 85 45 __ STA T12 + 0 
0a24 : a9 01 __ LDA #$01
0a26 : 8d 26 d0 STA $d026 
0a29 : a9 24 __ LDA #$24
0a2b : 85 43 __ STA T10 + 0 
0a2d : a9 34 __ LDA #$34
0a2f : 85 44 __ STA T11 + 0 
0a31 : a9 03 __ LDA #$03
0a33 : 85 0f __ STA P2 
0a35 : a9 00 __ LDA #$00
0a37 : 85 0d __ STA P0 
0a39 : a9 29 __ LDA #$29
0a3b : 85 0e __ STA P1 
.l10:
0a3d : 20 66 0b JSR $0b66 ; (rirq_build.s4 + 0)
0a40 : a5 45 __ LDA T12 + 0 
0a42 : a0 02 __ LDY #$02
0a44 : 91 0d __ STA (P0),y 
0a46 : a5 44 __ LDA T11 + 0 
0a48 : a0 04 __ LDY #$04
0a4a : 91 0d __ STA (P0),y 
0a4c : a9 55 __ LDA #$55
0a4e : a0 0b __ LDY #$0b
0a50 : 91 0d __ STA (P0),y 
0a52 : a9 28 __ LDA #$28
0a54 : c8 __ __ INY
0a55 : 91 0d __ STA (P0),y 
0a57 : a9 56 __ LDA #$56
0a59 : a0 0e __ LDY #$0e
0a5b : 91 0d __ STA (P0),y 
0a5d : a9 28 __ LDA #$28
0a5f : c8 __ __ INY
0a60 : 91 0d __ STA (P0),y 
0a62 : a9 20 __ LDA #$20
0a64 : a0 12 __ LDY #$12
0a66 : 91 0d __ STA (P0),y 
0a68 : a9 0a __ LDA #$0a
0a6a : c8 __ __ INY
0a6b : 91 0d __ STA (P0),y 
0a6d : a9 0c __ LDA #$0c
0a6f : c8 __ __ INY
0a70 : 91 0d __ STA (P0),y 
0a72 : 18 __ __ CLC
0a73 : a5 0d __ LDA P0 
0a75 : 69 01 __ ADC #$01
0a77 : a6 46 __ LDX T14 + 0 
0a79 : 9d 34 28 STA $2834,x ; (rasterIRQLow[0] + 0)
0a7c : a5 0e __ LDA P1 
0a7e : 69 00 __ ADC #$00
0a80 : 9d 44 28 STA $2844,x ; (rasterIRQHigh[0] + 0)
0a83 : a5 43 __ LDA T10 + 0 
0a85 : 9d 00 28 STA $2800,x ; (rasterIRQRows[0] + 0)
0a88 : 18 __ __ CLC
0a89 : 69 19 __ ADC #$19
0a8b : 85 43 __ STA T10 + 0 
0a8d : 18 __ __ CLC
0a8e : a5 45 __ LDA T12 + 0 
0a90 : 69 0b __ ADC #$0b
0a92 : 85 45 __ STA T12 + 0 
0a94 : 18 __ __ CLC
0a95 : a5 44 __ LDA T11 + 0 
0a97 : 69 19 __ ADC #$19
0a99 : 85 44 __ STA T11 + 0 
0a9b : 18 __ __ CLC
0a9c : a5 0d __ LDA P0 
0a9e : 69 20 __ ADC #$20
0aa0 : 85 0d __ STA P0 
0aa2 : 90 02 __ BCC $0aa6 ; (main.s13 + 0)
.s12:
0aa4 : e6 0e __ INC P1 
.s13:
0aa6 : e8 __ __ INX
0aa7 : 86 46 __ STX T14 + 0 
0aa9 : e0 08 __ CPX #$08
0aab : 90 90 __ BCC $0a3d ; (main.l10 + 0)
.s11:
0aad : a9 00 __ LDA #$00
0aaf : 20 d2 0d JSR $0dd2 ; (rirq_sort.s4 + 0)
0ab2 : 20 5b 0e JSR $0e5b ; (rirq_start.s4 + 0)
.l5:
0ab5 : ad 57 28 LDA $2857 ; (pphase + 0)
0ab8 : 18 __ __ CLC
0ab9 : 69 05 __ ADC #$05
0abb : 8d 57 28 STA $2857 ; (pphase + 0)
.l6:
0abe : 2c 11 d0 BIT $d011 
0ac1 : 30 fb __ BMI $0abe ; (main.l6 + 0)
.l7:
0ac3 : 2c 11 d0 BIT $d011 
0ac6 : 10 fb __ BPL $0ac3 ; (main.l7 + 0)
0ac8 : 30 eb __ BMI $0ab5 ; (main.l5 + 0)
--------------------------------------------------------------------
rirq_init_kernal: ; rirq_init_kernal()->void
; 161, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0aca : 20 eb 0a JSR $0aeb ; (rirq_init_tables.s4 + 0)
0acd : 78 __ __ SEI
0ace : a9 01 __ LDA #$01
0ad0 : 8d 1a d0 STA $d01a 
0ad3 : a9 09 __ LDA #$09
0ad5 : 8d 14 03 STA $0314 
0ad8 : a9 0b __ LDA #$0b
0ada : 8d 15 03 STA $0315 
0add : ad 11 d0 LDA $d011 
0ae0 : 29 7f __ AND #$7f
0ae2 : 8d 11 d0 STA $d011 
0ae5 : a9 ff __ LDA #$ff
0ae7 : 8d 12 d0 STA $d012 
.s3:
0aea : 60 __ __ RTS
--------------------------------------------------------------------
rirq_init_tables: ; rirq_init_tables()->void
; 482, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.c"
.s4:
0aeb : a2 00 __ LDX #$00
.l5:
0aed : a9 ff __ LDA #$ff
0aef : 9d 00 28 STA $2800,x ; (rasterIRQRows[0] + 0)
0af2 : 8a __ __ TXA
0af3 : 9d 12 28 STA $2812,x ; (rasterIRQIndex[0] + 1)
0af6 : e8 __ __ INX
0af7 : e0 10 __ CPX #$10
0af9 : d0 f2 __ BNE $0aed ; (rirq_init_tables.l5 + 0)
.s6:
0afb : 8e 11 28 STX $2811 ; (rasterIRQIndex[0] + 0)
0afe : a9 ff __ LDA #$ff
0b00 : 8d 32 28 STA $2832 ; (rasterIRQNext[0] + 16)
0b03 : a9 00 __ LDA #$00
0b05 : 8d 10 28 STA $2810 ; (rasterIRQRows[0] + 16)
.s3:
0b08 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_isr_kernal_io: ; rirq_isr_kernal_io
0b09 : ad 19 d0 LDA $d019 
0b0c : 10 51 __ BPL $0b5f ; (rirq_isr_kernal_io + 86)
0b0e : ae 33 28 LDX $2833 ; (nextIRQ + 0)
0b11 : 30 33 __ BMI $0b46 ; (rirq_isr_kernal_io + 61)
0b13 : bd 22 28 LDA $2822,x ; (rasterIRQNext[0] + 0)
0b16 : bc 12 28 LDY $2812,x ; (rasterIRQIndex[0] + 1)
0b19 : be 34 28 LDX $2834,y ; (rasterIRQLow[0] + 0)
0b1c : 8e 26 0b STX $0b26 ; (rirq_isr_kernal_io + 29)
0b1f : be 44 28 LDX $2844,y ; (rasterIRQHigh[0] + 0)
0b22 : 8e 27 0b STX $0b27 ; (rirq_isr_kernal_io + 30)
0b25 : 20 00 00 JSR $0000 
0b28 : ee 33 28 INC $2833 ; (nextIRQ + 0)
0b2b : ae 33 28 LDX $2833 ; (nextIRQ + 0)
0b2e : bc 22 28 LDY $2822,x ; (rasterIRQNext[0] + 0)
0b31 : 0e 19 d0 ASL $d019 
0b34 : c0 ff __ CPY #$ff
0b36 : f0 14 __ BEQ $0b4c ; (rirq_isr_kernal_io + 67)
0b38 : 88 __ __ DEY
0b39 : 88 __ __ DEY
0b3a : 8c 12 d0 STY $d012 
0b3d : 88 __ __ DEY
0b3e : cc 12 d0 CPY $d012 
0b41 : 90 d0 __ BCC $0b13 ; (rirq_isr_kernal_io + 10)
0b43 : 4c 81 ea JMP $ea81 
0b46 : 0e 19 d0 ASL $d019 
0b49 : 4c 81 ea JMP $ea81 
0b4c : ee 54 28 INC $2854 ; (rirq_count + 0)
0b4f : ac 22 28 LDY $2822 ; (rasterIRQNext[0] + 0)
0b52 : 88 __ __ DEY
0b53 : 88 __ __ DEY
0b54 : 8c 12 d0 STY $d012 
0b57 : a2 00 __ LDX #$00
0b59 : 8e 33 28 STX $2833 ; (nextIRQ + 0)
0b5c : 4c 81 ea JMP $ea81 
0b5f : ad 0d dc LDA $dc0d 
0b62 : 58 __ __ CLI
0b63 : 4c 31 ea JMP $ea31 
--------------------------------------------------------------------
rirq_build: ; rirq_build(struct RIRQCode*,u8)->void
; 120, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0b66 : a5 0d __ LDA P0 ; (ic + 0)
0b68 : 85 1b __ STA ACCU + 0 
0b6a : a5 0e __ LDA P1 ; (ic + 1)
0b6c : 85 1c __ STA ACCU + 1 
0b6e : a9 a0 __ LDA #$a0
0b70 : a0 01 __ LDY #$01
0b72 : 91 0d __ STA (P0),y ; (ic + 0)
0b74 : a9 00 __ LDA #$00
0b76 : c8 __ __ INY
0b77 : 91 0d __ STA (P0),y ; (ic + 0)
0b79 : a9 a2 __ LDA #$a2
0b7b : c8 __ __ INY
0b7c : 91 0d __ STA (P0),y ; (ic + 0)
0b7e : a9 00 __ LDA #$00
0b80 : c8 __ __ INY
0b81 : 91 0d __ STA (P0),y ; (ic + 0)
0b83 : a9 cd __ LDA #$cd
0b85 : c8 __ __ INY
0b86 : 91 0d __ STA (P0),y ; (ic + 0)
0b88 : a9 12 __ LDA #$12
0b8a : c8 __ __ INY
0b8b : 91 0d __ STA (P0),y ; (ic + 0)
0b8d : a9 d0 __ LDA #$d0
0b8f : c8 __ __ INY
0b90 : 91 0d __ STA (P0),y ; (ic + 0)
0b92 : a9 b0 __ LDA #$b0
0b94 : c8 __ __ INY
0b95 : 91 0d __ STA (P0),y ; (ic + 0)
0b97 : a9 fb __ LDA #$fb
0b99 : c8 __ __ INY
0b9a : 91 0d __ STA (P0),y ; (ic + 0)
0b9c : a9 8c __ LDA #$8c
0b9e : c8 __ __ INY
0b9f : 91 0d __ STA (P0),y ; (ic + 0)
0ba1 : a9 00 __ LDA #$00
0ba3 : c8 __ __ INY
0ba4 : 91 0d __ STA (P0),y ; (ic + 0)
0ba6 : c8 __ __ INY
0ba7 : 91 0d __ STA (P0),y ; (ic + 0)
0ba9 : a8 __ __ TAY
0baa : a5 0f __ LDA P2 ; (size + 0)
0bac : 91 0d __ STA (P0),y ; (ic + 0)
0bae : f0 53 __ BEQ $0c03 ; (rirq_build.s5 + 0)
.s6:
0bb0 : a0 0d __ LDY #$0d
0bb2 : c9 01 __ CMP #$01
0bb4 : d0 05 __ BNE $0bbb ; (rirq_build.s7 + 0)
.s10:
0bb6 : a9 60 __ LDA #$60
0bb8 : 91 0d __ STA (P0),y ; (ic + 0)
.s3:
0bba : 60 __ __ RTS
.s7:
0bbb : a9 8e __ LDA #$8e
0bbd : 91 0d __ STA (P0),y ; (ic + 0)
0bbf : a9 00 __ LDA #$00
0bc1 : c8 __ __ INY
0bc2 : 91 0d __ STA (P0),y ; (ic + 0)
0bc4 : c8 __ __ INY
0bc5 : 91 0d __ STA (P0),y ; (ic + 0)
0bc7 : a5 0f __ LDA P2 ; (size + 0)
0bc9 : c9 03 __ CMP #$03
0bcb : 90 2a __ BCC $0bf7 ; (rirq_build.s8 + 0)
.s9:
0bcd : e9 02 __ SBC #$02
0bcf : aa __ __ TAX
0bd0 : 18 __ __ CLC
0bd1 : a5 0d __ LDA P0 ; (ic + 0)
0bd3 : 69 01 __ ADC #$01
0bd5 : 85 1b __ STA ACCU + 0 
0bd7 : a5 0e __ LDA P1 ; (ic + 1)
0bd9 : 69 00 __ ADC #$00
0bdb : 85 1c __ STA ACCU + 1 
.l11:
0bdd : a9 a9 __ LDA #$a9
0bdf : 91 1b __ STA (ACCU + 0),y 
0be1 : a9 00 __ LDA #$00
0be3 : c8 __ __ INY
0be4 : 91 1b __ STA (ACCU + 0),y 
0be6 : a9 8d __ LDA #$8d
0be8 : c8 __ __ INY
0be9 : 91 1b __ STA (ACCU + 0),y 
0beb : a9 00 __ LDA #$00
0bed : c8 __ __ INY
0bee : 91 1b __ STA (ACCU + 0),y 
0bf0 : c8 __ __ INY
0bf1 : 91 1b __ STA (ACCU + 0),y 
0bf3 : c8 __ __ INY
0bf4 : ca __ __ DEX
0bf5 : d0 e6 __ BNE $0bdd ; (rirq_build.l11 + 0)
.s8:
0bf7 : 98 __ __ TYA
0bf8 : 18 __ __ CLC
0bf9 : 65 0d __ ADC P0 ; (ic + 0)
0bfb : 85 1b __ STA ACCU + 0 
0bfd : a5 0e __ LDA P1 ; (ic + 1)
0bff : 69 00 __ ADC #$00
0c01 : 85 1c __ STA ACCU + 1 
.s5:
0c03 : a9 60 __ LDA #$60
0c05 : a0 01 __ LDY #$01
0c07 : 91 1b __ STA (ACCU + 0),y 
0c09 : 60 __ __ RTS
--------------------------------------------------------------------
setspr: ; setspr()->void
;  53, "/home/honza/projects/c64/projects/oscar64/samples/sprites/sprmux64.c"
.s1:
0c0a : a5 0d __ LDA P0 
0c0c : 48 __ __ PHA
0c0d : a5 0e __ LDA P1 
0c0f : 48 __ __ PHA
0c10 : a5 1b __ LDA ACCU + 0 
0c12 : 48 __ __ PHA
0c13 : a5 1c __ LDA ACCU + 1 
0c15 : 48 __ __ PHA
0c16 : a5 43 __ LDA T0 + 0 
0c18 : 48 __ __ PHA
0c19 : a5 44 __ LDA T0 + 1 
0c1b : 48 __ __ PHA
0c1c : a5 46 __ LDA T2 + 1 
0c1e : 48 __ __ PHA
0c1f : a5 47 __ LDA T3 + 0 
0c21 : 48 __ __ PHA
0c22 : a5 48 __ LDA T4 + 0 
0c24 : 48 __ __ PHA
0c25 : a5 49 __ LDA T5 + 0 
0c27 : 48 __ __ PHA
0c28 : a5 4a __ LDA T6 + 0 
0c2a : 48 __ __ PHA
0c2b : a5 4b __ LDA T7 + 0 
0c2d : 48 __ __ PHA
0c2e : a5 4c __ LDA T8 + 0 
0c30 : 48 __ __ PHA
0c31 : a5 4d __ LDA T9 + 0 
0c33 : 48 __ __ PHA
0c34 : a5 4e __ LDA T10 + 0 
0c36 : 48 __ __ PHA
0c37 : a5 4f __ LDA T11 + 0 
0c39 : 48 __ __ PHA
.s4:
0c3a : ad 56 28 LDA $2856 ; (yoffset + 0)
0c3d : 8d 01 d0 STA $d001 
0c40 : 8d 03 d0 STA $d003 
0c43 : 8d 05 d0 STA $d005 
0c46 : 8d 07 d0 STA $d007 
0c49 : 8d 09 d0 STA $d009 
0c4c : 8d 0b d0 STA $d00b 
0c4f : 8d 0d d0 STA $d00d 
0c52 : 8d 0f d0 STA $d00f 
0c55 : ad 55 28 LDA $2855 ; (poffset + 0)
0c58 : 18 __ __ CLC
0c59 : 6d 57 28 ADC $2857 ; (pphase + 0)
0c5c : a8 __ __ TAY
0c5d : b9 00 0f LDA $0f00,y ; (costab[0] + 0)
0c60 : 85 1b __ STA ACCU + 0 
0c62 : 29 80 __ AND #$80
0c64 : 10 02 __ BPL $0c68 ; (setspr.s4 + 46)
0c66 : a9 ff __ LDA #$ff
0c68 : 85 1c __ STA ACCU + 1 
0c6a : a5 1b __ LDA ACCU + 0 
0c6c : c9 80 __ CMP #$80
0c6e : 6a __ __ ROR
0c6f : aa __ __ TAX
0c70 : 49 ff __ EOR #$ff
0c72 : 18 __ __ CLC
0c73 : 69 ad __ ADC #$ad
0c75 : 85 47 __ STA T3 + 0 
0c77 : 38 __ __ SEC
0c78 : e5 1b __ SBC ACCU + 0 
0c7a : 85 49 __ STA T5 + 0 
0c7c : 38 __ __ SEC
0c7d : e5 1b __ SBC ACCU + 0 
0c7f : 85 4b __ STA T7 + 0 
0c81 : 38 __ __ SEC
0c82 : e5 1b __ SBC ACCU + 0 
0c84 : 85 4d __ STA T9 + 0 
0c86 : a9 00 __ LDA #$00
0c88 : e5 1c __ SBC ACCU + 1 
0c8a : 85 46 __ STA T2 + 1 
0c8c : 8a __ __ TXA
0c8d : 18 __ __ CLC
0c8e : 69 ac __ ADC #$ac
0c90 : 85 48 __ STA T4 + 0 
0c92 : 18 __ __ CLC
0c93 : 65 1b __ ADC ACCU + 0 
0c95 : 85 4a __ STA T6 + 0 
0c97 : 18 __ __ CLC
0c98 : 65 1b __ ADC ACCU + 0 
0c9a : 85 4c __ STA T8 + 0 
0c9c : 18 __ __ CLC
0c9d : 65 1b __ ADC ACCU + 0 
0c9f : 85 4e __ STA T10 + 0 
0ca1 : a5 1b __ LDA ACCU + 0 
0ca3 : 49 80 __ EOR #$80
0ca5 : 2a __ __ ROL
0ca6 : 29 01 __ AND #$01
0ca8 : e9 00 __ SBC #$00
0caa : 85 1c __ STA ACCU + 1 
0cac : ad 56 28 LDA $2856 ; (yoffset + 0)
0caf : 38 __ __ SEC
0cb0 : e9 03 __ SBC #$03
0cb2 : 85 0d __ STA P0 
0cb4 : a9 00 __ LDA #$00
0cb6 : e9 00 __ SBC #$00
0cb8 : 85 0e __ STA P1 
0cba : 98 __ __ TYA
0cbb : 29 80 __ AND #$80
0cbd : 85 4f __ STA T11 + 0 
0cbf : d0 0d __ BNE $0cce ; (setspr.s9 + 0)
.s5:
0cc1 : 46 1c __ LSR ACCU + 1 
0cc3 : a9 00 __ LDA #$00
0cc5 : 2a __ __ ROL
0cc6 : 2a __ __ ROL
0cc7 : 85 43 __ STA T0 + 0 
0cc9 : a5 46 __ LDA T2 + 1 
0ccb : 4c d8 0c JMP $0cd8 ; (setspr.s6 + 0)
.s9:
0cce : 46 46 __ LSR T2 + 1 
0cd0 : a9 00 __ LDA #$00
0cd2 : 2a __ __ ROL
0cd3 : 2a __ __ ROL
0cd4 : 85 43 __ STA T0 + 0 
0cd6 : a5 1c __ LDA ACCU + 1 
.s6:
0cd8 : 85 44 __ STA T0 + 1 
0cda : 20 b9 0d JSR $0db9 ; (vic_waitLine.s4 + 0)
0cdd : 46 44 __ LSR T0 + 1 
0cdf : a5 43 __ LDA T0 + 0 
0ce1 : 6a __ __ ROR
0ce2 : 8d 10 d0 STA $d010 
0ce5 : 24 4f __ BIT T11 + 0 
0ce7 : 10 4f __ BPL $0d38 ; (setspr.s7 + 0)
.s8:
0ce9 : a5 4d __ LDA T9 + 0 
0ceb : 8d 00 d0 STA $d000 
0cee : a9 08 __ LDA #$08
0cf0 : 8d 27 d0 STA $d027 
0cf3 : a5 4b __ LDA T7 + 0 
0cf5 : 8d 02 d0 STA $d002 
0cf8 : a9 09 __ LDA #$09
0cfa : 8d 28 d0 STA $d028 
0cfd : a5 49 __ LDA T5 + 0 
0cff : 8d 04 d0 STA $d004 
0d02 : a9 0a __ LDA #$0a
0d04 : 8d 29 d0 STA $d029 
0d07 : a5 47 __ LDA T3 + 0 
0d09 : 8d 06 d0 STA $d006 
0d0c : a9 0b __ LDA #$0b
0d0e : 8d 2a d0 STA $d02a 
0d11 : a5 48 __ LDA T4 + 0 
0d13 : 8d 08 d0 STA $d008 
0d16 : a9 0c __ LDA #$0c
0d18 : 8d 2b d0 STA $d02b 
0d1b : a5 4a __ LDA T6 + 0 
0d1d : 8d 0a d0 STA $d00a 
0d20 : a9 0d __ LDA #$0d
0d22 : 8d 2c d0 STA $d02c 
0d25 : a5 4c __ LDA T8 + 0 
0d27 : 8d 0c d0 STA $d00c 
0d2a : a9 0e __ LDA #$0e
0d2c : 8d 2d d0 STA $d02d 
0d2f : a5 4e __ LDA T10 + 0 
0d31 : 8d 0e d0 STA $d00e 
0d34 : a9 0f __ LDA #$0f
0d36 : d0 4d __ BNE $0d85 ; (setspr.s3 + 0)
.s7:
0d38 : a5 4e __ LDA T10 + 0 
0d3a : 8d 00 d0 STA $d000 
0d3d : a9 0f __ LDA #$0f
0d3f : 8d 27 d0 STA $d027 
0d42 : a5 4c __ LDA T8 + 0 
0d44 : 8d 02 d0 STA $d002 
0d47 : a9 0e __ LDA #$0e
0d49 : 8d 28 d0 STA $d028 
0d4c : a5 4a __ LDA T6 + 0 
0d4e : 8d 04 d0 STA $d004 
0d51 : a9 0d __ LDA #$0d
0d53 : 8d 29 d0 STA $d029 
0d56 : a5 48 __ LDA T4 + 0 
0d58 : 8d 06 d0 STA $d006 
0d5b : a9 0c __ LDA #$0c
0d5d : 8d 2a d0 STA $d02a 
0d60 : a5 47 __ LDA T3 + 0 
0d62 : 8d 08 d0 STA $d008 
0d65 : a9 0b __ LDA #$0b
0d67 : 8d 2b d0 STA $d02b 
0d6a : a5 49 __ LDA T5 + 0 
0d6c : 8d 0a d0 STA $d00a 
0d6f : a9 0a __ LDA #$0a
0d71 : 8d 2c d0 STA $d02c 
0d74 : a5 4b __ LDA T7 + 0 
0d76 : 8d 0c d0 STA $d00c 
0d79 : a9 09 __ LDA #$09
0d7b : 8d 2d d0 STA $d02d 
0d7e : a5 4d __ LDA T9 + 0 
0d80 : 8d 0e d0 STA $d00e 
0d83 : a9 08 __ LDA #$08
.s3:
0d85 : 8d 2e d0 STA $d02e 
0d88 : 68 __ __ PLA
0d89 : 85 4f __ STA T11 + 0 
0d8b : 68 __ __ PLA
0d8c : 85 4e __ STA T10 + 0 
0d8e : 68 __ __ PLA
0d8f : 85 4d __ STA T9 + 0 
0d91 : 68 __ __ PLA
0d92 : 85 4c __ STA T8 + 0 
0d94 : 68 __ __ PLA
0d95 : 85 4b __ STA T7 + 0 
0d97 : 68 __ __ PLA
0d98 : 85 4a __ STA T6 + 0 
0d9a : 68 __ __ PLA
0d9b : 85 49 __ STA T5 + 0 
0d9d : 68 __ __ PLA
0d9e : 85 48 __ STA T4 + 0 
0da0 : 68 __ __ PLA
0da1 : 85 47 __ STA T3 + 0 
0da3 : 68 __ __ PLA
0da4 : 85 46 __ STA T2 + 1 
0da6 : 68 __ __ PLA
0da7 : 85 44 __ STA T0 + 1 
0da9 : 68 __ __ PLA
0daa : 85 43 __ STA T0 + 0 
0dac : 68 __ __ PLA
0dad : 85 1c __ STA ACCU + 1 
0daf : 68 __ __ PLA
0db0 : 85 1b __ STA ACCU + 0 
0db2 : 68 __ __ PLA
0db3 : 85 0e __ STA P1 
0db5 : 68 __ __ PLA
0db6 : 85 0d __ STA P0 
0db8 : 60 __ __ RTS
--------------------------------------------------------------------
vic_waitLine: ; vic_waitLine(i16)->void
; 119, "/home/honza/projects/c64/projects/oscar64/include/c64/vic.h"
.s4:
0db9 : 46 0e __ LSR P1 ; (line + 1)
0dbb : a9 00 __ LDA #$00
0dbd : 6a __ __ ROR
0dbe : 85 1b __ STA ACCU + 0 
0dc0 : a4 0d __ LDY P0 ; (line + 0)
.l5:
0dc2 : 98 __ __ TYA
.l7:
0dc3 : cd 12 d0 CMP $d012 
0dc6 : d0 fb __ BNE $0dc3 ; (vic_waitLine.l7 + 0)
.s6:
0dc8 : ad 11 d0 LDA $d011 
0dcb : 29 80 __ AND #$80
0dcd : c5 1b __ CMP ACCU + 0 
0dcf : d0 f1 __ BNE $0dc2 ; (vic_waitLine.l5 + 0)
.s3:
0dd1 : 60 __ __ RTS
--------------------------------------------------------------------
rirq_sort: ; rirq_sort(bool)->void
; 192, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0dd2 : 85 0d __ STA P0 ; (inirq + 0)
0dd4 : a9 ff __ LDA #$ff
0dd6 : 8d 33 28 STA $2833 ; (nextIRQ + 0)
0dd9 : ae 12 28 LDX $2812 ; (rasterIRQIndex[0] + 1)
0ddc : bd 00 28 LDA $2800,x ; (rasterIRQRows[0] + 0)
0ddf : 85 1c __ STA ACCU + 1 
0de1 : a2 02 __ LDX #$02
.l5:
0de3 : bc 11 28 LDY $2811,x ; (rasterIRQIndex[0] + 0)
0de6 : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
0de9 : c5 1c __ CMP ACCU + 1 
0deb : 90 04 __ BCC $0df1 ; (rirq_sort.s12 + 0)
.s6:
0ded : 85 1c __ STA ACCU + 1 
0def : b0 24 __ BCS $0e15 ; (rirq_sort.s7 + 0)
.s12:
0df1 : 86 1d __ STX ACCU + 2 
0df3 : 84 1e __ STY ACCU + 3 
0df5 : 85 1b __ STA ACCU + 0 
0df7 : bd 10 28 LDA $2810,x ; (rasterIRQRows[0] + 16)
0dfa : 9d 11 28 STA $2811,x ; (rasterIRQIndex[0] + 0)
0dfd : 90 05 __ BCC $0e04 ; (rirq_sort.l13 + 0)
.s15:
0dff : 98 __ __ TYA
0e00 : 9d 10 28 STA $2810,x ; (rasterIRQRows[0] + 16)
0e03 : ca __ __ DEX
.l13:
0e04 : a5 1b __ LDA ACCU + 0 
0e06 : bc 0f 28 LDY $280f,x ; (rasterIRQRows[0] + 15)
0e09 : d9 00 28 CMP $2800,y ; (rasterIRQRows[0] + 0)
0e0c : 90 f1 __ BCC $0dff ; (rirq_sort.s15 + 0)
.s14:
0e0e : a5 1e __ LDA ACCU + 3 
0e10 : 9d 10 28 STA $2810,x ; (rasterIRQRows[0] + 16)
0e13 : a6 1d __ LDX ACCU + 2 
.s7:
0e15 : e8 __ __ INX
0e16 : e0 11 __ CPX #$11
0e18 : 90 c9 __ BCC $0de3 ; (rirq_sort.l5 + 0)
.s8:
0e1a : a2 03 __ LDX #$03
.l17:
0e1c : bc 12 28 LDY $2812,x ; (rasterIRQIndex[0] + 1)
0e1f : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
0e22 : 9d 22 28 STA $2822,x ; (rasterIRQNext[0] + 0)
0e25 : bc 16 28 LDY $2816,x ; (rasterIRQIndex[0] + 5)
0e28 : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
0e2b : 9d 26 28 STA $2826,x ; (rasterIRQNext[0] + 4)
0e2e : bc 1a 28 LDY $281a,x ; (rasterIRQIndex[0] + 9)
0e31 : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
0e34 : 9d 2a 28 STA $282a,x ; (rasterIRQNext[0] + 8)
0e37 : bc 1e 28 LDY $281e,x ; (rasterIRQIndex[0] + 13)
0e3a : b9 00 28 LDA $2800,y ; (rasterIRQRows[0] + 0)
0e3d : 9d 2e 28 STA $282e,x ; (rasterIRQNext[0] + 12)
0e40 : ca __ __ DEX
0e41 : 10 d9 __ BPL $0e1c ; (rirq_sort.l17 + 0)
.s18:
0e43 : a5 0d __ LDA P0 ; (inirq + 0)
0e45 : f0 06 __ BEQ $0e4d ; (rirq_sort.s9 + 0)
.s11:
0e47 : a9 0f __ LDA #$0f
.s16:
0e49 : 8d 33 28 STA $2833 ; (nextIRQ + 0)
.s3:
0e4c : 60 __ __ RTS
.s9:
0e4d : ac 22 28 LDY $2822 ; (rasterIRQNext[0] + 0)
0e50 : c0 ff __ CPY #$ff
0e52 : f0 f8 __ BEQ $0e4c ; (rirq_sort.s3 + 0)
.s10:
0e54 : 88 __ __ DEY
0e55 : 8c 12 d0 STY $d012 
0e58 : 4c 49 0e JMP $0e49 ; (rirq_sort.s16 + 0)
--------------------------------------------------------------------
rirq_start: ; rirq_start()->void
; 184, "/home/honza/projects/c64/projects/oscar64/include/c64/rasterirq.h"
.s4:
0e5b : ad 11 d0 LDA $d011 
0e5e : 29 7f __ AND #$7f
0e60 : 8d 11 d0 STA $d011 
0e63 : a9 64 __ LDA #$64
0e65 : 8d 12 d0 STA $d012 
0e68 : 0e 19 d0 ASL $d019 
0e6b : 58 __ __ CLI
.s3:
0e6c : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
0e6d : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
costab:
0f00 : __ __ __ BYT 1e 1e 1e 1e 1e 1e 1e 1e 1d 1d 1d 1d 1d 1c 1c 1c : ................
0f10 : __ __ __ BYT 1c 1b 1b 1b 1a 1a 1a 19 19 19 18 18 17 17 16 16 : ................
0f20 : __ __ __ BYT 15 15 14 14 13 12 12 11 11 10 0f 0f 0e 0d 0d 0c : ................
0f30 : __ __ __ BYT 0b 0b 0a 09 09 08 07 07 06 05 04 04 03 02 01 01 : ................
0f40 : __ __ __ BYT 00 ff ff fe fd fc fc fb fa f9 f9 f8 f7 f7 f6 f5 : ................
0f50 : __ __ __ BYT f5 f4 f3 f3 f2 f1 f1 f0 ef ef ee ee ed ec ec eb : ................
0f60 : __ __ __ BYT eb ea ea e9 e9 e8 e8 e7 e7 e7 e6 e6 e6 e5 e5 e5 : ................
0f70 : __ __ __ BYT e4 e4 e4 e4 e3 e3 e3 e3 e3 e2 e2 e2 e2 e2 e2 e2 : ................
0f80 : __ __ __ BYT e2 e2 e2 e2 e2 e2 e2 e2 e3 e3 e3 e3 e3 e4 e4 e4 : ................
0f90 : __ __ __ BYT e4 e5 e5 e5 e6 e6 e6 e7 e7 e7 e8 e8 e9 e9 ea ea : ................
0fa0 : __ __ __ BYT eb eb ec ec ed ee ee ef ef f0 f1 f1 f2 f3 f3 f4 : ................
0fb0 : __ __ __ BYT f5 f5 f6 f7 f7 f8 f9 f9 fa fb fc fc fd fe ff ff : ................
0fc0 : __ __ __ BYT 00 01 01 02 03 04 04 05 06 07 07 08 09 09 0a 0b : ................
0fd0 : __ __ __ BYT 0b 0c 0d 0d 0e 0f 0f 10 11 11 12 12 13 14 14 15 : ................
0fe0 : __ __ __ BYT 15 16 16 17 17 18 18 19 19 19 1a 1a 1a 1b 1b 1b : ................
0ff0 : __ __ __ BYT 1c 1c 1c 1c 1d 1d 1d 1d 1d 1e 1e 1e 1e 1e 1e 1e : ................
--------------------------------------------------------------------
spriteset:
2000 : __ __ __ BYT 00 55 00 01 69 40 06 9a 50 06 aa 90 1a aa 64 16 : .U..i@..P.....d.
2010 : __ __ __ BYT ea 94 1a f9 a4 6b ea 99 6a fa a5 6a ea 69 6a aa : .....k..j..j.ij.
2020 : __ __ __ BYT a5 5a aa 95 69 a9 a5 5a aa 95 16 9a 54 1a a9 94 : .Z..i..Z....T...
2030 : __ __ __ BYT 16 66 54 05 99 50 05 55 50 01 55 40 00 55 00 8c : .fT..P.UP.U@.U..
--------------------------------------------------------------------
rasterIRQRows:
2800 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQIndex:
2811 : __ __ __ BSS	17
--------------------------------------------------------------------
rasterIRQNext:
2822 : __ __ __ BSS	17
--------------------------------------------------------------------
nextIRQ:
2833 : __ __ __ BSS	1
--------------------------------------------------------------------
rasterIRQLow:
2834 : __ __ __ BSS	16
--------------------------------------------------------------------
rasterIRQHigh:
2844 : __ __ __ BSS	16
--------------------------------------------------------------------
rirq_count:
2854 : __ __ __ BSS	1
--------------------------------------------------------------------
poffset:
2855 : __ __ __ BSS	1
--------------------------------------------------------------------
yoffset:
2856 : __ __ __ BSS	1
--------------------------------------------------------------------
pphase:
2857 : __ __ __ BSS	1
--------------------------------------------------------------------
spmux:
2900 : __ __ __ BSS	256
