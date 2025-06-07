zstyle ":completion:*" sort false
zstyle ":completion:*" list-dirs-first true
zstyle ":completion:*" special-dirs true
zstyle ":completion:*" ignored-patterns ".|..|.DS_Store|**/.|**/..|**/.DS_Store|**/.git"
zstyle ":completion:*" ignore-parents "parent pwd directory"
zstyle ":completion:*" menu no
zstyle ":fzf-tab:complete:(rm|ls|cp|cd|cat|bat):*" fzf-preview 'bat -p -r=:32 --color=always $realpath 2>/dev/null || gls --group-directories-first --color $realpath'
zstyle ":fzf-tab:*" switch-group "[" "]"

setopt globdots

if [[ ! "$PATH" == *"${HOME}/.fzf/bin"* ]]; then
  export PATH="${PATH:+${PATH}:}${HOME}/.fzf/bin"
fi

source <(fzf --zsh)
