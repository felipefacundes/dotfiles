#!/bin/bash

CPU_T=$(< /sys/devices/platform/coretemp.0/hwmon/hwmon4/temp2_input)

while true;
do xsetroot -name "Memoria $(free -m | grep '^Mem' | awk '{print "total: " $2 "MB usado: " $3"MB"}') | CPU $(top -bn 1 | grep -Fi '%Cpu' | tail -n 4 | gawk '{print $2 $3}' | tr -s '\n\:\,[:alpha:]' ' ') | $(expr "$CPU_T" / 1000)°C | Uptime: $(uptime | awk '{print $3}' | tr -d ',') | $(date +"%d-%m-%Y %H:%M:%S")" ; sleep 2 ;
done
