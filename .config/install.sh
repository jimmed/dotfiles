#!/bin/bash

# TODO
# - Split out into modules

# Run updates
echo "System updates..."
sudo apt update
sudo apt upgrade -y

# Installing installer deps
sudo apt install curl

# Add apt sources
echo "Adding apt sources..."

# Fish shell
command -v fish >/dev/null 2>&1 || {
  sudo apt-add-repository ppa:fish-shell/release-2
  sudo apt install -y fish
  chsh -s /usr/bin/fish
}

# Node.js
command -v node >/dev/null 2>&1 || {
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
}

# Yarn
command -v yarn >/dev/null 2>&1 || {
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
}

echo "INSTALLING!"
# Install it all!
sudo apt install -y i3 i3blocks j4-dmenu-desktop nodejs yarn golang xclip

command -v google-chrome >/dev/null 2>&1 && { echo "Chrome already installed" } || {
  echo "Installing Chrome"
  sudo apt install -y libappindicator1
  pushd ~/Downloads
  wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i chrome.deb
  rm chrome.deb
  popd
}

command -v rambox >/dev/null 2>&1 && { echo "Rambox already installed" } || {
  echo "Installing Rambox"
  pushd ~/Downloads
  wget -O rambox.deb https://github.com/saenzramiro/rambox/releases/download/0.5.13/Rambox_0.5.13-x64.deb
  sudo dpkg -i rambox.deb
  rm rambox.deb
  popd
}

command -v atom >/dev/null 2>&1 && { echo "Atom already installed" } || {
  echo "Installing Atom"
  sudo snap install --classic atom
}

echo "Fixing Nautilus desktop setting"
gsettings set org.gnome.desktop.background show-desktop-icons false

echo "DONE!"
