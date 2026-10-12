#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "$CLAUDE_PROJECT_DIR"

# Install Node dependencies when the repo has a package.json. Safe to re-run.
if [ -f package.json ]; then
  npm install
fi
