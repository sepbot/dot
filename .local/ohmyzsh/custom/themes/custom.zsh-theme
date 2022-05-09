alias mutagen_prompt_info='mutagen-status -quiet -template="$fg_bold[blue]mutagen:(%v)$reset_color"'
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

VIRTUAL_ENV_DISABLE_PROMPT=1

PROMPT='
${ret_status} %n@%m %{$fg[cyan]%}%9c%{$reset_color%} $(git_prompt_info) $(mutagen_prompt_info)
 %{$fg[magenta]%}#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

