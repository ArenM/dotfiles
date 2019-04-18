# Antibody
source <(antibody init)

# Plugins
antibody bundle < ~/.zsh_plugins

# Interaction
autoload -Uz compinit
compinit -D

bindkey "^[[A" history-substring-search-up # Up Arrow
bindkey "^[[B" history-substring-search-down # Down Arrow

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000
setopt sharehistory
setopt hist_expire_dups_first

# Enviroment
export EDITOR=vim
alias open="xdg-open"
