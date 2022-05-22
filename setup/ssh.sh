#!/bin/sh

password=""

function getPw() {
  echo -n 'Password: '
  read -s password
  echo
  echo -n 'Confirm Password: '
  read -s password_conf
  echo
  if [[ $password == $password_conf ]]; then
    return
  else
    echo "Passwords don't match, please try again"
    getPw
  fi
}

# Set up new ssh key
echo "Please provide information for a new ssh key"
vared -p 'Email: ' -c ssh_key_email
vared -p 'Filename: ' -c ssh_key_filename
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
echo "Copied new public key to clipboard, plz add to GitHub: https://github.com/settings/keys"
echo "Once you've added your key, press any key to continue"
while [ true ]; do
  read -t 3 -n 1
  if [ $? = 0 ]; then
    exit 0
  else
    echo "waiting for the keypress"
  fi
done
