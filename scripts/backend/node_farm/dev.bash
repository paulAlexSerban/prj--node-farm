#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "GET assets"
rm -rfv ../../../backend/node_farm/public/*
cp -rfv ../../../assets/dist/* ../../../backend/node_farm/public
echo "DEVELOP Node Farm"
npm --prefix ../../../backend/node_farm run dev