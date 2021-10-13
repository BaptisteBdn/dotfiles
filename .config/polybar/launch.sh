#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Set colors according to those defined by wal
source "${HOME}/.cache/wal/colors.sh"
background=$color0
foreground=$color7
tertiary=$color2
fourth=$color4

polybar --reload main &
