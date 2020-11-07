#!/bin/bash
export TERM="xterm-256color"
export COLORTERM="truecolor"
export EDITOR=vim
export VISUAL=vim

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# See https://github.com/Powerlevel9k/powerlevel9k
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE="nerdfont-complete"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="↱"
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="╭─"
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="↳"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="╰─"
#POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
#POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='deepskyblue1'
#POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='lightyellow'
#POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='black'
#POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='red'
#POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_FOREGROUND='lightgreen'
POWERLEVEL9K_DIR_HOME_BACKGROUND='brown'
#POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
#POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
#POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
#POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
#POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='lightred'
#POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'
POWERLEVEL9K_OS_ICON_FOREGROUND='blue'
POWERLEVEL9K_OS_ICON_BACKGROUND='brown'
POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND='brown'
POWERLEVEL9K_DISK_USAGE_NORMAL_BACKGROUND='yellow'
POWERLEVEL9K_TIME_FOREGROUND='green1'
POWERLEVEL9K_TIME_BACKGROUND='brown'
POWERLEVEL9K_TIME_FORMAT="%T"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
#POWERLEVEL9K_HOME_SUB_ICON=$'\UE18D ' # <-
#POWERLEVEL9K_HOME_ICON='  ﴂ 邏 ﳟ        調       '
POWERLEVEL9K_HOME_ICON='    '

# Lado Esquerdo
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
# Lado Direito
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status ssh root_indicator background_jobs virtualenv)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(history time)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(history archlinux)

source $ZSH/oh-my-zsh.sh
## Plugins section: Enable fish style features
# Use syntax highlighting
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Use history substring search
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
# Use autosuggestion
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#export EDITOR='vim'
# else
#export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

############################################################################################
# My Aliases
#
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ls="lsd"
# alias vim="echo 'não tem vim, então será aberto o neovim' ; sleep 1 ; nvim"
# alias nano="echo 'não tem nano, então será aberto o vim' ; sleep 1 ; vim"
#

