# About
This repo includes my custom vim, bash, zsh, and git config files. Old configs I no longer use live in `_archive/`. Follow the instructions below.

## Where this repo is used

| Environment | Shell | Notes |
|---|---|---|
| Windows, via WSL (Ubuntu) | bash | Everything runs inside WSL; see "Windows host" below. |
| macOS | zsh | Uses `zshrc` instead of `bashrc`; both load the shared config in `shell/`. |
| Ubuntu Server (latest) | bash | Headless, so no desktop or GUI setup. |

## Installation

### WSL, macOS, and Ubuntu Server (copy the full command)
    
    git clone https://github.com/making3/dotfiles.git ~/.dotfiles &&
    ~/.dotfiles/install.sh

### Windows host (for WSL)

Everything runs inside WSL, so the only things to install on Windows are:

- [VS Code](https://code.visualstudio.com/) with the [WSL extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl)
- [Windows Terminal](https://aka.ms/terminal)

Keep projects on the WSL filesystem (e.g. `~/code`), not under `/mnt/c`, and open them with `code .` from WSL.
