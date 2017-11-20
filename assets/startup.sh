#!/bin/bash
CUCUMBER_OPTIONS=$1

bundle install --path ${BUNDLE_INSTALL_PATH:=vendor/bundle}
exit_code=$?

if ! [ -z ${lock} ]; then
  if [ ${lock} == true ]; then
      tail -f /dev/null
  else
    exit ${exit_code}
  fi
fi

cucumber ${CUCUMBER_OPTIONS}
exit_code=$?

# lock container just using for test
if ! [ -z ${lock} ]; then
  if [ ${lock} == true ]; then
      tail -f /dev/null
  else
    exit ${exit_code}
  fi
fi
