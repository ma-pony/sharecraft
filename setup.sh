#!/usr/bin/env bash
#
# sharecraft setup — one command, fully self-contained, zero system pollution.
#
# Everything installs INSIDE this skill folder:
#     .venv/                 Python deps (playwright; + manim/ffmpeg with --video)
#     .cache/ms-playwright/  the chromium browser (NOT ~/.cache)
#     .bin/                  standalone binaries (vhs, with --terminal)
# To uninstall completely, just delete the folder — nothing else was touched.
#
# Usage:
#     ./setup.sh             core: HTML→PNG engine (cards/posters/interactive previews) + slides
#     ./setup.sh --video     + Manim & a bundled ffmpeg (concept animations, GIFs)
#     ./setup.sh --terminal  + VHS (scripted terminal GIFs)
#     ./setup.sh --all       everything above
#     ./setup.sh --clean     remove .venv/.cache/.bin (leaves the skill files)
#
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV="$SKILL_DIR/.venv"
BROWSERS="$SKILL_DIR/.cache/ms-playwright"
BIN="$SKILL_DIR/.bin"
PY="$VENV/bin/python"
export PLAYWRIGHT_BROWSERS_PATH="$BROWSERS"

c()  { printf '\033[36m▸ %s\033[0m\n' "$*"; }      # step
ok() { printf '\033[32m✓ %s\033[0m\n' "$*"; }      # done
warn(){ printf '\033[33m! %s\033[0m\n' "$*"; }     # heads-up

WANT_VIDEO=0; WANT_TERMINAL=0
for a in "${@:-}"; do
  case "$a" in
    "")            ;;
    --video)       WANT_VIDEO=1 ;;
    --terminal)    WANT_TERMINAL=1 ;;
    --all)         WANT_VIDEO=1; WANT_TERMINAL=1 ;;
    --clean)       c "Removing local env"; rm -rf "$VENV" "$SKILL_DIR/.cache" "$BIN"; ok "Clean."; exit 0 ;;
    -h|--help)     sed -n '2,20p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *)             warn "Unknown option: $a (try --help)"; exit 1 ;;
  esac
done

# ── 1. Python environment (uv if present — fast; else stdlib venv) ─────────────
if [ ! -x "$PY" ]; then
  if command -v uv >/dev/null 2>&1; then
    c "Creating local .venv with uv"
    uv venv "$VENV" >/dev/null
  else
    c "uv not found — creating local .venv with python3"
    python3 -m venv "$VENV"
    "$PY" -m pip install -q --upgrade pip >/dev/null 2>&1 || true
  fi
fi

# pip helper that targets the local venv whether or not uv is installed
pip_install() {
  if command -v uv >/dev/null 2>&1; then
    uv pip install --python "$PY" "$@"
  else
    "$PY" -m pip install -q "$@"
  fi
}

# ── 2. Core: Playwright + chromium (browser lands in the skill folder) ─────────
c "Installing core (Playwright) into .venv"
pip_install -r "$SKILL_DIR/scripts/requirements.txt"
c "Installing chromium into .cache/ (not ~/.cache)"
"$PY" -m playwright install chromium
ok "Core ready — HTML→PNG engine works. (Slides use npx, no install needed.)"

# ── 3. Video layer (opt-in) ───────────────────────────────────────────────────
if [ "$WANT_VIDEO" = 1 ]; then
  c "Installing video layer (Manim + bundled ffmpeg) into .venv"
  pip_install -r "$SKILL_DIR/scripts/requirements-video.txt"
  ok "Video layer ready — Manim animations + a venv-local ffmpeg."
fi

# ── 4. Terminal layer (opt-in): VHS binary into .bin ──────────────────────────
if [ "$WANT_TERMINAL" = 1 ]; then
  if command -v vhs >/dev/null 2>&1; then
    ok "vhs already on PATH: $(command -v vhs)"
  else
    mkdir -p "$BIN"
    osr="$(uname -s)"; arch="$(uname -m)"
    case "$arch" in x86_64|amd64) a=x86_64 ;; arm64|aarch64) a=arm64 ;; *) a="$arch" ;; esac
    ver="0.10.0"
    url="https://github.com/charmbracelet/vhs/releases/download/v${ver}/vhs_${ver}_${osr}_${a}.tar.gz"
    c "Fetching vhs ${ver} → .bin/"
    tmp="$(mktemp -d)"
    if curl -fsSL "$url" -o "$tmp/vhs.tgz" && tar -xzf "$tmp/vhs.tgz" -C "$tmp"; then
      found="$(find "$tmp" -type f -name vhs | head -1 || true)"
      if [ -n "$found" ]; then mv "$found" "$BIN/vhs"; chmod +x "$BIN/vhs"; ok "vhs installed → .bin/vhs"; else warn "vhs binary not found in archive."; fi
    else
      warn "Could not auto-download vhs for ${osr}/${a}. Install once: brew install vhs"
    fi
    rm -rf "$tmp"
    warn "VHS also needs 'ttyd' at runtime. On macOS install once with: brew install ttyd"
    warn "(ffmpeg is covered by --video's bundled imageio-ffmpeg; add .bin & .venv/bin to PATH when running vhs.)"
  fi
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo
ok "sharecraft is set up — all local to: $SKILL_DIR"
cat <<EOF

Run the bundled renderer with the skill-local interpreter (finds chromium automatically):
    "$PY" scripts/html_to_image.py card.html card.png --width 1080 --height 1350 --scale 2

Uninstall: delete this folder, or run  ./setup.sh --clean
EOF
