#!/usr/bin/env sh


primary="Wired1"
wireguard="wg0"
connected_interface=$(nmcli con show --active | grep $wireguard)

connect() {
    nmcli connection up $wireguard
}

disconnect() {
    # Normally we should have a single connected interface but technically
    # there's nothing stopping us from having multiple active intgerfaces so
    # let's do this in a loop:
    nmcli connection down $wireguard
    nmcli connection up $primary
}

toggle() {
    if [[ $connected_interface ]]
    then
        disconnect
    else
        connect
    fi
}

print() {
    if [[ $connected_interface ]]
    then
        echo "%{F#02c084}"
    else
        echo "%{F#ed404c}"
    fi
}

case "$1" in
    --connect)
        connect
        ;;
    --disconnect)
        disconnect
        ;;
    --toggle)
        toggle
        ;;
    *)
        print
        ;;
esac
