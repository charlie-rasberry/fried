#!/bin/bash

NOTIFY_FILE="/tmp/waybar-notify"
SCROLL_WIDTH=50
SCROLL_PAUSE=3
SCROLL_SPEED=2

get_music() {
    if playerctl -p audacious status 2>/dev/null | grep -q "Playing\|Paused"; then
        artist=$(playerctl -p audacious metadata artist 2>/dev/null)
        title=$(playerctl -p audacious metadata title 2>/dev/null)
        if [[ -n "$title" ]]; then
            echo "${artist:+$artist - }$title"
        fi
    fi
}

get_display_text() {
    if [[ -f "$NOTIFY_FILE" ]]; then
        file_age=$(( $(date +%s) - $(stat -c %Y "$NOTIFY_FILE") ))
        if [[ $file_age -lt 30 ]]; then
            cat "$NOTIFY_FILE"
            return
        fi
    fi
    get_music
}

scroll_text() {
    local text="$1"
    local len=${#text}
    
    if [[ $len -le $SCROLL_WIDTH ]]; then
        echo "$text"
        return
    fi
    
    local cycle_length=$(( len + SCROLL_PAUSE ))
    local pos=$(( ($(date +%s%N | cut -c1-11) / 5) % cycle_length * SCROLL_SPEED % cycle_length ))
    
    if [[ $pos -ge $len ]]; then
        echo "${text:0:$SCROLL_WIDTH}"
    else
        local padded="$text    $text"
        echo "${padded:$pos:$SCROLL_WIDTH}"
    fi
}

text=$(get_display_text)
if [[ -n "$text" ]]; then
    scroll_text "$text"
fi
