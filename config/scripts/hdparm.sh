#!/bin/bash
export device=sdb
green='\033[1;32m'
nc='\033[0m' # No Color
sudo su -c "
    hdparm -I /dev/${device}
    hdparm -Tt /dev/${device}
    echo
    echo
    echo -e 'Command: ${green}hdparm -a /dev/${device}${nc}'
    hdparm -a /dev/${device}
    hdparm -a254 /dev/${device}
    echo
    echo
    echo -e 'Command: ${green}hdparm -m /dev/${device}${nc}'
    hdparm -m /dev/${device}
    #hdparm -m16 /dev/${device}
    hdparm -m0 --yes-i-know-what-i-am-doing /dev/${device}
    echo
    echo
    echo -e 'Command: ${green}hdparm -M /dev/${device}${nc}'
    hdparm -M /dev/${device}
    hdparm -M 128 /dev/${device}
    echo
    echo
    echo -e 'Command: ${green}hdparm -W /dev/${device}${nc}'
    hdparm -W /dev/${device}
    echo
    echo
    echo -e 'Command: ${green}hdparm -B /dev/${device}${nc}'
    hdparm -B /dev/${device}
    hdparm -B254 /dev/${device}
    echo
    echo
    echo -e 'Command: ${green}hdparm -d0 /dev/${device}${nc}'
    hdparm -d0 /dev/${device}
    echo
    echo
    echo -e 'Command: ${green}hdparm -S /dev/${device}${nc}'
    hdparm -S /dev/${device}
    hdparm -S 0 /dev/${device}
    hdparm -Tt /dev/${device}
    hdparm -t --direct /dev/${device}
"
