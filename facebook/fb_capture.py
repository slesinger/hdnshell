#!/usr/bin/env python3
"""Manual Facebook group feed capture.

This script is intentionally user-driven:
- Runs in headed Chromium.
- Requires manual login confirmation.
- Extracts only visible post-like blocks from the currently loaded group page.
"""

from __future__ import annotations

import argparse
import json
import time
from datetime import datetime, timezone
from pathlib import Path
from typing import Any

from playwright.sync_api import TimeoutError as PlaywrightTimeoutError
from playwright.sync_api import sync_playwright


ROOT = Path(__file__).resolve().parent
DEFAULT_CONFIG = ROOT / "config.json"
DEFAULT_PROFILE_DIR = ROOT / ".session" / "chromium-profile"


def load_config(path: Path) -> dict[str, Any]:
    if not path.exists():
        raise FileNotFoundError(
            f"Config not found: {path}. Copy facebook/config.example.json to facebook/config.json first."
        )
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Manual Facebook group capture")
    parser.add_argument(
        "--config",
        type=Path,
        default=DEFAULT_CONFIG,
        help="Path to JSON config file (default: facebook/config.json)",
    )
    parser.add_argument(
        "--group-url",
        type=str,
        default=None,
        help="Optional override for group URL",
    )
    parser.add_argument(
        "--max-scrolls",
        type=int,
        default=None,
        help="Optional override for number of scroll cycles",
    )
    parser.add_argument(
        "--output-path",
        type=str,
        default=None,
        help="Optional override for JSON output file path",
    )
    return parser.parse_args()


def clean_text(value: str) -> str:
    return " ".join(value.split())


def extract_posts(page) -> list[dict[str, Any]]:
    posts: list[dict[str, Any]] = []

    # Facebook markup changes frequently; these selectors intentionally combine broad heuristics.
    article_blocks = page.locator("div[role='article']")
    count = article_blocks.count()

    for i in range(count):
        block = article_blocks.nth(i)
        text = clean_text(block.inner_text(timeout=1000) or "")
        if not text:
            continue

        link = ""
        try:
            link_locator = block.locator("a[href*='/groups/']").first
            if link_locator.count() > 0:
                href = link_locator.get_attribute("href")
                link = href or ""
        except PlaywrightTimeoutError:
            link = ""

        post = {
            "text": text[:2000],
            "link": link,
        }
        posts.append(post)

    # De-duplicate by (text, link)
    deduped: list[dict[str, Any]] = []
    seen: set[tuple[str, str]] = set()
    for post in posts:
        key = (post["text"], post["link"])
        if key in seen:
            continue
        seen.add(key)
        deduped.append(post)

    return deduped


def main() -> int:
    args = parse_args()
    cfg = load_config(args.config)

    group_url = args.group_url or cfg.get("group_url", "")
    max_scrolls = int(args.max_scrolls if args.max_scrolls is not None else cfg.get("max_scrolls", 8))
    pause_seconds = float(cfg.get("scroll_pause_seconds", 2.5))
    output_path = Path(args.output_path or cfg.get("output_path", "facebook/output/group_capture.json"))

    if not group_url or "facebook.com/groups" not in group_url:
        raise ValueError("Config must provide a valid group_url under https://www.facebook.com/groups/...")

    output_path.parent.mkdir(parents=True, exist_ok=True)
    DEFAULT_PROFILE_DIR.mkdir(parents=True, exist_ok=True)

    with sync_playwright() as pw:
        context = pw.chromium.launch_persistent_context(
            user_data_dir=str(DEFAULT_PROFILE_DIR),
            headless=False,
            viewport={"width": 1440, "height": 960},
        )

        page = context.new_page()
        page.goto("https://www.facebook.com/", wait_until="domcontentloaded")

        print("Browser opened.")
        print("1) Log in manually if needed.")
        print("2) Complete any checkpoint prompts in browser.")
        input("Press Enter here when login is complete and you are ready to continue... ")

        page.goto(group_url, wait_until="domcontentloaded")
        print(f"Navigated to group page: {group_url}")

        all_posts: list[dict[str, Any]] = []
        for idx in range(max_scrolls):
            batch = extract_posts(page)
            all_posts.extend(batch)

            page.mouse.wheel(0, 2800)
            time.sleep(pause_seconds)
            print(f"Scroll {idx + 1}/{max_scrolls} complete. Collected (raw): {len(all_posts)}")

        # Global dedupe pass
        deduped: list[dict[str, Any]] = []
        seen: set[tuple[str, str]] = set()
        for post in all_posts:
            key = (post["text"], post["link"])
            if key in seen:
                continue
            seen.add(key)
            deduped.append(post)

        result = {
            "captured_at": datetime.now(timezone.utc).isoformat(),
            "group_url": group_url,
            "post_count": len(deduped),
            "posts": deduped,
        }

        with output_path.open("w", encoding="utf-8") as f:
            json.dump(result, f, ensure_ascii=False, indent=2)

        print(f"Saved capture to {output_path}")
        input("Press Enter to close browser... ")
        context.close()

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
