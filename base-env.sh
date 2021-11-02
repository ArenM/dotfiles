#! /usr/bin/env sh

# Themes
# GTK_THEME=Breeze-Dark
export GTK_THEME_LIGHT=Arc-Lighter
export GTK_THEME_DARK=Arc-Dark

# TODO: Deprecate THEME
# Other good base16 themes are 
#  - nord
#  - atelier-dune-light
#  - gruvbox-dark-medium
#  - oceanicnext
#  - solarized-light
#  - pop
export BASE16_THEME_LIGHT=atelier-plateau-light
export BASE16_THEME_DARK=atelier-plateau

# Eyecandy that wastes screen space
export RICE=false

# TERMINAL="alacritty"
export TERMINAL="foot"

# Application Specific Customization
# TODO: use -v and unset / set for these
export VIMWIKI=false
export NVIM_LUA=false
export ZSH_FEATURES=light
export SWAY_FULL_DESKTOP=false
