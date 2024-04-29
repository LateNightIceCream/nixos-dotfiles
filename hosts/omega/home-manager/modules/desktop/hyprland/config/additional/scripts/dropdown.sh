#!/usr/bin/env bash

# TODO: - fix next focus when hiding
#       - fix behaviour when window does not exist
#       - maybe make unclosable somehow?
#       - make fixed size (not resizable)
#       - make immovable
#       - fix animation

TOGGLE=/tmp/droptoggle
DROPTERM=kitty-dropdown

#notify-send "kitty dropdown toggle"

if [ -f "$TOGGLE" ]; then
    #Hide terminal and unpin
    # move 8 pixel up by default (corner rounding)
    # its a hack since we cant set the rounding on individual 
    # corners with hyprland
	rm $TOGGLE
	hyprctl --batch "dispatch movewindowpixel 0 292,$DROPTERM; dispatch pin $DROPTERM; dispatch cyclenext"
else
    #Show terminal and pin
    touch $TOGGLE
    hyprctl --batch "dispatch movewindowpixel 0 -292,$DROPTERM; dispatch pin $DROPTERM; dispatch focuswindow $DROPTERM"
fi
