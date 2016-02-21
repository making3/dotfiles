md %HOME%\.vim\autoload
md %HOME%\.vim\bundle
powershell "& ""%HOME%\.dotfiles\windows\download_pathogen_vim.ps1"""
TYPE "%HOME%\.vim\autoload\pathogen_temp.vim" | MORE /p > "%HOME%\.vim\autoload\pathogen.vim"
cd %HOME%\.vim\bundle
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone git://github.com/godlygeek/tabular.git