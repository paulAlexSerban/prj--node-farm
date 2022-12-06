#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit
source ../../.env.dev

echo "Remove latest tag"
aws ecr batch-delete-image --repository-name $ECR_REPO_NAME --image-ids imageTag=latest