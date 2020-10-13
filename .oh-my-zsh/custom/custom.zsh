OS="$(uname)"

if [[ "${OS}" != 'Darwin'  ]];then
  umask 0077
fi

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/bin:/usr/local/bin:$PATH"
fi

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
if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/opt/go/libexec/bin:$PATH"
fi

if [[ "${OS}" == 'Darwin' ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

export PIPENV_VENV_IN_PROJECT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export EDITOR=vim
export GRAPHVIZ_DOT="$(which dot)"

alias groot='cd $(git rev-parse --show-toplevel)'
unalias gb

eval "$(pyenv init -)"
eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C "$HOME/bin/nomad" nomad

case "$(uname -a)" in
  *microsoft*)
    export DISPLAY="$(cat /etc/resolv.conf | grep nameserver | awk '{print $2; exit;}'):0.0"
    export PULSE_SERVER=tcp:$(grep -m 1 nameserver /etc/resolv.conf | awk '{print $2}')
    ;;
esac


