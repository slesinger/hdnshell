# Navigating Disk Drives and Directories

This guide explains how to navigate disk drives and directories in the HDN Shell, inspired by modern command-line environments but tailored for the Commodore 64.

## Changing the Default Device

To set the default disk drive (device), use the drive number followed by a colon:

```
8:      # Set default device to drive 8
9:      # Set default device to drive 9
```

## Listing Files (Directory Listing)

- `dir` — List files on the default device.
- `<drive number>:dir` — List files on a specific device.

Examples:
```
dir            # List files on the default device
9:dir          # List files on device 9
```

## Loading and Saving Files

- `[<drive number>]load <name with wildcards> [<to address>]` — Load file from disk or tape.
- `[<drive number>]save "<name>" [<from address>] [<to address>]` — Save file to disk or tape.
- `[<drive number>]delete "<name>"` — Delete file from disk.

Examples:
```
load demo*         # Load files matching 'demo*' from default device
8:load test.prg    # Load 'test.prg' from device 8
save "backup"      # Save to default device
9:delete "old.prg" # Delete 'old.prg' from device 9
```

## Navigating Directories

The `CD` command is used to change directories, similar to Linux/Windows shells.

- `CD//` — Change to the root directory
- `CD/mydir/` — Enter directory "mydir" (relative)
- `CD//mydir/` — Enter directory "mydir" (absolute from root)
- `CD:←` — Go up one level (like `cd ..`)

Examples:
```
CD//           # Go to root
CD/games/      # Enter 'games' directory
CD:←           # Go up one directory
```

## Creating and Removing Directories

- `MD:mydir` — Create directory in the current location
- `MD/mydir/:otherdir` — Create directory inside another directory
- `MD//mydir/:otherdir` — Create directory absolute to root
- `RD:mydir` — Remove directory in current location (must be empty)
- `RD//mydir/:otherdir` — Remove directory absolute to root

Examples:
```
MD:projects         # Create 'projects' in current directory
MD//work/:2026      # Create '2026' inside 'work' at root
RD:oldstuff         # Remove 'oldstuff' from current directory
```

## Mounting and Unmounting Disk Images

The `CD` command can also mount disk images (D64/D71/D81) as directories:

- `CD:myimage.d64` — Mount image in current directory
- `CD/mydir/myimage.d64` — Mount image in subdirectory
- `CD//mydir/myimage.d64` — Mount image absolute from root
- `CD:←` — Unmount disk image (return to SD card directory)

Examples:
```
CD:demo.d64           # Mount 'demo.d64' in current directory
CD//images/game.d64   # Mount 'game.d64' from root/images
CD:←                  # Unmount and return to previous directory
```

## Finding Files

- `find <filename>` — Search for a file in the current directory or subdirectories.

Example:
```
find intro.prg
```

---

**Tip:** All commands are case-insensitive. Use the colon (`:`) and slashes (`/`) as shown for correct syntax.

For more details, see the full user manual or quick reference.
