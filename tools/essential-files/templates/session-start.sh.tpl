#!/bin/bash
# SessionStart hook for Claude Code cloud sessions.
# Synchronous on purpose: dependencies are installed before the agent runs tests or linters.
# Safe to re-run. Based on the xs-serv session hook.
set -euo pipefail

# Local sessions are left alone; this only prepares remote containers.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Resolve the repo from this script's own location, not the current directory.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(cd "$SCRIPT_DIR/../.." && pwd)"
cd "$REPO_DIR"

if [ -f package.json ]; then
  # Install exactly what package-lock.json pins. Fall back to npm install when no lockfile exists.
  if [ -f package-lock.json ]; then
    npm ci --no-audit --no-fund
  else
    npm install --no-audit --no-fund
  fi

  # Put local binaries (tsc, vitest, and similar) on PATH for the session.
  if [ -n "${CLAUDE_ENV_FILE:-}" ]; then
    echo "export PATH=\"$REPO_DIR/node_modules/.bin:\$PATH\"" >> "$CLAUDE_ENV_FILE"
  fi
fi

echo "session-start: $(basename "$REPO_DIR") ready (node $(node -v 2>/dev/null || echo none), npm $(npm -v 2>/dev/null || echo none))" >&2
exit 0
