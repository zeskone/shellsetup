#!/bin/zsh

echo "Installing Fonts..."
sudo cp -r ./fonts/* /usr/share/fonts/
echo "Refreshing Font Cache..."
fc-cache -f
#echo "Are the fonts listed?"
#fc-list | grep -e Caskaydia -e Fira
echo ""

echo "Installing Starship"
#zsh starship_install.sh
sudo apt update -qq && sudo apt install starship -y
echo "Adding Starship to .zshrc"
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
echo "Switching preset to Pastel Powerline"
starship preset pastel-powerline -o ~/.config/starship.toml
echo ""
echo "Done! Close and reopen the shell!"