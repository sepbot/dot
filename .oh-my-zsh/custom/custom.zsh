umask 0077

export EDITOR=vim
export PATH="$HOME/.local/bin:$PATH"

[ $(uname -s) = "Darwin" ] && \
  export PATH="$HOME/.brew/bin:$PATH"

export CARGO_HOME="$HOME/.local/cargo"
export RUSTUP_HOME="$HOME/.cache/rustup"
[ -d "$CARGO_HOME" ] && \
  export PATH="$CARGO_HOME/bin:$PATH" && \
  source "$CARGO_HOME/env"

[ -d "$HOME/.local/nvm" ] && \
  export NVM_DIR="$HOME/.local/nvm" && \
  source "$NVM_DIR/nvm.sh" && \
  source "$NVM_DIR/bash_completion"

[ -d "$HOME/.local/go" ] && \
  export GOROOT="$HOME/.local/go" && \
  export GOPATH="$HOME/.cache/go" && \
  export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

[ -s "$HOME/.local/pyenv/bin" ] && \
  export PATH="$HOME/.local/pyenv/bin:$PATH" && \
  eval "$(pyenv init --path)"

(( $+commands[dot] )) && export GRAPHVIZ_DOT="$(which dot)"
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

alias groot='cd $(git rev-parse --show-toplevel)'

alias grep="grep"\
" '--exclude-dir=*node_modules*'"\
" '--exclude-dir=*.venv*'"\
" '--exclude-dir=*.cache*'"\
" '--exclude-dir=*.parcel-cache*'"\
" '--exclude-dir=*dist*'"

