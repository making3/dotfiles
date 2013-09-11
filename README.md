dotfiles
========
This repo Includes my custom vimrc and tmux config files. They should be cloned to ~/dotfiles/.

Tutorial reference:<br />
[Using git and github to manager your dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)

Javascript syntax support (enhanced):<br />
[Javascript syntax enhanced](http://www.vim.org/scripts/script.php?script_id=1491)

Plugins Used:<br />
[Pathogen](https://github.com/tpope/vim-pathogen)<br />
[SnipMate](https://github.com/garbas/vim-snipmate)<br />
[NERDCommenter](https://github.com/scrooloose/nerdcommenter)<br />
[Tabular](https://github.com/godlygeek/tabular)<br />
[Solarized](https://github.com/altercation/vim-colors-solarized)

Installation
============
    git clone https://github.com/making3/dotfiles.git ~/dotfiles
    cd ~/dotfiles
    chmod +x makesymlinks.sh
    ./makesymlinks.sh
    
Pathogen Installation
=====================
To get pathogen, copy and paste all three lines: 

    mkdir -p ~/.vim/autoload ~/.vim/bundle; \
    curl -Sso ~/.vim/autoload/pathogen.vim \
        https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

Plugin Installation
===================
    cd ~/.vim/bundle
    git clone https://github.com/tomtom/tlib_vim.git
    git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
    git clone https://github.com/garbas/vim-snipmate.git
    git clone https://github.com/scrooloose/nerdcommenter.git
    git clone git://github.com/godlygeek/tabular.git

Solarized Theme Install
=======================
Solarized theme is enabled in the .vimrc configuration file and the tmux configuration, so all that needs to be done is the terminal needs to be configured to use the solarized theme as well:

    cd ~/.vim/bundle
    git clone git://github.com/altercation/vim-colors-solarized.git
    cd ~/dotfiles
    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    // Create a new terminal profile. 
        // From the menu bar (if not shown, right click in terminal > show menu bar):
        // Edit > Profiles
        // New
        // Solarized, Based on: Default (or whatever profile is being used)
        // Set "Profile used when launching a new termianl to Solarized
    ./gnome-terminal-colors-solarized/install.sh
    // Choose light or dark, and then overwrite the Solarized profile


TODO
====
    Add GIT configuration
    Add javascript and other custom snippets
