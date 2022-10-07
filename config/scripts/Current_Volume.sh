#!/bin/bash
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
