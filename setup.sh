#!/bin/bash

# Declaring variables
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)

# Installing the required packages

printf "${boldred}\n\nUpdating package list first${end}"
#sudo pacman -Sy
printf "${boldcyan}\nDone!${end}"
printf "${boldred}\n\nInstalling packages from package.txt${end}"
#sudo pacman -S - < packages.txt
printf "${boldcyan}\nDone!${end}"

# Init function
call () {
	cd $dir/scripts
	if [ uid == 0 ]
	then
		sudo bash $1.sh
	else
		bash $1.sh
	fi
}

# Setting up the config
# Startx
call "xinit"

# OpenBox
call "openbox"

# Setting up neovim
call "nvim"

# Setting up xfce4
call "xfce"

# Setting up pulseaudio 
call "pulse"

# Setting up yay
	#cd
	#git clone https://aur.archlinux.org/yay.git
	#cd yay
	#makepkg -si

