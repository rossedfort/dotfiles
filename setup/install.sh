#!/bin/zsh

GIT_HOME="$HOME/dev/github.com"
DOTFILES_PATH="$GIT_HOME/rossedfort/dotfiles"

echo "Making dotfiles directory: $DOTFILES_PATH"
mkdir -p $DOTFILES_PATH
cd $DOTFILES_PATH

echo "pwd: $(pwd)"
echo "Downloading dotfiles repository"
curl -sL -o dotfiles.zip "https://github.com/rossedfort/dotfiles/archive/refs/heads/zsh.zip"

unzip dotfiles.zip
mv dotfiles-zsh/* .
mv dotfiles-zsh/.* .
rm dotfiles.zip
rmdir dotfiles-zsh

echo "changing into dotfiles setup directory"
cd $DOTFILES_PATH/setup
echo "pwd: $(pwd)"
echo "Running setup scripts"

./shell.sh $GIT_HOME $DOTFILES_PATH
./brew.sh
./macos.sh
./symlinks.sh
./ssh.sh