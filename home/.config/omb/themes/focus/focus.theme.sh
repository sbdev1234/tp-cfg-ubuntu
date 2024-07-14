#! bash oh-my-bash.module
# A prompt theme for oh-my-bash. See doc

# Set terminal color escape sequences
SBD_RESET="$(tput sgr0)"
if [[ $(tput colors) -lt 256 ]]; then
  # Not a 256 color terminal. Use standard 8 ANSI color codes
  SBD_RED="\e[33;0;31m"
  SBD_BLUE="\e[33;0;34m"
  SBD_GREEN="\e[33;0;32m"
else
  # Use brighter ANSI 256 color codes
  SBD_RED="\e[38;5;196m"
  SBD_BLUE="\e[38;5;81m"
  SBD_GREEN="\e[38;5;154m"
fi

# Configure omb prompt support
SCM_THEME_PROMPT_DIRTY=" ${SBD_RED}*${SBD_RESET}"
SCM_THEME_PROMPT_CLEAN=" ${SBD_GREEN}*${SBD_RESET}"
SCM_THEME_PROMPT_PREFIX="${SBD_RESET}git:[$(git_current_user_name)|"
SCM_THEME_PROMPT_SUFFIX="]${SBD_RESET}"
SCM_GIT_AHEAD_CHAR="${SBD_BLUE}↑${SBD_RESET}"
SCM_GIT_BEHIND_CHAR="${SBD_BLUE}↓${SBD_RESET}"
SCM_GIT_DETACHED_CHAR="${SBD_RED}Ψ${SBD_RESET}"

# PROMPT_COMMAND line 01 right prompt text
sbd_pc_line01_rp() {
  local rText="${USER}@${WSL_DISTRO_NAME:-$HOSTNAME}"
  local -i rTextPos=0
  let rTextPos=${COLUMNS}-${#rText}
  tput sc
  tput cuf $rTextPos
  echo -ne $rText
  tput rc
}

# PROMPT_COMMAND line 01 text
sbd_pc_line01() {
  echo -ne "\n"
  sbd_pc_line01_rp
  echo -ne "[$(date +%H:%M:%S)]"
}

# PROMPT_COMMAND line 02 text
sbd_pc_line02() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    echo -ne "\n$(scm_prompt_info) $(git_prompt_status)"
  fi
}

# PROMPT_COMMAND line 03 text
sbd_pc_line03() {
  local dir=$PWD
  case $dir in
  ${HOME}/*) dir="${PWD/$HOME/\~}" ;;
  ${HOME}) dir="~ ($HOME)" ;;
  esac
  dir="${SBD_GREEN}${dir}${SBD_RESET}"
  echo -ne "\n${dir}"
}

# PS1 text
sbd_ps1() {
  local -i es=$?
  local p
  [[ $es -gt 0 ]] && p="${SBD_RED}[$es]${SBD_RESET}"
  [[ $EUID -eq 0 ]] && p="$p#"

  echo -ne "\n$p> "
}

_omb_util_add_prompt_command sbd_pc_line01
_omb_util_add_prompt_command sbd_pc_line02
_omb_util_add_prompt_command sbd_pc_line03

PS1='$(sbd_ps1)'
