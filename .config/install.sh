#!/bin/bash

# TODO
# - Split out into modules

# Run updates
echo "System updates..."
sudo apt update
sudo apt upgrade -y

# Installing installer deps
command -v curl >/dev/null 2>&1 && {
  echo "curl already installed"
} || {
  sudo apt install curl
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
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
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

command -v rambox >/dev/null 2>&1 && {
  echo "Rambox already installed"
} || {
  echo "Installing Rambox"
  pushd ~/Downloads
  wget -O rambox.deb https://github.com/saenzramiro/rambox/releases/download/0.5.13/Rambox_0.5.13-x64.deb
  sudo dpkg -i rambox.deb
  rm rambox.deb
  popd
}

command -v atom >/dev/null 2>&1 && {
  echo "Atom already installed"
} || {
  echo "Installing Atom"
  sudo snap install --classic atom
}

command -v psql >/dev/null 2>&1 && {
  echo "PostgreSQL already installed"
} || {
  echo "Installing PostgreSQL"
  sudo apt install -y postgresql-9.5
  sudo -u postgres createuser --superuser $USER
  sudo -u postgres createdb $USER
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
  wget -O playerctl.deb "https://github.com/acrisci/playerctl/releases/download/v0.5.0/playerctl-0.5.0_amd64.deb"
  sudo dpkg -i playerctl.deb
  rm playerctl.deb
  popd
}

echo "Fixing Nautilus desktop setting"
gsettings set org.gnome.desktop.background show-desktop-icons false

echo "Cleaning up"
sudo apt autoremove -y

echo "DONE!"
