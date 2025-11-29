#import "constants.asm"
#import "global_vars.asm"
#import "parser_functions.asm"


*= $0801 "Basic Upstart"
    BasicUpstart(start)    // 10 sys$0810

* = PARSER_INPUT_PTR
.text " L medlik.prg 7654"; .byte 0

* = $1000

// this is a test code that will read from PARSER_INPUT_PTR and output structure to $2000
start:
    // input_cursor = -1
    lda #$ff
    sta parser_input_cursor
    // skip_whitespace()
    jsr skip_whitespace

    // Read inital command character
    jsr next_char        // cursor moved, A holds next char, Y destroyed
    // Initialize command parsing table search
    // set initial indirect pointer to root token table
    ldy #<tbl
    sty ZP_INDIRECT_ADDR
    ldy #>tbl
    sty ZP_INDIRECT_ADDR+1
    ldy #$00 - 3  // set to first record minus 3 to simplify loop

    // process current character against token table
next_token_char_position:
    // move to next key in table
    iny
    iny
    iny

    // compare A with table entry
cmp_addr:
    cmp (ZP_INDIRECT_ADDR),y  // compare with expected key code (can be white space that indicates end of command)
    beq match_found
    // not matched, check for end of table
    pha
    lda (ZP_INDIRECT_ADDR),y
    cmp #PARSER_END_OF_TABLE
    beq cmd_unknown  // end of table reached, command unknown
    pla
    jmp next_token_char_position
    // match found, load address of next table or command
match_found:
    iny  // point to low byte of next table
    lda (ZP_INDIRECT_ADDR),y
    tax // store low byte of next table address in X because storing it directly sta ZP_INDIRECT_ADDR would destroy the next indirect reading
    iny  // point to high byte of next table
    lda (ZP_INDIRECT_ADDR),y
    sta ZP_INDIRECT_ADDR+1
    stx ZP_INDIRECT_ADDR
    // read next char into A (Y destroyed)
    jsr next_char
    bcs end_of_command  // if end of string -> end of command, read address to execute command
    // if next char is white space, end of command also
    cmp #PARSER_WHITESPACE
    beq end_of_command
    // continue parsing with next char
    ldy #$00
    jmp cmp_addr  // jump to new table

end_of_command:
    // no more chars, execute command at current address
    // A contains last read char (white space or $00)
    // load address of command to execute
    ldy #$01
    lda (ZP_INDIRECT_ADDR),y  // low byte of command address
    tax  // do not break next indirect reading
    iny
    lda (ZP_INDIRECT_ADDR),y
    sta cmd_exec_addr+2
    stx cmd_exec_addr+1
    // jump to command execution
cmd_exec_addr:
    jmp $ffff  // rewritable address

// Resolution of commands. Routines to execute commands go here. Typically to parse arguments
// These routines are ordered by visiting token tree depth-first. Token tree rows are ordered alphabetically.

cmd_unknown:
    pla  // to compensate for pha in cmd parsing loop
    // set 'command unknown'
    // TODO
    lda #$30
    jmp parse_done

cmd_empty:
    // execute empty command (just ENTER)
    // TODO
    lda #$31
    jmp parse_done

cmd_help:
    // execute help command
    // TODO
    lda #$32
    jmp parse_done

cmd_l:
    // execute l command
    // TODO
    lda #$33
    jmp parse_done

cmd_ll:
    // execute ll command
    // TODO
    lda #$34
    jmp parse_done

cmd_ls:
    // execute ls command
    // TODO
    lda #$35
    jmp parse_done

// Temporary parse done handler
parse_done:
    sta $0500
    inc $d020
    jmp parse_done


// Token Table for parser generalisation
// Parser iterates over "current letter" which is a structure of 3 bytes:
// 1. expected key code
// 2. low byte address of next letter structure (or command execution address)
// 3. high byte address of next letter structure (or command execution address)
// This table is ordered by visiting token tree depth-first. Token tree rows are orderd alphabetically.
// KEY_NULL must always go to as a first item of table because if white space or end of string is reached, parser jumps to KEY_NULL entry to get command address.
// If table for current letter does not resolve to full command then KEY_NULL must be there also to resolve to end_of_command and defaults to read the first entry.
// If command can have arguments, KEY_SPACE entry must be there to resolve to command execution address.
// Each table must end by PARSER_END_OF_TABLE marker.
tbl:
.byte KEY_NULL, <cmd_empty, >cmd_empty  // empty line
.byte KEY_H, <tbl_h, >tbl_h
.byte KEY_L, <tbl_l, >tbl_l
.byte PARSER_END_OF_TABLE

// Top level H
tbl_h:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_E, <tbl_he, >tbl_he
.byte PARSER_END_OF_TABLE

tbl_he:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_L, <tbl_hel, >tbl_hel
.byte PARSER_END_OF_TABLE

tbl_hel:
.byte KEY_NULL, <cmd_unknown, >cmd_unknown
.byte KEY_P, <tbl_help, >tbl_help
.byte PARSER_END_OF_TABLE

tbl_help:
.byte KEY_NULL, <cmd_help, >cmd_help  // no args
.byte PARSER_END_OF_TABLE

// Top level L
tbl_l:
// .byte KEY_NULL, <cmd_l, >cmd_l
.byte KEY_SPACE, <cmd_l, >cmd_l  // l with arguments
.byte KEY_L, <tbl_ll, >tbl_ll
.byte KEY_S, <tbl_ls, >tbl_ls
.byte PARSER_END_OF_TABLE

tbl_ll:
.byte KEY_NULL, <cmd_ll, >cmd_ll   // ll without arguments
.byte KEY_SPACE, <cmd_ll, >cmd_ll  // ll with arguments
.byte PARSER_END_OF_TABLE

tbl_ls:
.byte KEY_NULL, <cmd_ls, >cmd_ls   // ls without arguments  // must be fist position to read command address after carry flag identifies the end of command
.byte KEY_SPACE, <cmd_ls, >cmd_ls  // ls with arguments
.byte PARSER_END_OF_TABLE
