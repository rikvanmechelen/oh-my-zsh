local ret_status="%{%}%(?:%{$fg[green]%}→ :%{$fg[red]%}→ %s)"

function git_in_dir() {
git_test=$((command git rev-parse --is-inside-work-tree) 2>&1)
if [[ $git_test == "true" ]]; then
    echo "$ZSH_THEME_GIT_PROMPT_IN_GIT_DIR"
  else
    echo "$ZSH_THEME_GIT_PROMPT_NOT_IN_GIT_DIR"
  fi
}

function rbenv_version_prompt {
  if which rbenv &> /dev/null; then
    rbenv=$(rbenv version-name) || return
    $(rbenv commands | grep -q gemset) && gemset=$(rbenv gemset active 2> /dev/null) && rbenv="$rbenv@${gemset%% *}"
    echo -e "$RBENV_THEME_PROMPT_PREFIX$rbenv$RBENV_THEME_PROMPT_SUFFIX"
  fi
}

function git_pair_info {
  GIT_DUET_INITIALS=$(echo $(git config --get-regexp ^duet.env.git-.*-name | sed -e 's/^.*-name //' | tr 'A-Z' 'a-z' | sed -e 's/\([a-z]\)[^ +]*./\1/g' ) | sed -e 's/ /+/')
  GIT_PAIR=${GIT_DUET_INITIALS:-`git config user.initials | sed 's% %+%'`}
  if [[ $GIT_PAIR != "" ]]; then
    echo -e "$ZSH_THEME_GIT_PAIR_PREFIX$GIT_PAIR"
  fi
}




PROMPT='%{$fg[yellow]%}$(rbenv_version_prompt) %{$fg[green]%}%m %{$reset_color%}in %{$fg[green]%}%~
$(git_in_dir)%{$reset_color%}%{$fg[green]%}$(git_pair_info)$(git_prompt_info) ${ret_status}% %{$reset_color%}'

ZSH_THEME_GIT_PAIR_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}|"
ZSH_THEME_GIT_PROMPT_SUFFIX="|%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✓"
ZSH_THEME_GIT_PROMPT_IN_GIT_DIR="%{$fg_bold[cyan]%}±"
ZSH_THEME_GIT_PROMPT_NOT_IN_GIT_DIR="%{$fg_bold[cyan]%}○"
RBENV_THEME_PROMPT_PREFIX=" |"
RBENV_THEME_PROMPT_SUFFIX="|"
