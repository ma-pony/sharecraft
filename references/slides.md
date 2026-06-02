# Slides — 幻灯片 / 演示文稿

Pick by audience: **Slidev** for developer/technical talks (code, live demos, animations), **Marp**
for fast lightweight decks that export clean PDF/PPTX, **reveal.js** for a fully custom web deck.
Apply `methodology.md` → Slides checklist before finalizing. The deck's quality is the narrative arc,
not the theme.

## Slidev (recommended for technical sharing)

React/Vue-based, Markdown-authored, gorgeous code highlighting, live coding, animations, PDF/PPTX/PNG export.

### Setup
```bash
# Scaffolds an interactive project; pnpm or npm both fine
pnpm create slidev    # or: npm init slidev@latest
cd slidev-xxx
pnpm dev              # live preview at http://localhost:3030
```

### Authoring (slides.md)
Slides are separated by `---`. Frontmatter on the first slide sets theme/title.
```markdown
---
theme: seriph
title: My Talk
highlighter: shiki
transition: slide-left
---

# Latency dropped 60%
How we rebuilt the query path

---

## The problem
- 800ms p99 on the hot path
- One takeaway per slide — title states the point

---

## Show the code, highlight what matters
```ts {2-3}
function slow() {}
function fast() {}   // the line that matters is highlighted
```
```

Useful: `layout: two-cols`, `<v-clicks>` for incremental reveals, `monaco` for live editing,
presenter notes after `<!-- ... -->`. Themes: `seriph`, `default`, `apple-basic`, or community themes.

### Export
```bash
pnpm export                 # -> slides-export.pdf
pnpm export --format png    # one PNG per slide (great for reusing a slide as a social image)
pnpm export --format pptx   # PowerPoint
```

## Marp (lightweight, Markdown-native, great PDF/PPTX)

Best when you want a clean deck fast, or to write in VS Code. No build tooling needed for the CLI.

### Setup & export
```bash
npm install -g @marp-team/marp-cli
marp deck.md -o deck.pdf       # also: --pptx, --html, --images png
marp -s .                      # live server / watch mode
```

### Authoring (deck.md)
```markdown
---
marp: true
theme: default      # default | gaia | uncover
paginate: true
---

# Title slide

---

## Slide two
- Markdown all the way
- `---` separates slides

![bg right](hero.png)   <!-- background image on right half -->
```
VS Code: install the "Marp for VS Code" extension for live preview + export buttons.

## reveal.js (fully custom web deck)

Reach for this when you want a bespoke, interactive, web-hosted deck (HTML/CSS/JS, plugins, fragments,
LaTeX). Heavier to author than Markdown decks; use only when the customization is worth it.
```bash
git clone https://github.com/hakimel/reveal.js && cd reveal.js && npm i && npm start
```
Edit `index.html`; each `<section>` is a slide; nested `<section>` makes vertical sub-slides.

## Other options (reach for the right fit)

These three each fill a gap the core trio doesn't — keep the list short on purpose:

- **Pandoc** (`jgm/pandoc`) — if Pandoc is already installed, one command converts Markdown to many
  deck formats: `pandoc talk.md -t revealjs -s -o talk.html` (also `beamer`/PDF, `pptx`). Zero new tooling.
- **Patat** (`jaspervdj/patat`) — Markdown presentations **in the terminal**. Perfect for SSH/remote
  demos or a pure-CLI vibe; no browser. `brew install patat` then `patat talk.md`.
- **Impress.js** (`impress/impress.js`) — Prezi-style 3D/zoom spatial layouts when you want visual
  impact beyond linear slides (use sparingly — motion can distract from the message).

## Plan the deck before you build (a rhythm, not a pile of slides)

Step 0 in `SKILL.md` already fixed audience + one takeaway. Two more quick decisions save the most
rework: **how long** (talk length → slide count: ~15 min ≈ 10 slides, ~30 min ≈ 20, ~45 min ≈ 25–30 —
Kawasaki's 10/20/30 is the discipline) and **the visual rhythm**. Before filling content, sketch a one-
line plan per slide: `# → layout → light/dark`. Alternating density and tone (don't run three identical
content slides in a row) is a *global* decision; deciding it per-slide is how decks turn into a wall.

## Slide layout recipes — pick one per slide, then fill it

Free-styling every slide is why decks drift. Choose a layout first; each is a different expression of
the same first principles from `exemplars.md` (subtract; concrete before abstract; primacy/recency;
dual coding). These map cleanly onto Slidev/Marp Markdown — no special runtime. Apply your one accent +
≤2 fonts on top.

| ID | Layout | Use for | The rule that matters | Slidev/Marp |
|----|--------|---------|------------------------|-------------|
| **SL01** | Cover statement | open / chapter | title = a claim or hook, not a topic; ≤1 line; no bullets | `layout: cover` / `_class: lead` |
| **SL02** | Title + 2–4 bullets | the workhorse | one point per slide; a bullet that wraps = split the slide | `default` |
| **SL03** | Full-bleed image | emotion, scene | ≤2 lines of text on the image; contrast ≥4.5:1 (signal, principle ④) | `image` / `![bg]` |
| **SL04** | Data hero | one key metric | one giant number; real data; no chartjunk (Tufte) | custom / `two-cols` |
| **SL05** | Two-column compare | before→after, A/B | exactly 2; symmetric depth; tone hints the winner | `two-cols` |
| **SL06** | Code spotlight | the money snippet | highlight the 1–3 lines that matter; ≤20 lines; never a screenshot | Slidev `{2,5-7}` |
| **SL07** | Pull quote | insight, testimonial | quote is the focal point; ≥1.5× body size; source small | `quote` |
| **SL08** | Section break | chapter turn, breath | number + chapter name only; no content | `section` |
| **SL09** | Steps / flow | 3–6 step process | steps are signposts, ≤2 lines each; reveal with `<v-clicks>` | `<v-clicks>` |
| **SL10** | Closing CTA | the memory anchor | one concrete action + where to find more; no new info; not "Thanks/Q&A" | `end` |

## Quantitative specs (so "big enough" isn't a guess)

- **Type floors (16:9):** body/bullets ≥24–30pt, code ≥18pt, captions/sources ≤ but legible ~16pt.
  The bigger the type, the lighter the weight. If text must shrink below the floor, cut it — don't shrink.
- **Density caps per slide:** ≤4 bullets · ≤6 distinct elements (text blocks+image+chart) · code ≤20
  lines with ≤5 highlighted · title ≤15 字/words. Over a cap → split, or move to SL09.
- **Margins:** keep ≥5% safe margin on all sides; leave the bottom ~5% clear for page numbers.
- **Palette:** ≤2 fonts, ≤3 color roles (base + secondary + one accent used sparingly).

These feed the slide self-checks in `methodology.md` — run them before exporting.

## Tips that make decks land

- Title each slide with the **takeaway** ("Cache cut DB load 4×"), not the topic ("Caching").
- Put detail in speaker notes, not on the slide. The slide is a billboard, not a document.
- Export slides as PNG (`--format png`) and reuse the strongest one as your social launch card — see
  `combine.md`.
- For Anthropic-branded or themed decks, the bundled `theme-factory` and `brand-guidelines` skills pair
  well — apply a consistent palette/typography.
