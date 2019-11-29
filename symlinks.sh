#!/bin/bash

# Keep your dotfiles and config files up-to-date across machines.

# This script:
# Creates directories dir and old_dir
# Local dotfiles and config files are backed up in old_dir
# Remote dotfiles and config files are cloned into dir
# Local dotfiles and config files are replaced with
# symlinks to their up-to-date namesakes in dir

# Directories created
dir=~/dotfiles
old_dir=~/dotfiles_old

# Git remote url
git_url="https://github.com/tidub/dotfiles.git"

# Dotfiles ~/."..."
files="
	bash_profile
	vimrc
	zshrc
"

# Config files ~/.config/"..."
config_files=(
	"karabiner/karabiner.json"
	"nvim/init.vim"
)

# Tell user what the script does
echo "This script will update local files with their remote namesakes at..."
echo
echo "$git_url"
echo

# User prompt
read -p "...do you want to continue? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

	# Setup directory to clone into
	echo
	echo "Check $dir exists and make it the current directory..."
	mkdir $dir
	cd $dir
	echo "...done!"
	echo

	# Setup git remote
	echo "Cloning from $git_url into $dir..."
	git init
	git remote add origin "$git_url"
	git pull origin master
	echo "...done!"
	echo

	# Setup backup and config directories
	echo "Emptying $old_dir..."
	rm -rf $old_dir
	mkdir -p $old_dir
	echo "Checking ~/.config exists..."
	mkdir ~/.config
	echo "...done!"
	echo

	# Backup dotfiles and create symlinks
	for file in $files; do
		echo "Sending $file copy to $old_dir..."
		mv ~/.$file $old_dir
		echo "Creating symlink..."
		ln -s $dir/$file ~/.$file
		echo "...$file updated successfully!"
		echo
	done

	# Backup config files and create symlinks
	for i in "${config_files[@]}"; do
		config_dir="${i%%/*}"
		config_file="${i##*/}"
		echo "Sending $config_file copy to $old_dir..."
		mv ~/.config/$config_dir/$config_file $old_dir/$config_file
		echo "Checking directory for symlink exists..."
		mkdir ~/.config/$config_dir
		echo "Creating symlink..."
		ln -s $dir/$config_file ~/.config/$config_dir/$config_file
		echo "...$config_file updated successfully!"
		echo
	done

fi
