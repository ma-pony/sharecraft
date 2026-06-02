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
| 公众号 cover (new) | 2.35:1 banner + 1:1 square | Render both via HTML→PNG |
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
- [ ] Last slide = the one ask + where to find more (the memory anchor).

### Image / poster / card
- [ ] Passes the **thumbnail test**: core message legible when shrunk to feed size.
- [ ] One focal point; clear hierarchy (headline > subtext > detail); signaling guides the eye.
- [ ] Correct aspect ratio for the target platform (table above).
- [ ] ≤ 2 fonts, ≤ 1 accent color; generous whitespace; safe margins.
- [ ] Charts follow Tufte: no chartjunk, data-ink maximized.
- [ ] If it's a series (小红书 carousel), one consistent template across cards.

### Video / GIF
- [ ] **Hook in the first 3 seconds** — show the payoff or pose the question immediately.
- [ ] Narration/beats scripted before animating; each scene = one point (segmenting).
- [ ] Don't read the on-screen text aloud verbatim (redundancy principle).
- [ ] Pacing: cut dead air. Aim short — most explainers are 2× too long.
- [ ] Captions/subtitles burned in (most people watch muted).
- [ ] Correct aspect ratio (16:9 horizontal, 9:16 vertical short).
- [ ] Ends with the action + handle/link (memory anchor).

## Common failure modes (and the fix)

- **"I dumped everything in."** → One message; the rest becomes an appendix or a follow-up.
- **Decoration over communication.** → Remove anything that doesn't aid understanding (Reynolds/Tufte).
- **Built for the desktop, consumed on mobile.** → Test at target size before shipping.
- **No narrative.** → Impose an arc (SCQA / Sparkline / three-act). Even a card has a before→after.
- **Buried the ask.** → State one action explicitly, prominently, at the end.
- **The slide is the script.** → If it stands alone, it's a Slidedoc; strip it to keywords + visuals.

## See the principles in action

These principles are abstract until you watch a master apply them. `references/exemplars.md` pairs each
medium with a benchmark creator and the concrete techniques they use — read it alongside this file: the
principles tell you the rule, the exemplars show you the move.

## Want to go deeper (further reading)

Garr Reynolds *Presentation Zen* · Nancy Duarte *Resonate* / *slide:ology* · Barbara Minto *Pyramid
Principle* · Edward Tufte *The Visual Display of Quantitative Information* · Mayer's 12 multimedia
principles · for developer-specific craft: Scott Hanselman's "Tips for a Technical Presentation",
Simon Willison's blog, Write the Docs, and Google's Technical Writing course.
