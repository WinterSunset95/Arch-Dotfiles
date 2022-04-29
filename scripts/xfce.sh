
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)
user=$(whoami)

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


