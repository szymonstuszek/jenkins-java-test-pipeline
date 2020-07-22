#!/bin/bash

echo maven-project > /tmp/.auth
echo $BUILD_TAG >> /tmp/.auth
echo $USERNAME >> /tmp/.auth

scp -i /opt/prod /tmp/.auth  $DEPLOYMENT_USER@$ADDRESS:/tmp/.auth
scp -i /opt/prod ./jenkins/deploy/publish.sh $DEPLOYMENT_USER@$ADDRESS:/tmp/publish
ssh -i /opt/prod $DEPLOYMENT_USER@$ADDRESS "/tmp/publish"
