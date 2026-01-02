WORK IN PROGRESS!!!
!!!!!! SKVELY ZDROJ  --->  CROSS CHECK WITH https://c64os.com/post/petsciiasciiconversion,   
 https://c64os.com/post/Vic20C64SuperChart

# High level ASCII to PETSCII Conversion Table

| ASCII Range         | PETSCII Range      | Description                  |
|---------------------|--------------------|------------------------------|
| $00–$1F             | $00–$1F            | Control codes (mostly same)  |
| $20–$2F             | $20–$2F            | Space and punctuation        |
| $30–$39             | $30–$39            | Digits 0–9                   |
| $3A–$40             | $3A–$40            | Punctuation                  |
| $41–$5A (A–Z)       | $C1–$DA            | Uppercase letters            |
| $5B–$60             | $5B–$60            | Punctuation                  |
| $61–$7A (a–z)       | $41–$5A            | Lowercase letters            |
| $7B–$7E             | $7B–$7E            | Punctuation                  |
| $7F                 | $7F                | DEL (delete)                 |

## Details

- **ASCII $41–$5A (A–Z)** → **PETSCII $C1–$DA**  
  Example: ASCII 'A' ($41) → PETSCII $C1

- **ASCII $61–$7A (a–z)** → **PETSCII $41–$5A**  
  Example: ASCII 'a' ($61) → PETSCII $41

- **Other bytes ($20–$40, $5B–$60, $7B–$7E)** map directly (no change).

- **Control codes ($00–$1F, $7F)** mostly map directly.

---

# PETSCII ↔ ASCII: Characters Without Direct Mapping

