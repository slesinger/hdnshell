
; SKTP (Sidekick64 transfer protocol) client 
; for Commodore 64 with WiC64
; Copyright (C) 2023  Henning Pingel
;
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program.  If not, see <http://www.gnu.org/licenses/>.

; 
; Assembler used: C64 Studio by Georg Rottensteiner
; https://www.georg-rottensteiner.de/de/c64.html
;
; PRG download and launch functionality is heavily inspired by the 
; portal launch code in the "WiC64 Universal Routine" that can be
; found here: https://www.wic64.de/downloads/
;

!macro sktp_server
  !text "http://sktpdemo.cafeobskur.de"
  ;!text "http://localhost"
!end

!macro build_date
  !text "2023-11-13"
!end

!macro client_version
  !text "0.24"
!end

!to "sktp-v0.24.prg",cbm

*=$0801
  ;SYS 2064
    !byte $0C,$08,$0A,$00,$9E,$20,$32,$30,$36,$34,$00,$00,$00,$00,$00


;area for PRG loader
safe_area = $0334   ; for load-routine

;zeropage addresses used
tmp   = $a6
data_pointer   = $a7 ; $a7/$a8 adress for data
data_pointer2  = $a8 ; $a7/$a8 adress for data
color_pointer  = $a9 ; $a9/$aa adress for data    
color_pointer2 = $aa ; $a9/$aa adress for data    
mpCount        = $ab; multi purpose counter
;we are using mpCount for screenMetaRefresh and also 
;for verticalrepeatscreencode chunk as the refresh chunk
;is always near the end of a screen and all vrsc chunks
;are already processed by then.

jmp start

welcomeScreen:
    jsr $e544 ;clear screen
    lda #11
    jsr setBothColors
    lda #5 ; white font color
    jsr $ffd2
    ldy #0
loopWelcomeMsg:
    lda welcomeMsg,y
    cmp #0
    beq endOfWelcomeMsg
    jsr $ffd2
    iny
    jmp loopWelcomeMsg
endOfWelcomeMsg:    
    jsr $ffd2
    rts

debugOutputScreenLength:
    ;prints out remaining screen byte length
    ;lda sktpScreenLengthH
    ;jsr PrintHiNibble
    lda sktpScreenLengthH
    jsr PrintLowNibble
    lda sktpScreenLengthL
    jsr PrintHiNibble
    lda sktpScreenLengthL
    jsr PrintLowNibble
    lda #","
    jsr $ffd2
    rts

setBothColors:
    sta $d020
    sta $d021
    rts

printDLURLStuff:

    ldy #0
loopNODOLOMsg:
    lda nodoloMSG,y
    cmp #0
    beq endOfNODOLOMsg
    jsr $ffd2
    iny
    jmp loopNODOLOMsg
endOfNODOLOMsg:    
    jsr $ffd2

    lda sktpChunkType
    sta dlurl_netto_start-3

    ldy #00
printDLURLChar:
    jsr read_byte
    sta dlurl_netto_start,y
;TODO ascii 2 petscii here
;    jsr ascii2screencode
    iny
    jsr $ffd2
    dec sktpChunkType
    bne printDLURLChar

    lda #00
    sta dlurl_netto_start,y

    lda #$0d
    jsr $ffd2
    lda #$0d
    jsr $ffd2

printDLFilenameChar:
    jsr read_byte
;TODO ascii 2 petscii here
;    jsr ascii2screencode
    jsr $ffd2
    dec sktpChunkLengthL
    bne printDLFilenameChar
    jmp fetchDownload

start:
    ;switch to lowercase
    lda #14
    jsr $ffd2

    jsr welcomeScreen
    jsr detectLegacyFirmware   
    
    cld ; no decimal-flag wanted

renewSessionID:
    ;update indicator with red color
    lda #2
    sta $da50

    ;get and store sktp session id
    jsr request_sessionid

    ;update indicator color to yellow
    lda #07
    sta $da50
    
    jsr receive_sessionid
    
    ;update indicator (light green tick)
    lda #122
    sta $0650
    lda #13
    sta $da50
    
    ;now send the command to set the default server to wic
    jsr sendURLPrefixToWic

waitkeypressW:
    jsr $ffe4
    beq waitkeypressW

sendSKTPRequest:

    jsr sendSKTPCommand

    jsr getresponse
    rts

renewSessionID_trampolin:
    jmp renewSessionID

downloadURL:
    jsr $e544     ; Clr screen
    lda #15
    jsr setBothColors
    ;switch to lowercase
    lda #14
    jsr $ffd2

    jsr read_byte ; url length
    sta sktpChunkType
    jsr read_byte ; filename length
    sta sktpChunkLengthL
    jsr read_byte ; save flag 
    jmp printDLURLStuff

        
