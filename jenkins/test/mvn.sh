#!/bin/bash

echo "*************************"
echo "*******Running tests*****"
echo "*************************"

WORKSPACE=/home/ec2-user/jenkins-data/jenkins_home/workspace/java-test-pipeline

docker run --rm -v $WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
