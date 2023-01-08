#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit

echo "GET assets"
rm -rfv ../../../backend/node_farm/public/*
rm ../../../backend/node_farm/data.json
rm -rfv ../../../backend/node_farm/pages/*
cp ../../../backend/database/dev/data.json ../../../backend/node_farm/dist/
cp -rfv ../../../frontend/living-style-guide/source/pages/*.css ../../../backend/node_farm/public
cp -rfv ../../../assets/dist/* ../../../backend/node_farm/dist/public
cp -rfv ../../../frontend/node_farm/source/pages/*.html ../../../backend/node_farm/dist/pages
echo "DEVELOP Node Farm"
npm --prefix ../../../backend/node_farm run dev