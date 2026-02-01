#importonce

#import "constants.asm"
#import "utils.asm"


// Ultimate cartridge registers
.const CONTROL_REG     = $df1c  // Write
.const STATUS_REG      = $df1c  // Read, default $00, Also used for status flags

.const CMD_DATA_REG    = $df1d  // Write
.const IDENT_REG       = $df1d  // Read, default $C9
.const RESP_DATA_REG   = $df1e  // Read
.const STATUS_DATA_REG = $df1f  // Read

// Ultimate Command Targets
.const TARGET_DOS1 = $01
.const TARGET_DOS2 = $02
.const TARGET_NETWORK  = $03
.const TARGET_CONTROL = $04

// Ultimate Status Register bits
.const STATUS_REG_BIT_CMD_BUSY = %00000001  // This bit indicates that there is a pending command in the command memory.
.const STATUS_REG_BIT_DATA_ACC = %00000010  // This bit reflects the condition that the user has told the Ultimate-II that it accepted the data.
.const STATUS_REG_BIT_ABORT_P  = %00000100  // This bit reflects the state of the internal abort flag. When this bit is ‘1’, the Ultimate-II still has to handle the abort request.
.const STATUS_REG_BIT_ERROR    = %00001000  // When this bit is ‘1’, the user tried to send a command to the Ultimate-II while it was not in idle state.
.const STATUS_REG_BIT_STATE    = %00110000  // 00:idle, 01:cmd busy, 10:data last, 11:data more
.const STATUS_REG_BIT_STAT_AV  = %01000000  // When this bit is ‘1’, there is status data available from the status queue, accessible through the status data register ($DF1F).
.const STATUS_REG_BIT_DATA_AV  = %10000000  // When this bit is ‘1’, there is response data available from the data queue, accessible through the response data register ($DF1E).

// Ultimate Control Register bits
.const CONTROL_REG_BIT_PUSH_CMD = %00000001  // Writing a ‘1’ to this register bit causes the command that was written to the command data register to be pushed into the software of the Ultimate-II.
.const CONTROL_REG_BIT_DATA_ACC = %00000010  // Writing a ‘1’ to this register bit tells the communication layer that all data from the Ultimate-II was accepted. This is automatically ignored when the communication controller is not in one of the two data states. Writing to this bit also causes the transfer of the data/status queues to be aborted and reset. Thus, the data response and status response queues will be empty after writing this bit.
.const CONTROL_REG_BIT_ABORT    = %00000100  // Writing a ‘1’ to this register sets the ‘abort’ flag in the communication controller. This bit is polled by the Ultimate-II software. When it finds this bit set, the current communication is aborted, and the state machine is forced back to the idle state.
.const CONTROL_REG_BIT_CLR_ERR  = %00001000  // Pushing a command to the Ultimate-II when the communication layer is not in idle mode, causes a state error flag to be set. See status register. Write a ‘1’ to CLR_ERR to clear this error condition.


// Sends a command to the Ultimate and retrieves status (does not read data)
// Input: full command including target and cmd, incl. data bytes if any
//   UII_CMD_BYTES - <target><cmd>[data bytes]
//   Register A: length of command payload in bytes (without target and cmd)
sendcommand:
    tay
    jsr wait_idle
    // send command bytes
    iny  // inc length for target+cmd
    iny  // inc length for target+cmd
    ldx #$00
!send_loop:
    lda UII_CMD_BYTES,x
    sta CMD_DATA_REG
    inx
    dey
    bne !send_loop-
    // push command
    lda CONTROL_REG
    ora #CONTROL_REG_BIT_PUSH_CMD
    sta CONTROL_REG
    // error?
    lda STATUS_REG
    and #STATUS_REG_BIT_ERROR
    beq !no_error+
    jsr status_error
!no_error:
    jsr wait_not_busy
    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept
    rts


// Reads data from Ultimate command interface and puts it to CHROUT
uii_readdata_CHROUT:
    lda #<readdata_CHROUT_callback
    sta JSR_INDIRECT_ADDR
    lda #>readdata_CHROUT_callback
    sta JSR_INDIRECT_ADDR+1
// Reads data from Ultimate command interface and calls callback to output each byte in A register
// Input: callback address in JSR_INDIRECT_ADDR (lo/hi). Optins are readdata_CHROUT_callback, readdata_PRG_callback
// Output: effect depends on what callback pointer is set on input.
uii_readdata:
!skip_ff_bytes:
    lda STATUS_REG
    and #STATUS_REG_BIT_DATA_AV
    beq !data_not_available+
    // data available, is it ff?
    lda RESP_DATA_REG
    // cmp #$ff  // TODO FF must not be skipped as is part of data, check somehow better is the byte is data or just read on when no data are available; FF means it is awaiting server to send some data
    // beq !skip_ff_bytes-
    jsr call_indirect  // jsr CHROUT,  Simulate the "JSR (JSR_INDIRECT_ADDR)" instruction