alias shutdown="openrc-shutdown -p now"
alias all='pkill -9 -u "$USER"'
alias neofetch="~/.make/neofetch/neofetch"
alias cp="advcp -g" # Advanced copy
alias aur="yay -S --nodiffmenu --noeditmenu --noupgrademenu --mflags --skipinteg --noconfirm"
alias cpi="cpupower frequency-info"
alias bi="cd ~/.local/bin"
#alias reboot="/usr/bin/openrc-shutdown --reboot now"
alias shutdown="/usr/bin/openrc-shutdown --poweroff now ; systemctl poweroff -i"
alias des="/usr/bin/openrc-shutdown --poweroff now ; systemctl poweroff -i"
alias matar="pkill -9 -u maria"
alias yd="youtube-dl -i"
alias a="sudo pacman -Syyuu"
alias up="sudo pacman -Syyu"
alias s="echo source ~/.zshrc; source ~/.zshrc"
alias limpawine="rm -rf ~/.local/share/applications/*wine*"
alias lwine="rm -rf ~/.local/share/applications/*wine*"
alias rwine="rm -rf ~/.local/share/applications/*wine*"
alias remover="rm ~/.local/share/applications/remover-*.desktop"
alias mwine="ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs kill -9 $1 ; wineserver -k; wineserver -k9; pkill -9 .exe; pkill -9 Steam; pkill -9 steam; pkill -9 Epic; pkill -9 wine; pkill -9 wineserver; killall -9 wine wineserver; killall -9 .exe"
alias renicewine1="ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -2 -p $1 ; echo --- ; \
top -bn 1 | grep -Ei --color .exe ; echo --- ; echo 'ps ax|egrep “*\.exe“|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -2 -p “$ 1“'"
alias renicewine2="ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -3 -p $1 ; echo --- ; \
top -bn 1 | grep -Ei --color .exe ; echo --- ; echo 'ps ax|egrep “*\.exe“|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -3 -p “$ 1“'"
alias renicewine3="ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -5 -p $1 ; echo --- ; \
top -bn 1 | grep -Ei --color .exe ; echo --- ; echo 'ps ax|egrep “*\.exe“|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -5 -p “$ 1“'"
alias renicewine4="ps ax|egrep '*\.exe'|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -7 -p $1 ; echo --- ; \
top -bn 1 | grep -Ei --color .exe ; echo --- ; echo 'ps ax|egrep “*\.exe“|grep -v 'egrep'|awk '{print $1 }' | xargs sudo renice -n -7 -p “$ 1“'"
alias reniceuser1="sudo renice -n -2 -u $USER ; echo --- ; \
top -bn 1 | grep -Ei --color $USER ; echo --- ; echo 'sudo renice -n -2 -u $USER'"
alias reniceuser2="sudo renice -n -3 -u $USER ; echo --- ; \
top -bn 1 | grep -Ei --color $USER ; echo --- ; echo 'sudo renice -n -3 -u $USER'"
alias reniceuser3="sudo renice -n -5 -u $USER ; echo --- ; \
top -bn 1 | grep -Ei --color $USER ; echo --- ; echo 'sudo renice -n -5 -u $USER'"
alias reniceuser4="sudo renice -n -7 -u $USER ; echo --- ; \
top -bn 1 | grep -Ei --color $USER ; echo --- ; echo 'sudo renice -n -7 -u $USER'"
alias r1="renice -n -2 -u $USER ; echo --- ; \
top -bn 1 | grep -Ei --color $USER ; echo --- ; echo 'renice -n -2 -u $USER'"
alias r2="renice -n -3 -u $USER ; echo --- ; \
top -bn 1 | grep -Ei --color $USER ; echo --- ; echo 'renice -n -3 -u $USER'"
alias r3="renice -n -5 -u $USER ; echo --- ; \
top -bn 1 | grep -Ei --color $USER ; echo --- ; echo 'renice -n -5 -u $USER'"
alias all="pkill -9 -u $USER"
alias a="pkill -9 -u $USER"
alias temp="sensors k10temp-pci-00c3 | grep --color -i temp1 | lolcat ; sensors amdgpu-pci-0100 | grep --color -i temp1 | lolcat"
alias reflect="sudo reflector -c Brazil --save /etc/pacman.d/mirrorlist-arch"
alias mirror="sudo reflector -c Brazil --save /etc/pacman.d/mirrorlist-arch"
#alias performance="sudo cpupower frequency-set -d 3.3G ; sudo cpupower frequency-set -u 3.3G ; sudo cpupower frequency-set -g performance"
alias game="sudo cpupower frequency-set -u 3.3G ; sudo cpupower frequency-set -g performance ; echo --- ; \
echo 'sudo cpupower frequency-set -u 3.3G ; sudo cpupower frequency-set -g performance'"
alias performance="sudo cpupower frequency-set -u 3.3G ; sudo cpupower frequency-set -g performance ; echo --- ; \
echo 'sudo cpupower frequency-set -u 3.3G ; sudo cpupower frequency-set -g performance'"
alias pachis_ins="paclog-pkglist <(tail -100 /var/log/pacman.log | grep -A 3 -i installed) ; echo --- ; \
echo 'paclog-pkglist <(tail -100 /var/log/pacman.log | grep -A 3 -i installed)'"
alias pachis_ins2="paclog-pkglist <(tail -2000 /var/log/pacman.log | grep -A 3 -i 'pacman -S') ; echo --- ; \
echo 'paclog-pkglist <(tail -2000 /var/log/pacman.log | grep -A 3 -i 'pacman -S')'"
alias pachis_rem="paclog-pkglist <(tail -5000 /var/log/pacman.log | grep -A 100 -i 'pacman -Rcs') ; echo --- ; \
echo 'paclog-pkglist <(tail -5000 /var/log/pacman.log | grep -A 100 -i 'pacman -Rcs')'"
alias pachis="xdg-open /var/log/pacman.log"
alias listmonitor="xrandr --listmonitors ; echo --- ; echo xrandr --listmonitors"
alias monitorlist="xrandr --listmonitors ; echo --- ; echo xrandr --listmonitors"
alias brilho="xrandr --output HDMI-A-0 --brightness 0.8 ; echo --- ; echo xrandr --output HDMI-A-0 --brightness 0.8"
alias gamma="xgamma -gamma .90 ; echo --- ; echo xgamma -gamma .90"
alias gama="xgamma -gamma .90 ; echo --- ; echo xgamma -gamma .90"
alias blue='xgamma -bgamma 1.1 ; xgamma -rgamma .8 ; echo --- ; echo "xgamma -bgamma 1.1 ; xgamma -rgamma .8"'
alias gt='ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i $DISPLAY -f pulse -ac 2 -i default ~/Videos/Tela_$(date +%d-%m-%Y_%H:%M:%S).mkv ; echo --- ; echo "ffmpeg -video_size 1360x768 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i default ~/Videos/Tela_$(date +%d-%m-%Y_%H:%M:%S).mkv"'
alias gif="echo 'ffmpeg -i Tela_09-12-2019_14:40:57.mkv -filter_complex '[0:v] palettegen' palette.png ; ffmpeg -ss 00:00:26.00 -t 8 -r 23 -i Tela_09-12-2019_14:40:57.mkv -i palette.png -filter_complex '[0:v][1:v] paletteuse' -pix_fmt rgb24 -s 616x182 GuildWars2.gif'"
alias criargif="echo 'ffmpeg -i Tela_09-12-2019_14:40:57.mkv -filter_complex '[0:v] palettegen' palette.png ; ffmpeg -ss 00:00:26.00 -t 8 -r 23 -i Tela_09-12-2019_14:40:57.mkv -i palette.png -filter_complex '[0:v][1:v] paletteuse' -pix_fmt rgb24 -s 616x182 GuildWars2.gif'"
alias pip-upgrade-all="echo 'sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo pip install -U' ; sudo pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo pip install -U"
alias pip-upgrade-all-2="echo 'sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo pip install -U' ; sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 sudo pip install -U"
alias mute="pactl set-sink-mute 0 toggle ; pactl set-sink-mute 4 toggle"
alias volume="pactl set-sink-volume 0 "
alias vol="pactl set-sink-volume 0 "
alias ffp="ffplay2.8"
alias mi='tput setaf 6; echo -e "\nA imagem será convertida na resolução desejada.\nPorém, antes execute o comando "export resolution=XxY":\nComo exemplo será usada o padrão FullHD (1920x1080)\nLembrando que HD é 1280x720\n4k = 3840x2160\n8k fulldome = 8192×8192 (67.1 megapixels)\n"; tput setaf 3; echo "export resolution=1920x1080\n"; tput setaf 9; echo -e "Comando a ser executado:\n"; tput setaf 3; echo -e "convert -adaptive-resize $resolution -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0\n"; convert -adaptive-resize "$resolution" -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0'
alias rs='tput setaf 6; echo -e "\nA imagem será convertida na resolução desejada.\nPorém, antes execute o comando "export resolution=XxY":\nComo exemplo será usada o padrão FullHD (1920x1080)\nLembrando que HD é 1280x720\n4k = 3840x2160\n8k fulldome = 8192×8192 (67.1 megapixels)\n"; tput setaf 3; echo "export resolution=1920x1080\n"; tput setaf 9; echo -e "Comando a ser executado:\n"; tput setaf 3; echo -e "convert -adaptive-resize $resolution -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0\n"; convert -adaptive-resize "$resolution" -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0'
alias resize='tput setaf 6; echo -e "\nA imagem será convertida na resolução desejada.\nPorém, antes execute o comando "export resolution=XxY":\nComo exemplo será usada o padrão FullHD (1920x1080)\nLembrando que HD é 1280x720\n4k = 3840x2160\n8k fulldome = 8192×8192 (67.1 megapixels)\n"; tput setaf 3; echo "export resolution=1920x1080\n"; tput setaf 9; echo -e "Comando a ser executado:\n"; tput setaf 3; echo -e "convert -adaptive-resize $resolution -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0\n"; convert -adaptive-resize "$resolution" -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0'
alias 4k='tput setaf 6; echo -e "\nA imagem será convertida na resolução 4k\n"; tput setaf 9; echo -e "Comando a ser executado:\n"; tput setaf 3; echo -e "convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0\n"; convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0'
alias 4kj-m='convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0 *.[jJpP][nNpP][gG] -set filename:base "%[basename]" "%[filename:base]-4k.jpg"'
alias 4kp-m='convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0 *.[jJpP][nNpP][gG] -set filename:base "%[basename]" "%[filename:base]-4k.png"'
alias 4kw-m='convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+0 *.[jJpP][nNpP][gG] -set filename:base "%[basename]" "%[filename:base]-4k.webp"'
alias 4kj='tput setaf 6; echo -e "\nAs imagens serão convertidas na resolução 4k\n"; tput setaf 9; echo -e "Comando a ser executado:\n"; tput setaf 3; echo -e "for i in *.[jJpP][nNpP][gG]; do convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+01 '$i' '${i/.[jJpP][nNpP][gG]/-4k.jpg}'; rm '${i/}'; done\n"; for i in *.[jJpP][nNpP][gG]; do convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+01 $i ${i/.[jJpP][nNpP][gG]/-4k.jpg}; rm ${i/}; done'
alias 4kp='tput setaf 6; echo -e "\nAs imagens serão convertidas na resolução 4k\n"; tput setaf 9; echo -e "Comando a ser executado:\n"; tput setaf 3; echo -e "for i in *.[jJpP][nNpP][gG]; do convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+01 '$i' '${i/.[jJpP][nNpP][gG]/-4k.png}'; rm '${i/}'; done\n"; for i in *.[jJpP][nNpP][gG]; do convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+01 $i ${i/.[jJpP][nNpP][gG]/-4k.png}; rm ${i/}; done'
alias 4kw='tput setaf 6; echo -e "\nAs imagens serão convertidas na resolução 4k\n"; tput setaf 9; echo -e "Comando a ser executado:\n"; tput setaf 3; echo -e "for i in *.[jJpP][nNpP][gG]; do convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+01 '$i' '${i/.[jJpP][nNpP][gG]/-4k.webp}'; rm '${i/}'; done\n"; for i in *.[jJpP][nNpP][gG]; do convert -adaptive-resize 3840x2160 -contrast-stretch 0,3% -normalize -strip -type TrueColor -modulate 99,99 -colorspace sRGB -depth 16 -channel rgba -interlace Plane -gaussian-blur 0.05 -density 300 -strip +repage -deskew 40% -fuzz 50% -quality 100% -unsharp 2x2.5+2.7+01 $i ${i/.[jJpP][nNpP][gG]/-4k.webp}; rm ${i/}; done'

