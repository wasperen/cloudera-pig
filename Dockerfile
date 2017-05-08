FROM centos:7

RUN yum -y update

ENV CDH_VER 5.7.0

COPY cloudera-cdh-${CDH_VER}.repo /etc/yum.repos.d

RUN yum -y install \
      java-1.8.0-openjdk \
      ant \
      subversion \
      hadoop

RUN cd /tmp \
    && svn co http://svn.apache.org/repos/asf/pig/branches/branch-0.15/ \
    && cd branch-0.15 \
    && ant -Dhadoopversion=23

RUN mv /tmp/branch-0.15 /opt/pig-0.15

VOLUME /opt/pig-0.15


ENTRYPOINT /bin/bash