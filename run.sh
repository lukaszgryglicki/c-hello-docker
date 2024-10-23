#!/bin/bash
if [ -z "${USR}" ]
then
  USR=lukaszgryglicki
fi
IMAGE="${USR}/c-hello-docker"
docker run -it "${IMAGE}"
