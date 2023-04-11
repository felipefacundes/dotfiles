### [waybar](https://github.com/Alexays/Waybar)

#### Install using Git

If you are a git user, you can install the theme and keep up to date by cloning the repo:

    git clone https://github.com/dracula/waybar.git

#### Install manually

Download using the [GitHub .zip download](https://github.com/dracula/waybar/archive/master.zip) option and unzip them.

#### Activating theme

If you only want dracula color palette: 

1. `cp waybar/colors.css ~/.config/waybar/`
2. and in your style.css, add
```css
@import url("./colors.css");
/* example usage */
window#waybar {
background: @background;
color: @purple;
/* or cyan, green, orange, pink, red, yellow, foreground, background-darker etc. */
}
```

Or, if you want waybar to look exactly like the screenshot:

```bash
cp -rv waybar ~/.config/
```

Font is Iosevka, icons obsidian. Change `CITY` to your city/town/country in `~/.config/waybar/wittr.sh` if you want weather [documentation](https://wttr.in/:help) [source](https://github.com/chubin/wttr.in). Make adjustments in the config to your liking, ie. s/hyprland/sway/g. 

