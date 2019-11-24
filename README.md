# About
This repo includes my custom vimrc, tmux, and bash config files, along with custom snippets, syntax, or plugins. Follow the instructions below.

Tutorial reference:

[Using git and github to manager your dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)

Plugins Used:

- [Pathogen](https://github.com/tpope/vim-pathogen)
- [SnipMate](https://github.com/garbas/vim-snipmate)
- [NERDCommenter](https://github.com/scrooloose/nerdcommenter)
- [Tabular](https://github.com/godlygeek/tabular)
- [Solarized](https://github.com/altercation/vim-colors-solarized)
- [vim-airline](https://github.com/bling/vim-airline)
- [Syntastic](https://github.com/scrooloose/syntastic)

Other Details:

- [Vim Snippet Files](https://github.com/honza/vim-snippets)
Default snippet files for vim. Add to dotfiles/snippets.
- [Javascript syntax support enhanced](http://www.vim.org/scripts/script.php?script_id=1491)
This is included in the makesymlinks script.<br />


## Installation

Linux (Copy the full command)
    
    git clone https://github.com/making3/dotfiles.git ~/.dotfiles &&
    chmod +x ~/.dotfiles/linux/makelinks.sh &&
    ~/.dotfiles/linux/makelinks.sh

Windows (path should be `C:\Users\name` instead of `C:\Users\name\`)

    git clone https://github.com/making3/dotfiles.git %HOME%.dotfiles
    cd %HOME%\.dotfiles\windows
    makelinks.bat    -> Run every time vimrc is updated.
    set_cmd_autorun.cmd  -> RUN ONLY ONCE
	install_pathogen.bat -> Run whenever - Does the full Pathogen/Plugin install below.
