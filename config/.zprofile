#!/bin/bash
#[[ -f ~/.bashrc ]] && . ~/.bashrc
export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0

# COLORS VARIABLES
. ~/.shell_utils/colors_shell.sh

# functio read
# automatically run startx when logging in on tty1

rm ~/.startx_log
touch ~/.startx_log
echo -e "\n${BYellow}Escolha uma alternativa:\n"
echo -e "${BGreen}1 - StartX"
echo -e "${BCyan}2 - Terminal${Color_Off}"
echo
read option
echo
    case "$option" in
        "1")
            echo -e "\n${BYellow}Escolha uma alternativa:\n"
            echo -e "${BGreen}1 - Openbox"
            echo -e "${BYellow}2 - JWM${Color_Off}"
            echo -e "${BCyan}3 - Fluxbox${Color_Off}"
            echo -e "${BPurple}4 - Awesome${Color_Off}"
            echo
            read option
            echo
                case "$option" in
                    "1")
                        export start_wm='openbox'
                        [ $XDG_VTNR ] && exec startx >> ~/.startx_log
                    ;;
                    "2")
                        export start_wm='jwm'
                        [ $XDG_VTNR ] && exec startx >> ~/.startx_log
                    ;;
                    "3")
                        export start_wm='fluxbox'
                        [ $XDG_VTNR ] && exec startx >> ~/.startx_log
                    ;;
                    "4")
                        export start_wm='awesome'
                        [ $XDG_VTNR ] && exec startx >> ~/.startx_log
                    ;;
                    *)
                        echo -e "${BRed}Opção inválida!${Color_Off}"
                        sleep 1.2
                        exit
                    ;;
                esac
            exit
        ;;
        "2")
            echo -e "${BGreen}Bem vindo ao terminal!${Color_Off}\n"
            zsh
        ;;
        *)
            echo -e "${BRed}Opção inválida!${Color_Off}"
            sleep 1.2
            exit
        ;;
    esac
exit


#if [[ ! $DISPLAY && ${XDG_VTNR} == 1 ]]; then
#    exec startx
#fi

