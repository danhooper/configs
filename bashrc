# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="&:ls:[bf]g:exit"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
shopt -s histappend
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

source ~/.git-prompt.sh

#if [ -e /usr/local/etc/bash_completion.d/gradle-completion.bash ]; then
#    source /usr/local/etc/bash_completion.d/gradle-completion.bash
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -G'

alias df='df -h'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias rdesktop='rdesktop -g 1200x800'
alias ssh='ssh -A'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export PYTHONSTARTUP=$HOME/.pythonstartup
alias grep='grep --color=auto'

socks_proxy() {
    ssh -D 1080 -CN $1
}

if [ -e ~/.bashrc_extras ]; then
    . ~/.bashrc_extras
fi
TITLEBAR='\[\e]0;\u@\h \w\a\]'
RED="[\033[0;31m\]"
YELLOW="[\033[0;33m\]"
GREEN="[\033[0;32m\]"
function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
PS1='\[\e]0;\u@\h \w\a\]\[`EXT_COLOR 187`\]\u@🏠  \[`EXT_COLOR 174`\]\w$(__git_ps1)\$\[\033[00m\] '
if [ -d "$HOME/git/git-hooks" ] ; then
    export PATH=$PATH:$HOME/git/git-hooks
fi

ssh-add-key() {
    eval `ssh-agent`
    ssh-add
}

if [ -e "$HOME/.bashrc_custom" ] ; then
    source $HOME/.bashrc_custom
fi
if [ -x "$(command -v brew)" ]; then
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
    fi
fi

if [ -e "$HOME/gsutil" ] ; then
    export PATH="$PATH:$HOME/gsutil"
fi

export JENV_ROOT=/usr/local/opt/jenv
if [ -x "$(command -v jenv)" ]; then
    eval "$(jenv init -)"
fi

function pcd_stop() {
    sudo kill -SIGSTOP $(pgrep parentalcontrolsd)
}

function odd_stop() {
    sudo kill -SIGSTOP $(pgrep opendirectoryd)
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

alias wag='grep -R --exclude-dir=node_modules --exclude-dir=bower_components --exclude-dir=dist --exclude-dir=lib --exclude-dir=icons --exclude-dir=coverage --exclude-dir=po --exclude=icons.html --exclude-dir=svg --exclude-dir=build/test-results'
export ANDROID_HOME=/usr/local/opt/android-sdk
alias gradleScrewStyle='./gradlew build -x check'

alias dockerAplcloud='eval $(docker-machine env aplcloud)'
alias cdockerSSH='docker-machine ssh hoopedc1docker -f -N -L2181:localhost:2181 -L5672:localhost:5672 -L15672:localhost:15672 -L9200:localhost:9200 -L9300:localhost:9300 -L61613:localhost:61613 -L:8600:localhost:8600 -L:8644:localhost:8644 -L:25434:localhost:25434'

alias devstart='docker-compose -f ~/git/cyprr/dev.docker-compose.yml up --build frontend backend nginx eventlistener'
alias infrastart='eval $(docker-machine env hoopedc1docker) && docker-compose -f ~/git/cyprr/dev.docker-compose.yml up elasticsearch rabbit'
alias devr='docker-compose -f ~/git/cyprr/dev.docker-compose.yml restart'
export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/JHUAPL-MS-Root-CA-05-21-2038-B64-text.cer
export GRADLE_OPTS=-Xmx512m

function killProcs() {
    kill `pgrep photoanalysisd`
    kill `pgrep CalendarAgent`
    kill `pgrep speechsynthesisd`
    kill `pgrep cloudphotosd`
}

# MOTD
function echo_color() {
  local color="$1"
  printf "${color}$2\033[0m\n"
}
echo_color "\033[0;90m" "c-f  Move forward"
echo_color "\033[0;90m" "c-b  Move backward"
echo_color "\033[0;90m" "c-p  Move up"
echo_color "\033[0;90m" "c-n  Move down"
echo_color "\033[0;90m" "c-a  Jump to beginning of line"
echo_color "\033[0;90m" "c-e  Jump to end of line"
echo_color "\033[0;90m" "c-d  Delete forward"
echo_color "\033[0;90m" "c-h  Delete backward"
echo_color "\033[0;90m" "c-k  Delete forward to end of line"
echo_color "\033[0;90m" "c-u  Delete entire line"
