#!/bin/bash -e

pinfo "Restoring configuration"

# Home Directory
LINKS=( .atom .aws .config .curlrc .editorconfig .gitconfig .gitignore .hab .kube .npmrc .screenrc .ssh .tool-versions .vimrc .zshrc )
for LINK_PATH in ${LINKS[*]}
do
    pnotice "Linking ${LINK_PATH}"
    rm -fr ~/${LINK_PATH}
    ln -s ~/Dropbox/Settings/Dotfiles/${LINK_PATH} ~/${LINK_PATH}
done

# Application Support Things
# Spectacle
# Unison
