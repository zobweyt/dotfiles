echo "Updating APT indexes..."
sudo apt update

echo "Installing common APT packages..."
sudo apt install software-properties-common -y

echo "Adding APT repositories..."
sudo add-apt-repository ppa:o2sh/onefetch -y

echo "Updating APT indexes..."
sudo apt update

echo "Installing APT packages..."
sudo apt install bat ca-certificates coreutils curl eza ffmpeg gnupg gnupg-agent neofetch onefetch pinentry-curses pinentry-tty stow tree unzip zip zsh -y
sudo ln -s /usr/bin/batcat /usr/bin/bat
sudo ln -s /usr/bin/python3 /usr/bin/python

echo "Autoremoving APT packages..."
sudo apt autoremove -y

echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | PROFILE=/dev/null bash

echo "Installing pnpm..."
curl -fsSL https://get.pnpm.io/install.sh | sh -

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-bash --no-zsh --no-fish --key-bindings --completion --no-update-rc

echo "Installing omz..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "Installing omz plugins..."
git clone https://github.com/marlonrichert/zsh-hist.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-hist
git clone https://github.com/chrissicool/zsh-256color ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-256color
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Removing previous .zshrc..."
mv ~/.zshrc ~/.zshrc.bak

echo "Creating symlinks..."
stow -v .

if [ "$(basename "$SHELL")" != "zsh" ]; then
  echo "Setting default shell to zsh..."
  chsh -s /usr/bin/zsh
fi

echo "Removing old dotfiles..."
sudo rm ~/.fzf.bash ~/.fzf.zsh ~/.shell.pre-oh-my-zsh ~/.zcompdump* ~/.zsh_history ~/.zshrc.bak ~/.zshrc.pre-oh-my-zsh

echo "Changing directory to home..."
cd ~

echo "Restarting zsh..."
source ~/.zshrc
