#!/bin/bash

FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $FOLDER/env.sh

echo "Creating database and user"

curl -sS -X POST localhost:$DB_PORT/query --data-urlencode "q=CREATE DATABASE profiler" >/dev/null
curl -sS -X POST localhost:$DB_PORT/query --data-urlencode "q=CREATE USER profiler WITH PASSWORD 'profiler' WITH ALL PRIVILEGES" >/dev/null
