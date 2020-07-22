#!/bin/bash
echo "***************************"
echo "********Loggin in**********"
echo "***************************"

docker login -u $USERNAME -p $PASS

echo "***************************"
echo "****Tagging the image******"
echo "***************************"

docker tag $IMAGE:$BUILD_TAG $USERNAME/$IMAGE:$BUILD_TAG

echo "***************************"
echo "****Pushing the image******"
echo "***************************"

docker push $USERNAME/$IMAGE:$BUILD_TAG
