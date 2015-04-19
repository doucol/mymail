FROM ubuntu:14.04
MAINTAINER Doug Collier <doug@doucol.me>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y \
    postfix \
    dovecot-pop3d \
    mailutils \
    supervisor

#RUN sed -i -re"s/#submission inet n(\ )+-(\ )+-(\ )+-(\ )+-(\ )+smtpd/submission inet n       -       -       -       -       smtpd/g" /etc/postfix/master.cf
RUN echo my2me.com >/etc/hostname
RUN echo 127.0.0.1 localhost my2me.com >/etc/hosts
RUN postconf -e 'myhostname = my2me.com'
RUN postconf -e 'mydestination = $myhostname, localhost, localhost.localdomain'
RUN postconf -e 'mynetworks = 127.0.0.0/8'

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 25
EXPOSE 995

CMD ["/usr/bin/supervisord"]
