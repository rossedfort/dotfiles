#!/bin/bash

# install Homebrew
echo "Installing Homebrew"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo "Upgrading Homebrew"
brew upgrade

# Needed for Homebrew, doing it this way support multiple users on the same Mac
chgrp -R admin $(brew --prefix)/*
chmod -R g+w $(brew --prefix)/*

brew doctor

echo "Installing Homebrew packages"
brew bundle install --file="$DOTFILES_PATH/Brewfile"

echo "Cleaning up"
brew cleanup