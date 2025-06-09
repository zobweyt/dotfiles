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

./shared/install.sh
./shared/finish.sh
