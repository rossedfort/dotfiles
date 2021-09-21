#!/bin/zsh

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
echo "source \$DOTFILES_PATH/shell/.zshenv" >>"$HOME/.zshenv"
echo "source \$DOTFILES_PATH/shell/.zshrc" >>"$HOME/.zshrc"
