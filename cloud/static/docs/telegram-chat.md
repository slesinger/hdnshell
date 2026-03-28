# Telegram Chat (Console 5)

The Telegram Chat console is a full Telegram client that runs as a server-side console (Console 5). Press **`C=+5`** to switch to it at any time.

The server connects to Telegram using the MTProto protocol via the Telethon library. Your account credentials are stored securely on the server — the C64 only sends and receives screen data and keystrokes.

> **Requires:** A Telegram account and Telegram API credentials (`api_id` / `api_hash`) configured in the server settings. See [Cloud Integration](cloud-integration.md).

---

## First-Time Login

On first use you will be taken through the login flow:

1. **Phone number** — enter your Telegram phone number in international format (e.g. `+420123456789`) and press `RETURN`.
2. **Confirmation code** — Telegram sends a code to your phone or another Telegram session. Enter it and press `RETURN`.
3. **Two-factor authentication** — if your account has 2FA enabled, enter your password and press `RETURN`.

Once logged in your session is saved on the server and you will not need to log in again unless the session expires.

---

## Modes

| Mode | How to enter | Description |
|------|-------------|-------------|
| Chat List | `F1` / startup | Browse all your Telegram chats |
| Chat View | `RETURN` on a chat | Read and reply to messages |
| Contacts | `F3` | Browse contacts and start new chats |
| Settings | `F2` | Account and app settings |
| Help | `F8` | Show keyboard reference |

---

## Layout

```
 Row  0 │ TELEGRAM   [Chat List]                     │  ← title bar
 Row  1 │                                            │
   ...  │   content (chats / messages / contacts)    │  ← content area
 Row 23 │                                            │     (23 rows)
 Row 24 │ status / input area                        │  ← status / input
```

Unread message counts are shown in **yellow** next to the chat name. Group chats are shown in **green**, private chats in light blue.

---

## Keyboard Reference

### Chat List

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select chat |
| `F5` / `F3` | Page down / page up |
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
