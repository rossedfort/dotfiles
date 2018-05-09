#!/usr/bin/env bash
for file in ~/Dropbox/dotfiles/.{path,bash_prompt,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
