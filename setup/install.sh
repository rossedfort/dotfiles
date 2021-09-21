#!/bin/zsh

# Prompt for git path
vared -p 'Please specify your home development directory, i.e. /Users/you/dev: ' -c GIT_HOME

if [ -z "$GIT_HOME" ]; then
  echo "Plese enter your home development directory when prompted."
  exit 1
else
  echo "Using $GIT_HOME for dev workspace"
fi

export GIT_HOME="$GIT_HOME"
export DOTFILES_PATH="$GIT_HOME/rossedfort/dotfiles"
