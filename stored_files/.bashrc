# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# This section adds additional directories to the $PATH.
export PATH=~/scripts:"$PATH"
export PATH=/mnt/ssd/repos/depot_tools:"$PATH"
export PATH=~/.local/bin:"$PATH"
export PATH=/usr/bin:"$PATH"

export EDITOR="vim"

# https://chromium.googlesource.com/chromiumos/docs/+/HEAD/developer_guide.md#verify-that-your-default-file-permissions-umask_setting-is-correct
umask 022

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Prevent the terminal from hanging when pressing Ctrl-S
[[ $- == *i* ]] && stty -ixon

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export TERM=xterm-256color
HOST=$(hostname)
PS1="\[\e[1;31m\]${debian_chroot:+($debian_chroot)}\[\e[m\]\[\e[0;32m\][\t]\[\e[m\]\[\e[1;30m\]$HOST:\w\n$\[\e[m\] "

# Updates Ctrl-R to use fzf.
which fzf > /dev/null && eval "$(fzf --bash)"

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Function definitions.
if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -f ~/.private_bashrc ]; then
    . ~/.private_bashrc
fi
