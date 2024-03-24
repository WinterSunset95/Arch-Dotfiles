
red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

uid=$(id -u)
user=$(whoami)

printf "${boldred}\n\nSetting up neovim for $user ${end}\n"

cd ~
rm -rf winter-nvim || printf "\n${boldred}winter-nvim doesn't exist... cloning${end}"
git clone https://github.com/WinterSunset95/winter-nvim
cd winter-nvim
winter_dir=$(pwd)
bash nvim.sh
