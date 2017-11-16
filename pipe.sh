#!/bin/sh
sh build.sh
if [ $? != 0 ]; then
  echo '####################'
  echo 'Error to build image'
  echo '####################'
  exit $?
fi

sh test.sh
if [ $? != 0 ]; then
  echo '####################'
  echo 'Error to test image'
  echo '####################'
  exit $?
fi

sh push.sh
if [ $? != 0 ]; then
  echo '####################'
  echo 'Error to push image'
  echo '####################'
  exit $?
fi