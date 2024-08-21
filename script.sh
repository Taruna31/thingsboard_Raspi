#!/bin/bash

# Update and upgrade the system
sudo apt update
sudo apt upgrade -y

# Install dependencies
sudo apt install -y wget openjdk-17-jdk

# Verify Java installation
java -version

# Download and install ThingsBoard
wget https://github.com/thingsboard/thingsboard/releases/download/v3.7/thingsboard-3.7.deb
sudo dpkg -i thingsboard-3.7.deb

# Add PostgreSQL repository and install PostgreSQL
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
echo "deb https://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" | sudo tee /etc/apt/sources.list.d/pgdg.list
sudo apt update
sudo apt -y install postgresql

# Start PostgreSQL service
sudo service postgresql start
