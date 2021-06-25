#! /usr/bin/env sh

# Static Variables
GLES3=true
GTK_THEME=Breeze
THEME=atelier-dune-light
RICE=false

# Application Specific Customization
VIMWIKI=false

# Derived Variables
if [ "$GLES3" = "true" ]; then
  TERMINAL="alacritty"
else
  TERMINAL="termite"
fi

# User Overrides
if [ -e env.sh ]; then
  source ./env.sh
fi
