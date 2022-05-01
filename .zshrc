export DISABLE_UPDATE_PROMPT="true"
export ZSH_DOTENV_PROMPT="false"
export HISTFILE="$HOME/.cache/zsh_history"
export ZSH=~/.local/ohmyzsh

ZSH_THEME="custom"
CASE_SENSITIVE="true"
FPATH=$HOME/.brew/share/zsh/site-functions:$FPATH

plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

umask 0077

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

[ $(uname -s) = "Darwin" ] && \
  export PATH="$HOME/.local/brew/bin:$HOME/.local/brew/sbin:$PATH" && \
  export PATH="$PATH:$HOME/.local/brew_x86/bin:$HOME/.local/brew_x86/sbin" && \
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

(( $+commands[dot] )) && export GRAPHVIZ_DOT="$(which dot)"
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"
(( $+commands[pyenv] )) && eval "$(pyenv init --path)"
(( $+commands[go] )) && export GOROOT="$HOME/.local/go" && export GOPATH="$HOME/.cache/go"
(( $+commands[aws] )) && \
  export AWS_CONFIG_FILE="$HOME/.local/aws/config" && \
  export AWS_SHARED_CREDENTIALS_FILE="$HOME/.local/aws/credentials"

export npm_config_cache="$HOME/.cache/npm"
export YARN_CACHE_FOLDER="$HOME/.cache/yarn"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

alias l='ls -lah --group-directories-first'
alias groot='cd $(git rev-parse --show-toplevel)'

alias grep="grep"\
" '--exclude-dir=*node_modules*'"\
" '--exclude-dir=*.venv*'"\
" '--exclude-dir=*.cache*'"\
" '--exclude-dir=*dist*'"

