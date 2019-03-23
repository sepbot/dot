function venv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "%{$fg_bold[blue]%}venv:(%{$fg_bold[green]%}${VIRTUAL_ENV:t}%{$fg_bold[blue]%})%{$reset_color%} "
}

function cwd_venv {

  local VENV_HOME="$HOME/.virtualenvs"

  local GIT_REPO_ROOT=""
  local GIT_TOPLEVEL="$(git rev-parse --show-toplevel 2> /dev/null)"
  if [[ $? == 0 ]]; then
    GIT_REPO_ROOT="$GIT_TOPLEVEL"
  fi

  local PROJECT_ROOT="${PWD:A}"
  while [[ "$PROJECT_ROOT" != "/" && ! -e "$PROJECT_ROOT/.venv" \
           && ! -d "$PROJECT_ROOT/.git"  && "$PROJECT_ROOT" != "$GIT_REPO_ROOT" ]]; do
    PROJECT_ROOT="${PROJECT_ROOT:h}"
  done

  if [[ "$PROJECT_ROOT" == "$HOME" ]]; then
    PROJECT_ROOT="."
  fi

  if [[ -f "$PROJECT_ROOT/.venv" ]]; then
    ENV_NAME="$(cat "$PROJECT_ROOT/.venv")"
  elif [[ -f "$PROJECT_ROOT/.venv/bin/activate" ]];then
    ENV_NAME="$PROJECT_ROOT/.venv"
  elif [[ "$PROJECT_ROOT" != "." ]]; then
    ENV_NAME="${PROJECT_ROOT:t}"
  else
    ENV_NAME=""
  fi

  if [[ "$ENV_NAME" != "" ]]; then
    if [[ "$VIRTUAL_ENV" != "$VENV_HOME/$ENV_NAME" ]]; then
      if [[ -e "$VENV_HOME/$ENV_NAME/bin/activate" ]]; then
        source "$VENV_HOME/$ENV_NAME/bin/activate" && export CD_VIRTUAL_ENV="$ENV_NAME"
      fi
    fi
  elif [[ -n $CD_VIRTUAL_ENV && -n $VIRTUAL_ENV ]]; then
    deactivate && unset CD_VIRTUAL_ENV
  fi
}

if ! (( $chpwd_functions[(I)cwd_venv] )); then
  chpwd_functions+=(cwd_venv)
fi
