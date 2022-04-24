#!/bin/bash
############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# See this blog for detail: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################

########## Variables

# dotfiles directory
dir=/home/sharehdd/Repositories/mydotfiles

# old dotfiles backup directory
olddir=/home/sharehdd/Repositories/mydotfiles/dotfiles_old

# list of files/folders to symlink in homedir
files="vimrc vim bashrc gitconfig spacemacs"

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles."
mkdir -p $olddir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
