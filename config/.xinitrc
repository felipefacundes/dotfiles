#!/bin/bash

# User-specific variables should be placed in $HOME/.config/openbox/environment
#

export DISPLAY=:0
# set main XDG variables
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CURRENT_DESKTOP=OPENBOX
export XDG_SESSION_DESKTOP=openbox
export XDG_MENU_PREFIX=openbox-

# clean DM influence
export DESKTOP_SESSION=openbox
unset GDMSESSION

# Vblank
export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0

# for reducing GTK stderr spam
export NO_AT_BRIDGE=1

# fix and sync Qt and GTK theming
export GTK2_RC_FILES="${HOME}/.gtkrc-2.0:${XDG_CONFIG_HOME}/gtk-2.0/gtkrc:/etc/gtk-2.0/gtkrc"
export QT_QPA_PLATFORMTHEME=gtk2
export QT_QPA_PLATFORM=xcb
export QT_STYLE_OVERRIDE=gtk2
export GTK_RC_FILES=~/.config/gtk-3.0/settings.ini

# see https://unix.stackexchange.com/a/295652/332452
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh
eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"
export SSH_AUTH_SOCK
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings


# Cursor Theme fix for WMs: openbox, i3 and more...
# How to use lxappearance
xsetroot -cursor_name left_ptr
xrdb -merge ~/.Xresources

cursor_theme_fix()
{
while true
    do sleep 5
          export cursor_theme=`cat ~/.config/gtk-3.0/settings.ini | sed -n 5p | cut -c 21-333`
          export cursor_size=`cat ~/.config/gtk-3.0/settings.ini | grep gtk-cursor-theme-size= | cut -c 23-25`
          export cursor_theme_old=`cat ~/.Xresources | sed -n 2p | cut -c 16-333`
          export cursor_size_old=`cat ~/.Xresources | sed -n 3p | cut -c 15-333`
          export cursor_theme_fix_origin=`cat ~/.gtkrc-2.0 | sed -n 8p | sed 's/"//' | sed 's/"//' | cut -c 23-333`
          export cursor_theme_fix_replace=`cat ~/.config/gtk-3.0/settings.ini | grep gtk-icon-theme-name= | cut -c 21-333`
          #export cursor_theme_fix_replace=`cat ~/.config/gtk-3.0/settings.ini | sed -n 5p | cut -c 21-333`
          sed -i "s|$cursor_theme_fix_replace|$cursor_theme_fix_origin|g" ~/.config/gtk-3.0/settings.ini
          sed -i "2 s|$cursor_theme_old|$cursor_theme|g" ~/.Xresources
          sed -i "3 s|$cursor_size_old|$cursor_size|g" ~/.Xresources
          xsetroot -cursor_name left_ptr
          #export XCURSOR_THEME="$cursor_name"
          #export XCURSOR_SIZE="$cursor_size"
          xrdb -merge ~/.Xresources &
done
}

# Restore persistent volume TV
old_vol=`cat ~/.local/bin/tv-default-volume.sh | head -5 | sed -n 5p | cut -c 16-17 | grep -E "[^[:blank:]]"`
sed -i "5 s|$old_vol|12|g" ~/.local/bin/tv-default-volume.sh
~/.local/bin/tv-default-volume.sh &
~/.local/bin/fix_no-at_shutdown_lgtv.sh &
#eval $(atrm $(seq 999); at -f ~/.local/bin/at-lgtv.sh 23:59) &

battery_check()
{
while true
    do sleep 16
        battery_check=`LANG=c acpi | awk '{ print $6 }'`
        if [ "$battery_check" = remaining ]; then
            notify-send Power Unplugged
        fi
done
}

monitor_mode()
{
    sleep 2

    ###xrandr --setprovideroutputsource modesetting modesetting &  # restar x
    ###xrandr --auto
    ###--rate 120.00

    xrandr --output eDP-1-1 --primary --mode 1920x1080 --auto \
        --pos 0x0 --rotate normal --output HDMI-0 --off

    sleep 2
    #cvt 1920 1080
    #xrandr -s 1920x1080 --auto
    xrandr --newmode "1920x1080_148"  148.50  1920 2008 2052 2200  1080 1084 1089 1125 +hsync +vsync
    xrandr --verbose --addmode eDP-1-1 "1920x1080_148"
    xrandr --output eDP-1-1 --mode "1920x1080_148"
    xrandr --newmode `cvt 1920 1080 | tail -n1 | sed 's#Modeline ##g' | sed 's#"##g'`
    xrandr --verbose --addmode eDP-1-1 `cvt 1920 1080 | tail -n1 | awk '{print $2}' | sed 's#"##g'`
    xrandr --output eDP-1-1 --mode `cvt 1920 1080 | tail -n1 | awk '{print $2}' | sed 's#"##g'`
    xrandr -s 1920x1080 -r 70
    xrandr -s 1920x1080 -r 75
    xrandr -s 1920x1080 -r 89
    #xrandr -s "1920x1080_148" --auto
    xrandr -s `cvt 1920 1080 | tail -n1 | awk '{print $2}' | sed 's#"##g'` --auto
}

