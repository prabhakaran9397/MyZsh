f_c() {
	print -n "%{$terminfo[bold]$fg[$1]%}$2%{$reset_color%}"
}
b_c() {
	print -n "%{%K{$1}%}% $2%{%K{default}%}"
}
git_branch() {
	[ $(git_prompt_info) ] && print -n "[$(f_c yellow " $(git_prompt_info | sed 's/git:\|[()]//g')")]"
}
retval() {
	[ $? -eq 0 ] && print -n "┌─" || print -n "$(f_c red '┌─')"
}
data_used() {
	local rx="$(ifconfig wlan0 | grep -oE '\([0-9A-Z .]+\)' | sed 's/[()]//g' | head -n 1)"
	local tx="$(ifconfig wlan0 | grep -oE '\([0-9A-Z .]+\)' | sed 's/[()]//g' | tail -n 1)"
	print -n "$(b_c black "[$rx↓][$tx↑]")"
}
local dir="$(f_c cyan '%~')"
local context="$(f_c green '%n@%m')"
[ $USER = "root" ] && local symbol=# || local symbol=$

Line_1='$(retval)[$context][$dir]$(git_branch)'
Line_2='└─${symbol} '

PROMPT=$(print -n "$Line_1\n$Line_2")
RPROMPT='$(data_used)'
