#!/bin/sh
registry=registry.atech.com.br
image=cucumber
tag=${registry}/${image}

docker build -t $tag .

if [ $? != 0 ]; then
  echo
  echo "[ERROR] Image was not builded!"
  exit $?
fi