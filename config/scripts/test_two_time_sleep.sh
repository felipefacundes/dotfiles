#!/bin/bash
Hour=01
Minutes=04
Hour2=01
Minutes2=05
while true;
  do
    if [[ `date +%H` = "$Hour" ]] && [[ `date +%M` = "$Minutes" ]]; then
      echo "Test 01"
    elif [[ `date +%H` = "$Hour2" ]] && [[ `date +%M` = "$Minutes2" ]]; then
      echo "Test 02"
    else
      echo "It is not time yet"
    fi
  sleep 30
done
