export PATH="$HOME/bin:$HOME/apps/gcloud/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

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

