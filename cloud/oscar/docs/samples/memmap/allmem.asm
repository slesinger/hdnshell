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
080e : 8e 80 23 STX $2380 ; (spentry + 0)
0811 : a2 23 __ LDX #$23
0813 : a0 9e __ LDY #$9e
0815 : a9 00 __ LDA #$00
0817 : 85 19 __ STA IP + 0 
0819 : 86 1a __ STX IP + 1 
081b : e0 23 __ CPX #$23
081d : f0 0b __ BEQ $082a ; (startup + 41)
081f : 91 19 __ STA (IP + 0),y 
0821 : c8 __ __ INY
0822 : d0 fb __ BNE $081f ; (startup + 30)
0824 : e8 __ __ INX
0825 : d0 f2 __ BNE $0819 ; (startup + 24)
0827 : 91 19 __ STA (IP + 0),y 
0829 : c8 __ __ INY
082a : c0 a2 __ CPY #$a2
082c : d0 f9 __ BNE $0827 ; (startup + 38)
082e : a9 00 __ LDA #$00
0830 : a2 f7 __ LDX #$f7
0832 : d0 03 __ BNE $0837 ; (startup + 54)
0834 : 95 00 __ STA $00,x 
0836 : e8 __ __ INX
0837 : e0 f7 __ CPX #$f7
0839 : d0 f9 __ BNE $0834 ; (startup + 51)
083b : a9 96 __ LDA #$96
083d : 85 23 __ STA SP + 0 
083f : a9 0f __ LDA #$0f
0841 : 85 24 __ STA SP + 1 
0843 : 20 00 10 JSR $1000 ; (main.s1 + 0)
0846 : a9 4c __ LDA #$4c
0848 : 85 54 __ STA $54 
084a : a9 00 __ LDA #$00
084c : 85 13 __ STA P6 
084e : a9 19 __ LDA #$19
0850 : 85 16 __ STA P9 
0852 : 60 __ __ RTS
--------------------------------------------------------------------
main: ; main()->i16
;  15, "/home/honza/projects/c64/projects/oscar64/samples/memmap/allmem.c"
.s1:
1000 : a2 03 __ LDX #$03
1002 : b5 53 __ LDA T1 + 0,x 
1004 : 9d 98 0f STA $0f98,x ; (main@stack + 0)
1007 : ca __ __ DEX
1008 : 10 f8 __ BPL $1002 ; (main.s1 + 2)
.s4:
100a : 20 9c 10 JSR $109c ; (mmap_trampoline.s4 + 0)
100d : a9 30 __ LDA #$30
100f : 85 01 __ STA $01 
1011 : a9 00 __ LDA #$00
1013 : 85 1b __ STA ACCU + 0 
1015 : a9 04 __ LDA #$04
1017 : 85 1c __ STA ACCU + 1 
1019 : 20 b2 22 JSR $22b2 ; (crt_malloc + 0)
101c : a5 1c __ LDA ACCU + 1 
101e : 05 1b __ ORA ACCU + 0 
1020 : f0 67 __ BEQ $1089 ; (main.s5 + 0)
.s6:
1022 : a5 1c __ LDA ACCU + 1 
1024 : 85 54 __ STA T1 + 1 
1026 : a5 1b __ LDA ACCU + 0 
1028 : 85 53 __ STA T1 + 0 
102a : a9 00 __ LDA #$00
102c : 85 56 __ STA T2 + 1 
.l7:
102e : a9 36 __ LDA #$36
1030 : 85 01 __ STA $01 
1032 : a9 9d __ LDA #$9d
1034 : 8d fa 0f STA $0ffa ; (sstack + 8)
1037 : a9 1d __ LDA #$1d
1039 : 8d fb 0f STA $0ffb ; (sstack + 9)
103c : a5 1b __ LDA ACCU + 0 
103e : 8d fe 0f STA $0ffe ; (sstack + 12)
1041 : a5 1c __ LDA ACCU + 1 
1043 : 8d ff 0f STA $0fff ; (sstack + 13)
1046 : 18 __ __ CLC
1047 : a5 56 __ LDA T2 + 1 
1049 : 69 04 __ ADC #$04
104b : 85 56 __ STA T2 + 1 
104d : 8d fd 0f STA $0ffd ; (sstack + 11)
1050 : a9 00 __ LDA #$00
1052 : 8d fc 0f STA $0ffc ; (sstack + 10)
1055 : 20 e6 10 JSR $10e6 ; (printf.s4 + 0)
1058 : a9 30 __ LDA #$30
105a : 85 01 __ STA $01 
105c : a9 fc __ LDA #$fc
105e : 85 44 __ STA T0 + 1 
1060 : a2 00 __ LDX #$00
1062 : a0 00 __ LDY #$00
.l9:
1064 : a9 aa __ LDA #$aa
1066 : 91 53 __ STA (T1 + 0),y 
1068 : c8 __ __ INY
1069 : d0 02 __ BNE $106d ; (main.s12 + 0)
.s11:
106b : e6 54 __ INC T1 + 1 
.s12:
106d : e8 __ __ INX
106e : d0 f4 __ BNE $1064 ; (main.l9 + 0)
.s10:
1070 : e6 44 __ INC T0 + 1 
1072 : d0 f0 __ BNE $1064 ; (main.l9 + 0)
.s8:
1074 : 86 1b __ STX ACCU + 0 
1076 : a9 04 __ LDA #$04
1078 : 85 1c __ STA ACCU + 1 
107a : 20 b2 22 JSR $22b2 ; (crt_malloc + 0)
107d : a5 1b __ LDA ACCU + 0 
107f : 85 53 __ STA T1 + 0 
1081 : a5 1c __ LDA ACCU + 1 
1083 : 85 54 __ STA T1 + 1 
1085 : 05 1b __ ORA ACCU + 0 
1087 : d0 a5 __ BNE $102e ; (main.l7 + 0)
.s5:
1089 : 85 1b __ STA ACCU + 0 
108b : 85 1c __ STA ACCU + 1 
108d : a9 37 __ LDA #$37
108f : 85 01 __ STA $01 
.s3:
1091 : a2 03 __ LDX #$03
1093 : bd 98 0f LDA $0f98,x ; (main@stack + 0)
1096 : 95 53 __ STA T1 + 0,x 
1098 : ca __ __ DEX
1099 : 10 f8 __ BPL $1093 ; (main.s3 + 2)
109b : 60 __ __ RTS
--------------------------------------------------------------------
mmap_trampoline: ; mmap_trampoline()->void
;  25, "/home/honza/projects/c64/projects/oscar64/include/c64/memmap.h"
.s4:
109c : a9 b1 __ LDA #$b1
109e : 8d fa ff STA $fffa 
10a1 : a9 10 __ LDA #$10
10a3 : 8d fb ff STA $fffb 
10a6 : a9 cf __ LDA #$cf
10a8 : 8d fe ff STA $fffe 
10ab : a9 10 __ LDA #$10
10ad : 8d ff ff STA $ffff 
.s3:
10b0 : 60 __ __ RTS
--------------------------------------------------------------------
NMITrampoline: ; NMITrampoline
10b1 : 48 __ __ PHA
10b2 : 8a __ __ TXA
10b3 : 48 __ __ PHA
10b4 : a9 10 __ LDA #$10
10b6 : 48 __ __ PHA
10b7 : a9 c8 __ LDA #$c8
10b9 : 48 __ __ PHA
10ba : ba __ __ TSX
10bb : bd 05 01 LDA $0105,x 
10be : 48 __ __ PHA
10bf : a6 01 __ LDX $01 
10c1 : a9 36 __ LDA #$36
10c3 : 85 01 __ STA $01 
10c5 : 6c fa ff JMP ($fffa)
--------------------------------------------------------------------
DoneTrampoline: ; DoneTrampoline
10c8 : 86 01 __ STX $01 
10ca : 68 __ __ PLA
10cb : aa __ __ TAX
10cc : 68 __ __ PLA
10cd : 40 __ __ RTI
10ce : 60 __ __ RTS
--------------------------------------------------------------------
IRQTrampoline: ; IRQTrampoline
10cf : 48 __ __ PHA
10d0 : 8a __ __ TXA
10d1 : 48 __ __ PHA
10d2 : a9 10 __ LDA #$10
10d4 : 48 __ __ PHA
10d5 : a9 c8 __ LDA #$c8
10d7 : 48 __ __ PHA
10d8 : ba __ __ TSX
10d9 : bd 05 01 LDA $0105,x 
10dc : 48 __ __ PHA
10dd : a6 01 __ LDX $01 
10df : a9 36 __ LDA #$36
10e1 : 85 01 __ STA $01 
10e3 : 6c fe ff JMP ($fffe)
--------------------------------------------------------------------
printf: ; printf(const u8*)->void
;  18, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.s4:
10e6 : a9 01 __ LDA #$01
10e8 : 8d f9 0f STA $0ff9 ; (sstack + 7)
10eb : a9 9e __ LDA #$9e
10ed : 8d f3 0f STA $0ff3 ; (sstack + 1)
10f0 : a9 0f __ LDA #$0f
10f2 : 8d f4 0f STA $0ff4 ; (sstack + 2)
10f5 : ad fa 0f LDA $0ffa ; (sstack + 8)
10f8 : 8d f5 0f STA $0ff5 ; (sstack + 3)
10fb : ad fb 0f LDA $0ffb ; (sstack + 9)
10fe : 8d f6 0f STA $0ff6 ; (sstack + 4)
1101 : a9 fc __ LDA #$fc
1103 : 8d f7 0f STA $0ff7 ; (sstack + 5)
1106 : a9 0f __ LDA #$0f
1108 : 8d f8 0f STA $0ff8 ; (sstack + 6)
110b : 4c 0e 11 JMP $110e ; (sformat.s1 + 0)
--------------------------------------------------------------------
sformat: ; sformat(u8*,const u8*,i16*,bool)->u8*
; 351, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
110e : a2 09 __ LDX #$09
1110 : b5 53 __ LDA T1 + 0,x 
1112 : 9d d0 0f STA $0fd0,x ; (sformat@stack + 0)
1115 : ca __ __ DEX
1116 : 10 f8 __ BPL $1110 ; (sformat.s1 + 2)
.s4:
1118 : ad f5 0f LDA $0ff5 ; (sstack + 3)
111b : 85 55 __ STA T3 + 0 
111d : a9 00 __ LDA #$00
111f : 85 5b __ STA T6 + 0 
1121 : ad f6 0f LDA $0ff6 ; (sstack + 4)
1124 : 85 56 __ STA T3 + 1 
1126 : ad f3 0f LDA $0ff3 ; (sstack + 1)
1129 : 85 57 __ STA T4 + 0 
112b : ad f4 0f LDA $0ff4 ; (sstack + 2)
112e : 85 58 __ STA T4 + 1 
.l5:
1130 : a0 00 __ LDY #$00
1132 : b1 55 __ LDA (T3 + 0),y 
1134 : d0 36 __ BNE $116c ; (sformat.s10 + 0)
.s6:
1136 : a4 5b __ LDY T6 + 0 
1138 : 91 57 __ STA (T4 + 0),y 
113a : 98 __ __ TYA
113b : f0 28 __ BEQ $1165 ; (sformat.s95 + 0)
.s7:
113d : ad f9 0f LDA $0ff9 ; (sstack + 7)
1140 : d0 18 __ BNE $115a ; (sformat.s9 + 0)
.s8:
1142 : 98 __ __ TYA
1143 : 18 __ __ CLC
1144 : 65 57 __ ADC T4 + 0 
1146 : aa __ __ TAX
1147 : a5 58 __ LDA T4 + 1 
1149 : 69 00 __ ADC #$00
.s3:
114b : 86 1b __ STX ACCU + 0 ; (buff + 1)
114d : 85 1c __ STA ACCU + 1 ; (fmt + 0)
114f : a2 09 __ LDX #$09
1151 : bd d0 0f LDA $0fd0,x ; (sformat@stack + 0)
1154 : 95 53 __ STA T1 + 0,x 
1156 : ca __ __ DEX
1157 : 10 f8 __ BPL $1151 ; (sformat.s3 + 6)
1159 : 60 __ __ RTS
.s9:
115a : a5 57 __ LDA T4 + 0 
115c : 85 0e __ STA P1 
115e : a5 58 __ LDA T4 + 1 
1160 : 85 0f __ STA P2 
1162 : 20 4f 15 JSR $154f ; (puts.l4 + 0)
.s95:
1165 : a5 58 __ LDA T4 + 1 
1167 : a6 57 __ LDX T4 + 0 
1169 : 4c 4b 11 JMP $114b ; (sformat.s3 + 0)
.s10:
116c : c9 25 __ CMP #$25
116e : f0 3e __ BEQ $11ae ; (sformat.s15 + 0)
.s11:
1170 : a4 5b __ LDY T6 + 0 
1172 : 91 57 __ STA (T4 + 0),y 
1174 : e6 55 __ INC T3 + 0 
1176 : d0 02 __ BNE $117a ; (sformat.s117 + 0)
.s116:
1178 : e6 56 __ INC T3 + 1 
.s117:
117a : c8 __ __ INY
117b : 84 5b __ STY T6 + 0 
117d : 98 __ __ TYA
117e : c0 28 __ CPY #$28
1180 : 90 ae __ BCC $1130 ; (sformat.l5 + 0)
.s12:
1182 : 85 43 __ STA T0 + 0 
1184 : a9 00 __ LDA #$00
1186 : 85 5b __ STA T6 + 0 
1188 : ad f9 0f LDA $0ff9 ; (sstack + 7)
118b : f0 14 __ BEQ $11a1 ; (sformat.s13 + 0)
.s14:
118d : a5 57 __ LDA T4 + 0 
118f : 85 0e __ STA P1 
1191 : a5 58 __ LDA T4 + 1 
1193 : 85 0f __ STA P2 
1195 : a9 00 __ LDA #$00
1197 : a4 43 __ LDY T0 + 0 
1199 : 91 0e __ STA (P1),y 
119b : 20 4f 15 JSR $154f ; (puts.l4 + 0)
119e : 4c 30 11 JMP $1130 ; (sformat.l5 + 0)
.s13:
11a1 : 18 __ __ CLC
11a2 : a5 57 __ LDA T4 + 0 
11a4 : 65 43 __ ADC T0 + 0 
11a6 : 85 57 __ STA T4 + 0 
11a8 : 90 86 __ BCC $1130 ; (sformat.l5 + 0)
.s118:
11aa : e6 58 __ INC T4 + 1 
11ac : b0 82 __ BCS $1130 ; (sformat.l5 + 0)
.s15:
11ae : a5 5b __ LDA T6 + 0 
11b0 : f0 27 __ BEQ $11d9 ; (sformat.s16 + 0)
.s89:
11b2 : 84 5b __ STY T6 + 0 
11b4 : 85 43 __ STA T0 + 0 
11b6 : ad f9 0f LDA $0ff9 ; (sstack + 7)
11b9 : f0 13 __ BEQ $11ce ; (sformat.s90 + 0)
.s91:
11bb : a5 57 __ LDA T4 + 0 
11bd : 85 0e __ STA P1 
11bf : a5 58 __ LDA T4 + 1 
11c1 : 85 0f __ STA P2 
11c3 : 98 __ __ TYA
11c4 : a4 43 __ LDY T0 + 0 
11c6 : 91 0e __ STA (P1),y 
11c8 : 20 4f 15 JSR $154f ; (puts.l4 + 0)
11cb : 4c d9 11 JMP $11d9 ; (sformat.s16 + 0)
.s90:
11ce : 18 __ __ CLC
11cf : a5 57 __ LDA T4 + 0 
11d1 : 65 43 __ ADC T0 + 0 
11d3 : 85 57 __ STA T4 + 0 
11d5 : 90 02 __ BCC $11d9 ; (sformat.s16 + 0)
.s115:
11d7 : e6 58 __ INC T4 + 1 
.s16:
11d9 : a9 00 __ LDA #$00
11db : 8d df 0f STA $0fdf ; (si.sign + 0)
11de : 8d e0 0f STA $0fe0 ; (si.left + 0)
11e1 : 8d e1 0f STA $0fe1 ; (si.prefix + 0)
11e4 : a0 01 __ LDY #$01
11e6 : b1 55 __ LDA (T3 + 0),y 
11e8 : a2 20 __ LDX #$20
11ea : 8e da 0f STX $0fda ; (si.fill + 0)
11ed : a2 00 __ LDX #$00
11ef : 8e db 0f STX $0fdb ; (si.width + 0)
11f2 : ca __ __ DEX
11f3 : 8e dc 0f STX $0fdc ; (si.precision + 0)
11f6 : a2 0a __ LDX #$0a
11f8 : 8e de 0f STX $0fde ; (si.base + 0)
11fb : aa __ __ TAX
11fc : a9 02 __ LDA #$02
11fe : d0 07 __ BNE $1207 ; (sformat.l17 + 0)
.s85:
1200 : a0 00 __ LDY #$00
1202 : b1 55 __ LDA (T3 + 0),y 
1204 : aa __ __ TAX
1205 : a9 01 __ LDA #$01
.l17:
1207 : 18 __ __ CLC
1208 : 65 55 __ ADC T3 + 0 
120a : 85 55 __ STA T3 + 0 
120c : 90 02 __ BCC $1210 ; (sformat.s106 + 0)
.s105:
120e : e6 56 __ INC T3 + 1 
.s106:
1210 : 8a __ __ TXA
1211 : e0 2b __ CPX #$2b
1213 : d0 07 __ BNE $121c ; (sformat.s18 + 0)
.s88:
1215 : a9 01 __ LDA #$01
1217 : 8d df 0f STA $0fdf ; (si.sign + 0)
121a : d0 e4 __ BNE $1200 ; (sformat.s85 + 0)
.s18:
121c : c9 30 __ CMP #$30
121e : d0 06 __ BNE $1226 ; (sformat.s19 + 0)
.s87:
1220 : 8d da 0f STA $0fda ; (si.fill + 0)
1223 : 4c 00 12 JMP $1200 ; (sformat.s85 + 0)
.s19:
1226 : c9 23 __ CMP #$23
1228 : d0 07 __ BNE $1231 ; (sformat.s20 + 0)
.s86:
122a : a9 01 __ LDA #$01
122c : 8d e1 0f STA $0fe1 ; (si.prefix + 0)
122f : d0 cf __ BNE $1200 ; (sformat.s85 + 0)
.s20:
1231 : c9 2d __ CMP #$2d
1233 : d0 07 __ BNE $123c ; (sformat.s21 + 0)
.s84:
1235 : a9 01 __ LDA #$01
1237 : 8d e0 0f STA $0fe0 ; (si.left + 0)
123a : d0 c4 __ BNE $1200 ; (sformat.s85 + 0)
.s21:
123c : 85 47 __ STA T2 + 0 
123e : c9 30 __ CMP #$30
1240 : 90 3c __ BCC $127e ; (sformat.s22 + 0)
.s80:
1242 : c9 3a __ CMP #$3a
1244 : b0 77 __ BCS $12bd ; (sformat.s23 + 0)
.s81:
1246 : a9 00 __ LDA #$00
1248 : 85 53 __ STA T1 + 0 
.l82:
124a : a5 53 __ LDA T1 + 0 
124c : 0a __ __ ASL
124d : 85 1b __ STA ACCU + 0 ; (buff + 1)
124f : a9 00 __ LDA #$00
1251 : 2a __ __ ROL
1252 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
1254 : 2a __ __ ROL
1255 : aa __ __ TAX
1256 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
1258 : 65 53 __ ADC T1 + 0 
125a : 0a __ __ ASL
125b : 18 __ __ CLC
125c : 65 47 __ ADC T2 + 0 
125e : 38 __ __ SEC
125f : e9 30 __ SBC #$30
1261 : 85 53 __ STA T1 + 0 
1263 : a0 00 __ LDY #$00
1265 : b1 55 __ LDA (T3 + 0),y 
1267 : 85 47 __ STA T2 + 0 
1269 : e6 55 __ INC T3 + 0 
126b : d0 02 __ BNE $126f ; (sformat.s114 + 0)
.s113:
126d : e6 56 __ INC T3 + 1 
.s114:
126f : c9 30 __ CMP #$30
1271 : 90 04 __ BCC $1277 ; (sformat.s104 + 0)
.s83:
1273 : c9 3a __ CMP #$3a
1275 : 90 d3 __ BCC $124a ; (sformat.l82 + 0)
.s104:
1277 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
1279 : a6 53 __ LDX T1 + 0 
127b : 8e db 0f STX $0fdb ; (si.width + 0)
.s22:
127e : c9 2e __ CMP #$2e
1280 : d0 3b __ BNE $12bd ; (sformat.s23 + 0)
.s76:
1282 : a9 00 __ LDA #$00
1284 : a6 1c __ LDX ACCU + 1 ; (fmt + 0)
1286 : 4c a0 12 JMP $12a0 ; (sformat.l77 + 0)
.s79:
1289 : a5 43 __ LDA T0 + 0 
128b : 0a __ __ ASL
128c : 85 1b __ STA ACCU + 0 ; (buff + 1)
128e : 98 __ __ TYA
128f : 2a __ __ ROL
1290 : 06 1b __ ASL ACCU + 0 ; (buff + 1)
1292 : 2a __ __ ROL
1293 : aa __ __ TAX
1294 : 18 __ __ CLC
1295 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
1297 : 65 43 __ ADC T0 + 0 
1299 : 0a __ __ ASL
129a : 18 __ __ CLC
129b : 65 47 __ ADC T2 + 0 
129d : 38 __ __ SEC
129e : e9 30 __ SBC #$30
.l77:
12a0 : 85 43 __ STA T0 + 0 
12a2 : a0 00 __ LDY #$00
12a4 : b1 55 __ LDA (T3 + 0),y 
12a6 : 85 47 __ STA T2 + 0 
12a8 : e6 55 __ INC T3 + 0 
12aa : d0 02 __ BNE $12ae ; (sformat.s108 + 0)
.s107:
12ac : e6 56 __ INC T3 + 1 
.s108:
12ae : c9 30 __ CMP #$30
12b0 : 90 04 __ BCC $12b6 ; (sformat.s103 + 0)
.s78:
12b2 : c9 3a __ CMP #$3a
12b4 : 90 d3 __ BCC $1289 ; (sformat.s79 + 0)
.s103:
12b6 : 86 1c __ STX ACCU + 1 ; (fmt + 0)
12b8 : a6 43 __ LDX T0 + 0 
12ba : 8e dc 0f STX $0fdc ; (si.precision + 0)
.s23:
12bd : c9 64 __ CMP #$64
12bf : f0 0c __ BEQ $12cd ; (sformat.s75 + 0)
.s24:
12c1 : c9 44 __ CMP #$44
12c3 : f0 08 __ BEQ $12cd ; (sformat.s75 + 0)
.s25:
12c5 : c9 69 __ CMP #$69
12c7 : f0 04 __ BEQ $12cd ; (sformat.s75 + 0)
.s26:
12c9 : c9 49 __ CMP #$49
12cb : d0 07 __ BNE $12d4 ; (sformat.s27 + 0)
.s75:
12cd : a9 01 __ LDA #$01
.s93:
12cf : 85 13 __ STA P6 
12d1 : 4c 15 15 JMP $1515 ; (sformat.s73 + 0)
.s27:
12d4 : c9 75 __ CMP #$75
12d6 : f0 04 __ BEQ $12dc ; (sformat.s74 + 0)
.s28:
12d8 : c9 55 __ CMP #$55
12da : d0 04 __ BNE $12e0 ; (sformat.s29 + 0)
.s74:
12dc : a9 00 __ LDA #$00
12de : f0 ef __ BEQ $12cf ; (sformat.s93 + 0)
.s29:
12e0 : c9 78 __ CMP #$78
12e2 : f0 04 __ BEQ $12e8 ; (sformat.s72 + 0)
.s30:
12e4 : c9 58 __ CMP #$58
12e6 : d0 15 __ BNE $12fd ; (sformat.s31 + 0)
.s72:
12e8 : a5 47 __ LDA T2 + 0 
12ea : 29 e0 __ AND #$e0
12ec : 09 01 __ ORA #$01
12ee : 8d dd 0f STA $0fdd ; (si.cha + 0)
12f1 : a9 00 __ LDA #$00
12f3 : 85 13 __ STA P6 
12f5 : a9 10 __ LDA #$10
12f7 : 8d de 0f STA $0fde ; (si.base + 0)
12fa : 4c 15 15 JMP $1515 ; (sformat.s73 + 0)
.s31:
12fd : c9 6c __ CMP #$6c
12ff : d0 03 __ BNE $1304 ; (sformat.s32 + 0)
1301 : 4c 86 14 JMP $1486 ; (sformat.s60 + 0)
.s32:
1304 : c9 4c __ CMP #$4c
1306 : f0 f9 __ BEQ $1301 ; (sformat.s31 + 4)
.s33:
1308 : c9 66 __ CMP #$66
130a : f0 14 __ BEQ $1320 ; (sformat.s59 + 0)
.s34:
130c : c9 67 __ CMP #$67
130e : f0 10 __ BEQ $1320 ; (sformat.s59 + 0)
.s35:
1310 : c9 65 __ CMP #$65
1312 : f0 0c __ BEQ $1320 ; (sformat.s59 + 0)
.s36:
1314 : c9 46 __ CMP #$46
1316 : f0 08 __ BEQ $1320 ; (sformat.s59 + 0)
.s37:
1318 : c9 47 __ CMP #$47
131a : f0 04 __ BEQ $1320 ; (sformat.s59 + 0)
.s38:
131c : c9 45 __ CMP #$45
131e : d0 5c __ BNE $137c ; (sformat.s39 + 0)
.s59:
1320 : a5 57 __ LDA T4 + 0 
1322 : 85 13 __ STA P6 
1324 : a5 58 __ LDA T4 + 1 
1326 : 85 14 __ STA P7 
1328 : a5 47 __ LDA T2 + 0 
132a : 29 e0 __ AND #$e0
132c : 09 01 __ ORA #$01
132e : 8d dd 0f STA $0fdd ; (si.cha + 0)
1331 : ad f7 0f LDA $0ff7 ; (sstack + 5)
1334 : 85 59 __ STA T5 + 0 
1336 : a9 da __ LDA #$da
1338 : 85 11 __ STA P4 
133a : a9 0f __ LDA #$0f
133c : 85 12 __ STA P5 
133e : ad f8 0f LDA $0ff8 ; (sstack + 6)
1341 : 85 5a __ STA T5 + 1 
1343 : a0 00 __ LDY #$00
1345 : b1 59 __ LDA (T5 + 0),y 
1347 : 85 15 __ STA P8 
1349 : c8 __ __ INY
134a : b1 59 __ LDA (T5 + 0),y 
134c : 85 16 __ STA P9 
134e : c8 __ __ INY
134f : b1 59 __ LDA (T5 + 0),y 
1351 : 85 17 __ STA P10 
1353 : c8 __ __ INY
1354 : b1 59 __ LDA (T5 + 0),y 
1356 : 85 18 __ STA P11 
1358 : a5 47 __ LDA T2 + 0 
135a : ed dd 0f SBC $0fdd ; (si.cha + 0)
135d : 18 __ __ CLC
135e : 69 61 __ ADC #$61
1360 : 8d f2 0f STA $0ff2 ; (sstack + 0)
1363 : 20 2a 18 JSR $182a ; (nformf.s1 + 0)
1366 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
1368 : 85 5b __ STA T6 + 0 
136a : 18 __ __ CLC
136b : a5 59 __ LDA T5 + 0 
136d : 69 04 __ ADC #$04
136f : 8d f7 0f STA $0ff7 ; (sstack + 5)
1372 : a5 5a __ LDA T5 + 1 
1374 : 69 00 __ ADC #$00
1376 : 8d f8 0f STA $0ff8 ; (sstack + 6)
1379 : 4c 30 11 JMP $1130 ; (sformat.l5 + 0)
.s39:
137c : c9 73 __ CMP #$73
137e : f0 3b __ BEQ $13bb ; (sformat.s47 + 0)
.s40:
1380 : c9 53 __ CMP #$53
1382 : f0 37 __ BEQ $13bb ; (sformat.s47 + 0)
.s41:
1384 : c9 63 __ CMP #$63
1386 : f0 12 __ BEQ $139a ; (sformat.s46 + 0)
.s42:
1388 : c9 43 __ CMP #$43
138a : f0 0e __ BEQ $139a ; (sformat.s46 + 0)
.s43:
138c : aa __ __ TAX
138d : f0 ea __ BEQ $1379 ; (sformat.s59 + 89)
.s44:
138f : a0 00 __ LDY #$00
1391 : 91 57 __ STA (T4 + 0),y 
.s45:
1393 : a9 01 __ LDA #$01
.s96:
1395 : 85 5b __ STA T6 + 0 
1397 : 4c 30 11 JMP $1130 ; (sformat.l5 + 0)
.s46:
139a : ad f7 0f LDA $0ff7 ; (sstack + 5)
139d : 85 43 __ STA T0 + 0 
139f : ad f8 0f LDA $0ff8 ; (sstack + 6)
13a2 : 85 44 __ STA T0 + 1 
13a4 : a0 00 __ LDY #$00
13a6 : b1 43 __ LDA (T0 + 0),y 
13a8 : 91 57 __ STA (T4 + 0),y 
13aa : a5 43 __ LDA T0 + 0 
13ac : 69 01 __ ADC #$01
13ae : 8d f7 0f STA $0ff7 ; (sstack + 5)
13b1 : a5 44 __ LDA T0 + 1 
13b3 : 69 00 __ ADC #$00
13b5 : 8d f8 0f STA $0ff8 ; (sstack + 6)
13b8 : 4c 93 13 JMP $1393 ; (sformat.s45 + 0)
.s47:
13bb : ad f7 0f LDA $0ff7 ; (sstack + 5)
13be : 85 43 __ STA T0 + 0 
13c0 : 69 01 __ ADC #$01
13c2 : 8d f7 0f STA $0ff7 ; (sstack + 5)
13c5 : ad f8 0f LDA $0ff8 ; (sstack + 6)
13c8 : 85 44 __ STA T0 + 1 
13ca : 69 00 __ ADC #$00
13cc : 8d f8 0f STA $0ff8 ; (sstack + 6)
13cf : a0 00 __ LDY #$00
13d1 : 84 5c __ STY T7 + 0 
13d3 : b1 43 __ LDA (T0 + 0),y 
13d5 : 85 1b __ STA ACCU + 0 ; (buff + 1)
13d7 : 85 53 __ STA T1 + 0 
13d9 : c8 __ __ INY
13da : b1 43 __ LDA (T0 + 0),y 
13dc : 85 1c __ STA ACCU + 1 ; (fmt + 0)
13de : 85 54 __ STA T1 + 1 
13e0 : ad db 0f LDA $0fdb ; (si.width + 0)
13e3 : f0 0c __ BEQ $13f1 ; (sformat.s48 + 0)
.s100:
13e5 : 88 __ __ DEY
13e6 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
13e8 : f0 05 __ BEQ $13ef ; (sformat.s101 + 0)
.l58:
13ea : c8 __ __ INY
13eb : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
13ed : d0 fb __ BNE $13ea ; (sformat.l58 + 0)
.s101:
13ef : 84 5c __ STY T7 + 0 
.s48:
13f1 : ad e0 0f LDA $0fe0 ; (si.left + 0)
13f4 : 85 59 __ STA T5 + 0 
13f6 : d0 19 __ BNE $1411 ; (sformat.s49 + 0)
.s98:
13f8 : a6 5c __ LDX T7 + 0 
13fa : ec db 0f CPX $0fdb ; (si.width + 0)
13fd : a0 00 __ LDY #$00
13ff : b0 0c __ BCS $140d ; (sformat.s99 + 0)
.l57:
1401 : ad da 0f LDA $0fda ; (si.fill + 0)
1404 : 91 57 __ STA (T4 + 0),y 
1406 : c8 __ __ INY
1407 : e8 __ __ INX
1408 : ec db 0f CPX $0fdb ; (si.width + 0)
140b : 90 f4 __ BCC $1401 ; (sformat.l57 + 0)
.s99:
140d : 86 5c __ STX T7 + 0 
140f : 84 5b __ STY T6 + 0 
.s49:
1411 : ac f9 0f LDY $0ff9 ; (sstack + 7)
1414 : d0 48 __ BNE $145e ; (sformat.s54 + 0)
.s50:
1416 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
1418 : f0 23 __ BEQ $143d ; (sformat.s51 + 0)
.s53:
141a : 18 __ __ CLC
141b : a5 1b __ LDA ACCU + 0 ; (buff + 1)
141d : 69 01 __ ADC #$01
141f : 85 43 __ STA T0 + 0 
1421 : a5 1c __ LDA ACCU + 1 ; (fmt + 0)
1423 : 69 00 __ ADC #$00
1425 : 85 44 __ STA T0 + 1 
1427 : b1 1b __ LDA (ACCU + 0),y ; (buff + 1)
.l92:
1429 : a4 5b __ LDY T6 + 0 
142b : 91 57 __ STA (T4 + 0),y 
142d : e6 5b __ INC T6 + 0 
142f : a0 00 __ LDY #$00
1431 : b1 43 __ LDA (T0 + 0),y 
1433 : a8 __ __ TAY
1434 : e6 43 __ INC T0 + 0 
1436 : d0 02 __ BNE $143a ; (sformat.s112 + 0)
.s111:
1438 : e6 44 __ INC T0 + 1 
.s112:
143a : 98 __ __ TYA
143b : d0 ec __ BNE $1429 ; (sformat.l92 + 0)
.s51:
143d : a5 59 __ LDA T5 + 0 
143f : d0 03 __ BNE $1444 ; (sformat.s97 + 0)
1441 : 4c 30 11 JMP $1130 ; (sformat.l5 + 0)
.s97:
1444 : a6 5c __ LDX T7 + 0 
1446 : ec db 0f CPX $0fdb ; (si.width + 0)
1449 : a4 5b __ LDY T6 + 0 
144b : b0 0c __ BCS $1459 ; (sformat.s102 + 0)
.l52:
144d : ad da 0f LDA $0fda ; (si.fill + 0)
1450 : 91 57 __ STA (T4 + 0),y 
1452 : c8 __ __ INY
1453 : e8 __ __ INX
1454 : ec db 0f CPX $0fdb ; (si.width + 0)
1457 : 90 f4 __ BCC $144d ; (sformat.l52 + 0)
.s102:
1459 : 84 5b __ STY T6 + 0 
145b : 4c 30 11 JMP $1130 ; (sformat.l5 + 0)
.s54:
145e : a4 5b __ LDY T6 + 0 
1460 : f0 11 __ BEQ $1473 ; (sformat.s55 + 0)
.s56:
1462 : a5 57 __ LDA T4 + 0 
1464 : 85 0e __ STA P1 
1466 : a5 58 __ LDA T4 + 1 
1468 : 85 0f __ STA P2 
146a : a9 00 __ LDA #$00
146c : 85 5b __ STA T6 + 0 
146e : 91 0e __ STA (P1),y 
1470 : 20 4f 15 JSR $154f ; (puts.l4 + 0)
.s55:
1473 : a5 53 __ LDA T1 + 0 
1475 : 85 0e __ STA P1 
1477 : a5 54 __ LDA T1 + 1 
1479 : 85 0f __ STA P2 
147b : 20 4f 15 JSR $154f ; (puts.l4 + 0)
147e : ad e0 0f LDA $0fe0 ; (si.left + 0)
1481 : d0 c1 __ BNE $1444 ; (sformat.s97 + 0)
1483 : 4c 30 11 JMP $1130 ; (sformat.l5 + 0)
.s60:
1486 : ad f7 0f LDA $0ff7 ; (sstack + 5)
1489 : 85 43 __ STA T0 + 0 
148b : 69 03 __ ADC #$03
148d : 8d f7 0f STA $0ff7 ; (sstack + 5)
1490 : ad f8 0f LDA $0ff8 ; (sstack + 6)
1493 : 85 44 __ STA T0 + 1 
1495 : 69 00 __ ADC #$00
1497 : 8d f8 0f STA $0ff8 ; (sstack + 6)
149a : a0 00 __ LDY #$00
149c : b1 55 __ LDA (T3 + 0),y 
149e : aa __ __ TAX
149f : e6 55 __ INC T3 + 0 
14a1 : d0 02 __ BNE $14a5 ; (sformat.s110 + 0)
.s109:
14a3 : e6 56 __ INC T3 + 1 
.s110:
14a5 : b1 43 __ LDA (T0 + 0),y 
14a7 : 85 1b __ STA ACCU + 0 ; (buff + 1)
14a9 : 85 11 __ STA P4 
14ab : a0 01 __ LDY #$01
14ad : b1 43 __ LDA (T0 + 0),y 
14af : 85 1c __ STA ACCU + 1 ; (fmt + 0)
14b1 : 85 12 __ STA P5 
14b3 : c8 __ __ INY
14b4 : b1 43 __ LDA (T0 + 0),y 
14b6 : 85 1d __ STA ACCU + 2 ; (fmt + 1)
14b8 : 85 13 __ STA P6 
14ba : c8 __ __ INY
14bb : b1 43 __ LDA (T0 + 0),y 
14bd : 85 14 __ STA P7 
14bf : e0 64 __ CPX #$64
14c1 : f0 0c __ BEQ $14cf ; (sformat.s71 + 0)
.s61:
14c3 : e0 44 __ CPX #$44
14c5 : f0 08 __ BEQ $14cf ; (sformat.s71 + 0)
.s62:
14c7 : e0 69 __ CPX #$69
14c9 : f0 04 __ BEQ $14cf ; (sformat.s71 + 0)
.s63:
14cb : e0 49 __ CPX #$49
14cd : d0 1c __ BNE $14eb ; (sformat.s64 + 0)
.s71:
14cf : a9 01 __ LDA #$01
.s94:
14d1 : 85 15 __ STA P8 
.s69:
14d3 : a5 57 __ LDA T4 + 0 
14d5 : 85 0f __ STA P2 
14d7 : a5 58 __ LDA T4 + 1 
14d9 : 85 10 __ STA P3 
14db : a9 da __ LDA #$da
14dd : 85 0d __ STA P0 
14df : a9 0f __ LDA #$0f
14e1 : 85 0e __ STA P1 
14e3 : 20 e0 16 JSR $16e0 ; (nforml.s4 + 0)
14e6 : a5 1b __ LDA ACCU + 0 ; (buff + 1)
14e8 : 4c 95 13 JMP $1395 ; (sformat.s96 + 0)
.s64:
14eb : e0 75 __ CPX #$75
14ed : f0 04 __ BEQ $14f3 ; (sformat.s70 + 0)
.s65:
14ef : e0 55 __ CPX #$55
14f1 : d0 04 __ BNE $14f7 ; (sformat.s66 + 0)
.s70:
14f3 : a9 00 __ LDA #$00
14f5 : f0 da __ BEQ $14d1 ; (sformat.s94 + 0)
.s66:
14f7 : e0 78 __ CPX #$78
14f9 : f0 06 __ BEQ $1501 ; (sformat.s68 + 0)
.s67:
14fb : 85 1e __ STA ACCU + 3 ; (fps + 0)
14fd : e0 58 __ CPX #$58
14ff : d0 82 __ BNE $1483 ; (sformat.s55 + 16)
.s68:
1501 : a9 00 __ LDA #$00
1503 : 85 15 __ STA P8 
1505 : a9 10 __ LDA #$10
1507 : 8d de 0f STA $0fde ; (si.base + 0)
150a : 8a __ __ TXA
150b : 29 e0 __ AND #$e0
150d : 09 01 __ ORA #$01
150f : 8d dd 0f STA $0fdd ; (si.cha + 0)
1512 : 4c d3 14 JMP $14d3 ; (sformat.s69 + 0)
.s73:
1515 : a5 57 __ LDA T4 + 0 
1517 : 85 0f __ STA P2 
1519 : a5 58 __ LDA T4 + 1 
151b : 85 10 __ STA P3 
151d : ad f7 0f LDA $0ff7 ; (sstack + 5)
1520 : 85 43 __ STA T0 + 0 
1522 : ad f8 0f LDA $0ff8 ; (sstack + 6)
1525 : 85 44 __ STA T0 + 1 
1527 : a0 00 __ LDY #$00
1529 : b1 43 __ LDA (T0 + 0),y 
152b : 85 11 __ STA P4 
152d : c8 __ __ INY
152e : b1 43 __ LDA (T0 + 0),y 
1530 : 85 12 __ STA P5 
1532 : 18 __ __ CLC
1533 : a5 43 __ LDA T0 + 0 
1535 : 69 02 __ ADC #$02
1537 : 8d f7 0f STA $0ff7 ; (sstack + 5)
153a : a5 44 __ LDA T0 + 1 
153c : 69 00 __ ADC #$00
153e : 8d f8 0f STA $0ff8 ; (sstack + 6)
1541 : a9 da __ LDA #$da
1543 : 85 0d __ STA P0 
1545 : a9 0f __ LDA #$0f
1547 : 85 0e __ STA P1 
1549 : 20 c5 15 JSR $15c5 ; (nformi.s4 + 0)
154c : 4c 95 13 JMP $1395 ; (sformat.s96 + 0)
--------------------------------------------------------------------
puts: ; puts(const u8*)->void
;  12, "/home/honza/projects/c64/projects/oscar64/include/stdio.h"
.l4:
154f : a0 00 __ LDY #$00
1551 : b1 0e __ LDA (P1),y ; (str + 0)
1553 : d0 01 __ BNE $1556 ; (puts.s5 + 0)
.s3:
1555 : 60 __ __ RTS
.s5:
1556 : e6 0e __ INC P1 ; (str + 0)
1558 : d0 02 __ BNE $155c ; (puts.s7 + 0)
.s6:
155a : e6 0f __ INC P2 ; (str + 1)
.s7:
155c : 20 62 15 JSR $1562 ; (putpch.s4 + 0)
155f : 4c 4f 15 JMP $154f ; (puts.l4 + 0)
--------------------------------------------------------------------
putpch: ; putpch(u8)->void
;  69, "/home/honza/projects/c64/projects/oscar64/include/conio.h"
.s4:
1562 : 85 0d __ STA P0 ; (c + 0)
1564 : ad 81 23 LDA $2381 ; (giocharmap + 0)
1567 : f0 32 __ BEQ $159b ; (putpch.s5 + 0)
.s6:
1569 : a5 0d __ LDA P0 ; (c + 0)
156b : c9 0a __ CMP #$0a
156d : d0 04 __ BNE $1573 ; (putpch.s7 + 0)
.s18:
156f : a9 0d __ LDA #$0d
1571 : d0 32 __ BNE $15a5 ; (putpch.s15 + 0)
.s7:
1573 : c9 09 __ CMP #$09
1575 : f0 36 __ BEQ $15ad ; (putpch.s16 + 0)
.s8:
1577 : ad 81 23 LDA $2381 ; (giocharmap + 0)
157a : c9 02 __ CMP #$02
157c : 90 1d __ BCC $159b ; (putpch.s5 + 0)
.s9:
157e : a5 0d __ LDA P0 ; (c + 0)
1580 : c9 41 __ CMP #$41
1582 : 90 17 __ BCC $159b ; (putpch.s5 + 0)
.s10:
1584 : c9 7b __ CMP #$7b
1586 : b0 13 __ BCS $159b ; (putpch.s5 + 0)
.s11:
1588 : c9 61 __ CMP #$61
158a : b0 04 __ BCS $1590 ; (putpch.s13 + 0)
.s12:
158c : c9 5b __ CMP #$5b
158e : b0 0b __ BCS $159b ; (putpch.s5 + 0)
.s13:
1590 : 49 20 __ EOR #$20
1592 : 85 0d __ STA P0 ; (c + 0)
1594 : ad 81 23 LDA $2381 ; (giocharmap + 0)
1597 : c9 02 __ CMP #$02
1599 : f0 06 __ BEQ $15a1 ; (putpch.s14 + 0)
.s5:
159b : a5 0d __ LDA P0 ; (c + 0)
159d : 20 d2 ff JSR $ffd2 
.s3:
15a0 : 60 __ __ RTS
.s14:
15a1 : a5 0d __ LDA P0 ; (c + 0)
15a3 : 29 5f __ AND #$5f
.s15:
15a5 : 85 43 __ STA T0 + 0 
15a7 : a5 43 __ LDA T0 + 0 
15a9 : 20 d2 ff JSR $ffd2 
15ac : 60 __ __ RTS
.s16:
15ad : a5 d3 __ LDA $d3 
15af : 29 03 __ AND #$03
15b1 : 85 43 __ STA T0 + 0 
15b3 : a9 20 __ LDA #$20
15b5 : 85 44 __ STA T1 + 0 
.l17:
15b7 : a5 44 __ LDA T1 + 0 
15b9 : 20 d2 ff JSR $ffd2 
15bc : e6 43 __ INC T0 + 0 
15be : a5 43 __ LDA T0 + 0 
15c0 : c9 04 __ CMP #$04
15c2 : 90 f3 __ BCC $15b7 ; (putpch.l17 + 0)
15c4 : 60 __ __ RTS
--------------------------------------------------------------------
nformi: ; nformi(const struct sinfo*,u8*,i16,bool)->u8
;  79, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
15c5 : a9 00 __ LDA #$00
15c7 : 85 43 __ STA T5 + 0 
15c9 : a0 04 __ LDY #$04
15cb : b1 0d __ LDA (P0),y ; (si + 0)
15cd : 85 44 __ STA T6 + 0 
15cf : a5 13 __ LDA P6 ; (s + 0)
15d1 : f0 13 __ BEQ $15e6 ; (nformi.s5 + 0)
.s33:
15d3 : 24 12 __ BIT P5 ; (v + 1)
15d5 : 10 0f __ BPL $15e6 ; (nformi.s5 + 0)
.s34:
15d7 : 38 __ __ SEC
15d8 : a9 00 __ LDA #$00
15da : e5 11 __ SBC P4 ; (v + 0)
15dc : 85 11 __ STA P4 ; (v + 0)
15de : a9 00 __ LDA #$00
15e0 : e5 12 __ SBC P5 ; (v + 1)
15e2 : 85 12 __ STA P5 ; (v + 1)
15e4 : e6 43 __ INC T5 + 0 
.s5:
15e6 : a9 10 __ LDA #$10
15e8 : 85 45 __ STA T7 + 0 
15ea : a5 11 __ LDA P4 ; (v + 0)
15ec : 05 12 __ ORA P5 ; (v + 1)
15ee : f0 33 __ BEQ $1623 ; (nformi.s6 + 0)
.s28:
15f0 : a5 11 __ LDA P4 ; (v + 0)
15f2 : 85 1b __ STA ACCU + 0 
15f4 : a5 12 __ LDA P5 ; (v + 1)
15f6 : 85 1c __ STA ACCU + 1 
.l29:
15f8 : a5 44 __ LDA T6 + 0 
15fa : 85 03 __ STA WORK + 0 
15fc : a9 00 __ LDA #$00
15fe : 85 04 __ STA WORK + 1 
1600 : 20 96 20 JSR $2096 ; (divmod + 0)
1603 : a5 05 __ LDA WORK + 2 
1605 : c9 0a __ CMP #$0a
1607 : b0 04 __ BCS $160d ; (nformi.s32 + 0)
.s30:
1609 : a9 30 __ LDA #$30
160b : 90 06 __ BCC $1613 ; (nformi.s31 + 0)
.s32:
160d : a0 03 __ LDY #$03
160f : b1 0d __ LDA (P0),y ; (si + 0)
1611 : e9 0a __ SBC #$0a
.s31:
1613 : 18 __ __ CLC
1614 : 65 05 __ ADC WORK + 2 
1616 : a6 45 __ LDX T7 + 0 
1618 : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
161b : c6 45 __ DEC T7 + 0 
161d : a5 1b __ LDA ACCU + 0 
161f : 05 1c __ ORA ACCU + 1 
1621 : d0 d5 __ BNE $15f8 ; (nformi.l29 + 0)
.s6:
1623 : a0 02 __ LDY #$02
1625 : b1 0d __ LDA (P0),y ; (si + 0)
1627 : c9 ff __ CMP #$ff
1629 : d0 04 __ BNE $162f ; (nformi.s27 + 0)
.s7:
162b : a9 0f __ LDA #$0f
162d : d0 05 __ BNE $1634 ; (nformi.s39 + 0)
.s27:
162f : 38 __ __ SEC
1630 : a9 10 __ LDA #$10
1632 : f1 0d __ SBC (P0),y ; (si + 0)
.s39:
1634 : a8 __ __ TAY
1635 : c4 45 __ CPY T7 + 0 
1637 : b0 0d __ BCS $1646 ; (nformi.s8 + 0)
.s26:
1639 : a9 30 __ LDA #$30
.l40:
163b : a6 45 __ LDX T7 + 0 
163d : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
1640 : c6 45 __ DEC T7 + 0 
1642 : c4 45 __ CPY T7 + 0 
1644 : 90 f5 __ BCC $163b ; (nformi.l40 + 0)
.s8:
1646 : a0 07 __ LDY #$07
1648 : b1 0d __ LDA (P0),y ; (si + 0)
164a : f0 1c __ BEQ $1668 ; (nformi.s9 + 0)
.s24:
164c : a5 44 __ LDA T6 + 0 
164e : c9 10 __ CMP #$10
1650 : d0 16 __ BNE $1668 ; (nformi.s9 + 0)
.s25:
1652 : a0 03 __ LDY #$03
1654 : b1 0d __ LDA (P0),y ; (si + 0)
1656 : a8 __ __ TAY
1657 : a9 30 __ LDA #$30
1659 : a6 45 __ LDX T7 + 0 
165b : ca __ __ DEX
165c : ca __ __ DEX
165d : 86 45 __ STX T7 + 0 
165f : 9d e2 0f STA $0fe2,x ; (buffer[0] + 0)
1662 : 98 __ __ TYA
1663 : 69 16 __ ADC #$16
1665 : 9d e3 0f STA $0fe3,x ; (buffer[0] + 1)
.s9:
1668 : a9 00 __ LDA #$00
166a : 85 1b __ STA ACCU + 0 
166c : a5 43 __ LDA T5 + 0 
166e : f0 0c __ BEQ $167c ; (nformi.s10 + 0)
.s23:
1670 : a9 2d __ LDA #$2d
.s22:
1672 : a6 45 __ LDX T7 + 0 
1674 : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
1677 : c6 45 __ DEC T7 + 0 
1679 : 4c 86 16 JMP $1686 ; (nformi.s11 + 0)
.s10:
167c : a0 05 __ LDY #$05
167e : b1 0d __ LDA (P0),y ; (si + 0)
1680 : f0 04 __ BEQ $1686 ; (nformi.s11 + 0)
.s21:
1682 : a9 2b __ LDA #$2b
1684 : d0 ec __ BNE $1672 ; (nformi.s22 + 0)
.s11:
1686 : a6 45 __ LDX T7 + 0 
1688 : a0 06 __ LDY #$06
168a : b1 0d __ LDA (P0),y ; (si + 0)
168c : d0 2b __ BNE $16b9 ; (nformi.s17 + 0)
.l12:
168e : 8a __ __ TXA
168f : 18 __ __ CLC
1690 : a0 01 __ LDY #$01
1692 : 71 0d __ ADC (P0),y ; (si + 0)
1694 : b0 04 __ BCS $169a ; (nformi.s15 + 0)
.s16:
1696 : c9 11 __ CMP #$11
1698 : 90 0a __ BCC $16a4 ; (nformi.s13 + 0)
.s15:
169a : a0 00 __ LDY #$00
169c : b1 0d __ LDA (P0),y ; (si + 0)
169e : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
16a1 : ca __ __ DEX
16a2 : b0 ea __ BCS $168e ; (nformi.l12 + 0)
.s13:
16a4 : e0 10 __ CPX #$10
16a6 : b0 0e __ BCS $16b6 ; (nformi.s41 + 0)
.s14:
16a8 : 88 __ __ DEY
.l37:
16a9 : bd e2 0f LDA $0fe2,x ; (buffer[0] + 0)
16ac : 91 0f __ STA (P2),y ; (str + 0)
16ae : c8 __ __ INY
16af : e8 __ __ INX
16b0 : e0 10 __ CPX #$10
16b2 : 90 f5 __ BCC $16a9 ; (nformi.l37 + 0)
.s38:
16b4 : 84 1b __ STY ACCU + 0 
.s41:
16b6 : a5 1b __ LDA ACCU + 0 
.s3:
16b8 : 60 __ __ RTS
.s17:
16b9 : e0 10 __ CPX #$10
16bb : b0 1a __ BCS $16d7 ; (nformi.l18 + 0)
.s20:
16bd : a0 00 __ LDY #$00
.l35:
16bf : bd e2 0f LDA $0fe2,x ; (buffer[0] + 0)
16c2 : 91 0f __ STA (P2),y ; (str + 0)
16c4 : c8 __ __ INY
16c5 : e8 __ __ INX
16c6 : e0 10 __ CPX #$10
16c8 : 90 f5 __ BCC $16bf ; (nformi.l35 + 0)
.s36:
16ca : 84 1b __ STY ACCU + 0 
16cc : b0 09 __ BCS $16d7 ; (nformi.l18 + 0)
.s19:
16ce : 88 __ __ DEY
16cf : b1 0d __ LDA (P0),y ; (si + 0)
16d1 : a4 1b __ LDY ACCU + 0 
16d3 : 91 0f __ STA (P2),y ; (str + 0)
16d5 : e6 1b __ INC ACCU + 0 
.l18:
16d7 : a5 1b __ LDA ACCU + 0 
16d9 : a0 01 __ LDY #$01
16db : d1 0d __ CMP (P0),y ; (si + 0)
16dd : 90 ef __ BCC $16ce ; (nformi.s19 + 0)
16df : 60 __ __ RTS
--------------------------------------------------------------------
nforml: ; nforml(const struct sinfo*,u8*,i32,bool)->u8
; 137, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s4:
16e0 : a9 00 __ LDA #$00
16e2 : 85 43 __ STA T4 + 0 
16e4 : a5 15 __ LDA P8 ; (s + 0)
16e6 : f0 1f __ BEQ $1707 ; (nforml.s5 + 0)
.s35:
16e8 : 24 14 __ BIT P7 ; (v + 3)
16ea : 10 1b __ BPL $1707 ; (nforml.s5 + 0)
.s36:
16ec : 38 __ __ SEC
16ed : a9 00 __ LDA #$00
16ef : e5 11 __ SBC P4 ; (v + 0)
16f1 : 85 11 __ STA P4 ; (v + 0)
16f3 : a9 00 __ LDA #$00
16f5 : e5 12 __ SBC P5 ; (v + 1)
16f7 : 85 12 __ STA P5 ; (v + 1)
16f9 : a9 00 __ LDA #$00
16fb : e5 13 __ SBC P6 ; (v + 2)
16fd : 85 13 __ STA P6 ; (v + 2)
16ff : a9 00 __ LDA #$00
1701 : e5 14 __ SBC P7 ; (v + 3)
1703 : 85 14 __ STA P7 ; (v + 3)
1705 : e6 43 __ INC T4 + 0 
.s5:
1707 : a9 10 __ LDA #$10
1709 : 85 44 __ STA T5 + 0 
170b : a5 14 __ LDA P7 ; (v + 3)
170d : f0 03 __ BEQ $1712 ; (nforml.s31 + 0)
170f : 4c da 17 JMP $17da ; (nforml.l28 + 0)
.s31:
1712 : a5 13 __ LDA P6 ; (v + 2)
1714 : d0 f9 __ BNE $170f ; (nforml.s5 + 8)
.s32:
1716 : a5 12 __ LDA P5 ; (v + 1)
1718 : d0 f5 __ BNE $170f ; (nforml.s5 + 8)
.s33:
171a : c5 11 __ CMP P4 ; (v + 0)
171c : 90 f1 __ BCC $170f ; (nforml.s5 + 8)
.s6:
171e : a0 02 __ LDY #$02
1720 : b1 0d __ LDA (P0),y ; (si + 0)
1722 : c9 ff __ CMP #$ff
1724 : d0 04 __ BNE $172a ; (nforml.s27 + 0)
.s7:
1726 : a9 0f __ LDA #$0f
1728 : d0 05 __ BNE $172f ; (nforml.s41 + 0)
.s27:
172a : 38 __ __ SEC
172b : a9 10 __ LDA #$10
172d : f1 0d __ SBC (P0),y ; (si + 0)
.s41:
172f : a8 __ __ TAY
1730 : c4 44 __ CPY T5 + 0 
1732 : b0 0d __ BCS $1741 ; (nforml.s8 + 0)
.s26:
1734 : a9 30 __ LDA #$30
.l42:
1736 : a6 44 __ LDX T5 + 0 
1738 : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
173b : c6 44 __ DEC T5 + 0 
173d : c4 44 __ CPY T5 + 0 
173f : 90 f5 __ BCC $1736 ; (nforml.l42 + 0)
.s8:
1741 : a0 07 __ LDY #$07
1743 : b1 0d __ LDA (P0),y ; (si + 0)
1745 : f0 1d __ BEQ $1764 ; (nforml.s9 + 0)
.s24:
1747 : a0 04 __ LDY #$04
1749 : b1 0d __ LDA (P0),y ; (si + 0)
174b : c9 10 __ CMP #$10
174d : d0 15 __ BNE $1764 ; (nforml.s9 + 0)
.s25:
174f : 88 __ __ DEY
1750 : b1 0d __ LDA (P0),y ; (si + 0)
1752 : a8 __ __ TAY
1753 : a9 30 __ LDA #$30
1755 : a6 44 __ LDX T5 + 0 
1757 : ca __ __ DEX
1758 : ca __ __ DEX
1759 : 86 44 __ STX T5 + 0 
175b : 9d e2 0f STA $0fe2,x ; (buffer[0] + 0)
175e : 98 __ __ TYA
175f : 69 16 __ ADC #$16
1761 : 9d e3 0f STA $0fe3,x ; (buffer[0] + 1)
.s9:
1764 : a9 00 __ LDA #$00
1766 : 85 1b __ STA ACCU + 0 
1768 : a5 43 __ LDA T4 + 0 
176a : f0 0c __ BEQ $1778 ; (nforml.s10 + 0)
.s23:
176c : a9 2d __ LDA #$2d
.s22:
176e : a6 44 __ LDX T5 + 0 
1770 : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
1773 : c6 44 __ DEC T5 + 0 
1775 : 4c 82 17 JMP $1782 ; (nforml.s11 + 0)
.s10:
1778 : a0 05 __ LDY #$05
177a : b1 0d __ LDA (P0),y ; (si + 0)
177c : f0 04 __ BEQ $1782 ; (nforml.s11 + 0)
.s21:
177e : a9 2b __ LDA #$2b
1780 : d0 ec __ BNE $176e ; (nforml.s22 + 0)
.s11:
1782 : a0 06 __ LDY #$06
1784 : a6 44 __ LDX T5 + 0 
1786 : b1 0d __ LDA (P0),y ; (si + 0)
1788 : d0 29 __ BNE $17b3 ; (nforml.s17 + 0)
.l12:
178a : 8a __ __ TXA
178b : 18 __ __ CLC
178c : a0 01 __ LDY #$01
178e : 71 0d __ ADC (P0),y ; (si + 0)
1790 : b0 04 __ BCS $1796 ; (nforml.s15 + 0)
.s16:
1792 : c9 11 __ CMP #$11
1794 : 90 0a __ BCC $17a0 ; (nforml.s13 + 0)
.s15:
1796 : a0 00 __ LDY #$00
1798 : b1 0d __ LDA (P0),y ; (si + 0)
179a : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
179d : ca __ __ DEX
179e : b0 ea __ BCS $178a ; (nforml.l12 + 0)
.s13:
17a0 : e0 10 __ CPX #$10
17a2 : b0 0e __ BCS $17b2 ; (nforml.s3 + 0)
.s14:
17a4 : 88 __ __ DEY
.l39:
17a5 : bd e2 0f LDA $0fe2,x ; (buffer[0] + 0)
17a8 : 91 0f __ STA (P2),y ; (str + 0)
17aa : c8 __ __ INY
17ab : e8 __ __ INX
17ac : e0 10 __ CPX #$10
17ae : 90 f5 __ BCC $17a5 ; (nforml.l39 + 0)
.s40:
17b0 : 84 1b __ STY ACCU + 0 
.s3:
17b2 : 60 __ __ RTS
.s17:
17b3 : e0 10 __ CPX #$10
17b5 : b0 1a __ BCS $17d1 ; (nforml.l18 + 0)
.s20:
17b7 : a0 00 __ LDY #$00
.l37:
17b9 : bd e2 0f LDA $0fe2,x ; (buffer[0] + 0)
17bc : 91 0f __ STA (P2),y ; (str + 0)
17be : c8 __ __ INY
17bf : e8 __ __ INX
17c0 : e0 10 __ CPX #$10
17c2 : 90 f5 __ BCC $17b9 ; (nforml.l37 + 0)
.s38:
17c4 : 84 1b __ STY ACCU + 0 
17c6 : b0 09 __ BCS $17d1 ; (nforml.l18 + 0)
.s19:
17c8 : 88 __ __ DEY
17c9 : b1 0d __ LDA (P0),y ; (si + 0)
17cb : a4 1b __ LDY ACCU + 0 
17cd : 91 0f __ STA (P2),y ; (str + 0)
17cf : e6 1b __ INC ACCU + 0 
.l18:
17d1 : a5 1b __ LDA ACCU + 0 
17d3 : a0 01 __ LDY #$01
17d5 : d1 0d __ CMP (P0),y ; (si + 0)
17d7 : 90 ef __ BCC $17c8 ; (nforml.s19 + 0)
17d9 : 60 __ __ RTS
.l28:
17da : a0 04 __ LDY #$04
17dc : b1 0d __ LDA (P0),y ; (si + 0)
17de : 85 03 __ STA WORK + 0 
17e0 : a5 11 __ LDA P4 ; (v + 0)
17e2 : 85 1b __ STA ACCU + 0 
17e4 : a5 12 __ LDA P5 ; (v + 1)
17e6 : 85 1c __ STA ACCU + 1 
17e8 : a5 13 __ LDA P6 ; (v + 2)
17ea : 85 1d __ STA ACCU + 2 
17ec : a5 14 __ LDA P7 ; (v + 3)
17ee : 85 1e __ STA ACCU + 3 
17f0 : a9 00 __ LDA #$00
17f2 : 85 04 __ STA WORK + 1 
17f4 : 85 05 __ STA WORK + 2 
17f6 : 85 06 __ STA WORK + 3 
17f8 : 20 db 21 JSR $21db ; (divmod32 + 0)
17fb : a5 07 __ LDA WORK + 4 
17fd : c9 0a __ CMP #$0a
17ff : b0 04 __ BCS $1805 ; (nforml.s34 + 0)
.s29:
1801 : a9 30 __ LDA #$30
1803 : 90 06 __ BCC $180b ; (nforml.s30 + 0)
.s34:
1805 : a0 03 __ LDY #$03
1807 : b1 0d __ LDA (P0),y ; (si + 0)
1809 : e9 0a __ SBC #$0a
.s30:
180b : 18 __ __ CLC
180c : 65 07 __ ADC WORK + 4 
180e : a6 44 __ LDX T5 + 0 
1810 : 9d e1 0f STA $0fe1,x ; (si.prefix + 0)
1813 : c6 44 __ DEC T5 + 0 
1815 : a5 1b __ LDA ACCU + 0 
1817 : 85 11 __ STA P4 ; (v + 0)
1819 : a5 1c __ LDA ACCU + 1 
181b : 85 12 __ STA P5 ; (v + 1)
181d : a5 1d __ LDA ACCU + 2 
181f : 85 13 __ STA P6 ; (v + 2)
1821 : a5 1e __ LDA ACCU + 3 
1823 : 85 14 __ STA P7 ; (v + 3)
1825 : d0 b3 __ BNE $17da ; (nforml.l28 + 0)
1827 : 4c 12 17 JMP $1712 ; (nforml.s31 + 0)
--------------------------------------------------------------------
nformf: ; nformf(const struct sinfo*,u8*,float,u8)->u8
; 199, "/home/honza/projects/c64/projects/oscar64/include/stdio.c"
.s1:
182a : a2 03 __ LDX #$03
182c : b5 53 __ LDA T7 + 0,x 
182e : 9d e9 0f STA $0fe9,x ; (nformf@stack + 0)
1831 : ca __ __ DEX
1832 : 10 f8 __ BPL $182c ; (nformf.s1 + 2)
.s4:
1834 : a5 16 __ LDA P9 ; (f + 1)
1836 : 85 44 __ STA T0 + 1 
1838 : a5 17 __ LDA P10 ; (f + 2)
183a : 85 45 __ STA T0 + 2 
183c : a5 18 __ LDA P11 ; (f + 3)
183e : 29 7f __ AND #$7f
1840 : 05 17 __ ORA P10 ; (f + 2)
1842 : 05 16 __ ORA P9 ; (f + 1)
1844 : 05 15 __ ORA P8 ; (f + 0)
1846 : f0 21 __ BEQ $1869 ; (nformf.s5 + 0)
.s107:
1848 : 24 18 __ BIT P11 ; (f + 3)
184a : 10 1d __ BPL $1869 ; (nformf.s5 + 0)
.s106:
184c : a9 2d __ LDA #$2d
184e : a0 00 __ LDY #$00
1850 : 91 13 __ STA (P6),y ; (str + 0)
1852 : a5 18 __ LDA P11 ; (f + 3)
1854 : 49 80 __ EOR #$80
1856 : 85 10 __ STA P3 
1858 : 85 18 __ STA P11 ; (f + 3)
185a : a5 15 __ LDA P8 ; (f + 0)
185c : 85 0d __ STA P0 
185e : a5 16 __ LDA P9 ; (f + 1)
1860 : 85 0e __ STA P1 
1862 : a5 17 __ LDA P10 ; (f + 2)
1864 : 85 0f __ STA P2 
1866 : 4c 7d 1d JMP $1d7d ; (nformf.s104 + 0)
.s5:
1869 : a5 15 __ LDA P8 ; (f + 0)
186b : 85 0d __ STA P0 
186d : a5 16 __ LDA P9 ; (f + 1)
186f : 85 0e __ STA P1 
1871 : a5 17 __ LDA P10 ; (f + 2)
1873 : 85 0f __ STA P2 
1875 : a5 18 __ LDA P11 ; (f + 3)
1877 : 85 10 __ STA P3 
1879 : a0 05 __ LDY #$05
187b : b1 11 __ LDA (P4),y ; (si + 0)
187d : f0 09 __ BEQ $1888 ; (nformf.s6 + 0)
.s103:
187f : a9 2b __ LDA #$2b
1881 : a0 00 __ LDY #$00
1883 : 91 13 __ STA (P6),y ; (str + 0)
1885 : 4c 7d 1d JMP $1d7d ; (nformf.s104 + 0)
.s6:
1888 : 20 8e 1d JSR $1d8e ; (isinf.s4 + 0)
188b : a2 00 __ LDX #$00
188d : 86 54 __ STX T9 + 0 
188f : a8 __ __ TAY
1890 : f0 05 __ BEQ $1897 ; (nformf.s7 + 0)
.s101:
1892 : a9 02 __ LDA #$02
1894 : 4c 4d 1d JMP $1d4d ; (nformf.s102 + 0)
.s7:
1897 : a5 11 __ LDA P4 ; (si + 0)
1899 : 85 4b __ STA T2 + 0 
189b : a5 12 __ LDA P5 ; (si + 1)
189d : 85 4c __ STA T2 + 1 
189f : a0 02 __ LDY #$02
18a1 : b1 11 __ LDA (P4),y ; (si + 0)
18a3 : c9 ff __ CMP #$ff
18a5 : d0 02 __ BNE $18a9 ; (nformf.s100 + 0)
.s8:
18a7 : a9 06 __ LDA #$06
.s100:
18a9 : 85 4d __ STA T3 + 0 
18ab : 85 52 __ STA T6 + 0 
18ad : a9 00 __ LDA #$00
18af : 85 4f __ STA T4 + 0 
18b1 : 85 50 __ STA T4 + 1 
18b3 : a5 18 __ LDA P11 ; (f + 3)
18b5 : 85 46 __ STA T0 + 3 
18b7 : 29 7f __ AND #$7f
18b9 : 05 17 __ ORA P10 ; (f + 2)
18bb : 05 16 __ ORA P9 ; (f + 1)
18bd : a6 15 __ LDX P8 ; (f + 0)
18bf : 86 43 __ STX T0 + 0 
18c1 : 05 15 __ ORA P8 ; (f + 0)
18c3 : d0 03 __ BNE $18c8 ; (nformf.s67 + 0)
18c5 : 4c fc 19 JMP $19fc ; (nformf.s9 + 0)
.s67:
18c8 : a5 18 __ LDA P11 ; (f + 3)
18ca : 10 03 __ BPL $18cf ; (nformf.s95 + 0)
18cc : 4c 4e 19 JMP $194e ; (nformf.l80 + 0)
.s95:
18cf : c9 44 __ CMP #$44
18d1 : d0 0d __ BNE $18e0 ; (nformf.l99 + 0)
.s96:
18d3 : a5 17 __ LDA P10 ; (f + 2)
18d5 : c9 7a __ CMP #$7a
18d7 : d0 07 __ BNE $18e0 ; (nformf.l99 + 0)
.s97:
18d9 : a5 16 __ LDA P9 ; (f + 1)
18db : d0 03 __ BNE $18e0 ; (nformf.l99 + 0)
.s98:
18dd : 8a __ __ TXA
18de : f0 02 __ BEQ $18e2 ; (nformf.l90 + 0)
.l99:
18e0 : 90 54 __ BCC $1936 ; (nformf.s68 + 0)
.l90:
18e2 : 18 __ __ CLC
18e3 : a5 4f __ LDA T4 + 0 
18e5 : 69 03 __ ADC #$03
18e7 : 85 4f __ STA T4 + 0 
18e9 : 90 02 __ BCC $18ed ; (nformf.s121 + 0)
.s120:
18eb : e6 50 __ INC T4 + 1 
.s121:
18ed : a5 43 __ LDA T0 + 0 
18ef : 85 1b __ STA ACCU + 0 
18f1 : a5 44 __ LDA T0 + 1 
18f3 : 85 1c __ STA ACCU + 1 
18f5 : a5 45 __ LDA T0 + 2 
18f7 : 85 1d __ STA ACCU + 2 
18f9 : a5 46 __ LDA T0 + 3 
18fb : 85 1e __ STA ACCU + 3 
18fd : a9 00 __ LDA #$00
18ff : 85 03 __ STA WORK + 0 
1901 : 85 04 __ STA WORK + 1 
1903 : a9 7a __ LDA #$7a
1905 : 85 05 __ STA WORK + 2 
1907 : a9 44 __ LDA #$44
1909 : 85 06 __ STA WORK + 3 
190b : 20 c8 1d JSR $1dc8 ; (freg + 20)
190e : 20 ae 1f JSR $1fae ; (crt_fdiv + 0)
1911 : a5 1b __ LDA ACCU + 0 
1913 : 85 43 __ STA T0 + 0 
1915 : a5 1c __ LDA ACCU + 1 
1917 : 85 44 __ STA T0 + 1 
1919 : a6 1d __ LDX ACCU + 2 
191b : 86 45 __ STX T0 + 2 
191d : a5 1e __ LDA ACCU + 3 
191f : 85 46 __ STA T0 + 3 
1921 : 30 13 __ BMI $1936 ; (nformf.s68 + 0)
.s91:
1923 : c9 44 __ CMP #$44
1925 : d0 b9 __ BNE $18e0 ; (nformf.l99 + 0)
.s92:
1927 : e0 7a __ CPX #$7a
1929 : d0 b5 __ BNE $18e0 ; (nformf.l99 + 0)
.s93:
192b : a5 1c __ LDA ACCU + 1 
192d : 38 __ __ SEC
192e : d0 b0 __ BNE $18e0 ; (nformf.l99 + 0)
.s94:
1930 : a5 1b __ LDA ACCU + 0 
1932 : f0 ae __ BEQ $18e2 ; (nformf.l90 + 0)
1934 : d0 aa __ BNE $18e0 ; (nformf.l99 + 0)
.s68:
1936 : a5 46 __ LDA T0 + 3 
1938 : 30 14 __ BMI $194e ; (nformf.l80 + 0)
.s86:
193a : c9 3f __ CMP #$3f
193c : d0 0e __ BNE $194c ; (nformf.s85 + 0)
.s87:
193e : a5 45 __ LDA T0 + 2 
1940 : c9 80 __ CMP #$80
1942 : d0 08 __ BNE $194c ; (nformf.s85 + 0)
.s88:
1944 : a5 44 __ LDA T0 + 1 
1946 : d0 04 __ BNE $194c ; (nformf.s85 + 0)
.s89:
1948 : a5 43 __ LDA T0 + 0 
194a : f0 49 __ BEQ $1995 ; (nformf.s69 + 0)
.s85:
194c : b0 47 __ BCS $1995 ; (nformf.s69 + 0)
.l80:
194e : 38 __ __ SEC
194f : a5 4f __ LDA T4 + 0 
1951 : e9 03 __ SBC #$03
1953 : 85 4f __ STA T4 + 0 
1955 : b0 02 __ BCS $1959 ; (nformf.s116 + 0)
.s115:
1957 : c6 50 __ DEC T4 + 1 
.s116:
1959 : a9 00 __ LDA #$00
195b : 85 1b __ STA ACCU + 0 
195d : 85 1c __ STA ACCU + 1 
195f : a9 7a __ LDA #$7a
1961 : 85 1d __ STA ACCU + 2 
1963 : a9 44 __ LDA #$44
1965 : 85 1e __ STA ACCU + 3 
1967 : a2 43 __ LDX #$43
1969 : 20 b8 1d JSR $1db8 ; (freg + 4)
196c : 20 e6 1e JSR $1ee6 ; (crt_fmul + 0)
196f : a5 1b __ LDA ACCU + 0 
1971 : 85 43 __ STA T0 + 0 
1973 : a5 1c __ LDA ACCU + 1 
1975 : 85 44 __ STA T0 + 1 
1977 : a6 1d __ LDX ACCU + 2 
1979 : 86 45 __ STX T0 + 2 
197b : a5 1e __ LDA ACCU + 3 
197d : 85 46 __ STA T0 + 3 
197f : 30 cd __ BMI $194e ; (nformf.l80 + 0)
.s81:
1981 : c9 3f __ CMP #$3f
1983 : 90 c9 __ BCC $194e ; (nformf.l80 + 0)
.s122:
1985 : d0 0e __ BNE $1995 ; (nformf.s69 + 0)
.s82:
1987 : e0 80 __ CPX #$80
1989 : 90 c3 __ BCC $194e ; (nformf.l80 + 0)
.s123:
198b : d0 08 __ BNE $1995 ; (nformf.s69 + 0)
.s83:
198d : a5 1c __ LDA ACCU + 1 
198f : d0 bb __ BNE $194c ; (nformf.s85 + 0)
.s84:
1991 : a5 1b __ LDA ACCU + 0 
1993 : d0 b7 __ BNE $194c ; (nformf.s85 + 0)
.s69:
1995 : a5 46 __ LDA T0 + 3 
1997 : 30 63 __ BMI $19fc ; (nformf.s9 + 0)
.s75:
1999 : c9 41 __ CMP #$41
199b : d0 0e __ BNE $19ab ; (nformf.l79 + 0)
.s76:
199d : a5 45 __ LDA T0 + 2 
199f : c9 20 __ CMP #$20
19a1 : d0 08 __ BNE $19ab ; (nformf.l79 + 0)
.s77:
19a3 : a5 44 __ LDA T0 + 1 
19a5 : d0 04 __ BNE $19ab ; (nformf.l79 + 0)
.s78:
19a7 : a5 43 __ LDA T0 + 0 
19a9 : f0 02 __ BEQ $19ad ; (nformf.l70 + 0)
.l79:
19ab : 90 4f __ BCC $19fc ; (nformf.s9 + 0)
.l70:
19ad : e6 4f __ INC T4 + 0 
19af : d0 02 __ BNE $19b3 ; (nformf.s119 + 0)
.s118:
19b1 : e6 50 __ INC T4 + 1 
.s119:
19b3 : a5 43 __ LDA T0 + 0 
19b5 : 85 1b __ STA ACCU + 0 
19b7 : a5 44 __ LDA T0 + 1 
19b9 : 85 1c __ STA ACCU + 1 
19bb : a5 45 __ LDA T0 + 2 
19bd : 85 1d __ STA ACCU + 2 
19bf : a5 46 __ LDA T0 + 3 
19c1 : 85 1e __ STA ACCU + 3 
19c3 : a9 00 __ LDA #$00
19c5 : 85 03 __ STA WORK + 0 
19c7 : 85 04 __ STA WORK + 1 
19c9 : a9 20 __ LDA #$20
19cb : 85 05 __ STA WORK + 2 
19cd : a9 41 __ LDA #$41
19cf : 85 06 __ STA WORK + 3 
19d1 : 20 c8 1d JSR $1dc8 ; (freg + 20)
19d4 : 20 ae 1f JSR $1fae ; (crt_fdiv + 0)
19d7 : a5 1b __ LDA ACCU + 0 
19d9 : 85 43 __ STA T0 + 0 
19db : a5 1c __ LDA ACCU + 1 
19dd : 85 44 __ STA T0 + 1 
19df : a6 1d __ LDX ACCU + 2 
19e1 : 86 45 __ STX T0 + 2 
19e3 : a5 1e __ LDA ACCU + 3 
19e5 : 85 46 __ STA T0 + 3 
19e7 : 30 13 __ BMI $19fc ; (nformf.s9 + 0)
.s71:
19e9 : c9 41 __ CMP #$41
19eb : d0 be __ BNE $19ab ; (nformf.l79 + 0)
.s72:
19ed : e0 20 __ CPX #$20
19ef : d0 ba __ BNE $19ab ; (nformf.l79 + 0)
.s73:
19f1 : a5 1c __ LDA ACCU + 1 
19f3 : 38 __ __ SEC
19f4 : d0 b5 __ BNE $19ab ; (nformf.l79 + 0)
.s74:
19f6 : a5 1b __ LDA ACCU + 0 
19f8 : f0 b3 __ BEQ $19ad ; (nformf.l70 + 0)
19fa : d0 af __ BNE $19ab ; (nformf.l79 + 0)
.s9:
19fc : ad f2 0f LDA $0ff2 ; (sstack + 0)
19ff : c9 65 __ CMP #$65
1a01 : d0 04 __ BNE $1a07 ; (nformf.s11 + 0)
.s10:
1a03 : a9 01 __ LDA #$01
1a05 : d0 02 __ BNE $1a09 ; (nformf.s12 + 0)
.s11:
1a07 : a9 00 __ LDA #$00
.s12:
1a09 : 85 55 __ STA T10 + 0 
1a0b : a6 4d __ LDX T3 + 0 
1a0d : e8 __ __ INX
1a0e : 86 51 __ STX T5 + 0 
1a10 : ad f2 0f LDA $0ff2 ; (sstack + 0)
1a13 : c9 67 __ CMP #$67
1a15 : d0 13 __ BNE $1a2a ; (nformf.s13 + 0)
.s63:
1a17 : a5 50 __ LDA T4 + 1 
1a19 : 30 08 __ BMI $1a23 ; (nformf.s64 + 0)
.s66:
1a1b : d0 06 __ BNE $1a23 ; (nformf.s64 + 0)
.s65:
1a1d : a5 4f __ LDA T4 + 0 
1a1f : c9 04 __ CMP #$04
1a21 : 90 07 __ BCC $1a2a ; (nformf.s13 + 0)
.s64:
1a23 : a9 01 __ LDA #$01
1a25 : 85 55 __ STA T10 + 0 
1a27 : 4c b3 1c JMP $1cb3 ; (nformf.s53 + 0)
.s13:
1a2a : a5 55 __ LDA T10 + 0 
1a2c : d0 f9 __ BNE $1a27 ; (nformf.s64 + 4)
.s14:
1a2e : 24 50 __ BIT T4 + 1 
1a30 : 10 43 __ BPL $1a75 ; (nformf.s15 + 0)
.s52:
1a32 : a5 43 __ LDA T0 + 0 
1a34 : 85 1b __ STA ACCU + 0 
1a36 : a5 44 __ LDA T0 + 1 
1a38 : 85 1c __ STA ACCU + 1 
1a3a : a5 45 __ LDA T0 + 2 
1a3c : 85 1d __ STA ACCU + 2 
1a3e : a5 46 __ LDA T0 + 3 
1a40 : 85 1e __ STA ACCU + 3 
.l108:
1a42 : a9 00 __ LDA #$00
1a44 : 85 03 __ STA WORK + 0 
1a46 : 85 04 __ STA WORK + 1 
1a48 : a9 20 __ LDA #$20
1a4a : 85 05 __ STA WORK + 2 
1a4c : a9 41 __ LDA #$41
1a4e : 85 06 __ STA WORK + 3 
1a50 : 20 c8 1d JSR $1dc8 ; (freg + 20)
1a53 : 20 ae 1f JSR $1fae ; (crt_fdiv + 0)
1a56 : 18 __ __ CLC
1a57 : a5 4f __ LDA T4 + 0 
1a59 : 69 01 __ ADC #$01
1a5b : 85 4f __ STA T4 + 0 
1a5d : a5 50 __ LDA T4 + 1 
1a5f : 69 00 __ ADC #$00
1a61 : 85 50 __ STA T4 + 1 
1a63 : 30 dd __ BMI $1a42 ; (nformf.l108 + 0)
.s109:
1a65 : a5 1e __ LDA ACCU + 3 
1a67 : 85 46 __ STA T0 + 3 
1a69 : a5 1d __ LDA ACCU + 2 
1a6b : 85 45 __ STA T0 + 2 
1a6d : a5 1c __ LDA ACCU + 1 
1a6f : 85 44 __ STA T0 + 1 
1a71 : a5 1b __ LDA ACCU + 0 
1a73 : 85 43 __ STA T0 + 0 
.s15:
1a75 : 18 __ __ CLC
1a76 : a5 4d __ LDA T3 + 0 
1a78 : 65 4f __ ADC T4 + 0 
1a7a : 18 __ __ CLC
1a7b : 69 01 __ ADC #$01
1a7d : 85 51 __ STA T5 + 0 
1a7f : c9 07 __ CMP #$07
1a81 : 90 14 __ BCC $1a97 ; (nformf.s51 + 0)
.s16:
1a83 : ad 9a 23 LDA $239a ; (fround5[0] + 24)
1a86 : 85 47 __ STA T1 + 0 
1a88 : ad 9b 23 LDA $239b ; (fround5[0] + 25)
1a8b : 85 48 __ STA T1 + 1 
1a8d : ad 9c 23 LDA $239c ; (fround5[0] + 26)
1a90 : 85 49 __ STA T1 + 2 
1a92 : ad 9d 23 LDA $239d ; (fround5[0] + 27)
1a95 : b0 15 __ BCS $1aac ; (nformf.s17 + 0)
.s51:
1a97 : 0a __ __ ASL
1a98 : 0a __ __ ASL
1a99 : aa __ __ TAX
1a9a : bd 7e 23 LDA $237e,x ; (crt_malloc + 204)
1a9d : 85 47 __ STA T1 + 0 
1a9f : bd 7f 23 LDA $237f,x ; (crt_malloc + 205)
1aa2 : 85 48 __ STA T1 + 1 
1aa4 : bd 80 23 LDA $2380,x ; (spentry + 0)
1aa7 : 85 49 __ STA T1 + 2 
1aa9 : bd 81 23 LDA $2381,x ; (giocharmap + 0)
.s17:
1aac : 85 4a __ STA T1 + 3 
1aae : a5 43 __ LDA T0 + 0 
1ab0 : 85 1b __ STA ACCU + 0 
1ab2 : a5 44 __ LDA T0 + 1 
1ab4 : 85 1c __ STA ACCU + 1 
1ab6 : a5 45 __ LDA T0 + 2 
1ab8 : 85 1d __ STA ACCU + 2 
1aba : a5 46 __ LDA T0 + 3 
1abc : 85 1e __ STA ACCU + 3 
1abe : a2 47 __ LDX #$47
1ac0 : 20 b8 1d JSR $1db8 ; (freg + 4)
1ac3 : 20 ff 1d JSR $1dff ; (faddsub + 6)
1ac6 : a5 1c __ LDA ACCU + 1 
1ac8 : 85 16 __ STA P9 ; (f + 1)
1aca : a5 1d __ LDA ACCU + 2 
1acc : 85 17 __ STA P10 ; (f + 2)
1ace : a6 1b __ LDX ACCU + 0 
1ad0 : a5 1e __ LDA ACCU + 3 
1ad2 : 85 18 __ STA P11 ; (f + 3)
1ad4 : 30 3a __ BMI $1b10 ; (nformf.s18 + 0)
.s46:
1ad6 : c9 41 __ CMP #$41
1ad8 : d0 0d __ BNE $1ae7 ; (nformf.s50 + 0)
.s47:
1ada : a5 17 __ LDA P10 ; (f + 2)
1adc : c9 20 __ CMP #$20
1ade : d0 07 __ BNE $1ae7 ; (nformf.s50 + 0)
.s48:
1ae0 : a5 16 __ LDA P9 ; (f + 1)
1ae2 : d0 03 __ BNE $1ae7 ; (nformf.s50 + 0)
.s49:
1ae4 : 8a __ __ TXA
1ae5 : f0 02 __ BEQ $1ae9 ; (nformf.s45 + 0)
.s50:
1ae7 : 90 27 __ BCC $1b10 ; (nformf.s18 + 0)
.s45:
1ae9 : a9 00 __ LDA #$00
1aeb : 85 03 __ STA WORK + 0 
1aed : 85 04 __ STA WORK + 1 
1aef : a9 20 __ LDA #$20
1af1 : 85 05 __ STA WORK + 2 
1af3 : a9 41 __ LDA #$41
1af5 : 85 06 __ STA WORK + 3 
1af7 : 20 c8 1d JSR $1dc8 ; (freg + 20)
1afa : 20 ae 1f JSR $1fae ; (crt_fdiv + 0)
1afd : a5 1c __ LDA ACCU + 1 
1aff : 85 16 __ STA P9 ; (f + 1)
1b01 : a5 1d __ LDA ACCU + 2 
1b03 : 85 17 __ STA P10 ; (f + 2)
1b05 : a5 1e __ LDA ACCU + 3 
1b07 : 85 18 __ STA P11 ; (f + 3)
1b09 : a6 4d __ LDX T3 + 0 
1b0b : ca __ __ DEX
1b0c : 86 52 __ STX T6 + 0 
1b0e : a6 1b __ LDX ACCU + 0 
.s18:
1b10 : 38 __ __ SEC
1b11 : a5 51 __ LDA T5 + 0 
1b13 : e5 52 __ SBC T6 + 0 
1b15 : 85 4d __ STA T3 + 0 
1b17 : a9 00 __ LDA #$00
1b19 : e9 00 __ SBC #$00
1b1b : 85 4e __ STA T3 + 1 
1b1d : a9 14 __ LDA #$14
1b1f : c5 51 __ CMP T5 + 0 
1b21 : b0 02 __ BCS $1b25 ; (nformf.s19 + 0)
.s44:
1b23 : 85 51 __ STA T5 + 0 
.s19:
1b25 : a5 4d __ LDA T3 + 0 
1b27 : d0 08 __ BNE $1b31 ; (nformf.s21 + 0)
.s20:
1b29 : a9 30 __ LDA #$30
1b2b : a4 54 __ LDY T9 + 0 
1b2d : 91 13 __ STA (P6),y ; (str + 0)
1b2f : e6 54 __ INC T9 + 0 
.s21:
1b31 : a9 00 __ LDA #$00
1b33 : 85 56 __ STA T11 + 0 
1b35 : c5 4d __ CMP T3 + 0 
1b37 : f0 6f __ BEQ $1ba8 ; (nformf.l43 + 0)
.s23:
1b39 : c9 07 __ CMP #$07
1b3b : 90 04 __ BCC $1b41 ; (nformf.s24 + 0)
.l42:
1b3d : a9 30 __ LDA #$30
1b3f : b0 55 __ BCS $1b96 ; (nformf.l25 + 0)
.s24:
1b41 : 86 1b __ STX ACCU + 0 
1b43 : 86 43 __ STX T0 + 0 
1b45 : a5 16 __ LDA P9 ; (f + 1)
1b47 : 85 1c __ STA ACCU + 1 
1b49 : 85 44 __ STA T0 + 1 
1b4b : a5 17 __ LDA P10 ; (f + 2)
1b4d : 85 1d __ STA ACCU + 2 
1b4f : 85 45 __ STA T0 + 2 
1b51 : a5 18 __ LDA P11 ; (f + 3)
1b53 : 85 1e __ STA ACCU + 3 
1b55 : 85 46 __ STA T0 + 3 
1b57 : 20 48 21 JSR $2148 ; (f32_to_i16 + 0)
1b5a : a5 1b __ LDA ACCU + 0 
1b5c : 85 53 __ STA T7 + 0 
1b5e : 20 94 21 JSR $2194 ; (sint16_to_float + 0)
1b61 : a2 43 __ LDX #$43
1b63 : 20 b8 1d JSR $1db8 ; (freg + 4)
1b66 : a5 1e __ LDA ACCU + 3 
1b68 : 49 80 __ EOR #$80
1b6a : 85 1e __ STA ACCU + 3 
1b6c : 20 ff 1d JSR $1dff ; (faddsub + 6)
1b6f : a9 00 __ LDA #$00
1b71 : 85 03 __ STA WORK + 0 
1b73 : 85 04 __ STA WORK + 1 
1b75 : a9 20 __ LDA #$20
1b77 : 85 05 __ STA WORK + 2 
1b79 : a9 41 __ LDA #$41
1b7b : 85 06 __ STA WORK + 3 
1b7d : 20 c8 1d JSR $1dc8 ; (freg + 20)
1b80 : 20 e6 1e JSR $1ee6 ; (crt_fmul + 0)
1b83 : a5 1c __ LDA ACCU + 1 
1b85 : 85 16 __ STA P9 ; (f + 1)
1b87 : a5 1d __ LDA ACCU + 2 
1b89 : 85 17 __ STA P10 ; (f + 2)
1b8b : a5 1e __ LDA ACCU + 3 
1b8d : 85 18 __ STA P11 ; (f + 3)
1b8f : 18 __ __ CLC
1b90 : a5 53 __ LDA T7 + 0 
1b92 : 69 30 __ ADC #$30
1b94 : a6 1b __ LDX ACCU + 0 
.l25:
1b96 : a4 54 __ LDY T9 + 0 
1b98 : 91 13 __ STA (P6),y ; (str + 0)
1b9a : e6 54 __ INC T9 + 0 
1b9c : e6 56 __ INC T11 + 0 
1b9e : a5 56 __ LDA T11 + 0 
1ba0 : c5 51 __ CMP T5 + 0 
1ba2 : b0 14 __ BCS $1bb8 ; (nformf.s26 + 0)
.s22:
1ba4 : c5 4d __ CMP T3 + 0 
1ba6 : d0 91 __ BNE $1b39 ; (nformf.s23 + 0)
.l43:
1ba8 : a9 2e __ LDA #$2e
1baa : a4 54 __ LDY T9 + 0 
1bac : 91 13 __ STA (P6),y ; (str + 0)
1bae : e6 54 __ INC T9 + 0 
1bb0 : a5 56 __ LDA T11 + 0 
1bb2 : c9 07 __ CMP #$07
1bb4 : 90 8b __ BCC $1b41 ; (nformf.s24 + 0)
1bb6 : b0 85 __ BCS $1b3d ; (nformf.l42 + 0)
.s26:
1bb8 : a5 55 __ LDA T10 + 0 
1bba : f0 66 __ BEQ $1c22 ; (nformf.s27 + 0)
.s38:
1bbc : a0 03 __ LDY #$03
1bbe : b1 4b __ LDA (T2 + 0),y 
1bc0 : 69 03 __ ADC #$03
1bc2 : a4 54 __ LDY T9 + 0 
1bc4 : 91 13 __ STA (P6),y ; (str + 0)
1bc6 : c8 __ __ INY
1bc7 : 84 54 __ STY T9 + 0 
1bc9 : 24 50 __ BIT T4 + 1 
1bcb : 30 06 __ BMI $1bd3 ; (nformf.s41 + 0)
.s39:
1bcd : a9 2b __ LDA #$2b
1bcf : 91 13 __ STA (P6),y ; (str + 0)
1bd1 : d0 11 __ BNE $1be4 ; (nformf.s40 + 0)
.s41:
1bd3 : a9 2d __ LDA #$2d
1bd5 : 91 13 __ STA (P6),y ; (str + 0)
1bd7 : 38 __ __ SEC
1bd8 : a9 00 __ LDA #$00
1bda : e5 4f __ SBC T4 + 0 
1bdc : 85 4f __ STA T4 + 0 
1bde : a9 00 __ LDA #$00
1be0 : e5 50 __ SBC T4 + 1 
1be2 : 85 50 __ STA T4 + 1 
.s40:
1be4 : e6 54 __ INC T9 + 0 
1be6 : a5 4f __ LDA T4 + 0 
1be8 : 85 1b __ STA ACCU + 0 
1bea : a5 50 __ LDA T4 + 1 
1bec : 85 1c __ STA ACCU + 1 
1bee : a9 0a __ LDA #$0a
1bf0 : 85 03 __ STA WORK + 0 
1bf2 : a9 00 __ LDA #$00
1bf4 : 85 04 __ STA WORK + 1 
1bf6 : 20 5c 20 JSR $205c ; (divs16 + 0)
1bf9 : 18 __ __ CLC
1bfa : a5 1b __ LDA ACCU + 0 
1bfc : 69 30 __ ADC #$30
1bfe : a4 54 __ LDY T9 + 0 
1c00 : 91 13 __ STA (P6),y ; (str + 0)
1c02 : e6 54 __ INC T9 + 0 
1c04 : a5 4f __ LDA T4 + 0 
1c06 : 85 1b __ STA ACCU + 0 
1c08 : a5 50 __ LDA T4 + 1 
1c0a : 85 1c __ STA ACCU + 1 
1c0c : a9 0a __ LDA #$0a
1c0e : 85 03 __ STA WORK + 0 
1c10 : a9 00 __ LDA #$00
1c12 : 85 04 __ STA WORK + 1 
1c14 : 20 1b 21 JSR $211b ; (mods16 + 0)
1c17 : 18 __ __ CLC
1c18 : a5 05 __ LDA WORK + 2 
1c1a : 69 30 __ ADC #$30
1c1c : a4 54 __ LDY T9 + 0 
1c1e : 91 13 __ STA (P6),y ; (str + 0)
1c20 : e6 54 __ INC T9 + 0 
.s27:
1c22 : a5 54 __ LDA T9 + 0 
1c24 : a0 01 __ LDY #$01
1c26 : d1 11 __ CMP (P4),y ; (si + 0)
1c28 : b0 6d __ BCS $1c97 ; (nformf.s3 + 0)
.s28:
1c2a : a0 06 __ LDY #$06
1c2c : b1 11 __ LDA (P4),y ; (si + 0)
1c2e : f0 04 __ BEQ $1c34 ; (nformf.s29 + 0)
.s110:
1c30 : a6 54 __ LDX T9 + 0 
1c32 : 90 70 __ BCC $1ca4 ; (nformf.l36 + 0)
.s29:
1c34 : a5 54 __ LDA T9 + 0 
1c36 : f0 40 __ BEQ $1c78 ; (nformf.s30 + 0)
.s35:
1c38 : e9 00 __ SBC #$00
1c3a : a8 __ __ TAY
1c3b : a9 00 __ LDA #$00
1c3d : e9 00 __ SBC #$00
1c3f : aa __ __ TAX
1c40 : 98 __ __ TYA
1c41 : 18 __ __ CLC
1c42 : 65 13 __ ADC P6 ; (str + 0)
1c44 : 85 47 __ STA T1 + 0 
1c46 : 8a __ __ TXA
1c47 : 65 14 __ ADC P7 ; (str + 1)
1c49 : 85 48 __ STA T1 + 1 
1c4b : a9 01 __ LDA #$01
1c4d : 85 4d __ STA T3 + 0 
1c4f : a6 54 __ LDX T9 + 0 
1c51 : 38 __ __ SEC
.l111:
1c52 : a0 01 __ LDY #$01
1c54 : b1 11 __ LDA (P4),y ; (si + 0)
1c56 : e5 4d __ SBC T3 + 0 
1c58 : 85 4b __ STA T2 + 0 
1c5a : a9 00 __ LDA #$00
1c5c : e5 4e __ SBC T3 + 1 
1c5e : 18 __ __ CLC
1c5f : 65 14 __ ADC P7 ; (str + 1)
1c61 : 85 4c __ STA T2 + 1 
1c63 : 88 __ __ DEY
1c64 : b1 47 __ LDA (T1 + 0),y 
1c66 : a4 13 __ LDY P6 ; (str + 0)
1c68 : 91 4b __ STA (T2 + 0),y 
1c6a : a5 47 __ LDA T1 + 0 
1c6c : d0 02 __ BNE $1c70 ; (nformf.s114 + 0)
.s113:
1c6e : c6 48 __ DEC T1 + 1 
.s114:
1c70 : c6 47 __ DEC T1 + 0 
1c72 : e6 4d __ INC T3 + 0 
1c74 : e4 4d __ CPX T3 + 0 
1c76 : b0 da __ BCS $1c52 ; (nformf.l111 + 0)
.s30:
1c78 : a9 00 __ LDA #$00
1c7a : 85 4d __ STA T3 + 0 
1c7c : 90 08 __ BCC $1c86 ; (nformf.l31 + 0)
.s33:
1c7e : a9 20 __ LDA #$20
1c80 : a4 4d __ LDY T3 + 0 
1c82 : 91 13 __ STA (P6),y ; (str + 0)
1c84 : e6 4d __ INC T3 + 0 
.l31:
1c86 : a0 01 __ LDY #$01
1c88 : b1 11 __ LDA (P4),y ; (si + 0)
1c8a : 38 __ __ SEC
1c8b : e5 54 __ SBC T9 + 0 
1c8d : 90 ef __ BCC $1c7e ; (nformf.s33 + 0)
.s34:
1c8f : c5 4d __ CMP T3 + 0 
1c91 : 90 02 __ BCC $1c95 ; (nformf.s32 + 0)
.s112:
1c93 : d0 e9 __ BNE $1c7e ; (nformf.s33 + 0)
.s32:
1c95 : b1 11 __ LDA (P4),y ; (si + 0)
.s3:
1c97 : 85 1b __ STA ACCU + 0 
1c99 : a2 03 __ LDX #$03
1c9b : bd e9 0f LDA $0fe9,x ; (nformf@stack + 0)
1c9e : 95 53 __ STA T7 + 0,x 
1ca0 : ca __ __ DEX
1ca1 : 10 f8 __ BPL $1c9b ; (nformf.s3 + 4)
1ca3 : 60 __ __ RTS
.l36:
1ca4 : 8a __ __ TXA
1ca5 : a0 01 __ LDY #$01
1ca7 : d1 11 __ CMP (P4),y ; (si + 0)
1ca9 : b0 ea __ BCS $1c95 ; (nformf.s32 + 0)
.s37:
1cab : a8 __ __ TAY
1cac : a9 20 __ LDA #$20
1cae : 91 13 __ STA (P6),y ; (str + 0)
1cb0 : e8 __ __ INX
1cb1 : 90 f1 __ BCC $1ca4 ; (nformf.l36 + 0)
.s53:
1cb3 : a5 51 __ LDA T5 + 0 
1cb5 : c9 07 __ CMP #$07
1cb7 : 90 14 __ BCC $1ccd ; (nformf.s62 + 0)
.s54:
1cb9 : ad 9a 23 LDA $239a ; (fround5[0] + 24)
1cbc : 85 47 __ STA T1 + 0 
1cbe : ad 9b 23 LDA $239b ; (fround5[0] + 25)
1cc1 : 85 48 __ STA T1 + 1 
1cc3 : ad 9c 23 LDA $239c ; (fround5[0] + 26)
1cc6 : 85 49 __ STA T1 + 2 
1cc8 : ad 9d 23 LDA $239d ; (fround5[0] + 27)
1ccb : b0 15 __ BCS $1ce2 ; (nformf.s55 + 0)
.s62:
1ccd : 0a __ __ ASL
1cce : 0a __ __ ASL
1ccf : aa __ __ TAX
1cd0 : bd 7e 23 LDA $237e,x ; (crt_malloc + 204)
1cd3 : 85 47 __ STA T1 + 0 
1cd5 : bd 7f 23 LDA $237f,x ; (crt_malloc + 205)
1cd8 : 85 48 __ STA T1 + 1 
1cda : bd 80 23 LDA $2380,x ; (spentry + 0)
1cdd : 85 49 __ STA T1 + 2 
1cdf : bd 81 23 LDA $2381,x ; (giocharmap + 0)
.s55:
1ce2 : 85 4a __ STA T1 + 3 
1ce4 : a5 43 __ LDA T0 + 0 
1ce6 : 85 1b __ STA ACCU + 0 
1ce8 : a5 44 __ LDA T0 + 1 
1cea : 85 1c __ STA ACCU + 1 
1cec : a5 45 __ LDA T0 + 2 
1cee : 85 1d __ STA ACCU + 2 
1cf0 : a5 46 __ LDA T0 + 3 
1cf2 : 85 1e __ STA ACCU + 3 
1cf4 : a2 47 __ LDX #$47
1cf6 : 20 b8 1d JSR $1db8 ; (freg + 4)
1cf9 : 20 ff 1d JSR $1dff ; (faddsub + 6)
1cfc : a5 1c __ LDA ACCU + 1 
1cfe : 85 16 __ STA P9 ; (f + 1)
1d00 : a5 1d __ LDA ACCU + 2 
1d02 : 85 17 __ STA P10 ; (f + 2)
1d04 : a6 1b __ LDX ACCU + 0 
1d06 : a5 1e __ LDA ACCU + 3 
1d08 : 85 18 __ STA P11 ; (f + 3)
1d0a : 10 03 __ BPL $1d0f ; (nformf.s57 + 0)
1d0c : 4c 10 1b JMP $1b10 ; (nformf.s18 + 0)
.s57:
1d0f : c9 41 __ CMP #$41
1d11 : d0 0d __ BNE $1d20 ; (nformf.s61 + 0)
.s58:
1d13 : a5 17 __ LDA P10 ; (f + 2)
1d15 : c9 20 __ CMP #$20
1d17 : d0 07 __ BNE $1d20 ; (nformf.s61 + 0)
.s59:
1d19 : a5 16 __ LDA P9 ; (f + 1)
1d1b : d0 03 __ BNE $1d20 ; (nformf.s61 + 0)
.s60:
1d1d : 8a __ __ TXA
1d1e : f0 02 __ BEQ $1d22 ; (nformf.s56 + 0)
.s61:
1d20 : 90 ea __ BCC $1d0c ; (nformf.s55 + 42)
.s56:
1d22 : a9 00 __ LDA #$00
1d24 : 85 03 __ STA WORK + 0 
1d26 : 85 04 __ STA WORK + 1 
1d28 : a9 20 __ LDA #$20
1d2a : 85 05 __ STA WORK + 2 
1d2c : a9 41 __ LDA #$41
1d2e : 85 06 __ STA WORK + 3 
1d30 : 20 c8 1d JSR $1dc8 ; (freg + 20)
1d33 : 20 ae 1f JSR $1fae ; (crt_fdiv + 0)
1d36 : a5 1c __ LDA ACCU + 1 
1d38 : 85 16 __ STA P9 ; (f + 1)
1d3a : a5 1d __ LDA ACCU + 2 
1d3c : 85 17 __ STA P10 ; (f + 2)
1d3e : a5 1e __ LDA ACCU + 3 
1d40 : 85 18 __ STA P11 ; (f + 3)
1d42 : a6 1b __ LDX ACCU + 0 
1d44 : e6 4f __ INC T4 + 0 
1d46 : d0 c4 __ BNE $1d0c ; (nformf.s55 + 42)
.s117:
1d48 : e6 50 __ INC T4 + 1 
1d4a : 4c 10 1b JMP $1b10 ; (nformf.s18 + 0)
.s102:
1d4d : 86 43 __ STX T0 + 0 
1d4f : 85 47 __ STA T1 + 0 
1d51 : a0 03 __ LDY #$03
1d53 : b1 11 __ LDA (P4),y ; (si + 0)
1d55 : 18 __ __ CLC
1d56 : 69 08 __ ADC #$08
1d58 : a4 43 __ LDY T0 + 0 
1d5a : 91 13 __ STA (P6),y ; (str + 0)
1d5c : 18 __ __ CLC
1d5d : a0 03 __ LDY #$03
1d5f : b1 11 __ LDA (P4),y ; (si + 0)
1d61 : 69 0d __ ADC #$0d
1d63 : a4 43 __ LDY T0 + 0 
1d65 : c8 __ __ INY
1d66 : 91 13 __ STA (P6),y ; (str + 0)
1d68 : a0 03 __ LDY #$03
1d6a : b1 11 __ LDA (P4),y ; (si + 0)
1d6c : 18 __ __ CLC
1d6d : 69 05 __ ADC #$05
1d6f : a4 47 __ LDY T1 + 0 
1d71 : 91 13 __ STA (P6),y ; (str + 0)
1d73 : 18 __ __ CLC
1d74 : a5 54 __ LDA T9 + 0 
1d76 : 69 03 __ ADC #$03
1d78 : 85 54 __ STA T9 + 0 
1d7a : 4c 22 1c JMP $1c22 ; (nformf.s27 + 0)
.s104:
1d7d : 20 8e 1d JSR $1d8e ; (isinf.s4 + 0)
1d80 : a2 01 __ LDX #$01
1d82 : 86 54 __ STX T9 + 0 
1d84 : a8 __ __ TAY
1d85 : d0 03 __ BNE $1d8a ; (nformf.s105 + 0)
1d87 : 4c 97 18 JMP $1897 ; (nformf.s7 + 0)
.s105:
1d8a : a9 03 __ LDA #$03
1d8c : d0 bf __ BNE $1d4d ; (nformf.s102 + 0)
--------------------------------------------------------------------
isinf: ; isinf(float)->bool
;  26, "/home/honza/projects/c64/projects/oscar64/include/math.h"
.s4:
1d8e : 06 0f __ ASL P2 ; (f + 2)
1d90 : a5 10 __ LDA P3 ; (f + 3)
1d92 : 2a __ __ ROL
1d93 : c9 ff __ CMP #$ff
1d95 : d0 03 __ BNE $1d9a ; (isinf.s6 + 0)
.s5:
1d97 : a9 01 __ LDA #$01
1d99 : 60 __ __ RTS
.s6:
1d9a : a9 00 __ LDA #$00
.s3:
1d9c : 60 __ __ RTS
--------------------------------------------------------------------
1d9d : __ __ __ BYT 41 4c 4c 4f 43 41 54 45 44 20 25 35 75 20 41 54 : ALLOCATED %5u AT
1dad : __ __ __ BYT 20 25 30 34 78 0a 00                            :  %04x..
--------------------------------------------------------------------
freg: ; freg
1db4 : b1 19 __ LDA (IP + 0),y 
1db6 : c8 __ __ INY
1db7 : aa __ __ TAX
1db8 : b5 00 __ LDA $00,x 
1dba : 85 03 __ STA WORK + 0 
1dbc : b5 01 __ LDA $01,x 
1dbe : 85 04 __ STA WORK + 1 
1dc0 : b5 02 __ LDA $02,x 
1dc2 : 85 05 __ STA WORK + 2 
1dc4 : b5 03 __ LDA WORK + 0,x 
1dc6 : 85 06 __ STA WORK + 3 
1dc8 : a5 05 __ LDA WORK + 2 
1dca : 0a __ __ ASL
1dcb : a5 06 __ LDA WORK + 3 
1dcd : 2a __ __ ROL
1dce : 85 08 __ STA WORK + 5 
1dd0 : f0 06 __ BEQ $1dd8 ; (freg + 36)
1dd2 : a5 05 __ LDA WORK + 2 
1dd4 : 09 80 __ ORA #$80
1dd6 : 85 05 __ STA WORK + 2 
1dd8 : a5 1d __ LDA ACCU + 2 
1dda : 0a __ __ ASL
1ddb : a5 1e __ LDA ACCU + 3 
1ddd : 2a __ __ ROL
1dde : 85 07 __ STA WORK + 4 
1de0 : f0 06 __ BEQ $1de8 ; (freg + 52)
1de2 : a5 1d __ LDA ACCU + 2 
1de4 : 09 80 __ ORA #$80
1de6 : 85 1d __ STA ACCU + 2 
1de8 : 60 __ __ RTS
1de9 : 06 1e __ ASL ACCU + 3 
1deb : a5 07 __ LDA WORK + 4 
1ded : 6a __ __ ROR
1dee : 85 1e __ STA ACCU + 3 
1df0 : b0 06 __ BCS $1df8 ; (freg + 68)
1df2 : a5 1d __ LDA ACCU + 2 
1df4 : 29 7f __ AND #$7f
1df6 : 85 1d __ STA ACCU + 2 
1df8 : 60 __ __ RTS
--------------------------------------------------------------------
faddsub: ; faddsub
1df9 : a5 06 __ LDA WORK + 3 
1dfb : 49 80 __ EOR #$80
1dfd : 85 06 __ STA WORK + 3 
1dff : a9 ff __ LDA #$ff
1e01 : c5 07 __ CMP WORK + 4 
1e03 : f0 04 __ BEQ $1e09 ; (faddsub + 16)
1e05 : c5 08 __ CMP WORK + 5 
1e07 : d0 11 __ BNE $1e1a ; (faddsub + 33)
1e09 : a5 1e __ LDA ACCU + 3 
1e0b : 09 7f __ ORA #$7f
1e0d : 85 1e __ STA ACCU + 3 
1e0f : a9 80 __ LDA #$80
1e11 : 85 1d __ STA ACCU + 2 
1e13 : a9 00 __ LDA #$00
1e15 : 85 1b __ STA ACCU + 0 
1e17 : 85 1c __ STA ACCU + 1 
1e19 : 60 __ __ RTS
1e1a : 38 __ __ SEC
1e1b : a5 07 __ LDA WORK + 4 
1e1d : e5 08 __ SBC WORK + 5 
1e1f : f0 38 __ BEQ $1e59 ; (faddsub + 96)
1e21 : aa __ __ TAX
1e22 : b0 25 __ BCS $1e49 ; (faddsub + 80)
1e24 : e0 e9 __ CPX #$e9
1e26 : b0 0e __ BCS $1e36 ; (faddsub + 61)
1e28 : a5 08 __ LDA WORK + 5 
1e2a : 85 07 __ STA WORK + 4 
1e2c : a9 00 __ LDA #$00
1e2e : 85 1b __ STA ACCU + 0 
1e30 : 85 1c __ STA ACCU + 1 
1e32 : 85 1d __ STA ACCU + 2 
1e34 : f0 23 __ BEQ $1e59 ; (faddsub + 96)
1e36 : a5 1d __ LDA ACCU + 2 
1e38 : 4a __ __ LSR
1e39 : 66 1c __ ROR ACCU + 1 
1e3b : 66 1b __ ROR ACCU + 0 
1e3d : e8 __ __ INX
1e3e : d0 f8 __ BNE $1e38 ; (faddsub + 63)
1e40 : 85 1d __ STA ACCU + 2 
1e42 : a5 08 __ LDA WORK + 5 
1e44 : 85 07 __ STA WORK + 4 
1e46 : 4c 59 1e JMP $1e59 ; (faddsub + 96)
1e49 : e0 18 __ CPX #$18
1e4b : b0 33 __ BCS $1e80 ; (faddsub + 135)
1e4d : a5 05 __ LDA WORK + 2 
1e4f : 4a __ __ LSR
1e50 : 66 04 __ ROR WORK + 1 
1e52 : 66 03 __ ROR WORK + 0 
1e54 : ca __ __ DEX
1e55 : d0 f8 __ BNE $1e4f ; (faddsub + 86)
1e57 : 85 05 __ STA WORK + 2 
1e59 : a5 1e __ LDA ACCU + 3 
1e5b : 29 80 __ AND #$80
1e5d : 85 1e __ STA ACCU + 3 
1e5f : 45 06 __ EOR WORK + 3 
1e61 : 30 31 __ BMI $1e94 ; (faddsub + 155)
1e63 : 18 __ __ CLC
1e64 : a5 1b __ LDA ACCU + 0 
1e66 : 65 03 __ ADC WORK + 0 
1e68 : 85 1b __ STA ACCU + 0 
1e6a : a5 1c __ LDA ACCU + 1 
1e6c : 65 04 __ ADC WORK + 1 
1e6e : 85 1c __ STA ACCU + 1 
1e70 : a5 1d __ LDA ACCU + 2 
1e72 : 65 05 __ ADC WORK + 2 
1e74 : 85 1d __ STA ACCU + 2 
1e76 : 90 08 __ BCC $1e80 ; (faddsub + 135)
1e78 : 66 1d __ ROR ACCU + 2 
1e7a : 66 1c __ ROR ACCU + 1 
1e7c : 66 1b __ ROR ACCU + 0 
1e7e : e6 07 __ INC WORK + 4 
1e80 : a5 07 __ LDA WORK + 4 
1e82 : c9 ff __ CMP #$ff
1e84 : f0 83 __ BEQ $1e09 ; (faddsub + 16)
1e86 : 4a __ __ LSR
1e87 : 05 1e __ ORA ACCU + 3 
1e89 : 85 1e __ STA ACCU + 3 
1e8b : b0 06 __ BCS $1e93 ; (faddsub + 154)
1e8d : a5 1d __ LDA ACCU + 2 
1e8f : 29 7f __ AND #$7f
1e91 : 85 1d __ STA ACCU + 2 
1e93 : 60 __ __ RTS
1e94 : 38 __ __ SEC
1e95 : a5 1b __ LDA ACCU + 0 
1e97 : e5 03 __ SBC WORK + 0 
1e99 : 85 1b __ STA ACCU + 0 
1e9b : a5 1c __ LDA ACCU + 1 
1e9d : e5 04 __ SBC WORK + 1 
1e9f : 85 1c __ STA ACCU + 1 
1ea1 : a5 1d __ LDA ACCU + 2 
1ea3 : e5 05 __ SBC WORK + 2 
1ea5 : 85 1d __ STA ACCU + 2 
1ea7 : b0 19 __ BCS $1ec2 ; (faddsub + 201)
1ea9 : 38 __ __ SEC
1eaa : a9 00 __ LDA #$00
1eac : e5 1b __ SBC ACCU + 0 
1eae : 85 1b __ STA ACCU + 0 
1eb0 : a9 00 __ LDA #$00
1eb2 : e5 1c __ SBC ACCU + 1 
1eb4 : 85 1c __ STA ACCU + 1 
1eb6 : a9 00 __ LDA #$00
1eb8 : e5 1d __ SBC ACCU + 2 
1eba : 85 1d __ STA ACCU + 2 
1ebc : a5 1e __ LDA ACCU + 3 
1ebe : 49 80 __ EOR #$80
1ec0 : 85 1e __ STA ACCU + 3 
1ec2 : a5 1d __ LDA ACCU + 2 
1ec4 : 30 ba __ BMI $1e80 ; (faddsub + 135)
1ec6 : 05 1c __ ORA ACCU + 1 
1ec8 : 05 1b __ ORA ACCU + 0 
1eca : f0 0f __ BEQ $1edb ; (faddsub + 226)
1ecc : c6 07 __ DEC WORK + 4 
1ece : f0 0b __ BEQ $1edb ; (faddsub + 226)
1ed0 : 06 1b __ ASL ACCU + 0 
1ed2 : 26 1c __ ROL ACCU + 1 
1ed4 : 26 1d __ ROL ACCU + 2 
1ed6 : 10 f4 __ BPL $1ecc ; (faddsub + 211)
1ed8 : 4c 80 1e JMP $1e80 ; (faddsub + 135)
1edb : a9 00 __ LDA #$00
1edd : 85 1b __ STA ACCU + 0 
1edf : 85 1c __ STA ACCU + 1 
1ee1 : 85 1d __ STA ACCU + 2 
1ee3 : 85 1e __ STA ACCU + 3 
1ee5 : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul: ; crt_fmul
1ee6 : a5 1b __ LDA ACCU + 0 
1ee8 : 05 1c __ ORA ACCU + 1 
1eea : 05 1d __ ORA ACCU + 2 
1eec : f0 0e __ BEQ $1efc ; (crt_fmul + 22)
1eee : a5 03 __ LDA WORK + 0 
1ef0 : 05 04 __ ORA WORK + 1 
1ef2 : 05 05 __ ORA WORK + 2 
1ef4 : d0 09 __ BNE $1eff ; (crt_fmul + 25)
1ef6 : 85 1b __ STA ACCU + 0 
1ef8 : 85 1c __ STA ACCU + 1 
1efa : 85 1d __ STA ACCU + 2 
1efc : 85 1e __ STA ACCU + 3 
1efe : 60 __ __ RTS
1eff : a5 1e __ LDA ACCU + 3 
1f01 : 45 06 __ EOR WORK + 3 
1f03 : 29 80 __ AND #$80
1f05 : 85 1e __ STA ACCU + 3 
1f07 : a9 ff __ LDA #$ff
1f09 : c5 07 __ CMP WORK + 4 
1f0b : f0 42 __ BEQ $1f4f ; (crt_fmul + 105)
1f0d : c5 08 __ CMP WORK + 5 
1f0f : f0 3e __ BEQ $1f4f ; (crt_fmul + 105)
1f11 : a9 00 __ LDA #$00
1f13 : 85 09 __ STA WORK + 6 
1f15 : 85 0a __ STA WORK + 7 
1f17 : 85 0b __ STA WORK + 8 
1f19 : a4 1b __ LDY ACCU + 0 
1f1b : a5 03 __ LDA WORK + 0 
1f1d : d0 06 __ BNE $1f25 ; (crt_fmul + 63)
1f1f : a5 04 __ LDA WORK + 1 
1f21 : f0 0a __ BEQ $1f2d ; (crt_fmul + 71)
1f23 : d0 05 __ BNE $1f2a ; (crt_fmul + 68)
1f25 : 20 80 1f JSR $1f80 ; (crt_fmul8 + 0)
1f28 : a5 04 __ LDA WORK + 1 
1f2a : 20 80 1f JSR $1f80 ; (crt_fmul8 + 0)
1f2d : a5 05 __ LDA WORK + 2 
1f2f : 20 80 1f JSR $1f80 ; (crt_fmul8 + 0)
1f32 : 38 __ __ SEC
1f33 : a5 0b __ LDA WORK + 8 
1f35 : 30 06 __ BMI $1f3d ; (crt_fmul + 87)
1f37 : 06 09 __ ASL WORK + 6 
1f39 : 26 0a __ ROL WORK + 7 
1f3b : 2a __ __ ROL
1f3c : 18 __ __ CLC
1f3d : 29 7f __ AND #$7f
1f3f : 85 0b __ STA WORK + 8 
1f41 : a5 07 __ LDA WORK + 4 
1f43 : 65 08 __ ADC WORK + 5 
1f45 : 90 19 __ BCC $1f60 ; (crt_fmul + 122)
1f47 : e9 7f __ SBC #$7f
1f49 : b0 04 __ BCS $1f4f ; (crt_fmul + 105)
1f4b : c9 ff __ CMP #$ff
1f4d : d0 15 __ BNE $1f64 ; (crt_fmul + 126)
1f4f : a5 1e __ LDA ACCU + 3 
1f51 : 09 7f __ ORA #$7f
1f53 : 85 1e __ STA ACCU + 3 
1f55 : a9 80 __ LDA #$80
1f57 : 85 1d __ STA ACCU + 2 
1f59 : a9 00 __ LDA #$00
1f5b : 85 1b __ STA ACCU + 0 
1f5d : 85 1c __ STA ACCU + 1 
1f5f : 60 __ __ RTS
1f60 : e9 7e __ SBC #$7e
1f62 : 90 15 __ BCC $1f79 ; (crt_fmul + 147)
1f64 : 4a __ __ LSR
1f65 : 05 1e __ ORA ACCU + 3 
1f67 : 85 1e __ STA ACCU + 3 
1f69 : a9 00 __ LDA #$00
1f6b : 6a __ __ ROR
1f6c : 05 0b __ ORA WORK + 8 
1f6e : 85 1d __ STA ACCU + 2 
1f70 : a5 0a __ LDA WORK + 7 
1f72 : 85 1c __ STA ACCU + 1 
1f74 : a5 09 __ LDA WORK + 6 
1f76 : 85 1b __ STA ACCU + 0 
1f78 : 60 __ __ RTS
1f79 : a9 00 __ LDA #$00
1f7b : 85 1e __ STA ACCU + 3 
1f7d : f0 d8 __ BEQ $1f57 ; (crt_fmul + 113)
1f7f : 60 __ __ RTS
--------------------------------------------------------------------
crt_fmul8: ; crt_fmul8
1f80 : 38 __ __ SEC
1f81 : 6a __ __ ROR
1f82 : 90 1e __ BCC $1fa2 ; (crt_fmul8 + 34)
1f84 : aa __ __ TAX
1f85 : 18 __ __ CLC
1f86 : 98 __ __ TYA
1f87 : 65 09 __ ADC WORK + 6 
1f89 : 85 09 __ STA WORK + 6 
1f8b : a5 0a __ LDA WORK + 7 
1f8d : 65 1c __ ADC ACCU + 1 
1f8f : 85 0a __ STA WORK + 7 
1f91 : a5 0b __ LDA WORK + 8 
1f93 : 65 1d __ ADC ACCU + 2 
1f95 : 6a __ __ ROR
1f96 : 85 0b __ STA WORK + 8 
1f98 : 8a __ __ TXA
1f99 : 66 0a __ ROR WORK + 7 
1f9b : 66 09 __ ROR WORK + 6 
1f9d : 4a __ __ LSR
1f9e : f0 0d __ BEQ $1fad ; (crt_fmul8 + 45)
1fa0 : b0 e2 __ BCS $1f84 ; (crt_fmul8 + 4)
1fa2 : 66 0b __ ROR WORK + 8 
1fa4 : 66 0a __ ROR WORK + 7 
1fa6 : 66 09 __ ROR WORK + 6 
1fa8 : 4a __ __ LSR
1fa9 : 90 f7 __ BCC $1fa2 ; (crt_fmul8 + 34)
1fab : d0 d7 __ BNE $1f84 ; (crt_fmul8 + 4)
1fad : 60 __ __ RTS
--------------------------------------------------------------------
crt_fdiv: ; crt_fdiv
1fae : a5 1b __ LDA ACCU + 0 
1fb0 : 05 1c __ ORA ACCU + 1 
1fb2 : 05 1d __ ORA ACCU + 2 
1fb4 : d0 03 __ BNE $1fb9 ; (crt_fdiv + 11)
1fb6 : 85 1e __ STA ACCU + 3 
1fb8 : 60 __ __ RTS
1fb9 : a5 1e __ LDA ACCU + 3 
1fbb : 45 06 __ EOR WORK + 3 
1fbd : 29 80 __ AND #$80
1fbf : 85 1e __ STA ACCU + 3 
1fc1 : a5 08 __ LDA WORK + 5 
1fc3 : f0 62 __ BEQ $2027 ; (crt_fdiv + 121)
1fc5 : a5 07 __ LDA WORK + 4 
1fc7 : c9 ff __ CMP #$ff
1fc9 : f0 5c __ BEQ $2027 ; (crt_fdiv + 121)
1fcb : a9 00 __ LDA #$00
1fcd : 85 09 __ STA WORK + 6 
1fcf : 85 0a __ STA WORK + 7 
1fd1 : 85 0b __ STA WORK + 8 
1fd3 : a2 18 __ LDX #$18
1fd5 : a5 1b __ LDA ACCU + 0 
1fd7 : c5 03 __ CMP WORK + 0 
1fd9 : a5 1c __ LDA ACCU + 1 
1fdb : e5 04 __ SBC WORK + 1 
1fdd : a5 1d __ LDA ACCU + 2 
1fdf : e5 05 __ SBC WORK + 2 
1fe1 : 90 13 __ BCC $1ff6 ; (crt_fdiv + 72)
1fe3 : a5 1b __ LDA ACCU + 0 
1fe5 : e5 03 __ SBC WORK + 0 
1fe7 : 85 1b __ STA ACCU + 0 
1fe9 : a5 1c __ LDA ACCU + 1 
1feb : e5 04 __ SBC WORK + 1 
1fed : 85 1c __ STA ACCU + 1 
1fef : a5 1d __ LDA ACCU + 2 
1ff1 : e5 05 __ SBC WORK + 2 
1ff3 : 85 1d __ STA ACCU + 2 
1ff5 : 38 __ __ SEC
1ff6 : 26 09 __ ROL WORK + 6 
1ff8 : 26 0a __ ROL WORK + 7 
1ffa : 26 0b __ ROL WORK + 8 
1ffc : ca __ __ DEX
1ffd : f0 0a __ BEQ $2009 ; (crt_fdiv + 91)
1fff : 06 1b __ ASL ACCU + 0 
2001 : 26 1c __ ROL ACCU + 1 
2003 : 26 1d __ ROL ACCU + 2 
2005 : b0 dc __ BCS $1fe3 ; (crt_fdiv + 53)
2007 : 90 cc __ BCC $1fd5 ; (crt_fdiv + 39)
2009 : 38 __ __ SEC
200a : a5 0b __ LDA WORK + 8 
200c : 30 06 __ BMI $2014 ; (crt_fdiv + 102)
200e : 06 09 __ ASL WORK + 6 
2010 : 26 0a __ ROL WORK + 7 
2012 : 2a __ __ ROL
2013 : 18 __ __ CLC
2014 : 29 7f __ AND #$7f
2016 : 85 0b __ STA WORK + 8 
2018 : a5 07 __ LDA WORK + 4 
201a : e5 08 __ SBC WORK + 5 
201c : 90 1a __ BCC $2038 ; (crt_fdiv + 138)
201e : 18 __ __ CLC
201f : 69 7f __ ADC #$7f
2021 : b0 04 __ BCS $2027 ; (crt_fdiv + 121)
2023 : c9 ff __ CMP #$ff
2025 : d0 15 __ BNE $203c ; (crt_fdiv + 142)
2027 : a5 1e __ LDA ACCU + 3 
2029 : 09 7f __ ORA #$7f
202b : 85 1e __ STA ACCU + 3 
202d : a9 80 __ LDA #$80
202f : 85 1d __ STA ACCU + 2 
2031 : a9 00 __ LDA #$00
2033 : 85 1c __ STA ACCU + 1 
2035 : 85 1b __ STA ACCU + 0 
2037 : 60 __ __ RTS
2038 : 69 7f __ ADC #$7f
203a : 90 15 __ BCC $2051 ; (crt_fdiv + 163)
203c : 4a __ __ LSR
203d : 05 1e __ ORA ACCU + 3 
203f : 85 1e __ STA ACCU + 3 
2041 : a9 00 __ LDA #$00
2043 : 6a __ __ ROR
2044 : 05 0b __ ORA WORK + 8 
2046 : 85 1d __ STA ACCU + 2 
2048 : a5 0a __ LDA WORK + 7 
204a : 85 1c __ STA ACCU + 1 
204c : a5 09 __ LDA WORK + 6 
204e : 85 1b __ STA ACCU + 0 
2050 : 60 __ __ RTS
2051 : a9 00 __ LDA #$00
2053 : 85 1e __ STA ACCU + 3 
2055 : 85 1d __ STA ACCU + 2 
2057 : 85 1c __ STA ACCU + 1 
2059 : 85 1b __ STA ACCU + 0 
205b : 60 __ __ RTS
--------------------------------------------------------------------
divs16: ; divs16
205c : 24 1c __ BIT ACCU + 1 
205e : 10 0d __ BPL $206d ; (divs16 + 17)
2060 : 20 7a 20 JSR $207a ; (negaccu + 0)
2063 : 24 04 __ BIT WORK + 1 
2065 : 10 0d __ BPL $2074 ; (divs16 + 24)
2067 : 20 88 20 JSR $2088 ; (negtmp + 0)
206a : 4c 96 20 JMP $2096 ; (divmod + 0)
206d : 24 04 __ BIT WORK + 1 
206f : 10 f9 __ BPL $206a ; (divs16 + 14)
2071 : 20 88 20 JSR $2088 ; (negtmp + 0)
2074 : 20 96 20 JSR $2096 ; (divmod + 0)
2077 : 4c 7a 20 JMP $207a ; (negaccu + 0)
--------------------------------------------------------------------
negaccu: ; negaccu
207a : 38 __ __ SEC
207b : a9 00 __ LDA #$00
207d : e5 1b __ SBC ACCU + 0 
207f : 85 1b __ STA ACCU + 0 
2081 : a9 00 __ LDA #$00
2083 : e5 1c __ SBC ACCU + 1 
2085 : 85 1c __ STA ACCU + 1 
2087 : 60 __ __ RTS
--------------------------------------------------------------------
negtmp: ; negtmp
2088 : 38 __ __ SEC
2089 : a9 00 __ LDA #$00
208b : e5 03 __ SBC WORK + 0 
208d : 85 03 __ STA WORK + 0 
208f : a9 00 __ LDA #$00
2091 : e5 04 __ SBC WORK + 1 
2093 : 85 04 __ STA WORK + 1 
2095 : 60 __ __ RTS
--------------------------------------------------------------------
divmod: ; divmod
2096 : a5 1c __ LDA ACCU + 1 
2098 : d0 31 __ BNE $20cb ; (divmod + 53)
209a : a5 04 __ LDA WORK + 1 
209c : d0 1e __ BNE $20bc ; (divmod + 38)
209e : 85 06 __ STA WORK + 3 
20a0 : a2 04 __ LDX #$04
20a2 : 06 1b __ ASL ACCU + 0 
20a4 : 2a __ __ ROL
20a5 : c5 03 __ CMP WORK + 0 
20a7 : 90 02 __ BCC $20ab ; (divmod + 21)
20a9 : e5 03 __ SBC WORK + 0 
20ab : 26 1b __ ROL ACCU + 0 
20ad : 2a __ __ ROL
20ae : c5 03 __ CMP WORK + 0 
20b0 : 90 02 __ BCC $20b4 ; (divmod + 30)
20b2 : e5 03 __ SBC WORK + 0 
20b4 : 26 1b __ ROL ACCU + 0 
20b6 : ca __ __ DEX
20b7 : d0 eb __ BNE $20a4 ; (divmod + 14)
20b9 : 85 05 __ STA WORK + 2 
20bb : 60 __ __ RTS
20bc : a5 1b __ LDA ACCU + 0 
20be : 85 05 __ STA WORK + 2 
20c0 : a5 1c __ LDA ACCU + 1 
20c2 : 85 06 __ STA WORK + 3 
20c4 : a9 00 __ LDA #$00
20c6 : 85 1b __ STA ACCU + 0 
20c8 : 85 1c __ STA ACCU + 1 
20ca : 60 __ __ RTS
20cb : a5 04 __ LDA WORK + 1 
20cd : d0 1f __ BNE $20ee ; (divmod + 88)
20cf : a5 03 __ LDA WORK + 0 
20d1 : 30 1b __ BMI $20ee ; (divmod + 88)
20d3 : a9 00 __ LDA #$00
20d5 : 85 06 __ STA WORK + 3 
20d7 : a2 10 __ LDX #$10
20d9 : 06 1b __ ASL ACCU + 0 
20db : 26 1c __ ROL ACCU + 1 
20dd : 2a __ __ ROL
20de : c5 03 __ CMP WORK + 0 
20e0 : 90 02 __ BCC $20e4 ; (divmod + 78)
20e2 : e5 03 __ SBC WORK + 0 
20e4 : 26 1b __ ROL ACCU + 0 
20e6 : 26 1c __ ROL ACCU + 1 
20e8 : ca __ __ DEX
20e9 : d0 f2 __ BNE $20dd ; (divmod + 71)
20eb : 85 05 __ STA WORK + 2 
20ed : 60 __ __ RTS
20ee : a9 00 __ LDA #$00
20f0 : 85 05 __ STA WORK + 2 
20f2 : 85 06 __ STA WORK + 3 
20f4 : 84 02 __ STY $02 
20f6 : a0 10 __ LDY #$10
20f8 : 18 __ __ CLC
20f9 : 26 1b __ ROL ACCU + 0 
20fb : 26 1c __ ROL ACCU + 1 
20fd : 26 05 __ ROL WORK + 2 
20ff : 26 06 __ ROL WORK + 3 
2101 : 38 __ __ SEC
2102 : a5 05 __ LDA WORK + 2 
2104 : e5 03 __ SBC WORK + 0 
2106 : aa __ __ TAX
2107 : a5 06 __ LDA WORK + 3 
2109 : e5 04 __ SBC WORK + 1 
210b : 90 04 __ BCC $2111 ; (divmod + 123)
210d : 86 05 __ STX WORK + 2 
210f : 85 06 __ STA WORK + 3 
2111 : 88 __ __ DEY
2112 : d0 e5 __ BNE $20f9 ; (divmod + 99)
2114 : 26 1b __ ROL ACCU + 0 
2116 : 26 1c __ ROL ACCU + 1 
2118 : a4 02 __ LDY $02 
211a : 60 __ __ RTS
--------------------------------------------------------------------
mods16: ; mods16
211b : 24 1c __ BIT ACCU + 1 
211d : 10 10 __ BPL $212f ; (mods16 + 20)
211f : 20 7a 20 JSR $207a ; (negaccu + 0)
2122 : 24 04 __ BIT WORK + 1 
2124 : 10 03 __ BPL $2129 ; (mods16 + 14)
2126 : 20 88 20 JSR $2088 ; (negtmp + 0)
2129 : 20 96 20 JSR $2096 ; (divmod + 0)
212c : 4c 3a 21 JMP $213a ; (negtmpb + 0)
212f : 24 04 __ BIT WORK + 1 
2131 : 10 03 __ BPL $2136 ; (mods16 + 27)
2133 : 20 88 20 JSR $2088 ; (negtmp + 0)
2136 : 4c 96 20 JMP $2096 ; (divmod + 0)
2139 : 60 __ __ RTS
--------------------------------------------------------------------
negtmpb: ; negtmpb
213a : 38 __ __ SEC
213b : a9 00 __ LDA #$00
213d : e5 05 __ SBC WORK + 2 
213f : 85 05 __ STA WORK + 2 
2141 : a9 00 __ LDA #$00
2143 : e5 06 __ SBC WORK + 3 
2145 : 85 06 __ STA WORK + 3 
2147 : 60 __ __ RTS
--------------------------------------------------------------------
f32_to_i16: ; f32_to_i16
2148 : 20 d8 1d JSR $1dd8 ; (freg + 36)
214b : a5 07 __ LDA WORK + 4 
214d : c9 7f __ CMP #$7f
214f : b0 07 __ BCS $2158 ; (f32_to_i16 + 16)
2151 : a9 00 __ LDA #$00
2153 : 85 1b __ STA ACCU + 0 
2155 : 85 1c __ STA ACCU + 1 
2157 : 60 __ __ RTS
2158 : e9 8e __ SBC #$8e
215a : 90 16 __ BCC $2172 ; (f32_to_i16 + 42)
215c : 24 1e __ BIT ACCU + 3 
215e : 30 09 __ BMI $2169 ; (f32_to_i16 + 33)
2160 : a9 ff __ LDA #$ff
2162 : 85 1b __ STA ACCU + 0 
2164 : a9 7f __ LDA #$7f
2166 : 85 1c __ STA ACCU + 1 
2168 : 60 __ __ RTS
2169 : a9 00 __ LDA #$00
216b : 85 1b __ STA ACCU + 0 
216d : a9 80 __ LDA #$80
216f : 85 1c __ STA ACCU + 1 
2171 : 60 __ __ RTS
2172 : aa __ __ TAX
2173 : a5 1c __ LDA ACCU + 1 
2175 : 46 1d __ LSR ACCU + 2 
2177 : 6a __ __ ROR
2178 : e8 __ __ INX
2179 : d0 fa __ BNE $2175 ; (f32_to_i16 + 45)
217b : 24 1e __ BIT ACCU + 3 
217d : 10 0e __ BPL $218d ; (f32_to_i16 + 69)
217f : 38 __ __ SEC
2180 : 49 ff __ EOR #$ff
2182 : 69 00 __ ADC #$00
2184 : 85 1b __ STA ACCU + 0 
2186 : a9 00 __ LDA #$00
2188 : e5 1d __ SBC ACCU + 2 
218a : 85 1c __ STA ACCU + 1 
218c : 60 __ __ RTS
218d : 85 1b __ STA ACCU + 0 
218f : a5 1d __ LDA ACCU + 2 
2191 : 85 1c __ STA ACCU + 1 
2193 : 60 __ __ RTS
--------------------------------------------------------------------
sint16_to_float: ; sint16_to_float
2194 : 24 1c __ BIT ACCU + 1 
2196 : 30 03 __ BMI $219b ; (sint16_to_float + 7)
2198 : 4c b2 21 JMP $21b2 ; (uint16_to_float + 0)
219b : 38 __ __ SEC
219c : a9 00 __ LDA #$00
219e : e5 1b __ SBC ACCU + 0 
21a0 : 85 1b __ STA ACCU + 0 
21a2 : a9 00 __ LDA #$00
21a4 : e5 1c __ SBC ACCU + 1 
21a6 : 85 1c __ STA ACCU + 1 
21a8 : 20 b2 21 JSR $21b2 ; (uint16_to_float + 0)
21ab : a5 1e __ LDA ACCU + 3 
21ad : 09 80 __ ORA #$80
21af : 85 1e __ STA ACCU + 3 
21b1 : 60 __ __ RTS
--------------------------------------------------------------------
uint16_to_float: ; uint16_to_float
21b2 : a5 1b __ LDA ACCU + 0 
21b4 : 05 1c __ ORA ACCU + 1 
21b6 : d0 05 __ BNE $21bd ; (uint16_to_float + 11)
21b8 : 85 1d __ STA ACCU + 2 
21ba : 85 1e __ STA ACCU + 3 
21bc : 60 __ __ RTS
21bd : a2 8e __ LDX #$8e
21bf : a5 1c __ LDA ACCU + 1 
21c1 : 30 06 __ BMI $21c9 ; (uint16_to_float + 23)
21c3 : ca __ __ DEX
21c4 : 06 1b __ ASL ACCU + 0 
21c6 : 2a __ __ ROL
21c7 : 10 fa __ BPL $21c3 ; (uint16_to_float + 17)
21c9 : 0a __ __ ASL
21ca : 85 1d __ STA ACCU + 2 
21cc : a5 1b __ LDA ACCU + 0 
21ce : 85 1c __ STA ACCU + 1 
21d0 : 8a __ __ TXA
21d1 : 4a __ __ LSR
21d2 : 85 1e __ STA ACCU + 3 
21d4 : a9 00 __ LDA #$00
21d6 : 85 1b __ STA ACCU + 0 
21d8 : 66 1d __ ROR ACCU + 2 
21da : 60 __ __ RTS
--------------------------------------------------------------------
divmod32: ; divmod32
21db : 84 02 __ STY $02 
21dd : a0 20 __ LDY #$20
21df : a9 00 __ LDA #$00
21e1 : 85 07 __ STA WORK + 4 
21e3 : 85 08 __ STA WORK + 5 
21e5 : 85 09 __ STA WORK + 6 
21e7 : 85 0a __ STA WORK + 7 
21e9 : a5 05 __ LDA WORK + 2 
21eb : 05 06 __ ORA WORK + 3 
21ed : d0 78 __ BNE $2267 ; (divmod32 + 140)
21ef : a5 04 __ LDA WORK + 1 
21f1 : d0 27 __ BNE $221a ; (divmod32 + 63)
21f3 : 18 __ __ CLC
21f4 : 26 1b __ ROL ACCU + 0 
21f6 : 26 1c __ ROL ACCU + 1 
21f8 : 26 1d __ ROL ACCU + 2 
21fa : 26 1e __ ROL ACCU + 3 
21fc : 2a __ __ ROL
21fd : 90 05 __ BCC $2204 ; (divmod32 + 41)
21ff : e5 03 __ SBC WORK + 0 
2201 : 38 __ __ SEC
2202 : b0 06 __ BCS $220a ; (divmod32 + 47)
2204 : c5 03 __ CMP WORK + 0 
2206 : 90 02 __ BCC $220a ; (divmod32 + 47)
2208 : e5 03 __ SBC WORK + 0 
220a : 88 __ __ DEY
220b : d0 e7 __ BNE $21f4 ; (divmod32 + 25)
220d : 85 07 __ STA WORK + 4 
220f : 26 1b __ ROL ACCU + 0 
2211 : 26 1c __ ROL ACCU + 1 
2213 : 26 1d __ ROL ACCU + 2 
2215 : 26 1e __ ROL ACCU + 3 
2217 : a4 02 __ LDY $02 
2219 : 60 __ __ RTS
221a : a5 1e __ LDA ACCU + 3 
221c : d0 10 __ BNE $222e ; (divmod32 + 83)
221e : a6 1d __ LDX ACCU + 2 
2220 : 86 1e __ STX ACCU + 3 
2222 : a6 1c __ LDX ACCU + 1 
2224 : 86 1d __ STX ACCU + 2 
2226 : a6 1b __ LDX ACCU + 0 
2228 : 86 1c __ STX ACCU + 1 
222a : 85 1b __ STA ACCU + 0 
222c : a0 18 __ LDY #$18
222e : 18 __ __ CLC
222f : 26 1b __ ROL ACCU + 0 
2231 : 26 1c __ ROL ACCU + 1 
2233 : 26 1d __ ROL ACCU + 2 
2235 : 26 1e __ ROL ACCU + 3 
2237 : 26 07 __ ROL WORK + 4 
2239 : 26 08 __ ROL WORK + 5 
223b : 90 0c __ BCC $2249 ; (divmod32 + 110)
223d : a5 07 __ LDA WORK + 4 
223f : e5 03 __ SBC WORK + 0 
2241 : aa __ __ TAX
2242 : a5 08 __ LDA WORK + 5 
2244 : e5 04 __ SBC WORK + 1 
2246 : 38 __ __ SEC
2247 : b0 0c __ BCS $2255 ; (divmod32 + 122)
2249 : 38 __ __ SEC
224a : a5 07 __ LDA WORK + 4 
224c : e5 03 __ SBC WORK + 0 
224e : aa __ __ TAX
224f : a5 08 __ LDA WORK + 5 
2251 : e5 04 __ SBC WORK + 1 
2253 : 90 04 __ BCC $2259 ; (divmod32 + 126)
2255 : 86 07 __ STX WORK + 4 
2257 : 85 08 __ STA WORK + 5 
2259 : 88 __ __ DEY
225a : d0 d3 __ BNE $222f ; (divmod32 + 84)
225c : 26 1b __ ROL ACCU + 0 
225e : 26 1c __ ROL ACCU + 1 
2260 : 26 1d __ ROL ACCU + 2 
2262 : 26 1e __ ROL ACCU + 3 
2264 : a4 02 __ LDY $02 
2266 : 60 __ __ RTS
2267 : a0 10 __ LDY #$10
2269 : a5 1e __ LDA ACCU + 3 
226b : 85 08 __ STA WORK + 5 
226d : a5 1d __ LDA ACCU + 2 
226f : 85 07 __ STA WORK + 4 
2271 : a9 00 __ LDA #$00
2273 : 85 1d __ STA ACCU + 2 
2275 : 85 1e __ STA ACCU + 3 
2277 : 18 __ __ CLC
2278 : 26 1b __ ROL ACCU + 0 
227a : 26 1c __ ROL ACCU + 1 
227c : 26 07 __ ROL WORK + 4 
227e : 26 08 __ ROL WORK + 5 
2280 : 26 09 __ ROL WORK + 6 
2282 : 26 0a __ ROL WORK + 7 
2284 : a5 07 __ LDA WORK + 4 
2286 : c5 03 __ CMP WORK + 0 
2288 : a5 08 __ LDA WORK + 5 
228a : e5 04 __ SBC WORK + 1 
228c : a5 09 __ LDA WORK + 6 
228e : e5 05 __ SBC WORK + 2 
2290 : aa __ __ TAX
2291 : a5 0a __ LDA WORK + 7 
2293 : e5 06 __ SBC WORK + 3 
2295 : 90 11 __ BCC $22a8 ; (divmod32 + 205)
2297 : 86 09 __ STX WORK + 6 
2299 : 85 0a __ STA WORK + 7 
229b : a5 07 __ LDA WORK + 4 
229d : e5 03 __ SBC WORK + 0 
229f : 85 07 __ STA WORK + 4 
22a1 : a5 08 __ LDA WORK + 5 
22a3 : e5 04 __ SBC WORK + 1 
22a5 : 85 08 __ STA WORK + 5 
22a7 : 38 __ __ SEC
22a8 : 88 __ __ DEY
22a9 : d0 cd __ BNE $2278 ; (divmod32 + 157)
22ab : 26 1b __ ROL ACCU + 0 
22ad : 26 1c __ ROL ACCU + 1 
22af : a4 02 __ LDY $02 
22b1 : 60 __ __ RTS
--------------------------------------------------------------------
crt_malloc: ; crt_malloc
22b2 : 18 __ __ CLC
22b3 : a5 1b __ LDA ACCU + 0 
22b5 : 69 05 __ ADC #$05
22b7 : 29 fc __ AND #$fc
22b9 : 85 03 __ STA WORK + 0 
22bb : a5 1c __ LDA ACCU + 1 
22bd : 69 00 __ ADC #$00
22bf : 85 04 __ STA WORK + 1 
22c1 : ad a0 23 LDA $23a0 ; (HeapNode.end + 0)
22c4 : d0 26 __ BNE $22ec ; (crt_malloc + 58)
22c6 : a9 00 __ LDA #$00
22c8 : 8d aa 23 STA $23aa 
22cb : 8d ab 23 STA $23ab 
22ce : ee a0 23 INC $23a0 ; (HeapNode.end + 0)
22d1 : a9 a8 __ LDA #$a8
22d3 : 09 02 __ ORA #$02
22d5 : 8d 9e 23 STA $239e ; (HeapNode.next + 0)
22d8 : a9 23 __ LDA #$23
22da : 8d 9f 23 STA $239f ; (HeapNode.next + 1)
22dd : 38 __ __ SEC
22de : a9 f0 __ LDA #$f0
22e0 : e9 02 __ SBC #$02
22e2 : 8d ac 23 STA $23ac 
22e5 : a9 ff __ LDA #$ff
22e7 : e9 00 __ SBC #$00
22e9 : 8d ad 23 STA $23ad 
22ec : a9 9e __ LDA #$9e
22ee : a2 23 __ LDX #$23
22f0 : 85 1d __ STA ACCU + 2 
22f2 : 86 1e __ STX ACCU + 3 
22f4 : 18 __ __ CLC
22f5 : a0 00 __ LDY #$00
22f7 : b1 1d __ LDA (ACCU + 2),y 
22f9 : 85 1b __ STA ACCU + 0 
22fb : 65 03 __ ADC WORK + 0 
22fd : 85 05 __ STA WORK + 2 
22ff : c8 __ __ INY
2300 : b1 1d __ LDA (ACCU + 2),y 
2302 : 85 1c __ STA ACCU + 1 
2304 : f0 20 __ BEQ $2326 ; (crt_malloc + 116)
2306 : 65 04 __ ADC WORK + 1 
2308 : 85 06 __ STA WORK + 3 
230a : b0 14 __ BCS $2320 ; (crt_malloc + 110)
230c : a0 02 __ LDY #$02
230e : b1 1b __ LDA (ACCU + 0),y 
2310 : c5 05 __ CMP WORK + 2 
2312 : c8 __ __ INY
2313 : b1 1b __ LDA (ACCU + 0),y 
2315 : e5 06 __ SBC WORK + 3 
2317 : b0 0e __ BCS $2327 ; (crt_malloc + 117)
2319 : a5 1b __ LDA ACCU + 0 
231b : a6 1c __ LDX ACCU + 1 
231d : 4c f0 22 JMP $22f0 ; (crt_malloc + 62)
2320 : a9 00 __ LDA #$00
2322 : 85 1b __ STA ACCU + 0 
2324 : 85 1c __ STA ACCU + 1 
2326 : 60 __ __ RTS
2327 : a5 05 __ LDA WORK + 2 
2329 : 85 07 __ STA WORK + 4 
232b : a5 06 __ LDA WORK + 3 
232d : 85 08 __ STA WORK + 5 
232f : a0 02 __ LDY #$02
2331 : a5 07 __ LDA WORK + 4 
2333 : d1 1b __ CMP (ACCU + 0),y 
2335 : d0 15 __ BNE $234c ; (crt_malloc + 154)
2337 : c8 __ __ INY
2338 : a5 08 __ LDA WORK + 5 
233a : d1 1b __ CMP (ACCU + 0),y 
233c : d0 0e __ BNE $234c ; (crt_malloc + 154)
233e : a0 00 __ LDY #$00
2340 : b1 1b __ LDA (ACCU + 0),y 
2342 : 91 1d __ STA (ACCU + 2),y 
2344 : c8 __ __ INY
2345 : b1 1b __ LDA (ACCU + 0),y 
2347 : 91 1d __ STA (ACCU + 2),y 
2349 : 4c 69 23 JMP $2369 ; (crt_malloc + 183)
234c : a0 00 __ LDY #$00
234e : b1 1b __ LDA (ACCU + 0),y 
2350 : 91 07 __ STA (WORK + 4),y 
2352 : a5 07 __ LDA WORK + 4 
2354 : 91 1d __ STA (ACCU + 2),y 
2356 : c8 __ __ INY
2357 : b1 1b __ LDA (ACCU + 0),y 
2359 : 91 07 __ STA (WORK + 4),y 
235b : a5 08 __ LDA WORK + 5 
235d : 91 1d __ STA (ACCU + 2),y 
235f : c8 __ __ INY
2360 : b1 1b __ LDA (ACCU + 0),y 
2362 : 91 07 __ STA (WORK + 4),y 
2364 : c8 __ __ INY
2365 : b1 1b __ LDA (ACCU + 0),y 
2367 : 91 07 __ STA (WORK + 4),y 
2369 : a0 00 __ LDY #$00
236b : a5 05 __ LDA WORK + 2 
236d : 91 1b __ STA (ACCU + 0),y 
236f : c8 __ __ INY
2370 : a5 06 __ LDA WORK + 3 
2372 : 91 1b __ STA (ACCU + 0),y 
2374 : 18 __ __ CLC
2375 : a5 1b __ LDA ACCU + 0 
2377 : 69 02 __ ADC #$02
2379 : 85 1b __ STA ACCU + 0 
237b : 90 02 __ BCC $237f ; (crt_malloc + 205)
237d : e6 1c __ INC ACCU + 1 
237f : 60 __ __ RTS
--------------------------------------------------------------------
spentry:
2380 : __ __ __ BYT 00                                              : .
--------------------------------------------------------------------
giocharmap:
2381 : __ __ __ BYT 01                                              : .
--------------------------------------------------------------------
fround5:
2382 : __ __ __ BYT 00 00 00 3f cd cc 4c 3d 0a d7 a3 3b 6f 12 03 3a : ...?..L=...;o..:
2392 : __ __ __ BYT 17 b7 51 38 ac c5 a7 36 bd 37 06 35             : ..Q8...6.7.5
--------------------------------------------------------------------
HeapNode:
239e : __ __ __ BSS	4
