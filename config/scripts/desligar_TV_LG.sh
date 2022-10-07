#!/bin/bash
while true;
	do
    	Current_Volume=`
    	~/.local/bin/lgtv \
    	audio \
    	getStatus \
    	| grep -Ev '^[[:blank:]]*$' \
    	| tail -1 \
    	| sed 's|}||g' \
    	| sed 's|{||g' \
    	| sed 's|"||g' \
    	| cut -c 213-236 \
    	| cut -d':' -f 2
`

	if [[ ! -z "${Current_Volume}" ]]; then
		~/.local/bin/lgtv system turnOff
	else
		echo "TV is off"
	fi
	sleep 7
done

