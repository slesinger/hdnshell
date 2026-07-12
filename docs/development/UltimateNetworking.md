# Ultimate Networking — Command Technical Reference

- **Author:** Scott Hutter
- **Version:** Draft 1.1
- **Source:** `UltimateNetworking.pdf`
- **Scope:** networking capabilities of the U64 and Ultimate II/+ cartridges.

> Author's own framing: "It is, admittedly, absolutely terrible documentation. But the hope is to
> get an understanding out on how to use these functions, and not so much any unnecessary detail
> beyond that." Kept here verbatim as a caveat about completeness/authority of this doc.

## Registers

The Ultimate devices communicate via three I/O registers:

| Register              | Address |
|------------------------|---------|
| Control Register        | `$DF1C` |
| Command Data Register   | `$DF1D` |
| Status Data Register    | `$DF1F` |

(Compare with `ultimate_audio_v0.2.md`, which maps its channel registers at `$DF20`+ — this
command-interface block at `$DF1C`–`$DF1F` sits just below it and does not overlap.)

## Targets

The first byte written through the Control Register / sent as part of a command is the
**Command Target**:

| Target | Value  | Meaning                                                        |
|--------|--------|------------------------------------------------------------------|
| DOS1    | `0x01` | Built-in UltimateDOS instance 1 — see `ultimate_dos-1.1.md`      |
| DOS2    | `0x02` | Built-in UltimateDOS instance 2 — see `ultimate_dos-1.1.md`      |
| Network | `0x03` | Networking commands (this document): connect, read/write socket |
| Control | `0x04` | Whole-cartridge control (e.g. force freeze menu) — undocumented, may change |

Targets 1/2 (DOS) let you address two independent filesystem contexts (mount disks, read
directories, etc.) — documented separately in the UltimateDOS command summary. Target 4
(Control) is explicitly **undocumented** and subject to change; not covered here.

This document covers **Target 3 (Network)**.

## Generic command protocol (applies to all targets)

Every command follows the same handshake pattern over the three registers. Below, `statusreg` =
`$DF1F`, `controlreg` = `$DF1C`, and the command bytes are written to the Command Data Register
`$DF1D`.

1. **Wait for idle.** Poll the status register until both bit 5 and bit 4 are clear:
   ```c
   while (!(((*statusreg & 32) == 0) && ((*statusreg & 16) == 0))) { /* wait */ }
   ```
   Equivalent 6502 assembly:
   ```asm
   wait:
       lda statusreg
       and #$30
       bne wait
   ```
2. **Write the command bytes** to the Command Data Register (`$DF1D`), starting with the target
   byte, then the command byte, then command-specific arguments.
3. **Push the command** by setting bit 0 of the Control Register:
   ```asm
   LDA #$01
   STA $DF1C
   ```
4. **Drain the Data Register** while data is available (bit 7 of status, `& 128 == 128`): read a
   byte, append to a data buffer, loop; stop when the bit clears.
5. **Drain the Status Register** the same way: while bit 7 is set, read a byte, append to a
   status buffer, loop. This buffer accumulates the ASCII status/response text for the command.
6. **Acknowledge** by setting bit 1 of the Control Register:
   ```c
   *controlreg |= 0x02;
   ```
7. At this point the command has fully completed; the accumulated status buffer describes success
   or failure, and (depending on command) the data buffer holds the returned payload.

This exact sequence (steps 1–6/7) is repeated for **every** command below, and — per the author —
for other command targets (DOS, Control) as well. Only the command bytes and what ends up in the
data/status buffers differ per command.

## Network Target (0x03) — command walkthroughs

### Connect (0x07)

Opens a TCP connection to a host:port.

Command bytes (target `0x03`):

| Byte  | Value                                    |
|-------|--------------------------------------------|
| 0     | `0x03` — Network Target                     |
| 1     | `0x07` — Connect command                    |
| 2     | Port low byte (example: port 6400 → `0x00`) |
| 3     | Port high byte (example: `0x19`)            |
| 4..X  | Hostname, **null-terminated**               |

Follow the generic protocol above. Specifics for Connect:
- **Data Register** (step 4) returns the **socket number** on success.
- **Status Register** (step 5) carries the connect result / error detail.
- After acknowledging (step 6), on success the socket number obtained in step 4 is used for
  subsequent read/write/close calls on this connection.

### Write data to socket (0x11)

Command bytes:

| Byte  | Value                                |
|-------|----------------------------------------|
| 0     | `0x03` — Network Target                |
| 1     | `0x11` — Socket write command          |
| 2     | Socket number (from Connect)           |
| 3..X  | Data to send, **null-terminated**      |

Follow the generic protocol. This command does not normally return data on the Data Register
(the author still drains it defensively, "but I call it anyway").

### Read data from socket (0x10)

Command bytes:

| Byte | Value                                   |
|------|--------------------------------------------|
| 0    | `0x03` — Network Target                     |
| 1    | `0x10` — Socket read command                |
| 2    | Socket number (from Connect)                |
| 3    | Length-to-read, low byte                    |
| 4    | Length-to-read, high byte                   |

Follow the generic protocol; the Data Register drain (step 4) yields the bytes read from the
socket.

### Close socket (0x09)

Command bytes:

| Byte | Value                          |
|------|----------------------------------|
| 0    | `0x03` — Network Target           |
| 1    | `0x09` — Socket close command     |
| 2    | Socket number (from Connect)      |

Follow the generic protocol. Normally returns no data.

## Command summary (Network target, 0x03)

| Command byte | Meaning                                |
|---------------|------------------------------------------|
| `0x02`         | Get Interface Count (only 1 currently)   |
| `0x05`         | Get IP Address                           |
| `0x07`         | Connect                                  |
| `0x09`         | Close connection                         |
| `0x10`         | Read data from socket                    |
| `0x11`         | Write data to socket                     |

Note: `0x02` (Get Interface Count) and `0x05` (Get IP Address) are listed in the summary table
but not individually walked through in the body of this draft — follow the same generic
protocol; consult firmware source or the C library below for their exact argument/response
payloads.

## Reference implementation

A C wrapper for these networking functions, plus UltimateDOS, for the cc65 compiler:
https://github.com/xlar54/ultimateii-dos-lib
