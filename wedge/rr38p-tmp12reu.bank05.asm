// disassembly for rr38p-tmp12reu.bin bank 5
// bank file offset: $a000-$bfff
// cartridge window: $8000-$9fff
// vectors: coldstart=$8009, warmstart=$800c, signature=c3 c2 cd 38 30
// reachable instructions: 69 bytes decoded as code: 113
// entry points: $8009, $800c, $800f
// jump table from cold start:
//   $8009 -> $fcef
//   $800c -> $800f
// external branch/jsr/jmp targets: $dede, $f6bc, $f6ed, $fcef, $fe72

// symbol table (auto-generated)
//   $8009 bank05_cold_start
//   $800c bank05_warm_start
//   $800f bank05_api_01
//   $801a bank05_sub_801a
//   $9f01 bank05_sub_9f01
//   $9f2b bank05_sub_9f2b
//   $fcef bank05_api_00

// external symbol equates
.const bank05_api_00 = $fcef

.pc = $8000

    .byte $09, $80, $0c, $80, $c3, $c2, $cd, $38, $30    // data $8000
bank05_cold_start:
    jmp bank05_api_00              // 4c ef fc
bank05_warm_start:
    jmp bank05_api_01              // 4c 0f 80
bank05_api_01:
    jsr $f6bc              // 20 bc f6
    jsr $f6ed              // 20 ed f6
    beq bank05_sub_801a              // f0 03
    jmp $fe72              // 4c 72 fe
bank05_sub_801a:
    ldx #$fb               // a2 fb
    txs                    // 9a
    jsr bank05_sub_9f01              // 20 01 9f
    .byte $0c    // undocumented opcode
    .byte $80    // undocumented opcode
    brk                    // 00

// ===========================================================================
// HONDANI SHELL (wedge edition)
// ===========================================================================
// Occupies the reclaimed flash-utility region $8023-$9011 (user-approved
// takeover 2026-07-04: this virtual cartridge has no flash ROM, so the stock
// FLASH UTIL / ZAP feature is dead weight; the rest of its code at
// $9200-$9dff is left in place as inert bytes but is no longer functional).
//
// Entered only through the fixed jump table at $9012/$9015/$9018 (see below),
// with bank05 paged into $8000-$9fff by one of the RAM stubs at ie_ram+:
//   - $9012 wedge_dispatch: every direct-mode line BASIC couldn't execute
//     (via the IERROR RAM stub installed by bank01's line_tap). Recognized
//     shell commands run locally; everything else goes to the cloud chatbot.
//   - $9015 wedge_install: installs/refreshes the CINV ($0314) keyboard-watch
//     stub for C=+CTRL+digit console switching (via bank01's xb2 RAM trampoline,
//     called on every non-empty typed line).
//   - $9018 console_switch: performs the actual console switch (via the CINV
//     RAM stub, from IRQ context).
// See wedge/wedge-analysis.md for the full architecture.
// ===========================================================================

// --- Ultimate command interface at $df1c-$df1f (unrelated to this cart's
// --- own $de00/$de01 banking registers)
.const UII_CONTROL = $df1c
.const UII_STATUS  = $df1c
.const UII_CMD     = $df1d
.const UII_RESP    = $df1e
.const UII_STATDAT = $df1f
.const UII_ST_ERROR  = $08
.const UII_ST_STATE  = $30
.const UII_ST_STATAV = $40
.const UII_ST_DATAAV = $80
.const UII_CTL_PUSH  = $01
.const UII_CTL_ACC   = $02

// --- Ultimate command targets / command ids used here
.const TARGET_DOS1     = $01
.const TARGET_NETWORK  = $03
.const TARGET_CONTROL  = $04
.const DOS_CMD_IDENTIFY       = $01
.const DOS_CMD_CHANGE_DIR     = $11
.const DOS_CMD_GET_PATH       = $12
.const DOS_CMD_OPEN_DIR       = $13
.const DOS_CMD_READ_DIR       = $14
.const DOS_CMD_COPY_HOME_PATH = $17
.const DOS_CMD_CREATE_DIR     = $16
.const DOS_CMD_MOUNT_DISK     = $23
.const DOS_CMD_UMOUNT_DISK    = $24
.const DOS_CMD_GET_TIME       = $26
.const CTRL_CMD_FREEZE        = $05
.const NET_CMD_GET_IP    = $05
.const NET_TCP_CONNECT   = $07
.const NET_SOCKET_CLOSE  = $09
.const NET_SOCKET_READ   = $10
.const NET_SOCKET_WRITE  = $11

// --- KERNAL / BASIC ROM entries (both ROMs are visible in this cart's
// --- standard "8K game" memory map, cart ROM only at $8000-$9fff)
.const SCNKEY  = $ff9f
.const SETLFS  = $ffba
.const SETNAM  = $ffbd
.const READST  = $ffb7
.const OPEN    = $ffc0
.const CLOSE   = $ffc3
.const CHKIN   = $ffc6
.const CHKOUT  = $ffc9
.const CLRCHN  = $ffcc
.const CHRIN   = $ffcf
.const CHROUT  = $ffd2
.const GETIN   = $ffe4
.const LINPRT  = $bdcd            // BASIC: print A(hi)/X(lo) as unsigned decimal
.const KERNAL_RESET = $fce2
.const SHFLAG  = $028d            // modifier bits: 1=shift, 2=C=, 4=ctrl
.const SFDX    = $cb              // matrix code of key currently held (64 = none)
.const NDX     = $c6              // keyboard buffer length
.const LOAD    = $ffd5            // A=0 load/1 verify; X/Y=start addr (used only if SA=0)
.const SAVE    = $ffd8            // A=zp addr of 2-byte start ptr; X/Y=end+1 addr
.const TXTTAB  = $2b              // +$2c: start-of-BASIC-program ptr -- SAVE's own default
                                   // start-ptr slot (see cmd_memcpy); borrowed transiently

// --- RAM layout (2026-07-04 round 6): everything lives in the pages 1-3
// --- system areas, so that no LOADable program address ($0400+, in practice
// --- $0801+) ever overlaps wedge state -- $cf00-$cfff is completely vacated
// --- (it was prime game RAM and got trampled by real loads). All of this is
// --- plain C64 RAM, never repaged by RR banking. The resident stubs sit in
// --- the datassette buffer past the freezer's $0334/$0335 resume vector and
// --- the ML monitor's $0336-$033b state (MON/TASS lines disarm the hooks
// --- anyway, see wi_sniff). Keep every constant here in sync with the
// --- duplicated block in rr38p-tmp12reu.bank01.asm.
//
// Transient per-line / per-command scratch (fine to be trampled between
// lines -- rewritten before every use):
.const wc_buf     = $0110     // ll/dir entry buffer; $0100-$010f is skipped
.const wc_buf_max = 64        //   because BASIC's FOUT/LINPRT builds number
                              //   strings there (ll prints block counts!)
.const cf_shadow    = $02a7   // raw typed line, null-terminated (bank01 line_tap)
                              //   ($02a7-$02f0: 73 chars + null; the freeze
                              //   button's resume path scribbles $02a7-$02ca,
                              //   harmless -- rewritten on the next line)
// $02f1-$02fb: overlay union -- these three sets are never live at the same
// time (memcpy does no network I/O, reset never returns, net commands never
// run inside either):
.const cf_socket_id  = $02f1
.const cf_status0    = $02f2
.const cf_status1    = $02f3
.const cf_state      = $02f4  // net_read_and_print framing state (see there)
.const cf_got_data   = $02f5
.const cf_spin_idx   = $02f6
.const cf_retries_lo = $02f7  // 16-bit "give up waiting" countdown
.const cf_retries_hi = $02f8
.const cf_msglen_lo  = $02f9  // 16-bit remaining-content countdown
.const cf_msglen_hi  = $02fa
.const mc_start     = $02f1  // +$02f2: parsed $start address (memcpy)
.const mc_end       = $02f3  // +$02f4: parsed $end address (inclusive)
.const mc_savetxt   = $02f5  // +$02f6: TXTTAB ($2b/$2c) saved across SAVE
.const mc_devnum    = $02f7  // resolved KERNAL device number (8/9/10)
.const mc_hexval    = $02f8  // +$02f9: parse_hex16's accumulator
.const mc_fnstart   = $02fa  // cf_shadow offset of the filename's first byte
.const mc_fnlen     = $02fb  // filename length in bytes
.const reset_ram    = $02f1  // cmd_reset relocates its bank0+reset stub here
// $02fc-$02ff: scratch that IS live concurrently with the net set above:
.const w_dig1        = $02fc  // print_dec_byte scratch: hundreds digit
.const w_dig2        = $02fd  // print_dec_byte scratch: tens digit
.const w_hidx        = $02fe  // wc_match: haystack inner-compare index
.const w_hstart      = $02ff  // wc_match: haystack outer try-start offset
// Reuses wc_match's w_hstart byte: wc_match always zeroes it itself before
// use (see wcm_haspat), and it's otherwise only touched by the ll/dir
// wildcard filter -- a command that (like everything else) can't run while
// cs_modal has taken over, so the two uses never collide.
.const w_key_stage = $02ff   // key-repeat pacing (cs_fwd): 0 = next repeat of
                             // the held key gets the INITIAL delay; nonzero =
                             // already past that, use the FAST delay instead
// Reuses wc_match's w_hidx byte: wc_match always writes it (via `stx w_hidx`)
// before ever reading it, same non-collision reasoning as w_key_stage above.
.const last_matrix = $02fe  // SFDX value (matrix code) of the key currently
                            // being auto-repeated by cs_modal; $40 sentinel
                            // (SFDX's own "no key down" value) means none
// Two-stage key-repeat pacing for a held key forwarded to a server console
// (mirrors BASIC's own SPACE-key repeat feel): the first repeat waits the
// longer INITIAL delay, every repeat after that only waits the shorter FAST
// delay. Both are counted in vsyncs (wait_frames/wait_vbl) -- the VIC raster
// generator free-runs off the video/colour clock, not the 6510's instruction
// clock, so this stays correct whether the Ultimate 64 is running stock or
// overclocked, unlike a CPU-cycle-counted busy-wait would be.
.const INITIAL_REPEAT_DELAY_FRAMES = 25   // ~500ms @ 50Hz PAL / ~417ms @ 60Hz NTSC
.const FAST_REPEAT_DELAY_FRAMES    = 3    // ~60ms @ 50Hz PAL / ~50ms @ 60Hz NTSC
//
// Resident block (datassette buffer $0340-$03f9) -- must be intact whenever
// the hooks are armed; refreshed from ROM templates on every typed line:
.const ie_ram       = $0340   // IERROR stub + xb2 trampoline (bank01 copies it)
.const il_shim_ram  = $0372   // ILOAD shim: first KERNAL LOAD disarms all hooks
.const cinv_ram     = $03a0   // CINV keyboard-watch stub ($03a0-$03e6, 71 bytes)
// State ($03e7-$03fb -- ends exactly at the last datassette-buffer byte):
.const ie_orig_vec  = $03e7   // +$03e8: original IERROR vector (bank01-owned)
.const ie_errcode   = $03e9   // BASIC error index that fired (kept, not printed)
.const w_dev        = $03ea   // current device char: '8','9','S','C','H','T','F'
.const w_console    = $03eb   // console id, upper nibble: $00=local, $20-$70=server
.const w_cinv_orig  = $03ec   // +$03ed: original CINV ($0314) vector
.const w_latch      = $03ee   // C=+CTRL+digit one-shot latch for the CINV stub
.const w_parse_y    = $03ef   // dispatcher: cf_shadow offset of first non-space char
.const w_arg        = $03f0   // dispatcher: cf_shadow offset of the command argument
.const w_quiet      = $03f1   // nonzero: net_read_and_print + net_spin stay silent
.const w_bank       = $03f2   // CINV stub: saved $de00 bank bits across the switch
.const w_len        = $03f3   // generic scratch
.const w_jmp        = $03f4   // +$03f5: dispatcher's indirect handler vector
.const w_new        = $03f6   // console_switch: target console id scratch
.const w_skip       = $03f7   // wi_sniff verdict: 1 = launch line, bank01 must
                              //   skip the shadow copy (read by line_tap)
.const il_orig      = $03f8   // +$03f9: original ILOAD ($0330) vector
.const w_magic      = $03fa   // +$03fb: $a5,$c3 once one-time defaults (w_dev,
                              //   w_console, ...) have been set -- survives
                              //   disarm/rearm cycles so `#t` etc. stick

// ===========================================================================
// wedge_dispatch -- fixed jump-table entry ($9012, called from the IERROR
// stub). Runs the real parser/dispatcher below, then prints "\rREADY.\r"
// before returning -- the IERROR stub re-enters BASIC via jmp ($0302), which
// is the *middle* of BASIC's warm-start (past the point that normally prints
// READY.), so without this every recognized command and every cloud/CLI
// reply would leave the prompt looking stuck (hardware-confirmed 2026-07-04
// missing-READY report).
// ===========================================================================
wedge_dispatch:
    jsr wedge_dispatch_body
    jsr print_cr
    lda #msg_ready - msg_blob
    jsr print_msg
    jmp print_cr

// wedge_dispatch_body -- parse cf_shadow (the raw pre-crunch typed line).
// Recognized commands run locally and rts back to the wrapper above; a
// leading ':' (PySIC) is forwarded raw via send_cli (no "I:" wrapper, so
// PythonEvalHandler sees its own prefix directly); anything else
// unrecognized is forwarded to the cloud chatbot with the "I:" routing
// prefix -- same fallback as before, the temporary ERR=$xx diagnostic
// print is retired (mechanism is confirmed).
wedge_dispatch_body:
    ldy #$00
wd_skipsp:
    lda cf_shadow,y
    bne wd_notend
    rts                        // blank line: nothing to do
wd_notend:
    cmp #$20
    bne wd_first
    iny
    bne wd_skipsp
wd_first:
    sty w_parse_y
    cmp #$23                   // '#' -- device-switch family
    bne wd_check_pysic
    jmp cmd_hash
wd_check_pysic:
    cmp #$3a                   // ':' -- PySIC (python eval) prefix: forward
    bne wd_scan                // raw, skipping the "I:" chat wrapper entirely
    jmp send_cli
wd_scan:
    ldx #$00                   // X walks the keyword table
