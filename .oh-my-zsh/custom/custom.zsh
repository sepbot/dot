umask 0077

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

if [[ -d "$HOME/.nsc/bin" ]]; then
  export PATH="$HOME/.nsc/bin:$PATH"
fi

if [[ -d "$HOME/.cargo" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export GOPATH="$HOME/gopath"
export PATH="$GOPATH/bin:$PATH"

export PIPENV_VENV_IN_PROJECT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export EDITOR=vim
export GRAPHVIZ_DOT="$(which dot)"

alias grep="grep '--exclude-dir=*node_modules*' '--exclude-dir=*.venv*' '--exclude-dir=*.cache*' '--exclude-dir=*.parcel-cache*' '--exclude-dir=*dist*'"

alias groot='cd $(git rev-parse --show-toplevel)'
unalias gb

eval "$(pyenv init -)"
eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C "$HOME/bin/nomad" nomad

alias ide='nohup idea . > /dev/null 2>&1 &'

case "$(uname -a)" in
  *microsoft*)
    alias cls='tput clear'
    export LOCALHOST="$(ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1)"
    export HOST_MACHINE="$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}')"
    export DISPLAY="${HOST_MACHINE}:0.0"
    export PULSE_SERVER="tcp:${HOST_MACHINE}"

    /usr/bin/keychain --quiet --nogui $HOME/.ssh/id_rsa
    source $HOME/.keychain/$(hostname)-sh
    ssh-add $HOME/.ssh/id_rsa 2>/dev/null
    ;;
esac


