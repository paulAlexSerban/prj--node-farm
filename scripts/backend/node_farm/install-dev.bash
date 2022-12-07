#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "🛑  Cleaning Backend - Node Farm node_modules"
rm -rfv ../../../backend/node_farm/node_modules

echo "🔧  DEV Install Backend - Node Farm"
npm --prefix ../../../backend/node_farm install
