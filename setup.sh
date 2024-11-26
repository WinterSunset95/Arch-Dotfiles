#!/bin/bash

# Declaring variables
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)

# List of what I need to do
# 1. Setup Xorg
# 2. Setup pipewire
# 3. Setup Picom, Conky, Polybar, Neovim

# Function to create a symbolic link for the config folders
link () {
	if [ -e ./$1 ]
	then
		rm -rf ./$1
	fi
	ln -sf $dir/$1 ./$1
}

# Installing a nerdfont
installNerdFont () {
}


# Ask user if they want to install the dependencies
echo -e "${boldcyan}Do you want to install the dependencies? [y/n]${end}"
read -r answer
if [ "$answer" != "${answer#[Yy]}" ]
then
	sudo pacman -S --noconfirm alacritty conky i3-gaps neovim polybar picom tmux feh
fi

echo -e "${boldcyan}Do you want to install the fonts? [y/n]${end}"
read -r answer
if [ "$answer" != "${answer#[Yy]}" ]
then
	sudo pacman -S --noconfirm ttf-font-awesome noto-fonts-emoji
	if [ ! -d $HOME/.local/share/fonts/nerd-fonts ]
	then
		mkdir -p $HOME/.local/share/fonts/nerd-fonts
	fi
	curl -L -o $HOME/.local/share/fonts/nerd-fonts/DaddyTimeMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/DaddyTimeMono.zip
	unzip $HOME/.local/share/fonts/nerd-fonts/DaddyTimeMono.zip -d $HOME/.local/share/fonts/nerd-fonts
	rm $HOME/.local/share/fonts/nerd-fonts/DaddyTimeMono.zip

	curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/ComicShannsMono.zip -o $HOME/.local/share/fonts/nerd-fonts/ComicShannsMono.zip
	unzip $HOME/.local/share/fonts/nerd-fonts/ComicShannsMono.zip -d $HOME/.local/share/fonts/nerd-fonts
	rm $HOME/.local/share/fonts/nerd-fonts/ComicShannsMono.zip

	curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/NerdFontsSymbolsOnly.zip -o $HOME/.local/share/fonts/nerd-fonts/NerdFontsSymbolsOnly.zip
	unzip $HOME/.local/share/fonts/nerd-fonts/NerdFontsSymbolsOnly.zip -d $HOME/.local/share/fonts/nerd-fonts
	rm $HOME/.local/share/fonts/nerd-fonts/NerdFontsSymbolsOnly.zip
fi

if test -t $HOME/.config
then
	mkdir $HOME/.config
fi

cd $HOME/.config
link alacritty
link conky
link i3
link nvim
link polybar
link picom
link tmux
link sway
link waybar
link hypr
link eww
link dunst
cd $dir

echo -e "${boldcyan}Links complete!${end}"
echo -e "${boldcyan}Setup pipewire? [y/n]${end}"
read -r answer
if [ "$answer" != "${answer#[Yy]"]
then
	systemctl --user enable pipewire
	systtmctl --user enable pipewire-pulse
fi

echo -e "${boldcyan}Setup complete!${end}"
echo -e "${boldcyan}Setup Neovim? [y/n]${end}"
read -r answer
if [ "$answer" != "${answer#[Yy]" ]
then
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
echo -e "${boldcyan}Setup complete!${end}"


