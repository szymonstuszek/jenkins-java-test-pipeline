#!/bin/bash

echo "*************************"
echo "*******Building jar******"
echo "*************************"

WORKSPACE=/home/ec2-user/jenkins-data/jenkins_home/workspace/java-pipeline-test

docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
