#!/bin/sh
registry=registry.atech.com.br
image=cucumber
tag=${registry}/${image}

volume=`pwd`/test:/cucumber/
container=cucumber-test
exist_container=`docker ps -a | grep $container | awk '{print $NF}'`

if ! [ -z ${exist_container} ]; then
    echo 'Deleting container...'
    docker rm ${container}
else
    echo 'Do not exclude container because there is no'
fi

docker run -v ${volume} -i -t -e lock=false --name ${container} ${tag}
docker_exit_code=`expr $?`

if [[ ${docker_exit_code} != 0 ]]; then
  echo
  echo "[ERROR] Tests failed!"
  exit ${docker_exit_code}
fi