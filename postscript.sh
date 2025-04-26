#!/bin/bash

echo "=== Running Post Deployment Script ==="

# Start Spring Boot app
echo "Starting Spring Boot backend..."
cd /home/ec2-user/deploy/backend/target
nohup java -jar demo.jar > /home/ec2-user/backend.log 2>&1 &

# Copy frontend files to Apache web server
echo "Deploying frontend..."
sudo cp -r /home/ec2-user/deploy/frontend/build/* /var/www/html/

echo "Post deployment steps completed!"
