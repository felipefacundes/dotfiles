#!/bin/bash
while true
do
	tput setaf 2 
	figlet -f /usr/share/figlet/bigmono9.tlf "$(date +%T)"
	sleep 1 && clear
done
