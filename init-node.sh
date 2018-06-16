#!/bin/bash

function nodeDependencyInstaller() {
  yarn global add prettier eslint eslint-plugin-prettier eslint-config-prettier yo
  npx babel node-installers --out-file index.js
  npx babel-node index.js
}
# letting yarn install node as well
brew install yarn
nodeDependencyInstaller

