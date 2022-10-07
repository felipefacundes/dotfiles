#!/bin/bash
picom_toggle="$HOME"/.picom-toggle
if [ ! -e "$picom_toggle" ]; then
    touch "$HOME"/.picom-toggle
    pkill -9 picom
    pkill -9 picom
    xrefresh
    #xcompmgr -c -r55 -F -f -D5 -C -o0.8
    #xcompmgr -c -C -r 5 -l -2 -t -2 -f -D 4
	nohup xcompmgr > "$HOME"/.picom-toggle &
else
    rm "$HOME"/.picom-toggle
    pkill -9 xcompmgr
    pkill -9 xcompmgr
    xrefresh
	picom --experimental-backends --backend glx --xrender-sync-fence &
fi
