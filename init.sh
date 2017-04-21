#!/bin/zsh

source is_installed.sh --source-only

forceFlag=${1:-"0"}

function installer() {
  program=${1}
  installerFunc=${2}
  isInstalled=$(program_is_installed ${program}) 


  echo "checking for ${program}..."

  if [ $forceFlag = "--force" ] ; then
    echo "installing ${program}..."
    $installerFunc
    echo "done!"
  elif [ $isInstalled = "1" ] ; then
    echo "${program} $(echo_if $isInstalled)"
    echo "${program} installed, skipping..."
  elif [ $isInstalled = "0" ] ; then
    echo "installing ${program}..."
    $installerFunc
    echo "done!"
  fi
}

function homebrewInstaller() {
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}
function rubyInstaller() {
  brew update 
  brew install ruby-build rbenv
  rbenv init
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
  brew install vim --with-lua
  echo "installing ultimate vimrc"
  git clone https://github.com/amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_awesome_vimrc.sh
  touch ~/.vim_runtime/my_configs.vim
  cp installers/vim/my_configs.vim ~/.vim_runtime/ 
  vim +PluginInstall +qall
}
function zshInstaller() {
  brew install zsh zsh-completions hub

  #install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cp zsh/.zshrc ~/
}
function tmuxInstaller() {
  brew install tmux reattach-to-user-namespace
  cp installers/tmux/.tmux.conf ~/ 
  tmux source-file ~/.tmux.conf

  #install tmuxinator
  gem install tmuxinator
}
function neo4jInstaller() {
  brew install neo4j
  echo 'installing npm neo4j..'
  npm install -g neo4j
}
function meteorInstaller() {
  curl https://install.meteor.com/ | sh
}

function mavenInstaller() {
  brew install maven
}

function yarnInstaller() {
  brew install yarn 
}

function mongoInstaller() {
  brew install mongodb
}

installer brew homebrewInstaller
installer rbenv rubyInstaller
installer git gitInstaller
installer node nodeInstaller
installer zsh zshInstaller
installer vim vimInstaller
installer tmux tmuxInstaller
installer neo4j neo4jInstaller 
installer meteor meteorInstaller
installer mvn mavenInstaller
installer yarn yarnInstaller
installer mongod mongoInstaller
