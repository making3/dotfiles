#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                     # dotfiles directory
olddir=~/.dotfiles_old              # old dotfiles backup directory
files="bashrc vimrc tmux.conf"      # list of files/folders to symlink in homedir
snippets=~/.vim/snippets            # Vim snippets folder

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

# Make symlinks for snippets to point to dotfiles/snippets
echo "Moving any existing vim snippets from $snippets to $olddir/snippets"
mv $snippets $olddir/snippets
echo "Creating symlink to $dir/snippets in $snippets"
ln -s $dir/snippets $snippets

echo "Sym link script complete."
