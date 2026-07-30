# WhatsApp Chat (Console 9)

The WhatsApp Chat console is a WhatsApp client that runs as a server-side console (Console 9). Press **`C=+CTRL+9`** to switch to it at any time, or open it from the [Launcher](launcher.md).

The server links to WhatsApp as a **companion device** (the same mechanism as WhatsApp Web / WhatsApp Desktop) using the *neonize* / whatsmeow library. Your session is stored securely on the server — the C64 only sends and receives screen data and keystrokes.

> **Requires:** A WhatsApp account and your phone number configured in the server settings. Unlike Telegram, WhatsApp needs **no API id / hash**. See [Server Integration](cloud-integration.md).

> ⚠️ **Account safety:** This uses an *unofficial* multi-device client library. WhatsApp may flag or ban accounts that connect with unofficial clients. Consider linking a spare number, and use at your own risk.

---

## Configuration

The one required setting — your **phone number** — lives in the **HDN web UI**, not on the C64:

1. Open the HDN UI in a browser and go to the **Settings** page, then the **Messaging** tab.
2. Under the **WhatsApp** section, enter your phone number in international format (e.g. `+1234567890`) and press **Save All Settings**.

The F8 help screen inside the console points you back here. There is no on-C64 settings screen for WhatsApp.

---

## First-Time Login (linking your phone)

WhatsApp login is a single step — no SMS code and no 2FA prompt on the C64:

1. Configure your phone number in the UI Settings page (above).
2. Open the WhatsApp console. It requests and displays an **8-character pairing code** (shown as `ABCD-EFGH`).
3. On your phone, open **WhatsApp → Settings → Linked Devices → Link a device**, then tap **Link with phone number instead**.
4. Enter the 8-character code shown on the C64.

Once linked, the console connects automatically and shows your chats. The session is saved on the server, so you will not need to link again unless you log out or the session expires.

If the console shows *"No phone number configured"*, set the number in the UI Settings page and press `RETURN` to retry. If it shows *"WhatsApp library not installed"*, the server administrator needs to `pip install neonize`.

---

## Modes

| Mode | How to enter | Description |
|------|-------------|-------------|
| Chat List | startup / `F1` | Browse your WhatsApp chats |
| Chat View | `RETURN` on a chat | Read and reply to messages |
| Contacts | `F3` | Browse contacts and start new chats |
| Help | `F8` | Show keyboard reference & linking help |

WhatsApp settings are configured in the web UI, so there is no in-console settings mode.

---

## Layout

```
 Row  0 │ F1:Chats F3:Contacts F8:Help                │  ← title bar
 Row  1 │                                             │
   ...  │   content (chats / messages / contacts)     │  ← content area
 Row 23 │                                             │     (23 rows)
 Row 24 │ status / input area                         │  ← status / input
```

The title bar always shows **`F8:Help`** so help is one keypress away. Unread counts are shown in **yellow**, group chats in **green**, private chats in white.

---

## Keyboard Reference

### Chat List

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select chat |
| `C=+<` / `C=+>` | Page up / page down |
| `RETURN` | Open selected chat |
| `F3` | Open contacts |
| `F8` | Help |
| `HOME` | Refresh chats |

### Chat View

| Key | Action |
|-----|--------|
| `↑` / `↓` | Scroll messages |
| `C=+<` / `C=+>` | Page up / page down |
| Type text | Compose a message |
| `←` / `→` | Move input cursor |
| `C=+←` / `C=+→` | Jump one word left / right |
| `RETURN` | Send message |
| `DEL` | Backspace at cursor |
| `HOME` | Refresh messages |
| `RUN/STOP` | Return to chat list |
| `LEFT ARROW` | Return to chat list |

### Contacts

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select contact |
| `RETURN` | Open / start chat with contact |
| `F1` | Go to chat list |
| `F8` | Help |
| `RUN/STOP` | Back to chat list |
