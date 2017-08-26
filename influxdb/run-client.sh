#!/bin/bash

docker run --rm --link=influxdb -it influxdb influx -host influxdb
