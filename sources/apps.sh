#!/bin/bash -e

pinfo "Installing Required Packages"
brew bundle --file=- <<EOF
    # Communication
    cask 'slack'          # To chat with most people
    cask 'whatsapp'       # To see everyone's group chats
    cask 'telegram'       # To automate all the things
    cask 'discord'        # To chat while gaming

    # Editors
    cask 'atom'           # Coding and stuff
    cask 'sublime-text'   # Editing big files
    cask 'xmind'          # Mindmapping
    cask 'macdown'        # Markdown editor
    brew 'vim'            # When you really need it

    # Development
    cask 'docker'         # Doing things in containers
    brew 'docker-compose' # Doing things in many containers
    cask 'hab'            # Doing really cool things in containers
    cask 'virtualbox'     # Doing things in VMs
    cask 'vagrant'        # Doing things in VMs via the command-line
    cask 'chefdk'         # Doing things with Chef
    brew 'hub'            # Collaborating with a fancy UI
    brew 'kubernetes-cli' # Controlling deployed services
    brew 'awscli'         # Working with Amazon

    # Productivity
    cask 'iterm2'         # Doing things on a terminal
    cask 'alfred'         # Shortcuts to awesome
    cask 'vlc'            # Watching movies
    cask 'google-chrome'  # Browsing the web
    cask 'keybase'        # Sharing secrets
    brew 'screen'         # Just in case
    # cask 'copay'          # Paying people

    # Taskbar stuff
    cask 'bitbar'         # Display pretty things in my taskbar
    cask 'nosleep'        # Keep machine from turning off
    cask 'caffeine'       # Keep screen from going to sleep
    cask 'spectacle'      # Move windows around
    cask 'flux'           # Sleep better

    # Gaming
    cask 'steam'          # So I can play games
    cask 'battle-net'     # Lots of games
    brew 'nethack'        # For when you're feeling nostalgic
EOF

pinfo "Installing Oh-My-ZSH"
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
chsh -s /bin/zsh