getresponse:
    jsr setWicToSendDataToC64

    ;lengthdebug
    
    ;jsr $e544     ; Clr screen
    ;lda #13
    ;jsr $ffd2
    ;lda #13
    ;jsr $ffd2
    ;lda #13
    ;jsr $ffd2
    ;lda #13
    ;jsr $ffd2
    ;lda #13;
    ;jsr $ffd2

    ;end of lengthdebug


    jsr read_byte   ;unused dummy byte 

    jsr read_byte
    sta sktpScreenLengthH

    jsr read_byte
    sta sktpScreenLengthL

    ;lengthdebug
    ;jsr $e544     ; Clr screen
    ;jsr debugOutputScreenLength

    ;subtract one from length as this is the screen type byte
    lda sktpScreenLengthL
    cmp #00
    bne jumpPositive
    dec sktpScreenLengthH
jumpPositive:
    dec sktpScreenLengthL

    ;lengthdebug
    ;jsr debugOutputScreenLength

    ;sktp screen type, first byte of response
    jsr read_byte
    sta sktpScreenType

    ;screen types:
    ;0 = clear screen first
    ;1 = leave previous screen standing and paint over it
    ;2 = file download
    ;3 = session timed out, get new session id
    cmp #2
    beq downloadURL
    cmp #4
    bcs illegalScreenType
    cmp #3
    beq renewSessionID_trampolin
    cmp #0
    bne parseChunk
    jsr $e544     ; Clr screen = disable on lengthdebug
    
    jmp parseChunk
    
illegalScreenType:
    jsr $e544     ; Clr screen
    lda #3
    jsr setBothColors
    ;switch to lowercase
    lda #14
    jsr $ffd2
    ;ERR: 
    lda #"e"
    jsr $ffd2
    lda #"r"
    jsr $ffd2
    jsr $ffd2
    lda #":"
    jsr $ffd2
    lda #" "
    jsr $ffd2
    lda #"$"
    jsr $ffd2
    lda sktpScreenType
    jsr PrintHiNibble
    lda sktpScreenType
    jsr PrintLowNibble
    lda #" "
    jsr $ffd2
    ldy #0
loopErrorMsg:
    lda errormsg_IllegalScreen,y
    cmp #0
    beq endOfErrorMsg
    jsr $ffd2
    iny
    jmp loopErrorMsg
endOfErrorMsg:    
    jsr $ffd2
    rts

    
;jmp debug2    
;    lda #"/"
;    jsr $ffd2
;    lda #"s"
;    jsr $ffd2
;    lda #"t"
;    jsr $ffd2
;    lda sktpScreenType
;    ora #%00110000
;    jsr $ffd2
;    lda #"/"
;    jsr $ffd2    
; 
;:debug2

;sktp chunk type:
;0 = normal,
;1 = repeat,
;2 = screencode,
;3 = meta_refresh,
;4 = colorcharset,
;5 = vertical repeat screencode
;6 = paintbrush,
;7 = tft_image_url
;8 = tft_image_inline


parseChunk:
    ;check if screen buffer is now empty and everything is in place
    ;and we are ready to listen to keypresses
    lda sktpScreenLengthL
    cmp #00
    bne isnotempty
    lda sktpScreenLengthH
    cmp #00
    bne isnotempty
    ldy#00 ; for delay that works via y
    jmp waitkey; is empty, now wait for user keypress and load next screen

isnotempty:
;    lda #255 ;tmp lengthdebug
;    sta sktpChunkType;tmp lengthdebug

    sec
    jsr read_byte
    ;dont parse chunks > chunk type 6
    sta sktpChunkType;tmp debug
    cmp #07
    bcc foundValidChunkType
    
    lda #"%"
    jsr $ffd2
    lda sktpChunkType
    jsr PrintHiNibble
    lda sktpChunkType
    jsr PrintLowNibble
;    ora #%00110000
;    jsr $ffd2
    lda #"%"
    jsr $ffd2

;    jsr read_byte
;    sta sktpChunkType;tmp debug
;    lda sktpChunkType
;    jsr PrintHiNibble
;    lda sktpChunkType
;    jsr PrintLowNibble
;;    ora #%00110000
;;    jsr $ffd2
;    lda #"%"
;    jsr $ffd2
;
;    jsr read_byte
;    sta sktpChunkType;tmp debug
;    lda sktpChunkType
;    jsr PrintHiNibble
;    lda sktpChunkType
;    jsr PrintLowNibble
;;    ora #%00110000
;;    jsr $ffd2
;    lda #"%"
;    jsr $ffd2

    rts
