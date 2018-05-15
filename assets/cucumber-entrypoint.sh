#!/bin/bash
OPTIONS=$*

echo 'Installing gem dependencies for project.'
bundle install --path ${BUNDLE_INSTALL_PATH:=vendor/bundle}

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

echo 'Running cucmber features'
cucumber ${OPTIONS}
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
