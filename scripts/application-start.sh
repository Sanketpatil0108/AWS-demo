#!/bin/bash
cd /home/ec2-user/app

# Build React app
echo "Building React app..."
cd frontend
npm run build

# Build Spring Boot app
echo "Building Spring Boot app..."
cd ../backend
mvn package -DskipTests

# Start Spring Boot app
echo "Starting Spring Boot app..."
nohup java -jar backend/target/*.jar > springboot.log 2>&1 &
