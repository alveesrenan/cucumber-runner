#!/bin/bash
gem install bundler
if [[ $? != 0 ]]; then
  exit $?
fi

bundle install --path vendor/bundle
if [[ $? != 0 ]]; then
  exit $?
fi

cucumber
exit_code=$?

if ! [ -z $lock ]; then
  if [ $lock == true ]; then
      tail -f /dev/null
  else
    exit $exit_code
  fi
fi

