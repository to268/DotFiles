# Zoomer shell config

# Base
source $HOME/.zprofile
setopt HIST_IGNORE_SPACE
setopt PROMPT_SUBST
setopt zle
set -o vi

# Git Info
git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="%{$fg[red]%}⇡NUM%{$reset_color%}"
  local BEHIND="%{$fg[cyan]%}⇣NUM%{$reset_color%}"
  local MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
  local UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
  local MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
  local STAGED="%{$fg[green]%}●%{$reset_color%}"

  local -a DIVERGENCES
  local -a FLAGS

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    FLAGS+=( "$MERGING" )
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    FLAGS+=( "$UNTRACKED" )
  fi

  if ! git diff --quiet 2> /dev/null; then
    FLAGS+=( "$MODIFIED" )
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    FLAGS+=( "$STAGED" )
  fi

  local -a GIT_INFO
  GIT_INFO+=( "%F{011} $GIT_LOCATION%b%f" )
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
  echo "${(j: :)GIT_INFO}"

}

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
# Complete prompt
PROMPT='%B%{$fg[blue]%}[%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[green]%}%M %{$fg[magenta]%}%~$(git_info)%{$fg[blue]%}]%{$fg[magenta]%}%(!.#.$)%{$reset_color%} '
# Minimal prompt
#PROMPT='%B%{$fg[red]%}%n %{$fg[magenta]%}%~$(git_info)%{$fg[green]%} >%{$reset_color%} '
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

precmd() { echo -ne '\e[5 q' }; # Set beam cursor shape

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^v' edit-command-line

# Usefull Shortcuts
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^w" forward-word
bindkey "^b" backward-word
bindkey "^r" history-incremental-search-backward
bindkey "^x" delete-char
bindkey "^d" delete-word
bindkey "^H" backward-kill-word
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search

# Load fzf-tab
source /usr/share/zsh/plugins/fzf-tab/fzf-tab.plugin.zsh 2>/dev/null

# Load zsh-fast-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
