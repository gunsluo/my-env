#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

export ZSH=/Users/jerrylou/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

plugins=(git)
# Customize to your needs...
#
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

#include Z, yo
. ~/.oh-my-zsh/plugins/z/z.sh

function setproxy() {
    export {http,https,ftp}_proxy="http://localhost:8016"
}
function unsetproxy() {
    unset {http,https,ftp}_proxy
}

#export RABBITMQ_HOME=$HOME/serivce/rabbitmq_server-3.5.6
export GOROOT=$HOME/go
export GOPATH=$HOME/gopath
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$RABBITMQ_HOME/sbin

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

#autoload -U promptinit && promptinit
#prompt pure

#docker env
if [[ "$(docker-machine status dev)" = "Running" ]]
then
    eval "$(docker-machine env dev)"
    export NT_CONFIG_SERVICE_ADDR="localhost:8501,localhost:8502,localhost:8503"
fi

function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /*  ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}


function wkenv() {
    alias clustera='ssh -p 9010 root@192.168.0.3'
    alias clusterb='ssh -p 9020 root@192.168.0.3'
    alias clusterc='ssh -p 9030 root@192.168.0.3'
    alias deploy='ssh -p 9040 root@192.168.0.3'
    export WKE="Home"
}

function unwkenv() {
    alias clustera='ssh -p 9010 root@192.168.0.166'
    alias clusterb='ssh -p 9020 root@192.168.0.166'
    alias clusterc='ssh -p 9030 root@192.168.0.166'
    alias deploy='ssh -p 9040 root@192.168.0.166'
    export WKE="Office"
}

alias sshjyl='ssh jerrylou@120.27.95.46'

if [[ "$WKE" = "Home" ]]
then
    wkenv
else
    unwkenv
fi

# Load zsh-syntax-highlighting.
source ~/.oh-my-zsh/plugins/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#
# Load zsh-autosuggestions.
source ~/.oh-my-zsh/plugins/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
#

# Enable autosuggestions automatically.
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

bindkey '^F' autosuggest-accept
