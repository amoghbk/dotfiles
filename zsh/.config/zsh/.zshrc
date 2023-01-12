mkdir -p "$HOME/.cache/zsh"


setopt GLOB_DOTS
zstyle ":completion:*" menu select
zstyle ":completion:*" rehash true
zstyle ":completion:*" matcher-list "m:{a-zA-Z-_}={A-Za-z_-}" "r:|=*" "l:|=* r:|=*"
autoload -Uz compinit
compinit -d "$HOME/.cache/zsh/zcompdump"


setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY
export HISTFILE="$HOME/.cache/zsh/history"
export HISTSIZE=1000
export SAVEHIST=1000


bindkey -e

typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Control-Left]="${terminfo[kLFT5]}"
key[Control-Right]="${terminfo[kRIT5]}"

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -U edit-command-line
zle -N edit-command-line

bindkey "${key[Home]}"           beginning-of-line
bindkey "${key[End]}"            end-of-line
bindkey "${key[Insert]}"         overwrite-mode
bindkey "${key[Backspace]}"      backward-delete-char
bindkey "${key[Delete]}"         delete-char
bindkey "${key[Up]}"             up-line-or-beginning-search
bindkey "${key[Down]}"           down-line-or-beginning-search
bindkey "${key[Left]}"           backward-char
bindkey "${key[Right]}"          forward-char
bindkey "${key[PageUp]}"         up-line-or-history
bindkey "${key[PageDown]}"       down-line-or-history
bindkey "${key[Shift-Tab]}"      reverse-menu-complete
bindkey "${key[Control-Left]}"   backward-word
bindkey "${key[Control-Right]}"  forward-word
bindkey "\C-x\C-e"               edit-command-line

if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
    autoload -Uz add-zle-hook-widget
    function zle_application_mode_start { echoti smkx }
    function zle_application_mode_stop { echoti rmkx }
    add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
    add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi


autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST
zstyle ":vcs_info:git:*" formats " %b"

precmd() { echo }
PROMPT=$'%B%F{cyan}%(4~|.../%3~|%d)%F{red}${vcs_info_msg_0_}\n%F{blue}%(1j.↓%j .)%b%F{yellow}%(!.#.❯)%f '


export EDITOR="nvim"


typeset -U path PATH


path=("$HOME/.local/bin" $path)


export RUSTUP_HOME="$HOME/.local/share/rust/rustup"
export CARGO_HOME="$HOME/.local/share/rust/cargo"
source "$CARGO_HOME/env"


export GOPATH="$HOME/.local/share/go"
path=("/usr/local/go/bin" $path)


export PYENV_ROOT="$HOME/.local/share/pyenv"
path=("$PYENV_ROOT/bin" $path)
eval "$(pyenv init -)"


alias ls="exa"

alias fnd="fd --hidden --no-ignore --exclude /mnt --exclude \*.svg --exclude \*.png --exclude \*.jpg"

alias reload="exec $SHELL"
alias :q="exit"
