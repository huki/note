# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


# Put your fun stuff here.
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1='\[\e[37;1m\](\t)\[\e[36;1m\][\[\e[33;1m\]\u\[\e[35;1m\]@\[\e[32;1m\]\H \[\e[31;1m\]\W\[\e[30;1m\]$(__git_ps1 " =%s=")\[\e[36;1m\]]\[\e[34;1m\]\$ \[\e[37;1m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export EDITOR=vim
export LS_OPTIONS='--color=auto'
export JAVA_HOME=/usr/local/lib64/jdk8
eval "`dircolors`"
alias vi='vim'
alias sr='sudo shutdown -r now'
alias sd='sudo shutdown -h now'
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -alF --block-size=K'
alias la='ls $LS_OPTIONS -A'
alias l='ls $LS_OPTIONS -CF'
alias less='less -r'
alias rm='rm -f'
alias h='history'
alias hc='history -c'
alias lt='logout'
alias df='df -B M'
alias 7x='7z x'
alias 7a='7z a'
alias 7l='7z l'
alias ux='unrar x'
alias 7a='7z a'
alias dailyupdate='crew update && crew upgrade'
alias hwclock='hwclock --directisa'
#alias vi='LC_ALL=C vim'
#alias vim='vim --servername VIM'
#alias vimtab='vim --remote-tab'
alias man='LC_ALL=C man'
alias gitpush='git svn dcommit'
alias gitpull='git svn rebase'
alias dmesg='sudo dmesg'
alias ifconfig='sudo ifconfig'

source /home/chronos/user/.local/bin/git-completion.bash
source /home/chronos/user/.local/bin/git-prompt.sh

cd $HOME
# Sommelier environment variables + daemon
#set -a && source ~/.sommelier.env && set +a
#startsommelier
export GDK_PIXBUF_MODULEDIR=/usr/local/lib64/gdk-pixbuf-2.0/2.10.0/loaders
export GDK_PIXBUF_MODULE_FILE=/usr/local/lib64/gdk-pixbuf-2.0/2.10.0/loaders.cache
# XDG Base Directory Specification Environment Variables
# See https://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_DATA_HOME=/home/chronos/user/.local/share
export XDG_CONFIG_HOME=/home/chronos/user/.config
export XDG_DATA_DIRS=/usr/local/share
export XDG_CACHE_HOME=/home/chronos/user/.cache
export XDG_CONFIG_DIRS=/usr/local/etc/xdg
export XDG_RUNTIME_DIR=/var/run/chrome
