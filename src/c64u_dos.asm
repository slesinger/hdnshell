#importonce

#import "constants.asm"
#import "c64u_common.asm"
#import "utils.asm"


// DOS Commands
.const DOS_CMD_IDENTIFY = $01
.const DOS_CMD_OPEN_FILE = $02
.const DOS_CMD_CLOSE_FILE = $03
.const DOS_CMD_READ_DATA = $04
.const DOS_CMD_WRITE_DATA = $05
.const DOS_CMD_FILE_SEEK = $06
.const DOS_CMD_FILE_INFO = $07
.const DOS_CMD_FILE_STAT = $08
.const DOS_CMD_DELETE_FILE = $09
.const DOS_CMD_RENAME_FILE = $0a
.const DOS_CMD_COPY_FILE = $0b
.const DOS_CMD_CHANGE_DIR = $11
.const DOS_CMD_GET_PATH = $12
.const DOS_CMD_OPEN_DIR = $13
.const DOS_CMD_READ_DIR = $14
.const DOS_CMD_COPY_UI_PATH = $15
.const DOS_CMD_CREATE_DIR = $16
.const DOS_CMD_COPY_HOME_PATH = $17
.const DOS_CMD_LOAD_REU = $21
.const DOS_CMD_SAVE_REU = $22
.const DOS_CMD_MOUNT_DISK = $23
.const DOS_CMD_UMOUNT_DISK = $24
.const DOS_CMD_SWAP_DISK = $25
.const DOS_CMD_GET_TIME = $26
.const DOS_CMD_SET_TIME = $27
.const CTRL_CMD_FREEZE = $05
.const CTRL_CMD_ENABLE_DISK_A = $30
.const CTRL_CMD_DISABLE_DISK_A = $31
.const CTRL_CMD_ENABLE_DISK_B = $32
.const CTRL_CMD_DISABLE_DISK_B = $33
.const CTRL_CMD_DRIVE_A_POWER = $34
.const CTRL_CMD_DRIVE_B_POWER = $35
.const DOS_CMD_ECHO	 = $f0

.const DOS_CMD_OPEN_FILE_READ = $01
.const DOS_CMD_OPEN_FILE_WRITE = $02
.const DOS_CMD_OPEN_FILE_CREATE = $06
.const DOS_CMD_OPEN_FILE_OVERWRITE = $0e

// Ultimate Cartridge Detection Routine
// Addresses for the Ultimate Command Interface
// Sets FEATURE_FLAG_ULTIMATE in FEATURE_FLAGS if detected
// Returns: carry set if ultimate detected, clear if not
DetectUltimate:
    lda STATUS_REG
    beq !found_it+
    // plain c64, no ultimate
    lda FEATURE_FLAGS
    and #($ff - FEATURE_FLAG_ULTIMATE)
    sta FEATURE_FLAGS  // clear ultimate flag
    clc
    rts
!found_it:
    lda FEATURE_FLAGS
    ora #FEATURE_FLAG_ULTIMATE
    sta FEATURE_FLAGS  // set ultimate flag
    sec
    rts


// target, cmd
// nekde se cte jen statu, ne data
// uii_get_dir nedela read data
// readdata schazi v 7 pripadech
// pouzit consecutive ram na vytvoreni celeho cmd vcetne targetu a cmd a dat
//     jaky je asi nejdelsi cmd?  directory nebo filename [a new filename] copy je vcetne cest

// Replies like this: b'!*** C64 Ultimate (V1.47) 3.14 ***'
uii_identify:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_IDENTIFY
    sta UII_CMD_BYTES_CMD
    lda #$00
    jsr sendcommand
    rts

uii_freeze:
    lda #TARGET_CONTROL
    sta UII_CMD_BYTES_TARGET
    lda #CTRL_CMD_FREEZE
    sta UII_CMD_BYTES_CMD
    lda #$00  // length
    jsr sendcommand
    rts

uii_get_path:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_GET_PATH
    sta UII_CMD_BYTES_CMD
    lda #$00
    jsr sendcommand
    rts


