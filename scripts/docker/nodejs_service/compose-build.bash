#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🟢  START 🐳  NodeJS Service conatiner "
docker compose --env-file ../../../.env.config \
  --file ../../../docker/nodejs_service.dev.docker-compose.yaml up --detach --build
bash compose-test.bash