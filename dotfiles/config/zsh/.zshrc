# Path to zsh files.
export ZSH="$HOME/.zsh"

# Path to zsh plugins.
export ZSH_PLUGINS="$HOME/.zsh/plugins"

# Path to zsh config files.
export ZSH_CONFIG="$HOME/.config/zsh"

autoload -Uz compinit
compinit

source $ZSH_CONFIG/p10k # Needs to be near top of file.
source $ZSH_CONFIG/plugins
source $ZSH_CONFIG/theme
source $ZSH_CONFIG/paths
source $ZSH_CONFIG/aliases
source $ZSH_CONFIG/functions

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# COMPLETIONS #
{%@@ if profile == "foundant-wolf" @@%}
source <(kubectl completion zsh)
source <(minikube completion zsh)
{%@@ endif @@%}

# KEYBINDS #
bindkey '^[[A' fzf-history-widget
bindkey '^[OA' fzf-history-widget

# COMMAND HISTORY #
touch $ZSH/.zsh_history
HISTFILE=$ZSH/.zsh_history
HISTSIZE=500000
SAVEHIST=500000
HISTTIMEFORMAT="[%F %T] "
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Remove "Do you want to see X possibility"
zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''
