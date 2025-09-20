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

tide configure --auto --style=Lean --prompt_colors='True color' --show_time=No --lean_prompt_height='One line' --prompt_spacing=Sparse --icons='Few icons' --transient=Yes
