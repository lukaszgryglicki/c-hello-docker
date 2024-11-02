#!/bin/bash

# examnple architectures: arm-linux-gnueabi, aarch64-linux-gnu, riscv64-unknown-elf
if [ -z "${USR}" ]
then
  USR=lukaszgryglicki
fi

if [ -z "${1}" ]
then
  echo "$0: you need to specify arch, for example: 'aarch64-linux-gnu', 'arm-linux-gnueabi', 'riscv64-unknown-elf'"
  exit 1
fi
arch="${1}"
IMAGE="${USR}/c-hello-docker:${arch}"

cp ./Dockerfile.template "./Dockerfile.${arch}" | exit 2
function cleanup {
  echo "cleanup ${arch}"
  rm -f "./Dockerfile.${arch}"
}
trap cleanup EXIT

sed -i "s/{{arch}}/${arch}/g" "./Dockerfile.${arch}"
# docker build --squash -f "./Dockerfile.${arch}" -t "${IMAGE}" . && docker image ls | grep "${IMAGE}" && docker push "${IMAGE}"
docker build -f "./Dockerfile.${arch}" -t "${IMAGE}" . && docker image ls | grep "${IMAGE}" && docker push "${IMAGE}"
