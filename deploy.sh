#!/bin/bash
cd /home/ec2-user
pkill -f 'java -jar' || true
nohup java -jar myapp.jar > app.log 2>&1 &
