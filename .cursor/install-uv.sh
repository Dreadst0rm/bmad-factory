#!/usr/bin/env bash
set -euo pipefail

# Idempotent uv install for Cursor Cloud Agent builds (login-shell PATH).
# Official installer: https://docs.astral.sh/uv/getting-started/installation/

if command -v uv >/dev/null 2>&1; then
  uv --version
  exit 0
fi

curl -LsSf https://astral.sh/uv/install.sh | sh
sudo ln -sf "${HOME}/.local/bin/uv" /usr/local/bin/uv
sudo ln -sf "${HOME}/.local/bin/uvx" /usr/local/bin/uvx
/usr/local/bin/uv --version
