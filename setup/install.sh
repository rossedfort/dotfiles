#!/bin/zsh

./shell.sh

echo "Making git home directory: $GIT_HOME"
mkdir -p $GIT_HOME
cd $GIT_HOME

echo "pwd: $(pwd)"
echo "Downloading dotfiles repository"
curl -sLO "https://github.com/rossedfort/dotfiles/archive/refs/heads/zsh.zip"

echo "unzipping zsh.zip"
unzip zsh.zip
echo "enaming dotfiles-zsh"
mv dotfiles-zsh dotfiles
echo "removing zsh.zip"
rm zsh.zip
echo "changing into setup directory"
cd dotfiles/setup
echo "pwd: $(pwd)"
echo "Running setup scripts"
./brew.sh
./macos.sh
./symlinks.sh
./ssh.sh
./xcode.sh