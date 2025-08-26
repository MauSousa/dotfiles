#!/usr/bin/env bash

# grimshot first options
save=' save'
copy=' copy'
copysave=' copysave'

screen=' screen'
active=' active'

# generate menu
choice=$(printf '%s\n' "$save" "$copy" "$copysave" | wofi --show=dmenu)
active=$(printf '%s\n' "$active" "$screen" | wofi --show=dmenu)

# Removes the emojis from the choice
choice=$(awk '{print $2}' <<< "$choice")
active=$(awk '{print $2}' <<< "$active")

# takes the screenshot
grimshot --notify "$choice" "$active" /home/mau/Pictures/Screenshots/$(date +'%F_%H_%M_%S.png')
# printf '%s\n' "$choice"
