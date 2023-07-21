#!/bin/bash
# Using bash’s shopt builtin to manage Linux shell behavior
# The shopt builtin offers 53 settings that can alter how bash behaves. 
# Read this post and then refer to bash's man page to follow up on how these settings might work for you.
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# https://www.networkworld.com/article/3574960/using-bashs-shopt-builtin-to-manage-linux-shell-behavior.html

#set -x # Debug trace
#The set -o pipefail option is used in Bash to handle pipeline failures (chaining commands using the "|" operator) more accurately. Typically, 
#a pipeline returns the exit code of the last command executed in the pipeline. However, if an intermediate command fails, 
#theexit code is usually ignored and the pipeline is considered successful.
#Enabling set -o pipefail changes the default behavior. In this mode, the pipeline will return the exit code of the last command that failed 
#within the pipeline, instead of returning the exit code of the last executed command. This can be useful for detecting failuresin complex pipelines, 
#especially when dealing with data processing or task automation.
#set -o pipefail # Will cause the pipeline to return the exit code of the last failed command within the pipeline.
#set -e # Debug (Errors: exit) mode 'exit-on-error' or 'errexit'. Terminates execution immediately if any command returns a non-zero error code.
#set -u # Enables 'nounset' or 'unbound variables' mode. Generates an error if an uninitialized variable is referenced.
#set -f # Disable globstar. Disables wildcard expansion (globbing).
#set -efu
#set -eo pipefail

# shopt | column
#
## By enabling the globstar option, you can glob all matching files in this directory and all subdirectories:
## Example: for i in **/*.sh; do echo ${i}; done
## For allowing the Bash shell to expand globes (wildcards) across all matching files in directories and subdirectories
#########################################################################################################################
## Habilita a opção globstar, permitindo que o shell Bash expanda globos (wildcards) em todos os arquivos correspondentes 
## nos diretórios e subdiretórios.
shopt -s globstar

## If set, the extended pattern matching features described above (see Pattern Matching) are enabled.
###################################################################################################
## Habilita a opção extglob, que permite o uso de recursos avançados de correspondência de padrões, 
## como padrões de correspondência estendidos.
shopt -s extglob

## If set, minor errors in the spelling of a directory component in a cd command will be corrected. 
## The errors checked for are transposed characters, a missing character, and a character too many. 
## If a correction is found, the corrected path is printed, and the command proceeds. This option is only used by interactive shells.
#########################################################################################################################
## Habilita a opção cdspell, que corrige erros menores na digitação de nomes de diretórios ao usar o comando cd. 
## Por exemplo, se você digitar um diretório com caracteres transpostos, ausentes ou extras, o Bash tentará corrigi-lo 
## e executar o comando cd para o diretório corrigido.
shopt -s cdspell

## If set, Bash replaces directory names with the results of word expansion when performing filename completion.
## This changes the contents of the Readline editing buffer. If not set, Bash attempts to preserve what the user typed.
#########################################################################################################################
## Habilita a opção direxpand, que substitui nomes de diretórios pelos resultados da expansão de palavras durante 
## a conclusão de nomes de arquivos. Isso significa que, ao usar a conclusão de tabulação, o Bash substituirá nomes 
## de diretórios pelos caminhos completos correspondentes.
shopt -s direxpand

## If set, Bash attempts spelling correction on directory names during word completion if the directory name initially supplied does not exist.
##############################################################################################################################################
## Habilita a opção dirspell, que realiza correção ortográfica em nomes de diretórios durante a conclusão de tabulação, caso o nome do diretório 
## fornecido inicialmente não exista. O Bash tentará corrigir o nome do diretório e completá-lo corretamente.
shopt -s dirspell

## If set, a command name that is the name of a directory is executed as if it were the argument to the cd command. 
## This option is only used by interactive shells.
###################################################################################################################
## Habilita a opção autocd, permitindo que um nome de comando que corresponda a um diretório seja executado como se fosse o argumento 
## para o comando cd. Isso é útil para navegar diretamente para um diretório digitando seu nome no prompt de comando, em vez de precisar digitar 
## explicitamente o comando cd.
shopt -s autocd