foundValidChunkType:
    ;this cleanup could be done later after processing a chunk
    lda #00
    sta sktpChunkLengthL
    sta sktpChunkLengthH
    sta sktpChunkScrPosL
    sta sktpChunkScrPosH
    sta sktpChunkColor
    sta sktpNettoChunkLengthL
    sta sktpNettoChunkLengthH
    sta sktpChunkRptCount ;this is used by vertical repeat and paintbrush chunk
    
    jmp parseSKTPChunk

;============================================


;============================================
handleCharRepeatChunk: ; chunk type #1
;============================================
    ;always 6 bytes
    lda #5
    sta sktpNettoChunkLengthL
    jsr prepareStuff

    jsr read_byte ; char
    jsr ascii2screencode
    tax
    ;check if reverse flag is set, if so, modify screencode values
    lda sktpChunkColor 
    cmp #128
    bcc endreversetest5
    txa
    adc #127
    tax
endreversetest5:    
    ldy #00
charRepeat:
    txa
    sta (data_pointer),y
    tax
    lda sktpChunkColor
    sta (color_pointer),y
    iny
    cpy sktpChunkLengthL
    bne charRepeat
    jmp endOfChunkReached
        
;============================================
handleMetaRefreshChunk:
;============================================
    ;always 2 bytes
    lda #1
    sta sktpNettoChunkLengthL
    jsr read_byte ; char
;    jmp endOfChunkReached; disable refresh for now

    asl; workaround to have a longer waiting time
;    asl; workaround to have a longer waiting time
;    asl; workaround to have a longer waiting time

    sta mpCount
    jmp endOfChunkReached

;============================================
parseSKTPChunk:
;============================================
;waitkeypress:
;    jsr $ffe4
;    beq waitkeypress

    lda sktpChunkType
    cmp #0
    beq handleNormalChunk
    cmp #1
    beq handleCharRepeatChunk
    cmp #2
    beq handleScreenCodeChunk
    cmp #3
    beq handleMetaRefreshChunk
    jmp parseSKTPChunkPart2

;============================================
handleNormalChunk: ; chunk type 0
;============================================
    jsr prepNSCC
chunk0_loop:
    jsr read_byte
    ;convert ascii to screencode
    jsr ascii2screencode
    tax
    ;check if reverse flag is set, if so, modify petscii values
    lda sktpChunkColor 
    cmp #128
    bcc endreversetest0
    txa
    adc #127
    jmp render0

;============================================
handleScreenCodeChunk: ; chunk type 2
;============================================
    jsr prepNSCC ; also sets y to zero
chunk2_loop:
    jsr read_byte
    jsr renderCharAndColor ; increases y
    lda sktpChunkLengthH
    cmp #00
    beq processOnlyLowByte2
    ;highbyte is bigger than zero: we care about that first
    cpy #$ff; compare y with value 255
    bne chunk2_loop ; go up and read next byte
    ;finally we have read 255 bytes    
    jsr decAndInc
    jmp chunk2_loop
    
processOnlyLowByte2:
    cpy sktpChunkLengthL ; compare y with the amount of bytes to read
    bne chunk2_loop
    jmp endOfChunkReached

decAndInc:
    dec sktpChunkLengthH

    lda data_pointer
    clc
    adc #255
    sta data_pointer
    bcc noOverflowDAI
    inc data_pointer2
noOverflowDAI:
    lda color_pointer
    clc
    adc #255
    sta color_pointer
    bcc noOverflowDAI2
    inc color_pointer2
noOverflowDAI2:
    inc sktpChunkLengthL; workaround
    ldy #00
    rts

endreversetest0:
    txa
render0:
    jsr renderCharAndColor
    ;is highbyte > zero? than care about that first
    lda sktpChunkLengthH
    cmp #00
    beq processOnlyLowByte0
    cpy #$ff
    bne chunk0_loop
    jsr decAndInc
    jmp chunk0_loop
    
processOnlyLowByte0:
    cpy sktpChunkLengthL
    bne chunk0_loop
    jmp endOfChunkReached
    
prepNSCC:
    jsr prepareStuff
    lda sktpChunkLengthH
    sta sktpNettoChunkLengthH    
    ;always 5 chars + stringlenth    
    lda #04
    clc
    adc sktpChunkLengthL
    sta sktpNettoChunkLengthL
    bcc noOverflow
    inc sktpNettoChunkLengthH
noOverflow:
    ldy #00
    rts

renderCharAndColor:
;    sta $0400+120,y
    sta (data_pointer),y
    lda sktpChunkColor
    sta (color_pointer),y
;    sta $d800+120,y
    iny
    rts

;============================================
handleColorCharsetChunk: ; chunk type #4
;============================================
    ;always 4 bytes
    lda #3
    sta sktpNettoChunkLengthL
    jsr readByteAndDecrease
    sta $d020
    jsr readByteAndDecrease
    sta $d021
    jsr read_byte
    cmp #01
    beq switch2Lowercase
    lda #142 ;switch to uppercase
    jmp setCase
