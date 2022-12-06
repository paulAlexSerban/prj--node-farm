#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit
source ../../.env.dev

echo "Get the image manifest for the image to retag and write it to a file"
MANIFEST=$(aws ecr batch-get-image --repository-name $ECR_REPO_NAME --image-ids imageTag=latest --output json | jq --raw-output --join-output '.images[0].imageManifest')

echo "Get package verision"
PACKAGE_VERSION=$(node --eval="process.stdout.write(require('../package.json').version)")

echo "Putput the image manifest to Amazon ECR with a new tag"
aws ecr put-image --repository-name $ECR_REPO_NAME --image-tag $PACKAGE_VERSION --image-manifest "$MANIFEST"

echo "Verify new image tag is attached to your image"
aws ecr describe-images --repository-name $ECR_REPO_NAME

echo "Remove latest tag"
aws ecr batch-delete-image --repository-name $ECR_REPO_NAME --image-ids imageTag=latest