## With this option enabled, matching wildcards will not be case sensitive. For example, *.txt will match files with a .txt extension, 
## regardless of case.
######################################################################################################################################
## Com essa opção habilitada, a correspondência de globos (wildcards) não será sensível a maiúsculas e minúsculas. Por exemplo, *.txt
## corresponderá a arquivos com extensão .txt, independentemente do uso de letras maiúsculas ou minúsculas.
shopt -s nocaseglob

# Enable history reediting and verification.
shopt -s histreedit

## This option causes the history to be displayed before each command is executed. After displaying the command history, 
## you have the option to edit or confirm the execution. This can help to avoid errors when running old commands from history.
######################################################################################################################################
## Essa opção faz com que o histórico seja exibido antes da execução de cada comando. Após exibir o comando do histórico, você tem a opção 
## de editar ou confirmar a execução. Isso pode ajudar a evitar erros ao executar comandos antigos do histórico.
shopt -s histverify 

## With this option enabled, the history will be stored in single-line format instead of the default multi-line format. This makes it easy 
## to search and manipulate history using tools like grep or scripts.
######################################################################################################################################
## Com essa opção ativada, o histórico será armazenado no formato de linha única, em vez do formato de várias linhas padrão. 
## Isso facilita a pesquisa e manipulação do histórico usando ferramentas como grep ou scripts.
#shopt -s lithist

## By enabling this option, the history will not store duplicate consecutive commands. This can help reduce the history size and preventrepeated 
## commands from taking up unnecessary space.
######################################################################################################################################
## Habilitando essa opção, o histórico não armazenará comandos consecutivos duplicados. 
## Isso pode ajudar a reduzir o tamanho do histórico e evitar que comandos repetidos ocupem espaço desnecessário.
shopt -s cmdhist

## With this option enabled, Bash will not complete empty commands when pressing the Tab key twice. This prevents Bash from listing 
## all available commands when no commands have been entered.
######################################################################################################################################
## Com essa opção ativada, o Bash não completará comandos vazios ao pressionar a tecla Tab duas vezes. 
## Isso evita que o Bash liste todos os comandos disponíveis quando nenhum comando foi digitado
shopt -s no_empty_cmd_completion

#################################
######### SHELL UTILS ###########
[[ -f ~/.shell_utils/shell_utils.sh ]] && . ~/.shell_utils/shell_utils.sh
#################################

# Bash-it
[[ -f /usr/lib/bash-it-git/bash_it.sh ]] && . /usr/lib/bash-it-git/bash_it.sh

# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Oh My Bash Config
OMB_THEME=demula #"agnoster" #"pure" #"rr" #"mairan" #"rjorgenson" #"brainy" #"iterate" #"standard" #"demula" #"powerline-naked" #"powerline-multiline" #"90210" #"clean" #"dulcie" #"brunton" #"binaryanomaly" #"random" #"font" #"powerline" #"duru" #"vscode" #"candy" #"hawaii50" #"emperor" #"tylenol" #"morris" #"pzq" #"zitron" #"kitsune"
OMBC=~/.shell_utils/frameworks/oh-my-bash-config.sh && [[ -f "$OMBC" ]] && . "$OMBC"
if [[ "$OMB_THEME" == "agnoster" ]]; then
    prompt_theme_agnoster
fi

##### STARTUP
##### INPUTRC
if [ ! -f ~/.inputrc ]; then
    echo '$include /etc/inputrc' > ~/.inputrc
    echo 'set completion-ignore-case On' >> ~/.inputrc
    echo 'set show-all-if-ambiguous On' >> ~/.inputrc
    echo 'set show-all-if-unmodified On' >> ~/.inputrc
    echo 'set bell-style On' >> ~/.inputrc
    echo 'set colored-stats On' >> ~/.inputrc
    echo 'set colored-completion-prefix On' >> ~/.inputrc
    echo 'set menu-complete-display-prefix On' >> ~/.inputrc
    echo 'set mark-symlinked-directories On' >> ~/.inputrc
    echo 'set visible-stats On' >> ~/.inputrc
    echo 'set completion-query-items 50' >> ~/.inputrc
    echo 'set history-preserve-point On' >> ~/.inputrc
