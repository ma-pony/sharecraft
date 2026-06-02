---
marp: true
size: 16:9
paginate: true
style: |
  :root{
    --bg:#0E1116; --surface:#161A22; --line:#222836;
    --fg:#F5F7FA; --muted:#8B95A7; --accent:#FF6B5B;
    --sans:-apple-system,"SF Pro Display","PingFang SC","Helvetica Neue",Arial,sans-serif;
    --mono:"SF Mono","JetBrains Mono",Menlo,Consolas,monospace;
  }
  section{
    background:#0E1116; color:var(--fg); font-family:var(--sans);
    padding:70px 88px; font-size:28px; line-height:1.5;
  }
  section.lead{
    background:radial-gradient(1100px 600px at 88% -12%, rgba(255,107,91,.18), transparent 60%),#0E1116;
    justify-content:center;
  }
  h1{font-size:80px; font-weight:800; letter-spacing:-.02em; line-height:1.02; margin:0; color:var(--fg) !important;}
  h2{font-size:44px; font-weight:800; letter-spacing:-.01em; margin:0 0 .35em; color:var(--fg) !important;}
  .accent,strong,h1 strong,h2 strong{color:var(--accent) !important;}
  .tag{position:absolute; top:34px; left:88px; font:700 19px/1 var(--mono); letter-spacing:.16em; color:var(--accent); text-transform:uppercase;}
  .kicker{font:600 21px/1 var(--mono); letter-spacing:.26em; text-transform:uppercase; color:var(--accent); margin-bottom:16px;}
  .sub{color:#C7CEDB; font-size:30px; margin-top:.5em;}
  .muted{color:var(--muted);}
  ul{margin-top:.4em;} li{margin:.3em 0;}
  section::after{color:var(--muted); font-family:var(--mono); font-size:18px;}
  code{background:var(--surface); border:1px solid var(--line); border-radius:8px; padding:.06em .3em; color:#7BE0A8; font-family:var(--mono);}
  pre{background:var(--surface); border:1px solid var(--line); border-radius:14px; font-size:24px;}
  .num{font-size:150px; font-weight:200; line-height:1; color:var(--fg);}
  .num b{color:var(--accent); font-weight:300;}
  .cols{display:grid; grid-template-columns:1fr 1fr; gap:40px; margin-top:.4em;}
  .cols .c{background:var(--surface); border:1px solid var(--line); border-radius:14px; padding:28px 30px;}
  .cols .c h3{margin:0 0 .3em; font-size:26px;}
  .steps{display:flex; gap:18px; margin-top:.6em;}
  .steps .s{flex:1; background:var(--surface); border:1px solid var(--line); border-radius:14px; padding:22px 20px;}
  .steps .s .i{font:800 30px/1 var(--mono); color:var(--accent);}
  .steps .s b{display:block; margin-top:.4em; font-size:24px;}
  footer{color:var(--muted); font-family:var(--mono); font-size:18px;}
footer: "sharecraft · slide layout recipes"
---

<!-- _class: lead -->
<!-- _paginate: false -->
<div class="tag">SL01 · Cover statement</div>

<div class="kicker">● Slide layout recipes</div>

# Pick a layout,<br>then **fill it.**

<p class="sub">Ten named slide recipes — each a different expression of the same first principles.</p>

---
<div class="tag">SL02 · Title + bullets</div>

## Lead with the answer, then support it

- One point per slide — the title states it
- 2–4 bullets, each a single line
- A bullet that wraps means it's two slides
- Detail lives in speaker notes, not here

---
<div class="tag">SL04 · Data hero</div>

## Caching cut database load

<div style="text-align:center; margin-top:.3em">
<div class="num">4<b>×</b></div>
<p class="muted" style="font-size:26px; margin-top:.3em">fewer queries on the hot path · p99 800ms → 190ms</p>
</div>

---
<div class="tag">SL05 · Two-column compare</div>

## Before → after, side by side

<div class="cols">
<div class="c"><h3 class="muted">Before</h3>
<ul><li>800ms p99</li><li>DB hit every request</li><li>Cold cache on deploy</li></ul></div>
<div class="c"><h3 class="accent">After</h3>
<ul><li><strong>190ms</strong> p99</li><li>Cache hit 94%</li><li>Warmed on boot</li></ul></div>
</div>

---
<div class="tag">SL06 · Code spotlight</div>

## Highlight the line that matters

```ts
function handler(req) {
  const key = cacheKey(req)
  const hit = cache.get(key)        // ← the line that matters
  if (hit) return hit
  return cache.set(key, query(req))
}
```

---
<div class="tag">SL09 · Steps / flow</div>

## A flow is signposts, not paragraphs

<div class="steps">
<div class="s"><span class="i">01</span><b>Request</b></div>
<div class="s"><span class="i">02</span><b>Cache key</b></div>
<div class="s"><span class="i">03</span><b>Hit? return</b></div>
<div class="s"><span class="i">04</span><b>Miss? query</b></div>
</div>

<p class="muted" style="margin-top:1em; font-size:24px">Reveal one step at a time with <code>&lt;v-clicks&gt;</code> in Slidev.</p>

---
<!-- _class: lead -->
<div class="tag">SL10 · Closing CTA</div>

# Try it: **one command.**

<p class="sub"><code>git clone … ~/.claude/skills/sharecraft</code></p>

<p class="muted">The last slide is the memory anchor — one ask, where to find more. Never "Thanks / Q&A".</p>
