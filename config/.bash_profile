#!/bin/bash
# ~/.bash_profile
#
#[[ -f ~/.bashrc ]] && . ~/.bashrc
export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0
#tput setaf 1 ; echo "→ Escolha sua Interface"
#tput setaf 2 ; echo "→ 1 - Openbox"
#tput setaf 6 ; echo "→ 2 - DWM"
#tput setaf 3 ; echo "→ 3 - Sway"
#tput setaf 7 ; echo "→ 4 - Tty"
#tput setaf 7 ; read opcao;
# case $opcao in
# "1")
# Openbox=$(sleep 2; startx)
# ;;
# "2")
# DWM=$(sleep 2; sx)
# ;;
# "3")
# Sway=$(sleep 2; ~/.make/swayrc)
# ;;
# "4")
# Tty=$(bash)
# ;;
#esac
#exit

# automatically run startx when logging in on tty1
[ $XDG_VTNR ] && exec startx
#if [[ ! $DISPLAY && ${XDG_VTNR} == 1 ]]; then
#    exec startx
#fi
