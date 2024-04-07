#!/usr/bin/env bash

function monitoradded() {
    monitor_id=$(hyprctl -j monitors | jq -r '.[] | "\(.id)|\(.name)"' | grep "$1" | cut -d'|' -f1)

    if [ "$monitor_id" == 1 ]; then
        hyprctl dispatch moveworkspacetomonitor "2 $monitor_id"
        hyprctl dispatch moveworkspacetomonitor "3 $monitor_id"
        hyprctl dispatch moveworkspacetomonitor "4 $monitor_id"
        hyprctl dispatch moveworkspacetomonitor "5 $monitor_id"
        hyprctl dispatch moveworkspacetomonitor "6 $monitor_id"
    fi

    if [ "$monitor_id" == 2 ]; then
        hyprctl dispatch moveworkspacetomonitor "7 $monitor_id"
        hyprctl dispatch moveworkspacetomonitor "8 $monitor_id"
        hyprctl dispatch moveworkspacetomonitor "9 $monitor_id"
        hyprctl dispatch moveworkspacetomonitor "10 $monitor_id"
    fi
}

function monitorremoved() {
    monitors_count=$(hyprctl -j monitors | jq -r '.[] | "\(.id)|\(.name)"' | wc -l)

    if [ "$monitors_count" == 1 ]; then
        hyprctl dispatch moveworkspacetomonitor "2 0"
        hyprctl dispatch moveworkspacetomonitor "3 0"
        hyprctl dispatch moveworkspacetomonitor "4 0"
        hyprctl dispatch moveworkspacetomonitor "5 0"
        hyprctl dispatch moveworkspacetomonitor "6 0"
    fi

    if [ "$monitors_count" == 2 ]; then
        hyprctl dispatch moveworkspacetomonitor "7 0"
        hyprctl dispatch moveworkspacetomonitor "8 0"
        hyprctl dispatch moveworkspacetomonitor "9 0"
        hyprctl dispatch moveworkspacetomonitor "10 0"
    fi
}

function handle() {
    name=$(echo "$1" | cut -d'>' -f1)
    value=$(echo "$1" | cut -d'>' -f3)

    case $name in
        monitoradded) monitoradded "$value";;
        monitorremoved) monitorremoved "$value";;
    esac
}

socat -U - UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
