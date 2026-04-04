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
080e : 8e 32 0a STX $0a32 ; (spentry + 0)
0811 : a2 0a __ LDX #$0a
0813 : a0 eb __ LDY #$eb
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 0a __ CPX #$0a
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 f7 __ CPY #$f7
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
;  13, "/home/honza/projects/c64/projects/oscar64/samples/sprites/joycontrol.c"
.s4:
0880 : a9 00 __ LDA #$00
0882 : 85 0d __ STA P0 
0884 : 85 10 __ STA P3 
0886 : 85 12 __ STA P5 
0888 : 85 14 __ STA P7 
088a : 85 15 __ STA P8 
088c : 85 16 __ STA P9 
088e : 85 17 __ STA P10 
0890 : a9 64 __ LDA #$64
0892 : 8d ef 0a STA $0aef ; (spy + 0)
0895 : 85 11 __ STA P4 
0897 : a9 01 __ LDA #$01
0899 : 85 0e __ STA P1 
089b : a9 00 __ LDA #$00
089d : 8d f0 0a STA $0af0 ; (spy + 1)
08a0 : 8d ee 0a STA $0aee ; (spx + 1)
08a3 : a9 0f __ LDA #$0f
08a5 : 85 13 __ STA P6 
08a7 : a9 a0 __ LDA #$a0
08a9 : 85 0f __ STA P2 
08ab : 8d ed 0a STA $0aed ; (spx + 0)
08ae : a2 7f __ LDX #$7f
.l5:
08b0 : bd 33 0a LDA $0a33,x ; (spdata[0] + 0)
08b3 : 9d 80 03 STA $0380,x 
08b6 : ca __ __ DEX
08b7 : 10 f7 __ BPL $08b0 ; (main.l5 + 0)
.s6:
08b9 : a9 f8 __ LDA #$f8
08bb : 8d eb 0a STA $0aeb ; (vspriteScreen + 0)
08be : a9 07 __ LDA #$07
08c0 : 8d ec 0a STA $0aec ; (vspriteScreen + 1)
08c3 : 20 68 09 JSR $0968 ; (spr_set.s4 + 0)
08c6 : e6 0d __ INC P0 
08c8 : e6 15 __ INC P8 
08ca : c6 13 __ DEC P6 
08cc : a9 00 __ LDA #$00
08ce : 85 10 __ STA P3 
08d0 : a9 08 __ LDA #$08
08d2 : 85 14 __ STA P7 
08d4 : 20 68 09 JSR $0968 ; (spr_set.s4 + 0)
08d7 : a9 09 __ LDA #$09
08d9 : 8d 25 d0 STA $d025 
08dc : a9 01 __ LDA #$01
08de : 8d 26 d0 STA $d026 
.l7:
08e1 : a9 00 __ LDA #$00
08e3 : 20 f2 09 JSR $09f2 ; (joy_poll.s4 + 0)
08e6 : a0 00 __ LDY #$00
08e8 : 2c f3 0a BIT $0af3 ; (joyx[0] + 0)
08eb : 10 01 __ BPL $08ee ; (main.s17 + 0)
.s16:
08ed : 88 __ __ DEY
.s17:
08ee : ad ed 0a LDA $0aed ; (spx + 0)
08f1 : 18 __ __ CLC
08f2 : 6d f3 0a ADC $0af3 ; (joyx[0] + 0)
08f5 : 8d ed 0a STA $0aed ; (spx + 0)
08f8 : 98 __ __ TYA
08f9 : 6d ee 0a ADC $0aee ; (spx + 1)
08fc : 8d ee 0a STA $0aee ; (spx + 1)
08ff : a0 00 __ LDY #$00
0901 : 2c f1 0a BIT $0af1 ; (joyy[0] + 0)
0904 : 10 01 __ BPL $0907 ; (main.s19 + 0)
.s18:
0906 : 88 __ __ DEY
.s19:
0907 : ad ef 0a LDA $0aef ; (spy + 0)
090a : 18 __ __ CLC
090b : 6d f1 0a ADC $0af1 ; (joyy[0] + 0)
090e : 8d ef 0a STA $0aef ; (spy + 0)
0911 : aa __ __ TAX
0912 : 98 __ __ TYA
0913 : 6d f0 0a ADC $0af0 ; (spy + 1)
0916 : 8d f0 0a STA $0af0 ; (spy + 1)
0919 : 8e 01 d0 STX $d001 
091c : ad ed 0a LDA $0aed ; (spx + 0)
091f : 8d 00 d0 STA $d000 
0922 : ad ee 0a LDA $0aee ; (spx + 1)
0925 : 29 01 __ AND #$01
0927 : 85 1b __ STA ACCU + 0 
0929 : d0 08 __ BNE $0933 ; (main.s15 + 0)
.s8:
092b : ad 10 d0 LDA $d010 
092e : 29 fe __ AND #$fe
0930 : 4c 38 09 JMP $0938 ; (main.s9 + 0)
.s15:
0933 : ad 10 d0 LDA $d010 
0936 : 09 01 __ ORA #$01
.s9:
0938 : 8d 10 d0 STA $d010 
093b : ad ef 0a LDA $0aef ; (spy + 0)
093e : 8d 03 d0 STA $d003 
0941 : ad ed 0a LDA $0aed ; (spx + 0)
0944 : 8d 02 d0 STA $d002 
0947 : a5 1b __ LDA ACCU + 0 
0949 : d0 08 __ BNE $0953 ; (main.s14 + 0)
.s10:
094b : ad 10 d0 LDA $d010 
094e : 29 fd __ AND #$fd
0950 : 4c 58 09 JMP $0958 ; (main.s11 + 0)
.s14:
0953 : ad 10 d0 LDA $d010 
0956 : 09 02 __ ORA #$02
.s11:
0958 : 8d 10 d0 STA $d010 
.l12:
095b : 2c 11 d0 BIT $d011 
095e : 30 fb __ BMI $095b ; (main.l12 + 0)
.l13:
0960 : 2c 11 d0 BIT $d011 
0963 : 10 fb __ BPL $0960 ; (main.l13 + 0)
0965 : 4c e1 08 JMP $08e1 ; (main.l7 + 0)
--------------------------------------------------------------------
spr_set: ; spr_set(u8,bool,i16,i16,u8,u8,bool,bool,bool)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/c64/sprites.h"
.s4:
0968 : a6 0d __ LDX P0 ; (sp + 0)
096a : bc bb 0a LDY $0abb,x ; (bitshift[0] + 8)
096d : a5 0e __ LDA P1 ; (show + 0)
096f : d0 09 __ BNE $097a ; (spr_set.s19 + 0)
.s5:
0971 : 98 __ __ TYA
0972 : 49 ff __ EOR #$ff
0974 : 2d 15 d0 AND $d015 
0977 : 4c 7e 09 JMP $097e ; (spr_set.s6 + 0)
.s19:
097a : 98 __ __ TYA
097b : 0d 15 d0 ORA $d015 
.s6:
097e : 8d 15 d0 STA $d015 
0981 : a5 15 __ LDA P8 ; (multi + 0)
0983 : d0 09 __ BNE $098e ; (spr_set.s18 + 0)
.s7:
0985 : 98 __ __ TYA
0986 : 49 ff __ EOR #$ff
0988 : 2d 1c d0 AND $d01c 
098b : 4c 92 09 JMP $0992 ; (spr_set.s8 + 0)
.s18:
098e : 98 __ __ TYA
098f : 0d 1c d0 ORA $d01c 
.s8:
0992 : 8d 1c d0 STA $d01c 
0995 : a5 16 __ LDA P9 ; (xexpand + 0)
0997 : d0 09 __ BNE $09a2 ; (spr_set.s17 + 0)
.s9:
0999 : 98 __ __ TYA
099a : 49 ff __ EOR #$ff
099c : 2d 1d d0 AND $d01d 
099f : 4c a6 09 JMP $09a6 ; (spr_set.s10 + 0)
.s17:
09a2 : 98 __ __ TYA
09a3 : 0d 1d d0 ORA $d01d 
.s10:
09a6 : 8d 1d d0 STA $d01d 
09a9 : a5 17 __ LDA P10 ; (yexpand + 0)
09ab : d0 09 __ BNE $09b6 ; (spr_set.s16 + 0)
.s11:
09ad : 98 __ __ TYA
09ae : 49 ff __ EOR #$ff
09b0 : 2d 17 d0 AND $d017 
09b3 : 4c ba 09 JMP $09ba ; (spr_set.s12 + 0)
.s16:
09b6 : 98 __ __ TYA
09b7 : 0d 17 d0 ORA $d017 
.s12:
09ba : 8d 17 d0 STA $d017 
09bd : 8a __ __ TXA
09be : 0a __ __ ASL
09bf : aa __ __ TAX
09c0 : a5 11 __ LDA P4 ; (ypos + 0)
09c2 : 9d 01 d0 STA $d001,x 
09c5 : a5 0f __ LDA P2 ; (xpos + 0)
09c7 : 9d 00 d0 STA $d000,x 
09ca : 46 10 __ LSR P3 ; (xpos + 1)
09cc : 98 __ __ TYA
09cd : 90 05 __ BCC $09d4 ; (spr_set.s13 + 0)
.s15:
09cf : 0d 10 d0 ORA $d010 
09d2 : b0 05 __ BCS $09d9 ; (spr_set.s14 + 0)
.s13:
09d4 : 49 ff __ EOR #$ff
09d6 : 2d 10 d0 AND $d010 
.s14:
09d9 : 8d 10 d0 STA $d010 
09dc : ad eb 0a LDA $0aeb ; (vspriteScreen + 0)
09df : 85 1b __ STA ACCU + 0 
09e1 : ad ec 0a LDA $0aec ; (vspriteScreen + 1)
09e4 : 85 1c __ STA ACCU + 1 
09e6 : a5 13 __ LDA P6 ; (image + 0)
09e8 : a4 0d __ LDY P0 ; (sp + 0)
09ea : 91 1b __ STA (ACCU + 0),y 
09ec : a5 14 __ LDA P7 ; (color + 0)
09ee : 99 27 d0 STA $d027,y 
.s3:
09f1 : 60 __ __ RTS
--------------------------------------------------------------------
joy_poll: ; joy_poll(u8)->void
;  13, "/home/honza/projects/c64/projects/oscar64/include/c64/joystick.h"
.s4:
09f2 : aa __ __ TAX
09f3 : bd 00 dc LDA $dc00,x 
09f6 : a8 __ __ TAY
09f7 : 29 10 __ AND #$10
09f9 : f0 04 __ BEQ $09ff ; (joy_poll.s10 + 0)
.s11:
09fb : a9 00 __ LDA #$00
09fd : f0 02 __ BEQ $0a01 ; (joy_poll.s12 + 0)
.s10:
09ff : a9 01 __ LDA #$01
.s12:
0a01 : 9d f5 0a STA $0af5,x ; (joyb[0] + 0)
0a04 : 98 __ __ TYA
0a05 : 4a __ __ LSR
0a06 : b0 04 __ BCS $0a0c ; (joy_poll.s9 + 0)
.s5:
0a08 : a9 ff __ LDA #$ff
0a0a : 90 0b __ BCC $0a17 ; (joy_poll.s6 + 0)
.s9:
0a0c : 98 __ __ TYA
0a0d : 29 02 __ AND #$02
0a0f : f0 04 __ BEQ $0a15 ; (joy_poll.s13 + 0)
.s14:
0a11 : a9 00 __ LDA #$00
0a13 : b0 02 __ BCS $0a17 ; (joy_poll.s6 + 0)
.s13:
0a15 : a9 01 __ LDA #$01
.s6:
0a17 : 9d f1 0a STA $0af1,x ; (joyy[0] + 0)
0a1a : 98 __ __ TYA
0a1b : 29 04 __ AND #$04
0a1d : d0 06 __ BNE $0a25 ; (joy_poll.s8 + 0)
.s7:
0a1f : a9 ff __ LDA #$ff
.s3:
0a21 : 9d f3 0a STA $0af3,x ; (joyx[0] + 0)
0a24 : 60 __ __ RTS
.s8:
0a25 : 98 __ __ TYA
0a26 : 29 08 __ AND #$08
0a28 : f0 04 __ BEQ $0a2e ; (joy_poll.s15 + 0)
.s16:
0a2a : a9 00 __ LDA #$00
0a2c : f0 f3 __ BEQ $0a21 ; (joy_poll.s3 + 0)
.s15:
0a2e : a9 01 __ LDA #$01
0a30 : d0 ef __ BNE $0a21 ; (joy_poll.s3 + 0)
--------------------------------------------------------------------
spentry:
0a32 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
spdata:
0a33 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 28 a4 20 2a : ............(. *
0a43 : __ __ __ BYT a9 60 0a a5 60 0a a5 60 0a aa 60 02 ef 40 02 ef : .`..`..`..`..@..
0a53 : __ __ __ BYT 80 02 aa a0 0a 85 90 0a a5 50 0a a6 60 02 a9 40 : .........P..`..@
0a63 : __ __ __ BYT 01 55 40 00 55 00 00 28 00 00 00 00 00 00 00 98 : .U@.U..(........
0a73 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 38 00 38 24 10 48 20 : .........8.8$.H 
0a83 : __ __ __ BYT 10 08 39 87 18 01 01 00 01 00 00 00 28 00 04 6c : ..9.........(..l
0a93 : __ __ __ BYT 20 04 00 20 08 38 10 08 10 10 08 92 10 04 7c 20 :  .. .8........| 
0aa3 : __ __ __ BYT 04 00 20 03 81 c0 00 7e 00 00 00 00 00 00 00 10 : .. ....~........
--------------------------------------------------------------------
bitshift:
0ab3 : __ __ __ BYT 00 00 00 00 00 00 00 00 01 02 04 08 10 20 40 80 : ............. @.
0ac3 : __ __ __ BYT 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 : ................
0ad3 : __ __ __ BYT 80 40 20 10 08 04 02 01 00 00 00 00 00 00 00 00 : .@ .............
0ae3 : __ __ __ BYT 00 00 00 00 00 00 00 00                         : ........
--------------------------------------------------------------------
vspriteScreen:
0aeb : __ __ __ BSS	2
--------------------------------------------------------------------
spx:
0aed : __ __ __ BSS	2
--------------------------------------------------------------------
spy:
0aef : __ __ __ BSS	2
--------------------------------------------------------------------
joyy:
0af1 : __ __ __ BSS	2
--------------------------------------------------------------------
joyx:
0af3 : __ __ __ BSS	2
--------------------------------------------------------------------
joyb:
0af5 : __ __ __ BSS	2
