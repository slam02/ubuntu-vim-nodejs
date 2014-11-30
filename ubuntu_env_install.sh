#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

# see here : http://stackoverflow.com/questions/19352976/npm-modules-wont-install-globally-without-sudo
sudo chown -R $USER /usr/local

apt-get install vim-gnome
apt-get install git
apt-get install curl


# installing nodejs per https://github.com/joyent/node/wiki/installing-node.js-via-package-manager
cd ~
curl -sL https://deb.nodesource.com/setup | sudo bash -

apt-get install -y nodejs
apt-get install -y build-essential
