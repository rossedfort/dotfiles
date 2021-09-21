#!/bin/bash

# install Homebrew
echo "Installing Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Checking install"
brew doctor

echo "Installing Homebrew packages"
brew bundle install --file="$DOTFILES_PATH/Brewfile"

echo "Cleaning up"
brew cleanup