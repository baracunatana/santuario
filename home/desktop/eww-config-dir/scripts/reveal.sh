#!/bin/sh

LOCK_FILE="$HOME/.cache/$1.lock"

on() {
    LOCK_FILE="$HOME/.cache/$1.lock"
    
    if [[ ! -f "$LOCK_FILE" ]]; then
	touch "$LOCK_FILE"
    fi

    sleep 0.5

    if [[ -f "$LOCK_FILE" ]]; then
	eww update $1=true
    fi
}

off() {
    if [[ -f "$LOCK_FILE" ]]; then
	rm "$LOCK_FILE" 
    fi
    eww update $1=false
}

if [[ "$2" == "--on" ]]; then
    on $1
else
    off $1
fi
