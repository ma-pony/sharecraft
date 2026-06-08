# Interactive HTML — real websites, explorables, dashboards, scrollytelling, demos

The deliverable is **live HTML the audience navigates and operates** — anywhere from a whole single-page
**website** (a doc-site, a guide, a launch page, a README-as-a-site) down to one focused explorable
widget. It stays live (nav, `<details>`, sliders, scroll-driven stories, filterable data, editable code),
unlike the HTML→PNG engine in `images.md` which flattens HTML to a static picture. When you're sharing
something *in HTML*, **use the full power of the web — build a real site, not a flat blog column, a
tweet, or a PPT-flip deck.**

**Why this medium exists (the first principle).** It is the purest expression of principle ⑥ in
`exemplars.md` — *active beats passive (the generation effect)*. A reader who drags a parameter and
watches the result move derives the idea themselves, and remembers it far better than any sentence.
It also serves ② (let them plug in concrete values before the abstract rule) and ① (reveal detail on
demand instead of all at once). The exemplars to study are already in `exemplars.md` → 交互式解释
(Bartosz Ciechanowski, Nicky Case, Distill). This file is how you *produce* that, in sharecraft's way.

> Not slides. reveal.js/Slidev/Impress.js are HTML too, but they're the *slides* medium (`slides.md`) —
> one screen per page, click to advance. Interactive HTML is broader and is **not** PPT-flip: real
> single-page sites, explorables, dashboards, scrollytelling, demos, toys. For a doc / guide / launch
> you want to *share*, prefer a single-page site here over a slide deck.

## When to use it (vs. another medium)

| The "aha" comes from… | Medium |
|-----------------------|--------|
| …a live talk you present slide-by-slide | Slides (`slides.md`) |
| …one glance at a striking visual | Image (`images.md`) |
| …watching a motion you control the pacing of | Video (`video.md`) |
| **…reading/navigating a doc, guide, or launch on your own time** | **Interactive HTML — a single-page site (IH09)** |
| **…doing it yourself — trying inputs, exploring, playing** | **Interactive HTML — a widget (IH01–IH08)** |

If the audience would naturally say "let me try changing that" or "what if I…", build a widget. If
they'd read it on their own and want to scan, jump around, and dig in, build a **site** — not a deck.
A share that someone opens via a link and reads themselves is a *website*, not a presentation.

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
| **IH09** | **Single-page site / doc-site** | a doc, guide, launch, or README *as a real website* | hero → distinct sectioned layouts → CTA; sticky nav or sidebar TOC with scroll-spy; `<details>`, deep-links, copy buttons | vanilla HTML/CSS/JS + IntersectionObserver |

## IH09 in depth — the share *as a real website*

When the thing you're sharing is a doc, guide, explanation, or launch and you're doing it in HTML, build
a **real website** — a single-page, long-scroll site that uses the full power of the web. The failure to
avoid is shipping a **blog/tweet column** (a narrow strip of prose you just scroll) or a **PPT-flip deck**
(one screen per page). Neither uses what HTML can do.

A doc-site is usually a **public / broad / teaching** piece, so it usually wants the **light** base from
`design-system.md` §1 — dark is the house default, not the right call for a wide how-to audience (§6).
Decide base by audience, up front.

**What makes it a real site (not a blog column):**

- **A hero / landing section** that states the one takeaway before anything else.
- **Persistent navigation** — a sticky top nav *or* a sidebar table-of-contents, with **scroll-spy**
  (the current section highlights via `IntersectionObserver`) so the reader can jump and always knows
  where they are. Anchored, deep-linkable section ids.
- **Distinct, purposeful section layouts.** Each section earns its own layout — a feature grid, a
  comparison table, a stat band, a step flow, a diagram, a code panel, a callout — not a uniform wall of
  paragraphs. Reading text holds `--measure`; sections that want room go `--wide` (design-system.md §2).
- **Native HTML interactions instead of prose** — `<details>` for depth-on-demand, copy-to-clipboard on
  snippets, tabs, CSS/SVG diagrams (§4), the scroll-spy TOC. These are the things a flat doc can't do.
- **Responsive + a real footer** (repo / links / license). It should feel like a *site*, not a printout.
- Still **one self-contained `.html`** by default (inline CSS/JS) — "a real website" is about structure
  and interaction, not about a build pipeline or many files.
