export PATH="$HOME/bin:$HOME/.brew/bin:$HOME/.brew/opt/go/libexec/bin:$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/Workspace/go"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ -f "$HOME/Applications/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/Applications/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/Applications/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/Applications/google-cloud-sdk/completion.zsh.inc"
fi

export EDITOR=vim
export GRAPHVIZ_DOT="$(which dot)"
