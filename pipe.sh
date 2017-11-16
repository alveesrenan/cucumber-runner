#!/bin/sh
sh build.sh
if [ $? != 0 ]; then
  exit $?
fi

sh test.sh
if [ $? != 0 ]; then
  exit $?
fi

sh push.sh
if [ $? != 0 ]; then
  exit $?
fi