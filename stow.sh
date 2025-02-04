#!/bin/bash

sudo apt-get update
sudo apt-get install stow

# install neovim from snap
sudo snap install nvim --classic

# install stuff for nvim
sudo apt-get install ripgrep
sudo apt-get install fd-find
stow nvim

# bash
sed -i 's/\r//' bash/.bashrc # fix line endings just in case
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
