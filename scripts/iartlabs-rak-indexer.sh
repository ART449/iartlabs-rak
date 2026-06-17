#!/usr/bin/env bash
# iartlabs-rak-indexer.sh
# Indexa todos los repos clonados de ART449 y actualiza el RAK

RAK_DIR="${RAK_DIR:-$HOME/iartlabs-rak}"
WORK_DIR="${WORK_DIR:-$HOME/art44-investigacion}"

echo "=== IArtLabs RAK Indexer ==="
echo "RAK_DIR: $RAK_DIR"
echo "WORK_DIR: $WORK_DIR"

mkdir -p "$RAK_DIR/data"

# Update repos
for repo in "$WORK_DIR"/*; do
  if [ -d "$repo/.git" ]; then
    echo "Pulling $(basename $repo)..."
    (cd "$repo" && git pull --ff-only)
  fi
done

# Count files per repo
> "$RAK_DIR/data/repo-stats.txt"
for repo in "$WORK_DIR"/*; do
  if [ -d "$repo" ]; then
    name=$(basename "$repo")
    count=$(find "$repo" -type f -not -path '*/\.git/*' | wc -l)
    echo "$name: $count archivos" >> "$RAK_DIR/data/repo-stats.txt"
  fi
done

echo "Index complete. Stats:"
cat "$RAK_DIR/data/repo-stats.txt"
