#! /bin/bash

help() {
    echo "Theme does not exist"
    echo "Usage: $0 <theme name>"
    exit 1
}

TEMPLATE_FILE="$HOME/.config/sway/colors.conf"
THEME_PATH="$HOME/.config/sway/base16-sway/themes/base16-$1.config"

# Process the template into a tab seperated list of colors
colors=$(sed -n 's/set \$\([^ ]*\) \(.*\)/\1\t\2/p' "$THEME_PATH" 2> /dev/null)
if [ -z "$colors" ]; then # TODO: check to make sure it's 16 long
    help
fi

echo "$colors" | sed -e 's/^/s\/$/' -e 's/\t/\//' -e 's/$/\/g/' |\
    sed -f - <(grep -v "^#" "$TEMPLATE_FILE") |\
    xargs -P 10 -I{} swaymsg -- {}