random_wallpaper()
{
    xrefresh -white
    sleep 2
    feh --bg-fill "$(find "${HOME}"/Imagens/Wallpapers/ -name '*[jJpP][nNpP][gG]' | shuf -n 1)"
    ###nitrogen --set-auto $(find "${HOME}"/Imagens/Wallpapers/ -name '*[jJpP][nNpP][gG]' | shuf -n1)
}

start_sound()
{
    # Check pipewire
    #aplay -lL
    #pactl list cards
    #pactl list sinks
    #sudo fuser -v /dev/snd/*
    #wpctl status
    #systemctl --user status pipewire pipewire-media-session pipewire-pulse wireplumber

    #systemctl --user mask pipewire pipewire-pulse
    systemctl --user enable --now pipewire.service
    systemctl --user enable --now wireplumber.service
    systemctl --user enable --now pipewire-media-session.service
    systemctl --user enable --now pipewire-pulse
    #systemctl --user mask wireplumber pipewire pipewire-pulse
    #systemctl --user mask wireplumber pipewire pipewire-alsa
    #systemctl --user mask wireplumber pipewire pipewire-jack

    pactl load-module module-equalizer-sink
    pactl load-module module-dbus-protocol
}

# persistent pid of openbox, tint2 and more...
persistent_pid()
{
rm ~/.wm_log
touch ~/.wm_log
while true
    do wm=`pidof ${start_wm}`
       tint2=`pidof tint2`
       xpad=`pidof xpad`
       parcellite=`pidof parcellite`
       #transmission=`pidof transmission-gtk`

######## MY WM:
        if [ -z "${wm}" ]; then
            if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
                    # if not found, launch a new one
                    export "$(dbus-launch)" &
                    eval "$(dbus-launch --sh-syntax --exit-with-session ${start_wm})" &
                    echo "D-Bus per-session daemon address is: $DBUS_SESSION_BUS_ADDRESS"
                    monitor_mode &
            else
                    # WM LOG OUTPUT
                    echo "${start_wm} log - `date +'%d/%m/%Y - %T'`" >> ~/.wm_log &
                    echo -e "------------------------------------\n" >> ~/.wm_log &

                    if [ ${start_wm} = openbox ]; then
                        ${start_wm} --debug >> ~/.wm_log &
                    elif [ ${start_wm} = fluxbox ]; then
                        ${start_wm} -log ~/.wm_log &
                    else
                        ${start_wm} >> ~/.wm_log &
                    fi

                    monitor_mode &
            fi
        fi

######## TINT2 SLAVE PIDs
        if [ -z "${tint2}" ]; then
            xrefresh
            tint2 &
        fi
        if [ -n "${tint2}" ] && [ -z "${parcellite}" ]; then
            parcellite &
        fi
        if [ -n "${tint2}" ] && [ -z "${xpad}" ]; then
            xpad -h &
        fi
        #if [ -n "${tint2}" ] && [ -z "${transmission}" ]; then
        #    exec transmission-gtk -m &
        #fi
    sleep 7
done
}

