# Using the HDN Shell

## Commands

`info` — Display detailed information about the system status, including cloud connection, Ultimate storage status, and more.

`time` — Display the current time from the C64U RTC (Real Time Clock). It may take a moment to fetch the time from the NTP Internet time.

`reset` — Reset the C64, similar to pressing the reset button. Memory is preserved.

`frz` — Freeze the current state of the CLI and enter the Ultimane menu.

## Terminal buffer

Like in modern terminal emulators, the HDN Shell has a scrollable terminal buffer. This means that when the output exceeds the visible screen area, it will automatically scroll up to accommodate new lines. You can scroll back through the history of commands and outputs using the keyboard shortcuts.

`F1` — Scroll up one line
`F7` — Scroll down one line

Typing anything while the buffer is scrolled up will automatically scroll back to the latest output, ensuring that you are always seeing the most recent information.

## Special Keys

Pressing `CTRL` while listing directory or viewing long listings will slow down the output for better readability.

`SHIFT+RETURN` - move to next line without executing command on current line.


