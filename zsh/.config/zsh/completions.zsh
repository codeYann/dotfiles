# Local completions
fpath=("$XDG_CONFIG_HOME/zsh/completions" $fpath)

# Completion cache
autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump"

# Completion behavior
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# fzf-tab previews
zstyle ':fzf-tab:complete:cd:*' \
  fzf-preview 'eza -la --icons --color=always $realpath'

zstyle ':fzf-tab:complete:__zoxide_z:*' \
  fzf-preview 'eza -la --icons --color=always $realpath'
