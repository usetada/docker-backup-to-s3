#!/bin/sh

set -x

if [ -z "$IMAGE_REPOSITORY" ]; then
    echo "No IMAGE_REPOSITORY environment variable defined, exiting"
    exit 1
fi
REGION=${REGION:-ap-southeast-1}
IMAGE_NAME=${IMAGE_NAME:-mongodb-s3-backup}

aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $IMAGE_REPOSITORY
docker build -t $IMAGE_NAME .
docker tag $IMAGE_NAME:latest $IMAGE_REPOSITORY/$IMAGE_NAME:latest
docker push $IMAGE_REPOSITORY/$IMAGE_NAME:latest

