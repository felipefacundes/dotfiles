#!/bin/bash 
pavuc=`wmctrl -l | grep 'Controle de volume' | head -n 1 | awk '{print $1 }'`
if pidof pavucontrol; then
	wmctrl -ic "$pavuc"
else
	pavucontrol
fi
