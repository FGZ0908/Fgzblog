#!/usr/bin/env bash
set -euo pipefail

BASE="content/posts"

find "$BASE" -mindepth 2 -maxdepth 2 -type f -name "index.md" | while IFS= read -r md; do
  dir="$(dirname "$md")"

  date_value="$(awk '
    BEGIN { in_frontmatter=0; found=0 }
    NR==1 && $0 ~ /^---|^\+\+\+/ { delim=$0; in_frontmatter=1; next }
    in_frontmatter && $0 == delim { exit }
    in_frontmatter && $1 == "date:" {
      sub(/^date:[[:space:]]*/, "", $0)
      print $0
      found=1
      exit
    }
  ' "$md")"

  if [[ -n "${date_value:-}" ]]; then
    year="${date_value:0:4}"
  else
    year="$(stat -c '%y' "$md" | cut -c1-4)"
  fi

  folder_name="$(basename "$dir")"
  target="$BASE/$year/$folder_name"

  mkdir -p "$BASE/$year"
  if [[ "$dir" != "$target" ]]; then
    mv "$dir" "$target"
    echo "Moved $dir -> $target"
  fi
done
