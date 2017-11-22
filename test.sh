#!/bin/sh
REGISTRY=registry.atech.com.br
IMAGE=cucumber-runner
VERSION=2.4
TAG=${REGISTRY}/${IMAGE}:${VERSION}

VOLUME=`pwd`/test:/cucumber/

if [ -z $1 ]; then # ./test
  docker run --rm \
    -v ${VOLUME} \
    --user=`id -u $USER` \
    --name=cucumber-test ${TAG}
  EXIT_CODE=$?
else # ./test --display
  docker run --rm \
    -e DISPLAY=$DISPLAY -e LOCK=false \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v ${VOLUME} \
    --user=`id -u $USER` \
    --name=cucumber-test ${TAG}
  EXIT_CODE=$?
fi

if [ ${EXIT_CODE} != 0 ]; then
  echo
  echo "[ERROR] Tests failed!"
  exit 1
fi
