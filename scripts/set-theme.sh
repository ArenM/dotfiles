DOTFILES_DIR="$HOME/dotfiles"
eval "$("$DOTFILES_DIR/eval-env.sh")"
# GTK_THEME_DARK=Arc-Dark
# GTK_THEME_LIGHT=Arc-Lighter

set_theme() {
    echo "setting gtk theme to $gtk_theme"
    echo "setting base16 theme to $base16_theme"
    gsettings set org.gnome.desktop.interface gtk-theme "$gtk_theme"
    # TODO: I think this should set the gtk dark style preference (when it's available)
    gsettings set org.gnome.desktop.interface color-scheme "$colorscheme"

    # set-theme-sway "$base16_theme"

    # Set waybar theme; install waybar config and hope it reloads
    # Set rebuild & reintall foot config
    # Set nvim theme; TODO this one is difficult
}

set_dark() {
    gtk_theme="$GTK_THEME_DARK"
    base16_theme="$BASE16_THEME_DARK"
    colorscheme="prefer-dark"

    set_theme

    # tell zsh to set the terminals theme to dark
    # killall -SIGUSR1 zsh
}

set_light() {
    gtk_theme="$GTK_THEME_LIGHT"
    base16_theme="$BASE16_THEME_LIGHT"
    colorscheme="default"

    set_theme

    # tell zsh to set the terminals theme to light
    # killall -SIGUSR2 zsh
}

case $1 in
    dark)
        set_dark
        ;;
    light)
        set_light
        ;;
esac
