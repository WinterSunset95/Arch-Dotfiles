#!/bin/bash

# Declaring variables
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)
user=$(whoami)

# Installing the required packages

printf "${boldred}\n\nUpdating package list first${end}"
sudo pacman -Sy
printf "${boldcyan}\nDone!${end}"
printf "${boldred}\n\nInstalling packages from package.txt${end}"
sudo pacman -S - < packages.txt
printf "${boldcyan}\nDone!${end}"

# Setting up the config
# Startx
if [ uid == 0 ]
then
	cd /etc/X11/xinit/
	fname="xinitrc"
else
	cd ~/
	fname=".xinitrc"
fi

printf "${boldred}\n\nSetting up xinit for $user ${end}"
{
	rm -rf .xinitrc
	ln -s $dir/xinitrc $fname
} || {
	ln -s $dir/xinitrc $fname
}
printf "${boldcyan}\nDone!${end}"

# OpenBox
printf "${boldred}\n\nSetting up OpenBox for $user ${end}"
mmaker -vf OpenBox3
if [ uid == 0 ]
then
	cd /etc/xdg/openbox/
else
	cd ~/.config/openbox
fi

{
	rm -rf autostart
	ln -s $dir/autostart
} || {
	ln -s $dir/autostart
}
printf "${boldcyan}\nDone!${end}"

# Setting up neovim
printf "${boldred}\n\nSetting up neovim for $user ${end}"
if [ uid == 0 ]
then
	cd /etc/xdg/
else
	cd ~/.config/
fi
{
    rm -rf nvim
	ln -s $dir/nvim
} || {
	ln -s $dir/nvim
}
printf "${boldcyan}\nDone!${end}"

{
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	printf "\nInstalled vim-plug"
    printf "\nInstalling plugins"
    nvim -c "PlugInstall"
	nvim -c "CocInstall coc-pairs coc-emmet coc-python coc-sh coc-tsserver"
} || {
	printf "\nvim-plug installation failed"
}
pip install pynvim
npm install neovim

# Setting up xfce4
printf "${boldred}\n\nSetting up xfce panel for $user ${end}"
if [ uid == 0 ]
then
	cd /etc/xdg/
else
	cd ~/.config
fi
{
	rm -rf xfce4
	ln -s $dir/xfce4
} || {
	ln -s $dir/xfce4
}
printf "${boldcyan}\nDone${end}"

# Setting up pulseaudio 

if [ $uid == 0]
then
	exit
else
	printf "${boldred}\nSetting up Pulseaudio\n${end}"
	systemctl --user enable pulseaudio
	printf "${boldcyan}\nReboot after installation${end}"

fi
# Setting up yay
	#cd
	#git clone https://aur.archlinux.org/yay.git
	#cd yay
	#makepkg -si

