# Exemplars — 从标杆反推底层原理，再创新

**Learning from the best is not copying them.** Imitating 3Blue1Brown's look or Kurzgesagt's palette
gives you a knockoff. What actually transfers is the *principle underneath* the technique — and the
remarkable thing is that all these exemplars, across wildly different media, keep rediscovering the
**same small set of principles** about how human attention and understanding work. They differ only in
how they *express* those principles for their audience and medium.

So use this file in two passes:
1. **Understand the underlying principle** (the section below) — *why* the move works, rooted in how
   minds process information. This is the transferable part.
2. **Study how a benchmark expressed it** (the per-medium sections) — as proof and inspiration, not a
   template. Then **invent your own expression** that fits *your* topic, audience, and constraints.
   The best work is original precisely because its makers reasoned from these principles rather than
   copying the previous hit.

## The underlying principles (what every exemplar is really doing)

These are the first principles the case studies keep converging on. Reason from these; the specific
"moves" later are just one generation's way of honoring them. (These deepen the named frameworks in
`methodology.md` — Mayer, Duarte, Tufte, etc. — by showing *why* they hold.)

1. **Working memory is tiny — so subtract.** Minds hold only a few items at once; every extra element
   competes with the message. → *One idea per unit; signal the one thing; delete decoration.*
   Expressed as: Jobs's one-message-per-screen, Tufte's data-ink ratio, Fireship's only-key-lines.
   **Innovate by:** finding the subtraction *your* medium allows that others haven't tried.

2. **Understanding anchors new to known — so build the intuition before the formalism.** We grasp the
   unfamiliar only by attaching it to something we already feel. → *Concrete before abstract.*
   Expressed as: 3B1B showing the transform before the equation, Bartosz's draggable model before the
   math, Jobs's "1000 songs in your pocket" instead of "1GB". **Innovate by:** discovering what mental
   anchor *your specific audience* already has, and starting there.

3. **Attention is front-loaded and memory is end-loaded (primacy & recency).** People decide whether to
   stay in seconds, and remember the last thing most. → *Hook first, anchor last.* Expressed as: TED's
   opening scene, Kurzgesagt's 30-second claim, the thread hook, every strong closing CTA.
   **Innovate by:** designing a hook native to your content's real tension, not a borrowed gimmick.

4. **Two channels beat one, but only if they don't duplicate (dual coding).** Visual + verbal together
   stick — visual + the *same words on screen* overloads. → *Image carries what; narration carries why.*
   Expressed as: 3B1B's narration/visual split, Vox's captions as a second layer. **Innovate by:**
   deciding what each channel uniquely carries in *your* format.

5. **Emotion and narrative drive memory and action far more than facts alone.** A story is remembered
   ~20× a statistic. → *Impose an arc; create tension and release.* Expressed as: TED's emotional curve,
   The Pudding opening on a question, Kurzgesagt's pacing. **Innovate by:** locating the genuine tension
   in your material rather than bolting on a generic story shape.

6. **Active beats passive — we understand what we do (the generation effect).** Doing produces deeper
   encoding than watching. → *Let the audience act, predict, or play.* Expressed as: Nicky Case's
   playable sandboxes, Bartosz's interactivity, Amelia Wattenberger's runnable code. **Innovate by:**
   finding the smallest interaction that makes *your* point self-evident.

7. **Form must serve the message — and constraints force clarity.** A tight limit removes the option to
   hide behind volume. → *Self-impose a constraint; cut anything that doesn't carry information.*
   Expressed as: Kawasaki's 10/20/30, Reynolds's whitespace, Julia Evans's one-concept-per-card.
   **Innovate by:** choosing the constraint that sharpens *your* piece.

**The takeaway:** when you build, don't ask "what did 3Blue1Brown do?" Ask "*which principle* makes a
concept click, and what's the best way to honor it for my topic and my tools?" That's where your own
voice and innovation come from. The case studies below are evidence these principles work — and a
springboard, not a mold.

## 讲解动画 / concept animation — 3Blue1Brown (Grant Sanderson)

*Linear algebra series, "But what is a Fourier transform?". The gold standard for making the abstract
intuitive (built with Manim).*
- **Concrete first, symbols last.** Show what the transformation *does* visually before any formula.
  Viewers quit when shown an equation before the concept.
- **Encode the relationship with motion, not words.** A vector being stretched literally stretches on
  screen; matrix multiply warps the grid. The motion *is* the explanation; narration only labels it.
