# Focus - _oh-my-bash_ prompt theme
Focus is a multi-line bash prompt to help developers (me) stay focused. 
_See also its zsh equivalent: `focus.zsh-theme`_

Importantly, this prompt theme and its `zsh` sibling present the same information. Allowing for switching as needed without loosing focus.

## Summary
PROMPT_COMMAND lines are shown before PS1 text

## PROMPT_COMMAND Line 1 - Time|Who
left: `[HH:MM:SS]`       
right: `<user>@<host>`
where: `<host>` is: `"${WSL_DISTRO_NAME:-$HOSTNAME}"`

## PROMPT_COMMAND Line 2 - git info
Shown if `git` folder: `"$(scm_prompt_info) $(git_prompt_status)"`

## PROMPT_COMMAND Line 3 - PWD
`~ ($HOME)` or 
`~/<folder>` or 
`$PWD`


## PS1
`[<exitStatus><rootStatus>]> `    
where `[...]` is optional and      
where `<exitStatus>` is `$?` if `[[ $? -gt 0 ]]` and      
where `<rootStatus>` is `#` if `[[ $EUID -eq 0 ]]`

---     
SBDev    
_All copyrights acknowledged_     
