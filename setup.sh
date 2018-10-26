#!/bin/bash

SOURCE_PATH=~/test.src
INSTALL_PATH=$SOURCE_PATH/macos-provisioning
TEMP_DROID_SANS_PATH=/tmp/droid-sans-mono.zip

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

sudo chsh -s /bin/zsh $USER

bash <(curl -L https://raw.github.com/twolights/meowrc/master/setup.sh)

pushd /tmp
wget -O $TEMP_DROID_SANS_PATH https://www.fontsquirrel.com/fonts/download/droid-sans-mono
unzip $TEMP_DROID_SANS_PATH
mv /tmp/DroidSansMono.ttf ~/Library/Fonts
rm -f $TEMP_DROID_SANS_PATH
popd

cp files/com.apple.Terminal.plist ~/Library/Preferences/

# TODO
# Install VPN
# Dock mode
# Swipe fingers
