#!/bin/bash --login

host=$(hostname -i || echo '127.0.0.1');
path="${MOUNT_PATH:-}";
port="${PORT:-80}";

CURL_OPTS=(
  -s
  -o /dev/null
  -w '%{http_code}'
  -A 'Internal Healthcheck'
);

http_code=$(curl "${CURL_OPTS[@]}" "http://${host}:${port}${path}/");
result=$?;

if [[ $result -eq 0 && $http_code -eq 200 ]]; then
  echo '[HEALTHCHECK] Webserver up and accepting connections.';
  exit 0;
fi

echo '[HEALTHCHECK] Webserver not healthy.';
exit 1;
