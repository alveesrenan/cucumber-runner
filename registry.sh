#!/bin/sh
sh build.sh
if [ $? != 0 ]; then
  echo '####################'
  echo 'Error to build image'
  echo '####################'
  exit 1
fi

sh push.sh
if [ $? != 0 ]; then
  echo '####################'
  echo 'Error to push image'
  echo '####################'
  exit 1
fi