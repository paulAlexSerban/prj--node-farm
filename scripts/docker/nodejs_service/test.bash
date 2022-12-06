#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🧪 TEST DOCKER 🐳  NodeJS Service Container"
bash ../../../docker/test/check-docker-container.bash nodejs_service
docker ps