switch2Lowercase:
    lda #14 ;switch to lowercase
setCase:
    jsr $ffd2
    jmp endOfChunkReached

;============================================
handlePaintbrushChunk: ; chunk type 6
;============================================
    jsr prepareStuff
    ;always 6 chars + chars
    lda #05
    clc
    adc sktpChunkLengthL
    sta sktpNettoChunkLengthL
;    lda #00
;    clc
    lda sktpChunkLengthH ; sloppy but should always be 0
    sta sktpNettoChunkLengthH 
    ;netto : this is used to calculate if we
    ;have reached the end of the whole sktp screen

    ;sktpChunkGap is already set up (through sktpChunkColor)
    
    ;after moving the sktpChunkColor value we can now put the gap
    ;value into sktpChunkColor aka sktpChunkGap
    ;(paintbrush chunk has color values as its content)
    jsr read_byte ; this is the gap value
    sta sktpChunkRptCount
    sta sktpChunkType ; backup repeat value
    
    ;the two bytes sktpChunkScrPos* can be used as helper vars
    ;here to backup the values of sktpChunkLength*
    ;sktpChunkScrPos* is needed to set up the color_pointer*
    ;and afterwards it is unused
    ;the backup means that we always know how many bytes a paintbrush
    ;chunk is wide
    lda sktpChunkLengthL
    sta sktpChunkScrPosL
    lda sktpChunkLengthH
    sta sktpChunkScrPosH
    
    ;TODO: only do this backup if repeat count > 0 
    ;in case there is a repeat count > 0 we need to be able
    ;to find the color content again, therefore we need to
    ;backup the color_pointer stuff. As we don't need the
    ;data_pointer in the paintbrush chunk we can use it
    ;for this purpose
    lda color_pointer
    sta data_pointer
    lda color_pointer2
    sta data_pointer2
        
    ldy #0 ; y is used to iterate over the content bytes
    jmp handlePaintbrushChunkLoop

;============================================
parseSKTPChunkPart2:  
;============================================
    cmp #4
    beq handleColorCharsetChunk
    cmp #5
    beq handleVerticalRepeatScreencode
    cmp #6
    beq handlePaintbrushChunk
    ;7 = tft_image_url
    ;8 = tft_image_inline
    lda #"$"
    jsr $ffd2
    rts

;============================================

handlePaintbrushChunkLoop:
    jsr read_byte
    sta (color_pointer),y
    tax ; backup color value in x
    ;backup color_pointer
    lda color_pointer2
    sta data_pointer2
    lda color_pointer
    sta data_pointer    
pbCheckForRepeat:
    lda sktpChunkRptCount
    cmp #0
    ;is repeat count > zero? than care about that
    beq pbEndOfRepeat
    dec sktpChunkRptCount
    lda color_pointer
    clc
    adc sktpChunkScrPosL ; this is the length of the paintbrush chunk (ignoring the high byte)
    ;FIXME: care for high byte!!!!
    sta color_pointer
    bcc bpnovfl2
    inc color_pointer2
bpnovfl2:
    clc
    adc sktpChunkGap
    sta color_pointer
    bcc bpnovfl3
    inc color_pointer2
bpnovfl3:
    txa
    sta (color_pointer),y
    tax
    jmp pbCheckForRepeat

pbEndOfRepeat:
    ;restore color pointer from backups
    lda data_pointer
    sta color_pointer
    lda data_pointer2
    sta color_pointer2
    lda sktpChunkType ; restore repeat value from backup
    sta sktpChunkRptCount
    
    iny
    
    ;is highbyte > zero? than care about that first
    lda sktpChunkLengthH
    cmp #00
    beq pbProcessOnlyLowByte
    ;from now on we have the hassle to care for the high byte
    ;this means printing out 255 bytes of color values
    cpy #$ff
    bne handlePaintbrushChunkLoop
    dec sktpChunkLengthH
    lda color_pointer
    clc
    adc #255
    sta color_pointer
    bcc noOverflowPB
    inc color_pointer2
noOverflowPB:
    inc sktpChunkLengthL; workaround
    ldy #00
    jmp handlePaintbrushChunkLoop

pbProcessOnlyLowByte:
    cpy sktpChunkLengthL
    bne handlePaintbrushChunkLoop
    jmp endOfChunkReached 

;============================================
handleVerticalRepeatScreencode: ; chunk type #5
;============================================
    jsr prepareStuff
    ;length 6 + chars
    lda #5
    clc
    adc sktpChunkLengthL
    sta sktpNettoChunkLengthL

    jsr read_byte ; repeat count
    sta sktpChunkRptCount
    ldx #00 ; x iterates the bytes read from http
