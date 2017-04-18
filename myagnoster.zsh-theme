CURRENT_BG=''
PRIMARY_FG=black

# Characters
SEGMENT_SEPARATOR="\ue0b0"
PLUSMINUS="\u00b1"
BRANCH="\ue0a0"
DETACHED="\u27a6"
CROSS="\u2718"
TICK="\u2714"
GEAR="\u2699"

prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    print -n "%{$bg%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR%{$fg%}"
  else
    print -n "%{$bg%}%{$fg%}"
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && print -n $3
}

prompt_status() {
  local symbols
  symbols=" "
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}$CROSS "
  [[ $RETVAL -eq 0 ]] && symbols+="%{%F{green}%}$TICK "
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}$GEAR "

  [[ -n "$symbols" ]] && prompt_segment black $PRIMARY_FG "%{%F{grey}%}╭$symbols"
}

prompt_context() {
  prompt_segment cyan $PRIMARY_FG " `whoami`@`uname -n`"
}

prompt_data() {
  	prompt_segment magenta $PRIMARY_FG "%{%F{black}%} $(datausage) "
}

prompt_dir() {
  prompt_segment blue $PRIMARY_FG ' %~ '
}

prompt_git() {
  local color ref
  is_dirty() {
    test -n "$(git status --porcelain --ignore-submodules)"
  }
  ref="$vcs_info_msg_0_"
  if [[ -n "$ref" ]]; then
    if is_dirty; then
      color=yellow
      ref="${ref} $PLUSMINUS"
    else
      color=green
      ref="${ref} "
    fi
    if [[ "${ref/.../}" == "$ref" ]]; then
      ref="$BRANCH $ref"
    else
      ref="$DETACHED ${ref/.../}"
    fi
    prompt_segment $color $PRIMARY_FG
    print -Pn " $ref"
  fi
}

prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  symbol="$"
  if [[ $(whoami) = "root" ]]; then
    symbol="#"
  fi
  print "%{%f%}"
  print "╰─%{%F{yellow}%}$symbol%{%F{default}%}"
  CURRENT_BG=''
}

prompt_agnoster_main() {
  RETVAL=$?
  CURRENT_BG='NONE'
  prompt_status
  prompt_context
  prompt_data
  prompt_dir
  prompt_git
  prompt_end
}

prompt_agnoster_precmd() {
  vcs_info
  PROMPT='%{%f%b%k%}$(prompt_agnoster_main) '
}

prompt_agnoster_setup() {
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  prompt_opts=(cr subst percent)

  add-zsh-hook precmd prompt_agnoster_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes false
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b (%a)'
}

prompt_agnoster_setup "$@"