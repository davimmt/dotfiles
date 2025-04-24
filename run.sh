#!/usr/bin/env bash

set -euo pipefail

dotfiles=(".zshrc" ".zprofile.rc" ".ohmyposh.toml")

for f in "${dotfiles[@]}"; do
  dest="${HOME}/${f}"

  # Check if the file exists and remove it before linking
  if [[ -L "$dest" || -f "$dest" || -d "$dest" ]]; then
      echo "🔄 Removing existing file: $dest"
      rm -rf "$dest"
  fi

  echo "🔗 Creating symlink: $f → $dest"
  ln -s "${PWD}/$f" "$dest"
done

echo "✅ All dotfiles have been linked successfully!"
