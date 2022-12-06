# NodeJS-Basic-Vanilla-Server

## Deploy to AWS
- make sure you have or create a AWS VPC
- install AWS CLS and configure it with your AWS credentials
- add the required data in `.env.dev`
- if you have previously deployed to AWS ECR - re-tag the image
  - run `bash scripts/ecr-nodejs_service-remove-latest-tag.bash`
- deploy your current/latest image to AWS ECR
  - RUN `bash scripts/ecr-nodejs_service-deploy.bash` to deploy your current image