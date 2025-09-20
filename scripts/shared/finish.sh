echo "Creating symlinks..."
stow -v .

if [ "$(basename "$SHELL")" != "fish" ]; then
  echo "Adding fish to approved shells..."
  sudo sh -c 'echo "$(which fish)" >> /etc/shells'

  echo "Setting default shell to zsh..."
  chsh -s $(which fish)
fi

echo "Changing directory to home..."
cd ~

echo "Restarting fish..."
source ~/.config/fish/config.fish
