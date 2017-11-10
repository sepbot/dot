export PATH="$HOME/bin:$PATH"

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

