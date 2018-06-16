
function nodeDependencyInstaller() {
  npm install -g yo gulp-cli
  npm install -g eslint
  npm install gulp -D
}
function nodeInstaller() {
  brew install node
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  nodeDependencyInstaller
}
