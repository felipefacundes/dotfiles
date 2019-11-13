# Path to your oh-my-bash installation.
export OSH=/home/$USER/.oh-my-bash

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-bash is loaded.
OSH_THEME="powerline"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_OSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $OSH/custom?
# OSH_CUSTOM=/path/to/new-custom-folder

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

source $OSH/oh-my-bash.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-bash libs,
# plugins, and themes. Aliases can be placed here, though oh-my-bash
# users are encouraged to define aliases within the OSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash

##################################################

export HISTFILESIZE=100000
export HISTSIZE=100000
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT="%F %T "
shopt -s histappend

# Terminal settings
shopt -s checkwinsize
#export PROMPT_COMMAND='history -a'
#export GITAWAREPROMPT=~/.bash/git-aware-prompt
#source $GITAWAREPROMPT/main.sh
export PS1="\[\e[32m\]\t \[$txtgrn\]\u\[$txtwht\]@\[$txtgrn\]\h \[$txtylw\]\w\[$txtrst\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n\$ "
#export PATH="$PATH:~/Library/Python/2.7/bin:$HOME/Library/Haskell/bin"
export PATH=$PATH:~/.local/bin
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export EDITOR=nvim
#export RBENV_ROOT=/usr/local/var/rbenv

# Aliases

alias ls="lsd"
alias cpi="cpupower frequency-info"
alias bi="cd ~/.local/bin"
alias cp="advcp -g"
alias reboot="/usr/bin/openrc-shutdown --reboot now"
alias shutdown="/usr/bin/openrc-shutdown --poweroff now"
alias matar="pkill -9 -u maria"
alias yd="youtube-dl -i"
alias a="sudo pacman -Syyuu"
alias limpawine="rm -rf ~/.local/share/applications/*wine*"
alias lwine="rm -rf ~/.local/share/applications/*wine*"
alias mwine="pkill -9 .exe; pkill -9 wine; pkill -9 wineserver"
alias twine="pkill -9 .exe; pkill -9 wine; pkill -9 wineserver"
alias all="pkill -9 -u facundes"
alias remover="rm ~/.local/share/applications/remover-*.desktop"
alias temp="sensors k10temp-pci-00c3 | grep --color -i temp1 | lolcat ; sensors amdgpu-pci-0100 | grep --color -i temp1 | lolcat"
alias reflect="sudo reflector -c Brazil --save /etc/pacman.d/mirrorlist-arch"
alias mirror="sudo reflector -c Brazil --save /etc/pacman.d/mirrorlist-arch"
#alias performance="sudo cpupower frequency-set -d 3.3G ; sudo cpupower frequency-set -u 3.3G ; sudo cpupower frequency-set -g performance"
alias performance="sudo cpupower frequency-set -u 3.3G ; sudo cpupower frequency-set -g performance"
alias pac_rec_ins="paclog-pkglist <(tail -100 /var/log/pacman.log  | grep -A 3 -i installed) ; \
echo ------------------------------------------------------------------------- \ 
echo 'paclog-pkglist <(tail -100 /var/log/pacman.log  | grep -A 3 -i installed)'"
alias pachis="xdg-open /var/log/pacman.log"

function xc() {
  xcode=`xcode-select -p | sed 's/\(.*\)\(Xcode.*\.app\).*/\2/'`
  find "$1" -name "*.xcodeproj" -maxdepth 1 | xargs -I file open -a $xcode "file"
}

DISABLE_UPDATE_PROMPT=true
DISABLE_AUTO_UPDATE=true

~/.make/neofetch/neofetch --cpu_temp
#sensors k10temp-pci-00c3 | grep --color -i temp1 | lolcat
#sensors amdgpu-pci-0100 | grep --color -i temp1 | lolcat

#complete -cf pacman
complete -abcdefgjksuv pacman
#complete -cf sudo
complete -abcdefgjksuv sudo

export vblank_mode=0
export __GL_SYNC_TO_VBLANK=0


