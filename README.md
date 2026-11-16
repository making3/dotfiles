# About
This repo includes my custom vimrc, bash, and git config files. Old configs I no longer use live in `_archive/`. Follow the instructions below.

## Where this repo is used

| Environment | Shell | Notes |
|---|---|---|
| Windows, via WSL (Ubuntu) | bash | Everything runs inside WSL; see "Windows host" below. |
| macOS | zsh | Only `vimrc` and `gitconfig` apply. zsh doesn't read `bashrc`. |
| Ubuntu Server (latest) | bash | Headless, so no desktop or GUI setup. |

## Installation

### Linux / WSL (Copy the full command)
    
    git clone https://github.com/making3/dotfiles.git ~/.dotfiles &&
    chmod +x ~/.dotfiles/linux/makelinks.sh &&
    ~/.dotfiles/linux/makelinks.sh

### Windows host (for WSL)

Everything runs inside WSL, so the only things to install on Windows are:

- [VS Code](https://code.visualstudio.com/) with the [WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
- [Windows Terminal](https://aka.ms/terminal)

Keep projects on the WSL filesystem (e.g. `~/code`), not under `/mnt/c`, and open them with `code .` from WSL.
