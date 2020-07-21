#!/bin/bash

USERNAME=$USERNAME

echo "***************************"
echo "***************************"
echo "****Pushing the image******"
echo "***************************"
echo "***************************"
echo "***************************"

IMAGE="maven-project"

echo "***************************"
echo "***************************"
echo "********Loggin in**********"
echo "***************************"
echo "***************************"
echo "***************************"

docker login -u $USERNAME -p $PASS

echo "***************************"
echo "***************************"
echo "****Tagging the image******"
echo "***************************"
echo "***************************"
echo "***************************"

docker tag $IMAGE:$BUILD_TAG $USERNAME/$IMAGE:$BUILD_TAG

echo "***************************"
echo "***************************"
echo "****Pushing the image******"
echo "***************************"
echo "***************************"
echo "***************************"

docker push $USERNAME/$IMAGE:$BUILD_TAG
