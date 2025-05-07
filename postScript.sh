#!/bin/bash
cd /home/ec2-user/deploy

echo "Stopping existing containers..."
docker-compose down

echo "Removing old images..."
docker system prune -af

echo "Starting containers..."
docker-compose up -d
