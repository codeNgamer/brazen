#!/bin/zsh

source is_installed.sh --source-only

echo 'sourcing installers...';
for dir in ./installers/* ; do
 source "$dir/installer.sh" --source-only
done

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


installer brew homebrewInstaller
installer rbenv rubyInstaller
installer git gitInstaller
installer node nodeInstaller
installer zsh zshInstaller
installer vim vimInstaller
installer tmux tmuxInstaller
installer neo4j neo4jInstaller
installer mvn mavenInstaller
installer yarn yarnInstaller
installer mongod mongoInstaller
installer iterm2 iterm2Installer
