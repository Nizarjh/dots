#!/bin/sh

exec 2>&1

while true; do
    CAP=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    if [ "$STATUS" = "Discharging" ] && [ "$CAP" -le 10 ]; then
        logger "Low battery ($CAP%) → hibernating"
        exec /usr/bin/ZZZ
    fi

    sleep 180
done
