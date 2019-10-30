#!/bin/zsh

if [ -z ${DOTFILES_PATH+x} ]; then
  echo "DOTFILES_PATH is unset";
fi

for file in $DOTFILES_PATH/{path,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# set up symlinks if they don't exist
[ ! -L "$HOME/Library/Application Support/Code/User/settings.json" ] && ln -s "$DOTFILES_PATH/settings.json" "$HOME/Library/Application Support/Code/User/"
[ ! -L "$HOME/.gitconfig" ] && ln -s "$DOTFILES_PATH/.gitconfig" "$HOME"
[ ! -L "$HOME/.gitignore_global" ] && ln -s "$DOTFILES_PATH/.gitignore_global" "$HOME"


export ZSH=$DOTFILES_PATH/.oh-my-zsh
export ZSH_THEME="redfort"
export ZSH_CUSTOM=$DOTFILES_PATH/zsh-custom

plugins=(git node npm osx z)

source $ZSH/oh-my-zsh.sh