wd_next:
    ldy w_parse_y
wd_cmp:
    lda wedge_words,x
    bne wd_more
    jmp wd_chat                // table end: no keyword matched
wd_more:
    and #$7f                   // case-blind: PETSCII $c1-$da folds onto $41-$5a
    sta w_len
    lda cf_shadow,y
    and #$7f
    cmp w_len
    bne wd_mismatch
    lda wedge_words,x          // chars match -- was that the final char (bit7)?
    bmi wd_boundary
    inx
    iny
    bne wd_cmp
wd_boundary:
    iny                        // word complete: typed char after it must end the word
    lda cf_shadow,y
    beq wd_hit
    cmp #$20
    beq wd_hit
wd_mismatch:                   // skip to end of this table word + its address
    lda wedge_words,x
    bne wd_skip1
    jmp wd_chat                // safety: ran off the table end
wd_skip1:
    inx
    and #$80
    beq wd_mismatch
    inx                        // past the handler address
    inx
    jmp wd_next
wd_hit:                        // Y is on the boundary char; skip spaces to the arg
    lda cf_shadow,y
    beq wd_argdone
    cmp #$20
    bne wd_argdone
    iny
    bne wd_hit
wd_argdone:
    sty w_arg
    lda wedge_words+1,x        // X still on the final (bit7) char
    sta w_jmp
    lda wedge_words+2,x
    sta w_jmp+1
    jmp (w_jmp)

// Keyword table: PETSCII word with bit7 set on the last char (same
// convention as the cart's own table), then the handler address.
// Exact match + word boundary only -- no 3-letter abbreviation quirk.
wedge_words:
    .byte $53,$54,$41,$54,$55,$d3            // STATUS
    .byte <cmd_status, >cmd_status
    .byte $54,$49,$4d,$c5                    // TIME
    .byte <cmd_time, >cmd_time
    .byte $52,$45,$53,$45,$d4                // RESET
    .byte <cmd_reset, >cmd_reset
    .byte $4d,$45,$4e,$d5                    // MENU (was FRZ -- renamed, see cmd_menu)
    .byte <cmd_menu, >cmd_menu
    .byte $4c,$cc                            // LL
    .byte <cmd_dir, >cmd_dir
    .byte $44,$49,$d2                        // DIR
    .byte <cmd_dir, >cmd_dir
    .byte $4d,$4e,$d4                        // MNT
    .byte <cmd_mnt, >cmd_mnt
    .byte $55,$4d,$4e,$d4                    // UMNT
    .byte <cmd_umnt, >cmd_umnt
    .byte $43,$c4                            // CD
    .byte <cmd_cd, >cmd_cd
    .byte $50,$57,$c4                        // PWD
    .byte <cmd_pwd, >cmd_pwd
    .byte $49,$4e,$46,$cf                    // INFO (the cart's own stock command;
    .byte <cmd_info, >cmd_info               // see cmd_info -- recognized here purely so
                                              // it's swallowed instead of chat-forwarded)
    .byte $48,$45,$4c,$d0                    // HELP
    .byte <cmd_help, >cmd_help
    .byte $4d,$4b,$44,$49,$d2                // MKDIR
    .byte <cmd_mkdir, >cmd_mkdir
    .byte $43,$d0                            // CP
    .byte <cmd_cp, >cmd_cp
    .byte $4d,$45,$4d,$43,$50,$d9            // MEMCPY
    .byte <cmd_memcpy, >cmd_memcpy
    .byte $00

// ===========================================================================
// Command bodies
// ===========================================================================

// status -- firmware identify string, local IP, server host + reachability
cmd_status:
    lda #DOS_CMD_IDENTIFY
    jsr dos_simple_print
    jsr print_cr
    lda #msg_ip - msg_blob
    jsr print_msg
    jsr net_print_ip
    jsr print_cr
    lda #msg_server - msg_blob
    jsr print_msg
    ldx #$00
cst_host:
    lda net_test_host,x
    beq cst_probe
    jsr CHROUT
    inx
    bne cst_host
cst_probe:
    jsr net_connect            // reachability probe: connect, then close
    bcs cst_unreach
    jsr net_close
    lda #msg_ok - msg_blob
    jmp print_msg
cst_unreach:
    lda #msg_unreach - msg_blob
    jmp print_msg

// info -- no-op: INFO is the cart's own stock command (prints "RR REV: ..."
// straight from ROM, before BASIC ever reaches our IERROR hook). But its
// completion still raises a direct-mode error same as any other cart command
// (hardware-confirmed 2026-07-04: INFO's own output was followed by a stray
// chat reply), which our "any direct-mode error" hook would otherwise forward
// to the cloud as an unrecognized line. Recognizing INFO here just swallows
// that forward -- the cart has already done all the real work by the time
// this runs.
cmd_info:
    rts

// time -- Ultimate RTC date/time string
cmd_time:
    lda #DOS_CMD_GET_TIME
    jsr dos_simple_print
    jmp print_cr

// menu -- freeze the CLI's state and enter the Ultimate menu (control target
// command $05, the only "freeze" the UCI/REST API exposes -- on this
// platform freezing *is* dropping into the menu, there's no separate silent
// freeze; renamed from "frz" since that name suggested otherwise).
cmd_menu:
    lda #CTRL_CMD_FREEZE
    ldx #TARGET_CONTROL
    jsr dos_begin
    jmp dos_finish_quiet

// reset -- select bank0 (so the CBM80 cold vector lands in the cart's own
// menu, same as a hardware reset) and jump through the KERNAL reset. The
// bank write repages this very ROM window, so the tail runs from RAM.
cmd_reset:
    ldx #reset_stub_end - reset_stub - 1
crs_copy:
    lda reset_stub,x
    sta reset_ram,x
    dex
    bpl crs_copy
    jmp reset_ram
reset_stub:
    lda #$00
    sta $de00
    jmp KERNAL_RESET
reset_stub_end:

// #<device> -- switch the current device; bare '#' prints it.
// '8'/'9'/'S' are IEC devices (8/9/10), 'C' is the server-side CSDB module,
// 'N' is the server-side network drive (proxy onto the hondani server's
// workspace folder -- see cmd_cp), 'H'/'T'/'F' cd the Ultimate DOS filesystem
// to home / /TEMP / /FLASH (improvement over the old hdnsh, which only
// stored the marker).
cmd_hash:
    ldy w_parse_y
    iny
    lda cf_shadow,y
    bne ch_notbare
    lda w_dev                  // bare '#': print the current device letter
    jsr CHROUT
    jmp print_cr
ch_notbare:
    and #$7f
    cmp #$38                   // '8'
    beq ch_store
    cmp #$39                   // '9'
    beq ch_store
    cmp #$53                   // 'S' -- SoftIEC (IEC device 10)
    beq ch_store
    cmp #$43                   // 'C' -- CSDB (server-side module)
    beq ch_csdb
    cmp #$4e                   // 'N' -- server-side network drive (same
    beq ch_csdb                // "notify + forward raw line" mechanism as CSDB)
    cmp #$48                   // 'H' -- Ultimate home directory
    beq ch_home
    cmp #$54                   // 'T' -- /TEMP
    beq ch_temp
    cmp #$46                   // 'F' -- /FLASH
    beq ch_flash
    jmp wd_chat                // unknown device letter: let the cloud answer
ch_store:
    sta w_dev
    rts
ch_csdb:
    sta w_dev
    jmp send_cli               // server activates its CSDB module and replies
ch_home:
    sta w_dev
    lda #DOS_CMD_COPY_HOME_PATH
    jsr dos_simple_quiet
    jmp ch_pwd
ch_temp:
    sta w_dev
    ldy #txt_temp - path_blob
    jsr dos_chdir_blob
    jmp ch_pwd
ch_flash:
    sta w_dev
    ldy #txt_flash - path_blob
    jsr dos_chdir_blob
ch_pwd:
    lda #DOS_CMD_GET_PATH      // show where we landed
    jsr dos_simple_print
    jmp print_cr

// cd <path> -- change directory on whichever device w_dev currently selects.
// 'C'/'N' forward the raw line to the server's active module (CSDB / network
// drive, respectively); '8'/'9'/'S' send a "CD:<path>" command-channel string
// (works on IEC drives/servers that support subdirectories, e.g. CMD/SD2IEC-
// style firmware, same convention as the old src/cmd_cd.asm); 'H'/'T'/'F' use
// the Ultimate DOS CHANGE_DIR command with the typed path (unlike #h/#t/#f,
// which only cd to fixed locations).
cmd_cd:
    ldy w_arg
    lda cf_shadow,y
    bne ccd_hasarg
    lda #msg_err - msg_blob    // no argument
    jmp print_msg
ccd_hasarg:
    lda w_dev
    cmp #$43                   // 'C' -- CSDB: raw line to the server
    beq ccd_csdb
    cmp #$4e                   // 'N' -- network drive: same, server tracks its own cwd
    beq ccd_csdb
    cmp #$38                   // '8'
    beq ccd_iec
    cmp #$39                   // '9'
    beq ccd_iec
    cmp #$53                   // 'S' (SoftIEC = IEC device 10)
    beq ccd_iec
    lda #DOS_CMD_CHANGE_DIR    // 'H'/'T'/'F': Ultimate DOS filesystem
    ldx #TARGET_DOS1
    jsr dos_begin
    ldy w_arg
ccd_path:
    lda cf_shadow,y
    beq ccd_send
    sta UII_CMD
    iny
    bne ccd_path
ccd_send:
    jsr dos_finish_quiet
    lda #DOS_CMD_GET_PATH      // show where we landed
    jsr dos_simple_print
    jmp print_cr
ccd_csdb:
    jmp send_cli
ccd_iec:
    ldx #$08                   // device number for SETLFS
    cmp #$39
    bne ccd_not9
    ldx #$09
ccd_not9:
    cmp #$53
    bne ccd_notS
    ldx #$0a
ccd_notS:
    stx w_len
    lda #15                    // logical file 15, secondary address 15 (command channel)
    ldy #15
    jsr SETLFS
    lda #$00
    jsr SETNAM
    jsr OPEN
    bcs ccd_err
    ldx #15
    jsr CHKOUT
    lda #$43                   // "CD:"
    jsr CHROUT
    lda #$44
    jsr CHROUT
    lda #$3a
    jsr CHROUT
    ldy w_arg
ccd_iloop:
    lda cf_shadow,y
    beq ccd_idone
    jsr CHROUT
    iny
    bne ccd_iloop
ccd_idone:
    jsr CLRCHN
    lda #15
    jsr CLOSE
    jmp print_cr
ccd_err:
    lda #msg_err - msg_blob
    jmp print_msg

// pwd -- print the current directory. 'C'/'N' forward to the server's
// active module (CSDB / network drive); 'H'/'T'/'F' ask the Ultimate DOS
// filesystem (same GET_PATH used internally by #h/#t/#f); '8'/'9'/'S' have no
// queryable path over plain IEC command-channel conventions, so this reports
// "NOT SUPPORTED" there (same as the old hdnsh's cmd_pwd.asm).
cmd_pwd:
    lda w_dev
    cmp #$43                   // 'C' -- CSDB: raw line to the server
    beq cpw_csdb
    cmp #$4e                   // 'N' -- network drive: same
    beq cpw_csdb
    cmp #$38                   // '8'
    beq cpw_nosup
    cmp #$39                   // '9'
    beq cpw_nosup
    cmp #$53                   // 'S' (SoftIEC = IEC device 10)
    beq cpw_nosup
    lda #DOS_CMD_GET_PATH      // 'H'/'T'/'F'
    jsr dos_simple_print
    jmp print_cr
cpw_csdb:
    jmp send_cli
cpw_nosup:
    lda #msg_nosup - msg_blob
    jmp print_msg

// ll / dir -- list the current device
cmd_dir:
    lda w_dev
    cmp #$43                   // 'C': ask the server's CSDB module
    beq cd_server
    cmp #$4e                   // 'N': ask the server's network-drive module
    beq cd_server
    jmp cd_notc
cd_server:
    jmp send_cli
cd_notc:
    cmp #$38                   // '8'
    beq cd_kern
    cmp #$39                   // '9'
    beq cd_kern
    cmp #$53                   // 'S' (SoftIEC = IEC device 10)
    beq cd_kern
    jmp wd_uii_dir             // 'H'/'T'/'F': Ultimate DOS current directory
cd_kern:
    jmp kernal_dir

// mnt <image path> -- mount a disk image (on the Ultimate filesystem,
// relative to its current directory) as drive 8
cmd_mnt:
    ldy w_arg
    lda cf_shadow,y
    bne cm_hasarg
    lda #msg_err - msg_blob    // no argument
    jmp print_msg
cm_hasarg:
    lda #DOS_CMD_MOUNT_DISK
    ldx #TARGET_DOS1
    jsr dos_begin
    lda #$08                   // drive 8
    sta UII_CMD
    ldy w_arg
cm_path:
    lda cf_shadow,y
    beq cm_send
    sta UII_CMD
    iny
    bne cm_path
cm_send:
    jmp dos_finish_quiet

// umnt -- unmount drive 8's image
cmd_umnt:
    lda #DOS_CMD_UMOUNT_DISK
    ldx #TARGET_DOS1
    jsr dos_begin
    lda #$08                   // drive 8
    sta UII_CMD
    jmp dos_finish_quiet

// mkdir <name> -- create a directory on the Ultimate filesystem, relative to
// the current directory. Only meaningful for 'H'/'T'/'F' -- classic IEC
// drives/servers (8/9/S) and the CSDB module (C) have no create-directory
// convention here, so those report "NOT SUPPORTED" (same as the old hdnsh's
// cmd_mkdir.asm).
cmd_mkdir:
    ldy w_arg
    lda cf_shadow,y
    bne cmk_hasarg
    lda #msg_err - msg_blob    // no argument
    jmp print_msg
cmk_hasarg:
    lda w_dev
    cmp #$48                   // 'H'
    beq cmk_uii
    cmp #$54                   // 'T'
    beq cmk_uii
    cmp #$46                   // 'F'
    beq cmk_uii
    lda #msg_nosup - msg_blob
    jmp print_msg
cmk_uii:
    lda #DOS_CMD_CREATE_DIR
    ldx #TARGET_DOS1
    jsr dos_begin
    ldy w_arg
