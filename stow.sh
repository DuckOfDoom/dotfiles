#!/bin/bash
sudo apt-get update

# install stuff for nvim
sudo apt-get install ripgrep
sudo apt-get install fd-find

# link nvim config
mkdir ~/.config
ln -s nvim ~/.config/nvim

# install neovim from snap
sudo snap install nvim --classic

# bash
sed -i 's/\r//' bashrc # fix line endings just in case
if [ ! -f ~/.bashrc_backup ]; then
    mv ~/.bashrc ~/.bashrc_backup
    echo "Backed up .bashrc"
fi

ln -f bashrc ~/.bashrc

# git
if [ ! -f ~/.gitconfig_backup ]; then
    mv ~/.gitconfig ~/.gitconfig_backup
    echo "Backed up .gitconfig"
fi

ln -f gitconfig ~/.gitconfig


# move some scripts
for script in scripts/*.*; do
    echo $script
    ln -s $script ~/$script
done

# for creating symlink on windows in cmd
# mklink .gitconfig "\\wsl.localhost\Ubuntu\home\duckofdoom\.dotfiles\gitconfig"
