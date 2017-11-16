#!/bin/sh
./build.sh
if [ $? != 0 ]; then
  exit $?
fi

./test.sh
if [ $? != 0 ]; then
  exit $?
fi

./push.sh
if [ $? != 0 ]; then
  exit $?
fi