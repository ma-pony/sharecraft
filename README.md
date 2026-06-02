# Sharecraft

> A Claude Code skill that makes share-worthy **slide decks, posters/cards/images, and explainer videos** — by pairing best-in-class **local, zero-API** open-source tools with a real *"how to make a great share"* methodology.

Tools make output *fast*. They don't make it *good*. A pretty slide that buries its point, a card that's unreadable as a thumbnail, a 5-minute video that should've been 90 seconds — these all pass the "I used a nice tool" test and still fail the audience. **Sharecraft fixes the part the tools leave out**: it forces a short thinking pass (who's the audience, what's the one takeaway, where will this be consumed), then drives the right open-source tool to produce the artifact — and self-reviews it against the principles that make each medium land.

## What it does

When you ask Claude to make something shareable, Sharecraft kicks in and:

1. **Thinks first** — audience, the single takeaway, the action you want, the medium & platform (this decides aspect ratio and length more than anything), and the effort budget.
2. **Picks the medium and combines** — one content core → a deck *and* a launch card *and* a demo GIF, all visually consistent. Real leverage is in chaining tools, not using one.
3. **Learns from the best — the principle, not the look** — distills the underlying principles that 3Blue1Brown, Kurzgesagt, Fireship, TED, Tufte and others keep rediscovering, then invents an expression that fits *your* topic.
4. **Sets up the tool and builds** — exact setup command, the minimal authoring loop, and how to export, for each integrated project.
5. **Self-reviews** against the medium's checklist (one idea per slide, thumbnail-readable card, hook-in-3s video) before handing over.

## Install

This is a [Claude Code](https://claude.ai/code) skill. Clone it into your skills directory:

```bash
git clone https://github.com/ma-pony/sharecraft.git ~/.claude/skills/sharecraft
```

Then just ask Claude naturally — no command to remember:

- *"Make a social card for this project"*
- *"Turn this README into a talk deck"*
- *"Explain this concept in a short video"*
- *"Beautiful screenshot of this code"*
- *"Record a terminal GIF of the install flow"*

The skill triggers on the intent to **make something to share**, even if you only name the goal or only name a tool.

## What's inside

`SKILL.md` is the map; the detail lives in `references/` (loaded on demand):

| File | What it covers |
|------|----------------|
| [`references/methodology.md`](references/methodology.md) | The soul — Duarte, Minto, Reynolds, Tufte, Mayer, the TED canon. Narrative arc, visual design, cognitive load, aspect-ratio table, per-medium checklists. |
| [`references/exemplars.md`](references/exemplars.md) | Learn from benchmarks → reverse to first principles → innovate. 7 underlying principles, then how each exemplar expressed them. |
| [`references/slides.md`](references/slides.md) | Slidev, Marp, reveal.js, Pandoc, Patat, Impress.js. |
| [`references/images.md`](references/images.md) | HTML→PNG engine, Satori, markdown-to-image, poster-design, 文颜, Carbon/CodeImage, Mermaid/Excalidraw/Draw.io. |
| [`references/video.md`](references/video.md) | Remotion, Manim, Motion Canvas, VHS, asciinema+agg, OBS, ffmpeg. |
| [`references/combine.md`](references/combine.md) | Chaining tools — one source of truth across deck + image + video. |
| [`scripts/html_to_image.py`](scripts/html_to_image.py) | Playwright-based HTML/CSS → PNG renderer — the universal card/poster/infographic engine. |

## The methodology, in one breath

Respect the audience's attention. Every element either earns its place by aiding understanding, or it gets cut. Name the **before→after transformation** you want. Carry **one** idea. Lead with the answer (Minto). **Emotion before information**; the **ending is the memory anchor**. One idea per slide/card/scene; image over duplicated text; whitespace is a tool; big type forces clarity; kill chartjunk (Tufte). Build for the size it's consumed at. State one action, explicitly, at the end. — see [`references/methodology.md`](references/methodology.md).

## Integrated tools (all local, no API keys)

- **Slides** — Slidev · Marp · reveal.js · Pandoc · Patat · Impress.js
- **Images / posters / cards** — HTML→PNG (Playwright) · Satori · markdown-to-image · poster-design 迅排设计 · 文颜 wenyan · Carbon / ray.so / CodeImage · Excalidraw · Mermaid · Draw.io
- **Video / GIF** — Remotion · Manim · Motion Canvas / MotionForge · VHS · asciinema + agg · OBS · ffmpeg

Sharecraft deliberately avoids anything that needs a paid API or platform auth — everything runs on your machine.

## The HTML→PNG helper

The one bundled script renders any HTML/CSS to a pixel-perfect PNG — ideal for social cards, 公众号 covers, 小红书 carousels, and infographics:

```bash
pip install -r scripts/requirements.txt && playwright install chromium
python scripts/html_to_image.py card.html card.png --width 1080 --height 1350 --scale 2
```

## Credits

Sharecraft stands on the shoulders of every open-source project it integrates, and on the communication craft of Nancy Duarte, Barbara Minto, Garr Reynolds, Edward Tufte, Richard Mayer, and the creators it studies as exemplars. It teaches *learning from* them — never copying.

## License

[MIT](LICENSE) © 2026 Pony.Ma
