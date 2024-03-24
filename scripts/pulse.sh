
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)
user=$(whoami)

if [ $uid == 0 ]
then
	printf "${boldred}\nCannot enable pulseaudio for root"
	printf "${boldcyan}\nDone!${end}"
else
	printf "${boldred}\nSetting up Pulseaudio\n${end}"
	systemctl --user enable pulseaudio
	printf "${boldcyan}\nReboot after installation${end}"

fi

