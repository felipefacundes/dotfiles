#!/bin/bash
arg="$1"

## Install Cargo
curl https://sh.rustup.rs -sSf | sh


## Install playerctl
sudo pacman -Sy playerctl --needed --noconfirm
if [ "$arg" == "yes" ]; then
 sudo pacman -Sy otf-font-awesome --needed --noconfirm
fi

source "$HOME/.cargo/env"

## Install Module
cargo install waybar_media_display

echo -e "Waybar Media Display Module Installed.
Run waybar_media_display --help for options"
