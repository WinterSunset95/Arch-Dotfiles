#!/bin/bash

# Declaring variables
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)

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
cd $dir