# Inert suspend
# Convert minutes to milliseconds
# 15 minutes = (15 * 60) * 1000
# get_mouse_pointer=`echo $(xdotool getmouselocation | grep -oP "[0-9]+ y:[0-9]+" | sed 's/ y://' | tr -d '\n')`
suspend_if_inert()
{
while true
    do sleep 15
        xset dpms force on  # No black screen
        xset -dpms          # No black screen
        numlockx on         # Enabled numlock

        log_file="/tmp/suspend_if_inert.log"
        config_file="${HOME}/.suspend_if_inert.conf"

            if [ ! -e "${log_file}" ]; then
                touch "${log_file}"
                echo `date +'%d/%m/%Y - %T'` | tee "${log_file}"
                #echo "PID of this script: $$" | tee -a "${log_file}"
            fi

            if [ ! -e "${config_file}" ]; then
                touch "${config_file}"
                echo '# The number must be greater than 0' | tee "${config_file}"
                echo '# Set the screen lock minutes.' | tee -a "${config_file}"
                echo 'Lockscreen = 0' | tee -a "${config_file}"
                echo '# Set the system sleep minutes.' | tee -a "${config_file}"
                echo 'Suspend = 0' | tee -a "${config_file}"
            fi

        idle=`xprintidle`
        lockscreen_minutes=`cat ~/.suspend_if_inert.conf | head -3 | tail -1 | sed '/^$/d' | cut -f2 -d'=' | sed '/^$/d'`
        lockscreen_milliseconds=`echo "$(((${lockscreen_minutes}*60)*1000))"`
        suspend_minutes=`cat ~/.suspend_if_inert.conf | head -5 | tail -1 | sed '/^$/d' | cut -f2 -d'=' | sed '/^$/d'`
        suspend_milliseconds=`echo "$(((${suspend_minutes}*60)*1000))"`


        _var_update()
        {
            pid_xscrsaver=`pidof xscreensaver`
            pid_xscrsaver_gfx=`pidof xscreensaver-gfx`
            pid_slimlock=`pidof slimlock`
        }

        if [ ${lockscreen_minutes} -gt 0 ]; then
            if [ "${idle}" -gt "${lockscreen_milliseconds}" ]; then

                _var_update

                if [ -z "${pid_xscrsaver}" ] && [ -z "${pid_slimlock}" ]; then
                    pkill -9 xscreensaver;
                    xscreensaver-command -exit >/dev/null 2>&1;
                    xscreensaver -no-splash >/dev/null 2>&1 &
                fi

                _var_update

                if ([ -n "${pid_xscrsaver}" ] && [ -z "${pid_xscrsaver_gfx}" ]) && [ -z "${pid_slimlock}" ]; then
                    echo "Lockscreen at `date +'%T'`" | tee -a "${log_file}"
                    xscreensaver-command -lock >/dev/null 2>&1
                    sleep 4
                    xrefresh
                fi

                _var_update

                if [ -z "${pid_xscrsaver}" ] && [ -z "${pid_slimlock}" ]; then
                    echo "Lockscreen at `date +'%T'`" | tee -a "${log_file}"
                    slimlock >/dev/null 2>&1
                    xrefresh
                fi
            fi
        fi

        if [ ${suspend_minutes} -gt 0 ]; then
            if [ "${idle}" -gt "${suspend_milliseconds}" ]; then

                _var_update

                if ([ -n "${pid_xscrsaver_gfx}" ] || [ -n "${pid_slimlock}" ]) && [ "${idle}" -gt "${suspend_milliseconds}" ]; then
                    sleep 4
                    echo "Suspended at `date +'%T'`" | tee -a "${log_file}"
                    systemctl suspend
                fi
            fi

        fi
done
}

# this file is run when calling startx
# default arch init scripts
#if [ -d /etc/X11/xinit/xinitrc.d ]; then
#    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
#        [ -x "$f" ] && . "$f"
#    done
#fi

# user init scripts and settings
#[ -r /etc/X11/xinit/.Xmodmap ] && xmodmap /etc/X11/xinit/.Xmodmap
#[ -r ~/.Xmodmap ] && xmodmap ~/.Xmodmap
#[ -r ~/.Xresources ] && xrdb -merge ~/.Xresources
#[ -r ~/.xprofile ] && . ~/.xprofile

####################################################################
########################## START SERVICES ##########################
(systemd-analyze blame > ~/.sysAnalyze) &

start_sound &

#/usr/lib/mate-settings-daemon/mate-settings-daemon &
random_wallpaper &
monitor_mode &
/usr/lib/notify-osd/notify-osd &
#/usr/lib/mate-notification-daemon/mate-notification-daemon &
exec transmission-gtk -m &

xrefresh
#/usr/bin/xfce4-clipman &
numlockx on &
#screen -S suspend_if_inert -d -m bash &
#screen -r suspend_if_inert -X stuff "suspend_if_inert" &
suspend_if_inert &
xrefresh
#~/.local/bin/barcomplete.sh &
xcompmgr &
#picom --experimental-backends --backend glx --xrender-sync-fence &

cursor_theme_fix &
battery_check &

persistent_pid

