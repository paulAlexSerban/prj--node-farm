#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🟢 BUILD DOCKER 🐳  NodeJS Service Image"
docker build --file ../../../backend/nodejs_service/nodejs_service.Dockerfile ../../../backend/nodejs_service -t paulserbandev/nodejs_service --build-arg NODE_ENV=production
docker image ls
