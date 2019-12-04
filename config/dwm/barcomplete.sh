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
do xsetroot -name "奄:$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')%|♏ 𝐌:$(free -m | grep -Ei '^Mem' | awk '{print $2 "MB 𝐔:" $3"MB"}')|☳ 𝐂𝐏𝐔:$(top -bn 1 | grep -Ei '%Cpu' | tail -n 4 | gawk '{print $2 $3}' | tr -s '\n\:\,[:alpha:]' ' ')﨎:$(expr $(cat "$Tp") / 1000)°C|📦 𝐏𝐤𝐠𝐬:$(pacman -Qq | wc -l)|ﴻ 𝐔𝐩𝐭𝐢𝐦𝐞:$(uptime | awk '{print $3}' | tr -d ',')|⚡ :$(acpi -b | sed 's/.*[harging|unknown|ull], \([0-9]*\)%.*/\1/gi')%| $(date +"%d-%m-%Y %H:%M:%S")";
done


