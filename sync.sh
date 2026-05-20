#!/bin/bash
set -euo pipefail

echo "==> Fetching latest marketing skills from upstream..."
git submodule update --remote _upstream/

echo ""
echo "==> Changes since last sync:"
cd _upstream
GIT_PAGER=cat git log --oneline HEAD@{1}..HEAD 2>/dev/null || echo "(first sync — no previous HEAD to compare)"
cd ..

echo ""
echo "==> Skills updated. Review the diff above."
echo "    If it looks good: git add _upstream/ && git commit -m 'chore: sync marketing skills'"
echo "    If not:        cd _upstream && git checkout <previous-commit>"
