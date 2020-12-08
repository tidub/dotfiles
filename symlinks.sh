#!/bin/bash

# Keep your dotfiles and config files up-to-date across machines.

# This script:
# Creates directories main_directory and backup_directory
# Local dotfiles and config files are backed up in backup_directory
# Remote dotfiles and config files are cloned into main_directory
# Local dotfiles and config files are replaced with
# symlinks to their up-to-date namesakes in main_directory

# Directories created / updated
main_directory=~/dotfiles
backup_directory=~/dotfiles_old

# Git remote url
github_repository="https://github.com/timdubbins/dotfiles.git"

# Dotfiles ~/."..."
dotfiles="
	bash_profile
	vimrc
	zshrc
	tmux.conf
"

# Configuration files ~/.config/"..."
config_files=(
	"karabiner/karabiner.json"
	"nvim/init.vim"
)

# Tell user what the script does
echo "This script will update local files with their remote namesakes at..."
echo
echo "$github_repository"
echo

# User prompt
read -p "...do you want to continue? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then

	# Setup directory to clone into
	echo
	echo "Check $main_directory exists and make it the current directory..."
	mkdir $main_directory
	cd $main_directory
	echo "...done!"
	echo

	# Setup git remote
	echo "Clone $github_repository to $main_directory..."
	git init
	git remote add origin "$github_repository"
	git pull origin master
	echo "...done!"
	echo

	# Setup backup and config directories
	echo "Emptying $backup_directory..."
	rm -rf $backup_directory
	mkdir -p $backup_directory
	echo "Checking ~/.config exists..."
	mkdir ~/.config
	echo "...done!"
	echo

	# Backup dotfiles and create symlinks
	for file in $dotfiles; do
		echo "Sending $file copy to $backup_directory..."
		mv ~/.$file $backup_directory
		echo "Creating symlink..."
		ln -s $main_directory/$file ~/.$file
		echo "...$file updated successfully!"
		echo
	done

	# Backup config files and create symlinks
	for i in "${config_files[@]}"; do
		config_dir="${i%%/*}"
		config_file="${i##*/}"
		echo "Sending $config_file copy to $backup_directory..."
		mv ~/.config/$config_dir/$config_file $backup_directory/$config_file
		echo "Checking directory for symlink exists..."
		mkdir ~/.config/$config_dir
		echo "Creating symlink..."
		ln -s $main_directory/$config_file ~/.config/$config_dir/$config_file
		echo "...$config_file updated successfully!"
		echo
	done

fi
