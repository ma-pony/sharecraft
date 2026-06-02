# Images — 海报 / 社媒卡片 / 代码截图 / 信息图 / 平台排版

Pick the tool by what the image *is*. Always set the aspect ratio first (see `methodology.md` table)
and run the image/poster checklist before handing over. The thumbnail test is the gate: if the core
message isn't legible at feed size, it's not done.

## Decision guide

| You want | Use |
|----------|-----|
| Custom-designed poster/card, full control of layout | **HTML/CSS → PNG** (`scripts/html_to_image.py`) — the most flexible, zero-app path |
| Programmatic / batch image generation (OG images, covers) | **Satori** (Vercel) — HTML/CSS → SVG in code |
| Markdown text → a clean poster/card fast | **markdown-to-image** (gcui-art); **Madopic** if you need formulas/charts inline |
| 小红书 carousel / 公众号 cover (correct ratios) | **HTML→PNG** with a templated loop — see `combine.md` |
| Drag-and-drop editor, templates, e-commerce/长图/封面 | **poster-design 迅排设计** (palxiao) |
| 公众号 / 知乎 / 头条 article typesetting | **文颜 wenyan** (caol64) |
| Beautiful screenshot of source code | **Carbon** / **ray.so** / **CodeImage** |
| Diagram / architecture / flow / infographic | **Excalidraw**, **Mermaid**, **Draw.io** |

## HTML/CSS → PNG — the universal engine (recommended default for custom designs)

For anything bespoke (launch cards, covers, infographics, quote cards), authoring an HTML/CSS file and
rendering it to PNG gives total control and consistent output. This is the backbone many recipes share.

### Setup (once)
```bash
pip install playwright && playwright install chromium
# or: npx playwright install chromium  (Node projects)
```

### Use the bundled renderer
```bash
python scripts/html_to_image.py card.html card.png --width 1080 --height 1440   # 小红书 3:4
python scripts/html_to_image.py card.html card.png --width 1600 --height 900    # Twitter 16:9
python scripts/html_to_image.py card.html card.png --selector "#card"           # crop to one element
python scripts/html_to_image.py card.html card.png --width 1080 --full-page     # long image (公众号)
```
Author `card.html` with the design principles from `methodology.md`: one focal point, ≤2 fonts, ≤1
accent color, generous margins, large headline. Use web fonts via `@font-face` or system fonts. The
bundled `frontend-design` and `canvas-design` skills are excellent for producing the HTML itself.

## Satori (programmatic HTML/CSS → image, in code)

Vercel's library that turns HTML/CSS (via JSX) into SVG (then PNG via resvg). Best for **batch /
automated** generation — OG images, per-post covers, templated card series — where you want code, not
a GUI. This is how Next.js makes dynamic social images. Use it over the Playwright path when you need
many images from data without a browser.
```bash
npm install satori @resvg/resvg-js
```
```js
import satori from 'satori'
const svg = await satori(<div style={{display:'flex'}}>Hello</div>,
  { width: 1200, height: 630, fonts: [/* load a .ttf */] })
```
Note: Satori supports a subset of CSS (flexbox-centric) — for arbitrary CSS, use the Playwright engine.

## markdown-to-image (Markdown → poster, fast)

React component + deployable web editor. Great for text-forward cards (quotes, tips, announcements);
supports copy-as-image straight into WeChat.
```bash
git clone https://github.com/gcui-art/markdown-to-image && cd markdown-to-image
npm install && npm run dev    # web editor; paste Markdown, pick theme, export image
```
Use it when content is already Markdown and you want a polished card without hand-writing CSS. If the
card needs **formulas / Mermaid / ECharts** inline, **Madopic** (`xiaolinbaba/Madopic`) is a good
alternative with the same MD→poster flow.

> For 小红书 carousels and 公众号 covers, don't hunt for a niche single-purpose tool — author one HTML
> template and loop it through `scripts/html_to_image.py` at the right ratio. It's more reliable and
> fully under your control. See the carousel/cover recipe in `combine.md`.

## poster-design 迅排设计 (full visual editor)

A稿定设计-style online image editor: posters, e-commerce images, long article images, video/公众号
covers, with templates and layers. Best when the user wants to drag things around or iterate visually.
```bash
git clone https://github.com/palxiao/poster-design && cd poster-design
# Monorepo (pnpm). Check its README for the web app + Node service; run the frontend for the editor.
pnpm install && pnpm dev
```
Reach for this for design-heavy, multi-layer work rather than programmatic generation.

## 文颜 wenyan (公众号 / 知乎 / 头条 typesetting)

Turns Markdown into beautifully typeset, platform-ready HTML you paste straight into the editor — no
account/API needed; it's about formatting, not publishing. Ideal for long-form article sharing.
- Desktop app / CLI: https://github.com/caol64/wenyan — paste Markdown, pick a theme, copy formatted
  output into the WeChat/Zhihu editor. Pair with markdown-to-image for the in-article images/cards.

## Code screenshots — Carbon / ray.so / CodeImage

For sharing a snippet beautifully. All run in-browser, no keys.
- **Carbon** — https://carbon.now.sh (or self-host `carbon-app/carbon`). Most themes/options.
- **ray.so** — https://ray.so (`raycast/ray-so`). Clean, fast.
- **CodeImage** — https://codeimage.dev (`riccardoperra/codeimage`). Self-hostable, multi-tab.
- For batch/programmatic code images, render code as HTML (Shiki highlighter) and use the HTML→PNG
  engine above — fully scriptable.
Choose a theme that matches the share's context; highlight only the lines that matter; crop tight.

## Diagrams & infographics — Mermaid / Excalidraw / Draw.io

- **Mermaid** (`mermaid-js/mermaid`): text → flowchart/sequence/gantt. Render to SVG/PNG via the CLI:
  ```bash
  npm install -g @mermaid-js/mermaid-cli
  mmdc -i diagram.mmd -o diagram.png -w 1600 -b transparent
  ```
  A Mermaid diagram is reusable across a deck, a card, and a video — see `combine.md`.
- **Excalidraw** (`excalidraw/excalidraw`): hand-drawn-style whiteboard, great for approachable
  architecture sketches. Use excalidraw.com or self-host; export PNG/SVG.
- **Draw.io / diagrams.net**: precise, full-featured general diagramming; self-hostable.

## Finishing touches

- Add device/browser frames or backgrounds to plain screenshots with **Screenshot Studio**
  (`KartikLabhshetwar/screenshot-studio`) — frames, 3D, markup, no watermark.
- Always re-check against the image checklist in `methodology.md` (thumbnail test, hierarchy, ratio).
