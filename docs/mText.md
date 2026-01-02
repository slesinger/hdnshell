# MText Reference

## Color Formatting

| Code  | Color         | Example (hex)      |
|-------|--------------|--------------------|
| $E0   | Black        | `$E0Hello`         |
| $E1   | White        | `$E1Hello`         |
| $E2   | Red          | `$E2Hello`         |
| $E3   | Cyan         | `$E3Hello`         |
| $E4   | Purple       | `$E4Hello`         |
| $E5   | Green        | `$E5Hello`         |
| $E6   | Blue         | `$E6Hello`         |
| $E7   | Yellow       | `$E7Hello`         |
| $E8   | Orange       | `$E8Hello`         |
| $E9   | Brown        | `$E9Hello`         |
| $EA   | Light Red    | `$EAHello`         |
| $EB   | Dark Grey    | `$EBHello`         |
| $EC   | Medium Grey  | `$ECHello`         |
| $ED   | Light Green  | `$EDHello`         |
| $EE   | Light Blue   | `$EEHello`         |
| $EF   | Light Grey   | `$EFHello`         |

## Semantic Styles

| Code  | Style           | Example (hex)      |
|-------|-----------------|--------------------|
| $F0   | Normal Text     | `$F0Hello`         |
| $F1   | Strong Text     | `$F1Hello`         |
| $F2   | Emphatic Text   | `$F2Hello`         |
| $F3   | Link Text       | `$F3Click here`    |

## Justification

| Code  | Justification        | Example (hex)      |
|-------|----------------------|--------------------|
| $F4   | Left                 | `$F4Hello`         |
| $F5   | Right                | `$F5Hello`         |
| $F6   | Center               | `$F6Hello`         |
| $F7   | Full                 | `$F7Hello`         |

*Justification code must be first byte of a paragraph.*

## Horizontal Rule

| Code  | Description         | Example (hex)      |
|-------|---------------------|--------------------|
| $F8   | Horizontal Rule     | `$F8$2A`           |

*Draws a rule using the character after $F8 (e.g., `$F8$2A` draws a line of asterisks).*

## Links

| Code  | Description         | Example (hex)                |
|-------|---------------------|------------------------------|
| $F3   | Link Text           | `$F3Link$02value$03$F0`      |
| $02   | Start of Value (STX)|                              |
| $03   | End of Value (ETX)  |                              |

*Example: `$F3Click here$02http://url$03$F0`*

## Notes

- All codes are single bytes in the $E0–$FF range (Block 8).
- Styles are not nested; to end a style, insert another style marker (e.g., `$F0` for Normal).
- Styles and justification reset at the start of each paragraph (after a line ending).
- To ignore MText formatting, skip all $E0–$FF bytes and all bytes between $02 (STX) and $03 (ETX).
- For horizontal rules, the character after $F8 is repeated across the line.

---

**Example:**

```
$F4$F1Hello $F2world$F0!
$F8$2D
$F3Link$02http://url$03$F0
```

*Left-justified, "Hello" in strong, "world" in emphatic, horizontal rule of dashes, and a link.**Left-justified, "Hello" in strong, "world" in emphatic, horizontal rule of dashes, and a link.*