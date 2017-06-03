function vimInstaller() {
  brew install vim --with-lua
  echo "installing ultimate vimrc"
  git clone https://github.com/amix/vimrc.git ~/.vim_runtime
  sh ~/.vim_runtime/install_awesome_vimrc.sh
  touch ~/.vim_runtime/my_configs.vim
  cp installers/vim/my_configs.vim ~/.vim_runtime/ 
  vim +PluginInstall +qall
}
