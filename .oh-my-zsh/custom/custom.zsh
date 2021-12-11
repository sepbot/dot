umask 0077

export EDITOR=vim
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

case "$(uname -a)" in
  *Darwin*)
    alias cls='clear && reset'
    export PATH="$HOME/.brew/bin:$PATH"
    ;;
esac

if [[ -d "$HOME/.cargo" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

(( $+commands[go] )) && export GOPATH="$HOME/.local/gopath" && export PATH="$GOPATH/bin:$PATH"
(( $+commands[dot] )) && export GRAPHVIZ_DOT="$(which dot)"
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

alias grep="grep '--exclude-dir=*node_modules*' '--exclude-dir=*.venv*' '--exclude-dir=*.cache*' '--exclude-dir=*.parcel-cache*' '--exclude-dir=*dist*'"
alias groot='cd $(git rev-parse --show-toplevel)'

[ -s "$HOME/.pyenv/bin" ] && export PATH="$HOME/.pyenv/bin:$PATH" && eval "$(pyenv init --path)"

