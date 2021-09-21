#!/bin/zsh

# Dark Mode
defaults write -g AppleInterfaceStyle -string "Dark"

# Set Sidebar Icon Size to "Medium"
defaults write -g NSTableViewDefaultSizeMode -int 2

# Double-clicking the window's toolbar maximizes the window
defaults write -g AppleActionOnDoubleClick -string "Maximize"

# Decrease key repeat delay
defaults write -g InitialKeyRepeat -int 15

# Increase key repeat speed
defaults write -g KeyRepeat -int 2

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Disable magnification when hovering over the Dock
defaults write com.apple.dock magnification -bool false

# Make the dock size smaller
defaults write com.apple.dock tilesize -int 36

# Use the "scale" effect when minimizing windows
defaults write com.apple.dock mineffect -string "scale"

# Tell iTerm2 to use custom prefs folder in this repo
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$DOTFILES_PATH/prefs"

# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Don't automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Enable ap trackpad to click
defaults write com.apple.AppleMultiTouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Disable force click
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad ForceSuppressed -bool true

# Screenshots in a folder
mkdir ~/Pictures/screenshots
defaults write com.apple.screencapture location ~/Pictures/screenshots

# Default Finder view to Columns
defaults write com.apple.finder FXPreferredGroupBy -string "Date Created"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"