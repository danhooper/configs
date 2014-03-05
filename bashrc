# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth
export HISTIGNORE="&:ls:[bf]g:exit"

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

source ~/.git-prompt.sh

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

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

alias rdesktop='rdesktop -g 1200x800'
alias ssh='ssh -A'
alias genpasswd='< /dev/urandom tr -dc [:graph:] | head -c12; echo'
encrypt_string() {
    echo $1 | openssl enc -base64 -e -aes-256-cbc -salt
}
decrypt_string() {
    echo $1 | openssl enc -base64 -d -aes-256-cbc -salt
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
export PYTHONSTARTUP=$HOME/.pythonstartup
alias grep='grep --color=auto'
alias l='ls -ltrF --color=auto'
hg_in_repo() {
    hg branch 2> /dev/null | awk '{print "on "}'
}

hg_branch() {
    hg branch 2> /dev/null | awk '{print " ["$1"]"}'
}

socks_proxy() {
    ssh -D 1080 -CN $1
}

if [ -e ~/.bashrc_extras ]; then
    . ~/.bashrc_extras
fi
TITLEBAR='\[\e]0;\u@\h \w\a\]'
#TITLEBAR="test"
RED="[\033[0;31m\]"
YELLOW="[\033[0;33m\]"
GREEN="[\033[0;32m\]"
function EXT_COLOR () { echo -ne "\033[38;5;$1m"; }
export LS_COLORS='di=38;5;108:fi=00:*svn-commit.tmp=31:ln=38;5;116:ex=38;5;186'
#PS1="$RED\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$GREEN\$ "
#export PS1='`EXT_COLOR 187`\u@\h`EXT_COLOR 174` \w \$\[\033[00m\] > '
PS1='\[\e]0;\u@\h \w\a\]\[`EXT_COLOR 187`\]\u@\h\[`EXT_COLOR 174`\]\w$(hg_branch)$(__git_ps1)\$\[\033[00m\] '
#export PS1='`EXT_COLOR 187`\u@\h`EXT_COLOR 174` \w \$\[\033[00m\] > '
if [ -d "$HOME/git/git-hooks" ] ; then
    export PATH=$PATH:$HOME/git/git-hooks
fi
