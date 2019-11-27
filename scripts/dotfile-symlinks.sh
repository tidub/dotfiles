#!/bin/bash

# Create symbolic links from ~ to ~/dotfiles

# Variables:

dir=~/dotfiles
old_dir=~/dotfiles_old
files="bash_profile config/karabiner/karabiner.json config/nvim/init.vim vimrc zshrc"		#files or folders permitted


# Make dotfiles_old

echo "Making $old_dir to backup existing dotfiles..."
mkdir -p $old_dir
echo "...done"


# Change to dotfiles directory
echo "Changing to $dir directory..."
cd $dir
echo "...done"


# Move dotfiles in ~ to dotfiles_old, then create symlinks
for file in $files; do
    echo "Moving existing dotfiles from ~ to $old_dir"
    mv ~/.$file $old_dir
    echo "Creating symlink to $file in ~"
    ln -s $dir/$file ~.$file
done
