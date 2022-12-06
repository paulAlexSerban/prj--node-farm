#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🟢 RUN DOCKER 🐳  NodeJS Service Image"
docker run -p 3000:3000 --name nodejs_service -d paulserbandev/nodejs_service
docker ps