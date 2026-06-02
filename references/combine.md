# Combine — 把工具串起来用（这是真正的杠杆）

A single share rarely needs a single tool. The leverage comes from producing **one source of truth**
(a message, a diagram, a palette) and propagating it across deck + image + video so the whole set feels
coherent. Below are battle-tested chains. Mix freely — these are starting points, not rules.

## Principle: one content core, many outputs

Decide the **one takeaway**, the **palette** (1 accent + neutrals), and the **key visual** (a diagram,
a hero shot) ONCE. Then every artifact reuses them. Consistency across pieces is what makes a "launch"
feel professional rather than assembled.

## Recipe 1 — Ship an open-source project ("share this project nicely")

1. Skim README/code for the one takeaway + 3 supporting points.
2. **Deck** (`slides.md`, Slidev): hook → problem → demo → how it works → call to action.
3. Reuse one **Mermaid** architecture diagram (`images.md`) inside the deck.
4. `pnpm export --format png` the hero slide → crop with HTML→PNG or use it directly as the **launch card**.
5. **Terminal GIF** (VHS) of the install/usage one-liner for the README and the tweet.
6. Optionally a 30–60s **Remotion** demo reusing the same diagram + palette.
Output set: deck (PDF) + launch card (PNG) + usage GIF + optional demo video — all visually consistent.

## Recipe 2 — Turn an article into a shareable post (公众号 / 知乎 / 小红书)

1. **文颜 wenyan** typesets the Markdown into platform-ready HTML (`images.md`).
2. **markdown-to-image** or HTML→PNG makes the in-article cards / a cover.
3. For 小红书: produce a **carousel** — author one HTML template, swap the text per card, render each at
   3:4 with `html_to_image.py` so the whole series is visually uniform.
4. 公众号 cover: render the 2.35:1 banner + 1:1/3:4 square pair via HTML→PNG (see ratio table in
   `methodology.md`). Templated HTML beats a niche tool here — you control the design and the output.

## Recipe 3 — Concept explainer (deck + video from the same script)

1. Write the beat script once (`video.md`).
2. **Manim** (abstract/math) or **Remotion** (UI/data) animates the beats.
3. The same beats become a **Slidev** deck (one beat per slide) for the talk version.
4. Export a strong frame as the **thumbnail** (16:9, big text) for the video.

## Recipe 4 — Code-centric share

1. **Carbon/CodeImage** for the money snippet (`images.md`).
2. **Motion Canvas** or Remotion if the code needs to animate (diff reveal, step-through).
3. Drop the code image into a Slidev slide and into the social card — same snippet, same theme.

## Cross-tool asset flow (what feeds what)

```
Mermaid diagram (.svg/.png) ──> Slidev slide ──> export PNG ──> social card
                            └─> Remotion asset ──> demo video ──> export frame ──> thumbnail
Brand palette + fonts ──────> every tool (theme config / CSS variables) for consistency
Beat script ───────────────> video (Manim/Remotion) AND deck (Slidev), one narrative two forms
```

## Make consistency cheap

- Define the palette as CSS variables once; reuse in HTML→PNG cards, Slidev theme, Remotion styles.
- The bundled **`theme-factory`** skill can apply one consistent theme across slides/docs/HTML; pair
  **`brand-guidelines`** for Anthropic look-and-feel; **`frontend-design`**/**`canvas-design`** for the
  actual HTML/visual craft. Lean on them rather than hand-rolling styles each time.
- Keep a tiny `assets/` (logo, fonts, palette) and point every tool at it.

The point of combining isn't using more tools — it's that the audience receives one coherent message
in whatever form fits where they are.
