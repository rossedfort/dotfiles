#!/bin/zsh

# Set up new ssh key
echo "Please provide information for a new ssh key"
vared -p 'Email: ' -c ssh_key_email
vared -p 'Filename: ' -c ssh_key_filename

if [[ -z "$ssh_key_email" || -z "$ssh_key_filename" ]]; then
  echo "Please enter your new ssh key email and filename when prompted."
  exit 1
fi

ssh-keygen \
  -t ed25519 \
  -b 4096 \
  -C "$ssh_key_email" \
  -f "$HOME/.ssh/$ssh_key_filename" \
  -N ""

echo "Generated new key: $HOME/.ssh/$ssh_key_filename"
echo "---------------------------------------"
cat "~/.ssh/$ssh_key_filename.pub"
echo "---------------------------------------"
pbcopy < "~/.ssh/$ssh_key_filename.pub"
echo "Copied new public key to clipboard, plz add to GitHub"
echo "https://github.com/settings/keys"
echo "Don't forget to add your new key to the ssh-agent"
echo "https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#adding-your-ssh-key-to-the-ssh-agent"
