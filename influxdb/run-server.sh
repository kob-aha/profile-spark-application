#!/bin/bash

FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $FOLDER/env.sh

# Make sure data folder exists
mkdir -p $FOLDER/data

echo "Starting database"

docker run --name=influxdb --rm -d -p $DB_PORT:8086 \
      -v $FOLDER/data:/var/lib/influxdb \
      --name ${SERVER_NAME} \
      influxdb:$VERSION 

#$FOLDER/create-database.sh

