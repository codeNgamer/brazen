
function rubyInstaller() {
  brew update
  brew install ruby-build rbenv llvm
  rbenv init
  rbenv install rbx-3.75
}
