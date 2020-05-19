# Zoomer shell config

# Base
source $HOME/.zprofile
setopt PROMPT_SUBST

# Git Info
autoload -Uz vcs_info
precmd(){ vcs_info }
zstyle ':vcs_info:git:*' formats '%F{011} %b%f'
zstyle ':vcs_info:git:*' check-for-changes true

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PROMPT='%B%{$fg[blue]%}[%{$fg[red]%}%n%{$fg[yellow]%}@%{$fg[green]%}%M %{$fg[magenta]%}%~${vcs_info_msg_0_}%{$fg[blue]%}]%{$fg[magenta]%}%(!.#.$)%{$reset_color%} '
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

echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
