#!/bin/sh

LOCK_FILE="$HOME/.cache/eww-calendar.lock"
EWW_BIN="$HOME/.local/bin/eww/eww"

run() {
    if [ "$1" -eq 0 ]; then
	eww open calendar_0
    else
	eww open calendar_1
    fi
}

close() {
    if [ "$1" -eq 0 ]; then
	eww close calendar_0
    else
	eww close calendar_1
    fi
}

if [[ ! -f "$LOCK_FILE" ]]; then
    touch "$LOCK_FILE"
    run $1 && echo "ok good!"
else
    close $1
    rm "$LOCK_FILE" && echo "closed"
fi
