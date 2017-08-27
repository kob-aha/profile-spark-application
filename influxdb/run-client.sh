#!/bin/bash

SERVER_HOSTNAME=spark_influxdb_1

docker run --rm --link=$SERVER_HOSTNAME:influxdb -it influxdb:1.3.4 influx -host influxdb
