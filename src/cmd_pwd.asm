#import "utils.asm"
#import "c64u_dos.asm"


// -----------------------------------------------------------------------------
// Get current path within the UII filesystem
// -----------------------------------------------------------------------------
// Purpose:
//   Retrieve and display the current working directory path.
// Usage:
//   pwd

cmd_pwd:
    ParsingInputsDone() // finish parsing input line

    jsr uii_get_path
    PrintReturn()
    CommandDone()  // jump to parser completion handler in parser.asm
