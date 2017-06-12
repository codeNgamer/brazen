function tmuxInstaller() {
  brew install tmux reattach-to-user-namespace tmuxinator-completion
  cp installers/tmux/.tmux.conf ~/
  tmux source-file ~/.tmux.conf

  #install tmuxinator
  gem install tmuxinator
}
