#!/bin/zsh

function emoji() {
	echo $(yes ":$1:" | head -n $2) | tr -d " " | pbcopy
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_"
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1")
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# UTF-8-encode a string of Unicode symbols
function escape() {
	printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u)
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo "" # newline
	fi
}

function trash() {
	command mv "$@" ~/.Trash
}

function brewup() {
	echo 'Starting Brew Stuff 🍺'
	brew update
	brew upgrade
	brew cleanup
	brew doctor
	echo 'Brew Stuff is Over 🍺'
}

function howbig() {
	target="$1"

	# disk usage
	#  -c = Display grand total (it's the first token of the last line)
	#  -h = Human readable format
	size=$(du -c -h "$target" | tail -1 | awk '{ print $1 }')

	echo "$target is $size"
}

function fif() {
	local target="$1"
	local search="$2"
	local usage="Usage: fif ./target 'search'"

	[[ -z $target ]] && echo "$usage\nMissing param 'target'" && return 1
	[[ -z $search ]] && echo "$usage\nMissing param 'search'" && return 1

	echo "Searching for \"$search\" in \"$target\""
	grep --color=auto -rin $search $target
}

function faf() {
	local target="$1"
	local search="$2"
	local usage="Usage: faf ./target 'search'"

	[[ -z $target ]] && echo "$usage\nMissing param 'target'" && return 1
	[[ -z $search ]] && echo "$usage\nMissing param 'search'" && return 1

	find $target -name $search -print -type f
}

function fzf-git-branch() {
	git rev-parse HEAD >/dev/null 2>&1 || return

	git branch --color=always --all --sort=-committerdate |
		grep -v HEAD |
		fzf --height 50% --ansi --no-multi --preview-window right:65% \
			--preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
		sed "s/.* //"
}

function fzf-git-checkout() {
	git rev-parse HEAD >/dev/null 2>&1 || return

	local branch

	branch=$(fzf-git-branch)
	if [[ "$branch" = "" ]]; then
		echo "No branch selected."
		return
	fi

	# If branch name starts with 'remotes/' then it is a remote branch. By
	# using --track and a remote branch name, it is the same as:
	# git checkout -b branchName --track origin/branchName
	if [[ "$branch" = 'remotes/'* ]]; then
		git checkout --track $branch
	else
		git checkout $branch
	fi
}
