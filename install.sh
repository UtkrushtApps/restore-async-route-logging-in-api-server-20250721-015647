#!/bin/bash
set -e

if ! command -v docker &> /dev/null; then
  echo "Docker is not installed. Please install Docker."
  exit 1
fi

echo "Building Docker image 'feedback-api:latest'..."
docker build -t feedback-api:latest .

CONTAINER_ID=$(docker ps -aqf "name=feedback-api-container")

if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping existing container..."
  docker stop feedback-api-container > /dev/null
  docker rm feedback-api-container > /dev/null
fi

echo "Starting Docker container 'feedback-api-container'..."
docker run -d --name feedback-api-container -p 8000:8000 feedback-api:latest

echo "Setup complete. The API should be running at http://localhost:8000"
