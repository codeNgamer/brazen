#!/usr/bin/env bash

function vimInstaller() {
  brew install vim --with-override-system-vi --with-lua
  echo "installing ultimate vimrc"
  git clone https://github.com/amix/vimrc.git ~/.vim_runtime
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  sh ~/.vim_runtime/install_awesome_vimrc.sh
  touch ~/.vim_runtime/my_configs.vim
  cp installers/vim/my_configs.vim ~/.vim_runtime/
  vim +PluginInstall +qall
}
