#import "utils.asm"
#import "c64u_dos.asm"


// -----------------------------------------------------------------------------
// Display date and time
// -----------------------------------------------------------------------------
// Purpose:
//   Display the current system datetime.
// Usage:
//   time

cmd_time:
    ParsingInputsDone() // finish parsing input line
    jsr uii_get_time
    PrintReturn()
    CommandDone()  // jump to parser completion handler in parser.asm
