bindkey -e

autoload -Uz history-search-end

zle -N history-search-backward-end history-search-end
zle -N history-search-forward-end history-search-end

bindkey '^p' history-search-backward-end
bindkey '^n' history-search-forward-end
