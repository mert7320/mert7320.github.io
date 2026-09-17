#!/bin/bash
# Double-click this file to preview the site locally.
# It opens your browser and serves the folder at http://localhost:8000
cd "$(dirname "$0")"

PORT=8000
URL="http://localhost:$PORT"

echo "=============================================="
echo "  MERT // ARCHITECTURAL ARCHIVE — LOCAL PREVIEW"
echo "  Opening $URL"
echo "  Press Ctrl+C in this window to stop."
echo "=============================================="

sleep 1
open "$URL" 2>/dev/null || echo "Open $URL in your browser"

if command -v python3 >/dev/null 2>&1; then
  python3 -m http.server "$PORT"
else
  python -m http.server "$PORT"
fi
