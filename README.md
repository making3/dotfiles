# About
This repo includes my custom vimrc, tmux, and bash config files, along with custom snippets, syntax, or plugins. Follow the instructions below.

## Installation

### Linux (Copy the full command)
    
    git clone https://github.com/making3/dotfiles.git ~/.dotfiles &&
    chmod +x ~/.dotfiles/linux/makelinks.sh &&
    ~/.dotfiles/linux/makelinks.sh

### Windows (path should be `C:\Users\name` instead of `C:\Users\name\`)

Refer to the [MANUAL install process](windows/MANUAL.md) since Windows automation is poor. 

    git clone https://github.com/making3/dotfiles.git %HOME%.dotfiles
    cd %HOME%\.dotfiles\windows

    makelinks.bat    -> Run every time vimrc is updated.
    set_cmd_autorun.cmd  -> RUN ONLY ONCE
