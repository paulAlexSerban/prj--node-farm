#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo " 🛑  🐳  STOP NodeJS containers"
docker compose --env-file ../../../.env \
  --file ../../../docker/node_farm.dev.docker-compose.yaml \
  down --volumes --rmi all