VrscProcessNextByte:
    ldy #00 ; y iterates the times one byte was printed out
    stx mpCount
    jsr read_byte ; one char of possibly more
    jmp handleVerticalRepeatScreencodeLoop
VrscPostProcess:
    ldx mpCount
    inx
    stx mpCount
    cpx sktpChunkLengthL
    beq VRSCEnd
    jsr screenAndColorRAMAddress ;reset the addresses to default
    lda data_pointer
    adc mpCount
    sta data_pointer
    bcc noOverflowVRD2
    inc data_pointer2
noOverflowVRD2:
    lda color_pointer
    adc mpCount
    sta color_pointer
    bcc noOverflowVRD3
    inc color_pointer2
noOverflowVRD3:
    jmp VrscProcessNextByte

VRSCEnd:
    ldx #00
    stx mpCount; reset it so that it doesn't go wild for meta refreshes
    jmp endOfChunkReached

handleVerticalRepeatScreencodeLoop:
    ; in accu we have that byte to display     
    sta (data_pointer),y
    tax
    lda sktpChunkColor
    sta (color_pointer),y
    iny
    cpy sktpChunkRptCount
    beq VrscPostProcess
    lda data_pointer
    clc
    adc #$27 ; add 39, not 40, as y also increases
    sta data_pointer
    bcc noOverflowVRD
    inc data_pointer2
noOverflowVRD:    
    lda color_pointer
    clc
    adc #$27 ; add 39, not 40, as y also increases
    sta color_pointer
    bcc noOverflowVRC
    inc color_pointer2
noOverflowVRC:
    txa
    jmp handleVerticalRepeatScreencodeLoop

    
;============================================
;helper for colorCharset chunk
;============================================
readByteAndDecrease:
;============================================
    jsr read_byte
    tay
    dey
    tya
    rts

;============================================
endOfChunkReached:
;============================================

    ;lengthdebug
    
    ;lda sktpChunkType
    ;jsr PrintLowNibble
    ;lda #":"
    ;jsr $ffd2
    ;lda #"("
    ;jsr $ffd2
    ;lda sktpNettoChunkLengthH
    ;beq nettoLowByte
    
    ;;jsr PrintHiNibble ; this is not interesting, it should always be 0
    ;lda sktpNettoChunkLengthH
    ;LowNibble
nettoLowByte:
;    lda sktpNettoChunkLengthL
;    jsr PrintHiNibble
;    lda sktpNettoChunkLengthL
;    jsr PrintLowNibble    
;    lda #")"
;    jsr $ffd2

    ;subtract length of complete chunk from screen 
    lda sktpNettoChunkLengthH
    cmp #00
    beq gohere ;if high byte is zero don't change high byte of screenlength
    lda sktpScreenLengthH
    clc
    sbc sktpNettoChunkLengthH
    sta sktpScreenLengthH
    inc sktpScreenLengthH ; workaround - test this line with petscii slideshow and arena/foyer
    clc
;    lda #"*"
;    jsr $ffd2

gohere:
    lda sktpScreenLengthL
    clc
    sbc sktpNettoChunkLengthL
    bcs notundernull
    tax
;    lda #"-"
;    jsr $ffd2
    txa
    dec sktpScreenLengthH
notundernull:
    sta sktpScreenLengthL

    ;lengthdebug
    ;jsr debugOutputScreenLength    
    

;waitkeypress2:
;    jsr $ffe4
;    beq waitkeypress2
;    lda #"="
;    jsr $ffd2

    jsr parseChunk ;parse the next chunk
    
end: 
    lda #$ff       ; Datenrichtung Port B Ausgang
    sta $dd03

    lda $dd00
    ora #$04       ; PA2 auf HIGH = ESP im Empfangsmodus
    sta $dd00
    
    cli
    lda #$00
    
;============================================
waitkey:
;============================================
    lda mpCount
    cmp #00
    beq noMetaRefreshActive
    
    ;lda mpCount
    ;jsr PrintHiNibble
    ;lda mpCount
    ;jsr PrintLowNibble
    ;lda #"/"
    ;jsr $ffd2

    iny
    cpy #$ff
    bne noMetaRefreshActive ; count to 255 first
    lda mpCount
    dec mpCount
    ldy #00
    lda mpCount
    cmp #00
    beq triggerMetaRefresh
    jmp noMetaRefreshActive ; it is active but we 
    ;want to detect human keypresses in between too

;delayDecreasempCount:
;    jmp noMetaRefreshActive 

triggerMetaRefresh:
    jsr $ffe4
    bne leaveWaitLoop
    lda #00 ; 00 key to send as char for refresh
    jmp leaveWaitLoop
noMetaRefreshActive:
    jsr $ffe4
    beq waitkey

