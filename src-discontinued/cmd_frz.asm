#import "utils.asm"
#import "c64u_dos.asm"


// -----------------------------------------------------------------------------
// Freeze the system and display menu
// -----------------------------------------------------------------------------
// Purpose:
//   Freeze the system and display menu.
// Usage:
//   frx

cmd_frz:
    ParsingInputsDone() // finish parsing input line

    jsr uii_freeze

    CommandDone()  // jump to parser completion handler in parser.asm
