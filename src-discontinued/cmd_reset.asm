#import "utils.asm"

// -----------------------------------------------------------------------------
// Reset the system.
// -----------------------------------------------------------------------------
// Purpose:
//   Resets the machine. Memory is preserved.
// Usage:
//   reset

cmd_reset:
    jmp JMP_RESET_MACHINE

