# Design system — the shared visual contract

One content core, many outputs (`combine.md`) only looks coherent if every medium pulls from **one
contract**. This file is that contract: the tokens, the component baselines, and the anti-patterns that
apply **across** cards, slides, video frames and interactive HTML. Read it once; the per-medium files
(`images.md`, `slides.md`, `video.md`, `interactive.md`) reference it instead of re-deciding width,
code style, or diagram rules every time — that ad-hoc re-deciding is exactly what makes output look
generic and inconsistent.

**Universal vs medium-specific.** The rules here are *universal* — true for any artifact. Each medium
file then adds only what's genuinely its own (responsive `clamp()` and click-to-highlight are HTML's;
the 4-band density test is the vertical card's; shot timing is video's). When in doubt, a rule that
would help a slide *and* a card *and* a page belongs here, not in one medium file.

## Contents
1. Tokens — the copy-paste `:root`
2. Width & measure (the #1 "cheap" tell)
3. Code blocks
4. Diagrams & flowcharts
5. Surfaces, cards & tables
6. Distinctiveness & the two registers
7. Anti-pattern self-check (run before handing over)
8. How each medium uses this

---

## 1. Tokens — the copy-paste `:root`

The house palette and type. One Latin + one CJK family, one accent. Don't invent new hues per artifact;
reach for these tokens so a deck, a card and an explorable read as siblings.

```css
:root{
  /* surface / ink */
  --bg:#0E1116; --surface:#161A22; --surface-2:#1B2230; --line:#222836;
  --fg:#F5F7FA; --ink:#C7CEDB; --muted:#8B95A7; --faint:#5A647A;
  /* one accent + two semantic signals (use sparingly) */
  --accent:#FF6B5B; --green:#7BE0A8; --amber:#E5C07B; --blue:#7BC8FF;
  /* code (tuned, low-saturation — see §3) */
  --code-bg:#11151D; --code-ink:#E8ECF3;
  --code-com:#6B7689;        /* comments: dim, recede */
  --code-key:#FF8B7E;        /* keywords: one warm accent */
  --code-str:#9BD3B0;        /* strings: DESATURATED green, not neon */
  --code-num:#E5C07B; --code-fn:#7BC8FF;
  /* type */
  --sans:-apple-system,"SF Pro Display","PingFang SC","Helvetica Neue",Arial,sans-serif;
  --sans-cjk:"Noto Sans SC",var(--sans);          /* brand/editorial CJK: Noto Serif SC */
  --mono:"JetBrains Mono","SF Mono",Menlo,Consolas,monospace;
  /* fluid type ramp — ≥1.2 ratio between steps; scales with viewport */
  --t-xs:clamp(11px,1.4vw,12.5px); --t-sm:clamp(13px,1.7vw,14.5px);
  --t-body:clamp(15px,2vw,16px);   --t-lead:clamp(17px,2.4vw,20px);
  --t-h3:clamp(20px,2.6vw,24px);   --t-h2:clamp(26px,3.6vw,34px);
  --t-h1:clamp(34px,5.2vw,56px);
  /* spacing scale (4px base) + radius + motion */
  --s1:4px; --s2:8px; --s3:12px; --s4:16px; --s5:24px; --s6:32px; --s7:48px; --s8:72px;
  --r-sm:6px; --r:10px; --r-lg:16px;
  --ease:cubic-bezier(.4,0,.2,1); --dur:.2s;
  /* the two — and only two — content widths (see §2) */
  --measure:68ch;        /* reading column: 60–75 chars */
  --wide:1120px;         /* deliberate full-bleed: charts, flowcharts, wide tables */
}
```

Light-background docs: swap `--bg`/`--surface` to light and keep `--code-bg` dark (a dark code panel on
a light page is fine and legible); keep the same accent and code tokens.

## 2. Width & measure (the #1 "cheap" tell)

Inconsistent widths are the fastest way an otherwise-clean page looks amateur: text at 760, a stats row
that wanders out to 1080, a card stack somewhere between. Fix it with a hard rule:

- **Exactly two widths exist.** `--measure` (everything you *read* — paragraphs, lists, headings,
  code, most cards) and `--wide` (things that genuinely need room — a chart, a flowchart, a wide table).
  There is no third, ad-hoc width.
- **Reading measure is 60–75 characters.** Wider and the eye loses the line return; this is typographic
  canon, not taste. Use `max-width:var(--measure)` (or px on fixed-size canvases).
- **Full-bleed is a decision, not an accident.** A `--wide` block is centered and shares the same left
  axis as the measure column; it doesn't just "happen to be wider." If only one element is wide, ask
  whether it should be — usually it should match the measure.

## 3. Code blocks

Code appears in *every* medium (a card via Carbon/HTML, slide SL06, a video frame, an explorable). Same
rules everywhere:

- **Restrained syntax color.** Comments recede (`--code-com`), keywords get the *one* warm accent,
  strings are **desaturated** (`--code-str`) — never neon green that turns every string-heavy line into
  a zebra stripe. A reader should see structure, not a color riot.
- **Never silently truncate a long line.** On the web, wrap: `white-space:pre-wrap;
  overflow-wrap:anywhere`. If you must scroll horizontally, show a visible scrollbar + a fade hint —
  information must not vanish into a clipped `…`. On a fixed-size card, shorten the line instead.
- **Highlight = block, ≤3 lines, opt-in.** To spotlight the line that matters, give the *whole row* a
  tinted background + a left accent border. Don't use `display:inline-block;width:100%` inside an
  `overflow` container — it produces ragged, broken bands. Default to **no** highlight; only mark 1–3
  lines, and only when there's a point to make.
- Mono font, size ≥12.5px, generous line-height (~1.6).

```css
pre{background:var(--code-bg);color:var(--code-ink);font-family:var(--mono);font-size:13px;
    line-height:1.6;border-radius:var(--r);padding:var(--s4);max-width:var(--measure);
    white-space:pre-wrap;overflow-wrap:anywhere;}
.tok-com{color:var(--code-com)} .tok-key{color:var(--code-key)} .tok-str{color:var(--code-str)}
.line-hl{display:block;margin:0 calc(-1*var(--s4));padding:0 var(--s4);
    background:rgba(255,107,91,.10);border-left:3px solid var(--accent);}
```

## 4. Diagrams & flowcharts

A flowchart's whole job is showing **direction**. The most common failure (seen in real generated docs)
is nodes stacked as bare `<div>`s with no edges, leaving the reader to guess the flow.

- **A flowchart must have directed edges.** Real connecting lines with arrowheads; the direction reads
  at a glance. Stacking boxes and hoping proximity implies order is not a flowchart.
- **Implementation order:** ① **Mermaid** (it routes edges and arrows for you — least effort, most
  reliable) → ② **inline SVG** when you need precise control → **never bare `<div>`s as a "graph."**
- **Same-rank nodes are the same width** (set a `min-width`), aligned on a grid. One color *per node
  category* (semantic, not decorative) + a small legend. Kill chartjunk (Tufte): no 3D, no gradients on
  the boxes, no redundant borders.
- A diagram is reusable across deck + card + video — author it once (`combine.md`).

```
%% Mermaid theme aligned to the tokens
%%{init:{'theme':'base','themeVariables':{
  'background':'#0E1116','primaryColor':'#161A22','primaryBorderColor':'#222836',
  'primaryTextColor':'#F5F7FA','lineColor':'#8B95A7','fontFamily':'JetBrains Mono'}}}%%
flowchart TD
  A[Request] --> B{Cache hit?}
  B -- yes --> C[Return cached]
  B -- no --> D[Query + store]
```

## 5. Surfaces, cards & tables

- **Don't wrap everything in cards, and never nest cards in cards.** A border + surface fill is a way to
  group *related* things; applied to everything it becomes visual noise and flattens hierarchy. Plain
  content on the background is often better.
- Card grids: equal heights per row (`align-items:stretch`); consistent padding from the spacing scale.
- Tables (Tufte): no vertical rules, minimal horizontal rules, let cells breathe; numbers right-aligned,
  mono for figures. A table that scrolls horizontally on mobile gets a visible affordance.

## 6. Distinctiveness & the two registers

Generic is the real risk: a flood of same-looking AI output means "average" is invisible. But the cure
isn't a mandated "unique style" — that just creates a *second* monoculture (the editorial-serif +
italic + tracked-uppercase-kicker look everyone fled to). The cure is: **a deliberate choice, and no
reflex defaults.** Split by register:

