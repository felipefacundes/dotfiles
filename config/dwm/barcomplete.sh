#!/bin/bash
# Licença: GPLv3
# Mantenedor: Felipe Facundes
# Faça o seu pedido de tutorial e GamePlay no nosso:
# 既 Grupo 調 Gamer do 切 Telegram 切: https://t.me/winehq_linux

# sudo find /sys -name "*temp*"
# AMD
Tp=/sys/class/hwmon/hwmon1/temp1_input
# Tp=/sys/devices/pci0000:00/0000:00:18.3/hwmon/hwmon1/temp1_input
# Tp=/sys/devices/pci0000:00/0000:00:02.0/0000:01:00.0/hwmon/hwmon0/temp1_input

# Intel
#Tp=/sys/class/hwmon/hwmon0/temp1_input
#Tp=/sys/devices/platform/coretemp.0/hwmon/hwmon4/temp2_input
#Tp=/sys/devices/virtual/thermal/thermal_zone2/hwmon4/temp1_input
Tp=/sys/devices/platform/coretemp.0/hwmon/hwmon3/temp1_input

while true;
do xsetroot -name "𝐃𝐖𝐌 $(NVIDIA=$(glxinfo -B | grep -i 'NVIDIA') ; if [ -e $NVIDIA ] ; then echo 🖳 ; else echo 🕹 ; fi) $(MUDO=$(pactl list sinks | grep -Ei sim | head -n 9) ; if [ -e $MUDO ] ; then echo $(FONE=$(pactl list sinks | grep -Ei 'Porta ativa: analog-output-headphones') ; if [ -e $FONE ] ; then echo 奄 ; else echo ☊ ; fi) ; else echo 婢 ; fi):$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')%|洛 𝐌:$(free -h | grep -Ei '^Mem' | awk '{print $2 " 𝐔:" $3}')|☳:$(cpupower frequency-info | grep -i asserted | cut -c 26-28)$(cpupower frequency-info | grep -i asserted | cut -c 30-33) $(top -bn 1 | grep -Ei '%Cpu' | tail -n 4 | gawk '{print $2 $3}' | tr -s '\n\:\,[:alpha:]' ' ')﨎:$(expr $(cat "$Tp") / 1000)°C|📦:$(pacman -Qq | wc -l)|蓼:$(df -h /home | grep -vE Sis | cut -c 41-43)|ﴻ:$(uptime | awk '{print $3}' | tr -d ',')|$(BAT=$(acpi -a | grep on-line) ; if [ -e $BAT ] ; then echo  ; else echo ⚡ ; fi):$(acpi -b | sed 's/.*[harging|unknown|ull], \([0-9]*\)%.*/\1/gi')%|🞼:$(expr $(expr $(cat /sys/class/backlight/intel_backlight/brightness) / 1210) + 1)%|🅰:$(xset q | grep -Ei 'Caps Lock:   on' | cut -c22-23)$(xset q | grep -Ei 'Caps Lock:   off' | cut -c22-24)| $(date +'%d-%m-%Y %H:%M:%S')";
done

# BAT=$(acpi -a | grep on-line) ; if [ -e $BAT ] ; then echo  ; else echo ⚡ ; fi
# $(acpi -a | grep on-line | cut -c12-13)
# retire o hashtag e verá o M  ♏

# retire o hashtag e verá o raio |  ⚡
