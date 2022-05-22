#!/bin/zsh

# Prompt for git path
vared -p 'Please specify your home development directory, i.e. "/Users/you/code":' -c GIT_HOME

if [ -z "$GIT_HOME" ]; then
  echo "Plese enter your home development directory when prompted."
  exit 1
else
  echo "Using $GIT_HOME for development workspace"
fi

export GIT_HOME="$GIT_HOME"
export DOTFILES_PATH="$GIT_HOME/rossedfort/dotfiles"

mkdir -p "$DOTFILES_PATH"
cd "$DOTFILES_PATH"
curl -LO "https://github.com/rossedfort/dotfiles/archive/refs/heads/zsh.zip"
unzip zsh.zip
mv dotfiles-zsh dotfiles
rm zsh.zip

cd "$DOTFILES_PATH/setup"
./brew.sh
./shell.sh
./macos.sh
./symlinks.sh
./ssh.sh
./xcode.sh