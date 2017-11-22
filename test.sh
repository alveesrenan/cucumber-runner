#!/bin/sh
REGISTRY=registry.atech.com.br
IMAGE=cucumber-runner
VOLUME=`pwd`/test:/cucumber/

VERSION=latest
if ! [ -z $2 ]; then # ./test
  VERSION=$2
fi

TAG=${REGISTRY}/${IMAGE}:${VERSION}

echo "Runnning tag ${TAG}"

if [ -z $2 ]; then # ./test
  echo "Running headless chromium"
  docker run --rm \
    -v ${VOLUME} \
    --user=`id -u $USER` \
    --name=cucumber-test ${TAG}
  EXIT_CODE=$?
else # ./test --display
  echo "Running chromium with display ${DISPLAY}"
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
