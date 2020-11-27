#!/bin/bash
# 😉 Crédito: Felipe Facundes
#  Telegram: @FeFacundes
#  Telegram Group: t.me/winehq_linux

########################################################################################
################################## Scripts do Usuário ##################################
########################################################################################
export DISPLAY=':0'
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_SESSION_TYPE=x11
xrdb $HOME/.Xresources
[ "$PATH" == *"$HOME/.local/bin"* ] || PATH="$HOME/.local/bin:$PATH"
xset r rate 350 60 # auto repeat delay:  350    repeat rate:  60

########################################################################################
######################## Programas e serviços a serem iniciados ########################
########################################################################################
tint2 &
xinput disable 11 # Desabilitar o touch screen
xinput disable 12 # Desabilitar o touch screen
volumeicon &
#vncserver &
#-auth & # Esta opção inicia o freerdp sem autenticação e sem segurança.
#xset dpms 600 900 1200
#xset r rate 350 60
#nm-applet &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) &
export SSH_AUTH_SOCK
#ksuperkey -e 'Super_L=Alt_L|F1' &
#ksuperkey -e 'Super_R=Alt_L|F1' &
#anyremote -f /usr/share/anyremote/cfg-data/Server-mode/mouse.cfg -s socket:5197 &
#anyremote -f /usr/share/anyremote/cfg-data/Server-mode/smplayer.cfg -s socket:5197 &
bash -c "sleep 30 && pkill -9 minidlnad" &
bash -c "while true; do minidlnad -f /home/$USER/.config/minidlna/minidlna.conf -P /home/$USER/.config/minidlna/minidlna.pid ; done" &
bash -c "sleep 60 && pkill -9 minidlnad" &
#bash -c "while true; do systemctl --user start anyremote.service ; done" &
#bash -c "while true; do anyremote -f /usr/share/anyremote/cfg-data/Server-mode/all-in-one2.cfg -s socket:5197 ; done" &
#bash -c "while true; do freerdp-shadow-cli /sec:tls ; done" &
#/usr/bin/crd --start &
#systemctl --user start chrome-remote-desktop &
nitrogen --set-zoom-fill "$(find "$HOME"/Imagens/Wallpapers/ -name "*[jJpP][nNpP][gG]" | shuf -n 1)" &
xcompmgr &
#copyq &
/usr/bin/xfce4-clipman &
dbus-run-session openbox &
qbittorrent &
bash -c "sleep 16h; systemctl poweroff -i" &
########################################################################################
############## Checar se o volume está no mute e, restaurar o som a 100% ###############
########################################################################################
MUTE="$(LC_ALL=C pactl list sinks | grep -Ei yes | head -n 2 | cut -c 8-10)"

#pulseaudio -k &
#pkill -9 pulseaudio &
#pulseaudio --disallow-exit --disable-shm &
pulseaudio --start &
#start-pulseaudio-x11 &

if [ -e $MUTE ]; then
  xset b 100
  pactl set-sink-volume 0 100%
else
  pactl set-sink-mute 0 toggle
fi

########################################################################################
################################# Som de inicialização #################################
########################################################################################
#pactl list cards | grep -Ei hdmi
#output:hdmi-stereo
pulseaudio --start && pactl set-card-profile 0 output:analog-stereo+input:analog-stereo
beep=~/.local/songs/media-center-family-facundes.ogg
pulseaudio --start && pactl upload-sample ~/.local/songs/media-center-family-facundes.ogg
sleep 2 && paplay "$beep" --volume=76767 && sleep 0

########################################################################################
#################################### Fix para Xrandr ###################################
########################################################################################
pid="$(pidof paplay)"
if [ -e $pid ]; then
  # Consulte xset -q
  xset s 0 0
  xset s off
  xset s noexpose
  xset s noblank
  xset -dpms # Desativa o DPMS (Energy Star)
  #xset +dpms # Habilita o DPMS (Energy Star)
  #xset dpms 600 900 1200 # Habilita o DPMS (Energy Star) com tempo em segundos: Standby: 600    Suspend: 900    Off: 1200
  xrandr --newmode "1360x768_60.00" 60.00 1360 1432 1568 1776 768 771 781 798 -hsync +vsync
  xrandr --addmode LVDS1 1360x768_60.00
  xrandr | grep -Ei 1360 # Para consular se o modo 1360 realmente está disponível.
  xrandr --output LVDS1 --mode 1360x768_60.00 --pos 0x0 --output HDMI1 --mode 1360x768 --pos 0x0 #--rotate inverted
else
  echo Não foi dessa vez.
fi
########################################################################################
#################################### Fix HDMI Audio ####################################
########################################################################################
#pactl list cards | grep -Ei hdmi
#pactl set-card-profile 0 output:hdmi-stereo

########################################################################################
############################## Papel de Parede Aleatório ###############################
########################################################################################
#while true; do
#  #nitrogen --set-zoom-fill "$(ls -c "$HOME"/Imagens/Wallpapers/*[jJpP][nNpP][gG] | shuf -n 1)"
#  nitrogen --set-zoom-fill "$(find "$HOME"/Imagens/Wallpapers/ -name "*[jJpP][nNpP][gG]" | shuf -n 1)"
#  sleep 10
#done

########################################################################################
############################## Papel de Parede em Sequência ############################
########################################################################################
while true;
    do cd "$HOME"/Imagens/Wallpapers/4k/;
    for i in *.[jJpP][nNpP][gG];
    do nitrogen --set-zoom-fill "$i";
    sleep 10;
    done;
done
