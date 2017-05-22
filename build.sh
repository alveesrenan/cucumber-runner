#!/bin/bash
image_name=cucumber
docker build -t $image_name .

if [[ $? != 0 ]]; then
  echo
  echo "[ERROR] Image was not builded!"
  exit $?
fi