leaveWaitLoop:
    tax
    jsr getHiNibbleHex
    sta sktp_key
    ;jsr $ffd2
    txa
    jsr getLowNibbleHex
    sta sktp_key+1
    ;jsr $ffd2
    jmp sendSKTPRequest

;    lda #"*"
;    jsr $ffd2   
    jmp end2

;============================================
screenAndColorRAMAddress:
;============================================
    ;set zero page values
    ;memory low bytes
    lda sktpChunkScrPosL
    sta data_pointer
    sta color_pointer
    ;screen memory starts at $0400
    lda sktpChunkScrPosH
    clc
    adc #4
    sta data_pointer2
    ;color memory starts at $d800
    lda sktpChunkScrPosH
    adc startColorRAM
    sta color_pointer2
    rts

;============================================
prepareStuff: ; reads four bytes
;============================================
    jsr read_byte
    sta sktpChunkLengthL
    jsr read_byte
    sta sktpChunkScrPosL
    jsr read_byte
    tax
    and #%00000011
    sta sktpChunkScrPosH
    txa
    lsr
    lsr
    lsr
    lsr
    sta sktpChunkLengthH

;    jsr PrintHiNibble
;    lda sktpChunkLengthH
;    jsr PrintLowNibble
;    lda #"/"
    
    jsr read_byte
    sta sktpChunkColor ;in case of paintbrush chunk this contains the gap value
    jsr screenAndColorRAMAddress
    ;byte counter
;    lda sktp

;    jsr showDebugInfo
   
    ;lda sktpChunkType
    ;cmp #01
    ;bne continue
    ;lda sktpChunkColor
    ;cmp #01
    ;bne continue
    ;lda sktpChunkLengthL
    ;cmp #01
    ;bne continue
    ;sta sktpChunkScrPosL
    ;cmp #01
    ;bne continue
    ;sta sktpChunkScrPosH
    ;cmp #01
    ;bne continue
    ;sta sktpChunkColor
    ;cmp #01
    ;bne continue
    ;jmp waitkey
    
continue:

    rts


;============================================
showDebugInfo:
;============================================

    lda #13
    jsr $ffd2
    lda #"c"
    jsr $ffd2
    lda #"t"
    jsr $ffd2
    lda sktpChunkType
    ora #%00110000
    jsr $ffd2
    lda #"/"
    jsr $ffd2    
    lda #"c"
    jsr $ffd2
    lda #"l"
    jsr $ffd2
    
    lda sktpChunkLengthL
    jsr PrintHiNibble
    lda sktpChunkLengthL
    jsr PrintLowNibble
    lda #"/"
    jsr $ffd2
    lda #"h"
    jsr $ffd2

    lda sktpChunkScrPosH
    jsr PrintHiNibble
    lda sktpChunkScrPosH
    jsr PrintLowNibble
    lda #"/"
    jsr $ffd2
    lda #"l"
    jsr $ffd2

    lda sktpChunkScrPosL
    jsr PrintHiNibble
    lda sktpChunkScrPosL
    jsr PrintLowNibble
    lda #"/"
    jsr $ffd2

    lda #"c"
    jsr $ffd2
    lda #"o"
    jsr $ffd2
    lda sktpChunkColor
    jsr PrintLowNibble
    lda #"/"
    jsr $ffd2
    
    rts


;--------------------------------

PrintHiNibble:
    jsr getHiNibbleHex
     jsr $ffd2
    rts

getHiNibbleHex:
    and #%11110000
    lsr
    lsr
    lsr
    lsr
    ora #%00110000
    cmp #58
    bcc hiNibbleDone
    adc #06
:hiNibbleDone
    rts

PrintLowNibble:
    jsr getLowNibbleHex
    jsr $ffd2
    rts

getLowNibbleHex:
    and #%00001111
    ora #%00110000
    cmp #58
    bcc lowNibbleDone
    adc #06
:lowNibbleDone
    rts

receive_sessionid:
    jsr setWicToSendDataToC64

    jsr read_byte   ;; Dummy Byte - 

    jsr read_byte
    tay

    jsr read_byte
    tax
    ;we only expect 26 bytes (<255, so y is irrelevant) 
    ldy #00
recsess_goread:
    jsr read_byte
;    jsr $ffd2
    sta cmd_default_url_sess,y
    iny 
    dex
    cpx #00
    bne recsess_goread
    rts

setWicToExpectDataFromC64:
    ;we want to send a command to the wic
    lda $dd0d     ; handshake/flag2 reset befor sending command
    lda $dd02
    ora #$04
    sta $dd02     ; Datenrichtung Port A PA2 auf Ausgang
    lda #$ff      ; Datenrichtung Port B Ausgang
    sta $dd03
    lda $dd00
    ora #$04      ; PA2 auf HIGH = ESP im Empfangsmodus
    sta $dd00
    rts

