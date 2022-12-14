#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🟢 RUN DOCKER 🐳  NodeJS Service Image"
docker run -p 3000:3000 --name node_farm -d paulserbandev/node_farm
docker ps