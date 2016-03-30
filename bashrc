# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable color support of ls and also add handy aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias tree='tree -C'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

##############################
# Marcelor's custom settings #
##############################

export DJANGO_COLORS="dark;http_success=blue,bold"

alias curl='curl -s -w %{http_code}'

# Git stuff
export GIT_SSL_NO_VERIFY=true
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
# unstaged (*) and staged (+)
# If something is stashed then a '$' will be shown next to the branch name.

# Python stuff
export WORKON_HOME="$HOME/Code/Environments"
export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/Code/Environments"
export PIP_VIRTUALENV_BASE=$WORKON_HOME
export PIP_RESPECT_VIRTUALENV=true
export PYTHONSTARTUP=~/.pythonrc
source /usr/local/bin/virtualenvwrapper.sh

# Prompt
D=$'\e[1;37m'
PINK=$'\e[0;35m'
GREEN=$'\e[0;32m'
ORANGE=$'\e[0;33m'
# Black       0;30     Dark Gray     1;30
# Blue        0;34     Light Blue    1;34
# Green       0;32     Light Green   1;32
# Cyan        0;36     Light Cyan    1;36
# Red         0;31     Light Red     1;31
# Purple      0;35     Light Purple  1;35
# Brown       0;33     Yellow        1;33
# Light Gray  0;37     White         1;37

source ~/dotfiles/git_ps1
export PS1='${PINK}\u ${D}at ${ORANGE}\h ${D}in ${GREEN}\w $(__git_ps1)${D}\n$ '


export PATH=~/bin/:$PATH

# Start an HTTP server from a directory, optionally specifying the port
function server() {
    local port="8000"
    python -m SimpleHTTPServer "$port"
}

alias ls="ls -G"

export PGHOST=/tmp
export EDITOR=vim

alias c='pygmentize -O style=monokai -f console256 -g'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export CPATH=$CPATH:/usr/local/lib
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/include
