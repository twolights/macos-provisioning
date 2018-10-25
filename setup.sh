#!/bin/bash

SOURCE_PATH=~/test.src
INSTALL_PATH=$SOURCE_PATH/macos-provisioning

sudo xcodebuild -license
xcode-select --install
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
hash
brew update
brew install ansible git

mkdir -p $SOURCE_PATH
git clone https://github.com/twolights/macos-provisioning $INSTALL_PATH

cd $INSTALL_PATH

ansible-galaxy install -r requirements.yml
ansible-playbook -v -i inventory-localhost -K main.yml