setWicToSendDataToC64:
    ;we want to receive http data from the wic
    lda #$00       ; Datenrichtung Port B Eingang
    sta $dd03
    lda $dd00
    and #251      ; PA2 auf LOW = ESP im Sendemodus
    sta $dd00 
    rts
    
;--------------------------
detectLegacyFirmware: 
;--------------------------
    lda #$01
    sta legacyFirmware
    jsr setWicToExpectDataFromC64
    ldy #$00

-   lda versionStringRequest,y
    jsr write_byte
    iny
    cpy #$04
    bne -

    jsr setWicToSendDataToC64
    jsr read_byte

    jsr read_byte
    jsr read_byte

    ;attempt to detect an old firmware by the firmware version string
    ;emulators are inconsistent so we have different string lenghts depending
    ;on who we ask. Temporary hack...
    cmp #$0f ; kernal64 emulator with WIC64FWV:K1.0.2
    beq thisIsLegacy
    cmp #$02 ; vice emulation of wic64
    beq thisIsLegacy
    cmp #$0d ; real wic64 with old fw
    bne +
thisIsLegacy:
    dec legacyFirmware

+   tay
-   jsr read_byte
    dey
    bne -

    rts

versionStringRequest: !byte "W", $04, $00, $00
legacyFirmware: !byte $01

;--------------------------
requestDownloadURL:
;--------------------------
    jsr setWicToExpectDataFromC64

    ;send command string to wic
    ldy #$04
dl_countstring:  
    iny
    lda dlurl_start,y
    
    cmp #$00
    bne dl_countstring
    sty dlurl_start+1       ; String länge ermitteln und in das Kommand schreiben
    ldy #$00
dl_string_next:
    iny
    lda dlurl_start-1,y
    ;debug ausgabe
    ;jsr $ffd2
    jsr write_byte
    cpy dlurl_start+1
    bne dl_string_next
    ;lda #13
    ;jsr $ffd2
    rts


    
;--------------------------

request_sessionid:
    jsr setWicToExpectDataFromC64

    ;send command string to wic
    ldy #$04
sess_countstring:  
    iny
    lda sess_command,y
    
    cmp #$00
    bne sess_countstring
    sty sess_command+1       ; String länge ermitteln und in das Kommand schreiben
    ldy #$00
sess_string_next:
    iny
    lda sess_command-1,y
    ;debug ausgabe
    ;jsr $ffd2
    jsr write_byte
    cpy sess_command+1
    bne sess_string_next
    ;lda #13
    ;jsr $ffd2
    rts

;--------------------------

sendURLPrefixToWic:
    jsr setWicToExpectDataFromC64

    ;send command string to wic
    ldy #$04
urlprefix_countstring:  
    iny
    lda cmd_default_server,y
    
    cmp #$00
    bne urlprefix_countstring
    sty cmd_default_server+1       ; String länge ermitteln und in das Kommand schreiben
    ldy #$00
urlprefix_string_next:
    iny
    lda cmd_default_server-1,y
    ;debug ausgabe
;    jsr $ffd2
    jsr write_byte
    cpy cmd_default_server+1
    bne urlprefix_string_next

    lda legacyFirmware
    beq +

    jsr setWicToSendDataToC64
    jsr read_byte

    jsr read_byte
    jsr read_byte

+   ;lda #13
    ;jsr $ffd2
    rts

;--------------------------

sendSKTPCommand:
    jsr setWicToExpectDataFromC64
    ;send command string to wic
    ldy #$04
countstring:    
    iny
    lda sktp_command ,y
    cmp #$00
    bne countstring
    sty sktp_command +1       ; String länge ermitteln und in das Command schreiben
    ldy #$00
string_next:
    iny
    lda sktp_command-1,y
    ;jsr $ffd2
    jsr write_byte
    cpy sktp_command+1
    bne string_next
    ;lda #13
    ;jsr $ffd2
    rts

;--------------------------
write_byte:
;--------------------------
    sta $dd01        ; Bit 0..7: Userport Daten PB 0-7 schreiben

dowrite:
    lda $dd0d
    nop
    nop
    nop
    nop
    and #$10        ; Warten auf NMI FLAG2 = Byte wurde gelesen vom ESP
    beq dowrite
    rts
    
;--------------------------
read_byte:
;--------------------------
   
doread:
    nop
    nop
    nop
    nop
    lda $dd0d
    and #$10        ; Warten auf NMI FLAG2 = Byte wurde gelesen vom ESP
    beq doread
    
    lda $dd01 
;    sta $02 ; we don't need to write this into zeropage do we?
    rts

