FROM ubuntu:14.04
MAINTAINER Doug Collier <doug@doucol.me>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    postfix \
    dovecot-common \ 
    dovecot-pop3d \
    mailutils \
    supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
