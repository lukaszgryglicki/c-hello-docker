#!/bin/bash
if [ -z "${USR}" ]
then
  USR=lukaszgryglicki
fi
IMAGE="${USR}/c-hello-docker"
docker build -f ./Dockerfile -t "${IMAGE}" . && docker image ls | grep "${IMAGE}" && docker push "${IMAGE}"
