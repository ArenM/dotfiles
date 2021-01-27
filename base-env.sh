#! /usr/bin/env sh

# Static Varibles
GLES3=true
GTK_THEME=Breeze
THEME=atelier-dune-light
RICE=false

# User Overrides
if [ -e env.sh ]; then
  source ./env.sh
fi

# Derived Varibles
if [ "$GLES3" = "true" ]; then
  TERMINAL="alacritty"
else
  TERMINAL="termite"
fi
