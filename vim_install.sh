#!/bin/bash

# sudo apt-get install vim-gnome
if [ ! -d ~/.vim ]; then
  mkdir -p ~/.vim
fi

bundlePath=~/.vim/bundle

currentFolder=~/ubuntu-vim-nodejs

function clone {
  echo Cloning path $2
  local dest=$bundlePath/$2
  if [ -d $dest ]; then
    rm -rf $dest
  fi
  cd $bundlePath
  git clone https://github.com/$1

}

function pathogen {
  echo installing 'pathogen'
  mkdir -p ~/.vim/autoload $bundlePath && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
}

function youCompleteMe {
  echo installing 'YouCompleteMe'
  sudo apt-get install build-essential cmake
  sudo apt-get install python-dev

  clone Valloric/YouCompleteMe.git YouCompleteMe

  cd ~/.vim/bundle/YouCompleteMe

  git submodule update --init --recursive

  ./install.sh --clang-completer
}


function installAg {
  echo installing 'silver search'
  cd ~

  sudo apt-get install silversearcher-ag
  clone rking/ag.vim ag.vim
}

function ctrlp {
  echo installing 'ctrlp'
  clone kien/ctrlp.vim.git ctrlp.vim
}

function nerdtree {
  echo installing 'nerdtree'
  clone scrooloose/nerdtree.git nerdtree
}

function syntastic {
  echo installing 'syntastic'
  npm install -g jshint
  clone scrooloose/syntastic.git syntastic
}

function ternForVim {
  echo installing 'ternForVim'
  clone marijnh/tern_for_vim.git tern_for_vim
  cd ~/.vim/bundle/tern_for_vim
  npm install
}

function ultisnips {
  echo installing 'ultisnips'
  clone SirVer/ultisnips.git ultisnips

  # also adding custom snippets
  # in order to work, the array g:UltiSnipsSnippetDirectories must contain "jf-snippets". Done in .vimrc
  cd $bundlePath
  ln -s $currentFolder/vim-jfsnippets vim-jfsnippets

}

function vimSnippets {
  echo installing 'vimSnippets'
  clone honza/vim-snippets.git vim-snippets
}

function vimCommentary {
  echo installing 'vimCommentary'
  clone tpope/vim-commentary.git vim-commentary
}

function vimJsBeautify {
  echo installing 'vimJsBeautify'
  npm -g install js-beautify
  clone maksimr/vim-jsbeautify.git vim-jsbeautify
  cd $bundlePath/vim-jsbeautify
  git submodule update --init --recursive
}

function vimJsDoc {
  echo installing 'vimJsDoc'
  clone heavenshell/vim-jsdoc.git vim-jsdoc
}

function easyAlign {
  echo installing 'easyAlign'
  clone junegunn/vim-easy-align vim-easy-align
}

function fugitive {
  echo installing 'vim-fugitive'
  clone tpope/vim-fugitive.git vim-fugitive
  vim -u NONE -c "helptags vim-fugitive/doc" -c q
}

function solarized {
  # command to put in vimrc if I want to switch to solarized
  #
  # set background=dark
  # " I want high contrast diffs
  # let g:solarized_diffmode="high"
  # colorscheme solarized

  echo installing 'solarized' color scheme
  clone altercation/vim-colors-solarized.git vim-colors-solarized
}

function iceberg {
  echo installing 'iceberg' color scheme
  clone cocopon/iceberg.vim.git  iceberg.vim
}

function delimitMate {
  echo insalling delimitMate
  clone Raimondi/delimitMate.git delimitMate
}

function vimrc {
  local dest=$currentFolder

  cd ~

  echo Symlinking .vimrc
  if [ -f .vimrc ]; then
    mv .vimrc .vimrc.bak
  fi
  ln -s $dest/.vimrc .vimrc
}

pathogen
nerdtree
ctrlp
installAg
vimCommentary
vimJsDoc
vimJsBeautify
easyAlign
ultisnips
vimSnippets
syntastic
ternForVim
youCompleteMe
fugitive
solarized
iceberg
delimitMate

vimrc