cmk_path:
    lda cf_shadow,y
    beq cmk_send
    sta UII_CMD
    iny
    bne cmk_path
cmk_send:
    jmp dos_finish_quiet

// cp <name> -- copy a file between the Ultimate filesystem and either the
// current network-drive (#n) directory or CSDB (#c), via the server's own
// FTP round trip onto this C64U's built-in FTP server (the same mechanism
// cloud/handlers/csdb_handler.py's cp already uses to push release files
// here -- see wedge-analysis.md). 'N'/'C' (GET): forward the typed line
// as-is ("cp <name>") -- the server's currently active module (netdrive or
// CSDB) decides what it means: netdrive FTPs a workspace file, CSDB
// downloads/unzips a release file -- either way it lands in this C64U's own
// /TEMP (use #t + the filename afterward; this is also the long-documented
// CSDB workflow, see docs/user_manual/csdb.md). 'H'/'T'/'F' (PUT): rewrite
// the line as "PUT <name>" -- the server FTP-pulls the file from this
// C64U's /TEMP and drops it into the #n session's current server-side
// directory (CSDB has no PUT direction). Deliberately always anchored on
// /TEMP for the local side rather than "wherever cd took you": the wire
// protocol has no way to query the Ultimate DOS current directory from the
// server side, so relaying an arbitrary local path isn't possible without a
// new query round trip -- not attempted in this first pass. '8'/'9'/'S'
// have no local filesystem/session to bridge, so those report
// "NOT SUPPORTED".
cmd_cp:
    ldy w_arg
    lda cf_shadow,y
    bne ccp_hasarg
    lda #msg_err - msg_blob    // no argument
    jmp print_msg
ccp_hasarg:
    lda w_dev
    cmp #$4e                   // 'N': GET -- typed line is already "cp <name>"
    beq ccp_get
    cmp #$43                   // 'C': CSDB's own long-documented "cp <name>"
    beq ccp_get                // download (see docs/user_manual/csdb.md) --
                                // same raw-forward mechanism as 'N', the
                                // server's active module (CSDB vs netdrive)
                                // decides what it means
    cmp #$48                   // 'H'
    beq ccp_put
    cmp #$54                   // 'T'
    beq ccp_put
    cmp #$46                   // 'F'
    beq ccp_put
    lda #msg_nosup - msg_blob
    jmp print_msg
ccp_get:
    jmp send_cli
ccp_put:
    // stash the filename argument (wc_buf is free here -- no ll/dir listing
    // in progress), then rebuild cf_shadow as "PUT <name>" before forwarding.
    ldy w_arg
    ldx #$00
ccp_savearg:
    lda cf_shadow,y
    sta wc_buf,x
    beq ccp_saved
    iny
    inx
    cpx #wc_buf_max
    bne ccp_savearg
    lda #$00
    sta wc_buf,x
ccp_saved:
    ldx #$00
ccp_pfx:
    lda ccp_put_pfx,x
    beq ccp_copyarg
    sta cf_shadow,x
    inx
    bne ccp_pfx
ccp_copyarg:
    ldy #$00
ccp_argloop:
    lda wc_buf,y
    sta cf_shadow,x
    beq ccp_argdone
    inx
    iny
    bne ccp_argloop
ccp_argdone:
    jmp send_cli
ccp_put_pfx:
    .byte $50,$55,$54,$20,$00  // "PUT "

// memcpy $start-$end filename  -- save a memory range to a file
// memcpy filename $start       -- load a file into memory at an explicit
//                                  start address (relocatable: any load
//                                  address embedded in the file is ignored)
//
// Device is whichever w_dev currently selects (H/T/F/8 all resolve to
// KERNAL device 8 -- the same physical Ultimate drive #h/#t/#f already just
// cd on; 9->9, S->10), or an explicit "#X:" prefix on the filename overrides
// it for this one command only (w_dev itself is left untouched). C/N have no
// local-memory bridge (yet) -- NOT SUPPORTED, same scoping decision as cp.
//
// This is exactly the technique BASIC's own SAVE/LOAD tokens use under the
// hood (see docs/inspiration/c64/mapc6411.txt's $E156/$E168 writeups):
// temporarily repoint TXTTAB ($2b/$2c) at the requested start address for
// SAVE (restored after, regardless of success), and pass the start address
// directly in X/Y for LOAD with SA=0 (tells LOAD to ignore any embedded
// address and use X/Y instead -- this is what makes the restore relocatable).
// Straight KERNAL SETLFS/SETNAM/LOAD/SAVE, no new file I/O of our own --
// bank01's ILOAD/ISAVE patch already fast-paths these through Ultimate DOS
// for device 8, same as a plain "SAVE"..",8,1" typed at the BASIC prompt.
cmd_memcpy:
    ldy w_arg
    lda cf_shadow,y
    bne cmc_hasarg
    lda #msg_err - msg_blob
    jmp print_msg
cmc_hasarg:
    cmp #$24                   // '$' -- "$start-$end filename" (SAVE form)
    beq cmc_save
    jmp cmc_load                // else "filename $start" (LOAD form)

// --- SAVE form: $start-$end filename ---
cmc_save:
    ldy w_arg
    iny                         // skip '$'
    jsr parse_hex16
    lda mc_hexval
    sta mc_start
    lda mc_hexval+1
    sta mc_start+1
    lda cf_shadow,y
    cmp #$2d                    // '-'
    beq cmc_save_dash
    jmp cmc_synerr
cmc_save_dash:
    iny
    jsr parse_hex16
    lda mc_hexval
    sta mc_end
    lda mc_hexval+1
    sta mc_end+1
cmc_save_sp:
    lda cf_shadow,y
    bne cmc_save_spchk           // no filename
    jmp cmc_synerr
cmc_save_spchk:
    cmp #$20
    bne cmc_save_fn
    iny
    bne cmc_save_sp
cmc_save_fn:
    jsr cmc_parse_dev           // A=device letter (override or w_dev); Y past any "#X:"
    sty mc_fnstart
    jsr resolve_devnum
    bcc cmc_save_devok
    jmp cmc_nosup
cmc_save_devok:
    sta mc_devnum
    ldy mc_fnstart
    jsr cmc_fnlen               // X=filename length
    stx mc_fnlen
    lda #$02                    // logical file 2
    ldx mc_devnum
    ldy #$01                    // SA=1: embed the load address in the file (standard convention)
    jsr SETLFS
    lda #<cf_shadow
    clc
    adc mc_fnstart
    tax
    lda #>cf_shadow
    adc #$00
    tay
    lda mc_fnlen
    jsr SETNAM
    lda TXTTAB
    sta mc_savetxt
    lda TXTTAB+1
    sta mc_savetxt+1
    lda mc_start
    sta TXTTAB
    lda mc_start+1
    sta TXTTAB+1
    lda mc_end                  // SAVE wants X/Y = address of the byte AFTER
    clc                         // the last byte to save (end is inclusive)
    adc #$01
    tax
    lda mc_end+1
    adc #$00
    tay
    lda #$2b
    jsr SAVE
    php
    lda mc_savetxt
    sta TXTTAB
    lda mc_savetxt+1
    sta TXTTAB+1
    plp
    bcc cmc_save_ok
    jmp cmc_err
cmc_save_ok:
    lda #msg_ok - msg_blob
    jmp print_msg

// --- LOAD form: filename $start ---
cmc_load:
    ldy w_arg
    jsr cmc_parse_dev
    sty mc_fnstart
    jsr resolve_devnum
    bcc cmc_load_devok
    jmp cmc_nosup
cmc_load_devok:
    sta mc_devnum
    ldy mc_fnstart
    jsr cmc_fnlen                // X=filename length; Y left at the terminator
    stx mc_fnlen
cmc_load_sp:
    lda cf_shadow,y
    bne cmc_load_spchk           // no address given
    jmp cmc_synerr
cmc_load_spchk:
    cmp #$20
    bne cmc_load_dollar
    iny
    bne cmc_load_sp
cmc_load_dollar:
    cmp #$24                     // '$'
    beq cmc_load_isdollar
    jmp cmc_synerr
cmc_load_isdollar:
    iny
    jsr parse_hex16
    lda #$02                     // logical file 2
    ldx mc_devnum
    ldy #$00                     // SA=0: ignore any embedded load address, use X/Y (relocatable)
    jsr SETLFS
    lda #<cf_shadow
    clc
    adc mc_fnstart
    tax
    lda #>cf_shadow
    adc #$00
    tay
    lda mc_fnlen
    jsr SETNAM
    lda #$00                     // 0 = LOAD (not verify)
    ldx mc_hexval
    ldy mc_hexval+1
    jsr LOAD
    bcc cmc_load_ok
    jmp cmc_err
cmc_load_ok:
    lda #msg_ok - msg_blob
    jmp print_msg

cmc_nosup:
    lda #msg_nosup - msg_blob
    jmp print_msg
cmc_synerr:
cmc_err:
    lda #msg_err - msg_blob
    jmp print_msg

// cmc_parse_dev -- Y = cf_shadow offset of a filename token (leading spaces
// already skipped). If it starts "#X:" (X = a device letter), returns A=X
// and advances Y past the 3-char prefix; otherwise returns A=w_dev and Y
// unchanged. Never touches w_dev itself -- this is a one-command override.
cmc_parse_dev:
    lda cf_shadow,y
    cmp #$23                     // '#'
    bne cmc_pd_default
    lda cf_shadow+2,y            // char after the letter must be ':'
    cmp #$3a
    bne cmc_pd_default
    lda cf_shadow+1,y
    pha
    tya
    clc
    adc #$03
    tay
    pla
    rts
cmc_pd_default:
    lda w_dev
    rts

// cmc_fnlen -- Y = start offset; returns X = length up to the next space or
// null. Y ends up on that terminator (space or null), which the LOAD-form
// caller relies on to continue parsing the address token right after.
cmc_fnlen:
    ldx #$00
cmc_fl_loop:
    lda cf_shadow,y
    beq cmc_fl_done
    cmp #$20
    beq cmc_fl_done
    iny
    inx
    bne cmc_fl_loop
cmc_fl_done:
    rts

// resolve_devnum -- A=device letter in; on return, carry clear and A=KERNAL
// device number (H/T/F/8->8, 9->9, S->10), or carry set (unsupported: C/N/
// anything else -- no local-memory bridge for those).
resolve_devnum:
    cmp #$48                     // 'H'
    beq rdn_8
    cmp #$54                     // 'T'
    beq rdn_8
    cmp #$46                     // 'F'
    beq rdn_8
    cmp #$38                     // '8'
    beq rdn_8
    cmp #$39                     // '9'
    beq rdn_9
    cmp #$53                     // 'S'
    beq rdn_10
    sec
    rts
rdn_8:
    lda #$08
    clc
    rts
rdn_9:
    lda #$09
    clc
    rts
rdn_10:
    lda #$0a
    clc
    rts

// parse_hex16 -- Y = index of the first hex digit in cf_shadow. Parses as
// many hex digits (0-9, A-F, uppercase only) as are present into mc_hexval
// (16-bit, big-endian typing order), leaving Y on the first non-hex-digit
// character (the caller's terminator check).
parse_hex16:
    lda #$00
    sta mc_hexval
    sta mc_hexval+1
ph_loop:
    lda cf_shadow,y
    jsr hex_digit_val
    bcs ph_done
    pha
    asl mc_hexval
    rol mc_hexval+1
    asl mc_hexval
    rol mc_hexval+1
    asl mc_hexval
    rol mc_hexval+1
    asl mc_hexval
    rol mc_hexval+1
    pla
    ora mc_hexval
    sta mc_hexval
    iny
    bne ph_loop
ph_done:
    rts

// hex_digit_val -- A = char in; returns A=0-15/carry clear if 0-9 or A-F,
// or carry set (not a hex digit, A unchanged in meaning -- caller only acts
// on carry).
hex_digit_val:
    cmp #$30
    bcc hdv_bad
    cmp #$3a
    bcc hdv_digit
    cmp #$41
    bcc hdv_bad
    cmp #$47
    bcs hdv_bad
    sec
    sbc #$37
    clc
    rts
hdv_digit:
    sec
    sbc #$30
    clc
    rts
hdv_bad:
    sec
    rts

// help -- if the cloud is reachable, forward the whole typed line (bare
// "help", "help topics", or "help <question>") to the chatbot exactly like
// an unrecognized command, so the server can answer contextually (see
// docs/user_manual/user_manual.md's "Getting Help" section: help behaves
// differently connected vs. not). If unreachable, wd_chat's own fallback
// (net_fail) is completely silent, which would leave "help" looking like it
// did nothing -- print a local, static pointer instead.
cmd_help:
    jsr net_connect
    bcs chp_local
    jsr net_close
    jmp wd_chat
chp_local:
    lda #msg_help - msg_blob
    jmp print_msg

// ---------------------------------------------------------------------------
// wc_match -- does the pattern typed as this command's argument (w_arg,
// offset into cf_shadow; may be empty) occur as a substring of the
// null-terminated line buffered at wc_buf? A trailing '*' in the pattern
// matches any remainder, giving the "outrun*" prefix convention; a pattern
// with no '*' still matches anywhere in the line rather than requiring an
// exact whole-line match, since we don't know the exact column layout of
// every listing source (KERNAL block-count-prefixed names vs. Ultimate DOS
// entries) -- substring search works either way without needing to know it.
// Output: carry clear = match (including an empty pattern -- no filter
// means show everything), carry set = no match anywhere in the line.
// ---------------------------------------------------------------------------
wc_match:
    ldy w_arg
    lda cf_shadow,y
    bne wcm_haspat
    clc                        // empty pattern: always matches
    rts
wcm_haspat:
    lda #$00
    sta w_hstart
wcm_outer:
    ldx w_hstart
    lda wc_buf,x
    beq wcm_nomatch            // haystack exhausted: no match found anywhere
    stx w_hidx
    ldy w_arg
wcm_inner:
    lda cf_shadow,y
    cmp #$2a                   // '*' in pattern: matches regardless of the rest
    beq wcm_yes
    ldx w_hidx
    cmp wc_buf,x
    beq wcm_advance
    inc w_hstart                // mismatch: retry starting one byte further in
    jmp wcm_outer
wcm_advance:
    iny
    inc w_hidx
    ldx w_hidx
    lda wc_buf,x
    beq wcm_hend                // haystack ends exactly here
    jmp wcm_inner
