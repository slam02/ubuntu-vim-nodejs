#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install vim-gnome
sudo apt-get install git
sudo apt-get install curl


# installing nodejs per https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server
cd ~

sudo apt-get install build-essential libssl-dev
curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh
source ~/.profile
source ~/.bashrc

nvm install 0.10.26

# because it seems there is no way to easily install
# nodejs globally for this user...
# see here : http://stackoverflow.com/questions/19352976/npm-modules-wont-install-globally-without-sudo
# mkdir -p ~/npm
# npm config set prefix ~/npm
# if ! grep -q 'export PATH="$PATH:$HOME/npm/bin"' .profile; then
#  cd ~
#  echo 'export PATH="$PATH:$HOME/npm/bin"' >> .profile
# fi
# . ~/.profile
