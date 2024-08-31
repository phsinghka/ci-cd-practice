#!/bin/bash

# Update and upgrade the system packages
echo "Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Java (OpenJDK 17)
echo "Installing Java..."
sudo apt install -y fontconfig openjdk-17-jre

# Add Jenkins repository and key
echo "Adding Jenkins repository and key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list after adding Jenkins repository
echo "Updating package list..."
sudo apt-get update -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt-get install -y jenkins

# Enable Jenkins to start on boot
echo "Enabling Jenkins to start on boot..."
sudo systemctl enable jenkins

# Start Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins

# Check Jenkins service status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins

# Display initial Jenkins admin password
echo "Retrieving initial Jenkins admin password..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "Jenkins setup complete. Please access Jenkins via your web browser."
echo "Use the above password to unlock Jenkins on first access."

