#!/usr/bin/env bash
set -euo pipefail

count_files() {
  local dir="$1"

  if [[ -d "$dir" ]]; then
    find "$dir" -type f ! -name ".DS_Store" | wc -l | tr -d ' '
  else
    echo 0
  fi
}

while true; do
  printf "\033c"
  printf "%-12s %10s %15s %12s %10s\n" "LANGUAGE" "ANALYSIS" "BACKTRANS" "TRANSLATION" "TOTAL"
  for language_dir in */; do
    language="${language_dir%/}"
    analysis_count=$(count_files "$language/pipeline2/analysis")
    backtranslation_count=$(count_files "$language/pipeline2/backtranslation")
    translation_count=$(count_files "$language/pipeline2/translation")
    total=$((analysis_count + backtranslation_count + translation_count))
    printf "%-12s %10d %15d %12d %10d\n" \
      "$language" "$analysis_count" "$backtranslation_count" "$translation_count" "$total"
  done
  sleep 10
done
