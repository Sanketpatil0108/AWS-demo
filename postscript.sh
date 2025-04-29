#!/bin/bash
set -e

echo "[PostScript] Starting deploy steps..." >> /home/ec2-user/deploy/deploy.log

# Paths
DEPLOY_DIR="/home/ec2-user/deploy"
BACKEND_JAR="$DEPLOY_DIR/backend/target/app.jar"
FRONTEND_BUILD_DIR="$DEPLOY_DIR/frontend/build"

# Stop any previous backend
echo "[PostScript] Stopping previous backend..." >> /home/ec2-user/deploy/deploy.log
pkill -f "app.jar" || true

# Start Spring Boot backend
echo "[PostScript] Starting backend..." >> /home/ec2-user/deploy/deploy.log
nohup java -jar "$BACKEND_JAR" > "$DEPLOY_DIR/backend.log" 2>&1 &

# Serve React frontend via Apache (default on Amazon Linux)
echo "[PostScript] Deploying frontend to Apache..." >> /home/ec2-user/deploy/deploy.log
sudo cp -r "$FRONTEND_BUILD_DIR"/* /var/www/html/

echo "[PostScript] Post-deploy actions complete." >> /home/ec2-user/deploy/deploy.log
