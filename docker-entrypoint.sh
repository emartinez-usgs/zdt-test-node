#!/bin/bash --login

pushd $(dirname $0) > /dev/null 2>&1;

_term () {
  echo 'Caught SIGTERM';
  kill -TERM "${child}";
}

trap _term SIGTERM;

node ./server.js &

child=$!;
wait "${child}";

popd > /dev/null 2>&1;
exit 0;
