# Methodology — 怎么做出一个"真正的分享"

Tools produce artifacts. This file is about making the artifact *work*. Skim the relevant section
before finalizing anything. These aren't opinions — they're the durable frameworks that professional
communicators (Duarte, Reynolds, Minto, Tufte, the TED canon, Mayer's learning research) keep arriving
at. The throughline: **respect the audience's attention. Every element either earns its place by aiding
understanding, or it gets cut.**

## The one question that comes first (Duarte)

Before anything: **what transformation do you want?** Who is the audience when they arrive, and who do
you want them to be when they leave? Design for that change, not for "what I want to say." The audience
is the hero; you are the guide. If you can't name the before→after state, you're not ready to build.

## Narrative structure — give it an arc, not a list

A share without a spine is just information. Impose one of these:

- **Single core idea (TED).** Every great talk carries exactly *one* idea worth spreading. If you can't
  state it in one sentence, it isn't refined yet. Everything serves that one line.
- **Pyramid Principle (Barbara Minto).** Lead with the answer, then 3 supporting points, then evidence.
  Especially for execs/decision-makers — never make them wait for the conclusion.
- **SCQA opener (Minto).** Situation (uncontested) → Complication (the tension) → Question (it raises)
  → Answer (your claim). The fastest way to pull an audience in without a rambling preamble.
- **Sparkline oscillation (Duarte).** Toggle between *what is* (current reality) and *what could be*
  (the better future) to build rhythmic tension; end on "new bliss" + a clear call to action.
- **Three-act arc (TED / hero's journey).** Establish the problem & resonate → reveal the insight/turn
  → show the world after + the next step. Put the emotional hook in the first ~90 seconds.

**Emotion before information.** Stories are remembered far more than data alone — build the resonance
first, then deliver the numbers as support. And the **ending is the memory anchor** (Duarte): the last
thing said is what sticks, so end on your one line or your one ask — never "ok, that's it."

## Visual design — clarity is the goal, beauty serves it

- **One idea per unit (Reynolds + Mayer's coherence/segmenting).** One slide / card / scene = one point.
  Multiple concepts at once split attention; let each land before the next.
- **Image over text (Reynolds).** A slide is a visual medium. Images carry emotion; your spoken words
  carry logic. Don't make them duplicate each other.
- **Whitespace is a tool, not waste (Reynolds).** Generous margins and breathing room increase focus.
  Delete anything unrelated to the core message.
- **Big type forces clarity (Kawasaki 10/20/30).** Minimum ~30pt on slides. If text needs to be smaller,
  there's too much of it — cut, don't shrink.
- **Maximize data-ink, kill chartjunk (Tufte).** Every drop of ink in a chart should encode data.
  Remove 3D effects, gratuitous color, redundant gridlines, decorative borders. Let the data show.
- **Signal attention (Mayer's signaling).** Use arrows, highlight, bold, contrast to guide the eye to
  the one thing that matters. Don't assume the viewer will find it.

## The shared visual contract (cross-medium)

The principles above are *why*; the concrete, reusable *how* lives in **`design-system.md`** — the one
contract every medium pulls from so a deck, a card, a video frame and an explorable read as siblings.
It fixes the details that otherwise get re-decided (badly) every time: **one reading measure (60–75
chars) + deliberate full-bleed, restrained code blocks (desaturated strings, lines wrap not clipped,
whole-row highlight ≤3 lines), flowcharts with real directed edges (Mermaid/SVG, never bare divs), and
no card-in-card.** It also sets the **two registers** — *product* (docs/dashboards/explainers: house
tokens, don't chase distinctiveness) vs *brand* (cards/posters/covers: make one deliberate signature
move) — and the **anti-pattern self-check** to run before handing over. Read it alongside this file.

## Information density & cognitive load (Mayer's multimedia principles)

- **Redundancy kills.** Spoken narration + visual = effective dual channel. Spoken + on-screen *full
  text* + visual = overload. Slide text should be keywords, not your script.
- **Segment it.** Break content into learner-paced chunks; one concept per step.
- **A slide must not stand alone (Reynolds/Duarte).** If it reads fine without you, it's a *Slidedoc*
  (a written doc), not a talk slide. Decide which you're making — they have different rules.

## Accessibility & legibility (cheap, high-impact)

- Contrast: body text should pass ~4.5:1 against its background. Light-gray-on-white fails.
- Type size: assume the worst viewing condition — talk slides ≥ 24–30pt; social cards must be readable
  as a thumbnail.
- Don't encode meaning by color alone (colorblind readers) — pair with labels/shape/position.
- No walls of text. If a slide needs a paragraph, it's a document, not a slide.

## Aspect ratios & platform sizing (decide BEFORE building)

The medium and platform fix the canvas. Building first and resizing later wrecks layouts.

| Target | Ratio / size | Notes |
|--------|--------------|-------|
| Slides (modern) | 16:9 | Default for talks/screens |
| Twitter/X single image | 16:9 (1600×900) | Cropped to ~2:1 in feed — keep key content centered |
| 小红书 / Instagram | 3:4 (1080×1440) or 1:1 | Vertical wins the feed |
| 公众号 cover (new) | 21:9 banner (2100×900) + 1:1 square (1080×1080) | Render both from one HTML via `--ids`; the 1:1 is re-typeset, not a crop. See `images.md` |
| 公众号 in-body image | width 1080px | Height free; long-image OK |
| YouTube thumbnail | 16:9 (1280×720) | Big face/text, high contrast |
| Short video (Reels/抖音) | 9:16 | Vertical, captions burned in |
| Explainer video | 16:9 1080p | 30s–3min sweet spot |

## Per-medium checklists (self-review before handing over)

### Slides
- [ ] One idea per slide; the title states the takeaway, not the topic ("Latency dropped 60%" not "Performance").
- [ ] Lead with the answer (Minto); open with a hook in the first 90s (TED).
- [ ] No slide is a wall of text; type ≥ 30pt (Kawasaki); detail lives in speaker notes.
- [ ] Code shown is minimal and highlighted to the line that matters (signaling).
- [ ] A clear arc: hook → problem → insight/demo → how → call to action.
- [ ] Consider the 10/20/30 discipline: ~10 slides, ~20 min — constraints force clarity.
- [ ] Each slide uses a named layout recipe (SL01–SL10 in `slides.md`), not a one-off; the series has rhythm.
- [ ] Density caps respected: ≤4 bullets, ≤6 elements, code ≤20 lines with ≤5 highlighted (`slides.md`).
- [ ] Code/flowchart slides follow the shared contract: restrained syntax color, directed-edge diagrams (`design-system.md` §3–4).
- [ ] Last slide = the one ask + where to find more (the memory anchor).

### Image / poster / card
- [ ] Passes the **thumbnail test**: core message legible when shrunk to feed size.
- [ ] One focal point; clear hierarchy (headline > subtext > detail); signaling guides the eye.
- [ ] Correct aspect ratio for the target platform (table above).
- [ ] ≤ 2 fonts, ≤ 1 accent color; generous whitespace; safe margins.
- [ ] Charts follow Tufte: no chartjunk, data-ink maximized.
- [ ] If it's a series (小红书 carousel), pick a named layout recipe and keep it consistent (`images.md`).
- [ ] **3:4 density (4-band test)**: split the 1440px height into four 360px bands; each is Filled or
      justified-empty. Fix any under-filled band by adding content, not empty spacers (`images.md`).
- [ ] Chinese cards: headline size matches its 字数, body ≥28px, one CJK + one Latin family (`images.md`).
- [ ] Code cards & diagrams follow the shared contract (`design-system.md` §3–4); ran the §7 anti-pattern check.
- [ ] **Byline / @handle is the user's real one** (ask if unknown) — never a placeholder like `@xxx` / `@skill笔记`; same for any logo, name, or QR.
- [ ] Brand-register piece makes **one** deliberate signature move; not the reflex defaults (`design-system.md` §6).

### Video / GIF
- [ ] **Hook in the first 3 seconds** — show the payoff or pose the question immediately.
- [ ] Narration/beats scripted before animating; each scene = one point (segmenting).
- [ ] Don't read the on-screen text aloud verbatim (redundancy principle).
- [ ] Pacing: cut dead air. Aim short — most explainers are 2× too long.
- [ ] Captions/subtitles burned in (most people watch muted).
- [ ] Correct aspect ratio (16:9 horizontal, 9:16 vertical short).
- [ ] Every beat names a shot recipe (VS01–VS10 in `video.md`); a beat with no recipe has no clear job.
- [ ] No beat runs past ~45s without a cut (code walkthrough ≤90s); narration pace in range (`video.md`).
- [ ] Ends with the action + handle/link (memory anchor).
- [ ] Code/diagram frames follow the shared contract: restrained syntax color, directed-edge flowcharts (`design-system.md` §3–4).

### Interactive HTML
- [ ] Opens from `file://` with no build/server/API key and works; self-contained (`interactive.md`).
- [ ] The pre-interaction **default state already conveys the core message** — interaction deepens, doesn't gate it.
- [ ] One primary interaction (IH01–IH08 in `interactive.md`); extras are progressively disclosed (principle ① subtract; ⑥ active>passive).
- [ ] Controls have clear affordances, visible focus, ≥44px touch targets; responsive at 375px; keyboard-usable.
- [ ] Respects `prefers-reduced-motion`; degrades to readable static content if JS fails.
- [ ] The interaction serves the message — if a static image would say it as well, make the image.
- [ ] One reading measure + deliberate full-bleed; code wraps & is restrained; flowcharts have directed edges; ran the `design-system.md` §7 anti-pattern check.

## Common failure modes (and the fix)

> These are the message/narrative-level misses. For the visual/technical ones (width, code, flowcharts,
> CSS leaks, async races, AI fingerprints), the live **Gotchas hub is `design-system.md` §7** — run it
> before handing over any artifact with HTML, code, or a diagram.

- **"I dumped everything in."** → One message; the rest becomes an appendix or a follow-up.
- **Decoration over communication.** → Remove anything that doesn't aid understanding (Reynolds/Tufte).
- **Built for the desktop, consumed on mobile.** → Test at target size before shipping.
- **No narrative.** → Impose an arc (SCQA / Sparkline / three-act). Even a card has a before→after.
- **Buried the ask.** → State one action explicitly, prominently, at the end.
- **The slide is the script.** → If it stands alone, it's a Slidedoc; strip it to keywords + visuals.
- **Wrong shape — patched, not restarted.** → If *your own fresh draft* is fundamentally the wrong *form*
  (a PPT-knockoff when a real website was needed; a deck when a one-pager was), don't iterate on the
  broken skeleton — **restart from the right shape, reuse the good assets.** (Different case: an
  *existing, shipped* artifact is **audit-and-improve in place** — Scan → Diagnose → Fix, preserve
  working code — not a gratuitous rewrite. Restart your wrong draft; improve a real site.)
- **Recreated the proof.** → For before/after and good/bad comparisons, show the **real, uncompressed
  artifact** (the actual screenshot / original page), not a prettified re-creation. Remade "evidence" is
  no longer evidence; authenticity beats polish here. When the change is **code or text, show it as a
  git-diff** (`design-system.md` §3 diff view) — `−`/`+` lines — not two separate blocks.
- **The demo doesn't demonstrate.** → For a teaching/explainer share, the example must *vividly exhibit
  the claim* (a too-mild example proves nothing); use **more than one counter-example, from different
  angles**, and **show the fix's effect on them** — problem → fix → re-test, not just the polished end
  state. The visible iteration loop is the lesson.
- **Jargon over the reader's head.** → Match vocabulary to the audience; define or drop unfamiliar terms
  and abbreviations (and don't mix languages gratuitously). Unfamiliar-word density is a readability tax.
- **Patched a fragment, broke the flow.** → Place each edit where it belongs in the *whole* arc (e.g. a
  v2 fix goes right after the problem it fixes), then re-read end-to-end — don't edit only the fragment
  you're looking at.
- **Gold-plating every channel.** → Stop when it lands. Not every companion piece needs equal polish — a
  quick 小红书 set can stay simple; over-producing is its own failure.
- **Imposed a default on the wrong audience.** → Base theme, density, and formality follow the *audience*,
  not habit. A broad/public/how-to share usually wants a **light, plain** base, not the dark brand look
  (`design-system.md` §1/§6). Decide it up front, with aspect ratio.

## See the principles in action

These principles are abstract until you watch a master apply them. `references/exemplars.md` pairs each
medium with a benchmark creator and the concrete techniques they use — read it alongside this file: the
principles tell you the rule, the exemplars show you the move.

## Want to go deeper (further reading)

Garr Reynolds *Presentation Zen* · Nancy Duarte *Resonate* / *slide:ology* · Barbara Minto *Pyramid
Principle* · Edward Tufte *The Visual Display of Quantitative Information* · Mayer's 12 multimedia
principles · for developer-specific craft: Scott Hanselman's "Tips for a Technical Presentation",
Simon Willison's blog, Write the Docs, and Google's Technical Writing course.
