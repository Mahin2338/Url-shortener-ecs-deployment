
#!/bin/bash

# Set variables

export AWS_REGION=eu-west-2
export AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
export ECR_REPO=$AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/url-shortener

# Build

docker build -t url-shortener:v2 .

# Authenticate

aws ecr get-login-password --region $AWS_REGION | \
docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

# Tag

docker tag url-shortener:latest $ECR_REPO:v2

# Push

docker push $ECR_REPO:v2

echo "Image pushed to: $ECR_REPO:v2"