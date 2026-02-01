#import "parser_functions.asm"
#import "floppy.asm"
#import "c64u_dos.asm"

// -----------------------------------------------------------------------------
// Load Command
// -----------------------------------------------------------------------------
// Purpose:
//   Loads a file from the selected device into memory at the specified address (optional).
// Usage:
//   l "filename" [aaaa]
//     - 'l' starts the load command.
//     - 'filename' is the name of the file to load (in quotes).
//     - 'aaaa' is the optional address to load the file into.
// Notes:
//   - If no address is given, the file is loaded to its default location.
// <load_command> ::= "l" <ws> <file_or_path> [ <ws> <address> ]


cmd_l:  // TODO support also LOAD"*",8,1
    // Parse mandatory filename
    jsr parse_file_or_path
    bcc !+
    // Error parsing filename, handle error
    lda #RED  // TODO wrong filename, print error message
    sta $d020
    CommandDone()  // jump to parser completion handler in parser.asm

!:
    lda #$00
    sta SAVY  // clear high byte of load address to indicate no address given
    // Check for optional address
    jsr parse_address
    bcc !+
    // Error parsing load address, handle error
    lda #CYAN  // TODO error parsing address, print error message
    sta $d020
!:
    ParsingInputsDone() // finish parsing input line

    lda FA
    cmp #8
    beq !use_kernal_load+
    cmp #9
    beq !use_kernal_load+
    cmp #10
    beq !use_kernal_load+
    cmp #SCR_Cc  // CSDB device
    beq !use_not_supported+
    // else use Ultimate command
ultimate_read_file:
    lda #$01              // File open mode: 0x01 = READ
    sta SADD              // Set file attributes register
    jsr uii_open_file  // requires filename pointer at ZP_INDIRECT_ADDR and length in FNLEN
    jsr uii_success
    bcc !open_success+
    // open error
    jsr PrintStatusString
    CommandDone()
    
!open_success:
    set_uii_readdata_to_PRG()  // set uii_readdata to store data to memory at address in SAVX/SAVY
    jsr uii_read_file  // requires read length in SAVX/SAVY
    // jsr uii_success
    // bcc !read_success+
    //// read error
    // jsr PrintStatusString
    // CommandDone()
// !read_success:
    jsr uii_read_more_data_entry
    jsr PrintStatusString
    jsr uii_close_file
    CommandDone()  // jump to parser completion handler in parser.asm

!use_not_supported:
    lda #<NOT_SUPPORTED
    sta SAVX
    lda #>NOT_SUPPORTED
    sta SAVY
    jsr PrintText
    CommandDone()


!use_kernal_load:
    jsr load_file
    bcc !load_success+
    // Load failed, indicate error
    lda #PURPLE  // TODO load error, print error message
    sta $d020
!load_success:
    CommandDone()  // jump to parser completion handler in parser.asm
