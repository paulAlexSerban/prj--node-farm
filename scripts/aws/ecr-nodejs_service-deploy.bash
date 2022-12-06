#!/bin/bash
# makes sure the folder containing the script will be the root folder
cd "$(dirname "$0")" || exit
source ../.env.dev

echo "AWS Region: $AWS_REGION"
echo "AWS Account id: $AWS_ACCOUNT_ID"
echo "AWS ECR Repository name: $ECR_REPO_NAME"

echo "Create AWS Repository"
(aws ecr create-repository --repository-name $ECR_REPO_NAME) || true

echo "Login Docker to AWS ECR"
docker login -u AWS -p $(aws ecr get-login-password --region $AWS_REGION) $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

echo "Build Docker for AWS ECR repository"
docker build --file ../../backend/nodejs_service/nodejs_service.Dockerfile ../../backend/nodejs_service -t $ECR_REPO_NAME:\latest --build-arg NODE_ENV=production

echo "Tag Latest Dcoker container"
docker tag $ECR_REPO_NAME:\latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:\latest

echo "Push Docker container to AWS ECR $ECR_REPO_NAME"
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:\latest

echo "Get package verision"
PACKAGE_VERSION=$(node --eval="process.stdout.write(require('../package.json').version)")

echo "Add version $PACKAGE_VERSION tag to Docker container"
MANIFEST=$(aws ecr batch-get-image --repository-name $ECR_REPO_NAME --image-ids imageTag=latest --output json | jq --raw-output --join-output '.images[0].imageManifest')

echo "Put the image manifest to Amazon ECR with a new tag"
aws ecr put-image --repository-name $ECR_REPO_NAME --image-tag $PACKAGE_VERSION --image-manifest "$MANIFEST"
