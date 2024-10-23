#!/bin/bash
IMAGE="lukaszgryglicki/c-hello-docker"
docker build -f ./Dockerfile -t "${IMAGE}" . && docker image ls | grep "${IMAGE}"
