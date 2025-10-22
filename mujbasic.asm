// ============================================================================
// HONDANI Shell - Custom BASIC ROM Replacement for Commodore 64
// ============================================================================
// This ROM replaces the built-in BASIC interpreter at $A000-$BFFF
// Version: 0.1.0
// ============================================================================

.file [name="mujbasic.bin", type="bin", segments="BasicROM"]

// BASIC ROM is located at $A000-$BFFF (8KB)
.segmentdef BasicROM [start=$A000, min=$A000, max=$BFFF, fill]

.segment BasicROM

// ============================================================================
// Cold Start Vector - MUST be at $A000
// ============================================================================
// The C64 KERNAL reads the 16-bit address at $A000-$A001 and jumps there
// ============================================================================

.word ColdStart         // Cold start vector at $A000-$A001
.word WarmStart         // Warm start vector at $A002-$A003

// ============================================================================
// Entry Points
// ============================================================================

ColdStart:
    jsr InitSystem      // Initialize the system
    jmp MainLoop        // Enter main loop

WarmStart:
    // For now, warm start does the same as cold start
    jmp ColdStart

// ============================================================================
// Constants and Variables
// ============================================================================
.const InputBuffer  = $0340     // Input buffer in RAM (safe area page 3, 256 bytes)
.const InputLength  = $033C     // Current length of input (in RAM - safe area)
.const CursorPos    = $033D     // Current cursor position (in RAM - safe area)

// ============================================================================
// Main Loop
// ============================================================================
// Main event loop - waits for user input and processes commands
// ============================================================================

MainLoop:
    jsr $FFE4           // GETIN - Get character from keyboard buffer
    cmp #0              // Check if a key was pressed
    beq MainLoop        // No key pressed, keep looping
    
    // Handle special keys
    cmp #13             // Enter key?
    beq HandleEnter
    cmp #20             // Delete key?
    beq HandleDelete
    cmp #157            // Cursor left?
    beq HandleCursorLeft
    cmp #29             // Cursor right?
    beq HandleCursorRight
    
    // Regular character - add to input buffer
    ldx InputLength
    cpx #255            // Max buffer size check
    beq MainLoop        // Buffer full, ignore
    
    sta InputBuffer,x   // Store character in buffer
    inc InputLength     // Increment buffer length
    jsr $FFD2           // CHROUT - Print character to screen
    jmp MainLoop

HandleEnter:
    // Copy input buffer to $1000
    lda InputLength
    beq EmptyInput      // Skip copy if empty
    
    ldx #0
CopyLoop:
    lda InputBuffer,x
    sta $1000,x
    inx
    cpx InputLength
    bcc CopyLoop        // Continue while X < InputLength
    
EmptyInput:
    // Null terminate
    lda #0
    ldx InputLength
    sta $1000,x
    
    // Clear input buffer
    lda #0
    sta InputLength
    
    // Print newline
    lda #13
    jsr $FFD2           // CHROUT
    
    jmp MainLoop

HandleDelete:
    // Check if buffer is empty
    lda InputLength
    beq MainLoop        // Nothing to delete
    
    // Delete last character
    dec InputLength
    
    // Move cursor back and print space to clear character
    lda #20             // Delete key
    jsr $FFD2
    
    jmp MainLoop

HandleCursorLeft:
    // Check if cursor position > 0
    lda CursorPos
    beq MainLoop        // At start, can't go left
    
    dec CursorPos
    lda #157            // Cursor left
    jsr $FFD2
    
    jmp MainLoop

HandleCursorRight:
    // Check if cursor position < input length
    lda CursorPos
    cmp InputLength
    beq MainLoop        // At end of input, can't go right
    
    inc CursorPos
    lda #29             // Cursor right
    jsr $FFD2
    
    jmp MainLoop

// ============================================================================
// Include initialization routines
// ============================================================================
#import "init.asm"

// ============================================================================
// BASIC ROM Vector Table (must be at specific addresses)
// ============================================================================
// The KERNAL expects certain vectors at specific locations in the BASIC ROM
// The cold start vector at $A000 is jumped to during system initialization
// ============================================================================

.pc = $BF80 "Vector Table"
// Standard BASIC ROM vectors
.word $0000, $0000, $0000, $0000
.word $0000, $0000, $0000, $0000

.pc = $BFA0
// Function vectors - BASIC warm start is the key one
.word ColdStart         // BASIC warm start - point to our cold start
.word $0000             // CHRGET routine
.word $0000             // CHRGOT routine
.word $0000, $0000, $0000, $0000, $0000

// ============================================================================
// ROM Signature
// ============================================================================
.pc = $BFEC
.text "hondani shell 0.1"
