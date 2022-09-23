#! /bin/sh
# shellcheck disable=SC2154 # shell_color_names uses variable defined by eval

DOTFILES_DIR="$HOME/dotfiles"

help() {
    if [ -n "$1" ]; then
        echo "$1"
    fi
    echo "Usage:"
    echo "  $0 <theme name>"
    echo "  $0 -l, --light"
    echo "  $0 -d, --dark"
    exit 1
}

case $1 in
    "-l"|"--light")
        eval "$("$DOTFILES_DIR/eval-env.sh")"
        theme=$BASE16_THEME_LIGHT
        ;;
    "-d"|"--dark")
        eval "$("$DOTFILES_DIR/eval-env.sh")"
        theme=$BASE16_THEME_DARK
        ;;
    "")
        help
        ;;
    *)
        theme="$1"
        ;;
esac

# Process the theme into a tab seperated list of colors
base16_colors() {
    theme_path="$HOME/.config/sway/base16-sway/themes/base16-$theme.config"
    sed -n 's/set \$\([^ ]*\) \(.*\)/\1\t\2/p' "$theme_path" 2> /dev/null
}

# Translate tsv of bas16 color name and hex value to tsv of shell color name and value
# TODO: this should be pre-generated
shell_color_names() {
    # TODO: this is really bad, unsafe
    eval "$(sed -e 's/\t#/=/')"

    # Normal colors
    echo "0	$base00" # Black
    echo "1	$base08" # Red
    echo "2	$base0B" # Green
    echo "3	$base0A" # Yellow
    echo "4	$base0D" # Blue
    echo "5	$base0E" # Magenta
    echo "6	$base0C" # Cyan
    echo "7	$base05" # White

    # Bright colors
    echo "8	$base03"
    echo "9	$base09"
    echo "10	$base01"
    echo "11	$base02"
    echo "12	$base04"
    echo "13	$base06"
    echo "14	$base0F"
    echo "15	$base07"

    # Extra settings
    echo "background	$base00"
    echo "foreground	$base05"
    echo "cursor	$base05"
}

reset_codes() {
    printf '\033]104\007'
    printf '\033]110\007'
    printf '\033]111\007'
    printf '\033]112\007'
}

colors=$(base16_colors "$1")
if [ -z "$colors" ]; then
    help "Unknown theme"
fi

echo "$colors" |\
    shell_color_names |\
    awk '$1 ~ /^[0-9]+$/ {printf "\033]4;%s;#%s\007", $1, tolower($2)}
         $1 == "foreground" {printf "\033]10;#%s\007", $2}
         $1 == "background" {printf "\033]11;#%s\007", $2}
         $1 == "cursor" {printf "\033]12;#%s\007", $2}'
