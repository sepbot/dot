umask 0077

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

[ $(uname -s) = "Darwin" ] && \
  export PATH="$HOME/.local/brew/bin:$HOME/.local/brew/sbin:$PATH" && \
  export PATH="$PATH:$HOME/.local/brew_x86/bin:$HOME/.local/brew_86/sbin" && \
  alias brow="arch -x86_64 $HOME/.local/brew_x86/bin/brew" && \
  alias ls='gls --color' && \
  alias date='gdate'

export SDKMAN_DIR="$HOME/.local/sdkman"
[ -d "$SDKMAN_DIR" ] && \
  source "$SDKMAN_DIR/bin/sdkman-init.sh"

export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.cache/rustup"
[ -d "$CARGO_HOME" ] && \
  export PATH="$CARGO_HOME/bin:$PATH" && \
  source "$CARGO_HOME/env"

export npm_config_cache="$HOME/.cache/npm"
[ -d "$HOME/.local/nvm" ] && \
  export NVM_DIR="$HOME/.local/nvm" && \
  source "$NVM_DIR/nvm.sh" && \
  source "$NVM_DIR/bash_completion"

[ -d "$HOME/.local/go" ] && \
  export GOROOT="$HOME/.local/go" && \
  export GOPATH="$HOME/.cache/go" && \
  export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

export PYENV_ROOT="$HOME/.local/pyenv"
[ -s "$PYENV_ROOT/bin" ] && \
  export PATH="$PYENV_ROOT/bin:$PATH" && \
  eval "$(pyenv init --path)"

[ -s "$HOME/.local/aws" ] && \
  export PATH="$PATH:$HOME/.local/aws/bin" && \
  export AWS_CONFIG_FILE="$HOME/.local/aws/config" && \
  export AWS_SHARED_CREDENTIALS_FILE="$HOME/.local/aws/credentials"

(( $+commands[dot] )) && export GRAPHVIZ_DOT="$(which dot)"
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

export YARN_CACHE_FOLDER="$HOME/.cache/yarn"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

alias l='ls -lah --group-directories-first'
alias groot='cd $(git rev-parse --show-toplevel)'

alias grep="grep"\
" '--exclude-dir=*node_modules*'"\
" '--exclude-dir=*.venv*'"\
" '--exclude-dir=*.cache*'"\
" '--exclude-dir=*.parcel-cache*'"\
" '--exclude-dir=*dist*'"

