#!/usr/bin/env bash

# ----------------------------------------------------------------------
# Setup config variables and env
# ----------------------------------------------------------------------

# Allow users to optionally configure their waybar theme path and set the
# value if one doesn't exist. This runs each time a script is switched
# so it's important to check for previously set values.

if [ -z "$BASE16_SHELL_WAYBARCONF_PATH" ]; then
	BASE16_SHELL_WAYBARCONF_PATH="$HOME/.config/waybar/scheme.css"
fi

if [ -z "$BASE16_WAYBAR_THEME_PATH" ]; then
	BASE16_WAYBAR_THEME_PATH="$HOME/.config/base16-waybar/colors"
fi

# If base16-waybar path directory doesn't exist, stop hook
if [ ! -d "$BASE16_WAYBAR_THEME_PATH" ]; then
	return 2
fi

# ----------------------------------------------------------------------
# Execution
# ----------------------------------------------------------------------

# If base16-waybar is used, provide a file for base16-waybar to source
if [ -d "$BASE16_WAYBAR_THEME_PATH" ]; then
	# Set current theme name
	read -r current_theme_name <"$BASE16_SHELL_THEME_NAME_PATH"

	ln -sf "$BASE16_WAYBAR_THEME_PATH/base16-$current_theme_name.css" "$BASE16_SHELL_WAYBARCONF_PATH"
fi
