# Video / GIF — 讲解动画 / 产品演示 / 终端录制

Video is the highest-effort medium — script first, animate second. Apply `methodology.md` → Video
checklist (hook in 3s, one point per scene, captions burned in, short). Pick the tool by what you're
showing.

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

Write the beats before animating — it's far cheaper to fix a script than a render.
```
Hook (0-3s):    the payoff or the question. Why should they keep watching?
Beat 1:         one idea + its visual
Beat 2:         one idea + its visual
...
Payoff/CTA:     the takeaway + the action (star/try/link), handle on screen
```
Keep it short. Most explainers are 2× too long — cut ruthlessly.

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