wcm_hend:
    lda cf_shadow,y
    beq wcm_yes                 // pattern also ends here: exact match
    cmp #$2a
    beq wcm_yes                 // pattern's only left is '*': still a match
    inc w_hstart
    jmp wcm_outer
wcm_yes:
    clc
    rts
wcm_nomatch:
    sec
    rts

// ---------------------------------------------------------------------------
// Directory listing over the Ultimate DOS (devices H/T/F): OPEN_DIR, then
// READ_DIR and print entry chunks until the data queue stays empty --
// same accept-loop shape as the old src/cmd_lsll.asm. Each chunk is now
// buffered into wc_buf and matched against w_arg (see wc_match) before
// printing, so "ll outrun*" only shows matching entries.
// ---------------------------------------------------------------------------
wd_uii_dir:
    lda #DOS_CMD_OPEN_DIR
    jsr dos_simple_quiet
    lda #DOS_CMD_READ_DIR
    ldx #TARGET_DOS1
    jsr dos_begin
    jsr net_push_and_check
    bcc wud_pushok
    jmp dos_fail
wud_pushok:
    jsr net_wait_not_busy
    jsr dos_print_data_filtered  // first entry chunk
    jsr dos_status_report
    jsr net_accept
wud_more:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq wud_done
    jsr dos_print_data_filtered
    jsr net_accept
    jmp wud_more
wud_done:
    rts

// Buffer one response chunk into wc_buf (bounded to wc_buf_max, draining any
// overflow unread so the queue stays in sync), then print it + CR only if it
// matches w_arg's pattern (wc_match) -- otherwise the chunk is discarded
// silently. Y is the fill count.
dos_print_data_filtered:
    ldy #$00
dpdf_loop:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq dpdf_term
    lda UII_RESP
    cpy #wc_buf_max
    bcs dpdf_loop              // buffer full: keep draining, stop storing
    sta wc_buf,y
    iny
    jmp dpdf_loop
dpdf_term:
    cpy #wc_buf_max
    bcc dpdf_null
    ldy #wc_buf_max - 1
dpdf_null:
    lda #$00
    sta wc_buf,y
    jsr wc_match
    bcs dpdf_done              // no match: print nothing for this chunk
    ldx #$00
dpdf_print:
    lda wc_buf,x
    beq dpdf_cr
    jsr CHROUT
    inx
    jmp dpdf_print
dpdf_cr:
    jmp print_cr
dpdf_done:
    rts

// ---------------------------------------------------------------------------
// Directory listing via the KERNAL (devices 8/9/S): open "$" and decode the
// BASIC-program-shaped listing (link word, block count, name chars).
// Input: A = device char ('8'/'9'/'S').
// ---------------------------------------------------------------------------
kernal_dir:
    ldx #$08
    cmp #$39
    bne kd_not9
    ldx #$09
kd_not9:
    cmp #$53
    bne kd_notS
    ldx #$0a
kd_notS:
    stx w_len                  // device number
    lda #$01
    ldx #<kd_dollar
    ldy #>kd_dollar
    jsr SETNAM
    lda #$02                   // logical file 2
    ldx w_len
    ldy #$00                   // SA 0: "$" arrives as a BASIC program image
    jsr SETLFS
    jsr OPEN
    bcs kd_err
    ldx #$02
    jsr CHKIN
    bcs kd_err
    jsr CHRIN                  // skip the 2-byte load address
    jsr CHRIN
kd_line:
    jsr CHRIN                  // line link lo
    sta w_len
    jsr CHRIN                  // line link hi
    ora w_len
    beq kd_done                // null link: end of listing
    jsr READST
    bne kd_done
    jsr CHRIN                  // block count lo
    sta w_dig1                 // stashed until the filter decision is made
    jsr CHRIN                  // block count hi
    sta w_dig2
    ldy #$00                   // Y = wc_buf fill count for this entry's name
kd_chars:
    jsr CHRIN
    beq kd_nameend
    pha
    jsr READST
    bne kd_done_pla
    pla
    cpy #wc_buf_max
    bcs kd_chars               // buffer full: keep reading/discarding the rest
    sta wc_buf,y
    iny
    jmp kd_chars
kd_nameend:
    lda #$00
    sta wc_buf,y
    jsr wc_match
    bcs kd_eol                 // no match: skip printing this entry entirely
    ldx w_dig1
    lda w_dig2
    jsr LINPRT                 // print A:X as decimal
    lda #$20
    jsr CHROUT
    ldx #$00
kd_print:
    lda wc_buf,x
    beq kd_pdone
    jsr CHROUT
    inx
    jmp kd_print
kd_pdone:
    jsr print_cr
kd_eol:
    jmp kd_line
kd_done_pla:
    pla
kd_done:
    lda #$02
    jsr CLOSE
    jsr CLRCHN
    rts
kd_err:
    lda #$02
    jsr CLOSE
    jsr CLRCHN
    lda #msg_err - msg_blob
    jmp print_msg
kd_dollar:
    .byte $24                  // "$"

// ===========================================================================
// Cloud paths: chatbot fallback and raw-CLI forwarding
// ===========================================================================

// Unrecognized line -> "I:" + line to the ChatHandler; print the reply.
wd_chat:
    jsr net_connect
    bcs net_fail
    lda #$02                   // CommandID.TEXT_INPUT | console 0
    jsr nw_start
    lda #$49                   // 'I'
    sta UII_CMD
    lda #$3a                   // ':'
    sta UII_CMD
    jsr nw_send_shadow
    jsr nw_finish
    bcs net_fail
    lda #$00
    sta w_quiet
    jsr net_read_response
    bcs net_fail
    jsr net_close
    rts
net_fail:
    rts

// Raw line to the server's request dispatcher (server-side module routing:
// "#c" activates CSDB, "dir"/"ll"/free text go to the active module).
send_cli:
    jsr net_connect
    bcs net_fail
    lda #$02                   // CommandID.TEXT_INPUT | console 0
    jsr nw_start
    jsr nw_send_shadow
    jsr nw_finish
    bcs net_fail
    lda #$00
    sta w_quiet
    jsr net_read_response
    jsr net_close
    jmp print_cr

// ===========================================================================
// Console switching (C=+CTRL + 1..7)
// ===========================================================================
// console_switch runs in IRQ context (I flag set), reached from the CINV RAM
// stub with X = digit index 0..6 (C=+CTRL+1 .. C=+CTRL+7 -- plain C=+digit
// was the first cut, but on hardware that combo also fires the KERNAL's own
// colour-select decode, so a qualifier was needed; C=+SHIFT was tried next but
// that combo turned out to flip the character set (hardware-confirmed
// 2026-07-04), so CTRL is used instead -- CTRL has decode priority in the
// KERNAL's own table and carries no such side effect). C=+CTRL+1
// returns to the local shell; 2..7 select the server-side consoles. While a
// server console is
// active this loops modally: it scans the keyboard itself (SCNKEY/GETIN,
// interrupts stay off) and forwards every key to the server, which paints
// the 40x25 screen straight into $0400/$d800 via the Ultimate DMA service.
// The local screen is saved/restored by the *server* too (SAVE_SCREEN/
// RESTORE_SCREEN commands DMA-read/-write it), so no C64 RAM buffer at all.
console_switch:
    cpx #$00
    bne cs_to_server
    lda w_console              // C=+CTRL+1: back to local
    bne cs_go_local
cs_ret:
    rts                        // already local -- nothing to do
cs_go_local:
    lda #$00
    sta w_console
    jsr cs_wait_release
    jmp scr_restore            // restore screen; rts unwinds to the IRQ chain
cs_to_server:
    txa                        // target console id nibble = (digit index + 1) << 4
    clc
    adc #$01
    asl
    asl
    asl
    asl
    sta w_new
    cmp w_console
    beq cs_ret                 // already on that console
    lda w_console
    bne cs_already_remote
    jsr scr_save               // leaving the local screen: server snapshots it
    bcs cs_ret                 // server unreachable: stay local, ignore the key
cs_already_remote:
    lda w_new
    sta w_console
    jsr cs_wait_release
    jsr scr_get
cs_modal:
    jsr SCNKEY                 // interrupts are off: scan the keyboard ourselves
    lda SHFLAG
    and #$06                   // C=+CTRL both held? (plain C=+digit changes colour, C=+SHIFT flips charset)
    cmp #$06
    bne cs_nodigit
    lda SFDX
    ldx #$06
cs_dchk:
    cmp cs_digit_tbl,x
    beq cs_dmatch
    dex
    bpl cs_dchk
    bmi cs_nodigit
cs_dmatch:
    cpx #$00
    bne cs_dserver
    lda #$00                   // C=+CTRL+1: leave modal mode, back to BASIC
    sta w_console
    jsr cs_wait_release
    jmp scr_restore
cs_dserver:
    txa                        // hop directly to another server console
    clc
    adc #$01
    asl
    asl
    asl
    asl
    cmp w_console
    beq cs_modal               // same console: ignore
    sta w_console
    jsr cs_wait_release
    jsr scr_get
    jmp cs_modal
cs_nodigit:
    jsr GETIN
    cmp #$00
    beq cs_held_check           // nothing new translated -- is a key still physically down?
    cmp #$81                   // safety net: swallow stray colour codes if any leak through
    beq cs_modal
    cmp #$95
    bcc cs_fresh
    cmp #$9b
    bcc cs_modal
cs_fresh:
    // A translated character arrived from GETIN: always a confirmed, fresh
    // physical keypress (SCNKEY's own matrix debounce already guarantees
    // that part is reliable -- only its *autorepeat timing* isn't, see
    // below). Remember which matrix code this was and reset our own repeat
    // stage, then send immediately.
    pha
    ldy SFDX
    sty last_matrix
    lda #$00
    sta w_key_stage
    pla
    jmp cs_send
cs_held_check:
    // No new translated char this scan. Rather than wait for SCNKEY to
    // decide (on its own schedule) that it's time to inject another repeat
    // character -- SCNKEY's repeat countdown assumes it's called at a
    // steady 60Hz via the normal IRQ, but cs_modal calls it at whatever
    // irregular rate this loop runs (fast when idle, paused for whole
    // frames during our own waits below), so that countdown reaches zero
    // and stays "ready to fire" almost immediately regardless of how long
    // we actually wait -- we read the raw matrix code ourselves and decide
    // when to resend it, using real raster/vsync time (see wait_frames),
    // completely independent of SCNKEY's internal timing.
    lda SFDX
    cmp #$40                   // 64 = no key down
    beq cs_modal
    cmp last_matrix
    bne cs_modal                // a different key is mid-debounce; wait for GETIN to produce it via cs_fresh
    ldx w_key_stage
    bne cs_held_fast
    ldx #INITIAL_REPEAT_DELAY_FRAMES
    jsr wait_frames
    inc w_key_stage             // first repeat done -- fast pacing from now on
    jmp cs_held_recheck
cs_held_fast:
    ldx #FAST_REPEAT_DELAY_FRAMES
    jsr wait_frames
cs_held_recheck:
    // Re-confirm the SAME key is still physically down *after* the wait,
    // before actually resending -- a plain single tap will very often still
    // read as "held" on the scan immediately following the initial press
    // (release+debounce takes real time), which is why simply checking once
    // before the wait caused a single tap to sometimes send a phantom
    // second move once the wait finished, regardless of whether the user
    // had already released the key. If it's been released (or a different
    // key is now down), just drop back into the loop with nothing sent.
    lda SFDX
    cmp #$40
    beq cs_release
    cmp last_matrix
    bne cs_release
    lda w_len                   // resend the already-translated code from the last send
cs_send:
    jsr key_send
    // Flush the type-ahead buffer: we don't use anything SCNKEY queued on
    // its own (see above), so drop it and let the next SCNKEY scan start
    // clean.
    lda #$00
    sta NDX
    jmp cs_modal
cs_release:
    jmp cs_modal

// wait until no key is held, then flush the type-ahead buffer (drops the
// stray colour code, if any, the combo itself produced)
cs_wait_release:
    jsr SCNKEY
    lda SFDX
    cmp #$40                   // 64 = no key down
    bne cs_wait_release
    lda #$00
    sta NDX
    rts

cs_digit_tbl:
    .byte 56, 59, 8, 11, 16, 19, 24    // matrix codes for keys 1-7

// --- server screen commands (console 0 = local shell) --------------------
// scr_save/scr_restore block on the server's ack (the DMA transfer has
// finished by then), so save -> repaint -> restore can't race even though
// every packet rides its own TCP connection.
scr_save:
    lda #$02                   // SERVER_CMD_SAVE_SCREEN
    bne scr_cmd0               // (always)
scr_restore:
    lda #$03                   // SERVER_CMD_RESTORE_SCREEN
scr_cmd0:
    sta w_len
    jsr net_connect
    bcs scr_fail
    lda #$00                   // CommandID.COMMAND | console 0
    jsr nw_start
    lda w_len
    sta UII_CMD
    lda #$00
    sta UII_CMD
    jsr nw_finish
    bcs scr_fail_close
    lda #$01
    sta w_quiet                // wait for the ack, discard its text
    jsr net_read_response
    lda #$00
    sta w_quiet
    jsr net_close
    clc
    rts
scr_fail_close:
    jsr net_close
scr_fail:
    sec
    rts

// ask the server to DMA-paint w_console's full screen (no TCP response)
scr_get:
    jsr net_connect
    bcs scr_get_done
    lda w_console              // CommandID.COMMAND | console nibble
    jsr nw_start
    lda #$01                   // SERVER_CMD_GET_SCREEN
    sta UII_CMD
    lda #$00
    sta UII_CMD
    jsr nw_finish
    jsr net_close
scr_get_done:
    rts

// forward one key (A = PETSCII) + live modifier bits to w_console; the
// server repaints the screen via DMA in response
key_send:
    sta w_len
    jsr net_connect
    bcs key_send_done
    lda w_console
    ora #$01                   // CommandID.KEYPRESS
    jsr nw_start
    lda w_len
    sta UII_CMD
    lda SHFLAG                 // raw modifier bits, same wire format as hdnsh
    sta UII_CMD
    lda #$00
    sta UII_CMD
    jsr nw_finish
    jsr net_close
key_send_done:
    rts

