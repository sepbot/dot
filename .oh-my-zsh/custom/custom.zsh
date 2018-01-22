export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

export GOPATH="$HOME/workspace/go"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ -f "$HOME/apps/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/apps/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/apps/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/apps/google-cloud-sdk/completion.zsh.inc"
fi

alias tcurl='curl --socks5-hostname 127.0.0.1:9050'
export EDITOR=vim

function preexec() {
  timer=$(($(date +%s%N)/1000000))
}

function precmd() {
  if [ $timer ]; then
    now=$(($(date +%s%N)/1000000))
    elapsed=$(($now-$timer))

    export RPROMPT="%F{cyan}${elapsed}ms %{$reset_color%}"
    unset timer
  fi
}

