#!/bin/bash
set -e

echo "[PostScript] Starting deploy steps..." >> /home/ec2-user/deploy/deploy.log

DEPLOY_DIR="/home/ec2-user/deploy"
BACKEND_JAR="$DEPLOY_DIR/backend-0.0.1-SNAPSHOT.jar"

# Stop any previous backend
echo "[PostScript] Stopping previous backend..." >> /home/ec2-user/deploy/deploy.log
pkill -f "backend-0.0.1-SNAPSHOT.jar" || true

# Start Spring Boot backend
echo "[PostScript] Starting backend..." >> /home/ec2-user/deploy/deploy.log
nohup java -jar "$BACKEND_JAR" > "$DEPLOY_DIR/backend.log" 2>&1 &

echo "[PostScript] Backend launched." >> /home/ec2-user/deploy/deploy.log
