#!/bin/bash
Hour=00
Minutes=00
while true;
  do
    if [[ `date +%H` = "$Hour" ]] && (( `date +%M` >= "$Minutes" )); then
      echo "Fix 'at' command. Whithout 'at' command to turn off LGTV"
      ~/.local/bin/lgtv system turnOff
    else
      echo "It is not time yet"
    fi
  sleep 17
done
