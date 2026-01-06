#!/bin/bash

dbus-monitor "interface='org.freedesktop.Notifications',member='Notify'" 2>/dev/null | {
    while read -r line; do
        if [[ "$line" == *"member=Notify"* ]]; then
            # Read next 6 lines to get the strings
            for i in {1..6}; do
                read -r line
                if [[ "$line" =~ string\ \"(.*)\" ]]; then
                    text="${BASH_REMATCH[1]}"
                    case $i in
                        4) summary="$text" ;;
                        5) body="$text" ;;
                    esac
                fi
            done
            if [[ -n "$summary" ]]; then
                if [[ -n "$body" ]]; then
                    echo "$summary: $body" > /tmp/waybar-notify
                else
                    echo "$summary" > /tmp/waybar-notify
                fi
            fi
        fi
    done
}
