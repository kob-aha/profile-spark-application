#!/bin/bash

FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $FOLDER/env.sh

docker run --rm --link=$SERVER_NAME:influxdb -it influxdb:${VERSION} influx -host influxdb