// Wait X vertical blanks (X preloaded by the caller). Used only to pace
// repeats of a held key in cs_fwd (see there for why); clobbers A/X.
wait_frames:
    jsr wait_vbl
    dex
    bne wait_frames
    rts

// Wait for one full frame boundary (raster line 0), regardless of the
// raster position at entry. The VIC raster counter free-runs off the
// video/colour clock independent of the 6510, so this delay is accurate
// real time whether the CPU is running stock or overclocked. Clobbers A.
wait_vbl:
!leave0:
    jsr wv_is_line0
    beq !leave0-                // if currently on line 0, wait to leave it
!reach0:
    jsr wv_is_line0
    bne !reach0-                // wait to reach line 0 (top of next frame)
    rts

// Sets Z if the raster is exactly at line 0 -- a full 9-bit compare
// ($d011 bit 7 is the raster line's MSB, $d012 the low 8 bits). Checking
// $d012==0 alone (as this used to) aliases with line 256 (PAL) / line
// ~256-261 (NTSC), which also read $d012==0 -- so the old check fired
// early about half the time, turning the "wait one frame" delay into
// anywhere from ~1 to ~255 lines depending on raster phase at entry. That
// was the cause of repeat pacing feeling inconsistent (sometimes fast,
// sometimes slow) even over a fast local network -- the timing primitive
// itself was unreliable. Clobbers A.
wv_is_line0:
    lda $d011
    and #$80
    bne wv_not_line0
    lda $d012
    rts
wv_not_line0:
    lda #$01                    // force non-zero -> Z clear
    rts

// ===========================================================================
// wedge_install -- called (via bank01's xb2 RAM trampoline, under SEI) on
// every non-empty typed line. Round 6: this is now the arm/disarm decision
// point. It first sniffs the raw input buffer ($0200): a line that hands the
// machine over to a program (RUN/SYS, or the cart's own MONITOR/TASS/BOOT
// entries) must run on a bit-for-bit stock machine, so the hooks are
// *removed* instead of installed and w_skip tells bank01 to skip the shadow
// copy too. Every other line (re)arms: the CINV stub, the ILOAD shim and the
// stub bytes are refreshed from ROM templates unconditionally, so any
// corruption (monitor session, freeze/resume, a program that scribbled the
// datassette buffer) heals on the next typed line.
// ===========================================================================
wedge_install:
    jsr wi_sniff
    bcc wi_arm
    jsr disarm_hooks           // launch line: hand over a stock machine
    lda #$01
    sta w_skip
    rts
wi_arm:
    lda #$00
    sta w_skip
    ldx #cinv_stub_rom_end - cinv_stub_rom - 1
wi_copy:
    lda cinv_stub_rom,x        // refresh the stub bytes every line
    sta cinv_ram,x
    dex
    bpl wi_copy
    ldx #il_shim_rom_end - il_shim_rom - 1
wi_scopy:
    lda il_shim_rom,x          // refresh the ILOAD shim bytes every line
    sta il_shim_ram,x
    dex
    bpl wi_scopy
    lda w_magic                // one-time state defaults, keyed on a magic
    cmp #$a5                   // pair so they survive disarm/rearm cycles
    bne wi_defaults            // (w_dev must not reset to 'H' after every RUN)
    lda w_magic+1
    cmp #$c3
    beq wi_vec
wi_defaults:
    lda #$00
    sta w_console
    sta w_latch
    sta w_quiet
    lda #$48                   // 'H': default device is the Ultimate home dir
    sta w_dev
    lda #$a5
    sta w_magic
    lda #$c3
    sta w_magic+1
wi_vec:
    lda $0314                  // hook CINV (save the original for chaining,
    cmp #<cinv_ram             // but never save ourselves)
    bne wi_cinstall
    lda $0315
    cmp #>cinv_ram
    beq wi_iload
wi_cinstall:
    lda $0314
    sta w_cinv_orig
    lda $0315
    sta w_cinv_orig+1
    lda #<cinv_ram
    sta $0314
    lda #>cinv_ram
    sta $0315
wi_iload:
    lda $0330                  // hook ILOAD with the disarm shim (same
    cmp #<il_shim_ram          // never-save-ourselves rule)
    bne wi_linstall
    lda $0331
    cmp #>il_shim_ram
    beq wi_done
wi_linstall:
    lda $0330
    sta il_orig
    lda $0331
    sta il_orig+1
    lda #<il_shim_ram
    sta $0330
    lda #>il_shim_ram
    sta $0331
wi_done:
    rts

// ---------------------------------------------------------------------------
// wi_sniff -- classify the just-typed line (raw text in the $0200 input
// buffer). Returns carry SET if it hands control to a program and the hooks
// must come off first. Two match classes:
//   - word:   RUN, SYS -- full word, or BASIC's crunch-rule abbreviation (a
//             SHIFTed char completes the keyword: rU, sY, rUN); after a full
//             word the next char must not be a letter, so chat lines like
//             "running late?" still reach the cloud fallback.
//   - prefix: MON, TAS, BOO -- mirrors the cart scanner's own 3-chars-then-
//             swallow-letters quirk (MONITOR, TASS/TASM, BOOT), since those
//             take over the machine the same way a launched program does.
// ---------------------------------------------------------------------------
.const WSF_WORD   = $01
.const WSF_PREFIX = $02
wi_sniff:
    ldy #$00
ws_sp:
    lda $0200,y                // skip leading spaces
    cmp #$20
    bne ws_start
    iny
    bne ws_sp
ws_start:
    sty w_len                  // w_len = offset of the first real char
    ldx #$00                   // x walks ws_tab
ws_word:
    ldy w_len
ws_char:
    lda ws_tab,x
    bmi ws_last                // bit7 set: final char of the table word
    cmp $0200,y
    beq ws_adv
    ora #$80                   // typed SHIFTed char = crunch-rule completion
    cmp $0200,y
    beq ws_hit
    bne ws_next
ws_adv:
    inx
    iny
    jmp ws_char
ws_last:
    and #$7f
    cmp $0200,y
    beq ws_bound
    ora #$80                   // SHIFTed final char also completes the word
    cmp $0200,y
    bne ws_next
ws_hit:
    sec
    rts
ws_bound:
    inx                        // final char matched: X -> the class flag
    lda ws_tab,x
    and #WSF_PREFIX
    bne ws_hit                 // prefix class: 3 chars are enough (cart rule)
    iny                        // word class: next char must not be a letter
    lda $0200,y
    cmp #$41
    bcc ws_hit
    cmp #$5b
    bcs ws_hit
    bcc ws_flagnext            // a letter follows ("running..."): no match
ws_next:                       // mismatch mid-word: X is on or before the
    lda ws_tab,x               // end marker -- scan forward past it
    inx
    bpl ws_next
ws_flagnext:                   // X -> the class-flag byte of the failed word
    inx
    lda ws_tab,x
    bne ws_word
    clc                        // table exhausted: ordinary line
    rts
ws_tab:
    .byte $52,$55,$4e+$80, WSF_WORD      // RUN
    .byte $53,$59,$53+$80, WSF_WORD      // SYS
    .byte $4d,$4f,$4e+$80, WSF_PREFIX    // MON(ITOR)
    .byte $54,$41,$53+$80, WSF_PREFIX    // TAS(S/M)
    .byte $42,$4f,$4f+$80, WSF_PREFIX    // BOO(T)
    .byte $00

// ---------------------------------------------------------------------------
// disarm_hooks -- restore every vector we own to its saved original, but
// only if it still points at us (never clobber someone else's hook). Runs
// under SEI (xb2 guarantees it). Also the shared teardown for the ILOAD
// shim's job, except the shim does it from RAM with constants baked in.
// ---------------------------------------------------------------------------
disarm_hooks:
    lda $0315
    cmp #>cinv_ram
    bne dh_ierr
    lda $0314
    cmp #<cinv_ram
    bne dh_ierr
    lda w_cinv_orig
    sta $0314
    lda w_cinv_orig+1
    sta $0315
dh_ierr:
    lda $0301
    cmp #>ie_ram
    bne dh_iload
    lda $0300
    cmp #<ie_ram
    bne dh_iload
    lda ie_orig_vec
    sta $0300
    lda ie_orig_vec+1
    sta $0301
dh_iload:
    lda $0331
    cmp #>il_shim_ram
    bne dh_done
    lda $0330
    cmp #<il_shim_ram
    bne dh_done
    lda il_orig
    sta $0330
    lda il_orig+1
    sta $0331
dh_done:
    rts

// ---------------------------------------------------------------------------
// ILOAD shim -- relocated to il_shim_ram and left resident while armed.
// KERNAL LOAD ($f49e) enters via jmp ($0330) with A/X/Y live, so both are
// preserved. The moment *any* load starts -- BASIC LOAD, the cart's own
// / % ^ fastload commands (they call $ffd5 too), a chain loader, memcpy --
// it restores CINV, IERROR and ILOAD itself to the saved originals and
// chains to the real loader. Whatever gets loaded therefore always runs on
// a stock machine; the next typed line re-arms everything. No branches, so
// it's freely relocatable.
// ---------------------------------------------------------------------------
il_shim_rom:
    php
    sei
    pha
    lda w_cinv_orig
    sta $0314
    lda w_cinv_orig+1
    sta $0315
    lda ie_orig_vec
    sta $0300
    lda ie_orig_vec+1
    sta $0301
    lda il_orig
    sta $0330
    lda il_orig+1
    sta $0331
    pla
    plp
    jmp ($0330)                // chain to the real (restored) loader
il_shim_rom_end:
// Layout guards -- the resident block must fit its slots exactly; a template
// growing past its slot corrupts the next one at runtime, silently.
.errorif il_shim_ram + (il_shim_rom_end - il_shim_rom) > cinv_ram, "il_shim overruns cinv_ram"
.errorif cinv_ram + (cinv_stub_rom_end - cinv_stub_rom) > ie_orig_vec, "cinv stub overruns the state block"

// ---------------------------------------------------------------------------
// CINV keyboard-watch stub -- relocated to cinv_ram ($03a0) and left
// resident. Runs on every IRQ, from RAM, because the IRQ can fire while any
// cartridge bank is paged in. Checks for C= + 1..7 (matrix code in SFDX,
// C= bit in SHFLAG); on a fresh match it saves the current bank via the RR
// status register's banking-feedback bits, pages in bank05, and calls
// console_switch with X = digit index. w_latch makes it one-shot per press.
// ---------------------------------------------------------------------------
cinv_stub_rom:
.pseudopc cinv_ram {
    lda SHFLAG
    and #$06                   // C=+CTRL both held? (plain C=+digit changes colour, C=+SHIFT flips charset)
    cmp #$06
    bne cvr_clear
    lda SFDX
    ldx #$06
cvr_chk:
    cmp cs_ram_digits,x
    beq cvr_match
    dex
    bpl cvr_chk
cvr_clear:
    lda #$00
    sta w_latch
cvr_chain:
    jmp (w_cinv_orig)
cvr_match:
    lda w_latch
    bne cvr_chain              // still held from the last switch: ignore
    lda #$01
    sta w_latch
    lda $de00                  // RR status read: bits 3/4/7 = bank feedback
    and #$98
    sta w_bank
    lda #$88                   // page in bank05
    sta $de00
    jsr console_switch         // X = digit index 0..6
    lda w_bank                 // restore whatever bank was live before
    sta $de00
    jmp (w_cinv_orig)
cs_ram_digits:
    .byte 56, 59, 8, 11, 16, 19, 24    // matrix codes for keys 1-7
}
cinv_stub_rom_end:

// ===========================================================================
// Ultimate DOS helpers (command interface, TARGET_DOS1/CONTROL)
// ===========================================================================

// A = DOS command id, no payload; print the response data
dos_simple_print:
    ldx #TARGET_DOS1
    jsr dos_begin
    jmp dos_finish_print

// A = DOS command id, no payload; discard the response data
dos_simple_quiet:
    ldx #TARGET_DOS1
    jsr dos_begin
    jmp dos_finish_quiet

// X = target, A = command id; leaves the UCI ready for payload bytes
dos_begin:
    pha
    jsr net_wait_idle
    txa
    sta UII_CMD
    pla
    sta UII_CMD
    rts

dos_finish_print:              // push; print response data; report status
    jsr net_push_and_check
    bcs dos_fail
    jsr net_wait_not_busy
    jsr dos_print_data
    jmp dos_status_finish
dos_finish_quiet:              // push; discard response data; report status
    jsr net_push_and_check
    bcs dos_fail
    jsr net_wait_not_busy
    jsr net_drain_data
dos_status_finish:
    jsr dos_status_report
    jmp net_accept
dos_fail:
    lda #msg_err - msg_blob    // the UCI rejected the command outright
    jmp print_msg

// print the whole response-data queue via CHROUT
dos_print_data:
dpd_loop:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq dpd_done
    lda UII_RESP
    jsr CHROUT
    jmp dpd_loop
dpd_done:
    rts

// Drain the status queue. Success ("00...") stays silent; anything else is
// printed as-is (e.g. "05,DIRECTORY NOT FOUND") plus CR. The first two chars
// land in cf_status0/1 so net_accept's carry convention keeps working.
dos_status_report:
    lda #$00
    sta cf_status0
    sta cf_status1
    lda UII_STATUS
    and #UII_ST_STATAV
    beq dsr_ok
    lda UII_STATDAT
    sta cf_status0
    lda UII_STATUS
    and #UII_ST_STATAV
    beq dsr_check
    lda UII_STATDAT
    sta cf_status1
dsr_check:
    lda cf_status0
    cmp #$30
    bne dsr_bad
    lda cf_status1
    cmp #$30
    bne dsr_bad
dsr_drain:                     // success: swallow the rest silently
    lda UII_STATUS
    and #UII_ST_STATAV
    beq dsr_ok
    lda UII_STATDAT
    jmp dsr_drain
dsr_ok:
    rts
dsr_bad:
    lda cf_status0
    jsr CHROUT
    lda cf_status1
    beq dsr_cr
    jsr CHROUT
dsr_rest:
    lda UII_STATUS
    and #UII_ST_STATAV
    beq dsr_cr
    lda UII_STATDAT
    jsr CHROUT
    jmp dsr_rest
dsr_cr:
    jmp print_cr

