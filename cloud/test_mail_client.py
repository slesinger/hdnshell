"""
Unit tests for the Mail (IMAP/SMTP) console (GH issue #23).

Covers the pure, dependency-free helpers that back the console:
  - HTML → plain-text stripping (footnotes, block tags, entities)
  - MIME header decoding and address parsing
  - IMAP FETCH response iteration + flag/attachment metadata parsing
  - IMAP LIST mailbox-name parsing and folder display
  - MIME body extraction (plain preferred, HTML fallback, attachments)
  - compose word-jump and cursor-aware wrapping

These run without a live IMAP/SMTP server. The IDLE push and on-screen
rendering are only verifiable on real C64U/HDN hardware.
"""

import email
import os
import sys

_CLOUD_DIR = os.path.dirname(os.path.abspath(__file__))
_APPS_DIR = os.path.join(_CLOUD_DIR, "server-apps")
if _APPS_DIR not in sys.path:
    sys.path.insert(0, _APPS_DIR)
if _CLOUD_DIR not in sys.path:
    sys.path.insert(0, _CLOUD_DIR)

import mail_client as mc  # noqa: E402


# ----------------------------------------------------------------------
# HTML → text
# ----------------------------------------------------------------------


class TestHtmlToText:
    def test_prefers_plain_structure(self):
        html = "<p>Hello</p><p>World</p>"
        out = mc._html_to_text(html)
        assert "Hello" in out and "World" in out
        assert "<p>" not in out

    def test_links_become_footnotes(self):
        html = 'See <a href="https://example.com/x">this</a> now.'
        out = mc._html_to_text(html)
        assert "[1]" in out
        assert "https://example.com/x" in out

    def test_entities_unescaped(self):
        assert "AT&T" in mc._html_to_text("<span>AT&amp;T</span>")

    def test_list_items_and_br(self):
        out = mc._html_to_text("<ul><li>one</li><li>two</li></ul>")
        assert "- one" in out
        assert "- two" in out

    def test_script_style_removed(self):
        out = mc._html_to_text("<style>.x{color:red}</style><p>hi</p>")
        assert "color:red" not in out
        assert "hi" in out

    def test_empty(self):
        assert mc._html_to_text("") == ""


# ----------------------------------------------------------------------
# Header decode + address parse
# ----------------------------------------------------------------------


class TestHeaders:
    def test_decode_mime_encoded(self):
        raw = "=?utf-8?q?Caf=C3=A9?="
        assert mc._decode_mime(raw) == "Café"

    def test_decode_plain(self):
        assert mc._decode_mime("Just text") == "Just text"

    def test_decode_none(self):
        assert mc._decode_mime(None) == ""

    def test_parse_address_full(self):
        name, addr = mc._parse_address("Alice Smith <alice@co.io>")
        assert name == "Alice Smith"
        assert addr == "alice@co.io"

    def test_parse_address_bare(self):
        name, addr = mc._parse_address("bob@work.io")
        assert addr == "bob@work.io"
        assert name == "bob"  # local part fallback

    def test_parse_address_encoded_name(self):
        name, addr = mc._parse_address("=?utf-8?q?Caf=C3=A9?= <c@x.io>")
        assert name == "Café"
        assert addr == "c@x.io"


# ----------------------------------------------------------------------
# FETCH response parsing
# ----------------------------------------------------------------------


