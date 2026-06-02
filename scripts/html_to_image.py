#!/usr/bin/env python3
"""Render an HTML/CSS file to a PNG — the universal image/poster/card engine for sharecraft.

Why this exists: hand-authored HTML/CSS gives total control over a share's visual design, and rendering
it deterministically to a PNG is the fastest path to a pixel-perfect poster, social card, code image, or
infographic — without standing up a heavy app. Many sharecraft recipes lean on this.

Setup (once):
    pip install playwright && playwright install chromium

Usage:
    python html_to_image.py card.html card.png                       # default 1080x1350
    python html_to_image.py card.html card.png --width 1600 --height 900
    python html_to_image.py card.html card.png --selector "#card"    # crop to one element's box
    python html_to_image.py card.html card.png --width 1080 --full-page   # long image (auto height)
    python html_to_image.py card.html card.png --scale 2             # 2x for retina-crisp output

Notes:
    - Accepts a local file path or an http(s) URL as the input.
    - --selector overrides --full-page (it screenshots just that element).
    - --scale multiplies pixel density (device_scale_factor); use 2 for sharp text.
"""
import argparse
import sys
from pathlib import Path


def main() -> int:
    p = argparse.ArgumentParser(description="Render HTML/CSS to PNG via headless Chromium.")
    p.add_argument("input", help="HTML file path or http(s) URL")
    p.add_argument("output", help="Output PNG path")
    p.add_argument("--width", type=int, default=1080, help="Viewport width in px (default 1080)")
    p.add_argument("--height", type=int, default=1350, help="Viewport height in px (default 1350)")
    p.add_argument("--scale", type=float, default=2.0, help="Device scale factor (default 2 = retina)")
    p.add_argument("--selector", help="CSS selector to crop the screenshot to a single element")
    p.add_argument("--full-page", action="store_true", help="Capture full scrollable page (long image)")
    p.add_argument("--wait", type=int, default=300, help="Extra wait in ms after load (fonts/anim)")
    args = p.parse_args()

    try:
        from playwright.sync_api import sync_playwright
    except ImportError:
        print(
            "Playwright is not installed. Run:\n"
            "    pip install playwright && playwright install chromium",
            file=sys.stderr,
        )
        return 1

    # Resolve a local path to a file:// URL; pass through http(s) untouched.
    src = args.input
    if not src.startswith(("http://", "https://", "file://")):
        path = Path(src).resolve()
        if not path.exists():
            print(f"Input file not found: {path}", file=sys.stderr)
            return 1
        src = path.as_uri()

    out = Path(args.output)
    out.parent.mkdir(parents=True, exist_ok=True)

    with sync_playwright() as pw:
        browser = pw.chromium.launch()
        page = browser.new_page(
            viewport={"width": args.width, "height": args.height},
            device_scale_factor=args.scale,
        )
        page.goto(src, wait_until="networkidle")
        page.wait_for_timeout(args.wait)

        if args.selector:
            el = page.query_selector(args.selector)
            if el is None:
                print(f"Selector not found: {args.selector}", file=sys.stderr)
                browser.close()
                return 1
            el.screenshot(path=str(out))
        else:
            page.screenshot(path=str(out), full_page=args.full_page)

        browser.close()

    print(f"Wrote {out}  ({args.width}x{'auto' if args.full_page else args.height} @ {args.scale}x)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
