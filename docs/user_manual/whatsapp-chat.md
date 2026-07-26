# WhatsApp Chat (Console 8)

The WhatsApp Chat console is a WhatsApp client that runs as a server-side console (Console 8). Press **`C=+CTRL+8`** to switch to it at any time.

> **⚠️ Account ban risk.** WhatsApp does not offer an official API for personal accounts. This console connects using **neonize** (Python bindings for the [whatsmeow](https://github.com/tulir/whatsmeow) library), the same *unofficial* multi-device protocol used by WhatsApp Web — not something WhatsApp has blessed for this purpose. WhatsApp may flag or ban an account that uses it. **Test with a spare/secondary phone number first, not your primary number**, and use it at your own risk.

The server connects to WhatsApp using the unofficial multi-device (whatsmeow) protocol via the neonize library. Your linked-device session is stored on the server — the C64 only sends and receives screen data and keystrokes.

> **Requires:** A WhatsApp account on a phone that can add a linked device. See [Server Integration](cloud-integration.md).

---

## First-Time Login (phone pairing code)

WhatsApp has no per-app API credentials like Telegram, and no code sent to your phone — instead the server asks WhatsApp for an 8-character **pairing code** that you type into the WhatsApp app on your phone:

1. **Phone number** — enter your WhatsApp phone number with country code, digits only, no `+` (e.g. `1234567890`), and press `RETURN`.
2. The server requests a pairing code and displays it on screen.
3. On your phone: **WhatsApp → Settings → Linked Devices → Link a Device → "Link with phone number instead"**, then type the code shown on the C64 screen.
4. Once your phone confirms the link, the console switches to the chat list automatically — no further action needed.

Once linked, your session is saved on the server and you will not need to pair again unless you log out or the phone unlinks the device.

---

## Modes

| Mode | How to enter | Description |
|------|-------------|-------------|
| Chat List | `F1` / startup | Browse recent WhatsApp chats |
| Chat View | `RETURN` on a chat | Read and reply to messages |
| Contacts | `F3` | Browse contacts and start new chats |
| Settings | `F2` | Account and app settings |
| Help | `F8` | Show keyboard reference and the ban-risk note |

---

## Layout

```
 Row  0 │ WHATSAPP   [Chat List]                     │  ← title bar
 Row  1 │                                            │
   ...  │   content (chats / messages / contacts)    │  ← content area
 Row 23 │                                            │     (23 rows)
 Row 24 │ status / input area                        │  ← status / input
```

Unread message counts are shown in **yellow** next to the chat name. Group chats are shown in **green**, private chats in white.

The chat list and message history are built up locally on the server from WhatsApp's initial history sync plus live messages as they arrive — WhatsApp (unlike Telegram) has no on-demand "fetch chat list" API, so a brand-new pairing may take a few moments to populate before chats appear.

---

## Keyboard Reference

### Chat List

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select chat |
| `F5` | Page down |
| `RETURN` | Open selected chat |
| `F2` | Open settings |
| `F3` | Open contacts |
| `F8` | Help |

### Chat View

| Key | Action |
|-----|--------|
| `↑` / `↓` | Scroll messages |
| `F5` / `F3` | Page down / page up |
| Type text | Compose a message |
| `←` / `→` | Move input cursor |
| `C=+←` / `C=+→` | Jump one word left / right |
| `RETURN` | Send message |
| `DEL` | Backspace at cursor |
| `RUN/STOP` | Return to chat list |
| `LEFT ARROW` | Return to chat list |

### Contacts

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select contact |
| `RETURN` | Open / start chat with contact |
| `F1` | Go to chat list |
| `F2` | Open settings |

### Settings

| Field | Description |
|-------|-------------|
| Phone Number | WhatsApp phone number used for pairing |
| Timezone | Used to format message timestamps |
| Login | Start the pairing-code login flow |
| Logout | Unlink this device from WhatsApp |