- **Product register** — docs, dashboards, the interactive explainer itself. System fonts and the house
  tokens are exactly right; **don't chase distinctiveness here** (it costs legibility and performance).
- **Brand register** — launch cards, posters, 公众号/社媒 covers. Distinctiveness *earns its keep* here.
  Make **one** deliberate signature move per piece (pick one, not all three):
  1. a headline display typeface with real personality,
  2. a distinctive layout motif, or
  3. one unconventional emphasis treatment.
  Anti-reflex procedure (from impeccable, adapted): write down the 3 choices you'd reach for by reflex;
  if they're the training-data defaults (plain system-sans grid; editorial-serif-italic), go find a
  fourth in a real type catalog / reference. **House identity always wins** — when sharecraft's brand
  is already the point, keep it; don't second-guess a committed identity.

## 7. Anti-pattern self-check (run before handing over)

A quick critique pass — generate, then audit against this list and fix what trips. (Mirrors how
impeccable runs deterministic anti-pattern checks; these are ours.)

- [ ] **One reading measure**, only `--measure` + `--wide` — no stray third width.
- [ ] **Code**: desaturated strings, long lines wrap (not clipped), any highlight is whole-row and ≤3 lines.
- [ ] **Flowchart**: directed edges with arrows; same-rank nodes equal width; legend present; not bare divs.
- [ ] Not everything is a card; no card-in-card; hierarchy is visible.
- [ ] Type hierarchy has real contrast (not 14/15/16px muddied together); ≥1.2 ratio between steps.
- [ ] No gray text on a colored background; no pure #000/#fff — tint toward the palette.
- [ ] **No AI fingerprints**: a tracked-uppercase kicker over *every* section; reflex editorial-serif +
      italic + broadsheet grid on a brief that isn't a magazine; bounce/elastic easing.
- [ ] Brand-register pieces make exactly one deliberate signature move (§6); product-register pieces don't.
- [ ] Contrast ≥4.5:1 for body; meaning never encoded by color alone.

## 8. How each medium uses this

- **`images.md`** — code cards use §3; infographics/diagrams use §4; all use §1–2, §6–7. Plus its own
  4-band density test and 中文 type scale.
- **`slides.md`** — SL06 code spotlight uses §3; flow slides (SL09) use §4; all use §1–2, §6–7. Plus
  its own density caps and SL recipes.
- **`video.md`** — code/diagram frames use §3–4; all use §1, §6–7. Plus its own timing/shot recipes.
- **`interactive.md`** — uses §1–7, and adds the HTML-only layer: responsive `clamp()`/`ch`,
  click-to-highlight code, draggable/zoomable diagrams, TTI/touch/keyboard. See its Component specs.
