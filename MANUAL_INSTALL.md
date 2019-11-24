# Manual Installation

## Vim with clipboard

Linux

    sudo apt-get install vim-gtk

## Pathogen Installation
To install pathogen:

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    cd ~/.vim/autoload
    wget https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

## Plugin Installation
    cd ~/.vim/bundle
    git clone https://github.com/tomtom/tlib_vim.git
    git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
    git clone https://github.com/garbas/vim-snipmate.git
    git clone https://github.com/scrooloose/nerdcommenter.git
    git clone git://github.com/godlygeek/tabular.git
    git clone https://github.com/xolox/vim-misc.git
	git clone https://github.com/scrooloose/syntastic.git

## Solarized Theme Install
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

