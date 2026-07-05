# Getting Started - Easy Install

### 1. Download the latest `hdnsh-server` from the [Releases](https://github.com/slesinger/hdnshell/releases/latest) page.
- [Linux](https://github.com/slesinger/hdnshell/releases/latest/download/hdnsh-server-linux)
- [Mac](https://github.com/slesinger/hdnshell/releases/latest/download/hdnsh-server-mac)
- [Windows](https://github.com/slesinger/hdnshell/releases/latest/download/hdnsh-server-win)

### 2. Run the `hdnsh-server` on your PC

> Make sure the file is executable (on Linux/Mac you may need to run:

```
chmod +x hdnsh-server-linux
```

It is better to run the server from terminal to see the logs and any potential errors.

![hdnsh-server-start.png|58%](../assets/hdnsh-server-start.png)

The process will scan your local network and look for your C64 Ultimate. It is __perfectly fine__ if you see `No C64 IPs found on the network.` message. It just means that your C64U is not connected, is powered off, or is not configured to connect to the network. You can proceed with the next steps and repeat the scan comfortably later.

### 3. Open Web UI

Open your browser and navigate to 

```
http://localhost:8064
```

You should see the HDN Shell Web UI.

![ui-start1.png|58%](../assets/ui-start1.png)


### 4. Follow instructions in the web UI to set up your C64 Ultimate

Depending on the status of your C64U, you will need to ensure the following. The main page will try to detect what needs to be done next.

- Power on your C64 Ultimate and connect it to the network (Ethernet or WiFi). The beautiful printed manual is your friend here.

At this stage IP address should be discoverable. Use the `Find you C64U` button in top right corner of the web UI to scan your network. Alternatively, you can restart the `hdnsh-server` to trigger the scan in the terminal.

- Enable network services and the command interface

At least `FTP file service` and `Ultimate DMA Service` should be enabled — the former allows file transfers between your PC and C64, the latter lets the server paint screens and inject programs directly into memory. Also enable the `Command Interface` (under `Settings` -> `C64 and Cartridge Settings`) so the cartridge can reach the Ultimate DOS and network. Optionally enable `Web Remote Control` too — it is required for the AI assistant's screen reading and for the web UI's memory inspector.

![network-services.png|58%](../assets/network-services.png)

### 5. Attach the HDN Shell RR cartridge

HDN Shell RR ships as a Retro Replay cartridge image, `hdn-rr38p-tmp12reu.crt`. The easiest way is to let the web UI do it: on the main page, once your C64U is detected and the network services are enabled, use **Download latest cartridge and put it in my C64 Ultimate** — it downloads the cartridge, patches in your HDN Server IP, and uploads it to `/Flash/carts`.

To do it by hand instead, download the latest `hdn-rr38p-tmp12reu.crt` from the [Releases](https://github.com/slesinger/hdnshell/releases/latest) page, copy it into `/Flash/carts` on the Ultimate storage (the web UI's [File Manager](file-manager.md) can upload it for you), then in the Ultimate menu select the `.crt` file and choose `Run Cartridge`.

Once installed, the web UI's **Enable Shell** / **Disable Shell** buttons start the cartridge (Run Cartridge) or reset back to stock BASIC. Because Run Cartridge does not change the Ultimate's saved configuration, a plain reset always returns you to the ordinary C64.

After a reset you land at the ordinary BASIC `READY.` prompt — that is correct: BASIC stays, the shell wedges in. Type `status` to verify the shell answers and to see whether the HDN Server is reachable.

> The older approach of replacing the BASIC ROM with `hdnsh.bin` (the `Set HDN Shell as BASIC ROM` button in the web UI) is outdated — see [Alternative Installation](installation_alternative.md) if you need it.

