#!/bin/bash
#
# ~/.bashrc
#
stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # auto cd
HISTSIZE= HISTFILESIZE= # infinite history size

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$EUID" -ne 0 ]
	then export PS1="\[\e[34m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\$\[\e[m\] "

	else export PS1="\[\e[34m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\#\[\e[m\] "
fi

source .profile