;--------------------------------------------
ascii2screencode:
;--------------------------------------------
    cmp #160   ;uppercase on mixed case
    bcs conv
    cmp #96    ;uppercase on mixed case
    bcs uppconv
    cmp #64    ;lowercase on mixed case
    bcs conv
    jmp noconv
conv:
    secv
    sbc #$20
uppconv:
    sec
    sbc #$20
noconv:
    clc
    rts

;---------------------------------

startColorRAM: !text $d8
 
sktp_command:    !text "W",$00,$00,$01,"!"
sktp_key:        !text "&r",0

cmd_default_server:     !text "W",$3f,$00,$08                               ;   04
cmd_default_url:        +sktp_server

                        !text "/sktp.php?s="
cmd_default_url_sess:   !text "12345678901234567890123456"
cmd_default_url_parm:   !text "&k=",0

sess_command:    !text "W",$00,$00,$01
sess_url:        +sktp_server

                 !text "/sktp.php?session=new&type=64&username=wic64test&f=wic&v="
sess_version:    +client_version

sess_end:        !text 0

sktpChunk:
sktpChunkType:    !text $00
sktpChunkLengthL: !text $00
sktpChunkLengthH: !text $00
sktpChunkScrPosL: !text $00
sktpChunkScrPosH: !text $00
sktpChunkGap:
sktpChunkColor:   !text $00
sktpChunkRptCount:!text $00

sktpScreenType:   !text $00
sktpScreenLengthH:!text $00
sktpScreenLengthL:!text $00
sktpNettoChunkLengthL  :!text $00
sktpNettoChunkLengthH  :!text $00

errormsg_IllegalScreen: !pet  "Illegal Screen Type",0
welcomeMsg:             !pet  "         SKTP client for WiC64",$0d,$0d,$0d
                        !pet  "              Version "                        
                        +client_version

                        !pet  $0d,"          Built on "
                        +build_date

                        !pet  $0d,$0d,"           2023 by emulaThor",$0d,$0d,$0d,$0d
                        !pet  " Server: "
                        +sktp_server

                        !pet  $0d,$0d,$0d,$0d
                        !pet  "        Requesting Session ID : ?",$0d
                        !pet  $0d,$0d
                        !pet  "             Press any key",0

nodoloMSG:              !pet $0d,$0d, "File launching...",$0d
                        !pet "Please wait!",$0d,$0d,0

dlurl_start: !text "W",$20,$00,$01
dlurl_netto_start: !text "h",0
!fill 254,0

end2:
  rts
  
fetchDownload:
    jsr copyload
    lda #00
    sta tmp
    
lp_load:
    jsr requestDownloadURL 
    jsr setWicToSendDataToC64
    jsr read_byte   ; dummy byte for triggering ESP IRQ
    jsr read_byte   ; data length high byte
    sta tmp     ; counter Hhigh byte
    jsr read_byte   ; data length low byte
    tax     ; x: counter low byte    

    inc tmp     ; +1 for faster check dec/bne
    jsr read_byte   ; loadadress low byte
    cmp #33     ; "!" bei http Fehler (z.B. file not found oder server busy)
    beq lp_load
    lda #$01    ; to force load ,8 (at basic start)
    sta data_pointer
    jsr read_byte   ; loadadress high byte
    lda #$08    ; to force load ,8 (at basic start)
    sta data_pointer+1  
    jmp safe_area   ; load program and run

copyload  ldx #(read_0334_end-read_0334_start)
-   lda read_0334_start,x ; copy load routine in safe area
    sta safe_area,x
    dex
    bpl -
    rts
    
read_0334_start:
!pseudopc safe_area {

;    lda #00
;    sta $d020
    
;    jsr $e453 ; init vectors
;    jsr $e3bf ; init basic ram
;    jsr $FF8A   ;restore kernel vectors
;    jsr $fd15 ; i/o
;    jsr $ff5b ; init video /editor
;    JSR $A659 ; character pointer and ckrs  

    ldy #00

loop_read_0334  
handshake_0334
    lda $dd0d
    nop
    nop
    nop
    nop       ; short delay
    and #$10          ; wait for NMI FLAG2
    beq handshake_0334
    lda $dd01     ; read byte
    sta (data_pointer),y
;    sta $d020    ; borderflicker while loading
    iny
    bne +
    inc data_pointer+1
+   dex
    bne loop_read_0334  
    dec tmp
    bne loop_read_0334  ; all bytes read?
    cli
    JSR $A659 ; character pointer and ckrs  
;    jsr $FDB3   ; cia
    jsr $FDA3   ; init SID, CIA und IRQ
;    jsr $fd50; memory
        
    JSR $FF40 ;RTS  ;JSR $FF81    ; screen reset
    JMP $A7AE   ; RUN

}
read_0334_end

