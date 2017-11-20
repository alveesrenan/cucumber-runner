#!/bin/sh
registry=registry.atech.com.br
image=cucumber-runner
tag=${registry}/${image}

volume=`pwd`/test:/cucumber/
container=cucumber-runner

docker run -v ${volume} -e lock=false --rm ${tag}
docker_exit_code=`expr $?`

if [ ${docker_exit_code} != 0 ]; then
  echo
  echo "[ERROR] Tests failed!"
  exit 1
fi
