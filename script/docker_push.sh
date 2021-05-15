#!/usr/bin/env bash

REPOSITORY=smage
IMAGE_NAME=py37ml2
REGION=eu-central-1
ACCOUNT_ID=050266116122
REPOSITORY_URI=${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPOSITORY}

aws --region ${REGION} ecr get-login-password | docker login --username AWS --password-stdin ${REPOSITORY_URI}
docker push ${REPOSITORY_URI}:${IMAGE_NAME}