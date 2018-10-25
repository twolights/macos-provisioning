#!/bin/bash

sudo xcodebuild -license
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
hash
brew update
brew install ansible
