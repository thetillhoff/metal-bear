#!/bin/bash

sudo apt install -y software-properties-common apt-transport-https curl
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt update
sudo apt install -y code
mkdir -p ~/.config/Code/User
if [ ! -f ~/.config/Code/User/settings.json ]; then
  printf "%s\n" \
  "{" \
  "\"git.autofetch\":true," \
  "\"keyboard.dispatch\":\"keyCode\"," \
  "\"workbench.startupEditor\":\"newUntitledFile\"," \
  "\"editor.wordWrap\":\"on\"" \
  "}" \
  > ~/.config/Code/User/settings.json
fi

code --install-extension alefragnani.project-manager
