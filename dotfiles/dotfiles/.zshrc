# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## CHECK THAT PLUGINS FILES EXIST ##
## Auto Complete ##
# if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autocomplete ]]; then
#   git clone https://github.com/marlonrichert/zsh-autocomplete ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
# fi
# source ~/.oh-my-zsh/custom/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

## Zsh Vi Mode ##
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-vi-mode ]]; then
  git clone https://github.com/jeffreytse/zsh-vi-mode ~/.oh-my-zsh/custom/plugins/zsh-vi-mode
fi

## Zsh Autosuggestions ##
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
fi

## Docker Zsh Completions ##
if [[ ! -d ~/.oh-my-zsh/custom/plugins/docker-zsh-completion ]]; then
  git clone https://github.com/greymd/docker-zsh-completion ~/.oh-my-zsh/custom/plugins/docker-zsh-completion
fi

## Zsh Better NPM Completion ##
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion ]]; then
  git clone https://github.com/lukechilds/zsh-better-npm-completion ~/.oh-my-zsh/custom/plugins/zsh-better-npm-completion
fi

## Zsh Syntax Highlighting ##
if [[ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

## K (better ls) ##
if [[ ! -d ~/.oh-my-zsh/custom/plugins/k ]]; then
  git clone https://github.com/supercrabtree/k ~/.oh-my-zsh/custom/plugins/k
fi

## zoxide (better cd) ##
if ! [ -x "$(command -v zoxide)" ]; then
  curl -sS https://webinstall.dev/zoxide | bash
fi

## ccat (better cat) ##
# if ! [ -x "$(command -v ccat)" ]; then
#   go install github.com/owenthereal/ccat@latest
# fi

## Auto Pairs  ##
if [[ ! -d ~/.zsh-autopair ]]; then
  git clone https://github.com/hlissner/zsh-autopair ~/.zsh-autopair
fi
source ~/.zsh-autopair/autopair.zsh
autopair-init

## Diff So Fancy ##
if [[ ! -d ~/.diff-so-fancy ]]; then
  git clone https://github.com/so-fancy/diff-so-fancy ~/.diff-so-fancy
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="lukerandall"
 ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
 zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  aws
  terraform
  zsh-vi-mode
  zsh-autosuggestions
  docker-zsh-completion
  zsh-better-npm-completion
  zsh-syntax-highlighting
  k
  zoxide
  # zsh-autocomplete
)
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

# zstyle ':autocomplete:*' min-input 1
# zstyle ':autocomplete:*' widget-style menu-select # Tab through autocomplete entries
bindkey -M menuselect -s '^[' '^G^_' # Esc exits browsing history
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#61afef,bold,underline"
# .autocomplete.recent_paths.trim() {:} # Keep autocomplete logs clean

# User configuration
#

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# PATHS #
export PATH="$PATH:/usr/local/go/bin:$HOME/go/bin:$HOME/go/bin/golint:$HOME/.local/bin:$HOME:/go/src/platform/scripts/bin:/usr/local"
export PATH="$HOME/.diff-so-fancy:$PATH"
export PATH="$HOME/.deno/bin:$PATH"
export PATH="$HOME/lua-language-server/bin:$PATH"
export PATH="$HOME/scripts:$PATH"

# DOCKER #
alias dnuke='docker stop $(docker ps -aq) && docker rm $(docker ps -aq); drmi; dprune'
alias dstop='docker stop $(docker ps -q --filter "since=portainer")'
alias drmi='docker rmi $(docker images -a -q)'
alias dprune='yes | docker system prune; yes | docker volume prune'

# GIT #
alias gs='git status'
alias gru='git remote update'
alias grebase='git rebase -i origin/trunk'
alias gp='git push origin HEAD'
alias gcommit='git commit'
alias gpull='git pull'
alias gcount='git diff --stat ^HEAD'
alias gc='git checkout'
alias gct='git checkout trunk'
alias gb='git branch'
alias gclean='git branch --merged | grep - | xargs git branch -d'
alias gwa='git worktree add'
alias gwr='git worktree remove'
alias gwl='git worktree list'
alias gwp='git worktree prune -v'
# alias config='/usr/bin/git --git-dir=/home/zach/.cfg/ --work-tree=/home/zach'

# TESTS #
alias mt="make test"
alias mti="make test-integration"
alias mtf="cd web/frontend && npm run test:unit; cd ../../"
alias mtfi="cd web/frontend && npm run test-ci-unit; cd ../../"

# GLOBAL PROTECT #
alias gpon="globalprotect connect -p vpn.foundant.com"
alias gpoff="globalprotect disable"

# TERRAFORM #
alias tfpsd='terraform plan -var="aws_profile=service-deploy"'
alias tfasd='terraform apply -var="aws_profile=service-deploy"'

# GENERAL #
#alias pe="ksitty --session /home/zach/.config/kitty/ide.session -o allow_remote_control=yes --single-instance --listen-on unix:@mykitty"
alias cat="ccat"
alias ml="make local"
alias :q="exit"
alias zp="cd ~/go/src/platform"
alias za="cd ~/go/src/platform/accounting"
alias sc="staticcheck ./..."
alias c="go mod tidy; golangci-lint run; goreportcard-cli -v"
alias portainer="docker volume create portainer_data; docker run -d -p 9100:9000 --name=portainer --restart=unless-stopped -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce"
alias go="richgo"
. "$HOME/.cargo/env"

# GO #
alias gmt="go mod tidy"

# LUA #
alias luamake=/home/zach/Desktop/lua-language-server/3rd/luamake/luamake

# AWS #
alias awslocal="aws --endpoint-url=http://localhost:4566"

# FZF #
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# DOTDROP #
alias dotdrop='~/dotfiles/dotdrop.sh --cfg=~/dotfiles/config.yaml'

# COMPLETIONS #
source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Remove "Do you want to see X possibility"
zstyle ':completion:*' list-prompt   ''
zstyle ':completion:*' select-prompt ''

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

