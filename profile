#!/usr/bin/env bash

if [ -z ${DOTFILES_PATH+x} ]; then
  echo "DOTFILES_PATH is unset";
fi

for file in $DOTFILES_PATH/{path,prompt,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ -f "$DOTFILES_PATH/git-completion.bash" ]; then
  . "$DOTFILES_PATH/git-completion.bash"
fi

# set up symlinks if they don't exist
[ -f "$HOME/Library/Application Support/Code/User/settings.json" ] && [ ! -L "$HOME/Library/Application Support/Code/User/settings.json" ] && ln -s "$DOTFILES_PATH/settings.json" "$HOME/Library/Application Support/Code/User/"
[ ! -L "$HOME/.gitconfig" ] && ln -s "$DOTFILES_PATH/.gitconfig" "$HOME"
[ ! -L "$HOME/.gitignore_global" ] && ln -s "$DOTFILES_PATH/.gitignore_global" "$HOME"
[ ! -L "$HOME/.inputrc" ] && ln -s "$DOTFILES_PATH/.inputrc" "$HOME"

. $DOTFILES_PATH/z/z.sh
