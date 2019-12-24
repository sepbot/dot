OS="$(uname)"

export PATH="$HOME/bin:$PATH"

if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/bin:/usr/local/bin:$PATH"
fi

export GOPATH="$HOME/Workspace/go"
export PATH="$GOPATH/bin:$PATH"
if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/.brew/opt/go/libexec/bin:$PATH"
fi

if [[ "${OS}" == 'Darwin' ]]; then
  export PATH="$HOME/Applications/Docker.app/Contents/Resources/bin:$PATH"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [[ "${OS}" == 'Darwin' ]]; then
  export ANDROID_HOME="$HOME/Library/Android/sdk"
  export PATH="$ANDROID_HOME/platform-tools:$PATH"
  export PATH="$PATH:$HOME/Applications/flutter/bin"
fi

export EDITOR=vim
export GRAPHVIZ_DOT="$(which dot)"

alias gcloud="docker run --rm -it --volume ${HOME}/.config/gcloud:/gcloud-config -e CLOUDSDK_CONFIG=/gcloud-config google/cloud-sdk gcloud"

alias groot='cd $(git rev-parse --show-toplevel)'
unalias gb

