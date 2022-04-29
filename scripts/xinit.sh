
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)
user=$(whoami)


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


