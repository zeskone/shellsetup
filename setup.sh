#!/bin/zsh

echo "Installing Fonts..."
cp ./fonts/* /usr/share/fonts/
fc-cache -f
echo "Are the fonts listed?"
fc-list | grep -e Caskaydia -e Fira
echo ""

echo "Installing Starship"
zsh starship_install.sh
echo 'eval "$(starship init zsh)"' >> ~/.zshrc