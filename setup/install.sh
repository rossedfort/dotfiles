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

# Update xcode command line tools
"$DOTFILES_PATH/setup/xcode.sh"

# Set up Homebrew
"$DOTFILES_PATH/setup/brew.sh"

# fzf needs to be "installed" - this should do it without prompting for input
/usr/local/opt/fzf/install --no-update-rc --key-bindings --completion

# Set up Symlinks
"$DOTFILES_PATH/setup/symlinks.sh"

# Set up MacOS defaults
"$DOTFILES_PATH/setup/macos.sh"

# Set up ssh key
"$DOTFILES_PATH/setup/ssh.sh"

# start a new shell
echo "Finished setting up ✨"
exec ${SHELL} -l
