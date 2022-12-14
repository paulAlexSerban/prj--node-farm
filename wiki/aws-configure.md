# AWS Configure

- RUN `aws configure`

- NOTES:
  - you will be asked for "AWS Access Key ID" and "AWS Secret Access Key"

## Deploy to AWS
- make sure you have or create a AWS VPC
- install AWS CLS and configure it with your AWS credentials
- add the required data in `.env.dev`
- if you have previously deployed to AWS ECR - re-tag the image
  - run `bash scripts/ecr-node_farm-remove-latest-tag.bash`
- deploy your current/latest image to AWS ECR
  - RUN `bash scripts/ecr-node_farm-deploy.bash` to deploy your current image

## Read More
- https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html