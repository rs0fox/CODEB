#!/bin/bash

# Exit on error
set -e

# Retrieve Docker Hub credentials from Secrets Manager
echo "Retrieving Docker Hub credentials from Secrets Manager..."
DOCKER_CREDS=$(aws secretsmanager get-secret-value --secret-id arn:aws:secretsmanager:ap-south-1:339712721384:secret:dockerhublogin-4vcmMW --query SecretString --output text)
DOCKER_USERNAME=$(echo $DOCKER_CREDS | jq -r .username)
DOCKER_PASSWORD=$(echo $DOCKER_CREDS | jq -r .password)

# Log in to Docker Hub
echo "Logging in to Docker Hub..."
echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin

# Build the Docker image
echo "Building the Docker image..."
docker build -t webapp .

# Tag and push the Docker image
echo "Pushing the Docker image..."
docker tag webapp:latest $DOCKER_USERNAME/webapp:latest
docker push $DOCKER_USERNAME/webapp:latest

echo "Build and push completed."
