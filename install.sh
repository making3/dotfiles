#!/usr/bin/env bash
# Symlinks the dotfiles in ~/.dotfiles into the home directory.
# Safe to re-run: links that are already correct are left alone, and anything
# else in the way is moved to a timestamped folder under ~/.dotfiles_old.
set -euo pipefail

readonly dotfiles_dir="$HOME/.dotfiles"
backup_dir="$HOME/.dotfiles_old/$(date +%Y%m%d-%H%M%S)"
readonly backup_dir
readonly files=(bashrc zshrc vimrc gitconfig)

link_file() {
  local src="$dotfiles_dir/$1"
  local dest="$HOME/.$1"

  if [[ ! -e "$src" ]]; then
    echo "error: $src does not exist" >&2
    exit 1
  fi

  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then
    echo "ok:        $dest"
    return
  fi

  if [[ -e "$dest" || -L "$dest" ]]; then
    mkdir -p "$backup_dir"
    mv "$dest" "$backup_dir/"
    echo "backed up: $dest -> $backup_dir/"
  fi

  ln -s "$src" "$dest"
  echo "linked:    $dest -> $src"
}

main() {
  if [[ ! -d "$dotfiles_dir" ]]; then
    echo "error: this repo must be cloned to $dotfiles_dir" >&2
    exit 1
  fi

  local file
  for file in "${files[@]}"; do
    link_file "$file"
  done

  # vimrc expects these to exist.
  mkdir -p "$HOME/.vim/.swap" "$HOME/.vim/.backups"

  # Use the repo's versioned hooks (shellcheck and shfmt on commit).
  git -C "$dotfiles_dir" config core.hooksPath githooks
  echo "hooks:     git hooks set to $dotfiles_dir/githooks"

  echo "Done. Open a new shell to load the new config."
}

main "$@"
