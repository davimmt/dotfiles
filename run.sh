#!/usr/bin/env bash

set -euo pipefail

dotfiles=(".zshrc" ".zprofile.rc" ".ohmyposh.toml")

for f in "${dotfiles[@]}"; do
  dest="${HOME}/${f}"

  if [[ -L "$dest" || -f "$dest" || -d "$dest" ]]; then
      timestamp=$(date +%s)
      echo "$dest -> $dest.$timestamp.bak"
      mv "$dest" "$dest.$timestamp.bak"
  fi

  ln -s "${PWD}/$f" "$dest"
done
