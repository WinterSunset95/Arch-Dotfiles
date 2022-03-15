#!/bin/bash

#installing the required packages
sudo pacman -S - < packages.txt

#setting up the config
mkdir ~/.config
cd ~
ln -s ~/dotfs/.xinitrc
ln -s ~/dotfs/.fehbg
cd ~/.config
ln -s ~/dotfs/coc/
ln -s ~/dotfs/nvim/
ln -s ~/dotfs/guake/
ln -s ~/dotfs/i3/


#setting up neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
sudo pacman -Syu
nvim -c 'PackerInstall'
cd ~/.config/coc/extensions
npm install --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod
sudo npm install -g neovim
pip install neovim
nvim -c 'CocUpdate'
nvim -c 'CocInstall coc-snippets coc-css coc-html coc-tsserver'

#setting up yay
cd
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
