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
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-prompt   '' # Remove "Do you want to see X possibility"
zstyle ':completion:*' select-prompt '' # Remove "Do you want to see X possibility"

# USER COMPLETIONS #
{%@@ if profile == "fr-wolf" @@%}
source <(kubectl completion zsh)
{%@@ endif @@%}

# SOURCE KEYS #
eval "$(ssh-agent -s)"
{%@@ if profile == "fr-wolf" @@%}
ssh-add --apple-use-keychain ~/.ssh/id_rsa
{%@@ endif @@%}

# CONFIGS #
source $ZSH_CONFIG/keybinds
source $ZSH_CONFIG/paths
source $ZSH_CONFIG/aliases
{%@@ if profile == "fr-wolf" @@%}
source "$HOME/.zshenv"
{%@@ endif @@%}
source $ZSH_CONFIG/functions
source $ZSH_CONFIG/plugins
source $ZSH_CONFIG/arTTY
source $ZSH_CONFIG/cursor
source "$HOME/.cargo/env"

## Zsh Syntax Highlighting - Needs to be at end of .zshrc ##
if [[ ! -d $ZSH_PLUGINS/zsh-syntax-highlighting ]]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting $ZSH_PLUGINS/zsh-syntax-highlighting
fi
source $ZSH_PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# DEFAULTS #
{%@@ if profile == "fr-wolf" @@%}
export BROWSER='/Applications/Firefox.app/Contents/MacOS/firefox'
{%@@ else @@%}
export BROWSER='firefox'
{%@@ endif @@%}
export MANPAGER='nvim --clean +Man!'
export MANWIDTH=999
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" ## https://stackoverflow.com/questions/18880024/start-ssh-agent-on-login
export ZVM_CURSOR_STYLE_ENABLED=false
export TERM=alacritty
setopt ignoreeof ## Ignore Ctrl-D, ie. eof

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi
