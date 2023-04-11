# base16-waybar

[base16][base16-home-link] template for [waybar][waybar-link].

This repository is meant to work with [base16][base16-home-link] from Tinted
Theming. It provides a hook and template that can be used dynamically load
base16 color schemes in waybar.

This project works alongside [base16-sway][base16-sway] and relies on the hook
function to send the message to Sway to reload its configuration file which in
turn will restart waybar.

## Installation

Clone the repository:

```text
git clone https://github.com/freddiehaddad/base16-waybar.git ~/.config/base16-waybar
```

Copy the hook to your base16-shell hooks directory:

```text
cp ~/.config/base16-waybar/hooks/10-waybar.sh ~/.config/base16-shell/hooks
```

Add to the top of your `style.css` file import to the color scheme:

```css
@import "scheme.css";
```

You can now reference the colors through the file:

```css
#waybar {
  background-color: @base00;
  border-bottom: 2px solid @base01;
  color: @base05;
}
```

In your sway configuration, configure waybar as follows:

```text
exec_always "kill $(pgrep waybar); waybar"

```

Re-run your base16 theme to execute the hook:

```text
base16_tokyo-night-dark
```

Verify the hook created the symbolic link to the correct template:

```text
~/.config/waybar/scheme.css ⇒ /home/.../.config/base16-waybar/colors/base16-tokyo-night-dark.css
```

## Other

[Original repo][github-waybar-repo-link]

[base16-home-link]: https://github.com/base16-project/home
[base16-sway]: https://github.com/freddiehaddad/base16-sway
[waybar-link]: https://github.com/Alexays/Waybar
[github-waybar-repo-link]: https://github.com/mnussbaum/base16-waybar
