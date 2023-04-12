#!/bin/zsh
#if [[ ! $DISPLAY && ${XDG_VTNR} == 1 ]]; then
#    exec startx
#fi
#
### KEYBOARD
export XKB_DEFAULT_LAYOUT=br
export XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle
# COLORS VARIABLES
. ~/.shell_utils/variables/colors_shell.sh
#export vblank_mode=0
#export __GL_SYNC_TO_VBLANK=0

if [[ "${XDG_SESSION_TYPE}" = tty ]]; then

export SSH_AUTH_SOCK
declare file=~/.zprofile
export wms_logs_dir="${HOME}/.WMs_logs_dir"
declare -i wms_logs_dir_size=`du "${wms_logs_dir}" | awk '{print $1}'`

if [ ! -d "${wms_logs_dir}" ]; then
    mkdir -p "${wms_logs_dir}"
fi
 
if [ "${wms_logs_dir_size}" -gt 4058308 ]; then
    find "${wms_logs_dir}" -type f \( -name "*.log" \) -size +100M -exec rm {} \; > /dev/null 2>&1 &
fi

# Systemd log
(systemd-analyze blame > ~/.sysAnalyze) > /dev/null 2>&1

[[ "$XDG_SESSION_TYPE" = "wayland" ]] && export MOZ_ENABLE_WAYLAND=1

# FIX XDG HOME DIRS
[[ ! -d ~/Pictures ]] && rm ~/.config/user-dirs.dirs && LANG=en xdg-user-dirs-update > /dev/null 2>&1

# function read
# automatically run startx when logging in on tty1

rm ~/.startx_log
touch ~/.startx_log
clear

local_count() {
    echo "${shell_color_palette[bgreen]}Exiting:${shell_color_palette[color_off]}"
    for i in {1..2}; do
        echo -n "${i}. "
        sleep 1
    done
    clear
}

theme_fix()
{

    [[ ! -s ~/.Xresources ]] && rm ~/.Xresources
    [[ ! -f ~/.Xresources ]] && wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/.Xresources -O ~/.Xresources
    
    [[ ! -d ~/.config/gtk-4.0/ ]] && mkdir -p ~/.config/gtk-4.0/
    [[ -d ~/.config/gtk-4.0/ ]] && cp -f ~/.config/gtk-3.0/settings.ini ~/.config/gtk-4.0/settings.ini

    while true; 
    do 
        export GTK_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
        export GTK2_RC_FILES="${HOME}/.gtkrc-2.0" #"${HOME}/.gtkrc-2.0:${XDG_CONFIG_HOME}/gtk-2.0/gtkrc:/etc/gtk-2.0/gtkrc"
        export GTK_THEME="$(grep 'gtk-theme-name' ${GTK_RC_FILES} | cut -d'=' -f2)"
        # ICON ...
        export XCURSOR_THEME="$(grep 'gtk-cursor-theme-name' ${GTK_RC_FILES} | cut -d'=' -f2)"
        export XCURSOR_SIZE="$(grep 'gtk-cursor-theme-size' ${GTK_RC_FILES} | cut -d'=' -f2)"

        export xresources_xcursor_theme="$(grep -i 'Xcursor.theme:' ~/.Xresources | cut -f2 -d':')"
        export xresources_xcursor_size="$(grep -i 'Xcursor.size:' ~/.Xresources | cut -f2 -d':' | sed '/^$/d')"

        if [ "${xresources_xcursor_theme}" != "${XCURSOR_THEME}" ] || [ "${xresources_xcursor_size}" != "${XCURSOR_SIZE}" ]; then
            sed -i "2 s#${xresources_xcursor_theme}# ${XCURSOR_THEME}#g" ~/.Xresources
            sed -i "3 s#${xresources_xcursor_size}# ${XCURSOR_SIZE}#g" ~/.Xresources
            xrdb ~/.Xresources > /dev/null 2>&1
            #xrdb -I$HOME ~/.Xresources > /dev/null 2>&1
            #xrdb -merge -I$HOME ~/.Xresources > /dev/null 2>&1
            xrdb -merge ~/.Xresources > /dev/null 2>&1
            xsetroot -cursor_name left_ptr > /dev/null 2>&1
        fi

        export gnome_schema="org.gnome.desktop.interface"
        export icon_theme="$(grep 'gtk-icon-theme-name' ${GTK_RC_FILES} | cut -d'=' -f2)"
        export font_name="$(grep 'gtk-font-name' ${GTK_RC_FILES} | cut -d'=' -f2)"
        gsettings set "${gnome_schema}" gtk-theme "${GTK_THEME}"
        gsettings set "${gnome_schema}" icon-theme "${icon_theme}"
        gsettings set "${gnome_schema}" cursor-theme "${XCURSOR_THEME}"
        gsettings set "${gnome_schema}" font-name "${font_name}"

        sleep 5
    done
}
theme_fix &

