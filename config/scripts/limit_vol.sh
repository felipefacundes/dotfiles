#!/bin/bash
while true
	do vol=`pactl list sinks | \
	grep '^[[:space:]]Volume:' \
	| head -n $(( $SINK + 1 )) \
	| tail -n 1 \
	| sed -e 's,.* \([0-9][0-9]*\)%.*,\1,'`

	if (( "${vol}" > 100 )); then
		echo "${vol}"
		ponymix set-volume 100% 
		pactl set-sink-volume 0 100%
		pactl set-sink-volume 4 100%
	fi

	#sleep 0.1
done