class TestFetchParsing:
    def test_iter_fetch_items(self):
        data = [
            (b"1 (UID 5 FLAGS (\\Seen) BODY[HEADER] {10}", b"From: a\r\n"),
            b")",
            (b"2 (UID 6 FLAGS () BODY[HEADER] {10}", b"From: b\r\n"),
            b")",
        ]
        items = list(mc._iter_fetch_items(data))
        assert len(items) == 2
        assert items[0][1] == b"From: a\r\n"

    def test_parse_meta_flags_seen(self):
        uid, flags, attach = mc._parse_meta_flags(
            b"1 (UID 42 FLAGS (\\Seen \\Flagged))")
        assert uid == "42"
        assert "\\Seen" in flags and "\\Flagged" in flags
        assert attach is False

    def test_parse_meta_flags_attachment(self):
        meta = b'1 (UID 7 FLAGS () BODYSTRUCTURE (... ("attachment" ...)))'
        uid, flags, attach = mc._parse_meta_flags(meta)
        assert uid == "7"
        assert attach is True

    def test_parse_meta_flags_filename(self):
        meta = b'1 (UID 8 FLAGS () BODYSTRUCTURE (... "filename" "a.pdf"))'
        _uid, _flags, attach = mc._parse_meta_flags(meta)
        assert attach is True


# ----------------------------------------------------------------------
# LIST parsing + folder display
# ----------------------------------------------------------------------


class TestMailboxNames:
    def test_parse_quoted(self):
        line = '(\\HasNoChildren) "/" "INBOX"'
        assert mc._parse_list_mailbox(line) == "INBOX"

    def test_parse_gmail(self):
        line = '(\\HasChildren \\Trash) "/" "[Gmail]/Trash"'
        assert mc._parse_list_mailbox(line) == "[Gmail]/Trash"

    def test_parse_unquoted(self):
        line = "(\\HasNoChildren) NIL INBOX"
        assert mc._parse_list_mailbox(line) == "INBOX"

    def test_folder_display_gmail(self):
        assert mc._folder_display("[Gmail]/Sent Mail") == "Sent Mail"

    def test_folder_display_dovecot(self):
        assert mc._folder_display("INBOX.Archive") == "Archive"

    def test_quote_with_space(self):
        assert mc._quote("Sent Mail") == '"Sent Mail"'
        assert mc._quote("INBOX") == "INBOX"

    def test_status_num(self):
        assert mc._status_num("INBOX (MESSAGES 12 UNSEEN 3)", "MESSAGES") == 12
        assert mc._status_num("INBOX (MESSAGES 12 UNSEEN 3)", "UNSEEN") == 3


# ----------------------------------------------------------------------
# MIME body extraction
# ----------------------------------------------------------------------


class TestBodyExtraction:
    def test_plain_preferred(self):
        raw = (
            b"Content-Type: multipart/alternative; boundary=b\r\n\r\n"
            b"--b\r\nContent-Type: text/plain\r\n\r\nplain body\r\n"
            b"--b\r\nContent-Type: text/html\r\n\r\n<p>html body</p>\r\n"
            b"--b--\r\n"
        )
        msg = email.message_from_bytes(raw)
        text, atts = mc._extract_body(msg)
        assert "plain body" in text
        assert atts == []

    def test_html_fallback(self):
        raw = (
            b"Content-Type: text/html\r\n\r\n<p>only html</p>\r\n"
        )
        msg = email.message_from_bytes(raw)
        text, _atts = mc._extract_body(msg)
        assert "only html" in text

    def test_attachment_listed(self):
        raw = (
            b"Content-Type: multipart/mixed; boundary=b\r\n\r\n"
            b"--b\r\nContent-Type: text/plain\r\n\r\nhi\r\n"
            b"--b\r\nContent-Type: application/pdf\r\n"
            b'Content-Disposition: attachment; filename="doc.pdf"\r\n\r\n'
            b"JVBER\r\n--b--\r\n"
        )
        msg = email.message_from_bytes(raw)
        text, atts = mc._extract_body(msg)
        assert "hi" in text
        assert len(atts) == 1
        assert atts[0].filename == "doc.pdf"
        assert atts[0].mime == "application/pdf"


# ----------------------------------------------------------------------
# Compose text helpers
# ----------------------------------------------------------------------


