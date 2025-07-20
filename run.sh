#!/bin/bash
set -e

./install.sh

echo "Checking container status..."
if docker ps | grep -q feedback-api-container; then
  echo "API server is running in Docker at http://localhost:8000"
  echo "You can now POST to /feedback."
else
  echo "Failed to start the API container. Check Docker logs for more information."
fi
