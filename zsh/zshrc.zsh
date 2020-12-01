# Plugins
source $HOME/.zsh_plugins.sh

# Prompt
eval $(starship init zsh)

# Interaction
autoload -Uz compinit
compinit -D

bindkey -v
bindkey "^[[A"    history-substring-search-up	# Up Arrow
bindkey "^[[B"    history-substring-search-down	# Down Arrow
bindkey "^[[1;5D" backward-word			# Crtl Left Arrow
bindkey "^[[1;5C" forward-word			# Crtl Right Arrow
bindkey "^[[H"    beginning-of-line		# Home
bindkey "^[[F"    end-of-line			# End

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt sharehistory
setopt hist_expire_dups_first

# Enviroment
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.npm-packages/bin"
export EDITOR=nvim

alias e="$EDITOR"
alias ls="ls --color"
alias ll="ls -alh"
