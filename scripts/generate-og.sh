#!/usr/bin/env bash
# Regenerates public/og.png from scripts/og.html (needs chromium).
set -euo pipefail
cd "$(dirname "$0")/.."
chromium --headless --disable-gpu --hide-scrollbars \
  --window-size=1200,630 --virtual-time-budget=8000 \
  --screenshot="public/og.png" "file://$PWD/scripts/og.html"
echo "wrote public/og.png"
