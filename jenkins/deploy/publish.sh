#!/bin/bash

export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export USERNAME=$(sed -n '3p' /tmp/.auth)
export PASS=$(sed -n '4p' /tmp/.auth)

docker login -u $USERNAME -p $PASS
cd ~/deployments && docker-compose up -d
