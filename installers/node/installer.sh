
function nodeDependencyInstaller() {
  npm install -g yo gulp-cli
  npm install -g eslint
  npm install gulp -D
}
function nodeInstaller() {
  brew install node
  nodeDependencyInstaller
}
