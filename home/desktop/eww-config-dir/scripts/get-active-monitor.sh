#!/bin/sh

process() {
    inicial=$(echo $1 | cut -d '>' -f 1)
    if [[ "$inicial" == focusedmon ]]; then
	hyprctl monitors -j | jq '.[] | select(.focused) | .id'
    fi
}

hyprctl monitors -j | jq '.[] | select(.focused) | .id'

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do process "$line" ; done
