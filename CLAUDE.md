# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles (bash, vim, git). Vim is used only for quick edits, so there are no plugins. `_archive/` holds retired configs (e.g. `tmux.conf`) that nothing installs. There is no build, lint, or test tooling. To check a change, run the install script or source the file (e.g. `source ~/.bashrc`, `:source ~/.vimrc`).

The repo must live at `~/.dotfiles`. Scripts and config files hardcode that path (`bashrc` sources `~/.dotfiles/bash/bash_prepare`, and `linux/makelinks.sh` uses `~/.dotfiles`).

## Target environments

Changes must work in all three, so avoid anything that needs a desktop or GUI, or that only works on one OS:
- **Windows via WSL (Ubuntu), bash.** Windows itself is only the host; there are no Windows-native configs.
- **macOS, zsh.** zsh doesn't read `bashrc`, so only `vimrc` and `gitconfig` apply there. macOS ships BSD versions of tools like `ls` and `du`, which don't accept all the GNU options.
- **Ubuntu Server (latest), bash.** Headless.

## Installation model

`linux/makelinks.sh` installs by **symlinking**, so edits in the repo take effect right away.
- Moves existing `~/.bashrc`, `~/.vimrc`, and `~/.gitconfig` to `~/.dotfiles_old`, then symlinks them to the root-level files here. To manage a new root-level dotfile, add it to the `files` variable.
- Creates `~/.vim/.swap` and `~/.vim/.backups`, which `vimrc` expects.
- The script isn't idempotent: on a second run `mv` moves the existing symlinks into the backup folder.

## Bash layering

`bashrc` (based on the Ubuntu default) sources `bash/bash_prepare`, the place to add `source` lines for further custom scripts. `bash_prepare` currently sources `bash/bash_aliases`. Put new aliases and functions in `bash/` and wire them in through `bash_prepare`, not directly in `bashrc`.
