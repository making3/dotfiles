About
=====
This repo includes my custom vimrc, tmux, and bashrc config files, along with any custom snippets, syntax, or plugins. Follow the instructions below.

Tutorial reference:<br />
[Using git and github to manager your dotfiles](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/)

Plugins Used:<br />
[Pathogen](https://github.com/tpope/vim-pathogen)<br />
[SnipMate](https://github.com/garbas/vim-snipmate)<br />
[NERDCommenter](https://github.com/scrooloose/nerdcommenter)<br />
[Tabular](https://github.com/godlygeek/tabular)<br />
[Solarized](https://github.com/altercation/vim-colors-solarized)<br />
[vim-airline](https://github.com/bling/vim-airline)

Other Details:<br />
[Vim Snippet Files](https://github.com/honza/vim-snippets)
Default snippet files for vim. Add to dotfiles/snippets.<br />
[Javascript syntax support enhanced](http://www.vim.org/scripts/script.php?script_id=1491)
This is included in the makesymlinks script.<br />


Installation
============
Installing into ~/.dotfiles is optional. If this is changed, then the variables in makesymlinks.sh must be changed (only at the top).

Windows (your path should be `C:\Users\name` instead of `C:\Users\name\`)

    git clone https://github.com/making3/dotfiles.git %HOME%.dotfiles
    cd %HOME%\.dotfiles\windows
    makelinks.bat    -> Run every time vimrc is updated.
    set_cmd_autorun.cmd  -> RUN ONLY ONCE
	install_pathogen.bat -> Run whenever - Does the full Pathogen/Plugin install below.

Linux
    
    git clone https://github.com/making3/dotfiles.git ~/.dotfiles
    cd ~/.linux/dotfiles
    chmod +x linux_makesymlinks.sh
    ./linux_makesymlinks.sh
    
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

    cd ~/.dotfiles
    git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
    // Create a new terminal profile. 
        // From the menu bar (if not shown, right click in terminal > show menu bar):
        // Edit > Profiles
        // New
        // Solarized, Based on: Default (or whatever profile is being used)
        // Set "Profile used when launching a new terminal to Solarized
    ./gnome-terminal-colors-solarized/install.sh
    // Choose light or dark, and then overwrite the Solarized profile

TODO
====
    Possible add a script to auto install all plugins
	Add Atom scripts
