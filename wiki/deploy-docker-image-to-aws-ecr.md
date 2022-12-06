# Deploy Docker Image to AWS ECR (Elastic Container Registry)

- Install AWS CLI from https://aws.amazon.com/cli/
- set environmental variables used to push to AWS ECR
  - RUN `export AWS_REGION=your-aws-region`
  - RUN `export AWS_ACCOUNT_ID=your-account-id`
  - RUN `export ECR_REPO_NAME=traefik-aws-ecr-repo-name`
- create AWS ECR repository

  - RUN `(aws ecr create-repository --repository-name $ECR_REPO_NAME) || true`

- check if AWS ECR password is available

  - RUN `eval $(aws ecr get-login-password --region $AWS_REGION)`

- login Docker in AWS ECR

  - RUN `docker login -u AWS -p $(aws ecr get-login-password --region $AWS_REGION) $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com`

- build Docker for AWS ECR repository

  - RUN `docker build -t $ECR_REPO_NAME:\latest .`
  - RUN `docker tag $ECR_REPO_NAME:\latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:\latest`

- push the Docker image
  - RUN `docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO_NAME:\latest`

## Read more

- https://github.com/netbears/traefik-cluster-ecs
- https://dev.to/anilmaurya/traefik-v2-with-lets-encrypt-on-amazon-s-elastic-container-service-ecs-1h4h
- https://blog.joshsoftware.com/2020/08/24/traefik-v2-with-lets-encrypt-on-amazons-elastic-container-service-ecs/
- https://medium.datadriveninvestor.com/configurate-route-53-and-adding-ssl-certificate-145d8a317d91