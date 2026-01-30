#!/usr/bin/env bash
set -euo pipefail

while true; do
  printf "\033c"
  for language_dir in */; do
    language="${language_dir%/}"
    if [[ -d "$language" ]]; then
      file_count=$(find "$language" -type f | wc -l | tr -d ' ')
      printf "%s  %s\n" "$language" "$file_count"
    else
      printf "%s  %s\n" "$language" "MISSING"
    fi
  done
  sleep 10
done
