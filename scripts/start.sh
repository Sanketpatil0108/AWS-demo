#!/bin/bash
cd /home/ec2-user/app/backend
nohup java -jar target/*.jar &

cd /home/ec2-user/app/frontend
serve -s build -l 3000 &
