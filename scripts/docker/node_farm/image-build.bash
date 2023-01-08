#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🟢 BUILD DOCKER 🐳  NodeJS Service Image"
docker build --file ../../../backend/node_farm/node_farm.Dockerfile ../../../backend/node_farm -t paulserbandev/node_farm --build-arg NODE_ENV=production
docker image ls
