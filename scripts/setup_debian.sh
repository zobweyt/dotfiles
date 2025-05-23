echo "Updating APT indexes..."
sudo apt update

echo "Installing common APT packages..."
sudo apt install software-properties-common -y

echo "Adding APT repositories..."
sudo add-apt-repository ppa:o2sh/onefetch -y

echo "Updating APT indexes..."
sudo apt update

echo "Installing APT packages..."
sudo apt install -y $(awk '{print $1}' packages.txt)
sudo ln -s /usr/bin/batcat /usr/bin/bat

echo "Autoremoving APT packages..."
sudo apt autoremove -y

echo "Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

echo "Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "Installing omz..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing omz plugins..."
git clone https://github.com/marlonrichert/zsh-hist.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-hist
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/Aloxaf/fzf-tab.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fzf-tab
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "Removing previous .zshrc..."
mv ~/.zshrc ~/.zshrc.bak

echo "Creating symlinks..."
stow -v .

echo "Restarting zsh..."
zsh
