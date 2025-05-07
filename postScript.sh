#!/bin/bash

# Pull Docker images
docker pull 309071121886.dkr.ecr.us-east-1.amazonaws.com/backend:latest
docker pull 309071121886.dkr.ecr.us-east-1.amazonaws.com/frontend:latest

# Run backend container
docker run -d -p 8080:8080 309071121886.dkr.ecr.us-east-1.amazonaws.com/backend:latest

# Run frontend container (Nginx will serve the React app)
docker run -d -p 80:80 309071121886.dkr.ecr.us-east-1.amazonaws.com/frontend:latest
