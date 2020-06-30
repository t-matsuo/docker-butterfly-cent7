From tmatsuo/centos:7

RUN yum install -y python2-pip.noarch python-tornado.x86_64 supervisor && \
    pip install butterfly
RUN echo -e "## CentOS 7 Web Console ##\n\n" > /etc/motd && \
    sed -i "s/nodaemon=false/nodaemon=true/g" /etc/supervisord.conf

COPY ./docker-entrypoint.sh /
COPY ./butterfly.ini /etc/supervisord.d/

ENTRYPOINT ["/docker-entrypoint.sh"]