!read_remaining_data:
    lda STATUS_REG
    and #STATUS_REG_BIT_DATA_AV
    beq !data_not_available+
    // data available
    lda RESP_DATA_REG
    jsr call_indirect  // jsr CHROUT,  Simulate the "JSR (JSR_INDIRECT_ADDR)" instruction
    jmp !read_remaining_data-
!data_not_available:
    rts

call_indirect:
    jmp (JSR_INDIRECT_ADDR)  // This performs the jump; RTS from the target; will return to the 'jsr' above.

// Prints out A register to terminal
readdata_CHROUT_callback:
    jsr CHROUT
    rts

// Stores A register to memory pointed by ZP_INDIRECT_ADDR
readdata_PRG_callback:
    ldx ZP_INDIRECT_ADDR+1
    cpx #$00  // is load address dictated by L cmd?
    bne !address_use_from_cli+

    // set load address from PRG header
    sta ZP_INDIRECT_ADDR  // first byte of load address comes in A
    lda RESP_DATA_REG     // lets hope the second byte of header is ready
    sta ZP_INDIRECT_ADDR+1
    jmp !set_new_callback_address+

!address_use_from_cli:
    // discard first two bytes from PRG header(load address)
    lda RESP_DATA_REG  // A register has first data byte, this lda reads the second byte
    // load address is already set in ZP_INDIRECT_ADDR by set_uii_readdata_to_PRG macro

!set_new_callback_address:
    lda #<readdata_PRG_callback_after_header_was_read
    sta JSR_INDIRECT_ADDR
    lda #>readdata_PRG_callback_after_header_was_read
    sta JSR_INDIRECT_ADDR+1
    rts  // in this call we only read second byte from header, next byte will go to the new callback

readdata_PRG_callback_after_header_was_read:
    ldy #$00
    sta (ZP_INDIRECT_ADDR),y
    inc ZP_INDIRECT_ADDR
    bne !+
    inc ZP_INDIRECT_ADDR+1
!:
    rts

uii_read_more_data:   // while(uii_isdataavailable())
    jsr uii_isdataavailable
    bcc !no_more_data+
uii_read_more_data_entry:
    jsr uii_readdata  // if uii_readdata_CHROUT was called before, it is assumed the callback is still set
    // TODO check for errors here?
    jsr uii_accept
    jmp uii_read_more_data
!no_more_data:
    rts

// Output: carry set when more data is available, clear when last data
uii_isdataavailable:
    lda STATUS_REG
    and #STATUS_REG_BIT_DATA_AV
    beq !no_data+
    sec  // data available
    rts
!no_data:
    clc  // no data available
    rts


// Output: data count // TODO zatim nevraci
uii_readstatus:
    // uii_isstatusdataavailable
    ldx #$00
!data_available:
    lda STATUS_REG
    and #STATUS_REG_BIT_STAT_AV
    beq !data_not_available+
    // status data available
    lda STATUS_DATA_REG
    sta STATUS_STRING,x  // string for last status memory
    inx
    cpx #30
    bne !data_available-
    dex  // do not overflow
    jmp !data_available-
!data_not_available:
    lda #$00
    sta STATUS_STRING,x  // null-terminate
    rts

uii_accept:
    lda CONTROL_REG
    ora #CONTROL_REG_BIT_DATA_ACC
    sta CONTROL_REG
    // wait for ack
!pending_ack:
    lda STATUS_REG
    and #STATUS_REG_BIT_DATA_ACC
    bne !pending_ack-
    rts


// Check last read status
//(uii_status[0] == '0' && uii_status[1] == '0')
// Output: carry clear on success, set on failure
uii_success:
    lda STATUS_STRING  // first status byte
    cmp #$30   // '0'
    bne !error+
    lda STATUS_STRING+1  // second status byte
    cmp #$30   // '0'
    bne !error+
    clc        // Clear carry (success) return true
    rts
 !error:
    sec        // Set carry (error) return false
    rts


// Waits for the Ultimate command interface to be idle.
wait_idle:
!loop:
    lda STATUS_REG
    and #STATUS_REG_BIT_STATE
    bne !loop-
    rts

// Waits for data to be available from the Ultimate command interface.
// Output: carry set when more data is available, clear when last data
wait_for_data:
!loop:
    lda STATUS_REG
    sta $0401
    tay
    and #$20  // data more or data last
    cmp #$00
    beq !loop-
    tya
    and #$10
    bne !more_data+
    clc  // last data
    rts
!more_data:
    sec  // more data
    rts

// Waits for the Ultimate command interface to not be busy.
wait_not_busy:
!loop:
    lda STATUS_REG
    tay
    tya
    and #STATUS_REG_BIT_STATE
    cmp #$10
    beq !loop-
    rts


// TODO vracet chyby zpet do OS
status_error:
    lda #RED
    sta $d020
    jmp *
    rts
