FROM centos:centos6
MAINTAINER koby "kobyahron@gmail.com"

RUN yum -y update && yum -y groupinstall 'Development Tools' && yum -y install \
    # kernel-devel \
    # ImageMagick-devel \
    bzip2-devel \
    libcurl \
    libcurl-devel \
    openssl-devel \
    # libevent-devel \
    # libffi-devel \
    # glib2-devel \
    # libjpeg-devel \
    # mysql-devel \
    # postgresql-devel \
    # ncurses-devel \
    # readline \
    # readline-devel \
    # sqlite-devel \
    openssl \
    # libxml2-devel \
    # libxslt-devel \
    # zlib-devel \
    wget \
    tar \
    && yum clean all

# RUN rpm --import http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6 \
#     && rpm -Kih http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
#     && yum -y install libyaml-devel \
#     && yum clean all

# RUN yum -y update && yum install -y \
#     bzr \
#     mercurial \
#     && yum clean all

# RUN yum -y update && yum install -y \
#     tar \
#     && yum clean all

# Install influxdb
ENV INFLUXDB_VERSION 1.3.7
RUN wget --verbose https://repos.influxdata.com/rhel/6/x86_64/stable/influxdb-${INFLUXDB_VERSION}.x86_64.rpm -O /tmp/influxdb.rpm \
    && rpm -Uvh /tmp/influxdb.rpm

EXPOSE 8086

# ADD influxdb.repo /etc/yum.repos.d/influxdb.repo
# RUN yum install -y -v --debuglevel=10 influxdb \
#     && yum clean all
COPY influxdb.conf /etc/influxdb/influxdb.conf

VOLUME /var/lib/influxdb

COPY entrypoint.sh /entrypoint.sh
COPY init-influxdb.sh /init-influxdb.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["influxd"]
