#!/bin/sh

# A dwm_bar function to read the battery level and status
# Joe Standring <git@joestandring.com>
# GNU GPLv3

dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$STATUS" = "Charging" ]; then
            printf " " 
        else
            printf " "
        fi
    else
        printf "BAT "
    fi
    if [ "$CHARGE" -lt "15" -a "$STATUS" != "Charging" ]; then
        COLOR_PREFIX="^c#FF0000^"
    elif [ "$CHARGE" -lt "45" -a "$STATUS" != "Charging" ]; then
        COLOR_PREFIX="^c#FF7F00^"
    else
        COLOR_PREFIX="^d^"
    fi
    printf "%s%s%% %s" "$COLOR_PREFIX" "$CHARGE" "$STATUS"
    printf "^d^%s\n" "$SEP2"
}

dwm_battery

