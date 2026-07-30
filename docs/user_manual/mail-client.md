# Mail

The Mail console is an IMAP/SMTP email client that runs as a server-side console.

> **Note:** Mail is not yet assigned a `C=+CTRL` key combination. It will be reachable from the [Launcher](launcher.md) once that lands; this page describes the console itself.

The server connects to your mailbox over IMAP (to read) and SMTP (to send) using the Python standard library — no extra dependency. Your credentials live on the server; the C64 only sends and receives screen data and keystrokes. HTML mail is stripped to plain text for the 40×25 PETSCII display.

> **Requires:** An IMAP/SMTP email account configured in the HDN web UI Settings page. See [Configuration](#configuration) below.

---

## Configuration

Account credentials are configured **in the web UI Settings page**, not on the C64 — there is no on-device credential editor. Open the HDN web UI, go to **Settings → Messaging tab → Email**, and fill in:

| Field | Notes |
|-------|-------|
| IMAP Host / Port | e.g. `imap.gmail.com` / `993` |
| SMTP Host / Port | e.g. `smtp.gmail.com` / `587` |
| Username | usually your full email address |
| Password | **use an app-password** for Gmail / Fastmail / any account with 2FA |
| From Name | display name shown on messages you send |
| Security | `SSL/TLS` (default) or `STARTTLS` |

The password is stored in the server config in plain text (the same trust model as the Telegram API hash), so an app-password is strongly recommended over your main account password.

Until an account is configured, the Mail console shows an empty state pointing you here. After saving settings, switch to the console (or press `HOME`) to connect.

---

## Modes

| Mode | How to enter | Description |
|------|-------------|-------------|
| Message List | startup / `HOME` | Browse messages in the current folder (newest first) |
| Message View | `RETURN` on a message | Read a message, reply, forward, save attachments |
| Compose | `N` (list) or reply/forward | Write and send a message |
| Folders | `F2` | Pick a different folder |
| Help | `F8` | Show keyboard reference and setup note |

The **F8 help hint is always visible** in the status bar (row 24) on every screen.

---

## Layout

### Message list

```
 INBOX  (12 unread)              mail@me.io   ← title bar
 ---------------------------------------
 * Alice Smith    Re: invoice        09:14    ← unread (yellow)
   Bob            Lunch tomorrow      Mon      ← read (light blue)
 ! Bank Alert     Statement ready     Sun      ← flagged (red !)
   ...
 N:New F2:Fldr /Find F5:Refr  F8=HELP         ← status bar
```

Row layout (40 columns): `flags(2) sender(14) subject(..) date(6)`.

Markers: `*` = unread, `!` = flagged, `A` = has attachment, `R` = replied.

### Message view

```
 Re: invoice                     1/12   ← title (subject + position)
 From: Alice Smith                       ← sender (cyan)
 To:   me@me.io                          ← header labels (grey)
 Date: Tue 09:14        [A] 2 att        ← attachment tag (green)
 ---------------------------------------
 Hi, thanks for sending that over ...    ← body (wrapped)
 > previous quoted text dimmed grey      ← quoted text (dark grey)
 F3Reply F4All F7Fwd D-Del A-Att F8=HELP ← status bar
```

### Compose

```
 COMPOSE                     Draft saved
 To:  bob@work.io
 Cc:
 Sub: Re: Lunch tomorrow
 ---------------------------------------
 Sounds good, see you at noon.|          ← body with cursor
 TAB=Field F7=Send STOP=Draft F8=HELP
```

---

## Keyboard Reference

### Message List

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select message (auto-loads more near the end) |
| `C=+<` / `C=+>` | Page up / page down |
| `RETURN` | Open selected message |
| `HOME` / `F5` | Refresh |
| `F2` | Folders overlay |
| `/` | Search subject + from |
| `C=+/` (in search) | Full-text search (whole body) |
| `N` | New message (compose) |
| `D` | Delete (move to Trash) |
| `U` | Toggle read / unread |
| `S` | Toggle flag (star) |
| `#` | Archive |
| `F8` | Help |

### Message View

| Key | Action |
|-----|--------|
| `↑` / `↓` | Scroll |
| `C=+<` / `C=+>` | Page up / page down |
| `F3` | Reply |
| `F4` | Reply all |
| `F7` | Forward |
| `N` / `P` | Next / previous message |
| `D` | Delete (to Trash) |
| `A` | Attachments (list; `RETURN` saves to workspace) |
| `←` / `RUN/STOP` | Back to list |
| `F8` | Help |

### Compose

| Key | Action |
|-----|--------|
| `TAB` | Next field (To → Cc → Sub → Body) |
| `C=+TAB` | Previous field |
| `←` / `→` | Move cursor |
| `C=+←` / `C=+→` | Jump one word left / right |
| `RETURN` | New line (body) / next field (To/Cc/Sub) |
| `F7` | Send |
| `RUN/STOP` | Save draft and go back |
| `F8` | Help |

### Folders

| Key | Action |
|-----|--------|
| `↑` / `↓` | Select folder |
| `RETURN` | Open folder |
| `RUN/STOP` | Cancel |

---

## Notes

- **Search:** `/` searches the `SUBJECT` and `FROM` headers server-side. Hold `C=` while pressing `RETURN` to run a full-body `TEXT` search instead. Press `HOME` to leave the search results and return to the folder.
- **Delete & archive:** `D` moves the message to the server's Trash folder (detected via IMAP special-use, with common-name fallbacks). Inside Trash, `D` hard-deletes (`EXPUNGE`). `#` moves to the Archive / All Mail folder.
- **Replies & threading:** Reply pre-fills the recipient and `Re:` subject, quotes the original in dark grey with an attribution line, and sets the `In-Reply-To` / `References` headers. Reply-all adds the other recipients as Cc (minus yourself). On a successful send the message is appended to your Sent folder.
- **Attachments** are listed in the message view (`A`) and saved into your HDN workspace, where the Ultimate FTP layer can pull them to the C64.
- **New-mail notifications:** a background IMAP IDLE connection watches your inbox and raises a session toast (e.g. `Alice — Re: invoice`) when new mail arrives, even while you are in another console.
