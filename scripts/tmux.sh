red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

uid=$(id -u)
user=$(whoami)

printf "${boldred}\n\nSetting up tmux for $user ${end}\n"

cd ~
rm -rf tmux-config || printf "\n${boldred}tmux-config doesn't exist... cloning${end}"
git clone https://github.com/WinterSunset95/tmux-config
cd tmux-config
winter_dir=$(pwd)
bash tmux.sh