// Y = offset of a null-terminated path inside path_blob: DOS CHANGE_DIR
dos_chdir_blob:
    sty w_len
    lda #DOS_CMD_CHANGE_DIR
    ldx #TARGET_DOS1
    jsr dos_begin
    ldy w_len
dcb_loop:
    lda path_blob,y
    beq dcb_send
    sta UII_CMD
    iny
    bne dcb_loop
dcb_send:
    jmp dos_finish_quiet

// NETWORK GET_IP_ADDRESS. Response is 12 raw binary bytes, not text --
// [0-3]=IP, [4-7]=netmask, [8-11]=gateway, one byte per octet (confirmed
// against docs/inspiration/ultimatedos-samples/u-sample.c's uii_getipaddress()
// callers, which all index uii_data[0..11] the same way). Streaming those
// bytes through CHROUT as if they were text (the old behaviour) printed
// garbage control characters instead of an address -- hardware-confirmed
// 2026-07-04. Y tracks the octet position (0-11) so dots/labels land right;
// print_dec_byte does the actual decimal formatting.
net_print_ip:
    jsr net_wait_idle
    lda #TARGET_NETWORK
    sta UII_CMD
    lda #NET_CMD_GET_IP
    sta UII_CMD
    lda #$00
    sta UII_CMD
    jsr net_push_and_check
    bcs npi_done
    jsr net_wait_not_busy
    ldy #$00
npi_loop:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq npi_status
    lda UII_RESP
    jsr print_dec_byte
    cpy #$03
    beq npi_lbl_mask
    cpy #$07
    beq npi_lbl_gw
    cpy #$0b
    beq npi_next               // last byte (gateway's 4th octet): no trailing dot
    lda #$2e                   // '.'
    jsr CHROUT
    jmp npi_next
npi_lbl_mask:
    jsr print_cr
    lda #msg_netmask - msg_blob
    jsr print_msg
    jmp npi_next
npi_lbl_gw:
    jsr print_cr
    lda #msg_gateway - msg_blob
    jsr print_msg
npi_next:
    iny
    jmp npi_loop
npi_status:
    jsr net_read_status
    jsr net_accept
npi_done:
    rts

// A = 0..255; prints decimal digits via CHROUT, no leading zeros/spaces.
// Classic "subtract until borrow" 6502 byte-to-decimal conversion (X counts
// how many times 100/10 divide in); w_dig1/w_dig2 hold the hundreds/tens
// digit across the two passes, w_bank is reused as a transient "already
// printed a digit" flag so e.g. "105" doesn't come out as "15".
print_dec_byte:
    ldx #$ff
    sec
pdb_hloop:
    inx
    sbc #100
    bcs pdb_hloop
    adc #100
    stx w_dig1
    ldx #$ff
    sec
pdb_tloop:
    inx
    sbc #10
    bcs pdb_tloop
    adc #10
    stx w_dig2
    sta w_len                  // units digit, stashed while the others print
    lda #$00
    sta w_bank                 // "printed something yet" flag
    lda w_dig1
    beq pdb_no100
    clc
    adc #$30
    jsr CHROUT
    inc w_bank
pdb_no100:
    lda w_dig2
    bne pdb_have10
    lda w_bank
    beq pdb_no10
pdb_have10:
    lda w_dig2
    clc
    adc #$30
    jsr CHROUT
pdb_no10:
    lda w_len
    clc
    adc #$30
    jmp CHROUT

// ===========================================================================
// Cloud TCP helpers (network target; framing confirmed on hardware, see
// wedge-analysis.md §8)
// ===========================================================================

// Open a TCP connection to the cloud server.
// Output: carry clear on success (socket id in cf_socket_id), set on failure.
net_connect:
    jsr net_wait_idle
    lda #TARGET_NETWORK
    sta UII_CMD
    lda #NET_TCP_CONNECT
    sta UII_CMD
    lda #<6464
    sta UII_CMD
    lda #>6464
    sta UII_CMD
    ldx #$00
nc_ip:
    lda net_test_host,x
    sta UII_CMD
    inx
    cmp #$00
    bne nc_ip
    jsr net_push_and_check
    bcs nc_fail
    jsr net_wait_not_busy
    lda UII_RESP               // response data: socket id
    sta cf_socket_id
    jsr net_drain_data
    jsr net_read_status
    jmp net_accept             // carry clear iff status was "00"
nc_fail:
    sec
    rts

// A = packet command byte (CommandID | console nibble): start a SOCKET_WRITE
// and emit the $fe packet magic + command byte; caller streams the payload
// into UII_CMD, then calls nw_finish.
nw_start:
    pha
    jsr net_wait_idle
    lda #TARGET_NETWORK
    sta UII_CMD
    lda #NET_SOCKET_WRITE
    sta UII_CMD
    lda cf_socket_id
    sta UII_CMD
    lda #$fe                   // packet magic byte
    sta UII_CMD
    pla
    sta UII_CMD
    rts

// stream the raw typed line (cf_shadow) including its terminating null
nw_send_shadow:
    ldy #$00
nws_loop:
    lda cf_shadow,y
    sta UII_CMD
    iny
    cmp #$00
    bne nws_loop
    rts

// push the assembled SOCKET_WRITE and settle its response/status.
// Output: carry clear ok, set on failure.
nw_finish:
    jsr net_push_and_check
    bcs nwf_done
    jsr net_wait_not_busy
    jsr net_drain_data
    jsr net_read_status
    jmp net_accept
nwf_done:
    rts

// Poll SOCKET_READ until the length-prefixed response has fully arrived (or
// the ~8000-iteration budget runs out), streaming content through
// net_read_and_print (silent when w_quiet is set).
// Output: carry clear = finished/normal, carry set = a read push failed.
net_read_response:
    lda #$00
    sta cf_state               // fresh response: discard $ff filler first
    sta cf_spin_idx
    lda #<8000
    sta cf_retries_lo
    lda #>8000
    sta cf_retries_hi
nrr_loop:
    jsr net_wait_idle
    lda #TARGET_NETWORK
    sta UII_CMD
    lda #NET_SOCKET_READ
    sta UII_CMD
    lda cf_socket_id
    sta UII_CMD
    lda #$e8                   // read block length lo
    sta UII_CMD
    lda #$00                   // read block length hi
    sta UII_CMD
    jsr net_push_and_check
    bcs nrr_fail
    jsr net_wait_not_busy_spin // the wait where LLM latency actually shows up
    jsr net_read_and_print
    bcs nrr_had_data
    jsr net_spin               // nothing new yet: animate the wait
nrr_had_data:
    jsr net_read_status
    jsr net_accept
    bcc nrr_done               // status "00": socket fully drained
    lda cf_state
    cmp #$03
    beq nrr_done               // full content printed: stop early
    lda cf_retries_lo
    bne nrr_declo
    dec cf_retries_hi
nrr_declo:
    dec cf_retries_lo
    lda cf_retries_lo
    ora cf_retries_hi
    bne nrr_loop
nrr_done:
    clc
    rts
nrr_fail:
    sec
    rts

// close the socket in cf_socket_id
net_close:
    jsr net_wait_idle
    lda #TARGET_NETWORK
    sta UII_CMD
    lda #NET_SOCKET_CLOSE
    sta UII_CMD
    lda cf_socket_id
    sta UII_CMD
    jsr net_push_and_check
    bcs ncl_done
    jsr net_wait_not_busy
    jsr net_drain_data
    jsr net_read_status
    jsr net_accept
ncl_done:
    rts

// pushes the command just written to UII_CMD, then checks the ERROR status
// bit. Output: carry clear = ok, carry set = error (command rejected)
net_push_and_check:
    lda UII_CONTROL
    ora #UII_CTL_PUSH
    sta UII_CONTROL
    lda UII_STATUS
    and #UII_ST_ERROR
    beq npc_ok
    sec
    rts
npc_ok:
    clc
    rts

net_wait_idle:
    lda UII_STATUS
    and #UII_ST_STATE
    bne net_wait_idle
    rts

net_wait_not_busy:
    lda UII_STATUS
    and #UII_ST_STATE
    cmp #$10
    beq net_wait_not_busy
    rts

// Same as net_wait_not_busy, but advances the "still waiting" spinner every
// 256 poll iterations (Y is free here).
net_wait_not_busy_spin:
    ldy #$00
nwbs_loop:
    lda UII_STATUS
    and #UII_ST_STATE
    cmp #$10
    bne nwbs_done
    iny
    bne nwbs_loop
    jsr net_spin
    jmp nwbs_loop
nwbs_done:
    rts

// drains the response-data queue without printing
net_drain_data:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq ndd_done
    lda UII_RESP
    jmp net_drain_data
ndd_done:
    rts

// drains the status queue, keeping only the first two bytes (the "00"/error
// code convention from the original src/c64u_common.asm)
net_read_status:
    lda #$00
    sta cf_status0
    sta cf_status1
    ldx #$00
nrs_loop:
    lda UII_STATUS
    and #UII_ST_STATAV
    beq nrs_done
    lda UII_STATDAT
    cpx #$00
    bne nrs_not0
    sta cf_status0
    jmp nrs_next
nrs_not0:
    cpx #$01
    bne nrs_next
    sta cf_status1
nrs_next:
    inx
    jmp nrs_loop
nrs_done:
    rts

// Output: carry clear if the last read status was "00", set otherwise
net_accept:
    lda UII_CONTROL
    ora #UII_CTL_ACC
    sta UII_CONTROL
na_wait:
    lda UII_STATUS
    and #UII_CTL_ACC
    bne na_wait
    lda cf_status0
    cmp #$30
    bne na_fail
    lda cf_status1
    cmp #$30
    bne na_fail
    clc
    rts
na_fail:
    sec
    rts

// 2-frame blinking wait indicator, overwriting itself via cursor-left.
// Silent while w_quiet is set (screen save/restore acks must not draw).
net_spin:
    lda w_quiet
    beq ns_go
    rts
ns_go:
    ldx cf_spin_idx
    lda spin_chars,x
    jsr CHROUT
    lda #$9d                   // cursor left
    jsr CHROUT
    inx
    cpx #spin_chars_end - spin_chars
    bne ns_nowrap
    ldx #$00
ns_nowrap:
    stx cf_spin_idx
    rts
spin_chars:
    .byte $2e, $3a             // '.' ':'
spin_chars_end:

// Response framing (confirmed against a hardware hex dump, 2026-07-03):
//   [N x $ff idle/filler bytes] [len lo] [len hi] [exactly len content bytes]
// cf_state: 0 = discarding filler (first other byte = len lo), 1 = len hi,
//           2 = printing content (16-bit countdown), 3 = done, discard rest.
// Output: carry set if any byte was seen this call, clear if queue was empty.
net_read_and_print:
    lda #$00
    sta cf_got_data
nrp_loop:
    lda UII_STATUS
    and #UII_ST_DATAAV
    beq nrp_done
    inc cf_got_data
    lda UII_RESP
    ldx cf_state
    cpx #$03
    beq nrp_loop               // message finished: discard the rest
    cpx #$02
    beq nrp_content
    cpx #$01
    beq nrp_lenhi
    cmp #$ff                   // state 0: skip filler
    beq nrp_loop
    sta cf_msglen_lo
    ldx #$01
    stx cf_state
    jmp nrp_loop
nrp_lenhi:
    sta cf_msglen_hi
    ldx #$02
    stx cf_state
    jmp nrp_loop
nrp_content:
    ldx w_quiet
    bne nrp_count
    jsr CHROUT
nrp_count:
    lda cf_msglen_lo
    bne nrp_declo
    dec cf_msglen_hi
nrp_declo:
    dec cf_msglen_lo
    lda cf_msglen_lo
    ora cf_msglen_hi
    bne nrp_loop
    ldx #$03
    stx cf_state               // fully printed
    jmp nrp_loop
nrp_done:
    lda cf_got_data
    bne nrp_got
    clc
    rts
nrp_got:
    sec
    rts

// ===========================================================================
// Small print helpers + string data
// ===========================================================================
print_cr:
    lda #$0d
    jmp CHROUT

// A = offset of a null-terminated message inside msg_blob
print_msg:
    tax
pm_loop:
    lda msg_blob,x
    beq pm_done
    jsr CHROUT
    inx
    bne pm_loop
pm_done:
    rts

msg_blob:
msg_ip:
    .byte $49,$50,$20,$41,$44,$44,$52,$3a,$20,$00                  // "IP ADDR: "
msg_server:
    .byte $53,$45,$52,$56,$45,$52,$20,$00                          // "SERVER "
msg_ok:
    .byte $20,$4f,$4b,$0d,$00                                      // " OK" + CR
msg_unreach:
    .byte $20,$4e,$4f,$54,$20,$52,$45,$41,$43,$48,$41,$42,$4c,$45,$0d,$00  // " NOT REACHABLE" + CR
msg_err:
    .byte $3f,$45,$52,$52,$0d,$00                                  // "?ERR" + CR
msg_ready:
    .byte $52,$45,$41,$44,$59,$2e,$00                              // "READY."
msg_netmask:
    .byte $4e,$45,$54,$4d,$41,$53,$4b,$3a,$20,$00                  // "NETMASK: " (own line, see npi_lbl_mask)
msg_gateway:
    .byte $47,$41,$54,$45,$57,$41,$59,$3a,$20,$00                  // "GATEWAY: " (own line, see npi_lbl_gw)
msg_nosup:
    .byte $4e,$4f,$54,$20,$53,$55,$50,$50,$4f,$52,$54,$45,$44,$0d,$00  // "NOT SUPPORTED" + CR
msg_help:
    .byte $4e,$4f,$20,$43,$4c,$4f,$55,$44,$20,$43,$4f,$4e,$4e,$45,$43,$54,$49,$4f,$4e,$0d  // "NO CLOUD CONNECTION" + CR
    .byte $43,$48,$45,$43,$4b,$20,$4e,$45,$54,$57,$4f,$52,$4b,$2c,$20,$53,$54,$41,$54,$55,$53,$0d  // "CHECK NETWORK, STATUS" + CR
    .byte $53,$45,$45,$20,$55,$53,$45,$52,$20,$4d,$41,$4e,$55,$41,$4c,$0d,$00  // "SEE USER MANUAL" + CR

path_blob:
txt_temp:
    .byte $2f,$54,$45,$4d,$50,$00                                  // "/TEMP"
