HISTDUP=erase
HISTSIZE=1280
SAVEHIST=1024

HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"

mkdir -p "$(dirname "$HISTFILE")"

setopt sharehistory
setopt appendhistory
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups

zsh-history-skip-command-not-found() {
  if [[ $? == 127 ]]; then
    hist -fs delete -1
  fi
}

autoload -Uz add-zsh-hook

add-zsh-hook precmd zsh-history-skip-command-not-found
