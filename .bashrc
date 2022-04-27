#!/bin/bash
# ~/.bashrc
#

end="\e[0m"
red="31"
cyan="36"

boldred="\e[1;${red}m"
boldcyan="\e[3;${cyan}m"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias la='ls -a'
PS1="${boldred}\n [\u@\h ${end}${boldcyan}\w${end}${boldred}]\n \$ ${end}"
