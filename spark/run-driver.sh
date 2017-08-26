FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MASTER_CONTAINER_NAME=spark_spark-master_1
MASTER_PORT=7077

docker run --rm -it -p 8088:8088 -p 8042:8042 -p 4041:4040 \
  -v $FOLDER/graph:/tmp/graph \
  --link ${MASTER_CONTAINER_NAME}:spark-master --link influxdb \
  --name driver -h driver spark:2.0.0 \
  spark-shell --master spark://spark-master:${MASTER_PORT}
