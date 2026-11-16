# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles (bash, vim, git). Vim is used only for quick edits, so there are no plugins. `_archive/` holds retired configs (e.g. `tmux.conf`) that nothing installs. There is no build or test tooling. To check a change, run the install script or source the file (e.g. `source ~/.bashrc`, `:source ~/.vimrc`). Shell scripts are `*.sh` files plus everything in `githooks/`. Lint them with `shellcheck`, and check formatting with `shfmt -d` (`shfmt -w` to fix; settings come from `.editorconfig`). Install both with `sudo apt install shellcheck shfmt` or `brew install shellcheck shfmt`.

`githooks/pre-commit` runs both on staged scripts and blocks the commit on any problem. `linux/makelinks.sh` turns it on by setting this repo's `core.hooksPath` to `githooks`.

The repo must live at `~/.dotfiles`. Scripts and config files hardcode that path (`bashrc` sources `~/.dotfiles/bash/bash_prepare`, and `linux/makelinks.sh` uses `~/.dotfiles`).

## Target environments

Changes must work in all three, so avoid anything that needs a desktop or GUI, or that only works on one OS:
- **Windows via WSL (Ubuntu), bash.** Windows itself is only the host; there are no Windows-native configs.
- **macOS, zsh.** zsh doesn't read `bashrc`, so only `vimrc` and `gitconfig` apply there. macOS ships BSD versions of tools like `ls` and `du`, which don't accept all the GNU options.
- **Ubuntu Server (latest), bash.** Headless.

## Installation model

`linux/makelinks.sh` installs by **symlinking**, so edits in the repo take effect right away.
- Symlinks `~/.bashrc`, `~/.vimrc`, and `~/.gitconfig` to the root-level files here. To manage a new root-level dotfile, add it to the `files` array.
- It's safe to re-run: correct links are skipped, and anything else in the way is moved to `~/.dotfiles_old/<timestamp>/`.
- Creates `~/.vim/.swap` and `~/.vim/.backups`, which `vimrc` expects.

## Bash layering

`bashrc` (based on the Ubuntu default) sources `bash/bash_prepare`, the place to add `source` lines for further custom scripts. `bash_prepare` currently sources `bash/bash_aliases`. Put new aliases and functions in `bash/` and wire them in through `bash_prepare`, not directly in `bashrc`.

## Shell scripts

Executable scripts (`*.sh`):
- Start with `#!/usr/bin/env bash`, then `set -euo pipefail` right after the header comment.
- Must pass `shellcheck` with no warnings and be formatted with `shfmt`. If a warning has to be suppressed, use a `# shellcheck disable=SCxxxx` comment on that line with the reason.
- Expected failures must be explicit, e.g. `cmd || true` with a comment, since `set -e` otherwise exits.
- Quote every expansion, declare function variables with `local`, and send errors to stderr.
- Must be safe to re-run.
- Create temporary files or folders with `mktemp`, and delete them with a trap so they're removed even when the script fails: `tmp=$(mktemp -d)` then `trap 'rm -rf "$tmp"' EXIT`.
- Must work on macOS: `/usr/bin/env bash` there is bash 3.2, so avoid bash 4+ features (`declare -A`, `mapfile`, `${var,,}`) and GNU-only flags (`readlink -f`, `sed -i` without a suffix argument, `date -d`).

Sourced files (`bashrc`, `bash/*`) run inside the interactive shell. Never add `set -e`, `set -u`, or `set -o pipefail` to them: a failing command would close the terminal, and an unset variable would break the shell.
