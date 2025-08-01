#!/usr/bin/env bash
set -euo pipefail
echo "[INFO] Cleaning up Docker..."
docker system prune -f
echo "[INFO] Removed dangling images & unused containers."
