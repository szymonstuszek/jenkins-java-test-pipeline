#!/bin/bash

echo "*************************"
echo "*******Building jar******"
echo "*************************"

docker run --rm -v $CURRENT_WORKSPACE/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine "$@"
