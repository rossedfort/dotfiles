#!/bin/zsh

if [[ "$SHELL" == "/bin/zsh" ]]; then
  echo "shell already set to zsh"
else
  echo "changing system shell to zsh"
  sudo sh -c "echo $(which zsh) >> /etc/shells"
  chsh -s $(which zsh)
fi

mv "$HOME/.zshrc" "$HOME/.zshrc.bak"
mv "$HOME/.zshenv" "$HOME/.zshenv.bak"

echo "source \$DOTFILES_PATH/shell/.zshrc" >>"$HOME/.zshrc"
echo "source \$DOTFILES_PATH/shell/.zshenv" >>"$HOME/.zshenv"

exec $SHELL -l