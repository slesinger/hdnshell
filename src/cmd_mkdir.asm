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
    jsr uii_create_dir
    CommandDone()  // jump to parser completion handler in parser.asm
