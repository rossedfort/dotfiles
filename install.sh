#!/bin/sh

echo "Setting up dotfiles"
# Set up ssh key first so we can clone the rest of the repo
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/rossedfort/dotfiles/zsh/setup/ssh.sh)" || exit 1

read -p 'Workspace directory: ' workspace_path
read -p 'Dotfiles directory: ' dotfiles_path

echo "Cloning dotfiles repository"
git clone --recurse-submodules git@github.com:rossedfort/dotfiles.git $dotfiles_path || exit 1

echo "Running setup scripts"
$dotfiles_path/setup/shell.sh "$workspace_path" "$dotfiles_path" || exit 1
$DOTFILES_PATH/setup/xcode.sh || exit 1
$DOTFILES_PATH/setup/brew.sh || exit 1
$DOTFILES_PATH/setup/macos.sh || exit 1
$DOTFILES_PATH/setup/symlinks.sh || exit 1
$DOTFILES_PATH/setup/rosetta.sh || exit 1
echo "Done"
exit 0
