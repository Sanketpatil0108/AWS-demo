#!/bin/bash

# Stop any existing containers (if needed)
docker stop frontend || true
docker stop backend || true
docker rm frontend || true
docker rm backend || true

# Build Docker images (if needed)
docker build -t frontend /home/ec2-user/deploy/frontend/
docker build -t backend /home/ec2-user/deploy/backend/

# Run the containers in detached mode
docker run -d --name frontend -p 80:80 frontend
docker run -d --name backend -p 8080:8080 backend

# Optionally, log output
echo "Frontend and Backend containers are now running."
