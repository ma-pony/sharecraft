# Images — 海报 / 社媒卡片 / 代码截图 / 信息图 / 平台排版

Pick the tool by what the image *is*. Always set the aspect ratio first (see `methodology.md` table)
and run the image/poster checklist before handing over. The thumbnail test is the gate: if the core
message isn't legible at feed size, it's not done. Cross-medium visual rules — code-block style,
directed-edge diagrams, palette tokens, the two registers, the anti-pattern check — live in
**`design-system.md`** (§3–4, §6–7); this file adds only what's image-specific (ratios, 4-band density,
中文 type scale, image sourcing).

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
python scripts/html_to_image.py deck.html out/ --ids cover p2 p3 p4 --width 1080 --height 1440
                                                          # batch: one PNG per #id, single browser
python scripts/html_to_image.py card.html card.png --wait-for-webgl 800          # canvas/grain bg
```
Author `card.html` with the design principles from `methodology.md`: one focal point, ≤2 fonts, ≤1
accent color, generous margins, large headline. Use web fonts via `@font-face` or system fonts. The
bundled `frontend-design` and `canvas-design` skills are excellent for producing the HTML itself.

**Batch a carousel/cover in one file.** Put every card as a sibling element with a unique `id`
(`<section id="cover">…</section><section id="p2">…</section>`) in one HTML, then render them all with
`--ids` — one browser session, consistent fonts/tokens, 5–8× faster than re-launching per card. If the
design has a WebGL/grain/ink-wash background that renders a frame late, add `--wait-for-webgl 800` so it
isn't captured blank.

## Card layout recipes — pick a layout, then fill it (don't free-style every time)

The #1 failure on 小红书/social cards is each card looking different and verticals coming out
half-empty. Borrowed from how `guizang-social-card-skill` works: **choose a named layout first, then
pour content into it.** A small set covers most needs — name them, honor their minimum density, and a
series stays coherent. These are skeletons, not themes; apply your one accent + ≤2 fonts on top.

| ID | Layout | Best for | Min density / rule |
|----|--------|----------|--------------------|
| **XC01** | Hero image + 1 headline overlay | covers, openers, single statement | image fills frame; headline ≤10 字; legible at 360px |
| **XC02** | Headline + 2–4 key points | tips, takeaways, "N 个方法" | each point a short line + 1 detail; points fill ≥70% height |
| **XC03** | Big number / data + label | stat, result, before→after | one number dominates; ≤6 字 caption; no chartjunk |
| **XC04** | Pull-quote | quotes, manifestos, hooks | quote is the focal point; large type; attribution small |
| **XC05** | Numbered steps / flow | how-to, process, 教程 | 3–5 steps; consistent step block; arrows/numbers signal order |
| **XC06** | Image + text side-by-side | product, comparison, 图文 | image and text each own a column; aligned baseline |
| **XC07** | Index / TOC opener | carousel page 1, "本文目录" | list of the cards to come; one accent per item |
| **XC08** | Comparison table / grid | A vs B, feature matrix | ≤3 columns; Tufte (no chartjunk); cells breathe |

**3:4 density rule (the 4-band test).** After rendering a 1080×1440 card, mentally split the height into
four 360px bands. Each band must be either **Filled** (carries content) or **Justified empty** (a hero
image breathing, a one-line manifesto, deliberate leading at the open/close). If any single band is
**under-filled** (>15% ≈ >216px of unjustified blank), fix the *content*, don't pad with empty `flex:1`
elements: enlarge line-height, add a marginalia column, expand a point, or switch to a denser recipe
(e.g. XC01→XC02). Verticals that look "thin" almost always failed this test.

**小红书 carousel — platform conventions (learned the hard way):**

- **The set is one story, not loose cards.** A carousel must read as a sequence — each card self-contained
  *and* carrying the thread forward (cover hooks → each page advances one beat → last card lands the
  point). "看不懂 / 断片" means the arc broke; number the pages (`02/08`) and make each title continue the
  previous, don't drop the reader between cards.
- **Lean filled, not airy.** 小红书 readers expect content-rich cards; the generous-whitespace look that
  suits a landing page reads as "empty / 没料" here. Push the 4-band test toward **Filled** — more
  concrete content per card, less blank. (This is the §6 rule in action: density follows the platform.)
- **Link goes in the *comments*, not the card.** 小红书 posts can't carry a tappable link, so the CTA is
  **「链接在评论区」**, never "link in bio / 主页". Put the real URL in the first comment.

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

## 中文排版规格 (Chinese typography for cards)

`methodology.md` says "≤2 fonts, thumbnail-readable" — for Chinese cards that needs numbers. Sizes
below assume a **1080px-wide** canvas; scale proportionally for other widths.

**标题字号 by length (1080px wide).** Pick the size from the character count; if it won't fit, shorten
the copy — don't shrink the type:

| Headline shape | Size |
|----------------|------|
| 1 line, ≤6 字 | ~128px |
| 1 line, 7–10 字 | ~104px |
| 2 lines, ≤8 字/line | ~92px |
| 2 lines, 9–12 字/line | ~80px |

**Minimum readable sizes** (a phone downsamples the feed thumbnail, so floors matter):
body/paragraph ≥28px · subtitle/lead ≥30px · label/caption ≥20px · data annotation ≥22px.

**Font pairing (中英混排).** Title serif `Noto Serif SC` for editorial/magazine warmth, or sans
`Noto Sans SC` for clean/Swiss; English in `Inter`; labels/code in `IBM Plex Mono` / `JetBrains Mono`.
All on Google Fonts (`@font-face` or `<link>`), so they render under the Playwright engine. Keep it to
**one Chinese family + one Latin family** per card. Let CJK line-breaks fall where they read well
(don't break a 词 mid-way); pass the thumbnail test at 360px.

## 公众号封面 Pair (21:9 + 1:1, from one file)

WeChat's new cover wants **two** crops, and the 1:1 is NOT a center-crop of the banner. Always produce
both, in one HTML, and render with `--ids`:

- **Banner 21:9 → 2100×900** — the full layout (image + headline + optional kicker).
- **Square 1:1 → 1080×1080** — re-typeset for the small slot: big centered title, **no** subtitle, not
  a crop of the banner. It must read on its own at thumbnail size.

```bash
python scripts/html_to_image.py cover.html out/ --ids banner square --scale 2
# (set each element's own box to 2100×900 and 1080×1080)
```

**Title-shortener for the 1:1** (long banner title → tight square title): ① drop adverbs/qualifiers →
② keep verb + core noun → ③ aim for **4–8 字** → ④ no trailing ellipsis → ⑤ if still long, split the
idea, don't shrink the font.

## 没有图片时:先做一次 3 选 1 (image sourcing)

If the card wants a photo and the user gave none, ask **once** (don't re-prompt):

- **A — 你自己的图** (推荐,最不"AI 感"): a screenshot/photo they send.
- **B — 我去免费图库找**: Pexels (`https://www.pexels.com/zh-cn/search/<中文关键词>/` — 中文关键词
  effective for China scenes), Unsplash, or Openverse. Record each source URL in `assets/SOURCES.md`
  and tell the user in the final reply so they can credit/verify license.
- **C — AI 生成**: only if they prefer it; note it's AI-generated.

When overlaying text on a photo: map the subject first (Read the image, note face/focal position as an
HTML comment), compose **without** a mask, thumbnail-test at 360px, and add a tint **only if** it fails
— and make the tint image-toned, not a full black gradient that flattens the photo.

## Finishing touches

- Add device/browser frames or backgrounds to plain screenshots with **Screenshot Studio**
  (`KartikLabhshetwar/screenshot-studio`) — frames, 3D, markup, no watermark.
- Always re-check against the image checklist in `methodology.md` (thumbnail test, hierarchy, ratio).
