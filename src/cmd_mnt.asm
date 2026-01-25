#import "utils.asm"
#import "parser_functions.asm"
#import "c64u_dos.asm"


// -----------------------------------------------------------------------------
// Mount d64 or other image as drive #8
// -----------------------------------------------------------------------------
// Purpose:
//   Access virtual disk images via UII filesystem as normal drives.
// Usage:
//   mnt <image_path_name>

cmd_mnt:
    jsr parse_file_or_path
    bcc !dir_name_parsed_ok+
    // Error parsing filename, handle error
    lda #RED  // TODO wrong filename, print error message
    sta $d020
    CommandDone()  // jump to parser completion handler in parser.asm

!dir_name_parsed_ok:
    ParsingInputsDone() // finish parsing input line
    jsr uii_mount_disk
    CommandDone()  // jump to parser completion handler in parser.asm
