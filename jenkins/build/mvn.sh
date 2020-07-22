#!/bin/bash

echo "*************************"
echo "*******Building jar******"
echo "*************************"

WORKSPACE=/home/ec2-user/jenkins-data/jenkins_home/workspace/java-pipeline-test

echo "$WORKSPACE1"
echo "$JOB_NAME"

CURRENT_WORKSPACE=$WORKSPACE1$JOB_NAME

echo "current workspace: $CURRENT_WORKSPACE"
docker run --rm -v $CURRENT_WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
