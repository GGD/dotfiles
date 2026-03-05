# ====================
# p10k instant prompt (must stay at the top)
# ====================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ====================
# zinit
# ====================
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# plugins
zinit light zdharma/fast-syntax-highlighting
zinit light romkatv/powerlevel10k
zinit light rupa/z
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# oh-my-zsh snippets
zinit snippet OMZ::lib/clipboard.zsh
zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/bundler/bundler.plugin.zsh
zinit snippet OMZ::plugins/docker-compose/docker-compose.plugin.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZ::plugins/heroku/heroku.plugin.zsh
zinit snippet OMZ::plugins/rails/rails.plugin.zsh
zinit snippet OMZ::plugins/tmuxinator/tmuxinator.plugin.zsh

# annexes
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# ====================
# completion
# ====================
autoload -Uz compinit
compinit

# ====================
# aliases
# ====================
alias vim="nvim"
alias rr="rails routes"
alias rrg="rails routes | grep"
alias lzg="lazygit"
alias lzd="lazydocker"
alias os="overmind s"
alias oc="overmind c"
alias zj="zellij"
alias gdb="git branch | grep -v 'main' | grep -v 'release' | grep -v 'develop' | xargs git branch -D"
alias ls='eza -lh --group-directories-first --icons --hyperlink'
alias lt='eza --tree --level=2 --long --icons --git'

# ====================
# exports
# ====================
export EDITOR="vim"
export PATH="$HOME/.local/bin:$PATH"
export OVERMIND_PROCFILE=Procfile.dev
export CHROME_DRIVER_PATH=/opt/homebrew/bin/chromedriver

# ====================
# keybindings
# ====================
bindkey '^U' backward-kill-line
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

# ====================
# tools
# ====================
# brew
eval $(/opt/homebrew/bin/brew shellenv)

# p10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
export FZF_BASE=/opt/homebrew/bin/fzf
source <(fzf --zsh)

# zsh-history-substring-search
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# mise
eval "$(mise activate zsh)"
export PATH="$(mise where node)/bin:$PATH"
export PATH="$(mise where uv)/bin:$PATH"

# ====================
# custom scripts
# ====================
source "$HOME/.dotfiles/scripts/git-worktree.sh"
