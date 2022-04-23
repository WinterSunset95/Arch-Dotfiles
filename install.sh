#!/bin/bash

#installing the required packages
#sudo pacman -S - < packages.txt
dir=$(pwd) #get current working directory

#setting up the config
# Startx
cd /etc/X11/xinit
printf "\nSetting up xinit"
{
	rm -rf xinitrc
	printf "\nRemoved original xinitrc"
} || {
	printf "\nxinitrc not found\nLinking..."
}
{
	ln -s $dir/xinitrc
	printf "\nLinking successful"
} || {
	printf "\nLinking failed"
} 

# OpenBox
printf "\nSetting up OpenBox"
mmaker -vf OpenBox3
cd /etc/xdg/
{
	rm -rf /etc/xdg/openbox/autostart
	printf "\nRemoved original autostart file"
} || {
	printf "\n\n /etc/xdg/openbox/autostart not found!! \nLinking...\n "
}
{
	ln -s $dir/autostart
	printf "\nLinking successful"
} || {
	printf "\nLinking failed"
}
#setting up neovim
# Bash version of try/catch
printf "\Setting up neovim"
cd /etc/xdg/
{
    rm -rf nvim
    printf "\nRemoved nvim\nLinking..."
} || {
    printf "\nnvim not found\nLinking..."
}
{
	ln -s $dir/nvim
	printf "\nLinked successfully"
} || {
	printf "\nLinking failed"
}

{
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	printf "\nInstalled vim-plug"
    printf "\nInstalling plugins"
    nvim -c "PlugInstall"
} || {
	printf "\nvim-plug installation failed"
}

#setting up yay
#cd
#git clone https://aur.archlinux.org/yay.git
#cd yay
#makepkg -si

#backgrounds
#feh --bg-scale ~/dotfs/wallpapers/wp4504931-grunge-aesthetic-wallpapers.png
