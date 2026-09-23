#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec python3 "$SCRIPT_DIR/../../../tools/fa_runner.py" \
  --config "$SCRIPT_DIR/fa_test.json" --variant "${BS_MODE:-serial}" \
  --nthreads "${NTHREADS:-1}" "$@"
