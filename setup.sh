#!/bin/zsh

#This file will install Starship, use the Pastel Powerline theme, and install the fonts needed to display all that properly.
#It will also install a tmux config file that makes things a little smoother, mouse pane switching, mouse scrolling, changing shortcuts for pane switching, etc.

echo "Checking user"
if [ $(id -u) = 0 ]; then
    echo "Don't run as root! Quitting ..."
    exit 1
else
    echo "Not root ... continuing ...\n"
fi

echo "Installing Fonts..."
sudo cp -r ./fonts/* /usr/share/fonts/
echo "Refreshing Font Cache..."
fc-cache -f
echo ""

echo "Installing Starship"
#zsh starship_install.sh
sudo apt update -qq && sudo apt install starship -y
echo "Adding Starship to .zshrc"
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo "Switching preset to Pastel Powerline"
starship preset pastel-powerline -o ~/.config/starship.toml
echo ""

echo "Adding tmux config...\n"
cp .tmux.conf ~/.tmux.conf

echo "Done! Close and reopen the shell!"