- **Don't start from a blank file.** Inline [`../assets/base.css`](../assets/base.css) for tokens +
  component baselines, and use [`examples/doc-site.html`](../examples/doc-site.html) as the structural
  skeleton (sticky TOC + scroll-spy + sectioned layouts). Adapt, don't rebuild from zero.

**Build it to a real-site bar (definition of done):**

- **Semantic structure** — real `<header>/<nav>/<main>/<section>/<footer>` landmarks, real heading order,
  labelled controls. The page should be navigable and readable with the CSS stripped.
- **Every interactive control carries its real states** — hover *and* `:focus-visible`, active, disabled
  (design-system.md §5). A site whose buttons/links only have a resting style reads as a mockup.
- **No overflow at any width.** Test 375px → desktop; line breaks stable, nothing clipped, the TOC
  collapses gracefully on mobile. Use container queries for components that live in both wide and narrow
  slots (design-system.md §2/§5).
- **Build in passes** — structure → visual system → states → motion → responsive — each a deliberate
  pass, not one blurred sweep. Restrained motion only (§5): 150–250ms, conveys state, honours reduced-motion.

**Content discipline (this matters more than the chrome):**

- **Every section leaves something you can take away** — a copyable template, a checklist, decision
  criteria, an action/mapping table. A section with no takeaway gets cut, not padded.
- **No filler, no AI-speak.** Drop performative lines ("这就是 X 的形状", "全场高潮", "记住这句，后面是
  关键"). Say the thing; move on.
- **No self-promotion, no previewing the structure.** Don't write "每节都给模板，证明不是空谈", "下面
  这个骨架可以直接抄", "下一节专门讲它". Give the content; let the reader judge it.
- **Don't mix languages gratuitously.** For a Chinese audience, Chinese-ize the terms (description→触发
  描述, baseline→对照, precision→准确率); keep only real identifiers / file names in English.

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

## Component specs — shared rules, plus what's HTML's own

The universal visual rules — **one reading measure + deliberate full-bleed, restrained code blocks,
flowcharts with real directed edges, the anti-pattern self-check** — live in `design-system.md` (§2–4,
§7) because they apply to cards and slides too. Apply them here, and add the parts that are genuinely
HTML's:

- **Responsive measure.** Use the tokens fluidly: `width:min(var(--measure),100%)` for the reading
  column, `width:min(var(--wide),100%)` for a chart/diagram; size type with the `clamp()` ramp so it
  scales from 375px to desktop without a third hard-coded width creeping in.
- **Code, interactive.** Wrapping (`white-space:pre-wrap`) matters more here than anywhere — there's no
  fixed canvas to shorten to. If you offer click-to-highlight or run-this-line, build it on the
  whole-row `.line-hl` pattern from `design-system.md` §3, not inline spans.
- **Diagrams, interactive.** A draggable/zoomable/expandable graph still needs the §4 rules first:
  directed edges with arrows, equal-width same-rank nodes, a legend. Interaction is layered *on* a
  diagram that already reads statically — start from Mermaid or inline SVG, never bare `<div>`s.
- **Two registers (design-system.md §6).** An explorable/dashboard/doc is the **product register** —
  house tokens, no font-chasing. Only a brand-register landing-style page makes a signature move.

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
- [ ] **One reading measure** (`--measure`) + deliberate full-bleed only; no stray third width (`design-system.md` §2).
- [ ] **Code blocks**: desaturated strings, long lines wrap (never clipped), any highlight whole-row & ≤3 lines (§3).
- [ ] **Flowcharts**: directed edges with arrows, equal-width same-rank nodes, a legend — not bare `<div>`s (§4).
- [ ] Ran the **anti-pattern self-check** in `design-system.md` §7 (no card-in-card, no per-section uppercase kicker, no reflex editorial-serif).
- [ ] **If it's a site (IH09):** real structure — hero, persistent nav/TOC with scroll-spy, distinct per-section layouts (not one prose column), real footer. **Not** a blog/tweet column, **not** PPT-flip.
- [ ] **Substance:** every section leaves a takeaway (template / checklist / criteria / table); no filler, no AI-speak, no self-promoting or structure-previewing meta-text.
- [ ] **Language:** terms Chinese-ized for a Chinese audience; no gratuitous 中英混杂 (keep only real identifiers/filenames in English).
