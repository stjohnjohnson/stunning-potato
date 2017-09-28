#!/bin/bash -e

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

pinfo "Restoring configuration"
ln -s ~/Dropbox/Settings/Mackup/.mackup.cfg ~/.mackup.cfg
mackup restore
