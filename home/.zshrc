# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew knife)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export GOPATH=$HOME/Documents/go-lang
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR=vim
export DOCKER_HOST=tcp://127.0.0.1:4243
export FLEETCTL_TUNNEL=127.0.0.1:2222

alias gsu="git submodule update --init --recursive"
alias be="bundle exec"
alias bundle="nocorrect bundle"

alias git-clean="git branch --merged master | grep -v \"\* master\" | xargs -n 1 git branch -d"

alias sfleet="FLEETCTL_TUNNEL=coreos.platform.staging.posrip.com fleetctl"
alias pfleet="FLEETCTL_TUNNEL=coreos.platform.production.posrip.com fleetctl"

cdpath=($GOPATH/src/github.com/shopkeep $HOME/Documents/Shopkeep $HOME/Documents/Projects)

[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
