#!/bin/zsh

###########LABELS WINDOWS########
icons () {
var="$(ids_function)"
contador=$(echo $var |wc -l)
for (( i = 1;  i <= $contador; i++ )); do
    titulo=`xwinfo -n $(echo $var |sed -n $i'p')`
    programa=`xwinfo -c $(echo $var |sed -n $i'p')`
    case "$programa" in
        *XTerm*) icon="流";;
        *Termite*) icon="流";;
        *qutebrowser*) icon="";;
        *irefox*) icon="";;
        *Pulseaudio-equalizer*)icon= ;;
        *itrogen*) icon=;;
        *Subl*) icon=;;
        *Pamac-manager*) icon=;;
        *Steam) icon=;;
        *Manjaro*) icon=;;
        *Thunar) icon=;;
        *nm-connection-editor) icon=;;
        *Nvidia-settings) icon=;;
        *qt5ct) icon=;;
        *Lxappearance) icon=;;
        *color*) icon=;; 
        *Arandr) icon=;;
        *TelegramDesktop) icon=;;
        *Whatsie) icon=;;
        *smplayer*)icon=;;
        *mpv*) icon=;;
        *viewer) icon=;; 
        *Nm-connection-editor) icon=;;
        *Pavucontrol*) icon=;;
        *emo*) icon=;;
        *anger*) icon=;;
        *trike*) icon=;;
        *csgo*) icon=;;
        *SimpleScreen*) icon=;;
        *Spyder*) icon=;;
        *ython*) icon=;;
        *ibreoffice*) icon=;;
        *) icon=;;
    esac
    RESULTADO="$RESULTADO\n$(echo $var |sed -n $i'p') $icon $programa $titulo"
done
RESULT=$(echo $RESULTADO|grep '[[:digit:]]')
[[ -n $RESULT ]]&& echo $RESULT > /tmp/labels.txt |awk {'print $1'} > /tmp/ids.txt &&
sleep 0.5 &&
RESULTADO="" &&
modules||rm /tmp/ids.txt && modules
}
modules () {
qtw=$(wc -l < /tmp/ids.txt)
[[ -z $qtw ]]&& sed -i 's/modules-center = x.*/modules-center = x1/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 1 ]]&& sed -i 's/modules-center = x.*/modules-center = x1/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 2 && $qtw -gt 1 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 3 && $qtw -gt 2 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 4 && $qtw -gt 3 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 5 && $qtw -gt 4 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 6 && $qtw -gt 5 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 7 && $qtw -gt 6 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 8 && $qtw -gt 7 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 9 && $qtw -gt 8 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 10 && $qtw -gt 9 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 11 && $qtw -gt 10 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 12 && $qtw -gt 11 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 13 && $qtw -gt 12 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 14 && $qtw -gt 13 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 15 && $qtw -gt 14 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 16 && $qtw -gt 15 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 17 && $qtw -gt 16 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 18 && $qtw -gt 17 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 19 && $qtw -gt 18 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 20 && $qtw -gt 19 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 21 && $qtw -gt 20 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 22 && $qtw -gt 21 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
[[ $qtwold != $qtw && $qtw -le 23 && $qtw -gt 22 ]]&& sed -i 's/modules-center = x.*/modules-center = x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23/' $file && polybar-msg -p $(ps aux|grep "[p]olybar -r windows" |grep -v LAUNCH|awk {'print $2'}) cmd restart
qtwold=$qtw
direcionamento
}
titulos_function () {
listarray=($(bspc query -N))
contador=$(echo $listarray|wc -w)
for (( i = 1;  i <= $contador; i++ )); do
        xwinfo -n $listarray[$i]|grep -v "N/A"
done
}
ids_function () {
listarray=($(bspc query -N))
contador=$(echo $listarray|wc -w)
for (( x = 1;  x <= $contador; x++ )); do
    [[ "$(xwinfo -c $listarray[$x]|grep -v "N/A")" ]]&&
        echo $listarray[$x]
done
}
direcionamento () {
sleep 0.5
titulonew="$(titulos_function)"
idnew="$(ids_function)"
[[ "$idold" != "$idnew" ]]&& tituloold=$titulonew && idold=$idnew && icons ||\
        [[ "$tituloold" == "$titulonew" ]]&& tituloold=$titulonew && idold=$idnew && sleep 0.5 && direcionamento ||\
        tituloold=$titulonew && idold=$idnew && icons
}
###########FUNCOES BSPC########
foco () {
bspc node $(sed -n $linha'p' /tmp/ids.txt) -f
}
close () {
bspc node $(sed -n $linha'p' /tmp/ids.txt) -c
}
tiled () {
bspc node $(sed -n $linha'p' /tmp/ids.txt) -t tiled 
}
floating () {
bspc node $(sed -n $linha'p' /tmp/ids.txt) -t floating  
}
node_proximo_desktop () {
bspc node $(sed -n $linha'p' /tmp/ids.txt) -n next.local
}
qt_windows () {
wc -l < /tmp/ids.txt
}
label () {
echo "$(head /tmp/labels.txt |sed -n $linha'p'|awk {'print "%{T11}"$2" ""%{T1}"$4" "$5" "$6" "$7" ﬋  "'})"
}
###########LAUNCH POLYBAR########
launch () {
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
if [[ $(xrandr |grep -E "HDMI|conectado"|grep -v "desconectado") ]];then 
    nohup polybar -r dock & 
    nohup polybar -r windows & 
    # nohup polybar -c $config -r windowsx 2>/dev/null & 
    # nohup polybar -c $config -r dockx 2>/dev/null & 
else
    nohup polybar -c $config -r dock 2>/dev/null & 
    nohup polybar -c $config -r windows 2>/dev/null & 
fi
}
###########MONITOR PROCESSOS########
binarios () {
ps aux |\
ps aux|grep -E '[w]'q\ -c | .sh$
awk {'print $11" "$12" "$13" "$14" "$15,","$2,","$3,","$4'} |\
column -t -T 1,2,3,4 -O 1,2,3,4 -L -R 1 -o " | " -N "BINARIOS","PID","CPU","MEM" -s ","|\
sort -rk2
}
scripts () {
ps aux |\
grep ".sh$" |\
grep -v "grep .sh$" |\
awk {'print $11" "$12" "$13" "$14" "$15,","$2,","$3,","$4'} |\
column -t -T 1,2,3,4 -O 1,2,3,4 -L -R 1 -o " | " -N "BINARIOS","PID","CPU","MEM" -s ","|\
sort -rk2
}
process () {
ps auxScfw |\
grep -Ev "0.0  0.0|%CPU" |\
awk {'print $11 $12 $13 $14 $15,$2,$3,$4'} |\
#sed 's/\#\!\/bin\/shinicio()/\-/g'|\n\/shinicio()/\-/g'|\
column -t -T 1,2,3,4 -O 1,2,3,4 -L -R 1 -o " | " -N "BINARIOS","PID","CPU","MEM"|\
sort -rk2
}
monitor () {
while [[ true ]]; do
    echo "$(binarios)"
    sleep 3
    reset
done
}
###########REDE#########
rede () {
eth=enp
wifi=wlp
vpn=tun
A=$(ifconfig |awk {'print $1'}|grep ":" |grep -Ev "lo|enp")
contador=$(echo $A|wc -w)
    for (( i = 1; i <= $contador; i++ )); do
        case $(echo $A|sed -n $i'p'|sed 's/://g') in
            $eth*) line="";;
            $wifi*) line="";;
            $vpn*) line="";;
            $modem*) line="";;
            *) line="?"
        esac
        conexoes="$conexoes $line"
    done
