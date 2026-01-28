export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export VISUAL="nvim"
export LANG="en_US.UTF-8"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY
setopt AUTO_CD
setopt CORRECT

fpath=($ZDOTDIR/completions $fpath)
autoload -Uz compinit && compinit
autoload -Uz colors && colors

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source "$HOME/.zsh/fzf-tab/fzf-tab.plugin.zsh"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(mise activate zsh)"

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
[ -f /opt/homebrew/opt/fzf/shell/completion.zsh ] && source /opt/homebrew/opt/fzf/shell/completion.zsh
[ -f /opt/homebrew/opt/fzf/shell/key-bindings.zsh ] && source /opt/homebrew/opt/fzf/shell/key-bindings.zsh

alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias lt='eza -T --icons --level=2'
alias cat='bat'
alias cd='z'
alias vim='nvim'
alias g='git'
alias lg='lazygit'
alias ld='lazydocker'
alias py='python3'
alias ip='ip --color=auto'

function mkcd() { mkdir -p "$1" && cd "$1" }
function tre() { eza -T --icons --level="${1:-2}" }
function weather() { curl -s "wttr.in/${1:-Moscow}?format=3" }
