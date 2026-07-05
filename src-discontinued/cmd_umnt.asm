#import "utils.asm"
#import "c64u_dos.asm"


// -----------------------------------------------------------------------------
// Unmount disk image from drive #8
// -----------------------------------------------------------------------------
// Purpose:
//   Access virtual disk images via UII filesystem as normal drives.
// Usage:
//   umnt

cmd_umnt:
    ParsingInputsDone() // finish parsing input line
    jsr uii_unmount_disk
    CommandDone()  // jump to parser completion handler in parser.asm
