#!/bin/zsh

if [ -z ${DOTFILES_PATH+x} ]; then
  echo "DOTFILES_PATH is unset";
fi

for file in $DOTFILES_PATH/{path,exports,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# set up symlinks if they don't exist
[ ! -L "$HOME/Library/Application Support/Code/User/settings.json" ] && ln -s "$DOTFILES_PATH/settings.json" "$HOME/Library/Application Support/Code/User/"
[ ! -L "$HOME/.gitconfig" ] && ln -s "$DOTFILES_PATH/.gitconfig" "$HOME"
[ ! -L "$HOME/.gitignore_global" ] && ln -s "$DOTFILES_PATH/.gitignore_global" "$HOME"
[ ! -L "$HOME/.vimrc" ] && ln -s "$DOTFILES_PATH/.vimrc" "$HOME"

plugins=(git node npm osx z)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

source $ZSH/oh-my-zsh.sh
# I have aliases that override oh-my-zsh aliases
source $DOTFILES_PATH/aliases