#!/bin/bash
clear -T "$TERM"
Check_HD()
{
    umount /dev/mapper/HD-HD_lv
    e2fsck -f -y /dev/mapper/HD-HD_lv
    e2fsck -p /dev/mapper/HD-HD_lv
    tune2fs -c 1 /dev/mapper/HD-HD_lv
    mount /dev/mapper/HD-HD_lv /home/rfacundes/Documentos/HD
    e4defrag -c /dev/mapper/HD-HD_lv
    e4defrag -c /home/rfacundes/Documentos/HD
    e4defrag -c /dev/mapper/rootvg-rootlv
    e4defrag -c /
}

sudo su -c '
Check_HD
Check_HD
'

tput setaf 2
cat <<'EOF'
###################
Comandos executados:
###################

umount /dev/mapper/HD-HD_lv
e2fsck -f -y /dev/mapper/HD-HD_lv
e2fsck -p /dev/mapper/HD-HD_lv
tune2fs -c 1 /dev/mapper/HD-HD_lv
mount /dev/mapper/HD-HD_lv /home/rfacundes/Documentos/HD
e4defrag -c /dev/mapper/HD-HD_lv
e4defrag -c /home/rfacundes/Documentos/HD
e4defrag -c /dev/mapper/rootvg-rootlv
e4defrag -c /

EOF
tput sgr0
