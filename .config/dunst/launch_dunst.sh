#!/bin/sh

#        -lf/nf/cf color
#            Defines the foreground color for low, normal and critical notifications respectively.
#
#        -lb/nb/cb color
#            Defines the background color for low, normal and critical notifications respectively.
#
#        -lfr/nfr/cfr color
#            Defines the frame color for low, normal and critical notifications respectively.

[ -f "$HOME/.cache/wal/colors.sh" ] && . "$HOME/.cache/wal/colors.sh"

pidof dunst && killall dunst

DUNST_FILE=~/.config/dunst/dunstrc

# update dunst based on pywal colors.
sed -i '/background = /s/.*/    background = "'$color0'"/' $DUNST_FILE
sed -i '/foreground = /s/.*/    foreground = "'$color2'"/' $DUNST_FILE
sed -i '/frame_color = /s/.*/    frame_color = "'$color2'"/' $DUNST_FILE

dunst -config ~/.config/dunst/dunstrc > /dev/null 2>&1 &
