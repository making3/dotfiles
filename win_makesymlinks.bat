@ECHO off

ECHO Setting .dotfiles as hidden

:: Set these to hidden
attrib +h "%HOME%\.dotfiles"

ECHO Deleting exising dot files

:: Backup dot files
del /A:H-H "%HOME%\_vimrc" "%HOME%\_gvimrc" "%HOME%\.gitconfig" "%HOME%\.gitignore"

:: Create links to the home directroy for vim and git configurations
mklink "%HOME%\_vimrc" %cd%\vimrc
mklink "%HOME%\_gvimrc" %cd%\gvimrc
mklink "%HOME%\.gitconfig" %cd%\gitconfig
mklink "%HOME%\.gitignore" %cd%\gitignore

ECHO Creating vim backup and swap folders

:: Create backup and data folders.
if not exist "%HOME%\.vim" mkdir "%HOME%\.vim"
if not exist "%HOME%\.vim\.backups" mkdir "%HOME%\.vim\.backups"
if not exist "%HOME%\.vim\.swap" mkdir "%HOME%\.vim\.swap"

ECHO Making dotfiles hidden

:: Hide all of the links and backups
attrib /L +H "%HOME%\_vimrc"
attrib /L +H "%HOME%\_gvimrc"
attrib /L +H "%HOME%\.gitconfig"
attrib /L +H "%HOME%\.gitignore"
attrib +H "%HOME%\.vim"

ECHO Setting global git ignore file location

:: Set the global git ignore file
git config --global core.excludesfile "%HOME%\.gitignore"

ECHO Done
