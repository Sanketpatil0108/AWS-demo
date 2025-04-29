#!/bin/bash
set -e

echo "[PostScript] Starting deploy steps..." >> /home/ec2-user/deploy/deploy.log

DEPLOY_DIR="/home/ec2-user/deploy"
BACKEND_JAR="$DEPLOY_DIR/backend-0.0.1-SNAPSHOT.jar"
LOG_FILE="$DEPLOY_DIR/deploy.log"

# Stop any previous backend
echo "[PostScript] Stopping previous backend..." >> "$LOG_FILE"
pkill -f "java -jar" || true

# Wait a few seconds to ensure the old process is fully stopped
sleep 3

# Start new Spring Boot backend
echo "[PostScript] Starting backend with JAR: $BACKEND_JAR..." >> "$LOG_FILE"
nohup java -jar "$BACKEND_JAR" > "$DEPLOY_DIR/backend.log" 2>&1 &

# Verify if the backend started successfully
if ps aux | grep -v grep | grep "java -jar" > /dev/null; then
    echo "[PostScript] Backend launched successfully!" >> "$LOG_FILE"
else
    echo "[PostScript] Backend failed to start. Please check the logs." >> "$LOG_FILE"
    exit 1
fi

# Optional: Output the backend process for verification
echo "[PostScript] Current backend process:" >> "$LOG_FILE"
ps aux | grep java >> "$LOG_FILE"