alias vim-remove-space='tput setaf 11; echo -e "Comandos simples para remover espaços em branco indesejados\n-----------------------------------------------------------\nEm uma pesquisa, \s encontra um espaço em branco (um espaço ou uma guia) e \+ encontra uma ou mais ocorrências.\n\nO comando a seguir exclui qualquer espaço em branco no final de cada linha. Se nenhum espaço em branco for encontrado, nenhuma alteração ocorre e o esinalizador significa que nenhum erro é exibido.\n\n:%s/\s\+$//e\n\nO seguinte exclui qualquer espaço em branco inicial no início de cada linha.\n\n:%s/^\s\+//e\n\nMesma coisa (:le = :left = left-align alinhar à esquerda dado intervalo; % = todas as linhas):\n:%le\n\nCom o mapeamento a seguir, um usuário pode pressionar F5 para excluir todos os espaços em branco à direita. A variável _sé usada para salvar e restaurar o último registro de padrão de pesquisa (assim, da próxima vez que o usuário pressionar n, ele continuará sua última pesquisa) e :nohlé usada para desligar o realce da pesquisa (para que os espaços finais não sejam realçados enquanto o usuário digita). O esinalizador é usado no comando substitute para que nenhum erro seja mostrado se o espaço em branco final não for encontrado. Ao contrário de antes, o texto de substituição deve ser especificado para usar o sinalizador necessário.\n\n:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>\n\nSe você quiser remover todas as lihas em branco, use:\n\n:g/^\s*$/d\n\nSe quiser vírgulas. Assim: (:s///) em cada linha (%) para substituir todos (g) os espaços em branco contínuos (\s\+) por uma vírgula (,). Use:\n\n:%s/\s\+/,/g\n\nOutra maneira de fazer isso:\n\n:%s/\s\{1,}/,/gc\n\nAo converter um arquivo de texto com cabeçalhos e campos de texto com espaço. Use:\n\n:%s/\s\{2,}/,/g\n\nRemova espaços no meio da linha, e retire o excesso de tabulação:\n\n:%s/\([^ ]\+ \) \+/\1/g\n\nIsso pesquisará cada ocorrência que não tenha precedência em branco e substituirá o seguinte conjunto de espaços por apenas um espaço.\nIsso, no entanto, deixará um único espaço à direita nas linhas que tinham vários espaços à direita. Para corrigir isso, use o comando:\n\n:%s/ *$//"'

############################################################################################

# Autostart
#~/.make/neofetch/neofetch --size 00px --cpu_temp C --bold on --travis --underline_char  --separator  | lolcat
#--image_size none --crop_mode fill --w3m --source $HOME/Imagens/Wallpapers/gow.jpg
