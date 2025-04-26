#!/bin/bash
pkill -f 'java -jar' || true
cd /home/ec2-user/app
nohup java -jar backend-0.0.1-SNAPSHOT.jar > app.log 2>&1 &
