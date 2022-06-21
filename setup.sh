#!/bin/bash

sudo apt update
sudo apt upgrade -y

# * installing git, curl, wget, python3 and ssh
sudo apt install git curl wget python3 openssh-client


# ---------------------------------------------------------------------------
# * setting nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# * installing node.js 16.x using nvm
nvm install 16

# ---------------------------------------------------------------------------

# * installing vscode
sudo snap install code --classic

# * installing postman, slack, zoom, dbeaver
sudo snap install postman slack zoom-client dbeaver-ce


# -----------------------------------------------------------------------------------------------------------------
# * Jenkkins setup
# For more details https://www.digitalocean.com/community/tutorials/how-to-install-jenkins-on-ubuntu-22-04

# Installing Jenkins'
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key |sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

sudo apt update

sudo apt install jenkins

# Starting Jenkins
sudo systemctl start jenkins.service

sudo systemctl status jenkins

# -------------------------------------------------------------------------------------------------------------

# ---------------------------
# installing postgresql
# for more details -> https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-20-04

sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service


# -------------------------------
# running mongo cli setup
chmod +x mongo-setup.sh
./mongo-setup.sh
# -------------------------------