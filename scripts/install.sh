#!/bin/bash
cd /home/ec2-user/app/frontend
npm install
npm run build

cd /home/ec2-user/app/backend
./mvnw clean package -DskipTests
