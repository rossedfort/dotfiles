#!/bin/sh

echo "Setting up dotfiles"
${SHELL} -c "$(curl -fsSL https://raw.githubusercontent.com/rossedfort/dotfiles/zsh/setup/ssh.sh)" || exit 1

GIT_HOME="$HOME/dev/github.com"
DOTFILES_PATH="$GIT_HOME/rossedfort/dotfiles"

echo "Making dotfiles directory: $DOTFILES_PATH"
mkdir -p $DOTFILES_PATH
cd $DOTFILES_PATH

echo "pwd: $(pwd)"
echo "Cloning dotfiles repository"
git clone --recurse-submodules git@github.com:rossedfort/dotfiles.git
echo "changing into dotfiles setup directory"
cd $DOTFILES_PATH/setup
echo "pwd: $(pwd)"
echo "Running setup scripts"
./brew.sh
$(brew --prefix)/opt/fzf/install
./macos.sh
./symlinks.sh
./shell.sh $GIT_HOME $DOTFILES_PATH