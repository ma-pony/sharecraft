# Video / GIF — 讲解动画 / 产品演示 / 终端录制

Video is the highest-effort medium — script first, animate second. Apply `methodology.md` → Video
checklist (hook in 3s, one point per scene, captions burned in, short). Pick the tool by what you're
showing. For code/diagram frames, follow the shared visual contract in **`design-system.md`** (§3–4):
restrained syntax color, directed-edge flowcharts, palette tokens.

## Decision guide

| You're showing | Use |
|----------------|-----|
| Abstract / math / algorithm concepts | **Manim** |
| UI, data, motion graphics, anything React-renderable | **Remotion** |
| Programmatic 2D animation (canvas/TS) | **Motion Canvas** / **MotionForge** |
| A command-line workflow | **VHS** (terminal → GIF/MP4) |
| A live app / screen demo | **OBS Studio** (record), then trim |
| Trim / convert / add captions to existing video | **ffmpeg** (see the bundled `video-editor` skill) |

## Script first (do this before any tool)

Write the beats before animating — it's far cheaper to fix a script than a render. Use a beat sheet
where every row carries its own narration, what's on screen, a shot recipe, a duration, and a
transition. That structure is what keeps each beat to one idea and the whole thing short:

```
# Beat sheet — <title>   | target: <total>s | platform: <…> | ratio: <…> | narration: <WPM>
| # | Narration (verbatim)        | On screen (what's visible)      | Shot | Dur | Transition |
|---|-----------------------------|---------------------------------|------|-----|------------|
| 0 | "Ever wondered why X…"       | full-screen question / result   | VS01 | 3s  | cut        |
| 1 | "Take one concrete case…"   | one specific object animates in | VS02 | 15s | fade       |
| 2 | "Now generalize it…"        | that case morphs into the form  | VS03 | 10s | cut        |
| … |                             |                                 |      |     |            |
| n | [silent / captions only]    | link + handle, centered, still  | VS10 | 4s  | fade-out   |
```
Narration is the *verbatim* script (not "explain X"). On-screen describes visible elements (not mood).
Keep it short — most explainers are 2× too long; cut ruthlessly.

## Scene / shot recipes — name the move, then animate it

Each shot is a different expression of the `exemplars.md` first principles (concrete-before-abstract ②;
front-load attention / end on the anchor ③; dual coding ④; subtract ①). Pick one per beat:

| ID | Shot | Use for | The move | Best tool |
|----|------|---------|----------|-----------|
| **VS01** | Hook | first 3s | show the payoff/result or pose the question immediately — no "hi, today…" | Remotion / Manim |
| **VS02** | Concrete-first | before any abstraction | animate one real example (x=3) before the symbol | Manim / Motion Canvas |
| **VS03** | Abstraction morph | reveal the general form | transform the concrete into the abstract (same thing!) | Manim (`TransformMatchingShapes`) |
| **VS04** | Spotlight | direct the eye | highlight/zoom the one part; dim the rest — never two at once | Manim `Indicate` / Remotion |
| **VS05** | Progressive reveal | a 3–6 step process | each step lands before the next starts; finished steps recede | Remotion / Motion Canvas |
| **VS06** | Data-driven | numbers as motion | props-drive values via `interpolate()`/`spring()` | Remotion |
| **VS07** | Code walkthrough | the key snippet | type it in, highlight the line as narration hits it; ≤90s then split | Remotion / VHS |
| **VS08** | Side-by-side | A vs B, old vs new | both on screen at once (spatial, not sequential); flag the diff | Remotion / Manim |
| **VS09** | Callback summary | reinforce before the end | re-run VS01's result / dynamic checklist, faster; no new info | Remotion / Manim |
| **VS10** | CTA | the memory anchor | motion stops; one action + handle centered, held 3–5s | Remotion / ffmpeg overlay |

## Rhythm & timing specs

- **Hook ≤3s.** If the first frames are still intro, it fails.
- **Narration pace:** horizontal explainer 140–160 WPM; shorts (Fireship-style) 180–220. `words ÷ 150 ≈
  minutes` — use it to size the script. Slow to ~130 for formulas/code.
- **Per-beat duration:** most beats 5–30s; a beat past ~45s with no internal cut is too long → split
  (code walkthrough VS07 may go to ~90s). Cut dead air.
- **Platform length:** shorts/Reels/抖音 20–45s (cap 60); horizontal explainer 60–90s simple / 3–5 min
  complex; README GIF ≤15s.
- **Captions (burn in — most watch muted):** ≤2 lines, ≤~42 Latin / ~20 CJK chars per line, 12–17
  chars/sec, ≥36px @1080p. Don't make captions echo the narration verbatim (that's redundancy ④) — let
  them carry keywords while the voice carries the sentence.

