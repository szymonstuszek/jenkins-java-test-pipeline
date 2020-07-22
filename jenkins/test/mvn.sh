#!/bin/bash

echo "*************************"
echo "*******Running tests*****"
echo "*************************"


docker run --rm -v $CURRENT_WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
