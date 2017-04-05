#!/bin/bash

source is_installed.sh

function installer() {
  program=${1}
  installerFunc=${2}
  isInstalled=$( program_is_installed  )

  if ! $isInstalled ; then
    echo "checking for ${program}..."
    echo "${program} $(echo_if $(program_is_installed brew))"
    echo "${program} installed, skipping..."
  else
    echo "installing ${program}..."
    $installerFunc
  fi
}

function homebrewInstaller() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}
function rubyInstaller() {
  brew install ruby
}
function gitInstaller() {
  brew install git
}
function nodeDependencyInstaller() {
  npm install -g yo gulp-cli
  npm install -g eslint
  npm install gulp -D
}
function nodeInstaller() {
  brew install node
  nodeDependencyInstaller
}
function vimInstaller() {
  brew install vim 
  echo "installing ultimate vimrc"
  git clone https://github.com/amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_awesome_vimrc.sh
  touch ~/.vim_runtime/my_configs.vim
  cp installers/vim/my_configs.vim ~/.vim_runtime/ 
}
function zshInstaller() {
  brew install zsh zsh-completions

  #install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cp zsh/.zshrc ~/
}
function tmuxInstaller() {
  brew install tmux 
  brew install reattach-to-user-namespace
  cp installers/tmux/.tmux.conf ~/ 
  tmux source-file ~/.tmux.conf

  #install tmuxinator
  gem install tmuxinator
}

installer brew homebrewInstaller
installer ruby rubyInstaller
installer git gitInstaller
installer node nodeInstaller
installer zsh zshInstaller
installer vim vimInstaller
installer tmux tmuxInstaller
