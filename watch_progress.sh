#!/usr/bin/env bash
set -euo pipefail

while true; do
  for language_dir in */; do
    language="${language_dir%/}"
    progress_file="${language}/pipeline2/translation/chapters/progress.json"
    if [[ -f "$progress_file" ]]; then
      line_count=$(wc -l < "$progress_file" | tr -d ' ')
      printf "%s  %s\n" "$language" "$line_count"
    else
      printf "%s  %s\n" "$language" "MISSING"
    fi
  done
  sleep 10
done
