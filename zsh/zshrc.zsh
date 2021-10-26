# Plugins
source $HOME/.zsh_plugins.sh

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

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt no_list_ambiguous

# History
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt sharehistory
setopt hist_expire_dups_first

# Enviroment
if [ "$PATHS" != "true" ]; then
    export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.npm-packages/bin"
    export PATHS="true"
fi

export EDITOR=nvim

# alias e="$EDITOR"
alias ls="ls --color"
alias ll="ls -alh"
alias :q="exit"
if (( $+commands[yay] )); then
    alias yay="LESS=SR yay"
fi
if (( $+commands[paru] )); then
    alias pa="paru"
fi
