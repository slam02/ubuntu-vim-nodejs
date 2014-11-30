#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo chown -R $USER /usr/local

sudo apt-get install vim-gnome
sudo apt-get install git
sudo apt-get install curl


# installing nodejs per https://github.com/joyent/node/wiki/installing-node.js-via-package-manager
cd ~
curl -sL https://deb.nodesource.com/setup | sudo bash -

sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# because it seems there is no way to easily install
# nodejs globally for this user...
# see here : http://stackoverflow.com/questions/19352976/npm-modules-wont-install-globally-without-sudo
mkdir -p ~/npm
npm config set prefix ~/npm
if ! grep -q 'export PATH="$PATH:$HOME/npm/bin"' .profile; then
  cd ~
  echo 'export PATH="$PATH:$HOME/npm/bin"' >> .profile
fi
. ~/.profile
