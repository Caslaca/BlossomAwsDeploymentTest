#!/bin/bash

# Variables
AWS_REGION="your-aws-region" # e.g., us-west-2
ECR_REPOSITORY="your-ecr-repository" # e.g., your-repo-name
IMAGE_TAG="latest" # or any other tag you prefer
SERVICE_NAME="your-service-name" # e.g., test-api, test-app

# Get the AWS account ID
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)

# Login to AWS ECR
aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

cd $SERVICE_NAME
# Build the Docker image
docker build -t $ECR_REPOSITORY:$IMAGE_TAG .

# Tag the Docker image
docker tag $ECR_REPOSITORY:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG

# Push the Docker image to AWS ECR
docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG

echo "Docker image pushed to ECR: $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPOSITORY:$IMAGE_TAG"