| PETSCII Code | PETSCII Char | ASCII Replacement | Notes                       |
|--------------|-------------|-------------------|------------------------------|
| $27          | ' SH+7      | $27 (''')         | Apostrophe                   |
| $5C          | £           | $A3 ('£')         | Pound sign in upper ASCII tbl|
| $BF          | Gfx \       | $5C ('\')         | backslash (in the shifted set, a "low-res" backslash)   |
| $5E          | ↑           | $5E ('^')         | Up arrow replaced by '^'     |
| $5F          | ←           | $5F ('`')         | Left arrow replaced by backtick|
| $A4          | Gfx _       | $5F ('_')         | Gfx _ replaced by '_'        |
| $60          | π           | $B6 ('π')         | Pi replaced by Paragraph     |
| $F3          | Graphics    | $7B ('{')         | Opening brace                |
| $7D          | Graphics |  | $7C ('|')         | Infinity replaced by '|'     |
| $EB          | Graphics    | $7B ('}')         | Closing brace                |
| $EE          | Graphics    | $7E ('~')         | Negation gfx replace by Tilde|



**Table 1: PETSCII Codes (Blocks 1–4)**

| Block 1 |        |         | Block 2 |        |         | Block 3 |        |         | Block 4 |        |         |
|---------|--------|---------|---------|--------|---------|---------|--------|---------|---------|--------|---------|
| DEC     | HEX    | PETSCII | DEC     | HEX    | PETSCII | DEC     | HEX    | PETSCII | DEC     | HEX    | PETSCII |
| 0       | $00    |         | 32      | $20    | space   | 64      | $40    | @       | 96      | $60    |         |
| 1       | $01    |         | 33      | $21    | !       | 65      | $41    | a       | 97      | $61    |         |
| 2       | $02    |         | 34      | $22    | "       | 66      | $42    | b       | 98      | $62    |         |
| 3       | $03    | stop    | 35      | $23    | #       | 67      | $43    | c       | 99      | $63    |         |
| 4       | $04    |         | 36      | $24    | $       | 68      | $44    | d       | 100     | $64    |         |
| 5       | $05    | white   | 37      | $25    | %       | 69      | $45    | e       | 101     | $65    |         |
| 6       | $06    |         | 38      | $26    | &       | 70      | $46    | f       | 102     | $66    |         |
| 7       | $07    |         | 39      | $27    | '       | 71      | $47    | g       | 103     | $67    |         |
| 8       | $08    | lock    | 40      | $28    | (       | 72      | $48    | h       | 104     | $68    |         |
| 9       | $09    | unlock  | 41      | $29    | )       | 73      | $49    | i       | 105     | $69    |         |
| 10      | $0A    |         | 42      | $2A    | *       | 74      | $4A    | j       | 106     | $6A    |         |
| 11      | $0B    |         | 43      | $2B    | +       | 75      | $4B    | k       | 107     | $6B    |         |
| 12      | $0C    |         | 44      | $2C    | ,       | 76      | $4C    | l       | 108     | $6C    |         |
| 13      | $0D    | car ret | 45      | $2D    | -       | 77      | $4D    | m       | 109     | $6D    |         |
| 14      | $0E    | text    | 46      | $2E    | .       | 78      | $4E    | n       | 110     | $6E    |         |
| 15      | $0F    |         | 47      | $2F    | /       | 79      | $4F    | o       | 111     | $6F    |         |
| 16      | $10    |         | 48      | $30    | 0       | 80      | $50    | p       | 112     | $70    |         |
| 17      | $11    | cur down| 49      | $31    | 1       | 81      | $51    | q       | 113     | $71    |         |
| 18      | $12    | reverse | 50      | $32    | 2       | 82      | $52    | r       | 114     | $72    |         |
| 19      | $13    | cur home| 51      | $33    | 3       | 83      | $53    | s       | 115     | $73    |         |
| 20      | $14    | delete  | 52      | $34    | 4       | 84      | $54    | t       | 116     | $74    |         |
| 21      | $15    |         | 53      | $35    | 5       | 85      | $55    | u       | 117     | $75    |         |
| 22      | $16    |         | 54      | $36    | 6       | 86      | $56    | v       | 118     | $76    |         |
| 23      | $17    |         | 55      | $37    | 7       | 87      | $57    | w       | 119     | $77    |         |
| 24      | $18    |         | 56      | $38    | 8       | 88      | $58    | x       | 120     | $78    |         |
| 25      | $19    |         | 57      | $39    | 9       | 89      | $59    | y       | 121     | $79    |         |
| 26      | $1A    |         | 58      | $3A    | :       | 90      | $5A    | z       | 122     | $7A    |         |
| 27      | $1B    |         | 59      | $3B    | ;       | 91      | $5B    | [       | 123     | $7B    |         |
| 28      | $1C    | red     | 60      | $3C    | <       | 92      | $5C    | £       | 124     | $7C    |         |
| 29      | $1D    | cur right| 61     | $3D    | =       | 93      | $5D    | ]       | 125     | $7D    |         |
| 30      | $1E    | green   | 62      | $3E    | >       | 94      | $5E    | ↑       | 126     | $7E    |         |
| 31      | $1F    | blue    | 63      | $3F    | ?       | 95      | $5F    | ←       | 127     | $7F    |         |

---

**Table 2: PETSCII Codes (Blocks 5–8)**

| Block 5 |        |         | Block 6 |        |             | Block 7 |        |         | Block 8 |        |         |
|---------|--------|---------|---------|--------|-------------|---------|--------|---------|---------|--------|---------|
| DEC     | HEX    | PETSCII | DEC     | HEX    | PETSCII     | DEC     | HEX    | PETSCII | DEC     | HEX    | PETSCII |
| 128     | $80    |         | 160     | $A0    | Shift-Space | 192     | $C0    |         | 224     | $E0    |         |
| 129     | $81    | orange  | 161     | $A1    |             | 193     | $C1    | A       | 225     | $E1    |         |
| 130     | $82    |         | 162     | $A2    |             | 194     | $C2    | B       | 226     | $E2    |         |
| 131     | $83    | load & run | 163  | $A3    |             | 195     | $C3    | C       | 227     | $E3    |         |
| 132     | $84    |         | 164     | $A4    |             | 196     | $C4    | D       | 228     | $E4    |         |
| 133     | $85    | F1      | 165     | $A5    |             | 197     | $C5    | E       | 229     | $E5    |         |
| 134     | $86    | F3      | 166     | $A6    |             | 198     | $C6    | F       | 230     | $E6    |         |
| 135     | $87    | F5      | 167     | $A7    |             | 199     | $C7    | G       | 231     | $E7    |         |
| 136     | $88    | F7      | 168     | $A8    |             | 200     | $C8    | H       | 232     | $E8    |         |
| 137     | $89    | F2      | 169     | $A9    |             | 201     | $C9    | I       | 233     | $E9    |         |
| 138     | $8A    | F4      | 170     | $AA    |             | 202     | $CA    | J       | 234     | $EA    |         |
| 139     | $8B    | F6      | 171     | $AB    |             | 203     | $CB    | K       | 235     | $EB    |         |
| 140     | $8C    | F8      | 172     | $AC    |             | 204     | $CC    | L       | 236     | $EC    |         |
| 141     | $8D    | car ret | 173     | $AD    |             | 205     | $CD    | M       | 237     | $ED    |         |
| 142     | $8E    | graphics| 174     | $AE    |             | 206     | $CE    | N       | 238     | $EE    |         |
| 143     | $8F    |         | 175     | $AF    |             | 207     | $CF    | O       | 239     | $EF    |         |
| 144     | $90    | black   | 176     | $B0    |             | 208     | $D0    | P       | 240     | $F0    |         |
| 145     | $91    | cur up  | 177     | $B1    |             | 209     | $D1    | Q       | 241     | $F1    |         |
| 146     | $92    | rvs off | 178     | $B2    |             | 210     | $D2    | R       | 242     | $F2    |         |
| 147     | $93    | clear   | 179     | $B3    |             | 211     | $D3    | S       | 243     | $F3    |         |
| 148     | $94    | insert  | 180     | $B4    |             | 212     | $D4    | T       | 244     | $F4    |         |
| 149     | $95    | brown   | 181     | $B5    |             | 213     | $D5    | U       | 245     | $F5    |         |
| 150     | $96    | lt. red | 182     | $B6    |             | 214     | $D6    | V       | 246     | $F6    |         |
| 151     | $97    | dk. grey| 183     | $B7    |             | 215     | $D7    | W       | 247     | $F7    |         |
| 152     | $98    | md. grey| 184     | $B8    |             | 216     | $D8    | X       | 248     | $F8    |         |
| 153     | $99    | lt. green| 185    | $B9    |             | 217     | $D9    | Y       | 249     | $F9    |         |
| 154     | $9A    | lt. blue| 186     | $BA    |             | 218     | $DA    | Z       | 250     | $FA    |         |
| 155     | $9B    | lt. grey| 187     | $BB    |             | 219     | $DB    |         | 251     | $FB    |         |
| 156     | $9C    | purple  | 188     | $BC    |             | 220     | $DC    |         | 252     | $FC    |         |
| 157     | $9D    | cur left| 189     | $BD    |             | 221     | $DD    |         | 253     | $FD    |         |
| 158     | $9E    | yellow  | 190     | $BE    |             | 222     | $DE    |         | 254     | $FE    |         |
| 159     | $9F    | cyan    | 191     | $BF    |             | 223     | $DF    |         | 255     | $FF    |         |

---

# Reversible PETSCII/ASCII Conversion Table

Based on the analysis from the C64 OS post on PETSCII/ASCII conversion, the following table provides a fully reversible, 1:1 mapping. The goal is to ensure that converting from PETSCII to this "ASCII-compatible" format and back to PETSCII restores the original data perfectly.

This means that the "ASCII" column is not pure 7-bit ASCII; it utilizes codes in the 128-255 range to losslessly store PETSCII-specific information.

## Conversion Logic

The conversion can be summarized in two steps:

1.  **Swap entire blocks:**
    *   The contents of PETSCII Block 4 (`$60-$7F`, undefined) are swapped with PETSCII Block 7 (`$C0-$DF`, uppercase letters and symbols).
2.  **Swap partial blocks (alphabetic ranges):**
    *   The PETSCII lowercase alphabet (`a-z` at `$41-$5A`) is swapped with the ASCII uppercase alphabet (`A-Z` at `$41-$5A` in the target format).

This can be visualized as a three-way rotation of character groups:
*   PETSCII lowercase letters (`a-z`) move to the ASCII lowercase range.
*   ASCII uppercase letters (`A-Z`) move to the PETSCII uppercase range.
*   PETSCII uppercase symbols move to the ASCII lowercase symbol range.

## Conversion Table

| PETSCII Range | PETSCII Content | ↔️ | ASCII-Compatible Range | ASCII-Compatible Content | Notes |
|:---|:---|:---:|:---|:---|:---|
| `$00`–`$1F` | Control Codes (Low) | ↔️ | `$00`–`$1F` | Control Codes (Low) | Direct mapping. |
| `$20`–`$3F` | Numbers & Symbols | ↔️ | `$20`–`$3F` | Numbers & Symbols | Direct mapping. |
| `$40` | `@` | ↔️ | `$40` | `@` | Direct mapping. |
| `$41`–`$5A` | **Lowercase `a-z`** | ↔️ | `$61`–`$7A` | **Lowercase `a-z`** | PETSCII `a` (`$41`) ↔ ASCII `a` (`$61`). |
| `$5B`–`$5D` | `[ £ ]` | ↔️ | `$5B`–`$5D` | `[ \ ]` | Direct mapping. Note: `£` becomes `\`. |
| `$5E` | `↑` | ↔️ | `$5E` | `^` | Direct mapping. Note: `↑` becomes `^`. |
| `$5F` | `←` | ↔️ | `$5F` | `_` | Direct mapping. Note: `←` becomes `_`. |
| `$60`–`$7F` | *Undefined* | ↔️ | `$C0`–`$DF` | **Uppercase `A-Z` & Symbols** | PETSCII's undefined block maps to ASCII's uppercase block. |
| `$80`–`$9F` | Control Codes (High) | ↔️ | `$80`–`$9F` | Control Codes (High) | Direct mapping. These are outside standard ASCII. |
| `$A0`–`$BF` | Graphics Symbols | ↔️ | `$A0`–`$BF` | Graphics Symbols | Direct mapping. These are outside standard ASCII. |
| `$C0` | (gfx) | ↔️ | `$60` | `` ` `` | PETSCII graphic ↔ ASCII backtick. |
| `$C1`–`$DA` | **Uppercase `A-Z`** | ↔️ | `$41`–`$5A` | **Uppercase `A-Z`** | PETSCII `A` (`$C1`) ↔ ASCII `A` (`$41`). |
| `$DB`–`$DD` | (gfx) | ↔️ | `$7B`–`$7D` | `{ | }` | PETSCII graphics ↔ ASCII braces and pipe. |
| `$DE` | `π` | ↔️ | `$7E` | `~` | PETSCII Pi symbol ↔ ASCII tilde. |
| `$DF` | (gfx) | ↔️ | `$7F` | `DEL` | PETSCII graphic ↔ ASCII DEL character. |
| `$E0`–`$FF` | *Undefined* (MText) | ↔️ | `$E0`–`$FF` | *Undefined* (MText) | Direct mapping. Reserved for MText formatting. |

## Inconsistencies and Lost Semantics

While the conversion is reversible from a data perspective, semantic meaning is lost when viewing the "ASCII-compatible" text in a standard ASCII viewer. This is by design, as the primary goal is perfect restoration on a PETSCII-native machine.

### PETSCII to ASCII Inconsistencies:
When converting from PETSCII to the intermediate ASCII format, the following changes occur:
*   **PETSCII `£` (`$5C`)** becomes ASCII `\` (`$5C`).
*   **PETSCII `↑` (`$5E`)** becomes ASCII `^` (`$5E`).
*   **PETSCII `←` (`$5F`)** becomes ASCII `_` (`$5F`).
*   **PETSCII `π` (`$DE`)** becomes ASCII `~` (`$7E`).
*   **PETSCII-specific characters** (high control codes `$80-$9F`, graphics `$A0-$BF`) are stored outside the 7-bit ASCII range and will not be displayed correctly in standard ASCII viewers.
*   **PETSCII uppercase-adjacent symbols** (`$C0, $DB-$DF`) are mapped to ASCII lowercase-adjacent symbols (`` ` ``, `{`, `|`, `}`), losing their graphical representation.

### ASCII to PETSCII Inconsistencies:
When converting from standard ASCII to PETSCII, the reverse inconsistencies apply:
*   **ASCII `\` (`$5C`)** becomes PETSCII `£` (`$5C`).
*   **ASCII `^` (`$5E`)** becomes PETSCII `↑` (`$5E`).
*   **ASCII `_` (`$5F`)** becomes PETSCII `←` (`$5F`).
*   **ASCII `` ` `` (`$60`)** becomes a PETSCII graphic (`$C0`).
*   **ASCII `{ | }` (`$7B-$7D`)** become PETSCII graphics (`$DB-$DD`).
*   **ASCII `~` (`$7E`)** becomes PETSCII `π` (`$DE`).
*   Standard ASCII has no equivalent for most PETSCII control codes (colors, function keys) or graphics, so these cannot be generated from a pure 7-bit ASCII source.