fi

# Force prompt to write history after every command.

shopt -s histappend
shopt -s checkwinsize

# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
###export HISTFILESIZE === 100000
###export HISTSIZE === 100000
# ---------------------
# Eternal bash history.
export HISTFILESIZE=
export HISTSIZE=
#export HISTIGNORE="&:?:*:ERR"
# Remove leading and trailing whitespace from history entries.
export HISTIGNORE=' *'
### ignoreboth:erasedups:ignorespace:ignoredups
export HISTCONTROL="ignoreboth:erasedups:cmdfail"
export HISTTIMEFORMAT="[%F %T] "
#export HISTTIMEFORMAT=
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_history

bash_shortcuts() {
    cat <<'EOF'
Ctrl+A: Moves the cursor to the beginning of the line.
Ctrl+E: Moves the cursor to the end of the line.
Ctrl+U: Clears the line before the cursor.
Ctrl+K: Clears the line after the cursor.
Ctrl+W: Deletes the previous word.
Ctrl+L: Clears the screen.
EOF
}

_bash_autocomplete() {
    local current_word words completions

    COMPREPLY=()
    current_word="${COMP_WORDS[COMP_CWORD]}"

    # Gets the list of possible commands
    words=$(echo ${COMP_WORDS[@]:1} | xargs -n1 echo | sort -u)

    # Completes the command if there is only one option
    if [ $(echo "$words" | wc -l) -eq 1 ]; then
        COMPREPLY=("$words")
        return
    fi

    # Gets the completion options for the current command
    completions=$(compgen -W "$words" -- "$current_word")

    COMPREPLY=($completions)
}

# Configure prompt behavior
_bash_prompt_command() {
    local exit_code="$?"

    # Run autocomplete command only when no completions are available
    if [ -z "$COMP_LINE" ]; then
        return
    fi

    # Configures the autocomplete function
    complete -F _bash_autocomplete

    # Clear current prompt
    PS1=""

    # Define your custom prompt here
    # Example: PS1="[\\u@\\h \\W]\\$ "
    export PS1="\[\e[32m\]\t \[$txtgrn\]\u\[$txtwht\]@\[$txtgrn\]\h \[$txtylw\]\w\[$txtrst\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n\$ "

    # Show prompt
    echo -ne "$PS1"
}

remove_timestamp_in_two_line_format_from_bash_history() {
    [[ ! -f "$HISTFILE" ]] && touch "$HISTFILE"
    [[ -f "$HISTFILE" ]] && sed -i '/^#/d' "$HISTFILE" >/dev/null 2>&1
}

remove_timestamp_in_single_line_format_from_bash_history() {
    [[ ! -f "$HISTFILE" ]] && touch "$HISTFILE"
    [[ -f "$HISTFILE" ]] && sed -i 's/^:[[:space:]][0-9]\{10\}:0;//g' "$HISTFILE" >/dev/null 2>&1
}

# https://www.baeldung.com/linux/history-remove-avoid-duplicates
remove_duplicate_commands_from_bash_history() {
    [[ ! -f "$HISTFILE" ]] && touch "$HISTFILE"
    local history_file="${HISTFILE}"
    local temp_file="${HISTFILE}.tmp"
    [[ -f "${temp_file}" ]] && rm -f "${temp_file}"

    # Filter duplicate commads
    awk '!a[$0]++' "$history_file" > "$temp_file"

    # Replace history
    mv -f "$temp_file" "$history_file" >/dev/null 2>&1
}

