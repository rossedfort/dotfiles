#!/bin/zsh

GIT_HOME="$HOME/dev/github.com"
DOTFILES_PATH="$GIT_HOME/rossedfort/dotfiles"

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
echo "changing into dotfiles setup directory"
cd $DOTFILES_PATH/setup
echo "pwd: $(pwd)"
echo "Running setup scripts"

./shell.sh $GIT_HOME $DOTFILES_PATH
./brew.sh
./macos.sh
./symlinks.sh
./ssh.sh