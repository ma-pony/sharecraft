# Interactive HTML — explorables / dashboards / scrollytelling / live demos

This is the one medium where the audience **does** something, not just sees it. An interactive HTML
artifact is the deliverable *itself* — it stays live (sliders, simulations, scroll-driven stories,
filterable data, editable code), unlike the HTML→PNG engine in `images.md` which flattens HTML to a
static picture. Reach for it when the insight comes from *manipulating* a thing, not from reading about it.

**Why this medium exists (the first principle).** It is the purest expression of principle ⑥ in
`exemplars.md` — *active beats passive (the generation effect)*. A reader who drags a parameter and
watches the result move derives the idea themselves, and remembers it far better than any sentence.
It also serves ② (let them plug in concrete values before the abstract rule) and ① (reveal detail on
demand instead of all at once). The exemplars to study are already in `exemplars.md` → 交互式解释
(Bartosz Ciechanowski, Nicky Case, Distill). This file is how you *produce* that, in sharecraft's way.

> Not the same as slides. reveal.js/Slidev/Impress.js are HTML too, but they're the *slides* medium
> (`slides.md`). Interactive HTML is broader: explorables, dashboards, scrollytelling, demos, toys.

## When to use it (vs. another medium)

| The "aha" comes from… | Medium |
|-----------------------|--------|
| …reading a structured argument / a talk | Slides (`slides.md`) |
| …one glance at a striking visual | Image (`images.md`) |
| …watching a motion you control the pacing of | Video (`video.md`) |
| **…doing it yourself — trying inputs, exploring, playing** | **Interactive HTML (this file)** |

If the audience would naturally say "let me try changing that" or "what if I…", this is the medium.

## Interactive recipes — pick the interaction model, then build it

Each is a different expression of principle ⑥ (and friends). Pick **one primary** interaction; layer
the rest with progressive disclosure. All run locally, zero API keys.

| ID | Interaction | Use for | The move | Reach for |
|----|-------------|---------|----------|-----------|
| **IH01** | Explorable | "play with the parameter" | a slider/drag/toggle drives an instant visual; the default state already teaches | vanilla JS + SVG/Canvas, D3 |
| **IH02** | Scrollytelling | a narrative with a pinned visual | sticky graphic + step text; **one** change per scroll step | Scrollama / IntersectionObserver |
| **IH03** | Chart / dashboard | explore data | hover tooltips, filter, brush, toggle series | Observable Plot, Chart.js, ECharts, D3 |
| **IH04** | Manipulable diagram | rearrange / inspect a system | drag nodes, toggle layers, expand details | SVG+JS, Mermaid + JS, Cytoscape |
| **IH05** | Guided step-through | walk a process at the viewer's pace | next/prev, highlight the current part, progress dots | vanilla JS |
| **IH06** | Live code playground | "try the code" | editable code → live preview/output | CodeMirror 6, Sandpack |
| **IH07** | Calculator / configurator | input → computed output | form inputs → result; encode state in the URL hash so it's shareable | vanilla JS |
| **IH08** | Simulation / toy | feel how a system behaves | play / pause / reset; physics or agents on a canvas | Canvas + rAF, p5.js |

## Tools (all local / CDN, no API keys)

Default to **vanilla HTML/CSS/JS** — it's the most shareable and longest-lived. Pull a library only
when it earns its weight, via a CDN `<script>` (or inline it for true offline):

- **Data viz:** D3, Observable Plot, Chart.js, ECharts
- **Animation:** GSAP, Motion One, anime.js (respect `prefers-reduced-motion`)
- **Scroll:** Scrollama (built on the native IntersectionObserver)
- **3D / maps:** Three.js · Leaflet / MapLibre GL
- **Math / diagrams:** KaTeX · Mermaid
- **Live code:** CodeMirror 6 · Sandpack
- **Complex app (state, routing, components):** the bundled **`web-artifacts-builder`** skill
  (React + Tailwind + shadcn/ui). For visual craft on any of the above, pair **`frontend-design`** /
  **`canvas-design`**.

## Build & deliver

- **Default to one self-contained `.html`** — inline the CSS and JS; bundle data as
  `<script type="application/json">`. It opens with a double-click, sends as a single file, and works
  offline. A small folder only when assets genuinely require it.
- **Live link (zero API keys):** enable **GitHub Pages** (`gh api -X POST repos/<owner>/<repo>/pages
  -f 'source[branch]=main' -f 'source[path]=/'`) and link the file's Pages URL, or drag the file onto
  **Netlify Drop**. A link is what makes an interactive piece actually get *used*.
- **Static preview for feeds.** Social/README feeds can't run HTML — render a representative state to
  PNG with `scripts/html_to_image.py` (the `--wait`/`--wait-for-webgl` flags let canvas settle), and
  link the live version beneath it.
- Reuse assets across media: a Mermaid diagram, a palette, a chart can live in the explorable *and* a
  deck *and* a card (see `combine.md`).

## Quantitative specs

- **Time-to-interactive:** aim < ~2s on a laptop. Lazy-load heavy libs (Three.js, big datasets); don't
  block first paint on them.
- **Touch targets ≥ 44px**; the whole thing must work on a 375px-wide phone (responsive, pointer *and*
  touch).
- **Keyboard:** every control focusable, visible focus ring, real `<label>`/ARIA on inputs.
- **One primary interaction.** Secondary controls appear on demand — don't present ten knobs at once
  (principle ① subtract).
- **Default state teaches.** The message must land *before* anyone touches a control; interaction
  deepens it, it doesn't gate it.

## Self-review checklist (before handing over)

- [ ] Opens straight from `file://` — no build step, no server, no API key — and works.
- [ ] Self-contained: one file (or a folder of only local/CDN assets); no secrets committed.
- [ ] The **pre-interaction default state already conveys the core message** (not hidden behind a click).
- [ ] One primary interaction; extras are progressively disclosed.
- [ ] Every control has an obvious affordance, a visible focus state, and a ≥44px target.
- [ ] Responsive at 375px; works with touch as well as mouse/keyboard.
- [ ] Time-to-interactive is quick; heavy assets are lazy-loaded.
- [ ] Respects `prefers-reduced-motion`; degrades to readable static content if JS fails.
- [ ] The interaction *serves the message* — it's not a gimmick. If a static image would say it as well,
      make the image instead.
