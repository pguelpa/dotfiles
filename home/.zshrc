# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew knife)

source $ZSH/oh-my-zsh.sh

export GOPATH=/Users/paul/Documents/go-lang

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export JAVA_HOME=$(/usr/libexec/java_home)

export EDITOR=vim
export DOCKER_HOST=127.0.0.1:4243
export FLEETCTL_TUNNEL=127.0.0.1:2222

alias gsu="git submodule update --init --recursive"
alias be="bundle exec"
alias bundle="nocorrect bundle"
alias gt="go test './...'"

alias git-clean="git branch --merged master | grep -v \"\* master\" | xargs -n 1 git branch -d"

alias sfleet="FLEETCTL_TUNNEL=coreos.platform.staging.posrip.com fleetctl"
alias pfleet="FLEETCTL_TUNNEL=... fleetctl"

cdpath=($GOPATH/src/github.com/shopkeep ~/Documents/Shopkeep ~/Documents/Projects)

[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
