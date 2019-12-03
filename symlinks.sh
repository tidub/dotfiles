#!/bin/bash

# Keep your dotfiles and config files up-to-date across machines.

# This script:
# Creates directories clone_dir and backup_dir
# Local dotfiles and config files are backed up in backup_dir
# Remote dotfiles and config files are cloned into clone_dir
# Local dotfiles and config files are replaced with
# symlinks to their up-to-date namesakes in clone_dir

# Directories created
clone_dir=~/dotfiles
backup_dir=~/dotfiles_old

# Git remote url
git_url="https://github.com/tidub/dotfiles.git"

# Dotfiles ~/."..."
files="
	bash_profile
	vimrc
	zshrc
	tmux.conf
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
	echo "Check $clone_dir exists and make it the current directory..."
	mkdir $clone_dir
	cd $clone_dir
	echo "...done!"
	echo

	# Setup git remote
	echo "Cloning from $git_url into $clone_dir..."
	git init
	git remote add origin "$git_url"
	git pull origin master
	echo "...done!"
	echo

	# Setup backup and config directories
	echo "Emptying $backup_dir..."
	rm -rf $backup_dir
	mkdir -p $backup_dir
	echo "Checking ~/.config exists..."
	mkdir ~/.config
	echo "...done!"
	echo

	# Backup dotfiles and create symlinks
	for file in $files; do
		echo "Sending $file copy to $backup_dir..."
		mv ~/.$file $backup_dir
		echo "Creating symlink..."
		ln -s $clone_dir/$file ~/.$file
		echo "...$file updated successfully!"
		echo
	done

	# Backup config files and create symlinks
	for i in "${config_files[@]}"; do
		config_dir="${i%%/*}"
		config_file="${i##*/}"
		echo "Sending $config_file copy to $backup_dir..."
		mv ~/.config/$config_dir/$config_file $backup_dir/$config_file
		echo "Checking directory for symlink exists..."
		mkdir ~/.config/$config_dir
		echo "Creating symlink..."
		ln -s $clone_dir/$config_file ~/.config/$config_dir/$config_file
		echo "...$config_file updated successfully!"
		echo
	done

fi
