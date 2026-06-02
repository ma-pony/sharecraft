---
name: sharecraft
description: >-
  Craft high-quality shareable materials — slide decks, posters/cards/images, and explainer videos —
  by combining best-in-class open-source tools (Slidev, Marp, markdown-to-image, poster-design,
  Carbon, CodeImage, Remotion, Manim, VHS, etc.) AND applying a real "how to make a great share"
  methodology (audience, narrative, information density, visual hierarchy). Use this whenever the
  user wants to MAKE something to share: a tech talk deck, a WeChat/小红书/Twitter card or poster,
  a code screenshot, an explainer/demo video, a terminal GIF, a launch graphic, a conference slide,
  or "turn this into something I can share." Trigger even if the user names only the tool (e.g.
  "make a Slidev deck", "generate a poster", "record a terminal GIF") or only the goal ("I need to
  share this project nicely"). Tools are means; making the share land is the point.
---

# Sharecraft — 做出真正打动人的分享物料

A great share is not "pretty output". It's **the right message, shaped for a specific audience, on
the right medium, with nothing in the way of understanding.** Tools make that fast; they don't make
it good. This skill does both: it forces a short thinking pass first, then drives best-in-class
open-source tools to produce slides, images, or video.

## Step 0 — Think before you build (never skip)

Spend 30 seconds answering these out loud with the user. Most bad shares fail here, not in tooling.

1. **Who** is the audience? (peers / execs / strangers scrolling / future-you) — sets depth, jargon, tone.
2. **One takeaway**: if they remember exactly one thing, what is it? Write it as a single sentence.
3. **Action**: what should they do/feel after? (try it / star it / approve it / understand it)
4. **Medium & where**: where will it actually be consumed? (WeChat feed, Twitter, a meeting, README, a talk) — this decides aspect ratio, length, and density more than anything.
5. **Effort budget**: 5-minute throwaway or a polished centerpiece? Don't over-build a Slack one-off.

If the user hasn't given enough to answer these, ask **one** tight clarifying question — then proceed.
Then read `references/methodology.md` for the principles that make each medium land. **Always skim it
before producing the final artifact** — it is what separates this skill from "just run a tool".

## Step 1 — Pick the medium (and feel free to combine)

The user often wants more than one artifact from the same content — a deck *and* a launch card, or a
video *and* a thumbnail. Plan the set, not just one piece.

| Goal | Primary medium | Read |
|------|----------------|------|
| Explain something with structure / a talk / walkthrough | Slides | `references/slides.md` |
| One striking visual: social card, cover, poster, code shot, infographic | Image | `references/images.md` |
| Show motion: concept animation, product demo, terminal flow | Video / GIF | `references/video.md` |
| Long-form article styled for a platform (公众号/知乎) | Styled doc | `references/images.md` (文颜/markdown-to-image) |

Then check `references/combine.md` — the real power is chaining tools (e.g. one Mermaid diagram reused
across a deck, a card, and a video; a Slidev slide exported as a social image).

**Before you build, learn from the best — the principle, not the look.** Skim the matching section of
`references/exemplars.md`. It first distills the *underlying principles* every benchmark keeps
rediscovering about attention and understanding, then shows how each one (3Blue1Brown, Kurzgesagt,
Fireship, TED/Jobs, Tufte/NYT, Bartosz/Nicky Case, Julia Evans, awesome-readme) *expressed* those
principles for their audience. Reason from the principle and **invent your own expression** that fits
this topic and these tools — copying the surface gives a knockoff; honoring the principle gives original,
effective work.

## Step 2 — Set up the tool, then build

This skill **deeply integrates** the open-source projects rather than reinventing them. Each reference
file gives the exact setup command, the minimal authoring loop, and how to export. Prefer the tool the
user already has; otherwise install on demand and tell the user what you're installing and why.

Two load-bearing capabilities most recipes rely on — set these up once:

- **HTML/CSS → PNG** (the universal image/poster engine): a Playwright-based renderer. See
  `scripts/html_to_image.py`. This is how cards, posters, and infographics get pixel-perfect output
  without a heavy app.
- **A package manager**: most projects are Node (`pnpm`/`npm`) or Python (`pip`/`uv`). Detect what's
  available before assuming.

### Tool map (what to reach for)

- **Slides**: Slidev (developer talks, code-heavy), Marp (lightweight Markdown→PDF/PPTX), reveal.js (web);
  plus Pandoc (one-command convert), Patat (terminal/SSH demos), Impress.js (3D/Prezi-style).
- **Images / posters / cards**: HTML→PNG engine (custom designs + 小红书 carousel / 公众号 covers via
  templated loop), Satori (programmatic/batch OG images), markdown-to-image / Madopic (MD→poster),
  poster-design 迅排设计 (full editor), 文颜 wenyan (公众号/知乎 typesetting), Carbon / ray.so / CodeImage
  (code screenshots), Excalidraw + Mermaid + Draw.io (diagrams/infographics).
- **Video / GIF**: Remotion (React, programmatic video), Manim (math/concept animation),
  Motion Canvas / MotionForge (programmatic motion), VHS (scripted terminal→GIF) / asciinema+agg
  (live terminal recording), OBS (screen recording), ffmpeg (trim/convert/caption — bundled `video-editor` skill).

All of the above run locally with **no external API keys**. Don't introduce a tool that needs a paid
API or platform auth unless the user explicitly asks.

## Step 3 — Self-review against the medium's checklist

Before handing over, run the artifact against the checklist in `references/methodology.md` for its
medium (e.g. "one idea per slide", "card readable at thumbnail size", "video has a hook in 3s"). Fix
the gaps. Then state plainly: what you made, where the file is, and one concrete suggestion to make
it even better. Offer to produce the companion artifacts (the deck's launch card, the video's thumbnail).

## Quick recipes (common asks)

- **"Share this project nicely"** → README skim → a Slidev deck (overview→problem→demo→how it works→
  call to action) + one social launch card (`images.md`) reusing the deck's hero visual.
- **"Make a card for this post"** → 文颜 or markdown-to-image for text-heavy; HTML→PNG for custom design;
  size to the platform (see `methodology.md` aspect-ratio table).
- **"Explain this concept in a video"** → Manim for abstract/math, Remotion for UI/data, VHS if it's a
  CLI workflow. Script the narration beats first (`video.md`).
- **"Beautiful screenshot of this code"** → Carbon/CodeImage; pick theme matching the share's context.

Keep SKILL.md as the map; the references hold the detail. Read the relevant reference fully before building.
