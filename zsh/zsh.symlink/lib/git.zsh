# get the name of the branch we are on
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  
  echo "%{$fg_bold[blue]%}git:(%{$reset_color%}\
$(git_prompt_time_since_commit)\
|\
%{$fg_bold[blue]%}${ref#refs/heads/}%{$reset_color%}\
$(git_prompt_dirty_or_clean)\
%{$fg_bold[blue]%})%{$reset_color%}"
}

# Checks if working tree is dirty
function git_prompt_dirty_or_clean() {
  if [[ -n $(git status -s 2> /dev/null) ]]; then
    echo "%{$fg[yellow]%}✗%{$reset_color%}"
  else
    echo ""
  fi
}

# Stolen from: https://github.com/garybernhardt/dotfiles/blob/master/.zsh/func/prompt_grb_setup
function git_minutes_since_last_commit() {
  now=`date +%s`
  last_commit=`git log --pretty=format:'%at' -1 2>/dev/null`
  if $lastcommit ; then
    seconds_since_last_commit=$((now-last_commit))
    minutes_since_last_commit=$((seconds_since_last_commit/60))
    echo $minutes_since_last_commit
  else
    echo "-1"
  fi
}

# Formats time since last commit, in minutes
function git_prompt_time_since_commit() {
  local MINUTES_SINCE_LAST_COMMIT=`git_minutes_since_last_commit`
  if [ "$MINUTES_SINCE_LAST_COMMIT" -eq -1 ]; then
    local SINCE_LAST_COMMIT="%{$fg[magenta]%}uncommitted%{$reset_color%}"
  else
    if [ "$MINUTES_SINCE_LAST_COMMIT" -gt 30 ]; then
      COLOR="%{$fg[red]%}"
    elif [ "$MINUTES_SINCE_LAST_COMMIT" -gt 10 ]; then
      COLOR="%{$fg[yellow]%}"
    else
      COLOR="%{$fg[green]%}"
    fi
    local SINCE_LAST_COMMIT="${COLOR}${MINUTES_SINCE_LAST_COMMIT}m%{$reset_color%}"
  fi
  echo $SINCE_LAST_COMMIT
}

# Checks if there are commits ahead from remote
function git_prompt_ahead() {
  if $(echo "$(git log origin/$(current_branch)..HEAD 2> /dev/null)" | grep '^commit' &> /dev/null); then
    echo "$ZSH_THEME_GIT_PROMPT_AHEAD"
  fi
}

# Formats prompt string for current git commit short SHA
function git_prompt_short_sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Formats prompt string for current git commit long SHA
function git_prompt_long_sha() {
  SHA=$(git rev-parse HEAD 2> /dev/null) && echo "$ZSH_THEME_GIT_PROMPT_SHA_BEFORE$SHA$ZSH_THEME_GIT_PROMPT_SHA_AFTER"
}

# Get the status of the working tree
git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  elif $(echo "$INDEX" | grep '^M  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_ADDED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  elif $(echo "$INDEX" | grep '^AD ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  echo $STATUS
}
