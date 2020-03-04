OS="$(uname)"

export PATH="$HOME/bin:$PATH"

if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/bin:/usr/local/bin:$PATH"
fi

if [[ -d "$HOME/.cargo" ]]; then
  export PATH="HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

export GOPATH="$HOME/Workspace/go"
export PATH="$GOPATH/bin:$PATH"
if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/opt/go/libexec/bin:$PATH"
fi

if [[ "${OS}" == 'Darwin' ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
fi

export EDITOR=vim
export GRAPHVIZ_DOT="$(which dot)"

alias groot='cd $(git rev-parse --show-toplevel)'
unalias gb
