#!/bin/sh

if [[ "$SHELL" == "/bin/zsh" ]]; then
  echo "shell already set to zsh"
else
  echo "changing system shell to zsh"
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s $(which zsh)
fi

GIT_HOME="$1"
DOTFILES_PATH="$2"

ZSHRC_PATH="$HOME/.zshrc"
ZSHENV_PATH="$HOME/.zshenv"

ZSHRC_CONTENTS="source $DOTFILES_PATH/shell/.zshrc"
ZSHENV_CONTENTS="export GIT_HOME=$GIT_HOME
export DOTFILES_PATH=$DOTFILES_PATH
source $DOTFILES_PATH/shell/.zshenv"

mv $ZSHRC_PATH "$HOME/.zshrc.bak"
mv $ZSHENV_PATH "$HOME/.zshenv.bak"

echo "Adding\n\n$ZSHRC_CONTENTS \n\nto $ZSHRC_PATH"
echo $ZSHRC_CONTENTS >> $ZSHRC_PATH

echo ""
echo "Adding\n\n$ZSHENV_CONTENTS \n\nto $ZSHENV_PATH"
echo $ZSHENV_CONTENTS >> $ZSHENV_PATH

echo ""
echo "Launching new shell session"
exec $SHELL -l