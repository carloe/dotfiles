#!/bin/bash
#
# Colonize dem dots about the native system
#

echo "Backing up existing dot files"

if [ ! -d ~/!olddots ]; then
	mkdir ~/!olddots
fi

if [ -f ~/.bash_profile ]; then
	mv ~/.bash_profile ~/!olddots
fi
cp .bash_profile ~/

if [ -f ~/.bashrc ]; then
	mv ~/.bashrc ~/!olddots
fi
cp .bashrc ~/

if [ -f ~/.screenrc ]; then
	mv ~/.screenrc ~/!olddots
fi
cp .screenrc ~/

if [ -f ~/.vimrc ]; then
	mv ~/.vimrc ~/!olddots
fi
cp .vimrc ~/

if [ -f ~/.gitconfig ]; then
	mv ~/.gitconfig ~/!olddots
fi
cp .gitconfig ~/

if [ -f ~/.gitignore ]; then
	mv ~/.gitignore ~/!olddots
fi
cp .gitignore ~/

if test ! $(which brew)
then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
fi

echo "Running Brewfile..."
brew bundle homebrew/brewfile

exit 0
