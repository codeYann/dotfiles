# History
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=100000
SAVEHIST=100000

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_expire_dups_first
setopt extended_history

# Shell behaviour
setopt autocd
setopt numeric_glob_sort
setopt nobeep
setopt interactive_comments

# Directory navigation
setopt auto_pushd
setopt pushd_ignore_dups
