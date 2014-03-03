#!/bin/sh
#
# Colonize dem dots about the native system
#

if test ! $(which brew)
then
	echo "Installing Homebrew"
	ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
fi

echo "Running Brewfile..."
brew bundle homebrew/brewfile

exit 0
