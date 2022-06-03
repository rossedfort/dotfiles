#!/bin/zsh

echo "Running setup scripts"
$DOTFILES_PATH/setup/xcode.sh || exit 1
$DOTFILES_PATH/setup/brew.sh || exit 1
$DOTFILES_PATH/setup/macos.sh || exit 1
$DOTFILES_PATH/setup/symlinks.sh || exit 1
$DOTFILES_PATH/setup/rosetta.sh || exit 1
echo "Done setting up dotfiles :)"
exit 0

