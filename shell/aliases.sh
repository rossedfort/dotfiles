#!/bin/zsh

alias a='atom'
alias c='code'
alias dotfiles="c $DOTFILES_PATH"
alias zrc="code ~/.zshrc"
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'
alias f='open -a Finder ./'
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias weather='curl "wttr.in?format=3"'
alias l='ls -lh'
alias ll='ls -lah'
# List all files colorized in long format, including dot files
alias la="ls -laFG"
# List only directories
alias lsd="ls -lF | grep --color=never '^d'"
# Recursively delete `.DS_Store` files
alias rmds="find . -type f -name '*.DS_Store' -ls -delete"
# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'
# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"
# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"
# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n}'
alias scripts="cat package.json | jq .scripts"
alias clg="git diff master | grep console.log"
alias nom=npm
alias cat=bat
