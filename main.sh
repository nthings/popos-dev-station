#!/bin/bash
#  ___|)________________________________________________________
# |___/____________________________|___________________________||
# |__/|_______/|____/|_____/|______|___________________________||
# |_/(|,\____/_|___/_|____/_|______|___________________________||
# |_\_|_/___|__|__|__|___|__|___|__|___________________________||
# |   |     | ()  | ()   | ()   |  |                           ||
# | (_|   -()-  -()-   -()-   -()- | -()-  -()-  -()-   -()-   ||
# |________________________________|__|__()_|__()_|__()__|_____||
# |__/___\_._______________________|__|__|__|__|__|__|___|_____||
# |__\___|_._______________________|___\_|___\_|___\_|___|_____||
# |_____/__________________________|____\|____\|____\|_________||
# |____/___________________________|___________________________||

# Update packages
sudo apt -y update
sudo apt -y upgrade
# Install vscode
sudo apt -y install software-properties-common apt-transport-https wget
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt -y update
sudo apt -y install code
# Install nvm and install latest nodejs
sudo apt -y install curl
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install stable
nvm use stable
# Install brave browser
curl https://brave-browser-apt-release.s3.brave.com/brave-core.asc| gpg --dearmor > /tmp/brave-core.gpg
sudo install -o root -g root -m 644 /tmp/brave-core.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt -y update
sudo apt -y install brave-browser
# Monitor tool
sudo apt -y install lm-sensors
sudo sensors-detect --auto
sudo apt -y install psensor
# Install GitHub cli    
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt -y update
sudo apt -y install gh
