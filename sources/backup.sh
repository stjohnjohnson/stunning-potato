#!/bin/bash -e

pinfo "Installing Backup Recovery Items"
brew bundle --file=- <<EOF
    # Backup
    cask 'arq'            # Backup program
    cask 'dropbox'        # Local configuration storage

    # Shell Stuff
    brew 'lastpass-cli'   # Accessing secrets
    brew 'zsh'            # Not bash
    brew 'coreutils'      # All those cool GNU things
    brew 'gpg'            # Encryption and Signing
    brew 'git'            # Collaborating
EOF

pnotice "Please Login to Lastpass"
read -p "LastPass Email Address: " -r LASTPASS_EMAIL
lpass login ${LASTPASS_EMAIL}

pnotice "Dropbox Username and Password (in clipboard)"
lpass show --username dropbox.com
lpass show --password dropbox.com | pbcopy

pwarn "Please login to Dropbox and start syncing"
open /Applications/Dropbox.app

prompt

# @TODO Arq restore
