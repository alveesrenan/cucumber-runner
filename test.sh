#!/bin/bash
volume=`pwd`/test:/cucumber/
image_name=cucumber
container_name=cucumber-test
exist_container=`docker ps -a | grep $container_name | awk '{print $NF}'`

if ! [ -z $exist_container ]; then
    echo 'Deleting container...'
    docker rm $container_name
else
    echo 'Do not exclude container because there is no'
fi

docker run -v $volume -i -t -e lock=true --name $container_name $image_name

docker_exit_code=`expr $?`

if [[ $docker_exit_code != 0 ]]; then
  echo
  echo "[ERROR] Tests failed!"
  exit $?
fi