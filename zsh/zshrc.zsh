# Antibody
source <(antibody init)

# Plugins
antibody bundle < ~/.zsh_plugins

# Themes
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search compinit
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

compinit -D

[[ -n "${key[Up]}"   ]] && bindkey "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey "${key[Down]}" down-line-or-beginning-search

# Enviroment
export EDITOR=vim
alias open="xdg-open"
