export GPG_TTY=$(tty)

# Settings

set -g fish_greeting

# Bindings

bind tab complete-and-search

# Aliases

alias cl="clear"
alias "сд"="clear"
alias "сдуфк"="clear"

alias gg="lazygit"

alias ls="eza --group-directories-first"

alias cat="bat --paging never --decorations never --plain"

alias grep="rg"

alias reload="source $__fish_config_dir/config.fish"

# Path

fish_add_path "/opt/homebrew/bin/"
