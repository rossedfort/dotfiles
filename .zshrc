#!/bin/zsh

if [ -z ${DOTFILES_PATH+x} ]; then
  echo "DOTFILES_PATH is unset";
fi

for file in $DOTFILES_PATH/{env,path,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# set up symlinks for VSCode Settings, global gitignore and gitconfig if they don't exist
[ ! -L "$HOME/Library/Application Support/Code/User/settings.json" ] && ln -s "$DOTFILES_PATH/settings.json" "$HOME/Library/Application Support/Code/User/"
[ ! -L "$HOME/.gitconfig" ] && ln -s "$DOTFILES_PATH/.gitconfig" "$HOME"
[ ! -L "$HOME/.gitignore_global" ] && ln -s "$DOTFILES_PATH/.gitignore_global" "$HOME"

plugins=(git node npm osx z nvm fzf rbenv)
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# This loads rbenv
eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh
# I have aliases that override oh-my-zsh aliases
source $DOTFILES_PATH/aliases