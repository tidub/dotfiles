#!/bin/sh

# This script installs:
# Command Line Tools for Homebrew
# Homebrew
# CLI packages listed in $brews
# GUI packages listed in $cask_brews
# Tex-Live Package Manager `tlpmr` (included in basictex)
# Latex packages listed in $latex_packages

echo "Installing Command Line Tools..."
xcode-select --install
echo "...done!"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "...done!"

brews="
	python
	neovim
	tmux
	zsh
	antigen
	git
	cmus
"

brew_casks="
	karabiner-elements
	dropbox
	spectacle
	slack
	google-chrome
	basictex
"

latex_packages="
	latexmk
"

for brew in $brews; do
	echo "Installing $brew..."
	brew install $brew
	echo "...done!"
done

for brew_cask in $brew_casks; do
	echo "Installing $brew_cask..."
	brew cask install $brew_cask
	echo "...done!"
done


for latex_package in $latex_packages; do
	echo "Installing $latex_package..."
	tlmgr install $latex_package
	echo "...done!"
done

