# Using the HDN Shell

## Commands

`status` — Display the firmware identify string, local IP/netmask/gateway, and whether the cloud server is reachable.

`time` — Display the current time from the C64U RTC (Real Time Clock). It may take a moment to fetch the time from the NTP Internet time.

`reset` — Reset the C64, similar to pressing the reset button. Memory is preserved.

`menu` — Freeze the current state of the CLI and enter the Ultimate menu.

`help` — Ask the cloud a question, or (if unreachable) print a short local pointer.

For directory navigation (`cd`, `pwd`, `ll`/`dir`, `#<device>`), disk images (`mnt`/`umnt`), and file transfer (`mkdir`, `cp`), see [Navigating Disk Drives and Directories](dos.md). For saving/loading raw memory blocks, see [Memory Operations](memory-operations.md).

Anything typed that isn't one of the commands above (or valid BASIC) is forwarded to the cloud chatbot automatically — there's no need to prefix it with anything.

## Terminal buffer

Like in modern terminal emulators, the HDN Shell has a scrollable terminal buffer. This means that when the output exceeds the visible screen area, it will automatically scroll up to accommodate new lines. You can scroll back through the history of commands and outputs using the keyboard shortcuts.

`F1` — Scroll up one line
`F7` — Scroll down one line

Typing anything while the buffer is scrolled up will automatically scroll back to the latest output, ensuring that you are always seeing the most recent information.

## Special Keys

Pressing `CTRL` while listing directory or viewing long listings will slow down the output for better readability.

`SHIFT+RETURN` - move to next line without executing command on current line.


