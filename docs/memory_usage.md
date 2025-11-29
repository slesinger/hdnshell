## Free Memory Areas in C64 RAM

$range_from	$range_to	bytes	original purpose
$0002	$0006	5	Unused zero page bytes
$002A	$002A	1	Unused zero page byte
$0052	$0052	1	Unused zero page byte
$0073	$008A	24	CHRGET routine (can be repurposed if not using BASIC interpreter)
$008B	$008F	5	RND() previous result (safe if not using BASIC)
$00A5	$00A5	1	Serial bus timeout (unused)
$00FB	$00FE	4	Unused zero page bytes
$0313	$0313	1	Unused 
$032E	$032F	2	Unused
$0334	$033B	8	Unused
$02A7	$02FF	89	Unused RAM (end of system variables)
$03FC	$03FF	4	Unused (end of datasette buffer)
$0200*	$0258	89	Input buffer (can be used if not using screen input)
$0259	$0280	40	File tables, keyboard buffer (can be used if not using BASIC I/O)
$0281	$0284	4	Pointers after memory test (can be used if not using BASIC)
$0285	$028D	9	Various system variables (some are unused or rarely used)
$028E	$0290	3	Previous shift key, conversion routine pointer (can be used if not using keyboard routines)
$0292	$0292	1	Scroll direction switch during scrolling the screen
$0293	$02A6	22	RS232 temp variables (can be used if not using RS232 or screen scroll)
$07E8	$07F7	16	Unused (end of screen memory)
$0800	$0800	1	Unused (must be zero for BASIC, otherwise free)

## memory used by MujBASIC

$0200	$0258	89	Input buffer
$00B2   $00B3    2	Repurposable indirect address pointer