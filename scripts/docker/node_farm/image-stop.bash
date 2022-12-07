#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🟢 STOP DOCKER 🐳  NodeJS Service Container"
docker stop node_farm
docker ps