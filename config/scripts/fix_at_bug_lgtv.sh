#!/bin/bash
Hour=23
Minutes=50
while true;
  do
    if [[ `date +%H` = "$Hour" ]] && (( `date +%M` >= "$Minutes" )); then
      echo "Fix 'at' command to turn off TV"
      eval $(atrm $(seq 999); at -f ~/.local/bin/at-lgtv.sh 23:59) &
    else
      echo "It is not time yet"
    fi
  sleep 30
done
