export DISABLE_UPDATE_PROMPT="true"
export ZSH_DOTENV_PROMPT="false"
export HISTFILE="$HOME/.cache/zsh_history"
export ZSH=~/.local/ohmyzsh

ZSH_THEME="custom"
CASE_SENSITIVE="true"

[ -d "$HOME/.brew/share/zsh/site-functions" ] && \
  export FPATH="${HOME}/.brew/share/zsh/site-functions:${FPATH}"

plugins=(git zsh-autosuggestions)

umask 0077

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

[ $(uname -s) = "Linux" ] && \
  alias docker-sucks="$(which docker)" && \
  alias docker="podman" && \
  alias docker-compose="podman-compose"


[ $(uname -s) = "Darwin" ] && \
  export PATH="$HOME/.local/brew/bin:$HOME/.local/brew/sbin:$PATH" && \
  export PATH="$PATH:$HOME/.local/brew_x86/bin:$HOME/.local/brew_x86/sbin" && \
  alias brow="arch -x86_64 $HOME/.local/brew_x86/bin/brew" && \
  alias date='gdate'

export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.cache/rustup"
[ -d "$CARGO_HOME" ] && \
  export PATH="$CARGO_HOME/bin:$PATH" && \
  source "$CARGO_HOME/env"

[ -d "$XDG_DATA_HOME/JetBrains/Toolbox/scripts" ] && \
  export PATH="$XDG_DATA_HOME/JetBrains/Toolbox/scripts:$PATH"

(( $+commands[dot] )) && export GRAPHVIZ_DOT="$(which dot)"
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"
(( $+commands[pyenv] )) && eval "$(pyenv init --path)"

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
