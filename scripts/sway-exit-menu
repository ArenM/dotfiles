#!/usr/bin/env bash

function main {
    echo -en "\x00prompt\x1ftesting\n"

    echo "Suspend"
    echo "Poweroff"
    echo "Lock Screen"
    echo "Cancel"
}

if [ x"$@" = x"Cancel" ]
then
    exit 0
fi

if [ x"$@" = x"Suspend" ]
then
    (nohup swaylock -c 000000) &
    systemctl suspend
    exit 0
fi

if [ x"$@" = x"Lock Screen" ]
then
    swaylock -c 000000
    exit 0
fi

if [ x"$@" = x"Poweroff" ]
then
    swaylock -c 000000
    exit 0
fi

if [ "$@" ]
then
    main
    echo "What did you do?!"
else
    main
fi