txt_flash:
    .byte $2f,$46,$4c,$41,$53,$48,$00                              // "/FLASH"

net_test_host:
    .byte $31,$39,$32,$2e,$31,$36,$38,$2e,$31,$2e,$32,$00          // "192.168.1.2" -- FIXME hardcoded, confirm it matches your cloud_server.py host

wedge_code_end:
    .fill $9012 - wedge_code_end, $00    // free space up to the jump table; a negative count here means the module outgrew $8023-$9011 -- the build fails loudly instead of shifting bytes

// ---------------------------------------------------------------------------
// Fixed entry points into this bank -- bank01's RAM stubs jsr to these
// absolute addresses, so this table must stay at $9012/$9015/$9018 forever.
// $9012 is the same entry the retired hondani_shell_entry lived at.
// ---------------------------------------------------------------------------
wedge_entry_tab:
    jmp wedge_dispatch         // $9012: typed-line fallback (from the IERROR stub)
    jmp wedge_install          // $9015: install/refresh the CINV hook (from xb2)
    jmp console_switch         // $9018: C=+CTRL+digit console switch (from the CINV stub, X=digit)
wedge_entry_tab_end:

    .fill $9200 - wedge_entry_tab_end, $00    // rest of the old $9012-$91ff pocket, free again

    .byte $a9, $00, $8d    // data $91f3 (unchanged original code resumes here)
    .byte $20, $d0, $8d, $21, $d0, $a9, $0f, $8d, $86, $02, $a2, $00, $9d, $00, $d8, $9d    // data $9203
    .byte $00, $d9, $9d, $00, $da, $9d, $00, $db, $e8, $d0, $f1, $bd, $00, $69, $9d, $00    // data $9213
    .byte $04, $bd, $00, $6a, $9d, $00, $05, $bd, $00, $6b, $9d, $00, $06, $bd, $00, $6c    // data $9223
    .byte $9d, $00, $07, $e8, $d0, $e5, $20, $e4, $ff, $c9, $20, $d0, $f9, $a2, $08, $a0    // data $9233
    .byte $01, $20, $ba, $ff, $a9, $10, $a2, $c0, $a0, $68, $20, $bd, $ff, $a9, $01, $85    // data $9243
    .byte $fb, $a9, $08, $85, $fc, $a9, $fb, $a2, $00, $a0, $2c, $20, $d8, $ff, $a2, $00    // data $9253
    .byte $4c, $9a, $68, $9d, $01, $08, $e8, $d0, $f7, $ee, $65, $68, $ee, $68, $68, $ad    // data $9263
    .byte $65, $68, $c9, $68, $d0, $ea, $a2, $08, $a0, $01, $20, $ba, $ff, $a9, $10, $a2    // data $9273
    .byte $b0, $a0, $68, $20, $bd, $ff, $a9, $01, $85, $fb, $a9, $08, $85, $fc, $a9, $fb    // data $9283
    .byte $a2, $00, $a0, $26, $20, $d8, $ff, $ee, $20, $d0, $ce, $20, $d0, $4c, $9a, $68    // data $9293
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $46, $4c, $41    // data $92a3
    .byte $53, $48, $20, $55, $54, $49, $4c, $20, $56, $33, $2e, $38, $50, $46, $4c, $41    // data $92b3
    .byte $53, $48, $20, $55, $54, $49, $4c, $20, $56, $33, $2e, $38, $50, $00, $00, $00    // data $92c3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $92d3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $92e3
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $10, $0c, $05    // data $92f3
    .byte $01, $13, $05, $20, $0e, $0f, $14, $05, $20, $20, $20, $20, $20, $20, $20, $20    // data $9303
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9313
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9323
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9333
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $14, $08, $09    // data $9343
    .byte $13, $20, $10, $12, $0f, $07, $12, $01, $0d, $20, $0a, $15, $13, $14, $20, $13    // data $9353
    .byte $01, $16, $05, $13, $20, $0f, $0e, $05, $20, $14, $09, $0e, $19, $20, $06, $09    // data $9363
    .byte $0c, $05, $20, $20, $20, $14, $0f, $20, $14, $08, $05, $20, $04, $09, $13, $0b    // data $9373
    .byte $20, $09, $0e, $20, $04, $12, $09, $16, $05, $20, $38, $2e, $20, $20, $20, $20    // data $9383
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $10, $0c, $05    // data $9393
    .byte $01, $13, $05, $20, $13, $01, $16, $05, $20, $14, $08, $09, $13, $20, $10, $12    // data $93a3
    .byte $0f, $07, $12, $01, $0d, $20, $01, $14, $0c, $05, $01, $13, $14, $20, $14, $17    // data $93b3
    .byte $0f, $20, $20, $20, $20, $0f, $12, $20, $14, $08, $12, $05, $05, $20, $14, $09    // data $93c3
    .byte $0d, $05, $13, $20, $06, $0f, $12, $20, $06, $15, $14, $15, $12, $05, $20, $15    // data $93d3
    .byte $13, $01, $07, $05, $20, $01, $0e, $04, $20, $14, $0f, $20, $20, $02, $05, $20    // data $93e3
    .byte $13, $15, $12, $05, $20, $14, $0f, $20, $08, $01, $16, $05, $20, $09, $14, $20    // data $93f3
    .byte $08, $01, $0e, $04, $19, $2e, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9403
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9413
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9423
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $01, $02, $0f    // data $9433
    .byte $15, $14, $20, $33, $36, $20, $02, $0c, $0f, $03, $0b, $13, $20, $17, $09, $0c    // data $9443
    .byte $0c, $20, $02, $05, $20, $0e, $05, $05, $04, $05, $04, $20, $20, $2e, $2e, $2e    // data $9453
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9463
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9473
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9483
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9493
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $94a3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $94b3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $94c3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $14, $08    // data $94d3
    .byte $01, $0e, $0b, $13, $20, $06, $0f, $12, $20, $19, $0f, $15, $12, $20, $01, $14    // data $94e3
    .byte $14, $05, $0e, $14, $09, $0f, $0e, $20, $2e, $2e, $2e, $20, $20, $20, $20, $20    // data $94f3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9503
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9513
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9523
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9533
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9543
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9553
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9563
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9573
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9583
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9593
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95a3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95b3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95c3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95d3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95e3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $95f3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9603
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9613
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9623
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9633
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9643
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9653
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9663
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9673
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9683
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $9693
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96a3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96b3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96c3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96d3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20    // data $96e3
    .byte $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $20, $b3, $60, $a9    // data $96f3
    .byte $ff, $8d, $19, $b3, $60, $20, $37, $c1, $ad, $33, $b3, $10, $21, $60, $20, $37    // data $9703
    .byte $c1, $ad, $33, $b3, $30, $18, $60, $20, $37, $c1, $ad, $32, $b3, $0d, $33, $b3    // data $9713
    .byte $d0, $0c, $60, $20, $37, $c1, $ad, $32, $b3, $0d, $33, $b3, $d0, $05, $a9, $01    // data $9723
    .byte $8d, $0a, $b3, $60, $20, $c3, $c2, $2c, $1f, $b3, $10, $05, $a2, $02, $4c, $f9    // data $9733
    .byte $be, $60, $ad, $06, $b3, $8d, $08, $b3, $60, $a9, $00, $8d, $08, $b3, $60, $2c    // data $9743
    .byte $53, $2c, $52, $ad, $ff, $b2, $f0, $05, $a2, $07, $4c, $f9, $be, $20, $f5, $b8    // data $9753
    .byte $ce, $ff, $b2, $20, $c0, $b8, $18, $6d, $29, $b3, $aa, $a0, $00, $b9, $52, $c1    // data $9763
    .byte $9d, $d2, $b2, $e8, $c8, $c0, $04, $d0, $f4, $a9, $06, $a8, $a6, $ba, $20, $ba    // data $9773
    .byte $ff, $18, $a2, $d4, $a0, $b2, $ad, $2a, $b3, $69, $04, $20, $bd, $ff, $20, $c0    // data $9783
    .byte $ff, $20, $68, $bc, $ad, $01, $cb, $8d, $04, $b3, $ad, $02, $cb, $8d, $05, $b3    // data $9793
    .byte $a9, $29, $8d, $01, $cb, $a9, $02, $8d, $02, $cb, $ce, $fd, $b2, $60, $ad, $ff    // data $97a3
    .byte $b2, $f0, $05, $a2, $07, $4c, $f9, $be, $ce, $fe, $b2, $60, $20, $ad, $c2, $ad    // data $97b3
    .byte $32, $b3, $8d, $fa, $b2, $ad, $33, $b3, $8d, $fb, $b2, $60, $20, $c0, $b8, $aa    // data $97c3
    .byte $20, $c0, $b8, $20, $b6, $b8, $ca, $d0, $f7, $60, $20, $c0, $b8, $aa, $20, $c0    // data $97d3
    .byte $b8, $20, $b6, $b8, $ca, $d0, $f7, $a9, $00, $4c, $b6, $b8, $20, $c0, $b8, $aa    // data $97e3
    .byte $ca, $f0, $09, $20, $c0, $b8, $20, $b6, $b8, $ca, $d0, $f7, $20, $c0, $b8, $09    // data $97f3
    .byte $80, $20, $b6, $b8, $60, $20, $ad, $c2, $ad, $33, $b3, $d0, $0c, $ad, $32, $b3    // data $9803
    .byte $20, $b6, $b8, $20, $db, $b8, $4c, $08, $c2, $2c, $1f, $b3, $30, $f2, $a2, $03    // data $9813
    .byte $4c, $fc, $be, $20, $ad, $c2, $ad, $32, $b3, $20, $b6, $b8, $ad, $33, $b3, $20    // data $9823
    .byte $b6, $b8, $20, $db, $b8, $4c, $26, $c2, $20, $ad, $c2, $38, $ad, $32, $b3, $e9    // data $9833
    .byte $01, $08, $20, $b6, $b8, $28, $ad, $33, $b3, $e9, $00, $20, $b6, $b8, $20, $db    // data $9843
    .byte $b8, $4c, $3b, $c2, $ad, $39, $b3, $f0, $0c, $20, $37, $c1, $ad, $32, $b3, $ae    // data $9853
    .byte $33, $b3, $4c, $a2, $be, $60, $20, $99, $be, $20, $c3, $c2, $ad, $39, $b3, $d0    // data $9863
    .byte $29, $ad, $07, $b3, $f0, $24, $a5, $4d, $cd, $32, $b3, $d0, $07, $a5, $4e, $cd    // data $9873
    .byte $33, $b3, $f0, $20, $a2, $01, $20, $c9, $ff, $a9, $00, $20, $d2, $ff, $20, $cc    // data $9883
    .byte $ff, $e6, $4d, $d0, $e1, $e6, $4e, $4c, $79, $c2, $ad, $32, $b3, $85, $4d, $ad    // data $9893
    .byte $33, $b3, $85, $4e, $60, $a2, $02, $4c, $fc, $be, $20, $c3, $c2, $2c, $1f, $b3    // data $98a3
    .byte $30, $01, $60, $a9, $44, $8d, $33, $b3, $2c, $39, $b3, $30, $f5, $4c, $a8, $c2    // data $98b3
    .byte $a9, $00, $8d, $31, $b3, $8d, $1f, $b3, $20, $c0, $b8, $c9, $44, $f0, $04, $c9    // data $98c3
    .byte $45, $d0, $06, $8d, $31, $b3, $4c, $e3, $c2, $c9, $46, $d0, $06, $ce, $31, $b3    // data $98d3
    .byte $ee, $29, $b3, $ce, $29, $b3, $20, $1a, $c3, $ad, $31, $b3, $f0, $18, $30, $16    // data $98e3
    .byte $c9, $45, $d0, $07, $a9, $00, $8d, $33, $b3, $f0, $0b, $ad, $33, $b3, $8d, $32    // data $98f3
    .byte $b3, $a9, $00, $8d, $33, $b3, $60, $ce, $2c, $b3, $ad, $32, $b3, $8d, $34, $b3    // data $9903
    .byte $ad, $33, $b3, $8d, $35, $b3, $60, $20, $c5, $c4, $ad, $34, $b3, $8d, $32, $b3    // data $9913
    .byte $ad, $35, $b3, $8d, $33, $b3, $ad, $2c, $b3, $d0, $db, $20, $c0, $b8, $c9, $4b    // data $9923
    .byte $f0, $d8, $c9, $5b, $f0, $d1, $8d, $38, $b3, $20, $c5, $c4, $20, $4a, $c3, $ad    // data $9933
    .byte $2c, $b3, $d0, $c2, $4c, $2e, $c3, $ad, $38, $b3, $29, $0f, $aa, $d0, $14, $18    // data $9943
    .byte $ad, $32, $b3, $6d, $34, $b3, $8d, $32, $b3, $ad, $33, $b3, $6d, $35, $b3, $8d    // data $9953
    .byte $33, $b3, $60, $ca, $d0, $14, $38, $ad, $32, $b3, $ed, $34, $b3, $8d, $32, $b3    // data $9963
    .byte $ad, $33, $b3, $ed, $35, $b3, $8d, $33, $b3, $60, $ca, $d0, $40, $ad, $32, $b3    // data $9973
    .byte $8d, $36, $b3, $ad, $33, $b3, $8d, $37, $b3, $a9, $00, $8d, $32, $b3, $8d, $33    // data $9983
    .byte $b3, $a2, $10, $4e, $35, $b3, $6e, $34, $b3, $90, $18, $18, $ad, $36, $b3, $6d    // data $9993
    .byte $32, $b3, $8d, $32, $b3, $ad, $37, $b3, $6d, $33, $b3, $8d, $33, $b3, $90, $03    // data $99a3
    .byte $4c, $21, $c2, $0e, $36, $b3, $2e, $37, $b3, $ca, $d0, $d7, $60, $ca, $d0, $32    // data $99b3
    .byte $a9, $00, $8d, $36, $b3, $8d, $37, $b3, $a2, $10, $18, $2e, $32, $b3, $2e, $33    // data $99c3
    .byte $b3, $ca, $30, $e8, $2e, $36, $b3, $2e, $37, $b3, $38, $ad, $36, $b3, $ed, $34    // data $99d3
    .byte $b3, $a8, $ad, $37, $b3, $ed, $35, $b3, $90, $e1, $8d, $37, $b3, $8c, $36, $b3    // data $99e3
    .byte $b0, $d9, $ca, $ca, $ca, $ca, $d0, $13, $ad, $32, $b3, $2d, $34, $b3, $8d, $32    // data $99f3
    .byte $b3, $ad, $33, $b3, $2d, $35, $b3, $8d, $33, $b3, $60, $ca, $d0, $13, $ad, $32    // data $9a03
    .byte $b3, $0d, $34, $b3, $8d, $32, $b3, $ad, $33, $b3, $0d, $35, $b3, $8d, $33, $b3    // data $9a13
    .byte $60, $ad, $32, $b3, $4d, $34, $b3, $8d, $32, $b3, $ad, $33, $b3, $4d, $35, $b3    // data $9a23
    .byte $8d, $33, $b3, $60, $8a, $29, $07, $8d, $21, $b3, $20, $c0, $b8, $8d, $20, $b3    // data $9a33
    .byte $ad, $1b, $b3, $f0, $09, $20, $12, $c7, $ad, $22, $b3, $f0, $01, $60, $ad, $21    // data $9a43
    .byte $b3, $29, $07, $0a, $69, $e0, $85, $3a, $ad, $20, $b3, $0a, $85, $39, $90, $02    // data $9a53
    .byte $e6, $3a, $a5, $01, $48, $78, $a9, $05, $85, $01, $a0, $00, $b1, $39, $8d, $34    // data $9a63
    .byte $b3, $c8, $b1, $39, $8d, $35, $b3, $68, $85, $01, $58, $ad, $34, $b3, $2d, $35    // data $9a73
    .byte $b3, $c9, $ff, $d0, $0d, $20, $12, $c7, $ad, $22, $b3, $c9, $ff, $f0, $03, $ce    // data $9a83
    .byte $1f, $b3, $60, $a5, $4d, $8d, $34, $b3, $a5, $4e, $8d, $35, $b3, $60, $20, $c0    // data $9a93
    .byte $b8, $38, $e9, $30, $cd, $17, $b3, $f0, $07, $90, $05, $a2, $0a, $4c, $fc, $be    // data $9aa3
    .byte $0a, $18, $6d, $14, $b3, $a8, $b1, $43, $8d, $35, $b3, $c8, $b1, $43, $8d, $34    // data $9ab3
    .byte $b3, $60, $20, $c0, $b8, $c9, $4a, $f0, $30, $aa, $29, $08, $8d, $2c, $b3, $8a    // data $9ac3
    .byte $29, $10, $f0, $03, $4c, $37, $c4, $8a, $29, $07, $c9, $05, $f0, $b5, $c9, $07    // data $9ad3
    .byte $f0, $bc, $a9, $00, $8d, $35, $b3, $20, $c0, $b8, $8d, $34, $b3, $8a, $29, $01    // data $9ae3
    .byte $f0, $06, $20, $c0, $b8, $8d, $35, $b3, $60, $ad, $38, $b3, $48, $ad, $32, $b3    // data $9af3
    .byte $48, $ad, $33, $b3, $48, $20, $1a, $c3, $68, $8d, $33, $b3, $68, $8d, $32, $b3    // data $9b03
    .byte $68, $8d, $38, $b3, $60, $8d, $3e, $b3, $8c, $3f, $b3, $a9, $ff, $8d, $41, $b3    // data $9b13
    .byte $a2, $08, $a0, $30, $38, $ad, $3e, $b3, $fd, $63, $c5, $8d, $40, $b3, $ad, $3f    // data $9b23
    .byte $b3, $fd, $64, $c5, $90, $0c, $8d, $3f, $b3, $ad, $40, $b3, $8d, $3e, $b3, $c8    // data $9b33
    .byte $d0, $e2, $98, $c9, $30, $d0, $05, $2c, $41, $b3, $30, $06, $20, $d2, $ff, $8d    // data $9b43
    .byte $41, $b3, $ca, $ca, $10, $cc, $2c, $41, $b3, $10, $04, $98, $4c, $d2, $ff, $60    // data $9b53
    .byte $01, $00, $0a, $00, $64, $00, $e8, $03, $10, $27, $a9, $c0, $2c, $a9, $80, $8d    // data $9b63
    .byte $1a, $b3, $ad, $1b, $b3, $f0, $05, $a2, $0e, $4c, $f9, $be, $ad, $11, $b3, $f0    // data $9b73
    .byte $05, $a2, $0f, $4c, $f9, $be, $a5, $4f, $a6, $50, $20, $a2, $be, $ce, $0d, $b3    // data $9b83
    .byte $60, $8d, $0f, $b3, $38, $a5, $4f, $ed, $0f, $b3, $85, $4f, $a5, $50, $e9, $00    // data $9b93
    .byte $85, $50, $a0, $00, $ad, $0f, $b3, $0d, $1a, $b3, $91, $4f, $c8, $8c, $10, $b3    // data $9ba3
    .byte $60, $ac, $10, $b3, $ee, $10, $b3, $91, $4f, $60, $20, $99, $be, $a9, $ff, $8d    // data $9bb3
    .byte $27, $b3, $ad, $12, $b3, $8d, $13, $b3, $ee, $11, $b3, $ad, $16, $b3, $20, $4a    // data $9bc3
    .byte $c6, $ad, $15, $b3, $20, $4a, $c6, $20, $37, $c1, $ad, $33, $b3, $8d, $16, $b3    // data $9bd3
    .byte $ad, $32, $b3, $8d, $15, $b3, $a9, $00, $8d, $18, $b3, $ac, $29, $b3, $cc, $0e    // data $9be3
    .byte $b3, $f0, $48, $b9, $d2, $b2, $30, $43, $c9, $4f, $d0, $2a, $20, $c0, $b8, $20    // data $9bf3
    .byte $c0, $b8, $a0, $80, $8c, $1a, $b3, $18, $48, $69, $01, $20, $94, $c5, $68, $aa    // data $9c03
    .byte $20, $c0, $b8, $20, $b4, $c5, $ca, $d0, $f7, $a5, $50, $20, $4a, $c6, $a5, $4f    // data $9c13
    .byte $20, $4a, $c6, $4c, $38, $c6, $20, $ad, $c2, $ad, $33, $b3, $20, $4a, $c6, $ad    // data $9c23
    .byte $32, $b3, $20, $4a, $c6, $ee, $18, $b3, $4c, $ee, $c5, $ad, $13, $b3, $8d, $14    // data $9c33
    .byte $b3, $ad, $18, $b3, $8d, $17, $b3, $ac, $12, $b3, $91, $43, $ee, $12, $b3, $d0    // data $9c43
    .byte $05, $a2, $09, $4c, $f9, $be, $60, $ad, $11, $b3, $d0, $05, $a2, $0b, $4c, $f9    // data $9c53
    .byte $be, $20, $99, $be, $ce, $11, $b3, $d0, $14, $a9, $00, $8d, $12, $b3, $8d, $13    // data $9c63
    .byte $b3, $8d, $17, $b3, $2c, $28, $b3, $70, $03, $4c, $cc, $c6, $60, $ac, $13, $b3    // data $9c73
    .byte $8c, $12, $b3, $b1, $43, $8d, $16, $b3, $c8, $b1, $43, $8d, $15, $b3, $ac, $12    // data $9c83
    .byte $b3, $88, $b1, $43, $8d, $17, $b3, $0a, $49, $ff, $18, $6d, $12, $b3, $69, $fd    // data $9c93
    .byte $8d, $13, $b3, $8d, $14, $b3, $4c, $77, $c6, $ac, $1c, $b3, $ee, $1c, $b3, $d0    // data $9ca3
    .byte $05, $a2, $0c, $4c, $f9, $be, $ad, $1c, $b3, $8d, $1d, $b3, $ee, $1b, $b3, $ad    // data $9cb3
    .byte $1b, $b3, $91, $47, $a9, $ff, $91, $45, $60, $ad, $1b, $b3, $d0, $05, $a2, $0d    // data $9cc3
    .byte $4c, $f9, $be, $20, $99, $be, $ce, $1b, $b3, $f0, $2e, $ad, $1b, $b3, $8d, $1e    // data $9cd3
    .byte $b3, $20, $7f, $ba, $a9, $00, $8d, $1d, $b3, $ac, $1c, $b3, $88, $b1, $47, $cd    // data $9ce3
    .byte $1e, $b3, $d0, $11, $cc, $1d, $b3, $90, $05, $c8, $8c, $1d, $b3, $88, $a9, $ff    // data $9cf3
    .byte $91, $45, $ce, $1e, $b3, $98, $d0, $e4, $60, $4c, $7f, $ba, $a9, $ff, $2c, $a9    // data $9d03
    .byte $00, $8d, $42, $b3, $a9, $00, $8d, $22, $b3, $a5, $50, $85, $4c, $a5, $4f, $85    // data $9d13
    .byte $4b, $a0, $00, $b1, $4b, $c9, $06, $d0, $4e, $a0, $02, $b1, $4b, $cd, $20, $b3    // data $9d23
    .byte $d0, $45, $c8, $b1, $4b, $cd, $21, $b3, $d0, $3d, $a0, $01, $b1, $4b, $c9, $ff    // data $9d33
    .byte $f0, $1d, $2c, $42, $b3, $10, $05, $a2, $10, $4c, $fc, $be, $a8, $88, $b1, $45    // data $9d43
    .byte $f0, $25, $b1, $47, $cd, $22, $b3, $90, $1e, $8d, $22, $b3, $4c, $65, $c7, $8d    // data $9d53
    .byte $22, $b3, $a0, $04, $b1, $4b, $8d, $34, $b3, $c8, $b1, $4b, $8d, $35, $b3, $ad    // data $9d63
    .byte $22, $b3, $cd, $1b, $b3, $b0, $08, $20, $83, $c7, $b0, $03, $4c, $24, $c7, $60    // data $9d73
    .byte $a0, $00, $b1, $4b, $29, $3f, $18, $65, $4b, $85, $4b, $90, $02, $e6, $4c, $c5    // data $9d83
    .byte $47, $a5, $4c, $e5, $48, $60, $ad, $23, $b3, $8d, $20, $b3, $ad, $24, $b3, $8d    // data $9d93
    .byte $21, $b3, $20, $12, $c7, $ad, $22, $b3, $cd, $1b, $b3, $d0, $05, $a2, $01, $4c    // data $9da3
    .byte $fc, $be, $a9, $00, $8d, $1a, $b3, $a9, $06, $20, $94, $c5, $ad, $1d, $b3, $20    // data $9db3
    .byte $b4, $c5, $ad, $23, $b3, $20, $b4, $c5, $ad, $24, $b3, $20, $b4, $c5, $ad, $25    // data $9dc3
    .byte $b3, $20, $b4, $c5, $ad, $26, $b3, $4c, $b4, $c5, $20, $37, $c1, $a9, $00, $8d    // data $9dd3
    .byte $09, $b3, $8d, $22, $b3, $ad, $23, $b3, $8d, $20, $b3, $ad, $24, $b3, $8d, $21    // data $9de3
    .byte $b3, $20, $51, $c4, $ad, $1f, $b3, $d0, $1a, $ad, $22, $b3, $c9    // data $9df3 (unchanged, ends $9dff)