- **Color is a role, not decoration.** Keep one quantity one color for the whole piece (vector = blue,
  transform = orange). Define color constants up front in Manim and never drift.
- **Narration says *why*, visuals say *what* — never both (Mayer's redundancy).** Cut any line of
  script that repeats on-screen text.
- **Silence = think time.** Hold 1–2s after a key reveal so eyes catch up to the brain. Don't trim it.
- Reach for it when: explaining algorithms, system/data-flow changes, anything where a thing *transforms*.

## 科普 / explainer 视频 — Kurzgesagt

*Optimistic, dense science explainers for a general audience.*
- **One counterintuitive claim per video, stated in the first 30 seconds.** First line = the conclusion
  or paradox, no background ramp-up.
- **Make metaphors literal.** "Economic bubble" → draw an actual bubble. The metaphor must be visible,
  not just spoken.
- **Lock the palette to emotion on day one** (warm = hope, cold blue/black = threat) and never drift.
- **An "aha" every ~90 seconds.** Slice the script so a concept break or visual payoff lands regularly,
  or attention wanders.
- Reach for it when: product/tech explainers for non-technical decision-makers, annual-report or feature reveals.

## 开发者技术视频 — Fireship + lightning talks

*"X in 100 Seconds" — maximal information density with humor.*
- **The 100-second order: what it is → why it exists → one code snippet → who it's for.** Write those
  four answers as a paragraph before filming anything.
- **Every narration line maps to one frame** of code or diagram. If a line has no visual, cut or merge it.
- **Humor = an expectation drop at the turn** — after a dense bit, undercut with a mundane analogy. It's
  structural pacing relief, not random memes.
- **Code shows only the 1–3 lines that matter**; gray out / ellipsize the rest (signaling).
- **Lightning-talk move (Gary Bernhardt's *Wat*): show one phenomenon, don't explain it** — let the
  audience's laugh/surprise be the payload.
- Reach for it when: open-source intros, framework comparisons, API demos, weekly dev-update videos.

## 演讲与 keynote — TED · Jobs · Vox

- **TED — hook with a specific scene, not "thanks for having me."** First sentence: a specific person
  doing a specific thing at a specific time. Keep the one idea written at the top of the script and
  cut anything that doesn't serve it. Emotional arc: resonate → tension → relief → action.
- **Jobs keynote — one message per screen, physically isolated** (big black title + one image; never a
  bulleted list of benefits). Manufacture suspense ("but there's one more thing" + a deliberate pause).
  Use *comparative* numbers, not specs ("1000 songs in your pocket", not "1GB").
- **Vox / video essay — cut the visuals first, then record narration over them** (not the reverse).
  Make captions a second narrative layer (bold/color key terms). When data appears, animate it — static
  charts die on video; growth/spread/compare gives numbers a time dimension.
- Reach for it when: conference talks, exec briefings, launch videos, internal training.

## 数据可视化 — Tufte · NYT · The Pudding · Our World in Data

- **Tufte — maximize data-ink, kill chartjunk.** For each element ask "remove it — is information lost?"
  Layer multiple variables via visual channels (width/color/position) instead of many charts (Minard
  encodes 6). Use **small multiples** at one shared scale so the eye compares. Annotate next to the data,
  not via a legend.
- **NYT — scrollytelling.** Pin the visual, let scrolling text trigger one change at a time; each screen
  makes exactly one point.
- **The Pudding — lead with a cultural question, let data answer it** ("why are women's pockets smaller?").
  Data is evidence, not the star — open on a contestable/surprising question.
- **Information is Beautiful (McCandless) — 80% research, 20% design.** Exhaust the data in a spreadsheet
  before designing.
- Reach for it when: data reports, content-marketing pieces, persuasive decks, technical narratives.

## 交互式解释 — Bartosz Ciechanowski · Nicky Case · Distill

- **Bartosz (ciechanow.ski) — intuition before theory.** Give a draggable/spinnable model first, *then*
  the math. Each concept gets its own animation; reveal a complex system part-by-part; let scrolling
  drive the narrative (no clicking required).
- **Nicky Case (ncase.me) — make the concept playable.** Turn the core claim into a parameter sandbox so
  readers *play out* the conclusion. Chain beats with "but… so…" for drama; end by opening all parameters
  so the reader becomes the researcher. Let the system prove the point (procedural rhetoric).
- **Distill.pub — interactive figures beside the claim** (hover-to-preview citations, highlight what the
  model attends to). *Note: on hiatus since 2021, but the back catalog is still the benchmark.*
- Reach for it when: explaining how something works, ML/AI internals, interactive docs (build as an HTML
  artifact — see the `frontend-design` / `web-artifacts-builder` skills).

## 技术插画与漫画 — Julia Evans · Maggie Appleton · Amelia Wattenberger

- **Julia Evans (wizardzines) — one command/concept per page.** Split a topic into ~10 atomic, actually-
  useful points, one card each. Hand-drawn style with conversational asides ("wait, what?!") lowers the
  barrier — the reader feels they're discovering alongside you. Simplify without distorting; pick durable
  topics (Git/DNS/HTTP) that stay true for years.
- **Maggie Appleton — spatialize concepts.** Draw the *map* of how ideas relate (in/out, network) rather
  than a list; put labels inside the illustration so text is part of the image.
- **Amelia Wattenberger — the article *is* the demo.** Runnable, tweakable code examples; reveal code
  progressively, highlighting only what's new at each step.
- Reach for it when: cheat-sheet cards, onboarding docs, conference handouts, social knowledge cards.

## 社媒图文 — X threads · 小红书 cards

- **X thread — hook = number + counterintuitive result + promise** ("I studied X for 6 months; 3 findings
  that surprised me:"). One complete idea per tweet (don't break sentences across tweets), ~6–8 tweets.
  Put the strongest payoff in tweet #2 (tweet #1 hooks, #2 delivers). Add an image every 2–3 tweets.
  End with one clear CTA.
- **小红书 card — cover is one line, big.** 1080×1440 (3:4), headline ≥ 60px, high contrast, a single
  hook on the cover. Show progress (【3/7】 / page bar) to cut drop-off. Inner pages = 🔹subhead → 1–2
  sentences → highlighted takeaway. Delete every decorative word; keep only information.
- Reach for it when: knowledge sharing, tool recs, methodology summaries, personal-brand posts. Build the
  series via one HTML template looped through `scripts/html_to_image.py` (see `combine.md`).

## 开源项目展示 — GitHub README

*Reference: matiassingers/awesome-readme.*
- **Hero = logo + one-line "what + what problem" + a tight badge row** (CI/version/license). The hero must
  let someone decide "keep reading?" in 5 seconds.
- **A demo GIF is non-negotiable.** 10–30s of the core flow (record with VHS/Kap/LICEcap), compressed
  under ~1MB. It beats any prose.
- **Quick Start within the first ~3 screens**: install + a 3-line hello-world. Don't bury how to run it.
- **Badges with meaning only** (Shields.io, consistent style) — no badge soup.
- **A short Why/Motivation paragraph** — which existing-solution pain point this fixes — reaches the people
  who actually need it.
- Reach for it when: any repo front page, and internal project doc landing pages.

---

### Quick lookup

The last column is the **principle** to honor (numbered from the list above) — the exemplar's specific
move is just one way to express it. Start from the principle, then design your own move.

| Making… | Study (for inspiration) | Principle(s) to honor → then innovate |
|---------|-------------------------|---------------------------------------|
| Algorithm/system explainer animation | 3Blue1Brown | ② intuition-first + ④ dual-coding (motion = what, narration = why) |
| Product/tech explainer video | Kurzgesagt | ③ hook-first + ⑤ narrative (claim early, tension throughout) |
| Open-source short video | Fireship | ① subtract + ④ dual-coding (only key lines; line ↔ frame) |
| Conference talk / exec brief | TED · Jobs | ③ primacy/recency + ① subtract (one idea, one message per screen) |
| Data story | Tufte · NYT · Pudding | ① subtract + ⑤ narrative (kill chartjunk; open on a question) |
| "How it works" explainer | Bartosz · Nicky Case | ② intuition-first + ⑥ active (feel it before the math; let them play) |
| Cheat-sheet / knowledge card | Julia Evans | ⑦ constraint + ② anchor (one concept per card; approachable voice) |
| Social thread / 小红书 carousel | X threads · 小红书 | ③ hook/recency + ① subtract (promise up top; one idea per unit) |
| Repo front page | awesome-readme | ③ primacy + ⑥ active (decide in 5s; a demo GIF you can see working) |
