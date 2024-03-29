export DISABLE_UPDATE_PROMPT="true"
export ZSH_DOTENV_PROMPT="false"
export HISTFILE="$HOME/.cache/zsh_history"
export ZSH=~/.local/ohmyzsh

ZSH_THEME="custom"
CASE_SENSITIVE="true"

plugins=(git zsh-autosuggestions)

umask 0077

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

[ $(uname -s) = "Linux" ] && \
  export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH" && \
  alias pyenv="CPPFLAGS=-I$(brew --prefix openssl)/include LDFLAGS=-L$(brew --prefix openssl)/lib pyenv"

[ $(uname -s) = "Darwin" ] && \
  export PATH="$HOME/.local/brew/bin:$HOME/.local/brew/sbin:$PATH" && \
  alias date='gdate' && \
  alias sed='gsed'

[[ $(uname -r) == *WSL2 ]] && \
  export DISPLAY="vsock/:0"

export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.cache/rustup"
[ -d "$CARGO_HOME" ] && \
  export PATH="$CARGO_HOME/bin:$PATH" && \
  source "$CARGO_HOME/env"

(( $+commands[dot] )) && export GRAPHVIZ_DOT="$(which dot)"
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"
(( $+commands[pyenv] )) && eval "$(pyenv init --path)"

(( $+commands[brew] )) && \
  [ -d "$(brew --prefix)/share/zsh/site-functions" ] && \
  export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}" && \
  autoload -Uz compinit && compinit

(( $+commands[poetry] )) && \
  export POETRY_VIRTUALENVS_IN_PROJECT="true" && \
  export POETRY_VIRTUALENVS_PREFER_ACTIVE_PYTHON="true"

(( $+commands[aws] )) && \
  export AWS_CONFIG_FILE="$HOME/Workspace/.aws/config" && \
  export AWS_SHARED_CREDENTIALS_FILE="$HOME/Workspace/.aws/credentials"

export npm_config_cache="$HOME/.cache/npm"
export YARN_CACHE_FOLDER="$HOME/.cache/yarn"
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

source $ZSH/oh-my-zsh.sh

# now to undo the damage
unalias ls
unalias grep

[ $(uname -s) = "Darwin" ] && \
  alias ls='gls'

alias l='ls -ahlv --group-directories-first --color=auto'
alias groot='cd $(git rev-parse --show-toplevel)'
alias grep="grep"\
" --color=auto"\
" --exclude-dir={.git,.idea,node_modules,dist,target,build,.venv}"
