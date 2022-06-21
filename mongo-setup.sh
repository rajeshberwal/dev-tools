#!/usr/bin/bash

sudo apt-get install gnupg

# Import the public key used by the package management system
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# Create a list file for your edition of MongoDB
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list

# Reload the local package database
sudo apt-get update

# Install the MongoDB CLI
sudo apt-get install -y mongocli

#  Verify your installation
mongocli help


# -----------------------------------------------------------------
# setting mongodb compass

# download the MongoDB compass .deb file
wget https://downloads.mongodb.com/compass/mongodb-compass_1.28.1_amd64.deb

# Install the .deb file
sudo apt install ./mongodb-compass_1.28.1_amd64.deb

# -----------------------------------------------------------------