uii_open_dir:  // TODO sendcommand must not do readdata()
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_OPEN_DIR
    sta UII_CMD_BYTES_CMD
    lda #$00
    jsr sendcommand
    rts


uii_get_dir:  // TODO toto potrebuje custom readdata funkci
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_READ_DIR
    sta UII_CMD_BYTES_CMD
    lda #$00
    jsr sendcommand
    rts


// Input: filename pointer at ZP_INDIRECT_ADDR
// Input: filename length in FNLEN
uii_change_dir:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_CHANGE_DIR
    sta UII_CMD_BYTES_CMD

    ldy #$00
!load_filename_loop:
    lda (ZP_INDIRECT_ADDR),y
    sta UII_CMD_BYTES_DATA,y
    iny
    cpy FNLEN
    bne !load_filename_loop-

    lda FNLEN  // payload length
    jsr sendcommand
    rts


// Input: filename pointer at ZP_INDIRECT_ADDR
// Input: filename length in FNLEN
uii_create_dir:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_CREATE_DIR
    sta UII_CMD_BYTES_CMD

    ldy #$00
!load_filename_loop:
    lda (ZP_INDIRECT_ADDR),y
    sta UII_CMD_BYTES_DATA,y
    iny
    cpy FNLEN
    bne !load_filename_loop-

    lda FNLEN  // payload length
    jsr sendcommand
    rts


// Input: filename pointer at ZP_INDIRECT_ADDR
// Input: filename length in FNLEN
uii_mount_disk:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_MOUNT_DISK
    sta UII_CMD_BYTES_CMD
    lda #$08  // TODO make it possible to mount to different devices also
    sta UII_CMD_BYTES_DATA+0  // device number

    ldy #$00
!load_filename_loop:
    lda (ZP_INDIRECT_ADDR),y
    sta UII_CMD_BYTES_DATA+1,y
    iny
    cpy FNLEN
    bne !load_filename_loop-

    inc FNLEN  // include device number in payload length
    lda FNLEN  // payload length
    jsr sendcommand
    rts


uii_unmount_disk:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_UMOUNT_DISK
    sta UII_CMD_BYTES_CMD
    lda #$08  // TODO make it possible to unmount different devices also
    sta UII_CMD_BYTES_DATA+0  // device number
    lda #$01  // payload length
    jsr sendcommand
    rts


uii_get_time:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_GET_TIME
    sta UII_CMD_BYTES_CMD
    lda #$00
    jsr sendcommand
    rts


// Input: filename pointer at ZP_INDIRECT_ADDR
// Input: filename length in FNLEN
// Input: filename attributes in SADD
	// Attrib will be:
	// 0x01 = Read
	// 0x02 = Write
	// 0x06 = Create new file
	// 0x0E = Create (overwriting an existing file)
uii_open_file:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_OPEN_FILE
    sta UII_CMD_BYTES_CMD
    lda SADD  // file attributes
    sta UII_CMD_BYTES_DATA+0  // file attributes

    ldy #$00
!load_filename_loop:
    lda (ZP_INDIRECT_ADDR),y
    sta UII_CMD_BYTES_DATA+1,y
    iny
    cpy FNLEN
    bne !load_filename_loop-
    inc FNLEN  // include file attributes in payload length
    lda FNLEN  // payload length
    jsr sendcommand
    rts


// Input: read length in SAVX/SAVY (low/high)???
uii_read_file:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_READ_DATA
    sta UII_CMD_BYTES_CMD
    lda #$FF  // low byte of read length
    sta UII_CMD_BYTES_DATA+0
    lda #$80  // high byte of read length
    sta UII_CMD_BYTES_DATA+1
    lda #$02
    jsr sendcommand
    rts


uii_close_file:
    lda #TARGET_DOS1
    sta UII_CMD_BYTES_TARGET
    lda #DOS_CMD_CLOSE_FILE
    sta UII_CMD_BYTES_CMD
    lda #$00
    jsr sendcommand
    rts