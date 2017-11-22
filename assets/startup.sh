#!/bin/bash
CUCUMBER_OPTIONS=$*

bundle install --gemfile=test/Gemfile --path ${BUNDLE_INSTALL_PATH:=vendor/bundle}

EXIT_CODE=$?

if [ ${EXIT_CODE} != 0 ]; then
  echo 'Error during bundle install'
  if ! [ -z ${LOCK} ]; then
    if [ ${LOCK} == true ]; then
      tail -f /dev/null
    else
      exit ${EXIT_CODE}
    fi
  fi
fi

cucumber ${CUCUMBER_OPTIONS}
EXIT_CODE=$?

# LOCK container just using for test
if ! [ -z ${LOCK} ]; then
  if [ ${LOCK} == true ]; then
    tail -f /dev/null
  else
    exit ${EXIT_CODE}
  fi
fi

exit ${EXIT_CODE}
