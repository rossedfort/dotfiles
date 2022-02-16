#!/bin/zsh
export ZSH=$DOTFILES_PATH/oh-my-zsh
export ZSH_THEME="redfort"
# Make vim the default editor.
export EDITOR='vim'
# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768'
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy'
# Increase Bash history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth'
# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
# export LC_ALL='en_US.UTF-8';
export LC_ALL='C'
# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}"
# Node Version Manager dir
export NVM_DIR="$HOME/.nvm"
# FZF Config
export FZF_BASE=/usr/local/bin/fzf
export FZF_DEFAULT_OPTS="--no-height"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export BAT_THEME="ansi"
# Colorizes `man` output. Depends on `bat`
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export TERM_PROGRAM=iTerm.app
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$DOTFILES_PATH/bin:$PATH
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
