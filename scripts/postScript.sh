#!/bin/bash

# Change to the deployment directory
cd /home/ec2-user/deploy || exit 1

# ---- BACKEND ----
cd backend || exit 1
chmod +x mvnw
./mvnw clean package -DskipTests

# Kill old process (optional)
pkill -f 'java -jar' || true

# Run backend in background
nohup java -jar target/*.jar > backend.log 2>&1 &

# ---- FRONTEND ----
cd ../frontend || exit 1
npm install
npm run build
