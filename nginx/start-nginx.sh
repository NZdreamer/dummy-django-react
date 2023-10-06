#!/bin/sh

# Host and port of the frontend service
host=frontend
port=3000

echo "Waiting for ${host}:${port}..."

while ! nc -z ${host} ${port}; do
  sleep 0.1
done

echo "${host}:${port} is available. Starting Nginx..."

exec nginx -g "daemon off;" &

# Keep the container running indefinitely
tail -f /dev/null
