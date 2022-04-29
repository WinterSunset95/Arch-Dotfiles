
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)
user=$(whoami)

printf "${boldred}\n\nSetting up OpenBox for $user ${end}\n"
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
printf "${boldcyan}Done!${end}"


