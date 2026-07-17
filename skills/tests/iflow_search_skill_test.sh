#!/usr/bin/env bash

set -euo pipefail

skill_file="iflow-search/SKILL.md"

if grep -Fq 'echo "$IFLOW_API_KEY"' "$skill_file"; then
  echo "iflow-search skill must not print IFLOW_API_KEY when checking configuration" >&2
  exit 1
fi

if ! grep -Fq '[[ -n "${IFLOW_API_KEY:-}" ]]' "$skill_file"; then
  echo "iflow-search skill should use a non-revealing IFLOW_API_KEY presence check" >&2
  exit 1
fi
