#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/.dotfiles                             # dotfiles directory
olddir=~/.dotfiles_old                      # old dotfiles backup directory
files="bashrc vimrc tmux.conf gitconfig"    # list of files/folders to symlink in homedir
vim=~/.vim/                                 # Vim folder

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

# Create $vim/snippets & $vim/syntax
echo "Creating director $vim/snippets and $vim/syntax if they do not already exist."
mkdir -p $vim/snippets
mkdir -p $vim/syntax

# Make symlinks for snippets to point to dotfiles/snippets
echo "Moving any existing vim snippets from $vim/snippets to $olddir/snippets"
rm -rf $olddir/snippets
mv $vim/snippets $olddir/snippets
echo "Creating symlink to $dir/snippets in $vim/snippets"
ln -s $dir/snippets $vim/snippets

# Make symlinks for syntax to point to dotfiles/syntax
echo "Moving any existing vim snytax files from $vim/syntax to $olddir/syntax"
rm -rf $olddir/syntax
mv $vim/syntax $olddir/syntax
echo "Creating symlink to $dir/syntax in $vim/snippets"
ln -s $dir/syntax $vim/syntax

# Make backup/swap file directories
echo "Making swap & backup directories"
mkdir -p ~/.vim/.swap
mkdir -p ~/.vim/.backups

echo "Sym link script complete."
