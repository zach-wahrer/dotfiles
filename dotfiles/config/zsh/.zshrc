# PATHS #
export ZSH="$HOME/.zsh"
export ZSH_PLUGINS="$HOME/.zsh/plugins"
export ZSH_CONFIG="$HOME/.config/zsh"

# INSTANT PROMPT / THEME #
source $ZSH_CONFIG/p10k

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
setopt SHARE_HISTORY
setopt HIST_REDUCE_BLANKS

# COMPLETION #
zmodload zsh/complist
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' rehash true
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-prompt   '' # Remove "Do you want to see X possibility"
zstyle ':completion:*' select-prompt '' # Remove "Do you want to see X possibility"

# CONFIGS #
source $ZSH_CONFIG/keybinds
source $ZSH_CONFIG/paths
source $ZSH_CONFIG/aliases
source $ZSH_CONFIG/functions

# USER COMPLETIONS #
{%@@ if profile == "foundant-wolf" @@%}
source <(kubectl completion zsh)
source <(minikube completion zsh)
{%@@ endif @@%}

# DEFAULTS #
export BROWSER='firefox'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

## PLUGINS ##
source $ZSH_CONFIG/plugins
## Zsh Syntax Highlighting - Needs to be at end of .zshrc ##
if [[ ! -d $ZSH_PLUGINS/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_PLUGINS/zsh-syntax-highlighting
fi
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
