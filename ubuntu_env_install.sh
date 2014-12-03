#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install vim-gnome
sudo apt-get install git
sudo apt-get install curl


# installing nodejs per https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04-server
cd ~

sudo apt-get install build-essential libssl-dev

rm -rf ~/.nvm

curl https://raw.githubusercontent.com/creationix/nvm/v0.20.0/install.sh | sh

if ! grep -q '\. "$HOME/.bashrc"' .profile; then
  echo 'if [ -n "$BASH_VERSION" ]; then' >> .profile
  echo '  # include .bashrc if it exists' >> .profile
  echo '  echo "sourcing .bashrc"' >> .profile
  echo '  if [ -f "$HOME/.bashrc" ]; then' >> .profile
  echo '    . "$HOME/.bashrc"' >> .profile
  echo '  fi' >> .profile
  echo 'fi' >> .profile
fi

# ok...need to source the file directly...because I'm not sure why.
# found the proposition here: https://github.com/creationix/nvm/issues/521#issuecomment-55017400
. $NVM_DIR/nvm.sh

nvm install 0.10.26
nvm alias default 0.10.26
nvm use default

# to enable node and npm right away
. ~/.profile
