#!/bin/bash
sudo apt-get install stow

# install stuff for nvim
sudo apt-get install ripgrep
sudo apt-get install fd-find
stow nvim

# bash
mv ~/.bashrc ~/.bashrc_backup
stow bash

# git
mv ~/.gitconfig ~/.gitconfig_backup
stow git

# move some scripts
stow scripts
