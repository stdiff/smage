#!/usr/bin/env bash

## TODO: parametrization of the image name by BUILD_NUMBER

REPOSITORY=smage
IMAGE_NAME=py37ml1
REGION=eu-central-1
ACCOUNT_ID=050266116122

docker build . -t ${REPOSITORY}:${IMAGE_NAME} -t ${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${REPOSITORY}:${IMAGE_NAME}