export EDITOR=nvim
bindkey -e

# ---- PATH ----
export PATH="$HOME/.cargo/bin:$PATH"
[ -x /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"

# ---- tools ----
eval "$(fnm env --use-on-cd --shell zsh)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# ---- eza aliases ----
alias ls='eza --color=auto --icons=auto --group-directories-first'
alias ll='eza -l --color=auto --icons=auto --group-directories-first --git'
alias la='eza -la --color=auto --icons=auto --group-directories-first --git'
alias tree='eza -T --color=auto --icons=auto'

export HF_ENDPOINT=https://hf-mirror.com
export PATH="/Users/miter/.bun/bin:$PATH"

alias cuk='kubectl --context=cu-k8s'
alias lok='kubectl --context=local-k3s'

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

export IN_USE_SHELL="Zsh"

# 每次显示提示符前发送 OSC 2，将终端标题设为 "$IN_USE_SHELL $PWD"。
autoload -Uz add-zsh-hook
_update_terminal_title() {
  builtin printf '\033]2;%s %s\007' "$IN_USE_SHELL" "$PWD"
}
add-zsh-hook precmd _update_terminal_title
