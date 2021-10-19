#!/usr/bin/env bash

# Sink list
sinks_name=$(pactl list sinks | grep -Po 'Description: \K.*')

sinks_index=$(pactl list sinks | grep -Po '(?<=Sink #).*')

# Format values n' what not
IFS=$'\n' s_n_db=($sinks_name)
s_n_size=${#s_n_db[@]}+1

IFS=$'\n' s_i_db=($sinks_index)
s_i_count=${#s_i_db[@]}

# Choose sink
ret_sink=$(printf '%s' "$sinks_name" | rofi -dmenu )

if [ -z $ret_sink ]; then
	exit 0
fi

# Get indexes of ret_prog and ret_sink in *_name_db
for (( i = 0; i < ${#s_n_db[@]}; i++ )); do
	if [ "${s_n_db[$i]}" = "${ret_sink}" ]; then
		index_sink=$i;
	fi
done

# Execute command
ret=$(pactl set-default-sink ${s_i_db[$index_sink]})
