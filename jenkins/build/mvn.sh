#!/bin/bash

echo "*************************"
echo "*******Building jar******"
echo "*************************"

WORKSPACE=/home/ec2-user/jenkins-data/jenkins_home/workspace/java-pipeline-test

echo "current directory: $PWD"
docker run --rm -v ./java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
