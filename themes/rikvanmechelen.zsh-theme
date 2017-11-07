local ret_status="%{%}%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
local user_host="%{$terminfo[bold]$fg_bold[green]%}%n%{$reset_color%}"

PROMPT='╭─ $user_host%{$fg_bold[green]%}%P %{$fg[cyan]%}%~ %{$fg_bold[blue]%}ruby:(%{$fg[cyan]%}$(rbenv version-name)%{$fg_bold[blue]%}) $(git_prompt_info)%{$fg_bold[blue]%} 
%{$reset_color%}╰─ ${ret_status}% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
