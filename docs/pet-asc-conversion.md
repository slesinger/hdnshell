# PETSCII ↔ ASCII Conversion Table (Set 2: lower+upper)

This table maps all 256 PETSCII byte values to an ASCII-compatible code point and vice versa, using the reversible scheme described in the provided article. It preserves 1:1 reversibility by using non-ASCII byte ranges (128–255) as placeholders for PETSCII-specific controls, graphics, and MText.

| PETSCII hex | PETSCII description | ASCII hex | ASCII description |
|---|---|---|---|
| $00 | unsure | $00 | NUL |
| $01 | unsure | $01 | SOH |
| $02 | unsure | $02 | STX |
| $03 | STOP | $03 | ETX |
| $04 | unsure | $04 | EOT |
| $05 | WHITE | $05 | ENQ |
| $06 | unsure | $06 | ACK |
| $07 | unsure | $07 | BEL |
| $08 | LOCK | $08 | BS |
| $09 | UNLOCK | $09 | HT |
| $0A | unsure | $0A | LF |
| $0B | unsure | $0B | VT |
| $0C | unsure | $0C | FF |
| $0D | Return | $0D | CR |
| $0E | Text mode (lower/upper) | $0E | SO |
| $0F | unsure | $0F | SI |
| $10 | unsure | $10 | DLE |
| $11 | Cursor Down | $11 | DC1 (XON) |
| $12 | Reverse ON | $12 | DC2 |
| $13 | Home | $13 | DC3 (XOFF) |
| $14 | Delete | $14 | DC4 |
| $15 | unsure | $15 | NAK |
| $16 | unsure | $16 | SYN |
| $17 | unsure | $17 | ETB |
| $18 | unsure | $18 | CAN |
| $19 | unsure | $19 | EM |
| $1A | unsure | $1A | SUB |
| $1B | unsure | $1B | ESC |
| $1C | RED | $1C | FS |
| $1D | Cursor Right | $1D | GS |
| $1E | GREEN | $1E | RS |
| $1F | BLUE | $1F | US |
| $20 | space | $20 | space |
| $21 | exclamation mark | $21 | exclamation mark |
| $22 | double quote | $22 | double quote |
| $23 | number sign | $23 | number sign |
| $24 | dollar | $24 | dollar |
| $25 | percent | $25 | percent |
| $26 | ampersand | $26 | ampersand |
| $27 | apostrophe | $27 | apostrophe |
| $28 | left parenthesis | $28 | left parenthesis |
| $29 | right parenthesis | $29 | right parenthesis |
| $2A | asterisk | $2A | asterisk |
| $2B | plus | $2B | plus |
| $2C | comma | $2C | comma |
| $2D | hyphen | $2D | hyphen |
| $2E | period | $2E | period |
| $2F | slash | $2F | slash |
| $30 | digit 0 | $30 | digit 0 |
| $31 | digit 1 | $31 | digit 1 |
| $32 | digit 2 | $32 | digit 2 |
| $33 | digit 3 | $33 | digit 3 |
| $34 | digit 4 | $34 | digit 4 |
| $35 | digit 5 | $35 | digit 5 |
| $36 | digit 6 | $36 | digit 6 |
| $37 | digit 7 | $37 | digit 7 |
| $38 | digit 8 | $38 | digit 8 |
| $39 | digit 9 | $39 | digit 9 |
| $3A | colon | $3A | colon |
| $3B | semicolon | $3B | semicolon |
| $3C | less-than | $3C | less-than |
| $3D | equals | $3D | equals |
| $3E | greater-than | $3E | greater-than |
| $3F | question mark | $3F | question mark |
| $40 | @ | $40 | at sign |
| $41 | a | $61 | lowercase a |
| $42 | b | $62 | lowercase b |
| $43 | c | $63 | lowercase c |
| $44 | d | $64 | lowercase d |
| $45 | e | $65 | lowercase e |
| $46 | f | $66 | lowercase f |
| $47 | g | $67 | lowercase g |
| $48 | h | $68 | lowercase h |
| $49 | i | $69 | lowercase i |
| $4A | j | $6A | lowercase j |
| $4B | k | $6B | lowercase k |
| $4C | l | $6C | lowercase l |
| $4D | m | $6D | lowercase m |
| $4E | n | $6E | lowercase n |
| $4F | o | $6F | lowercase o |
| $50 | p | $70 | lowercase p |
| $51 | q | $71 | lowercase q |
| $52 | r | $72 | lowercase r |
| $53 | s | $73 | lowercase s |
| $54 | t | $74 | lowercase t |
| $55 | u | $75 | lowercase u |
| $56 | v | $76 | lowercase v |
| $57 | w | $77 | lowercase w |
| $58 | x | $78 | lowercase x |
| $59 | y | $79 | lowercase y |
| $5A | z | $7A | lowercase z |
| $5B | [ | $5B | left bracket |
| $5C | pound sign (£) | $5C | backslash |
| $5D | ] | $5D | right bracket |
| $5E | up arrow | $5E | caret |
| $5F | left arrow | $5F | underscore |
| $60 | Undefined | $E0 | Non-ASCII placeholder (MText formatting) |
| $61 | Undefined | $E1 | Non-ASCII placeholder (MText formatting) |
| $62 | Undefined | $E2 | Non-ASCII placeholder (MText formatting) |
| $63 | Undefined | $E3 | Non-ASCII placeholder (MText formatting) |
| $64 | Undefined | $E4 | Non-ASCII placeholder (MText formatting) |
| $65 | Undefined | $E5 | Non-ASCII placeholder (MText formatting) |
| $66 | Undefined | $E6 | Non-ASCII placeholder (MText formatting) |
| $67 | Undefined | $E7 | Non-ASCII placeholder (MText formatting) |
| $68 | Undefined | $E8 | Non-ASCII placeholder (MText formatting) |
| $69 | Undefined | $E9 | Non-ASCII placeholder (MText formatting) |
| $6A | Undefined | $EA | Non-ASCII placeholder (MText formatting) |
| $6B | Undefined | $EB | Non-ASCII placeholder (MText formatting) |
| $6C | Undefined | $EC | Non-ASCII placeholder (MText formatting) |
| $6D | Undefined | $ED | Non-ASCII placeholder (MText formatting) |
| $6E | Undefined | $EE | Non-ASCII placeholder (MText formatting) |
| $6F | Undefined | $EF | Non-ASCII placeholder (MText formatting) |
| $70 | Undefined | $F0 | Non-ASCII placeholder (MText formatting) |
| $71 | Undefined | $F1 | Non-ASCII placeholder (MText formatting) |
| $72 | Undefined | $F2 | Non-ASCII placeholder (MText formatting) |
| $73 | Undefined | $F3 | Non-ASCII placeholder (MText formatting) |
| $74 | Undefined | $F4 | Non-ASCII placeholder (MText formatting) |
| $75 | Undefined | $F5 | Non-ASCII placeholder (MText formatting) |
| $76 | Undefined | $F6 | Non-ASCII placeholder (MText formatting) |
| $77 | Undefined | $F7 | Non-ASCII placeholder (MText formatting) |
| $78 | Undefined | $F8 | Non-ASCII placeholder (MText formatting) |
| $79 | Undefined | $F9 | Non-ASCII placeholder (MText formatting) |
| $7A | Undefined | $FA | Non-ASCII placeholder (MText formatting) |
| $7B | Undefined | $FB | Non-ASCII placeholder (MText formatting) |
| $7C | Undefined | $FC | Non-ASCII placeholder (MText formatting) |
| $7D | Undefined | $FD | Non-ASCII placeholder (MText formatting) |
| $7E | Undefined | $FE | Non-ASCII placeholder (MText formatting) |
| $7F | Undefined | $FF | Non-ASCII placeholder (MText formatting) |
| $80 | unsure | $80 | Non-ASCII placeholder (maps PETSCII unsure) |
| $81 | ORANGE | $81 | Non-ASCII placeholder (maps PETSCII ORANGE) |
| $82 | unsure | $82 | Non-ASCII placeholder (maps PETSCII unsure) |
| $83 | Load & Run | $83 | Non-ASCII placeholder (maps PETSCII Load & Run) |
| $84 | unsure | $84 | Non-ASCII placeholder (maps PETSCII unsure) |
| $85 | F1 | $85 | Non-ASCII placeholder (maps PETSCII F1) |
| $86 | F3 | $86 | Non-ASCII placeholder (maps PETSCII F3) |
| $87 | F5 | $87 | Non-ASCII placeholder (maps PETSCII F5) |
| $88 | F7 | $88 | Non-ASCII placeholder (maps PETSCII F7) |
| $89 | F2 | $89 | Non-ASCII placeholder (maps PETSCII F2) |
| $8A | F4 | $8A | Non-ASCII placeholder (maps PETSCII F4) |
| $8B | F6 | $8B | Non-ASCII placeholder (maps PETSCII F6) |
| $8C | F8 | $8C | Non-ASCII placeholder (maps PETSCII F8) |
| $8D | Return | $8D | Non-ASCII placeholder (maps PETSCII Return) |
| $8E | Graphics mode (upper/graphics) | $8E | Non-ASCII placeholder (maps PETSCII Graphics mode (upper/graphics)) |
| $8F | unsure | $8F | Non-ASCII placeholder (maps PETSCII unsure) |
| $90 | BLACK | $90 | Non-ASCII placeholder (maps PETSCII BLACK) |
| $91 | Cursor Up | $91 | Non-ASCII placeholder (maps PETSCII Cursor Up) |
| $92 | Reverse OFF | $92 | Non-ASCII placeholder (maps PETSCII Reverse OFF) |
| $93 | Clear | $93 | Non-ASCII placeholder (maps PETSCII Clear) |
| $94 | Insert | $94 | Non-ASCII placeholder (maps PETSCII Insert) |
| $95 | BROWN | $95 | Non-ASCII placeholder (maps PETSCII BROWN) |
| $96 | Light RED | $96 | Non-ASCII placeholder (maps PETSCII Light RED) |
| $97 | Dark GREY | $97 | Non-ASCII placeholder (maps PETSCII Dark GREY) |
| $98 | Medium GREY | $98 | Non-ASCII placeholder (maps PETSCII Medium GREY) |
| $99 | Light GREEN | $99 | Non-ASCII placeholder (maps PETSCII Light GREEN) |
| $9A | Light BLUE | $9A | Non-ASCII placeholder (maps PETSCII Light BLUE) |
| $9B | Light GREY | $9B | Non-ASCII placeholder (maps PETSCII Light GREY) |
| $9C | PURPLE | $9C | Non-ASCII placeholder (maps PETSCII PURPLE) |
| $9D | Cursor Left | $9D | Non-ASCII placeholder (maps PETSCII Cursor Left) |
| $9E | YELLOW | $9E | Non-ASCII placeholder (maps PETSCII YELLOW) |
| $9F | CYAN | $9F | Non-ASCII placeholder (maps PETSCII CYAN) |
| $A0 | Shift-Space | $A0 | Non-ASCII placeholder (PETSCII Shift-Space) |
| $A1 | graphics symbol | $A1 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $A2 | graphics symbol | $A2 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $A3 | graphics symbol | $A3 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $A4 | graphics underscore | $A4 | Non-ASCII placeholder (PETSCII graphics underscore) |
| $A5 | graphics symbol | $A5 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $A6 | graphics symbol | $A6 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $A7 | graphics symbol | $A7 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $A8 | graphics symbol | $A8 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $A9 | graphics symbol | $A9 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $AA | graphics symbol | $AA | Non-ASCII placeholder (PETSCII graphics symbol) |
| $AB | graphics symbol | $AB | Non-ASCII placeholder (PETSCII graphics symbol) |
| $AC | graphics symbol | $AC | Non-ASCII placeholder (PETSCII graphics symbol) |
| $AD | graphics symbol | $AD | Non-ASCII placeholder (PETSCII graphics symbol) |
| $AE | graphics symbol | $AE | Non-ASCII placeholder (PETSCII graphics symbol) |
| $AF | graphics symbol | $AF | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B0 | graphics symbol | $B0 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B1 | graphics symbol | $B1 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B2 | graphics symbol | $B2 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B3 | graphics symbol | $B3 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B4 | graphics symbol | $B4 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B5 | graphics symbol | $B5 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B6 | graphics symbol | $B6 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B7 | graphics symbol | $B7 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B8 | graphics symbol | $B8 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $B9 | graphics symbol | $B9 | Non-ASCII placeholder (PETSCII graphics symbol) |
| $BA | graphics symbol | $BA | Non-ASCII placeholder (PETSCII graphics symbol) |
| $BB | graphics symbol | $BB | Non-ASCII placeholder (PETSCII graphics symbol) |
| $BC | graphics symbol | $BC | Non-ASCII placeholder (PETSCII graphics symbol) |
| $BD | graphics symbol | $BD | Non-ASCII placeholder (PETSCII graphics symbol) |
| $BE | graphics symbol | $BE | Non-ASCII placeholder (PETSCII graphics symbol) |
| $BF | graphics backslash | $BF | Non-ASCII placeholder (PETSCII graphics backslash) |
| $C0 | graphics symbol | $60 | backtick |
| $C1 | A | $41 | uppercase A |
| $C2 | B | $42 | uppercase B |
| $C3 | C | $43 | uppercase C |
| $C4 | D | $44 | uppercase D |
| $C5 | E | $45 | uppercase E |
| $C6 | F | $46 | uppercase F |
| $C7 | G | $47 | uppercase G |
| $C8 | H | $48 | uppercase H |
| $C9 | I | $49 | uppercase I |
| $CA | J | $4A | uppercase J |
| $CB | K | $4B | uppercase K |
| $CC | L | $4C | uppercase L |
| $CD | M | $4D | uppercase M |
| $CE | N | $4E | uppercase N |
| $CF | O | $4F | uppercase O |
| $D0 | P | $50 | uppercase P |
| $D1 | Q | $51 | uppercase Q |
| $D2 | R | $52 | uppercase R |
| $D3 | S | $53 | uppercase S |
| $D4 | T | $54 | uppercase T |
| $D5 | U | $55 | uppercase U |
| $D6 | V | $56 | uppercase V |
| $D7 | W | $57 | uppercase W |
| $D8 | X | $58 | uppercase X |
| $D9 | Y | $59 | uppercase Y |
| $DA | Z | $5A | uppercase Z |
| $DB | graphics symbol | $7B | left brace |
| $DC | graphics symbol | $7C | vertical bar |
| $DD | graphics symbol | $7D | right brace |
| $DE | pi | $7E | tilde |
| $DF | graphics symbol | $7F | DEL |
| $E0 | MText (formatting) | $E0 | Non-ASCII placeholder (MText formatting) |
| $E1 | MText (formatting) | $E1 | Non-ASCII placeholder (MText formatting) |
| $E2 | MText (formatting) | $E2 | Non-ASCII placeholder (MText formatting) |
| $E3 | MText (formatting) | $E3 | Non-ASCII placeholder (MText formatting) |
| $E4 | MText (formatting) | $E4 | Non-ASCII placeholder (MText formatting) |
| $E5 | MText (formatting) | $E5 | Non-ASCII placeholder (MText formatting) |
| $E6 | MText (formatting) | $E6 | Non-ASCII placeholder (MText formatting) |
| $E7 | MText (formatting) | $E7 | Non-ASCII placeholder (MText formatting) |
| $E8 | MText (formatting) | $E8 | Non-ASCII placeholder (MText formatting) |
| $E9 | MText (formatting) | $E9 | Non-ASCII placeholder (MText formatting) |
| $EA | MText (formatting) | $EA | Non-ASCII placeholder (MText formatting) |
| $EB | MText (formatting) | $EB | Non-ASCII placeholder (MText formatting) |
| $EC | MText (formatting) | $EC | Non-ASCII placeholder (MText formatting) |
| $ED | MText (formatting) | $ED | Non-ASCII placeholder (MText formatting) |
| $EE | MText (formatting) | $EE | Non-ASCII placeholder (MText formatting) |
| $EF | MText (formatting) | $EF | Non-ASCII placeholder (MText formatting) |
| $F0 | MText (formatting) | $F0 | Non-ASCII placeholder (MText formatting) |
| $F1 | MText (formatting) | $F1 | Non-ASCII placeholder (MText formatting) |
| $F2 | MText (formatting) | $F2 | Non-ASCII placeholder (MText formatting) |
| $F3 | MText (formatting) | $F3 | Non-ASCII placeholder (MText formatting) |
| $F4 | MText (formatting) | $F4 | Non-ASCII placeholder (MText formatting) |
| $F5 | MText (formatting) | $F5 | Non-ASCII placeholder (MText formatting) |
| $F6 | MText (formatting) | $F6 | Non-ASCII placeholder (MText formatting) |
| $F7 | MText (formatting) | $F7 | Non-ASCII placeholder (MText formatting) |
| $F8 | MText (formatting) | $F8 | Non-ASCII placeholder (MText formatting) |
| $F9 | MText (formatting) | $F9 | Non-ASCII placeholder (MText formatting) |
| $FA | MText (formatting) | $FA | Non-ASCII placeholder (MText formatting) |
| $FB | MText (formatting) | $FB | Non-ASCII placeholder (MText formatting) |
| $FC | MText (formatting) | $FC | Non-ASCII placeholder (MText formatting) |
| $FD | MText (formatting) | $FD | Non-ASCII placeholder (MText formatting) |
| $FE | MText (formatting) | $FE | Non-ASCII placeholder (MText formatting) |
| $FF | MText (formatting) | $FF | Non-ASCII placeholder (MText formatting) |
