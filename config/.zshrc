#!/bin/bash
export DISPLAY=:0
export TERM="xterm-256color"
export COLORTERM="truecolor"
export __NV_PRIME_RENDER_OFFLOAD=0
export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0
export EDITOR=vim
export VISUAL=vim
export PATH=$PATH:~/.local/bin:~/.local/share/gem/ruby/3.0.0/bin/

# Theme cursor fix
export cursor_theme=`cat ~/.config/gtk-3.0/settings.ini | sed -n 5p | cut -c 23-333`
export cursor_size=`cat ~/.config/gtk-3.0/settings.ini | sed -n 5p | cut -c 23-25`
xsetroot -cursor_name left_ptr
export XCURSOR_THEME="$cursor_name"
export XCURSOR_SIZE="$cursor_size"

########################################################################################################
##### ███╗   ███╗██╗   ██╗    ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
##### ████╗ ████║╚██╗ ██╔╝    ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
##### ██╔████╔██║ ╚████╔╝     █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
##### ██║╚██╔╝██║  ╚██╔╝      ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
##### ██║ ╚═╝ ██║   ██║       ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
##### ╚═╝     ╚═╝   ╚═╝       ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝
########################################################################################################
############################################# MY FUNCTIONS #############################################
. ~/.my_functions

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
ZSH_THEME="fino" # set by `omz`
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
DISABLE_UPDATE_PROMPT="true"

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

#########################################################
#####  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
##### ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
##### ███████║██║     ██║███████║███████╗█████╗  ███████╗
##### ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
##### ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
##### ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════
#########################################################
######################## ALIASES ########################
# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"

. ~/.my_aliases

############################################################################

# Autostart
#~/.make/neofetch/neofetch --size 00px --cpu_temp C --bold on --travis --underline_char  --separator  | lolcat
#--image_size none --crop_mode fill --w3m --source $HOME/Imagens/Wallpapers/gow.jpg

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rfacundes/micromamba/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rfacundes/micromamba/etc/profile.d/conda.sh" ]; then
        . "/home/rfacundes/micromamba/etc/profile.d/conda.sh"
    else
        export PATH="/home/rfacundes/micromamba/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

