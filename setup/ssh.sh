#!/bin/sh

password=""

function getPw() {
  read -p 'Password: ' -s password
  read -p 'Confirm Password: ' -s password_conf
  if [[ $password == $password_conf ]]; then
    return
  else
    echo "Passwords don't match, please try again"
    getPw
  fi
}

# Set up new ssh key
echo "Please provide information for a new ssh key"
read -p 'Email: ' ssh_key_email
read -p 'Filename: ' ssh_key_filename
getPw

ssh-keygen \
  -t ed25519 \
  -b 4096 \
  -C "$ssh_key_email" \
  -f "$HOME/.ssh/$ssh_key_filename" \
  -N "$password"

echo "Generated new key: $HOME/.ssh/$ssh_key_filename"
echo "---------------------------------------"
cat "$HOME/.ssh/$ssh_key_filename.pub" || exit 1
echo "---------------------------------------"
echo "adding new ssh key to ssh-agent"
eval "$(ssh-agent -s)"
ssh-add -K "$HOME/.ssh/$ssh_key_filename" || exit 1
pbcopy <"$HOME/.ssh/$ssh_key_filename.pub" || exit 1
echo "Copied new public key to clipboard, please add it to GitHub: https://github.com/settings/keys"
read -n1 -s -r -p $'Press any key to continue...\n' key
