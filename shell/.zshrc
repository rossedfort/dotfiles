#!/bin/zsh

if [ -z ${DOTFILES_PATH+x} ]; then
  echo "\$DOTFILES_PATH is unset"
  echo "Set a value for \$DOTFILES_PATH and try again"
  exit 1
fi

# Tell zsh completion to match case insensitively
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

plugins=(z fzf)

source "$DOTFILES_PATH/oh-my-zsh/oh-my-zsh.sh"
source "$DOTFILES_PATH/shell/aliases.sh"
source "$DOTFILES_PATH/shell/functions.sh"

# Uncomment and run `zprof` to profile zsh shell performance
# zmodload zsh/zprof
