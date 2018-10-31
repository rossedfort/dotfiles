#!/usr/bin/env bash
for file in ~/Dropbox/dotfiles/{path,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  source /usr/local/etc/bash_completion.d/git-completion.bash
fi

# set up symlinks if they don't exist
[ ! -L "$HOME/Library/Application Support/Code/User/settings.json" ] && ln -s "$HOME/Dropbox/dotfiles/settings.json" "$HOME/Library/Application Support/Code/User/"
[ ! -L "$HOME/.gitconfig" ] && ln -s "$HOME/Dropbox/dotfiles/.gitconfig" "$HOME"
[ ! -L "$HOME/.gitignore_global" ] && ln -s "$HOME/Dropbox/dotfiles/.gitignore_global" "$HOME"