remove_unused_timestamps_from_bash_history() {
    [[ ! -f "$HISTFILE" ]] && touch "$HISTFILE"
    local history_file="${HISTFILE}"
    local temp_file="${HISTFILE}.tmp"
    [[ -f "${temp_file}" ]] && rm -f "${temp_file}"

    # Filter history lines with timestamps and associated commands
    awk '/^#[0-9]+$/ { if (getline c && c !~ /^#[0-9]+$/) { print $0 ORS c } } !/^#[0-9]+$/ { print }' "$history_file" > "$temp_file"

    # Replace history
    mv -f "$temp_file" "$history_file" >/dev/null 2>&1
}

include_timestamp_in_bash_history() {
    [[ ! -f "$HISTFILE" ]] && touch "$HISTFILE"
    local history_file="${HISTFILE}"
    local temp_file="${HISTFILE}.tmp"
    [[ -f "${temp_file}" ]] && rm -f "${temp_file}"

    # Filter history lines with timestamps and associated commands
    awk '/^#[0-9]+$/ { if (getline c && c !~ /^#[0-9]+$/) { print $0 ORS c } } !/^#[0-9]+$/ { print strftime("#%s") ORS $0 }' "$history_file" > "$temp_file"

    # Replace history
    mv -f "$temp_file" "$history_file" >/dev/null 2>&1
}

# Fix several known issues of bash history, and amazingly, it is able to convert .zsh_history to standard .bash_history structure
fix_bash_history() {
    remove_timestamp_in_single_line_format_from_bash_history
    remove_duplicate_commands_from_bash_history
    remove_unused_timestamps_from_bash_history
    include_timestamp_in_bash_history

    #history -r # Reload history conflicts with: remove_failed_commands_from_bash_history_and_fix_bash_history
    #history -s # Waning, no use!
    #history -w # Recording history conflicts with some of these functions
}

# Only works in PROMPT_COMMAND= or trap 'function' DEBUG
remove_failed_commands_from_bash_history_and_fix_bash_history() {
    if [ $? -ne 0 ]; then
        #history -d $(($HISTCMD-1))  # Remove last command from history
        history -r # Reload history conflicts with delete: history -d $(($HISTCMD-1))
        #history -s; history -w  # Writing to the file can be a problem, it's best to just reload the history, which will prevent the wrong command from being written
    elif grep -qE "^:[[:space:]]?[0-9]{10}:0;" "${HISTFILE}" >/dev/null 2>&1
        then
        fix_bash_history; history -r
    elif ! awk '/^#[0-9]+$/{ if (getline c && c !~ /^#[0-9]+$/) { print $0 ORS c } } !/^#[0-9]+$/{ exit 1 }' "${HISTFILE}" >/dev/null 2>&1
        then
        fix_bash_history; history -r
    fi
}

# Configure navigation keys
bind '"\t":menu-complete'            # TAB
bind '"\e[Z":menu-complete-backward' # Shift + TAB

# jump to next/previous word in a commandline by pressing SHIFT+RIGHT and SHIFT+LEFT
bind '"\e[1;2C":menu-complete'          # Shift + Right
bind '"\e[1;2D":menu-complete-backward' # Shift + Left

bind '"\e[1;5A":forward-word'   # Ctrl + Up
bind '"\e[1;5B":backward-word'  # Ctrl + Down

complete -abcdefgjksuv sudo
complete -abcdefgjksuv doas

# Configure command prompt
fix_bash_history
trap 'remove_failed_commands_from_bash_history_and_fix_bash_history' DEBUG
#export PROMPT_COMMAND="remove_failed_commands_from_bash_history_and_fix_bash_history; fix_bash_history; _bash_prompt_command"
export PROMPT_COMMAND="_bash_prompt_command"
###export GITAWAREPROMPT=~/.bash/git-aware-prompt
###source $GITAWAREPROMPT/main.sh
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

############################################################################

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
# mamba_setup # Uncomment this line

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# conda_setup # Uncomment this line
