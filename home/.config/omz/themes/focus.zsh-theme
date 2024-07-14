# A git integrated two line prompt that tries to stay out of the way.
# helper: git_prompt_status()

autoload -Uz add-zsh-hook
setopt PROMPT_SUBST

SBD_BLUE=81
SBD_GREEN=154
SBD_RED=196
SBD_NL=$'\n'

# git_prompt_info helpers
ZSH_THEME_GIT_PROMPT_PREFIX="git:$(git_current_user_name)|"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_CLEAN="%F{$SBD_GREEN}*%f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{$SBD_RED}*%f"

# git_prompt_status helpers
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_ADDED="A"
ZSH_THEME_GIT_PROMPT_MODIFIED="U" # Unstaged
ZSH_THEME_GIT_PROMPT_RENAMED="R"
ZSH_THEME_GIT_PROMPT_DELETED="D"
ZSH_THEME_GIT_PROMPT_UNMERGED="↨"
ZSH_THEME_GIT_PROMPT_AHEAD="%F{$SBD_BLUE}⬆%f"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{$SBD_BLUE}⬇%f"
ZSH_THEME_GIT_PROMPT_DIVERGED="Ψ"
ZSH_THEME_GIT_PROMPT_STASHED="§"

sbd_line01_right() {
  local rpText
  local -i col=0
  print -v rpText -P "%n@${WSL_DISTRO_NAME:-%m}"
  let col=${COLUMNS}-${#rpText}

  SBD_LINE01_RIGHT=$(
    tput sc
    tput cuf $col
    echo -n $rpText
    tput rc
  )
}

sbd_line01_left() {
  print -v SBD_LINE01_LEFT -P "[%D{%H:%M:%S}]"
}

sbd_line02() {
  SBD_LINE02=""
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    print -v SBD_LINE02 -P "${SBD_NL}"
  fi
}

sbd_line03() {
  SBD_LINE03="%~"
  [[ "$PWD" == "$HOME" ]] && SBD_LINE03+=" ($HOME)"
  print -v SBD_LINE03 -P "%F{$SBD_GREEN}${SBD_LINE03}%f"
}

sbd_line04() {
  print -v SBD_LINE04 -P "%(?..%F{$SBD_RED}[%?]%f)%(#.%F{$SBD_RED}#%f.)"
}

add-zsh-hook precmd sbd_line01_right
add-zsh-hook precmd sbd_line01_left
add-zsh-hook precmd sbd_line02
add-zsh-hook precmd sbd_line03
add-zsh-hook precmd sbd_line04

# add-zsh-hook precmd git_prompt
PROMPT='
${SBD_LINE01_RIGHT}${SBD_LINE01_LEFT}
$(git_prompt_info)$(git_prompt_status)${SBD_LINE02}\
${SBD_LINE03} 
${SBD_LINE04}> '
