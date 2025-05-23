# Should be above the Powerlevel10k instant prompt.
export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_THEME="powerlevel10k/powerlevel10k"

export CASE_SENSITIVE="false"
export HYPHEN_INSENSITIVE="false"

plugins=(
  git
  python
  zsh-hist
  zsh-256color
  zsh-syntax-highlighting
  zsh-autosuggestions
  fzf-tab
)

ZSH_COMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "$(dirname $ZSH_COMPDUMP)"
autoload -Uz compinit
compinit -d "${ZSH_COMPDUMP}"

source "$ZSH/oh-my-zsh.sh"

source "$HOME/.config/zsh/p10k.zsh"
source "$HOME/.config/zsh/completion.zsh"
source "$HOME/.config/zsh/history.zsh"
source "$HOME/.config/zsh/cli/uv.zsh"
source "$HOME/.config/zsh/cli/nvm.zsh"
source "$HOME/.config/zsh/cli/pnpm.zsh"
source "$HOME/.config/zsh/cli/angular.zsh"
source "$HOME/.config/zsh/aliases.zsh"
