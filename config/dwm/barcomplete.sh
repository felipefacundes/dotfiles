#!/bin/bash
# Licença: GPLv3
# Mantenedor: Felipe Facundes
# Faça o seu pedido de tutorial e GamePlay no nosso:
# 既 Grupo 調 Gamer do 切 Telegram 切: https://t.me/winehq_linux

# AMD
Tp=/sys/class/hwmon/hwmon1/temp1_input
# Tp=/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input
# Tp=/sys/devices/pci0000:00/0000:00:02.0/0000:01:00.0/hwmon/hwmon0/temp1_input

# Intel
# Tp=/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp2_input

while true;
do xsetroot -name "Mem:$(free -m | grep -Ei '^Mem' | awk '{print $2 "MB uso: " $3"MB"}')| CPU:$(top -bn 1 | grep -Ei '%Cpu' | tail -n 4 | gawk '{print $2 $3}' | tr -s '\n\:\,[:alpha:]' ' ')T:$(expr $(cat "$Tp") / 1000)°C| PKG's:$(pacman -Qq | wc -l)| Uptime:$(uptime | awk '{print $3}' | tr -d ',')| Bat:$(acpi -b | sed 's/.*[harging|unknown|ull], \([0-9]*\)%.*/\1/gi')%| $(date +"%d-%m-%Y %H:%M:%S")";
sleep 1;
done


