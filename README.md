# Docker Image for Sagemaker

![build badge](https://codebuild.eu-central-1.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiTmpsUDYzdVBQSElBSTl4bTI4TWxZSk8wNXI0QmNUTjRITTVDb0JoZC9vUit1eGI5MGRFL3ZTNEVkMFozRVhlMFhlTEg1OW1odFEyYWlNMzVYc0l4R09RPSIsIml2UGFyYW1ldGVyU3BlYyI6IlB6VVVOaVVCbUNNTzVnN0IiLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=main)

The aim of this repository is to provide a custom Docker image for SageMaker Training Job.

## Setup

1. Create an ECR repository at first
2. Create a build project on CodeBuild console. 
    - Do not forget to check "Privileged" under "Environment" section.
3. Attach the built image to SageMaker Domain. (If you want to use this image on SageMaker Studio.)

### Environment variable

Define the following environment variables on CodeBuild console.

- `AWS_DEFAULT_REGION`: e.g. eu-central-1
- `AWS_ACCOUNT_ID`: your account ID. You can copy it on the AWS console. (Click your account name.)
- `ECR_REPOSITORY_NAME`: Repository name in ECR

### Policy

The IAM role of the CodeBuild project needs a privilege to push a built Docker image to your ECR repository.
Add the following policy to the role after replacing `AWS_ACCOUNT_ID` with your AWS account ID.

    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "VisualEditor0",
                "Effect": "Allow",
                "Action": [
                    "ecr:CompleteLayerUpload",
                    "ecr:UploadLayerPart",
                    "ecr:InitiateLayerUpload",
                    "ecr:BatchCheckLayerAvailability",
                    "ecr:PutImage"
                ],
                "Resource": "arn:aws:ecr:*:AWS_ACCOUNT_ID:repository/*"
            },
            {
                "Sid": "VisualEditor1",
                "Effect": "Allow",
                "Action": "ecr:GetAuthorizationToken",
                "Resource": "*"
            }
        ]
    }

## TODO 

- GPU