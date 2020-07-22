#!/bin/bash

echo "*************************"
echo "*******Building jar******"
echo "*************************"

#WORKSPACE=/home/ec2-user/jenkins-data/jenkins_home/workspace/java-pipeline-test
CURRENT_DIR=$PWD
echo "current directory: $PWD"
echo "current directory: $CURRENT_DIR"
docker run --rm -v $CURRENT_DIR/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
