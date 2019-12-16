FROM centos:6.7
MAINTAINER xubowen "xbw@ecfun.cc"

RUN yum update -y glibc-common

RUN rpm --rebuilddb && yum install -y sudo tar perl

RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

RUN (rpm --rebuilddb && yum -y install java-1.8.0-openjdk.x86_64)

RUN (rpm --rebuilddb && yum -y install redis)

ADD mpush.tar /root/
ADD redis.conf /etc/redis.conf
COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh
EXPOSE 9999
CMD /root/start.sh
