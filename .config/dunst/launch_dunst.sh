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

dunst -config ~/.config/dunst/dunstrc \
	-lb "${color0:-#F0F0F0}" \
	-nb "${color0:-#F0F0F0}" \
	-cb "${color0:-#F0F0F0}" \
	-lf "${color2:=#000000}" \
	-bf "${color2:=#000000}" \
	-cf "${color2:=#000000}" \
	-nf "${color2:=#000000}" \
	-lfr "${color2:=#000000}" \
	-nfr "${color2:=#000000}" \
	-cfr "${color2:=#000000}" > /dev/null 2>&1 &
