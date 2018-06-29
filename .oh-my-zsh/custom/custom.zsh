export PATH="$HOME/bin:$HOME/.anaconda/bin:$HOME/.brew/bin:$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/Workspace/go"
export PATH="$GOPATH/bin:$HOME/.brew/opt/go/libexec/bin:$HOME/Applications/go_appengine:$HOME/Applications/Docker.app/Contents/Resources/bin:$PATH"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

export PATH="${PATH}:/usr/local/bin"

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

alias changeuser='"/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession" -suspend'
alias groot='cd $(git rev-parse --show-toplevel)'
unalias gb

