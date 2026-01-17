
// Status data prectena ze status data: $30,$30,$2c,$4f,$4b
// 192.168.1.65 -> $c0,$a8,$01,$41 -> reverse minu, reverse open bracket, A, listecek

.var port = 6464


BasicUpstart2(start)
* = $1000 "Main Program"

.const GETIN = $FFE4  // KERNAL GETIN routine
.const CHROUT = $FFD2 // KERNAL CHROUT routine

// Ultimate cartridge registers
.const CONTROL_REG     = $df1c  // Write
.const STATUS_REG      = $df1c  // Read, default $00, Also used for status flags

.const CMD_DATA_REG    = $df1d  // Write
.const IDENT_REG       = $df1d  // Read, default $C9
.const RESP_DATA_REG   = $df1e  // Read
.const STATUS_DATA_REG = $df1f  // Read

// Command Targets
.const TARGET_NETWORK  = $03

// Network Commands

.const NET_CMD_GET_INTERFACE_COUNT = $02
.const NET_CMD_GET_IP_ADDRESS = $05
.const NET_CMD_CONNECT = $07
.const NET_CMD_UDP_SOCKET_CONNECT = $08
.const NET_CMD_CLOSE   = $09
.const NET_CMD_READ    = $10
.const NET_CMD_WRITE   = $11
.const NET_CMD_TCP_LISTENER_START = $12
.const NET_CMD_TCP_LISTENER_STOP = $13
.const NET_CMD_GET_LISTENER_STATE = $14
.const NET_CMD_GET_LISTENER_SOCKET = $15


// Status Register bits
.const STATUS_REG_BIT_CMD_BUSY = %00000001  // This bit indicates that there is a pending command in the command memory.
.const STATUS_REG_BIT_DATA_ACC = %00000010  // This bit reflects the condition that the user has told the Ultimate-II that it accepted the data.
.const STATUS_REG_BIT_ABORT_P  = %00000100  // This bit reflects the state of the internal abort flag. When this bit is ‘1’, the Ultimate-II still has to handle the abort request.
.const STATUS_REG_BIT_ERROR    = %00001000  // When this bit is ‘1’, the user tried to send a command to the Ultimate-II while it was not in idle state.
.const STATUS_REG_BIT_STATE    = %00110000  // 00:idle, 01:cmd busy, 10:data last, 11:data more
.const STATUS_REG_BIT_STAT_AV  = %01000000  // When this bit is ‘1’, there is status data available from the status queue, accessible through the status data register ($DF1F).
.const STATUS_REG_BIT_DATA_AV  = %10000000  // When this bit is ‘1’, there is response data available from the data queue, accessible through the response data register ($DF1E).

// Control Register bits
.const CONTROL_REG_BIT_PUSH_CMD = %00000001  // Writing a ‘1’ to this register bit causes the command that was written to the command data register to be pushed into the software of the Ultimate-II.
.const CONTROL_REG_BIT_DATA_ACC = %00000010  // Writing a ‘1’ to this register bit tells the communication layer that all data from the Ultimate-II was accepted. This is automatically ignored when the communication controller is not in one of the two data states. Writing to this bit also causes the transfer of the data/status queues to be aborted and reset. Thus, the data response and status response queues will be empty after writing this bit.
.const CONTROL_REG_BIT_ABORT    = %00000100  // Writing a ‘1’ to this register sets the ‘abort’ flag in the communication controller. This bit is polled by the Ultimate-II software. When it finds this bit set, the current communication is aborted, and the state machine is forced back to the idle state.
.const CONTROL_REG_BIT_CLR_ERR  = %00001000  // Pushing a command to the Ultimate-II when the communication layer is not in idle mode, causes a state error flag to be set. See status register. Write a ‘1’ to CLR_ERR to clear this error condition.


// Memory location for response
.const RESPONSE_BUFFER = $0400

// --- Main Program ---
start:
    // jsr uii_getipaddress
    jsr uii_tcpconnect
    jsr uii_socketread  // read welcome from server

main_loop:
    // read keyboard
    jsr GETIN
    beq main_loop  // skip if no key pressed
    jsr CHROUT
    // send data over socket
    lda #$2c
    sta $F7  // store data pointer low byte
    lda #$04
    sta $F8  // store data pointer high byte
    lda #$11
    jsr uii_socketwrite
    // receive response
    jsr uii_success
    bcc !+
    jsr status_error
