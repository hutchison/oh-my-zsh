# the working directory ($HOME is abbreviated)
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
# user@host
local user='%{$fg[green]%}%n%{$reset_color%}'
local host='%{$fg[red]%}%m%{$reset_color%}'
# what did the last command return?
local return_code='%(?..%{$fg[red]%}%?↵%{$reset_color%})'
# the time in hh:mm:ss (24h format)
local time="%*"
# the prompt symbol depends on the underlying OS
local regular_prompt_symbol="»"
if [[ $(uname) == "Darwin" ]]; then
    regular_prompt_symbol=""
elif [[ $(uname) == "Linux" ]]; then
    regular_prompt_symbol="🐧"
fi
local root_prompt_symbol="#"

# for git_prompt_info
ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%} ●"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# for git_prompt_status
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}●"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}●"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}●"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}●"

# git stuff: $branch $status
local git_branch='$(git_prompt_info)%{$reset_color%} $(git_prompt_status)%{$reset_color%}'

# pwd can be very long, so the whole first line is reserved for it (+ git stuff)
PROMPT="${user} auf ${host} in ${pwd} ${git_branch}%E
%(!. ${root_prompt_symbol}. ${regular_prompt_symbol}) "

RPROMPT="${return_code} ${time}"