// The $9e00-$9e9c pocket is free again -- net_spin / net_wait_not_busy_spin /
// net_read_and_print moved into the main module region at $8023+ along with
// everything else (see the HONDANI SHELL module above).
free_9e00:
    .fill $9e9d - free_9e00, $00

    .byte $20, $ba, $de, $ea, $ea, $ea    // data $9e9d (unchanged original code resumes here)
    .byte $ea, $ea, $ea, $ea, $ea, $ea, $20, $ba, $de, $ea, $ea, $ea, $ea, $ea, $ea, $ea    // data $9ea3
    .byte $ea, $ea, $8d, $00, $de, $68, $60, $48, $78, $a9, $88, $48, $a9, $20, $8d, $00    // data $9eb3
    .byte $de, $00, $00, $00, $00, $00, $2c, $80, $80, $2c, $80, $80, $48, $ad, $f2, $de    // data $9ec3
    .byte $8d, $00, $de, $68, $8d, $f7, $de, $8d, $00, $de, $60, $8d, $00, $de, $68, $40    // data $9ed3
    .byte $ea, $85, $9e, $68, $8d, $00, $de, $a5, $9e, $60, $88, $00, $08, $10, $18, $20    // data $9ee3
    .byte $1a, $80, $88, $90, $98, $00, $00, $00, $00, $00, $00, $00, $00, $ea    // data $9ef3
bank05_sub_9f01:
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    nop                    // ea
    sei                    // 78
    cld                    // d8
    sta $a5                // 85 a5
    stx $a6                // 86 a6
    sty $a7                // 84 a7
    php                    // 08
    pla                    // 68
    sta $a8                // 85 a8
    pla                    // 68
    sta $9e                // 85 9e
    clc                    // 18
    adc #$02               // 69 02
    tax                    // aa
    pla                    // 68
    sta $9f                // 85 9f
    adc #$00               // 69 00
    pha                    // 48
    txa                    // 8a
    pha                    // 48
    lda $9e                // a5 9e
    bne bank05_sub_9f2b              // d0 02
    dec $9f                // c6 9f
bank05_sub_9f2b:
    dec $9e                // c6 9e
    ldy #$00               // a0 00
    lda ($9e),y            // b1 9e
    sec                    // 38
    sbc #$00               // e9 00
    tax                    // aa
    lda $deed              // ad ed de
    pha                    // 48
    lda #$de               // a9 de
    pha                    // 48
    lda #$e2               // a9 e2
    pha                    // 48
    ldy #$03               // a0 03
    lda ($9e),y            // b1 9e
    pha                    // 48
    dey                    // 88
    lda ($9e),y            // b1 9e
    pha                    // 48
    lda $a8                // a5 a8
    pha                    // 48
    lda $a5                // a5 a5
    pha                    // 48
    lda $deee,x            // bd ee de
    ldx $a6                // a6 a6
    ldy $a7                // a4 a7
    jmp $dede              // 4c de de
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f58
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f68
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f78
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f88
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9f98
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fa8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fb8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fc8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fd8
    .byte $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00    // data $9fe8
    .byte $00, $00, $00, $00, $00, $00, $00, $00    // data $9ff8