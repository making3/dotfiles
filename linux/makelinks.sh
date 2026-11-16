#!/bin/bash
# Symlinks the dotfiles in ~/.dotfiles into the home directory.

########## Variables

dir=~/.dotfiles                             # dotfiles directory
olddir=~/.dotfiles_old                      # old dotfiles backup directory
files="bashrc vimrc gitconfig"             # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# Make backup/swap file directories
echo "Making swap & backup directories"
mkdir -p ~/.vim/.swap
mkdir -p ~/.vim/.backups

# Reset back to the default path
source ~/.bashrc
cd ~
echo "Sym link script complete. Sourced new bashrc."
