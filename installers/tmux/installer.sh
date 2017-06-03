function tmuxInstaller() {
  brew install tmux reattach-to-user-namespace
  cp installers/tmux/.tmux.conf ~/ 
  tmux source-file ~/.tmux.conf

  #install tmuxinator
  gem install tmuxinator
}
