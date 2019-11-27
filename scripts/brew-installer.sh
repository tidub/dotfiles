#!/bin/sh

# Script for installing homebrew plus useful packages
# Use `chmod +x` on file to make it executable
# Comment out unwanted packages!

echo "Installing Command Line Tools for Xcode (required for Homebrew)..."
xcode-select --install

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing languages..."
brew install python

echo "Installing tools..."
brew install neovim
brew install tmux
brew install zsh
brew cask install karabiner-elements
brew cask install spectacle
brew install git
brew cask intall dropbox
brew cask install slack

echo "Installing browser..."
brew cask install google-chrome

echo "Installing music player..."
brew install cmus

echo "Installing latex..."
brew cask install basictex
# latexmk is required, install with `tlmgr install latexmk` (probably as root)
# missing packages can be added with `tlmgr install <package-name>`
# continous compilation of pdf: `latexmk -pdf -pvc <path-to-file.tex>`

