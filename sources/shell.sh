#!/bin/bash -e

pinfo "Installing Oh-My-ZSH"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
