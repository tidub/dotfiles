#!/bin/bash

# Create symbolic links from ~ to ~/dotfiles

# Variables
# Files in ~ assigned to variable $files
# Files not in ~ handled as separate cases

dir=~/dotfiles
old_dir=~/dotfiles_old
files="bash_profile vimrc zshrc"

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

# Move config files in ~/.config to dotfiles_old, then create symlinks

echo "Moving config file karabiner.json to $old_dir"
mv ~/.config/karabiner/karabiner.json $old_dir/karabiner.json
echo "Creating symlink to karabiner.json in ~/.config/karabiner"
ln -s $dir/config/karabiner/karabiner.json ~./config/karabiner/karabiner.json

echo "Moving config file init.vim to $old_dir"
mv ~/.config/nvim/init.vim $old_dir/init.vim
echo "Creating symlink to init.vim in ~/.config/nvim"
ln -s $dir/config/nvim/init.vim ~/.config/nvim/init.vim

