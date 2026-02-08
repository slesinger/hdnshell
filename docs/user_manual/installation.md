# How do I Install it?

The sweet spot is to use the C64 Ultimate or 1541 Ultimate cartridge with networking capabilities. However, if you do no have one there are other options. See below.

In a nutshell, for full functionality you need to:

1. Set BASIC ROM in the Ultimate menu.
2. Enable REU (recommended size 16MB) in the Ultimate menu.
3. Connect your Ultimate to the network (Ethernet or WiFi).
4. Run the HDN Shell server on your PC (optional yet very recommended for extended features).

## Using C64 Ultimate or 1541 Ultimate

## Alternative Options 

### BASIC ROM Replacement (manual install with Ultimate)

1. Download the latest `hdnsh.bin` from the [Releases](https://github.com/slesinger/hdnshell/releases) page. Then place it into the `roms` folder in Ultimate `flash` partition. Next, in the Ultimate menu, go to `Settings` -> `Memory & ROMs` and set the `BASIC ROM` to `hdnsh.bin`.

2. Enable REU (recommended size 16MB) in the Ultimate menu under `Settings` -> `Memory & ROMs` -> `RAM Expansion Unit` set to Enabled and set `Size` to 16MB.

3. Enable `Command Interace` in the same menu to give C64 access to Ultimate features like filesystem and networking.

4. Enter `Network Services & Timezone` menu and enable `Ultimate DMA Service` (for fast transfers from cloud). Do not forget to configure your network settings (Ethernet or WiFi) as needed.

5. Save the settings and reboot your C64.

### Without C64 Ultimate

You can benefit from using a general RAM expansion unit (REU). Without Ultimate there is no alternative networking interface support as of now, so cloud features will not be available. Support the new Commodore by getting the C64U now 🙂 and continue the setup as described above.

## How do I Verify it Works?

After switching on your C64, you should see a command prompt like this:

```
    **** COMMODORE 64 SHELL V1 ****

 16M REU ULTIMATE-II DOS V1.2, HONDANI
```

If first line is displayed like this, the BASIC ROM has been enabled correctly.

The second line depends on your hardware configuration. If `Command Interace` has been enabled correctly, you should see `ULTIMATE-II DOS V1.2` part.

You can use `info` command to display more detailed information about your setup. The `@` command shows the status of the last operation, like connecting to cloud server.