class TestComposeHelpers:
    def test_word_left(self):
        assert mc._word_left("hello world", 11) == 6
        assert mc._word_left("hello world", 6) == 0

    def test_word_right(self):
        assert mc._word_right("hello world", 0) == 6
        assert mc._word_right("hello world", 6) == 11

    def test_wrap_cursor_columns(self):
        lines, cl, cc = mc._wrap_with_cursor("abcdef", 3, 4)
        assert lines == ["abc", "def"]
        assert cl == 1 and cc == 1

    def test_wrap_cursor_newline(self):
        lines, cl, cc = mc._wrap_with_cursor("ab\ncd", 40, 5)
        assert lines == ["ab", "cd"]
        assert cl == 1 and cc == 2

    def test_wrap_cursor_end(self):
        lines, cl, cc = mc._wrap_with_cursor("hi", 40, 2)
        assert cl == 0 and cc == 2


# ----------------------------------------------------------------------
# Catalog / registration
# ----------------------------------------------------------------------


class TestKeyDispatch:
    """Letter commands must work regardless of PETSCII case/charset."""

    def _console(self):
        # need_config path: constructs without touching the network.
        return mc.MailClientConsole(8, 999)

    def test_slash_opens_search(self):
        c = self._console()
        c.mode = mc.MODE_LIST
        c._key_list(0x2F, 0)  # '/'
        assert c.search_active is True

    def test_n_key_opens_compose(self):
        c = self._console()
        c.mode = mc.MODE_LIST
        # PETSCII 78 is the unshifted 'N' key; _printable maps it to 'n'.
        c._key_list(78, 0)
        assert c.mode == mc.MODE_COMPOSE

    def test_cbm_pages_list(self):
        c = self._console()
        c.mode = mc.MODE_LIST
        c.headers = [mc.MailHeader(uid=str(i)) for i in range(60)]
        c.list_sel = 0
        c._key_list(mc.KEY_SHIFT_PERIOD, mc.MOD_COMMODORE)  # C=+> page down
        assert c.list_sel > 0
        down = c.list_sel
        c._key_list(mc.KEY_SHIFT_COMA, mc.MOD_COMMODORE)  # C=+< page up
        assert c.list_sel < down

    def test_bare_angle_does_not_page(self):
        c = self._console()
        c.mode = mc.MODE_LIST
        c.headers = [mc.MailHeader(uid=str(i)) for i in range(60)]
        c.list_sel = 5
        c._key_list(mc.KEY_SHIFT_PERIOD, 0)  # no C= modifier
        assert c.list_sel == 5

    def test_compose_tab_cycles_fields(self):
        c = self._console()
        c._start_compose_new()
        assert c.compose_field == mc.FIELD_TO
        c._key_compose(mc.KEY_TAB, 0)
        assert c.compose_field == mc.FIELD_CC
        c._key_compose(mc.KEY_TAB, mc.MOD_COMMODORE)
        assert c.compose_field == mc.FIELD_TO


class TestRegistration:
    def test_mail_in_catalog(self):
        # Mail is now in APP_CATALOG (slot 8), reachable via the Launcher's
        # RETURN-to-open even though the wedge only wires C=+CTRL+1..7 chords.
        import cloud_server
        mail = next((a for a in cloud_server.APP_CATALOG if a.app_id == "mail"), None)
        assert mail is not None
        assert mail.default_slot == 8
        assert mail.factory is cloud_server.MailClientConsole
        assert cloud_server.MailClientConsole is mc.MailClientConsole

    def test_config_keys_present(self):
        from sdk.cloud_config_template import CONFIG_DEFAULTS
        for key in ("MAIL_IMAP_HOST", "MAIL_IMAP_PORT", "MAIL_SMTP_HOST",
                    "MAIL_SMTP_PORT", "MAIL_USER", "MAIL_PASS",
                    "MAIL_FROM_NAME", "MAIL_TLS"):
            assert key in CONFIG_DEFAULTS
        assert CONFIG_DEFAULTS["MAIL_IMAP_PORT"] == "993"
        assert CONFIG_DEFAULTS["MAIL_SMTP_PORT"] == "587"
        assert CONFIG_DEFAULTS["MAIL_TLS"] == "ssl"
