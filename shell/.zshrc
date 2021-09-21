#!/bin/zsh

if [ -z ${DOTFILES_PATH+x} ]; then
	echo "\$DOTFILES_PATH is unset"
  echo "Set a value for \$DOTFILES_PATH and try again"
  exit 1
fi

plugins=(node npm osx z fzf)
# Tell zsh completion to match case insensitively
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

source $ZSH/oh-my-zsh.sh
source "$DOTFILES_PATH/shell/aliases"
source "$DOTFILES_PATH/shell/functions"

# Uncomment and run `zprof` to profile zsh shell performance
# zmodload zsh/zprof
