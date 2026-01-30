#!/usr/bin/env bash
set -euo pipefail

while true; do
  git add -A
  git commit -m "wip" || true
  git push
  sleep 30 
done
