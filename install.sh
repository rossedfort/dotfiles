#!/bin/sh

echo "Setting up dotfiles"
# Set up ssh key first so we can clone the rest of the repo
/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/rossedfort/dotfiles/zsh/setup/ssh.sh)" || exit 1

GIT_HOME="$HOME/dev/github.com"
DOTFILES_PATH="$GIT_HOME/rossedfort/dotfiles"

echo "Cloning dotfiles repository"
git clone --recurse-submodules git@github.com:rossedfort/dotfiles.git $DOTFILES_PATH || exit 1
echo "Running setup scripts"
$DOTFILES_PATH/setup/brew.sh || exit 1
$(brew --prefix)/opt/fzf/install
$DOTFILES_PATH/setup/macos.sh || exit 1
$DOTFILES_PATH/setup/symlinks.sh || exit 1
$DOTFILES_PATH/setup/shell.sh $GIT_HOME $DOTFILES_PATH || exit 1
echo "Done"
exit 0