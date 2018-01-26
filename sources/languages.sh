#!/bin/bash -e

pinfo "Installing Languages"

pnotice "Installing Node.js"
brew install nvm
# Install latest stable version
nvm install 8
nvm alias default 8
# Install global packages
npm install -g \
    jenkins-mocha \
    mocha \
    diagrams

pnotice "Installing Ruby"
brew install rbenv
# Ensure it works
rbenv init
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
# Install latest stable version
rbenv install 2.5.0
# Install global packages
gem install bundler
