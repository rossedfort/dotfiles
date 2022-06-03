#!/bin/sh

echo "Setting up dotfiles"
# Set up ssh key first so we can clone the rest of the repo
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/rossedfort/dotfiles/zsh/setup/ssh.sh)" || exit 1

read -p 'Workspace directory: ' workspace_path
read -p 'Dotfiles directory: ' dotfiles_path

echo "Cloning dotfiles repository"
git clone --recurse-submodules git@github.com:rossedfort/dotfiles.git $dotfiles_path || exit 1

echo "Setting up shell environment"
$dotfiles_path/setup/shell.sh $workspace_path $dotfiles_path || exit 1

echo "Done setting up shell, please run the setup script now"
echo "$DOTFILES_PATH/setup/install.sh"
