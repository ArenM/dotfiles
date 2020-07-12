# Configured Programs
 - alacritty / termite (depending on gles3 support, user configured)
 - earlyoom
 - gtk styles
 - neovim - needs to be migrated back to vim
 - rofi
 - sway
 - waybar
 - zsh


# Todo
Non Root: Remove requirement on root privileges to install user configuration files

Packages: Provide method to install packages, from a supported package manager or from install scripts
 - antibody (zsh)
 - fzf (for vim)

Remove linux-isms:
 - alias open=xdg-open
 - alias ls=ls --color

Configure language support for vim:
 - Have configuration (grains/pillars?) not tracked by git
 - Conditionally render parts of the vimrc, languageserver config, autocommands
