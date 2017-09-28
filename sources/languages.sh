#!/bin/bash -e

pinfo "Installing Languages"
brew install asdf
source /usr/local/opt/asdf/asdf.sh

pnotice "Installing GoLang"
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git

pnotice "Installing Ruby"
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

pnotice "Installing Python"
asdf plugin-add python https://github.com/tuvistavie/asdf-python.git

pnotice "Installing Language Versions"
pushd ~/
asdf install
popd

pinfo "Installing Node.js"
brew install nvm

nvm install 6
nvm alias default 6

pnotice "Installing Global Packages"
npm install -g jenkins-mocha mocha
gem install bundler
