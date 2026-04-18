# Facebook Manual Capture (Isolated Draft)

This folder contains a user-driven Facebook capture tool designed for your use case:

- You log in manually in a visible browser window each run.
- The script captures only content currently visible in the group feed page.
- No OAuth app setup is required.
- No cookie/session export is performed by this tool.

## Important

Use this only for content you are authorized to access and process. Facebook may restrict automated extraction, so keep this workflow user-initiated and transparent.

## Setup

From repository root:

```bash
source venv/bin/activate
pip install -r facebook/requirements.txt
playwright install chromium
```

## Configuration

Copy config template:

```bash
cp facebook/config.example.json facebook/config.json
```

Edit `facebook/config.json`:

- `group_url`: URL of your closed group page.
- `max_scrolls`: Number of feed scroll cycles.
- `scroll_pause_seconds`: Delay after each scroll.
- `output_path`: JSON output location.

## Run

```bash
python facebook/fb_capture.py --config facebook/config.json
```

Flow:

1. Browser opens in headed mode.
2. You manually log in (if needed).
3. Tool waits for your Enter key confirmation in terminal.
4. Tool visits the group feed page.
5. Tool scrolls and extracts visible post blocks.
6. Tool saves JSON output.

## Notes

- Session profile is stored under `facebook/.session/chromium-profile`.
- Extracted data is intentionally minimal: post text snippet, permalink-like URL if available, and timestamp of capture.
- If selectors stop working, update extraction logic in `facebook/fb_capture.py`.