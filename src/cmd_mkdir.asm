#import "utils.asm"
#import "parser_functions.asm"
#import "c64u_dos.asm"


// -----------------------------------------------------------------------------
// Create Directory
// -----------------------------------------------------------------------------
// Purpose:
//   Create a new directory in the Ultimate filesystem.
// Usage:
//   mkdir <directory_name>

cmd_mkdir:
    jsr parse_file_or_path
    bcc !dir_name_parsed_ok+
    // Error parsing filename, handle error
    lda #RED  // TODO wrong filename, print error message
    sta $d020
    CommandDone()  // jump to parser completion handler in parser.asm
!dir_name_parsed_ok:
    ParsingInputsDone() // finish parsing input line

    lda FA
    cmp #8
    beq !use_89_dir+
    cmp #9
    beq !use_89_dir+
    cmp #10  //iec device
    beq !use_iec_dir+
    cmp #SCR_Cc  // CSDB device
    beq !use_csdb_dir+
    // else use Ultimate command to get directory listing
    jsr uii_create_dir
    jmp !done+
!use_csdb_dir:
!use_89_dir:
!use_iec_dir:
    lda #<NOT_SUPPORTED
    sta SAVX
    lda #>NOT_SUPPORTED
    sta SAVY
    jsr PrintText
!done:
    PrintReturn()
    CommandDone()  // jump to parser completion handler in parser.asm
