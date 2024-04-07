#!/bin/bash
#
# ~/.bashrc
#
stty -ixon # Disable ctrl-s and ctrl-q
shopt -s autocd # auto cd
set -o vi # Enable vim mode
HISTSIZE= HISTFILESIZE= # infinite history size

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ "$EUID" -ne 0 ]
	then export PS1="\[\e[34m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\$\[\e[m\] "

	else export PS1="\[\e[34m\][\[\e[m\]\[\e[31m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[35m\]\W\[\e[m\]\[\e[34m\]]\[\e[m\]\[\e[35m\]\#\[\e[m\] "
fi

# pactl get-sink-volume @DEFAULT_SINK@
# pactl set-sink-volume @DEFAULT_SINK@ 45%

osc7_cwd() {
    local strlen=${#PWD}
    local encoded=""
    local pos c o
    for (( pos=0; pos<strlen; pos++ )); do
        c=${PWD:$pos:1}
        case "$c" in
            [-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
            * ) printf -v o '%%%02X' "'${c}" ;;
        esac
        encoded+="${o}"
    done
    printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}
PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }osc7_cwd

source .profile
