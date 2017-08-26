#!/bin/bash

FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VERSION=1.3.4
DB_PORT=8860

docker pull influxdb:${VERSION}

# Make sure data folder exists
mkdir -p $FOLDER/data

echo "Starting database"

docker run --name=influxdb --rm -d -p $DB_PORT:8086 \
      -v $FOLDER/data:/var/lib/influxdb \
      influxdb:$VERSION

echo "Creating database and user"

curl -sS -X POST localhost:$DB_PORT/query --data-urlencode "q=CREATE DATABASE profiler" >/dev/null
curl -sS -X POST localhost:$DB_PORT/query --data-urlencode "q=CREATE USER profiler WITH PASSWORD 'profiler' WITH ALL PRIVILEGES" >/dev/null


