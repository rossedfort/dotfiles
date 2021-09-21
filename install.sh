#!/bin/zsh

if [[ ! -v "$DOTFILES_PATH" ]]; then
	echo "\$DOTFILES_PATH is unset"
  echo "Set a value for \$DOTFILES_PATH and try again"
  exit 1
fi

if [ ! -v "$GIT_HOME" ]; then
	echo "\$GIT_HOME is unset"
  echo "Set a value for \$GIT_HOME and try again"
  exit 1
fi

# install Homebrew
echo "Installing Homebrew"
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install Homebrew packages
echo "Installing Homebrew packages"
brew bundle install --file="$DOTFILES_PATH/Brewfile"

# Git should exist, but if not, install it.
if ! type "$git" > /dev/null; then
  echo "Git not installed -- installing git"
  brew install git
fi

# Install dotfiles repo - use https b/c ssh key not yet set up
echo "Cloning dotfiles repo..."
git clone https://github.com/rossedfort/dotfiles.git "$GIT_HOME/rossedfort/dotfiles"

# back up some system files if they exist
VSCODE_SETTINGS_PATH="$HOME/Library/Application Support/Code/User"
[ -f "$HOME/.gitconfig" ] && mv "$HOME/.gitconfig" "$HOME/.gitconfig.backup"
[ -f "$HOME/.gitignore_global" ] && mv "$HOME/.gitignore_global" "$HOME/.gitignore_global.backup"
[ -f "$VSCODE_SETTINGS_PATH/settings.json" ] && mv "$VSCODE_SETTINGS_PATH/settings.json" "$VSCODE_SETTINGS_PATH/settings.json.backup"

# setup symlinks
ln -s "$DOTFILES_PATH/.gitconfig" "$HOME"
ln -s "$DOTFILES_PATH/.gitignore_global" "$HOME"
ln -s "$DOTFILES_PATH/vscode_settings.json" "$VSCODE_SETTINGS_PATH"

# Make sure new machine includes my config
echo "source \$DOTFILES_PATH/shell/.zshenv" >> "$HOME/.zshenv"
echo "source \$DOTFILES_PATH/shell/.zshrc" >> "$HOME/.zshrc"

# Increase key repeat speed
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Tell iTerm2 to use custom prefs folder in this repo
defaults write com.googlecode.iterm2 PrefsCustomFolder = "$DOTFILES_PATH/prefs"

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Screenshots in a folder
mkdir ~/Pictures/screenshots
defaults write com.apple.screencapture location ~/Pictures/screenshots

# Set up new ssh key
echo "Please provide information for a new ssh key"
vared -p 'Email: ' -c ssh_key_email
vared -p 'Filename: ' -c ssh_key_filename

ssh-keygen \
  -t ed25519 \
  -b 4096 \
  -C "$ssh_key_email" \
  -f "$HOME/.ssh/$ssh_key_filename" \
  -N ""

echo "Generated new key: $HOME/.ssh/$ssh_key_filename"
echo "Copying new public key to clipboard, plz add to GitHub: https://github.com/settings/keys"
pbcopy < "~/.ssh/$ssh_key_filename.pub"
echo "Don't forget to add your new key to the ssh-agent https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent"

# start a new shell
echo "Finished setting up ✨"
exec ${SHELL} -l