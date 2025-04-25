#!/bin/bash
cd /home/ec2-user/app

# Install Node.js (for React)
curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
sudo yum install -y nodejs

# Install Java (for Spring Boot)
sudo yum install java-17-openjdk -y

# Install dependencies
cd frontend
npm install
cd ../backend
mvn install -DskipTests
