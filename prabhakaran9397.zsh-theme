local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


local user_host='%{$terminfo[bold]$fg[red]%}%n%{$terminfo[bold]$fg[white]%}[at]%{$terminfo[bold]$fg[green]%}%m%{$reset_color%}'

local current_dir='[%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}]'
local rvm_ruby=''
if which rvm-prompt &> /dev/null; then
  rvm_ruby='%{$fg[red]%}‹$(rvm-prompt i v g)›%{$reset_color%}'
else
  if which rbenv &> /dev/null; then
    rvm_ruby='%{$fg[red]%}‹$(rbenv version | sed -e "s/ (set.*$//")›%{$reset_color%}'
  fi
fi
local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─%{$terminfo[bold]$fg[yellow]%}% o%{$reset_color%} ${user_host} ${current_dir} ${git_branch}${rvm_ruby}
╰─%B%{$terminfo[bold]$fg[yellow]%}% o%{$reset_color%}%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
