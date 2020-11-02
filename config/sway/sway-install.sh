#!/bin/bash
mkdir -p ~/.config/sway
cd ~/.config/sway
rm -rf *
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/sway/config
mkdir -p ~/.config/waybar
cd ~/.config/waybar
rm -rf *
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/waybar/arrow-date-center-theme-transparent/config
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/waybar/arrow-date-center-theme-transparent/style.css
mkdir -p ~/.config/swaylock
cd ~/.config/swaylock
rm -rf *
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/swaylock/config
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/swaylock/ford_mustang_12-wallpaper-1920x1080.jpg
mkdir -p ~/.config/termite
cd ~/.config/termite
rm -rf *
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/termite/config
cd ~
rm -rf .Xdefaults
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/.Xdefaults
mkdir -p ~/.config/rofi
cd ~/.config/rofi
rm -rf *
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/rofi/rofimenu.sh
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/rofi/center.rasi
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/rofi/config
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/rofi/rofi-list.sh
mv rofimenu.sh rofimenu2.sh
mv rofi-list.sh rofimenu.sh
mv config config.bkp
chmod +x *.sh
mkdir -p ~/.config/rofi/sidebar
cd ~/.config/rofi/sidebar
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/rofi/sidebar/rofi.rasi
mkdir -p ~/.config/rofi/appmenu
cd ~/.config/rofi/appmenu
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/rofi/appmenu/drun.rasi
mkdir -p "/home/$USER/Imagens/Captura de Tela"
mkdir -p ~/Imagens/Wallpapers
cd ~/Imagens/Wallpapers
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/Wallpapers/Archlinux-lbdesign-arch-Linux-1333727-wallhere.com.jpg
wget -nc https://raw.githubusercontent.com/felipefacundes/dotfiles/master/config/swaylock/ford_mustang_12-wallpaper-1920x1080.jpg
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Vamos às Fontes especiais com íconizadas"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
mkdir -p ~/.fonts
cd ~/.fonts
rm -f *Hack*
rm -f Minhas_Fonts_2.tar.zst
#wget -nc "https://github.com/felipefacundes/dotfiles/blob/master/fonts/NerdFontHkNF.tar.xz?raw=true" -O NerdFontHkNF.tar.xz
wget -nc "https://github.com/felipefacundes/dotfiles/blob/master/config/fonts/Minhas_Fonts_2.tar.zst?raw=true" -O Minhas_Fonts_2.tar.zst
#tar -xf NerdFontHkNF.tar.xz
tar -xf Minhas_Fonts_2.tar.zst
rm -f Minhas_Fonts_2.tar.zst
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Configuração do Sway instalada"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Vamos instalar às depêndencias para ArchLinux ou derivados (Manjaro e etc...)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
sudo pacman -S sakura pavucontrol rofi jgmenu lxmenu-data awesome-terminal-fonts xorg-xkill nemo cinnamon-translations gtop htop xsensors gsimplecal cpupower grim mako slurp sway swaybg swaylock waybar wayland wayland-protocols wl-clipboard wlroots xorg-server-xwayland termite atool ffmpegthumbnailer highlight libcaca lynx mediainfo odt2txt perl-image-exiftool python-chardet ranger light networkmanager --noconfirm
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Criação de Felipe Facundes"
echo "Telegram: @FeFacundes"
echo "Acesse nosso grupo do Telegram:"
echo "https://t.me/winehq_linux"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
