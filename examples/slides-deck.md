---
marp: true
size: 16:9
paginate: true
style: |
  :root{
    --bg:#0B0E14; --surface:#141925; --line:#232A3A;
    --fg:#ECEFF5; --muted:#8B95A7; --accent:#56B6E6;
    --sans:-apple-system,"SF Pro Display","PingFang SC","Helvetica Neue",Arial,sans-serif;
    --mono:"SF Mono","JetBrains Mono",Menlo,Consolas,monospace;
  }
  section{
    background:#0B0E14; color:var(--fg);
    font-family:var(--sans);
    padding:78px 92px; font-size:30px; line-height:1.5;
  }
  section.lead{
    background:
      radial-gradient(1100px 600px at 88% -12%, rgba(86,182,230,.18), transparent 60%),
      #0B0E14;
    justify-content:center;
  }
  h1{font-size:84px; font-weight:800; letter-spacing:-.02em; line-height:1.02; margin:0; color:var(--fg) !important;}
  h2{font-size:48px; font-weight:800; letter-spacing:-.01em; color:var(--fg) !important; margin:0 0 .4em;}
  .accent,strong,h1 strong,h2 strong{color:var(--accent) !important;}
  .kicker{font:600 22px/1 var(--mono); letter-spacing:.26em; text-transform:uppercase; color:var(--accent); margin-bottom:18px;}
  .sub{color:#C7CEDB; font-size:34px; margin-top:.5em;}
  .muted{color:var(--muted);}
  ul{margin-top:.5em;} li{margin:.35em 0;}
  section::after{color:var(--muted); font-family:var(--mono); font-size:20px;}
  .big{font-size:56px; font-weight:800; line-height:1.12; letter-spacing:-.01em;}
  code{background:var(--surface); border:1px solid var(--line); border-radius:8px; padding:.08em .3em; color:#7BE0A8; font-family:var(--mono);}
  footer{color:var(--muted); font-family:var(--mono); font-size:20px;}
footer: "github.com/ma-pony/sharecraft"
---

<!-- _class: lead -->
<!-- _paginate: false -->

<div class="kicker">● A Claude Code skill</div>

# Make a share<br>that **lands.**

<p class="sub">The right message, shaped for one audience, on the right medium —
with nothing in the way of understanding.</p>

---

<!-- _class: lead -->

<div class="kicker">Step 0 · before any tool</div>

<p class="big">Who is the audience,<br>and what is the <span class="accent">one thing</span><br>they should remember?</p>

<p class="muted">If you can't say it in one sentence, it isn't refined yet.</p>

---

## One idea per slide

A slide is a **visual** medium, not a teleprompter.

- Image carries emotion · your words carry logic — don't duplicate them
- Big type forces clarity — if it must shrink, there's too much of it
- Whitespace is a tool, not waste
- Signal the **one** thing that matters; cut the rest

---

## Emotion first, then the data

<p class="big muted">Stories are remembered.<br><span class="accent">Lists are forgotten.</span></p>

Build the resonance, *then* deliver the numbers as support —
and end on your one line. The **last thing said is what sticks.**

---

<!-- _class: lead -->

# Tools are means.<br>**Making it land** is the point.

<p class="sub">Slides · cards · video · interactive — one content core, many outputs.</p>

<p class="muted">git clone → <code>~/.claude/skills/sharecraft</code> · MIT · zero API keys</p>
