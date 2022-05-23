#!/bin/sh

# Update xcode command line tools
echo "Updating xcode command line tools"
sudo rm -rf /Library/Developer/CommandLineTools
sudo xcode-select --install