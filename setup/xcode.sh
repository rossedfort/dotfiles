#!/bin/sh

# Update xcode command line tools
echo "Updating xcode command line tools"
[ ! -d /Library/Developer/CommandLineTools ] && sudo xcode-select --install