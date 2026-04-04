# File Manager

The web-based File Manager gives you direct access to the Ultimate device storage from your browser. Open the HDN Cloud web UI, select `File Manager`, and make sure the status bar shows the IP address of your connected C64 Ultimate.

Use the breadcrumb bar at the top to jump straight to any parent directory. The `..` row goes one level up, while clicking a folder name opens that folder.

You can place files on the device in two ways:

- Drag files from your desktop into the upload area.
- Click `Upload Files` to choose one or more files with the file picker.
- Paste a direct CSDB download URL into the CSDB field and click `Import from CSDB` to download a release file straight to the current directory.

Available actions depend on the file type:

- `.prg`: `Run` loads and starts the program, `DMA` only loads it into memory.
- `.d64`, `.d71`, `.d81`: `Mount #8` mounts the disk image on drive 8.
- `.crt`: `Attach Cart` attaches the cartridge image.
- `.bin` in `/Flash/roms`: `BASIC ROM` sets that ROM as the active BASIC ROM.
- Text-like files such as `.txt`, `.cfg`, `.bas`, or `.asm`: `Edit` opens the built-in text editor.
- Any regular file: `Download` copies it to your PC and `Delete` removes it from the device.

Typical workflow:

1. Open `File Manager` and navigate to the target directory.
2. Upload a local file or import one from CSDB.
3. Use the action buttons next to the file to run, mount, attach, edit, or activate it.
4. Refresh the view if you want to confirm the new contents of the directory.
