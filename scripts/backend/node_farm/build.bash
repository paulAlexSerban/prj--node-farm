#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "BUILD Node Farm"
npm --prefix ../../../backend/node_farm run build