local user_host='%{$terminfo[bold]$fg[red]%}%n%{$terminfo[bold]$fg[yellow]%} ⚡ %{$terminfo[bold]$fg[green]%}%m%{$reset_color%}'

local current_dir='[%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}]'

local git_branch='$(git_prompt_info)%{$reset_color%}'

PROMPT="╭─%{$terminfo[bold]$fg[yellow]%}% ⚡%{$reset_color%} ${user_host} ${current_dir} ${git_branch}
╰─%B%{$terminfo[bold]$fg[yellow]%}% ⚡%{$reset_color%} "

#RPROMPT=''
#TMOUT=1
#TRAPALRM() {
#    zle reset-prompt
#}

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"
