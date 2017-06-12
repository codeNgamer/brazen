
function zshInstaller() {
  brew install zsh zsh-completions hub

  #install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  cp .zshrc ~/
}
