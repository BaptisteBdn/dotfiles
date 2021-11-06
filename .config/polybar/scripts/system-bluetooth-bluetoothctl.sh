#!/bin/sh

bluetooth_print() {
    if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        is_connected=0
        for device in $devices_paired; do
            device_info=$(bluetoothctl info "$device")

            if echo "$device_info" | grep -q "Connected: yes"; then
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
                is_connected=1
                echo '%{F#02c084}'
            fi
        done

        if [ $is_connected == 0 ]; then
            echo '%{F#ed404c}'
        fi
    else
        echo '%{F#ed404c}'
    fi
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 1

        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >> /dev/null
        done
    else
        devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