## Remotion (React → video; UI/data/motion)

Programmatic video in React. Best for product demos, data viz, animated text, anything you can build
as a component. Local rendering, no API.
```bash
npm init video@latest        # scaffold (pick a template)
cd my-video
npm run dev                  # Remotion Studio: live preview + timeline
npx remotion render          # render to out/video.mp4
```
Author compositions in `src/`; drive animation with `useCurrentFrame()` + `interpolate()`/`spring()`.
Set fps and dimensions in the composition (1080p 16:9, or 1080×1920 9:16 for shorts). Reuse your
brand colors and even a Mermaid diagram or a deck slide as assets (see `combine.md`).

Patterns worth reusing: structure each beat as a `<Sequence from durationInFrames>` (or `<Series>`) so
timing is explicit, not CSS-transition guesswork; keep three `spring()` presets — snappy entrance
`{stiffness:180,damping:12,mass:0.5}`, smooth slide `{stiffness:200,damping:100}`, emphatic bounce
`{stiffness:80,damping:6}`; and lift all text/data/durations to `props` so one composition batch-renders
a whole series (`renderMedia({inputProps})`) — that's the VS06 data-driven recipe.

## Manim (concept / math animation)

3Blue1Brown's engine — unbeatable for explaining abstract ideas, transformations, and step-by-step math.
```bash
pip install manim    # needs a system ffmpeg; on mac: brew install ffmpeg
```
```python
# scene.py
from manim import *
class Explain(Scene):
    def construct(self):
        title = Text("How it works").scale(1.2)
        self.play(Write(title)); self.wait()
```
```bash
manim -pqh scene.py Explain   # -p preview, -qh high quality -> media/.../Explain.mp4
```
Use the Community edition (`ManimCommunity/manim`). Great for educational/technical sharing.

What makes Manim land (the 3b1b moves, reduced to rules): **one motion per `self.play()`** — two
simultaneous changes split attention; **`Indicate`/`Circumscribe`/`FocusOn` over text arrows** (VS04) —
transient highlight guides the eye and leaves no clutter; and **`Transform`/`TransformMatchingShapes`
is the insight** (VS03) — morphing A into B *is* the explanation that text can't give. Always go
concrete before symbolic (VS02).

## Motion Canvas / MotionForge (programmatic 2D motion)

- **Motion Canvas** (`motion-canvas/motion-canvas`): TypeScript, generator-based animation with a
  visual editor — excellent for crisp informative animations and code-walkthrough style videos.
  ```bash
  npm init @motion-canvas@latest
  ```
- **MotionForge**: React-based Remotion alternative with many built-in effects and WebCodecs export —
  consider if Remotion's licensing or feature set doesn't fit.

## VHS (terminal → GIF/MP4) — perfect for CLI demos

Script your terminal session declaratively; get a clean, reproducible GIF. No screen-recording jitter.
```bash
brew install vhs    # or see charmbracelet/vhs releases
```
```tape
# demo.tape
Output demo.gif
Set FontSize 22
Set Width 1200
Set Height 600
Type "npm install sharecraft"
Enter
Sleep 2s
```
```bash
vhs demo.tape       # -> demo.gif
```
Ideal for READMEs and tweets showing a tool's usage. Keep it under ~15s; show one clear flow.

### Recording a real session (when you don't want to script it)

VHS is scripted/reproducible — best for clean, repeatable demos. When you'd rather just **record a live
session**, use the asciinema toolchain (both actively maintained, no API):
- **asciinema** (`asciinema/asciinema`): records to a lightweight `.cast` file — text stays selectable
  and copyable, embeddable as a web player. `asciinema rec demo.cast`.
- **agg** (`asciinema/agg`): official `.cast` → GIF converter (Rust, high quality) when you need a GIF.

That's deliberately it — VHS + asciinema/agg cover scripted and live recording. (Older tools like
termtosvg and svg-term-cli exist for SVG output but are archived/unmaintained — avoid for new work.)

## OBS Studio (screen / app recording)

For demoing a real app or website. Record a clean take, then trim and caption with ffmpeg. Set canvas
to the target resolution/aspect up front. Record at the size you'll publish to avoid rescaling blur.

## Post-production with ffmpeg

The bundled **`video-editor`** skill wraps ffmpeg for trimming/cutting. Beyond that:
```bash
# convert GIF->MP4 (smaller, smoother)
ffmpeg -i demo.gif -movflags +faststart -pix_fmt yuv420p demo.mp4
# burn in subtitles
ffmpeg -i in.mp4 -vf "subtitles=subs.srt" out.mp4
# crop 16:9 -> 9:16 for shorts (center)
ffmpeg -i in.mp4 -vf "crop=ih*9/16:ih" -c:a copy short.mp4
```
Always burn captions in — most people watch muted.
