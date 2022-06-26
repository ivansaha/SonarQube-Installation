#!/bin/bash

#Author: Ivan Saha
#Date: 6/26/22

#Description: This script will help to automatically install sonarqube in the system

echo "You Must be a regular user before executing this script"
sleep 2

sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y
cd /opt
sudo yum install wget unzip firewalld -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
sudo unzip /opt/sonarqube-9.3.0.51899.zip
cd sonarqube-9.3.0.51899/bin/linux-x86-64
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
./sonar.sh start
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload

echo "Connect to the SonarQube server through the browser. It uses port 9000."

echo "http://<your-ip-address>:9000"

echo "Here are the default credentials for access:"

echo "Login: admin"

echo "Password: admin"
