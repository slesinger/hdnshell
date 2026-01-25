#importonce

#import "constants.asm"

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


uii_readdata:
    // uii_isdataavailable
!data_available:
    lda STATUS_REG
    and #STATUS_REG_BIT_DATA_AV
    beq !data_not_available+
    // data available
    lda RESP_DATA_REG
   cmp #$ff  // TODO za jakych podminek dostanu ff? da se to nejak zjistit ze statusu, ktery mozna checkuju nedostatecne?
   beq !data_available-
    jsr CHROUT
    jmp !data_available-
!data_not_available:
    rts

// TODO is it used anywhere?
uii_readdata_readsocket:
    // uii_isdataavailable
    jsr uii_isdataavailable
    // jsr wait_for_data
!next_data:
    lda RESP_DATA_REG
    sta $05f0
    jsr CHROUT
    jsr uii_isdataavailable
    bcc !last_data+
    inc $0402
    // bcc !last_data+
    jmp !next_data-
!last_data:
    rts


// TODO is it used anywhere?
uii_read_more_data:
    jsr uii_isdataavailable
    bcc !no_more_data+
    jsr uii_readdata
    jsr uii_accept
    PrintReturn()
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
