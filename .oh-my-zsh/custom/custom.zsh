OS="$(uname)"

export DISABLE_UPDATE_PROMPT=true

export PATH="$HOME/bin:$PATH"

if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/bin:/usr/local/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

export GOPATH="$HOME/Workspace/go"
export PATH="$GOPATH/bin:$PATH"
if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/opt/go/libexec/bin:$PATH"
fi

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$PATH:$HOME/Applications/flutter/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export GOOGLE_CLOUD_SDK="$HOME/Applications/google-cloud-sdk"
export CLOUDSDK_PYTHON="/usr/bin/python"

if [ -f "$HOME/Applications/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/Applications/google-cloud-sdk/path.zsh.inc"
fi

if [ -f "$HOME/Applications/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/Applications/google-cloud-sdk/completion.zsh.inc"
fi

export PATH="$HOME/Applications/Docker.app/Contents/Resources/bin:$PATH"

export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

export EDITOR=vim
export GRAPHVIZ_DOT="$(which dot)"

alias groot='cd $(git rev-parse --show-toplevel)'
unalias gb

