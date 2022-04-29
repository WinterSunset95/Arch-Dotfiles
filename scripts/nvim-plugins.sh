red=31
cyan=36
boldred="\e[1;${red}m"
boldcyan="\e[1;${cyan}m"
end="\e[0m"

dir=$(pwd)
uid=$(id -u)
user=$(whoami)

printf "${boldred}\n\nInstalling vim-plug with recommended plugins\n${end}"
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
printf "${boldcyan}Done!${end}\n"
