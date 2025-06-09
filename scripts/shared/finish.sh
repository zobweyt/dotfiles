echo "Creating a backup of previous .zshrc..."
mv ~/.zshrc ~/.zshrc.pre-zobweyt-dotfiles

echo "Creating symlinks..."
stow -v .

if [ "$(basename "$SHELL")" != "zsh" ]; then
  echo "Setting default shell to zsh..."
  chsh -s /usr/bin/zsh
fi

echo "Removing old dotfiles..."
sudo rm ~/.fzf.bash ~/.fzf.zsh ~/.shell.pre-oh-my-zsh ~/.zcompdump* ~/.zsh_history ~/.zshrc.pre-oh-my-zsh

echo "Changing directory to home..."
cd ~

echo "Restarting zsh..."
source ~/.zshrc
