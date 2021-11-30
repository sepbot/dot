umask 0077

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

case "$(uname -a)" in
  *Darwin*)
    alias cls='clear && reset'
    export PATH="$HOME/.brew/bin:$PATH"
    ;;
  *microsoft*)
    alias cls='tput clear'
    alias ide='nohup idea . > /dev/null 2>&1 &; disown'
    export DISPLAY=":0"
    if ! pgrep wsld >> /dev/null 2>&1 ; then
      nohup wsld > /dev/null < /dev/null 2>&1 &
      disown
      while ! xset q > /dev/null 2>&1 ; do
        sleep 0.3
      done
    fi
    ;;
esac

if [[ -d "$HOME/.cargo" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
  source "$HOME/.cargo/env"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

[ -s "/usr/local/go/bin" ] && export PATH="/usr/local/go/bin:$PATH"
export GOPATH="$HOME/gopath"
export PATH="$GOPATH/bin:$PATH"

export PIPENV_VENV_IN_PROJECT=1
export EDITOR=vim
export GRAPHVIZ_DOT="$(which dot)"

alias grep="grep '--exclude-dir=*node_modules*' '--exclude-dir=*.venv*' '--exclude-dir=*.cache*' '--exclude-dir=*.parcel-cache*' '--exclude-dir=*dist*'"

alias groot='cd $(git rev-parse --show-toplevel)'

eval "$(pyenv init --path)"
eval "$(direnv hook zsh)"

