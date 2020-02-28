#!/bin/bash

#lemonbar feed
curwin(){
	xtitle
}


#Show Uptime
uptime() {
      uptime=$(</proc/uptime)
      uptime=${uptime%%.*}

      seconds=$(( uptime%60 ))
      minutes=$(( uptime/60%60 ))
      hours=$(( uptime/60/60%24 ))
      days=$(( uptime/60/60/24 ))

echo "UpTime: $days:$hours:$minutes:$seconds"
}

#Show Ram usage
mem(){
  mem="$(awk '/^Mem/ {print $3}' <(free -m))"
  printf "%b" "\x04$mem\x01"

}

#Show Network
int(){
  host google.com>/dev/null &&
  printf "%b" "\x06ON\x01" || printf "%b" "\x03NO\x01"
}

#Show CPU load
cpu(){
  read cpu a b c previdle rest < /proc/stat
  prevtotal=$((a+b+c+previdle))
  sleep 0.5
  read cpu a b c idle rest < /proc/stat
  total=$((a+b+c+idle))
  cpu="$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))"
  printf "%b" "\x05$cpu%\x01"
}

#spacer
space() {

    echo " "

}

#Show time, date and clickable calendar
clock() {
    curtime=`date '+%I:%M'`
    curdate=`date '+%d-%m-%Y'`
    echo "%{A:/usr/bin/gsimplecal:}%{T2} %{T1}$curdate%{A} %{T2} %{T1}$curtime"
}



#show groups
groups() {
    cur=`xprop -root _NET_CURRENT_DESKTOP | awk '{print $3}'`
    tot=`xprop -root _NET_NUMBER_OF_DESKTOPS | awk '{print $3}'`

    for w in `seq 0 $((cur - 1))`; do line="${line} "; done
    line="${line} "
    for w in `seq $((cur + 2)) $tot`; do line="${line} "; done
    echo $line
}


pac(){
  pup="$(pacman -Qqu --dbpath /tmp/checkup-db-david/ | wc -l)"
  if (( pup > 0 )); then
    printf "%b" "\x05$pup\x01"
  else
    printf "0"
  fi
}


ups(){
  ups="$(wc -l < /tmp/aurupdates*)"
  if (( ups > 0 )); then
    printf "%b" "\x05$ups\x01"
  else
    printf "0"
  fi
}

aur(){
   aur="$(awk '$0 !~ /^No /' /tmp/aurphans* | wc -l)"
   if (( aur > 0 )); then
     printf "%b" "\x03 ∆\x01"
   fi
}




mpd() {
   nowplaying=`mpc | head -n 1`
    if [[ "$nowplaying" != volume* ]]
      then
        echo "%{A1:"mpc toggle":}%{A2:"mpc stop":}%{A3:"mpc random":}%{A4:"mpc next":}%{A5:"mpc prev":}%{T2} %{T1}$nowplaying%{A}%{A}%{A}%{A}%{A}  "
    fi
}
 This loop will fill a buffer with our infos, and output it to stdout.

while :; do

    echo "%{B#DDecf0f1}%{F#2c2c2c}%{T2}%{l}    $(groups)    %{T1}$(curwin) %{r}%{F#2C2C2C}$  $(uptime)  $(space)|$(space) PKG: $(pac) $(space)|$(space) AUR: $(ups)$(aur) $(space)|$(space)    NET: $(int)    $(space)|$(space)    CPU: $(cpu)    $(space)|$(space)    MEM: $(mem)     $(space)|$(space)     $(clock) %{A2}$(curwin)  "
    sleep .2

done