GTK_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-3.0/settings.ini"
GTK2_RC_FILES="${HOME}/.gtkrc-2.0" #"${HOME}/.gtkrc-2.0:${XDG_CONFIG_HOME}/gtk-2.0/gtkrc:/etc/gtk-2.0/gtkrc"
export GTK_THEME="$(grep 'gtk-theme-name' ${GTK_RC_FILES} | cut -d'=' -f2)"
# ICON ...
export XCURSOR_THEME="$(grep 'gtk-cursor-theme-name' ${GTK_RC_FILES} | cut -d'=' -f2)"
export XCURSOR_SIZE="$(grep 'gtk-cursor-theme-size' ${GTK_RC_FILES} | cut -d'=' -f2)"

wm_wayland() {

    export GTK_IM_MODULE=uim 
    export QT_IM_MODULE=uim 
    export XMODIFIERS=@im=uim 
    export XDG_CURRENT_DESKTOP="${wm_wayland}" 
    export WB_AUTOSTART_ENVIRONMENT=GNOME:KDE 
    export GDK_BACKEND=wayland 
    export QT_QPA_PLATFORM=wayland 
    export WLR_NO_HARDWARE_CURSORS=1 
    export MOZ_ENABLE_WAYLAND=1 
    #export MOZ_USE_XINPUT2=1   # causes crashes
    export XDG_SESSION_TYPE=wayland 
    #/usr/bin/dbus-daemon --session --address=unix:path=/tmp/dbus-session-socket &
    #export DBUS_SESSION_BUS_ADDRESS=unix:path=/tmp/dbus-session-socket

    # WM LOG OUTPUT
    echo -e "${wm_wayland} log - `date +'%d/%m/%Y - %T'`\n\
------------------------------------\n\n" >> "${wms_logs_dir}"/"${wm_wayland}_$(date +'%d-%m-%Y - %T')".log > /dev/null 2>&1

    exec "${wm_wayland}" "$@" >> "${wms_logs_dir}"/"${wm_wayland}_$(date +'%d-%m-%Y - %T')".log > /dev/null 2>&1

}

standard_wm() {
    standard_wm_conf="${HOME}/.standard_wm.conf"
    [[ ! -f "${standard_wm_conf}" ]] && touch "${standard_wm_conf}"

    if [ "${wm_wayland}" ]
    then
        echo 'protocol=1' | tee "${standard_wm_conf}" > /dev/null 2>&1
        echo -e "swm=${wm_wayland}" | tee -a "${standard_wm_conf}" > /dev/null 2>&1
    fi

    if [ "${start_wm}" ]
    then
        echo 'protocol=2' | tee "${standard_wm_conf}" > /dev/null 2>&1
        echo -e "swm=${start_wm}" | tee -a "${standard_wm_conf}" > /dev/null 2>&1
    fi
}

echo -e "\n${shell_color_palette[byellow]}Choose an Option:\n"
echo -e "${shell_color_palette[bpurple]}1 - Wayland"
echo -e "${shell_color_palette[bwhite]}2 - X11"
echo -e "${shell_color_palette[bcyan]}3 - Terminal${shell_color_palette[color_off]}"
echo
read option
echo

clear

