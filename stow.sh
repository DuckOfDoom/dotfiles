#!/bin/bash
sudo apt-get update
sudo apt-get install stow

# install stuff for nvim
sudo apt-get install ripgrep
sudo apt-get install fd-find
stow nvim

# bash
if [ ! -f ~/.bashrc_backup ]; then
    mv ~/.bashrc ~/.bashrc_backup
    echo "Backed up .bashrc"
fi

stow bash

# git
if [ ! -f ~/.gitconfig_backup ]; then
    mv ~/.gitconfig ~/.gitconfig_backup
    echo "Backed up .gitconfig"
fi
stow git

# move some scripts
stow scripts