echo $conexoes
}
###########UPTIME#########
uptime () {
echo "[1] poweroff"
echo "[2] reboot"
echo "[3] tty"
printf "OPÇÂO->__"
read op
case $op in
        1) poweroff;;
        2) reboot;;
        3) pkill -9 -U $USER;;
        *) exit;;
esac
$op
}
###########RELOGIO#########
relogio () {
hour=$(date +%H%M)
case `echo $hour |cut -c1` in
   1)h1="";; 
   2)h1="";;
   3)h1="";;
   4)h1="";;
   5)h1="";;
   6)h1="";;
   7)h1="";;
   8)h1="";;
   9)h1="";;
   0)h1="";;
esac
case `echo $hour |cut -c2` in
   1)h2="";; 
   2)h2="";;
   3)h2="";;
   4)h2="";;
   5)h2="";;
   6)h2="";;
   7)h2="";;
   8)h2="";;
   9)h2="";;
   0)h2="";;
esac
case `echo $hour |cut -c3` in
   1)m1="";; 
   2)m1="";;
   3)m1="";;
   4)m1="";;
   5)m1="";;
   6)m1="";;
   7)m1="";;
   8)m1="";;
   9)m1="";;
   0)m1="";;
esac
case `echo $hour |cut -c4` in
   1)m2="";; 
   2)m2="";;
   3)m2="";;
   4)m2="";;
   5)m2="";;
   6)m2="";;
   7)m2="";;
   8)m2="";;
   9)m2="";;
   0)m2="";;
esac
echo " $h1$h2:$m1$m2 "  
}
##############PROGRAMAS#################
csgo () {
nohup steam steam://rungameid/730 2>/dev/null &
}
###########MENU############
menu () {
less $HOME/.config/polybar/test.sh |grep -E "() {|###"|grep -Ev "awk|A=|ip=|#echo|\[\[|less" |sed 's/() {//g'
}
pidwid () {
echo "$(ps aux|grep '[w]'q\ -c|awk {'print $2'})"
}
restart () {
kill  $(ps aux|grep '[w]'q\ -c|awk {'print $2'})
}


if [[ -z $1 ]];then 
    cam=$HOME/.config/polybar
    config=$cam/config
    file=$cam/wid
    qtwold=0
    tituloold="$(titulos_function)"
    idold="$(ids_function)"
    sleep 0.5
    icons
else
    linha=$2
    $1
fi

