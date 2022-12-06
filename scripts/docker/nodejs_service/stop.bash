#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🟢 STOP DOCKER 🐳  NodeJS Service Container"
docker stop nodejs_service
docker ps