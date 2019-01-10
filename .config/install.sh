#!/bin/bash

# TODO
# - Split out into modules

NODE_VERSION="10"
FRANZ_VERSION="5.0.0-beta.19"
PLAYERCTL_VERSION="0.5.0"

# Run updates
echo "System updates..."
sudo apt update
sudo apt upgrade -y

# Installing installer deps
command -v curl >/dev/null 2>&1 && {
  echo "curl already installed"
} || {
  sudo apt install curl -y
}

# Fish shell
command -v fish >/dev/null 2>&1 && {
  echo "Fish already installed"
} || {
  sudo apt-add-repository ppa:fish-shell/release-2
  sudo apt install -y fish
  chsh -s /usr/bin/fish
}

# Node.js
command -v node >/dev/null 2>&1 && {
  echo "Node.js already installed"
} || {
  curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
}

# Yarn
command -v yarn >/dev/null 2>&1 && {
  echo "Yarn already installed"
} || {
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
}

echo "INSTALLING!"
# Install it all!
sudo apt install -y i3 i3blocks j4-dmenu-desktop nodejs yarn golang xclip

command -v google-chrome >/dev/null 2>&1 && {
  echo "Chrome already installed"
} || {
  echo "Installing Chrome"
  sudo apt install -y libappindicator1
  pushd ~/Downloads
  wget -O chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i chrome.deb
  rm chrome.deb
  popd
}

command -v franz >/dev/null 2>&1 && {
  echo "Franz already installed"
} || {
  echo "Installing Franz"
  pushd ~/Downloads
  wget -O franz.deb https://github.com/meetfranz/franz/releases/download/v$FRANZ_VERSION/franz_$FRANZ_VERSION_amd64.deb
  sudo dpkg -i franz.deb
  rm franz.deb
  popd
}

command -v code >/dev/null 2>&1 && {
  echo "Code already installed"
} || {
  echo "Installing Code"
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
  sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt update
  sudo apt install code -y
}

command -v discord >/dev/null 2>&1 && {
  echo "Discord already installed"
} || {
  echo "Installing Discord"
  pushd ~/Downloads
  wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
  sudo apt install -y libc++1
  sudo dpkg -i discord.deb
  rm discord.deb
  popd
}

command -v playerctl >/dev/null 2>&1 && {
  echo "Playerctl already installed"
} || {
  echo "Installing playerctl"
  pushd ~/Downloads
  wget -O playerctl.deb "https://github.com/acrisci/playerctl/releases/download/v$PLAYERCTL_VERSION/playerctl-$PLAYERCTL_VERSION_amd64.deb"
  sudo dpkg -i playerctl.deb
  rm playerctl.deb
  popd
}

echo "Fixing Nautilus desktop setting"
gsettings set org.gnome.desktop.background show-desktop-icons false

echo "Cleaning up"
sudo apt autoremove -y

echo "DONE!"
