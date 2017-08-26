FROM debian:jessie
MAINTAINER Koby Aharon "kobyahron@gmail.com"

# Python
RUN apt-get update \
 && apt-get install -y curl unzip perl wget build-essential \
    python3 python3-dev python3-setuptools \
 && ln -s /usr/bin/python3 /usr/bin/python \
 && easy_install3 pip py4j \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Install Other dependencies
RUN pip -q install --user influxdb blist \
 && wget -qc https://github.com/etsy/statsd-jvm-profiler/releases/download/2.1.0/statsd-jvm-profiler-2.1.0-jar-with-dependencies.jar \
 && ln -sf statsd-jvm-profiler-2.1.0-jar-with-dependencies.jar statsd-jvm-profiler.jar \
 && wget -qc https://raw.githubusercontent.com/aviemzur/statsd-jvm-profiler/master/visualization/influxdb_dump.py \
 && wget -qc https://raw.githubusercontent.com/brendangregg/FlameGraph/master/flamegraph.pl

# JAVA
ARG JAVA_MAJOR_VERSION=8
ARG JAVA_UPDATE_VERSION=131
ARG JAVA_BUILD_NUMBER=11
ENV JAVA_HOME /usr/jdk1.${JAVA_MAJOR_VERSION}.0_${JAVA_UPDATE_VERSION}

ENV PATH $PATH:$JAVA_HOME/bin
RUN curl -sL --retry 3 --insecure \
  --header "Cookie: oraclelicense=accept-securebackup-cookie;" \
  "http://download.oracle.com/otn-pub/java/jdk/${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-b${JAVA_BUILD_NUMBER}/d54c1d3a095b4ff2b6607d096fa80163/server-jre-${JAVA_MAJOR_VERSION}u${JAVA_UPDATE_VERSION}-linux-x64.tar.gz" \
  | gunzip \
  | tar x -C /usr/ \
  && ln -s $JAVA_HOME /usr/java \
  && rm -rf $JAVA_HOME/man

# Spark

ARG HADOOP_VERSION=2.7
ARG SPARK_VERSION=2.0.0
ARG SPARK_ARCHIVE=http://d3kbcqa49mib13.cloudfront.net/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
ENV SPARK_HOME /usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}

RUN curl -s ${SPARK_ARCHIVE} | tar -xz -C /usr/local/
RUN cp /usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/bin/spark-shell /usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/bin/spark-shell-orig
COPY spark-shell-flamegraph /usr/local/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}/bin/spark-shell
COPY lorem-ipsum.txt /tmp/lorem-ipsum.txt
ENV PATH $PATH:${SPARK_HOME}/bin

WORKDIR $SPARK_HOME
