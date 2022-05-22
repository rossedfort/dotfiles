#!/bin/zsh

./shell.sh

mkdir -p "$GIT_HOME"
cd "$GIT_HOME"
curl -LO "https://github.com/rossedfort/dotfiles/archive/refs/heads/zsh.zip"
unzip zsh.zip
mv dotfiles-zsh dotfiles
rm zsh.zip

cd "$DOTFILES_PATH/setup"
./brew.sh
./macos.sh
./symlinks.sh
./ssh.sh
./xcode.sh