case "$option" in
    "1")
        echo -e "\n${shell_color_palette[byellow]}Choose an Option:\n"
        echo -e "${shell_color_palette[bwhite]}0 - Wayfire - Wayland"
        echo -e "${shell_color_palette[bgreen]}1 - LabWC - Wayland"
        echo -e "${shell_color_palette[bcyan]}2 - Sway - Wayland${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[ipurple]}3 - Hyprland - Wayland${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[iyellow]}4 - Weston - Wayland${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[cyan]}5 - Hikari - Wayland${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[bred]}6 - Back Menu${shell_color_palette[color_off]}"
        echo
        read WM
        echo
            case "$WM" in
                "0")
                    wm_wayland='wayfire'
                    standard_wm
                    wm_wayland -d
                    local_count
                    exit
                ;;
                "1")
                    wm_wayland=labwc 
                    standard_wm
                    wm_wayland
                    local_count
                    exit
                ;;
                "2")
                    wm_wayland='sway'
                    standard_wm
                    wm_wayland --unsupported-gpu
                    local_count
                    exit
                ;;
                "3")
                    wm_wayland=Hyprland 
                    standard_wm
                    wm_wayland
                    local_count
                    exit
                ;;
                "4")
                    wm_wayland=weston 
                    standard_wm
                    wm_wayland
                    local_count
                    exit
                ;;
                "5")
                    wm_wayland=hikari 
                    standard_wm
                    wm_wayland
                    local_count
                    exit
                ;;        
                "6")
                    local_count
                    source "${file}"
                ;;
                *)
                    echo -e "${shell_color_palette[bred]}Wrong Option!${shell_color_palette[color_off]}"
                    local_count
                    source "${file}"
                ;;
            esac
    ;;
    "2")
        echo -e "\n${shell_color_palette[byellow]}Choose an Option:\n"
        echo -e "${shell_color_palette[bwhite]}0 - Fluxbox - X11"
        echo -e "${shell_color_palette[bgreen]}1 - Openbox - X11"
        echo -e "${shell_color_palette[byellow]}2 - JWM - X11${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[bcyan]}3 - PekWM - X11${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[ipurple]}4 - Awesome - X11${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[iyellow]}5 - BlackBox - X11${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[cyan]}6 - i3WM - X11${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[iwhite]}7 - BSPWM - X11${shell_color_palette[color_off]}"
        echo -e "${shell_color_palette[bred]}8 - Back Menu${shell_color_palette[color_off]}"
        echo
        read WM
        echo
            case "$WM" in
                "0")
                    export start_wm='fluxbox'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "1")
                    export start_wm='openbox'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "2")
                    export start_wm='jwm'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "3")
                    export start_wm='pekwm'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "4")
                    export start_wm='awesome'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "5")
                    export start_wm='blackbox'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "6")
                    export start_wm='i3'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "7")
                    export start_wm='bspwm'
                    standard_wm
                    [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
                    local_count
                    exit
                ;;
                "8")
                    local_count
                    source "${file}"
                ;;
                *)
                    echo -e "${shell_color_palette[bred]}Wrong Option!${shell_color_palette[color_off]}"
                    local_count
                    source "${file}"
                ;;
            esac
    ;;
    "3")
        echo -e "${shell_color_palette[bgreen]}Welcome terminal!${shell_color_palette[color_off]}\n"
        zsh
        local_count
        source "${file}"
    ;;
    *)
        protocol=`cat ~/.standard_wm.conf | head -n1 | cut -f2 -d'='`
        swm=`cat ~/.standard_wm.conf | tail -n1 | cut -f2 -d'='`

        if [ "${protocol}" = 1 ]; then
            wm_wayland="${swm}"
            wm_wayland
            local_count
        elif [ "${protocol}" = 2 ]; then
            export start_wm="${swm}"
            [ $XDG_VTNR ] && exec startx >> ~/.startx_log > /dev/null 2>&1
            local_count
        else
            echo -e "${shell_color_palette[bred]}Wrong Option!${shell_color_palette[color_off]}"
            local_count
            source "${file}"
        fi
    ;;
esac

fi