!:
    // success, read socket
    jsr uii_socketread
    jmp main_loop


status_error:
    inc $0428
    inc $d020
    jmp *
    rts

// Input: host_ip, port
// Output: socket_id
uii_tcpconnect:
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_CONNECT
    sta CMD_DATA_REG
    // Send port (little-endian)
    lda #<port
    sta CMD_DATA_REG
    lda #>port
    sta CMD_DATA_REG
    // Send IP address (null-terminated string)
    ldx #0
!send_ip_loop:
    lda host_ip,x
    sta CMD_DATA_REG
    inx
    cmp #0
    bne !send_ip_loop-
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
    // read socket_id
    lda RESP_DATA_REG
    sta socket_id
    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept
    rts



uii_getipaddress:
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_GET_IP_ADDRESS
    sta CMD_DATA_REG
    lda #$00  // ??
    sta CMD_DATA_REG
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
   cmp #$ff  // TODO za jakych podminek dostany ff? da se to nejak zjistit ze statusu, ktery mozna checkuju nedostatecne?
   beq !data_available-
    jsr CHROUT
    jmp !data_available-
!data_not_available:
    rts

uii_readstatus:
    lda #$00
    sta sd2+1  // start at beginning of status output
    // uii_isstatusdataavailable
!data_available:
    lda STATUS_REG
    and #STATUS_REG_BIT_STAT_AV
    beq !data_not_available+
    // status data available
    lda STATUS_DATA_REG
sd2:sta $0400
    inc sd2+1
    jmp !data_available-
!data_not_available:
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
    lda $0400  // first status byte
    cmp #$30   // '0'
    bne !error+
    lda $0401  // second status byte
    cmp #$30   // '0'
    bne !error+
    clc        // Clear carry (success)
    rts
 !error:
    sec        // Set carry (error)
    rts


uii_socketread:
!read_next_block:
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_READ
    sta CMD_DATA_REG
    lda socket_id
    sta CMD_DATA_REG
    lda #$08 // low byte of length - read 1 byte
    sta socketread_expected_length_lo
    sta CMD_DATA_REG
    lda #$00  // high byte of length
    sta socketread_expected_length_hi
    sta CMD_DATA_REG
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
    lda RESP_DATA_REG
    sta socketread_real_length_lo
    lda RESP_DATA_REG
    sta socketread_real_length_hi
    jsr uii_readdata
    jsr uii_readstatus
    jsr uii_accept

    // HERE IT CAN RETURN OR LOOP TO READ MORE DATA IF NEEDED
    // IF RTS, YOU CAN DO OTHER THINGS AND READ THE REST LATER
    lda socketread_real_length_lo
    cmp socketread_expected_length_lo
    bne !read_exit+  // read length is shorter than requested, end of data, exit
    lda socketread_real_length_hi
    cmp socketread_expected_length_hi
    beq !read_next_block-  // read length equals requested, read more
!read_exit:
    rts
socketread_real_length_lo:
    .byte $00
socketread_real_length_hi:
    .byte $00
socketread_expected_length_lo:
    .byte $00
socketread_expected_length_hi:
    .byte $00


// Input: ZP $F7/$F8 - pointer to data, A - length
uii_socketwrite:
    sta !Y+ + 1  // store length
    jsr wait_idle
    lda #TARGET_NETWORK
    sta CMD_DATA_REG
    lda #NET_CMD_WRITE
    sta CMD_DATA_REG
    lda socket_id
    sta CMD_DATA_REG
    // Send IP address (null-terminated string)
    ldy #$00
!send_ip_loop:
    lda ($F7),y
    sta CMD_DATA_REG
    iny
!Y: cpy #$88  // virtual length
    bne !send_ip_loop-
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


// Waits for the Ultimate command interface to be idle.
wait_idle:
!loop:
    lda STATUS_REG
    and #STATUS_REG_BIT_STATE
    bne !loop-
    rts

// Waits for the Ultimate command interface to not be busy.
wait_not_busy:
!loop:
    lda STATUS_REG
    and #STATUS_REG_BIT_STATE
    cmp #$10
    beq !loop-
    rts



// --- Data ---
socket_id: .byte 0
host_ip:   .text "192.168.1.2"
           .byte 0
message:   .text "Hello from C64!"
           .byte 0
