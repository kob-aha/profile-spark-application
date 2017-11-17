FROM centos:centos6
MAINTAINER koby "kobyahron@gmail.com"

RUN yum -y update && yum -y groupinstall 'Development Tools' && yum -y install \
    bzip2-devel \
    libcurl \
    libcurl-devel \
    openssl-devel \
    openssl \
    wget \
    tar \
    && yum clean all

# Install influxdb
ENV INFLUXDB_VERSION 1.3.7
RUN wget --verbose https://repos.influxdata.com/rhel/6/x86_64/stable/influxdb-${INFLUXDB_VERSION}.x86_64.rpm -O /tmp/influxdb.rpm \
    && rpm -Uvh /tmp/influxdb.rpm

EXPOSE 8086

COPY influxdb.conf /etc/influxdb/influxdb.conf

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
COPY init-influxdb.sh /init-influxdb.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]