#!/bin/sh

ans=$(zenity  --width=40 --height=200 --title="Sair" --list  --text "O que você quer fazer?" --radiolist  --column "Escolha" --column "Ação" TRUE Logout FALSE Reiniciar FALSE Desligar); #echo $ans


if [ "$ans" = "Logout" ] ; then
   kill -TERM $(xprop -root _BLACKBOX_PID | awk '{print $3}')
fi
if [ "$ans" = "Reiniciar" ]; then
   reboot
fi
if [ "$ans" = "Desligar" ]; then
   shutdown -h now
fi
