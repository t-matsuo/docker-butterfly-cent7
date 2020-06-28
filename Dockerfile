From tmatsuo/centos:7

RUN yum install -y python2-pip.noarch python-tornado.x86_64 && pip install butterfly
RUN echo -e "## CentOS 7 Web Console ##\n\n" > /etc/motd
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
