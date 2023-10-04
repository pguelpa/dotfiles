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
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:~/.cargo/bin
export JAVA_HOME=$(/usr/libexec/java_home)
export EDITOR=vim

# Fi Specific path
export PATH=$PATH:~/gcc-arm-none-eabi-7-2018-q2-update/bin

alias gsu="git submodule update --init --recursive"
alias be="bundle exec"
alias bundle="nocorrect bundle"

alias git-clean="git branch --merged master | grep -v \"\* master\" | xargs -n 1 git branch -d"

function git-clean-squashed() {
  MAIN_BRANCH="${1:-main}"
  echo "Main Branch: $MAIN_BRANCH"
  git checkout -q $MAIN_BRANCH && git for-each-ref refs/heads/ "--format=%(refname:short)" | while read branch
  do
    mergeBase=$(git merge-base $MAIN_BRANCH $branch) && [[ $(git cherry $MAIN_BRANCH $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == '-'* ]] && git branch -D $branch
  done
}

docker-clean() {
  docker ps -a | grep 'Exited' | awk '{print $1}' | xargs docker rm;
  docker images | grep '<none>' | awk '{print $3}' | xargs docker rmi;
}

cdpath=($HOME/Documents/Projects)

export NVM_DIR="$HOME/.nvm"
source "/usr/local/opt/nvm/nvm.sh"

# Setup rbenv
eval "$(rbenv init -)"

# Use Homebrew's Python
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

export PATH=/Users/pguelpa/.local/bin/luna-studio:$PATH
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

ggrep() {
  find . -type d -name .git -maxdepth 2 | while read line; do
    (
      cd $line/..
      cwd=$(pwd)
      echo "$(tput setaf 2)$cwd$(tput sgr0)"
      git --no-pager grep "$@"
    )
  done
}

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/pguelpa/Documents/Code/analytics-backend/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/pguelpa/Documents/Code/analytics-backend/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/pguelpa/Documents/Code/analytics-backend/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/pguelpa/Documents/Code/analytics-backend/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/pguelpa/Documents/Code/analytics-backend/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/pguelpa/Documents/Code/analytics-backend/node_modules/tabtab/.completions/slss.zsh

